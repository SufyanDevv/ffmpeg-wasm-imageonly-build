#!/bin/bash

docker run --rm -v $(pwd):/build -w /build emscripten/emsdk bash -c "
  git clone https://github.com/FFmpeg/FFmpeg.git &&
  cd FFmpeg &&
  emconfigure ./configure \
    --cc=emcc \
    --target-os=none \
    --arch=x86_32 \
    --disable-x86asm \
    --disable-inline-asm \
    --disable-asm \
    --disable-everything \
    --enable-demuxer=png,jpeg,bmp,gif,webp \
    --enable-muxer=png,jpeg,bmp,gif,webp \
    --enable-decoder=png,jpeg,bmp,gif,webp \
    --enable-encoder=png,jpeg,bmp,gif,webp \
    --enable-protocol=file \
    --enable-filter=scale \
    --enable-avcodec \
    --enable-avformat \
    --enable-swscale \
    --prefix=/build/dist &&
  make -j4 &&
  make install
"
