#ifndef NITRO_MATH_DGT_H_
#define NITRO_MATH_DGT_H_

#include <nitro/dgt/common.h>

#define MATH_MD5_DIGEST_SIZE    DGT_HASH1_DIGEST_SIZE
#define MATH_SHA1_DIGEST_SIZE   DGT_HASH2_DIGEST_SIZE
#define MATH_MD5_BLOCK_SIZE     DGT_HASH_BLOCK_SIZE
#define MATH_SHA1_BLOCK_SIZE    DGT_HASH_BLOCK_SIZE

void MATH_CalcMD5(void *digest, const void *data, u32 dataLength);
void MATH_CalcSHA1(void *digest, const void *data, u32 dataLength);

#endif //NITRO_MATH_DGT_H_
