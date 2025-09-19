#pragma once

#include <stdbool.h>

#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */

    void computeInverseWithCheck(const float (*mat)[16], float (*inv)[16], bool *invertible);

#ifdef __cplusplus
}
#endif /* __cplusplus */
