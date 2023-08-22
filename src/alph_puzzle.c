#include "global.h"
#include "alph_puzzle.h"
#include "sound_02004A44.h"

BOOL ov110_AlphPuzzle_OvyInit(OVY_MANAGER *man, int *state) {
    switch (*state) {
    case 0:
        ov110_021E5A24();
        CreateHeap(HEAP_ID_3, HEAP_ID_ALPH_PUZZLE, 0x20000);
        AlphPuzzleData *data = OverlayManager_CreateAndGetData(man, sizeof(AlphPuzzleData), HEAP_ID_ALPH_PUZZLE);
        MI_CpuFill8(data, 0, sizeof(AlphPuzzleData));
        data->heapId = HEAP_ID_ALPH_PUZZLE;
        data->unk10 = OverlayManager_GetArgs(man);
        sub_02004EC4(74, 0, 0);
        ov110_021E5A74(data);
        (*state)++;
        break;
    case 1:
        if (ov110_021E5AD4(OverlayManager_GetData(man))) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}