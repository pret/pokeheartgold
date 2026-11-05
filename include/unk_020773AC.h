#ifndef POKEHEARTGOLD_UNK_020773AC_H
#define POKEHEARTGOLD_UNK_020773AC_H

#include "library/spl_emitter.h"

#include "gf_3d_vramman.h"

typedef struct UnkSplTemplate_02077604 {
    enum HeapID heapId;
    int fileId;
} UnkSplTemplate_02077604;

typedef struct UnkStruct_02077604 {
    UnkSplTemplate_02077604 tmplate;
    u8 filler_08[4];
    SPLEmitter *emitter;
} UnkStruct_02077604;

void sub_020773AC(void);
void sub_020773D4(void);
GF3DVramMan *sub_02077400(enum HeapID heapId);
void sub_020774A0(void);
void sub_020774E0(void);
UnkStruct_02077604 *sub_02077604(const UnkSplTemplate_02077604 *tmplate);
void sub_02077634(UnkStruct_02077604 *a0, int res_no);
BOOL sub_02077650(UnkStruct_02077604 *a0);
void sub_02077664(UnkStruct_02077604 *a0);

#endif // POKEHEARTGOLD_UNK_020773AC_H
