#include "save.h"

u32 sub_0202D938(void) {
    return 0xe;
}

void sub_0202D93C(u8* argP) {
    argP[0] = 0;
    argP[1] = 0;
    argP[2] = 0;
    argP[3] = 0;
    argP[4] = 0;
    argP[5] = 0;
    argP[6] = 0;
    argP[7] = 0;
    argP[8] = 0;
    argP[9] = 0;
    argP[10] = 0;
    argP[11] = 0;
    argP[12] = 0;
    argP[13] = 0;
}

void* sub_0202D95C(SAVEDATA* data) {
    return SavArray_get(data, 0x14);
}
