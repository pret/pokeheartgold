#include "battle_cursor.h"
#include "unk_0200CF18.h"

//BattleCursor_LoadResources
void ov12_0226B8FC(void *a0, void *a1, void *a3, HeapID heapId, u32 character, u32 pal, u32 cell, u32 animation) {
    NARC *narc = NARC_ctor(NARC_a_0_0_8, heapId);
    sub_0200D68C(a3, 3, a0, a1, narc, 80, 0, 1, 2, pal);
    sub_0200D504(a0, a1, narc, 250, 1, 2, character);
    sub_0200D6EC(a0, a1, narc, 251, 1, cell);
    sub_0200D71C(a0, a1, narc, 252, 1, animation);
    NARC_dtor(narc);
}

//BattleCursor_FreeResources
void ov12_0226B97C(void *a0, u32 character, u32 pal, u32 cell, u32 animation) {
    sub_0200D958(a0, character);
    sub_0200D968(a0, pal);
    sub_0200D978(a0, cell);
    sub_0200D988(a0, animation);
}

