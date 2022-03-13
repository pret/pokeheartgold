#include "assert.h"
#include "heap.h"
#include "party.h"
#include "pokemon.h"
#include "constants/pokemon.h"
#include "constans/species.h"
#include "overlay_94.h"

void ov94_021E5900(struct UnkStruct_PartyMenu* unkPtr) {
    if ((u32) unkPtr->unkc80 != 0) {
        GF_ASSERT(FALSE);
    }
    unkPtr->unkc80 = AllocFromHeap(0xc, 0x1c);
    MI_CpuFill8(unkPtr->unkc80, 0, 0x1c);
    unkPtr->unkc80[0x5] = unkPtr->unkc65;
}

BOOL ov94_021E593C(struct UnkStruct_PartyMenu* unkPtr) { //r5
    s32* unkA = unkPtr->unkc80; //r4
    POKEMON* pokemon = GetPartyMonByIndex(unkPtr->unk654->party, unkPtr->unkc65); //r6

    switch (unkA[0]) {
        case 0:
            unkA[0x3] = GetMonData(pokemon, 5, 0);
            switch (unkA[0x3]) {
                case SPECIES_GIRATINA:
                    Mon_UpdateGiratinaForme(pokemon);
                    unkA[0x2] = 0x41;
                    unkA[0x4] = 0;
                    break;
                case SPECIES_SHAYMIN:
                    Mon_UpdateShayminForme(pokemon, SHAYMIN_SKY);
                    unkA[0x2] = 0x23;
                    unkA[0x4] = 1;
                    break;
                case SPECIES_ROTOM:
                default:
                    GF_ASSERT(FALSE);
                    break;
            } 
            Pokedex_SetMonCaughtFlag(Sav2_Pokedex_get(ScriptEnvironment_GetSav2Ptr(unkPtr->unk654->fsys)), pokemon);
            unkA[0]++;
            break;
        case 1:
        case 2:
            unkA[0]++;
            break;
        case 3:
            ov94_021E5B04(unkPtr);
            unkA[0]++;
            break;
        case 4:
            GX_EngineAToggleLayers(1, 1);
            ov94_021E5BA0(unkA);
            unkA[0]++;
            break;
        case 5:
            unkA[1]++;
            if(unkA[1] == unkA[2]) {
                sub_0207ECE0(unkPtr, unkPtr->unkc65);
            }
            ov94_021E5C60();
            if(unkA[1] > unkA[2]) {
                if(sub_020154B0(unkA[6]) == 0) {
                    unkA[0]++;
                }
            }
            break;
        case 6:
            ov94_021E5B30(unkPtr);
            unkA[0]++;
            break;
        case 7:
            sub_020720D4(pokemon);
            unkA[0]++;
            break;
        case 8:
            if(IsCryFinished() == FALSE) {
                unkA[0]++;
            }
            break;
        case 9:
            STRING* str = NewString_ReadMsgData(unkPtr->msgData, 0xbc);
            BufferBoxMonNickname(unkPtr->unk7c4, 0, Mon_GetBoxMon(pokemon));
            StringExpandPlaceholders(unkPtr->unk7c4, unkPtr->unk7c8, str);
            String_dtor(str);
            sub_0207DAEC(unkPtr, ~0, 1);
            unkA[0]++;
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

void ov94_021E5AEC(struct UnkStruct_PartyMenu* unkPtr) {
    FreeToHeap(unkPtr->unkc80);
    unkPtr->unkc80 = 0;
}

void ov94_021E5B04(struct UnkStruct_PartyMenu* unkPtr) {
    sub_0207991C(unkPtr, 0);
    ov94_021E5B54(unkPtr->unkc80);
    G2x_SetBlendAlpha_(0x04000050, 0, 0x3f, 0x1f, 0);
}

void ov94_021E5B30(struct UnkStruct_PartyMenu* unkPtr) {
    ov94_021E5C84(unkPtr->unkc80);
    sub_0207991C(unkPtr, 1);
    u16* unkPtr2 = (u16*) 0x04000050;
    unkPtr2[0] = 0;
}
