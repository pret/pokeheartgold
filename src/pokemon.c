#include "pokemon.h"

#include "global.h"

#include "constants/abilities.h"
#include "constants/balls.h"
#include "constants/items.h"
#include "constants/map_sections.h"
#include "constants/moves.h"
#include "constants/trainer_class.h"

#include "gf_rtc.h"
#include "item.h"
#include "mail.h"
#include "map_section.h"
#include "math_util.h"
#include "move.h"
#include "msgdata.h"
#include "party.h"
#include "seal_case.h"
#include "sound_02004A44.h"
#include "sprite.h"
#include "sprite_system.h"
#include "trainer_data.h"
#include "trainer_memo.h"
#include "unk_02016EDC.h"
#include "unk_02078834.h"

void MonEncryptSegment(void *data, u32 size, u32 key);
void MonDecryptSegment(void *data, u32 size, u32 key);
u32 CalcMonChecksum(void *data, u32 size);
void BoxPokemon_SetDefaultMoves(BoxPokemon *boxMon);
void LoadMonBaseStats_HandleAlternateForm(int species, int form, BASE_STATS *dest);
u16 ModifyStatByNature(u8 nature, u16 stat, u8 statID);
static u32 Pokemon_GetDataInternal(Pokemon *mon, int attr, void *dest);
static u32 BoxPokemon_GetDataInternal(BoxPokemon *boxMon, int attr, void *dest);
static void Pokemon_SetDataInternal(Pokemon *mon, int attr, const void *data);
static void BoxPokemon_SetDataInternal(BoxPokemon *boxMon, int attr, const void *data);
static void AddMonDataInternal(Pokemon *mon, int attr, int value);
static void AddBoxMonDataInternal(BoxPokemon *boxMon, int attr, int value);
PokemonDataBlock *GetSubstruct(BoxPokemon *boxMon, u32 pid, u8 which_struct);
void LoadMonPersonal(int species, BASE_STATS *dest);
int ResolveMonForm(int species, int form);
u8 GetGenderBySpeciesAndPersonality_PreloadedPersonal(const BASE_STATS *personal, u16 species, u32 pid);
u32 MaskOfFlagNo(int flagno);
void GetBoxmonSpriteCharAndPlttNarcIds(PokePicTemplate *pokepicTemplate, BoxPokemon *boxMon, u8 whichFacing, BOOL a3);
void DP_GetMonSpriteCharAndPlttNarcIdsEx(PokePicTemplate *pokepicTemplate, u16 species, u8 gender, u8 whichFacing, u8 shiny, u8 form, u32 pid);
void GetMonSpriteCharAndPlttNarcIdsEx(PokePicTemplate *pokepicTemplate, u16 species, u8 gender, u8 whichFacing, u8 shiny, u8 form, u32 pid);
u8 sub_02070438(u16 species, u8 form);
u8 BoxPokemon_SpriteYOffset(BoxPokemon *boxMon, u8 whichFacing, BOOL a2);
u8 GetMonPicHeightBySpeciesGenderForm_PBR(u16 species, u8 gender, u8 whichFacing, u8 form, u32 pid);
u8 GetMonPicHeightBySpeciesGenderForm(u16 species, u8 gender, u8 whichFacing, u8 form, u32 pid);
void sub_02070D3C(s32 trainer_class, s32 a1, BOOL a2, struct UnkStruct_02070D3C *a3);
int TrainerClassToBackpicID(int trainer_class, int a1);
void LoadMonEvolutionTable(u16 species, struct Evolution *evoTable);
BOOL Pokemon_HasMove(Pokemon *mon, u16 move_id);
void sub_0207213C(BoxPokemon *boxMon, PlayerProfile *playerProfile, u32 pokeball, u32 a3, u32 encounterType, HeapID heapID);
void sub_02072190(BoxPokemon *boxMon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, HeapID heapID);

#define ENCRY_ARGS_PTY(mon)    (u16 *)&(mon)->party, sizeof((mon)->party), (mon)->box.personality
#define ENCRY_ARGS_BOX(boxMon) (u16 *)&(boxMon)->substructs, sizeof((boxMon)->substructs), (boxMon)->checksum
#define ENCRYPT_PTY(mon)       MonEncryptSegment(ENCRY_ARGS_PTY(mon))
#define ENCRYPT_BOX(boxMon)    MonEncryptSegment(ENCRY_ARGS_BOX(boxMon))
#define DECRYPT_PTY(mon)       MonDecryptSegment(ENCRY_ARGS_PTY(mon))
#define DECRYPT_BOX(boxMon)    MonDecryptSegment(ENCRY_ARGS_BOX(boxMon))
#define CHECKSUM(boxMon)       CalcMonChecksum((u16 *)(boxMon)->substructs, sizeof((boxMon)->substructs))
#define SHINY_CHECK(otid, pid) ((                                                                                                              \
                                    (((otid) & 0xFFFF0000u) >> 16u) ^ ((otid) & 0xFFFFu) ^ (((pid) & 0xFFFF0000u) >> 16u) ^ ((pid) & 0xFFFFu)) \
    < 8u)
#define CALC_UNOWN_LETTER(pid) ((u32)((((pid) & 0x3000000) >> 18) | (((pid) & 0x30000) >> 12) | (((pid) & 0x300) >> 6) | (((pid) & 0x3) >> 0)) % 28u)

static const s8 sFlavorPreferencesByNature[NATURE_NUM][FLAVOR_MAX] = {
    { 0,  0,  0,  0,  0  },
    { 1,  0,  0,  0,  -1 },
    { 1,  0,  -1, 0,  0  },
    { 1,  -1, 0,  0,  0  },
    { 1,  0,  0,  -1, 0  },
    { -1, 0,  0,  0,  1  },
    { 0,  0,  0,  0,  0  },
    { 0,  0,  -1, 0,  1  },
    { 0,  -1, 0,  0,  1  },
    { 0,  0,  0,  -1, 1  },
    { -1, 0,  1,  0,  0  },
    { 0,  0,  1,  0,  -1 },
    { 0,  0,  0,  0,  0  },
    { 0,  -1, 1,  0,  0  },
    { 0,  0,  1,  -1, 0  },
    { -1, 1,  0,  0,  0  },
    { 0,  1,  0,  0,  -1 },
    { 0,  1,  -1, 0,  0  },
    { 0,  0,  0,  0,  0  },
    { 0,  1,  0,  -1, 0  },
    { -1, 0,  0,  1,  0  },
    { 0,  0,  0,  1,  -1 },
    { 0,  0,  -1, 1,  0  },
    { 0,  -1, 0,  1,  0  },
    { 0,  0,  0,  0,  0  },
};

void Pokemon_Init(Pokemon *mon)
{
    MI_CpuClearFast(mon, sizeof(Pokemon));
    ENCRYPT_BOX(&mon->box);
    ENCRYPT_PTY(mon);
}

void BoxPokemon_Init(BoxPokemon *boxMon)
{
    MI_CpuClearFast(boxMon, sizeof(BoxPokemon));
    ENCRYPT_BOX(boxMon);
}

u32 Pokemon_StructSize(void)
{
    return sizeof(Pokemon);
}

Pokemon *Pokemon_New(HeapID heapID) {
    Pokemon *mon = AllocFromHeap(heapID, sizeof(Pokemon));
    Pokemon_Init(mon);
    return mon;
}

BOOL AcquireMonLock(Pokemon *mon) {
    BOOL locked = FALSE;
    if (!mon->box.party_lock) {
        locked = TRUE;
        GF_ASSERT(!mon->box.box_lock);
        mon->box.party_lock = TRUE;
        mon->box.box_lock = TRUE;
        DECRYPT_PTY(mon);
        DECRYPT_BOX(&mon->box);
    }
    return locked;
}

BOOL ReleaseMonLock(Pokemon *mon, BOOL locked)
{
    BOOL prev = FALSE;
    if (mon->box.party_lock == TRUE && locked == TRUE) {
        prev = TRUE;
        mon->box.party_lock = FALSE;
        mon->box.box_lock = FALSE;
        ENCRYPT_PTY(mon);
        mon->box.checksum = CHECKSUM(&mon->box);
        ENCRYPT_BOX(&mon->box);
    }
    return prev;
}

BOOL AcquireBoxMonLock(BoxPokemon *boxMon)
{
    BOOL locked = FALSE;
    if (!boxMon->box_lock) {
        locked = TRUE;
        boxMon->box_lock = TRUE;
        DECRYPT_BOX(boxMon);
    }
    return locked;
}

BOOL ReleaseBoxMonLock(BoxPokemon *boxMon, BOOL locked)
{
    BOOL prev = FALSE;
    if (boxMon->box_lock == TRUE && locked == TRUE) {
        prev = TRUE;
        boxMon->box_lock = FALSE;
        boxMon->checksum = CHECKSUM(boxMon);
        ENCRYPT_BOX(boxMon);
    }
    return prev;
}
void Pokemon_Create(Pokemon *mon, int species, int level, int fixedIV, int hasFixedPersonality, int fixedPersonality, int otIdType, int fixedOtId)
{
    Pokemon_Init(mon);
    BoxPokemon_Create(&mon->box, species, level, fixedIV, hasFixedPersonality, fixedPersonality, otIdType, fixedOtId);
    // Not your average encryption call
    MonEncryptSegment((u16 *)&mon->party, sizeof(mon->party), 0);
    ENCRYPT_PTY(mon);
    Pokemon_SetData(mon, MON_DATA_LEVEL, &level);

    Mail *mail = Mail_New(HEAP_ID_DEFAULT);
    Pokemon_SetData(mon, MON_DATA_MAIL, mail);
    FreeToHeap(mail);

    u32 zero = 0;
    Pokemon_SetData(mon, MON_DATA_BALL_CAPSULE_ID, &zero);

    BallCapsule seal_coords;
    MI_CpuClearFast(&seal_coords, sizeof(seal_coords));
    Pokemon_SetData(mon, MON_DATA_BALL_CAPSULE, &seal_coords);
    Pokemon_CalcLevelAndStats(mon);
}

void BoxPokemon_Create(BoxPokemon *boxMon, int species, int level, int fixedIV, int hasFixedPersonality, int fixedPersonality, int otIdType, int fixedOtId)
{
    BOOL decry;
    u32 exp;
    u32 iv;
    BoxPokemon_Init(boxMon);
    decry = AcquireBoxMonLock(boxMon);
    if (hasFixedPersonality == 0) {
        fixedPersonality = (LCRandom() | (LCRandom() << 16));
    }
    BoxPokemon_SetData(boxMon, MON_DATA_PERSONALITY, &fixedPersonality);
    if (otIdType == 2) {
        do {
            fixedOtId = (LCRandom() | (LCRandom() << 16));
        } while (SHINY_CHECK(fixedOtId, fixedPersonality));
    } else if (otIdType != 1) {
        fixedOtId = 0;
    }
    BoxPokemon_SetData(boxMon, MON_DATA_OT_ID, &fixedOtId);
    BoxPokemon_SetData(boxMon, MON_DATA_LANGUAGE, (void *)&gGameLanguage);
    BoxPokemon_SetData(boxMon, MON_DATA_SPECIES, &species);
    BoxPokemon_SetData(boxMon, MON_DATA_SPECIES_NAME, NULL);
    exp = GetMonExpBySpeciesAndLevel(species, level);
    BoxPokemon_SetData(boxMon, MON_DATA_EXP, &exp);
    exp = (u32)GetMonBaseStat(species, BASE_FRIENDSHIP);
    BoxPokemon_SetData(boxMon, MON_DATA_FRIENDSHIP, &exp);
    BoxPokemon_SetData(boxMon, MON_DATA_MET_LEVEL, &level);
    BoxPokemon_SetData(boxMon, MON_DATA_MET_GAME, (void *)&gGameVersion);
    exp = ITEM_POKE_BALL;
    BoxPokemon_SetData(boxMon, MON_DATA_POKEBALL, &exp);
    BoxPokemon_SetData(boxMon, MON_DATA_DP_POKEBALL, &exp);
    if (fixedIV < 0x20) {
        BoxPokemon_SetData(boxMon, MON_DATA_HP_IV, &fixedIV);
        BoxPokemon_SetData(boxMon, MON_DATA_ATK_IV, &fixedIV);
        BoxPokemon_SetData(boxMon, MON_DATA_DEF_IV, &fixedIV);
        BoxPokemon_SetData(boxMon, MON_DATA_SPEED_IV, &fixedIV);
        BoxPokemon_SetData(boxMon, MON_DATA_SPATK_IV, &fixedIV);
        BoxPokemon_SetData(boxMon, MON_DATA_SPDEF_IV, &fixedIV);
    } else {
        exp = LCRandom();
        iv = exp & 0x1F;
        BoxPokemon_SetData(boxMon, MON_DATA_HP_IV, &iv);
        iv = (exp & 0x3E0) >> 5;
        BoxPokemon_SetData(boxMon, MON_DATA_ATK_IV, &iv);
        iv = (exp & 0x7C00) >> 10;
        BoxPokemon_SetData(boxMon, MON_DATA_DEF_IV, &iv);
        exp = LCRandom();
        iv = exp & 0x1F;
        BoxPokemon_SetData(boxMon, MON_DATA_SPEED_IV, &iv);
        iv = (exp & 0x3E0) >> 5;
        BoxPokemon_SetData(boxMon, MON_DATA_SPATK_IV, &iv);
        iv = (exp & 0x7C00) >> 10;
        BoxPokemon_SetData(boxMon, MON_DATA_SPDEF_IV, &iv);
    }
    exp = (u32)GetMonBaseStat(species, BASE_ABILITY_1);
    iv = (u32)GetMonBaseStat(species, BASE_ABILITY_2);
    if (iv != 0) {
        if (fixedPersonality & 1) {
            BoxPokemon_SetData(boxMon, MON_DATA_ABILITY, &iv);
        } else {
            BoxPokemon_SetData(boxMon, MON_DATA_ABILITY, &exp);
        }
    } else {
        BoxPokemon_SetData(boxMon, MON_DATA_ABILITY, &exp);
    }
    exp = BoxPokemon_GetGender(boxMon);
    BoxPokemon_SetData(boxMon, MON_DATA_GENDER, &exp);
    BoxPokemon_SetDefaultMoves(boxMon);
    ReleaseBoxMonLock(boxMon, decry);
}

void Pokemon_CreateWithNature(Pokemon *mon, u16 species, u8 level, u8 fixedIVs, u8 nature) {
    u32 personality;
    do {
        personality = (u32)(LCRandom() | (LCRandom() << 16));
    } while (nature != Pokemon_GetNatureOf(personality));
    Pokemon_Create(mon, (int)species, (int)level, (int)fixedIVs, TRUE, (int)personality, (int)0, (int)0);
}

void Pokemon_CreateWithGenderNatureLetter(Pokemon *mon, u16 species, u8 level, u8 fixedIv, u8 gender, u8 nature, u8 letter) {
    u32 pid = 0;
    u16 test = 0;
    if (letter != 0 && letter < 29) {
        do {
            pid = (u32)(LCRandom() | (LCRandom() << 16));
            test = (u16)CALC_UNOWN_LETTER(pid);
        } while (nature != Pokemon_GetNatureOf(pid) || gender != Species_GetGender(species, pid) || test != letter - 1);
    } else {
        pid = GenPersonalityByGenderAndNature(species, gender, nature);
    }
    Pokemon_Create(mon, (int)species, (int)level, (int)fixedIv, 1, (int)pid, 0, 0);
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

void CreateMonWithFixedIVs(Pokemon *mon, int species, int level, int ivs, int personality) {
    Pokemon_Create(mon, species, level, 0, 1, personality, 0, 0);
    Pokemon_SetData(mon, MON_DATA_IVS_WORD, &ivs);
    Pokemon_CalcLevelAndStats(mon);
}

void Pokemon_CalcLevelAndStats(Pokemon *mon) {
    BOOL decry = AcquireMonLock(mon);
    u32 level = (u32)Pokemon_GetLevel(mon);
    Pokemon_SetData(mon, MON_DATA_LEVEL, &level);
    Pokemon_CalcStats(mon);
    ReleaseMonLock(mon, decry);
}

void Pokemon_CalcStats(Pokemon *mon)
{
    int maxHp;
    int hp;
    int hpIV, atkIV, defIV, speedIV, spAtkIV, spDefIV;
    int hpEV, atkEV, defEV, speedEV, spAtkEV, spDefEV;
    int newMaxHp, newAtk, newDef, newSpeed, newSpAtk, newSpDef;
    int form;
    int species;

    BOOL decry = AcquireMonLock(mon);
    int level = Pokemon_GetData(mon, MON_DATA_LEVEL, NULL);
    maxHp = Pokemon_GetData(mon, MON_DATA_MAX_HP, NULL);
    hp = Pokemon_GetData(mon, MON_DATA_HP, NULL);
    hpIV = Pokemon_GetData(mon, MON_DATA_HP_IV, NULL);
    hpEV = Pokemon_GetData(mon, MON_DATA_HP_EV, NULL);
    atkIV = Pokemon_GetData(mon, MON_DATA_ATK_IV, NULL);
    atkEV = Pokemon_GetData(mon, MON_DATA_ATK_EV, NULL);
    defIV = Pokemon_GetData(mon, MON_DATA_DEF_IV, NULL);
    defEV = Pokemon_GetData(mon, MON_DATA_DEF_EV, NULL);
    speedIV = Pokemon_GetData(mon, MON_DATA_SPEED_IV, NULL);
    speedEV = Pokemon_GetData(mon, MON_DATA_SPEED_EV, NULL);
    spAtkIV = Pokemon_GetData(mon, MON_DATA_SPATK_IV, NULL);
    spAtkEV = Pokemon_GetData(mon, MON_DATA_SPATK_EV, NULL);
    spDefIV = Pokemon_GetData(mon, MON_DATA_SPDEF_IV, NULL);
    spDefEV = Pokemon_GetData(mon, MON_DATA_SPDEF_EV, NULL);
    form = Pokemon_GetData(mon, MON_DATA_FORM, NULL);
    species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);

    BASE_STATS *baseStats = (BASE_STATS *)AllocFromHeap(HEAP_ID_DEFAULT, sizeof(BASE_STATS));
    LoadMonBaseStats_HandleAlternateForm(species, form, baseStats);

    if (species == SPECIES_SHEDINJA) {
        newMaxHp = 1;
    } else {
        newMaxHp = (baseStats->hp * 2 + hpIV + hpEV / 4) * level / 100 + level + 10;
    }
    Pokemon_SetData(mon, MON_DATA_MAX_HP, &newMaxHp);

    newAtk = (baseStats->atk * 2 + atkIV + atkEV / 4) * level / 100 + 5;
    newAtk = ModifyStatByNature(GetMonNature(mon), (u16)newAtk, STAT_ATK);
    Pokemon_SetData(mon, MON_DATA_ATK, &newAtk);

    newDef = (baseStats->def * 2 + defIV + defEV / 4) * level / 100 + 5;
    newDef = ModifyStatByNature(GetMonNature(mon), (u16)newDef, STAT_DEF);
    Pokemon_SetData(mon, MON_DATA_DEF, &newDef);

    newSpeed = (baseStats->speed * 2 + speedIV + speedEV / 4) * level / 100 + 5;
    newSpeed = ModifyStatByNature(GetMonNature(mon), (u16)newSpeed, STAT_SPEED);
    Pokemon_SetData(mon, MON_DATA_SPEED, &newSpeed);

    newSpAtk = (baseStats->spatk * 2 + spAtkIV + spAtkEV / 4) * level / 100 + 5;
    newSpAtk = ModifyStatByNature(GetMonNature(mon), (u16)newSpAtk, STAT_SPATK);
    Pokemon_SetData(mon, MON_DATA_SP_ATK, &newSpAtk);

    newSpDef = (baseStats->spdef * 2 + spDefIV + spDefEV / 4) * level / 100 + 5;
    newSpDef = ModifyStatByNature(GetMonNature(mon), (u16)newSpDef, STAT_SPDEF);
    Pokemon_SetData(mon, MON_DATA_SP_DEF, &newSpDef);

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
        Pokemon_SetData(mon, MON_DATA_HP, &hp);
    }
    ReleaseMonLock(mon, decry);
}

u32 Pokemon_GetData(Pokemon *mon, int attr, void *dest) {
    u32 ret;
    u32 checksum;
    if (!mon->box.party_lock) {
        DECRYPT_PTY(mon);
        DECRYPT_BOX(&mon->box);
        checksum = CHECKSUM(&mon->box);
        if (checksum != mon->box.checksum) {
            GF_ASSERT(checksum == mon->box.checksum);
            mon->box.invalidData = TRUE;
        }
    }
    ret = Pokemon_GetDataInternal(mon, attr, dest);
    if (!mon->box.party_lock) {
        ENCRYPT_PTY(mon);
        ENCRYPT_BOX(&mon->box);
    }
    return ret;
}

static u32 Pokemon_GetDataInternal(Pokemon *mon, int param, void *dest) {
    switch (param) {
    case MON_DATA_STATUS:
        return mon->party.status;
    case MON_DATA_LEVEL:
        return mon->party.level;
    case MON_DATA_BALL_CAPSULE_ID:
        return mon->party.ballCapsuleID;
    case MON_DATA_HP:
        return mon->party.hp;
    case MON_DATA_MAX_HP:
        return mon->party.maxHP;
    case MON_DATA_ATK:
        return mon->party.attack;
    case MON_DATA_DEF:
        return mon->party.defense;
    case MON_DATA_SPEED:
        return mon->party.speed;
    case MON_DATA_SP_ATK:
        return mon->party.spAtk;
    case MON_DATA_SP_DEF:
        return mon->party.spDef;
    case MON_DATA_MAIL:
        Mail_Copy(&mon->party.mail, dest);
        return TRUE;
    case MON_DATA_BALL_CAPSULE:
        BallCapsule_Copy(&mon->party.ballCapsule, dest);
        return TRUE;
    default:
        return BoxPokemon_GetDataInternal(&mon->box, param, dest);
    }
}

u32 BoxPokemon_GetData(BoxPokemon *boxMon, int attr, void *dest) {
    u32 ret;
    u32 checksum;
    if (!boxMon->box_lock) {
        DECRYPT_BOX(boxMon);
        checksum = CHECKSUM(boxMon);
        if (checksum != boxMon->checksum) {
            GF_ASSERT(checksum == boxMon->checksum);
            boxMon->invalidData = TRUE;
        }
    }
    ret = BoxPokemon_GetDataInternal(boxMon, attr, dest);
    if (!boxMon->box_lock) {
        ENCRYPT_BOX(boxMon);
    }
    return ret;
}

static u32 BoxPokemon_GetDataInternal(BoxPokemon *boxMon, int param, void *dest)
{
    u32 ret = 0;
    PokemonDataBlockA *blockA = &GetSubstruct(boxMon, boxMon->personality, 0)->blockA;
    PokemonDataBlockB *blockB = &GetSubstruct(boxMon, boxMon->personality, 1)->blockB;
    PokemonDataBlockC *blockC = &GetSubstruct(boxMon, boxMon->personality, 2)->blockC;
    PokemonDataBlockD *blockD = &GetSubstruct(boxMon, boxMon->personality, 3)->blockD;

    switch (param) {
    default:
        ret = 0;
        break;
    case MON_DATA_PERSONALITY:
        ret = boxMon->personality;
        break;
    case MON_DATA_PARTY_LOCK:
        ret = boxMon->party_lock;
        break;
    case MON_DATA_BOX_LOCK:
        ret = boxMon->box_lock;
        break;
    case MON_DATA_CHECKSUM_FAILED:
        ret = boxMon->invalidData;
        break;
    case MON_DATA_CHECKSUM:
        ret = boxMon->checksum;
        break;
    case MON_DATA_SPECIES_EXISTS:
        if (blockA->species != SPECIES_NONE) {
            ret = TRUE;
        } else {
            ret = FALSE;
        }
        break;
    case MON_DATA_SANITY_IS_EGG:
        ret = boxMon->invalidData;
        if (!ret) {
            ret = blockB->isEgg;
        }
        break;
    case MON_DATA_SPECIES_OR_EGG:
        ret = blockA->species;
        if (ret != SPECIES_NONE && (blockB->isEgg || boxMon->invalidData)) {
            ret = SPECIES_EGG;
        }
        break;
    case MON_DATA_LEVEL:
        ret = (u32)CalcLevelBySpeciesAndExp(blockA->species, blockA->exp);
        break;
    case MON_DATA_SPECIES:
        if (boxMon->invalidData) {
            ret = SPECIES_EGG;
        } else {
            ret = blockA->species;
        }
        break;
    case MON_DATA_HELD_ITEM:
        ret = blockA->heldItem;
        break;
    case MON_DATA_OT_ID:
        ret = blockA->otID;
        break;
    case MON_DATA_EXP:
        ret = blockA->exp;
        break;
    case MON_DATA_FRIENDSHIP:
        ret = blockA->friendship;
        break;
    case MON_DATA_ABILITY:
        ret = blockA->ability;
        break;
    case MON_DATA_MARKS:
        ret = blockA->marks;
        break;
    case MON_DATA_LANGUAGE:
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
        ret = blockA->speedEV;
        break;
    case MON_DATA_SPATK_EV:
        ret = blockA->spAtkEV;
        break;
    case MON_DATA_SPDEF_EV:
        ret = blockA->spDefEV;
        break;
    case MON_DATA_COOL:
        ret = blockA->cool;
        break;
    case MON_DATA_BEAUTY:
        ret = blockA->beauty;
        break;
    case MON_DATA_CUTE:
        ret = blockA->cute;
        break;
    case MON_DATA_SMART:
        ret = blockA->smart;
        break;
    case MON_DATA_TOUGH:
        ret = blockA->tough;
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
    case MON_DATA_RIBBON_DUMMY: {
        if (blockA->sinnohRibbons & (1ll << (param - MON_DATA_SINNOH_CHAMP_RIBBON))) {
            ret = TRUE;
        } else {
            ret = FALSE;
        }
    } break;
    case MON_DATA_MOVE1:
    case MON_DATA_MOVE2:
    case MON_DATA_MOVE3:
    case MON_DATA_MOVE4:
        ret = blockB->moves[param - MON_DATA_MOVE1];
        break;
    case MON_DATA_MOVE1_CUR_PP:
    case MON_DATA_MOVE2_CUR_PP:
    case MON_DATA_MOVE3_CUR_PP:
    case MON_DATA_MOVE4_CUR_PP:
        ret = blockB->movePP[param - MON_DATA_MOVE1_CUR_PP];
        break;
    case MON_DATA_MOVE1_PP_UPS:
    case MON_DATA_MOVE2_PP_UPS:
    case MON_DATA_MOVE3_PP_UPS:
    case MON_DATA_MOVE4_PP_UPS:
        ret = blockB->movePPUps[param - MON_DATA_MOVE1_PP_UPS];
        break;
    case MON_DATA_MOVE1_MAX_PP:
    case MON_DATA_MOVE2_MAX_PP:
    case MON_DATA_MOVE3_MAX_PP:
    case MON_DATA_MOVE4_MAX_PP:
        ret = (u32)MoveTable_CalcMaxPP(blockB->moves[param - MON_DATA_MOVE1_MAX_PP], blockB->movePPUps[param - MON_DATA_MOVE1_MAX_PP]);
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
        ret = blockB->speedIV;
        break;
    case MON_DATA_SPATK_IV:
        ret = blockB->spAtkIV;
        break;
    case MON_DATA_SPDEF_IV:
        ret = blockB->spDefIV;
        break;
    case MON_DATA_IS_EGG:
        ret = boxMon->invalidData;
        if (!ret) {
            ret = blockB->isEgg;
        }
        break;
    case MON_DATA_HAS_NICKNAME:
        ret = blockB->hasNickname;
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
        if (blockB->ribbonFlags & (1ll << (param - MON_DATA_HOENN_COOL_RIBBON))) {
            ret = TRUE;
        } else {
            ret = FALSE;
        }
        break;
    case MON_DATA_FATEFUL_ENCOUNTER:
        ret = blockB->fatefulEncounter;
        break;
    case MON_DATA_GENDER:
        ret = Species_GetGender(blockA->species, boxMon->personality);
        blockB->gender = (u8)ret;
        boxMon->checksum = CHECKSUM(boxMon);
        break;
    case MON_DATA_FORM:
        ret = blockB->form;
        break;
    case MON_DATA_RESERVED_113:
        ret = blockB->unk_19_6;
        break;
    case MON_DATA_RESERVED_114:
        ret = blockB->Unused;
        break;
    case MON_DATA_NICKNAME_FLAT:
        if (boxMon->invalidData) {
            MessageLoader_GetSpeciesName(SPECIES_MANAPHY_EGG, HEAP_ID_DEFAULT, dest);
        } else {
            u16 *dest16 = (u16 *)dest;
            for (ret = 0; ret < POKEMON_NAME_LENGTH; ret++) {
                dest16[ret] = blockC->nickname[ret];
            }
            dest16[ret] = EOS;
        }
        break;
    case MON_DATA_NICKNAME_STRING_COMPARE:
        ret = blockB->hasNickname;
        // fallthrough
    case MON_DATA_NICKNAME_STRING:
        if (boxMon->invalidData) {
            String *buffer = GetSpeciesName(SPECIES_MANAPHY_EGG, HEAP_ID_DEFAULT);
            String_Copy(dest, buffer);
            String_Delete(buffer);
        } else {
            CopyU16ArrayToString(dest, blockC->nickname);
        }
        break;
    case MON_DATA_MET_GAME_REGION_CODE:
        ret = blockC->originCode;
        break;
    case MON_DATA_MET_GAME:
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
    case MON_DATA_CONTEST_RIBBON_DUMMY:
        if (blockC->sinnohRibbons2 & (1ll << (param - MON_DATA_COOL_RIBBON))) {
            ret = TRUE;
        } else {
            ret = FALSE;
        }
        break;
    case MON_DATA_OT_NAME: {
        u16 *dest16 = (u16 *)dest;
        for (ret = 0; ret < PLAYER_NAME_LENGTH; ret++) {
            dest16[ret] = blockD->otTrainerName[ret];
        }
        dest16[ret] = EOS;
    } break;
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
        ret = (blockB->hpIV) | (blockB->atkIV << 5) | (blockB->defIV << 10) | (blockB->speedIV << 15) | (blockB->spAtkIV << 20) | (blockB->spDefIV << 25);
        break;
    case MON_DATA_NO_PRINT_GENDER:
        if ((blockA->species == SPECIES_NIDORAN_F || blockA->species == SPECIES_NIDORAN_M) && !blockB->hasNickname) {
            ret = FALSE;
        } else {
            ret = TRUE;
        }
        break;
    case MON_DATA_TYPE_1:
    case MON_DATA_TYPE_2:
        if (blockA->species == SPECIES_ARCEUS && blockA->ability == ABILITY_MULTITYPE) {
            ret = (u32)HoldEffect_GetArceusType((u16)GetItemAttr(blockA->heldItem, ITEMATTR_HOLD_EFFECT, HEAP_ID_DEFAULT));
        } else {
            ret = (u32)GetMonBaseStat_HandleAlternateForm(blockA->species, blockB->form, (int)(param - MON_DATA_TYPE_1 + BASE_TYPE1));
        }
        break;
    case MON_DATA_SPECIES_NAME:
        MessageLoader_GetSpeciesName(blockA->species, HEAP_ID_DEFAULT, dest);
        break;
    case MON_DATA_SHINY_LEAF_A:
    case MON_DATA_SHINY_LEAF_B:
    case MON_DATA_SHINY_LEAF_C:
    case MON_DATA_SHINY_LEAF_D:
    case MON_DATA_SHINY_LEAF_E:
    case MON_DATA_SHINY_LEAF_CROWN:
        ret = (blockB->HGSS_shinyLeaves >> (param - MON_DATA_SHINY_LEAF_A)) & 1;
        break;
    case MON_DATA_MOOD:
        ret = blockD->mood;
        break;
    }
    return ret;
}

void Pokemon_SetData(Pokemon *mon, int attr, const void *value) {
    u32 checksum;
    if (!mon->box.party_lock) {
        DECRYPT_PTY(mon);
        DECRYPT_BOX(&mon->box);
        checksum = CHECKSUM(&mon->box);
        if (checksum != mon->box.checksum) {
            GF_ASSERT(checksum == mon->box.checksum);
            mon->box.invalidData = TRUE;
            ENCRYPT_BOX(&mon->box);
            return;
        }
    }
    Pokemon_SetDataInternal(mon, attr, value);
    if (!mon->box.party_lock) {
        ENCRYPT_PTY(mon);
        mon->box.checksum = CHECKSUM(&mon->box);
        ENCRYPT_BOX(&mon->box);
    }
}

#define VALUE(type) (*(const type *)value)

static void Pokemon_SetDataInternal(Pokemon *mon, int attr, const void *value)
{
    switch (attr) {
    case MON_DATA_STATUS:
        mon->party.status = VALUE(u32);
        break;
    case MON_DATA_LEVEL:
        mon->party.level = VALUE(u8);
        break;
    case MON_DATA_BALL_CAPSULE_ID:
        mon->party.ballCapsuleID = VALUE(u8);
        break;
    case MON_DATA_HP:
        mon->party.hp = VALUE(u16);
        break;
    case MON_DATA_MAX_HP:
        mon->party.maxHP = VALUE(u16);
        break;
    case MON_DATA_ATK:
        mon->party.attack = VALUE(u16);
        break;
    case MON_DATA_DEF:
        mon->party.defense = VALUE(u16);
        break;
    case MON_DATA_SPEED:
        mon->party.speed = VALUE(u16);
        break;
    case MON_DATA_SP_ATK:
        mon->party.spAtk = VALUE(u16);
        break;
    case MON_DATA_SP_DEF:
        mon->party.spDef = VALUE(u16);
        break;
    case MON_DATA_MAIL:
        Mail_Copy((const Mail *)value, &mon->party.mail);
        break;
    case MON_DATA_BALL_CAPSULE:
        BallCapsule_Copy((const BallCapsule *)value, &mon->party.ballCapsule);
        break;
    default:
        BoxPokemon_SetDataInternal(&mon->box, attr, value);
        break;
    }
}

#undef VALUE

void BoxPokemon_SetData(BoxPokemon *boxMon, int attr, const void *value)
{
    u32 checksum;
    if (!boxMon->box_lock) {
        DECRYPT_BOX(boxMon);
        checksum = CHECKSUM(boxMon);
        if (checksum != boxMon->checksum) {
            GF_ASSERT(checksum == boxMon->checksum);
            boxMon->invalidData = TRUE;
            ENCRYPT_BOX(boxMon);
            return;
        }
    }
    BoxPokemon_SetDataInternal(boxMon, attr, value);
    if (!boxMon->box_lock) {
        boxMon->checksum = CHECKSUM(boxMon);
        ENCRYPT_BOX(boxMon);
    }
}

#define VALUE(type) (*(const type *)value)

static void BoxPokemon_SetDataInternal(BoxPokemon *boxMon, int param, const void *value)
{
    u64 mask;
    u32 i;
    u16 namebuf[POKEMON_NAME_LENGTH + 1];
    u16 namebuf2[POKEMON_NAME_LENGTH + 1];
    u16 namebuf3[POKEMON_NAME_LENGTH + 1];
    String *speciesName;

    PokemonDataBlockA *blockA = &GetSubstruct(boxMon, boxMon->personality, 0)->blockA;
    PokemonDataBlockB *blockB = &GetSubstruct(boxMon, boxMon->personality, 1)->blockB;
    PokemonDataBlockC *blockC = &GetSubstruct(boxMon, boxMon->personality, 2)->blockC;
    PokemonDataBlockD *blockD = &GetSubstruct(boxMon, boxMon->personality, 3)->blockD;

    switch (param) {
    case MON_DATA_PERSONALITY:
        boxMon->personality = VALUE(u32);
        break;
    case MON_DATA_PARTY_LOCK:
        GF_ASSERT(FALSE);
        boxMon->party_lock = VALUE(u8);
        break;
    case MON_DATA_BOX_LOCK:
        GF_ASSERT(FALSE);
        boxMon->box_lock = VALUE(u8);
        break;
    case MON_DATA_CHECKSUM_FAILED:
        boxMon->invalidData = VALUE(u8);
        break;
    case MON_DATA_CHECKSUM:
        boxMon->checksum = VALUE(u16);
        break;
    case MON_DATA_SPECIES:
        blockA->species = VALUE(u16);
        break;
    case MON_DATA_HELD_ITEM:
        blockA->heldItem = VALUE(u16);
        break;
    case MON_DATA_OT_ID:
        blockA->otID = VALUE(u32);
        break;
    case MON_DATA_EXP:
        blockA->exp = VALUE(u32);
        break;
    case MON_DATA_FRIENDSHIP:
        blockA->friendship = VALUE(u8);
        break;
    case MON_DATA_ABILITY:
        blockA->ability = VALUE(u8);
        break;
    case MON_DATA_MARKS:
        blockA->marks = VALUE(u8);
        break;
    case MON_DATA_LANGUAGE:
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
        blockA->speedEV = VALUE(u8);
        break;
    case MON_DATA_SPATK_EV:
        blockA->spAtkEV = VALUE(u8);
        break;
    case MON_DATA_SPDEF_EV:
        blockA->spDefEV = VALUE(u8);
        break;
    case MON_DATA_COOL:
        blockA->cool = VALUE(u8);
        break;
    case MON_DATA_BEAUTY:
        blockA->beauty = VALUE(u8);
        break;
    case MON_DATA_CUTE:
        blockA->cute = VALUE(u8);
        break;
    case MON_DATA_SMART:
        blockA->smart = VALUE(u8);
        break;
    case MON_DATA_TOUGH:
        blockA->tough = VALUE(u8);
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
    case MON_DATA_RIBBON_DUMMY:
        mask = 1 << (param - MON_DATA_SINNOH_CHAMP_RIBBON);
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
        blockB->moves[param - MON_DATA_MOVE1] = VALUE(u16);
        break;
    case MON_DATA_MOVE1_CUR_PP:
    case MON_DATA_MOVE2_CUR_PP:
    case MON_DATA_MOVE3_CUR_PP:
    case MON_DATA_MOVE4_CUR_PP:
        blockB->movePP[param - MON_DATA_MOVE1_CUR_PP] = VALUE(u8);
        break;
    case MON_DATA_MOVE1_PP_UPS:
    case MON_DATA_MOVE2_PP_UPS:
    case MON_DATA_MOVE3_PP_UPS:
    case MON_DATA_MOVE4_PP_UPS:
        blockB->movePPUps[param - MON_DATA_MOVE1_PP_UPS] = VALUE(u8);
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
        blockB->speedIV = VALUE(u8);
        break;
    case MON_DATA_SPATK_IV:
        blockB->spAtkIV = VALUE(u8);
        break;
    case MON_DATA_SPDEF_IV:
        blockB->spDefIV = VALUE(u8);
        break;
    case MON_DATA_IS_EGG:
        blockB->isEgg = VALUE(u8);
        break;
    case MON_DATA_HAS_NICKNAME:
        blockB->hasNickname = VALUE(u8);
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
        mask = 1 << (param - MON_DATA_HOENN_COOL_RIBBON);
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
        blockB->gender = Species_GetGender(blockA->species, boxMon->personality);
        break;
    case MON_DATA_FORM:
        blockB->form = VALUE(u8);
        break;
    case MON_DATA_RESERVED_113:
        blockB->unk_19_6 = VALUE(u8);
        break;
    case MON_DATA_RESERVED_114:
        blockB->Unused = VALUE(u16);
        break;
    case MON_DATA_NICKNAME_FLAT_COMPARE:
        MessageLoader_GetSpeciesName(blockA->species, HEAP_ID_DEFAULT, namebuf);
        blockB->hasNickname = StringNotEqual(namebuf, value);
        // fallthrough
    case MON_DATA_NICKNAME_FLAT:
        for (i = 0; i < POKEMON_NAME_LENGTH + 1; i++) {
            blockC->nickname[i] = VALUE(u16);
            value = (void *const)((char *)value + 2);
        }
        break;
    case MON_DATA_NICKNAME_STRING_COMPARE:
        MessageLoader_GetSpeciesName(blockA->species, HEAP_ID_DEFAULT, namebuf2);
        CopyStringToU16Array(value, namebuf3, POKEMON_NAME_LENGTH + 1);
        blockB->hasNickname = StringNotEqual(namebuf2, namebuf3);
        // fallthrough
    case MON_DATA_NICKNAME_STRING:
        CopyStringToU16Array(value, blockC->nickname, POKEMON_NAME_LENGTH + 1);
        break;
    case MON_DATA_MET_GAME_REGION_CODE:
        blockC->originCode = VALUE(u8);
        break;
    case MON_DATA_MET_GAME:
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
    case MON_DATA_CONTEST_RIBBON_DUMMY:
        mask = 1 << (param - MON_DATA_COOL_RIBBON);
        if (VALUE(u8)) {
            blockC->sinnohRibbons2 |= mask;
        } else {
            blockC->sinnohRibbons2 &= mask ^ 0xFFFFFFFFFFFFFFFF;
        }
        break;
    case MON_DATA_OT_NAME:
        for (i = 0; i < PLAYER_NAME_LENGTH + 1; i++) {
            blockD->otTrainerName[i] = VALUE(u16);
            value = (void *)((char *)value + 2);
        }
        break;
    case MON_DATA_OT_NAME_2:
        CopyStringToU16Array(value, blockD->otTrainerName, PLAYER_NAME_LENGTH + 1);
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
        blockB->hpIV = (VALUE(u32) >> 0) & 0x1F;
        blockB->atkIV = (VALUE(u32) >> 5) & 0x1F;
        blockB->defIV = (VALUE(u32) >> 10) & 0x1F;
        blockB->speedIV = (VALUE(u32) >> 15) & 0x1F;
        blockB->spAtkIV = (VALUE(u32) >> 20) & 0x1F;
        blockB->spDefIV = (VALUE(u32) >> 25) & 0x1F;
        break;
    case MON_DATA_SPECIES_NAME:
        speciesName = GetSpeciesName(blockA->species, HEAP_ID_DEFAULT);
        CopyStringToU16Array(speciesName, blockC->nickname, POKEMON_NAME_LENGTH + 1);
        String_Delete(speciesName);
        break;
    case MON_DATA_SHINY_LEAF_A:
    case MON_DATA_SHINY_LEAF_B:
    case MON_DATA_SHINY_LEAF_C:
    case MON_DATA_SHINY_LEAF_D:
    case MON_DATA_SHINY_LEAF_E:
    case MON_DATA_SHINY_LEAF_CROWN:
        if (value == NULL) {
            blockB->HGSS_shinyLeaves |= 1 << (param - MON_DATA_SHINY_LEAF_A);
        } else if (VALUE(u8) != 0) {
            blockB->HGSS_shinyLeaves |= 1 << (param - MON_DATA_SHINY_LEAF_A);
        } else {
            blockB->HGSS_shinyLeaves &= (1 << (param - MON_DATA_SHINY_LEAF_A)) ^ 0x3F;
        }
        break;
    case MON_DATA_MOOD:
        blockD->mood = VALUE(u8);
        break;
    }
}

#undef VALUE

void AddMonData(Pokemon *mon, int attr, int value) {
    u32 checksum;
    if (!mon->box.party_lock) {
        DECRYPT_PTY(mon);
        DECRYPT_BOX(&mon->box);
        checksum = CHECKSUM(&mon->box);
        if (checksum != mon->box.checksum) {
            GF_ASSERT(checksum == mon->box.checksum);
            ENCRYPT_BOX(&mon->box);
            return;
        }
    }
    AddMonDataInternal(mon, attr, value);
    if (!mon->box.party_lock) {
        ENCRYPT_PTY(mon);
        mon->box.checksum = CHECKSUM(&mon->box);
        ENCRYPT_BOX(&mon->box);
    }
}

static void AddMonDataInternal(Pokemon *mon, int attr, int value) {
    s32 maxHp;
    switch (attr) {
    case MON_DATA_HP:
        maxHp = mon->party.maxHP;
        if ((s32)(mon->party.hp + value) > maxHp) {
            mon->party.hp = (u16)maxHp;
        } else {
            mon->party.hp += value;
        }
        break;
    case MON_DATA_STATUS:
    case MON_DATA_LEVEL:
    case MON_DATA_BALL_CAPSULE_ID:
    case MON_DATA_MAX_HP:
    case MON_DATA_ATK:
    case MON_DATA_DEF:
    case MON_DATA_SPEED:
    case MON_DATA_SP_ATK:
    case MON_DATA_SP_DEF:
    case MON_DATA_MAIL:
        // case MON_DATA_BALL_CAPSULE:
        GF_ASSERT(FALSE);
        break;
    default:
        AddBoxMonDataInternal(&mon->box, attr, value);
        break;
    }
}

static void AddBoxMonDataInternal(BoxPokemon *boxMon, int param, int value) {
    PokemonDataBlockA *blockA = &GetSubstruct(boxMon, boxMon->personality, 0)->blockA;
    PokemonDataBlockB *blockB = &GetSubstruct(boxMon, boxMon->personality, 1)->blockB;
    PokemonDataBlockC *blockC = &GetSubstruct(boxMon, boxMon->personality, 2)->blockC;
    PokemonDataBlockD *blockD = &GetSubstruct(boxMon, boxMon->personality, 3)->blockD;

    switch (param) {
    case MON_DATA_EXP:
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
    } break;
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
        blockA->speedEV += value;
        break;
    case MON_DATA_SPATK_EV:
        blockA->spAtkEV += value;
        break;
    case MON_DATA_SPDEF_EV:
        blockA->spDefEV += value;
        break;
    case MON_DATA_COOL:
        if (blockA->cool + value > 255) {
            blockA->cool = 255;
        } else {
            blockA->cool += value;
        }
        break;
    case MON_DATA_BEAUTY:
        if (blockA->beauty + value > 255) {
            blockA->beauty = 255;
        } else {
            blockA->beauty += value;
        }
        break;
    case MON_DATA_CUTE:
        if (blockA->cute + value > 255) {
            blockA->cute = 255;
        } else {
            blockA->cute += value;
        }
        break;
    case MON_DATA_SMART:
        if (blockA->smart + value > 255) {
            blockA->smart = 255;
        } else {
            blockA->smart += value;
        }
        break;
    case MON_DATA_TOUGH:
        if (blockA->tough + value > 255) {
            blockA->tough = 255;
        } else {
            blockA->tough += value;
        }
        break;
    case MON_DATA_SHEEN:
        if (blockA->sheen + value > 255) {
            blockA->sheen = 255;
        } else {
            blockA->sheen += value;
        }
        break;
    case MON_DATA_MOVE1_CUR_PP:
    case MON_DATA_MOVE2_CUR_PP:
    case MON_DATA_MOVE3_CUR_PP:
    case MON_DATA_MOVE4_CUR_PP:
        if (blockB->movePP[param - MON_DATA_MOVE1_CUR_PP] + value > MoveTable_CalcMaxPP(blockB->moves[param - MON_DATA_MOVE1_CUR_PP], blockB->movePPUps[param - MON_DATA_MOVE1_CUR_PP])) {
            blockB->movePP[param - MON_DATA_MOVE1_CUR_PP] = MoveTable_CalcMaxPP(blockB->moves[param - MON_DATA_MOVE1_CUR_PP], blockB->movePPUps[param - MON_DATA_MOVE1_CUR_PP]);
        } else {
            blockB->movePP[param - MON_DATA_MOVE1_CUR_PP] += value;
        }
        break;
    case MON_DATA_MOVE1_PP_UPS:
    case MON_DATA_MOVE2_PP_UPS:
    case MON_DATA_MOVE3_PP_UPS:
    case MON_DATA_MOVE4_PP_UPS:
        if (blockB->movePPUps[param - MON_DATA_MOVE1_PP_UPS] + value > 3) {
            blockB->movePPUps[param - MON_DATA_MOVE1_PP_UPS] = 3;
        } else {
            blockB->movePPUps[param - MON_DATA_MOVE1_PP_UPS] += value;
        }
        break;
    case MON_DATA_MOVE1_MAX_PP:
    case MON_DATA_MOVE2_MAX_PP:
    case MON_DATA_MOVE3_MAX_PP:
    case MON_DATA_MOVE4_MAX_PP:
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
        if (blockB->speedIV + value > 31) {
            blockB->speedIV = 31;
        } else {
            blockB->speedIV += value;
        }
        break;
    case MON_DATA_SPATK_IV:
        if (blockB->spAtkIV + value > 31) {
            blockB->spAtkIV = 31;
        } else {
            blockB->spAtkIV += value;
        }
        break;
    case MON_DATA_SPDEF_IV:
        if (blockB->spDefIV + value > 31) {
            blockB->spDefIV = 31;
        } else {
            blockB->spDefIV += value;
        }
        break;
    case MON_DATA_PERSONALITY:
    case MON_DATA_PARTY_LOCK:
    case MON_DATA_BOX_LOCK:
    case MON_DATA_CHECKSUM_FAILED:
    case MON_DATA_CHECKSUM:
    case MON_DATA_SPECIES:
    case MON_DATA_HELD_ITEM:
    case MON_DATA_OT_ID:
    case MON_DATA_ABILITY:
    case MON_DATA_MARKS:
    case MON_DATA_LANGUAGE:
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
    case MON_DATA_RIBBON_DUMMY:
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
    case MON_DATA_FORM:
    case MON_DATA_RESERVED_113:
    case MON_DATA_RESERVED_114:
    case MON_DATA_NICKNAME_FLAT:
    case MON_DATA_NICKNAME_FLAT_COMPARE:
    case MON_DATA_NICKNAME_STRING:
    case MON_DATA_NICKNAME_STRING_COMPARE:
    case MON_DATA_MET_GAME_REGION_CODE:
    case MON_DATA_MET_GAME:
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
    case MON_DATA_CONTEST_RIBBON_DUMMY:
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
    case MON_DATA_RESERVED_159:
    case MON_DATA_STATUS:
    case MON_DATA_LEVEL:
    case MON_DATA_BALL_CAPSULE_ID:
    case MON_DATA_HP:
    case MON_DATA_MAX_HP:
    case MON_DATA_ATK:
    case MON_DATA_DEF:
    case MON_DATA_SPEED:
    case MON_DATA_SP_ATK:
    case MON_DATA_SP_DEF:
    case MON_DATA_MAIL:
    case MON_DATA_BALL_CAPSULE:
    case MON_DATA_SPECIES_EXISTS:
    case MON_DATA_SANITY_IS_EGG:
    case MON_DATA_SPECIES_OR_EGG:
    case MON_DATA_IVS_WORD:
    case MON_DATA_NO_PRINT_GENDER:
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
        GF_ASSERT(FALSE);
    }
}

BASE_STATS *AllocAndLoadMonPersonal_HandleAlternateForm(int species, int form, HeapID heapID) {
    BASE_STATS *ret = AllocFromHeap(heapID, sizeof(BASE_STATS));
    LoadMonBaseStats_HandleAlternateForm(species, form, ret);
    return ret;
}

BASE_STATS *AllocAndLoadMonPersonal(int species, HeapID heapID) {
    BASE_STATS *ret = AllocFromHeap(heapID, sizeof(BASE_STATS));
    LoadMonPersonal(species, ret);
    return ret;
}

int GetPersonalAttr(const BASE_STATS *baseStats, int attr) {
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
    case BASE_EGG_GROUP_2:
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
        ret = (int)baseStats->tmhm_1;
        break;
    case BASE_TMHM_2:
        ret = (int)baseStats->tmhm_2;
        break;
    case BASE_TMHM_3:
        ret = (int)baseStats->tmhm_3;
        break;
    case BASE_TMHM_4:
        ret = (int)baseStats->tmhm_4;
        break;
    }
    return ret;
}

void FreeMonPersonal(BASE_STATS *personal) {
    GF_ASSERT(personal != NULL);
    FreeToHeap(personal);
}

int GetMonBaseStat_HandleAlternateForm(int species, int form, int attr) {
    int ret;
    BASE_STATS *personal = AllocAndLoadMonPersonal(ResolveMonForm(species, form), HEAP_ID_DEFAULT);
    ret = GetPersonalAttr(personal, attr);
    FreeMonPersonal(personal);
    return ret;
}

int GetMonBaseStat(int species, int attr) {
    int ret;
    BASE_STATS *personal = AllocAndLoadMonPersonal(species, HEAP_ID_DEFAULT);
    ret = GetPersonalAttr(personal, attr);
    FreeMonPersonal(personal);
    return ret;
}

int GetMonBaseStatEx_HandleAlternateForm(NARC *narc, int species, int form, int attr) {
    int resolved = ResolveMonForm(species, form);
    int ret;
    BASE_STATS *buf = AllocFromHeap(HEAP_ID_DEFAULT, sizeof(BASE_STATS));
    NARC_ReadWholeMember(narc, resolved, buf);
    ret = GetPersonalAttr(buf, attr);
    FreeToHeap(buf);
    return ret;
}

u8 GetPercentProgressTowardsNextLevel(Pokemon *mon) {
    BOOL decry = AcquireMonLock(mon);
    u16 species = (u16)Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    u8 level = (u8)Pokemon_GetData(mon, MON_DATA_LEVEL, NULL);
    u32 lo = GetMonExpBySpeciesAndLevel(species, level);
    u32 hi = GetMonExpBySpeciesAndLevel(species, level + 1);
    u32 cur = Pokemon_GetData(mon, MON_DATA_EXP, NULL);
    ReleaseMonLock(mon, decry);
    return (u8)(100 * (cur - lo) / (hi - lo));
}

u32 CalcMonExpToNextLevel(Pokemon *mon) {
    return CalcBoxMonExpToNextLevel(&mon->box);
}

u32 CalcBoxMonExpToNextLevel(BoxPokemon *boxMon) {
    u16 species = (u16)BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    u16 level = (u16)(BoxPokemon_GetLevel(boxMon) + 1);
    u32 cur = BoxPokemon_GetData(boxMon, MON_DATA_EXP, NULL);
    u32 hi = GetMonExpBySpeciesAndLevel(species, level);
    return hi - cur;
}

u32 GetMonBaseExperienceAtCurrentLevel(Pokemon *mon) {
    int species = (int)Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    int level = (int)Pokemon_GetData(mon, MON_DATA_LEVEL, NULL);
    return GetMonExpBySpeciesAndLevel(species, level);
}

u32 GetMonExpBySpeciesAndLevel(int species, int level) {
    return GetExpByGrowthRateAndLevel(GetMonBaseStat(species, BASE_GROWTH_RATE), level);
}

void LoadGrowthTable(int growthRate, u32 *dest) {
    GF_ASSERT(growthRate < 8);
    ReadWholeNarcMemberByIdPair(dest, NARC_poketool_personal_growtbl, growthRate);
}

u32 GetExpByGrowthRateAndLevel(int growthRate, int level) {
    u32 *table;
    u32 ret;
    GF_ASSERT(growthRate < 8);
    GF_ASSERT(level <= MAX_MON_LEVEL + 1);
    table = (u32 *)AllocFromHeap(HEAP_ID_DEFAULT, (MAX_MON_LEVEL + 1) * sizeof(u32));
    LoadGrowthTable(growthRate, table);
    ret = table[level];
    FreeToHeap(table);
    return ret;
}

u32 Pokemon_GetLevel(Pokemon *mon)
{
    return BoxPokemon_GetLevel(&mon->box);
}

u32 BoxPokemon_GetLevel(BoxPokemon *boxMon)
{
    BOOL decry = AcquireBoxMonLock(boxMon);
    int species = (int)BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    int exp = (int)BoxPokemon_GetData(boxMon, MON_DATA_EXP, NULL);
    ReleaseBoxMonLock(boxMon, decry);
    return CalcLevelBySpeciesAndExp((u16)species, (u32)exp);
}

int CalcLevelBySpeciesAndExp(u16 species, u32 exp) {
    int level;
    BASE_STATS *personal = AllocAndLoadMonPersonal(species, HEAP_ID_DEFAULT);
    level = CalcLevelBySpeciesAndExp_PreloadedPersonal(personal, species, exp);
    FreeMonPersonal(personal);
    return level;
}

int CalcLevelBySpeciesAndExp_PreloadedPersonal(BASE_STATS *personal, u16 species, u32 exp) {
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

u8 GetMonNature(Pokemon *mon) {
    return GetBoxMonNature(&mon->box);
}

u8 GetBoxMonNature(BoxPokemon *boxMon) {
    BOOL decry = AcquireBoxMonLock(boxMon);
    u32 personality = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    ReleaseBoxMonLock(boxMon, decry);
    return Pokemon_GetNatureOf(personality);
}

u8 Pokemon_GetNatureOf(u32 pid) {
    return (u8)(pid % 25);
}

const s8 gNatureStatMods[NATURE_NUM][NUM_EV_STATS] = {
    { 0,  0,  0,  0,  0  },
    { 1,  -1, 0,  0,  0  },
    { 1,  0,  -1, 0,  0  },
    { 1,  0,  0,  -1, 0  },
    { 1,  0,  0,  0,  -1 },
    { -1, 1,  0,  0,  0  },
    { 0,  0,  0,  0,  0  },
    { 0,  1,  -1, 0,  0  },
    { 0,  1,  0,  -1, 0  },
    { 0,  1,  0,  0,  -1 },
    { -1, 0,  1,  0,  0  },
    { 0,  -1, 1,  0,  0  },
    { 0,  0,  0,  0,  0  },
    { 0,  0,  1,  -1, 0  },
    { 0,  0,  1,  0,  -1 },
    { -1, 0,  0,  1,  0  },
    { 0,  -1, 0,  1,  0  },
    { 0,  0,  -1, 1,  0  },
    { 0,  0,  0,  0,  0  },
    { 0,  0,  0,  1,  -1 },
    { -1, 0,  0,  0,  1  },
    { 0,  -1, 0,  0,  1  },
    { 0,  0,  -1, 0,  1  },
    { 0,  0,  0,  -1, 1  },
    { 0,  0,  0,  0,  0  },
};

u16 ModifyStatByNature(u8 nature, u16 n, u8 statIndex)
{
    u16 retVal;

    // Dont modify HP, Accuracy, or Evasion by nature
    if (statIndex < STAT_ATK || statIndex > STAT_SPDEF) {
        return n;
    }

    switch (gNatureStatMods[nature][statIndex - 1]) {
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

static const s8 sFriendshipModTable[FRIENDSHIP_EVENT_NUM][FRIENDSHIP_TIER_NUM] = {
    { 5,  3,  2   }, // FRIENDSHIP_EVENT_GROW_LEVEL
    { 5,  3,  2   }, // FRIENDSHIP_EVENT_VITAMIN
    { 1,  1,  0   }, // FRIENDSHIP_EVENT_BATTLE_ITEM
    { 3,  2,  1   }, // FRIENDSHIP_EVENT_LEAGUE_BATTLE
    { 1,  1,  0   }, // FRIENDSHIP_EVENT_LEARN_TMHM
    { 1,  1,  1   }, // FRIENDSHIP_EVENT_WALKING
    { -1, -1, -1  }, // FRIENDSHIP_EVENT_FAINT_SMALL
    { -5, -5, -10 }, // FRIENDSHIP_EVENT_HEAL_FIELD_PSN
    { -5, -5, -10 }, // FRIENDSHIP_EVENT_FAINT_LARGE
    { 3,  2,  1   }, // FRIENDHSIP_EVENT_CONTEST_WIN
};

void Pokemon_UpdateFriendship(Pokemon *mon, u8 kind, u16 location)
{
    u16 species;
    u8 effect;
    u8 tier;
    s16 friendship;

    if (kind == FRIENDSHIP_EVENT_WALKING && (LCRandom() & 1)) {
        return;
    }

    species = (u16)Pokemon_GetData(mon, MON_DATA_SPECIES_OR_EGG, NULL);
    if (species == SPECIES_NONE || species == SPECIES_EGG) {
        return;
    }

    effect = (u8)GetItemAttr((u16)Pokemon_GetData(mon, MON_DATA_HELD_ITEM, NULL), ITEMATTR_HOLD_EFFECT, HEAP_ID_DEFAULT);
    tier = FRIENDSHIP_TIER_LOW;
    friendship = (s16)Pokemon_GetData(mon, MON_DATA_FRIENDSHIP, NULL);
    if (friendship >= FRIENDSHIP_TIER_MID_MIN) {
        tier++;
    }
    if (friendship >= FRIENDSHIP_TIER_HI_MIN) {
        tier++;
    }
    s8 mod = sFriendshipModTable[kind][tier];
    if (mod > 0 && Pokemon_GetData(mon, MON_DATA_DP_POKEBALL, NULL) == BALL_LUXURY) {
        mod++;
    }
    if (mod > 0 && Pokemon_GetData(mon, MON_DATA_EGG_MET_LOCATION, NULL) == location) {
        mod++;
    }
    if (mod > 0 && effect == HOLD_EFFECT_FRIENDSHIP_UP) {
        mod = (s8)(mod * 150 / 100);
    }
    friendship += mod;
    if (friendship < 0) {
        friendship = 0;
    }
    if (friendship > FRIENDSHIP_MAX) {
        friendship = FRIENDSHIP_MAX;
    }
    Pokemon_SetData(mon, MON_DATA_FRIENDSHIP, &friendship);
}

u8 Pokemon_GetGender(Pokemon *mon)
{
    return BoxPokemon_GetGender(&mon->box);
}

u8 BoxPokemon_GetGender(BoxPokemon *boxMon)
{
    BOOL decry = AcquireBoxMonLock(boxMon);
    u16 species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    u32 personality = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    ReleaseBoxMonLock(boxMon, decry);
    return Species_GetGender(species, personality);
}

u8 Species_GetGender(u16 species, u32 personality) {
    BASE_STATS *personal = AllocAndLoadMonPersonal(species, HEAP_ID_DEFAULT);
    u8 gender = GetGenderBySpeciesAndPersonality_PreloadedPersonal(personal, species, personality);
    FreeMonPersonal(personal);
    return gender;
}

u8 GetGenderBySpeciesAndPersonality_PreloadedPersonal(const BASE_STATS *personal, u16 species, u32 pid) {
    int gender;
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

BOOL BoxMonIsHoldingMail(BoxPokemon *boxMon)
{
    return ItemIdIsMail(BoxPokemon_GetData(boxMon, MON_DATA_HELD_ITEM, NULL));
}

u8 Pokemon_IsShiny(Pokemon *mon)
{
    return BoxPokemon_IsShiny(&mon->box);
}

u8 BoxPokemon_IsShiny(BoxPokemon *boxMon)
{
    u32 otID = BoxPokemon_GetData(boxMon, MON_DATA_OT_ID, NULL);
    u32 personality = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    return CalcShininessByOtIdAndPersonality(otID, personality);
}

u8 CalcShininessByOtIdAndPersonality(u32 otid, u32 pid)
{
    return (u8)SHINY_CHECK(otid, pid);
}

u32 Pokemon_FindShinyPersonality(u32 otID)
{
    // 1. Pre-compute the XOR of the two halves of the trainer ID. We only
    // care about the most-significant 13 bits, so truncate the last 3.
    otID = (((otID & 0xFFFF0000) >> 16) ^ (otID & 0xFFFF)) >> 3;

    int i;

    // 2. Randomize the least-significant 3-bits of each half of the
    // generated personality.
    u16 rndLow = (LCRandom() & 7);
    u16 rndHigh = (LCRandom() & 7);
    for (i = 0; i < 13; i++) {
        if (MaskOfFlagNo(i) & otID) {
            if (LCRandom() & 1) {
                rndLow |= MaskOfFlagNo(i + 3);
            } else {
                rndHigh |= MaskOfFlagNo(i + 3);
            }
        } else if (LCRandom() & 1) {
            rndLow |= MaskOfFlagNo(i + 3);
            rndHigh |= MaskOfFlagNo(i + 3);
        }
    }
    return (u32)((rndHigh << 16) | rndLow);
}

void GetPokemonSpriteCharAndPlttNarcIds(PokePicTemplate *pokepicTemplate, Pokemon *mon, u8 whichFacing)
{
    GetBoxmonSpriteCharAndPlttNarcIds(pokepicTemplate, &mon->box, whichFacing, FALSE);
}

void sub_02070130(PokePicTemplate *pokepicTemplate, BoxPokemon *boxMon, u8 whichFacing)
{
    GetBoxmonSpriteCharAndPlttNarcIds(pokepicTemplate, boxMon, whichFacing, TRUE);
}

void GetBoxmonSpriteCharAndPlttNarcIds(PokePicTemplate *pokepicTemplate, BoxPokemon *boxMon, u8 whichFacing, BOOL sp14) {
    BOOL decry = AcquireBoxMonLock(boxMon);
    u16 species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES_OR_EGG, NULL);
    u8 gender = BoxPokemon_GetGender(boxMon);
    u8 shiny = BoxPokemon_IsShiny(boxMon);
    u32 pid = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    u8 form;
    if (species == SPECIES_EGG) {
        if (BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL) == SPECIES_MANAPHY) {
            form = EGG_MANAPHY;
        } else {
            form = EGG_STANDARD;
        }
    } else {
        form = BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);
    }
    if (sp14 == TRUE) {
        DP_GetMonSpriteCharAndPlttNarcIdsEx(pokepicTemplate, species, gender, whichFacing, shiny, form, pid);
    } else {
        GetMonSpriteCharAndPlttNarcIdsEx(pokepicTemplate, species, gender, whichFacing, shiny, form, pid);
    }
    ReleaseBoxMonLock(boxMon, decry);
}

void GetMonSpriteCharAndPlttNarcIdsEx(PokePicTemplate *pokepicTemplate, u16 species, u8 gender, u8 whichFacing, u8 shiny, u8 form, u32 personality) {
    pokepicTemplate->species = SPECIES_NONE;
    pokepicTemplate->isAnimated = FALSE;
    pokepicTemplate->personality = 0;
    form = sub_02070438(species, form);
    switch (species) {
    case SPECIES_BURMY:
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x48 + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0xAA + form * 2);
        break;
    case SPECIES_WORMADAM:
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x4E + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0xB0 + form * 2);
        break;
    case SPECIES_SHELLOS:
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing + 0x54 + form);
        pokepicTemplate->palDataID = (u16)(shiny + 0xB6 + form * 2);
        break;
    case SPECIES_GASTRODON:
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing + 0x58 + form);
        pokepicTemplate->palDataID = (u16)(shiny + 0xBA + form * 2);
        break;
    case SPECIES_CHERRIM:
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing + 0x5C + form);
        pokepicTemplate->palDataID = (u16)(shiny * 2 + 0xBE + form);
        break;
    case SPECIES_ARCEUS:
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x60 + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0xC2 + form * 2);
        break;
    case SPECIES_CASTFORM:
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing * 2 + 0x40 + form);
        pokepicTemplate->palDataID = (u16)(shiny * 4 + 0xA2 + form);
        break;
    case SPECIES_DEOXYS:
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0x9E);
        break;
    case SPECIES_UNOWN:
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x8 + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0xA0);
        break;
    case SPECIES_EGG: // egg, manaphy egg
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(0x84 + form);
        pokepicTemplate->palDataID = (u16)(0xE6 + form);
        break;
    case SPECIES_MANAPHY_EGG: // bad egg
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = 0x84;
        pokepicTemplate->palDataID = 0xE6;
        break;
    case SPECIES_SHAYMIN: // land, sky
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x86 + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0xE8 + form * 2);
        break;
    case SPECIES_ROTOM: // normal, fan, mow, wash, heat, frost
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x8A + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0xEC + form * 2);
        break;
    case SPECIES_GIRATINA: // altered, origin
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x96 + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0xF8 + form * 2);
        break;
    case SPECIES_PICHU: // spiky-ear
        pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x9A + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0xFC + form * 2);
        break;
    default:
        pokepicTemplate->narcID = NARC_poketool_pokegra_pokegra;
        pokepicTemplate->charDataID = (u16)(species * 6 + whichFacing + (gender == MON_FEMALE ? 0 : 1));
        pokepicTemplate->palDataID = (u16)(shiny + (species * 6 + 4));
        if (species == SPECIES_SPINDA && whichFacing == MON_PIC_FACING_FRONT) {
            pokepicTemplate->species = SPECIES_SPINDA;
            pokepicTemplate->isAnimated = FALSE;
            pokepicTemplate->personality = personality;
        }
        break;
    }
}

u8 sub_02070438(u16 species, u8 form) {
    switch (species) {
    case SPECIES_BURMY:
        if (form > BURMY_FORM_MAX - 1) {
            form = 0;
        }
        break;
    case SPECIES_WORMADAM:
        if (form > WORMADAM_FORM_MAX - 1) {
            form = 0;
        }
        break;
    case SPECIES_SHELLOS:
        if (form > SHELLOS_FORM_MAX - 1) {
            form = 0;
        }
        break;
    case SPECIES_GASTRODON:
        if (form > GASTRODON_FORM_MAX - 1) {
            form = 0;
        }
        break;
    case SPECIES_CHERRIM:
        if (form > CHERRIM_FORM_MAX - 1) {
            form = 0;
        }
        break;
    case SPECIES_ARCEUS:
        if (form > ARCEUS_FORM_MAX - 1) {
            form = 0;
        }
        break;
    case SPECIES_CASTFORM:
        if (form > CASTFORM_FORM_MAX - 1) {
            form = 0;
        }
        break;
    case SPECIES_DEOXYS:
        if (form > DEOXYS_FORM_MAX - 1) {
            form = 0;
        }
        break;
    case SPECIES_UNOWN:
        if (form >= UNOWN_FORM_MAX) {
            form = 0;
        }
        break;
    case SPECIES_EGG:
        if (form > EGG_FORM_MAX - 1) {
            form = 0;
        }
        break;
    case SPECIES_SHAYMIN:
        if (form > SHAYMIN_FORM_MAX - 1) {
            form = 0;
        }
        break;
    case SPECIES_ROTOM:
        if (form > ROTOM_FORM_MAX - 1) {
            form = 0;
        }
        break;
    case SPECIES_GIRATINA:
        if (form > GIRATINA_FORM_MAX - 1) {
            form = 0;
        }
        break;
    case SPECIES_PICHU:
        if (form > PICHU_FORM_MAX - 1) {
            form = 0;
        }
        break;
    }
    return form;
}

void sub_02070560(PokePicTemplate *pokepicTemplate, u16 species, u8 whichFacing, u8 gender, u32 shiny) {
    pokepicTemplate->narcID = NARC_pbr_pokegra;
    pokepicTemplate->charDataID = (u16)(species * 6 + whichFacing + (gender == MON_FEMALE ? 0 : 1));
    pokepicTemplate->palDataID = (u16)(shiny + (species * 6 + 4));
}

void DP_GetMonSpriteCharAndPlttNarcIdsEx(PokePicTemplate *pokepicTemplate, u16 species, u8 gender, u8 whichFacing, u8 shiny, u8 form, u32 personality) {
    pokepicTemplate->species = SPECIES_NONE;
    pokepicTemplate->isAnimated = FALSE;
    pokepicTemplate->personality = 0;
    form = sub_02070438(species, form);
    switch (species) {
    case SPECIES_BURMY:
        pokepicTemplate->narcID = NARC_pbr_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x48 + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0x92 + form * 2);
        break;
    case SPECIES_WORMADAM:
        pokepicTemplate->narcID = NARC_pbr_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x4E + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0x98 + form * 2);
        break;
    case SPECIES_SHELLOS:
        pokepicTemplate->narcID = NARC_pbr_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing + 0x54 + form);
        pokepicTemplate->palDataID = (u16)(shiny + 0x9E + form * 2);
        break;
    case SPECIES_GASTRODON:
        pokepicTemplate->narcID = NARC_pbr_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing + 0x58 + form);
        pokepicTemplate->palDataID = (u16)(shiny + 0xA2 + form * 2);
        break;
    case SPECIES_CHERRIM:
        pokepicTemplate->narcID = NARC_pbr_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing + 0x5C + form);
        pokepicTemplate->palDataID = (u16)(shiny * 2 + 0xA6 + form);
        break;
    case SPECIES_ARCEUS:
        pokepicTemplate->narcID = NARC_pbr_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x60 + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0xAA + form * 2);
        break;
    case SPECIES_CASTFORM:
        pokepicTemplate->narcID = NARC_pbr_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing * 2 + 0x40 + form);
        pokepicTemplate->palDataID = (u16)(shiny * 4 + 0x8A + form);
        break;
    case SPECIES_DEOXYS:
        pokepicTemplate->narcID = NARC_pbr_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0x86);
        break;
    case SPECIES_UNOWN:
        pokepicTemplate->narcID = NARC_pbr_otherpoke;
        pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x8 + form * 2);
        pokepicTemplate->palDataID = (u16)(shiny + 0x88);
        break;
    case SPECIES_EGG: // egg, manaphy egg
        pokepicTemplate->narcID = NARC_pbr_otherpoke;
        pokepicTemplate->charDataID = (u16)(0x84 + form);
        pokepicTemplate->palDataID = (u16)(0xCE + form);
        break;
    case SPECIES_MANAPHY_EGG: // bad egg
        pokepicTemplate->narcID = NARC_pbr_otherpoke;
        pokepicTemplate->charDataID = 0x84;
        pokepicTemplate->palDataID = 0xCE;
        break;
    case SPECIES_SHAYMIN: // land, sky
        if (form != 0) {
            pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
            pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x86 + form * 2);
            pokepicTemplate->palDataID = (u16)(shiny + 0xEA);
        } else {
            sub_02070560(pokepicTemplate, species, whichFacing, gender, shiny);
        }
        break;
    case SPECIES_ROTOM: // normal, fan, mow, wash, heat, frost
        if (form != 0) {
            pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
            pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x8A + form * 2);
            pokepicTemplate->palDataID = (u16)(shiny + 0xEC + form * 2);
        } else {
            sub_02070560(pokepicTemplate, species, whichFacing, gender, shiny);
        }
        break;
    case SPECIES_GIRATINA: // altered, origin
        if (form != 0) {
            pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
            pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x96 + form * 2);
            pokepicTemplate->palDataID = (u16)(shiny + 0xF8 + form * 2);
        } else {
            sub_02070560(pokepicTemplate, species, whichFacing, gender, shiny);
        }
        break;
    case SPECIES_PICHU: // spiky-ear
        if (form != 0) {
            pokepicTemplate->narcID = NARC_poketool_pokegra_otherpoke;
            pokepicTemplate->charDataID = (u16)(whichFacing / 2 + 0x9C);
            pokepicTemplate->palDataID = (u16)(shiny + 0xFE);
        } else {
            sub_02070560(pokepicTemplate, species, whichFacing, gender, shiny);
        }
        break;
    default:
        sub_02070560(pokepicTemplate, species, whichFacing, gender, shiny);
        if (species == SPECIES_SPINDA && whichFacing == MON_PIC_FACING_FRONT) {
            pokepicTemplate->species = SPECIES_SPINDA;
            pokepicTemplate->isAnimated = FALSE;
            pokepicTemplate->personality = personality;
        }
        break;
    }
}

u8 sub_0207083C(BoxPokemon *boxMon, u8 whichFacing) {
    return BoxPokemon_SpriteYOffset(boxMon, whichFacing, FALSE);
}

u8 sub_02070848(BoxPokemon *boxMon, u8 whichFacing) {
    return BoxPokemon_SpriteYOffset(boxMon, whichFacing, TRUE);
}

u8 BoxPokemon_SpriteYOffset(BoxPokemon *boxMon, u8 whichFacing, BOOL a2) {
    u16 species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES_OR_EGG, NULL);
    u8 gender = BoxPokemon_GetGender(boxMon);
    u32 pid = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    u8 form;
    if (species == SPECIES_EGG) {
        if (BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL) == SPECIES_MANAPHY) {
            form = EGG_MANAPHY;
        } else {
            form = EGG_STANDARD;
        }
    } else {
        form = BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);
    }
    if (a2 == TRUE) {
        return GetMonPicHeightBySpeciesGenderForm_PBR(species, gender, whichFacing, form, pid);
    } else {
        return GetMonPicHeightBySpeciesGenderForm(species, gender, whichFacing, form, pid);
    }
}

u8 GetMonPicHeightBySpeciesGenderForm(u16 species, u8 gender, u8 whichFacing, u8 form, u32 pid) {
#pragma unused(pid)
    NarcId narcID;
    s32 fileId;
    u8 ret;

    form = sub_02070438(species, form);
    switch (species) {
    case SPECIES_BURMY:
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x48 + whichFacing / 2 + form * 2;
        break;
    case SPECIES_WORMADAM:
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x4E + whichFacing / 2 + form * 2;
        break;
    case SPECIES_SHELLOS:
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x54 + whichFacing + form;
        break;
    case SPECIES_GASTRODON:
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x58 + whichFacing + form;
        break;
    case SPECIES_CHERRIM:
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x5C + whichFacing + form;
        break;
    case SPECIES_ARCEUS:
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x60 + whichFacing / 2 + form * 2;
        break;
    case SPECIES_CASTFORM:
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x40 + 2 * whichFacing + form;
        break;
    case SPECIES_DEOXYS:
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x00 + whichFacing / 2 + form * 2;
        break;
    case SPECIES_UNOWN:
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x08 + whichFacing / 2 + form * 2;
        break;
    case SPECIES_EGG: // egg, manaphy egg
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x84 + form;
        break;
    case SPECIES_MANAPHY_EGG: // bad egg
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x84;
        break;
    case SPECIES_SHAYMIN: // land, sky
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x88 + whichFacing / 2 + form * 2;
        break;
    case SPECIES_ROTOM: // normal, fan, mow, wash, heat, frost
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x8C + whichFacing / 2 + form * 2;
        break;
    case SPECIES_GIRATINA: // altered, origin
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x98 + whichFacing / 2 + form * 2;
        break;
    case SPECIES_PICHU: // spiky-ear
        narcID = NARC_poketool_pokegra_height_o;
        fileId = 0x9C + whichFacing / 2 + form * 2;
        break;
    default:
        narcID = NARC_poketool_pokegra_height;
        fileId = species * 4 + whichFacing + (gender != MON_FEMALE ? 1 : 0);
        break;
    }
    ReadWholeNarcMemberByIdPair(&ret, narcID, fileId);
    return ret;
}

u8 GetMonPicHeightBySpeciesGenderForm_PBR(u16 species, u8 gender, u8 whichFacing, u8 form, u32 pid) {
    // species -> r5
    // gender -> r6
    // whichFacing -> r4
    // form -> <overwrittten>
    // pid -> sp18
#pragma unused(pid)
    NarcId narcID;
    s32 fileId;
    u8 ret;

    form = sub_02070438(species, form);
    switch (species) {
    case SPECIES_BURMY:
        narcID = NARC_pbr_dp_height_o;
        fileId = 0x48 + whichFacing / 2 + form * 2;
        break;
    case SPECIES_WORMADAM:
        narcID = NARC_pbr_dp_height_o;
        fileId = 0x4E + whichFacing / 2 + form * 2;
        break;
    case SPECIES_SHELLOS:
        narcID = NARC_pbr_dp_height_o;
        fileId = 0x54 + whichFacing + form;
        break;
    case SPECIES_GASTRODON:
        narcID = NARC_pbr_dp_height_o;
        fileId = 0x58 + whichFacing + form;
        break;
    case SPECIES_CHERRIM:
        narcID = NARC_pbr_dp_height_o;
        fileId = 0x5C + whichFacing + form;
        break;
    case SPECIES_ARCEUS:
        narcID = NARC_pbr_dp_height_o;
        fileId = 0x60 + whichFacing / 2 + form * 2;
        break;
    case SPECIES_CASTFORM:
        narcID = NARC_pbr_dp_height_o;
        fileId = 0x40 + 2 * whichFacing + form;
        break;
    case SPECIES_DEOXYS:
        narcID = NARC_pbr_dp_height_o;
        fileId = 0x00 + whichFacing / 2 + form * 2;
        break;
    case SPECIES_UNOWN:
        narcID = NARC_pbr_dp_height_o;
        fileId = 0x08 + whichFacing / 2 + form * 2;
        break;
    case SPECIES_EGG: // egg, manaphy egg
        narcID = NARC_pbr_dp_height_o;
        fileId = 0x84 + form;
        break;
    case SPECIES_MANAPHY_EGG: // bad egg
        narcID = NARC_pbr_dp_height_o;
        fileId = 0x84;
        break;
    case SPECIES_SHAYMIN: // land, sky
        if (form != 0) {
            narcID = NARC_poketool_pokegra_height_o;
            fileId = 0x88 + whichFacing / 2 + form * 2;
        } else {
            narcID = NARC_pbr_dp_height;
            fileId = species * 4 + whichFacing + (gender != MON_FEMALE ? 1 : 0);
        }
        break;
    case SPECIES_ROTOM: // normal, fan, mow, wash, heat, frost
        if (form != 0) {
            narcID = NARC_poketool_pokegra_height_o;
            fileId = 0x8C + whichFacing / 2 + form * 2;
        } else {
            narcID = NARC_pbr_dp_height;
            fileId = species * 4 + whichFacing + (gender != MON_FEMALE ? 1 : 0);
        }
        break;
    case SPECIES_GIRATINA: // altered, origin
        if (form != 0) {
            narcID = NARC_poketool_pokegra_height_o;
            fileId = 0x98 + whichFacing / 2 + form * 2;
        } else {
            narcID = NARC_pbr_dp_height;
            fileId = species * 4 + whichFacing + (gender != MON_FEMALE ? 1 : 0);
        }
        break;
        //    case SPECIES_PICHU: // spiky-ear
        //        if (form != 0) {
        //            narcID = NARC_pbr_dp_height_o;
        //            fileId = 0x9C + whichFacing / 2 + form * 2;
        //        } else {
        //            narcID = NARC_pbr_dp_height;
        //            fileId = species * 4 + whichFacing + (gender != MON_FEMALE ? 1 : 0);
        //        }
        //        break;
    default:
        narcID = NARC_pbr_dp_height;
        fileId = species * 4 + whichFacing + (gender != MON_FEMALE ? 1 : 0);
        break;
    }
    ReadWholeNarcMemberByIdPair(&ret, narcID, fileId);
    return ret;
}

static const struct ManagedSpriteTemplate _020FF588 = {
    0,
    0,
    0,
    0,
    0,
    0,
    NNS_G2D_VRAM_TYPE_2DMAIN,
    { 0x4E2F, 0x4E2A, 0x4E27, 0x4E27, -1u, -1u },
    2,
    1
};

static const int _020FF50C[] = {
    0, 1, 1, 2, 0, 3
};

struct ManagedSprite *sub_02070C24(SpriteSystem *renderer, SpriteManager *gfxHandler, PaletteData *plttData, int x, int y, int trainerClass, int battlerPosition, BOOL isLink, int resTag, HeapID heapID) {
    struct ManagedSpriteTemplate spriteResourcesTemplate;
    struct ManagedSprite *object;
    NARC *narc;
    struct UnkStruct_02070D3C fileIDs;
    int plttNum;

    plttNum = 1;
    sub_02070D3C(trainerClass, battlerPosition, isLink, &fileIDs);
    if (trainerClass == TRAINERCLASS_CASTLE_VALET) {
        plttNum = 2;
    }
    narc = NARC_New(fileIDs.narcId, heapID);
    SpriteSystem_LoadCharResObjFromOpenNarc(renderer, gfxHandler, narc, fileIDs.ncgr_id, FALSE, NNS_G2D_VRAM_TYPE_2DMAIN, resTag + 0x4E2F);
    SpriteSystem_LoadPaletteBufferFromOpenNarc(plttData, PLTTBUF_MAIN_OBJ, renderer, gfxHandler, narc, fileIDs.nclr_id, FALSE, plttNum, NNS_G2D_VRAM_TYPE_2DMAIN, resTag + 0x4E2A);
    SpriteSystem_LoadCellResObjFromOpenNarc(renderer, gfxHandler, narc, fileIDs.ncer_id, FALSE, resTag + 0x4E27);
    SpriteSystem_LoadAnimResObjFromOpenNarc(renderer, gfxHandler, narc, fileIDs.nanr_id, FALSE, resTag + 0x4E27);
    NARC_Delete(narc);
    spriteResourcesTemplate = _020FF588;
    spriteResourcesTemplate.resIdList[GF_GFX_RES_TYPE_CHAR] = resTag + 0x4E2F;
    spriteResourcesTemplate.resIdList[GF_GFX_RES_TYPE_PLTT] = resTag + 0x4E2A;
    spriteResourcesTemplate.resIdList[GF_GFX_RES_TYPE_CELL] = resTag + 0x4E27;
    spriteResourcesTemplate.resIdList[GF_GFX_RES_TYPE_ANIM] = resTag + 0x4E27;
    spriteResourcesTemplate.spritePriority = _020FF50C[resTag];
    object = SpriteSystem_NewSprite(renderer, gfxHandler, &spriteResourcesTemplate);
    Sprite_SetPalOffsetRespectVramOffset(object->sprite, 0);
    ManagedSprite_SetPositionXY(object, x, y);
    ManagedSprite_TickFrame(object);
    ManagedSprite_SetAnimateFlag(object, 1);
    return object;
}

void sub_02070D3C(s32 trainer_class, s32 battlerPosition, BOOL isLink, struct UnkStruct_02070D3C *a3) {
    if (battlerPosition == 2) {
        a3->narcId = NARC_a_0_5_8;
        a3->ncgr_id = trainer_class * 5 + 0;
        a3->nclr_id = trainer_class * 5 + 1;
        a3->ncer_id = trainer_class * 5 + 2;
        a3->nanr_id = trainer_class * 5 + 3;
        a3->ncbr_id = trainer_class * 5 + 4;
    } else {
        a3->narcId = NARC_a_0_0_6;
        trainer_class = TrainerClassToBackpicID(trainer_class, isLink);
        a3->ncgr_id = trainer_class * 5 + 0;
        a3->nclr_id = trainer_class * 5 + 1;
        a3->ncer_id = trainer_class * 5 + 2;
        a3->nanr_id = trainer_class * 5 + 3;
        a3->ncbr_id = trainer_class * 5 + 4;
    }
}

void sub_02070D84(s32 trainer_class, s32 battlerSide, struct UnkStruct_02070D3C *a2) {
    sub_02070D3C(trainer_class, battlerSide, FALSE, a2);
}

u32 Pokemon_GetStructSize(void)
{
    return sizeof(Pokemon);
}

u32 BoxPokemon_GetStructSize(void)
{
    return sizeof(BoxPokemon);
}

u8 Pokemon_GetForm(Pokemon *mon)
{
    return BoxPokemon_GetForm(&mon->box);
}

u8 BoxPokemon_GetForm(BoxPokemon *boxMon)
{
    return BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);
}

BoxPokemon *Pokemon_GetBoxPokemon(Pokemon *mon)
{
    return &mon->box;
}

BOOL Pokemon_TryLevelUp(Pokemon *mon)
{
    u16 species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    u8 nextLevel = Pokemon_GetData(mon, MON_DATA_LEVEL, NULL) + 1;
    u32 exp = Pokemon_GetData(mon, MON_DATA_EXP, NULL);
    u32 growthrate = GetMonBaseStat(species, BASE_GROWTH_RATE);
    u32 maxExp = GetExpByGrowthRateAndLevel((int)growthrate, MAX_MON_LEVEL);
    if (exp > maxExp) {
        exp = maxExp;
        Pokemon_SetData(mon, MON_DATA_EXP, &exp);
    }
    if (nextLevel > MAX_MON_LEVEL) {
        return FALSE;
    }
    if (exp >= GetExpByGrowthRateAndLevel((int)growthrate, nextLevel)) {
        Pokemon_SetData(mon, MON_DATA_LEVEL, &nextLevel);
        return TRUE;
    }
    return FALSE;
}

u16 GetMonEvolution(Party *party, Pokemon *mon, u8 context, u16 usedItem, int *method_ret) {
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

    species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    heldItem = Pokemon_GetData(mon, MON_DATA_HELD_ITEM, NULL);
    pid = Pokemon_GetData(mon, MON_DATA_PERSONALITY, NULL);
    beauty = Pokemon_GetData(mon, MON_DATA_BEAUTY, NULL);
    pid_hi = (u16)((pid & 0xFFFF0000) >> 16);
    holdEffect = GetItemAttr(heldItem, ITEMATTR_HOLD_EFFECT, HEAP_ID_DEFAULT);
    // Kadabra bypasses Everstone because he's just that broken.
    if (species != SPECIES_KADABRA && holdEffect == HOLD_EFFECT_NO_EVOLVE && context != EVOCTX_ITEM_USE) {
        return SPECIES_NONE;
    }
    // Spiky-ear Pichu cannot evolve
    if (species == SPECIES_PICHU && Pokemon_GetData(mon, MON_DATA_FORM, 0) == 1) {
        return SPECIES_NONE;
    }
    if (method_ret == NULL) {
        method_ret = &method_local;
    }
    evoTable = AllocFromHeap(HEAP_ID_DEFAULT, MAX_EVOS_PER_POKE * sizeof(struct Evolution));
    LoadMonEvolutionTable(species, evoTable);
    switch (context) {
    case EVOCTX_LEVELUP:
        level = (u8)Pokemon_GetData(mon, MON_DATA_LEVEL, NULL);
        friendship = (u16)Pokemon_GetData(mon, MON_DATA_FRIENDSHIP, NULL);
        for (i = 0; i < 7; i++) {
            switch (evoTable[i].method) {
            case EVO_NONE:
                break;
            case EVO_LEVEL_FRIENDSHIP:
                if (friendship >= 220) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_FRIENDSHIP;
                }
                break;
            case EVO_LEVEL_FRIENDSHIP_DAY:
                if (IsNighttime() == FALSE && friendship >= 220) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_FRIENDSHIP_DAY;
                }
                break;
            case EVO_LEVEL_FRIENDSHIP_NIGHT:
                if (IsNighttime() == TRUE && friendship >= 220) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_FRIENDSHIP_NIGHT;
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
                if (evoTable[i].param <= level && Pokemon_GetData(mon, MON_DATA_ATK, NULL) > Pokemon_GetData(mon, MON_DATA_DEF, NULL)) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_ATK_GT_DEF;
                }
                break;
            case EVO_LEVEL_ATK_EQ_DEF:
                if (evoTable[i].param <= level && Pokemon_GetData(mon, MON_DATA_ATK, NULL) == Pokemon_GetData(mon, MON_DATA_DEF, NULL)) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_ATK_EQ_DEF;
                }
                break;
            case EVO_LEVEL_ATK_LT_DEF:
                if (evoTable[i].param <= level && Pokemon_GetData(mon, MON_DATA_ATK, NULL) < Pokemon_GetData(mon, MON_DATA_DEF, NULL)) {
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
                if (Pokemon_HasMove(mon, evoTable[i].param) == TRUE) {
                    target = evoTable[i].target;
                    *method_ret = EVO_HAS_MOVE;
                }
                break;
            case EVO_OTHER_PARTY_MON:
                if (party != NULL && Party_HasMon(party, evoTable[i].param) == 1) {
                    target = evoTable[i].target;
                    *method_ret = EVO_OTHER_PARTY_MON;
                }
                break;
            case EVO_LEVEL_MALE:
                if (Pokemon_GetData(mon, MON_DATA_GENDER, NULL) == MON_MALE && evoTable[i].param <= level) {
                    target = evoTable[i].target;
                    *method_ret = EVO_LEVEL_MALE;
                }
                break;
            case EVO_LEVEL_FEMALE:
                if (Pokemon_GetData(mon, MON_DATA_GENDER, NULL) == MON_FEMALE && evoTable[i].param <= level) {
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
            if (evoTable[i].method == EVO_STONE_MALE && Pokemon_GetData(mon, MON_DATA_GENDER, NULL) == MON_MALE && usedItem == evoTable[i].param) {
                target = evoTable[i].target;
                *method_ret = 0;
                break;
            }
            if (evoTable[i].method == EVO_STONE_FEMALE && Pokemon_GetData(mon, MON_DATA_GENDER, NULL) == MON_FEMALE && usedItem == evoTable[i].param) {
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

u16 ReadFromPersonalPmsNarc(u16 species)
{
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

u16 GetEggSpecies(u16 species)
{
    switch (species) {
    case SPECIES_WOBBUFFET:
    case SPECIES_MARILL:
    case SPECIES_MR_MIME:
    case SPECIES_SUDOWOODO:
    case SPECIES_SNORLAX:
    case SPECIES_MANTINE:
    case SPECIES_ROSELIA:
    case SPECIES_CHANSEY:
    case SPECIES_CHIMECHO:
        return species;
    default:
        return ReadFromPersonalPmsNarc(species);
    }
}

void BoxPokemon_SetDefaultMoves(BoxPokemon *boxMon) {
    BOOL decry;
    u16 *levelUpLearnset = AllocFromHeap(HEAP_ID_DEFAULT, MAX_LEARNED_MOVES * sizeof(u16));
    decry = AcquireBoxMonLock(boxMon);

    u16 species = (u16)BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    u32 form = BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);
    u8 level = (u8)BoxPokemon_GetLevel(boxMon);
    LoadLevelUpLearnset_HandleAlternateForm(species, (int)form, levelUpLearnset);
    for (int i = 0; levelUpLearnset[i] != LEVEL_UP_LEARNSET_END; i++) {
        if ((levelUpLearnset[i] & LEVEL_UP_LEARNSET_LEVEL_MASK) > (level << LEVEL_UP_LEARNSET_LEVEL_SHIFT)) {
            break;
        }
        u16 move = LEVEL_UP_LEARNSET_MOVE(levelUpLearnset[i]);
        if (BoxPokemon_AddMove(boxMon, move) == MOVE_APPEND_FULL) {
            BoxPokemon_AppendMove(boxMon, move);
        }
    }
    FreeToHeap(levelUpLearnset);
    ReleaseBoxMonLock(boxMon, decry);
}

u32 Pokemon_AddMove(Pokemon *mon, u16 move)
{
    return BoxPokemon_AddMove(Pokemon_GetBoxPokemon(mon), move);
}

u32 BoxPokemon_AddMove(BoxPokemon *boxMon, u16 move)
{
    u32 ret = MOVE_APPEND_FULL;
    int i;
    BOOL decry = AcquireBoxMonLock(boxMon);
    u16 cur_move;
    for (i = 0; i < MAX_MON_MOVES; i++) {
        cur_move = (u16)BoxPokemon_GetData(boxMon, MON_DATA_MOVE1 + i, NULL);
        if (cur_move == MOVE_NONE) {
            BoxPokemon_SetMoveSlot(boxMon, move, (u8)i);
            ret = move;
            break;
        }
        if (cur_move == move) {
            ret = MOVE_APPEND_KNOWN;
            break;
        }
    }
    ReleaseBoxMonLock(boxMon, decry);
    return ret;
}

void Pokemon_AppendMove(Pokemon *mon, u16 move)
{
    BoxPokemon_AppendMove(Pokemon_GetBoxPokemon(mon), move);
}

void BoxPokemon_AppendMove(BoxPokemon *boxMon, u16 move)
{
    BOOL decry = AcquireBoxMonLock(boxMon);
    int i;
    u16 moves[MAX_MON_MOVES];
    u8 pp[MAX_MON_MOVES];
    u8 ppUp[MAX_MON_MOVES];

    for (i = 0; i < MAX_MON_MOVES - 1; i++) {
        moves[i] = (u16)BoxPokemon_GetData(boxMon, MON_DATA_MOVE1 + i + 1, NULL);
        pp[i] = (u8)BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_CUR_PP + i + 1, NULL);
        ppUp[i] = (u8)BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_PP_UPS + i + 1, NULL);
    }

    moves[3] = move;
    pp[3] = (u8)GetMoveAttr(move, MOVEATTR_PP);
    ppUp[3] = 0;

    for (i = 0; i < MAX_MON_MOVES; i++) {
        BoxPokemon_SetData(boxMon, MON_DATA_MOVE1 + i, &moves[i]);
        BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_CUR_PP + i, &pp[i]);
        BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_PP_UPS + i, &ppUp[i]);
    }

    ReleaseBoxMonLock(boxMon, decry);
}

void MonSetMoveInSlot_ResetPpUp(Pokemon *mon, u16 move, u8 slot) {
    int pp;
    int ppUp;

    Pokemon_SetMoveSlot(mon, move, slot);
    ppUp = 0;
    Pokemon_SetData(mon, MON_DATA_MOVE1_PP_UPS + slot, &ppUp);
    pp = MoveTable_CalcMaxPP(move, 0);
    Pokemon_SetData(mon, MON_DATA_MOVE1_CUR_PP + slot, &pp);
}

void Pokemon_SetMoveSlot(Pokemon *mon, u16 move, u8 slot)
{
    BoxPokemon_SetMoveSlot(&mon->box, move, slot);
}

void BoxPokemon_SetMoveSlot(BoxPokemon *boxMon, u16 move, u8 slot)
{
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1 + slot, &move);
    u8 ppUp = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_PP_UPS + slot, NULL);
    u8 maxPP = MoveTable_CalcMaxPP(move, ppUp);
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_CUR_PP + slot, &maxPP);
}

u32 MonTryLearnMoveOnLevelUp(Pokemon *mon, int *last_i, u16 *sp0)
{
    u32 ret = 0;
    u16 *levelUpLearnset = AllocFromHeap(HEAP_ID_DEFAULT, MAX_LEARNED_MOVES * sizeof(u16));
    u16 species = (u16)Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    u32 form = Pokemon_GetData(mon, MON_DATA_FORM, NULL);
    u8 level = (u8)Pokemon_GetData(mon, MON_DATA_LEVEL, NULL);
    LoadLevelUpLearnset_HandleAlternateForm(species, (int)form, levelUpLearnset);

    if (levelUpLearnset[*last_i] == LEVEL_UP_LEARNSET_END) {
        FreeToHeap(levelUpLearnset);
        return 0;
    }
    while ((levelUpLearnset[*last_i] & LEVEL_UP_LEARNSET_LEVEL_MASK) != (level << LEVEL_UP_LEARNSET_LEVEL_SHIFT)) {
        (*last_i)++;
        if (levelUpLearnset[*last_i] == LEVEL_UP_LEARNSET_END) {
            FreeToHeap(levelUpLearnset);
            return 0;
        }
    }
    if ((levelUpLearnset[*last_i] & LEVEL_UP_LEARNSET_LEVEL_MASK) == (level << LEVEL_UP_LEARNSET_LEVEL_SHIFT)) {
        *sp0 = LEVEL_UP_LEARNSET_MOVE(levelUpLearnset[*last_i]);
        (*last_i)++;
        ret = Pokemon_AddMove(mon, *sp0);
    }
    FreeToHeap(levelUpLearnset);
    return ret;
}

void Pokemon_SwapMoveSlots(Pokemon *mon, int slot1, int slot2)
{
    BoxPokemon_SwapMoveSlots(&mon->box, slot1, slot2);
}

void BoxPokemon_SwapMoveSlots(BoxPokemon *boxMon, int slot1, int slot2)
{
    u16 moves[2];
    u8 pp[2];
    u8 ppUp[2];

    moves[0] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1 + slot1, NULL);
    pp[0] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_CUR_PP + slot1, NULL);
    ppUp[0] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_PP_UPS + slot1, NULL);
    moves[1] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1 + slot2, NULL);
    pp[1] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_CUR_PP + slot2, NULL);
    ppUp[1] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_PP_UPS + slot2, NULL);

    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1 + slot1, &moves[1]);
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_CUR_PP + slot1, &pp[1]);
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_PP_UPS + slot1, &ppUp[1]);
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1 + slot2, &moves[0]);
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_CUR_PP + slot2, &pp[0]);
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_PP_UPS + slot2, &ppUp[0]);
}

void Pokemon_ClearMoveSlot(Pokemon *mon, u32 slot)
{
    u16 move;
    u8 pp;
    u8 ppUps;
    for (; slot < MAX_MON_MOVES - 1; slot++) {
        move = Pokemon_GetData(mon, (MON_DATA_MOVE1 + slot + 1), NULL);
        pp = Pokemon_GetData(mon, (MON_DATA_MOVE1_CUR_PP + slot + 1), NULL);
        ppUps = Pokemon_GetData(mon, (MON_DATA_MOVE1_PP_UPS + slot + 1), NULL);
        Pokemon_SetData(mon, (MON_DATA_MOVE1 + slot), &move);
        Pokemon_SetData(mon, (MON_DATA_MOVE1_CUR_PP + slot), &pp);
        Pokemon_SetData(mon, (MON_DATA_MOVE1_PP_UPS + slot), &ppUps);
    }
    move = MOVE_NONE;
    pp = 0;
    ppUps = 0;

    Pokemon_SetData(mon, MON_DATA_MOVE1 + MAX_MON_MOVES - 1, &move);
    Pokemon_SetData(mon, MON_DATA_MOVE1_CUR_PP + MAX_MON_MOVES - 1, &pp);
    Pokemon_SetData(mon, MON_DATA_MOVE1_PP_UPS + MAX_MON_MOVES - 1, &ppUps);
}

BOOL Pokemon_HasMove(Pokemon *mon, u16 move) {
    int i;
    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (Pokemon_GetData(mon, MON_DATA_MOVE1 + i, NULL) == move) {
            break;
        }
    }
    if (i != MAX_MON_MOVES) {
        return TRUE;
    } else {
        return FALSE;
    }
}

void CopyBoxPokemonToPokemon(const BoxPokemon *src, Pokemon *dest) {
    u32 sp0 = 0;
    BallCapsule sp4;
    struct Mail *mail;
    dest->box = *src;
    if (dest->box.box_lock) {
        dest->box.party_lock = TRUE;
    }
    Pokemon_SetData(dest, MON_DATA_STATUS, &sp0);
    Pokemon_SetData(dest, MON_DATA_HP, &sp0);
    Pokemon_SetData(dest, MON_DATA_MAX_HP, &sp0);
    mail = Mail_New(HEAP_ID_DEFAULT);
    Pokemon_SetData(dest, MON_DATA_MAIL, mail);
    FreeToHeap(mail);
    Pokemon_SetData(dest, MON_DATA_BALL_CAPSULE_ID, &sp0);
    MI_CpuClearFast(&sp4, sizeof(sp4));
    Pokemon_SetData(dest, MON_DATA_BALL_CAPSULE, &sp4);
    Pokemon_CalcLevelAndStats(dest);
}

u8 Party_GetMaxLevel(Party *party)
{
    int i;
    int r7 = Party_GetCount(party);
    u8 ret = 1;
    u8 level;
    for (i = 0; i < r7; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);
        if (Pokemon_GetData(mon, MON_DATA_SPECIES, NULL) != SPECIES_NONE
            && !Pokemon_GetData(mon, MON_DATA_IS_EGG, NULL)) {
            level = (u8)Pokemon_GetData(mon, MON_DATA_LEVEL, NULL);
            if (level > ret) {
                ret = level;
            }
        }
    }
    return ret;
}

u16 Species_JohtoDexNumber(u16 species)
{
    u16 ret;
    ReadFromNarcMemberByIdPair(&ret, NARC_poketool_johtozukan, 0, species * sizeof(u16), sizeof(u16));
    return ret;
}

u16 *LoadSpeciesToJohtoDexNoLUT(void)
{
    return AllocAtEndAndReadWholeNarcMemberByIdPair(NARC_poketool_johtozukan, 0, HEAP_ID_3);
}

void Pokemon_Copy(Pokemon *src, Pokemon *dest)
{
    *dest = *src;
}

void BoxPokemon_Copy(BoxPokemon *src, BoxPokemon *dest)
{
    *dest = *src;
}

void BoxPokemon_FromPokemon(Pokemon *src, BoxPokemon *dest)
{
    *dest = src->box;
}

s8 Pokemon_GetFlavorAffinity(Pokemon *mon, int flavor)
{
    return BoxPokemon_GetFlavorAffinity(&mon->box, flavor);
}

s8 BoxPokemon_GetFlavorAffinity(BoxPokemon *boxMon, int flavor)
{
    return GetFlavorPreferenceFromPID(BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL), flavor);
}

s8 GetFlavorPreferenceFromPID(u32 personality, int flavor)
{
    return sFlavorPreferencesByNature[Pokemon_GetNatureOf(personality)][flavor];
}

int Species_LoadLearnsetTable(u32 species, u32 form, u16 *dest)
{
    int i;
    u16 *levelUpLearnset = AllocFromHeap(HEAP_ID_DEFAULT, MAX_LEARNED_MOVES * sizeof(u16));
    LoadLevelUpLearnset_HandleAlternateForm(species, (int)form, levelUpLearnset);
    for (i = 0; levelUpLearnset[i] != LEVEL_UP_LEARNSET_END; i++) {
        dest[i] = LEVEL_UP_LEARNSET_MOVE(levelUpLearnset[i]);
    }
    FreeToHeap(levelUpLearnset);
    return i;
}

void Party_GivePokerusAtRandom(Party *party) {
    int count = Party_GetCount(party);
    int idx;
    Pokemon *mon;
    u8 pokerus;
    switch (LCRandom()) {
    case 0x4000:
    case 0x8000:
    case 0xC000:
        do {
            idx = LCRandom() % count;
            mon = Party_GetMonByIndex(party, idx);
        } while (Pokemon_GetData(mon, MON_DATA_SPECIES, NULL) == SPECIES_NONE || Pokemon_GetData(mon, MON_DATA_IS_EGG, NULL));
        if (!Party_MaskMonsWithPokerus(party, (u8)MaskOfFlagNo(idx))) {
            do {
                pokerus = (u8)LCRandom();
            } while (!(pokerus & 7));
            if (pokerus & 0xF0) {
                pokerus &= 7;
            }

            pokerus |= (pokerus << 4);
            pokerus &= 0xF3;
            pokerus++;

            Pokemon_SetData(mon, MON_DATA_POKERUS, &pokerus);
        }
    }
}

u8 Party_MaskMonsWithPokerus(Party *party, u8 mask) {
    int i = 0;
    u32 flag = 1;
    u8 ret = 0;
    Pokemon *mon;
    if (mask != 0) {
        do {
            if (mask & 1) {
                mon = Party_GetMonByIndex(party, i);
                if (Pokemon_GetData(mon, MON_DATA_POKERUS, NULL)) {
                    ret |= flag;
                }
            }
            i++;
            flag <<= 1;
            mask >>= 1;
        } while (mask != 0);
    } else {
        mon = Party_GetMonByIndex(party, 0);
        if (Pokemon_GetData(mon, MON_DATA_POKERUS, NULL)) {
            ret++;
        }
    }
    return ret;
}

void Party_UpdatePokerus(Party *party, int r5) {
    int i;
    u8 pokerus;
    Pokemon *mon;
    int count = Party_GetCount(party);
    for (i = 0; i < count; i++) {
        mon = Party_GetMonByIndex(party, i);
        if (Pokemon_GetData(mon, MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
            pokerus = (u8)Pokemon_GetData(mon, MON_DATA_POKERUS, NULL);
            if (pokerus & 0xF) {
                if ((pokerus & 0xF) < r5 || r5 > 4) {
                    pokerus &= 0xF0;
                } else {
                    pokerus -= r5;
                }
                if (pokerus == 0) {
                    pokerus = 0x10; // immune
                }
                Pokemon_SetData(mon, MON_DATA_POKERUS, &pokerus);
            }
        }
    }
}

void Party_SpreadPokerus(Party *party)
{
    int count = Party_GetCount(party);
    int i;
    Pokemon *mon;
    u8 pokerus;
    if ((LCRandom() % 3) == 0) {
        for (i = 0; i < count; i++) {
            mon = Party_GetMonByIndex(party, i);
            if (Pokemon_GetData(mon, MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
                pokerus = (u8)Pokemon_GetData(mon, MON_DATA_POKERUS, NULL);
                if (pokerus & 0xF) {
                    if (i != 0) {
                        mon = Party_GetMonByIndex(party, i - 1);
                        if (!(Pokemon_GetData(mon, MON_DATA_POKERUS, NULL) & 0xF0)) {
                            Pokemon_SetData(mon, MON_DATA_POKERUS, &pokerus);
                        }
                    }
                    if (i < count - 1) {
                        mon = Party_GetMonByIndex(party, i + 1);
                        if (!(Pokemon_GetData(mon, MON_DATA_POKERUS, NULL) & 0xF0)) {
                            Pokemon_SetData(mon, MON_DATA_POKERUS, &pokerus);
                            i++; // don't infect the rest of the party
                        }
                    }
                }
            }
        }
    }
}

BOOL Pokemon_HasPokerus(Pokemon *mon)
{
    return BoxMon_HasPokerus(&mon->box);
}

BOOL BoxMon_HasPokerus(BoxPokemon *boxMon)
{
    return (BoxPokemon_GetData(boxMon, MON_DATA_POKERUS, NULL) & 0xF) != 0;
}

BOOL Pokemon_IsImmuneToPokerus(Pokemon *mon)
{
    return BoxMon_IsImmuneToPokerus(&mon->box);
}

BOOL BoxMon_IsImmuneToPokerus(BoxPokemon *boxMon)
{
    u8 pokerus = BoxPokemon_GetData(boxMon, MON_DATA_POKERUS, NULL);
    if (pokerus & 0xF) {
        return FALSE;
    }
    return (pokerus & 0xF0) != 0;
}

void Pokemon_UpdateArceusForm(Pokemon *mon)
{
    BoxPokemon_UpdateArceusForm(&mon->box);
}

void BoxPokemon_UpdateArceusForm(BoxPokemon *boxMon)
{
    int species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    int ability = BoxPokemon_GetData(boxMon, MON_DATA_ABILITY, NULL);
    int heldItem = BoxPokemon_GetData(boxMon, MON_DATA_HELD_ITEM, NULL);

    if (species == SPECIES_ARCEUS && ability == ABILITY_MULTITYPE) {
        int form = HoldEffect_GetArceusType((u16)GetItemAttr((u16)heldItem, 1, HEAP_ID_DEFAULT));
        BoxPokemon_SetData(boxMon, MON_DATA_FORM, &form);
    }
}

u32 HoldEffect_GetArceusType(u16 holdEffect)
{
    switch (holdEffect) {
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
    case HOLD_EFFECT_ARCEUS_FIGHTING:
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

s32 Mon_UpdateGiratinaForm(Pokemon *mon) {
    s32 ret = BoxMon_UpdateGiratinaForm(&mon->box);
    if (ret != -1) {
        Pokemon_CalcLevelAndStats(mon);
    }
    return ret;
}

s32 BoxMon_UpdateGiratinaForm(BoxPokemon *boxMon) {
    int species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    int heldItem = BoxPokemon_GetData(boxMon, MON_DATA_HELD_ITEM, NULL);
    int form;
    if (species == SPECIES_GIRATINA) {
        if (heldItem == ITEM_GRISEOUS_ORB) {
            form = GIRATINA_ORIGIN;
        } else {
            form = GIRATINA_ALTERED;
        }
        BoxPokemon_SetData(boxMon, MON_DATA_FORM, &form);
        BoxPokemon_UpdateAbility(boxMon);
        return form;
    }
    return -1;
}

void Mon_ForceSetGiratinaOriginForm(Pokemon *mon) {
    s32 form = GIRATINA_ORIGIN;
    if (Pokemon_GetData(mon, MON_DATA_SPECIES, NULL) == SPECIES_GIRATINA) {
        BoxPokemon_SetData(&mon->box, MON_DATA_FORM, &form);
        BoxPokemon_UpdateAbility(&mon->box);
        Pokemon_CalcLevelAndStats(mon);
    }
}

void Party_UpdateAllGiratina_DistortionWorld(Party *party, BOOL force_origin) {
    int npoke = Party_GetCount(party);
    int i;
    Pokemon *mon;
    for (i = 0; i < npoke; i++) {
        mon = Party_GetMonByIndex(party, i);
        if (force_origin) {
            Mon_ForceSetGiratinaOriginForm(mon);
        } else {
            Mon_UpdateGiratinaForm(mon);
        }
    }
}

void Pokemon_SetShayminForm(Pokemon *mon, int form)
{
    BoxPokemon_SetShayminForm(&mon->box, form);
    Pokemon_CalcLevelAndStats(mon);
}

void BoxPokemon_SetShayminForm(BoxPokemon *boxMon, int form)
{
    if (BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL) == SPECIES_SHAYMIN) {
        GF_ASSERT(form <= 1);
        BoxPokemon_SetData(boxMon, MON_DATA_FORM, &form);
        BoxPokemon_UpdateAbility(boxMon);
    }
}

BOOL Pokemon_CanUseGracidea(Pokemon *mon)
{
    RTCTime time;
    int species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    int form = Pokemon_GetData(mon, MON_DATA_FORM, NULL);
    int status = Pokemon_GetData(mon, MON_DATA_STATUS, NULL);
    int hp = Pokemon_GetData(mon, MON_DATA_HP, NULL);
    BOOL fatefulEncounter = Pokemon_GetData(mon, MON_DATA_FATEFUL_ENCOUNTER, NULL);
    GF_RTC_CopyTime(&time);

    if (species == SPECIES_SHAYMIN && form == SHAYMIN_LAND && hp != 0 && fatefulEncounter == TRUE && !(status & MON_STATUS_FRZ_MASK) && (time.hour >= 4 && time.hour < 20)) {
        return TRUE;
    } else {
        return FALSE;
    }
}

void Party_SetShayminLandForm(Party *party) {
    int npoke = Party_GetCount(party);
    int i;
    int species;
    int form;
    Pokemon *mon;
    for (i = 0; i < npoke; i++) {
        mon = Party_GetMonByIndex(party, i);
        species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
        form = Pokemon_GetData(mon, MON_DATA_FORM, NULL);
        if (species == SPECIES_SHAYMIN && form == SHAYMIN_SKY) {
            Pokemon_SetShayminForm(mon, SHAYMIN_LAND);
        }
    }
}

BOOL Party_TryResetShaymin(Party *party, int min_max, const RTCTime *time) {
    int hour, minute;
    if (time->hour >= 20 || time->hour < 4) {
        hour = time->hour;
        if (hour < 4) {
            hour += 24;
        }
        minute = time->minute + 60 * (hour - 20);
        if (minute < min_max + 1) {
            Party_SetShayminLandForm(party);
            return TRUE;
        } else {
            return FALSE;
        }
    } else {
        hour = time->hour;
        minute = time->minute + 60 * (hour - 4);
        if (minute < min_max) {
            Party_SetShayminLandForm(party);
            return TRUE;
        } else {
            return FALSE;
        }
    }
}

BOOL Mon_UpdateRotomForm(Pokemon *mon, int form, int defaultSlot)
{
    static const u16 form_moves[ROTOM_FORM_MAX] = {
        MOVE_NONE,
        MOVE_OVERHEAT,
        MOVE_HYDRO_PUMP,
        MOVE_BLIZZARD,
        MOVE_AIR_SLASH,
        MOVE_LEAF_STORM,
    };

    int i, j;
    int cur_move;
    int new_move;
    if (Pokemon_GetData(mon, MON_DATA_SPECIES, NULL) != SPECIES_ROTOM) {
        return FALSE;
    }
    Pokemon_GetData(mon, MON_DATA_FORM, NULL);
    new_move = form_moves[form];
    for (i = 0; i < MAX_MON_MOVES; i++) {
        cur_move = Pokemon_GetData(mon, MON_DATA_MOVE1 + i, NULL);
        for (j = ROTOM_HEAT; j < (unsigned)ROTOM_FORM_MAX; j++) {
            if (cur_move != MOVE_NONE && cur_move == form_moves[j]) {
                if (new_move != MOVE_NONE) {
                    MonSetMoveInSlot_ResetPpUp(mon, new_move, i);
                    new_move = MOVE_NONE;
                } else {
                    Pokemon_ClearMoveSlot(mon, i);
                    i--;
                }
                break;
            }
        }
    }
    if (new_move != MOVE_NONE) {
        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (Pokemon_GetData(mon, MON_DATA_MOVE1 + i, NULL) == MOVE_NONE) {
                MonSetMoveInSlot_ResetPpUp(mon, new_move, i);
                break;
            }
        }
        if (i == MAX_MON_MOVES) {
            MonSetMoveInSlot_ResetPpUp(mon, new_move, defaultSlot);
        }
    }
    if (Pokemon_GetData(mon, MON_DATA_MOVE1, NULL) == MOVE_NONE) {
        MonSetMoveInSlot_ResetPpUp(mon, MOVE_THUNDER_SHOCK, 0);
    }
    Pokemon_SetData(mon, MON_DATA_FORM, &form);
    UpdateMonAbility(mon);
    Pokemon_CalcLevelAndStats(mon);
    return TRUE;
}

void LoadLevelUpLearnset_HandleAlternateForm(int species, int form, u16 *levelUpLearnset) {
    ReadWholeNarcMemberByIdPair(levelUpLearnset, NARC_poketool_personal_wotbl, ResolveMonForm(species, form));
}

void sub_02071FDC(SOUND_CHATOT *r6, u32 r5, u16 r4, s32 unused, s32 sp18, u32 sp1C, u32 sp20, u32 sp24) {
#pragma unused(unused)
    if (r4 == SPECIES_CHATOT) {
        if (!sub_02006F30((int)r5)) {
            sub_02006E3C(1);
            PlayCryEx(r5, r4, sp18, sp1C, sp24, 0);
        } else {
            if (sp20) {
                sub_02006E3C(1);
            }
            sub_02006E4C(r6, 0, sp1C, sp18);
        }
    } else {
        PlayCryEx(r5, r4, sp18, sp1C, sp24, 0);
    }
}

void sub_0207204C(SOUND_CHATOT *r7, u32 r6, u16 r5, s32 r4, s32 sp20, u32 sp24, u32 sp28, u32 sp2C, u8 sp30) {
    if (r5 == SPECIES_CHATOT) {
        if (!sub_02006F30((int)r6)) {
            sub_02006E3C(1);
            sub_02006920(r6, r5, sp20, sp24, sp2C, sp30, r4);
        } else {
            if (sp28) {
                sub_02006E3C(1);
            }
            sub_02006EA0(r7, 0, sp24, sp20, sp30);
        }
    } else {
        sub_02006920(r6, r5, sp20, sp24, sp2C, sp30, r4);
    }
}

void sub_020720D4(Pokemon *mon) {
    PlayCry(Pokemon_GetData(mon, MON_DATA_SPECIES, NULL), Pokemon_GetData(mon, MON_DATA_FORM, NULL));
}

void sub_020720FC(Pokemon *mon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, HeapID heapID) {
    u32 hp;
    sub_0207213C(&mon->box, a1, pokeball, a3, encounterType, heapID);
    if (pokeball == ITEM_HEAL_BALL) {
        hp = Pokemon_GetData(mon, MON_DATA_MAX_HP, NULL);
        Pokemon_SetData(mon, MON_DATA_HP, &hp);
        hp = 0;
        Pokemon_SetData(mon, MON_DATA_STATUS, &hp);
    }
}

void sub_0207213C(BoxPokemon *boxMon, PlayerProfile *playerProfile, u32 pokeball, u32 a3, u32 encounterType, HeapID heapID) {
    BoxMonSetTrainerMemo(boxMon, playerProfile, 0, a3, heapID);
    BoxPokemon_SetData(boxMon, MON_DATA_MET_GAME, (void *)&gGameVersion);
    BoxPokemon_SetData(boxMon, MON_DATA_POKEBALL, &pokeball);
    BoxPokemon_SetData(boxMon, MON_DATA_ENCOUNTER_TYPE, &encounterType);
}

void sub_0207217C(Pokemon *mon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, HeapID heapID) {
    sub_02072190(&mon->box, a1, pokeball, a3, encounterType, heapID);
}

void sub_02072190(BoxPokemon *boxMon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, HeapID heapID) {
    sub_0207213C(boxMon, a1, pokeball, a3, encounterType, heapID);
}

static const u16 sItemOdds[2][2] = {
    { 45, 95 },
    { 20, 80 },
};

void WildMonSetRandomHeldItem(Pokemon *mon, u32 a1, u32 a2) {
    u32 chance;
    u16 species;
    u16 form;
    u16 item1;
    u16 item2;
    if (!(a1 & 0x81)) {
        chance = (u32)(LCRandom() % 100);
        species = (u16)Pokemon_GetData(mon, MON_DATA_SPECIES, 0);
        form = (u16)Pokemon_GetData(mon, MON_DATA_FORM, 0);
        item1 = (u16)GetMonBaseStat_HandleAlternateForm(species, form, BASE_ITEM_1);
        item2 = (u16)GetMonBaseStat_HandleAlternateForm(species, form, BASE_ITEM_2);
        if (item1 == item2 && item1 != ITEM_NONE) {
            Pokemon_SetData(mon, MON_DATA_HELD_ITEM, &item1);
        } else {
            if (chance >= sItemOdds[a2][0]) {
                if (chance < sItemOdds[a2][1]) {
                    Pokemon_SetData(mon, MON_DATA_HELD_ITEM, &item1);
                } else {
                    Pokemon_SetData(mon, MON_DATA_HELD_ITEM, &item2);
                }
            }
        }
    }
}

BOOL GetMonTMHMCompat(Pokemon *mon, u8 tmhm) {
    return GetBoxMonTMHMCompat(&mon->box, tmhm);
}

BOOL GetBoxMonTMHMCompat(BoxPokemon *boxMon, u8 tmhm) {
    u16 species;
    u32 form;

    species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES_OR_EGG, NULL);
    form = BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);
    return GetTMHMCompatBySpeciesAndForm(species, form, tmhm);
}

BOOL GetTMHMCompatBySpeciesAndForm(u16 species, u32 form, u8 tmhm) {
    u32 mask;
    int baseStat;
    if (species == SPECIES_EGG) {
        return FALSE;
    }

    // mask = 1 << (a2 % 32);
    // baseStat = BASE_TMHM_1 + (a2 / 32);
    if (tmhm < 32) {
        mask = 1 << tmhm;
        baseStat = BASE_TMHM_1;
    } else if (tmhm < 64) {
        mask = 1 << (tmhm - 32);
        baseStat = BASE_TMHM_2;
    } else if (tmhm < 96) {
        mask = 1 << (tmhm - 64);
        baseStat = BASE_TMHM_3;
    } else {
        mask = 1 << (tmhm - 96);
        baseStat = BASE_TMHM_4;
    }
    return (GetMonBaseStat_HandleAlternateForm(species, form, baseStat) & mask) != 0;
}

void UpdateMonAbility(Pokemon *mon) {
    BoxPokemon_UpdateAbility(&mon->box);
}

void BoxPokemon_UpdateAbility(BoxPokemon *boxMon) {
    BOOL decry = AcquireBoxMonLock(boxMon);
    int species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    int pid = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    int form = BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);
    int ability1 = GetMonBaseStat_HandleAlternateForm(species, form, BASE_ABILITY_1);
    int ability2 = GetMonBaseStat_HandleAlternateForm(species, form, BASE_ABILITY_2);
    if (ability2 != ABILITY_NONE) {
        if (pid & 1) {
            BoxPokemon_SetData(boxMon, MON_DATA_ABILITY, &ability2);
        } else {
            BoxPokemon_SetData(boxMon, MON_DATA_ABILITY, &ability1);
        }
    } else {
        BoxPokemon_SetData(boxMon, MON_DATA_ABILITY, &ability1);
    }
    ReleaseBoxMonLock(boxMon, decry);
}

void SetMonPersonality(Pokemon *mon, u32 personality) {
    PokemonDataBlockA *r4;
    PokemonDataBlockB *r6;
    PokemonDataBlockC *r7;
    PokemonDataBlockD *sp8;
    PokemonDataBlockA *spC;
    PokemonDataBlockB *sp10;
    PokemonDataBlockC *sp14;
    PokemonDataBlockD *sp18;
    Pokemon *tmpMon;

    tmpMon = Pokemon_New(HEAP_ID_DEFAULT);
    Pokemon_Copy(mon, tmpMon);
    r4 = &GetSubstruct(&tmpMon->box, mon->box.personality, 0)->blockA;
    r6 = &GetSubstruct(&tmpMon->box, mon->box.personality, 1)->blockB;
    r7 = &GetSubstruct(&tmpMon->box, mon->box.personality, 2)->blockC;
    sp8 = &GetSubstruct(&tmpMon->box, mon->box.personality, 3)->blockD;
    spC = &GetSubstruct(&mon->box, personality, 0)->blockA;
    sp10 = &GetSubstruct(&mon->box, personality, 1)->blockB;
    sp14 = &GetSubstruct(&mon->box, personality, 2)->blockC;
    sp18 = &GetSubstruct(&mon->box, personality, 3)->blockD;

    DECRYPT_BOX(&tmpMon->box);
    DECRYPT_PTY(mon);
    DECRYPT_BOX(&mon->box);
    mon->box.personality = personality;
    *spC = *r4;
    *sp10 = *r6;
    *sp14 = *r7;
    *sp18 = *sp8;
    mon->box.checksum = CHECKSUM(&mon->box);
    ENCRYPT_BOX(&mon->box);
    ENCRYPT_PTY(mon);
    FreeToHeap(tmpMon);
}

u32 ChangePersonalityToNatureGenderAndAbility(u32 pid, u16 species, u8 nature, u8 gender, u8 ability, BOOL gen_mode) {
    // u32 pid is a random seed to convolve into a pid that bears the
    // requested nature, gender, and ability. This is used to make
    // pokemon caught on the Pokewalker, and the Spiky-Eared Pichu.
    // In both actual use cases, u32 pid is OTID, which means r4 and r1
    // are always SID ^ TID.
    GF_ASSERT(ability < 2);
    GF_ASSERT(gender != 0xFF);
    if (gen_mode) {
        u32 r4 = ((pid & 0xFFFF0000) >> 16) ^ (u16)pid;
        pid = GenPersonalityByGenderAndNature(species, gender, nature);
        if ((pid & 1) != ability) {
            // Force correct ability for gender and nature pid
            pid++;
        }
        pid |= ((u16)pid ^ r4) << 16;
    } else {
        u32 r1;
        u8 ratio = GetMonBaseStat(species, BASE_GENDER_RATIO);
        GF_ASSERT((nature & 1) == ability);
        r1 = ((pid & 0xFFFF0000) >> 16) ^ (u16)pid;
        pid = (0xFF00 ^ (r1 & 0xFF00)) << 16;
        // Force the pid to have the requested nature
        pid += nature - (pid % 25);
        // Maintaining that pid%25 is nature, and pid&1 is ability,
        // ensure pid&0xFF compared to the gender ratio yields gender
        switch (ratio) {
        case MON_RATIO_MALE:
        case MON_RATIO_FEMALE:
        case MON_RATIO_UNKNOWN:
            break;
        default:
            if (gender == MON_MALE) {
                if (ratio > (u8)pid) {
                    // pid is female; force pid to become male
                    pid += 25 * ((ratio - (u8)pid) / 25u + 1);
                    if ((pid & 1) != ability) {
                        GF_ASSERT((u8)pid <= 230);
                        pid += 25;
                    }
                }
            } else {
                if (ratio < (u8)pid) {
                    // pid is male; force pid to become female
                    pid -= 25 * (((u8)pid - ratio) / 25u + 1);
                    if ((pid & 1) != ability) {
                        GF_ASSERT((u8)pid >= 25);
                        pid -= 25;
                    }
                }
            }
            break;
        }
    }
    return pid;
}

void LoadMonPersonal(int species, BASE_STATS *personal) {
    ReadWholeNarcMemberByIdPair(personal, NARC_poketool_personal_personal, species);
}

void LoadMonBaseStats_HandleAlternateForm(int species, int form, BASE_STATS *personal) {
    ReadWholeNarcMemberByIdPair(personal, NARC_poketool_personal_personal, ResolveMonForm(species, form));
}

void LoadMonEvolutionTable(u16 species, struct Evolution *evo) {
    ReadWholeNarcMemberByIdPair(evo, NARC_poketool_personal_evo, species);
}

void MonEncryptSegment(void *data, u32 size, u32 seed) {
    _MonEncryptSegment(data, size, seed);
}

void MonDecryptSegment(void *data, u32 size, u32 seed) {
    _MonDecryptSegment(data, size, seed);
}

u32 CalcMonChecksum(void *_data, u32 size) {
    int i;
    const u16 *data = _data;
    u16 ret = 0;
    for (i = 0; i < size / 2; i++) {
        ret += data[i];
    }
    return ret;
}

PokemonDataBlock *GetSubstruct(BoxPokemon *boxMon, u32 pid, u8 which) {
    static const u8 offsets[32][4] = {
        { 0x00, 0x20, 0x40, 0x60 },
        { 0x00, 0x20, 0x60, 0x40 },
        { 0x00, 0x40, 0x20, 0x60 },
        { 0x00, 0x60, 0x20, 0x40 },
        { 0x00, 0x40, 0x60, 0x20 },
        { 0x00, 0x60, 0x40, 0x20 },
        { 0x20, 0x00, 0x40, 0x60 },
        { 0x20, 0x00, 0x60, 0x40 },
        { 0x40, 0x00, 0x20, 0x60 },
        { 0x60, 0x00, 0x20, 0x40 },
        { 0x40, 0x00, 0x60, 0x20 },
        { 0x60, 0x00, 0x40, 0x20 },
        { 0x20, 0x40, 0x00, 0x60 },
        { 0x20, 0x60, 0x00, 0x40 },
        { 0x40, 0x20, 0x00, 0x60 },
        { 0x60, 0x20, 0x00, 0x40 },
        { 0x40, 0x60, 0x00, 0x20 },
        { 0x60, 0x40, 0x00, 0x20 },
        { 0x20, 0x40, 0x60, 0x00 },
        { 0x20, 0x60, 0x40, 0x00 },
        { 0x40, 0x20, 0x60, 0x00 },
        { 0x60, 0x20, 0x40, 0x00 },
        { 0x40, 0x60, 0x20, 0x00 },
        { 0x60, 0x40, 0x20, 0x00 },
        { 0x00, 0x20, 0x40, 0x60 },
        { 0x00, 0x20, 0x60, 0x40 },
        { 0x00, 0x40, 0x20, 0x60 },
        { 0x00, 0x60, 0x20, 0x40 },
        { 0x00, 0x40, 0x60, 0x20 },
        { 0x00, 0x60, 0x40, 0x20 },
        { 0x20, 0x00, 0x40, 0x60 },
        { 0x20, 0x00, 0x60, 0x40 },
    };

    pid = ((pid & 0x3E000) >> 13);
    GF_ASSERT(which <= 3);
    return (PokemonDataBlock *)((char *)boxMon->substructs + offsets[pid][which]);
}

int ResolveMonForm(int species, int form) {
    switch (species) {
    case SPECIES_DEOXYS:
        if (form != DEOXYS_NORMAL && form <= DEOXYS_FORM_MAX - 1) {
            return SPECIES_DEOXYS_ATK + form - DEOXYS_ATTACK;
        }
        break;
    case SPECIES_WORMADAM:
        if (form != WORMADAM_PLANT && form <= WORMADAM_FORM_MAX - 1) {
            return SPECIES_WORMADAM_SANDY + form - WORMADAM_SANDY;
        }
        break;
    case SPECIES_GIRATINA:
        if (form != GIRATINA_ALTERED && form <= GIRATINA_FORM_MAX - 1) {
            return SPECIES_GIRATINA_ORIGIN + form - GIRATINA_ORIGIN;
        }
        break;
    case SPECIES_SHAYMIN:
        if (form != SHAYMIN_LAND && form <= SHAYMIN_FORM_MAX - 1) {
            return SPECIES_SHAYMIN_SKY + form - SHAYMIN_SKY;
        }
        break;
    case SPECIES_ROTOM:
        if (form != ROTOM_NORMAL && form <= ROTOM_FORM_MAX - 1) {
            return SPECIES_ROTOM_HEAT + form - ROTOM_HEAT;
        }
        break;
    }
    return species;
}

u32 MaskOfFlagNo(int flagno) {
    // This is completely inane.
    int i;
    u32 ret = 1;
    GF_ASSERT(flagno < 32);
    for (i = 0; i < flagno; i++) {
        ret <<= 1;
    }
    return ret;
}

int LowestFlagNo(u32 mask) {
    // ctz
    int i;
    u32 bit = 1;
    for (i = 0; i < 32; i++) {
        if (mask & bit) {
            break;
        }
        bit <<= 1;
    }
    return i;
}

static const u16 sBattleFrontierBanlist[NUM_BANNED_BATTLE_FRONTIER] = {
    SPECIES_MEWTWO,
    SPECIES_MEW,
    SPECIES_LUGIA,
    SPECIES_HO_OH,
    SPECIES_CELEBI,
    SPECIES_KYOGRE,
    SPECIES_GROUDON,
    SPECIES_RAYQUAZA,
    SPECIES_JIRACHI,
    SPECIES_DEOXYS,
    SPECIES_DIALGA,
    SPECIES_PALKIA,
    SPECIES_GIRATINA,
    SPECIES_PHIONE,
    SPECIES_MANAPHY,
    SPECIES_DARKRAI,
    SPECIES_SHAYMIN,
    SPECIES_ARCEUS,
};

BOOL IsPokemonBannedFromBattleFrontier(u16 species, u16 form) {
    for (u32 i = 0; i < NUM_BANNED_BATTLE_FRONTIER; i++) {
        if (species == sBattleFrontierBanlist[i]) {
            return TRUE;
        }
    }
    if (species == SPECIES_PICHU && form == PICHU_SPIKY_EAR) {
        return TRUE;
    }
    return FALSE;
}

u16 GetBannedBattleFrontierPokemon(u32 idx) {
    if (idx >= NUM_BANNED_BATTLE_FRONTIER) {
        idx = 0;
    }
    return sBattleFrontierBanlist[idx];
}

static const u16 sMythicalMonsList[9] = {
    SPECIES_MEW,
    SPECIES_CELEBI,
    SPECIES_JIRACHI,
    SPECIES_DEOXYS,
    SPECIES_PHIONE,
    SPECIES_MANAPHY,
    SPECIES_DARKRAI,
    SPECIES_SHAYMIN,
    SPECIES_ARCEUS,
};

BOOL SpeciesIsMythical(u16 species) {
    int i;
    for (i = 0; i < NELEMS(sMythicalMonsList); i++) {
        if (species == sMythicalMonsList[i]) {
            return TRUE;
        }
    }
    return FALSE;
}

BOOL MonCheckFrontierIneligibility(Pokemon *mon) {
    u16 species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    u16 form = Pokemon_GetData(mon, MON_DATA_FORM, NULL);
    return IsPokemonBannedFromBattleFrontier(species, form);
}

BOOL BoxmonBelongsToPlayer(BoxPokemon *boxMon, PlayerProfile *profile, HeapID heapID) {
    u32 myId = PlayerProfile_GetTrainerID(profile);
    u32 otId = BoxPokemon_GetData(boxMon, MON_DATA_OT_ID, NULL);
    u32 myGender = PlayerProfile_GetTrainerGender(profile);
    u32 otGender = BoxPokemon_GetData(boxMon, MON_DATA_MET_GENDER, NULL);
    String *r7 = PlayerProfile_GetPlayerName_NewString(profile, heapID);
    String *r6 = String_New(PLAYER_NAME_LENGTH + 1, heapID);
    BOOL ret = FALSE;
    BoxPokemon_GetData(boxMon, MON_DATA_OT_NAME_2, r6);
    if (myId == otId && myGender == otGender && String_Compare(r7, r6) == 0) {
        ret = TRUE;
    }
    String_Delete(r6);
    String_Delete(r7);
    return ret;
}

int TrainerClassToBackpicID(int trainerClass, BOOL isLink) {
    switch (trainerClass) {
    case TRAINERCLASS_PKMN_TRAINER_ETHAN:
    case TRAINERCLASS_PKMN_TRAINER_LYRA:
        if (isLink) {
            return trainerClass - TRAINERCLASS_PKMN_TRAINER_ETHAN + TRAINER_BACKPIC_ETHAN_2;
        } else {
            return trainerClass - TRAINERCLASS_PKMN_TRAINER_ETHAN + TRAINER_BACKPIC_ETHAN;
        }
    case TRAINERCLASS_RIVAL:
        return TRAINER_BACKPIC_RIVAL;
    case TRAINERCLASS_PKMN_TRAINER_LUCAS_DP:
    case TRAINERCLASS_PKMN_TRAINER_DAWN_DP:
        return trainerClass - TRAINERCLASS_PKMN_TRAINER_LUCAS_DP + TRAINER_BACKPIC_LUCAS_DP;
    case TRAINERCLASS_PKMN_TRAINER_LANCE:
        return TRAINER_BACKPIC_LANCE;
    case TRAINERCLASS_PKMN_TRAINER_CHERYL:
    case TRAINERCLASS_PKMN_TRAINER_RILEY:
    case TRAINERCLASS_PKMN_TRAINER_BUCK:
    case TRAINERCLASS_PKMN_TRAINER_MIRA:
    case TRAINERCLASS_PKMN_TRAINER_MARLEY:
        return trainerClass - TRAINERCLASS_PKMN_TRAINER_CHERYL + TRAINER_BACKPIC_CHERYL;
    case TRAINERCLASS_PKMN_TRAINER_LUCAS_PT:
    case TRAINERCLASS_PKMN_TRAINER_DAWN_PT:
        return trainerClass - TRAINERCLASS_PKMN_TRAINER_LUCAS_PT + TRAINER_BACKPIC_LUCAS_PT;
    default:
        if (TrainerClass_GetGenderOrTrainerCount(trainerClass) == TRAINER_FEMALE) {
            return TRAINER_BACKPIC_LYRA;
        } else {
            return TRAINER_BACKPIC_ETHAN;
        }
    }
    return trainerClass;
}

void Pokemon_RemoveCapsule(Pokemon *mon) {
    u8 sp0 = 0;
    BallCapsule sp1;
    MI_CpuClearFast(&sp1, sizeof(sp1));
    Pokemon_SetData(mon, MON_DATA_BALL_CAPSULE_ID, &sp0);
    Pokemon_SetData(mon, MON_DATA_BALL_CAPSULE, &sp1);
}

void RestoreBoxMonPP(BoxPokemon *boxMon) {
    int i;
    u8 pp;
    BOOL decry = AcquireBoxMonLock(boxMon);
    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (BoxPokemon_GetData(boxMon, MON_DATA_MOVE1 + i, NULL) != MOVE_NONE) {
            pp = (u8)BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_MAX_PP + i, NULL);
            BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_CUR_PP + i, &pp);
        }
    }
    ReleaseBoxMonLock(boxMon, decry);
}

void NARC_ReadPokepicAnimScript(NARC *narc, PokepicAnimScript *dest, u16 species, u16 a3) {
    struct UnkStruct_02072914 sp4;
    int r5 = (a3 & 1 ? 0 : 1);
    NARC_ReadFromMember(narc, 0, species * sizeof(struct UnkStruct_02072914), sizeof(struct UnkStruct_02072914), &sp4);
    MI_CpuCopy8(&sp4.unk0[r5].unk_3[0], dest, sizeof(PokepicAnimScript) * 10);
}

void sub_0207294C(NARC *narc, void *a1, void *a2, u16 a3, int a4, int a5, int a6) {
    struct UnkStruct_02072914 spA;
    struct UnkStruct_0207294C sp4;
    int r4 = (a4 == 2 ? 0 : 1);
    NARC_ReadFromMember(narc, 0, a3 * sizeof(struct UnkStruct_02072914), sizeof(struct UnkStruct_02072914), &spA);
    sp4.unk_0 = spA.unk0[r4].unk_1;
    sp4.unk_2 = spA.unk0[r4].unk_2;
    sp4.unk_4 = a5;
    sub_02016F40(a1, a2, &sp4, a6);
}

void sub_020729A4(NARC *narc, u8 *ret, u16 species, u16 isFrontpic) {
    struct UnkStruct_02072914 sp4;
    int r5 = (isFrontpic & 1 ? 0 : 1);
    NARC_ReadFromMember(narc, 0, species * sizeof(struct UnkStruct_02072914), sizeof(struct UnkStruct_02072914), &sp4);
    *ret = sp4.unk0[r5].unk_0;
}

void sub_020729D8(NARC *narc, s8 *ret, u16 a2, u16 a3) {
    struct UnkStruct_02072914 sp4;
    NARC_ReadFromMember(narc, 0, a2 * sizeof(struct UnkStruct_02072914), sizeof(struct UnkStruct_02072914), &sp4);
    *ret = sp4.unk_56;
}

void sub_020729FC(NARC *narc, s8 *ret, u16 a2, u16 a3) {
    struct UnkStruct_02072914 sp4;
    NARC_ReadFromMember(narc, 0, a2 * sizeof(struct UnkStruct_02072914), sizeof(struct UnkStruct_02072914), &sp4);
    *ret = sp4.unk_57;
}

void sub_02072A20(NARC *narc, u8 *ret, u16 a2, u16 a3) {
    struct UnkStruct_02072914 sp4;
    NARC_ReadFromMember(narc, 0, a2 * sizeof(struct UnkStruct_02072914), sizeof(struct UnkStruct_02072914), &sp4);
    *ret = sp4.unk_58;
}

BOOL SetTrMonCapsule(int a0, Pokemon *mon, HeapID heapID) {
    BallCapsule capsule;
    int data;
    NARC *narc;
    if (a0 == 0) {
        return FALSE;
    }
    narc = NARC_New(NARC_application_custom_ball_edit_gs_cb_data, heapID);
    data = 1;
    NARC_ReadFromMember(narc, 0, (a0 - 1) * sizeof(BallCapsule), sizeof(BallCapsule), &capsule);
    Pokemon_SetData(mon, MON_DATA_BALL_CAPSULE_ID, &data);
    Pokemon_SetData(mon, MON_DATA_BALL_CAPSULE, &capsule);
    NARC_Delete(narc);
    return TRUE;
}

void sub_02072A98(Pokemon *mon, struct UnkPokemonStruct_02072A98 *dest) {
    PokemonDataBlockA *dbA; // r5
    PokemonDataBlockB *dbB; // sp4
    PokemonDataBlockC *dbC; // r7
    PokemonDataBlockD *dbD; // ip
    BoxPokemon *boxMon;     // r6
    int i;

    if (!mon->box.party_lock) {
        DECRYPT_PTY(mon);
        DECRYPT_BOX(&mon->box);
    }
    boxMon = Pokemon_GetBoxPokemon(mon);
    dbA = &GetSubstruct(boxMon, boxMon->personality, 0)->blockA;
    dbB = &GetSubstruct(boxMon, boxMon->personality, 1)->blockB;
    dbC = &GetSubstruct(boxMon, boxMon->personality, 2)->blockC;
    dbD = &GetSubstruct(boxMon, boxMon->personality, 3)->blockD;

    dest->pid = boxMon->personality;
    dest->party_lock = FALSE;
    dest->box_lock = FALSE;
    dest->invalidData = boxMon->invalidData;

    dest->species = dbA->species;
    dest->heldItem = dbA->heldItem;
    dest->otID = dbA->otID;
    dest->exp = dbA->exp;
    dest->friendship = dbA->friendship;
    dest->ability = dbA->ability;
    dest->hpEV = dbA->hpEV;
    dest->atkEV = dbA->atkEV;
    dest->defEV = dbA->defEV;
    dest->speedEV = dbA->speedEV;
    dest->spAtkEV = dbA->spAtkEV;
    dest->spDefEV = dbA->spDefEV;
    dest->originLanguage = dbA->originLanguage;

    for (i = 0; i < MAX_MON_MOVES; i++) {
        dest->moves[i] = dbB->moves[i];
        dest->movePP[i] = dbB->movePP[i];
        dest->movePPUps[i] = dbB->movePPUps[i];
    }
    dest->hpIV = dbB->hpIV;
    dest->atkIV = dbB->atkIV;
    dest->defIV = dbB->defIV;
    dest->speedIV = dbB->speedIV;
    dest->spAtkIV = dbB->spAtkIV;
    dest->spDefIV = dbB->spDefIV;
    dest->isEgg = dbB->isEgg;
    dest->hasNickname = dbB->hasNickname;
    dest->fatefulEncounter = dbB->fatefulEncounter;
    dest->gender = dbB->gender;
    dest->form = dbB->form;

    for (i = 0; i < POKEMON_NAME_LENGTH + 1; i++) {
        dest->nickname[i] = dbC->nickname[i];
    }

    for (i = 0; i < PLAYER_NAME_LENGTH + 1; i++) {
        dest->otTrainerName[i] = dbD->otTrainerName[i];
    }
    dest->pokeball = dbD->pokeball;

    dest->status = mon->party.status;
    dest->level = mon->party.level;
    dest->capsule = mon->party.ballCapsuleID;
    dest->hp = mon->party.hp;
    dest->maxHp = mon->party.maxHP;
    dest->atk = mon->party.attack;
    dest->def = mon->party.defense;
    dest->speed = mon->party.speed;
    dest->spatk = mon->party.spAtk;
    dest->spdef = mon->party.spDef;

    if (!mon->box.party_lock) {
        ENCRYPT_PTY(mon);
        ENCRYPT_BOX(&mon->box);
    }
}

void sub_02072D64(const struct UnkPokemonStruct_02072A98 *src, Pokemon *mon) {
    PokemonDataBlockA *dbA; // r5
    PokemonDataBlockB *dbB; // r6
    PokemonDataBlockC *dbC; // r7
    PokemonDataBlockD *dbD; // ip
    BoxPokemon *boxMon;     // sp4
    int i;

    MI_CpuClearFast(mon, sizeof(Pokemon));
    boxMon = Pokemon_GetBoxPokemon(mon);
    dbA = &GetSubstruct(boxMon, src->pid, 0)->blockA;
    dbB = &GetSubstruct(boxMon, src->pid, 1)->blockB;
    dbC = &GetSubstruct(boxMon, src->pid, 2)->blockC;
    dbD = &GetSubstruct(boxMon, src->pid, 3)->blockD;

    boxMon->personality = src->pid;
    boxMon->party_lock = FALSE;
    boxMon->box_lock = FALSE;
    boxMon->invalidData = src->invalidData;

    dbA->species = src->species;
    dbA->heldItem = src->heldItem;
    dbA->otID = src->otID;
    dbA->exp = src->exp;
    dbA->friendship = src->friendship;
    dbA->ability = src->ability;
    dbA->hpEV = src->hpEV;
    dbA->atkEV = src->atkEV;
    dbA->defEV = src->defEV;
    dbA->speedEV = src->speedEV;
    dbA->spAtkEV = src->spAtkEV;
    dbA->spDefEV = src->spDefEV;
    dbA->originLanguage = src->originLanguage;

    for (i = 0; i < MAX_MON_MOVES; i++) {
        dbB->moves[i] = src->moves[i];
        dbB->movePP[i] = src->movePP[i];
        dbB->movePPUps[i] = src->movePPUps[i];
    }
    dbB->hpIV = src->hpIV;
    dbB->atkIV = src->atkIV;
    dbB->defIV = src->defIV;
    dbB->speedIV = src->speedIV;
    dbB->spAtkIV = src->spAtkIV;
    dbB->spDefIV = src->spDefIV;
    dbB->isEgg = src->isEgg;
    dbB->hasNickname = src->hasNickname;
    dbB->fatefulEncounter = src->fatefulEncounter;
    dbB->gender = src->gender;
    dbB->form = src->form;

    for (i = 0; i < POKEMON_NAME_LENGTH + 1; i++) {
        dbC->nickname[i] = src->nickname[i];
    }

    for (i = 0; i < PLAYER_NAME_LENGTH + 1; i++) {
        dbD->otTrainerName[i] = src->otTrainerName[i];
    }
    dbD->HGSS_Pokeball = src->pokeball;
    if (src->pokeball <= BALL_CHERISH) {
        dbD->pokeball = src->pokeball;
    } else {
        dbD->pokeball = BALL_POKE;
    }

    mon->party.status = src->status;
    mon->party.level = src->level;
    mon->party.ballCapsuleID = src->capsule;
    mon->party.hp = src->hp;
    mon->party.maxHP = src->maxHp;
    mon->party.attack = src->atk;
    mon->party.defense = src->def;
    mon->party.speed = src->speed;
    mon->party.spAtk = src->spatk;
    mon->party.spDef = src->spdef;

    ENCRYPT_PTY(mon);
    mon->box.checksum = CHECKSUM(&mon->box);
    ENCRYPT_BOX(&mon->box);
}

u32 _u32_getDigitN(u32 num, u8 digit) {
    const u32 sp0[8] = {
        1,
        10,
        100,
        1000,
        10000,
        100000,
        1000000,
        10000000
    };
    return (num % sp0[digit + 1]) / sp0[digit];
}

s16 PokeathlonStatScoreToStars(s16 a0) {
    if (a0 <= -120) {
        return -4;
    } else if (a0 <= -80) {
        return -3;
    } else if (a0 <= -40) {
        return -2;
    } else if (a0 <= -15) {
        return -1;
    } else if (a0 <= 14) {
        return 0;
    } else if (a0 <= 39) {
        return 1;
    } else if (a0 <= 79) {
        return 2;
    } else if (a0 <= 119) {
        return 3;
    } else {
        return 4;
    }
}

static const u16 sPokeathlonPerformanceArcIdxs[] = {
    0,
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
    45,
    46,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    55,
    56,
    57,
    58,
    59,
    60,
    61,
    62,
    63,
    64,
    65,
    66,
    67,
    68,
    69,
    70,
    71,
    72,
    73,
    74,
    75,
    76,
    77,
    78,
    79,
    80,
    81,
    82,
    83,
    84,
    85,
    86,
    87,
    88,
    89,
    90,
    91,
    92,
    93,
    94,
    95,
    96,
    97,
    98,
    99,
    100,
    101,
    102,
    103,
    104,
    105,
    106,
    107,
    108,
    109,
    110,
    111,
    112,
    113,
    114,
    115,
    116,
    117,
    118,
    119,
    120,
    121,
    122,
    123,
    124,
    125,
    126,
    127,
    128,
    129,
    130,
    131,
    132,
    133,
    134,
    135,
    136,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    145,
    146,
    147,
    148,
    149,
    150,
    151,
    152,
    153,
    154,
    155,
    156,
    157,
    158,
    159,
    160,
    161,
    162,
    163,
    164,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    173,
    174,
    175,
    176,
    177,
    178,
    179,
    180,
    181,
    182,
    183,
    184,
    185,
    186,
    187,
    188,
    189,
    190,
    191,
    192,
    193,
    194,
    195,
    196,
    197,
    198,
    199,
    200,
    201,
    229,
    230,
    231,
    232,
    233,
    234,
    235,
    236,
    237,
    238,
    239,
    240,
    241,
    242,
    243,
    244,
    245,
    246,
    247,
    248,
    249,
    250,
    251,
    252,
    253,
    254,
    255,
    256,
    257,
    258,
    259,
    260,
    261,
    262,
    263,
    264,
    265,
    266,
    267,
    268,
    269,
    270,
    271,
    272,
    273,
    274,
    275,
    276,
    277,
    278,
    279,
    280,
    281,
    282,
    283,
    284,
    285,
    286,
    287,
    288,
    289,
    290,
    291,
    292,
    293,
    294,
    295,
    296,
    297,
    298,
    299,
    300,
    301,
    302,
    303,
    304,
    305,
    306,
    307,
    308,
    309,
    310,
    311,
    312,
    313,
    314,
    315,
    316,
    317,
    318,
    319,
    320,
    321,
    322,
    323,
    324,
    325,
    326,
    327,
    328,
    329,
    330,
    331,
    332,
    333,
    334,
    335,
    336,
    337,
    338,
    339,
    340,
    341,
    342,
    343,
    344,
    345,
    346,
    347,
    348,
    349,
    350,
    351,
    352,
    353,
    354,
    355,
    356,
    357,
    358,
    359,
    360,
    361,
    362,
    363,
    364,
    365,
    366,
    367,
    368,
    369,
    370,
    371,
    372,
    373,
    374,
    375,
    376,
    377,
    378,
    379,
    380,
    381,
    382,
    383,
    384,
    385,
    386,
    387,
    388,
    389,
    390,
    391,
    392,
    393,
    394,
    395,
    396,
    397,
    398,
    399,
    400,
    401,
    402,
    403,
    404,
    405,
    406,
    407,
    408,
    409,
    410,
    411,
    412,
    413,
    417,
    418,
    419,
    420,
    421,
    422,
    423,
    424,
    425,
    426,
    427,
    428,
    429,
    430,
    431,
    432,
    433,
    434,
    435,
    436,
    437,
    438,
    439,
    440,
    441,
    442,
    445,
    448,
    449,
    450,
    451,
    452,
    453,
    454,
    455,
    456,
    458,
    460,
    461,
    462,
    463,
    464,
    465,
    466,
    467,
    468,
    469,
    470,
    471,
    472,
    473,
    474,
    475,
    476,
    477,
    478,
    479,
    480,
    481,
    482,
    483,
    484,
    485,
    486,
    487,
    488,
    489,
    490,
    491,
    492,
    493,
    494,
    495,
    496,
    497,
    498,
    499,
    500,
    501,
    502,
    503,
    504,
    505,
    506,
    507,
    508,
    509,
    510,
    511,
    512,
    513,
    514,
    515,
    521,
    522,
    523,
    524,
    525,
    526,
    527,
    528,
    530,
    531,
    532,
    533,
    534,
    536,
};

static const s8 sPokeathlonPerformanceNatureMods[NATURE_NUM][5] = {
    { 10,  0,   0,   0,   -10 },
    { 35,  -35, 0,   0,   0   },
    { 35,  0,   0,   0,   -35 },
    { 35,  0,   0,   -35, 0   },
    { 35,  0,   -35, 0,   0   },
    { -35, 35,  0,   0,   0   },
    { 0,   10,  0,   -10, 0   },
    { 0,   35,  0,   0,   -35 },
    { 0,   35,  0,   -35, 0   },
    { 0,   35,  -35, 0,   0   },
    { -35, 0,   0,   0,   35  },
    { 0,   -35, 0,   0,   35  },
    { 0,   0,   -10, 0,   10  },
    { 0,   0,   0,   -35, 35  },
    { 0,   0,   -35, 0,   35  },
    { -35, 0,   0,   35,  0   },
    { 0,   -35, 0,   35,  0   },
    { 0,   0,   0,   35,  -35 },
    { -10, 0,   0,   10,  0   },
    { 0,   0,   -35, 35,  0   },
    { -35, 0,   35,  0,   0   },
    { 0,   -35, 35,  0,   0   },
    { 0,   0,   35,  0,   -35 },
    { 0,   0,   35,  -35, 0   },
    { 0,   -10, 10,  0,   0   },
};

void CalcBoxMonPokeathlonPerformance(BoxPokemon *boxMon, struct PokeathlonTodayPerformance *dest) {
    u32 pid;
    u32 nature;
    struct PokeathlonBasePerformance data;
    RTCDate date;
    RTCTime time;
    int i;
    s16 day;
    u16 species;
    u16 form;

    pid = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    nature = GetBoxMonNature(boxMon);
    GF_RTC_CopyDateTime(&date, &time);
    day = date.day;

    for (i = PERFORMANCE_MIN; i < PERFORMANCE_MAX; i++) {
        u32 pid_digit = _u32_getDigitN(pid, i);
        dest->stats[i].dailyMod = sPokeathlonPerformanceNatureMods[nature][i] + (2 * _u32_getDigitN(pid_digit + (day + (7 - i)) * (day + (i + 3)), 0) - 9);
    }

    species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    form = BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);
    ReadWholeNarcMemberByIdPair(&data, NARC_poketool_personal_performance, sPokeathlonPerformanceArcIdxs[species] + form);
    dest->stats[PERFORMANCE_POWER].base = data.base[ARCPERF_POWER];
    dest->stats[PERFORMANCE_POWER].lo = data.minmax[ARCPERF_POWER][0];
    dest->stats[PERFORMANCE_POWER].hi = data.minmax[ARCPERF_POWER][1];
    dest->stats[PERFORMANCE_SKILL].base = data.base[ARCPERF_SKILL];
    dest->stats[PERFORMANCE_SKILL].lo = data.minmax[ARCPERF_SKILL][0];
    dest->stats[PERFORMANCE_SKILL].hi = data.minmax[ARCPERF_SKILL][1];
    dest->stats[PERFORMANCE_SPEED].base = data.base[ARCPERF_SPEED];
    dest->stats[PERFORMANCE_SPEED].lo = data.minmax[ARCPERF_SPEED][0];
    dest->stats[PERFORMANCE_SPEED].hi = data.minmax[ARCPERF_SPEED][1];
    dest->stats[PERFORMANCE_JUMP].base = data.base[ARCPERF_JUMP];
    dest->stats[PERFORMANCE_JUMP].lo = data.minmax[ARCPERF_JUMP][0];
    dest->stats[PERFORMANCE_JUMP].hi = data.minmax[ARCPERF_JUMP][1];
    dest->stats[PERFORMANCE_STAMINA].base = data.base[ARCPERF_STAMINA];
    dest->stats[PERFORMANCE_STAMINA].lo = data.minmax[ARCPERF_STAMINA][0];
    dest->stats[PERFORMANCE_STAMINA].hi = data.minmax[ARCPERF_STAMINA][1];
}

void CalcMonPokeathlonPerformance(Pokemon *mon, struct PokeathlonTodayPerformance *dest) {
    CalcBoxMonPokeathlonPerformance(Pokemon_GetBoxPokemon(mon), dest);
}

void CalcBoxmonPokeathlonStars(struct PokeathlonPerformanceStars *dest, BoxPokemon *boxMon, const s8 *aprijuice, HeapID heapID) {
#pragma unused(heapID)
    int i;
    struct PokeathlonTodayPerformance basePerf;

    MI_CpuClear8(dest, sizeof(struct PokeathlonPerformanceStars));
    CalcBoxMonPokeathlonPerformance(boxMon, &basePerf);
    for (i = PERFORMANCE_MIN; i < PERFORMANCE_MAX; i++) {
        s16 stars = (aprijuice != NULL
                ? PokeathlonStatScoreToStars(basePerf.stats[i].dailyMod + aprijuice[i])
                : PokeathlonStatScoreToStars(basePerf.stats[i].dailyMod));
        stars += basePerf.stats[i].base;
        if (stars < basePerf.stats[i].lo) {
            stars = basePerf.stats[i].lo;
        } else if (stars > basePerf.stats[i].hi) {
            stars = basePerf.stats[i].hi;
        }
        if (stars == basePerf.stats[i].base) {
            dest->color[i] = STARS_AT_BASE;
        } else if (stars < basePerf.stats[i].base) {
            dest->color[i] = STARS_BELOW_BASE;
        } else {
            dest->color[i] = STARS_ABOVE_BASE;
        }
        dest->stars |= stars << (3 * i);
    }
}

void CalcMonPokeathlonStars(struct PokeathlonPerformanceStars *dest, Pokemon *mon, const s8 *aprijuice, HeapID heapID) {
    CalcBoxmonPokeathlonStars(dest, Pokemon_GetBoxPokemon(mon), aprijuice, heapID);
}
