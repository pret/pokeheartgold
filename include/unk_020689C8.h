#ifndef POKEHEARTGOLD_UNK_020689C8_H
#define POKEHEARTGOLD_UNK_020689C8_H

typedef struct {
    int unk0;
    u8 unk4[0x8];
    LocalMapObject *unkC;
    int unk10;
} UnkOv01_021FFFCC_common;

typedef struct {
    UnkOv01_021FFFCC_common unk0;
} UnkOv01_021FFFCC;

void sub_02068B48(int a0);
UnkOv01_021FFFCC *sub_02068D98(void *a0);
void sub_02068DB8(void *a0, VecFx32 *a1);

#endif // POKEHEARTGOLD_UNK_020689C8_H
