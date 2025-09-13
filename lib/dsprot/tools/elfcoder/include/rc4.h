#ifndef RC4_H
#define RC4_H

#include <stdint.h>

#define RC4_KEY_SIZE 16

typedef struct {
    uint8_t S[256];
    uint8_t i;
    uint8_t j;
} RC4_Ctx;

void RC4_Init(RC4_Ctx *ctx, uint8_t *k);
uint8_t RC4_Byte(RC4_Ctx *ctx);

#endif
