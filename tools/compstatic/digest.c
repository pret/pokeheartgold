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
    uint intermediateHash[5];
    uint lengthLow;
    uint lengthHigh;
    int messageBlockIdx;
    byte messageBlock[64];
    bool computed;
    uint corrupted;
} DGTHash2Context;

typedef bool (*Hash2ResetCb)(DGTHash2Context *hashCtx);
typedef uint (*Hash2SetSourceCb)(DGTHash2Context *hashCtx, char *digestKey, int digestKeySize);
typedef uint (*Hash2GetDigestCb)(DGTHash2Context *hashCtx, char *digestBuffer);

typedef struct {
    int unk0;
    int blockSize;
    DGTHash2Context *hashCtx;
    char *unkC;
    Hash2ResetCb hash2Reset;
    Hash2SetSourceCb hash2SetSource;
    Hash2GetDigestCb hash2GetDigest;
} HmacParam;

static void DGT_Hash2CalcHmac(char *hash, char *content, int size, char *digestKey, int digestKeySize);
static bool DGT_SetOverlayTableMode(bool mode);
static bool DGT_Hash2Reset(DGTHash2Context *hashCtx);
static uint DGT_Hash2SetSource(DGTHash2Context *hashCtx, char *digestKey, int digestKeySize);
static uint DGT_Hash2GetDigest(DGTHash2Context *hashCtx, char *digestBuffer);
static void DGT_Hash2SetPadding(DGTHash2Context *hashCtx);
static void DGT_Hash2DoProcess(DGTHash2Context *hashCtx);
static void HmacCalc(char *hash, char *content, int size, char *digestKey, int digestKeySize, HmacParam *param);

// Set default DigestFunc
static DigestFunc sDigestFunc = DGT_Hash2CalcHmac;

static DigestFunc sDigestFuncs[] = { NULL, DGT_Hash2CalcHmac };
static char sDefaultDigestKey[] = {
    0x21, 0x06, 0xc0, 0xde, 0xba, 0x98, 0xce, 0x3f, 0xa6, 0x92, 0xe3, 0x9d,
    0x46, 0xf2, 0xed, 0x01, 0x76, 0xe3, 0xcc, 0x08, 0x56, 0x23, 0x63, 0xfa,
    0xca, 0xd4, 0xec, 0xdf, 0x9a, 0x62, 0x78, 0x34, 0x8f, 0x6d, 0x63, 0x3c,
    0xfe, 0x22, 0xca, 0x92, 0x20, 0x88, 0x97, 0x23, 0xd2, 0xcf, 0xae, 0xc2,
    0x32, 0x67, 0x8d, 0xfe, 0xca, 0x83, 0x64, 0x98, 0xac, 0xfd, 0x3e, 0x37,
    0x87, 0x46, 0x58, 0x24,
};

static char *sDigestKey;
static int sDigestKeySize;
static bool sOverlayTableMode;

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
            sDigestFunc = digestFunc;
            if (sDigestKey != NULL) {
                free(sDigestKey);
                sDigestKey = NULL;
            }
            if (digestKey == NULL) {
                sDigestKey = calloc(1, DIGEST_KEY_SIZE);
                if (sDigestKey == NULL) {
                    ErrorPrintf("Cannot allocate memory.\n");
                    return false;
                }
                memcpy(sDigestKey, sDefaultDigestKey, DIGEST_KEY_SIZE);
                sDigestKeySize = DIGEST_KEY_SIZE;
            } else {
                sDigestKeySize = ReadFile(digestKey, &sDigestKey);
                if (sDigestKeySize < 0) {
                    return false;
                }
                if (sDigestKeySize < DIGEST_KEY_SIZE) {
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
    sDigestFunc((char *)hashBuffer, content, size, sDigestKey, sDigestKeySize);
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
    CopyBuffer((char *)hashBuffer, hash, 20);
}

static void DGT_Hash2CalcHmac(char *hash, char *content, int size, char *digestKey, int digestKeySize) {
    DGTHash2Context hashCtx;
    char unkBuffer1[0x20];
    HmacParam param = {0};

    param.unk0 = 20;
    param.blockSize = DIGEST_KEY_SIZE;
    param.hashCtx = &hashCtx;
    param.unkC = unkBuffer1;
    param.hash2Reset = DGT_Hash2Reset;
    param.hash2SetSource = DGT_Hash2SetSource;
    param.hash2GetDigest = DGT_Hash2GetDigest;
    HmacCalc(hash, content, size, digestKey, digestKeySize, &param);
}

static bool DGT_SetOverlayTableMode(bool mode) {
    bool oldMode = sOverlayTableMode;
    sOverlayTableMode = mode;
    return oldMode;
}

static bool DGT_Hash2Reset(DGTHash2Context *hashCtx) {
    if (hashCtx != NULL) {
        hashCtx->intermediateHash[0] = 0x67452301;
        hashCtx->intermediateHash[1] = 0xefcdab89;
        hashCtx->intermediateHash[2] = 0x98badcfe;
        hashCtx->intermediateHash[3] = 0x10325476;
        hashCtx->intermediateHash[4] = 0xc3d2e1f0;
        hashCtx->lengthLow = 0;
        hashCtx->lengthHigh = 0;
        hashCtx->messageBlockIdx = 0;
        hashCtx->computed = false;
        hashCtx->corrupted = 0;
    }
    return hashCtx == NULL;
}

static uint DGT_Hash2SetSource(DGTHash2Context *hashCtx, char *digestKey, int digestKeySize) {
    uint ret;

    if (digestKeySize == 0) {
        ret = 0;
    } else if (hashCtx == NULL || digestKey == NULL) {
        ret = 1;
    } else if (!hashCtx->computed) {
        if (hashCtx->corrupted == 0) {
            while (digestKeySize -= 1, digestKeySize != -1 && hashCtx->corrupted == 0) {
                hashCtx->messageBlock[hashCtx->messageBlockIdx] = *digestKey;
                hashCtx->messageBlockIdx += 1;
                hashCtx->lengthLow += 8;
                if (hashCtx->messageBlockIdx == 0 && (hashCtx->lengthHigh += 1, hashCtx->lengthHigh == 0)) {
                    hashCtx->corrupted = 1;
                }
                if (hashCtx->messageBlockIdx == 0x40) {
                    DGT_Hash2DoProcess(hashCtx);
                }
                digestKey++;
            }
            ret = 0;
        } else {
            ret = hashCtx->corrupted;
        }
    } else {
        hashCtx->corrupted = 3;
        ret = 3;
    }
    return ret;
}

static uint DGT_Hash2GetDigest(DGTHash2Context *hashCtx, char *digestBuffer) {
    uint ret;

    if (hashCtx == NULL || digestBuffer == NULL) {
        ret = 1;
    } else if (hashCtx->corrupted == 0) {
        if (!hashCtx->computed) {
            DGT_Hash2SetPadding(hashCtx);
            for (int i = 0; i < 0x40; i++) {
                hashCtx->messageBlock[i] = '\0';
            }
            hashCtx->lengthLow = 0;
            hashCtx->lengthHigh = 0;
            hashCtx->computed = true;
        }
        for (int i = 0; i < 20; i++) {
            digestBuffer[i] = (char)(*(uint *)(hashCtx->messageBlock + (i >> 2) * 4 + -0x20) >> ((3u - ((byte)i % 4)) * 8u & 0x1f));
        }
        ret = 0;
    } else {
        ret = hashCtx->corrupted;
    }
    return ret;
}

static void DGT_Hash2SetPadding(DGTHash2Context *hashCtx) {
    if (hashCtx->messageBlockIdx < 0x38) {
        hashCtx->messageBlock[hashCtx->messageBlockIdx] = -0x80;
        hashCtx->messageBlockIdx += 1;
        while (hashCtx->messageBlockIdx < 0x38) {
            hashCtx->messageBlock[hashCtx->messageBlockIdx] = '\0';
            hashCtx->messageBlockIdx += 1;
        }
    } else {
        hashCtx->messageBlock[hashCtx->messageBlockIdx] = -0x80;
        hashCtx->messageBlockIdx += 1;
        while (hashCtx->messageBlockIdx < 0x40) {
            hashCtx->messageBlock[hashCtx->messageBlockIdx] = '\0';
            hashCtx->messageBlockIdx += 1;
        }
        DGT_Hash2DoProcess(hashCtx);
        while (hashCtx->messageBlockIdx < 0x38) {
            hashCtx->messageBlock[hashCtx->messageBlockIdx] = '\0';
            hashCtx->messageBlockIdx += 1;
        }
    }
    hashCtx->messageBlock[0x38] = hashCtx->lengthHigh >> 0x18;
    hashCtx->messageBlock[0x39] = (byte)(hashCtx->lengthHigh >> 0x10);
    hashCtx->messageBlock[0x3a] = (byte)(hashCtx->lengthHigh >> 8);
    hashCtx->messageBlock[0x3b] = (byte)(hashCtx->lengthHigh);
    hashCtx->messageBlock[0x3c] = hashCtx->lengthLow >> 0x18;
    hashCtx->messageBlock[0x3d] = (byte)(hashCtx->lengthLow >> 0x10);
    hashCtx->messageBlock[0x3e] = (byte)(hashCtx->lengthLow >> 8);
    hashCtx->messageBlock[0x3f] = (byte)(hashCtx->lengthLow);
    DGT_Hash2DoProcess(hashCtx);
}

// SHA hash
static void DGT_Hash2DoProcess(DGTHash2Context *hashCtx) {
    uint temp;
    int temp2;
    uint buffer[99];
    int i, idx;

    if (sOverlayTableMode) {
        buffer[10] = *(uint *)(hashCtx->messageBlock + 0x18);
        buffer[9] = *(uint *)(hashCtx->messageBlock + 0x38);
        *(uint *)(hashCtx->messageBlock + 0x18) = 0;
        *(uint *)(hashCtx->messageBlock + 0x38) = 0;
    }
    for (i = 0; i < 0x10; i++) {
        buffer[i + 0x10] = (uint)(byte)hashCtx->messageBlock[i * 4] << 0x18;
        buffer[i + 0x10] = (uint)(byte)hashCtx->messageBlock[i * 4 + 1] << 0x10 | buffer[i + 0x10];
        buffer[i + 0x10] = (uint)(byte)hashCtx->messageBlock[i * 4 + 2] << 8 | buffer[i + 0x10];
        buffer[i + 0x10] = (uint)(byte)hashCtx->messageBlock[i * 4 + 3] | buffer[i + 0x10];
    }
    for (i = 0x10; i < 0x50; i++) {
        temp = buffer[i + 0xd] ^ buffer[i + 8] ^ buffer[i + 2] ^ buffer[i];
        buffer[i + 0x10] = temp << 1 | (uint)((int)temp < 0);
    }
    buffer[14] = hashCtx->intermediateHash[1];
    buffer[13] = hashCtx->intermediateHash[2];
    buffer[12] = hashCtx->intermediateHash[3];
    buffer[11] = hashCtx->intermediateHash[4];
    buffer[15] = hashCtx->intermediateHash[0];
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
    hashCtx->intermediateHash[0] += buffer[15];
    hashCtx->intermediateHash[1] += buffer[14];
    hashCtx->intermediateHash[2] += buffer[13];
    hashCtx->intermediateHash[3] += buffer[12];
    hashCtx->intermediateHash[4] += buffer[11];
    hashCtx->messageBlockIdx = 0;
    if (sOverlayTableMode) {
        *(uint *)(hashCtx->messageBlock + 0x18) = buffer[10];
        *(uint *)(hashCtx->messageBlock + 0x38) = buffer[9];
    }
}

static void HmacCalc(char *hash, char *content, int size, char *digestKey, int digestKeySize, HmacParam *param) {
    char digestBuffer[0x4C];
    char *key;
    int keySize;
    char innerKey[0x48];
    char outerKey[0x40];
    int i;

    if (hash != NULL && content != NULL && size != 0 && digestKey != NULL &&
        digestKeySize != 0 && param != NULL) {
            if (param->blockSize < digestKeySize) {
                param->hash2Reset(param->hashCtx);
                param->hash2SetSource(param->hashCtx, digestKey, digestKeySize);
                param->hash2GetDigest(param->hashCtx, digestBuffer);
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
            param->hash2Reset(param->hashCtx);
            param->hash2SetSource(param->hashCtx, innerKey, param->blockSize);
            param->hash2SetSource(param->hashCtx, content, size);
            param->hash2GetDigest(param->hashCtx, param->unkC);

            for (i = 0; i < keySize; i++) {
                outerKey[i] = key[i] ^ 0x5c;
            }
            for (; i < param->blockSize; i++) {
                outerKey[i] = 0x5c;
            }
            param->hash2Reset(param->hashCtx);
            param->hash2SetSource(param->hashCtx, outerKey, param->blockSize);
            param->hash2SetSource(param->hashCtx, param->unkC, param->unk0);
            param->hash2GetDigest(param->hashCtx, hash);
    }
}
