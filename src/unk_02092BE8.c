#include "unk_02092BE8.h"
#include "safari_zone.h"
#include "constants/sndseq.h"
#include "constants/maps.h"
#include "constants/phone_contacts.h"

void sub_02092BE8(FieldSystem* sys, Unk_PokegearSTRUCT_2C* ptr, BOOL Unkbool) { 
    Unk_PokegearSTRUCT_14 Unk_struct;
    SCRIPT_STATE *state = SavArray_Flags_get(sys->savedata);
    FLYPOINTS_SAVE *points = Save_FlyPoints_get(sys->savedata); 
    Location *warpPtr = FlyPoints_GetSpecialSpawnWarpPtr(points); 
    Location *PosPtr = FlyPoints_GetPosition(points); 
    UnkFsysSub_114* Unk_V1 = sub_02092DEC(sys); 
    ptr->data = sys->savedata;
    ptr->mapID = PosPtr->mapId;
    if (MapHeader_MapIsOnMainMatrix(ptr->mapID)) { 
        ptr->x = GetPlayerXCoord(sys->playerAvatar);
        ptr->y = GetPlayerYCoord(sys->playerAvatar);
        ptr->matrixXCoord = ptr->x / 32;
        ptr->matrixYCoord = ptr->y / 32;
        ptr->mapHeader = ptr->mapID;
    } else {
        ptr->x = warpPtr->x;
        ptr->y = warpPtr->z;
        MapHeader_GetWorldMapCoords(ptr->mapID, &(Unk_struct.x), &(Unk_struct.y));
        MAPMATRIX* matrix = MapMatrix_New();
        MapMatrix_Load(MAP_T20, matrix);
        if (Unk_struct.x == 0 && Unk_struct.y == 0) {
            ptr->matrixXCoord = ptr->x / 32;
            ptr->matrixYCoord = ptr->y /32;
        } else {
            ptr->matrixXCoord = Unk_struct.x;
            ptr->matrixYCoord = Unk_struct.y;
        }
        ptr->mapHeader = MapMatrix_GetMapHeader(matrix, ptr->matrixXCoord, ptr->matrixYCoord);
        MapMatrix_Free(matrix);
    }

    ptr->playerGender = PlayerProfile_GetTrainerGender(Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(sys)));
    ptr->unkPtr28 = &sys->unk_10C;
    ptr->unkFsysVar01 = sub_0203DF3C(sys);
    ptr->mapMusicID = Fsys_GetSurfOverriddenMusicId(sys, ptr->mapID);
    
    if (Unkbool != 0) {
        return;
    }
    if (sub_02092E08(Unk_V1) != 0) {
        ptr->unkVar04 = ov02_02251EE8(Unk_V1, &(Unk_struct.unkVar0c));
        if (ptr->unkVar04 >= 75) {
            ptr->unkBool00 = 0;
            return;
        } else {
            ptr->unkVar06 = Unk_struct.unkVar10;
            ptr->unkVar05 = Unk_struct.unkVar0f;
            if (ptr->unkVar05 == 3) {
                sub_0202F050(SaveData_GetMomsSavingsAddr(sys->savedata), Unk_struct.unkVar0e);
            }
            else if (ptr->unkVar05 == 0) {
                sub_0202AB18(Sav2_Misc_get(sys->savedata), Unk_struct.unkVar0c, Unk_struct.unkVar0d, ptr->unkVar04);
            }
            sub_02092F64(Unk_V1);
            ptr->unkBool00 = 1;
            return;
        }
    } else {
        ptr->unkBool00 = 0;
        return;
    }
}

void sub_02092D80(FieldSystem* sys, Unk_PokegearSTRUCT_2C* ptr){
    sub_02092BE8(sys, ptr, 0);
}

void sub_02092D8C(FieldSystem* sys, Unk_PokegearSTRUCT_2C* ptr){
    sub_02092BE8(sys, ptr, 1);
}

UnkFsysSub_114* sub_02092D98(HeapID id, FieldSystem* sys){ 
    UnkFsysSub_114 * ptr = AllocFromHeap(id, sizeof(UnkFsysSub_114));
    MI_CpuFill8(ptr, 0, sizeof(UnkFsysSub_114));
    sub_02092F64(ptr);
    ptr->unk_varC = 10;
    ptr->unk_var10 = 30;
    ptr->unk_var12 = 50;
    ptr->data = sys->savedata;
    ptr->pokegear_data = SaveData_GSPlayerMisc_get(ptr->data);
    ptr->savings_data = SaveData_GetMomsSavingsAddr(ptr->data);
    ptr->sys = sys;
    return ptr;
}

void sub_02092DD8(UnkFsysSub_114 * ptr){
    MI_CpuFill8(ptr, 0, sizeof(UnkFsysSub_114));
    FreeToHeap(ptr);
}

UnkFsysSub_114* sub_02092DEC(FieldSystem* sys){
    return sys->unk114;
}

void sub_02092DF4(UnkFsysSub_114* ptr){
    ptr->unk_var0_0 = 1;
    ptr->unk_var14 = 0;
}

u8 sub_02092E08(UnkFsysSub_114* ptr){
    return ptr->unk_var0_0;
}

PhoneBookEntry* sub_02092E10(UnkFsysSub_114* ptr){
    return &ptr->entry;
}

void sub_02092E14(UnkFsysSub_114* ptr, u8 Unkflag, BOOL Unkbool){
    sub_0202F01C(ptr->savings_data, Unkflag);
    if (Unkbool) {
        if (ptr->unk_var8 < (ptr->unk_varC - 1)) {
            ptr->unk_var8 = ptr->unk_varC - 1;
        }
    }
}

void sub_02092E34(UnkFsysSub_114* ptr, s32 Unkarg1, BOOL uselessArg){
    if (!ptr->unk_var0_2) {
        ptr->unk_var0_2 = 1;
        if (Unkarg1 >= 10) {
            return;
        }
    }
    ptr->unk_var8 += Unkarg1;
    sub_02092E54(ptr);
}

void sub_02092E54(UnkFsysSub_114* ptr){ 
    SCRIPT_STATE* state = SavArray_Flags_get(ptr->data); 
    SAFARIZONE* zone = Save_SafariZone_get(ptr->data); 
    IGT* igt = Sav2_PlayerData_GetIGTAddr(ptr->data); 
    u8 var4057 = (u8) ScriptState_GetVar4057(state);
    u8 i;
    for (i = 0; i < 5; i++) {
        if(sub_0202F08C(ptr->savings_data, i + 7)) {
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
        if (!Pokedex_GetNatDexFlag(Sav2_Pokedex_get(ptr->data))){
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

void sub_02092F30(UnkFsysSub_114* ptr, s64 seconds){
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

void sub_02092F64(UnkFsysSub_114* ptr){
    sub_02093010(ptr, 0); 
    ptr->unk_var8 = 0;
    ptr->unk_var14 = 0;
    ptr->unk_var0_0 = 0;
    ptr->unk_var0_1 = 0;
    ptr->unk_var0_3 = 0;
    ptr->unk_var2 = 0xff;
    ptr->unk_var3 = 0;
    ptr->unk_var4 = 0;
    ptr->unk_var7 = 0;
    ptr->entry.unk0 = 0xff;
    ptr->unk_var12 = 50;
}

void sub_02092FA0(UnkFsysSub_114* ptr){
    sub_02092F64(ptr);
}

void sub_02092FA8(UnkFsysSub_114* ptr){
    if (ptr->unk_var0_0) {
        sub_02092F64(ptr);
    }
}

void sub_02092FB8(u32 uselessArg, UnkFsysSub_114* ptr){
    u8 arg1 = ptr->unk_var44;
    ptr->unk_var44 += 1;
    if (arg1 == 0) {
        if (!IsSEPlaying(SEQ_SE_GS_PHONE1)) {
            sub_02006134(SEQ_SE_GS_PHONE1, 0);
        } else {
            if (ptr->unk_var44 < 15) {
                ptr->unk_var44 = 15;
            }
        }
    }
    if (ptr->unk_var44 >= 30) {
        ptr->unk_var44 = 0;
    }
}

void sub_02093010(UnkFsysSub_114* ptr, BOOL Unkarg0){
    if (Unkarg0) {
        if (ptr->unk_var0_3) {
            return;
        }
        MI_CpuFill8(&ptr->unk_ptr40, 0, 8);
        ptr->unk_ptr40 = sub_0200E320(sub_02092FB8, ptr, ~0);
        ptr->unk_var0_3 = 1;
    } else {
        if (!ptr->unk_var0_3) {
            return;
        }
        if (ptr->unk_ptr40 != 0) {
            sub_0200E390(ptr->unk_ptr40);
        }
        MI_CpuFill8(&ptr->unk_ptr40, 0, 8);
        ptr->unk_var0_3 = 0;
    }
}

BOOL sub_02093070(FieldSystem* sys){
    if (GSPlayerMisc_IsGearNumberRegistered(SaveData_GSPlayerMisc_get(sys->savedata), PHONE_CONTACT_BILL) == 0xff) {
        return FALSE;
    }
    if (CheckFlagInArray(SavArray_Flags_get(sys->savedata), FLAG_UNK_985)) {
        return FALSE;
    }
    if (PCStorage_CountEmptySpotsInAllBoxes(GetStoragePCPointer(sys->savedata)) != 0) {
        return FALSE;
    }
    sub_02092E14(sub_02092DEC(sys), 3, TRUE);
    return TRUE;
}

BOOL sub_020930C4(FieldSystem* sys){
    int owned = Pokedex_CountNationalDexOwned(Sav2_Pokedex_get(sys->savedata));
    SCRIPT_STATE* state = SavArray_Flags_get(sys->savedata);
    if (GSPlayerMisc_IsGearNumberRegistered(SaveData_GSPlayerMisc_get(sys->savedata), PHONE_CONTACT_PROF__OAK) == 0xff) {
        return FALSE;
    }
    u16 var = (u16) (owned / 0x32);
    if (!var) {
        return FALSE;
    }
    if (var > 9) {
        var = 9;
    }
    if (!CheckFlagInArray(state, var + 0x988)) {
        sub_02092E14(sub_02092DEC(sys), 4, FALSE);
        return TRUE;
    }
    return FALSE;
}

BOOL sub_02093134(FieldSystem* sys, POKEMON * pkmn){
    if (sub_0206D8D0(pkmn, sys->savedata) == 0) {
        return FALSE;
    }
    sub_02092E14(sub_02092DEC(sys), 0, 1);
    SetFlagInArray(SavArray_Flags_get(sys->savedata), FLAG_UNK_983);
    return TRUE;
}

BOOL sub_0209316C(FieldSystem* sys){
    SCRIPT_STATE* state = SavArray_Flags_get(sys->savedata);
    if (GSPlayerMisc_IsGearNumberRegistered(SaveData_GSPlayerMisc_get(sys->savedata), PHONE_CONTACT_DAY_C_MAN) == 0xff) {
        return FALSE;
    }
    if (CheckFlagInArray(state, FLAG_UNK_992) && !CheckFlagInArray(state, FLAG_UNK_99E)) {
        return FALSE;
    }
    sub_02092E14(sub_02092DEC(sys), 5, 1);
    return TRUE;
}
