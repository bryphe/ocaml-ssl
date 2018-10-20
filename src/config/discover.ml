module C = Configurator.V1

let () =
    let libPath = Sys.getenv "LIBRESSL_LIB_PATH" in
    let includePath = Sys.getenv "LIBRESSL_INCLUDE_PATH" in

    let extraLibs = 
      match Sys.win32 with
      | true -> ["-lws2_32"; "-lwsock32"]
      | false -> ["-lpthread"]
    in

    let libs = ["-L" ^ libPath; "-lssl"; "-lcrypto"] @ extraLibs in
    let cflags = ["-I" ^ includePath] in

    C.Flags.write_sexp "c_library_flags.sexp" libs;
    C.Flags.write_sexp "c_flags.sexp" cflags;
