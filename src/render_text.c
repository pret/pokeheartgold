#include "render_text.h"

#include "global.h"

#include "constants/sndseq.h"

#include "font.h"
#include "render_window.h"
#include "string_control_code.h"
#include "system.h"
#include "text.h"
#include "touchscreen.h"
#include "unk_02005D10.h"

static u16 sDownArrowBaseTile;
static TextFlags sTextFlags;
static TouchscreenHitbox sTouchScreenHitbox;

static const u8 sDownArrowTileOffsets[] = { 0, 1, 2, 1 };

static BOOL TextPrinter_ContinueInputHeld(TextPrinterSubStruct *subStruct);
static BOOL TextPrinter_ContinueInputNew(void);
static void TextPrinter_InitDownArrowCounters(TextPrinter *printer);
static void TextPrinter_DrawDownArrow(TextPrinter *printer);
static void TextPrinter_ClearDownArrow(TextPrinter *printer);
static BOOL TextPrinter_Continue(TextPrinter *printer);
static BOOL TextPrinter_WaitAutoMode(TextPrinter *printer);
static BOOL TextPrinter_WaitWithDownArrow(TextPrinter *printer);
static u8 TextPrinter_Wait(TextPrinter *printer);

static BOOL TextPrinter_ContinueInputHeld(TextPrinterSubStruct *subStruct) {
    if ((gSystem.heldKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) && subStruct->hasPrintBeenSpedUp) {
        sTextFlags.touchIsSpeedingUpPrint = FALSE;
        return TRUE;
    }

    if (sTextFlags.canTouchSpeedUpPrint) {
        if (!gSystem.touchHeld) {
            return FALSE;
        }

        if (sTextFlags.touchHitboxActive) {
            if (TouchscreenHitbox_TouchHeldIsIn(&sTouchScreenHitbox)) {
                sTextFlags.touchIsSpeedingUpPrint = TRUE;
                return TRUE;
            }
            return FALSE;
        } else {
            sTextFlags.touchIsSpeedingUpPrint = TRUE;
            return TRUE;
        }
    }
    return FALSE;
}

static BOOL TextPrinter_ContinueInputNew(void) {
    if (gSystem.newKeys & (PAD_BUTTON_A | PAD_BUTTON_B)) {
        sTextFlags.touchIsSpeedingUpPrint = FALSE;
        return TRUE;
    }

    if (sTextFlags.canTouchSpeedUpPrint) {
        if (!gSystem.touchNew) {
            return FALSE;
        }

        if (sTextFlags.touchHitboxActive) {
            if (TouchscreenHitbox_TouchNewIsIn(&sTouchScreenHitbox)) {
                sTextFlags.touchIsSpeedingUpPrint = TRUE;
                return TRUE;
            }
            return FALSE;
        } else {
            sTextFlags.touchIsSpeedingUpPrint = TRUE;
            return TRUE;
        }
    }
    return FALSE;
}

RenderResult RenderText(TextPrinter *printer) {
    TextPrinterSubStruct *subStruct = (TextPrinterSubStruct *)(&printer->subStructFields);
    u16 currentChar;

    switch (printer->state) {
    case 0:
        if (TextPrinter_ContinueInputHeld(subStruct)) {
            printer->delayCounter = 0;
            if (printer->textSpeedBottom != 0) {
                sTextFlags.hasSpedUpInput = 1;
            }
        }

        if (printer->delayCounter && printer->textSpeedBottom) {
            printer->delayCounter--;

            if (sTextFlags.canABSpeedUpPrint != 0) {
                if (TextPrinter_ContinueInputNew()) {
                    subStruct->hasPrintBeenSpedUp = 1;
                    printer->delayCounter = 0;
                }
            }

            return RENDER_UPDATE;
        }

        printer->delayCounter = printer->textSpeedBottom;
        currentChar = *printer->template.currentChar.raw;
        printer->template.currentChar.raw++;

        GF_ASSERT(currentChar != 0xF100);

        switch (currentChar) {
        case EOS:
            return RENDER_FINISH;
        case CHAR_LF:
            printer->template.currentX = printer->template.x;
            s32 fontAttribute = GetFontAttribute(printer->template.fontId, 1);

            printer->template.currentY += printer->template.lineSpacing + fontAttribute;

            return RENDER_REPEAT;

        case 0xF0FD:
            printer->template.currentChar.raw++;
            return RENDER_REPEAT;
        case EXT_CTRL_CODE_BEGIN:
            printer->template.currentChar.raw--;
            switch ((u16)MsgArray_GetControlCode(printer->template.currentChar.raw)) {
            case 0xFF00:
                u16 field = MsgArray_ControlCodeGetField(
                    printer->template.currentChar.raw, 0);
                if (field == 0xff) {
                    u8 r2 = printer->template.unk1B;
                    printer->template.unk1B = ((printer->template.fgColor - 1) / 2 + 100);

                    if (r2 < 100 || r2 >= 107) {
                        break;
                    }

                    field = (r2 - 100);
                } else {
                    if (field >= 100) {
                        printer->template.unk1B = field;
                        break;
                    }
                }

                printer->template.fgColor = (field * 2 + 1);
                printer->template.shadowColor = (field * 2 + 2);

                GenerateFontHalfRowLookupTable(printer->template.fgColor,
                    printer->template.bgColor,
                    printer->template.shadowColor);

                break;

            case 0x200:
                field = MsgArray_ControlCodeGetField(
                    printer->template.currentChar.raw, 0);

                RenderScreenFocusIndicatorTile(printer,
                    printer->template.currentX,
                    printer->template.currentY,
                    field);
                if (printer->textSpeedTop != 0) {
                    CopyWindowToVram(printer->template.window);
                }

                break;
            case 0x207:
                printer->state = 7;
                TextPrinter_InitDownArrowCounters(printer);
                printer->template.currentChar.raw = MsgArray_SkipControlCode(printer->template.currentChar.raw);
                if (*printer->template.currentChar.raw == 0xE000) {
                    ++printer->template.currentChar.raw;
                }
                return RENDER_UPDATE;
            case 0x208:
                printer->state = 8;
                TextPrinter_InitDownArrowCounters(printer);
                printer->template.currentChar.raw = MsgArray_SkipControlCode(printer->template.currentChar.raw);
                if (*printer->template.currentChar.raw == 0xE000) {
                    ++printer->template.currentChar.raw;
                }
                return RENDER_UPDATE;
            case 0x201:
                printer->delayCounter = MsgArray_ControlCodeGetField(
                    printer->template.currentChar.raw, 0);
                printer->template.currentChar.raw = MsgArray_SkipControlCode(printer->template.currentChar.raw);
                printer->state = 6;

                return RENDER_UPDATE;
            case 0x202:
                printer->unk2E = MsgArray_ControlCodeGetField(
                    printer->template.currentChar.raw, 0);
                printer->template.currentChar.raw = MsgArray_SkipControlCode(printer->template.currentChar.raw);

                return RENDER_UPDATE;
            case 0x203:
                printer->template.currentX = MsgArray_ControlCodeGetField(
                    printer->template.currentChar.raw, 0);
                break;
            case 0x204:
                printer->template.currentY = MsgArray_ControlCodeGetField(
                    printer->template.currentChar.raw, 0);
                break;
            case 0x205: {
                int x = GetWindowWidth(printer->template.window) * 8;
                int width = FontID_FlatArray_GetWidthFirstLine(printer->template.fontId, printer->template.currentChar.raw, printer->template.letterSpacing);
                if (width < x) {
                    printer->template.currentX = printer->template.x + (x - width) / 2;
                } else {
                    printer->template.currentX = printer->template.x;
                }
            } break;
            case 0x206: {
                int x = GetWindowWidth(printer->template.window) * 8;
                int width = FontID_FlatArray_GetWidthFirstLine(printer->template.fontId, printer->template.currentChar.raw, printer->template.letterSpacing);
                if (width < x) {
                    printer->template.currentX = x - width;
                } else {
                    printer->template.currentX = printer->template.x;
                }
            } break;

            case 0xFF01:
                field = MsgArray_ControlCodeGetField(
                    printer->template.currentChar.raw, 0);

                switch (field) {
                case 100:
                    printer->template.glyphTable = 0;
                    printer->template.unk1A = 0;
                    break;
                case 200:
                    printer->template.glyphTable = 0xFFFC;
                    printer->template.unk1A = 0;
                    break;
                }

                break;

            case 0xFE06:
                field = MsgArray_ControlCodeGetField(
                    printer->template.currentChar.raw, 0);
                if (field != 0xFE00) {
                    if (field != 0xFE01) {
                        break;
                    }

                    printer->state = 2;
                    TextPrinter_InitDownArrowCounters(printer);
                    printer->template.currentChar.raw = MsgArray_SkipControlCode(
                        printer->template.currentChar.raw);

                    return RENDER_UPDATE;
                }

                printer->state = 3;
                TextPrinter_InitDownArrowCounters(printer);
                printer->template.currentChar.raw = MsgArray_SkipControlCode(printer->template.currentChar.raw);

                return RENDER_UPDATE;
            }

            printer->template.currentChar.raw = MsgArray_SkipControlCode(printer->template.currentChar.raw);
            return RENDER_REPEAT;

        case 0x25BC:
            printer->state = 2;
            TextPrinter_InitDownArrowCounters(printer);
            return RENDER_UPDATE;

        case 0x25BD:
            printer->state = 3;
            TextPrinter_InitDownArrowCounters(printer);
            return RENDER_UPDATE;
        }

        GlyphInfo *glyphInfo = FontID_TryLoadGlyph(subStruct->fontId, currentChar);
        CopyGlyphToWindow(printer->template.window,
            glyphInfo->data,
            glyphInfo->width,
            glyphInfo->height,
            printer->template.currentX,
            printer->template.currentY,
            printer->template.glyphTable);

        printer->template.currentX += glyphInfo->width + printer->template.letterSpacing;

        return RENDER_PRINT;
    case 1:
        if (TextPrinter_Wait(printer) != 0) {
            TextPrinter_ClearDownArrow(printer);

            printer->state = 0;
        }

        return RENDER_UPDATE;
    case 2:
        if (TextPrinter_WaitWithDownArrow(printer) != 0) {
            TextPrinter_ClearDownArrow(printer);
            FillWindowPixelBuffer(
                printer->template.window, printer->template.bgColor);
            printer->template.currentX = printer->template.x;
            printer->template.currentY = printer->template.y;
            printer->state = 0;
        }

        return RENDER_UPDATE;
    case 3:
        if (TextPrinter_WaitWithDownArrow(printer) != 0) {
            TextPrinter_ClearDownArrow(printer);
            printer->scrollDistance = (GetFontAttribute(printer->template.fontId, 1) + printer->template.lineSpacing);
            printer->template.currentX = printer->template.x;
            printer->state = 4;
        }

        return RENDER_UPDATE;
    case 4:
        if (printer->scrollDistance != 0) {
            if ((int)printer->scrollDistance < 4) {
                ScrollWindow(printer->template.window,
                    0,
                    printer->scrollDistance,
                    printer->template.bgColor | (printer->template.bgColor << 4));
                printer->scrollDistance = 0;
            } else {
                ScrollWindow(printer->template.window,
                    0,
                    4,
                    printer->template.bgColor | (printer->template.bgColor << 4));

                printer->scrollDistance -= 4;
            }

            CopyWindowToVram(printer->template.window);
        } else {
            printer->state = 0;
        }

        return RENDER_UPDATE;
    case 5:
        printer->state = 0;
        return RENDER_UPDATE;
    case 6:
        if (printer->delayCounter != 0) {
            printer->delayCounter--;
        } else {
            printer->state = 0;
        }

        return RENDER_UPDATE;

    case 7:
        if (TextPrinter_WaitWithDownArrow(printer)) {
            TextPrinter_ClearDownArrow(printer);
            FillWindowPixelBuffer(printer->template.window, printer->template.bgColor);
            printer->template.currentX = printer->template.x;
            printer->template.currentY = printer->template.y;
            printer->state = 0;
        }
        return RENDER_UPDATE;
    case 8:
        if (TextPrinter_WaitWithDownArrow(printer)) {
            TextPrinter_ClearDownArrow(printer);
            printer->scrollDistance = printer->template.lineSpacing + GetFontAttribute(printer->template.fontId, 1);
            printer->template.currentX = printer->template.x;
            printer->state = 4;
        }
        return RENDER_UPDATE;
    }

    return RENDER_FINISH;
}

void TextPrinter_SetDownArrowBaseTile(int tile) {
    sDownArrowBaseTile = tile;
}

static void TextPrinter_InitDownArrowCounters(TextPrinter *printer) {
    TextPrinterSubStruct *subStruct = (TextPrinterSubStruct *)(&printer->subStructFields);

    if (sTextFlags.autoScroll) {
        subStruct->autoScrollDelay = 0;
    } else {
        subStruct->downArrowYPosIdx = 0;
        subStruct->downArrowDelay = 0;
    }
    sub_0200EB68(printer->template.window, sDownArrowBaseTile);
}

// Possible UB? Where does downArrowYPosIdx get reset to 0 when it reaches NELEMS(sDownArrowTileOffsets) == 4?
static void TextPrinter_DrawDownArrow(TextPrinter *printer) {
    TextPrinterSubStruct *subStruct = (TextPrinterSubStruct *)(&printer->subStructFields);

    if (sTextFlags.autoScroll || sTextFlags.useAlternateDownArrow) {
        return;
    }

    if (subStruct->downArrowDelay != 0) {
        subStruct->downArrowDelay--;
        return;
    }

    u8 bg_id = GetWindowBgId(printer->template.window);
    u8 x = GetWindowX(printer->template.window);
    u8 y = GetWindowY(printer->template.window);
    u8 width = GetWindowWidth(printer->template.window);
    u8 height = GetWindowHeight(printer->template.window) - 2;
    u16 baseTile = sDownArrowBaseTile;

    FillBgTilemapRect(printer->template.window->bgConfig,
        bg_id,
        baseTile + 18 + sDownArrowTileOffsets[subStruct->downArrowYPosIdx] * 4,
        x + width + 1,
        y + height,
        1,
        1,
        0x10);

    FillBgTilemapRect(printer->template.window->bgConfig,
        bg_id,
        baseTile + 19 + sDownArrowTileOffsets[subStruct->downArrowYPosIdx] * 4,
        x + width + 2,
        y + height,
        1,
        1,
        0x10);
    FillBgTilemapRect(printer->template.window->bgConfig,
        bg_id,
        baseTile + 20 + sDownArrowTileOffsets[subStruct->downArrowYPosIdx] * 4,
        x + width + 1,
        y + height + 1,
        1,
        1,
        0x10);
    FillBgTilemapRect(printer->template.window->bgConfig,
        bg_id,
        baseTile + 21 + sDownArrowTileOffsets[subStruct->downArrowYPosIdx] * 4,
        x + width + 2,
        y + height + 1,
        1,
        1,
        0x10);

    BgCommitTilemapBufferToVram(printer->template.window->bgConfig, bg_id);
    subStruct->downArrowDelay = 8;
    subStruct->downArrowYPosIdx++;
}

static void TextPrinter_ClearDownArrow(TextPrinter *printer) {
    if (sTextFlags.useAlternateDownArrow) {
        return;
    }

    u8 bg_id = GetWindowBgId(printer->template.window);
    u8 x = GetWindowX(printer->template.window);
    u8 y = GetWindowY(printer->template.window);
    u8 width = GetWindowWidth(printer->template.window);
    u8 height = GetWindowHeight(printer->template.window) - 2;
    u16 baseTile = sDownArrowBaseTile;

    FillBgTilemapRect(printer->template.window->bgConfig,
        bg_id,
        baseTile + 10,
        x + width + 1,
        y + height,
        1,
        2,
        0x10);
    FillBgTilemapRect(printer->template.window->bgConfig,
        bg_id,
        baseTile + 11,
        x + width + 2,
        y + height,
        1,
        2,
        0x10);
    BgCommitTilemapBufferToVram(printer->template.window->bgConfig, bg_id);
}

static BOOL TextPrinter_Continue(TextPrinter *printer) {
#pragma unused(printer)
    if (TextPrinter_ContinueInputNew()) {
        PlaySE(SEQ_SE_DP_SELECT);

        sTextFlags.hasContinuedInput = 1;

        return TRUE;
    }

    return FALSE;
}

static BOOL TextPrinter_WaitAutoMode(TextPrinter *printer) {
    TextPrinterSubStruct *subStruct = (TextPrinterSubStruct *)(&printer->subStructFields);

    if (subStruct->autoScrollDelay == 100) {
        return TRUE;
    }

    subStruct->autoScrollDelay++;
    if (sTextFlags.autoScrollCanSpeedUp) {
        return TextPrinter_Continue(printer);
    }

    return FALSE;
}

static BOOL TextPrinter_WaitWithDownArrow(TextPrinter *printer) {
    if (sTextFlags.autoScroll) {
        return TextPrinter_WaitAutoMode(printer);
    }
    TextPrinter_DrawDownArrow(printer);

    return TextPrinter_Continue(printer);
}

static u8 TextPrinter_Wait(TextPrinter *printer) {
    if (sTextFlags.autoScroll) {
        return TextPrinter_WaitAutoMode(printer);
    }

    return TextPrinter_Continue(printer);
}

void TextFlags_SetCanABSpeedUpPrint(BOOL param0) {
    sTextFlags.canABSpeedUpPrint = param0;
}

void TextFlags_SetAutoScrollParam(int param0) {
    sTextFlags.autoScroll = param0 & 1;
    sTextFlags.autoScrollCanSpeedUp = (param0 >> 1) & 1;
}

void TextFlags_SetCanTouchSpeedUpPrint(BOOL enable) {
    sTextFlags.canTouchSpeedUpPrint = enable;
}

void TextFlags_SetAlternateDownArrow(BOOL enable) {
    sTextFlags.useAlternateDownArrow = enable;
}

u8 TextFlags_GetHasSpedUpInput(void) {
    return sTextFlags.hasSpedUpInput;
}

void TextFlags_ResetHasSpedUpInput(void) {
    sTextFlags.hasSpedUpInput = 0;
}

u8 TextFlags_GetHasContinuedInput(void) {
    return sTextFlags.hasContinuedInput;
}

void TextFlags_ResetHasContinuedInput(void) {
    sTextFlags.hasContinuedInput = 0;
}

BOOL TextFlags_GetIsTouchSpeedingUpPrint(void) {
    if (sTextFlags.canTouchSpeedUpPrint) {
        return sTextFlags.touchIsSpeedingUpPrint;
    } else {
        return FALSE;
    }
}

void TextFlags_SetFastForwardTouchButtonHitbox(const TouchscreenHitbox *hitbox) {
    sTextFlags.touchHitboxActive = TRUE;
    sTouchScreenHitbox = *hitbox;
}

void TextFlags_UnsetFastForwardTouchButtonHitbox(void) {
    sTextFlags.touchHitboxActive = FALSE;
    sTouchScreenHitbox.rect.top = 0;
    sTouchScreenHitbox.rect.bottom = 192;
    sTouchScreenHitbox.rect.left = 0;
    sTouchScreenHitbox.rect.right = 255;
}

void TextFlags_BeginAutoScroll(BOOL noSpeedUp) {
    if (noSpeedUp == FALSE) {
        TextFlags_SetCanABSpeedUpPrint(TRUE);
        TextFlags_SetAutoScrollParam(AUTO_SCROLL_ENABLE | AUTO_SCROLL_SPEEDUP);
        TextFlags_SetCanTouchSpeedUpPrint(TRUE);
    } else {
        TextFlags_SetAutoScrollParam(AUTO_SCROLL_ENABLE);
        TextFlags_SetCanABSpeedUpPrint(FALSE);
        TextFlags_SetCanTouchSpeedUpPrint(FALSE);
    }
}

void TextFlags_EndAutoScroll(void) {
    TextFlags_SetCanABSpeedUpPrint(FALSE);
    TextFlags_SetAutoScrollParam(AUTO_SCROLL_OFF);
    TextFlags_SetCanTouchSpeedUpPrint(FALSE);
}
