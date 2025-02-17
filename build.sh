#!/bin/bash

if [[ -z "$ANDROID_NDK" ]]; then
  echo "Please specify the Android NDK environment variable \"ANDROID_NDK\"."
  exit 1
fi

NDK_TOOLCHAIN="$ANDROID_NDK/toolchains/llvm/prebuilt/linux-x86_64"
STRIP="$NDK_TOOLCHAIN/bin/llvm-strip"
CLEAN=termux-elf-cleaner

TARGET_ABI="$1"
TARGET_API="24"
PWD="$(pwd)"

cmake -GNinja -B "$PWD/build" \
  -DANDROID_NDK="$ANDROID_NDK" \
  -DCMAKE_TOOLCHAIN_FILE="$ANDROID_NDK/build/cmake/android.toolchain.cmake" \
  -DANDROID_ABI="$TARGET_ABI" \
  -DANDROID_NATIVE_API_LEVEL="$TARGET_API" \
  -DCMAKE_SYSTEM_NAME="Android" \
  -DCMAKE_BUILD_TYPE="Release" \
  -DANDROID_STL="c++_static" || exit 1

ninja -C "$PWD/build" "-j$(nproc)" || exit 1

aapt2="$PWD/build/bin/aapt2"
zipalign="$PWD/build/bin/zipalign"

$STRIP --strip-all "$aapt2" || exit 1
$STRIP --strip-all "$zipalign" || exit 1

$CLEAN --api-level "$TARGET_API" "$aapt2" || exit 1
$CLEAN --api-level "$TARGET_API" "$zipalign" || exit 1
