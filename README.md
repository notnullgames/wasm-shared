This is an experiment with sharing memory between 2 wasms, to work out ideas for null0.

This should allow passing pointers back & forth between host & cart.

## build

```
emcmake cmake -B build -GNinja
cmake --build build
```

## host

This is a web-based host, compiled with emscripten. It has it's memory exported.


## cart

This is user-code, and must import it's memory (which comes from host.)

