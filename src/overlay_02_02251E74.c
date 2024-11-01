#include "overlay_2/overlay_02_02251E74.h"

#include "fieldmap.h"
#include "map_header.h"
#include "math_util.h"
#include "msgdata.h"
#include "phonebook_dat.h"
#include "sav_system_info.h"
#include "save_local_field_data.h"
#include "save_vars_flags.h"

String *GetPhoneBookEntryName(GearPhoneRingManager *gearPhone, HeapID heapId) {
    String *str;
    if (!gearPhone->unk_var0_0 || gearPhone->unk_var2 >= 0x4b) {
        str = String_New(8, heapId);
    } else {
        int phoneMsg     = GetPhoneMessageGmm(gearPhone->unk_var2);
        MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, phoneMsg, heapId);
        str              = NewString_ReadMsgData(msgData, 0);
        DestroyMsgData(msgData);
    }
    return str;
}

void ov02_02251EB8(GearPhoneRingManager *gearPhone, u8 a1, u8 a2, u8 a3, u8 a4, u8 a5) {
    if (a1 >= 0x4b) {
        gearPhone->unk_var2    = 0xFF;
        gearPhone->unk_arr5[0] = 0xFF;
        gearPhone->unk_arr5[1] = 0;
        GF_ASSERT(FALSE);
    } else {
        gearPhone->unk_var2    = a1;
        gearPhone->unk_arr5[0] = a2;
        gearPhone->unk_arr5[1] = a3;
    }

    gearPhone->unk_var3 = a4;
    gearPhone->unk_var4 = a5;
}

u8 ov02_02251EE8(GearPhoneRingManager *gearPhone, u8 *a1) {
    MI_CpuFill8(a1, 0, 5);
    if (gearPhone->unk_var2 >= 0x4b) {
        GF_ASSERT(FALSE);
        a1[0] = 0xFF;
        return 0xFF;
    }
    a1[0] = gearPhone->unk_arr5[0];
    a1[1] = gearPhone->unk_arr5[1];
    a1[3] = gearPhone->unk_var3;
    a1[4] = gearPhone->unk_var4;
    a1[2] = gearPhone->unk_var7;
    return gearPhone->unk_var2;
}

BOOL ov02_02251F20(GearPhoneRingManager *gearPhone) {
    Location *position = LocalFieldData_GetCurrentPosition(Save_LocalFieldData_Get(gearPhone->saveData));

    if (MapHeader_GetField14_1E(position->mapId) == 0) {
        return FALSE;
    }

    if (gearPhone->unk_var0_0 || gearPhone->unk_var8 < gearPhone->unk_varC) {
        return FALSE;
    }

    PhoneBook *phoneBook = AllocAndReadPhoneBook(HEAP_ID_4);
    u32 var              = ov02_022521C0(gearPhone, phoneBook, position->mapId);
    if (var) {
        FreePhoneBook(phoneBook);
        if (var == 2) {
            gearPhone->sys->unkD2_7 = 1;
            StartMapSceneScript(gearPhone->sys, 0x7FF, 0);
            return TRUE;
        }
        ov02_022522AC(gearPhone, 1);
        return FALSE;
    }
    u32 rand = MTRandom() % 0x64;

    if (rand > gearPhone->unk_var12) {
        FreePhoneBook(phoneBook);
        gearPhone->unk_var8 = 0;
        return FALSE;
    }

    var = ov02_02251FDC(gearPhone, phoneBook, position->mapId);
    FreePhoneBook(phoneBook);

    if (var == 0) {
        gearPhone->unk_var8 = 0;
    }
    return FALSE;
}
