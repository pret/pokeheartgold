#ifndef NNS_G2D_G2D_NODE_H_
#define NNS_G2D_G2D_NODE_H_

#include <nitro.h>
#include <nnsys/g2d/fmt/g2d_SRTControl_data.h>

typedef enum NNSG2dNodeType {
    NNS_G2D_NODETYPE_INVALID = 0,
    NNS_G2D_NODETYPE_CELL,
    NNS_G2D_NODETYPE_MULTICELL,
    NNS_G2D_NODETYPE_MAX

} NNSG2dNodeType;

typedef struct NNSG2dNode {
    void *pContent;
    NNSG2dNodeType type;
    BOOL bVisible;
    NNSG2dSRTControl srtCtrl;

} NNSG2dNode;

#endif // NNS_G2D_G2D_NODE_H_
