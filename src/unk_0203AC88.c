#include "global.h"

typedef struct UnkStruct_0203AC88 {
    void *func1;
    void *func2;
    void *func3;
} UnkStruct_0203AC88;

const UnkStruct_0203AC88 *sub_0203AC88(void);
int sub_0203AC90(void);

extern void sub_02097238(void);
extern void sub_02097230(void);
extern void sub_02097248(void);
extern void sub_0209722C(void);
extern void sub_02097258(void);
extern void sub_02097234(void);

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
