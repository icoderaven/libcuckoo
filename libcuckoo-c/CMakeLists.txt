# If we're the master project, install this file
if(LIBCUCKOO_MASTER_PROJECT)
  install(FILES cuckoo_table_template.h cuckoo_table_template.cc
          DESTINATION include/libcuckoo-c)
endif()
