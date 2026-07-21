#include "overlay_01.h"
#include "overlay_01_021F1AFC.h"
#include "overlay_01_021F3114.h"
#include "overlay_01_021F6830.h"
#include "overlay_01_021FB5D4.h"
#include "field/field_control.h"
#include "field/encounter_check.h"
#include "overlay_2/event_cutscene.h"
#include "overlay_2/overlay_02_gear_phone.h"
#include "overlay_2/overlay_02_02248728.h"
#include "overlay_04.h"

#include "bug_contest_internal.h"
#include "catching_show.h"
#include "encounter.h"
#include "field_warp_tasks.h"
#include "follow_mon.h"
#include "game_stats.h"
#include "get_egg.h"
#include "gymmick.h"
#include "gymmick_init.h"
#include "map_events.h"
#include "map_header.h"
#include "map_matrix.h"
#include "map_object.h"
#include "menu_input_state.h"
#include "metatile_behavior.h"
#include "player_avatar.h"
#include "safari_zone.h"
#include "save_pokegear.h"
#include "script_pokemon_util.h"
#include "sound_02004A44.h"
#include "start_menu.h"
#include "sys_flags.h"
#include "sys_vars.h"
#include "unk_02005D10.h"
#include "unk_02031B0C.h"
#include "unk_02032844.h"
#include "unk_02034354.h"
#include "unk_02035900.h"
#include "unk_02037C94.h"
#include "unk_0203DB6C.h"
#include "unk_02054648.h"
#include "unk_02054E00.h"
#include "unk_02055BF0.h"
#include "unk_02058034.h"
#include "unk_02058AEC.h"
#include "unk_0205A44C.h"
#include "unk_0205CB48.h"
#include "unk_020632B0.h"
#include "unk_0206D494.h"

#include "constants/field_poison.h"
#include "constants/game_stats.h"
#include "constants/global_fieldmap.h"
#include "constants/maps.h"
#include "constants/movements.h"
#include "constants/moves.h"
#include "constants/player_avatar.h"
#include "constants/std_script.h"

#include "global.h"

static BOOL FieldSystem_CheckSign(FieldSystem *fieldSystem);
static u16 GetInteractedMetatileScript(FieldSystem *fieldSystem, u8 metatileBehavior);
static BOOL FieldSystem_ProcessStep(FieldSystem *fieldSystem);
static BOOL FieldSystem_CheckWildEncounter(FieldSystem *fieldSystem);
static BOOL FieldSystem_CheckMapTransition(FieldSystem *fieldSystem, FieldInput *fieldInput);
static BOOL FieldSystem_CheckCoordEvent(FieldSystem *fieldSystem);
static BOOL FieldSystem_CheckTransition(FieldSystem *fieldSystem, int x, int z, u8 metatileBehavior);
static BOOL FieldSystem_UpdateDaycare(FieldSystem *fieldSystem);
static BOOL FieldSystem_UpdateRepel(FieldSystem *fieldSystem);
static BOOL FieldSystem_UpdateFriendship(FieldSystem *fieldSystem);
static void FieldSystem_CalculateFriendship(FieldSystem *fieldSystem);
static BOOL FieldSystem_UpdatePoison(FieldSystem *fieldSystem);
static BOOL FieldSystem_UpdateSafari(FieldSystem *fieldSystem);
static BOOL FieldSystem_UpdateBikeShop(FieldSystem *fieldSystem);
static BOOL FieldSystem_UpdateBugContest(FieldSystem *fieldSystem);
static void ov01_021E7A98(FieldSystem *fieldSystem);
static void PlayerAvatar_GetStandingTileCoords(FieldSystem *fieldSystem, int *x, int *z);
static void PlayerAvatar_GetFacingTileCoords(FieldSystem *fieldSystem, int *x, int *z);
static void ShiftFieldCoordsByCompassDirection(FieldSystem *fieldSystem, u32 facingDirection, int *x, int *z);
static u8 FieldSystem_CurrentMetatileBehavior(FieldSystem *fieldSystem);
static u8 FieldSystem_FacingMetatileBehavior(FieldSystem *fieldSystem);
static u8 ov01_021E7B70(FieldSystem *fieldSystem);
static BOOL FieldSystem_MapConnection(FieldSystem *fieldSystem, int x, int z, Location *location);
static void FieldSystem_SetMapConnection(FieldSystem *fieldSystem, int x, int z, int facingDirection);
static void FieldSystem_TrySetMapConnection(FieldSystem *fieldSystem);
static void ov01_021E7DFC(FieldSystem *fieldSystem, int x, int z);
static u16 GetInteractedHeadbuttTreeScript(FieldSystem *fieldSystem);

static void FieldInput_Clear(FieldInput *fieldInput) {
    fieldInput->interact = 0;
    fieldInput->endMovement = 0;
    fieldInput->menu = 0;
    fieldInput->registeredItem = 0;
    fieldInput->sign = 0;
    fieldInput->mapTransition = 0;
    fieldInput->movement = 0;
    fieldInput->unk0_8 = 0;
    fieldInput->unk0_9 = 0;
    fieldInput->unk0_A = 0;
    fieldInput->unk0_B = 0;
    fieldInput->unk0_C = 0;
    fieldInput->unk0_D = 0;
    fieldInput->playerDir = DIR_NONE;
    fieldInput->transitionDir = DIR_NONE;
}

static BOOL ov01_021E690C(FieldSystem *fieldSystem) {
    return ov01_021F6B10(fieldSystem) == TRUE;
}

static void ov01_021F6B64_thunk(FieldSystem *fieldSystem, int arg1) {
    ov01_021F6B64(fieldSystem, arg1);
}

void FieldInput_Update(FieldInput *fieldInput, FieldSystem *fieldSystem, u16 newKeys, u16 heldKeys) {
    FieldInput_Clear(fieldInput);

    if (PlayerAvatar_CheckRunningShoesLock(FieldSystem_GetPlayerAvatar(fieldSystem))) {
        heldKeys |= PAD_BUTTON_B;
    }

    u32 moveState = PlayerAvatar_GetPlayerMoveState(fieldSystem->playerAvatar);
    u32 avatarMoveState = PlayerAvatar_GetMoveState(fieldSystem->playerAvatar);
    u32 facingDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);

    fieldInput->newKeys = newKeys;
    fieldInput->heldKeys = heldKeys;

    BOOL shouldDrawBagIcon = FieldSystem_ShouldDrawStartMenuIcon(fieldSystem, START_MENU_ICON_BAG);

    if (moveState == PLAYER_MOVE_STATE_END || moveState == PLAYER_MOVE_STATE_NONE) {
        if (shouldDrawBagIcon && (newKeys & PAD_BUTTON_Y) || fieldSystem->lastTouchMenuInput == 9) {
            if (ov01_021E690C(fieldSystem) == TRUE) {
                fieldInput->registeredItem = 1;
                fieldSystem->lastTouchMenuInput = 0;
            }
        } else if (fieldSystem->lastTouchMenuInput == 10) {
            if (ov01_021E690C(fieldSystem) == TRUE) {
                fieldInput->registeredItem = 2;
                fieldSystem->lastTouchMenuInput = 0;
            }
        } else if (fieldSystem->lastTouchMenuInput == 11) {
            fieldInput->unk0_9 = TRUE;
            fieldSystem->lastTouchMenuInput = 0;
        } else if (newKeys & PAD_BUTTON_X || fieldSystem->lastTouchMenuInput) {
            if (ov01_021F6B00(fieldSystem) == 4) {
                MenuInputStateMgr_SetState(&fieldSystem->menuInputState, MENU_INPUT_STATE_BUTTONS);
                fieldInput->unk0_9 = TRUE;
                fieldInput->menu = TRUE;
            } else if (shouldDrawBagIcon) {
                fieldInput->menu = TRUE;
                if (fieldSystem->lastTouchMenuInput == 1) {
                    fieldSystem->lastTouchMenuInput = 0;
                }
            }
        } else if (newKeys & PAD_BUTTON_A) {
            fieldInput->interact = TRUE;
        }
        if (PAD_PLUS_KEY_MASK & heldKeys) {
            fieldInput->sign = TRUE;
            fieldInput->mapTransition = TRUE;
        }
        fieldInput->unk0_8 = TRUE;
    } else {
        fieldSystem->lastTouchMenuInput = 0;
    }
    
    if (moveState == PLAYER_MOVE_STATE_END && avatarMoveState == AVATAR_MOVE_STATE_MOVING) {
        fieldInput->movement = TRUE;
    }
    if (moveState == PLAYER_MOVE_STATE_END) {
        fieldInput->endMovement = TRUE;
    }

    if (facingDirection == DIR_NORTH && (PAD_KEY_UP & heldKeys)
    || facingDirection == DIR_SOUTH && (PAD_KEY_DOWN & heldKeys)
    || facingDirection == DIR_WEST && (PAD_KEY_LEFT & heldKeys)
    || facingDirection == DIR_EAST && (PAD_KEY_RIGHT & heldKeys)) {
        fieldInput->transitionDir = facingDirection;
    } else {
        fieldInput->transitionDir = DIR_NONE;
    }
    
    fieldInput->playerDir = sub_0205DD94(fieldSystem->playerAvatar, newKeys, heldKeys);
}

int FieldInput_Process(FieldInput *fieldInput, FieldSystem *fieldSystem) {
    if (fieldInput->unk0_D == FALSE && TryStartMapScriptByType(fieldSystem, 1) == TRUE) { // 1 is INIT_SCRIPT_ON_FRAME_TABLE in pokeplatinum.
        return 1;
    }
    
    if (fieldInput->unk0_D == FALSE) {
        BOOL doublesEligible = HasEnoughAlivePokemonForDoubleBattle(SaveArray_Party_Get(fieldSystem->saveData));
        if (Save_VarsFlags_CheckHaveFollower(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) { // Never true in HGSS, but the capability was not removed.
            doublesEligible = TRUE;
        }
        
        if (TryGetSeenByNpcTrainers(fieldSystem, doublesEligible) == TRUE) {
            sub_0205CF44(fieldSystem->playerAvatar);
            MapObjectManager_PauseAllMovement(fieldSystem->mapObjectManager);
            if (FollowMon_IsActive(fieldSystem)) {
                MapObject_UnpauseMovement(FollowMon_GetMapObject(fieldSystem));
            }
            return 1;
        }
    }
    
    if (fieldInput->movement) {
        Save_VarsFlags_ClearStepTakenFlag(Save_VarsFlags_Get(fieldSystem->saveData));
        if (FieldSystem_ProcessStep(fieldSystem) == TRUE) {
            return 1;
        }
    }
    
    if (FieldSystem_UpdateBugContest(fieldSystem)) {
        return 1;
    }
    
    int playerEvent = PLAYER_EVENT_NONE;
    int direction = sub_0205DD94(fieldSystem->playerAvatar, fieldInput->newKeys, fieldInput->heldKeys);
    
    if (StrengthFlagAction(Save_VarsFlags_Get(fieldSystem->saveData), 2)) {
        playerEvent |= PLAYER_EVENT_USED_STRENGTH;
    }
    
    if (GetIdxOfFirstPartyMonWithMove(SaveArray_Party_Get(fieldSystem->saveData), MOVE_WATERFALL) != 0xFF) {
        playerEvent |= PLAYER_EVENT_USED_WATERFALL;
    }
    
    if (ov01_021F1D94(fieldSystem, fieldSystem->playerAvatar, direction, playerEvent) == TRUE) {
        return 1;
    }
    
    if (fieldInput->endMovement) {
        if (FieldSystem_CheckWildEncounter(fieldSystem)) {
            return 1;
        }
        if (FieldSystem_CheckSign(fieldSystem) == TRUE) {
            return 1;
        }
    }

    if (fieldInput->sign
        && fieldInput->playerDir == PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar)
        && FieldSystem_CheckSign(fieldSystem) == TRUE) {
        return 1;
    }
    
    if (fieldInput->interact) {
        LocalMapObject* mapObject;
        if (sub_0203DC64(fieldSystem, &mapObject) == TRUE) {
            if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
                sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
            }
            if (MapObject_GetType(mapObject) != 9) {
                StartMapSceneScript(fieldSystem, MapObject_GetScriptID(mapObject), mapObject);
            } else {
                StartMapSceneScript(fieldSystem, 0, mapObject);
            }
            fieldSystem->lastTouchMenuInput = 0;
            return 1;
        }

        u32 bgEventScript = GetInteractedBackgroundEventScript(fieldSystem, Field_GetBgEvents(fieldSystem), Field_GetNumBgEvents(fieldSystem));
        if (bgEventScript != 0xFFFF) {
            StartMapSceneScript(fieldSystem, bgEventScript, NULL);
            fieldSystem->lastTouchMenuInput = 0;
            return 1;
        }
        u32 metatileScript = GetInteractedMetatileScript(fieldSystem, FieldSystem_FacingMetatileBehavior(fieldSystem));
        if (metatileScript != 0xFFFF) {
            StartMapSceneScript(fieldSystem, metatileScript, NULL);
            fieldSystem->lastTouchMenuInput = 0;
            return 1;
        }
        u32 headbuttScript = GetInteractedHeadbuttTreeScript(fieldSystem);
        if (headbuttScript != 0xFFFF) {
            StartMapSceneScript(fieldSystem, headbuttScript, NULL);
            fieldSystem->lastTouchMenuInput = 0;
            return 1;
        }
    }
    
    if (fieldInput->mapTransition && FieldSystem_CheckMapTransition(fieldSystem, fieldInput) == TRUE) {
        FieldSystem_TrySetMapConnection(fieldSystem);
        return 1;
    }
    
    if (fieldInput->registeredItem) {
        u32 registeredItemResult = UseRegisteredItemButtonInField(fieldSystem, fieldInput->registeredItem);
        if (registeredItemResult) {
            ov01_021F6B64_thunk(fieldSystem, fieldInput->registeredItem);
            return registeredItemResult;
        }
    }
    
    if (fieldInput->menu && FieldSystem_MapIsNotMysteryZone(fieldSystem) == TRUE) {
        PlaySE(SEQ_SE_DP_WIN_OPEN);
        StartMenu_Init(fieldSystem);
        return 2;
    }
    
    if (ov02_02252334(fieldSystem)) {
        StartMapSceneScript(fieldSystem, std_revert_shaymin, NULL);
        return 1;
    }

    if (fieldInput->unk0_9) {
        ov01_021F6A9C(fieldSystem, 0, 0);
        return 2;
    }
    
    if (fieldInput->unk0_8 && ov02_02251F20(FieldSystem_GetGearPhoneRingManager(fieldSystem))) {
        return 2;
    }

    return 0;
}

static BOOL FieldSystem_CheckSign(FieldSystem *fieldSystem) {
    u32 script = sub_0203DDA4(fieldSystem, Field_GetBgEvents(fieldSystem), Field_GetNumBgEvents(fieldSystem));
    if (script != 0xFFFF) {
        StartMapSceneScript(fieldSystem, script, NULL);
        return TRUE;
    }
    return FALSE;
}

BOOL FieldInput_Process_Colosseum(FieldInput *input, FieldSystem *fieldSystem) {
    if (input->mapTransition
        && input->transitionDir == DIR_SOUTH
        && MetatileBehavior_IsWarpEntranceSouth(FieldSystem_CurrentMetatileBehavior(fieldSystem))) {
        StartMapSceneScript(fieldSystem, std_colosseum_exit, NULL);
        return TRUE;
    }

    if (sub_02037958() || sub_02057F18(sub_0203769C()) || !sub_02058740()) {
        return FALSE;
    }

    if (input->interact) {
        LocalMapObject *facingObject;
        if (sub_0203DC64(fieldSystem, &facingObject) == TRUE && MapObject_GetMovement(facingObject) != MOVEMENT_FACE_DOWN) {
            if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
                sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
            }
            StartMapSceneScript(fieldSystem, MapObject_GetScriptID(facingObject), facingObject);
            return TRUE;
        }
    }

    if (input->interact) {
        sub_02059D44(fieldSystem);
        return TRUE;
    }

    if (input->menu) {
        PlaySE(SEQ_SE_DP_WIN_OPEN);
        sub_0203BD20(fieldSystem); // StartMenu_OpenColosseum?
        return TRUE;
    }

    return FALSE;
}

static BOOL ov01_021E6ED8() { // CheckTrainerInfo?
    int i;
    int ret = 0;
    for (i = 1; i < 5; i++) {
        if (sub_02034818(i)) { // CommInfo_TrainerInfo?
            ret++;
        }
    }
    return ret >= 1;
}

BOOL FieldInput_Process_UnionRoom(FieldInput *input, FieldSystem *fieldSystem) {
    if (sub_02033250() & 0xFE) { // WirelessManager_GetConnectedBitmap?
        if (ov01_021E6ED8() && sub_02037454() > 1) { // sub_02037454 == CommSys_ConnectedCount?
            StartMapSceneScript(fieldSystem, 5, NULL);
            return TRUE;
        }
        return FALSE;
    }

    LocalMapObject *mapObject;
    if (input->interact && sub_0203DC64(fieldSystem, &mapObject) == TRUE) {
        if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
            sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
        }
        sub_020380B0(); // CommManager_PauseUnionClient?
        StartMapSceneScript(fieldSystem, MapObject_GetScriptID(mapObject), mapObject);
        return TRUE;
    }

    if (input->movement && MetatileBehavior_IsWarpPanel(FieldSystem_CurrentMetatileBehavior(fieldSystem))) {
        sub_02053F14(fieldSystem);
        return TRUE;
    }

    if (input->menu && sub_02037454() <= 1 && ov01_021E690C(fieldSystem)) {
        PlaySE(SEQ_SE_DP_WIN_OPEN);
        sub_0203BCDC(fieldSystem); // StartMenu_OpenUnionRoom?
        sub_0205A904(4);
        sub_020380CC(); // CommManager_PauseUnionServer?
        return TRUE;
    }
    return FALSE;
}

int FieldInput_Process_BattleTower(FieldInput *fieldInput, FieldSystem *fieldSystem) {
    if (fieldInput->unk0_D == FALSE && TryStartMapScriptByType(fieldSystem, 1) == TRUE) {
        return 1;
    }

    if (fieldInput->interact) {
        LocalMapObject *mapObject;
        if (sub_0203DC64(fieldSystem, &mapObject) == TRUE) {
            if (sub_0205CF60(fieldSystem->playerAvatar) == TRUE) {
                sub_0205CFBC(fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
            }

            if (MapObject_GetType(mapObject) != 9) {
                StartMapSceneScript(fieldSystem, MapObject_GetScriptID(mapObject), mapObject);
            } else {
                StartMapSceneScript(fieldSystem, 0, mapObject);
            }
            return 1;
        }

        BG_EVENT *bgEvents = Field_GetBgEvents(fieldSystem);
        u32 bgEventScript = GetInteractedBackgroundEventScript(fieldSystem, bgEvents, Field_GetNumBgEvents(fieldSystem));
        if (bgEventScript != 0xFFFF) {
            StartMapSceneScript(fieldSystem, bgEventScript, NULL);
            return 1;
        }

        u32 metatileScript = GetInteractedMetatileScript(fieldSystem, FieldSystem_FacingMetatileBehavior(fieldSystem));
        if (metatileScript != 0xFFFF) {
            StartMapSceneScript(fieldSystem, metatileScript, NULL);
            return 1;
        }
    }

    if (fieldInput->mapTransition && FieldSystem_CheckMapTransition(fieldSystem, fieldInput) == TRUE) {
        return 1;
    }

    if (fieldInput->registeredItem) {
        int registeredItemResult = UseRegisteredItemButtonInField(fieldSystem, fieldInput->registeredItem);
        if (registeredItemResult) {
            ov01_021F6B64_thunk(fieldSystem, fieldInput->registeredItem);
            return registeredItemResult;
        }
    }

    if (fieldInput->menu) {
        PlaySE(SEQ_SE_DP_WIN_OPEN);
        StartMenu_Init(fieldSystem);
        return 1;
    }
    return 0;
}

static BOOL FieldSystem_CheckWildEncounter(FieldSystem *fieldSystem) {
    if (fieldSystem->encounterInhibitSteps < 0xFFFF) {
        fieldSystem->encounterInhibitSteps++;
    }
    
    int x, z;
    PlayerAvatar_GetStandingTileCoords(fieldSystem, &x, &z);
    
    if (Save_VarsFlags_CheckPalParkSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == TRUE) {
        if (CatchingShow_CheckWildEncounter(fieldSystem, x, z) == TRUE) {
            sub_020511F8(fieldSystem, CatchingShow_GetBattleDataTransfer(fieldSystem)); // Encounter_NewVsPalParkTransfer?
            return TRUE;
        }
        return FALSE;
    }
    
    return (MapHeader_HasWildEncounters(fieldSystem->location->mapId) && FieldSystem_PerformLandOrSurfEncounterCheck(fieldSystem) == TRUE);
}

static BOOL FieldSystem_CheckMapTransition(FieldSystem *fieldSystem, FieldInput *fieldInput) {
    if (fieldInput->transitionDir == DIR_NONE) {
        return FALSE;
    }
    
    int x, z;
    Location nextMap;
    PlayerAvatar_GetStandingTileCoords(fieldSystem, &x, &z);
    u8 metatileBehavior = GetMetatileBehavior(fieldSystem, x, z);
    
    if (MetatileBehavior_IsLadderNorth(metatileBehavior)) {
        if (fieldInput->transitionDir == DIR_NORTH && FieldSystem_MapConnection(fieldSystem, x, z, &nextMap)) {
            NewFieldTransitionEnvironment(fieldSystem, nextMap.mapId, nextMap.warpId, 0, 0, fieldInput->transitionDir, 7);
            return TRUE;
        }
        return FALSE;
    } else if (MetatileBehavior_IsLadderSouth(metatileBehavior)) {
        if (fieldInput->transitionDir == DIR_SOUTH && FieldSystem_MapConnection(fieldSystem, x, z, &nextMap)) {
            NewFieldTransitionEnvironment(fieldSystem, nextMap.mapId, nextMap.warpId, 0, 0, fieldInput->transitionDir, 7);
            return TRUE;
        }
        return FALSE;
    }
    
    PlayerAvatar_GetFacingTileCoords(fieldSystem, &x, &z);

    if (sub_020548C0(fieldSystem, x, z) == FALSE) { // TerrainCollisionManager_CheckCollision?
        return FALSE;
    }
    
    if (FieldSystem_MapConnection(fieldSystem, x, z, &nextMap) && fieldInput->transitionDir != DIR_NONE) {
        metatileBehavior = GetMetatileBehavior(fieldSystem, x, z);

        if (MetatileBehavior_IsDoor(metatileBehavior)) {
            NewFieldTransitionEnvironment(fieldSystem, nextMap.mapId, nextMap.warpId, 0, 0, fieldInput->transitionDir, 1);
            return TRUE;
        }
    }
    
    PlayerAvatar_GetStandingTileCoords(fieldSystem, &x, &z);
    metatileBehavior = GetMetatileBehavior(fieldSystem, x, z);

    if (MetatileBehavior_IsWarpEntranceEast(metatileBehavior) || MetatileBehavior_IsWarpEast(metatileBehavior)) {
        if (fieldInput->transitionDir != DIR_EAST) {
            return FALSE;
        }
    } else if (MetatileBehavior_IsWarpEntranceWest(metatileBehavior) || MetatileBehavior_IsWarpWest(metatileBehavior)) {
        if (fieldInput->transitionDir != DIR_WEST) {
            return FALSE;
        }
    } else if (MetatileBehavior_IsWarpEntranceSouth(metatileBehavior) || MetatileBehavior_IsWarpSouth(metatileBehavior)) {
        if (fieldInput->transitionDir != DIR_SOUTH) {
            return FALSE;
        }
    } else if (MetatileBehavior_IsWarpStairsEast(metatileBehavior)) {
        if (fieldInput->transitionDir != DIR_EAST) {
            return FALSE;
        }
    } else if (MetatileBehavior_IsWarpStairsWest(metatileBehavior)) {
        if (fieldInput->transitionDir != DIR_WEST) {
            return FALSE;
        }
    }

    if (FieldSystem_MapConnection(fieldSystem, x, z, &nextMap) == FALSE) {
        return FALSE;
    }
    
    u32 transNo;
    if (MetatileBehavior_IsDoor(metatileBehavior)) {
        transNo = 1;
    } else if (MetatileBehavior_IsWarpStairsEast(metatileBehavior)) {
        transNo = 3;
    } else if (MetatileBehavior_IsWarpStairsWest(metatileBehavior)) {
        transNo = 3;
    } else if (MetatileBehavior_IsWarpEntranceEast(metatileBehavior) || MetatileBehavior_IsWarpEast(metatileBehavior)
        || MetatileBehavior_IsWarpEntranceWest(metatileBehavior) || MetatileBehavior_IsWarpWest(metatileBehavior)
        || MetatileBehavior_IsWarpEntranceSouth(metatileBehavior) || MetatileBehavior_IsWarpSouth(metatileBehavior)) {
        sub_02055CD8(fieldSystem, nextMap.mapId, nextMap.warpId, 0, 0, fieldInput->transitionDir);
        return TRUE;
    } else {
        return FALSE;
    }
    NewFieldTransitionEnvironment(fieldSystem, nextMap.mapId, nextMap.warpId, 0, 0, fieldInput->transitionDir, transNo);
    return TRUE;
}

static u16 GetInteractedMetatileScript(FieldSystem *fieldSystem, u8 metatileBehavior) {
    int facingDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    u32 standingTile = GetMetatileBehavior(fieldSystem, PlayerAvatar_GetXCoord(fieldSystem->playerAvatar), PlayerAvatar_GetZCoord(fieldSystem->playerAvatar));
    if (sub_0205B78C(standingTile)) {
        return 0xFFFF;
    } else if (MetatileBehavior_IsPC(metatileBehavior) && facingDirection == DIR_NORTH) {
        return std_pokecenter_pc;
    } else if (MetatileBehavior_IsSmallBookshelf1(metatileBehavior)) {
        return std_picture_books;
    } else if (MetatileBehavior_IsSmallBookshelf2(metatileBehavior)) {
        return std_books_for_pkmn;
    } else if (TileBehavior_IsBookshelf1(metatileBehavior)) {
        return std_chock_full;
    } else if (TileBehavior_IsBookshelf2(metatileBehavior)) {
        return std_magazines;
    } else if (MetatileBehavior_IsEmptyTrashCan(metatileBehavior)) {
        return std_trash_empty;
    } else if (MetatileBehavior_IsMartShelf1(metatileBehavior)) {
        return std_vibrant_pkmn_goods;
    } else if (MetatileBehavior_IsMartShelf2(metatileBehavior)) {
        return std_convenient_items;
    } else if (MetatileBehavior_IsMartShelf3(metatileBehavior)) {
        return std_pkmn_merchandise;
    } else if (MetatileBehavior_IsTownMap(metatileBehavior)) {
        return std_town_map;
    } else if (MetatileBehavior_IsTV(metatileBehavior) && facingDirection == DIR_NORTH) {
        return std_tv;
    } else if (MetatileBehavior_IsHeadbutt(metatileBehavior)) {
        return std_field_headbutt;
    } else if (MetatileBehavior_IsRockClimbInDirection(metatileBehavior, facingDirection)) {
        return std_field_rock_climb;
    } else if (PlayerAvatar_GetState(fieldSystem->playerAvatar) != 2) {
        PlayerProfile *profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
        if (Field_PlayerCanSurfOnTile(fieldSystem->playerAvatar, standingTile, metatileBehavior) && PlayerProfile_TestBadgeFlag(profile, 3) && GetIdxOfFirstPartyMonWithMove(SaveArray_Party_Get(fieldSystem->saveData), MOVE_SURF) != 0xFF) {
            return std_field_surf;
        } else if (ov02_0224E35C(fieldSystem) && ov02_0224E4CC(metatileBehavior, ov01_021E7B70(fieldSystem))) {
            return std_safari_place_object;
        }
    } else if (MetatileBehavior_IsWaterfall(metatileBehavior)) {
        return std_field_waterfall;
    } else if (MetatileBehavior_IsWhirlpool(metatileBehavior)) {
        return std_field_whirlpool;
    } else if (ov02_0224E35C(fieldSystem) && ov02_0224E4DC(metatileBehavior, ov01_021E7B70(fieldSystem))) {
        return std_safari_place_object;
    }
    
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData))) {
        if (sub_0202F620(Save_SafariZone_Get(fieldSystem->saveData)) == 0 && sub_0205BAEC(metatileBehavior)) {
            return std_safari_remove_object;
        }
    }
    
    return 0xFFFF;
}

static BOOL FieldSystem_ProcessStep(FieldSystem *fieldSystem) {
    if (FieldSystem_IsSaveGymmickTypeEqualTo(fieldSystem, GYMMICK_BLACKTHORN) && ov04_02255090(fieldSystem)) {
        return TRUE;
    } else if (ov01_021F3114(fieldSystem, fieldSystem->playerAvatar, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar)) == 1) {
        ov04_02256BE4(fieldSystem, sub_0205F504(PlayerAvatar_GetMapObject(fieldSystem->playerAvatar)));
        return TRUE;
    }
    
    int x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    int z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);

    ov01_021E7DFC(fieldSystem, x, z);

    u8 metatileBehavior = GetMetatileBehavior(fieldSystem, x, z);
    
    if (FieldSystem_CheckCoordEvent(fieldSystem) == TRUE) {
        return TRUE;
    }
    
    if (FieldSystem_CheckTransition(fieldSystem, x, z, metatileBehavior) == TRUE) {
        FieldSystem_TrySetMapConnection(fieldSystem);
        return TRUE;
    }
    
    if (PlayerAvatar_CheckForcedMovement(fieldSystem->playerAvatar)) {
        return FALSE;
    }
    
    ov01_021F6830(fieldSystem, 5, 1);
    ov01_021E7A98(fieldSystem);
    
    if (FieldSystem_UpdatePoison(fieldSystem) == TRUE) { // Returns TRUE if a mon survived poisoning.
        return TRUE;
    }
    
    if (FieldSystem_UpdateSafari(fieldSystem) == TRUE) {
        return TRUE;
    }
    
    if (FieldSystem_UpdateDaycare(fieldSystem) == TRUE) {
        return TRUE;
    }
    
    if (FieldSystem_UpdateRepel(fieldSystem) == TRUE) {
        return TRUE;
    }
    
    if (FieldSystem_UpdateBikeShop(fieldSystem) == TRUE) { // Never returns TRUE, as this is handled through the Pokegear.
        return TRUE;
    }
    
    if (FieldSystem_UpdateFriendship(fieldSystem)) {
        FieldSystem_CalculateFriendship(fieldSystem);
    }

    if (FollowMon_IsVisible(fieldSystem)) {
        FieldSystem_UnkSub108_MoveMoodTowardsNeutral(fieldSystem->unk108);
    }

    return FALSE;
}

static BOOL FieldSystem_CheckCoordEvent(FieldSystem *fieldSystem) {
    u16 script = sub_0203DE04(fieldSystem, Field_GetCoordEvents(fieldSystem), Field_GetNumCoordEvents(fieldSystem));
    if (script != 0xFFFF) {
        StartMapSceneScript(fieldSystem, script, NULL);
        return TRUE;
    }
    return FALSE;
}

static BOOL FieldSystem_CheckTransition(FieldSystem *fieldSystem, int x, int z, u8 metatileBehavior) {
    int facingDirection, dir;
    Location location;
    
    if (FieldSystem_MapConnection(fieldSystem, x, z, &location) == FALSE) {
        return FALSE;
    }
    
    if (MetatileBehavior_IsEscalatorFlipFace(metatileBehavior) == TRUE) {
        facingDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
        if (facingDirection == DIR_WEST) {
            dir = DIR_EAST;
        } else if (facingDirection == DIR_EAST) {
            dir = DIR_WEST;
        } else {
            GF_AssertFail();
            return FALSE;
        }
        NewFieldTransitionEnvironment(fieldSystem, location.mapId, location.warpId, 0, 0, dir, 2);
        return TRUE;
    } else if (MetatileBehavior_IsEscalator(metatileBehavior) == TRUE) {
        facingDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
        if (facingDirection != DIR_WEST && facingDirection != DIR_EAST) {
            GF_AssertFail();
            return FALSE;
        }
        NewFieldTransitionEnvironment(fieldSystem, location.mapId, location.warpId, 0, 0, facingDirection, 2);
        return TRUE;
    }
    
    if (MetatileBehavior_IsWarpEntranceNorth(metatileBehavior) || MetatileBehavior_IsWarpNorth(metatileBehavior)) {
        sub_02055CD8(fieldSystem, location.mapId, location.warpId, 0, 0, 0);
        return TRUE;
    }
    
    if (MetatileBehavior_IsWarpPanel(metatileBehavior)) {
        sub_02053E08(fieldSystem, location.mapId, location.warpId); // FieldSystem_StartMapChangeWarpTask
        return TRUE;
    }
    
    if (MetatileBehavior_IsLadderDown(metatileBehavior)) {
        NewFieldTransitionEnvironment(fieldSystem, location.mapId, location.warpId, 0, 0, 0, 8);
        return TRUE;
    }
    return FALSE;
}

static BOOL FieldSystem_UpdateDaycare(FieldSystem *fieldSystem) {
    Party *party = SaveArray_Party_Get(fieldSystem->saveData);
    if (HandleDaycareStep(Save_Daycare_Get(fieldSystem->saveData), party, fieldSystem) == TRUE) {
        GameStats *gameStats = Save_GameStats_Get(fieldSystem->saveData);
        GameStats_Inc(gameStats, GAME_STAT_EGGS_HATCHED);
        GameStats_AddScore(gameStats, SCORE_EVENT_HATCHED_EGG);
        StartMapSceneScript(fieldSystem, std_hatch_egg, NULL);
        return TRUE;
    }
    return FALSE;
}

static BOOL FieldSystem_UpdateRepel(FieldSystem *fieldSystem) {
    return PlayerStepEvent_RepelCounterDecrement(fieldSystem->saveData, fieldSystem);
}

static BOOL FieldSystem_UpdateFriendship(FieldSystem *fieldSystem) {
    SaveVarsFlags *varsFlags;
    BOOL ret = FALSE;
    varsFlags = Save_VarsFlags_Get(fieldSystem->saveData);
    u16 steps = Save_VarsFlags_GetFriendshipSteps(varsFlags) + 1;
    if (steps >= 128) {
        steps = 0;
        ret = TRUE;
    }
    Save_VarsFlags_SetFriendshipSteps(varsFlags, steps);
    return ret;
}

static void FieldSystem_CalculateFriendship(FieldSystem *fieldSystem) {
    int i, partySize;
    Party *party = SaveArray_Party_Get(fieldSystem->saveData);
    u16 mapID = MapHeader_GetMapSec(fieldSystem->location->mapId);
    partySize = Party_GetCount(party);
    for (i = 0; i < partySize; i++) {
        MonApplyFriendshipMod(Party_GetMonByIndex(party, i), 5, mapID);
    }
}

static BOOL FieldSystem_UpdatePoison(FieldSystem *fieldSystem) {
    Party *party = SaveArray_Party_Get(fieldSystem->saveData);
    
    u16 *stepCounter = LocalFieldData_GetPoisonStepCounter(Save_LocalFieldData_Get(fieldSystem->saveData));
    (*stepCounter)++;
    *stepCounter %= 4;
    if (*stepCounter) {
        return FALSE;
    }
    
    switch (ApplyPoisonStep(party, MapHeader_GetMapSec(fieldSystem->location->mapId))) {
    case FIELD_POISON_NONE:
        return FALSE;
    case FIELD_POISON_DAMAGE:
        FieldSystem_DoPoisonEffect(fieldSystem->unk4->unk20);
        return FALSE;
    case FIELD_POISON_SURVIVE:
        FieldSystem_DoPoisonEffect(fieldSystem->unk4->unk20);
        StartMapSceneScript(fieldSystem, std_survive_poisoning, NULL);
        return TRUE;
    default:
        return FALSE;
    }
}

static BOOL FieldSystem_UpdateSafari(FieldSystem *fieldSystem) {
    if (Save_VarsFlags_CheckSafariSysFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == FALSE) {
        return FALSE;
    }
    
    if (*LocalFieldData_GetSafariBallsCounter(Save_LocalFieldData_Get(fieldSystem->saveData)) == 0) {
        StartMapSceneScript(fieldSystem, std_safari_balls_out, NULL);
        return TRUE;
    }
    return FALSE;
}

static BOOL FieldSystem_UpdateBikeShop(FieldSystem *fieldSystem) {
    PhoneCallPersistentState *phoneCallPersistentState = SaveData_GetPhoneCallPersistentState(fieldSystem->saveData);
    if (Save_VarsFlags_CheckFlagInArray(Save_VarsFlags_Get(fieldSystem->saveData), FLAG_SYS_GOT_BIKE_SHOP_CALL) == FALSE 
    && PhoneCallPersistentState_CheckCallTriggerFlag(phoneCallPersistentState, CALL_TRIGGER_BIKE_SHOP_STEPS) == FALSE
    && GameStats_GetCapped(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_STEPS_BIKED) >= 1024) {
        sub_02092E14(FieldSystem_GetGearPhoneRingManager(fieldSystem), 2, 1);
        return FALSE;
    }
    return FALSE;
}

static BOOL FieldSystem_UpdateBugContest(FieldSystem* fieldSystem) {
    BugContest* bugContest = FieldSystem_BugContest_Get(fieldSystem);
    if (Save_VarsFlags_CheckBugContestFlag(Save_VarsFlags_Get(fieldSystem->saveData)) == 0) {
        return FALSE;
    }
    
    if (bugContest->elapsed_time >= 20) {
        StartMapSceneScript(fieldSystem, std_bug_contest_time_up, NULL);
        return TRUE;
    }
    return FALSE;
}

static void ov01_021E7A98(FieldSystem *fieldSystem) {
    u32 steps = GameStats_GetCapped(Save_GameStats_Get(fieldSystem->saveData), GAME_STAT_STEPS_WALKED);
    sub_02032058(Save_ApricornBox_Get(fieldSystem->saveData), steps);
}

static void PlayerAvatar_GetStandingTileCoords(FieldSystem *fieldSystem, int *x, int *z) {
    *x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
    *z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
}

static void PlayerAvatar_GetFacingTileCoords(FieldSystem *fieldSystem, int *x, int *z) {
    ShiftFieldCoordsByCompassDirection(fieldSystem, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar), x, z);
}

static void ShiftFieldCoordsByCompassDirection(FieldSystem *fieldSystem, u32 facingDirection, int *x, int *z) {
    PlayerAvatar_GetStandingTileCoords(fieldSystem, x, z);
    switch (facingDirection) {
        case DIR_NORTH:
            (*z)--;
            return;
        case DIR_SOUTH:
            (*z)++;
            return;
        case DIR_WEST:
            (*x)--;
            return;
        case DIR_EAST:
            (*x)++;
            return;
    }
}

static u8 FieldSystem_CurrentMetatileBehavior(FieldSystem *fieldSystem) {
    int x, z;
    PlayerAvatar_GetStandingTileCoords(fieldSystem, &x, &z);
    return GetMetatileBehavior(fieldSystem, x, z);
}

static u8 FieldSystem_FacingMetatileBehavior(FieldSystem *fieldSystem) {
    int x, z;
    PlayerAvatar_GetFacingTileCoords(fieldSystem, &x, &z);
    return GetMetatileBehavior(fieldSystem, x, z);
}

static u8 ov01_021E7B70(FieldSystem *fieldSystem) {
    int x, z;
    PlayerAvatar_GetFacingTileCoords(fieldSystem, &x, &z);
    return sub_020548C0(fieldSystem, x, z);
}

static inline void SetLocation(Location * location, int mapId, int warpId, int x, int z, int dir)
{
	location->mapId = mapId;
	location->warpId = warpId;
	location->x = x;
	location->y = z;
	location->direction = dir;
}

static BOOL FieldSystem_MapConnection(FieldSystem *fieldSystem, int x, int z, Location *location) {
    int warpNo = Field_GetWarpEventAtXYPos(fieldSystem, x, z);
    if (warpNo == -1) {
        return FALSE;
    }

    const WARP_EVENT *warpEvent = Field_GetWarpEventI(fieldSystem, warpNo);
    if (warpEvent == NULL) {
        return FALSE;
    }

    if (warpEvent->anchor == 0x100) {
        if (warpEvent->header != 0xFFF) {
            GF_AssertFail();
        }
        *location = *LocalFieldData_GetDynamicWarp(Save_LocalFieldData_Get(fieldSystem->saveData));
    } else {
        SetLocation(location, warpEvent->header, warpEvent->anchor, warpEvent->x, warpEvent->z, 1);
    }

    Location *entrance = LocalFieldData_GetEntrancePosition(Save_LocalFieldData_Get(fieldSystem->saveData));
    u32 facingDirection = PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar);
    entrance->mapId = fieldSystem->location->mapId;
    entrance->warpId = warpNo;
    entrance->x = x;
    entrance->y = z;
    entrance->direction = facingDirection;
    return TRUE;
}

static void FieldSystem_SetMapConnection(FieldSystem *fieldSystem, int x, int z, int facingDirection) {
    Location *nextMap = LocalFieldData_GetSpecialSpawnWarpPtr(Save_LocalFieldData_Get(fieldSystem->saveData));
    
    *nextMap = *fieldSystem->location;
    nextMap->direction = facingDirection;
    nextMap->x = x;
    nextMap->y = z;

    if (facingDirection == DIR_NORTH) {
        nextMap->y++;
    }

    nextMap->mapId = fieldSystem->location->mapId;
    nextMap->warpId = -1;
}

static void FieldSystem_TrySetMapConnection(FieldSystem *fieldSystem) {
    int x, z;
    PlayerAvatar_GetStandingTileCoords(fieldSystem, &x, &z);

    Location nextMap;
    if (FieldSystem_MapConnection(fieldSystem, x, z, &nextMap)) {
        if (MapHeader_MapIsOnMainMatrix(fieldSystem->location->mapId) == TRUE && MapHeader_MapIsOnMainMatrix(nextMap.mapId) == FALSE) {
            FieldSystem_SetMapConnection(fieldSystem, x, z, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
        }
    } else {
        PlayerAvatar_GetFacingTileCoords(fieldSystem, &x, &z);
        if (FieldSystem_MapConnection(fieldSystem, x, z, &nextMap) && MapHeader_MapIsOnMainMatrix(fieldSystem->location->mapId) == TRUE && MapHeader_MapIsOnMainMatrix(nextMap.mapId) == FALSE) {
            FieldSystem_SetMapConnection(fieldSystem, x, z, PlayerAvatar_GetFacingDirection(fieldSystem->playerAvatar));
        }
    }
}

static const u8 sBGMVolume[3] = {
    0x60,
    0x40,
    0x20
};

static const u8 sSoundplateVolume[16][3] = {
    {0x40, 0x60, 0x7F},
    {0x2E, 0x60, 0x7F},
    {0x2E, 0x60, 0x7F},
    {0x40, 0x60, 0x7F},
    {0x2E, 0x40, 0x60},
    {0x40, 0x60, 0x6C},
    {0x2E, 0x60, 0x6C},
    {0x2E, 0x60, 0x7F},
    {0x2E, 0x60, 0x7F},
    {0x2E, 0x60, 0x7F},
    {0x2E, 0x60, 0x7F},
    {0x2E, 0x48, 0x6C},
    {0x2E, 0x60, 0x7F},
    {0x2E, 0x60, 0x7F},
    {0x40, 0x60, 0x7F},
    {0x2E, 0x60, 0x7F}
};

enum SoundplateSoundParams {
    SOUNDPLATE_SOUND_SEQ = 0,
    SOUNDPLATE_SOUND_UNK_BOOL,
    SOUNDPLATE_SOUND_PARAMS
};

static const u16 sSoundplateSounds[16][SOUNDPLATE_SOUND_PARAMS] = {
    { SEQ_SE_GS_N_SESERAGI,     TRUE  }, // Water Flow
	{ SEQ_SE_GS_N_HUUSHA,       FALSE }, // Windmill
	{ SEQ_SE_GS_N_UMIBE,        FALSE }, // Seashore
	{ SEQ_SE_GS_N_HASHIRA,      TRUE  }, // Pillar
	{ SEQ_SE_GS_N_UZUSIO,       FALSE }, // Whirlpool
	{ SEQ_SE_GS_N_TAKI,         FALSE }, // Waterfall
	{ SEQ_SE_GS_N_YOUGAN,       TRUE  }, // Lava
	{ SEQ_SE_GS_N_KANSEI,       FALSE }, // Cheers
	{ SEQ_SE_GS_N_KITEKI,       FALSE }, // Steam Whistle
	{ SEQ_SE_GS_KABIGON_IBIKI,  TRUE  }, // Snorlax's Snoring
	{ SEQ_SE_GS_N_MOTER,        TRUE  }, // Motor
	{ SEQ_SE_GS_N_KANE,         TRUE  }, // Bells
	{ SEQ_SE_GS_KYOUHUU,        TRUE  }, // Strong Wind
	{ SEQ_SE_GS_N_ENGINE,       TRUE  }, // Engine
	{ SEQ_SE_GS_N_HUNSUI,       FALSE }, // Fountain
	{ SEQ_SE_GS_DENGEKIBARIA,   FALSE }  // Electric Barrier
};

static int GetLocalSoundplateID(const SoundplateStruct *soundplateStruct, int globalX, int globalZ) {
    int i;
    int ret = -1;
    int localX = globalX % 32;
    int localZ = globalZ % 32;

    // Gets the highest-numbered local ID. Likely important because plates are overlaid.
    for (i = 0; i < soundplateStruct->unk2 / 8; i++) {
        if (soundplateStruct->soundplates[i].x <= localX && localX <= soundplateStruct->soundplates[i].xBounds
            && soundplateStruct->soundplates[i].z <= localZ && localZ <= soundplateStruct->soundplates[i].zBounds) {
            ret = i;
        }
    }
    return ret;
}

static BOOL ov01_021E7D58(FieldSystem *fieldSystem, SoundplateStruct *soundplateStruct, int soundplateID) {
    SaveVarsFlags *state = Save_VarsFlags_Get(fieldSystem->saveData);
    u16 sndSeq = sSoundplateSounds[soundplateStruct->soundplates[soundplateID].soundplateSoundID][0];
    Location *location = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(fieldSystem->saveData));
    
    if (location->mapId == MAP_CIANWOOD_GYM && CheckDisabledCianwoodWaterfall(state) && sndSeq == SEQ_SE_GS_N_TAKI) {
        return FALSE;
    } else if (location->mapId == MAP_VERMILION_GYM && CheckSolvedLtSurgeGym(state) && sndSeq == SEQ_SE_GS_DENGEKIBARIA) {
        return FALSE;
    } else if (CheckBattledSnorlax(state) == TRUE && sndSeq == SEQ_SE_GS_KABIGON_IBIKI) {
        return FALSE;
    } else if (CheckRocketHideoutCleared(state) && sndSeq == SEQ_SE_GS_N_MOTER) {
        return FALSE;
    }
    return TRUE;
}

static void ov01_021E7DFC(FieldSystem *fieldSystem, int x, int z) {
    SoundplateStruct *soundplateStruct = sub_02054874(fieldSystem, x, z);
    
    if (fieldSystem->unkC4 == -2) {
        fieldSystem->unkC4 = -1;
    } else if (fieldSystem->unkC4 == -3) {
        fieldSystem->unkC4 = -1;
    }
    
    z = GetLocalSoundplateID(soundplateStruct, x, z);
    if (z != -1) {
        if (ov01_021E7D58(fieldSystem, soundplateStruct, z)) {
            u8 soundplateSoundID = soundplateStruct->soundplates[z].soundplateSoundID;
            if (soundplateSoundID < 16) {
                if (fieldSystem->unkC4 != sSoundplateSounds[soundplateSoundID][SOUNDPLATE_SOUND_SEQ]) {
                    if (sSoundplateSounds[soundplateSoundID][SOUNDPLATE_SOUND_UNK_BOOL] == TRUE) {
                        sub_02006088(sSoundplateSounds[soundplateSoundID][SOUNDPLATE_SOUND_SEQ]);
                    } else {
                        PlaySE(sSoundplateSounds[soundplateSoundID][SOUNDPLATE_SOUND_SEQ]);
                    }
                }
                fieldSystem->unkC4 = sSoundplateSounds[soundplateStruct->soundplates[z].soundplateSoundID][SOUNDPLATE_SOUND_SEQ];
                u8 volumeIndex = soundplateStruct->soundplates[z].volumeIndex;
                if (volumeIndex < 3) {
                    GF_SndHandleMoveVolume(0, sBGMVolume[volumeIndex], 15);
                    GF_SndHandleMoveVolume(5, sSoundplateVolume[soundplateStruct->soundplates[z].soundplateSoundID][soundplateStruct->soundplates[z].volumeIndex], 5);
                }
            } else if (z >= 16) {
                GF_AssertFail();
            }
        }
    } else {
        if (fieldSystem->unkC4 != -1) {
            StopSE(fieldSystem->unkC4, 10);
            GF_SndHandleMoveVolume(0, 128, 15);
            fieldSystem->unkC4 = -1;
        }
    }
}

void ov01_021E7F00(FieldSystem *fieldSystem, BOOL arg1) {
    if (fieldSystem->unkAC == 0) {
        int x = PlayerAvatar_GetXCoord(fieldSystem->playerAvatar);
        int z = PlayerAvatar_GetZCoord(fieldSystem->playerAvatar);
        if (arg1) {
            fieldSystem->unkC4 = -1;
        }
        ov01_021E7DFC(fieldSystem, x, z);
    }
}

static u16 GetInteractedHeadbuttTreeScript(FieldSystem *fieldSystem) {
    if (FieldSystem_FacingModelIsHeadbuttTree(fieldSystem)) {
        return std_field_headbutt;
    }
    return 0xFFFF;
}

u32 ov01_021E7F54(FieldSystem *fieldSystem) {
    LocalMapObject *facingObject;
    if (sub_0203DC64(fieldSystem, &facingObject) == TRUE) {
        switch (MapObject_GetType(facingObject)) {
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
    int x, z;
    PlayerAvatar_GetFacingTileCoords(fieldSystem, &x, &z);
    if (MapModel_IsHeadbuttTree(GetMapModelNo(MapCoordToMatrixIndex(fieldSystem, x, z), fieldSystem->mapMatrix))) {
        return TRUE;
    }
    return FALSE;
}
