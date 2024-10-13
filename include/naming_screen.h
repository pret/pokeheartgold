#ifndef POKEHEARTGOLD_NAMING_SCREEN_H
#define POKEHEARTGOLD_NAMING_SCREEN_H

#include "launch_application.h"
#include "options.h"
#include "overlay_manager.h"
#include "pm_string.h"

extern const OVY_MGR_TEMPLATE gOverlayTemplate_NamingScreen;

typedef struct NamingScreenArgs {
    NameScreenType kind;
    int playerGender; // monSpecies
    int monForm;
    int maxLen;
    int monGender;
    int unk14;
    String *nameInputString;
    u16 unk1C[20];
    int unk44;
    PCStorage *unk48;
    Options *options;
    BOOL *unk50;
} NamingScreenArgs;

NamingScreenArgs *NamingScreen_CreateArgs(HeapID heapId, NameScreenType kind, int param, int maxLen, Options *options, int *a5);
void NamingScreen_DeleteArgs(NamingScreenArgs *namingScreenArgs);

#endif // POKEHEARTGOLD_NAMING_SCREEN_H
