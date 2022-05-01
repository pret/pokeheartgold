#include "task.h"
#include "unk_0200FA24.h"
#include "unk_0203E348.h"
#include "unk_0203DE74.h"
#include "unk_0202ECC0.h"
#include "map_header.h"
#include "pokedex.h"
#include "choose_starter.h"
#include "constants/species.h"
#include "constants/balls.h"
#include "constants/items.h"

struct ChooseStarterTaskData {
    int state;
    struct ChooseStarterAppData *appData;
};

static BOOL CreateStarter(TaskManager *taskManager);

void LaunchStarterChoiceScene(FieldSystem *fsys) {
    struct ChooseStarterTaskData *env = AllocFromHeapAtEnd(11, sizeof(struct ChooseStarterTaskData));
    env->state = 0;
    TaskManager_Call(fsys->taskman, CreateStarter, env);
}

static BOOL CreateStarter(TaskManager *taskManager) {
    FieldSystem *fsys = TaskManager_GetSys(taskManager);
    struct ChooseStarterTaskData *env = TaskManager_GetEnv(taskManager);
    int i;
    u32 mapsec;
    PARTY *party;

    switch (env->state) {
    case 0:
        BeginNormalPaletteFade(0, 0, 0, RGB_BLACK, 6, 1, 4);
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
            mapsec = MapHeader_GetMapSec(fsys->location->mapId); //sp14

            env->appData = AllocFromHeapAtEnd(11, sizeof(struct ChooseStarterAppData));
            env->appData->cursorPos = 0;
            env->appData->options = Sav2_PlayerData_GetOptionsAddr(fsys->savedata);
            for (i = 0; i < (int)NELEMS(species); i++) {
                POKEMON *pokemon = &env->appData->starters[i];
                PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(fsys->savedata);
                ZeroMonData(pokemon);
                CreateMon(pokemon, species[i], 5, 32, FALSE, 0, OT_ID_PLAYER_ID, 0);
                sub_020720FC(pokemon, profile, BALL_POKE, mapsec, 12, 11);
                {
                    int item = ITEM_NONE;
                    SetMonData(pokemon, MON_DATA_HELD_ITEM, &item);
                }
            }
        }
        FieldSys_LaunchChooseStarterApplication(fsys, env->appData);
        sub_0203E30C();
        env->state = 2;
        break;
    case 2:
        if (FieldSys_ApplicationIsRunning(fsys)) {
            break;
        }
        env->state = 3;
        break;
    case 3: {
        POKEDEX *pokedex = Sav2_Pokedex_get(fsys->savedata);
        party = SavArray_PlayerParty_get(fsys->savedata);
        POKEMON *myChoice = &env->appData->starters[env->appData->cursorPos];
        if (AddMonToParty(party, myChoice)) {
            UpdatePokedexWithReceivedSpecies(fsys->savedata, myChoice);
        }
        Pokedex_SetMonCaughtFlag(pokedex, GetPartyMonByIndex(party, 0));
        env->state = 4;
        sub_020505C0(fsys);
        break;
    }
    case 4:
        if (!sub_020505C8(fsys)) {
            break;
        }
        BeginNormalPaletteFade(0, 1, 1, RGB_BLACK, 6, 1, 4);
        env->state = 5;
        break;
    case 5:
        if (!IsPaletteFadeFinished()) {
            break;
        }
        FreeToHeap(env->appData);
        FreeToHeap(env);
        return TRUE;
    }

    return FALSE;
}
