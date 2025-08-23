#ifndef POKEHEARTGOLD_NAMING_SCREEN_H
#define POKEHEARTGOLD_NAMING_SCREEN_H

#include "launch_application.h"
#include "options.h"
#include "overlay_manager.h"
#include "pm_string.h"

extern const OverlayManagerTemplate gOverlayTemplate_NamingScreen;

typedef struct NamingScreenArgs {
    NameScreenType kind;
    int playerGenderOrMonSpecies; // monSpecies
    int monForm;
    int maxLen;
    int monGender;
    BOOL noInput;
    String *nameInputString;
    u16 nameInputFlat[20];
    int battleMsgId;
    PCStorage *pcStorage;
    Options *options;
    MenuInputStateMgr *pMenuInputState;
} NamingScreenArgs;

NamingScreenArgs *NamingScreen_CreateArgs(HeapID heapId, NameScreenType kind, int param, int maxLen, Options *options, MenuInputStateMgr *pMenuInputState);
void NamingScreen_DeleteArgs(NamingScreenArgs *namingScreenArgs);

#endif // POKEHEARTGOLD_NAMING_SCREEN_H
