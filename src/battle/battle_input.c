#include "global.h"
#include "battle/battle_input.h"
#include "gf_gfx_loader.h"
#include "heap.h"
#include "palette.h"
#include "unk_02013534.h"

BattleInput *BattleInput_New() {
    BattleInput *input = AllocFromHeap(HEAP_ID_BATTLE, sizeof(BattleInput));
    MI_CpuFill8(input, 0, sizeof(BattleInput));

    input->unk6EF = -1;

    return input;
}

extern BgTemplate ov12_0226E5DC[4];

void ov12_0226604C(BgConfig *config) {
    for (int i = 0; i < NELEMS(ov12_0226E5DC); i++) {
        InitBgFromTemplate(config, i + GF_BG_LYR_SUB_0, &ov12_0226E5DC[i], 0);
        BgFillTilemapBufferAndCommit(config, i + GF_BG_LYR_SUB_0, 767);
        BgSetPosTextAndCommit(config, i + GF_BG_LYR_SUB_0, BG_POS_OP_SET_X, 0);
        BgSetPosTextAndCommit(config, i + GF_BG_LYR_SUB_0, BG_POS_OP_SET_Y, 0);
    }
}

void ov12_022660A8(BgConfig *config) {
    for (int i = 0; i < NELEMS(ov12_0226E5DC); i++) {
        ToggleBgLayer(i + GF_BG_LYR_SUB_0, GX_LAYER_TOGGLE_OFF);
        FreeBgTilemapBuffer(config, i + GF_BG_LYR_SUB_0);
    }
}

typedef struct NCLRIndex {
    u16 baseIndex;
    u16 animationIndex;
} NCLRIndex;

extern NCLRIndex ov12_0226E580[23];
extern u16 ov12_0226E298[7];
