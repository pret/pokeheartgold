#include "global.h"
#include "touchscreen.h"
#include "system.h"

int sub_02025154(const TouchscreenHitbox *hitbox, u32 x, u32 y);
BOOL sub_020251A0(const TouchscreenHitbox *hitbox, u32 x, u32 y);
BOOL sub_020251CC(const TouchscreenHitbox *hitbox, u32 x, u32 y);

int sub_02025154(const TouchscreenHitbox *hitboxes, u32 x, u32 y) {
    // In this function and sub_020251CC, GameFreak uses the bitwise-and operator (&) instead of the binary-and operator (&&).
    // Other bad code decisions effectively mask this particular choice, albeit with a performance impact.
    for (int i = 0; hitboxes[i].rect.top != TOUCHSCREEN_RECTLIST_END; ++i) {
        if ((x - hitboxes[i].rect.left < hitboxes[i].rect.right - hitboxes[i].rect.left) & (y - hitboxes[i].rect.top < hitboxes[i].rect.bottom - hitboxes[i].rect.top)) {
            return i;
        }
    }

    return -1;
}

BOOL sub_020251A0(const TouchscreenHitbox *hitbox, u32 x, u32 y) {
    x = (hitbox->circle.x - x) * (hitbox->circle.x - x);
    y = (hitbox->circle.y - y) * (hitbox->circle.y - y);
    return x + y < (hitbox->circle.r * hitbox->circle.r);
}

BOOL sub_020251CC(const TouchscreenHitbox *hitbox, u32 x, u32 y) {
    return ((x - hitbox->rect.left < hitbox->rect.right - hitbox->rect.left) & (y - hitbox->rect.top < hitbox->rect.bottom - hitbox->rect.top))
        ? TRUE : FALSE;
}

int sub_02025204(const TouchscreenHitbox *hitboxes) {
    if (gSystem.touchHeld) {
        return sub_02025154(hitboxes, gSystem.touchX, gSystem.touchY);
    }

    return -1;
}

int sub_02025224(const TouchscreenHitbox *hitboxes) {
    if (gSystem.touchNew) {
        return sub_02025154(hitboxes, gSystem.touchX, gSystem.touchY);
    }

    return -1;
}

int sub_02025244(const TouchscreenHitbox *hitboxes) {
    if (gSystem.touchHeld) {
        for (int i = 0; hitboxes[i].circle.sentinel != TOUCHSCREEN_RECTLIST_END; ++i) {
            if (hitboxes[i].circle.sentinel == TOUCHSCREEN_CIRCLE_SENTINEL) {
                if (sub_020251A0(&hitboxes[i], gSystem.touchX, gSystem.touchY)) {
                    return i;
                }
            } else {
                if (sub_020251CC(&hitboxes[i], gSystem.touchX, gSystem.touchY)) {
                    return i;
                }
            }
        }
    }

    return -1;
}

int sub_0202529C(const TouchscreenHitbox *hitboxes) {
    if (gSystem.touchNew) {
        for (int i = 0; hitboxes[i].circle.sentinel != TOUCHSCREEN_RECTLIST_END; ++i) {
            if (hitboxes[i].circle.sentinel == TOUCHSCREEN_CIRCLE_SENTINEL) {
                if (sub_020251A0(&hitboxes[i], gSystem.touchX, gSystem.touchY)) {
                    return i;
                }
            } else {
                if (sub_020251CC(&hitboxes[i], gSystem.touchX, gSystem.touchY)) {
                    return i;
                }
            }
        }
    }

    return -1;
}

BOOL sub_020252F4(const TouchscreenHitbox *hitbox) {
    if (gSystem.touchHeld) {
        if (hitbox->circle.sentinel == TOUCHSCREEN_CIRCLE_SENTINEL) {
            return sub_020251A0(hitbox, gSystem.touchX, gSystem.touchY);
        } else {
            return sub_020251CC(hitbox, gSystem.touchX, gSystem.touchY);
        }
    }

    return FALSE;
}

BOOL sub_02025320(const TouchscreenHitbox *hitbox) {
    if (gSystem.touchNew) {
        if (hitbox->circle.sentinel == TOUCHSCREEN_CIRCLE_SENTINEL) {
            return sub_020251A0(hitbox, gSystem.touchX, gSystem.touchY);
        } else {
            return sub_020251CC(hitbox, gSystem.touchX, gSystem.touchY);
        }
    }

    return FALSE;
}

BOOL System_GetTouchHeld(void) {
    return gSystem.touchHeld;
}

BOOL System_GetTouchNew(void) {
    return gSystem.touchNew;
}

BOOL sub_02025364(u32 *x, u32 *y) {
    if (gSystem.touchHeld) {
        *x = gSystem.touchX;
        *y = gSystem.touchY;
        return TRUE;
    }

    return FALSE;
}

BOOL sub_02025380(u32 *x, u32 *y) {
    if (gSystem.touchNew) {
        *x = gSystem.touchX;
        *y = gSystem.touchY;
        return TRUE;
    }

    return FALSE;
}

int sub_0202539C(const TouchscreenHitbox *hitboxes, u32 x, u32 y) {
    for (int i = 0; hitboxes[i].circle.sentinel != TOUCHSCREEN_RECTLIST_END; ++i) {
        if (hitboxes[i].circle.sentinel == TOUCHSCREEN_CIRCLE_SENTINEL) {
            if (sub_020251A0(&hitboxes[i], x, y)) {
                return i;
            }
        } else {
            if (sub_020251CC(&hitboxes[i], x, y)) {
                return i;
            }
        }
    }

    return -1;
}

BOOL sub_020253F0(const TouchscreenHitbox *hitbox, u32 x, u32 y) {
    if (hitbox->circle.sentinel == TOUCHSCREEN_CIRCLE_SENTINEL) {
        return sub_020251A0(hitbox, x, y);
    } else {
        return sub_020251CC(hitbox, x, y);
    }
}
