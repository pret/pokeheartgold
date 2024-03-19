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

typedef struct MapPreviewImageData {
    int mapId;
    u32 unused4;
    struct {
        enum GFPalLoadLocation palNo;
        int charNo;
        int scrnNo;
    } unk8[4];
    int unk3C;
} MapPreviewImageData;

typedef struct UnkStateMachineSubstruct_0206A388 {
    u16 state;
    u16 unk2;
} UnkStateMachineSubstruct_0206A388;

typedef struct UnkStruct_0206A388 {
    int state;
    int displayTimer;
    HeapID heapId;
    BgConfig *bgConfig;
    Window *unk10;
    u16 bgColorMode;
    u16 index;
    u16 unk18;
    u16 unk1A;
    u32 bg2Prioirty;
    u32 bg0Prioirty;
    u32 bg1Prioirty;
    u32 bg3Prioirty;
    int timeIndex;
    int unk30;
    UnkStateMachineSubstruct_0206A388 unk34;
} UnkStruct_0206A388;

extern MapPreviewImageData sMapPreviewImageData[];

static BOOL Task_MapPreviewImage_ShowImage(TaskManager *man);
static void MapPreviewImage_LoadGfx(UnkStruct_0206A388 *unk);
static void sub_0206A660(UnkStruct_0206A388 *unk);
static int sub_0206A694(UnkStruct_0206A388 *unk, FieldSystem *fsys);

u8 MapPreviewImage_GetIndex(u32 mapId) {
    u8 ret = -1;
    for (int i = 0; i < 25; i++) {
        if (sMapPreviewImageData[i].mapId == mapId) {
            ret = i;
            break;
        }
    }
    return ret;
}

void MapPreviewImage_BeginShowImage(TaskManager *man, int index, u8 time, int a3) {
    FieldSystem *fsys = TaskManager_GetFieldSystem(man);
    UnkStruct_0206A388 *unk = AllocFromHeapAtEnd(HEAP_ID_4, sizeof(UnkStruct_0206A388));

    unk->state = 0;
    unk->displayTimer = 0;
    unk->bgConfig = FieldSystem_GetBgConfigPtr(fsys);
    unk->unk18 = 0;
    unk->unk1A = 0;
    unk->index = index;

    switch (time) {
    case 0:
        unk->timeIndex = 0;
        break;
    case 1:
        unk->timeIndex = 1;
        break;
    case 2:
        unk->timeIndex = 2;
        break;
    case 3:
    case 4:
        unk->timeIndex = 3;
        break;
    default:
        GF_ASSERT(FALSE);
        unk->timeIndex = 0;
        break;
    }

    unk->heapId = HEAP_ID_4;
    unk->unk30 = a3;
    unk->unk34.state = 0;
    unk->unk34.unk2 = 0;
    
    TaskManager_Call(man, Task_MapPreviewImage_ShowImage, unk);
}

static BOOL Task_MapPreviewImage_ShowImage(TaskManager *man) {
    FieldSystem *fsys = TaskManager_GetFieldSystem(man);
    UnkStruct_0206A388 *unk = TaskManager_GetEnvironment(man);

    switch (unk->state) {
    case 0:
        unk->bgColorMode = GetBgColorMode(unk->bgConfig, 2);
        unk->bg2Prioirty = GetBgPriority(unk->bgConfig, GF_BG_LYR_MAIN_2);
        unk->bg0Prioirty = GetBgPriority(unk->bgConfig, GF_BG_LYR_MAIN_0);
        unk->bg1Prioirty = GetBgPriority(unk->bgConfig, GF_BG_LYR_MAIN_1);
        unk->bg3Prioirty = GetBgPriority(unk->bgConfig, GF_BG_LYR_MAIN_3);
        SetBgControlParam(unk->bgConfig, 2, GF_BG_CNT_SET_COLOR_MODE, 1);
        SetBgPriority(GF_BG_LYR_MAIN_3, 0);
        SetBgPriority(GF_BG_LYR_MAIN_2, 1);
        SetBgPriority(GF_BG_LYR_MAIN_0, 2);
        MapPreviewImage_LoadGfx(unk);
        sub_0206A660(unk);
        G2_SetBlendAlpha(4, 0x21, 16, 0);
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 16, 1, unk->heapId);
        unk->state++;
        break;
    case 1:
        if (IsPaletteFadeFinished()) {
            unk->state++;
        }
        break;
    case 2:
        if (gSystem.newKeys & PAD_BUTTON_A) {
            unk->unk18 = 0;
            unk->state++;
            break;
        }
        if (++unk->displayTimer > 60) {
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
            SetBgControlParam(unk->bgConfig, 2, GF_BG_CNT_SET_COLOR_MODE, unk->bgColorMode);
            SetBgPriority(GF_BG_LYR_MAIN_2, (u8) unk->bg2Prioirty);
            SetBgPriority(GF_BG_LYR_MAIN_0, (u8) unk->bg0Prioirty);
            SetBgPriority(GF_BG_LYR_MAIN_1, (u8) unk->bg1Prioirty);
            SetBgPriority(GF_BG_LYR_MAIN_3, (u8) unk->bg3Prioirty);
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

static void MapPreviewImage_LoadGfx(UnkStruct_0206A388 *unk) {
    GfGfxLoader_GXLoadPal(NARC_a_1_5_0, sMapPreviewImageData[unk->index].unk8[unk->timeIndex].palNo, GF_PAL_LOCATION_MAIN_BG, GF_PAL_SLOT_0_OFFSET, 0x160, unk->heapId);
    GfGfxLoader_LoadCharData(NARC_a_1_5_0, sMapPreviewImageData[unk->index].unk8[unk->timeIndex].charNo, unk->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 1, unk->heapId);
    GfGfxLoader_LoadScrnData(NARC_a_1_5_0, sMapPreviewImageData[unk->index].unk8[unk->timeIndex].scrnNo, unk->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 1, unk->heapId);
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
        pos.y -= 2 * FX32_ONE;
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
