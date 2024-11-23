#include "overlay_2/overlay_02_02251E74.h"

#include "fashion_case.h"
#include "math_util.h"
#include "overlay_01_021F467C.h"
#include "overlay_01_021F944C.h"
#include "overlay_01_022053EC.h"
#include "script_pokemon_util.h"
#include "unk_0200FA24.h"
#include "unk_02062108.h"
#include "unk_020689C8.h"

static const u8 ov02_02253D54[] = { 47, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 95, 96 };

BOOL ov02_02253134(SaveData *saveData) {
    u8 i;
    FashionCase *fashionCase = Save_FashionData_GetFashionCase(Save_FashionData_Get(saveData));

    for (i = 0; i < 39; i++) {
        if (sub_0202BA2C(fashionCase, ov02_02253D54[i], 1) == TRUE) {
            return FALSE;
        }
    }

    return TRUE;
}

u8 ov02_0225316C(void) {
    u8 rand = LCRandom() % 39;
    return ov02_02253D54[rand];
}

BOOL ov02_02253188(SaveData *saveData) {
    FashionCase *fashionCase = Save_FashionData_GetFashionCase(Save_FashionData_Get(saveData));

    for (u8 i = 0; i < 14; i++) {
        if (sub_0202BA5C(fashionCase, i) == FALSE) {
            return FALSE;
        }
    }

    return TRUE;
}

u8 ov02_022531B4(SaveData *saveData) {
    u8 cnt = 0;
    u8 data[14];

    for (u8 i = 0; i < 14; i++) {
        data[i] = 0;
    }

    FashionCase *fashionCase = Save_FashionData_GetFashionCase(Save_FashionData_Get(saveData));

    for (u8 i = 0; i < 14; i++) {
        if (sub_0202BA5C(fashionCase, i) == 0) {
            data[cnt] = i;
            cnt++;
        }
    }

    if (cnt == 0) {
        GF_ASSERT(FALSE);
        return 0;
    }

    u8 rand = LCRandom() % cnt;
    return data[rand];
}
