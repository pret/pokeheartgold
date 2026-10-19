#include "application/capsule_menu/defs.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0011.h"

#include "obj_char_transfer.h"
#include "text.h"
#include "unk_02013534.h"

void ov57_02239814(BgConfig *bgConfig, Window *window, int left, int top, int width, int height, int pltt, int baseTile);
void ov57_022387E0(CapsuleAppManager *appMan, int index, int a2, int a3, int a4);

void ov57_022385A4(TouchscreenHitbox *rect, ManagedSprite *sprite, int xOffset, int yOffset) {
    s16 x, y;

    ManagedSprite_GetPositionXY(sprite, &x, &y);

    rect->rect.top = y - yOffset;
    rect->rect.bottom = y + yOffset;
    rect->rect.left = x - xOffset;
    rect->rect.right = x + xOffset;
}

void ov57_022385DC(CapsuleAppManager *appManager) {
    ov57_02239814(appManager->unk_0D4.unk_010, &appManager->unk_0D4.unk_018[0], 1, 1, 21, 30, 2, 0x03A);
    ov57_02239814(appManager->unk_0D4.unk_010, &appManager->unk_0D4.unk_018[3], 1, 1, 21, 20, 2, 0x03A);
    ov57_02239814(appManager->unk_0D4.unk_010, &appManager->unk_0D4.unk_018[2], 1, 23, 21, 8, 2, 0x076);
}

void ov57_0223864C(CapsuleAppManager *appManager) {
    RemoveWindow(&appManager->unk_0D4.unk_018[0]);
    RemoveWindow(&appManager->unk_0D4.unk_018[3]);
    RemoveWindow(&appManager->unk_0D4.unk_018[2]);
}

void ov57_0223866C(CapsuleAppManager *appManager, BOOL show) {
    if (show) {
        MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, msg_0011, HEAP_ID_52);
        String *string = NewString_ReadMsgData(msgData, msg_0011_00017);
        FillWindowPixelBuffer(&appManager->unk_0D4.unk_018[2], 0);
        u32 x = (64 - FontID_String_GetWidth(FONT_UNK_4, string, 0));
        x /= 2;
        AddTextPrinterParameterizedWithColor(&appManager->unk_0D4.unk_018[2], FONT_UNK_4, string, x, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 15, 0), NULL);
        String_Delete(string);
        DestroyMsgData(msgData);
        ScheduleWindowCopyToVram(&appManager->unk_0D4.unk_018[2]);
    } else {
        ClearWindowTilemapAndScheduleTransfer(&appManager->unk_0D4.unk_018[2]);
    }
}

void ov57_022386F0(CapsuleAppManager *appMan) {
    appMan->unk_0D4.unk_188 = FontSystem_NewInit(2, HEAP_ID_52);
    FontID_Alloc(FONT_SUBSCREEN, HEAP_ID_52);
    FontID_Alloc(FONT_UNK_4, HEAP_ID_52);
}

void ov57_02238714(CapsuleAppManager *appMan) {
    FontID_Release(FONT_UNK_4);
    FontID_Release(FONT_SUBSCREEN);
    FontOAM_Delete(appMan->unk_0D4.unk_18C[0]);
    sub_02021B5C(&appMan->unk_0D4.unk_194[0]);
    FontOAM_Delete(appMan->unk_0D4.unk_18C[1]);
    sub_02021B5C(&appMan->unk_0D4.unk_194[1]);
    sub_020135AC(appMan->unk_0D4.unk_188);
}

void ov57_02238758(CapsuleAppManager *appMan) {
    SpriteSystem_LoadPaletteBuffer(appMan->unk_0D4.unk_014, PLTTBUF_SUB_OBJ, appMan->unk_0D4.unk_008, appMan->unk_0D4.unk_00C, NARC_graphic_font, 8, FALSE, 1, NNS_G2D_VRAM_TYPE_2DSUB, 30000);
}

void ov57_02238794(CapsuleAppManager *appMan) {
    ov57_02238758(appMan);
    ov57_022387E0(appMan, 0, 104, 165, 0);
    ov57_022387E0(appMan, 1, 192, 165, 0);
}

void ov57_022387C0(CapsuleAppManager *appMan, BOOL flag) {
    TextOBJ_SetSpritesDrawFlag(appMan->unk_0D4.unk_18C[0], flag);
    TextOBJ_SetSpritesDrawFlag(appMan->unk_0D4.unk_18C[1], flag);
}
