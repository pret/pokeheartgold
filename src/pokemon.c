#include "pokemon.h"

#include "global.h"

#include "constants/abilities.h"
#include "constants/balls.h"
#include "constants/battle.h"
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

enum PokemonDataBlockID {
    DATA_BLOCK_A = 0,
    DATA_BLOCK_B,
    DATA_BLOCK_C,
    DATA_BLOCK_D
};

void MonEncryptSegment(void *data, u32 size, u32 key);
void MonDecryptSegment(void *data, u32 size, u32 key);
u32 CalcMonChecksum(void *data, u32 size);
void BoxPokemon_SetDefaultMoves(BoxPokemon *boxMon);
void SpeciesData_LoadForm(int species, int form, SpeciesData *dest);
u16 Nature_ModifyStatValue(u8 nature, u16 value, u8 stat);
static u32 Pokemon_GetDataInternal(Pokemon *mon, int param, void *dest);
static u32 BoxPokemon_GetDataInternal(BoxPokemon *boxMon, int param, void *dest);
static void Pokemon_SetDataInternal(Pokemon *mon, int param, void *data);
static void BoxPokemon_SetDataInternal(BoxPokemon *boxMon, int param, void *data);
static void Pokemon_IncreaseDataInternal(Pokemon *mon, int param, int value);
static void BoxPokemon_AddDataInternal(BoxPokemon *boxMon, int param, int value);
static void *BoxPokemon_GetDataBlock(BoxPokemon *boxMon, u32 personality, u8 dataBlockID);
void SpeciesData_LoadSpecies(int species, SpeciesData *dest);
int Species_GetFormNarcIndex(int species, int form);
u8 SpeciesData_GetGenderFromPersonality(SpeciesData *speciesData, u16 species, u32 pid);
u32 MaskOfFlagNo(int flagno);
void BoxPokemon_BuildSpriteTemplate(PokemonSpriteTemplate *template, BoxPokemon *boxMon, u8 face, BOOL preferDP);
static void Species_BuildSpriteTemplateDP(PokemonSpriteTemplate *pokepicTemplate, u16 species, u8 gender, u8 face, u8 shiny, u8 form, u32 pid);
void Species_BuildSpriteTemplate(PokemonSpriteTemplate *pokepicTemplate, u16 species, u8 gender, u8 face, u8 shiny, u8 form, u32 pid);
u8 Species_SanitizeFormId(u16 species, u8 form);
u8 BoxPokemon_SpriteYOffset(BoxPokemon *boxMon, u8 face, BOOL preferDP);
u8 Species_LoadSpriteYOffsetDP(u16 species, u8 gender, u8 face, u8 form, u32 pid);
u8 Species_LoadSpriteYOffset(u16 species, u8 gender, u8 face, u8 form, u32 pid);
void sub_02070D3C(s32 trainer_class, s32 a1, BOOL a2, struct UnkStruct_02070D3C *a3);
int TrainerClassToBackpicID(int trainer_class, int a1);
void Species_LoadEvolutions(u16 species, Evolution *dest);
static BOOL Pokemon_HasMove(Pokemon *mon, u16 move_id);
static s8 BoxPokemon_GetFlavorAffinity(BoxPokemon *boxMon, int flavor);
void sub_0207213C(BoxPokemon *boxMon, PlayerProfile *playerProfile, u32 pokeball, u32 a3, u32 encounterType, enum HeapID heapID);
void sub_02072190(BoxPokemon *boxMon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, enum HeapID heapID);

#define ENCRY_ARGS_PARTY(mon)  (u16 *)&(mon)->party, sizeof((mon)->party), (mon)->box.personality
#define ENCRY_ARGS_BOX(boxMon) (u16 *)&(boxMon)->dataBlocks, sizeof((boxMon)->dataBlocks), (boxMon)->checksum
#define ENCRYPT_PARTY(mon)     MonEncryptSegment(ENCRY_ARGS_PARTY(mon))
#define ENCRYPT_BOX(boxMon)    MonEncryptSegment(ENCRY_ARGS_BOX(boxMon))
#define DECRYPT_PARTY(mon)     MonDecryptSegment(ENCRY_ARGS_PARTY(mon))
#define DECRYPT_BOX(boxMon)    MonDecryptSegment(ENCRY_ARGS_BOX(boxMon))
#define CHECKSUM(boxMon)       CalcMonChecksum((u16 *)(boxMon)->dataBlocks, sizeof((boxMon)->dataBlocks))
#define SHINY_CHECK(otid, pid) ((                                                                                                              \
                                    (((otid) & 0xFFFF0000u) >> 16u) ^ ((otid) & 0xFFFFu) ^ (((pid) & 0xFFFF0000u) >> 16u) ^ ((pid) & 0xFFFFu)) \
    < 8u)
#define CALC_UNOWN_LETTER(pid) ((u32)((((pid) & 0x3000000) >> 18) | (((pid) & 0x30000) >> 12) | (((pid) & 0x300) >> 6) | (((pid) & 0x3) >> 0)) % UNOWN_FORM_COUNT)

// clang-format off
static const s8 sNatureFlavorAffinities[NATURE_COUNT][FLAVOR_COUNT] = {
                    // Spicy  Dry Sweet Bitter Sour
    [NATURE_HARDY]   = {  0,   0,   0,    0,    0 },
    [NATURE_LONELY]  = { +1,   0,   0,    0,   -1 },
    [NATURE_BRAVE]   = { +1,   0,  -1,    0,    0 },
    [NATURE_ADAMANT] = { +1,  -1,   0,    0,    0 },
    [NATURE_NAUGHTY] = { +1,   0,   0,   -1,    0 },
    [NATURE_BOLD]    = { -1,   0,   0,    0,    1 },
    [NATURE_DOCILE]  = {  0,   0,   0,    0,    0 },
    [NATURE_RELAXED] = {  0,   0,  -1,    0,    1 },
    [NATURE_IMPISH]  = {  0,  -1,   0,    0,    1 },
    [NATURE_LAX]     = {  0,   0,   0,   -1,    1 },
    [NATURE_TIMID]   = { -1,   0,  +1,    0,    0 },
    [NATURE_HASTY]   = {  0,   0,  +1,    0,   -1 },
    [NATURE_SERIOUS] = {  0,   0,   0,    0,    0 },
    [NATURE_JOLLY]   = {  0,  -1,  +1,    0,    0 },
    [NATURE_NAIVE]   = {  0,   0,  +1,   -1,    0 },
    [NATURE_MODEST]  = { -1,  +1,   0,    0,    0 },
    [NATURE_MILD]    = {  0,  +1,   0,    0,   -1 },
    [NATURE_QUIET]   = {  0,  +1,  -1,    0,    0 },
    [NATURE_BASHFUL] = {  0,   0,   0,    0,    0 },
    [NATURE_RASH]    = {  0,  +1,   0,   -1,    0 },
    [NATURE_CALM]    = { -1,   0,   0,   +1,    0 },
    [NATURE_GENTLE]  = {  0,   0,   0,   +1,   -1 },
    [NATURE_SASSY]   = {  0,   0,  -1,   +1,    0 },
    [NATURE_CAREFUL] = {  0,  -1,   0,   +1,    0 },
    [NATURE_QUIRKY]  = {  0,   0,   0,    0,    0 },
};
// clang-format on

void Pokemon_Init(Pokemon *mon) {
    MI_CpuClearFast(mon, sizeof(Pokemon));
    ENCRYPT_BOX(&mon->box);
    ENCRYPT_PARTY(mon);
}

void BoxPokemon_Init(BoxPokemon *boxMon) {
    MI_CpuClearFast(boxMon, sizeof(BoxPokemon));
    ENCRYPT_BOX(boxMon);
}

u32 Pokemon_Size(void) {
    return sizeof(Pokemon);
}

Pokemon *Pokemon_New(enum HeapID heapID) {
    Pokemon *mon = Heap_Alloc(heapID, sizeof(Pokemon));
    Pokemon_Init(mon);
    return mon;
}

BOOL Pokemon_DecryptData(Pokemon *mon) {
    BOOL wasDecrypted = FALSE;

    if (!mon->box.partyDecrypted) {
        wasDecrypted = TRUE;
        GF_ASSERT(!mon->box.boxDecrypted);
        mon->box.partyDecrypted = TRUE;
        mon->box.boxDecrypted = TRUE;
        DECRYPT_PARTY(mon);
        DECRYPT_BOX(&mon->box);
    }
    return wasDecrypted;
}

BOOL Pokemon_EncryptData(Pokemon *mon, BOOL encrypt) {
    BOOL wasEncrypted = FALSE;

    if (mon->box.partyDecrypted == TRUE && encrypt == TRUE) {
        wasEncrypted = TRUE;
        mon->box.partyDecrypted = FALSE;
        mon->box.boxDecrypted = FALSE;
        ENCRYPT_PARTY(mon);
        mon->box.checksum = CHECKSUM(&mon->box);
        ENCRYPT_BOX(&mon->box);
    }
    return wasEncrypted;
}

BOOL BoxPokemon_DecryptData(BoxPokemon *boxMon) {
    BOOL wasDecrypted = FALSE;

    if (!boxMon->boxDecrypted) {
        wasDecrypted = TRUE;
        boxMon->boxDecrypted = TRUE;
        DECRYPT_BOX(boxMon);
    }
    return wasDecrypted;
}

BOOL BoxPokemon_EncryptData(BoxPokemon *boxMon, BOOL encrypt) {
    BOOL wasEncrypted = FALSE;

    if (boxMon->boxDecrypted == TRUE && encrypt == TRUE) {
        wasEncrypted = TRUE;
        boxMon->boxDecrypted = FALSE;
        boxMon->checksum = CHECKSUM(boxMon);
        ENCRYPT_BOX(boxMon);
    }
    return wasEncrypted;
}

void Pokemon_InitWithParams(Pokemon *mon, int species, int level, int ivs, BOOL hasFixedPersonality, int personality, int otIDType, int otID) {
    Pokemon_Init(mon);

    BoxPokemon_InitWithParams(&mon->box, species, level, ivs, hasFixedPersonality, personality, otIDType, otID);
    // Not your average encryption call
    MonEncryptSegment((u16 *)&mon->party, sizeof(mon->party), 0);
    ENCRYPT_PARTY(mon);
    Pokemon_SetData(mon, MON_DATA_LEVEL, &level);

    Mail *mail = Mail_New(HEAP_ID_DEFAULT);
    Pokemon_SetData(mon, MON_DATA_MAIL, mail);
    Heap_Free(mail);

    u32 zero = 0;
    CAPSULE capsule;
    Pokemon_SetData(mon, MON_DATA_BALL_CAPSULE_ID, &zero);
    MI_CpuClearFast(&capsule, sizeof(capsule));
    Pokemon_SetData(mon, MON_DATA_BALL_CAPSULE, &capsule);

    Pokemon_CalcLevelAndStats(mon);
}

void BoxPokemon_InitWithParams(BoxPokemon *boxMon, int species, int level, int ivs, BOOL hasFixedPersonality, int personality, int otIDType, int otID) {
    u32 var1, var2;
    BoxPokemon_Init(boxMon);
    BOOL reencrypt = BoxPokemon_DecryptData(boxMon);
    if (!hasFixedPersonality) {
        personality = (LCRandom() | (LCRandom() << 16));
    }
    BoxPokemon_SetData(boxMon, MON_DATA_PERSONALITY, &personality);

    if (otIDType == OT_ID_RANDOM_NO_SHINY) {
        do {
            otID = (LCRandom() | (LCRandom() << 16));
        } while (SHINY_CHECK(otID, personality));
    } else if (otIDType != OT_ID_PRESET) {
        otID = 0;
    }
    BoxPokemon_SetData(boxMon, MON_DATA_OT_ID, &otID);
    BoxPokemon_SetData(boxMon, MON_DATA_LANGUAGE, &gGameLanguage);
    BoxPokemon_SetData(boxMon, MON_DATA_SPECIES, &species);
    BoxPokemon_SetData(boxMon, MON_DATA_SPECIES_NAME, NULL);

    var1 = Species_GetExpAtLevel(species, level);
    BoxPokemon_SetData(boxMon, MON_DATA_EXPERIENCE, &var1);

    var1 = Species_GetValue(species, SPECIES_DATA_BASE_FRIENDSHIP);
    BoxPokemon_SetData(boxMon, MON_DATA_FRIENDSHIP, &var1);

    BoxPokemon_SetData(boxMon, MON_DATA_MET_LEVEL, &level);
    BoxPokemon_SetData(boxMon, MON_DATA_MET_GAME, &gGameVersion);

    var1 = ITEM_POKE_BALL;
    BoxPokemon_SetData(boxMon, MON_DATA_POKEBALL, &var1);
    BoxPokemon_SetData(boxMon, MON_DATA_DP_POKEBALL, &var1);

    if (ivs < INIT_IVS_RANDOM) {
        BoxPokemon_SetData(boxMon, MON_DATA_HP_IV, &ivs);
        BoxPokemon_SetData(boxMon, MON_DATA_ATK_IV, &ivs);
        BoxPokemon_SetData(boxMon, MON_DATA_DEF_IV, &ivs);
        BoxPokemon_SetData(boxMon, MON_DATA_SPEED_IV, &ivs);
        BoxPokemon_SetData(boxMon, MON_DATA_SPATK_IV, &ivs);
        BoxPokemon_SetData(boxMon, MON_DATA_SPDEF_IV, &ivs);
    } else {
        var1 = LCRandom();
        var2 = (var1 & (0x1f << 0)) >> 0;
        BoxPokemon_SetData(boxMon, MON_DATA_HP_IV, &var2);

        var2 = (var1 & (0x1f << 5)) >> 5;
        BoxPokemon_SetData(boxMon, MON_DATA_ATK_IV, &var2);

        var2 = (var1 & (0x1f << 10)) >> 10;
        BoxPokemon_SetData(boxMon, MON_DATA_DEF_IV, &var2);

        var1 = LCRandom();
        var2 = (var1 & (0x1f << 0)) >> 0;
        BoxPokemon_SetData(boxMon, MON_DATA_SPEED_IV, &var2);

        var2 = (var1 & (0x1f << 5)) >> 5;
        BoxPokemon_SetData(boxMon, MON_DATA_SPATK_IV, &var2);

        var2 = (var1 & (0x1f << 10)) >> 10;
        BoxPokemon_SetData(boxMon, MON_DATA_SPDEF_IV, &var2);
    }

    var1 = Species_GetValue(species, SPECIES_DATA_ABILITY_1);
    var2 = Species_GetValue(species, SPECIES_DATA_ABILITY_2);
    if (var2 != ABILITY_NONE) {
        if (personality & 1) {
            BoxPokemon_SetData(boxMon, MON_DATA_ABILITY, &var2);
        } else {
            BoxPokemon_SetData(boxMon, MON_DATA_ABILITY, &var1);
        }
    } else {
        BoxPokemon_SetData(boxMon, MON_DATA_ABILITY, &var1);
    }

    var1 = BoxPokemon_GetGender(boxMon);
    BoxPokemon_SetData(boxMon, MON_DATA_GENDER, &var1);
    BoxPokemon_SetDefaultMoves(boxMon);
    BoxPokemon_EncryptData(boxMon, reencrypt);
}

void Pokemon_InitWithNature(Pokemon *mon, u16 species, u8 level, u8 ivs, u8 nature) {
    u32 personality;
    do {
        personality = (LCRandom() | (LCRandom() << 16));
    } while (nature != Personality_GetNature(personality));
    Pokemon_InitWithParams(mon, species, level, ivs, TRUE, personality, OT_ID_PLAYER_ID, 0);
}

void Pokemon_InitWithGenderNatureLetter(Pokemon *mon, u16 species, u8 level, u8 ivs, u8 gender, u8 nature, u8 letter) {
    u32 personality = 0;
    u16 unownLetter = 0;

    if (letter != 0 && letter < UNOWN_FORM_COUNT + 1) {
        do {
            personality = (LCRandom() | (LCRandom() << 16));
            unownLetter = CALC_UNOWN_LETTER(personality);
        } while (nature != Personality_GetNature(personality) || gender != Species_GetGenderFromPersonality(species, personality) || unownLetter != letter - 1);
    } else {
        personality = Personality_CreateFromGenderAndNature(species, gender, nature);
    }
    Pokemon_InitWithParams(mon, species, level, ivs, TRUE, personality, OT_ID_PLAYER_ID, 0);
}

u32 Personality_CreateFromGenderAndNature(u16 species, u8 gender, u8 nature) {
    int pid = nature;
    u8 ratio = Species_GetValue(species, SPECIES_DATA_GENDER_RATIO);
    switch (ratio) {
    case GENDER_RATIO_MALE_ONLY:
    case GENDER_RATIO_FEMALE_ONLY:
    case GENDER_RATIO_UNKNOWN:
        break;
    default:
        if (gender == GENDER_MALE) {
            // Smallest increment that forces the low byte to exceed the
            // gender ratio, thus making the mon male
            pid = 25 * ((ratio / 25) + 1);
            pid += nature;
        }
        break;
    }
    return pid;
}

void Pokemon_InitAndCalcStats(Pokemon *mon, int species, int level, int combinedIVs, int personality) {
    Pokemon_InitWithParams(mon, species, level, 0, TRUE, personality, OT_ID_PLAYER_ID, 0);
    Pokemon_SetData(mon, MON_DATA_COMBINED_IVS, &combinedIVs);
    Pokemon_CalcLevelAndStats(mon);
}

void Pokemon_CalcLevelAndStats(Pokemon *mon) {
    BOOL reencrypt = Pokemon_DecryptData(mon);
    int level = Pokemon_CalcLevel(mon);
    Pokemon_SetData(mon, MON_DATA_LEVEL, &level);
    Pokemon_CalcStats(mon);
    Pokemon_EncryptData(mon, reencrypt);
}

void Pokemon_CalcStats(Pokemon *mon) {
    int maxHp, hp;
    int hpIV, atkIV, defIV, speedIV, spAtkIV, spDefIV;
    int hpEV, atkEV, defEV, speedEV, spAtkEV, spDefEV;
    int form, species;
    int newMaxHp;

    BOOL reencrypt = Pokemon_DecryptData(mon);

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

    SpeciesData *speciesData = Heap_Alloc(HEAP_ID_DEFAULT, sizeof(SpeciesData));
    SpeciesData_LoadForm(species, form, speciesData);

    if (species == SPECIES_SHEDINJA) {
        newMaxHp = 1;
    } else {
        newMaxHp = (speciesData->hp * 2 + hpIV + hpEV / 4) * level / 100 + level + 10;
    }
    Pokemon_SetData(mon, MON_DATA_MAX_HP, &newMaxHp);

    int newAtk = (speciesData->atk * 2 + atkIV + atkEV / 4) * level / 100 + 5;
    newAtk = Nature_ModifyStatValue(Pokemon_GetNature(mon), newAtk, STAT_ATK);
    Pokemon_SetData(mon, MON_DATA_ATK, &newAtk);

    int newDef = (speciesData->def * 2 + defIV + defEV / 4) * level / 100 + 5;
    newDef = Nature_ModifyStatValue(Pokemon_GetNature(mon), newDef, STAT_DEF);
    Pokemon_SetData(mon, MON_DATA_DEF, &newDef);

    int newSpeed = (speciesData->speed * 2 + speedIV + speedEV / 4) * level / 100 + 5;
    newSpeed = Nature_ModifyStatValue(Pokemon_GetNature(mon), newSpeed, STAT_SPEED);
    Pokemon_SetData(mon, MON_DATA_SPEED, &newSpeed);

    int newSpAtk = (speciesData->spatk * 2 + spAtkIV + spAtkEV / 4) * level / 100 + 5;
    newSpAtk = Nature_ModifyStatValue(Pokemon_GetNature(mon), newSpAtk, STAT_SPATK);
    Pokemon_SetData(mon, MON_DATA_SP_ATK, &newSpAtk);

    int newSpDef = (speciesData->spdef * 2 + spDefIV + spDefEV / 4) * level / 100 + 5;
    newSpDef = Nature_ModifyStatValue(Pokemon_GetNature(mon), newSpDef, STAT_SPDEF);
    Pokemon_SetData(mon, MON_DATA_SP_DEF, &newSpDef);

    Heap_Free(speciesData);

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
    Pokemon_EncryptData(mon, reencrypt);
}

u32 Pokemon_GetData(Pokemon *mon, int param, void *dest) {
    u32 ret;
    u32 checksum;
    if (!mon->box.partyDecrypted) {
        DECRYPT_PARTY(mon);
        DECRYPT_BOX(&mon->box);
        checksum = CHECKSUM(&mon->box);
        if (checksum != mon->box.checksum) {
            GF_ASSERT(checksum == mon->box.checksum);
            mon->box.checksumFailed = TRUE;
        }
    }
    ret = Pokemon_GetDataInternal(mon, param, dest);
    if (!mon->box.partyDecrypted) {
        ENCRYPT_PARTY(mon);
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
        CopyCapsule(&mon->party.ballCapsule, dest);
        return TRUE;
    default:
        return BoxPokemon_GetDataInternal(&mon->box, param, dest);
    }
}

u32 BoxPokemon_GetData(BoxPokemon *boxMon, int param, void *dest) {
    u32 ret;
    u32 checksum;
    if (!boxMon->boxDecrypted) {
        DECRYPT_BOX(boxMon);
        checksum = CHECKSUM(boxMon);
        if (checksum != boxMon->checksum) {
            GF_ASSERT(checksum == boxMon->checksum);
            boxMon->checksumFailed = TRUE;
        }
    }
    ret = BoxPokemon_GetDataInternal(boxMon, param, dest);
    if (!boxMon->boxDecrypted) {
        ENCRYPT_BOX(boxMon);
    }
    return ret;
}

static inline u32 GetRibbon(u64 mask, int param, int ribbonStart)
{
    u64 bit = 1; // need to force a u64 to match
    return (mask & (bit << (param - ribbonStart))) != 0;
}

static u32 BoxPokemon_GetDataInternal(BoxPokemon *boxMon, int param, void *dest) {
    u32 ret = 0;
    PokemonDataBlockA *blockA = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_A);
    PokemonDataBlockB *blockB = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_B);
    PokemonDataBlockC *blockC = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_C);
    PokemonDataBlockD *blockD = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_D);

    switch (param) {
    default:
        ret = 0;
        break;
    case MON_DATA_PERSONALITY:
        ret = boxMon->personality;
        break;
    case MON_DATA_IS_PARTY_DECRYPTED:
        ret = boxMon->partyDecrypted;
        break;
    case MON_DATA_IS_BOX_DECRYPTED:
        ret = boxMon->boxDecrypted;
        break;
    case MON_DATA_CHECKSUM_FAILED:
        ret = boxMon->checksumFailed;
        break;
    case MON_DATA_CHECKSUM:
        ret = boxMon->checksum;
        break;
    case MON_DATA_SPECIES_EXISTS:
        ret = (blockA->species != SPECIES_NONE);
        break;
    case MON_DATA_SANITY_IS_EGG:
        if (boxMon->checksumFailed) {
            ret = boxMon->checksumFailed;
        } else {
            ret = blockB->isEgg;
        }
        break;
    case MON_DATA_SPECIES_OR_EGG:
        ret = blockA->species;
        if (ret != SPECIES_NONE && (blockB->isEgg || boxMon->checksumFailed)) {
            ret = SPECIES_EGG;
        }
        break;
    case MON_DATA_LEVEL:
        ret = Species_CalcLevelByExp(blockA->species, blockA->exp);
        break;
    case MON_DATA_SPECIES:
        if (boxMon->checksumFailed) {
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
    case MON_DATA_UNUSED_RIBBON_53:
        ret = GetRibbon(blockA->ribbonsDS1, param, MON_DATA_SINNOH_CHAMP_RIBBON);
        break;
    case MON_DATA_MOVE1:
    case MON_DATA_MOVE2:
    case MON_DATA_MOVE3:
    case MON_DATA_MOVE4:
        ret = blockB->moves[param - MON_DATA_MOVE1];
        break;
    case MON_DATA_MOVE1_PP:
    case MON_DATA_MOVE2_PP:
    case MON_DATA_MOVE3_PP:
    case MON_DATA_MOVE4_PP:
        ret = blockB->moveCurrentPPs[param - MON_DATA_MOVE1_PP];
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
        ret = GetMoveMaxPP(blockB->moves[param - MON_DATA_MOVE1_MAX_PP], blockB->movePPUps[param - MON_DATA_MOVE1_MAX_PP]);
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
        if (boxMon->checksumFailed) {
            ret = boxMon->checksumFailed;
        } else {
            ret = blockB->isEgg;
        }
        break;
    case MON_DATA_HAS_NICKNAME:
        ret = blockB->hasNickname;
        break;
    case MON_DATA_COOL_RIBBON:
    case MON_DATA_COOL_RIBBON_SUPER:
    case MON_DATA_COOL_RIBBON_HYPER:
    case MON_DATA_COOL_RIBBON_MASTER:
    case MON_DATA_BEAUTY_RIBBON:
    case MON_DATA_BEAUTY_RIBBON_SUPER:
    case MON_DATA_BEAUTY_RIBBON_HYPER:
    case MON_DATA_BEAUTY_RIBBON_MASTER:
    case MON_DATA_CUTE_RIBBON:
    case MON_DATA_CUTE_RIBBON_SUPER:
    case MON_DATA_CUTE_RIBBON_HYPER:
    case MON_DATA_CUTE_RIBBON_MASTER:
    case MON_DATA_SMART_RIBBON:
    case MON_DATA_SMART_RIBBON_SUPER:
    case MON_DATA_SMART_RIBBON_HYPER:
    case MON_DATA_SMART_RIBBON_MASTER:
    case MON_DATA_TOUGH_RIBBON:
    case MON_DATA_TOUGH_RIBBON_SUPER:
    case MON_DATA_TOUGH_RIBBON_HYPER:
    case MON_DATA_TOUGH_RIBBON_MASTER:
    case MON_DATA_CHAMPION_RIBBON:
    case MON_DATA_WINNING_RIBBON:
    case MON_DATA_VICTORY_RIBBON:
    case MON_DATA_ARTIST_RIBBON:
    case MON_DATA_EFFORT_RIBBON:
    case MON_DATA_MARINE_RIBBON:
    case MON_DATA_LAND_RIBBON:
    case MON_DATA_SKY_RIBBON:
    case MON_DATA_COUNTRY_RIBBON:
    case MON_DATA_NATIONAL_RIBBON:
    case MON_DATA_EARTH_RIBBON:
    case MON_DATA_WORLD_RIBBON:
        ret = GetRibbon(blockB->ribbonsGBA, param, MON_DATA_COOL_RIBBON);
        break;
    case MON_DATA_FATEFUL_ENCOUNTER:
        ret = blockB->fatefulEncounter;
        break;
    case MON_DATA_GENDER:
        ret = Species_GetGenderFromPersonality(blockA->species, boxMon->personality);
        blockB->gender = ret;
        boxMon->checksum = CHECKSUM(boxMon);
        break;
    case MON_DATA_FORM:
        ret = blockB->form;
        break;
    case MON_DATA_UNUSED_113:
        ret = blockB->unused1;
        break;
    case MON_DATA_UNUSED_114:
        ret = blockB->unused2;
        break;
    case MON_DATA_NICKNAME:
        if (boxMon->checksumFailed) {
            GetSpeciesNameIntoArray(SPECIES_BAD_EGG, HEAP_ID_DEFAULT, dest);
        } else {
            u16 *nickname = dest;
            for (ret = 0; ret < POKEMON_NAME_LENGTH; ret++) {
                nickname[ret] = blockC->nickname[ret];
            }
            nickname[ret] = EOS;
        }
        break;
    case MON_DATA_NICKNAME_STRING_AND_FLAG:
        ret = blockB->hasNickname;
        // fallthrough
    case MON_DATA_NICKNAME_STRING:
        if (boxMon->checksumFailed) {
            String *nickname = GetSpeciesName(SPECIES_BAD_EGG, HEAP_ID_DEFAULT);
            String_Copy(dest, nickname);
            String_Delete(nickname);
        } else {
            CopyU16ArrayToString(dest, blockC->nickname);
        }
        break;
    case MON_DATA_UNUSED_121:
        ret = blockC->unused;
        break;
    case MON_DATA_MET_GAME:
        ret = blockC->originGame;
        break;
    case MON_DATA_SUPER_COOL_RIBBON:
    case MON_DATA_SUPER_COOL_RIBBON_GREAT:
    case MON_DATA_SUPER_COOL_RIBBON_ULTRA:
    case MON_DATA_SUPER_COOL_RIBBON_MASTER:
    case MON_DATA_SUPER_BEAUTY_RIBBON:
    case MON_DATA_SUPER_BEAUTY_RIBBON_GREAT:
    case MON_DATA_SUPER_BEAUTY_RIBBON_ULTRA:
    case MON_DATA_SUPER_BEAUTY_RIBBON_MASTER:
    case MON_DATA_SUPER_CUTE_RIBBON:
    case MON_DATA_SUPER_CUTE_RIBBON_GREAT:
    case MON_DATA_SUPER_CUTE_RIBBON_ULTRA:
    case MON_DATA_SUPER_CUTE_RIBBON_MASTER:
    case MON_DATA_SUPER_SMART_RIBBON:
    case MON_DATA_SUPER_SMART_RIBBON_GREAT:
    case MON_DATA_SUPER_SMART_RIBBON_ULTRA:
    case MON_DATA_SUPER_SMART_RIBBON_MASTER:
    case MON_DATA_SUPER_TOUGH_RIBBON:
    case MON_DATA_SUPER_TOUGH_RIBBON_GREAT:
    case MON_DATA_SUPER_TOUGH_RIBBON_ULTRA:
    case MON_DATA_SUPER_TOUGH_RIBBON_MASTER:
    case MON_DATA_UNUSED_RIBBON_143:
        ret = GetRibbon(blockC->ribbonsDS2, param, MON_DATA_SUPER_COOL_RIBBON);
        break;
    case MON_DATA_OT_NAME:
        u16 *otName = dest;
        for (ret = 0; ret < PLAYER_NAME_LENGTH; ret++) {
            otName[ret] = blockD->otName[ret];
        }
        otName[ret] = EOS;
        break;
    case MON_DATA_OT_NAME_STRING:
        CopyU16ArrayToString(dest, blockD->otName);
        break;
    case MON_DATA_EGG_YEAR:
        ret = blockD->eggYear;
        break;
    case MON_DATA_EGG_MONTH:
        ret = blockD->eggMonth;
        break;
    case MON_DATA_EGG_DAY:
        ret = blockD->eggDay;
        break;
    case MON_DATA_MET_YEAR:
        ret = blockD->metYear;
        break;
    case MON_DATA_MET_MONTH:
        ret = blockD->metMonth;
        break;
    case MON_DATA_MET_DAY:
        ret = blockD->metDay;
        break;
    case MON_DATA_EGG_LOCATION:
    case MON_DATA_EGG_LOCATION_PTHGSS:
        if (blockD->EggLocation_DP == METLOC_FARAWAY_PLACE && blockB->EggLocation_PtHGSS) {
            ret = blockB->EggLocation_PtHGSS;
        } else {
            ret = blockD->EggLocation_DP;
        }
        break;
    case MON_DATA_MET_LOCATION:
    case MON_DATA_MET_LOCATION_PTHGSS:
        if (blockD->MetLocation_DP == METLOC_FARAWAY_PLACE && blockB->MetLocation_PtHGSS) {
            ret = blockB->MetLocation_PtHGSS;
        } else {
            ret = blockD->MetLocation_DP;
        }
        break;
    case MON_DATA_POKERUS:
        ret = blockD->pokerus;
        break;
    case MON_DATA_POKEBALL:
        if ((blockC->originGame == VERSION_HEARTGOLD || blockC->originGame == VERSION_SOULSILVER) && blockD->HGSS_Pokeball) {
        	ret = blockD->HGSS_Pokeball;
        } else {
        	ret = blockD->pokeball;
        }
        break;
    case MON_DATA_DP_POKEBALL:
        ret = blockD->pokeball;
        break;
    case MON_DATA_MET_LEVEL:
        ret = blockD->metLevel;
        break;
    case MON_DATA_OT_GENDER:
        ret = blockD->otGender;
        break;
    case MON_DATA_MET_TERRAIN:
        ret = blockD->metTerrain;
        break;
    case MON_DATA_COMBINED_IVS:
        ret = (blockB->hpIV << 0)
            | (blockB->atkIV << 5)
            | (blockB->defIV << 10)
            | (blockB->speedIV << 15)
            | (blockB->spAtkIV << 20)
            | (blockB->spDefIV << 25);
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
            ret = HoldEffect_GetArceusType((u16)GetItemAttr(blockA->heldItem, ITEMATTR_HOLD_EFFECT, HEAP_ID_DEFAULT));
        } else {
            ret = Species_GetFormValue(blockA->species, blockB->form, (int)(param - MON_DATA_TYPE_1 + SPECIES_DATA_TYPE_1));
        }
        break;
    case MON_DATA_SPECIES_NAME:
        GetSpeciesNameIntoArray(blockA->species, HEAP_ID_DEFAULT, dest);
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

void Pokemon_SetData(Pokemon *mon, int param, void *value) {
    u32 checksum;
    if (!mon->box.partyDecrypted) {
        DECRYPT_PARTY(mon);
        DECRYPT_BOX(&mon->box);
        checksum = CHECKSUM(&mon->box);
        if (checksum != mon->box.checksum) {
            GF_ASSERT(checksum == mon->box.checksum);
            mon->box.checksumFailed = TRUE;
            ENCRYPT_BOX(&mon->box);
            return;
        }
    }
    Pokemon_SetDataInternal(mon, param, value);
    if (!mon->box.partyDecrypted) {
        ENCRYPT_PARTY(mon);
        mon->box.checksum = CHECKSUM(&mon->box);
        ENCRYPT_BOX(&mon->box);
    }
}

static void Pokemon_SetDataInternal(Pokemon *mon, int param, void *value) {
#define VALUE(type) (*(const type *)value)
    switch (param) {
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
        Mail_Copy(value, &mon->party.mail);
        break;
    case MON_DATA_BALL_CAPSULE:
        CopyCapsule(value, &mon->party.ballCapsule);
        break;
    default:
        BoxPokemon_SetDataInternal(&mon->box, param, value);
        break;
    }
#undef VALUE
}

void BoxPokemon_SetData(BoxPokemon *boxMon, int param, void *value) {
    u32 checksum;
    if (!boxMon->boxDecrypted) {
        DECRYPT_BOX(boxMon);
        checksum = CHECKSUM(boxMon);
        if (checksum != boxMon->checksum) {
            GF_ASSERT(checksum == boxMon->checksum);
            boxMon->checksumFailed = TRUE;
            ENCRYPT_BOX(boxMon);
            return;
        }
    }
    BoxPokemon_SetDataInternal(boxMon, param, value);
    if (!boxMon->boxDecrypted) {
        boxMon->checksum = CHECKSUM(boxMon);
        ENCRYPT_BOX(boxMon);
    }
}

static void BoxPokemon_SetDataInternal(BoxPokemon *boxMon, int param, void *value) {
#define VALUE(type) (*(const type *)value)
    u64 mask;
    u32 i;
    u16 namebuf[POKEMON_NAME_LENGTH + 1];
    u16 namebuf2[POKEMON_NAME_LENGTH + 1];
    u16 namebuf3[POKEMON_NAME_LENGTH + 1];
    String *speciesName;

    PokemonDataBlockA *blockA = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_A);
    PokemonDataBlockB *blockB = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_B);
    PokemonDataBlockC *blockC = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_C);
    PokemonDataBlockD *blockD = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_D);

    switch (param) {
    case MON_DATA_PERSONALITY:
        boxMon->personality = VALUE(u32);
        break;
    case MON_DATA_IS_PARTY_DECRYPTED:
        GF_ASSERT(FALSE);
        boxMon->partyDecrypted = VALUE(u8);
        break;
    case MON_DATA_IS_BOX_DECRYPTED:
        GF_ASSERT(FALSE);
        boxMon->boxDecrypted = VALUE(u8);
        break;
    case MON_DATA_CHECKSUM_FAILED:
        boxMon->checksumFailed = VALUE(u8);
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
    case MON_DATA_UNUSED_RIBBON_53:
        mask = 1 << (param - MON_DATA_SINNOH_CHAMP_RIBBON);
        if (VALUE(u8)) {
            blockA->ribbonsDS1 |= mask;
        } else {
            blockA->ribbonsDS1 &= mask ^ 0xFFFFFFFF;
        }
        break;
    case MON_DATA_MOVE1:
    case MON_DATA_MOVE2:
    case MON_DATA_MOVE3:
    case MON_DATA_MOVE4:
        blockB->moves[param - MON_DATA_MOVE1] = VALUE(u16);
        break;
    case MON_DATA_MOVE1_PP:
    case MON_DATA_MOVE2_PP:
    case MON_DATA_MOVE3_PP:
    case MON_DATA_MOVE4_PP:
        blockB->moveCurrentPPs[param - MON_DATA_MOVE1_PP] = VALUE(u8);
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
    case MON_DATA_COOL_RIBBON:
    case MON_DATA_COOL_RIBBON_SUPER:
    case MON_DATA_COOL_RIBBON_HYPER:
    case MON_DATA_COOL_RIBBON_MASTER:
    case MON_DATA_BEAUTY_RIBBON:
    case MON_DATA_BEAUTY_RIBBON_SUPER:
    case MON_DATA_BEAUTY_RIBBON_HYPER:
    case MON_DATA_BEAUTY_RIBBON_MASTER:
    case MON_DATA_CUTE_RIBBON:
    case MON_DATA_CUTE_RIBBON_SUPER:
    case MON_DATA_CUTE_RIBBON_HYPER:
    case MON_DATA_CUTE_RIBBON_MASTER:
    case MON_DATA_SMART_RIBBON:
    case MON_DATA_SMART_RIBBON_SUPER:
    case MON_DATA_SMART_RIBBON_HYPER:
    case MON_DATA_SMART_RIBBON_MASTER:
    case MON_DATA_TOUGH_RIBBON:
    case MON_DATA_TOUGH_RIBBON_SUPER:
    case MON_DATA_TOUGH_RIBBON_HYPER:
    case MON_DATA_TOUGH_RIBBON_MASTER:
    case MON_DATA_CHAMPION_RIBBON:
    case MON_DATA_WINNING_RIBBON:
    case MON_DATA_VICTORY_RIBBON:
    case MON_DATA_ARTIST_RIBBON:
    case MON_DATA_EFFORT_RIBBON:
    case MON_DATA_MARINE_RIBBON:
    case MON_DATA_LAND_RIBBON:
    case MON_DATA_SKY_RIBBON:
    case MON_DATA_COUNTRY_RIBBON:
    case MON_DATA_NATIONAL_RIBBON:
    case MON_DATA_EARTH_RIBBON:
    case MON_DATA_WORLD_RIBBON:
        mask = 1 << (param - MON_DATA_COOL_RIBBON);
        if (VALUE(u8)) {
            blockB->ribbonsGBA |= mask;
        } else {
            blockB->ribbonsGBA &= mask ^ 0xFFFFFFFF;
        }
        break;
    case MON_DATA_FATEFUL_ENCOUNTER:
        blockB->fatefulEncounter = VALUE(u8);
        break;
    case MON_DATA_GENDER:
        blockB->gender = Species_GetGenderFromPersonality(blockA->species, boxMon->personality);
        break;
    case MON_DATA_FORM:
        blockB->form = VALUE(u8);
        break;
    case MON_DATA_UNUSED_113:
        blockB->unused1 = VALUE(u8);
        break;
    case MON_DATA_UNUSED_114:
        blockB->unused2 = VALUE(u16);
        break;
    case MON_DATA_NICKNAME_AND_FLAG:
        GetSpeciesNameIntoArray(blockA->species, HEAP_ID_DEFAULT, namebuf);
        blockB->hasNickname = StringNotEqual(namebuf, value);
        // fallthrough
    case MON_DATA_NICKNAME:
        for (i = 0; i < POKEMON_NAME_LENGTH + 1; i++) {
            blockC->nickname[i] = VALUE(u16);
            value = (void *const)((char *)value + 2);
        }
        break;
    case MON_DATA_NICKNAME_STRING_AND_FLAG:
        GetSpeciesNameIntoArray(blockA->species, HEAP_ID_DEFAULT, namebuf2);
        CopyStringToU16Array(value, namebuf3, POKEMON_NAME_LENGTH + 1);
        blockB->hasNickname = StringNotEqual(namebuf2, namebuf3);
        // fallthrough
    case MON_DATA_NICKNAME_STRING:
        CopyStringToU16Array(value, blockC->nickname, POKEMON_NAME_LENGTH + 1);
        break;
    case MON_DATA_UNUSED_121:
        blockC->unused = VALUE(u8);
        break;
    case MON_DATA_MET_GAME:
        blockC->originGame = VALUE(u8);
        break;
    case MON_DATA_SUPER_COOL_RIBBON:
    case MON_DATA_SUPER_COOL_RIBBON_GREAT:
    case MON_DATA_SUPER_COOL_RIBBON_ULTRA:
    case MON_DATA_SUPER_COOL_RIBBON_MASTER:
    case MON_DATA_SUPER_BEAUTY_RIBBON:
    case MON_DATA_SUPER_BEAUTY_RIBBON_GREAT:
    case MON_DATA_SUPER_BEAUTY_RIBBON_ULTRA:
    case MON_DATA_SUPER_BEAUTY_RIBBON_MASTER:
    case MON_DATA_SUPER_CUTE_RIBBON:
    case MON_DATA_SUPER_CUTE_RIBBON_GREAT:
    case MON_DATA_SUPER_CUTE_RIBBON_ULTRA:
    case MON_DATA_SUPER_CUTE_RIBBON_MASTER:
    case MON_DATA_SUPER_SMART_RIBBON:
    case MON_DATA_SUPER_SMART_RIBBON_GREAT:
    case MON_DATA_SUPER_SMART_RIBBON_ULTRA:
    case MON_DATA_SUPER_SMART_RIBBON_MASTER:
    case MON_DATA_SUPER_TOUGH_RIBBON:
    case MON_DATA_SUPER_TOUGH_RIBBON_GREAT:
    case MON_DATA_SUPER_TOUGH_RIBBON_ULTRA:
    case MON_DATA_SUPER_TOUGH_RIBBON_MASTER:
    case MON_DATA_UNUSED_RIBBON_143:
        mask = 1 << (param - MON_DATA_SUPER_COOL_RIBBON);
        if (VALUE(u8)) {
            blockC->ribbonsDS2 |= mask;
        } else {
            blockC->ribbonsDS2 &= mask ^ 0xFFFFFFFFFFFFFFFF;
        }
        break;
    case MON_DATA_OT_NAME:
        for (i = 0; i < PLAYER_NAME_LENGTH + 1; i++) {
            blockD->otName[i] = VALUE(u16);
            value = (void *)((char *)value + 2);
        }
        break;
    case MON_DATA_OT_NAME_STRING:
        CopyStringToU16Array(value, blockD->otName, PLAYER_NAME_LENGTH + 1);
        break;
    case MON_DATA_EGG_YEAR:
        blockD->eggYear = VALUE(u8);
        break;
    case MON_DATA_EGG_MONTH:
        blockD->eggMonth = VALUE(u8);
        break;
    case MON_DATA_EGG_DAY:
        blockD->eggDay = VALUE(u8);
        break;
    case MON_DATA_MET_YEAR:
        blockD->metYear = VALUE(u8);
        break;
    case MON_DATA_MET_MONTH:
        blockD->metMonth = VALUE(u8);
        break;
    case MON_DATA_MET_DAY:
        blockD->metDay = VALUE(u8);
        break;
    case MON_DATA_EGG_LOCATION:
    case MON_DATA_EGG_LOCATION_PTHGSS:
        if (VALUE(u16) == MAPSEC_MYSTERY_ZONE || LocationIsDiamondPearlCompatible(VALUE(u16)) == TRUE) {
            blockD->EggLocation_DP = VALUE(u16);
            blockB->EggLocation_PtHGSS = VALUE(u16);
        } else {
            blockD->EggLocation_DP = METLOC_FARAWAY_PLACE;
            blockB->EggLocation_PtHGSS = VALUE(u16);
        }
        break;
    case MON_DATA_MET_LOCATION:
    case MON_DATA_MET_LOCATION_PTHGSS:
        if (VALUE(u16) == MAPSEC_MYSTERY_ZONE || LocationIsDiamondPearlCompatible(VALUE(u16)) == TRUE) {
            blockD->MetLocation_DP = VALUE(u16);
            blockB->MetLocation_PtHGSS = VALUE(u16);
        } else {
            blockD->MetLocation_DP = METLOC_FARAWAY_PLACE;
            blockB->MetLocation_PtHGSS = VALUE(u16);
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
    case MON_DATA_OT_GENDER:
        blockD->otGender = VALUE(u8);
        break;
    case MON_DATA_MET_TERRAIN:
        blockD->metTerrain = VALUE(u8);
        break;
    case MON_DATA_COMBINED_IVS:
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
#undef VALUE
}

void Pokemon_IncreaseData(Pokemon *mon, int param, int value) {
    u32 checksum;
    if (!mon->box.partyDecrypted) {
        DECRYPT_PARTY(mon);
        DECRYPT_BOX(&mon->box);
        checksum = CHECKSUM(&mon->box);
        if (checksum != mon->box.checksum) {
            GF_ASSERT(checksum == mon->box.checksum);
            ENCRYPT_BOX(&mon->box);
            return;
        }
    }
    Pokemon_IncreaseDataInternal(mon, param, value);
    if (!mon->box.partyDecrypted) {
        ENCRYPT_PARTY(mon);
        mon->box.checksum = CHECKSUM(&mon->box);
        ENCRYPT_BOX(&mon->box);
    }
}

static void Pokemon_IncreaseDataInternal(Pokemon *mon, int param, int value) {
    switch (param) {
    case MON_DATA_HP:
        if (mon->party.hp + value > mon->party.maxHP) {
            mon->party.hp = mon->party.maxHP;
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
        GF_ASSERT(FALSE);
        break;
    default:
        BoxPokemon_AddDataInternal(&mon->box, param, value);
        break;
    }
}

static void BoxPokemon_AddDataInternal(BoxPokemon *boxMon, int param, int value) {
    PokemonDataBlockA *blockA = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_A);
    PokemonDataBlockB *blockB = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_B);
    PokemonDataBlockC *blockC = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_C);
    PokemonDataBlockD *blockD = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_D);

    switch (param) {
    case MON_DATA_EXPERIENCE:
        if (blockA->exp + value > Species_GetExpAtLevel(blockA->species, 100)) {
            blockA->exp = Species_GetExpAtLevel(blockA->species, 100);
        } else {
            blockA->exp += value;
        }
        break;
    case MON_DATA_FRIENDSHIP:
        int friendship = blockA->friendship;
        if (friendship + value > MAX_FRIENDSHIP) {
            friendship = MAX_FRIENDSHIP;
        }
        friendship += value;
        if (friendship < 0) {
            friendship = 0;
        }
        blockA->friendship = friendship;
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
        blockA->speedEV += value;
        break;
    case MON_DATA_SPATK_EV:
        blockA->spAtkEV += value;
        break;
    case MON_DATA_SPDEF_EV:
        blockA->spDefEV += value;
        break;
    case MON_DATA_COOL:
        if (blockA->cool + value > MAX_CONTEST_STAT) {
            blockA->cool = MAX_CONTEST_STAT;
        } else {
            blockA->cool += value;
        }
        break;
    case MON_DATA_BEAUTY:
        if (blockA->beauty + value > MAX_CONTEST_STAT) {
            blockA->beauty = MAX_CONTEST_STAT;
        } else {
            blockA->beauty += value;
        }
        break;
    case MON_DATA_CUTE:
        if (blockA->cute + value > MAX_CONTEST_STAT) {
            blockA->cute = MAX_CONTEST_STAT;
        } else {
            blockA->cute += value;
        }
        break;
    case MON_DATA_SMART:
        if (blockA->smart + value > MAX_CONTEST_STAT) {
            blockA->smart = MAX_CONTEST_STAT;
        } else {
            blockA->smart += value;
        }
        break;
    case MON_DATA_TOUGH:
        if (blockA->tough + value > MAX_CONTEST_STAT) {
            blockA->tough = MAX_CONTEST_STAT;
        } else {
            blockA->tough += value;
        }
        break;
    case MON_DATA_SHEEN:
        if (blockA->sheen + value > MAX_POKEMON_SHEEN) {
            blockA->sheen = MAX_POKEMON_SHEEN;
        } else {
            blockA->sheen += value;
        }
        break;
    case MON_DATA_MOVE1_PP:
    case MON_DATA_MOVE2_PP:
    case MON_DATA_MOVE3_PP:
    case MON_DATA_MOVE4_PP:
        if (blockB->moveCurrentPPs[param - MON_DATA_MOVE1_PP] + value > GetMoveMaxPP(blockB->moves[param - MON_DATA_MOVE1_PP], blockB->movePPUps[param - MON_DATA_MOVE1_PP])) {
            blockB->moveCurrentPPs[param - MON_DATA_MOVE1_PP] = GetMoveMaxPP(blockB->moves[param - MON_DATA_MOVE1_PP], blockB->movePPUps[param - MON_DATA_MOVE1_PP]);
        } else {
            blockB->moveCurrentPPs[param - MON_DATA_MOVE1_PP] += value;
        }
        break;
    case MON_DATA_MOVE1_PP_UPS:
    case MON_DATA_MOVE2_PP_UPS:
    case MON_DATA_MOVE3_PP_UPS:
    case MON_DATA_MOVE4_PP_UPS:
        if (blockB->movePPUps[param - MON_DATA_MOVE1_PP_UPS] + value > MAX_PP_UP_BONUSES) {
            blockB->movePPUps[param - MON_DATA_MOVE1_PP_UPS] = MAX_PP_UP_BONUSES;
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
        if (blockB->hpIV + value > MAX_IVS_SINGLE_STAT) {
            blockB->hpIV = MAX_IVS_SINGLE_STAT;
        } else {
            blockB->hpIV += value;
        }
        break;
    case MON_DATA_ATK_IV:
        if (blockB->atkIV + value > MAX_IVS_SINGLE_STAT) {
            blockB->atkIV = MAX_IVS_SINGLE_STAT;
        } else {
            blockB->atkIV += value;
        }
        break;
    case MON_DATA_DEF_IV:
        if (blockB->defIV + value > MAX_IVS_SINGLE_STAT) {
            blockB->defIV = MAX_IVS_SINGLE_STAT;
        } else {
            blockB->defIV += value;
        }
        break;
    case MON_DATA_SPEED_IV:
        if (blockB->speedIV + value > MAX_IVS_SINGLE_STAT) {
            blockB->speedIV = MAX_IVS_SINGLE_STAT;
        } else {
            blockB->speedIV += value;
        }
        break;
    case MON_DATA_SPATK_IV:
        if (blockB->spAtkIV + value > MAX_IVS_SINGLE_STAT) {
            blockB->spAtkIV = MAX_IVS_SINGLE_STAT;
        } else {
            blockB->spAtkIV += value;
        }
        break;
    case MON_DATA_SPDEF_IV:
        if (blockB->spDefIV + value > MAX_IVS_SINGLE_STAT) {
            blockB->spDefIV = MAX_IVS_SINGLE_STAT;
        } else {
            blockB->spDefIV += value;
        }
        break;
    case MON_DATA_PERSONALITY:
    case MON_DATA_IS_PARTY_DECRYPTED:
    case MON_DATA_IS_BOX_DECRYPTED:
    case MON_DATA_CHECKSUM_FAILED:
    case MON_DATA_CHECKSUM:
    case MON_DATA_SPECIES:
    case MON_DATA_HELD_ITEM:
    case MON_DATA_OT_ID:
    case MON_DATA_ABILITY:
    case MON_DATA_MARKINGS:
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
    case MON_DATA_UNUSED_RIBBON_53:
    case MON_DATA_MOVE1:
    case MON_DATA_MOVE2:
    case MON_DATA_MOVE3:
    case MON_DATA_MOVE4:
    case MON_DATA_IS_EGG:
    case MON_DATA_HAS_NICKNAME:
    case MON_DATA_COOL_RIBBON:
    case MON_DATA_COOL_RIBBON_SUPER:
    case MON_DATA_COOL_RIBBON_HYPER:
    case MON_DATA_COOL_RIBBON_MASTER:
    case MON_DATA_BEAUTY_RIBBON:
    case MON_DATA_BEAUTY_RIBBON_SUPER:
    case MON_DATA_BEAUTY_RIBBON_HYPER:
    case MON_DATA_BEAUTY_RIBBON_MASTER:
    case MON_DATA_CUTE_RIBBON:
    case MON_DATA_CUTE_RIBBON_SUPER:
    case MON_DATA_CUTE_RIBBON_HYPER:
    case MON_DATA_CUTE_RIBBON_MASTER:
    case MON_DATA_SMART_RIBBON:
    case MON_DATA_SMART_RIBBON_SUPER:
    case MON_DATA_SMART_RIBBON_HYPER:
    case MON_DATA_SMART_RIBBON_MASTER:
    case MON_DATA_TOUGH_RIBBON:
    case MON_DATA_TOUGH_RIBBON_SUPER:
    case MON_DATA_TOUGH_RIBBON_HYPER:
    case MON_DATA_TOUGH_RIBBON_MASTER:
    case MON_DATA_CHAMPION_RIBBON:
    case MON_DATA_WINNING_RIBBON:
    case MON_DATA_VICTORY_RIBBON:
    case MON_DATA_ARTIST_RIBBON:
    case MON_DATA_EFFORT_RIBBON:
    case MON_DATA_MARINE_RIBBON:
    case MON_DATA_LAND_RIBBON:
    case MON_DATA_SKY_RIBBON:
    case MON_DATA_COUNTRY_RIBBON:
    case MON_DATA_NATIONAL_RIBBON:
    case MON_DATA_EARTH_RIBBON:
    case MON_DATA_WORLD_RIBBON:
    case MON_DATA_FATEFUL_ENCOUNTER:
    case MON_DATA_GENDER:
    case MON_DATA_FORM:
    case MON_DATA_UNUSED_113:
    case MON_DATA_UNUSED_114:
    case MON_DATA_NICKNAME:
    case MON_DATA_NICKNAME_AND_FLAG:
    case MON_DATA_NICKNAME_STRING:
    case MON_DATA_NICKNAME_STRING_AND_FLAG:
    case MON_DATA_UNUSED_121:
    case MON_DATA_MET_GAME:
    case MON_DATA_SUPER_COOL_RIBBON:
    case MON_DATA_SUPER_COOL_RIBBON_GREAT:
    case MON_DATA_SUPER_COOL_RIBBON_ULTRA:
    case MON_DATA_SUPER_COOL_RIBBON_MASTER:
    case MON_DATA_SUPER_BEAUTY_RIBBON:
    case MON_DATA_SUPER_BEAUTY_RIBBON_GREAT:
    case MON_DATA_SUPER_BEAUTY_RIBBON_ULTRA:
    case MON_DATA_SUPER_BEAUTY_RIBBON_MASTER:
    case MON_DATA_SUPER_CUTE_RIBBON:
    case MON_DATA_SUPER_CUTE_RIBBON_GREAT:
    case MON_DATA_SUPER_CUTE_RIBBON_ULTRA:
    case MON_DATA_SUPER_CUTE_RIBBON_MASTER:
    case MON_DATA_SUPER_SMART_RIBBON:
    case MON_DATA_SUPER_SMART_RIBBON_GREAT:
    case MON_DATA_SUPER_SMART_RIBBON_ULTRA:
    case MON_DATA_SUPER_SMART_RIBBON_MASTER:
    case MON_DATA_SUPER_TOUGH_RIBBON:
    case MON_DATA_SUPER_TOUGH_RIBBON_GREAT:
    case MON_DATA_SUPER_TOUGH_RIBBON_ULTRA:
    case MON_DATA_SUPER_TOUGH_RIBBON_MASTER:
    case MON_DATA_UNUSED_RIBBON_143:
    case MON_DATA_OT_NAME:
    case MON_DATA_OT_NAME_STRING:
    case MON_DATA_EGG_YEAR:
    case MON_DATA_EGG_MONTH:
    case MON_DATA_EGG_DAY:
    case MON_DATA_MET_YEAR:
    case MON_DATA_MET_MONTH:
    case MON_DATA_MET_DAY:
    case MON_DATA_EGG_LOCATION:
    case MON_DATA_EGG_LOCATION_PTHGSS:
    case MON_DATA_MET_LOCATION:
    case MON_DATA_MET_LOCATION_PTHGSS:
    case MON_DATA_POKERUS:
    case MON_DATA_POKEBALL:
    case MON_DATA_MET_LEVEL:
    case MON_DATA_OT_GENDER:
    case MON_DATA_MET_TERRAIN:
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
    case MON_DATA_COMBINED_IVS:
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
        break;
    }
}

SpeciesData *SpeciesData_NewFromForm(int species, int form, enum HeapID heapID) {
    SpeciesData *speciesData = Heap_Alloc(heapID, sizeof(SpeciesData));
    SpeciesData_LoadForm(species, form, speciesData);
    return speciesData;
}

SpeciesData *SpeciesData_NewFromSpecies(int species, enum HeapID heapID) {
    SpeciesData *speciesData = Heap_Alloc(heapID, sizeof(SpeciesData));
    SpeciesData_LoadSpecies(species, speciesData);
    return speciesData;
}

int SpeciesData_GetValue(SpeciesData *speciesData, int param) {
    int ret;
    GF_ASSERT(speciesData != NULL);
    switch (param) {
    case SPECIES_DATA_BASE_HP:
        ret = speciesData->hp;
        break;
    case SPECIES_DATA_BASE_ATK:
        ret = speciesData->atk;
        break;
    case SPECIES_DATA_BASE_DEF:
        ret = speciesData->def;
        break;
    case SPECIES_DATA_BASE_SPEED:
        ret = speciesData->speed;
        break;
    case SPECIES_DATA_BASE_SP_ATK:
        ret = speciesData->spatk;
        break;
    case SPECIES_DATA_BASE_SP_DEF:
        ret = speciesData->spdef;
        break;
    case SPECIES_DATA_TYPE_1:
        ret = speciesData->types[0];
        break;
    case SPECIES_DATA_TYPE_2:
        ret = speciesData->types[1];
        break;
    case SPECIES_DATA_CATCH_RATE:
        ret = speciesData->catchRate;
        break;
    case SPECIES_DATA_EXP_YIELD:
        ret = speciesData->expYield;
        break;
    case SPECIES_DATA_EV_HP_YIELD:
        ret = speciesData->hp_yield;
        break;
    case SPECIES_DATA_EV_ATK_YIELD:
        ret = speciesData->atk_yield;
        break;
    case SPECIES_DATA_EV_DEF_YIELD:
        ret = speciesData->def_yield;
        break;
    case SPECIES_DATA_EV_SPEED_YIELD:
        ret = speciesData->speed_yield;
        break;
    case SPECIES_DATA_EV_SP_ATK_YIELD:
        ret = speciesData->spatk_yield;
        break;
    case SPECIES_DATA_EV_SP_DEF_YIELD:
        ret = speciesData->spdef_yield;
        break;
    case SPECIES_DATA_HELD_ITEM_COMMON:
        ret = speciesData->item1;
        break;
    case SPECIES_DATA_HELD_ITEM_RARE:
        ret = speciesData->item2;
        break;
    case SPECIES_DATA_GENDER_RATIO:
        ret = speciesData->genderRatio;
        break;
    case SPECIES_DATA_EGG_CYCLES:
        ret = speciesData->eggCycles;
        break;
    case SPECIES_DATA_BASE_FRIENDSHIP:
        ret = speciesData->friendship;
        break;
    case SPECIES_DATA_EXP_RATE:
        ret = speciesData->growthRate;
        break;
    case SPECIES_DATA_EGG_GROUP_1:
        ret = speciesData->eggGroups[0];
        break;
    case SPECIES_DATA_EGG_GROUP_2:
        ret = speciesData->eggGroups[1];
        break;
    case SPECIES_DATA_ABILITY_1:
        ret = speciesData->abilities[0];
        break;
    case SPECIES_DATA_ABILITY_2:
        ret = speciesData->abilities[1];
        break;
    case SPECIES_DATA_SAFARI_FLEE_RATE:
        ret = speciesData->greatMarshRate;
        break;
    case SPECIES_DATA_BODY_COLOR:
        ret = speciesData->color;
        break;
    case SPECIES_DATA_FLIP_SPRITE:
        ret = speciesData->flip;
        break;
    case SPECIES_DATA_TM_LEARNSET_MASK_1:
        ret = (int)speciesData->tmhm_1;
        break;
    case SPECIES_DATA_TM_LEARNSET_MASK_2:
        ret = (int)speciesData->tmhm_2;
        break;
    case SPECIES_DATA_TM_LEARNSET_MASK_3:
        ret = (int)speciesData->tmhm_3;
        break;
    case SPECIES_DATA_TM_LEARNSET_MASK_4:
        ret = (int)speciesData->tmhm_4;
        break;
    }
    return ret;
}

void SpeciesData_Free(SpeciesData *speciesData) {
    GF_ASSERT(speciesData != NULL);
    Heap_Free(speciesData);
}

int Species_GetFormValue(int species, int form, int param) {
    SpeciesData *speciesData = SpeciesData_NewFromSpecies(Species_GetFormNarcIndex(species, form), HEAP_ID_DEFAULT);
    int result = SpeciesData_GetValue(speciesData, param);
    SpeciesData_Free(speciesData);
    return result;
}

int Species_GetValue(int species, int param) {
    SpeciesData *speciesData = SpeciesData_NewFromSpecies(species, HEAP_ID_DEFAULT);
    int result = SpeciesData_GetValue(speciesData, param);
    SpeciesData_Free(speciesData);
    return result;
}

int Species_GetFormValueFromNarc(NARC *narc, int species, int form, int param) {
    int resolved = Species_GetFormNarcIndex(species, form);
    SpeciesData *speciesData = Heap_Alloc(HEAP_ID_DEFAULT, sizeof(SpeciesData));
    NARC_ReadWholeMember(narc, resolved, speciesData);
    int result = SpeciesData_GetValue(speciesData, param);
    Heap_Free(speciesData);
    return result;
}

u8 Pokemon_CalcPercentToNextLevel(Pokemon *mon) {
    BOOL recrypt = Pokemon_DecryptData(mon);
    u16 species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    u8 level = Pokemon_GetData(mon, MON_DATA_LEVEL, NULL);
    u32 curLevelExp = Species_GetExpAtLevel(species, level);
    u32 nextLevelExp = Species_GetExpAtLevel(species, level + 1);
    u32 curExp = Pokemon_GetData(mon, MON_DATA_EXPERIENCE, NULL);

    Pokemon_EncryptData(mon, recrypt);
    u8 percent = ((curExp - curLevelExp) * 100) / (nextLevelExp - curLevelExp);

    return percent;
}

u32 Pokemon_CalcExpToNextLevel(Pokemon *mon) {
    return BoxPokemon_CalcExpToNextLevel(&mon->box);
}

u32 BoxPokemon_CalcExpToNextLevel(BoxPokemon *boxMon) {
    u16 species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    u16 nextLevel = BoxPokemon_CalcLevel(boxMon) + 1;
    u32 exp = BoxPokemon_GetData(boxMon, MON_DATA_EXPERIENCE, NULL);
    return Species_GetExpAtLevel(species, nextLevel) - exp;
}

u32 Pokemon_GetCurrentLevelBaseExp(Pokemon *mon) {
    int species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    int level = Pokemon_GetData(mon, MON_DATA_LEVEL, NULL);
    return Species_GetExpAtLevel(species, level);
}

u32 Species_GetExpAtLevel(int species, int level) {
    return ExpRate_GetExpAtLevel(Species_GetValue(species, SPECIES_DATA_EXP_RATE), level);
}

void ExpRate_LoadTable(int rate, u32 *dest) {
    GF_ASSERT(rate < GROWTH_RATE_COUNT);
    ReadWholeNarcMemberByIdPair(dest, NARC_poketool_personal_growtbl, rate);
}

u32 ExpRate_GetExpAtLevel(int rate, int level) {
    GF_ASSERT(rate < GROWTH_RATE_COUNT);
    GF_ASSERT(level <= MAX_MON_LEVEL + 1);

    u32 *expTable = Heap_Alloc(HEAP_ID_DEFAULT, (MAX_MON_LEVEL + 1) * sizeof(u32));
    ExpRate_LoadTable(rate, expTable);

    u32 ret = expTable[level];
    Heap_Free(expTable);

    return ret;
}

int Pokemon_CalcLevel(Pokemon *mon) {
    return BoxPokemon_CalcLevel(&mon->box);
}

int BoxPokemon_CalcLevel(BoxPokemon *boxMon) {
    BOOL reencrypt = BoxPokemon_DecryptData(boxMon);
    int species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    int exp = BoxPokemon_GetData(boxMon, MON_DATA_EXPERIENCE, NULL);
    BoxPokemon_EncryptData(boxMon, reencrypt);
    return Species_CalcLevelByExp(species, exp);
}

int Species_CalcLevelByExp(u16 species, u32 exp) {
    SpeciesData *speciesData = SpeciesData_NewFromSpecies(species, HEAP_ID_DEFAULT);
    int level = SpeciesData_CalcLevelByExp(speciesData, species, exp);
    SpeciesData_Free(speciesData);
    return level;
}

int SpeciesData_CalcLevelByExp(SpeciesData *speciesData, u16 unused_species, u32 exp) {
#pragma unused(unused_species)
    static u32 table[MAX_MON_LEVEL + 1];
    ExpRate_LoadTable(SpeciesData_GetValue(speciesData, SPECIES_DATA_EXP_RATE), table);
    int i;
    for (i = 1; i < MAX_MON_LEVEL + 1; i++) {
        if (table[i] > exp) {
            break;
        }
    }
    return i - 1;
}

u8 Pokemon_GetNature(Pokemon *mon) {
    return BoxPokemon_GetNature(&mon->box);
}

u8 BoxPokemon_GetNature(BoxPokemon *boxMon) {
    BOOL reencrypt = BoxPokemon_DecryptData(boxMon);
    u32 personality = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    BoxPokemon_EncryptData(boxMon, reencrypt);
    return Personality_GetNature(personality);
}

u8 Personality_GetNature(u32 personality) {
    return (u8)(personality % NATURE_COUNT);
}

// clang-format off
const s8 gNatureStatModifiers[NATURE_COUNT][NUM_EV_STATS] = {
                    // Attack Defense Speed Sp.Atk Sp.Def
    [NATURE_HARDY]   = {  0,     0,     0,     0,    0 },
    [NATURE_LONELY]  = { +1,    -1,     0,     0,    0 },
    [NATURE_BRAVE]   = { +1,     0,    -1,     0,    0 },
    [NATURE_ADAMANT] = { +1,     0,     0,    -1,    0 },
    [NATURE_NAUGHTY] = { +1,     0,     0,     0,   -1 },
    [NATURE_BOLD]    = { -1,    +1,     0,     0,    0 },
    [NATURE_DOCILE]  = {  0,     0,     0,     0,    0 },
    [NATURE_RELAXED] = {  0,    +1,    -1,     0,    0 },
    [NATURE_IMPISH]  = {  0,    +1,     0,    -1,    0 },
    [NATURE_LAX]     = {  0,    +1,     0,     0,   -1 },
    [NATURE_TIMID]   = { -1,     0,    +1,     0,    0 },
    [NATURE_HASTY]   = {  0,    -1,    +1,     0,    0 },
    [NATURE_SERIOUS] = {  0,     0,     0,     0,    0 },
    [NATURE_JOLLY]   = {  0,     0,    +1,    -1,    0 },
    [NATURE_NAIVE]   = {  0,     0,    +1,     0,   -1 },
    [NATURE_MODEST]  = { -1,     0,     0,    +1,    0 },
    [NATURE_MILD]    = {  0,    -1,     0,    +1,    0 },
    [NATURE_QUIET]   = {  0,     0,    -1,    +1,    0 },
    [NATURE_BASHFUL] = {  0,     0,     0,     0,    0 },
    [NATURE_RASH]    = {  0,     0,     0,    +1,   -1 },
    [NATURE_CALM]    = { -1,     0,     0,     0,   +1 },
    [NATURE_GENTLE]  = {  0,    -1,     0,     0,   +1 },
    [NATURE_SASSY]   = {  0,     0,    -1,     0,   +1 },
    [NATURE_CAREFUL] = {  0,     0,     0,    -1,   +1 },
    [NATURE_QUIRKY]  = {  0,     0,     0,     0,    0 },
};
// clang-format on

u16 Nature_ModifyStatValue(u8 nature, u16 value, u8 stat) {
    u16 ret;
    // Dont modify HP, Accuracy, or Evasion by nature
    if (stat < STAT_ATK || stat > STAT_SPDEF) {
        return value;
    }

    switch (gNatureStatModifiers[nature][stat - 1]) {
    case 1:
        // NOTE: will overflow for n > 595 because the intermediate value is cast to u16 before the division.
        ret = value * 110;
        ret /= 100;
        break;
    case -1:
        // NOTE: will overflow for n > 728, see above
        ret = value * 90;
        ret /= 100;
        break;
    default:
        ret = value;
        break;
    }
    return ret;
}

// clang-format off
static const s8 sFriendshipModifiers[FRIENDSHIP_EVENT_NUM][FRIENDSHIP_TIER_NUM] = {
    [FRIENDSHIP_EVENT_GROW_LEVEL] =     {  5,  3,   2 },
    [FRIENDSHIP_EVENT_VITAMIN] =        {  5,  3,   2 },
    [FRIENDSHIP_EVENT_BATTLE_ITEM] =    {  1,  1,   0 },
    [FRIENDSHIP_EVENT_LEAGUE_BATTLE] =  {  3,  2,   1 },
    [FRIENDSHIP_EVENT_LEARN_TMHM] =     {  1,  1,   0 },
    [FRIENDSHIP_EVENT_WALKING] =        {  1,  1,   1 },
    [FRIENDSHIP_EVENT_FAINT_SMALL] =    { -1, -1,  -1 },
    [FRIENDSHIP_EVENT_HEAL_FIELD_PSN] = { -5, -5, -10 },
    [FRIENDSHIP_EVENT_FAINT_LARGE] =    { -5, -5, -10 },
    [FRIENDHSIP_EVENT_CONTEST_WIN] =    {  3,  2,   1 },
};
// clang-format on

void Pokemon_UpdateFriendship(Pokemon *mon, u8 kind, u16 location) {
    if (kind == FRIENDSHIP_EVENT_WALKING && (LCRandom() & 1)) {
        return;
    }

    u16 species = Pokemon_GetData(mon, MON_DATA_SPECIES_OR_EGG, NULL);
    if (species == SPECIES_NONE || species == SPECIES_EGG) {
        return;
    }

    u16 item = Pokemon_GetData(mon, MON_DATA_HELD_ITEM, NULL);
    u8 effect = GetItemAttr(item, ITEMATTR_HOLD_EFFECT, HEAP_ID_DEFAULT);
    u8 tier = FRIENDSHIP_TIER_LOW;
    s16 friendship = Pokemon_GetData(mon, MON_DATA_FRIENDSHIP, NULL);
    if (friendship >= FRIENDSHIP_TIER_MID_MIN) {
        tier++;
    }
    if (friendship >= FRIENDSHIP_TIER_HI_MIN) {
        tier++;
    }

    s8 modifier = sFriendshipModifiers[kind][tier];
    if (modifier > 0 && Pokemon_GetData(mon, MON_DATA_DP_POKEBALL, NULL) == BALL_LUXURY) {
        modifier++;
    }
    if (modifier > 0 && Pokemon_GetData(mon, MON_DATA_EGG_LOCATION, NULL) == location) {
        modifier++;
    }
    if (modifier > 0 && effect == HOLD_EFFECT_FRIENDSHIP_UP) {
        modifier = modifier * 150 / 100;
    }

    friendship += modifier;
    if (friendship < 0) {
        friendship = 0;
    }
    if (friendship > MAX_FRIENDSHIP) {
        friendship = MAX_FRIENDSHIP;
    }
    Pokemon_SetData(mon, MON_DATA_FRIENDSHIP, &friendship);
}

u8 Pokemon_GetGender(Pokemon *mon) {
    return BoxPokemon_GetGender(&mon->box);
}

u8 BoxPokemon_GetGender(BoxPokemon *boxMon) {
    BOOL reencrypt = BoxPokemon_DecryptData(boxMon);
    u16 species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    u32 personality = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    BoxPokemon_EncryptData(boxMon, reencrypt);
    return Species_GetGenderFromPersonality(species, personality);
}

u8 Species_GetGenderFromPersonality(u16 species, u32 personality) {
    SpeciesData *speciesData = SpeciesData_NewFromSpecies(species, HEAP_ID_DEFAULT);
    u8 gender = SpeciesData_GetGenderFromPersonality(speciesData, species, personality);
    SpeciesData_Free(speciesData);
    return gender;
}

u8 SpeciesData_GetGenderFromPersonality(SpeciesData *speciesData, u16 unused_species, u32 personality) {
    u8 ratio = SpeciesData_GetValue(speciesData, SPECIES_DATA_GENDER_RATIO);
    switch (ratio) {
    case GENDER_RATIO_MALE_ONLY:
        return GENDER_MALE;
    case GENDER_RATIO_FEMALE_ONLY:
        return GENDER_FEMALE;
    case GENDER_RATIO_UNKNOWN:
        return GENDER_NONE;
    default:
        if (ratio > (personality & 0xff)) {
            return GENDER_FEMALE;
        } else {
            return GENDER_MALE;
        }
    }
}

BOOL BoxPokemon_IsHoldingMail(BoxPokemon *boxMon) {
    return ItemIdIsMail(BoxPokemon_GetData(boxMon, MON_DATA_HELD_ITEM, NULL));
}

// TODO: bool8?
u8 Pokemon_IsShiny(Pokemon *mon) {
    return BoxPokemon_IsShiny(&mon->box);
}

// TODO: bool8?
u8 BoxPokemon_IsShiny(BoxPokemon *boxMon) {
    u32 otID = BoxPokemon_GetData(boxMon, MON_DATA_OT_ID, NULL);
    u32 personality = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    return Personality_IsShiny(otID, personality);
}

u8 Personality_IsShiny(u32 otID, u32 personality) {
    return SHINY_CHECK(otID, personality);
}

u32 Personality_GenerateShiny(u32 otID) {
    // 1. Pre-compute the XOR of the two halves of the trainer ID. We only
    // care about the most-significant 13 bits, so truncate the last 3.
    otID = (((otID & 0xFFFF0000) >> 16) ^ (otID & 0xFFFF)) >> 3u;

    int i;

    // 2. Randomize the least-significant 3-bits of each half of the
    // generated personality.
    u16 rndLow = LCRandom() & 7;
    u16 rndHigh = LCRandom() & 7;

    // 3. For each of the remaining 13 bits, pick some permutation of them
    // across both halves to be set to 1 such that the XOR of their bits
    // will XOR with the monOTID to 0.
    for (i = 0; i < 13; i++) {
        if (MaskOfFlagNo(i) & otID) {
            // Trainer ID XORs to 1; set one of the two personality bits to 1
            if (LCRandom() & 1) {
                rndLow |= MaskOfFlagNo(i + 3);
            } else {
                rndHigh |= MaskOfFlagNo(i + 3);
            }
        } else if (LCRandom() & 1) {
            // Trainer ID XORs to 0; set both of the two bits to either 0 or 1
            rndLow |= MaskOfFlagNo(i + 3);
            rndHigh |= MaskOfFlagNo(i + 3);
        }
    }
    return rndLow | (rndHigh << 16);
}

void Pokemon_BuildSpriteTemplate(PokemonSpriteTemplate *template, Pokemon *mon, u8 face) {
    BoxPokemon_BuildSpriteTemplate(template, &mon->box, face, FALSE);
}

void BoxPokemon_BuildSpriteTemplateDP(PokemonSpriteTemplate *template, BoxPokemon *boxMon, u8 face) {
    BoxPokemon_BuildSpriteTemplate(template, boxMon, face, TRUE);
}

void BoxPokemon_BuildSpriteTemplate(PokemonSpriteTemplate *template, BoxPokemon *boxMon, u8 face, BOOL preferDP) {
    BOOL reencrypt = BoxPokemon_DecryptData(boxMon);
    u16 species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES_OR_EGG, NULL);
    u8 gender = BoxPokemon_GetGender(boxMon);
    u8 shiny = BoxPokemon_IsShiny(boxMon);
    u32 personality = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    u8 form;
    if (species == SPECIES_EGG) {
        if (BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL) == SPECIES_MANAPHY) {
            form = EGG_FORM_MANAPHY;
        } else {
            form = EGG_FORM_BASE;
        }
    } else {
        form = BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);
    }

    if (preferDP == TRUE) {
        Species_BuildSpriteTemplateDP(template, species, gender, face, shiny, form, personality);
    } else {
        Species_BuildSpriteTemplate(template, species, gender, face, shiny, form, personality);
    }
    BoxPokemon_EncryptData(boxMon, reencrypt);
}

void Species_BuildSpriteTemplate(PokemonSpriteTemplate *template, u16 species, u8 gender, u8 face, u8 shiny, u8 form, u32 personality) {
    template->species = SPECIES_NONE;
    template->isAnimated = FALSE;
    template->personality = 0;
    form = Species_SanitizeFormId(species, form);
    switch (species) {
    case SPECIES_BURMY:
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face / 2 + 0x48 + form * 2);
        template->palDataID = (u16)(shiny + 0xAA + form * 2);
        break;
    case SPECIES_WORMADAM:
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face / 2 + 0x4E + form * 2);
        template->palDataID = (u16)(shiny + 0xB0 + form * 2);
        break;
    case SPECIES_SHELLOS:
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face + 0x54 + form);
        template->palDataID = (u16)(shiny + 0xB6 + form * 2);
        break;
    case SPECIES_GASTRODON:
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face + 0x58 + form);
        template->palDataID = (u16)(shiny + 0xBA + form * 2);
        break;
    case SPECIES_CHERRIM:
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face + 0x5C + form);
        template->palDataID = (u16)(shiny * 2 + 0xBE + form);
        break;
    case SPECIES_ARCEUS:
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face / 2 + 0x60 + form * 2);
        template->palDataID = (u16)(shiny + 0xC2 + form * 2);
        break;
    case SPECIES_CASTFORM:
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face * 2 + 0x40 + form);
        template->palDataID = (u16)(shiny * 4 + 0xA2 + form);
        break;
    case SPECIES_DEOXYS:
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face / 2 + form * 2);
        template->palDataID = (u16)(shiny + 0x9E);
        break;
    case SPECIES_UNOWN:
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face / 2 + 0x8 + form * 2);
        template->palDataID = (u16)(shiny + 0xA0);
        break;
    case SPECIES_EGG: // egg, manaphy egg
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(0x84 + form);
        template->palDataID = (u16)(0xE6 + form);
        break;
    case SPECIES_BAD_EGG: // bad egg
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = 0x84;
        template->palDataID = 0xE6;
        break;
    case SPECIES_SHAYMIN: // land, sky
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face / 2 + 0x86 + form * 2);
        template->palDataID = (u16)(shiny + 0xE8 + form * 2);
        break;
    case SPECIES_ROTOM: // normal, fan, mow, wash, heat, frost
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face / 2 + 0x8A + form * 2);
        template->palDataID = (u16)(shiny + 0xEC + form * 2);
        break;
    case SPECIES_GIRATINA: // altered, origin
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face / 2 + 0x96 + form * 2);
        template->palDataID = (u16)(shiny + 0xF8 + form * 2);
        break;
    case SPECIES_PICHU: // spiky-ear
        template->narcID = NARC_poketool_pokegra_otherpoke;
        template->charDataID = (u16)(face / 2 + 0x9A + form * 2);
        template->palDataID = (u16)(shiny + 0xFC + form * 2);
        break;
    default:
        template->narcID = NARC_poketool_pokegra_pokegra;
        template->charDataID = (u16)(species * 6 + face + (gender == GENDER_FEMALE ? 0 : 1));
        template->palDataID = (u16)(shiny + (species * 6 + 4));
        if (species == SPECIES_SPINDA && face == MON_PIC_FACING_FRONT) {
            template->species = SPECIES_SPINDA;
            template->isAnimated = FALSE;
            template->personality = personality;
        }
        break;
    }
}

u8 Species_SanitizeFormId(u16 species, u8 form) {
    switch (species) {
    case SPECIES_BURMY:
        if (form > BURMY_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    case SPECIES_WORMADAM:
        if (form > WORMADAM_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    case SPECIES_SHELLOS:
        if (form > SHELLOS_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    case SPECIES_GASTRODON:
        if (form > GASTRODON_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    case SPECIES_CHERRIM:
        if (form > CHERRIM_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    case SPECIES_ARCEUS:
        if (form > ARCEUS_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    case SPECIES_CASTFORM:
        if (form > CASTFORM_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    case SPECIES_DEOXYS:
        if (form > DEOXYS_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    case SPECIES_UNOWN:
        if (form >= UNOWN_FORM_COUNT) {
            form = 0;
        }
        break;
    case SPECIES_EGG:
        if (form > EGG_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    case SPECIES_SHAYMIN:
        if (form > SHAYMIN_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    case SPECIES_ROTOM:
        if (form > ROTOM_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    case SPECIES_GIRATINA:
        if (form > GIRATINA_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    case SPECIES_PICHU:
        if (form > PICHU_FORM_COUNT - 1) {
            form = 0;
        }
        break;
    }
    return form;
}

void sub_02070560(PokemonSpriteTemplate *pokepicTemplate, u16 species, u8 face, u8 gender, u32 shiny) {
    pokepicTemplate->narcID = NARC_pbr_pokegra;
    pokepicTemplate->charDataID = (u16)(species * 6 + face + (gender == GENDER_FEMALE ? 0 : 1));
    pokepicTemplate->palDataID = (u16)(shiny + (species * 6 + 4));
}

/**
 * @brief Build a PokemonSpriteTemplate for a Pokemon sprite, preferring sprites from
 * Diamond/Pearl over Platinum/HGSS.
 *
 * This routine will still use sprites from Platinum for Pokemon variants which
 * did not exist in Diamond/Pearl, namely:
 * - Giratina-Origin
 * - Shaymin-Sky
 * - Rotom appliances
 * - Pichu-SpikyEar
 *
 * @param template       Pointer to the sprite template to be populated
 * @param species        The Pokemon's species
 * @param gender         The Pokemon's gender
 * @param face           Which face of the Pokemon the player sees
 * @param shiny          1 if the Pokemon is shiny, 0 if not
 * @param form           The Pokemon's form
 * @param personality    The Pokemon's personality value
 */
static void Species_BuildSpriteTemplateDP(PokemonSpriteTemplate *template, u16 species, u8 gender, u8 face, u8 shiny, u8 form, u32 personality) {
    template->species = SPECIES_NONE;
    template->isAnimated = FALSE;
    template->personality = 0;
    form = Species_SanitizeFormId(species, form);
    switch (species) {
    case SPECIES_BURMY:
        template->narcID = NARC_pbr_otherpoke;
        template->charDataID = (u16)(face / 2 + 0x48 + form * 2);
        template->palDataID = (u16)(shiny + 0x92 + form * 2);
        break;
    case SPECIES_WORMADAM:
        template->narcID = NARC_pbr_otherpoke;
        template->charDataID = (u16)(face / 2 + 0x4E + form * 2);
        template->palDataID = (u16)(shiny + 0x98 + form * 2);
        break;
    case SPECIES_SHELLOS:
        template->narcID = NARC_pbr_otherpoke;
        template->charDataID = (u16)(face + 0x54 + form);
        template->palDataID = (u16)(shiny + 0x9E + form * 2);
        break;
    case SPECIES_GASTRODON:
        template->narcID = NARC_pbr_otherpoke;
        template->charDataID = (u16)(face + 0x58 + form);
        template->palDataID = (u16)(shiny + 0xA2 + form * 2);
        break;
    case SPECIES_CHERRIM:
        template->narcID = NARC_pbr_otherpoke;
        template->charDataID = (u16)(face + 0x5C + form);
        template->palDataID = (u16)(shiny * 2 + 0xA6 + form);
        break;
    case SPECIES_ARCEUS:
        template->narcID = NARC_pbr_otherpoke;
        template->charDataID = (u16)(face / 2 + 0x60 + form * 2);
        template->palDataID = (u16)(shiny + 0xAA + form * 2);
        break;
    case SPECIES_CASTFORM:
        template->narcID = NARC_pbr_otherpoke;
        template->charDataID = (u16)(face * 2 + 0x40 + form);
        template->palDataID = (u16)(shiny * 4 + 0x8A + form);
        break;
    case SPECIES_DEOXYS:
        template->narcID = NARC_pbr_otherpoke;
        template->charDataID = (u16)(face / 2 + form * 2);
        template->palDataID = (u16)(shiny + 0x86);
        break;
    case SPECIES_UNOWN:
        template->narcID = NARC_pbr_otherpoke;
        template->charDataID = (u16)(face / 2 + 0x8 + form * 2);
        template->palDataID = (u16)(shiny + 0x88);
        break;
    case SPECIES_EGG: // egg, manaphy egg
        template->narcID = NARC_pbr_otherpoke;
        template->charDataID = (u16)(0x84 + form);
        template->palDataID = (u16)(0xCE + form);
        break;
    case SPECIES_BAD_EGG: // bad egg
        template->narcID = NARC_pbr_otherpoke;
        template->charDataID = 132;
        template->palDataID = 206;
        break;
    case SPECIES_SHAYMIN: // land, sky
        if (form > 0) {
            template->narcID = NARC_poketool_pokegra_otherpoke;
            template->charDataID = (u16)(face / 2 + 0x86 + form * 2);
            template->palDataID = (u16)(shiny + 0xEA);
        } else {
            sub_02070560(template, species, face, gender, shiny);
        }
        break;
    case SPECIES_ROTOM: // normal, fan, mow, wash, heat, frost
        if (form > 0) {
            template->narcID = NARC_poketool_pokegra_otherpoke;
            template->charDataID = (u16)(face / 2 + 0x8A + form * 2);
            template->palDataID = (u16)(shiny + 0xEC + form * 2);
        } else {
            sub_02070560(template, species, face, gender, shiny);
        }
        break;
    case SPECIES_GIRATINA: // altered, origin
        if (form > 0) {
            template->narcID = NARC_poketool_pokegra_otherpoke;
            template->charDataID = (u16)(face / 2 + 0x96 + form * 2);
            template->palDataID = (u16)(shiny + 0xF8 + form * 2);
        } else {
            sub_02070560(template, species, face, gender, shiny);
        }
        break;
    case SPECIES_PICHU: // spiky-ear
        if (form != 0) {
            template->narcID = NARC_poketool_pokegra_otherpoke;
            template->charDataID = (u16)(face / 2 + 0x9C);
            template->palDataID = (u16)(shiny + 0xFE);
        } else {
            sub_02070560(template, species, face, gender, shiny);
        }
        break;
    default:
        sub_02070560(template, species, face, gender, shiny);
        if (species == SPECIES_SPINDA && face == MON_PIC_FACING_FRONT) {
            template->species = SPECIES_SPINDA;
            template->isAnimated = FALSE;
            template->personality = personality;
        }
        break;
    }
}

u8 sub_0207083C(BoxPokemon *boxMon, u8 face) {
    return BoxPokemon_SpriteYOffset(boxMon, face, FALSE);
}

u8 sub_02070848(BoxPokemon *boxMon, u8 face) {
    return BoxPokemon_SpriteYOffset(boxMon, face, TRUE);
}

u8 BoxPokemon_SpriteYOffset(BoxPokemon *boxMon, u8 face, BOOL preferDP) {
    u16 species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES_OR_EGG, NULL);
    u8 gender = BoxPokemon_GetGender(boxMon);
    u32 personality = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    u8 form;
    if (species == SPECIES_EGG) {
        if (BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL) == SPECIES_MANAPHY) {
            form = EGG_FORM_MANAPHY;
        } else {
            form = EGG_FORM_BASE;
        }
    } else {
        form = BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);
    }

    if (preferDP == TRUE) {
        return Species_LoadSpriteYOffsetDP(species, gender, face, form, personality);
    }
    return Species_LoadSpriteYOffset(species, gender, face, form, personality);
}

u8 Species_LoadSpriteYOffset(u16 species, u8 gender, u8 face, u8 form, u32 pid) {
#pragma unused(pid)
    form = Species_SanitizeFormId(species, form);

    NarcId narcID;
    s32 fileID;
    switch (species) {
    case SPECIES_BURMY:
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 72 + (face / 2) + form * 2;
        break;
    case SPECIES_WORMADAM:
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 78 + (face / 2) + form * 2;
        break;
    case SPECIES_SHELLOS:
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 84 + face + form;
        break;
    case SPECIES_GASTRODON:
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 88 + face + form;
        break;
    case SPECIES_CHERRIM:
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 92 + face + form;
        break;
    case SPECIES_ARCEUS:
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 96 + (face / 2) + form * 2;
        break;
    case SPECIES_CASTFORM:
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 64 + face * 2 + form;
        break;
    case SPECIES_DEOXYS:
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 0 + (face / 2) + form * 2;
        break;
    case SPECIES_UNOWN:
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 8 + (face / 2) + form * 2;
        break;
    case SPECIES_EGG: // egg, manaphy egg
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 132 + form;
        break;
    case SPECIES_BAD_EGG: // bad egg
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 132;
        break;
    case SPECIES_SHAYMIN: // land, sky
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 136 + (face / 2) + form * 2;
        break;
    case SPECIES_ROTOM: // normal, fan, mow, wash, heat, frost
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 140 + (face / 2) + form * 2;
        break;
    case SPECIES_GIRATINA: // altered, origin
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 152 + (face / 2) + form * 2;
        break;
    case SPECIES_PICHU: // spiky-ear
        narcID = NARC_poketool_pokegra_height_o;
        fileID = 156 + (face / 2) + form * 2;
        break;
    default:
        narcID = NARC_poketool_pokegra_height;
        fileID = species * 4 + face + (gender != GENDER_FEMALE ? 1 : 0);
        break;
    }

    u8 ret;
    ReadWholeNarcMemberByIdPair(&ret, narcID, fileID);
    return ret;
}

u8 Species_LoadSpriteYOffsetDP(u16 species, u8 gender, u8 face, u8 form, u32 pid) {
#pragma unused(pid)
    form = Species_SanitizeFormId(species, form);

    NarcId narcID;
    s32 fileID;
    switch (species) {
    case SPECIES_BURMY:
        narcID = NARC_pbr_dp_height_o;
        fileID = 72 + (face / 2) + form * 2;
        break;
    case SPECIES_WORMADAM:
        narcID = NARC_pbr_dp_height_o;
        fileID = 78 + (face / 2) + form * 2;
        break;
    case SPECIES_SHELLOS:
        narcID = NARC_pbr_dp_height_o;
        fileID = 84 + face + form;
        break;
    case SPECIES_GASTRODON:
        narcID = NARC_pbr_dp_height_o;
        fileID = 88 + face + form;
        break;
    case SPECIES_CHERRIM:
        narcID = NARC_pbr_dp_height_o;
        fileID = 92 + face + form;
        break;
    case SPECIES_ARCEUS:
        narcID = NARC_pbr_dp_height_o;
        fileID = 96 + (face / 2) + form * 2;
        break;
    case SPECIES_CASTFORM:
        narcID = NARC_pbr_dp_height_o;
        fileID = 64 + face * 2 + form;
        break;
    case SPECIES_DEOXYS:
        narcID = NARC_pbr_dp_height_o;
        fileID = 0 + (face / 2) + form * 2;
        break;
    case SPECIES_UNOWN:
        narcID = NARC_pbr_dp_height_o;
        fileID = 8 + (face / 2) + form * 2;
        break;
    case SPECIES_EGG: // egg, manaphy egg
        narcID = NARC_pbr_dp_height_o;
        fileID = 132 + form;
        break;
    case SPECIES_BAD_EGG: // bad egg
        narcID = NARC_pbr_dp_height_o;
        fileID = 132;
        break;
    case SPECIES_SHAYMIN: // land, sky
        if (form > 0) {
            narcID = NARC_poketool_pokegra_height_o;
            fileID = 136 + (face / 2) + form * 2;
        } else {
            narcID = NARC_pbr_dp_height;
            fileID = species * 4 + face + (gender != GENDER_FEMALE ? 1 : 0);
        }
        break;
    case SPECIES_ROTOM: // normal, fan, mow, wash, heat, frost
        if (form > 0) {
            narcID = NARC_poketool_pokegra_height_o;
            fileID = 140 + (face / 2) + form * 2;
        } else {
            narcID = NARC_pbr_dp_height;
            fileID = species * 4 + face + (gender != GENDER_FEMALE ? 1 : 0);
        }
        break;
    case SPECIES_GIRATINA: // altered, origin
        if (form > 0) {
            narcID = NARC_poketool_pokegra_height_o;
            fileID = 152 + (face / 2) + form * 2;
        } else {
            narcID = NARC_pbr_dp_height;
            fileID = species * 4 + face + (gender != GENDER_FEMALE ? 1 : 0);
        }
        break;
    default:
        narcID = NARC_pbr_dp_height;
        fileID = species * 4 + face + (gender != GENDER_FEMALE ? 1 : 0);
        break;
    }

    u8 ret;
    ReadWholeNarcMemberByIdPair(&ret, narcID, fileID);
    return ret;
}

static const struct ManagedSpriteTemplate _020FF588 = {
    0x0,
    0x0,
    0x0,
    0x0,
    0x0,
    0x0,
    NNS_G2D_VRAM_TYPE_2DMAIN,
    { 0x4E2F, 0x4E2A, 0x4E27, 0x4E27, -1u, -1u },
    0x2,
    0x1
};

static const int _020FF50C[] = {
    0x0,
    0x1,
    0x1,
    0x2,
    0x0,
    0x3
};

struct ManagedSprite *sub_02070C24(SpriteSystem *renderer, SpriteManager *gfxHandler, PaletteData *plttData, int x, int y, int trainerClass, int battlerPosition, BOOL isLink, int resTag, enum HeapID heapID) {
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
    spriteResourcesTemplate.drawPriority = _020FF50C[resTag];
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

u32 Pokemon_Size2(void) {
    return sizeof(Pokemon);
}

u32 BoxPokemon_Size(void) {
    return sizeof(BoxPokemon);
}

u8 Pokemon_GetForm(Pokemon *mon) {
    return BoxPokemon_GetForm(&mon->box);
}

u8 BoxPokemon_GetForm(BoxPokemon *boxMon) {
    return BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);
}

BoxPokemon *Pokemon_GetBoxMon(Pokemon *mon) {
    return &mon->box;
}

BOOL Pokemon_TryLevelUp(Pokemon *mon) {
    u16 species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    u8 nextLevel = Pokemon_GetData(mon, MON_DATA_LEVEL, NULL) + 1;
    u32 exp = Pokemon_GetData(mon, MON_DATA_EXPERIENCE, NULL);
    int expRate = Species_GetValue(species, SPECIES_DATA_EXP_RATE);
    u32 maxExp = ExpRate_GetExpAtLevel(expRate, MAX_MON_LEVEL);

    if (exp > maxExp) {
        exp = maxExp;
        Pokemon_SetData(mon, MON_DATA_EXPERIENCE, &exp);
    }
    if (nextLevel > MAX_MON_LEVEL) {
        return FALSE;
    }
    if (exp >= ExpRate_GetExpAtLevel(expRate, nextLevel)) {
        Pokemon_SetData(mon, MON_DATA_LEVEL, &nextLevel);
        return TRUE;
    }
    return FALSE;
}

u16 Pokemon_GetEvolutionTarget(Party *party, Pokemon *mon, u8 context, u16 evoParam, int *methodRet) {
    u16 targetSpecies = SPECIES_NONE;

    u16 species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    u16 heldItem = Pokemon_GetData(mon, MON_DATA_HELD_ITEM, NULL);
    u32 personality = Pokemon_GetData(mon, MON_DATA_PERSONALITY, NULL);
    u8 beauty = Pokemon_GetData(mon, MON_DATA_BEAUTY, NULL);

    int i;
    u16 friendship;
    u16 personalityUpper = (personality & 0xFFFF0000) >> 16;
    u8 holdEffect = GetItemAttr(heldItem, ITEMATTR_HOLD_EFFECT, HEAP_ID_DEFAULT);

    // Kadabra bypasses Everstone because he's just that broken.
    if (species != SPECIES_KADABRA
        && holdEffect == HOLD_EFFECT_NO_EVOLVE
        && context != EVO_CONTEXT_ITEM_USE) {
        return SPECIES_NONE;
    }

    // Spiky-ear Pichu cannot evolve
    if (species == SPECIES_PICHU && Pokemon_GetData(mon, MON_DATA_FORM, 0) == 1) {
        return SPECIES_NONE;
    }

    int stackVar;
    if (methodRet == NULL) {
        methodRet = &stackVar;
    }
    Evolution *evolutions = Heap_Alloc(HEAP_ID_DEFAULT, MAX_MON_EVOLUTIONS * sizeof(Evolution));
    Species_LoadEvolutions(species, evolutions);
    switch (context) {
    case EVO_CONTEXT_LEVEL_UP:
        u8 level = Pokemon_GetData(mon, MON_DATA_LEVEL, NULL);
        friendship = Pokemon_GetData(mon, MON_DATA_FRIENDSHIP, NULL);
        for (i = 0; i < MAX_MON_EVOLUTIONS; i++) {
            switch (evolutions[i].method) {
            case EVO_NONE:
            case EVO_TRADE:
            case EVO_TRADE_HELD_ITEM:
            case EVO_USE_ITEM:
            case EVO_USE_ITEM_MALE:
            case EVO_USE_ITEM_FEMALE:
                break;
            case EVO_LEVEL_FRIENDSHIP:
                if (friendship >= FRIENDSHIP_EVO_THRESHOLD) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_FRIENDSHIP;
                }
                break;
            case EVO_LEVEL_FRIENDSHIP_DAY:
                if (IsNighttime() == FALSE && friendship >= FRIENDSHIP_EVO_THRESHOLD) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_FRIENDSHIP_DAY;
                }
                break;
            case EVO_LEVEL_FRIENDSHIP_NIGHT:
                if (IsNighttime() == TRUE && friendship >= FRIENDSHIP_EVO_THRESHOLD) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_FRIENDSHIP_NIGHT;
                }
                break;
            case EVO_LEVEL:
                if (evolutions[i].param <= level) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL;
                }
                break;
            case EVO_LEVEL_ATK_GT_DEF:
                if (evolutions[i].param <= level && Pokemon_GetData(mon, MON_DATA_ATK, NULL) > Pokemon_GetData(mon, MON_DATA_DEF, NULL)) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_ATK_GT_DEF;
                }
                break;
            case EVO_LEVEL_ATK_EQ_DEF:
                if (evolutions[i].param <= level && Pokemon_GetData(mon, MON_DATA_ATK, NULL) == Pokemon_GetData(mon, MON_DATA_DEF, NULL)) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_ATK_EQ_DEF;
                }
                break;
            case EVO_LEVEL_ATK_LT_DEF:
                if (evolutions[i].param <= level && Pokemon_GetData(mon, MON_DATA_ATK, NULL) < Pokemon_GetData(mon, MON_DATA_DEF, NULL)) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_ATK_LT_DEF;
                }
                break;
            case EVO_LEVEL_PID_LOW:
                if (evolutions[i].param <= level && personalityUpper % 10 < 5) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_PID_LOW;
                }
                break;
            case EVO_LEVEL_PID_HIGH:
                if (evolutions[i].param <= level && personalityUpper % 10 >= 5) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_PID_HIGH;
                }
                break;
            case EVO_LEVEL_NINJASK:
                if (evolutions[i].param <= level) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_NINJASK;
                }
                break;
            case EVO_LEVEL_SHEDINJA:
                *methodRet = EVO_LEVEL_SHEDINJA;
                break;
            case EVO_LEVEL_BEAUTY:
                if (evolutions[i].param <= beauty) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_BEAUTY;
                }
                break;
            case EVO_LEVEL_HELD_ITEM_DAY:
                if (IsNighttime() == FALSE && evolutions[i].param == heldItem) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_HELD_ITEM_DAY;
                }
                break;
            case EVO_LEVEL_HELD_ITEM_NIGHT:
                if (IsNighttime() == TRUE && evolutions[i].param == heldItem) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_HELD_ITEM_NIGHT;
                }
                break;
            case EVO_LEVEL_KNOW_MOVE:
                if (Pokemon_HasMove(mon, evolutions[i].param) == TRUE) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_KNOW_MOVE;
                }
                break;
            case EVO_LEVEL_SPECIES_IN_PARTY:
                if (party != NULL && Party_HasMon(party, evolutions[i].param) == TRUE) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_SPECIES_IN_PARTY;
                }
                break;
            case EVO_LEVEL_MALE:
                if (Pokemon_GetData(mon, MON_DATA_GENDER, NULL) == GENDER_MALE && evolutions[i].param <= level) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_MALE;
                }
                break;
            case EVO_LEVEL_FEMALE:
                if (Pokemon_GetData(mon, MON_DATA_GENDER, NULL) == GENDER_FEMALE && evolutions[i].param <= level) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_FEMALE;
                }
                break;
            case EVO_LEVEL_MAGNETIC_FIELD:
                if (evoParam == evolutions[i].method) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_MAGNETIC_FIELD;
                }
                break;
            case EVO_LEVEL_MOSS_ROCK:
                if (evoParam == evolutions[i].method) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_MOSS_ROCK;
                }
                break;
            case EVO_LEVEL_ICE_ROCK:
                if (evoParam == evolutions[i].method) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_LEVEL_ICE_ROCK;
                }
                break;
            }

            if (targetSpecies != SPECIES_NONE) {
                break;
            }
        }
        break;
    case EVO_CONTEXT_TRADE:
        for (i = 0; i < MAX_MON_EVOLUTIONS; i++) {
            switch (evolutions[i].method) {
            case EVO_TRADE:
                targetSpecies = evolutions[i].target;
                *methodRet = EVO_TRADE;
                break;
            case EVO_TRADE_HELD_ITEM:
                if (heldItem == evolutions[i].param) {
                    targetSpecies = evolutions[i].target;
                    *methodRet = EVO_TRADE_HELD_ITEM;
                }
                break;
            }

            if (targetSpecies != SPECIES_NONE) {
                break;
            }
        }
        break;
    case EVO_CONTEXT_ITEM_CHECK:
    case EVO_CONTEXT_ITEM_USE:
        for (i = 0; i < MAX_MON_EVOLUTIONS; i++) {
            if (evolutions[i].method == EVO_USE_ITEM && evoParam == evolutions[i].param) {
                targetSpecies = evolutions[i].target;
                *methodRet = EVO_NONE;
                break;
            }
            if (evolutions[i].method == EVO_USE_ITEM_MALE
                && Pokemon_GetData(mon, MON_DATA_GENDER, NULL) == GENDER_MALE
                && evoParam == evolutions[i].param) {
                targetSpecies = evolutions[i].target;
                *methodRet = EVO_NONE;
                break;
            }
            if (evolutions[i].method == EVO_USE_ITEM_FEMALE
                && Pokemon_GetData(mon, MON_DATA_GENDER, NULL) == GENDER_FEMALE
                && evoParam == evolutions[i].param) {
                targetSpecies = evolutions[i].target;
                *methodRet = EVO_NONE;
                break;
            }
        }
        break;
    }
    Heap_Free(evolutions);
    return targetSpecies;
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
    case SPECIES_CHANSEY:
    case SPECIES_MR_MIME:
    case SPECIES_SNORLAX:
    case SPECIES_MARILL:
    case SPECIES_SUDOWOODO:
    case SPECIES_WOBBUFFET:
    case SPECIES_MANTINE:
    case SPECIES_ROSELIA:
    case SPECIES_CHIMECHO:
        return species;
    default:
        return ReadFromPersonalPmsNarc(species);
    }
}

void BoxPokemon_SetDefaultMoves(BoxPokemon *boxMon) {
    BOOL reencrypt;
    u16 *levelUpLearnset = Heap_Alloc(HEAP_ID_DEFAULT, MAX_LEARNED_MOVES * sizeof(u16));
    reencrypt = BoxPokemon_DecryptData(boxMon);

    u16 species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    int form = BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);
    u8 level = BoxPokemon_CalcLevel(boxMon);

    Species_LoadLevelUpLearnset(species, form, levelUpLearnset);

    for (int i = 0; levelUpLearnset[i] != LEVEL_UP_LEARNSET_END; i++) {
        if ((levelUpLearnset[i] & LEVEL_UP_LEARNSET_LEVEL_MASK) > (level << LEVEL_UP_LEARNSET_LEVEL_SHIFT)) {
            break;
        }
        u16 move = LEVEL_UP_LEARNSET_MOVE(levelUpLearnset[i]);
        if (BoxPokemon_TryAppendMove(boxMon, move) == MOVE_APPEND_FULL) {
            BoxPokemon_ForceAppendMove(boxMon, move);
        }
    }
    Heap_Free(levelUpLearnset);
    BoxPokemon_EncryptData(boxMon, reencrypt);
}

u32 Pokemon_TryAppendMove(Pokemon *mon, u16 move) {
    return BoxPokemon_TryAppendMove(Pokemon_GetBoxMon(mon), move);
}

u32 BoxPokemon_TryAppendMove(BoxPokemon *boxMon, u16 move) {
    u32 ret = MOVE_APPEND_FULL;
    BOOL reencrypt = BoxPokemon_DecryptData(boxMon);

    for (int i = 0; i < MAX_MON_MOVES; i++) {
        u16 slotMove = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1 + i, NULL);
        if (slotMove == MOVE_NONE) {
            BoxPokemon_SetMoveInSlot(boxMon, move, i);
            ret = move;
            break;
        }
        if (slotMove == move) {
            ret = MOVE_APPEND_KNOWN;
            break;
        }
    }
    BoxPokemon_EncryptData(boxMon, reencrypt);
    return ret;
}

void Pokemon_ForceAppendMove(Pokemon *mon, u16 move) {
    BoxPokemon_ForceAppendMove(Pokemon_GetBoxMon(mon), move);
}

void BoxPokemon_ForceAppendMove(BoxPokemon *boxMon, u16 move) {
    BOOL reencrypt = BoxPokemon_DecryptData(boxMon);
    u16 moves[MAX_MON_MOVES];
    u8 pp[MAX_MON_MOVES];
    u8 ppUp[MAX_MON_MOVES];

    // Bubble move slots 2 through 4 upwards
    for (int i = 0; i < MAX_MON_MOVES - 1; i++) {
        moves[i] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1 + i + 1, NULL);
        pp[i] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_PP + i + 1, NULL);
        ppUp[i] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_PP_UPS + i + 1, NULL);
    }

    moves[MAX_MON_MOVES - 1] = move;
    pp[MAX_MON_MOVES - 1] = GetMoveAttr(move, MOVEATTR_PP);
    ppUp[MAX_MON_MOVES - 1] = 0;

    for (int i = 0; i < MAX_MON_MOVES; i++) {
        BoxPokemon_SetData(boxMon, MON_DATA_MOVE1 + i, &moves[i]);
        BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_PP + i, &pp[i]);
        BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_PP_UPS + i, &ppUp[i]);
    }

    BoxPokemon_EncryptData(boxMon, reencrypt);
}

void Pokemon_SetMoveInSlot_ResetPPUp(Pokemon *mon, u16 move, u8 slot) {
    Pokemon_SetMoveInSlot(mon, move, slot);
    int pp, ppUp = 0;
    Pokemon_SetData(mon, MON_DATA_MOVE1_PP_UPS + slot, &ppUp);
    pp = GetMoveMaxPP(move, 0);
    Pokemon_SetData(mon, MON_DATA_MOVE1_PP + slot, &pp);
}

void Pokemon_SetMoveInSlot(Pokemon *mon, u16 move, u8 slot) {
    BoxPokemon_SetMoveInSlot(&mon->box, move, slot);
}

void BoxPokemon_SetMoveInSlot(BoxPokemon *boxMon, u16 move, u8 slot) {
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1 + slot, &move);

    u8 ppUps = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_PP_UPS + slot, NULL);
    u8 pp = GetMoveMaxPP(move, ppUps);
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_PP + slot, &pp);
}

u32 Pokemon_TryLevelUpMove(Pokemon *mon, int *index, u16 *move) {
    u32 ret = MOVE_NONE;
    u16 *levelUpLearnset = Heap_Alloc(HEAP_ID_DEFAULT, MAX_LEARNED_MOVES * sizeof(u16));
    u16 species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    int form = Pokemon_GetData(mon, MON_DATA_FORM, NULL);
    u8 level = Pokemon_GetData(mon, MON_DATA_LEVEL, NULL);
    Species_LoadLevelUpLearnset(species, form, levelUpLearnset);

    if (levelUpLearnset[*index] == LEVEL_UP_LEARNSET_END) {
        Heap_Free(levelUpLearnset);
        return MOVE_NONE;
    }

    while ((levelUpLearnset[*index] & LEVEL_UP_LEARNSET_LEVEL_MASK) != (level << LEVEL_UP_LEARNSET_LEVEL_SHIFT)) {
        (*index)++;
        if (levelUpLearnset[*index] == LEVEL_UP_LEARNSET_END) {
            Heap_Free(levelUpLearnset);
            return MOVE_NONE;
        }
    }

    if ((levelUpLearnset[*index] & LEVEL_UP_LEARNSET_LEVEL_MASK) == (level << LEVEL_UP_LEARNSET_LEVEL_SHIFT)) {
        *move = LEVEL_UP_LEARNSET_MOVE(levelUpLearnset[*index]);
        (*index)++;
        ret = Pokemon_TryAppendMove(mon, *move);
    }
    Heap_Free(levelUpLearnset);
    return ret;
}

void Pokemon_SwapMoveSlots(Pokemon *mon, int slot1, int slot2) {
    BoxPokemon_SwapMoveSlots(&mon->box, slot1, slot2);
}

void BoxPokemon_SwapMoveSlots(BoxPokemon *boxMon, int slot1, int slot2) {
    u16 moves[2];
    u8 pp[2];
    u8 ppUp[2];

    moves[0] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1 + slot1, NULL);
    pp[0] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_PP + slot1, NULL);
    ppUp[0] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_PP_UPS + slot1, NULL);
    moves[1] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1 + slot2, NULL);
    pp[1] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_PP + slot2, NULL);
    ppUp[1] = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_PP_UPS + slot2, NULL);

    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1 + slot1, &moves[1]);
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_PP + slot1, &pp[1]);
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_PP_UPS + slot1, &ppUp[1]);
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1 + slot2, &moves[0]);
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_PP + slot2, &pp[0]);
    BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_PP_UPS + slot2, &ppUp[0]);
}

void Pokemon_ClearMoveSlot(Pokemon *mon, u32 slot) {
    u16 move;
    u8 pp;
    u8 ppUp;

    for (u32 i = slot; i < MAX_MON_MOVES - 1; i++) {
        move = Pokemon_GetData(mon, MON_DATA_MOVE1 + i + 1, NULL);
        pp = Pokemon_GetData(mon, MON_DATA_MOVE1_PP + i + 1, NULL);
        ppUp = Pokemon_GetData(mon, MON_DATA_MOVE1_PP_UPS + i + 1, NULL);
        Pokemon_SetData(mon, MON_DATA_MOVE1 + i, &move);
        Pokemon_SetData(mon, MON_DATA_MOVE1_PP + i, &pp);
        Pokemon_SetData(mon, MON_DATA_MOVE1_PP_UPS + i, &ppUp);
    }

    move = MOVE_NONE;
    pp = 0;
    ppUp = 0;
    Pokemon_SetData(mon, MON_DATA_MOVE1 + MAX_MON_MOVES - 1, &move);
    Pokemon_SetData(mon, MON_DATA_MOVE1_PP + MAX_MON_MOVES - 1, &pp);
    Pokemon_SetData(mon, MON_DATA_MOVE1_PP_UPS + MAX_MON_MOVES - 1, &ppUp);
}

static BOOL Pokemon_HasMove(Pokemon *mon, u16 move) {
    int i;
    for (i = 0; i < MAX_MON_MOVES; i++) {
        if (Pokemon_GetData(mon, MON_DATA_MOVE1 + i, NULL) == move) {
            break;
        }
    }
    return i != MAX_MON_MOVES;
}

void BoxPokemon_CopyToPokemon(const BoxPokemon *src, Pokemon *dest) {
    u32 zero = 0;

    dest->box = *src;
    if (dest->box.boxDecrypted) {
        dest->box.partyDecrypted = TRUE;
    }
    Pokemon_SetData(dest, MON_DATA_STATUS, &zero);
    Pokemon_SetData(dest, MON_DATA_HP, &zero);
    Pokemon_SetData(dest, MON_DATA_MAX_HP, &zero);

    Mail *mail = Mail_New(HEAP_ID_DEFAULT);
    Pokemon_SetData(dest, MON_DATA_MAIL, mail);
    Heap_Free(mail);

    CAPSULE capsule;
    Pokemon_SetData(dest, MON_DATA_BALL_CAPSULE_ID, &zero);
    MI_CpuClearFast(&capsule, sizeof(capsule));
    Pokemon_SetData(dest, MON_DATA_BALL_CAPSULE, &capsule);

    Pokemon_CalcLevelAndStats(dest);
}

u8 Party_GetMaxLevel(Party *party) {
    int count = Party_GetCount(party);
    u8 ret = 1;

    for (int i = 0; i < count; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);

        if (Pokemon_GetData(mon, MON_DATA_SPECIES, NULL) != SPECIES_NONE
            && !Pokemon_GetData(mon, MON_DATA_IS_EGG, NULL)) {
            u8 level = Pokemon_GetData(mon, MON_DATA_LEVEL, NULL);
            if (level > ret) {
                ret = level;
            }
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
    return AllocAtEndAndReadWholeNarcMemberByIdPair(NARC_poketool_johtozukan, 0, HEAP_ID_3);
}

void Pokemon_Copy(const Pokemon *src, Pokemon *dest) {
    *dest = *src;
}

void BoxPokemon_Copy(const BoxPokemon *src, BoxPokemon *dest) {
    *dest = *src;
}

void Pokemon_CopyToBoxPokemon(const Pokemon *src, BoxPokemon *dest) {
    *dest = src->box;
}

s8 Pokemon_GetFlavorAffinity(Pokemon *mon, int flavor) {
    return BoxPokemon_GetFlavorAffinity(&mon->box, flavor);
}

static s8 BoxPokemon_GetFlavorAffinity(BoxPokemon *boxMon, int flavor) {
    return Personality_GetFlavorAffinity(BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL), flavor);
}

s8 Personality_GetFlavorAffinity(u32 personality, int flavor) {
    return sNatureFlavorAffinities[Personality_GetNature(personality)][flavor];
}

int Species_LoadLearnsetTable(u32 species, u32 form, u16 *dest) {
    int i;
    u16 *levelUpLearnset = Heap_Alloc(HEAP_ID_DEFAULT, MAX_LEARNED_MOVES * sizeof(u16));
    Species_LoadLevelUpLearnset(species, (int)form, levelUpLearnset);
    for (i = 0; levelUpLearnset[i] != LEVEL_UP_LEARNSET_END; i++) {
        dest[i] = LEVEL_UP_LEARNSET_MOVE(levelUpLearnset[i]);
    }
    Heap_Free(levelUpLearnset);
    return i;
}

void Party_GivePokerusAtRandom(Party *party) {
    int count = Party_GetCount(party);
    int slot;
    Pokemon *mon;
    u8 pokerus;
    switch (LCRandom()) {
    case 0x4000:
    case 0x8000:
    case 0xC000:
        do {
            slot = LCRandom() % count;
            mon = Party_GetMonByIndex(party, slot);
        } while (Pokemon_GetData(mon, MON_DATA_SPECIES, NULL) == SPECIES_NONE || Pokemon_GetData(mon, MON_DATA_IS_EGG, NULL));

        if (!Party_MaskHasPokerus(party, (u8)MaskOfFlagNo(slot))) {
            do {
                pokerus = LCRandom();
            } while (!(pokerus & 0x7));
            if (pokerus & 0xf0) {
                pokerus &= 0x7;
            }
            pokerus |= pokerus << 4;
            pokerus &= 0xf3;
            pokerus++;
            Pokemon_SetData(mon, MON_DATA_POKERUS, &pokerus);
        }
    }
}

u8 Party_MaskHasPokerus(Party *party, u8 partyMask) {
    int slot = 0;
    u32 flag = 1;
    u8 ret = 0;
    Pokemon *mon;
    if (partyMask != 0) {
        do {
            if (partyMask & 1) {
                mon = Party_GetMonByIndex(party, slot);
                if (Pokemon_GetData(mon, MON_DATA_POKERUS, NULL)) {
                    ret |= flag;
                }
            }
            slot++;
            flag <<= 1;
            partyMask >>= 1;
        } while (partyMask != 0);
    } else {
        mon = Party_GetMonByIndex(party, slot);
        if (Pokemon_GetData(mon, MON_DATA_POKERUS, NULL)) {
            ret++;
        }
    }
    return ret;
}

void Party_UpdatePokerus(Party *party, int daysPassed) {
    int count = Party_GetCount(party);
    for (int i = 0; i < count; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);
        if (Pokemon_GetData(mon, MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
            u8 pokerus = Pokemon_GetData(mon, MON_DATA_POKERUS, NULL);
            if (pokerus & 0xf) {
                if ((pokerus & 0xf) < daysPassed || daysPassed > 4) {
                    pokerus &= 0xf0;
                } else {
                    pokerus -= daysPassed;
                }

                if (pokerus == 0) {
                    pokerus = 0x10; // immune
                }
                Pokemon_SetData(mon, MON_DATA_POKERUS, &pokerus);
            }
        }
    }
}

void Party_SpreadPokerus(Party *party) {
    int count = Party_GetCount(party);
    if ((LCRandom() % 3) == 0) {
        for (int i = 0; i < count; i++) {
            Pokemon *mon = Party_GetMonByIndex(party, i);
            if (Pokemon_GetData(mon, MON_DATA_SPECIES, NULL) != SPECIES_NONE) {
                u8 pokerus = Pokemon_GetData(mon, MON_DATA_POKERUS, NULL);
                if (pokerus & 0xf) {
                    if (i != 0) {
                        mon = Party_GetMonByIndex(party, i - 1);
                        if (!(Pokemon_GetData(mon, MON_DATA_POKERUS, NULL) & 0xf0)) {
                            Pokemon_SetData(mon, MON_DATA_POKERUS, &pokerus);
                        }
                    }

                    if (i < count - 1) {
                        mon = Party_GetMonByIndex(party, i + 1);
                        if (!(Pokemon_GetData(mon, MON_DATA_POKERUS, NULL) & 0xf0)) {
                            Pokemon_SetData(mon, MON_DATA_POKERUS, &pokerus);
                            i++; // don't infect the rest of the party
                        }
                    }
                }
            }
        }
    }
}

BOOL Pokemon_HasPokerus(Pokemon *mon) {
    return BoxPokemon_HasPokerus(&mon->box);
}

BOOL BoxPokemon_HasPokerus(BoxPokemon *boxMon) {
    return (BoxPokemon_GetData(boxMon, MON_DATA_POKERUS, NULL) & 0xf) != 0;
}

BOOL Pokemon_IsImmuneToPokerus(Pokemon *mon) {
    return BoxPokemon_IsImmuneToPokerus(&mon->box);
}

BOOL BoxPokemon_IsImmuneToPokerus(BoxPokemon *boxMon) {
    u8 pokerus = BoxPokemon_GetData(boxMon, MON_DATA_POKERUS, NULL);
    if (pokerus & 0xF) {
        return FALSE;
    }
    if (pokerus & 0xF0) {
        return TRUE;
    }
    return FALSE;
}

void Pokemon_UpdateArceusForm(Pokemon *mon) {
    BoxPokemon_UpdateArceusForm(&mon->box);
}

void BoxPokemon_UpdateArceusForm(BoxPokemon *boxMon) {
    u32 species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    u32 ability = BoxPokemon_GetData(boxMon, MON_DATA_ABILITY, NULL);
    u32 heldItem = BoxPokemon_GetData(boxMon, MON_DATA_HELD_ITEM, NULL);
    if (species == SPECIES_ARCEUS && ability == ABILITY_MULTITYPE) {
        u32 form = HoldEffect_GetArceusType(GetItemAttr(heldItem, ITEMATTR_HOLD_EFFECT, HEAP_ID_DEFAULT));
        BoxPokemon_SetData(boxMon, MON_DATA_FORM, &form);
    }
}

u32 HoldEffect_GetArceusType(u16 holdEffect) {
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

s32 Pokemon_UpdateGiratinaForm(Pokemon *mon) {
    s32 ret = BoxPokemon_UpdateGiratinaForm(&mon->box);
    if (ret != -1) {
        Pokemon_CalcLevelAndStats(mon);
    }
    return ret;
}

s32 BoxPokemon_UpdateGiratinaForm(BoxPokemon *boxMon) {
    int species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    int item = BoxPokemon_GetData(boxMon, MON_DATA_HELD_ITEM, NULL);
    if (species == SPECIES_GIRATINA) {
    	int form;
        if (item == ITEM_GRISEOUS_ORB) {
            form = GIRATINA_FORM_ORIGIN;
        } else {
            form = GIRATINA_FORM_ALTERED;
        }
        BoxPokemon_SetData(boxMon, MON_DATA_FORM, &form);
        BoxPokemon_UpdateAbility(boxMon);
        return form;
    }
    return -1;
}

void Pokemon_ForceSetGiratinaOriginForm(Pokemon *mon) {
    s32 form = GIRATINA_FORM_ORIGIN;
    if (Pokemon_GetData(mon, MON_DATA_SPECIES, NULL) == SPECIES_GIRATINA) {
        BoxPokemon_SetData(&mon->box, MON_DATA_FORM, &form);
        BoxPokemon_UpdateAbility(&mon->box);
        Pokemon_CalcLevelAndStats(mon);
    }
}

void Party_UpdateGiratinaForms(Party *party, BOOL forceOrigin) {
    int count = Party_GetCount(party);
    for (int i = 0; i < count; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);
        if (forceOrigin) {
            Pokemon_ForceSetGiratinaOriginForm(mon);
        } else {
            Pokemon_UpdateGiratinaForm(mon);
        }
    }
}

void Pokemon_UpdateShayminForm(Pokemon *mon, int form) {
    BoxPokemon_UpdateShayminForm(&mon->box, form);
    Pokemon_CalcLevelAndStats(mon);
}

void BoxPokemon_UpdateShayminForm(BoxPokemon *boxMon, int form) {
    if (BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL) == SPECIES_SHAYMIN) {
        GF_ASSERT(form <= SHAYMIN_FORM_COUNT - 1);
        BoxPokemon_SetData(boxMon, MON_DATA_FORM, &form);
        BoxPokemon_UpdateAbility(boxMon);
    }
}

BOOL Pokemon_CanShayminSkyForm(Pokemon *mon) {
    u32 species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    u32 form = Pokemon_GetData(mon, MON_DATA_FORM, NULL);
    u32 status = Pokemon_GetData(mon, MON_DATA_STATUS, NULL);
    u32 hp = Pokemon_GetData(mon, MON_DATA_HP, NULL);
    BOOL fatefulEncounter = Pokemon_GetData(mon, MON_DATA_FATEFUL_ENCOUNTER, NULL);

    RTCTime time;
    GF_RTC_CopyTime(&time);

    if (species == SPECIES_SHAYMIN
        && form == SHAYMIN_FORM_LAND
        && hp > 0
        && fatefulEncounter == TRUE
        && !(status & MON_STATUS_FRZ_MASK)
        && time.hour >= 4
        && time.hour < 20) {
        return TRUE;
    } else {
        return FALSE;
    }
}

void Party_SetShayminLandForms(Party *party) {
    int count = Party_GetCount(party);
    for (int i = 0; i < count; i++) {
        Pokemon *mon = Party_GetMonByIndex(party, i);
        int species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
        int form = Pokemon_GetData(mon, MON_DATA_FORM, NULL);
        if (species == SPECIES_SHAYMIN && form == SHAYMIN_FORM_SKY) {
            Pokemon_UpdateShayminForm(mon, SHAYMIN_FORM_LAND);
        }
    }
}

BOOL Party_UpdateShayminForms(Party *party, int minutesDiff, const RTCTime *time) {
    s32 hour, minutes;
    if (time->hour >= 20 || time->hour < 4) {
        hour = time->hour;
        if (hour < 4) {
            hour += 24;
        }
        minutes = time->minute + 60 * (hour - 20);
        if (minutes < minutesDiff + 1) {
            Party_SetShayminLandForms(party);
            return TRUE;
        }
        return FALSE;
    } else {
        minutes = time->minute + (time->hour - 4) * 60;
        if (minutes < minutesDiff) {
            Party_SetShayminLandForms(party);
            return TRUE;
        }
        return FALSE;
    }
}

BOOL Pokemon_UpdateRotomForm(Pokemon *mon, int form, int moveSlot) {
    static const u16 rotomFormMoves[ROTOM_FORM_COUNT] = {
        [ROTOM_FORM_BASE] = MOVE_NONE,
        [ROTOM_FORM_HEAT] = MOVE_OVERHEAT,
        [ROTOM_FORM_WASH] = MOVE_HYDRO_PUMP,
        [ROTOM_FORM_FROST] = MOVE_BLIZZARD,
        [ROTOM_FORM_FAN] = MOVE_AIR_SLASH,
        [ROTOM_FORM_MOW] = MOVE_LEAF_STORM,
    };

    if (Pokemon_GetData(mon, MON_DATA_SPECIES, NULL) != SPECIES_ROTOM) {
        return FALSE;
    }

    // Unused call
    Pokemon_GetData(mon, MON_DATA_FORM, NULL);

    int newMove = rotomFormMoves[form];
    int i, j;
    for (i = 0; i < MAX_MON_MOVES; i++) {
        int curMove = Pokemon_GetData(mon, MON_DATA_MOVE1 + i, NULL);
        for (j = ROTOM_FORM_HEAT; j < NELEMS(rotomFormMoves); j++) {
            if (curMove != MOVE_NONE && curMove == rotomFormMoves[j]) {
                if (newMove != MOVE_NONE) {
                    Pokemon_SetMoveInSlot_ResetPPUp(mon, newMove, i);
                    newMove = MOVE_NONE;
                } else {
                    Pokemon_ClearMoveSlot(mon, i);
                    i--;
                }
                break;
            }
        }
    }

    if (newMove != MOVE_NONE) {
        for (i = 0; i < MAX_MON_MOVES; i++) {
            if (Pokemon_GetData(mon, MON_DATA_MOVE1 + i, NULL) == MOVE_NONE) {
                Pokemon_SetMoveInSlot_ResetPPUp(mon, newMove, i);
                break;
            }
        }

        if (i == MAX_MON_MOVES) {
            Pokemon_SetMoveInSlot_ResetPPUp(mon, newMove, moveSlot);
        }
    }

    if (Pokemon_GetData(mon, MON_DATA_MOVE1, NULL) == MOVE_NONE) {
        Pokemon_SetMoveInSlot_ResetPPUp(mon, MOVE_THUNDER_SHOCK, 0);
    }
    Pokemon_SetData(mon, MON_DATA_FORM, &form);
    Pokemon_UpdateAbility(mon);
    Pokemon_CalcLevelAndStats(mon);
    return TRUE;
}

void Species_LoadLevelUpLearnset(int species, int form, u16 *levelUpLearnset) {
    ReadWholeNarcMemberByIdPair(levelUpLearnset, NARC_poketool_personal_wotbl, Species_GetFormNarcIndex(species, form));
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

void sub_020720FC(Pokemon *mon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, enum HeapID heapID) {
    u32 hp;
    sub_0207213C(&mon->box, a1, pokeball, a3, encounterType, heapID);
    if (pokeball == ITEM_HEAL_BALL) {
        hp = Pokemon_GetData(mon, MON_DATA_MAX_HP, NULL);
        Pokemon_SetData(mon, MON_DATA_HP, &hp);
        hp = 0;
        Pokemon_SetData(mon, MON_DATA_STATUS, &hp);
    }
}

void sub_0207213C(BoxPokemon *boxMon, PlayerProfile *playerProfile, u32 pokeball, u32 a3, u32 encounterType, enum HeapID heapID) {
    BoxMonSetTrainerMemo(boxMon, playerProfile, 0, a3, heapID);
    BoxPokemon_SetData(boxMon, MON_DATA_MET_GAME, (void *)&gGameVersion);
    BoxPokemon_SetData(boxMon, MON_DATA_POKEBALL, &pokeball);
    BoxPokemon_SetData(boxMon, MON_DATA_MET_TERRAIN, &encounterType);
}

void sub_0207217C(Pokemon *mon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, enum HeapID heapID) {
    sub_02072190(&mon->box, a1, pokeball, a3, encounterType, heapID);
}

void sub_02072190(BoxPokemon *boxMon, PlayerProfile *a1, u32 pokeball, u32 a3, u32 encounterType, enum HeapID heapID) {
    sub_0207213C(boxMon, a1, pokeball, a3, encounterType, heapID);
}

static const u16 sHeldItemOdds[][2] = {
    { 45, 95 }, // Without CompoundEyes (itemRates == 0) 45% no item, 50% common item, 5% rare item
    { 20, 80 }, // With CompoundEyes (itemRates == 1) 20% no item, 60% common item, 20% rare item
};

void Pokemon_GiveWildHeldItem(Pokemon *mon, u32 battleType, u32 itemRates) {
    if (battleType & (BATTLE_TYPE_TRAINER | BATTLE_TYPE_FRONTIER)) {
        return;
    }

    u32 rand = LCRandom() % 100;
    u16 species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    u16 form = Pokemon_GetData(mon, MON_DATA_FORM, NULL);
    u16 item1 = Species_GetFormValue(species, form, SPECIES_DATA_HELD_ITEM_COMMON);
    u16 item2 = Species_GetFormValue(species, form, SPECIES_DATA_HELD_ITEM_RARE);

    if (item1 == item2 && item1 != ITEM_NONE) {
        Pokemon_SetData(mon, MON_DATA_HELD_ITEM, &item1);
        return;
    }

    if (rand < sHeldItemOdds[itemRates][0]) {
        return;
    } else if (rand < sHeldItemOdds[itemRates][1]) {
        Pokemon_SetData(mon, MON_DATA_HELD_ITEM, &item1);
    } else {
        Pokemon_SetData(mon, MON_DATA_HELD_ITEM, &item2);
    }
}

BOOL Pokemon_CanLearnTMHM(Pokemon *mon, u8 tmHM) {
    return BoxPokemon_CanLearnTMHM(&mon->box, tmHM);
}

BOOL BoxPokemon_CanLearnTMHM(BoxPokemon *boxMon, u8 tmHM) {
    u16 species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES_OR_EGG, NULL);
    int form = BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);

    return Species_CanLearnTMHM(species, form, tmHM);
}

BOOL Species_CanLearnTMHM(u16 species, u32 form, u8 tmHM) {
    if (species == SPECIES_EGG) {
        return FALSE;
    }

    u32 mask;
    int param;
    if (tmHM < 32) {
        mask = (1 << tmHM);
        param = SPECIES_DATA_TM_LEARNSET_MASK_1;
    } else if (tmHM < 64) {
        mask = (1 << (tmHM - 32));
        param = SPECIES_DATA_TM_LEARNSET_MASK_2;
    } else if (tmHM < 96) {
        mask = (1 << (tmHM - 64));
        param = SPECIES_DATA_TM_LEARNSET_MASK_3;
    } else {
        mask = (1 << (tmHM - 96));
        param = SPECIES_DATA_TM_LEARNSET_MASK_4;
    }

    return (Species_GetFormValue(species, form, param) & mask) != 0;
}

void Pokemon_UpdateAbility(Pokemon *mon) {
    BoxPokemon_UpdateAbility(&mon->box);
}

void BoxPokemon_UpdateAbility(BoxPokemon *boxMon) {
    BOOL reencrypt = BoxPokemon_DecryptData(boxMon);
    int species = BoxPokemon_GetData(boxMon, MON_DATA_SPECIES, NULL);
    int personality = BoxPokemon_GetData(boxMon, MON_DATA_PERSONALITY, NULL);
    int form = BoxPokemon_GetData(boxMon, MON_DATA_FORM, NULL);
    int ability1 = Species_GetFormValue(species, form, SPECIES_DATA_ABILITY_1);
    int ability2 = Species_GetFormValue(species, form, SPECIES_DATA_ABILITY_2);

    if (ability2 != ABILITY_NONE) {
        if (personality & 1) {
            BoxPokemon_SetData(boxMon, MON_DATA_ABILITY, &ability2);
        } else {
            BoxPokemon_SetData(boxMon, MON_DATA_ABILITY, &ability1);
        }
    } else {
        BoxPokemon_SetData(boxMon, MON_DATA_ABILITY, &ability1);
    }
    BoxPokemon_EncryptData(boxMon, reencrypt);
}

void Pokemon_SetPersonality(Pokemon *mon, u32 personality) {
    Pokemon *tmpMon = Pokemon_New(HEAP_ID_DEFAULT);
    Pokemon_Copy(mon, tmpMon);

    PokemonDataBlockA *tmpBlockA = BoxPokemon_GetDataBlock(&tmpMon->box, mon->box.personality, DATA_BLOCK_A);
    PokemonDataBlockB *tmpBlockB = BoxPokemon_GetDataBlock(&tmpMon->box, mon->box.personality, DATA_BLOCK_B);
    PokemonDataBlockC *tmpBlockC = BoxPokemon_GetDataBlock(&tmpMon->box, mon->box.personality, DATA_BLOCK_C);
    PokemonDataBlockD *tmpBlockD = BoxPokemon_GetDataBlock(&tmpMon->box, mon->box.personality, DATA_BLOCK_D);
    PokemonDataBlockA *blockA = BoxPokemon_GetDataBlock(&mon->box, personality, DATA_BLOCK_A);
    PokemonDataBlockB *blockB = BoxPokemon_GetDataBlock(&mon->box, personality, DATA_BLOCK_B);
    PokemonDataBlockC *blockC = BoxPokemon_GetDataBlock(&mon->box, personality, DATA_BLOCK_C);
    PokemonDataBlockD *blockD = BoxPokemon_GetDataBlock(&mon->box, personality, DATA_BLOCK_D);

    DECRYPT_BOX(&tmpMon->box);
    DECRYPT_PARTY(mon);
    DECRYPT_BOX(&mon->box);

    mon->box.personality = personality;

    *blockA = *tmpBlockA;
    *blockB = *tmpBlockB;
    *blockC = *tmpBlockC;
    *blockD = *tmpBlockD;

    mon->box.checksum = CHECKSUM(&mon->box);
    ENCRYPT_BOX(&mon->box);
    ENCRYPT_PARTY(mon);
    Heap_Free(tmpMon);
}

u32 Personality_ChangeNatureGenderAbility(u32 personality, u16 species, u8 nature, u8 gender, u8 ability, BOOL gen_mode) {
    // u32 personality is a random seed to convolve into a personality that bears the
    // requested nature, gender, and ability. This is used to make
    // pokemon caught on the Pokewalker, and the Spiky-Eared Pichu.
    // In both actual use cases, u32 personality is OTID, which means r4 and r1
    // are always SID ^ TID.
    GF_ASSERT(ability < 2);
    GF_ASSERT(gender != 0xFF);
    if (gen_mode) {
        u32 r4 = ((personality & 0xFFFF0000) >> 16) ^ (u16)personality;
        personality = Personality_CreateFromGenderAndNature(species, gender, nature);
        if ((personality & 1) != ability) {
            // Force correct ability for gender and nature personality
            personality++;
        }
        personality |= ((u16)personality ^ r4) << 16;
    } else {
        u32 r1;
        u8 ratio = Species_GetValue(species, SPECIES_DATA_GENDER_RATIO);
        GF_ASSERT((nature & 1) == ability);
        r1 = ((personality & 0xFFFF0000) >> 16) ^ (u16)personality;
        personality = (0xFF00 ^ (r1 & 0xFF00)) << 16;
        // Force the personality to have the requested nature
        personality += nature - (personality % 25);
        // Maintaining that personality%25 is nature, and personality&1 is ability,
        // ensure personality&0xFF compared to the gender ratio yields gender
        switch (ratio) {
        case GENDER_RATIO_MALE_ONLY:
        case GENDER_RATIO_FEMALE_ONLY:
        case GENDER_RATIO_UNKNOWN:
            break;
        default:
            if (gender == GENDER_MALE) {
                if (ratio > (u8)personality) {
                    // personality is female; force personality to become male
                    personality += 25 * ((ratio - (u8)personality) / 25u + 1);
                    if ((personality & 1) != ability) {
                        GF_ASSERT((u8)personality <= 230);
                        personality += 25;
                    }
                }
            } else {
                if (ratio < (u8)personality) {
                    // personality is male; force personality to become female
                    personality -= 25 * (((u8)personality - ratio) / 25u + 1);
                    if ((personality & 1) != ability) {
                        GF_ASSERT((u8)personality >= 25);
                        personality -= 25;
                    }
                }
            }
            break;
        }
    }
    return personality;
}

void SpeciesData_LoadSpecies(int species, SpeciesData *speciesData) {
    ReadWholeNarcMemberByIdPair(speciesData, NARC_poketool_personal_personal, species);
}

void SpeciesData_LoadForm(int species, int form, SpeciesData *speciesData) {
    ReadWholeNarcMemberByIdPair(speciesData, NARC_poketool_personal_personal, Species_GetFormNarcIndex(species, form));
}

void Species_LoadEvolutions(u16 species, Evolution *dest) {
    ReadWholeNarcMemberByIdPair(dest, NARC_poketool_personal_evo, species);
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

#define SUBSTRUCT_CASE(v1, v2, v3, v4) \
    { (v1 << 5), (v2 << 5), (v3 << 5), (v4 << 5) }

static const u8 substructOffsets[32][4] = {
    [0] = SUBSTRUCT_CASE(0, 1, 2, 3),
    [1] = SUBSTRUCT_CASE(0, 1, 3, 2),
    [2] = SUBSTRUCT_CASE(0, 2, 1, 3),
    [3] = SUBSTRUCT_CASE(0, 3, 1, 2),
    [4] = SUBSTRUCT_CASE(0, 2, 3, 1),
    [5] = SUBSTRUCT_CASE(0, 3, 2, 1),
    [6] = SUBSTRUCT_CASE(1, 0, 2, 3),
    [7] = SUBSTRUCT_CASE(1, 0, 3, 2),
    [8] = SUBSTRUCT_CASE(2, 0, 1, 3),
    [9] = SUBSTRUCT_CASE(3, 0, 1, 2),
    [10] = SUBSTRUCT_CASE(2, 0, 3, 1),
    [11] = SUBSTRUCT_CASE(3, 0, 2, 1),
    [12] = SUBSTRUCT_CASE(1, 2, 0, 3),
    [13] = SUBSTRUCT_CASE(1, 3, 0, 2),
    [14] = SUBSTRUCT_CASE(2, 1, 0, 3),
    [15] = SUBSTRUCT_CASE(3, 1, 0, 2),
    [16] = SUBSTRUCT_CASE(2, 3, 0, 1),
    [17] = SUBSTRUCT_CASE(3, 2, 0, 1),
    [18] = SUBSTRUCT_CASE(1, 2, 3, 0),
    [19] = SUBSTRUCT_CASE(1, 3, 2, 0),
    [20] = SUBSTRUCT_CASE(2, 1, 3, 0),
    [21] = SUBSTRUCT_CASE(3, 1, 2, 0),
    [22] = SUBSTRUCT_CASE(2, 3, 1, 0),
    [23] = SUBSTRUCT_CASE(3, 2, 1, 0),
    [24] = SUBSTRUCT_CASE(0, 1, 2, 3),
    [25] = SUBSTRUCT_CASE(0, 1, 3, 2),
    [26] = SUBSTRUCT_CASE(0, 2, 1, 3),
    [27] = SUBSTRUCT_CASE(0, 3, 1, 2),
    [28] = SUBSTRUCT_CASE(0, 2, 3, 1),
    [29] = SUBSTRUCT_CASE(0, 3, 2, 1),
    [30] = SUBSTRUCT_CASE(1, 0, 2, 3),
    [31] = SUBSTRUCT_CASE(1, 0, 3, 2),
};

static void *BoxPokemon_GetDataBlock(BoxPokemon *boxMon, u32 personality, u8 dataBlockID) {
    personality = (personality & 0x3e000) >> 13;
    GF_ASSERT(dataBlockID <= DATA_BLOCK_D);
    return ((char *)boxMon->dataBlocks + substructOffsets[personality][dataBlockID]);
}

int Species_GetFormNarcIndex(int species, int form) {
    switch (species) {
    case SPECIES_DEOXYS:
        if (form != DEOXYS_FORM_NORMAL && form <= DEOXYS_FORM_COUNT - 1) {
            return SPECIES_DEOXYS_ATK + form - DEOXYS_FORM_ATTACK;
        }
        break;
    case SPECIES_WORMADAM:
        if (form != WORMADAM_FORM_PLANT && form <= WORMADAM_FORM_COUNT - 1) {
            return SPECIES_WORMADAM_SANDY + form - WORMADAM_FORM_SANDY;
        }
        break;
    case SPECIES_GIRATINA:
        if (form != GIRATINA_FORM_ALTERED && form <= GIRATINA_FORM_COUNT - 1) {
            return SPECIES_GIRATINA_ORIGIN + form - GIRATINA_FORM_ORIGIN;
        }
        break;
    case SPECIES_SHAYMIN:
        if (form != SHAYMIN_FORM_LAND && form <= SHAYMIN_FORM_COUNT - 1) {
            return SPECIES_SHAYMIN_SKY + form - SHAYMIN_FORM_SKY;
        }
        break;
    case SPECIES_ROTOM:
        if (form != ROTOM_FORM_BASE && form <= ROTOM_FORM_COUNT - 1) {
            return SPECIES_ROTOM_HEAT + form - ROTOM_FORM_HEAT;
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

static const u16 sBattleFrontierBanlist[BATTLE_FRONTIER_BANLIST_SIZE] = {
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

BOOL Species_IsBattleFrontierBanned(u16 species, u16 form) {
    for (u32 i = 0; i < BATTLE_FRONTIER_BANLIST_SIZE; i++) {
        if (species == sBattleFrontierBanlist[i]) {
            return TRUE;
        }
    }
    if (species == SPECIES_PICHU && form == PICHU_SPIKY_EAR) {
        return TRUE;
    }
    return FALSE;
}

u16 BattleFrontier_GetBanlistEntry(u32 index) {
    if (index >= BATTLE_FRONTIER_BANLIST_SIZE) {
        index = 0;
    }
    return sBattleFrontierBanlist[index];
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

BOOL Species_IsMythical(u16 species) {
    int i;
    for (i = 0; i < NELEMS(sMythicalMonsList); i++) {
        if (species == sMythicalMonsList[i]) {
            return TRUE;
        }
    }
    return FALSE;
}

BOOL Pokemon_IsBattleFrontierBanned(Pokemon *mon) {
    u16 species = Pokemon_GetData(mon, MON_DATA_SPECIES, NULL);
    u16 form = Pokemon_GetData(mon, MON_DATA_FORM, NULL);
    return Species_IsBattleFrontierBanned(species, form);
}

BOOL BoxPokemon_BelongsToPlayer(BoxPokemon *boxMon, PlayerProfile *player, enum HeapID heapID) {
    u32 playerID = PlayerProfile_GetTrainerID(player);
    u32 otID = BoxPokemon_GetData(boxMon, MON_DATA_OT_ID, NULL);
    u32 playerGender = PlayerProfile_GetTrainerGender(player);
    u32 otGender = BoxPokemon_GetData(boxMon, MON_DATA_OT_GENDER, NULL);
    String *playerName = PlayerProfile_GetPlayerName_NewString(player, heapID);
    String *otName = String_New(PLAYER_NAME_LENGTH + 1, heapID);
    BOOL ret = FALSE;
    BoxPokemon_GetData(boxMon, MON_DATA_OT_NAME_STRING, otName);
    if (playerID == otID && playerGender == otGender && String_Compare(playerName, otName) == 0) {
        ret = TRUE;
    }
    String_Delete(otName);
    String_Delete(playerName);
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
    CAPSULE sp1;
    MI_CpuClearFast(&sp1, sizeof(sp1));
    Pokemon_SetData(mon, MON_DATA_BALL_CAPSULE_ID, &sp0);
    Pokemon_SetData(mon, MON_DATA_BALL_CAPSULE, &sp1);
}

void BoxPokemon_RestorePP(BoxPokemon *boxMon) {
    BOOL reencrypt = BoxPokemon_DecryptData(boxMon);
    for (int i = 0; i < MAX_MON_MOVES; i++) {
        if (BoxPokemon_GetData(boxMon, MON_DATA_MOVE1 + i, NULL) != MOVE_NONE) {
            u8 pp = BoxPokemon_GetData(boxMon, MON_DATA_MOVE1_MAX_PP + i, NULL);
            BoxPokemon_SetData(boxMon, MON_DATA_MOVE1_PP + i, &pp);
        }
    }
    BoxPokemon_EncryptData(boxMon, reencrypt);
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

BOOL SetTrMonCapsule(int a0, Pokemon *mon, enum HeapID heapID) {
    CAPSULE capsule;
    int data;
    NARC *narc;
    if (a0 == 0) {
        return FALSE;
    }
    narc = NARC_New(NARC_application_custom_ball_edit_gs_cb_data, heapID);
    data = 1;
    NARC_ReadFromMember(narc, 0, (a0 - 1) * sizeof(CAPSULE), sizeof(CAPSULE), &capsule);
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

    if (!mon->box.partyDecrypted) {
        DECRYPT_PARTY(mon);
        DECRYPT_BOX(&mon->box);
    }
    boxMon = Pokemon_GetBoxMon(mon);
    dbA = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_A);
    dbB = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_B);
    dbC = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_C);
    dbD = BoxPokemon_GetDataBlock(boxMon, boxMon->personality, DATA_BLOCK_D);

    dest->personality = boxMon->personality;
    dest->partyDecrypted = FALSE;
    dest->boxDecrypted = FALSE;
    dest->checksumFailed = boxMon->checksumFailed;

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
        dest->moveCurrentPPs[i] = dbB->moveCurrentPPs[i];
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
        dest->otName[i] = dbD->otName[i];
    }
    dest->pokeball = dbD->pokeball;

    dest->status = mon->party.status;
    dest->level = mon->party.level;
    dest->ballCapsuleID = mon->party.ballCapsuleID;
    dest->hp = mon->party.hp;
    dest->maxHP = mon->party.maxHP;
    dest->atk = mon->party.attack;
    dest->def = mon->party.defense;
    dest->speed = mon->party.speed;
    dest->spatk = mon->party.spAtk;
    dest->spdef = mon->party.spDef;

    if (!mon->box.partyDecrypted) {
        ENCRYPT_PARTY(mon);
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
    boxMon = Pokemon_GetBoxMon(mon);
    dbA = BoxPokemon_GetDataBlock(boxMon, src->personality, DATA_BLOCK_A);
    dbB = BoxPokemon_GetDataBlock(boxMon, src->personality, DATA_BLOCK_B);
    dbC = BoxPokemon_GetDataBlock(boxMon, src->personality, DATA_BLOCK_C);
    dbD = BoxPokemon_GetDataBlock(boxMon, src->personality, DATA_BLOCK_D);

    boxMon->personality = src->personality;
    boxMon->partyDecrypted = FALSE;
    boxMon->boxDecrypted = FALSE;
    boxMon->checksumFailed = src->checksumFailed;

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
        dbB->moveCurrentPPs[i] = src->moveCurrentPPs[i];
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
        dbD->otName[i] = src->otName[i];
    }
    dbD->HGSS_Pokeball = src->pokeball;
    if (src->pokeball <= BALL_CHERISH) {
        dbD->pokeball = src->pokeball;
    } else {
        dbD->pokeball = BALL_POKE;
    }

    mon->party.status = src->status;
    mon->party.level = src->level;
    mon->party.ballCapsuleID = src->ballCapsuleID;
    mon->party.hp = src->hp;
    mon->party.maxHP = src->maxHP;
    mon->party.attack = src->atk;
    mon->party.defense = src->def;
    mon->party.speed = src->speed;
    mon->party.spAtk = src->spatk;
    mon->party.spDef = src->spdef;

    ENCRYPT_PARTY(mon);
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

static const s8 sPokeathlonPerformanceNatureMods[NATURE_COUNT][5] = {
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
    nature = BoxPokemon_GetNature(boxMon);
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
    CalcBoxMonPokeathlonPerformance(Pokemon_GetBoxMon(mon), dest);
}

void CalcBoxmonPokeathlonStars(struct PokeathlonPerformanceStars *dest, BoxPokemon *boxMon, const s8 *aprijuice, enum HeapID heapID) {
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

void CalcMonPokeathlonStars(struct PokeathlonPerformanceStars *dest, Pokemon *mon, const s8 *aprijuice, enum HeapID heapID) {
    CalcBoxmonPokeathlonStars(dest, Pokemon_GetBoxMon(mon), aprijuice, heapID);
}
