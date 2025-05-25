#include "touchscreen.h"

#include "global.h"

#include "system.h"

static int TouchscreenHitbox_FindRectAtPoint(const TouchscreenHitbox *hitbox, u32 x, u32 y);
static BOOL TouchscreenHitbox_PointIsInCircle(const TouchscreenHitbox *hitbox, u32 x, u32 y);
static BOOL TouchscreenHitbox_PointIsInRect(const TouchscreenHitbox *hitbox, u32 x, u32 y);

static int TouchscreenHitbox_FindRectAtPoint(const TouchscreenHitbox *hitboxes, u32 x, u32 y) {
    // In this function and TouchscreenHitbox_PointIsInRect, GameFreak uses the bitwise-and operator (&) instead of the binary-and operator (&&).
    // Other bad code decisions effectively mask this particular choice, albeit with a performance impact.
    for (int i = 0; hitboxes[i].rect.top != TOUCHSCREEN_RECTLIST_END; ++i) {
        if ((x - hitboxes[i].rect.left < hitboxes[i].rect.right - hitboxes[i].rect.left) & (y - hitboxes[i].rect.top < hitboxes[i].rect.bottom - hitboxes[i].rect.top)) {
            return i;
        }
    }

    return TOUCH_MENU_NO_INPUT;
}

static BOOL TouchscreenHitbox_PointIsInCircle(const TouchscreenHitbox *hitbox, u32 x, u32 y) {
    x = (hitbox->circle.x - x) * (hitbox->circle.x - x);
    y = (hitbox->circle.y - y) * (hitbox->circle.y - y);
    return x + y < (hitbox->circle.r * hitbox->circle.r);
}

static BOOL TouchscreenHitbox_PointIsInRect(const TouchscreenHitbox *hitbox, u32 x, u32 y) {
    return ((x - hitbox->rect.left < hitbox->rect.right - hitbox->rect.left) & (y - hitbox->rect.top < hitbox->rect.bottom - hitbox->rect.top)) ? TRUE : FALSE;
}

int TouchscreenHitbox_FindRectAtTouchHeld(const TouchscreenHitbox *hitboxes) {
    if (gSystem.touchHeld) {
        return TouchscreenHitbox_FindRectAtPoint(hitboxes, gSystem.touchX, gSystem.touchY);
    }

    return TOUCH_MENU_NO_INPUT;
}

int TouchscreenHitbox_FindRectAtTouchNew(const TouchscreenHitbox *hitboxes) {
    if (gSystem.touchNew) {
        return TouchscreenHitbox_FindRectAtPoint(hitboxes, gSystem.touchX, gSystem.touchY);
    }

    return TOUCH_MENU_NO_INPUT;
}

int TouchscreenHitbox_FindHitboxAtTouchHeld(const TouchscreenHitbox *hitboxes) {
    if (gSystem.touchHeld) {
        for (int i = 0; hitboxes[i].circle.sentinel != TOUCHSCREEN_RECTLIST_END; ++i) {
            if (hitboxes[i].circle.sentinel == TOUCHSCREEN_CIRCLE_SENTINEL) {
                if (TouchscreenHitbox_PointIsInCircle(&hitboxes[i], gSystem.touchX, gSystem.touchY)) {
                    return i;
                }
            } else {
                if (TouchscreenHitbox_PointIsInRect(&hitboxes[i], gSystem.touchX, gSystem.touchY)) {
                    return i;
                }
            }
        }
    }

    return TOUCH_MENU_NO_INPUT;
}

int TouchscreenHitbox_FindHitboxAtTouchNew(const TouchscreenHitbox *hitboxes) {
    if (gSystem.touchNew) {
        for (int i = 0; hitboxes[i].circle.sentinel != TOUCHSCREEN_RECTLIST_END; ++i) {
            if (hitboxes[i].circle.sentinel == TOUCHSCREEN_CIRCLE_SENTINEL) {
                if (TouchscreenHitbox_PointIsInCircle(&hitboxes[i], gSystem.touchX, gSystem.touchY)) {
                    return i;
                }
            } else {
                if (TouchscreenHitbox_PointIsInRect(&hitboxes[i], gSystem.touchX, gSystem.touchY)) {
                    return i;
                }
            }
        }
    }

    return TOUCH_MENU_NO_INPUT;
}

BOOL TouchscreenHitbox_TouchHeldIsIn(const TouchscreenHitbox *hitbox) {
    if (gSystem.touchHeld) {
        if (hitbox->circle.sentinel == TOUCHSCREEN_CIRCLE_SENTINEL) {
            return TouchscreenHitbox_PointIsInCircle(hitbox, gSystem.touchX, gSystem.touchY);
        } else {
            return TouchscreenHitbox_PointIsInRect(hitbox, gSystem.touchX, gSystem.touchY);
        }
    }

    return FALSE;
}

BOOL TouchscreenHitbox_TouchNewIsIn(const TouchscreenHitbox *hitbox) {
    if (gSystem.touchNew) {
        if (hitbox->circle.sentinel == TOUCHSCREEN_CIRCLE_SENTINEL) {
            return TouchscreenHitbox_PointIsInCircle(hitbox, gSystem.touchX, gSystem.touchY);
        } else {
            return TouchscreenHitbox_PointIsInRect(hitbox, gSystem.touchX, gSystem.touchY);
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

BOOL System_GetTouchHeldCoords(u32 *x, u32 *y) {
    if (gSystem.touchHeld) {
        *x = gSystem.touchX;
        *y = gSystem.touchY;
        return TRUE;
    }

    return FALSE;
}

BOOL System_GetTouchNewCoords(u32 *x, u32 *y) {
    if (gSystem.touchNew) {
        *x = gSystem.touchX;
        *y = gSystem.touchY;
        return TRUE;
    }

    return FALSE;
}

int TouchscreenHitbox_FindHitboxAtPoint(const TouchscreenHitbox *hitboxes, u32 x, u32 y) {
    for (int i = 0; hitboxes[i].circle.sentinel != TOUCHSCREEN_RECTLIST_END; ++i) {
        if (hitboxes[i].circle.sentinel == TOUCHSCREEN_CIRCLE_SENTINEL) {
            if (TouchscreenHitbox_PointIsInCircle(&hitboxes[i], x, y)) {
                return i;
            }
        } else {
            if (TouchscreenHitbox_PointIsInRect(&hitboxes[i], x, y)) {
                return i;
            }
        }
    }

    return -1;
}

BOOL TouchscreenHitbox_PointIsIn(const TouchscreenHitbox *hitbox, u32 x, u32 y) {
    if (hitbox->circle.sentinel == TOUCHSCREEN_CIRCLE_SENTINEL) {
        return TouchscreenHitbox_PointIsInCircle(hitbox, x, y);
    } else {
        return TouchscreenHitbox_PointIsInRect(hitbox, x, y);
    }
}
