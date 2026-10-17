#include "application/capsule_menu/defs.h"

u8 ov57_02237E78(CapsuleAppData *appData) {
    return appData->unk30;
}

void ov57_02237E80(CapsuleAppData *appData, u8 a1) {
    appData->unk30 = a1;
}

void ov57_02237E88(CapsuleAppData *appData, u8 a1) {
    appData->unk31 = a1;
}
