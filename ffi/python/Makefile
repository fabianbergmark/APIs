.PHONY: clean

all:
	g++ --std=c++11 -O3 -fPIC -shared ffi_python.c -L.. -I ../c/lib -I ../cpp/lib -I /usr/lib/ghc-7.8.3/include -I /usr/include/python2.7 -Wl,-rpath,'/usr/lib/ghc-7.8.3/rts-1.0',-rpath,'/home/fabian/.cabal/lib/x86_64-linux-ghc-7.8.3/api-apis-0.0.0' -lAPI -o _API.so
	cp API.py APIs/APIs
	cp _API.so APIs/APIs
	cd APIs && sudo python2 setup.py install --force

clean:
	rm -f ffi_python.c
	rm -f _API.so
	rm -f API.py API.pyc
	rm -rf __pycache__
	cd APIs && sudo python2 setup.py clean --all
