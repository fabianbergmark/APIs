.PHONY: all install uninstall clean

all:

install:
	cp APIs.py APIs/APIs
	cp ../../.libs/libAPIsPython2.so APIs/APIs/_APIs.so
	cd APIs && python2 setup.py build --force
	cd APIs && python2 setup.py install --root="$(DESTDIR)/" --optimize=1

uninstall:

clean:
	rm -f ffi_python2.cpp
	rm -f APIs.py APIs.pyc
	rm -rf __pycache__/
	rm -f APIs/APIs/_APIs.so
	rm -f APIs/APIs/APIs.py
	rm -rf APIs.egg-info/
	cd APIs && python2 setup.py clean --all
