#include "instruction.h"

void Instructions_Read(Instruction *dst, unsigned int count, FILE *src) {
    for (int i = 0; i < count; i++) {
        uint32_t raw;
        fread(&raw, sizeof(uint32_t), 1, src);
        Instruction_SetFull(&dst[i], raw);
    }
}

void Instructions_Write(Instruction *src, unsigned int count, FILE *dst) {
    for (int i = 0; i < count; i++) {
        uint32_t raw = Instruction_GetFull(&src[i]);
        fwrite(&raw, sizeof(uint32_t), 1, dst);
    }
}
