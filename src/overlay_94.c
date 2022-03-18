#include "assert.h"
#include "heap.h"
#include "party.h"
#include "pokemon.h"
#include "pokedex.h"
#include "scrcmd.h"
#include "unk_02005D10.h"
#include "unk_02014DA0.h"
#include "unk_0207EB24.h"
#include "unk_02078E30.h"
#include "unk_0207CB7C.h"
#include "unk_02026E30.h"
#include "text.h"
#include "constants/pokemon.h"
#include "constants/species.h"
#include "constants/sndseq.h"
#include "msgdata/msg/msg_0300.h"
#include "overlay_94.h"

static void ov94_021E5AEC(struct UnkStruct_Overlay_94_A* unkPtr);
static void ov94_021E5B04(struct UnkStruct_Overlay_94_A* unkPtr);
static void ov94_021E5B30(struct UnkStruct_Overlay_94_A* unkPtr);
static void ov94_021E5B54(struct UnkStruct_Overlay_94_C* unkPtr);
static void ov94_021E5BA0(struct UnkStruct_Overlay_94_C* unkPtr);
static void ov94_021E5C28(struct SPLEmitter* unkPtr);
static s32 ov94_021E5C60(void);
static void ov94_021E5C84(struct UnkStruct_Overlay_94_C* unkPtr);
static u32 ov94_021E5CA0(u32 unkA, BOOL unkB);
static u32 ov94_021E5CC4(u32 unkA, BOOL unkB);

void ov94_021E5900(UnkStruct_Overlay_94_A* unkPtr) {
    if (unkPtr->unkc80 != NULL) {
        GF_ASSERT(FALSE);
    }
    unkPtr->unkc80 = AllocFromHeap(HEAPID_PARTY_MENU, sizeof(UnkStruct_Overlay_94_C));
    MI_CpuClear8(unkPtr->unkc80, sizeof(UnkStruct_Overlay_94_C));
    unkPtr->unkc80->partyMonIndex = unkPtr->partyMonIndex;
}

BOOL ov94_021E593C(UnkStruct_Overlay_94_A* unkPtr) {
    UnkStruct_Overlay_94_C* unkA = unkPtr->unkc80;
    POKEMON* pokemon = GetPartyMonByIndex(unkPtr->unk654->party, unkPtr->partyMonIndex);

    switch (unkA->unk0) {
    case 0:
        unkA->species = GetMonData(pokemon, MON_DATA_SPECIES, 0);
        switch (unkA->species) {
        case SPECIES_GIRATINA:
            Mon_UpdateGiratinaForme(pokemon);
            unkA->unk8 = 65;
            unkA->unk10 = 0;
            break;
        case SPECIES_SHAYMIN:
            Mon_UpdateShayminForme(pokemon, SHAYMIN_SKY);
            unkA->unk8 = 35;
            unkA->unk10 = 1;
            break;
        case SPECIES_ROTOM:
        default:
            GF_ASSERT(FALSE);
            break;
        } 
        Pokedex_SetMonCaughtFlag(Sav2_Pokedex_get(Fsys_GetSaveDataPtr(unkPtr->unk654->fsys)), pokemon);
        unkA->unk0++;
        break;
    case 1:
    case 2:
        unkA->unk0++;
        break;
    case 3:
        ov94_021E5B04(unkPtr);
        unkA->unk0++;
        break;
    case 4:
        GX_EngineAToggleLayers(1, 1);
        ov94_021E5BA0(unkA);
        unkA->unk0++;
        break;
    case 5:
        unkA->unk4++;
        if (unkA->unk4 == unkA->unk8) {
            sub_0207ECE0(unkPtr, unkPtr->partyMonIndex);
        }
        ov94_021E5C60();
        if (unkA->unk4 > unkA->unk8) {
            if (sub_020154B0(unkA->unk18) == 0) {
                unkA->unk0++;
            }
        }
        break;
    case 6:
        ov94_021E5B30(unkPtr);
        unkA->unk0++;
        break;
    case 7:
        sub_020720D4(pokemon);
        unkA->unk0++;
        break;
    case 8:
        if (IsCryFinished() == FALSE) {
            unkA->unk0++;
        }
        break;
    case 9:
        STRING* str = NewString_ReadMsgData(unkPtr->msgData, msg_0300_00188); //" changed Forme!"
        BufferBoxMonNickname(unkPtr->unk7c4, 0, Mon_GetBoxMon(pokemon));
        StringExpandPlaceholders(unkPtr->unk7c4, unkPtr->unk7c8, str);
        String_dtor(str);
        sub_0207DAEC(unkPtr, -1, 1);
        unkA->unk0++;
        break;
    case 10:
        if (sub_02020094(unkPtr->unkc64) == 0) {
            ov94_021E5AEC(unkPtr);
            unkPtr->unk654->unk27 = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void ov94_021E5AEC(UnkStruct_Overlay_94_A* unkPtr) {
    FreeToHeap(unkPtr->unkc80);
    unkPtr->unkc80 = 0;
}

static void ov94_021E5B04(UnkStruct_Overlay_94_A* unkPtr) {
    sub_0207991C(unkPtr, 0);
    ov94_021E5B54(unkPtr->unkc80);
    G2_SetBlendAlpha(0, 63, 31, 0);
}

static void ov94_021E5B30(UnkStruct_Overlay_94_A* unkPtr) {
    ov94_021E5C84(unkPtr->unkc80);
    sub_0207991C(unkPtr, 1);
    G2_BlendNone();
}

static void ov94_021E5B54(UnkStruct_Overlay_94_C* unkPtr) {
    sub_02014DA0();
    void* unkPtrB = AllocFromHeap(HEAPID_PARTY_MENU, PARTICLE_HEAP_SIZE);

    unkPtr->unk18 = sub_02014DB4(ov94_021E5CA0, ov94_021E5CC4, unkPtrB, PARTICLE_HEAP_SIZE, 1, HEAPID_PARTY_MENU);

    sub_02023240(1 * FX32_ONE, 900 * FX32_ONE, sub_02015524());
}

static void ov94_021E5BA0(UnkStruct_Overlay_94_C* unkPtr) {
    sub_0201526C(unkPtr->unk18, sub_02015264(208, unkPtr->unk10, HEAPID_PARTY_MENU), 10, 1);

    switch (unkPtr->species) {
    case SPECIES_GIRATINA: 
        sub_02015494(unkPtr->unk18, 0, ov94_021E5C28, unkPtr);
        sub_02015494(unkPtr->unk18, 1, ov94_021E5C28, unkPtr);
        sub_02015494(unkPtr->unk18, 2, ov94_021E5C28, unkPtr);
        PlaySE(SEQ_SE_PL_W467109);
        break;
    case SPECIES_SHAYMIN: 
        sub_02015494(unkPtr->unk18, 0, ov94_021E5C28, unkPtr);
        sub_02015494(unkPtr->unk18, 1, ov94_021E5C28, unkPtr);
        PlaySE(SEQ_SE_PL_W363);
        break;
    }
}

static const fx32 PartyMonSpritePositions[][2] = {
  { -16500, 12000 },
  { 5000, 11500 },
  { -16500, 5000 },
  { 5000, 3500 },
  { -16500, -3000 },
  { 5000, -4500 }
};

static void ov94_021E5C28(struct SPLEmitter* emitter) {
    struct UnkStruct_Overlay_94_C* unkA = sub_02015504();
    SPL_SetEmitterPositionX(emitter, PartyMonSpritePositions[unkA->partyMonIndex][0]);
    SPL_SetEmitterPositionY(emitter, PartyMonSpritePositions[unkA->partyMonIndex][1]);
}

static s32 ov94_021E5C60(void) {
    sub_02026E48();
    s32 val = sub_0201543C();
    if (val > 0) {
        sub_02026E48();
    }
    sub_02015460();
    sub_02026E50(1, 0);
    return val;
}

static void ov94_021E5C84(UnkStruct_Overlay_94_C* unkPtr) {
    void* unkA = sub_020154D0(unkPtr->unk18);
    sub_02014EBC(unkPtr->unk18);
    FreeToHeap(unkA);
}

static u32 ov94_021E5CA0(u32 unkA, BOOL unkB) {
    NNSGfdTexKey unkC = NNS_GfdDefaultFuncAllocTexVram(unkA, unkB, 0);

    GF_ASSERT(unkC != NNS_GFD_ALLOC_ERROR_TEXKEY);
     
    sub_02015354(unkC);
    
    return NNS_GfdGetTexKeyAddr(unkC);
}

static u32 ov94_021E5CC4(u32 unkA, BOOL unkB) {
    NNSGfdPlttKey unkC = NNS_GfdDefaultFuncAllocPlttVram(unkA, unkB, 1);
    
    GF_ASSERT(unkC != NNS_GFD_ALLOC_ERROR_PLTTKEY);

    sub_02015394(unkC);

    return NNS_GfdGetPlttKeyAddr(unkC);
}
