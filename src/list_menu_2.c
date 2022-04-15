#include "list_menu_2.h"
#include "font.h"
#include "system.h"
#include "text.h"
#include "unk_02005D10.h"
#include "unk_0200E398.h"
#include "constants/sndseq.h"
#include "msgdata/msg/msg_0191.h"

static struct ListMenu2 *Create2dMenuInternalEx(const struct ListMenu2Template *template, u8 x, u8 y, u8 initialSelection, u8 heapId, int cancelKey);
static struct ListMenu2 *Create2dMenuInternal(const struct ListMenu2Template *template, u8 x, u8 y, u8 initialSelection, u8 heapId, int cancelKey);
static BOOL TryMove2dMenuCursor(struct ListMenu2 *menu, int direction, u16 seqno);
static BOOL TryMove2dMenuCursorInternal(struct ListMenu2 *menu, int direction);
static u8 Get2dMenuMaxItemWidth(struct ListMenu2 *listMenu);
static void Print2dMenuItemTexts(struct ListMenu2 *listMenu);
static void Draw2dMenuCursor(struct ListMenu2 *listMenu);
static void Get2dMenuSelectionCoords(struct ListMenu2 *listMenu, u8 *x, u8 *y, u8 selectedIdx);

static struct ListMenu2 *Create2dMenuInternalEx(const struct ListMenu2Template *template, u8 x, u8 y, u8 initialSelection, u8 heapId, int cancelKey) {
    struct ListMenu2 *ret = AllocFromHeap(heapId, sizeof(struct ListMenu2));
    ret->template = *template;
    ret->cursor = ListMenuCursorNew(heapId);
    ret->cancelKey = cancelKey;
    ret->selectedIndex = initialSelection;
    ret->maxItemWidth = Get2dMenuMaxItemWidth(ret);
    ret->heapId = heapId;
    ret->x = x;
    ret->y = y;
    ret->maxGlyphWidth = GetFontAttribute(template->fontId, 0) + GetFontAttribute(template->fontId, 2);
    ret->maxGlyphHeight = GetFontAttribute(template->fontId, 1) + GetFontAttribute(template->fontId, 3);
    Print2dMenuItemTexts(ret);
    Draw2dMenuCursor(ret);
    return ret;
}

static struct ListMenu2 *Create2dMenuInternal(const struct ListMenu2Template *template, u8 x, u8 y, u8 initialSelection, u8 heapId, int cancelKey) {
    struct ListMenu2 *ret = Create2dMenuInternalEx(template, x, y, initialSelection, heapId, cancelKey);
    CopyWindowToVram(ret->template.window);
    return ret;
}

struct ListMenu2 *Create2dMenu(const struct ListMenu2Template *template, u8 initialSelection, u8 heapId) {
    return Create2dMenuInternal(template, GetFontAttribute(template->fontId, 0), 0, initialSelection, heapId, PAD_BUTTON_B);
}

void Delete2dMenu(struct ListMenu2 *menu, u8 *ret_p) {
    if (ret_p != NULL) {
        *ret_p = menu->selectedIndex;
    }
    DestroyListMenuCursorObj(menu->cursor);
    FreeToHeapExplicit(menu->heapId, menu);
}

int Handle2dMenuInput(struct ListMenu2 *menu) {
    menu->scheduledScroll = 0;
    if (gSystem.newKeys & PAD_BUTTON_A) {
        PlaySE(SEQ_SE_DP_SELECT);
        return menu->template.items[menu->selectedIndex].value;
    } else if (gSystem.newKeys & menu->cancelKey) {
        PlaySE(SEQ_SE_DP_SELECT);
        return LIST_CANCEL;
    } else if (gSystem.newKeys & PAD_KEY_UP) {
        if (TryMove2dMenuCursor(menu, 0, SEQ_SE_DP_SELECT) == TRUE) {
            menu->scheduledScroll = 1;
        }
        return LIST_NOTHING_CHOSEN;
    } else if (gSystem.newKeys & PAD_KEY_DOWN) {
        if (TryMove2dMenuCursor(menu, 1, SEQ_SE_DP_SELECT) == TRUE) {
            menu->scheduledScroll = 2;
        }
        return LIST_NOTHING_CHOSEN;
    } else if (gSystem.newKeys & PAD_KEY_LEFT) {
        if (TryMove2dMenuCursor(menu, 2, SEQ_SE_DP_SELECT) == TRUE) {
            menu->scheduledScroll = 3;
        }
        return LIST_NOTHING_CHOSEN;
    } else if (gSystem.newKeys & PAD_KEY_RIGHT) {
        if (TryMove2dMenuCursor(menu, 3, SEQ_SE_DP_SELECT) == TRUE) {
            menu->scheduledScroll = 4;
        }
        return LIST_NOTHING_CHOSEN;
    } else {
        return LIST_NOTHING_CHOSEN;
    }
}

u8 Get2dMenuSelection(struct ListMenu2 *menu) {
    return menu->selectedIndex;
}

static BOOL TryMove2dMenuCursor(struct ListMenu2 *menu, int direction, u16 seqno) {
    u8 selection = menu->selectedIndex;
    u8 x, y;
    u8 fillval;
    if (!TryMove2dMenuCursorInternal(menu, direction)) {
        return FALSE;
    }
    fillval = GetFontAttribute(menu->template.fontId, 6);
    Get2dMenuSelectionCoords(menu, &x, &y, selection);
    FillWindowPixelRect(menu->template.window, fillval, x, y, 8, menu->maxGlyphHeight);
    Draw2dMenuCursor(menu);
    PlaySE(seqno);
    return TRUE;
}

static BOOL TryMove2dMenuCursorInternal(struct ListMenu2 *menu, int direction) {
    s8 newPos;
    if (direction == 0) {
        if (menu->template.itemsHigh <= 1) {
            return FALSE;
        } else if (menu->selectedIndex % menu->template.itemsHigh == 0) {
            if (menu->template.enableWrap == 0) {
                return FALSE;
            }
            newPos = menu->selectedIndex + (menu->template.itemsHigh - 1);
        } else {
            newPos = menu->selectedIndex - 1;
        }
    } else if (direction == 1) {
        if (menu->template.itemsHigh <= 1) {
            return FALSE;
        } else if (menu->template.itemsHigh - 1 == menu->selectedIndex % menu->template.itemsHigh) {
            if (menu->template.enableWrap == 0) {
                return FALSE;
            }
            newPos = menu->selectedIndex - (menu->template.itemsHigh - 1);
        } else {
            newPos = menu->selectedIndex + 1;
        }
    } else if (direction == 2) {
        if (menu->template.itemsWide <= 1) {
            return FALSE;
        } else if (menu->selectedIndex < menu->template.itemsHigh) {
            if (menu->template.enableWrap == 0) {
                return FALSE;
            }
            newPos = menu->selectedIndex + menu->template.itemsHigh * (menu->template.itemsWide - 1);
        } else {
            newPos = menu->selectedIndex - menu->template.itemsHigh;
        }
    } else {
        if (menu->template.itemsWide <= 1) {
            return FALSE;
        } else if (menu->selectedIndex >= menu->template.itemsHigh * (menu->template.itemsWide - 1)) {
            if (menu->template.enableWrap == 0) {
                return FALSE;
            }
            newPos = menu->selectedIndex % menu->template.itemsHigh;
        } else {
            newPos = menu->selectedIndex + menu->template.itemsHigh;
        }
    }
    if (menu->template.items[newPos].value == LIST_HEADER) {
        return FALSE;
    }
    menu->selectedIndex = newPos;
    return TRUE;
}

static u8 Get2dMenuMaxItemWidth(struct ListMenu2 *listMenu) {
    u8 i;
    u8 ret = 0, cur;

    for (i = 0; i < listMenu->template.itemsWide * listMenu->template.itemsHigh; i++) {
        cur = FontID_String_GetWidth(listMenu->template.fontId, listMenu->template.items[i].text, 0);
        if (ret < cur) {
            ret = cur;
        }
    }
    return ret;
}

static void Print2dMenuItemTexts(struct ListMenu2 *listMenu) {
    u8 i, j;
    u8 dx;
    u8 x;
    FillWindowPixelBuffer(listMenu->template.window, GetFontAttribute(listMenu->template.fontId, 6));
    x = listMenu->x;
    dx = listMenu->maxItemWidth + listMenu->maxGlyphWidth * 2;
    for (i = 0; i < listMenu->template.itemsWide; i++) {
        for (j = 0; j < listMenu->template.itemsHigh; j++) {
            AddTextPrinterParameterized(
                listMenu->template.window,
                listMenu->template.fontId,
                listMenu->template.items[j + i * listMenu->template.itemsHigh].text,
                x,
                listMenu->y + (listMenu->maxGlyphHeight + listMenu->template.yTop) * j,
                TEXT_SPEED_NOTRANSFER,
                NULL
            );
        }
        x += dx;
    }
}

static void Draw2dMenuCursor(struct ListMenu2 *listMenu) {
    if (listMenu->template.cursorType != 1) {
        u8 x, y;
        Get2dMenuSelectionCoords(listMenu, &x, &y, listMenu->selectedIndex);
        ListMenuUpdateCursorObj(listMenu->cursor, listMenu->template.window, x, y);
    }
}

static void Get2dMenuSelectionCoords(struct ListMenu2 *listMenu, u8 *x, u8 *y, u8 selectedIdx) {
    *x = (selectedIdx / listMenu->template.itemsHigh) * (listMenu->maxItemWidth + listMenu->maxGlyphWidth * 2);
    *y = listMenu->y + (selectedIdx % listMenu->template.itemsHigh) * (listMenu->maxGlyphHeight + listMenu->template.yTop);
}

struct ListMenu2 *CreateYesNoMenu(BGCONFIG *bgConfig, const WINDOWTEMPLATE *windowTemplate, u16 tileNum, u8 paletteNum, u8 initialSelection, HeapID heapId) {
    struct ListMenu2Template menuTemplate;
    MSGDATA *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_LAZY, NARC_msgdata_msg, NARC_msg_msg_0191_bin, heapId);
    LISTMENUITEM *items = ListMenuItems_ctor(2, heapId);
    ListMenuItems_AppendFromMsgData(items, msgData, msg_0191_00042, 0);
    ListMenuItems_AppendFromMsgData(items, msgData, msg_0191_00043, LIST_CANCEL);
    DestroyMsgData(msgData);
    menuTemplate.items = items;
    menuTemplate.window = AllocWindows(heapId, 1);
    menuTemplate.fontId = 0;
    menuTemplate.itemsWide = 1;
    menuTemplate.itemsHigh = 2;
    menuTemplate.yTop = 0;
    menuTemplate.cursorType = 0;
    menuTemplate.enableWrap = 0;
    AddWindow(bgConfig, menuTemplate.window, windowTemplate);
    DrawFrameAndWindow1(menuTemplate.window, TRUE, tileNum, paletteNum);
    return Create2dMenuInternal(&menuTemplate, 8, 0, initialSelection, heapId, PAD_BUTTON_B);
}

struct ListMenu2 *Std_CreateYesNoMenu(BGCONFIG *bgConfig, const WINDOWTEMPLATE *windowTemplate, u16 tileNum, u8 paletteNum, HeapID heapId) {
    return CreateYesNoMenu(bgConfig, windowTemplate, tileNum, paletteNum, 0, heapId);
}

int Handle2dMenuInput_DeleteOnFinish(struct ListMenu2 *menu, HeapID heapId) {
    int ret = Handle2dMenuInput(menu);
    if (ret != LIST_NOTHING_CHOSEN) {
        Clear2dMenuWindowAndDelete(menu, heapId);
    }
    return ret;
}

void Clear2dMenuWindowAndDelete(struct ListMenu2 *menu, HeapID heapId) {
    sub_0200E5D4(menu->template.window, FALSE);
    RemoveWindow(menu->template.window);
    FreeToHeapExplicit(heapId, menu->template.window);
    ListMenuItems_dtor(menu->template.items);
    Delete2dMenu(menu, NULL);
}
