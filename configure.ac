#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_CONFIG_MACRO_DIR([m4])
m4_include([m4/ax_jni_include_dir.m4])

AC_INIT(apis, 0.0.0, fabian.bergmark@gmail.com)
AM_INIT_AUTOMAKE

AC_PROG_CC
AC_PROG_CXX

AC_ENABLE_SHARED
AC_DISABLE_STATIC

LT_INIT

AX_JNI_INCLUDE_DIR

for JNI_INCLUDE_DIR in $JNI_INCLUDE_DIRS
do
        CPPFLAGS="$CPPFLAGS -I$JNI_INCLUDE_DIR"
done

AC_ARG_VAR(HOST_GHC, The host GHC compiler to use)
AC_SUBST([HOST_GHC], [${HOST_GHC:-ghc}])
AC_ARG_VAR(HOST_GHC_PACKAGE_DB, The host GHC package db to use)
AM_CONDITIONAL([HOST_GHC_PACKAGE_DB_SET], [test ! -z "$HOST_GHC_PACKAGE_DB"])

AC_ARG_VAR(TARGET_GHC, The target GHC compiler to use)
AC_SUBST([TARGET_GHC], [${TARGET_GHC:-ghc}])
AC_ARG_VAR(TARGET_GHC_PKG, The target ghc-pkg to use)
AC_SUBST([TARGET_GHC_PKG], [${TARGET_GHC_PKG:-ghc-pkg}])
AC_ARG_VAR(TARGET_HSC2HS, The target hsc2hs to use)
AC_SUBST([TARGET_HSC2HS], [${TARGET_HSC2HS:-hsc2hs}])
AC_ARG_VAR(TARGET_GHC_PACKAGE_DB, The target GHC package db to use)
AM_CONDITIONAL([TARGET_GHC_PACKAGE_DB_SET], [test ! -z "$TARGET_GHC_PACKAGE_DB"])

AC_ARG_ENABLE(th,
  [  --disable-th            Disable Template Haskell],
  [case "${enableval}" in
     yes | no ) TH="${enableval}" ;;
     *)  AC_MSG_ERROR(bad value ${enableval} for --disable-th) ;;
   esac],
  [TH="yes"]
)

AM_CONDITIONAL([TH], [test "x$TH" = "xyes"])

if test "x$TH" = "xyes"; then
    AC_DEFINE([TH], [], ["Use Template Haskell"])
    AC_MSG_NOTICE([Template Haskell will be used])
else
    AC_MSG_NOTICE([Template Haskell won't be used])
fi

AC_ARG_ENABLE(c,
  [  --enable-c              Enable C library generation],
  [case "${enableval}" in
     yes | no ) CLIB="${enableval}" ;;
     *)  AC_MSG_ERROR(bad value ${enableval} for --enable-c) ;;
   esac],
  [CLIB="no"]
)

AM_CONDITIONAL([CLIB], [test "x$CLIB" = "xyes"])

if test "x$CLIB" = "xyes"; then
    AC_DEFINE([CLIB], [], ["generate C library"])
    AC_MSG_NOTICE([C library will be generated])
else
    AC_MSG_NOTICE([C library won't be generated])
fi

AC_ARG_ENABLE(go,
  [  --enable-go             Enable Go library generation],
  [case "${enableval}" in
     yes | no ) GOLIB="${enableval}" ;;
     *)  AC_MSG_ERROR(bad value ${enableval} for --enable-go) ;;
   esac],
  [GOLIB="no"]
)

AM_CONDITIONAL([GOLIB], [test "x$GOLIB" = "xyes"])

if test "x$GOLIB" = "xyes"; then
    AC_DEFINE([GOLIB], [], ["generate Go library"])
    AC_MSG_NOTICE([Go library will be generated])
else
    AC_MSG_NOTICE([Go library won't be generated])
fi

AC_ARG_ENABLE(java,
  [  --enable-java           Enable Java library generation],
  [case "${enableval}" in
     yes | no ) JAVALIB="${enableval}" ;;
     *)  AC_MSG_ERROR(bad value ${enableval} for --enable-java) ;;
   esac],
  [JAVALIB="no"]
)

AM_CONDITIONAL([JAVALIB], [test "x$JAVALIB" = "xyes"])

if test "x$JAVALIB" = "xyes"; then
    AC_DEFINE([JAVALIB], [], ["generate Java library"])
    AC_MSG_NOTICE([Java library will be generated])
else
    AC_MSG_NOTICE([Java library won't be generated])
fi

AC_ARG_ENABLE(python2,
  [  --enable-python2        Enable Python2 library generation],
  [case "${enableval}" in
     yes | no ) PYTHON2LIB="${enableval}" ;;
     *)  AC_MSG_ERROR(bad value ${enableval} for --enable-python2) ;;
   esac],
  [PYTHON2LIB="no"]
)

AM_CONDITIONAL([PYTHON2LIB], [test "x$PYTHON2LIB" = "xyes"])

if test "x$PYTHON2LIB" = "xyes"; then
    AC_DEFINE([PYTHON2LIB], [], ["generate Python2 library"])
    AC_MSG_NOTICE([Python2 library will be generated])
else
    AC_MSG_NOTICE([Python2 library won't be generated])
fi

AC_ARG_ENABLE(python3,
  [  --enable-python3        Enable Python3 library generation],
  [case "${enableval}" in
     yes | no ) PYTHON3LIB="${enableval}" ;;
     *)  AC_MSG_ERROR(bad value ${enableval} for --enable-python3) ;;
   esac],
  [PYTHON3LIB="no"]
)

AM_CONDITIONAL([PYTHON3LIB], [test "x$PYTHON3LIB" = "xyes"])

if test "x$PYTHON3LIB" = "xyes"; then
    AC_DEFINE([PYTHON3LIB], [], ["generate Python3 library"])
    AC_MSG_NOTICE([Python3 library will be generated])
else
    AC_MSG_NOTICE([Python3 library won't be generated])
fi

AC_ARG_ENABLE(ruby,
  [  --enable-ruby           Enable Ruby library generation],
  [case "${enableval}" in
     yes | no ) RUBYLIB="${enableval}" ;;
     *)  AC_MSG_ERROR(bad value ${enableval} for --enable-ruby) ;;
   esac],
  [RUBYLIB="no"]
)

AM_CONDITIONAL([RUBYLIB], [test "x$RUBYLIB" = "xyes"])

if test "x$RUBYLIB" = "xyes"; then
    AC_DEFINE([RUBYLIB], [], ["generate Ruby library"])
    AC_MSG_NOTICE([Ruby library will be generated])
else
    AC_MSG_NOTICE([Ruby library won't be generated])
fi

AC_ARG_ENABLE(tcl,
  [  --enable-tcl            Enable Tcl library generation],
  [case "${enableval}" in
     yes | no ) TCLLIB="${enableval}" ;;
     *)  AC_MSG_ERROR(bad value ${enableval} for --enable-tcl) ;;
   esac],
  [TCLLIB="no"]
)

AM_CONDITIONAL([TCLLIB], [test "x$TCLLIB" = "xyes"])

if test "x$TCLLIB" = "xyes"; then
    AC_DEFINE([TCLLIB], [], ["generate Tcl library"])
    AC_MSG_NOTICE([Tcl library will be generated])
else
    AC_MSG_NOTICE([Tcl library won't be generated])
fi


AC_OUTPUT(Makefile)
