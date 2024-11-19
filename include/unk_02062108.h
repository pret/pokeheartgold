#ifndef POKEHEARTGOLD_UNK_02062108_H
#define POKEHEARTGOLD_UNK_02062108_H

#include "constants/movements.h"

#include "field_system.h"

typedef struct MovementScriptCommand {
    u16 command;
    u16 length;
} MovementScriptCommand;

typedef struct EventObjectMovementMan EventObjectMovementMan;

EventObjectMovementMan *EventObjectMovementMan_Create(LocalMapObject *object, const MovementScriptCommand *data);
BOOL EventObjectMovementMan_IsFinish(EventObjectMovementMan *movementMan);
void EventObjectMovementMan_Delete(EventObjectMovementMan *movementMan);
BOOL MapObject_AreBitsSetForMovementScriptInit(LocalMapObject *obj);
BOOL MapObject_ClearHeldMovementIfActive(LocalMapObject *obj);
void MapObject_SetHeldMovement(LocalMapObject *obj, u32 a1);
BOOL MapObject_IsMovementPaused(LocalMapObject *object);

#endif // POKEHEARTGOLD_UNK_02062108_H
