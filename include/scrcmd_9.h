#ifndef POKEHEARTGOLD_SCRCMD_9_H
#define POKEHEARTGOLD_SCRCMD_9_H

#include "frontier_data.h"
#include "save.h"

typedef struct UnkStruct_0204B470 {
    u16 species : 11;
    u16 form : 5;
    u16 item;
    u16 moves[4];
    u32 otId;
    u32 pid;
    union {
        struct {
            u32 hpIv : 5;
            u32 atkIv : 5;
            u32 defIv : 5;
            u32 spdIv : 5;
            u32 spAtkIv : 5;
            u32 spDefIv : 5;
            u32 dummy : 2;
        };
        u32 ivsWord;
    };
    u8 evs[6];
    u8 ppUp;
    u8 language;
    u8 ability;
    u8 friendship;
    u16 nickname[11];
} UnkStruct_0204B470;

typedef struct UnkStruct_0204B7D0 {
    u32 unk00;
    u16 unk04;
    u8 filler06[2];
    u16 unk08[8];
    u16 unk18;
    u16 unk1a;
    u8 filler1c[0x14];
    UnkStruct_0204B470 unk30[2];
    u8 fillera0[0x70];
} UnkStruct_0204B7D0;

typedef struct UnkStruct_0204A824_7E8 {
    u32 otId;
    u16 unk04[2];
    u32 unk08[2];
} UnkStruct_0204A824_7E8;

typedef struct UnkStruct_Fsys_A0 {
    u32 unk00;
    HeapID heapId;
    u32 unk08;
    u8 unk0c;
    u8 curWinStreak;
    u8 unk0e;
    u8 unk0f;
    u8 unk10_0 : 1;
    u8 unk10_1 : 2;
    u8 unk10_3 : 1;
    u8 unk10_4 : 1;
    u8 unk10_5 : 3;
    u8 unk11;
    u8 unk12;
    u8 filler13;
    u16 unk14;
    u16 unk16;
    u16 unk18;
    u16 unk1a;
    u16 unk1c;
    u8 filler1e[2];
    u32 unk20;
    u16 unk24;
    u16 unk26;
    u16 unk28;
    u8 unk2a[4];
    u16 unk2e[4];
    u16 unk36[4];
    u16 unk3e[0xe];
    u8 filler5a[0x13];
    u32 unk70;
    FRONTIERDATA *unk74;
    UnkStruct_0204B7D0 unk78[2];
    UnkStruct_0204B7D0 unk298[5];
    UnkStruct_0204A824_7E8 unk7e8[5];
    u8 unk838[5];
    u8 filler83d;
    u16 unk83e[0x23];
    u16 unk884[0x23];
    u8 filler8CA[0xa];
    u8 unk8D4;
    u8 unk8D5;
    u8 filler8D6[2];
    u16 unk8D8;
    u16 unk8DA;
} UnkStruct_Fsys_A0;

#endif // POKEHEARTGOLD_SCRCMD_9_H
