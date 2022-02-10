#include "script.h"
#include "map_object_manager.h"
#include "save_follow_poke.h"
#include "script_pokemon_util.h"
#include "field_map_object.h"
#include "constants/scrcmd.h"

BOOL sub_02069E14(LocalMapObject *mapObject);
BOOL sub_02069FF4(int species, u32 mapno);
void sub_0206A040(LocalMapObject *mapObject, int a1);
void sub_0206A06C(FollowMon *followMon);
void sub_0206A054(FieldSystem *fsys);
LocalMapObject *CreateFollowingSpriteFieldObject(MapObjectMan *mapObjectMan, int species, u16 forme, int gender, int direction, int x, int y, int shiny);
void FollowPokeFsysParamSet(FieldSystem *fsys, int species, u8 forme, BOOL shiny, u8 gender);
void FollowPokeMapObjectSetParams(LocalMapObject *mapObject, int species, u8 forme, BOOL shiny);
void sub_0206A288(struct FieldSystemUnk108 *a0, POKEMON *pokemon, u16 species, u32 personality);
LocalMapObject *FollowingPokemon_GetMapObject(FieldSystem *fsys);
u32 FollowingPokemon_GetSpriteID(u32 species, u16 forme, u32 gender);

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
    sub_0206A06C(&fsys->unkE4);
    SavFollowPoke_SetUnused2bitField(0, Sav2_FollowPoke_get(fsys->savedata));
    if (partyCount != 0) {
        if (CountAlivePokemon(party) == 0) {
            pokemon = GetFirstNonEggInParty(party);
        } else {
            pokemon = GetFirstAliveMonInParty_CrashIfNone(party);
        }
        species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        fsys->unkE4.mapObject = NULL;
        if (sub_02069FF4(species, mapno)) {
            forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
            gender = GetMonData(pokemon, MON_DATA_GENDER, NULL);
            shiny = MonIsShiny(pokemon);
            fsys->unkE4.mapObject = CreateFollowingSpriteFieldObject(mapObjectMan, species, forme, gender, direction, x, y, shiny);
            fsys->unkE4.active = TRUE;
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

    return fsys->unkE4.mapObject;
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
    sub_0206A06C(&fsys->unkE4);
    if (partyCount != 0) {
        pokemon = GetFirstAliveMonInParty_CrashIfNone(party);
        species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
        sub_0206A288(fsys->unk108, pokemon, species, GetMonData(pokemon, MON_DATA_PERSONALITY, NULL));
        if (sub_02069FF4(species, mapno)) {
            followPokeObj = GetMapObjectByID(fsys->unk3C, obj_partner_poke);
            if (followPokeObj == NULL) {
                fsys->unkE4.unk15 = 1;
            } else {
                forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
                gender = GetMonGender(pokemon);
                shiny = MonIsShiny(pokemon);
                fsys->unkE4.mapObject = followPokeObj;
                fsys->unkE4.active = TRUE;
                FollowPokeFsysParamSet(fsys, species, forme, shiny, gender);
                FollowPokeMapObjectSetParams(followPokeObj, species, forme, shiny);
                MapObject_SetGfxID(fsys->unkE4.mapObject, FollowingPokemon_GetSpriteID(species, forme, gender));
                player_unk = sub_0205C700(fsys->playerAvatar);
                if (player_unk == 0 || player_unk == 3) {
                    SavFollowPoke_SetUnused2bitField(1, Sav2_FollowPoke_get(fsys->savedata));
                } else if (player_unk == 1) {
                    SavFollowPoke_SetUnused2bitField(2, Sav2_FollowPoke_get(fsys->savedata));
                    sub_0206A040(fsys->unkE4.mapObject, 1);
                } else if (player_unk == 2) {
                    SavFollowPoke_SetUnused2bitField(2, Sav2_FollowPoke_get(fsys->savedata));
                    sub_0206A040(fsys->unkE4.mapObject, 1);
                } else {
                    GF_ASSERT(0);
                }
                if (sub_02069E14(fsys->unkE4.mapObject)) {
                    sub_0206A040(fsys->unkE4.mapObject, 1);
                }
                if (SavFollowPoke_GetInhibitFlagState(Sav2_FollowPoke_get(fsys->savedata))) {
                    sub_0206A054(fsys);
                }
                sub_0205F6AC(fsys->unkE4.mapObject, 0);
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
                fsys->unkE4.mapObject = followPokeObj;
                fsys->unkE4.active = TRUE;
                fsys->unkE4.unk15 = 1;
            }
        }
    }
}
