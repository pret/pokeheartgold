#include "global.h"

#include "constants/maps.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0414.h"

#include "map_events.h"
#include "map_header.h"
#include "math_util.h"
#include "roamer.h"
#include "sound_02004A44.h"
#include "sound_radio.h"
#include "sys_flags.h"
#include "unk_02005D10.h"
#include "unk_02097F6C.h"

typedef struct PokemonTalkData {
    HeapID heapID;
    u16 state;
    u16 swarmSpecies;
    u16 swarmMap;
    u16 numLandmarks;
    u16 numSpecies;         // limited to current region
    u16 numPrioritySpecies; // not seen in pokedex
    u16 landmarkSpeciesPairs[5][2];
    u16 flavorTextPairs[5][2];
    u16 landmarksBuffer[150];
    u16 speciesBuffer[59];
    u16 prioritySpeciesBuffer[59];
    u8 selector;
} PokemonTalkData; // size: 0x254

void RadioShow_PokemonTalk_Init(RadioShow *radioShow);
void RadioShow_PokemonTalk_Unload(RadioShow *radioShow);
BOOL RadioShow_PokemonTalk_EnsureUniqueMsgID(PokemonTalkData *data, u8 msgID, u8 index);
void RadioShow_PokemonTalk_SampleMapAreasAndEncounters(RadioShow *radioShow, PokemonTalkData *data);
BOOL RadioShow_PokemonTalk_AlreadySampledLandmark(PokemonTalkData *data, u16 landmark, u8 num);
void RadioShow_PokemonTalk_AddSpecies(PokemonTalkData *data, Pokedex *pokedex, u16 species);
u16 RadioShow_PokemonTalk_SampleSpeciesFromMapEncounters(PokemonTalkData *data, Pokedex *pokedex, u16 mapID);

static const u16 sFilterLandmarks[] = {
    MAP_MOUNT_MOON_SQUARE,
    MAP_MOUNT_MOON_SQUARE_CLEFAIRY_EVENT,
    MAP_NATIONAL_PARK_BUG_CATCHING_CONTEST,
    MAP_RUINS_OF_ALPH_UNDERGROUND_HALL,
    MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT,
    MAP_RUINS_OF_ALPH_HALL_ENTRANCE_SINJOH_EVENT,
    MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2,
    MAP_ICE_PATH_B1F,
    MAP_ICE_PATH_B2F,
    MAP_ICE_PATH_B3F,
    MAP_WHIRL_ISLANDS_B1F,
    MAP_WHIRL_ISLANDS_B2F,
    MAP_TOHJO_FALLS_HIDDEN_ROOM,
    MAP_SAFARI_ZONE_ENTRANCE_EXTERIOR,
};

BOOL RadioShow_PokemonTalk_Setup(RadioShow *radioShow) {
    PokemonTalkData *data = AllocFromHeap(radioShow->heapID, sizeof(PokemonTalkData));
    MI_CpuClear8(data, sizeof(PokemonTalkData));
    // data->heapID = radioShow->heapID;
    radioShow->showData = data;
    RadioShow_PokemonTalk_Init(radioShow);
    StopBGM(GF_GetCurrentPlayingBGM(), 0);
    SndRadio_StartSeq(SEQ_GS_OHKIDO_RABO);
    return FALSE;
}

BOOL RadioShow_PokemonTalk_Teardown(RadioShow *radioShow) {
    RadioShow_PokemonTalk_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(PokemonTalkData));
    Heap_Free(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_PokemonTalk_Print(RadioShow *radioShow) {
    PokemonTalkData *data = radioShow->showData;
    int i;

    switch (data->state) {
    case 0:
        RadioPrintInitEz(radioShow, msg_0414_00002);
        ++data->state;
        break;
    case 1:
        if (!Radio_RunTextPrinter(radioShow)) {
            break;
        }
        if (data->swarmSpecies == SPECIES_NONE) {
            data->state = 3;
        } else {
            BufferLandmarkName(radioShow->msgFormat, 0, MapHeader_GetMapSec(data->swarmMap));
            BufferSpeciesName(radioShow->msgFormat, 1, data->swarmSpecies);
            RadioPrintInitEz(radioShow, msg_0414_00032);
            ++data->state;
        }
        break;
    case 2:
        if (!Radio_RunTextPrinter(radioShow)) {
            break;
        }
        ++data->state;
        // fallthrough
    case 3:
        BufferLandmarkName(radioShow->msgFormat, 0, data->landmarkSpeciesPairs[data->selector][0]);
        BufferSpeciesName(radioShow->msgFormat, 1, data->landmarkSpeciesPairs[data->selector][1]);
        RadioPrintInitEz(radioShow, msg_0414_00004);
        ++data->state;
        break;
    case 4:
        if (!Radio_RunTextPrinter(radioShow)) {
            break;
        }
        for (i = 0; i < 2; ++i) {
            ReadMsgDataIntoString(radioShow->showMsgData, (msg_0414_00019 - msg_0414_00006) * i + (msg_0414_00006 + data->flavorTextPairs[data->selector][i]), radioShow->curLineStr);
            BufferString(radioShow->msgFormat, i + 2, radioShow->curLineStr, 1, 1, 2);
        }
        RadioPrintInitEz(radioShow, msg_0414_00005);
        ++data->state;
        break;
    case 5:
        if (!Radio_RunTextPrinter(radioShow)) {
            break;
        }
        ++data->selector;
        if (data->selector < 5) {
            data->state = 3;
        } else {
            ++data->state;
        }
        break;
    case 6:
        if (RadioShow_DelayAndScrollLine(radioShow)) {
            RadioPrintAndPlayJingle(radioShow, msg_0414_00003);
            ++data->state;
        }
        break;
    case 7:
        if (Radio_RunTextPrinter_WaitJingle(radioShow)) {
            radioShow->triggerCommercials = TRUE;
            return TRUE;
        }
        break;
    }

    return FALSE;
}

void RadioShow_PokemonTalk_Init(RadioShow *radioShow) {
    int step;
    int i;
    u8 phrase1;
    u8 phrase2;
    RoamerSaveData *roamers;
    PokemonTalkData *data = radioShow->showData;

    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0414_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0414_00000, radioShow->showTitle);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0414_00001, radioShow->showHost);

    roamers = Save_Roamers_Get(radioShow->saveData);
    if (RoamerSave_OutbreakActive(roamers)) {
        GetSwarmInfoFromRand(Roamers_GetRand(roamers, 2), &data->swarmMap, &data->swarmSpecies);
    }
    RadioShow_PokemonTalk_SampleMapAreasAndEncounters(radioShow, data);
    step = ((LCRandom() % 3) + 1) * 2; // 2, 4, or 6; always coprime with 13
    phrase1 = LCRandom() % 13;
    phrase2 = LCRandom() % 13;
    for (i = 0; i < 5; ++i) {
        data->flavorTextPairs[i][0] = phrase1;
        data->flavorTextPairs[i][1] = phrase2;
        phrase1 = (phrase1 + step) % 13;
        phrase2 = (phrase2 + step) % 13;
    }
}

void RadioShow_PokemonTalk_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}

void RadioShow_PokemonTalk_SampleMapAreasAndEncounters(RadioShow *radioShow, PokemonTalkData *data) {
    int i;
    int j;
    u16 landmark;
    u16 index;
    BOOL visitedUnk25;
    Pokedex *pokedex;

    pokedex = Save_Pokedex_Get(radioShow->saveData);
    visitedUnk25 = Save_VarsFlags_FlypointFlagAction(Save_VarsFlags_Get(radioShow->saveData), FLAG_ACTION_CHECK, FLYPOINT_UNK25);

    MI_CpuClear8(data->landmarksBuffer, sizeof(data->landmarksBuffer));
    MI_CpuClear8(data->speciesBuffer, sizeof(data->speciesBuffer));
    MI_CpuClear8(data->prioritySpeciesBuffer, sizeof(data->prioritySpeciesBuffer));
    data->numLandmarks = 0;
    data->numSpecies = 0;
    data->numPrioritySpecies = 0;
    for (i = 0; i < MAP_ID_MAX; ++i) {
        if (MapHeader_HasWildEncounters(i) && (radioShow->inKanto == MapHeader_IsInKanto(i))) {
            for (j = 0; j < NELEMS(sFilterLandmarks); ++j) {
                if (i == sFilterLandmarks[j]) {
                    break;
                }
            }
            if (j >= NELEMS(sFilterLandmarks)) {
                if (visitedUnk25 || (i != MAP_ROUTE_47 && i != MAP_ROUTE_48)) {
                    data->landmarksBuffer[data->numLandmarks++] = i;
                    if (data->numLandmarks >= 150) {
                        GF_ASSERT(FALSE);
                        break;
                    }
                }
            }
        }
    }
    for (i = 0; i < 5; ++i) {
        data->numSpecies = 0;
        data->numPrioritySpecies = 0;
        do {
            index = LCRandom() % data->numLandmarks;
            landmark = MapHeader_GetMapSec(data->landmarksBuffer[index]);
        } while (RadioShow_PokemonTalk_AlreadySampledLandmark(data, landmark, i));
        data->landmarkSpeciesPairs[i][0] = landmark;
        data->landmarkSpeciesPairs[i][1] = RadioShow_PokemonTalk_SampleSpeciesFromMapEncounters(data, pokedex, data->landmarksBuffer[index]);
    }
}

BOOL RadioShow_PokemonTalk_AlreadySampledLandmark(PokemonTalkData *data, u16 landmark, u8 num) {
    for (int i = 0; i < num; ++i) {
        if (landmark == data->landmarkSpeciesPairs[i][0]) {
            return TRUE;
        }
    }

    return FALSE;
}

void RadioShow_PokemonTalk_AddSpecies(PokemonTalkData *data, Pokedex *pokedex, u16 species) {
    int i;
    if (species != SPECIES_NONE && species <= MAX_SPECIES) {
        for (i = 0; i < data->numSpecies; ++i) {
            if (species == data->speciesBuffer[i]) {
                return;
            }
        }
        data->speciesBuffer[data->numSpecies++] = species;
        if (!Pokedex_CheckMonCaughtFlag(pokedex, species)) {
            data->prioritySpeciesBuffer[data->numPrioritySpecies++] = species;
        }
    }
}

u16 RadioShow_PokemonTalk_SampleSpeciesFromMapEncounters(PokemonTalkData *data, Pokedex *pokedex, u16 mapID) {
    int i;
    ENC_DATA encData;

    WildEncounters_ReadFromNarc(&encData, mapID);

    if (encData.encounterRate_walking != 0) {
        for (i = 0; i < NUM_ENCOUNTERS_LAND; ++i) {
            RadioShow_PokemonTalk_AddSpecies(data, pokedex, encData.landSlots.species_morn[i]);
            RadioShow_PokemonTalk_AddSpecies(data, pokedex, encData.landSlots.species_day[i]);
            RadioShow_PokemonTalk_AddSpecies(data, pokedex, encData.landSlots.species_nite[i]);
        }
    }
    if (encData.encounterRate_surfing != 0) {
        for (i = 0; i < NUM_ENCOUNTERS_SURF; ++i) {
            RadioShow_PokemonTalk_AddSpecies(data, pokedex, encData.surfSlots[i].species);
        }
    }
    if (encData.encounterRate_rockSmash != 0) {
        for (i = 0; i < NUM_ENCOUNTERS_ROCKSMASH; ++i) {
            RadioShow_PokemonTalk_AddSpecies(data, pokedex, encData.rockSmashSlots[i].species);
        }
    }
    if (encData.encounterRate_oldRod != 0) {
        for (i = 0; i < NUM_ENCOUNTERS_FISH; ++i) {
            RadioShow_PokemonTalk_AddSpecies(data, pokedex, encData.oldRodSlots[i].species);
        }
    }
    if (encData.encounterRate_goodRod != 0) {
        for (i = 0; i < NUM_ENCOUNTERS_FISH; ++i) {
            RadioShow_PokemonTalk_AddSpecies(data, pokedex, encData.goodRodSlots[i].species);
        }
    }
    if (encData.encounterRate_superRod != 0) {
        for (i = 0; i < NUM_ENCOUNTERS_FISH; ++i) {
            RadioShow_PokemonTalk_AddSpecies(data, pokedex, encData.superRodSlots[i].species);
        }
    }
    if (encData.swarmSpecies[2] != SPECIES_NONE) {
        RadioShow_PokemonTalk_AddSpecies(data, pokedex, encData.swarmSpecies[2]);
    }
    if (data->numPrioritySpecies == 0 || (data->numPrioritySpecies == 1 && (LCRandom() % 1000) < 500)) {
        return data->speciesBuffer[LCRandom() % data->numSpecies];
    } else {
        return data->prioritySpeciesBuffer[LCRandom() % data->numPrioritySpecies];
    }
}
