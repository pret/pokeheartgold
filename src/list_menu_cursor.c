#include "list_menu_cursor.h"

#include <nitro.h>

#include "global.h"

#include "constants/charcode.h"

#include "bg_window.h"
#include "heap.h"
#include "pm_string.h"
#include "text.h"

// TODO: sync with plat's colored_arrow.c

ListMenuCursor *ListMenuCursorNew(enum HeapID heapID) {
    static const u16 chars[] = {
        CHAR_JP_CONTINUE_ARROW,
        EOS,
    };
    ListMenuCursor *cursor = Heap_Alloc(heapID, sizeof(ListMenuCursor));

    if (cursor != NULL) {
        cursor->color = MAKE_TEXT_COLOR(1, 2, 15);
        cursor->string = String_New(4, heapID);
        CopyU16ArrayToString(cursor->string, chars);
    }

    return cursor;
}

void DestroyListMenuCursorObj(ListMenuCursor *cursor) {
    GF_ASSERT(cursor != NULL);

    if (cursor != NULL) {
        if (cursor->string) {
            String_Delete(cursor->string);
        }

        Heap_Free(cursor);
    }
}

void ListMenuCursorSetColor(ListMenuCursor *cursor, u32 color) {
    GF_ASSERT(cursor != NULL);

    if (cursor != NULL) {
        cursor->color = color;
    }
}

void ListMenuUpdateCursorObj(const ListMenuCursor *cursor, Window *window, u32 xOffset, u32 yOffset) {
    AddTextPrinterParameterizedWithColor(window, FONT_SYSTEM, cursor->string, xOffset, yOffset, TEXT_SPEED_NOTRANSFER, cursor->color, NULL);
    CopyWindowPixelsToVram_TextMode(window);
}
