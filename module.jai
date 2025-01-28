
#if OS == .WINDOWS {
    #load "module_windows.jai";
} else #if OS == .LINUX {
    #load "module_linux.jai";
} else {
    #assert false "Unsupported mongoose OS.\n";
}

mg_listening_bit :: enum_flags u32 {
    is_client :: 1 << 31;
    is_accepted :: 1 << 30;
    is_resolving :: 1 << 29;
    is_arplooking :: 1 << 29;
    is_connecting :: 1 << 27;
    is_tls :: 1 << 26;
    is_tls_hs :: 1 << 25;
    is_udp :: 1 << 24;
    is_websocket :: 1 << 23;
    is_mqtt5 :: 1 << 22;
    is_hexdumping :: 1 << 21;
    is_draining :: 1 << 20;
    is_closing :: 1 << 19;
    is_full :: 1 << 18;
    is_resp :: 1 << 17;
    is_readable :: 1 << 16;
    is_writable :: 1 << 15;
    is_io_err :: 1 << 14;
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
