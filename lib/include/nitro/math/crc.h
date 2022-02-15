#ifndef NITRO_MATH_CRC_H_
#define NITRO_MATH_CRC_H_

#define MATH_CRC8_STANDARD_POLY     0x07
#define MATH_CRC8_STANDARD_INIT     0

#define MATH_CRC16_STANDARD_POLY    0xa001
#define MATH_CRC16_STANDARD_INIT    0
#define MATH_CRC16_CCITT_POLY       0x1021
#define MATH_CRC16_CCITT_INIT       0xffff

#define MATH_CRC32_STANDARD_POLY    0xedb88320
#define MATH_CRC32_STANDARD_INIT    0xffffffff
#define MATH_CRC32_POSIX_POLY       0x04c11db7
#define MATH_CRC32_POSIX_INIT       0

typedef u8 MATHCRC8Context;
typedef u16 MATHCRC16Context;
typedef u32 MATHCRC32Context;

typedef struct MATHCRC8Table {
    u8 table[256];
} MATHCRC8Table;

typedef struct MATHCRC16Table {
    u16 table[256];
} MATHCRC16Table;

typedef struct MATHCRC32Table {
    u32 table[256];
} MATHCRC32Table;

void MATHi_CRC8InitTable(MATHCRC8Table *table, u8 poly);
void MATHi_CRC8InitTableRev(MATHCRC8Table *table, u8 poly);

static inline void MATHi_CRC8Init(MATHCRC8Context *context, u8 init) {
    *context = init;
}

void MATHi_CRC8Update(const MATHCRC8Table *table, MATHCRC8Context *context, const void *input, u32 length);
static inline void MATHi_CRC8UpdateRev(const MATHCRC8Table *table, MATHCRC8Context *context, const void *input, u32 length) {
    MATHi_CRC8Update(table, context, input, length);
}

static inline u8 MATHi_CRC8GetHash(MATHCRC8Context *context) {
    return *context;
}

static inline void MATH_CRC8InitTable(MATHCRC8Table *table) {
    MATHi_CRC8InitTable(table, MATH_CRC8_STANDARD_POLY);
}

static inline void MATH_CRC8Init(MATHCRC8Context *context) {
    MATHi_CRC8Init(context, MATH_CRC8_STANDARD_INIT);
}

static inline void MATH_CRC8Update(const MATHCRC8Table *table, MATHCRC8Context *context, const void *input, u32 length) {
    MATHi_CRC8Update(table, context, input, length);
}

static inline u8 MATH_CRC8GetHash(MATHCRC8Context *context) {
    return MATHi_CRC8GetHash(context);
}

void MATHi_CRC16InitTable(MATHCRC16Table *table, u16 poly);
void MATHi_CRC16InitTableRev(MATHCRC16Table *table, u16 poly);

static inline void MATHi_CRC16Init(MATHCRC16Context *context, u16 init) {
    *context = init;
}

void MATHi_CRC16Update(const MATHCRC16Table *table, MATHCRC16Context *context, const void *input, u32 length);
void MATHi_CRC16UpdateRev(const MATHCRC16Table *table, MATHCRC16Context *context, const void *input, u32 length);

static inline u16 MATHi_CRC16GetHash(MATHCRC16Context *context) {
    return *context;
}

static inline void MATH_CRC16InitTable(MATHCRC16Table *table) {
    MATHi_CRC16InitTable(table, MATH_CRC16_CCITT_POLY);
}

static inline void MATH_CRC16Init(MATHCRC16Context *context) {
    MATHi_CRC16Init(context, MATH_CRC16_CCITT_INIT);
}

static inline void MATH_CRC16Update(const MATHCRC16Table *table, MATHCRC16Context *context, const void *input, u32 length) {
    MATHi_CRC16Update(table, context, input, length);
}

static inline u16 MATH_CRC16GetHash(MATHCRC16Context *context) {
    return MATHi_CRC16GetHash(context);
}

u16 MATH_CalcCRC16CCITT(const MATHCRC16Table *table, const void *input, u32 length);

#endif //NITRO_MATH_CRC_H_
