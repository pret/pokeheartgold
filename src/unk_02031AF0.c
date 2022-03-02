#include "unk_02031AF0.h"
#include "save.h"

u16 sub_02031AF0() { 
    return sizeof(UnkSaveStruct29);
}

void sub_02031AF4(u16* unk) {
    MI_CpuFill8(unk, 0, sizeof(UnkSaveStruct29));
}

UnkSaveStruct29* sub_02031B00(SAVEDATA* savedata) {
    return SavArray_get(savedata, SAVE_UNK_29);
}
