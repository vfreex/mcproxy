cmake_minimum_required(VERSION 2.8)

# Project Definition
project(mcproxy CXX)
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -std=c++11")
add_definitions(-Wall -Wextra)
include_directories(${CMAKE_SOURCE_DIR}/mcproxy)


add_executable(mcproxy-bin mcproxy/src/main.cpp 
           mcproxy/src/hamcast_logging.cpp 
               #utils
           mcproxy/src/utils/mc_socket.cpp 
           mcproxy/src/utils/addr_storage.cpp 
           mcproxy/src/utils/mroute_socket.cpp 
           mcproxy/src/utils/if_prop.cpp 
           mcproxy/src/utils/reverse_path_filter.cpp 
               #proxy
           mcproxy/src/proxy/proxy.cpp 
           mcproxy/src/proxy/sender.cpp 
           mcproxy/src/proxy/receiver.cpp 
           mcproxy/src/proxy/mld_receiver.cpp 
           mcproxy/src/proxy/igmp_receiver.cpp 
           mcproxy/src/proxy/mld_sender.cpp 
           mcproxy/src/proxy/igmp_sender.cpp 
           mcproxy/src/proxy/proxy_instance.cpp 
           mcproxy/src/proxy/routing.cpp 
           mcproxy/src/proxy/worker.cpp 
           mcproxy/src/proxy/timing.cpp 
           mcproxy/src/proxy/check_if.cpp 
           mcproxy/src/proxy/check_kernel.cpp 
           mcproxy/src/proxy/membership_db.cpp 
           mcproxy/src/proxy/querier.cpp 
           mcproxy/src/proxy/timers_values.cpp 
           mcproxy/src/proxy/interfaces.cpp 
           mcproxy/src/proxy/def.cpp 
           mcproxy/src/proxy/simple_mc_proxy_routing.cpp 
           mcproxy/src/proxy/simple_routing_data.cpp 
               #parser
           mcproxy/src/parser/scanner.cpp 
           mcproxy/src/parser/token.cpp 
           mcproxy/src/parser/configuration.cpp 
           mcproxy/src/parser/parser.cpp 
           mcproxy/src/parser/interface.cpp
)
target_link_libraries(mcproxy-bin pthread)

# Installation
install(TARGETS mcproxy-bin DESTINATION bin/)

