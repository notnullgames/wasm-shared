cmake_minimum_required(VERSION 3.18)

project(wasm_shared
  DESCRIPTION "null0 engine experiment: shared memory"
  HOMEPAGE_URL "https://github.com/notnullgames/wasm-shared"
  VERSION 0.0.1
  LANGUAGES C
)

if(NOT EMSCRIPTEN)
  message(FATAL_ERROR "You must compile with emscripten.")
endif()

set(CMAKE_EXECUTABLE_SUFFIX ".mjs")

add_executable(${PROJECT_NAME}-host host.c)
target_link_options(${PROJECT_NAME}-host PRIVATE -sINITIAL_MEMORY=128MB -sEXPORTED_FUNCTIONS=@${CMAKE_CURRENT_SOURCE_DIR}/host.txt -sEXPORTED_RUNTIME_METHODS=wasmMemory)

# normally I would do this without emscripten, but this makes it a bit easier
add_executable(${PROJECT_NAME}-cart cart.c)
target_link_options(${PROJECT_NAME}-cart PRIVATE -sWARN_ON_UNDEFINED_SYMBOLS=0 -sTOTAL_MEMORY=128MB --no-entry -sMODULARIZE -sEXPORTED_FUNCTIONS=@${CMAKE_CURRENT_SOURCE_DIR}/cart.txt -Wl,--import-memory -sSTANDALONE_WASM)

