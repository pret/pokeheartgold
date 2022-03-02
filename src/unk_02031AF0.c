#include "unk_02031AF0.h"
#include "save.h"

u16 sub_02031AF0() { 
    return SAVE_UNK_40;
}
void sub_02031AF4(u16* unk) {
    MI_CpuFill8(unk, 0, SAVE_UNK_40);
}

u16* sub_02031B00(SAVEDATA* savedata) {
    return SavArray_get(savedata, SAVE_UNK_29);
}