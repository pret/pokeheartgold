#include "global.h"
#include "party_context_menu.h"

void sub_0207CB9C(PartyMenuStruct *partyMenu, UnkStruct_0207E590 *a1, int a2);
void sub_0207CD84(BgConfig *bgConfig, Window *window, const WindowTemplate *template);
void sub_0207E28C(PartyMenuStruct *partyMenu, UnkTemplate_0207E590 *a1, int a2, int a3, int a4, int a5);
void sub_0207E3A8(PartyMenuStruct *partyMenu, int a1, int a2, int a3, int a4);

// const WindowTemplate _02101734[] = {
//     { GF_BG_LYR_MAIN_1, 0x06, 0x01, 0x09, 0x02, 0x00, 0x0048 },
//     { GF_BG_LYR_MAIN_1, 0x00, 0x04, 0x06, 0x02, 0x00, 0x005A },
//     { GF_BG_LYR_MAIN_1, 0x07, 0x04, 0x08, 0x02, 0x00, 0x0066 },
//     { GF_BG_LYR_MAIN_1, 0x08, 0x03, 0x06, 0x01, 0x03, 0x0076 },
//     { GF_BG_LYR_MAIN_1, 0x06, 0x04, 0x0A, 0x02, 0x00, 0x0066 },
//     { GF_BG_LYR_MAIN_1, 0x16, 0x02, 0x09, 0x02, 0x00, 0x007C },
//     { GF_BG_LYR_MAIN_1, 0x10, 0x05, 0x06, 0x02, 0x00, 0x008E },
//     { GF_BG_LYR_MAIN_1, 0x17, 0x05, 0x08, 0x02, 0x00, 0x009A },
//     { GF_BG_LYR_MAIN_1, 0x18, 0x04, 0x06, 0x01, 0x04, 0x00AA },
//     { GF_BG_LYR_MAIN_1, 0x16, 0x05, 0x0A, 0x02, 0x00, 0x009A },
//     { GF_BG_LYR_MAIN_1, 0x06, 0x07, 0x09, 0x02, 0x00, 0x00B0 },
//     { GF_BG_LYR_MAIN_1, 0x00, 0x0A, 0x06, 0x02, 0x00, 0x00C2 },
//     { GF_BG_LYR_MAIN_1, 0x07, 0x0A, 0x08, 0x02, 0x00, 0x00CE },
//     { GF_BG_LYR_MAIN_1, 0x08, 0x09, 0x06, 0x01, 0x05, 0x00DE },
//     { GF_BG_LYR_MAIN_1, 0x06, 0x0A, 0x0A, 0x02, 0x00, 0x00CE },
//     { GF_BG_LYR_MAIN_1, 0x16, 0x08, 0x09, 0x02, 0x00, 0x00E4 },
//     { GF_BG_LYR_MAIN_1, 0x10, 0x0B, 0x06, 0x02, 0x00, 0x00F6 },
//     { GF_BG_LYR_MAIN_1, 0x17, 0x0B, 0x08, 0x02, 0x00, 0x0102 },
//     { GF_BG_LYR_MAIN_1, 0x18, 0x0A, 0x06, 0x01, 0x06, 0x0112 },
//     { GF_BG_LYR_MAIN_1, 0x16, 0x0B, 0x0A, 0x02, 0x00, 0x0102 },
//     { GF_BG_LYR_MAIN_1, 0x06, 0x0D, 0x09, 0x02, 0x00, 0x0118 },
//     { GF_BG_LYR_MAIN_1, 0x00, 0x10, 0x06, 0x02, 0x00, 0x012A },
//     { GF_BG_LYR_MAIN_1, 0x07, 0x10, 0x08, 0x02, 0x00, 0x0136 },
//     { GF_BG_LYR_MAIN_1, 0x08, 0x0F, 0x06, 0x01, 0x07, 0x0146 },
//     { GF_BG_LYR_MAIN_1, 0x06, 0x10, 0x0A, 0x02, 0x00, 0x0136 },
//     { GF_BG_LYR_MAIN_1, 0x16, 0x0E, 0x09, 0x02, 0x00, 0x014C },
//     { GF_BG_LYR_MAIN_1, 0x10, 0x11, 0x06, 0x02, 0x00, 0x015E },
//     { GF_BG_LYR_MAIN_1, 0x17, 0x11, 0x08, 0x02, 0x00, 0x016A },
//     { GF_BG_LYR_MAIN_1, 0x18, 0x10, 0x06, 0x01, 0x08, 0x017A },
//     { GF_BG_LYR_MAIN_1, 0x16, 0x11, 0x0A, 0x02, 0x00, 0x016A },
//     { GF_BG_LYR_MAIN_1, 0x16, 0x01, 0x09, 0x02, 0x00, 0x007C },
//     { GF_BG_LYR_MAIN_1, 0x11, 0x05, 0x05, 0x02, 0x00, 0x008E },
//     { GF_BG_LYR_MAIN_1, 0x17, 0x05, 0x08, 0x02, 0x00, 0x009A },
//     { GF_BG_LYR_MAIN_1, 0x18, 0x04, 0x06, 0x01, 0x04, 0x00AA },
//     { GF_BG_LYR_MAIN_1, 0x18, 0x04, 0x06, 0x01, 0x04, 0x00AA },
//     { GF_BG_LYR_MAIN_1, 0x16, 0x08, 0x09, 0x02, 0x00, 0x00E4 },
//     { GF_BG_LYR_MAIN_1, 0x11, 0x0B, 0x05, 0x02, 0x00, 0x00F6 },
//     { GF_BG_LYR_MAIN_1, 0x17, 0x0B, 0x08, 0x02, 0x00, 0x0102 },
//     { GF_BG_LYR_MAIN_1, 0x18, 0x0A, 0x06, 0x01, 0x06, 0x0112 },
//     { GF_BG_LYR_MAIN_1, 0x18, 0x04, 0x06, 0x01, 0x04, 0x00AA },
//     { GF_BG_LYR_MAIN_1, 0x16, 0x0E, 0x09, 0x02, 0x00, 0x014C },
//     { GF_BG_LYR_MAIN_1, 0x11, 0x11, 0x05, 0x02, 0x00, 0x015E },
//     { GF_BG_LYR_MAIN_1, 0x17, 0x11, 0x08, 0x02, 0x00, 0x016A },
//     { GF_BG_LYR_MAIN_1, 0x18, 0x10, 0x06, 0x01, 0x08, 0x017A },
//     { GF_BG_LYR_MAIN_1, 0x18, 0x04, 0x06, 0x01, 0x04, 0x00AA },
//     { GF_BG_LYR_SUB_2, 0x07, 0x18, 0x0A, 0x02, 0x02, 0x0001 },
//     { GF_BG_LYR_SUB_2, 0x11, 0x18, 0x06, 0x02, 0x02, 0x0015 },
//     { GF_BG_LYR_SUB_2, 0x11, 0x1A, 0x0C, 0x03, 0x02, 0x0021 },
// };

// const WindowTemplate _0210161C[] = {
//     { GF_BG_LYR_MAIN_1, 0x1A, 0x15, 0x05, 0x02, 0x00, 0x0180 },
//     { GF_BG_LYR_MAIN_1, 0x19, 0x14, 0x07, 0x02, 0x00, 0x018A },
//     { GF_BG_LYR_MAIN_0, 0x02, 0x15, 0x14, 0x02, 0x0D, 0x0198 },
//     { GF_BG_LYR_MAIN_0, 0x02, 0x13, 0x0D, 0x04, 0x0D, 0x01C0 },
//     { GF_BG_LYR_MAIN_0, 0x02, 0x13, 0x1B, 0x04, 0x0D, 0x01F4 },
//     { GF_BG_LYR_MAIN_0, 0x13, 0x11, 0x0C, 0x06, 0x00, 0x0260 },
//     { GF_BG_LYR_MAIN_0, 0x13, 0x0F, 0x0C, 0x08, 0x00, 0x0260 },
// };

// const WindowTemplate _02101654[] = {
//     { GF_BG_LYR_MAIN_0, 0x11, 0x04, 0x0E, 0x02, 0x02, 0x0260 },
//     { GF_BG_LYR_MAIN_0, 0x11, 0x08, 0x0E, 0x02, 0x02, 0x027C },
//     { GF_BG_LYR_MAIN_0, 0x11, 0x0C, 0x0E, 0x02, 0x02, 0x0298 },
//     { GF_BG_LYR_MAIN_0, 0x01, 0x03, 0x0E, 0x02, 0x02, 0x02B4 },
//     { GF_BG_LYR_MAIN_0, 0x01, 0x07, 0x0E, 0x02, 0x02, 0x02D0 },
//     { GF_BG_LYR_MAIN_0, 0x01, 0x0B, 0x0E, 0x02, 0x02, 0x02EC },
//     { GF_BG_LYR_MAIN_0, 0x01, 0x0F, 0x0E, 0x02, 0x02, 0x0308 },
//     { GF_BG_LYR_MAIN_0, 0x1A, 0x14, 0x05, 0x03, 0x02, 0x0324 },
//     { GF_BG_LYR_MAIN_0, 0x11, 0x03, 0x0E, 0x02, 0x02, 0x0260 },
//     { GF_BG_LYR_MAIN_0, 0x11, 0x07, 0x0E, 0x02, 0x02, 0x027C },
//     { GF_BG_LYR_MAIN_0, 0x11, 0x0B, 0x0E, 0x02, 0x02, 0x0298 },
//     { GF_BG_LYR_MAIN_0, 0x11, 0x0F, 0x0E, 0x02, 0x02, 0x02B4 },
// };

// const u8 _021015EC[][4] = {
//     { 0x10, 0x03, 0x10, 0x04 },
//     { 0x10, 0x07, 0x10, 0x04 },
//     { 0x10, 0x0B, 0x10, 0x04 },
//     { 0x00, 0x02, 0x10, 0x04 },
//     { 0x00, 0x06, 0x10, 0x04 },
//     { 0x00, 0x0A, 0x10, 0x04 },
//     { 0x00, 0x0E, 0x10, 0x04 },
//     { 0x19, 0x13, 0x07, 0x05 },
//     { 0x10, 0x02, 0x10, 0x04 },
//     { 0x10, 0x06, 0x10, 0x04 },
//     { 0x10, 0x0A, 0x10, 0x04 },
//     { 0x10, 0x0E, 0x10, 0x04 },
// };

// const s8 _021016B4[][2][8] = {
//     {
//             { 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF },
//         { 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF }
//     }, {
//             { 0x00, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF },
//         { 0x08, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF }
//     }, {
//             { 0x00, 0x01, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF },
//         { 0x08, 0x09, 0x07, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF }
//     }, {
//             { 0x00, 0x01, 0x02, 0x07, 0xFF, 0xFF, 0xFF, 0xFF },
//         { 0x08, 0x09, 0x0A, 0x07, 0xFF, 0xFF, 0xFF, 0xFF }
//     }, {
//             { 0x00, 0x01, 0x02, 0x07, 0x03, 0xFF, 0xFF, 0xFF },
//         { 0x08, 0x09, 0x0A, 0x0B, 0x07, 0xFF, 0xFF, 0xFF }
//     }, {
//             { 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0xFF, 0xFF },
//         { 0x00, 0x01, 0x02, 0x03, 0x04, 0x08, 0xFF, 0xFF }
//     }, {
//             { 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0x05, 0xFF },
//         { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x08, 0xFF }
//     }, {
//             { 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0x05, 0x06 },
//         { 0x00, 0x01, 0x02, 0x07, 0x03, 0x04, 0x05, 0x06 }
//     },
// };

// const u16 _021015AC[] = {
//     0, 2, 6, 8, 3, 5, 1, 7
// };

// const u16 _021015BC[][4] = {
//     { 0x0008, 0x0002, 0x0014, 0x000E },
//     { 0x0009, 0x0003, 0x0015, 0x000F },
//     { 0x000A, 0x0004, 0x0016, 0x0010 },
//     { 0x000B, 0x0005, 0x0017, 0x0011 },
//     { 0x000C, 0x0006, 0x0018, 0x0012 },
//     { 0x000D, 0x0007, 0x0019, 0x0013 },
// };

extern const WindowTemplate _02101734[];
extern const WindowTemplate _0210161C[];
extern const WindowTemplate _02101654[];
extern const u8 _021015EC[][4];
extern const s8 _021016B4[][2][8];
extern const u16 _021015AC[];
extern const u16 _021015BC[][4];

void sub_0207CB7C(void) {
    G2_SetBlendBrightness(30, 8);
}

void sub_0207CB90(void) {
    G2_BlendNone();
}

void sub_0207CB9C(PartyMenuStruct *partyMenu, UnkStruct_0207E590 *a1, int a2) {
    PartyMenuStruct_SubC90 *unk = &partyMenu->unk_C90;

    unk->unk_6_0 = 0;
    unk->unk_6_4 = 0;
    unk->unk_0 = &a1->unk_4;
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
    unk->unk_7 = Get2dSpriteCurrentAnimSeqNo(partyMenu->unk_660[a1]) & 2;
    if (a3 == TRUE) {
        Sprite_SetAnimCtrlCurrentFrame(partyMenu->unk_660[a1], 0);
        Set2dSpriteAnimSeqNo(partyMenu->unk_660[a1], unk->unk_7);
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
            Sprite_SetAnimCtrlCurrentFrame(partyMenu->unk_660[unk->unk_5], 0);
            Set2dSpriteAnimSeqNo(partyMenu->unk_660[unk->unk_5], unk->unk_7);
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
                Sprite_SetAnimCtrlCurrentFrame(partyMenu->unk_660[unk->unk_5], 0);
                Set2dSpriteAnimSeqNo(partyMenu->unk_660[unk->unk_5], unk->unk_7 + 1);
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

void sub_0207CD84(BgConfig *bgConfig, Window *window, const WindowTemplate *template) {
    AddWindow(bgConfig, &window[0], &template[0]);
    AddWindow(bgConfig, &window[1], &template[1]);
    AddWindow(bgConfig, &window[2], &template[2]);
    AddWindow(bgConfig, &window[3], &template[3]);
    AddWindow(bgConfig, &window[4], &template[4]);
}

void sub_0207CDCC(PartyMenuStruct *partyMenu) {
    const WindowTemplate *r4 = _02101734;
    sub_0207CD84(partyMenu->bgConfig, &partyMenu->unk_004[0], &r4[0]);
    sub_0207CD84(partyMenu->bgConfig, &partyMenu->unk_004[10], &r4[10]);
    sub_0207CD84(partyMenu->bgConfig, &partyMenu->unk_004[20], &r4[20]);
    if (partyMenu->args->unk_25 == 2) {
        sub_0207CD84(partyMenu->bgConfig, &partyMenu->unk_004[5], &r4[30]);
        sub_0207CD84(partyMenu->bgConfig, &partyMenu->unk_004[15], &r4[35]);
        sub_0207CD84(partyMenu->bgConfig, &partyMenu->unk_004[25], &r4[40]);
    } else {
        sub_0207CD84(partyMenu->bgConfig, &partyMenu->unk_004[5], &r4[5]);
        sub_0207CD84(partyMenu->bgConfig, &partyMenu->unk_004[15], &r4[15]);
        sub_0207CD84(partyMenu->bgConfig, &partyMenu->unk_004[25], &r4[25]);
    }
    AddWindow(partyMenu->bgConfig, &partyMenu->unk_004[37], &r4[45]);
    AddWindow(partyMenu->bgConfig, &partyMenu->unk_004[38], &r4[46]);
    AddWindow(partyMenu->bgConfig, &partyMenu->unk_004[39], &r4[47]);
    if (partyMenu->args->context == PARTY_MENU_CONTEXT_2 || partyMenu->args->context == PARTY_MENU_CONTEXT_17 || partyMenu->args->context == PARTY_MENU_CONTEXT_22 || partyMenu->args->context == PARTY_MENU_CONTEXT_23) {
        // FIXME: temp hack
        // WindowTemplate template = _0210161C[0];
        WindowTemplate template = ((const WindowTemplate *)_021015EC)[6];
        template.top = 22;
        AddWindow(partyMenu->bgConfig, &partyMenu->unk_004[31], &template);
    } else {
        AddWindow(partyMenu->bgConfig, &partyMenu->unk_004[31], &_0210161C[0]);
    }
    AddWindow(partyMenu->bgConfig, &partyMenu->unk_004[30], &_0210161C[1]);
    AddWindow(partyMenu->bgConfig, &partyMenu->unk_004[32], &_0210161C[2]);
    AddWindow(partyMenu->bgConfig, &partyMenu->unk_004[33], &_0210161C[3]);
    AddWindow(partyMenu->bgConfig, &partyMenu->unk_004[34], &_0210161C[4]);
    AddWindow(partyMenu->bgConfig, &partyMenu->unk_004[35], &_0210161C[5]);
    AddWindow(partyMenu->bgConfig, &partyMenu->unk_004[36], &_0210161C[6]);
}
