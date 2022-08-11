cmake_minimum_required(VERSION 3.5.2)

project(mongoose C)

set(CMAKE_C_STANDARD 99)
set(BUILD_SHARED_LIBS TRUE)

set(CMAKE_BUILD_TYPE RelWithDebInfo)

set(CMAKE_CXX_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

include_directories(. src)

add_library(mongoose
    mongoose.c)

if(WIN32)
    target_link_libraries(mongoose wsock32 ws2_32)
endif()
# if(WIN32)
# 	# target_link_libraries(ws pthread ws2_32 -static)
#     message("not sure what to do for windows")
# else()
# 	target_link_libraries(mongoose)
# endif(WIN32)