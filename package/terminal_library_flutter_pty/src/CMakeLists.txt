# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(terminal_library_flutter_pty_library VERSION 0.0.1 LANGUAGES C)

add_library(terminal_library_flutter_pty SHARED
  "terminal_library_flutter_pty.c"
)

set_target_properties(terminal_library_flutter_pty PROPERTIES
  PUBLIC_HEADER terminal_library_flutter_pty.h
  OUTPUT_NAME "terminal_library_flutter_pty"
)

target_compile_definitions(terminal_library_flutter_pty PUBLIC DART_SHARED_LIB)
