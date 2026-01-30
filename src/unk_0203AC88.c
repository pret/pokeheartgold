#include "unk_0203AC88.h"

#include "global.h"

#include "unk_020971F8.h"

static const UnkStruct_0203AC88 sUnkTable_0203AC88[] = {
    { sub_02097238, sub_02097230, NULL },
    { sub_02097248, sub_0209722C, NULL },
    { sub_02097258, sub_02097234, NULL },
};

const UnkStruct_0203AC88 *sub_0203AC88(void) {
    return sUnkTable_0203AC88;
}

int sub_0203AC90(void) {
    return NELEMS(sUnkTable_0203AC88);
}
