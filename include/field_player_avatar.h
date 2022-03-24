#ifndef POKEHEARTGOLD_FIELD_PLAYER_AVATAR_H
#define POKEHEARTGOLD_FIELD_PLAYER_AVATAR_H

typedef struct FIELD_PLAYER_AVATAR FIELD_PLAYER_AVATAR;
typedef struct MapObjectMan MapObjectMan;
typedef struct LocalMapObject LocalMapObject;

struct FlypointsPlayerSub {
    u16 hasRunningShoes;
    u16 unk2;
    u32 unk4;
};

void sub_0205C7BC(struct FlypointsPlayerSub *vec);
BOOL FlypointsPlayerSub_CheckRunningShoes(struct FlypointsPlayerSub *vec);
void FlypointsPlayerSub_SetRunningShoesFlag(struct FlypointsPlayerSub *vec, BOOL enable);

int GetPlayerXCoord(FIELD_PLAYER_AVATAR *avatar);
int GetPlayerYCoord(FIELD_PLAYER_AVATAR *avatar);
int PlayerAvatar_GetState(FIELD_PLAYER_AVATAR *avatar);
FIELD_PLAYER_AVATAR *sub_0205C390(MapObjectMan *man, int x, int y, int direction, int a4, int gender, int a6, struct FlypointsPlayerSub *a7);
FIELD_PLAYER_AVATAR *sub_0205C408(MapObjectMan *man, struct FlypointsPlayerSub *a1, int gender);
void sub_0205C4CC(FIELD_PLAYER_AVATAR *avatar);
void sub_0205C4C4(FIELD_PLAYER_AVATAR *avatar);
void PlayerAvatar_SetState(FIELD_PLAYER_AVATAR *avatar, int state);
int PlayerAvatar_GetGender(FIELD_PLAYER_AVATAR *avatar);
LocalMapObject *PlayerAvatar_GetMapObject(FIELD_PLAYER_AVATAR *avatar);
BOOL sub_0205CABC(FIELD_PLAYER_AVATAR *avatar);

#endif //POKEHEARTGOLD_FIELD_PLAYER_AVATAR_H
