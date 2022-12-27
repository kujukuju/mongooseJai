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

mg_async_ws_server :: struct {
    mgr: mg_mgr;
    thread: Thread;
    poll_lock: Semaphore;
    continue_lock: Semaphore;
    // swap_lock: Mutex;
    data_buffer: [..] u8;
    packets_data_entry: [..] mg_async_ws_data_entry;
    data_buffer_back: [..] u8;
    packets_back_data_entry: [..] mg_async_ws_data_entry;
    connections: Table(u64, *mg_connection);
    // return data
    packets: [..] mg_async_ws_packet;
    ids: [..] u64;
}

mg_async_ws_data_entry :: struct {
    id: u64;
    offset: s32;
    length: s32;
}

mg_async_ws_packet :: struct {
    id: u64;
    data: *u8;
    length: int;
}

mg_async_ws_server_create :: (port: u32) -> *mg_async_ws_server {
    server := New(mg_async_ws_server);
    // init(*server.swap_lock);
    init(*server.poll_lock);
    init(*server.continue_lock);
    array_reserve(*server.data_buffer, 1024 * 1024);
    array_reserve(*server.packets_data_entry, 1024);
    array_reserve(*server.data_buffer_back, 1024 * 1024);
    array_reserve(*server.packets_back_data_entry, 1024);
    array_reserve(*server.packets, 1024);
    array_reserve(*server.ids, 64);

    array_add_bytes :: (array: *[..] u8, to_append: [] u8) {
        // returns the next power of 2 >= the current number
        next_power_of_two :: inline (v: int) -> int {
            result: s64 = ---;
            v -= 1;
            // count leading zeros
            #asm {
                lzcnt result, v;
            }
            return 1 << (64 - result);
        }

        old_count := array.count;
        append_count := to_append.count;

        array_reserve(array, next_power_of_two(old_count + append_count));
        memcpy(array.data + old_count, to_append.data, append_count);
        array.count += append_count;
    }

    mg_async_ws_callback :: (conn: *mg_connection, ev: s32, ev_data: *void, fn_data: *void) #c_call {
        push_context mg_context {
            server := cast(*mg_async_ws_server) fn_data;
            
            if ev == {
                case MG_EV_CLOSE;
                    table_remove(*server.connections, conn.id);

                case MG_EV_HTTP_MSG;
                    hm := cast(*mg_http_message) ev_data;
                    mg_ws_upgrade(conn, hm, null);

                    table_set(*server.connections, conn.id, conn);

                case MG_EV_WS_MSG;
                    wm := cast(*mg_ws_message) ev_data;
                    wm_bytes: [] u8 = ---;
                    wm_bytes.data = xx wm.data.ptr;
                    wm_bytes.count = xx wm.data.len;

                    entry: mg_async_ws_data_entry = ---;
                    entry.id = conn.id;
                    entry.offset = xx server.data_buffer.count;
                    entry.length = xx wm_bytes.count;

                    print("Receiving bytes at time %\n", get_unix_time());

                    array_add_bytes(*server.data_buffer, wm_bytes);
                    array_add(*server.packets_data_entry, entry);
            }
        }
    }

    url := sprint("http://localhost:%", port);
    defer free(url);
    url_c := to_c_string(url);
    defer free(url_c);

    mg_mgr_init(*server.mgr);
    mg_http_listen(*server.mgr, url_c, mg_async_ws_callback, server);

    return server;
}

mg_async_ws_server_start :: (server: *mg_async_ws_server) {
    TEMPORARY_STORAGE_SIZE: s32 : 16384;

    thread_callback :: (thread: *Thread) -> s64 {
        server := cast(*mg_async_ws_server) thread.data;

        while true {
            // lock(*server.swap_lock);
            // wait_for(*server.poll_lock);
            // lock(*server.swap_lock);

            mg_mgr_poll(*server.mgr, 0);
            // unlock(*server.swap_lock);
            // signal(*server.continue_lock);

            // unlock(*server.swap_lock);
        }

        return 0;
    }

    server.thread.data = server;

    thread_init(*server.thread, thread_callback, TEMPORARY_STORAGE_SIZE, null);
    thread_start(*server.thread);
}

mg_async_ws_server_get_packets :: (server: *mg_async_ws_server) -> [] mg_async_ws_packet {
    lock(*server.swap_lock);

    server.data_buffer.data, server.data_buffer_back.data = swap(server.data_buffer.data, server.data_buffer_back.data);
    server.packets_data_entry.data, server.packets_back_data_entry.data = swap(server.packets_data_entry.data, server.packets_back_data_entry.data);

    server.data_buffer_back.count = server.data_buffer.count;
    server.packets_back_data_entry.count = server.packets_data_entry.count;

    server.data_buffer.count = 0;
    server.packets_data_entry.count = 0;
    
    unlock(*server.swap_lock);

    pointer := server.data_buffer_back.data;
    server.packets.count = 0;

    for entry: server.packets_back_data_entry {
        packet: mg_async_ws_packet = ---;
        packet.id = entry.id;
        packet.data = pointer + entry.offset;
        packet.length = entry.length;

        array_add(*server.packets, packet);
    }

    return server.packets;
}

mg_async_ws_server_get_connections :: (server: *mg_async_ws_server) -> [] u64 {
    lock(*server.swap_lock);

    server.ids.count = 0;
    for entry: server.connections.entries {
        array_add(*server.ids, entry.key);
    }

    unlock(*server.swap_lock);

    return server.ids;
}

mg_async_ws_server_send :: (server: *mg_async_ws_server, id: u64, bytes: [] u8) {
    conn, found := table_find(*table_server.connections, id);
    if !found {
        return;
    }

    if !conn.is_websocket {
        print("It's not a websocekt! This is a necessary check.\n");
        return;
    }

    mg_ws_send(conn, bytes.data, xx bytes.count, WEBSOCKET_OP_BINARY);
}

#scope_file

// TODO this is debug code
get_unix_time :: () -> u64 {
    #if OS == .WINDOWS {
        #import "Windows";

        filetime: FILETIME;
        GetSystemTimePreciseAsFileTime(*filetime);

        UNIX_TIME_START: u64 : 0x019DB1DED53E8000;
        TICKS_PER_SECOND: u64 : 10000000;

        li: LARGE_INTEGER;
        li.LowPart  = ft.dwLowDateTime;
        li.HighPart = ft.dwHighDateTime;

        return (li.QuadPart - UNIX_TIME_START) / TICKS_PER_SECOND;
    } else if OS == .LINUX {
        #import "POSIX";

        t: timespec;
        clock_gettime(CLOCK_REALTIME, *t);
        micros: s64 = t.tv_sec * 1000000;
        /* Add full microseconds */
        micros += t.tv_nsec / 1000;

        return cast(u64) micros / 1000;
    } else {
        return 0;
    }
}

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

// mg_ws_callback :: (conn: *mg_connection, ev: s32, ev_data: *void, fn_data: *void) #c_call {
//     push_context mg_context {
//         if ev == {
//             case MG_EV_HTTP_MSG;
//                 hm := cast(*mg_http_message) ev_data;
//                 mg_ws_upgrade(conn, hm, null);

//             case MG_EV_WS_MSG;
//                 wm := cast(*mg_ws_message) ev_data;
//                 mg_ws_send(conn, wm.data.ptr, wm.data.len, WEBSOCKET_OP_TEXT);
//         }
//     }
// }

#import "Math";
#import "Basic";
#import "Thread";
#import "Hash_Table";