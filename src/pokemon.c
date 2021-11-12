#include "pokemon.h"

u32 _021D421C[MAX_LEVEL + 1];

void MonEncryptSegment(void *data, u32 size, u32 key);
void MonDecryptSegment(void *data, u32 size, u32 key);
u32 CalcMonChecksum(void *data, u32 size);

#define BOX_ENCRY(box) do {                                                              \
    MonEncryptSegment(&((box)->substructs), sizeof((box)->substructs), (box)->checksum); \
} while (0)
#define PTY_ENCRY(mon) do {                                                   \
    MonEncryptSegment(&((mon)->party), sizeof((mon)->party), (mon)->box.pid); \
} while (0)
#define BOX_DECRY(box) do {                                                              \
    MonDecryptSegment(&((box)->substructs), sizeof((box)->substructs), (box)->checksum); \
} while (0)
#define PTY_DECRY(mon) do {                                                   \
    MonDecryptSegment(&((mon)->party), sizeof((mon)->party), (mon)->box.pid); \
} while (0)

void ZeroMonData(POKEMON *pokemon) {
    MI_CpuClearFast(pokemon, sizeof(POKEMON));
    BOX_ENCRY(&pokemon->box);
    PTY_ENCRY(pokemon);
}

void ZeroBoxMonData(BOXMON *boxmon) {
    MI_CpuClearFast(boxmon, sizeof(BOXMON));
    BOX_ENCRY(boxmon);
}

u32 SizeOfStructPokemon(void) {
    return sizeof(POKEMON);
}

POKEMON *AllocMonZeroed(HeapID heapId) {
    POKEMON *ret = (POKEMON *)AllocFromHeap(heapId, sizeof(POKEMON));
    ZeroMonData(ret);
    return ret;
}

BOOL AcquireMonLock(POKEMON *pokemon) {
    BOOL locked = FALSE;
    if (!pokemon->box.party_lock) {
        locked = TRUE;
        GF_ASSERT(!pokemon->box.box_lock);
        pokemon->box.party_lock = TRUE;
        pokemon->box.box_lock = TRUE;
        PTY_DECRY(pokemon);
        BOX_DECRY(&pokemon->box);
    }
    return locked;
}

BOOL ReleaseMonLock(POKEMON *pokemon, BOOL locked) {
    BOOL prev = FALSE;
    if (pokemon->box.party_lock == TRUE && locked == TRUE) {
        prev = TRUE;
        pokemon->box.party_lock = FALSE;
        pokemon->box.box_lock = FALSE;
        PTY_ENCRY(pokemon);
        pokemon->box.checksum = CalcMonChecksum(pokemon->box.substructs, sizeof(pokemon->box.substructs));
        BOX_ENCRY(&pokemon->box);
    }
    return prev;
}

BOOL AcquireBoxMonLock(BOXMON *boxmon) {
    BOOL locked = FALSE;
    if (!boxmon->box_lock) {
        locked = TRUE;
        boxmon->box_lock = TRUE;
        BOX_DECRY(boxmon);
    }
    return locked;
}

BOOL ReleaseBoxMonLock(BOXMON *boxmon, BOOL locked) {
    BOOL prev = FALSE;
    if (boxmon->box_lock == TRUE && locked == TRUE) {
        prev = TRUE;
        boxmon->box_lock = FALSE;
        boxmon->checksum = CalcMonChecksum(boxmon->substructs, sizeof(boxmon->substructs));
        BOX_ENCRY(boxmon);
    }
    return prev;
}
