
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)
if(COMMAND cmake_policy)
      cmake_policy(SET CMP0003 NEW)
endif(COMMAND cmake_policy)

FIND_PACKAGE( OpenCV REQUIRED )

INCLUDE_DIRECTORIES(shMem.h)

ADD_EXECUTABLE(tcp_client tcp_client.c)

TARGET_LINK_LIBRARIES(tcp_client ${OpenCV_LIBS})
