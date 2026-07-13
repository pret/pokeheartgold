#ifndef POKEHEARTGOLD_OVERLAY_01_021F1AFC_H
#define POKEHEARTGOLD_OVERLAY_01_021F1AFC_H

#include "player_avatar.h"

void Field_PlayerAvatar_OrrTransitionFlags(PlayerAvatar *playerAvatar, int flags);
void Field_PlayerAvatar_ApplyTransitionFlags(PlayerAvatar *playerAvatar);
BOOL ov01_021F1D94(FieldSystem *fieldSystem, PlayerAvatar *playerAvatar, int direction, int playerEvents);
void ov01_021F2F24(PlayerAvatar *playerAvatar);

#endif // POKEHEARTGOLD_OVERLAY_01_021F1AFC_H
