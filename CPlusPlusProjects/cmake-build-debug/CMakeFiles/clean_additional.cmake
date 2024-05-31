# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\CPlusPlusProjects_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\CPlusPlusProjects_autogen.dir\\ParseCache.txt"
  "CPlusPlusProjects_autogen"
  )
endif()
