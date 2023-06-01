#include "global.h"
#include "filesystem_files_def.h"
#include "gf_gfx_loader.h"
#include "message_printer.h"

static const u16 _020F5C24[][2] = {
    { 0x0140, 0x0008 },
    { 0x0160, 0x0010 },
    { 0x01A0, 0x0010 },
    { 0x01E0, 0x0010 },
    { 0x0220, 0x0010 },
    { 0x0260, 0x0010 },
    { 0x02A0, 0x0010 },
};

struct UnkStruct_0200CC74 *MessagePrinter_new(u32 color1, u32 color2, u32 color3, HeapID heap_id)
{
    struct UnkStruct_0200CC74 *sp8 = AllocFromHeap(heap_id, sizeof(struct UnkStruct_0200CC74));
    if (sp8 != NULL)
    {
        sp8->unk_0 = GfGfxLoader_GetCharData(NARC_graphic_font, NARC_poketool_pokegra_height, 1, &sp8->unk_4, heap_id);
        int i;
        u8 *ptr = sp8->unk_4->pRawData;
        for (i = 0; i < sp8->unk_4->szByte; i++)
        {
            switch (ptr[i])
            {
            case 0x00:
                ptr[i] = ((color3 << 4) | color3);
                break;
            case 0x01:
                ptr[i] = ((color3 << 4) | color1);
                break;
            case 0x02:
                ptr[i] = ((color3 << 4) | color2);
                break;
            case 0x10:
                ptr[i] = ((color1 << 4) | color3);
                break;
            case 0x11:
                ptr[i] = ((color1 << 4) | color1);
                break;
            case 0x12:
                ptr[i] = ((color1 << 4) | color2);
                break;
            case 0x20:
                ptr[i] = ((color2 << 4) | color3);
                break;
            case 0x21:
                ptr[i] = ((color2 << 4) | color1);
                break;
            case 0x22:
                ptr[i] = ((color2 << 4) | color2);
                break;
            }
        }
        sp8->unk_28 = color3;
    }
    return sp8;
}

void MessagePrinter_delete(struct UnkStruct_0200CC74 *a0)
{
    if (a0 != NULL)
    {
        if (a0->unk_0 != NULL)
            FreeToHeap(a0->unk_0);
        FreeToHeap(a0);
    }
}

void sub_0200CDAC(struct UnkStruct_0200CC74 *a0, u8 a1, WINDOW *a2, u32 a3, u32 a4)
{
    BlitBitmapRectToWindow(a2, a0->unk_4->pRawData + _020F5C24[a1][0], 0, 0, _020F5C24[a1][1], 8, a3, a4, _020F5C24[a1][1], 8);
}

void sub_0200CDF0(struct UnkStruct_0200CC74 *string, u32 value, u32 n, STRCONVMODE mode, WINDOW *window, u32 x, u32 y)
{
    ConvertUIntToDecimalString(string->data, value, mode, n);
    for (int i = 0; string->data[i] != EOS; i++)
    {
        if (string->data[i] >= CHAR_JP_0 && string->data[i] <= CHAR_JP_9)
        {
            BlitBitmapRectToWindow(window, string->unk_4->pRawData + (string->data[i] - CHAR_JP_0) * 32, 0, 0, 8, 8, x, y, 8, 8);
        }
        else
        {
            FillWindowPixelRect(window, string->unk_28, x, y, 8, 8);
        }
        x += 8;
    }
}
