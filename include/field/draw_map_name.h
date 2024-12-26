#ifndef POKEHEARTGOLD_FIELD_DRAW_MAP_NAME_H
#define POKEHEARTGOLD_FIELD_DRAW_MAP_NAME_H

#include "bg_window.h"
#include "msgdata.h"

typedef struct FieldDrawMapNameInfo {
    BOOL onScreen;
    u8 positionState;
    SysTask *task;
    int layerY;
    u16 framesFullyOnscreen;
    BOOL gonnaDrawAnother;
    u32 mapsec;
    BgConfig *bgConfig;
    Window window;
    u8 nameX;
    u8 areaIcon;
    NNSG2dCharacterData *g2dCharData;
    void *charData;
    MsgData *mapsecMsgData;
    String *mapNameString;
} FieldDrawMapNameInfo; // size: 0x44

FieldDrawMapNameInfo *FieldDrawMapNameInfo_Create(BgConfig *bgConfig);
void FieldDrawMapNameInfo_Destroy(FieldDrawMapNameInfo *info);
void FieldDrawMapName_Reset(FieldDrawMapNameInfo *info);

#endif
