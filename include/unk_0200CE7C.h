#ifndef GUARD_POKEHEARTGOLD_UNK_0200CE7C_H
#define GUARD_POKEHEARTGOLD_UNK_0200CE7C_H

#include "global.h"

#include "font_types_def.h"
#include "message_printer.h"

typedef struct UnkBattleSystemSub1A8 {
    FontID fontId;
    NNSG2dCharacterData *unk_04;
    u16 strbuf[16];
    int fillVal;
} UnkBattleSystemSub1A8;

void sub_0200CE7C(MessagePrinter *msgPrinter, u8 glyphId, u32 num, u32 ndigits, PrintingMode mode, Window *window, u32 x, u32 y);
void sub_0200CEB0(UnkBattleSystemSub1A8 *unk, u32 num, u32 ndigits, PrintingMode strConvMode, u16 *dest);

#endif // GUARD_POKEHEARTGOLD_UNK_0200CE7C_H
