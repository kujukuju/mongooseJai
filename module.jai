//
// This file was auto-generated using the following command:
//
// jai ./generate.jai
//



MG_VERSION :: "7.6";

MG_ARCH_CUSTOM :: 0;
MG_ARCH_UNIX :: 1;
MG_ARCH_WIN32 :: 2;
MG_ARCH_ESP32 :: 3;
MG_ARCH_ESP8266 :: 4;
MG_ARCH_FREERTOS_TCP :: 5;
MG_ARCH_FREERTOS_LWIP :: 6;
MG_ARCH_AZURERTOS :: 7;
MG_ARCH_RTX_LWIP :: 8;

MG_ARCH :: MG_ARCH_WIN32;

MG_ENABLE_DIRLIST :: 1;

MG_ENABLE_FATFS :: 0;

MG_FATFS_ROOT :: "/";

MG_FATFS_BSIZE :: 64;

MG_ENABLE_SOCKET :: 1;

MG_ENABLE_MBEDTLS :: 0;

MG_ENABLE_OPENSSL :: 0;

MG_ENABLE_CUSTOM_TLS :: 0;

MG_ENABLE_SSI :: 1;

MG_ENABLE_IPV6 :: 0;

MG_ENABLE_LOG :: 1;

MG_ENABLE_MD5 :: 0;

MG_ENABLE_WINSOCK :: 1;

MG_ENABLE_CUSTOM_RANDOM :: 0;

MG_ENABLE_PACKED_FS :: 0;

MG_IO_SIZE :: 2048;

MG_MAX_RECV_BUF_SIZE :: 3 * 1024 * 1024;

MG_MAX_HTTP_HEADERS :: 40;

MG_HTTP_INDEX :: "index.html";

MG_SOCK_LISTEN_BACKLOG_SIZE :: 128;

MG_ENABLE_FILE :: 1;

MG_TIMER_REPEAT :: 1;
MG_TIMER_RUN_NOW :: 2;

WEBSOCKET_OP_CONTINUE :: 0;
WEBSOCKET_OP_TEXT :: 1;
WEBSOCKET_OP_BINARY :: 2;
WEBSOCKET_OP_CLOSE :: 8;
WEBSOCKET_OP_PING :: 9;
WEBSOCKET_OP_PONG :: 10;

MQTT_CMD_CONNECT :: 1;
MQTT_CMD_CONNACK :: 2;
MQTT_CMD_PUBLISH :: 3;
MQTT_CMD_PUBACK :: 4;
MQTT_CMD_PUBREC :: 5;
MQTT_CMD_PUBREL :: 6;
MQTT_CMD_PUBCOMP :: 7;
MQTT_CMD_SUBSCRIBE :: 8;
MQTT_CMD_SUBACK :: 9;
MQTT_CMD_UNSUBSCRIBE :: 10;
MQTT_CMD_UNSUBACK :: 11;
MQTT_CMD_PINGREQ :: 12;
MQTT_CMD_PINGRESP :: 13;
MQTT_CMD_DISCONNECT :: 14;

MQTT_CLEAN_SESSION :: 0x02;
MQTT_HAS_WILL :: 0x04;
MQTT_WILL_RETAIN :: 0x20;
MQTT_HAS_PASSWORD :: 0x40;
MQTT_HAS_USER_NAME :: 0x80;

SNTP_INTERVAL_SEC :: 3600;
SNTP_TIME_OFFSET :: 2208988800;

MSG_NONBLOCKING :: 0;

MG_MAX_SSI_DEPTH :: 5;

mg_str :: struct {
    ptr: *u8; // Pointer to string data
    len: size_t; // String len
}

mg_str_s :: (s: *u8) -> mg_str #foreign mongoose;

mg_str_n :: (s: *u8, n: size_t) -> mg_str #foreign mongoose;

mg_lower :: (s: *u8) -> s32 #foreign mongoose;

mg_ncasecmp :: (s1: *u8, s2: *u8, len: size_t) -> s32 #foreign mongoose;

mg_casecmp :: (s1: *u8, s2: *u8) -> s32 #foreign mongoose;

mg_vcmp :: (s1: *mg_str, s2: *u8) -> s32 #foreign mongoose;

mg_vcasecmp :: (str1: *mg_str, str2: *u8) -> s32 #foreign mongoose;

mg_strcmp :: (str1: mg_str, str2: mg_str) -> s32 #foreign mongoose;

mg_strstrip :: (s: mg_str) -> mg_str #foreign mongoose;

mg_strdup :: (s: mg_str) -> mg_str #foreign mongoose;

mg_strstr :: (haystack: mg_str, needle: mg_str) -> *u8 #foreign mongoose;

mg_match :: (str: mg_str, pattern: mg_str, caps: *mg_str) -> bool #foreign mongoose;

mg_globmatch :: (pattern: *u8, plen: size_t, s: *u8, n: size_t) -> bool #foreign mongoose;

mg_commalist :: (s: *mg_str, k: *mg_str, v: *mg_str) -> bool #foreign mongoose;

mg_snprintf_CFormat :: (unknown0: *u8, unknown1: size_t, fmt: *u8, __args: ..Any) -> size_t #foreign mongoose "mg_snprintf";
mg_snprintf :: (unknown0: *u8, unknown1: size_t, fmt: string, __args: ..Any) -> size_t {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return mg_snprintf_CFormat(unknown0, unknown1, "%s", formatted_text.data);
} @PrintLike

mg_hexdump :: (buf: *void, len: size_t) -> *u8 #foreign mongoose;

mg_hex :: (buf: *void, len: size_t, dst: *u8) -> *u8 #foreign mongoose;

mg_unhex :: (buf: *u8, len: size_t, to: *u8) -> void #foreign mongoose;

mg_unhexn :: (s: *u8, len: size_t) -> u32 #foreign mongoose;

mg_asprintf_CFormat :: (unknown0: **u8, unknown1: size_t, fmt: *u8, __args: ..Any) -> size_t #foreign mongoose "mg_asprintf";
mg_asprintf :: (unknown0: **u8, unknown1: size_t, fmt: string, __args: ..Any) -> size_t {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return mg_asprintf_CFormat(unknown0, unknown1, "%s", formatted_text.data);
} @PrintLike

mg_check_ip_acl :: (acl: mg_str, remote_ip: u32) -> s32 #foreign mongoose;

mg_to64 :: (str: mg_str) -> s64 #foreign mongoose;

mg_lld :: (buf: *u8, val: s64, is_signed: bool, is_hex: bool) -> size_t #foreign mongoose;

MG_LL :: enum s32 {
    NONE    :: 0;
    ERROR   :: 1;
    INFO    :: 2;
    DEBUG   :: 3;
    VERBOSE :: 4;
    MG_LL_NONE    :: NONE;
    MG_LL_ERROR   :: ERROR;
    MG_LL_INFO    :: INFO;
    MG_LL_DEBUG   :: DEBUG;
    MG_LL_VERBOSE :: VERBOSE;
}

mg_log_CFormat :: (fmt: *u8, __args: ..Any) -> void #foreign mongoose "mg_log";
mg_log :: (fmt: string, __args: ..Any) {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    mg_log_CFormat("%s", formatted_text.data);
} @PrintLike

mg_log_prefix :: (ll: s32, file: *u8, line: s32, fname: *u8) -> bool #foreign mongoose;

mg_log_set :: (spec: *u8) -> void #foreign mongoose;

mg_log_set_callback :: (fn: #type (unknown0: *void, unknown1: size_t, unknown2: *void) -> void #c_call, param: *void) -> void #foreign mongoose;

mg_timer :: struct {
    period_ms: s64; // Timer period in milliseconds
    expire:    s64; // Expiration timestamp in milliseconds
    flags:     u32; // Possible flags values below

    fn:        #type (unknown0: *void) -> void #c_call; // Function to call
    arg:       *void; // Function argument
    next:      *mg_timer; // Linkage in g_timers list
}

g_timers: *mg_timer #elsewhere mongoose; // Global list of timers

mg_timer_init :: (unknown0: *mg_timer, unknown1: s64, unknown2: u32, unknown3: #type (unknown0: *void) -> void #c_call, unknown4: *void) -> void #foreign mongoose;

mg_timer_free :: (unknown0: *mg_timer) -> void #foreign mongoose;

mg_timer_poll :: (current_time_ms: s64) -> void #foreign mongoose;

MG_FS :: enum s32 {
    READ  :: 1;
    WRITE :: 2;
    DIR   :: 4;
    MG_FS_READ  :: READ;
    MG_FS_WRITE :: WRITE;
    MG_FS_DIR   :: DIR;
}

// Filesystem API functions
// st() returns MG_FS_* flags and populates file size and modification time
// ls() calls fn() for every directory entry, allowing to list a directory
//
// NOTE: UNIX-style shorthand names for the API functions are deliberately
// chosen to avoid conflicts with some libraries that make macros for e.g.
// stat(), write(), read() calls.
mg_fs :: struct {
    st:  #type (path: *u8, size: *size_t, mtime: *time_t) -> s32 #c_call; // stat file
    ls:  #type (path: *u8, fn: #type (unknown0: *u8, unknown1: *void) -> void #c_call, unknown0: *void) -> void #c_call;
    op:  #type (path: *u8, flags: s32) -> *void #c_call; // Open file
    cl:  #type (fd: *void) -> void #c_call; // Close file
    rd:  #type (fd: *void, buf: *void, len: size_t) -> size_t #c_call; // Read file
    wr:  #type (fd: *void, buf: *void, len: size_t) -> size_t #c_call; // Write file
    sk:  #type (fd: *void, offset: size_t) -> size_t #c_call; // Set file position
    mv:  #type (from: *u8, to: *u8) -> bool #c_call; // Rename file
    rm:  #type (path: *u8) -> bool #c_call; // Delete file
    mkd: #type (path: *u8) -> bool #c_call; // Create directory
}

mg_fs_posix: mg_fs #elsewhere mongoose; // POSIX open/close/read/write/seek
mg_fs_packed: mg_fs #elsewhere mongoose; // Packed FS, see examples/complete

// File descriptor
mg_fd :: struct {
    fd: *void;
    fs: *mg_fs;
}

mg_fs_open :: (fs: *mg_fs, path: *u8, flags: s32) -> *mg_fd #foreign mongoose;

mg_fs_close :: (fd: *mg_fd) -> void #foreign mongoose;

mg_file_read :: (fs: *mg_fs, path: *u8, size: *size_t) -> *u8 #foreign mongoose;

mg_file_write :: (fs: *mg_fs, path: *u8, unknown0: *void, unknown1: size_t) -> bool #foreign mongoose;

mg_file_printf_CFormat :: (fs: *mg_fs, path: *u8, fmt: *u8, __args: ..Any) -> bool #foreign mongoose "mg_file_printf";
mg_file_printf :: (fs: *mg_fs, path: *u8, fmt: string, __args: ..Any) -> bool {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return mg_file_printf_CFormat(fs, path, "%s", formatted_text.data);
} @PrintLike

mg_random :: (buf: *void, len: size_t) -> void #foreign mongoose;

mg_ntohs :: (net: u16) -> u16 #foreign mongoose;

mg_ntohl :: (net: u32) -> u32 #foreign mongoose;

mg_crc32 :: (crc: u32, buf: *u8, len: size_t) -> u32 #foreign mongoose;

mg_millis :: () -> s64 #foreign mongoose;

mg_url_port :: (url: *u8) -> u16 #foreign mongoose;

mg_url_is_ssl :: (url: *u8) -> s32 #foreign mongoose;

mg_url_host :: (url: *u8) -> mg_str #foreign mongoose;

mg_url_user :: (url: *u8) -> mg_str #foreign mongoose;

mg_url_pass :: (url: *u8) -> mg_str #foreign mongoose;

mg_url_uri :: (url: *u8) -> *u8 #foreign mongoose;

mg_iobuf :: struct {
    buf:  *u8; // Pointer to stored data
    size: size_t; // Total size available
    len:  size_t; // Current number of bytes
}

mg_iobuf_init :: (unknown0: *mg_iobuf, unknown1: size_t) -> s32 #foreign mongoose;

mg_iobuf_resize :: (unknown0: *mg_iobuf, unknown1: size_t) -> s32 #foreign mongoose;

mg_iobuf_free :: (unknown0: *mg_iobuf) -> void #foreign mongoose;

mg_iobuf_add :: (unknown0: *mg_iobuf, unknown1: size_t, unknown2: *void, unknown3: size_t, unknown4: size_t) -> size_t #foreign mongoose;

mg_iobuf_del :: (unknown0: *mg_iobuf, ofs: size_t, len: size_t) -> size_t #foreign mongoose;

mg_base64_update :: (p: u8, to: *u8, len: s32) -> s32 #foreign mongoose;

mg_base64_final :: (to: *u8, len: s32) -> s32 #foreign mongoose;

mg_base64_encode :: (p: *u8, n: s32, to: *u8) -> s32 #foreign mongoose;

mg_base64_decode :: (src: *u8, n: s32, dst: *u8) -> s32 #foreign mongoose;

mg_md5_ctx :: struct {
    buf:  [4] u32;
    bits: [2] u32;
    in:   [64] u8;
}

mg_sha1_ctx :: struct {
    state:  [5] u32;
    count:  [2] u32;
    buffer: [64] u8;
}

mg_sha1_init :: (unknown0: *mg_sha1_ctx) -> void #foreign mongoose;

mg_sha1_update :: (unknown0: *mg_sha1_ctx, data: *u8, len: size_t) -> void #foreign mongoose;

mg_sha1_final :: (digest: *[20] u8, unknown0: *mg_sha1_ctx) -> void #foreign mongoose;

mg_event_handler_t :: #type (unknown0: *mg_connection, ev: s32, ev_data: *void, fn_data: *void) -> void #c_call;

mg_call :: (c: *mg_connection, ev: s32, ev_data: *void) -> void #foreign mongoose;

mg_error_CFormat :: (c: *mg_connection, fmt: *u8, __args: ..Any) -> void #foreign mongoose "mg_error";
mg_error :: (c: *mg_connection, fmt: string, __args: ..Any) {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    mg_error_CFormat(c, "%s", formatted_text.data);
} @PrintLike

MG_EV :: enum s32 {
    ERROR      :: 0;
    OPEN       :: 1;
    POLL       :: 2;
    RESOLVE    :: 3;
    CONNECT    :: 4;
    ACCEPT     :: 5;
    READ       :: 6;
    WRITE      :: 7;
    CLOSE      :: 8;
    HTTP_MSG   :: 9;
    HTTP_CHUNK :: 10;
    WS_OPEN    :: 11;
    WS_MSG     :: 12;
    WS_CTL     :: 13;
    MQTT_CMD   :: 14;
    MQTT_MSG   :: 15;
    MQTT_OPEN  :: 16;
    SNTP_TIME  :: 17;
    USER       :: 18;

    MG_EV_ERROR      :: ERROR;
    MG_EV_OPEN       :: OPEN;
    MG_EV_POLL       :: POLL;
    MG_EV_RESOLVE    :: RESOLVE;
    MG_EV_CONNECT    :: CONNECT;
    MG_EV_ACCEPT     :: ACCEPT;
    MG_EV_READ       :: READ;
    MG_EV_WRITE      :: WRITE;
    MG_EV_CLOSE      :: CLOSE;
    MG_EV_HTTP_MSG   :: HTTP_MSG;
    MG_EV_HTTP_CHUNK :: HTTP_CHUNK;
    MG_EV_WS_OPEN    :: WS_OPEN;
    MG_EV_WS_MSG     :: WS_MSG;
    MG_EV_WS_CTL     :: WS_CTL;
    MG_EV_MQTT_CMD   :: MQTT_CMD;
    MG_EV_MQTT_MSG   :: MQTT_MSG;
    MG_EV_MQTT_OPEN  :: MQTT_OPEN;
    MG_EV_SNTP_TIME  :: SNTP_TIME;
    MG_EV_USER       :: USER;
}

mg_dns :: struct {
    url: *u8; // DNS server URL
    c:   *mg_connection; // DNS server connection
}

mg_addr :: struct {
    port:   u16; // TCP or UDP port in network byte order
    ip:     u32; // IP address in network byte order
    ip6:    [16] u8; // IPv6 address
    is_ip6: bool; // True when address is IPv6 address
}

mg_mgr :: struct {
    conns:      *mg_connection; // List of active connections
    dns4:       mg_dns; // DNS for IPv4
    dns6:       mg_dns; // DNS for IPv6
    dnstimeout: s32; // DNS resolve timeout in milliseconds
    nextid:     u32; // Next connection ID
    userdata:   *void; // Arbitrary user data pointer
}

mg_connection :: struct {
    next:          *mg_connection; // Linkage in struct mg_mgr :: connections
    mgr:           *mg_mgr; // Our container
    loc:           mg_addr; // Local address
    rem:           mg_addr; // Remote address
    fd:            *void; // Connected socket, or LWIP data
    id:            u32; // Auto-incrementing unique connection ID
    recv:          mg_iobuf; // Incoming data
    send:          mg_iobuf; // Outgoing data
    fn:            mg_event_handler_t; // User-specified event handler function
    fn_data:       *void; // User-specified function parameter
    pfn:           mg_event_handler_t; // Protocol-specific handler function
    pfn_data:      *void; // Protocol-specific function parameter
    label:         [50] u8; // Arbitrary label
    tls:           *void; // TLS specific data
    is_listening:  u32; // Listening connection
    #place is_listening; /*bitfield 1*/ is_client:     u32; // Outbound (client) connection
    #place is_listening; /*bitfield 2*/ is_accepted:   u32; // Accepted (server) connection
    #place is_listening; /*bitfield 3*/ is_resolving:  u32; // Non-blocking DNS resolution is in progress
    #place is_listening; /*bitfield 4*/ is_connecting: u32; // Non-blocking connect is in progress
    #place is_listening; /*bitfield 5*/ is_tls:        u32; // TLS-enabled connection
    #place is_listening; /*bitfield 6*/ is_tls_hs:     u32; // TLS handshake is in progress
    #place is_listening; /*bitfield 7*/ is_udp:        u32; // UDP connection
    #place is_listening; /*bitfield 8*/ is_websocket:  u32; // WebSocket connection
    #place is_listening; /*bitfield 9*/ is_hexdumping: u32; // Hexdump in/out traffic
    #place is_listening; /*bitfield 10*/ is_draining:   u32; // Send remaining data, then close and free
    #place is_listening; /*bitfield 11*/ is_closing:    u32; // Close and free the connection immediately
    #place is_listening; /*bitfield 12*/ is_readable:   u32; // Connection is ready to read
    #place is_listening; /*bitfield 13*/ is_writable:   u32; // Connection is ready to write
}

mg_mgr_poll :: (unknown0: *mg_mgr, ms: s32) -> void #foreign mongoose;

mg_mgr_init :: (unknown0: *mg_mgr) -> void #foreign mongoose;

mg_mgr_free :: (unknown0: *mg_mgr) -> void #foreign mongoose;

mg_listen :: (unknown0: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_connect :: (unknown0: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_connect_resolved :: (unknown0: *mg_connection) -> void #foreign mongoose;

mg_send :: (unknown0: *mg_connection, unknown1: *void, unknown2: size_t) -> bool #foreign mongoose;

mg_printf_CFormat :: (unknown0: *mg_connection, fmt: *u8, __args: ..Any) -> size_t #foreign mongoose "mg_printf";
mg_printf :: (unknown0: *mg_connection, fmt: string, __args: ..Any) -> size_t {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return mg_printf_CFormat(unknown0, "%s", formatted_text.data);
} @PrintLike

mg_straddr :: (unknown0: *mg_addr, unknown1: *u8, unknown2: size_t) -> *u8 #foreign mongoose;

mg_aton :: (str: mg_str, addr: *mg_addr) -> bool #foreign mongoose;

mg_ntoa :: (addr: *mg_addr, buf: *u8, len: size_t) -> *u8 #foreign mongoose;

mg_mkpipe :: (unknown0: *mg_mgr, unknown1: mg_event_handler_t, unknown2: *void) -> *mg_connection #foreign mongoose;

mg_mgr_wakeup :: (pipe: *mg_connection, buf: *void, len: size_t) -> void #foreign mongoose;

// These functions are used to integrate with custom network stacks
mg_alloc_conn :: (unknown0: *mg_mgr) -> *mg_connection #foreign mongoose;

mg_close_conn :: (c: *mg_connection) -> void #foreign mongoose;

mg_open_listener :: (c: *mg_connection, url: *u8) -> bool #foreign mongoose;

mg_http_header :: struct {
    name:  mg_str; // Header name
    value: mg_str; // Header value
}

mg_http_message :: struct {
    method:  mg_str; // Request/response line
    uri:     mg_str; // Request/response line
    query:   mg_str; // Request/response line
    proto:   mg_str; // Request/response line
    headers: [40] mg_http_header; // Headers
    body:    mg_str; // Body
    head:    mg_str; // Request + headers
    chunk:   mg_str; // Chunk for chunked encoding,  or partial body
    message: mg_str; // Request + headers + body
}

// Parameter for mg_http_serve_dir()
mg_http_serve_opts :: struct {
    root_dir:      *u8; // Web root directory, must be non-NULL
    ssi_pattern:   *u8; // SSI file name pattern, e.g. #.shtml
    extra_headers: *u8; // Extra HTTP headers to add in responses
    mime_types:    *u8; // Extra mime types, ext1=type1,ext2=type2,..
    fs:            *mg_fs; // Filesystem implementation. Use NULL for POSIX
}

// Parameter for mg_http_next_multipart
mg_http_part :: struct {
    name:     mg_str; // Form field name
    filename: mg_str; // Filename for file uploads
    body:     mg_str; // Part contents
}

mg_http_parse :: (s: *u8, len: size_t, unknown0: *mg_http_message) -> s32 #foreign mongoose;

mg_http_get_request_len :: (buf: *u8, buf_len: size_t) -> s32 #foreign mongoose;

mg_http_printf_chunk_CFormat :: (cnn: *mg_connection, fmt: *u8, __args: ..Any) -> void #foreign mongoose "mg_http_printf_chunk";
mg_http_printf_chunk :: (cnn: *mg_connection, fmt: string, __args: ..Any) {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    mg_http_printf_chunk_CFormat(cnn, "%s", formatted_text.data);
} @PrintLike

mg_http_write_chunk :: (c: *mg_connection, buf: *u8, len: size_t) -> void #foreign mongoose;

mg_http_delete_chunk :: (c: *mg_connection, hm: *mg_http_message) -> void #foreign mongoose;

mg_http_listen :: (unknown0: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_http_connect :: (unknown0: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_http_serve_dir :: (unknown0: *mg_connection, hm: *mg_http_message, opts: *mg_http_serve_opts) -> void #foreign mongoose;

mg_http_serve_file :: (unknown0: *mg_connection, hm: *mg_http_message, path: *u8, opts: *mg_http_serve_opts) -> void #foreign mongoose;

// clang-format on
mg_http_reply_CFormat :: (unknown0: *mg_connection, status_code: s32, headers: *u8, body_fmt: *u8, __args: ..Any) -> void #foreign mongoose "mg_http_reply";
mg_http_reply :: (unknown0: *mg_connection, status_code: s32, headers: *u8, body_fmt: string, __args: ..Any) {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, body_fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    mg_http_reply_CFormat(unknown0, status_code, headers, "%s", formatted_text.data);
} @PrintLike

mg_http_get_header :: (unknown0: *mg_http_message, name: *u8) -> *mg_str #foreign mongoose;

mg_http_get_var :: (unknown0: *mg_str, name: *u8, unknown1: *u8, unknown2: size_t) -> s32 #foreign mongoose;

mg_url_decode :: (s: *u8, n: size_t, to: *u8, to_len: size_t, form: s32) -> s32 #foreign mongoose;

mg_url_encode :: (s: *u8, n: size_t, buf: *u8, len: size_t) -> size_t #foreign mongoose;

mg_http_creds :: (unknown0: *mg_http_message, unknown1: *u8, unknown2: size_t, unknown3: *u8, unknown4: size_t) -> void #foreign mongoose;

mg_http_match_uri :: (unknown0: *mg_http_message, glob: *u8) -> bool #foreign mongoose;

mg_http_upload :: (unknown0: *mg_connection, hm: *mg_http_message, fs: *mg_fs, dir: *u8) -> s32 #foreign mongoose;

mg_http_bauth :: (unknown0: *mg_connection, user: *u8, pass: *u8) -> void #foreign mongoose;

mg_http_get_header_var :: (s: mg_str, v: mg_str) -> mg_str #foreign mongoose;

// Multipart POST example:
// --xyz
// Content-Disposition: form-data; name="val"
//
// abcdef
// --xyz
// Content-Disposition: form-data; name="foo"; filename="a.txt"
// Content-Type: text/plain
//
// hello world
//
// --xyz--
mg_http_next_multipart :: (unknown0: mg_str, unknown1: size_t, unknown2: *mg_http_part) -> size_t #foreign mongoose;

mg_http_status :: (hm: *mg_http_message) -> s32 #foreign mongoose;

mg_http_serve_ssi :: (c: *mg_connection, root: *u8, fullpath: *u8) -> void #foreign mongoose;

mg_tls_opts :: struct {
    ca:      *u8; // CA certificate file. For both listeners and clients
    crl:     *u8; // Certificate Revocation List. For clients
    cert:    *u8; // Certificate
    certkey: *u8; // Certificate key
    ciphers: *u8; // Cipher list
    srvname: mg_str; // If not empty, enables server name verification
    fs:      *mg_fs; // FS API for reading certificate files
}

mg_tls_init :: (unknown0: *mg_connection, unknown1: *mg_tls_opts) -> void #foreign mongoose;

mg_tls_free :: (unknown0: *mg_connection) -> void #foreign mongoose;

mg_tls_send :: (unknown0: *mg_connection, buf: *void, len: size_t) -> s32 #foreign mongoose;

mg_tls_recv :: (unknown0: *mg_connection, buf: *void, len: size_t) -> s32 #foreign mongoose;

mg_tls_handshake :: (unknown0: *mg_connection) -> void #foreign mongoose;

mg_ws_message :: struct {
    data:  mg_str; // Websocket message data
    flags: u8; // Websocket message flags
}

mg_ws_connect_CFormat :: (unknown0: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void, fmt: *u8, __args: ..Any) -> *mg_connection #foreign mongoose "mg_ws_connect";
mg_ws_connect :: (unknown0: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void, fmt: string, __args: ..Any) -> *mg_connection {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return mg_ws_connect_CFormat(unknown0, url, fn, fn_data, "%s", formatted_text.data);
} @PrintLike

mg_ws_upgrade_CFormat :: (unknown0: *mg_connection, unknown1: *mg_http_message, fmt: *u8, __args: ..Any) -> void #foreign mongoose "mg_ws_upgrade";
mg_ws_upgrade :: (unknown0: *mg_connection, unknown1: *mg_http_message, fmt: string, __args: ..Any) {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    mg_ws_upgrade_CFormat(unknown0, unknown1, "%s", formatted_text.data);
} @PrintLike

mg_ws_send :: (unknown0: *mg_connection, buf: *u8, len: size_t, op: s32) -> size_t #foreign mongoose;

mg_ws_wrap :: (unknown0: *mg_connection, len: size_t, op: s32) -> size_t #foreign mongoose;

mg_sntp_connect :: (mgr: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_sntp_send :: (c: *mg_connection, utc: u32) -> void #foreign mongoose;

mg_sntp_parse :: (buf: *u8, len: size_t) -> s64 #foreign mongoose;

mg_mqtt_opts :: struct {
    user:         mg_str; // Username, can be empty
    pass:         mg_str; // Password, can be empty
    client_id:    mg_str; // Client ID
    will_topic:   mg_str; // Will topic
    will_message: mg_str; // Will message
    will_qos:     u8; // Will message quality of service
    will_retain:  bool; // Retain last will
    clean:        bool; // Use clean session, 0 or 1
    keepalive:    u16; // Keep-alive timer in seconds
}

mg_mqtt_message :: struct {
    topic: mg_str; // Parsed topic
    data:  mg_str; // Parsed message
    dgram: mg_str; // Whole MQTT datagram, including headers
    id:    u16; // Set for PUBACK, PUBREC, PUBREL, PUBCOMP, SUBACK, PUBLISH
    cmd:   u8; // MQTT command, one of MQTT_CMD_*
    qos:   u8; // Quality of service
    ack:   u8; // Connack return code. 0 - success
}

mg_mqtt_connect :: (unknown0: *mg_mgr, url: *u8, opts: *mg_mqtt_opts, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_mqtt_listen :: (mgr: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_mqtt_login :: (c: *mg_connection, opts: *mg_mqtt_opts) -> void #foreign mongoose;

mg_mqtt_pub :: (c: *mg_connection, topic: mg_str, data: mg_str, qos: s32, retain: bool) -> void #foreign mongoose;

mg_mqtt_sub :: (unknown0: *mg_connection, topic: mg_str, qos: s32) -> void #foreign mongoose;

mg_mqtt_parse :: (buf: *u8, len: size_t, m: *mg_mqtt_message) -> s32 #foreign mongoose;

mg_mqtt_send_header :: (unknown0: *mg_connection, cmd: u8, flags: u8, len: u32) -> void #foreign mongoose;

mg_mqtt_next_sub :: (msg: *mg_mqtt_message, topic: *mg_str, qos: *u8, pos: size_t) -> size_t #foreign mongoose;

mg_mqtt_next_unsub :: (msg: *mg_mqtt_message, topic: *mg_str, pos: size_t) -> size_t #foreign mongoose;

mg_mqtt_ping :: (unknown0: *mg_connection) -> void #foreign mongoose;

mg_mqtt_pong :: (unknown0: *mg_connection) -> void #foreign mongoose;

mg_mqtt_disconnect :: (unknown0: *mg_connection) -> void #foreign mongoose;

// Mongoose sends DNS queries that contain only one question:
// either A (IPv4) or AAAA (IPv6) address lookup.
// Therefore, we expect zero or one answer.
// If `resolved` is true, then `addr` contains resolved IPv4 or IPV6 address.
mg_dns_message :: struct {
    txnid:    u16; // Transaction ID
    resolved: bool; // Resolve successful, addr is set
    addr:     mg_addr; // Resolved address
    name:     [256] u8; // Host name
}

mg_dns_header :: struct {
    txnid:             u16; // Transaction ID
    flags:             u16;
    num_questions:     u16;
    num_answers:       u16;
    num_authority_prs: u16;
    num_other_prs:     u16;
}

// DNS resource record
mg_dns_rr :: struct {
    nlen:   u16; // Name or pointer length
    atype:  u16; // Address type
    aclass: u16; // Address class
    alen:   u16; // Address length
}

mg_resolve :: (unknown0: *mg_connection, url: *u8) -> void #foreign mongoose;

mg_resolve_cancel :: (unknown0: *mg_connection) -> void #foreign mongoose;

mg_dns_parse :: (buf: *u8, len: size_t, unknown0: *mg_dns_message) -> bool #foreign mongoose;

mg_dns_parse_rr :: (buf: *u8, len: size_t, ofs: size_t, is_question: bool, unknown0: *mg_dns_rr) -> size_t #foreign mongoose;

dns_data :: struct {
    next:   *dns_data;
    c:      *mg_connection;
    expire: s64;
    txnid:  u16;
}

packed_file :: struct {
    data: *u8;
    size: size_t;
    pos:  size_t;
}

// Packed FS, see examples/complete
mg_fs_packed: mg_fs #elsewhere mongoose;

dirent :: struct {
    d_name: [260] u8;
}

win32_dir :: struct {
    handle: HANDLE;
    info:   WIN32_FIND_DATAW;
    result: dirent;
}

DIR :: win32_dir;

// POSIX open/close/read/write/seek
mg_fs_posix: mg_fs #elsewhere mongoose;

printdirentrydata :: struct {
    c:    *mg_connection;
    hm:   *mg_http_message;
    opts: *mg_http_serve_opts;
    dir:  *u8;
}

MQTT :: enum s32 {
    OK         :: 0;
    INCOMPLETE :: 1;
    MALFORMED  :: 2;
    MQTT_OK         :: OK;
    MQTT_INCOMPLETE :: INCOMPLETE;
    MQTT_MALFORMED  :: MALFORMED;
}

char64long16 :: union {
    c: [64] u8;
    l: [16] u32;
}

usa :: union {
    sa:  sockaddr;
    sin: sockaddr_in;
}

// Global list of timers
g_timers: *mg_timer #elsewhere mongoose;

url :: struct {
    key:  size_t;
    user: size_t;
    pass: size_t;
    host: size_t;
    port: size_t;
    uri:  size_t;
    end:  size_t;
}

ws_msg :: struct {
    flags:      u8;
    header_len: size_t;
    data_len:   size_t;
}

#scope_file

mongoose :: #library "bin/win/mongoose";
