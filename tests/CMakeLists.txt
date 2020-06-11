add_library(test_util INTERFACE)
target_include_directories(test_util INTERFACE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
)

# put these in the cache so they show up in ccmake
option (LIBCUCKOO_BUILD_TESTS "build all libcuckoo tests")
option (LIBCUCKOO_BUILD_STRESS_TESTS "build the stress tests")
option (LIBCUCKOO_BUILD_UNIT_TESTS "build the unit tests")
option (LIBCUCKOO_BUILD_UNIVERSAL_BENCHMARK "build the universal benchmark and associated tests")

# Add pcg if we're doing stress tests or universal benchmark
if (LIBCUCKOO_BUILD_TESTS OR
    LIBCUCKOO_BUILD_STRESS_TESTS OR
    LIBCUCKOO_BUILD_UNIVERSAL_BENCHMARK)
    add_subdirectory(pcg)
endif()

# Add catch for unit tests
if (LIBCUCKOO_BUILD_TESTS OR LIBCUCKOO_BUILD_UNIT_TESTS)
    add_subdirectory(Catch)
    add_subdirectory(unit-tests)
endif()

if (LIBCUCKOO_BUILD_TESTS OR LIBCUCKOO_BUILD_STRESS_TESTS)
    add_subdirectory(stress-tests)
endif()

if (LIBCUCKOO_BUILD_TESTS OR LIBCUCKOO_BUILD_UNIVERSAL_BENCHMARK)
    add_subdirectory(universal-benchmark)
endif()
