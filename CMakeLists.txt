cmake_minimum_required(VERSION 3.6)
project(aapt2 VERSION 1.0.0 LANGUAGES C CXX ASM)

# Use C11 with GNU extensions
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_EXTENSIONS ON)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Use C++20 with GNU extensions
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_EXTENSIONS ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Globle flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fcolor-diagnostics -fPIC")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fcolor-diagnostics -fPIC")

# Disable warnings
add_compile_options(-Wno-attributes)

# aapt2 version
set(ANDROID_VERSION 34.0.0)
set(ANDROID_VENDOR github-@RohitVerma882)

# Sources
set(AOSP ${PROJECT_SOURCE_DIR}/src)

# Generate config files
configure_file(version.h.in ${AOSP}/build/version.h @ONLY)
configure_file(platform_tools_version.h.in ${AOSP}/platform_tools_version.h @ONLY)

# Building
add_library(protobuf STATIC IMPORTED)
set_target_properties(protobuf PROPERTIES IMPORTED_LOCATION ${AOSP}/external/protobuf/lib/${ANDROID_ABI}/libprotobuf.a)
add_subdirectory(src/external/zopfli EXCLUDE_FROM_ALL)
add_subdirectory(src/external/fmtlib EXCLUDE_FROM_ALL)
add_subdirectory(cmake)
