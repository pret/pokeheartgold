#include "field_move_environment.h"

#include "global.h"

#include "heap.h"
#include "party.h"
#include "save.h"

FieldMoveEnvironment *FieldMove_CreateEnvironment(HeapID heapId, u8 slotNo, SaveData *saveData) {
    FieldMoveEnvironment *environmemt = AllocFromHeapAtEnd(heapId, sizeof(FieldMoveEnvironment));
    environmemt->mon = Party_GetMonByIndex(SaveArray_Party_Get(saveData), slotNo);
    environmemt->moveData = NULL;
    return environmemt;
}
