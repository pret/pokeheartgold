#include "field_move_environment.h"

#include "global.h"

#include "heap.h"
#include "party.h"
#include "save.h"

FieldMoveEnvironment *FieldMove_CreateEnvironment(enum HeapID heapID, u8 slotNo, SaveData *saveData) {
    FieldMoveEnvironment *environment = Heap_AllocAtEnd(heapID, sizeof(FieldMoveEnvironment));
    environment->mon = Party_GetMonByIndex(SaveArray_Party_Get(saveData), slotNo);
    environment->moveData = NULL;
    return environment;
}
