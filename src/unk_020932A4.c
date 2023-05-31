#include "global.h"
#include "unk_020932A4.h"
#include "save_pokegear.h"
#include "gear_phone.h"
#include "overlay_26.h"

u16 PhoneBookTrainerGetRematchInfo(u8 a0, SAVEDATA *saveData, struct PhoneBook *phoneBook, TimeOfDayWildParam timeOfDay)
{    
    MomsSavings *momsSavings = SaveData_GetMomsSavingsAddr(saveData);
    BOOL isSeekingPhoneRematches = PhoneRematches_IsSeeking(momsSavings, a0);

    if (!isSeekingPhoneRematches) {
        return 0;
    }
    if (a0 == 0x10 && timeOfDay != TIMEOFDAY_WILD_DAY) {
        return 0;
    }

    return TryGetRematchTrainerIdByBaseTrainerId(saveData, phoneBook->entries[a0].trainerId);
}
