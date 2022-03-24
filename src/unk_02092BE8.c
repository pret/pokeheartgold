#include "unk_02092BE8.h"
#include "safari_zone.h"
#include "constants/sndseq.h"

void sub_02092BE8(FieldSystem* sys, UnkSTRUCT_2C* ptr, BOOL arg3) { //r5, r4, SP
    UnkSTRUCT_14 s;
    SAVEDATA *data = sys->savedata;
    s.Unkvar0 = arg3;
    SCRIPT_STATE *state = SavArray_Flags_get(data);
    FLYPOINTS_SAVE *points = Save_FlyPoints_get(data); 
    Location *warpPtr = FlyPoints_GetSpecialSpawnWarpPtr(points); //r6
    s.PosPtr = FlyPoints_GetPosition(points); //SP + 4
    struct UnkFsysSub_114* Unk_V1 = sub_02092DEC(sys); //r7
    ptr->data = data;

    if(MapHeader_MapIsOnMainMatrix(s.PosPtr->mapId) == 0){ 
        ptr->x = warpPtr->x;
        ptr->y = warpPtr->z;
        MapHeader_GetWorldMapCoords(ptr->mapID, s.x, s.y);
        MAPMATRIX* matrix = MapMatrix_New();
        MapMatrix_Load(0x3c, matrix);
        if(s.y != 0 || s.x != 0){
            ptr->Unk_Bitfield22 = (u8) s.x;
            ptr->Unk_Bitfield23 = (u8) s.y;
        }else{
            ptr->Unk_Bitfield22 = (((ptr->x >> 4) >> 27) + ptr->x) >> 5;
            ptr->Unk_Bitfield23 = (((ptr->y >> 4) >> 27) + ptr->y) >> 5;
        }
        ptr->mapHeader = MapMatrix_GetMapHeader(matrix, ptr->Unk_Bitfield22, ptr->Unk_Bitfield23);
        MapMatrix_Free(matrix);
    }else{
        ptr->x = GetPlayerXCoord(sys->playerAvatar);
        ptr->y = GetPlayerYCoord(sys->playerAvatar);
        ptr->Unk_Bitfield22 = (((ptr->x >> 4) >> 27) + ptr->x) >> 5;
        ptr->Unk_Bitfield23 = (((ptr->y >> 4) >> 27) + ptr->y) >> 5;
        ptr->mapHeader = ptr->mapID;
    }

    ptr->Player_Gender = PlayerProfile_GetTrainerGender(Sav2_PlayerData_GetProfileAddr(Fsys_GetSaveDataPtr(sys)));
    ptr->Unk_ptr28 = (int) sys + 0x10C;
    ptr->Unk_FsysVar01 = sub_0203DF3C(sys);
    ptr->Map_MusicID = sub_02054F60(sys, ptr->mapID);
    
    if(s.Unkvar0 != 0)
        return;
    if(sub_02092E08(Unk_V1) == 0){
        ptr->Unk_Bool00 = 0;
        return;
    }
    ptr->UnkFsysSub_114ptr = ov02_02251EE8(Unk_V1, s.Unk_Var0c);

    if(ptr->UnkFsysSub_114ptr < 0x4b){
        ptr->Unk_Var06 = s.Unk_Var10;
        ptr->Unk_Var05 = s.Unk_Var0f;
        if(ptr->Unk_Var05 == 3){
            sub_0202F050(SaveData_GetPhoneRematches(data), s.Unk_Var0e);
            sub_02092F64(Unk_V1);
            ptr->Unk_Bool00 = 1;
            return;
        }else if(ptr->Unk_Var05 == 0){
            sub_0202AB18(Sav2_Misc_get(data), s.Unk_Var0c, s.Unk_Var0d, ptr->UnkFsysSub_114ptr);
            sub_02092F64(Unk_V1);
            ptr->Unk_Bool00 = 1;
            return;
        }
    }

    ptr->Unk_Bool00 = 0;
    return;
}

void sub_02092D80(FieldSystem* sys, UnkSTRUCT_2C* ptr){
    sub_02092BE8(sys, ptr, 0);
}

void sub_02092D8C(FieldSystem* sys, UnkSTRUCT_2C* ptr){
    sub_02092BE8(sys, ptr, 1);
}

void sub_02092D98(HeapID id, FieldSystem* sys){ 
    void * ptr = AllocFromHeap(id, 0x48);
    MI_CpuFill8(ptr, 0, 0x48);
    sub_02092F64(ptr);
}

void sub_02092DD8(void* UnkPtr){
	MI_CpuFill8(UnkPtr, 0, 0x48);
	FreeToHeap(UnkPtr);
}

struct UnkFsysSub_114* sub_02092DEC(FieldSystem* sys){
    return sys->unk114;
}

void sub_02092DF4(struct UnkFsysSub_114* ptr){
	ptr->Unk_var0 = (ptr->Unk_var0 & 1) | 1;
	ptr->Unk_var14 = 0;
	ptr->Unk_var18 = 0;
}

u8 sub_02092E08(struct UnkFsysSub_114* ptr){
    return ptr->Unk_var0;
}

u8 sub_02092E10(struct UnkFsysSub_114* ptr){
	return 0x1c;
}

void sub_02092E14(struct UnkFsysSub_114* ptr, u32 Unkarg1, u32 Unkarg2){
    sub_0202F01C(ptr->Unk_var34, Unkarg1, Unkarg2);
    if(Unkarg2 != 0){
        if( ((ptr->Unk_varC) -1) < ptr->Unk_var8){
            ptr->Unk_var8 = (ptr->Unk_varC) -1;
        }
    }
}

void sub_02092E34(struct UnkFsysSub_114* ptr, u32 Unkarg1, u32 Unkarg2){
    
    int var0 = ptr->Unk_var0;
    int UnkBitfield = (var0 << 0x1d) >> 0x1f;
    if(UnkBitfield == 0){
        ptr->Unk_var8 = ptr->Unk_var8 + Unkarg1;
        sub_02092E54(ptr);
    }else{
        ptr->Unk_var0 = var0 | 4;
        if(Unkarg1 < 0xa){
           ptr->Unk_var8 = ptr->Unk_var8 + Unkarg1;
           sub_02092E54(ptr);
        }
    }
}

void sub_02092E54(struct UnkFsysSub_114* ptr){
    SCRIPT_STATE* state = SavArray_Flags_get(ptr->data);
    SAFARIZONE* zone = Save_SafariZone_get(ptr->data);
    IGT* igt = Sav2_PlayerData_GetIGTAddr(ptr->data);
    u8 var4057 = (u8) ScriptState_GetVar4057(state);
    for(int i = 0; i < 5; i++){
        if(sub_0202F08C(ptr->Unk_var34, (u8) state->vars[i + 7]) == 0)
            return;
	}
    u8 var = sub_0202F720(zone);

    if(var4057 < 3 || var > 4)
        return;
    
    if(var4057 != 3){
        if(var4057 < 6)
            return;
        if(Pokedex_GetNatDexFlag(Sav2_Pokedex_get(ptr->data)) == FALSE)
            return;
        u8 Unkvar = sub_0202F798(zone, igt, 3);
        if(Unkvar == 0)
            return;
        if(Unkvar <= 1){
            if(var != 0){
                if(var != 3){
                    sub_02092E14(ptr, 9, 1);
                }else{
                    sub_02092E14(ptr, 0xa, 1);
                }
            }else{
                sub_02092E14(ptr, 8, 1);
            }
        }
        if(var >= 3){
            sub_02092E14(ptr, 0xa, 1);
            return;
        }
        else{
            sub_02092E14(ptr, 0xb, 1);
            return;
        }
    }else{
        if(sub_0202F798(zone, igt, 3) == 0)
            return;
        sub_02092E14(ptr, 7, 1);
    }
}

void sub_02092F30(struct UnkFsysSub_114* ptr, s64 seconds){
    if((u8) ptr->Unk_var0 == 0)
        return;
    if((ptr->Unk_var14 ^ 0) | (ptr->Unk_var18 ^ 0) == 0){
        int var = seconds - ptr->Unk_var14;
        if(var >= 0){
            if(var > ptr->Unk_var10 || var > 0x3b)
                sub_02092FA0(ptr);
        }
    }
}

void sub_02092F64(struct UnkFsysSub_114* ptr){
    sub_02093010(ptr, 0); 
    ptr->Unk_var8 = 0;
    ptr->Unk_var14 = 0;
    ptr->Unk_var18 = 0;
    ptr->Unk_var0 &= ~1;
    ptr->Unk_var0 &= ~2;
    ptr->Unk_var0 &= ~8;
    ptr->Unk_var2 = 0xff;
    ptr->Unk_var3 = 0;
    ptr->Unk_var4 = 0;
    ptr->Unk_var7 = 0;
    ptr->entry.unk0 = 0xff;
    ptr->Unk_var12 = 0x32;
}

void sub_02092FA0(struct UnkFsysSub_114* ptr){
    sub_02092F64(ptr);
}

void sub_02092FA8(struct UnkFsysSub_114* ptr){
    if(ptr->Unk_var0 & 1) sub_02092F64(ptr);
}

void sub_02092FB8(u32 uselessArg, struct UnkFsysSub_114* ptr){
    u8 arg1 = ptr->Unk_var44;
    ptr->Unk_var44 = arg1 + 1;
    if(arg1 == 0){
        if(IsSEPlaying(SEQ_SE_GS_PHONE1) == 0){
            sub_02006134(SEQ_SE_GS_PHONE1, 0);
        }else{
            if(ptr->Unk_var44 < 0xf)
                ptr->Unk_var44 = 0xf;
        }
    }
    if(ptr->Unk_var44 >= 0x1e)
        ptr->Unk_var44 = 0;
}

void sub_02093010(struct UnkFsysSub_114* ptr, BOOL Unkarg0){
    if(Unkarg0 == 0){
        
        if((ptr->Unk_var0 << 0x1c) >> 0x1f == 1)
            return;
        if(ptr->Unk_ptr40 != 0)
            sub_0200E390(ptr->Unk_ptr40);
        MI_CpuFill8(ptr->Unk_ptr40, 0, 8);
        ptr->Unk_var0 &= 8;
        
    }else{
        
        if((ptr->Unk_var0 << 0x1c) >> 0x1f == 1)
            return;
        MI_CpuFill8(ptr->Unk_ptr40, 0, 8);
        ptr->Unk_ptr40 = sub_0200E320(&sub_02092FB8, ptr, ~0);
        
    }
}

BOOL sub_02093070(FieldSystem* sys){
    if(GSPlayerMisc_IsGearNumberRegistered(SaveData_GSPlayerMisc_get(sys->savedata), 9) == 0xff){
        if(CheckFlagInArray(SavArray_Flags_get(sys->savedata), FLAG_UNK_985) == 0){
            if(PCStorage_CountEmptySpotsInAllBoxes(GetStoragePCPointer(sys->savedata)) == 0){
                sub_02092E14(sub_02092DEC(sys), 3, 1);
                return TRUE;
            }
        }
    }
    return FALSE;
}

BOOL sub_020930C4(FieldSystem* sys){
    int owned = Pokedex_CountNationalDexOwned(Sav2_Pokedex_get(sys->savedata));
    SCRIPT_STATE* state = SavArray_Flags_get(sys->savedata);
    if(GSPlayerMisc_IsGearNumberRegistered(SaveData_GSPlayerMisc_get(sys->savedata), 2) == 0xff)
        return FALSE;
    u16 var = (u16) owned / 0x32;
    if(var == 0){
        if(var > 9)
            var = 9;
        int var1 = var + 0x988;
        if(CheckFlagInArray(state, (u16) var1) == 0)
            return FALSE;
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
    if(CheckFlagInArray(state, FLAG_UNK_992) == 0 || CheckFlagInArray(state, FLAG_UNK_99E) != 0){
        sub_02092E14(sub_02092DEC(sys), 5, 1);
        return TRUE;
    }
    return FALSE;
}
