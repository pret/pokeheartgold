#include "MSL_C/stdlib.h"
#pragma thumb off

static unsigned long int random_next = 1;

int rand(void) {
    random_next = random_next * 1103515245 + 12345;
    return (random_next >> 16) & 0x7fff;
}

void srand(unsigned int seed) {
    random_next = seed;
}
