#ifndef NITRO_CP_CONTEXT_H_
#define NITRO_CP_CONTEXT_H_

#include <nitro/types.h>

typedef struct CPContext {
    u64 div_numer;
    u64 div_denom;
    u64 sqrt;
    u16 div_mode;
    u16 sqrt_mode;
} CPContext;

void CP_SaveContext(register CPContext *context);
void CPi_RestoreContext(register CPContext *context);

#endif //NITRO_CP_CONTEXT_H_
