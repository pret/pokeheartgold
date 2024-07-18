#ifndef NNSYS_FND_LIST_H_
#define NNSYS_FND_LIST_H_

#include <nitro.h>

typedef struct {
    void *prevObject;
    void *nextObject;

} NNSFndLink;

typedef struct {
    void *headObject;
    void *tailObject;
    u16 numObjects;
    u16 offset;

} NNSFndList;

#endif //NNSYS_FND_LIST_H_
