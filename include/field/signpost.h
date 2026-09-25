#ifndef POKEHEARTGOLD_FIELD_SIGNPOST_H
#define POKEHEARTGOLD_FIELD_SIGNPOST_H

#include "script.h"

typedef struct Signpost {
    Window window;
    u16 map;
    u8 type;
    u8 command : 7;
    u8 isActive : 1;
} Signpost;

Signpost *Signpost_Init(enum HeapID heapID);
void Signpost_Free(Signpost *signpost);
void Signpost_SetParam(Signpost *signpost, u8 type, u16 narcMemberID);
void Signpost_SetCommand(Signpost *signpost, u8 arg1);
Window *Signpost_GetWindow(Signpost *signpost);
u8 Signpost_GetType(Signpost *signpost);
BOOL Signpost_CommandIsFinished(Signpost *signpost);
void Signpost_DoCurrentCommand(FieldSystem *fieldSystem);
void FieldSystem_SetAndExecuteSignpostWindowCommand(FieldSystem *fieldSystem, u8 arg1);

#endif // POKEHEARTGOLD_FIELD_SIGNPOST_H
