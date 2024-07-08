cmake_minimum_required(VERSION 3.18)

project(wasm_shared-host
  DESCRIPTION "null0 engine experiment: shared memory"
  HOMEPAGE_URL "https://github.com/notnullgames/wasm-shared"
  VERSION 0.0.1
  LANGUAGES C
)

if(NOT EMSCRIPTEN)
  message(FATAL_ERROR "You must compile with emscripten.")
endif()

set(CMAKE_EXECUTABLE_SUFFIX ".mjs")

add_executable(host host.c)
target_link_options(host PRIVATE -sINITIAL_MEMORY=128MB  -sEXPORTED_FUNCTIONS=_logtest -sEXPORTED_RUNTIME_METHODS=wasmMemory)
