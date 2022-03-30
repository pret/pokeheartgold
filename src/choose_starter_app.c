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
#include "unk_02026E30.h"
#include "unk_0201F4C4.h"
#include "unk_02009D48.h"
#include "unk_0200E398.h"
#include "unk_02025154.h"
#include "unk_02020B8C.h"
#include "unk_02013FDC.h"
#include "gf_gfx_loader.h"

#define HEAPID_STARTERCHOOSE       46

struct ChooseStarterRnd {
    NNSG3dRenderObj obj;
    int unk_54;
    int unk_58;
    VecFx32 unk_5C;
    VecFx32 unk_68;
    u16 unk_74;
    u16 unk_76;
}; // size=0x78

struct ChooseStarterAnm {
    void *hdr;
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
    struct SomeDrawPokemonStruct unk_078;
    void *unk_088;
    u8 unk_08C[0x128];
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

struct ChooseStarter3dRes {
    NNSG3dResFileHeader *header;
    NNSG3dResMdlSet *mdlSet;
    NNSG3dResMdl *mdl;
    NNSG3dResTex *tex;
};

struct ChooseStarterAppWork {
    u8 filler_000[0x4];
    HeapID heapId;
    BGCONFIG *bgConfig;
    struct GF3DVramMan *_3dMan;
    UnkStruct_02022D74 *unk_010;
    VecFx32 unk_014;
    NNSFndAllocator allocator; // 020
    struct ChooseStarter3dRes unk_030[4];
    struct ChooseStarterRnd unk_070[6];
    struct ChooseStarterAnm unk_340[6];
    VecFx32 unk_370[3];
    u32 unk_394;
    fx16 unk_398;
    fx16 unk_39A;
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
void ov61_021E6240(struct ChooseStarterAppWork *work);
void ov61_021E6350(BGCONFIG *bgConfig, HeapID heapId);
void ov61_021E6488(struct ChooseStarterAppWork *work);
void ov61_021E6508(struct ChooseStarterAppWork *work);
void ov61_021E6564(struct ChooseStarterAppWork *work);
void ov61_021E6730(struct ChooseStarterAppWork *work);
void ov61_021E6750(struct ChooseStarterAppWork *work);
void ov61_021E6768(struct ChooseStarter3dRes *a0, int fileId, HeapID heapId);
void ov61_021E67BC(struct ChooseStarterRnd *rnd, struct ChooseStarter3dRes *res);
void ov61_021E67D4(int fileId, HeapID heapId, NNSFndAllocator *allocator, struct ChooseStarter3dRes *res, struct ChooseStarterAnm *anm);
void ov61_021E6814(struct ChooseStarterRnd *render, struct ChooseStarterAnm *anim);
void ov61_021E6820(struct ChooseStarterRnd *render, struct ChooseStarterAnm *anim);
BOOL ov61_021E682C(struct ChooseStarterAnm *anm);
void ov61_021E6894(struct ChooseStarterAppWork *work);
BOOL ov61_021E68E4(struct ChooseStarterAppWork *work);
void ov61_021E6908(struct ChooseStarter3dRes *a0);
void ov61_021E6918(struct ChooseStarterAnm *anm, NNSFndAllocator *alloc);
void ov61_021E6934(struct ChooseStarterRnd *rnd, fx32 x, fx32 y, fx32 z);
void ov61_021E693C(struct ChooseStarterRnd *rnd, fx32 x, fx32 y, fx32 z);
void ov61_021E6944(struct ChooseStarterAppWork *work);
void ov61_021E6A28(struct ChooseStarterRnd *render);
void ov61_021E6A48(struct ChooseStarterRnd *render, MtxFx43 *mtx);
BOOL ov61_021E6AE0(struct ChooseStarterAppWork *work, fx16 a1);
void ov61_021E6B2C(struct ChooseStarterAppWork *work, int a1);
void ov61_021E6B6C(struct ChooseStarterAppWork *work);
void ov61_021E6C3C(BGCONFIG *bgConfig, HeapID heapId);
u8 ov61_021E6D78(WINDOW *window, HeapID heapId, BOOL makeFrame, s32 msgBank, int msgno, u32 color, u32 speed, STRING **out);
void ov61_021E6DFC(struct ChooseStarterAppWork *work, int msgId);
void ov61_021E6E30(WINDOW *window);
int ov61_021E6E40(struct ChooseStarterAppWork *work);
int ov61_021E6F80(int a0, u8 a1, int a2);
int ov61_021E6F98(VecFx32 *vecs, VecFx32 *near, VecFx32 *far, fx32 a3);
void ov61_021E6FC4(struct ChooseStarterAppWork *work);
void ov61_021E7108(void *a0, void *a1, void *charData, void *plttData, u8 idx);
void ov61_021E7188(struct UnkStarterChooseSub_3B4 *a0, u8 idx, HeapID heapId);
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
            ov61_021E6814(&work->unk_070[work->unk_394 + 3], &work->unk_340[3]);
            ov61_021E6814(&work->unk_070[0], &work->unk_340[4]);
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
        ov61_021E682C(&work->unk_340[3]);
        ov61_021E682C(&work->unk_340[4]);
    } else if (work->unk_584 == 2) {
        ov61_021E6894(work);
    } else {
        NNS_G3dAnmObjSetFrame(work->unk_340[0].obj, 0);
        NNS_G3dAnmObjSetFrame(work->unk_340[1].obj, 0);
        NNS_G3dAnmObjSetFrame(work->unk_340[2].obj, 0);
    }
    {
        struct ChooseStarterAnm *r3 = &work->unk_340[5];
        r3->obj->frame += FX32_ONE;
        if (r3->obj->frame >= NNS_G3dAnmObjGetNumFrame(r3->obj)) {
            NNS_G3dAnmObjSetFrame(r3->obj, 0);
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

void ov61_021E61FC(struct ChooseStarterAppWork *work) {
    sub_0202457C(work->unk_3B4.unk_088);
    sub_02026E48();
    NNS_G3dGePushMtx();
    sub_02023154();
    ov61_021E6240(work);
    NNS_G3dGePopMtx(1);
    sub_02026E50(0, 0);
}

static inline void id_roty_mtx33(MtxFx33 *mtx, u16 index) {
    MTX_Identity33(mtx);
    MTX_RotY33(mtx, FX_SinIdx(index), FX_CosIdx(index));
}

void ov61_021E6240(struct ChooseStarterAppWork *work) {
    extern const VecFx32 ov61_021E73EC;
    const VecFx32 sp8C = ov61_021E73EC;
    MtxFx33 sp68;
    MtxFx33 sp44;
    int i;

    for (i = 0; i < 2; i++) {
        struct ChooseStarterRnd *rnd = &work->unk_070[i];
        if (rnd->unk_58) {
            MTX_Identity33(&sp68);
            MTX_RotY33(&sp44, FX_SinIdx(rnd->unk_74), FX_CosIdx(rnd->unk_74));
            MTX_Concat33(&sp44, &sp68, &sp68);
            sub_0201F554(&rnd->obj, &rnd->unk_5C, &sp68, &sp8C);
        }
    }

    {
        extern const VecFx32 ov61_021E73E0;
        MtxFx33 sp20;
        const VecFx32 sp14 = {0, 0, 0};
        const VecFx32 sp08 = ov61_021E73E0;

        NNS_G3dGlbSetBaseTrans(&sp14);
        id_roty_mtx33(&sp20, work->unk_398);
        NNS_G3dGlbSetBaseRot(&sp20);
        NNS_G3dGlbSetBaseScale(&sp08);
    }
    NNS_G3dGlbFlush();

    for (i = 2; i < 6; i++) {
        struct ChooseStarterRnd *rnd = &work->unk_070[i];
        if (rnd->unk_58) {
            NNS_G3dGePushMtx();
            ov61_021E6A28(rnd);
            NNS_G3dGePopMtx(1);
            NNS_G3dGlbFlush();
        }
    }
}

void ov61_021E6350(BGCONFIG *bgConfig, HeapID heapId) {
    G2_SetBG0Priority(2);
    {
        extern const BGTEMPLATE ov61_021E745C;
        const BGTEMPLATE sp70 = ov61_021E745C;
        InitBgFromTemplate(bgConfig, 1, &sp70, GF_BG_TYPE_TEXT);
        BG_ClearCharDataRange(1, 0x20, 0, heapId);
        BgClearTilemapBufferAndCommit(bgConfig, 1);
    }
    {
        extern const BGTEMPLATE ov61_021E7478;
        const BGTEMPLATE sp54 = ov61_021E7478;
        InitBgFromTemplate(bgConfig, 2, &sp54, GF_BG_TYPE_TEXT);
        BG_ClearCharDataRange(2, 0x20, 0, heapId);
        BgClearTilemapBufferAndCommit(bgConfig, 2);
    }
    {
        extern const BGTEMPLATE ov61_021E7408;
        const BGTEMPLATE sp38 = ov61_021E7408;
        InitBgFromTemplate(bgConfig, 4, &sp38, GF_BG_TYPE_TEXT);
        BG_ClearCharDataRange(4, 0x20, 0, heapId);
        BgClearTilemapBufferAndCommit(bgConfig, 4);
    }
    {
        extern const BGTEMPLATE ov61_021E7424;
        const BGTEMPLATE sp1C = ov61_021E7424;
        InitBgFromTemplate(bgConfig, 5, &sp1C, GF_BG_TYPE_TEXT);
        BG_ClearCharDataRange(5, 0x20, 0, heapId);
        BgClearTilemapBufferAndCommit(bgConfig, 5);
    }
    {
        extern const BGTEMPLATE ov61_021E7440;
        const BGTEMPLATE sp00 = ov61_021E7440;
        InitBgFromTemplate(bgConfig, 6, &sp00, GF_BG_TYPE_TEXT);
        BG_ClearCharDataRange(6, 0x20, 0, heapId);
        BgClearTilemapBufferAndCommit(bgConfig, 6);
    }
}

void ov61_021E6488(struct ChooseStarterAppWork *work) {
    extern const VecFx32 ov61_021E73C8;
    VecFx32 sp20;
    const VecFx32 sp14 = ov61_021E73C8;
    u16 sp0C[4];

    work->unk_014.x = 0;
    work->unk_014.y = FX32_ONE * 15;
    work->unk_014.z = 0;

    sp0C[0] = 0xDCC0;
    sp0C[1] = 0;
    sp0C[2] = 0;
    //sp0C[3] = 0;
    sub_02023254(&work->unk_014, 0x64000, sp0C, 0x11A4, 0, 1, work->unk_010);
    sub_02023514(&sp14, work->unk_010);
    sub_02023240(FX32_ONE * 4, FX32_ONE * 256, work->unk_010);
    sp20.x = 0;
    sp20.y = FX32_ONE;
    sp20.z = 0;
    sub_02023204(&sp20, work->unk_010);
    sub_0202313C(work->unk_010);
}

void ov61_021E6508(struct ChooseStarterAppWork *work) {
    struct UnkStarterChooseSub_3B4 *r4 = &work->unk_3B4;
    r4->unk_088 = sub_02009F40(3, &r4->unk_08C, work->heapId);
    r4->unk_000 = sub_0200A090(3, 0, work->heapId);
    r4->unk_004 = sub_0200A090(3, 1, work->heapId);
    r4->unk_008 = sub_0200A090(3, 2, work->heapId);
    r4->unk_00C = sub_0200A090(3, 3, work->heapId);
    GX_EngineBToggleLayers(0x10, GX_LAYER_TOGGLE_ON);
}

void ov61_021E6564(struct ChooseStarterAppWork *work) {
    int i;
    ov61_021E6768(&work->unk_030[0], 3, work->heapId);
    ov61_021E6934(&work->unk_070[0], 0, 14 * FX32_ONE, 32 * FX32_ONE);
    ov61_021E693C(&work->unk_070[0], FX32_ONE, FX32_ONE, FX32_ONE);
    ov61_021E6768(&work->unk_030[1], 0, work->heapId);
    ov61_021E6934(&work->unk_070[1], 0, 0, 0);
    ov61_021E693C(&work->unk_070[1], FX32_ONE, FX32_ONE, FX32_ONE);
    ov61_021E6768(&work->unk_030[2], 1, work->heapId);
    ov61_021E6934(&work->unk_070[2], 0, 0, 0);
    ov61_021E693C(&work->unk_070[2], FX32_ONE, FX32_ONE, FX32_ONE);
    ov61_021E6768(&work->unk_030[3], 2, work->heapId);
    ov61_021E67BC(&work->unk_070[0], &work->unk_030[0]);
    ov61_021E67BC(&work->unk_070[1], &work->unk_030[1]);
    ov61_021E67BC(&work->unk_070[2], &work->unk_030[2]);

    for (i = 0; i < 3; i++) {
        ov61_021E67BC(&work->unk_070[i + 3], &work->unk_030[3]);
    }
    work->unk_070[0].unk_58 = 0;
    work->unk_070[2].unk_58 = 1;
    work->unk_070[1].unk_58 = 1;
    work->unk_070[3].unk_58 = 1;
    work->unk_070[4].unk_58 = 1;
    work->unk_070[5].unk_58 = 1;
    ov61_021E67D4(7, work->heapId, &work->allocator, &work->unk_030[2], &work->unk_340[5]);
    ov61_021E67D4(6, work->heapId, &work->allocator, &work->unk_030[3], &work->unk_340[0]);
    ov61_021E67D4(6, work->heapId, &work->allocator, &work->unk_030[3], &work->unk_340[1]);
    ov61_021E67D4(6, work->heapId, &work->allocator, &work->unk_030[3], &work->unk_340[2]);
    ov61_021E67D4(5, work->heapId, &work->allocator, &work->unk_030[3], &work->unk_340[3]);
    ov61_021E67D4(4, work->heapId, &work->allocator, &work->unk_030[0], &work->unk_340[4]);
    ov61_021E6814(&work->unk_070[2], &work->unk_340[5]);
    ov61_021E6814(&work->unk_070[3], &work->unk_340[0]);
    ov61_021E6814(&work->unk_070[4], &work->unk_340[1]);
    ov61_021E6814(&work->unk_070[5], &work->unk_340[2]);
}

void ov61_021E6730(struct ChooseStarterAppWork *work) {
    int i;

    for (i = 0; i < 6; i++) {
        ov61_021E6918(&work->unk_340[i], &work->allocator);
    }
}

void ov61_021E6750(struct ChooseStarterAppWork *work) {
    int i;

    for (i = 0; i < 4; i++) {
        ov61_021E6908(&work->unk_030[i]);
    }
}

void ov61_021E6768(struct ChooseStarter3dRes *a0, int fileId, HeapID heapId) {
    a0->header = GfGfxLoader_LoadFromNarc(NARC_a_0_8_2, fileId, FALSE, heapId, FALSE);
    a0->mdlSet = NNS_G3dGetMdlSet(a0->header);
    a0->mdl = NNS_G3dGetMdlByIdx(a0->mdlSet, 0);
    a0->tex = NNS_G3dGetTex(a0->header);
    sub_0201F668(a0->tex);
}

void ov61_021E67BC(struct ChooseStarterRnd *rnd, struct ChooseStarter3dRes *res) {
    sub_0201F64C(res->header, res->tex);
    NNS_G3dRenderObjInit(&rnd->obj, res->mdl);
}

void ov61_021E67D4(int fileId, HeapID heapId, NNSFndAllocator *allocator, struct ChooseStarter3dRes *res, struct ChooseStarterAnm *anm) {
    void *pAnm;
    anm->hdr = GfGfxLoader_LoadFromNarc(NARC_a_0_8_2, fileId, FALSE, heapId, FALSE);
    pAnm = NNS_G3dGetAnmByIdx(anm->hdr, 0);
    anm->obj = NNS_G3dAllocAnmObj(allocator, pAnm, res->mdl);
    NNS_G3dAnmObjInit(anm->obj, pAnm, res->mdl, res->tex);
}

void ov61_021E6814(struct ChooseStarterRnd *rnd, struct ChooseStarterAnm *anm) {
    NNS_G3dRenderObjAddAnmObj(&rnd->obj, anm->obj);
}

void ov61_021E6820(struct ChooseStarterRnd *rnd, struct ChooseStarterAnm *anm) {
    NNS_G3dRenderObjRemoveAnmObj(&rnd->obj, anm->obj);
}

BOOL ov61_021E682C(struct ChooseStarterAnm *anm) {
    BOOL ret = FALSE;
    fx32 frame = anm->obj->frame + FX32_ONE;

    if (frame != NNS_G3dAnmObjGetNumFrame(anm->obj)) {
        NNS_G3dAnmObjSetFrame(anm->obj, frame);
    } else {
        ret = TRUE;
    }
    return ret;
}

void ov61_021E684C(struct ChooseStarterAnm *anm, int a1) {
    NNS_G3dAnmObjSetFrame(anm->obj, anm->obj->frame + FX32_ONE);
    if (a1 == 2 && anm->obj->frame == (FX32_ONE * 40)) {
        NNS_G3dAnmObjSetFrame(anm->obj, FX32_ONE * 80);
    }
    if (anm->obj->frame >= NNS_G3dAnmObjGetNumFrame(anm->obj)) {
        if (a1 == 2) {
            NNS_G3dAnmObjSetFrame(anm->obj, FX32_ONE * 80);
        } else {
            NNS_G3dAnmObjSetFrame(anm->obj, 0);
        }
    }
}

static inline struct ChooseStarterAnm *GetAnmByIdx(struct ChooseStarterAppWork *work, u8 idx) {
    return &work->unk_340[idx];
}

void ov61_021E6894(struct ChooseStarterAppWork *work) {
    u32 idx = work->unk_394;
    ov61_021E684C(GetAnmByIdx(work, idx), work->unk_3AC);
    NNS_G3dAnmObjSetFrame(GetAnmByIdx(work, (idx + 1) % 3)->obj, 0);
    NNS_G3dAnmObjSetFrame(GetAnmByIdx(work, (idx + 2) % 3)->obj, 0);
}

BOOL ov61_021E68E4(struct ChooseStarterAppWork *work) {
    u32 idx = work->unk_394;
    return GetAnmByIdx(work, idx)->obj->frame >= 80 * FX32_ONE;
}

void ov61_021E6908(struct ChooseStarter3dRes *a0) {
    if (a0->header != NULL) {
        FreeToHeap(a0->header);
    }
}

void ov61_021E6918(struct ChooseStarterAnm *anm, NNSFndAllocator *alloc) {
    if (anm->hdr != NULL) {
        NNS_G3dFreeAnmObj(alloc, anm->obj);
        FreeToHeap(anm->hdr);
    }
}

void ov61_021E6934(struct ChooseStarterRnd *rnd, fx32 x, fx32 y, fx32 z) {
    rnd->unk_5C.x = x;
    rnd->unk_5C.y = y;
    rnd->unk_5C.z = z;
}

void ov61_021E693C(struct ChooseStarterRnd *rnd, fx32 x, fx32 y, fx32 z) {
    rnd->unk_68.x = x;
    rnd->unk_68.y = y;
    rnd->unk_68.z = z;
}

void ov61_021E6944(struct ChooseStarterAppWork *work) {
    extern const VecFx32 ov61_021E73B0;
    VecFx32 sp40;
    const VecFx32 sp34 = ov61_021E73B0;
    MtxFx33 sp10;
    int i;
    u16 sp0;
    u8 r4 = work->unk_394;
    int angle = 0;

    for (i = 0; i < 3; i++) {
        sp0 = angle / 3;
        MTX_RotY33(&sp10, FX_SinIdx(sp0), FX_CosIdx(sp0));
        MTX_MultVec33(&sp34, &sp10, &sp40);
        work->unk_370[r4] = sp40;
        work->unk_370[r4].y += 13 * FX32_ONE;
        ov61_021E6934(&work->unk_070[r4 + 3], sp40.x, sp40.y, sp40.z);
        ov61_021E693C(&work->unk_070[r4 + 3], FX32_ONE, FX32_ONE, FX32_ONE);
        work->unk_070[r4 + 3].unk_74 = sp0;
        work->unk_070[r4 + 3].unk_76 = 0;
        r4 = (r4 + 1) % 3;
        angle += 16 * FX32_ONE;
    }
}

void ov61_021E6A28(struct ChooseStarterRnd *render) {
    MtxFx43 sp0;
    ov61_021E6A48(render, &sp0);
    NNS_G3dGeMultMtx43(&sp0);
    NNS_G3dDraw(&render->obj);
}

void ov61_021E6A48(struct ChooseStarterRnd *render, MtxFx43 *mtx) {
    MtxFx43 sp64;
    MtxFx43 sp34;
    MtxFx43 sp04;
    MTX_Identity43(mtx);
    MTX_TransApply43(mtx, mtx, render->unk_5C.x, render->unk_5C.y, render->unk_5C.z);
    MTX_Identity43(&sp64);
    MTX_RotX43(&sp04, FX_SinIdx(render->unk_76), FX_CosIdx(render->unk_76));
    MTX_Concat43(&sp04, &sp64, &sp64);
    MTX_RotY43(&sp04, FX_SinIdx(render->unk_74), FX_CosIdx(render->unk_74));
    MTX_Concat43(&sp04, &sp64, &sp64);
    MTX_Scale43(&sp34, render->unk_68.x, render->unk_68.y, render->unk_68.z);
    MTX_Concat43(&sp64, mtx, mtx);
    MTX_Concat43(&sp34, mtx, mtx);
}

BOOL ov61_021E6AE0(struct ChooseStarterAppWork *work, fx16 a1) {
    BOOL ret = FALSE;
    work->unk_398 += a1;
    if (a1 >= 0) {
        if (work->unk_398 >= 0x5555) {
            work->unk_398 = 0;
            work->unk_39A = 0;
            ov61_021E6B2C(work, 1);
            ret = TRUE;
        }
    } else {
        if (work->unk_398 <= -0x5555) {
            work->unk_398 = 0;
            work->unk_39A = 0;
            ov61_021E6B2C(work, 2);
            ret = TRUE;
        }
    }
    return ret;
}

void ov61_021E6B2C(struct ChooseStarterAppWork *work, int a1) {
    if (a1 == 2) {
        work->unk_394 = (work->unk_394 + 1) % 3;
    } else if (a1 == 1) {
        s8 r0 = work->unk_394 - 1;
        if (r0 < 0) {
            r0 = 2;
        }
        work->unk_394 = r0;
    }
    ov61_021E6944(work);
}

void ov61_021E6B6C(struct ChooseStarterAppWork *work) {
    work->unk_39C = AllocWindows(work->heapId, 1);
    work->unk_3A0 = AllocWindows(work->heapId, 1);
    AddWindowParameterized(work->bgConfig, work->unk_39C, 4, 2, 19, 27, 4, 2, 0x01F);
    AddWindowParameterized(work->bgConfig, work->unk_3A0, 1, 1, 19, 29, 4, 2, 0x01F);
    FillWindowPixelBuffer(work->unk_39C, 15);
    FillWindowPixelBuffer(work->unk_3A0, 0);
    sub_0200E644(work->bgConfig, 4, 0x200, 0, work->frame, work->heapId);
    GfGfxLoader_GXLoadPal(NARC_a_0_8_2, 8, 4, 0x040, 0x20, work->heapId);
    GfGfxLoader_GXLoadPal(NARC_a_0_8_2, 8, 0, 0x040, 0x20, work->heapId);
    DrawFrameAndWindow2(work->unk_39C, 0, 0x200, 0);
}

void ov61_021E6C3C(BGCONFIG *bgConfig, HeapID heapId) {
    GfGfxLoader_LoadCharData(NARC_a_0_8_2, 13, bgConfig, 2, 0, 0, FALSE, heapId);
    GfGfxLoader_LoadCharData(NARC_a_0_8_2, 10, bgConfig, 5, 0, 0, FALSE, heapId);
    GfGfxLoader_LoadCharData(NARC_a_0_8_2, 16, bgConfig, 6, 0, 0, FALSE, heapId);
    GfGfxLoader_LoadScrnData(NARC_a_0_8_2, 14, bgConfig, 2, 0, 0, FALSE, heapId);
    GfGfxLoader_LoadScrnData(NARC_a_0_8_2, 11, bgConfig, 5, 0, 0, FALSE, heapId);
    GfGfxLoader_LoadScrnData(NARC_a_0_8_2, 17, bgConfig, 6, 0, 0, FALSE, heapId);
    GfGfxLoader_GXLoadPal(NARC_a_0_8_2, 12, 0, 0x60, 0x20, heapId);
    GfGfxLoader_GXLoadPal(NARC_a_0_8_2, 9, 4, 0x60, 0x20, heapId);
    GfGfxLoader_GXLoadPal(NARC_a_0_8_2, 15, 4, 0x80, 0x20, heapId);
    BgTilemapRectChangePalette(bgConfig, 2, 0, 0, 0x20, 0x18, 3);
    BgTilemapRectChangePalette(bgConfig, 5, 0, 0, 0x20, 0x18, 3);
    BgTilemapRectChangePalette(bgConfig, 6, 0, 0, 0x20, 0x18, 4);
    BgCommitTilemapBufferToVram(bgConfig, 2);
    BgCommitTilemapBufferToVram(bgConfig, 5);
    BgCommitTilemapBufferToVram(bgConfig, 6);
    G2S_SetBlendAlpha(4, 34, 5, 11);

}

u8 ov61_021E6D78(WINDOW *window, HeapID heapId, BOOL makeFrame, s32 msgBank, int msgno, u32 color, u32 speed, STRING **out) {
    MSGDATA *msgData;
    u8 ret;
    GF_ASSERT(*out == NULL);
    msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msgBank, heapId);
    GF_ASSERT(msgData != NULL);
    *out = NewString_ReadMsgData(msgData, msgno);
    FillWindowPixelBuffer(window, color);
    ret = AddTextPrinterParameterized2(window, 1, *out, 0, 0, speed, color, NULL);
    if (makeFrame) {
        DrawFrameAndWindow2(window, 0, 0x200, 0);
    } else {
        CopyWindowToVram(window);
    }
    DestroyMsgData(msgData);
    return ret;
}

void ov61_021E6DFC(struct ChooseStarterAppWork *work, int msgId) {
    STRING *string = NULL;
    ov61_021E6D78(work->unk_3A0, work->heapId, FALSE, NARC_msg_msg_0190_bin, msgId, MakeTextColor(1, 2, 0), 0, &string);
    String_dtor(string);
}

void ov61_021E6E30(WINDOW *window) {
    RemoveWindow(window);
    FreeToHeap(window);
}

int ov61_021E6E40(struct ChooseStarterAppWork *work) {
    int ret = 0;
    if (!sub_0202534C()) {
        if (gSystem.newKeys & PAD_BUTTON_A) {
            if (work->unk_3A8 == 2) {
                ret = 6;
            } else if (work->unk_3A8 == 1) {
                ret = 7;
            } else {
                work->unk_3A8 = 1;
                ret = 5;
            }
        } else if (gSystem.newKeys & PAD_BUTTON_B) {
            if (work->unk_3A8 == 2) {
                ret = 8;
            }
        } else if (gSystem.newKeys & PAD_KEY_LEFT) {
            if (work->unk_3A8 != 2) {
                ret = 1;
            }
        } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
            if (work->unk_3A8 != 2) {
                ret = 2;
            }
        }
    } else if (gSystem.heldKeys == 0 && sub_02025358()) {
        VecFx32 near, far;
        int num;
        fx32 r3;
        NNS_G3dScrPosToWorldLine(gSystem.touchX, gSystem.touchY, &near, &far);
        if (work->unk_3A8 == 2) {
            r3 = 6 * FX32_ONE;
        } else {
            r3 = 13 * FX32_ONE;
        }
        num = ov61_021E6F98(work->unk_370, &near, &far, r3);
        if (num != 3) {
            if (work->unk_3A8 == 2) {
                if (num == work->unk_394) {
                    ret = 6;
                } else {
                    ret = 8;
                }
            } else if (work->unk_3A8 == 1) {
                if (num == work->unk_394) {
                    ret = 7;
                } else {
                    ret = ov61_021E6F80(num, work->unk_394, work->unk_3AC);
                }
            } else {
                if (num == work->unk_394) {
                    work->unk_3A8 = 1;
                    ret = 5;
                } else {
                    ret = ov61_021E6F80(num, work->unk_394, work->unk_3AC);
                }
            }
        } else if (work->unk_3A8 == 2) {
            ret = 8;
        }
    }
    if (ret == 6) {
        PlaySE(SEQ_SE_DP_BOX01);
    }
    return ret;
}

int ov61_021E6F80(int a0, u8 a1, int a2) {
#pragma unused(a2)
    if (((a1 + 1) % 3) == a0) {
        return 1;
    } else {
        return 2;
    }
}

int ov61_021E6F98(VecFx32 *vecs, VecFx32 *near, VecFx32 *far, fx32 a3) {
    u8 i;
    for (i = 0; i < 3; i++) {
        if (sub_02020B9C(&vecs[i], near, far) <= a3) {
            break;
        }
    }
    return i;
}

void ov61_021E6FC4(struct ChooseStarterAppWork *work) {
    NARC *narc = NARC_ctor(NARC_a_0_9_3, work->heapId);
    int i; //r4
    struct UnkStarterChooseSub_3B4 *r5 = &work->unk_3B4;

    for (i = 0; i < 3; i++) {
        // r7=sp14=r5=work->unk_3B4
        // sp10=r6=work
        // sp24=r5->unk_078
        r5->unk_018[i].unk_00 = sub_0200A3C8(r5->unk_000, narc, 9, 0, i, 2, work->heapId);
        r5->unk_018[i].unk_04 = sub_0200A480(r5->unk_004, narc, 6, 0, i, 2, 1, work->heapId);
        r5->unk_018[i].unk_08 = sub_0200A540(r5->unk_008, narc, 10, 0, i, 2, work->heapId);
        r5->unk_018[i].unk_0C = sub_0200A540(r5->unk_00C, narc, 16, 0, i, 3, work->heapId);
        sub_020701E4(
            &r5->unk_078,
            GetMonData(work->choices[i], MON_DATA_SPECIES, NULL),
            GetMonData(work->choices[i], MON_DATA_GENDER, NULL),
            2,
            MonIsShiny(work->choices[i]),
            0,
            0
        );
        r5->unk_060[i] = sub_0201442C(r5->unk_078.narcID, r5->unk_078.charDataID, work->heapId);
        r5->unk_06C[i] = sub_02014450(r5->unk_078.narcID, r5->unk_078.palDataID, work->heapId);
        ov61_021E7108(r5->unk_000, r5->unk_004, r5->unk_060[i], r5->unk_06C[i], i);
        ov61_021E7188(r5, i, work->heapId);
    }

    NARC_dtor(narc);
}
