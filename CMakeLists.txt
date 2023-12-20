cmake_minimum_required (VERSION 3.15)
set(CMAKE_TRY_COMPILE_TARGET_TYPE "STATIC_LIBRARY")
set(CMAKE_SHARED_LIBRARY_LINK_C_FLAGS "")
set(CMAKE_SHARED_LIBRARY_LINK_CXX_FLAGS "")
project(PokeHeartGold)

enable_language(ASM)

if(APPLE)
    include_directories(/usr/local/include)
endif(APPLE)

# TODO: Create custom commands
SET(GAME_SRC_DIR ${CMAKE_SOURCE_DIR}/src/)
SET(GAME_ASM_DIR ${CMAKE_SOURCE_DIR}/asm/)
SET(LIBS_SRC_DIR ${CMAKE_SOURCE_DIR}/lib/)
SET(LIBS_ASM_DIR ${CMAKE_SOURCE_DIR}/lib/)
file(GLOB_RECURSE C_SOURCES_GAME "${GAME_SRC_DIR}/*.c")
file(GLOB_RECURSE C_SOURCES_LIBS "${LIBS_SRC_DIR}/*.c")
file(GLOB_RECURSE CXX_SOURCES_LIBS "${LIBS_SRC_DIR}/*.cpp")
file(GLOB_RECURSE ASM_SOURCES_GAME "${GAME_ASM_DIR}/*.s")
file(GLOB_RECURSE ASM_SOURCES_LIBS "${LIBS_ASM_DIR}/*.s")
set(SOURCES ${C_SOURCES_GAME} ${C_SOURCES_LIBS} ${CXX_SOURCES_LIBS} ${ASM_SOURCES_GAME} ${ASM_SOURCES_GAME})

list(JOIN SOURCES "\n" sources_join)

foreach(SRC IN LISTS C_SOURCES_GAME C_SOURCES_LIBS)
    # add_custom_command(OUTPUT ${CMAKE_BUILD_DIR}/${SRC}.o)
endforeach()

add_executable(PokeHeartGold ${SOURCES})
target_include_directories(PokeHeartGold PRIVATE include files lib/include lib/include/cw lib/include/nitro lib/include/nnsys lib/include/nitro/os include/library)
target_compile_definitions(PokeHeartGold PUBLIC __CLION_IDE__ SDK_ARM9)
target_compile_options(PokeHeartGold PRIVATE -include ${CMAKE_CURRENT_SOURCE_DIR}/include/global.h -Wimplicit -Werror -fms-extensions)
target_compile_features(PokeHeartGold PRIVATE c_std_99 cxx_std_98)

add_subdirectory(tools)
