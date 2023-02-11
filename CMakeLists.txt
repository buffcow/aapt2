cmake_minimum_required(VERSION 3.14.2)
project(aapt2)

# Enable asm language
enable_language(ASM)

# Global flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -std=c11 -fcolor-diagnostics -fPIC -Wno-attributes")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -fcolor-diagnostics -fPIC -Wno-attributes")

# Sources
set(AOSP ${PROJECT_SOURCE_DIR}/src)

# Building
add_library(protobuf STATIC IMPORTED)
set_target_properties(protobuf PROPERTIES IMPORTED_LOCATION ${AOSP}/protobuf/lib/${ANDROID_ABI}/libprotobuf.a)
add_subdirectory(src/zopfli EXCLUDE_FROM_ALL)
add_subdirectory(src/fmtlib EXCLUDE_FROM_ALL)
add_subdirectory(src/googletest EXCLUDE_FROM_ALL)
add_subdirectory(cmake)
