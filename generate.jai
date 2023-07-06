#import "Bindings_Generator";
#import "Basic";
#import "File";
#import "String";
#import "BuildCpp";
#import "File_Utilities";

#run {
    using opts: Generate_Bindings_Options;
    array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);

    array_add(*libpaths, "bin/win");
    array_add(*libnames, "mongoose");
    // array_add(*include_paths, tprint("%mongoose/", #filepath));
    array_add(*source_files, tprint("%mongoose/mongoose.c", #filepath));
    array_add(*source_files, tprint("%mongoose/mongoose.h", #filepath));

    array_add(*extra_clang_arguments, "-Wno-error=implicit-int");
    array_add(*extra_clang_arguments, "-x", "c");
    generate_compile_time_struct_checks = false;

    array_add(*system_include_paths, "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\ucrt");
    array_add(*system_include_paths, "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\um");
    array_add(*system_include_paths, "C:\\Program Files (x86)\\Windows Kits\\10\\Include\\10.0.22621.0\\shared");
    array_add(*system_include_paths, "C:\\Program Files\\Microsoft Visual Studio\\2022\\Community\\VC\\Tools\\MSVC\\14.31.31103\\include");

    generate_bindings(opts, "module.jai");
}