#include "global.h"
#include "field_map_object.h"
#include "field_player_avatar.h"
#include "follow_mon.h"
#include "gf_gfx_loader.h"
#include "system.h"
#include "unk_0206A360.h"
#include "unk_0200FA24.h"
#include "unk_02062108.h"
#include "overlay_01_021F1AFC.h"
#include "overlay_01.h"

typedef struct UnkStruct_0210FAE8 {
    int mapId;
    u32 unk4;
    struct {
        enum GFPalLoadLocation palNo;
        int charNo;
        int scrnNo;
    } unk8[4];
    int unk3C;
} UnkStruct_0210FAE8;

typedef struct UnkStateMachineSubstruct_0206A388 {
    u16 state;
    u16 unk2;
} UnkStateMachineSubstruct_0206A388;

typedef struct UnkStruct_0206A388 {
    int state;
    int unk4;
    HeapID heapId;
    BgConfig *bgConfig;
    Window *unk10;
    u16 unk14;
    u16 unk16;
    u16 unk18;
    u16 unk1A;
    u32 unk1C;
    u32 unk20;
    u32 unk24;
    u32 unk28;
    int unk2C;
    int unk30;
    UnkStateMachineSubstruct_0206A388 unk34;
} UnkStruct_0206A388;

extern UnkStruct_0210FAE8 _0210FAE8[];

static BOOL sub_0206A410(TaskManager *man);
static void sub_0206A5D0(UnkStruct_0206A388 *unk);
static void sub_0206A660(UnkStruct_0206A388 *unk);
static int sub_0206A694(UnkStruct_0206A388 *unk, FieldSystem *fsys);

u8 sub_0206A360(u32 mapId) {
    u8 ret = -1;
    for (int i = 0; i < 25; i++) {
        if (_0210FAE8[i].mapId == mapId) {
            ret = i;
            break;
        }
    }
    return ret;
}

void sub_0206A388(TaskManager *man, int index, u8 time, int a3) {
    FieldSystem *fsys = TaskManager_GetFieldSystem(man);
    UnkStruct_0206A388 *unk = AllocFromHeapAtEnd(HEAP_ID_4, sizeof(UnkStruct_0206A388));

    unk->state = 0;
    unk->unk4 = 0;
    unk->bgConfig = FieldSystem_GetBgConfigPtr(fsys);
    unk->unk18 = 0;
    unk->unk1A = 0;
    unk->unk16 = index;

    switch (time) {
    case 0:
        unk->unk2C = 0;
        break;
    case 1:
        unk->unk2C = 1;
        break;
    case 2:
        unk->unk2C = 2;
        break;
    case 3:
    case 4:
        unk->unk2C = 3;
        break;
    default:
        GF_ASSERT(FALSE);
        unk->unk2C = 0;
        break;
    }

    unk->heapId = HEAP_ID_4;
    unk->unk30 = a3;
    unk->unk34.state = 0;
    unk->unk34.unk2 = 0;
    
    TaskManager_Call(man, sub_0206A410, unk);
}

static BOOL sub_0206A410(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetFieldSystem(man);
    UnkStruct_0206A388 *unk = TaskManager_GetEnvironment(man);

    switch (unk->state) {
    case 0:
        unk->unk14 = GetBgColorMode(unk->bgConfig, 2);
        unk->unk1C = GetBgPriority(unk->bgConfig, 2);
        unk->unk20 = GetBgPriority(unk->bgConfig, 0);
        unk->unk24 = GetBgPriority(unk->bgConfig, 1);
        unk->unk28 = GetBgPriority(unk->bgConfig, 3);
        SetBgControlParam(unk->bgConfig, 2, GF_BG_CNT_SET_COLOR_MODE, 1);
        SetBgPriority(3, 0);
        SetBgPriority(2, 1);
        SetBgPriority(0, 2);
        sub_0206A5D0(unk);
        sub_0206A660(unk);
        G2x_SetBlendAlpha_((u32) &reg_G2_BLDCNT, 4, 0x21, 16, 0);
        BeginNormalPaletteFade(0, 1, 1, 0, 0x10, 1, unk->heapId);
        unk->state++;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            unk->state++;
        }
        break;
    case 2:
        if (gSystem.newKeys & 1) {
            unk->unk18 = 0;
            unk->state++;
            break;
        }
        if (++unk->unk4 > 0x3c) {
            unk->unk18 = 0;
            unk->state++;
            
        }
        break;
    case 3:
        if (unk->unk18 < 16) {
            if (++unk->unk1A >= 2) {
                unk->unk1A = 0;
                unk->unk18++;
            } 
            reg_G2_BLDALPHA = (16 - unk->unk18) | (unk->unk18 << 8);
        } 
        if (sub_0206A694(unk, fsys) && unk->unk18 >= 16) {
            ToggleBgLayer(2, GF_PLANE_TOGGLE_OFF);
            SetBgControlParam(unk->bgConfig, 2, GF_BG_CNT_SET_COLOR_MODE, unk->unk14);
            SetBgPriority(2, (u8) unk->unk1C);
            SetBgPriority(0, (u8) unk->unk20);
            SetBgPriority(1, (u8) unk->unk24);
            SetBgPriority(3, (u8) unk->unk28);
            reg_G2_BLDCNT = 0;
            BG_ClearCharDataRange(2, 0x20, 0, unk->heapId);
            BgClearTilemapBufferAndCommit(unk->bgConfig, 2);
            WindowArray_Delete(unk->unk10, 1);
            FreeToHeap(unk);
            return TRUE;
        }
        break;
    }
    return FALSE;
}

static void sub_0206A5D0(UnkStruct_0206A388 *unk) {
    GfGfxLoader_GXLoadPal(NARC_a_1_5_0, _0210FAE8[unk->unk16].unk8[unk->unk2C].palNo, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0x160, unk->heapId);
    GfGfxLoader_LoadCharData(NARC_a_1_5_0, _0210FAE8[unk->unk16].unk8[unk->unk2C].charNo, unk->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 1, unk->heapId);
    GfGfxLoader_LoadScrnData(NARC_a_1_5_0, _0210FAE8[unk->unk16].unk8[unk->unk2C].scrnNo, unk->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 1, unk->heapId);
}

static void sub_0206A660(UnkStruct_0206A388 *unk) {
    unk->unk10 = AllocWindows(unk->heapId, 1);
    AddWindowParameterized(unk->bgConfig, unk->unk10, 2, 0, 0, 0x1C, 2, 0xd, 0x2C0);
}

static int sub_0206A694(UnkStruct_0206A388 *unk, FieldSystem *fsys) {
    LocalMapObject *player;
    
    if (!unk->unk30) {
        return TRUE;
    }

    UnkStateMachineSubstruct_0206A388 *unkSub = &unk->unk34; //required to match
    
    switch (unk->unk34.state) {
        case 0:
            PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(fsys->playerAvatar, 0);
            unkSub->state++;
            break;
        case 1:
            VecFx32 pos;
            player = PlayerAvatar_GetMapObject(fsys->playerAvatar);
            unkSub->unk2++;
            MapObject_GetPositionVec(player, &pos);
            pos.y -= (1 << 13);
            MapObject_SetPositionVec(player, &pos);
            if (unkSub->unk2 >= 16) {
                PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(fsys->playerAvatar, 1);
                unkSub->state++;
            }
            break;
        case 2:
            Field_PlayerAvatar_OrrTransitionFlags(fsys->playerAvatar, 1);
            Field_PlayerAvatar_ApplyTransitionFlags(fsys->playerAvatar);
            unkSub->state++;
            break;
        case 3:
            player = PlayerAvatar_GetMapObject(fsys->playerAvatar);
            if (MapObject_AreBitsSetForMovementScriptInit(player)) {
                MapObject_SetHeldMovement(player, 1);
                unkSub->state++;
            }
            break;
        case 4:
            player = PlayerAvatar_GetMapObject(fsys->playerAvatar);
            if (MapObject_AreBitsSetForMovementScriptInit(player)) {
                if (FollowMon_IsActive(fsys)) {
                    ov01_02205790(fsys, 1);
                    sub_0205FC94(FollowMon_GetMapObject(fsys), 0x30);
                    sub_02069DC8(FollowMon_GetMapObject(fsys), 1);
                }
                unkSub->state++;
            }
            break;
        case 5:
            return TRUE;
    }

    return FALSE;
}
