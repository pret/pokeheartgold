#ifndef DIGEST_H
#define DIGEST_H

#include <stdbool.h>
#include "global.h"

#define DIGEST_KEY_SIZE (0x40)

typedef void (*DigestFunc)(char *a0, char *content, int a2, char *digestKey, int digestKeySize);

DigestFunc gDigestFunc;
char *gDigestKey;
int gDigestKeySize;
int gOverlayTableMode;

bool Init_Digest(uint digestType, char *digestKey);
void Calc_Digest(char *content, int a1, char *a2, int a3);

#endif // DIGEST_H
