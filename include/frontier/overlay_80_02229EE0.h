#ifndef POKEHEARTGOLD_OVERLAY_80_02229EE0
#define POKEHEARTGOLD_OVERLAY_80_02229EE0

typedef struct FrontierTrainerData {
    u8 unk0[0x18];
    u16 unk18[4];
    u8 unk1C[0xF0];
} FrontierTrainerData;

void ov80_0222A474(FrontierTrainerData *a0, u16 a1, u32 a2, u32 a3);
void ov80_0222A52C(void *a0, u16 *a1, u8 *a2, u32 *a3, void *a4, u32 a5, u32 a6, u32 a7);

#endif
