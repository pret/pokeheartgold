#ifndef POKEHEARTGOLD_MYSTERY_GIFT_H
#define POKEHEARTGOLD_MYSTERY_GIFT_H

#include "pokemon_types_def.h"
#include "photo_album.h"

enum MysteryGiftTag {
    MG_TAG_pokemon,
    MG_TAG_egg,
    MG_TAG_item,
    MG_TAG_battle_rules,
    MG_TAG_secret_base_deco, // disabled in hgss
    MG_TAG_mon_deco,
    MG_TAG_manaphy_egg,
    MG_TAG_member_card, // disabled in hgss
    MG_TAG_oaks_letter, // disabled in hgss
    MG_TAG_azure_flute, // disabled in hgss
    MG_TAG_poketch_app, // disabled in hgss
    MG_TAG_secret_key, // disabled in hgss
    MG_TAG_pokemon_movie,
    MG_TAG_pokewalker_course,
    MG_TAG_memorial_photo,
};

typedef struct MG_POKEMON_TAG {
    BOOL fixedOT;
    Pokemon mon;
    u8 ribbons[10];
} MG_POKEMON_TAG;

typedef struct MG_MON_DECO_TAG {
    int kind; // 1 = seal, 2 = fashion, 3 = background
    int id;
} MG_MON_DECO_TAG;

typedef struct {
    u16 tag;
    u16 flag;
    union {
        MG_POKEMON_TAG pokemon;
        Pokemon egg;
        u32 item;
        u16 ruleset[24];
        int base_decoration;
        MG_MON_DECO_TAG mon_decoration;
        u8 pokewalkerCourse;
        PHOTO photo;
        u8 raw[256];
    };
} MysteryGift;

typedef struct {
    u16 tag;
    u16 flag;
    union {
        u8 raw[852];
    };
} WonderCard;

typedef struct {
    u8 filler_000[0x100]; // 0000
    MysteryGift gifts[8]; // 0100
    WonderCard cards[4];  // 920
} MYSTERY_GIFT_SAVE; // size = 0x1680

u32 Save_MysteryGift_sizeof(void);
void Save_MysteryGift_Init(MYSTERY_GIFT_SAVE *mg);

#endif //POKEHEARTGOLD_MYSTERY_GIFT_H
