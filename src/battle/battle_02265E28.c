
#include "global.h"

#include "constants/heap.h"

#include "battle/battle.h"
#include "battle/battle_system.h"
#include "battle/overlay_12_02265E28.h"

#include "filesystem.h"
#include "filesystem_files_def.h"
#include "sprite_system.h"

#define UNK_RES_4E2D 0x4E2D
#define UNK_RES_4E2E 0x4E2E
#define UNK_RES_4E29 0x4E29

extern u16 ov12_0226E0D0[];
extern u16 ov12_0226E0A0[];
extern u16 ov12_0226E168[][3] __attribute__((aligned(4)));

void ov12_02265E28(UnkBattleSystemSub17C *a0);

void ov12_02265E28(UnkBattleSystemSub17C *a0) {
    u32 r6;
    void *narc = NARC_New(NARC_a_0_0_8, HEAP_ID_BATTLE);

    SpriteSystem *spriteSystem = BattleSystem_GetSpriteRenderer(a0->bsys);
    SpriteManager *spriteManager = BattleSystem_GetGfxHandler(a0->bsys);
    u32 subfile = ov12_0223B52C(a0->bsys);

    u16 charFile;
    u32 charResId;
    u32 cellFile;
    u32 animFile;
    if (a0->unk8 == 0) {
        charFile = ov12_0226E0D0[a0->unk9];
        charResId = UNK_RES_4E2D;
        cellFile = 0x80;
        r6 = charResId - 8;
        animFile = 0x81;
    } else {
        charFile = ov12_0226E0A0[a0->unk9];
        charResId = UNK_RES_4E2E;
        cellFile = 0x83;
        r6 = charResId - 8;
        animFile = 0x84;
    }
    SpriteSystem_LoadCharResObjFromOpenNarc(spriteSystem, spriteManager, narc, charFile, TRUE, NNS_G2D_VRAM_TYPE_2DMAIN, charResId);

    void *palette = BattleSystem_GetPaletteData(a0->bsys);
    SpriteSystem_LoadPaletteBufferFromOpenNarc(palette, PLTTBUF_MAIN_OBJ, spriteSystem, spriteManager, narc, ov12_0226E168[a0->unk9][subfile], FALSE, 1, NNS_G2D_VRAM_TYPE_2DMAIN, UNK_RES_4E29);

    palette = BattleSystem_GetPaletteData(a0->bsys);
    PaletteData_LoadNarc(palette, NARC_a_0_0_8, ov12_0226E168[a0->unk9][subfile], HEAP_ID_BATTLE, PLTTBUF_MAIN_BG, 0x20, 0x70);

    SpriteSystem_LoadCellResObjFromOpenNarc(spriteSystem, spriteManager, narc, cellFile, TRUE, r6);

    SpriteSystem_LoadAnimResObjFromOpenNarc(spriteSystem, spriteManager, narc, animFile, TRUE, r6);

    NARC_Delete(narc);
}
