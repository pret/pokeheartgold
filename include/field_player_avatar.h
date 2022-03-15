#ifndef POKEHEARTGOLD_FIELD_PLAYER_AVATAR_H
#define POKEHEARTGOLD_FIELD_PLAYER_AVATAR_H

typedef struct FIELD_PLAYER_AVATAR FIELD_PLAYER_AVATAR;

struct FlypointsPlayerSub {
    u16 unk0;
    u16 unk2;
    u32 unk4;
};

void sub_0205C7BC(struct FlypointsPlayerSub *vec);

int GetPlayerXCoord(FIELD_PLAYER_AVATAR *avatar);
int GetPlayerYCoord(FIELD_PLAYER_AVATAR *avatar);
u32 sub_0205C700(FIELD_PLAYER_AVATAR *avatar);

#endif //POKEHEARTGOLD_FIELD_PLAYER_AVATAR_H
