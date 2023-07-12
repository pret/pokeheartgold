#include "global.h"
#include "field_blackthorn_tutors.h"
#include "pokemon.h"

struct MoveRelearner *MoveRelearner_New(HeapID heapId) {
    struct MoveRelearner *ret;

    ret = AllocFromHeap(heapId, sizeof(struct MoveRelearner));
    memset(ret, 0, sizeof(struct MoveRelearner));
    return ret;
}

void MoveRelearner_Delete(struct MoveRelearner *moveRelearner) {
    FreeToHeap(moveRelearner);
}

u16 *GetEligibleLevelUpMoves(Pokemon *mon, HeapID heapId) {
    u16 cur_moveset[MAX_MON_MOVES]; // sp+10
    u16 species; // sp+0C
    u8 form;    // sp+08
    u8 level;    // sp+04
    u16 *ret;
    u16 *wotbl;
    u8 i, j, ct;

    species = GetMonData(mon, MON_DATA_SPECIES, NULL);
    form = GetMonData(mon, MON_DATA_FORM, NULL);
    level = GetMonData(mon, MON_DATA_LEVEL, NULL);
    for (i = 0; i < MAX_MON_MOVES; i++) {
        cur_moveset[i] = GetMonData(mon, MON_DATA_MOVE1 + i, NULL);
    }

    wotbl = AllocFromHeap(heapId, WOTBL_MAX * 2);
    ret = AllocFromHeap(heapId, WOTBL_MAX * 2);

    LoadWotbl_HandleAlternateForm(species, form, wotbl);

    ct = 0;
    for (i = 0; i < WOTBL_MAX; i++) {
        if (wotbl[i] == WOTBL_END) {
            ret[ct] = WOTBL_END;
            break;
        } else if (((wotbl[i] & WOTBL_LEVEL_MASK) >> WOTBL_LEVEL_SHIFT) > level) {
            continue;
        } else {
            wotbl[i] &= WOTBL_MOVEID_MASK;
            for (j = 0; j < MAX_MON_MOVES; j++) {
                if (wotbl[i] == cur_moveset[j]) {
                    break;
                }
            }
            if (j == MAX_MON_MOVES) {
                for (j = 0; j < ct; j++) {
                    if (ret[j] == wotbl[i]) {
                        break;
                    }
                }
                if (j == ct) {
                    ret[ct] = wotbl[i];
                    ct++;
                }
            }
        }
    }
    FreeToHeap(wotbl);
    return ret;
}

BOOL sub_0209186C(const u16 *ptr) {
    return *ptr != WOTBL_END;
}
