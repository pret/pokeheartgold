#include "unk_020932A4.h"

#include "global.h"

#include "gear_phone.h"
#include "overlay_26.h"
#include "save_pokegear.h"

u16 PhoneBookTrainerGetRematchInfo(u8 idx, SaveData *saveData, PhoneBook *phoneBook, u8 timeOfDay) {
    PhoneCallPersistentState *callPersistentState = SaveData_GetPhoneCallPersistentState(saveData);
    BOOL isSeekingPhoneRematches = PhoneCallPersistentState_PhoneRematches_IsSeeking(callPersistentState, idx);

    if (!isSeekingPhoneRematches) {
        return 0;
    }
    if (idx == 0x10 && timeOfDay != TIMEOFDAY_WILD_DAY) {
        return 0;
    }

    return TryGetRematchTrainerIdByBaseTrainerId(saveData, phoneBook->entries[idx].trainerId);
}
