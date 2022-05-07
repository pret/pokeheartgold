#include "constants/apricorns.h"
#include "save_misc_data.h"
#include "apricorn_tree.h"

static const u8 sTreeApricorns[NUM_APRICORN_TREE] = {
    APRICORN_BLK, // Route 1
    APRICORN_PNK, // Route 2 North
    APRICORN_YLW, // Route 8
    APRICORN_GRN, // Route 11
    APRICORN_BLU, // Route 26
    APRICORN_GRN, // Route 29
    APRICORN_GRN, // Route 30
    APRICORN_PNK, // Route 30
    APRICORN_BLK, // Route 31
    APRICORN_PNK, // Route 33
    APRICORN_BLK, // Route 33
    APRICORN_GRN, // Route 35
    APRICORN_BLU, // Route 36
    APRICORN_RED, // Route 37
    APRICORN_BLU, // Route 37
    APRICORN_BLK, // Route 37
    APRICORN_WHT, // Route 38
    APRICORN_GRN, // Route 39
    APRICORN_PNK, // Route 42
    APRICORN_GRN, // Route 42
    APRICORN_YLW, // Route 42
    APRICORN_BLK, // Route 43
    APRICORN_RED, // Route 44
    APRICORN_GRN, // Route 45
    APRICORN_GRN, // Route 46
    APRICORN_YLW, // Route 46
    APRICORN_BLU, // Pewter City
    APRICORN_WHT, // Pewter City
    APRICORN_RED, // Fuchsia City
    APRICORN_YLW, // Violet City
    APRICORN_WHT, // Azalea Town
};

void sub_0202AE30(APRICORN_TREE *tree);

void ApricornTrees_init(APRICORN_TREE *trees) {
    int i;
    MI_CpuClear8(trees, sizeof(APRICORN_TREE) * MAX_APRICORN_TREE);
    for (i = 0; i < MAX_APRICORN_TREE; i++) {
        trees[i].unk_0 = 0;
    }
}

void sub_0202AE0C(APRICORN_TREE *trees) {
    int i;
    for (i = 0; i < MAX_APRICORN_TREE || i < NUM_APRICORN_TREE; i++) {
        sub_0202AE30(&trees[i]);
        trees[i].unk_0 = 1;
        trees[i].unk_1 = 1;
    }
}

void sub_0202AE30(APRICORN_TREE *tree) {
    tree->unk_0 = 0;
    tree->unk_1 = 0;
}

u8 sub_0202AE38(const APRICORN_TREE *trees, int idx) {
    return trees[idx].unk_0;
}

// Returns the Apricorn type or APRICORN_NONE if undefined.
u8 ApricornTrees_TryGetApricorn(const APRICORN_TREE *trees, int idx) {
#pragma unused(trees)
    return sTreeApricorns[idx];
}

// Returns the Apricorn type. Defaults to APRICORN_RED if Apricorn type is
// undefined.
int ApricornTrees_GetApricorn(const APRICORN_TREE *trees, int idx) {
#pragma unused(trees)
    int ret;
    ret = sTreeApricorns[idx];
    if (ret <= 0) {
        GF_ASSERT(0);
        return 0;
    }
    return ret - 1;
}

void sub_0202AE68(APRICORN_TREE *trees, int idx) {
    sub_0202AE30(&trees[idx]);
}

void sub_0202AE74(APRICORN_TREE *trees) {
    int i;
    for (i = 0; i < MAX_APRICORN_TREE; i++) {
        if (!trees[i].unk_0) {
            trees[i].unk_0 = 1;
            trees[i].unk_1 = 1;
        }
    }
}
