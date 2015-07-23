.PHONY: all doc install uninstall clean

all:
	javac *.java
	mkdir -p se/fbergmark/apis
	cp *.class se/fbergmark/apis
	cp *.java se/fbergmark/apis
	jar cf apis.jar se

doc:
	javadoc -linksource -keywords -charset utf8 -d doc se.fbergmark.apis *.java

install:
	mkdir -p "$(DESTDIR)/usr/share/apis-java"
	cp apis.jar "$(DESTDIR)/usr/share/apis-java/apis.jar"

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
