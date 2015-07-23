AUTOMAKE_OPTIONS = foreign subdir-objects
ACLOCAL_AMFLAGS = -I m4

SUFFIXES = .hs

HSPACKAGE_DB = -package-db=/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/package.conf.d

HSCOMPILE = arm-linux-androideabi-ghc
HSC2HS = arm-linux-androideabi-hsc2hs
HSFLAGS = $(HSPACKAGE_DB) -ibuild -isrc -fforce-recomp -odir build -hidir build -stubdir ffi/c/lib -hide-all-packages -package aeson -package containers -package base -package deepseq -package directory -package ecma262 -package exceptions -package filemanip -package filepath -package hslogger -package hxt -package mtl -package opendatatable -package split -package template-haskell -package text -package th-lift -package time -package transformers -package unordered-containers -package utf8-string -package yql
HSLIBDIR = $(shell ghc --print-libdir)
HSGHCVERSION = $(shell $(HSCOMPILE) --version | sed "s/[[a-zA-Z ,]*\([0-9.]*\)[a-zA-Z ]]*/\1/")

.hs.lo:
	$(HSCOMPILE) $(HSFLAGS) -c $<
	$(LIBTOOL) --tag=$(HSCOMPILE) --mode=compile $(HSCOMPILE) $(HSFLAGS) -c $< -o $@

HSRPATH = 
HSINCLUDES = -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/HUnit-1.2.5.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/SHA-1.6.4.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/StateVar-1.1.0.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/adjunctions-4.2.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/aeson-0.9.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/apis-0.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/asn1-encoding-0.9.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/asn1-parse-0.9.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/asn1-types-0.3.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/async-2.0.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/attoparsec-0.13.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/base-orphans-0.4.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/base64-bytestring-1.0.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/bifunctors-5 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/blaze-builder-0.4.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/byteable-0.1.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/case-insensitive-1.2.0.4 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/cereal-0.4.1.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/comonad-4.2.6 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/conduit-1.2.4.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/connection-0.2.5 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/contravariant-1.3.1.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/cookie-0.4.1.6 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/cryptohash-0.11.6 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/cryptonite-0.5 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/data-default-0.5.3 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/data-default-class-0.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/data-default-instances-base-0.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/data-default-instances-containers-0.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/data-default-instances-dlist-0.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/data-default-instances-old-locale-0.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/distributive-0.4.4 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/dlist-0.7.1.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/ecma262-0.0.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/exceptions-0.8.0.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/filemanip-0.3.6.3 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/free-4.12.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/hashable-1.2.3.3 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/hourglass-0.2.9 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/hslogger-1.2.9 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/http-client-0.4.16 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/http-client-tls-0.2.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/http-conduit-2.1.5.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/http-types-0.8.6 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/hxt-9.3.1.15 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/hxt-charproperties-9.2.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/hxt-regex-xmlschema-9.2.0.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/hxt-unicode-9.0.2.4 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/kan-extensions-4.2.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/lens-4.12.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/lifted-base-0.2.3.6 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/memory-0.7 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/mime-types-0.1.0.6 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/mmorph-1.0.4 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/monad-control-1.0.0.4 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/mtl-2.2.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/nats-1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/network-2.6.2.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/network-info-0.2.0.7 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/network-uri-2.6.0.3 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/opendatatable-0.0.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/parallel-3.2.0.6 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/parsec-3.1.9 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/pem-0.2.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/prelude-extras-0.4 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/primitive-0.6 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/profunctors-5.1.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/random-1.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/reflection-2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/resourcet-1.1.5 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/safe-0.3.9 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/scientific-0.3.3.8 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/semigroupoids-5.0.0.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/semigroups-0.16.2.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/socks-0.5.4 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/split-0.2.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/stm-2.4.4 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/streaming-commons-0.1.12.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/syb-0.5.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/tagged-0.8.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/text-1.2.1.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/th-lift-0.7.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/tls-1.3.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/transformers-0.4.3.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/transformers-base-0.4.4 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/transformers-compat-0.4.0.4 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/unix-compat-0.4.1.4 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/unordered-containers-0.2.5.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/uri-template-0.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/utf8-string-0.3.8 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/uuid-1.3.10 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/uuid-types-1.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/vector-0.11.0.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/void-0.7 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/x509-1.6.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/x509-store-1.6.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/x509-system-1.6.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/x509-validation-1.6.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/yql-0.0.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/.cabal/lib/arm-linux-android-ghc-7.8.3/zlib-0.6.1.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/arm-linux-androideabi/lib -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/array-0.5.0.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/base-4.7.0.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/binary-0.7.1.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/bytestring-0.10.4.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/containers-0.5.5.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/deepseq-1.3.0.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/directory-1.2.1.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/filepath-1.3.0.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/ghc-prim-0.3.1.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/integer-gmp-0.5.1.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/old-locale-1.0.0.6 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/pretty-1.1.1.1 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/process-1.2.0.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/rts-1.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/template-haskell-2.9.0.0 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/time-1.4.2 -L/opt/ghc/android-14/arm-linux-androideabi-4.8/lib/arm-unknown-linux-androideabi-ghc-7.8.3/unix-2.7.0.1

HSLIBS = -Wl,--start-group,-lCffi,-lHSHUnit-1.2.5.2,-lHSSHA-1.6.4.2,-lHSStateVar-1.1.0.0,-lHSadjunctions-4.2.1,-lHSaeson-0.9.0.1,-lHSapis-0.0.1,-lHSarray-0.5.0.0,-lHSasn1-encoding-0.9.0,-lHSasn1-parse-0.9.1,-lHSasn1-types-0.3.0,-lHSasync-2.0.2,-lHSattoparsec-0.13.0.1,-lHSbase-4.7.0.1,-lHSbase-orphans-0.4.0,-lHSbase64-bytestring-1.0.0.1,-lHSbifunctors-5,-lHSbinary-0.7.1.0,-lHSblaze-builder-0.4.0.1,-lHSbyteable-0.1.1,-lHSbytestring-0.10.4.0,-lHScase-insensitive-1.2.0.4,-lHScereal-0.4.1.1,-lHScomonad-4.2.6,-lHSconduit-1.2.4.2,-lHSconnection-0.2.5,-lHScontainers-0.5.5.1,-lHScontravariant-1.3.1.1,-lHScookie-0.4.1.6,-lHScryptohash-0.11.6,-lHScryptonite-0.5,-lHSdata-default-0.5.3,-lHSdata-default-class-0.0.1,-lHSdata-default-instances-base-0.0.1,-lHSdata-default-instances-containers-0.0.1,-lHSdata-default-instances-dlist-0.0.1,-lHSdata-default-instances-old-locale-0.0.1,-lHSdeepseq-1.3.0.2,-lHSdirectory-1.2.1.0,-lHSdistributive-0.4.4,-lHSdlist-0.7.1.1,-lHSecma262-0.0.0,-lHSexceptions-0.8.0.2,-lHSfilemanip-0.3.6.3,-lHSfilepath-1.3.0.2,-lHSfree-4.12.1,-lHSghc-prim-0.3.1.0,-lHShashable-1.2.3.3,-lHShourglass-0.2.9,-lHShslogger-1.2.9,-lHShttp-client-0.4.16,-lHShttp-client-tls-0.2.2,-lHShttp-conduit-2.1.5.1,-lHShttp-types-0.8.6,-lHShxt-9.3.1.15,-lHShxt-charproperties-9.2.0.1,-lHShxt-regex-xmlschema-9.2.0.2,-lHShxt-unicode-9.0.2.4,-lHSinteger-gmp-0.5.1.0,-lHSkan-extensions-4.2.2,-lHSlens-4.12.1,-lHSlifted-base-0.2.3.6,-lHSmemory-0.7,-lHSmime-types-0.1.0.6,-lHSmmorph-1.0.4,-lHSmonad-control-1.0.0.4,-lHSmtl-2.2.1,-lHSnats-1,-lHSnetwork-2.6.2.1,-lHSnetwork-info-0.2.0.7,-lHSnetwork-uri-2.6.0.3,-lHSold-locale-1.0.0.6,-lHSopendatatable-0.0.0,-lHSparallel-3.2.0.6,-lHSparsec-3.1.9,-lHSpem-0.2.2,-lHSprelude-extras-0.4,-lHSpretty-1.1.1.1,-lHSprimitive-0.6,-lHSprocess-1.2.0.0,-lHSprofunctors-5.1.1,-lHSrandom-1.1,-lHSreflection-2,-lHSresourcet-1.1.5,-lHSrts,-lHSsafe-0.3.9,-lHSscientific-0.3.3.8,-lHSsemigroupoids-5.0.0.2,-lHSsemigroups-0.16.2.2,-lHSsocks-0.5.4,-lHSsplit-0.2.2,-lHSstm-2.4.4,-lHSstreaming-commons-0.1.12.1,-lHSsyb-0.5.1,-lHStagged-0.8.1,-lHStemplate-haskell-2.9.0.0,-lHStext-1.2.1.1,-lHSth-lift-0.7.2,-lHStime-1.4.2,-lHStls-1.3.1,-lHStransformers-0.4.3.0,-lHStransformers-base-0.4.4,-lHStransformers-compat-0.4.0.4,-lHSunix-2.7.0.1,-lHSunix-compat-0.4.1.4,-lHSunordered-containers-0.2.5.1,-lHSuri-template-0.2,-lHSutf8-string-0.3.8,-lHSuuid-1.3.10,-lHSuuid-types-1.0.1,-lHSvector-0.11.0.0,-lHSvoid-0.7,-lHSx509-1.6.0,-lHSx509-store-1.6.0,-lHSx509-system-1.6.0,-lHSx509-validation-1.6.0,-lHSyql-0.0.0,-lHSzlib-0.6.1.1,-ldl,-ldl,-lgmp,-liconv,-lm,-lz,-lgcc,-lgnustl_shared,--end-group

HSLDFLAGS = -fPIC -Wl,--reduce-memory-overheads -Wl,--hash-size=31

lib_LTLIBRARIES =

noinst_LTLIBRARIES = libAPIs.la
libAPIs_la_SOURCES = src/Control/Monad/Trans/API.hs src/Data/JSON/Void.hs src/Data/JSON/SchemaNoTH.hs src/Data/State/YQL.hs src/Data/TH/API.hs src/Data/TH/FFI.hs src/Data/TH/YQL.hs src/Data/Settings/YQL.hs src/Data/TH/Convert.hs src/Helper/File.hs src/Helper/Name.hs src/FFI/Array.hs src/FFI/Data/Settings/YQL.hs src/Data/TH/Object.hs src/FFI/Maybe.hs src/FFI/Void.hs src/TH/API/Input.hs src/TH/API/Output.hs src/TH/API.hs src/TH/APIsNoTH.hs src/TH/YQL.hs src/TH/YQLsNoTH.hs src/FFI/Types.hs src/TH/FFI.hs src/TH/FFIsNoTH.hs ffi/c/bracket.c
libAPIs_la_CFLAGS = -Iffi -I$(HSLIBDIR)/include -DTABLES_NEXT_TO_CODE
#libAPIsdir = $(libdir)
libAPIs_la_LDFLAGS = -fno-stack-protector -Wl,-Bsymbolic $(HSLDFLAGS) $(HSRPATH) $(HSINCLUDES) $(HSLIBS) 

# C

lib_LTLIBRARIES += libAPIsC.la
libAPIsC_la_SOURCES = 
libAPIsC_la_LIBADD = libAPIs.la
libAPIsC_la_LDFLAGS = -fno-stack-protector -Wl,-Bsymbolic $(HSLDFLAGS) $(HSRPATH) $(HSINCLUDES) $(HSLIBS) 

# Go

#lib_LTLIBRARIES += libAPIsGo.la
#libAPIsGo_la_LIBADD = libAPIs.la
#libAPIsGo_la_SOURCES = ffi/go/ffi_go.cpp
#libAPIsGo_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib
#libAPIsGo_la_LDFLAGS = $(HSRPATH)

# Java

lib_LTLIBRARIES += libAPIsJava.la
libAPIsJava_la_LIBADD = libAPIs.la
libAPIsJava_la_SOURCES = ffi/java/ffi_java.cpp
libAPIsJava_la_CPPFLAGS = -I$(HSLIBDIR)/include -Iffi -Iffi/c/lib -Iffi/cpp/lib -I$(JNI_INCLUDE_DIRS) -I$(JNI_INCLUDE_DIRS)/linux
libAPIsJava_la_LDFLAGS = -fno-stack-protector -Wl,-Bsymbolic $(HSLDFLAGS) $(HSRPATH) $(HSINCLUDES) $(HSLIBS) 

# Python2

PY2INCLUDES = $(shell python2-config --includes)

#lib_LTLIBRARIES += libAPIsPython2.la
#libAPIsPython2_la_LIBADD = libAPIs.la
#libAPIsPython2_la_SOURCES = ffi/python2/ffi_python2.cpp
#libAPIsPython2_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib $(PY2INCLUDES)
#libAPIsPython2_la_LDFLAGS = -Wl,-rpath,'$(libdir)',-rpath,'$(HSLIBDIR)/rts' --no-allow-shlib-undefined --no-undefined

# Python3

PY3INCLUDES = $(shell python3-config --includes)

#lib_LTLIBRARIES += libAPIsPython3.la
#libAPIsPython3_la_LIBADD = libAPIs.la
#libAPIsPython3_la_SOURCES = ffi/python3/ffi_python3.cpp
#libAPIsPython3_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib $(PY3INCLUDES)
#libAPIsPython3_la_LDFLAGS = -Wl,-rpath,'$(libdir)',-rpath,'$(HSLIBDIR)/rts' --no-allow-shlib-undefined --no-undefined

# Ruby

#lib_LTLIBRARIES += libAPIsRuby.la
#libAPIsRuby_la_LIBADD = libAPIs.la
#libAPIsRuby_la_SOURCES = ffi/go/ffi_go.cpp
#libAPIsRuby_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib
#libAPIsRuby_la_LDFLAGS = -Wl,-rpath,'$(libdir)',-rpath,'$(HSLIBDIR)/rts' --no-allow-shlib-undefined --no-undefined

# Tcl

#lib_LTLIBRARIES += libAPIsTcl.la
#libAPIsTcl_la_LIBADD = libAPIs.la
#libAPIsTcl_la_SOURCES = ffi/tcl/ffi_tcl.cpp
#libAPIsTcl_la_CPPFLAGS = -Iffi -Iffi/c/lib -Iffi/cpp/lib
#libAPIsTcl_la_LDFLAGS = -Wl,-rpath,'$(libdir)',-rpath,'$(HSLIBDIR)/rts' --no-allow-shlib-undefined --no-undefined

.PHONY: preprocessor preprocessor-clean ffi ffi-install ffi-uninstalls ffi-clean packages packages-clean makepkg makepkg-clean all-clean

preprocessor:
	ghc -fforce-recomp -isrc -ibuild -hidir build -odir build -stubdir ffi/c/lib src/TH/HSCs.hs src/TH/SWIGs.hs
	$(HSC2HS) -C '-I.' src/FFI/*.hsc src/FFI/Data/*/*.hsc
	$(HSCOMPILE) $(HSPACKAGE_DB) -fforce-recomp -isrc -hidir build -odir build -stubdir ffi/c/lib src/TH/FFIsNoTH.hs
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
