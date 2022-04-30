#ifndef DIGEST_H
#define DIGEST_H

#include <stdbool.h>
#include "global.h"

#define DIGEST_KEY_SIZE  (0x40)
#define DIGEST_HASH_SIZE (0x14)

typedef void (*DigestFunc)(char *hash, char *content, int size, char *digestKey, int digestKeySize);

bool Init_Digest(uint digestType, char *digestKey);
void Calc_Digest(char *content, int size, char *hash, bool overlayTableMode);

#endif // DIGEST_H
