#include "unk_020379A0.h"

#include "global.h"

#include "unk_02035900.h"

struct UnkStruct_021D414C {
    u8 unk_000[8][2];
    u8 unk_010[8];
    u8 unk_018[8][0x48];
    u8 unk_258[8];
    u8 unk_260;
    u8 unk_261;
    u8 unk_262;
    u8 unk_263;
} *_021D414C;

void sub_020379A0(enum HeapID heapId) {
    if (_021D414C == NULL) {
        _021D414C = Heap_Alloc(heapId, sizeof(struct UnkStruct_021D414C));
        MI_CpuClear8(_021D414C, sizeof(struct UnkStruct_021D414C));
    }
    for (int i = 0; i < 8; ++i) {
        _021D414C->unk_010[i] = 0xFF;
    }
    _021D414C->unk_261 = 0xFF;
    _021D414C->unk_262 = 0xFF;
    _021D414C->unk_263 = 0;
    _021D414C->unk_260 = 0;
}

void sub_020379F8(void) {
    Heap_Free(_021D414C);
    _021D414C = NULL;
}

BOOL sub_02037A10(void) {
    return _021D414C != NULL;
}

void sub_02037A24(u8 a0, int a1, u8 *a2) {
    u8 sp0[4];

    sp0[0] = *a2;
    if (!sub_0203769C()) {
        sp0[1] = a0;
        sp0[2] = sp0[0];
        sub_02037184(18, &sp0[1]);
        _021D414C->unk_010[a0] = sp0[0];
        for (int i = 0; i < 8; ++i) {
            if (sub_020373B4(i) && _021D414C->unk_010[i] != sp0[0]) {
                return;
            }
        }
        if (!sub_02037184(17, &sp0[0])) {
            _021D414C->unk_260 = 1;
        }
    }
}

void sub_02037A98(int a0, int a1, u8 *a2) {
    _021D414C->unk_010[a2[0]] = a2[1];
}

void sub_02037AAC(int a0, int a1, u8 *a2) {
    _021D414C->unk_261 = *a2;
}

void sub_02037AC0(u8 a0) {
    _021D414C->unk_262 = a0;
    _021D414C->unk_263 = 1;
}

void sub_02037ADC(void) {
    if (_021D414C != NULL) {
        if (_021D414C->unk_263 != 0 && sub_020376E0(16, &_021D414C->unk_262)) {
            _021D414C->unk_263 = 0;
        }
        if (_021D414C->unk_260 != 0 && sub_02037184(17, _021D414C->unk_010)) {
            _021D414C->unk_260 = 0;
        }
    }
}

BOOL sub_02037B38(u8 a0) {
    if (_021D414C == NULL) {
        return TRUE;
    }
    return _021D414C->unk_261 == a0;
}

u8 sub_02037B5C(u8 a0) {
    return _021D414C->unk_010[a0];
}

void sub_02037B6C(u8 a0, int a1, u8 *a2) {
    _021D414C->unk_000[a0][0] = a2[0];
    _021D414C->unk_000[a0][1] = a2[1];
}

u8 sub_02037B88(void) {
    return 2; // chosen by fair dice roll, guaranteed to be random
}

BOOL sub_02037B8C(u8 a0, u8 a1, u8 *a2) {
    u8 sp0[2];

    sp0[0] = a0;
    sp0[1] = a1;
    return sub_020376E0(19, sp0);
}

int sub_02037BA0(u8 a0, u8 a1) {
    if (_021D414C == NULL) {
        return -1;
    }
    if (_021D414C->unk_000[a0][0] == a1) {
        return _021D414C->unk_000[a0][1];
    }
    return -1;
}

void sub_02037BC8(void) {
    for (int i = 0; i < 8; ++i) {
        MI_CpuClear8(_021D414C->unk_000[i], 2);
    }
}

void sub_02037BEC(void) {
    for (int i = 0; i < 8; ++i) {
        _021D414C->unk_258[i] = 0;
    }
}

u32 sub_02037C0C(u32 a0, u16 *a1) {
    if (_021D414C != NULL) {
        MI_CpuCopy8(a1, _021D414C->unk_018[a0], 0x46);
        sub_020376E0(20, _021D414C->unk_018[a0]);
        return TRUE;
    }

    return FALSE;
}

u8 *sub_02037C44(u8 a0) {
    if (_021D414C->unk_258[a0] != 0) {
        return _021D414C->unk_018[a0];
    }

    return NULL;
}

void sub_02037C68(u8 a0, int a1, u8 *a2) {
    _021D414C->unk_258[a0] = 1;
    MI_CpuCopy8(a2, _021D414C->unk_018[a0], 0x46);
}
