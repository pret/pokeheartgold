#include "global.h"
#include "unk_0205B3DC.h"
#include "gf_gfx_loader.h"
#include "constants/sprites.h"
#include "application/record/record.naix"

// Based on the lower 3 bits of your trainer ID,
// you'll be offered a different set of 4 choices
// for avatar and trainer class.
static const u8 sPlayerAvatarIndexChoices[][4] = {
    { 0, 1, 2, 3 },
    { 1, 6, 7, 0 },
    { 2, 3, 4, 5 },
    { 3, 0, 5, 6 },
    { 4, 1, 2, 7 },
    { 5, 2, 7, 0 },
    { 6, 3, 4, 1 },
    { 7, 4, 5, 6 },
};

// The above array indexes into this table
// which defines the sprite, trainer class,
// and... the same trainer class again?
static const u8 sPlayerAvatarAttributes[][3] = {
    // Male
    { SPRITE_BOY1, TRAINERCLASS_SCHOOL_KID_M, TRAINERCLASS_SCHOOL_KID_M },
    { SPRITE_BOY3, TRAINERCLASS_BUG_CATCHER, TRAINERCLASS_BUG_CATCHER },
    { SPRITE_MAN3, TRAINERCLASS_ACE_TRAINER_M, TRAINERCLASS_ACE_TRAINER_M },
    { SPRITE_BADMAN, TRAINERCLASS_ROUGHNECK, TRAINERCLASS_ROUGHNECK },
    { SPRITE_EXPLORE, TRAINERCLASS_RUIN_MANIAC, TRAINERCLASS_RUIN_MANIAC },
    { SPRITE_FIGHTER, TRAINERCLASS_BLACK_BELT, TRAINERCLASS_BLACK_BELT },
    { SPRITE_GORGGEOUSM, TRAINERCLASS_RICH_BOY, TRAINERCLASS_RICH_BOY },
    { SPRITE_MYSTERY, TRAINERCLASS_PSYCHIC_M, TRAINERCLASS_PSYCHIC_M },
    // Female
    { SPRITE_GIRL1, TRAINERCLASS_LASS, TRAINERCLASS_LASS },
    { SPRITE_GIRL2, TRAINERCLASS_BATTLE_GIRL, TRAINERCLASS_BATTLE_GIRL },
    { SPRITE_WOMAN2, TRAINERCLASS_BEAUTY, TRAINERCLASS_BEAUTY },
    { SPRITE_WOMAN3, TRAINERCLASS_ACE_TRAINER_F, TRAINERCLASS_ACE_TRAINER_F },
    { SPRITE_IDOL, TRAINERCLASS_IDOL, TRAINERCLASS_IDOL },
    { SPRITE_LADY, TRAINERCLASS_SOCIALITE, TRAINERCLASS_SOCIALITE },
    { SPRITE_COWGIRL, TRAINERCLASS_COWGIRL, TRAINERCLASS_COWGIRL },
    { SPRITE_GORGGEOUSW, TRAINERCLASS_LADY, TRAINERCLASS_LADY },
};

void BufferUnionRoomAvatarChoicesNames(u32 trainerId, u32 playerGender, MessageFormat *msgFmt) {
    int idx;
    int i;
    int sprite;

    idx = trainerId % 8;

    for (i = 0; i < 4; i++) {
        sprite = sPlayerAvatarIndexChoices[idx][i];
        BufferTrainerClassName(msgFmt, i, sPlayerAvatarAttributes[sprite + playerGender * 8][1]);
    }
}

int UnionRoomAvatarIdxToSprite(u32 trainerId, u32 playerGender, u32 choice) {
    int idx;
    int sprite;

    idx = trainerId % 8;
    sprite = sPlayerAvatarIndexChoices[idx][choice];
    return sPlayerAvatarAttributes[sprite + playerGender * 8][0];
}

static int SpriteToUnionRoomAvatarIdx_Internal(int playerGender, int trclass) {
    int i;

    for (i = 0; i < 8; i++) {
        if (sPlayerAvatarAttributes[i + playerGender * 8][0] == trclass) {
            return i + playerGender * 8;
        }
    }

    return 0;
}

int SpriteToUnionRoomAvatarIdx(int playerGender, int trclass) {
    return SpriteToUnionRoomAvatarIdx_Internal(playerGender, trclass);
}

int GetUnionRoomAvatarAttrBySprite(int playerGender, int trclass, int attr) {
    int idx;

    idx = SpriteToUnionRoomAvatarIdx_Internal(playerGender, trclass);
    switch (attr) {
    case 2:
        return sPlayerAvatarAttributes[idx][1];
    case 1:
        return sPlayerAvatarAttributes[idx][2];
    case 0:
        return idx;
    default:
        GF_ASSERT(0);
        break;
    }
    return 0;
}

u16 *sub_0205B4A4(HeapID heapId) {
    NNSG2dPaletteData *pPlttData;
    u16 *pltt_src;
    u16 *ret;
    const u16 *plttRaw;
    int i;

    pltt_src = GfGfxLoader_GetPlttData(NARC_application_record_record, NARC_record_record_00000011_NCLR, &pPlttData, heapId);
    ret = AllocFromHeap(heapId, 0x120 * 2);
    plttRaw = pPlttData->pRawData;
    for (i = 0; i < 0x100; i++) {
        ret[i] = plttRaw[i];
    }
    FreeToHeap(pltt_src);
    return ret;
}
