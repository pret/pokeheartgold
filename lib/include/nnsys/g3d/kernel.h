#ifndef NNSYS_G3D_KERNEL_H_
#define NNSYS_G3D_KERNEL_H_

#include <nitro.h>
#include <nnsys/g3d/config.h>
#include <nnsys/g3d/binres/res_struct.h>

typedef u32 NNSG3dTexKey;    // compatible with NNSGfdTexKey
typedef u32 NNSG3dPlttKey;   // compatible with NNSGfdPlttKey

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
    NNSG3dAnmObj* anmJnt; // 10
    NNSG3dFuncAnmBlendJnt funcBlendJnt;
    NNSG3dAnmObj* anmVis;
    NNSG3dFuncAnmBlendVis funcBlendVis;
    NNSG3dSbcCallBackFunc cbFunc; // 20
    u8 cbCmd;
    u8 cbTiming;
    u16 dummy_;
    NNSG3dSbcCallBackFunc cbInitFunc;
    void* ptrUser;
    u8* ptrUserSbc; // 30
    struct NNSG3dJntAnmResult_* recJntAnm;
    struct NNSG3dMatAnmResult_* recMatAnm;
    u32 hintMatAnmExist[NNS_G3D_SIZE_MAT_MAX / 32];
    u32 hintJntAnmExist[NNS_G3D_SIZE_JNT_MAX / 32];
    u32 hintVisAnmExist[NNS_G3D_SIZE_JNT_MAX / 32];
} NNSG3dRenderObj; // size=0x54

void NNS_G3dRenderObjAddAnmObj(NNSG3dRenderObj* pRenderObj, NNSG3dAnmObj* pAnmObj);
void NNS_G3dRenderObjRemoveAnmObj(NNSG3dRenderObj* pRenderObj, NNSG3dAnmObj* pAnmObj);
void NNS_G3dRenderObjInit(NNSG3dRenderObj* pRenderObj, NNSG3dResMdl* pResMdl);
void NNS_G3dAnmObjInit(NNSG3dAnmObj* pAnmObj, void* pResAnm, const NNSG3dResMdl* pResMdl, const NNSG3dResTex* pResTex);
BOOL NNS_G3dBindMdlSet(NNSG3dResMdlSet* pMdlSet, const NNSG3dResTex* pTex);
u32 NNS_G3dTexGetRequiredSize(const NNSG3dResTex* pTex);
u32 NNS_G3dTex4x4GetRequiredSize(const NNSG3dResTex* pTex);
void NNS_G3dTexSetTexKey(NNSG3dResTex* pTex, NNSG3dTexKey texKey, NNSG3dTexKey tex4x4Key);
void NNS_G3dTexLoad(NNSG3dResTex* pTex, BOOL exec_begin_end);
void NNS_G3dTexReleaseTexKey(NNSG3dResTex* pTex, NNSG3dTexKey* texKey, NNSG3dTexKey* tex4x4Key);

u32 NNS_G3dPlttGetRequiredSize(const NNSG3dResTex* pTex);
void NNS_G3dPlttSetPlttKey(NNSG3dResTex* pTex, NNSG3dPlttKey plttKey);
void NNS_G3dPlttLoad(NNSG3dResTex* pTex, BOOL exec_begin_end);
NNSG3dPlttKey NNS_G3dPlttReleasePlttKey(NNSG3dResTex* pTex);

#endif //NNSYS_G3D_KERNEL_H_
