#ifndef NNSYS_GFD_VRAMMANAGER_GFD_PLTTVRAMMAN_TYPES_H_
#define NNSYS_GFD_VRAMMANAGER_GFD_PLTTVRAMMAN_TYPES_H_

typedef u32 NNSGfdPlttKey;

#define NNS_GFD_ALLOC_ERROR_PLTTKEY         (u32)0x0

typedef NNSGfdPlttKey (*NNSGfdFuncAllocPlttVram)(u32 szByte, BOOL is4pltt, u32 opt);
typedef int (*NNSGfdFuncFreePlttVram)(NNSGfdPlttKey plttKey);

extern NNSGfdFuncAllocPlttVram NNS_GfdDefaultFuncAllocPlttVram;
extern NNSGfdFuncFreePlttVram NNS_GfdDefaultFuncFreePlttVram;

#endif //NNSYS_GFD_VRAMMANAGER_GFD_PLTTVRAMMAN_TYPES_H_
