#ifndef DSPROT_ENCODING_CONSTANTS_H
#define DSPROT_ENCODING_CONSTANTS_H

#define INS_OPCODE_LINKBIT (0x01)
#define INS_OPCODE_MASK    (0xFF000000)
#define INS_OPCODE_SHIFT   (24)
#define INS_OPERANDS_MASK  (0x00FFFFFF)

#ifndef SDK_ASM
#define ADDR_PLUS_ADDEND(ref, addend) ((u32)(&ref + ((addend) / sizeof(ref))))
#endif // SDK_ASM

#define ENC_VAL_1 (0x1300)
#define ENC_VAL_2 ((ENC_VAL_1 >> 2) + 2)

#define ENC_BYTE_A (0x56)
#define ENC_BYTE_B (0x65)
#define ENC_BYTE_C (0x56)
#define ENC_BYTE_D (0xF0)

#define ENC_SBOX_XOR (0x01)

#endif // DSPROT_ENCODING_CONSTANTS_H
