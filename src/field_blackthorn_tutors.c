#include "field_blackthorn_tutors.h"
#include "pokemon.h"

struct MoveRelearner *MoveRelearner_new(HeapID heapId) {
    struct MoveRelearner *ret;

    ret = AllocFromHeap(heapId, sizeof(struct MoveRelearner));
    memset(ret, 0, sizeof(struct MoveRelearner));
    return ret;
}

void MoveRelearner_delete(struct MoveRelearner *moveRelearner) {
    FreeToHeap(moveRelearner);
}

u16 *GetEligibleLevelUpMoves(POKEMON *pokemon, HeapID heapId) {
    u16 cur_moveset[MON_MOVES]; // sp+10
    u16 species; // sp+0C
    u8 forme;    // sp+08
    u8 level;    // sp+04
    u16 *ret;
    u16 *wotbl;
    u8 i, j, ct;

    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
    level = GetMonData(pokemon, MON_DATA_LEVEL, NULL);
    for (i = 0; i < MON_MOVES; i++) {
        cur_moveset[i] = GetMonData(pokemon, MON_DATA_MOVE1 + i, NULL);
    }

    wotbl = AllocFromHeap(heapId, WOTBL_MAX * 2);
    ret = AllocFromHeap(heapId, WOTBL_MAX * 2);

    LoadWotbl_HandleAlternateForme(species, forme, wotbl);

    ct = 0;
    for (i = 0; i < WOTBL_MAX; i++) {
        if (wotbl[i] == WOTBL_END) {
            ret[ct] = WOTBL_END;
            break;
        } else if (((wotbl[i] & WOTBL_LEVEL_MASK) >> WOTBL_LEVEL_SHIFT) > level) {
            continue;
        } else {
            wotbl[i] &= WOTBL_MOVEID_MASK;
            for (j = 0; j < MON_MOVES; j++) {
                if (wotbl[i] == cur_moveset[j]) {
                    break;
                }
            }
            if (j == MON_MOVES) {
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
    if (*ptr != WOTBL_END) {
        return TRUE;
    } else {
        return FALSE;
    }
}
