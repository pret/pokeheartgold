#include "unk_02092BE8.h"
#include "safari_zone.h"
#include "constants/sndseq.h"

void sub_02092BE8(FieldSystem* sys, UnkSTRUCT_2C* ptr, BOOL arg3) { //r5, r4, SP
    UnkSTRUCT_14 s;
    SCRIPT_STATE *state = SavArray_Flags_get(sys->savedata);
    FLYPOINTS_SAVE *points = Save_FlyPoints_get(sys->savedata); 
    Location *warpPtr = FlyPoints_GetSpecialSpawnWarpPtr(points); //r6
    Location *PosPtr = FlyPoints_GetPosition(points); //SP + 4
    struct UnkFsysSub_114* Unk_V1 = sub_02092DEC(sys); //r7
    ptr->data = sys->savedata;
    ptr->mapID = PosPtr->mapId;
    if(MapHeader_MapIsOnMainMatrix(ptr->mapID) != 0){ 
        ptr->x = GetPlayerXCoord(sys->playerAvatar);
        ptr->y = GetPlayerYCoord(sys->playerAvatar);
        ptr->MatrixXCoord = ptr->x / 32;
        ptr->MatrixYCoord = ptr->y / 32;
        ptr->mapHeader = ptr->mapID;
    }else{
        ptr->x = warpPtr->x;
        ptr->y = warpPtr->z;
        MapHeader_GetWorldMapCoords(ptr->mapID, &(s.x), &(s.y));
        MAPMATRIX* matrix = MapMatrix_New();
        MapMatrix_Load(0x3c, matrix);
        if(s.x == 0 && s.y == 0){
            ptr->MatrixXCoord = ptr->x / 32;
            ptr->MatrixYCoord = ptr->y /32;
        }else{
            ptr->MatrixXCoord = s.x;
            ptr->MatrixYCoord = s.y;
        }
        ptr->mapHeader = MapMatrix_GetMapHeader(matrix, ptr->MatrixXCoord, ptr->MatrixYCoord);
        MapMatrix_Free(matrix);
    }

    ptr->Player_Gender = PlayerProfile_GetTrainerGender(Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(sys)));
    ptr->Unk_ptr28 = (int) sys + 0x10C;
    ptr->Unk_FsysVar01 = sub_0203DF3C(sys);
    ptr->Map_MusicID = Fsys_GetSurfOverriddenMusicId(sys, ptr->mapID);
    
    if(arg3 != 0)
        return;
    if(sub_02092E08(Unk_V1) != 0){
        ptr->UnkFsysSub_114ptr = ov02_02251EE8(Unk_V1, &(s.Unk_Var0c));
        if(ptr->UnkFsysSub_114ptr >= 0x4b){
            ptr->Unk_Bool00 = 0;
            return;
        }else{
            ptr->Unk_Var06 = s.Unk_Var10;
            ptr->Unk_Var05 = s.Unk_Var0f;
            if(ptr->Unk_Var05 == 3){
                sub_0202F050(SaveData_GetMomsSavingsAddr(sys->savedata), s.Unk_Var0e);
            }
            else if(ptr->Unk_Var05 == 0){
                sub_0202AB18(Sav2_Misc_get(sys->savedata), s.Unk_Var0c, s.Unk_Var0d, ptr->UnkFsysSub_114ptr);
            }
            sub_02092F64(Unk_V1);
            ptr->Unk_Bool00 = 1;
            return;
    }
    }else{
        ptr->Unk_Bool00 = 0;
        return;
    }
}

void sub_02092D80(FieldSystem* sys, UnkSTRUCT_2C* ptr){
    sub_02092BE8(sys, ptr, 0);
}

void sub_02092D8C(FieldSystem* sys, UnkSTRUCT_2C* ptr){
    sub_02092BE8(sys, ptr, 1);
}

struct UnkFsysSub_114* sub_02092D98(HeapID id, FieldSystem* sys){ 
    struct UnkFsysSub_114 * ptr = AllocFromHeap(id, sizeof(struct UnkFsysSub_114));
    MI_CpuFill8(ptr, 0, sizeof(struct UnkFsysSub_114));
    sub_02092F64(ptr);
    ptr->Unk_varC = 0xa;
    ptr->Unk_var10 = 0x1e;
    ptr->Unk_var12 = 0x32;
    ptr->data = sys->savedata;
    ptr->pokegearData = SaveData_GSPlayerMisc_get(ptr->data);
    ptr->savingsData = SaveData_GetMomsSavingsAddr(ptr->data);
    ptr->sys = sys;
    return ptr;
}

void sub_02092DD8(struct UnkFsysSub_114 * ptr){
    MI_CpuFill8(ptr, 0, sizeof(struct UnkFsysSub_114));
    FreeToHeap(ptr);
}

struct UnkFsysSub_114* sub_02092DEC(FieldSystem* sys){
    return sys->unk114;
}

void sub_02092DF4(struct UnkFsysSub_114* ptr){
    ptr->Unk_var0_0 = 1;
    ptr->Unk_var14 = 0;
}

u8 sub_02092E08(struct UnkFsysSub_114* ptr){
    return ptr->Unk_var0_0;
}

struct PhoneBookEntry* sub_02092E10(struct UnkFsysSub_114* ptr){
    return &ptr->entry;
}

void sub_02092E14(struct UnkFsysSub_114* ptr, u8 Unkarg1, u32 Unkarg2){
    sub_0202F01C(ptr->savingsData, Unkarg1);
    if(Unkarg2 != 0){
        if(ptr->Unk_var8 < (ptr->Unk_varC -1)){
            ptr->Unk_var8 = (ptr->Unk_varC) -1;
        }
    }
}

void sub_02092E34(struct UnkFsysSub_114* ptr, s32 Unkarg1, BOOL uselessArg){
    if(!ptr->Unk_var0_2){
        ptr->Unk_var0_2 = 1;
        if(Unkarg1 >= 0xa){
            return;
        }
    }
    ptr->Unk_var8 += Unkarg1;
    sub_02092E54(ptr);
}

void sub_02092E54(struct UnkFsysSub_114* ptr){ //r4
    SCRIPT_STATE* state = SavArray_Flags_get(ptr->data); //r5
    SAFARIZONE* zone = Save_SafariZone_get(ptr->data); //r7
    IGT* igt = Sav2_PlayerData_GetIGTAddr(ptr->data); //sp
    u8 var4057 = (u8) ScriptState_GetVar4057(state); //r6
    for(u8 i = 0; i < 5; i++){
        if(sub_0202F08C(ptr->savingsData,  i + 7) != FALSE)
            return;
	}
    u8 var = sub_0202F720(zone);
    if(var4057 < 3 || var >= 4)
        return;
    if(var4057 == 3){
        if(sub_0202F798(zone, igt, 3) == 0)
            return;
        sub_02092E14(ptr, 7, 1);
    }else{
        if(var4057 < 6)
            return;
        if(Pokedex_GetNatDexFlag(Sav2_Pokedex_get(ptr->data)) == FALSE)
            return;
        u32 Unkvar = sub_0202F798(zone, igt, 3);
        if(Unkvar == 0)
            return;
        if(Unkvar > 1){
            if(var < 3){
                sub_02092E14(ptr, 11, TRUE);
            }else{
                sub_02092E14(ptr, 10, TRUE);
            }
        }else{
            if(var == 0){
                sub_02092E14(ptr, 8, TRUE);
            }else{
                if(var == 3){
                    sub_02092E14(ptr, 10, TRUE);
                }else{
                    sub_02092E14(ptr, 9, TRUE);
                }
            }
        }
    }
}

void sub_02092F30(struct UnkFsysSub_114* ptr, s64 seconds){
    if(ptr->Unk_var0_0 == 0)
        return;
    if(ptr->Unk_var14 == 0){
        ptr->Unk_var14 = seconds;
    }else{
        int var = seconds - ptr->Unk_var14;
        if(var < 0 || var > ptr->Unk_var10 || var > 59)
                sub_02092FA0(ptr);
    }
}

void sub_02092F64(struct UnkFsysSub_114* ptr){
    sub_02093010(ptr, 0); 
    ptr->Unk_var8 = 0;
    ptr->Unk_var14 = 0;
    ptr->Unk_var0_0 = 0;
    ptr->Unk_var0_1 = 0;
    ptr->Unk_var0_3 = 0;
    ptr->Unk_var2 = 0xff;
    ptr->Unk_var3 = 0;
    ptr->Unk_var4 = 0;
    ptr->Unk_var7 = 0;
    ptr->entry.unk0 = 0xff;
    ptr->Unk_var12 = 50;
}

void sub_02092FA0(struct UnkFsysSub_114* ptr){
    sub_02092F64(ptr);
}

void sub_02092FA8(struct UnkFsysSub_114* ptr){
    if(ptr->Unk_var0_0) 
        sub_02092F64(ptr);
}

void sub_02092FB8(u32 uselessArg, struct UnkFsysSub_114* ptr){
    u8 arg1 = ptr->Unk_var44;
    ptr->Unk_var44 += 1;
    if(arg1 == 0){
        if(IsSEPlaying(2169) == 0){
            sub_02006134(2169, 0);
        }else{
            if(ptr->Unk_var44 < 0xf)
                ptr->Unk_var44 = 0xf;
        }
    }
    if(ptr->Unk_var44 >= 0x1e)
        ptr->Unk_var44 = 0;
}

void sub_02093010(struct UnkFsysSub_114* ptr, BOOL Unkarg0){
    if(Unkarg0){
        if(ptr->Unk_var0_3)
            return;
        MI_CpuFill8(&ptr->Unk_ptr40, 0, 8);
        ptr->Unk_ptr40 = sub_0200E320(sub_02092FB8, ptr, ~0);
        ptr->Unk_var0_3 = 1;
    }else{
        if(!ptr->Unk_var0_3)
            return;
        if(ptr->Unk_ptr40 != 0)
            sub_0200E390(ptr->Unk_ptr40);
        MI_CpuFill8(&ptr->Unk_ptr40, 0, 8);
        ptr->Unk_var0_3 = 0;
    }
}

BOOL sub_02093070(FieldSystem* sys){
    if(GSPlayerMisc_IsGearNumberRegistered(SaveData_GSPlayerMisc_get(sys->savedata), 9) == 0xff)
        return FALSE;
    if(CheckFlagInArray(SavArray_Flags_get(sys->savedata), FLAG_UNK_985) != 0)
        return FALSE;
    if(PCStorage_CountEmptySpotsInAllBoxes(GetStoragePCPointer(sys->savedata)) != 0)
        return FALSE;
    sub_02092E14(sub_02092DEC(sys), 3, 1);
    return TRUE;
}

BOOL sub_020930C4(FieldSystem* sys){
    int owned = Pokedex_CountNationalDexOwned(Sav2_Pokedex_get(sys->savedata));
    SCRIPT_STATE* state = SavArray_Flags_get(sys->savedata);
    if(GSPlayerMisc_IsGearNumberRegistered(SaveData_GSPlayerMisc_get(sys->savedata), 2) == 0xff)
        return FALSE;
    u16 var = (u16) (owned / 0x32);
    if(!var)
        return FALSE;
    if(var > 9)
        var = 9;
    if(CheckFlagInArray(state, var + 0x988) == 0){
        sub_02092E14(sub_02092DEC(sys), 4, 0);
        return TRUE;
    }
    return FALSE;
}

BOOL sub_02093134(FieldSystem* sys, POKEMON * pkmn){
    if(sub_0206D8D0(pkmn, sys->savedata) == 0)
        return FALSE;
    sub_02092E14(sub_02092DEC(sys), 0, 1);
    SetFlagInArray(SavArray_Flags_get(sys->savedata), FLAG_UNK_983);
    return TRUE;
}

BOOL sub_0209316C(FieldSystem* sys){
    SCRIPT_STATE* state = SavArray_Flags_get(sys->savedata);
    if(GSPlayerMisc_IsGearNumberRegistered(SaveData_GSPlayerMisc_get(sys->savedata), 6) == 0xff)
        return FALSE;
    if(CheckFlagInArray(state, FLAG_UNK_992) != 0 && CheckFlagInArray(state, FLAG_UNK_99E) == 0)
        return FALSE;
    sub_02092E14(sub_02092DEC(sys), 5, 1);
    return TRUE;
}