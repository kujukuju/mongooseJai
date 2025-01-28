
#if OS == .WINDOWS {
    #load "module_windows.jai";
} else #if OS == .LINUX {
    #load "module_linux.jai";
} else {
    #assert false "Unsupported mongoose OS.\n";
}

mg_listening_bit :: enum_flags u32 {
    is_client :: 1;
    is_accepted;
    is_resolving;
    is_arplooking;
    is_connecting;
    is_tls;
    is_tls_hs;
    is_udp;
    is_websocket;
    is_mqtt5;
    is_hexdumping;
    is_draining;
    is_closing;
    is_full;
    is_resp;
    is_readable;
    is_writable;
    is_io_err;
}

get_connection_state :: (connection: *mg_connection, listening_bit: mg_listening_bit) -> bool {
    return !!(connection.is_listening & cast(u32) listening_bit);
}

set_connection_state :: (connection: *mg_connection, listening_bit: mg_listening_bit, value: bool) {
    if value {
        connection.is_listening |= cast(u32) listening_bit;
    } else {
        connection.is_listening &= ~cast(u32) listening_bit;
    }
}
