cmake_minimum_required(VERSION 3.5.2)

project(mongoose C)

set(CMAKE_C_STANDARD 99)
set(BUILD_SHARED_LIBS TRUE)

set(CMAKE_BUILD_TYPE RelWithDebInfo)

set(CMAKE_CXX_FLAGS "-Wall -Wextra")
set(CMAKE_CXX_FLAGS_DEBUG "-g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

# set(CMAKE_C_FLAGS, "${CMAKE_C_FLAGS} -DMG_ENABLE_MBEDTLS=1 -lmbedtls -lmbedcrypto -lmbedx509 -Imbedtls/include -Lmbedtls/library")
set(CMAKE_C_FLAGS, "${CMAKE_C_FLAGS} -DMG_ENABLE_OPENSSL=1 -lssl -lcrypto")

include_directories(. src)

add_library(mongoose SHARED
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