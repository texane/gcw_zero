#!/usr/bin/env sh

GCWZ_TOOLCHAIN=$HOME/repo/gcw_zero/toolchain/gcw0-toolchain
CROSS_COMPILE=$GCWZ_TOOLCHAIN/usr/bin/mipsel-gcw0-linux-uclibc-

export LD_LIBRARY_PATH=$GCWZ_TOOLCHAIN/usr/lib
export PKGCONFIG_PATH=$GCWZ_TOOLCHAIN/usr/mipsel-gcw0-linux-uclibc/sysroot/usr/lib/pkgconfig
export PATH=$PATH:$GCWZ_TOOLCHAIN/usr/bin

make -f Makefile.dingux