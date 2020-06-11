#!/bin/bash

# help for windows builds
mkdir -pv ${TMPDIR:=${SRC_DIR}/_tmp}
export TMPDIR

# configure
./configure \
	--prefix=${PREFIX} \
	--with-zlib=${PREFIX} \
	--without-matlab \
;

# build
make -j ${CPU_COUNT} V=1 VERBOSE=1

# test
make -j ${CPU_COUNT} V=1 VERBOSE=1 check

# install
make -j ${CPU_COUNT} V=1 VERBOSE=1 install
