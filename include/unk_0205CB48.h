#ifndef POKEHEARTGOLD_UNK_0205CB48_H
#define POKEHEARTGOLD_UNK_0205CB48_H

#include "field_player_avatar.h"

void PlayerAvatar_GetCoordsInFront(PlayerAvatar *playerAvatar, int *x, int *z);
void PlayerAvatar_UpdateMovement(PlayerAvatar *playerAvatar);
void PlayerAvatar_MoveControl(PlayerAvatar *playerAvatar, FieldSystemUnkSub2C *a1, int a2, u16 a3, u16 a4, int a5);
void sub_0205CF44(PlayerAvatar *playerAvatar);
BOOL sub_0205CF60(PlayerAvatar *playerAvatar);
void sub_0205CFBC(PlayerAvatar *playerAvatar, int direction);

#endif // POKEHEARTGOLD_UNK_0205CB48_H
