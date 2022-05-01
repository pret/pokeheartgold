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

static void _DestroyLocalWork(struct PartyMenuStruct* unkPtr);
static void _InitEffects(struct PartyMenuStruct* unkPtr);
static void _CleanupEffects(struct PartyMenuStruct* unkPtr);
static void _CreateParticleSystem(struct IconFormeChangeWork* unkPtr);
static void _EmitParticles(struct IconFormeChangeWork* unkPtr);
static void particleEmitCallback(struct SPLEmitter* unkPtr);
static s32 _RunParticleSystem(void);
static void _DestroyParticleSystem(struct IconFormeChangeWork* unkPtr);
static u32 texAlloc(u32 szByte, BOOL is4x4comp);
static u32 plttAlloc(u32 szByte, BOOL is4pltt);

void PartyMenu_InitIconFormeChangeWork(PartyMenuStruct* unkPtr) {
    if (unkPtr->iconFormeChange != NULL) {
        GF_ASSERT(FALSE);
    }
    unkPtr->iconFormeChange = AllocFromHeap(HEAPID_PARTY_MENU, sizeof(IconFormeChangeWork));
    MI_CpuClear8(unkPtr->iconFormeChange, sizeof(IconFormeChangeWork));
    unkPtr->iconFormeChange->partyMonIndex = unkPtr->partyMonIndex;
}

// TODO: Create NAIX
#define NARC_particle_giratina 0
#define NARC_particle_shaymin  1

BOOL PartyMenu_AnimateIconFormeChange(PartyMenuStruct* unkPtr) {
    IconFormeChangeWork* work = unkPtr->iconFormeChange;
    POKEMON* pokemon = GetPartyMonByIndex(unkPtr->unk654->party, unkPtr->partyMonIndex);

    switch (work->state) {
    case 0:
        work->species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        switch (work->species) {
        case SPECIES_GIRATINA:
            Mon_UpdateGiratinaForme(pokemon);
            work->duration = 65;
            work->fileId = NARC_particle_giratina;
            break;
        case SPECIES_SHAYMIN:
            Mon_UpdateShayminForme(pokemon, SHAYMIN_SKY);
            work->duration = 35;
            work->fileId = NARC_particle_shaymin;
            break;
        case SPECIES_ROTOM:
        default:
            GF_ASSERT(FALSE);
            break;
        } 
        Pokedex_SetMonCaughtFlag(Sav2_Pokedex_get(Fsys_GetSaveDataPtr(unkPtr->unk654->fsys)), pokemon);
        work->state++;
        break;
    case 1:
    case 2:
        work->state++;
        break;
    case 3:
        _InitEffects(unkPtr);
        work->state++;
        break;
    case 4:
        GX_EngineAToggleLayers(1, GX_LAYER_TOGGLE_ON);
        _EmitParticles(work);
        work->state++;
        break;
    case 5:
        work->effectTimer++;
        if (work->effectTimer == work->duration) {
            sub_0207ECE0(unkPtr, unkPtr->partyMonIndex);
        }
        _RunParticleSystem();
        if (work->effectTimer > work->duration) {
            if (sub_020154B0(work->particleSystem) == 0) {
                work->state++;
            }
        }
        break;
    case 6:
        _CleanupEffects(unkPtr);
        work->state++;
        break;
    case 7:
        sub_020720D4(pokemon);
        work->state++;
        break;
    case 8:
        if (IsCryFinished() == FALSE) {
            work->state++;
        }
        break;
    case 9:
        STRING* str = NewString_ReadMsgData(unkPtr->msgData, msg_0300_00188); //" changed Forme!"
        BufferBoxMonNickname(unkPtr->unk7c4, 0, Mon_GetBoxMon(pokemon));
        StringExpandPlaceholders(unkPtr->unk7c4, unkPtr->unk7c8, str);
        String_dtor(str);
        sub_0207DAEC(unkPtr, -1, 1);
        work->state++;
        break;
    case 10:
        if (TextPrinterCheckActive(unkPtr->unkc64) == 0) {
            _DestroyLocalWork(unkPtr);
            unkPtr->unk654->unk27 = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void _DestroyLocalWork(PartyMenuStruct* unkPtr) {
    FreeToHeap(unkPtr->iconFormeChange);
    unkPtr->iconFormeChange = 0;
}

static void _InitEffects(PartyMenuStruct* unkPtr) {
    sub_0207991C(unkPtr, 0);
    _CreateParticleSystem(unkPtr->iconFormeChange);
    G2_SetBlendAlpha(0, 63, 31, 0);
}

static void _CleanupEffects(PartyMenuStruct* unkPtr) {
    _DestroyParticleSystem(unkPtr->iconFormeChange);
    sub_0207991C(unkPtr, 1);
    G2_BlendNone();
}

static void _CreateParticleSystem(IconFormeChangeWork* unkPtr) {
    sub_02014DA0();
    void* particleHeap = AllocFromHeap(HEAPID_PARTY_MENU, PARTICLE_HEAP_SIZE);

    unkPtr->particleSystem = sub_02014DB4(texAlloc, plttAlloc, particleHeap, PARTICLE_HEAP_SIZE, 1, HEAPID_PARTY_MENU);

    GF_Camera_SetClipBounds(1 * FX32_ONE, 900 * FX32_ONE, sub_02015524());
}

static void _EmitParticles(IconFormeChangeWork* unkPtr) {
    sub_0201526C(unkPtr->particleSystem, sub_02015264(NARC_a_2_0_6, unkPtr->fileId, HEAPID_PARTY_MENU), 0xA, 1);

    switch (unkPtr->species) {
    case SPECIES_GIRATINA: 
        sub_02015494(unkPtr->particleSystem, 0, particleEmitCallback, unkPtr);
        sub_02015494(unkPtr->particleSystem, 1, particleEmitCallback, unkPtr);
        sub_02015494(unkPtr->particleSystem, 2, particleEmitCallback, unkPtr);
        PlaySE(SEQ_SE_PL_W467109);
        break;
    case SPECIES_SHAYMIN: 
        sub_02015494(unkPtr->particleSystem, 0, particleEmitCallback, unkPtr);
        sub_02015494(unkPtr->particleSystem, 1, particleEmitCallback, unkPtr);
        PlaySE(SEQ_SE_PL_W363);
        break;
    }
}

static const fx32 sPartyMonSpritePositions[][2] = {
  { -16500, 12000 },
  { 5000, 11500 },
  { -16500, 5000 },
  { 5000, 3500 },
  { -16500, -3000 },
  { 5000, -4500 }
};

static void particleEmitCallback(struct SPLEmitter* emitter) {
    struct IconFormeChangeWork* unkA = sub_02015504();
    SPL_SetEmitterPositionX(emitter, sPartyMonSpritePositions[unkA->partyMonIndex][0]);
    SPL_SetEmitterPositionY(emitter, sPartyMonSpritePositions[unkA->partyMonIndex][1]);
}

static s32 _RunParticleSystem(void) {
    sub_02026E48();
    s32 val = sub_0201543C();
    if (val > 0) {
        sub_02026E48();
    }
    sub_02015460();
    sub_02026E50(1, 0);
    return val;
}

static void _DestroyParticleSystem(IconFormeChangeWork* unkPtr) {
    void* unkA = sub_020154D0(unkPtr->particleSystem);
    sub_02014EBC(unkPtr->particleSystem);
    FreeToHeap(unkA);
}

static u32 texAlloc(u32 szByte, BOOL is4x4comp) {
    NNSGfdTexKey unkC = NNS_GfdDefaultFuncAllocTexVram(szByte, is4x4comp, 0);

    GF_ASSERT(unkC != NNS_GFD_ALLOC_ERROR_TEXKEY);
     
    sub_02015354(unkC);
    
    return NNS_GfdGetTexKeyAddr(unkC);
}

static u32 plttAlloc(u32 szByte, BOOL is4pltt) {
    NNSGfdPlttKey unkC = NNS_GfdDefaultFuncAllocPlttVram(szByte, is4pltt, 1);
    
    GF_ASSERT(unkC != NNS_GFD_ALLOC_ERROR_PLTTKEY);

    sub_02015394(unkC);

    return NNS_GfdGetPlttKeyAddr(unkC);
}
