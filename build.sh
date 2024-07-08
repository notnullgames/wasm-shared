#!/bin/sh

mkdir -p build

cd host
emcmake cmake -B build -GNinja
cmake --build build
mv build/host.* ../build

cd ../cart
cmake -B build -GNinja
cmake --build build
mv build/cart.* ../build