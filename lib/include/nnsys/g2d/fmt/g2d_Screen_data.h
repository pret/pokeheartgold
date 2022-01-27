#ifndef NNSYS_G2D_FMT_G2D_SCREEN_DATA_H_
#define NNSYS_G2D_FMT_G2D_SCREEN_DATA_H_

typedef struct NNSG2dScreenData {
    u16 screenWidth;
    u16 screenHeight;
    u16 colorMode;
    u16 screenFormat;
    u32 szByte;
    u32 rawData[1];
} NNSG2dScreenData;

#endif //NNSYS_G2D_FMT_G2D_SCREEN_DATA_H_
