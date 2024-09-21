#ifndef POKEHEARTGOLD_RENDER_TEXT_H
#define POKEHEARTGOLD_RENDER_TEXT_H

#include "text.h"
#include "touchscreen.h"

typedef struct TextFlags {
    u8 canABSpeedUpPrint     : 1;
    u8 useAlternateDownArrow : 1;
    u8 autoScroll            : 1;
    u8 forceMidTextSpeed     : 1;
    u8 unk0_4                : 1;
    u8 unk0_5                : 1;
    u8 unk0_6                : 1;
    u8 unk0_7                : 1;
    u8 unk1_0                : 1;
    u8 unk1_1                : 1;
} TextFlags;

typedef struct TextPrinterSubStruct {
    u8 fontId             : 4; // 0x14
    u8 hasPrintBeenSpedUp : 1;
    u8 unk                : 3;
    u8 downArrowDelay     : 5;
    u8 downArrowYPosIdx   : 2;
    u8 hasFontIdBeenSet   : 1;
    u8 autoScrollDelay    : 8;
} TextPrinterSubStruct;

RenderResult RenderText(TextPrinter *printer);
void TextFlags_SetCanABSpeedUpPrint(BOOL enable);
void sub_020027F0(int a0);
void sub_02002B50(int a0);
void sub_02002B8C(BOOL enable);
void sub_02002BA8(BOOL enable);
u8 sub_02002BC4();
void sub_02002BD4(void);
u8 sub_02002BE4(void);
void sub_02002BF4(void);
BOOL sub_02002C04(void);
void sub_02002C20(const TouchscreenHitbox *hitbox);
void sub_02002C40(void);
void sub_02002C60(BOOL a0);
void sub_02002C90(void);

#endif // POKEHEARTGOLD_RENDER_TEXT_H
