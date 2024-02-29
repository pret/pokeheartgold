#ifndef POKEHEARTGOLD_FIELD_LOCATION_BACKUP_H
#define POKEHEARTGOLD_FIELD_LOCATION_BACKUP_H

#include "field_system.h"
#include "save.h"

void LocationData_BackUp(Location *data);
void LocationData_Restore(Location *data);
void Save_CurrentLocation_BackUp(SaveData *saveData);

#endif //POKEHEARTGOLD_FIELD_LOCATION_BACKUP_H
