#ifndef POKEHEARTGOLD_RENDER_TEXT_H
#define POKEHEARTGOLD_RENDER_TEXT_H

#include "text.h"

struct TextPrinterSubStruct {
    u8 fontId : 4; // 0x14
    u8 hasPrintBeenSpedUp : 1;
    u8 unk : 3;
    u8 downArrowDelay : 5;
    u8 downArrowYPosIdx : 2;
    u8 hasFontIdBeenSet : 1;
    u8 autoScrollDelay : 8;
};

BOOL RenderText(struct TextPrinter *printer);

#endif //POKEHEARTGOLD_RENDER_TEXT_H
