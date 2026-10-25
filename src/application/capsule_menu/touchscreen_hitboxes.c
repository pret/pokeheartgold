#include "application/capsule_menu/defs.h"

#include "pokemon.h"

const TouchscreenHitbox ov57_0223BEF4[] = {
    { .rect = { 0x10, 0x20, 0x08, 0x18 } },
    { .rect = { 0x10, 0x20, 0x40, 0x50 } },
    { .rect = { 0x28, 0x38, 0x08, 0x18 } },
    { .rect = { 0x28, 0x38, 0x40, 0x50 } },
    { .rect = { 0x40, 0x50, 0x08, 0x18 } },
    { .rect = { 0x40, 0x50, 0x40, 0x50 } },
    { .rect = { 0x58, 0x68, 0x08, 0x18 } },
    { .rect = { 0x58, 0x68, 0x40, 0x50 } },
    { .rect = { 0x68, 0x80, 0x08, 0x30 } },
    { .rect = { 0x68, 0x80, 0x38, 0x60 } },
    { .rect = { 0xA8, 0xBC, 0x12, 0x4D } },
    { .rect = { 0xA8, 0xBC, 0x61, 0x9C } },
    { .rect = { 0xA8, 0xBC, 0xB2, 0xED } },
};

void ov57_0223BB84(CapsuleAppManager *appMan) {
    int i;
    const TouchscreenHitbox emptyRect = { 0 };

    for (i = 0; i < 13; ++i) {
        appMan->unk_0D4.unk_11C[i] = ov57_0223BEF4[i];
    }
    for (; i < 21; ++i) {
        appMan->unk_0D4.unk_11C[i] = emptyRect;
        appMan->unk_34C[i - 13].touchscreenHitbox = &appMan->unk_0D4.unk_11C[i];
    }
    appMan->unk_0D4.unk_118 = TouchHitboxController_Create(appMan->unk_0D4.unk_11C, 21, ov57_0223AEA8, appMan, HEAP_ID_52);
}

void ov57_0223BC4C(CapsuleAppManager *appMan, int capsuleIndex) {
    u32 sp0 = 0;

    if (appMan->unk_004[capsuleIndex].partyIdx != 0xFF) {
        SetMonData(appMan->unk_000->mons[appMan->unk_004[capsuleIndex].partyIdx], MON_DATA_BALL_CAPSULE_ID, &sp0);
    }
    appMan->unk_004[capsuleIndex].partyIdx = 0xFF;
    ov57_022394AC(appMan);
}
