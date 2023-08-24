#include "global.h"
#include "field_player_avatar.h"
#include "assert.h"
#include "field_map_object.h"
#include "heap.h"
#include "overlay_00_thumb.h"
#include "overlay_01.h"
#include "player_data.h"
#include "unk_02034354.h"
#include "unk_02035900.h"
#include "unk_0205FD20.h"
#include "overlay_01_021FE780.h"
#include "overlay_01_02200858.h"
#include "constants/global.fieldmap.h"
#include "constants/sprites.h"

int sub_0205C268(u32 unkA) {
    if (unkA < 100) {
        return 255;
    }
    return ov00_021E6EBC();
}

u8 sub_0205C278(void) {
    PlayerProfile* profile = sub_02034818(sub_0203769C() ^ 1);
    if (!profile) {
        GF_ASSERT(FALSE);
    }
    return PlayerProfile_GetVersion(profile);
}

u8 sub_0205C298(SaveData* saveData) {
    u8 ver = PlayerProfile_GetVersion(Save_PlayerData_GetProfileAddr(saveData));
    if (ver == 0) {
        return 1;
    }
    if (sub_0205C278() == 0) {
        return 1;
    }
    return 0;
}

u8 sub_0205C2C0(u32 unkA) {
    switch (unkA) {
    case 0:
        return 95;
    case 1:
        return 97;
    case 2:
        return 99;
    case 3:
        return 143;
    }
}

u8 sub_0205C2E8(u32 unkA) {
    switch (unkA) {
    case 0:
        return 94;
    case 1:
        return 96;
    case 2:
        return 98;
    case 3:
        return 142;
    }
}

u8 sub_0205C310(u32 unkA) {
    u8 ret;
    switch (unkA) {
    case 0:
        ret = 1;
        break;
    case 1:
        ret = 3;
        break;
    case 2:
        ret = 5;
        break;
    case 3:
        ret = 7;
        break;
    case 4:
        ret = 9;
        break;
    case 6:
        ret = 113;
        break;
    case 5:
    default:
        GF_ASSERT(FALSE);
        break;
    }
    return ret;
}

u8 sub_0205C350(u32 unkA) {
    u8 ret;
    switch (unkA) {
    case 0:
        ret = 0;
        break;
    case 1:
        ret = 2;
        break;
    case 2:
        ret = 4;
        break;
    case 3:
        ret = 6;
        break;
    case 4:
        ret = 8;
        break;
    case 6:
        ret = 112;
        break;
    default:
    case 5:
        GF_ASSERT(FALSE);
        break;
    }
    return ret;
}

PlayerAvatar* sub_0205C390(MapObjectManager *man, int x, int y, int direction, int state, int gender, int a6, struct PlayerSaveData *playerSaveData) {
    PlayerAvatar* avatar = sub_0205C4E0();
    sub_0205C500(avatar, state, gender, playerSaveData);
    int sprite;
    if (a6 == 2) {
        sprite = PlayerAvatar_GetSpriteByStateAndGender(state, gender);
    }
    else if (a6 == 0) {
        if (gender == 0) {
            sprite = SPRITE_PL_BOY01C;
        }
        else {
            sprite = SPRITE_PL_GIRL01C;
        }
    }
    else if (a6 == 1) {
        if (gender == 0) {
            sprite = SPRITE_HERO_2;
        }
        else {
            sprite = SPRITE_HEROINE_2;
        }
    }
    else {
        GF_ASSERT(FALSE);
        sprite = PlayerAvatar_GetSpriteByStateAndGender(state, gender);
    }
    CreatePlayerAvatarMapObject(avatar, man, sprite, direction, x, y);
    return avatar;
}

PlayerAvatar* sub_0205C408(MapObjectManager* man, PlayerSaveData* playerSaveData, int gender) {
    PlayerAvatar* avatar = sub_0205C4E0();
    int state = sub_0205C7EC(playerSaveData);
    sub_0205C500(avatar, state, gender, playerSaveData);
    LocalMapObject* mapObj = sub_0205C640(man);
    MapObject_SetGfxID(mapObj, PlayerAvatar_GetSpriteByStateAndGender(state, gender));
    MapObject_SetFlagsBits(mapObj, MAPOBJECTFLAG_UNK13 | MAPOBJECTFLAG_UNK10);
    MapObject_ClearFlagsBits(mapObj, MAPOBJECTFLAG_UNK8 | MAPOBJECTFLAG_UNK7);
    MapObject_SetFlag29(mapObj, TRUE);
    sub_0205C6D8(avatar, mapObj);
    return avatar;
}

void sub_0205C46C(PlayerAvatar* avatar) {
    LocalMapObject* mapObj = PlayerAvatar_GetMapObject(avatar);
    if (!mapObj) {
        GF_ASSERT(FALSE);
    }
    MapObject_GetManager(mapObj);
    ov01_022008B4(avatar);
    if (PlayerAvatar_GetState(avatar) == PLAYER_STATE_SURFING) {
        int x = GetPlayerXCoord(avatar);
        int y = GetPlayerYCoord(avatar);
        int dir = PlayerAvatar_GetFacingDirection(avatar);
        sub_0205C78C(avatar, ov01_021FE7DC(mapObj, x, y, dir, 1));
    }
}

void PlayerAvatar_FreeToHeap(PlayerAvatar* avatar) {
    FreeToHeap(avatar);
}

void PlayerAvatar_DeleteFromMap(PlayerAvatar* avatar) {
    MapObject_Remove(PlayerAvatar_GetMapObject(avatar));
    PlayerAvatar_FreeToHeap(avatar);
}

PlayerAvatar* sub_0205C4E0() {
    PlayerAvatar* avatar = AllocFromHeap(HEAP_ID_FIELD, sizeof(PlayerAvatar));
    if (!avatar) {
        GF_ASSERT(FALSE);
    }
    memset(avatar, 0, sizeof(PlayerAvatar));
    return avatar;
}

void sub_0205C500(PlayerAvatar* avatar, int state, u32 gender, PlayerSaveData* playerSaveData) {
    PlayerAvatar_SetPlayerSaveData(avatar, playerSaveData);
    sub_0205C6C8(avatar, 0);
    sub_0205C6D0(avatar, 0);
    PlayerAvatar_SetState(avatar, state);
    PlayerAvatar_SetGender(avatar, gender);
    PlayerAvatar_SetTransitionFlags(avatar, 0);
    sub_0205C74C(avatar);
    sub_0205C768(avatar, -1);
    sub_0205C770(avatar, -1);
    sub_0205C79C(avatar, 255);
    sub_0205CA4C(avatar, TRUE);
}

void CreatePlayerAvatarMapObject(PlayerAvatar* avatar, MapObjectManager* man, u32 sprite, u32 direction, u32 x, u32 y) {
    LocalMapObject* mapObj = CreateSpecialFieldObject(man, x, y, direction, sprite, 1, 1);
    if (!mapObj) {
        GF_ASSERT(FALSE);
    }
    MapObject_SetID(mapObj, 255);
    MapObject_SetType(mapObj, 0);
    MapObject_SetFlagID(mapObj, 0);
    MapObject_SetScript(mapObj, 0);
    MapObject_SetParam(mapObj, 0, 0);
    MapObject_SetParam(mapObj, 0, 1);
    MapObject_SetParam(mapObj, 0, 2);
    MapObject_SetXRange(mapObj, -1);
    MapObject_SetYRange(mapObj, -1);
    MapObject_SetFlagsBits(mapObj, MAPOBJECTFLAG_UNK13 | MAPOBJECTFLAG_UNK10);
    MapObject_ClearFlagsBits(mapObj, MAPOBJECTFLAG_UNK8 | MAPOBJECTFLAG_UNK7);
    MapObject_SetFlag29(mapObj, TRUE);
    sub_0205C6D8(avatar, mapObj);
}

LocalMapObject* sub_0205C600(MapObjectManager* man) {
    int y = 0;
    LocalMapObject* mapObj = 0;
    while (sub_0205EEF4(man, &mapObj, &y, MAPOBJECTFLAG_ACTIVE)) {
        if (MapObject_GetMovement(mapObj) == TRUE) {
            break;
        }
    }
    return mapObj;
}

LocalMapObject* sub_0205C640(MapObjectManager* man) {
    LocalMapObject* mapObj = sub_0205C600(man);
    if (!mapObj) {
        GF_ASSERT(FALSE);
    }
    return mapObj;
}

int PlayerAvatar_GetFacingDirection(PlayerAvatar* avatar) {
    return MapObject_GetFacingDirection(PlayerAvatar_GetMapObject(avatar));
}

void PlayerAvatar_SetFacingDirection(PlayerAvatar* avatar, int direction) {
    MapObject_SetFacingDirection(PlayerAvatar_GetMapObject(avatar), direction);
}

u32 PlayerAvatar_GetNextFacing(PlayerAvatar* avatar) {
    return MapObject_GetNextFacing(PlayerAvatar_GetMapObject(avatar));
}

int GetPlayerXCoord(PlayerAvatar* avatar) {
    return MapObject_GetCurrentX(PlayerAvatar_GetMapObject(avatar));
}

int GetPlayerYCoord(PlayerAvatar* avatar) {
    return MapObject_GetCurrentY(PlayerAvatar_GetMapObject(avatar));
}

int GetPlayerLastXCoord(PlayerAvatar* avatar) {
    return MapObject_GetPrevX(PlayerAvatar_GetMapObject(avatar));
}

int GetPlayerLastYCoord(PlayerAvatar* avatar) {
    return MapObject_GetPrevY(PlayerAvatar_GetMapObject(avatar));
}

void PlayerAvatar_GetPositionVec(PlayerAvatar* avatar, VecFx32* vec) {
    MapObject_GetPositionVec(PlayerAvatar_GetMapObject(avatar), vec);
}

VecFx32* PlayerAvatar_GetPositionVecConst(PlayerAvatar* avatar) {
    return MapObject_GetPositionVecPtr(PlayerAvatar_GetMapObjectConst(avatar));
}

void sub_0205C6C8(PlayerAvatar* avatar, u32 unkA) {
    avatar->unk10 = unkA;
}

u32 sub_0205C6CC(PlayerAvatar* avatar) {
    return avatar->unk10;
}

void sub_0205C6D0(PlayerAvatar* avatar, u32 unkA) {
    avatar->unk14 = unkA;
}

u32 sub_0205C6D4(PlayerAvatar* avatar) {
    return avatar->unk14;
}

void sub_0205C6D8(PlayerAvatar* avatar, LocalMapObject* obj) {
    avatar->mapObject = obj;
}

LocalMapObject* PlayerAvatar_GetMapObject(PlayerAvatar* avatar) {
    return avatar->mapObject;
}

LocalMapObject* PlayerAvatar_GetMapObjectConst(PlayerAvatar* avatar) {
    return avatar->mapObject;
}

void PlayerAvatar_SetState(PlayerAvatar* avatar, int state) {
    if(state >= PLAYER_STATE_UNK_SP) {
        GF_ASSERT(FALSE);
    }
    avatar->state = state;
    sub_0205C800(avatar, state);
}

int PlayerAvatar_GetState(PlayerAvatar* avatar) {
    if(!avatar) {
        GF_ASSERT(FALSE);
    }
    return avatar->state;
}

void PlayerAvatar_OrrTransitionFlags(PlayerAvatar* avatar, u32 flag) {
    avatar->transFlag = avatar->transFlag | flag;
}

void PlayerAvatar_SetTransitionFlags(PlayerAvatar* avatar, u32 flag) {
    avatar->transFlag = flag;
}

u32 PlayerAvatar_GetTransitionFlags(PlayerAvatar* avatar) {
    return avatar->transFlag;
}

void PlayerAvatar_SetGender(PlayerAvatar* avatar, u32 gender) {
    avatar->gender = gender;
}

int PlayerAvatar_GetGender(PlayerAvatar* avatar) {
    return avatar->gender;
}

void sub_0205C728(PlayerAvatar* avatar, u32 unkA) {
    avatar->unk0 = avatar->unk0 | unkA;
}

void sub_0205C730(PlayerAvatar* avatar, u32 unkA) {
    avatar->unk0 = avatar->unk0 & ~unkA;
}

u32 sub_0205C73C(PlayerAvatar* avatar, u32 unkA) {
    return avatar->unk0 & unkA;
}

u32 sub_0205C744(PlayerAvatar* avatar) {
    return avatar->unk24;
}

void sub_0205C748(PlayerAvatar* avatar, u32 unkA) {
    avatar->unk24 = unkA;
}

void sub_0205C74C(PlayerAvatar* avatar) {
    avatar->unk24 = 0;
    sub_0205CA78(avatar, FALSE);
}

int sub_0205C758(PlayerAvatar* avatar, int unkB, int unkC) {
    int var = avatar->unk24 + unkB;
    avatar->unk24 = var;
    if (var > unkC) {
        avatar->unk24 = unkC;
    }
    return avatar->unk24;
}

void sub_0205C768(PlayerAvatar* avatar, int unkA) {
    avatar->unk28 = unkA;
}

int sub_0205C76C(PlayerAvatar* avatar) {
    return avatar->unk28;
}

void sub_0205C770(PlayerAvatar* avatar, int unkA) {
    avatar->unk2c = unkA;
}

int sub_0205C774(PlayerAvatar* avatar) {
    return avatar->unk2c;
}

void sub_0205C778(PlayerAvatar* avatar, int unkB, int unkC) {
    sub_0205C768(avatar, unkB);
    sub_0205C770(avatar, unkC);
}

void sub_0205C78C(PlayerAvatar* avatar, u32 unkA) {
    avatar->unk34 = unkA;
}

u32 sub_0205C790(PlayerAvatar* avatar) {
    return avatar->unk34;
}

void PlayerAvatar_SetPlayerSaveData(PlayerAvatar* avatar, PlayerSaveData* playerSaveData) {
    avatar->playerSaveData = playerSaveData;
}

PlayerSaveData* PlayerAvatar_GetPlayerSaveData(PlayerAvatar* avatar) {
    return avatar->playerSaveData;
}

void sub_0205C79C(PlayerAvatar* avatar, u32 unkA) {
    avatar->unk8 = unkA;
}

u32 sub_0205C7A0(PlayerAvatar* avatar) {
    return avatar->unk8;
}

u32 sub_0205C7A4(PlayerAvatar* avatar) {
    return avatar->unkc;
}

void sub_0205C7A8(PlayerAvatar* avatar) {
    avatar->unkc = (avatar->unkc + 1) & TRUE;
}

void sub_0205C7B4(PlayerAvatar* avatar) {
    avatar->unkc = 0;
}

void PlayerSaveData_Init(struct PlayerSaveData* playerSaveData) {
    playerSaveData->hasRunningShoes = 0;
    playerSaveData->unk2 = 0;
    playerSaveData->unk4 = 0;
}

BOOL PlayerSaveData_CheckRunningShoes(struct PlayerSaveData* playerSaveData) {
    if (playerSaveData != NULL) {
        if (playerSaveData->hasRunningShoes == TRUE) {
            return TRUE;
        }
    }
    return FALSE;
}

void PlayerSaveData_SetRunningShoesFlag(struct PlayerSaveData* playerSaveData, BOOL flag) {
    if (flag == TRUE) {
        playerSaveData->hasRunningShoes = TRUE;
    }
    else {
        playerSaveData->hasRunningShoes = FALSE;
    }
}

int sub_0205C7EC(PlayerSaveData* playerSaveData) {
    if (!playerSaveData) {
        return 0;
    }
    return playerSaveData->unk4;
}

void sub_0205C7F8(PlayerSaveData* playerSaveData, int state) {
    if (!playerSaveData) {
        return;
    }
    playerSaveData->unk4 = state;
}

void sub_0205C800(PlayerAvatar* avatar, int state) {
    sub_0205C7F8(PlayerAvatar_GetPlayerSaveData(avatar), state);
}

void sub_0205C810(PlayerAvatar* avatar, VecFx32 *pos, u32 dir) {
    sub_0205FBC0(PlayerAvatar_GetMapObject(avatar), pos, dir);
    sub_0205C6C8(avatar, 0);
    sub_0205C6D0(avatar, 0);
}

void sub_0205C838(PlayerAvatar* avatar, int unkA) {
    LocalMapObject* mapObj = PlayerAvatar_GetMapObject(avatar);
    VecFx32 vec;
    MapObject_GetPositionVec(mapObj, &vec);
    vec.y = unkA;
    MapObject_SetPositionVec(mapObj, &vec);
}

void PlayerAvatar_ToggleAutomaticHeightUpdating(PlayerAvatar* avatar, u8 state) {
    LocalMapObject* mapObj = PlayerAvatar_GetMapObject(avatar);
    if (state == TRUE) {
        MapObject_SetIgnoreHeights(mapObj, FALSE);
    }
    else {
        MapObject_SetIgnoreHeights(mapObj, TRUE);
    }
}

void PlayerAvatar_ToggleAutomaticHeightUpdating_NowApply(PlayerAvatar* avatar, BOOL state) {
    LocalMapObject* mapObj = PlayerAvatar_GetMapObject(avatar);
    if (state == TRUE) {
        MapObject_SetIgnoreHeights(mapObj, FALSE);
        sub_02061070(mapObj);
    }
    else {
        MapObject_SetIgnoreHeights(mapObj, TRUE);
    }
}

u32 PlayerAvatar_GetSpriteByStateAndGender(u32 state, int gender) {
    if(!gender) {
        switch (state) {
        case PLAYER_STATE_WALKING:
            return SPRITE_HERO;
        case PLAYER_STATE_CYCLING:
            return SPRITE_CYCLEHERO;
        case PLAYER_STATE_SURFING:
            return SPRITE_SWIMHERO;
        case PLAYER_STATE_UNK_SP:
            return SPRITE_SPHERO;
        case PLAYER_STATE_UNK_WATER:
            return SPRITE_WATERHERO;
        case PLAYER_STATE_FISHING:
            return SPRITE_FISHINGHERO;
        case PLAYER_STATE_UNK_POKE:
            return SPRITE_POKEHERO;
        case PLAYER_STATE_SAVING:
            return SPRITE_SAVEHERO;
        case PLAYER_STATE_HEAL:
            return SPRITE_BANZAIHERO;
        case PLAYER_STATE_LADDER:
            return SPRITE_LADDERHERO;
        case PLAYER_STATE_ROCKET:
            return SPRITE_RHERO;
        case PLAYER_STATE_ROCKET_HEAL:
            return SPRITE_RBANZAIHERO;
        case PLAYER_STATE_POKEATHLON:
            return SPRITE_PKTHHERO;
        case PLAYER_STATE_APRICORN_SHAKE:
            return SPRITE_SHAKEHERO;
        case PLAYER_STATE_ROCKET_SAVING:
            return SPRITE_SAVERHERO;
        }
    }
    else {
        switch (state) {
        case PLAYER_STATE_WALKING:
            return SPRITE_HEROINE;
        case PLAYER_STATE_CYCLING:
            return SPRITE_CYCLEHEROINE;
        case PLAYER_STATE_SURFING:
            return SPRITE_SWIMHEROINE;
        case PLAYER_STATE_UNK_SP:
            return SPRITE_SPHEROINE;
        case PLAYER_STATE_UNK_WATER:
            return SPRITE_WATERHEROINE;
        case PLAYER_STATE_FISHING:
            return SPRITE_FISH_HEROINE;
        case PLAYER_STATE_UNK_POKE:
            return SPRITE_POKEHEROINE;
        case PLAYER_STATE_SAVING:
            return SPRITE_SAVEHEROINE;
        case PLAYER_STATE_HEAL:
            return SPRITE_BANZAIHEROINE;
        case PLAYER_STATE_LADDER:
            return SPRITE_LADDERHEROINE;
        case PLAYER_STATE_ROCKET:
            return SPRITE_RHEROINE;
        case PLAYER_STATE_ROCKET_HEAL:
            return SPRITE_RBANZAIINE;
        case PLAYER_STATE_POKEATHLON:
            return SPRITE_PKTHHEROINE;
        case PLAYER_STATE_APRICORN_SHAKE:
            return SPRITE_SHAKEHEROINE;
        case PLAYER_STATE_ROCKET_SAVING:
            return SPRITE_SAVERHEROINE;
        }
    }
    GF_ASSERT(FALSE);
    return 0;
}

u32 PlayerAvatar_GetTransitionBits(u32 unkA) {
    switch (unkA) {
    case PLAYER_STATE_WALKING:
        return PLAYER_TRANSITION_WALKING;
    case PLAYER_STATE_CYCLING:
        return PLAYER_TRANSITION_CYCLING;
    case PLAYER_STATE_SURFING:
        return PLAYER_TRANSITION_SURFING;
    case PLAYER_STATE_UNK_WATER:
        return PLAYER_TRANSITION_x0010;
    case PLAYER_STATE_FISHING:
        return PLAYER_TRANSITION_x0020;
    case PLAYER_STATE_UNK_POKE:
        return PLAYER_TRANSITION_x0040;
    case PLAYER_STATE_SAVING:
        return PLAYER_TRANSITION_x0080;
    case PLAYER_STATE_HEAL:
        return PLAYER_TRANSITION_HEAL;
    case PLAYER_STATE_LADDER:
        return PLAYER_TRANSITION_x0200;
    case PLAYER_STATE_ROCKET:
        return PLAYER_TRANSITION_ROCKET;
    case PLAYER_STATE_ROCKET_HEAL:
        return PLAYER_TRANSITION_ROCKET_HEAL;
    case PLAYER_STATE_POKEATHLON:
        return PLAYER_TRANSITION_POKEATHLON;
    case PLAYER_STATE_APRICORN_SHAKE:
        return PLAYER_TRANSITION_x2000;
    case PLAYER_STATE_ROCKET_SAVING:
        return PLAYER_TRANSITION_x4000;
    case PLAYER_STATE_UNK_SP:
    default:
        GF_ASSERT(FALSE);
        return PLAYER_TRANSITION_WALKING;
    }
}

PlayerAvatar* FieldSystem_GetPlayerAvatar(FieldSystem* fieldSystem) {
    return fieldSystem->playerAvatar;
}

void sub_0205CA20(PlayerAvatar* avatar, BOOL unkA) {
    if (unkA == TRUE) {
        sub_0205C728(avatar, 1);
    }
    else {
        sub_0205C730(avatar, 1);
    }
}

BOOL sub_0205CA38(PlayerAvatar* avatar) {
    if (sub_0205C73C(avatar, 1)) {
        return TRUE;
    }
    return FALSE;
}

void sub_0205CA4C(PlayerAvatar* avatar, BOOL unkA) {
    if (unkA == TRUE) {
        sub_0205C728(avatar, 2);
    }
    else {
        sub_0205C730(avatar, 2);
    }
}

BOOL sub_0205CA64(PlayerAvatar* avatar) {
    if (sub_0205C73C(avatar, 2)) {
        return TRUE;
    }
    return FALSE;
}

void sub_0205CA78(PlayerAvatar* avatar, BOOL unkB) {
    if (unkB == TRUE) {
        sub_0205C728(avatar, 4);
    }
    else {
        sub_0205C730(avatar, 4);
    }
}

BOOL sub_0205CA90(PlayerAvatar* avatar) {
    if (sub_0205C73C(avatar, 4)) {
        return TRUE;
    }
    return FALSE;
}

void sub_0205CAA4(PlayerAvatar* avatar, u8 unkA) {
    if (unkA == 1) {
        sub_0205C728(avatar, 8);
    }
    else {
        sub_0205C730(avatar, 8);
    }
}

BOOL sub_0205CABC(PlayerAvatar* avatar) {
    if (sub_0205C73C(avatar, 8)) {
        return TRUE;
    }
    return FALSE;
}

void sub_0205CAD0(PlayerAvatar* avatar, BOOL unkA) {
    if (unkA == TRUE) {
        sub_0205C728(avatar, 32);
    }
    else {
        sub_0205C730(avatar, 32);
    }
}

void sub_0205CAE8(PlayerAvatar* avatar) {
    sub_0205C728(avatar, 64);
}

void sub_0205CAF4(PlayerAvatar* avatar) {
    sub_0205C730(avatar, 64);
}

BOOL sub_0205CB00(PlayerAvatar* avatar) {
    if (sub_0205C73C(avatar, 64)) {
        return TRUE;
    }
    return FALSE;
}

void sub_0205CB14(PlayerAvatar* avatar, BOOL unkA) {
    if (unkA == TRUE) {
        sub_0205C728(avatar, 128);
    }
    else {
        sub_0205C730(avatar, 128);
    }
}

u32 sub_0205CB2C(PlayerAvatar* avatar) {
    return sub_0205C73C(avatar, 128);
}

u16 sub_0205CB38(PlayerAvatar* avatar) {
    return avatar->playerSaveData->unk2;
}

void sub_0205CB40(PlayerAvatar* avatar, u16 unkA) {
    avatar->playerSaveData->unk2 = unkA;
}
