#include "battle_input.h"
#include "heap.h"

BattleInput *BattleInput_New() {
    BattleInput *input = AllocFromHeap(HEAP_ID_BATTLE, sizeof(BattleInput));
    MI_CpuFill8(input, 0, sizeof(BattleInput));

    input->unk6EF = -1;

    return input;
}