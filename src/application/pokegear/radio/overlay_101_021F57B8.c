#include "global.h"

#include "constants/radio_station.h"
#include "constants/sndseq.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"

#include "sound_radio.h"
#include "text.h"

typedef enum RadioPrintState {
    RADIO_PRINT_STATE_NULL,
    RADIO_PRINT_STATE_WAIT_FIRST_LINE,
    RADIO_PRINT_STATE_PRINT_NEXT_LINE,
    RADIO_PRINT_STATE_WAIT_SCROLL,
    RADIO_PRINT_STATE_WAIT_SCROLL_EXIT,
    RADIO_PRINT_STATE_WAIT_EXIT,
    RADIO_PRINT_STATE_EXIT,
} RadioPrintState;

typedef struct RadioFuncs {
    BOOL (*setup)(RadioShow *);
    BOOL (*print)(RadioShow *);
    BOOL (*teardown)(RadioShow *);
} RadioFuncs;

u8 RadioShow_TranslateStationID(RadioShow *radioShow, int station);
BOOL RadioShow_ScrollTextOffWindow(RadioShow *radioShow);
void RadioShow_PrintTitleAndHost(RadioShow *radioShow);
void PrintRadioLine(RadioShow *radioShow, String *msg, int y);
BOOL RadioPrintAdvance(RadioShow *radioShow);

static const RadioFuncs sRadioShowFuncs[] = {
    { RadioShow_PokemonMusic_Setup,        RadioShow_PokemonMusic_Print,        RadioShow_PokemonMusic_Teardown        },
    { RadioShow_PokemonTalk_Setup,         RadioShow_PokemonTalk_Print,         RadioShow_PokemonTalk_Teardown         },
    { RadioShow_PokemonSearchParty_Setup,  RadioShow_PokemonSearchParty_Print,  RadioShow_PokemonSearchParty_Teardown  },
    { RadioShow_SerialRadioDrama_Setup,    RadioShow_SerialRadioDrama_Print,    RadioShow_SerialRadioDrama_Teardown    },
    { RadioShow_BuenasPassword_Setup,      RadioShow_BuenasPassword_Print,      RadioShow_BuenasPassword_Teardown      },
    { RadioShow_TrainerProfiles_Setup,     RadioShow_TrainerProfiles_Print,     RadioShow_TrainerProfiles_Teardown     },
    { RadioShow_ThatTownThesePeople_Setup, RadioShow_ThatTownThesePeople_Print, RadioShow_ThatTownThesePeople_Teardown },
    { RadioShow_PokeFlute_Setup,           RadioShow_PokeFlute_Print,           RadioShow_PokeFlute_Teardown           },
    { RadioShow_Unown_Setup,               RadioShow_Unown_Print,               RadioShow_Unown_Teardown               },
    { RadioShow_TeamRocket_Setup,          RadioShow_TeamRocket_Print,          RadioShow_TeamRocket_Teardown          },
    { RadioShow_MahoganySignal_Setup,      RadioShow_MahoganySignal_Print,      RadioShow_MahoganySignal_Teardown      },
    { RadioShow_Commercials_Setup,         RadioShow_Commercials_Print,         RadioShow_Commercials_Teardown         },
};

RadioShow *RadioShow_Create(SaveData *saveData, u16 mapID, u16 mapHeader, BOOL inKanto, Window *win1, Window *win2, Window *win3, u32 textColor, HeapID heapId) {
    LocalFieldData *localFieldData = Save_LocalFieldData_Get(saveData);
    PlayerSaveData *playerData = LocalFieldData_GetPlayer(localFieldData);
    u16 *pMusicID = LocalFieldData_GetMusicIdAddr(localFieldData);
    RadioShow *ret = AllocFromHeap(heapId, sizeof(RadioShow));
    MI_CpuClear8(ret, sizeof(RadioShow));
    ret->saveData = saveData;
    ret->mapID = mapID;
    ret->mapHeader = mapHeader;
    ret->inKanto = inKanto;
    ret->showScriptWindow = win1;
    ret->showTitleWindow = win2;
    ret->showHostWindow = win3;
    ret->textColor = textColor;
    ret->fgColor = ret->textColor >> 16;
    ret->shadowColor = ret->textColor >> 8;
    ret->bgColor = ret->textColor;
    ret->heapID = heapId;
    ret->msgData_269 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0269_bin, ret->heapID);
    ret->msgFormat = MessageFormat_New_Custom(8, 51, ret->heapID);
    ret->curLineStr = String_New(51, ret->heapID);
    ret->showTitle = String_New(51, ret->heapID);
    ret->showHost = String_New(51, ret->heapID);
    ret->msgbufFormatted = String_New(1351, ret->heapID);
    ret->msgbufRaw = String_New(1351, ret->heapID);
    if (sub_0205C7EC(playerData) != 1) {
        *pMusicID = 0;
    }
    return ret;
}

void RadioShow_Delete(RadioShow *radioShow) {
    String_Delete(radioShow->msgbufRaw);
    String_Delete(radioShow->msgbufFormatted);
    String_Delete(radioShow->showHost);
    String_Delete(radioShow->showTitle);
    String_Delete(radioShow->curLineStr);
    MessageFormat_Delete(radioShow->msgFormat);
    DestroyMsgData(radioShow->msgData_269);
    MI_CpuClear8(radioShow, sizeof(RadioShow));
    FreeToHeap(radioShow);
}

u8 RadioShow_TranslateStationID(RadioShow *radioShow, int station) {
    if (station >= 8) {
        station = 0;
    }
    if (radioShow->triggerCommercials) {
        radioShow->triggerCommercials = FALSE;
        return RADIO_STATION_COMMERCIALS;
    }

    GF_RTC_CopyDateTime(&radioShow->date, &radioShow->time);
    switch (station) {
    case 0:
        return RADIO_STATION_POKEMON_MUSIC;
    case 1:
        return RADIO_STATION_POKEMON_TALK;
    case 2:
        // 00:00 - 11:59 = RADIO_STATION_TRAINER_PROFILES
        // 12:00 - 23:59 = RADIO_STATION_THAT_TOWN_THESE_PEOPLE
        return RADIO_STATION_TRAINER_PROFILES + (radioShow->time.hour % 2);
    case 3:
        // 00:00 - 07:59 = RADIO_STATION_POKEMON_SEARCH_PARTY
        // 08:00 - 15:59 = RADIO_STATION_SERIAL_RADIO_DRAMA
        // 16:00 - 23:59 = RADIO_STATION_BUENAS_PASSWORD
        return RADIO_STATION_POKEMON_SEARCH_PARTY + (radioShow->time.hour % 3);
    case 4:
        return RADIO_STATION_POKE_FLUTE;
    case 5:
        return RADIO_STATION_UNOWN;
    case 6:
        return RADIO_STATION_TEAM_ROCKET;
    case 7:
        return RADIO_STATION_MAHOGANY_SIGNAL;
    }

    return RADIO_STATION_POKEMON_MUSIC;
}

void RadioShow_BeginSegment(RadioShow *radioShow, int station, int statik) {
    radioShow->isSecondLine = FALSE;
    if (station >= 8) {
        station = 0;
    }
    radioShow->nextStation = station;
    if (radioShow->curStation != RADIO_STATION_COMMERCIALS) {
        radioShow->lastStation = radioShow->curStation;
    }
    radioShow->curStation = RadioShow_TranslateStationID(radioShow, station);
    radioShow->runState = 0;
    radioShow->delayFrames = 45;
    radioShow->delayCounter = 0;
    radioShow->scrollFrames = 8;
    radioShow->scrollCounter = 0;
    radioShow->statik = statik;
    radioShow->isPlayingJingle = FALSE;
    radioShow->printWithJingleState = 0;
    if (radioShow->curStation != RADIO_STATION_COMMERCIALS && radioShow->lastStation != radioShow->curStation) {
        radioShow->lastEpisodeID = 0;
    }
    FillWindowPixelBuffer(radioShow->showScriptWindow, (radioShow->bgColor << 4) | radioShow->bgColor);
    CopyWindowToVram(radioShow->showScriptWindow);
    sRadioShowFuncs[radioShow->curStation].setup(radioShow);
    RadioShow_PrintTitleAndHost(radioShow);
}

void RadioShow_EndSegment(RadioShow *radioShow) {
    if (radioShow->showData != NULL) {
        sRadioShowFuncs[radioShow->curStation].teardown(radioShow);
    }
    FillWindowPixelBuffer(radioShow->showScriptWindow, (radioShow->bgColor << 4) | radioShow->bgColor);
    CopyWindowToVram(radioShow->showScriptWindow);
    radioShow->triggerCommercials = FALSE;
}

void RadioShow_SetStaticLevel(RadioShow *radioShow, BOOL statik) {
    radioShow->statik = statik;
}

BOOL RadioShow_DelayAndScrollLine(RadioShow *radioShow) {
    if (radioShow->delayCounter < radioShow->delayFrames) {
        ++radioShow->delayCounter;
        return FALSE;
    }

    if (radioShow->scrollCounter) {
        ScrollWindow(radioShow->showScriptWindow, 0, 2, 0);
        CopyWindowToVram(radioShow->showScriptWindow);
    }
    if (radioShow->scrollCounter++ < 8) {
        return FALSE;
    }
    radioShow->scrollCounter = 0;
    radioShow->delayCounter = 0;
    return TRUE;
}

BOOL RadioShow_ScrollTextOffWindow(RadioShow *radioShow) {
    ScrollWindow(radioShow->showScriptWindow, 0, 2, 0);
    CopyWindowToVram(radioShow->showScriptWindow);
    if (radioShow->scrollCounter++ < radioShow->scrollFrames) {
        return FALSE;
    }
    radioShow->scrollCounter = 0;
    return TRUE;
}

BOOL RadioShow_Delay(RadioShow *radioShow) {
    if (radioShow->delayCounter++ < radioShow->delayFrames) {
        return FALSE;
    }
    radioShow->delayCounter = 0;
    return TRUE;
}

void RadioShow_Main(RadioShow *radioShow) {
    switch (radioShow->runState) {
    case 0:
        radioShow->runState = sRadioShowFuncs[radioShow->curStation].print(radioShow);
        break;
    case 1:
        sRadioShowFuncs[radioShow->curStation].teardown(radioShow);
        radioShow->scrollFrames = 16;
        radioShow->delayFrames = 15;
        ++radioShow->runState;
        break;
    case 2:
        if (RadioShow_ScrollTextOffWindow(radioShow)) {
            ++radioShow->runState;
        }
        break;
    case 3:
        if (RadioShow_Delay(radioShow)) {
            RadioShow_BeginSegment(radioShow, radioShow->nextStation, radioShow->statik);
            radioShow->runState = 0;
        }
        break;
    }
}

void RadioShow_PrintTitleAndHost(RadioShow *radioShow) {
    FillWindowPixelBuffer(radioShow->showTitleWindow, 0);
    FillWindowPixelBuffer(radioShow->showHostWindow, 0);
    AddTextPrinterParameterizedWithColor(radioShow->showTitleWindow, 0, radioShow->showTitle, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    AddTextPrinterParameterizedWithColor(radioShow->showHostWindow, 0, radioShow->showHost, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    ScheduleWindowCopyToVram(radioShow->showTitleWindow);
    ScheduleWindowCopyToVram(radioShow->showHostWindow);
}

void PrintRadioLine(RadioShow *radioShow, String *msg, int y) {
    if (radioShow->statik == TRUE) {
        String_RadioAddStatic(msg, 70);
    }
    AddTextPrinterParameterizedWithColor(radioShow->showScriptWindow, 0, msg, 0, y * 16, TEXT_SPEED_NOTRANSFER, radioShow->textColor, NULL);
}

BOOL RadioPrintAdvance(RadioShow *radioShow) {
    if (!radioShow->isSecondLine) {
        radioShow->isSecondLine = TRUE;
    }
    String_GetLineN(radioShow->curLineStr, radioShow->msgbufFormatted, radioShow->curLineIdx++);
    PrintRadioLine(radioShow, radioShow->curLineStr, 1);
    CopyWindowToVram(radioShow->showScriptWindow);
    return radioShow->curLineIdx >= radioShow->numLines;
}

void RadioPrintInit(RadioShow *radioShow, int msgId, int textNoScroll) {
    radioShow->textNoScroll = textNoScroll;
    ReadMsgDataIntoString(radioShow->showMsgData, msgId, radioShow->msgbufRaw);
    StringExpandPlaceholders(radioShow->msgFormat, radioShow->msgbufFormatted, radioShow->msgbufRaw);
    radioShow->curLineIdx = 0;
    radioShow->numLines = String_CountLines(radioShow->msgbufFormatted);
    radioShow->printState = RADIO_PRINT_STATE_NULL;
    String_GetLineN(radioShow->curLineStr, radioShow->msgbufFormatted, radioShow->curLineIdx++);
    PrintRadioLine(radioShow, radioShow->curLineStr, radioShow->isSecondLine);
    CopyWindowToVram(radioShow->showScriptWindow);
    if (radioShow->curLineIdx >= radioShow->numLines) {
        radioShow->printState = RADIO_PRINT_STATE_WAIT_EXIT;
    } else if (!radioShow->isSecondLine) {
        radioShow->printState = RADIO_PRINT_STATE_WAIT_FIRST_LINE;
    } else {
        radioShow->printState = RADIO_PRINT_STATE_WAIT_SCROLL;
    }
}

void RadioPrintInitEz(RadioShow *radioShow, int msgId) {
    RadioPrintInit(radioShow, msgId, 0);
}

void RadioPrintAndPlayJingle(RadioShow *radioShow, int msgId) {
    RadioPrintInitEz(radioShow, msgId);
    radioShow->textNoScroll = 1;
    radioShow->isPlayingJingle = TRUE;
    SndRadio_StopSeq(0);
    SndRadio_StartSeq(SEQ_GS_RADIO_JINGLE);
}

BOOL Radio_RunTextPrinter(RadioShow *radioShow) {
    switch (radioShow->printState) {
    case RADIO_PRINT_STATE_NULL:
        break;
    case RADIO_PRINT_STATE_PRINT_NEXT_LINE:
        if (RadioPrintAdvance(radioShow)) {
            if (radioShow->textNoScroll) {
                radioShow->printState = RADIO_PRINT_STATE_EXIT;
            } else {
                radioShow->printState = RADIO_PRINT_STATE_WAIT_SCROLL_EXIT;
            }
        } else {
            radioShow->printState = RADIO_PRINT_STATE_WAIT_SCROLL;
        }
        break;
    case RADIO_PRINT_STATE_WAIT_SCROLL:
        if (RadioShow_DelayAndScrollLine(radioShow)) {
            radioShow->printState = RADIO_PRINT_STATE_PRINT_NEXT_LINE;
        }
        break;
    case RADIO_PRINT_STATE_WAIT_FIRST_LINE:
        if (RadioShow_Delay(radioShow)) {
            radioShow->printState = RADIO_PRINT_STATE_PRINT_NEXT_LINE;
        }
        break;
    case RADIO_PRINT_STATE_WAIT_SCROLL_EXIT:
        if (RadioShow_DelayAndScrollLine(radioShow)) {
            radioShow->printState = RADIO_PRINT_STATE_EXIT;
        }
        break;
    case RADIO_PRINT_STATE_WAIT_EXIT:
        if (!RadioShow_Delay(radioShow)) {
            break;
        }
        // fallthrough
    case RADIO_PRINT_STATE_EXIT:
        radioShow->printState = RADIO_PRINT_STATE_NULL;
        return TRUE;
    }

    return FALSE;
}

BOOL Radio_RunTextPrinter_WaitJingle(RadioShow *radioShow) {
    switch (radioShow->printWithJingleState) {
    case 0:
        if (Radio_RunTextPrinter(radioShow)) {
            ++radioShow->printWithJingleState;
        }
        break;
    case 1:
        if (!SndRadio_CountPlayingSeq()) {
            radioShow->printWithJingleState = 0;
            return TRUE;
        }
    }

    return FALSE;
}
