.PHONY: all install uninstall clean

all:

install:
	cp APIs.py APIs/APIs
	cp ../../.libs/libAPIsPython3.so APIs/APIs/_APIs.so
	cd APIs && python3 setup.py build --force
	cd APIs && python3 setup.py install --root="$(DESTDIR)/" --optimize=1

uninstall:

clean:
	rm -f ffi_python3.cpp
	rm -f APIs.py APIs.pyc
	rm -rf __pycache__/
	rm -f APIs/APIs/_APIs.so
	rm -f APIs/APIs/APIs.py
	rm -rf APIs/APIs.egg-info/
	cd APIs && python3 setup.py clean --all
