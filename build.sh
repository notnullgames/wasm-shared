#!/bin/sh

mkdir -p docs

cd host
emcmake cmake -B build -GNinja
cmake --build build
mv build/host.* ../docs

cd ../cart
cmake -B build -GNinja
cmake --build build
mv build/cart.* ../docs