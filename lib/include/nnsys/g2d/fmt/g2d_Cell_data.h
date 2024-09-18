#ifndef NNSYS_G2D_FMT_G2D_CELL_DATA_H_
#define NNSYS_G2D_FMT_G2D_CELL_DATA_H_

#include <nitro.h>
#include <nnsys/g2d/fmt/g2d_Character_data.h>

typedef struct NNSG2dCellOAMAttrData {
    u16 attr0;
    u16 attr1;
    u16 attr2;

} NNSG2dCellOAMAttrData;

typedef struct NNSG2dCellData {
    u16 numOAMAttrs;
    u16 cellAttr;
    NNSG2dCellOAMAttrData *pOamAttrArray;
} NNSG2dCellData;

typedef struct NNSG2dCellVramTransferData {
    u32 srcDataOffset;
    u32 szByte;

} NNSG2dCellVramTransferData;

typedef struct NNSG2dVramTransferData {
    u32 szByteMax;
    NNSG2dCellVramTransferData *pCellTransferDataArray;

} NNSG2dVramTransferData;

typedef struct NNSG2dCellDataBank {
    u16 numCells;
    u16 cellBankAttr;
    NNSG2dCellData *pCellDataArrayHead;
    NNSG2dCharacterDataMapingType mappingMode;
    NNSG2dVramTransferData *pVramTransferData;
    void *pStringBank;
    void *pExtendedData;
} NNSG2dCellDataBank;

#endif // NNSYS_G2D_FMT_G2D_CELL_DATA_H_
