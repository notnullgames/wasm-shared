This is an experiment with sharing memory between 2 wasms, to work out ideas for null0.

This should allow passing pointers back & forth between host & cart.

## build

```
./build.sh
```

## host

This is a web-based host, compiled with emscripten. It has it's memory exported.


## cart

This is user-code, and must import it's memory (which comes from host.) It is built with wasi-sdk, for a very low-level no-frills wasm.

