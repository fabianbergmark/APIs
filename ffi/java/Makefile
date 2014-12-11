.PHONY: clean

all:
	g++ --std=c++11 -O3 -fPIC -shared ffi_java.c -L.. -I ../c/lib -I ../cpp/lib -I /usr/lib/ghc-7.8.3/include -I /usr/lib/jvm/java-7-openjdk/include -I /usr/lib/jvm/java-7-openjdk/include/linux -Wl,-rpath,'/usr/lib/ghc-7.8.3/rts-1.0',-rpath,'/home/fabian/.cabal/lib/x86_64-linux-ghc-7.8.3/api-apis-0.0.0' -lAPI -o API.so
	javac *.java
	mkdir -p se/fbergmark/apis
	cp *.class se/fbergmark/apis
	jar cf APIs.jar se

clean:
	rm -f Input*.java Input*.class
	rm -f Maybe*.java Maybe*.class
	rm -f Output*.java Output*.class
	rm -f Void.* YQLSettings.*
	rm -f API.java API.class APIJNI.*
	rm -f SWIGTYPE*
	rm -f ffi_java.c API.so
	rm APIs.jar
