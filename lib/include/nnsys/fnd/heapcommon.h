#ifndef NNSYS_FND_HEAPCOMMON_H_
#define NNSYS_FND_HEAPCOMMON_H_

#include <nnsys/fnd/list.h>

typedef struct NNSiFndHeapHead NNSiFndHeapHead;

struct NNSiFndHeapHead
{
    u32 signature;

    NNSFndLink link;
    NNSFndList childList;

    void *heapStart;
    void *heapEnd;

    u32 attribute;
};

typedef NNSiFndHeapHead* NNSFndHeapHandle;

#endif //NNSYS_FND_HEAPCOMMON_H_
