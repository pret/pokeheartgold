#include "scrcmd.h"
#include "mart.h"
#include "event_data.h"
#include "pokedex.h"
#include "unk_02031904.h"
#include "constants/items.h"
#include "constants/decorations.h"
#include "constants/seals.h"

struct BadgeMartItems {
    u16 item_id;
    u16 tier;
};

const struct BadgeMartItems _020FBF22[] = {
    { ITEM_POKE_BALL,    1 },
    { ITEM_GREAT_BALL,   3 },
    { ITEM_ULTRA_BALL,   4 },
    { ITEM_POTION,       1 },
    { ITEM_SUPER_POTION, 2 },
    { ITEM_HYPER_POTION, 4 },
    { ITEM_MAX_POTION,   5 },
    { ITEM_FULL_RESTORE, 6 },
    { ITEM_REVIVE,       3 },
    { ITEM_ANTIDOTE,     1 },
    { ITEM_PARLYZ_HEAL,  1 },
    { ITEM_AWAKENING,    2 },
    { ITEM_BURN_HEAL,    2 },
    { ITEM_ICE_HEAL,     2 },
    { ITEM_FULL_HEAL,    4 },
    { ITEM_ESCAPE_ROPE,  2 },
    { ITEM_REPEL,        2 },
    { ITEM_SUPER_REPEL,  3 },
    { ITEM_MAX_REPEL,    4 },
};

BOOL ScrCmd_MartBuy(ScriptContext *ctx) {
    u16 unused;
    u8 badge_count;
    u8 i;
    u8 tier;
    u8 nitems;
    u16 items[64];

    unused = ScriptGetVar(ctx);

    nitems = 0;
    badge_count = 0;
    for (i = 0; i < 16; i++) {
        if (PlayerProfile_TestBadgeFlag(Save_PlayerData_GetProfileAddr(ctx->fieldSystem->saveData), i) == TRUE) {
            badge_count++;
        }
    }
    switch (badge_count) {
    case 0:
        tier = 1;
        break;
    case 1:
    case 2:
        tier = 2;
        break;
    case 3:
    case 4:
        tier = 3;
        break;
    case 5:
    case 6:
        tier = 4;
        break;
    case 7:
        tier = 5;
        break;
    case 8:
        tier = 6;
        break;
    default:
        tier = 6;
        break;
    }
    for (i = 0; i < NELEMS(_020FBF22); i++) {
        if (tier >= _020FBF22[i].tier) {
            items[nitems] = _020FBF22[i].item_id;
            nitems++;
        }
    }
    items[nitems] = 0xFFFF;
    InitMartUI(ctx->taskman, ctx->fieldSystem, items, 0, 0, 0, 0);
    return TRUE;
}

BOOL ScrCmd_MartSell(ScriptContext *ctx) {
    u16 dummy[1];

    dummy[0] = 0xFFFF;
    InitMartUI(ctx->taskman, ctx->fieldSystem, dummy, 0, 1, 0, 0);
    return TRUE;
}

const u16 _020FBA54[] = {ITEM_AIR_MAIL, ITEM_HEAL_BALL, 0xFFFF};
const u16 _020FBA78[] = {ITEM_TUNNEL_MAIL, ITEM_HEAL_BALL, ITEM_NET_BALL, 0xFFFF};
const u16 _020FBAB0[] = {ITEM_BLOOM_MAIL, ITEM_HEAL_BALL, ITEM_NET_BALL, 0xFFFF};
const u16 _020FBBEA[] = {ITEM_POTION, ITEM_SUPER_POTION, ITEM_HYPER_POTION, ITEM_MAX_POTION, ITEM_REVIVE, ITEM_ANTIDOTE, ITEM_PARLYZ_HEAL, ITEM_BURN_HEAL, ITEM_ICE_HEAL, ITEM_AWAKENING, ITEM_FULL_HEAL, 0xFFFF};
const u16 _020FBC1A[] = {ITEM_POKE_BALL, ITEM_GREAT_BALL, ITEM_ULTRA_BALL, ITEM_ESCAPE_ROPE, ITEM_POKE_DOLL, ITEM_REPEL, ITEM_SUPER_REPEL, ITEM_MAX_REPEL, ITEM_GRASS_MAIL, ITEM_FLAME_MAIL, ITEM_BUBBLE_MAIL, ITEM_SPACE_MAIL, 0xFFFF};
const u16 _020FBBB4[] = {ITEM_X_SPEED, ITEM_X_ATTACK, ITEM_X_DEFENSE, ITEM_GUARD_SPEC_, ITEM_DIRE_HIT, ITEM_X_ACCURACY, ITEM_X_SPECIAL, ITEM_X_SP__DEF, 0xFFFF};
const u16 _020FBAFA[] = {ITEM_PROTEIN, ITEM_IRON, ITEM_CALCIUM, ITEM_ZINC, ITEM_CARBOS, ITEM_HP_UP, 0xFFFF};
const u16 _020FBC34[] = {ITEM_TM70, ITEM_TM17, ITEM_TM54, ITEM_TM83, ITEM_TM16, ITEM_TM33, ITEM_TM22, ITEM_TM52, ITEM_TM38, ITEM_TM25, ITEM_TM14, ITEM_TM15, 0xFFFF};
const u16 _020FBACA[] = {ITEM_HEAL_POWDER, ITEM_ENERGYPOWDER, ITEM_ENERGY_ROOT, ITEM_REVIVAL_HERB, 0xFFFF};
const u16 _020FBA60[] = {ITEM_AIR_MAIL, ITEM_HEAL_BALL, ITEM_NET_BALL, 0xFFFF};
const u16 _020FBA88[] = {ITEM_HEART_MAIL, ITEM_HEAL_BALL, ITEM_NET_BALL, 0xFFFF};
const u16 _020FBAD4[] = {ITEM_POTION, ITEM_SUPER_POTION, ITEM_HYPER_POTION, ITEM_FULL_HEAL, ITEM_REVIVE, 0xFFFF};
const u16 _020FBA80[] = {ITEM_AIR_MAIL, ITEM_NET_BALL, ITEM_DUSK_BALL, 0xFFFF};
const u16 _020FBB84[] = {ITEM_ULTRA_BALL, ITEM_MAX_REPEL, ITEM_HYPER_POTION, ITEM_MAX_POTION, ITEM_FULL_RESTORE, ITEM_REVIVE, ITEM_FULL_HEAL, 0xFFFF};
const u16 _020FBAC0[] = {ITEM_AIR_MAIL, ITEM_NEST_BALL, ITEM_DUSK_BALL, ITEM_QUICK_BALL, 0xFFFF};
const u16 _020FBA70[] = {ITEM_AIR_MAIL, ITEM_DUSK_BALL, ITEM_QUICK_BALL, 0xFFFF};
const u16 _020FBA98[] = {ITEM_SNOW_MAIL, ITEM_DUSK_BALL, ITEM_QUICK_BALL, 0xFFFF};
const u16 _020FBA5A[] = {ITEM_AIR_MAIL, ITEM_QUICK_BALL, 0xFFFF};
const u16 _020FBC02[] = {ITEM_POTION, ITEM_SUPER_POTION, ITEM_HYPER_POTION, ITEM_MAX_POTION, ITEM_REVIVE, ITEM_ANTIDOTE, ITEM_PARLYZ_HEAL, ITEM_BURN_HEAL, ITEM_ICE_HEAL, ITEM_AWAKENING, ITEM_FULL_HEAL, 0xFFFF};
const u16 _020FBC4E[] = {ITEM_POKE_BALL, ITEM_GREAT_BALL, ITEM_ULTRA_BALL, ITEM_ESCAPE_ROPE, ITEM_POKE_DOLL, ITEM_REPEL, ITEM_SUPER_REPEL, ITEM_MAX_REPEL, ITEM_GRASS_MAIL, ITEM_FLAME_MAIL, ITEM_BUBBLE_MAIL, ITEM_SPACE_MAIL, 0xFFFF};
const u16 _020FBC68[] = {ITEM_TM21, ITEM_TM27, ITEM_TM87, ITEM_TM78, ITEM_TM12, ITEM_TM41, ITEM_TM20, ITEM_TM28, ITEM_TM76, ITEM_TM55, ITEM_TM72, ITEM_TM79, 0xFFFF};
const u16 _020FBA68[] = {ITEM_AIR_MAIL, ITEM_TUNNEL_MAIL, ITEM_BLOOM_MAIL, 0xFFFF};
const u16 _020FBBC6[] = {ITEM_X_SPEED, ITEM_X_ATTACK, ITEM_X_DEFENSE, ITEM_GUARD_SPEC_, ITEM_DIRE_HIT, ITEM_X_ACCURACY, ITEM_X_SPECIAL, ITEM_X_SP__DEF, 0xFFFF};
const u16 _020FBB08[] = {ITEM_PROTEIN, ITEM_IRON, ITEM_CALCIUM, ITEM_ZINC, ITEM_CARBOS, ITEM_HP_UP, 0xFFFF};
const u16 _020FBA90[] = {ITEM_STEEL_MAIL, ITEM_DUSK_BALL, ITEM_QUICK_BALL, 0xFFFF};
const u16 _020FBAA0[] = {ITEM_STEEL_MAIL, ITEM_NEST_BALL, ITEM_QUICK_BALL, 0xFFFF};
const u16 _020FBAA8[] = {ITEM_STEEL_MAIL, ITEM_NET_BALL, ITEM_HEAL_BALL, 0xFFFF};
const u16 _020FBB16[] = {ITEM_POKE_DOLL, ITEM_FRESH_WATER, ITEM_SODA_POP, ITEM_LEMONADE, ITEM_REPEL, ITEM_HEART_MAIL, 0xFFFF};
const u16 _020FBAB8[] = {ITEM_TINYMUSHROOM, ITEM_POKE_BALL, ITEM_POTION, 0xFFFF};
const u16 _020FBBD8[] = {ITEM_GREAT_BALL, ITEM_SUPER_POTION, ITEM_HYPER_POTION, ITEM_ANTIDOTE, ITEM_PARLYZ_HEAL, ITEM_SUPER_REPEL, ITEM_REVIVE, ITEM_AIR_MAIL, 0xFFFF};

const u16 *_0210FA3C[] = {
    _020FBA54,
    _020FBA78,
    _020FBAB0,
    _020FBBEA,
    _020FBC1A,
    _020FBBB4,
    _020FBAFA,
    _020FBC34,
    _020FBACA,
    _020FBA60,
    _020FBA88,
    _020FBAD4,
    _020FBA80,
    _020FBB84,
    _020FBAC0,
    _020FBA70,
    _020FBA98,
    _020FBA5A,
    _020FBC02,
    _020FBC4E,
    _020FBC68,
    _020FBA68,
    _020FBBC6,
    _020FBB08,
    _020FBA90,
    _020FBAA0,
    _020FBAA8,
    _020FBB16,
    _020FBAB8,
    _020FBBD8,
};

BOOL ScrCmd_SpecialMartBuy(ScriptContext *ctx) {
    u16 which;

    which = ScriptGetVar(ctx);
    InitMartUI(ctx->taskman, ctx->fieldSystem, _0210FA3C[which], 0, 0, 0, NULL);
    return TRUE;
}

// Sinnoh leftover, unused in HGSS
const u16 _020FBAE0[] = {
    DECORATION_YELLOW_CUSHION, DECORATION_CUPBOARD, DECORATION_TV, DECORATION_REFRIGERATOR, DECORATION_PRETTY_SINK, 0xFFFF
};
const u16 _020FBAEC[] = {
    DECORATION_MUNCHLAX_DOLL, DECORATION_BONSLY_DOLL, DECORATION_MIME_JR__DOLL, DECORATION_MANTYKE_DOLL, DECORATION_BUIZEL_DOLL, DECORATION_CHATOT_DOLL, 0xFFFF
};

const u16 *_0210F9CC[] = {
    _020FBAE0,
    _020FBAEC,
};

BOOL ScrCmd_DecorationMart(ScriptContext *ctx) {
    u16 which;

    which = ScriptGetVar(ctx);
    InitMartUI(ctx->taskman, ctx->fieldSystem, _0210F9CC[which], 1, 0, which <= 1 ? 1 : 0, NULL);
    return TRUE;
}

const u16 _020FBB94[] = {SEAL_HEART_A, SEAL_STAR_B, SEAL_FIRE_A, SEAL_SONG_A, SEAL_LINE_C, SEAL_ELE_B, SEAL_PARTY_D, 0xFFFF};
const u16 _020FBB24[] = {SEAL_HEART_B, SEAL_STAR_C, SEAL_FIRE_B, SEAL_FLORA_A, SEAL_SONG_B, SEAL_LINE_D, SEAL_ELE_C, 0xFFFF};
const u16 _020FBB34[] = {SEAL_HEART_C, SEAL_STAR_D, SEAL_FIRE_C, SEAL_FLORA_B, SEAL_SONG_C, SEAL_SMOKE_A, SEAL_ELE_D, 0xFFFF};
const u16 _020FBB44[] = {SEAL_HEART_D, SEAL_FOAMY_A, SEAL_FIRE_D, SEAL_FLORA_C, SEAL_SONG_D, SEAL_STAR_E, SEAL_SMOKE_B, 0xFFFF};
const u16 _020FBB54[] = {SEAL_FOAMY_B, SEAL_PARTY_A, SEAL_FLORA_D, SEAL_SONG_E, SEAL_HEART_E, SEAL_STAR_F, SEAL_SMOKE_C, 0xFFFF};
const u16 _020FBB64[] = {SEAL_FOAMY_C, SEAL_PARTY_B, SEAL_FLORA_E, SEAL_SONG_F, SEAL_HEART_F, SEAL_LINE_A, SEAL_SMOKE_D, 0xFFFF};
const u16 _020FBB74[] = {SEAL_STAR_A, SEAL_SONG_G, SEAL_FOAMY_D, SEAL_FLORA_F, SEAL_LINE_B, SEAL_ELE_A, SEAL_PARTY_C, 0xFFFF};

const u16 *_0210F9E8[] = {
    _020FBB94,
    _020FBB24,
    _020FBB34,
    _020FBB44,
    _020FBB54,
    _020FBB64,
    _020FBB74,
};

BOOL ScrCmd_SealMart(ScriptContext *ctx) {
    u16 which;

    which = ScriptGetVar(ctx);
    InitMartUI(ctx->taskman, ctx->fieldSystem, _0210F9E8[which], 2, 0, 0, NULL);
    return TRUE;
}

const struct MartItem _020FBCD6[] = {
    {ITEM_RED_APRICORN, 200},
    {ITEM_BLU_APRICORN, 200},
    {ITEM_GRN_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_MOON_STONE, 3000},
    {ITEM_RARE_CANDY, 2000},
    {0xFFFF, 0},
};
const struct MartItem _020FBCF2[] = {
    {ITEM_YLW_APRICORN, 200},
    {ITEM_PNK_APRICORN, 200},
    {ITEM_WHT_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_FIRE_STONE, 2500},
    {ITEM_PP_UP, 1000},
    {0xFFFF, 0},
};
const struct MartItem _020FBD2A[] = {
    {ITEM_BLU_APRICORN, 200},
    {ITEM_PNK_APRICORN, 200},
    {ITEM_BLK_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_WATER_STONE, 2500},
    {ITEM_HEART_SCALE, 1000},
    {0xFFFF, 0},
};
const struct MartItem _020FBD46[] = {
    {ITEM_YLW_APRICORN, 200},
    {ITEM_PNK_APRICORN, 200},
    {ITEM_WHT_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_THUNDERSTONE, 2500},
    {ITEM_PP_UP, 1000},
    {0xFFFF, 0},
};
const struct MartItem _020FBD62[] = {
    {ITEM_RED_APRICORN, 200},
    {ITEM_YLW_APRICORN, 200},
    {ITEM_GRN_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_METAL_COAT, 2500},
    {ITEM_NUGGET, 500},
    {0xFFFF, 0},
};
const struct MartItem _020FBD7E[] = {
    {ITEM_GRN_APRICORN, 200},
    {ITEM_WHT_APRICORN, 200},
    {ITEM_BLK_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_LEAF_STONE, 2500},
    {ITEM_RARE_CANDY, 2000},
    {0xFFFF, 0},
};
const struct MartItem _020FBC82[] = {
    {ITEM_RED_APRICORN, 200},
    {ITEM_BLU_APRICORN, 200},
    {ITEM_BLK_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_KINGS_ROCK, 3000},
    {ITEM_HEART_SCALE, 1000},
    {0xFFFF, 0},
};
const struct MartItem _020FBDB6[] = {
    {ITEM_RED_APRICORN, 200},
    {ITEM_BLU_APRICORN, 200},
    {ITEM_BLK_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_KINGS_ROCK, 3000},
    {ITEM_HEART_SCALE, 1000},
    {ITEM_FULL_RESTORE, 500},
    {ITEM_NUGGET, 500},
    {ITEM_SUN_STONE, 3000},
    {ITEM_FIRE_STONE, 2500},
    {ITEM_SHINY_STONE, 3000},
    {ITEM_DAWN_STONE, 3000},
    {0xFFFF, 0},
};
const struct MartItem _020FBDEA[] = {
    {ITEM_RED_APRICORN, 200},
    {ITEM_BLU_APRICORN, 200},
    {ITEM_GRN_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_MOON_STONE, 3000},
    {ITEM_RARE_CANDY, 2000},
    {ITEM_FULL_RESTORE, 500},
    {ITEM_KINGS_ROCK, 3000},
    {ITEM_SUN_STONE, 3000},
    {ITEM_WATER_STONE, 2500},
    {ITEM_SHINY_STONE, 3000},
    {ITEM_DUSK_STONE, 3000},
    {0xFFFF, 0},
};
const struct MartItem _020FBE1E[] = {
    {ITEM_YLW_APRICORN, 200},
    {ITEM_PNK_APRICORN, 200},
    {ITEM_WHT_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_FIRE_STONE, 2500},
    {ITEM_PP_UP, 1000},
    {ITEM_FULL_RESTORE, 500},
    {ITEM_METAL_COAT, 2500},
    {ITEM_WATER_STONE, 2500},
    {ITEM_LEAF_STONE, 2500},
    {ITEM_DUSK_STONE, 3000},
    {ITEM_DAWN_STONE, 3000},
    {0xFFFF, 0},
};
const struct MartItem _020FBE52[] = {
    {ITEM_BLU_APRICORN, 200},
    {ITEM_PNK_APRICORN, 200},
    {ITEM_BLK_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_WATER_STONE, 2500},
    {ITEM_HEART_SCALE, 1000},
    {ITEM_FULL_RESTORE, 500},
    {ITEM_DRAGON_SCALE, 2500},
    {ITEM_THUNDERSTONE, 2500},
    {ITEM_MOON_STONE, 3000},
    {ITEM_SHINY_STONE, 3000},
    {ITEM_DAWN_STONE, 3000},
    {0xFFFF, 0},
};
const struct MartItem _020FBE86[] = {
    {ITEM_YLW_APRICORN, 200},
    {ITEM_PNK_APRICORN, 200},
    {ITEM_WHT_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_THUNDERSTONE, 2500},
    {ITEM_PP_UP, 1000},
    {ITEM_FULL_RESTORE, 500},
    {ITEM_KINGS_ROCK, 3000},
    {ITEM_FIRE_STONE, 2500},
    {ITEM_LEAF_STONE, 2500},
    {ITEM_SHINY_STONE, 3000},
    {ITEM_DUSK_STONE, 3000},
    {0xFFFF, 0},
};
const struct MartItem _020FBEBA[] = {
    {ITEM_RED_APRICORN, 200},
    {ITEM_YLW_APRICORN, 200},
    {ITEM_GRN_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_METAL_COAT, 2500},
    {ITEM_NUGGET, 500},
    {ITEM_FULL_RESTORE, 500},
    {ITEM_DRAGON_SCALE, 2500},
    {ITEM_WATER_STONE, 2500},
    {ITEM_SUN_STONE, 3000},
    {ITEM_DUSK_STONE, 3000},
    {ITEM_DAWN_STONE, 3000},
    {0xFFFF, 0},
};
const struct MartItem _020FBEEE[] = {
    {ITEM_GRN_APRICORN, 200},
    {ITEM_WHT_APRICORN, 200},
    {ITEM_BLK_APRICORN, 200},
    {ITEM_MOOMOO_MILK, 100},
    {ITEM_LEAF_STONE, 2500},
    {ITEM_RARE_CANDY, 2000},
    {ITEM_FULL_RESTORE, 500},
    {ITEM_METAL_COAT, 2500},
    {ITEM_THUNDERSTONE, 2500},
    {ITEM_SHINY_STONE, 3000},
    {ITEM_DUSK_STONE, 3000},
    {ITEM_DAWN_STONE, 3000},
    {0xFFFF, 0},
};

const struct MartItem *_0210FA04[] = {
    _020FBC82,
    _020FBCD6,
    _020FBCF2,
    _020FBD2A,
    _020FBD46,
    _020FBD62,
    _020FBD7E,
    _020FBDB6,
    _020FBDEA,
    _020FBE1E,
    _020FBE52,
    _020FBE86,
    _020FBEBA,
    _020FBEEE,
};

BOOL ScrCmd_771(ScriptContext *ctx) {
    SaveVarsFlags *flagsys;
    RTCDate date;

    flagsys = Save_VarsFlags_Get(ctx->fieldSystem->saveData);
    GF_RTC_CopyDate(&date);

    // UB: Possibly illegal access to _0210F9CC between Tuesday and Saturday, inclusive
    if (Pokedex_GetNatDexFlag(Save_Pokedex_Get(ctx->fieldSystem->saveData))) {
        InitMartUI(ctx->taskman, ctx->fieldSystem, _0210F9CC[date.week], 3, 0, 0, _0210FA04[date.week + 7]);
    } else {
        InitMartUI(ctx->taskman, ctx->fieldSystem, _0210F9CC[date.week], 3, 0, 0, _0210FA04[date.week]);
    }
    return TRUE;
}

const struct MartItem _020FBCBA[] = {
    {ITEM_DATA_CARD_01, 500},
    {ITEM_DATA_CARD_02, 500},
    {ITEM_DATA_CARD_03, 1000},
    {ITEM_DATA_CARD_04, 1000},
    {ITEM_DATA_CARD_05, 500},
    {ITEM_DATA_CARD_06, 500},
    {0xFFFF, 0},
};
const struct MartItem _020FBD0E[] = {
    {ITEM_DATA_CARD_07, 1000},
    {ITEM_DATA_CARD_08, 1000},
    {ITEM_DATA_CARD_09, 1000},
    {ITEM_DATA_CARD_10, 1000},
    {ITEM_DATA_CARD_11, 1000},
    {ITEM_DATA_CARD_12, 1000},
    {0xFFFF, 0},
};
const struct MartItem _020FBD9A[] = {
    {ITEM_DATA_CARD_13, 1500},
    {ITEM_DATA_CARD_14, 1500},
    {ITEM_DATA_CARD_15, 1500},
    {ITEM_DATA_CARD_16, 1000},
    {ITEM_DATA_CARD_17, 1000},
    {ITEM_DATA_CARD_18, 1000},
    {0xFFFF, 0},
};
const struct MartItem _020FBC9E[] = {
    {ITEM_DATA_CARD_19, 500},
    {ITEM_DATA_CARD_20, 500},
    {ITEM_DATA_CARD_21, 2000},
    {ITEM_DATA_CARD_22, 2000},
    {ITEM_DATA_CARD_23, 1000},
    {ITEM_DATA_CARD_24, 1000},
    {0xFFFF, 0},
};
const struct MartItem _020FBBA4[] = {
    {ITEM_DATA_CARD_25, 2000},
    {ITEM_DATA_CARD_26, 3000},
    {ITEM_DATA_CARD_27, 9999},
    {0xFFFF, 0},
};

const struct MartItem *_0210F9D4[] = {
    _020FBCBA,
    _020FBD0E,
    _020FBD9A,
    _020FBC9E,
    _020FBBA4,
};

BOOL ScrCmd_772(ScriptContext *ctx) {
    POKEATHLON_SAV *pokeathlon;
    int i;

    pokeathlon = Save_Pokeathlon_Get(ctx->fieldSystem->saveData);
    for (i = 0; i < 27; i++) {
        if (!sub_02031A78(pokeathlon, i)) {
            break;
        }
    }
    InitMartUI(ctx->taskman, ctx->fieldSystem, _0210F9CC[0], 4, 0, 0, _0210F9D4[i / 6]);
    return TRUE;
}

BOOL ScrCmd_834(ScriptContext *ctx) {
    u16 *sp0;
    POKEATHLON_SAV *pokeathlon;
    SaveVarsFlags *varsFlags;
    int r6;
    int r4;
    RTCDate date;
    const struct MartItem *r3;
    int i;

    sp0 = ScriptGetVarPointer(ctx);
    pokeathlon = Save_Pokeathlon_Get(ctx->fieldSystem->saveData);
    r6 = 0;
    r4 = 0;
    varsFlags = Save_VarsFlags_Get(ctx->fieldSystem->saveData);
    GF_RTC_CopyDate(&date);
    if (Pokedex_GetNatDexFlag(Save_Pokedex_Get(ctx->fieldSystem->saveData))) {
        r3 = _0210FA04[date.week + 7];
    } else {
        r3 = _0210FA04[date.week];
    }
    for (i = 0; i < 12; i++) {
        if (r3[i].item_id == 0xFFFF) {
            break;
        }
        r6++;
    }
    for (i = 0; i < 12; i++) {
        if (sub_02031AB8(pokeathlon, i)) {
            r4++;
        }
    }
    if (r6 <= r4) {
        *sp0 = FALSE;
    } else {
        *sp0 = TRUE;
    }
    return FALSE;
}

BOOL ScrCmd_835(ScriptContext *ctx) {
    u16 *ret_ptr;
    int i;
    POKEATHLON_SAV *pokeathlon;

    ret_ptr = ScriptGetVarPointer(ctx);
    pokeathlon = Save_Pokeathlon_Get(ctx->fieldSystem->saveData);
    for (i = 0; i < 27; i++) {
        if (!sub_02031A78(pokeathlon, i)) {
            break;
        }
    }
    *ret_ptr = i;
    return FALSE;
}
