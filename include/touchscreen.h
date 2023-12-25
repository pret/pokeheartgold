#ifndef POKEHEARTGOLD_TOUCHSCREEN_H
#define POKEHEARTGOLD_TOUCHSCREEN_H

typedef union TouchscreenHitbox {
    struct {
        u8 top;
        u8 bottom;
        u8 left;
        u8 right;
    } rect;
    struct {
        u8 sentinel;  // 0xFE
        u8 x;
        u8 y;
        u8 r;
    } circle;
} TouchscreenHitbox;

#define TOUCHSCREEN_CIRCLE_SENTINEL 0xFE
#define TOUCHSCREEN_RECTLIST_END    0xFF

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

#endif // POKEHEARTGOLD_TOUCHSCREEN_H
