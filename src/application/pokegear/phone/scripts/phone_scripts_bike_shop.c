#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

u16 PhoneCall_GetScriptId_BikeShop(PokegearPhoneCallContext *ctx, PokegearPhoneCallState *state) {
    state->scriptType = 0;
    if (state->phoneBookEntry->mapId == ctx->playerMapSec) {
        return PHONE_SCRIPT_084;
    } else {
        return PHONE_SCRIPT_085;
    }
}
