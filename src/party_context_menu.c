#include "font.h"
#include "global.h"
#include "party_context_menu.h"
#include "msgdata/msg/msg_0300.h"
#include "render_text.h"
#include "system.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0207F42C.h"
#include "unk_0200CE7C.h"
#include "unk_0208805C.h"
#include "unk_02080BB4.h"

static void sub_0207CB9C(PartyMenuStruct *partyMenu, UnkStruct_0207E590 *a1, int a2);
static void sub_0207CD84(BgConfig *bgConfig, Window *window, const WindowTemplate *template);
static void PartyMenu_DrawSlashOnMonHpTextWindow(PartyMenuStruct *partyMenu, u8 partySlot);
static void PartyMenu_PrintMonNicknameOnWindow(PartyMenuStruct *partyMenu, u8 partySlot);
static void PartyMenu_PrintMonMaxHpOnWindow(PartyMenuStruct *partyMenu, u8 partySlot);
static u32 sub_0207D988(FontID fontId, String *string, u32 windowWidth);
static void sub_0207DA64(PartyMenuStruct *partyMenu, Window *window, int msgId, BOOL drawFrame);
static BOOL sub_0207DB80(TextPrinterTemplate *template, u16 glyphId);
static void sub_0207DC20(PartyMenuStruct *partyMenu, u8 partySlot, u8 a2);
static void sub_0207DC90(PartyMenuStruct *partyMenu, u8 partySlot, u8 a2);
static void sub_0207DD14(PartyMenuStruct *partyMenu, u8 partySlot, u8 isCompatible);
static void sub_0207DD7C(PartyMenuStruct *partyMenu, u8 partySlot, u8 a2);
static void sub_0207E17C(PartyMenuStruct *partyMenu, int a1, int a2);
static void sub_0207E1DC(PartyMenuStruct *partyMenu, int a1, int a2);
static u32 sub_0207E264(int a0);
static u32 sub_0207E278(int a0);
static void sub_0207E28C(PartyMenuStruct *partyMenu, UnkTemplate_0207E590 *a1, int a2, int a3, int a4, int a5);
static void sub_0207E358(PartyMenuStruct *partyMenu, UnkTemplate_0207E590 *a1, int a2, int a3, int a4);
static void sub_0207E3A8(PartyMenuStruct *partyMenu, int a1, int a2, int a3, int a4);
static BOOL sub_0207E684(int a0, int a1, int a2);
static int sub_0207E6B4(int a0, int a1, int a2);
static BOOL sub_0207E6E8(int a0, int a1, int a2);
static BOOL sub_0207E714(u8 *a0, int a1, int a2);
static BOOL sub_0207E748(u8 *a0, int a1, int a2);

static const WindowTemplate _02101734[] = {
    { GF_BG_LYR_MAIN_1, 0x06, 0x01, 0x09, 0x02, 0x00, 0x0048 },
    { GF_BG_LYR_MAIN_1, 0x00, 0x04, 0x06, 0x02, 0x00, 0x005A },
    { GF_BG_LYR_MAIN_1, 0x07, 0x04, 0x08, 0x02, 0x00, 0x0066 },
    { GF_BG_LYR_MAIN_1, 0x08, 0x03, 0x06, 0x01, 0x03, 0x0076 },
    { GF_BG_LYR_MAIN_1, 0x06, 0x04, 0x0A, 0x02, 0x00, 0x0066 },
    { GF_BG_LYR_MAIN_1, 0x16, 0x02, 0x09, 0x02, 0x00, 0x007C },
    { GF_BG_LYR_MAIN_1, 0x10, 0x05, 0x06, 0x02, 0x00, 0x008E },
    { GF_BG_LYR_MAIN_1, 0x17, 0x05, 0x08, 0x02, 0x00, 0x009A },
    { GF_BG_LYR_MAIN_1, 0x18, 0x04, 0x06, 0x01, 0x04, 0x00AA },
    { GF_BG_LYR_MAIN_1, 0x16, 0x05, 0x0A, 0x02, 0x00, 0x009A },
    { GF_BG_LYR_MAIN_1, 0x06, 0x07, 0x09, 0x02, 0x00, 0x00B0 },
    { GF_BG_LYR_MAIN_1, 0x00, 0x0A, 0x06, 0x02, 0x00, 0x00C2 },
    { GF_BG_LYR_MAIN_1, 0x07, 0x0A, 0x08, 0x02, 0x00, 0x00CE },
    { GF_BG_LYR_MAIN_1, 0x08, 0x09, 0x06, 0x01, 0x05, 0x00DE },
    { GF_BG_LYR_MAIN_1, 0x06, 0x0A, 0x0A, 0x02, 0x00, 0x00CE },
    { GF_BG_LYR_MAIN_1, 0x16, 0x08, 0x09, 0x02, 0x00, 0x00E4 },
    { GF_BG_LYR_MAIN_1, 0x10, 0x0B, 0x06, 0x02, 0x00, 0x00F6 },
    { GF_BG_LYR_MAIN_1, 0x17, 0x0B, 0x08, 0x02, 0x00, 0x0102 },
    { GF_BG_LYR_MAIN_1, 0x18, 0x0A, 0x06, 0x01, 0x06, 0x0112 },
    { GF_BG_LYR_MAIN_1, 0x16, 0x0B, 0x0A, 0x02, 0x00, 0x0102 },
    { GF_BG_LYR_MAIN_1, 0x06, 0x0D, 0x09, 0x02, 0x00, 0x0118 },
    { GF_BG_LYR_MAIN_1, 0x00, 0x10, 0x06, 0x02, 0x00, 0x012A },
    { GF_BG_LYR_MAIN_1, 0x07, 0x10, 0x08, 0x02, 0x00, 0x0136 },
    { GF_BG_LYR_MAIN_1, 0x08, 0x0F, 0x06, 0x01, 0x07, 0x0146 },
    { GF_BG_LYR_MAIN_1, 0x06, 0x10, 0x0A, 0x02, 0x00, 0x0136 },
    { GF_BG_LYR_MAIN_1, 0x16, 0x0E, 0x09, 0x02, 0x00, 0x014C },
    { GF_BG_LYR_MAIN_1, 0x10, 0x11, 0x06, 0x02, 0x00, 0x015E },
    { GF_BG_LYR_MAIN_1, 0x17, 0x11, 0x08, 0x02, 0x00, 0x016A },
    { GF_BG_LYR_MAIN_1, 0x18, 0x10, 0x06, 0x01, 0x08, 0x017A },
    { GF_BG_LYR_MAIN_1, 0x16, 0x11, 0x0A, 0x02, 0x00, 0x016A },
    { GF_BG_LYR_MAIN_1, 0x16, 0x01, 0x09, 0x02, 0x00, 0x007C },
    { GF_BG_LYR_MAIN_1, 0x11, 0x05, 0x05, 0x02, 0x00, 0x008E },
    { GF_BG_LYR_MAIN_1, 0x17, 0x05, 0x08, 0x02, 0x00, 0x009A },
    { GF_BG_LYR_MAIN_1, 0x18, 0x04, 0x06, 0x01, 0x04, 0x00AA },
    { GF_BG_LYR_MAIN_1, 0x18, 0x04, 0x06, 0x01, 0x04, 0x00AA },
    { GF_BG_LYR_MAIN_1, 0x16, 0x08, 0x09, 0x02, 0x00, 0x00E4 },
    { GF_BG_LYR_MAIN_1, 0x11, 0x0B, 0x05, 0x02, 0x00, 0x00F6 },
    { GF_BG_LYR_MAIN_1, 0x17, 0x0B, 0x08, 0x02, 0x00, 0x0102 },
    { GF_BG_LYR_MAIN_1, 0x18, 0x0A, 0x06, 0x01, 0x06, 0x0112 },
    { GF_BG_LYR_MAIN_1, 0x18, 0x04, 0x06, 0x01, 0x04, 0x00AA },
    { GF_BG_LYR_MAIN_1, 0x16, 0x0E, 0x09, 0x02, 0x00, 0x014C },
    { GF_BG_LYR_MAIN_1, 0x11, 0x11, 0x05, 0x02, 0x00, 0x015E },
    { GF_BG_LYR_MAIN_1, 0x17, 0x11, 0x08, 0x02, 0x00, 0x016A },
    { GF_BG_LYR_MAIN_1, 0x18, 0x10, 0x06, 0x01, 0x08, 0x017A },
    { GF_BG_LYR_MAIN_1, 0x18, 0x04, 0x06, 0x01, 0x04, 0x00AA },
    { GF_BG_LYR_SUB_2, 0x07, 0x18, 0x0A, 0x02, 0x02, 0x0001 },
    { GF_BG_LYR_SUB_2, 0x11, 0x18, 0x06, 0x02, 0x02, 0x0015 },
    { GF_BG_LYR_SUB_2, 0x11, 0x1A, 0x0C, 0x03, 0x02, 0x0021 },
};

static const WindowTemplate _0210161C[] = {
    { GF_BG_LYR_MAIN_1, 0x1A, 0x15, 0x05, 0x02, 0x00, 0x0180 },
    { GF_BG_LYR_MAIN_1, 0x19, 0x14, 0x07, 0x02, 0x00, 0x018A },
    { GF_BG_LYR_MAIN_0, 0x02, 0x15, 0x14, 0x02, 0x0D, 0x0198 },
    { GF_BG_LYR_MAIN_0, 0x02, 0x13, 0x0D, 0x04, 0x0D, 0x01C0 },
    { GF_BG_LYR_MAIN_0, 0x02, 0x13, 0x1B, 0x04, 0x0D, 0x01F4 },
    { GF_BG_LYR_MAIN_0, 0x13, 0x11, 0x0C, 0x06, 0x00, 0x0260 },
    { GF_BG_LYR_MAIN_0, 0x13, 0x0F, 0x0C, 0x08, 0x00, 0x0260 },
};

static const WindowTemplate _02101654[] = {
    { GF_BG_LYR_MAIN_0, 0x11, 0x04, 0x0E, 0x02, 0x02, 0x0260 },
    { GF_BG_LYR_MAIN_0, 0x11, 0x08, 0x0E, 0x02, 0x02, 0x027C },
    { GF_BG_LYR_MAIN_0, 0x11, 0x0C, 0x0E, 0x02, 0x02, 0x0298 },
    { GF_BG_LYR_MAIN_0, 0x01, 0x03, 0x0E, 0x02, 0x02, 0x02B4 },
    { GF_BG_LYR_MAIN_0, 0x01, 0x07, 0x0E, 0x02, 0x02, 0x02D0 },
    { GF_BG_LYR_MAIN_0, 0x01, 0x0B, 0x0E, 0x02, 0x02, 0x02EC },
    { GF_BG_LYR_MAIN_0, 0x01, 0x0F, 0x0E, 0x02, 0x02, 0x0308 },
    { GF_BG_LYR_MAIN_0, 0x1A, 0x14, 0x05, 0x03, 0x02, 0x0324 },
    { GF_BG_LYR_MAIN_0, 0x11, 0x03, 0x0E, 0x02, 0x02, 0x0260 },
    { GF_BG_LYR_MAIN_0, 0x11, 0x07, 0x0E, 0x02, 0x02, 0x027C },
    { GF_BG_LYR_MAIN_0, 0x11, 0x0B, 0x0E, 0x02, 0x02, 0x0298 },
    { GF_BG_LYR_MAIN_0, 0x11, 0x0F, 0x0E, 0x02, 0x02, 0x02B4 },
};

static const u8 _021015EC[][4] = {
    { 0x10, 0x03, 0x10, 0x04 },
    { 0x10, 0x07, 0x10, 0x04 },
    { 0x10, 0x0B, 0x10, 0x04 },
    { 0x00, 0x02, 0x10, 0x04 },
    { 0x00, 0x06, 0x10, 0x04 },
    { 0x00, 0x0A, 0x10, 0x04 },
    { 0x00, 0x0E, 0x10, 0x04 },
    { 0x19, 0x13, 0x07, 0x05 },
    { 0x10, 0x02, 0x10, 0x04 },
    { 0x10, 0x06, 0x10, 0x04 },
    { 0x10, 0x0A, 0x10, 0x04 },
    { 0x10, 0x0E, 0x10, 0x04 },
};

static const s8 _021016B4[][2][8] = {
    {
            { 0, -1, -1, -1, -1, -1, -1, -1 },
        { 7, -1, -1, -1, -1, -1, -1, -1 }
    }, {
            { 0, 7, -1, -1, -1, -1, -1, -1 },
        { 8, 7, -1, -1, -1, -1, -1, -1 }
    }, {
            { 0, 1, 7, -1, -1, -1, -1, -1 },
        { 8, 9, 7, -1, -1, -1, -1, -1 }
    }, {
            { 0, 1, 2, 7, -1, -1, -1, -1 },
        { 8, 9, 10, 7, -1, -1, -1, -1 }
    }, {
            { 0, 1, 2, 7, 3, -1, -1, -1 },
        { 8, 9, 10, 11, 7, -1, -1, -1 }
    }, {
            { 0, 1, 2, 7, 3, 4, -1, -1 },
        { 0, 1, 2, 3, 4, 8, -1, -1 }
    }, {
            { 0, 1, 2, 7, 3, 4, 5, -1 },
        { 0, 1, 2, 3, 4, 5, 8, -1 }
    }, {
            { 0, 1, 2, 7, 3, 4, 5, 6 },
        { 0, 1, 2, 7, 3, 4, 5, 6 }
    },
};

static const u16 _021015AC[] = {
    0, 2, 6, 8, 3, 5, 1, 7
};

static const u16 _021015BC[][4] = {
    { msg_0300_00008, msg_0300_00002, msg_0300_00020, msg_0300_00014 },
    { msg_0300_00009, msg_0300_00003, msg_0300_00021, msg_0300_00015 },
    { msg_0300_00010, msg_0300_00004, msg_0300_00022, msg_0300_00016 },
    { msg_0300_00011, msg_0300_00005, msg_0300_00023, msg_0300_00017 },
    { msg_0300_00012, msg_0300_00006, msg_0300_00024, msg_0300_00018 },
    { msg_0300_00013, msg_0300_00007, msg_0300_00025, msg_0300_00019 },
};

static int _021101A4[][5][2] = {
    {
        {  1,  1 },
        {  0,  0 },
        { -1, -1 },
        { -1, -1 },
        { -1, -1 },
    },
    {
        {  2,  1 },
        {  0,  2 },
        {  1,  0 },
        { -1, -1 },
        { -1, -1 },
    },
    {
        {  3,  1 },
        {  0,  2 },
        {  1,  3 },
        {  2,  0 },
        { -1, -1 },
    },
    {
        {  4,  1 },
        {  0,  2 },
        {  1,  3 },
        {  2,  4 },
        {  3,  0 },
    },
};

static int _02110244[][8][3] = {
    {
        {  1,  1, -1 },
        {  0,  0, -1 },
        { -1, -1, -1 },
        { -1, -1, -1 },
        { -1, -1, -1 },
        { -1, -1, -1 },
        { -1, -1, -1 },
        { -1, -1, -1 },
    },
    {
        {  2,  1, -1 },
        {  0,  2, -1 },
        {  1,  0, -1 },
        { -1, -1, -1 },
        { -1, -1, -1 },
        { -1, -1, -1 },
        { -1, -1, -1 },
        {  2,  0, -1 },
    },
    {
        {  3,  1, -1 },
        {  0,  2, -1 },
        {  1,  3, -1 },
        {  2,  0, -1 },
        { -1, -1, -1 },
        { -1, -1, -1 },
        { -1, -1, -1 },
        {  2,  0, -1 },
    },
    {
        {  3,  1,  4 },
        {  0,  2,  4 },
        {  1,  3,  4 },
        {  2,  0, -1 },
        { -1, -1,  0 },
        { -1, -1, -1 },
        { -1, -1, -1 },
        {  2,  0, -1 },
    },
    {
        {  3,  1,  4 },
        {  0,  2,  5 },
        {  1,  3,  5 },
        {  2,  0, -1 },
        {  5,  5,  0 },
        {  4,  4,  1 },
        { -1, -1, -1 },
        {  2,  0, -1 },
    },
    {
        {  3,  1,  4 },
        {  0,  2,  5 },
        {  1,  3,  6 },
        {  2,  0, -1 },
        {  6,  5,  0 },
        {  4,  6,  1 },
        {  5,  4,  2 },
        {  2,  0, -1 },
    },
    {
        {  3,  1,  4 },
        {  0,  2,  5 },
        {  1,  3,  6 },
        {  2,  0, -1 },
        {  7,  5,  0 },
        {  4,  6,  1 },
        {  5,  7,  2 },
        {  6,  4,  2 },
    },
};

static TouchscreenHitbox _02110180[] = {
    { .rect = { 0x18, 0x38, 0x80, 0x00 } },
    { .rect = { 0x38, 0x58, 0x80, 0x00 } },
    { .rect = { 0x58, 0x78, 0x80, 0x00 } },
    { .rect = { 0x10, 0x30, 0x00, 0x80 } },
    { .rect = { 0x30, 0x50, 0x00, 0x80 } },
    { .rect = { 0x50, 0x70, 0x00, 0x80 } },
    { .rect = { 0x70, 0x90, 0x00, 0x80 } },
    { .rect = { 0x98, 0xC0, 0xC8, 0x00 } },
    { { TOUCHSCREEN_RECTLIST_END } },
};

static TouchscreenHitbox _02110168[] = {
    { .rect = { 0x10, 0x30, 0x80, 0x00 } },
    { .rect = { 0x30, 0x50, 0x80, 0x00 } },
    { .rect = { 0x50, 0x70, 0x80, 0x00 } },
    { .rect = { 0x70, 0x90, 0x80, 0x00 } },
    { .rect = { 0x98, 0xC0, 0xC8, 0x00 } },
    { { TOUCHSCREEN_RECTLIST_END } },
};

void sub_0207CB7C(void) {
    G2_SetBlendBrightness(30, 8);
}

void sub_0207CB90(void) {
    G2_BlendNone();
}

static void sub_0207CB9C(PartyMenuStruct *partyMenu, UnkStruct_0207E590 *a1, int a2) {
    PartyMenuStruct_SubC90 *unk = &partyMenu->unk_C90;

    unk->unk_6_0 = 0;
    unk->unk_6_4 = 0;
    unk->unk_0 = &a1->template;
    unk->unk_4 = a1->unk_2;
    unk->unk_5 = a1->unk_1;
    unk->unk_7 = a1->unk_3;
    unk->unk_8 = a2;
    unk->unk_C = TRUE;
}

void sub_0207CBD0(PartyMenuStruct *partyMenu, int a1, int a2, BOOL a3) {
    PartyMenuStruct_SubC90 *unk = &partyMenu->unk_C90;

    unk->unk_6_0 = 0;
    unk->unk_6_4 = 0;
    unk->unk_0 = NULL;
    unk->unk_5 = a1;
    unk->unk_7 = Get2dSpriteCurrentAnimSeqNo(partyMenu->sprites[a1]) & 2;
    if (a3 == TRUE) {
        Sprite_SetAnimCtrlCurrentFrame(partyMenu->sprites[a1], 0);
        Set2dSpriteAnimSeqNo(partyMenu->sprites[a1], unk->unk_7);
    }
    unk->unk_8 = a2;
    unk->unk_C = TRUE;
}

BOOL sub_0207CC24(PartyMenuStruct *partyMenu) {
    PartyMenuStruct_SubC90 *unk = &partyMenu->unk_C90;

    switch (unk->unk_6_4) {
    case 0:
        if (unk->unk_0 != NULL) {
            sub_0207E3A8(partyMenu, unk->unk_4, unk->unk_5, unk->unk_7, 2);
            sub_0207E28C(partyMenu, unk->unk_0, unk->unk_4, unk->unk_5, unk->unk_7, 0);
            BgCommitTilemapBufferToVram(partyMenu->bgConfig, GF_BG_LYR_MAIN_0);
        } else {
            Sprite_SetAnimCtrlCurrentFrame(partyMenu->sprites[unk->unk_5], 0);
            Set2dSpriteAnimSeqNo(partyMenu->sprites[unk->unk_5], unk->unk_7);
        }
        ++unk->unk_6_4;
        break;
    case 1:
        ++unk->unk_6_0;
        if (unk->unk_6_0 == 2) {
            if (unk->unk_0 != NULL) {
                sub_0207E3A8(partyMenu, unk->unk_4, unk->unk_5, unk->unk_7, 1);
                sub_0207E28C(partyMenu, unk->unk_0, unk->unk_4, unk->unk_5, unk->unk_7, 1);
                BgCommitTilemapBufferToVram(partyMenu->bgConfig, GF_BG_LYR_MAIN_0);
            } else {
                Sprite_SetAnimCtrlCurrentFrame(partyMenu->sprites[unk->unk_5], 0);
                Set2dSpriteAnimSeqNo(partyMenu->sprites[unk->unk_5], unk->unk_7 + 1);
            }
            unk->unk_6_0 = 0;
            ++unk->unk_6_4;
        }
        break;
    case 2:
        ++unk->unk_6_0;
        if (unk->unk_6_0 == 2) {
            unk->unk_C = FALSE;
            return FALSE;
        }
        break;
    }

    return TRUE;
}

static void sub_0207CD84(BgConfig *bgConfig, Window *window, const WindowTemplate *template) {
    AddWindow(bgConfig, &window[0], &template[0]);
    AddWindow(bgConfig, &window[1], &template[1]);
    AddWindow(bgConfig, &window[2], &template[2]);
    AddWindow(bgConfig, &window[3], &template[3]);
    AddWindow(bgConfig, &window[4], &template[4]);
}

void sub_0207CDCC(PartyMenuStruct *partyMenu) {
    const WindowTemplate *r4 = _02101734;
    sub_0207CD84(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_MON1_NICKNAME], &r4[0]);
    sub_0207CD84(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_MON3_NICKNAME], &r4[10]);
    sub_0207CD84(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_MON5_NICKNAME], &r4[20]);
    if (partyMenu->args->unk_25 == 2) {
        sub_0207CD84(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_MON2_NICKNAME], &r4[30]);
        sub_0207CD84(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_MON4_NICKNAME], &r4[35]);
        sub_0207CD84(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_MON6_NICKNAME], &r4[40]);
    } else {
        sub_0207CD84(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_MON2_NICKNAME], &r4[5]);
        sub_0207CD84(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_MON4_NICKNAME], &r4[15]);
        sub_0207CD84(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_MON6_NICKNAME], &r4[25]);
    }
    AddWindow(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_37], &r4[45]);
    AddWindow(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_38], &r4[46]);
    AddWindow(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_39], &r4[47]);
    if (partyMenu->args->context == PARTY_MENU_CONTEXT_2 || partyMenu->args->context == PARTY_MENU_CONTEXT_17 || partyMenu->args->context == PARTY_MENU_CONTEXT_22 || partyMenu->args->context == PARTY_MENU_CONTEXT_23) {
        WindowTemplate template = _0210161C[0];
        template.top = 22;
        AddWindow(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_31], &template);
    } else {
        AddWindow(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_31], &_0210161C[0]);
    }
    AddWindow(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_30], &_0210161C[1]);
    AddWindow(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_32], &_0210161C[2]);
    AddWindow(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_33], &_0210161C[3]);
    AddWindow(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_34], &_0210161C[4]);
    AddWindow(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_35], &_0210161C[5]);
    AddWindow(partyMenu->bgConfig, &partyMenu->windows[PARTY_MENU_WINDOW_ID_36], &_0210161C[6]);
}

void sub_0207CF68(PartyMenuStruct *partyMenu) {
    u16 i;
    for (i = 0; i < 40; ++i) {
        RemoveWindow(&partyMenu->windows[i]);
    }

    for (i = 0; i < 1; ++i){
        Window *win = &partyMenu->levelUpStatsWindow[i];
        if (WindowIsInUse(win) == TRUE) {
            RemoveWindow(win);
        }
    }
}

void PartyMenu_SetContextMenuStaticStrings(PartyMenuStruct *partyMenu) {
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00128, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_SWITCH]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00129, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_SUMMARY]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00130, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_ITEM]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00143, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_GIVE]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00144, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_TAKE]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00131, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_MAIL]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00132, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_READ_MAIL]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00133, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_TAKE_MAIL]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00134, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_STORE]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00135, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_QUIT]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00136, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_UNUSED]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00137, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_ENTER]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00138, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_NO_ENTRY]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00137, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_CONTEST_ENTER]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00149, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_SET]);
    ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00186, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_CONFIRM]);
}

void sub_0207D0A0(PartyMenuStruct *partyMenu, u16 move, u8 index) {
    String *msg = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00139 + index);
    BufferMoveName(partyMenu->msgFormat, 0, move);
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_FIELD_MOVES_BEGIN + index], msg);
    String_Delete(msg);
}

void sub_0207D0E4(PartyMenuStruct *partyMenu, u8 *items, u8 numItems) {
    UnkTemplate_0207E590 sp8;
    u16 i, numFieldMoves;

    partyMenu->listMenuItems = ListMenuItems_New(numItems, HEAP_ID_PARTY_MENU);
    numFieldMoves = 0;
    for (i = 0; i < numItems; ++i) {
        if (items[i] >= PARTY_MON_CONTEXT_MENU_FIELD_MOVES_BEGIN) {
            ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_FIELD_MOVES_BEGIN + numFieldMoves], sub_0207F42C(items[i]));
            ++numFieldMoves;
        } else {
            ListMenuItems_AddItem(partyMenu->listMenuItems, partyMenu->contextMenuStrings[items[i]], sub_0207F42C(items[i]));
        }
    }

    sp8.unk_00 = partyMenu->listMenuItems;
    sp8.unk_04 = &partyMenu->levelUpStatsWindow[0];
    sp8.unk_08 = 0;
    sp8.unk_09 = 1;
    sp8.unk_0A = numItems;
    sp8.unk_0B_0 = 0;
    sp8.unk_0B_4 = 0;
    if (numItems >= 4) {
        sp8.unk_0B_6 = 1;
    } else {
        sp8.unk_0B_6 = 0;
    }
    sub_0207E54C(partyMenu, sp8.unk_0A, 0, 0);
    partyMenu->unk_824 = sub_0207E590(partyMenu, &sp8, 0, HEAP_ID_PARTY_MENU, 0);
}

void sub_0207D1C8(PartyMenuStruct *partyMenu) {
    if (partyMenu->args->context == PARTY_MENU_CONTEXT_15) {
        ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00043, partyMenu->formattedStrBuf);
    } else if (partyMenu->args->context == PARTY_MENU_CONTEXT_21 && partyMenu->monsDrawState[partyMenu->partyMonIndex].isEgg == TRUE) {
        ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00183, partyMenu->formattedStrBuf);
    } else {
        Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
        String *msg = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00038);
        BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, msg);
        String_Delete(msg);
    }
}

static void PartyMenu_DrawSlashOnMonHpTextWindow(PartyMenuStruct *partyMenu, u8 partySlot) {
    sub_0200CDAC(partyMenu->msgPrinter, 0, &partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPTEXT], 28, 2);
}

void PartyMenu_BufferMonNickname(PartyMenuStruct *partyMenu, Pokemon *mon, u32 partySlot) {
    String *msg = NewString_ReadMsgData(partyMenu->msgData, _021015BC[partySlot][0]);
    BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->monsDrawState[partySlot].nickname, msg);
    String_Delete(msg);
}

static void PartyMenu_PrintMonNicknameOnWindow(PartyMenuStruct *partyMenu, u8 partySlot) {
    Window *window = &partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_NICKNAME];

    AddTextPrinterParameterizedWithColor(window, 0, partyMenu->monsDrawState[partySlot].nickname, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    if (partyMenu->monsDrawState[partySlot].isEgg == TRUE) {
        ScheduleWindowCopyToVram(window);
    } else {
        FillWindowPixelBuffer(&partyMenu->windows[PARTY_MENU_WINDOW_ID_38], 0);
        AddTextPrinterParameterizedWithColor(&partyMenu->windows[PARTY_MENU_WINDOW_ID_38], 0, partyMenu->contextMenuStrings[PARTY_MON_CONTEXT_MENU_ITEM], 2, 0, TEXT_SPEED_INSTANT, MAKE_TEXT_COLOR(15, 14, 0), NULL);
        if (!partyMenu->monsDrawState[partySlot].dontPrintGenderSymbol) {
            if (partyMenu->monsDrawState[partySlot].gender == MON_MALE) {
                ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00027, partyMenu->unformattedStrBuf);
                AddTextPrinterParameterizedWithColor(window, 0, partyMenu->unformattedStrBuf, 64, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(3, 4, 0), NULL);
            } else if (partyMenu->monsDrawState[partySlot].gender == MON_FEMALE) {
                ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00028, partyMenu->unformattedStrBuf);
                AddTextPrinterParameterizedWithColor(window, 0, partyMenu->unformattedStrBuf, 64, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(5, 6, 0), NULL);
            }
        }
        ScheduleWindowCopyToVram(window);
    }
}

void PartyMenu_PrintMonLevelOnWindow(PartyMenuStruct *partyMenu, u8 partySlot) {
    Window *window = &partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_LEVEL];

    if (partyMenu->monsDrawState[partySlot].status != PARTY_MON_STATUS_ICON_OK) {
        ScheduleWindowCopyToVram(window);
    } else {
        sub_0200CE7C(partyMenu->msgPrinter, 1, partyMenu->monsDrawState[partySlot].level, 3, PRINTING_MODE_LEFT_ALIGN, window, 5, 2);
        ScheduleWindowCopyToVram(window);
    }
}

void PartyMenu_PrintMonCurHpOnWindow(PartyMenuStruct *partyMenu, u8 partySlot) {
    Window *window = &partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPTEXT];

    PrintUIntOnWindow(partyMenu->msgPrinter, partyMenu->monsDrawState[partySlot].hp, 3, PRINTING_MODE_RIGHT_ALIGN, window, 0, 2);
    ScheduleWindowCopyToVram(window);
}

void PartyMenu_ClearMonHpTextWindow(PartyMenuStruct *partyMenu, u8 partySlot) {
    Window *window = &partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPTEXT];

    FillWindowPixelRect(window, 0, 0, 0, 24, 16);
    ScheduleWindowCopyToVram(window);
}

static void PartyMenu_PrintMonMaxHpOnWindow(PartyMenuStruct *partyMenu, u8 partySlot) {
    Window *window = &partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPTEXT];

    PrintUIntOnWindow(partyMenu->msgPrinter, partyMenu->monsDrawState[partySlot].maxHp, 3, PRINTING_MODE_LEFT_ALIGN, window, 36, 2);
    ScheduleWindowCopyToVram(window);
}

void PartyMenu_DrawMonHpBarOnWindow(PartyMenuStruct *partyMenu, u8 partySlot) {
    Window *window = &partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPBAR];

    switch (CalculateHpBarColor(partyMenu->monsDrawState[partySlot].hp, partyMenu->monsDrawState[partySlot].maxHp, 48)) {
    case 0:
        ScheduleWindowCopyToVram(window);
        return;
    case 4:
    case 3:
        BG_LoadPlttData(1, &partyMenu->unk_554[9], 4, (window->paletteNum * 16 + 9) * sizeof(u16));
        break;
    case 2:
        BG_LoadPlttData(1, &partyMenu->unk_554[16 + 9], 4, (window->paletteNum * 16 + 9) * sizeof(u16));
        break;
    case 1:
        BG_LoadPlttData(1, &partyMenu->unk_554[32 + 9], 4, (window->paletteNum * 16 + 9) * sizeof(u16));
        break;
    }

    u8 barLength = CalculateHpBarPixelsLength(partyMenu->monsDrawState[partySlot].hp, partyMenu->monsDrawState[partySlot].maxHp, 48);
    FillWindowPixelRect(window, 10, 0, 2, barLength, 1);
    FillWindowPixelRect(window, 9, 0, 3, barLength, 2);
    FillWindowPixelRect(window, 10, 0, 5, barLength, 1);
    ScheduleWindowCopyToVram(window);
}

void sub_0207D5DC(PartyMenuStruct *partyMenu, u8 partySlot) {
    FillWindowPixelBuffer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_NICKNAME], 0);
    FillWindowPixelBuffer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_LEVEL], 0);
    FillWindowPixelBuffer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPTEXT], 0);
    FillWindowPixelBuffer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPBAR], 0);
    PartyMenu_PrintMonNicknameOnWindow(partyMenu, partySlot);
    if (partyMenu->monsDrawState[partySlot].isEgg == TRUE) {
        ScheduleWindowCopyToVram(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_NICKNAME]);
        ScheduleWindowCopyToVram(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_LEVEL]);
        ScheduleWindowCopyToVram(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPTEXT]);
        ScheduleWindowCopyToVram(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPBAR]);
    } else {
        PartyMenu_DrawSlashOnMonHpTextWindow(partyMenu, partySlot);
        PartyMenu_PrintMonLevelOnWindow(partyMenu, partySlot);
        PartyMenu_PrintMonCurHpOnWindow(partyMenu, partySlot);
        PartyMenu_PrintMonMaxHpOnWindow(partyMenu, partySlot);
        PartyMenu_DrawMonHpBarOnWindow(partyMenu, partySlot);
    }
}

void sub_0207D6A0(PartyMenuStruct *partyMenu, u8 partySlot) {
    CopyWindowPixelsToVram_TextMode(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_NICKNAME]);
    CopyWindowPixelsToVram_TextMode(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_LEVEL]);
    CopyWindowPixelsToVram_TextMode(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPTEXT]);
    CopyWindowPixelsToVram_TextMode(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPBAR]);
}

void sub_0207D6D8(PartyMenuStruct *partyMenu, u8 partySlot) {
    ClearWindowTilemapAndScheduleTransfer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_NICKNAME]);
    ClearWindowTilemapAndScheduleTransfer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_LEVEL]);
    ClearWindowTilemapAndScheduleTransfer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPTEXT]);
    ClearWindowTilemapAndScheduleTransfer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_HPBAR]);
}

void sub_0207D710(PartyMenuStruct *partyMenu, u8 partySlot) {
    FillWindowPixelBuffer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_NICKNAME], 0);
    FillWindowPixelBuffer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_LEVEL], 0);
    PartyMenu_PrintMonNicknameOnWindow(partyMenu, partySlot);
    if (partyMenu->monsDrawState[partySlot].isEgg == TRUE) {
        sub_0207DC20(partyMenu, partySlot, 1);
    } else {
        PartyMenu_PrintMonLevelOnWindow(partyMenu, partySlot);
        Pokemon *mon = Party_GetMonByIndex(partyMenu->args->party, partySlot);
        if (!GetMonEvolution(NULL, mon, EVOCTX_ITEM_USE, partyMenu->args->itemId, NULL)) {
            sub_0207DC20(partyMenu, partySlot, 1);
        } else {
            sub_0207DC20(partyMenu, partySlot, 0);
        }
    }
}

void sub_0207D7A8(PartyMenuStruct *partyMenu, u8 partySlot) {
    FillWindowPixelBuffer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_NICKNAME], 0);
    FillWindowPixelBuffer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_LEVEL], 0);
    PartyMenu_PrintMonNicknameOnWindow(partyMenu, partySlot);
    if (partyMenu->monsDrawState[partySlot].isEgg == TRUE) {
        sub_0207DC90(partyMenu, partySlot, 1);
    } else {
        PartyMenu_PrintMonLevelOnWindow(partyMenu, partySlot);
        u8 x = sub_020820DC(partyMenu, Party_GetMonByIndex(partyMenu->args->party, partySlot));
        if (x == 0xFF) {
            sub_0207DC90(partyMenu, partySlot, 1);
        } else if (x == 0xFD) {
            sub_0207DC90(partyMenu, partySlot, 2);
        } else {
            sub_0207DC90(partyMenu, partySlot, 0);
        }
    }
}

void sub_0207D840(PartyMenuStruct *partyMenu, u8 partySlot) {
    FillWindowPixelBuffer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_NICKNAME], 0);
    FillWindowPixelBuffer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_LEVEL], 0);
    PartyMenu_PrintMonNicknameOnWindow(partyMenu, partySlot);
    if (partyMenu->monsDrawState[partySlot].isEgg != TRUE) {
        PartyMenu_PrintMonLevelOnWindow(partyMenu, partySlot);
    }
    sub_0207DD14(partyMenu, partySlot, partyMenu->monsDrawState[partySlot].isCompatible);
}

void sub_0207D8A4(PartyMenuStruct *partyMenu, u8 partySlot) {
    FillWindowPixelBuffer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_NICKNAME], 0);
    FillWindowPixelBuffer(&partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_LEVEL], 0);
    PartyMenu_PrintMonNicknameOnWindow(partyMenu, partySlot);
    if (partyMenu->monsDrawState[partySlot].isEgg != TRUE) {
        PartyMenu_PrintMonLevelOnWindow(partyMenu, partySlot);
    }
}

void sub_0207D8EC(PartyMenuStruct *partyMenu, u8 partySlot) {
    for (u8 i = 0; i < partyMenu->args->unk_36_4; ++i) {
        if (partyMenu->args->selectedOrder[i] == partySlot + 1) {
            sub_0207DD7C(partyMenu, partySlot, i);
            return;
        }
    }

    if (partyMenu->args->context == PARTY_MENU_CONTEXT_22) {
        if (sub_0207B418(partyMenu, partySlot) == 0) {
            sub_0207DD7C(partyMenu, partySlot, 8);
            return;
        }
    } else if (partyMenu->args->context == PARTY_MENU_CONTEXT_23) {
        if (sub_0207B4A0(partyMenu, partySlot) == 0) {
            sub_0207DD7C(partyMenu, partySlot, 8);
            return;
        }
    } else {
        if (sub_0207B364(partyMenu, partySlot) == 0) {
            sub_0207DD7C(partyMenu, partySlot, 8);
            return;
        }
    }

    sub_0207DD7C(partyMenu, partySlot, 7);
}

static u32 sub_0207D988(FontID fontId, String *string, u32 windowWidth) {
    return (windowWidth - FontID_String_GetWidth(fontId, string, 0)) / 2;
}

void sub_0207D998(PartyMenuStruct *partyMenu, u8 a1) {
    FillWindowPixelBuffer(&partyMenu->windows[PARTY_MENU_WINDOW_ID_30], 0);
    FillWindowPixelBuffer(&partyMenu->windows[PARTY_MENU_WINDOW_ID_31], 0);
    if (a1 & 1) {
        ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00000, partyMenu->unformattedStrBuf);
        AddTextPrinterParameterizedWithColor(&partyMenu->windows[PARTY_MENU_WINDOW_ID_30], 0, partyMenu->unformattedStrBuf, sub_0207D988(0, partyMenu->unformattedStrBuf, partyMenu->windows[PARTY_MENU_WINDOW_ID_30].width * 8), 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
        ScheduleWindowCopyToVram(&partyMenu->windows[PARTY_MENU_WINDOW_ID_30]);
    }
    if (a1 & 2) {
        ReadMsgDataIntoString(partyMenu->msgData, msg_0300_00001, partyMenu->unformattedStrBuf);
        AddTextPrinterParameterizedWithColor(&partyMenu->windows[PARTY_MENU_WINDOW_ID_31], 0, partyMenu->unformattedStrBuf, sub_0207D988(0, partyMenu->unformattedStrBuf, partyMenu->windows[PARTY_MENU_WINDOW_ID_31].width * 8), 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
        ScheduleWindowCopyToVram(&partyMenu->windows[PARTY_MENU_WINDOW_ID_31]);
    }
}

static void sub_0207DA64(PartyMenuStruct *partyMenu, Window *window, int msgId, BOOL drawFrame) {
    if (drawFrame == TRUE) {
        DrawFrameAndWindow2(window, TRUE, 0x02A, 15);
    }
    FillWindowPixelBuffer(window, 15);
    if (msgId != -1) {
        ReadMsgDataIntoString(partyMenu->msgData, msgId, partyMenu->formattedStrBuf);
    }
    AddTextPrinterParameterized(window, 1, partyMenu->formattedStrBuf, 0, 0, TEXT_SPEED_NOTRANSFER, NULL);
    ScheduleWindowCopyToVram(window);
}

void sub_0207DAC4(PartyMenuStruct *partyMenu, int msgId, BOOL drawFrame) {
    sub_0207DA64(partyMenu, &partyMenu->windows[PARTY_MENU_WINDOW_ID_32], msgId, drawFrame);
}

void sub_0207DAD8(PartyMenuStruct *partyMenu, int msgId, BOOL drawFrame) {
    sub_0207DA64(partyMenu, &partyMenu->windows[PARTY_MENU_WINDOW_ID_33], msgId, drawFrame);
}

void sub_0207DAEC(PartyMenuStruct *partyMenu, int msgId, BOOL drawFrame) {
    Window *window = &partyMenu->windows[PARTY_MENU_WINDOW_ID_34];
    if (drawFrame == TRUE) {
        DrawFrameAndWindow2(window, TRUE, 0x02A, 15);
    }
    FillWindowPixelBuffer(window, 15);
    if (msgId != -1) {
        ReadMsgDataIntoString(partyMenu->msgData, msgId, partyMenu->formattedStrBuf);
    }
    sub_0207DB30(partyMenu);
}

void sub_0207DB30(PartyMenuStruct *partyMenu) {
    TextFlags_SetCanABSpeedUpPrint(TRUE);
    sub_02002B50(0);
    partyMenu->textPrinterId = AddTextPrinterParameterized(&partyMenu->windows[PARTY_MENU_WINDOW_ID_34], 1, partyMenu->formattedStrBuf, 0, 0, Options_GetTextFrameDelay(partyMenu->args->options), sub_0207DB80);
}

static BOOL sub_0207DB80(TextPrinterTemplate *template, u16 glyphId) {
    switch (glyphId) {
    case 0:
        break;
    case 1:
        return GF_IsAnySEPlaying();
    case 2:
        return IsFanfarePlaying();
    case 3:
        PlaySE(SEQ_SE_DP_KON);
        break;
    case 4:
        PlayFanfare(SEQ_ME_LVUP);
        break;
    case 5:
        return IsSEPlaying(SEQ_SE_DP_KON);
    }

    return FALSE;
}

void sub_0207DBCC(PartyMenuStruct *partyMenu) {
    YesNoPromptTemplate template;

    partyMenu->yesNoPrompt = YesNoPrompt_Create(HEAP_ID_PARTY_MENU);

    template.bgConfig = partyMenu->bgConfig;
    template.bgId = GF_BG_LYR_MAIN_0;
    template.tileStart = 0x260;
    template.plttSlot = 11;
    template.x = 25;
    template.y = 10;
    template.ignoreTouchFlag = FALSE;
    template.initialCursorPos = 0;
    template.shapeParam = 0;
    YesNoPrompt_InitFromTemplate(partyMenu->yesNoPrompt, &template);
    sub_0207CB7C();
}

static void sub_0207DC20(PartyMenuStruct *partyMenu, u8 partySlot, u8 a2) {
    Window *window = &partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_COMPAT];
    String *string;

    FillWindowPixelBuffer(window, 0);
    switch (a2) {
    case 0: // ABLE!
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00161);
        break;
    case 1: // UNABLE!
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00162);
        break;
    }
    // potential UB: in default case, string is uninitialized
    AddTextPrinterParameterizedWithColor(window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);
    ScheduleWindowCopyToVram(window);
}

static void sub_0207DC90(PartyMenuStruct *partyMenu, u8 partySlot, u8 compatibilityParam) {
    Window *window = &partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_COMPAT];
    String *string;

    FillWindowPixelBuffer(window, 0);
    switch (compatibilityParam) {
    case 0: // ABLE!
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00158);
        break;
    case 1: // UNABLE!
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00159);
        break;
    case 2: // LEARNED
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00160);
        break;
    }
    // potential UB: in default case, string is uninitialized
    AddTextPrinterParameterizedWithColor(window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);
    ScheduleWindowCopyToVram(window);
}

static void sub_0207DD14(PartyMenuStruct *partyMenu, u8 partySlot, u8 isCompatible) {
    Window *window = &partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_COMPAT];
    String *string;

    FillWindowPixelBuffer(window, 0);
    if (isCompatible == FALSE) {
        // UNABLE
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00164);
    } else {
        // ABLE
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00163);
    }
    AddTextPrinterParameterizedWithColor(window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);
    ScheduleWindowCopyToVram(window);
}

static void sub_0207DD7C(PartyMenuStruct *partyMenu, u8 partySlot, u8 a2) {
    Window *window = &partyMenu->windows[partySlot * PARTY_MENU_WINDOWS_PER_MON + PARTY_MENU_WINDOW_ID_MON1_COMPAT];
    String *string;

    FillWindowPixelBuffer(window, 0);
    if (a2 < 6) {
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00152 + a2);
    } else if (a2 == 7) {
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00150);
    } else {
        string = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00151);
    }
    AddTextPrinterParameterizedWithColor(window, 0, string, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(string);
    ScheduleWindowCopyToVram(window);
}

void PartyMenu_LevelUpPrintStatsChange(PartyMenuStruct *partyMenu) {
    u16 stats[NUM_STATS];
    String *str_formatInt;
    String *str_statName;
    String *str_plusSign;
    u32 i;
    Pokemon *mon;

    mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    stats[0] = GetMonData(mon, MON_DATA_MAXHP, NULL);
    stats[1] = GetMonData(mon, MON_DATA_ATK, NULL);
    stats[2] = GetMonData(mon, MON_DATA_DEF, NULL);
    stats[3] = GetMonData(mon, MON_DATA_SPATK, NULL);
    stats[4] = GetMonData(mon, MON_DATA_SPDEF, NULL);
    stats[5] = GetMonData(mon, MON_DATA_SPEED, NULL);
    AddWindowParameterized(partyMenu->bgConfig, &partyMenu->levelUpStatsWindow[0], GF_BG_LYR_MAIN_0, 1, 1, 14, 12, 0, 0x260);
    DrawFrameAndWindow1(&partyMenu->levelUpStatsWindow[0], TRUE, 1, 14);
    FillWindowPixelBuffer(&partyMenu->levelUpStatsWindow[0], 15);
    str_plusSign = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00175);
    for (i = 0; i < NUM_STATS; ++i) {
        str_statName = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00169 + i);
        AddTextPrinterParameterized(&partyMenu->levelUpStatsWindow[0], 0, str_statName, 0, i * 16, TEXT_SPEED_NOTRANSFER, NULL);
        String_Delete(str_statName);

        AddTextPrinterParameterized(&partyMenu->levelUpStatsWindow[0], 0, str_plusSign, 80, i * 16, TEXT_SPEED_NOTRANSFER, NULL);

        str_formatInt = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00176);
        BufferIntegerAsString(partyMenu->msgFormat, 0, stats[i] - partyMenu->unk_C68[i], 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, str_formatInt);
        String_Delete(str_formatInt);
        AddTextPrinterParameterized(&partyMenu->levelUpStatsWindow[0], 0, partyMenu->formattedStrBuf, 94, i * 16, TEXT_SPEED_NOTRANSFER, NULL);

        partyMenu->unk_C68[i] = stats[i];
    }
    String_Delete(str_plusSign);
    ScheduleWindowCopyToVram(&partyMenu->levelUpStatsWindow[0]);
}

void sub_0207DF98(PartyMenuStruct *partyMenu) {
    String *spC;
    u32 i;

    FillWindowPixelRect(&partyMenu->levelUpStatsWindow[0], 15, 80, 0, 32, 112);
    spC = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00176);
    for (i = 0; i < NUM_STATS; ++i) {
        BufferIntegerAsString(partyMenu->msgFormat, 0, partyMenu->unk_C68[i], 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, spC);
        AddTextPrinterParameterized(&partyMenu->levelUpStatsWindow[0], 0, partyMenu->formattedStrBuf, 104 - FontID_String_GetWidth(0, partyMenu->formattedStrBuf, 0), i * 16, TEXT_SPEED_NOTRANSFER, NULL);
    }
    String_Delete(spC);
    ScheduleWindowCopyToVram(&partyMenu->levelUpStatsWindow[0]);
}

void sub_0207E04C(PartyMenuStruct *partyMenu) {
    sub_0200E5D4(&partyMenu->levelUpStatsWindow[0], FALSE);
    RemoveWindow(&partyMenu->levelUpStatsWindow[0]);
}

void sub_0207E068(PartyMenuStruct *partyMenu) {
    Pokemon *mon;
    String *msg;

    FillWindowPixelBuffer(&partyMenu->windows[PARTY_MENU_WINDOW_ID_37], 0);
    FillWindowPixelBuffer(&partyMenu->windows[PARTY_MENU_WINDOW_ID_39], 0);

    mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    msg = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00008);
    BufferBoxMonNickname(partyMenu->msgFormat, 0, Mon_GetBoxMon(mon));
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, msg);
    AddTextPrinterParameterizedWithColor(&partyMenu->windows[PARTY_MENU_WINDOW_ID_37], 0, partyMenu->formattedStrBuf, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(msg);

    mon = Party_GetMonByIndex(partyMenu->args->party, partyMenu->partyMonIndex);
    msg = NewString_ReadMsgData(partyMenu->msgData, msg_0300_00182);
    BufferItemName(partyMenu->msgFormat, 1, GetMonData(mon, MON_DATA_HELD_ITEM, NULL));
    StringExpandPlaceholders(partyMenu->msgFormat, partyMenu->formattedStrBuf, msg);
    AddTextPrinterParameterizedWithColor(&partyMenu->windows[PARTY_MENU_WINDOW_ID_39], 0, partyMenu->formattedStrBuf, 2, 4, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(15, 14, 0), NULL);
    String_Delete(msg);

    ScheduleWindowCopyToVram(&partyMenu->windows[PARTY_MENU_WINDOW_ID_37]);
    ScheduleWindowCopyToVram(&partyMenu->windows[PARTY_MENU_WINDOW_ID_39]);
}

static void sub_0207E17C(PartyMenuStruct *partyMenu, int a1, int a2) {
    GF_ASSERT(a1 <= 8);
    for (int i = 0; i < a1; ++i) {
        AddWindow(partyMenu->bgConfig, &partyMenu->unk_294[_021016B4[a1 - 1][a2][i]], &_02101654[_021016B4[a1 - 1][a2][i]]);
        FillWindowPixelBuffer(&partyMenu->unk_294[_021016B4[a1 - 1][a2][i]], 4);
    }
}

static void sub_0207E1DC(PartyMenuStruct *partyMenu, int a1, int a2) {
    GF_ASSERT(a1 <= 8);
    for (int i = 0; i < a1; ++i) {
        RemoveWindow(&partyMenu->unk_294[_021016B4[a1 - 1][a2][i]]);
    }
    FillBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_0, 0, 0, 0, 32, 18, 0);
    FillBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_0, 0, 25, 19, 7, 5, 0);
    BgCommitTilemapBufferToVram(partyMenu->bgConfig, GF_BG_LYR_MAIN_0);
}

static u32 sub_0207E264(int a0) {
    if (a0 < 4) {
        return MAKE_TEXT_COLOR(14, 15, 11);
    } else {
        return MAKE_TEXT_COLOR(9, 10, 11);
    }
}

static u32 sub_0207E278(int a0) {
    if (a0 < 4) {
        return MAKE_TEXT_COLOR(14, 15, 4);
    } else {
        return MAKE_TEXT_COLOR(9, 10, 4);
    }
}

static void sub_0207E28C(PartyMenuStruct *partyMenu, UnkTemplate_0207E590 *a1, int a2, int a3, int a4, int a5) {
    u32 color;
    u32 y;
    u32 x = 0;
    u32 fillValue;
    u8 windowId;

    windowId = _021016B4[a2 - 1][a4][a3];
    if (windowId == 7) {
        if (a5 == FALSE) {
            fillValue = 4;
            color = MAKE_TEXT_COLOR(14, 15, 4);
        } else {
            fillValue = 11;
            color = MAKE_TEXT_COLOR(14, 15, 11);
        }
        y = 4;
        x = FontID_String_GetCenterAlignmentX(4, a1->unk_00[a3].text, 0, GetWindowWidth(&partyMenu->unk_294[windowId]) * 8);
    } else {
        if (a5 == FALSE) {
            fillValue = 4;
            color = sub_0207E278(a3);
        } else {
            fillValue = 11;
            color = sub_0207E264(a3);
        }
        y = 0;
    }
    FillWindowPixelBuffer(&partyMenu->unk_294[windowId], fillValue);
    AddTextPrinterParameterizedWithColor(&partyMenu->unk_294[windowId], 4, a1->unk_00[a3].text, x, y, TEXT_SPEED_NOTRANSFER, color, NULL);
    ScheduleWindowCopyToVram(&partyMenu->unk_294[windowId]);
}

static void sub_0207E358(PartyMenuStruct *partyMenu, UnkTemplate_0207E590 *a1, int a2, int a3, int a4) {
    GF_ASSERT(a2 <= 8);
    for (int i = 0; i < a2; ++i) {
        if (a3 == i) {
            sub_0207E28C(partyMenu, a1, a2, i, a4, 1);
        } else {
            sub_0207E28C(partyMenu, a1, a2, i, a4, 0);
        }
    }
}

static void sub_0207E3A8(PartyMenuStruct *partyMenu, int a1, int a2, int a3, int a4) {
    u16 i;
    u16 sp10[8];
    const u8 *r4 = _021015EC[_021016B4[a1 - 1][a3][a2]];
    u32 tileStart;
    if (a4 == 0) {
        tileStart = 0x2000;
    } else if (a4 == 1) {
        tileStart = 0x2009;
    } else {
        tileStart = 0x2012;
    }
    tileStart += 10;

    for (i = 0; i < 8; ++i) {
        sp10[i] = tileStart + _021015AC[i];
    }
    LoadRectToBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_0, &sp10[0], r4[0], r4[1], 1, 1);
    LoadRectToBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_0, &sp10[1], r4[0] + r4[2] - 1, r4[1], 1, 1);
    LoadRectToBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_0, &sp10[2], r4[0], r4[1] + r4[3] - 1, 1, 1);
    LoadRectToBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_0, &sp10[3], r4[0] + r4[2] - 1, r4[1] + r4[3] - 1, 1, 1);
    FillBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_0, sp10[4], r4[0], r4[1] + 1, 1, r4[3] - 2, TILEMAP_FILL_OVWT_PAL);
    FillBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_0, sp10[5], r4[0] + r4[2] - 1, r4[1] + 1, 1, r4[3] - 2, TILEMAP_FILL_OVWT_PAL);
    FillBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_0, sp10[6], r4[0] + 1, r4[1], r4[2] - 2, 1, TILEMAP_FILL_OVWT_PAL);
    FillBgTilemapRect(partyMenu->bgConfig, GF_BG_LYR_MAIN_0, sp10[7], r4[0] + 1, r4[1] + r4[3] - 1, r4[2] - 2, 1, TILEMAP_FILL_OVWT_PAL);
}

void sub_0207E54C(PartyMenuStruct *partyMenu, int a1, int a2, int a3) {
    for (int i = 0; i < a1; ++i) {
        if (a2 == i) {
            sub_0207E3A8(partyMenu, a1, i, a3, 1);
        } else {
            sub_0207E3A8(partyMenu, a1, i, a3, 0);
        }
    }
}

UnkStruct_0207E590 *sub_0207E590(PartyMenuStruct *partyMenu, const UnkTemplate_0207E590 *template, int a2, HeapID heapId, int a4) {
    UnkStruct_0207E590 *ret = AllocFromHeap(heapId, sizeof(UnkStruct_0207E590));
    ret->template = *template;
    ret->unk_2 = ret->template.unk_0A;
    ret->unk_0 = a2;
    ret->unk_1 = a2;
    ret->unk_3 = a4;
    sub_0207E17C(partyMenu, ret->template.unk_0A, ret->unk_3);
    sub_0207E358(partyMenu, &ret->template, ret->template.unk_0A, ret->unk_0, ret->unk_3);
    sub_0207CB7C();
    Set2dSpriteVisibleFlag(partyMenu->sprites[9], FALSE);
    if (partyMenu->args->context == PARTY_MENU_CONTEXT_2 || partyMenu->args->context == PARTY_MENU_CONTEXT_17 || partyMenu->args->context == PARTY_MENU_CONTEXT_22 || partyMenu->args->context == PARTY_MENU_CONTEXT_23) {
        Set2dSpriteVisibleFlag(partyMenu->sprites[8], FALSE);
    }
    return ret;
}

void sub_0207E618(PartyMenuStruct *partyMenu, UnkStruct_0207E590 *a1) {
    sub_0207E1DC(partyMenu, a1->unk_2, a1->unk_3);
    FreeToHeap(a1);
    if (partyMenu->args->context == PARTY_MENU_CONTEXT_4 || partyMenu->args->context == PARTY_MENU_CONTEXT_21) {
        Set2dSpriteVisibleFlag(partyMenu->sprites[9], FALSE);
    } else {
        Set2dSpriteVisibleFlag(partyMenu->sprites[9], TRUE);
    }
    if (partyMenu->args->context == PARTY_MENU_CONTEXT_2 || partyMenu->args->context == PARTY_MENU_CONTEXT_17 || partyMenu->args->context == PARTY_MENU_CONTEXT_22 || partyMenu->args->context == PARTY_MENU_CONTEXT_23) {
        Set2dSpriteVisibleFlag(partyMenu->sprites[8], TRUE);
    }
}

static BOOL sub_0207E684(int a0, int a1, int a2) {
    for (int i = 0; i < 8; ++i) {
        if (a2 == _021016B4[a1 - 1][a0][i]) {
            return TRUE;
        }
    }

    return FALSE;
}

static int sub_0207E6B4(int a0, int a1, int a2) {
    for (int i = 0; i < 8; ++i) {
        if (a2 == _021016B4[a1 - 1][a0][i]) {
            return i;
        }
    }

    return LIST_NOTHING_CHOSEN;
}

static BOOL sub_0207E6E8(int a0, int a1, int a2) {
    if (_021016B4[a1 - 1][a0][a2] != -1 && _021016B4[a1 - 1][a0][a2] != 7) {
        return TRUE;
    } else {
        return FALSE;
    }
}

static BOOL sub_0207E714(u8 *a0, int a1, int a2) {
    if (_02110244[a1 - 2][*a0][a2] != -1) {
        *a0 = _02110244[a1 - 2][*a0][a2];
        return TRUE;
    } else {
        return FALSE;
    }
}

static BOOL sub_0207E748(u8 *a0, int a1, int a2) {
    if (_021101A4[a1 - 2][*a0][a2] != -1) {
        *a0 = _021101A4[a1 - 2][*a0][a2];
        return TRUE;
    } else {
        return FALSE;
    }
}

u32 sub_0207E778(PartyMenuStruct *partyMenu, UnkStruct_0207E590 *a1) {
    PartyMenuStruct_SubC90 *unkC90 = &partyMenu->unk_C90;
    int r4 = 0;

    if (unkC90->unk_C == TRUE) {
        if (sub_0207CC24(partyMenu) == FALSE) {
            return unkC90->unk_8;
        } else {
            return LIST_NOTHING_CHOSEN;
        }
    }

    int hitbox = TouchscreenHitbox_FindRectAtTouchNew(_02110180);
    if (hitbox != -1) {
        if (sub_0207E684(a1->unk_3, a1->unk_2, hitbox) == TRUE) {
            if (hitbox == 7) {
                PlaySE(SEQ_SE_GS_GEARCANCEL);
            } else {
                PlaySE(SEQ_SE_DP_SELECT);
            }
            sub_0207E3A8(partyMenu, a1->unk_2, a1->unk_1, a1->unk_3, 0);
            sub_0207E28C(partyMenu, &a1->template, a1->unk_2, a1->unk_1, a1->unk_3, 0);
            a1->unk_1 = sub_0207E6B4(a1->unk_3, a1->unk_2, hitbox);
            sub_0207CB9C(partyMenu, a1, a1->template.unk_00[a1->unk_1].value);
            return LIST_NOTHING_CHOSEN;
        }
    } else {
        if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
            if (sub_0207E714(&a1->unk_1, a1->unk_2, 0)) {
                ++r4;
            }
        } else if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
            if (sub_0207E714(&a1->unk_1, a1->unk_2, 1)) {
                ++r4;
            }
        } else if (gSystem.newAndRepeatedKeys & PAD_KEY_LEFT || gSystem.newAndRepeatedKeys & PAD_KEY_RIGHT) {
            if (sub_0207E714(&a1->unk_1, a1->unk_2, 2)) {
                ++r4;
            }
        } else if (gSystem.newKeys & PAD_BUTTON_A) {
            if (a1->unk_1 == sub_0207E6B4(a1->unk_3, a1->unk_2, 7)) {
                PlaySE(SEQ_SE_GS_GEARCANCEL);
            } else {
                PlaySE(SEQ_SE_DP_SELECT);
            }
            sub_0207CB9C(partyMenu, a1, a1->template.unk_00[a1->unk_1].value);
            return LIST_NOTHING_CHOSEN;
        } else if (gSystem.newKeys & PAD_BUTTON_B) {
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            sub_0207E3A8(partyMenu, a1->unk_2, a1->unk_1, a1->unk_3, 0);
            sub_0207E28C(partyMenu, &a1->template, a1->unk_2, a1->unk_1, a1->unk_3, 0);
            a1->unk_1 = sub_0207E6B4(a1->unk_3, a1->unk_2, 7);
            sub_0207CB9C(partyMenu, a1, LIST_CANCEL);
            return LIST_NOTHING_CHOSEN;
        }
    }

    if (r4) {
        PlaySE(SEQ_SE_DP_SELECT);
        sub_0207E54C(partyMenu, a1->unk_2, a1->unk_1, a1->unk_3);
        sub_0207E358(partyMenu, &a1->template, a1->unk_2, a1->unk_1, a1->unk_3);
    }

    return LIST_NOTHING_CHOSEN;
}

u32 sub_0207E93C(PartyMenuStruct *partyMenu, UnkStruct_0207E590 *a1) {
    PartyMenuStruct_SubC90 *unkC90 = &partyMenu->unk_C90;
    int r6 = 0;

    if (unkC90->unk_C == TRUE) {
        if (sub_0207CC24(partyMenu) == FALSE) {
            return unkC90->unk_8;
        } else {
            return LIST_NOTHING_CHOSEN;
        }
    }

    int hitbox = TouchscreenHitbox_FindRectAtTouchNew(_02110168);
    if (hitbox != -1) {
        if (hitbox == 4) {
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            sub_0207E3A8(partyMenu, a1->unk_2, a1->unk_1, a1->unk_3, 0);
            sub_0207E28C(partyMenu, &a1->template, a1->unk_2, a1->unk_1, a1->unk_3, 0);
            a1->unk_1 = a1->unk_2 - 1;
            sub_0207CB9C(partyMenu, a1, LIST_CANCEL);
            return LIST_NOTHING_CHOSEN;
        } else if (sub_0207E6E8(a1->unk_3, a1->unk_2, hitbox) == TRUE) {
            PlaySE(SEQ_SE_DP_SELECT);
            sub_0207E3A8(partyMenu, a1->unk_2, a1->unk_1, a1->unk_3, 0);
            sub_0207E28C(partyMenu, &a1->template, a1->unk_2, a1->unk_1, a1->unk_3, 0);
            a1->unk_1 = hitbox;
            sub_0207CB9C(partyMenu, a1, a1->template.unk_00[a1->unk_1].value);
            return LIST_NOTHING_CHOSEN;
        }
    } else {
        if (gSystem.newAndRepeatedKeys & PAD_KEY_UP) {
            if (sub_0207E748(&a1->unk_1, a1->unk_2, 0)) {
                ++r6;
            }
        } else if (gSystem.newAndRepeatedKeys & PAD_KEY_DOWN) {
            if (sub_0207E748(&a1->unk_1, a1->unk_2, 1)) {
                ++r6;
            }
        } else if (gSystem.newKeys & PAD_BUTTON_A) {
            if (a1->unk_1 == a1->unk_2 - 1) {
                PlaySE(SEQ_SE_GS_GEARCANCEL);
            } else {
                PlaySE(SEQ_SE_DP_SELECT);
            }
            sub_0207E3A8(partyMenu, a1->unk_2, a1->unk_1, a1->unk_3, 0);
            sub_0207E28C(partyMenu, &a1->template, a1->unk_2, a1->unk_1, a1->unk_3, 0);
            sub_0207CB9C(partyMenu, a1, a1->template.unk_00[a1->unk_1].value);
            return LIST_NOTHING_CHOSEN;
        } else if (gSystem.newKeys & PAD_BUTTON_B) {
            PlaySE(SEQ_SE_GS_GEARCANCEL);
            sub_0207E3A8(partyMenu, a1->unk_2, a1->unk_1, a1->unk_3, 0);
            sub_0207E28C(partyMenu, &a1->template, a1->unk_2, a1->unk_1, a1->unk_3, 0);
            a1->unk_1 = a1->unk_2 - 1;
            sub_0207CB9C(partyMenu, a1, LIST_CANCEL);
            return LIST_NOTHING_CHOSEN;
        }
    }

    if (r6) {
        PlaySE(SEQ_SE_DP_SELECT);
        sub_0207E54C(partyMenu, a1->unk_2, a1->unk_1, a1->unk_3);
        sub_0207E358(partyMenu, &a1->template, a1->unk_2, a1->unk_1, a1->unk_3);
    }

    return LIST_NOTHING_CHOSEN;
}
