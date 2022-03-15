#ifndef NNSYS_GFD_VRAMMANAGER_GFD_TEXVRAMMAN_TYPES_H_
#define NNSYS_GFD_VRAMMANAGER_GFD_TEXVRAMMAN_TYPES_H_

typedef u32 NNSGfdTexKey;

#define NNS_GFD_ALLOC_ERROR_TEXKEY          (u32)0x0

typedef NNSGfdTexKey (*NNSGfdFuncAllocTexVram)(u32 szByte, BOOL is4x4comp, u32 opt);
typedef int (*NNSGfdFuncFreeTexVram)(NNSGfdTexKey key);

extern NNSGfdFuncAllocTexVram NNS_GfdDefaultFuncAllocTexVram;
extern NNSGfdFuncFreeTexVram NNS_GfdDefaultFuncFreeTexVram;

#endif //NNSYS_GFD_VRAMMANAGER_GFD_TEXVRAMMAN_TYPES_H_
