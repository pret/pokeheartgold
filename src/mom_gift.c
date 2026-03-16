#include "mom_gift.h"

#include "global.h"

#include "constants/items.h"

#include "math_util.h"

typedef struct MomGiftBerryEntry {
    u8 berryOffset;
    u8 quantity;
    u8 cost;
} MomGiftBerryEntry;

typedef struct MomGiftNormalEntry {
    u16 itemId;
    u16 threshold;
    u16 cost;
} MomGiftNormalEntry;

#define NUM_NORMAL_GIFTS 9
#define NUM_BERRY_GIFTS  17
#define BERRY_THRESHOLD  3000

static const MomGiftBerryEntry sGiftBerryTable[NUM_BERRY_GIFTS] = {
    { ITEM_OCCA_BERRY - ITEM_CHERI_BERRY,   5, 100 },
    { ITEM_PASSHO_BERRY - ITEM_CHERI_BERRY, 5, 100 },
    { ITEM_WACAN_BERRY - ITEM_CHERI_BERRY,  5, 100 },
    { ITEM_RINDO_BERRY - ITEM_CHERI_BERRY,  5, 100 },
    { ITEM_YACHE_BERRY - ITEM_CHERI_BERRY,  5, 100 },
    { ITEM_CHOPLE_BERRY - ITEM_CHERI_BERRY, 5, 100 },
    { ITEM_KEBIA_BERRY - ITEM_CHERI_BERRY,  5, 100 },
    { ITEM_SHUCA_BERRY - ITEM_CHERI_BERRY,  5, 100 },
    { ITEM_COBA_BERRY - ITEM_CHERI_BERRY,   5, 100 },
    { ITEM_PAYAPA_BERRY - ITEM_CHERI_BERRY, 5, 100 },
    { ITEM_TANGA_BERRY - ITEM_CHERI_BERRY,  5, 100 },
    { ITEM_CHARTI_BERRY - ITEM_CHERI_BERRY, 5, 100 },
    { ITEM_KASIB_BERRY - ITEM_CHERI_BERRY,  5, 100 },
    { ITEM_HABAN_BERRY - ITEM_CHERI_BERRY,  5, 100 },
    { ITEM_COLBUR_BERRY - ITEM_CHERI_BERRY, 5, 100 },
    { ITEM_BABIRI_BERRY - ITEM_CHERI_BERRY, 5, 100 },
    { ITEM_CHILAN_BERRY - ITEM_CHERI_BERRY, 5, 100 },
};

static const MomGiftNormalEntry sGiftNormalTable[NUM_NORMAL_GIFTS] = {
    { ITEM_SUPER_POTION, 900,   600  },
    { ITEM_REPEL,        4000,  270  },
    { ITEM_SUPER_POTION, 7000,  600  },
    { ITEM_SILK_SCARF,   10000, 100  },
    { ITEM_MOON_STONE,   15000, 3000 },
    { ITEM_HYPER_POTION, 19000, 900  },
    { ITEM_CHOICE_SCARF, 30000, 200  },
    { ITEM_MUSCLE_BAND,  40000, 200  },
    { ITEM_FOCUS_SASH,   50000, 200  },
};

static BOOL MomSavings_ProcessNormalGifts(PhoneCallPersistentState *savings, u32 balance) {
    int count = 0;
    const MomGiftNormalEntry *entry = sGiftNormalTable;

    for (int i = 0; i < NUM_NORMAL_GIFTS; i++, entry++) {
        if (sub_0202F1B4(savings, (u8)i)) {
            continue;
        }
        if (balance < entry->threshold) {
            break;
        }
        sub_0202F198(savings, (u8)i);
        PhoneCallPersistentState_MomGiftQueue_Put(savings, entry->itemId, 1);
        balance = PhoneCallPersistentState_MomSavings_BalanceAction(savings, MOMS_BALANCE_SUB, entry->cost);
        count++;
        if (PhoneCallPersistentState_MomGiftQueue_IsFull(savings)) {
            break;
        }
    }

    if (count != 0) {
        return TRUE;
    }
    return FALSE;
}

BOOL MomGift_TryEnqueueGiftOnBalanceChange(PhoneCallPersistentState *savings, u32 newBalance, u32 oldBalance) {
    if (PhoneCallPersistentState_MomGiftQueue_IsFull(savings)) {
        return FALSE;
    }

    if (MomSavings_ProcessNormalGifts(savings, newBalance)) {
        return TRUE;
    }

    u32 newTier = newBalance / BERRY_THRESHOLD;
    u32 oldTier = oldBalance / BERRY_THRESHOLD;

    if (newTier <= oldTier) {
        return FALSE;
    }

    int idx = LCRandom() % NUM_BERRY_GIFTS;
    const MomGiftBerryEntry *berry = &sGiftBerryTable[idx];
    PhoneCallPersistentState_MomGiftQueue_Put(savings, berry->berryOffset + ITEM_CHERI_BERRY, berry->quantity);
    PhoneCallPersistentState_MomSavings_BalanceAction(savings, MOMS_BALANCE_SUB, berry->cost);

    return TRUE;
}
