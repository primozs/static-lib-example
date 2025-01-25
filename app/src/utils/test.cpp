#include <stdexcept>

namespace test {
bool compare(int a, int b) {
   if (a < 0 || b < 0) {
      throw std::invalid_argument("received negative value");
   }
   return a < b;
}

bool some_func() noexcept {
   bool res = compare(-1, 1);
   return res;
}
}  // namespace test
