AUTOMAKE_OPTIONS = foreign subdir-objects
ACLOCAL_AMFLAGS = -I m4

if HOST_GHC_PACKAGE_DB_SET
HOST_GHC_PACKAGE_DB_FLAG=-package-db=$(HOST_GHC_PACKAGE_DB)
else
HOST_GHC_PACKAGE_DB_FLAG=
endif

if TARGET_GHC_PACKAGE_DB_SET
TARGET_GHC_PACKAGE_DB_FLAG=-package-db=$(TARGET_GHC_PACKAGE_DB)
else
TARGET_GHC_PACKAGE_DB_FLAG=
endif

SUFFIXES = .hs

TARGET_GHC_LIBDIR = $(shell $(TARGET_GHC) --print-libdir)

GHC_LIBS = HUnit SHA StateVar adjunctions aeson apis array asn1-encoding asn1-parse asn1-types async attoparsec base base-orphans base64-bytestring bifunctors binary blaze-builder byteable bytestring case-insensitive cereal comonad conduit connection containers contravariant cookie cryptohash cryptonite data-default data-default-class data-default-instances-base data-default-instances-containers data-default-instances-dlist data-default-instances-old-locale deepseq directory distributive dlist ecma262 exceptions filepath free ghc-prim hashable hourglass hslogger http-client http-client-tls http-conduit http-types hxt hxt-charproperties hxt-regex-xmlschema hxt-unicode integer-gmp kan-extensions lens lifted-base memory mime-types mmorph monad-control mtl nats network network-info network-uri old-locale opendatatable parallel parsec pem prelude-extras pretty primitive process profunctors random reflection resourcet rts safe scientific semigroupoids semigroups socks stm streaming-commons syb tagged template-haskell text time tls transformers transformers-base transformers-compat unix unordered-containers uri-template utf8-string uuid uuid-types vector void x509 x509-store x509-system x509-validation yql zlib

if TH
GHC_LIBS += th-lift filemanip split
endif

GHC_PACKAGES = $(foreach l, $(GHC_LIBS),-package $l)

GHC_LIB_LINKS = $(foreach a, $(foreach l, $(GHC_LIBS),$(shell $(TARGET_GHC_PKG) field $l hs-libraries --user-package-db=$(TARGET_GHC_PACKAGE_DB) --expand-pkgroot --expand-env-vars | sed -r 's/^.{14}/-l/')), $(a)-ghc7.10.1)

GHC_LIB_RPATHS = $(foreach l, $(GHC_LIBS), $(shell $(TARGET_GHC_PKG) field $l library-dirs --user-package-db=$(TARGET_GHC_PACKAGE_DB) --expand-pkgroot --expand-env-vars | sed -r 's/^.{14}/-rpath /'))

GHC_LIB_RPATHS_GROUP = $(shell echo $(GHC_LIB_RPATHS) | sed -r 's/ /,/g')

GHC_LIB_LINKS_GROUP = $(shell echo $(GHC_LIB_LINKS) | sed -r 's/ /,/g')

GHC_LIB_INCLUDES = $(foreach l, $(GHC_LIBS), $(shell $(TARGET_GHC_PKG) field $l library-dirs --user-package-db=$(TARGET_GHC_PACKAGE_DB) --expand-pkgroot --expand-env-vars | sed -r 's/^.{14}/-L/'))

TARGET_GHC_FLAGS = $(TARGET_GHC_PACKAGE_DB_FLAG) -ibuild -isrc -fforce-recomp -dynamic -fPIC -DPIC -odir build -hidir build -stubdir ffi/c/lib -hide-all-packages $(GHC_PACKAGES)

HOST_GHC_FLAGS = $(HOST_GHC_PACKAGE_DB_FLAG) -ibuild -isrc -fforce-recomp -odir build -hidir build -stubdir ffi/c/lib -hide-all-packages $(GHC_PACKAGES)

.hs.lo:
	$(TARGET_GHC) $(TARGET_GHC_FLAGS) -c $<
	$(LIBTOOL) --tag=$(TARGET_GHC) --mode=compile $(TARGET_GHC) $(TARGET_GHC_FLAGS) -c $< -o $@

GHC_LDFLAGS = $(GHC_LIB_INCLUDES) -fno-stack-protector -Wl,-Bsymbolic,--reduce-memory-overheads,--hash-size=31,--start-group,$(GHC_LIB_RPATHS_GROUP),$(GHC_LIB_LINKS_GROUP),-ldl,-lgmp,-lm,-lz,--end-group

noinst_LTLIBRARIES = libAPIs.la
if TH
libAPIs_la_SOURCES = src/Control/Monad/Trans/API.hs src/Data/JSON/Void.hs src/Data/JSON/Schema.hs src/Data/State/YQL.hs src/Data/TH/API.hs src/Data/TH/FFI.hs src/Data/TH/YQL.hs src/Data/Settings/YQL.hs src/Data/TH/Convert.hs src/Helper/File.hs src/Helper/Name.hs src/FFI/Array.hs src/FFI/Data/Settings/YQL.hs src/Data/TH/Object.hs src/FFI/Maybe.hs src/FFI/Void.hs src/TH/API/Input.hs src/TH/API/Output.hs src/TH/API.hs src/TH/APIs.hs src/TH/YQL.hs src/TH/YQLs.hs src/FFI/Types.hs src/TH/FFI.hs src/TH/FFIs.hs ffi/c/bracket.c
else
libAPIs_la_SOURCES = src/Control/Monad/Trans/API.hs src/Data/JSON/Void.hs src/Data/JSON/SchemaNoTH.hs src/Data/State/YQL.hs src/Data/Settings/YQLNoTH.hs src/Data/TH/Convert.hs src/FFI/Array.hs src/FFI/Data/Settings/YQLNoTH.hs src/Data/TH/Object.hs src/FFI/Maybe.hs src/FFI/Void.hs src/TH/APIsNoTH.hs src/TH/YQLsNoTH.hs src/FFI/TypesNoTH.hs src/TH/FFIsNoTH.hs ffi/c/bracket.c
endif
libAPIs_la_CFLAGS = -Iffi -I$(TARGET_GHC_LIBDIR)/include -DTABLES_NEXT_TO_CODE
libAPIs_la_LDFLAGS = $(GHC_LDFLAGS)

lib_LTLIBRARIES =

# C

if CLIB
lib_LTLIBRARIES += libAPIsC.la
libAPIsC_la_SOURCES =
libAPIsC_la_LIBADD = libAPIs.la
libAPIsC_la_LDFLAGS = $(GHC_LDFLAGS)
endif

# Go

if GOLIB
lib_LTLIBRARIES += libAPIsGo.la
libAPIsGo_la_LIBADD = libAPIs.la
libAPIsGo_la_SOURCES = ffi/go/ffi_go.cpp
libAPIsGo_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib
libAPIsGo_la_LDFLAGS = $(GHC_LDFLAGS)
endif

# Java

if JAVALIB
lib_LTLIBRARIES += libAPIsJava.la
libAPIsJava_la_LIBADD = libAPIs.la
libAPIsJava_la_SOURCES = ffi/java/ffi_java.cpp
libAPIsJava_la_CPPFLAGS = -I$(TARGET_GHC_LIBDIR)/include -Iffi -Iffi/c/lib -Iffi/cpp/lib -I$(JNI_INCLUDE_DIRS) -I$(JNI_INCLUDE_DIRS)/linux
libAPIsJava_la_LDFLAGS = $(GHC_LDFLAGS)
endif

# Python2

if PYTHON2LIB
PY2INCLUDES = $(shell python2-config --includes)

lib_LTLIBRARIES += libAPIsPython2.la
libAPIsPython2_la_LIBADD = libAPIs.la
libAPIsPython2_la_SOURCES = ffi/python2/ffi_python2.cpp
libAPIsPython2_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib $(PY2INCLUDES)
libAPIsPython2_la_LDFLAGS = $(GHC_LDFLAGS)
endif

# Python3

if PYTHON3LIB
PY3INCLUDES = $(shell python3-config --includes)

lib_LTLIBRARIES += libAPIsPython3.la
libAPIsPython3_la_LIBADD = libAPIs.la
libAPIsPython3_la_SOURCES = ffi/python3/ffi_python3.cpp
libAPIsPython3_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib $(PY3INCLUDES)
libAPIsPython3_la_LDFLAGS = $(GHC_LDFLAGS)
endif

# Ruby

if RUBYLIB
lib_LTLIBRARIES += libAPIsRuby.la
libAPIsRuby_la_LIBADD = libAPIs.la
libAPIsRuby_la_SOURCES = ffi/go/ffi_go.cpp
libAPIsRuby_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib
libAPIsRuby_la_LDFLAGS = $(GHC_LDFLAGS)
endif

# Tcl

if TCLLIB
lib_LTLIBRARIES += libAPIsTcl.la
libAPIsTcl_la_LIBADD = libAPIs.la
libAPIsTcl_la_SOURCES = ffi/tcl/ffi_tcl.cpp
libAPIsTcl_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib
libAPIsTcl_la_LDFLAGS = $(GHC_LDFLAGS)
endif

.PHONY: preprocessor preprocessor-clean ffi ffi-install ffi-uninstalls ffi-clean packages packages-clean makepkg makepkg-clean all-clean

preprocessor:
	$(HOST_GHC) $(HOST_GHC_PACKAGE_DB_FLAG) -fforce-recomp -isrc -ibuild -hidir build -odir build -stubdir ffi/c/lib src/TH/HSCs.hs src/TH/SWIGs.hs
	$(TARGET_HSC2HS) -C '-I.' src/FFI/*.hsc src/FFI/Data/*/*.hsc
	$(HOST_GHC) $(HOST_GHC_FLAGS) -fforce-recomp -isrc -hidir build -odir build -stubdir ffi/c/lib src/TH/FFIs.hs

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
	$(MAKE) -C ffi swig-clean

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
