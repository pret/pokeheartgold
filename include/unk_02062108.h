#ifndef POKEHEARTGOLD_UNK_02062108_H
#define POKEHEARTGOLD_UNK_02062108_H

#include "field_system.h"

#define MV_step_down            12
#define MV_step_up              13
#define MV_step_left            14
#define MV_step_right           15
#define MV_step_end            254

typedef struct MovementScriptCommand {
    u16 command;
    u16 length;
} MovementScriptCommand;

typedef struct EventObjectMovementMan EventObjectMovementMan;

EventObjectMovementMan *EventObjectMovementMan_Create(LocalMapObject *object, const MovementScriptCommand *data);
BOOL EventObjectMovementMan_IsFinish(EventObjectMovementMan *mvtMan);
void EventObjectMovementMan_Delete(EventObjectMovementMan *mvtMan);
BOOL MapObject_AreBitsSetForMovementScriptInit(LocalMapObject *obj);
BOOL MapObject_ClearHeldMovementIfActive(LocalMapObject *obj);
void MapObject_SetHeldMovement(LocalMapObject *obj, u32 a1);

#endif //POKEHEARTGOLD_UNK_02062108_H
