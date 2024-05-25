#include "constants/sndseq.h"
#include "global.h"
#include "unk_0203BC10.h"
#include "map_header.h"
#include "constants/map_sections.h"
#include "save_vars_flags.h"
#include "sys_flags.h"
#include "unk_02005D10.h"
#include "unk_0205CB48.h"
#include "unk_02066EDC.h"
#include "constants/start_menu_icons.h"

typedef struct UnkStruct_0203BE34 {
    u8 filler_000[0x24];
    u16 unk_024;
    u16 unk_026;
    u8 filler_028[0x324];
    u32 unk_34C;
    BOOL unk_350;
    u8 filler_354[0x2C];
    int unk_380;
    u8 filler_384[0x8];
} UnkStruct_0203BE34;  // size: 0x38C

UnkStruct_0203BE34 *sub_0203BE34(void);
u32 sub_0203BE60(FieldSystem *fieldSystem);
u32 sub_0203BECC(FieldSystem *fieldSystem);
u32 sub_0203BED0(FieldSystem *fieldSystem);
u32 sub_0203BED4(FieldSystem *fieldSystem);
u32 sub_0203BED8(FieldSystem *fieldSystem);
u32 sub_0203BEE0(FieldSystem *fieldSystem);
u32 sub_0203BEE8(FieldSystem *fieldSystem);
BOOL sub_0203BEF0(TaskManager *taskManager);

BOOL sub_0203BC10(FieldSystem *fieldSystem) {
    return MapHeader_GetMapSec(fieldSystem->location->mapId) != MAPSEC_MYSTERY_ZONE;
}

void sub_0203BC28(FieldSystem *fieldSystem) {
    UnkStruct_0203BE34 *r4 = sub_0203BE34();
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BECC(fieldSystem);
    } else if (Save_VarsFlags_CheckBugContestFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BED0(fieldSystem);
    } else if (Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BED4(fieldSystem);
    } else if (sub_02067584(fieldSystem) == TRUE) {
        r4->unk_34C = sub_0203BED8(fieldSystem);
    } else {
        r4->unk_34C = sub_0203BE60(fieldSystem);
    }
    r4->unk_350 = FALSE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, sub_0203BEF0, r4);
}

void sub_0203BCDC(FieldSystem *fieldSystem) {
    UnkStruct_0203BE34 *r4 = sub_0203BE34();
    r4->unk_34C = sub_0203BEE0(fieldSystem);
    r4->unk_350 = TRUE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, sub_0203BEF0, r4);
}

void sub_0203BD20(FieldSystem *fieldSystem) {
    UnkStruct_0203BE34 *r4 = sub_0203BE34();
    r4->unk_34C = sub_0203BEE8(fieldSystem);
    r4->unk_350 = FALSE;
    if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
        sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
    }
    FieldSystem_CreateTask(fieldSystem, sub_0203BEF0, r4);
}

void sub_0203BD64(FieldSystem *fieldSystem) {
    PlaySE(SEQ_SE_DP_WIN_OPEN);
    UnkStruct_0203BE34 *r4 = sub_0203BE34();
    r4->unk_350 = FALSE;
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BECC(fieldSystem);
    } else if (Save_VarsFlags_CheckBugContestFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BED0(fieldSystem);
    } else if (Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        r4->unk_34C = sub_0203BED4(fieldSystem);
    } else if (sub_02067584(fieldSystem) == TRUE) {
        r4->unk_34C = sub_0203BED8(fieldSystem);
    } else if (fieldSystem->unk70 == 3) {
        r4->unk_34C = sub_0203BEE8(fieldSystem);
    } else if (fieldSystem->unk70 == 2) {
        r4->unk_34C = sub_0203BEE0(fieldSystem);
        r4->unk_350 = TRUE;
    } else {
        r4->unk_34C = sub_0203BE60(fieldSystem);
    }
    TaskManager_Jump(fieldSystem->taskman, sub_0203BEF0, r4);
}

UnkStruct_0203BE34 *sub_0203BE34(void) {
    UnkStruct_0203BE34 *ret = AllocFromHeap(HEAP_ID_FIELD, sizeof(UnkStruct_0203BE34));
    MI_CpuClearFast(ret, sizeof(UnkStruct_0203BE34));
    ret->unk_026 = 0;
    ret->unk_024 = 0;
    ret->unk_380 = 0;
    return ret;
}

u32 sub_0203BE60(FieldSystem *fieldSystem) {
    u32 ret = 0;
    if (!CheckGotPokedex(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << 0);
    }
    if (!CheckGotStarter(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << 1);
    }
    if (!CheckGotMenuIconI(Save_VarsFlags_Get(fieldSystem->saveData), START_MENU_ICON_BAG)) {
        ret |= (1 << 2);
    }
    if (!CheckGotPokegear(Save_VarsFlags_Get(fieldSystem->saveData))) {
        ret |= (1 << 9);
    }
    if (MapHeader_MapIsAmitySquare(fieldSystem->location->mapId) == TRUE) {
        ret |= (1 << 1) | (1 << 2);
    }
    ret |= (1 << 7) | (1 << 8);
    return ret;
}

u32 sub_0203BECC(FieldSystem *fieldSystem) {
    return (1 << 4) | (1 << 7);
}

u32 sub_0203BED0(FieldSystem *fieldSystem) {
    return (1 << 2) | (1 << 4) | (1 << 7);
}

u32 sub_0203BED4(FieldSystem *fieldSystem) {
    return (1 << 2) | (1 << 4) | (1 << 7);
}

u32 sub_0203BED8(FieldSystem *fieldSystem) {
    return (1 << 0) | (1 << 2) | (1 << 4) | (1 << 7) | (1 << 8) | (1 << 9);
}

u32 sub_0203BEE0(FieldSystem *fieldSystem) {
    return (1 << 4) | (1 << 8);
}

u32 sub_0203BEE8(FieldSystem *fieldSystem) {
    return (1 << 0) | (1 << 4) | (1 << 7) | (1 << 8) | (1 << 9);
}
