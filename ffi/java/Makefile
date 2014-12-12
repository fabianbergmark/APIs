.PHONY: all install uninstall clean

all:
	javac *.java

install:
	mkdir -p se/fbergmark/apis
	cp *.class se/fbergmark/apis
	jar cf APIs.jar se
	mkdir -p "$(DESTDIR)/usr/share/APIs-java"
	cp APIs.jar "$(DESTDIR)/usr/share/APIs-java/APIs.jar"

uninstall:

clean:
	rm -f Input*.java Input*.class
	rm -f Maybe*.java Maybe*.class
	rm -f Output*.java Output*.class
	rm -f Void.* YQLSettings.*
	rm -f APIs.* APIsJNI.*
	rm -f SWIGTYPE*
	rm -f ffi_java.cpp
	rm -f APIs.jar
	rm -rf se
