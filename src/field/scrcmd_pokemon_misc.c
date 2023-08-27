#include "global.h"
#include "bag.h"
#include "bug_contest.h"
#include "fieldmap.h"
#include "field_map_object.h"
#include "friend_group.h"
#include "gf_gfx_loader.h"
#include "photo_album.h"
#include "pokedex.h"
#include "list_menu.h"
#include "overlay_01_021F72DC.h"
#include "overlay_01_021F944C.h"
#include "overlay_01_021E6880.h"
#include "overlay_02.h"
#include "overlay_03.h"
#include "unk_02031904.h"
#include "scrcmd.h"
#include "unk_0206D494.h"
#include "unk_02031AF0.h"
#include "unk_02031B0C.h"
#include "unk_0203E348.h"
#include "unk_02031904.h"
#include "unk_02030A98.h"
#include "unk_0205BFF0.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "unk_0200FA24.h"
#include "unk_02005D10.h"
#include "unk_0202CA24.h"
#include "field_follow_poke.h"
#include "get_egg.h"
#include "map_section.h"
#include "map_header.h"
#include "update_dex_received.h"
#include "math_util.h"
#include "sys_vars.h"
#include "system.h"
#include "unk_02092BE8.h"
#include "unk_02037C94.h"
#include "sound_02004A44.h"

typedef struct UnkStructScr_648 {
    FieldSystem *fieldSystem;
    SysTask *sysTask;
    Window window_8;
    Window *window_18;
    String *stringArr_1C[120];
    MsgData *msgdata;
    MessageFormat *msgfmt;
    u8 unk_204;
    u8 unk_205;
    u8 unk_206;
    u8 unk_207;
    u8 x;
    u8 y;
    u8 unk_20A;
    u8 totalItems;
    u8 unk_20C;
    u8 unk_20D;
    u8 unk_20E;
    u8 unk_20F;
    u16 *input;
    u16 *cursorPos;
    u16 *itemsAbove;
    struct ListMenuTemplate listMenuTemplate;
    struct ListMenu * listMenu_23C;
    u32 unk_240;
    LISTMENUITEM items[120];
    u16 unk_604[120];
    u16 unk_6F4;
} SCR_648_STRUCT;

static BOOL ov01_02200C6C(ScriptContext *ctx);
static void *ov01_02200C94(HeapID heapId, s32 fileId, u32 *unkPtr);
static void ov01_02200CB4(SCR_648_STRUCT *unkPtr, MsgData *msgdata);
static void ov01_02200CBC(FieldSystem *fieldSystem, SCR_648_STRUCT *unkPtr, u8 x, u8 y, u8 a4, u8 a5, s16 *input, MessageFormat *msgfmt, Window *window, MsgData *msgdata, u16 *cursorPos, u16 *itemsAbove);
static SCR_648_STRUCT *ov01_02200D9C(FieldSystem *fieldSystem, u8 x, u8 y, u8 a3, u8 a4, s16* input, MessageFormat *msgfmt, Window *window, MsgData *msgdata, u16 *cursorPos, u16 *itemsAbove);
static void ov01_02200DF8(SCR_648_STRUCT *unkPtr, int strNo, u16 a2, u32 a3);
static void ov01_02200E00(SCR_648_STRUCT *unkPtr);
static void ov01_02200EC8(SCR_648_STRUCT *unkPtr, int strNo, u16 a2, u32 a3);
static void ov01_02200F54(SCR_648_STRUCT *unkPtr);
static void ov01_02201064(struct ListMenu *listMenu, s32 a1, u8 unused);
static void ov01_02201088(struct ListMenu *listMenu, s32 unused1, u8 unused2);
static void ov01_022010CC(SysTask *sysTask, void *work);
static void ov01_0220116C(SCR_648_STRUCT *unkPtr);
static void GetHiddenPowerPowerType(Pokemon *mon, s32 *power, s32 *type);
static LocalMapObject *ov01_02201F98(MapObjectManager *mapObjectMan, u8 unkA, u16 species, u16 form, u32 gender, u32 x, u32 y, u32 mapId);

extern u16 ov01_02209AE0[10];

BOOL ScrCmd_648(ScriptContext *ctx) {
    int i;
    u32 out_1;
    int out_2;
    s16 *input;
    u32 unkPtr_2;

    MsgData *msgdata2;
    SCR_648_STRUCT *unkPtr;
    u32 *unkG;
    u16 *data;
    u16 *cursorPos;
    u16 *itemsAbove;
    Window *window;
    MessageFormat **msgfmt;
    MsgData *msgdata;
    FieldSystem *fieldSystem = ctx->fieldSystem;

    msgfmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    u32 unkA = ScriptGetVar(ctx);
    u32 fileIndex = ScriptGetVar(ctx);
    u16 unkC = ScriptReadHalfword(ctx);
    u16 unkD = ScriptReadHalfword(ctx);
    u16 unkE = ScriptReadHalfword(ctx);

    ctx->data[0] = unkC;

    msgdata = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, 237, HEAP_ID_32);

    input = GetVarPointer(fieldSystem, unkC);

    window = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_WINDOW);

    cursorPos = GetVarPointer(fieldSystem, unkD);
    itemsAbove = GetVarPointer(fieldSystem, unkE);

    unkPtr = ov01_02200D9C(fieldSystem, 20, 1, 0, 1, input, *msgfmt, window, msgdata, cursorPos, itemsAbove);

    unkG = sub_020312C4(fieldSystem->saveData, 0xb, &out_1);

    if (out_1 == 1) {
        data = ov01_02200C94(HEAP_ID_32, ov01_02209AE0[fileIndex], &out_2);

        for (i = 0; i < out_2; i++) {
            unkPtr_2 = sub_020312E0(fieldSystem->saveData, unkG, sub_0205C144(unkA), data[i]);
            if (unkPtr_2 != 0) {
                ov01_02200DF8(unkPtr, data[i], 0xff, data[i]);
            }
        }
        FreeToHeap(data);
    }
    if (unkG) {
        FreeToHeap(unkG);
    }

    msgdata2 = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, 0xbf, HEAP_ID_32);

    ov01_02200CB4(unkPtr, msgdata2);
    ov01_02200DF8(unkPtr, 0xd, 0xff, 0xfffe);
    DestroyMsgData(msgdata2);

    ov01_02200CB4(unkPtr, msgdata);
    ov01_02200E00(unkPtr);

    SetupNativeScript(ctx, ov01_02200C6C);

    DestroyMsgData(msgdata);

    return TRUE;
}

static BOOL ov01_02200C6C(ScriptContext *ctx) {
    return (*GetVarPointer(ctx->fieldSystem, ctx->data[0]) != 0xEEEE);
}

static void *ov01_02200C94(HeapID heapId, s32 fileId, u32 *unkPtr) {
    u32 size;
    void *data = GfGfxLoader_LoadFromNarc_GetSizeOut(NARC_application_zukanlist_zukan_data_zukan_data, fileId, FALSE, heapId, FALSE, &size);
    *unkPtr = size/2;
    return data;
}

static void ov01_02200CB4(SCR_648_STRUCT *unkPtr, MsgData *msgdata) {
    unkPtr->msgdata = msgdata;
}

static void ov01_02200CBC(FieldSystem *fieldSystem, SCR_648_STRUCT *unkPtr, u8 x, u8 y, u8 a4, u8 a5, s16 *input, MessageFormat *msgfmt, Window *window, MsgData *msgdata, u16 *cursorPos, u16 *itemsAbove) {
    int i;
    unkPtr->msgdata = msgdata;
    unkPtr->unk_207 = unkPtr->unk_207 & ~0x2;
    unkPtr->msgfmt = msgfmt;
    unkPtr->fieldSystem = fieldSystem;
    unkPtr->input = input;
    i = 0;
    *unkPtr->input = 0;
    unkPtr->cursorPos = cursorPos;
    unkPtr->itemsAbove = itemsAbove;
    unkPtr->unk_207 = unkPtr->unk_207 & ~1 | a5 & 1;
    unkPtr->unk_206 = a4;
    unkPtr->x = x;
    unkPtr->y = y;
    unkPtr->totalItems = 0;
    unkPtr->window_18 = window;
    unkPtr->unk_204 = 3;
    unkPtr->unk_6F4 = a4;

    for (i = 0; i < 0x78; i++) {
        unkPtr->items[i].text = NULL;
        unkPtr->items[i].value = 0;
        unkPtr->unk_604[i] = 0xff;
    }

    for (i = 0; i < 0x78; i++) {
        unkPtr->stringArr_1C[i] = String_New(0x50, HEAP_ID_4);
    }

    *unkPtr->input = 0xEEEE;
}

static SCR_648_STRUCT *ov01_02200D9C(FieldSystem *fieldSystem, u8 x, u8 y, u8 a3, u8 a4, s16* input, MessageFormat *msgfmt, Window *window, MsgData *msgdata, u16 *cursorPos, u16 *itemsAbove) {
    SCR_648_STRUCT *unkPtr = AllocFromHeap(HEAP_ID_4, sizeof(SCR_648_STRUCT));
    if (!unkPtr) {
        return NULL;
    }
    memset(unkPtr, 0, sizeof(SCR_648_STRUCT));
    ov01_02200CBC(fieldSystem, unkPtr, x, y, a3, a4, input, msgfmt, window, msgdata, cursorPos, itemsAbove);
    return unkPtr;
}

static void ov01_02200DF8(SCR_648_STRUCT *unkPtr, int strNo, u16 a2, u32 a3) {
    ov01_02200EC8(unkPtr, strNo, a2, a3);
}

static void ov01_02200E00(SCR_648_STRUCT *unkPtr) {
    u32 unk = unkPtr->totalItems;
    if (unk > 8) {
        AddWindowParameterized(unkPtr->fieldSystem->bgConfig, &unkPtr->window_8, 3, unkPtr->x, unkPtr->y, 11, 0x10, 13, 1);
    } else {
        AddWindowParameterized(unkPtr->fieldSystem->bgConfig, &unkPtr->window_8, 3, unkPtr->x, unkPtr->y, 11, 2*unk, 13, 1);
    }
    LoadUserFrameGfx1(unkPtr->fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 0x3D9, 11, 0, HEAP_ID_4);
    DrawFrameAndWindow1(&unkPtr->window_8, TRUE, 0x3D9, 11);
    ov01_02200F54(unkPtr);
    unkPtr->listMenu_23C = ListMenuInit(&unkPtr->listMenuTemplate, *unkPtr->cursorPos, *unkPtr->itemsAbove, HEAP_ID_4);
    unkPtr->sysTask = CreateSysTask(ov01_022010CC, unkPtr, 0);
}

static void ov01_02200EC8(SCR_648_STRUCT *unkPtr, int strNo, u16 a2, u32 a3) {
    String *str = String_New(0x50, HEAP_ID_4);
    ReadMsgDataIntoString(unkPtr->msgdata, strNo, str);
    StringExpandPlaceholders(unkPtr->msgfmt, unkPtr->stringArr_1C[unkPtr->totalItems], str);
    unkPtr->items[unkPtr->totalItems].text = unkPtr->stringArr_1C[unkPtr->totalItems];
    String_Delete(str);
    if (a3 == 0xfa) {
        unkPtr->items[unkPtr->totalItems].value = -3;
    } else {
        unkPtr->items[unkPtr->totalItems].value = a3;
    }
    unkPtr->unk_604[unkPtr->totalItems] = a2;
    unkPtr->totalItems++;
}

static void ov01_02200F54(SCR_648_STRUCT *unkPtr) {
    unkPtr->listMenuTemplate.items = unkPtr->items;
    unkPtr->listMenuTemplate.moveCursorFunc = ov01_02201088;
    unkPtr->listMenuTemplate.itemPrintFunc = ov01_02201064;
    unkPtr->listMenuTemplate.window = &unkPtr->window_8;
    unkPtr->listMenuTemplate.totalItems = unkPtr->totalItems;
    unkPtr->listMenuTemplate.maxShowed = 8;
    unkPtr->listMenuTemplate.header_X = 1;
    unkPtr->listMenuTemplate.item_X = 12;
    unkPtr->listMenuTemplate.cursor_X = 2;
    unkPtr->listMenuTemplate.upText_Y = 1;
    unkPtr->listMenuTemplate.cursorPal = 1;
    unkPtr->listMenuTemplate.fillValue = 15;
    unkPtr->listMenuTemplate.cursorShadowPal = 2;
    unkPtr->listMenuTemplate.lettersSpacing = 0;
    unkPtr->listMenuTemplate.itemVerticalPadding = 16;
    unkPtr->listMenuTemplate.scrollMultiple = 1;
    unkPtr->listMenuTemplate.fontId = 0;
    unkPtr->listMenuTemplate.cursorKind = 0;
    unkPtr->listMenuTemplate.unk_1C = (u32) unkPtr;
}

static void ov01_02201064(struct ListMenu *listMenu, s32 a1, u8 unused) {
    if (a1 == -3) {
        ListMenuOverrideSetColors(listMenu, 3, 0xf, 4);
    } else {
        ListMenuOverrideSetColors(listMenu, 1, 0xf, 2);
    }
}

static void ov01_02201088(struct ListMenu *listMenu, s32 unused1, u8 unused2) {
    u16 cursorPos = 0, itemsAbove = 0;
    SCR_648_STRUCT *unkPtr = (SCR_648_STRUCT *)ListMenuGetTemplateField(listMenu, LISTMENUATTR_UNK_1C);
    ListMenuGetScrollAndRow(listMenu, &cursorPos, &itemsAbove);
    if (unkPtr->cursorPos != 0 && unkPtr->itemsAbove != 0) {
        *unkPtr->cursorPos = cursorPos;
        *unkPtr->itemsAbove = itemsAbove;
    }
}

static void ov01_022010CC(SysTask *sysTask, void *work) {
    u16 prev;
    int input;
    SCR_648_STRUCT *unkPtr = work;
    if (unkPtr->unk_204) {
        unkPtr->unk_204--;
        return;
    }
    if (IsPaletteFadeFinished()) {
        input = ListMenu_ProcessInput(unkPtr->listMenu_23C);
        prev = unkPtr->unk_6F4;
        ListMenuGetCurrentItemArrayId(unkPtr->listMenu_23C, &unkPtr->unk_6F4);
        if (prev != unkPtr->unk_6F4) {
            PlaySE(SEQ_SE_DP_SELECT);
        }
        switch (input) {
        case -2:
            if (((u32)(unkPtr->unk_207 << 0x1f) >> 0x1f) == 1) {
                PlaySE(SEQ_SE_DP_SELECT);
                *unkPtr->input = -2;
                ov01_0220116C(unkPtr);
            }
        case -1:
            break;
        default:
            PlaySE(SEQ_SE_DP_SELECT);
            *unkPtr->input = input;
            ov01_0220116C(unkPtr);
            break;
        }
    }
}

static void ov01_0220116C(SCR_648_STRUCT *unkPtr) {
    int i;
    PlaySE(SEQ_SE_DP_SELECT);
    DestroyListMenu(unkPtr->listMenu_23C, NULL, NULL);
    sub_0200E5D4(unkPtr->listMenuTemplate.window, FALSE);
    RemoveWindow(&unkPtr->window_8);

    for (i = 0; i < 0x78; i++) {
        String_Delete(unkPtr->stringArr_1C[i]);
    }

    if (((u32)(unkPtr->unk_207 << 0x1e) >> 0x1f) == 1) {
        DestroyMsgData(unkPtr->msgdata);
    }

    DestroySysTask(unkPtr->sysTask);

    FreeToHeap(unkPtr);
}

extern u16 sStatJudgeBestStatMsgIdxs[6];

BOOL ScrCmd_StatJudge(ScriptContext *ctx) {
    u32 ivList[6];
    u32 i;
    u8 offset;
    u8 highestIvValue;
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u32 monIndex = ScriptGetVar(ctx);
    u16 *ivTotal = ScriptGetVarPointer(ctx);
    u16 *highestIvIndex = ScriptGetVarPointer(ctx);
    u16 *highestIv = ScriptGetVarPointer(ctx);
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), monIndex);
    ivList[0] = GetMonData(mon, MON_DATA_HP_IV, 0);
    ivList[1] = GetMonData(mon, MON_DATA_ATK_IV, 0);
    ivList[2] = GetMonData(mon, MON_DATA_DEF_IV, 0);
    ivList[3] = GetMonData(mon, MON_DATA_SPEED_IV, 0);
    ivList[4] = GetMonData(mon, MON_DATA_SPATK_IV, 0);
    ivList[5] = GetMonData(mon, MON_DATA_SPDEF_IV, 0);

    highestIvValue = 0;
    *ivTotal = 0;

    for (i = 0; i < 6; i = (u8)++i) {
        *ivTotal += ivList[i];
        if (highestIvValue < ivList[i]) {
            highestIvValue = ivList[i];
        }
    }

    offset = fieldSystem->judgeStatPosition;
    *highestIvIndex = offset;

    for (i = 0; i < 6; i = (u8)++i) {
        if (highestIvValue == ivList[offset]) {
            *highestIvIndex = offset;
            fieldSystem->judgeStatPosition = (offset + 1) % 6;
            break;
        }
        offset = (offset + 1) % 6;
    }

    *highestIv = highestIvValue;
    *highestIvIndex = sStatJudgeBestStatMsgIdxs[*highestIvIndex];

    return FALSE;
}

BOOL ScrCmd_CommSanitizeParty(ScriptContext *ctx) {
    int partyCount, i, form;
    u32 species, data;
    u32 heldItems[6];
    Pokemon *mon;
    int count = 0;
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *success = ScriptGetVarPointer(ctx);
    Party *party = SaveArray_Party_Get(fieldSystem->saveData);
    partyCount = Party_GetCount(party);

    *success = FALSE;

    for (i = 0; i < partyCount; i++) {
        mon = Party_GetMonByIndex(party, i);
        heldItems[i] = GetMonData(mon, MON_DATA_HELD_ITEM, 0);
        if (heldItems[i] == ITEM_GRISEOUS_ORB) {
            count++;
        }
    }
    if (count > 0) {
        if (Bag_AddItem(Save_Bag_Get(fieldSystem->saveData), ITEM_GRISEOUS_ORB, count, HEAP_ID_4) == FALSE) {
            *success = 255;
            return FALSE;
        }

        data = 0;
        for (i = 0; i < partyCount; i++) {
            if (heldItems[i] == ITEM_GRISEOUS_ORB) {
                mon = Party_GetMonByIndex(party, i);
                SetMonData(mon, MON_DATA_HELD_ITEM, &data);
            }
        }
    }

    for (i = 0; i < partyCount; i++) {
        mon = Party_GetMonByIndex(party, i);
        form = GetMonData(mon, MON_DATA_FORM, 0);
        if (form > 0) {
            species = GetMonData(mon, MON_DATA_SPECIES, 0);
            switch (species) {
            case SPECIES_GIRATINA:
                Mon_UpdateGiratinaForm(mon);
                break;
            case SPECIES_ROTOM:
                Mon_UpdateRotomForm(mon, 0, 0);
                break;
            case SPECIES_SHAYMIN:
                Mon_UpdateShayminForm(mon, 0);
                break;
            }
        }
    }
    return FALSE;
}

BOOL ScrCmd_SetMonForm(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 index = ScriptGetVar(ctx);
    u16 form = ScriptGetVar(ctx);
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), index);
    SetMonData(mon, MON_DATA_FORM, &form);
    return FALSE;
}

BOOL ScrCmd_CountTranformedRotomsInParty(ScriptContext *ctx) {
    int i, partyCount, count;
    u32 species, form, isEgg;
    Pokemon *mon;
    Party *party;
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *rotomCount = ScriptGetVarPointer(ctx);
    u16 *firstIndex = ScriptGetVarPointer(ctx);

    count = 0;
    *firstIndex = 255;

    party = SaveArray_Party_Get(fieldSystem->saveData);
    partyCount = Party_GetCount(party);
    for (i = 0; i < partyCount; i++) {
        mon = Party_GetMonByIndex(party, i);
        species = GetMonData(mon, MON_DATA_SPECIES, 0);
        form = GetMonData(mon, MON_DATA_FORM, 0);
        isEgg = GetMonData(mon, MON_DATA_IS_EGG, 0);
        if (species == SPECIES_ROTOM && form && !isEgg) {
            if (*firstIndex == 255) {
                *firstIndex = i;
            }
            count++;
        }
    }
    *rotomCount = count;
    return FALSE;
}

BOOL ScrCmd_UpdateRotomForm(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    int rotomIndex = ScriptGetVar(ctx);
    int defaultSlot = ScriptGetVar(ctx);
    ScriptGetVar(ctx); //unsused variable
    u32 form = ScriptGetVar(ctx);
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), rotomIndex);
    Mon_UpdateRotomForm(mon, form, defaultSlot);
    Pokedex_SetMonCaughtFlag(Save_Pokedex_Get(fieldSystem->saveData), mon);
    return FALSE;
}

BOOL ScrCmd_GetHiddenPowerType(ScriptContext *ctx) {
    int power, type;
    FieldSystem *fieldSystem = ctx->fieldSystem;
    int partyIndex = ScriptGetVar(ctx);
    u16 *typePtr = ScriptGetVarPointer(ctx);
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), partyIndex);

    u16 species = GetMonData(mon, MON_DATA_SPECIES, 0);

    if (GetMonData(mon, MON_DATA_IS_EGG, 0) == FALSE) {
        switch (species) {
        case SPECIES_CATERPIE:
        case SPECIES_METAPOD:
        case SPECIES_WEEDLE:
        case SPECIES_KAKUNA:
        case SPECIES_MAGIKARP:
        case SPECIES_DITTO:
        case SPECIES_WOBBUFFET:
        case SPECIES_SMEARGLE:
        case SPECIES_WURMPLE:
        case SPECIES_SILCOON:
        case SPECIES_CASCOON:
        case SPECIES_WYNAUT:
        case SPECIES_BELDUM:
        case SPECIES_KRICKETOT:
        case SPECIES_BURMY: //Despite Burmy learning hidden power by level up, you cannot check what type it is until it evolves
        case SPECIES_COMBEE:
            *typePtr = -1;
            return FALSE;
        }
    }

    GetHiddenPowerPowerType(mon, &power, &type);
    *typePtr = type;

    return FALSE;
}

static void GetHiddenPowerPowerType(Pokemon *mon, s32 *power, s32 *type) {
    int hpIv = GetMonData(mon, MON_DATA_HP_IV, 0);
    int atkIv = GetMonData(mon, MON_DATA_ATK_IV, 0);
    int defIv = GetMonData(mon, MON_DATA_DEF_IV, 0);
    int spdIv = GetMonData(mon, MON_DATA_SPEED_IV, 0);
    int spatkIv = GetMonData(mon, MON_DATA_SPATK_IV, 0);
    int spdefIv = GetMonData(mon, MON_DATA_SPDEF_IV, 0);
    if (power) {
        *power = ((hpIv & 2) >> 1) |
                 (atkIv & 2) |
                 ((defIv & 2) << 1) |
                 ((spdIv & 2) << 2) |
                 ((spatkIv & 2) << 3) |
                 ((spdefIv & 2) << 4);
        *power = ((*power)*40/63)+30;
    }
    if (type) {
        *type = (hpIv & 1) |
                 ((atkIv & 1) << 1) |
                 ((defIv & 1) << 2) |
                 ((spdIv & 1) << 3) |
                 ((spatkIv & 1) << 4) |
                 ((spdefIv & 1) << 5);
        *type = ((*type)*15/63)+1;

        if (*type >= 9) {
            (*type)++;
        }
    }
}

BOOL ScrCmd_SetFavoriteMon(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), 0);
    SAVE_MISC_DATA *data = Save_Misc_Get(fieldSystem->saveData);
    u32 species = GetMonData(mon, MON_DATA_SPECIES, 0);
    u32 form = GetMonData(mon, MON_DATA_FORM, 0);
    u32 isEgg = GetMonData(mon, MON_DATA_IS_EGG, 0);
    SaveMisc_SetFavoriteMon(data, species, form, isEgg);
    return FALSE;
}

BOOL ScrCmd_GetFavoriteMon(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u32 sp, form, egg;
    u16 *species = ScriptGetVarPointer(ctx);
    u16 *formPtr = ScriptGetVarPointer(ctx);
    u16 *isEgg = ScriptGetVarPointer(ctx);
    SAVE_MISC_DATA *data = Save_Misc_Get(fieldSystem->saveData);
    SaveMisc_GetFavoriteMon(data, &sp, &form, &egg);
    *species = sp;
    *formPtr = form;
    *isEgg = egg;
    return FALSE;
}

BOOL ScrCmd_GetPartyMonForm(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u32 index = ScriptGetVar(ctx);
    u16 *form = ScriptGetVarPointer(ctx);
    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(fieldSystem->saveData), index);
    *form = GetMonData(mon, MON_DATA_FORM, 0);
    return FALSE;
}

BOOL ScrCmd_699(ScriptContext *ctx) {
    u32 unkVar;
    FieldSystem *fieldSystem;
    MapObjectManager *mapObjectMan;
    LocalMapObject *playerObj;
    LocalMapObject *curObj;
    Sprite *sprite;
    int height;
    VecFx32 vec;

    unkVar = 0;

    fieldSystem = ctx->fieldSystem;
    mapObjectMan = fieldSystem->mapObjectMan;

    playerObj  = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);
    MapObject_GetPositionVec(playerObj, &vec);

    height = vec.y;

    while (sub_0205EEF4(mapObjectMan, &curObj, &unkVar, 1) == TRUE) {
        if (curObj == playerObj) continue;
        MapObject_SetFlagsBits(curObj, MAPOBJECTFLAG_UNK13);
        if (MapObject_TestFlagsBits(curObj, MAPOBJECTFLAG_UNK12) == TRUE) {
            MapObject_GetPositionVec(curObj, &vec);
            vec.y = height;
            MapObject_SetPositionVec(curObj, &vec);
            MapObject_SetCurrentHeight(curObj, (height >> 3) / FX32_ONE);
        }
        sprite = ov01_021F72DC(curObj);
        if (sprite) {
            ov01_021FA3E8(curObj, sprite);
            sub_02023EA4(sprite, 1);
        }
    }
    return FALSE;
}

BOOL ScrCmd_700(ScriptContext *ctx) {
    u32 index = 0;
    FieldSystem *fieldSystem;
    MapObjectManager *mapObjectMan;
    LocalMapObject *playerObj;
    LocalMapObject *curObj;

    fieldSystem = ctx->fieldSystem;
    mapObjectMan = fieldSystem->mapObjectMan;

    playerObj  = PlayerAvatar_GetMapObject(fieldSystem->playerAvatar);

    while (sub_0205EEF4(mapObjectMan, &curObj, &index, MAPOBJECTFLAG_ACTIVE) == TRUE) {
        if (curObj == playerObj) continue;
        MapObject_ClearFlagsBits(curObj, MAPOBJECTFLAG_UNK13);
    }

    return FALSE;
}

BOOL ScrCmd_BattleTowerSetUpMultiBattle(ScriptContext *ctx) {
    sub_0202CA44(ctx->fieldSystem->saveData);
    sub_02039F68();
    return TRUE;
}

BOOL ScrCmd_SetPlayerVolume(ScriptContext *ctx) {
    GF_SndHandleSetPlayerVolume(1, ScriptGetVar(ctx));
    return FALSE;
}

BOOL ScrCmd_CheckMonSeen(ScriptContext *ctx) {
    u16 monNumber = ScriptGetVar(ctx);
    u16 *seenFlag = ScriptGetVarPointer(ctx);

    *seenFlag = Pokedex_CheckMonSeenFlag(Save_Pokedex_Get(ctx->fieldSystem->saveData), monNumber);

    return FALSE;
}

//Related to the trapped floor in the rocket hideout
BOOL ScrCmd_708(ScriptContext *ctx) {
    u32 unkVar = ScriptGetVar(ctx);
    ov02_022460AC(ctx->fieldSystem->taskman, unkVar);
    return TRUE;
}

BOOL ScrCmd_ShowLegendaryWing(ScriptContext *ctx) {
    u32 unkVar = ScriptGetVar(ctx);
    ShowLegendaryWing(ctx->fieldSystem->taskman, unkVar);
    return TRUE;
}

//Related to Persian statues in the rocket hideout
BOOL ScrCmd_709(ScriptContext *ctx) {
    ov02_022462E8(ctx->fieldSystem->taskman);
    return TRUE;
}

BOOL ScrCmd_ScreenShake(ScriptContext *ctx) {
    u32 a1 = ScriptGetVar(ctx);
    u32 a2 = ScriptGetVar(ctx);
    u32 a3 = ScriptGetVar(ctx);
    u32 a4 = ScriptGetVar(ctx);
    ov02_02246714(ctx->fieldSystem->taskman, a1, a2, a3, a4);
    return TRUE;
}

//Related to Lance flying off on his dragonite in the Lake of Rage
BOOL ScrCmd_775(ScriptContext *ctx) {
    u32 objIdA = ScriptGetVar(ctx);
    u32 objIdB = ScriptGetVar(ctx);

    LocalMapObject *objA = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, objIdA);
    LocalMapObject *objB = GetMapObjectByID(ctx->fieldSystem->mapObjectMan, objIdB);

    ov02_022469B4(ctx->fieldSystem->taskman, objA, objB);

    return TRUE;
}

BOOL ScrCmd_OpenAlphHiddenRoom(ScriptContext *ctx) {
    OpenAlphHiddenRoom(ctx->fieldSystem->taskman, ScriptReadByte(ctx));
    return TRUE;
}

static u32 ov01_02201B2C(u32 unkA) {
    u16 ret = 0xFFFF;
    if (unkA <= ret) {
        ret = unkA;
    }
    return ret;
}

//Related to Pokeathlon "Ball Sign"- whatever that is
BOOL ScrCmd_724(ScriptContext *ctx) {
    u8 unkVar = ScriptGetVar(ctx);
    u16 *unkPtrA = ScriptGetVarPointer(ctx);

    Pokeathlon_UnkSubStruct_B00 *unkPtrB = sub_0203199C(Save_Pokeathlon_Get(ctx->fieldSystem->saveData));

    if (unkVar <= 9) {
        *unkPtrA = ov01_02201B2C(unkPtrB->unk44[unkVar]);
        return FALSE;
    }

    switch (unkVar - 10) {
    case 0:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk8);
        break;
    case 1:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk70);
        break;
    case 2:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk4);
        break;
    case 3:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk14);
        break;
    case 4:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk1C);
        break;
    case 5:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk24);
        break;
    case 6:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk2C);
        break;
    case 7:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk30);
        break;
    default:
        *unkPtrA = 0;
        break;
    }

    return FALSE;
}

//This does something with pokeathlon records like "number times jumped"
BOOL ScrCmd_725(ScriptContext *ctx) {
    s32 val;

    u8 unkA = ScriptReadByte(ctx);
    u32 unkB = ScriptGetVar(ctx);

    Pokeathlon_UnkSubStruct_B00 *unkPtr = sub_020319F0(Save_Pokeathlon_Get(ctx->fieldSystem->saveData));

    if (unkA == 0) {
        val = unkPtr->unk70 + unkB;
        if ((u32) val > 0xFFFF) {
            unkPtr->unk70 = 0xFFFF;
        } else {
            unkPtr->unk70 = val;
        }
    } else {
        val = unkPtr->unk70 - unkB;
        if (val < 0) {
            unkPtr->unk70 = 0;
        } else {
            unkPtr->unk70 = val;
        }
    }

    return FALSE;
}

BOOL ScrCmd_726(ScriptContext *ctx) {
    ov01_021E7F00(ctx->fieldSystem, TRUE);
    return FALSE;
}

//Related to Kurt
BOOL ScrCmd_735(ScriptContext *ctx) {
    u16 *apricornQuantity = ScriptGetVarPointer(ctx);
    *apricornQuantity = ApricornBox_GetKurtQuantity(Save_ApricornBox_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_ClearKurtApricorn(ScriptContext *ctx) {
    ApricornBox_SetKurtApricorn(Save_ApricornBox_Get(ctx->fieldSystem->saveData), 0, 0);
    return FALSE;
}

//Related to Kurt
BOOL ScrCmd_737(ScriptContext *ctx) {
    u16 *unkPtr = ScriptGetVarPointer(ctx);
    *unkPtr = ApricornBox_GetKurtBall(Save_ApricornBox_Get(ctx->fieldSystem->saveData));
    return FALSE;
}

//Related to Kurt
BOOL ScrCmd_GetTotalApricornCount(ScriptContext *ctx) {
    s32 i;
    u32 cnt;
    u16 *unkPtr = ScriptGetVarPointer(ctx);
    cnt = 0;
    SaveApricornBox *apricornBox = Save_ApricornBox_Get(ctx->fieldSystem->saveData);
    for (i = 0; i < 7; i = i + 1) {
        cnt += ApricornBox_CountApricorn(apricornBox, i);
    }
    *unkPtr = cnt;
    return FALSE;
}

//Related to Kurt- canceling
BOOL ScrCmd_739(ScriptContext *ctx) { //todo: rename structs and find out stuff
    struct ApricornBoxWork **unkPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    *unkPtr = CreateApricornBoxWork(ctx->fieldSystem, 2);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

//Related to aprijuice stand- canceling
BOOL ScrCmd_740(ScriptContext *ctx) {
    u32 **unkPtrA = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA);
    u32 unkVar = ScriptGetVar(ctx);
    u16 *unkPtrB = ScriptGetVarPointer(ctx);
    *unkPtrA = sub_0203ED80(ctx->fieldSystem, unkVar, unkPtrB);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

//Related to aprijuice stand- viewing label
BOOL ScrCmd_741(ScriptContext *ctx) {
    UnkStruct_02031CEC unkOut;
    RTCDate date;
    s32 unkVar;
    MessageFormat **msgfmt;
    SaveApricornBox *apricornBox;
    u16 *price;
    u16 *unkPtrA;
    u16 *unkPtrC;
    String *str;

    apricornBox = Save_ApricornBox_Get(ctx->fieldSystem->saveData);
    msgfmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    unkVar = ScriptGetVar(ctx);
    unkPtrA = ScriptGetVarPointer(ctx);
    price = ScriptGetVarPointer(ctx);
    unkPtrC = ScriptGetVarPointer(ctx);
    GF_RTC_CopyDate(&date);
    *unkPtrA = unkVar + 5;
    if (!sub_02031CEC(apricornBox, *unkPtrA, &unkOut)) {
        *unkPtrA = (date.week + 2*unkVar) % 5;
        sub_02031CEC(apricornBox, *unkPtrA, &unkOut);
    }
    str = sub_020322AC(apricornBox, *unkPtrA, 0x20);
    BufferString(*msgfmt, 0, str, 2, 1, gGameVersion); //buffer owner..?
    FreeToHeap(str);
    str = sub_02032308(apricornBox, *unkPtrA, 0x20);
    BufferString(*msgfmt, 1, str, 2, 1, gGameVersion); //buffer juice type..?
    FreeToHeap(str);

    unkVar = sub_02031D80(&unkOut);
    *price = (unkOut.unk0 / 10) + 2*unkVar;

    if (*price < 100) {
        *price = 100;
    } else if (*price > 5000) {
        *price = 5000;
    }

    BufferIntegerAsString(*msgfmt, 2, *price, 4, PRINTING_MODE_LEFT_ALIGN, 1);
    BufferIntegerAsString(*msgfmt, 3, unkVar, 3, PRINTING_MODE_LEFT_ALIGN, 1); //richness..?
    BufferIntegerAsString(*msgfmt, 4, unkOut.unk2, 3, PRINTING_MODE_LEFT_ALIGN, 1); //smoothness..?

    *unkPtrC = unkOut.unk0;

    return FALSE;
}

//Gets called after selecting which type of pokeathlon data to load- might just outright start the loading process
BOOL ScrCmd_743(ScriptContext *ctx) {
    ov03_02258CFC(ctx->taskman, (enum PokeathlonData)ScriptGetVar(ctx));
    return TRUE;
}

extern u8 sFriendshipRoomStatuesPositions[3][2];

BOOL ScrCmd_CreatePokeathlonFriendshipRoomStatues(ScriptContext *ctx) {
    s32 i;
    u16 species;
    FieldSystem *fieldSystem = ctx->fieldSystem;

    SavePokeathlonFriendshipRecords *unkPtr = sub_02031B00(fieldSystem->saveData);

    for (i = 0; i < 3; i++) {
        LocalMapObject *mapObj = GetMapObjectByID(fieldSystem->mapObjectMan, 0xf6 + i);

        if (mapObj) {
            DeleteMapObject(mapObj);
        }

        species = unkPtr->friendshipRoomStatues[i].species;

        if (species != SPECIES_NONE && species <= SPECIES_ARCEUS) {
            ov01_02201F98(fieldSystem->mapObjectMan, (u8) i, species, unkPtr->friendshipRoomStatues[i].form, unkPtr->friendshipRoomStatues[i].gender, sFriendshipRoomStatuesPositions[i][0], sFriendshipRoomStatuesPositions[i][1], fieldSystem->location->mapId);
        }
    }
    return TRUE;
}

static LocalMapObject *ov01_02201F98(MapObjectManager *mapObjectMan, u8 unkA, u16 species, u16 form, u32 gender, u32 x, u32 y, u32 mapId) {
    LocalMapObject *mapObj;
    u32 spriteId;
    u32  size;

    spriteId = FollowingPokemon_GetSpriteID(species, form, gender) << 1;
    size = GetFollowPokeSizeParamBySpecies(species)*3 + unkA;

    mapObj = CreateSpecialFieldObjectEx(mapObjectMan, x, y, DIR_SOUTH, size + 0x19f, 0, mapId, 0, 0, spriteId);

    if (!mapObj) {
        GF_AssertFail();
    }

    MapObject_SetID(mapObj, unkA + 0xf6);
    MapObject_SetType(mapObj, 0);
    MapObject_SetFlagID(mapObj, 0);
    MapObject_SetScript(mapObj, 0);
    MapObject_SetParam(mapObj, 0, 2);
    sub_02069F0C(mapObj, species, (u8) form, FALSE, spriteId);
    MapObject_SetXRange(mapObj, -1);
    MapObject_SetYRange(mapObj, -1);
    MapObject_SetFlagsBits(mapObj, MAPOBJECTFLAG_UNK30);
    MapObject_ClearFlagsBits(mapObj, 0);
    MapObject_SetFlag29(mapObj, FALSE);

    return mapObj;
}

BOOL ScrCmd_CheckSeenAllLetterUnown(ScriptContext *ctx) {
    u32 form;
    s32 i;
    u32 counter;
    s32 unownForms;
    Pokedex *pokedex;
    u16 *allUnownSeen;

    allUnownSeen = ScriptGetVarPointer(ctx);
    pokedex = Save_Pokedex_Get(ctx->fieldSystem->saveData);

    unownForms = Pokedex_GetSeenFormNum_Unown(pokedex, 1);
    if (unownForms < 26) {
        *allUnownSeen = FALSE;
        return TRUE;
    }

    counter = 0;
    for (i = 0; i < unownForms; i++) {
        form = Pokedex_GetSeenFormByIdx_Unown(pokedex, i, TRUE);
        if (form != 26 && form != 27) {
            counter++;
        }
    }

    if (counter == 26) {
        *allUnownSeen = TRUE;
    } else {
        *allUnownSeen = FALSE;
    }

    return TRUE;
}

BOOL ScrCmd_GiveTogepiEgg(ScriptContext *ctx) {
    s32 i;
    u8 pp;
    u16 moveData;
    Pokemon *mon;
    PlayerProfile *profile;
    Party *party;
    FieldSystem *fieldSystem = ctx->fieldSystem;

    profile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    party = SaveArray_Party_Get(fieldSystem->saveData);

    if (Party_GetCount(party) >= 6) {
        return FALSE;
    }

    mon = AllocMonZeroed(HEAP_ID_FIELD);
    ZeroMonData(mon);

    SetEggStats(mon, SPECIES_TOGEPI, 1, profile, 3, sub_02017FE4(MAPSECTYPE_GIFT, 0xd));

    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (GetMonData(mon, MON_DATA_MOVE1 + i, 0) == MOVE_NONE) {
            break;
        }
    }

    if (i == MAX_MON_MOVES) {
        i = MAX_MON_MOVES - 1;
    }

    moveData = MOVE_EXTRASENSORY;
    SetMonData(mon, MON_DATA_MOVE1 + i, &moveData);

    pp = GetMonData(mon, MON_DATA_MOVE1MAXPP + i, 0);
    SetMonData(mon, MON_DATA_MOVE1PP + i, &pp);

    Party_AddMon(party, mon);

    FreeToHeap(mon);

    SaveMisc_SetTogepiPersonalityGender(Save_Misc_Get(fieldSystem->saveData), GetMonData(mon, MON_DATA_PERSONALITY, 0), GetMonData(mon, MON_DATA_GENDER, 0));

    return FALSE;
}

//unused
BOOL ScrCmd_777(ScriptContext *ctx) {
    u32 partyIndex = ScriptGetVar(ctx);
    u16 *unkPtr = ScriptGetVarPointer(ctx);

    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), partyIndex);

    *unkPtr = sub_0206D8D0(mon, ctx->fieldSystem->saveData);

    return FALSE;
}

extern u16 sSpikyEarPichuMoveset[4];

BOOL ScrCmd_GiveSpikyEarPichu(ScriptContext *ctx) {
    s32 i;
    u8 form;
    u8 maxPP;
    u16 heldItem;
    Pokemon *mon;
    Party *party;
    FieldSystem *fieldSystem;
    PlayerProfile *profile;

    fieldSystem = ctx->fieldSystem;

    profile = Save_PlayerData_GetProfileAddr(fieldSystem->saveData);
    party = SaveArray_Party_Get(fieldSystem->saveData);
    if (Party_GetCount(party) >= 6) {
        return FALSE;
    }
    mon = AllocMonZeroed(HEAP_ID_FIELD);
    ZeroMonData(mon);

    u32 trId = PlayerProfile_GetTrainerID(profile);
    u32 unkA = ChangePersonalityToNatureGenderAndAbility(trId, 0xac, NATURE_NAUGHTY, MON_FEMALE, 0, 0);
    CreateMon(mon, SPECIES_PICHU, 30, 0x20, 1, unkA, 1, trId);

    form = 1;
    SetMonData(mon, MON_DATA_FORM, &form);

    for (i = 0; i < MAX_MON_MOVES; i++) {
        SetMonData(mon, MON_DATA_MOVE1 + i, &sSpikyEarPichuMoveset[i]);
        maxPP = GetMonData(mon, MON_DATA_MOVE1MAXPP + i, 0);
        SetMonData(mon, MON_DATA_MOVE1PP + i, &maxPP);
    }

    heldItem = ITEM_ZAP_PLATE;
    SetMonData(mon, MON_DATA_HELD_ITEM, &heldItem);

    u32 unkB = sub_02017FE4(MAPSECTYPE_NORMAL, MapHeader_GetMapSec(ctx->fieldSystem->location->mapId));

    sub_020720FC(mon, profile, 4, unkB, 0x18, HEAP_ID_FIELD);

    Party_AddMon(party, mon);

    FreeToHeap(mon);

    UpdatePokedexWithReceivedSpecies(fieldSystem->saveData, mon);

    return FALSE;
}

BOOL ScrCmd_PhotoAlbumIsFull(ScriptContext *ctx) {
    FieldSystem *fieldSystem = ctx->fieldSystem;
    u16 *albumIsFull = ScriptGetVarPointer(ctx);

    *albumIsFull = (PhotoAlbum_GetNumSaved(Save_PhotoAlbum_Get(fieldSystem->saveData)) >= 36);

    return FALSE;
}

BOOL ScrCmd_RadioMusicIsPlaying(ScriptContext *ctx) {
    u32 musicSeq = ScriptGetVar(ctx);
    u16 *isPlaying = ScriptGetVarPointer(ctx);

    *isPlaying = (GetRadioMusicPlayingSeq() == musicSeq);

    return FALSE;
}

extern s32 sSlotLuckDistribution[2][2];

// Return value is unused outside of Japanese copies.
static u32 SlotLuckiness(SaveData *saveData, u8 machineId, u8 city) {
    SAV_FRIEND_GRP *friendGroup;
    u8 *luckValues;
    s32 *dist;
    u32 numMachines;
    s32 rngSeed;
    u8 luckiness;
    u8 randIdx;
    u32 i;
    s32 j;

    friendGroup = Save_FriendGroup_Get(saveData);

    if (city != 0) { //1 = celadon; 0 = goldenrod
        numMachines = 14;
    } else {
        numMachines = 21;
    }

    if (machineId >= numMachines) {
        return 3;
    }

    rngSeed = GetLCRNGSeed();
    SetLCRNGSeed(sub_0202C7DC(friendGroup));

    luckValues = AllocFromHeapAtEnd(HEAP_ID_32, numMachines);
    MI_CpuFill8(luckValues, 0, numMachines);

    i = 0;
    dist = sSlotLuckDistribution[city];

    for (; i < 2; i = (u8) ++i) { //I swear I couldn't get it to match otherwise
        for (j = 0; j < dist[i]; j = (u8) ++j) {
            do {
                randIdx = LCRandom() % (s32) numMachines;
            } while (luckValues[randIdx] != 0);
            luckValues[randIdx] = i + 1;
        }
    }

    luckiness = luckValues[machineId];

    FreeToHeap(luckValues);
    SetLCRNGSeed(rngSeed);

    return luckiness;
}

BOOL ScrCmd_CasinoGame(ScriptContext *ctx) {
    u8 machineId = ScriptReadByte(ctx);
    u8 city = ScriptReadByte(ctx); //1 = celadon; 0 = goldenrod
    u32 **unkPtr = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_RUNNING_APP_DATA); //VoltorbFlipAppData

    *unkPtr = LaunchVoltorbFlipApp(ctx->fieldSystem, SlotLuckiness(ctx->fieldSystem->saveData, machineId, city)); //this is messy, very very messy

    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_BufferPokeathlonCourseName(ScriptContext *ctx) {
    u8 fieldNo = ScriptReadByte(ctx);
    u32 courseId = ScriptGetVar(ctx);
    BufferPokeathlonCourseName(*(MessageFormat**)FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT), fieldNo, (u8) courseId);
    return FALSE;
}

//Gets called when getting a package from your mom
BOOL ScrCmd_811(ScriptContext *ctx) {
    u16 *unkPtr1 = ScriptGetVarPointer(ctx);
    u16 *unkPtr2 = ScriptGetVarPointer(ctx);

    *unkPtr2 = sub_0202F224(SaveData_GetMomsSavingsAddr(ctx->fieldSystem->saveData), 0, unkPtr1);

    return FALSE;
}

//Gets called when getting a package from your mom
BOOL ScrCmd_812(ScriptContext *ctx) {
    sub_0202F1F4(SaveData_GetMomsSavingsAddr(ctx->fieldSystem->saveData));
    return FALSE;
}

BOOL ScrCmd_GetBuenasPassword(ScriptContext *ctx) {
    u16 *msgPtr = ScriptGetVarPointer(ctx);
    u16 *unkPtr2 = ScriptGetVarPointer(ctx);

    u8 unkVar = Save_VarsFlags_GetBuenasPasswordSet(Save_VarsFlags_Get(ctx->fieldSystem->saveData)) % 30;

    *msgPtr = 2*(unkVar / 3) + unkVar / 3 + msg_0066_D23R0102_00040;

    *unkPtr2 = unkVar % 3;
    return FALSE;
}

static u32 MonGetShinyLeafCount(Pokemon *mon) {
    int c;
    u32 shinyLeafCount = 0;

    for (c = 0; c < 5; c++) {
        shinyLeafCount += GetMonData(mon, MON_DATA_SHINY_LEAF_A + c, NULL);
    }
    if (shinyLeafCount == 5 && GetMonData(mon, MON_DATA_SHINY_LEAF_CROWN, NULL) != 0) {
        shinyLeafCount = 6;
    }

    return shinyLeafCount;
}

BOOL ScrCmd_GetShinyLeafCount(ScriptContext *ctx) {
    u32 monIndex = ScriptGetVar(ctx);
    u16 *shinyLeafCount = ScriptGetVarPointer(ctx);
    *shinyLeafCount = MonGetShinyLeafCount(Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), monIndex));
    return FALSE;
}

BOOL ScrCmd_TryGiveShinyLeafCrown(ScriptContext *ctx) {
    u32 monIndex = ScriptGetVar(ctx);

    Pokemon *mon = Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), monIndex);
    if (MonGetShinyLeafCount(Party_GetMonByIndex(SaveArray_Party_Get(ctx->fieldSystem->saveData), monIndex)) == 5) {
        u8 data = TRUE;
        SetMonData(mon, MON_DATA_SHINY_LEAF_CROWN, &data);
    }

    return FALSE;
}

BOOL ScrCmd_GetUniqueSealsQuantity(ScriptContext *ctx) {
    u16 *uniqueSeals = ScriptGetVarPointer(ctx);

    *uniqueSeals = SealCase_CountUniqueSeals(Save_SealCase_Get(ctx->fieldSystem->saveData));

    return FALSE;
}

BOOL ScrCmd_GetSealQuantity(ScriptContext *ctx) {
    u32 sealId = ScriptGetVar(ctx);
    u16 *sealQuantity = ScriptGetVarPointer(ctx);

    *sealQuantity = SealCase_CountSealOccurrenceAnywhere(Save_SealCase_Get(ctx->fieldSystem->saveData), sealId);

    return FALSE;
}

BOOL ScrCmd_GiveOrTakeSeal(ScriptContext *ctx) {
    u32 sealId = ScriptGetVar(ctx);
    u32 quantity = ScriptGetVar(ctx);

    GiveOrTakeSeal(Save_SealCase_Get(ctx->fieldSystem->saveData), sealId, quantity);

    return FALSE;
}

static BOOL IsSealNonUnique(u16 sealId, u16 *uniqueSealIds, s32 size) {
    s32 c;

    for (c = 0; c < size; c++) {
        if (sealId == uniqueSealIds[c]) {
            return TRUE;
        }
    }

    return FALSE;
}

BOOL ScrCmd_GiveRandomSeal(ScriptContext *ctx) {
    int i, j;
    u16 randVal;
    s32 avaliableSeals;
    u8 uniqueSeals[3];
    u16 givenSealIds[3];
    u16 *sealThresholds;
    SealCase *sealcase;
    u16 *seal1;
    u16 *seal2;
    u16 *seal3;
    s32 givenSeals;

    avaliableSeals = 0;

    seal1 = ScriptGetVarPointer(ctx);
    seal2 = ScriptGetVarPointer(ctx);
    seal3 = ScriptGetVarPointer(ctx);

    sealcase = Save_SealCase_Get(ctx->fieldSystem->saveData);

    sealThresholds = AllocFromHeapAtEnd(HEAP_ID_32, sizeof(u16)*SEAL_MYSTERY);

    MI_CpuFill8(sealThresholds, 0, sizeof(u16)*SEAL_MYSTERY);
    MI_CpuFill8(uniqueSeals, 0, sizeof(u8)*3);

    //Seals indexed 'mystery' and onward weren't officially released
    for (i = 0; i < SEAL_MYSTERY; i++) {
        avaliableSeals += SEAL_INVENTORY_QMAX - SealCase_CountSealOccurrenceAnywhere(sealcase, i + 1);
        sealThresholds[i] = avaliableSeals;
    }

    if (avaliableSeals > 3) {
        givenSeals = 3;
    } else {
        givenSeals = avaliableSeals;
    }

    i = 0;

    while (i < givenSeals) {
        do {
            randVal = LCRandom() % avaliableSeals;
        } while (IsSealNonUnique(randVal, givenSealIds, i));

        givenSealIds[i] = randVal;

        for (j = 0; j < SEAL_MYSTERY; j++) {
            if (randVal < sealThresholds[j]) {
                uniqueSeals[i] = j + 1;
                GiveOrTakeSeal(sealcase, uniqueSeals[i], 1);
                break;
            }
        }
        i++;
    }

    FreeToHeap(sealThresholds);

    *seal1 = uniqueSeals[0];
    *seal2 = uniqueSeals[1];
    *seal3 = uniqueSeals[2];

    return FALSE;
}

BOOL ScrCmd_CheckKyogreGroudonInParty(ScriptContext *ctx) {
    int c;
    u32 unkVar;
    int partyCount;
    Party *playerParty;
    u16 *unkPtr;

    u8 kyogreGroudonFlags = 0;

    unkPtr = ScriptGetVarPointer(ctx);
    playerParty = SaveArray_Party_Get(ctx->fieldSystem->saveData);
    partyCount = Party_GetCount(playerParty);
    unkVar = *(ctx->script_ptr);

    for (c = 0; c < partyCount; c++) {
        Pokemon *mon = Party_GetMonByIndex(playerParty, c);
        u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        u8 gameVer = GetMonData(mon, MON_DATA_GAME_VERSION, NULL);
        if (!GetMonData(mon, MON_DATA_IS_EGG, NULL)
            && !GetMonData(mon, MON_DATA_CHECKSUM_FAILED, NULL)
            && !GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL)) {

            switch (species) {
            case SPECIES_KYOGRE:
                if (gameVer == 7) {
                    kyogreGroudonFlags |= 1;
                }
                break;
            case SPECIES_GROUDON:
                if (gameVer == 8) {
                    kyogreGroudonFlags |= 1 << 1;
                }
                break;
            }
        }
    }

    if (kyogreGroudonFlags == 3) {
        *unkPtr = TRUE;
    } else {
        *unkPtr = FALSE;
    }

    return FALSE;
}

BOOL ScrCmd_SysSetSleepFlag(ScriptContext *ctx) {
    if (ScriptGetVar(ctx) != 0) {
        Sys_SetSleepDisableFlag(1 << 3);
    } else {
        Sys_ClearSleepDisableFlag(1 << 3);
    }
    return FALSE;
}

BOOL ScrCmd_BugContestAction(ScriptContext *ctx) {
    u8 unkVar1 = ScriptReadByte(ctx);
    u32 weekday = ScriptGetVar(ctx);

    FieldSystem *fieldSystem = ctx->fieldSystem;

    if (unkVar1 == 0) {
        fieldSystem->bugContest = BugContest_New(fieldSystem, weekday);
    } else {
        BugContest_Delete(fieldSystem->bugContest);
        fieldSystem->bugContest = NULL;
        sub_02093070(fieldSystem);
    }
    return FALSE;
}

BOOL ScrCmd_BufferBugContestWinner(ScriptContext *ctx) {
    MessageFormat **msgfmt;
    BUGCONTEST *bugContest;

    msgfmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    bugContest = FieldSystem_BugContest_Get(ctx->fieldSystem);

    BugContest_BufferContestWinnerNames(bugContest, ctx->msgdata, *msgfmt, *ctx->script_ptr++);

    return FALSE;
}

BOOL ScrCmd_JudgeBugContest(ScriptContext *ctx) {
    BUGCONTEST *bugContest;
    u16 *prize;
    u16 *placement;
    u16 *species;

    bugContest = FieldSystem_BugContest_Get(ctx->fieldSystem);
    placement = ScriptGetVarPointer(ctx);
    prize = ScriptGetVarPointer(ctx);
    species = ScriptGetVarPointer(ctx);

    BugContest_Judge(bugContest);

    *placement = bugContest->placement;
    *prize = bugContest->prize;

    if (bugContest->caught_poke == 0) {
        *species = 0;
    } else {
        *species = GetMonData(bugContest->mon, MON_DATA_SPECIES, NULL);
    }

    return FALSE;
}

BOOL ScrCmd_BufferBugContestMonNick(ScriptContext *ctx) {
    MessageFormat **msgfmt;
    BUGCONTEST *bugContest;
    u32 script_index;

    msgfmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);
    bugContest = FieldSystem_BugContest_Get(ctx->fieldSystem);

    script_index = ScriptReadByte(ctx);

    u16 *monNick = ScriptGetVarPointer(ctx);
    *monNick = BugContest_BufferCaughtMonNick(bugContest, *msgfmt, script_index);
    return FALSE;
}

BOOL ScrCmd_BugContestGetTimeLeft(ScriptContext *ctx) {
    MessageFormat **msgfmt;
    BUGCONTEST *bugContest;
    u32 script_index;
    u32 timeLeft;

    msgfmt = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_MESSAGE_FORMAT);

    script_index = ScriptReadByte(ctx);
    timeLeft = 1;

    bugContest = FieldSystem_BugContest_Get(ctx->fieldSystem);

    if (bugContest != 0 && bugContest->elapsed_time < 20) {
        timeLeft = 20 - bugContest->elapsed_time;
    }

    BufferIntegerAsString(*msgfmt, script_index, timeLeft, 2, PRINTING_MODE_LEFT_ALIGN, 1);

    return FALSE;
}

BOOL ScrCmd_IsBugContestantRegistered(ScriptContext *ctx) {
    BUGCONTEST *bugContest = FieldSystem_BugContest_Get(ctx->fieldSystem);
    u32 id = ScriptGetVar(ctx);
    u16 *ptr = ScriptGetVarPointer(ctx);
    *ptr = BugContest_ContestantIsRegistered(bugContest, id);
    return FALSE;
}
