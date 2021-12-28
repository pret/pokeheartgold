#define _IN_FIELDMAP_C

#include "fieldmap.h"
#include "map_header.h"
#include "event_data.h"
#include "map_events.h"
#include "fielddata/script/scr_seq.naix"
#include "msgdata/msg.naix"

struct ScriptBankMapping {
    u16 mapIdLo;
    u16 scriptBank;
    u16 msgBank;
};

struct HiddenItemData {
    u16 unk0;
    u8 unk2;
    u8 unk3;
    u16 unk4;
    u16 unk6;
};

#include "data/fieldmap.h"

const struct ScriptBankMapping sScriptBankMapping[30] = {
    {10490, NARC_scr_seq_scr_seq_0263_bin, NARC_msg_msg_0433_bin},
    {10450, NARC_scr_seq_scr_seq_0264_bin,  NARC_msg_msg_0019_bin},
    {10440, NARC_scr_seq_scr_seq_0002_bin, NARC_msg_msg_0748_bin},
    {10400, NARC_scr_seq_scr_seq_0151_bin, NARC_msg_msg_0246_bin},
    {10350, NARC_scr_seq_scr_seq_0952_bin, NARC_msg_msg_0726_bin},
    {10300, NARC_scr_seq_scr_seq_0734_bin, NARC_msg_msg_0444_bin},
    {10200, NARC_scr_seq_scr_seq_0144_bin, NARC_msg_msg_0209_bin},
    {10150, NARC_scr_seq_scr_seq_0955_bin, NARC_msg_msg_0732_bin},
    {10100, NARC_scr_seq_scr_seq_0954_bin, NARC_msg_msg_0733_bin},
    {10000, NARC_scr_seq_scr_seq_0146_bin, NARC_msg_msg_0211_bin},
    { 9950, NARC_scr_seq_scr_seq_0148_bin, NARC_msg_msg_0666_bin},
    { 9900, NARC_scr_seq_scr_seq_0136_bin,  NARC_msg_msg_0040_bin},
    { 9850, NARC_scr_seq_scr_seq_0167_bin, NARC_msg_msg_0312_bin},
    { 9800, NARC_scr_seq_scr_seq_0166_bin,  NARC_msg_msg_0043_bin},
    { 9700, NARC_scr_seq_scr_seq_0163_bin, NARC_msg_msg_0266_bin},
    { 9600, NARC_scr_seq_scr_seq_0149_bin,  NARC_msg_msg_0040_bin},
    { 9500, NARC_scr_seq_scr_seq_0265_bin, NARC_msg_msg_0439_bin},
    { 9300, NARC_scr_seq_scr_seq_0143_bin, NARC_msg_msg_0204_bin},
    { 9200, NARC_scr_seq_scr_seq_0164_bin, NARC_msg_msg_0267_bin},
    { 9100, NARC_scr_seq_scr_seq_0000_bin,  NARC_msg_msg_0014_bin},
    { 9000, NARC_scr_seq_scr_seq_0004_bin,  NARC_msg_msg_0046_bin},
    { 8900, NARC_scr_seq_scr_seq_0165_bin, NARC_msg_msg_0268_bin},
    { 8800, NARC_scr_seq_scr_seq_0262_bin, NARC_msg_msg_0427_bin},
    { 8000, NARC_scr_seq_scr_seq_0145_bin, NARC_msg_msg_0210_bin}, // Hidden Items
    { 7000, NARC_scr_seq_scr_seq_0141_bin, NARC_msg_msg_0199_bin},
    { 5000, NARC_scr_seq_scr_seq_0953_bin,  NARC_msg_msg_0040_bin},
    { 3000, NARC_scr_seq_scr_seq_0953_bin,  NARC_msg_msg_0040_bin},
    { 2800, NARC_scr_seq_scr_seq_0150_bin,  NARC_msg_msg_0023_bin},
    { 2500, NARC_scr_seq_scr_seq_0001_bin,  NARC_msg_msg_0020_bin},
    { 2000, NARC_scr_seq_scr_seq_0003_bin,  NARC_msg_msg_0040_bin},
};

#define HEAP_ID_FIELDMAP                  11

void StartMapSceneScript(UnkSavStruct80 *a0, u16 a1, LocalMapObject *a2) {
    UnkSavStruct80_Sub10_SubC *r4 = sub_0204001C();
    sub_0204005C(a0, r4, a1, a2, NULL);
    sub_020504F0(a0, sub_0203FF44, r4);
}

void sub_0203FEA4(UnkSavStruct80 *a0, LocalMapObject *a1, int a2, int a3, int a4, int a5, int a6, int a7) {
    UnkSavStruct80_Sub10_SubC *unk = sub_02050650(a0->unk10);
    UnkSavStruct80_Sub10_SubC_Sub54 *r0 = &unk->unk_54[a7];
    r0->unk0 = a2;
    r0->unk4 = a3;
    r0->unk8 = a4;
    r0->unkC = a5;
    r0->unk10 = a6;
    r0->unk14 = a1;
}

void sub_0203FED4(UnkSavStruct80_Sub10 *a0, u16 a1, LocalMapObject *a2, void *a3) {
    UnkSavStruct80 *sp8 = sub_0205064C(a0);
    UnkSavStruct80_Sub10_SubC *r4 = sub_0204001C();
    sub_0204005C(sp8, r4, a1, a2, a3);
    sub_02050530(a0, sub_0203FF44, r4);
}

void sub_0203FF0C(UnkSavStruct80_Sub10 *a0, u16 a1, LocalMapObject *a2) {
    UnkSavStruct80 *sp8 = sub_0205064C(a0);
    UnkSavStruct80_Sub10_SubC *r4 = sub_0204001C();
    sub_0204005C(sp8, r4, a1, a2, NULL);
    sub_02050510(a0, sub_0203FF44, r4);
}

BOOL sub_0203FF44(UnkSavStruct80_Sub10 *unk) {
    int i;
    UnkSavStruct80 *sp0;
    UnkSavStruct80_Sub10_SubC *r4;

    r4 = sub_02050650(unk);
    sp0 = sub_0205064C(unk);

    switch (r4->unk_4) {
    case 0:
        r4->scriptContexts[0] = CreateScriptContext(sp0, r4->unk_A);
        r4->numActiveScrCtx = 1;
        r4->unk_44 = ScrStrBufs_new_custom(8, 64, HEAP_ID_FIELDMAP);
        r4->unk_48 = String_ctor(1024, HEAP_ID_FIELDMAP);
        r4->unk_4C = String_ctor(1024, HEAP_ID_FIELDMAP);
        r4->unk_4++;
        // fallthrough
    case 1:
        for (i = 0; i < 3; i++) {
            struct SCRIPTCONTEXT *ctx = r4->scriptContexts[i];
            if (ctx == NULL) {
                continue;
            }
            if (RunScriptCommand(ctx)) {
                continue;
            }
            DestroyScriptContext(ctx);
            GF_ASSERT(r4->numActiveScrCtx != 0);
            r4->scriptContexts[i] = NULL;
            r4->numActiveScrCtx--;
        }
        if (r4->numActiveScrCtx == 0) {
            void (*callback)(UnkSavStruct80 *a0) = r4->scrctx_end_cb;
            ScrStrBufs_delete(r4->unk_44);
            String_dtor(r4->unk_48);
            String_dtor(r4->unk_4C);
            r4->check = 0;
            FreeToHeap(r4);
            if (callback != NULL) {
                (*callback)(sp0);
                return FALSE;
            } else {
                return TRUE;
            }
        }
    }

    return FALSE;
}

UnkSavStruct80_Sub10_SubC *sub_0204001C(void) {
    UnkSavStruct80_Sub10_SubC *ret = AllocFromHeap(HEAP_ID_FIELDMAP, sizeof(UnkSavStruct80_Sub10_SubC));
    GF_ASSERT(ret != NULL);
    memset(ret, 0, sizeof(UnkSavStruct80_Sub10_SubC));
    ret->check = Unk80_10_C_MAGIC;
    return ret;
}

void DestroyScriptContext(SCRIPTCONTEXT *ctx) {
    DestroyMsgData(ctx->msg_data);
    FreeToHeap(ctx->mapScripts);
    FreeToHeap(ctx);
}

void sub_0204005C(UnkSavStruct80 *a0, UnkSavStruct80_Sub10_SubC *a1, u16 a2, LocalMapObject *a3, void* a4) {
    u16 *sp0 = FieldSysGetAttrAddrInternal(a1, UNK80_10_C_SPECIAL_VAR_800D);
    a1->unk_28 = sub_0205C654(a0->unk40);
    a1->mapObjects = a3;
    a1->unk_A = a2;
    a1->unk_34 = a4;
    if (a3 != NULL) {
        *sp0 = sub_0205F24C(a3);
    }
    if (a2 >= 8000 && a2 <= 8799) {
        sub_020405AC(a1, a2);
    }
}

SCRIPTCONTEXT *CreateScriptContext(UnkSavStruct80 *a0, u16 mapId) {
    SCRIPTCONTEXT *ctx = AllocFromHeap(HEAP_ID_FIELDMAP, sizeof(SCRIPTCONTEXT));
    GF_ASSERT(ctx != NULL);
    InitScriptContext(ctx, gScriptCmdTable, sNumScriptCmds);
    SetUpScriptContextForMap(a0, ctx, mapId, 0);
    return ctx;
}

void SetUpScriptContextForMap(UnkSavStruct80 *a0, SCRIPTCONTEXT *ctx, u16 mapId, u32 unused_r3) {
#pragma unused(unused_r3)
    u16 r6;

    ctx->unk80 = a0;
    r6 = LoadScriptsAndMessagesByMapId(a0, ctx, mapId);
    SetupBytecodeScript(ctx, ctx->mapScripts);
    ScriptRunByIndex(ctx, r6);
    sub_0203FD68(ctx, a0->unk10);
}

u16 LoadScriptsAndMessagesByMapId(UnkSavStruct80 *fsys, SCRIPTCONTEXT *ctx, u16 mapId) {
    const struct ScriptBankMapping *r6 = sScriptBankMapping;
    int i;
    for (i = 0; i < NELEMS(sScriptBankMapping); i++) {
        if (mapId >= r6[i].mapIdLo) {
            LoadScriptsAndMessagesParameterized(fsys, ctx, r6[i].scriptBank, r6[i].msgBank);
            return mapId - r6[i].mapIdLo;
        }
    }
    if (mapId >= 1) {
        LoadScriptsAndMessagesForCurrentMap(fsys, ctx);
        return mapId - 1;
    } else {
        LoadScriptsAndMessagesParameterized(fsys, ctx, NARC_scr_seq_scr_seq_0140_bin, NARC_msg_msg_0184_bin);
        return 0;
    }
}

void LoadScriptsAndMessagesParameterized(UnkSavStruct80 *fsys, SCRIPTCONTEXT *ctx, int scriptBank, u32 msgBank) {
    ctx->mapScripts = AllocAndReadWholeNarcMemberByIdPair(NARC_fielddata_script_scr_seq, scriptBank, HEAP_ID_FIELDMAP);
    ctx->msg_data = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, msgBank, HEAP_ID_FIELDMAP);
}

void LoadScriptsAndMessagesForCurrentMap(UnkSavStruct80 *fsys, SCRIPTCONTEXT *ctx) {
    ctx->mapScripts = LoadScriptsForCurrentMap(fsys->unk20->unk0);
    ctx->msg_data = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, GetCurrentMapMessageBank(fsys->unk20->unk0), HEAP_ID_FIELDMAP);
}

void *FieldSysGetAttrAddrInternal(UnkSavStruct80_Sub10_SubC *unk, enum Unk80_10_C_Field field) {
    switch (field) {
    case UNK80_10_C_10:
        return &unk->unk_10;
    case UNK80_10_C_14:
        return &unk->unk_14;
    case UNK80_10_C_24:
        return &unk->unk_24;
    case UNK80_10_C_05:
        return &unk->unk_5;
    case UNK80_10_C_NUM_ACTIVE_MOVEMENT:
        return &unk->numActiveMovement;
    case UNK80_10_C_07:
        return &unk->unk_7;
    case UNK80_10_C_08:
        return &unk->unk_8;
    case UNK80_10_C_NUM_ACTIVE_SCRCTX:
        return &unk->numActiveScrCtx;
    case UNK80_10_C_0A:
        return &unk->unk_A;
    case UNK80_10_C_28:
        return &unk->unk_28;
    case UNK80_10_C_MAP_OBJECTS:
        return &unk->mapObjects;
    case UNK80_10_C_30:
        return &unk->unk_30;
    case UNK80_10_C_34:
        return &unk->unk_34;
    case UNK80_10_C_SCRCTX_0:
    case UNK80_10_C_SCRCTX_1:
    case UNK80_10_C_SCRCTX_2:
        return &unk->scriptContexts[field - UNK80_10_C_SCRCTX_0];
    case UNK80_10_C_MSGFMT:
        return &unk->unk_44;
    case UNK80_10_C_STRBUF1:
        return &unk->unk_48;
    case UNK80_10_C_STRBUF2:
        return &unk->unk_4C;
    case UNK80_10_C_50:
        return &unk->unk_50;
    case UNK80_10_C_AC:
        return &unk->unk_AC;
    case UNK80_10_C_B0:
        return &unk->unk_B0;
    case UNK80_10_C_B4:
        return &unk->unk_B4;
    case UNK80_10_C_B8:
        return &unk->unk_B8;
    case UNK80_10_C_0C:
        return &unk->unk_C;
    case UNK80_10_C_54_0_00:
        return &unk->unk_54[0].unk0;
    case UNK80_10_C_54_0_04:
        return &unk->unk_54[0].unk4;
    case UNK80_10_C_54_0_08:
        return &unk->unk_54[0].unk8;
    case UNK80_10_C_54_0_0C:
        return &unk->unk_54[0].unkC;
    case UNK80_10_C_54_0_10:
        return &unk->unk_54[0].unk10;
    case UNK80_10_C_54_0_14:
        return &unk->unk_54[0].unk14;
    case UNK80_10_C_54_0_18:
        return &unk->unk_54[0].unk18;
    case UNK80_10_C_54_1_00:
        return &unk->unk_54[1].unk0;
    case UNK80_10_C_54_1_04:
        return &unk->unk_54[1].unk4;
    case UNK80_10_C_54_1_08:
        return &unk->unk_54[1].unk8;
    case UNK80_10_C_54_1_0C:
        return &unk->unk_54[1].unkC;
    case UNK80_10_C_54_1_10:
        return &unk->unk_54[1].unk10;
    case UNK80_10_C_54_1_14:
        return &unk->unk_54[1].unk14;
    case UNK80_10_C_54_1_18:
        return &unk->unk_54[1].unk18;
    case UNK80_10_C_BC:
        return &unk->unk_BC;
    case UNK80_10_C_CC:
        return &unk->unk_CC;
    case UNK80_10_C_DC:
        return &unk->unk_DC;
    case UNK80_10_C_SPECIAL_VAR_8000:
    case UNK80_10_C_SPECIAL_VAR_8001:
    case UNK80_10_C_SPECIAL_VAR_8002:
    case UNK80_10_C_SPECIAL_VAR_8003:
    case UNK80_10_C_SPECIAL_VAR_8004:
    case UNK80_10_C_SPECIAL_VAR_8005:
    case UNK80_10_C_SPECIAL_VAR_8006:
    case UNK80_10_C_SPECIAL_VAR_8007:
    case UNK80_10_C_SPECIAL_VAR_8008:
    case UNK80_10_C_SPECIAL_VAR_8009:
    case UNK80_10_C_SPECIAL_VAR_800A:
    case UNK80_10_C_SPECIAL_VAR_800B:
    case UNK80_10_C_SPECIAL_VAR_800C:
    case UNK80_10_C_SPECIAL_VAR_800D:
        return &unk->specialVars[field - UNK80_10_C_SPECIAL_VAR_8000];
    default:
        GF_ASSERT(0);
        return NULL;
    }
}

void* FieldSysGetAttrAddr(UnkSavStruct80 *fsys, enum Unk80_10_C_Field field) {
    UnkSavStruct80_Sub10_SubC *unk = sub_02050650(fsys->unk10);
    GF_ASSERT(unk != NULL);
    GF_ASSERT(unk->check == Unk80_10_C_MAGIC);
    return FieldSysGetAttrAddrInternal(unk, field);
}

void sub_0204031C(UnkSavStruct80 *fsys) {
    UnkSavStruct80_Sub10_SubC *unk = sub_02050650(fsys->unk10);
    if (sub_0203BC10(fsys) == TRUE) {
        unk->scrctx_end_cb = sub_0203BD64;
    }
}

void ScriptRunByIndex(SCRIPTCONTEXT *ctx, int idx) {
    ctx->script_ptr += 4 * idx;
    ctx->script_ptr += ScriptReadWord(ctx);
}

u8 *LoadScriptsForCurrentMap(u32 mapno) {
    return AllocAndReadWholeNarcMemberByIdPair(NARC_fielddata_script_scr_seq, MapHeader_GetScriptsBank(mapno), HEAP_ID_FIELDMAP);
}

u32 GetCurrentMapMessageBank(u32 mapno) {
    return MapHeader_GetMsgBank(mapno);
}

u16 *GetVarPointer(UnkSavStruct80 *fsys, u16 varIdx) {
    SCRIPT_STATE *state = SavArray_Flags_get(fsys->savedata);
    if (varIdx < VAR_BASE) {
        return NULL;
    } else if (varIdx < SPECIAL_VAR_BASE) {
        return GetVarAddr(state, varIdx);
    } else {
        return FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8000 + varIdx - SPECIAL_VAR_BASE);
    }
}

u16 VarGet(UnkSavStruct80 *fsys, u16 varIdx) {
    u16 *ptr = GetVarPointer(fsys, varIdx);
    if (ptr != NULL) {
        varIdx = *ptr;
    }
    return varIdx;
}

BOOL VarSet(UnkSavStruct80 *fsys, u16 varIdx, u16 value) {
    u16 *ptr = GetVarPointer(fsys, varIdx);
    if (ptr == NULL) {
        return FALSE;
    }
    *ptr = value;
    return TRUE;
}

u16 VarGetObjectEventGraphicsId(UnkSavStruct80 *fsys, u16 varobjId) {
    GF_ASSERT(varobjId < NUM_OBJ_GFX_VARS);
    return VarGet(fsys, VAR_OBJ_GFX_BASE + varobjId);
}

BOOL FlagGet(UnkSavStruct80 *fsys, u16 flagId) {
    return CheckFlagInArray(SavArray_Flags_get(fsys->savedata), flagId);
}

void FlagSet(UnkSavStruct80 *fsys, u16 flagId) {
    return SetFlagInArray(SavArray_Flags_get(fsys->savedata), flagId);
}

void FlagClear(UnkSavStruct80 *fsys, u16 flagId) {
    return ClearFlagInArray(SavArray_Flags_get(fsys->savedata), flagId);
}

void ClearTempFieldEventData(UnkSavStruct80 *fsys) {
    u8 *flags;
    u16 *vars;

    SCRIPT_STATE *state = SavArray_Flags_get(fsys->savedata);
    flags = GetFlagAddr(state, FLAG_UNK_001);
    memset(flags, 0, NUM_TEMP_FLAGS / 8);
    vars = GetVarAddr(state, TEMP_VAR_BASE);
    memset(vars, 0, NUM_TEMP_VARS * 2);
}

void ClearDailyFlags(UnkSavStruct80 *fsys) {
    u8 *flags;

    SCRIPT_STATE *state = SavArray_Flags_get(fsys->savedata);
    flags = GetFlagAddr(state, DAILY_FLAG_BASE);
    memset(flags, 0, NUM_DAILY_FLAGS / 8);
}

void sub_02040490(UnkSavStruct80 *fsys, u16 a1, u16 a2, u16 a3, u16 a4) {
    *(u16 *)FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8000) = a1;
    *(u16 *)FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8001) = a2;
    *(u16 *)FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8002) = a3;
    *(u16 *)FieldSysGetAttrAddr(fsys, UNK80_10_C_SPECIAL_VAR_8003) = a4;
}

u16 sub_020404C8(u16 a0) {
    if (a0 < 5000) {
        return a0 - 3000 + 1;
    } else {
        return a0 - 5000 + 1;
    }
}

BOOL sub_020404EC(u16 a0) {
    return a0 >= 5000;
}

BOOL sub_02040500(u32 trainer) {
    return TrainerData_GetAttr(trainer, TRATTR_DOUBLEBTL) != 0;
}

BOOL TrainerFlagCheck(SAVEDATA *saveData, u32 trainer) {
    SCRIPT_STATE *scriptState = SavArray_Flags_get(saveData);
    return CheckFlagInArray(scriptState, trainer + TRAINER_FLAG_BASE);
}

void TrainerFlagSet(SAVEDATA *saveData, u32 trainer) {
    SCRIPT_STATE *scriptState = SavArray_Flags_get(saveData);
    SetFlagInArray(scriptState, trainer + TRAINER_FLAG_BASE);
}

void TrainerFlagClear(SAVEDATA *saveData, u32 trainer) {
    SCRIPT_STATE *scriptState = SavArray_Flags_get(saveData);
    ClearFlagInArray(scriptState, trainer + TRAINER_FLAG_BASE);
}

u16 HiddenItemScriptNoToFlagId(u16 a0) {
    return a0 - 8000 + HIDDEN_ITEMS_FLAG_BASE;
}

u16 HiddenItemScriptNoToHiddenItemIdx(u16 a0) {
    return a0 - 8000;
}

u8 sub_02040578(u16 a0) {
    const struct HiddenItemData *r4 = _020FA558;
    int i;
    u16 r0 = HiddenItemScriptNoToHiddenItemIdx(a0);

    for (i = 0; i < NELEMS(_020FA558); i++) {
        if (r0 == r4[i].unk6) {
            break;
        }
    }
    if (i >= NELEMS(_020FA558)) {
        GF_ASSERT(0);
        return 0;
    }

    return r4[i].unk3;
}

BOOL sub_020405AC(UnkSavStruct80_Sub10_SubC *a0, u16 a1) {
    int i;
    u16 r0;
    const struct HiddenItemData *r3;
    u16 *r7;
    u16 *r6;
    u16 *r4;

    r7 = FieldSysGetAttrAddrInternal(a0, UNK80_10_C_SPECIAL_VAR_8000);
    r6 = FieldSysGetAttrAddrInternal(a0, UNK80_10_C_SPECIAL_VAR_8001);
    r4 = FieldSysGetAttrAddrInternal(a0, UNK80_10_C_SPECIAL_VAR_8002);
    r3 = _020FA558;
    r0 = HiddenItemScriptNoToHiddenItemIdx(a1);

    for (i = 0; i < NELEMS(_020FA558); i++) {
        if (r0 == r3[i].unk6) {
            break;
        }
    }
    if (i >= NELEMS(_020FA558)) {
        GF_ASSERT(0);
        return FALSE;
    }

    *r7 = r3[i].unk0;
    *r6 = r3[i].unk2;
    *r4 = HiddenItemScriptNoToFlagId(a1);
    return TRUE;
}

HiddenItemResponse* AllocAndFetchNearbyHiddenItems(UnkSavStruct80 *fsys, HeapID heapId) {
    HiddenItemResponse *ret;
    const BG_EVENT *bgEvents;
    int i;
    int num_bgs;
    int j;
    int x;
    int y;
    int left;
    int right;
    int top;
    int bottom;

    j = 0;
    num_bgs = Field_GetNumBgEvents(fsys);
    num_bgs++;
    ret = AllocFromHeap(heapId, num_bgs * sizeof(HiddenItemResponse));
    if (num_bgs == 1) {
        ret[0].unk4 = 0xFF;
        ret[0].x = -1;
        ret[0].y = -1;
        return ret;
    }
    bgEvents = Field_GetBgEvents(fsys);
    if (bgEvents == NULL) {
        ret[0].unk4 = 0xFF;
        ret[0].x = -1;
        ret[0].y = -1;
        return ret;
    }
    x = GetPlayerXCoord(fsys->unk40);
    y = GetPlayerYCoord(fsys->unk40);
    left = x - 17;
    right = x + 17;
    top = y - 17;
    bottom = y + 17;
    if (left < 0) {
        left = 0;
    }
    if (top < 0) {
        top = 0;
    }
    // UB: Out-of-array access
    for (i = 0; i < num_bgs; i++) {
        if (bgEvents[i].type == 2
        && !FlagGet(fsys, HiddenItemScriptNoToFlagId(bgEvents[i].scr))) {
            if (bgEvents[i].x >= left
               && bgEvents[i].x <= right
               && bgEvents[i].y >= top
               && bgEvents[i].y <= bottom
            ) {
                ret[j].unk4 = sub_02040578(bgEvents[i].scr);
                ret[j].x = bgEvents[i].x - x;
                ret[j].y = bgEvents[i].y - y;
                j++;
            }
        }
    }
    ret[j].unk4 = 0xFF;
    ret[j].x = -1;
    ret[j].y = -1;
    return ret;
}

void RunPokemonCenterScriptsInNewContext(UnkSavStruct80 *fsys) {
    StartMapLoadScript(fsys, 9600);
}

void StartMapLoadScript(UnkSavStruct80 *fsys, u16 mapno) {
    SCRIPTCONTEXT *ctx = CreateScriptContext(fsys, mapno);
    while (RunScriptCommand(ctx) == TRUE) {}
    DestroyScriptContext(ctx);
}

BOOL TryStartMapScriptByType(UnkSavStruct80 *fsys, u8 type) {
    u8 *header;
    u16 r1;
    if (fsys->unkAC != 0) {
        return FALSE;
    }
    header = MapEvents_GetScriptHeader(fsys);
    if (header == NULL) {
        return FALSE;
    }
    r1 = (type == 1) ? GetMapSceneScriptId(fsys, header, type) : GetMapLoadScriptId(header, type);
    if (r1 == 0xFFFF) {
        return FALSE;
    }
    (type == 1) ? StartMapSceneScript(fsys, r1, NULL) : StartMapLoadScript(fsys, r1);
    return TRUE;
}

BOOL sub_020407AC(UnkSavStruct80 *fsys) {
    u8 *header;
    u16 r1;
    if (fsys->unkAC != 0) {
        return FALSE;
    }
    header = MapEvents_GetScriptHeader(fsys);
    if (header == NULL) {
        return FALSE;
    }
    r1 = GetMapSceneScriptId(fsys, header, 1);
    return r1 != 0xFFFF;
}

u16 GetMapLoadScriptId(u8 *a0, u8 a1) {
    while (1) {
        if (a0[0] == 0) {
            return 0xFFFF;
        } else if (a0[0] == a1) {
            return a0[1] + (a0[2] << 8);
        } else {
            a0 += 5;
        }
    }
}

u16 GetMapSceneScriptId(UnkSavStruct80 *a0, u8 *a1, u8 a2) {
    u32 r1;
    while (1) {
        if (a1[0] == 0) {
            return 0xFFFF;
        } else if (a1[0] == a2) {
            r1 = a1[1] + (a1[2] << 8) + (a1[3] << 16) + (a1[4] << 24);
            a1 += 5;
            break;
        } else {
            a1 += 5;
        }
    }
    if (r1 == 0) {
        return 0xFFFF;
    }
    a1 += r1;
    while (1) {
        u16 var1;
        u16 var2;
        var1 = a1[0] + (a1[1] << 8);
        if (var1 == 0) {
            return 0xFFFF;
        }
        var2 = a1[2] + (a1[3] << 8);
        if (VarGet(a0, var1) == VarGet(a0, var2)) {
            return a1[4] + (a1[5] << 8);
        }
        a1 += 6;
    }
}
