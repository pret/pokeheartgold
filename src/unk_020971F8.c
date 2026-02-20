#include "unk_020971F8.h"

#include "global.h"
#include "unk_02033AE0.h"
#include "overlay_44.h"

void sub_020971F8(s32 arg0) {
    const UnkStruct_0203AC88* unkStruct;

    unkStruct = sub_0203AC88();
    sub_0203410C(unkStruct, sub_0203AC90(), arg0);
}

void sub_02097214(void) {
    const UnkStruct_0203AC88* unkStruct;

    unkStruct = sub_0203AC88();
    sub_0203410C(unkStruct, sub_0203AC90(), 0);
}

s32 sub_0209722C(void) {
    return 0;
}

s32 sub_02097230(void) {
    return 8;
}

s32 sub_02097234(void) {
    return 4;
}

void sub_02097238(void* arg0, void* arg1, void* arg2, void* arg3) {
    if (arg3 != 0) {
        ov44_02233100(arg3, arg2);
    }
}

void sub_02097248(void* arg0, void* arg1, void* arg2, void* arg3) {
    if (arg3 != 0) {
        ov44_02233160(arg3);
    }
}

void sub_02097258(void* arg0, void* arg1, void* arg2, void* arg3) {
    if (arg3 != 0) {
        ov44_0223317C(arg3, arg2);
    }
}