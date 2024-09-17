#ifndef NNSYS_G2D_FMT_G2D_MULTICELL_DATA_H_
#define NNSYS_G2D_FMT_G2D_MULTICELL_DATA_H_

#include <nitro.h>

typedef struct NNSG2dMultiCellHierarchyData {
    u16 animSequenceIdx;
    s16 posX;
    s16 posY;
    u16 nodeAttr;
} NNSG2dMultiCellHierarchyData;

typedef struct NNSG2dMultiCellData {
    u16 numNodes;
    u16 numCellAnim;
    NNSG2dMultiCellHierarchyData *pHierDataArray;
} NNSG2dMultiCellData;

typedef struct NNSG2dMultiCellDataBank {
    u16 numMultiCellData;
    u16 pad16;
    NNSG2dMultiCellData *pMultiCellDataArray;
    NNSG2dMultiCellHierarchyData *pHierarchyDataArray;
    void *pStringBank;
    void *pExtendedData;
} NNSG2dMultiCellDataBank;

#endif // NNSYS_G2D_FMT_G2D_MULTICELL_DATA_H_
