mg_endpoint_callback :: #type (conn: *mg_connection, hm: *mg_http_message);

mg_http_endpoint :: (path: *u8, cb: mg_endpoint_callback) {
    entry: EndpointEntry;
    entry.path = path;
    entry.cb = cb;

    array_add(*mg_endpoints, entry);
}

mg_http_endpoint_start :: (port: u32, interval: s32 = 50) {
    url := sprint("http://localhost:%", port);
    defer free(url);
    url_c := to_c_string(url);
    defer free(url_c);

    mgr: mg_mgr;
    mg_mgr_init(*mgr);
    mg_http_listen(*mgr, url_c, mg_callback, null);
    while true {
        mg_mgr_poll(*mgr, interval);
    }
    mg_mgr_free(*mgr);
}

mg_http_static_start :: (path: *u8, port: u32, interval: s32 = 50) {
    url := sprint("http://localhost:%", port);
    defer free(url);
    url_c := to_c_string(url);
    defer free(url_c);

    mgr: mg_mgr;
    mg_mgr_init(*mgr);
    mg_http_listen(*mgr, url_c, mg_static_callback, null);
    while true {
        mg_mgr_poll(*mgr, interval);
    }
    mg_mgr_free(*mgr);
}

// doesn't require freeing the result
mg_form_value :: (hm: *mg_http_message, key: *u8) -> bool, string {
    mg_key_str := mg_str_s(key);

    part: mg_http_part;
    ofs: u64 = mg_http_next_multipart(hm.body, 0, *part);
    while ofs > 0 {
        if mg_casestrcmp(part.name, mg_key_str) == 0 {
            result: string;
            result.data = part.body.ptr;
            result.count = xx part.body.len;
            return true, result;
        }

        ofs = mg_http_next_multipart(hm.body, ofs, *part);
    }

    return false, "";
}

mg_casestrcmp :: (str1: mg_str, str2: mg_str) -> int {
    if str1.len > str2.len {
        return 1;
    } else if str1.len < str2.len {
        return -1;
    }

    return mg_ncasecmp(str1.ptr, str2.ptr, str1.len);
}

#scope_file

EndpointEntry :: struct {
    path: *u8;
    cb: mg_endpoint_callback;
}

mg_endpoints: [..] EndpointEntry;

mg_context: Context;

mg_callback :: (conn: *mg_connection, ev: s32, ev_data: *void, fn_data: *void) #c_call {
    push_context mg_context {
        if ev == MG_EV_HTTP_MSG {
            hm := cast(*mg_http_message) ev_data;

            for entry: mg_endpoints {
                if mg_http_match_uri(hm, entry.path) {
                    entry.cb(conn, hm);

                    return;
                }
            }

            mg_http_reply(conn, 404, "", "%s", "Not found");
        }
    }
}

mg_static_callback :: (conn: *mg_connection, ev: s32, ev_data: *void, fn_data: *void) #c_call {
    push_context mg_context {
        if ev == MG_EV_HTTP_MSG {
            opts: mg_http_serve_opts = .{root_dir = "."};
            hm := cast(*mg_http_message) ev_data;

            mg_http_serve_dir(conn, hm, *opts);
        }
    }
}

#import "Basic";