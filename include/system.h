#ifndef POKEHEARTGOLD_SYSTEM_H
#define POKEHEARTGOLD_SYSTEM_H

#include "heap.h"
#include "sys_task.h"

#define BUTTONMODE_NORMAL       0
#define BUTTONMODE_STARTEQUALSX 1
#define BUTTONMODE_SWAPXY       2
#define BUTTONMODE_LEQUALSA     3

#define OFFSET_OF(p_type, field) ((u32) & (((p_type)NULL)->field))

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
    SysTaskQueue *mainTaskQueue;
    SysTaskQueue *vblankTaskQueue;
    SysTaskQueue *vwaitTaskQueue;
    SysTaskQueue *printTaskQueue;
    u32 *unk28;
    u32 vblankCounter;
    u32 frameCounter;
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

    u16 touchX; // 60
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

void sub_0201A0E0(void);
void Main_SetVBlankIntrCB(GFIntrCB cb, void *arg);
void HBlankInterruptDisable(void);
BOOL Main_SetHBlankIntrCB(GFIntrCB cb, void *arg);
void InitSystemForTheGame(void);
void InitGraphicMemory(void);
void *Sys_AllocAndReadFile(HeapID heapId, const char *path);
void sub_0201A3F8(const char *path, void **mem);
void sub_0201A430(void);
void InitKeypadAndTouchpad(void);
void sub_0201A4B0(int a0);
void Sys_SetSleepDisableFlag(int a0);
void Sys_ClearSleepDisableFlag(int a0);
void ReadKeypadAndTouchpad(void);
void SetKeyRepeatTimers(int cont, int start);
void sub_0201A728(int a0);
void sub_0201A738(int a0);
void sub_0201A748(HeapID heapId);
void sub_0201A774(void);
BOOL sub_0201A79C(void);

#endif // POKEHEARTGOLD_SYSTEM_H
