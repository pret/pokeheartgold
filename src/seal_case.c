#include "seal_case.h"

#include "global.h"

u32 Save_SealCase_sizeof(void)
{
    return sizeof(SealCase);
}

void Save_SealCase_Init(SealCase *sealCase)
{
    MI_CpuClear8(sealCase, Save_SealCase_sizeof());
}

void CopyCapsule(const CAPSULE *src, CAPSULE *dest)
{
    MI_CpuCopy8(src, dest, sizeof(CAPSULE));
}

SealCase *Save_SealCase_Get(SaveData *saveData)
{
    return SaveArray_Get(saveData, SAVE_SEAL_CASE);
}

CAPSULE *SealCase_GetCapsuleI(SealCase *sealCase, int i)
{
    GF_ASSERT(i < MAX_CAPSULES);
    return &sealCase->capsules[i];
}

void SealCase_SetCapsuleI(SealCase *sealCase, const CAPSULE *src, int i)
{
    GF_ASSERT(i < MAX_CAPSULES);
    CopyCapsule(src, SealCase_GetCapsuleI(sealCase, i));
}

SEAL *CapsuleGetSealI(CAPSULE *capsule, int i)
{
    GF_ASSERT(i < MAX_SEALS_ON_CAPSULE);
    return &capsule->seals[i];
}

u32 SealOnCapsuleGetID(const SEAL *seal)
{
    return seal->kind;
}

u8 SealOnCapsuleGetX(const SEAL *seal)
{
    return seal->x;
}

u8 SealOnCapsuleGetY(const SEAL *seal)
{
    return seal->y;
}

SEALBAG *SealCase_inventory_Get(SealCase *sealCase)
{
    return &sealCase->inventory;
}

u8 SealCaseInventory_GetSealQuantity(const SEALBAG *inventory, int sealId)
{
    return inventory->seals[sealId];
}

BOOL SealIsOnCapsule(const CAPSULE *capsule, int sealId)
{
    int i;

    for (i = 0; i < MAX_SEALS_ON_CAPSULE; i++) {
        if (sealId + 1 == capsule->seals[i].kind) {
            return TRUE;
        }
    }
    return FALSE;
}

static int SealCase_CountSealOccurrenceInUse(const SealCase *sealCase, int sealId)
{
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

void SealCaseInventory_SetSealQuantity(SEALBAG *inventory, int sealId, s16 quantity)
{
    inventory->seals[sealId] = quantity;
}

BOOL GiveOrTakeSeal(SealCase *sealCase, int sealId, s16 quantity)
{
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

BOOL GiveOrTakeSeal2(SealCase *sealCase, int sealId, s16 quantity)
{
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

BOOL SealCase_CheckSealQuantity(const SealCase *sealCase, int sealId, s16 quantity)
{
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

int SealCase_CountUniqueSeals(const SealCase *sealCase)
{
    int i, total = 0;

    for (i = SEAL_MIN; i < SEAL_MAX + 1; i++) {
        if (SealCase_CountSealOccurrenceAnywhere(sealCase, i) != 0) {
            total++;
        }
    }

    return total;
}

int SealCase_CountSealOccurrenceAnywhere(const SealCase *sealCase, int sealId)
{
    int num = SealCase_CountSealOccurrenceInUse(sealCase, sealId - 1);
    return num + sealCase->inventory.seals[sealId - 1];
}
