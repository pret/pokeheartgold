#include "font.h"
#include "gf_gfx_loader.h"
#include "main.h"
#include "math_util.h"
#include "overlay_mic_test.h"
#include "sound.h"
#include "sound_02004A44.h"
#include "system.h"
#include "text.h"
#include "title_screen.h"
#include "touchscreen.h"
#include "unk_0200FA24.h"
#include "unk_02005D10.h"
#include "unk_0200B150.h"
#include "vram_transfer_manager.h"

BOOL MicTest_Init(OVY_MANAGER *overlayMan) {
    CreateHeap(HEAP_ID_3, HEAP_ID_MIC_TEST, 3 << 0x10);
    MicTestData *micTest = OverlayManager_CreateAndGetData(overlayMan, sizeof(MicTestData), HEAP_ID_MIC_TEST);
    MI_CpuFill8(micTest, 0, sizeof(MicTestData));
    micTest->heapId = HEAP_ID_MIC_TEST;
    ov62_021E5C34(micTest->heapId);
    MicTest_SetBanks();
    Main_SetVBlankIntrCB(MicTest_VBlankIntrCB, micTest);
    FontID_Alloc(4, HEAP_ID_MIC_TEST);
    ov62_021E5FD4(&micTest->unkB8, micTest->heapId);
    MicTest_LoadTextResources(&micTest->unkB8, micTest->heapId);
    ov62_021E60E4(&micTest->unkB8, micTest->heapId);
    ov62_021E5CF4(micTest, micTest->heapId);
    MicTest_LoadResources(micTest);
    ov62_021E61AC(&micTest->unkF0, micTest->heapId, MicTest_MicrophoneCallback, micTest);
    MicTest_StartTask(&micTest->taskMan, micTest, MicTestTask_FadeIn);
    GF_SndStartFadeOutBGM(0, 10);
    return TRUE;
}

BOOL MicTest_Exit(OVY_MANAGER *overlayMan) {
    MicTestData *micTest = OverlayManager_GetData(overlayMan);
    ov62_021E61FC(&micTest->unkF0);
    ov62_021E5FA0(micTest);
    ov62_021E5D54(micTest);
    ov62_021E6178(&micTest->unkB8);
    ov62_021E6024(&micTest->unkB8);
    ov62_021E5C80();
    FontID_Release(4);
    OverlayManager_FreeData(overlayMan);
    DestroyHeap(micTest->heapId);
    RegisterMainOverlay(FS_OVERLAY_ID(intro_title), &gApplication_TitleScreen);
    return TRUE;
}

BOOL MicTest_Main(OVY_MANAGER *overlayMan) {
    MicTestData *micTest = OverlayManager_GetData(overlayMan);
    if (MicTestTaskMan_IsFinished(&micTest->taskMan)) {
        return TRUE;
    }
    MicTestTaskMan_Run(&micTest->taskMan);
    MicTest_UpdateAnimations(micTest);
    ov62_021E6048(&micTest->unkB8);
    ov62_021E620C(&micTest->unkF0);
    return FALSE;
}

void MicTest_StartTask(MicTestTaskManager *taskMan, MicTestData *micTest, MicTestTask task) {
    taskMan->micTest = micTest;
    taskMan->isFinished = FALSE;
    MicTest_SetTask(taskMan, task);
}

void MicTestTaskMan_Run(MicTestTaskManager *taskMan) {
    if (MicTestTaskMan_IsFinished(taskMan) == 0) {
        taskMan->task(taskMan, &taskMan->state);
    }
}

void MicTest_SetTask(MicTestTaskManager *taskMan, MicTestTask task) {
    taskMan->task = task;
    taskMan->state = 0;
}

MicTestData *MicTestTaskMan_GetMicTestData(MicTestTaskManager *taskMan) {
    return taskMan->micTest;
}

u32 MicTestTaskMan_IsFinished(MicTestTaskManager *taskMan) {
    return taskMan->isFinished;
}

void MicTestTaskMan_Finish(MicTestTaskManager *taskMan) {
    taskMan->isFinished = TRUE;
}

void MicTestTask_FadeIn(MicTestTaskManager *taskMan, u32 *state) {
    MicTestData *micTest = MicTestTaskMan_GetMicTestData(taskMan);

    switch (*state) {
    case 0:
        BeginNormalPaletteFade(0, 1, 1, 0, 6, 1, micTest->heapId);
        *state = 1;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            *state = 2;
        }
        break;
    case 2:
        MicTest_SetTask(taskMan, ov62_021E5B04);
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

void ov62_021E5B04(MicTestTaskManager *taskMan, u32 *state) {
    MicTestData *micTest = MicTestTaskMan_GetMicTestData(taskMan);

    switch (*state) {
    case 0:
        ov62_021E625C(&micTest->unkF0);
        (*state) = 1;
        break;
    case 1:
        if (ov62_021E6630(micTest)) {
            PlaySE(SEQ_SE_DP_SELECT);
            (*state) = 2;
        }
        break;
    case 2:
        ov62_021E6278(&micTest->unkF0);
        (*state) = 3;
        break;
    case 3:
        MicTest_SetTask(taskMan, ov62_021E5B6C);
        break;
    default:
        GF_ASSERT(FALSE);
        break;
    }
}

void ov62_021E5B6C(MicTestTaskManager *taskMan, u32 *state) {
    MicTestData *micTest = MicTestTaskMan_GetMicTestData(taskMan);

    switch (*state) {
    case 0:
        UnkImageStruct_SetSpriteAnimSeqNo(micTest->unk8[3], 1);
        (*state) = 1;
        break;
    case 1:
        if (!sub_0200DCA0(micTest->unk8[3])) {
            (*state) = 2;
        }
        break;
    case 2:
        MicTest_SetTask(taskMan, ov62_021E5BB8);
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

void ov62_021E5BB8(MicTestTaskManager *taskMan, u32 *state) {
    MicTestData *micTest = MicTestTaskMan_GetMicTestData(taskMan);

    switch (*state) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, micTest->heapId);
        (*state) = 1;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            (*state) = 2;
        }
        break;
    case 2:
        MicTest_SetTask(taskMan, ov62_021E5C20);
        break;
    default:
        GF_ASSERT(FALSE);
    }
}

void ov62_021E5C20(MicTestTaskManager *taskMan, u32 *state) {
    MicTestData *micTest = MicTestTaskMan_GetMicTestData(taskMan);
    ov62_021E6600(micTest);
    MicTestTaskMan_Finish(taskMan);
}

void ov62_021E5C34(HeapID heapId) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
    sub_0200FBDC(0);
    sub_0200FBDC(1);
    GF_CreateVramTransferManager(0x20, heapId);
}

void ov62_021E5C80() {
    GF_DestroyVramTransferManager();
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    GX_SetVisiblePlane(0);
    GXS_SetVisiblePlane(0);
}

extern GraphicsBanks sMicTestGraphicsBanks;

void MicTest_SetBanks() {
    GfGfx_SetBanks(&sMicTestGraphicsBanks);
}

//TODO: Is this a library struct?
typedef struct UnkStruct_27E0000 {
    u8 unk_0000[0x3FF8];
    u32 unk_3FF8;
} UnkStruct_27E0000;

void MicTest_VBlankIntrCB(void *data){
    MicTestData *micTest = data;
    NNS_GfdDoVramTransfer();
    ov62_021E5FC4(micTest);
    ov62_021E60D4(&micTest->unkB8);
    UnkStruct_27E0000 *unkStruct = (UnkStruct_27E0000 *)(0x27e0000);
    unkStruct->unk_3FF8 |= 1;
}

extern Unk122_021E92FC ov62_021E66B0;
extern Unk122_021E92D0 ov62_021E6668;
extern SpriteResourceCountsListUnion ov62_021E667C;

void ov62_021E5CF4(MicTestData *micTest, HeapID heapId) {
    SpriteRenderer *spriteRender = SpriteRenderer_Create(heapId);
    micTest->spriteRenderer = spriteRender;
    sub_0200CF70(spriteRender, &ov62_021E66B0, &ov62_021E6668, 0x20);
    sub_0200B2E0(heapId);
    sub_0200B2E8(heapId);
    micTest->unk4 = SpriteRenderer_CreateGfxHandler(micTest->spriteRenderer);
    sub_0200CFF4(micTest->spriteRenderer, micTest->unk4, 7);
    SpriteRenderer_Init2DGfxResManagersFromCountsArray(micTest->spriteRenderer, micTest->unk4, &ov62_021E667C);
    GfGfx_EngineATogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_OBJ, GF_PLANE_TOGGLE_ON);
}

void ov62_021E5D54(MicTestData *micTest) {
    SpriteRenderer_Delete(micTest->spriteRenderer);
    micTest->spriteRenderer = NULL;
}

void MicTest_UpdateAnimations(MicTestData *micTest) {
    for (u16 i = 0; i < 7; i++) {
        UnkImageStruct_TickSpriteAnimation1Frame(micTest->unk8[i]);
    }
    sub_0200D020(micTest->unk4);
}

extern UnkTemplate_0200D748 ov62_021E67C8[7];
extern u32 ov62_021E6694[7];

void MicTest_LoadResources(MicTestData *micTest) {
    SpriteRenderer_LoadPlttResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 6, 0, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 0xA03);
    SpriteRenderer_LoadCellResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 8, 0, 0xA02);
    SpriteRenderer_LoadAnimResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 9, 0, 0xA04);
    SpriteRenderer_LoadCharResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 7, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 0xa01);
    
    SpriteRenderer_LoadPlttResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 10, 0, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 0xB03);
    SpriteRenderer_LoadCellResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 12, 0, 0xB02);
    SpriteRenderer_LoadAnimResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 13, 0, 0xB04);
    SpriteRenderer_LoadCharResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 11, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 0xB01);

    SpriteRenderer_LoadPlttResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 18, 0, 1, NNS_G2D_VRAM_TYPE_2DSUB, 0xD03);
    SpriteRenderer_LoadCellResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 20, 0, 0xD02);
    SpriteRenderer_LoadAnimResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 21, 0, 0xD04);
    SpriteRenderer_LoadCharResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 19, 0, NNS_G2D_VRAM_TYPE_2DSUB, 0xD01);

    SpriteRenderer_LoadPlttResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 14, 0, 1, NNS_G2D_VRAM_TYPE_2DMAIN, 0xC03);
    SpriteRenderer_LoadCellResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 16, 0, 0xC02);
    SpriteRenderer_LoadAnimResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 17, 0, 0xC04);
    SpriteRenderer_LoadCharResObjFromNarcId(micTest->spriteRenderer, micTest->unk4, NARC_a_1_7_6, 15, 0, NNS_G2D_VRAM_TYPE_2DMAIN, 0xC01);

    for (u16 i = 0; i < 7; i++) {
        micTest->unk8[i] = SpriteRenderer_LoadResourcesAndCreateSprite(micTest->spriteRenderer, micTest->unk4, &ov62_021E67C8[ov62_021E6694[i]]);
        UnkImageStruct_SetSpriteAnimActiveFlag(micTest->unk8[i], TRUE);
    }

    for (u16 i = 0; i < 3; i++) {
        UnkImageStruct_SetSpriteVisibleFlag(micTest->unk8[4 + i], 0);
    }

    sub_0200E0C0(micTest->unk8[0], 1);
    UnkImageStruct_SetSpritePriority(micTest->unk8[3], 1);
    micTest->unkB4 = 10;
}

void ov62_021E5FA0(MicTestData *micTest) {
    for (int i = 0; i < 7; i++) {
        if (micTest->unk8[i] != NULL) {
            UnkImageStruct_Delete(micTest->unk8[i]);
        }
    }
    SpriteRenderer_UnloadResourcesAndRemoveGfxHandler(micTest->spriteRenderer, micTest->unk4);
}

void ov62_021E5FC4(MicTestData *micTest) {
    if (micTest->spriteRenderer != NULL) {
        thunk_OamManager_ApplyAndResetBuffers();
    }
}

extern GraphicsModes ov62_021E6658;
extern struct {
    BgTemplate bgTemplate;
    u8 unk1C;
    u8 unk1D;
    u8 unk1E;
    u8 unk1F;
} ov62_021E6728[5];

void ov62_021E5FD4(MicTestSub_B8 *a0, HeapID heapId) {
    a0->bgConfig = BgConfig_Alloc(heapId);
    SetBothScreensModesAndDisable(&ov62_021E6658);

    for (u32 i = 0; i < 5; i++) {
        InitBgFromTemplate(a0->bgConfig, ov62_021E6728[i].unk1C, &ov62_021E6728[i].bgTemplate, ov62_021E6728[i].unk1D);
        BgClearTilemapBufferAndCommit(a0->bgConfig, ov62_021E6728[i].unk1C);
        BG_ClearCharDataRange(ov62_021E6728[i].unk1C, 32, 0, heapId);
    }
}

void ov62_021E6024(MicTestSub_B8 *a0) {
    for (u32 i = 0; i < 5; i++) {
        FreeBgTilemapBuffer(a0->bgConfig, ov62_021E6728[i].unk1C);
    }
    FreeToHeap(a0->bgConfig);
}

void ov62_021E6048(MicTestSub_B8 *a0) {
    
}

void MicTest_LoadTextResources(MicTestSub_B8 *a0, HeapID heapId) {
    GfGfxLoader_GXLoadPal(NARC_a_1_7_6, 0, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 32, heapId);
    GfGfxLoader_LoadCharData(NARC_a_1_7_6, 4, a0->bgConfig, GF_BG_LYR_SUB_1, 0, 0, 0, heapId);
    GfGfxLoader_LoadScrnData(NARC_a_1_7_6, 5, a0->bgConfig, GF_BG_LYR_SUB_1, 0, 0, 0, heapId);

    GfGfxLoader_GXLoadPal(NARC_a_1_7_6, 1, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 32, heapId);
    GfGfxLoader_LoadCharData(NARC_a_1_7_6, 2, a0->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, 0, heapId);
    GfGfxLoader_LoadScrnData(NARC_a_1_7_6, 3, a0->bgConfig, GF_BG_LYR_MAIN_1, 0, 0, 0, heapId);
}

void ov62_021E60D4(MicTestSub_B8 *a0) {
    if (a0->bgConfig != NULL) {
        DoScheduledBgGpuUpdates(a0->bgConfig);
    }
}

extern struct {
    u8 bgId;
    u8 x;
    u8 y;
    u8 width;
    u8 height;
    u8 palNum;
    u16 baseTile;
    u8 fontId;
    u32 color;
} ov62_021E66F8[3];

void ov62_021E60E4(MicTestSub_B8 *a0, HeapID heapId) {
    a0->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, 0xea, heapId);

    for (int i = 0; i < 3; i++) {
        AddWindowParameterized(a0->bgConfig, &a0->window[i], ov62_021E66F8[i].bgId, ov62_021E66F8[i].x, ov62_021E66F8[i].y, ov62_021E66F8[i].width, ov62_021E66F8[i].height, ov62_021E66F8[i].palNum, ov62_021E66F8[i].baseTile);
        FillWindowPixelBuffer(&a0->window[i], 0);
        ClearWindowTilemap(&a0->window[i]);
        String *str = NewString_ReadMsgData(a0->msgData, i);
        AddTextPrinterParameterizedWithColor(&a0->window[i], ov62_021E66F8[i].fontId, str, 0, 0, 0xFF, ov62_021E66F8[i].color, 0);
        String_Delete(str);
        CopyWindowToVram(&a0->window[i]);
    }
}

void ov62_021E6178(MicTestSub_B8 *a0) {
    for (int i = 0; i < 3; i++) {
        ClearWindowTilemapAndCopyToVram(&a0->window[i]);
        FillWindowPixelBuffer(&a0->window[i], 0);
        ClearWindowTilemap(&a0->window[i]);
        RemoveWindow(&a0->window[i]);
    }
    DestroyMsgData(a0->msgData);
}

void ov62_021E61AC(MicTestSub_F0 *a0, HeapID heapId, MICCallback a2, MicTestData *micTest) {
    Sys_SetSleepDisableFlag(8);
    
    void *data = AllocFromHeap(heapId, 0x120);
    MI_CpuFill8(data, 0, 0x120);
    a0->unk1C = data;
    
    a0->mic.type = MIC_SAMPLING_TYPE_8BIT;
    a0->mic.buffer = (void *)((((u32)data) + 0x1F) & ~0x1F); //??????
    a0->mic.size = (1 << 8);
    a0->mic.rate = 0x1040;
    a0->mic.loop_enable = TRUE;
    a0->mic.full_callback = a2;
    a0->mic.full_arg = micTest;
    
    a0->unk34 = sub_02005518();
}

void ov62_021E61FC(MicTestSub_F0 *a0) {
    FreeToHeap(a0->unk1C);
    Sys_ClearSleepDisableFlag(8);
}

void ov62_021E620C(MicTestSub_F0 *a0) {
    u32 next = sub_02005518();

    if (next == 0 || a0->unk34 == 0) { 
        if (a0->unk30 == 0) {
            if (a0->unk28) {
                ov62_021E6278(a0);
                a0->unk2C = 1;
            }
            a0->unk30 = 1;
        }

        if (next != 0 && a0->unk34 == 0) {
            a0->unk30 = 0;
            
            if (a0->unk2C) {
                ov62_021E625C(a0);
                a0->unk2C = 0;
            }
        }
    }
    
    a0->unk34 = next;
}

void ov62_021E625C(MicTestSub_F0 *a0) {
    if (a0->unk30 == 0) {
        GF_MIC_StartAutoSampling(&a0->mic);
        a0->unk28 = 1;
    } else {
        a0->unk2C = 1;
    }
}

void ov62_021E6278(MicTestSub_F0 *a0) {
    GF_MIC_StopAutoSampling();
    a0->unk28 = 0;
}

s32 MicTest_AverageMicInput(MicTestSub_F0 *a0) {
    int i;
    u8 *buffer;
    
    int cnt = 0;
    int size = a0->mic.size - 1;
    buffer = a0->mic.buffer;
    
    for (i = 0; i < size; i++) {
        if (buffer[i] < 0x80) {
            cnt += 0x100 - buffer[i];
        } else {
            cnt += buffer[i];
        }
    }
    return cnt / size;
}

extern struct {
    u32 unk0;
} _021E68E0;

void MicTest_MicrophoneCallback(MICResult result, void *data) {
    MicTestData *micTest = data;
    
    if (result != MIC_RESULT_SUCCESS) {
        return;
    }

    MicTestSub_F0 *unkF0 = &micTest->unkF0;

    s32 volumeAvg = MicTest_AverageMicInput(unkF0);
    u32 volume;
    
    if (unkF0->curVolume < volumeAvg) {
        volume = MicTest_GetVolumeBracket(volumeAvg);
        unkF0->curVolume = volumeAvg;
        unkF0->unk24 = 1;
    } else {
        volume = MicTest_GetVolumeBracket(unkF0->curVolume);
        unkF0->curVolume -= 2;
    }
    
    if (volume) {
        if (unkF0->unk24) {
            UnkImageStruct_SetSpriteAnimSeqNo(micTest->unk8[2], 1);
            unkF0->unk24 = 0;
        }

        if (ov62_021E63D0(micTest)) {
            ov62_021E63E8(micTest, micTest->heapId, 0x80, 0x40);
        } else {
            micTest->unkB4--;
            if (micTest->unkB4 == 0) {
                ov62_021E63E8(micTest, micTest->heapId, 0x80, 0x40);
                micTest->unkB4 = 10;
            }
        }
        
        UnkImageStruct_SetSpriteAnimSeqNo(micTest->unk8[0], volume);
        UnkImageStruct_SetSpriteAnimSeqNo(micTest->unk8[1], volume);
    } else if (volume == 0) {
        UnkImageStruct_SetSpriteAnimSeqNo(micTest->unk8[2], 0);
        UnkImageStruct_SetSpriteAnimSeqNo(micTest->unk8[0], 0);
        UnkImageStruct_SetSpriteAnimSeqNo(micTest->unk8[1], 0);
    }
    
    _021E68E0.unk0++;
}

u32 MicTest_GetVolumeBracket(u8 a0) {
    u32 ret;

    if (a0 <= 0x8C) {
        ret = 0;
    } else if (a0 >= 0x8D && a0 <= 0x98) {
        ret = 1;
    } else if (a0 >= 0x99 && a0 <= 0xA6) {
        ret = 2;
    } else if (a0 >= 0xA7 && a0 <= 0xBB) {
        ret = 3;
    } else if (a0 >= 0xBC) {
        ret = 4;
    } else {
        GF_ASSERT(FALSE);
    }
 
    return ret;
}

u32 ov62_021E63D0(MicTestData *micTest) {
    for (int i = 0; i < 3; i++) {
        if (micTest->unk24[i].task) {
            return 0;
        }
    }
    return 1;
}

BOOL ov62_021E63E8(MicTestData *micTest, HeapID heapId, s16 x, s16 y) {
    UnkImageStruct *flag = 0;
    MicTestSub_24 *args = NULL;
    for (int i = 0; i < 3; i++) {
        if (micTest->unk24[i].task == NULL) {
            args = &micTest->unk24[i];
            flag = micTest->unk8[i + 4];
            break;
        }
    }

    if (args != NULL) {
        s32 rand1 = (LCRandom() * 0x1002 / 0x10000) + 0x1333;
        s32 rand2 = (LCRandom() * 0x3E / 0x10000) + 0x3C;
        s32 rand3 = (LCRandom() * 0x10 / 0x10000) + 6;
        ov62_021E6480(flag, args, x, y, rand1, rand2, rand3, 1);
        return TRUE;
    }

    return FALSE;
}

void ov62_021E6480(UnkImageStruct *a0, MicTestSub_24 *args, s16 x, s16 y, s32 z, s32 r1, s32 r2, BOOL a7) {
    args->task = SysTask_CreateOnMainQueue(ov62_021E6570, args, 0);
    MicTestSub_24 *data = SysTask_GetData(args->task);

    data->unk0 = a0;
    data->unk4 = a7;

    data->unk8.x = FX32_CONST(x);
    data->unk8.y = FX32_CONST(y);
    data->unk8.z = 0;

    s32 sine = GF_SinDegNoWrap(r1 + 90);
    data->unk14.x = FX_MUL(z, sine);
    sine = GF_SinDegNoWrap(r1);
    data->unk14.y = -FX_MUL(z, sine);
    data->unk14.z = 0;

    data->unk20 = 0;
    data->unk24 = FX32_CONST(6);
    data->unk28 = r2;

    UnkImageStruct_SetSpritePositionXY(data->unk0, x, y);
}

void ov62_021E6570(SysTask *task, void *_data) {
    MicTestSub_24 *data = _data;

    if (data->unk4) {
        if (--data->unk4 == 0) {
            UnkImageStruct_SetSpriteVisibleFlag(data->unk0, TRUE);
        }
        return;
    }

    VEC_Add(&data->unk8, &data->unk14, &data->unk8);

    s16 x = data->unk8.x >> 12;
    s16 y = data->unk8.y >> 12;
    data->unk20 = data->unk20 + data->unk24;

    while (data->unk20 > FX32_CONST(360)) {
        data->unk20 -= FX32_CONST(360);
    }
    
    x += GF_SinDegNoWrap(data->unk20 >> 12) * data->unk28 >> 12;
    
    UnkImageStruct_SetSpritePositionXY(data->unk0, x, y);
    
    if (y < -16) {
        UnkImageStruct_SetSpriteVisibleFlag(data->unk0, FALSE);
        SysTask_Destroy(task);
        data->task = NULL;
    }
}

void ov62_021E6600(MicTestData *micTest) {
    for (int i = 0; i < 3; i++) {
        if (micTest->unk24[i].task != NULL) {
            SysTask_Destroy(micTest->unk24[i].task);
            micTest->unk24[i].task = NULL;
        }
    }
}

extern TouchscreenHitbox _021E6650;

int ov62_021E6620() {
    return TouchscreenHitbox_FindRectAtTouchNew(&_021E6650);
}

int ov62_021E6630(MicTestData *data) {
    if (ov62_021E6620() == 0 || (gSystem.newKeys & 2)) {
        return TRUE;
    }
    return FALSE;
}