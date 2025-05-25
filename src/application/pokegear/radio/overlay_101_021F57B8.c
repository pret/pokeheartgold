#include "global.h"

#include "constants/radio_station.h"
#include "constants/sndseq.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"

#include "sound_radio.h"
#include "text.h"

typedef struct RadioFuncs {
    BOOL (*setup)(RadioShow *);
    BOOL (*print)(RadioShow *);
    BOOL (*teardown)(RadioShow *);
} RadioFuncs;

u8 ov101_021F58E0(RadioShow *radioShow, int a1);
BOOL ov101_021F5B24(RadioShow *radioShow);
BOOL ov101_021F5B68(RadioShow *radioShow);
void ov101_021F5C44(RadioShow *radioShow);
void PrintRadioLine(RadioShow *radioShow, String *msg, int y);
BOOL RadioPrintAdvance(RadioShow *radioShow);

static const RadioFuncs ov101_021F8A04[] = {
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

RadioShow *ov101_021F57B8(SaveData *saveData, u16 mapID, u16 mapHeader, BOOL inKanto, Window *win1, Window *win2, Window *win3, u32 textColor, HeapID heapId) {
    LocalFieldData *r4 = Save_LocalFieldData_Get(saveData);
    PlayerSaveData *sp4 = LocalFieldData_GetPlayer(r4);
    u16 *sp8 = LocalFieldData_GetMusicIdAddr(r4);
    RadioShow *ret = AllocFromHeap(heapId, sizeof(RadioShow));
    MI_CpuClear8(ret, sizeof(RadioShow));
    ret->unk_04 = saveData;
    ret->unk_08 = mapID;
    ret->unk_0A = mapHeader;
    ret->unk_66_2 = inKanto;
    ret->unk_0C = win1;
    ret->unk_10 = win2;
    ret->unk_14 = win3;
    ret->unk_18 = textColor;
    ret->unk_5B = ret->unk_18 >> 16;
    ret->unk_5D = ret->unk_18 >> 8;
    ret->unk_5C = ret->unk_18;
    ret->heapID = heapId;
    ret->unk_20 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0269_bin, ret->heapID);
    ret->msgFormat = MessageFormat_New_Custom(8, 51, ret->heapID);
    ret->curLineStr = String_New(51, ret->heapID);
    ret->showTitle = String_New(51, ret->heapID);
    ret->showHost = String_New(51, ret->heapID);
    ret->msgbufFormatted = String_New(1351, ret->heapID);
    ret->msgbufRaw = String_New(1351, ret->heapID);
    if (sub_0205C7EC(sp4) != 1) {
        *sp8 = 0;
    }
    return ret;
}

void ov101_021F58A0(RadioShow *radioShow) {
    String_Delete(radioShow->msgbufRaw);
    String_Delete(radioShow->msgbufFormatted);
    String_Delete(radioShow->showHost);
    String_Delete(radioShow->showTitle);
    String_Delete(radioShow->curLineStr);
    MessageFormat_Delete(radioShow->msgFormat);
    DestroyMsgData(radioShow->unk_20);
    MI_CpuClear8(radioShow, sizeof(RadioShow));
    FreeToHeap(radioShow);
}

u8 ov101_021F58E0(RadioShow *radioShow, int a1) {
    if (a1 >= 8) {
        a1 = 0;
    }
    if (radioShow->unk_66_4) {
        radioShow->unk_66_4 = 0;
        return RADIO_STATION_COMMERCIALS;
    }

    GF_RTC_CopyDateTime(&radioShow->date, &radioShow->time);
    switch (a1) {
    case 0:
        return RADIO_STATION_POKEMON_MUSIC;
    case 1:
        return RADIO_STATION_POKEMON_TALK;
    case 2:
        return RADIO_STATION_TRAINER_PROFILES + (radioShow->time.hour % 2);
    case 3:
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

void ov101_021F5970(RadioShow *radioShow, int a1, int a2) {
    radioShow->isSecondLine = 0;
    if (a1 >= 8) {
        a1 = 0;
    }
    radioShow->unk_58 = a1;
    if (radioShow->curStation != RADIO_STATION_COMMERCIALS) {
        radioShow->lastStation = radioShow->curStation;
    }
    radioShow->curStation = ov101_021F58E0(radioShow, a1);
    radioShow->unk_5E = 0;
    radioShow->unk_68 = 45;
    radioShow->unk_67 = 0;
    radioShow->unk_6A = 8;
    radioShow->unk_69 = 0;
    radioShow->unk_66_1 = a2;
    radioShow->unk_66_3 = 0;
    radioShow->printWithJingleState = 0;
    if (radioShow->curStation != RADIO_STATION_COMMERCIALS && radioShow->lastStation != radioShow->curStation) {
        radioShow->unk_54 = 0;
    }
    FillWindowPixelBuffer(radioShow->unk_0C, (radioShow->unk_5C << 4) | radioShow->unk_5C);
    CopyWindowToVram(radioShow->unk_0C);
    ov101_021F8A04[radioShow->curStation].setup(radioShow);
    ov101_021F5C44(radioShow);
}

void ov101_021F5A50(RadioShow *radioShow) {
    if (radioShow->showData != NULL) {
        ov101_021F8A04[radioShow->curStation].teardown(radioShow);
    }
    FillWindowPixelBuffer(radioShow->unk_0C, (radioShow->unk_5C << 4) | radioShow->unk_5C);
    CopyWindowToVram(radioShow->unk_0C);
    radioShow->unk_66_4 = 0;
}

void ov101_021F5A9C(RadioShow *radioShow, int a1) {
    radioShow->unk_66_1 = a1;
}

BOOL ov101_021F5AB8(RadioShow *radioShow) {
    u8 r2;

    if (radioShow->unk_67 < radioShow->unk_68) {
        ++radioShow->unk_67;
        return FALSE;
    }

    if (radioShow->unk_69) {
        ScrollWindow(radioShow->unk_0C, 0, 2, 0);
        CopyWindowToVram(radioShow->unk_0C);
    }
    r2 = radioShow->unk_69;
    ++radioShow->unk_69;
    if (r2 < 8) {
        return FALSE;
    }
    radioShow->unk_69 = 0;
    radioShow->unk_67 = 0;
    return TRUE;
}

BOOL ov101_021F5B24(RadioShow *radioShow) {
    u8 r2;
    ScrollWindow(radioShow->unk_0C, 0, 2, 0);
    CopyWindowToVram(radioShow->unk_0C);
    r2 = radioShow->unk_69;
    ++radioShow->unk_69;
    if (r2 < radioShow->unk_6A) {
        return FALSE;
    }
    radioShow->unk_69 = 0;
    return TRUE;
}

BOOL ov101_021F5B68(RadioShow *radioShow) {
    u8 r3 = radioShow->unk_67;
    ++radioShow->unk_67;
    if (r3 < radioShow->unk_68) {
        return FALSE;
    }
    radioShow->unk_67 = 0;
    return TRUE;
}

void ov101_021F5B94(RadioShow *radioShow) {
    switch (radioShow->unk_5E) {
    case 0:
        radioShow->unk_5E = ov101_021F8A04[radioShow->curStation].print(radioShow);
        break;
    case 1:
        ov101_021F8A04[radioShow->curStation].teardown(radioShow);
        radioShow->unk_6A = 16;
        radioShow->unk_68 = 15;
        ++radioShow->unk_5E;
        break;
    case 2:
        if (ov101_021F5B24(radioShow)) {
            ++radioShow->unk_5E;
        }
        break;
    case 3:
        if (ov101_021F5B68(radioShow)) {
            ov101_021F5970(radioShow, radioShow->unk_58, radioShow->unk_66_1);
            radioShow->unk_5E = 0;
        }
        break;
    }
}

void ov101_021F5C44(RadioShow *radioShow) {
    FillWindowPixelBuffer(radioShow->unk_10, 0);
    FillWindowPixelBuffer(radioShow->unk_14, 0);
    AddTextPrinterParameterizedWithColor(radioShow->unk_10, 0, radioShow->showTitle, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    AddTextPrinterParameterizedWithColor(radioShow->unk_14, 0, radioShow->showHost, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    ScheduleWindowCopyToVram(radioShow->unk_10);
    ScheduleWindowCopyToVram(radioShow->unk_14);
}

void PrintRadioLine(RadioShow *radioShow, String *msg, int y) {
    if (radioShow->unk_66_1 == 1) {
        String_RadioAddStatic(msg, 70);
    }
    AddTextPrinterParameterizedWithColor(radioShow->unk_0C, 0, msg, 0, y * 16, TEXT_SPEED_NOTRANSFER, radioShow->unk_18, NULL);
}

BOOL RadioPrintAdvance(RadioShow *radioShow) {
    u8 r2;
    if (!radioShow->isSecondLine) {
        radioShow->isSecondLine = 1;
    }
    r2 = radioShow->curLineIdx;
    ++radioShow->curLineIdx;
    String_GetLineN(radioShow->curLineStr, radioShow->msgbufFormatted, r2);
    PrintRadioLine(radioShow, radioShow->curLineStr, 1);
    CopyWindowToVram(radioShow->unk_0C);
    return radioShow->curLineIdx >= radioShow->numLines;
}

void RadioPrintInit(RadioShow *radioShow, int msgId, int a2) {
    u8 r2;
    radioShow->unk_65 = a2;
    ReadMsgDataIntoString(radioShow->showMsgData, msgId, radioShow->msgbufRaw);
    StringExpandPlaceholders(radioShow->msgFormat, radioShow->msgbufFormatted, radioShow->msgbufRaw);
    radioShow->curLineIdx = 0;
    radioShow->numLines = String_CountLines(radioShow->msgbufFormatted);
    radioShow->printState = 0;
    r2 = radioShow->curLineIdx;
    ++radioShow->curLineIdx;
    String_GetLineN(radioShow->curLineStr, radioShow->msgbufFormatted, r2);
    PrintRadioLine(radioShow, radioShow->curLineStr, radioShow->isSecondLine);
    CopyWindowToVram(radioShow->unk_0C);
    if (radioShow->curLineIdx >= radioShow->numLines) {
        radioShow->printState = 5;
    } else if (!radioShow->isSecondLine) {
        radioShow->printState = 1;
    } else {
        radioShow->printState = 3;
    }
}

void RadioPrintInitEz(RadioShow *radioShow, int msgId) {
    RadioPrintInit(radioShow, msgId, 0);
}

void RadioPrintAndPlayJingle(RadioShow *radioShow, int msgId) {
    RadioPrintInitEz(radioShow, msgId);
    radioShow->unk_65 = 1;
    radioShow->unk_66_3 = 1;
    SndRadio_StopSeq(0);
    SndRadio_StartSeq(SEQ_GS_RADIO_JINGLE);
}

BOOL Radio_RunTextPrinter(RadioShow *radioShow) {
    switch (radioShow->printState) {
    case 0:
        break;
    case 2:
        if (RadioPrintAdvance(radioShow)) {
            if (radioShow->unk_65) {
                radioShow->printState = 6;
            } else {
                radioShow->printState = 4;
            }
        } else {
            radioShow->printState = 3;
        }
        break;
    case 3:
        if (ov101_021F5AB8(radioShow)) {
            radioShow->printState = 2;
        }
        break;
    case 1:
        if (ov101_021F5B68(radioShow)) {
            radioShow->printState = 2;
        }
        break;
    case 4:
        if (ov101_021F5AB8(radioShow)) {
            radioShow->printState = 6;
        }
        break;
    case 5:
        if (!ov101_021F5B68(radioShow)) {
            break;
        }
        // fallthrough
    case 6:
        radioShow->printState = 0;
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
