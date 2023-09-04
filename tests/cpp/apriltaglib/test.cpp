

#ifdef _WIN32
#pragma warning(disable : 4200)
#elif defined(__clang__)
#pragma clang diagnostic ignored "-Wc99-extensions"
#elif defined(__GNUC__)
#pragma GCC diagnostic ignored "-Wpedantic"
#endif

#include <apriltag.h>

#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  apriltag_detector_t *detector = apriltag_detector_create();
  EXPECT_NE(nullptr, detector);
  apriltag_detector_destroy(detector);
}
