#ifndef POKEHEARTGOLD_MYSTERY_GIFT_H
#define POKEHEARTGOLD_MYSTERY_GIFT_H

#include "pokemon_types_def.h"
#include "photo_album.h"

#define MG_TAG_invalid             0
#define MG_TAG_pokemon             1
#define MG_TAG_egg                 2
#define MG_TAG_item                3
#define MG_TAG_battle_rules        4
#define MG_TAG_secret_base_deco    5 // disabled in hgss
#define MG_TAG_mon_deco            6
#define MG_TAG_manaphy_egg         7
#define MG_TAG_member_card         8 // disabled in hgss
#define MG_TAG_oaks_letter         9 // disabled in hgss
#define MG_TAG_azure_flute        10 // disabled in hgss
#define MG_TAG_poketch_app        11 // disabled in hgss
#define MG_TAG_secret_key         12 // disabled in hgss
#define MG_TAG_pokemon_movie      13
#define MG_TAG_pokewalker_course  14
#define MG_TAG_memorial_photo     15
#define MG_TAG_max                16

#define NUM_SAVED_MYSTERY_GIFTS    8
#define NUM_SAVED_WONDER_CARDS     3
#define RECEIVED_WONDER_CARD_IDX   4

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
    u16 flag : 2;
    u16 dummy : 14;
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
    MysteryGift gifts[NUM_SAVED_MYSTERY_GIFTS]; // 0100
    WonderCard cards[NUM_SAVED_WONDER_CARDS];  // 920
    WonderCard receivedCard; // 1328
} MYSTERY_GIFT_SAVE; // size = 0x1680

u32 Save_MysteryGift_sizeof(void);
void Save_MysteryGift_Init(MYSTERY_GIFT_SAVE *mg);
WonderCard* SaveMysteryGift_CardGetByIdx(MYSTERY_GIFT_SAVE* mg, int index);
BOOL SaveMysteryGift_FindAvailable(MYSTERY_GIFT_SAVE* mg);
BOOL sub_0202DC2C(MYSTERY_GIFT_SAVE* mg, const MysteryGift* src, int flag);

#endif //POKEHEARTGOLD_MYSTERY_GIFT_H
