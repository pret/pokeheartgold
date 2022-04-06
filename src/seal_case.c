#include "seal_case.h"

u32 Sav2_SealCase_sizeof(void) {
    return sizeof(SEALCASE);
}

void Sav2_SealCase_init(SEALCASE *sealCase) {
    MI_CpuClear8(sealCase, Sav2_SealCase_sizeof());
}

void CopyCapsule(const CAPSULE *src, CAPSULE *dest) {
    MI_CpuCopy8(src, dest, sizeof(CAPSULE));
}

SEALCASE *Sav2_SealCase_get(SAVEDATA *saveData) {
    return SavArray_get(saveData, SAVE_SEAL_CASE);
}

CAPSULE *SealCase_GetCapsuleI(SEALCASE *sealCase, int i) {
    GF_ASSERT(i < MAX_CAPSULES);
    return &sealCase->capsules[i];
}

void SealCase_SetCapsuleI(SEALCASE *sealCase, const CAPSULE *src, int i) {
    GF_ASSERT(i < MAX_CAPSULES);
    CopyCapsule(src, SealCase_GetCapsuleI(sealCase, i));
}

SEAL *CapsuleGetSealI(CAPSULE *capsule, int i) {
    GF_ASSERT(i < MAX_SEALS_ON_CAPSULE);
    return &capsule->seals[i];
}

u8 SealOnCapsuleGetID(const SEAL *seal) {
    return seal->kind;
}

u8 SealOnCapsuleGetX(const SEAL *seal) {
    return seal->x;
}

u8 SealOnCapsuleGetY(const SEAL *seal) {
    return seal->y;
}

SEALBAG *SealCase_inventory_get(SEALCASE *sealCase) {
    return &sealCase->inventory;
}

u8 SealCaseInventory_GetSealQuantity(const SEALBAG *inventory, int sealId) {
    return inventory->seals[sealId];
}

BOOL SealIsOnCapsule(const CAPSULE *capsule, int sealId) {
    int i;

    for (i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (sealId + 1 == capsule->seals[i].kind) {
            return TRUE;
        }
    }
    return FALSE;
}

static int SealCase_CountSealOccurrenceInUse(const SEALCASE *sealCase, int sealId) {
    int i, j, result;

    for (result = 0, i = 0; i < MAX_CAPSULES; i++) {
        for (j = 0; j < MAX_SEALS_ON_CAPSULE; j++) {
            if (sealId + 1 == sealCase->capsules[i].seals[j].kind) {
                result++;
            }
        }
    }

    return result;
}

void SealCaseInventory_SetSealQuantity(SEALBAG *inventory, int sealId, s16 quantity) {
    inventory->seals[sealId] = quantity;
}

BOOL GiveOrTakeSeal(SEALCASE *sealCase, int sealId, s16 quantity) {
    int num;
    int total;

    num = SealCase_CountSealOccurrenceInUse(sealCase, sealId - SEAL_MIN);
    total = num + sealCase->inventory.seals[sealId - SEAL_MIN];

    if (quantity < 0) {
        if (sealCase->inventory.seals[sealId - SEAL_MIN] + quantity >= 0) {
            sealCase->inventory.seals[sealId - SEAL_MIN] += quantity;
        } else {
            return FALSE;
        }
    } else {
        if (total + quantity <= SEAL_INVENTORY_QMAX) {
            sealCase->inventory.seals[sealId - SEAL_MIN] += quantity;
        } else {
            return FALSE;
        }
    }

    return TRUE;
}

BOOL GiveOrTakeSeal2(SEALCASE *sealCase, int sealId, s16 quantity) {
    int num;
    int total;

    num = SealCase_CountSealOccurrenceInUse(sealCase, sealId - SEAL_MIN);
    total = num;

    if (quantity < 0) {
        if (sealCase->inventory.seals[sealId - SEAL_MIN] + quantity >= 0) {
            sealCase->inventory.seals[sealId - SEAL_MIN] += quantity;
        } else {
            return FALSE;
        }
    } else {
        if (total + quantity <= SEAL_INVENTORY_QMAX) {
            sealCase->inventory.seals[sealId - SEAL_MIN] += quantity;
            if (sealCase->inventory.seals[sealId - SEAL_MIN] >= SEAL_INVENTORY_QMAX) {
                sealCase->inventory.seals[sealId - SEAL_MIN] = SEAL_INVENTORY_QMAX;
            }
        } else {
            return FALSE;
        }
    }

    return TRUE;
}

BOOL SealCase_CheckSealQuantity(const SEALCASE *sealCase, int sealId, s16 quantity) {
    int num;
    int total;

    num = SealCase_CountSealOccurrenceInUse(sealCase, sealId - SEAL_MIN);
    total = num + sealCase->inventory.seals[sealId - SEAL_MIN];

    if (quantity < 0) {
        if (sealCase->inventory.seals[sealId - SEAL_MIN] + quantity >= 0) {
            return TRUE;
        } else {
            return FALSE;
        }
    } else {
        if (total + quantity <= SEAL_INVENTORY_QMAX) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
}

int SealCase_CountUniqueSeals(const SEALCASE *sealCase) {
    int i, total = 0;

    for (i = SEAL_MIN; i < SEAL_MAX + 1; i++) {
        if (SealCase_CountSealOccurrenceAnywhere(sealCase, i) != 0) {
            total++;
        }
    }

    return total;
}

int SealCase_CountSealOccurrenceAnywhere(const SEALCASE *sealCase, int sealId) {
    int num = SealCase_CountSealOccurrenceInUse(sealCase, sealId - 1);
    return num + sealCase->inventory.seals[sealId - 1];
}
