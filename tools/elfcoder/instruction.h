#ifndef INSTRUCTION_H
#define INSTRUCTION_H

#include <stdint.h>
#include <stdio.h>

typedef struct {
    unsigned int operands : 24;
    unsigned int opcode : 8;
} Instruction;

void Instructions_Read(Instruction *dst, unsigned int count, FILE *src);
void Instructions_Write(Instruction *src, unsigned int count, FILE *dst);

static inline uint32_t Instruction_GetFull(Instruction *dst) {
    return (dst->opcode << 24) | dst->operands;
}

static inline void Instruction_SetFull(Instruction *dst, uint32_t full) {
    dst->opcode = full >> 24;
    dst->operands = full & 0x00FFFFFF;
}

#endif
