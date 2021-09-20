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

# test (skip windows and cross-compiling, they hang for some reason)
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" ]] && \
   ( [[ "$(uname)" == "Linux" ]] || [[ "$(uname)" == "Darwin" ]] ); then
	make -j ${CPU_COUNT} V=1 VERBOSE=1 check
fi

# install
make -j ${CPU_COUNT} V=1 VERBOSE=1 install
