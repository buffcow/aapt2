add_library(libpng STATIC
    ${AOSP}/external/libpng/png.c
    ${AOSP}/external/libpng/pngerror.c
    ${AOSP}/external/libpng/pngget.c
    ${AOSP}/external/libpng/pngmem.c
    ${AOSP}/external/libpng/pngpread.c
    ${AOSP}/external/libpng/pngread.c
    ${AOSP}/external/libpng/pngrio.c
    ${AOSP}/external/libpng/pngrtran.c
    ${AOSP}/external/libpng/pngrutil.c
    ${AOSP}/external/libpng/pngset.c
    ${AOSP}/external/libpng/pngtrans.c
    ${AOSP}/external/libpng/pngwio.c
    ${AOSP}/external/libpng/pngwrite.c
    ${AOSP}/external/libpng/pngwtran.c
    ${AOSP}/external/libpng/pngwutil.c)
    
if(ANDROID_ABI STREQUAL "arm64-v8a" OR ANDROID_ABI STREQUAL "armeabi-v7a")
    target_sources(libpng PRIVATE
        ${AOSP}/external/libpng/arm/arm_init.c
        ${AOSP}/external/libpng/arm/filter_neon_intrinsics.c
        ${AOSP}/external/libpng/arm/palette_neon_intrinsics.c
        ${AOSP}/external/libpng/arm/filter_neon.S)

elseif(ANDROID_ABI STREQUAL "x86_64" OR ANDROID_ABI STREQUAL "x86")
    target_sources(libpng PRIVATE
        ${AOSP}/external/libpng/intel/intel_init.c
        ${AOSP}/external/libpng/intel/filter_sse2_intrinsics.c)
    
    target_compile_definitions(libpng PRIVATE -DPNG_INTEL_SSE_OPT=1)
endif()
        
target_include_directories(libpng PRIVATE ${AOSP}/external/libpng)