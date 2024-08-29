#ifndef POKEHEARTGOLD_UNK_0205B3DC_H
#define POKEHEARTGOLD_UNK_0205B3DC_H

#include "message_format.h"

void BufferUnionRoomAvatarChoicesNames(u32 trainerId, u32 playerGender, MessageFormat *msgFmt);
int UnionRoomAvatarIdxToSprite(u32 trainerId, u32 playerGender, u32 choice);
int SpriteToUnionRoomAvatarIdx(int playerGender, int trclass);
int GetUnionRoomAvatarAttrBySprite(int playerGender, int trclass, int attr);
u16 *sub_0205B4A4(HeapID heapId);

#endif // POKEHEARTGOLD_UNK_0205B3DC_H
