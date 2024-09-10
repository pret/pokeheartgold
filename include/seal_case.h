#ifndef POKEHEARTGOLD_SEAL_CASE_H
#define POKEHEARTGOLD_SEAL_CASE_H

#include "constants/seals.h"

#include "save.h"

/*
 * Structure for seal in-use
 */
typedef struct SEAL {
    u8 kind; // ID of the seal
    u8 x;    // X coordinate on the capsule
    u8 y;    // Y coordinate on the capsule
} SEAL;

/*
 * Capsule that you put on your ball
 */
typedef struct CAPSULE {
    SEAL seals[MAX_SEALS_ON_CAPSULE]; // The seals on the capsule
} CAPSULE;

/*
 * Seals available to put on capsule. Typedeffed for safety
 */
typedef struct SEALBAG {
    u8 seals[SEAL_MAX];
} SEALBAG;

/*
 * Seal case and capsules from the save file
 */
typedef struct SealCase {
    CAPSULE capsules[MAX_CAPSULES]; // Available capsules
    SEALBAG inventory;              // Available seals to put on capsules
} SealCase;

/*
 * u32 Save_SealCase_sizeof(void)
 *
 * Gives the size of the Seal Case on the save file
 *
 * @returns: Size of SealCase
 */
u32 Save_SealCase_sizeof(void);

/*
 * void Save_SealCase_Init(SealCase *sealCase)
 *
 * Initializes the Seal Case
 *
 * @param sealCase:    Pointer to SealCase
 */
void Save_SealCase_Init(SealCase *sealCase);

/*
 * void CopyCapsule(const CAPSULE *src, CAPSULE *dest)
 *
 * Copies capsule from src to dest
 *
 * @param src:         Origin CAPSULE
 * @param dest:        Destination CAPSULE
 */
void CopyCapsule(const CAPSULE *src, CAPSULE *dest);

/*
 * SealCase *Save_SealCase_Get(SaveData *saveData)
 *
 * Gets the player's seal case from the save file
 *
 * @param saveData:    Pointer to SaveData
 *
 * @returns: Pointer to SealCase from the save file
 */
SealCase *Save_SealCase_Get(SaveData *saveData);

/*
 * CAPSULE *SealCase_GetCapsuleI(SealCase *sealCase, int i)
 *
 * Returns a pointer to the i-th capsule in storage.
 * Maximum value of i is MAX_CAPSULES - 1
 *
 * @param sealCase:    Pointer to SealCase
 * @param i:           Index of capsule
 *
 * @returns: Pointer to requested CAPSULE.
 */
CAPSULE *SealCase_GetCapsuleI(SealCase *sealCase, int i);

/*
 * void SealCase_SetCapsuleI(SealCase *sealCase, const CAPSULE *src, int i)
 *
 * Copies the capsule to slot i in the seal case storage.
 * Maximum value of i is MAX_CAPSULES - 1
 *
 * @param sealCase:    Pointer to SealCase
 * @param src:         Value to set
 * @param i:           Index of capsule
 */
void SealCase_SetCapsuleI(SealCase *sealCase, const CAPSULE *src, int i);

/*
 * SEAL *CapsuleGetSealI(CAPSULE *capsule, int i)
 *
 * Returns pointer to the i-th seal on the capsule.
 *
 * @param capsule:     Pointer to CAPSULE
 * @param i:           Index of seal
 *
 * @returns: Pointer to the requested SEAL
 */
SEAL *CapsuleGetSealI(CAPSULE *capsule, int i);

/*
 * u32 SealOnCapsuleGetID(const SEAL *seal)
 * u8 SealOnCapsuleGetX(const SEAL *seal)
 * u8 SealOnCapsuleGetY(const SEAL *seal)
 *
 * Gets the seal type, x or y coordinate of the given SEAL.
 *
 * @param seal:        Pointer to SEAL
 *
 * @returns: The requested attribute
 */
u32 SealOnCapsuleGetID(const SEAL *seal);
u8 SealOnCapsuleGetX(const SEAL *seal);
u8 SealOnCapsuleGetY(const SEAL *seal);

/*
 * SEALBAG *SealCase_inventory_Get(SealCase *sealCase)
 *
 * Returns a pointer to the player's loose seals inventory.
 *
 * @param sealCase:    Pointer to SealCase
 *
 * @returns: Pointer to SEALBAG
 */
SEALBAG *SealCase_inventory_Get(SealCase *sealCase);

/*
 * u8 SealCaseInventory_GetSealQuantity(const SEALBAG *inventory, int sealId)
 *
 * Gets the quantity of the given seal ID in the player's loose seals inventory.
 *
 * @param inventory:   Pointer to SEALBAG
 * @param sealId:      ID of the seal to look up
 *
 * @returns: Owned quantity of that seal.
 */
u8 SealCaseInventory_GetSealQuantity(const SEALBAG *inventory, int sealId);

/*
 * BOOL SealIsOnCapsule(const CAPSULE *capsule, int sealId)
 *
 * Checks whether any seal on the capsule has the given ID.
 *
 * @param capsule:     Pointer to CAPSULE
 * @param sealId:      ID of the seal to look up
 *
 * @returns: TRUE if that seal is on the capsule, otherwise FALSE
 */
BOOL SealIsOnCapsule(const CAPSULE *capsule, int sealId);

/*
 * void SealCaseInventory_SetSealQuantity(SEALBAG *inventory, int sealId, s16 quantity)
 *
 * Sets the owned number of seals of that type to the exact quantity.
 *
 * @param inventory:   Pointer to SEALBAG
 * @param sealId:      ID of the seal to set quantity
 * @param quantity:    Quantity to set it to
 */
void SealCaseInventory_SetSealQuantity(SEALBAG *inventory, int sealId, s16 quantity);

/*
 * BOOL GiveOrTakeSeal(SealCase *sealCase, int sealId, s16 quantity)
 * BOOL GiveOrTakeSeal2(SealCase *sealCase, int sealId, s16 quantity)
 * BOOL SealCase_CheckSealQuantity(const SealCase *sealCase, int sealId, s16 quantity)
 *
 * Adds or subtracts the quantity from the owned number of seals of that type.
 * The sign of quantity determines whether it is add (+) or subtract (-).
 *
 * GiveOrTakeSeal will fail if you are adding seals, and the combined number on
 *   and off capsules would exceed the cap.
 * GiveOrTakeSeal2 will fail if you are adding seals, and the number on capsules
 *   would exceed the cap. If it succeeds to add, and the number of loose copies
 *   in the bag would exceed the cap, it is set to the cap.
 * SealCase_CheckSealQuantity follows the logic of GiveOrTakeSeal, but does not
 *   actually perform the action, instead only reports success or failure.
 *
 * @param inventory:   Pointer to SEALBAG
 * @param sealId:      ID of the seal to adjust quantity
 * @param quantity:    Quantity to adjust by
 *
 * @returns: TRUE if success, otherwise FALSE
 */
BOOL GiveOrTakeSeal(SealCase *sealCase, int sealId, s16 quantity);
BOOL GiveOrTakeSeal2(SealCase *sealCase, int sealId, s16 quantity);
BOOL SealCase_CheckSealQuantity(const SealCase *sealCase, int sealId, s16 quantity);

/*
 * int SealCase_CountUniqueSeals(const SealCase *sealCase)
 *
 * Counts the number of types of seals the player owns.
 *
 * @param sealCase:    Pointer to SealCase
 *
 * @returns: The number of seal variants owned by the player.
 */
int SealCase_CountUniqueSeals(const SealCase *sealCase);

/*
 * int SealCase_CountSealOccurrenceAnywhere(const SealCase *sealCase, int sealId)
 *
 * Counts the number of lose and capsule-bound seals of the given type.
 *
 * @param capsule:     Pointer to CAPSULE
 * @param sealId:      ID of the seal to look up
 *
 * @returns: Total count of that seal anywhere on capsules or loose in the bag.
 */
int SealCase_CountSealOccurrenceAnywhere(const SealCase *sealCase, int sealId);

#endif // POKEHEARTGOLD_SEAL_CASE_H
