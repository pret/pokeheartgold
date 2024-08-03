#ifndef POKEHEARTGOLD_CONSTANTS_OPCODE_H
#define POKEHEARTGOLD_CONSTANTS_OPCODE_H

#define OPCODE_EQU         0
#define OPCODE_NEQ         1
#define OPCODE_GT          2
#define OPCODE_LTE         3
#define OPCODE_FLAG_SET    4
#define OPCODE_FLAG_NOT    5
#define OPCODE_AND         6
#define OPCODE_SET         7
#define OPCODE_ADD         8
#define OPCODE_SUB         9
#define OPCODE_FLAG_ON     10
#define OPCODE_FLAG_OFF    11
#define OPCODE_MUL         12
#define OPCODE_DIV         13
#define OPCODE_LEFT_SHIFT  14
#define OPCODE_RIGHT_SHIFT 15
#define OPCODE_FLAG_INDEX  16
#define OPCODE_GET         17
#define OPCODE_SUB_TO_ZERO 18
#define OPCODE_BITWISE_XOR 19
#define OPCODE_BITWISE_AND 20

#define CHECK_OPCODE_HAVE     0
#define CHECK_OPCODE_NOT_HAVE 1

#define CHECK_SIDE_COND_VAL_ZERO     0
#define CHECK_SIDE_COND_VAL_NOT_ZERO 1
#define CHECK_SIDE_COND_CLEAR        2

#endif // POKEHEARTGOLD_CONSTANTS_SCRCMD_H
