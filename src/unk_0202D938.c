#include "unk_0202D938.h"
#include "save.h"
#include "constants/save_arrays.h"

u32 sub_0202D938(void) {
    return sizeof(UnkSavStruct20);
}

void sub_0202D93C(UnkSavStruct20* ptr) {
    memset(ptr, 0, sizeof(UnkSavStruct20));
}

UnkSavStruct20* sub_0202D95C(SAVEDATA* data) {
    return SavArray_get(data, SAVE_UNK_20);
}
