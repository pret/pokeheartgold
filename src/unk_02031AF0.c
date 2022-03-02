#include "unk_02031AF0.h"
#include "save.h"

u32 sub_02031AF0(void) { 
    return sizeof(UnkSaveStruct29);
}

void sub_02031AF4(UnkSaveStruct29* unk) {
    MI_CpuFill8(unk, 0, sizeof(UnkSaveStruct29));
}

UnkSaveStruct29* sub_02031B00(SAVEDATA* savedata) {
    return SavArray_get(savedata, SAVE_UNK_29);
}
