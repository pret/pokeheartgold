#ifndef POKEHEARTGOLD_SYSTEM_H
#define POKEHEARTGOLD_SYSTEM_H

struct System {
    void (*vBlankIntr)(void *);
    void * vBlankIntrArg;
    void (*hBlankIntr)(void *);
    void * hBlankIntrArg;
    s32 unk10;
    s32 unk14;
    void * unk18;
    void * unk1C;
    void * unk20;
    void * unk24;
    s32 unk28;
    u32 unk2C;
    s32 unk30;
    u32 buttonMode;
    u32 heldKeysRaw;
    u32 newKeysRaw;
    u32 newAndRepeatedKeysRaw;
    u32 heldKeys;
    u32 newKeys;
    u32 newAndRepeatedKeys;
    s32 keyRepeatCounter;
    s32 keyRepeatContinueDelay;
    s32 keyRepeatStartDelay;
    u16 touchX;
    u16 touchY;
    u16 touchNew;
    u16 touchHeld;
    u8 touchpadReadAuto;
    u8 screensFlipped;
    u8 unk66;
    u8 unk67;
    u8 softResetDisabled;
    u8 unk69; // nice
    u8 unk6A;
    u8 unk6B;
    u8 unk6C;
    int unk70;
};

extern struct System gSystem;

void InitSystemForTheGame(void);
void InitGraphicMemory(void);
void InitKeypadAndTouchpad(void);
void sub_0201A4B0(int a0);
void ReadKeypadAndTouchpad(void);

#endif //POKEHEARTGOLD_SYSTEM_H
