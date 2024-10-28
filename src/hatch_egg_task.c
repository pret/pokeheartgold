#include "hatch_egg_task.h"

#include "get_egg.h"
#include "naming_screen.h"
#include "trainer_memo.h"
#include "unk_02055244.h"
#include "unk_020552A4.h"

typedef struct HatchEggTaskData {
    u32 state;
    BOOL wantToNameNewMon;
    NamingScreenArgs *namingScreenArgs;
    UnkStruct_02091240 unkC;
} HatchEggTaskData;

FS_EXTERN_OVERLAY(OVY_95);
extern BOOL ov95_021E6D70(OVY_MANAGER *, int *);
extern BOOL ov95_021E6E88(OVY_MANAGER *, int *);
extern BOOL ov95_021E6F0C(OVY_MANAGER *, int *);

static const OVY_MGR_TEMPLATE _02106048 = {
    .init   = ov95_021E6D70,
    .exec   = ov95_021E6E88,
    .exit   = ov95_021E6F0C,
    .ovy_id = FS_OVERLAY_ID(OVY_95),
};

static BOOL Task_HatchEggInParty(TaskManager *taskManager) {
    HatchEggTaskData *data = TaskManager_GetEnvironment(taskManager);

    switch (data->state) {
    case 0: // Leave overworld
        sub_0206D328(data->unkC.mon, HEAP_ID_FIELD);
        CallTask_LeaveOverworld(taskManager);
        data->state++;
        break;
    case 1: // Open the egg hatch app
        CallApplicationAsTask(taskManager, &_02106048, data);
        data->state++;
        break;
    case 2: { // Update egg status, add in mapsec for hatch location, update Pokedex if necessary
        FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
        Pokemon *pokemon         = data->unkC.mon;
        PlayerProfile *profile   = Save_PlayerData_GetProfileAddr(FieldSystem_GetSaveData(fieldSystem));

        u32 mapsec = MapHeader_GetMapSec(fieldSystem->location->mapId);
        u32 isEgg  = 0;
        SetMonData(pokemon, MON_DATA_IS_EGG, &isEgg);
        MonSetTrainerMemo(pokemon, profile, 6, mapsec, HEAP_ID_FIELD);
        SetMonData(pokemon, MON_DATA_SPECIES_NAME, NULL);
        sub_02093134(fieldSystem, pokemon);
        UpdatePokedexWithReceivedSpecies(FieldSystem_GetSaveData(fieldSystem), data->unkC.mon);

        if (data->wantToNameNewMon == TRUE) {
            data->state = 3;
        } else {
            data->state = 5;
        }

        break;
    }
    case 3: { // Open the naming screen app
        FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);

        u32 species                       = GetMonData(data->unkC.mon, MON_DATA_SPECIES, NULL);
        Options *options                  = Save_PlayerData_GetOptionsAddr(FieldSystem_GetSaveData(fieldSystem));
        data->namingScreenArgs            = NamingScreen_CreateArgs(HEAP_ID_FIELD, NAME_SCREEN_POKEMON, species, POKEMON_NAME_LENGTH, options, NULL);
        data->namingScreenArgs->monGender = GetMonData(data->unkC.mon, MON_DATA_GENDER, NULL);
        data->namingScreenArgs->monForm   = GetMonData(data->unkC.mon, MON_DATA_FORM, NULL);

        CallApplicationAsTask(taskManager, &gOverlayTemplate_NamingScreen, data->namingScreenArgs);
        data->state++;
        break;
    }
    case 4: // Set mon's new name
        if (!data->namingScreenArgs->noInput) {
            SetMonData(data->unkC.mon, MON_DATA_NICKNAME_STRING_COMPARE, data->namingScreenArgs->nameInputString);
        }
        NamingScreen_DeleteArgs(data->namingScreenArgs);
        data->state++;
        break;
    case 5: // Load overworld back in
        CallTask_RestoreOverworld(taskManager);
        data->state++;
        break;
    case 6: // Done
        FreeToHeap(data);
        return TRUE;
    }

    return FALSE;
}

void CallTask_HatchEggInParty(TaskManager *taskManager, UnkStruct_02091240 *a1) {
    HatchEggTaskData *data = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(HatchEggTaskData));
    memset(data, 0, sizeof(HatchEggTaskData));
    data->unkC = *a1;

    TaskManager_Call(taskManager, Task_HatchEggInParty, data);
}
