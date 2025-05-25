#include "global.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"

typedef struct RadioFuncs {
    void (*setup)(RadioSub60 *);
    void (*print)(RadioSub60 *);
    void (*teardown)(RadioSub60 *);
} RadioFuncs;

u8 ov101_021F58E0(RadioSub60 *a0, int a1);
BOOL ov101_021F5AB8(RadioSub60 *a0);
BOOL ov101_021F5B24(RadioSub60 *a0);
BOOL ov101_021F5B68(RadioSub60 *a0);
void ov101_021F5C44(RadioSub60 *a0);

extern const RadioFuncs ov101_021F8A04[];

RadioSub60 *ov101_021F57B8(SaveData *saveData, u16 mapID, u16 mapHeader, BOOL inKanto, Window *win1, Window *win2, Window *win3, u32 textColor, HeapID heapId) {
    LocalFieldData *r4 = Save_LocalFieldData_Get(saveData);
    PlayerSaveData *sp4 = LocalFieldData_GetPlayer(r4);
    u16 *sp8 = LocalFieldData_GetMusicIdAddr(r4);
    RadioSub60 *ret = AllocFromHeap(heapId, sizeof(RadioSub60));
    MI_CpuClear8(ret, sizeof(RadioSub60));
    ret->unk_04 = saveData;
    ret->unk_08 = mapID;
    ret->unk_0A = mapHeader;
    ret->unk_66_2 = inKanto;
    ret->unk_0C = win1;
    ret->unk_10 = win2;
    ret->unk_14 = win3;
    ret->unk_18 = textColor;
    ret->unk_5B = ret->unk_18 >> 16;
    ret->unk_5D = ret->unk_18 >> 8;
    ret->unk_5C = ret->unk_18;
    ret->unk_00 = heapId;
    ret->unk_20 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0269_bin, ret->unk_00);
    ret->unk_44 = MessageFormat_New_Custom(8, 51, ret->unk_00);
    ret->unk_48 = String_New(51, ret->unk_00);
    ret->unk_4C = String_New(51, ret->unk_00);
    ret->unk_50 = String_New(51, ret->unk_00);
    ret->unk_6C = String_New(1351, ret->unk_00);
    ret->unk_70 = String_New(1351, ret->unk_00);
    if (sub_0205C7EC(sp4) != 1) {
        *sp8 = 0;
    }
    return ret;
}

void ov101_021F58A0(RadioSub60 *a0) {
    String_Delete(a0->unk_70);
    String_Delete(a0->unk_6C);
    String_Delete(a0->unk_50);
    String_Delete(a0->unk_4C);
    String_Delete(a0->unk_48);
    MessageFormat_Delete(a0->unk_44);
    DestroyMsgData(a0->unk_20);
    MI_CpuClear8(a0, sizeof(RadioSub60));
    FreeToHeap(a0);
}

u8 ov101_021F58E0(RadioSub60 *a0, int a1) {
    if (a1 >= 8) {
        a1 = 0;
    }
    if (a0->unk_66_4) {
        a0->unk_66_4 = 0;
        return 11;
    }

    GF_RTC_CopyDateTime(&a0->unk_28, &a0->unk_38);
    switch (a1) {
    case 0:
        return 0;
    case 1:
        return 1;
    case 2:
        return 5 + (a0->unk_38.hour % 2);
    case 3:
        return 2 + (a0->unk_38.hour % 3);
    case 4:
        return 7;
    case 5:
        return 8;
    case 6:
        return 9;
    case 7:
        return 10;
    }

    return 0;
}

void ov101_021F5970(RadioSub60 *a0, int a1, int a2) {
    a0->unk_66_0 = 0;
    if (a1 >= 8) {
        a1 = 0;
    }
    a0->unk_58 = a1;
    if (a0->unk_59 != 11) {
        a0->unk_5A = a0->unk_59;
    }
    a0->unk_59 = ov101_021F58E0(a0, a1);
    a0->unk_5E = 0;
    a0->unk_68 = 45;
    a0->unk_67 = 0;
    a0->unk_6A = 8;
    a0->unk_69 = 0;
    a0->unk_66_1 = a2;
    a0->unk_66_3 = 0;
    a0->unk_5F = 0;
    if (a0->unk_59 != 11 && a0->unk_5A != a0->unk_59) {
        a0->unk_54 = 0;
    }
    FillWindowPixelBuffer(a0->unk_0C, (a0->unk_5C << 4) | a0->unk_5C);
    CopyWindowToVram(a0->unk_0C);
    ov101_021F8A04[a0->unk_59].setup(a0);
    ov101_021F5C44(a0);
}

void ov101_021F5A50(RadioSub60 *a0) {
    if (a0->unk_1C) {
        ov101_021F8A04[a0->unk_59].teardown(a0);
    }
    FillWindowPixelBuffer(a0->unk_0C, (a0->unk_5C << 4) | a0->unk_5C);
    CopyWindowToVram(a0->unk_0C);
    a0->unk_66_4 = 0;
}

void ov101_021F5A9C(RadioSub60 *a0, int a1) {
    a0->unk_66_1 = a1;
}

BOOL ov101_021F5AB8(RadioSub60 *a0) {
    u8 r2;

    if (a0->unk_67 < a0->unk_68) {
        ++a0->unk_67;
        return FALSE;
    }

    if (a0->unk_69) {
        ScrollWindow(a0->unk_0C, 0, 2, 0);
        CopyWindowToVram(a0->unk_0C);
    }
    r2 = a0->unk_69;
    ++a0->unk_69;
    if (r2 < 8) {
        return FALSE;
    }
    a0->unk_69 = 0;
    a0->unk_67 = 0;
    return TRUE;
}

BOOL ov101_021F5B24(RadioSub60 *a0) {
    u8 r2;
    ScrollWindow(a0->unk_0C, 0, 2, 0);
    CopyWindowToVram(a0->unk_0C);
    r2 = a0->unk_69;
    ++a0->unk_69;
    if (r2 < a0->unk_6A) {
        return FALSE;
    }
    a0->unk_69 = 0;
    return TRUE;
}

BOOL ov101_021F5B68(RadioSub60 *a0) {
    u8 r3 = a0->unk_67;
    ++a0->unk_67;
    if (r3 < a0->unk_68) {
        return FALSE;
    }
    a0->unk_67 = 0;
    return TRUE;
}
