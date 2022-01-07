#include "pokedex.h"
#include "constants/species.h"

u32 Save_Pokedex_sizeof(void) {
    return sizeof(POKEDEX);
}

POKEDEX *Pokedex_new(HeapID heapId) {
    POKEDEX *ret = AllocFromHeap(heapId, sizeof(POKEDEX));
    Save_Pokedex_init(ret);
    return ret;
}

void Pokedex_copy(const POKEDEX *src, POKEDEX *dest) {
    MI_CpuCopy8(src, dest, sizeof(POKEDEX));
}

BOOL DexSpeciesIsInvalid(u16 species) {
    if (species == SPECIES_NONE || species > SPECIES_ARCEUS) {
        GF_ASSERT(0);
        return TRUE;
    }

    return FALSE;
}
