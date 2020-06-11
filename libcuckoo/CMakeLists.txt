# for write_basic_package_version_file()
include(CMakePackageConfigHelpers)

# we require the use of threads
set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)

# libcuckoo is an interface (all headers) library target
add_library(libcuckoo INTERFACE)

# tag libcuckoo target with a c++11 feature so that libcuckoo users will have
# c++11 turned on in their compile when they use this target. XXX: newer cmakes
# have a "cxx_std_11" feature that could be used
target_compile_features(libcuckoo INTERFACE cxx_constexpr)

# Include relative to the base directory
target_include_directories(
  libcuckoo INTERFACE $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}>
                      $<INSTALL_INTERFACE:include>)

# switch on threading for all targets that link with libcuckoo
target_link_libraries(libcuckoo INTERFACE Threads::Threads)

install(FILES cuckoohash_config.hh cuckoohash_map.hh cuckoohash_util.hh
              bucket_container.hh DESTINATION include/libcuckoo)

# cmake packaging
set(libcuckoo_pkgloc "share/cmake/${PROJECT_NAME}")

write_basic_package_version_file(
  "${PROJECT_NAME}-config-version.cmake"
  VERSION ${libcuckoo_VERSION}
  COMPATIBILITY AnyNewerVersion)
# Install this generated version file and dependency file
install(FILES libcuckoo-config.cmake
              ${CMAKE_CURRENT_BINARY_DIR}/libcuckoo-config-version.cmake
        DESTINATION ${libcuckoo_pkgloc})

# Specify the export target name determined by whether we're standalone or not
install(TARGETS libcuckoo EXPORT "${LIBCUCKOO_EXPORT_NAME}")

install(
  EXPORT "${LIBCUCKOO_EXPORT_NAME}"
  NAMESPACE "${PROJECT_NAME}::"
  DESTINATION ${libcuckoo_pkgloc})
