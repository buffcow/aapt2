add_library(libexpat STATIC
    ${AOSP}/external/expat/lib/xmlparse.c
    ${AOSP}/external/expat/lib/xmlrole.c
    ${AOSP}/external/expat/lib/xmltok.c)

target_compile_options(libexpat PRIVATE
    -fno-strict-aliasing
    -include stdio.h)
    
target_compile_definitions(libexpat PRIVATE
    -DHAVE_EXPAT_CONFIG_H)
    
target_include_directories(libexpat PRIVATE
    ${AOSP}/external/expat/lib
    ${AOSP}/external/expat)
