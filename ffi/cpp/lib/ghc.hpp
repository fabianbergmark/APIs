#include <HsFFI.h>
#include <Rts.h>
#include <stdio.h>

void ghc_init() 
{
  printf("ghc_init\n");
  static char *argv[] = { "", 0 }, **argv_ = argv;
  static int argc = 1;
#if __GLASGOW_HASKELL__ >= 703
  {
    RtsConfig conf = defaultRtsConfig;
    conf.rts_opts_enabled = RtsOptsAll;
    hs_init_ghc(&argc, &argv_, conf);
  }
#else
  hs_init(&argc, &argv_);
#endif
}

void ghc_exit() {
  hs_exit();
}
