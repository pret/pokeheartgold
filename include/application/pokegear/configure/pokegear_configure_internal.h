#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H

#include "application/pokegear/pokegear_internal.h"

#include "touchscreen_list_menu.h"

enum PokegearConfigureMainState {
    PGCONF_MAIN_STATE_LOAD,
    PGCONF_MAIN_STATE_HANDLE_INPUT,
    PGCONF_MAIN_STATE_UNLOAD,
    PGCONF_MAIN_STATE_CONTEXT_MENU,
    PGCONF_MAIN_STATE_SWAP_SKINS,
    PGCONF_MAIN_STATE_FADE_IN,
    PGCONF_MAIN_STATE_FADE_OUT,
    PGCONF_MAIN_STATE_FADE_IN_APP,
    PGCONF_MAIN_STATE_FADE_OUT_APP,
    PGCONF_MAIN_STATE_QUIT,
};

typedef struct PokegearConfigureAppData {
    enum HeapID heapId;                             // 0x00
    int state;                                      // 0x04
    int substate;                                   // 0x08
    PokegearAppData *pokegear;                      // 0x0C
    u8 unk_10;                                      // 0x10 unused
    u8 selectedSkin;                                // 0x11
    u16 unlockedSkins : 9;                          // 0x12
    u16 skin : 7;                                   // 0x12
    Sprite *sprites[9];                             // 0x14
    TouchscreenListMenuSpawner *contextMenuSpawner; // 0x38
    LISTMENUITEM *contextMenuItems;                 // 0x3C
    TouchscreenListMenu *contextMenu;               // 0x40
    void *scrnDataRaw;                              // 0x44
    NNSG2dScreenData *scrnData;                     // 0x48
} PokegearConfigureAppData;                         // size: 0x4C

BOOL PokegearConfigure_LoadGFX(PokegearConfigureAppData *configureApp);
BOOL PokegearConfigure_UnloadGFX(PokegearConfigureAppData *configureApp);
int PokegearConfigure_ContextMenu(PokegearConfigureAppData *configureApp);
BOOL PokegearConfigure_SwapSkins(PokegearConfigureAppData *configureApp);

void PokegearConfigure_LoadGraphics_Internal(PokegearConfigureAppData *configureApp);
void PokegearConfigure_UnloadGraphics_Internal(PokegearConfigureAppData *configureApp);
void PokegearConfigure_LoadPalettes(PokegearConfigureAppData *configureApp, BOOL isInit);
void PokegearConfigure_SetNewSkin(PokegearConfigureAppData *configureApp, int skin);
void PokegearConfigure_DrawUnlockedSkinsButtons(PokegearConfigureAppData *configureApp);

void PokegearConfigure_OnReselectApp(void *appData);
void PokegearConfigure_SetAppCursorActive(PokegearConfigureAppData *configureApp);
void PokegearConfigure_SpawnContextMenu(PokegearConfigureAppData *configureApp, u8 a1);
void PokegearConfigure_ToggleButtonFocusState(PokegearConfigureAppData *configureApp, int skin, int selected);

int PokegearConfigure_HandleKeyInput(PokegearConfigureAppData *configureApp);
int PokegearConfigure_HandleTouchInput(PokegearConfigureAppData *configureApp);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H
