#pragma once
#include <iostream>

namespace utils {
void log3(const char* str);

template <typename... Args>
void log(Args... args) {
   ((std::cout << args << ", "), ...);
}
}  // namespace utils
