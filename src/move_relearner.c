#include "move_relearner.h"

#include "global.h"

#include "pokemon.h"

MoveRelearnerArgs *MoveRelearner_New(HeapID heapId) {
    MoveRelearnerArgs *ret = AllocFromHeap(heapId, sizeof(MoveRelearnerArgs));
    memset(ret, 0, sizeof(MoveRelearnerArgs));
    return ret;
}

void MoveRelearner_Delete(MoveRelearnerArgs *moveRelearner) {
    Heap_Free(moveRelearner);
}

u16 *MoveRelearner_GetEligibleLevelUpMoves(Pokemon *mon, HeapID heapId) {
    u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    u8 form = GetMonData(mon, MON_DATA_FORM, NULL);
    u8 level = GetMonData(mon, MON_DATA_LEVEL, NULL);
    u16 moves[MAX_MON_MOVES];

    for (u8 i = 0; i < MAX_MON_MOVES; i++) {
        moves[i] = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
    }

    u16 *tableFromFile = AllocFromHeap(heapId, LEVEL_UP_LEARNSET_MAX * 2);
    u16 *returnTable = AllocFromHeap(heapId, LEVEL_UP_LEARNSET_MAX * 2);

    LoadLevelUpLearnset_HandleAlternateForm(species, form, tableFromFile);

    for (u8 i = 0, j, k = 0; i < LEVEL_UP_LEARNSET_MAX; i++) {
        if (tableFromFile[i] == LEVEL_UP_LEARNSET_END) {
            returnTable[k] = LEVEL_UP_LEARNSET_END;
            break;
        } else if (LEVEL_UP_LEARNSET_LVL(tableFromFile[i]) > level) {
            continue;
        } else {
            tableFromFile[i] = LEVEL_UP_LEARNSET_MOVE(tableFromFile[i]);
            for (j = 0; j < MAX_MON_MOVES; j++) {
                if (tableFromFile[i] == moves[j]) {
                    break;
                }
            }
            if (j == MAX_MON_MOVES) {
                for (j = 0; j < k; j++) {
                    if (returnTable[j] == tableFromFile[i]) {
                        break;
                    }
                }
                if (j == k) {
                    returnTable[k] = tableFromFile[i];
                    k++;
                }
            }
        }
    }
    Heap_Free(tableFromFile);
    return returnTable;
}

BOOL MoveRelearner_IsValidMove(const u16 *ptr) {
    return *ptr != LEVEL_UP_LEARNSET_END;
}
