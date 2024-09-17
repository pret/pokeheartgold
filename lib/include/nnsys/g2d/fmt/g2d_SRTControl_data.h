#ifndef NNSYS_G2D_FMT_G2D_SRTCONTROL_DATA_H
#define NNSYS_G2D_FMT_G2D_SRTCONTROL_DATA_H

#include <nitro.h>
#include <nnsys/g2d/g2d_Vec_data.h>

typedef enum {
    NNS_G2D_SRTCONTROLTYPE_INVALID,
    NNS_G2D_SRTCONTROLTYPE_SRT,
    NNS_G2D_SRTCONTROLTYPE_MTX2D,
    NNS_G2D_SRTCONTROLTYPE_MTX3D,
    NNS_G2D_SRTCONTROLTYPE_MAX
} NNSG2dSRTControlType;

typedef union {
    struct {
        NNSG2dFVec2 scale;
        NNSG2dSVec2 trans;
        u16 rotZ;
        u16 SRT_EnableFlag;
    };
    MtxFx32 mtx;
} NNSG2dSRTData;

typedef struct {
    NNSG2dSRTControlType type;
    NNSG2dSRTData srtData;
} NNSG2dSRTControl;

#endif // NNSYS_G2D_FMT_G2D_SRTCONTROL_DATA_H
