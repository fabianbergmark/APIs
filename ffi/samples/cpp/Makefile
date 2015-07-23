.PHONY: all clean

HSLIBDIR = $(shell ghc --print-libdir)

all:
	arm-linux-androideabi-g++ -I../../cpp/lib/ -I../../c/lib/ -I../.. -I$(HSLIBDIR)/include main.cpp -L/opt/ghc/android-14/arm-linux-androideabi-4.8/sysroot/usr/local/lib -lz -lgnustl_shared -lAPIsC -pie -fPIE -o main

clean:
	rm main
