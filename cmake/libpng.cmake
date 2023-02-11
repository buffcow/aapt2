add_library(libpng STATIC
    ${AOSP}/libpng/png.c
    ${AOSP}/libpng/pngerror.c
    ${AOSP}/libpng/pngget.c
    ${AOSP}/libpng/pngmem.c
    ${AOSP}/libpng/pngpread.c
    ${AOSP}/libpng/pngread.c
    ${AOSP}/libpng/pngrio.c
    ${AOSP}/libpng/pngrtran.c
    ${AOSP}/libpng/pngrutil.c
    ${AOSP}/libpng/pngset.c
    ${AOSP}/libpng/pngtrans.c
    ${AOSP}/libpng/pngwio.c
    ${AOSP}/libpng/pngwrite.c
    ${AOSP}/libpng/pngwtran.c
    ${AOSP}/libpng/pngwutil.c)
    
if(ANDROID_ABI STREQUAL "arm64-v8a" OR ANDROID_ABI STREQUAL "armeabi-v7a")
    target_sources(libpng PRIVATE
        ${AOSP}/libpng/arm/arm_init.c
        ${AOSP}/libpng/arm/filter_neon_intrinsics.c
        ${AOSP}/libpng/arm/palette_neon_intrinsics.c
        ${AOSP}/libpng/arm/filter_neon.S)

elseif(ANDROID_ABI STREQUAL "x86_64" OR ANDROID_ABI STREQUAL "x86")
    target_sources(libpng PRIVATE
        ${AOSP}/libpng/intel/intel_init.c
        ${AOSP}/libpng/intel/filter_sse2_intrinsics.c)
    
    target_compile_definitions(libpng PRIVATE -DPNG_INTEL_SSE_OPT=1)
endif()
        
target_include_directories(libpng PRIVATE ${AOSP}/libpng)