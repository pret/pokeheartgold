#ifndef ENCODER_H
#define ENCODER_H

#include <stdio.h>

#include "elf.h"
#include "instruction.h"
#include "rc4.h"

enum {
    ENC_ENCODE,
    ENC_DECODE,
    ENC_INVALID
};

enum {
    MODE_KEYED,
    MODE_UNKEYED,
    MODE_INVALID
};

typedef struct {
    char **inputs;
    char *output_fname;
    int encoding_type;
    int key_mode;
    char **symbols;
    char *wrapper_prefix;
    char *replace_prefix;
    char *garbage;
    uint32_t key;
    int verbose;
} EncodingTask;

void Encode_Instruction(Instruction *ins, RC4_Ctx *rc4);
void Encode_Relocation(Elf32_Rela *reloc);
void Decode_Instruction(Instruction *ins, RC4_Ctx *rc4);
void Decode_Relocation(Elf32_Rela *reloc);

#endif
