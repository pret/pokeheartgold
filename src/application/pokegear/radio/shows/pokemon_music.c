#include "global.h"

#include "constants/sndseq.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0416.h"

#include "bag.h"
#include "math_util.h"
#include "sound_02004A44.h"
#include "sound_radio.h"
#include "unk_02005D10.h"

typedef enum PokemonMusicTrack {
    PKMUSTRACK_MARCH,
    PKMUSTRACK_LULLABY,
    PKMUSTRACK_HOENN,
    PKMUSTRACK_SINNOH,
    PKMUSTRACK_GBSOUNDS,
} PokemonMusicTrack;

typedef enum PokemonMusicState {
    PKMUSSTATE_PRINT_INTRO,
    PKMUSSTATE_WAIT_INTRO,
    PKMUSSTATE_PRINT_DAY,
    PKMUSSTATE_LOOP_DAY,
    PKMUSSTATE_WAIT_OUT,
} PokemonMusicState;

typedef struct PokemonMusicData {
    HeapID heapID;
    u8 hasNationalDex : 1;
    u8 playingTrack : 7;
    u8 queuedMsg;
    u8 weekday;
    u8 queuedTrack;
    u8 state;
    RTCDate tuneInDate;
    RTCDate afterIntroDate;
    u8 filler_2C[0x0C];
} PokemonMusicData; // size: 0x38

void RadioShow_PokemonMusic_StartPlaying(RadioShow *radioShow, u8 track);
void RadioShow_PokemonMusic_Init(RadioShow *radioShow);
void RadioShow_PokemonMusic_Unload(RadioShow *radioShow);

static const u16 sMusicIDs_Default[] = {
    SEQ_GS_RADIO_MARCH,
    SEQ_GS_RADIO_KOMORIUTA,
    SEQ_GS_RADIO_R_101,
    SEQ_GS_RADIO_R_201,
};

static const u16 sMusicIDS_GBSounds[] = {
    SEQ_GS_P_TITLE,
    SEQ_GS_P_OPENING_TITLE_G,
    SEQ_GS_P_ENDING,
    SEQ_GS_P_ENDING2,
    SEQ_GS_P_SENKYO,
    SEQ_GS_P_E_MINAKI,
    SEQ_GS_P_IBUKI,
    SEQ_GS_P_EYE_J_SHOUJO,
    SEQ_GS_P_EYE_J_SHOUNEN,
    SEQ_GS_P_EYE_J_AYASHII,
    SEQ_GS_P_EYE_BOUZU,
    SEQ_GS_P_EYE_MAIKO,
    SEQ_GS_P_EYE_ROCKET,
    SEQ_GS_P_EYE_K_SHOUJO,
    SEQ_GS_P_EYE_K_SHOUNEN,
    SEQ_GS_P_EYE_K_AYASHII,
    SEQ_GS_P_VS_ROCKET,
    SEQ_GS_P_AIKOTOBA,
    SEQ_GS_P_RADIO_JINGLE,
    SEQ_GS_P_OHKIDO_RABO,
    SEQ_GS_P_RADIO_MARCH,
    SEQ_GS_P_RADIO_KOMORIUTA,
    SEQ_GS_P_HUE,
    SEQ_GS_P_POKEMON_THEME,
    SEQ_GS_P_OHKIDO,
};

void RadioShow_PokemonMusic_StartPlaying(RadioShow *radioShow, u8 track) {
    PokemonMusicData *data = radioShow->showData;
    u16 seqNo;
    if (track == PKMUSTRACK_GBSOUNDS) {
        track = (LCRandom() % 25000) / 1000;
        seqNo = sMusicIDS_GBSounds[track];
    } else {
        seqNo = sMusicIDs_Default[track];
    }
    data->playingTrack = track;
    SndRadio_StartSeq(seqNo);
}

BOOL RadioShow_PokemonMusic_Setup(RadioShow *radioShow) {
    PokemonMusicData *data = AllocFromHeap(radioShow->heapID, sizeof(PokemonMusicData));
    MI_CpuClear8(data, sizeof(PokemonMusicData));
    // data->heapID = radioShow->heapID;
    data->hasNationalDex = Pokedex_GetNatDexFlag(Save_Pokedex_Get(radioShow->saveData));
    {
        RTCTime dummy;
        GF_RTC_CopyDateTime(&data->tuneInDate, &dummy);
    }
    data->weekday = data->tuneInDate.week;
    data->queuedMsg = msg_0416_00003 + data->weekday;
    switch (data->weekday) {
    case RTC_WEEK_SUNDAY:
        if (Bag_HasItem(Save_Bag_Get(radioShow->saveData), ITEM_GB_SOUNDS, 1, data->heapID)) {
            data->queuedTrack = PKMUSTRACK_GBSOUNDS;
        } else {
            data->queuedTrack = PKMUSTRACK_MARCH;
            data->queuedMsg = msg_0416_00012;
        }
        break;
    case RTC_WEEK_MONDAY:
    case RTC_WEEK_FRIDAY:
        data->queuedTrack = PKMUSTRACK_MARCH;
        break;
    case RTC_WEEK_WEDNESDAY:
        if (data->hasNationalDex) {
            data->queuedTrack = PKMUSTRACK_HOENN;
            data->queuedMsg = msg_0416_00010;
        } else {
            data->queuedTrack = PKMUSTRACK_MARCH;
        }
        break;
    case RTC_WEEK_TUESDAY:
    case RTC_WEEK_SATURDAY:
        data->queuedTrack = PKMUSTRACK_LULLABY;
        break;
    case RTC_WEEK_THURSDAY:
        if (data->hasNationalDex) {
            data->queuedTrack = PKMUSTRACK_SINNOH;
            data->queuedMsg = msg_0416_00011;
        } else {
            data->queuedTrack = PKMUSTRACK_LULLABY;
        }
        break;
    }
    radioShow->showData = data;
    radioShow->unk_61 = 0;
    RadioShow_PokemonMusic_Init(radioShow);
    StopBGM(GF_GetCurrentPlayingBGM(), 0);
    RadioShow_PokemonMusic_StartPlaying(radioShow, data->queuedTrack);
    radioShow->isSecondLine = FALSE;
    return FALSE;
}

BOOL RadioShow_PokemonMusic_Teardown(RadioShow *radioShow) {
    RadioShow_PokemonMusic_Unload(radioShow);
    MI_CpuClear8(radioShow->showData, sizeof(PokemonMusicData));
    FreeToHeap(radioShow->showData);
    radioShow->showData = NULL;
    return FALSE;
}

BOOL RadioShow_PokemonMusic_Print(RadioShow *radioShow) {
    PokemonMusicData *data = radioShow->showData;

    switch (data->state) {
    case PKMUSSTATE_PRINT_INTRO:
        RadioPrintInitEz(radioShow, msg_0416_00002);
        ++data->state;
        break;
    case PKMUSSTATE_WAIT_INTRO:
        if (Radio_RunTextPrinter(radioShow)) {
            ++data->state;
        }
        break;
    case PKMUSSTATE_PRINT_DAY:
        GF_RTC_CopyDate(&data->afterIntroDate);
        RadioPrintInitEz(radioShow, data->queuedMsg);
        ++data->state;
        break;
    case PKMUSSTATE_LOOP_DAY:
        if (Radio_RunTextPrinter(radioShow)) {
            RTCDate date;
            GF_RTC_CopyDate(&date);
            if (date.day == data->afterIntroDate.day && date.day == data->tuneInDate.day) {
                data->state = PKMUSSTATE_PRINT_DAY;
                return FALSE;
            } else {
                radioShow->isPlayingJingle = TRUE;
                StopBGM(GF_GetCurrentPlayingBGM(), 30);
                ++data->state;
            }
        }
        break;
    case PKMUSSTATE_WAIT_OUT:
        if (RadioShow_DelayAndScrollLine(radioShow)) {
            return TRUE;
        }
        break;
    }
    return FALSE;
}

void RadioShow_PokemonMusic_Init(RadioShow *radioShow) {
    radioShow->showMsgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0416_bin, radioShow->heapID);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0416_00000, radioShow->showTitle);
    ReadMsgDataIntoString(radioShow->showMsgData, msg_0416_00001, radioShow->showHost);
}

void RadioShow_PokemonMusic_Unload(RadioShow *radioShow) {
    DestroyMsgData(radioShow->showMsgData);
}
