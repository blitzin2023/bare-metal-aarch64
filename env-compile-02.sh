#!/bin/bash

export PREFIX="$PWD/prefix"     # Installation prefix.
export TARGET=aarch64-elf       # Target architecture.
export PATH="$PREFIX/bin:$PATH" # Put (not yet) installed stuff in the PATH.

cd compiler

# Compiling and installing Binutils.
mkdir build-binutils
cd build-binutils
../binutils-2.37/configure --target=$TARGET --prefix="$PREFIX" \
  --with-sysroot --disable-nls --disable-werror
make -j 8  # Running with 8 jobs, but feel free to change that.
make install
cd ..
rm -rf build-binutils binutils-2.37

# Compiling and installing GCC (needs the above extension of PATH).
mkdir build-gcc
cd build-gcc
../gcc-11.2.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls \
  --enable-languages=c --without-headers
make -j 8 all-gcc
make -j 8 all-target-libgcc
make install-gcc
make install-target-libgcc
cd ..
rm -rf build-gcc gcc-11.2.0

# Compiling and installing GDB (needs the above extension of PATH).
mkdir build-gdb
cd build-gdb
../gdb-11.1/configure --target=$TARGET --prefix="$PREFIX"
make -j 8
make install
cd ..
rm -rf build-gdb gdb-11.1
cd ..

cd ..
