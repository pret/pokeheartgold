#include "global.h"
#include "move_relearner.h"
#include "pokemon.h"

MoveRelearner *MoveRelearner_New(HeapID heapId) {
    MoveRelearner *ret = AllocFromHeap(heapId, sizeof(MoveRelearner));
    memset(ret, 0, sizeof(MoveRelearner));
    return ret;
}

void MoveRelearner_Delete(MoveRelearner *moveRelearner) {
    FreeToHeap(moveRelearner);
}

u16 *MoveRelearner_GetEligibleLevelUpMoves(Pokemon *mon, HeapID heapId) {
    u16 species = (u16)GetMonData(mon, MON_DATA_SPECIES, NULL);
    u8 form = (u8)GetMonData(mon, MON_DATA_FORM, NULL);
    u8 level = (u8)GetMonData(mon, MON_DATA_LEVEL, NULL);
    u16 moves[MAX_MON_MOVES];

    for (u8 i = 0; i < MAX_MON_MOVES; i++) {
        moves[i] = (u16)GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
    }

    u16 *tableFromFile = AllocFromHeap(heapId, WOTBL_MAX * 2);
    u16 *returnTable = AllocFromHeap(heapId, WOTBL_MAX * 2);

    LoadWotbl_HandleAlternateForm(species, form, tableFromFile);

    for (u8 i = 0, j, k = 0; i < WOTBL_MAX; i++) {
        if (tableFromFile[i] == WOTBL_END) {
            returnTable[k] = WOTBL_END;
            break;
        } else if (WOTBL_LVL(tableFromFile[i]) > level) {
            continue;
        } else {
            tableFromFile[i] = WOTBL_MOVE(tableFromFile[i]);
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
    FreeToHeap(tableFromFile);
    return returnTable;
}

BOOL sub_0209186C(const u16 *ptr) { //MoveRelearner_IsValidMove?
    return *ptr != WOTBL_END;
}
