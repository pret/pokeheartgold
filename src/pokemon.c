#include "pokemon.h"
#include "math_util.h"
#include "seal_case.h"
#include "move.h"
#include "gf_rtc.h"
#include "item.h"
#include "msgdata.h"
#include "party.h"
#include "map_section.h"
#include "unk_0200CF18.h"
#include "unk_02023694.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/trainer_class.h"
#include "constants/balls.h"
#include "constants/abilities.h"
#include "constants/map_sections.h"

void MonEncryptSegment(void *data, u32 size, u32 key);
void MonDecryptSegment(void *data, u32 size, u32 key);
u32 CalcMonChecksum(void *data, u32 size);
void InitBoxMonMoveset(BOXMON *boxmon);
void LoadMonBaseStats_HandleAlternateForme(u32 species, u32 forme, struct BaseStats *dest);
u16 ModifyStatByNature(u8 nature, u16 stat, u8 statID);
u32 GetMonDataInternal(POKEMON * pokemon, int attr, void * dest);
u32 GetBoxMonDataInternal(BOXMON * boxmon, int attr, void * dest);
void SetMonDataInternal(POKEMON * pokemon, int attr, const void * data);
void SetBoxMonDataInternal(BOXMON * boxmon, int attr, const void * data);
void AddMonDataInternal(POKEMON * pokemon, int attr, int value);
void AddBoxMonDataInternal(BOXMON * boxmon, int attr, int value);
PokemonDataBlock *GetSubstruct(BOXMON *boxmon, u32 pid, u8 which_struct);
void LoadMonPersonal(int species, BASE_STATS *dest);
int ResolveMonForme(int species, int forme);
u8 GetGenderBySpeciesAndPersonality_PreloadedPersonal(const BASE_STATS *personal, u16 species, u32 pid);
u32 MaskOfFlagNo(int flagno);
void sub_0207013C(struct SomeDrawPokemonStruct *a0, BOXMON *boxmon, u8 whichFacing, BOOL a3);
void sub_02070588(struct SomeDrawPokemonStruct *a0, u16 species, u8 gender, u8 whichFacing, u8 shiny, u8 forme, u32 pid);
void sub_020701E4(struct SomeDrawPokemonStruct *a0, u16 species, u8 gender, u8 whichFacing, u8 shiny, u8 forme, u32 pid);
u8 sub_02070438(u16 species, u8 forme);
u8 sub_02070854(BOXMON *boxmon, u8 whichFacing, BOOL a2);
u8 sub_02070A64(u16 species, u8 gender, u8 whichFacing, u8 forme, u32 pid);
u8 sub_020708D8(u16 species, u8 gender, u8 whichFacing, u8 forme, u32 pid);
void sub_02070D3C(s32 trainer_class, s32 a1, s32 a2, struct UnkStruct_02070D3C *a3);
s32 sub_0207280C(s32 trainer_class, s32 a1);
void LoadMonEvolutionTable(u16 species, struct Evolution *evoTable);
BOOL MonHasMove(POKEMON *pokemon, u16 move_id);

#define ENCRY_ARGS_PTY(mon) (u16 *)&(mon)->party, sizeof((mon)->party), (mon)->box.pid
#define ENCRY_ARGS_BOX(boxmon) (u16 *)&(boxmon)->substructs, sizeof((boxmon)->substructs), (boxmon)->checksum
#define ENCRYPT_PTY(mon) MonEncryptSegment(ENCRY_ARGS_PTY(mon))
#define ENCRYPT_BOX(boxmon) MonEncryptSegment(ENCRY_ARGS_BOX(boxmon))
#define DECRYPT_PTY(mon) MonDecryptSegment(ENCRY_ARGS_PTY(mon))
#define DECRYPT_BOX(boxmon) MonDecryptSegment(ENCRY_ARGS_BOX(boxmon))
#define CHECKSUM(boxmon) CalcMonChecksum((u16 *)(boxmon)->substructs, sizeof((boxmon)->substructs))
#define SHINY_CHECK(otid, pid) (( \
    ((((otid) & 0xFFFF0000u) >> 16u)) ^ \
    (((otid) & 0xFFFFu)) ^ \
    ((((pid) & 0xFFFF0000u) >> 16u))^ \
    (((pid) & 0xFFFFu))) \
    < 8u)
#define CALC_UNOWN_LETTER(pid) ((u32)((((pid) & 0x3000000) >> 18) | (((pid) & 0x30000) >> 12) | (((pid) & 0x300) >> 6) | (((pid) & 0x3) >> 0)) % 28u)

extern const s8 sNatureStatMods[NATURE_NUM][NUM_EV_STATS];
extern const s8 sFlavorPreferencesByNature[NATURE_NUM][FLAVOR_MAX];
extern const s8 sFriendshipModTable[FRIENDSHIP_EVENT_NUM][FRIENDSHIP_TIER_NUM];

void ZeroMonData(POKEMON *pokemon) {
    MI_CpuClearFast(pokemon, sizeof(POKEMON));
    ENCRYPT_BOX(&pokemon->box);
    ENCRYPT_PTY(pokemon);
}

void ZeroBoxMonData(BOXMON *boxmon) {
    MI_CpuClearFast(boxmon, sizeof(BOXMON));
    ENCRYPT_BOX(boxmon);
}

u32 SizeOfStructPokemon(void) {
    return sizeof(POKEMON);
}

POKEMON *AllocMonZeroed(HeapID heapId) {
    POKEMON *ret = (POKEMON *)AllocFromHeap(heapId, sizeof(POKEMON));
    ZeroMonData(ret);
    return ret;
}

BOOL AcquireMonLock(POKEMON *pokemon) {
    BOOL locked = FALSE;
    if (!pokemon->box.party_lock) {
        locked = TRUE;
        GF_ASSERT(!pokemon->box.box_lock);
        pokemon->box.party_lock = TRUE;
        pokemon->box.box_lock = TRUE;
        DECRYPT_PTY(pokemon);
        DECRYPT_BOX(&pokemon->box);
    }
    return locked;
}

BOOL ReleaseMonLock(POKEMON *pokemon, BOOL locked) {
    BOOL prev = FALSE;
    if (pokemon->box.party_lock == TRUE && locked == TRUE) {
        prev = TRUE;
        pokemon->box.party_lock = FALSE;
        pokemon->box.box_lock = FALSE;
        ENCRYPT_PTY(pokemon);
        pokemon->box.checksum = CHECKSUM(&pokemon->box);
        ENCRYPT_BOX(&pokemon->box);
    }
    return prev;
}

BOOL AcquireBoxMonLock(BOXMON *boxmon) {
    BOOL locked = FALSE;
    if (!boxmon->box_lock) {
        locked = TRUE;
        boxmon->box_lock = TRUE;
        DECRYPT_BOX(boxmon);
    }
    return locked;
}

BOOL ReleaseBoxMonLock(BOXMON *boxmon, BOOL locked) {
    BOOL prev = FALSE;
    if (boxmon->box_lock == TRUE && locked == TRUE) {
        prev = TRUE;
        boxmon->box_lock = FALSE;
        boxmon->checksum = CHECKSUM(boxmon);
        ENCRYPT_BOX(boxmon);
    }
    return prev;
}
void CreateMon(POKEMON * pokemon, int species, int level, int fixedIV, int hasFixedPersonality, int fixedPersonality, int otIdType, int fixedOtId) {
    MAIL * mail;
    u32 capsule;
    CAPSULE seal_coords;
    ZeroMonData(pokemon);
    CreateBoxMon(&pokemon->box, species, level, fixedIV, hasFixedPersonality, fixedPersonality, otIdType, fixedOtId);
    // Not your average encryption call
    MonEncryptSegment((u16 *)&pokemon->party, sizeof(pokemon->party), 0);
    ENCRYPT_PTY(pokemon);
    SetMonData(pokemon, MON_DATA_LEVEL, &level);
    mail = Mail_new(0);
    SetMonData(pokemon, MON_DATA_MAIL_STRUCT, mail);
    FreeToHeap(mail);
    capsule = 0;
    SetMonData(pokemon, MON_DATA_CAPSULE, &capsule);
    MI_CpuClearFast(&seal_coords, sizeof(seal_coords));
    SetMonData(pokemon, MON_DATA_SEAL_COORDS, &seal_coords);
    CalcMonLevelAndStats(pokemon);
}

void CreateBoxMon(BOXMON * boxPokemon, int species, int level, int fixedIV, int hasFixedPersonality, int fixedPersonality, int otIdType, int fixedOtId) {
    BOOL decry;
    u32 exp;
    u32 iv;
    ZeroBoxMonData(boxPokemon);
    decry = AcquireBoxMonLock(boxPokemon);
    if (hasFixedPersonality == 0) {
        fixedPersonality = (LCRandom() | (LCRandom() << 16));
    }
    SetBoxMonData(boxPokemon, MON_DATA_PERSONALITY, &fixedPersonality);
    if (otIdType == 2) {
        do {
            fixedOtId = (LCRandom() | (LCRandom() << 16));
        } while (SHINY_CHECK(fixedOtId, fixedPersonality));
    } else if (otIdType != 1) {
        fixedOtId = 0;
    }
    SetBoxMonData(boxPokemon, MON_DATA_OTID, &fixedOtId);
    SetBoxMonData(boxPokemon, MON_DATA_GAME_LANGUAGE, (void *)&gGameLanguage);
    SetBoxMonData(boxPokemon, MON_DATA_SPECIES, &species);
    SetBoxMonData(boxPokemon, MON_DATA_SPECIES_NAME, NULL);
    exp = GetMonExpBySpeciesAndLevel(species, level);
    SetBoxMonData(boxPokemon, MON_DATA_EXPERIENCE, &exp);
    exp = (u32)GetMonBaseStat(species, BASE_FRIENDSHIP);
    SetBoxMonData(boxPokemon, MON_DATA_FRIENDSHIP, &exp);
    SetBoxMonData(boxPokemon, MON_DATA_MET_LEVEL, &level);
    SetBoxMonData(boxPokemon, MON_DATA_GAME_VERSION, (void *)&gGameVersion);
    exp = ITEM_POKE_BALL;
    SetBoxMonData(boxPokemon, MON_DATA_POKEBALL, &exp);
    SetBoxMonData(boxPokemon, MON_DATA_DP_POKEBALL, &exp);
    if (fixedIV < 0x20) {
        SetBoxMonData(boxPokemon, MON_DATA_HP_IV, &fixedIV);
        SetBoxMonData(boxPokemon, MON_DATA_ATK_IV, &fixedIV);
        SetBoxMonData(boxPokemon, MON_DATA_DEF_IV, &fixedIV);
        SetBoxMonData(boxPokemon, MON_DATA_SPEED_IV, &fixedIV);
        SetBoxMonData(boxPokemon, MON_DATA_SPATK_IV, &fixedIV);
        SetBoxMonData(boxPokemon, MON_DATA_SPDEF_IV, &fixedIV);
    } else {
        exp = LCRandom();
        iv = exp & 0x1F;
        SetBoxMonData(boxPokemon, MON_DATA_HP_IV, &iv);
        iv = (exp & 0x3E0) >> 5;
        SetBoxMonData(boxPokemon, MON_DATA_ATK_IV, &iv);
        iv = (exp & 0x7C00) >> 10;
        SetBoxMonData(boxPokemon, MON_DATA_DEF_IV, &iv);
        exp = LCRandom();
        iv = exp & 0x1F;
        SetBoxMonData(boxPokemon, MON_DATA_SPEED_IV, &iv);
        iv = (exp & 0x3E0) >> 5;
        SetBoxMonData(boxPokemon, MON_DATA_SPATK_IV, &iv);
        iv = (exp & 0x7C00) >> 10;
        SetBoxMonData(boxPokemon, MON_DATA_SPDEF_IV, &iv);
    }
    exp = (u32)GetMonBaseStat(species, BASE_ABILITY_1);
    iv = (u32)GetMonBaseStat(species, BASE_ABILITY_2);
    if (iv != 0) {
        if (fixedPersonality & 1) {
            SetBoxMonData(boxPokemon, MON_DATA_ABILITY, &iv);
        } else {
            SetBoxMonData(boxPokemon, MON_DATA_ABILITY, &exp);
        }
    } else {
        SetBoxMonData(boxPokemon, MON_DATA_ABILITY, &exp);
    }
    exp = GetBoxMonGender(boxPokemon);
    SetBoxMonData(boxPokemon, MON_DATA_GENDER, &exp);
    InitBoxMonMoveset(boxPokemon);
    ReleaseBoxMonLock(boxPokemon, decry);
}

void CreateMonWithNature(POKEMON * pokemon, u16 species, u8 level, u8 fixedIv, u8 nature) {
    u32 personality;
    do {
        personality = (u32)(LCRandom() | (LCRandom() << 16));
    } while (nature != GetNatureFromPersonality(personality));
    CreateMon(pokemon, (int)species, (int)level, (int)fixedIv, TRUE, (int)personality, (int)0, (int)0);
}

void CreateMonWithGenderNatureLetter(POKEMON * pokemon, u16 species, u8 level, u8 fixedIv, u8 gender, u8 nature, u8 letter) {
    u32 pid = 0;
    u16 test = 0;
    if (letter != 0 && letter < 29) {
        do {
            pid = (u32)(LCRandom() | (LCRandom() << 16));
            test = (u16)CALC_UNOWN_LETTER(pid);
        } while (nature != GetNatureFromPersonality(pid) || gender != GetGenderBySpeciesAndPersonality(species, pid) || test != letter - 1);
    } else {
        pid = GenPersonalityByGenderAndNature(species, gender, nature);
    }
    CreateMon(pokemon, (int)species, (int)level, (int)fixedIv, 1, (int)pid, 0, 0);
}

u32 GenPersonalityByGenderAndNature(u16 species, u8 gender, u8 nature) {
    int pid = nature;
    u8 ratio = (u8)GetMonBaseStat(species, BASE_GENDER_RATIO);
    switch (ratio) {
    case MON_RATIO_MALE:
    case MON_RATIO_FEMALE:
    case MON_RATIO_UNKNOWN:
        break;
    default:
        if (gender == MON_MALE) {
            // Smallest increment that forces the low byte to exceed the
            // gender ratio, thus making the mon male
            pid = 25 * ((ratio / 25) + 1);
            pid += nature;
        }
        break;
    }
    return (u32)pid;
}

void CreateMonWithFixedIVs(POKEMON * pokemon, int species, int level, int ivs, int personality) {
    CreateMon(pokemon, species, level, 0, 1, personality, 0, 0);
    SetMonData(pokemon, MON_DATA_IVS_WORD, &ivs);
    CalcMonLevelAndStats(pokemon);
}

void CalcMonLevelAndStats(POKEMON * pokemon) {
    BOOL decry = AcquireMonLock(pokemon);
    u32 level = (u32)CalcMonLevel(pokemon);
    SetMonData(pokemon, MON_DATA_LEVEL, &level);
    CalcMonStats(pokemon);
    ReleaseMonLock(pokemon, decry);
}

void CalcMonStats(POKEMON * pokemon) {
    struct BaseStats * baseStats;
    int level;
    int maxHp;
    int hpIv;
    int hpEv;
    int atkIv;
    int defIv;
    int speedIv;
    int spatkIv;
    int spdefIv;
    int atkEv;
    int defEv;
    int speedEv;
    int spatkEv;
    int spdefEv;
    int forme;
    int hp;
    int species;
    int newMaxHp;
    int newAtk;
    int newDef;
    int newSpeed;
    int newSpatk;
    int newSpdef;

    BOOL decry = AcquireMonLock(pokemon);
    level = (int)GetMonData(pokemon, MON_DATA_LEVEL, NULL);
    maxHp = (int)GetMonData(pokemon, MON_DATA_MAXHP, NULL);
    hp = (int)GetMonData(pokemon, MON_DATA_HP, NULL);
    hpIv = (int)GetMonData(pokemon, MON_DATA_HP_IV, NULL);
    hpEv = (int)GetMonData(pokemon, MON_DATA_HP_EV, NULL);
    atkIv = (int)GetMonData(pokemon, MON_DATA_ATK_IV, NULL);
    atkEv = (int)GetMonData(pokemon, MON_DATA_ATK_EV, NULL);
    defIv = (int)GetMonData(pokemon, MON_DATA_DEF_IV, NULL);
    defEv = (int)GetMonData(pokemon, MON_DATA_DEF_EV, NULL);
    speedIv = (int)GetMonData(pokemon, MON_DATA_SPEED_IV, NULL);
    speedEv = (int)GetMonData(pokemon, MON_DATA_SPEED_EV, NULL);
    spatkIv = (int)GetMonData(pokemon, MON_DATA_SPATK_IV, NULL);
    spatkEv = (int)GetMonData(pokemon, MON_DATA_SPATK_EV, NULL);
    spdefIv = (int)GetMonData(pokemon, MON_DATA_SPDEF_IV, NULL);
    spdefEv = (int)GetMonData(pokemon, MON_DATA_SPDEF_EV, NULL);
    forme = (int)GetMonData(pokemon, MON_DATA_FORME, NULL);
    species = (int)GetMonData(pokemon, MON_DATA_SPECIES, NULL);

    baseStats = (struct BaseStats *)AllocFromHeap(0, sizeof(struct BaseStats));
    LoadMonBaseStats_HandleAlternateForme(species, forme, baseStats);

    if (species == SPECIES_SHEDINJA) {
        newMaxHp = 1;
    } else {
        newMaxHp = (baseStats->hp * 2 + hpIv + hpEv / 4) * level / 100 + level + 10;
    }
    SetMonData(pokemon, MON_DATA_MAXHP, &newMaxHp);

    newAtk = (baseStats->atk * 2 + atkIv + atkEv / 4) * level / 100 + 5;
    newAtk = ModifyStatByNature(GetMonNature(pokemon), (u16)newAtk, STAT_ATK);
    SetMonData(pokemon, MON_DATA_ATK, &newAtk);

    newDef = (baseStats->def * 2 + defIv + defEv / 4) * level / 100 + 5;
    newDef = ModifyStatByNature(GetMonNature(pokemon), (u16)newDef, STAT_DEF);
    SetMonData(pokemon, MON_DATA_DEF, &newDef);

    newSpeed = (baseStats->speed * 2 + speedIv + speedEv / 4) * level / 100 + 5;
    newSpeed = ModifyStatByNature(GetMonNature(pokemon), (u16)newSpeed, STAT_SPEED);
    SetMonData(pokemon, MON_DATA_SPEED, &newSpeed);

    newSpatk = (baseStats->spatk * 2 + spatkIv + spatkEv / 4) * level / 100 + 5;
    newSpatk = ModifyStatByNature(GetMonNature(pokemon), (u16)newSpatk, STAT_SPATK);
    SetMonData(pokemon, MON_DATA_SPATK, &newSpatk);

    newSpdef = (baseStats->spdef * 2 + spdefIv + spdefEv / 4) * level / 100 + 5;
    newSpdef = ModifyStatByNature(GetMonNature(pokemon), (u16)newSpdef, STAT_SPDEF);
    SetMonData(pokemon, MON_DATA_SPDEF, &newSpdef);

    FreeToHeap(baseStats);

    if (hp != 0 || maxHp == 0) {
        if (species == SPECIES_SHEDINJA) {
            hp = 1;
        } else if (hp == 0) {
            hp = newMaxHp;
        } else if (newMaxHp - maxHp < 0) {
            if (hp > newMaxHp) {
                hp = newMaxHp;
            }
        } else {
            hp += newMaxHp - maxHp;
        }
    }
    if (hp != 0) {
        SetMonData(pokemon, MON_DATA_HP, &hp);
    }
    ReleaseMonLock(pokemon, decry);
}

u32 GetMonData(POKEMON * pokemon, int attr, void * dest) {
    u32 ret;
    u32 checksum;
    if (!pokemon->box.party_lock) {
        DECRYPT_PTY(pokemon);
        DECRYPT_BOX(&pokemon->box);
        checksum = CHECKSUM(&pokemon->box);
        if (checksum != pokemon->box.checksum) {
            GF_ASSERT(checksum == pokemon->box.checksum);
            pokemon->box.checksum_fail = TRUE;
        }
    }
    ret = GetMonDataInternal(pokemon, attr, dest);
    if (!pokemon->box.party_lock) {
        ENCRYPT_PTY(pokemon);
        ENCRYPT_BOX(&pokemon->box);
    }
    return ret;
}

u32 GetMonDataInternal(POKEMON * pokemon, int attr, void * dest) {
    switch (attr) {
    case MON_DATA_STATUS:
        return pokemon->party.status;
    case MON_DATA_LEVEL:
        return pokemon->party.level;
    case MON_DATA_CAPSULE:
        return pokemon->party.capsule;
    case MON_DATA_HP:
        return pokemon->party.hp;
    case MON_DATA_MAXHP:
        return pokemon->party.maxHp;
    case MON_DATA_ATK:
        return pokemon->party.atk;
    case MON_DATA_DEF:
        return pokemon->party.def;
    case MON_DATA_SPEED:
        return pokemon->party.speed;
    case MON_DATA_SPATK:
        return pokemon->party.spatk;
    case MON_DATA_SPDEF:
        return pokemon->party.spdef;
    case MON_DATA_MAIL_STRUCT:
        Mail_copy(&pokemon->party.mail, dest);
        return 1;
    case MON_DATA_SEAL_COORDS:
        CopyCapsule(&pokemon->party.sealCoords, dest);
        return 1;
    default:
        return GetBoxMonDataInternal(&pokemon->box, attr, dest);
    }
}

u32 GetBoxMonData(BOXMON * boxmon, int attr, void * dest) {
    u32 ret;
    u32 checksum;
    if (!boxmon->box_lock) {
        DECRYPT_BOX(boxmon);
        checksum = CHECKSUM(boxmon);
        if (checksum != boxmon->checksum) {
            GF_ASSERT(checksum == boxmon->checksum);
            boxmon->checksum_fail = TRUE;
        }
    }
    ret = GetBoxMonDataInternal(boxmon, attr, dest);
    if (!boxmon->box_lock) {
        ENCRYPT_BOX(boxmon);
    }
    return ret;
}

u32 GetBoxMonDataInternal(BOXMON * boxmon, int attr, void * dest) {
    u32 ret = 0;
    PokemonDataBlockA * blockA = &GetSubstruct(boxmon, boxmon->pid, 0)->blockA;
    PokemonDataBlockB * blockB = &GetSubstruct(boxmon, boxmon->pid, 1)->blockB;
    PokemonDataBlockC * blockC = &GetSubstruct(boxmon, boxmon->pid, 2)->blockC;
    PokemonDataBlockD * blockD = &GetSubstruct(boxmon, boxmon->pid, 3)->blockD;

    switch (attr) {
    default:
        ret = 0;
        break;
    case MON_DATA_PERSONALITY:
        ret = boxmon->pid;
        break;
    case MON_DATA_PARTY_LOCK:
        ret = boxmon->party_lock;
        break;
    case MON_DATA_BOX_LOCK:
        ret = boxmon->box_lock;
        break;
    case MON_DATA_CHECKSUM_FAILED:
        ret = boxmon->checksum_fail;
        break;
    case MON_DATA_CHECKSUM:
        ret = boxmon->checksum;
        break;
    case MON_DATA_SPECIES_EXISTS:
        if (blockA->species != SPECIES_NONE) {
            ret = TRUE;
        } else {
            ret = FALSE;
        }
        break;
    case MON_DATA_SANITY_IS_EGG:
        ret = boxmon->checksum_fail;
        if (!ret) {
            ret = blockB->isEgg;
        }
        break;
    case MON_DATA_SPECIES2:
        ret = blockA->species;
        if (ret != SPECIES_NONE && (blockB->isEgg || boxmon->checksum_fail)) {
            ret = SPECIES_EGG;
        }
        break;
    case MON_DATA_LEVEL:
        ret = (u32)CalcLevelBySpeciesAndExp(blockA->species, blockA->exp);
        break;
    case MON_DATA_SPECIES:
        if (boxmon->checksum_fail) {
            ret = SPECIES_EGG;
        } else {
            ret = blockA->species;
        }
        break;
    case MON_DATA_HELD_ITEM:
        ret = blockA->heldItem;
        break;
    case MON_DATA_OTID:
        ret = blockA->otID;
        break;
    case MON_DATA_EXPERIENCE:
        ret = blockA->exp;
        break;
    case MON_DATA_FRIENDSHIP:
        ret = blockA->friendship;
        break;
    case MON_DATA_ABILITY:
        ret = blockA->ability;
        break;
    case MON_DATA_MARKINGS:
        ret = blockA->markings;
        break;
    case MON_DATA_GAME_LANGUAGE:
        ret = blockA->originLanguage;
        break;
    case MON_DATA_HP_EV:
        ret = blockA->hpEV;
        break;
    case MON_DATA_ATK_EV:
        ret = blockA->atkEV;
        break;
    case MON_DATA_DEF_EV:
        ret = blockA->defEV;
        break;
    case MON_DATA_SPEED_EV:
        ret = blockA->spdEV;
        break;
    case MON_DATA_SPATK_EV:
        ret = blockA->spatkEV;
        break;
    case MON_DATA_SPDEF_EV:
        ret = blockA->spdefEV;
        break;
    case MON_DATA_COOL:
        ret = blockA->coolStat;
        break;
    case MON_DATA_BEAUTY:
        ret = blockA->beautyStat;
        break;
    case MON_DATA_CUTE:
        ret = blockA->cuteStat;
        break;
    case MON_DATA_SMART:
        ret = blockA->smartStat;
        break;
    case MON_DATA_TOUGH:
        ret = blockA->toughStat;
        break;
    case MON_DATA_SHEEN:
        ret = blockA->sheen;
        break;
    case MON_DATA_SINNOH_CHAMP_RIBBON:
    case MON_DATA_ABILITY_RIBBON:
    case MON_DATA_GREAT_ABILITY_RIBBON:
    case MON_DATA_DOUBLE_ABILITY_RIBBON:
    case MON_DATA_MULTI_ABILITY_RIBBON:
    case MON_DATA_PAIR_ABILITY_RIBBON:
    case MON_DATA_WORLD_ABILITY_RIBBON:
    case MON_DATA_ALERT_RIBBON:
    case MON_DATA_SHOCK_RIBBON:
    case MON_DATA_DOWNCAST_RIBBON:
    case MON_DATA_CARELESS_RIBBON:
    case MON_DATA_RELAX_RIBBON:
    case MON_DATA_SNOOZE_RIBBON:
    case MON_DATA_SMILE_RIBBON:
    case MON_DATA_GORGEOUS_RIBBON:
    case MON_DATA_ROYAL_RIBBON:
    case MON_DATA_GORGEOUS_ROYAL_RIBBON:
    case MON_DATA_FOOTPRINT_RIBBON:
    case MON_DATA_RECORD_RIBBON:
    case MON_DATA_HISTORY_RIBBON:
    case MON_DATA_LEGEND_RIBBON:
    case MON_DATA_RED_RIBBON:
    case MON_DATA_GREEN_RIBBON:
    case MON_DATA_BLUE_RIBBON:
    case MON_DATA_FESTIVAL_RIBBON:
    case MON_DATA_CARNIVAL_RIBBON:
    case MON_DATA_CLASSIC_RIBBON:
    case MON_DATA_PREMIER_RIBBON:
    case MON_DATA_SINNOH_RIBBON_53: {
        if (blockA->sinnohRibbons & (1ll << (attr - MON_DATA_SINNOH_CHAMP_RIBBON))) {
            ret = TRUE;
        } else {
            ret = FALSE;
        }
    }
        break;
    case MON_DATA_MOVE1:
    case MON_DATA_MOVE2:
    case MON_DATA_MOVE3:
    case MON_DATA_MOVE4:
        ret = blockB->moves[attr - MON_DATA_MOVE1];
        break;
    case MON_DATA_MOVE1PP:
    case MON_DATA_MOVE2PP:
    case MON_DATA_MOVE3PP:
    case MON_DATA_MOVE4PP:
        ret = blockB->movePP[attr - MON_DATA_MOVE1PP];
        break;
    case MON_DATA_MOVE1PPUP:
    case MON_DATA_MOVE2PPUP:
    case MON_DATA_MOVE3PPUP:
    case MON_DATA_MOVE4PPUP:
        ret = blockB->movePpUps[attr - MON_DATA_MOVE1PPUP];
        break;
    case MON_DATA_MOVE1MAXPP:
    case MON_DATA_MOVE2MAXPP:
    case MON_DATA_MOVE3MAXPP:
    case MON_DATA_MOVE4MAXPP:
        ret = (u32)WazaGetMaxPp(blockB->moves[attr - MON_DATA_MOVE1MAXPP], blockB->movePpUps[attr - MON_DATA_MOVE1MAXPP]);
        break;
    case MON_DATA_HP_IV:
        ret = blockB->hpIV;
        break;
    case MON_DATA_ATK_IV:
        ret = blockB->atkIV;
        break;
    case MON_DATA_DEF_IV:
        ret = blockB->defIV;
        break;
    case MON_DATA_SPEED_IV:
        ret = blockB->spdIV;
        break;
    case MON_DATA_SPATK_IV:
        ret = blockB->spatkIV;
        break;
    case MON_DATA_SPDEF_IV:
        ret = blockB->spdefIV;
        break;
    case MON_DATA_IS_EGG:
        ret = boxmon->checksum_fail;
        if (!ret) {
            ret = blockB->isEgg;
        }
        break;
    case MON_DATA_HAS_NICKNAME:
        ret = blockB->isNicknamed;
        break;
    case MON_DATA_HOENN_COOL_RIBBON:
    case MON_DATA_HOENN_COOL_RIBBON_SUPER:
    case MON_DATA_HOENN_COOL_RIBBON_HYPER:
    case MON_DATA_HOENN_COOL_RIBBON_MASTER:
    case MON_DATA_HOENN_BEAUTY_RIBBON:
    case MON_DATA_HOENN_BEAUTY_RIBBON_SUPER:
    case MON_DATA_HOENN_BEAUTY_RIBBON_HYPER:
    case MON_DATA_HOENN_BEAUTY_RIBBON_MASTER:
    case MON_DATA_HOENN_CUTE_RIBBON:
    case MON_DATA_HOENN_CUTE_RIBBON_SUPER:
    case MON_DATA_HOENN_CUTE_RIBBON_HYPER:
    case MON_DATA_HOENN_CUTE_RIBBON_MASTER:
    case MON_DATA_HOENN_SMART_RIBBON:
    case MON_DATA_HOENN_SMART_RIBBON_SUPER:
    case MON_DATA_HOENN_SMART_RIBBON_HYPER:
    case MON_DATA_HOENN_SMART_RIBBON_MASTER:
    case MON_DATA_HOENN_TOUGH_RIBBON:
    case MON_DATA_HOENN_TOUGH_RIBBON_SUPER:
    case MON_DATA_HOENN_TOUGH_RIBBON_HYPER:
    case MON_DATA_HOENN_TOUGH_RIBBON_MASTER:
    case MON_DATA_HOENN_CHAMPION_RIBBON:
    case MON_DATA_HOENN_WINNING_RIBBON:
    case MON_DATA_HOENN_VICTORY_RIBBON:
    case MON_DATA_HOENN_ARTIST_RIBBON:
    case MON_DATA_HOENN_EFFORT_RIBBON:
    case MON_DATA_HOENN_MARINE_RIBBON:
    case MON_DATA_HOENN_LAND_RIBBON:
    case MON_DATA_HOENN_SKY_RIBBON:
    case MON_DATA_HOENN_COUNTRY_RIBBON:
    case MON_DATA_HOENN_NATIONAL_RIBBON:
    case MON_DATA_HOENN_EARTH_RIBBON:
    case MON_DATA_HOENN_WORLD_RIBBON:
        if (blockB->ribbonFlags & (1ll << (attr - MON_DATA_HOENN_COOL_RIBBON))) {
            ret = TRUE;
        } else {
            ret = FALSE;
        }
        break;
    case MON_DATA_FATEFUL_ENCOUNTER:
        ret = blockB->fatefulEncounter;
        break;
    case MON_DATA_GENDER:
        ret = GetGenderBySpeciesAndPersonality(blockA->species, boxmon->pid);
        blockB->gender = (u8)ret;
        boxmon->checksum =  CHECKSUM(boxmon);
        break;
    case MON_DATA_FORME:
        ret = blockB->alternateForm;
        break;
    case MON_DATA_RESERVED_113:
        ret = blockB->unk_19_6;
        break;
    case MON_DATA_RESERVED_114:
        ret = blockB->Unused;
        break;
    case MON_DATA_NICKNAME:
        if (boxmon->checksum_fail) {
            GetSpeciesNameIntoArray(SPECIES_MANAPHY_EGG, 0, dest);
        } else {
            u16 * dest16 = (u16 *)dest;
            for (ret = 0; ret < POKEMON_NAME_LENGTH; ret++) {
                dest16[ret] = blockC->nickname[ret];
            }
            dest16[ret] = EOS;
        }
        break;
    case MON_DATA_NICKNAME_4:
        ret = blockB->isNicknamed;
        // fallthrough
    case MON_DATA_NICKNAME_3:
        if (boxmon->checksum_fail) {
            STRING * buffer = GetSpeciesName(SPECIES_MANAPHY_EGG, 0);
            StringCopy(dest, buffer);
            String_dtor(buffer);
        } else {
            CopyU16ArrayToString(dest, blockC->nickname);
        }
        break;
    case MON_DATA_UNK_120:
        ret = blockC->Unused;
        break;
    case MON_DATA_GAME_VERSION:
        ret = blockC->originGame;
        break;
    case MON_DATA_COOL_RIBBON:
    case MON_DATA_COOL_RIBBON_GREAT:
    case MON_DATA_COOL_RIBBON_ULTRA:
    case MON_DATA_COOL_RIBBON_MASTER:
    case MON_DATA_BEAUTY_RIBBON:
    case MON_DATA_BEAUTY_RIBBON_GREAT:
    case MON_DATA_BEAUTY_RIBBON_ULTRA:
    case MON_DATA_BEAUTY_RIBBON_MASTER:
    case MON_DATA_CUTE_RIBBON:
    case MON_DATA_CUTE_RIBBON_GREAT:
    case MON_DATA_CUTE_RIBBON_ULTRA:
    case MON_DATA_CUTE_RIBBON_MASTER:
    case MON_DATA_SMART_RIBBON:
    case MON_DATA_SMART_RIBBON_GREAT:
    case MON_DATA_SMART_RIBBON_ULTRA:
    case MON_DATA_SMART_RIBBON_MASTER:
    case MON_DATA_TOUGH_RIBBON:
    case MON_DATA_TOUGH_RIBBON_GREAT:
    case MON_DATA_TOUGH_RIBBON_ULTRA:
    case MON_DATA_TOUGH_RIBBON_MASTER:
    case MON_DATA_SINNOH_RIBBON_142:
        if (blockC->sinnohRibbons2 & (1ll << (attr - MON_DATA_COOL_RIBBON))) {
            ret = TRUE;
        } else {
            ret = FALSE;
        }
        break;
    case MON_DATA_OT_NAME: {
        u16 * dest16 = (u16 *)dest;
        for (ret = 0; ret < OT_NAME_LENGTH; ret++) {
            dest16[ret] = blockD->otTrainerName[ret];
        }
        dest16[ret] = EOS;
    }
        break;
    case MON_DATA_OT_NAME_2:
        CopyU16ArrayToString(dest, blockD->otTrainerName);
        break;
    case MON_DATA_EGG_MET_YEAR:
        ret = blockD->dateEggReceived[0];
        break;
    case MON_DATA_EGG_MET_MONTH:
        ret = blockD->dateEggReceived[1];
        break;
    case MON_DATA_EGG_MET_DAY:
        ret = blockD->dateEggReceived[2];
        break;
    case MON_DATA_MET_YEAR:
        ret = blockD->dateMet[0];
        break;
    case MON_DATA_MET_MONTH:
        ret = blockD->dateMet[1];
        break;
    case MON_DATA_MET_DAY:
        ret = blockD->dateMet[2];
        break;
    case MON_DATA_EGG_MET_LOCATION:
    case MON_DATA_HGSS_EGG_MET_LOCATION:
        if (blockD->DP_EggLocation != METLOC_FARAWAY_PLACE || (ret = blockB->Platinum_EggLocation) == 0) {
            ret = blockD->DP_EggLocation;
        }
        break;
    case MON_DATA_MET_LOCATION:
    case MON_DATA_HGSS_MET_LOCATION:
        if (blockD->DP_MetLocation != METLOC_FARAWAY_PLACE || (ret = blockB->Platinum_MetLocation) == 0) {
            ret = blockD->DP_MetLocation;
        }
        break;
    case MON_DATA_POKERUS:
        ret = blockD->pokerus;
        break;
    case MON_DATA_POKEBALL:
        if (!(blockC->originGame == VERSION_HEARTGOLD || blockC->originGame == VERSION_SOULSILVER) || (ret = blockD->HGSS_Pokeball) == 0) {
            ret = blockD->pokeball;
        }
        break;
    case MON_DATA_DP_POKEBALL:
        ret = blockD->pokeball;
        break;
    case MON_DATA_MET_LEVEL:
        ret = blockD->metLevel;
        break;
    case MON_DATA_MET_GENDER:
        ret = blockD->metGender;
        break;
    case MON_DATA_ENCOUNTER_TYPE:
        ret = blockD->encounterType;
        break;
    case MON_DATA_IVS_WORD:
        ret = (blockB->hpIV) | \
                 (blockB->atkIV << 5) | \
                 (blockB->defIV << 10) | \
                 (blockB->spdIV << 15) | \
                 (blockB->spatkIV << 20) | \
                 (blockB->spdefIV << 25);
        break;
    case MON_DATA_UNK_175:
        if ((blockA->species == SPECIES_NIDORAN_F || blockA->species == SPECIES_NIDORAN_M) && !blockB->isNicknamed) {
            ret = FALSE;
        } else {
            ret = TRUE;
        }
        break;
    case MON_DATA_TYPE_1:
    case MON_DATA_TYPE_2:
        if (blockA->species == SPECIES_ARCEUS && blockA->ability == ABILITY_MULTITYPE) {
            ret = (u32)GetArceusTypeByHeldItemEffect((u16) GetItemAttr(blockA->heldItem, ITEMATTR_HOLD_EFFECT, 0));
        } else {
            ret = (u32)GetMonBaseStat_HandleAlternateForme(blockA->species, blockB->alternateForm, (enum BaseStat)(attr - MON_DATA_TYPE_1 + BASE_TYPE1));
        }
        break;
    case MON_DATA_SPECIES_NAME:
        GetSpeciesNameIntoArray(blockA->species, 0, dest);
        break;
    case MON_DATA_SHINY_LEAF_A:
    case MON_DATA_SHINY_LEAF_B:
    case MON_DATA_SHINY_LEAF_C:
    case MON_DATA_SHINY_LEAF_D:
    case MON_DATA_SHINY_LEAF_E:
    case MON_DATA_SHINY_LEAF_CROWN:
        ret = (blockB->HGSS_shinyLeaves >> (attr - MON_DATA_SHINY_LEAF_A)) & 1;
        break;
    case MON_DATA_187:
        ret = blockD->unk_1F;
        break;
    }
    return ret;
}

void SetMonData(POKEMON * pokemon, int attr, void * value) {
    u32 checksum;
    if (!pokemon->box.party_lock) {
        DECRYPT_PTY(pokemon);
        DECRYPT_BOX(&pokemon->box);
        checksum = CHECKSUM(&pokemon->box);
        if (checksum != pokemon->box.checksum) {
            GF_ASSERT(checksum == pokemon->box.checksum);
            pokemon->box.checksum_fail = TRUE;
            ENCRYPT_BOX(&pokemon->box);
            return;
        }
    }
    SetMonDataInternal(pokemon, attr, value);
    if (!pokemon->box.party_lock) {
        ENCRYPT_PTY(pokemon);
        pokemon->box.checksum = CHECKSUM(&pokemon->box);
        ENCRYPT_BOX(&pokemon->box);
    }
}

void SetMonDataInternal(POKEMON * pokemon, int attr, const void * value) {
#define VALUE(type) (*(const type *)value)
    switch (attr) {
    case MON_DATA_STATUS:
        pokemon->party.status = VALUE(u32);
        break;
    case MON_DATA_LEVEL:
        pokemon->party.level = VALUE(u8);
        break;
    case MON_DATA_CAPSULE:
        pokemon->party.capsule = VALUE(u8);
        break;
    case MON_DATA_HP:
        pokemon->party.hp = VALUE(u16);
        break;
    case MON_DATA_MAXHP:
        pokemon->party.maxHp = VALUE(u16);
        break;
    case MON_DATA_ATK:
        pokemon->party.atk = VALUE(u16);
        break;
    case MON_DATA_DEF:
        pokemon->party.def = VALUE(u16);
        break;
    case MON_DATA_SPEED:
        pokemon->party.speed = VALUE(u16);
        break;
    case MON_DATA_SPATK:
        pokemon->party.spatk = VALUE(u16);
        break;
    case MON_DATA_SPDEF:
        pokemon->party.spdef = VALUE(u16);
        break;
    case MON_DATA_MAIL_STRUCT:
        Mail_copy((const MAIL *)value, &pokemon->party.mail);
        break;
    case MON_DATA_SEAL_COORDS:
        CopyCapsule((const CAPSULE *)value, &pokemon->party.sealCoords);
        break;
    default:
        SetBoxMonDataInternal(&pokemon->box, attr, value);
        break;
    }
#undef VALUE
}

void SetBoxMonData(BOXMON * boxmon, int attr, void * value) {
    u32 checksum;
    if (!boxmon->box_lock) {
        DECRYPT_BOX(boxmon);
        checksum = CHECKSUM(boxmon);
        if (checksum != boxmon->checksum) {
            GF_ASSERT(checksum == boxmon->checksum);
            boxmon->checksum_fail = TRUE;
            ENCRYPT_BOX(boxmon);
            return;
        }
    }
    SetBoxMonDataInternal(boxmon, attr, value);
    if (!boxmon->box_lock) {
        boxmon->checksum = CHECKSUM(boxmon);
        ENCRYPT_BOX(boxmon);
    }
}


void SetBoxMonDataInternal(BOXMON * boxmon, int attr, const void * value) {
#define VALUE(type) (*(const type *)value)
    u8 flag;
    u64 mask;
    u32 i;
    u16 namebuf[POKEMON_NAME_LENGTH + 1];
    u16 namebuf2[POKEMON_NAME_LENGTH + 1];
    u16 namebuf3[POKEMON_NAME_LENGTH + 1];
    STRING * speciesName;

    PokemonDataBlockA *blockA = &GetSubstruct(boxmon, boxmon->pid, 0)->blockA;
    PokemonDataBlockB *blockB = &GetSubstruct(boxmon, boxmon->pid, 1)->blockB;
    PokemonDataBlockC *blockC = &GetSubstruct(boxmon, boxmon->pid, 2)->blockC;
    PokemonDataBlockD *blockD = &GetSubstruct(boxmon, boxmon->pid, 3)->blockD;

    switch (attr) {
    case MON_DATA_PERSONALITY:
        boxmon->pid = VALUE(u32);
        break;
    case MON_DATA_PARTY_LOCK:
        GF_ASSERT(0);
        boxmon->party_lock = VALUE(u8);
        break;
    case MON_DATA_BOX_LOCK:
        GF_ASSERT(0);
        boxmon->box_lock = VALUE(u8);
        break;
    case MON_DATA_CHECKSUM_FAILED:
        boxmon->checksum_fail = VALUE(u8);
        break;
    case MON_DATA_CHECKSUM:
        boxmon->checksum = VALUE(u16);
        break;
    case MON_DATA_SPECIES:
        blockA->species = VALUE(u16);
        break;
    case MON_DATA_HELD_ITEM:
        blockA->heldItem = VALUE(u16);
        break;
    case MON_DATA_OTID:
        blockA->otID = VALUE(u32);
        break;
    case MON_DATA_EXPERIENCE:
        blockA->exp = VALUE(u32);
        break;
    case MON_DATA_FRIENDSHIP:
        blockA->friendship = VALUE(u8);
        break;
    case MON_DATA_ABILITY:
        blockA->ability = VALUE(u8);
        break;
    case MON_DATA_MARKINGS:
        blockA->markings = VALUE(u8);
        break;
    case MON_DATA_GAME_LANGUAGE:
        blockA->originLanguage = VALUE(u8);
        break;
    case MON_DATA_HP_EV:
        blockA->hpEV = VALUE(u8);
        break;
    case MON_DATA_ATK_EV:
        blockA->atkEV = VALUE(u8);
        break;
    case MON_DATA_DEF_EV:
        blockA->defEV = VALUE(u8);
        break;
    case MON_DATA_SPEED_EV:
        blockA->spdEV = VALUE(u8);
        break;
    case MON_DATA_SPATK_EV:
        blockA->spatkEV = VALUE(u8);
        break;
    case MON_DATA_SPDEF_EV:
        blockA->spdefEV = VALUE(u8);
        break;
    case MON_DATA_COOL:
        blockA->coolStat = VALUE(u8);
        break;
    case MON_DATA_BEAUTY:
        blockA->beautyStat = VALUE(u8);
        break;
    case MON_DATA_CUTE:
        blockA->cuteStat = VALUE(u8);
        break;
    case MON_DATA_SMART:
        blockA->smartStat = VALUE(u8);
        break;
    case MON_DATA_TOUGH:
        blockA->toughStat = VALUE(u8);
        break;
    case MON_DATA_SHEEN:
        blockA->sheen = VALUE(u8);
        break;
    case MON_DATA_SINNOH_CHAMP_RIBBON:
    case MON_DATA_ABILITY_RIBBON:
    case MON_DATA_GREAT_ABILITY_RIBBON:
    case MON_DATA_DOUBLE_ABILITY_RIBBON:
    case MON_DATA_MULTI_ABILITY_RIBBON:
    case MON_DATA_PAIR_ABILITY_RIBBON:
    case MON_DATA_WORLD_ABILITY_RIBBON:
    case MON_DATA_ALERT_RIBBON:
    case MON_DATA_SHOCK_RIBBON:
    case MON_DATA_DOWNCAST_RIBBON:
    case MON_DATA_CARELESS_RIBBON:
    case MON_DATA_RELAX_RIBBON:
    case MON_DATA_SNOOZE_RIBBON:
    case MON_DATA_SMILE_RIBBON:
    case MON_DATA_GORGEOUS_RIBBON:
    case MON_DATA_ROYAL_RIBBON:
    case MON_DATA_GORGEOUS_ROYAL_RIBBON:
    case MON_DATA_FOOTPRINT_RIBBON:
    case MON_DATA_RECORD_RIBBON:
    case MON_DATA_HISTORY_RIBBON:
    case MON_DATA_LEGEND_RIBBON:
    case MON_DATA_RED_RIBBON:
    case MON_DATA_GREEN_RIBBON:
    case MON_DATA_BLUE_RIBBON:
    case MON_DATA_FESTIVAL_RIBBON:
    case MON_DATA_CARNIVAL_RIBBON:
    case MON_DATA_CLASSIC_RIBBON:
    case MON_DATA_PREMIER_RIBBON:
    case MON_DATA_SINNOH_RIBBON_53:
        mask = 1 << (attr - MON_DATA_SINNOH_CHAMP_RIBBON);
        if (VALUE(u8)) {
            blockA->sinnohRibbons |= mask;
        } else {
            blockA->sinnohRibbons &= mask ^ 0xFFFFFFFF;
        }
        break;
    case MON_DATA_MOVE1:
    case MON_DATA_MOVE2:
    case MON_DATA_MOVE3:
    case MON_DATA_MOVE4:
        blockB->moves[attr - MON_DATA_MOVE1] = VALUE(u16);
        break;
    case MON_DATA_MOVE1PP:
    case MON_DATA_MOVE2PP:
    case MON_DATA_MOVE3PP:
    case MON_DATA_MOVE4PP:
        blockB->movePP[attr - MON_DATA_MOVE1PP] = VALUE(u8);
        break;
    case MON_DATA_MOVE1PPUP:
    case MON_DATA_MOVE2PPUP:
    case MON_DATA_MOVE3PPUP:
    case MON_DATA_MOVE4PPUP:
        blockB->movePpUps[attr - MON_DATA_MOVE1PPUP] = VALUE(u8);
        break;
    case MON_DATA_HP_IV:
        blockB->hpIV = VALUE(u8);
        break;
    case MON_DATA_ATK_IV:
        blockB->atkIV = VALUE(u8);
        break;
    case MON_DATA_DEF_IV:
        blockB->defIV = VALUE(u8);
        break;
    case MON_DATA_SPEED_IV:
        blockB->spdIV = VALUE(u8);
        break;
    case MON_DATA_SPATK_IV:
        blockB->spatkIV = VALUE(u8);
        break;
    case MON_DATA_SPDEF_IV:
        blockB->spdefIV = VALUE(u8);
        break;
    case MON_DATA_IS_EGG:
        blockB->isEgg = VALUE(u8);
        break;
    case MON_DATA_HAS_NICKNAME:
        blockB->isNicknamed = VALUE(u8);
        break;
    case MON_DATA_HOENN_COOL_RIBBON:
    case MON_DATA_HOENN_COOL_RIBBON_SUPER:
    case MON_DATA_HOENN_COOL_RIBBON_HYPER:
    case MON_DATA_HOENN_COOL_RIBBON_MASTER:
    case MON_DATA_HOENN_BEAUTY_RIBBON:
    case MON_DATA_HOENN_BEAUTY_RIBBON_SUPER:
    case MON_DATA_HOENN_BEAUTY_RIBBON_HYPER:
    case MON_DATA_HOENN_BEAUTY_RIBBON_MASTER:
    case MON_DATA_HOENN_CUTE_RIBBON:
    case MON_DATA_HOENN_CUTE_RIBBON_SUPER:
    case MON_DATA_HOENN_CUTE_RIBBON_HYPER:
    case MON_DATA_HOENN_CUTE_RIBBON_MASTER:
    case MON_DATA_HOENN_SMART_RIBBON:
    case MON_DATA_HOENN_SMART_RIBBON_SUPER:
    case MON_DATA_HOENN_SMART_RIBBON_HYPER:
    case MON_DATA_HOENN_SMART_RIBBON_MASTER:
    case MON_DATA_HOENN_TOUGH_RIBBON:
    case MON_DATA_HOENN_TOUGH_RIBBON_SUPER:
    case MON_DATA_HOENN_TOUGH_RIBBON_HYPER:
    case MON_DATA_HOENN_TOUGH_RIBBON_MASTER:
    case MON_DATA_HOENN_CHAMPION_RIBBON:
    case MON_DATA_HOENN_WINNING_RIBBON:
    case MON_DATA_HOENN_VICTORY_RIBBON:
    case MON_DATA_HOENN_ARTIST_RIBBON:
    case MON_DATA_HOENN_EFFORT_RIBBON:
    case MON_DATA_HOENN_MARINE_RIBBON:
    case MON_DATA_HOENN_LAND_RIBBON:
    case MON_DATA_HOENN_SKY_RIBBON:
    case MON_DATA_HOENN_COUNTRY_RIBBON:
    case MON_DATA_HOENN_NATIONAL_RIBBON:
    case MON_DATA_HOENN_EARTH_RIBBON:
    case MON_DATA_HOENN_WORLD_RIBBON:
        mask = 1 << (attr - MON_DATA_HOENN_COOL_RIBBON);
        if (VALUE(u8)) {
            blockB->ribbonFlags |= mask;
        } else {
            blockB->ribbonFlags &= mask ^ 0xFFFFFFFF;
        }
        break;
    case MON_DATA_FATEFUL_ENCOUNTER:
        blockB->fatefulEncounter = VALUE(u8);
        break;
    case MON_DATA_GENDER:
        blockB->gender = GetGenderBySpeciesAndPersonality(blockA->species, boxmon->pid);
        break;
    case MON_DATA_FORME:
        blockB->alternateForm = VALUE(u8);
        break;
    case MON_DATA_RESERVED_113:
        blockB->unk_19_6 = VALUE(u8);
        break;
    case MON_DATA_RESERVED_114:
        blockB->Unused = VALUE(u16);
        break;
    case MON_DATA_NICKNAME_2:
        GetSpeciesNameIntoArray(blockA->species, 0, namebuf);
        blockB->isNicknamed = StringNotEqual(namebuf, value);
        // fallthrough
    case MON_DATA_NICKNAME:
        for (i = 0; i < POKEMON_NAME_LENGTH + 1; i++) {
            blockC->nickname[i] = VALUE(u16); value = (void *const )((char *)value + 2);
        }
        break;
    case MON_DATA_NICKNAME_4:
        GetSpeciesNameIntoArray(blockA->species, 0, namebuf2);
        CopyStringToU16Array(value, namebuf3, POKEMON_NAME_LENGTH + 1);
        blockB->isNicknamed = StringNotEqual(namebuf2, namebuf3);
        // fallthrough
    case MON_DATA_NICKNAME_3:
        CopyStringToU16Array(value, blockC->nickname, POKEMON_NAME_LENGTH + 1);
        break;
    case MON_DATA_UNK_120:
        blockC->Unused = VALUE(u8);
        break;
    case MON_DATA_GAME_VERSION:
        blockC->originGame = VALUE(u8);
        break;
    case MON_DATA_COOL_RIBBON:
    case MON_DATA_COOL_RIBBON_GREAT:
    case MON_DATA_COOL_RIBBON_ULTRA:
    case MON_DATA_COOL_RIBBON_MASTER:
    case MON_DATA_BEAUTY_RIBBON:
    case MON_DATA_BEAUTY_RIBBON_GREAT:
    case MON_DATA_BEAUTY_RIBBON_ULTRA:
    case MON_DATA_BEAUTY_RIBBON_MASTER:
    case MON_DATA_CUTE_RIBBON:
    case MON_DATA_CUTE_RIBBON_GREAT:
    case MON_DATA_CUTE_RIBBON_ULTRA:
    case MON_DATA_CUTE_RIBBON_MASTER:
    case MON_DATA_SMART_RIBBON:
    case MON_DATA_SMART_RIBBON_GREAT:
    case MON_DATA_SMART_RIBBON_ULTRA:
    case MON_DATA_SMART_RIBBON_MASTER:
    case MON_DATA_TOUGH_RIBBON:
    case MON_DATA_TOUGH_RIBBON_GREAT:
    case MON_DATA_TOUGH_RIBBON_ULTRA:
    case MON_DATA_TOUGH_RIBBON_MASTER:
    case MON_DATA_SINNOH_RIBBON_142:
        mask = 1 << (attr - MON_DATA_COOL_RIBBON);
        if (VALUE(u8)) {
            blockC->sinnohRibbons2 |= mask;
        } else {
            blockC->sinnohRibbons2 &= mask ^ 0xFFFFFFFFFFFFFFFF;
        }
        break;
    case MON_DATA_OT_NAME:
        for (i = 0; i < OT_NAME_LENGTH + 1; i++) {
            blockD->otTrainerName[i] = VALUE(u16); value = (void *)((char *)value + 2);
        }
        break;
    case MON_DATA_OT_NAME_2:
        CopyStringToU16Array(value, blockD->otTrainerName, OT_NAME_LENGTH + 1);
        break;
    case MON_DATA_EGG_MET_YEAR:
        blockD->dateEggReceived[0] = VALUE(u8);
        break;
    case MON_DATA_EGG_MET_MONTH:
        blockD->dateEggReceived[1] = VALUE(u8);
        break;
    case MON_DATA_EGG_MET_DAY:
        blockD->dateEggReceived[2] = VALUE(u8);
        break;
    case MON_DATA_MET_YEAR:
        blockD->dateMet[0] = VALUE(u8);
        break;
    case MON_DATA_MET_MONTH:
        blockD->dateMet[1] = VALUE(u8);
        break;
    case MON_DATA_MET_DAY:
        blockD->dateMet[2] = VALUE(u8);
        break;
    case MON_DATA_EGG_MET_LOCATION:
    case MON_DATA_HGSS_EGG_MET_LOCATION:
        if (VALUE(u16) == MAPSEC_MYSTERY_ZONE || LocationIsDiamondPearlCompatible(VALUE(u16)) == TRUE) {
            blockD->DP_EggLocation = VALUE(u16);
            blockB->Platinum_EggLocation = VALUE(u16);
        } else {
            blockD->DP_EggLocation = METLOC_FARAWAY_PLACE;
            blockB->Platinum_EggLocation = VALUE(u16);
        }
        break;
    case MON_DATA_MET_LOCATION:
    case MON_DATA_HGSS_MET_LOCATION:
        if (VALUE(u16) == MAPSEC_MYSTERY_ZONE || LocationIsDiamondPearlCompatible(VALUE(u16)) == TRUE) {
            blockD->DP_MetLocation = VALUE(u16);
            blockB->Platinum_MetLocation = VALUE(u16);
        } else {
            blockD->DP_MetLocation = METLOC_FARAWAY_PLACE;
            blockB->Platinum_MetLocation = VALUE(u16);
        }
        break;
    case MON_DATA_POKERUS:
        blockD->pokerus = VALUE(u8);
        break;
    case MON_DATA_POKEBALL:
        if (VALUE(u16) >= ITEM_MASTER_BALL && VALUE(u16) <= ITEM_CHERISH_BALL) {
            blockD->HGSS_Pokeball = VALUE(u16);
            blockD->pokeball = VALUE(u16);
        } else if (VALUE(u16) >= ITEM_FAST_BALL && VALUE(u16) <= ITEM_SPORT_BALL) {
            blockD->HGSS_Pokeball = VALUE(u16) - (ITEM_FAST_BALL - BALL_FAST);
            blockD->pokeball = BALL_POKE;
        } else {
            GF_ASSERT(VALUE(u16) != 0);
        }
        break;
    case MON_DATA_MET_LEVEL:
        blockD->metLevel = VALUE(u8);
        break;
    case MON_DATA_MET_GENDER:
        blockD->metGender = VALUE(u8);
        break;
    case MON_DATA_ENCOUNTER_TYPE:
        blockD->encounterType = VALUE(u8);
        break;
    case MON_DATA_IVS_WORD:
        blockB->hpIV    = (VALUE(u32) >>  0) & 0x1F;
        blockB->atkIV   = (VALUE(u32) >>  5) & 0x1F;
        blockB->defIV   = (VALUE(u32) >> 10) & 0x1F;
        blockB->spdIV   = (VALUE(u32) >> 15) & 0x1F;
        blockB->spatkIV = (VALUE(u32) >> 20) & 0x1F;
        blockB->spdefIV = (VALUE(u32) >> 25) & 0x1F;
        break;
    case MON_DATA_SPECIES_NAME:
        speciesName = GetSpeciesName(blockA->species, 0);
        CopyStringToU16Array(speciesName, blockC->nickname, POKEMON_NAME_LENGTH + 1);
        String_dtor(speciesName);
        break;
    case MON_DATA_SHINY_LEAF_A:
    case MON_DATA_SHINY_LEAF_B:
    case MON_DATA_SHINY_LEAF_C:
    case MON_DATA_SHINY_LEAF_D:
    case MON_DATA_SHINY_LEAF_E:
    case MON_DATA_SHINY_LEAF_CROWN:
        if (value == NULL) {
            blockB->HGSS_shinyLeaves |= 1 << (attr - MON_DATA_SHINY_LEAF_A);
        } else if (VALUE(u8) != 0) {
            blockB->HGSS_shinyLeaves |= 1 << (attr - MON_DATA_SHINY_LEAF_A);
        } else {
            blockB->HGSS_shinyLeaves &= (1 << (attr - MON_DATA_SHINY_LEAF_A)) ^ 0x3F;
        }
        break;
    case MON_DATA_187:
        blockD->unk_1F = VALUE(u8);
        break;
    }
#undef VALUE
}

void AddMonData(POKEMON * pokemon, int attr, int value) {
    u32 checksum;
    if (!pokemon->box.party_lock) {
        DECRYPT_PTY(pokemon);
        DECRYPT_BOX(&pokemon->box);
        checksum = CHECKSUM(&pokemon->box);
        if (checksum != pokemon->box.checksum) {
            GF_ASSERT(checksum == pokemon->box.checksum);
            ENCRYPT_BOX(&pokemon->box);
            return;
        }
    }
    AddMonDataInternal(pokemon, attr, value);
    if (!pokemon->box.party_lock) {
        ENCRYPT_PTY(pokemon);
        pokemon->box.checksum = CHECKSUM(&pokemon->box);
        ENCRYPT_BOX(&pokemon->box);
    }
}

void AddMonDataInternal(POKEMON * pokemon, int attr, int value) {
    s32 maxHp;
    switch (attr) {
    case MON_DATA_HP:
        maxHp = pokemon->party.maxHp;
        if ((s32)(pokemon->party.hp + value) > maxHp) {
            pokemon->party.hp = (u16)maxHp;
        } else {
            pokemon->party.hp += value;
        }
        break;
    case MON_DATA_STATUS:
    case MON_DATA_LEVEL:
    case MON_DATA_CAPSULE:
    case MON_DATA_MAXHP:
    case MON_DATA_ATK:
    case MON_DATA_DEF:
    case MON_DATA_SPEED:
    case MON_DATA_SPATK:
    case MON_DATA_SPDEF:
    case MON_DATA_MAIL_STRUCT:
        // case MON_DATA_SEAL_COORDS:
        GF_ASSERT(0);
        break;
    default:
        AddBoxMonDataInternal(&pokemon->box, attr, value);
        break;
    }
}

void AddBoxMonDataInternal(BOXMON * boxmon, int attr, int value) {
    PokemonDataBlockA *blockA = &GetSubstruct(boxmon, boxmon->pid, 0)->blockA;
    PokemonDataBlockB *blockB = &GetSubstruct(boxmon, boxmon->pid, 1)->blockB;
    PokemonDataBlockC *blockC = &GetSubstruct(boxmon, boxmon->pid, 2)->blockC;
    PokemonDataBlockD *blockD = &GetSubstruct(boxmon, boxmon->pid, 3)->blockD;

    switch (attr) {
    case MON_DATA_EXPERIENCE:
        if (blockA->exp + value > GetMonExpBySpeciesAndLevel(blockA->species, 100)) {
            blockA->exp = GetMonExpBySpeciesAndLevel(blockA->species, 100);
        } else {
            blockA->exp += value;
        }
        break;
    case MON_DATA_FRIENDSHIP: {
        int friendship = blockA->friendship;
        if (friendship + value > FRIENDSHIP_MAX) {
            friendship = FRIENDSHIP_MAX;
        }
        friendship += value;
        if (friendship < 0) {
            friendship = 0;
        }
        blockA->friendship = friendship;
    }
        break;
    case MON_DATA_HP_EV:
        blockA->hpEV += value;
        break;
    case MON_DATA_ATK_EV:
        blockA->atkEV += value;
        break;
    case MON_DATA_DEF_EV:
        blockA->defEV += value;
        break;
    case MON_DATA_SPEED_EV:
        blockA->spdEV += value;
        break;
    case MON_DATA_SPATK_EV:
        blockA->spatkEV += value;
        break;
    case MON_DATA_SPDEF_EV:
        blockA->spdefEV += value;
        break;
    case MON_DATA_COOL:
        if (blockA->coolStat + value > 255) {
            blockA->coolStat = 255;
        } else {
            blockA->coolStat += value;
        }
        break;
    case MON_DATA_BEAUTY:
        if (blockA->beautyStat + value > 255) {
            blockA->beautyStat = 255;
        } else {
            blockA->beautyStat += value;
        }
        break;
    case MON_DATA_CUTE:
        if (blockA->cuteStat + value > 255) {
            blockA->cuteStat = 255;
        } else {
            blockA->cuteStat += value;
        }
        break;
    case MON_DATA_SMART:
        if (blockA->smartStat + value > 255) {
            blockA->smartStat = 255;
        } else {
            blockA->smartStat += value;
        }
        break;
    case MON_DATA_TOUGH:
        if (blockA->toughStat + value > 255) {
            blockA->toughStat = 255;
        } else {
            blockA->toughStat += value;
        }
        break;
    case MON_DATA_SHEEN:
        if (blockA->sheen + value > 255) {
            blockA->sheen = 255;
        } else {
            blockA->sheen += value;
        }
        break;
    case MON_DATA_MOVE1PP:
    case MON_DATA_MOVE2PP:
    case MON_DATA_MOVE3PP:
    case MON_DATA_MOVE4PP:
        if (blockB->movePP[attr - MON_DATA_MOVE1PP] + value > WazaGetMaxPp(blockB->moves[attr - MON_DATA_MOVE1PP], blockB->movePpUps[attr - MON_DATA_MOVE1PP])) {
            blockB->movePP[attr - MON_DATA_MOVE1PP] = (u8)WazaGetMaxPp(blockB->moves[attr - MON_DATA_MOVE1PP],
                                                                       blockB->movePpUps[attr - MON_DATA_MOVE1PP]);
        } else {
            blockB->movePP[attr - MON_DATA_MOVE1PP] += value;
        }
        break;
    case MON_DATA_MOVE1PPUP:
    case MON_DATA_MOVE2PPUP:
    case MON_DATA_MOVE3PPUP:
    case MON_DATA_MOVE4PPUP:
        if (blockB->movePpUps[attr - MON_DATA_MOVE1PPUP] + value > 3) {
            blockB->movePpUps[attr - MON_DATA_MOVE1PPUP] = 3;
        } else {
            blockB->movePpUps[attr - MON_DATA_MOVE1PPUP] += value;
        }
        break;
    case MON_DATA_MOVE1MAXPP:
    case MON_DATA_MOVE2MAXPP:
    case MON_DATA_MOVE3MAXPP:
    case MON_DATA_MOVE4MAXPP:
        break;
    case MON_DATA_HP_IV:
        if (blockB->hpIV + value > 31) {
            blockB->hpIV = 31;
        } else {
            blockB->hpIV += value;
        }
        break;
    case MON_DATA_ATK_IV:
        if (blockB->atkIV + value > 31) {
            blockB->atkIV = 31;
        } else {
            blockB->atkIV += value;
        }
        break;
    case MON_DATA_DEF_IV:
        if (blockB->defIV + value > 31) {
            blockB->defIV = 31;
        } else {
            blockB->defIV += value;
        }
        break;
    case MON_DATA_SPEED_IV:
        if (blockB->spdIV + value > 31) {
            blockB->spdIV = 31;
        } else {
            blockB->spdIV += value;
        }
        break;
    case MON_DATA_SPATK_IV:
        if (blockB->spatkIV + value > 31) {
            blockB->spatkIV = 31;
        } else {
            blockB->spatkIV += value;
        }
        break;
    case MON_DATA_SPDEF_IV:
        if (blockB->spdefIV + value > 31) {
            blockB->spdefIV = 31;
        } else {
            blockB->spdefIV += value;
        }
        break;
    case MON_DATA_PERSONALITY:
    case MON_DATA_PARTY_LOCK:
    case MON_DATA_BOX_LOCK:
    case MON_DATA_CHECKSUM_FAILED:
    case MON_DATA_CHECKSUM:
    case MON_DATA_SPECIES:
    case MON_DATA_HELD_ITEM:
    case MON_DATA_OTID:
    case MON_DATA_ABILITY:
    case MON_DATA_MARKINGS:
    case MON_DATA_GAME_LANGUAGE:
    case MON_DATA_SINNOH_CHAMP_RIBBON:
    case MON_DATA_ABILITY_RIBBON:
    case MON_DATA_GREAT_ABILITY_RIBBON:
    case MON_DATA_DOUBLE_ABILITY_RIBBON:
    case MON_DATA_MULTI_ABILITY_RIBBON:
    case MON_DATA_PAIR_ABILITY_RIBBON:
    case MON_DATA_WORLD_ABILITY_RIBBON:
    case MON_DATA_ALERT_RIBBON:
    case MON_DATA_SHOCK_RIBBON:
    case MON_DATA_DOWNCAST_RIBBON:
    case MON_DATA_CARELESS_RIBBON:
    case MON_DATA_RELAX_RIBBON:
    case MON_DATA_SNOOZE_RIBBON:
    case MON_DATA_SMILE_RIBBON:
    case MON_DATA_GORGEOUS_RIBBON:
    case MON_DATA_ROYAL_RIBBON:
    case MON_DATA_GORGEOUS_ROYAL_RIBBON:
    case MON_DATA_FOOTPRINT_RIBBON:
    case MON_DATA_RECORD_RIBBON:
    case MON_DATA_HISTORY_RIBBON:
    case MON_DATA_LEGEND_RIBBON:
    case MON_DATA_RED_RIBBON:
    case MON_DATA_GREEN_RIBBON:
    case MON_DATA_BLUE_RIBBON:
    case MON_DATA_FESTIVAL_RIBBON:
    case MON_DATA_CARNIVAL_RIBBON:
    case MON_DATA_CLASSIC_RIBBON:
    case MON_DATA_PREMIER_RIBBON:
    case MON_DATA_SINNOH_RIBBON_53:
    case MON_DATA_MOVE1:
    case MON_DATA_MOVE2:
    case MON_DATA_MOVE3:
    case MON_DATA_MOVE4:
    case MON_DATA_IS_EGG:
    case MON_DATA_HAS_NICKNAME:
    case MON_DATA_HOENN_COOL_RIBBON:
    case MON_DATA_HOENN_COOL_RIBBON_SUPER:
    case MON_DATA_HOENN_COOL_RIBBON_HYPER:
    case MON_DATA_HOENN_COOL_RIBBON_MASTER:
    case MON_DATA_HOENN_BEAUTY_RIBBON:
    case MON_DATA_HOENN_BEAUTY_RIBBON_SUPER:
    case MON_DATA_HOENN_BEAUTY_RIBBON_HYPER:
    case MON_DATA_HOENN_BEAUTY_RIBBON_MASTER:
    case MON_DATA_HOENN_CUTE_RIBBON:
    case MON_DATA_HOENN_CUTE_RIBBON_SUPER:
    case MON_DATA_HOENN_CUTE_RIBBON_HYPER:
    case MON_DATA_HOENN_CUTE_RIBBON_MASTER:
    case MON_DATA_HOENN_SMART_RIBBON:
    case MON_DATA_HOENN_SMART_RIBBON_SUPER:
    case MON_DATA_HOENN_SMART_RIBBON_HYPER:
    case MON_DATA_HOENN_SMART_RIBBON_MASTER:
    case MON_DATA_HOENN_TOUGH_RIBBON:
    case MON_DATA_HOENN_TOUGH_RIBBON_SUPER:
    case MON_DATA_HOENN_TOUGH_RIBBON_HYPER:
    case MON_DATA_HOENN_TOUGH_RIBBON_MASTER:
    case MON_DATA_HOENN_CHAMPION_RIBBON:
    case MON_DATA_HOENN_WINNING_RIBBON:
    case MON_DATA_HOENN_VICTORY_RIBBON:
    case MON_DATA_HOENN_ARTIST_RIBBON:
    case MON_DATA_HOENN_EFFORT_RIBBON:
    case MON_DATA_HOENN_MARINE_RIBBON:
    case MON_DATA_HOENN_LAND_RIBBON:
    case MON_DATA_HOENN_SKY_RIBBON:
    case MON_DATA_HOENN_COUNTRY_RIBBON:
    case MON_DATA_HOENN_NATIONAL_RIBBON:
    case MON_DATA_HOENN_EARTH_RIBBON:
    case MON_DATA_HOENN_WORLD_RIBBON:
    case MON_DATA_FATEFUL_ENCOUNTER:
    case MON_DATA_GENDER:
    case MON_DATA_FORME:
    case MON_DATA_RESERVED_113:
    case MON_DATA_RESERVED_114:
    case MON_DATA_NICKNAME:
    case MON_DATA_NICKNAME_2:
    case MON_DATA_NICKNAME_3:
    case MON_DATA_NICKNAME_4:
    case MON_DATA_UNK_120:
    case MON_DATA_GAME_VERSION:
    case MON_DATA_COOL_RIBBON:
    case MON_DATA_COOL_RIBBON_GREAT:
    case MON_DATA_COOL_RIBBON_ULTRA:
    case MON_DATA_COOL_RIBBON_MASTER:
    case MON_DATA_BEAUTY_RIBBON:
    case MON_DATA_BEAUTY_RIBBON_GREAT:
    case MON_DATA_BEAUTY_RIBBON_ULTRA:
    case MON_DATA_BEAUTY_RIBBON_MASTER:
    case MON_DATA_CUTE_RIBBON:
    case MON_DATA_CUTE_RIBBON_GREAT:
    case MON_DATA_CUTE_RIBBON_ULTRA:
    case MON_DATA_CUTE_RIBBON_MASTER:
    case MON_DATA_SMART_RIBBON:
    case MON_DATA_SMART_RIBBON_GREAT:
    case MON_DATA_SMART_RIBBON_ULTRA:
    case MON_DATA_SMART_RIBBON_MASTER:
    case MON_DATA_TOUGH_RIBBON:
    case MON_DATA_TOUGH_RIBBON_GREAT:
    case MON_DATA_TOUGH_RIBBON_ULTRA:
    case MON_DATA_TOUGH_RIBBON_MASTER:
    case MON_DATA_SINNOH_RIBBON_142:
    case MON_DATA_OT_NAME:
    case MON_DATA_OT_NAME_2:
    case MON_DATA_EGG_MET_YEAR:
    case MON_DATA_EGG_MET_MONTH:
    case MON_DATA_EGG_MET_DAY:
    case MON_DATA_MET_YEAR:
    case MON_DATA_MET_MONTH:
    case MON_DATA_MET_DAY:
    case MON_DATA_EGG_MET_LOCATION:
    case MON_DATA_HGSS_EGG_MET_LOCATION:
    case MON_DATA_MET_LOCATION:
    case MON_DATA_HGSS_MET_LOCATION:
    case MON_DATA_POKERUS:
    case MON_DATA_POKEBALL:
    case MON_DATA_MET_LEVEL:
    case MON_DATA_MET_GENDER:
    case MON_DATA_ENCOUNTER_TYPE:
    case MON_DATA_RESERVED_158:
    case MON_DATA_STATUS:
    case MON_DATA_LEVEL:
    case MON_DATA_CAPSULE:
    case MON_DATA_HP:
    case MON_DATA_MAXHP:
    case MON_DATA_ATK:
    case MON_DATA_DEF:
    case MON_DATA_SPEED:
    case MON_DATA_SPATK:
    case MON_DATA_SPDEF:
    case MON_DATA_MAIL_STRUCT:
    case MON_DATA_SEAL_COORDS:
    case MON_DATA_SPECIES_EXISTS:
    case MON_DATA_SANITY_IS_EGG:
    case MON_DATA_SPECIES2:
    case MON_DATA_IVS_WORD:
    case MON_DATA_UNK_175:
    case MON_DATA_TYPE_1:
    case MON_DATA_TYPE_2:
    case MON_DATA_SPECIES_NAME:
    case MON_DATA_DP_POKEBALL:
    case MON_DATA_SHINY_LEAF_A:
    case MON_DATA_SHINY_LEAF_B:
    case MON_DATA_SHINY_LEAF_C:
    case MON_DATA_SHINY_LEAF_D:
    case MON_DATA_SHINY_LEAF_E:
    case MON_DATA_SHINY_LEAF_CROWN:
    default:
        GF_ASSERT(0);
    }
}

BASE_STATS *AllocAndLoadMonPersonal_HandleAlternateForme(int species, int forme, HeapID heap_id) {
    BASE_STATS *ret = AllocFromHeap(heap_id, sizeof(BASE_STATS));
    LoadMonBaseStats_HandleAlternateForme(species, forme, ret);
    return ret;
}

BASE_STATS *AllocAndLoadMonPersonal(int species, HeapID heap_id) {
    BASE_STATS *ret = AllocFromHeap(heap_id, sizeof(BASE_STATS));
    LoadMonPersonal(species, ret);
    return ret;
}

int GetPersonalAttr(const BASE_STATS *baseStats, BaseStat attr) {
    int ret;
    GF_ASSERT(baseStats != NULL);
    switch (attr) {
    case BASE_HP:
        ret = baseStats->hp;
        break;
    case BASE_ATK:
        ret = baseStats->atk;
        break;
    case BASE_DEF:
        ret = baseStats->def;
        break;
    case BASE_SPEED:
        ret = baseStats->speed;
        break;
    case BASE_SPATK:
        ret = baseStats->spatk;
        break;
    case BASE_SPDEF:
        ret = baseStats->spdef;
        break;
    case BASE_TYPE1:
        ret = baseStats->types[0];
        break;
    case BASE_TYPE2:
        ret = baseStats->types[1];
        break;
    case BASE_CATCH_RATE:
        ret = baseStats->catchRate;
        break;
    case BASE_EXP_YIELD:
        ret = baseStats->expYield;
        break;
    case BASE_HP_YIELD:
        ret = baseStats->hp_yield;
        break;
    case BASE_ATK_YIELD:
        ret = baseStats->atk_yield;
        break;
    case BASE_DEF_YIELD:
        ret = baseStats->def_yield;
        break;
    case BASE_SPEED_YIELD:
        ret = baseStats->speed_yield;
        break;
    case BASE_SPATK_YIELD:
        ret = baseStats->spatk_yield;
        break;
    case BASE_SPDEF_YIELD:
        ret = baseStats->spdef_yield;
        break;
    case BASE_ITEM_1:
        ret = baseStats->item1;
        break;
    case BASE_ITEM_2:
        ret = baseStats->item2;
        break;
    case BASE_GENDER_RATIO:
        ret = baseStats->genderRatio;
        break;
    case BASE_EGG_CYCLES:
        ret = baseStats->eggCycles;
        break;
    case BASE_FRIENDSHIP:
        ret = baseStats->friendship;
        break;
    case BASE_GROWTH_RATE:
        ret = baseStats->growthRate;
        break;
    case BASE_EGG_GROUP_1:
        ret = baseStats->eggGroups[0];
        break;
    case GASE_EGG_GROUP_2:
        ret = baseStats->eggGroups[1];
        break;
    case BASE_ABILITY_1:
        ret = baseStats->abilities[0];
        break;
    case BASE_ABILITY_2:
        ret = baseStats->abilities[1];
        break;
    case BASE_GREAT_MARSH_RATE:
        ret = baseStats->greatMarshRate;
        break;
    case BASE_COLOR:
        ret = baseStats->color;
        break;
    case BASE_FLIP:
        ret = baseStats->flip;
        break;
    case BASE_TMHM_1:
        ret = (int)baseStats->unk1C;
        break;
    case BASE_TMHM_2:
        ret = (int)baseStats->unk20;
        break;
    case BASE_TMHM_3:
        ret = (int)baseStats->unk24;
        break;
    case BASE_TMHM_4:
        ret = (int)baseStats->unk28;
        break;
    }
    return ret;
}

void FreeMonPersonal(BASE_STATS * personal) {
    GF_ASSERT(personal != NULL);
    FreeToHeap(personal);
}

int GetMonBaseStat_HandleAlternateForme(int species, int forme, BaseStat attr) {
    int ret;
    BASE_STATS * personal = AllocAndLoadMonPersonal(ResolveMonForme(species, forme), 0);
    ret = GetPersonalAttr(personal, attr);
    FreeMonPersonal(personal);
    return ret;
}

int GetMonBaseStat(int species, BaseStat attr) {
    int ret;
    BASE_STATS * personal = AllocAndLoadMonPersonal(species, 0);
    ret = GetPersonalAttr(personal, attr);
    FreeMonPersonal(personal);
    return ret;
}

int GetMonBaseStatEx_HandleAlternateForme(NARC *narc, int species, int forme, BaseStat attr) {
    int resolved = ResolveMonForme(species, forme);
    int ret;
    BASE_STATS *buf = AllocFromHeap(0, sizeof(BASE_STATS));
    NARC_ReadWholeMember(narc, resolved, buf);
    ret = GetPersonalAttr(buf, attr);
    FreeToHeap(buf);
    return ret;
}

u8 GetPercentProgressTowardsNextLevel(POKEMON * pokemon) {
    BOOL decry = AcquireMonLock(pokemon);
    u16 species = (u16)GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    u8 level = (u8)GetMonData(pokemon, MON_DATA_LEVEL, NULL);
    u32 lo = GetMonExpBySpeciesAndLevel(species, level);
    u32 hi = GetMonExpBySpeciesAndLevel(species, level + 1);
    u32 cur = GetMonData(pokemon, MON_DATA_EXPERIENCE, NULL);
    ReleaseMonLock(pokemon, decry);
    return (u8)(100 * (cur - lo) / (hi - lo));
}

u32 CalcMonExpToNextLevel(POKEMON * pokemon) {
    return CalcBoxMonExpToNextLevel(&pokemon->box);
}

u32 CalcBoxMonExpToNextLevel(BOXMON * boxmon) {
    u16 species = (u16)GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL);
    u16 level = (u16)(CalcBoxMonLevel(boxmon) + 1);
    u32 cur = GetBoxMonData(boxmon, MON_DATA_EXPERIENCE, NULL);
    u32 hi = GetMonExpBySpeciesAndLevel(species, level);
    return hi - cur;
}

u32 GetMonBaseExperienceAtCurrentLevel(POKEMON * pokemon) {
    int species = (int)GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    int level = (int)GetMonData(pokemon, MON_DATA_LEVEL, NULL);
    return GetMonExpBySpeciesAndLevel(species, level);
}

u32 GetMonExpBySpeciesAndLevel(int species, int level) {
    return GetExpByGrowthRateAndLevel(GetMonBaseStat(species, BASE_GROWTH_RATE), level);
}

void LoadGrowthTable(int growthRate, u32 * dest) {
    GF_ASSERT(growthRate < 8);
    ReadWholeNarcMemberByIdPair(dest, NARC_poketool_personal_growtbl, growthRate);
}

u32 GetExpByGrowthRateAndLevel(int growthRate, int level) {
    u32 * table;
    u32 ret;
    GF_ASSERT(growthRate < 8);
    GF_ASSERT(level <= MAX_LEVEL + 1);
    table = (u32 *)AllocFromHeap(0, (MAX_LEVEL + 1) * sizeof(u32));
    LoadGrowthTable(growthRate, table);
    ret = table[level];
    FreeToHeap(table);
    return ret;
}

int CalcMonLevel(POKEMON * pokemon) {
    return CalcBoxMonLevel(&pokemon->box);
}

int CalcBoxMonLevel(BOXMON * boxmon) {
    BOOL decry = AcquireBoxMonLock(boxmon);
    int species = (int)GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL);
    int exp = (int)GetBoxMonData(boxmon, MON_DATA_EXPERIENCE, NULL);
    ReleaseBoxMonLock(boxmon, decry);
    return CalcLevelBySpeciesAndExp((u16)species, (u32)exp);
}

int CalcLevelBySpeciesAndExp(u16 species, u32 exp) {
    int level;
    struct BaseStats * personal = AllocAndLoadMonPersonal(species, 0);
    level = CalcLevelBySpeciesAndExp_PreloadedPersonal(personal, species, exp);
    FreeMonPersonal(personal);
    return level;
}

int CalcLevelBySpeciesAndExp_PreloadedPersonal(struct BaseStats * personal, u16 species, u32 exp) {
#pragma unused(species)
    static u32 table[101];
    int i;
    LoadGrowthTable(GetPersonalAttr(personal, BASE_GROWTH_RATE), table);
    for (i = 1; i < 101; i++) {
        if (table[i] > exp) {
            break;
        }
    }
    return i - 1;
}

u8 GetMonNature(POKEMON * pokemon) {
    return GetBoxMonNature(&pokemon->box);
}

u8 GetBoxMonNature(BOXMON * boxmon) {
    BOOL decry = AcquireBoxMonLock(boxmon);
    u32 personality = GetBoxMonData(boxmon, MON_DATA_PERSONALITY, NULL);
    ReleaseBoxMonLock(boxmon, decry);
    return GetNatureFromPersonality(personality);
}

u8 GetNatureFromPersonality(u32 pid) {
    return (u8)(pid % 25);
}

u16 ModifyStatByNature(u8 nature, u16 n, u8 statIndex) {
    u16 retVal;

    // Dont modify HP, Accuracy, or Evasion by nature
    if (statIndex < STAT_ATK || statIndex > STAT_SPDEF) {
        return n;
    }

    switch (sNatureStatMods[nature][statIndex - 1]) {
    case 1:
        // NOTE: will overflow for n > 595 because the intermediate value is cast to u16 before the division.
        retVal = n * 110;
        retVal /= 100;
        break;
    case -1:
        // NOTE: will overflow for n > 728, see above
        retVal = n * 90;
        retVal /= 100;
        break;
    default:
        retVal = n;
        break;
    }
    return retVal;
}

void MonApplyFriendshipMod(POKEMON * pokemon, u32 kind, u32 location) {
    u16 species;
    u8 effect;
    u8 tier;
    s16 friendship;
    s8 mod;

    if (kind == FRIENDSHIP_EVENT_WALKING && (LCRandom() & 1))
        return;

    species = (u16)GetMonData(pokemon, MON_DATA_SPECIES2, NULL);
    if (species == SPECIES_NONE || species == SPECIES_EGG)
        return;

    effect = (u8)GetItemAttr((u16)GetMonData(pokemon, MON_DATA_HELD_ITEM, NULL), ITEMATTR_HOLD_EFFECT, 0);
    tier = FRIENDSHIP_TIER_LOW;
    friendship = (s16)GetMonData(pokemon, MON_DATA_FRIENDSHIP, NULL);
    if (friendship >= FRIENDSHIP_TIER_MID_MIN)
        tier++;
    if (friendship >= FRIENDSHIP_TIER_HI_MIN)
        tier++;
    mod = sFriendshipModTable[kind][tier];
    if (mod > 0 && GetMonData(pokemon, MON_DATA_DP_POKEBALL, NULL) == ITEM_LUXURY_BALL)
        mod++;
    if (mod > 0 && GetMonData(pokemon, MON_DATA_EGG_MET_LOCATION, NULL) == location)
        mod++;
    if (mod > 0 && effect == HOLD_EFFECT_FRIENDSHIP_UP)
        mod = (s8)(mod * 150 / 100);
    friendship += mod;
    if (friendship < 0)
        friendship = 0;
    if (friendship > FRIENDSHIP_MAX)
        friendship = FRIENDSHIP_MAX;
    SetMonData(pokemon, MON_DATA_FRIENDSHIP, &friendship);
}

u8 GetMonGender(POKEMON *pokemon) {
    return GetBoxMonGender(&pokemon->box);
}

u8 GetBoxMonGender(BOXMON *boxmon) {
    BOOL decry = AcquireBoxMonLock(boxmon);
    u16 species = GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL);
    u32 pid = GetBoxMonData(boxmon, MON_DATA_PERSONALITY, NULL);
    ReleaseBoxMonLock(boxmon, decry);
    return GetGenderBySpeciesAndPersonality(species, pid);
}

u8 GetGenderBySpeciesAndPersonality(u16 species, u32 pid) {
    BASE_STATS *personal = AllocAndLoadMonPersonal(species, 0);
    u8 gender = GetGenderBySpeciesAndPersonality_PreloadedPersonal(personal, species, pid);
    FreeMonPersonal(personal);
    return gender;
}

u8 GetGenderBySpeciesAndPersonality_PreloadedPersonal(const BASE_STATS *personal, u16 species, u32 pid) {
#pragma unused(species)
    enum MonGender gender;
    u8 ratio = GetPersonalAttr(personal, BASE_GENDER_RATIO);
    switch (ratio) {
    case MON_RATIO_MALE:
        return MON_MALE;
    case MON_RATIO_FEMALE:
        return MON_FEMALE;
    case MON_RATIO_UNKNOWN:
        return MON_GENDERLESS;
    default:
        if (ratio > (u8)pid) {
            gender = MON_FEMALE;
        } else {
            gender = MON_MALE;
        }
        return gender;
    }
}

BOOL BoxMonIsHoldingMail(BOXMON *boxmon) {
    return ItemIdIsMail(GetBoxMonData(boxmon, MON_DATA_HELD_ITEM, NULL));
}

u8 MonIsShiny(POKEMON *pokemon) {
    return BoxMonIsShiny(&pokemon->box);
}

u8 BoxMonIsShiny(BOXMON *boxmon) {
    u32 otid = GetBoxMonData(boxmon, MON_DATA_OTID, NULL);
    u32 pid = GetBoxMonData(boxmon, MON_DATA_PERSONALITY, NULL);
    return CalcShininessByOtIdAndPersonality(otid, pid);
}

u8 CalcShininessByOtIdAndPersonality(u32 otid, u32 pid) {
    return (u8)SHINY_CHECK(otid, pid);
}

u32 GenerateShinyPersonality(u32 otid) {
    int r4;
    u16 r6;
    u16 r5;
    otid = (u32)((((otid & 0xFFFF0000) >> 16) ^ (otid & 0xFFFF)) >> 3u);
    r6 = (u16)(LCRandom() & 7);
    r5 = (u16)(LCRandom() & 7);
    for (r4 = 0; r4 < 13; r4++) {
        if (MaskOfFlagNo(r4) & otid) {
            if (LCRandom() & 1)
                r6 |= MaskOfFlagNo(r4 + 3);
            else
                r5 |= MaskOfFlagNo(r4 + 3);
        }
        else if (LCRandom() & 1) {
            r6 |= MaskOfFlagNo(r4 + 3);
            r5 |= MaskOfFlagNo(r4 + 3);
        }
    }
    return (u32)((r5 << 16) | r6);
}

void sub_02070124(struct SomeDrawPokemonStruct *a0, BOXMON *boxmon, u8 whichFacing) {
    sub_0207013C(a0, boxmon, whichFacing, FALSE);
}

void sub_02070130(struct SomeDrawPokemonStruct *a0, BOXMON *boxmon, u8 whichFacing) {
    sub_0207013C(a0, boxmon, whichFacing, TRUE);
}

void sub_0207013C(struct SomeDrawPokemonStruct *spC, BOXMON *boxmon, u8 whichFacing, BOOL sp14) {
    BOOL decry = AcquireBoxMonLock(boxmon);
    u16 species = GetBoxMonData(boxmon, MON_DATA_SPECIES2, NULL);
    u8 gender = GetBoxMonGender(boxmon);
    u8 shiny = BoxMonIsShiny(boxmon);
    u32 pid = GetBoxMonData(boxmon, MON_DATA_PERSONALITY, NULL);
    u8 forme;
    if (species == SPECIES_EGG) {
        if (GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL) == SPECIES_MANAPHY) {
            forme = EGG_MANAPHY;
        } else {
            forme = EGG_STANDARD;
        }
    } else {
        forme = GetBoxMonData(boxmon, MON_DATA_FORME, NULL);
    }
    if (sp14 == TRUE) {
        sub_02070588(spC, species, gender, whichFacing, shiny, forme, pid);
    } else {
        sub_020701E4(spC, species, gender, whichFacing, shiny, forme, pid);
    }
    ReleaseBoxMonLock(boxmon, decry);
}

void sub_020701E4(struct SomeDrawPokemonStruct * spC, u16 species, u8 gender, u8 whichFacing, u8 shiny, u8 forme, u32 personality) {
    spC->unk6 = 0;
    spC->unk8 = 0;
    spC->unkC = 0;
    forme = sub_02070438(species, forme);
    switch (species) {
    case SPECIES_BURMY:
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + 0x48 + forme * 2);
        spC->palDataID = (u16)(shiny + 0xAA + forme * 2);
        break;
    case SPECIES_WORMADAM:
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + 0x4E + forme * 2);
        spC->palDataID = (u16)(shiny + 0xB0 + forme * 2);
        break;
    case SPECIES_SHELLOS:
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing + 0x54 + forme);
        spC->palDataID = (u16)(shiny + 0xB6 + forme * 2);
        break;
    case SPECIES_GASTRODON:
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing + 0x58 + forme);
        spC->palDataID = (u16)(shiny + 0xBA + forme * 2);
        break;
    case SPECIES_CHERRIM:
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing + 0x5C + forme);
        spC->palDataID = (u16)(shiny * 2 + 0xBE + forme);
        break;
    case SPECIES_ARCEUS:
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + 0x60 + forme * 2);
        spC->palDataID = (u16)(shiny + 0xC2 + forme * 2);
        break;
    case SPECIES_CASTFORM:
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing * 2 + 0x40 + forme);
        spC->palDataID = (u16)(shiny * 4 + 0xA2 + forme);
        break;
    case SPECIES_DEOXYS:
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + forme * 2);
        spC->palDataID = (u16)(shiny + 0x9E);
        break;
    case SPECIES_UNOWN:
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + 0x8 + forme * 2);
        spC->palDataID = (u16)(shiny + 0xA0);
        break;
    case SPECIES_EGG: // egg, manaphy egg
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(0x84 + forme);
        spC->palDataID = (u16)(0xE6 + forme);
        break;
    case SPECIES_MANAPHY_EGG: // bad egg
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = 0x84;
        spC->palDataID = 0xE6;
        break;
    case SPECIES_SHAYMIN: // land, sky
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + 0x86 + forme * 2);
        spC->palDataID = (u16)(shiny + 0xE8 + forme * 2);
        break;
    case SPECIES_ROTOM: // normal, fan, mow, wash, heat, frost
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + 0x8A + forme * 2);
        spC->palDataID = (u16)(shiny + 0xEC + forme * 2);
        break;
    case SPECIES_GIRATINA: // altered, origin
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + 0x96 + forme * 2);
        spC->palDataID = (u16)(shiny + 0xF8 + forme * 2);
        break;
    case SPECIES_PICHU: // spiky-ear
        spC->narcID = NARC_poketool_pokegra_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + 0x9A + forme * 2);
        spC->palDataID = (u16)(shiny + 0xFC + forme * 2);
        break;
    default:
        spC->narcID = NARC_poketool_pokegra_pokegra;
        spC->charDataID = (u16)(species * 6 + whichFacing + (gender == MON_FEMALE ? 0 : 1));
        spC->palDataID = (u16)(shiny + (species * 6 + 4));
        if (species == SPECIES_SPINDA && whichFacing == 2)
        {
            spC->unk6 = SPECIES_SPINDA;
            spC->unk8 = 0;
            spC->unkC = personality;
        }
        break;
    }
}

u8 sub_02070438(u16 species, u8 forme) {
    switch (species) {
    case SPECIES_BURMY:
        if (forme > BURMY_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    case SPECIES_WORMADAM:
        if (forme > WORMADAM_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    case SPECIES_SHELLOS:
        if (forme > SHELLOS_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    case SPECIES_GASTRODON:
        if (forme > GASTRODON_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    case SPECIES_CHERRIM:
        if (forme > CHERRIM_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    case SPECIES_ARCEUS:
        if (forme > ARCEUS_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    case SPECIES_CASTFORM:
        if (forme > CASTFORM_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    case SPECIES_DEOXYS:
        if (forme > DEOXYS_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    case SPECIES_UNOWN:
        if (forme >= UNOWN_FORME_MAX) {
            forme = 0;
        }
        break;
    case SPECIES_EGG:
        if (forme > EGG_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    case SPECIES_SHAYMIN:
        if (forme > SHAYMIN_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    case SPECIES_ROTOM:
        if (forme > ROTOM_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    case SPECIES_GIRATINA:
        if (forme > GIRATINA_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    case SPECIES_PICHU:
        if (forme > PICHU_FORME_MAX - 1) {
            forme = 0;
        }
        break;
    }
    return forme;
}

void sub_02070560(struct SomeDrawPokemonStruct * spC, u16 species, u8 whichFacing, u8 gender, u32 shiny) {
    spC->narcID = NARC_pbr_pokegra;
    spC->charDataID = (u16)(species * 6 + whichFacing + (gender == MON_FEMALE ? 0 : 1));
    spC->palDataID = (u16)(shiny + (species * 6 + 4));
}

void sub_02070588(struct SomeDrawPokemonStruct * spC, u16 species, u8 gender, u8 whichFacing, u8 shiny, u8 forme, u32 personality) {
    spC->unk6 = 0;
    spC->unk8 = 0;
    spC->unkC = 0;
    forme = sub_02070438(species, forme);
    switch (species) {
    case SPECIES_BURMY:
        spC->narcID = NARC_pbr_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + 0x48 + forme * 2);
        spC->palDataID = (u16)(shiny + 0x92 + forme * 2);
        break;
    case SPECIES_WORMADAM:
        spC->narcID = NARC_pbr_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + 0x4E + forme * 2);
        spC->palDataID = (u16)(shiny + 0x98 + forme * 2);
        break;
    case SPECIES_SHELLOS:
        spC->narcID = NARC_pbr_otherpoke;
        spC->charDataID = (u16)(whichFacing + 0x54 + forme);
        spC->palDataID = (u16)(shiny + 0x9E + forme * 2);
        break;
    case SPECIES_GASTRODON:
        spC->narcID = NARC_pbr_otherpoke;
        spC->charDataID = (u16)(whichFacing + 0x58 + forme);
        spC->palDataID = (u16)(shiny + 0xA2 + forme * 2);
        break;
    case SPECIES_CHERRIM:
        spC->narcID = NARC_pbr_otherpoke;
        spC->charDataID = (u16)(whichFacing + 0x5C + forme);
        spC->palDataID = (u16)(shiny * 2 + 0xA6 + forme);
        break;
    case SPECIES_ARCEUS:
        spC->narcID = NARC_pbr_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + 0x60 + forme * 2);
        spC->palDataID = (u16)(shiny + 0xAA + forme * 2);
        break;
    case SPECIES_CASTFORM:
        spC->narcID = NARC_pbr_otherpoke;
        spC->charDataID = (u16)(whichFacing * 2 + 0x40 + forme);
        spC->palDataID = (u16)(shiny * 4 + 0x8A + forme);
        break;
    case SPECIES_DEOXYS:
        spC->narcID = NARC_pbr_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + forme * 2);
        spC->palDataID = (u16)(shiny + 0x86);
        break;
    case SPECIES_UNOWN:
        spC->narcID = NARC_pbr_otherpoke;
        spC->charDataID = (u16)(whichFacing / 2 + 0x8 + forme * 2);
        spC->palDataID = (u16)(shiny + 0x88);
        break;
    case SPECIES_EGG: // egg, manaphy egg
        spC->narcID = NARC_pbr_otherpoke;
        spC->charDataID = (u16)(0x84 + forme);
        spC->palDataID = (u16)(0xCE + forme);
        break;
    case SPECIES_MANAPHY_EGG: // bad egg
        spC->narcID = NARC_pbr_otherpoke;
        spC->charDataID = 0x84;
        spC->palDataID = 0xCE;
        break;
    case SPECIES_SHAYMIN: // land, sky
        if (forme != 0) {
            spC->narcID = NARC_poketool_pokegra_otherpoke;
            spC->charDataID = (u16)(whichFacing / 2 + 0x86 + forme * 2);
            spC->palDataID = (u16)(shiny + 0xEA);
        } else {
            sub_02070560(spC, species, whichFacing, gender, shiny);
        }
        break;
    case SPECIES_ROTOM: // normal, fan, mow, wash, heat, frost
        if (forme != 0) {
            spC->narcID = NARC_poketool_pokegra_otherpoke;
            spC->charDataID = (u16)(whichFacing / 2 + 0x8A + forme * 2);
            spC->palDataID = (u16)(shiny + 0xEC + forme * 2);
        } else {
            sub_02070560(spC, species, whichFacing, gender, shiny);
        }
        break;
    case SPECIES_GIRATINA: // altered, origin
        if (forme != 0) {
            spC->narcID = NARC_poketool_pokegra_otherpoke;
            spC->charDataID = (u16)(whichFacing / 2 + 0x96 + forme * 2);
            spC->palDataID = (u16)(shiny + 0xF8 + forme * 2);
        } else {
            sub_02070560(spC, species, whichFacing, gender, shiny);
        }
        break;
    case SPECIES_PICHU: // spiky-ear
        if (forme != 0) {
            spC->narcID = NARC_poketool_pokegra_otherpoke;
            spC->charDataID = (u16)(whichFacing / 2 + 0x9C);
            spC->palDataID = (u16)(shiny + 0xFE);
        } else {
            sub_02070560(spC, species, whichFacing, gender, shiny);
        }
        break;
    default:
        sub_02070560(spC, species, whichFacing, gender, shiny);
        if (species == SPECIES_SPINDA && whichFacing == 2)
        {
            spC->unk6 = SPECIES_SPINDA;
            spC->unk8 = 0;
            spC->unkC = personality;
        }
        break;
    }
}

u8 sub_0207083C(BOXMON *boxmon, u8 whichFacing) {
    return sub_02070854(boxmon, whichFacing, FALSE);
}

u8 sub_02070848(BOXMON *boxmon, u8 whichFacing) {
    return sub_02070854(boxmon, whichFacing, TRUE);
}

u8 sub_02070854(BOXMON *boxmon, u8 whichFacing, BOOL a2) {
    u16 species = GetBoxMonData(boxmon, MON_DATA_SPECIES2, NULL);
    u8 gender = GetBoxMonGender(boxmon);
    u32 pid = GetBoxMonData(boxmon, MON_DATA_PERSONALITY, NULL);
    u8 forme;
    if (species == SPECIES_EGG) {
        if (GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL) == SPECIES_MANAPHY) {
            forme = EGG_MANAPHY;
        } else {
            forme = EGG_STANDARD;
        }
    } else {
        forme = GetBoxMonData(boxmon, MON_DATA_FORME, NULL);
    }
    if (a2 == TRUE) {
        return sub_02070A64(species, gender, whichFacing, forme, pid);
    } else {
        return sub_020708D8(species, gender, whichFacing, forme, pid);
    }
}

u8 sub_020708D8(u16 species, u8 gender, u8 whichFacing, u8 forme, u32 pid) {
    // species -> r5
    // gender -> r6
    // whichFacing -> r4
    // forme -> <overwrittten>
    // pid -> sp18
#pragma unused(pid)
    NarcId narcId;
    s32 fileId;
    u8 ret;

    forme = sub_02070438(species, forme);
    switch (species) {
    case SPECIES_BURMY:
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x48 + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_WORMADAM:
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x4E + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_SHELLOS:
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x54 + whichFacing + forme;
        break;
    case SPECIES_GASTRODON:
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x58 + whichFacing + forme;
        break;
    case SPECIES_CHERRIM:
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x5C + whichFacing + forme;
        break;
    case SPECIES_ARCEUS:
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x60 + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_CASTFORM:
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x40 + 2 * whichFacing + forme;
        break;
    case SPECIES_DEOXYS:
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x00 + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_UNOWN:
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x08 + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_EGG: // egg, manaphy egg
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x84 + forme;
        break;
    case SPECIES_MANAPHY_EGG: // bad egg
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x84;
        break;
    case SPECIES_SHAYMIN: // land, sky
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x88 + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_ROTOM: // normal, fan, mow, wash, heat, frost
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x8C + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_GIRATINA: // altered, origin
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x98 + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_PICHU: // spiky-ear
        narcId = NARC_poketool_pokegra_height_o;
        fileId = 0x9C + whichFacing / 2 + forme * 2;
        break;
    default:
        narcId = NARC_poketool_pokegra_height;
        fileId = species * 4 + whichFacing + (gender != MON_FEMALE ? 1 : 0);
        break;
    }
    ReadWholeNarcMemberByIdPair(&ret, narcId, fileId);
    return ret;
}

u8 sub_02070A64(u16 species, u8 gender, u8 whichFacing, u8 forme, u32 pid) {
    // species -> r5
    // gender -> r6
    // whichFacing -> r4
    // forme -> <overwrittten>
    // pid -> sp18
#pragma unused(pid)
    NarcId narcId;
    s32 fileId;
    u8 ret;

    forme = sub_02070438(species, forme);
    switch (species) {
    case SPECIES_BURMY:
        narcId = NARC_pbr_dp_height_o;
        fileId = 0x48 + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_WORMADAM:
        narcId = NARC_pbr_dp_height_o;
        fileId = 0x4E + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_SHELLOS:
        narcId = NARC_pbr_dp_height_o;
        fileId = 0x54 + whichFacing + forme;
        break;
    case SPECIES_GASTRODON:
        narcId = NARC_pbr_dp_height_o;
        fileId = 0x58 + whichFacing + forme;
        break;
    case SPECIES_CHERRIM:
        narcId = NARC_pbr_dp_height_o;
        fileId = 0x5C + whichFacing + forme;
        break;
    case SPECIES_ARCEUS:
        narcId = NARC_pbr_dp_height_o;
        fileId = 0x60 + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_CASTFORM:
        narcId = NARC_pbr_dp_height_o;
        fileId = 0x40 + 2 * whichFacing + forme;
        break;
    case SPECIES_DEOXYS:
        narcId = NARC_pbr_dp_height_o;
        fileId = 0x00 + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_UNOWN:
        narcId = NARC_pbr_dp_height_o;
        fileId = 0x08 + whichFacing / 2 + forme * 2;
        break;
    case SPECIES_EGG: // egg, manaphy egg
        narcId = NARC_pbr_dp_height_o;
        fileId = 0x84 + forme;
        break;
    case SPECIES_MANAPHY_EGG: // bad egg
        narcId = NARC_pbr_dp_height_o;
        fileId = 0x84;
        break;
    case SPECIES_SHAYMIN: // land, sky
        if (forme != 0) {
            narcId = NARC_poketool_pokegra_height_o;
            fileId = 0x88 + whichFacing / 2 + forme * 2;
        } else {
            narcId = NARC_pbr_dp_height;
            fileId = species * 4 + whichFacing + (gender != MON_FEMALE ? 1 : 0);
        }
        break;
    case SPECIES_ROTOM: // normal, fan, mow, wash, heat, frost
        if (forme != 0) {
            narcId = NARC_poketool_pokegra_height_o;
            fileId = 0x8C + whichFacing / 2 + forme * 2;
        } else {
            narcId = NARC_pbr_dp_height;
            fileId = species * 4 + whichFacing + (gender != MON_FEMALE ? 1 : 0);
        }
        break;
    case SPECIES_GIRATINA: // altered, origin
        if (forme != 0) {
            narcId = NARC_poketool_pokegra_height_o;
            fileId = 0x98 + whichFacing / 2 + forme * 2;
        } else {
            narcId = NARC_pbr_dp_height;
            fileId = species * 4 + whichFacing + (gender != MON_FEMALE ? 1 : 0);
        }
        break;
//    case SPECIES_PICHU: // spiky-ear
//        if (forme != 0) {
//            narcId = NARC_pbr_dp_height_o;
//            fileId = 0x9C + whichFacing / 2 + forme * 2;
//        } else {
//            narcId = NARC_pbr_dp_height;
//            fileId = species * 4 + whichFacing + (gender != MON_FEMALE ? 1 : 0);
//        }
//        break;
    default:
        narcId = NARC_pbr_dp_height;
        fileId = species * 4 + whichFacing + (gender != MON_FEMALE ? 1 : 0);
        break;
    }
    ReadWholeNarcMemberByIdPair(&ret, narcId, fileId);
    return ret;
}

extern const struct UnkStruct_0200D748 _020FF588;
extern const s32 _020FF50C[];

struct UnkStruct_0200CF18 *sub_02070C24(void * r6, s32 sp18, s32 sp1C, s32 sp20, s32 sp88, s32 trainerClass, s32 sp90, s32 sp94, s32 r5, HeapID heapId) {
    s32 r7;
    NARC *narc_r4;
    struct UnkStruct_0200CF18 *ret_r4;
    struct UnkStruct_0200D748 sp3C;
    struct UnkStruct_02070D3C sp24;

    r7 = 1;
    sub_02070D3C(trainerClass, sp90, sp94, &sp24);
    if (trainerClass == TRAINERCLASS_CASTLE_VALET) {
        r7 = 2;
    }
    narc_r4 = NARC_ctor(sp24.narcId, heapId);
    sub_0200D504(r6, sp18, narc_r4, sp24.ncgr_id, 0, 1, r5 + 0x4E2F);
    sub_0200D68C(sp1C, 2, r6, sp18, narc_r4, sp24.nclr_id, 0, r7, 1, r5 + 0x4E2A);
    sub_0200D6EC(r6, sp18, narc_r4, sp24.ncer_id, 0, r5 + 0x4E27);
    sub_0200D71C(r6, sp18, narc_r4, sp24.nanr_id, 0, r5 + 0x4E27);
    NARC_dtor(narc_r4);
    sp3C = _020FF588;
    sp3C.unk_14[0] = r5 + 0x4E2F;
    sp3C.unk_14[1] = r5 + 0x4E2A;
    sp3C.unk_14[2] = r5 + 0x4E27;
    sp3C.unk_14[3] = r5 + 0x4E27;
    sp3C.unk_08 = _020FF50C[r5];
    ret_r4 = sub_0200D734(r6, sp18, &sp3C);
    sub_02024AA8(ret_r4->unk_00, 0);
    sub_0200DDB8(ret_r4, sp20, sp88);
    sub_0200DC18(ret_r4);
    sub_0200DC78(ret_r4, 1);
    return ret_r4;
}

void sub_02070D3C(s32 trainer_class, s32 a1, s32 a2, struct UnkStruct_02070D3C *a3)
{
    if (a1 == 2) {
        a3->narcId = NARC_a_0_5_8;
        a3->ncgr_id = trainer_class * 5 + 0;
        a3->nclr_id = trainer_class * 5 + 1;
        a3->ncer_id = trainer_class * 5 + 2;
        a3->nanr_id = trainer_class * 5 + 3;
        a3->ncbr_id = trainer_class * 5 + 4;
    } else {
        a3->narcId = NARC_a_0_0_6;
        trainer_class = sub_0207280C(trainer_class, a2);
        a3->ncgr_id = trainer_class * 5 + 0;
        a3->nclr_id = trainer_class * 5 + 1;
        a3->ncer_id = trainer_class * 5 + 2;
        a3->nanr_id = trainer_class * 5 + 3;
        a3->ncbr_id = trainer_class * 5 + 4;
    }
}

void sub_02070D84(s32 trainer_class, s32 a1, struct UnkStruct_02070D3C *a2) {
    sub_02070D3C(trainer_class, a1, 0, a2);
}

u32 sub_02070D90(void) {
    return sizeof(POKEMON);
}

u32 sub_02070D94(void) {
    return sizeof(BOXMON);
}

u8 GetMonUnownLetter(POKEMON * pokemon) {
    return GetBoxMonUnownLetter(&pokemon->box);
}

u8 GetBoxMonUnownLetter(BOXMON * boxmon) {
    return (u8)GetBoxMonData(boxmon, MON_DATA_FORME, NULL);
}

BOXMON * Mon_GetBoxMon(POKEMON * pokemon) {
    return &pokemon->box;
}

BOOL sub_02070DB4(POKEMON * pokemon) {
    u16 species = (u16)GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    u8 level = (u8)(GetMonData(pokemon, MON_DATA_LEVEL, NULL) + 1);
    u32 exp = GetMonData(pokemon, MON_DATA_EXPERIENCE, NULL);
    u32 growthrate = (u32)GetMonBaseStat(species, BASE_GROWTH_RATE);
    u32 maxexp = GetExpByGrowthRateAndLevel((int)growthrate, 100);
    if (exp > maxexp) {
        exp = maxexp;
        SetMonData(pokemon, MON_DATA_EXPERIENCE, &exp);
    }
    if (level > 100)
        return FALSE;
    if (exp >= GetExpByGrowthRateAndLevel((int)growthrate, level)) {
        SetMonData(pokemon, MON_DATA_LEVEL, &level);
        return TRUE;
    }
    return FALSE;
}

u16 GetMonEvolution(SAVE_PARTY_T *party, POKEMON *pokemon, u8 context, u16 usedItem, int *method_ret) {
    u16 species;
    u16 heldItem;
    u8 level;
    int i;
    u16 target = SPECIES_NONE;
    u16 friendship;
    u32 pid;
    u8 holdEffect;
    u8 beauty; // for Feebas, but queried unconditionally.
    u16 pid_hi = 0;
    struct Evolution *evoTable;
    int method_local;

    species = GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    heldItem = GetMonData(pokemon, MON_DATA_HELD_ITEM, NULL);
    pid = GetMonData(pokemon, MON_DATA_PERSONALITY, NULL);
    beauty = GetMonData(pokemon, MON_DATA_BEAUTY, NULL);
    pid_hi = (u16)((pid & 0xFFFF0000) >> 16);
    holdEffect = GetItemAttr(heldItem, ITEMATTR_HOLD_EFFECT, 0);
    // Kadabra bypasses Everstone because he's just that broken.
    if (species != SPECIES_KADABRA && holdEffect == HOLD_EFFECT_NO_EVOLVE && context != EVOCTX_ITEM_USE) {
        return SPECIES_NONE;
    }
    // Spiky-ear Pichu cannot evolve
    if (species == SPECIES_PICHU && GetMonData(pokemon, MON_DATA_FORME, 0) == 1) {
        return SPECIES_NONE;
    }
    if (method_ret == NULL) {
        method_ret = &method_local;
    }
    evoTable = AllocFromHeap(0, MAX_EVOS_PER_POKE * sizeof(struct Evolution));
    LoadMonEvolutionTable(species, evoTable);
    switch (context) {
    case EVOCTX_LEVELUP:
        level = (u8)GetMonData(pokemon, MON_DATA_LEVEL, NULL);
        friendship = (u16)GetMonData(pokemon, MON_DATA_FRIENDSHIP, NULL);
        for (i = 0; i < 7; i++) {
            switch (evoTable[i].method) {
            case EVO_NONE:
                break;
            case EVO_FRIENDSHIP:
                if (friendship >= 220) {
                    target = evoTable[i].target;
                    *method_ret = EVO_FRIENDSHIP;
                }
                break;
            case EVO_FRIENDSHIP_DAY:
                if (IsNighttime() == 0 && friendship >= 220) {
                    target = evoTable[i].target;
                    *method_ret = EVO_FRIENDSHIP_DAY;
                }
                break;
            case EVO_FRIENDSHIP_NIGHT:
                if (IsNighttime() == 1 && friendship >= 220) {
                    target = evoTable[i].target;
                    *method_ret = EVO_FRIENDSHIP_NIGHT;
                }
                break;
            case EVO_LEVEL:
                if (evoTable[i].param <= level) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL;
                }
                break;
            case EVO_TRADE:
                break;
            case EVO_TRADE_ITEM:
                break;
            case EVO_STONE:
                break;
            case EVO_LEVEL_ATK_GT_DEF:
                if (evoTable[i].param <= level && GetMonData(pokemon, MON_DATA_ATK, NULL) > GetMonData(pokemon, MON_DATA_DEF, NULL)) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_ATK_GT_DEF;
                }
                break;
            case EVO_LEVEL_ATK_EQ_DEF:
                if (evoTable[i].param <= level && GetMonData(pokemon, MON_DATA_ATK, NULL) == GetMonData(pokemon, MON_DATA_DEF, NULL)) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_ATK_EQ_DEF;
                }
                break;
            case EVO_LEVEL_ATK_LT_DEF:
                if (evoTable[i].param <= level && GetMonData(pokemon, MON_DATA_ATK, NULL) < GetMonData(pokemon, MON_DATA_DEF, NULL)) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_ATK_LT_DEF;
                }
                break;
            case EVO_LEVEL_PID_LO:
                if (evoTable[i].param <= level && pid_hi % 10 < 5) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_PID_LO;
                }
                break;
            case EVO_LEVEL_PID_HI:
                if (evoTable[i].param <= level && pid_hi % 10 >= 5) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_PID_HI;
                }
                break;
            case EVO_LEVEL_NINJASK:
                if (evoTable[i].param <= level) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_NINJASK;
                }
                break;
            case EVO_LEVEL_SHEDINJA:
                *method_ret = EVO_LEVEL_SHEDINJA;
                break;
            case EVO_BEAUTY:
                if (evoTable[i].param <= beauty) {
                    target = evoTable[i].target;
                    *method_ret = EVO_BEAUTY;
                }
                break;
            case EVO_STONE_MALE:
                break;
            case EVO_STONE_FEMALE:
                break;
            case EVO_ITEM_DAY:
                if (IsNighttime() == 0 && evoTable[i].param == heldItem) {
                    target = evoTable[i].target;
                    *method_ret = EVO_ITEM_DAY;
                }
                break;
            case EVO_ITEM_NIGHT:
                if (IsNighttime() == 1 && evoTable[i].param == heldItem) {
                    target = evoTable[i].target;
                    *method_ret = EVO_ITEM_NIGHT;
                }
                break;
            case EVO_HAS_MOVE:
                if (MonHasMove(pokemon, evoTable[i].param) == TRUE) {
                    target = evoTable[i].target;
                    *method_ret = EVO_HAS_MOVE;
                }
                break;
            case EVO_OTHER_PARTY_MON:
                if (party != NULL && PartyHasMon(party, evoTable[i].param) == 1) {
                    target = evoTable[i].target;
                    *method_ret = EVO_OTHER_PARTY_MON;
                }
                break;
            case EVO_LEVEL_MALE:
                if (GetMonData(pokemon, MON_DATA_GENDER, NULL) == MON_MALE && evoTable[i].param <= level) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_MALE;
                }
                break;
            case EVO_LEVEL_FEMALE:
                if (GetMonData(pokemon, MON_DATA_GENDER, NULL) == MON_FEMALE && evoTable[i].param <= level) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_FEMALE;
                }
                break;
            case EVO_CORONET:
                if (usedItem == evoTable[i].method) {
                    target = evoTable[i].target;
                    *method_ret = EVO_CORONET;
                }
                break;
            case EVO_ETERNA:
                if (usedItem == evoTable[i].method) {
                    target = evoTable[i].target;
                    *method_ret = EVO_ETERNA;
                }
                break;
            case EVO_ROUTE217:
                if (usedItem == evoTable[i].method) {
                    target = evoTable[i].target;
                    *method_ret = EVO_ROUTE217;
                }
                break;
            }
            if (target != SPECIES_NONE) {
                break;
            }
        }
        break;
    case EVOCTX_TRADE:
        for (i = 0; i < 7; i++) {
            switch (evoTable[i].method) {
            case EVO_TRADE:
                target = evoTable[i].target;
                *method_ret = EVO_TRADE;
                break;
            case EVO_TRADE_ITEM:
                if (heldItem == evoTable[i].param) {
                    target = evoTable[i].target;
                    *method_ret = EVO_TRADE_ITEM;
                }
                break;
            }
            if (target != SPECIES_NONE) {
                break;
            }
        }
        break;
    case EVOCTX_ITEM_CHECK:
    case EVOCTX_ITEM_USE:
        for (i = 0; i < 7; i++) {
            if (evoTable[i].method == EVO_STONE && usedItem == evoTable[i].param) {
                target = evoTable[i].target;
                *method_ret = 0;
                break;
            }
            if (evoTable[i].method == EVO_STONE_MALE && GetMonData(pokemon, MON_DATA_GENDER, NULL) == MON_MALE && usedItem == evoTable[i].param) {
                target = evoTable[i].target;
                *method_ret = 0;
                break;
            }
            if (evoTable[i].method == EVO_STONE_FEMALE && GetMonData(pokemon, MON_DATA_GENDER, NULL) == MON_FEMALE && usedItem == evoTable[i].param) {
                target = evoTable[i].target;
                *method_ret = 0;
                break;
            }
        }
        break;
    }
    FreeToHeap(evoTable);
    return target;
}

u16 ReadFromPersonalPmsNarc(u16 species) {
    u16 ret = 0;
    FSFile file;
    GF_ASSERT(species < SPECIES_EGG);
    FS_InitFile(&file);
    FS_OpenFile(&file, "poketool/personal/pms.narc");
    FS_SeekFile(&file, species * 2, FS_SEEK_SET);
    FS_ReadFile(&file, &ret, 2);
    FS_CloseFile(&file);
    return ret;
}

u16 GetEggSpecies(u16 species) {
    switch (species) {
    case SPECIES_SUDOWOODO:
    case SPECIES_MARILL:
    case SPECIES_MR_MIME:
    case SPECIES_CHANSEY:
    case SPECIES_SNORLAX:
    case SPECIES_MANTINE:
    case SPECIES_WOBBUFFET:
    case SPECIES_ROSELIA:
    case SPECIES_CHIMECHO:
        return species;
    default:
        return ReadFromPersonalPmsNarc(species);
    }
}

#define WOTBL_END           0xFFFF
#define WOTBL_MOVE_MASK     0x01FF
#define WOTBL_MOVE_SHIFT         0
#define WOTBL_LVL_MASK      0xFE00
#define WOTBL_LVL_SHIFT          9
#define WOTBL_MOVE(x) ((u16)(((x) & WOTBL_MOVE_MASK) >> WOTBL_MOVE_SHIFT))
#define WOTBL_LVL(x) ((u8)(((x) & WOTBL_LVL_MASK) >> WOTBL_LVL_SHIFT))

#define WAZA_APPEND_FULL    0xFFFFu
#define WAZA_APPEND_KNOWN   0xFFFEu

void InitBoxMonMoveset(BOXMON * boxmon) {
    BOOL decry;
    u16 * wotbl;
    int i;
    u16 species;
    u32 forme;
    u8 level;
    u16 move;
    wotbl = AllocFromHeap(0, 22 * sizeof(u16));
    decry = AcquireBoxMonLock(boxmon);
    species = (u16)GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL);
    forme = GetBoxMonData(boxmon, MON_DATA_FORME, NULL);
    level = (u8)CalcBoxMonLevel(boxmon);
    LoadWotbl_HandleAlternateForme(species, (int)forme, wotbl);
    for (i = 0; wotbl[i] != WOTBL_END; i++) {
        if ((wotbl[i] & WOTBL_LVL_MASK) > (level << WOTBL_LVL_SHIFT))
            break;
        move = WOTBL_MOVE(wotbl[i]);
        if (TryAppendBoxMonMove(boxmon, move) == WAZA_APPEND_FULL)
            DeleteBoxMonFirstMoveAndAppend(boxmon, move);
    }
    FreeToHeap(wotbl);
    ReleaseBoxMonLock(boxmon, decry);
}

u32 TryAppendMonMove(POKEMON *pokemon, u16 move) {
    return TryAppendBoxMonMove(Mon_GetBoxMon(pokemon), move);
}

u32 TryAppendBoxMonMove(BOXMON *boxmon, u16 move) {
    u32 ret = WAZA_APPEND_FULL;
    int i;
    BOOL decry = AcquireBoxMonLock(boxmon);
    u16 cur_move;
    for (i = 0; i < 4; i++) {
        cur_move = (u16)GetBoxMonData(boxmon, MON_DATA_MOVE1 + i, NULL);
        if (cur_move == MOVE_NONE) {
            BoxMonSetMoveInSlot(boxmon, move, (u8)i);
            ret = move;
            break;
        }
        if (cur_move == move) {
            ret = WAZA_APPEND_KNOWN;
            break;
        }
    }
    ReleaseBoxMonLock(boxmon, decry);
    return ret;
}

void DeleteMonFirstMoveAndAppend(POKEMON *pokemon, u16 move_id) {
    DeleteBoxMonFirstMoveAndAppend(Mon_GetBoxMon(pokemon), move_id);
}

void DeleteBoxMonFirstMoveAndAppend(BOXMON * boxmon, u16 move) {
    BOOL decry = AcquireBoxMonLock(boxmon);
    int i;
    u16 moves[4];
    u8 pp[4];
    u8 ppUp[4];

    for (i = 0; i < 3; i++) {
        moves[i] = (u16)GetBoxMonData(boxmon, MON_DATA_MOVE1 + i + 1, NULL);
        pp[i] = (u8)GetBoxMonData(boxmon, MON_DATA_MOVE1PP + i + 1, NULL);
        ppUp[i] = (u8)GetBoxMonData(boxmon, MON_DATA_MOVE1PPUP + i + 1, NULL);
    }

    moves[3] = move;
    pp[3] = (u8)GetWazaAttr(move, MOVEATTR_PP);
    ppUp[3] = 0;

    for (i = 0; i < 4; i++) {
        SetBoxMonData(boxmon, MON_DATA_MOVE1 + i, &moves[i]);
        SetBoxMonData(boxmon, MON_DATA_MOVE1PP + i, &pp[i]);
        SetBoxMonData(boxmon, MON_DATA_MOVE1PPUP + i, &ppUp[i]);
    }

    ReleaseBoxMonLock(boxmon, decry);
}

void MonSetMoveInSlot_ResetPpUp(POKEMON* pokemon, u16 move, u8 slot) {
    int pp;
    int ppUp;

    MonSetMoveInSlot(pokemon, move, slot);
    ppUp = 0;
    SetMonData(pokemon, MON_DATA_MOVE1PPUP + slot, &ppUp);
    pp = WazaGetMaxPp(move, 0);
    SetMonData(pokemon, MON_DATA_MOVE1PP + slot, &pp);
}

void MonSetMoveInSlot(POKEMON* pokemon, u16 move, u8 slot) {
    BoxMonSetMoveInSlot(&pokemon->box, move, slot);
}

void BoxMonSetMoveInSlot(BOXMON* boxmon, u16 move, u8 slot) {
    u8 ppUp;
    u8 pp;

    SetBoxMonData(boxmon, MON_DATA_MOVE1 + slot, &move);
    ppUp = (u8)GetBoxMonData(boxmon, MON_DATA_MOVE1PPUP + slot, NULL);
    pp = (u8)WazaGetMaxPp(move, ppUp);
    SetBoxMonData(boxmon, MON_DATA_MOVE1PP + slot, &pp);
}

u32 MonTryLearnMoveOnLevelUp(POKEMON * pokemon, int * last_i, u16 * sp0)
{
    u32 ret = 0;
    u16 * wotbl = AllocFromHeap(0, 22 * sizeof(u16));
    u16 species = (u16)GetMonData(pokemon, MON_DATA_SPECIES, NULL);
    u32 forme = GetMonData(pokemon, MON_DATA_FORME, NULL);
    u8 level = (u8)GetMonData(pokemon, MON_DATA_LEVEL, NULL);
    LoadWotbl_HandleAlternateForme(species, (int)forme, wotbl);

    if (wotbl[*last_i] == WOTBL_END) {
        FreeToHeap(wotbl);
        return 0;
    }
    while ((wotbl[*last_i] & WOTBL_LVL_MASK) != (level << WOTBL_LVL_SHIFT)) {
        (*last_i)++;
        if (wotbl[*last_i] == WOTBL_END) {
            FreeToHeap(wotbl);
            return 0;
        }
    }
    if ((wotbl[*last_i] & WOTBL_LVL_MASK) == (level << WOTBL_LVL_SHIFT)) {
        *sp0 = WOTBL_MOVE(wotbl[*last_i]);
        (*last_i)++;
        ret = TryAppendMonMove(pokemon, *sp0);
    }
    FreeToHeap(wotbl);
    return ret;
}

void MonSwapMoves(POKEMON *pokemon, int a, int b) {
    BoxMonSwapMoves(&pokemon->box, a, b);
}

void BoxMonSwapMoves(BOXMON * boxmon, int slot1, int slot2) {
    u16 moves[2];
    u8 pp[2];
    u8 ppUp[2];

    moves[0] = (u16)GetBoxMonData(boxmon, MON_DATA_MOVE1 + slot1, NULL);
    pp[0] = (u8)GetBoxMonData(boxmon, MON_DATA_MOVE1PP + slot1, NULL);
    ppUp[0] = (u8)GetBoxMonData(boxmon, MON_DATA_MOVE1PPUP + slot1, NULL);
    moves[1] = (u16)GetBoxMonData(boxmon, MON_DATA_MOVE1 + slot2, NULL);
    pp[1] = (u8)GetBoxMonData(boxmon, MON_DATA_MOVE1PP + slot2, NULL);
    ppUp[1] = (u8)GetBoxMonData(boxmon, MON_DATA_MOVE1PPUP + slot2, NULL);

    SetBoxMonData(boxmon, MON_DATA_MOVE1 + slot1, &moves[1]);
    SetBoxMonData(boxmon, MON_DATA_MOVE1PP + slot1, &pp[1]);
    SetBoxMonData(boxmon, MON_DATA_MOVE1PPUP + slot1, &ppUp[1]);
    SetBoxMonData(boxmon, MON_DATA_MOVE1 + slot2, &moves[0]);
    SetBoxMonData(boxmon, MON_DATA_MOVE1PP + slot2, &pp[0]);
    SetBoxMonData(boxmon, MON_DATA_MOVE1PPUP + slot2, &ppUp[0]);
}

void MonDeleteMoveSlot(POKEMON * pokemon, u32 slot) {
    u16 move;
    u8 pp;
    u8 ppUp;
    for (; slot < 3; slot++) {
        move = (u16)GetMonData(pokemon, (int)(MON_DATA_MOVE1 + slot + 1), NULL);
        pp = (u8)GetMonData(pokemon, (int)(MON_DATA_MOVE1PP + slot + 1), NULL);
        ppUp = (u8)GetMonData(pokemon, (int)(MON_DATA_MOVE1PPUP + slot + 1), NULL);
        SetMonData(pokemon, (int)(MON_DATA_MOVE1 + slot), &move);
        SetMonData(pokemon, (int)(MON_DATA_MOVE1PP + slot), &pp);
        SetMonData(pokemon, (int)(MON_DATA_MOVE1PPUP + slot), &ppUp);
    }
    move = MOVE_NONE;
    pp = 0;
    ppUp = 0;
    SetMonData(pokemon, MON_DATA_MOVE1 + 3, &move);
    SetMonData(pokemon, MON_DATA_MOVE1PP + 3, &pp);
    SetMonData(pokemon, MON_DATA_MOVE1PPUP + 3, &ppUp);
}

BOOL MonHasMove(POKEMON* pokemon, u16 move) {
    int i;
    for (i = 0; i < 4; i++) {
        if (GetMonData(pokemon, MON_DATA_MOVE1 + i, NULL) == move) {
            break;
        }
    }
    if (i != 4) {
        return TRUE;
    } else {
        return FALSE;
    }
}

void CopyBoxPokemonToPokemon(const BOXMON * src, POKEMON * dest) {
    u32 sp0 = 0;
    CAPSULE sp4;
    struct Mail * mail;
    dest->box = *src;
    if (dest->box.box_lock)
        dest->box.party_lock = TRUE;
    SetMonData(dest, MON_DATA_STATUS, &sp0);
    SetMonData(dest, MON_DATA_HP, &sp0);
    SetMonData(dest, MON_DATA_MAXHP, &sp0);
    mail = Mail_new(0);
    SetMonData(dest, MON_DATA_MAIL_STRUCT, mail);
    FreeToHeap(mail);
    SetMonData(dest, MON_DATA_CAPSULE, &sp0);
    MI_CpuClearFast(&sp4, sizeof(sp4));
    SetMonData(dest, MON_DATA_SEAL_COORDS, &sp4);
    CalcMonLevelAndStats(dest);
}

u8 Party_GetMaxLevel(SAVE_PARTY_T * party) {
    int i;
    int r7 = GetPartyCount(party);
    u8 ret = 1;
    u8 level;
    for (i = 0; i < r7; i++) {
        POKEMON * pokemon = GetPartyMonByIndex(party, i);
        if (GetMonData(pokemon, MON_DATA_SPECIES, NULL) != SPECIES_NONE
            && !GetMonData(pokemon, MON_DATA_IS_EGG, NULL)) {
            level = (u8)GetMonData(pokemon, MON_DATA_LEVEL, NULL);
            if (level > ret)
                ret = level;
        }
    }
    return ret;
}

u16 SpeciesToJohtoDexNo(u16 species) {
    u16 ret;
    ReadFromNarcMemberByIdPair(&ret, NARC_poketool_johtozukan, 0, species * sizeof(u16), sizeof(u16));
    return ret;
}

u16 *LoadSpeciesToJohtoDexNoLUT(void) {
    return AllocAtEndAndReadWholeNarcMemberByIdPair(NARC_poketool_johtozukan, 0, 3);
}

void CopyPokemonToPokemon(const POKEMON *src, POKEMON *dest) {
    *dest = *src;
}

void CopyPokemonToBoxPokemon(const POKEMON *src, BOXMON *dest) {
    *dest = src->box;
}

void CopyBoxPokemonToBoxPokemon(const BOXMON *src, BOXMON *dest) {
    *dest = *src;
}

s8 MonGetFlavorPreference(POKEMON * pokemon, int flavor) {
    return BoxMonGetFlavorPreference(&pokemon->box, flavor);
}

s8 BoxMonGetFlavorPreference(BOXMON * boxmon, int flavor) {
    u32 personality = GetBoxMonData(boxmon, MON_DATA_PERSONALITY, NULL);
    return GetFlavorPreferenceFromPID(personality, flavor);
}

s8 GetFlavorPreferenceFromPID(u32 personality, int flavor) {
    return sFlavorPreferencesByNature[GetNatureFromPersonality(personality)][flavor];
}

int Species_LoadLearnsetTable(u16 species, u32 forme, u16 * dest) {
    int i;
    u16 * wotbl = AllocFromHeap(0, 22 * sizeof(u16));
    LoadWotbl_HandleAlternateForme(species, (int)forme, wotbl);
    for (i = 0; wotbl[i] != WOTBL_END; i++) {
        dest[i] = WOTBL_MOVE(wotbl[i]);
    }
    FreeToHeap(wotbl);
    return i;
}

void Party_GivePokerusAtRandom(SAVE_PARTY_T * party) {
    int count = GetPartyCount(party);
    int idx;
    POKEMON * pokemon;
    u8 sp0;
    switch (LCRandom()) {
    case 0x4000:
    case 0x8000:
    case 0xC000:
        do {
            idx = LCRandom() % count;
            pokemon = GetPartyMonByIndex(party, idx);
        } while (GetMonData(pokemon, MON_DATA_SPECIES, NULL) == SPECIES_NONE || GetMonData(pokemon, MON_DATA_IS_EGG, NULL));
        if (!Party_MaskMonsWithPokerus(party, (u8)MaskOfFlagNo(idx))) {
            do {
                sp0 = (u8)LCRandom();
            } while (!(sp0 & 7));
            if (sp0 & 0xF0) {
                sp0 &= 7;
            }
            sp0 |= sp0 << 4;
            sp0 &= 0xF3;
            sp0++;
            SetMonData(pokemon, MON_DATA_POKERUS, &sp0);
        }
    }
}

u8 Party_MaskMonsWithPokerus(SAVE_PARTY_T * party, u8 mask) {
    int i = 0;
    u32 flag = 1;
    u8 ret = 0;
    POKEMON * pokemon;
    if (mask != 0) {
        do {
            if (mask & 1) {
                pokemon = GetPartyMonByIndex(party, i);
                if (GetMonData(pokemon, MON_DATA_POKERUS, NULL)) {
                    ret |= flag;
                }
            }
            i++;
            flag <<= 1;
            mask >>= 1;
        }
        while (mask != 0);
    } else {
        pokemon = GetPartyMonByIndex(party, 0);
        if (GetMonData(pokemon, MON_DATA_POKERUS, NULL))
            ret++;
    }
    return ret;
}

void Party_UpdatePokerus(SAVE_PARTY_T * party, int r5)
{
    int i;
    u8 pokerus;
    POKEMON * pokemon;
    int count = GetPartyCount(party);
    for (i = 0; i < count; i++) {
        pokemon = GetPartyMonByIndex(party, i);
        if (GetMonData(pokemon, MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
            pokerus = (u8)GetMonData(pokemon, MON_DATA_POKERUS, NULL);
            if (pokerus & 0xF) {
                if ((pokerus & 0xF) < r5 || r5 > 4) {
                    pokerus &= 0xF0;
                } else {
                    pokerus -= r5;
                }
                if (pokerus == 0) {
                    pokerus = 0x10; // immune
                }
                SetMonData(pokemon, MON_DATA_POKERUS, &pokerus);
            }
        }
    }
}

void Party_SpreadPokerus(SAVE_PARTY_T * party)
{
    int count = GetPartyCount(party);
    int i;
    POKEMON * pokemon;
    u8 pokerus;
    if ((LCRandom() % 3) == 0) {
        for (i = 0; i < count; i++) {
            pokemon = GetPartyMonByIndex(party, i);
            if (GetMonData(pokemon, MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
                pokerus = (u8)GetMonData(pokemon, MON_DATA_POKERUS, NULL);
                if (pokerus & 0xF) {
                    if (i != 0) {
                        pokemon = GetPartyMonByIndex(party, i - 1);
                        if (!(GetMonData(pokemon, MON_DATA_POKERUS, NULL) & 0xF0)) {
                            SetMonData(pokemon, MON_DATA_POKERUS, &pokerus);
                        }
                    }
                    if (i < count - 1) {
                        pokemon = GetPartyMonByIndex(party, i + 1);
                        if (!(GetMonData(pokemon, MON_DATA_POKERUS, NULL) & 0xF0)) {
                            SetMonData(pokemon, MON_DATA_POKERUS, &pokerus);
                            i++; // don't infect the rest of the party
                        }
                    }
                }
            }
        }
    }
}

BOOL Pokemon_HasPokerus(POKEMON * pokemon) {
    return BoxMon_HasPokerus(&pokemon->box);
}

BOOL BoxMon_HasPokerus(BOXMON * boxmon) {
    return (GetBoxMonData(boxmon, MON_DATA_POKERUS, NULL) & 0xF) != 0;
}

BOOL Pokemon_IsImmuneToPokerus(POKEMON * pokemon) {
    return BoxMon_IsImmuneToPokerus(&pokemon->box);
}

BOOL BoxMon_IsImmuneToPokerus(BOXMON * boxmon) {
    u8 pokerus = (u8)GetBoxMonData(boxmon, MON_DATA_POKERUS, NULL);
    if (pokerus & 0xF) {
        return FALSE;
    }
    if (pokerus & 0xF0) {
        return TRUE;
    }
    return FALSE;
}

void Pokemon_UpdateArceusForme(POKEMON * pokemon) {
    BoxMon_UpdateArceusForme(&pokemon->box);
}

void BoxMon_UpdateArceusForme(BOXMON * boxmon) {
    u32 species = GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL);
    u32 ability = GetBoxMonData(boxmon, MON_DATA_ABILITY, NULL);
    u32 heldItem = GetBoxMonData(boxmon, MON_DATA_HELD_ITEM, NULL);
    u32 forme;
    if (species == SPECIES_ARCEUS && ability == ABILITY_MULTITYPE) {
        forme = GetArceusTypeByHeldItemEffect((u16)GetItemAttr((u16)heldItem, 1, 0));
        SetBoxMonData(boxmon, MON_DATA_FORME, &forme);
    }
}

u32 GetArceusTypeByHeldItemEffect(u16 heldEffect) {
    switch (heldEffect) {
    case HOLD_EFFECT_ARCEUS_FIRE:
        return TYPE_FIRE;
    case HOLD_EFFECT_ARCEUS_WATER:
        return TYPE_WATER;
    case HOLD_EFFECT_ARCEUS_ELECTRIC:
        return TYPE_ELECTRIC;
    case HOLD_EFFECT_ARCEUS_GRASS:
        return TYPE_GRASS;
    case HOLD_EFFECT_ARCEUS_ICE:
        return TYPE_ICE;
    case HOLD_EFFECT_ARCEUS_FIGHT:
        return TYPE_FIGHTING;
    case HOLD_EFFECT_ARCEUS_POISON:
        return TYPE_POISON;
    case HOLD_EFFECT_ARCEUS_GROUND:
        return TYPE_GROUND;
    case HOLD_EFFECT_ARCEUS_FLYING:
        return TYPE_FLYING;
    case HOLD_EFFECT_ARCEUS_PSYCHIC:
        return TYPE_PSYCHIC;
    case HOLD_EFFECT_ARCEUS_BUG:
        return TYPE_BUG;
    case HOLD_EFFECT_ARCEUS_ROCK:
        return TYPE_ROCK;
    case HOLD_EFFECT_ARCEUS_GHOST:
        return TYPE_GHOST;
    case HOLD_EFFECT_ARCEUS_DRAGON:
        return TYPE_DRAGON;
    case HOLD_EFFECT_ARCEUS_DARK:
        return TYPE_DARK;
    case HOLD_EFFECT_ARCEUS_STEEL:
        return TYPE_STEEL;
    default:
        return TYPE_NORMAL;
    }
}

s32 Mon_UpdateGiratinaForme(POKEMON *pokemon) {
    s32 ret = BoxMon_UpdateGiratinaForme(&pokemon->box);
    if (ret != -1) {
        CalcMonLevelAndStats(pokemon);
    }
    return ret;
}

s32 BoxMon_UpdateGiratinaForme(BOXMON *boxmon) {
    int species = GetBoxMonData(boxmon, MON_DATA_SPECIES, NULL);
    int heldItem = GetBoxMonData(boxmon, MON_DATA_HELD_ITEM, NULL);
    int forme;
    if (species == SPECIES_GIRATINA) {
        if (heldItem == ITEM_GRISEOUS_ORB) {
            forme = GIRATINA_ORIGIN;
        } else {
            forme = GIRATINA_ALTERED;
        }
        SetBoxMonData(boxmon, MON_DATA_FORME, &forme);
        UpdateBoxMonAbility(boxmon);
        return forme;
    }
    return -1;
}

void Mon_ForceSetGiratinaOriginForme(POKEMON *pokemon) {
    s32 forme = GIRATINA_ORIGIN;
    if (GetMonData(pokemon, MON_DATA_SPECIES, NULL) == SPECIES_GIRATINA) {
        SetBoxMonData(&pokemon->box, MON_DATA_FORME, &forme);
        UpdateBoxMonAbility(&pokemon->box);
        CalcMonLevelAndStats(pokemon);
    }
}

void sub_02071D3C(SAVE_PARTY_T *party, BOOL force_origin) {
    int npoke = GetPartyCount(party);
    int i;
    POKEMON *pokemon;
    for (i = 0; i < npoke; i++) {
        pokemon = GetPartyMonByIndex(party, i);
        if (force_origin) {
            Mon_ForceSetGiratinaOriginForme(pokemon);
        } else {
            Mon_UpdateGiratinaForme(pokemon);
        }
    }
}
