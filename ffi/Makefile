.PHONY: all go java python tcl samples clean

all: go java python tcl samples

go:
	mkdir -p go
	swig -c++ -go -intgosize 64 -gccgo -Wall -O -o go/ffi_go.c -outdir go/ ffi.i
	$(MAKE) -C go

java:
	mkdir -p java
	swig -c++ -java -package se.fbergmark.apis -Wall -O -o java/ffi_java.c -outdir java/ ffi.i
	$(MAKE) -C java

python:
	mkdir -p python
	swig -c++ -python  -Wall -o python/ffi_python.c -outdir python/ ffi.i
	$(MAKE) -C python

tcl:
	mkdir -p tcl
	swig -c++ -tcl -Wall -O -o tcl/ffi_tcl.c -outdir tcl/ ffi.i
	$(MAKE) -C tcl

samples:
	$(MAKE) -C samples

clean:
	$(MAKE) -C go clean
	$(MAKE) -C java clean
	$(MAKE) -C python clean
	$(MAKE) -C tcl clean
