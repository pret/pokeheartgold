#include "global.h"

#include "application/pokegear/phone/phone_internal.h"

#include "font.h"
#include "gf_gfx_loader.h"
#include "unk_0208805C.h"

void ov101_021F017C(PokegearPhoneAppData *phoneApp) {
    GX_SetGraphicsMode(GX_DISPMODE_GRAPHICS, GX_BGMODE_0, GX_BG0_AS_2D);

    extern const BgTemplate ov101_021F8440[6];
    BgTemplate sp04[6];
    ARRAY_ASSIGN(sp04, ov101_021F8440);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_1, &sp04[0], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, &sp04[1], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, &sp04[2], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_1, &sp04[3], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_2, &sp04[4], GF_BG_TYPE_TEXT, FALSE);
    InitBgFromTemplateEx(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_3, &sp04[5], GF_BG_TYPE_TEXT, FALSE);
    for (int i = 0; i < 3; ++i) {
        BgClearTilemapBufferAndCommit(phoneApp->pokegear->bgConfig, i + GF_BG_LYR_MAIN_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_MAIN_1, 0x20, 0, phoneApp->heapId);
        BgClearTilemapBufferAndCommit(phoneApp->pokegear->bgConfig, i + GF_BG_LYR_SUB_1);
        BG_ClearCharDataRange(i + GF_BG_LYR_SUB_1, 0x20, 0, phoneApp->heapId);
    }
    SetBgPriority(GF_BG_LYR_MAIN_0, 1);
    BgSetPosTextAndCommit(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0x20);
}

void ov101_021F0260(PokegearPhoneAppData *phoneApp) {
    SetBgPriority(GF_BG_LYR_MAIN_0, 0);
    BgSetPosTextAndCommit(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_3, BG_POS_OP_SET_Y, 0);
    ov100_021E5CA4(phoneApp->pokegear);
}

void ov101_021F0284(PokegearPhoneAppData *phoneApp) {
    FontID_Alloc(4, phoneApp->heapId);
    NARC *narc = NARC_New(NARC_a_1_4_6, phoneApp->heapId);
    sub_0208820C(phoneApp->pokegear->bgConfig, phoneApp->heapId, narc, NARC_a_1_4_6, phoneApp->unk_011 + 28, GF_BG_LYR_MAIN_2, 0, 0, 0);
    sub_0208820C(phoneApp->pokegear->bgConfig, phoneApp->heapId, narc, NARC_a_1_4_6, phoneApp->unk_011 + 16, GF_BG_LYR_SUB_3, 0, 0, 0);
    sub_0208820C(phoneApp->pokegear->bgConfig, phoneApp->heapId, narc, NARC_a_1_4_6, phoneApp->unk_011 + 22, GF_BG_LYR_SUB_3, 1, 0, 0);
    phoneApp->unk_508 = GfGfxLoader_GetScrnDataFromOpenNarc(narc, phoneApp->unk_011 + 34, FALSE, &phoneApp->unk_50C, phoneApp->heapId);
    CopyToBgTilemapRect(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2, 0, 0, 32, 20, phoneApp->unk_50C->rawData, 0, 0, phoneApp->unk_50C->screenWidth / 8, phoneApp->unk_50C->screenHeight / 8);
    NARC_Delete(narc);
    ScheduleBgTilemapBufferTransfer(phoneApp->pokegear->bgConfig, GF_BG_LYR_MAIN_2);
    ScheduleBgTilemapBufferTransfer(phoneApp->pokegear->bgConfig, GF_BG_LYR_SUB_3);
}

void ov101_021F0370(PokegearPhoneAppData *phoneApp) {
    FreeToHeap(phoneApp->unk_508);
    FontID_Release(4);
}
