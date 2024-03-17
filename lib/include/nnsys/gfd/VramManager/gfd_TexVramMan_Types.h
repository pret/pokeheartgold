#ifndef NNSYS_GFD_VRAMMANAGER_GFD_TEXVRAMMAN_TYPES_H_
#define NNSYS_GFD_VRAMMANAGER_GFD_TEXVRAMMAN_TYPES_H_

#include <nitro.h>

typedef u32 NNSGfdTexKey;

#define NNS_GFD_ALLOC_ERROR_TEXKEY          (u32)0x0

#define NNS_GFD_TEXKEY_ADDR_SHIFT 3

typedef NNSGfdTexKey (*NNSGfdFuncAllocTexVram)(u32 szByte, BOOL is4x4comp, u32 opt);
typedef int (*NNSGfdFuncFreeTexVram)(NNSGfdTexKey key);

extern NNSGfdFuncAllocTexVram NNS_GfdDefaultFuncAllocTexVram;
extern NNSGfdFuncFreeTexVram NNS_GfdDefaultFuncFreeTexVram;

static inline u32 NNS_GfdGetTexKeyAddr(NNSGfdTexKey memKey) {
    return (u32)((0x0000FFFF & memKey) << NNS_GFD_TEXKEY_ADDR_SHIFT);
}

static inline NNSGfdTexKey NNS_GfdAllocTexVram(u32 szByte, BOOL is4x4comp, u32 opt) {
    return (*NNS_GfdDefaultFuncAllocTexVram)(szByte, is4x4comp, opt );
}

static inline int NNS_GfdFreeTexVram(NNSGfdTexKey memKey) {
    return (*NNS_GfdDefaultFuncFreeTexVram)(memKey);
}


#endif //NNSYS_GFD_VRAMMANAGER_GFD_TEXVRAMMAN_TYPES_H_
