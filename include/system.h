#ifndef POKEHEARTGOLD_SYSTEM_H
#define POKEHEARTGOLD_SYSTEM_H

#include "unk_0201F79C.h"

#define BUTTONMODE_NORMAL         0
#define BUTTONMODE_STARTEQUALSX   1
#define BUTTONMODE_SWAPXY         2
#define BUTTONMODE_LEQUALSA       3

typedef void (*GFIntrCB)(void *);

struct FSCacheEntry {
    void *data;
    u32 hash;
};

struct System {
    GFIntrCB vBlankIntr;
    void *vBlankIntrArg;
    GFIntrCB hBlankIntr;
    void *hBlankIntrArg;
    void (*unk10)(void);
    void (*unk14)(void);
    UNK_0201F79C *unk18;
    UNK_0201F79C *unk1C;
    UNK_0201F79C *unk20;
    UNK_0201F79C *unk24;
    u32 *unk28;
    u32 vblankCounter;
    u32 unk30;
    int buttonMode;
    int heldKeysRaw;
    int newKeysRaw;
    int newAndRepeatedKeysRaw; // 40
    int heldKeys;
    int newKeys;
    int newAndRepeatedKeys;
    int keyRepeatCounter; // 50
    int keyRepeatContinueDelay;
    int keyRepeatStartDelay;
    int simulatedInputs;

    u16 touchX;
    u16 touchY;
    u16 touchNew;
    u16 touchHeld;
    u8 touchpadReadAuto;
    u8 screensFlipped;
    u8 unk6A;
    u8 lidClosedPauseDisabled;
    u8 softResetDisabled;
    BOOL unk70;
    u32 *unk74;
}; // size=0x478

extern struct System gSystem;

void InitSystemForTheGame(void);
void InitGraphicMemory(void);
void InitKeypadAndTouchpad(void);
void sub_0201A4B0(int a0);
void ReadKeypadAndTouchpad(void);

#endif //POKEHEARTGOLD_SYSTEM_H
