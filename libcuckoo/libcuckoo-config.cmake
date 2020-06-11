#
# libcuckoo-config.cmake
#

include(CMakeFindDependencyMacro)

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_dependency(Threads)

# If this file hasn't been called before
if(NOT TARGET libcuckoo::libcuckoo)
  include("${CMAKE_CURRENT_LIST_DIR}/libcuckoo-targets.cmake")
endif()
