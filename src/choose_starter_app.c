#include "unk_0203E348.h"
#include "unk_02022D74.h"
#include "unk_02019014.h"
#include "unk_0200FA24.h"
#include "system.h"
#include "text.h"
#include "render_text.h"
#include "msgdata/msg/msg_0190.h"
#include "sound.h"
#include "gf_3d_vramman.h"
#include "unk_02005D10.h"
#include "unk_02023694.h"
#include "unk_0200A090.h"
#include "unk_0200B150.h"
#include "unk_020215A0.h"
#include "unk_02022588.h"

#define HEAPID_STARTERCHOOSE       46

struct ChooseStarterRnd {
    NNSG3dRenderObj obj;
    int unk_54;
    int unk_58;
    u8 filler_5C[0x1C];
}; // size=0x78

struct ChooseStarterAnm {
    struct {int unk_0;} *unk_0; // todo? what is this?
    NNSG3dAnmObj *obj;
};

struct UnkStarterChooseSub_3B4_18 {
    void *unk_00;
    void *unk_04;
    void *unk_08;
    void *unk_0C;
    u8 filler_10[0x8];
};

struct UnkStarterChooseSub_3B4 {
    void *unk_000;
    void *unk_004;
    void *unk_008;
    void *unk_00C;
    u8 filler_010[0x8];
    struct UnkStarterChooseSub_3B4_18 unk_018[3];
    void *unk_060[3];
    void *unk_06C[3];
    u8 filler_078[0x10];
    void *unk_088;
    u8 filler_08C[0x128];
    int unk_1B4[3];
};

struct UnkStarterChooseSub_368_4 {
    int unk_00;
    u8 filler_04;
    u16 *unk_08;
};

struct UnkStarterChooseSub_368 {
    u8 filler_00[0x4];
    struct UnkStarterChooseSub_368_4 *unk_4;
};

struct ChooseStarterAppWork {
    u8 filler_000[0x4];
    HeapID heapId;
    BGCONFIG *bgConfig;
    struct GF3DVramMan *_3dMan;
    UnkStruct_02022D74 *unk_010;
    u8 filler_014[0xC];
    NNSFndAllocator allocator; // 020
    u8 filler_030[0x40];
    struct ChooseStarterRnd unk_070[6];
    struct ChooseStarterAnm unk_340[3];
    struct ChooseStarterAnm unk_358;
    struct ChooseStarterAnm unk_360;
    struct UnkStarterChooseSub_368 unk_368;
    u8 filler_370[0x24];
    int unk_394;
    u8 filler_398[0x2];
    s16 unk_39A;
    WINDOW *unk_39C;
    WINDOW *unk_3A0;
    u8 frame; // 3A4
    u8 unk_3A5;
    u8 unk_3A6;
    u8 filler_3A7[0x1];
    int unk_3A8;
    int unk_3AC;
    STRING *unk_3B0;
    struct UnkStarterChooseSub_3B4 unk_3B4;
    UnkStruct_02019014 *unk_574;
    POKEMON *choices[3]; // 578
    int unk_584;
    GXRgb unk_588[8];
}; // size=0x598

void ov61_021E6068(struct UnkStarterChooseSub_3B4 *a0);
void ov61_021E60B8(struct ChooseStarterAppWork *work);
void ov61_021E60C8(void);
void ov61_021E60E8(HeapID heapId);
void ov61_021E6140(struct ChooseStarterAppWork *work);
void ov61_021E61FC(struct ChooseStarterAppWork *work);
void ov61_021E6350(BGCONFIG *bgConfig, HeapID heapId);
void ov61_021E6488(struct ChooseStarterAppWork *work);
void ov61_021E6508(struct ChooseStarterAppWork *work);
void ov61_021E6564(struct ChooseStarterAppWork *work);
void ov61_021E6730(struct ChooseStarterAppWork *work);
void ov61_021E6750(struct ChooseStarterAppWork *work);
void ov61_021E6814(struct ChooseStarterRnd *render, struct ChooseStarterAnm *anim);
void ov61_021E6820(struct ChooseStarterRnd *render, struct ChooseStarterAnm *anim);
void ov61_021E682C(struct ChooseStarterAnm *anm);
void ov61_021E6894(struct ChooseStarterAppWork *work);
BOOL ov61_021E68E4(struct ChooseStarterAppWork *work);
void ov61_021E6944(struct ChooseStarterAppWork *work);
BOOL ov61_021E6AE0(struct ChooseStarterAppWork *work, s16 a1);
void ov61_021E6B2C(struct ChooseStarterAppWork *work, int a1);
void ov61_021E6B6C(struct ChooseStarterAppWork *work);
void ov61_021E6C3C(BGCONFIG *bgConfig, HeapID heapId);
u8 ov61_021E6D78(WINDOW *window, HeapID heapId, BOOL makeFrame, s32 msgBank, int msgno, u32 color, u32 speed, STRING **out);
void ov61_021E6DFC(struct ChooseStarterAppWork *work, int msgId);
void ov61_021E6E30(WINDOW *window);
int ov61_021E6E40(struct ChooseStarterAppWork *work);
void ov61_021E6FC4(struct ChooseStarterAppWork *work);
void ov61_021E7248(struct UnkStarterChooseSub_3B4 *a0);
BOOL ov61_021E7268(struct ChooseStarterAppWork *work, int a1, int a2);
void ov61_021E7220(struct ChooseStarterAppWork *work);

BOOL ChooseStarterApplication_OvyInit(OVY_MANAGER *ovy, int *state_p) {
    struct ChooseStarterAppWork *work;
    struct ChooseStarterAppData *parent;
    int i;

    CreateHeap(3, HEAPID_STARTERCHOOSE, 0x40000);
    work = OverlayManager_CreateAndGetData(ovy, sizeof(struct ChooseStarterAppWork), HEAPID_STARTERCHOOSE);
    MI_CpuClear8(work, sizeof(struct ChooseStarterAppWork));
    work->heapId = HEAPID_STARTERCHOOSE;
    GF_ExpHeap_FndInitAllocator(&work->allocator, HEAPID_STARTERCHOOSE, 0x20);
    parent = OverlayManager_GetParentWork(ovy);
    work->frame = Options_GetFrame(parent->options);
    for (i = 0; i < 3; i++) {
        work->choices[i] = &parent->starters[i];
    }
    work->unk_3A5 = 1;
    Main_SetVBlankIntrCB((GFIntrCB)ov61_021E60B8, work);
    HBlankInterruptDisable();
    ov61_021E60C8();
    ov61_021E60E8(work->heapId);
    ov61_021E6140(work);
    work->bgConfig = BgConfig_Alloc(work->heapId);

    {
        struct GFBgModeSet bgModeSet;

        bgModeSet.dispMode = GX_DISPMODE_GRAPHICS;
        bgModeSet.bgModeMain = GX_BGMODE_0;
        bgModeSet.bgModeSub = GX_BGMODE_1;
        bgModeSet._2d3dSwitch = GX_BG0_AS_3D;

        SetBothScreensModesAndDisable(&bgModeSet);
    }

    ov61_021E6350(work->bgConfig, work->heapId);
    GX_EngineAToggleLayers(1, GX_LAYER_TOGGLE_ON);
    GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_OFF);
    GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_OFF);
    gSystem.screensFlipped = TRUE;
    GX_SwapDisplay();
    sub_02020080();
    ov61_021E6B6C(work);
    ov61_021E6C3C(work->bgConfig, work->heapId);
    ov61_021E6508(work);
    ov61_021E6564(work);
    work->unk_010 = sub_02023114(work->heapId);
    work->unk_574 = sub_02019014(work->heapId, work->unk_010);
    ov61_021E6488(work);
    ov61_021E6944(work);
    ov61_021E6FC4(work);
    TextFlags_SetCanABSpeedUpPrint(FALSE);
    sub_02002B50(TRUE);
    sub_02002B8C(FALSE);
    return TRUE;
}

extern const int ov61_021E7398[];

BOOL ChooseStarterApplication_OvyExec(OVY_MANAGER *ovy, int *state) {
    struct ChooseStarterAppWork *work = OverlayManager_GetData(ovy);
    int r6 = 0;
    int r0;
    switch (*state) {
    case 0:
        ov61_021E6DFC(work, msg_0190_00007);
        GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_OFF);
        GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_OFF);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, work->heapId);
        *state = 1;
        break;
    case 1:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        *state = 2;
        break;
    case 2:
        if (!sub_020190E8(work->unk_574)) {
            break;
        }
        work->unk_3A6 = ov61_021E6D78(work->unk_39C, work->heapId, TRUE, NARC_msg_msg_0190_bin, msg_0190_00000, MakeTextColor(1, 2, 15), work->unk_3A5, &work->unk_3B0);
        GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_OFF);
        GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_OFF);
        *state = 4;
        break;
    case 3:
        work->unk_3A6 = ov61_021E6D78(work->unk_39C, work->heapId, TRUE, NARC_msg_msg_0190_bin, msg_0190_00001 + work->unk_394, MakeTextColor(1, 2, 15), work->unk_3A5, &work->unk_3B0);
        ov61_021E6DFC(work, msg_0190_00008);
        GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_ON);
        GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_ON);
        *state = 4;
        break;
    case 4:
        if (sub_02020094(work->unk_3A6)) {
            break;
        }
        String_dtor(work->unk_3B0);
        work->unk_3B0 = NULL;
        *state = 5;
        break;
    case 5:
        if (!sub_020190E8(work->unk_574)) {
            break;
        }
        r0 = ov61_021E6E40(work);
        switch (r0) {
        case 8:
            r6 = 1;
            break;
        case 7:
            r6 = 2;
            break;
        }
        switch (r0) {
        case 5:
            work->unk_584 = 2;
            {
                STRING *sp14 = NULL;
                ov61_021E6D78(work->unk_39C, work->heapId, FALSE, NARC_msg_msg_0190_bin, msg_0190_00004 + work->unk_394,
                              MakeTextColor(1, 2, 15), 0, &sp14);
                String_dtor(sp14);
            }
            PlayCry(ov61_021E7398[work->unk_394], FALSE);
            ov61_021E6DFC(work, msg_0190_00007);
            GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_ON);
            GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_ON);
            ov61_021E7220(work);
            *state = 5;
            break;
        case 1:
        case 3:
            work->unk_39A = -0x800;
            *state = 6;
            sub_02006134(0x607, -0x200);
            break;
        case 2:
        case 4:
            work->unk_39A = 0x800;
            *state = 6;
            sub_02006134(0x607, -0x200);
            break;
        case 7:
            GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_OFF);
            GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_OFF);
            *state = 7;
            break;
        case 6:
            ov61_021E6820(&work->unk_070[work->unk_394 + 3], &work->unk_340[work->unk_394]);
            ov61_021E6814(&work->unk_070[work->unk_394 + 3], &work->unk_358);
            ov61_021E6814(&work->unk_070[0], &work->unk_360);
            work->unk_070[0].unk_58 = 1;
            *state = 10;
            break;
        case 8:
            if (work->unk_3A8 == 2) {
                work->unk_584 = 0;
                ov61_021E6DFC(work, msg_0190_00007);
                GX_EngineAToggleLayers(2, 0);
                GX_EngineAToggleLayers(4, 0);
                ov61_021E7248(&work->unk_3B4);
                work->unk_3A8 = 0;
                *state = 9;
            }
            break;
        }
        break;
    case 6:
        if (!ov61_021E6AE0(work, work->unk_39A)) {
            break;
        }
        work->unk_584 = 2;
        {
            STRING *sp10 = NULL;
            ov61_021E6D78(work->unk_39C, work->heapId, FALSE, NARC_msg_msg_0190_bin, msg_0190_00004 + work->unk_394, MakeTextColor(1, 2, 15), 0, &sp10);
            String_dtor(sp10);
        }
        PlayCry(ov61_021E7398[work->unk_394], 0);
        if (work->unk_3A8 != 1) {
            GX_EngineAToggleLayers(2, GX_LAYER_TOGGLE_ON);
            GX_EngineAToggleLayers(4, GX_LAYER_TOGGLE_ON);
        }
        ov61_021E7220(work);
        work->unk_3A8 = 1;
        *state = 5;
        break;
    case 7:
        if (!ov61_021E7268(work, 0, -0x15E0)) {
            break;
        }
        ov61_021E7220(work);
        *state = 8;
        break;
    case 8:
        if (!ov61_021E68E4(work)) {
            break;
        }
        work->unk_3A8 = 2;
        *state = 3;
        break;
    case 9:
        if (!ov61_021E7268(work, -0x15E0, 0)) {
            break;
        }
        ov61_021E6B2C(work, 0);
        *state = 2;
        break;
    case 10:
        BeginNormalPaletteFade(4, 0, 0, RGB_WHITE, 10, 1, work->heapId);
        work->unk_584 = 1;
        {
            struct UnkStruct_02019040 sp2C;
            extern const VecFx32 ov61_021E73A4;

            sp2C.unk_0 = 0xDCC0;
            sp2C.unk_2 = 0x11A4;
            sp2C.unk_4 = ov61_021E73A4;//(VecFx32){0,0,14*FX32_ONE};
            sp2C.unk_10 = 0x64000;

            sub_02019040(work->unk_574, &sp2C, 8);
        }
        *state = 11;
        PlaySE(SEQ_SE_DP_W025);
        break;
    case 11:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        BeginNormalPaletteFade(3, 0, 0, RGB_WHITE, 16, 1, work->heapId);
        *state = 12;
        break;
    case 12:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        return TRUE;
    }

    {
        struct UnkStruct_02019040 sp18;

        if (r6 != 0) {
            if (r6 == 1) {
                extern const VecFx32 ov61_021E7380;
                sp18.unk_0 = 0xDCC0;
                sp18.unk_2 = 0x11A4;
                sp18.unk_4 = ov61_021E7380;//(VecFx32){0, 0, 14 * FX32_ONE};
                sp18.unk_10 = 0x64000;
                work->unk_3AC = 0;
            } else {
                extern const VecFx32 ov61_021E73BC;
                sp18.unk_0 = 0xEA20;
                sp18.unk_2 = 0x1024;
                sp18.unk_4 = ov61_021E73BC;//(VecFx32){0, 0, 12 * FX32_ONE};
                sp18.unk_10 = 0x3C000;
                work->unk_3AC = 2;
            }
            sub_02019040(work->unk_574, &sp18, 8);
        }
    }
    if (work->unk_584 == 1) {
        ov61_021E682C(&work->unk_358);
        ov61_021E682C(&work->unk_360);
    } else if (work->unk_584 == 2) {
        ov61_021E6894(work);
    } else {
        NNS_G3dAnmObjSetFrame(work->unk_340[0].obj, 0);
        NNS_G3dAnmObjSetFrame(work->unk_340[1].obj, 0);
        NNS_G3dAnmObjSetFrame(work->unk_340[2].obj, 0);
    }
    {
        struct UnkStarterChooseSub_368 *r3 = &work->unk_368;
        r3->unk_4->unk_00 += FX32_ONE;
        if (r3->unk_4->unk_00 >= (r3->unk_4->unk_08[2] << FX32_SHIFT)) {
            r3->unk_4->unk_00 = 0;
        }
    }
    ov61_021E61FC(work);
    return FALSE;
}

BOOL ChooseStarterApplication_OvyExit(OVY_MANAGER *ovy, int *state) {
    struct ChooseStarterAppWork *work = OverlayManager_GetData(ovy);
    struct ChooseStarterAppData *data = OverlayManager_GetParentWork(ovy);

    TextFlags_SetCanABSpeedUpPrint(FALSE);
    sub_02002B50(FALSE);
    sub_02002B8C(FALSE);
    data->cursorPos = work->unk_394;
    Main_SetVBlankIntrCB(NULL, NULL);
    sub_02019030(work->unk_574);
    sub_02023120(work->unk_010);
    ov61_021E6730(work);
    ov61_021E6750(work);
    ov61_021E6068(&work->unk_3B4);
    sub_02024504(work->unk_3B4.unk_088);
    sub_0200A0D0(work->unk_3B4.unk_000);
    sub_0200A0D0(work->unk_3B4.unk_004);
    sub_0200A0D0(work->unk_3B4.unk_008);
    sub_0200A0D0(work->unk_3B4.unk_00C);
    sub_0200B244();
    sub_0202168C();
    sub_02022608();
    ov61_021E6E30(work->unk_39C);
    ov61_021E6E30(work->unk_3A0);
    FreeBgTilemapBuffer(work->bgConfig, 1);
    FreeBgTilemapBuffer(work->bgConfig, 2);
    FreeBgTilemapBuffer(work->bgConfig, 4);
    FreeBgTilemapBuffer(work->bgConfig, 5);
    FreeBgTilemapBuffer(work->bgConfig, 6);
    FreeToHeap(work->bgConfig);
    GF_3DVramMan_Delete(work->_3dMan);
    OverlayManager_FreeData(ovy);
    DestroyHeap(HEAPID_STARTERCHOOSE);
    return TRUE;
}

void ov61_021E6068(struct UnkStarterChooseSub_3B4 *a0) {
    int i;

    for (i = 0; i < 3; i++) {
        sub_0200AEB0(a0->unk_018[i].unk_00);
        sub_0200B0A8(a0->unk_018[i].unk_04);
        sub_0200A75C(a0->unk_000, a0->unk_018[i].unk_00);
        sub_0200A75C(a0->unk_004, a0->unk_018[i].unk_04);
        sub_0200A75C(a0->unk_008, a0->unk_018[i].unk_08);
        sub_0200A75C(a0->unk_00C, a0->unk_018[i].unk_0C);
        FreeToHeap(a0->unk_060[i]);
        FreeToHeap(a0->unk_06C[i]);
    }
}

void ov61_021E60B8(struct ChooseStarterAppWork *work) {
    sub_0200B224();
    BgConfig_HandleScheduledScrollAndTransferOps(work->bgConfig);
}

void ov61_021E60C8(void) {
    extern const struct GXBanksConfig ov61_021E7494;
    const struct GXBanksConfig cfg = ov61_021E7494;
    GX_SetBanks(&cfg);
}

void ov61_021E60E8(HeapID heapId) {
    NNS_G2dInitOamManagerModule();
    sub_0200B150(0, 0x80, 0, 0x20, 0, 0x80, 0, 0x20, heapId);
    {
        extern const struct UnkStruct_020215A0 ov61_021E73F8;
        struct UnkStruct_020215A0 sp14 = ov61_021E73F8;
        sp14.heapId = heapId;
        sub_020215C0(&sp14, 0x200010, 0x10);
    }
    sub_02022588(3, heapId);
    sub_020216C8();
    sub_02022638();
}

void ov61_021E6140(struct ChooseStarterAppWork *work) {
    int i;
    work->_3dMan = GF_3DVramMan_Create(work->heapId, 0, 2, 0, 4, NULL);
    G3X_AntiAlias(TRUE);
    G3X_AlphaTest(FALSE, 0);
    G3X_AlphaBlend(TRUE);
    G3X_EdgeMarking(TRUE);
    for (i = 0; i < 8; i++) {
        work->unk_588[i] = GX_RGB(4, 4, 4);
    }
    G3X_SetEdgeColorTable(work->unk_588);
    G3X_SetClearColor(GX_RGB(31, 31, 16), 0, 0x7FFF, 0x3F, FALSE);
    NNS_G3dGlbLightVector(GX_LIGHTID_0, 0, -FX16_ONE, 0);
    NNS_G3dGlbLightColor(GX_LIGHTID_0, RGB_WHITE);
    NNS_G3dGlbMaterialColorDiffAmb(RGB_WHITE, RGB_WHITE, FALSE);
    NNS_G3dGlbMaterialColorSpecEmi(RGB_WHITE, RGB_WHITE, FALSE);
}
