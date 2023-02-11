project(cmake)

# executable output
set(EXECUTABLE_OUTPUT_PATH "${CMAKE_BINARY_DIR}/bin")

# External libs
include(libpng.cmake)
include(libexpat.cmake)
include(libz.cmake)

# Libs
include(libbase.cmake)
include(libcutils.cmake)
include(libutils.cmake)
include(liblog.cmake)
include(libziparchive.cmake)
include(libandroidfw.cmake)
include(libincfs.cmake)

# Tools
include(aapt2.cmake)
include(zipalign.cmake)
