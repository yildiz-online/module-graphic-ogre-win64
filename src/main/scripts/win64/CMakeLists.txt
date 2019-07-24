cmake_minimum_required (VERSION 2.8.6)

project (module-graphic-ogre-win64)
 
set(CMAKE_CXX_FLAGS "-O2")
 
include_directories("${CMAKE_SOURCE_DIR}/java/include")
include_directories("${CMAKE_SOURCE_DIR}/java/include/win32")
include_directories("${CMAKE_SOURCE_DIR}/ogre3d/win64/include/OGRE")
include_directories("${CMAKE_SOURCE_DIR}/ogre3d/win64/include/OGRE/Overlay")
include_directories(${PHYSFS_INCLUDE_DIR})
    
set(CMAKE_SHARED_LINKER_FLAGS "-Xlinker --add-stdcall-alias -W")
 
file(
        GLOB_RECURSE
        source_files
        ${CMAKE_SOURCE_DIR}/../../c++/*.cpp
        ${CMAKE_SOURCE_DIR}/../../c++/*.c
        ${CMAKE_SOURCE_DIR}/../../includes/*.hpp
        ${CMAKE_SOURCE_DIR}/../../includes/*.h
)

add_library(yildizogre SHARED ${source_files} ${CMAKE_SOURCE_DIR}/version.rc)

target_link_libraries(yildizogre ${CMAKE_SOURCE_DIR}/ogre3d/win64/lib/libOgreMain.dll.a)
target_link_libraries(yildizogre ${CMAKE_SOURCE_DIR}/ogre3d/win64/lib/libOgreOverlay.dll.a)
target_link_libraries(yildizogre ${CMAKE_SOURCE_DIR}/physicsfs/win64/lib/libphysfs.a)
target_link_libraries(yildizogre ${CMAKE_SOURCE_DIR}/physicsfs/win64/libyildizphysfs.dll.a)
