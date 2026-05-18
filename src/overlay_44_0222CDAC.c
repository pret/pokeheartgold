#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0778.h"
#include "msgdata/msg/msg_0800.h"

#include "bg_window.h"
#include "dwcaccount.h"
#include "font.h"
#include "gf_gfx_loader.h"
#include "gf_gfx_planes.h"
#include "msgdata.h"
#include "obj_pltt_transfer.h"
#include "overlay_00_thumb.h"
#include "overlay_44_02232E9C.h"
#include "party.h"
#include "pokedex.h"
#include "pokemon.h"
#include "render_text.h"
#include "render_window.h"
#include "save_frontier.h"
#include "save_wifi_history.h"
#include "sound.h"
#include "sound_02004A44.h"
#include "sys_flags.h"
#include "system.h"
#include "text.h"
#include "touch_hitbox_controller.h"
#include "unk_02005D10.h"
#include "unk_0200A090.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_02013534.h"
#include "unk_020210A0.h"
#include "unk_0202C034.h"
#include "unk_02030A98.h"
#include "unk_0203170C.h"
#include "unk_02034354.h"
#include "unk_02034B0C.h"
#include "unk_02035900.h"
#include "unk_020379A0.h"
#include "unk_02037C94.h"
#include "unk_0203A3B0.h"
#include "unk_020915B0.h"
#include "unk_020971F8.h"
#include "vram_transfer_manager.h"

static const u8 ov44_02235360[4] = { 0, 2, 4, 0 };
static const u8 ov44_02235364[4] = { 8, 7, 5, 7 };
static const u8 ov44_02235368[4] = { 0, 1, 2, 1 };
static const u8 _0223535C[4] = { 1, 3, 5, 0 };
static const s8 ov44_0223536C[8] = { 248, 247, 246, 246, 247, 0, 0, 0 };

static const WindowTemplate ov44_02235384 = {
    .bgId = 1,
    .left = 25,
    .top = 16,
    .width = 6,
    .height = 8,
    .palette = 14,
    .baseTile = 393,
};
static const WindowTemplate ov44_02235374 = {
    .bgId = 2,
    .left = 25,
    .top = 10,
    .width = 6,
    .height = 8,
    .palette = 14,
    .baseTile = 81,
};
static const WindowTemplate ov44_0223537C = {
    .bgId = 2,
    .left = 25,
    .top = 10,
    .width = 6,
    .height = 8,
    .palette = 14,
    .baseTile = 81,
};
static const WindowTemplate ov44_0223538C = {
    .bgId = 2,
    .left = 25,
    .top = 13,
    .width = 6,
    .height = 4,
    .palette = 13,
    .baseTile = 81,
};
static const TouchscreenHitbox ov44_02235394[3] = {
    { .rect = { .top = 160, .bottom = 192, .left = 8, .right = 64 } },
    { .rect = { .top = 160, .bottom = 192, .left = 80, .right = 176 } },
    { .rect = { .top = 160, .bottom = 192, .left = 192, .right = 248 } },
};
static const UnkStruct_ov44_0222DD64 ov44_022353A0[2] = {
    { .strno = 39, .value = 1          },
    { .strno = 41, .value = 0xFFFFFFFE },
};
static const GraphicsModes ov44_022353B0 = {
    .dispMode = GX_DISPMODE_GRAPHICS,
    .bgMode = GX_BGMODE_0,
    .subMode = GX_BGMODE_0,
    ._2d3dMode = GX_BG0_AS_2D,
};
static const ObjCharTransferTemplate ov44_022353C0 = {
    .maxTasks = 20,
    .sizeMain = 0x20000,
    .sizeSub = 0x4000,
    .heapID = HEAP_ID_53,
};
static const u32 ov44_022353D0[6] = { 100, 102, 104, 108, 106, 110 };

static const BgTemplate ov44_022353E8 = {
    .x = 0,
    .y = 0,
    .bufferSize = 4096,
    .baseTile = 0,
    .size = 3,
    .colorMode = 0,
    .screenBase = 28,
    .charBase = 0,
    .bgExtPltt = 0,
    .priority = 0,
    .areaOver = 0,
    .dummy = 0,
    .mosaic = 0,
};
static const BgTemplate ov44_02235420 = {
    .x = 0,
    .y = 0,
    .bufferSize = 2048,
    .baseTile = 0,
    .size = 1,
    .colorMode = 0,
    .screenBase = 30,
    .charBase = 6,
    .bgExtPltt = 1,
    .priority = 3,
    .areaOver = 0,
    .dummy = 0,
    .mosaic = 0,
};
static const BgTemplate ov44_0223543C = {
    .x = 0,
    .y = 0,
    .bufferSize = 2048,
    .baseTile = 0,
    .size = 1,
    .colorMode = 0,
    .screenBase = 28,
    .charBase = 0,
    .bgExtPltt = 0,
    .priority = 3,
    .areaOver = 0,
    .dummy = 0,
    .mosaic = 0,
};
static const BgTemplate ov44_02235458 = {
    .x = 0,
    .y = 0,
    .bufferSize = 2048,
    .baseTile = 0,
    .size = 1,
    .colorMode = 0,
    .screenBase = 29,
    .charBase = 2,
    .bgExtPltt = 0,
    .priority = 0,
    .areaOver = 0,
    .dummy = 0,
    .mosaic = 0,
};
static const BgTemplate ov44_02235474 = {
    .x = 0,
    .y = 0,
    .bufferSize = 2048,
    .baseTile = 0,
    .size = 1,
    .colorMode = 0,
    .screenBase = 30,
    .charBase = 4,
    .bgExtPltt = 0,
    .priority = 2,
    .areaOver = 0,
    .dummy = 0,
    .mosaic = 0,
};
static const BgTemplate ov44_02235490 = {
    .x = 0,
    .y = 0,
    .bufferSize = 2048,
    .baseTile = 0,
    .size = 1,
    .colorMode = 0,
    .screenBase = 27,
    .charBase = 2,
    .bgExtPltt = 1,
    .priority = 2,
    .areaOver = 0,
    .dummy = 0,
    .mosaic = 0,
};
static const BgTemplate ov44_022354AC = {
    .x = 0,
    .y = 0,
    .bufferSize = 2048,
    .baseTile = 0,
    .size = 1,
    .colorMode = 0,
    .screenBase = 31,
    .charBase = 6,
    .bgExtPltt = 0,
    .priority = 0,
    .areaOver = 0,
    .dummy = 0,
    .mosaic = 0,
};
static const BgTemplate ov44_02235404 = {
    .x = 0,
    .y = 0,
    .bufferSize = 2048,
    .baseTile = 0,
    .size = 1,
    .colorMode = 0,
    .screenBase = 26,
    .charBase = 4,
    .bgExtPltt = 0,
    .priority = 1,
    .areaOver = 0,
    .dummy = 0,
    .mosaic = 0,
};
static const ListMenuTemplate ov44_022354C8 = {
    .items = NULL,
    .moveCursorFunc = ov44_0222C288,
    .itemPrintFunc = NULL,
    .window = NULL,
    .totalItems = 2,
    .maxShowed = 2,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 1,
    .fillValue = 15,
    .cursorShadowPal = 2,
    .lettersSpacing = 0,
    .itemVerticalPadding = 0,
    .scrollMultiple = 0,
    .fontId = 0,
    .cursorKind = 0,
    .unk_1C = 0,
};
static const ListMenuTemplate ov44_02235508 = {
    .items = NULL,
    .moveCursorFunc = ov44_0222C288,
    .itemPrintFunc = NULL,
    .window = NULL,
    .totalItems = 4,
    .maxShowed = 4,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 1,
    .fillValue = 15,
    .cursorShadowPal = 2,
    .lettersSpacing = 0,
    .itemVerticalPadding = 0,
    .scrollMultiple = 0,
    .fontId = 0,
    .cursorKind = 0,
    .unk_1C = 0,
};
static const ListMenuTemplate ov44_02235528 = {
    .items = NULL,
    .moveCursorFunc = ov44_0222C288,
    .itemPrintFunc = NULL,
    .window = NULL,
    .totalItems = 4,
    .maxShowed = 4,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 1,
    .fillValue = 15,
    .cursorShadowPal = 2,
    .lettersSpacing = 0,
    .itemVerticalPadding = 0,
    .scrollMultiple = 0,
    .fontId = 0,
    .cursorKind = 0,
    .unk_1C = 0,
};
static const TouchscreenHitbox ov44_022354E8[8] = {
    { .rect = { .top = 0, .bottom = 47, .left = 0, .right = 119 } },
    { .rect = { .top = 48, .bottom = 95, .left = 0, .right = 119 } },
    { .rect = { .top = 96, .bottom = 143, .left = 0, .right = 119 } },
    { .rect = { .top = 144, .bottom = 191, .left = 0, .right = 119 } },
    { .rect = { .top = 0, .bottom = 47, .left = 128, .right = 255 } },
    { .rect = { .top = 48, .bottom = 95, .left = 128, .right = 255 } },
    { .rect = { .top = 96, .bottom = 143, .left = 128, .right = 255 } },
    { .rect = { .top = 144, .bottom = 191, .left = 128, .right = 255 } },
};
static const GraphicsBanks ov44_02235548 = {
    .bg = GX_VRAM_BG_128_A,
    .bgextpltt = GX_VRAM_BGEXTPLTT_NONE,
    .subbg = GX_VRAM_SUB_BG_128_C,
    .subbgextpltt = GX_VRAM_SUB_BGEXTPLTT_NONE,
    .obj = GX_VRAM_OBJ_128_B,
    .objextpltt = GX_VRAM_OBJEXTPLTT_NONE,
    .subobj = GX_VRAM_SUB_OBJ_16_I,
    .subobjextpltt = GX_VRAM_SUB_OBJEXTPLTT_NONE,
    .tex = GX_VRAM_TEX_NONE,
    .texpltt = GX_VRAM_TEXPLTT_NONE,
};
static const SpriteTemplate ov44_02235570[3] = {
    {
     .spriteList = NULL,
     .header = NULL,
     .position = { .x = 0x28000, .y = 0x1AC000, .z = 0 },
     .scale = { .x = 4096, .y = 4096, .z = 4096 },
     .rotation = 0,
     .drawPriority = 128,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .heapID = HEAP_ID_DEFAULT,
     },
    {
     .spriteList = NULL,
     .header = NULL,
     .position = { .x = 0x80000, .y = 0x1AC000, .z = 0 },
     .scale = { .x = 4096, .y = 4096, .z = 4096 },
     .rotation = 0,
     .drawPriority = 128,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .heapID = HEAP_ID_DEFAULT,
     },
    {
     .spriteList = NULL,
     .header = NULL,
     .position = { .x = 0xE0000, .y = 0x1AC000, .z = 0 },
     .scale = { .x = 4096, .y = 4096, .z = 4096 },
     .rotation = 0,
     .drawPriority = 128,
     .whichScreen = NNS_G2D_VRAM_TYPE_2DSUB,
     .heapID = HEAP_ID_DEFAULT,
     },
};

// UnkStruct_ov44_0222DD64 _02236660[4] = {
//     {.strno = 0x1E, .value = 0x13}, {.strno = 0x22, .value = 0x1D},
// 	{.strno = 0x29, .value = 0xFFFFFFFE}, {.strno = 0x20, .value = 0x15}
// };

// func_type_02236680 ov44_02236680[7] = {ov44_02230300, ov44_02230E5C, ov44_022307E0, ov44_022308B0, ov44_02230B2C, ov44_02230C68, ov44_02230D8C};

// ListMenuTemplate ov44_022366FC = {
//     .items = NULL,
//     .moveCursorFunc = ov44_0222C288,
//     .itemPrintFunc = NULL,
//     .window = NULL,
//     .totalItems = 3,
//     .maxShowed = 3,
//     .header_X = 0,
//     .item_X = 8,
//     .cursor_X = 0,
//     .upText_Y = 0,
//     .cursorPal = 1,
//     .fillValue = 0xF,
//     .cursorShadowPal = 2,
//     .lettersSpacing = 0,
//     .itemVerticalPadding = 0,
//     .scrollMultiple = 0,
//     .fontId = 0,
//     .cursorKind = 0,
//     .unk_1C = 0
// };

// UnkStruct_ov44_0222DD64 ov44_022366BC[4] = {
// 	{.strno = 0x5F, .value = 0x0B}, {.strno = 0x60, .value = 0x09},
//     {.strno = 0x61, .value = 0x0A}, {.strno = 0x29, .value = 0xFFFFFFFE}
// };
// UnkStruct_ov44_0222DD64 ov44_022366DC[4] = {
// 	{.strno = 0x62, .value = 0x0E}, {.strno = 0x63, .value = 0x0C},
//     {.strno = 0x64, .value = 0x0D}, {.strno = 0x29, .value = 0xFFFFFFFE}
// };
// UnkStruct_ov44_0222DD64 ov44_0223669C[4] = {
//     {.strno = 0x47, .value = 0x17}, {.strno = 0x47, .value = 0x19},
//     {.strno = 0x47, .value = 0x1B}, {.strno = 0x29, .value = 0xFFFFFFFE}
// };

// UnkStruct_ov44_0222DD64 ov44_0223671C[10] = {
//     {.strno = 0x5D, .value = 0x00}, {.strno = 0x5E, .value = 0x01},
//     {.strno = 0x1C, .value = 0x0F}, {.strno = 0x00, .value = 0x00},
//     {.strno = 0x00, .value = 0x00}, {.strno = 0x00, .value = 0x00},
//     {.strno = 0x00, .value = 0x00}, {.strno = 0x00, .value = 0x00},
//     {.strno = 0x00, .value = 0x00}, {.strno = 0x00, .value = 0x00}
// };
// func_type_0222A60C ov44_0223676C[72] = {
//     ov44_0222B228, ov44_0222B36C, ov44_0222B3A8, ov44_0222B42C, ov44_0222B494, ov44_0222B528, ov44_0222B64C, ov44_0222BA6C, ov44_0222BAB8, ov44_0222BAC4,
//     ov44_0222BAD0, ov44_0222BB38, ov44_0222BBA4, ov44_0222BC78, ov44_0222B744, ov44_0222BE3C, ov44_0222C060, ov44_0222C084, ov44_0222C35C, ov44_0222C684,
//     ov44_0222C9AC, ov44_0222C9F4, ov44_0222CB34, ov44_0222CB7C, ov44_0222CC34, ov44_0222CDAC, ov44_0222CE40, ov44_0222CFE0, ov44_0222D0A4, ov44_0222D10C,
//     ov44_0222D1BC, ov44_0222D1C0, ov44_0222D1C4, ov44_0222EB90, ov44_0222F4E0, ov44_0222D1C8, ov44_0222D3DC, ov44_0222D594, ov44_0222DA64, ov44_0222D214,
//     ov44_0222D23C, ov44_0222D2B0, ov44_0222DC18, ov44_0222DD64, ov44_0222E090, ov44_0222E45C, ov44_0222E62C, ov44_0222E630, ov44_0222E634, ov44_0222E860,
//     ov44_0222E908, ov44_0222E948, ov44_0222E9C4, ov44_0222EA2C, ov44_0222EBB8, ov44_0222EBC4, ov44_0222EC14, ov44_0222EC2C, ov44_0222EC98, ov44_0222EDB8,
//     ov44_0222EE10, ov44_0222EE54, ov44_0222EED4, ov44_0222F0AC, ov44_0222F194, ov44_0222BFF0, ov44_0222E5D8, ov44_0222E5DC, ov44_0222D824, ov44_0222BEE0,
//     ov44_0222E5E0, ov44_0222BF6C};

extern UnkStruct_ov44_0222DD64 _02236660[4];
extern func_type_02236680 ov44_02236680[7];
extern UnkStruct_ov44_0222DD64 ov44_0223669C[4];
extern UnkStruct_ov44_0222DD64 ov44_022366BC[4];
extern UnkStruct_ov44_0222DD64 ov44_022366DC[4];
extern ListMenuTemplate ov44_022366FC;
extern UnkStruct_ov44_0222DD64 ov44_0223671C[4];
extern func_type_0222A60C ov44_0223676C[20];

// static s32 _022368A0[8];

extern s32 _022368A0[8];
extern void *sub_02078D24;

FS_EXTERN_OVERLAY(OVY_42);

s32 ov44_02229EE0(UnkStruct_ov44_022319EC *arg0) {
    return Save_VarsFlags_FlypointFlagAction(Save_VarsFlags_Get(arg0->saveData), 2, 27);
}

s32 ov44_02229EF8(UnkStruct_ov44_022319EC *arg0) {
    return 0;
}

s32 ov44_02229EFC(UnkStruct_ov44_022319EC *arg0) {
    return 1;
}

u32 ov44_02229F00(UnkStruct_ov44_022319EC *arg0, UnkStruct_ov44_02231958 *arg1) {
    u32 var_r4 = arg1->unk1B;
    if ((var_r4 - 20 <= 1) && (ov44_02229EE0(arg0) == 0)) {
        var_r4 = 29;
    }
    if ((var_r4 - 22 <= 5) && (ov44_02229EFC(arg0) == 0)) {
        var_r4 = 29;
    }
    if ((var_r4 - 18 <= 1) && (ov44_02229EF8(arg0) == 0)) {
        var_r4 = 29;
    }
    return var_r4;
}

s32 ov44_02229F44(s32 arg0) {
    switch (arg0 - 18) {
    case 0:
    case 1:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
        return 1;
    default:
        return 0;
    }
}

u32 ov44_02229F74(u32 arg0) {
    switch (arg0 - 18) {
    case 0:
    case 1:
        return 11;
    case 4:
    case 5:
        return 13;
    case 8:
    case 9:
        return 15;
    case 6:
    case 7:
        return 14;
    default:
        GF_AssertFail();
        return 0;
    }
}

s32 ov44_02229FB4(u32 arg0) {
    switch (arg0 - 9) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
        return 1;
    default:
        return 0;
    }
}

s32 ov44_02229FDC(u32 arg0) {
    if (ov44_02229FB4(arg0) != 0) {
        return 1;
    }
    switch (arg0 - 15) {
    case 0:
    case 4:
    case 6:
    case 8:
    case 10:
    case 12:
        return 1;
    default:
        return 0;
    }
    return 0;
}

s32 ov44_0222A020(u32 arg0) {
    switch (arg0) {
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
        return 1;
    default:
        return 0;
    }
}

s32 ov44_0222A048(u16 arg0) {
    if (ov44_0222A020(arg0) != 0) {
        return 1;
    }
    switch (arg0) {
    case 1:
    case 8:
    case 18:
    case 20:
    case 22:
    case 24:
    case 26:
        return 1;
    default:
        return 0;
    }
}

s32 ov44_0222A090(u32 arg0) {
    u32 temp_r0;

    temp_r0 = arg0 - 12;
    switch (temp_r0) {
    case 0:
    case 1:
    case 2:
    case 3:
        return 1;
    default:
        return 0;
    }
}

u32 ov44_0222A0B4(u32 arg0) {
    u32 var_r1;

    var_r1 = 29;
    switch (arg0) {
    case 19:
        var_r1 = 18;
        break;
    case 21:
        var_r1 = 20;
        break;
    case 23:
        var_r1 = 22;
        break;
    case 27:
        var_r1 = 26;
        break;
    case 25:
        var_r1 = 24;
        break;
    case 15:
        var_r1 = 8;
        break;
    case 9:
        var_r1 = 2;
        break;
    case 10:
        var_r1 = 3;
        break;
    case 11:
        var_r1 = 4;
        break;
    case 12:
        var_r1 = 5;
        break;
    case 13:
        var_r1 = 6;
        break;
    case 14:
        var_r1 = 7;
        break;
    case 16:
        var_r1 = 1;
        break;
    case 18:
        var_r1 = 19;
        break;
    case 20:
        var_r1 = 21;
        break;
    case 22:
        var_r1 = 23;
        break;
    case 26:
        var_r1 = 27;
        break;
    case 24:
        var_r1 = 25;
        break;
    case 8:
        var_r1 = 15;
        break;
    case 2:
        var_r1 = 9;
        break;
    case 3:
        var_r1 = 10;
        break;
    case 4:
        var_r1 = 11;
        break;
    case 5:
        var_r1 = 12;
        break;
    case 6:
        var_r1 = 13;
        break;
    case 7:
        var_r1 = 14;
        break;
    case 1:
        var_r1 = 16;
        break;
    }
    return var_r1;
}

s32 ov44_0222A168(UnkStruct_ov44_022319EC *arg0) {
    Party *party = SaveArray_Party_Get(arg0->saveData);
    int partyCount = Party_GetCount(party);
    int i;
    int var_r5 = 0;

    for (i = 0; i < partyCount; i++) {
        Pokemon *pokemon = Party_GetMonByIndex(party, i);
        if ((GetMonData(pokemon, MON_DATA_HP, NULL) != 0) && (GetMonData(pokemon, MON_DATA_IS_EGG, NULL) == 0)) {
            var_r5 += 1;
        }
    }
    return var_r5;
}

void ov44_0222A1B4(u32 arg0) {
    if ((arg0 - 18) <= 1) {
        sub_02039AF8();
        return;
    }
    if (ov44_02229F44(arg0) != 0) {
        sub_02039B18();
        return;
    }
    if (arg0 == 16) {
        sub_02039B58();
        return;
    }
    if ((arg0 - 20) <= 1) {
        sub_020378E4(0);
        sub_02039E9C();
        return;
    }
    sub_020378E4(1);
    sub_02039B7C();
}

void ov44_0222A1FC(UnkStruct_ov44_022319EC *arg0) {
    Main_SetVBlankIntrCB(NULL, NULL);
    HBlankInterruptDisable();
    GfGfx_DisableEngineAPlanes();
    GfGfx_DisableEngineBPlanes();
    reg_GX_DISPCNT &= 0xFFFFE0FF;
    reg_GXS_DB_DISPCNT &= 0xFFFFE0FF;
    SetKeyRepeatTimers(4, 8);
    NARC *temp_r0 = NARC_New(NARC_a_0_8_8, HEAP_ID_53);
    arg0->unk15C = BgConfig_Alloc(HEAP_ID_53);
    arg0->unk164 = MessageFormat_New(HEAP_ID_53);
    arg0->unk168 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0778_bin, HEAP_ID_53);
    arg0->unk16C = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0800_bin, HEAP_ID_53);
    ov44_0222A830();
    ov44_0222A850(arg0->unk15C);
    ov44_0222AEC0(arg0, temp_r0);
    MI_CpuFill8(&arg0->unkD68, 0, sizeof(UnkStruct_ov44_0222A40C));

    NNSG2dPaletteData *sp2C;
    void *temp_r4 = GfGfxLoader_GetPlttDataFromOpenNarc(temp_r0, 5, &sp2C, HEAP_ID_53);
    MIi_CpuCopy16(sp2C->pRawData, *arg0->unkD68.unk8, 128);
    MIi_CpuCopy16(sp2C->pRawData, *arg0->unkD68.unk88, 128);
    Heap_Free(temp_r4);
    int i;
    int sp18 = 0;
    for (i = 0; i < 3; i++) {
        int j = 0;
        int sp10 = 0;
        int a = i + 1;
        while (TRUE) {
            GF_ASSERT(sp18 < 21);
            for (int k = 1; k < 16; k++) {
                BlendPalette(&arg0->unkD68.unk8[i][k], &arg0->unkD68.unk88[sp18][k], 1, j >> 8, arg0->unkD68.unk8[a][k]);
            }
            sp18++;
            if (sp10 == 1) {
                break;
            }
            j += 768;
            if (j >= 4096) {
                j = 4096;
                sp10 = 1;
            }
        }
    }
    DC_FlushRange(arg0->unkD68.unk88, 672);
    arg0->unkD68.unk4 = 1;
    arg0->unkD68.unk32C = 0;
    arg0->unkD68.unk0 = SysTask_CreateOnVBlankQueue((SysTaskFunc)ov44_0222A40C, &arg0->unkD68, 20);
    Main_SetVBlankIntrCB((GFIntrCB)ov44_0222A7F8, arg0);
    ov44_0222AFE8();
    ov44_0222B030(arg0, temp_r0);
    ov44_0222B0A4(arg0);
    gSystem.screensFlipped = 1;
    GfGfx_SwapDisplay();
    NARC_Delete(temp_r0);
}

void ov44_0222A40C(s32 arg0, UnkStruct_ov44_0222A40C *arg1) {
    if (arg1->unk4 != 0) {
        arg1->unk32B ^= 1;
        if ((1 & arg1->unk32B) == 0) {
            if (arg1->unk32C <= 1) {
                GX_LoadBGPltt(arg1->unk88[arg1->unk328], 0, 32);
            }
            u32 temp_r0 = arg1->unk32C;
            if ((temp_r0 == 0) || (temp_r0 == 2)) {
                GXS_LoadBGPltt(arg1->unk88[arg1->unk328], 0, 32);
            }
            if (arg1->unk32A == 0) {
                arg1->unk328++;
                if (arg1->unk328 >= 21) {
                    arg1->unk328 = 19;
                    arg1->unk32A ^= 1;
                }
            } else {
                arg1->unk328--;
                if (arg1->unk328 < 0) {
                    arg1->unk328 = 1;
                    arg1->unk32A ^= 1;
                }
            }
        }
    }
}

s32 ov44_0222A4B4(OverlayManager *overlayMananger, s32 *arg1) {
    switch (*arg1) {
    case 0:
        UnkStruct_ov44_0222A758_args *overlayArgs = OverlayManager_GetArgs(overlayMananger);
        if (sub_02039998() != 0) {
            switch (overlayArgs->unk4) {
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
            case 12:
                Heap_Create(HEAP_ID_3, HEAP_ID_128, 0x10000);
                break;
            }
        } else {
            Heap_Create(HEAP_ID_3, HEAP_ID_128, 0x10000);
        }
        HandleLoadOverlay(FS_OVERLAY_ID(OVY_42), OVY_LOAD_ASYNC);
        if (overlayArgs->unk4 == 1) {
            Heap_Create(HEAP_ID_3, HEAP_ID_53, 0x70000);
        } else {
            Heap_Create(HEAP_ID_3, HEAP_ID_53, 0xA0000);
        }
        UnkStruct_ov44_022319EC *data = OverlayManager_CreateAndGetData(overlayMananger, 4288, HEAP_ID_53);
        MI_CpuFill8(data, 0, 4288);
        GF_CreateVramTransferManager(32, HEAP_ID_53);
        data->unk180 = 8;
        data->saveData = overlayArgs->unk0;
        data->unk0 = sub_0202C6F4(data->saveData);
        data->unk354 = overlayArgs->unk4;
        data->unk34C = 8;
        data->unk370 = -1;
        GfGfx_EngineATogglePlanes(15, 0);
        GfGfx_EngineBTogglePlanes(15, 0);
        ov44_0222ADF8(data);
        ov44_0222A1FC(data);
        BeginNormalPaletteFade(0, 1, 1, 0, 6, 1, HEAP_ID_53);
        if (sub_02039998() != 0) {
            sub_0203A880();
        } else {
            LoadDwcOverlay();
            sub_02039FD8(HEAP_ID_53);
        }
        GF_ASSERT(sub_02021148(4) == 1);
        *arg1 += 1;
        break;
    case 1:
        OverlayManager_GetData(overlayMananger);
        *arg1 = 0;
        return 1;
    }
    return 0;
}

s32 ov44_0222A60C(OverlayManager *overlayManager, s32 *arg1) {
    UnkStruct_ov44_022319EC *data = OverlayManager_GetData(overlayManager);
    int r1 = arg1[0];
    switch (r1) {
    case 0:
        if (IsPaletteFadeFinished()) {
            *arg1 = 1;
        }
        break;
    case 1:
        int temp_r2 = data->unk348;
        func_type_0222A60C temp_r6 = ov44_0223676C[temp_r2];
        if (temp_r6 != NULL) {
            *_022368A0 = temp_r2;
            *arg1 = temp_r6(data, r1);
        }
        break;
    case 2:
        if (IsPaletteFadeFinished()) {
            return 1;
        }
    }
    SpriteList *temp_r0 = data->unk190;
    if (temp_r0 != NULL) {
        SpriteList_RenderAndAnimateSprites(temp_r0);
    }
    if (ov44_02231BB0(&data->unk38C) == 1) {
        ov44_02231C60(&data->unk38C);
    }
    return 0;
}

void ov44_0222A68C(UnkStruct_ov44_022319EC *arg0) {
    Main_SetVBlankIntrCB(NULL, 0);
    if (arg0->unkD68.unk0) {
        SysTask_Destroy(arg0->unkD68.unk0);
        arg0->unkD68.unk0 = NULL;
        arg0->unkD68.unk4 = 0;
    }
    if (ov44_02231BB0(&arg0->unk38C) == 1) {
        ov44_02231B4C(&arg0->unk38C);
    }
    if (ov44_0222F98C(arg0) == 1) {
        ov44_0222FA28(arg0);
    }
    ov44_0222ABB8(&arg0->unkB0C);
    sub_020135AC(arg0->unk2CC);
    for (int i = 0; i < 4; i++) {
        Destroy2DGfxResObjMan(arg0->unk2BC[i]);
    }
    SpriteList_Delete(arg0->unk190);
    OamManager_Free();
    ObjCharTransfer_Destroy();
    ObjPlttTransfer_Destroy();
    ov44_0222B164(arg0);
    ov44_0222AE74(arg0->unk15C);
    DestroyMsgData(arg0->unk16C);
    DestroyMsgData(arg0->unk168);
    MessageFormat_Delete(arg0->unk164);
    UnloadOverlayByID(FS_OVERLAY_ID(OVY_42));
}

s32 ov44_0222A758(OverlayManager *overlayManager) {
    UnkStruct_ov44_022319EC *data = OverlayManager_GetData(overlayManager);
    ov44_0222A68C(data);
    UnkStruct_ov44_0222A758_args *args = OverlayManager_GetArgs(overlayManager);
    args->unk4 = data->unk34C;
    if ((data->unk34C == 8) || (data->unk34C == 10)) {
        UnloadDwcOverlay();
        TextFlags_SetCanTouchSpeedUpPrint(0);
    } else {
        args->unk8 = ov00_021E6EBC();
    }
    ov44_0222AE44(data);
    OverlayManager_FreeData(overlayManager);
    sub_02021238();
    GF_DestroyVramTransferManager();
    Heap_Destroy(HEAP_ID_53);
    switch (data->unk34C) {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 12:
        Heap_Destroy(HEAP_ID_128);
        break;
    }
    if (ov44_0222E074() == 1) {
        GF_SndHandleSetInitialVolume(0, 120);
    }
    return 1;
}

void ov44_0222A7F8(UnkStruct_ov44_022319EC *arg0) {
    DoScheduledBgGpuUpdates(arg0->unk15C);
    GF_RunVramTransferTasks();
    OamManager_ApplyAndResetBuffers();
    if (arg0->unk10BC == 1) {
        SetMasterBrightnessNeutral(0);
        SetMasterBrightnessNeutral(1);
        arg0->unk10BC = 0;
    }
}

void ov44_0222A830(void) {
    GraphicsBanks graphicsBanks = ov44_02235548;
    GfGfx_SetBanks(&graphicsBanks);
}

void ov44_0222A850(BgConfig *arg0) {
    GraphicsModes graphicsModes = ov44_022353B0;
    SetBothScreensModesAndDisable(&graphicsModes);

    BgTemplate bgTemplate0 = ov44_022353E8;
    InitBgFromTemplate(arg0, 0, &bgTemplate0, 0);
    BG_ClearCharDataRange(0, 32, 0, HEAP_ID_53);
    BgClearTilemapBufferAndCommit(arg0, 0);

    BgTemplate bgTemplate1 = ov44_02235404;
    InitBgFromTemplate(arg0, 1, &bgTemplate1, 0);
    BG_ClearCharDataRange(1, 32, 0, HEAP_ID_53);
    BgClearTilemapBufferAndCommit(arg0, 1);

    BgTemplate bgTemplate2 = ov44_02235490;
    InitBgFromTemplate(arg0, 2, &bgTemplate2, 0);
    BG_ClearCharDataRange(2, 32, 0, HEAP_ID_53);
    BgClearTilemapBufferAndCommit(arg0, 2);

    BgTemplate bgTemplate3 = ov44_02235420;
    InitBgFromTemplate(arg0, 3, &bgTemplate3, 0);
    BG_ClearCharDataRange(3, 32, 0, HEAP_ID_53);
    BgClearTilemapBufferAndCommit(arg0, 3);

    BgTemplate bgTemplate4 = ov44_0223543C;
    InitBgFromTemplate(arg0, 4, &bgTemplate4, 0);
    BgClearTilemapBufferAndCommit(arg0, 4);

    BgTemplate bgTemplate5 = ov44_02235458;
    InitBgFromTemplate(arg0, 5, &bgTemplate5, 0);
    BgClearTilemapBufferAndCommit(arg0, 5);

    BgTemplate bgTemplate6 = ov44_02235474;
    InitBgFromTemplate(arg0, 6, &bgTemplate6, 0);
    BgClearTilemapBufferAndCommit(arg0, 6);

    BgTemplate bgTemplate7 = ov44_022354AC;
    InitBgFromTemplate(arg0, 7, &bgTemplate7, 0);
    BgClearTilemapBufferAndCommit(arg0, 7);
    BG_ClearCharDataRange(0, 32, 0, HEAP_ID_53);
    BG_ClearCharDataRange(1, 32, 0, HEAP_ID_53);
    BG_ClearCharDataRange(2, 32, 0, HEAP_ID_53);
    BG_ClearCharDataRange(3, 32, 0, HEAP_ID_53);
    BG_ClearCharDataRange(4, 32, 0, HEAP_ID_53);
    BG_ClearCharDataRange(5, 32, 0, HEAP_ID_53);
    BG_ClearCharDataRange(6, 32, 0, HEAP_ID_53);
    BG_ClearCharDataRange(7, 32, 0, HEAP_ID_53);
    SetBgPriority(0, 3);
    SetBgPriority(1, 1);
    SetBgPriority(3, 0);
    SetBgPriority(2, 0);
    reg_G2_BLDCNT = 0;
    reg_G2S_DB_BLDCNT = 0;
}

void ov44_0222AA94(UnkStruct_ov44_022319EC *arg0, UnkStruct_ov44_02232B74 *arg1) {
    for (int i = 0; i < 33; i++) {
        if (arg0->unkA88[i] == NULL) {
            arg0->unkA88[i] = arg1;
            return;
        }
    }
    GF_AssertFail();
    return;
}

void ov44_0222AAC0(UnkStruct_ov44_022319EC *arg0, UnkStruct_ov44_02232B74 *arg1) {
    for (int i = 0; i < 33; i++) {
        if (arg0->unkA88[i] == arg1) {
            arg0->unkA88[i] = NULL;
            return;
        }
    }
    GF_AssertFail();
    return;
}

UnkStruct_ov44_02232B74 *ov44_0222AAEC(UnkStruct_ov44_022319EC *arg0, u32 arg1) {
    for (s32 i = 0; i < 33; i++) {
        if ((arg0->unkA88[i] != NULL) && (arg1 == ov44_02231EF4(arg0->unkA88[i]))) {
            return arg0->unkA88[i];
        }
    }
    return NULL;
}

void ov44_0222AB24(BgConfig *arg0, UnkStruct_ov44_0222AB24 *arg1, NARC *arg2, enum HeapID arg3) {
    GfGfxLoader_GXLoadPalFromOpenNarc(arg2, 14, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_8_OFFSET, 64, arg3);
    GfGfxLoader_GXLoadPalFromOpenNarc(arg2, 14, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_13_OFFSET, 64, arg3);
    GfGfxLoader_LoadCharDataFromOpenNarc(arg2, 13, arg0, GF_BG_LYR_MAIN_1, 0, 0, 0, arg3);
    GfGfxLoader_LoadCharDataFromOpenNarc(arg2, 13, arg0, GF_BG_LYR_SUB_2, 0, 0, 0, arg3);
    if (arg1->unk8 == 0) {
        arg1->unk8 = GfGfxLoader_GetCharDataFromOpenNarc(arg2, 13, 0, &arg1->unkC, arg3);
    }
    if (arg1->unk0 == NULL) {
        arg1->unk0 = GfGfxLoader_GetScrnDataFromOpenNarc(arg2, 15, 0, &arg1->unk4, arg3);
    }
}

void ov44_0222ABB8(UnkStruct_ov44_0222AB24 *arg0) {
    if (arg0->unk0) {
        Heap_Free(arg0->unk0);
        arg0->unk0 = NULL;
    }
    if (arg0->unk8) {
        Heap_Free(arg0->unk8);
        arg0->unk8 = NULL;
    }
}

void ov44_0222ABDC(BgConfig *arg0, UnkStruct_ov44_0222AB24 *arg1, s32 arg2, u8 arg3, u8 arg4, s32 arg5, s32 arg6) {
    CopyToBgTilemapRect(arg0, arg2, arg3, arg4, 2, 2, arg1->unk4->rawData, (arg5 * 2), 0, arg1->unk4->screenWidth / 8, arg1->unk4->screenHeight / 8);
    s32 r0 = ov44_0222ADC4(arg2);
    BgTilemapRectChangePalette(arg0, arg2, arg3, arg4, 2, 2, r0 + arg6);
    ScheduleBgTilemapBufferTransfer(arg0, arg2);
}

void ov44_0222AC54(BgConfig *arg0, UnkStruct_ov44_0222AB24 *arg1, s32 arg2, u8 arg3, u8 arg4, u32 arg5) {
    s32 var_r4;
    s32 var_r5;

    var_r4 = 0;
    switch (arg5) {
    case 1:
        var_r5 = 3;
        break;
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
        var_r4 = 1;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
        var_r5 = 6;
        break;
    case 15:
        var_r4 = 1;
    case 8:
        var_r5 = 7;
        break;
    case 23:
    case 25:
    case 27:
        var_r4 = 1;
    case 22:
    case 24:
    case 26:
        var_r5 = 10;
        break;
    case 18:
    case 19:
        var_r5 = 5;
        break;
    case 21:
        var_r4 = 1;
    case 20:
        var_r5 = 11;
        break;
    case 16:
        var_r5 = 4;
        break;
    case 0:
        var_r5 = 8;
        break;
    case 28:
    case 29:
        var_r5 = 5;
        break;
    default:
        var_r5 = 5;
        break;
    }
    ov44_0222ABDC(arg0, arg1, arg2, arg3, arg4, var_r5, var_r4);
}

void ov44_0222ACE8(Window *arg0, UnkStruct_ov44_0222AB24 *arg1, u8 arg2, u16 arg3, s32 arg4, s32 arg5) {
    BlitBitmapRectToWindow(arg0, arg1->unkC->pRawData, arg4 * 16, 0, arg1->unkC->W * 8, arg1->unkC->H * 8, arg2, arg3, 16, 16);
    s32 r0 = ov44_0222ADC4(arg0->bgId);
    SetWindowPaletteNum(arg0, r0 + arg5);
}

void ov44_0222AD34(Window *arg0, UnkStruct_ov44_0222AB24 *arg1, u8 arg2, u16 arg3, u32 arg4) {
    u8 var_r5;
    u8 var_r4 = 0;
    switch (arg4) {
    case 1:
        var_r5 = 3;
        break;
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
        var_r4 = 1;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
        var_r5 = 6;
        break;
    case 15:
        var_r4 = 1;
    case 8:
        var_r5 = 7;
        break;
    case 23:
    case 25:
    case 27:
        var_r4 = 1;
    case 22:
    case 24:
    case 26:
        var_r5 = 10;
        break;
    case 18:
    case 19:
        var_r5 = 5;
        break;
    case 21:
        var_r4 = 1;
    case 20:
        var_r5 = 11;
        break;
    case 16:
        var_r5 = 4;
        break;
    case 0:
        var_r5 = 8;
        break;
    case 28:
    case 29:
        var_r5 = 5;
        break;
    default:
        var_r5 = 5;
        break;
    }
    ov44_0222ACE8(arg0, arg1, arg2, arg3, var_r5, var_r4);
}

s32 ov44_0222ADC4(u32 arg0) {
    if (arg0 < 4) {
        return 8;
    }
    return 13;
}

u32 ov44_0222ADD0(void) {
    BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, HEAP_ID_53);
    ov44_0222E030();
    return 18;
}

void ov44_0222ADF8(UnkStruct_ov44_022319EC *arg0) {
    arg0->unk174 = String_New(380, HEAP_ID_53);
    arg0->unk17C = String_New(380, HEAP_ID_53);
    arg0->unk170 = String_New(380, HEAP_ID_53);
    arg0->unk178 = String_New(180, HEAP_ID_53);
    arg0->unk348 = 0;
}

void ov44_0222AE44(UnkStruct_ov44_022319EC *arg0) {
    String_Delete(arg0->unk178);
    String_Delete(arg0->unk174);
    String_Delete(arg0->unk17C);
    String_Delete(arg0->unk170);
}

void ov44_0222AE74(BgConfig *arg0) {
    FreeBgTilemapBuffer(arg0, 7);
    FreeBgTilemapBuffer(arg0, 6);
    FreeBgTilemapBuffer(arg0, 5);
    FreeBgTilemapBuffer(arg0, 4);
    FreeBgTilemapBuffer(arg0, 3);
    FreeBgTilemapBuffer(arg0, 2);
    FreeBgTilemapBuffer(arg0, 1);
    FreeBgTilemapBuffer(arg0, 0);
    Heap_Free(arg0);
}

void ov44_0222AEC0(UnkStruct_ov44_022319EC *arg0, NARC *arg1) {
    BgConfig *bgConfig = arg0->unk15C;
    GfGfx_EngineATogglePlanes(1, 1);
    GfGfx_EngineATogglePlanes(2, 1);
    GfGfx_EngineATogglePlanes(4, 1);
    GfGfx_EngineATogglePlanes(8, 1);
    GfGfx_EngineBTogglePlanes(1, 1);
    GfGfxLoader_GXLoadPalFromOpenNarc(arg1, 3, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0, HEAP_ID_53);
    GfGfxLoader_GXLoadPalFromOpenNarc(arg1, 3, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 0, HEAP_ID_53);
    LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_13_OFFSET, HEAP_ID_53);
    LoadFontPal1(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_12_OFFSET, HEAP_ID_53);
    GfGfxLoader_LoadCharDataFromOpenNarc(arg1, 2, bgConfig, GF_BG_LYR_MAIN_0, 0, 0, 0, HEAP_ID_53);
    GfGfxLoader_LoadScrnDataFromOpenNarc(arg1, 6, bgConfig, GF_BG_LYR_MAIN_0, 0, 0, 0, HEAP_ID_53);
    GfGfxLoader_LoadCharDataFromOpenNarc(arg1, 11, bgConfig, GF_BG_LYR_SUB_0, 0, 0, 0, HEAP_ID_53);
    GfGfxLoader_LoadScrnDataFromOpenNarc(arg1, 12, bgConfig, GF_BG_LYR_SUB_0, 0, 0, 0, HEAP_ID_53);
    Options *options = Save_PlayerData_GetOptionsAddr(arg0->saveData);
    LoadUserFrameGfx2(bgConfig, GF_BG_LYR_MAIN_2, 482, 10, Options_GetFrame(options), HEAP_ID_53);
    LoadUserFrameGfx1(bgConfig, GF_BG_LYR_MAIN_2, 473, 11, 0, HEAP_ID_53);
    LoadUserFrameGfx1(bgConfig, GF_BG_LYR_MAIN_1, 473, 11, 0, HEAP_ID_53);
}

void ov44_0222AFE8(void) {
    ObjCharTransferTemplate objCharTransferTemplate = ov44_022353C0;
    ObjCharTransfer_InitEx(&objCharTransferTemplate, GX_OBJVRAMMODE_CHAR_1D_128K, GX_OBJVRAMMODE_CHAR_1D_32K);
    ObjPlttTransfer_Init(20, HEAP_ID_53);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
    G2dRenderer_SetObjCharTransferReservedRegion(NNS_G2D_VRAM_TYPE_2DMAIN, GX_OBJVRAMMODE_CHAR_1D_128K);
    G2dRenderer_SetPlttTransferReservedRegion(NNS_G2D_VRAM_TYPE_2DMAIN);
}

void ov44_0222B030(UnkStruct_ov44_022319EC *arg0, NARC *arg1) {
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 126, 0, 32, 0, 126, 0, 32, HEAP_ID_53);
    arg0->unk190 = G2dRenderer_Init(8, &arg0->unk194, HEAP_ID_53);
    G2dRenderer_SetSubSurfaceCoords(&arg0->unk194, 0, 0x100000);
    for (int i = 0; i < 4; i++) {
        arg0->unk2BC[i] = Create2DGfxResObjMan(1, (GfGfxResType)i, HEAP_ID_53);
    }
    arg0->unk2CC = FontSystem_NewInit(1, HEAP_ID_53);
}

void ov44_0222B0A4(UnkStruct_ov44_022319EC *arg0) {
    GfGfx_EngineATogglePlanes(16, 1);
}

void ov44_0222B0B0(UnkStruct_ov44_022319EC *arg0) {
    if (WindowIsInUse(&arg0->unk2F0) != 0) {
        sub_0200E5D4(&arg0->unk2F0, 0);
        RemoveWindow(&arg0->unk2F0);
    }
    AddWindowParameterized(arg0->unk15C, &arg0->unk2F0, 3, 5, 1, 22, 2, 13, 458);
    FillWindowPixelBuffer(&arg0->unk2F0, 0);

    // Nintendo Wi-Fi Connection
    ReadMsgDataIntoString(arg0->unk168, 21, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unk2F0, 1, arg0->unk178, FontID_String_GetCenterAlignmentX(0, arg0->unk178, 0, 176), 0, 255, 0xF0E00, NULL);
    ScheduleWindowCopyToVram(&arg0->unk2F0);
}

void ov44_0222B164(UnkStruct_ov44_022319EC *arg0) {
    ov44_0222F7BC(arg0);
    if (WindowIsInUse(&arg0->unk2F0) != 0) {
        RemoveWindow(&arg0->unk2F0);
    }
    if (WindowIsInUse(&arg0->unk2D0) != 0) {
        RemoveWindow(&arg0->unk2D0);
    }
    if (WindowIsInUse(&arg0->unk330) != 0) {
        RemoveWindow(&arg0->unk330);
    }
    if (WindowIsInUse(&arg0->unk2E0) != 0) {
        RemoveWindow(&arg0->unk2E0);
    }
    if (WindowIsInUse(&arg0->unk310) != 0) {
        RemoveWindow(&arg0->unk310);
    }
    if (arg0->unk150 != NULL) {
        DestroyListMenu(arg0->unk150, NULL, NULL);
    }
    if (arg0->unk14C != NULL) {
        ListMenuItems_Delete(arg0->unk14C);
        arg0->unk14C = NULL;
    }
    if (WindowIsInUse(&arg0->unk300) != 0) {
        RemoveWindow(&arg0->unk300);
    }
}

s32 ov44_0222B228(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (sub_02039998() != 0) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        arg0->unk4 = sub_020398C8();
        u32 temp_r0 = ov44_02229F00(arg0, &arg0->unk4->unk0);
        if ((temp_r0 == 8) || (temp_r0 == 18) || (temp_r0 == 20) || (temp_r0 == 22) || (temp_r0 == 23) || (temp_r0 == 24) || (temp_r0 == 25) || (temp_r0 == 26) || (temp_r0 == 27) || (temp_r0 == 19)) {
            ov44_0222F818(arg0, 16);
            sub_020343E4();
            sub_02039378();
            UnkStruct_ov44_0223197C *temp_r0_2 = sub_020398C8();
            arg0->unk4 = temp_r0_2;
            temp_r0_2->unk0.unk21 = temp_r0_2->unk0.unk22;
            arg0->unk35C = 20;
            arg0->unk348 = 65;
        } else {
            ov44_0222F510(arg0, 77, 0);
            sub_020398D4(1, 1);
            sub_02037AC0(16);
            arg0->unk348 = 61;
        }
    } else {
        Sound_SetSceneAndPlayBGM(11, SEQ_GS_WIFI_ACCESS, 1);
        ov44_0222B0B0(arg0);
        sub_0202C08C(arg0->unk0);
        if (DWC_CheckHasProfile() == 0) {
            SetBgPriority(0, 3);
            SetBgPriority(1, 0);
            SetBgPriority(3, 0);
            SetBgPriority(2, 1);
            ov44_0222F66C(arg0, 18);
            arg0->unk188 = ov44_02231A28(arg0->unk15C, &ov44_02235384, 0);
            arg0->unk348 = 6;
        } else {
            sub_0202C08C(arg0->unk0);
            if (DWC_CheckValidConsole() == 0) {
                ov44_0222F66C(arg0, 20);
                arg0->unk348 = 3;
            } else {
                ov44_0222F510(arg0, 17, 1);
                arg0->unk348 = 1;
            }
        }
    }
    return arg1;
}

s32 ov44_0222B36C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (TextPrinterCheckActive(arg0->unk180) == 0) {
        arg0->unk188 = ov44_02231A28(arg0->unk15C, &ov44_0223537C, 0);
        arg0->unk348 = 2;
    }
    return arg1;
}

s32 ov44_0222B3A8(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    enum YesNoResponse response = YesNoPrompt_HandleInput(arg0->unk188);
    if (response == YESNORESPONSE_YES) {
        YesNoPrompt_Destroy(arg0->unk188);
        arg0->unk4 = sub_020396FC(arg0->saveData, 1188);
        ov44_0222F510(arg0, 23, 1);
        GF_ASSERT(arg0->unk18C == NULL);
        arg0->unk18C = WaitingIcon_New(&arg0->unk2D0, 482);
        arg0->unk348 = 14;
    } else if (response == YESNORESPONSE_NO) {
        YesNoPrompt_Destroy(arg0->unk188);
        arg0->unk348 = 34;
    } else {
        return arg1;
    }
    return arg1;
}

s32 ov44_0222B42C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if ((gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) || (System_GetTouchNew() == 1)) {
        ov44_0222F66C(arg0, 21);
        SetBgPriority(3, 0);
        SetBgPriority(2, 1);
        SetBgPriority(1, 0);
        SetBgPriority(0, 3);
        arg0->unk188 = ov44_02231A28(arg0->unk15C, &ov44_02235384, 1);
        arg0->unk348 = 4;
    }
    return arg1;
}

s32 ov44_0222B494(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    enum YesNoResponse response = YesNoPrompt_HandleInput(arg0->unk188);
    if (response == YESNORESPONSE_YES) {
        YesNoPrompt_Destroy(arg0->unk188);
        ClearFrameAndWindow2(&arg0->unk300, 0);
        RemoveWindow(&arg0->unk300);
        ov44_0222F66C(arg0, 22);
        arg0->unk188 = ov44_02231A28(arg0->unk15C, &ov44_02235384, 1);
        arg0->unk348 = 5;
    } else if (response == YESNORESPONSE_NO) {
        YesNoPrompt_Destroy(arg0->unk188);
        ClearFrameAndWindow2(&arg0->unk300, 0);
        RemoveWindow(&arg0->unk300);
        arg0->unk348 = 34;
    } else {
        return arg1;
    }
    return arg1;
}

s32 ov44_0222B528(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    enum YesNoResponse response = YesNoPrompt_HandleInput(arg0->unk188);
    if (response == YESNORESPONSE_YES) {
        YesNoPrompt_Destroy(arg0->unk188);
        SetBgPriority(3, 0);
        SetBgPriority(2, 0);
        SetBgPriority(1, 1);
        SetBgPriority(0, 3);
        ClearFrameAndWindow2(&arg0->unk300, 0);
        RemoveWindow(&arg0->unk300);
        sub_0202C03C(arg0->unk0);
        void *saveArray = SaveArray_Get(arg0->saveData, 31);
        sub_02031710(saveArray);
        Save_Frontier_GetStatic(arg0->saveData);
        sub_02031188();
        arg0->unk348 = 14;
        arg0->unk4 = sub_020396FC(arg0->saveData, 1188);
        ov44_0222F510(arg0, 23, 1);
        GF_ASSERT(arg0->unk18C == NULL);
        arg0->unk18C = WaitingIcon_New(&arg0->unk2D0, 482);
        arg0->unk368 = 1;
    } else if (response == YESNORESPONSE_NO) {
        YesNoPrompt_Destroy(arg0->unk188);
        SetBgPriority(3, 0);
        SetBgPriority(2, 0);
        SetBgPriority(1, 1);
        SetBgPriority(0, 3);
        ClearFrameAndWindow2(&arg0->unk300, 0);
        RemoveWindow(&arg0->unk300);
        ov44_0222F66C(arg0, 20);
        arg0->unk348 = 3;
    } else {
        return arg1;
    }
    return arg1;
}

s32 ov44_0222B64C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    enum YesNoResponse response = YesNoPrompt_HandleInput(arg0->unk188);
    if (response == YESNORESPONSE_YES) {
        YesNoPrompt_Destroy(arg0->unk188);
        SetBgPriority(0, 3);
        SetBgPriority(1, 1);
        SetBgPriority(3, 0);
        SetBgPriority(2, 0);
        ClearFrameAndWindow2(&arg0->unk300, 0);
        RemoveWindow(&arg0->unk300);
        arg0->unk348 = 14;
        arg0->unk4 = sub_020396FC(arg0->saveData, 1188);
        ov44_0222F510(arg0, 23, 1);
        GF_ASSERT(arg0->unk18C == NULL);
        arg0->unk18C = WaitingIcon_New(&arg0->unk2D0, 482);
        arg0->unk368 = 1;
    } else if (response == YESNORESPONSE_NO) {
        YesNoPrompt_Destroy(arg0->unk188);
        SetBgPriority(0, 3);
        SetBgPriority(1, 1);
        SetBgPriority(3, 0);
        SetBgPriority(2, 0);
        ClearFrameAndWindow2(&arg0->unk300, 0);
        RemoveWindow(&arg0->unk300);
        arg0->unk348 = 34;
    } else {
        return arg1;
    }
    return arg1;
}

s32 ov44_0222B744(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    SetBgPriority(0, 3);
    SetBgPriority(1, 1);
    SetBgPriority(3, 0);
    SetBgPriority(2, 0);
    arg0->unk348 = 15;
    return arg1;
}

void ov44_0222B778(UnkStruct_ov44_022319EC *arg0, u32 arg1) {
    PlayerProfile *playerProfile = Save_PlayerData_GetProfile(arg0->saveData);
    Pokedex *pokedex = Save_Pokedex_Get(arg0->saveData);
    Party *party = SaveArray_Party_Get(arg0->saveData);
    SaveWiFiHistory *saveWiFiHistory = Save_WiFiHistory_Get(arg0->saveData);
    s32 partyCount = Party_GetCount(party);

    for (s32 i = 0; i < partyCount; i++) {
        Pokemon *pokemon = Party_GetMonByIndex(party, i);
        arg0->unk4->unk0.unk0[i] = GetMonData(pokemon, MON_DATA_SPECIES, 0);
        arg0->unk4->unk0.unkC[i] = GetMonData(pokemon, MON_DATA_HELD_ITEM, 0);
    }
    arg0->unk4->unk0.unk18[0] = PlayerProfile_GetVersion(playerProfile);
    arg0->unk4->unk0.unk18[1] = PlayerProfile_GetLanguage(playerProfile);
    arg0->unk4->unk0.unk18[2] = Pokedex_GetNatDexFlag(pokedex);
    arg0->unk4->unk0.unk1B = 29;
    ov44_0222F830(arg0, arg1);
    arg0->unk4->unk0.unk1C[0] = 0;
    arg0->unk4->unk0.unk1C[1] = PlayerProfile_GetAvatar(playerProfile);
    arg0->unk4->unk0.unk1C[2] = PlayerProfile_GetTrainerGender(playerProfile);
    arg0->unk4->unk0.unk1C[3] = WifiHistory_GetPlayerCountry(saveWiFiHistory);
    arg0->unk4->unk0.unk1C[4] = WiFiHistory_GetPlayerRegion(saveWiFiHistory);
    arg0->unk4->unk0.unk21 = 1;
    arg0->unk4->unk0.unk22 = 1;
    ov00_021E6D60(arg0->unk4, 36);
    ov00_021E6CCC(arg0->unk4->unk24, 36);
}

s32 ov44_0222B870(UnkStruct_ov44_022319EC *arg0) {
    s32 counter = 0;
    for (s32 i = 0; i < 32; i++) {
        arg0->unkC[i] = 0;
        if ((arg0->unk10BE > i) && (ov44_02231974(i) != 0)) {
            UnkStruct_ov44_02231958 *temp_r0 = ov44_02231958(arg0, i);
            u32 temp_r0_2 = ov44_02229F00(arg0, temp_r0);
            if ((temp_r0_2 != 0) && (temp_r0_2 != 28) && (temp_r0->unk1C[1] != 0)) {
                arg0->unkC[counter] = i + 1;
                counter += 1;
            } else if ((temp_r0_2 == 28) && (ov44_02230048(arg0, i + 1) != 0)) {
                ov44_02230028(arg0, i + 1);
            }
        }
    }
    return counter;
}

s32 ov44_0222B8E0(UnkStruct_ov44_022319EC *arg0) {
    s32 counter = 0;
    s32 sp8;
    for (s32 i = 0; i < 32; i++) {
        UnkStruct_ov44_02231958 *temp_r0 = ov44_02231958(arg0, i);
        s32 temp_r0_2 = ov44_02229F00(arg0, temp_r0);
        if ((temp_r0_2 != arg0->unk4C[i]) || (temp_r0->unk21 != arg0->unkCC[i])) {
            UnkStruct_ov44_02232B74 *temp_r0_3 = ov44_0222AAEC(arg0, i + 1);
            if (temp_r0_3 != NULL) {
                sp8 = ov44_02229FDC(arg0->unk4C[i]);
                s32 temp_r0_4 = ov44_02229FDC(temp_r0_2);
                if ((sp8 == 1) && (temp_r0_4 == 0)) {
                    ov44_02231FA8(&arg0->unk38C, temp_r0_3, 0);
                } else if ((sp8 == 0) && (temp_r0_4 == 1)) {
                    ov44_02231FA8(&arg0->unk38C, temp_r0_3, 1);
                }
                arg0->unk4C[i] = temp_r0_2;
                arg0->unkCC[i] = temp_r0->unk21;
                sub_0202C190(arg0->unk0, i, 7, temp_r0->unk1C[1]);
                sub_0202C190(arg0->unk0, i, 8, temp_r0->unk1C[2]);
                counter += 1;
            }
        }
    }
    return counter;
}

void ov44_0222B9A0(UnkStruct_ov44_022319EC *arg0) {
    u32 *temp_r0 = sub_020392D8();
    s32 temp_r6 = temp_r0[0];
    s32 var_r5 = ov00_021E6A70(temp_r6, temp_r0[1]);
    s32 var_r7;
    if ((var_r5 == 11) || (temp_r6 == 25)) {
        if (temp_r0[1] != 2) {
            var_r7 = 14;
        } else {
            var_r7 = 11;
        }
        var_r5 = 11;
    } else if (temp_r6 == 26) {
        var_r7 = 13;
        var_r5 = 12;
    } else if (var_r5 >= 0) {
        var_r7 = var_r5;
    } else {
        var_r7 = 11;
    }
    ov44_0222F7BC(arg0);
    BufferIntegerAsString(arg0->unk164, 0, temp_r6, 5, PRINTING_MODE_LEADING_ZEROS, 1);
    arg0->unk35C = 30;
    ov44_0222F66C(arg0, var_r7);
    switch (var_r5) {
    case 1:
    case 4:
    case 5:
    case 11:
        arg0->unk348 = 10;
        return;
    case 6:
    case 7:
    case 8:
    case 9:
        arg0->unk348 = 10;
        return;
    case 10:
        arg0->unk348 = 10;
        return;
    }
    arg0->unk348 = 35;
}

s32 ov44_0222BA6C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if ((gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) || (System_GetTouchNew() == 1)) {
        if (WindowIsInUse(&arg0->unk300) != 0) {
            ClearFrameAndWindow2(&arg0->unk300, 0);
            RemoveWindow(&arg0->unk300);
        }
        arg0->unk348 = 8;
    }
    return arg1;
}

s32 ov44_0222BAB8(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    arg0->unk348 = 9;
    return arg1;
}

s32 ov44_0222BAC4(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    arg0->unk348 = 11;
    return arg1;
}

s32 ov44_0222BAD0(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    s32 temp_r1;

    temp_r1 = arg0->unk35C;
    if (temp_r1 > 0) {
        arg0->unk35C = temp_r1 - 1;
        return arg1;
    }
    if ((gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) || (System_GetTouchNew() == 1)) {
        if (WindowIsInUse(&arg0->unk300) != 0) {
            ClearFrameAndWindow2(&arg0->unk300, 0);
            RemoveWindow(&arg0->unk300);
        }
        ov44_0222F510(arg0, 88, 0);
        arg0->unk348 = 11;
    }
    return arg1;
}

s32 ov44_0222BB38(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (TextPrinterCheckActive(arg0->unk180) == 0) {
        if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
            arg0->unk184 = Std_CreateYesNoMenu(arg0->unk15C, &ov44_0223538C, 473, 11, HEAP_ID_53);
        } else {
            arg0->unk188 = ov44_02231A28(arg0->unk15C, &ov44_02235374, 0);
        }
        arg0->unk348 = 12;
    }
    return arg1;
}

s32 ov44_0222BBA4(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
        s32 temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk184, HEAP_ID_53);
        if (temp_r0 == -1) {
            return arg1;
        }
        if (temp_r0 == 0) {
            sub_02039330();
            ov44_0222F818(arg0, 16);
            arg0->unk348 = 13;
        } else {
            ov44_0222F818(arg0, 16);
            sub_02039330();
            sub_020343E4();
            arg0->unk34C = 8;
            arg0->unk348 = 34;
        }
    } else {
        enum YesNoResponse response = YesNoPrompt_HandleInput(arg0->unk188);
        if (response == YESNORESPONSE_YES) {
            YesNoPrompt_Destroy(arg0->unk188);
            sub_02039330();
            ov44_0222F818(arg0, 16);
            arg0->unk348 = 13;
        } else if (response == YESNORESPONSE_NO) {
            YesNoPrompt_Destroy(arg0->unk188);
            ov44_0222F818(arg0, 16);
            sub_02039330();
            sub_020343E4();
            arg0->unk34C = 8;
            arg0->unk348 = 34;
        } else {
            return arg1;
        }
    }
    ov44_0222F7BC(arg0);
    return arg1;
}

s32 ov44_0222BC78(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (sub_02034DB8() != 0) {

    } else {
        if (ov44_02231BB0(&arg0->unk38C) == 1) {
            sub_0200FBF4(0, 0);
            sub_0200FBF4(1, 0);
            ov44_02231B4C(&arg0->unk38C);
            for (s32 i = 0; i < 33; i++) {
                arg0->unkA88[i] = 0;
            }
            thunk_ClearMainOAM(HEAP_ID_53);
            thunk_ClearSubOAM(HEAP_ID_53);
        }
        if (ov44_0222F98C(arg0) == 1) {
            ov44_0222FA28(arg0);
        }
        if (WindowIsInUse(&arg0->unk2F0) != 0) {
            sub_0200E5D4(&arg0->unk2F0, 0);
            RemoveWindow(&arg0->unk2F0);
        }
        if (WindowIsInUse(&arg0->unk2E0) != 0) {
            RemoveWindow(&arg0->unk2E0);
        }
        BgClearTilemapBufferAndCommit(arg0->unk15C, 3);
        NARC *temp_r0 = NARC_New(NARC_a_0_8_8, HEAP_ID_53);
        ov44_0222AEC0(arg0, temp_r0);
        NARC_Delete(temp_r0);
        arg0->unkD68.unk4 = 1;
        gSystem.screensFlipped = 1;
        GfGfx_SwapDisplay();
        BgSetPosTextAndCommit(arg0->unk15C, 0, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(arg0->unk15C, 0, BG_POS_OP_SET_Y, 0);
        arg0->unk10BC = 1;
        if (arg0->unk14C != NULL) {
            RemoveWindow(&arg0->unk310);
            DestroyListMenu(arg0->unk150, NULL, NULL);
            arg0->unk150 = NULL;
            ListMenuItems_Delete(arg0->unk14C);
            arg0->unk14C = NULL;
        }
        MI_CpuFill8(arg0->unkC, 0, 32);
        MI_CpuFill8(arg0->unk2C, 0, 32);
        MI_CpuFill8(arg0->unk4C, 0, 128);
        MI_CpuFill8(arg0->unkCC, 0, 128);
        ov44_0222B0B0(arg0);
        arg0->unk4 = sub_020396FC(arg0->saveData, 1188);
        ov44_0222F510(arg0, 23, 1);
        GF_ASSERT(arg0->unk18C == NULL);
        arg0->unk18C = WaitingIcon_New(&arg0->unk2D0, 482);
        arg0->unk348 = 14;
    }
    return arg1;
}

s32 ov44_0222BE3C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (TextPrinterCheckActive(arg0->unk180) != 0) {
        return arg1;
    }
    if (ov00_021E7314() != 0) {
        arg0->unk348 = 69;
        ov44_0222F510(arg0, 30, 1);
        GF_ASSERT(arg0->unk18C == NULL);
        arg0->unk18C = WaitingIcon_New(&arg0->unk2D0, 482);
    }
    if (sub_02039274() != 0) {
        if (arg0->unk368 != 0) {
            arg0->unk348 = 16;
        } else {
            ov44_0222B778(arg0, 16);
            ov44_0222B870(arg0);
            arg0->unk348 = ov44_0222ADD0();
        }
    } else if ((sub_020393C8() != 0) || (sub_020390C4() == 3)) {
        ov44_0222B9A0(arg0);
    }
    return arg1;
}

s32 ov44_0222BEE0(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (TextPrinterCheckActive(arg0->unk180) != 0) {
        return arg1;
    }
    if (ov00_021E7314() != 0) {
        Save_PrepareForAsyncWrite(arg0->saveData, 0);
        arg0->unk348 = 71;
        return arg1;
    }
    if (sub_02039274() != 0) {
        if (arg0->unk368 != 0) {
            arg0->unk348 = 16;
        } else {
            ov44_0222B778(arg0, 16);
            ov44_0222B870(arg0);
            arg0->unk348 = ov44_0222ADD0();
        }
    } else if ((sub_020393C8() != 0) || (sub_020390C4() == 3)) {
        ov44_0222B9A0(arg0);
    }
    return arg1;
}

s32 ov44_0222BF6C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (ov00_021E7314() != 0) {
        s32 temp_r0 = Save_WriteFileAsync(arg0->saveData);
        if ((temp_r0 != 0) && (temp_r0 != 1)) {
            ov00_021E7328();
            Save_ClearStatusFlags(arg0->saveData);
        } else {
            return arg1;
        }
    }
    if (sub_02039274() != 0) {
        if (arg0->unk368 != 0) {
            arg0->unk348 = 16;
        } else {
            ov44_0222B778(arg0, 16);
            ov44_0222B870(arg0);
            arg0->unk348 = ov44_0222ADD0();
        }
    } else if ((sub_020393C8() != 0) || (sub_020390C4() == 3)) {
        ov44_0222B9A0(arg0);
    }
    return arg1;
}

s32 ov44_0222BFF0(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (arg0->unk35C > 0) {
        arg0->unk35C--;
        return arg1;
    }
    if (sub_020392A0() != 0) {
        arg0->unk348 = ov44_0222ADD0();
    } else if ((sub_020393C8() != 0) || (sub_020390C4() == 3)) {
        ov44_0222B9A0(arg0);
    } else if ((sub_020390C4() >= 4) || (sub_02039264() != 0) || (sub_020373B4(0) == 0)) {
        sub_02039358();
        arg0->unk348 = ov44_0222ADD0();
    }
    return arg1;
}

s32 ov44_0222C060(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    ov44_0222F7BC(arg0);
    ov44_0222F66C(arg0, 19);
    arg0->unk348 = 17;
    arg0->unk368 = 0;
    return arg1;
}

s32 ov44_0222C084(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if ((gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) || (System_GetTouchNew() == 1)) {
        if (arg0->unk354 == 1) {
            arg0->unk34C = 10;
            arg0->unk348 = 34;
            sub_02039330();
        } else if (sub_0202C2F8(arg0->unk0) == 0) {
            ov44_0222F510(arg0, 26, 1);
            arg0->unk348 = 59;
            arg0->unk35C = 1;
        } else {
            ov44_0222B778(arg0, 16);
            ov44_0222B870(arg0);
            arg0->unk348 = ov44_0222ADD0();
            if (WindowIsInUse(&arg0->unk300) != 0) {
                ClearFrameAndWindow2(&arg0->unk300, 0);
                RemoveWindow(&arg0->unk300);
            }
        }
    }
    return arg1;
}

void ov44_0222C120(UnkStruct_ov44_022319EC *arg0) {
    PlayerProfile *playerProfile = Save_PlayerData_GetProfile(arg0->saveData);
    String *strPlayerName = PlayerProfile_GetPlayerName_NewString(playerProfile, HEAP_ID_53);
    if (WindowIsInUse(&arg0->unk2E0) == 0) {
        String_Delete(strPlayerName);
        return;
    }
    u32 color;
    FillWindowPixelBuffer(&arg0->unk2E0, 0);
    if (PlayerProfile_GetTrainerGender(playerProfile) == 0) {
        color = MAKE_TEXT_COLOR(5, 6, 0);
    } else {
        color = MAKE_TEXT_COLOR(3, 4, 0);
    }
    AddTextPrinterParameterizedWithColor(&arg0->unk2E0, 0, strPlayerName, 32, 0, 255, color, NULL);
    String_Delete(strPlayerName);
    s32 temp_r0_2 = ov44_02229F00(arg0, &arg0->unk4->unk0);
    s32 temp_r6 = ov44_0223120C(temp_r0_2, &color);
    if (temp_r0_2 == 1) {
        if (ov00_021E6EBC() == -1) {
            ReadMsgDataIntoString(arg0->unk168, temp_r6, arg0->unk170);
        } else {
            s32 temp_r0_3 = sub_0202C090(arg0->unk0, ov00_021E6EBC(), 8);
            if (temp_r0_3 == 0) {
                color = MAKE_TEXT_COLOR(5, 6, 0);
            } else if (temp_r0_3 == 1) {
                color = MAKE_TEXT_COLOR(3, 4, 0);
            }
            CopyU16ArrayToString(arg0->unk170, sub_0202C254(arg0->unk0, ov00_021E6EBC()));
        }
    } else {
        ReadMsgDataIntoString(arg0->unk168, temp_r6, arg0->unk170);
    }
    AddTextPrinterParameterizedWithColor(&arg0->unk2E0, 0, arg0->unk170, 102, 0, 255, color, NULL);
    ov44_0222AC54(arg0->unk15C, &arg0->unkB0C, 1, 2, 1, temp_r0_2);
    s32 var_r0_2;
    if (arg0->unk4->unk0.unk21 != 0) {
        var_r0_2 = 8;
    } else {
        var_r0_2 = 1;
    }
    ov44_0222ABDC(arg0->unk15C, &arg0->unkB0C, 1, 26, 1, var_r0_2, 0);
    ScheduleWindowCopyToVram(&arg0->unk2E0);
}

void ov44_0222C288(struct ListMenu *list, s32 index, u8 onInit) {
    if (onInit == 0) {
        PlaySE(SEQ_SE_DP_SELECT);
    }
}

void ov44_0222C29C(UnkStruct_ov44_022319EC *arg0) {
    if (WindowIsInUse(&arg0->unk2E0) != 0) {
        RemoveWindow(&arg0->unk2E0);
    }
    if (WindowIsInUse(&arg0->unk2F0) != 0) {
        sub_0200E5D4(&arg0->unk2F0, 0);
        RemoveWindow(&arg0->unk2F0);
    }
    AddWindowParameterized(arg0->unk15C, &arg0->unk2E0, 3, 1, 1, 28, 2, 13, 402);
    AddWindowParameterized(arg0->unk15C, &arg0->unk2F0, 1, 1, 1, 28, 2, 13, 417);
    FillWindowPixelBuffer(&arg0->unk2F0, 15);
    ScheduleWindowCopyToVram(&arg0->unk2F0);
    DrawFrameAndWindow1(&arg0->unk2F0, 0, 473, 11);
}

s32 ov44_0222C35C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (IsPaletteFadeFinished() == 0) {
        return arg1;
    }
    if ((sub_020393C8() == 0) && (sub_020392A0() == 0)) {
        return arg1;
    }
    ov00_021E5CBC(&sub_02078D24);
    arg0->unkD68.unk4 = 0;
    NARC *temp_r0 = NARC_New(NARC_a_0_8_8, HEAP_ID_53);
    ov44_0222AB24(arg0->unk15C, &arg0->unkB0C, temp_r0, HEAP_ID_53);
    ov44_0222F8F0(arg0);
    ov44_0222F7BC(arg0);
    BgClearTilemapBufferAndCommit(arg0->unk15C, 3);
    if (arg0->unk14C != NULL) {
        RemoveWindow(&arg0->unk310);
        DestroyListMenu(arg0->unk150, NULL, NULL);
        arg0->unk150 = NULL;
        ListMenuItems_Delete(arg0->unk14C);
        arg0->unk14C = NULL;
    }
    if (ov44_02231BB0(&arg0->unk38C) == 0) {
        s16 var_r4;
        if (arg0->unk4->unk0.unk1C[2] == 0) {
            var_r4 = 0;
        } else {
            var_r4 = 97;
        }
        arg0->unk10BE = sub_0202C318(arg0->unk0);
        ov44_02231A7C(&arg0->unk38C, HEAP_ID_53, temp_r0, arg0->unk15C, var_r4, arg0->unk10BE);
        ov44_0222AA94(arg0, ov44_02231D9C(&arg0->unk38C, var_r4));
    }
    if (ov44_0222F98C(arg0) == 0) {
        ov44_0222F9A0(arg0, temp_r0, HEAP_ID_53);
    }
    ov44_02230060(arg0, HEAP_ID_53);
    ov44_0222F7BC(arg0);
    ov44_0222B870(arg0);
    ov44_0222C29C(arg0);
    ov44_0222F818(arg0, 16);
    sub_02039B58();
    arg0->unk370 = -1;
    NARC_Delete(temp_r0);
    gSystem.screensFlipped = 0;
    GfGfx_SwapDisplay();
    BeginNormalPaletteFade(0, 1, 1, 0, 6, 1, HEAP_ID_53);
    arg0->unk348 = 19;
    sub_020398D4(0, 0);
    return arg1;
}

s32 ov44_0222C4EC(UnkStruct_ov44_022319EC *arg0) {
    if (sub_020390C4() == 1) {
        return 1;
    }
    return 0;
}

s32 ov44_0222C500(UnkStruct_ov44_022319EC *arg0) {
    if (ov00_021E709C() != -1) {
        ov00_021E70B8(arg0->unk4->unk0.unk21);
        return 1;
    }
    return 0;
}

s32 ov44_0222C524(UnkStruct_ov44_022319EC *arg0) {
    int sp8 = ov44_0222B870(arg0);
    int sp4 = 0;
    int sp0 = 0;
    if (memcmp(arg0->unkC, arg0->unk2C, 32) != 0) {
        for (int i = 0; i < 32; i++) {
            int j;
            int var_r2 = 0;
            for (j = 0; j < 32; j++) {
                if (arg0->unkC[j] == arg0->unk2C[i]) {
                    var_r2 = 1;
                    break;
                }
            }
            if ((var_r2 == 0) && (arg0->unk2C[i] != 0)) {
                UnkStruct_ov44_02232B74 *temp_r0 = ov44_0222AAEC(arg0, arg0->unk2C[i]);
                if (temp_r0 != NULL) {
                    ov44_02231E94(&arg0->unk38C, temp_r0);
                    ov44_0222AAC0(arg0, temp_r0);
                    ov44_02230028(arg0, arg0->unk2C[i]);
                    ov44_0222F970(arg0, arg0->unk2C[i], HEAP_ID_53);
                    sp0 = 1;
                }
            }
            var_r2 = 0;
            for (j = 0; j < 32; j++) {
                if (arg0->unkC[i] == arg0->unk2C[j]) {
                    var_r2 = 1;
                    break;
                }
            }
            if (var_r2 == 0 && arg0->unkC[i] != 0) {
                UnkStruct_ov44_02231958 *temp = ov44_02231958(arg0, arg0->unkC[i] - 1);
                UnkStruct_ov44_02232B74 *temp_r0_2 = ov44_02231E08(&arg0->unk38C, temp->unk1C[1], arg0->unkC[i]);
                if (temp_r0_2 != NULL) {
                    ov44_0222FFF4(arg0, arg0->unkC[i], 2);
                    ov44_0222AA94(arg0, temp_r0_2);
                    sp4 = 1;
                } else {
                    ov44_0222FFF4(arg0, arg0->unkC[i], 1);
                    arg0->unkC[i] = 0;
                }
            }
        }
        memcpy(arg0->unk2C, arg0->unkC, 32);
        ov44_02230080(arg0);
        if (sp4 == 1) {
            PlaySE(SEQ_SE_DP_TELE2);
        } else if (sp0 == 1) {
            PlaySE(SEQ_SE_DP_TELE2);
        }
    }
    return sp8;
}

void ov44_0222C658(UnkStruct_ov44_022319EC *arg0, enum HeapID heapID) {
    if (ov44_0222B8E0(arg0) > 0) {
        ov44_02230060(arg0, heapID);
    }
}

void ov44_0222C670(UnkStruct_ov44_022319EC *arg0, enum HeapID heapID) {
    ov44_0222C524(arg0);
    ov44_0222C658(arg0, heapID);
}

s32 ov44_0222C684(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    u32 var_r7 = 0;
    if (IsPaletteFadeFinished() == 0) {
        return arg1;
    }
    if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
        return arg1;
    }
    if (sub_020390C4() == 4) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 18, 0);
        arg0->unk348 = 29;
        ov44_0222F818(arg0, 16);
        sub_02039358();
        return arg1;
    }
    ov44_0222C670(arg0, HEAP_ID_53);
    ov44_0222FBA0(arg0);
    ov44_02232008(&arg0->unk38C);
    if (ov44_02231D98(&arg0->unk38C) == 0) {
        if ((ov00_021E709C() == -1) && (gSystem.newKeys & PAD_BUTTON_X)) {
            if (ov44_0222F8C0(arg0) != 0) {
                ov44_0222F510(arg0, 90, 0);
            } else {
                ov44_0222F510(arg0, 91, 0);
            }
            PlaySE(SEQ_SE_DP_DECIDE);
            ov44_0222C120(arg0);
            arg0->unk348 = 20;
            ov44_0222F950(arg0, HEAP_ID_53);
            return arg1;
        }
        u32 temp_r0 = ov44_0222FA80(arg0, HEAP_ID_53);
        UnkStruct_ov44_02232B74 *temp_r1 = ov44_0222AAEC(arg0, temp_r0);
        if (temp_r0 != 0) {
            if (temp_r1 != NULL) {
                ov44_02231D48(&arg0->unk38C, temp_r1);
            } else {
                ov44_02231D8C(&arg0->unk38C);
            }
        } else {
            ov44_02231D8C(&arg0->unk38C);
        }
    }
    if ((ov44_0222C4EC(arg0) != 0) && (arg0->unk370 != -1)) {
        PlaySE(SEQ_SE_DP_UG_020);
        arg0->unk348 = 48;
        return arg1;
    }
    if ((arg0->unk370 == -1) && (ov00_021E709C() != -1)) {
        arg0->unk370 = ov00_021E709C();
        ov44_0222F780(arg0, arg0->unk370);
        ov44_0222F510(arg0, 76, 0);
        ov00_021E70B8(arg0->unk4->unk0.unk21);
        arg0->unk344 = 0;
    } else if ((arg0->unk370 != -1) && (ov00_021E709C() == -1)) {
        ov00_021E70B8(0);
        ov44_0222F780(arg0, arg0->unk370);
        ov44_0222F510(arg0, 18, 0);
        sub_02039358();
        arg0->unk348 = 27;
        return arg1;
    }
    if ((ov00_021E7080() == 1) && (ov00_021E709C() == -1)) {
        ov00_021E70B8(0);
    }
    u32 r0 = ov44_02229F00(arg0, &arg0->unk4->unk0);
    if (arg0->unk370 == -1) {
        if ((gSystem.newKeys & PAD_BUTTON_B) && (ov44_02229FDC(r0) != 0)) {
            PlaySE(SEQ_SE_DP_DECIDE);
            arg0->unk348 = 39;
            ov44_0222F950(arg0, HEAP_ID_53);
            return arg1;
        }
        var_r7 = ov44_02231BB4(&arg0->unk38C);
        ov44_02232018(&arg0->unk38C);
    }
    switch (var_r7) {
    case 0:
        return arg1;
    case 1:
        PlaySE(SEQ_SE_DP_DECIDE);
        if (ov44_02229FDC(r0) != 0) {
            arg0->unk348 = 39;
        } else {
            arg0->unk34C = 8;
            arg0->unk348 = 57;
            ov44_0222F510(arg0, 25, 1);
        }
        ov44_0222F950(arg0, HEAP_ID_53);
        return arg1;
    case 3:
        PlaySE(SEQ_SE_DP_DECIDE);
        if (ov44_02229FDC(r0) != 0) {
            ov44_02231FCC(&arg0->unk38C);
            arg0->unk348 = 39;
        } else if (r0 == 16 && sub_020392A0() == 1) {
            ov44_02231FCC(&arg0->unk38C);
            arg0->unk348 = 36;
        }
        ov44_0222F950(arg0, HEAP_ID_53);
        return arg1;
    case 2:
        PlaySE(SEQ_SE_DP_DECIDE);
        if (ov44_02229FDC(r0) != 0) {
            arg0->unk348 = 39;
        } else {
            arg0->unk348 = 42;
        }
        ov44_0222F950(arg0, HEAP_ID_53);
        return arg1;
    }
    GF_AssertFail();
    return arg1;
}

s32 ov44_0222C9AC(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (ov44_0222C500(arg0) != 0) {
        arg0->unk348 = 19;
        ov44_022319EC(arg0);
    } else if (TextPrinterCheckActive(arg0->unk180) == 0) {
        arg0->unk348 = 19;
        ov44_022319EC(arg0);
        ov44_0222F7BC(arg0);
    }
    return arg1;
}

s32 ov44_0222C9F4(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    UnkStruct_ov44_02231958 *temp_r0 = ov44_02231958(arg0, arg0->unk382 - 1);
    u8 temp_r4 = temp_r0->unk21;
    u32 temp_r6 = ov44_02229F00(arg0, temp_r0);
    arg0->unk340 -= 1;
    if (arg0->unk340 < 0) {
        arg0->unk348 = 70;
    } else if (sub_020390C4() == 5) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 15, 0);
        arg0->unk348 = 27;
    } else if (sub_020390C4() == 3) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 18, 0);
        arg0->unk348 = 27;
    } else if ((sub_020390C4() == 4) || (sub_02039264() != 0)) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 19, 0);
        arg0->unk348 = 27;
    } else if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
    } else if (temp_r4 == 0) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 16, 0);
        arg0->unk348 = 27;
    } else if (temp_r6 != 16) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 16, 0);
        arg0->unk348 = 27;
    } else if (sub_020390C4() == 1) {
        ov44_0222F7BC(arg0);
        ov44_0222F818(arg0, 1);
        arg0->unk348 = 24;
        sub_0202C4B0(arg0->unk0, arg0->unk382 - 1);
    }
    return arg1;
}

s32 ov44_0222CB34(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    ov44_0222F780(arg0, ov00_021E6EBC());
    ov44_0222F510(arg0, 14, 0);
    ov44_0222F818(arg0, 1);
    arg0->unk348 = 23;
    if (ov00_021E6EBC() != -1) {
        sub_0202C4B0(arg0->unk0, ov00_021E6EBC());
    }
    return arg1;
}

s32 ov44_0222CB7C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
        return arg1;
    }
    if (ov00_021E6EBC() < 0) {
        ov44_0222F510(arg0, 19, 0);
        arg0->unk348 = 27;
        return arg1;
    }
    u32 temp_r0 = ov44_02229F00(arg0, ov44_02231958(arg0, ov00_021E6EBC()));
    if ((temp_r0 != 16) && (temp_r0 != 1)) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 16, 0);
        arg0->unk348 = 27;
        return arg1;
    }
    if (TextPrinterCheckActive(arg0->unk180) == 0) {
        if ((gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) || (System_GetTouchNew() == 1)) {
            ov44_0222F7BC(arg0);
            arg0->unk348 = 24;
        } else {
            ov44_0222CC34(arg0, arg1);
        }
    }
    return arg1;
}

s32 ov44_0222CC34(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (ov00_021E6EBC() < 0) {
        ov44_0222F510(arg0, 19, 0);
        arg0->unk348 = 27;
        return arg1;
    }
    int temp_r4 = ov44_02229F00(arg0, ov44_02231958(arg0, ov00_021E6EBC()));
    ov44_0222C670(arg0, HEAP_ID_53);
    ov44_0222FBA0(arg0);
    if (sub_020390C4() == 5) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 15, 0);
        arg0->unk348 = 27;
    } else if (sub_020390C4() == 3) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 18, 0);
        arg0->unk348 = 27;
    } else if ((sub_020390C4() == 4) || (sub_02039264() != 0)) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 19, 0);
        arg0->unk348 = 27;
    } else if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
    } else if ((temp_r4 != 16) && (temp_r4 != 1)) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 16, 0);
        arg0->unk348 = 27;
    } else if ((gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) || (System_GetTouchNew() == 1)) {
        ov44_0222F510(arg0, 20, 0);
        arg0->unk348 = 25;
    } else if (ov00_021E7078() != 0) {
        ov44_0222ABDC(arg0->unk15C, &arg0->unkB0C, 1, 2, 1, 2, 0);
    } else {
        ov44_0222ABDC(arg0->unk15C, &arg0->unkB0C, 1, 2, 1, 3, 0);
    }
    return arg1;
}

s32 ov44_0222CDAC(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
        return arg1;
    }
    if (TextPrinterCheckActive(arg0->unk180) == 0) {
        if (ov00_021E6EBC() != -1) {
            sub_0202C4B0(arg0->unk0, ov00_021E6EBC());
        }
        if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
            arg0->unk184 = Std_CreateYesNoMenu(arg0->unk15C, &ov44_0223538C, 473, 11, HEAP_ID_53);
        } else {
            arg0->unk188 = ov44_02231A14(arg0->unk15C, &ov44_02235374, 0);
        }
        arg0->unk348 = 26;
    }
    return arg1;
}

s32 ov44_0222CE40(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
        s32 temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk184, HEAP_ID_53);
        if (temp_r0 == -1) {
            if ((sub_020390C4() >= 4) || (sub_02039264() != 0) || (sub_020373B4(0) == 0)) {
                ov44_0222F7BC(arg0);
                ov44_0222F818(arg0, 16);
                Clear2dMenuWindowAndDelete(arg0->unk184, HEAP_ID_53);
                arg0->unk370 = -1;
                arg0->unk35C = 20;
                arg0->unk348 = 65;
            } else if (sub_020393C8() != 0) {
                ov44_0222B9A0(arg0);
            }
            return arg1;
        }
        if (temp_r0 == 0) {
            if (sub_020393C8() == 0) {
                ov44_0222F818(arg0, 16);
                sub_020393B4();
                arg0->unk370 = -1;
                arg0->unk35C = 20;
                arg0->unk348 = 65;
            } else {
                ov44_0222B9A0(arg0);
            }
        } else {
            arg0->unk348 = 24;
        }
    } else {
        enum YesNoResponse yesNoReponse = YesNoPrompt_HandleInput(arg0->unk188);
        if (yesNoReponse == YESNORESPONSE_YES) {
            YesNoPrompt_Destroy(arg0->unk188);
            if (sub_020393C8() == 0) {
                ov44_0222F818(arg0, 16);
                sub_020393B4();
                arg0->unk370 = -1;
                arg0->unk35C = 20;
                arg0->unk348 = 65;
            } else {
                ov44_0222B9A0(arg0);
            }
        } else if (yesNoReponse == YESNORESPONSE_NO) {
            YesNoPrompt_Destroy(arg0->unk188);
            arg0->unk348 = 24;
        } else {
            if ((sub_020390C4() >= 4) || (sub_02039264() != 0) || (sub_020373B4(0) == 0)) {
                ov44_0222F7BC(arg0);
                ov44_0222F818(arg0, 16);
                YesNoPrompt_Destroy(arg0->unk188);
                arg0->unk370 = -1;
                arg0->unk35C = 20;
                arg0->unk348 = 65;
            } else if (sub_020393C8() != 0) {
                ov44_0222B9A0(arg0);
            }
            return arg1;
        }
    }
    ov44_0222F7BC(arg0);
    return arg1;
}

s32 ov44_0222CFE0(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
        return arg1;
    }
    if (ov44_02229F00(arg0, &arg0->unk4->unk0) != 16) {
        ov44_0222F818(arg0, 16);
    }
    if (TextPrinterCheckActive(arg0->unk180) != 0) {
        arg0->unk35C = 30;
        return arg1;
    }
    arg0->unk35C -= 1;
    if ((gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) || (arg0->unk35C == 0) || (System_GetTouchNew() == 1)) {
        ov44_0222F7BC(arg0);
        sub_02039358();
        sub_02039B58();
        if (ov44_02231BB0(&arg0->unk38C) == 0) {
            arg0->unk35C = 20;
            arg0->unk348 = 65;
        } else {
            ov44_0222F8F0(arg0);
            ov44_0222C120(arg0);
            arg0->unk370 = -1;
            arg0->unk348 = 19;
            ov44_022319EC(arg0);
        }
    }
    return arg1;
}

s32 ov44_0222D0A4(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
        return arg1;
    }
    if (TextPrinterCheckActive(arg0->unk180) != 0) {
        return arg1;
    }
    if ((gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) || (System_GetTouchNew() == 1)) {
        ov44_0222F7BC(arg0);
        ov44_0222F818(arg0, 16);
        sub_02039358();
        arg0->unk35C = 20;
        arg0->unk348 = 65;
    }
    return arg1;
}

s32 ov44_0222D10C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
        return arg1;
    }
    if (TextPrinterCheckActive(arg0->unk180) != 0) {
        arg0->unk35C = 30;
        return arg1;
    }
    arg0->unk35C -= 1;
    if ((gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) || (arg0->unk35C == 0) || (System_GetTouchNew() == 1)) {
        ov44_0222F7BC(arg0);
        ov44_0222F818(arg0, 16);
        sub_02039B58();
        if (ov44_02231BB0(&arg0->unk38C) == 0) {
            arg0->unk348 = ov44_0222ADD0();
        } else {
            ov44_0222F8F0(arg0);
            ov44_0222C120(arg0);
            arg0->unk370 = -1;
            arg0->unk348 = 19;
            ov44_022319EC(arg0);
        }
    }
    return arg1;
}

s32 ov44_0222D1BC(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    return arg1;
}

s32 ov44_0222D1C0(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    return arg1;
}

s32 ov44_0222D1C4(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    return arg1;
}

s32 ov44_0222D1C8(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (arg0->unk35C > 0) {
        arg0->unk35C--;
        return arg1;
    }
    if ((gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) || (System_GetTouchNew() == 1)) {
        ov44_0222F510(arg0, 26, 1);
        arg0->unk348 = 59;
        arg0->unk35C = 1;
    }
    return arg1;
}

s32 ov44_0222D214(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    ov44_02232018(&arg0->unk38C);
    ov44_0222F510(arg0, 10, 0);
    arg0->unk348 = 40;
    return arg1;
}

s32 ov44_0222D23C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    ov44_02232018(&arg0->unk38C);
    if (TextPrinterCheckActive(arg0->unk180) == 0) {
        if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
            arg0->unk184 = Std_CreateYesNoMenu(arg0->unk15C, &ov44_0223538C, 473, 11, HEAP_ID_53);
        } else {
            arg0->unk188 = ov44_02231A14(arg0->unk15C, &ov44_02235374, 0);
        }
        arg0->unk348 = 41;
    }
    return arg1;
}

s32 ov44_0222D2B0(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
        s32 var_r5 = Handle2dMenuInput_DeleteOnFinish(arg0->unk184, HEAP_ID_53);
        ov44_02232018(&arg0->unk38C);
        if ((arg0->unk370 == -1) && (ov00_021E709C() != -1)) {
            ov00_021E70B8(arg0->unk4->unk0.unk21);
            if (var_r5 == -1) {
                Clear2dMenuWindowAndDelete(arg0->unk184, HEAP_ID_53);
            }
            var_r5 = 1;
        }
        if (var_r5 == -1) {
            return arg1;
        } else if (var_r5 == 0) {
            ov44_0222F818(arg0, 16);
            sub_02039B58();
            ov44_022319EC(arg0);
        } else {
            ov44_022319EC(arg0);
            ov44_022319BC(arg0, 1);
        }
    } else {
        enum YesNoResponse yesNoResponse = YesNoPrompt_HandleInput(arg0->unk188);
        ov44_02232018(&arg0->unk38C);
        if ((arg0->unk370 == -1) && (ov00_021E709C() != -1)) {
            ov00_021E70B8(arg0->unk4->unk0.unk21);
            yesNoResponse = YESNORESPONSE_NO;
        }
        if (yesNoResponse == YESNORESPONSE_YES) {
            YesNoPrompt_Destroy(arg0->unk188);
            ov44_0222F818(arg0, 16);
            sub_02039B58();
            ov44_022319EC(arg0);
        } else if (yesNoResponse == YESNORESPONSE_NO) {
            YesNoPrompt_Destroy(arg0->unk188);
            ov44_022319EC(arg0);
            ov44_022319BC(arg0, 1);
        } else {
            return arg1;
        }
    }
    arg0->unk348 = 19;
    return arg1;
}

s32 ov44_0222D3DC(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    s32 listLen = 3;
    ListMenuTemplate listMenuTemplate = ov44_022366FC;
    UnkStruct_ov44_0222DD64 *listMenuItems = ov44_0223671C;

    if (ov44_02229EF8(arg0) == 1) {
        listLen++;
        listMenuTemplate.totalItems++;
        listMenuTemplate.maxShowed++;

        s32 index = listLen - 1;
        listMenuItems[index] = _02236660[0];
    }
    if (ov44_02229EE0(arg0) == 1) {
        listLen++;
        listMenuTemplate.totalItems++;
        listMenuTemplate.maxShowed++;

        s32 index = listLen - 1;
        listMenuItems[index] = _02236660[3];
    }
    if (ov44_02229EFC(arg0) == 1) {
        listLen++;
        listMenuTemplate.totalItems++;
        listMenuTemplate.maxShowed++;

        s32 index = listLen - 1;
        listMenuItems[index] = _02236660[1];
    }
    listMenuTemplate.totalItems++;
    listMenuTemplate.maxShowed++;
    listMenuItems[listLen] = _02236660[2];
    arg0->unk154 = ListMenuItems_New(listLen + 1, HEAP_ID_53);

    for (s32 i = 0; i < listLen + 1; i++) {
        ListMenuItems_AppendFromMsgData(arg0->unk154, arg0->unk168, listMenuItems[i].strno, listMenuItems[i].value);
    }
    if (WindowIsInUse(&arg0->unk320) != 0) {
        sub_0200E5D4(&arg0->unk320, 0);
        RemoveWindow(&arg0->unk320);
    }
    s32 height = (listLen + 1) * 2;
    AddWindowParameterized(arg0->unk15C, &arg0->unk320, 2, 16, 3, 15, height, 13, 59 - height);
    DrawFrameAndWindow1(&arg0->unk320, 1, 473, 11);
    listMenuTemplate.items = arg0->unk154;
    listMenuTemplate.window = &arg0->unk320;
    arg0->unk158 = ListMenuInit(&listMenuTemplate, 0, arg0->unk374, HEAP_ID_53);
    ScheduleWindowCopyToVram(&arg0->unk320);
    ov44_0222F510(arg0, 8, 0);
    ov44_02232018(&arg0->unk38C);
    arg0->unk348 = 37;
    return arg1;
}

s32 ov44_0222D594(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    s32 sp0 = ov44_0222A168(arg0);
    s32 temp_r6 = ov44_0222E02C(arg0);
    ov44_02232018(&arg0->unk38C);
    if (sub_020393C8() != 0) {
        sub_0200E5D4(&arg0->unk320, 0);
        RemoveWindow(&arg0->unk320);
        DestroyListMenu(arg0->unk158, NULL, &arg0->unk374);
        ListMenuItems_Delete(arg0->unk154);
        ov44_0222F7BC(arg0);
        ov44_0222B9A0(arg0);
        return arg1;
    }
    if (TextPrinterCheckActive(arg0->unk180) != 0) {
        if (ov44_0222C500(arg0) != 0) {
            arg0->unk348 = 19;
            sub_0200E5D4(&arg0->unk320, 0);
            RemoveWindow(&arg0->unk320);
            DestroyListMenu(arg0->unk158, NULL, &arg0->unk374);
            ListMenuItems_Delete(arg0->unk154);
            ov44_0222F7BC(arg0);
        }
        return arg1;
    }
    s32 var_r4 = ListMenu_ProcessInput(arg0->unk158);
    if (ov44_0222C500(arg0) != 0) {
        var_r4 = -2;
    }
    switch (var_r4) {
    case -1:
        return arg1;
    case -2:
        arg0->unk348 = 19;
        ov44_0222F7BC(arg0);
        PlaySE(SEQ_SE_DP_DECIDE);
        break;
    default:
        PlaySE(SEQ_SE_DP_DECIDE);
        if ((var_r4 == 19) && (temp_r6 != 0)) {
            if (temp_r6 == 1) {
                ov44_0222F510(arg0, 104, 0);
            } else if (temp_r6 == 3) {
                ov44_0222F510(arg0, 106, 0);
            } else {
                ov44_0222F510(arg0, 105, 0);
            }
            arg0->unk348 = 29;
        } else if ((var_r4 == 15) && (sp0 < 2)) {
            ov44_0222F510(arg0, 89, 0);
            arg0->unk348 = 29;
        } else if ((var_r4 == 1) && (sp0 < 2)) {
            ov44_0222F510(arg0, 103, 0);
            arg0->unk348 = 29;
        } else if ((var_r4 == 0) || (var_r4 == 1) || (var_r4 == 29)) {
            sub_0200E5D4(&arg0->unk320, 0);
            RemoveWindow(&arg0->unk320);
            DestroyListMenu(arg0->unk158, NULL, &arg0->unk374);
            ListMenuItems_Delete(arg0->unk154);
            ov44_0222D8B0(arg0, var_r4);
            arg0->unk348 = 38;
            return arg1;
        } else {
            ov44_0222F818(arg0, var_r4);
            arg0->unk348 = 19;
            ov44_0222F7BC(arg0);
        }
        s32 var_r6 = 1;
        if ((ov44_02229F44(var_r4) != 0) && (arg0->unk348 == 19)) {
            arg0->unk348 = 68;
            ov44_0223197C(arg0, -1, var_r4);
            ov44_0222A1B4(var_r4);
            ov44_0222F818(arg0, var_r4);
            arg0->unk34C = ov44_02229F74(var_r4);
            var_r6 = 0;
        } else {
            ov44_0223197C(arg0, -1, var_r4);
            ov44_0222A1B4(var_r4);
        }
        if (arg0->unk348 == 19) {
            ov44_022319BC(arg0, var_r6);
        }
    }

    sub_0200E5D4(&arg0->unk320, 0);
    RemoveWindow(&arg0->unk320);
    DestroyListMenu(arg0->unk158, NULL, &arg0->unk374);
    ListMenuItems_Delete(arg0->unk154);
    return arg1;
}

s32 ov44_0222D824(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
        return arg1;
    }
    ov44_02232018(&arg0->unk38C);
    if (ov44_0222C500(arg0) != 0) {
        arg0->unk348 = 19;
    }
    if (sub_020392A0() != 0) {
        sub_020398D4(0, 1);
        sub_020378E4(0);
        BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, HEAP_ID_53);
        arg0->unk384 = 0;
        sub_02034354(arg0->saveData, 0);
        sub_02034434();
        sub_0203476C(sub_0203769C());
        arg1 = 2;
    }
    return arg1;
}

s32 ov44_0222D8B0(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    ListMenuTemplate listMenuTemplate;
    UnkStruct_ov44_0222DD64 *listMenuItems;
    s32 listLen;
    switch (arg1) {
    case 0:
        arg0->unk37C = 1;
        listMenuItems = ov44_022366BC;
        listLen = NELEMS(ov44_022366BC);
        listMenuTemplate = ov44_02235508;
        break;
    case 1:
        arg0->unk37C = 0;
        listMenuItems = ov44_022366DC;
        listLen = NELEMS(ov44_022366DC);
        listMenuTemplate = ov44_02235508;
        break;
    case 29:
        listMenuItems = ov44_0223669C;
        listLen = NELEMS(ov44_0223669C);
        listMenuTemplate = ov44_02235528;
        arg0->unk37C = 2;
        break;
    }
    arg0->unk154 = ListMenuItems_New(listLen, HEAP_ID_53);
    for (s32 i = 0; i < listLen; i++) {
        if (listMenuItems[i].strno != 71) {
            ListMenuItems_AppendFromMsgData(arg0->unk154, arg0->unk168, listMenuItems[i].strno, listMenuItems[i].value);
        } else {
            BufferWiFiPlazaActivityName(arg0->unk164, 0, i);
            ReadMsgDataIntoString(arg0->unk168, listMenuItems[i].strno, arg0->unk170);
            StringExpandPlaceholders(arg0->unk164, arg0->unk178, arg0->unk170);
            ListMenuItems_AddItem(arg0->unk154, arg0->unk178, listMenuItems[i].value);
        }
    }
    if (WindowIsInUse(&arg0->unk320) != 0) {
        sub_0200E5D4(&arg0->unk320, 0);
        RemoveWindow(&arg0->unk320);
    }
    u32 temp_r0 = listLen * 2;
    AddWindowParameterized(arg0->unk15C, &arg0->unk320, 2, 16, 9, 15, temp_r0, 13, (59 - temp_r0));
    DrawFrameAndWindow1(&arg0->unk320, 1, 473, 11);
    listMenuTemplate.items = arg0->unk154;
    listMenuTemplate.window = &arg0->unk320;
    arg0->unk158 = ListMenuInit(&listMenuTemplate, 0, (&arg0->unk376)[arg0->unk37C], HEAP_ID_53);
    ScheduleWindowCopyToVram(&arg0->unk320);
    return 1;
}

s32 ov44_0222DA64(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    ov44_02232018(&arg0->unk38C);
    if (sub_020393C8() != 0) {
        sub_0200E5D4(&arg0->unk320, 0);
        RemoveWindow(&arg0->unk320);
        DestroyListMenu(arg0->unk158, 0, &arg0->unk376 + arg0->unk37C);
        ListMenuItems_Delete(arg0->unk154);
        ov44_0222F7BC(arg0);
        ov44_0222B9A0(arg0);
        return arg1;
    }
    if (ov44_0222C500(arg0) != 0) {
        arg0->unk348 = 19;
        sub_0200E5D4(&arg0->unk320, 0);
        RemoveWindow(&arg0->unk320);
        DestroyListMenu(arg0->unk158, 0, &arg0->unk376 + arg0->unk37C);
        ListMenuItems_Delete(arg0->unk154);
        ov44_0222F7BC(arg0);
        return arg1;
    }
    if (TextPrinterCheckActive(arg0->unk180) != 0) {
        return arg1;
    }
    s32 temp_r0 = ListMenu_ProcessInput(arg0->unk158);
    switch (temp_r0) {
    case -1:
        return arg1;
    case -2:
        PlaySE(SEQ_SE_DP_DECIDE);
        arg0->unk348 = 36;
        break;
    default:
        PlaySE(SEQ_SE_DP_DECIDE);
        ov44_0222F818(arg0, temp_r0);
        arg0->unk348 = 19;
        ov44_0222F7BC(arg0);
    }
    if (arg0->unk348 == 19) {
        s32 var_r7 = 1;
        if (ov44_02229F44(temp_r0) != 0) {
            arg0->unk348 = 68;
            ov44_0223197C(arg0, -1, temp_r0);
            ov44_0222A1B4(temp_r0);
            ov44_0222F818(arg0, temp_r0);
            arg0->unk34C = ov44_02229F74(temp_r0);
            var_r7 = 0;
        } else {
            ov44_0223197C(arg0, -1, temp_r0);
            sub_02039B7C();
        }
        ov44_022319BC(arg0, var_r7);
    }
    sub_0200E5D4(&arg0->unk320, 0);
    RemoveWindow(&arg0->unk320);
    DestroyListMenu(arg0->unk158, 0, &arg0->unk376 + arg0->unk37C);
    ListMenuItems_Delete(arg0->unk154);
    return arg1;
}

s32 ov44_0222DC18(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    u8 temp_r5 = ov44_02231C70(&arg0->unk38C);
    UnkStruct_ov44_02232B74 *temp_r0 = ov44_0222AAEC(arg0, 0);
    GF_ASSERT(temp_r0 != 0);
    UnkStruct_ov44_02232B74 *temp_r0_2 = ov44_0222AAEC(arg0, temp_r5);
    if (temp_r0_2 == 0) {
        ov44_0222F780(arg0, temp_r5 - 1);
        ov44_0222F510(arg0, 16, 0);
        arg0->unk348 = 29;
        return arg1;
    }
    ov44_02231F14(&arg0->unk38C, temp_r0_2, ov44_02231F04(temp_r0));
    u32 temp_r7 = temp_r5 - 1;
    u16 temp_r5_2 = ov44_02229F00(arg0, ov44_02231958(arg0, temp_r7));
    arg0->unk37E = temp_r5_2;
    ov44_0222F780(arg0, temp_r7);
    s32 var_r1 = 0;

    if (temp_r5_2 == 15) {
        var_r1 = 3;
    } else if (temp_r5_2 == 19) {
        var_r1 = 4;
    } else if (temp_r5_2 == 18) {
        var_r1 = 83;
    } else if (temp_r5_2 == 21) {
        var_r1 = 5;
    } else if (temp_r5_2 == 20) {
        var_r1 = 84;
    } else if (temp_r5_2 == 23) {
        BufferWiFiPlazaActivityName(arg0->unk164, 1, 0);
        var_r1 = 6;
    } else if (temp_r5_2 == 22) {
        var_r1 = 85;
    } else if (temp_r5_2 == 25) {
        BufferWiFiPlazaActivityName(arg0->unk164, 1, 1);
        var_r1 = 6;
    } else if (temp_r5_2 == 24) {
        var_r1 = 85;
    } else if (temp_r5_2 == 27) {
        BufferWiFiPlazaActivityName(arg0->unk164, 1, 2);
        var_r1 = 6;
    } else if (temp_r5_2 == 26) {
        var_r1 = 85;
    } else {
        if (ov44_02229FB4(temp_r5_2) != 0) {
            var_r1 = 2;
        } else if (temp_r5_2 == 8) {
            var_r1 = 82;
        } else if (ov44_0222A020(temp_r5_2) != 0) {
            var_r1 = 81;
        } else if (temp_r5_2 == 1) {
            var_r1 = 86;
        } else {
            var_r1 = 7;
        }
    }
    ov44_0222F510(arg0, var_r1, 0);
    arg0->unk348 = 43;
    return arg1;
}

s32 ov44_0222DD64(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    s32 i;
    if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
        return arg1;
    }
    s32 temp_r0 = ov44_02231C70(&arg0->unk38C);
    UnkStruct_ov44_02232B74 *temp_r6 = ov44_0222AAEC(arg0, temp_r0);
    if (ov44_0222C500(arg0) != 0) {
        ov44_02231F88(&arg0->unk38C, temp_r6);
        ov44_0222F7BC(arg0);
        arg0->unk348 = 19;
        return arg1;
    }
    if (temp_r6 == 0) {
        ov44_02231F88(&arg0->unk38C, temp_r6);
        DestroyListMenu(arg0->unk158, 0, 0);
        ov44_0222F780(arg0, temp_r0 - 1);
        ov44_0222F510(arg0, 16, 0);
        arg0->unk348 = 29;
        return arg1;
    }
    if (arg0->unk37E != ov44_02229F00(arg0, ov44_02231958(arg0, temp_r0 - 1))) {
        ov44_02231F88(&arg0->unk38C, temp_r6);
        ov44_0222F780(arg0, temp_r0 - 1);
        ov44_0222F510(arg0, 16, 0);
        arg0->unk348 = 29;
        return arg1;
    }
    if (TextPrinterCheckActive(arg0->unk180) != 0) {
        return arg1;
    }
    s32 sp1C = 2;
    ListMenuTemplate listMenuTemplate = ov44_022354C8;
    const UnkStruct_ov44_0222DD64 *listMenuItems = ov44_022353A0;
    UnkStruct_ov44_02231958 *r6 = ov44_02231958(arg0, ov44_02231C70(&arg0->unk38C) - 1);
    u16 temp_r4 = ov44_02229F00(arg0, r6);
    u8 r1 = r6->unk21;
    arg0->unk380 = r1;
    u16 val = r1 + arg0->unk4->unk0.unk21;
    arg0->unk154 = ListMenuItems_New(2, HEAP_ID_53);

    for (i = 0; i < NELEMS(ov44_022353A0); i++) {
        if (i == 0) {
            if ((ov44_0222A048(temp_r4) != 0) || (temp_r4 == 0) || (temp_r4 == 28) || (temp_r4 >= 29)) {
                listMenuTemplate.maxShowed--;
                listMenuTemplate.totalItems--;
                sp1C -= 1;
            } else if (temp_r4 == 16) {
                if (val == 2) {
                    ListMenuItems_AppendFromMsgData(arg0->unk154, arg0->unk168, 36, listMenuItems[i].value);
                } else {
                    listMenuTemplate.maxShowed--;
                    listMenuTemplate.totalItems--;
                    sp1C -= 1;
                }
            } else {
                ListMenuItems_AppendFromMsgData(arg0->unk154, arg0->unk168, listMenuItems[i].strno, listMenuItems[i].value);
            }
        } else {
            ListMenuItems_AppendFromMsgData(arg0->unk154, arg0->unk168, listMenuItems[i].strno, listMenuItems[i].value);
        }
    }
    AddWindowParameterized(arg0->unk15C, &arg0->unk320, 2, 16, (((3 - sp1C) * 2) + 11), 15, (sp1C * 2), 13, 59);
    DrawFrameAndWindow1(&arg0->unk320, 1, 473, 11);
    listMenuTemplate.items = arg0->unk154; // itemPrintFunc
    listMenuTemplate.window = &arg0->unk320;
    arg0->unk158 = ListMenuInit(&listMenuTemplate, 0, 0, HEAP_ID_53);
    ScheduleWindowCopyToVram(&arg0->unk320);
    arg0->unk348 = 44;
    return arg1;
}

s32 ov44_0222DFEC(UnkStruct_ov44_02231958 *arg0) {
    for (s32 i = 0; i < 6; i++) {
        if (arg0->unk0[i] == 495) {
            return 0;
        }
        if (arg0->unk0[i] > 495) {
            return 0;
        }
        if (arg0->unkC[i] > 536) {
            return 0;
        }
    }
    return 1;
}

s32 ov44_0222E02C(UnkStruct_ov44_022319EC *arg0) {
    return 3;
}

void ov44_0222E030(void) {
    ov00_021E70B8(0);
    if (ov44_0222E074() == FALSE) {
        IsNighttime();
        Sound_SetScene(0);
        Sound_SetSceneAndPlayBGM(11, SEQ_GS_POKESEN, 1);
        return;
    }
    u16 bgm = GF_GetCurrentPlayingBGM();
    GF_GetCurrentPlayingBGM();
    GF_SetVolumeBySeqNo(bgm, GF_GetVolumeBySeqNo());
}

BOOL ov44_0222E074(void) {
    u16 bgm = GF_GetCurrentPlayingBGM();
    if ((bgm != SEQ_GS_POKESEN) && (bgm != SEQ_GS_POKESEN)) {
        return FALSE;
    }
    return TRUE;
}

s32 ov44_0222E090(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    s32 var_r6 = 0;
    s32 var_r7 = ListMenu_ProcessInput(arg0->unk158);
    if (ov44_0222C500(arg0) != 0) {
        var_r7 = -2;
    }
    s32 temp_r0 = ov44_02231C70(&arg0->unk38C);
    UnkStruct_ov44_02232B74 *sp14 = ov44_0222AAEC(arg0, temp_r0);
    if (sub_020393C8() != 0) {
        sub_0200E5D4(&arg0->unk320, 0);
        RemoveWindow(&arg0->unk320);
        DestroyListMenu(arg0->unk158, 0, NULL);
        ListMenuItems_Delete(arg0->unk154);
        if (sp14 != 0) {
            ov44_02231F88(&arg0->unk38C, sp14);
        }
        ov44_0222B9A0(arg0);
        return arg1;
    }
    switch (var_r7) {
    case -1:
        if (sp14 == 0) {
            DestroyListMenu(arg0->unk158, 0, NULL);
            ov44_0222F780(arg0, temp_r0 - 1);
            ov44_0222F510(arg0, 16, 0);
            arg0->unk348 = 29;
            var_r6 = 1;
            break;
        } else {
            UnkStruct_ov44_02231958 *temp_r0_2 = ov44_02231958(arg0, temp_r0 - 1);
            u32 r0 = ov44_02229F00(arg0, temp_r0_2);
            u8 r6 = temp_r0_2->unk21;
            if ((arg0->unk37E != r0) || ((ov44_02229F44(r0) == 0) && (arg0->unk380 != r6))) {
                ov44_0222F780(arg0, temp_r0 - 1);
                ov44_0222F510(arg0, 16, 0);
                arg0->unk348 = 29;
                var_r6 = 1;
                break;
            }
            return arg1;
        }
    case -2:
        PlaySE(SEQ_SE_DP_DECIDE);
        arg0->unk348 = 19;
        break;
    default:
        PlaySE(SEQ_SE_DP_DECIDE);
        if (var_r7 == 1) {
            arg0->unk348 = 19;
            arg0->unk382 = temp_r0;
            if (temp_r0 == 0) {
                break;
            } else {
                s32 sp10 = ov44_0222A168(arg0);
                s32 spC = ov44_0222E02C(arg0);
                UnkStruct_ov44_02231958 *sp8 = ov44_02231958(arg0, temp_r0 - 1);
                u32 temp_r7 = ov44_02229F00(arg0, sp8);
                s32 sp4 = sp8->unk21;
                if ((arg0->unk37E != temp_r7) || ((ov44_02229F44(temp_r7) == 0) && (arg0->unk380 != sp4))) {
                    ov44_0222F780(arg0, temp_r0 - 1);
                    ov44_0222F510(arg0, 16, 0);
                    arg0->unk348 = 29;
                    var_r6 = 1;
                } else if (ov44_0222DFEC(sp8) == 0) {
                    ov44_0222F780(arg0, temp_r0 - 1);
                    ov44_0222F510(arg0, 16, 0);
                    arg0->unk348 = 29;
                    var_r6 = 1;
                } else if ((ov44_0222A090(temp_r7) != 0) && (sp10 < 2)) {
                    if (temp_r7 == 15) {
                        ov44_0222F510(arg0, 89, 0);
                    } else {
                        ov44_0222F510(arg0, 103, 0);
                    }
                    arg0->unk348 = 29;
                    var_r6 = 1;
                } else if ((temp_r7 == 19) && (spC != 0)) {
                    if (spC == 1) {
                        ov44_0222F510(arg0, 104, 0);
                    } else if (spC == 3) {
                        ov44_0222F510(arg0, 106, 0);
                    } else {
                        ov44_0222F510(arg0, 105, 0);
                    }
                    arg0->unk348 = 29;
                    var_r6 = 1;
                } else if ((ov44_02229F44(temp_r7) == 0) && (sp4 != arg0->unk4->unk0.unk21)) {
                    if (sp4 != 0) {
                        ov44_0222F510(arg0, 134, 0);
                    } else {
                        ov44_0222F510(arg0, 135, 0);
                    }
                    ov44_0222F818(arg0, ov44_0222A0B4(temp_r7));
                    arg0->unk348 = 63;
                    var_r6 = 1;
                } else {
                    u32 temp_r0_3 = ov44_0222A0B4(temp_r7);
                    if (temp_r0_3 != 29) {
                        if (ov44_02231974(temp_r0 - 1) == 6) {
                            if (ov44_0223197C(arg0, temp_r0 - 1, temp_r0_3) != 0) {
                                arg0->unk340 = 1800;
                                ov44_0222A1B4(temp_r0_3);
                                ov44_0222F818(arg0, temp_r0_3);
                                ov44_0222F780(arg0, temp_r0 - 1);
                                ov44_0222F510(arg0, 17, 0);
                                GF_ASSERT(arg0->unk18C == NULL);
                                arg0->unk18C = WaitingIcon_New(&arg0->unk2D0, 482);
                                if (temp_r0_3 != 1) {
                                    arg0->unk348 = 45;

                                } else {
                                    arg0->unk340 = 1800;
                                    arg0->unk348 = 21;
                                }
                                var_r6 = 1;
                            } else {
                                ov44_0222F780(arg0, temp_r0 - 1);
                                ov44_0222F510(arg0, 16, 0);
                                arg0->unk348 = 29;
                                var_r6 = 1;
                            }
                        } else {
                            ov44_0222F780(arg0, temp_r0 - 1);
                            ov44_0222F510(arg0, 16, 0);
                            arg0->unk348 = 29;
                            var_r6 = 1;
                        }
                    }
                }
            }
            break;
        }
        if (var_r7 == 2) {
            arg0->unk348 = 54;
            break;
        }
    }
    if (var_r6 == 0) {
        ov44_0222F7BC(arg0);
    }
    sub_0200E5D4(&arg0->unk320, 0);
    RemoveWindow(&arg0->unk320);
    DestroyListMenu(arg0->unk158, 0, NULL);
    ListMenuItems_Delete(arg0->unk154);
    if (sp14 != 0) {
        ov44_02231F88(&arg0->unk38C, sp14);
    }
    return arg1;
}

s32 ov44_0222E45C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    arg0->unk340 -= 1;
    if (arg0->unk340 < 0) {
        arg0->unk348 = 70;
    } else if (sub_020390C4() == 3) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 18, 0);
        arg0->unk348 = 27;
    } else if (sub_020390C4() == 5) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 15, 0);
        arg0->unk348 = 27;
    } else if ((sub_020390C4() == 4) || (sub_02039264() != 0)) {
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 18, 0);
        arg0->unk348 = 27;
    } else if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
    } else if (sub_020390C4() == 1) {
        u32 temp_r6 = ov44_02229F00(arg0, &arg0->unk4->unk0);
        if (ov44_02229F44(temp_r6) == 0) {
            arg0->unk348 = 49;
            ov44_0222F7BC(arg0);
            sub_02034354(arg0->saveData, 0);
            arg0->unk35C = 30;
        } else if (sub_020373B4(0) == 1) {
            ov44_0222F7BC(arg0);
            sub_02034354(arg0->saveData, 0);
            sub_020398D4(0, 1);
            ov44_0222A1B4(temp_r6);
            arg0->unk34C = ov44_02229F74(temp_r6);
            sub_020378E4(0);
            BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, HEAP_ID_53);
            arg0->unk384 = 0;
            arg1 = 2;
        } else if (sub_02037880() == 1) {
            ov44_0222F780(arg0, ov00_021E6EBC());
            ov44_0222F510(arg0, 18, 0);
            arg0->unk348 = 27;
        }
    }
    return arg1;
}

s32 ov44_0222E5D8(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    return arg1;
}

s32 ov44_0222E5DC(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    return arg1;
}

s32 ov44_0222E5E0(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
        return arg1;
    }
    ov44_0222F8F0(arg0);
    ov44_0222F818(arg0, 16);
    sub_02039358();
    arg0->unk370 = -1;
    arg0->unk348 = 19;
    ov44_022319EC(arg0);
    ov44_0222F7BC(arg0);
    return arg1;
}

s32 ov44_0222E62C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    return arg1;
}

s32 ov44_0222E630(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    return arg1;
}

s32 ov44_0222E634(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    UnkStruct_ov44_02231958 *temp_r7 = ov44_02231958(arg0, ov00_021E6EBC());
    u32 temp_r4 = ov44_02229F00(arg0, &arg0->unk4->unk0);
    u32 temp_r0 = ov44_02229F00(arg0, temp_r7);

    s32 r1 = arg0->unk4->unk0.unk21;
    if (temp_r4 == 12 && temp_r0 == 5) {
        arg0->unk348 = 49;
    } else if (temp_r4 == 13 && temp_r0 == 6) {
        arg0->unk348 = 49;
    } else if (temp_r4 == 14 && temp_r0 == 7) {
        arg0->unk348 = 49;
    } else if (temp_r4 == 9 && temp_r0 == 2) {
        arg0->unk348 = 49;
    } else if (temp_r4 == 10 && temp_r0 == 3) {
        arg0->unk348 = 49;
    } else if (temp_r4 == 11 && temp_r0 == 4) {
        arg0->unk348 = 49;
    } else if (temp_r4 == 15 && temp_r0 == 8) {
        arg0->unk348 = 49;
    } else if (temp_r4 == 19 && temp_r0 == 18) {
        arg0->unk348 = 49;
    } else if (temp_r4 == 21 && temp_r0 == 20) {
        arg0->unk348 = 49;
    } else if (temp_r4 == 23 && temp_r0 == 22) {
        arg0->unk348 = 49;
    } else if (temp_r4 == 25 && temp_r0 == 24) {
        arg0->unk348 = 49;
    } else if (temp_r4 == 27 && temp_r0 == 26) {
        arg0->unk348 = 49;
    } else if (temp_r4 == 16 && temp_r0 == 1 && r1 > 0) {
        arg0->unk348 = 22;
        return arg1;
    } else {
        if (sub_020393C8() != 0) {
            ov44_0222B9A0(arg0);
            return arg1;
        }
        ov44_0222F780(arg0, ov00_021E6EBC());
        ov44_0222F510(arg0, 18, 0);
        arg0->unk348 = 29;
        ov44_0222F818(arg0, 16);
        sub_02039358();
        return arg1;
    }
    ov44_0222F780(arg0, ov00_021E6EBC());
    ov44_0222F510(arg0, 11, 0);
    sub_02034354(arg0->saveData, 0);
    arg0->unk348 = 49;
    arg0->unk35C = 30;
    return arg1;
}

s32 ov44_0222E7C4(UnkStruct_ov44_022319EC *arg0) {
    if (sub_020390C4() >= 3) {
        ov44_0222F780(arg0, arg0->unk370);
        ov44_0222F510(arg0, 18, 0);
        arg0->unk348 = 27;
    } else if (sub_020393C8() != 0) {
        ov44_0222B9A0(arg0);
    } else {
        UnkStruct_ov44_02231958 *temp_r6 = ov44_02231958(arg0, ov00_021E6EBC());
        u32 temp_r4 = ov44_02229F00(arg0, &arg0->unk4->unk0);
        u32 temp_r0 = ov44_02229F00(arg0, temp_r6);
        if ((temp_r4 != ov44_0222A0B4(temp_r0)) && (temp_r4 != temp_r0)) {
            ov44_0222F780(arg0, ov00_021E6EBC());
            ov44_0222F510(arg0, 16, 0);
            arg0->unk348 = 27;

        } else {
            return 0;
        }
    }
    arg0->unk384 = 0;
    return 1;
}

s32 ov44_0222E860(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if ((sub_020390C4() >= 4) || (sub_02039264() != 0) || (sub_020373B4(0) == 0)) {
        if (arg0->unk384 != 0) {
            ov44_0222F510(arg0, 101, 0);
        } else {
            ov44_0222F780(arg0, arg0->unk370);
            ov44_0222F510(arg0, 18, 0);
        }
        arg0->unk384 = 0;
        arg0->unk348 = 27;
    } else if (ov44_0222E7C4(arg0) == 0) {
        u32 temp_r1 = arg0->unk35C;
        if (temp_r1 == 0) {
            if (sub_02037B38(13) != 0) {
                sub_02037BEC();
                sub_02037AC0(14);
                arg0->unk384 = 0;
                arg0->unk348 = 50;
            }
        } else {
            arg0->unk35C = temp_r1 - 1;
            if (arg0->unk35C == 0) {
                sub_02037AC0(13);
            }
        }
    }
    return arg1;
}

s32 ov44_0222E908(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if ((ov44_0222E7C4(arg0) == 0) && (sub_02037B38(14) != 0)) {
        u16 r1 = ov44_02229F00(arg0, &arg0->unk4->unk0);
        if (sub_02037C0C(sub_0203769C(), &r1) != 0) {
            arg0->unk348 = 51;
        }
    }
    return arg1;
}

s32 ov44_0222E948(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    s32 var_r0;
    if (sub_0203769C() == 0) {
        var_r0 = 1;
    } else {
        var_r0 = 0;
    }
    u16 *temp_r4 = sub_02037C44(var_r0);
    if ((ov44_0222E7C4(arg0) == 0) && (temp_r4 != NULL)) {
        u16 temp_r6 = ov44_02229F00(arg0, &arg0->unk4->unk0);
        u16 r0 = ov44_0222A0B4(temp_r6);
        if ((temp_r4[0] == r0) || (temp_r4[0] == temp_r6)) {
            sub_02037AC0(15);
            arg0->unk348 = 52;
        } else {
            ov44_0222F780(arg0, ov00_021E6EBC());
            ov44_0222F510(arg0, 16, 0);
            arg0->unk348 = 27;
        }
    }
    return arg1;
}

s32 ov44_0222E9C4(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if ((ov44_0222E7C4(arg0) == 0) && (sub_02037B38(15) != 0)) {
        sub_02034434();
        sub_020398D4(1, 1);
        sub_02037AC0(18);
        arg0->unk348 = 53;
    }
    return arg1;
}

s32 ov44_0222E9FC(UnkStruct_ov44_022319EC *arg0) {
    if (TextPrinterCheckActive(arg0->unk180) == 0) {
        return 1;
    }
    if (WindowIsInUse(&arg0->unk2D0) == 0) {
        return 1;
    }
    return 0;
}

s32 ov44_0222EA2C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    ListMenuTemplate spC; // Unknown struct of size 0x20
    if ((ov44_0222E7C4(arg0) == 0) && (sub_02037B38(18) != 0) && (ov44_0222E9FC(arg0) == 1)) {
        sub_0203A1C4(arg0->saveData, &spC, HEAP_ID_53);
        ov44_0222F7BC(arg0);
        u32 temp_r0 = ov44_02229F00(arg0, ov44_02231958(arg0, ov00_021E6EBC()));
        u32 var_r1 = temp_r0;
        if ((var_r1 == 15) || (var_r1 == 8)) {
            var_r1 = 8;
            arg0->unk34C = 7;
        } else if (temp_r0 - 18 <= 1) {
            var_r1 = 18;
            arg0->unk34C = 11;
        } else if (var_r1 - 20 <= 1) {
            var_r1 = 20;
            arg0->unk34C = 12;
        } else if (var_r1 - 22 <= 1) {
            var_r1 = 22;
            arg0->unk34C = 13;
        } else if (var_r1 - 24 <= 1) {
            var_r1 = 24;
            arg0->unk34C = 14;
        } else if (var_r1 - 26 <= 1) {
            var_r1 = 26;
            arg0->unk34C = 15;
        } else if (var_r1 == 9 || var_r1 == 2) {
            var_r1 = 2;
            arg0->unk34C = 1;
        } else if (var_r1 == 10 || var_r1 == 3) {
            var_r1 = 3;
            arg0->unk34C = 2;
        } else if (var_r1 == 11 || var_r1 == 4) {
            var_r1 = 4;
            arg0->unk34C = 3;
        } else if (var_r1 == 12 || var_r1 == 5) {
            var_r1 = 5;
            arg0->unk34C = 4;
        } else if (var_r1 == 13 || var_r1 == 6) {
            var_r1 = 6;
            arg0->unk34C = 5;
        } else if (var_r1 == 14 || var_r1 == 7) {
            var_r1 = 7;
            arg0->unk34C = 6;
        }
        ov44_0222F818(arg0, var_r1);
        BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, HEAP_ID_53);
        arg1 = 2;
    }
    return arg1;
}

s32 ov44_0222EB90(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    BgClearTilemapBufferAndCommit(arg0->unk15C, 3);
    arg0->unk364 = 0;
    arg0->unk348 = ov44_0222ADD0();
    return arg1;
}

s32 ov44_0222EBB8(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    arg0->unk348 = 55;
    return arg1;
}

s32 ov44_0222EBC4(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (TextPrinterCheckActive(arg0->unk180) != 0) {
        return arg1;
    }
    if (ov44_0222C4EC(arg0) != 0) {
        arg0->unk348 = 56;
    }
    if ((gSystem.newKeys & (PAD_BUTTON_B | PAD_BUTTON_A)) || (System_GetTouchNew() == 1)) {
        arg0->unk348 = 56;
    }
    return arg1;
}

s32 ov44_0222EC14(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    ov44_0222F7BC(arg0);
    arg0->unk348 = 19;
    return arg1;
}

s32 ov44_0222EC2C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (TextPrinterCheckActive(arg0->unk180) == 0) {
        if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
            arg0->unk184 = Std_CreateYesNoMenu(arg0->unk15C, &ov44_0223538C, 473, 11, HEAP_ID_53);
        } else {
            arg0->unk188 = ov44_02231A14(arg0->unk15C, &ov44_02235374, 0);
        }
        arg0->unk348 = 58;
    }
    return arg1;
}

s32 ov44_0222EC98(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
        s32 var_r5 = Handle2dMenuInput_DeleteOnFinish(arg0->unk184, HEAP_ID_53);
        if (TextPrinterCheckActive(arg0->unk180) != 0) {
            return arg1;
        }
        if (ov44_0222C500(arg0) != 0) {
            if (var_r5 == -1) {
                Clear2dMenuWindowAndDelete(arg0->unk184, HEAP_ID_53);
            }
            var_r5 = -2;
        }
        if (var_r5 == -1) {
            return arg1;
        }
        if (var_r5 == 0) {
            ov44_0222F510(arg0, 26, 1);
            arg0->unk348 = 59;
            arg0->unk35C = 1;
        } else {
            ov44_0222F7BC(arg0);
            arg0->unk348 = 19;
            ov44_022319EC(arg0);
        }
    } else {
        YesNoResponse yesNoResponse = YesNoPrompt_HandleInput(arg0->unk188);
        if (TextPrinterCheckActive(arg0->unk180) != 0) {
            return arg1;
        }
        if (ov44_0222C500(arg0) != 0) {
            yesNoResponse = YESNORESPONSE_NO;
        }
        if (yesNoResponse == YESNORESPONSE_YES) {
            YesNoPrompt_Destroy(arg0->unk188);
            ov44_0222F510(arg0, 26, 1);
            arg0->unk348 = 59;
            arg0->unk35C = 1;
        } else if (yesNoResponse == YESNORESPONSE_NO) {
            YesNoPrompt_Destroy(arg0->unk188);
            ov44_0222F7BC(arg0);
            arg0->unk348 = 19;
            ov44_022319EC(arg0);
        } else {
            return arg1;
        }
    }
    return arg1;
}

s32 ov44_0222EDB8(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (TextPrinterCheckActive(arg0->unk180) != 0) {
        return arg1;
    }
    if (arg0->unk35C == 1) {
        arg0->unk35C = 0;
        sub_02039330();
    }
    if (sub_02037D78() == 0) {
        sub_0202C46C(arg0->unk0);
        ov44_0222F510(arg0, 27, 1);
        arg0->unk348 = 60;
        arg0->unk35C = 30;
    }
    return arg1;
}

s32 ov44_0222EE10(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (TextPrinterCheckActive(arg0->unk180) != 0) {
        return arg1;
    }
    arg0->unk35C--;
    if (arg0->unk35C == 0) {
        arg0->unk34C = 8;
        arg0->unk348 = 34;
        ov44_0222F7BC(arg0);
    }
    return arg1;
}

s32 ov44_0222EE54(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (sub_02037B38(16) == 0) {
        return arg1;
    }
    sub_020398D4(0, 1);
    if (TextPrinterCheckActive(arg0->unk180) == 0) {
        if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
            arg0->unk184 = Std_CreateYesNoMenu(arg0->unk15C, &ov44_0223538C, 473, 11, HEAP_ID_53);
        } else {
            arg0->unk188 = ov44_02231A28(arg0->unk15C, &ov44_02235374, 0);
        }
        arg0->unk348 = 62;
    }
    return arg1;
}

s32 ov44_0222EED4(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (TextPrinterCheckActive(arg0->unk180) != 0) {
        return arg1;
    }
    if ((sub_02039274() != 0) || (sub_02039264() != 0) || (sub_020390C4() >= 3)) {
        if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
            Clear2dMenuWindowAndDelete(arg0->unk184, HEAP_ID_53);
        } else {
            YesNoPrompt_Destroy(arg0->unk188);
        }
        ov44_0222F510(arg0, 101, 0);
        arg0->unk348 = 28;
    } else {
        if (sub_020393C8() != 0) {
            if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
                Clear2dMenuWindowAndDelete(arg0->unk184, HEAP_ID_53);
            } else {
                YesNoPrompt_Destroy(arg0->unk188);
            }
            ov44_0222B9A0(arg0);
        } else {
            if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
                s32 temp_r0 = Handle2dMenuInput_DeleteOnFinish(arg0->unk184, HEAP_ID_53);
                if (temp_r0 == -1) {
                    return arg1;
                } else if (temp_r0 == 0) {
                    ov44_0222F510(arg0, 138, 0);
                    GF_ASSERT(arg0->unk18C == 0);
                    arg0->unk18C = WaitingIcon_New(&arg0->unk2D0, 482);
                    arg0->unk384 = 1;
                    arg0->unk348 = 49;
                    arg0->unk35C = 30;
                } else {
                    ov44_0222F7BC(arg0);
                    sub_020343E4();
                    sub_020393B4();
                    arg0->unk35C = 20;
                    arg0->unk348 = 65;
                }
            } else {
                s32 temp_r0_2 = YesNoPrompt_HandleInput(arg0->unk188);
                if (temp_r0_2 == 1) {
                    YesNoPrompt_Destroy(arg0->unk188);
                    ov44_0222F510(arg0, 138, 0);
                    GF_ASSERT(arg0->unk18C == 0);
                    arg0->unk18C = WaitingIcon_New(&arg0->unk2D0, 482);
                    arg0->unk384 = 1;
                    arg0->unk348 = 49;
                    arg0->unk35C = 30;
                } else if (temp_r0_2 == 2) {
                    YesNoPrompt_Destroy(arg0->unk188);
                    ov44_0222F7BC(arg0);
                    sub_020343E4();
                    sub_020393B4();
                    arg0->unk35C = 20;
                    arg0->unk348 = 65;
                } else {
                    return arg1;
                }
            }
            if (arg0->unk384 == 0) {
                arg0->unk4 = sub_020398C8();
                arg0->unk4->unk0.unk21 = arg0->unk4->unk0.unk22;
            }
        }
    }
    return arg1;
}

s32 ov44_0222F0AC(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    u32 temp_r0 = ov44_02231C70(&arg0->unk38C);
    if (ov44_0222AAEC(arg0, temp_r0) == 0) {
        ov44_0222F780(arg0, temp_r0 - 1);
        ov44_0222F510(arg0, 16, 0);
        arg0->unk348 = 29;
        return arg1;
    }
    UnkStruct_ov44_02231958 *temp_r0_2 = ov44_02231958(arg0, temp_r0 - 1);
    u32 r0 = ov44_02229F00(arg0, temp_r0_2);
    u8 r7 = temp_r0_2->unk21;
    if ((arg0->unk37E != r0) || (arg0->unk380 != r7)) {
        ov44_0222F780(arg0, temp_r0 - 1);
        ov44_0222F510(arg0, 16, 0);
        arg0->unk348 = 29;
        return arg1;
    }
    if (TextPrinterCheckActive(arg0->unk180) == 0) {
        if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
            arg0->unk184 = Std_CreateYesNoMenu(arg0->unk15C, &ov44_0223538C, 473, 11, HEAP_ID_53);
        } else {
            arg0->unk188 = ov44_02231A14(arg0->unk15C, &ov44_02235374, 0);
        }
        arg0->unk348 = 64;
    }
    return arg1;
}

s32 ov44_0222F194(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    s32 temp_r0 = ov44_02231C70(&arg0->unk38C);
    if (ov44_0222AAEC(arg0, temp_r0) == 0) {
        if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
            Clear2dMenuWindowAndDelete(arg0->unk184, HEAP_ID_53);
        } else {
            YesNoPrompt_Destroy(arg0->unk188);
        }
        ov44_0222F780(arg0, temp_r0 - 1);
        ov44_0222F510(arg0, 16, 0);
        arg0->unk348 = 29;
        return arg1;
    }
    UnkStruct_ov44_02231958 *temp_r0_2 = ov44_02231958(arg0, temp_r0 - 1);
    u32 r0 = ov44_02229F00(arg0, temp_r0_2);
    u8 r7 = temp_r0_2->unk21;
    if ((arg0->unk37E != r0) || (arg0->unk380 != r7)) {
        if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
            Clear2dMenuWindowAndDelete(arg0->unk184, HEAP_ID_53);
        } else {
            YesNoPrompt_Destroy(arg0->unk188);
        }
        ov44_0222F780(arg0, temp_r0 - 1);
        ov44_0222F510(arg0, 16, 0);
        arg0->unk348 = 29;
        return arg1;
    }
    if (sub_020393C8() != 0) {
        if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
            Clear2dMenuWindowAndDelete(arg0->unk184, HEAP_ID_53);
        } else {
            YesNoPrompt_Destroy(arg0->unk188);
        }
        ov44_0222B9A0(arg0);
    } else {
        if (sub_020390C4() >= 3) {
            if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
                Clear2dMenuWindowAndDelete(arg0->unk184, HEAP_ID_53);
            } else {
                YesNoPrompt_Destroy(arg0->unk188);
            }
            ov44_0222F510(arg0, 18, 0);
            sub_02039358();
            arg0->unk348 = 29;
            return arg1;
        } else if ((REG_POWCNT_ADDR / 2048 & reg_GX_POWCNT) >> 15 == 1) {
            s32 menuInputResult = Handle2dMenuInput_DeleteOnFinish(arg0->unk184, HEAP_ID_53);
            if (menuInputResult == -1) {
                return arg1;
            }
            if (menuInputResult == 0) {
                u32 temp_r0 = ov44_0222A0B4(arg0->unk37E);
                if (temp_r0 != 29) {
                    if (ov44_02231974(arg0->unk382 - 1) == 6) {
                        ov44_0222F89C(arg0);
                        if (ov44_0223197C(arg0, arg0->unk382 - 1, temp_r0) != 0) {
                            arg0->unk340 = 1800;
                            ov44_0222A1B4(temp_r0);
                            sub_020378E4(0);
                            ov44_0222F818(arg0, temp_r0);
                            ov44_0222F780(arg0, arg0->unk382 - 1);
                            ov44_0222F510(arg0, 17, 0);
                            GF_ASSERT(arg0->unk18C == 0);
                            arg0->unk18C = WaitingIcon_New(&arg0->unk2D0, 482);
                            if (temp_r0 != 1) {
                                arg0->unk348 = 45;
                                return arg1;
                            }
                            arg0->unk340 = 1800;
                            arg0->unk348 = 21;
                            return arg1;
                        }
                    }
                }
            }
            ov44_0222F7BC(arg0);
            ov44_0222F818(arg0, 16);
            ov44_0222F8F0(arg0);
            ov44_0222C120(arg0);
            arg0->unk348 = 19;
            return arg1;
        }
        YesNoResponse yesNoResponse = YesNoPrompt_HandleInput(arg0->unk188);
        if (yesNoResponse == 1) {
            YesNoPrompt_Destroy(arg0->unk188);
            u32 temp_r0 = ov44_0222A0B4(arg0->unk37E);
            if (temp_r0 != 29) {
                if (ov44_02231974(arg0->unk382 - 1) == 6) {
                    ov44_0222F89C(arg0);
                    if (ov44_0223197C(arg0, arg0->unk382 - 1, temp_r0) != 0) {
                        arg0->unk340 = 1800;
                        ov44_0222A1B4(temp_r0);
                        sub_020378E4(0);
                        ov44_0222F818(arg0, temp_r0);
                        ov44_0222F780(arg0, arg0->unk382 - 1);
                        ov44_0222F510(arg0, 17, 0);
                        GF_ASSERT(arg0->unk18C == 0);
                        arg0->unk18C = WaitingIcon_New(&arg0->unk2D0, 482);
                        if (temp_r0 != 1) {
                            arg0->unk348 = 45;
                            return arg1;
                        }
                        arg0->unk340 = 1800;
                        arg0->unk348 = 21;
                        return arg1;
                    }
                }
            }
        } else if (yesNoResponse == 2) {
            YesNoPrompt_Destroy(arg0->unk188);
            ov44_0222F7BC(arg0);
            ov44_0222F818(arg0, 16);
            ov44_0222F8F0(arg0);
            ov44_0222C120(arg0);
            arg0->unk348 = 19;
            return arg1;
        } else {
            return arg1;
        }
    }
    return arg1;
}

s32 ov44_0222F4E0(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (sub_02037D78() == 0) {
        BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, HEAP_ID_53);
        arg1 = 2;
    }
    return arg1;
}

void ov44_0222F510(UnkStruct_ov44_022319EC *arg0, s32 arg1, s32 arg2) {
    u32 textSpeed_int;
    if (arg2 != 0) {
        textSpeed_int = 1;
    } else {
        Options *options = Save_PlayerData_GetOptionsAddr(arg0->saveData);
        textSpeed_int = Options_GetTextFrameDelay(options);
    }
    u8 textSpeed = textSpeed_int;
    ov44_0222F910(arg0);
    if (WindowIsInUse(&arg0->unk300) != 0) {
        ClearFrameAndWindow2(&arg0->unk300, 0);
        RemoveWindow(&arg0->unk300);
    }
    if (WindowIsInUse(&arg0->unk2D0) != 0) {
        ClearFrameAndWindow2(&arg0->unk2D0, 0);
        RemoveWindow(&arg0->unk2D0);
    }
    s32 temp_r0 = arg0->unk180;
    if ((temp_r0 != 8) && (TextPrinterCheckActive(temp_r0) != 0)) {
        RemoveTextPrinter(arg0->unk180);
        arg0->unk180 = 8;
    }
    AddWindowParameterized(arg0->unk15C, &arg0->unk2D0, 2, 2, 19, 27, 4, 12, 301);
    if (arg2 != 0) {
        ReadMsgDataIntoString(arg0->unk16C, arg1, arg0->unk170);
    } else {
        ReadMsgDataIntoString(arg0->unk168, arg1, arg0->unk170);
    }
    StringExpandPlaceholders(arg0->unk164, arg0->unk174, arg0->unk170);
    FillWindowPixelBuffer(&arg0->unk2D0, 15);
    DrawFrameAndWindow2(&arg0->unk2D0, 1, 482, 10);
    TextFlags_SetCanABSpeedUpPrint(1);
    TextFlags_SetAutoScrollParam(0);
    TextFlags_SetCanTouchSpeedUpPrint(1);
    arg0->unk180 = AddTextPrinterParameterized(&arg0->unk2D0, 1, arg0->unk174, 0, 0, textSpeed, 0);
    ScheduleWindowCopyToVram(&arg0->unk2D0);
}

void ov44_0222F66C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    ov44_0222F910(arg0);
    if (WindowIsInUse(&arg0->unk300) != 0) {
        ClearFrameAndWindow2(&arg0->unk300, 0);
        RemoveWindow(&arg0->unk300);
    }
    if (WindowIsInUse(&arg0->unk2D0) != 0) {
        ClearFrameAndWindow2(&arg0->unk2D0, 0);
        RemoveWindow(&arg0->unk2D0);
    }
    s32 temp_r0 = arg0->unk180;
    if ((temp_r0 != 8) && (TextPrinterCheckActive(temp_r0) != 0)) {
        RemoveTextPrinter(arg0->unk180);
        arg0->unk180 = 8;
    }
    AddWindowParameterized(arg0->unk15C, &arg0->unk300, 2, 4, 4, 23, 16, 12, 105);
    ReadMsgDataIntoString(arg0->unk16C, arg1, arg0->unk170);
    StringExpandPlaceholders(arg0->unk164, arg0->unk174, arg0->unk170);
    FillWindowPixelBuffer(&arg0->unk300, 15);
    DrawFrameAndWindow1(&arg0->unk300, 1, 473, 11);
    arg0->unk180 = AddTextPrinterParameterized(&arg0->unk300, 1, arg0->unk174, 0, 0, 255, 0);
    ScheduleWindowCopyToVram(&arg0->unk300);
}

void ov44_0222F780(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (arg1 != -1) {
        PlayerProfile *playerProfile = PlayerProfile_New(HEAP_ID_53);
        Save_Profile_PlayerName_Set(playerProfile, sub_0202C254(arg0->unk0, arg1));
        BufferPlayersName(arg0->unk164, 0, playerProfile);
        Heap_Free(playerProfile);
    }
}

void ov44_0222F7BC(UnkStruct_ov44_022319EC *arg0) {
    s32 temp_r0;

    ov44_0222F910(arg0);
    temp_r0 = arg0->unk180;
    if ((temp_r0 != 8) && (TextPrinterCheckActive(temp_r0) != 0)) {
        RemoveTextPrinter(arg0->unk180);
        arg0->unk180 = 8;
    }
    if (WindowIsInUse(&arg0->unk2D0) != 0) {
        ClearFrameAndWindow2(&arg0->unk2D0, 0);
        RemoveWindow(&arg0->unk2D0);
    }
}

void ov44_0222F818(UnkStruct_ov44_022319EC *arg0, u32 arg1) {
    if (arg0->unk4 != NULL) {
        ov44_0222F830(arg0, arg1);
        ov00_021E6D60(arg0->unk4, 36);
    }
}

void ov44_0222F830(UnkStruct_ov44_022319EC *arg0, u32 arg1) {
    if (arg0->unk4 != NULL) {
        u32 r0 = ov44_02229F00(arg0, &arg0->unk4->unk0);
        if (r0 != arg1) {
            arg0->unk4->unk0.unk1B = arg1;
            if ((ov44_0222A020(arg1) == 0) && (arg1 != 8) && (arg1 != 20) && (arg1 != 22) && (arg1 != 24) && (arg1 != 26) && (arg1 != 18)) {
                if (arg1 == 1) {
                    GF_SndStartFadeOutBGM(0, 30);
                } else if (arg1 == 16) {
                    ov00_021E70B8(0);
                    if (ov44_0222E074() == 1) {
                        GF_SndStartFadeInBGM(120, 30, 1);
                    }
                }
            }
        }
        ov44_0222C120(arg0);
    }
}

u8 ov44_0222F89C(UnkStruct_ov44_022319EC *arg0) {
    arg0->unk4->unk0.unk21 = 1 - arg0->unk4->unk0.unk21;
    ov00_021E6D60(arg0->unk4, 36);
    return arg0->unk4->unk0.unk21;
}

u8 ov44_0222F8C0(UnkStruct_ov44_022319EC *arg0) {
    arg0->unk4->unk0.unk22 = 1 - arg0->unk4->unk0.unk22;
    arg0->unk4->unk0.unk21 = arg0->unk4->unk0.unk22;
    ov00_021E6D60(arg0->unk4, 36);
    return arg0->unk4->unk0.unk22;
}

u8 ov44_0222F8F0(UnkStruct_ov44_022319EC *arg0) {
    arg0->unk4->unk0.unk21 = arg0->unk4->unk0.unk22;
    ov00_021E6D60(arg0->unk4, 36);
    return arg0->unk4->unk0.unk22;
}

void ov44_0222F910(UnkStruct_ov44_022319EC *arg0) {
    if (arg0->unk18C != 0) {
        sub_0200F478();
        arg0->unk18C = 0;
        if (WindowIsInUse(&arg0->unk2D0) != 0) {
            ClearFrameAndWindow2(&arg0->unk2D0, 0);
            RemoveWindow(&arg0->unk2D0);
        }
    }
}

void ov44_0222F950(UnkStruct_ov44_022319EC *arg0, enum HeapID heapID) {
    ov44_0222FC0C(arg0);
    ov44_02231D8C(&arg0->unk38C);
    ov44_02230060(arg0, heapID);
}

void ov44_0222F970(UnkStruct_ov44_022319EC *arg0, s32 arg1, enum HeapID heapID) {
    if (arg1 == ov44_0222FC00(arg0)) {
        ov44_0222F950(arg0, heapID);
    }
}

s32 ov44_0222F98C(UnkStruct_ov44_022319EC *arg0) {
    if (arg0->unkB1C.unk4C != 0) {
        return 1;
    }
    return 0;
}

void ov44_0222F9A0(UnkStruct_ov44_022319EC *arg0, NARC *arg1, enum HeapID arg2) {
    memset(&arg0->unkB1C, 0, sizeof(UnkStruct_ov44_02231800));
    GfGfx_EngineBTogglePlanes(1, 1);
    GfGfx_EngineBTogglePlanes(2, 1);
    GfGfx_EngineBTogglePlanes(4, 1);
    GfGfx_EngineBTogglePlanes(8, 0);
    arg0->unkB1C.unk4C = TouchHitboxController_Create(ov44_022354E8, 8, (TouchHitboxControllerCallback)ov44_0222FC84, arg0, arg2);
    arg0->unkB1C.unk0 = MessageFormat_New(arg2);
    ov44_0222FCBC(arg0, arg1, arg2);
    arg0->unkB1C.unk78 = 1;
    ov44_02230090(arg0);
    ov44_022300C8(arg0);
}

void ov44_0222FA28(UnkStruct_ov44_022319EC *arg0) {
    if (ov44_0222F98C(arg0) != 0) {
        ov44_0222FF30(arg0);
        TouchHitboxController_Destroy(arg0->unkB1C.unk4C);
        arg0->unkB1C.unk4C = NULL;
        MessageFormat_Delete(arg0->unkB1C.unk0);
        arg0->unkB1C.unk0 = NULL;
        GfGfx_EngineBTogglePlanes(1, 1);
        GfGfx_EngineBTogglePlanes(2, 0);
        GfGfx_EngineBTogglePlanes(4, 0);
        GfGfx_EngineBTogglePlanes(8, 0);
    }
}

u8 ov44_0222FA80(UnkStruct_ov44_022319EC *arg0, enum HeapID heapID) {
    u32 var_r5 = ov44_02231C8C(&arg0->unk38C);
    u32 temp_r0 = ov44_02231CE8(&arg0->unk38C);
    if ((temp_r0 >= 3) && (temp_r0 <= 6)) {
        var_r5 = temp_r0;
    }
    if ((var_r5 >= 3) && (var_r5 <= 6)) {
        if (arg0->unkB1C.unk70 != var_r5 - 3) {
            arg0->unkB1C.unk70 = var_r5 - 3;
            PlaySE(SEQ_SE_DP_SELECT5);
            ov44_02230090(arg0);
            arg0->unkB1C.unk75 = 1;
            arg0->unkB1C.unk78 = 1;
        }
    }
    if (arg0->unkB1C.unk73 == 1) {
        arg0->unkB1C.unk73 = 2;
        arg0->unkB1C.unk74 = 0;
        ov44_02230234(arg0, heapID);
        ov44_02231720(arg0);
    }
    if (arg0->unkB1C.unk73 == 0) {
        TouchHitboxController_IsTriggered(arg0->unkB1C.unk4C);
        ov44_022313C8(arg0);
        if (arg0->unkB1C.unk75 == 1) {
            ov44_022300C8(arg0);
            arg0->unkB1C.unk75 = 0;
        }
    }
    if ((u8)(arg0->unkB1C.unk73 + 254) <= 1) {
        u32 temp_r0_2 = ov44_02231788(arg0);
        if (ov44_0222FBC8(arg0, temp_r0_2) == 1) {
            arg0->unkB1C.unk77 = arg0->unkB1C.unk71;
            arg0->unkB1C.unk71 = 0;
            arg0->unkB1C.unk72 = 0;
            arg0->unkB1C.unk75 = 1;
            arg0->unkB1C.unk78 = 1;
            arg0->unkB1C.unk73 = 0;
            ov44_02231754(arg0);
            PlaySE(SEQ_SE_DP_DECIDE);
        } else if (temp_r0_2 != 0) {
            PlaySE(SEQ_SE_DP_DECIDE);
            ov44_0222FC3C(arg0, temp_r0_2);
            ov44_02230234(arg0, heapID);
        }
    }
    return arg0->unkB1C.unk71;
}

void ov44_0222FBA0(UnkStruct_ov44_022319EC *arg0) {
    if ((arg0->unkB1C.unk73 == 0) && (arg0->unkB1C.unk75 == 1)) {
        ov44_022300C8(arg0);
        arg0->unkB1C.unk75 = 0;
    }
}

s32 ov44_0222FBC8(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (arg0->unkB1C.unk73 == 3) {
        return 0;
    }
    if ((gSystem.heldKeys & (PAD_KEY_DOWN | PAD_KEY_UP | PAD_KEY_LEFT | PAD_KEY_RIGHT)) || (gSystem.newKeys & (PAD_BUTTON_X | PAD_BUTTON_A | PAD_BUTTON_B)) || (arg1 == 2)) {
        return 1;
    }
    return 0;
}

u8 ov44_0222FC00(UnkStruct_ov44_022319EC *arg0) {
    return arg0->unkB1C.unk71;
}

void ov44_0222FC0C(UnkStruct_ov44_022319EC *arg0) {
    if (ov44_0222F98C(arg0) == 1) {
        arg0->unkB1C.unk71 = 0;
        arg0->unkB1C.unk72 = 0;
        arg0->unkB1C.unk73 = 0;
        arg0->unkB1C.unk75 = 1;
        arg0->unkB1C.unk78 = 1;
        ov44_02231754(arg0);
    }
}

void ov44_0222FC3C(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    u32 var_r1;
    if (ov44_02229EE0(arg0) == 1) {
        var_r1 = 7;
    } else {
        var_r1 = 2;
    }
    if (arg1 == 3) {
        arg0->unkB1C.unk74 = (arg0->unkB1C.unk74 + 1) % var_r1;
        return;
    }
    s8 *ptr = &arg0->unkB1C.unk74;
    ptr[0]--;
    if (arg0->unkB1C.unk74 < 0) {
        ptr[0] += var_r1;
    }
}

void ov44_0222FC84(s32 arg0, enum HeapID arg1, UnkStruct_ov44_022319EC *arg2) {
    s32 temp_r0 = arg2->unkB1C.unk70 * 8 + arg0;
    if ((arg2->unkB1C.unk50[temp_r0] == 2) && (arg2->unkB1C.unk71 == 0) && (arg1 == 0)) {
        arg2->unkB1C.unk71 = temp_r0 + 1;
        PlaySE(SEQ_SE_DP_DECIDE);
    }
}

void ov44_0222FCBC(UnkStruct_ov44_022319EC *arg0, NARC *arg1, enum HeapID arg2) {
    s32 i;
    s32 j;
    BgClearTilemapBufferAndCommit(arg0->unk15C, 4);
    GfGfxLoader_GXLoadPalFromOpenNarc(arg1, 17, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_0_OFFSET, 128, arg2);
    GfGfxLoader_GXLoadPalFromOpenNarc(arg1, 20, GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_4_OFFSET, 160, arg2);
    GfGfxLoader_LoadCharDataFromOpenNarc(arg1, 16, arg0->unk15C, GF_BG_LYR_SUB_0, 0, 0, 0, arg2);
    GfGfxLoader_LoadCharDataFromOpenNarc(arg1, 19, arg0->unk15C, GF_BG_LYR_SUB_2, 48, 0, 0, arg2);
    GfGfxLoader_LoadScrnDataFromOpenNarc(arg1, 18, arg0->unk15C, GF_BG_LYR_SUB_0, 0, 0, 0, arg2);
    arg0->unkB1C.unk4 = GfGfxLoader_GetScrnDataFromOpenNarc(arg1, 21, 0, &arg0->unkB1C.unk8, arg2);
    ov44_0222FFB4(arg0->unkB1C.unk8, 48);

    for (i = 0; i < 7; i++) {
        arg0->unkB1C.unkC[i] = GfGfxLoader_GetScrnDataFromOpenNarc(arg1, i + 22, 0, &arg0->unkB1C.unk28[i], arg2);
        ov44_0222FFB4(arg0->unkB1C.unk28[i], 48);
    }

    arg0->unkB1C.unk44 = GfGfxLoader_GetScrnDataFromOpenNarc(arg1, 29, 0, &arg0->unkB1C.unk48, arg2);
    ov44_0222FFB4(arg0->unkB1C.unk48, 48);
    LoadFontPal1(GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_15_OFFSET, arg2);

    s32 sp20;
    s32 r5;
    for (i = 0; i < 8; i++) {
        InitWindow(&arg0->unkB1C.unk7C[i]);
        r5 = i / 4;
        sp20 = i % 4;

        AddWindowParameterized(arg0->unk15C, &arg0->unkB1C.unk7C[i], 5, r5 * 16 + 4, sp20 * 6 + 1, 9, 3, 15, 1 + (i * 27));
        FillWindowPixelBuffer(&arg0->unkB1C.unk7C[i], 0);
        ScheduleWindowCopyToVram(&arg0->unkB1C.unk7C[i]);

        for (j = 0; j < 2; j++) {
            InitWindow(&arg0->unkB1C.unkFC[i][j]);
            AddWindowParameterized(arg0->unk15C, &arg0->unkB1C.unkFC[i][j], 5, r5 * 16 + 1 + j * 12, sp20 * 6 + 1, 2, 3, 13, 6 * (j + i * 2) + 218);
            FillWindowPixelBuffer(&arg0->unkB1C.unkFC[i][j], 0);
            ScheduleWindowCopyToVram(&arg0->unkB1C.unkFC[i][j]);
        }
    }
    AddWindowParameterized(arg0->unk15C, &arg0->unkB1C.unk1FC, 7, 1, 1, 30, 21, 15, 1);
    FillWindowPixelBuffer(&arg0->unkB1C.unk1FC, 0);
    ScheduleWindowCopyToVram(&arg0->unkB1C.unk1FC);
    ov44_02231420(arg0, arg1, arg2);
}

void ov44_0222FF30(UnkStruct_ov44_022319EC *arg0) {
    s32 i;
    ov44_022316B0(arg0);
    for (i = 0; i < 8; i++) {
        RemoveWindow(&arg0->unkB1C.unk7C[i]);
        for (s32 j = 0; j < 2; j++) {
            RemoveWindow(&arg0->unkB1C.unkFC[i][j]);
        }
    }
    RemoveWindow(&arg0->unkB1C.unk1FC);
    Heap_Free(arg0->unkB1C.unk4);
    for (i = 0; i < 7; i++) {
        Heap_Free(arg0->unkB1C.unkC[i]);
    }
    Heap_Free(arg0->unkB1C.unk44);
}

void ov44_0222FFB4(NNSG2dScreenData *arg0, s32 arg1) {
    s32 i;
    s32 j;
    u16 *ip = (u16 *)&arg0->rawData[0];
    s32 width = arg0->screenWidth / 8;
    s32 height = arg0->screenHeight / 8;
    for (i = 0; i < height; i++) {
        for (j = 0; j < width; j++) {
            ip[i * width + j] += arg1;
        }
    }
}

void ov44_0222FFF4(UnkStruct_ov44_022319EC *arg0, s32 arg1, u32 arg2) {
    GF_ASSERT(arg1 != 0);
    GF_ASSERT(arg2 != 0);
    GF_ASSERT(arg2 < 3);
    arg0->unkB1C.unk50[arg1 - 1] = arg2;
    arg0->unkB1C.unk75 = 1;
}

void ov44_02230028(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    GF_ASSERT(arg1 != 0);
    arg0->unkB1C.unk50[arg1 - 1] = 0;
    arg0->unkB1C.unk75 = 1;
}

u8 ov44_02230048(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    GF_ASSERT(arg1 != 0);
    return arg0->unkB1C.unk50[arg1 - 1];
}

void ov44_02230060(UnkStruct_ov44_022319EC *arg0, enum HeapID heapID) {
    if (arg0->unkB1C.unk73 != 0) {
        ov44_02230234(arg0, heapID);
        return;
    }
    arg0->unkB1C.unk78 = 1;
    ov44_022300C8(arg0);
}

void ov44_02230080(UnkStruct_ov44_022319EC *arg0) {
    arg0->unkB1C.unk78 = 1;
    arg0->unkB1C.unk75 = 1;
}

void ov44_02230090(UnkStruct_ov44_022319EC *arg0) {
    BgTilemapRectChangePalette(arg0->unk15C, 4, 0, 0, 32, 24, arg0->unkB1C.unk70);
    ScheduleBgTilemapBufferTransfer(arg0->unk15C, 4);
}

void ov44_022300C8(UnkStruct_ov44_022319EC *arg0) {
    s32 sp1C;
    s32 sp18;
    if (arg0->unkB1C.unk78 == 1) {
        arg0->unkB1C.unk78 = 0;
        sp18 = 1;
        FillBgTilemapRect(arg0->unk15C, 6, 0, 0, 0, 32, 24, 0);
    } else {
        sp18 = 0;
    }
    for (s32 i = 0; i < 8; i++) {
        s32 temp_r4 = i + (arg0->unkB1C.unk70 * 8) + 1;
        if (arg0->unkB1C.unk50[temp_r4 - 1] != 0) {
            if (sub_0202C090(arg0->unk0, temp_r4 - 1, 8) == 0) {
                sp1C = 1;
            } else {
                sp1C = 0;
            }
        } else {
            sp1C = 2;
        }
        s32 r2 = i / 4;
        s32 temp_ip = i % 4;
        u32 var_r5;
        if (temp_r4 == arg0->unkB1C.unk71) {
            var_r5 = arg0->unkB1C.unk72;
        } else {
            var_r5 = 0;
        }
        s32 var_r1;
        if ((temp_r4 == arg0->unkB1C.unk71) || (temp_r4 == arg0->unkB1C.unk77)) {
            var_r1 = 1;
        } else {
            var_r1 = 0;
        }
        if (sp18 == 1 || var_r1 == 1) {
            ov44_02231148(arg0, r2 << 4, (6 * temp_ip), sp1C, var_r5);
            if (sp1C != 2) {
                ov44_022312B8(arg0, &arg0->unkB1C.unk7C[i], temp_r4, var_r5, i);
                ov44_02231344(arg0, &arg0->unkB1C.unkFC[i][0], temp_r4, var_r5, i);
            } else {
                FillWindowPixelBuffer(&arg0->unkB1C.unk7C[i], 0);
                ScheduleWindowCopyToVram(&arg0->unkB1C.unk7C[i]);
                for (s32 j = 0; j < 2; j++) {
                    FillWindowPixelBuffer(&arg0->unkB1C.unkFC[i][j], 0);
                    ScheduleWindowCopyToVram(&arg0->unkB1C.unkFC[i][j]);
                }
            }
        }
    }
    ScheduleBgTilemapBufferTransfer(arg0->unk15C, 6);
    GfGfx_EngineBTogglePlanes(2, 1);
    GfGfx_EngineBTogglePlanes(8, 0);
}

void ov44_02230234(UnkStruct_ov44_022319EC *arg0, enum HeapID heapID) {
    s32 var_r4;
    if (sub_0202C090(arg0->unk0, arg0->unkB1C.unk71 - 1, 8) == 1) {
        var_r4 = 7;
    } else {
        var_r4 = 8;
    }
    NNSG2dScreenData *temp_r3 = arg0->unkB1C.unk28[arg0->unkB1C.unk74];
    BG_LoadScreenTilemapData(arg0->unk15C, 6, &temp_r3->rawData[0], temp_r3->szByte);
    BgTilemapRectChangePalette(arg0->unk15C, 6, 0, 0, 32, 24, var_r4);
    BgClearTilemapBufferAndCommit(arg0->unk15C, 7);
    if (ov44_02229EE0(arg0) == 0) {
        ov44_02230FE8(arg0);
    }
    FillWindowPixelBuffer(&arg0->unkB1C.unk1FC, 0);
    ov44_02236680[arg0->unkB1C.unk74](arg0, heapID);
    ScheduleBgTilemapBufferTransfer(arg0->unk15C, 6);
    ScheduleWindowCopyToVram(&arg0->unkB1C.unk1FC);
    GfGfx_EngineBTogglePlanes(2, 0);
    GfGfx_EngineBTogglePlanes(8, 1);
}

void ov44_02230300(UnkStruct_ov44_022319EC *arg0, enum HeapID heapID) {
    s32 color;
    s32 temp_r4 = arg0->unkB1C.unk71 - 1;
    if (sub_0202C090(arg0->unk0, temp_r4, 8) == 0) {
        color = MAKE_TEXT_COLOR(5, 6, 0);
    } else {
        color = MAKE_TEXT_COLOR(3, 4, 0);
    }
    ov44_02231918(arg0, temp_r4);
    // {STRVAR_1 3, 0, 0}
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00042, arg0->unk170);
    StringExpandPlaceholders(arg0->unkB1C.unk0, arg0->unk178, arg0->unk170);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 1, arg0->unk178, 32, 8, 255, color, 0);
    UnkStruct_ov44_02231958 *sp10 = ov44_02231958(arg0, temp_r4);
    u32 temp_r0 = ov44_02229F00(arg0, sp10);
    ReadMsgDataIntoString(arg0->unk168, ov44_0223120C(temp_r0, &color), arg0->unk170);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk170, 104, 8, 255, color, 0);
    PlayerProfile *playerProfile = PlayerProfile_New(HEAP_ID_53);
    Save_Profile_PlayerName_Set(playerProfile, sub_0202C298(arg0->unk0, temp_r4));
    BufferPlayersName(arg0->unkB1C.unk0, 0, playerProfile);
    Heap_Free(playerProfile);
    // GROUP
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00043, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 32, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    // {STRVAR_1 3, 0, 0}
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00150, arg0->unk170);
    StringExpandPlaceholders(arg0->unkB1C.unk0, arg0->unk178, arg0->unk170);

    u32 width = 232 - FontID_String_GetWidth(0, arg0->unk178, 0);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, width, 32, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    // BATTLE RECORD
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00044, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 56, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    BufferIntegerAsString(arg0->unkB1C.unk0, 0, sub_0202C090(arg0->unk0, temp_r4, 1), 4, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    // W: {STRVAR_1 53, 0, 0}
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00045, arg0->unk170);
    StringExpandPlaceholders(arg0->unkB1C.unk0, arg0->unk178, arg0->unk170);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 120, 56, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    BufferIntegerAsString(arg0->unkB1C.unk0, 0, sub_0202C090(arg0->unk0, temp_r4, 2), 4, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    // L: {STRVAR_1 53, 0, 0}
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00046, arg0->unk170);
    StringExpandPlaceholders(arg0->unkB1C.unk0, arg0->unk178, arg0->unk170);

    width = 232 - FontID_String_GetWidth(0, arg0->unk178, 0);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, width, 56, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    // POKéMON TRADES
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00047, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 80, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    BufferIntegerAsString(arg0->unkB1C.unk0, 0, sub_0202C090(arg0->unk0, temp_r4, 3), 4, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    // {STRVAR_1 53, 0, 0}
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00048, arg0->unk170);
    StringExpandPlaceholders(arg0->unkB1C.unk0, arg0->unk178, arg0->unk170);

    width = 232 - FontID_String_GetWidth(0, arg0->unk178, 0);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, width, 80, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    if (ov44_02229EF8(arg0) == 1) {
        // POFFIN SESSIONS
        ReadMsgDataIntoString(arg0->unk168, msg_0778_00049, arg0->unk178);
        AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 104, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
        BufferIntegerAsString(arg0->unkB1C.unk0, 0, sub_0202C090(arg0->unk0, temp_r4, 9), 4, PRINTING_MODE_RIGHT_ALIGN, TRUE);
        // {STRVAR_1 53, 0, 0}
        ReadMsgDataIntoString(arg0->unk168, msg_0778_00050, arg0->unk170);
        StringExpandPlaceholders(arg0->unkB1C.unk0, arg0->unk178, arg0->unk170);

        width = 232 - FontID_String_GetWidth(0, arg0->unk178, 0);
        AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, width, 104, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    }
    // DATE LAST PLAYED
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00051, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 128, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    s32 temp_r0_2 = sub_0202C090(arg0->unk0, temp_r4, 6);
    if (temp_r0_2 != 0) {
        BufferIntegerAsString(arg0->unkB1C.unk0, 2, temp_r0_2, 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BufferIntegerAsString(arg0->unkB1C.unk0, 0, sub_0202C090(arg0->unk0, temp_r4, 4), 4, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BufferMonthNameAbbr(arg0->unkB1C.unk0, 1, sub_0202C090(arg0->unk0, temp_r4, 5));
        // {STRVAR_34 16, 1, 0} {STRVAR_1 51, 2, 0}, {STRVAR_1 53, 0, 0}
        ReadMsgDataIntoString(arg0->unk168, msg_0778_00074, arg0->unk170);
        StringExpandPlaceholders(arg0->unkB1C.unk0, arg0->unk178, arg0->unk170);

        width = 232 - FontID_String_GetWidth(0, arg0->unk178, 0);
        AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, width, 128, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    }
    ov44_0222AC54(arg0->unk15C, &arg0->unkB0C, 6, 2, 2, temp_r0);

    s32 var_r1;
    if (sp10->unk21 != 0) {
        var_r1 = 8;
    } else {
        var_r1 = 1;
    }
    ov44_0222ABDC(arg0->unk15C, &arg0->unkB0C, 6, 28, 2, var_r1, 0);
}

void ov44_022307E0(UnkStruct_ov44_022319EC *arg0, enum HeapID heapID) {
    s32 temp_r4 = arg0->unkB1C.unk71 - 1;
    // BATTLE TOWER
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00052, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 0, 255, MAKE_TEXT_COLOR(15, 14, 0), 0);
    ov44_02231084(arg0, arg0->unk178, 0, temp_r4);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 24, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231054(arg0, 65, 113, temp_r4, 120, 24);
    // RECORD
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00059, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 48, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231054(arg0, 65, 112, temp_r4, 120, 48);
}

void ov44_022308B0(UnkStruct_ov44_022319EC *arg0, enum HeapID heapID) {
    s32 temp_r4 = arg0->unkB1C.unk71 - 1;
    // BATTLE FACTORY
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00053, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 0, 255, MAKE_TEXT_COLOR(15, 14, 0), 0);
    // LEVEL 50
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00060, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 24, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    // RENTAL/TRADE
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00062, arg0->unk178);

    u32 width = 232 - FontID_String_GetWidth(0, arg0->unk178, 0);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, width, 24, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231084(arg0, arg0->unk178, 1, temp_r4);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 48, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231054(arg0, 65, 115, temp_r4, 104, 48);
    ov44_02231054(arg0, 66, 117, temp_r4, 212, 48);
    // RECORD
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00059, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 64, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231054(arg0, 65, 114, temp_r4, 104, 64);
    ov44_02231054(arg0, 66, 116, temp_r4, 212, 64);
    // OPEN LEVEL
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00061, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 88, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    // RENTAL/TRADE
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00062, arg0->unk178);

    width = 232 - FontID_String_GetWidth(0, arg0->unk178, 0);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, width, 88, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231084(arg0, arg0->unk178, 2, temp_r4);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 112, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231054(arg0, 65, 119, temp_r4, 104, 112);
    ov44_02231054(arg0, 66, 121, temp_r4, 212, 112);
    // RECORD
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00059, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 128, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231054(arg0, 65, 118, temp_r4, 104, 128);
    ov44_02231054(arg0, 66, 120, temp_r4, 212, 128);
}

void ov44_02230B2C(UnkStruct_ov44_022319EC *arg0, enum HeapID heapID) {
    s32 temp_r4 = arg0->unkB1C.unk71 - 1;
    // BATTLE CASTLE
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00054, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 0, 255, MAKE_TEXT_COLOR(15, 14, 0), 0);
    // CASTLE POINTS
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00063, arg0->unk178);

    u32 width = 180 - (FontID_String_GetWidth(0, arg0->unk178, 0) + 1) / 2;
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, width, 24, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231084(arg0, arg0->unk178, 3, temp_r4);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 48, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231054(arg0, 68, 135, temp_r4, 104, 48);
    ov44_02231054(arg0, 67, 136, temp_r4, 212, 48);
    // RECORD
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00059, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 80, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231054(arg0, 68, 134, temp_r4, 104, 80);
    ov44_02231054(arg0, 67, 138, temp_r4, 212, 80);
}

void ov44_02230C68(UnkStruct_ov44_022319EC *arg0, enum HeapID arg1) {
    FrontierSave *frontierSave = Save_Frontier_GetStatic(arg0->saveData);
    s32 temp_r4 = arg0->unkB1C.unk71 - 1;
    // BATTLE HALL
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00055, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 0, 255, MAKE_TEXT_COLOR(15, 14, 0), 0);
    String *temp_r0 = GetSpeciesName(FrontierSave_GetStat(frontierSave, 124, temp_r4), arg1);
    u32 width = 33 - (FontID_String_GetWidth(0, temp_r0, 0) + 1) / 2;
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, temp_r0, width, 24, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    String_Delete(temp_r0);
    ov44_02231084(arg0, arg0->unk178, 4, temp_r4);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 48, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231054(arg0, 65, 123, temp_r4, 108, 48);
    // RECORD
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00059, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 80, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231054(arg0, 65, 122, temp_r4, 108, 80);
}

void ov44_02230D8C(UnkStruct_ov44_022319EC *arg0, enum HeapID heapID) {
    s32 temp_r4 = arg0->unkB1C.unk71 - 1;
    // BATTLE ARCADE
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00056, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 0, 255, MAKE_TEXT_COLOR(15, 14, 0), 0);
    ov44_02231084(arg0, arg0->unk178, 5, temp_r4);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 24, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231054(arg0, 69, 143, temp_r4, 112, 24);
    // RECORD
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00059, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 48, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    ov44_02231054(arg0, 69, 142, temp_r4, 112, 48);
}

void ov44_02230E5C(UnkStruct_ov44_022319EC *arg0, enum HeapID heapID) {
    UnkStruct_021D2230 *temp_r6 = sub_0202C6F4(arg0->saveData);
    s32 temp_r4 = arg0->unkB1C.unk71 - 1;
    // PLAZA GAMES PLAYED
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00070, arg0->unk178);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 0, 255, MAKE_TEXT_COLOR(15, 14, 0), 0);
    BufferWiFiPlazaActivityName(arg0->unkB1C.unk0, 0, 0);
    // {STRVAR_3 0, 0, 0}
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00071, arg0->unk170);
    StringExpandPlaceholders(arg0->unkB1C.unk0, arg0->unk178, arg0->unk170);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 24, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    // {STRVAR_1 53, 0, 0}
    ov44_022310C8(arg0, msg_0778_00072, sub_0202C090(temp_r6, temp_r4, 10), 164, 24);
    BufferWiFiPlazaActivityName(arg0->unkB1C.unk0, 0, 1);
    // {STRVAR_3 0, 0, 0}
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00071, arg0->unk170);
    StringExpandPlaceholders(arg0->unkB1C.unk0, arg0->unk178, arg0->unk170);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 48, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    // {STRVAR_1 53, 0, 0}
    ov44_022310C8(arg0, msg_0778_00072, sub_0202C090(temp_r6, temp_r4, 11), 164, 48);
    BufferWiFiPlazaActivityName(arg0->unkB1C.unk0, 0, 2);
    // {STRVAR_3 0, 0, 0}
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00071, arg0->unk170);
    StringExpandPlaceholders(arg0->unkB1C.unk0, arg0->unk178, arg0->unk170);
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, 8, 72, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    // {STRVAR_1 53, 0, 0}
    ov44_022310C8(arg0, msg_0778_00072, sub_0202C090(temp_r6, temp_r4, 12), 164, 72);
}

void ov44_02230FE8(UnkStruct_ov44_022319EC *arg0) {
    for (s32 i = 0; i < 5; i++) {
        CopyToBgTilemapRect(arg0->unk15C, 6, i + 26, 0, 1, 1, &arg0->unkB1C.unk48->rawData[0], 0, 0, arg0->unkB1C.unk48->screenWidth / 8, arg0->unkB1C.unk48->screenHeight / 8);
    }
    BgTilemapRectChangePalette(arg0->unk15C, 6, 26, 0, 5, 1, 6);
}

void ov44_02231054(UnkStruct_ov44_022319EC *arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4, s32 arg5) {
    ov44_022310C8(arg0, arg1, FrontierSave_GetStat(Save_Frontier_GetStatic(arg0->saveData), arg2, arg3), arg4, arg5);
}

void ov44_02231084(UnkStruct_ov44_022319EC *arg0, String *arg1, u32 arg2, s32 arg3) {

    GF_ASSERT(arg2 < 6);
    s32 var_r1;
    if (FrontierSave_GetStat(Save_Frontier_GetStatic(arg0->saveData), ov44_022353D0[arg2], arg3) == 0) {
        // PREV
        var_r1 = msg_0778_00057;
    } else {
        // CURRENT
        var_r1 = msg_0778_00058;
    }
    ReadMsgDataIntoString(arg0->unk168, var_r1, arg1);
}

void ov44_022310C8(UnkStruct_ov44_022319EC *arg0, s32 arg1, s32 arg2, s32 arg3, s32 arg4) {
    BufferIntegerAsString(arg0->unkB1C.unk0, 0, arg2, 4, PRINTING_MODE_RIGHT_ALIGN, TRUE);
    ReadMsgDataIntoString(arg0->unk168, arg1, arg0->unk170);
    StringExpandPlaceholders(arg0->unkB1C.unk0, arg0->unk178, arg0->unk170);
    u32 width = arg3 - (FontID_String_GetWidth(0, arg0->unk178, 0) + 1) / 2;
    AddTextPrinterParameterizedWithColor(&arg0->unkB1C.unk1FC, 0, arg0->unk178, width, arg4, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
}

void ov44_02231148(UnkStruct_ov44_022319EC *arg0, u8 arg1, u8 arg2, u8 arg3, u8 arg4) {
    GF_ASSERT(arg4 < 4);
    if (arg4 == 3) {
        arg4 = 1;
    }
    if (arg4 < 2) {
        CopyToBgTilemapRect(arg0->unk15C, 6, arg1, arg2, 16, 6, &arg0->unkB1C.unk8->rawData, (u16)(arg4 << 4), (u16)(arg3 * 6), 32, 18);
    } else {
        s64 offset = 18 << 4;
        CopyToBgTilemapRect(arg0->unk15C, 6, arg1, arg2, 16, 6, &arg0->unkB1C.unk8->rawData + offset, 0, (u16)(arg3 * 6), 16, 18);
    }
    BgTilemapRectChangePalette(arg0->unk15C, 6, arg1, arg2, 16, 6, arg3 + 4);
}

s32 ov44_0223120C(u32 arg0, s32 *color) {
    *color = MAKE_TEXT_COLOR(1, 2, 0);
    s32 ret = 0;
    switch (arg0) {
    case 1:
        ret = 36;
        *color = MAKE_TEXT_COLOR(2, 14, 0);
        break;
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
        ret = 27;
        *color = MAKE_TEXT_COLOR(2, 14, 0);
        break;
    case 9:
        ret = 96;
        break;
    case 10:
        ret = 97;
        break;
    case 11:
        ret = 95;
        break;
    case 12:
        ret = 99;
        break;
    case 13:
        ret = 100;
        break;
    case 14:
        ret = 98;
        break;
    case 8:
        ret = 29;
        *color = MAKE_TEXT_COLOR(2, 14, 0);
        break;
    case 15:
        ret = 28;
        break;
    case 18:
    case 19:
        ret = 92;
        break;
    case 20:
        ret = 33;
        *color = MAKE_TEXT_COLOR(2, 14, 0);
        break;
    case 21:
        ret = 32;
        break;
    case 22:
    case 24:
    case 26:
        ret = 35;
        *color = MAKE_TEXT_COLOR(2, 14, 0);
        break;
    case 23:
    case 25:
    case 27:
        ret = 34;
        break;
    case 16:
        ret = 79;
        break;
    default:
        ret = 92;
    }
    return ret;
}

void ov44_022312B8(UnkStruct_ov44_022319EC *arg0, Window *arg1, s32 arg2, s32 arg3, s32 arg4) {
    FillWindowPixelBuffer(arg1, 0);
    u8 temp_r7 = ov44_02235364[arg3];
    s32 sp14 = arg2 - 1;
    s32 color;
    if (sub_0202C090(arg0->unk0, sp14, 8) == 0) {
        color = MAKE_TEXT_COLOR(5, 6, 0);
    } else {
        color = MAKE_TEXT_COLOR(3, 4, 0);
    }
    ov44_02231918(arg0, sp14);
    // {STRVAR_1 3, 0, 0}
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00042, arg0->unk170);
    StringExpandPlaceholders(arg0->unkB1C.unk0, arg0->unk178, arg0->unk170);
    AddTextPrinterParameterizedWithColor(arg1, 1, arg0->unk178, 0, temp_r7, 255, color, 0);
    ScheduleWindowCopyToVram(arg1);
}

void ov44_02231344(UnkStruct_ov44_022319EC *arg0, Window *arg1, s32 arg2, u32 arg3, u32 arg4) {
    s32 var_r0;
    UnkStruct_ov44_02231958 *spC = ov44_02231958(arg0, arg2 - 1);
    u32 sp8 = ov44_02229F00(arg0, spC);
    u32 temp_r7 = ov44_02235364[arg3];
    for (s32 i = 0; i < 2; i++) {
        FillWindowPixelBuffer(&arg1[i], 0);
        if (i == 0) {
            ov44_0222AD34(&arg1[i], &arg0->unkB0C, 0, temp_r7, sp8);
        } else {
            if (spC->unk21 != 0) {
                var_r0 = 8;
            } else {
                var_r0 = 1;
            }
            ov44_0222ACE8(&arg1[i], &arg0->unkB0C, 0, temp_r7, var_r0, 0);
        }
        ScheduleWindowCopyToVram(&arg1[i]);
    }
}

void ov44_022313C8(UnkStruct_ov44_022319EC *arg0) {
    if (arg0->unkB1C.unk71 != 0) {
        arg0->unkB1C.unk76++;
        if (arg0->unkB1C.unk76 >= ov44_02235368[arg0->unkB1C.unk72]) {
            arg0->unkB1C.unk76 = 0;
            arg0->unkB1C.unk72++;
            arg0->unkB1C.unk75 = 1;
            if (arg0->unkB1C.unk72 >= 4) {
                arg0->unkB1C.unk76 = 0;
                arg0->unkB1C.unk72 = 0;
                arg0->unkB1C.unk73 = 1;
            }
        }
    }
}

void ov44_02231420(UnkStruct_ov44_022319EC *arg0, NARC *arg1, enum HeapID arg2) {
    SpriteTemplate spriteTemplateList[3];
    spriteTemplateList = ov44_02235570;

    GfGfx_EngineBTogglePlanes(16, 0);
    arg0->unkB1C.unk20C[0] = AddCharResObjFromOpenNarc(arg0->unk2BC[0], arg1, NARC_a_0_4_3, FALSE, 30, NNS_G2D_VRAM_TYPE_2DSUB, arg2);
    arg0->unkB1C.unk20C[1] = AddPlttResObjFromOpenNarc(arg0->unk2BC[1], arg1, NARC_a_0_4_4, FALSE, 30, NNS_G2D_VRAM_TYPE_2DSUB, 8, arg2);
    arg0->unkB1C.unk20C[2] = AddCellOrAnimResObjFromOpenNarc(arg0->unk2BC[2], arg1, NARC_fielddata_mapmatrix_map_matrix, FALSE, 30, GF_GFX_RES_TYPE_CELL, arg2);
    arg0->unkB1C.unk20C[3] = AddCellOrAnimResObjFromOpenNarc(arg0->unk2BC[3], arg1, NARC_a_0_4_2, FALSE, 30, GF_GFX_RES_TYPE_ANIM, arg2);
    GF_ASSERT(sub_0200AE18(arg0->unkB1C.unk20C[0]) != 0);
    GF_ASSERT(sub_0200B00C(arg0->unkB1C.unk20C[1]) != 0);
    sub_0200A740(arg0->unkB1C.unk20C[0]);
    sub_0200A740(arg0->unkB1C.unk20C[1]);

    SpriteResourcesHeader spriteResourcesHeader;
    CreateSpriteResourcesHeader(&spriteResourcesHeader, 30, 30, 30, 30, -1, -1, 0, 0, arg0->unk2BC[0], arg0->unk2BC[1], arg0->unk2BC[2], arg0->unk2BC[3], 0, 0);
    for (s32 i = 0; i < 3; i++) {
        spriteTemplateList[i].spriteList = arg0->unk190;
        spriteTemplateList[i].header = &spriteResourcesHeader;
        spriteTemplateList[i].heapID = arg2;
        arg0->unkB1C.unk21C[i] = Sprite_CreateAffine(&spriteTemplateList[i]);
        Sprite_SetAnimCtrlSeq(arg0->unkB1C.unk21C[i], _0223535C[i]);
    }
    FontID_Alloc(2, arg2);
    Window window;
    InitWindow(&window);
    AddTextWindowTopLeftCorner(arg0->unk15C, &window, 8, 2, 0, 0);
    String *string = String_New(64, arg2);
    // CLOSE
    ReadMsgDataIntoString(arg0->unk168, msg_0778_00073, string);
    AddTextPrinterParameterizedWithColor(&window, 2, string, FontID_String_GetCenterAlignmentX(2, string, 0, 64), 0, 255, MAKE_TEXT_COLOR(1, 2, 0), 0);
    String_Delete(string);
    UnkStruct_02013910 *temp_r0_4 = sub_02013910(&window, arg2);
    GF_ASSERT(sub_02021AC8(sub_02013948(temp_r0_4, NNS_G2D_VRAM_TYPE_2DSUB), TRUE, NNS_G2D_VRAM_TYPE_2DSUB, &arg0->unkB1C.unk228) != 0);

    TextOBJTemplate textObjTemplate;
    textObjTemplate.fontSystem = arg0->unk2CC;
    textObjTemplate.window = &window;
    textObjTemplate.spriteList = arg0->unk190;
    textObjTemplate.plttResourceProxy = SpriteTransfer_GetPaletteProxy(arg0->unkB1C.unk20C[1], NULL);
    textObjTemplate.sprite = arg0->unkB1C.unk21C[1];
    textObjTemplate.offset = arg0->unkB1C.unk228.offset;
    textObjTemplate.x = -32;
    textObjTemplate.y = -8;
    textObjTemplate.unk_20 = 0;
    textObjTemplate.unk_24 = 0;
    textObjTemplate.vram = 2;
    textObjTemplate.heapID = arg2;
    arg0->unkB1C.unk234 = TextOBJ_Create(&textObjTemplate, temp_r0_4);
    sub_02013938(temp_r0_4);
    RemoveWindow(&window);
    FontID_Release(2);
    arg0->unkB1C.unk244 = TouchHitboxController_Create(ov44_02235394, 3, (TouchHitboxControllerCallback)ov44_022317F0, arg0, arg2);
}

void ov44_022316B0(UnkStruct_ov44_022319EC *arg0) {
    TouchHitboxController_Destroy(arg0->unkB1C.unk244);
    TextOBJ_Destroy(arg0->unkB1C.unk234);
    sub_02021B5C(&arg0->unkB1C.unk228);

    for (s32 i = 0; i < 3; i++) {
        Sprite_Delete(arg0->unkB1C.unk21C[i]);
    }
    sub_0200AEB0(arg0->unkB1C.unk20C[0]);
    sub_0200B0A8(arg0->unkB1C.unk20C[1]);

    for (s32 i = 0; i < 4; i++) {
        DestroySingle2DGfxResObj(arg0->unk2BC[i], arg0->unkB1C.unk20C[i]);
    }
}

void ov44_02231720(UnkStruct_ov44_022319EC *arg0) {
    arg0->unkB1C.unk238 = 1;
    GfGfx_EngineBTogglePlanes(16, 1);
    arg0->unkB1C.unk23C = 0;
    for (s32 i = 0; i < 3; i++) {
        ov44_02231800(&arg0->unkB1C, i);
    }
}

void ov44_02231754(UnkStruct_ov44_022319EC *arg0) {
    if (arg0->unkB1C.unk238 == 2) {
        Sprite_SetDrawFlag(arg0->unkB1C.unk21C[1], 1);
        TextOBJ_SetSpritesDrawFlag(arg0->unkB1C.unk234, 1);
    }
    arg0->unkB1C.unk238 = 0;
    GfGfx_EngineBTogglePlanes(16, 0);
}

s32 ov44_02231788(UnkStruct_ov44_022319EC *arg0) {
    if (arg0->unkB1C.unk238 == 0) {
        return 0;
    }
    arg0->unkB1C.unk23C = 3;
    arg0->unkB1C.unk240 = 255;
    TouchHitboxController_IsTriggered(arg0->unkB1C.unk244);

    for (s32 i = 0; i < 3; i++) {
        if ((arg0->unkB1C.unk238 != 2 || i != 1) && ov44_0223183C(&arg0->unkB1C, i, arg0->unkB1C.unk23C, arg0->unkB1C.unk240) == 1) {
            return i + 1;
        }
    }
    return 0;
}

void ov44_022317F0(u32 arg0, u32 arg1, UnkStruct_ov44_022319EC *arg2) {
    arg2->unkB1C.unk23C = arg0;
    arg2->unkB1C.unk240 = arg1;
}

void ov44_02231800(UnkStruct_ov44_02231800 *arg0, s32 arg1) {
    Sprite_SetAnimCtrlSeq(arg0->unk21C[arg1], _0223535C[arg1]);
    Sprite_SetAnimationFrame(arg0->unk21C[arg1], 4);
    if (arg1 == 1) {
        sub_020136B4(arg0->unk234, -32, -8);
    }
}

s32 ov44_0223183C(UnkStruct_ov44_02231800 *arg0, s32 arg1, s32 arg2, s32 arg3) {
    s32 sp8 = 0;
    if (arg2 == arg1) {
        u32 temp_r0 = Sprite_GetAnimationFrame(arg0->unk21C[arg1]);
        if (arg3 == 0 || arg3 == 2) {
            if (arg3 == 0) {
                Sprite_SetAnimCtrlSeq(arg0->unk21C[arg1], ov44_02235360[arg1]);
            }
            if (temp_r0 < 3) {
                Sprite_UpdateAnim(arg0->unk21C[arg1], 2 * FX32_ONE);
                u16 temp_r4_2 = Sprite_GetAnimationFrame(arg0->unk21C[arg1]);
                if (arg1 == 1) {
                    sub_020136B4(arg0->unk234, -32, ov44_0223536C[temp_r4_2]);
                }
                if (temp_r4_2 >= 3) {
                    sp8 = 1;
                }
            }
        } else if (arg3 == 1 && temp_r0 < 3) {
            sp8 = 1;
        }
    } else {
        u16 temp_r7_2 = Sprite_GetAnimationNumber(arg0->unk21C[arg1]);
        u16 spC = Sprite_GetAnimationFrame(arg0->unk21C[arg1]);
        if (temp_r7_2 == ov44_02235360[arg1]) {
            Sprite_SetAnimCtrlSeq(arg0->unk21C[arg1], _0223535C[arg1]);
            Sprite_SetAnimationFrame(arg0->unk21C[arg1], 4 - spC);
        }
        Sprite_UpdateAnim(arg0->unk21C[arg1], 2 * FX32_ONE);
    }
    return sp8;
}

void ov44_02231918(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (arg1 != -1) {
        PlayerProfile *playerProfile = PlayerProfile_New(HEAP_ID_53);
        Save_Profile_PlayerName_Set(playerProfile, sub_0202C254(arg0->unk0, arg1));
        BufferPlayersName(arg0->unkB1C.unk0, 0, playerProfile);
        Heap_Free(playerProfile);
    }
}

UnkStruct_ov44_02231958 *ov44_02231958(UnkStruct_ov44_022319EC *arg0, u32 arg1) {
    if (arg1 >= 32) {
        return &arg0->unk1098;
    }
    return &arg0->unk4->unk24[arg1];
}

s32 ov44_02231974(s32 arg0) {
    return ov00_021E6D68(arg0);
}

s32 ov44_0223197C(UnkStruct_ov44_022319EC *arg0, s32 arg1, s32 arg2) {
    sub_020379A0(HEAP_ID_15);
    ov00_021E70B8(arg0->unk4->unk0.unk21);
    if (ov44_02229F44(arg2) == 1) {
        ov00_021E714C(1, 128);
    } else {
        ov00_021E714C(0, 128);
    }
    sub_02097214();
    return sub_02039080(arg1);
}

void ov44_022319BC(UnkStruct_ov44_022319EC *arg0, s32 arg1) {
    if (arg0->unkD64 == 0) {
        arg0->unkD64 = 1;
        ov44_02231D94(&arg0->unk38C, 1);
        if (arg1 == 1) {
            ov44_0222F510(arg0, 9, 0);
        }
    }
}

void ov44_022319EC(UnkStruct_ov44_022319EC *arg0) {
    if (arg0->unkD64 == 1) {
        arg0->unkD64 = 0;
        ov44_0222F7BC(arg0);
        ov44_02231D94(&arg0->unk38C, 0);
    }
}
