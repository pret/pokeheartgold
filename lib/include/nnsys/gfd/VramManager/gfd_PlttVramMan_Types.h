#ifndef NNSYS_GFD_VRAMMANAGER_GFD_PLTTVRAMMAN_TYPES_H_
#define NNSYS_GFD_VRAMMANAGER_GFD_PLTTVRAMMAN_TYPES_H_

typedef u32 NNSGfdPlttKey;

#define NNS_GFD_ALLOC_ERROR_PLTTKEY         (u32)0x0

#define NNS_GFD_PLTTKEY_ADDR_SHIFT 3

typedef NNSGfdPlttKey (*NNSGfdFuncAllocPlttVram)(u32 szByte, BOOL is4pltt, u32 opt);
typedef int (*NNSGfdFuncFreePlttVram)(NNSGfdPlttKey plttKey);

extern NNSGfdFuncAllocPlttVram NNS_GfdDefaultFuncAllocPlttVram;
extern NNSGfdFuncFreePlttVram NNS_GfdDefaultFuncFreePlttVram;

static inline u32 NNS_GfdGetPlttKeyAddr(NNSGfdPlttKey plttKey) {
    return (u32)((0x0000FFFF & plttKey) << NNS_GFD_PLTTKEY_ADDR_SHIFT);
}

#endif //NNSYS_GFD_VRAMMANAGER_GFD_PLTTVRAMMAN_TYPES_H_
