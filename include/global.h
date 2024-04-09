#ifndef POKEHEARTGOLD_GLOBAL_H
#define POKEHEARTGOLD_GLOBAL_H

#include <nitro.h>
#include <nitro/code16.h>
#include <nnsys.h>

#include <stdlib.h>
#include <string.h>
#include <stddef.h>

#include "config.h" // MUST COME BEFORE ANY OTHER GAMEFREAK HEADERS
#include "constants/global.h"
#include "pm_version.h"
#include "assert.h"

#define NELEMS(a) (sizeof(a) / sizeof(*(a)))

typedef struct {
    int x;
    int y;
    int z;
} Vec32;

#define ARRAY_ASSIGN(dest, src) {                         \
    struct tmp { typeof(*(dest)) _[NELEMS(dest)]; };      \
    *(struct tmp *)&(dest) = *(const struct tmp *)&(src); \
}

#endif //POKEHEARTGOLD_GLOBAL_H
