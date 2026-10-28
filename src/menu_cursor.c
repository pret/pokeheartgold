#include "menu_cursor.h"

#include <nitro.h>

#include "global.h"

#include "constants/charcode.h"

#include "bg_window.h"
#include "heap.h"
#include "pm_string.h"
#include "text.h"

MenuCursor *MenuCursor_New(enum HeapID heapID) {
    static const u16 chars[] = {
        CHAR_JP_CONTINUE_ARROW,
        EOS,
    };
    MenuCursor *cursor = Heap_Alloc(heapID, sizeof(MenuCursor));

    if (cursor != NULL) {
        cursor->color = MAKE_TEXT_COLOR(1, 2, 15);
        cursor->string = String_New(4, heapID);
        CopyU16ArrayToString(cursor->string, chars);
    }

    return cursor;
}

void MenuCursor_Free(MenuCursor *cursor) {
    GF_ASSERT(cursor != NULL);

    if (cursor != NULL) {
        if (cursor->string) {
            String_Delete(cursor->string);
        }

        Heap_Free(cursor);
    }
}

void MenuCursor_SetColor(MenuCursor *cursor, u32 color) {
    GF_ASSERT(cursor != NULL);

    if (cursor != NULL) {
        cursor->color = color;
    }
}

void MenuCursor_Print(const MenuCursor *cursor, Window *window, u32 xOffset, u32 yOffset) {
    AddTextPrinterParameterizedWithColor(window, FONT_SYSTEM, cursor->string, xOffset, yOffset, TEXT_SPEED_NOTRANSFER, cursor->color, NULL);
    CopyWindowPixelsToVram_TextMode(window);
}
