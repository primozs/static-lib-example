#include <span>
#include <string>

#include "engine.h"
#include "utils/log.h"

// clang tidy test
int test(int num) {
   int a = 3;
   return num * a * 5;
}

int main() {
   // int a = 5, b = 10;
   // auto result = a <=> b;
   std::string result = "Krneki";
   utils::log(result);

   int arr[] = {1, 2, 3, 4, 5};
   std::span<int> span(arr);
   utils::log("Hello world 2", 1, 2, "Three");
   engine::printMessage();

   return 0;
}
