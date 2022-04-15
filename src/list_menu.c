#include "list_menu.h"
#include "text.h"
#include "system.h"
#include "font.h"

void ListMenuPrintEntries(struct ListMenu *list, u16 startIndex, u16 yOffset, u16 count);
void ListMenuDrawCursor(struct ListMenu *list);
BOOL ListMenuChangeSelection(struct ListMenu *list, u8 updateCursorAndCallCallback, u8 count, u8 movingDown);
void ListMenuCallSelectionChangedCallback(struct ListMenu *list, u8 onInit);

struct ListMenu *ListMenuInit(const struct ListMenuTemplate *template, u16 cursorPos, u16 itemsAbove, HeapID heap_id) {
    struct ListMenu *list = AllocFromHeap(heap_id, sizeof(struct ListMenu));
    list->template = *template;
    list->cursor = ListMenuCursorNew(heap_id);
    list->cursorPos = cursorPos;
    list->itemsAbove = itemsAbove;
    list->unk_30 = 0;
    list->unk_31 = 0;
    list->taskId = 0xFF;
    list->unk_33 = 0;
    list->heap_id = (u8)heap_id;
    list->cursorPal = list->template.cursorPal;
    list->fillValue = list->template.fillValue;
    list->cursorShadowPal = list->template.cursorShadowPal;
    list->lettersSpacing = list->template.lettersSpacing;
    list->fontId = list->template.fontId;
    list->overrideEnabled = FALSE;
    if (list->template.totalItems < list->template.maxShowed) {
        list->template.maxShowed = list->template.totalItems;
    }
    ListMenuCursorSetColor(
        list->cursor,
        MakeTextColor(list->template.cursorPal, list->template.cursorShadowPal, list->template.fillValue)
    );
    FillWindowPixelBuffer(list->template.window, list->template.fillValue);
    ListMenuPrintEntries(list, list->cursorPos, 0, list->template.maxShowed);
    ListMenuDrawCursor(list);
    ListMenuCallSelectionChangedCallback(list, TRUE);
    CopyWindowToVram(template->window);
    return list;
}

s32 ListMenu_ProcessInput(struct ListMenu *list) {
    list->unk_33 = 0;

    if (gSystem.newKeys & REG_PAD_KEYINPUT_A_MASK) {
        return list->template.items[list->cursorPos + list->itemsAbove].value;
    } else if (gSystem.newKeys & REG_PAD_KEYINPUT_B_MASK) {
        return LIST_CANCEL;
    } else if (gSystem.newAndRepeatedKeys & REG_PAD_KEYINPUT_UP_MASK) {
        if (!ListMenuChangeSelection(list, TRUE, 1, FALSE))
            list->unk_33 = 1;
        return LIST_NOTHING_CHOSEN;
    } else if (gSystem.newAndRepeatedKeys & REG_PAD_KEYINPUT_DOWN_MASK) {
        if (!ListMenuChangeSelection(list, TRUE, 1, TRUE))
            list->unk_33 = 2;
        return LIST_NOTHING_CHOSEN;
    } else {
        u16 rightButton, leftButton;
        switch (list->template.scrollMultiple) {
        case LIST_NO_MULTIPLE_SCROLL:
        default:
            leftButton = FALSE;
            rightButton = FALSE;
            break;
        case LIST_MULTIPLE_SCROLL_DPAD:
            leftButton = (u16)(gSystem.newAndRepeatedKeys & REG_PAD_KEYINPUT_LEFT_MASK);
            rightButton = (u16)(gSystem.newAndRepeatedKeys & REG_PAD_KEYINPUT_RIGHT_MASK);
            break;
        case LIST_MULTIPLE_SCROLL_L_R:
            leftButton = (u16)(gSystem.newAndRepeatedKeys & REG_PAD_KEYINPUT_L_MASK);
            rightButton = (u16)(gSystem.newAndRepeatedKeys & REG_PAD_KEYINPUT_R_MASK);
            break;
        }
        if (leftButton) {
            if (!ListMenuChangeSelection(list, TRUE, (u8)list->template.maxShowed, FALSE))
                list->unk_33 = 3;
            return LIST_NOTHING_CHOSEN;
        } else if (rightButton) {
            if (!ListMenuChangeSelection(list, TRUE, (u8)list->template.maxShowed, TRUE))
                list->unk_33 = 4;
            return LIST_NOTHING_CHOSEN;
        } else {
            return LIST_NOTHING_CHOSEN;
        }
    }
}

void DestroyListMenu(struct ListMenu *list, u16 * cursorPos, u16 * itemsAbove) {
    if (cursorPos != NULL) {
        *cursorPos = list->cursorPos;
    }
    if (itemsAbove != NULL) {
        *itemsAbove = list->itemsAbove;
    }
    DestroyListMenuCursorObj(list->cursor);
    FreeToHeapExplicit(list->heap_id, list);
}

void RedrawListMenu(struct ListMenu *list) {
    FillWindowPixelBuffer(list->template.window, list->template.fillValue);
    ListMenuPrintEntries(list, list->cursorPos, 0, list->template.maxShowed);
    ListMenuDrawCursor(list);
    CopyWindowToVram(list->template.window);
}

void ListMenuOverrideSetColors(struct ListMenu *list, u8 cursorPal, u8 fillValue, u8 cursorShadowPal) {
    list->cursorPal = cursorPal;
    list->fillValue = fillValue;
    list->cursorShadowPal = cursorShadowPal;
    list->overrideEnabled = TRUE;
}

void ListMenuGetCurrentItemArrayId(struct ListMenu *list, u16 *index_p) {
    *index_p = (list->cursorPos + list->itemsAbove);
}

void ListMenuGetScrollAndRow(struct ListMenu *list, u16 *cursorPos_p, u16 *itemsAbove_p) {
    if (cursorPos_p != NULL) {
        *cursorPos_p = list->cursorPos;
    }
    if (itemsAbove_p != NULL) {
        *itemsAbove_p = list->itemsAbove;
    }
}

s32 ListMenuGetValueByArrayId(struct ListMenu *list, s32 index) {
    return list->template.items[index].value;
}

s32 ListMenuGetTemplateField(struct ListMenu *list, enum ListMenuAttr attr) {
    switch (attr) {
    case LISTMENUATTR_MOVECURSORFUNC:
        return (s32)list->template.moveCursorFunc;
    case LISTMENUATTR_ITEMPRINTFUNC:
        return (s32)list->template.itemPrintFunc;
    case LISTMENUATTR_TOTALITEMS:
        return (s32)list->template.totalItems;
    case LISTMENUATTR_MAXSHOWED:
        return (s32)list->template.maxShowed;
    case LISTMENUATTR_UNUSED_4:
        break;
    case LISTMENUATTR_HEADERX:
        return (s32)list->template.header_X;
    case LISTMENUATTR_ITEMX:
        return (s32)list->template.item_X;
    case LISTMENUATTR_CURSORX:
        return (s32)list->template.cursor_X;
    case LISTMENUATTR_UPTEXTY:
        return (s32)list->template.upText_Y;
    case LISTMENUATTR_TEXTHEIGHT:
        return GetFontAttribute(list->template.fontId, 1) + list->template.itemVerticalPadding;
    case LISTMENUATTR_CURSORPAL:
        return (s32)list->template.cursorPal;
    case LISTMENUATTR_FILLVALUE:
        return (s32)list->template.fillValue;
    case LISTMENUATTR_CURSORSHADOWPAL:
        return (s32)list->template.cursorShadowPal;
    case LISTMENUATTR_LETTERSSPACING:
        return (s32)list->template.lettersSpacing;
    case LISTMENUATTR_ITEMVERTICALPADDING:
        return (s32)list->template.itemVerticalPadding;
    case LISTMENUATTR_SCROLLMULTIPLE:
        return (s32)list->template.scrollMultiple;
    case LISTMENUATTR_FONTID:
        return (s32)list->template.fontId;
    case LISTMENUATTR_CURSORKIND:
        return (s32)list->template.cursorKind;
    case LISTMENUATTR_WINDOW:
        return (s32)list->template.window;
    case LISTMENUATTR_UNK_1C:
        return (s32)list->template.unk_1C;
    }

    return -1;
}

void ListMenuPrint(struct ListMenu *list, STRING *str, u8 x, u8 y) {
    if (str != NULL) {
        if (list->overrideEnabled) {
            AddTextPrinterParameterized3(list->template.window, list->fontId, str, x, y, 0xFF, MakeTextColor(list->cursorPal, list->cursorShadowPal, list->fillValue), list->lettersSpacing, 0, NULL);
        } else {
            AddTextPrinterParameterized3(list->template.window, list->template.fontId, str, x, y, 0xFF, MakeTextColor(list->template.cursorPal, list->template.cursorShadowPal, list->template.fillValue), list->template.lettersSpacing, 0, NULL);
        }
    }
}

void ListMenuPrintEntries(struct ListMenu *list, u16 startIndex, u16 yOffset, u16 count) {
    s32 i;
    u8 x, y;
    u8 yMultiplier = (u8)(GetFontAttribute((u8)list->template.fontId, 1) + list->template.itemVerticalPadding);

    for (i = 0; i < count; i++) {
        if (list->template.items[startIndex].value != LIST_HEADER) {
            x = list->template.item_X;
        }
        else {
            x = list->template.header_X;
        }
        y = (u8)((yOffset + i) * yMultiplier + list->template.upText_Y);
        if (list->template.itemPrintFunc != NULL) {
            list->template.itemPrintFunc(list, list->template.items[startIndex].value, y);
        }
        ListMenuPrint(list, list->template.items[startIndex].text, x, y);
        startIndex++;
    }
}

void ListMenuDrawCursor(struct ListMenu *list) {
    u8 yMultiplier = (u8)(GetFontAttribute((u8)list->template.fontId, 1) + list->template.itemVerticalPadding);
    u8 x = list->template.cursor_X;
    u8 y = (u8)(list->itemsAbove * yMultiplier + list->template.upText_Y);
    switch (list->template.cursorKind) {
    case 0:
        ListMenuUpdateCursorObj(list->cursor, list->template.window, x, y);
        break;
    case 1:
    case 2: // leftover
    case 3: // leftover
        break;
    }
}

void ListMenuErasePrintedCursor(struct ListMenu *list, u16 itemsAbove) {
    switch (list->template.cursorKind) {
    case 0:
        u8 yMultiplier = (u8)(GetFontAttribute(list->template.fontId, 1) + list->template.itemVerticalPadding);
        u8 width  = 7;
        u8 height = 16;
        FillWindowPixelRect(list->template.window,
                            list->template.fillValue,
                            list->template.cursor_X,
                            (u16)(itemsAbove * yMultiplier + list->template.upText_Y),
                            width,
                            height);
        break;
    case 1:
    case 2: // leftover
    case 3: // leftover
        break;
    }
}

u8 ListMenuUpdateSelectedRowIndexAndScroll(struct ListMenu *list, u8 movingDown) {
    u32 cursorPos;
    u16 itemsAbove;
    u16 newRow;

    itemsAbove = list->itemsAbove;
    cursorPos = list->cursorPos;

    if (!movingDown) {
        if (list->template.maxShowed == 1) {
            newRow = 0;
        }
        else {
            newRow = (u16)(list->template.maxShowed -
                           ((list->template.maxShowed / 2) + (list->template.maxShowed % 2)) - 1);
        }

        if (cursorPos == 0) {
            while (itemsAbove != 0) {
                itemsAbove--;
                if (list->template.items[cursorPos + itemsAbove].value != LIST_HEADER) {
                    list->itemsAbove = itemsAbove;
                    return 1;
                }
            }
            return 0;
        } else {
            while (itemsAbove > newRow) {
                itemsAbove--;
                if (list->template.items[cursorPos + itemsAbove].value != LIST_HEADER) {
                    list->itemsAbove = itemsAbove;
                    return 1;
                }
            }
            list->itemsAbove = newRow;
            list->cursorPos = (u16)(cursorPos - 1);
        }
    } else {
        if (list->template.maxShowed == 1) {
            newRow = 0;
        }
        else {
            newRow = (u16)((list->template.maxShowed / 2) + (list->template.maxShowed % 2));
        }

        if (cursorPos == list->template.totalItems - list->template.maxShowed) {
            while (itemsAbove < list->template.maxShowed - 1) {
                itemsAbove++;
                if (list->template.items[cursorPos + itemsAbove].value != LIST_HEADER) {
                    list->itemsAbove = itemsAbove;
                    return 1;
                }
            }
            return 0;
        } else {
            while (itemsAbove < newRow) {
                itemsAbove++;
                if (list->template.items[cursorPos + itemsAbove].value != LIST_HEADER) {
                    list->itemsAbove = itemsAbove;
                    return 1;
                }
            }
            list->itemsAbove = newRow;
            list->cursorPos = (u16)(cursorPos + 1);
        }
    }
    return 2;
}

void ListMenuScroll(struct ListMenu *list, u8 count, u8 movingDown) {
    if (count >= list->template.maxShowed) {
        FillWindowPixelBuffer(list->template.window, list->template.fillValue);
        ListMenuPrintEntries(list, list->cursorPos, 0, list->template.maxShowed);
    } else {
        u8 yMultiplier = (u8)(GetFontAttribute((u8)list->template.fontId, 1) + list->template.itemVerticalPadding);

        if (!movingDown) {
            u16 y, width, height;

            ScrollWindow(list->template.window, 1, (u8)(count * yMultiplier), (u8)((list->template.fillValue << 4) | list->template.fillValue));
            ListMenuPrintEntries(list, list->cursorPos, 0, count);

            y = (u16)((list->template.maxShowed * yMultiplier) + list->template.upText_Y);
            width = GetWindowWidth(list->template.window);
            height = GetWindowHeight(list->template.window);
            FillWindowPixelRect(list->template.window,
                                list->template.fillValue,
                                0, y, (u16)(width * 8), (u16)(height * 8 - y));
        } else {
            u32 width;

            ScrollWindow(list->template.window, 0, (u8)(count * yMultiplier), (u8)((list->template.fillValue << 4) | list->template.fillValue));
            ListMenuPrintEntries(list, (u16)(list->cursorPos + (list->template.maxShowed - count)), (u16)(list->template.maxShowed - count), count);

            width = GetWindowWidth(list->template.window);
            FillWindowPixelRect(list->template.window,
                                list->template.fillValue,
                                0, 0, (u16)(width * 8), list->template.upText_Y);
        }
    }
}

BOOL ListMenuChangeSelection(struct ListMenu *list, u8 updateCursorAndCallCallback, u8 count, u8 movingDown) {
    u16 oldSelectedRow;
    u8 selectionChange, i, cursorCount;

    oldSelectedRow = list->itemsAbove;
    cursorCount = 0;
    selectionChange = 0;
    for (i = 0; i < count; i++) {
        do {
            u8 ret = ListMenuUpdateSelectedRowIndexAndScroll(list, movingDown);

            selectionChange |= ret;
            if (ret != 2)
                break;
            cursorCount++;
        } while (list->template.items[list->cursorPos + list->itemsAbove].value == LIST_HEADER);
    }

    if (updateCursorAndCallCallback) {
        switch (selectionChange) {
        case 0:
        default:
            return TRUE;
        case 1:
            ListMenuErasePrintedCursor(list, oldSelectedRow);
            ListMenuDrawCursor(list);
            ListMenuCallSelectionChangedCallback(list, FALSE);
            CopyWindowToVram(list->template.window);
            break;
        case 2:
        case 3:
            ListMenuErasePrintedCursor(list, oldSelectedRow);
            ListMenuScroll(list, cursorCount, movingDown);
            ListMenuDrawCursor(list);
            ListMenuCallSelectionChangedCallback(list, FALSE);
            CopyWindowToVram(list->template.window);
            break;
        }
    }
    return FALSE;
}

void ListMenuCallSelectionChangedCallback(struct ListMenu * list, u8 onInit) {
    if (list->template.moveCursorFunc != NULL) {
        list->template.moveCursorFunc(list, list->template.items[list->cursorPos + list->itemsAbove].value, onInit);
    }
}
