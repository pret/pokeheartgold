#include "unk_0200CE7C.h"

void sub_0200CE7C(MessagePrinter *msgPrinter, u8 glyphId, u32 num, u32 ndigits, PrintingMode mode, Window *window, u32 x, u32 y) {
    sub_0200CDAC(msgPrinter, glyphId, window, x, y);
    PrintUIntOnWindow(msgPrinter, num, ndigits, mode, window, x + 16, y);
}

void sub_0200CEB0(BattleNumberPrinter *unk, u32 num, u32 ndigits, PrintingMode strConvMode, u16 *dest) {
    u8 fillVal = (unk->fillVal << 4) | unk->fillVal;
    ConvertUIntToDecimalString(unk->strbuf, num, strConvMode, ndigits);
    for (int i = 0; unk->strbuf[i] != EOS; ++i) {
        if (unk->strbuf[i] >= CHAR_JP_0 && unk->strbuf[i] <= CHAR_JP_9) {
            const u8 *src = (const u8 *)unk->charData->pRawData + 32 * (unk->strbuf[i] - CHAR_JP_0);
            u8 *dst = (u8 *)dest + i * 32;
            MI_CpuCopy32(
                src,
                dst,
                32);
        } else {
            u8 *dst = (u8 *)dest + i * 32;
            MI_CpuFill8(dst, fillVal, 32);
        }
    }
}
