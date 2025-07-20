#include "MSL_C/stdlib.h"
#pragma thumb off

int abs(int val) {
    return val < 0 ? -val : val;
}
