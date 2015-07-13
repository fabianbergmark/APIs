.PHONY: all doc install uninstall clean

all:
	javac *.java

doc:
	javadoc -linksource -keywords -charset utf8 -d doc se.fbergmark.apis *.java

install:
	mkdir -p se/fbergmark/apis
	cp *.class se/fbergmark/apis
	jar cf apis.jar se
	mkdir -p "$(DESTDIR)/usr/share/apis-java"
	cp APIs.jar "$(DESTDIR)/usr/share/apis-java/apis.jar"

uninstall:

clean:
	rm -f Input*.java Input*.class
	rm -f Maybe*.java Maybe*.class
	rm -f Output*.java Output*.class
	rm -f Void.* YQLSettings.*
	rm -f apis.* apisJNI.*
	rm -f SWIGTYPE*
	rm -f ffi_java.cpp
	rm -f apis.jar
	rm -rf se
