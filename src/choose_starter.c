#include "choose_starter.h"

#include "constants/balls.h"
#include "constants/items.h"
#include "constants/species.h"

#include "field_system.h"
#include "launch_application.h"
#include "map_header.h"
#include "pokedex.h"
#include "task.h"
#include "unk_0200FA24.h"
#include "update_dex_received.h"

struct ChooseStarterTaskData {
    int state;
    struct ChooseStarterArgs *args;
};

static BOOL CreateStarter(TaskManager *taskManager);

void LaunchStarterChoiceScene(FieldSystem *fieldSystem) {
    struct ChooseStarterTaskData *env = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct ChooseStarterTaskData));
    env->state = 0;
    TaskManager_Call(fieldSystem->taskman, CreateStarter, env);
}

static BOOL CreateStarter(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    struct ChooseStarterTaskData *env = TaskManager_GetEnvironment(taskManager);
    int i;
    u32 mapsec;
    Party *party;

    switch (env->state) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, HEAP_ID_4);
        env->state = 1;
        break;
    case 1:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        {
            const int species[] = {
                SPECIES_CHIKORITA,
                SPECIES_CYNDAQUIL,
                SPECIES_TOTODILE,
            };
            mapsec = MapHeader_GetMapSec(fieldSystem->location->mapId); // sp14

            env->args = AllocFromHeapAtEnd(HEAP_ID_FIELD, sizeof(struct ChooseStarterArgs));
            env->args->cursorPos = 0;
            env->args->options = Save_PlayerData_GetOptionsAddr(fieldSystem->saveData);
            for (i = 0; i < (int)NELEMS(species); i++) {
                Pokemon *mon = &env->args->starters[i];
                PlayerProfile *profile = Save_PlayerData_GetProfile(fieldSystem->saveData);
                ZeroMonData(mon);
                CreateMon(mon, species[i], 5, 32, FALSE, 0, OT_ID_PLAYER_ID, 0);
                sub_020720FC(mon, profile, BALL_POKE, mapsec, 12, HEAP_ID_FIELD);
                {
                    int item = ITEM_NONE;
                    SetMonData(mon, MON_DATA_HELD_ITEM, &item);
                }
            }
        }
        ChooseStarter_LaunchApp(fieldSystem, env->args);
        sub_0203E30C();
        env->state = 2;
        break;
    case 2:
        if (FieldSystem_ApplicationIsRunning(fieldSystem)) {
            break;
        }
        env->state = 3;
        break;
    case 3: {
        Pokedex *pokedex = Save_Pokedex_Get(fieldSystem->saveData);
        party = SaveArray_Party_Get(fieldSystem->saveData);
        Pokemon *myChoice = &env->args->starters[env->args->cursorPos];
        if (Party_AddMon(party, myChoice)) {
            UpdatePokedexWithReceivedSpecies(fieldSystem->saveData, myChoice);
        }
        Pokedex_SetMonCaughtFlag(pokedex, Party_GetMonByIndex(party, 0));
        env->state = 4;
        FieldSystem_LoadFieldOverlay(fieldSystem);
        break;
    }
    case 4:
        if (!sub_020505C8(fieldSystem)) {
            break;
        }
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, HEAP_ID_4);
        env->state = 5;
        break;
    case 5:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        Heap_Free(env->args);
        Heap_Free(env);
        return TRUE;
    }

    return FALSE;
}
