#!/bin/bash

# Create the new directory and move there.
mkdir compiler
cd compiler

# Download and extract the sources of Binutils.
wget https://ftp.gnu.org/gnu/binutils/binutils-2.37.tar.xz
tar -xf binutils-2.37.tar.xz

# Download and extract the sources of GCC.
wget https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz
tar -xf gcc-11.2.0.tar.xz

# Download and extract the sources of GDB.
wget https://ftp.gnu.org/gnu/gdb/gdb-11.1.tar.xz
tar -xf gdb-11.1.tar.xz

cd ..
