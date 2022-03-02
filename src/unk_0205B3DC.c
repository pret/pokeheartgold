#include "unk_0205B3DC.h"
#include "gf_gfx_loader.h"

static const u8 _020FCA24[][4] = {
    { 0, 1, 2, 3 },
    { 1, 6, 7, 0 },
    { 2, 3, 4, 5 },
    { 3, 0, 5, 6 },
    { 4, 1, 2, 7 },
    { 5, 2, 7, 0 },
    { 6, 3, 4, 1 },
    { 7, 4, 5, 6 },
};

static const u8 _020FCA44[][3] = {
    // Male
    { 0x03, TRAINERCLASS_SCHOOL_KID_M, TRAINERCLASS_SCHOOL_KID_M },
    { 0x05, TRAINERCLASS_BUG_CATCHER, TRAINERCLASS_BUG_CATCHER },
    { 0x0B, TRAINERCLASS_ACE_TRAINER_M, TRAINERCLASS_ACE_TRAINER_M },
    { 0x1F, TRAINERCLASS_ROUGHNECK, TRAINERCLASS_ROUGHNECK },
    { 0x32, TRAINERCLASS_RUIN_MANIAC, TRAINERCLASS_RUIN_MANIAC },
    { 0x33, TRAINERCLASS_BLACK_BELT, TRAINERCLASS_BLACK_BELT },
    { 0x3E, TRAINERCLASS_RICH_BOY, TRAINERCLASS_RICH_BOY },
    { 0x46, TRAINERCLASS_PSYCHIC_M, TRAINERCLASS_PSYCHIC_M },
    // Female
    { 0x06, TRAINERCLASS_LASS, TRAINERCLASS_LASS },
    { 0x07, TRAINERCLASS_BATTLE_GIRL, TRAINERCLASS_BATTLE_GIRL },
    { 0x0D, TRAINERCLASS_BEAUTY, TRAINERCLASS_BEAUTY },
    { 0x0E, TRAINERCLASS_ACE_TRAINER_F, TRAINERCLASS_ACE_TRAINER_F },
    { 0x23, TRAINERCLASS_IDOL, TRAINERCLASS_IDOL },
    { 0x25, TRAINERCLASS_SOCIALITE, TRAINERCLASS_SOCIALITE },
    { 0x2A, TRAINERCLASS_COWGIRL, TRAINERCLASS_COWGIRL },
    { 0x3F, TRAINERCLASS_LADY, TRAINERCLASS_LADY },
};

void sub_0205B3DC(u32 trainerId, u32 playerGender, MSGFMT *msgFmt) {
    int idx;
    int i;
    int sprite;

    idx = trainerId % 8;

    for (i = 0; i < 4; i++) {
        sprite = _020FCA24[idx][i];
        BufferTrainerClassName(msgFmt, i, _020FCA44[sprite + playerGender * 8][1]);
    }
}

int sub_0205B418(u32 trainerId, u32 playerGender, u32 choice) {
    int idx;
    int sprite;

    idx = trainerId % 8;
    sprite = _020FCA24[idx][choice];
    return _020FCA44[sprite + playerGender * 8][0];
}

static int sub_0205B438(int playerGender, int trclass) {
    int i;

    for (i = 0; i < 8; i++) {
        if (_020FCA44[i + playerGender * 8][0] == trclass) {
            return i + playerGender * 8;
        }
    }

    return 0;
}

int sub_0205B464(int playerGender, int trclass) {
    return sub_0205B438(playerGender, trclass);
}

int sub_0205B46C(int playerGender, int trclass, int attr) {
    int idx;

    idx = sub_0205B438(playerGender, trclass);
    switch (attr) {
    case 2:
        return _020FCA44[idx][1];
    case 1:
        return _020FCA44[idx][2];
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

    pltt_src = GfGfxLoader_GetPlttData(NARC_a_0_8_4, 11, &pPlttData, heapId);
    ret = AllocFromHeap(heapId, 0x120 * 2);
    plttRaw = pPlttData->pRawData;
    for (i = 0; i < 0x100; i++) {
        ret[i] = plttRaw[i];
    }
    FreeToHeap(pltt_src);
    return ret;
}
