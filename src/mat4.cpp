#include "mat4.h"
#include <Eigen/Dense>

extern "C"
{
    void computeInverseWithCheck(const float (*mat)[16], float (*inv)[16], bool *invertible)
    {
        Eigen::Map<const Eigen::Matrix4f> m(*mat);
        Eigen::Map<Eigen::Matrix4f> inverse(*inv);
        m.computeInverseWithCheck(inverse, *invertible, 0.01);
    }
}
