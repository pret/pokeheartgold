#ifndef GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H
#define GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H

#include "application/pokegear/pokegear_internal.h"

#include "touchscreen_list_menu.h"

typedef struct PokegearConfigureAppData {
    HeapID heapId;                      // 0x00
    int state;                          // 0x04
    int substate;                       // 0x08
    PokegearAppData *pokegear;          // 0x0C
    u8 unk_10;                          // 0x10
    u8 unk_11;                          // 0x11
    u16 unk_12_00 : 9;                  // 0x12
    u16 backgroundStyle : 7;            // 0x12
    Sprite *unk_14[9];                  // 0x14
    TouchscreenListMenuSpawner *unk_38; // 0x38
    LISTMENUITEM *unk_3C;               // 0x3C
    TouchscreenListMenu *unk_40;        // 0x40
    void *unk_44;                       // 0x44
    NNSG2dScreenData *unk_48;           // 0x48
} PokegearConfigureAppData;             // size: 0x4C

BOOL ov101_021EED44(PokegearConfigureAppData *configureApp);
BOOL ov101_021EED98(PokegearConfigureAppData *configureApp);
int ov101_021EEDC4(PokegearConfigureAppData *configureApp);
BOOL ov101_021EEE80(PokegearConfigureAppData *configureApp);

void ov101_021EF1D8(PokegearConfigureAppData *configureApp);
void ov101_021EF260(PokegearConfigureAppData *configureApp);
void ov101_021EF26C(PokegearConfigureAppData *configureApp, int a1);
void ov101_021EF384(PokegearConfigureAppData *configureApp, int backgroundStyle);
void ov101_021EF414(PokegearConfigureAppData *configureApp);

void ov101_021EF4B0(void *appData);
void ov101_021EF5A4(PokegearConfigureAppData *configureApp, int a1, int a2);
int ov101_021EF6E4(PokegearConfigureAppData *configureApp);
int ov101_021EF7D4(PokegearConfigureAppData *configureApp);

#endif // GUARD_POKEHEARTGOLD_APPLICATION_POKEGEAR_CONFIGURE_POKEGEAR_CONFIGURE_INTERNAL_H
