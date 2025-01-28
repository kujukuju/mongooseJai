#import "Bindings_Generator";
#import "Basic";
#import "File";
#import "String";
#import "BuildCpp";
#import "File_Utilities";

#run {
    using opts: Generate_Bindings_Options;
    array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);

    #if OS == .WINDOWS {
        array_add(*libpaths, "bin/win");
        array_add(*libnames, "mongoose");
    } else #if OS == .LINUX {
        array_add(*libpaths, "bin/linux");
        array_add(*libnames, "libmongoose");
    } else {
        #assert false "Unknown OS.\n";
    }

    array_add(*include_paths, tprint("%mongoose/", #filepath));
    array_add(*include_paths, tprint("%mongoose/mongoose-7.16/", #filepath));

    // array_add(*include_paths, tprint("%mongoose/", #filepath));
    array_add(*source_files, tprint("%mongoose/mongoose-7.16/mongoose.c", #filepath));
    array_add(*source_files, tprint("%mongoose/mongoose-7.16/mongoose.h", #filepath));
    array_add(*source_files, tprint("%mongoose/helper.c", #filepath));
    array_add(*source_files, tprint("%mongoose/helper.h", #filepath));

    array_add(*extra_clang_arguments, "-Wno-error=implicit-int -DMG_ENABLE_OPENSSL=1 -lssl -lcrypto");
    array_add(*extra_clang_arguments, "-x", "c");
    generate_compile_time_struct_checks = false;

    #if OS == .WINDOWS {
        array_add(*system_include_paths, "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt");
        array_add(*system_include_paths, "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\um");
        array_add(*system_include_paths, "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\shared");
        array_add(*system_include_paths, "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.31.31103\\include");
    }

    #if OS == .WINDOWS {
        footer = #string ___jai
time_t :: s64;
va_list :: *void;

Socket :: #import "Socket";
SOCKET :: Socket.SOCKET;
sockaddr_in :: Socket.sockaddr_in;
sockaddr :: Socket.sockaddr;

#import "Windows";
        ___jai

        generate_bindings(opts, "module_windows.jai");
    } else #if OS == .LINUX {
        footer = #string ___jai
        ___jai

        generate_bindings(opts, "module_linux.jai");
    }
}