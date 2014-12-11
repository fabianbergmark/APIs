.PHONY: all go java python tcl

all: go java python tcl

go:
	mkdir -p go
	swig -c++ -go -intgosize 64 -gccgo -Wall -O -o go/ffi_go.c -outdir go/ ffi.i
	$(MAKE) -C go

java:
	mkdir -p java
	swig -c++ -java -Wall -O -o java/ffi_java.c -outdir java/ ffi.i
	$(MAKE) -C java

python:
	mkdir -p python
	swig -c++ -python -builtin -O -Wall -o python/ffi_python.c -outdir python/ ffi.i
	$(MAKE) -C python

tcl:
	mkdir -p tcl
	swig -c++ -tcl -Wall -O -o tcl/ffi_tcl.c -outdir tcl/ ffi.i
	$(MAKE) -C tcl
