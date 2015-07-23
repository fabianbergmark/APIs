#include "lib/ghc.h"
#include <stdio.h>

static void my_enter(void) __attribute__((constructor));
static void my_enter(void)
{
  ghc_init();
}

static void my_exit(void) __attribute__((destructor));
static void my_exit(void)
{
  ghc_exit();
}
