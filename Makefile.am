AUTOMAKE_OPTIONS = foreign subdir-objects
ACLOCAL_AMFLAGS = -I m4

SUFFIXES = .hs

HSCOMPILE = ghc
HSFLAGS = --make -fforce-recomp -dynamic -Wc,-shared -fPIC -isrc -odir build -hidir build -stubdir ffi/c/lib -hide-all-packages -package aeson -package containers -package base -package deepseq -package directory -package ecma262 -package exceptions -package filemanip -package filepath -package hslogger -package hxt -package mtl -package opendatatable -package split -package template-haskell -package text -package th-lift -package time -package transformers -package unordered-containers -package utf8-string -package yql
HSLIBDIR = $(shell ghc --print-libdir)
HSGHCVERSION = $(shell $(HSCOMPILE) --version | sed "s/[[a-zA-Z ,]*\([0-9.]*\)[a-zA-Z ]]*/\1/")

.hs.lo:
	$(LIBTOOL) --tag=$(HSCOMPILE) --mode=compile $(HSCOMPILE) $(HSFLAGS) $< -o $@

lib_LTLIBRARIES = libAPIs.la
libAPIs_la_SOURCES = src/TH/FFIs.hs ffi/c/bracket.c
libAPIs_la_CFLAGS = -Iffi -I$(HSLIBDIR)/include
libAPIsdir = $(libdir)
libAPIs_DATA = src/TH/.libs/FFIs.o
libAPIs_la_LDFLAGS = -Wl,-rpath,'$(libdir)',-rpath,'$(HSLIBDIR)/rts-1.0' -L$(HSLIBDIR)/rts-1.0 -lHSrts-ghc$(HSGHCVERSION)

# Java

lib_LTLIBRARIES += libAPIsJava.la
libAPIsJava_la_LIBADD = libAPIs.la
libAPIsJava_la_SOURCES = ffi/java/ffi_java.cpp
libAPIsJava_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib -I$(JNI_INCLUDE_DIRS) -I$(JNI_INCLUDE_DIRS)/linux
libAPIsJava_la_LDFLAGS = -Wl,-rpath,'$(libdir)',-rpath,'$(HSLIBDIR)/rts-1.0'

# Python2

PY2INCLUDES = $(shell python2-config --includes)

lib_LTLIBRARIES += libAPIsPython2.la
libAPIsPython2_la_LIBADD = libAPIs.la
libAPIsPython2_la_SOURCES = ffi/python2/ffi_python2.cpp
libAPIsPython2_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib $(PY2INCLUDES)
libAPIsPython2_la_LDFLAGS = -Wl,-rpath,'$(libdir)',-rpath,'$(HSLIBDIR)/rts-1.0'

# Python3

PY3INCLUDES = $(shell python3-config --includes)

lib_LTLIBRARIES += libAPIsPython3.la
libAPIsPython3_la_LIBADD = libAPIs.la
libAPIsPython3_la_SOURCES = ffi/python3/ffi_python3.cpp
libAPIsPython3_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib $(PY3INCLUDES)
libAPIsPython3_la_LDFLAGS = -Wl,-rpath,'$(libdir)',-rpath,'$(HSLIBDIR)/rts-1.0'

# Go

lib_LTLIBRARIES += libAPIsGo.la
libAPIsGo_la_LIBADD = libAPIs.la
libAPIsGo_la_SOURCES = ffi/go/ffi_go.cpp
libAPIsGo_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib
libAPIsGo_la_LDFLAGS = -Wl,-rpath,'$(libdir)',-rpath,'$(HSLIBDIR)/rts-1.0'

# Tcl

lib_LTLIBRARIES += libAPIsTcl.la
libAPIsTcl_la_LIBADD = libAPIs.la
libAPIsTcl_la_SOURCES = ffi/tcl/ffi_tcl.cpp
libAPIsTcl_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib
libAPIsTcl_la_LDFLAGS = -Wl,-rpath,'$(libdir)',-rpath,'$(HSLIBDIR)/rts-1.0'

.PHONY: preprocessor preprocessor-clean ffi ffi-install ffi-uninstalls ffi-clean packages packages-clean makepkg makepkg-clean all-clean

preprocessor:
	ghc -fforce-recomp -isrc -hidir build -odir build -stubdir ffi/c/lib src/TH/HSCs.hs src/TH/SWIGs.hs
	hsc2hs -C '-I.' src/FFI/*.hsc src/FFI/Data/*/*.hsc
	ghc -fforce-recomp -isrc -hidir build -odir build -stubdir ffi/c/lib src/TH/FFIs.hs
	$(MAKE) -C ffi swig

preprocessor-clean:
	rm -f ffi/c/lib/api.h
	rm -f ffi/c/lib/types.h
	rm -rf ffi/c/lib/Control/
	rm -rf ffi/c/lib/Data/
	rm -rf ffi/c/lib/FFI/
	rm -rf ffi/c/lib/Helper/
	rm -rf ffi/c/lib/TH/
	rm -f ffi/cpp/lib/api.hpp
	rm -f ffi/cpp/lib/types.hpp
	rm -f src/FFI/*.lo
	rm -f src/FFI/*.hs
	rm -f src/FFI/Data/*/*.hs
	rm -f src/FFI/Data/*/*.lo
	rm -f src/FFI/Types.hsc

ffi:
	$(MAKE) -C ffi

ffi-install:
	$(MAKE) -C ffi install $(DESTDIR)

ffi-uninstall:
	$(MAKE) -C ffi uninstall $(DESTDIR)

ffi-clean:
	$(MAKE) -C ffi clean $(DESTDIR)

packages: makepkg

packages-clean: makepkg-clean

makepkg:
	tar czf packages/makepkg/APIs.tar.gz compile configure configure.ac config.guess config.status config.sub depcomp LICENSE ltmain.sh Makefile.in Makefile.am install-sh missing apis/ m4/ src/ ffi/
	$(MAKE) -C packages/makepkg

makepkg-clean:
	$(MAKE) -C packages/makepkg clean

all-clean: preprocessor-clean clean ffi-clean packages-clean
