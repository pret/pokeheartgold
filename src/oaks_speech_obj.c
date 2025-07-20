#include "global.h"

#include "data/resdat.naix"

#include "oaks_speech_internal.h"
#include "vram_transfer_manager.h"

static const UnmanagedSpriteTemplate sSpriteTemplates[] = {
    {
     .resourceSet = 0,
     .x = 128,
     .y = 50,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 2,
     .palIndex = 1,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 1,
     .x = 64,
     .y = 104,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 0,
     .palIndex = 0,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 2,
     .x = 192,
     .y = 104,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 1,
     .palIndex = 1,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 3,
     .x = 256,
     .y = 192,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 0,
     .palIndex = 3,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 4,
     .x = 0,
     .y = 0,
     .z = 0,
     .animSeqNo = 1,
     .rotation = 0,
     .palIndex = 4,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
    {
     .resourceSet = 5,
     .x = 160,
     .y = 80,
     .z = 0,
     .animSeqNo = 0,
     .rotation = 0,
     .palIndex = 4,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN,
     .unk_18 = 0,
     .unk_1C = 0,
     .unk_20 = 0,
     .unk_24 = 0,
     },
};

void OakSpeech_InitSpriteEngine(OakSpeechData *data) {
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GF_CreateVramTransferManager(0x20, HEAP_ID_OAKS_SPEECH);
    data->spriteRenderer = SpriteSystem_Alloc(HEAP_ID_OAKS_SPEECH);
    data->spriteGfxHandler = SpriteManager_New(data->spriteRenderer);

    {
        OamManagerParam oamManagerParam = {
            .fromOBJmain = 0,
            .numOBJmain = 128,
            .fromAffineMain = 0,
            .numAffineMain = 32,
            .fromOBJsub = 0,
            .numOBJsub = 128,
            .fromAffineSub = 0,
            .numAffineSub = 32,
        };

        OamCharTransferParam oamCharTransferParam = {
            .maxTasks = 10,
            .sizeMain = 0x400,
            .sizeSub = 0x400,
            .charModeMain = GX_OBJVRAMMODE_CHAR_1D_32K,
            .charModeSub = GX_OBJVRAMMODE_CHAR_1D_32K,
        };

        SpriteSystem_Init(data->spriteRenderer, &oamManagerParam, &oamCharTransferParam, 0x20);
    }

    SpriteSystem_InitSprites(data->spriteRenderer, data->spriteGfxHandler, 10);
    G2dRenderer_SetSubSurfaceCoords(SpriteSystem_GetRenderer(data->spriteRenderer), 0, FX32_CONST(GX_LCD_SIZE_Y));

    {
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

void OakSpeech_CleanupSpriteEngine(OakSpeechData *data) {
    SpriteSystem_DestroySpriteManager(data->spriteRenderer, data->spriteGfxHandler);
    SpriteSystem_Free(data->spriteRenderer);
    GF_DestroyVramTransferManager();
    data->spriteGfxHandler = NULL;
}

void OakSpeech_CreateSprites(OakSpeechData *data) {
    for (u16 i = 0; i < 6; ++i) {
        data->sprites[i] = SpriteSystem_CreateSpriteFromResourceHeader(data->spriteRenderer, data->spriteGfxHandler, &sSpriteTemplates[i]);
    }
    Sprite_SetDrawFlag(data->sprites[0], FALSE);
    Sprite_SetDrawFlag(data->sprites[1], FALSE);
    Sprite_SetDrawFlag(data->sprites[2], FALSE);
    Sprite_SetDrawFlag(data->sprites[3], FALSE);
    Sprite_SetDrawFlag(data->sprites[4], FALSE);
    Sprite_SetPriority(data->sprites[3], 1);
    Sprite_SetAnimActiveFlag(data->sprites[5], 1);
    Sprite_SetAffineOverwriteMode(data->sprites[5], 1);
    Sprite_SetDrawFlag(data->sprites[5], FALSE);
}

void OakSpeech_SelectedGenderIndicatorSpritesAction(OakSpeechData *data, int action) {
    BOOL sprite1Visible = FALSE;
    BOOL sprite2Visible = FALSE;

    if (action == GENDER_CURSOR_MALE) {
        sprite1Visible = TRUE;
        sprite2Visible = FALSE;
    } else if (action == GENDER_CURSOR_FEMALE) {
        sprite1Visible = FALSE;
        sprite2Visible = TRUE;
    } else if (action == GENDER_CURSOR_BOTH) {
        sprite1Visible = TRUE;
        sprite2Visible = TRUE;
    } else if (action == GENDER_CURSOR_NEITHER) {
        sprite1Visible = FALSE;
        sprite2Visible = FALSE;
    }

    Sprite_SetDrawFlag(data->sprites[1], sprite1Visible);
    Sprite_SetDrawFlag(data->sprites[2], sprite2Visible);
}
