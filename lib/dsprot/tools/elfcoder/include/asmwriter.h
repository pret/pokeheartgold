#ifndef ASMWRITER_H
#define ASMWRITER_H

#include <stdint.h>

#include "encoder.h"

typedef struct {
    char*     output_fname;
    char**    symbols;
    char*     wrapper_prefix;
    char*     garbage;
    int*      symbol_sizes;
    int       key_mode;
    uint32_t  key;
    int       valid;
} ASMWriter_Ctx;

void ASMWriter_Init(ASMWriter_Ctx* asmw, EncodingTask* task);
void ASMWriter_SetSymbolSize(ASMWriter_Ctx* asmw, char* symbol_name, int size);
void ASMWriter_SetInvalid(ASMWriter_Ctx* asmw);
int ASMWriter_Finalize(ASMWriter_Ctx* asmw);

#endif
