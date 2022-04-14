#include "unk_02005D10.h"
#include "unk_02092BE8.h"
#include "safari_zone.h"
#include "map_header.h"
#include "scrcmd.h"
#include "unk_02054E00.h"
#include "unk_0203DE74.h"
#include "unk_0206D494.h"
#include "sys_vars.h"
#include "overlay_02.h"
#include "pokedex.h"
#include "save_arrays.h"
#include "constants/sndseq.h"
#include "constants/maps.h"
#include "constants/phone_contacts.h"

static void sub_02092BE8(FieldSystem* sys, Unk_PokegearSTRUCT_2C* ptr, BOOL a2);
static void sub_02092E54(GearPhoneRingManager* ptr);
static void gearRingingManagerReset(GearPhoneRingManager* ptr);
static void sub_02092FA0(GearPhoneRingManager* ptr);
static void SysTask_RingGearPhone(SysTask *task, GearPhoneRingManager* ptr);

static void sub_02092BE8(FieldSystem* sys, Unk_PokegearSTRUCT_2C* ptr, BOOL a2) {
    Unk_PokegearSTRUCT_14 Unk_struct;
    SCRIPT_STATE *state = SavArray_Flags_get(sys->savedata);
    FLYPOINTS_SAVE *points = Save_FlyPoints_get(sys->savedata); 
    Location *warpPtr = FlyPoints_GetSpecialSpawnWarpPtr(points); 
    Location *PosPtr = FlyPoints_GetPosition(points); 
    GearPhoneRingManager* phoneRingMgr = Fsys_GetGearPhoneRingManager(sys);
    ptr->saveData = sys->savedata;
    ptr->mapID = PosPtr->mapId;
    if (MapHeader_MapIsOnMainMatrix(ptr->mapID)) { 
        ptr->x = GetPlayerXCoord(sys->playerAvatar);
        ptr->y = GetPlayerYCoord(sys->playerAvatar);
        ptr->matrixXCoord = ptr->x / 32;
        ptr->matrixYCoord = ptr->y / 32;
        ptr->mapHeader = ptr->mapID;
    } else {
        ptr->x = warpPtr->x;
        ptr->y = warpPtr->y;
        MapHeader_GetWorldMapCoords(ptr->mapID, &Unk_struct.x, &Unk_struct.y);
        MAPMATRIX* matrix = MapMatrix_New();
        MapMatrix_Load(MAP_T20, matrix);
        if (Unk_struct.x == 0 && Unk_struct.y == 0) {
            ptr->matrixXCoord = ptr->x / 32;
            ptr->matrixYCoord = ptr->y / 32;
        } else {
            ptr->matrixXCoord = Unk_struct.x;
            ptr->matrixYCoord = Unk_struct.y;
        }
        ptr->mapHeader = MapMatrix_GetMapHeader(matrix, ptr->matrixXCoord, ptr->matrixYCoord);
        MapMatrix_Free(matrix);
    }

    ptr->playerGender = PlayerProfile_GetTrainerGender(Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(sys)));
    ptr->unk28 = &sys->unk_10C;
    ptr->unk01 = sub_0203DF3C(sys);
    ptr->mapMusicID = Fsys_GetSurfOverriddenMusicId(sys, ptr->mapID);
    
    if (a2) {
        return;
    }
    if (sub_02092E08(phoneRingMgr)) {
        ptr->unk04 = ov02_02251EE8(phoneRingMgr, &Unk_struct.unk04);
        if (ptr->unk04 >= 75) {
            ptr->unk00 = 0;
        } else {
            ptr->unk06 = Unk_struct.unk08;
            ptr->unk05 = Unk_struct.unk07;
            if (ptr->unk05 == 3) {
                sub_0202F050(SaveData_GetMomsSavingsAddr(sys->savedata), Unk_struct.unk06);
            }
            else if (ptr->unk05 == 0) {
                sub_0202AB18(Sav2_Misc_get(sys->savedata), Unk_struct.unk04, Unk_struct.unk05, ptr->unk04);
            }
            gearRingingManagerReset(phoneRingMgr);
            ptr->unk00 = 1;
        }
    } else {
        ptr->unk00 = 0;
    }
}

void sub_02092D80(FieldSystem* sys, Unk_PokegearSTRUCT_2C* ptr) {
    sub_02092BE8(sys, ptr, FALSE);
}

void sub_02092D8C(FieldSystem* sys, Unk_PokegearSTRUCT_2C* ptr) {
    sub_02092BE8(sys, ptr, TRUE);
}

GearPhoneRingManager* GearPhoneRingManager_new(HeapID heapId, FieldSystem* sys) {
    GearPhoneRingManager * ptr = AllocFromHeap(heapId, sizeof(GearPhoneRingManager));
    MI_CpuClear8(ptr, sizeof(GearPhoneRingManager));
    gearRingingManagerReset(ptr);
    ptr->unk_varC = 10;
    ptr->unk_var10 = 30;
    ptr->unk_var12 = 50;
    ptr->saveData = sys->savedata;
    ptr->pokegear_data = SaveData_GSPlayerMisc_get(ptr->saveData);
    ptr->savings_data = SaveData_GetMomsSavingsAddr(ptr->saveData);
    ptr->sys = sys;
    return ptr;
}

void sub_02092DD8(GearPhoneRingManager * ptr) {
    MI_CpuClear8(ptr, sizeof(GearPhoneRingManager));
    FreeToHeap(ptr);
}

GearPhoneRingManager* Fsys_GetGearPhoneRingManager(FieldSystem* sys) {
    return sys->unk114;
}

void sub_02092DF4(GearPhoneRingManager* ptr) {
    ptr->unk_var0_0 = TRUE;
    ptr->unk_var14 = 0;
}

BOOL sub_02092E08(GearPhoneRingManager* ptr) {
    return ptr->unk_var0_0;
}

PhoneBookEntry* sub_02092E10(GearPhoneRingManager* ptr) {
    return &ptr->entry;
}

void sub_02092E14(GearPhoneRingManager* ptr, u8 a1, BOOL a2) {
    sub_0202F01C(ptr->savings_data, a1);
    if (a2) {
        if (ptr->unk_var8 < ptr->unk_varC - 1) {
            ptr->unk_var8 = ptr->unk_varC - 1;
        }
    }
}

void sub_02092E34(GearPhoneRingManager* ptr, s32 a1, BOOL a2) {
    if (!ptr->unk_var0_2) {
        ptr->unk_var0_2 = TRUE;
        if (a1 >= 10) {
            return;
        }
    }
    ptr->unk_var8 += a1;
    sub_02092E54(ptr);
}

static void sub_02092E54(GearPhoneRingManager* ptr) {
    SCRIPT_STATE* state = SavArray_Flags_get(ptr->saveData);
    SAFARIZONE* zone = Save_SafariZone_get(ptr->saveData);
    IGT* igt = Sav2_PlayerData_GetIGTAddr(ptr->saveData);
    u8 var4057 = ScriptState_GetVar4057(state);
    u8 i;
    for (i = 0; i < 5; i++) {
        if (sub_0202F08C(ptr->savings_data, i + 7)) {
            return;
        }
    }
    u8 var = sub_0202F720(zone);
    if (var4057 < 3 || var >= 4) {
        return;
    }
    if (var4057 == 3) {
        if (sub_0202F798(zone, igt, 3) == 0) {
            return;
        }
        sub_02092E14(ptr, 7, TRUE);
    } else {
        if (var4057 < 6) {
            return;
        }
        if (!Pokedex_GetNatDexFlag(Sav2_Pokedex_get(ptr->saveData))) {
            return;
        }
        u32 Unkvar = sub_0202F798(zone, igt, 3);
        if (Unkvar == 0) {
            return;
        }
        if (Unkvar > 1) {
            if (var < 3) {
                sub_02092E14(ptr, 11, TRUE);
            } else {
                sub_02092E14(ptr, 10, TRUE);
            }
        } else {
            if (var == 0) {
                sub_02092E14(ptr, 8, TRUE);
            } else {
                if (var == 3) {
                    sub_02092E14(ptr, 10, TRUE);
                } else {
                    sub_02092E14(ptr, 9, TRUE);
                }
            }
        }
    }
}

void sub_02092F30(GearPhoneRingManager* ptr, s64 seconds) {
    if (!ptr->unk_var0_0) {
        return;
    }
    if (ptr->unk_var14 == 0) {
        ptr->unk_var14 = seconds;
    } else {
        int var = seconds - ptr->unk_var14;
        if (var < 0 || var > ptr->unk_var10 || var > 59) {
            sub_02092FA0(ptr);
        }
    }
}

static void gearRingingManagerReset(GearPhoneRingManager* ptr) {
    GearPhone_ToggleRinging(ptr, FALSE);
    ptr->unk_var8 = 0;
    ptr->unk_var14 = 0;
    ptr->unk_var0_0 = FALSE;
    ptr->unk_var0_1 = FALSE;
    ptr->unk_var0_3 = FALSE;
    ptr->unk_var2 = 0xff;
    ptr->unk_var3 = 0;
    ptr->unk_var4 = 0;
    ptr->unk_var7 = 0;
    ptr->entry.unk0 = 0xff;
    ptr->unk_var12 = 50;
}

static void sub_02092FA0(GearPhoneRingManager* ptr) {
    gearRingingManagerReset(ptr);
}

void sub_02092FA8(GearPhoneRingManager* ptr) {
    if (ptr->unk_var0_0) {
        gearRingingManagerReset(ptr);
    }
}

static void SysTask_RingGearPhone(SysTask *task, GearPhoneRingManager* ptr) {
    if (ptr->gearRing.counter++ == 0) {
        if (!IsSEPlaying(SEQ_SE_GS_PHONE1)) {
            PlaySE_SetPitch(SEQ_SE_GS_PHONE1, 0);
        } else {
            if (ptr->gearRing.counter < 15) {
                ptr->gearRing.counter = 15;
            }
        }
    }
    if (ptr->gearRing.counter >= 30) {
        ptr->gearRing.counter = 0;
    }
}

void GearPhone_ToggleRinging(GearPhoneRingManager* ptr, BOOL a1) {
    if (a1) {
        if (ptr->unk_var0_3) {
            return;
        }
        MI_CpuClear8(&ptr->gearRing, sizeof(struct PokegearRingingTask));
        ptr->gearRing.task = CreateSysTask((SysTaskFunc)SysTask_RingGearPhone, ptr, -1);
        ptr->unk_var0_3 = TRUE;
    } else {
        if (!ptr->unk_var0_3) {
            return;
        }
        if (ptr->gearRing.task != NULL) {
            DestroySysTask(ptr->gearRing.task);
        }
        MI_CpuClear8(&ptr->gearRing, sizeof(struct PokegearRingingTask));
        ptr->unk_var0_3 = FALSE;
    }
}

BOOL sub_02093070(FieldSystem* sys) {
    if (GSPlayerMisc_IsGearNumberRegistered(SaveData_GSPlayerMisc_get(sys->savedata), PHONE_CONTACT_BILL) == 0xff) {
        return FALSE;
    }
    if (CheckFlagInArray(SavArray_Flags_get(sys->savedata), FLAG_UNK_985)) {
        return FALSE;
    }
    if (PCStorage_CountEmptySpotsInAllBoxes(GetStoragePCPointer(sys->savedata)) != 0) {
        return FALSE;
    }
    sub_02092E14(Fsys_GetGearPhoneRingManager(sys), 3, TRUE);
    return TRUE;
}

BOOL sub_020930C4(FieldSystem* sys) {
    int owned = Pokedex_CountNationalDexOwned(Sav2_Pokedex_get(sys->savedata));
    SCRIPT_STATE* state = SavArray_Flags_get(sys->savedata);
    if (GSPlayerMisc_IsGearNumberRegistered(SaveData_GSPlayerMisc_get(sys->savedata), PHONE_CONTACT_PROF__OAK) == 0xff) {
        return FALSE;
    }
    u16 var = (owned / 50);
    if (var == 0) {
        return FALSE;
    }
    if (var > 9) {
        var = 9; // unreachable
    }
    if (!CheckFlagInArray(state, var + FLAG_UNK_988)) {
        sub_02092E14(Fsys_GetGearPhoneRingManager(sys), 4, FALSE);
        return TRUE;
    }
    return FALSE;
}

BOOL sub_02093134(FieldSystem* sys, POKEMON * pkmn) {
    if (sub_0206D8D0(pkmn, sys->savedata) == 0) {
        return FALSE;
    }
    sub_02092E14(Fsys_GetGearPhoneRingManager(sys), 0, 1);
    SetFlagInArray(SavArray_Flags_get(sys->savedata), FLAG_UNK_983);
    return TRUE;
}

BOOL sub_0209316C(FieldSystem* sys) {
    SCRIPT_STATE* state = SavArray_Flags_get(sys->savedata);
    if (GSPlayerMisc_IsGearNumberRegistered(SaveData_GSPlayerMisc_get(sys->savedata), PHONE_CONTACT_DAY_C_MAN) == 0xff) {
        return FALSE;
    }
    if (CheckFlagInArray(state, FLAG_UNK_992) && !CheckFlagInArray(state, FLAG_UNK_99E)) {
        return FALSE;
    }
    sub_02092E14(Fsys_GetGearPhoneRingManager(sys), 5, 1);
    return TRUE;
}
