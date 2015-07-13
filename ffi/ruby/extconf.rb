require 'mkmf'
$libs = append_library($libs, "lAPIsRuby")
create_makefile('apis')

open("Makefile", "a") { |mf|
  mf.write("INCFLAGS += -I.. -I../cpp/lib -I../c/lib\n")
  mf.write("\n")
  mf.write("install-gem:\n")
  mf.write("\tcp apis.so apis/lib/apis/apis.so\n")
  mf.write("\tgem build apis.gem\n")
  mf.write("\tgem install apis-*.gem\n")
  mf.write("doc:\n")
  mf.write("\trdoc -o doc ffi_ruby.cpp\n")
}

File.write("Makefile",File.open("Makefile",&:read).gsub("dldflags = ","dldflags = -Wl,-no-as-needed,-rpath,'/usr/local/lib'"))
