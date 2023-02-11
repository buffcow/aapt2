#!/usr/bin/bash

if [[ -z "$NDK" ]]; then
    echo "Please specify the Android NDK environment variable \"NDK\"."
    exit 1
fi

CURRENT_DIR="$(pwd)"
NDK_TOOLCHAIN="$NDK/toolchains/llvm/prebuilt/linux-x86_64"
STRIP="$NDK_TOOLCHAIN/bin/llvm-strip"

abi="$1"
api="24"
build_dir="$CURRENT_DIR/build/$abi"
out_dir="$CURRENT_DIR/output/$abi"

cmake -GNinja \
-B "$build_dir" \
-DANDROID_NDK="$NDK" \
-DCMAKE_TOOLCHAIN_FILE="$NDK/build/cmake/android.toolchain.cmake" \
-DANDROID_ABI="$abi" \
-DANDROID_NATIVE_API_LEVEL="$api" \
-DCMAKE_SYSTEM_NAME="Android" \
-DCMAKE_BUILD_TYPE="Release" \
-DANDROID_STL="c++_static" || exit 1

ninja -C "$build_dir" "-j$(nproc)" || exit 1

mkdir -p "$out_dir" || exit 1
cp "$build_dir/bin/aapt2" "$out_dir" || exit 1
cp "$build_dir/bin/zipalign" "$out_dir" || exit 1

aapt2="$out_dir/aapt2"
zipalign="$out_dir/zipalign"

$STRIP --strip-all "$aapt2" || exit 1
$STRIP --strip-all "$zipalign" || exit 1

$CLEAN --api-level "$api" "$aapt2" || exit 1
$CLEAN --api-level "$api" "$zipalign" || exit 1