# ========================= aapt2 proto ============================
set(AAPT2_PROTO_SRC)  # proto source files
set(AAPT2_PROTO_HDRS) # proto head files
set(AAPT2_PROTO_DIR ${AOSP}/aapt2)

file(GLOB_RECURSE PROTO_FILES ${AAPT2_PROTO_DIR}/*.proto)

foreach(proto ${PROTO_FILES})
    get_filename_component(FIL_WE ${proto} NAME_WE)
    
    set(TARGET_CPP_FILE "${AAPT2_PROTO_DIR}/${FIL_WE}.pb.cc")
    set(TARGET_HEAD_FILE "${AAPT2_PROTO_DIR}/${FIL_WE}.pb.h")
    
    if(EXISTS ${TARGET_CPP_FILE} AND EXISTS ${TARGET_HEAD_FILE})
        list(APPEND AAPT2_PROTO_SRC ${TARGET_CPP_FILE})
        list(APPEND AAPT2_PROTO_HDRS ${TARGET_HEAD_FILE})
    endif()
endforeach()

set_source_files_properties(${AAPT2_PROTO_SRC} PROPERTIES GENERATED TRUE)
set_source_files_properties(${AAPT2_PROTO_HDRS} PROPERTIES GENERATED TRUE)
# ========================= aapt2 proto ============================


add_executable(aapt2
    ${AOSP}/aapt2/Main.cpp
    ${AOSP}/aapt2/cmd/Command.cpp
    ${AOSP}/aapt2/cmd/Compile.cpp
    ${AOSP}/aapt2/cmd/Convert.cpp
    ${AOSP}/aapt2/cmd/Diff.cpp
    ${AOSP}/aapt2/cmd/Dump.cpp
    ${AOSP}/aapt2/cmd/Link.cpp
    ${AOSP}/aapt2/cmd/Optimize.cpp
    ${AOSP}/aapt2/cmd/Util.cpp
    ${AOSP}/aapt2/compile/IdAssigner.cpp
    ${AOSP}/aapt2/compile/InlineXmlFormatParser.cpp
    ${AOSP}/aapt2/compile/NinePatch.cpp
    ${AOSP}/aapt2/compile/Png.cpp
    ${AOSP}/aapt2/compile/PngChunkFilter.cpp
    ${AOSP}/aapt2/compile/PngCrunch.cpp
    ${AOSP}/aapt2/compile/PseudolocaleGenerator.cpp
    ${AOSP}/aapt2/compile/Pseudolocalizer.cpp
    ${AOSP}/aapt2/compile/XmlIdCollector.cpp
    ${AOSP}/aapt2/configuration/ConfigurationParser.cpp
    ${AOSP}/aapt2/dump/DumpManifest.cpp
    ${AOSP}/aapt2/filter/AbiFilter.cpp
    ${AOSP}/aapt2/filter/ConfigFilter.cpp
    ${AOSP}/aapt2/format/Archive.cpp
    ${AOSP}/aapt2/format/Container.cpp
    ${AOSP}/aapt2/format/binary/BinaryResourceParser.cpp
    ${AOSP}/aapt2/format/binary/ResChunkPullParser.cpp
    ${AOSP}/aapt2/format/binary/TableFlattener.cpp
    ${AOSP}/aapt2/format/binary/XmlFlattener.cpp
    ${AOSP}/aapt2/format/proto/ProtoDeserialize.cpp
    ${AOSP}/aapt2/format/proto/ProtoSerialize.cpp
    ${AOSP}/aapt2/io/BigBufferStream.cpp
    ${AOSP}/aapt2/io/File.cpp
    ${AOSP}/aapt2/io/FileStream.cpp
    ${AOSP}/aapt2/io/FileSystem.cpp
    ${AOSP}/aapt2/io/StringStream.cpp
    ${AOSP}/aapt2/io/Util.cpp
    ${AOSP}/aapt2/io/ZipArchive.cpp
    ${AOSP}/aapt2/link/AutoVersioner.cpp
    ${AOSP}/aapt2/link/ManifestFixer.cpp
    ${AOSP}/aapt2/link/NoDefaultResourceRemover.cpp
    ${AOSP}/aapt2/link/ProductFilter.cpp
    ${AOSP}/aapt2/link/PrivateAttributeMover.cpp
    ${AOSP}/aapt2/link/ReferenceLinker.cpp
    ${AOSP}/aapt2/link/ResourceExcluder.cpp
    ${AOSP}/aapt2/link/TableMerger.cpp
    ${AOSP}/aapt2/link/XmlCompatVersioner.cpp
    ${AOSP}/aapt2/link/XmlNamespaceRemover.cpp
    ${AOSP}/aapt2/link/XmlReferenceLinker.cpp
    ${AOSP}/aapt2/optimize/MultiApkGenerator.cpp
    ${AOSP}/aapt2/optimize/ResourceDeduper.cpp
    ${AOSP}/aapt2/optimize/ResourceFilter.cpp
    ${AOSP}/aapt2/optimize/ResourcePathShortener.cpp
    ${AOSP}/aapt2/optimize/VersionCollapser.cpp
    ${AOSP}/aapt2/process/SymbolTable.cpp
    ${AOSP}/aapt2/split/TableSplitter.cpp
    ${AOSP}/aapt2/text/Printer.cpp
    ${AOSP}/aapt2/text/Unicode.cpp
    ${AOSP}/aapt2/text/Utf8Iterator.cpp
    ${AOSP}/aapt2/util/BigBuffer.cpp
    ${AOSP}/aapt2/util/Files.cpp
    ${AOSP}/aapt2/util/Util.cpp
    ${AOSP}/aapt2/Debug.cpp
    ${AOSP}/aapt2/DominatorTree.cpp
    ${AOSP}/aapt2/java/AnnotationProcessor.cpp
    ${AOSP}/aapt2/java/ClassDefinition.cpp
    ${AOSP}/aapt2/java/JavaClassGenerator.cpp
    ${AOSP}/aapt2/java/ManifestClassGenerator.cpp
    ${AOSP}/aapt2/java/ProguardRules.cpp
    ${AOSP}/aapt2/LoadedApk.cpp
    ${AOSP}/aapt2/Resource.cpp
    ${AOSP}/aapt2/ResourceParser.cpp
    ${AOSP}/aapt2/ResourceTable.cpp
    ${AOSP}/aapt2/ResourceUtils.cpp
    ${AOSP}/aapt2/ResourceValues.cpp
    ${AOSP}/aapt2/SdkConstants.cpp
    ${AOSP}/aapt2/StringPool.cpp
    ${AOSP}/aapt2/trace/TraceBuffer.cpp
    ${AOSP}/aapt2/xml/XmlActionExecutor.cpp
    ${AOSP}/aapt2/xml/XmlDom.cpp
    ${AOSP}/aapt2/xml/XmlPullParser.cpp
    ${AOSP}/aapt2/xml/XmlUtil.cpp
    ${AOSP}/aapt2/ValueTransformer.cpp
    ${AOSP}/aapt2/Configuration.proto
    ${AOSP}/aapt2/Resources.proto
    ${AOSP}/aapt2/ResourcesInternal.proto
    ${AAPT2_PROTO_SRC} ${AAPT2_PROTO_HDRS})
    
target_include_directories(aapt2 PRIVATE
    ${AOSP}/aapt2
    ${AOSP}/libbase/include
    ${AOSP}/libsystem/include
    ${AOSP}/libutils/include
    ${AOSP}/liblog/include
    ${AOSP}/androidfw/include
    ${AOSP}/libidmap2_policies/include
    ${AOSP}/libziparchive/include
    ${AOSP}/incfs/util/include
    ${AOSP}
    ${AOSP}/external/protobuf/src
    ${AOSP}/external/expat/lib
    ${AOSP}/external/fmtlib/include
    ${AOSP}/external/libpng
    ${AOSP}/external/zlib)

target_compile_options(aapt2 PRIVATE
    -Wno-unused-parameter
    -Wno-missing-field-initializers
    -fno-exceptions 
    -fno-rtti)

target_link_libraries(aapt2
    libbase
    libutils
    libcutils
    liblog
    libandroidfw 
    libziparchive
    libincfs
    protobuf
    libpng
    libexpat
    libz)