#ifndef NNSYS_G2D_FMT_G2D_SCREEN_DATA_H_
#define NNSYS_G2D_FMT_G2D_SCREEN_DATA_H_

#include <nitro.h>

typedef enum NNSG2dScreenFormat {
    NNS_G2D_SCREENFORMAT_TEXT,
    NNS_G2D_SCREENFORMAT_AFFINE,
    NNS_G2D_SCREENFORMAT_AFFINEEXT,
    NNS_G2D_SCREENFORMAT_PLTBMP,
    NNS_G2D_SCREENFORMAT_DCBMP,
} NNSG2dScreenFormat;

typedef struct NNSG2dScreenData {
    u16 screenWidth;
    u16 screenHeight;
    u16 colorMode;
    u16 screenFormat;
    u32 szByte;
    u32 rawData[1];
} NNSG2dScreenData;

#endif // NNSYS_G2D_FMT_G2D_SCREEN_DATA_H_
