all:
	g++ --std=c++11 -O3 -fPIC -shared ffi_tcl.c -L.. -I ../c/lib -I ../cpp/lib -I /usr/lib/ghc-7.8.3/include -Wl,-rpath,'/usr/lib/ghc-7.8.3/rts-1.0',-rpath,'/home/fabian/.cabal/lib/x86_64-linux-ghc-7.8.3/api-apis-0.0.0' -lAPI -o _API.so
