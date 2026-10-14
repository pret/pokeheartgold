#ifndef SPL_RANDOM_H
#define SPL_RANDOM_H

#include <nitro/fx/fx_vec.h>
#include <nitro/types.h>

extern u32 gSPLRandomState;

void SPLRandom_VecFx32(VecFx32 *vec);
void SPLRandom_VecFx32_XY(VecFx32 *vec);

/**
 * @brief Generates a random number
 */
static inline u32 SPLRandom_Next()
{
    gSPLRandomState = gSPLRandomState * 0x5eedf715 + 0x1b0cb173;
    return gSPLRandomState;
}

/**
 * @brief Generates a random number in the range [0, 2^bits)
 * @param bits The number of bits to generate
 */
static inline u32 SPLRandom_U32(u32 bits)
{
    return SPLRandom_Next() >> (sizeof(u32) * 8 - bits);
}

/**
 * @brief Generates a random number in the range [0, 2^bits)
 * @param bits The number of bits to generate
 */
static inline s32 SPLRandom_S32(u32 bits)
{
    return (s32)(SPLRandom_Next() >> (sizeof(u32) * 8 - bits));
}

/**
 * @brief Generates a random number in the range [0, 2^bits)
 * @param bits The number of bits to generate
 */
static inline fx32 SPLRandom_FX32(u32 bits)
{
    return (fx32)SPLRandom_Next() >> (sizeof(u32) * 8 - bits);
}

/**
 * @brief Generates a random number in the range [num * (1 - range), num)
 * @param num The number to scale, can be both an integer or a fixed-point number
 * @param range The range to scale the number by, integer in the range [0, 255], which maps to [0, 1]
 */
#define SPLRandom_ScaledRangeFX32(num, range) (((num) * (255 - (((range) * (fx32)SPLRandom_U32(8)) >> 8))) >> 8)

/**
 * @brief Generates a random number in the range [num * (1 - range), num * 2 * (1 - range))
 * @param num The number to scale, can be both an integer or a fixed-point number
 * @param range The range to scale the number by, integer in the range [0, 255], which maps to [0, 1]
 */
#define SPLRandom_DoubleScaledRangeFX32(num, range) ((num) * (255 + (range) - (((range) * (fx32)SPLRandom_U32(8)) >> 7)) >> 8)

/**
 * @brief Generates a random number in the range [-num, num)
 * @param num The number to scale, can be both an integer or a fixed-point number
 */
#define SPLRandom_RangeFX32(num) (((num) * (s32)SPLRandom_U32(9) - ((num) << 8)) >> 8)

/**
 * @brief Generates a random fx32 number in the range [min, max)
 * @param min The minimum number to generate, integer
 * @param max The maximum number to generate, integer
 */
#define SPLRandom_BetweenFX32(min, max) ((fx32)(((max) - (min)) * SPLRandom_U32(12) + ((min) * FX32_ONE)))

#endif // SPL_RANDOM_H
