#ifndef POKEHEARTGOLD_RENDER_TEXT_H
#define POKEHEARTGOLD_RENDER_TEXT_H

#include "text.h"
#include "touchscreen.h"

typedef struct TextFlags {
    u8 canABSpeedUpPrint : 1;
    u8 useAlternateDownArrow : 1;
    u8 autoScroll : 1;
    u8 forceMidTextSpeed : 1;
    u8 canTouchSpeedUpPrint : 1;
    u8 autoScrollCanSpeedUp : 1;
    u8 hasSpedUpInput : 1;
    u8 hasContinuedInput : 1;
    u8 touchIsSpeedingUpPrint : 1;
    u8 touchHitboxActive : 1;
} TextFlags;

typedef struct TextPrinterSubStruct {
    u8 fontId : 4; // 0x14
    u8 hasPrintBeenSpedUp : 1;
    u8 unk : 3;
    u8 downArrowDelay : 5;
    u8 downArrowYPosIdx : 2;
    u8 hasFontIdBeenSet : 1;
    u8 autoScrollDelay : 8;
} TextPrinterSubStruct;

// Argument to TextFlags_SetAutoScrollParam
#define AUTO_SCROLL_OFF     0
#define AUTO_SCROLL_ENABLE  (1 << 0)
#define AUTO_SCROLL_SPEEDUP (1 << 1)

RenderResult RenderText(TextPrinter *printer);
void TextFlags_SetCanABSpeedUpPrint(BOOL enable);
void TextPrinter_SetDownArrowBaseTile(int tile);
void TextFlags_SetAutoScrollParam(int param);
void TextFlags_SetCanTouchSpeedUpPrint(BOOL enable);
void TextFlags_SetAlternateDownArrow(BOOL enable);
u8 TextFlags_GetHasSpedUpInput();
void TextFlags_ResetHasSpedUpInput(void);
u8 TextFlags_GetHasContinuedInput(void);
void TextFlags_ResetHasContinuedInput(void);
BOOL TextFlags_GetIsTouchSpeedingUpPrint(void);
void TextFlags_SetFastForwardTouchButtonHitbox(const TouchscreenHitbox *hitbox);
void TextFlags_UnsetFastForwardTouchButtonHitbox(void);
void TextFlags_BeginAutoScroll(BOOL noSpeedUp);
void TextFlags_EndAutoScroll(void);

#endif // POKEHEARTGOLD_RENDER_TEXT_H
