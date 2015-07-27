.PHONY: all swig go go-swig java java-swig java-swig-clean python python-swig python-swig-clean python2 python2-swig python2-swig-clean python3 python3-swig python3-swig-clean ruby ruby-swig ruby-swig-clean tcl tcl-swig tcl-swig-clean samples install uninstall clean

all: swig go java python ruby tcl

swig: go-swig java-swig python-swig ruby-swig tcl-swig

swig-clean: go-swig-clean java-swig-clean python-swig-clean ruby-swig-clean tcl-swig-clean

go-swig:
	mkdir -p go
	swig -c++ -go -intgosize 64 -gccgo -Wall -O -o go/ffi_go.cpp -outdir go/ ffi.i

go-swig-clean:
	rm -rf go/ffi_go.cpp

go:
	$(MAKE) -C go

java-swig:
	mkdir -p java
	swig -c++ -java -package se.fbergmark.apis -Wall -O -o java/ffi_java.cpp -outdir java/ ffi.i

java-swig-clean:
	rm -rf java/ffi_java.cpp

java:
	$(MAKE) -C java

python-swig: python2-swig python3-swig

python-swig-clean: python2-swig-clean python3-swig-clean

python: python2 python3

python2-swig:
	mkdir -p python2
	swig -c++ -python -builtin -O -Wall -o python2/ffi_python2.cpp -outdir python2/ ffi.i

python2-swig-clean:
	rm -rf python2/ffi_python2.cpp

python2:
	$(MAKE) -C python2

python3-swig:
	mkdir -p python3
	swig -c++ -python -builtin -O -py3 -Wall -o python3/ffi_python3.cpp -outdir python3/ ffi.i

python3-swig-clean:
	rm -rf python3/ffi_python3.cpp

python3:
	$(MAKE) -C python3

ruby-swig:
	mkdir -p ruby
	swig -c++ -ruby -autorename -O -Wall -o ruby/ffi_ruby.cpp -outdir ruby/ ffi.i

ruby-swig-clean:
	rm -rf ruby/ffi_ruby.cpp

ruby:
	$(MAKE) -C ruby

tcl-swig:
	mkdir -p tcl
	swig -c++ -tcl -Wall -O -o tcl/ffi_tcl.cpp -outdir tcl/ ffi.i

tcl-swig-clean:
	rm -rf tcl/ffi_tcl.cpp

tcl:
	$(MAKE) -C tcl

install:
	$(MAKE) -C go install
	$(MAKE) -C java install
	$(MAKE) -C python2 install
	$(MAKE) -C python3 install
	$(MAKE) -C ruby install
	$(MAKE) -C tcl install

uninstall:
	$(MAKE) -C go uninstall
	$(MAKE) -C java uninstall
	$(MAKE) -C python2 uninstall
	$(MAKE) -C python3 uninstall
	$(MAKE) -C ruby uninstall
	$(MAKE) -C tcl uninstall

clean:
	$(MAKE) -C go clean
	$(MAKE) -C java clean
	$(MAKE) -C python2 clean
	$(MAKE) -C python3 clean
	$(MAKE) -C ruby clean
	$(MAKE) -C tcl clean

samples:
	$(MAKE) -C samples
