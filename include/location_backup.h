#ifndef POKEHEARTGOLD_FIELD_LOCATION_BACKUP_H
#define POKEHEARTGOLD_FIELD_LOCATION_BACKUP_H

#include "field_system.h"
#include "save.h"

void Location_SetToPlayerRoom(Location *data);
void Location_SetToOutsidePlayerHome(Location *data);
void Save_SetPositionToPlayerRoom(SaveData *saveData);

#endif // POKEHEARTGOLD_FIELD_LOCATION_BACKUP_H
