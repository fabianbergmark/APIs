#include <HsFFI.h>
#include <Rts.h>

static void my_enter(void) __attribute__((constructor));
static void my_enter(void)
{
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

static void my_exit(void) __attribute__((destructor));
static void my_exit(void)
{
}
