#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

u16 PhoneCall_GetScriptId_Kenji(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    u8 active;
    u8 timeOfDay;
    state->scriptType = 0;
    if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
        return PHONE_SCRIPT_086;
    }
    state->sharedU8var = PhoneCallPersistentState_BlackBeltKenji_GetWaitDays(ctx->callPersistentState);
    if (state->sharedU8var > 1) {
        return PHONE_SCRIPT_087;
    } else if (state->sharedU8var == 1) {
        return PHONE_SCRIPT_088;
    }
    active = PhoneCallPersistentState_BlackBeltKenji_GetActiveFlag(ctx->callPersistentState);
    if (active && !PhoneCallPersistentState_PhoneRematches_IsSeeking(ctx->callPersistentState, 16)) {
        return PHONE_SCRIPT_087;
    }
    timeOfDay = GF_RTC_GetTimeOfDayByHour(state->time.hour);
    if (timeOfDay == RTC_TIMEOFDAY_EVE || timeOfDay == RTC_TIMEOFDAY_NITE) {
        return PHONE_SCRIPT_091;
    }
    if (!active) {
        PhoneCallPersistentState_BlackBeltKenji_SetActiveFlag(ctx->callPersistentState, TRUE);
        PhoneCallPersistentState_PhoneRematches_SetSeeking(ctx->callPersistentState, 16, TRUE);
    }
    if (state->timeOfDay == TIMEOFDAY_WILD_DAY) {
        return PHONE_SCRIPT_090;
    } else {
        return PHONE_SCRIPT_089;
    }
}
