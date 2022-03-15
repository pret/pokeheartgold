#include "assert.h"
#include "heap.h"
#include "party.h"
#include "pokemon.h"
#include "constants/pokemon.h"
#include "constants/species.h"
#include "constants/sndseq.h"
#include "overlay_94.h"

void ov94_021E5900(struct UnkStruct_Overlay_94_A* unkPtr) {
    if ((u32) unkPtr->unkc80 != 0) {
        GF_ASSERT(FALSE);
    }
    unkPtr->unkc80 = AllocFromHeap(0xc, 0x1c);
    MI_CpuFill8(unkPtr->unkc80, 0, 0x1c);
    unkPtr->unkc80->partyMonIndex = unkPtr->partyMonIndex;
}

BOOL ov94_021E593C(struct UnkStruct_Overlay_94_A* unkPtr) { 
    struct UnkStruct_Overlay_94_C* unkA = unkPtr->unkc80; 
    POKEMON* pokemon = GetPartyMonByIndex(unkPtr->unk654->party, unkPtr->partyMonIndex);

    switch (unkA->unk0) {
        case 0:
            unkA->species = GetMonData(pokemon, MON_DATA_SPECIES, 0);
            switch (unkA->species) {
                case SPECIES_GIRATINA:
                    Mon_UpdateGiratinaForme(pokemon);
                    unkA->unk8 = 0x41;
                    unkA->unk10 = 0;
                    break;
                case SPECIES_SHAYMIN:
                    Mon_UpdateShayminForme(pokemon, SHAYMIN_SKY);
                    unkA->unk8 = 0x23;
                    unkA->unk10 = 1;
                    break;
                case SPECIES_ROTOM:
                default:
                    GF_ASSERT(FALSE);
                    break;
            } 
            Pokedex_SetMonCaughtFlag(Sav2_Pokedex_get(ScriptEnvironment_GetSav2Ptr(unkPtr->unk654->fsys)), pokemon);
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
            if(unkA->unk4 == unkA->unk8) {
                sub_0207ECE0(unkPtr, unkPtr->partyMonIndex);
            }
            ov94_021E5C60();
            if(unkA->unk4 > unkA->unk8) {
                if(sub_020154B0(unkA->unk18) == 0) {
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
            if(IsCryFinished() == FALSE) {
                unkA->unk0++;
            }
            break;
        case 9:
            STRING* str = NewString_ReadMsgData(unkPtr->msgData, 0xbc);
            BufferBoxMonNickname(unkPtr->unk7c4, 0, Mon_GetBoxMon(pokemon));
            StringExpandPlaceholders(unkPtr->unk7c4, unkPtr->unk7c8, str);
            String_dtor(str);
            sub_0207DAEC(unkPtr, ~0, 1);
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

void ov94_021E5AEC(struct UnkStruct_Overlay_94_A* unkPtr) {
    FreeToHeap(unkPtr->unkc80);
    unkPtr->unkc80 = 0;
}

void ov94_021E5B04(struct UnkStruct_Overlay_94_A* unkPtr) {
    sub_0207991C(unkPtr, 0);
    ov94_021E5B54(unkPtr->unkc80);
    G2x_SetBlendAlpha_(0x04000050, 0, 0x3f, 0x1f, 0);
}

void ov94_021E5B30(struct UnkStruct_Overlay_94_A* unkPtr) {
    ov94_021E5C84(unkPtr->unkc80);
    sub_0207991C(unkPtr, 1);
    u16* unkPtr2 = (u16*) 0x04000050;
    unkPtr2[0] = 0;
}

void ov94_021E5B54(struct UnkStruct_Overlay_94_C* unkPtr) {
    sub_02014DA0();
    void* unkPtrB = AllocFromHeap(0xc, 0x4800);

    unkPtr->unk18 = sub_02014DB4(ov94_021E5CA0, ov94_021E5CC4, unkPtrB, 0x4800, 1, 0xc);

    sub_02023240(0x1000, 0x384000, sub_02015524());
}

void ov94_021E5BA0(struct UnkStruct_Overlay_94_C* unkPtr) { 
    sub_0201526C(unkPtr->unk18, sub_02015264(0xd0, unkPtr->unk10, 0xc), 0xa, 1);

    switch (unkPtr->species) {
        case SPECIES_GIRATINA: 
            sub_02015494(unkPtr->unk18, 0, ov94_021E5C28, unkPtr);
            sub_02015494(unkPtr->unk18, 1, ov94_021E5C28, unkPtr);
            sub_02015494(unkPtr->unk18, 2, ov94_021E5C28, unkPtr);
            PlaySE(SEQ_SE_PARTY_GIRATINA_FORME_CHANGE);
            return;
        case SPECIES_SHAYMIN: 
            sub_02015494(unkPtr->unk18, 0, ov94_021E5C28, unkPtr);
            sub_02015494(unkPtr->unk18, 1, ov94_021E5C28, unkPtr);
            PlaySE(SEQ_SE_PARTY_SHAYMIN_FORME_CHANGE);
            return;
    }
}

static const int PartyMonSpritePositions[][2] = {
  { -16500, 12000 },
  { 5000, 11500 },
  { -16500, 5000 },
  { 5000, 3500 },
  { -16500, -3000 },
  { 5000, -4500 }
};


void ov94_021E5C28(struct UnkStruct_Overlay_94_C* unkPtr) {
    u32* unkA = (u32*) sub_02015504();
    int x_pos = PartyMonSpritePositions[unkA[5]][0];
	unkPtr->unk28 = x_pos + unkPtr->unk20[0][1];
	int y_pos = PartyMonSpritePositions[unkA[5]][1];
	unkPtr->unk2c = y_pos + unkPtr->unk20[0][2];
}

s32 ov94_021E5C60(void) {
    sub_02026E48();
    s32 val = sub_0201543C();
    if (val > 0) {
        sub_02026E48();
    }
    sub_02015460();
    sub_02026E50(1, 0);
    return val;
}

void ov94_021E5C84(struct UnkStruct_Overlay_94_C* unkPtr) {
    s32* unkA = (s32*) sub_020154D0(unkPtr->unk18);
    sub_02014EBC(unkPtr->unk18);
    FreeToHeap(unkA);
}

extern u32 (*NNS_GfdDefaultFuncAllocTexVram)(u32 param0, int param1, u32 param2);
u32 ov94_021E5CA0(u32 unkA, u32 unkB) {
    u32 unkC = NNS_GfdDefaultFuncAllocTexVram(unkA, unkB, 0);

    if(unkC == 0)
    {
        GF_ASSERT(FALSE);
    }
    sub_02015354(unkC);

    unkC = unkC << 0x10;
    unkC = unkC >> 0xd;

    return unkC;
}

extern u32 (*NNS_GfdDefaultFuncAllocPlttVram)(u32 param0, int param1, u32 param2);
u32 ov94_021E5CC4(u32 unkA, u32 unkB) {
    
    u32 unkC = NNS_GfdDefaultFuncAllocPlttVram(unkA, unkB, 1);
    
    if(unkC == 0)
    {
        GF_AssertFail();
    }

    sub_02015394(unkC);

    unkC = unkC << 0x10;
    unkC = unkC >> 0xd;

    return unkC;
}

