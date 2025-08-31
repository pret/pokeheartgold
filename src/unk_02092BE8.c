#include "unk_02092BE8.h"

#include "global.h"

#include "constants/maps.h"
#include "constants/phone_contacts.h"
#include "constants/sndseq.h"

#include "overlay_2/overlay_02_02251E74.h"
#include "overlay_2/overlay_02_gear_phone.h"

#include "field_system.h"
#include "map_header.h"
#include "overlay_02.h"
#include "pokedex.h"
#include "safari_zone.h"
#include "save_arrays.h"
#include "scrcmd.h"
#include "sys_vars.h"
#include "unk_02005D10.h"
#include "unk_02054E00.h"
#include "unk_0206D494.h"

static void FieldSystem_InitPokegearArgs(FieldSystem *sys, PokegearArgs *ptr, BOOL isMap);
static void sub_02092E54(GearPhoneRingManager *ptr);
static void gearRingingManagerReset(GearPhoneRingManager *ptr);
static void GearPhoneRingManager_Reset(GearPhoneRingManager *ptr);
static void SysTask_RingGearPhone(SysTask *task, GearPhoneRingManager *ptr);

static void FieldSystem_InitPokegearArgs(FieldSystem *sys, PokegearArgs *pokegearArgs, BOOL isMap) {
    s16 x, y;
    Unk_PokegearSTRUCT_14 Unk_struct;
    SaveVarsFlags *state = Save_VarsFlags_Get(sys->saveData);
    LocalFieldData *points = Save_LocalFieldData_Get(sys->saveData);
    Location *warpPtr = LocalFieldData_GetSpecialSpawnWarpPtr(points);
    Location *PosPtr = LocalFieldData_GetCurrentPosition(points);
    GearPhoneRingManager *phoneRingMgr = FieldSystem_GetGearPhoneRingManager(sys);
    pokegearArgs->saveData = sys->saveData;
    pokegearArgs->mapID = PosPtr->mapId;
    if (MapHeader_MapIsOnMainMatrix(pokegearArgs->mapID)) {
        pokegearArgs->x = PlayerAvatar_GetXCoord(sys->playerAvatar);
        pokegearArgs->z = PlayerAvatar_GetZCoord(sys->playerAvatar);
        pokegearArgs->matrixXCoord = pokegearArgs->x / 32;
        pokegearArgs->matrixYCoord = pokegearArgs->z / 32;
        pokegearArgs->mapHeader = pokegearArgs->mapID;
    } else {
        pokegearArgs->x = warpPtr->x;
        pokegearArgs->z = warpPtr->y;
        MapHeader_GetWorldMapCoords(pokegearArgs->mapID, &x, &y);
        MAPMATRIX *matrix = MapMatrix_New();
        MapMatrix_Load(MAP_NEW_BARK, matrix);
        if (x == 0 && y == 0) {
            pokegearArgs->matrixXCoord = pokegearArgs->x / 32;
            pokegearArgs->matrixYCoord = pokegearArgs->z / 32;
        } else {
            pokegearArgs->matrixXCoord = x;
            pokegearArgs->matrixYCoord = y;
        }
        pokegearArgs->mapHeader = MapMatrix_GetMapHeader(matrix, pokegearArgs->matrixXCoord, pokegearArgs->matrixYCoord);
        MapMatrix_Free(matrix);
    }

    pokegearArgs->playerGender = PlayerProfile_GetTrainerGender(Save_PlayerData_GetProfile(FieldSystem_GetSaveData(sys)));
    pokegearArgs->menuInputStatePtr = &sys->menuInputState;
    pokegearArgs->menuInputState = sub_0203DF3C(sys);
    pokegearArgs->mapMusicID = FieldSystem_GetOverriddenMusicId(sys, pokegearArgs->mapID);

    if (isMap) {
        return;
    }
    if (GearPhoneRingManager_IsRinging(phoneRingMgr)) {
        pokegearArgs->callerId = ov02_02251EE8(phoneRingMgr, &Unk_struct);
        if (pokegearArgs->callerId >= NUM_PHONE_CONTACTS) {
            pokegearArgs->isScriptedLaunch = 0;
        } else {
            // scripted phone call
            pokegearArgs->callScriptID = Unk_struct.callScriptID;     // message num?
            pokegearArgs->isScriptedCall = Unk_struct.isScriptedCall; // call type?
            if (pokegearArgs->isScriptedCall == 3) {
                sub_0202F050(SaveData_GetPhoneCallPersistentState(sys->saveData), Unk_struct.unk_2);
            } else if (pokegearArgs->isScriptedCall == 0) {
                sub_0202AB18(Save_Misc_Get(sys->saveData), Unk_struct.unk_0, Unk_struct.unk_1, pokegearArgs->callerId);
            }
            gearRingingManagerReset(phoneRingMgr);
            pokegearArgs->isScriptedLaunch = 1;
        }
    } else {
        pokegearArgs->isScriptedLaunch = 0;
    }
}

void FieldSystem_InitPokegearArgs_Phone(FieldSystem *sys, PokegearArgs *pokegearArgs) {
    FieldSystem_InitPokegearArgs(sys, pokegearArgs, FALSE);
}

void FieldSystem_InitPokegearArgs_Map(FieldSystem *sys, PokegearArgs *pokegearArgs) {
    FieldSystem_InitPokegearArgs(sys, pokegearArgs, TRUE);
}

GearPhoneRingManager *GearPhoneRingManager_New(enum HeapID heapID, FieldSystem *sys) {
    GearPhoneRingManager *ptr = Heap_Alloc(heapID, sizeof(GearPhoneRingManager));
    MI_CpuClear8(ptr, sizeof(GearPhoneRingManager));
    gearRingingManagerReset(ptr);
    ptr->unk_varC = 10;
    ptr->maxActiveDuration = 30;
    ptr->unk_var12 = 50;
    ptr->saveData = sys->saveData;
    ptr->pokegearData = SaveData_Pokegear_Get(ptr->saveData);
    ptr->savingsData = SaveData_GetPhoneCallPersistentState(ptr->saveData);
    ptr->sys = sys;
    return ptr;
}

void GearPhoneRingManager_Delete(GearPhoneRingManager *ptr) {
    MI_CpuClear8(ptr, sizeof(GearPhoneRingManager));
    Heap_Free(ptr);
}

GearPhoneRingManager *FieldSystem_GetGearPhoneRingManager(FieldSystem *sys) {
    return sys->phoneRingManager;
}

void GearPhoneRingManager_StartRinging(GearPhoneRingManager *ptr) {
    ptr->active = TRUE;
    ptr->activeTimer = 0;
}

BOOL GearPhoneRingManager_IsRinging(GearPhoneRingManager *ptr) {
    return ptr->active;
}

PhoneBookEntry *GearPhoneRingManager_GetCallerPhoneBookEntry(GearPhoneRingManager *ptr) {
    return &ptr->entry;
}

void sub_02092E14(GearPhoneRingManager *ptr, u8 a1, BOOL a2) {
    sub_0202F01C(ptr->savingsData, a1);
    if (a2) {
        if (ptr->unk_var8 < ptr->unk_varC - 1) {
            ptr->unk_var8 = ptr->unk_varC - 1;
        }
    }
}

void sub_02092E34(GearPhoneRingManager *ptr, s32 a1, BOOL a2) {
    if (!ptr->unk_var0_2) {
        ptr->unk_var0_2 = TRUE;
        if (a1 >= 10) {
            return;
        }
    }
    ptr->unk_var8 += a1;
    sub_02092E54(ptr);
}

static void sub_02092E54(GearPhoneRingManager *ptr) {
    SaveVarsFlags *state = Save_VarsFlags_Get(ptr->saveData);
    SafariZone *zone = Save_SafariZone_Get(ptr->saveData);
    IGT *igt = Save_PlayerData_GetIGTAddr(ptr->saveData);
    u8 var4057 = Save_VarsFlags_GetVar4057(state);
    u8 i;
    for (i = 0; i < 5; i++) {
        if (sub_0202F08C(ptr->savingsData, i + 7)) {
            return;
        }
    }
    u8 var = SafariZone_GetObjectUnlockLevel(zone);
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
        if (!Pokedex_GetNatDexFlag(Save_Pokedex_Get(ptr->saveData))) {
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

void GearPhoneRingManager_HandleTimeAdvance(GearPhoneRingManager *ptr, s64 seconds) {
    if (!ptr->active) {
        return;
    }
    if (ptr->activeTimer == 0) {
        ptr->activeTimer = seconds;
    } else {
        int var = seconds - ptr->activeTimer;
        if (var < 0 || var > ptr->maxActiveDuration || var > 59) {
            GearPhoneRingManager_Reset(ptr);
        }
    }
}

static void gearRingingManagerReset(GearPhoneRingManager *ptr) {
    GearPhone_ToggleRinging(ptr, FALSE);
    ptr->unk_var8 = 0;
    ptr->activeTimer = 0;
    ptr->active = FALSE;
    ptr->unk_var0_1 = FALSE;
    ptr->ringing = FALSE;
    ptr->callerId = PHONE_CONTACT_NONE;
    ptr->isScriptedCall = 0;
    ptr->callScriptID = 0;
    ptr->unk_var7 = 0;
    ptr->entry.id = PHONE_CONTACT_NONE;
    ptr->unk_var12 = 50;
}

static void GearPhoneRingManager_Reset(GearPhoneRingManager *ptr) {
    gearRingingManagerReset(ptr);
}

void GearPhoneRingManager_ResetIfActive(GearPhoneRingManager *ptr) {
    if (ptr->active) {
        gearRingingManagerReset(ptr);
    }
}

static void SysTask_RingGearPhone(SysTask *task, GearPhoneRingManager *ptr) {
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

void GearPhone_ToggleRinging(GearPhoneRingManager *ptr, BOOL toggle) {
    if (toggle) {
        if (ptr->ringing) {
            return;
        }
        MI_CpuClear8(&ptr->gearRing, sizeof(struct PokegearRingingTask));
        ptr->gearRing.task = SysTask_CreateOnMainQueue((SysTaskFunc)SysTask_RingGearPhone, ptr, -1);
        ptr->ringing = TRUE;
    } else {
        if (!ptr->ringing) {
            return;
        }
        if (ptr->gearRing.task != NULL) {
            SysTask_Destroy(ptr->gearRing.task);
        }
        MI_CpuClear8(&ptr->gearRing, sizeof(struct PokegearRingingTask));
        ptr->ringing = FALSE;
    }
}

BOOL sub_02093070(FieldSystem *sys) {
    if (SavePokegear_IsNumberRegistered(SaveData_Pokegear_Get(sys->saveData), PHONE_CONTACT_BILL) == 0xff) {
        return FALSE;
    }
    if (Save_VarsFlags_CheckFlagInArray(Save_VarsFlags_Get(sys->saveData), FLAG_UNK_985)) {
        return FALSE;
    }
    if (PCStorage_CountEmptySpotsInAllBoxes(SaveArray_PCStorage_Get(sys->saveData)) != 0) {
        return FALSE;
    }
    sub_02092E14(FieldSystem_GetGearPhoneRingManager(sys), 3, TRUE);
    return TRUE;
}

BOOL sub_020930C4(FieldSystem *sys) {
    int owned = Pokedex_CountNationalDexOwned(Save_Pokedex_Get(sys->saveData));
    SaveVarsFlags *state = Save_VarsFlags_Get(sys->saveData);
    if (SavePokegear_IsNumberRegistered(SaveData_Pokegear_Get(sys->saveData), PHONE_CONTACT_PROF__OAK) == 0xff) {
        return FALSE;
    }
    u16 var = (owned / 50);
    if (var == 0) {
        return FALSE;
    }
    if (var > 9) {
        var = 9; // unreachable
    }
    if (!Save_VarsFlags_CheckFlagInArray(state, var + FLAG_SYS_OAK_ACKNOWLEDGED_NATIONAL_DEX_COMPLETION)) {
        sub_02092E14(FieldSystem_GetGearPhoneRingManager(sys), 4, FALSE);
        return TRUE;
    }
    return FALSE;
}

BOOL sub_02093134(FieldSystem *sys, Pokemon *mon) {
    if (MonIsFromTogepiEgg(mon, sys->saveData) == 0) {
        return FALSE;
    }
    sub_02092E14(FieldSystem_GetGearPhoneRingManager(sys), 0, 1);
    Save_VarsFlags_SetFlagInArray(Save_VarsFlags_Get(sys->saveData), FLAG_SYS_HATCHED_TOGEPI_EGG);
    return TRUE;
}

BOOL sub_0209316C(FieldSystem *sys) {
    SaveVarsFlags *state = Save_VarsFlags_Get(sys->saveData);
    if (SavePokegear_IsNumberRegistered(SaveData_Pokegear_Get(sys->saveData), PHONE_CONTACT_DAY_C_MAN) == 0xff) {
        return FALSE;
    }
    if (Save_VarsFlags_CheckFlagInArray(state, FLAG_UNK_992) && !Save_VarsFlags_CheckFlagInArray(state, FLAG_UNK_99E)) {
        return FALSE;
    }
    sub_02092E14(FieldSystem_GetGearPhoneRingManager(sys), 5, 1);
    return TRUE;
}
