add_executable(zipalign
    ${AOSP}/zipalign/ZipAlignMain.cpp
    ${AOSP}/zipalign/ZipAlign.cpp
    ${AOSP}/zipalign/ZipEntry.cpp
    ${AOSP}/zipalign/ZipFile.cpp)

target_include_directories(zipalign PRIVATE
    ${AOSP}/libbase/include
    ${AOSP}/liblog/include
    ${AOSP}/libutils/include
    ${AOSP}/libziparchive/include
    ${AOSP}/external/zlib)

target_include_directories(zipalign PRIVATE
    ${AOSP}/zipalign/include
    ${AOSP}/external/zopfli/src)
    
target_link_libraries(zipalign  
    libbase
    libutils
    liblog
    libziparchive
    libzopfli
    libz)
