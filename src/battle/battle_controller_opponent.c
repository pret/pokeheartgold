#include "battle/battle_controller_opponent.h"

#include "global.h"

#include "battle/battle_system.h"
#include "pokemon.h"
#include "pokepic.h"

void ov12_02261F38(BattleSystem *bsys, s32 arg1, u16 arg2, Pokepic *pokepic, NARC *narc, s32 arg5, s32 arg6, s32 arg7, s32 arg8);

void ov12_02261F38(BattleSystem *bsys, s32 arg1, u16 arg2, Pokepic *pokepic, NARC *narc, s32 arg5, s32 arg6, s32 arg7, s32 arg8) {
    u8 sp14;
    s32 var_r4;

    sp14 = 0;
    if (BattleSystem_AreBattleAnimationsOn(bsys) == TRUE) {
        Pokepic_StartAnim(pokepic);
        sub_0207294C(narc, BattleSystem_GetUnk1C8(bsys), pokepic, (u16) arg5, arg7, 0, arg1);
        sub_020729A4(narc, &sp14, (u16) arg5, arg2);
    }
    if (arg7 == 2) {
        var_r4 = 0x75;
    } else {
        var_r4 = -0x75;
    }
    if (sp14 == 0) {
        sp14 = 8;
    }
    Chatot_ChatterPlayCryVariant(BattleSystem_GetChatotVoice(bsys, arg1), arg8, (u16) arg5, arg6, var_r4, 0x7F, 0, 5, (s32) sp14);
}