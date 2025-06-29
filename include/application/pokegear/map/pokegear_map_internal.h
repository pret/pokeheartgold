#ifndef POKEHEARTGOLD_APPLICATION_POKEGEAR_MAP_POKEGEAR_MAP_INTERNAL_H
#define POKEHEARTGOLD_APPLICATION_POKEGEAR_MAP_POKEGEAR_MAP_INTERNAL_H

#include "constants/roamer.h"

#include "application/pokegear/pokegear_internal.h"

#include "obj_char_transfer.h"
#include "safari_zone.h"
#include "unk_02013534.h"

typedef struct UnkStruct_ov101_021F79B4 {
    u16 unk_00;
    u16 unk_02;
    u8 unk_04;
    u8 unk_05;
    u8 unk_06;
    u8 unk_07;
    u8 unk_08;
    u8 unk_09;
    u8 unk_0A_0 : 4;
    u8 unk_0A_4 : 4;
    u8 unk_0B;
    u8 unk_0C;
} UnkStruct_ov101_021F79B4;

typedef struct PokegearMapAppData_Sub044 {
    UnkStruct_02013950 *unk_0;
    UnkStruct_02021AC8 unk_4;
} PokegearMapAppData_Sub044;

typedef struct PokegearMapAppData_Sub0C8 {
    fx32 unk_00;
    fx32 unk_04;
    fx32 unk_08;
    fx32 unk_0C;
    int unk_10;
    int unk_14;
    fx32 unk_18;
    fx32 unk_1C;
    fx32 unk_20;
    fx32 unk_24;
    u16 unk_28;
    u16 unk_2A;
    u16 unk_2C;
    u16 unk_2E;
    s16 unk_30;
    s16 unk_32;
    s16 unk_34;
    s16 unk_36;
} PokegearMapAppData_Sub0C8;

typedef struct PokegearMapAppData_Sub214 {
    u16 unk_0;
    u8 unk_2;
    u8 unk_3;
    u16 unk_4_0 : 4;
    u16 unk_4_4 : 4;
    u16 unk_4_8 : 4;
    u16 unk_4_C : 4;
    u8 unk_6;
    u8 unk_7;
    u8 unk_8;
    u8 unk_9;
    u8 unk_A;
    u8 unk_B;
    u8 unk_C;
    u8 unk_D;
    u8 unk_E;
    u8 unk_F;
} PokegearMapAppData_Sub214;

typedef struct PokegearMapAppData_Sub118_Sub4 {
    UnkStruct_0202F3DC unk_00;
    u8 unk_10;
    u8 unk_11;
    u8 unk_12;
    u8 unk_13;
} PokegearMapAppData_Sub118_Sub4;

typedef struct PokegearMapAppData_Sub118 {
    const PokegearMapAppData_Sub214 *unk_0;
    PokegearMapAppData_Sub118_Sub4 *unk_4;
    u16 unk_8;
    u16 unk_A;
} PokegearMapAppData_Sub118;

typedef struct PokegearMapAppData {
    HeapID heapId;                            // 0x000
    int state;                                // 0x004
    int substate;                             // 0x008
    u8 unk_00C;                               // 0x00C
    u8 unk_00D;                               // 0x00D
    u8 unk_00E;                               // 0x00E
    s8 unk_00F;                               // 0x00F
    PokegearAppData *pokegear;                // 0x010
    PokegearUnkSub03C unk_014;                // 0x014
    int unk_030;                              // 0x030
    int unk_034;                              // 0x034
    MAPDATA *unk_038;                         // 0x038
    UnkStruct_02013534 *unk_03C;              // 0x03C
    UnkStruct_02013910 *unk_040;              // 0x040
    PokegearMapAppData_Sub044 unk_044[4];     // 0x044
    UnkStruct_ov100_021E6E20 *unk_084;        // 0x084
    MsgData *unk_088;                         // 0x088
    MessageFormat *unk_08C;                   // 0x08C
    String *unk_090;                          // 0x090
    u8 filler_094[8];                         // 0x094
    String *unk_09C[2];                       // 0x09C
    String *unk_0A4;                          // 0x0A4
    u8 filler_0A8[12];                        // 0x0A8
    String *unk_0B4;                          // 0x0B4
    u8 unk_0B8;                               // 0x0B8
    u8 filler_0B9[0xF];                       // 0x0B9
    PokegearMapAppData_Sub0C8 unk_0C8;        // 0x0C8
    u16 unk_100;                              // 0x100
    u16 unk_102;                              // 0x102
    u16 unk_104;                              // 0x104
    u16 unk_106;                              // 0x106
    s16 unk_108;                              // 0x108
    s16 unk_10A;                              // 0x10A
    u16 unk_10C;                              // 0x10C
    u16 unk_10E;                              // 0x10E
    s16 unk_110;                              // 0x110
    s16 unk_112;                              // 0x112
    u8 filler_114[4];                         // 0x114
    PokegearMapAppData_Sub118 unk_118;        // 0x118
    PhoneCallPersistentState *unk_124;        // 0x124
    PhoneBook *unk_128;                       // 0x128
    PhoneContact *unk_12C;                    // 0x12C
    u8 unk_130;                               // 0x130
    u8 unk_131;                               // 0x131
    u8 unk_132;                               // 0x132
    s8 unk_133;                               // 0x133
    s8 unk_134;                               // 0x134
    u8 unk_135;                               // 0x135
    u8 unk_136;                               // 0x136
    u8 unk_137;                               // 0x137
    u8 unk_138_0 : 1;                         // 0x138
    u8 unk_138_1 : 3;                         // 0x138
    u8 unk_138_4 : 1;                         // 0x138
    u8 unk_138_5 : 2;                         // 0x138
    u8 unk_138_7 : 1;                         // 0x138
    u8 unk_139_0 : 3;                         // 0x139
    u8 unk_139_3 : 1;                         // 0x139
    u8 unk_13A;                               // 0x13A
    u8 unk_13B;                               // 0x13B
    u8 unk_13C_0 : 7;                         // 0x13C
    u8 unk_13C_7 : 1;                         // 0x13C
    u8 unk_13D_0 : 1;                         // 0x13D
    u8 unk_13D_1 : 1;                         // 0x13D
    u8 unk_13D_2 : 1;                         // 0x13D
    u8 unk_13D_3 : 1;                         // 0x13D
    u8 filler_13E[0x16];                      // 0x13E
    void *unk_154[6];                         // 0x154
    NNSG2dScreenData *unk_16C;                // 0x16C
    NNSG2dScreenData *unk_170;                // 0x170
    NNSG2dScreenData *unk_174;                // 0x174
    NNSG2dScreenData *unk_178;                // 0x178
    NNSG2dScreenData *unk_17C;                // 0x17C
    NNSG2dScreenData *unk_180;                // 0x180
    Window unk_184[9];                        // 0x184
    const PokegearMapAppData_Sub214 *unk_214; // 0x214
    u8 filler_218[0x7D0];                     // 0x218
    u16 unk_9E8[ROAMER_MAX];                  // 0x9E8
    u8 filler_9F0[4];                         // 0x9F0
} PokegearMapAppData;                         // size: 0x9F4

BOOL ov101_021E7FF4(PokegearMapAppData *mapApp);
BOOL ov101_021E8070(PokegearMapAppData *mapApp);
BOOL ov101_021E80B4(PokegearMapAppData *mapApp);
BOOL ov101_021E818C(PokegearMapAppData *mapApp);

void ov101_021E9270(PokegearAppData *pokegear, void *appData);
void ov101_021E933C(PokegearMapAppData *mapApp);
void ov101_021E990C(PokegearMapAppData *mapApp);
void ov101_021E9B70(PokegearMapAppData *mapApp, PokegearMapAppData_Sub0C8 *a1);
BOOL ov101_021E9CD4(PokegearMapAppData *mapApp, u8 a1);
void ov101_021E9D74(PokegearMapAppData *mapApp, u8 a1);
BOOL ov101_021E9E90(PokegearMapAppData *mapApp, u8 a1);
void ov101_021E9FDC(PokegearMapAppData *mapApp, u8 a1);
BOOL ov101_021EA0D8(PokegearMapAppData *mapApp, u8 a1);
void ov101_021EA238(PokegearMapAppData *mapApp, u8 a1);
void ov101_021EA4D0(PokegearMapAppData *mapApp, u8 a1);
void ov101_021EA608(PokegearMapAppData *mapApp, u8 a1);
const PokegearMapAppData_Sub214 *ov101_021EA6E8(PokegearMapAppData *mapApp, u8 a1, u8 a2);
const PokegearMapAppData_Sub214 *ov101_021EA758(PokegearMapAppData *mapApp, u16 a1);
void ov101_021EA794(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1, u8 a2, u8 a3);
BOOL ov101_021EA7E4(PokegearMapAppData *mapApp, u16 a1, u16 a2);
BOOL ov101_021EA804(PokegearMapAppData *mapApp, u16 a1, u16 a2, u16 a3);
int ov101_021EA874(PokegearMapAppData *mapApp, u16 a1, u16 a2);
int ov101_021EA8A8(PokegearMapAppData *mapApp, PokegearMapAppData_Sub118 *a1, u8 a2, u8 a3);
void ov101_021EAD90(PokegearMapAppData *mapApp, int a1);
void ov101_021EAE54(PokegearMapAppData *mapApp, int a1);
void ov101_021EAF40(PokegearMapAppData *mapApp);
void ov101_021EB1E0(PokegearMapAppData *mapApp, int a1);
void ov101_021EB2FC(void *appData);
void ov101_021EB338(void *appData);
void ov101_021EB364(void *appData);
void ov101_021EB378(void *appData);
void ov101_021EB38C(PokegearMapAppData *mapApp, BOOL a1, int a2);
PokegearReturnCode ov101_021EB568(PokegearMapAppData *mapApp);
PokegearReturnCode ov101_021EB5DC(PokegearMapAppData *mapApp, BOOL *pRetIsTouch);
int ov101_021ECAF0(PokegearMapAppData *mapApp);
int ov101_021ECEA8(PokegearMapAppData *mapApp);
int ov101_021ECC58(PokegearMapAppData *mapApp, BOOL *a1);
int ov101_021ECF98(PokegearMapAppData *mapApp);
int ov101_021ED158(PokegearMapAppData *mapApp);
int ov101_021ED2C0(PokegearMapAppData *mapApp);
void ov101_021ED4E0(PokegearMapAppData *mapApp);
void ov101_021ED5AC(PokegearMapAppData *mapApp);
PokegearMapAppData_Sub118_Sub4 *ov101_021ED614(PokegearMapAppData *mapApp, int a1);
PokegearMapAppData_Sub118_Sub4 *ov101_021ED64C(PokegearMapAppData *mapApp, u16 a1);
void ov101_021ED79C(PokegearMapAppData_Sub118_Sub4 *a0, u8 a1, u16 a2);

extern const PokegearMapAppData_Sub214 ov101_021F7372[];
extern const UnkStruct_ov101_021F79B4 ov101_021F79B4[];

#endif // POKEHEARTGOLD_APPLICATION_POKEGEAR_MAP_POKEGEAR_MAP_INTERNAL_H
