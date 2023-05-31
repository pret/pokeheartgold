#include "global.h"
#include "unk_020932A4.h"
#include "save_pokegear.h"
#include "gear_phone.h"
#include "overlay_26.h"

THUMB_FUNC u16 PhoneBookTrainerGetRematchInfo(u8 a0, SAVEDATA* saveData, struct PhoneBook* phoneBook, u8 timeOfDay) {    
    MomsSavings* ms = SaveData_GetMomsSavingsAddr(saveData);
    BOOL b = PhoneRematches_IsSeeking(ms, a0);

    if(!b)
    {
        return FALSE;
    }
    if(a0 == 0x10 && timeOfDay != 1)
    {
        return FALSE;
    }

    struct PhoneBookEntry* entries = phoneBook->entries;
    u16 trainerId = entries[a0].trainerId;

    return TryGetRematchTrainerIdByBaseTrainerId(saveData, trainerId);
}