add_library(libz STATIC
    ${AOSP}/external/zlib/adler32.c
    ${AOSP}/external/zlib/compress.c
    ${AOSP}/external/zlib/cpu_features.c
    ${AOSP}/external/zlib/crc32.c
    ${AOSP}/external/zlib/deflate.c
    ${AOSP}/external/zlib/gzclose.c
    ${AOSP}/external/zlib/gzlib.c
    ${AOSP}/external/zlib/gzread.c
    ${AOSP}/external/zlib/gzwrite.c
    ${AOSP}/external/zlib/infback.c
    ${AOSP}/external/zlib/inffast.c
    ${AOSP}/external/zlib/inflate.c
    ${AOSP}/external/zlib/inftrees.c
    ${AOSP}/external/zlib/trees.c
    ${AOSP}/external/zlib/uncompr.c
    ${AOSP}/external/zlib/zutil.c)

target_compile_definitions(libz PRIVATE
    -DHAVE_HIDDEN
    -DZLIB_CONST)
    
target_include_directories(libz PRIVATE ${AOSP}/external/zlib)
