#include "unk_0202D938.h"
#include "save.h"

#define SAVE_UNK_20 0x14

u32 sub_0202D938(void) {
    return sizeof(UnkSavStruct20);
}

void sub_0202D93C(UnkSavStruct20* ptr) {
    UnkSavStruct20 unk_struct = *ptr;
    unk_struct.filler_00[0] = 0;
    unk_struct.filler_00[1] = 0;
    unk_struct.filler_00[2] = 0;
    unk_struct.filler_00[3] = 0;
    unk_struct.filler_00[4] = 0;
    unk_struct.filler_00[5] = 0;
    unk_struct.filler_00[6] = 0;
    unk_struct.filler_00[7] = 0;
    unk_struct.filler_00[8] = 0;
    unk_struct.filler_00[9] = 0;
    unk_struct.filler_00[10] = 0;
    unk_struct.filler_00[11] = 0;
    unk_struct.filler_00[12] = 0;
    unk_struct.filler_00[13] = 0;
}

UnkSavStruct20* sub_0202D95C(SAVEDATA* data) {
    return SavArray_get(data, SAVE_UNK_20);
}
