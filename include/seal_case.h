#ifndef POKEHEARTGOLD_SEAL_CASE_H
#define POKEHEARTGOLD_SEAL_CASE_H

#include "constants/seals.h"
#include "save.h"

/*
 * Structure for seal in-use
 */
typedef struct SEAL {
    u8 kind;           // ID of the seal
    u8 x;              // X coordinate on the capsule
    u8 y;              // Y coordinate on the capsule
} SEAL;

/*
 * Capsule that you put on your ball
 */
typedef struct SEAL_CASE {
    SEAL seals[MAX_SEALS_ON_CAPSULE];  // The seals on the capsule
} SEAL_CASE;

/*
 * Seals available to put on capsule. Typedeffed for safety
 */
typedef struct SEALBAG {
    u8 seals[SEAL_MAX];
} SEALBAG;

/*
 * Seal case and capsules from the save file
 */
typedef struct SEALCASE {
    SEAL_CASE capsules[MAX_CAPSULES];    // Available capsules
    SEALBAG inventory;                 // Available seals to put on capsules
} SEALCASE;

u32 Sav2_SealCase_sizeof(void);
void Sav2_SealCase_init(SEALCASE *sealCase);
void CopyCapsule(const SEAL_CASE *src, SEAL_CASE *dest);

/*
 * SEALCASE *Sav2_SealCase_get(SAVEDATA *saveData)
 *
 * Gets the player's seal case from the save file
 *
 * @param saveData:    Pointer to SAVEDATA
 *
 * @returns: Pointer to SEALCASE from the save file
 */
SEALCASE *Sav2_SealCase_get(SAVEDATA *saveData);
SEAL_CASE *SealCase_GetCapsuleI(SEALCASE *sealCase, int i);
void SealCase_CopyCapsuleI(SEALCASE *sealCase, SEAL_CASE *dest, int i);
SEAL *CapsuleGetSealI(SEAL_CASE *capsule, int i);
u8 SealOnCapsuleGetID(SEAL *seal);
u8 SealOnCapsuleGetX(SEAL *seal);
u8 SealOnCapsuleGetY(SEAL *seal);
SEALBAG *SealCase_inventory_get(SEALCASE *sealCase);
u8 SealCaseInventory_GetSealQuantity(SEALBAG *inventory);
BOOL SealIsOnCapsule(SEAL_CASE *capsule, int sealId);
int SealCase_CountSealOccurrenceInUse(SEALCASE *sealCase, int sealId);
void SealCaseInventory_SetSealQuantity(SEALCASE *sealCase, int sealId, int quantity);
BOOL GiveOrTakeSeal(SEALCASE *sealCase, int sealId, int quantity);
BOOL GiveOrTakeSeal_NoConsiderCapsules(SEALCASE *sealCase, int sealId, int quantity);
BOOL SealCase_CheckSealQuantity(SEALCASE *sealCase, int sealId, int quantity);
int SealCase_GetTotalSeals(SEALCASE *sealCase);
int SealCase_CountSealOccurrenceAnywhere(SEALCASE *sealCase, int sealId);

#endif //POKEHEARTGOLD_SEAL_CASE_H
