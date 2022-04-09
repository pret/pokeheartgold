#ifndef POKEHEARTGOLD_MATH_UTIL_H
#define POKEHEARTGOLD_MATH_UTIL_H

#include "heap.h"

u16 GF_DegreeToSinCosIdxNoWrap(u16 deg);
fx32 GF_SinDegNoWrap(u16 deg);
fx32 GF_CosDegNoWrap(u16 deg);
fx32 GF_SinDeg(u16 deg);
fx32 GF_CosDeg(u16 deg);
u16 GF_DegreeToSinCosIdxNoWrap(u16 deg);
u16 GF_DegreeToSinCosIdx(u16 deg);
fx32 GF_SinDegFX32(fx32 deg);
fx32 GF_CosDegFX32(fx32 deg);
u32 PRandom(u32 seed);
void MTX22_2DAffine(MtxFx22 * mtx, u16 radians, fx32 x, fx32 y, u8 type);
u32 Math_CalcArraySum(const void *data, u32 size);
u16 GF_CalcCRC16(const void *data, u32 size);
void GF_CRC16Init(HeapID heapId);
u16 LCRandom(void);
void SetLCRNGSeed(u32 seed);
u32 GetLCRNGSeed(void);
void SetMTRNGSeed(u32 seed);
u32 MTRandom(void);
void _MonEncryptSegment(u16 *data, u32 size, u32 seed);
void _MonDecryptSegment(u16 *data, u32 size, u32 seed);

static inline u16 LCRandRange(const u16 maximum) {
    GF_ASSERT(maximum != 0);
    if (maximum <= 1) {
        return 0;
    } else {
        return LCRandom() % maximum;
    }
}

static inline void SetVecFx32(VecFx32 *dest, fx32 x, fx32 y, fx32 z) {
    dest->x = x;
    dest->y = y;
    dest->z = z;
}

#endif //POKEHEARTGOLD_MATH_UTIL_H
