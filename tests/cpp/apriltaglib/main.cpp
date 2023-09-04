

#ifdef _WIN32
#pragma warning(disable : 4200)
#elif defined(__clang__)
#pragma clang diagnostic ignored "-Wc99-extensions"
#elif defined(__GNUC__)
#pragma GCC diagnostic ignored "-Wpedantic"
#endif

#include <apriltag.h>

#include <iostream>

int main() {
  std::cout << "Included april tags!" << std::endl;
  return 0;
}
