#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0666.h"

#include "unk_02005D10.h"
#include "unk_0205BB1C.h"

u16 PhoneCall_GetScriptId_ProfOak(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    Pokedex *pokedex;
    u16 dexCountParam;

    state->scriptType = 0;
    pokedex = Save_Pokedex_Get(ctx->saveData);
    if (state->isScriptedCall == 2) {
        state->scriptType = 0;
        return PHONE_SCRIPT_082;
    }
    if (state->isIncomingCall != 0) {
        dexCountParam = Pokedex_CountNationalDexOwned(pokedex) / 50;
        if (dexCountParam == 0) {
            dexCountParam = 1;
        } else if (dexCountParam > 9) {
            dexCountParam = 9;
        }
        return PHONE_SCRIPT_068 + dexCountParam;
    }
    if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
        return PHONE_SCRIPT_068;
    }
    if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION)) {
        return PHONE_SCRIPT_081;
    }
    if (!Pokedex_GetNatDexFlag(pokedex) && Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION)) {
        return PHONE_SCRIPT_080;
    }
    state->scriptType = 5;
    return PHONE_SCRIPT_NONE;
}

BOOL GearPhoneCall_ProfOak(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    Pokedex *pokedex;
    int r6;
    u16 r7;
    u16 r6_2;
    u16 dexFanfare;
    BOOL r6_3;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        pokedex = Save_Pokedex_Get(ctx->saveData);
        state->flag0 = Pokedex_GetNatDexFlag(pokedex);
        state->flag1 = Pokedex_JohtoDexIsComplete(pokedex);
        state->flag2 = Pokedex_NationalDexIsComplete(pokedex);
        state->miscPtr.pokedex = pokedex;
        PhoneCallMessagePrint_Gendered(ctx, ctx->msgData_PhoneContact, msg_0666_00013, msg_0666_00014);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0666_00015);
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        if (state->flag0) {
            if (Save_VarsFlags_CheckFlagInArray(ctx->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION)) {
                state->sharedU8var = 2;
            } else {
                state->sharedU8var = 1;
            }
        } else {
            state->sharedU8var = 0;
        }
        PhoneCall_TouchscreenListMenu_Create(ctx, msg_0666_00003 + state->sharedU8var);
        break;
    case 3:
        r6 = PhoneCall_TouchscreenListMenu_HandleInput(ctx);
        if (r6 == -1) {
            return FALSE;
        }
        PhoneCall_TouchscreenListMenu_Destroy(ctx);
        if (r6 == 0) {
            if (state->sharedU8var == 2) {
                state->flag3 = TRUE;
            } else {
                state->flag3 = FALSE;
            }
        } else if (r6 == 1 && state->sharedU8var == 1) {
            state->flag3 = TRUE;
        } else {
            PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0666_00021);
            state->scriptState = 255;
            return FALSE;
        }
        if (!state->flag3) {
            r7 = Pokedex_CountJohtoDexSeen(state->miscPtr.pokedex);
            r6_2 = Pokedex_CountJohtoDexOwned(state->miscPtr.pokedex);
        } else {
            r7 = Pokedex_CountNationalDexSeen(state->miscPtr.pokedex);
            r6_2 = Pokedex_CountNationalDexOwned(state->miscPtr.pokedex);
        }
        BufferIntegerAsString(ctx->msgFormat, 5, r7, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BufferIntegerAsString(ctx->msgFormat, 6, r6_2, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0666_00020);
        break;
    case 4:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        r6_3 = FALSE;
        if (!state->flag3) {
            r7 = GetOakJohtoDexRating(Pokedex_CountJohtoOwned_ExcludeMythical(state->miscPtr.pokedex), ctx->playerGender, &dexFanfare);
            if (state->flag1) {
                Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION);
                r6_3 = TRUE;
            }
        } else {
            r7 = GetOakNationalDexRating(Pokedex_CountNationalOwned_ExcludeMythical(state->miscPtr.pokedex), ctx->playerGender, &dexFanfare);
            if (state->flag2) {
                Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION);
                r6_3 = TRUE;
            }
        }
        PlayFanfare(dexFanfare);
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, r7);
        if (r6_3) {
            state->scriptState = 255;
            return FALSE;
        }
        break;
    case 5:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        if (IsFanfarePlaying()) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_PhoneContact, msg_0666_00021);
        break;
    default:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        if (state->scriptState == 255 && IsFanfarePlaying()) {
            return FALSE;
        }
        DestroyMsgData(ctx->msgData_PhoneContact);
        return TRUE;
    }

    ++state->scriptState;
    return FALSE;
}
