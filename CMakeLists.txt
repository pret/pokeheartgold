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
# file(GLOB_RECURSE C_SOURCES_LIBS "${LIBS_SRC_DIR}/*.c")
# file(GLOB_RECURSE CXX_SOURCES_LIBS "${LIBS_SRC_DIR}/*.cpp")
file(GLOB_RECURSE ASM_SOURCES_GAME "${GAME_ASM_DIR}/*.s")
# file(GLOB_RECURSE ASM_SOURCES_LIBS "${LIBS_ASM_DIR}/*.s")
set(SOURCES ${C_SOURCES_GAME} ${ASM_SOURCES_GAME})

list(JOIN SOURCES "\n" sources_join)

foreach(SRC IN LISTS C_SOURCES_GAME C_SOURCES_LIBS)
    # add_custom_command(OUTPUT ${CMAKE_BUILD_DIR}/${SRC}.o)
endforeach()

add_executable(PokeHeartGold ${SOURCES})
target_include_directories(PokeHeartGold PUBLIC include files ${CMAKE_SOURCE_DIR}/lib/include ${CMAKE_SOURCE_DIR}/lib/include/cw ${CMAKE_SOURCE_DIR}/lib/include/nitro ${CMAKE_SOURCE_DIR}/lib/include/nnsys ${CMAKE_SOURCE_DIR}/lib/include/nitro/os include/library)
target_compile_definitions(PokeHeartGold PUBLIC __CLION_IDE__ SDK_ARM9 SDK_CW SDK_CODE_ARM _NITRO __arm PLATFORM_INTRINSIC_FUNCTION_BIT_CLZ32=__builtin_clz wchar_t=__WCHAR_TYPE__)
target_compile_options(PokeHeartGold PRIVATE -Wimplicit -Wno-endif-labels -fms-extensions -nostdinc -Wno-builtin-declaration-mismatch -Wno-implicit-int -Wno-multichar -Wno-address-of-packed-member -mcpu=arm946e-s)
target_compile_features(PokeHeartGold PRIVATE c_std_99 cxx_std_98)

add_subdirectory(tools)
