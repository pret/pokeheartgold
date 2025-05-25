#ifndef POKEHEARTGOLD_OVERLAY_55_H
#define POKEHEARTGOLD_OVERLAY_55_H

#include "mail.h"
#include "mail_misc.h"
#include "options.h"
#include "overlay_manager.h"
#include "pm_string.h"

typedef struct UnkStruct_ov55_021E5B08 {
    u16 unk0;
    u8 mailMessageIdx;
    Options *options;
    MenuInputStateMgr *menuInputStateMgr;
    u32 mailOTID;
    u8 unk10;
    u8 mailLanguage;
    u8 mailVersion;
    u8 mailType;
    String *mailAuthorName;
    u16 unk18[3];
    MailMessage mailMessages[3];
} UnkStruct_ov55_021E5B08;

typedef struct UnkStruct_ov55_021E5924 {
    HeapID heapId;
    u8 unk4[0x4];
    EasyChatArgs *unk8;
    OverlayManager *unkC;
    UnkStruct_ov55_021E5B08 *unk10;
    MailMessage unk14;
} UnkStruct_ov55_021E5924;

BOOL ov55_UnkApp_Init(OverlayManager *manager, int *state);
BOOL ov55_UnkApp_Main(OverlayManager *manager, int *state);
BOOL ov55_UnkApp_Exit(OverlayManager *manager, int *state);

#endif
