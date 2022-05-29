#!/bin/bash
set -e

##
# Pre-requirements:
# - env TARGET: path to target work dir
# - env OUT: path to directory where artifacts are stored
# - env CC, CXX, FLAGS, LIBS, etc...
##

if [ ! -d "$TARGET/repo" ]; then
    echo "fetch.sh must be executed first."
    exit 1
fi

# build the libpng library
cd "$TARGET/repo"
autoreconf -f -i
./configure --with-libpng-prefix=MAGMA_ --disable-shared
CC=$(CC) CXX=$(CXX) make -j$(nproc) clean
CC=$(CC) CXX=$(CXX) make -j$(nproc) libpng16.la

cp .libs/libpng16.a "$OUT/"
# build libpng_read_fuzzer.
$FUZZER/repo/afl-clang-fast++ -std=c++11 -I. \
     contrib/oss-fuzz/libpng_read_fuzzer.cc \
     -o $OUT/libpng_read_fuzzer \
     .libs/libpng16.a $OUT/afl_driver.o -lstdc++ -lz