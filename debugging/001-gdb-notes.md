What is Debugging ?
===================

Debugging is the Art and Science of finding and eliminating bugs in software, and
this is very useful because bugs can be simple functional issues or can have 
security implications.

What is a Debugger ?
====================

This is a program to analyze and debug other programs.

Examples:

  gdb, ollygdb, lldb

Compiling with debugging symbols
================================

gcc -ggdb -o demo1 demo1.c

The -g gdb compiler option allows to include information about
variables, functions, scopes for the gdb debugger.

The debugger understand the binary better.

The Debug Symbols can be part of the binary or can be in a separte file.

Debug symbol file types are: DWARF 2, COFF, XCOFF, Stabs

What do the Symbol Files Tell Us ?
==================================

gcc -ggdb -o demo2 demo2.c

gdb ./program/demo2

gdb> info sources <- Tell us the files with the source code of the binary
gdb> list <- Show us the source code of the program
gdb> info variables <- Show us the list of global variables (not local
variables)
gdb> info functions <- Show us the list of functions
gdb> info scope function_name <- Show us local variables and other stuff in
the scope of an specific function
maint print  symbols filename_to_store

Ripping Symbols off a Binary
============================
objcopy --only-keep-debug rip_from_binary debug_file

Stripping Symbols off a Binary
==============================
strip --strip-debug --strip-unneeded binary_to_strip

Adding Debug Symbols to a Binary
================================
# 1
objcopy --add-gnu-debuglink=debug_file binary

# 2
gdb ./program/demo2
gdb> symbol-file file_name
