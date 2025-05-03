#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

u16 PhoneCall_GetScriptId_BikeShop(PokegearPhoneApp_Sub0C4 *a0, PokegearPhoneApp_Sub0C4_Sub88 *a1) {
    a1->scriptType = 0;
    if (a1->phoneBookEntry->mapId == a0->playerMapSec) {
        return PHONE_SCRIPT_084;
    } else {
        return PHONE_SCRIPT_085;
    }
}
