#include "unk_0202F370.h"

BOOL sub_0202F370(UnkPokegearSub8 *unk) {
    if (unk->unk_0 == 0 || unk->unk_0 >= 540) {
        return FALSE;
    } else {
        return TRUE;
    }
}

void sub_0202F388(UnkPokegearSub8 *unk) {
    int i;

    unk->unk_0 = 0;
    unk->unk_2_0 = 15;
    unk->unk_2_4 = 15;
    unk->unk_2_8 = 15;
    unk->unk_2_C = 15;
    for (i = 0; i < 4; i++) {
        unk->unk_4[i] = 0xFFFF;
    }
}

void sub_0202F3DC(struct UnkStruct_0202F3DC *unk) {
    int i;

    unk->unk_0 = 0;
    for (i = 0; i < 4; i++) {
        unk->unk_4[i] = 0xF;
        unk->unk_8[i] = 0xFFFF;
    }
}

BOOL sub_0202F400(struct UnkStruct_0202F3DC *unk) {
    int i;

    for (i = 0; i < 4; i++) {
        if (unk->unk_4[i] != 0xF || unk->unk_8[i] != 0xFFFF) {
            return TRUE;
        }
    }

    unk->unk_0 = 0;
    return FALSE;
}

void sub_0202F434(struct UnkStruct_0202F3DC *src, UnkPokegearSub8 *dest) {
    int i;
    dest->unk_0 = src->unk_0;
    // The explicit masks are required to match
    dest->unk_2_0 = src->unk_4[0] & 0xF;
    dest->unk_2_4 = src->unk_4[1] & 0xF;
    dest->unk_2_8 = src->unk_4[2] & 0xF;
    dest->unk_2_C = src->unk_4[3] & 0xF;
    for (i = 0; i < 4; i++) {
        dest->unk_4[i] = src->unk_8[i];
    }
}

void sub_0202F4B0(UnkPokegearSub8 *src, struct UnkStruct_0202F3DC *dest) {
    int i;
    dest->unk_0 = src->unk_0;
    dest->unk_4[0] = src->unk_2_0;
    dest->unk_4[1] = src->unk_2_4;
    dest->unk_4[2] = src->unk_2_8;
    dest->unk_4[3] = src->unk_2_C;
    for (i = 0; i < 4; i++) {
        dest->unk_8[i] = src->unk_4[i];
    }
}

BOOL sub_0202F4E8(UnkPokegearSub8List *list, u8 a1) {
    if (a1 >= 100) {
        return FALSE;
    } else {
        return sub_0202F370(&list->list[a1]);
    }
}

void sub_0202F500(UnkPokegearSub8List *list, u8 a1) {
    if (a1 < 100) {
        sub_0202F388(&list->list[a1]);
    }
}

BOOL sub_0202F514(UnkPokegearSub8List *list, struct UnkStruct_0202F3DC *a1, u8 a2) {
    if (a2 >= 100) {
        sub_0202F3DC(a1);
        return FALSE;
    } else {
        sub_0202F4B0(&list->list[a2], a1);
        return sub_0202F370(&list->list[a2]);
    }
}

BOOL sub_0202F53C(UnkPokegearSub8List *list, struct UnkStruct_0202F3DC *a1, u8 a2, BOOL a3) {
    if (a2 >= 100) {
        return FALSE;
    }
    if (!a3) {
        if (sub_0202F370(&list->list[a2]) == TRUE) {
            return FALSE;
        }
    }
    sub_0202F434(a1, &list->list[a2]);
    return TRUE;
}
