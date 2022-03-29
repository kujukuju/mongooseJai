HELPERS :: true;

MG_MAX_HTTP_HEADERS :: 40;

MG_EV_ERROR :: 0;
MG_EV_OPEN :: 1;
MG_EV_POLL :: 2;
MG_EV_RESOLVE :: 3;
MG_EV_CONNECT :: 4;
MG_EV_ACCEPT :: 5;
MG_EV_READ :: 6;
MG_EV_WRITE :: 7;
MG_EV_CLOSE :: 8;
MG_EV_HTTP_MSG :: 9;
MG_EV_HTTP_CHUNK :: 10;
MG_EV_WS_OPEN :: 11;
MG_EV_WS_MSG :: 12;
MG_EV_WS_CTL :: 13;
MG_EV_MQTT_CMD :: 14;
MG_EV_MQTT_MSG :: 15;
MG_EV_MQTT_OPEN :: 16;
MG_EV_SNTP_TIME :: 17;
MG_EV_USER :: 18;

mg_mgr :: struct {
    conns: *mg_connection;
    dns4: mg_dns;
    dns6: mg_dns;
    dnstimeout: s32;
    nextid: u64;
    userdata: *void;
}

mg_connection :: struct {
    next: *mg_connection;
    mgr: *mg_mgr;
    loc: mg_addr;
    rem: mg_addr;
    fd: *void;
    id: u64;
    recv: mg_iobuf;
    send: mg_iobuf;
    fn: mg_event_handler_t;
    fn_data: *void;
    pfn: mg_event_handler_t;
    pfn_data: *void;
    label: [50] u8;
    tls: *void;
    is_listening: u32 = 1;
    is_client: u32 = 1;
    is_accepted: u32 = 1;
    is_resolving: u32 = 1;
    is_connecting: u32 = 1;
    is_tls: u32 = 1;
    is_tls_hs: u32 = 1;
    is_udp: u32 = 1;
    is_websocket: u32 = 1;
    is_hexdumping: u32 = 1;
    is_draining: u32 = 1;
    is_closing: u32 = 1;
    is_readable: u32 = 1;
    is_writable: u32 = 1;
}

mg_http_message :: struct {
    method: mg_str;
    uri: mg_str;
    query: mg_str;
    proto: mg_str;
    headers: [MG_MAX_HTTP_HEADERS] mg_http_header;
    body: mg_str;
    head: mg_str;
    chunk: mg_str;
    message: mg_str;
}

mg_http_serve_opts :: struct {
    root_dir: *u8;
    ssi_pattern: *u8;
    extra_headers: *u8;
    mime_types: *u8;
    fs: *mg_fs;
}

mg_str :: struct {
    ptr: *u8;
    len: u64;
}

mg_tls_opts :: struct {
    ca: *u8;
    crl: *u8;
    cert: *u8;
    certkey: *u8;
    ciphers: *u8;
    srvname: mg_str;
    fs: *mg_fs;
}

mg_dns :: struct {
    url: *u8;
    c: *mg_connection;
}

mg_addr :: struct {
    port: u16;
    ip: u32;
    ip6: [16] u8;
    is_ip6: bool;
}

mg_iobuf :: struct {
    buf: *u8;
    size: u64;
    len: u64;
}

mg_fs :: struct {
    st: #type (path: *u8, size: *u64, mtime: *u64) -> s32 #c_call;
    ls: #type (path: *u8, fn: #type (a: *u8, b: *void) -> void #c_call, b: *void) -> void #c_call;
    op: #type (path: *u8, flags: s32) -> void #c_call;
    cl: #type (fd: *void) -> void #c_call;
    rd: #type (fd: *void, buf: *void, len: u64) -> u64 #c_call;
    wr: #type (fd: *void, buf: *void, len: u64) -> u64 #c_call;
    sk: #type (fd: *void, offset: u64) -> u64 #c_call;
    mv: #type (from: *u8, to: *u8) -> bool #c_call;
    rm: #type (path: *u8) -> bool #c_call;
    mkd: #type (path: *u8) -> bool #c_call;
}

mg_http_header :: struct {
  name: mg_str;
  value: mg_str;
}

mg_http_part :: struct {
    name: mg_str;
    filename: mg_str;
    body: mg_str;
}

mg_event_handler_t :: #type (conn: *mg_connection, ev: s32, ev_data: *void, fn_data: *void) #c_call;

mg_log_set :: (spec: *u8) -> void #foreign mongoose;
mg_mgr_init :: (mgr: *mg_mgr) -> void #foreign mongoose;
mg_mgr_free :: (mgr: *mg_mgr) -> void #foreign mongoose;
mg_mgr_poll :: (mgr: *mg_mgr, ms: s32) -> void #foreign mongoose;
mg_http_listen :: (mgr: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;
mg_casecmp :: (s1: *u8, s2: *u8) -> s32 #foreign mongoose;
mg_http_serve_dir :: (conn: *mg_connection, hm: *mg_http_message, opts: *mg_http_serve_opts) -> void #foreign mongoose;
mg_http_serve_file :: (conn: *mg_connection, hm: *mg_http_message, path: *u8, opts: *mg_http_serve_opts) -> void #foreign mongoose;
mg_http_parse :: (s: *u8, len: u64, hm: *mg_http_message) -> s32 #foreign mongoose;
mg_http_get_header :: (hm: *mg_http_message, name: *u8) -> *mg_str #foreign mongoose;
mg_http_get_var :: (body: *mg_str, name: *u8, buf: *u8, buflen: u64) -> s32 #foreign mongoose;
mg_http_next_multipart :: (body: mg_str, ofs: u64, hp: *mg_http_part) -> u64 #foreign mongoose;
mg_tls_init :: (conn: *mg_connection, tls_opts: *mg_tls_opts) -> void #foreign mongoose;
mg_tls_free :: (conn: *mg_connection) -> void #foreign mongoose;
mg_http_match_uri :: (hm: *mg_http_message, glob: *u8) -> bool #foreign mongoose;
mg_http_reply :: (conn: *mg_connection, status_code: s32, headers: *u8, body_fmt: *u8, args: .. Any) -> void #foreign mongoose;
mg_str_s :: (s: *u8) -> mg_str #foreign mongoose;
mg_ncasecmp :: (s1: *u8, s2: *u8, len: u64) -> s32 #foreign mongoose;

#if HELPERS {
    #load "helpers.jai";
}

#scope_file

#if OS == .WINDOWS {
    mongoose :: #foreign_library "bin/win/mongoose";
} else #if OS == .LINUX {
    mongoose :: #foreign_library "bin/linux/libmongoose";
}