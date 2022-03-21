#ifndef POKEHEARTGOLD_UNK_0203E348_H
#define POKEHEARTGOLD_UNK_0203E348_H

#include "script.h"

struct UseMailWork;
struct ApricornBoxWork;
struct PalPadWork;

struct UseMailWork *CreateUseMailWork(FieldSystem *fsys, int kind, int mailId, HeapID heapId);
struct ApricornBoxWork *CreateApricornBoxWork(FieldSystem *fsys, int a1);
struct PalPadWork *CreatePalPadWork(FieldSystem *fsys, SAVEDATA *saveData, HeapID heapId);

#endif //POKEHEARTGOLD_UNK_0203E348_H
