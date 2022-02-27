#ifndef POKEHEARTGOLD_UNK_0203170C_H
#define POKEHEARTGOLD_UNK_0203170C_H

typedef struct {
    char unk0[0x33];
    u8 unk33;
    u32 unk34;
    u16 unk38;
    u16 unk3a;
    u32 unk3c;
} Unk0203170C;

typedef struct {
    u8 version;
    u8 language;
    u8 unk2;
    u8 unk3;
    u32 otId;
    u16 name[OT_NAME_LENGTH + 1];
    u32 unk18;
    u8 unk1c[0x8];
    char unk24[0x33];
    u8 unk57[0x5];
    u32 unk5c;
    u16 unk60;
    u16 unk62;
} Unk020317F4;

u32 sub_0203170C(void);
void sub_02031710(Unk0203170C *);
void sub_02031734(SAVEDATA *);
BOOL sub_02031744(SAVEDATA *);
void sub_0203175C(SAVEDATA *, char *);
Unk0203170C *sub_02031774(SAVEDATA *);
void sub_02031780(SAVEDATA *, u32 , u32);
u32 sub_020317BC(SAVEDATA *, u32);
s32 sub_0203186C(SAVEDATA *, Unk020317F4 *);
void sub_0203189C(SAVEDATA *, Unk020317F4 *);

#endif //POKEHEARTGOLD_UNK_0203170C_H
