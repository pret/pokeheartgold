#ifndef POKEHEARTGOLD_UNK_02067A60_H
#define POKEHEARTGOLD_UNK_02067A60_H

#include "field_types_def.h"
#include "heap.h"
#include "pokemon_types_def.h"

typedef struct CaptureAttempt CaptureAttempt;
struct UnkStruct_02067BF8;

struct CaptureAttempt *CaptureAttempt_New(enum HeapID heapID);
void CaptureAttempt_Free(struct CaptureAttempt *);

struct UnkStruct_02067BF8 *sub_02067BF8(enum HeapID heapID, FieldSystem *fieldSystem, Pokemon *pokemon, u16 r3, u16 a4, s16 a5, s16 a6);
BOOL sub_02067C30(TaskManager *taskManager);

#endif // POKEHEARTGOLD_UNK_02067A60_H
