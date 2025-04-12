#include "global.h"

#include "application/pokegear/phone.h"

#include "system.h"
#include "touch_hitbox_controller.h"

extern const TouchscreenHitbox ov100_021E74C4[5];

BOOL ov100_021E5900(PokegearPhoneApp *phoneApp) {
    phoneApp->unk_010 = phoneApp->unk_00C;
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B | PAD_KEY_RIGHT | PAD_KEY_LEFT | PAD_KEY_UP | PAD_KEY_DOWN | PAD_BUTTON_X | PAD_BUTTON_Y)) {
        phoneApp->unk_00C = MENU_INPUT_STATE_BUTTONS;
        return TRUE;
    } else {
        return FALSE;
    }
}
