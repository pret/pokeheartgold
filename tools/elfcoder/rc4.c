#include "rc4.h"

void RC4_Init(RC4_Ctx *ctx, uint8_t *k) {
    ctx->i = 0;
    ctx->j = 0;

    for (int i = 0; i < 256; i++) {
        ctx->S[i] = i;
    }

    /*
    uint8_t j = 0;
    for (int i = 0; i < 256; i++) {
        j += ctx->S[i] + k[i % RC4_KEY_SIZE];

        int tmp = ctx->S[i];
        ctx->S[i] = ctx->S[j];
        ctx->S[j] = tmp;
    }
    */
    //     ^^^^ This is how you init RC4.
    //     vvvv This is NOT how you init RC4, but it's what they do, so..
    int ki = 0;
    uint8_t j = 0;
    for (int i = 255; i >= 0; i--) {
        j += ctx->S[i] + k[ki++ % RC4_KEY_SIZE];

        int tmp = ctx->S[i];
        ctx->S[i] = ctx->S[j];
        ctx->S[j] = tmp;
    }
}

uint8_t RC4_Byte(RC4_Ctx *ctx) {
    ctx->i += 1;
    ctx->j += ctx->S[ctx->i];

    int tmp = ctx->S[ctx->i];
    ctx->S[ctx->i] = ctx->S[ctx->j];
    ctx->S[ctx->j] = tmp;

    uint8_t idx = ctx->S[ctx->i] + ctx->S[ctx->j];
    return ctx->S[idx];
}
