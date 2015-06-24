require 'mkmf'
create_makefile('apis')

open("Makefile", "a") { |mf|
  mf.write("INCFLAGS += -I.. -I../cpp/lib -I../c/lib\n")
  mf.write("LIBS += -lAPIsRuby\n")
}
