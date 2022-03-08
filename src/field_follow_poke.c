#include "script.h"
#include "map_object_manager.h"
#include "save_follow_poke.h"
#include "script_pokemon_util.h"
#include "field_map_object.h"
#include "map_header.h"
#include "constants/scrcmd.h"

LocalMapObject *FollowingPokemon_GetMapObject(FieldSystem *fsys);
u32 FollowingPokemon_GetSpriteID(int species, u16 forme, u32 gender);
void sub_02069DEC(LocalMapObject *mapObject, int a1);
u8 sub_02069E14(LocalMapObject *mapObject);
void FollowPokeMapObjectSetParams(LocalMapObject *mapObject, int species, u8 forme, BOOL shiny);
void FollowPokeFsysParamSet(FieldSystem *fsys, int species, u8 forme, BOOL shiny, u8 gender);
BOOL sub_02069FF4(int species, u32 mapno);
BOOL sub_0206A0A4(u32 mapno);
void FollowingPoke_SetObjectShinyFlag(LocalMapObject *mapObject, BOOL shiny);
void FollowingPoke_SetObjectFormeParam(LocalMapObject *mapObject, int species, u8 forme);
void sub_0206A040(LocalMapObject *mapObject, int a1);
void sub_0206A06C(FollowMon *followMon);
void sub_0206A054(FieldSystem *fsys);
LocalMapObject *CreateFollowingSpriteFieldObject(MapObjectMan *mapObjectMan, int species, u16 forme, int gender, int direction, int x, int y, int shiny);
void sub_0206A288(struct FieldSystemUnk108 *a0, POKEMON *pokemon, u16 species, u32 personality);
int SpeciesToOverworldModelIndexOffset(int species);
int OverworldModelLookupHasFemaleForme(int species);
int OverworldModelLookupFormeCount(int species);

LocalMapObject *sub_020699F8(MapObjectMan *mapObjectMan, int x, int y, int direction, u32 mapno) {
    FieldSystem *fsys;
    PARTY *party;
    int partyCount;
    POKEMON *pokemon;
    int species;
    int forme;
    int gender;
    int shiny;
    int player_unk;
    LocalMapObject *followPokeObj;

    fsys = MapObjectMan_GetFieldSysPtr(mapObjectMan);
    party = SavArray_PlayerParty_get(fsys->savedata);
    partyCount = GetPartyCount(party);
    sub_0206A06C(&fsys->followMon);
    SavFollowPoke_SetUnused2bitField(0, Sav2_FollowPoke_get(fsys->savedata));
    if (partyCount != 0) {
        if (CountAlivePokemon(party) == 0) {
            pokemon = GetFirstNonEggInParty(party);
        } else {
            pokemon = GetFirstAliveMonInParty_CrashIfNone(party);
        }
        species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        fsys->followMon.mapObject = NULL;
        if (sub_02069FF4(species, mapno)) {
            forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
            gender = GetMonData(pokemon, MON_DATA_GENDER, NULL);
            shiny = MonIsShiny(pokemon);
            fsys->followMon.mapObject = CreateFollowingSpriteFieldObject(mapObjectMan, species, forme, gender, direction, x, y, shiny);
            fsys->followMon.active = TRUE;
            FollowPokeFsysParamSet(fsys, species, forme, shiny, gender);
            sub_0206A288(fsys->unk108, pokemon, species, GetMonData(pokemon, MON_DATA_PERSONALITY, NULL));
            player_unk = sub_0205C700(fsys->playerAvatar);
            if (player_unk == 0 || player_unk == 3) {
                SavFollowPoke_SetUnused2bitField(1, Sav2_FollowPoke_get(fsys->savedata));
            } else if (player_unk == 1) {
                SavFollowPoke_SetUnused2bitField(2, Sav2_FollowPoke_get(fsys->savedata));
                sub_0206A054(fsys);
                sub_0205FC94(FollowingPokemon_GetMapObject(fsys), 56);
            } else if (player_unk == 2) {
                SavFollowPoke_SetUnused2bitField(2, Sav2_FollowPoke_get(fsys->savedata));
                sub_0206A054(fsys);
                sub_0205FC94(FollowingPokemon_GetMapObject(fsys), 56);
            } else {
                GF_ASSERT(0);
            }
            if (SavFollowPoke_GetInhibitFlagState(Sav2_FollowPoke_get(fsys->savedata))) {
                sub_0206A054(fsys);
            }
        }
    }

    return fsys->followMon.mapObject;
}

void sub_02069B74(MapObjectMan *mapObjectMan, u32 mapno) {
    FieldSystem *fsys;
    PARTY *party;
    int partyCount;
    POKEMON *pokemon;
    int species;
    int forme;
    u8 gender;
    int shiny;
    int player_unk;
    LocalMapObject *followPokeObj;

    fsys = MapObjectMan_GetFieldSysPtr(mapObjectMan);
    party = SavArray_PlayerParty_get(fsys->savedata);
    partyCount = GetPartyCount(party);
    sub_0206A06C(&fsys->followMon);
    if (partyCount != 0) {
        pokemon = GetFirstAliveMonInParty_CrashIfNone(party);
        species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        sub_0206A288(fsys->unk108, pokemon, species, GetMonData(pokemon, MON_DATA_PERSONALITY, NULL));
        if (sub_02069FF4(species, mapno)) {
            followPokeObj = GetMapObjectByID(fsys->unk3C, obj_partner_poke);
            if (followPokeObj == NULL) {
                fsys->followMon.unk15 = 1;
            } else {
                forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
                gender = GetMonGender(pokemon);
                shiny = MonIsShiny(pokemon);
                fsys->followMon.mapObject = followPokeObj;
                fsys->followMon.active = TRUE;
                FollowPokeFsysParamSet(fsys, species, forme, shiny, gender);
                FollowPokeMapObjectSetParams(followPokeObj, species, forme, shiny);
                MapObject_SetGfxID(fsys->followMon.mapObject, FollowingPokemon_GetSpriteID(species, forme, gender));
                player_unk = sub_0205C700(fsys->playerAvatar);
                if (player_unk == 0 || player_unk == 3) {
                    SavFollowPoke_SetUnused2bitField(1, Sav2_FollowPoke_get(fsys->savedata));
                } else if (player_unk == 1) {
                    SavFollowPoke_SetUnused2bitField(2, Sav2_FollowPoke_get(fsys->savedata));
                    sub_0206A040(fsys->followMon.mapObject, 1);
                } else if (player_unk == 2) {
                    SavFollowPoke_SetUnused2bitField(2, Sav2_FollowPoke_get(fsys->savedata));
                    sub_0206A040(fsys->followMon.mapObject, 1);
                } else {
                    GF_ASSERT(0);
                }
                if (sub_02069E14(fsys->followMon.mapObject)) {
                    sub_0206A040(fsys->followMon.mapObject, 1);
                }
                if (SavFollowPoke_GetInhibitFlagState(Sav2_FollowPoke_get(fsys->savedata))) {
                    sub_0206A054(fsys);
                }
                sub_0205F6AC(fsys->followMon.mapObject, 0);
            }
        } else {
            followPokeObj = GetMapObjectByID(fsys->unk3C, obj_partner_poke);
            if (followPokeObj != NULL) {
                forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
                gender = GetMonGender(pokemon);
                shiny = MonIsShiny(pokemon);
                FollowPokeFsysParamSet(fsys, species, forme, shiny, gender);
                FollowPokeMapObjectSetParams(followPokeObj, species, forme, shiny);
                MapObject_SetGfxID(followPokeObj, FollowingPokemon_GetSpriteID(species, forme, gender));
                fsys->followMon.mapObject = followPokeObj;
                fsys->followMon.active = TRUE;
                fsys->followMon.unk15 = 1;
            }
        }
    }
}

LocalMapObject *FollowingPokemon_GetMapObject(FieldSystem *fsys) {
    return fsys->followMon.mapObject;
}

u32 FollowingPokemon_GetSpriteID(int species, u16 forme, u32 gender) {
    int ret;

    if (species <= 0 || species > NATIONAL_DEX_COUNT) {
        ret = SPRITE_TSURE_POKE_BULBASAUR;
    } else {
        ret = SPRITE_TSURE_POKE_BULBASAUR + SpeciesToOverworldModelIndexOffset(species);
        if (OverworldModelLookupHasFemaleForme(species)) {
            if (gender == MON_FEMALE) {
                ret++;
            }
        } else {
            if (forme > OverworldModelLookupFormeCount(species)) {
                forme = 0;
            }
            ret += forme;
        }
        if (ret > SPRITE_TSURE_POKE_ARCEUS_DARK) {
            ret = SPRITE_TSURE_POKE_BULBASAUR;
        }
    }
    return ret;
}

void sub_02069DC8(LocalMapObject *mapObject, int a1) {
    sub_0206A040(mapObject, a1);
    if (a1) {
        sub_02069DEC(mapObject, 1);
    } else {
        sub_02069DEC(mapObject, 0);
    }
}

void sub_02069DEC(LocalMapObject *mapObject, int a1) {
    int value;
    u8 flag0;
    u32 flag1;
    u32 flag2;

    value = MapObject_GetParam(mapObject, 2);
    flag0 = value & 1;
    flag1 = a1;
    flag2 = value >> 2;
    value = flag2 << 2;
    value |= flag1 << 1;
    value |= flag0 << 0;
    MapObject_SetParam(mapObject, value, 2);
}

u8 sub_02069E14(LocalMapObject *mapObject) {
    return (MapObject_GetParam(mapObject, 2) >> 1) & 1;
}

void sub_02069E28(LocalMapObject *mapObject, u32 a1) {
    int param;
    u8 r1;
    u16 r2;
    u16 b;

    param = MapObject_GetParam(mapObject, 2);

    r2 = param >> 10;
    b = r2 << 10;
    param = (u8) param;
    param |= b | (a1 << 8);

    MapObject_SetParam(mapObject, param, 2);
}

void sub_02069E50(LocalMapObject *mapObject, u8 a1) {
    int param;
    u32 b;

    GF_ASSERT(a1 <= 23);

    param = MapObject_GetParam(mapObject, 2);

    b = param & 0x3FF;
    param = (a1 << 10) | (u8)b;

    MapObject_SetParam(mapObject, param, 2);
}

void sub_02069E84(LocalMapObject *mapObject, u8 a1) {
    int param;
    u8 a;
    u32 b;

    param = MapObject_GetParam(mapObject, 2);

    a = param & 3;
    b = param >> 3;

    param = (b << 3) | (a1 << 2);
    param |= a;

    MapObject_SetParam(mapObject, param, 2);
}

u8 sub_02069EAC(LocalMapObject *mapObject) {
    return (MapObject_GetParam(mapObject, 2) >> 2) & 1;
}

u8 sub_02069EC0(LocalMapObject *mapObject) {
    return (MapObject_GetParam(mapObject, 2) >> 8) & 3;
}

u8 sub_02069ED4(LocalMapObject *mapObject) {
    return (MapObject_GetParam(mapObject, 2) >> 10) & 0x3F;
}

void FollowPokeMapObjectSetParams(LocalMapObject *mapObject, int species, u8 forme, BOOL shiny) {
    FollowingPoke_SetObjectShinyFlag(mapObject, shiny);
    FollowingPoke_SetObjectFormeParam(mapObject, species, forme);
    MapObject_SetParam(mapObject, species, 0);
}

void sub_02069F0C(LocalMapObject *mapObject, int species, u8 forme, BOOL shiny, int a4) {
    MapObject_SetParam(mapObject, a4, 2);
    FollowingPoke_SetObjectShinyFlag(mapObject, shiny);
    FollowingPoke_SetObjectFormeParam(mapObject, species, forme);
    MapObject_SetParam(mapObject, species, 0);
}

void FollowPokeFsysParamSet(FieldSystem *fsys, int species, u8 forme, BOOL shiny, u8 gender) {
    fsys->followMon.species = species;
    fsys->followMon.shiny = shiny;
    fsys->followMon.forme = forme;
    fsys->followMon.gender = gender;
}

u8 sub_02069F64(int species) {
    u8 data[4];

    ReadWholeNarcMemberByIdPair(data, NARC_a_1_4_1, SpeciesToOverworldModelIndexOffset(species));
    return data[1];
}

int sub_02069F7C(LocalMapObject *mapObject) {
    return MapObject_GetParam(mapObject, 0);
}

BOOL FollowingPokemon_IsActive(FieldSystem *fsys) {
    if (fsys->followMon.active == 0) {
        return FALSE;
    }

    if (CountAlivePokemon(SavArray_PlayerParty_get(fsys->savedata)) != 0) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL sub_02069FB0(FieldSystem *fsys) {
    if (FollowingPokemon_IsActive(fsys)) {
        if (!sub_0205F684(fsys->followMon.mapObject)) {
            return TRUE;
        } else {
            return FALSE;
        }
    } else {
        return FALSE;
    }
}

void sub_02069FD4(FieldSystem *fsys) {
    u32 mapno;

    mapno = SavFollowPoke_GetMapId(Sav2_FollowPoke_get(fsys->savedata));
    sub_02069FF4(sub_02069F7C(fsys->followMon.mapObject), mapno);
}

BOOL sub_02069FF4(int species, u32 mapno) {
    BOOL ret;
    if ((species == SPECIES_DIGLETT || species == SPECIES_DUGTRIO) && !sub_0206A0A4(mapno)) {
        return FALSE;
    }

    switch (MapHeader_GetFollowMode(mapno)) {
    case MAP_FOLLOWMODE_PREVENT:
        ret = FALSE;
        break;
    case MAP_FOLLOWMODE_HEIGHT_RESTRICT:
        if (sub_02069F64(species)) {
            ret = FALSE;
        } else {
            ret = TRUE;
        }
        break;
    case MAP_FOLLOWMODE_ALLOW:
        ret = TRUE;
        break;
    }

    return ret;
}
