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

// extern FS_OVERLAY_ID_OVY_42;
extern u16 ov44_02235600[];
extern u8 ov44_02235604[11];
extern u32 ov44_02235630[];
extern u32 ov44_0223688C[];

extern u8 ov44_0223560F[];
extern u8 ov44_02235610[];
extern u8 ov44_02235611[];
extern u8 ov44_02235612[];

void ov44_02232248(UnkStruct_ov44_02232DA0* arg0, s32 arg1, s32 arg2, s32 arg3) {
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
    arg0->unk0 = G2dRenderer_Init(0x60, &arg0->unk4, heapID);
    G2dRenderer_SetSubSurfaceCoords(&arg0->unk4, 0, 0x320000);
    for (s32 i = 0; i < 4; i ++) {
        arg0->unk12C[i] = Create2DGfxResObjMan(0x10, (GfGfxResType)i, heapID);
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

void ov44_02232334(void) {

}

void ov44_02232338(void) {

}

void ov44_0223233C(BgConfig *bgConfig, enum HeapID heapID, NARC* narc) {
    GfGfxLoader_GXLoadPalFromOpenNarc(narc, 0x1F, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0x100, heapID);
    BG_SetMaskColor(0, 0);
    GfGfxLoader_LoadCharDataFromOpenNarc(narc, 0x1E, bgConfig, GF_BG_LYR_MAIN_0, 0, 0, 0, heapID);
}

void ov44_0223237C(UnkStruct_ov44_02231A7C* arg0, enum HeapID heapID, NARC* narc) {
    arg0->unk13C[0] = AddCharResObjFromOpenNarc(arg0->unk12C[0], narc, 0x26, 0, 0x32, 1, heapID);
    arg0->unk13C[1] = AddPlttResObjFromOpenNarc(arg0->unk12C[1], narc, 0x25, 0, 0x32, 1, 1, heapID);
    arg0->unk13C[2] = AddCellOrAnimResObjFromOpenNarc(arg0->unk12C[2], narc, 0x27, 0, 0x32, GF_GFX_RES_TYPE_CELL, heapID);
    arg0->unk13C[3] = AddCellOrAnimResObjFromOpenNarc(arg0->unk12C[3], narc, 0x28, 0, 0x32, GF_GFX_RES_TYPE_ANIM, heapID);
    if (sub_0200ADA4(arg0->unk13C[0]) != 1) {
        GF_AssertFail();
    }
    if (sub_0200B00C(arg0->unk13C[1]) != 1) {
        GF_AssertFail();
    }
    sub_0200A740(arg0->unk13C[0]);
    sub_0200A740(arg0->unk13C[1]);
    CreateSpriteResourcesHeader(&arg0->unk14C, 0x32, 0x32, 0x32, 0x32, -1, -1, 0, 2, arg0->unk12C[0], arg0->unk12C[1], arg0->unk12C[2], arg0->unk12C[3], 0, 0);
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

    spriteTemplate.scale.x = 0x1000;
    spriteTemplate.scale.y = 0x1000;
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
    sp0[1] = sp0[1] + 0x20;
    vec.x = sp0[0] << 0xC;
    vec.y = sp0[1] << 0xC;
    Sprite_SetMatrix(arg0->unk14.unk170, &vec);
    Sprite_SetDrawFlag(arg0->unk14.unk170, 1);
}

void ov44_02232594(UnkStruct_ov44_02232DA0* arg0) {
    Sprite_SetDrawFlag(arg0->unk14.unk170, 0);
}

void ov44_022325A4(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232914 arg1, s32 arg2) {
    VecFx32 vec;
    vec.x = (s16)arg1.unk0 + 8 << 0x10 >> 0x4;
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
    
    UnkStruct_ov44_02232724 sp4;
    sp4 = (UnkStruct_ov44_02232724){temp_r0_2, temp_r0_2 >> 16};
    
    u16 temp_r4 = ov42_02228188(arg0->unk6CC->unk0, 6);
    if (ov42_02227FDC(arg0->unk6E4, sp4.unk0 / 16, sp4.unk2 / 16) == 0xF && temp_r4 == 1) {
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
             if (ov42_02227FDC(arg0->unk6E4, j, i) == 0xF) {
                arg1[0] = j << 4;
                arg1[1] = i << 4;
                return;
            }   
        }
    }
    GF_AssertFail();
}

UnkStruct_ov44_02232B74* ov44_02232798(UnkStruct_ov44_02232DA0* arg0) {
    for (s32 i = 0; i < 0x30; i++) {
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
    arg1->unk8 = 0x2D;
    arg1->unkC = 1;
}

void ov44_022328A0(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    arg1->unk10 = ov44_02232BE4;
    arg1->unk18 = ov44_02232910;
    arg1->unk8 = (0x3FF & MTRandom()) + 0x100;
    arg1->unkC = 3;
    ov44_02232C6C(arg0, 0, arg1);
    ov42_0222919C(arg1->unk4, 1);
}

void ov44_022328E4(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    arg1->unk10 = ov44_02232C30;
    arg1->unk18 = ov44_022329B0;
    arg1->unk8 = 0x1C;
    arg1->unkC = 4;
    ov44_02232C6C(arg0, 4, arg1);
    ov42_0222919C(arg1->unk4, 0);
}

void ov44_02232910(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {

}

void ov44_02232914(UnkStruct_ov44_02232DA0 *arg0, UnkStruct_ov44_02232B74* arg1) {
    UnkStruct_ov44_02232914 sp0[2];

    ov42_022291AC(arg1->unk4);
    if (ov42_022291F4(arg1->unk4) == 0) {
        ov42_02229200(arg1->unk4, 1);
    }
    sp0[1].unk0 = ov42_02228188(arg1->unk0, 0);
    sp0[1].unk2 = ov42_02228188(arg1->unk0, 1);
    sp0[0].unk0 = sp0[1].unk0;
    sp0[0].unk2 = sp0[1].unk2;
    
    s64 temp_ret = (s64)GF_SinDegNoWrap(arg1->unk8) * (signed)0xFFF40000;
    temp_ret += 0x800;
    
    s32 r1 = (temp_ret >> 0xC);
    sp0[1].unk2 = (s16)sp0[1].unk2 + (r1 >> 0xC);

    ov42_022291D8(arg1->unk4, sp0[1]);
    ov42_02229258(arg1->unk4, sp0[0]);
}

void ov44_022329B0(UnkStruct_ov44_02232DA0 *arg0, UnkStruct_ov44_02232B74* arg1) {
    UnkStruct_ov44_02232914 sp0[2];
    
    sp0[1].unk0 = ov42_02228188(arg1->unk0, 0);
    sp0[1].unk2 = ov42_02228188(arg1->unk0, 1);
    sp0[0].unk0 = sp0[1].unk0;
    sp0[0].unk2 = sp0[1].unk2;
    
    s16 temp_r0 = arg1->unk8 - 0x10;
    if (temp_r0 > 0) {
        s32 temp_r0_2 = (s16)(temp_r0 % 6) * 180;
        s32 temp_r0_3 = GF_SinDegNoWrap(temp_r0_2 / 6);
        
        s64 r6 = ((s64)temp_r0_3 << 0xE) + 0x800;
        sp0[1].unk2 = (s16)sp0[1].unk2 - ((s32)(r6 >> 0xC) >> 0xC);
    }
    ov42_022291D8(arg1->unk4, sp0[1]);
    ov42_02229258(arg1->unk4, sp0[0]);
    
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
    if (0x40 & gSystem.heldKeys) {
        if (temp_r4 == 0) {
            ov44_02232C4C(arg0, var_r1, temp_r4, temp_r7);
        } else {
            ov44_02232C4C(arg0, 1, 0, temp_r7);
        }
    } else if (0x80 & gSystem.heldKeys) {
        if (temp_r4 == 1) {
            ov44_02232C4C(arg0, var_r1, temp_r4, temp_r7);
        } else {
            ov44_02232C4C(arg0, 1, 1, temp_r7);
        }
    } else if (0x20 & gSystem.heldKeys) {
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
    if (arg1->unk8 > 0x2D) {
        return 1;
    }
    return 0;
}

s32 ov44_02232BE4(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    arg1->unk8--;
    if (arg1->unk8 <= 0) {
        arg1->unk8 =  (0x3FF & MTRandom()) + 0x100;
        u32 temp_r4 = MTRandom() & 3;
        ov44_02232C4C(arg0, 0, temp_r4, ov42_02228188(arg1->unk0, 4));
    }
    return 0;
}

s32 ov44_02232C30(UnkStruct_ov44_02232DA0* arg0, UnkStruct_ov44_02232B74* arg1) {
    arg1->unk8--;
    if (arg1->unk8 < 0) {
        arg1->unk8 = 0x1C;
    }
    return 0;
}

s32 ov44_02232C48(void) {
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
    arg1->unk0 = GfGfxLoader_GetPlttDataFromOpenNarc(arg2, 0x20, &arg1->unk4, arg0->unk4);
    arg1->unk8 = 0xF;
    arg1->unk9 = 0;
    arg1->unkA = ov44_02235600[arg1->unk9];
}

void ov44_02232D08(s32 arg0, UnkStruct_ov44_02232E80* arg1) {
    Heap_Free(arg1->unk0);
     __builtin__clear(arg1, sizeof(UnkStruct_ov44_02232E80));
}

void ov44_02232D20(u32 arg0, UnkStruct_ov44_02232E80* arg1) {
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
                GF_CreateNewVramTransferTask(NNS_GFD_DST_2D_BG_PLTT_MAIN, ((i + 1) * 2) + 0xE0, ov44_02232E2C(arg0, var_r6), 2);
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
        GF_CreateNewVramTransferTask(NNS_GFD_DST_2D_BG_PLTT_MAIN, ((arg0->unkC + 1)* 2) + 0xE0, ov44_02232E2C(arg0, r1), 2);
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

void ov44_02232E5C(UnkStruct_ov44_02232E80* arg0, s8 arg1) {
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

s32 ov44_02232E9C(s32 arg0) {
    return ov44_0223688C[arg0];
}