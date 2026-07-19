#ifndef POKEHEARTGOLD_FIELD_SIGNPOST_H
#define POKEHEARTGOLD_FIELD_SIGNPOST_H

#include "script.h"

typedef struct Signpost {
    Window window;
    u16 NARCMemberID;
    u8 type;
    u8 command : 7;
    u8 isActive : 1;
} Signpost;

Signpost *Signpost_Init(enum HeapID heapID);
void Signpost_Free(Signpost *signpost);
void ov01_021F3D68(Signpost *signpost, u8 type, u16 narcMemberID);
void ov01_021F3D70(Signpost *signpost, u8 arg1);
Window *ov01_021F3D80(Signpost *signpost);
u8 ov01_021F3D84(Signpost *signpost);
BOOL ov01_021F3D88(Signpost *signpost);
void Signpost_DoCurrentCommand(FieldSystem *fieldSystem);
void ov01_021F3DFC(FieldSystem *fieldSystem, u8 arg1);

#endif // POKEHEARTGOLD_FIELD_SIGNPOST_H
