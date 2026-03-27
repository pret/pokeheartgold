#include "overlay_44.h"

#include "vram_transfer_manager.h"
#include "math_util.h"
#include "gf_gfx_loader.h"
#include "global.h"
#include "overlay_42.h"

#include "obj_pltt_transfer.h"
#include "obj_char_transfer.h"
#include "overlay_manager.h"
#include "vram_transfer_manager.h"
#include "gf_gfx_loader.h"
#include "constants/sndseq.h"
#include "msgdata/msg.naix"

#include "bg_window.h"
#include "filesystem.h"

#include "unk_0200ACF0.h"
#include "unk_0200A090.h"
#include "unk_02037C94.h"
#include "unk_020971F8.h"
#include "unk_020379A0.h"
#include "overlay_00_thumb.h"

// const u16 ov44_02235600[2] = {3, 2};

// const u8 ov44_02235604[11] = {0, 0, 0, 28, 0, 0, 3, 0, 88, 22, 0};

// const u32 ov44_02235630[4] = {0xB0010, 0xB0010, 0xB0016, 0xB001C};

// const void* ov44_0223688C[4];

// const u8 ov44_0223560F[1] = {0};
// const u8 ov44_02235610[1] = {0};
// const u8 ov44_02235611[1] = {0};
// const u8 ov44_02235612[30] = {1, 1, 2, 1, 0, 1, 4, 1, 1, 1, 2, 1, 0, 0, 0, 0, 1, 1, 2, 1, 1, 1, 4, 1, 0, 1, 3, 1, 1, 0};

extern u16 ov44_02235600[2];
extern u8 ov44_02235604[11];
extern u32 ov44_02235630[4];
extern u32 ov44_0223688C[4];

extern u8 ov44_0223560F[1];
extern u8 ov44_02235610[1];
extern u8 ov44_02235611[1];
extern u8 ov44_02235612[30];

void ov44_02231918(UnkStruct_ov44_022319EC* arg0, s32 arg1) {
    if (arg1 != -1) {
        PlayerProfile* playerProfile = PlayerProfile_New(HEAP_ID_53);
        Save_Profile_PlayerName_Set(playerProfile, sub_0202C254(arg0->unk0, arg1));
        BufferPlayersName(arg0->unkB1C, 0, playerProfile);
        Heap_Free(playerProfile);
    }
}

s32* ov44_02231958(UnkStruct_ov44_022319EC* arg0, u32 arg1) {
    if (arg1 >= 32) {
        return &arg0->unk1098;
    }
    return &arg0->unk4->unk24 + 9 * arg1;
}


void ov44_02231974(void) {
    ov00_021E6D68();
}

void ov44_0223197C(UnkStruct_ov44_022319EC* arg0, s32 arg1, s32 arg2) {
    sub_020379A0(HEAP_ID_15);
    ov00_021E70B8(arg0->unk4->unk21);
    if (ov44_02229F44(arg2) == 1) {
        ov00_021E714C(1, 128);
    } else {
        ov00_021E714C(0, 128);
    }
    sub_02097214();
    sub_02039080(arg1);
}

void ov44_022319BC(UnkStruct_ov44_022319EC* arg0, s32 arg1) {
    if (arg0->unkD64 == 0) {
        arg0->unkD64 = 1;
        ov44_02231D94(&arg0->unk38C, 1);
        if (arg1 == 1) {
            ov44_0222F510(arg0, 9, 0);
        }
    }
}

void ov44_022319EC(UnkStruct_ov44_022319EC* arg0) {
    if (arg0->unkD64 == 1) {
        arg0->unkD64 = 0;
        ov44_0222F7BC(arg0);
        ov44_02231D94(&arg0->unk38C, 0);
    }
}

YesNoPrompt* ov44_02231A14(BgConfig* arg0, UnkStruct_ov44_02231A28* arg1, u32 arg2) {
    YesNoPrompt* yesNoPrompt = ov44_02231A28(arg0, arg1, arg2);
    YesNoPrompt_SetIgnoreTouch(yesNoPrompt, 1);
    return yesNoPrompt;
}

YesNoPrompt* ov44_02231A28(BgConfig* arg0, UnkStruct_ov44_02231A28* arg1, u32 arg2) {
    YesNoPrompt* yesNoPrompt = YesNoPrompt_Create(HEAP_ID_53);
    YesNoPromptTemplate yesNoPromptTemplate;
    yesNoPromptTemplate.bgConfig = arg0;
    yesNoPromptTemplate.bgId = arg1->unk0;
    yesNoPromptTemplate.tileStart = arg1->unk6;
    yesNoPromptTemplate.plttSlot = arg1->unk5;
    yesNoPromptTemplate.x = arg1->unk1;
    yesNoPromptTemplate.y = arg1->unk2;
    yesNoPromptTemplate.ignoreTouchFlag = 0;
    yesNoPromptTemplate.initialCursorPos = arg2;
    yesNoPromptTemplate.shapeParam = 0;
    YesNoPrompt_InitFromTemplate(yesNoPrompt, &yesNoPromptTemplate);
    return yesNoPrompt;
}   

void ov44_02231A7C(UnkStruct_ov44_02232DA0* arg0, enum HeapID arg1, NARC* arg2, BgConfig* arg3, s32 arg4, u32 arg5) {
    memset(arg0, 0, sizeof(UnkStruct_ov44_02232DA0));
    arg0->unk4 = arg1;
    u32 temp_r7 = (arg5 - 1) / 8;
    arg0->unk10 = arg3;
    ov44_02232298(&arg0->unk14, arg0->unk4, arg2);
    ov44_02232334(arg0->unk10, arg1);
    
    u32 temp_r0 = ov44_02232E90(temp_r7);
    UnkStruct_ov44_02232914 sp4;
    sp4 = (UnkStruct_ov44_02232914){temp_r0, temp_r0 >> 0x10};
    
    arg0->unk6E4 = ov42_02227EE0(sp4.unk0, sp4.unk2, arg1);
    ov42_02227F48(arg0->unk6E4, ov44_02232E9C(temp_r7));
    arg0->unk6E8 = ov42_02228010(0x30, arg1);
    ov44_02232204(arg0, arg4, arg1);
    ov42_02229394(&arg0->unk6F0);
    ov44_02232248(arg0, arg1, arg2, temp_r7);
    ov44_0223233C(arg0->unk10, arg1, arg2);
    ov44_02232CCC(arg0, &arg0->unk6D0, arg2);
    arg0->unk6F8 = ov42_02229A40(0x80, arg1);
    arg0->unk0 = 1;
}

void ov44_02231B4C(UnkStruct_ov44_02232DA0* arg0) {
    ov42_02229A78(arg0->unk6F8);
    ov44_02232288(arg0);
    ov44_02232D08(arg0, &arg0->unk6D0);
    ov44_02232028(arg0);
    ov44_02232238(arg0);
    ov42_02228050(arg0->unk6E8);
    ov42_02227F28(arg0->unk6E4);
    ov44_022322E8(&arg0->unk14);
    ov44_02232338(arg0->unk10);
    memset(arg0, 0, sizeof(UnkStruct_ov44_02232DA0));
}

s32 ov44_02231BB0(s32* arg0) {
    return arg0[0];
}

s32 ov44_02231BB4(UnkStruct_ov44_02232DA0* arg0) {
    ov42_0222807C(arg0->unk6E8);
    ov44_02232158(arg0);
    ov44_02232104(arg0);
    ov42_02229358(&arg0->unk6F0, arg0->unk6CC->unk0);
    ov42_02229420(arg0->unk6F4, &arg0->unk6F0);
    ov42_022290DC(arg0->unk6EC);
    ov44_02232194(arg0);
    ov44_02232594(arg0);
    if (ov44_02232050(arg0) == 1) {
        if (ov44_02232604(arg0) == 1) {
            ov44_0223254C(arg0);
            if (128 & gSystem.heldKeys) {
                return 1;
            }
        }
        if (1 & gSystem.newKeys) {
            if (ov44_02231C70(arg0) != 0) {
                return 2;
            }
            if (ov44_02232070(arg0) == 1) {
                return 3;
            }
        }
    }
    return 0;
}

void ov44_02231C60(UnkStruct_ov44_02232DA0* arg0) {
    if (arg0->unk0 != 0) {
        SpriteList_RenderAndAnimateSprites(arg0->unk14.unk0);
    }
}

u8 ov44_02231C70(UnkStruct_ov44_02232DA0* arg0) {
    if (arg0->unk6CC == NULL) {
        GF_AssertFail();
    }
    return arg0->unk6CC->unkA;
}

void ov44_02231C8C(UnkStruct_ov44_02232DA0* arg0) {
    if (arg0->unk6CC == NULL) {
        GF_AssertFail();
    }
    u32 temp_r0 = ov42_022282DC(arg0->unk6CC->unk0);
    vu16 sp0[4];
    sp0[0] = temp_r0;
    sp0[1] = temp_r0 >> 16;
    sp0[2] = sp0[0];
    sp0[3] = sp0[1];
    ov42_02227FDC(arg0->unk6E4, (s16)sp0[2] / 16, (s16)sp0[3] / 16);
}

s32 ov44_02231CE8(UnkStruct_ov44_02232DA0* arg0) {
    if (arg0->unk6CC == NULL) {
        GF_AssertFail();
    }
    
    u32 temp_r0 = ov42_022282DC(arg0->unk6CC->unk0);
    UnkStruct_ov44_02232914 sp0;
    sp0 = (UnkStruct_ov44_02232914){temp_r0,  temp_r0 >> 16};
    ov42_02227FDC(arg0->unk6E4, (s16)sp0.unk0 / 16, ((s16)sp0.unk2 / 16) + 1);
}

void ov44_02231D48(UnkStruct_ov44_02232DA0* arg0, s32* arg1) {    
    u32 temp_r0 = ov42_022282DC(arg1[0]);
    UnkStruct_ov44_02232914 sp0[2];
    sp0[0].unk0 = temp_r0;
    sp0[0].unk2 = temp_r0 >> 16;
    sp0[1] = sp0[0];
    ov44_022325A4(arg0, sp0[1], ov42_0222920C(arg1[1]) - 2);
}

void ov44_02231D8C(UnkStruct_ov44_02232DA0* arg0) {
    ov44_022325F4(arg0);
}

void ov44_02231D94(UnkStruct_ov44_02232DA0* arg0, s32 arg1) {
    arg0->unkC = arg1;
}

s32 ov44_02231D98(UnkStruct_ov44_02232DA0* arg0) {
    return arg0->unkC;
}

UnkStruct_ov44_02232B74* ov44_02231D9C(UnkStruct_ov44_02232DA0* arg0, s16 arg1) {
    s16 spC;
    UnkStruct_ov44_02232B74* temp_r0 = ov44_02232798(arg0);
    arg0->unk6CC = temp_r0;
    ov44_02232724(arg0, &spC);
    ov44_02232800(arg0, temp_r0, &spC, 0, arg1, 0, 0);
    ov44_02232864(arg0, temp_r0);
    ov44_022327C8(arg0, temp_r0, 1);
    ov42_02229358(&arg0->unk6F0, arg0->unk6CC->unk0);
    ov42_02229420(arg0->unk6F4, &arg0->unk6F0);
    return temp_r0;
}

UnkStruct_ov44_02232B74* ov44_02231E08(UnkStruct_ov44_02232DA0* arg0, s16 arg1, s16 arg2) {
    u16 spC[6];
    UnkStruct_ov44_02232B74* temp_r4;
    
    temp_r4 = ov44_02232798(arg0);
    ov44_02232680(arg0, &spC[4], arg2 - 1);
    if (arg0->unk6CC != NULL) {
        u32 temp_r0_2 = ov42_022282DC(arg0->unk6CC->unk0);
        spC[0] = temp_r0_2;
        spC[1] = temp_r0_2 >> 16;
        spC[2] = spC[0];
        spC[3] = spC[1];
        if (((s16) spC[2] == (s16)spC[4]) && ((s16) spC[3] == (s16)spC[5])) {
            return NULL;
        }
    }
    ov44_02232800(arg0, temp_r4, &spC[4], arg2, arg1, 1, 4);
    ov44_02232884(arg0, temp_r4);
    ov44_022327C8(arg0, temp_r4, 0);
    return temp_r4;
}

void ov44_02231E94(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    ov42_02228188(arg1->unk0, 6);
    arg1->unk10 = ov44_02232BCC;
    arg1->unk18 = ov44_02232914;
    arg1->unkC = 2;
    arg1->unk8 = 0;
    ov42_0222919C(arg1->unk4, 0);
    ov42_022291A0(arg1->unk4);
    ov44_02232C6C(arg0, 4, arg1);
}

void ov44_02231ED4(s32* arg0) {
    ov42_022290C4(arg0[1]);
    ov42_02228100(arg0[0]);
    __builtin__clear(arg0, 28);
}

u8 ov44_02231EF4(s32* arg0) {
    return ov42_02228188(arg0[0], 4);
}

void ov44_02231F04(s32* arg0) {
    ov42_02228188(arg0[0], 6);
    ov42_022282A4();
}

void ov44_02231F14(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1, s32 arg2) {
    arg1->unk14 = arg1->unk10;
    arg1->unk10 = ov44_02232C48;
    arg1->unkE = arg1->unkC;
    arg1->unkC = 5;
    ov44_02232C4C(arg0, 0, arg2, ov42_02228188(arg1->unk0, 4));
    ov42_0222919C(arg1->unk4, 0);
    ov42_02229218(arg1->unk4, arg2);
    
    UnkStruct_ov44_02232914 temp_r3 = {ov42_02228188(arg1->unk0, 0), ov42_02228188(arg1->unk0, 1)};
    ov42_022291D8(arg1->unk4, temp_r3);
}

void ov44_02231F88(s32 arg0, UnkStruct_ov44_02232B74* arg1) {
    if (arg1 != NULL) {
        if (arg1->unk14 != 0) {
            arg1->unk10 = arg1->unk14;
            arg1->unk14 = 0;
            arg1->unkC = arg1->unkE;
            ov42_0222919C(arg1->unk4, 1);
        }
    }
}

void ov44_02231FA8(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1, u8 arg2) {
    if (ov44_02232C94(arg1) == 0) {
        arg1->unkB = arg2;
        return;
    }
    ov44_02232CA8(arg0, arg1, arg2);
}

void ov44_02231FCC(UnkStruct_ov44_02232DA0* arg0) {
    if (ov44_02232070(arg0) == 1) {
        s8 temp_r4 = (s8) ov44_02231CE8(arg0) - 3;
        if (temp_r4 < 0 || temp_r4 >= 4) {
            GF_AssertFail();
        }
        ov44_02232E5C(&arg0->unk6D0, temp_r4);
        return;
    }
    GF_AssertFail();
}

void ov44_02232008(UnkStruct_ov44_02232DA0* arg0) {
    ov44_02232E80(&arg0->unk6D0);
}

void ov44_02232018(UnkStruct_ov44_02232DA0* arg0) {
    ov44_02232D20(arg0, &arg0->unk6D0);
}

void ov44_02232028(UnkStruct_ov44_02232DA0* arg0) {
    for (s32 i = 0; i < 48; i++) {
        if (arg0->unk18C[i].unk0 != 0) {
            ov44_02231ED4(&arg0->unk18C[i].unk0);
        }
    }
}

s32 ov44_02232050(UnkStruct_ov44_02232DA0* arg0) {
    if (ov42_02228188(arg0->unk6CC->unk0, 5) == 0) {
        return 1;
    }
    return 0;
}

s32 ov44_02232070(UnkStruct_ov44_02232DA0* arg0) {
    u32 temp = ov42_022282DC(arg0->unk6CC->unk0);
    UnkStruct_ov44_02232914 sp0[2];
    sp0[1] = (UnkStruct_ov44_02232914){temp, temp >> 16};
    
    u16 temp_r4 = ov42_02228188(arg0->unk6CC->unk0, 6); 
    temp = ov42_02228270(sp0[1], temp_r4);
    sp0[0] = (UnkStruct_ov44_02232914){temp, temp >> 16};
    
    s32 temp_r0_3 = ov42_02227FDC(arg0->unk6E4, (s16)sp0[0].unk0 / 16, (s16)sp0[0].unk2 / 16);
    if ((temp_r4 == 0) && (temp_r0_3 == 2)) {
        return 1;
    }
    return 0;
}

void ov44_02232104(UnkStruct_ov44_02232DA0* arg0) {
    u32 sp0[3];
    if (ov42_02229AC8(arg0->unk6F8, &sp0[2]) == 1) {
        do {
            if (ov42_02228C80(arg0->unk6E4, arg0->unk6E8, &sp0[2], &sp0[0]) == 1) {
                ov42_02228068(arg0->unk6E8, &sp0[0]);
            }
        } while (ov42_02229AC8(arg0->unk6F8, &sp0[2]) == 1);
    }
}

void ov44_02232158(UnkStruct_ov44_02232DA0* arg0) {
    for (s32 i = 0; i < 48; i++) {
        if ((arg0->unk18C[i].unk0 != 0) && (arg0->unk18C[i].unk10(arg0, &arg0->unk18C[i]) == 1)) {
            ov44_02231ED4(&arg0->unk18C[i].unk0);
        }
    }
}

void ov44_02232194(UnkStruct_ov44_02232DA0* arg0) {
    for (s32 i = 0; i < 48; i++) {
        if (arg0->unk18C[i].unk0 != 0) {
            arg0->unk18C[i].unk18(arg0, &arg0->unk18C[i]);
        }
    }
}

UnkStruct_ov44_02232B74* ov44_022321C4(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1, u16 arg2) {
    s32 temp_r0 = ov42_022283BC(arg1->unk0, arg0->unk6E8);
    if (temp_r0 != 0) {
        for (s32 i = 0; i < 48; i++) {
            s32 temp_r3 = arg0->unk18C[i].unk0;
            if (temp_r3 == temp_r0) {
                return &arg0->unk18C[i];
            }
        }
    }
    return NULL;
}

void ov44_02232204(UnkStruct_ov44_02232DA0* arg0, s32 arg1, s32 arg2) {
    arg0->unk6EC = ov42_02228F24(arg0->unk14.unk0, 0, 48, arg1, 0, 1, arg2);
    ov42_02229028(arg0->unk6EC, 2, arg2);
}

void ov44_02232238(UnkStruct_ov44_02232DA0* arg0) {
    ov42_02228F94(arg0->unk6EC);
}

void ov44_02232248(UnkStruct_ov44_02232DA0* arg0, s32 arg1, NARC* arg2, s32 arg3) {
    u32 index = 0;
    u8 sp0[11];
    sp0 = ov44_02235604;
    
    sp0[9] += arg3;
    arg0->unk6F4 = ov42_022293B8(&arg0->unk14.unk4, arg0->unk10, &sp0, arg1);
}

void ov44_02232288(UnkStruct_ov44_02232DA0* arg0) {
    ov42_0222940C(arg0->unk6F4);
}

void ov44_02232298(UnkStruct_ov44_02231A7C* arg0, enum HeapID heapID, NARC* narc) {
    arg0->unk0 = G2dRenderer_Init(96, &arg0->unk4, heapID);
    G2dRenderer_SetSubSurfaceCoords(&arg0->unk4, 0, 0x320000);
    for (s32 i = 0; i < 4; i ++) {
        arg0->unk12C[i] = Create2DGfxResObjMan(16, (GfGfxResType)i, heapID);
    }
    ov44_02232314(arg0, heapID, narc);
    ov44_02232324(arg0, heapID);
}

void ov44_022322E8(UnkStruct_ov44_02231A7C* arg0) {
    ov44_0223232C(arg0);
    ov44_0223231C(arg0);
    for (s32 i = 0; i < 4; i ++) {
        Destroy2DGfxResObjMan(arg0->unk12C[i]);
    }
    SpriteList_Delete(arg0->unk0);
}

void ov44_02232314(UnkStruct_ov44_02231A7C* arg0, enum HeapID heapID , NARC* narc) {
    ov44_0223237C(arg0, heapID, narc);
}

void ov44_0223231C(UnkStruct_ov44_02231A7C* arg0) {
    ov44_0223247C(arg0);
}

void ov44_02232324(UnkStruct_ov44_02231A7C* arg1, enum HeapID heapID) {
    ov44_022324B0(arg1, heapID);
}

void ov44_0223232C(UnkStruct_ov44_02231A7C* arg0) {
    ov44_02232530(arg0);
}

void ov44_02232334(BgConfig* arg0, enum HeapID heapID) {

}

void ov44_02232338(BgConfig* arg0) {

}

void ov44_0223233C(BgConfig *bgConfig, enum HeapID heapID, NARC* narc) {
    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 31, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 256, heapID);
    BG_SetMaskColor(0, 0);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 30, bgConfig, GF_BG_LYR_MAIN_0, 0, 0, 0, heapID);
}

void ov44_0223237C(UnkStruct_ov44_02231A7C* arg0, enum HeapID heapID, NARC* narc) {
    arg0->unk13C[0] = AddCharResObjFromOpenNarc(arg0->unk12C[0], narc, NARC_a_0_3_8, FALSE, 50, NNS_G2D_VRAM_TYPE_2DMAIN, heapID);
    arg0->unk13C[1] = AddPlttResObjFromOpenNarc(arg0->unk12C[1], narc, NARC_fielddata_encountdata_g_enc_data, FALSE, 50, NNS_G2D_VRAM_TYPE_2DMAIN, 1, heapID);
    arg0->unk13C[2] = AddCellOrAnimResObjFromOpenNarc(arg0->unk12C[2], narc, NARC_a_0_3_9, FALSE, 50, GF_GFX_RES_TYPE_CELL, heapID);
    arg0->unk13C[3] = AddCellOrAnimResObjFromOpenNarc(arg0->unk12C[3], narc, NARC_a_0_4_0, FALSE, 50, GF_GFX_RES_TYPE_ANIM, heapID);
    if (sub_0200ADA4(arg0->unk13C[0]) != 1) {
        GF_AssertFail();
    }
    if (sub_0200B00C(arg0->unk13C[1]) != 1) {
        GF_AssertFail();
    }
    sub_0200A740(arg0->unk13C[0]);
    sub_0200A740(arg0->unk13C[1]);
    CreateSpriteResourcesHeader(&arg0->unk14C, 50, 50, 50, 50, -1, -1, 0, 2, arg0->unk12C[0], arg0->unk12C[1], arg0->unk12C[2], arg0->unk12C[3], 0, 0);
}

void ov44_0223247C(UnkStruct_ov44_02231A7C* arg0) {
    sub_0200AEB0(arg0->unk13C[0]);
    sub_0200B0A8(arg0->unk13C[1]);
    for (s32 i = 0; i < 4; i ++) {
        DestroySingle2DGfxResObj(arg0->unk12C[i], arg0->unk13C[i]);
    }
}

void ov44_022324B0(UnkStruct_ov44_02231A7C* arg0, enum HeapID heapID) {
    SpriteTemplate spriteTemplate = {};
    spriteTemplate.spriteList = arg0->unk0;
    spriteTemplate.header = &arg0->unk14C;
    
    spriteTemplate.whichScreen = NNS_G2D_VRAM_TYPE_2DMAIN;

    spriteTemplate.scale.x = 4096;
    spriteTemplate.scale.y = 4096;
    spriteTemplate.heapID = heapID;
    
    spriteTemplate.drawPriority = 0;
    
    arg0->unk170 = Sprite_CreateAffine(&spriteTemplate);
    arg0->unk174 = Sprite_CreateAffine(&spriteTemplate);
    Sprite_SetDrawFlag(arg0->unk170, 0);
    Sprite_SetDrawFlag(arg0->unk174, 0);
    Sprite_SetAnimActiveFlag(arg0->unk170, 1);
    Sprite_SetAnimCtrlSeq(arg0->unk174, 1);
}

void ov44_02232530(UnkStruct_ov44_02231A7C* arg0) {
    Sprite_Delete(arg0->unk170);
    Sprite_Delete(arg0->unk174);
}

void ov44_0223254C(UnkStruct_ov44_02232DA0* arg0) {
    VecFx32 vec;
    s16 sp0[2];
    
    ov44_02232724(arg0, sp0);
    sp0[0] = sp0[0] + 8;
    sp0[1] = sp0[1] + 32;
    vec.x = sp0[0] << 12;
    vec.y = sp0[1] << 12;
    Sprite_SetMatrix(arg0->unk14.unk170, &vec);
    Sprite_SetDrawFlag(arg0->unk14.unk170, 1);
}

void ov44_02232594(UnkStruct_ov44_02232DA0* arg0) {
    Sprite_SetDrawFlag(arg0->unk14.unk170, 0);
}

void ov44_022325A4(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232914 arg1, s32 arg2) {
    VecFx32 vec;
    vec.x = (s16)arg1.unk0 + 8 << 16 >> 4;
    vec.y = (s16)(arg1.unk2) * 4096;
    Sprite_SetMatrix(arg0->unk14.unk174, &vec);
    Sprite_SetDrawPriority(arg0->unk14.unk174, arg2);
    Sprite_SetDrawFlag(arg0->unk14.unk174, 1);
}

void ov44_022325F4(UnkStruct_ov44_02232DA0* arg0) {
    Sprite_SetDrawFlag(arg0->unk14.unk174, 0);
}

s32 ov44_02232604(UnkStruct_ov44_02232DA0* arg0) {
    if (arg0->unk6CC == 0) {
        return 0;
    }
    u32 temp_r0_2 = ov42_022282DC(arg0->unk6CC->unk0);
    
    s16 sp4[2];
    sp4 = (s16[2]){temp_r0_2, temp_r0_2 >> 16};
    
    u16 temp_r4 = ov42_02228188(arg0->unk6CC->unk0, 6);
    if (ov42_02227FDC(arg0->unk6E4, sp4[0] / 16, sp4[1] / 16) == 0xF && temp_r4 == 1) {
        return 1;
    }
    return 0;
}

void ov44_02232680(UnkStruct_ov44_02232DA0* arg0, u16* arg1, u32 arg2) {
    u32 r7 = arg2 / 8;
    u32 r4 = arg2 % 8;
    u16 r6 = ov42_02227F40(arg0->unk6E4);
    u16 sp4 = ov42_02227F44(arg0->unk6E4);
    
    for (u32 i = 0; i < sp4; i++) {
        for (u32 j = 0; j < r6; j++) {
            s32 temp_r0 = ov42_02227FDC(arg0->unk6E4, j, i);  
            if (temp_r0 == r4 + 7) {
                temp_r0 = ov42_02227FDC(arg0->unk6E4, j, i + 1);
                if (temp_r0 == r7 + 3) {
                    arg1[0] = j << 4;
                    arg1[1] = i << 4;
                    return;
                }
            }
        }
    }
    GF_AssertFail();
}

void ov44_02232724(UnkStruct_ov44_02232DA0* arg0, s16* arg1) {
    u16 temp_r5 = ov42_02227F40(arg0->unk6E4);
    u16 temp_r0 = ov42_02227F44(arg0->unk6E4);

    for (u32 i = 0; i < temp_r0; i++) {
        for (u32 j = 0; j < temp_r5; j++) {
             if (ov42_02227FDC(arg0->unk6E4, j, i) == 15) {
                arg1[0] = j << 4;
                arg1[1] = i << 4;
                return;
            }   
        }
    }
    GF_AssertFail();
}

UnkStruct_ov44_02232B74* ov44_02232798(UnkStruct_ov44_02232DA0* arg0) {
    for (s32 i = 0; i < 48; i++) {
        if (arg0->unk18C[i].unk0 == 0) {
            return &arg0->unk18C[i];
        }
    }
    GF_AssertFail();
    return NULL;
}

void ov44_022327C8(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1, s32 arg2) {
    arg1->unk4 = ov42_0222903C(arg0->unk6EC, arg1->unk0, arg2, arg0->unk4);
    if (arg2 == 0) {
        ov42_0222919C(arg1->unk4, 0);
        ov42_022291A0(arg1->unk4);
        ov42_02229200(arg1->unk4, 0);
    }
}

void ov44_02232800(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1, s16* arg2, s16 arg3, u16 arg4, u8 arg5, s32 arg6) {
    u16 sp[6];
    sp[0] = arg2[0];
    sp[1] = arg2[1];
    sp[2] = arg3;
    sp[3] = arg6;
    sp[4] = arg5;
    sp[5] = arg4;
    arg1->unk0 = ov42_022280B8(arg0->unk6E8, sp);
}

s32 ov44_02232838(UnkStruct_ov44_02232B74* arg0) {
    switch (arg0->unkC) {
    case 0:
    case 3:
    case 4:
        return 1;
    case 1:
    case 2:
    case 5:
        return 0;
    default:
        return 0;
    }
}

void ov44_02232864(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    arg1->unk10 = ov44_02232A60;
    arg1->unk18 = ov44_02232910;
    arg1->unkC = 0;
    ov44_02232C6C(arg0, 0, arg1);
}

void ov44_02232884(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    arg1->unk10 = ov44_02232B74;
    arg1->unk18 = ov44_02232914;
    arg1->unk8 = 45;
    arg1->unkC = 1;
}

void ov44_022328A0(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    arg1->unk10 = ov44_02232BE4;
    arg1->unk18 = ov44_02232910;
    arg1->unk8 = (1023 & MTRandom()) + 256;
    arg1->unkC = 3;
    ov44_02232C6C(arg0, 0, arg1);
    ov42_0222919C(arg1->unk4, 1);
}

void ov44_022328E4(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    arg1->unk10 = ov44_02232C30;
    arg1->unk18 = ov44_022329B0;
    arg1->unk8 = 28;
    arg1->unkC = 4;
    ov44_02232C6C(arg0, 4, arg1);
    ov42_0222919C(arg1->unk4, 0);
}

void ov44_02232910(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {

}

void ov44_02232914(UnkStruct_ov44_02232DA0 *arg0, UnkStruct_ov44_02232B74* arg1) {
    ov42_022291AC(arg1->unk4);
    if (ov42_022291F4(arg1->unk4) == 0) {
        ov42_02229200(arg1->unk4, 1);
    }
    UnkStruct_ov44_02232914 sp0 = {ov42_02228188(arg1->unk0, 0), ov42_02228188(arg1->unk0, 1)};
    UnkStruct_ov44_02232914 sp4 = sp0;
    
    s64 temp_ret = (s64)GF_SinDegNoWrap(arg1->unk8) * (signed)0xFFF40000;
    temp_ret += 2048;
    
    s32 r1 = (temp_ret >> 12);
    sp0.unk2 = (s16)sp0.unk2 + (r1 >> 12);

    ov42_022291D8(arg1->unk4, sp0);
    ov42_02229258(arg1->unk4, sp4);
}

void ov44_022329B0(UnkStruct_ov44_02232DA0 *arg0, UnkStruct_ov44_02232B74* arg1) {
    UnkStruct_ov44_02232914 sp0 = {ov42_02228188(arg1->unk0, 0), ov42_02228188(arg1->unk0, 1)};
    UnkStruct_ov44_02232914 sp4 = sp0;
    
    s16 temp_r0 = arg1->unk8 - 16;
    if (temp_r0 > 0) {
        s32 temp_r0_2 = (s16)(temp_r0 % 6)* 180;
        s32 temp_r0_3 = GF_SinDegNoWrap(temp_r0_2 / 6);
        
        s64 r6 = ((s64)temp_r0_3 << 14) + 2048;
        sp0.unk2 = (s16)sp0.unk2 - ((s32)(r6 >> 12) >> 12);
    }
    ov42_022291D8(arg1->unk4, sp0);
    ov42_02229258(arg1->unk4, sp4);
    
    ov42_02229218(arg1->unk4, 1);
}

s32 ov44_02232A60(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    u16 temp_r4 = ov42_02228188(arg1->unk0, 6);
    u16 temp_r7 = ov42_02228188(arg1->unk0, 4);
    if (ov42_02228188(arg1->unk0, 5) != 0) {
        return 0;
    }
    if (1 & gSystem.newKeys) {
        UnkStruct_ov44_02232B74* temp_r0 = ov44_022321C4(arg0, arg1, temp_r4);
        if (temp_r0 != NULL) {
            if (ov44_02232838(temp_r0) == 1) {
                arg1->unkA = ov42_02228188(temp_r0->unk0, 4);
            } else {
                arg1->unkA = 0;
            }
        } else {
            arg1->unkA = 0;
        }
    }
    if (arg0->unkC == 1) {
        return 0;
    }
    s16 var_r1 = 2;
    if (gSystem.heldKeys & 2) {
        var_r1 = 3;
    }
    if (64 & gSystem.heldKeys) {
        if (temp_r4 == 0) {
            ov44_02232C4C(arg0, var_r1, temp_r4, temp_r7);
        } else {
            ov44_02232C4C(arg0, 1, 0, temp_r7);
        }
    } else if (128 & gSystem.heldKeys) {
        if (temp_r4 == 1) {
            ov44_02232C4C(arg0, var_r1, temp_r4, temp_r7);
        } else {
            ov44_02232C4C(arg0, 1, 1, temp_r7);
        }
    } else if (32 & gSystem.heldKeys) {
        if (temp_r4 == 2) {
            ov44_02232C4C(arg0, var_r1, temp_r4, temp_r7);
        } else {
            ov44_02232C4C(arg0, 1, 2, temp_r7);
        }
    } else if (gSystem.heldKeys & 16) {
        if (temp_r4 == 3) {
            ov44_02232C4C(arg0, var_r1, temp_r4, temp_r7);
        } else {
            ov44_02232C4C(arg0, 1, 3, temp_r7);
        }
    }
    return 0;
}

s32 ov44_02232B74(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    arg1->unk8--;
    if (arg1->unk8 <= 0) {
        ov42_022291B8(arg1->unk4);
        ov42_0222919C(arg1->unk4, 1);
        u16 temp_r6 = ov42_02228188(arg0->unk6CC->unk0, 4);
        u16 temp_r0 = ov42_02228188(arg1->unk0, 4);
        if (temp_r0 == temp_r6) {
            ov44_02232864(arg0, arg1);
        } else {
            ov44_02232CA8(arg0, arg1, arg1->unkB);
        }
    }
    return 0;
}

s32 ov44_02232BCC(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    arg1->unk8++;
    if (arg1->unk8 > 45) {
        return 1;
    }
    return 0;
}

s32 ov44_02232BE4(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    arg1->unk8--;
    if (arg1->unk8 <= 0) {
        arg1->unk8 =  (1023 & MTRandom()) + 256;
        u32 temp_r4 = MTRandom() & 3;
        ov44_02232C4C(arg0, 0, temp_r4, ov42_02228188(arg1->unk0, 4));
    }
    return 0;
}

s32 ov44_02232C30(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    arg1->unk8--;
    if (arg1->unk8 < 0) {
        arg1->unk8 = 28;
    }
    return 0;
}

s32 ov44_02232C48(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    return 0;
}

void ov44_02232C4C(UnkStruct_ov44_02232DA0* arg0, s16 arg1, u32 arg2, u16 arg3) {
    UnkStruct_ov44_02232C4C temp;
    temp.unk0 = arg1;
    temp.unk2 = arg2;
    temp.unk3 = arg3;
    
    ov42_02229A8C(arg0->unk6F8, &temp);
}

void ov44_02232C6C(UnkStruct_ov44_02232DA0* arg0, s16 arg1, UnkStruct_ov44_02232B74* arg2) {
    u16 temp_r7 = ov42_02228188(arg2->unk0, 6);
    ov44_02232C4C(arg0, arg1, temp_r7, ov42_02228188(arg2->unk0, 4));
}

s32 ov44_02232C94(UnkStruct_ov44_02232B74* arg0) {
    if (arg0->unk18 != ov44_02232914) {
        return 1;
    }
    return 0;
}

void ov44_02232CA8(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1, u8 arg2) {
    switch (arg2) {
    case 0:
        ov44_022328A0(arg0, arg1);
        break;
    case 1:
        ov44_022328E4(arg0, arg1);
        break;
    default:
        GF_AssertFail();
        break;
    }
    arg1->unkB = arg2;
}

void ov44_02232CCC(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232E80* arg1, NARC* arg2) {
    __builtin__clear(arg1, sizeof(UnkStruct_ov44_02232E80));
    arg1->unk0 = GfGfxLoader_GetPlttDataFromOpenNarc(arg2, 32, &arg1->unk4, arg0->unk4);
    arg1->unk8 = 15;
    arg1->unk9 = 0;
    arg1->unkA = ov44_02235600[arg1->unk9];
}

void ov44_02232D08(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232E80* arg1) {
    Heap_Free(arg1->unk0);
     __builtin__clear(arg1, sizeof(UnkStruct_ov44_02232E80));
}

void ov44_02232D20(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232E80* arg1) {
    ov44_02232D34(arg1);
    ov44_02232DA0(arg1);
}

void ov44_02232D34(UnkStruct_ov44_02232E80* arg0) {
    s32 var_r6;

    arg0->unkA--;
    if (arg0->unkA <= 0) {
        arg0->unk9 = (arg0->unk9 + 1) % 2;
        arg0->unkA = ov44_02235600[arg0->unk9];
        if (arg0->unk9 == 1) {
            var_r6 = 2;
        } else {
            var_r6 = 1;
        }
        for (s32 i = 0; i < 4; i ++) {
            if (arg0->unk8 & (1 << i)) {
                GF_CreateNewVramTransferTask(NNS_GFD_DST_2D_BG_PLTT_MAIN, ((i + 1) * 2) + 224, ov44_02232E2C(arg0, var_r6), 2);
            }
        }
    }
}

void ov44_02232DA0(UnkStruct_ov44_02232E80* arg0) {
    u32 r0 = 0;
    u32 r1 = 0;
    u32 r2 = 0;
    if (ov44_0223560F[arg0->unkD << 2] == 1) {
        arg0->unkE--;
        if (arg0->unkE <= 0) {
            r2 = 1;    
        }
    }
    else if (arg0->unk10 != 0) {
        arg0->unk10 = 0;
        r2 = 1;
    }
    if (r2 != 0) {
        arg0->unkD++;
        if (arg0->unkD >= 8) {
            ov44_02232E38(arg0);
            return;
        }
        arg0->unkE = ov44_02235610[arg0->unkD << 2];
        r0 = ov44_02235611[arg0->unkD << 2];
        r1 = ov44_02235612[arg0->unkD << 2];
    }
    if (r0 != 0) {
        GF_CreateNewVramTransferTask(NNS_GFD_DST_2D_BG_PLTT_MAIN, ((arg0->unkC + 1)* 2) + 224, ov44_02232E2C(arg0, r1), 2);
    }
}

void* ov44_02232E2C(UnkStruct_ov44_02232E80* arg0, s32 arg1) {
    return arg0->unk4->pRawData + (arg1 + 1) * 2;
}

void ov44_02232E38(UnkStruct_ov44_02232E80* arg0) {
    arg0->unk8 = (arg0->unk8 | (1 << arg0->unkC));
    arg0->unkC = 0;
    arg0->unkD = 0;
    arg0->unkE = 0;
    arg0->unk10 = 0;
}

void ov44_02232E54(UnkStruct_ov44_02232E80* arg0) {
    arg0->unk10 = 1;
}

void ov44_02232E5C(UnkStruct_ov44_02232E80* arg0, u8 arg1) {
    if (arg0->unkD != 0) {
        ov44_02232E38(arg0);
    }
    arg0->unk8 = arg0->unk8 ^ (1 << arg1);
    arg0->unkC = arg1;
    ov44_02232E54(arg0);
}

void ov44_02232E80(UnkStruct_ov44_02232E80* arg0) {
    if (arg0->unkD != 0) {
        ov44_02232E54(arg0);
    }
}

s32 ov44_02232E90(s32 arg0) {
    return ov44_02235630[arg0];
}

s32 ov44_02232E9C(u32 arg0) {
    return ov44_0223688C[arg0];
}