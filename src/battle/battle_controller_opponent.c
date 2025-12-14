#include "battle/battle_controller_opponent.h"

#include "global.h"

#include "battle/battle_system.h"
#include "pokemon.h"
#include "pokepic.h"
#include "unk_02013FDC.h"

u8 *BattleSystem_GetBattleContextUnk21A4(BattleSystem *bsys);
void ov12_02261F38(BattleSystem *bsys, s32 battlerId, u16 arg2, Pokepic *pokepic, NARC *narc, s32 species, s32 arg6, s32 arg7, s32 arg8);
Pokepic *BattleSystem_CreatePokemonSprite(BattleSystem *bsys, PokepicManager *pokepicManager, PokepicTemplate *template, s32 xPos, s32 arg4, s32 arg5, s32 arg6, s32 arg7, s32 arg8, s32 arg9, s32 index, PokepicAnimScript *animScript, PokepicCallback callback);

u8 *BattleSystem_GetBattleContextUnk21A4(BattleSystem *bsys) {
    return (BattleSystem_GetBattleContext(bsys))->unk_21A4;
}

void ov12_02261F38(BattleSystem *bsys, s32 battlerId, u16 arg2, Pokepic *pokepic, NARC *narc, s32 species, s32 arg6, s32 arg7, s32 arg8) {
    u8 sp14;
    s32 var_r4;

    sp14 = 0;
    if (BattleSystem_AreBattleAnimationsOn(bsys) == TRUE) {
        Pokepic_StartAnim(pokepic);
        sub_0207294C(narc, BattleSystem_GetUnk1C8(bsys), pokepic, (u16) species, arg7, 0, battlerId);
        sub_020729A4(narc, &sp14, (u16) species, arg2);
    }
    if (arg7 == 2) {
        var_r4 = 0x75;
    } else {
        var_r4 = -0x75;
    }
    if (sp14 == 0) {
        sp14 = 8;
    }
    Chatot_ChatterPlayCryVariant(BattleSystem_GetChatotVoice(bsys, battlerId), arg8, (u16) species, arg6, var_r4, 0x7F, 0, 5, (s32) sp14);
}

Pokepic *BattleSystem_CreatePokemonSprite(BattleSystem *bsys, PokepicManager *pokepicManager, PokepicTemplate *template, s32 xPos, s32 arg4, s32 arg5, s32 arg6, s32 arg7, s32 arg8, s32 arg9, s32 index, PokepicAnimScript *animScript, PokepicCallback callback) {
    u8 *sp20;
    s32 sp1C;
    s32 x;
    PokepicManager *ppm;
    s32 temp_r0;
    Pokepic *pokepic;
    s32 whichFacing;
    s32 var_r6;

    ppm = pokepicManager;
    x = xPos;
    sp20 = BattleSystem_GetUnk0(ov12_0223A99C(bsys), index);
    var_r6 = ov12_0223AB0C(bsys, index);
    temp_r0 = 1 & var_r6;
    sp1C = temp_r0;
    if (temp_r0 != 0) {
        whichFacing = 2;
    } else {
        whichFacing = 0;
    }
    DrawPokemonSprite_Battle((NarcId)template->narcID, template->charDataID, HEAP_ID_BATTLE, sp20, template->personality, 0, whichFacing, (s32) template->species);
    BattleSystem_SetUnk4(ov12_0223A99C(bsys), index, template->narcID);
    BattleSystem_SetUnk8(ov12_0223A99C(bsys), index, template->palDataID);
    BattleSystem_SetUnkC(ov12_0223A99C(bsys), index, arg6);
    pokepic = PokepicManager_CreatePokepicAt(ppm, template, x, arg4 + arg6, arg5, index, index, animScript, callback);
    if (sp1C != 0) {
        if (var_r6 > 1) {
            var_r6 = var_r6 >> 1;
        }
        Pokepic_SetAttr(pokepic, 0x2A, var_r6);
        Pokepic_SetAttr(pokepic, 0x2E, arg9);
        Pokepic_SetAttr(pokepic, 0x14, arg4 + 0x24);
        Pokepic_SetAttr(pokepic, 0x15, arg8);
        Pokepic_SetAttr(pokepic, 0x16, 0x24 - arg6);
        Pokepic_SetAttr(pokepic, 0x29, arg7);
    }
    return pokepic;
}
