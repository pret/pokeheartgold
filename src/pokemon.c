#include "pokemon.h"
#include "math_util.h"
#include "seal_case.h"
#include "move.h"
#include "item.h"
#include "msgdata.h"
#include "map_section.h"
#include "constants/items.h"
#include "constants/moves.h"
#include "constants/balls.h"
#include "constants/abilities.h"
#include "constants/map_sections.h"

u32 _021D421C[MAX_LEVEL + 1];

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
void AddMonDataInternal(POKEMON * pokemon, int attr, const void * data);
void AddBoxMonDataInternal(BOXMON * boxmon, int attr, const void * data);
PokemonDataBlock *GetSubstruct(BOXMON *boxmon, u32 pid, u8 which_struct);

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
    } else
        SetBoxMonData(boxPokemon, MON_DATA_ABILITY, &exp);
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
