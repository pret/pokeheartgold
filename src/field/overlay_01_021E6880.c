#include "overlay_01_021E6880.h"

#include "global.h"

#include "constants/badge.h"
#include "constants/maps.h"
#include "constants/movements.h"
#include "constants/moves.h"
#include "constants/std_script.h"

#include "overlay_2/event_cutscene.h"
#include "overlay_2/overlay_02_gear_phone.h"

#include "encounter.h"
#include "field_system.h"
#include "field_warp_tasks.h"
#include "follow_mon.h"
#include "get_egg.h"
#include "gymmick_init.h"
#include "map_events.h"
#include "map_object.h"
#include "metatile_behavior.h"
#include "overlay_01.h"
#include "overlay_01_021F6830.h"
#include "pal_park.h"
#include "safari_zone.h"
#include "script_pokemon_util.h"
#include "sound_02004A44.h"
#include "start_menu.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_02005D10.h"
#include "unk_02031B0C.h"
#include "unk_02034354.h"
#include "unk_02035900.h"
#include "unk_02037C94.h"
#include "unk_02054648.h"
#include "unk_02055BF0.h"
#include "unk_0205A44C.h"
#include "unk_0205CB48.h"
#include "unk_0206D494.h"
#include "unk_02092BE8.h"

// FIXME: These don't belong here.
typedef struct UnkStruct_021E7D00_sub {
    u8 unk0;
    u8 unk1;
    u8 unk2;
    u8 unk3;
    u8 unk4;
    u8 unk5;
    u8 unk6;
    u8 unk7;
} UnkStruct_021E7D00_sub;
typedef struct UnkStruct_021E7D00 {
    u8 unk0[2];
    u16 unk2;
    UnkStruct_021E7D00_sub unk4[];
} UnkStruct_021E7D00;

static const u16 ov01_022063BC[16][2] = {
    { SEQ_SE_GS_N_SESERAGI,    1 },
    { SEQ_SE_GS_N_HUUSHA,      0 },
    { SEQ_SE_GS_N_UMIBE,       0 },
    { SEQ_SE_GS_N_HASHIRA,     1 },
    { SEQ_SE_GS_N_UZUSIO,      0 },
    { SEQ_SE_GS_N_TAKI,        0 },
    { SEQ_SE_GS_N_YOUGAN,      1 },
    { SEQ_SE_GS_N_KANSEI,      0 },
    { SEQ_SE_GS_N_KITEKI,      0 },
    { SEQ_SE_GS_KABIGON_IBIKI, 1 },
    { SEQ_SE_GS_N_MOTER,       1 },
    { SEQ_SE_GS_N_KANE,        1 },
    { SEQ_SE_GS_KYOUHUU,       1 },
    { SEQ_SE_GS_N_ENGINE,      1 },
    { SEQ_SE_GS_N_HUNSUI,      0 },
    { SEQ_SE_GS_DENGEKIBARIA,  0 },
};

extern void sub_02006088(u16 seq);
extern u32 GetInteractedBackgroundEventScript(FieldSystem *fieldSystem, BG_EVENT *bgEvents, u32 numBgEvents);
extern void sub_02032058(SaveApricornBox *apricornBox, u32 a1);
extern u16 sub_02033250(void);
extern BOOL sub_02037958(void);
extern void sub_020380B0(void);
extern BOOL sub_0203DC64(FieldSystem *fieldSystem, LocalMapObject **destObject);
extern u32 sub_0203DDA4(FieldSystem *fieldSystem, BG_EVENT *events, int numEvents);
extern UnkStruct_021E7D00 *sub_02054874(FieldSystem *fieldSystem, u32 x, u32 z);
extern u32 sub_020548C0(FieldSystem *fieldSystem, u32 x, u32 z);
extern BOOL MapModel_IsHeadbuttTree(u16 mapModelNum);
extern u32 MapCoordToMatrixIndex(FieldSystem *fieldSystem, u32 x, u32 z);
extern u8 sub_02057F18(BOOL a0);
extern BOOL sub_02058740(void);
extern void sub_02059D44(FieldSystem *fieldSystem);
extern u16 sub_0205DD94(PlayerAvatar *avatar, u16 newKeys, u16 heldKeys);
extern BOOL TryGetSeenByNpcTrainers(FieldSystem *fieldSystem, BOOL a1);
extern BOOL ov01_021F1D94(FieldSystem *fieldSystem, PlayerAvatar *avatar, u32 a2, u32 a3);
extern BOOL ov01_021F3114(FieldSystem *fieldSystem, PlayerAvatar *avatar, u32 direction);
extern void ov01_021F6B64(FieldSystem *fieldSystem, int itemSlot);
extern void ov01_021FB630(u32 a0); // FIXME: This takes in a struct, not a u32
extern BOOL ov02_02246C8C(FieldSystem *fieldSystem);
extern BOOL ov02_0224E35C(FieldSystem *fieldSystem);
extern BOOL ov02_0224E4CC(u32 metatile, u8 a1);
extern BOOL ov02_0224E4DC(u32 metatile, u8 a1);
extern BOOL PlayerStepEvent_RepelCounterDecrement(SaveData *saveData, FieldSystem *fieldSystem);
extern BOOL ov04_02255090(FieldSystem *fieldSystem);
extern void ov04_02256BE4(FieldSystem *fieldSystem, u8 a1);

static BOOL ov01_021E6DC4(FieldSystem *fieldSystem);
static BOOL ov01_021E7114(FieldSystem *fieldSystem);
static BOOL ov01_021E7198(FieldSystem *fieldSystem, FieldInput *input);
static u32 GetInteractedMetatileScript(FieldSystem *fieldSystem, u8 a1);
static BOOL ov01_021E7628(FieldSystem *fieldSystem);
static BOOL ov01_021E774C(FieldSystem *fieldSystem);
static BOOL ov01_021E7784(FieldSystem *fieldSystem, u32 x, u32 z, u8 metatile);
static BOOL HatchEggCheck(FieldSystem *fieldSystem);
static BOOL SafariBallsOutCheck(FieldSystem *fieldSystem);
static BOOL RepelStepsOutCheck(FieldSystem *fieldSystem);
static BOOL ShouldIncreaseFriendshipFromWalking(FieldSystem *fieldSystem);
static void IncreaseFriendshipForPartyFromWalking(FieldSystem *fieldSystem);
static BOOL SurvivePoisoningCheck(FieldSystem *fieldSystem);
static BOOL ov01_021E7A08(FieldSystem *fieldSystem);
static BOOL BugContestTimeoutCheck(FieldSystem *fieldSystem);
static void ov01_021E7A98(FieldSystem *fieldSystem);
static void PlayerAvatar_GetStandingTileCoords(FieldSystem *fieldSystem, u32 *x, u32 *z);
static void PlayerAvatar_GetFacingTileCoords(FieldSystem *fieldSystem, u32 *x, u32 *z);
static void ShiftFieldCoordsByCompassDirection(FieldSystem *fieldSystem, u32 direction, u32 *x, u32 *z);
static u8 GetStandingMetatileBehavior(FieldSystem *fieldSystem);
static u8 GetFacingMetatileBehavior(FieldSystem *fieldSystem);
static u8 ov01_021E7B70(FieldSystem *fieldSystem);
static BOOL ov01_021E7B90(FieldSystem *fieldSystem, int x, int z, Location *location);
static void ov01_021E7C70(FieldSystem *fieldSystem);
static int ov01_021E7D00(UnkStruct_021E7D00 *a0, int x, int z);
static void ov01_021E7DFC(FieldSystem *fieldSystem, u32 x, u32 z);
static u16 ov01_021E7F38(FieldSystem *fieldSystem);

static void FieldInput_Init(FieldInput *input) {
    input->wantToInteract = FALSE;
    input->unk0_1 = FALSE;
    input->wantToOpenMenu = FALSE;
    input->wantedRegisteredItemSlot = FALSE;
    input->unk0_5 = FALSE;
    input->unk0_6 = FALSE;
    input->unk0_7 = FALSE;
    input->unk0_8 = FALSE;
    input->wantToReloadTouchscreenMenu = FALSE;
    input->unk0_10 = FALSE;
    input->unk0_11 = FALSE;
    input->unk0_12 = FALSE;
    input->unk0_13 = FALSE;
    input->nextMovingDirectionMaybe = DIR_NONE;
    input->currentMovingDirectionMaybe = DIR_NONE;
}

// has a Y-item registered?
static BOOL ov01_021E690C(FieldSystem *fieldSystem) {
    return ov01_021F6B10(fieldSystem) == TRUE;
}

static void ov01_021E6920(FieldSystem *fieldSystem, int itemSlot) {
    ov01_021F6B64(fieldSystem, itemSlot);
}

void FieldInput_Update(FieldInput *input, FieldSystem *fieldSystem, u16 newKeys, u16 heldKeys) {
    FieldInput_Init(input);

    if (PlayerAvatar_CheckRunningShoesLock(FieldSystem_GetPlayerAvatar(fieldSystem))) {
        heldKeys |= PAD_BUTTON_B;
    }

    u32 avatar14 = sub_0205C6D4(fieldSystem->playerAvatar);
    u32 avatar10 = sub_0205C6CC(fieldSystem->playerAvatar);
    u32 direction = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);

    input->newKeys = newKeys;
    input->heldKeys = heldKeys;

    BOOL hasBag = FieldSystem_ShouldDrawStartMenuIcon(fieldSystem, START_MENU_ICON_BAG);

    if (avatar14 == 3 || avatar14 == 0) {
        if ((hasBag && (newKeys & PAD_BUTTON_Y)) || fieldSystem->lastTouchMenuInput == 9) {
            if (ov01_021E690C(fieldSystem) == TRUE) {
                input->wantedRegisteredItemSlot = 1;
                fieldSystem->lastTouchMenuInput = 0;
            }
        } else if (fieldSystem->lastTouchMenuInput == 10) {
            if (ov01_021E690C(fieldSystem) == TRUE) {
                input->wantedRegisteredItemSlot = 2;
                fieldSystem->lastTouchMenuInput = 0;
            }
        } else if (fieldSystem->lastTouchMenuInput == 11) {
            input->wantToReloadTouchscreenMenu = TRUE;
            fieldSystem->lastTouchMenuInput = 0;
        } else if ((newKeys & PAD_BUTTON_X) || fieldSystem->lastTouchMenuInput != 0) {
            if (ov01_021F6B00(fieldSystem) == 4) {
                MenuInputStateMgr_SetState(&fieldSystem->menuInputState, MENU_INPUT_STATE_BUTTONS);
                input->wantToReloadTouchscreenMenu = TRUE;
                input->wantToOpenMenu = TRUE;
            } else if (hasBag) {
                input->wantToOpenMenu = TRUE;
                if (fieldSystem->lastTouchMenuInput == 1) {
                    fieldSystem->lastTouchMenuInput = 0;
                }
            }
        } else if (newKeys & PAD_BUTTON_A) {
            input->wantToInteract = TRUE;
        }

        if (heldKeys & (PAD_KEY_UP | PAD_KEY_DOWN | PAD_KEY_LEFT | PAD_KEY_RIGHT)) {
            input->unk0_5 = TRUE;
            input->unk0_6 = TRUE;
        }
        input->unk0_8 = TRUE;
    } else {
        fieldSystem->lastTouchMenuInput = 0;
    }

    if (avatar14 == 3 && avatar10 == 1) {
        input->unk0_7 = TRUE;
    }
    if (avatar14 == 3) {
        input->unk0_1 = TRUE;
    }

    if ((direction == DIR_NORTH && heldKeys & PAD_KEY_UP) || (direction == DIR_SOUTH && heldKeys & PAD_KEY_DOWN) || (direction == DIR_WEST && heldKeys & PAD_KEY_LEFT) || (direction == DIR_EAST && heldKeys & PAD_KEY_RIGHT)) {
        input->currentMovingDirectionMaybe = direction;
    } else {
        input->currentMovingDirectionMaybe = DIR_NONE;
    }

    input->nextMovingDirectionMaybe = sub_0205DD94(fieldSystem->playerAvatar, newKeys, heldKeys);
}

int FieldInput_Process(FieldInput *input, FieldSystem *fieldSystem) {
    if (!input->unk0_13 && TryStartMapScriptByType(fieldSystem, 1) == TRUE) {
        return 1;
    }

    if (!input->unk0_13) {
        BOOL unkBool = HasEnoughAlivePokemonForDoubleBattle(SaveArray_Party_Get(fieldSystem->saveData));
        if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
            unkBool = TRUE;
        }
        if (TryGetSeenByNpcTrainers(fieldSystem, unkBool) == TRUE) {
            sub_0205CF44(fieldSystem->playerAvatar);
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            if (FollowMon_IsActive(fieldSystem)) {
                MapObject_UnpauseMovement(FollowMon_GetMapObject(fieldSystem));
            }
            return 1;
        }
    }

    if (input->unk0_7) {
        ClearFlag965(Save_VarsFlags_Get(fieldSystem->saveData));
        if (ov01_021E7628(fieldSystem) == TRUE) {
            return 1;
        }
    }

    if (BugContestTimeoutCheck(fieldSystem)) {
        return 1;
    }

    u32 flags = 0;
    int direction = sub_0205DD94(fieldSystem->playerAvatar, input->newKeys, input->heldKeys);
    if (StrengthFlagAction(Save_VarsFlags_Get(fieldSystem->saveData), FLAG_ACTION_CHECK)) {
        flags |= (1 << 0);
    }
    if (GetIdxOfFirstPartyMonWithMove(SaveArray_Party_Get(fieldSystem->saveData), MOVE_WATERFALL) != 0xFF) {
        flags |= (1 << 1);
    }

    if (ov01_021F1D94(fieldSystem, fieldSystem->playerAvatar, direction, flags) == TRUE) {
        return 1;
    }

    if (input->unk0_1) {
        if (ov01_021E7114(fieldSystem)) {
            return 1;
        }
        if (ov01_021E6DC4(fieldSystem) == TRUE) {
            return 1;
        }
    }

    if (input->unk0_5 && input->nextMovingDirectionMaybe == PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar) && ov01_021E6DC4(fieldSystem) == TRUE) {
        return 1;
    }

    if (input->wantToInteract) {
        LocalMapObject *facingObject;
        if (sub_0203DC64(fieldSystem, &facingObject) == TRUE) {
            if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
                sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
            }
            if (MapObject_GetType(facingObject) != 9) {
                StartMapSceneScript(fieldSystem, MapObject_GetScriptID(facingObject), facingObject);
            } else {
                StartMapSceneScript(fieldSystem, 0, facingObject);
            }
            fieldSystem->lastTouchMenuInput = 0;
            return 1;
        }

        u32 script = GetInteractedBackgroundEventScript(fieldSystem, Field_GetBgEvents(fieldSystem), Field_GetNumBgEvents(fieldSystem));
        if (script != 0xFFFF) {
            StartMapSceneScript(fieldSystem, script, NULL);
            fieldSystem->lastTouchMenuInput = 0;
            return 1;
        }

        script = GetInteractedMetatileScript(fieldSystem, GetFacingMetatileBehavior(fieldSystem));
        if (script != 0xFFFF) {
            StartMapSceneScript(fieldSystem, script, NULL);
            fieldSystem->lastTouchMenuInput = 0;
            return 1;
        }

        script = ov01_021E7F38(fieldSystem);
        if (script != 0xFFFF) {
            StartMapSceneScript(fieldSystem, script, NULL);
            fieldSystem->lastTouchMenuInput = 0;
            return 1;
        }
    }

    if (input->unk0_6 && ov01_021E7198(fieldSystem, input) == TRUE) {
        ov01_021E7C70(fieldSystem);
        return TRUE;
    }

    if (input->wantedRegisteredItemSlot != 0) {
        u32 use = UseRegisteredItemButtonInField(fieldSystem, input->wantedRegisteredItemSlot);
        if (use != 0) {
            ov01_021E6920(fieldSystem, input->wantedRegisteredItemSlot);
            return use;
        }
    }

    if (input->wantToOpenMenu && FieldSystem_MapIsNotMysteryZone(fieldSystem) == TRUE) {
        PlaySE(SEQ_SE_DP_WIN_OPEN);
        StartMenu_Init(fieldSystem);
        return 2;
    }

    if (ov02_02252334(fieldSystem)) {
        StartMapSceneScript(fieldSystem, std_revert_shaymin, NULL);
        return 1;
    }

    if (input->wantToReloadTouchscreenMenu) {
        ov01_021F6A9C(fieldSystem, 0, NULL);
        return 2;
    }

    if (input->unk0_8 && ov02_02251F20(FieldSystem_GetGearPhoneRingManager(fieldSystem))) {
        return 2;
    }

    return 0;
}

BOOL ov01_021E6DC4(FieldSystem *fieldSystem) {
    u32 scriptId = sub_0203DDA4(fieldSystem, Field_GetBgEvents(fieldSystem), Field_GetNumBgEvents(fieldSystem));
    if (scriptId != 0xFFFF) {
        StartMapSceneScript(fieldSystem, scriptId, NULL);
        return TRUE;
    }

    return FALSE;
}

BOOL FieldInput_Process_Colosseum(FieldInput *input, FieldSystem *fieldSystem) {
    if (input->unk0_6 && input->currentMovingDirectionMaybe == DIR_SOUTH && sub_0205B73C(GetStandingMetatileBehavior(fieldSystem))) {
        StartMapSceneScript(fieldSystem, std_colosseum_exit, NULL);
        return TRUE;
    }

    if (sub_02037958() || sub_02057F18(sub_0203769C()) != 0 || !sub_02058740()) {
        return FALSE;
    }

    if (input->wantToInteract) {
        LocalMapObject *facingObject;
        if (sub_0203DC64(fieldSystem, &facingObject) == TRUE && MapObject_GetMovement(facingObject) != MOVEMENT_FACE_DOWN) {
            if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
                sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
            }
            StartMapSceneScript(fieldSystem, MapObject_GetScriptID(facingObject), facingObject);
            return TRUE;
        }
    }

    if (input->wantToInteract) {
        sub_02059D44(fieldSystem);
        return TRUE;
    }

    if (input->wantToOpenMenu) {
        PlaySE(SEQ_SE_DP_WIN_OPEN);
        sub_0203BD20(fieldSystem);
        return TRUE;
    }

    return FALSE;
}

static BOOL ov01_021E6ED8(void) {
    int i;
    int count;
    for (count = 0, i = 1; i < 5; i++) {
        if (sub_02034818(i) != NULL) {
            count++;
        }
    }

    return count >= 1;
}

BOOL FieldInput_Process_UnionRoom(FieldInput *input, FieldSystem *fieldSystem) {
    if (sub_02033250() & 0xFE) {
        if (ov01_021E6ED8() && sub_02037454() > 1) {
            StartMapSceneScript(fieldSystem, 5, NULL);
            return TRUE;
        }
        return FALSE;
    }

    if (input->wantToInteract) {
        LocalMapObject *facingObject;
        if (sub_0203DC64(fieldSystem, &facingObject) == TRUE) {
            if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
                sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
            }
            sub_020380B0();
            StartMapSceneScript(fieldSystem, MapObject_GetScriptID(facingObject), facingObject);
            return TRUE;
        }
    }

    if (input->unk0_7 && sub_0205BA18(GetStandingMetatileBehavior(fieldSystem))) {
        sub_02053F14(fieldSystem);
        return TRUE;
    }

    if (input->wantToOpenMenu && sub_02037454() <= 1 && ov01_021E690C(fieldSystem)) {
        PlaySE(SEQ_SE_DP_WIN_OPEN);
        sub_0203BCDC(fieldSystem);
        sub_0205A904(4);
        sub_020380CC();
        return TRUE;
    }

    return FALSE;
}

BOOL FieldInput_Process_BattleTower(FieldInput *input, FieldSystem *fieldSystem) {
    if (!input->unk0_13 && TryStartMapScriptByType(fieldSystem, 1) == TRUE) {
        return TRUE;
    }

    if (input->wantToInteract) {
        LocalMapObject *facingObject;
        if (sub_0203DC64(fieldSystem, &facingObject) == TRUE) {
            if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
                sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
            }
            if (MapObject_GetType(facingObject) != 9) {
                StartMapSceneScript(fieldSystem, MapObject_GetScriptID(facingObject), facingObject);
            } else {
                StartMapSceneScript(fieldSystem, 0, facingObject);
            }
            return TRUE;
        }

        u32 bgScript = GetInteractedBackgroundEventScript(fieldSystem, Field_GetBgEvents(fieldSystem), Field_GetNumBgEvents(fieldSystem));
        if (bgScript != 0xFFFF) {
            StartMapSceneScript(fieldSystem, bgScript, NULL);
            return TRUE;
        }

        u32 metatileScript = GetInteractedMetatileScript(fieldSystem, GetFacingMetatileBehavior(fieldSystem));
        if (metatileScript != 0xFFFF) {
            StartMapSceneScript(fieldSystem, metatileScript, NULL);
            return TRUE;
        }
    }

    if (input->unk0_6 && ov01_021E7198(fieldSystem, input) == TRUE) {
        return TRUE;
    }

    if (input->wantedRegisteredItemSlot != 0) {
        u32 use = UseRegisteredItemButtonInField(fieldSystem, input->wantedRegisteredItemSlot);
        if (use != 0) {
            ov01_021E6920(fieldSystem, input->wantedRegisteredItemSlot);
            return use;
        }
    }

    if (input->wantToOpenMenu) {
        PlaySE(SEQ_SE_DP_WIN_OPEN);
        StartMenu_Init(fieldSystem);
        return TRUE;
    }

    return FALSE;
}

static BOOL ov01_021E7114(FieldSystem *fieldSystem) {
    if (fieldSystem->unk7E < 0xFFFF) {
        fieldSystem->unk7E++;
    }

    u32 x, z;
    PlayerAvatar_GetStandingTileCoords(fieldSystem, &x, &z);
    if (Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        if (PalPark_TryEncounter(fieldSystem, x, z) == TRUE) {
            sub_020511F8(fieldSystem, PalPark_SetupEncounter(fieldSystem));
            return TRUE;
        }
        return FALSE;
    }

    if (MapHeader_HasWildEncounters(fieldSystem->location->mapId) && ov02_02246C8C(fieldSystem) == TRUE) {
        return TRUE;
    }

    return FALSE;
}

static BOOL ov01_021E7198(FieldSystem *fieldSystem, FieldInput *input) {
    Location location;

    if (input->currentMovingDirectionMaybe == DIR_NONE) {
        return FALSE;
    }

    u32 x, z;
    PlayerAvatar_GetStandingTileCoords(fieldSystem, &x, &z);
    u8 standingMetatile = GetMetatileBehavior(fieldSystem, x, z);
    if (sub_0205BAA0(standingMetatile)) {
        if (input->currentMovingDirectionMaybe == DIR_NORTH && ov01_021E7B90(fieldSystem, x, z, &location)) {
            NewFieldTransitionEnvironment(fieldSystem, location.mapId, location.warpId, 0, 0, input->currentMovingDirectionMaybe, 7);
            return TRUE;
        }
        return FALSE;
    }
    if (sub_0205BAAC(standingMetatile)) {
        if (input->currentMovingDirectionMaybe == DIR_SOUTH && ov01_021E7B90(fieldSystem, x, z, &location)) {
            NewFieldTransitionEnvironment(fieldSystem, location.mapId, location.warpId, 0, 0, input->currentMovingDirectionMaybe, 7);
            return TRUE;
        }
        return FALSE;
    }
    PlayerAvatar_GetFacingTileCoords(fieldSystem, &x, &z);
    if (sub_020548C0(fieldSystem, x, z) == 0) {
        return FALSE;
    }
    if (ov01_021E7B90(fieldSystem, x, z, &location) && input->currentMovingDirectionMaybe != DIR_NONE) {
        if (sub_0205B70C(GetMetatileBehavior(fieldSystem, x, z))) {
            NewFieldTransitionEnvironment(fieldSystem, location.mapId, location.warpId, 0, 0, input->currentMovingDirectionMaybe, 1);
            return TRUE;
        }
    }

    PlayerAvatar_GetStandingTileCoords(fieldSystem, &x, &z);
    standingMetatile = GetMetatileBehavior(fieldSystem, x, z);
    if (sub_0205B718(standingMetatile) || sub_0205B748(standingMetatile)) {
        if (input->currentMovingDirectionMaybe != DIR_EAST) {
            return FALSE;
        }
    } else if (sub_0205B724(standingMetatile) || sub_0205B754(standingMetatile)) {
        if (input->currentMovingDirectionMaybe != DIR_WEST) {
            return FALSE;
        }
    } else if (sub_0205B73C(standingMetatile) || sub_0205B76C(standingMetatile)) {
        if (input->currentMovingDirectionMaybe != DIR_SOUTH) {
            return FALSE;
        }
    } else if (sub_0205B810(standingMetatile)) {
        if (input->currentMovingDirectionMaybe != DIR_EAST) {
            return FALSE;
        }
    } else if (sub_0205B81C(standingMetatile)) {
        if (input->currentMovingDirectionMaybe != DIR_WEST) {
            return FALSE;
        }
    }

    if (!ov01_021E7B90(fieldSystem, x, z, &location)) {
        return FALSE;
    }

    int transNo;
    if (sub_0205B70C(standingMetatile)) {
        transNo = 1;
    } else if (sub_0205B810(standingMetatile)) {
        transNo = 3;
    } else if (sub_0205B81C(standingMetatile)) {
        transNo = 3;
    } else if (sub_0205B718(standingMetatile) || sub_0205B748(standingMetatile) || sub_0205B724(standingMetatile) || sub_0205B754(standingMetatile) || sub_0205B73C(standingMetatile) || sub_0205B76C(standingMetatile)) {
        sub_02055CD8(fieldSystem, location.mapId, location.warpId, 0, 0, input->currentMovingDirectionMaybe);
        return TRUE;
    } else {
        return FALSE;
    }

    NewFieldTransitionEnvironment(fieldSystem, location.mapId, location.warpId, 0, 0, input->currentMovingDirectionMaybe, transNo);
    return TRUE;
}

static u32 GetInteractedMetatileScript(FieldSystem *fieldSystem, u8 metatile) {
    u32 direction = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    u32 standingMetatile = GetMetatileBehavior(fieldSystem, GetPlayerXCoord(fieldSystem->playerAvatar), GetPlayerZCoord(fieldSystem->playerAvatar));
    if (sub_0205B78C(standingMetatile)) {
        return 0xFFFF;
    } else if (sub_0205B7E0(metatile) && direction == DIR_NORTH) {
        return std_pokecenter_pc;
    } else if (sub_0205B84C(metatile)) {
        return std_picture_books;
    } else if (sub_0205B858(metatile)) {
        return std_books_for_pkmn;
    } else if (sub_0205B864(metatile)) {
        return std_chock_full;
    } else if (sub_0205B870(metatile)) {
        return std_magazines;
    } else if (sub_0205B87C(metatile)) {
        return std_trash_empty;
    } else if (sub_0205B888(metatile)) {
        return std_vibrant_pkmn_goods;
    } else if (sub_0205B894(metatile)) {
        return std_convenient_items;
    } else if (sub_0205B8A0(metatile)) {
        return std_pkmn_merchandise;
    } else if (MetatileBehavior_IsTownMap(metatile)) {
        return std_town_map;
    } else if (sub_0205B9AC(metatile) && direction == DIR_NORTH) {
        return std_tv;
    } else if (MetatileBehavior_IsHeadbutt(metatile)) {
        return std_field_headbutt;
    } else if (MetatileBehavior_IsRockClimbInDirection(metatile, direction)) {
        return std_field_rock_climb;
    } else if (PlayerAvatar_GetState(fieldSystem->playerAvatar) != PLAYER_STATE_SURFING) {
        PlayerProfile *profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
        if (Field_PlayerCanSurfOnTile(fieldSystem->playerAvatar, standingMetatile, metatile) && PlayerProfile_TestBadgeFlag(profile, BADGE_FOG) && GetIdxOfFirstPartyMonWithMove(SaveArray_Party_Get(fieldSystem->saveData), MOVE_SURF) != 0xFF) {
            return std_field_surf;
        }
        if (ov02_0224E35C(fieldSystem) && ov02_0224E4CC(metatile, ov01_021E7B70(fieldSystem))) {
            return std_safari_place_object;
        }
    } else if (MetatileBehavior_IsWaterfall(metatile)) {
        return std_field_waterfall;
    } else if (MetatileBehavior_IsWhirlpool(metatile)) {
        return std_field_whirlpool;
    } else if (ov02_0224E35C(fieldSystem) && ov02_0224E4DC(metatile, ov01_021E7B70(fieldSystem))) {
        return std_safari_place_object;
    }

    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData))) {
        if (sub_0202F620(Save_SafariZone_Get(fieldSystem->saveData)) == 0 && sub_0205BAEC(metatile)) {
            return std_safari_remove_object;
        }
    }
    return 0xFFFF;
}

static BOOL ov01_021E7628(FieldSystem *fieldSystem) {
    if (FieldSystem_IsSaveGymmickTypeEqualTo(fieldSystem, GYMMICK_BLACKTHORN) && ov04_02255090(fieldSystem)) {
        return TRUE;
    }
    if (ov01_021F3114(fieldSystem, fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar)) == TRUE) {
        ov04_02256BE4(fieldSystem, (u8)sub_0205F504(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar)));
        return TRUE;
    }
    u32 x = GetPlayerXCoord(fieldSystem->playerAvatar);
    u32 z = GetPlayerZCoord(fieldSystem->playerAvatar);
    ov01_021E7DFC(fieldSystem, x, z);
    u8 standingMetatile = GetMetatileBehavior(fieldSystem, x, z);
    if (ov01_021E774C(fieldSystem) == TRUE) {
        return TRUE;
    }
    if (ov01_021E7784(fieldSystem, x, z, standingMetatile) == TRUE) {
        ov01_021E7C70(fieldSystem);
        return TRUE;
    }
    if (PlayerAvatar_CheckFlag0(fieldSystem->playerAvatar)) {
        return FALSE;
    }
    ov01_021F6830(fieldSystem, 5, 1);
    ov01_021E7A98(fieldSystem);
    if (SurvivePoisoningCheck(fieldSystem) == TRUE) {
        return TRUE;
    }
    if (SafariBallsOutCheck(fieldSystem) == TRUE) {
        return TRUE;
    }
    if (HatchEggCheck(fieldSystem) == TRUE) {
        return TRUE;
    }
    if (RepelStepsOutCheck(fieldSystem) == TRUE) {
        return TRUE;
    }
    if (ov01_021E7A08(fieldSystem) == TRUE) {
        return TRUE;
    }
    if (ShouldIncreaseFriendshipFromWalking(fieldSystem)) {
        IncreaseFriendshipForPartyFromWalking(fieldSystem);
    }
    if (FollowMon_IsVisible(fieldSystem)) {
        FieldSystem_UnkSub108_MoveMoodTowardsNeutral(fieldSystem->unk108);
    }
    return FALSE;
}

extern u16 sub_0203DE04(FieldSystem *fieldSystem, const COORD_EVENT *events, u32 numEvents);

static BOOL ov01_021E774C(FieldSystem *fieldSystem) {
    u16 scriptId = sub_0203DE04(fieldSystem, Field_GetCoordEvents(fieldSystem), Field_GetNumCoordEvents(fieldSystem));
    if (scriptId != 0xFFFF) {
        StartMapSceneScript(fieldSystem, scriptId, NULL);
        return TRUE;
    }

    return FALSE;
}

static BOOL ov01_021E7784(FieldSystem *fieldSystem, u32 x, u32 z, u8 metatile) {
    Location location;
    if (!ov01_021E7B90(fieldSystem, x, z, &location)) {
        return FALSE;
    }

    int direction;
    if (sub_0205B7F8(metatile) == TRUE) {
        u32 facingDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
        if (facingDirection == DIR_WEST) {
            direction = DIR_EAST;
        } else if (facingDirection == DIR_EAST) {
            direction = DIR_WEST;
        } else {
            GF_ASSERT(FALSE);
            return FALSE;
        }
        NewFieldTransitionEnvironment(fieldSystem, location.mapId, location.warpId, 0, 0, direction, 2);
        return TRUE;
    } else if (sub_0205B804(metatile) == TRUE) {
        u32 facingDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
        if (facingDirection != DIR_WEST && facingDirection != DIR_EAST) {
            GF_ASSERT(FALSE);
            return FALSE;
        }
        NewFieldTransitionEnvironment(fieldSystem, location.mapId, location.warpId, 0, 0, facingDirection, 2);
        return TRUE;
    } else if (sub_0205B730(metatile) || sub_0205B760(metatile)) {
        sub_02055CD8(fieldSystem, location.mapId, location.warpId, 0, 0, DIR_NORTH);
        return TRUE;
    } else if (sub_0205BA18(metatile)) {
        sub_02053E08(fieldSystem, location.mapId, location.warpId);
        return TRUE;
    } else if (sub_0205BAB8(metatile)) {
        NewFieldTransitionEnvironment(fieldSystem, location.mapId, location.warpId, 0, 0, DIR_NORTH, 8);
        return TRUE;
    }
    return FALSE;
}

static BOOL HatchEggCheck(FieldSystem *fieldSystem) {
    Party *party = SaveArray_Party_Get(fieldSystem->saveData);
    if (HandleDaycareStep(Save_Daycare_Get(fieldSystem->saveData), party, fieldSystem) == TRUE) {
        GameStats *stats = Save_GameStats_Get(fieldSystem->saveData);
        GameStats_Inc(stats, GAME_STAT_HATCHED_EGG);
        GameStats_AddScore(stats, SCORE_EVENT_15);
        StartMapSceneScript(fieldSystem, std_hatch_egg, NULL);
        return TRUE;
    }
    return FALSE;
}

static BOOL RepelStepsOutCheck(FieldSystem *fieldSystem) {
    return PlayerStepEvent_RepelCounterDecrement(fieldSystem->saveData, fieldSystem);
}

static BOOL ShouldIncreaseFriendshipFromWalking(FieldSystem *fieldSystem) {
    SaveVarsFlags *varsFlags;

    BOOL ret = FALSE;
    varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    u16 var = Save_VarsFlags_GetVar404B(varsFlags) + 1;
    if (var >= 128) {
        var = 0;
        ret = TRUE;
    }
    Save_VarsFlags_SetVar404B(varsFlags, var);
    return ret;
}

static void IncreaseFriendshipForPartyFromWalking(FieldSystem *fieldSystem) {
    int count;
    Party *party;
    int i;
    u16 mapsec;

    party = SaveArray_Party_Get(fieldSystem->saveData);
    mapsec = MapHeader_GetMapSec(fieldSystem->location->mapId);
    count = Party_GetCount(party);

    for (i = 0; i < count; i++) {
        MonApplyFriendshipMod(Party_GetMonByIndex(party, i), FRIENDSHIP_EVENT_WALKING, mapsec);
    }
}

static BOOL SurvivePoisoningCheck(FieldSystem *fieldSystem) {
    Party *party = SaveArray_Party_Get(fieldSystem->saveData);

    u16 *poisonSteps = LocalFieldData_GetPoisonStepCounter(Save_LocalFieldData_Get(fieldSystem->saveData));
    (*poisonSteps)++;
    *poisonSteps %= 4;
    if (*poisonSteps != 0) {
        return FALSE;
    }

    switch (ApplyPoisonStep(party, MapHeader_GetMapSec(fieldSystem->location->mapId))) {
    case 0:
        return FALSE;
    case 1:
        ov01_021FB630(fieldSystem->unk4->unk20);
        return FALSE;
    case 2:
        ov01_021FB630(fieldSystem->unk4->unk20);
        StartMapSceneScript(fieldSystem, std_survive_poisoning, NULL);
        return TRUE;
    default:
        return FALSE;
    }
}

static BOOL SafariBallsOutCheck(FieldSystem *fieldSystem) {
    if (!Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData))) {
        return FALSE;
    }

    if (*LocalFieldData_GetSafariBallsCounter(Save_LocalFieldData_Get(fieldSystem->saveData)) == 0) {
        StartMapSceneScript(fieldSystem, std_safari_balls_out, NULL);
        return TRUE;
    }

    return FALSE;
}

static BOOL ov01_021E7A08(FieldSystem *fieldSystem) {
    PhoneCallPersistentState *state = SaveData_GetPhoneCallPersistentState(fieldSystem->saveData);
    if (!Save_VarsFlags_CheckFlagInArray(Save_VarsFlags_Get(fieldSystem->saveData), FLAG_UNK_984) && !sub_0202F08C(state, 2) && GameStats_GetCapped(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_APRICORN_GET) >= 1024) {
        sub_02092E14(FieldSystem_GetGearPhoneRingManager(fieldSystem), 2, TRUE);
        return FALSE;
    }
    return FALSE;
}

BOOL BugContestTimeoutCheck(FieldSystem *fieldSystem) {
    BugContest *bugContest = FieldSystem_BugContest_Get(fieldSystem);

    if (!Save_VarsFlags_CheckBugContestFlag(Save_VarsFlags_Get(fieldSystem->saveData))) {
        return FALSE;
    }

    if (bugContest->elapsed_time >= 20) {
        StartMapSceneScript(fieldSystem, std_bug_contest_time_up, NULL);
        return TRUE;
    }

    return FALSE;
}

static void ov01_021E7A98(FieldSystem *fieldSystem) {
    u32 unk = GameStats_GetCapped(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_UNK0);
    sub_02032058(Save_ApricornBox_Get(fieldSystem->saveData), unk);
}

static void PlayerAvatar_GetStandingTileCoords(FieldSystem *fieldSystem, u32 *x, u32 *z) {
    *x = GetPlayerXCoord(fieldSystem->playerAvatar);
    *z = GetPlayerZCoord(fieldSystem->playerAvatar);
}

static void PlayerAvatar_GetFacingTileCoords(FieldSystem *fieldSystem, u32 *x, u32 *z) {
    ShiftFieldCoordsByCompassDirection(fieldSystem, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar), x, z);
}

static void ShiftFieldCoordsByCompassDirection(FieldSystem *fieldSystem, u32 direction, u32 *x, u32 *z) {
    PlayerAvatar_GetStandingTileCoords(fieldSystem, x, z);

    switch (direction) {
    case DIR_NORTH:
        (*z)--;
        break;
    case DIR_SOUTH:
        (*z)++;
        break;
    case DIR_WEST:
        (*x)--;
        break;
    case DIR_EAST:
        (*x)++;
        break;
    }
}

static u8 GetStandingMetatileBehavior(FieldSystem *fieldSystem) {
    u32 x, z;
    PlayerAvatar_GetStandingTileCoords(fieldSystem, &x, &z);
    return GetMetatileBehavior(fieldSystem, x, z);
}

static u8 GetFacingMetatileBehavior(FieldSystem *fieldSystem) {
    u32 x, z;
    PlayerAvatar_GetFacingTileCoords(fieldSystem, &x, &z);
    return GetMetatileBehavior(fieldSystem, x, z);
}

static u8 ov01_021E7B70(FieldSystem *fieldSystem) {
    u32 x, z;
    PlayerAvatar_GetFacingTileCoords(fieldSystem, &x, &z);
    return sub_020548C0(fieldSystem, x, z);
}

static BOOL ov01_021E7B90(FieldSystem *fieldSystem, int x, int z, Location *location) {
    int warpIndex = Field_GetWarpEventAtXYPos(fieldSystem, x, z);
    if (warpIndex == -1) {
        return FALSE;
    }

    const WARP_EVENT *warp = Field_GetWarpEventI(fieldSystem, warpIndex);
    if (warp == NULL) {
        return FALSE;
    }

    u16 anchor = warp->anchor;
    if (anchor == 0x100) {
        GF_ASSERT(warp->header == 0xFFF);
        *location = *LocalFieldData_GetDynamicWarp(Save_LocalFieldData_Get(fieldSystem->saveData));
    } else {
        u32 z_ = warp->z;
        u32 x_ = warp->x;
        location->mapId = warp->header;
        location->warpId = anchor;
        location->x = x_;
        location->y = z_;
        location->direction = DIR_SOUTH;
    }

    Location *entrance = LocalFieldData_GetEntrancePosition(Save_LocalFieldData_Get(fieldSystem->saveData));
    u32 direction = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    entrance->mapId = fieldSystem->location->mapId;
    entrance->warpId = warpIndex;
    entrance->x = x;
    entrance->y = z;
    entrance->direction = direction;
    return TRUE;
}

static void ov01_021E7C28(FieldSystem *fieldSystem, u32 x, u32 z, u32 direction) {
    Location *spawn = LocalFieldData_GetSpecialSpawnWarpPtr(Save_LocalFieldData_Get(fieldSystem->saveData));
    *spawn = *fieldSystem->location; // redundant copy, everything is overwritten below

    spawn->direction = direction;
    spawn->x = x;
    spawn->y = z;
    if (direction == DIR_NORTH) {
        spawn->y++;
    }
    spawn->mapId = fieldSystem->location->mapId;
    spawn->warpId = -1;
}

static void ov01_021E7C70(FieldSystem *fieldSystem) {
    Location location;
    u32 x, z;

    PlayerAvatar_GetStandingTileCoords(fieldSystem, &x, &z);
    if (ov01_021E7B90(fieldSystem, x, z, &location)) {
        if (MapHeader_MapIsOnMainMatrix(fieldSystem->location->mapId) == TRUE && MapHeader_MapIsOnMainMatrix(location.mapId) == FALSE) {
            ov01_021E7C28(fieldSystem, x, z, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
        }
    } else {
        PlayerAvatar_GetFacingTileCoords(fieldSystem, &x, &z);
        if (ov01_021E7B90(fieldSystem, x, z, &location) && MapHeader_MapIsOnMainMatrix(fieldSystem->location->mapId) == TRUE && MapHeader_MapIsOnMainMatrix(location.mapId) == FALSE) {
            ov01_021E7C28(fieldSystem, x, z, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
        }
    }
}

#ifdef NONMATCHING
// https://decomp.me/scratch/WIAtR
static int ov01_021E7D00(UnkStruct_021E7D00 *a0, int x, int z) {
    int i;
    int ret;
    int x_;
    int z_;

    ret = -1;
    i = 0;
    x_ = x % 32;
    z_ = z % 32;

    for (; i < a0->unk2 / 8; i++) {
        if (a0->unk4[i].unk4 <= x_ && x_ <= a0->unk4[i].unk6 && a0->unk4[i].unk5 <= z_ && z_ <= a0->unk4[i].unk7) {
            ret = i;
        }
    }

    return ret;
}
#else
// clang-format off
asm int ov01_021E7D00(UnkStruct_021E7D00 *a0, int x, int z) {
	push {r3, r4, r5, r6}
	add r5, r0, #0
	lsr r4, r1, #0x1f
	lsl r0, r1, #0x1b
	sub r0, r0, r4
	mov r6, #0x1b
	ror r0, r6
	add r1, r4, r0
	lsr r4, r2, #0x1f
	lsl r0, r2, #0x1b
	sub r0, r0, r4
	ror r0, r6
	add r2, r4, r0
	ldrh r4, [r5, #2]
	mov r3, #0
	mvn r3, r3
	lsr r4, r4, #3
	mov r0, #0
	cmp r4, #0
	ble _021E7D50
	add r4, r5, #0
_021E7D2A:
	ldrb r6, [r4, #8]
	cmp r6, r1
	bgt _021E7D44
	ldrb r6, [r4, #0xa]
	cmp r1, r6
	bgt _021E7D44
	ldrb r6, [r4, #9]
	cmp r6, r2
	bgt _021E7D44
	ldrb r6, [r4, #0xb]
	cmp r2, r6
	bgt _021E7D44
	add r3, r0, #0
_021E7D44:
	ldrh r6, [r5, #2]
	add r0, r0, #1
	add r4, #8
	lsr r6, r6, #3
	cmp r0, r6
	blt _021E7D2A
_021E7D50:
	add r0, r3, #0
	pop {r3, r4, r5, r6}
	bx lr
}
// clang-format on
#endif

extern const u16 ov01_022063BC[16][2];

static BOOL ov01_021E7D58(FieldSystem *fieldSystem, UnkStruct_021E7D00 *a1, int a2) {
    SaveVarsFlags *varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    u16 seq = ov01_022063BC[a1->unk4[a2].unk0][0];
    Location *position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(fieldSystem->saveData));
    if (position->mapId == MAP_CIANWOOD_GYM && CheckDisabledCianwoodWaterfall(varsFlags) && seq == SEQ_SE_GS_N_TAKI) {
        return FALSE;
    }
    if (position->mapId == MAP_VERMILION_GYM && CheckSolvedLtSurgeGym(varsFlags) && seq == SEQ_SE_GS_DENGEKIBARIA) {
        return FALSE;
    }
    if (CheckBattledSnorlax(varsFlags) == TRUE && seq == SEQ_SE_GS_KABIGON_IBIKI) {
        return FALSE;
    }
    if (CheckBattledRedGyarados(varsFlags) && seq == SEQ_SE_GS_N_MOTER) {
        return FALSE;
    }
    return TRUE;
}

static void ov01_021E7DFC(FieldSystem *fieldSystem, u32 x, u32 z) {
    static const u8 ov01_02206388[] = {
        0x60, 0x40, 0x20
    };

    static const u8 ov01_0220638C[16][3] = {
        { 0x40, 0x60, 0x7F },
        { 0x2E, 0x60, 0x7F },
        { 0x2E, 0x60, 0x7F },
        { 0x40, 0x60, 0x7F },
        { 0x2E, 0x40, 0x60 },
        { 0x40, 0x60, 0x6C },
        { 0x2E, 0x60, 0x6C },
        { 0x2E, 0x60, 0x7F },
        { 0x2E, 0x60, 0x7F },
        { 0x2E, 0x60, 0x7F },
        { 0x2E, 0x60, 0x7F },
        { 0x2E, 0x48, 0x6C },
        { 0x2E, 0x60, 0x7F },
        { 0x2E, 0x60, 0x7F },
        { 0x40, 0x60, 0x7F },
        { 0x2E, 0x60, 0x7F },
    };

    UnkStruct_021E7D00 *pUVar1 = sub_02054874(fieldSystem, x, z);
    if (fieldSystem->unkC4 == -2) {
        fieldSystem->unkC4 = -1;
    } else if (fieldSystem->unkC4 == -3) {
        fieldSystem->unkC4 = -1;
    }

    int iVar2 = ov01_021E7D00(pUVar1, x, z);
    if (iVar2 != -1) {
        if (ov01_021E7D58(fieldSystem, pUVar1, iVar2)) {
            if (pUVar1->unk4[iVar2].unk0 < 16) {
                u16 seq = ov01_022063BC[pUVar1->unk4[iVar2].unk0][0];
                if (fieldSystem->unkC4 != seq) {
                    if (ov01_022063BC[pUVar1->unk4[iVar2].unk0][1] == 1) {
                        sub_02006088(seq);
                    } else {
                        PlaySE(seq);
                    }
                }
                fieldSystem->unkC4 = ov01_022063BC[pUVar1->unk4[iVar2].unk0][0];
                if (pUVar1->unk4[iVar2].unk1 < NELEMS(ov01_02206388)) {
                    GF_SndHandleMoveVolume(0, ov01_02206388[pUVar1->unk4[iVar2].unk1], 15);
                    int index = pUVar1->unk4[iVar2].unk1;
                    GF_SndHandleMoveVolume(5, ov01_0220638C[pUVar1->unk4[iVar2].unk0][pUVar1->unk4[iVar2].unk1], 5);
                }
            } else {
                GF_ASSERT(iVar2 < 16);
            }
        }
    } else {
        int seq = fieldSystem->unkC4;
        if (seq != -1) {
            StopSE(seq, 10);
            GF_SndHandleMoveVolume(0, 0x80, 15);
            fieldSystem->unkC4 = -1;
        }
    }
}

void ov01_021E7F00(FieldSystem *fieldSystem, BOOL a1) {
    if (fieldSystem->unkAC == 0) {
        u32 x = GetPlayerXCoord(fieldSystem->playerAvatar);
        u32 z = GetPlayerZCoord(fieldSystem->playerAvatar);
        if (a1) {
            fieldSystem->unkC4 = -1;
        }
        ov01_021E7DFC(fieldSystem, x, z);
    }
}

static u16 ov01_021E7F38(FieldSystem *fieldSystem) {
    if (FieldSystem_FacingModelIsHeadbuttTree(fieldSystem)) {
        return std_field_headbutt;
    }
    return 0xFFFF;
}

u32 ov01_021E7F54(FieldSystem *fieldSystem) {
    LocalMapObject *facingObject;
    if (sub_0203DC64(fieldSystem, &facingObject) == TRUE) {
        u32 type = MapObject_GetType(facingObject);
        switch (type) {
        case 3:
            return 0;
        case 0:
            return 1;
        default:
            return 1;
        }
    }
    if (GetInteractedBackgroundEventScript(fieldSystem, Field_GetBgEvents(fieldSystem), Field_GetNumBgEvents(fieldSystem)) != 0xFFFF) {
        return 2;
    }
    return 0;
}

BOOL FieldSystem_FacingModelIsHeadbuttTree(FieldSystem *fieldSystem) {
    u32 x, z;
    PlayerAvatar_GetFacingTileCoords(fieldSystem, &x, &z);
    return MapModel_IsHeadbuttTree(GetMapModelNo(MapCoordToMatrixIndex(fieldSystem, x, z), fieldSystem->mapMatrix)) != FALSE;
}
