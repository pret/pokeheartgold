#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "digest.h"
#include "files.h"
#include "global.h"
#include "misc.h"
#include "print.h"

typedef struct {
    uint unk0;
    uint unk4;
    uint unk8;
    uint unkC;
    uint unk10;
    uint unk14;
    uint unk18;
    int unk1C;
    char unk20[0x40];
    uint unk60;
    uint unk64;
    char unk68[0xC];
} HashWork;

typedef bool (*Hash2ResetCb)(HashWork *hashWork);
typedef uint (*Hash2SetSourceCb)(HashWork *hashWork, char *digestKey, int digestKeySize);
typedef uint (*Hash2GetDigestCb)(HashWork *hashWork, char *digestBuffer);

typedef struct {
    int unk0;
    int blockSize;
    HashWork *hashWork;
    char *unkC;
    Hash2ResetCb hash2Reset;
    Hash2SetSourceCb hash2SetSource;
    Hash2GetDigestCb hash2GetDigest;
} HmacParam;

static void DGT_Hash2CalcHmac(char *hash, char *content, int size, char *digestKey, int digestKeySize);
static bool DGT_SetOverlayTableMode(bool mode);
static bool DGT_Hash2Reset(HashWork *hashWork);
static uint DGT_Hash2SetSource(HashWork *hashWork, char *digestKey, int digestKeySize);
static uint DGT_Hash2GetDigest(HashWork *hashWork, char *digestBuffer);
static void DGT_Hash2SetPadding(HashWork *hashWork);
static void DGT_Hash2DoProcess(HashWork *hashWork);
static void HmacCalc(char *hash, char *content, int size, char *digestKey, int digestKeySize, HmacParam *param);

// Set default DigestFunc
DigestFunc gDigestFunc = DGT_Hash2CalcHmac;

static DigestFunc sDigestFuncs[] = { NULL, DGT_Hash2CalcHmac };
static char sDefaultDigestKey[] = {
    0x21, 0x06, 0xc0, 0xde, 0xba, 0x98, 0xce, 0x3f, 0xa6, 0x92, 0xe3, 0x9d,
    0x46, 0xf2, 0xed, 0x01, 0x76, 0xe3, 0xcc, 0x08, 0x56, 0x23, 0x63, 0xfa,
    0xca, 0xd4, 0xec, 0xdf, 0x9a, 0x62, 0x78, 0x34, 0x8f, 0x6d, 0x63, 0x3c,
    0xfe, 0x22, 0xca, 0x92, 0x20, 0x88, 0x97, 0x23, 0xd2, 0xcf, 0xae, 0xc2,
    0x32, 0x67, 0x8d, 0xfe, 0xca, 0x83, 0x64, 0x98, 0xac, 0xfd, 0x3e, 0x37,
    0x87, 0x46, 0x58, 0x24,
};

bool Init_Digest(uint digestType, char *digestKey) {
    bool success;

    if (digestType < 1 || digestType > 2) {
        ErrorPrintf("Unknown digest type\n");
        success = false;
    } else {
        DigestFunc digestFunc = sDigestFuncs[digestType - 1];
        if (digestFunc == NULL) {
            ErrorPrintf("Unsupported digest\n");
            success = false;
        } else {
            gDigestFunc = digestFunc;
            if (gDigestKey != NULL) {
                free(gDigestKey);
                gDigestKey = NULL;
            }
            if (digestKey == NULL) {
                gDigestKey = calloc(1, DIGEST_KEY_SIZE);
                if (gDigestKey == NULL) {
                    ErrorPrintf("Cannot allocate memory.\n");
                    return false;
                }
                memcpy(gDigestKey, sDefaultDigestKey, DIGEST_KEY_SIZE);
                gDigestKeySize = DIGEST_KEY_SIZE;
            } else {
                gDigestKeySize = ReadFile(digestKey, &gDigestKey);
                if (gDigestKeySize < 0) {
                    return false;
                }
                if (gDigestKeySize < DIGEST_KEY_SIZE) {
                    ErrorPrintf("Key file size should be >= %d bytes\n", DIGEST_KEY_SIZE);
                    return false;
                }
            }
            success = true;
        }
    }
    return success;
}

void Calc_Digest(char *content, int size, char *hash, bool overlayTableMode) {
    byte hashBuffer[40];

    bool oldMode = DGT_SetOverlayTableMode(overlayTableMode);
    gDigestFunc(hashBuffer, content, size, gDigestKey, gDigestKeySize);
    DGT_SetOverlayTableMode(oldMode);
    int iCpy = 0;
    for (int i = 0; i < 20; i++) {
        hashBuffer[i] = hashBuffer[iCpy + 1] ^ hashBuffer[iCpy];
        iCpy++;
    }
    printf(": Digest ");
    for (int i = 0; i < 20; i++) {
        printf("%02X", hashBuffer[i]);
    }
    printf(" %8ld\n", (long int)size);
    CopyBuffer(hashBuffer, hash, 20);
}

static void DGT_Hash2CalcHmac(char *hash, char *content, int size, char *digestKey, int digestKeySize) {
    HashWork hashWork;
    char unkBuffer1[0x20];
    HmacParam param = {0};

    param.unk0 = 20;
    param.blockSize = DIGEST_KEY_SIZE;
    param.hashWork = &hashWork;
    param.unkC = unkBuffer1;
    param.hash2Reset = DGT_Hash2Reset;
    param.hash2SetSource = DGT_Hash2SetSource;
    param.hash2GetDigest = DGT_Hash2GetDigest;
    HmacCalc(hash, content, size, digestKey, digestKeySize, &param);
}

static bool DGT_SetOverlayTableMode(bool mode) {
    bool oldMode = gOverlayTableMode;
    gOverlayTableMode = mode;
    return oldMode;
}

static bool DGT_Hash2Reset(HashWork *hashWork) {
    if (hashWork != NULL) {
        hashWork->unk14 = 0;
        hashWork->unk18 = 0;
        hashWork->unk1C = 0;
        hashWork->unk0 = 0x67452301;
        hashWork->unk4 = 0xefcdab89;
        hashWork->unk8 = 0x98badcfe;
        hashWork->unkC = 0x10325476;
        hashWork->unk10 = 0xc3d2e1f0;
        hashWork->unk60 = 0;
        hashWork->unk64 = 0;
    }
    return hashWork == NULL;
}

static uint DGT_Hash2SetSource(HashWork *hashWork, char *digestKey, int digestKeySize) {
    uint ret;

    if (digestKeySize == 0) {
        ret = 0;
    } else if (hashWork == NULL || digestKey == NULL) {
        ret = 1;
    } else if (hashWork->unk60 = 0) {
        if (hashWork->unk64 == 0) {
            while (digestKeySize -= 1, digestKeySize != -1 && hashWork->unk64 == 0) {
                hashWork->unk20[hashWork->unk1C] = *digestKey;
                hashWork->unk1C += 1;
                hashWork->unk14 += 8;
                if (hashWork->unk1C == 0 && (hashWork->unk18 += 1, hashWork->unk18 == 0)) {
                    hashWork->unk64 = 1;
                }
                if (hashWork->unk1C == 0x40) {
                    DGT_Hash2DoProcess(hashWork);
                }
                digestKey++;
            }
            ret = 0;
        } else {
            ret = hashWork->unk64;
        }
    } else {
        hashWork->unk64 = 3;
        ret = 3;
    }
    return ret;
}

static uint DGT_Hash2GetDigest(HashWork *hashWork, char *digestBuffer) {
    uint ret;

    if (hashWork == NULL || digestBuffer == NULL) {
        ret = 1;
    } else if (hashWork->unk64 == 0) {
        if (hashWork->unk60 == 0) {
            DGT_Hash2SetPadding(hashWork);
            for (int i = 0; i < 0x40; i++) {
                hashWork->unk20[i] = '\0';
            }
            hashWork->unk14 = 0;
            hashWork->unk18 = 0;
            hashWork->unk60 = 1;
        }
        for (int i = 0; i < 20; i++) {
            digestBuffer[i] = (char)(*(uint *)(hashWork->unk20 + (i >> 2) * 4 + -0x20) >> ((3u - ((byte)i % 4)) * 8u & 0x1f));
        }
        ret = 0;
    } else {
        ret = hashWork->unk64;
    }
    return ret;
}

static void DGT_Hash2SetPadding(HashWork *hashWork) {
    if (hashWork->unk1C < 0x38) {
        hashWork->unk20[hashWork->unk1C] = -0x80;
        hashWork->unk1C += 1;
        while (hashWork->unk1C < 0x38) {
            hashWork->unk20[hashWork->unk1C] = '\0';
            hashWork->unk1C += 1;
        }
    } else {
        hashWork->unk20[hashWork->unk1C] = -0x80;
        hashWork->unk1C += 1;
        while (hashWork->unk1C < 0x40) {
            hashWork->unk20[hashWork->unk1C] = '\0';
            hashWork->unk1C += 1;
        }
        DGT_Hash2DoProcess(hashWork);
        while (hashWork->unk1C < 0x38) {
            hashWork->unk20[hashWork->unk1C] = '\0';
            hashWork->unk1C += 1;
        }
    }
    hashWork->unk20[0x38] = (char)(hashWork->unk18 >> 0x18);
    hashWork->unk20[0x39] = (char)(hashWork->unk18 >> 0x10);
    hashWork->unk20[0x3a] = (char)(hashWork->unk18 >> 8);
    hashWork->unk20[0x3b] = *(char *)(&hashWork->unk18);
    hashWork->unk20[0x3c] = (char)(hashWork->unk14 >> 0x18);
    hashWork->unk20[0x3d] = (char)(hashWork->unk14 >> 0x10);
    hashWork->unk20[0x3e] = (char)(hashWork->unk14 >> 8);
    hashWork->unk20[0x3f] = *(char *)(&hashWork->unk14);
    DGT_Hash2DoProcess(hashWork);
}

// SHA hash
static void DGT_Hash2DoProcess(HashWork *hashWork) {
    uint temp;
    int temp2;
    uint buffer[99];
    int i, idx;

    if (gOverlayTableMode) {
        buffer[10] = *(uint *)(hashWork->unk20 + 0x18);
        buffer[9] = *(uint *)(hashWork->unk20 + 0x38);
        *(uint *)(hashWork->unk20 + 0x18) = 0;
        *(uint *)(hashWork->unk20 + 0x38) = 0;
    }
    for (i = 0; i < 0x10; i++) {
        buffer[i + 0x10] = (uint)(byte)hashWork->unk20[i * 4] << 0x18;
        buffer[i + 0x10] = (uint)(byte)hashWork->unk20[i * 4 + 1] << 0x10 | buffer[i + 0x10];
        buffer[i + 0x10] = (uint)(byte)hashWork->unk20[i * 4 + 2] << 8 | buffer[i + 0x10];
        buffer[i + 0x10] = (uint)(byte)hashWork->unk20[i * 4 + 3] | buffer[i + 0x10];
    }
    for (i = 0x10; i < 0x50; i++) {
        temp = buffer[i + 0xd] ^ buffer[i + 8] ^ buffer[i + 2] ^ buffer[i];
        buffer[i + 0x10] = temp << 1 | (uint)((int)temp < 0);
    }
    buffer[14] = hashWork->unk4;
    buffer[13] = hashWork->unk8;
    buffer[12] = hashWork->unkC;
    buffer[11] = hashWork->unk10;
    buffer[15] = hashWork->unk0;
    for (i = 0; i < 0x14; i++) {
        temp2 = (~buffer[14] & buffer[12] | buffer[14] & buffer[13]) +
                (buffer[15] << 5 | buffer[15] >> 0x1b) + buffer[11];
        idx = i + 0x10;
        buffer[11] = buffer[12];
        buffer[12] = buffer[13];
        buffer[13] = buffer[14] << 0x1e | buffer[14] >> 2;
        buffer[14] = buffer[15];
        buffer[15] = buffer[idx] + temp2 + 0x5a827999;
    }
    for (i = 0x14; i < 0x28; i = i + 1) {
        temp2 = (buffer[13] ^ buffer[14] ^ buffer[12]) + (buffer[15] << 5 | buffer[15] >> 0x1b) +
                buffer[11];
        idx = i + 0x10;
        buffer[11] = buffer[12];
        buffer[12] = buffer[13];
        buffer[13] = buffer[14] << 0x1e | buffer[14] >> 2;
        buffer[14] = buffer[15];
        buffer[15] = buffer[idx] + temp2 + 0x6ed9eba1;
    }
    for (i = 0x28; i < 0x3c; i++) {
        temp2 = (buffer[12] & buffer[13] | (buffer[12] | buffer[13]) & buffer[14]) +
                (buffer[15] << 5 | buffer[15] >> 0x1b) + buffer[11];
        idx = i + 0x10;
        buffer[11] = buffer[12];
        buffer[12] = buffer[13];
        buffer[13] = buffer[14] << 0x1e | buffer[14] >> 2;
        buffer[14] = buffer[15];
        buffer[15] = buffer[idx] + temp2 + 0x8f1bbcdc;
    }
    for (i = 0x3c; i < 0x50; i++) {
        temp2 = (buffer[13] ^ buffer[14] ^ buffer[12]) + (buffer[15] << 5 | buffer[15] >> 0x1b) +
                buffer[11];
        idx = i + 0x10;
        buffer[11] = buffer[12];
        buffer[12] = buffer[13];
        buffer[13] = buffer[14] << 0x1e | buffer[14] >> 2;
        buffer[14] = buffer[15];
        buffer[15] = buffer[idx] + temp2 + 0xca62c1d6;
    }
    hashWork->unk0 = buffer[15] + hashWork->unk0;
    hashWork->unk4 = buffer[14] + hashWork->unk4;
    hashWork->unk8 = buffer[13] + hashWork->unk8;
    hashWork->unkC = buffer[12] + hashWork->unkC;
    hashWork->unk10 = buffer[11] + hashWork->unk10;
    hashWork->unk1C = 0;
    if (gOverlayTableMode) {
        *(uint *)(hashWork->unk20 + 0x18) = buffer[10];
        *(uint *)(hashWork->unk20 + 0x38) = buffer[9];
    }
}

static void HmacCalc(char *hash, char *content, int size, char *digestKey, int digestKeySize, HmacParam *param) {
    byte digestBuffer[0x4C];
    byte *key;
    int keySize;
    char innerKey[0x48];
    char outerKey[0x40];
    int i;

    if (hash != NULL && content != NULL && size != 0 && digestKey != NULL &&
        digestKeySize != 0 && param != NULL) {
            if (param->blockSize < digestKeySize) {
                param->hash2Reset(param->hashWork);
                param->hash2SetSource(param->hashWork, digestKey, digestKeySize);
                param->hash2GetDigest(param->hashWork, digestBuffer);
                key = digestBuffer;
                keySize = param->unk0;
            } else {
                key = digestKey;
                keySize = digestKeySize;
            }
            for (i = 0; i < keySize; i++) {
                innerKey[i] = key[i] ^ 0x36;
            }
            for (; i < param->blockSize; i++) {
                innerKey[i] = 0x36;
            }
            param->hash2Reset(param->hashWork);
            param->hash2SetSource(param->hashWork, innerKey, param->blockSize);
            param->hash2SetSource(param->hashWork, content, size);
            param->hash2GetDigest(param->hashWork, param->unkC);

            for (i = 0; i < keySize; i++) {
                outerKey[i] = key[i] ^ 0x5c;
            }
            for (; i < param->blockSize; i++) {
                outerKey[i] = 0x5c;
            }
            param->hash2Reset(param->hashWork);
            param->hash2SetSource(param->hashWork, outerKey, param->blockSize);
            param->hash2SetSource(param->hashWork, param->unkC, param->unk0);
            param->hash2GetDigest(param->hashWork, hash);
    }
}
