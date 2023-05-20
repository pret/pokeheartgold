#ifndef POKEHEARTGOLD_UNK_0205B3DC_H
#define POKEHEARTGOLD_UNK_0205B3DC_H

#include "message_format.h"

void sub_0205B3DC(u32 trainerId, u32 playerGender, MessageFormat *msgFmt);
int sub_0205B418(u32 trainerId, u32 playerGender, u32 choice);
int sub_0205B464(int playerGender, int trclass);
int sub_0205B46C(int playerGender, int trclass, int attr);
u16 *sub_0205B4A4(HeapID heapId);

#endif //POKEHEARTGOLD_UNK_0205B3DC_H
