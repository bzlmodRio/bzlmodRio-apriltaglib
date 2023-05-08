
#include <apriltag.h>

#include "gtest/gtest.h"

TEST(BasicTest, Basic) {
  apriltag_detector_t *detector = apriltag_detector_create();
  EXPECT_NE(nullptr, detector);
  apriltag_detector_destroy(detector);
}
