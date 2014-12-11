.PHONY: all hsc swig ffi

ROOT_DIR := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: hsc swig ffi

hsc:
	cabal clean
	cabal install -ffhsc --disable-library-for-ghci --disable-library-profiling --disable-shared
	hsc2hs -C '-I.' src/FFI/*.hsc src/FFI/Data/*/*.hsc

swig:
	cabal clean
	cabal install -fswig --disable-library-for-ghci --disable-library-profiling --disable-shared

ffi:
	cabal clean
	cabal install -fffi --libdir=$(ROOT_DIR)/ffi/lib --disable-library-for-ghci --disable-library-vanilla --enable-shared --disable-library-profiling
	rm a.out
	cp ffi/lib/*/api-apis*/*.so ffi/libAPI.so
	$(MAKE) -C ffi
