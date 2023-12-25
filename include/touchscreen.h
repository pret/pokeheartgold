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

#define TOUCHSCREEN_CIRCLE_SENTINEL   0xFE
#define TOUCHSCREEN_RECTLIST_END      0xFF

int sub_02025204(const TouchscreenHitbox *hitboxes);
int sub_0202529C(const TouchscreenHitbox *hitboxes);
int sub_02025224(const TouchscreenHitbox *hitboxes);
int sub_02025244(const TouchscreenHitbox *hitboxes);
int sub_0202529C(const TouchscreenHitbox *hitboxes);
BOOL sub_020252F4(const TouchscreenHitbox *hitbox);
BOOL sub_02025320(const TouchscreenHitbox *hitbox);
BOOL System_GetTouchHeld(void);
BOOL System_GetTouchNew(void);
BOOL sub_02025364(u32 *x, u32 *y);
BOOL sub_02025380(u32 *x, u32 *y);
int sub_0202539C(const TouchscreenHitbox *hitbox, u32 x, u32 y);
BOOL sub_020253F0(const TouchscreenHitbox *hitbox, u32 x, u32 y);

#endif //POKEHEARTGOLD_TOUCHSCREEN_H
