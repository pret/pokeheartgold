#include "global.h"

#include "constants/items.h"

#include "application/pokegear/phone/phone_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0271.h"

#include "map_header.h"
#include "math_util.h"
#include "phonebook_dat.h"
#include "render_text.h"
#include "text.h"
#include "unk_02005D10.h"

static BOOL (*const sPhoneCallHandlers[])(PokegearPhoneCallContext *) = {
    GearPhoneCall_Simple,
    GearPhoneCall_Generic,
    GearPhoneCall_Generic2,
    GearPhoneCall_Bill,
    GearPhoneCall_Mother,
    GearPhoneCall_ProfOak,
    GearPhoneCall_DayCareLady,
    GearPhoneCall_DayCareMan,
    GearPhoneCall_Buena,
    GearPhoneCall_Buena2,
    GearPhoneCall_EthanLyra,
    GearPhoneCall_EthanLyra2,
    GearPhoneCall_Kurt,
    GearPhoneCall_GymLeader_Outgoing,
    GearPhoneCall_GymLeader_Incoming,
    GearPhoneCall_Baoba,
};

PokegearPhoneCallContext *PhoneCall_CreateContext(const PokegearPhoneCallContextParam *template) {
    PokegearPhoneCallContext *ret = AllocFromHeap(template->heapId, sizeof(PokegearPhoneCallContext));
    MI_CpuClear8(ret, sizeof(PokegearPhoneCallContext));
    ret->heapId = template->heapId;
    ret->phoneBook = AllocAndReadPhoneBook(template->heapId);
    ret->phoneEntries = ret->phoneBook->entries;
    ret->phoneApp = template->phoneApp;
    ret->menuInputStatePtr = template->menuInputStatePtr;
    ret->sprite = template->sprite;
    ret->bgConfig = template->bgConfig;
    ret->phoneCallMsgWindow = template->window1;
    ret->window2 = template->window2;
    ret->plttData = template->plttData;
    ret->saveData = template->saveData;
    ret->callPersistentState = template->callPersistentState;
    ret->playerProfile = template->playerProfile;
    ret->saveVarsFlags = template->saveVarsFlags;
    ret->rtc = template->rtc;
    ret->playerMapSec = template->playerMapSec;
    ret->playerMapID = template->playerMapID;
    ret->textSpeed = template->textSpeed;
    ret->playerGender = PlayerProfile_GetTrainerGender(ret->playerProfile);
    ret->msgData_0271 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0271_bin, ret->heapId);
    ret->msgData_0640 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0640_bin, ret->heapId);
    ret->msgFormat = MessageFormat_New_Custom(16, 37, ret->heapId);
    ret->msgExpansionBuff = String_New(1081, ret->heapId);
    ret->phoneCallMsgReadBuff = String_New(1081, ret->heapId);
    ret->contactNameBuf = String_New(16, ret->heapId);
    ret->contactClassBuf = String_New(44, ret->heapId);
    ret->buf14String = NewString_ReadMsgData(ret->msgData_0271, msg_0271_00029);
    for (int i = 0; i < 3; ++i) {
        ret->noSignalMsgs[i] = NewString_ReadMsgData(ret->msgData_0271, msg_0271_00030 + i);
        ret->hangUpMsgs[i] = NewString_ReadMsgData(ret->msgData_0271, msg_0271_00033 + i);
    }
    return ret;
}

void PhoneCall_DestroyContext(PokegearPhoneCallContext *ctx) {
    for (int i = 0; i < 3; ++i) {
        String_Delete(ctx->noSignalMsgs[i]);
        String_Delete(ctx->hangUpMsgs[i]);
    }
    String_Delete(ctx->buf14String);
    String_Delete(ctx->contactClassBuf);
    String_Delete(ctx->contactNameBuf);
    String_Delete(ctx->phoneCallMsgReadBuff);
    String_Delete(ctx->msgExpansionBuff);
    MessageFormat_Delete(ctx->msgFormat);
    DestroyMsgData(ctx->msgData_0640);
    DestroyMsgData(ctx->msgData_0271);
    FreePhoneBook(ctx->phoneBook);
    MI_CpuClear8(ctx, sizeof(PokegearPhoneCallContext));
    FreeToHeap(ctx);
}

String *PhoneContact_GetName(PokegearPhoneCallContext *ctx, u8 callerID) {
    if (callerID >= NUM_PHONE_CONTACTS) {
        callerID = PHONE_CONTACT_MOTHER;
    }
    int gmm = GetPhoneMessageGmm(callerID);
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, gmm, ctx->heapId);
    ReadMsgDataIntoString(msgData, 0, ctx->contactNameBuf);
    DestroyMsgData(msgData);
    return ctx->contactNameBuf;
}

String *PhoneContact_GetClass(PokegearPhoneCallContext *ctx, u8 callerID) {
    if (callerID >= NUM_PHONE_CONTACTS) {
        callerID = PHONE_CONTACT_MOTHER;
    }
    if (ctx->phoneEntries[callerID].trainerClass == TRAINERCLASS_PHONE_MOM) {
        String_SetEmpty(ctx->contactClassBuf);
    } else if (ctx->phoneEntries[callerID].trainerClass >= TRAINERCLASS_PHONE_POKEMON_PROFESSOR) {
        ReadMsgDataIntoString(ctx->msgData_0271, ctx->phoneEntries[callerID].trainerClass - TRAINERCLASS_PHONE_POKEMON_PROFESSOR + msg_0271_00038, ctx->contactClassBuf);
    } else {
        BufferTrainerClassName(ctx->msgFormat, 0, ctx->phoneEntries[callerID].trainerClass);
        StringExpandPlaceholders(ctx->msgFormat, ctx->contactClassBuf, ctx->buf14String);
    }
    return ctx->contactClassBuf;
}

BOOL PhoneCall_InitContext(PokegearPhoneCallContext *ctx, u8 callerId, u8 incomingCall, u8 scriptedFlag, u8 scriptID) {
    PokegearPhoneCallState *state = &ctx->state;
    MI_CpuClear8(state, sizeof(PokegearPhoneCallState));
    if (callerId >= NUM_PHONE_CONTACTS) {
        GF_ASSERT(FALSE);
        state->mainState = 0xFF;
        return FALSE;
    }
    if (incomingCall) {
        if (!MapHeader_CanReceivePhoneCalls(ctx->playerMapSec)) {
            state->mainState = 0xFF;
            return FALSE;
        }
    } else {
        if (!MapHeader_CanPlacePhoneCalls(ctx->playerMapSec)) {
            state->mainState = 0xFF;
            return FALSE;
        }
    }

    state->callerID = callerId;
    state->phoneBookEntry = &ctx->phoneEntries[callerId];
    state->isIncomingCall = incomingCall;
    state->isScriptedCall = scriptedFlag;
    state->predefinedScriptID = scriptID;
    state->mainState = state->isIncomingCall;
    GF_RTC_CopyDateTime(&state->date, &state->time);
    state->timeOfDay = GF_RTC_GetTimeOfDayWildParamByHour(state->time.hour);
    state->scriptType = 0;
    state->scriptID = 0;
    return TRUE;
}

void PhoneCall_GetCallScriptId(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;

    FillWindowPixelBuffer(ctx->phoneCallMsgWindow, 0);
    ScheduleWindowCopyToVram(ctx->phoneCallMsgWindow);

    switch (state->phoneBookEntry->type) {
    case PHONECALLTYPE_GENERIC:
        state->scriptID = PhoneCall_GetScriptId_Generic(ctx, state);
        break;
    case PHONECALLTYPE_MOM:
        state->scriptID = PhoneCall_GetScriptId_Mother(ctx, state);
        break;
    case PHONECALLTYPE_PROF_ELM:
        state->scriptID = PhoneCall_GetScriptId_ProfElm(ctx, state);
        break;
    case PHONECALLTYPE_PROF_OAK:
        state->scriptID = PhoneCall_GetScriptId_ProfOak(ctx, state);
        break;
    case PHONECALLTYPE_BIKE_SHOP:
        state->scriptID = PhoneCall_GetScriptId_BikeShop(ctx, state);
        break;
    case PHONECALLTYPE_BILL:
        state->scriptID = PhoneCall_GetScriptId_Bill(ctx, state);
        break;
    case PHONECALLTYPE_DAYCARELADY:
        state->scriptID = PhoneCall_GetScriptId_DayCareLady(ctx, state);
        break;
    case PHONECALLTYPE_DAYCAREMAN:
        state->scriptID = PhoneCall_GetScriptId_DayCareMan(ctx, state);
        break;
    case PHONECALLTYPE_BUENA:
        state->scriptID = PhoneCall_GetScriptId_Buena(ctx, state);
        break;
    case PHONECALLTYPE_ETHAN_LYRA:
        state->scriptID = PhoneCall_GetScriptId_EthanLyra(ctx, state);
        break;
    case PHONECALLTYPE_KURT:
        state->scriptID = PhoneCall_GetScriptId_Kurt(ctx, state);
        break;
    case PHONECALLTYPE_GYMLEADER:
        state->scriptID = PhoneCall_GetScriptId_GymLeader(ctx, state);
        break;
    case PHONECALLTYPE_KENJI:
        state->scriptID = PhoneCall_GetScriptId_Kenji(ctx, state);
        break;
    case PHONECALLTYPE_BAOBA:
        state->scriptID = PhoneCall_GetScriptId_Baoba(ctx, state);
        break;
    case PHONECALLTYPE_IRWIN:
        state->scriptID = PhoneCall_GetScriptId_Irwin(ctx, state);
        break;
    case PHONECALLTYPE_UNK15:
    default:
        state->scriptType = 0;
        state->scriptID = 0;
        break;
    }
    if (state->scriptType <= 2) {
        state->scriptDef = &gPhoneCallScriptDef[state->scriptID];
    }
}

void PhoneCall_InitMsgDataAndBufferNames(PokegearPhoneCallContext *ctx) {
    ctx->msgData_PhoneContact = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, GetPhoneMessageGmm(ctx->state.callerID), ctx->heapId);
    BufferPlayersName(ctx->msgFormat, 0, ctx->playerProfile);
    BufferString(ctx->msgFormat, 1, PhoneContact_GetName(ctx, ctx->state.callerID), 2, 1, 2);
    BufferLandmarkName(ctx->msgFormat, 2, MapHeader_GetMapSec(ctx->playerMapSec));
    BufferLandmarkName(ctx->msgFormat, 3, MapHeader_GetMapSec(ctx->state.phoneBookEntry->mapId));
}

void PhoneCall_AnimateFastForwardButtonOnTouch(PokegearPhoneCallContext *ctx) {
    if (TouchscreenHitbox_TouchNewIsIn(&ov101_021F8400)) {
        Sprite_SetAnimActiveFlag(ctx->sprite, TRUE);
        Sprite_ResetAnimCtrlState(ctx->sprite);
    }
}

void PhoneCallMessagePrint(PokegearPhoneCallContext *ctx, MsgData *msgData, const u8 *msgIDs) {
    ReadMsgDataIntoString(msgData, msgIDs[ctx->playerGender], ctx->phoneCallMsgReadBuff);
    StringExpandPlaceholders(ctx->msgFormat, ctx->msgExpansionBuff, ctx->phoneCallMsgReadBuff);
    FillWindowPixelBuffer(ctx->phoneCallMsgWindow, 0);
    ctx->textPrinter = AddTextPrinterParameterizedWithColor(ctx->phoneCallMsgWindow, 0, ctx->msgExpansionBuff, 0, 0, ctx->textSpeed, MAKE_TEXT_COLOR(1, 2, 0), NULL);
}

void PhoneCallMessagePrint_Gendered(PokegearPhoneCallContext *ctx, MsgData *msgData, u8 msgIDifEthan, u8 msgIDifLyra) {
    ctx->msgIDs[0] = msgIDifEthan;
    ctx->msgIDs[1] = msgIDifLyra;
    PhoneCallMessagePrint(ctx, msgData, ctx->msgIDs);
}

void PhoneCallMessagePrint_Ungendered(PokegearPhoneCallContext *ctx, MsgData *msgData, u8 msgID) {
    ctx->msgIDs[0] = msgID;
    ctx->msgIDs[1] = msgID;
    PhoneCallMessagePrint(ctx, msgData, ctx->msgIDs);
}

BOOL PhoneCall_IsMessageDonePrinting(PokegearPhoneCallContext *ctx) {
    PhoneCall_AnimateFastForwardButtonOnTouch(ctx);
    if (TextPrinterCheckActive(ctx->textPrinter)) {
        return FALSE;
    }
    ctx->state.menuInputState = TextFlags_GetIsTouchSpeedingUpPrint();
    return TRUE;
}

void PhoneCall_ApplyGenericNPCcallSideEffect(PokegearPhoneCallContext *ctx, const PhoneCallScriptDef *scriptDef) {
    PokegearPhoneCallState *state = &ctx->state;
    u16 itemId;

    switch (scriptDef->scriptType) {
    case PHONESCRIPTTYPE_REMATCH:
        PhoneCallPersistentState_PhoneRematches_SetSeeking(ctx->callPersistentState, state->callerID, TRUE);
        break;
    case PHONESCRIPTTYPE_ITEM:
        itemId = scriptDef->param1;
        if (itemId == ITEM_CHERI_BERRY) {
            itemId = (MTRandom() % 10) + ITEM_CHERI_BERRY;
        } else if (itemId == ITEM_POKE_BALL) {
            itemId = (MTRandom() % 3) + ITEM_ULTRA_BALL;
        }
        PhoneCallPersistentState_PhoneRematches_GiftItemIdSet(ctx->callPersistentState, state->callerID, itemId);
        break;
    case PHONESCRIPTTYPE_UNK1:
    case PHONESCRIPTTYPE_FLAG:
        if (scriptDef->param0) {
            Save_VarsFlags_SetFlagInArray(ctx->saveVarsFlags, scriptDef->param1);
        } else {
            Save_VarsFlags_ClearFlagInArray(ctx->saveVarsFlags, scriptDef->param1);
        }
        break;
    case PHONESCRIPTTYPE_WORD:
        ReadMsgDataIntoString(ctx->msgData_PhoneContact, scriptDef->param1 + (LCRandom() % scriptDef->param0), ctx->msgExpansionBuff);
        BufferString(ctx->msgFormat, 4, ctx->msgExpansionBuff, 2, 1, 2);
        break;
    }
}

void PhoneCall_TouchscreenListMenu_Create(PokegearPhoneCallContext *ctx, u8 menuID) {
    PokegearPhone_PrintContextMenuTooltip(ctx->phoneApp, 2, TRUE);
    ctx->touchscreenListMenu = PokegearPhoneApp_TouchscreenListMenu_Create(ctx->phoneApp, 0, menuID);
    Sprite_SetDrawFlag(ctx->sprite, FALSE);
    ov101_021F2384(ctx, 1);
}

int PhoneCall_TouchscreenListMenu_HandleInput(PokegearPhoneCallContext *ctx) {
    return TouchscreenListMenu_HandleInput(ctx->touchscreenListMenu);
}

void PhoneCall_TouchscreenListMenu_Destroy(PokegearPhoneCallContext *ctx) {
    *ctx->menuInputStatePtr = (MenuInputState)TouchscreenListMenu_WasLastInputTouch(ctx->touchscreenListMenu);
    TouchscreenListMenu_Destroy(ctx->touchscreenListMenu);
    PokegearPhone_PrintContextMenuTooltip(ctx->phoneApp, 0, FALSE);
    Sprite_SetDrawFlag(ctx->sprite, TRUE);
    ov101_021F2384(ctx, 0);
}

const PhoneCallScriptDef *PhoneCall_GetScriptDefPtrByID(int scriptID) {
    return &gPhoneCallScriptDef[scriptID];
}

void ov101_021F2384(PokegearPhoneCallContext *ctx, BOOL undim) {
    if (undim) {
        PaletteData_BlendPalette(ctx->plttData, PLTTBUF_MAIN_BG, 0x10, 0x10, 0, RGB_BLACK);
        PaletteData_BlendPalette(ctx->plttData, PLTTBUF_MAIN_BG, 0xA0, 0x10, 0, RGB_BLACK);
    } else {
        PaletteData_BlendPalette(ctx->plttData, PLTTBUF_MAIN_BG, 0x10, 0x10, 8, RGB_BLACK);
        PaletteData_BlendPalette(ctx->plttData, PLTTBUF_MAIN_BG, 0xA0, 0x10, 8, RGB_BLACK);
    }
    PaletteData_SetAutoTransparent(ctx->plttData, TRUE);
    PaletteData_PushTransparentBuffers(ctx->plttData);
    PaletteData_SetAutoTransparent(ctx->plttData, FALSE);
}

BOOL PhoneCall_WaitButtonBeforeHangup(PokegearPhoneCallContext *ctx) {
    PhoneCall_AnimateFastForwardButtonOnTouch(ctx);
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) {
        PlaySE(SEQ_SE_DP_SELECT);
        ctx->state.menuInputState = MENU_INPUT_STATE_BUTTONS;
        return TRUE;
    }

    if (TouchscreenHitbox_TouchNewIsIn(&ov101_021F8400)) {
        PlaySE(SEQ_SE_DP_SELECT);
        ctx->state.menuInputState = MENU_INPUT_STATE_TOUCH;
        return TRUE;
    }

    return FALSE;
}

void PhoneCall_NoSignalMessage(PokegearPhoneCallContext *ctx, u8 kind, u8 stage) {
    if (stage == 0) {
        FillWindowPixelBuffer(ctx->phoneCallMsgWindow, 0);
    }
    if (kind == 0) {
        AddTextPrinterParameterizedWithColor(ctx->phoneCallMsgWindow, 0, ctx->noSignalMsgs[stage], 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    } else {
        AddTextPrinterParameterizedWithColor(ctx->phoneCallMsgWindow, 0, ctx->hangUpMsgs[stage], 0, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    }
}

BOOL PhoneCall_InitialRing(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    PhoneCall_AnimateFastForwardButtonOnTouch(ctx);
    switch (state->hangupToneState) {
    case 0:
        PlaySE(SEQ_SE_GS_PHONE0);
        PhoneCall_NoSignalMessage(ctx, 0, state->hangupToneState);
        break;
    case 1:
        if (IsSEPlaying(SEQ_SE_GS_PHONE0)) {
            return FALSE;
        }
        PlaySE(SEQ_SE_GS_PHONE0);
        PhoneCall_NoSignalMessage(ctx, 0, state->hangupToneState);
        break;
    case 2:
        if (IsSEPlaying(SEQ_SE_GS_PHONE0)) {
            return FALSE;
        }
        state->hangupToneState = 0;
        return TRUE;
    }

    ++state->hangupToneState;
    return FALSE;
}

BOOL PhoneCall_HangupTone(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    PhoneCall_AnimateFastForwardButtonOnTouch(ctx);
    switch (state->hangupToneState) {
    case 0:
        PlaySE(SEQ_SE_GS_PHONE_OFF);
        PhoneCall_NoSignalMessage(ctx, 1, state->hangupToneState);
        state->hangupToneTimer = 0;
        break;
    case 1:
    case 2:
        if (state->hangupToneTimer++ < 10) {
            return FALSE;
        }
        state->hangupToneTimer = 0;
        PhoneCall_NoSignalMessage(ctx, 1, state->hangupToneState);
        break;
    case 3:
        if (state->hangupToneTimer++ < 10) {
            return FALSE;
        }
        state->hangupToneTimer = 0;
        state->hangupToneState = 0;
        return TRUE;
    }

    ++state->hangupToneState;
    return FALSE;
}

BOOL PhoneCall_HangupNoTone(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    PhoneCall_AnimateFastForwardButtonOnTouch(ctx);
    switch (state->hangupToneState) {
    case 0:
        PhoneCall_NoSignalMessage(ctx, 0, state->hangupToneState);
        state->hangupToneTimer = 0;
        break;
    case 1:
    case 2:
        if (state->hangupToneTimer++ < 10) {
            return FALSE;
        }
        state->hangupToneTimer = 0;
        PhoneCall_NoSignalMessage(ctx, 0, state->hangupToneState);
        break;
    case 3:
        if (state->hangupToneTimer++ < 10) {
            return FALSE;
        }
        state->hangupToneTimer = 0;
        state->hangupToneState = 0;
        return TRUE;
    }

    ++state->hangupToneState;
    return FALSE;
}

BOOL PhoneCall_PrintGreeting(PokegearPhoneCallContext *ctx) {
    u16 idx;
    PokegearPhoneCallState *state = &ctx->state;

    PhoneCall_AnimateFastForwardButtonOnTouch(ctx);
    switch (state->hangupToneState) {
    case 0:
        idx = state->timeOfDay * 2 + state->isIncomingCall * 6;
        PhoneCallMessagePrint_Gendered(ctx, ctx->msgData_0640, sGreetingMsgIDs[state->phoneBookEntry->unkC][idx], sGreetingMsgIDs[state->phoneBookEntry->unkC][idx + 1]);
        break;
    case 1:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        state->hangupToneState = 0;
        return TRUE;
    }

    ++state->hangupToneState;
    return FALSE;
}

BOOL GearPhoneCall_Simple(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;
    const PhoneCallScriptDef *scriptDef = state->scriptDef;

    switch (state->scriptState) {
    case 0:
        PhoneCall_InitMsgDataAndBufferNames(ctx);
        PhoneCall_ApplyGenericNPCcallSideEffect(ctx, scriptDef);
        if (state->phoneBookEntry->unkC == 0xFF) {
            ++state->scriptState;
        }
        break;
    case 1:
        if (!PhoneCall_PrintGreeting(ctx)) {
            return FALSE;
        }
        break;
    case 2:
        PhoneCallMessagePrint(ctx, ctx->msgData_PhoneContact, scriptDef->msgIds);
        break;
    case 3:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        DestroyMsgData(ctx->msgData_PhoneContact);
        return TRUE;
    }

    ++state->scriptState;
    return FALSE;
}

BOOL PhoneCall_Main(PokegearPhoneCallContext *ctx) {
    PokegearPhoneCallState *state = &ctx->state;

    switch (state->mainState) {
    case 0:
        if (!PhoneCall_InitialRing(ctx)) {
            return FALSE;
        }
        break;
    case 1:
        if (!sPhoneCallHandlers[state->scriptType](ctx)) {
            return FALSE;
        }
        *ctx->menuInputStatePtr = (MenuInputState)state->menuInputState;
        break;
    case 2:
        if (!PhoneCall_WaitButtonBeforeHangup(ctx)) {
            return FALSE;
        }
        break;
    case 3:
        if (!PhoneCall_HangupTone(ctx)) {
            return FALSE;
        }
        state->mainState = 0;
        return TRUE;
    case 255:
        if (!PhoneCall_HangupNoTone(ctx)) {
            return FALSE;
        }
        break;
    case 256: // OUT OF AREA
        if (!PhoneCall_HangupTone(ctx)) {
            return FALSE;
        }
        PhoneCallMessagePrint_Ungendered(ctx, ctx->msgData_0271, msg_0271_00037);
        break;
    case 257:
        if (!PhoneCall_IsMessageDonePrinting(ctx)) {
            return FALSE;
        }
        break;
    case 258:
        if (!PhoneCall_WaitButtonBeforeHangup(ctx)) {
            return FALSE;
        }
        state->mainState = 0;
        return TRUE;
    }

    ++state->mainState;
    return FALSE;
}
