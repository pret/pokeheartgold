#include "global.h"

#include "data/resdat.naix"

#include "oaks_speech_internal.h"
#include "vram_transfer_manager.h"

static const UnkStruct_0200D2B4 ov53_021E8784[] = {
    {
     .resourceSet = 0,
     .x           = 128,
     .y           = 50,
     .z           = 0,
     .animSeqNo   = 0,
     .rotation    = 2,
     .unk_10      = 1,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18      = 0,
     .unk_1C      = 0,
     .unk_20      = 0,
     .unk_24      = 0,
     },
    {
     .resourceSet = 1,
     .x           = 64,
     .y           = 104,
     .z           = 0,
     .animSeqNo   = 0,
     .rotation    = 0,
     .unk_10      = 0,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .unk_18      = 0,
     .unk_1C      = 0,
     .unk_20      = 0,
     .unk_24      = 0,
     },
    {
     .resourceSet = 2,
     .x           = 192,
     .y           = 104,
     .z           = 0,
     .animSeqNo   = 0,
     .rotation    = 1,
     .unk_10      = 1,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .unk_18      = 0,
     .unk_1C      = 0,
     .unk_20      = 0,
     .unk_24      = 0,
     },
    {
     .resourceSet = 3,
     .x           = 256,
     .y           = 192,
     .z           = 0,
     .animSeqNo   = 0,
     .rotation    = 0,
     .unk_10      = 3,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .unk_18      = 0,
     .unk_1C      = 0,
     .unk_20      = 0,
     .unk_24      = 0,
     },
    {
     .resourceSet = 4,
     .x           = 0,
     .y           = 0,
     .z           = 0,
     .animSeqNo   = 1,
     .rotation    = 0,
     .unk_10      = 4,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .unk_18      = 0,
     .unk_1C      = 0,
     .unk_20      = 0,
     .unk_24      = 0,
     },
    {
     .resourceSet = 5,
     .x           = 160,
     .y           = 80,
     .z           = 0,
     .animSeqNo   = 0,
     .rotation    = 0,
     .unk_10      = 4,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18      = 0,
     .unk_1C      = 0,
     .unk_20      = 0,
     .unk_24      = 0,
     },
};

void ov53_021E7F24(OakSpeechData *data) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GF_CreateVramTransferManager(0x20, HEAP_ID_OAKS_SPEECH);
    data->spriteRenderer   = SpriteRenderer_Create(HEAP_ID_OAKS_SPEECH);
    data->spriteGfxHandler = SpriteRenderer_CreateGfxHandler(data->spriteRenderer);

    {
        // extern const OamManagerParam ov53_021E8764;
        OamManagerParam oamManagerParam = {
            .fromOBJmain    = 0,
            .numOBJmain     = 128,
            .fromAffineMain = 0,
            .numAffineMain  = 32,
            .fromOBJsub     = 0,
            .numOBJsub      = 128,
            .fromAffineSub  = 0,
            .numAffineSub   = 32,
        };

        // extern const OamCharTransferParam ov53_021E8750;
        OamCharTransferParam oamCharTransferParam = {
            .maxTasks     = 10,
            .sizeMain     = 0x400,
            .sizeSub      = 0x400,
            .charModeMain = GX_OBJVRAMMODE_CHAR_1D_32K,
            .charModeSub  = GX_OBJVRAMMODE_CHAR_1D_32K,
        };

        sub_0200CF70(data->spriteRenderer, &oamManagerParam, &oamCharTransferParam, 0x20);
    }

    sub_0200CFF4(data->spriteRenderer, data->spriteGfxHandler, 10);
    G2dRenderer_SetSubSurfaceCoords(SpriteRenderer_GetG2dRendererPtr(data->spriteRenderer), 0, FX32_CONST(192));

    {
        // extern const u16 ov53_021E8740[7];
        u16 fileIdList[7] = {
            NARC_resdat_resdat_00000026_bin,
            NARC_resdat_resdat_00000027_bin,
            NARC_resdat_resdat_00000025_bin,
            NARC_resdat_resdat_00000024_bin,
            0xFFFF,
            0xFFFF,
            NARC_resdat_resdat_00000078_bin,
        };
        sub_0200D294(data->spriteRenderer, data->spriteGfxHandler, fileIdList);
    }
}

void ov53_021E7FEC(OakSpeechData *data) {
    SpriteRenderer_RemoveGfxHandler(data->spriteRenderer, data->spriteGfxHandler);
    SpriteRenderer_Delete(data->spriteRenderer);
    GF_DestroyVramTransferManager();
    data->spriteGfxHandler = NULL;
}

void ov53_021E8014(OakSpeechData *data) {
    for (u16 i = 0; i < 6; ++i) {
        data->sprites[i] = SpriteRenderer_CreateSprite(data->spriteRenderer, data->spriteGfxHandler, &ov53_021E8784[i]);
    }
    Set2dSpriteVisibleFlag(data->sprites[0], FALSE);
    Set2dSpriteVisibleFlag(data->sprites[1], FALSE);
    Set2dSpriteVisibleFlag(data->sprites[2], FALSE);
    Set2dSpriteVisibleFlag(data->sprites[3], FALSE);
    Set2dSpriteVisibleFlag(data->sprites[4], FALSE);
    Sprite_SetPriority(data->sprites[3], 1);
    Set2dSpriteAnimActiveFlag(data->sprites[5], 1);
    sub_0202487C(data->sprites[5], 1);
    Set2dSpriteVisibleFlag(data->sprites[5], FALSE);
}

void ov53_021E80B8(OakSpeechData *data, int a1) {
    BOOL r2 = FALSE;
    BOOL r4 = FALSE;

    if (a1 == 0) {
        r2 = TRUE;
        r4 = FALSE;
    } else if (a1 == 1) {
        r2 = FALSE;
        r4 = TRUE;
    } else if (a1 == 2) {
        r2 = TRUE;
        r4 = TRUE;
    } else if (a1 == 3) {
        r2 = FALSE;
        r4 = FALSE;
    }

    Set2dSpriteVisibleFlag(data->sprites[1], r2);
    Set2dSpriteVisibleFlag(data->sprites[2], r4);
}
