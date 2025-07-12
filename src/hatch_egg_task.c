#include "hatch_egg_task.h"

#include "get_egg.h"
#include "naming_screen.h"
#include "overlay_95.h"
#include "trainer_memo.h"
#include "unk_02055244.h"
#include "unk_020552A4.h"

typedef enum HatchEggTaskState {
    HATCHEGGTASKSTATE_LEAVE_OVERWORLD,
    HATCHEGGTASKSTATE_OPEN_HATCH_APP,
    HATCHEGGTASKSTATE_UPDATE_MON_INFO,
    HATCHEGGTASKSTATE_OPEN_NAMING_SCREEN,
    HATCHEGGTASKSTATE_SET_MON_NAME,
    HATCHEGGTASKSTATE_LOAD_OVERWORLD,
    HATCHEGGTASKSTATE_EXIT,
} HatchEggTaskState;

typedef struct HatchEggTaskData {
    HatchEggTaskState state;
    BOOL wantToNameNewMon;
    NamingScreenArgs *namingScreenArgs;
    UnkStruct_02091240 unkC;
} HatchEggTaskData;

FS_EXTERN_OVERLAY(OVY_95);
static const OverlayManagerTemplate sApplication_HatchEgg = {
    .init = HatchEggApp_Init,
    .exec = HatchEggApp_Main,
    .exit = HatchEggApp_Exit,
    .ovy_id = FS_OVERLAY_ID(OVY_95),
};

static BOOL Task_HatchEggInParty(TaskManager *taskManager) {
    HatchEggTaskData *data = TaskManager_GetEnvironment(taskManager);

    switch (data->state) {
    case HATCHEGGTASKSTATE_LEAVE_OVERWORLD:
        sub_0206D328(data->unkC.mon, HEAP_ID_FIELD2);
        CallTask_LeaveOverworld(taskManager);
        data->state++;
        break;
    case HATCHEGGTASKSTATE_OPEN_HATCH_APP:
        CallApplicationAsTask(taskManager, &sApplication_HatchEgg, data);
        data->state++;
        break;
    case HATCHEGGTASKSTATE_UPDATE_MON_INFO: {
        FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
        Pokemon *pokemon = data->unkC.mon;
        PlayerProfile *profile = Save_PlayerData_GetProfile(FieldSystem_GetSaveData(fieldSystem));

        u32 mapsec = MapHeader_GetMapSec(fieldSystem->location->mapId);
        BOOL isEgg = FALSE;
        SetMonData(pokemon, MON_DATA_IS_EGG, &isEgg);
        MonSetTrainerMemo(pokemon, profile, 6, mapsec, HEAP_ID_FIELD2);
        SetMonData(pokemon, MON_DATA_SPECIES_NAME, NULL);
        sub_02093134(fieldSystem, pokemon);
        UpdatePokedexWithReceivedSpecies(FieldSystem_GetSaveData(fieldSystem), data->unkC.mon);

        if (data->wantToNameNewMon == TRUE) {
            data->state = HATCHEGGTASKSTATE_OPEN_NAMING_SCREEN;
        } else {
            data->state = HATCHEGGTASKSTATE_LOAD_OVERWORLD;
        }

        break;
    }
    case HATCHEGGTASKSTATE_OPEN_NAMING_SCREEN: {
        FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);

        u32 species = GetMonData(data->unkC.mon, MON_DATA_SPECIES, NULL);
        Options *options = Save_PlayerData_GetOptionsAddr(FieldSystem_GetSaveData(fieldSystem));
        data->namingScreenArgs = NamingScreen_CreateArgs(HEAP_ID_FIELD2, NAME_SCREEN_POKEMON, species, POKEMON_NAME_LENGTH, options, NULL);
        data->namingScreenArgs->monGender = GetMonData(data->unkC.mon, MON_DATA_GENDER, NULL);
        data->namingScreenArgs->monForm = GetMonData(data->unkC.mon, MON_DATA_FORM, NULL);

        CallApplicationAsTask(taskManager, &gOverlayTemplate_NamingScreen, data->namingScreenArgs);
        data->state++;
        break;
    }
    case HATCHEGGTASKSTATE_SET_MON_NAME:
        if (!data->namingScreenArgs->noInput) {
            SetMonData(data->unkC.mon, MON_DATA_NICKNAME_STRING_COMPARE, data->namingScreenArgs->nameInputString);
        }
        NamingScreen_DeleteArgs(data->namingScreenArgs);
        data->state++;
        break;
    case HATCHEGGTASKSTATE_LOAD_OVERWORLD:
        CallTask_RestoreOverworld(taskManager);
        data->state++;
        break;
    case HATCHEGGTASKSTATE_EXIT:
        Heap_Free(data);
        return TRUE;
    }

    return FALSE;
}

void CallTask_HatchEggInParty(TaskManager *taskManager, UnkStruct_02091240 *a1) {
    HatchEggTaskData *data = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(HatchEggTaskData));
    memset(data, 0, sizeof(HatchEggTaskData));
    data->unkC = *a1;

    TaskManager_Call(taskManager, Task_HatchEggInParty, data);
}
