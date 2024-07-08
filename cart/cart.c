#define WASM_IMPORT(n) __attribute__((import_module("env"), import_name(n)))

WASM_IMPORT("logtest")
void logtest(char* message);

int main(int argc, char* argv[]) {
  logtest("I am inside the cart!");
  return 0;
}