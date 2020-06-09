if(INSTALL_CONFIG)
  install(FILES cuckoo_table_template.h cuckoo_table_template.cc
          DESTINATION ${CMAKE_INSTALL_PREFIX}/include/libcuckoo-c)
endif()
