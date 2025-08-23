#ifndef GUARD_POKEHEARTGOLD_TOUCHSCREEN_LIST_MENU_H
#define GUARD_POKEHEARTGOLD_TOUCHSCREEN_LIST_MENU_H

#include "bg_window.h"
#include "heap.h"
#include "list_menu_items.h"
#include "palette.h"
#include "touchscreen.h"

typedef struct TouchscreenListMenuTemplate {
    u8 wrapAround : 1;
    u8 centered : 7;
    u8 xOffset;
    u8 bgId;
    u8 plttOffset;
    u8 unk4;
    u8 unk5;
    u16 baseTile;
    u16 charOffset;
    u16 unkA;
} TouchscreenListMenuTemplate;

typedef struct TouchscreenListMenuHeader {
    TouchscreenListMenuTemplate template;
    LISTMENUITEM *listMenuItems;
    BgConfig *bgConfig;
    u8 numWindows;
    u8 unk15[0x3];
} TouchscreenListMenuHeader;

typedef struct TouchscreenListMenuSpawner {
    HeapID heapId;
    NNSG2dCharacterData *pCharData;
    NNSG2dPaletteData *pPlttData;
    void *charDataRaw;
    void *plttDataRaw;
    PaletteData *paletteData;
} TouchscreenListMenuSpawner;

typedef struct TouchscreenListMenu TouchscreenListMenu;

typedef void (*TouchscreenListMenuCallback)(TouchscreenListMenu *menu, u8 cursorPos, void *callbackArg, int event);

struct TouchscreenListMenu {
    TouchscreenListMenuSpawner *spawner;
    TouchscreenListMenuHeader header;
    Window *windows;
    TouchscreenHitbox *touchscreenHitboxes;
    u8 cursorPos;
    u8 animActive;
    u8 width;
    u8 silent : 1;
    u8 isTouch : 7;
    u8 x;
    u8 y;
    u8 selection;
    u8 animTimer;
    HeapID heapId;
    TouchscreenListMenuCallback callback;
    void *callbackArg;
};

TouchscreenListMenuSpawner *TouchscreenListMenuSpawner_Create(HeapID heapId, PaletteData *paletteData);
void TouchscreenListMenuSpawner_Destroy(TouchscreenListMenuSpawner *spawner);
TouchscreenListMenu *TouchscreenListMenu_Create(TouchscreenListMenuSpawner *spawner, TouchscreenListMenuHeader *header, u8 isTouch, u8 x, u8 y, u8 width, u8 selection);
TouchscreenListMenu *TouchscreenListMenu_CreateWithAlignment(TouchscreenListMenuSpawner *spawner, TouchscreenListMenuHeader *header, u8 isTouch, u8 x, u8 y, u8 width, u8 selection, int alignment);
TouchscreenListMenu *TouchscreenListMenu_CreateWithCallback(TouchscreenListMenuSpawner *spawner, TouchscreenListMenuHeader *header, u8 isTouch, u8 x, u8 y, u8 width, u8 selection, TouchscreenListMenuCallback callback, void *callbackArg, BOOL silent);
u8 TouchscreenListMenu_WasLastInputTouch(TouchscreenListMenu *menu);
void TouchscreenListMenu_Destroy(TouchscreenListMenu *menu);
void TouchscreenListMenu_DestroyButtons(TouchscreenListMenu *menu);
int TouchscreenListMenu_HandleInput(TouchscreenListMenu *menu);

#endif // GUARD_POKEHEARTGOLD_TOUCHSCREEN_LIST_MENU_H
