#ifndef POKEHEARTGOLD_OVERLAY_55_H
#define POKEHEARTGOLD_OVERLAY_55_H

#include "mail.h"
#include "mail_misc.h"
#include "overlay_manager.h"
#include "options.h"
#include "pm_string.h"

typedef struct UnkStruct_ov55_021E5B08 {
    u16 unk0;
    u8 mailMessageIdx;
    OPTIONS *options;
    u32 *unk8;
    u32 mailOTID;
    u8 unk10;
    u8 mailLanguage;
    u8 mailVersion;
    u8 mailType;
    String *mailAuthorName;
    u16 unk18[3];
    MAIL_MESSAGE mailMessages[3];
} UnkStruct_ov55_021E5B08;

typedef struct UnkStruct_ov55_021E5924 {
    HeapID heapId;
    u8 unk4[0x4];
    Unk02090C94 *unk8;
    OVY_MANAGER *unkC;
    UnkStruct_ov55_021E5B08 *unk10;
    MAIL_MESSAGE unk14;
} UnkStruct_ov55_021E5924;

typedef struct UnkArgs_ov55 {
    u16 unk0;
    u32 unk4;
    u8 unk8[0x7];
    u8 mailType;
    SaveData *saveData;
    Mail *mail;
    u8 unk18[4];
    u32 *unk1C;
} UnkArgs_ov55;

BOOL ov55_UnkApp_Init(OVY_MANAGER *manager, int *state);
BOOL ov55_UnkApp_Main(OVY_MANAGER *manager, int *state);
BOOL ov55_UnkApp_Exit(OVY_MANAGER *manager, int *state);

#endif
