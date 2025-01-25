
#include <iostream>

namespace utils {
  inline void log2() {}

  template <typename T, typename... Args>
  void log2(T var1, Args... var2)
  {
    std::cout << var1 << " ";
    log2(var2...);
    std::cout << "\n";
  }

  void log3(const char* str) {
    std::cout << str << "\n";
  }
}
