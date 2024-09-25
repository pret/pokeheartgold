#ifndef GUARD_POKEHEARTGOLD_UNK_0200CE7C_H
#define GUARD_POKEHEARTGOLD_UNK_0200CE7C_H

#include "global.h"

#include "font_types_def.h"
#include "message_printer.h"

typedef struct BattleNumberPrinter {
    FontID fontId;
    NNSG2dCharacterData *charData;
    u16 strbuf[16];
    int fillVal;
} BattleNumberPrinter;

void sub_0200CE7C(MessagePrinter *msgPrinter, u8 glyphId, u32 num, u32 ndigits, PrintingMode mode, Window *window, u32 x, u32 y);
void sub_0200CEB0(BattleNumberPrinter *unk, u32 num, u32 ndigits, PrintingMode strConvMode, u16 *dest);

#endif // GUARD_POKEHEARTGOLD_UNK_0200CE7C_H
