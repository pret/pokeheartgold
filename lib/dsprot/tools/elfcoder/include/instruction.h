#ifndef INSTRUCTION_H
#define INSTRUCTION_H

typedef union {
    unsigned int  raw           : 32;
    struct __attribute__((packed, aligned(4))) {
        // LE assumed
        unsigned int  operands  : 24;
        unsigned int  opcode    :  8;
    };
} Instruction;

#endif
