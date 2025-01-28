//
// This file was auto-generated using the following command:
//
// jai ./generate.jai
//



MG_VERSION :: "7.16";

MG_ARCH_CUSTOM :: 0;
MG_ARCH_UNIX :: 1;
MG_ARCH_WIN32 :: 2;
MG_ARCH_ESP32 :: 3;
MG_ARCH_ESP8266 :: 4;
MG_ARCH_FREERTOS :: 5;
MG_ARCH_AZURERTOS :: 6;
MG_ARCH_ZEPHYR :: 7;
MG_ARCH_NEWLIB :: 8;
MG_ARCH_CMSIS_RTOS1 :: 9;
MG_ARCH_TIRTOS :: 10;
MG_ARCH_PICOSDK :: 11;
MG_ARCH_ARMCC :: 12;
MG_ARCH_CMSIS_RTOS2 :: 13;
MG_ARCH_RTTHREAD :: 14;
MG_ARCH_ARMCGT :: 15;

MG_ARCH :: MG_ARCH_WIN32;

MG_ENABLE_DIRLIST :: 1;

SIGPIPE :: 0;

MG_ENABLE_POSIX_FS :: 1;

MG_IO_SIZE :: 16384;

MG_ENABLE_LOG :: 1;

MG_ENABLE_CUSTOM_LOG :: 0;

MG_ENABLE_TCPIP :: 0;

MG_ENABLE_LWIP :: 0;

MG_ENABLE_FREERTOS_TCP :: 0;

MG_ENABLE_RL :: 0;

MG_ENABLE_SOCKET :: !MG_ENABLE_TCPIP;

MG_ENABLE_POLL :: 0;

MG_ENABLE_EPOLL :: 0;

MG_ENABLE_FATFS :: 0;

MG_ENABLE_SSI :: 0;

MG_ENABLE_IPV6 :: 0;

MG_IPV6_V6ONLY :: 0;

MG_ENABLE_MD5 :: 1;

MG_ENABLE_WINSOCK :: 1;

MG_ENABLE_CUSTOM_RANDOM :: 0;

MG_ENABLE_CUSTOM_MILLIS :: 0;

MG_ENABLE_PACKED_FS :: 0;

MG_ENABLE_ASSERT :: 0;

MG_MAX_RECV_SIZE :: 3 * 1024 * 1024;

MG_DATA_SIZE :: 32;

MG_MAX_HTTP_HEADERS :: 30;

MG_HTTP_INDEX :: "index.html";

MG_SOCK_LISTEN_BACKLOG_SIZE :: 128;

MG_ENABLE_PROFILE :: 0;

MG_ENABLE_TCPIP_DRIVER_INIT :: 1;

MG_ENABLE_TCPIP_PRINT_DEBUG_STATS :: 0;

MG_TIMER_ONCE :: 0;
MG_TIMER_REPEAT :: 1;
MG_TIMER_RUN_NOW :: 2;

X25519_BYTES :: 32;

GCM_AUTH_FAILURE :: 0x55555555;

MG_UECC_SUPPORTS_secp256r1 :: 1;

mg_uecc_arch_other :: 0;
mg_uecc_x86 :: 1;
mg_uecc_x86_64 :: 2;
mg_uecc_arm :: 3;
mg_uecc_arm_thumb :: 4;
mg_uecc_arm_thumb2 :: 5;
mg_uecc_arm64 :: 6;
mg_uecc_avr :: 7;

MG_UECC_OPTIMIZATION_LEVEL :: 2;

MG_UECC_SQUARE_FUNC :: 0;

MG_UECC_VLI_NATIVE_LITTLE_ENDIAN :: 0;

MG_UECC_SUPPORTS_secp160r1 :: 0;

MG_UECC_SUPPORTS_secp192r1 :: 0;

MG_UECC_SUPPORTS_secp224r1 :: 0;

MG_UECC_SUPPORTS_secp256k1 :: 0;

MG_UECC_SUPPORT_COMPRESSED_POINT :: 1;

MG_UECC_PLATFORM :: mg_uecc_x86_64;

MG_UECC_ARM_USE_UMAAL :: 0;

MG_UECC_WORD_SIZE :: 8;

HIGH_BIT_SET :: 0x8000000000000000;
MG_UECC_WORD_BITS :: 64;
MG_UECC_WORD_BITS_SHIFT :: 6;
MG_UECC_WORD_BITS_MASK :: 0x03F;

MG_UECC_ENABLE_VLI_API :: 0;

RFC_8439_TAG_SIZE :: 16;
RFC_8439_KEY_SIZE :: 32;
RFC_8439_NONCE_SIZE :: 12;

MG_TLS_NONE :: 0;
MG_TLS_MBED :: 1;
MG_TLS_OPENSSL :: 2;
MG_TLS_WOLFSSL :: 5;
MG_TLS_BUILTIN :: 3;
MG_TLS_CUSTOM :: 4;

MG_TLS :: MG_TLS_NONE;

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
MQTT_CMD_AUTH :: 15;

MQTT_PROP_PAYLOAD_FORMAT_INDICATOR :: 0x01;
MQTT_PROP_MESSAGE_EXPIRY_INTERVAL :: 0x02;
MQTT_PROP_CONTENT_TYPE :: 0x03;
MQTT_PROP_RESPONSE_TOPIC :: 0x08;
MQTT_PROP_CORRELATION_DATA :: 0x09;
MQTT_PROP_SUBSCRIPTION_IDENTIFIER :: 0x0B;
MQTT_PROP_SESSION_EXPIRY_INTERVAL :: 0x11;
MQTT_PROP_ASSIGNED_CLIENT_IDENTIFIER :: 0x12;
MQTT_PROP_SERVER_KEEP_ALIVE :: 0x13;
MQTT_PROP_AUTHENTICATION_METHOD :: 0x15;
MQTT_PROP_AUTHENTICATION_DATA :: 0x16;
MQTT_PROP_REQUEST_PROBLEM_INFORMATION :: 0x17;
MQTT_PROP_WILL_DELAY_INTERVAL :: 0x18;
MQTT_PROP_REQUEST_RESPONSE_INFORMATION :: 0x19;
MQTT_PROP_RESPONSE_INFORMATION :: 0x1A;
MQTT_PROP_SERVER_REFERENCE :: 0x1C;
MQTT_PROP_REASON_STRING :: 0x1F;
MQTT_PROP_RECEIVE_MAXIMUM :: 0x21;
MQTT_PROP_TOPIC_ALIAS_MAXIMUM :: 0x22;
MQTT_PROP_TOPIC_ALIAS :: 0x23;
MQTT_PROP_MAXIMUM_QOS :: 0x24;
MQTT_PROP_RETAIN_AVAILABLE :: 0x25;
MQTT_PROP_USER_PROPERTY :: 0x26;
MQTT_PROP_MAXIMUM_PACKET_SIZE :: 0x27;
MQTT_PROP_WILDCARD_SUBSCRIPTION_AVAILABLE :: 0x28;
MQTT_PROP_SUBSCRIPTION_IDENTIFIER_AVAILABLE :: 0x29;
MQTT_PROP_SHARED_SUBSCRIPTION_AVAILABLE :: 0x2A;

MG_JSON_MAX_DEPTH :: 30;

MG_OTA_NONE :: 0;
MG_OTA_STM32H5 :: 1;
MG_OTA_STM32H7 :: 2;
MG_OTA_STM32H7_DUAL_CORE :: 3;
MG_OTA_STM32F :: 4;
MG_OTA_CH32V307 :: 100;
MG_OTA_U2A :: 200;
MG_OTA_RT1020 :: 300;
MG_OTA_RT1060 :: 301;
MG_OTA_RT1064 :: 302;
MG_OTA_RT1170 :: 303;
MG_OTA_MCXN :: 310;
MG_OTA_FLASH :: 900;
MG_OTA_ESP32 :: 910;
MG_OTA_PICOSDK :: 920;
MG_OTA_CUSTOM :: 1000;

MG_OTA :: MG_OTA_NONE;

MQTT_CLEAN_SESSION :: 0x02;
MQTT_HAS_WILL :: 0x04;
MQTT_WILL_RETAIN :: 0x20;
MQTT_HAS_PASSWORD :: 0x40;
MQTT_HAS_USER_NAME :: 0x80;

SNTP_TIME_OFFSET :: 2208988800;
SNTP_MAX_FRAC :: 4294967295.0;

MSG_NONBLOCKING :: 0;

MG_MAX_SSI_DEPTH :: 5;

MG_SSI_BUFSIZ :: 1024;

MG_TIMER_CALLED :: 4;

AES_DECRYPTION :: 1;

MG_ENCRYPT :: 1;
MG_DECRYPT :: 0;

X25519_WBITS :: 32;

NLIMBS :: 256 / X25519_WBITS;

nfds_t :: u32;

// Describes an arbitrary chunk of memory
mg_str :: struct {
    buf: *u8; // String data
    len: u64; // String length
}

mg_str_s :: (s: *u8) -> mg_str #foreign mongoose;

mg_str_n :: (s: *u8, n: u64) -> mg_str #foreign mongoose;

mg_casecmp :: (s1: *u8, s2: *u8) -> s32 #foreign mongoose;

mg_strcmp :: (str1: mg_str, str2: mg_str) -> s32 #foreign mongoose;

mg_strcasecmp :: (str1: mg_str, str2: mg_str) -> s32 #foreign mongoose;

mg_strdup :: (s: mg_str) -> mg_str #foreign mongoose;

mg_match :: (str: mg_str, pattern: mg_str, caps: *mg_str) -> bool #foreign mongoose;

mg_span :: (s: mg_str, a: *mg_str, b: *mg_str, delim: u8) -> bool #foreign mongoose;

mg_str_to_num :: (unknown0: mg_str, base: s32, val: *void, val_len: u64) -> bool #foreign mongoose;

// Single producer, single consumer non-blocking queue
mg_queue :: struct {
    buf:  *u8;
    size: u64;
    tail: u64;
    head: u64;
}

// Every message in a queue is prepended by a 32-bit message length (ML).
// If ML is 0, then it is the end, and reader must wrap to the beginning.
//
//  Queue when q->tail <= q->head:
//  |----- free -----| ML | message1 | ML | message2 |  ----- free ------|
//  ^                ^                               ^                   ^
// buf              tail                            head                len
//
//  Queue when q->tail > q->head:
//  | ML | message2 |----- free ------| ML | message1 | 0 |---- free ----|
//  ^               ^                 ^                                  ^
// buf             head              tail                               len
mg_queue_init :: (unknown0: *mg_queue, unknown1: *u8, unknown2: u64) -> void #foreign mongoose;

mg_queue_book :: (unknown0: *mg_queue, buf: **u8, unknown1: u64) -> u64 #foreign mongoose;

mg_queue_add :: (unknown0: *mg_queue, unknown1: u64) -> void #foreign mongoose;

mg_queue_next :: (unknown0: *mg_queue, unknown1: **u8) -> u64 #foreign mongoose;

mg_queue_del :: (unknown0: *mg_queue, unknown1: u64) -> void #foreign mongoose;

mg_pfn_t :: #type (unknown0: u8, unknown1: *void) -> void #c_call;
mg_pm_t :: #type (unknown0: mg_pfn_t, unknown1: *void, unknown2: *va_list) -> u64 #c_call;

mg_vxprintf :: (unknown0: #type (unknown0: u8, unknown1: *void) -> void #c_call, unknown1: *void, fmt: *u8, unknown2: *va_list) -> u64 #foreign mongoose;

mg_xprintf_CFormat :: (fn: #type (unknown0: u8, unknown1: *void) -> void #c_call, unknown0: *void, fmt: *u8, __args: ..Any) -> u64 #foreign mongoose "mg_xprintf";
mg_xprintf :: (fn: #type (unknown0: u8, unknown1: *void) -> void #c_call, unknown0: *void, fmt: string, __args: ..Any) -> u64 {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return mg_xprintf_CFormat(fn, unknown0, "%s", formatted_text.data);
} @PrintLike

// Convenience wrappers around mg_xprintf
mg_vsnprintf :: (buf: *u8, len: u64, fmt: *u8, ap: *va_list) -> u64 #foreign mongoose;

mg_snprintf_CFormat :: (unknown0: *u8, unknown1: u64, fmt: *u8, __args: ..Any) -> u64 #foreign mongoose "mg_snprintf";
mg_snprintf :: (unknown0: *u8, unknown1: u64, fmt: string, __args: ..Any) -> u64 {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return mg_snprintf_CFormat(unknown0, unknown1, "%s", formatted_text.data);
} @PrintLike

mg_vmprintf :: (fmt: *u8, ap: *va_list) -> *u8 #foreign mongoose;

mg_mprintf_CFormat :: (fmt: *u8, __args: ..Any) -> *u8 #foreign mongoose "mg_mprintf";
mg_mprintf :: (fmt: string, __args: ..Any) -> *u8 {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return mg_mprintf_CFormat("%s", formatted_text.data);
} @PrintLike

mg_queue_vprintf :: (unknown0: *mg_queue, fmt: *u8, unknown1: *va_list) -> u64 #foreign mongoose;

mg_queue_printf_CFormat :: (unknown0: *mg_queue, fmt: *u8, __args: ..Any) -> u64 #foreign mongoose "mg_queue_printf";
mg_queue_printf :: (unknown0: *mg_queue, fmt: string, __args: ..Any) -> u64 {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return mg_queue_printf_CFormat(unknown0, "%s", formatted_text.data);
} @PrintLike

// %M print helper functions
mg_print_base64 :: (out: #type (unknown0: u8, unknown1: *void) -> void #c_call, arg: *void, ap: *va_list) -> u64 #foreign mongoose;

mg_print_esc :: (out: #type (unknown0: u8, unknown1: *void) -> void #c_call, arg: *void, ap: *va_list) -> u64 #foreign mongoose;

mg_print_hex :: (out: #type (unknown0: u8, unknown1: *void) -> void #c_call, arg: *void, ap: *va_list) -> u64 #foreign mongoose;

mg_print_ip :: (out: #type (unknown0: u8, unknown1: *void) -> void #c_call, arg: *void, ap: *va_list) -> u64 #foreign mongoose;

mg_print_ip_port :: (out: #type (unknown0: u8, unknown1: *void) -> void #c_call, arg: *void, ap: *va_list) -> u64 #foreign mongoose;

mg_print_ip4 :: (out: #type (unknown0: u8, unknown1: *void) -> void #c_call, arg: *void, ap: *va_list) -> u64 #foreign mongoose;

mg_print_ip6 :: (out: #type (unknown0: u8, unknown1: *void) -> void #c_call, arg: *void, ap: *va_list) -> u64 #foreign mongoose;

mg_print_mac :: (out: #type (unknown0: u8, unknown1: *void) -> void #c_call, arg: *void, ap: *va_list) -> u64 #foreign mongoose;

// Various output functions
mg_pfn_iobuf :: (ch: u8, param: *void) -> void #foreign mongoose;

mg_pfn_stdout :: (c: u8, param: *void) -> void #foreign mongoose;

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

mg_log_prefix :: (ll: s32, file: *u8, line: s32, fname: *u8) -> void #foreign mongoose;

// bool mg_log2(int ll, const char *file, int line, const char *fmt, ...);
mg_hexdump :: (buf: *void, len: u64) -> void #foreign mongoose;

mg_log_set_fn :: (fn: mg_pfn_t, param: *void) -> void #foreign mongoose;

mg_timer :: struct {
    id:        u32; // Timer ID
    period_ms: u64; // Timer period in milliseconds
    expire:    u64; // Expiration timestamp in milliseconds
    flags:     u32; // Possible flags values below

    fn:        #type (unknown0: *void) -> void #c_call; // Function to call
    arg:       *void; // Function argument
    next:      *mg_timer; // Linkage
}

mg_timer_init :: (head: **mg_timer, timer: *mg_timer, milliseconds: u64, flags: u32, fn: #type (unknown0: *void) -> void #c_call, arg: *void) -> void #foreign mongoose;

mg_timer_free :: (head: **mg_timer, unknown0: *mg_timer) -> void #foreign mongoose;

mg_timer_poll :: (head: **mg_timer, new_ms: u64) -> void #foreign mongoose;

// t: expiration time, prd: period, now: current time. Return true if expired
mg_timer_expired :: (expiration: *u64, period: u64, now: u64) -> bool #foreign mongoose;

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
    st:  #type (path: *u8, size: *u64, mtime: *time_t) -> s32 #c_call; // stat file
    ls:  #type (path: *u8, fn: #type (unknown0: *u8, unknown1: *void) -> void #c_call, unknown0: *void) -> void #c_call;

    op:  #type (path: *u8, flags: s32) -> *void #c_call; // Open file
    cl:  #type (fd: *void) -> void #c_call; // Close file
    rd:  #type (fd: *void, buf: *void, len: u64) -> u64 #c_call; // Read file
    wr:  #type (fd: *void, buf: *void, len: u64) -> u64 #c_call; // Write file
    sk:  #type (fd: *void, offset: u64) -> u64 #c_call; // Set file position
    mv:  #type (from: *u8, to: *u8) -> bool #c_call; // Rename file
    rm:  #type (path: *u8) -> bool #c_call; // Delete file
    mkd: #type (path: *u8) -> bool #c_call; // Create directory
}

// File descriptor
mg_fd :: struct {
    fd: *void;
    fs: *mg_fs;
}

mg_fs_open :: (fs: *mg_fs, path: *u8, flags: s32) -> *mg_fd #foreign mongoose;

mg_fs_close :: (fd: *mg_fd) -> void #foreign mongoose;

mg_fs_ls :: (fs: *mg_fs, path: *u8, buf: *u8, len: u64) -> bool #foreign mongoose;

mg_file_read :: (fs: *mg_fs, path: *u8) -> mg_str #foreign mongoose;

mg_file_write :: (fs: *mg_fs, path: *u8, unknown0: *void, unknown1: u64) -> bool #foreign mongoose;

mg_file_printf_CFormat :: (fs: *mg_fs, path: *u8, fmt: *u8, __args: ..Any) -> bool #foreign mongoose "mg_file_printf";
mg_file_printf :: (fs: *mg_fs, path: *u8, fmt: string, __args: ..Any) -> bool {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return mg_file_printf_CFormat(fs, path, "%s", formatted_text.data);
} @PrintLike

// Packed API
mg_unpack :: (path: *u8, size: *u64, mtime: *time_t) -> *u8 #foreign mongoose;

mg_unlist :: (no: u64) -> *u8 #foreign mongoose;

mg_unpacked :: (path: *u8) -> mg_str #foreign mongoose;

// Not using memset for zeroing memory, cause it can be dropped by compiler
// See https://github.com/cesanta/mongoose/pull/1265
mg_bzero :: (buf: *u8, len: u64) -> void #foreign mongoose;

mg_random :: (buf: *void, len: u64) -> bool #foreign mongoose;

mg_random_str :: (buf: *u8, len: u64) -> *u8 #foreign mongoose;

mg_ntohs :: (net: u16) -> u16 #foreign mongoose;

mg_ntohl :: (net: u32) -> u32 #foreign mongoose;

mg_crc32 :: (crc: u32, buf: *u8, len: u64) -> u32 #foreign mongoose;

mg_millis :: () -> u64 #foreign mongoose;

mg_path_is_sane :: (path: mg_str) -> bool #foreign mongoose;

mg_check_ip_acl :: (acl: mg_str, remote_ip: *mg_addr) -> s32 #foreign mongoose;

mg_url_port :: (url: *u8) -> u16 #foreign mongoose;

mg_url_is_ssl :: (url: *u8) -> s32 #foreign mongoose;

mg_url_host :: (url: *u8) -> mg_str #foreign mongoose;

mg_url_user :: (url: *u8) -> mg_str #foreign mongoose;

mg_url_pass :: (url: *u8) -> mg_str #foreign mongoose;

mg_url_uri :: (url: *u8) -> *u8 #foreign mongoose;

mg_iobuf :: struct {
    buf:   *u8; // Pointer to stored data
    size:  u64; // Total size available
    len:   u64; // Current number of bytes
    align: u64; // Alignment during allocation
}

mg_iobuf_init :: (unknown0: *mg_iobuf, unknown1: u64, unknown2: u64) -> s32 #foreign mongoose;

mg_iobuf_resize :: (unknown0: *mg_iobuf, unknown1: u64) -> s32 #foreign mongoose;

mg_iobuf_free :: (unknown0: *mg_iobuf) -> void #foreign mongoose;

mg_iobuf_add :: (unknown0: *mg_iobuf, unknown1: u64, unknown2: *void, unknown3: u64) -> u64 #foreign mongoose;

mg_iobuf_del :: (unknown0: *mg_iobuf, ofs: u64, len: u64) -> u64 #foreign mongoose;

mg_base64_update :: (input_byte: u8, buf: *u8, len: u64) -> u64 #foreign mongoose;

mg_base64_final :: (buf: *u8, len: u64) -> u64 #foreign mongoose;

mg_base64_encode :: (p: *u8, n: u64, buf: *u8, unknown0: u64) -> u64 #foreign mongoose;

mg_base64_decode :: (src: *u8, n: u64, dst: *u8, unknown0: u64) -> u64 #foreign mongoose;

mg_md5_ctx :: struct {
    buf:  [4] u32;
    bits: [2] u32;
    in:   [64] u8;
}

/*
* Start MD5 accumulation.  Set bit count to 0 and buffer to mysterious
* initialization constants.
*/
mg_md5_init :: (c: *mg_md5_ctx) -> void #foreign mongoose;

mg_md5_update :: (c: *mg_md5_ctx, data: *u8, len: u64) -> void #foreign mongoose;

mg_md5_final :: (c: *mg_md5_ctx, unknown0: *[16] u8) -> void #foreign mongoose;

mg_sha1_ctx :: struct {
    state:  [5] u32;
    count:  [2] u32;
    buffer: [64] u8;
}

mg_sha1_init :: (unknown0: *mg_sha1_ctx) -> void #foreign mongoose;

mg_sha1_update :: (unknown0: *mg_sha1_ctx, data: *u8, len: u64) -> void #foreign mongoose;

mg_sha1_final :: (digest: *[20] u8, unknown0: *mg_sha1_ctx) -> void #foreign mongoose;

// https://github.com/B-Con/crypto-algorithms
// Author:     Brad Conte (brad AT bradconte.com)
// Disclaimer: This code is presented "as is" without any guarantees.
// Details:    Defines the API for the corresponding SHA1 implementation.
// Copyright:  public domain
mg_sha256_ctx :: struct {
    state:  [8] u32;
    bits:   u64;
    len:    u32;
    buffer: [64] u8;
}

mg_sha256_init :: (unknown0: *mg_sha256_ctx) -> void #foreign mongoose;

mg_sha256_update :: (unknown0: *mg_sha256_ctx, data: *u8, len: u64) -> void #foreign mongoose;

// TODO: make final reusable (remove side effects)
mg_sha256_final :: (digest: *[32] u8, unknown0: *mg_sha256_ctx) -> void #foreign mongoose;

mg_hmac_sha256 :: (dst: *[32] u8, key: *u8, keysz: u64, data: *u8, datasz: u64) -> void #foreign mongoose;

mg_tls_x25519 :: (out: *[32] u8, scalar: *[32] u8, x1: *[32] u8, clamp: s32) -> s32 #foreign mongoose;

/******************************************************************************
*  AES_CONTEXT : cipher context / holds inter-call data
******************************************************************************/
aes_context :: struct {
    mode:   s32; // 1 for Encryption, 0 for Decryption
    rounds: s32; // keysize-based rounds count
    rk:     *u32; // pointer to current round key
    buf:    [68] u32; // key expansion buffer
}

MG_UECC_Curve_t :: struct {}
MG_UECC_Curve :: *MG_UECC_Curve_t;

/* MG_UECC_RNG_Function type
The RNG function should fill 'size' random bytes into 'dest'. It should return 1
if 'dest' was filled with random data, or 0 if the random data could not be
generated. The filled-in values should be either truly random, or from a
cryptographically-secure PRNG.

A correctly functioning RNG function must be set (using mg_uecc_set_rng())
before calling mg_uecc_make_key() or mg_uecc_sign().

Setting a correctly functioning RNG function improves the resistance to
side-channel attacks for mg_uecc_shared_secret() and
mg_uecc_sign_deterministic().

A correct RNG function is set by default when building for Windows, Linux, or OS
X. If you are building on another POSIX-compliant system that supports
/dev/random or /dev/urandom, you can define MG_UECC_POSIX to use the predefined
RNG. For embedded platforms there is no predefined RNG function; you must
provide your own.
*/
MG_UECC_RNG_Function :: #type (dest: *u8, size: u32) -> s32 #c_call;

/* MG_UECC_HashContext structure.
This is used to pass in an arbitrary hash function to
mg_uecc_sign_deterministic(). The structure will be used for multiple hash
computations; each time a new hash is computed, init_hash() will be called,
followed by one or more calls to update_hash(), and finally a call to
finish_hash() to produce the resulting hash.

The intention is that you will create a structure that includes
MG_UECC_HashContext followed by any hash-specific data. For example:

typedef struct SHA256_HashContext {
MG_UECC_HashContext uECC;
SHA256_CTX ctx;
} SHA256_HashContext;

void init_SHA256(MG_UECC_HashContext *base) {
SHA256_HashContext *context = (SHA256_HashContext *)base;
SHA256_Init(&context->ctx);
}

void update_SHA256(MG_UECC_HashContext *base,
const uint8_t *message,
unsigned message_size) {
SHA256_HashContext *context = (SHA256_HashContext *)base;
SHA256_Update(&context->ctx, message, message_size);
}

void finish_SHA256(MG_UECC_HashContext *base, uint8_t *hash_result) {
SHA256_HashContext *context = (SHA256_HashContext *)base;
SHA256_Final(hash_result, &context->ctx);
}

... when signing ...
{
uint8_t tmp[32 + 32 + 64];
SHA256_HashContext ctx = {{&init_SHA256, &update_SHA256, &finish_SHA256, 64,
32, tmp}}; mg_uecc_sign_deterministic(key, message_hash, &ctx.uECC, signature);
}
*/
MG_UECC_HashContext :: struct {
    init_hash:   #type (_context: *MG_UECC_HashContext) -> void #c_call;
    update_hash: #type (_context: *MG_UECC_HashContext, message: *u8, message_size: u32) -> void #c_call;

    finish_hash: #type (_context: *MG_UECC_HashContext, hash_result: *u8) -> void #c_call;

    block_size:  u32; /* Hash function block size in bytes, eg 64 for SHA-256. */

    result_size: u32; /* Hash function result size in bytes, eg 32 for SHA-256. */
    /* Must point to a buffer of at least (2 * result_size +
    block_size) bytes. */
    tmp:         *u8;
}

wordcount_t :: s8;
bitcount_t :: s16;
cmpresult_t :: s8;

mg_uecc_word_t :: u64;

mg_event_handler_t :: #type (unknown0: *mg_connection, ev: s32, ev_data: *void) -> void #c_call;

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
    ERROR     :: 0;
    OPEN      :: 1;
    POLL      :: 2;
    RESOLVE   :: 3;
    CONNECT   :: 4;
    ACCEPT    :: 5;
    TLS_HS    :: 6;
    READ      :: 7;
    WRITE     :: 8;
    CLOSE     :: 9;
    HTTP_HDRS :: 10;
    HTTP_MSG  :: 11;
    WS_OPEN   :: 12;
    WS_MSG    :: 13;
    WS_CTL    :: 14;
    MQTT_CMD  :: 15;
    MQTT_MSG  :: 16;
    MQTT_OPEN :: 17;
    SNTP_TIME :: 18;
    WAKEUP    :: 19;
    USER      :: 20;

    MG_EV_ERROR     :: ERROR;
    MG_EV_OPEN      :: OPEN;
    MG_EV_POLL      :: POLL;
    MG_EV_RESOLVE   :: RESOLVE;
    MG_EV_CONNECT   :: CONNECT;
    MG_EV_ACCEPT    :: ACCEPT;
    MG_EV_TLS_HS    :: TLS_HS;
    MG_EV_READ      :: READ;
    MG_EV_WRITE     :: WRITE;
    MG_EV_CLOSE     :: CLOSE;
    MG_EV_HTTP_HDRS :: HTTP_HDRS;
    MG_EV_HTTP_MSG  :: HTTP_MSG;
    MG_EV_WS_OPEN   :: WS_OPEN;
    MG_EV_WS_MSG    :: WS_MSG;
    MG_EV_WS_CTL    :: WS_CTL;
    MG_EV_MQTT_CMD  :: MQTT_CMD;
    MG_EV_MQTT_MSG  :: MQTT_MSG;
    MG_EV_MQTT_OPEN :: MQTT_OPEN;
    MG_EV_SNTP_TIME :: SNTP_TIME;
    MG_EV_WAKEUP    :: WAKEUP;
    MG_EV_USER      :: USER;
}

mg_dns :: struct {
    url: *u8; // DNS server URL
    c:   *mg_connection; // DNS server connection
}

mg_addr :: struct {
    ip:       [16] u8; // Holds IPv4 or IPv6 address, in network byte order
    port:     u16; // TCP or UDP port in network byte order
    scope_id: u8; // IPv6 scope ID
    is_ip6:   bool; // True when address is IPv6 address
}

mg_mgr :: struct {
    conns:               *mg_connection; // List of active connections
    dns4:                mg_dns; // DNS for IPv4
    dns6:                mg_dns; // DNS for IPv6
    dnstimeout:          s32; // DNS resolve timeout in milliseconds
    use_dns6:            bool; // Use DNS6 server by default, see #1532
    nextid:              u32; // Next connection ID
    timerid:             u32; // Next timer ID
    userdata:            *void; // Arbitrary user data pointer
    tls_ctx:             *void; // TLS context shared by all TLS sessions
    mqtt_id:             u16; // MQTT IDs for pub/sub
    active_dns_requests: *void; // DNS requests in progress
    timers:              *mg_timer; // Active timers
    epoll_fd:            s32; // Used when MG_EPOLL_ENABLE=1
    priv:                *void; // Used by the MIP stack
    extraconnsize:       u64; // Used by the MIP stack
    pipe:                SOCKET; // Socketpair end for mg_wakeup()
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
    prof:          mg_iobuf; // Profile data enabled by MG_ENABLE_PROFILE
    rtls:          mg_iobuf; // TLS only. Incoming encrypted data
    fn:            mg_event_handler_t; // User-specified event handler function
    fn_data:       *void; // User-specified function parameter
    pfn:           mg_event_handler_t; // Protocol-specific handler function
    pfn_data:      *void; // Protocol-specific function parameter
    data:          [32] u8; // Arbitrary connection data
    tls:           *void; // TLS specific data
    is_listening:  u32; // Listening connection
    #place is_listening; /*bitfield 1*/ is_client:     u32; // Outbound (client) connection
    #place is_listening; /*bitfield 2*/ is_accepted:   u32; // Accepted (server) connection
    #place is_listening; /*bitfield 3*/ is_resolving:  u32; // Non-blocking DNS resolution is in progress
    #place is_listening; /*bitfield 4*/ is_arplooking: u32; // Non-blocking ARP resolution is in progress
    #place is_listening; /*bitfield 5*/ is_connecting: u32; // Non-blocking connect is in progress
    #place is_listening; /*bitfield 6*/ is_tls:        u32; // TLS-enabled connection
    #place is_listening; /*bitfield 7*/ is_tls_hs:     u32; // TLS handshake is in progress
    #place is_listening; /*bitfield 8*/ is_udp:        u32; // UDP connection
    #place is_listening; /*bitfield 9*/ is_websocket:  u32; // WebSocket connection
    #place is_listening; /*bitfield 10*/ is_mqtt5:      u32; // For MQTT connection, v5 indicator
    #place is_listening; /*bitfield 11*/ is_hexdumping: u32; // Hexdump in/out traffic
    #place is_listening; /*bitfield 12*/ is_draining:   u32; // Send remaining data, then close and free
    #place is_listening; /*bitfield 13*/ is_closing:    u32; // Close and free the connection immediately
    #place is_listening; /*bitfield 14*/ is_full:       u32; // Stop reads, until cleared
    #place is_listening; /*bitfield 15*/ is_resp:       u32; // Response is still being generated
    #place is_listening; /*bitfield 16*/ is_readable:   u32; // Connection is ready to read
    #place is_listening; /*bitfield 17*/ is_writable:   u32; // Connection is ready to write
    #place is_listening; /*bitfield 18*/ is_io_err:     u32; // Remember IO_ERR condition for later use
}

mg_mgr_poll :: (unknown0: *mg_mgr, ms: s32) -> void #foreign mongoose;

mg_mgr_init :: (unknown0: *mg_mgr) -> void #foreign mongoose;

mg_mgr_free :: (unknown0: *mg_mgr) -> void #foreign mongoose;

mg_listen :: (unknown0: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_connect :: (unknown0: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_wrapfd :: (mgr: *mg_mgr, fd: s32, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_connect_resolved :: (unknown0: *mg_connection) -> void #foreign mongoose;

mg_send :: (unknown0: *mg_connection, unknown1: *void, unknown2: u64) -> bool #foreign mongoose;

mg_printf_CFormat :: (unknown0: *mg_connection, fmt: *u8, __args: ..Any) -> u64 #foreign mongoose "mg_printf";
mg_printf :: (unknown0: *mg_connection, fmt: string, __args: ..Any) -> u64 {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return mg_printf_CFormat(unknown0, "%s", formatted_text.data);
} @PrintLike

mg_vprintf :: (unknown0: *mg_connection, fmt: *u8, ap: *va_list) -> u64 #foreign mongoose;

mg_aton :: (str: mg_str, addr: *mg_addr) -> bool #foreign mongoose;

// These functions are used to integrate with custom network stacks
mg_alloc_conn :: (unknown0: *mg_mgr) -> *mg_connection #foreign mongoose;

mg_close_conn :: (c: *mg_connection) -> void #foreign mongoose;

mg_open_listener :: (c: *mg_connection, url: *u8) -> bool #foreign mongoose;

// Utility functions
mg_wakeup :: (unknown0: *mg_mgr, id: u32, buf: *void, len: u64) -> bool #foreign mongoose;

mg_wakeup_init :: (unknown0: *mg_mgr) -> bool #foreign mongoose;

mg_timer_add :: (mgr: *mg_mgr, milliseconds: u64, flags: u32, fn: #type (unknown0: *void) -> void #c_call, arg: *void) -> *mg_timer #foreign mongoose;

mg_http_header :: struct {
    name:  mg_str; // Header name
    value: mg_str; // Header value
}

mg_http_message :: struct {
    method:  mg_str; // Request/response line
    uri:     mg_str; // Request/response line
    query:   mg_str; // Request/response line
    proto:   mg_str; // Request/response line
    headers: [30] mg_http_header; // Headers
    body:    mg_str; // Body
    head:    mg_str; // Request + headers
    message: mg_str; // Request + headers + body
}

// Parameter for mg_http_serve_dir()
mg_http_serve_opts :: struct {
    root_dir:      *u8; // Web root directory, must be non-NULL
    ssi_pattern:   *u8; // SSI file name pattern, e.g. #.shtml
    extra_headers: *u8; // Extra HTTP headers to add in responses
    mime_types:    *u8; // Extra mime types, ext1=type1,ext2=type2,..
    page404:       *u8; // Path to the 404 page, or NULL by default
    fs:            *mg_fs; // Filesystem implementation. Use NULL for POSIX
}

// Parameter for mg_http_next_multipart
mg_http_part :: struct {
    name:     mg_str; // Form field name
    filename: mg_str; // Filename for file uploads
    body:     mg_str; // Part contents
}

mg_http_parse :: (s: *u8, len: u64, unknown0: *mg_http_message) -> s32 #foreign mongoose;

mg_http_get_request_len :: (buf: *u8, buf_len: u64) -> s32 #foreign mongoose;

mg_http_printf_chunk_CFormat :: (cnn: *mg_connection, fmt: *u8, __args: ..Any) -> void #foreign mongoose "mg_http_printf_chunk";
mg_http_printf_chunk :: (cnn: *mg_connection, fmt: string, __args: ..Any) {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    mg_http_printf_chunk_CFormat(cnn, "%s", formatted_text.data);
} @PrintLike

mg_http_write_chunk :: (c: *mg_connection, buf: *u8, len: u64) -> void #foreign mongoose;

mg_http_listen :: (unknown0: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_http_connect :: (unknown0: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_http_serve_dir :: (unknown0: *mg_connection, hm: *mg_http_message, unknown1: *mg_http_serve_opts) -> void #foreign mongoose;

mg_http_serve_file :: (unknown0: *mg_connection, hm: *mg_http_message, path: *u8, unknown1: *mg_http_serve_opts) -> void #foreign mongoose;

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

mg_http_var :: (buf: mg_str, name: mg_str) -> mg_str #foreign mongoose;

mg_http_get_var :: (unknown0: *mg_str, name: *u8, unknown1: *u8, unknown2: u64) -> s32 #foreign mongoose;

mg_url_decode :: (s: *u8, n: u64, to: *u8, to_len: u64, form: s32) -> s32 #foreign mongoose;

mg_url_encode :: (s: *u8, n: u64, buf: *u8, len: u64) -> u64 #foreign mongoose;

mg_http_creds :: (unknown0: *mg_http_message, unknown1: *u8, unknown2: u64, unknown3: *u8, unknown4: u64) -> void #foreign mongoose;

mg_http_upload :: (c: *mg_connection, hm: *mg_http_message, fs: *mg_fs, dir: *u8, max_size: u64) -> s32 #foreign mongoose;

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
mg_http_next_multipart :: (unknown0: mg_str, unknown1: u64, unknown2: *mg_http_part) -> u64 #foreign mongoose;

mg_http_status :: (hm: *mg_http_message) -> s32 #foreign mongoose;

mg_hello :: (url: *u8) -> void #foreign mongoose;

mg_http_serve_ssi :: (c: *mg_connection, root: *u8, fullpath: *u8) -> void #foreign mongoose;

mg_tls_opts :: struct {
    ca:                mg_str; // PEM or DER
    cert:              mg_str; // PEM or DER
    key:               mg_str; // PEM or DER
    name:              mg_str; // If not empty, enable host name verification
    skip_verification: s32; // Skip certificate and host name verification
}

mg_tls_init :: (unknown0: *mg_connection, opts: *mg_tls_opts) -> void #foreign mongoose;

mg_tls_free :: (unknown0: *mg_connection) -> void #foreign mongoose;

mg_tls_send :: (unknown0: *mg_connection, buf: *void, len: u64) -> s32 #foreign mongoose;

mg_tls_recv :: (unknown0: *mg_connection, buf: *void, len: u64) -> s32 #foreign mongoose;

mg_tls_pending :: (unknown0: *mg_connection) -> u64 #foreign mongoose;

mg_tls_handshake :: (unknown0: *mg_connection) -> void #foreign mongoose;

// Private
mg_tls_ctx_init :: (unknown0: *mg_mgr) -> void #foreign mongoose;

mg_tls_ctx_free :: (unknown0: *mg_mgr) -> void #foreign mongoose;

// Low-level IO primives used by TLS layer
MG_IO :: enum s32 {
    ERR   :: -1;
    WAIT  :: -2;
    RESET :: -3;
    MG_IO_ERR   :: ERR;
    MG_IO_WAIT  :: WAIT;
    MG_IO_RESET :: RESET;
}

mg_io_send :: (c: *mg_connection, buf: *void, len: u64) -> s32 #foreign mongoose;

mg_io_recv :: (c: *mg_connection, buf: *void, len: u64) -> s32 #foreign mongoose;

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

mg_ws_send :: (unknown0: *mg_connection, buf: *void, len: u64, op: s32) -> u64 #foreign mongoose;

mg_ws_wrap :: (unknown0: *mg_connection, len: u64, op: s32) -> u64 #foreign mongoose;

mg_ws_printf_CFormat :: (c: *mg_connection, op: s32, fmt: *u8, __args: ..Any) -> u64 #foreign mongoose "mg_ws_printf";
mg_ws_printf :: (c: *mg_connection, op: s32, fmt: string, __args: ..Any) -> u64 {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return mg_ws_printf_CFormat(c, op, "%s", formatted_text.data);
} @PrintLike

mg_ws_vprintf :: (c: *mg_connection, op: s32, fmt: *u8, unknown0: *va_list) -> u64 #foreign mongoose;

mg_sntp_connect :: (mgr: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_sntp_request :: (c: *mg_connection) -> void #foreign mongoose;

mg_sntp_parse :: (buf: *u8, len: u64) -> s64 #foreign mongoose;

mg_now :: () -> u64 #foreign mongoose;

MQTT_PROP_TYPE :: enum s32 {
    BYTE         :: 0;
    STRING       :: 1;
    STRING_PAIR  :: 2;
    BINARY_DATA  :: 3;
    VARIABLE_INT :: 4;
    INT          :: 5;
    SHORT        :: 6;

    MQTT_PROP_TYPE_BYTE         :: BYTE;
    MQTT_PROP_TYPE_STRING       :: STRING;
    MQTT_PROP_TYPE_STRING_PAIR  :: STRING_PAIR;
    MQTT_PROP_TYPE_BINARY_DATA  :: BINARY_DATA;
    MQTT_PROP_TYPE_VARIABLE_INT :: VARIABLE_INT;
    MQTT_PROP_TYPE_INT          :: INT;
    MQTT_PROP_TYPE_SHORT        :: SHORT;
}

MQTT :: enum s32 {
    OK         :: 0;
    INCOMPLETE :: 1;
    MALFORMED  :: 2;
    MQTT_OK         :: OK;
    MQTT_INCOMPLETE :: INCOMPLETE;
    MQTT_MALFORMED  :: MALFORMED;
}

mg_mqtt_prop :: struct {
    id:  u8; // Enumerated at MQTT5 Reference
    iv:  u32; // Integer value for 8-, 16-, 32-bit integers types
    key: mg_str; // Non-NULL only for user property type
    val: mg_str; // Non-NULL only for UTF-8 types and user properties
}

mg_mqtt_opts :: struct {
    user:           mg_str; // Username, can be empty
    pass:           mg_str; // Password, can be empty
    client_id:      mg_str; // Client ID
    topic:          mg_str; // message/subscription topic
    message:        mg_str; // message content
    qos:            u8; // message quality of service
    version:        u8; // Can be 4 (3.1.1), or 5. If 0, assume 4
    keepalive:      u16; // Keep-alive timer in seconds
    retransmit_id:  u16; // For PUBLISH, init to 0
    retain:         bool; // Retain flag
    clean:          bool; // Clean session flag
    props:          *mg_mqtt_prop; // MQTT5 props array
    num_props:      u64; // number of props
    will_props:     *mg_mqtt_prop; // Valid only for CONNECT packet (MQTT5)
    num_will_props: u64; // Number of will props
}

mg_mqtt_message :: struct {
    topic:       mg_str; // Parsed topic for PUBLISH
    data:        mg_str; // Parsed message for PUBLISH
    dgram:       mg_str; // Whole MQTT packet, including headers
    id:          u16; // For PUBACK, PUBREC, PUBREL, PUBCOMP, SUBACK, PUBLISH
    cmd:         u8; // MQTT command, one of MQTT_CMD_*
    qos:         u8; // Quality of service
    ack:         u8; // CONNACK return code, 0 = success
    props_start: u64; // Offset to the start of the properties (MQTT5)
    props_size:  u64; // Length of the properties
}

mg_mqtt_connect :: (unknown0: *mg_mgr, url: *u8, opts: *mg_mqtt_opts, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_mqtt_listen :: (mgr: *mg_mgr, url: *u8, fn: mg_event_handler_t, fn_data: *void) -> *mg_connection #foreign mongoose;

mg_mqtt_login :: (c: *mg_connection, opts: *mg_mqtt_opts) -> void #foreign mongoose;

mg_mqtt_pub :: (c: *mg_connection, opts: *mg_mqtt_opts) -> u16 #foreign mongoose;

mg_mqtt_sub :: (unknown0: *mg_connection, opts: *mg_mqtt_opts) -> void #foreign mongoose;

mg_mqtt_parse :: (unknown0: *u8, unknown1: u64, unknown2: u8, unknown3: *mg_mqtt_message) -> s32 #foreign mongoose;

mg_mqtt_send_header :: (unknown0: *mg_connection, cmd: u8, flags: u8, len: u32) -> void #foreign mongoose;

mg_mqtt_ping :: (unknown0: *mg_connection) -> void #foreign mongoose;

mg_mqtt_pong :: (unknown0: *mg_connection) -> void #foreign mongoose;

mg_mqtt_disconnect :: (unknown0: *mg_connection, unknown1: *mg_mqtt_opts) -> void #foreign mongoose;

mg_mqtt_next_prop :: (unknown0: *mg_mqtt_message, unknown1: *mg_mqtt_prop, ofs: u64) -> u64 #foreign mongoose;

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

mg_dns_parse :: (buf: *u8, len: u64, unknown0: *mg_dns_message) -> bool #foreign mongoose;

mg_dns_parse_rr :: (buf: *u8, len: u64, ofs: u64, is_question: bool, unknown0: *mg_dns_rr) -> u64 #foreign mongoose;

// Error return values - negative. Successful returns are >= 0
MG_JSON :: enum s32 {
    TOO_DEEP  :: -1;
    INVALID   :: -2;
    NOT_FOUND :: -3;
    MG_JSON_TOO_DEEP  :: TOO_DEEP;
    MG_JSON_INVALID   :: INVALID;
    MG_JSON_NOT_FOUND :: NOT_FOUND;
}

mg_json_get :: (json: mg_str, path: *u8, toklen: *s32) -> s32 #foreign mongoose;

mg_json_get_num :: (json: mg_str, path: *u8, v: *float64) -> bool #foreign mongoose;

mg_json_get_bool :: (json: mg_str, path: *u8, v: *bool) -> bool #foreign mongoose;

mg_json_get_long :: (json: mg_str, path: *u8, dflt: s32) -> s32 #foreign mongoose;

mg_json_get_str :: (json: mg_str, path: *u8) -> *u8 #foreign mongoose;

mg_json_get_hex :: (json: mg_str, path: *u8, len: *s32) -> *u8 #foreign mongoose;

mg_json_get_b64 :: (json: mg_str, path: *u8, len: *s32) -> *u8 #foreign mongoose;

mg_json_unescape :: (str: mg_str, buf: *u8, len: u64) -> bool #foreign mongoose;

// Iterate over object or array elements
mg_json_next :: (obj: mg_str, ofs: u64, key: *mg_str, val: *mg_str) -> u64 #foreign mongoose;

// JSON-RPC request descriptor
mg_rpc_req :: struct {
    head:     **mg_rpc; // RPC handlers list head
    rpc:      *mg_rpc; // RPC handler being called
    pfn:      mg_pfn_t; // Response printing function
    pfn_data: *void; // Response printing function data
    req_data: *void; // Arbitrary request data
    frame:    mg_str; // Request, e.g. {"id":1,"method":"add","params":[1,2]}
}

// JSON-RPC method handler
mg_rpc :: struct {
    next:    *mg_rpc; // Next in list
    method:  mg_str; // Method pattern
    fn:      #type (unknown0: *mg_rpc_req) -> void #c_call; // Handler function
    fn_data: *void; // Handler function argument
}

mg_rpc_add :: (head: **mg_rpc, method_pattern: mg_str, handler: #type (unknown0: *mg_rpc_req) -> void #c_call, handler_data: *void) -> void #foreign mongoose;

mg_rpc_del :: (head: **mg_rpc, handler: #type (unknown0: *mg_rpc_req) -> void #c_call) -> void #foreign mongoose;

mg_rpc_process :: (unknown0: *mg_rpc_req) -> void #foreign mongoose;

// Helper functions to print result or error frame
mg_rpc_ok_CFormat :: (unknown0: *mg_rpc_req, fmt: *u8, __args: ..Any) -> void #foreign mongoose "mg_rpc_ok";
mg_rpc_ok :: (unknown0: *mg_rpc_req, fmt: string, __args: ..Any) {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    mg_rpc_ok_CFormat(unknown0, "%s", formatted_text.data);
} @PrintLike

mg_rpc_vok :: (unknown0: *mg_rpc_req, fmt: *u8, ap: *va_list) -> void #foreign mongoose;

mg_rpc_err_CFormat :: (unknown0: *mg_rpc_req, code: s32, fmt: *u8, __args: ..Any) -> void #foreign mongoose "mg_rpc_err";
mg_rpc_err :: (unknown0: *mg_rpc_req, code: s32, fmt: string, __args: ..Any) {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, fmt, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    mg_rpc_err_CFormat(unknown0, code, "%s", formatted_text.data);
} @PrintLike

mg_rpc_verr :: (unknown0: *mg_rpc_req, code: s32, fmt: *u8, unknown1: *va_list) -> void #foreign mongoose;

mg_rpc_list :: (r: *mg_rpc_req) -> void #foreign mongoose;

// Firmware update API
mg_ota_begin :: (new_firmware_size: u64) -> bool #foreign mongoose;

mg_ota_write :: (buf: *void, len: u64) -> bool #foreign mongoose;

mg_ota_end :: () -> bool #foreign mongoose;

mg_phy :: struct {
    read_reg:  #type (addr: u8, reg: u8) -> u16 #c_call;
    write_reg: #type (addr: u8, reg: u8, value: u16) -> void #c_call;
}

// PHY configuration settings, bitmask
MG_PHY :: enum s32 {
    LEDS_ACTIVE_HIGH :: 1;

    CLOCKS_MAC       :: 2;

    MG_PHY_LEDS_ACTIVE_HIGH :: LEDS_ACTIVE_HIGH;

    MG_PHY_CLOCKS_MAC       :: CLOCKS_MAC;
}

MG_PHY_SPEED :: enum s32 {
    _10M   :: 0;
    _100M  :: 1;
    _1000M :: 2;
    MG_PHY_SPEED_10M   :: _10M;
    MG_PHY_SPEED_100M  :: _100M;
    MG_PHY_SPEED_1000M :: _1000M;
}

mg_phy_init :: (unknown0: *mg_phy, addr: u8, config: u8) -> void #foreign mongoose;

mg_phy_up :: (unknown0: *mg_phy, addr: u8, full_duplex: *bool, speed: *u8) -> bool #foreign mongoose;

dns_data :: struct {
    next:   *dns_data;
    c:      *mg_connection;
    expire: u64;
    txnid:  u16;
}

packed_file :: struct {
    data: *u8;
    size: u64;
    pos:  u64;
}

dirent :: struct {
    d_name: [260] u8;
}

win32_dir :: struct {
    handle: HANDLE;
    info:   WIN32_FIND_DATAW;
    result: dirent;
}

DIR :: win32_dir;

printdirentrydata :: struct {
    c:    *mg_connection;
    hm:   *mg_http_message;
    opts: *mg_http_serve_opts;
    dir:  *u8;
}

mg_mqtt_pmap :: struct {
    id:   u8;
    type: u8;
}

/* Copyright(c) By Steve Reid <steve@edmweb.com> */
/* 100% Public Domain */
char64long16 :: union {
    c: [64] u8;
    l: [16] u32;
}

usa :: union {
    sa:  sockaddr;
    sin: sockaddr_in;
}

limb_t :: u32;
dlimb_t :: u64;
sdlimb_t :: s64;

mg_fe :: [8] limb_t;

url :: struct {
    key:  u64;
    user: u64;
    pass: u64;
    host: u64;
    port: u64;
    uri:  u64;
    end:  u64;
}

ws_msg :: struct {
    flags:      u8;
    header_len: u64;
    data_len:   u64;
}

MG_PHY_1 :: enum s32 {
    KSZ8x   :: 34;
    DP83x   :: 8192;
    DP83867 :: 41521;
    DP83825 :: 41280;
    DP83848 :: 23714;
    LAN87x  :: 7;
    RTL8201 :: 28;

    MG_PHY_KSZ8x   :: KSZ8x;
    MG_PHY_DP83x   :: DP83x;
    MG_PHY_DP83867 :: DP83867;
    MG_PHY_DP83825 :: DP83825;
    MG_PHY_DP83848 :: DP83848;
    MG_PHY_LAN87x  :: LAN87x;
    MG_PHY_RTL8201 :: RTL8201;
}

MG_PHY_2 :: enum s32 {
    REG_BCR             :: 0;
    REG_BSR             :: 1;
    REG_ID1             :: 2;
    REG_ID2             :: 3;
    DP83x_REG_PHYSTS    :: 16;
    DP83867_REG_PHYSTS  :: 17;
    DP83x_REG_RCSR      :: 23;
    DP83x_REG_LEDCR     :: 24;
    KSZ8x_REG_PC1R      :: 30;
    KSZ8x_REG_PC2R      :: 31;
    LAN87x_REG_SCSR     :: 31;
    RTL8201_REG_RMSR    :: 16;
    RTL8201_REG_PAGESEL :: 31;

    MG_PHY_REG_BCR             :: REG_BCR;
    MG_PHY_REG_BSR             :: REG_BSR;
    MG_PHY_REG_ID1             :: REG_ID1;
    MG_PHY_REG_ID2             :: REG_ID2;
    MG_PHY_DP83x_REG_PHYSTS    :: DP83x_REG_PHYSTS;
    MG_PHY_DP83867_REG_PHYSTS  :: DP83867_REG_PHYSTS;
    MG_PHY_DP83x_REG_RCSR      :: DP83x_REG_RCSR;
    MG_PHY_DP83x_REG_LEDCR     :: DP83x_REG_LEDCR;
    MG_PHY_KSZ8x_REG_PC1R      :: KSZ8x_REG_PC1R;
    MG_PHY_KSZ8x_REG_PC2R      :: KSZ8x_REG_PC2R;
    MG_PHY_LAN87x_REG_SCSR     :: LAN87x_REG_SCSR;
    MG_PHY_RTL8201_REG_RMSR    :: RTL8201_REG_RMSR;
    MG_PHY_RTL8201_REG_PAGESEL :: RTL8201_REG_PAGESEL;
}

#scope_file

// only mostly sure about this
// I think linux is u32?
// SOCKET :: *void;

time_t :: s64;
va_list :: *void;

#import "Basic"; // For push_context
Socket :: #import "Socket";
SOCKET :: Socket.SOCKET;
sockaddr_in :: Socket.sockaddr_in;
sockaddr :: Socket.sockaddr;


#import "Windows";

mongoose :: #library "bin/win/mongoose";
