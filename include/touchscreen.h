#ifndef POKEHEARTGOLD_TOUCHSCREEN_H
#define POKEHEARTGOLD_TOUCHSCREEN_H

#include <nitro.h>

typedef union TouchscreenHitbox {
    struct {
        u8 top;    // min: 0
        u8 bottom; // max: 192
        u8 left;   // min: 0
        u8 right;  // max: 256 (encode as 0)
    } rect;
    struct {
        u8 sentinel; // 0xFE
        u8 x;
        u8 y;
        u8 r;
    } circle;
} TouchscreenHitbox;

#define TOUCHSCREEN_CIRCLE_SENTINEL 0xFE
#define TOUCHSCREEN_RECTLIST_END    0xFF

#define TOUCH_MENU_NO_INPUT -1

int TouchscreenHitbox_FindRectAtTouchHeld(const TouchscreenHitbox *hitboxes);
int TouchscreenHitbox_FindHitboxAtTouchNew(const TouchscreenHitbox *hitboxes);
int TouchscreenHitbox_FindRectAtTouchNew(const TouchscreenHitbox *hitboxes);
int TouchscreenHitbox_FindHitboxAtTouchHeld(const TouchscreenHitbox *hitboxes);
int TouchscreenHitbox_FindHitboxAtTouchNew(const TouchscreenHitbox *hitboxes);
BOOL TouchscreenHitbox_TouchHeldIsIn(const TouchscreenHitbox *hitbox);
BOOL TouchscreenHitbox_TouchNewIsIn(const TouchscreenHitbox *hitbox);
BOOL System_GetTouchHeld(void);
BOOL System_GetTouchNew(void);
BOOL System_GetTouchHeldCoords(u32 *x, u32 *y);
BOOL System_GetTouchNewCoords(u32 *x, u32 *y);
int TouchscreenHitbox_FindHitboxAtPoint(const TouchscreenHitbox *hitbox, u32 x, u32 y);
BOOL TouchscreenHitbox_PointIsIn(const TouchscreenHitbox *hitbox, u32 x, u32 y);

static inline void TouchscreenHitbox_SetRect(TouchscreenHitbox *hitbox, int top, int left, int height, int width) {
    hitbox->rect.top = top;
    hitbox->rect.left = left;
    hitbox->rect.bottom = hitbox->rect.top + height;
    hitbox->rect.right = hitbox->rect.left + width;
}

static inline void TouchscreenHitbox_SetCircle(TouchscreenHitbox *hitbox, int x, int y, int r) {
    hitbox->circle.sentinel = TOUCHSCREEN_CIRCLE_SENTINEL;
    hitbox->circle.x = x;
    hitbox->circle.y = y;
    hitbox->circle.r = r;
}

#endif // POKEHEARTGOLD_TOUCHSCREEN_H
