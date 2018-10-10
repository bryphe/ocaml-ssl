module C = Configurator.V1

let libPath = Sys.getenv "OPENSSL_LIB_PATH";
let includePath = Sys.getenv "OPENSSL_INCLUDE_PATH";

let libs = ["-L" ^ libPath; "-lssl"; "-lcrypto"]; in
let cflags = ["-I" ^ includePath];

C.Flags.write_sexp "c_library_flags.sexp" libs;
C.Flags.write_sexp "c_flags.sexp" cflags;
