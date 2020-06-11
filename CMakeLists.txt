cmake_minimum_required(VERSION 3.1.0)
project(
  libcuckoo
  VERSION 0.3.0
  LANGUAGES C CXX)

# Check if this CMakeLists is being used directly or via add_subdirectory
set(LIBCUCKOO_MASTER_PROJECT OFF)
if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
  set(LIBCUCKOO_MASTER_PROJECT ON)
endif()

# Allow for parent CMakeLists to populate the outgoing targets file
if(NOT LIBCUCKOO_EXPORT_NAME)
  set(LIBCUCKOO_EXPORT_NAME "${PROJECT_NAME}-targets")
endif()
message(STATUS "[libcuckoo]:: Export name is ${LIBCUCKOO_EXPORT_NAME}")

# put these in the cache so they show up in ccmake
option(LIBCUCKOO_BUILD_EXAMPLES "build example libcuckoo programs")

# Add the libcuckoo interface target
add_subdirectory(libcuckoo)

# Add C interface target
add_subdirectory(libcuckoo-c)

# Build examples
if(LIBCUCKOO_BUILD_EXAMPLES)
  add_subdirectory(examples)
endif()

# Build tests -- this only builds tests that were specified
enable_testing()
add_subdirectory(tests)
