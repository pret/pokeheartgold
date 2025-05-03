#include "global.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg/msg_0666.h"

#include "unk_02005D10.h"
#include "unk_0205BB1C.h"

u16 PhoneCall_GetScriptId_ProfOak(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    Pokedex *pokedex;
    u16 dexCountParam;

    a1->scriptType = 0;
    pokedex = Save_Pokedex_Get(a0->saveData);
    if (a1->unk_1A == 2) {
        a1->scriptType = 0;
        return PHONE_SCRIPT_082;
    }
    if (a1->unk_19 != 0) {
        dexCountParam = Pokedex_CountNationalDexOwned(pokedex) / 50;
        if (dexCountParam == 0) {
            dexCountParam = 1;
        } else if (dexCountParam > 9) {
            dexCountParam = 9;
        }
        return PHONE_SCRIPT_068 + dexCountParam;
    }
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_068;
    }
    if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION)) {
        return PHONE_SCRIPT_081;
    }
    if (!Pokedex_GetNatDexFlag(pokedex) && Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION)) {
        return PHONE_SCRIPT_080;
    }
    a1->scriptType = 5;
    return PHONE_SCRIPT_000;
}

BOOL GearPhoneCall_ProfOak(PokegearPhoneApp_Sub0C4 *a0) {
    PokegearPhoneApp_Sub0C4_Sub88 *r4 = &a0->unk_88;
    Pokedex *pokedex;
    int r6;
    u16 r7;
    u16 r6_2;
    u16 dexFanfare;
    BOOL r6_3;

    switch (r4->unk_04) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(a0);
        pokedex = Save_Pokedex_Get(a0->saveData);
        r4->flag0 = Pokedex_GetNatDexFlag(pokedex);
        r4->flag1 = Pokedex_JohtoDexIsComplete(pokedex);
        r4->flag2 = Pokedex_NationalDexIsComplete(pokedex);
        r4->miscPtr.pokedex = pokedex;
        PhoneCallMessagePrint_Gendered(a0, a0->msgData_PhoneContact, msg_0666_00013, msg_0666_00014);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0666_00015);
        break;
    case 2:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (r4->flag0) {
            if (Save_VarsFlags_CheckFlagInArray(a0->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION)) {
                r4->unk_4A = 2;
            } else {
                r4->unk_4A = 1;
            }
        } else {
            r4->unk_4A = 0;
        }
        PhoneCall_TouchscreenListMenu_Create(a0, msg_0666_00003 + r4->unk_4A);
        break;
    case 3:
        r6 = PhoneCall_TouchscreenListMenu_HandleInput(a0);
        if (r6 == -1) {
            return FALSE;
        }
        PhoneCall_TouchscreenListMenu_Destroy(a0);
        if (r6 == 0) {
            if (r4->unk_4A == 2) {
                r4->flag3 = TRUE;
            } else {
                r4->flag3 = FALSE;
            }
        } else if (r6 == 1 && r4->unk_4A == 1) {
            r4->flag3 = TRUE;
        } else {
            PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0666_00021);
            r4->unk_04 = 255;
            return FALSE;
        }
        if (!r4->flag3) {
            r7 = Pokedex_CountJohtoDexSeen(r4->miscPtr.pokedex);
            r6_2 = Pokedex_CountJohtoDexOwned(r4->miscPtr.pokedex);
        } else {
            r7 = Pokedex_CountNationalDexSeen(r4->miscPtr.pokedex);
            r6_2 = Pokedex_CountNationalDexOwned(r4->miscPtr.pokedex);
        }
        BufferIntegerAsString(a0->msgFormat, 5, r7, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BufferIntegerAsString(a0->msgFormat, 6, r6_2, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0666_00020);
        break;
    case 4:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        r6_3 = FALSE;
        if (!r4->flag3) {
            r7 = GetOakJohtoDexRating(Pokedex_CountJohtoOwned_ExcludeMythical(r4->miscPtr.pokedex), a0->playerGender, &dexFanfare);
            if (r4->flag1) {
                Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_JOHTO_DEX_COMPLETION);
                r6_3 = TRUE;
            }
        } else {
            r7 = GetOakNationalDexRating(Pokedex_CountNationalOwned_ExcludeMythical(r4->miscPtr.pokedex), a0->playerGender, &dexFanfare);
            if (r4->flag2) {
                Save_VarsFlags_SetFlagInArray(a0->saveVarsFlags, FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION);
                r6_3 = TRUE;
            }
        }
        PlayFanfare(dexFanfare);
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, r7);
        if (r6_3) {
            r4->unk_04 = 255;
            return FALSE;
        }
        break;
    case 5:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (IsFanfarePlaying()) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(a0, a0->msgData_PhoneContact, msg_0666_00021);
        break;
    default:
        if (!PhoneCall_IsMessageDonePrinting(a0)) {
            return FALSE;
        }
        if (r4->unk_04 == 255 && IsFanfarePlaying()) {
            return FALSE;
        }
        DestroyMsgData(a0->msgData_PhoneContact);
        return TRUE;
    }

    ++r4->unk_04;
    return FALSE;
}
