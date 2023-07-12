#include "global.h"
#include "heap.h"
#include "system.h"
#include "unk_02005D10.h"
#include "unk_0200CF18.h"
#include "unk_020192D0.h"
#include "unk_02020654.h"
#include "unk_02025154.h"
#include "constants/sndseq.h"
#include "voltorb_flip/voltorb_flip.h"
#include "voltorb_flip/voltorb_flip_data.h"
#include "voltorb_flip/voltorb_flip_input.h"

static void ov122_021E8E78(Ov122_021E8CFC *);
static void ov122_021E8F58(Ov122_021E8CFC *);
static int ov122_021E8F6C(Ov122_021E8CFC *);
static int ov122_021E9020(Ov122_021E8CFC *);
static void ov122_021E9108(Ov122_021E8CFC *, int );
static void ov122_021E9134(Ov122_021E8CFC *);
static void ov122_021E9154(Ov122_021E8CFC *, int);
static void ov122_021E91AC(struct Ov122_021E8CFC *, u32, int, int);

extern const Ov122UnkCB ov122_021E9A0C[];
extern const u8 ov122_021E9A1C[];
extern const u8 ov122_021E9A3C[];
extern const u8 ov122_021E9AAC[];
extern u8 ov122_021E9BA0[5][2];

Ov122_021E8CFC *ov122_021E8CFC(HeapID heapId, struct UnkStruct_0200CF18 *a1, struct UnkStruct_0200CF18 *a2) {
    GF_ASSERT(a1 != NULL);

    Ov122_021E8CFC *ptr = AllocFromHeap(heapId, sizeof(Ov122_021E8CFC));
    MI_CpuFill8(ptr, 0, sizeof(Ov122_021E8CFC));

    ptr->unk0 = a1;
    ptr->unk4 = a2;
    ptr->unk8 = sub_02019BA4(ov122_021E9A3C, ov122_021E9AAC, ov122_021E9A0C, ptr, 1, ptr->unkD, heapId);

    ov122_021E9108(ptr, 0);
    return ptr;
}

void ov122_021E8D58(Ov122_021E8CFC *a0) {
    GF_ASSERT(a0->unk8 != 0);
    sub_02019BDC(a0->unk8);
    FreeToHeap(a0);
}

int ov122_021E8D74(Ov122_021E8CFC *a0) {
    if (a0->memoFocused) {
        return ov122_021E8F6C(a0);
    }
    return ov122_021E9020(a0);
}

void ov122_021E8D8C(Ov122_021E8CFC *a0, int a1) {
    if (a1 != 0) {
        sub_0200DCE8(a0->unk0, 1);
        return;
    }
    sub_0200DCE8(a0->unk0, 0);
    a0->unkD = 0;
}

void SetMemoOpen(Ov122_021E8CFC *a0, BOOL val) {
    a0->memoOpen = val;
    ov122_021E9154(a0, a0->unkD);
}

void SetMemoFocused(Ov122_021E8CFC *a0, BOOL val) {
    a0->memoFocused = val;
    ov122_021E9154(a0, a0->unkD);
    sub_0200DCE8(a0->unk4, val);
}

int ov122_021E8DF0(Ov122_021E8CFC *a0) {
    GF_ASSERT(a0 != 0);
    GF_ASSERT(a0->unk8 != 0);
    // This seems to return which touch screen hitbox was pressed/clicked
    return sub_02019F74(a0->unk8);
}

int ov122_021E8E0C(Ov122_021E8CFC *a0) {
    GF_ASSERT(a0 != 0);
    GF_ASSERT(a0->unk8 != 0);
    return a0->unkEx;
}

BOOL ov122_021E8E28(Ov122_021E8CFC *a0) {
    int var1 = sub_02019F74(a0->unk8);
    return var1 != 25 && var1 != 26;
}

void ov122_021E8E40(Ov122_021E8CFC *a0) {
    sub_02019F7C(a0->unk8, 0);
    ov122_021E9108(a0, 0);
}

void ov122_021E8E58(Ov122_021E8CFC *a0) {
    a0->unkEx = 0;
    a0->unkEy = 0;
    ov122_021E9134(a0);
}

BOOL ov122_021E8E70(Ov122_021E8CFC *a0) {
    return a0->unkFz;
}

// Probably for handling focus movement
static void ov122_021E8E78(Ov122_021E8CFC *a0) {
    int var2;
    u8 var1 = a0->unkEx;

    if ((gSystem.newAndRepeatedKeys & 0x80) != 0) {
        var2 = var1 + 2;
        if (var2 > 4) {
            var2 = 4;
        }
        a0->unkEx = var2;
    } else if ((gSystem.newAndRepeatedKeys & 0x20) != 0) {
        var2 = var1 - 1;
        if (var2 < 0) {
            var2 = 0;
        }
        a0->unkEx = var2;
    } else if ((gSystem.newAndRepeatedKeys & 0x40) != 0) {
        if (var1 == 4 && (u8)(a0->unkEy + 0xfe) <= 1) {
                a0->unkEx = (a0->unkEy);
        } else {
            var2 = var1 - 2;
            if (var2 < 0) {
                var2 = 0;
            }
            a0->unkEx = var2;
        }
    } else if ((gSystem.newAndRepeatedKeys & 0x10) != 0) {
        var2 = var1 + 1;
        if (var2 > 4) {
            var2 = 4;
        }
        a0->unkEx = var2;
    }

    if (var1 != a0->unkEx) {
        a0->unkEy = var1;
        ov122_021E9134(a0);
        PlaySE(SEQ_SE_DP_SELECT);
    }
}

static void ov122_021E8F58(Ov122_021E8CFC *a0) {
    a0->unkEx = 4;
    ov122_021E9134(a0);
}

static int ov122_021E8F6C(Ov122_021E8CFC *a0) {
    a0->unkFz = FALSE;

    if ((gSystem.newKeys & (1 << 10)) != 0) {
        return 4;
    }
    if ((gSystem.newKeys & 2) != 0) {
        ov122_021E8F58(a0);
        return 3;
    }
    if ((gSystem.newKeys & 1) != 0) {
        if (a0->unkEx == 4) {
            ov122_021E8F58(a0);
            return 3;
        }
        return 1;
    }

    ov122_021E8E78(a0);
    a0->unkFz = TRUE;

    u8 var1 = sub_02025224(ov122_021E9A1C);
    if (var1 < 8) {
        switch (var1) {
        case 4:
            a0->unkEx = var1;
            ov122_021E9134(a0);
            return 3;
        case 5:
            return 4;
        case 6:
            return 2;
        default:
            a0->unkEx = var1;
            ov122_021E9134(a0);
            return 1;
        }
    }
    return 0;
}

static int ov122_021E9020(Ov122_021E8CFC *a0) {
    int var1 = sub_02019F74(a0->unk8);
    u32 elementId = sub_02019D18(a0->unk8);
    sub_02019F74(a0->unk8);

    if (elementId < 28) {
        a0->unkFz = System_GetTouchNew();
        // Open/close Memo button
        if (elementId == 25) {
            if (a0->unkFz) {
                a0->unkD = var1;
                sub_02019F7C(a0->unk8, a0->unkD);
            } else {
                ov122_021E8E40(a0);
            }
            return 4;
        }
        // Quit button
        if (elementId == 26) {
            return 2;
        }
        return 1;
    }

    a0->unkFz = 0;
    if ((gSystem.newKeys & (1 << 10)) != 0) {
        if ((u8)(a0->unkD + 0xe7) <= 1) {
            ov122_021E8E40(a0);
        }
        return 4;
    }
    if ((gSystem.newKeys & 2) != 0) {
        return 3;
    }

    if (a0->memoOpen && a0->unkD != 25 && a0->unkD != 26) {
        u32 var3 = sub_02025224(ov122_021E9A1C);
        if (var3 < 8) {
            switch (var3) {
            case 0:
                return 5;
            case 1:
                return 6;
            case 2:
                return 7;
            case 3:
                return 8;
            }
        }
    }
    return 0;
}

static void ov122_021E9108(Ov122_021E8CFC *a0, int a1) {
    u8 temp1;
    u8 temp2;

    ov122_021E9154(a0, a1);
    sub_02020A0C(sub_0201A018(a0->unk8, a1), &temp1, &temp2);
    sub_0200DDB8(a0->unk0, temp1, temp2);
    a0->unkD = a1;
}

static void ov122_021E9134(Ov122_021E8CFC *a0) {
    sub_0200DDB8(a0->unk4, ov122_021E9BA0[a0->unkEx][0], ov122_021E9BA0[a0->unkEx][1]);
}

static void ov122_021E9154(Ov122_021E8CFC *a0, int newFocus) {
    int indicatorType;

    if (newFocus < 25) {
        if (a0->memoFocused) {
            indicatorType = 24; // Disabled pencil
        } else if (a0->memoOpen) {
            indicatorType = 23; // Pencil
        } else {
            indicatorType = 18; // Card focus
        }
    } else if (newFocus == 25) {
        indicatorType = 7; // Open/close Memo button
    } else  if (newFocus == 26) {
        indicatorType = 4; // Quit button
    } else {
        GF_ASSERT(FALSE);
    }

    if (a0->memoOpen) {
        sub_0200DD10(a0->unk0, 4);
    } else {
        sub_0200DD10(a0->unk0, 2);
    }
    sub_0200DC58(a0->unk0, indicatorType);
}

static void ov122_021E91AC(Ov122_021E8CFC *a0, u32 newFocus, int a2, int a3) {
    if ((a3 == 0 || newFocus != 25) && newFocus != a2 && newFocus < 28) {
        // Updates visual focus indicator
        ov122_021E9108(a0, newFocus);
        // Plays when you switch focus
        PlaySE(SEQ_SE_DP_SELECT);
    }
}

void ov122_021E91D0(Ov122_021E8CFC *a0, int a1, int a2) {
    sub_02019F7C(a0->unk8, (u8)a1);
    ov122_021E9108(a0, a1);
    PlaySE(SEQ_SE_DP_SELECT);
}

void ov122_021E91F4(Ov122_021E8CFC *a0, int a1, int a2) {}

void ov122_021E91F8(Ov122_021E8CFC *a0, int a1, int a2) {
    if (a1 == 27) {
        a1 = a0->unkC * 5 + 4;
        GF_ASSERT(a1 < 25);
        sub_02019F7C(a0->unk8, (u8)a1);
    } else if (a1 == 28) {
        a1 = a0->unkC * 5;
        GF_ASSERT(a1 < 25);
        sub_02019F7C(a0->unk8, (u8)a1);
    }

    if (a1 != 25 && a1 != 26) {
        a0->unkC = a1 / 5;
    }
    ov122_021E91AC(a0, a1, a2, 0);
}

void ov122_021E925C(Ov122_021E8CFC *a0, int a1, int a2) {
    ov122_021E91AC(a0, a1, a2, 1);
}
