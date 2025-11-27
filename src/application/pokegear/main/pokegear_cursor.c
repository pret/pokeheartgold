#include "application/pokegear/pokegear_internal.h"

static u16 PokegearCursorManager_GetFreeCursorSlot(PokegearCursorManager *cursorManager);
static void PokegearCursorManager_UpdateCursorSpritePosition(PokegearCursorManager *cursorManager, u16 index);
static void PokegearCursorManager_UpdateActiveCursorPosition(PokegearCursorManager *cursorManager, u8 move);
static u8 PokegearCursorManager_SetCursorPosition(PokegearCursorManager *cursorManager, u16 index, u8 newIndex);

PokegearCursorManager *PokegearCursorManager_Alloc(int count, enum HeapID heapID) {
    PokegearCursorManager *ret = (PokegearCursorManager *)Heap_Alloc(heapID, sizeof(PokegearCursorManager));
    MI_CpuClear8(ret, sizeof(PokegearCursorManager));
    ret->count = count;
    ret->cursors = Heap_Alloc(heapID, count * sizeof(PokegearCursor));
    MI_CpuClear8(ret->cursors, count * sizeof(PokegearCursor));
    return ret;
}

void PokegearCursorManager_Free(PokegearCursorManager *cursorManager) {
    for (int i = 0; i < cursorManager->count; ++i) {
        if (cursorManager->cursors[i].active && cursorManager->cursors[i].grid != NULL) {
            PokegearCursorManager_RemoveCursor(cursorManager, i);
        }
    }
    MI_CpuClear8(cursorManager->cursors, cursorManager->count * sizeof(PokegearCursor));
    Heap_Free(cursorManager->cursors);
    MI_CpuClear8(cursorManager, sizeof(PokegearCursorManager));
    Heap_Free(cursorManager);
}

u16 PokegearCursorManager_AddButtons(PokegearCursorManager *cursorManager, const PokegearCursorGrid *buttonSpec, u8 numSpecs, u8 cursorPos, BOOL managedSprites, enum HeapID heapID, void *cursorSprite1, void *cursorSprite2, void *cursorSprite3, void *cursorSprite4) {
    u16 index = PokegearCursorManager_GetFreeCursorSlot(cursorManager);
    if (index == 0xFFFF) {
        return 0xFFFF;
    }

    PokegearCursor *button = &cursorManager->cursors[index];
    button->active = TRUE;
    button->buttonsAre4Tiles = TRUE;
    button->count = numSpecs;
    button->lastIndex = button->count - 1;
    button->grid = Heap_Alloc(heapID, button->count * sizeof(PokegearCursorGrid));
    MI_CpuCopy8(buttonSpec, button->grid, button->count * sizeof(PokegearCursorGrid));
    if (cursorPos >= button->count) {
        button->cursorPos = 0;
    } else {
        button->cursorPos = cursorPos;
    }
    button->buttonsAreManagedSprite = managedSprites;
    button->cursorSprites[0].raw = cursorSprite1;
    button->cursorSprites[1].raw = cursorSprite2;
    button->cursorSprites[2].raw = cursorSprite3;
    button->cursorSprites[3].raw = cursorSprite4;
    return index;
}

BOOL PokegearCursorManager_RemoveCursor(PokegearCursorManager *cursorManager, u16 cursorIndex) {
    if (cursorIndex >= cursorManager->count || !cursorManager->cursors[cursorIndex].active) {
        return FALSE;
    }
    if (cursorManager->activeCursorIndex == cursorIndex) {
        cursorManager->activeCursorIndex = 0xFFFF;
        cursorManager->lastCursor = NULL;
    }
    MI_CpuClear8(cursorManager->cursors[cursorIndex].grid, cursorManager->cursors[cursorIndex].count * sizeof(PokegearCursorGrid));
    Heap_Free(cursorManager->cursors[cursorIndex].grid);
    MI_CpuClear8(&cursorManager->cursors[cursorIndex], sizeof(PokegearCursor));
    return FALSE;
}

static u16 PokegearCursorManager_GetFreeCursorSlot(PokegearCursorManager *cursorManager) {
    for (u16 i = 0; i < cursorManager->count; ++i) {
        if (!cursorManager->cursors[i].active) {
            return i;
        }
    }

    return 0xFFFF;
}

u16 PokegearCursorManager_SetCursorSpritesDrawState(PokegearCursorManager *cursorManager, u16 index, BOOL draw) {
    PokegearCursor *button;
    if (index == 0xFFFF) {
        button = cursorManager->lastCursor;
    } else if (index >= cursorManager->count || (button = &cursorManager->cursors[index], !button->active)) {
        return 0xFFFF;
    }
    if (!button->buttonsAreManagedSprite) {
        thunk_Sprite_SetDrawFlag(button->cursorSprites[0].unmanaged, draw);
        if (button->buttonsAre4Tiles == TRUE) {
            thunk_Sprite_SetDrawFlag(button->cursorSprites[1].unmanaged, draw);
            thunk_Sprite_SetDrawFlag(button->cursorSprites[2].unmanaged, draw);
            thunk_Sprite_SetDrawFlag(button->cursorSprites[3].unmanaged, draw);
        }
    } else {
        ManagedSprite_SetDrawFlag(button->cursorSprites[0].managed, draw);
        if (button->buttonsAre4Tiles == TRUE) {
            ManagedSprite_SetDrawFlag(button->cursorSprites[1].managed, draw);
            ManagedSprite_SetDrawFlag(button->cursorSprites[2].managed, draw);
            ManagedSprite_SetDrawFlag(button->cursorSprites[3].managed, draw);
        }
    }
    return index;
}

static void PokegearCursorManager_UpdateCursorSpritePosition(PokegearCursorManager *cursorManager, u16 index) {
    PokegearCursor *buttons;
    if (index == 0xFFFF) {
        buttons = cursorManager->lastCursor;
    } else if (index >= cursorManager->count) {
        return;
    } else {
        buttons = &cursorManager->cursors[index];
    }

    PokegearCursorGrid *spec = &buttons->grid[buttons->cursorPos];
    if (!buttons->buttonsAreManagedSprite) {
        if (!buttons->buttonsAre4Tiles) {
            Sprite_SetPositionXY(buttons->cursorSprites[0].unmanaged, spec->x, spec->y);
        } else {
            Sprite_SetPositionXY(buttons->cursorSprites[0].unmanaged, spec->x + spec->leftOffset, spec->y + spec->topOffset);
            Sprite_SetPositionXY(buttons->cursorSprites[1].unmanaged, spec->x + spec->leftOffset, spec->y + spec->bottomOffset);
            Sprite_SetPositionXY(buttons->cursorSprites[2].unmanaged, spec->x + spec->rightOffset, spec->y + spec->topOffset);
            Sprite_SetPositionXY(buttons->cursorSprites[3].unmanaged, spec->x + spec->rightOffset, spec->y + spec->bottomOffset);
        }
    } else {
        if (!buttons->buttonsAre4Tiles) {
            ManagedSprite_SetPositionXY(buttons->cursorSprites[0].managed, spec->x, spec->y);
        } else {
            ManagedSprite_SetPositionXY(buttons->cursorSprites[0].managed, spec->x + spec->leftOffset, spec->y + spec->topOffset);
            ManagedSprite_SetPositionXY(buttons->cursorSprites[1].managed, spec->x + spec->leftOffset, spec->y + spec->bottomOffset);
            ManagedSprite_SetPositionXY(buttons->cursorSprites[2].managed, spec->x + spec->rightOffset, spec->y + spec->topOffset);
            ManagedSprite_SetPositionXY(buttons->cursorSprites[3].managed, spec->x + spec->rightOffset, spec->y + spec->bottomOffset);
        }
    }
}

u16 PokegearCursorManager_SetSpecIndexAndCursorPos(PokegearCursorManager *cursorManager, u16 index, u8 cursorPos) {
    if (index >= cursorManager->count) {
        return 0xFFFF;
    }
    cursorManager->lastCursor = &cursorManager->cursors[index];
    cursorManager->activeCursorIndex = index;
    if (cursorPos != 0xFF) {
        if (cursorPos >= cursorManager->cursors[index].count) {
            cursorManager->cursors[index].cursorPos = 0;
        } else {
            cursorManager->cursors[index].cursorPos = cursorPos;
        }
    }
    PokegearCursorManager_UpdateCursorSpritePosition(cursorManager, 0xFFFF);
    return index;
}

u8 PokegearCursorManager_GetCursorPos(PokegearCursorManager *cursorManager) {
    return cursorManager->lastCursor->cursorPos;
}

u8 PokegearCursorManager_GetSpecCursorPos(PokegearCursorManager *cursorManager, u16 index) {
    if (index == 0xFFFF) {
        return cursorManager->lastCursor->cursorPos;
    } else if (index >= cursorManager->count || !cursorManager->cursors[index].active) {
        return 0;
    } else {
        return cursorManager->cursors[index].cursorPos;
    }
}

static void PokegearCursorManager_UpdateActiveCursorPosition(PokegearCursorManager *cursorManager, u8 move) {
    if (cursorManager->lastCursor != NULL) {
        PokegearCursorGrid *spec = &cursorManager->lastCursor->grid[cursorManager->lastCursor->cursorPos];
        u8 newIndex;
        switch (move) {
        case 1:
            newIndex = spec->buttonRight;
            break;
        case 2:
            newIndex = spec->buttonUp;
            break;
        case 3:
            newIndex = spec->buttonDown;
            break;
        case 0:
        default:
            newIndex = spec->buttonLeft;
            break;
        }
        if (newIndex <= cursorManager->lastCursor->lastIndex) {
            cursorManager->lastCursor->cursorPos = newIndex;
        }
    }
}

u8 PokegearCursorManager_MoveActiveCursor(PokegearCursorManager *cursorManager, u8 move) {
    PokegearCursorManager_UpdateActiveCursorPosition(cursorManager, move);
    PokegearCursorManager_UpdateCursorSpritePosition(cursorManager, 0xFFFF);
    return cursorManager->lastCursor->cursorPos;
}

u8 PokegearCursorManager_SetActiveCursorPosition(PokegearCursorManager *cursorManager, u8 newIndex) {
    return PokegearCursorManager_SetCursorPosition(cursorManager, cursorManager->activeCursorIndex, newIndex);
}

static u8 PokegearCursorManager_SetCursorPosition(PokegearCursorManager *cursorManager, u16 index, u8 newIndex) {
    PokegearCursor *button;
    if (index == 0xFFFF) {
        button = cursorManager->lastCursor;
        index = cursorManager->activeCursorIndex;
    } else if (index >= cursorManager->count || (button = &cursorManager->cursors[index], !button->active)) {
        return 0;
    }
    if (button->lastIndex < newIndex) {
        button->cursorPos = 0;
    } else {
        button->cursorPos = newIndex;
    }
    PokegearCursorManager_UpdateCursorSpritePosition(cursorManager, index);
    return button->cursorPos;
}

void PokegearCursorManager_SetCursorSpritesAnimateFlag(PokegearCursorManager *cursorManager, u16 index, BOOL active) {
    if (index == 0xFFFF) {
        index = cursorManager->activeCursorIndex;
    }
    if (index < cursorManager->count) {
        PokegearCursor *button = &cursorManager->cursors[index];
        if (button->active) {
            if (!button->buttonsAreManagedSprite) {
                if (!button->buttonsAre4Tiles) {
                    Sprite_ResetAnimCtrlState(button->cursorSprites[0].unmanaged);
                    thunk_Sprite_SetAnimationFlag(button->cursorSprites[0].unmanaged, active);
                } else {
                    for (int i = 0; i < 4; ++i) {
                        Sprite_ResetAnimCtrlState(button->cursorSprites[i].unmanaged);
                        thunk_Sprite_SetAnimationFlag(button->cursorSprites[i].unmanaged, active);
                    }
                }
            } else {
                if (!button->buttonsAre4Tiles) {
                    ManagedSprite_ResetSpriteAnimCtrlState(button->cursorSprites[0].managed);
                    ManagedSprite_SetAnimateFlag(button->cursorSprites[0].managed, active);
                } else {
                    for (int i = 0; i < 4; ++i) {
                        ManagedSprite_ResetSpriteAnimCtrlState(button->cursorSprites[i].managed);
                        ManagedSprite_SetAnimateFlag(button->cursorSprites[i].managed, active);
                    }
                }
            }
        }
    }
}
