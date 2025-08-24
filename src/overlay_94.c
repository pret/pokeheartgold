#include "overlay_94.h"

#include "global.h"

#include "constants/pokemon.h"
#include "constants/sndseq.h"
#include "constants/species.h"

#include "msgdata/msg/msg_0300.h"

#include "assert.h"
#include "field_system.h"
#include "heap.h"
#include "party.h"
#include "party_context_menu.h"
#include "party_menu.h"
#include "party_menu_list_items.h"
#include "party_menu_sprites.h"
#include "pokedex.h"
#include "pokemon.h"
#include "scrcmd.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_02014DA0.h"
#include "unk_02026E30.h"

static void _DestroyLocalWork(PartyMenu *partyMenu);
static void _InitEffects(PartyMenu *partyMenu);
static void _CleanupEffects(PartyMenu *partyMenu);
static void _CreateParticleSystem(IconFormChangeData *partyMenu);
static void _EmitParticles(IconFormChangeData *partyMenu);
static void particleEmitCallback(SPLEmitter *partyMenu);
static s32 _RunParticleSystem(void);
static void _DestroyParticleSystem(IconFormChangeData *partyMenu);
static u32 texAlloc(u32 szByte, BOOL is4x4comp);
static u32 plttAlloc(u32 szByte, BOOL is4pltt);

void PartyMenu_InitIconFormChangeData(PartyMenu *partyMenu) {
    if (partyMenu->iconFormChange != NULL) {
        GF_ASSERT(FALSE);
    }
    partyMenu->iconFormChange = Heap_Alloc(HEAP_ID_PARTY_MENU, sizeof(IconFormChangeData));
    MI_CpuClear8(partyMenu->iconFormChange, sizeof(IconFormChangeData));
    partyMenu->iconFormChange->partyMonIndex = partyMenu->partyMonIndex;
}

// TODO: Create NAIX
#define NARC_particle_giratina 0
#define NARC_particle_shaymin  1

BOOL PartyMenu_AnimateIconFormChange(PartyMenu *partyMenu) {
    IconFormChangeData *work = partyMenu->iconFormChange;
    Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);

    switch (work->state) {
    case 0:
        work->species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        switch (work->species) {
        case SPECIES_GIRATINA:
            Mon_UpdateGiratinaForm(mon);
            work->duration = 65;
            work->fileId = NARC_particle_giratina;
            break;
        case SPECIES_SHAYMIN:
            Mon_UpdateShayminForm(mon, SHAYMIN_SKY);
            work->duration = 35;
            work->fileId = NARC_particle_shaymin;
            break;
        case SPECIES_ROTOM:
        default:
            GF_ASSERT(FALSE);
            break;
        }
        Pokedex_SetMonCaughtFlag(Save_Pokedex_Get(FieldSystem_GetSaveData(partyMenu->args->fieldSystem)), mon);
        work->state++;
        break;
    case 1:
    case 2:
        work->state++;
        break;
    case 3:
        _InitEffects(partyMenu);
        work->state++;
        break;
    case 4:
        GfGfx_EngineATogglePlanes(GX_PLANEMASK_BG0, GF_PLANE_TOGGLE_ON);
        _EmitParticles(work);
        work->state++;
        break;
    case 5:
        work->effectTimer++;
        if (work->effectTimer == work->duration) {
            sub_0207ECE0(partyMenu, partyMenu->partyMonIndex);
        }
        _RunParticleSystem();
        if (work->effectTimer > work->duration) {
            if (sub_020154B0(work->particleSystem) == 0) {
                work->state++;
            }
        }
        break;
    case 6:
        _CleanupEffects(partyMenu);
        work->state++;
        break;
    case 7:
        sub_020720D4(mon);
        work->state++;
        break;
    case 8:
        if (IsCryFinished() == FALSE) {
            work->state++;
        }
        break;
    case 9: {
        String *str = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00188); //" changed Form!"
        BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, str);
        String_Delete(str);
        PartyMenu_PrintMessageOnWindow34(partyMenu, -1, TRUE);
        work->state++;
        break;
    }
    case 10:
        if (TextPrinterCheckActive(partyMenu->textPrinterId) == 0) {
            _DestroyLocalWork(partyMenu);
            partyMenu->args->selectedAction = 0;
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void _DestroyLocalWork(PartyMenu *partyMenu) {
    Heap_Free(partyMenu->iconFormChange);
    partyMenu->iconFormChange = 0;
}

static void _InitEffects(PartyMenu *partyMenu) {
    PartyMenu_Toggle3dEngine(partyMenu, PARTY_MENU_3D_ENGINE_ON);
    _CreateParticleSystem(partyMenu->iconFormChange);
    G2_SetBlendAlpha(0, 63, 31, 0);
}

static void _CleanupEffects(PartyMenu *partyMenu) {
    _DestroyParticleSystem(partyMenu->iconFormChange);
    PartyMenu_Toggle3dEngine(partyMenu, PARTY_MENU_3D_ENGINE_OFF);
    G2_BlendNone();
}

static void _CreateParticleSystem(IconFormChangeData *partyMenu) {
    sub_02014DA0();
    void *particleHeap = Heap_Alloc(HEAP_ID_PARTY_MENU, PARTICLE_HEAP_SIZE);

    partyMenu->particleSystem = sub_02014DB4(texAlloc, plttAlloc, particleHeap, PARTICLE_HEAP_SIZE, 1, HEAP_ID_PARTY_MENU);

    Camera_SetPerspectiveClippingPlane(1 * FX32_ONE, 900 * FX32_ONE, sub_02015524(partyMenu->particleSystem));
}

static void _EmitParticles(IconFormChangeData *partyMenu) {
    sub_0201526C(partyMenu->particleSystem, sub_02015264(NARC_a_2_0_6, partyMenu->fileId, HEAP_ID_PARTY_MENU), 0xA, 1);

    switch (partyMenu->species) {
    case SPECIES_GIRATINA:
        sub_02015494(partyMenu->particleSystem, 0, particleEmitCallback, partyMenu);
        sub_02015494(partyMenu->particleSystem, 1, particleEmitCallback, partyMenu);
        sub_02015494(partyMenu->particleSystem, 2, particleEmitCallback, partyMenu);
        PlaySE(SEQ_SE_PL_W467109);
        break;
    case SPECIES_SHAYMIN:
        sub_02015494(partyMenu->particleSystem, 0, particleEmitCallback, partyMenu);
        sub_02015494(partyMenu->particleSystem, 1, particleEmitCallback, partyMenu);
        PlaySE(SEQ_SE_PL_W363);
        break;
    }
}

static const fx32 sPartyMonSpritePositions[][2] = {
    { -16500, 12000 },
    { 5000,   11500 },
    { -16500, 5000  },
    { 5000,   3500  },
    { -16500, -3000 },
    { 5000,   -4500 }
};

static void particleEmitCallback(SPLEmitter *emitter) {
    IconFormChangeData *unkA = sub_02015504();
    SPL_SetEmitterPositionX(emitter, sPartyMonSpritePositions[unkA->partyMonIndex][0]);
    SPL_SetEmitterPositionY(emitter, sPartyMonSpritePositions[unkA->partyMonIndex][1]);
}

static s32 _RunParticleSystem(void) {
    Thunk_G3X_Reset();
    s32 val = sub_0201543C();
    if (val > 0) {
        Thunk_G3X_Reset();
    }
    sub_02015460();
    RequestSwap3DBuffers(GX_SORTMODE_MANUAL, GX_BUFFERMODE_Z);
    return val;
}

static void _DestroyParticleSystem(IconFormChangeData *partyMenu) {
    void *unkA = sub_020154D0(partyMenu->particleSystem);
    sub_02014EBC(partyMenu->particleSystem);
    Heap_Free(unkA);
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
