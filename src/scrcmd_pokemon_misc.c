#include "bug_contest.h"
#include "fieldmap.h"
#include "field_map_object.h"
#include "friend_group.h"
#include "photo_album.h"
#include "pokedex.h"
#include "overlay_02.h"
#include "overlay_03.h"
#include "save_pokeathlon.h"
#include "scrcmd.h"
#include "unk_0206D494.h"
#include "unk_02031AF0.h"
#include "unk_02031B0C.h"
#include "unk_0203E348.h"
#include "unk_02031904.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
#include "constants/items.h"
#include "constants/moves.h"

static LocalMapObject *ov01_02201F98(MapObjectMan *mapObjectMan, u8 unkA, u16 species, u16 forme, u32 gender, u32 x, u32 y, u32 mapId);

BOOL ScrCmd_BattleTowerSetUpMultiBattle(SCRIPTCONTEXT *ctx) {
    sub_0202CA44(ctx->fsys->savedata);
    sub_02039F68();
    return TRUE;
}

BOOL ScrCmd_SetPlayerVolume(SCRIPTCONTEXT *ctx) {
    GF_SndHandleSetPlayerVolume(1, VarGet(ctx->fsys, ScriptReadHalfword(ctx)));
    return FALSE;
}

BOOL ScrCmd_CheckMonSeen(SCRIPTCONTEXT *ctx) {
    u16 monNumber = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 *seenFlag = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    *seenFlag = Pokedex_CheckMonSeenFlag(Sav2_Pokedex_get(ctx->fsys->savedata), monNumber);

    return FALSE;
}

//Related to the trapped floor in the rocket hideout
BOOL ScrCmd_708(SCRIPTCONTEXT *ctx) {
    u32 unkVar = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    ov02_022460AC(ctx->fsys->taskman, unkVar);
    return TRUE;
}

BOOL ScrCmd_CheckHasLegendaryWing(SCRIPTCONTEXT *ctx) {
    u32 unkVar = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    CheckHasLegendaryWing(ctx->fsys->taskman, unkVar);
    return TRUE;
}

//Related to Persian statues in the rocket hideout
BOOL ScrCmd_709(SCRIPTCONTEXT *ctx) {
    ov02_022462E8(ctx->fsys->taskman);
    return TRUE;
}

BOOL ScrCmd_ScreenShake(SCRIPTCONTEXT *ctx) {
    u32 a1 = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u32 a2 = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u32 a3 = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u32 a4 = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    ov02_02246714(ctx->fsys->taskman, a1, a2, a3, a4);
    return TRUE;
}

//Related to Lance flying off on his dragonite in the Lake of Rage
BOOL ScrCmd_775(SCRIPTCONTEXT *ctx) {
    u32 objIdA = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u32 objIdB = VarGet(ctx->fsys, ScriptReadHalfword(ctx));

    LocalMapObject *objA = GetMapObjectByID(ctx->fsys->mapObjectMan, objIdA);
    LocalMapObject *objB = GetMapObjectByID(ctx->fsys->mapObjectMan, objIdB);

    ov02_022469B4(ctx->fsys->taskman, objA, objB);

    return TRUE;
}

BOOL ScrCmd_OpenAlphHiddenRoom(SCRIPTCONTEXT *ctx) {
    OpenAlphHiddenRoom(ctx->fsys->taskman, *(ctx->script_ptr++));
    return TRUE;
}

static u32 ov01_02201B2C(u32 unkA) {
    u16 ret = 0xFFFF;
    if (unkA <= ret) {
        ret = unkA;
    }
    return ret;
}

//Related to Pokeathlon "Ball Sign"- whatever that is
BOOL ScrCmd_724(SCRIPTCONTEXT *ctx) {
    u8 unkVar = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 *unkPtrA = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    Pokeathlon_UnkSubStruct_B00 *unkPtrB = sub_0203199C(Save_Pokeathlon_get(ctx->fsys->savedata));

    if (unkVar <= 9) {
        *unkPtrA = ov01_02201B2C(unkPtrB->unk44[unkVar]);
        return FALSE;
    }

    switch (unkVar - 10) {
    case 0:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk8);
        break;
    case 1:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk70);
        break;
    case 2:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk4);
        break;
    case 3:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk14);
        break;
    case 4:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk1C);
        break;
    case 5:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk24);
        break;
    case 6:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk2C);
        break;
    case 7:
        *unkPtrA = ov01_02201B2C(unkPtrB->unk30);
        break;
    default:
        *unkPtrA = 0;
        break;
    }

    return FALSE;
}

//This does something with pokeathlon records like "number times jumped"
BOOL ScrCmd_725(SCRIPTCONTEXT *ctx) {
    s32 val;

    u8 unkA = *(ctx->script_ptr++);
    u32 unkB = VarGet(ctx->fsys, ScriptReadHalfword(ctx));

    Pokeathlon_UnkSubStruct_B00 *unkPtr = sub_020319F0(Save_Pokeathlon_get(ctx->fsys->savedata));

    if (unkA == 0) {
        val = unkPtr->unk70 + unkB;
        if ((u32) val > 0xFFFF) {
            unkPtr->unk70 = 0xFFFF;
        } else {
            unkPtr->unk70 = val;
        }
    } else {
        val = unkPtr->unk70 - unkB;
        if (val < 0) {
            unkPtr->unk70 = 0;
        } else {
            unkPtr->unk70 = val;
        }
    }

    return FALSE;
}

BOOL ScrCmd_726(SCRIPTCONTEXT *ctx) {
    ov01_021E7F00(ctx->fsys, TRUE);
    return FALSE;
}

//Related to Kurt
BOOL ScrCmd_735(SCRIPTCONTEXT *ctx) {
    u16 *apricornQuantity = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    *apricornQuantity = ApricornBox_GetKurtQuantity(Save_ApricornBox_get(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_ClearKurtApricorn(SCRIPTCONTEXT *ctx) {
    ApricornBox_SetKurtApricorn(Save_ApricornBox_get(ctx->fsys->savedata), 0, 0);
    return FALSE;
}

//Related to Kurt
BOOL ScrCmd_737(SCRIPTCONTEXT *ctx) {
    u16 *unkPtr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    *unkPtr = ApricornBox_GetKurtBall(Save_ApricornBox_get(ctx->fsys->savedata));
    return FALSE;
}

//Related to Kurt
BOOL ScrCmd_GetTotalApricornCount(SCRIPTCONTEXT *ctx) {
    s32 i;
    u32 cnt;
    u16 *unkPtr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    cnt = 0;
    SaveApricornBox *apricornBox = Save_ApricornBox_get(ctx->fsys->savedata);   
    for (i = 0; i < 7; i = i + 1) {
        cnt += ApricornBox_CountApricorn(apricornBox, i);
    }
    *unkPtr = cnt;
    return FALSE;
}

//Related to Kurt- canceling
BOOL ScrCmd_739(SCRIPTCONTEXT *ctx) {
    struct ApricornBoxWork **unkPtr = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    *unkPtr = CreateApricornBoxWork(ctx->fsys, 2);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

//Related to aprijuice stand- canceling
BOOL ScrCmd_740(SCRIPTCONTEXT *ctx) {
    u32 *unkPtrA = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);
    u32 unkVar = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 *unkPtrB = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    *unkPtrA = sub_0203ED80(ctx->fsys, unkVar, unkPtrB);
    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

//Related to aprijuice stand- viewing label
BOOL ScrCmd_741(SCRIPTCONTEXT *ctx) {
    UnkStruct_02031CEC unkOut;
    RTCDate date;   
    s32 unkVar;
    struct MSGFMT **msgfmt;
    SaveApricornBox *apricornBox;
    u16 *price;
    u16 *unkPtrA; 
    u16 *unkPtrC;
    STRING *str;
    
    apricornBox = Save_ApricornBox_get(ctx->fsys->savedata);
    msgfmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    unkVar = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    unkPtrA = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    price = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    unkPtrC = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    GF_RTC_CopyDate(&date);
    *unkPtrA = unkVar + 5;
    if (!sub_02031CEC(apricornBox, *unkPtrA, &unkOut)) {
        *unkPtrA = (date.week + 2*unkVar) % 5;
        sub_02031CEC(apricornBox, *unkPtrA, &unkOut);
    }
    str = sub_020322AC(apricornBox, *unkPtrA, 0x20);
    BufferString(*msgfmt, 0, str, 2, 1, gGameVersion); //buffer owner..?
    FreeToHeap(str);
    str = sub_02032308(apricornBox, *unkPtrA, 0x20);
    BufferString(*msgfmt, 1, str, 2, 1, gGameVersion); //buffer juice type..?
    FreeToHeap(str);

    unkVar = sub_02031D80(&unkOut);
    *price = (unkOut.unk0 / 10) + 2*unkVar;

    if (*price < 100) {
        *price = 100;
    } else if (*price > 5000) {
        *price = 5000;
    }

    BufferIntegerAsString(*msgfmt, 2, *price, 4, STRCONVMODE_LEFT_ALIGN, 1);
    BufferIntegerAsString(*msgfmt, 3, unkVar, 3, STRCONVMODE_LEFT_ALIGN, 1); //richness..?
    BufferIntegerAsString(*msgfmt, 4, unkOut.unk2, 3, STRCONVMODE_LEFT_ALIGN, 1); //smoothness..?

    *unkPtrC = unkOut.unk0;

    return FALSE;
}

//Gets called after selecting which type of pokeathlon data to load- might just outright start the loading process
BOOL ScrCmd_743(SCRIPTCONTEXT *ctx) {
    ov03_02258CFC(ctx->taskman, VarGet(ctx->fsys, ScriptReadHalfword(ctx)));
    return TRUE;
}

extern u8 sFriendshipRoomStatuesPositions[3][2];

BOOL ScrCmd_CreatePokeathlonFriendshipRoomStatues(SCRIPTCONTEXT *ctx) {
    s32 i;
    u16 species;
    FieldSystem *fsys = ctx->fsys;
    
    SavePokeathlonFriendshipRecords *unkPtr = sub_02031B00(fsys->savedata);

    for (i = 0; i < 3; i++) {
        LocalMapObject *mapObj = GetMapObjectByID(fsys->mapObjectMan, 0xf6 + i);

        if (mapObj) {
            DeleteMapObject(mapObj);
        }

        species = unkPtr->friendshipRoomStatues[i].species;

        if (species != 0 && species <= SPECIES_ARCEUS) {
            ov01_02201F98(fsys->mapObjectMan, (u8) i, species, unkPtr->friendshipRoomStatues[i].forme, unkPtr->friendshipRoomStatues[i].gender, sFriendshipRoomStatuesPositions[i][0], sFriendshipRoomStatuesPositions[i][1], fsys->location->mapId);
        }
    }
    return TRUE;
}

static LocalMapObject *ov01_02201F98(MapObjectMan *mapObjectMan, u8 unkA, u16 species, u16 forme, u32 gender, u32 x, u32 y, u32 mapId) {  
    LocalMapObject *mapObj;
    u32 spriteId;
    u32  size;

    spriteId = FollowingPokemon_GetSpriteID(species, forme, gender) << 1;
    size = GetFollowPokeSizeParamBySpecies(species)*3 + unkA;
    
    mapObj = CreateSpecialFieldObjectEx(mapObjectMan, x, y, DIR_SOUTH, size + 0x19f, 0, mapId, 0, 0, spriteId);
    
    if (!mapObj) {
        GF_AssertFail();
    }

    MapObject_SetID(mapObj, unkA + 0xf6);
    MapObject_SetType(mapObj, 0);
    MapObject_SetFlagID(mapObj, 0);
    MapObject_SetScript(mapObj, 0);
    MapObject_SetParam(mapObj, 0, 2);
    sub_02069F0C(mapObj, species, (u8) forme, FALSE, spriteId);
    MapObject_SetXRange(mapObj, -1);
    MapObject_SetYRange(mapObj, -1);
    MapObject_SetBits(mapObj, 1 << 0x1e);
    MapObject_ClearBits(mapObj, FALSE);
    sub_0205F89C(mapObj, FALSE);

    return mapObj;
}

BOOL ScrCmd_CheckSeenAllLetterUnown(SCRIPTCONTEXT *ctx) {
    u32 forme;
    s32 i;
    u32 counter;
    s32 unownFormes;
    POKEDEX *pokedex;
    u16 *allUnownSeen;

    allUnownSeen = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    pokedex = Sav2_Pokedex_get(ctx->fsys->savedata);
    
    unownFormes = Pokedex_GetSeenFormeNum_Unown(pokedex, 1);
    if (unownFormes < 26) {
        *allUnownSeen = FALSE;
        return TRUE;
    }

    counter = 0;
    for (i = 0; i < unownFormes; i++) {
        forme = Pokedex_GetSeenFormeByIdx_Unown(pokedex, i, TRUE);
        if (forme != 26 && forme != 27) {
            counter++;
        }
    }

    if (counter == 26) {
        *allUnownSeen = TRUE;
    } else {
        *allUnownSeen = FALSE;
    }

    return TRUE;
}

BOOL ScrCmd_GiveTogepiEgg(SCRIPTCONTEXT *ctx) {
    s32 i;
    u8 pp;
    u32 personality;
    u16 moveData;
    POKEMON *togepi;
    PLAYERPROFILE *profile;
    PARTY *party;
    FieldSystem *fsys = ctx->fsys;
    
    profile = Sav2_PlayerData_GetProfileAddr(fsys->savedata);
    party = SavArray_PlayerParty_get(fsys->savedata);

    if (GetPartyCount(party) >= 6) {
        return FALSE;
    }

    togepi = AllocMonZeroed(0xb);
    ZeroMonData(togepi);

    SetEggStats(togepi, SPECIES_TOGEPI, 1, profile, 3, sub_02017FE4(1, 0xd));
    
    for (i = 0; i < 4; i++) {
        if (!GetMonData(togepi, MON_DATA_MOVE1 + i, 0)) {
            break;
        }
    }

    if (i == 4) {
        i = 3;
    }    

    moveData = MOVE_EXTRASENSORY; 
    SetMonData(togepi, MON_DATA_MOVE1 + i, &moveData);

    pp = GetMonData(togepi, MON_DATA_MOVE1MAXPP + i, 0);
    SetMonData(togepi, MON_DATA_MOVE1PP + i, &pp);

    AddMonToParty(party, togepi);

    FreeToHeap(togepi);

    SaveMisc_SetTogepiPersonalityGender(Sav2_Misc_get(fsys->savedata), GetMonData(togepi, MON_DATA_PERSONALITY, 0), GetMonData(togepi, MON_DATA_GENDER, 0));

    return FALSE;
}

//unused
BOOL ScrCmd_777(SCRIPTCONTEXT *ctx) {
    u32 partyIndex = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 *unkPtr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    POKEMON *mon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), partyIndex);

    *unkPtr = sub_0206D8D0(mon, ctx->fsys->savedata);

    return FALSE;
}

extern u16 sSpikyEarPichuMoveset[4];

BOOL ScrCmd_GiveSpikyEarPichu(SCRIPTCONTEXT *ctx) {
    s32 i;
    u8 forme;
    u8 maxPP;
    u16 heldItem;
    POKEMON *pichu;    
    PARTY *party;
    FieldSystem *fsys;
    PLAYERPROFILE *profile;
    
    fsys = ctx->fsys;

    profile = Sav2_PlayerData_GetProfileAddr(fsys->savedata);
    party = SavArray_PlayerParty_get(fsys->savedata);
    if (GetPartyCount(party) >= 6) {
        return FALSE;
    }
    pichu = AllocMonZeroed(0xb);
    ZeroMonData(pichu);

    u32 trId = PlayerProfile_GetTrainerID(profile);
    u32 unkA = sub_02072490(trId, 0xac, NATURE_NAUGHTY, MON_FEMALE, 0, 0);
    CreateMon(pichu, SPECIES_PICHU, 30, 0x20, 1, unkA, 1, trId);
    
    forme = 1;
    SetMonData(pichu, MON_DATA_FORME, &forme);

    for (i = 0; i < 4; i++) {
        SetMonData(pichu, MON_DATA_MOVE1 + i, &sSpikyEarPichuMoveset[i]);
        maxPP = GetMonData(pichu, MON_DATA_MOVE1MAXPP + i, 0);
        SetMonData(pichu, MON_DATA_MOVE1PP + i, &maxPP);
    }

    heldItem = ITEM_ZAP_PLATE;
    SetMonData(pichu, MON_DATA_HELD_ITEM, &heldItem);

    u32 unkB = sub_02017FE4(0, MapHeader_GetMapSec(ctx->fsys->location->mapId));

    sub_020720FC(pichu, profile, 4, unkB, 0x18, 0xb);

    AddMonToParty(party, pichu);

    FreeToHeap(pichu);

    UpdatePokedexWithReceivedSpecies(fsys->savedata, pichu);

    return FALSE;
}

BOOL ScrCmd_PhotoAlbumIsFull(SCRIPTCONTEXT *ctx) {
    FieldSystem *fsys = ctx->fsys;
    u16 *albumIsFull = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    *albumIsFull = (PhotoAlbum_GetNumSaved(Save_PhotoAlbum_get(fsys->savedata)) >= 36);

    return FALSE;
}

BOOL ScrCmd_RadioMusicIsPlaying(SCRIPTCONTEXT *ctx) {
    u32 musicSeq = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 *isPlaying = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    
    *isPlaying = (GetRadioMusicPlayingSeq() == musicSeq);
    
    return FALSE;
}

extern s32 ov01_022093D0[2][2];

static u32 ov01_02202378(SAVEDATA *savedata, u8 luckValue, u8 city) {
    SAV_FRIEND_GRP *friendGroup;
    u8 *unkPtr;
    s32 *unkData;
    u32 size;
    s32 rngSeed;
    u8 ret;
    u8 randVal;
    u32 i;
    s32 j;
    
    friendGroup = Save_FriendGroup_get(savedata);
    
    if (city != 0) { //1 = celadon; 0 = goldenrod
        size = 14;
    } else {
        size = 21;
    }

    if (luckValue >= size) {
        return 3;
    }

    rngSeed = GetLCRNGSeed();
    SetLCRNGSeed(sub_0202C7DC(friendGroup));

    unkPtr = AllocFromHeapAtEnd(0x20, size);
    MI_CpuFill8(unkPtr, 0, size);
    
    i = 0;
    unkData = ov01_022093D0[city];

    for (; i < 2; i = (u8) ++i) {
        for (j = 0; j < unkData[i]; j = (u8) ++j) {
            do {
                randVal = LCRandom() % (s32) size;
            } while (unkPtr[randVal] != 0);
            unkPtr[randVal] = i + 1;
        } 
    }

    ret = unkPtr[luckValue];

    FreeToHeap(unkPtr);
    SetLCRNGSeed(rngSeed);

    return ret;
}

BOOL ScrCmd_CasinoGame(SCRIPTCONTEXT *ctx) {
    u8 luckValue = *(ctx->script_ptr++);
    u8 city = *(ctx->script_ptr++); //1 = celadon; 0 = goldenrod
    u32 *unkPtr = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_AC);

    *unkPtr = sub_0203FA38(ctx->fsys, ov01_02202378(ctx->fsys->savedata, luckValue, city));

    SetupNativeScript(ctx, ScrNative_WaitApplication_DestroyTaskData);
    return TRUE;
}

BOOL ScrCmd_BufferPokeathlonCourseName(SCRIPTCONTEXT *ctx) {
    u8 fieldNo = *(ctx->script_ptr++);
    u32 courseId = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    BufferPokeathlonCourseName(*(MSGFMT**)FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT), fieldNo, (u8) courseId);
    return FALSE;
}

//Gets called when getting a package from your mom
BOOL ScrCmd_811(SCRIPTCONTEXT *ctx) {
    u16 *unkPtr1 = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    u16 *unkPtr2 = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    *unkPtr2 = sub_0202F224(SaveData_GetMomsSavingsAddr(ctx->fsys->savedata), 0, unkPtr1);

    return FALSE;
}

//Gets called when getting a package from your mom
BOOL ScrCmd_812(SCRIPTCONTEXT *ctx) {
    sub_0202F1F4(SaveData_GetMomsSavingsAddr(ctx->fsys->savedata));
    return FALSE;
}

BOOL ScrCmd_GetBuenasPassword(SCRIPTCONTEXT *ctx) {
    u16 *msgPtr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    u16 *unkPtr2 = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    u8 unkVar = ScriptState_GetBuenasPasswordSet(SavArray_Flags_get(ctx->fsys->savedata)) % 30;

    *msgPtr = 2*(unkVar / 3) + unkVar / 3 + msg_0066_D23R0102_00040;

    *unkPtr2 = unkVar % 3;
    return FALSE;
}

static u32 MonGetShinyLeafCount(POKEMON *mon) {
    int c;
    u32 shinyLeafCount = 0;

    for (c = 0; c < 5; c++) {
        shinyLeafCount += GetMonData(mon, MON_DATA_SHINY_LEAF_A + c, NULL);
    }
    if (shinyLeafCount == 5 && GetMonData(mon, MON_DATA_SHINY_LEAF_CROWN, NULL) != 0) {
        shinyLeafCount = 6;
    }

    return shinyLeafCount;
}

BOOL ScrCmd_GetShinyLeafCount(SCRIPTCONTEXT *ctx) {
    u32 monIndex = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 *shinyLeafCount = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    *shinyLeafCount = MonGetShinyLeafCount(GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), monIndex));
    return FALSE;
}

BOOL ScrCmd_TryGiveShinyLeafCrown(SCRIPTCONTEXT *ctx) {
    u32 monIndex = VarGet(ctx->fsys, ScriptReadHalfword(ctx));

    POKEMON *mon = GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), monIndex);
    if (MonGetShinyLeafCount(GetPartyMonByIndex(SavArray_PlayerParty_get(ctx->fsys->savedata), monIndex)) == 5) {
        u8 data = TRUE;
        SetMonData(mon, MON_DATA_SHINY_LEAF_CROWN, &data);
    }

    return FALSE;
}

BOOL ScrCmd_GetUniqueSealsQuantity(SCRIPTCONTEXT *ctx) {
    u16 *uniqueSeals = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    *uniqueSeals = SealCase_CountUniqueSeals(Sav2_SealCase_get(ctx->fsys->savedata));

    return FALSE;
}

BOOL ScrCmd_GetSealQuantity(SCRIPTCONTEXT *ctx) {
    u32 sealId = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 *sealQuantity = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    *sealQuantity = SealCase_CountSealOccurrenceAnywhere(Sav2_SealCase_get(ctx->fsys->savedata), sealId);

    return FALSE;
}

BOOL ScrCmd_GiveOrTakeSeal(SCRIPTCONTEXT *ctx) {
    u32 sealId = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u32 quantity = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    
    GiveOrTakeSeal(Sav2_SealCase_get(ctx->fsys->savedata), sealId, quantity);

    return FALSE;
}

static BOOL IsSealNonUnique(u16 sealId, u16 *uniqueSealIds, s32 size) {
    s32 c;

    for (c = 0; c < size; c++) {
        if (sealId == uniqueSealIds[c]) {
            return TRUE;
        }
    }
    
    return FALSE;
}

BOOL ScrCmd_GiveRandomSeal(SCRIPTCONTEXT *ctx) {
    int i, j;
    u16 randVal;
    s32 avaliableSeals;
    u8 uniqueSeals[3];
    u16 givenSealIds[3];
    u16 *sealThresholds;
    SEALCASE *sealcase;
    u16 *seal1;
    u16 *seal2;
    u16 *seal3;
    s32 givenSeals;

    avaliableSeals = 0;

    seal1 = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    seal2 = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    seal3 = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    sealcase = Sav2_SealCase_get(ctx->fsys->savedata);

    sealThresholds = AllocFromHeapAtEnd(0x20, sizeof(u16)*SEAL_MYSTERY);

    MI_CpuFill8(sealThresholds, 0, sizeof(u16)*SEAL_MYSTERY);
    MI_CpuFill8(uniqueSeals, 0, sizeof(u8)*3);

    //Seals indexed 'mystery' and onward weren't officially released
    for (i = 0; i < SEAL_MYSTERY; i++) {
        avaliableSeals += SEAL_INVENTORY_QMAX - SealCase_CountSealOccurrenceAnywhere(sealcase, i + 1);
        sealThresholds[i] = avaliableSeals;
    }

    if (avaliableSeals > 3) {
        givenSeals = 3;
    } else {
        givenSeals = avaliableSeals;
    }

    i = 0;

    while (i < givenSeals) {
        do {
            randVal = LCRandom() % avaliableSeals;
        } while (IsSealNonUnique(randVal, givenSealIds, i));
        
        givenSealIds[i] = randVal;
        
        for (j = 0; j < SEAL_MYSTERY; j++) {
            if (randVal < sealThresholds[j]) {
                uniqueSeals[i] = j + 1;
                GiveOrTakeSeal(sealcase, uniqueSeals[i], 1);
                break;
            }
        }
        i++;
    }

    FreeToHeap(sealThresholds);

    *seal1 = uniqueSeals[0];
    *seal2 = uniqueSeals[1];
    *seal3 = uniqueSeals[2];

    return FALSE;
}

BOOL ScrCmd_CheckKyogreGroudonInParty(SCRIPTCONTEXT *ctx) {
    int c;
    u32 unkVar;
    int partyCount;
    PARTY *playerParty;
    u16 *unkPtr;
    
    u8 kyogreGroudonFlags = 0;

    unkPtr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    playerParty = SavArray_PlayerParty_get(ctx->fsys->savedata);
    partyCount = GetPartyCount(playerParty);
    unkVar = *(ctx->script_ptr);

    for (c = 0; c < partyCount; c++) {
        POKEMON *mon = GetPartyMonByIndex(playerParty, c);
        u16 species = GetMonData(mon, MON_DATA_SPECIES, NULL);
        u8 gameVer = GetMonData(mon, MON_DATA_GAME_VERSION, NULL);
        if (!GetMonData(mon, MON_DATA_IS_EGG, NULL)
            && !GetMonData(mon, MON_DATA_CHECKSUM_FAILED, NULL)
            && !GetMonData(mon, MON_DATA_EGG_MET_LOCATION, NULL)) {
                
            switch (species) {
            case SPECIES_KYOGRE:
                if (gameVer == 7) {
                    kyogreGroudonFlags |= 1;
                } 
                break;
            case SPECIES_GROUDON:
                if (gameVer == 8) {
                    kyogreGroudonFlags |= 1 << 1;
                }
                break;
            }
        }
    }

    if (kyogreGroudonFlags == 3) {
        *unkPtr = TRUE;
    } else {
        *unkPtr = FALSE;
    }

    return FALSE;
}

BOOL ScrCmd_SysSetSleepFlag(SCRIPTCONTEXT *ctx) {
    if (VarGet(ctx->fsys, ScriptReadHalfword(ctx)) != 0) {
        Sys_SetSleepDisableFlag(1 << 3);
    } else {
        Sys_ClearSleepDisableFlag(1 << 3);
    }
    return FALSE;
}

BOOL ScrCmd_BugContestAction(SCRIPTCONTEXT *ctx) {
    u8 unkVar1 = *(ctx->script_ptr++);
    u32 weekday = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    
    FieldSystem *fsys = ctx->fsys;
    
    if (unkVar1 == 0) {
        fsys->bugContest = BugContest_new(fsys, weekday);
    } else {
        BugContest_delete(fsys->bugContest);
        fsys->bugContest = NULL;
        sub_02093070(fsys);
    }
    return FALSE;
}

BOOL ScrCmd_BufferBugContestWinner(SCRIPTCONTEXT *ctx) {
    struct MSGFMT **msgfmt;
    BUGCONTEST *bugContest;

    msgfmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    bugContest = FieldSys_BugContest_get(ctx->fsys);

    BugContest_BufferContestWinnerNames(bugContest, ctx->msg_data, *msgfmt, *ctx->script_ptr++);

    return FALSE;
}

BOOL ScrCmd_JudgeBugContest(SCRIPTCONTEXT *ctx) { 
    BUGCONTEST *bugContest;
    u16 *prize;
    u16 *placement;
    u16 *species;

    bugContest = FieldSys_BugContest_get(ctx->fsys);
    placement = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    prize = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    species = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    BugContest_Judge(bugContest);

    *placement = bugContest->placement;
    *prize = bugContest->prize;
    
    if (bugContest->caught_poke == 0) {
        *species = 0;
    } else {
        *species = GetMonData(bugContest->pokemon, MON_DATA_SPECIES, NULL);
    }

    return FALSE;
}

BOOL ScrCmd_BufferBugContestMonNick(SCRIPTCONTEXT *ctx) {
    struct MSGFMT **msgfmt;
    BUGCONTEST *bugContest;
    u32 script_index;

    msgfmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    bugContest = FieldSys_BugContest_get(ctx->fsys);

    script_index = *(ctx->script_ptr++);

    u16 *monNick = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    *monNick = BugContest_BufferCaughtMonNick(bugContest, *msgfmt, script_index);
    return FALSE;
}

BOOL ScrCmd_BugContestGetTimeLeft(SCRIPTCONTEXT *ctx) {
    struct MSGFMT **msgfmt;    
    BUGCONTEST *bugContest;
    u32 script_index;
    u32 timeLeft;

    msgfmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);

    script_index = *(ctx->script_ptr++);  
    timeLeft = 1;

    bugContest = FieldSys_BugContest_get(ctx->fsys);

    if (bugContest != 0 && bugContest->elapsed_time < 20) {
        timeLeft = 20 - bugContest->elapsed_time;
    }

    BufferIntegerAsString(*msgfmt, script_index, timeLeft, 2, STRCONVMODE_LEFT_ALIGN, 1);

    return FALSE;
}

BOOL ScrCmd_IsBugContestantRegistered(SCRIPTCONTEXT *ctx) {
    BUGCONTEST *bugContest = FieldSys_BugContest_get(ctx->fsys);
    u32 id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 *ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    *ptr = BugContest_ContestantIsRegistered(bugContest, id);
    return FALSE;
}