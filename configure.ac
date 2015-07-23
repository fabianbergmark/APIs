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

AC_OUTPUT(Makefile)
