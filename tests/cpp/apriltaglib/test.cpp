
#include "gtest/gtest.h"
#include <apriltag.h>

TEST(BasicTest, BasicTest) {
    apriltag_detector_t *detector = apriltag_detector_create();
    EXPECT_NE(nullptr, detector);
    apriltag_detector_destroy(detector);
}