#include "list_menu_2.h"
#include "font.h"
#include "system.h"
#include "unk_02005D10.h"
#include "constants/sndseq.h"

BOOL sub_02001C98(struct ListMenu2 *listMenu, int direction, u16 seqno);
BOOL sub_02001CF0(struct ListMenu2 *listMenu, int direction);
u8 sub_02001DE8(struct ListMenu2 *listMenu);
void sub_02001E28(struct ListMenu2 *listMenu);
void sub_02001EB4(struct ListMenu2 *listMenu);
void sub_02001EE4(struct ListMenu2 *listMenu, u8 *x, u8 *y, u8 selectedIdx);

struct ListMenu2 *sub_02001AF4(const struct ListMenu2Template *template, u8 a1, u8 a2, u8 a3, u8 heapId, int a5) {
    struct ListMenu2 *ret = AllocFromHeap(heapId, sizeof(struct ListMenu2));
    ret->template = *template;
    ret->cursor = ListMenuCursorNew(heapId);
    ret->unk10 = a5;
    ret->selectedIndex = a3;
    ret->unk16 = sub_02001DE8(ret);
    ret->heapId = heapId;
    ret->unk17 = a1;
    ret->unk18 = a2;
    ret->maxGlyphWidth = GetFontAttribute(template->fontId, 0) + GetFontAttribute(template->fontId, 2);
    ret->maxGlyphHeight = GetFontAttribute(template->fontId, 1) + GetFontAttribute(template->fontId, 3);
    sub_02001E28(ret);
    sub_02001EB4(ret);
    return ret;
}

struct ListMenu2 *sub_02001B7C(const struct ListMenu2Template *template, u8 a1, u8 a2, u8 a3, u8 heapId, int a5) {
    struct ListMenu2 *ret = sub_02001AF4(template, a1, a2, a3, heapId, a5);
    CopyWindowToVram(ret->template.window);
    return ret;
}

struct ListMenu2 *sub_02001B9C(const struct ListMenu2Template *template, u8 a1, u8 heapId) {
    return sub_02001B7C(template, GetFontAttribute(template->fontId, 0), 0, a1, heapId, 2);
}

void sub_02001BC4(struct ListMenu2 *menu, u8 *ret_p) {
    if (ret_p != NULL) {
        *ret_p = menu->selectedIndex;
    }
    DestroyListMenuCursorObj(menu->cursor);
    FreeToHeapExplicit(menu->heapId, menu);
}

int sub_02001BE0(struct ListMenu2 *menu) {
    menu->scheduledScroll = 0;
    if (gSystem.newKeys & PAD_BUTTON_A) {
        PlaySE(SEQ_SE_DP_SELECT);
        return menu->template.items[menu->selectedIndex].value;
    } else if (gSystem.newKeys & menu->unk10) {
        PlaySE(SEQ_SE_DP_SELECT);
        return -2;
    } else if (gSystem.newKeys & PAD_KEY_UP) {
        if (sub_02001C98(menu, 0, SEQ_SE_DP_SELECT) == TRUE) {
            menu->scheduledScroll = 1;
        }
        return -1;
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        if (sub_02001C98(menu, 1, SEQ_SE_DP_SELECT) == TRUE) {
            menu->scheduledScroll = 2;
        }
        return -1;
    } else if (gSystem.newKeys & PAD_KEY_LEFT) {
        if (sub_02001C98(menu, 2, SEQ_SE_DP_SELECT) == TRUE) {
            menu->scheduledScroll = 3;
        }
        return -1;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        if (sub_02001C98(menu, 3, SEQ_SE_DP_SELECT) == TRUE) {
            menu->scheduledScroll = 4;
        }
        return -1;
    } else {
        return -1;
    }
}

u8 sub_02001C94(struct ListMenu2 *menu) {
    return menu->selectedIndex;
}

BOOL sub_02001C98(struct ListMenu2 *menu, int direction, u16 seqno) {
    u8 selection = menu->selectedIndex;
    u8 x, y;
    u8 fillval;
    if (!sub_02001CF0(menu, direction)) {
        return FALSE;
    }
    fillval = GetFontAttribute(menu->template.fontId, 6);
    sub_02001EE4(menu, &x, &y, selection);
    FillWindowPixelRect(menu->template.window, fillval, x, y, 8, menu->maxGlyphHeight);
    sub_02001EB4(menu);
    PlaySE(seqno);
    return TRUE;
}
