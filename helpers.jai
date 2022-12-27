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

mg_ws_server :: struct {
    mgr: mg_mgr;
    data_buffer: [..] u8;
    packets_data_entry: [..] mg_ws_server_data_entry;
    data_buffer_back: [..] u8;
    packets_back_data_entry: [..] mg_ws_server_data_entry;
    connections: Table(u64, *mg_connection);
    // return data
    packets: [..] mg_ws_server_packet;
    ids: [..] u64;
}

mg_ws_server_data_entry :: struct {
    id: u64;
    offset: s32;
    length: s32;
}

mg_ws_server_packet :: struct {
    id: u64;
    data: *u8;
    length: int;
}

mg_ws_server_create :: (port: u32) -> *mg_ws_server {
    mg_ws_callback :: (conn: *mg_connection, ev: s32, ev_data: *void, fn_data: *void) #c_call {
        push_context mg_context {
            server := cast(*mg_ws_server) fn_data;
            
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

                    entry: mg_ws_server_data_entry = ---;
                    entry.id = conn.id;
                    entry.offset = xx server.data_buffer.count;
                    entry.length = xx wm_bytes.count;

                    array_add_bytes(*server.data_buffer, wm_bytes);
                    array_add(*server.packets_data_entry, entry);
            }
        }
    }

    server := New(mg_ws_server);
    mg_mgr_init(*server.mgr);
    array_reserve(*server.data_buffer, 1024 * 1024);
    array_reserve(*server.packets_data_entry, 1024);
    array_reserve(*server.data_buffer_back, 1024 * 1024);
    array_reserve(*server.packets_back_data_entry, 1024);
    init(*server.connections);
    array_reserve(*server.packets, 1024);
    array_reserve(*server.ids, 64);

    url := sprint("http://localhost:%", port);
    defer free(url);
    url_c := to_c_string(url);
    defer free(url_c);

    mg_http_listen(*server.mgr, url_c, mg_ws_callback, server);

    return server;
}

mg_ws_server_get_packets :: (server: *mg_ws_server) -> [] mg_ws_server_packet {
    server.data_buffer.data, server.data_buffer_back.data = swap(server.data_buffer.data, server.data_buffer_back.data);
    server.packets_data_entry.data, server.packets_back_data_entry.data = swap(server.packets_data_entry.data, server.packets_back_data_entry.data);

    server.data_buffer_back.count = server.data_buffer.count;
    server.packets_back_data_entry.count = server.packets_data_entry.count;

    server.data_buffer.count = 0;
    server.packets_data_entry.count = 0;

    pointer := server.data_buffer_back.data;
    server.packets.count = 0;

    for entry: server.packets_back_data_entry {
        packet: mg_ws_server_packet = ---;
        packet.id = entry.id;
        packet.data = pointer + entry.offset;
        packet.length = entry.length;

        array_add(*server.packets, packet);
    }

    return server.packets;
}

mg_ws_server_get_connections :: (server: *mg_ws_server) -> [] u64 {
    server.ids.count = 0;
    for entry: server.connections.entries {
        array_add(*server.ids, entry.key);
    }

    return server.ids;
}

mg_ws_server_send :: (server: *mg_ws_server, id: u64, bytes: [] u8) {
    conn, found := table_find(*server.connections, id);
    if !found {
        return;
    }

    print("Is it a websocket? %\n", conn.is_websocket);

    mg_ws_send(conn, bytes.data, xx bytes.count, WEBSOCKET_OP_BINARY);
}

mg_ws_server_flush_and_poll :: (server: *mg_ws_server) {
    mg_mgr_poll(*server.mgr, 0);
}

mg_ws_server_free :: (server: *mg_ws_server) {
    array_free(server.ids);
    array_free(server.packets);
    uninit(*server.connections);
    array_free(server.packets_back_data_entry);
    array_free(server.data_buffer_back);
    array_free(server.packets_data_entry);
    array_free(server.data_buffer);
    mg_mgr_free(*server.mgr);
    free(server);
}

mg_ws_client :: struct {
    mgr: mg_mgr;
    connection: *mg_connection;
    connected: bool;
    data_buffer: [..] u8;
    packets_data_entry: [..] mg_ws_client_data_entry;
    data_buffer_back: [..] u8;
    packets_back_data_entry: [..] mg_ws_client_data_entry;
    // return data
    packets: [..] mg_ws_client_packet;
}

mg_ws_client_data_entry :: struct {
    id: u64;
    offset: s32;
    length: s32;
}

mg_ws_client_packet :: struct {
    id: u64;
    data: *u8;
    length: int;
}

mg_ws_client_create :: () -> *mg_ws_client {
    client := New(mg_ws_client);
    mg_mgr_init(*client.mgr);
    array_reserve(*client.data_buffer, 1024 * 1024);
    array_reserve(*client.packets_data_entry, 1024);
    array_reserve(*client.data_buffer_back, 1024 * 1024);
    array_reserve(*client.packets_back_data_entry, 1024);
    array_reserve(*client.packets, 1024);

    return client;
}

mg_ws_client_connect :: (client: *mg_ws_client, address: string) {
    mg_ws_callback :: (conn: *mg_connection, ev: s32, ev_data: *void, fn_data: *void) #c_call {
        push_context mg_context {
            client := cast(*mg_ws_client) fn_data;
            
            if ev == {
                case MG_EV_ERROR; #through;
                case MG_EV_CLOSE;
                    mg_ws_client_close(client);

                case MG_EV_WS_OPEN;
                    client.connected = true;

                case MG_EV_WS_MSG;
                    wm := cast(*mg_ws_message) ev_data;
                    wm_bytes: [] u8 = ---;
                    wm_bytes.data = xx wm.data.ptr;
                    wm_bytes.count = xx wm.data.len;

                    entry: mg_ws_client_data_entry = ---;
                    entry.id = conn.id;
                    entry.offset = xx client.data_buffer.count;
                    entry.length = xx wm_bytes.count;

                    array_add_bytes(*client.data_buffer, wm_bytes);
                    array_add(*client.packets_data_entry, entry);
            }
        }
    }

    url_c := to_c_string(address);
    defer free(url_c);

    mg_ws_client_close(client);
    client.connection = mg_ws_connect(*client.mgr, url_c, mg_ws_callback, client, null);
}

mg_ws_client_close :: (client: *mg_ws_client) {
    if !client.connection {
        return;
    }

    client.connection.is_closing = 1;
    
    client.connection = null;
    client.connected = false;
}

mg_ws_client_get_packets :: (client: *mg_ws_client) -> [] mg_ws_client_packet {
    client.data_buffer.data, client.data_buffer_back.data = swap(client.data_buffer.data, client.data_buffer_back.data);
    client.packets_data_entry.data, client.packets_back_data_entry.data = swap(client.packets_data_entry.data, client.packets_back_data_entry.data);

    client.data_buffer_back.count = client.data_buffer.count;
    client.packets_back_data_entry.count = client.packets_data_entry.count;

    client.data_buffer.count = 0;
    client.packets_data_entry.count = 0;

    pointer := client.data_buffer_back.data;
    client.packets.count = 0;

    for entry: client.packets_back_data_entry {
        packet: mg_ws_client_packet = ---;
        packet.id = entry.id;
        packet.data = pointer + entry.offset;
        packet.length = entry.length;

        array_add(*client.packets, packet);
    }

    return client.packets;
}

mg_ws_client_send :: (client: *mg_ws_client, bytes: [] u8) {
    if !client.connected {
        return;
    }

    mg_ws_send(client.connection, bytes.data, xx bytes.count, WEBSOCKET_OP_BINARY);
}

mg_ws_client_flush_and_poll :: (client: *mg_ws_client) {
    mg_mgr_poll(*client.mgr, 0);
}

mg_ws_client_free :: (client: *mg_ws_client) {
    mg_ws_client_close(client);
    array_free(client.ids);
    array_free(client.packets);
    array_free(client.packets_back_data_entry);
    array_free(client.data_buffer_back);
    array_free(client.packets_data_entry);
    array_free(client.data_buffer);
    mg_mgr_free(*client.mgr);
    free(client);
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

#import "Math";
#import "Basic";
#import "Thread";
#import "Hash_Table";