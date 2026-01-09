#include "unk_02026E84.h"

#include "global.h"

u16 *GetMainBgPlttAddr(void) {
    return (u16 *)HW_BG_PLTT;
}

int sub_02026E8C(void) {
    return HW_BG_PLTT_SIZE;
}

u16 *GetSubBgPlttAddr(void) {
    return (u16 *)HW_DB_BG_PLTT;
}

int sub_02026E9C(void) {
    return HW_BG_PLTT_SIZE;
}

u16 *GetMainObjPlttAddr(void) {
    return (u16 *)HW_OBJ_PLTT;
}

u16 *GetSubObjPlttAddr(void) {
    return (u16 *)HW_DB_OBJ_PLTT;
}
