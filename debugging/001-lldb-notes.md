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

clang -g -O0 -o demo1 demo1.c

The -g compiler option allows to include information about
variables, functions, scopes for the gdb debugger.

The -O0 option excludes any optimization in the code.


What do the Symbol Files Tell Us ?
==================================

clang -ggdb -o demo2 demo2.c

lldb ./program/demo2

lldb> image list <- List current executable and dependent shared library images.
lldb> target select 0 <- Select a target as the current target by target index.
lldb> source list -l1 -c22 <- Show us the source code of the program
lldb>image lookup -v -n func_name <- show us local variables in a function
 
Ripping Symbols off a Binary
============================

Stripping Symbols off a Binary
==============================

Adding Debug Symbols to a Binary
================================


Using python to debug a function
================================

lldb> breakpoint set --name "main"
lldb> breakpoint command add --script-type python 1

> thread = frame.GetThread()
> caller = thread.GetFrameAtIndex(1)
> if caller.GetFunctionName() != "hooverFunction":
>     process = thread.GetProcess()
>     process.Continue()
> DONE

lldb> run

