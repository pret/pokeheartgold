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
    ptr->Map_MusicID = sub_02054F60(sys, ptr->mapID);
    
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
                sub_0202F050(SaveData_GetPhoneRematches(sys->savedata), s.Unk_Var0e);
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
    ptr->rematchData = SaveData_GetPhoneRematches(ptr->data);
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
	ptr->Unk_var18 = 0;
}

u8 sub_02092E08(struct UnkFsysSub_114* ptr){
    return ptr->Unk_var0_0;
}

struct PhoneBookEntry* sub_02092E10(struct UnkFsysSub_114* ptr){
	return &ptr->entry;
}

void sub_02092E14(struct UnkFsysSub_114* ptr, u32 Unkarg1, u32 Unkarg2){
    sub_0202F01C(ptr->rematchData, Unkarg1);
    if(Unkarg2 != 0){
        if(ptr->Unk_var8 < (ptr->Unk_varC -1)){
            ptr->Unk_var8 = (ptr->Unk_varC) -1;
        }
    }
}