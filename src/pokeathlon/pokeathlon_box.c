#include "pokeathlon/pokeathlon_box.h"

#include "msgdata/msg.naix"

#include "font.h"
#include "gf_gfx_planes.h"
#include "gf_gfx_loader.h"
#include "heap.h"
#include "nnsys.h"
#include "obj_char_transfer.h"
#include "obj_pltt_transfer.h"
#include "pokemon.h"
#include "save_arrays.h"
#include "system.h"
#include "text.h"
#include "unk_0200ACF0.h"
#include "unk_0200B150.h"
#include "unk_0200FA24.h"
#include "unk_0203A3B0.h"

// functions in asm:
int sub_020935E0(int);
void sub_02093A40(u32);
void sub_02093354(u32);
u32 sub_020932E0(u32, u32, u32);
void sub_02093440(u32, BgConfig*, PCStorage*, Party*, u32, u32, BOOL, u32, void*, void*, void*, void*, PokeathlonBox*);
void sub_02093594(u32);
s8 sub_0208B85C(void*, u8, u8, u32, s8);

extern const GraphicsBanks pokeathlonBoxGraphicsBanks;
extern const GraphicsModes pokeathlonBoxGraphicsModes;
extern const ObjCharTransferTemplate pokeathlonBoxObjCharTransferTemplate;
extern const u32 ov97_0221FCB8[5];
extern const BgTemplate pokeathlonBoxBgTemplate3;
extern const BgTemplate pokeathlonBoxBgTemplate1;
extern const BgTemplate pokeathlonBoxBgTemplate2;
extern const BgTemplate pokeathlonBoxBgTemplate4;

BOOL PokeathlonBox_Init(OverlayManager *manager) {
    if (ov97_0221E6DC(manager)) {
        return TRUE;
    }
    return FALSE;
}

BOOL PokeathlonBox_Main(OverlayManager *manager) {
    PokeathlonBox* data = OverlayManager_GetData(manager);
    
    switch (data->state) {
        case 0:
            data->state = 1;
            break;

        case 1:
            BeginNormalPaletteFade(0, 1, 1, 0, 6, 1, HEAP_ID_POKEATHLON);
            data->state = 2;
            break;

        case 2:
            if (IsPaletteFadeFinished()) {
                data->state = 3;
            }
            break;

        case 3:
            int res = sub_020935E0(data->unk8);
            if (res == 2) {
                data->unk28 = FALSE;
                data->state = 4;
            } else if (res == 3) {
                data->unk28 = TRUE;
                data->state = 4;
            }
            break;

        case 4:
            BeginNormalPaletteFade(0, 0, 0, 0, 6, 1, HEAP_ID_POKEATHLON);
            data->state = 5;
            break;

        case 5:
            if (IsPaletteFadeFinished()) {
                PokeathlonBoxArgs* args = OverlayManager_GetArgs(manager);
                PokeathlonBox_CopySelectedMons(data, args);
                return TRUE;
            }
            break;
    }

    sub_02093A40(data->unk8);
    PokeathlonBox_RenderAndAnimateSprites(data->graphics);
    return FALSE;
}

BOOL PokeathlonBox_Exit(OverlayManager *manager) {
    PokeathlonBox* data = OverlayManager_GetData(manager);

    Main_SetVBlankIntrCB(NULL, NULL);
    PokeathlonBox_ReleaseGraphics(data->graphics);
    sub_02093354(data->unk8);
    FontID_Release(2);
    OamManager_Free();
    ObjCharTransfer_Destroy();
    ObjPlttTransfer_Destroy();
    Heap_Free(data->bgConfig);
    Heap_Free(data);

    return TRUE;
}

BOOL ov97_0221E6DC(OverlayManager *manager) {
    PokeathlonBoxArgs* args = OverlayManager_GetArgs(manager);

    do {
        if (ov97_0221E700(manager)) {
            return TRUE;
        }
    } while (args->courseArgs->mode == 0);

    return FALSE;
}

BOOL ov97_0221E700(OverlayManager *manager) {
    PokeathlonBox* data;
    PokeathlonCourseArgs* courseArgs;
    PokeathlonBoxArgs* args;
    
    args = OverlayManager_GetArgs(manager);
    courseArgs = args->courseArgs;
    data = OverlayManager_CreateAndGetData(manager, sizeof(PokeathlonBox), HEAP_ID_POKEATHLON);
    
    memset(data, 0, sizeof(PokeathlonBox));

    data->bgConfig = BgConfig_Alloc(HEAP_ID_POKEATHLON);
    data->saveData = courseArgs->saveData;
    data->courseId = args->courseId;

    PokeathlonBox_SetGraphicsBanks();

    data->unk8 = sub_020932E0(HEAP_ID_POKEATHLON, HEAP_ID_3, 0x13);
    data->graphics = PokeathlonBox_InitGraphics(HEAP_ID_POKEATHLON);
    
    PokeathlonBox_SetGraphicsModes(data->bgConfig);
    PokeathlonBox_SetObjCharTransferTemplate();

    ov97_0221E864(data);

    BOOL isMode0 = FALSE;
    if (args->courseArgs->mode == 0) {
        isMode0 = TRUE;
    }

    PCStorage* pcStorage = SaveArray_PCStorage_Get(courseArgs->saveData);
    Party* party = SaveArray_Party_Get(courseArgs->saveData);
    sub_02093440(data->unk8, data->bgConfig, pcStorage, party, 0, 0, isMode0, 18, &PokeathlonBox_GetLightBoxMon, &PokeathlonBox_GetBoxName, data->selectedMons, &ov97_0221EC14, data);

    sub_0203A994(2);
    PokeathlonBox_SetupGraphics(data->graphics, data->bgConfig, data->courseId, courseArgs->field_F);
    Main_SetVBlankIntrCB(&ov97_0221E88C, data);
    data->state = 0;

    ResetAllTextPrinters();
    LoadFontPal0(GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_15_OFFSET, HEAP_ID_POKEATHLON);
    FontID_Alloc(2, HEAP_ID_POKEATHLON);

    return TRUE;
}

void PokeathlonBox_SetGraphicsBanks() {
    GraphicsBanks banks = pokeathlonBoxGraphicsBanks;
    GfGfx_SetBanks(&banks);
}

void PokeathlonBox_SetGraphicsModes(BgConfig* bgConfig) {
    GraphicsModes modes = pokeathlonBoxGraphicsModes;
    SetBothScreensModesAndDisable(&modes);
}

void PokeathlonBox_SetObjCharTransferTemplate() {
    ObjCharTransferTemplate template = pokeathlonBoxObjCharTransferTemplate;
    ObjCharTransfer_Init(&template);
    ObjPlttTransfer_Init(0x14, HEAP_ID_POKEATHLON);
    ObjCharTransfer_ClearBuffers();
    ObjPlttTransfer_Reset();
}

void ov97_0221E864(PokeathlonBox* data) {
    NNS_G2dInitOamManagerModule();
    OamManager_Create(0, 126, 0, 32, 1, 126, 0, 32, HEAP_ID_POKEATHLON);
}

void ov97_0221E88C(void* data) {
    sub_02093594(((PokeathlonBox*) data)->unk8);
}

BOOL PokeathlonBox_GetBoxMon(PCStorage* storage, u32 boxno, u32 slotno, PokeathlonBox_BoxMon* ptr) {
    BoxPokemon* boxMon = PCStorage_GetMonByIndexPair(storage, boxno, slotno);
    if (GetBoxMonData(boxMon, MON_DATA_SPECIES_EXISTS, NULL)) {
        ptr->species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
        ptr->personality = GetBoxMonData(boxMon, MON_DATA_PERSONALITY, NULL);
        ptr->isEgg = GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL);
        ptr->form = GetBoxMonData(boxMon, MON_DATA_FORM, NULL);
        ptr->unkC = 0;
        ptr->unkE = 0;
        GetBoxMonData(boxMon, MON_DATA_NICKNAME, ptr->nickname);
        ptr->isShiny = BoxMonIsShiny(boxMon);
        ptr->gender = GetBoxMonData(boxMon, MON_DATA_GENDER, NULL);
        return TRUE;
    }
    ptr->species = 0;
    ptr->personality = 0;
    ptr->isEgg = 0;
    ptr->form = 0;
    ptr->unkC = 0;
    ptr->unkE = 0;
    ptr->isShiny = 0;
    ptr->gender = 0;
    return FALSE;
}

BOOL PokeathlonBox_GetLightBoxMon(PCStorage* storage, u32 boxno, u32 slotno, PokeathlonBox_BoxMon* ptr) {
    BoxPokemon* boxMon = PCStorage_GetMonByIndexPair(storage, boxno, slotno);
    if (GetBoxMonData(boxMon, MON_DATA_SPECIES_EXISTS, NULL)) {
        ptr->species = GetBoxMonData(boxMon, MON_DATA_SPECIES, NULL);
        ptr->personality = 0;
        ptr->isEgg = GetBoxMonData(boxMon, MON_DATA_IS_EGG, NULL);
        ptr->form = GetBoxMonData(boxMon, MON_DATA_FORM, NULL);
        ptr->unkC = 0;
        ptr->unkE = 0;
        ptr->isShiny = 0;
        ptr->gender = 0;
        return TRUE;
    }
    ptr->species = 0;
    ptr->personality = 0;
    ptr->isEgg = 0;
    ptr->form = 0;
    ptr->unkC = 0;
    ptr->unkE = 0;
    ptr->isShiny = 0;
    ptr->gender = 0;
    return FALSE;
}

void PokeathlonBox_GetBoxName(String *dest, PCStorage *storage, u32 boxno) {
    PCStorage_GetBoxName(storage, boxno, dest);
}

void PokeathlonBox_CopySelectedMons(PokeathlonBox* data, PokeathlonBoxArgs* args) {
    PokeathlonBox_BoxMon boxMon;
    
    args->selectedMons[0].unk0 = data->unk28;
    if (data->unk28 == 0) {
        for (int i = 0; i < 3; i++) {
            if (data->selectedMons[i].boxno == NUM_BOXES) {
                Pokemon* partyMon = Party_GetMonByIndex(SaveArray_Party_Get(args->courseArgs->saveData), data->selectedMons[i].slot);
                args->selectedMons[i].species = GetMonData(partyMon, MON_DATA_SPECIES, NULL);
                args->selectedMons[i].personality = GetMonData(partyMon, MON_DATA_PERSONALITY, NULL);
                args->selectedMons[i].form = GetMonData(partyMon, MON_DATA_FORM, NULL);
                GetMonData(partyMon, MON_DATA_NICKNAME, &args->selectedMons[i].nickname);
                args->selectedMons[i].isShiny = MonIsShiny(partyMon);
                args->selectedMons[i].gender = GetMonData(partyMon, MON_DATA_GENDER, NULL);
                PokeathlonBox_GetPartyMonStats(SaveArray_Party_Get(args->courseArgs->saveData), data->selectedMons[i].slot, &args->selectedMons[i].stats);
            } else {
                PokeathlonBox_GetBoxMon(SaveArray_PCStorage_Get(args->courseArgs->saveData), data->selectedMons[i].boxno, data->selectedMons[i].slot, &boxMon);
                args->selectedMons[i].species = boxMon.species;
                args->selectedMons[i].personality = boxMon.personality;
                args->selectedMons[i].form = boxMon.form;
                CopyU16StringArrayN(args->selectedMons[i].nickname, boxMon.nickname, 11);
                args->selectedMons[i].isShiny = boxMon.isShiny;
                args->selectedMons[i].gender = boxMon.gender;
                PokeathlonBox_GetBoxMonStats(PCStorage_GetMonByIndexPair(SaveArray_PCStorage_Get(args->courseArgs->saveData), data->selectedMons[i].boxno, data->selectedMons[i].slot), &args->selectedMons[i].stats);
            }
        }
    }
}

void PokeathlonBox_GetPartyMonStats(Party* party, u8 slot, PokeathlonBox_MonStats* stats) {
    PartyAprijuiceModifier aprijuiceModifier;
    PokeathlonPerformanceStars stars;

    Party_GetMonAprijuiceModifiers(party, &aprijuiceModifier, slot);
    CalcMonPokeathlonStars(&stars, Party_GetMonByIndex(party, slot), aprijuiceModifier.unk_00, HEAP_ID_POKEATHLON);
    stats->power = ((u32) (stars.stars << 0x1D) >> 0x1D);
    stats->stamina = ((u32) (stars.stars << 0x11) >> 0x1D);
    stats->jump = ((u32) (stars.stars << 0x14) >> 0x1D);
    stats->skill = ((u32) (stars.stars << 0x1A) >> 0x1D);
    stats->speed = ((u32) (stars.stars << 0x17) >> 0x1D);
    stats->stars = (stats->stars & ~7) | (7 & stars.color[PERFORMANCE_POWER]);
    stats->stars = (stats->stars & ~0x38) | ((u32) (stars.color[PERFORMANCE_STAMINA] << 0x1D) >> 0x1A);
    stats->stars = (stats->stars & 0xFFFFFE3F) | ((u32) (stars.color[PERFORMANCE_JUMP] << 0x1D) >> 0x17);
    stats->stars = (stats->stars & 0xFFFFF1FF) | ((u32) (stars.color[PERFORMANCE_SKILL] << 0x1D) >> 0x14);
    stats->stars = (stats->stars & 0xFFFF8FFF) | ((u32) (stars.color[PERFORMANCE_SPEED] << 0x1D) >> 0x11);
}

void PokeathlonBox_GetBoxMonStats(BoxPokemon* boxMon, PokeathlonBox_MonStats* stats) {
    PokeathlonPerformanceStars stars;
    
    CalcBoxmonPokeathlonStars(&stars, boxMon, NULL, HEAP_ID_POKEATHLON);
    stats->power = ((u32) (stars.stars << 0x1D) >> 0x1D);
    stats->stamina = ((u32) (stars.stars << 0x11) >> 0x1D);
    stats->jump = ((u32) (stars.stars << 0x14) >> 0x1D);
    stats->skill = ((u32) (stars.stars << 0x1A) >> 0x1D);
    stats->speed = ((u32) (stars.stars << 0x17) >> 0x1D);
    stats->stars = (stats->stars & ~7) | (7 & stars.color[PERFORMANCE_POWER]);
    stats->stars = (stats->stars & ~0x38) | ((u32) (stars.color[PERFORMANCE_STAMINA] << 0x1D) >> 0x1A);
    stats->stars = (stats->stars & 0xFFFFFE3F) | ((u32) (stars.color[PERFORMANCE_JUMP] << 0x1D) >> 0x17);
    stats->stars = (stats->stars & 0xFFFFF1FF) | ((u32) (stars.color[PERFORMANCE_SKILL] << 0x1D) >> 0x14);
    stats->stars = (stats->stars & 0xFFFF8FFF) | ((u32) (stars.color[PERFORMANCE_SPEED] << 0x1D) >> 0x11);
}

void PokeathlonBox_GetLightBoxMonStats(BoxPokemon *boxMon, PokeathlonBox_MonStats* stats) {
    PokeathlonTodayPerformance performance;
    
    CalcBoxMonPokeathlonPerformance(boxMon, &performance);
    stats->power = performance.stats[PERFORMANCE_POWER].hi; // from the "<< 0x1A) >> 0x1D" ones
    stats->stamina = performance.stats[PERFORMANCE_STAMINA].hi;
    stats->jump = performance.stats[PERFORMANCE_JUMP].hi;
    stats->skill = performance.stats[PERFORMANCE_SKILL].hi;
    stats->speed = performance.stats[PERFORMANCE_SPEED].hi;
}

void ov97_0221EC14(int boxno, u8 slot, PokeathlonBox* data) {
    PokeathlonBox_UnkStruct0221EC14 sp70;
    u32 sp5C[5];

    PokeathlonBox_MonStats partyMonStats;
    PokeathlonBox_MonStats partyLightMonStats;
    PartyAprijuiceModifier aprijuiceModifier;

    PokeathlonBox_MonStats boxMonStats;
    PokeathlonBox_MonStats boxLightMonStats;
    PokeathlonBox_BoxMon pokeathlonBoxMon;
    
    PartyAprijuiceModifier emptyAprijuiceModifier;

    sp5C = ov97_0221FCB8;
    if (boxno != -1 && slot != -1) {  
        sp70.unk9 = 2;
        if (boxno == NUM_BOXES) {
            Party* party = SaveArray_Party_Get(data->saveData);
            Pokemon* partyMon = Party_GetMonByIndex(party, slot);
            sp70.personality = GetMonData(partyMon, MON_DATA_PERSONALITY, NULL);
            sp70.species = GetMonData(partyMon, MON_DATA_SPECIES, NULL);
            sp70.form = GetMonData(partyMon, MON_DATA_FORM, NULL);
            GetMonData(partyMon, MON_DATA_NICKNAME, sp70.nickname);
            sp70.isShiny = MonIsShiny(partyMon);
            sp70.gender = GetMonData(partyMon, MON_DATA_GENDER, NULL);
            BoxPokemon* boxMon = Mon_GetBoxMon(Party_GetMonByIndex(party, slot));
            PokeathlonBox_GetPartyMonStats(party, (u32) slot, &partyMonStats);
            PokeathlonBox_GetLightBoxMonStats(boxMon, &partyLightMonStats);
            Party_GetMonAprijuiceModifiers(party, &aprijuiceModifier, slot);
            ov97_0221EDE4(&partyLightMonStats, &partyMonStats, &aprijuiceModifier, &sp70);
            for (u8 i = 0; i < 5; i++) {
                if (PokeathlonSave_GetUnkDC_AtIndex(Save_Pokeathlon_Get(data->saveData), sp5C[i], sp70.species)) {
                    sp70.unk20[i] = 1;
                } else {
                    sp70.unk20[i] = 0;
                }
            }
            ov97_0221EFD0(data->graphics, &sp70);
            return;
        }
        
        PokeathlonBox_GetBoxMon(SaveArray_PCStorage_Get(data->saveData), boxno, slot, &pokeathlonBoxMon);
        sp70.personality = pokeathlonBoxMon.personality;
        sp70.species = pokeathlonBoxMon.species;
        sp70.form = pokeathlonBoxMon.form;
        CopyU16StringArrayN(sp70.nickname, pokeathlonBoxMon.nickname, 11);
        sp70.isShiny = pokeathlonBoxMon.isShiny;
        sp70.gender = pokeathlonBoxMon.gender;
        BoxPokemon* boxMon = PCStorage_GetMonByIndexPair(SaveArray_PCStorage_Get(data->saveData), boxno, slot);
        PokeathlonBox_GetBoxMonStats(boxMon, &boxMonStats);
        PokeathlonBox_GetLightBoxMonStats(boxMon, &boxLightMonStats);
        MI_CpuFill8(&emptyAprijuiceModifier, 0, 5);
        ov97_0221EDE4(&boxLightMonStats, &boxMonStats, &emptyAprijuiceModifier, &sp70);
        for (u8 i = 0; i < 5; i++) {
            if (PokeathlonSave_GetUnkDC_AtIndex(Save_Pokeathlon_Get(data->saveData), sp5C[i], sp70.species)) {
                sp70.unk20[i] = 1;
            } else {
                sp70.unk20[i] = 0;
            }
        }
        ov97_0221EFD0(data->graphics, &sp70);
        return;
    }

    sp70.unk9 = 0;
    ov97_0221EFD0(data->graphics, &sp70);
}

void ov97_0221EDE4(PokeathlonBox_MonStats* stats1, PokeathlonBox_MonStats* stats2, PartyAprijuiceModifier* aprijuiceModifier, PokeathlonBox_UnkStruct0221EC14* mon) {
    mon->unk28 = sub_0208B85C(&mon->unk29, stats1->power, stats2->power, (u32) (stats2->stars << 0x1D) >> 0x1D, aprijuiceModifier->unk_00[0]);
    mon->unk30 = sub_0208B85C(&mon->unk31, stats1->skill, stats2->skill, (u32) (stats2->stars << 0x14) >> 0x1D, aprijuiceModifier->unk_00[1]);
    mon->unk38 = sub_0208B85C(&mon->unk39, stats1->speed, stats2->speed, (u32) (stats2->stars << 0x11) >> 0x1D, aprijuiceModifier->unk_00[2]);
    mon->unk40 = sub_0208B85C(&mon->unk41, stats1->jump, stats2->jump, (u32) (stats2->stars << 0x17) >> 0x1D, aprijuiceModifier->unk_00[3]);
    mon->unk48 = sub_0208B85C(&mon->unk49, stats1->stamina, stats2->stamina, (u32) (stats2->stars << 0x1A) >> 0x1D, aprijuiceModifier->unk_00[4]);
}

PokeathlonBox_Graphics* PokeathlonBox_InitGraphics(enum HeapID heapID) {
    PokeathlonBox_Graphics* ptr = Heap_Alloc(heapID, sizeof(PokeathlonBox_Graphics));
    MI_CpuFill8(ptr, 0, sizeof(PokeathlonBox_Graphics));
    ptr->heapID = heapID;
    ptr->sub.heapID = heapID;
    return ptr;
}

void PokeathlonBox_SetupGraphics(PokeathlonBox_Graphics* graphics, BgConfig* bgConfig, u8 courseId, u32 arg3) {
    graphics->bgConfig = bgConfig;
    ov97_0221F14C(bgConfig, graphics->heapID);
    AddWindowParameterized(graphics->bgConfig, &graphics->window1, GF_BG_LYR_SUB_0, 1, 1, 17, 2, 15, 0x01);
    AddWindowParameterized(graphics->bgConfig, &graphics->window2, GF_BG_LYR_SUB_0, 22, 1, 9, 2, 15, 0x23);
    AddWindowParameterized(graphics->bgConfig, &graphics->window3, GF_BG_LYR_SUB_1, 1, 15, 8, 2, 15, 0x35);
    AddWindowParameterized(graphics->bgConfig, &graphics->window4, GF_BG_LYR_SUB_1, 9, 15, 3, 2, 15, 0x45);
    AddWindowParameterized(graphics->bgConfig, &graphics->window5, GF_BG_LYR_SUB_1, 13, 5, 10, 10, 15, 0x4B);
    AddWindowParameterized(graphics->bgConfig, &graphics->window6, GF_BG_LYR_SUB_1, 1, 19, 12, 4, 15, 0xAF);
    graphics->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0278_bin, graphics->heapID);
    graphics->msgFormat = MessageFormat_New(graphics->heapID);
    graphics->nickname = String_New(11, graphics->heapID);
    graphics->courseId = courseId;
    graphics->unk6A = arg3;
    ov97_0221F7DC(&graphics->sub);
    ov97_0221F9E0(&graphics->sub);
    ov97_0221F294(graphics);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
}

void ov97_0221EFD0(PokeathlonBox_Graphics* graphics, PokeathlonBox_UnkStruct0221EC14* mon) {
    if (mon->unk9 == 2) {
        ov97_0221F56C(graphics, mon);
        ov97_0221F428(graphics, mon);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_ON);
        GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_ON);
        return;
    }
    ov97_0221F74C();
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG1, GF_PLANE_TOGGLE_OFF);
    GfGfx_EngineBTogglePlanes(GX_PLANEMASK_BG2, GF_PLANE_TOGGLE_OFF);
}

void PokeathlonBox_RenderAndAnimateSprites(PokeathlonBox_Graphics* graphics) {
    if (graphics->sub.spriteList != NULL) {
        SpriteList_RenderAndAnimateSprites(graphics->sub.spriteList);
    }
}

void PokeathlonBox_ReleaseGraphics(PokeathlonBox_Graphics* graphics) {
    u8 i;

    DestroyMsgData(graphics->msgData);
    MessageFormat_Delete(graphics->msgFormat);
    String_Delete(graphics->nickname);
    RemoveWindow(&graphics->window1);
    RemoveWindow(&graphics->window2);
    RemoveWindow(&graphics->window3);
    RemoveWindow(&graphics->window4);
    RemoveWindow(&graphics->window5);
    RemoveWindow(&graphics->window6);
    FreeBgTilemapBuffer(graphics->bgConfig, GF_BG_LYR_SUB_0);
    FreeBgTilemapBuffer(graphics->bgConfig, GF_BG_LYR_SUB_1);
    FreeBgTilemapBuffer(graphics->bgConfig, GF_BG_LYR_SUB_2);
    FreeBgTilemapBuffer(graphics->bgConfig, GF_BG_LYR_SUB_3);

    PokeathlonBox_SubGraphics* sub = &graphics->sub;
    ov97_0221F0E0(sub);
    for (i = 0; i < 3; i++) {
        sub_0200AEB0(sub->unk1C0[i].charResObj);
        sub_0200B0A8(sub->unk1C0[i].plttResObj);
    }
    for (i = 0; i < 6; i++) {
        Destroy2DGfxResObjMan(sub->mgrs[i]);
    }
    SpriteList_Delete(sub->spriteList);
    Heap_Free(graphics);
}

void ov97_0221F0E0(PokeathlonBox_SubGraphics* subGraphics) {
    int i, j;
    
    for (i = 0; i < 5; i++) {
        Sprite_Delete(subGraphics->sprites[i]);
    }
    for (i = 0; i < 5; i++) {
        Sprite_Delete(subGraphics->unk1DC[i].sprite);
        for (j = 0; j < 5; j++) {
            Sprite_Delete(subGraphics->unk1DC[i].sprites[j]);
        }
    }
    
    Sprite_Delete(subGraphics->unk254);
    Heap_Free(subGraphics->unk258);
}

void ov97_0221F14C(BgConfig* bgConfig, enum HeapID heapID) {
    PokeathlonBox_InitBgFromTemplates(bgConfig);
    GfGfxLoader_GXLoadPal(NARC_a_2_4_1 /*243*/, 0, GF_PAL_LOCATION_SUB_BG, (enum GFPalSlotOffset)0, 0, heapID);
    GfGfxLoader_LoadCharData(NARC_a_2_4_1 /*243*/, 1, bgConfig, GF_BG_LYR_SUB_3, 0, 0, 1, heapID);
    GfGfxLoader_LoadScrnData(NARC_a_2_4_1 /*243*/, 2, bgConfig, GF_BG_LYR_SUB_3, 0, 0x600, 1, heapID);
    BgCommitTilemapBufferToVram(bgConfig, GF_BG_LYR_SUB_3);
    GfGfxLoader_LoadScrnData(NARC_a_2_4_1 /*243*/, 3, bgConfig, GF_BG_LYR_SUB_2, 0, 0x600, 1, heapID);
    BgCommitTilemapBufferToVram(bgConfig, GF_BG_LYR_SUB_2);
    LoadFontPal0(GF_PAL_LOCATION_SUB_BG, GF_PAL_SLOT_15_OFFSET, heapID);
}

void PokeathlonBox_InitBgFromTemplates(BgConfig* bgConfig) {
    BgTemplate bgTemplate1 = pokeathlonBoxBgTemplate1;
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_0, &bgTemplate1, 0);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_0);

    BgTemplate bgTemplate2 = pokeathlonBoxBgTemplate2;
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_1, &bgTemplate2, 0);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_1);

    BgTemplate bgTemplate3 = pokeathlonBoxBgTemplate3;
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_2, &bgTemplate3, 0);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_2);

    BgTemplate bgTemplate4 = pokeathlonBoxBgTemplate4;
    InitBgFromTemplate(bgConfig, GF_BG_LYR_SUB_3, &bgTemplate4, 0);
    BgClearTilemapBufferAndCommit(bgConfig, GF_BG_LYR_SUB_3);
}

void ov97_0221F294(PokeathlonBox_Graphics* graphics) {
    BufferPokeathlonCourseName(graphics->msgFormat, 0, (u8) graphics->courseId);
    String* str = ReadMsgData_ExpandPlaceholders(graphics->msgFormat, graphics->msgData, 0, graphics->heapID);
    FillWindowPixelBuffer(&graphics->window1, 0);
    AddTextPrinterParameterizedWithColor(&graphics->window1, 0, str, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    CopyWindowToVram(&graphics->window1);
    String_Delete(str);
    FillWindowPixelBuffer(&graphics->window2, 0);
    if (graphics->unk6A != 0) {
        str = NewString_ReadMsgData(graphics->msgData, 1);
        AddTextPrinterParameterizedWithColor(&graphics->window2, 0, str, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
        String_Delete(str);
    }
    CopyWindowToVram(&graphics->window2);
    FillWindowPixelBuffer(&graphics->window5, 0);
    str = NewString_ReadMsgData(graphics->msgData, 8);
    AddTextPrinterParameterizedWithColor(&graphics->window5, 0, str, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(str);
    str = NewString_ReadMsgData(graphics->msgData, 4);
    AddTextPrinterParameterizedWithColor(&graphics->window5, 0, str, 0, 16, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(str);
    str = NewString_ReadMsgData(graphics->msgData, 6);
    AddTextPrinterParameterizedWithColor(&graphics->window5, 0, str, 0, 32, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(str);
    str = NewString_ReadMsgData(graphics->msgData, 5);
    AddTextPrinterParameterizedWithColor(&graphics->window5, 0, str, 0, 48, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(str);
    str = NewString_ReadMsgData(graphics->msgData, 7);
    AddTextPrinterParameterizedWithColor(&graphics->window5, 0, str, 0, 64, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    String_Delete(str);
    CopyWindowToVram(&graphics->window5);
}
