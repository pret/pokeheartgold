#ifndef NNSYS_G3D_KERNEL_H_
#define NNSYS_G3D_KERNEL_H_

typedef struct NNSG3dAnmObj_ {
    fx32 frame;
    fx32 ratio;
    void* resAnm;
    void* funcAnm;
    struct NNSG3dAnmObj_* next;
    const NNSG3dResTex* resTex;
    u8 priority;
    u8 numMapData;
    u16 mapData[1];
} NNSG3dAnmObj;

struct NNSG3dMatAnmResult_;
struct NNSG3dJntAnmResult_;
struct NNSG3dVisAnmResult_;

typedef BOOL (*NNSG3dFuncAnmBlendMat)(struct NNSG3dMatAnmResult_*, const NNSG3dAnmObj*, u32);
typedef BOOL (*NNSG3dFuncAnmBlendJnt)(struct NNSG3dJntAnmResult_*, const NNSG3dAnmObj*, u32);
typedef BOOL (*NNSG3dFuncAnmBlendVis)(struct NNSG3dVisAnmResult_*, const NNSG3dAnmObj*, u32);

struct NNSG3dRS_;
typedef void (*NNSG3dSbcCallBackFunc)(struct NNSG3dRS_*);

typedef struct NNSG3dRenderObj_ {
    u32 flag;
    NNSG3dResMdl* resMdl;
    NNSG3dAnmObj* anmMat;
    NNSG3dFuncAnmBlendMat funcBlendMat;
    NNSG3dAnmObj* anmJnt;
    NNSG3dFuncAnmBlendJnt funcBlendJnt;
    NNSG3dAnmObj* anmVis;
    NNSG3dFuncAnmBlendVis funcBlendVis;
    NNSG3dSbcCallBackFunc cbFunc;
    u8 cbCmd;
    u8 cbTiming;
    u16 dummy_;
    NNSG3dSbcCallBackFunc cbInitFunc;
    void* ptrUser;
    u8* ptrUserSbc;
    struct NNSG3dJntAnmResult_* recJntAnm;
    struct NNSG3dMatAnmResult_* recMatAnm;
    u32 hintMatAnmExist[NNS_G3D_SIZE_MAT_MAX / 32];
    u32 hintJntAnmExist[NNS_G3D_SIZE_JNT_MAX / 32];
    u32 hintVisAnmExist[NNS_G3D_SIZE_JNT_MAX / 32];
} NNSG3dRenderObj;

void NNS_G3dRenderObjAddAnmObj(NNSG3dRenderObj* pRenderObj, NNSG3dAnmObj* pAnmObj);
void NNS_G3dRenderObjRemoveAnmObj(NNSG3dRenderObj* pRenderObj, NNSG3dAnmObj* pAnmObj);

#endif //NNSYS_G3D_KERNEL_H_
