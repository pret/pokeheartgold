#include "global.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0414.h"

#include "map_header.h"
#include "math_util.h"
#include "sound_02004A44.h"
#include "sound_radio.h"
#include "unk_02005D10.h"

typedef struct PokemonTalkData {
    HeapID heapID;
    u16 state;
    u16 swarmSpecies;
    u16 swarmMap;
    u8 filler_00A[6];
    u16 unk_010[5][2];
    u16 unk_024[5][2];
    u8 filler_038[0x218];
    u8 unk_250;
} PokemonTalkData; // size: 0x254

void RadioShow_PokemonTalk_Init(RadioShow *radioShow);
void RadioShow_PokemonTalk_Unload(RadioShow *radioShow);
BOOL RadioShow_PokemonTalk_EnsureUniqueMsgID(PokemonTalkData *data, u8 msgID, u8 index);
void ov101_021F6FCC(RadioShow *radioShow, PokemonTalkData *data);
BOOL ov101_021F70F0(PokemonTalkData *data);
void ov101_021F7114(PokemonTalkData *data, Pokedex *pokedex, u16 species);
void ov101_021F7174(PokemonTalkData *data, Pokedex *pokedex, u16 mapID);

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
    FreeToHeap(radioShow->showData);
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
        BufferLandmarkName(radioShow->msgFormat, 0, data->unk_010[data->unk_250][0]);
        BufferSpeciesName(radioShow->msgFormat, 1, data->unk_010[data->unk_250][1]);
        RadioPrintInitEz(radioShow, msg_0414_00004);
        ++data->state;
        break;
    case 4:
        if (!Radio_RunTextPrinter(radioShow)) {
            break;
        }
        for (i = 0; i < 2; ++i) {
            ReadMsgDataIntoString(radioShow->showMsgData, (msg_0414_00019 - msg_0414_00006) * i + (msg_0414_00006 + data->unk_024[data->unk_250][i]), radioShow->curLineStr);
            BufferString(radioShow->msgFormat, i + 2, radioShow->curLineStr, 1, 1, 2);
        }
        RadioPrintInitEz(radioShow, msg_0414_00005);
        ++data->state;
        break;
    case 5:
        if (!Radio_RunTextPrinter(radioShow)) {
            break;
        }
        ++data->unk_250;
        if (data->unk_250 < 5) {
            data->state = 3;
        } else {
            ++data->state;
        }
        break;
    case 6:
        if (ov101_021F5AB8(radioShow)) {
            RadioPrintAndPlayJingle(radioShow, msg_0414_00003);
            ++data->state;
        }
        break;
    case 7:
        if (Radio_RunTextPrinter_WaitJingle(radioShow)) {
            radioShow->unk_66_4 = 1;
            return TRUE;
        }
        break;
    }

    return FALSE;
}
