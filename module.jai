
#if OS == .WINDOWS {
    #load "module_windows.jai";
} else #if OS == .LINUX {
    #load "module_linux.jai";
} else {
    #assert false "Unsupported mongoose OS.\n";
}

mg_listening_bit :: enum_flags u32 {
    is_listening :: 1 << 0;
    is_client :: 1 << 1;
    is_accepted :: 1 << 2;
    is_resolving :: 1 << 3;
    is_arplooking :: 1 << 4;
    is_connecting :: 1 << 5;
    is_tls :: 1 << 6;
    is_tls_hs :: 1 << 7;
    is_udp :: 1 << 8;
    is_websocket :: 1 << 9;
    is_mqtt5 :: 1 << 10;
    is_hexdumping :: 1 << 11;
    is_draining :: 1 << 12;
    is_closing :: 1 << 13;
    is_full :: 1 << 14;
    is_resp :: 1 << 15;
    is_readable :: 1 << 16;
    is_writable :: 1 << 17;
    is_io_err :: 1 << 18;
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
