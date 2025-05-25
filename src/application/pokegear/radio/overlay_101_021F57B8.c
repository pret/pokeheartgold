#include "global.h"

#include "constants/radio_station.h"

#include "application/pokegear/radio/radio_internal.h"
#include "msgdata/msg.naix"

#include "text.h"

typedef struct RadioFuncs {
    void (*setup)(RadioShow *);
    int (*print)(RadioShow *);
    void (*teardown)(RadioShow *);
} RadioFuncs;

u8 ov101_021F58E0(RadioShow *radioShow, int a1);
BOOL ov101_021F5AB8(RadioShow *radioShow);
BOOL ov101_021F5B24(RadioShow *radioShow);
BOOL ov101_021F5B68(RadioShow *radioShow);
void ov101_021F5C44(RadioShow *radioShow);

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
    ret->unk_00 = heapId;
    ret->unk_20 = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0269_bin, ret->unk_00);
    ret->unk_44 = MessageFormat_New_Custom(8, 51, ret->unk_00);
    ret->unk_48 = String_New(51, ret->unk_00);
    ret->unk_4C = String_New(51, ret->unk_00);
    ret->unk_50 = String_New(51, ret->unk_00);
    ret->unk_6C = String_New(1351, ret->unk_00);
    ret->unk_70 = String_New(1351, ret->unk_00);
    if (sub_0205C7EC(sp4) != 1) {
        *sp8 = 0;
    }
    return ret;
}

void ov101_021F58A0(RadioShow *radioShow) {
    String_Delete(radioShow->unk_70);
    String_Delete(radioShow->unk_6C);
    String_Delete(radioShow->unk_50);
    String_Delete(radioShow->unk_4C);
    String_Delete(radioShow->unk_48);
    MessageFormat_Delete(radioShow->unk_44);
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

    GF_RTC_CopyDateTime(&radioShow->unk_28, &radioShow->unk_38);
    switch (a1) {
    case 0:
        return RADIO_STATION_POKEMON_MUSIC;
    case 1:
        return RADIO_STATION_POKEMON_TALK;
    case 2:
        return RADIO_STATION_TRAINER_PROFILES + (radioShow->unk_38.hour % 2);
    case 3:
        return RADIO_STATION_POKEMON_SEARCH_PARTY + (radioShow->unk_38.hour % 3);
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
    radioShow->unk_66_0 = 0;
    if (a1 >= 8) {
        a1 = 0;
    }
    radioShow->unk_58 = a1;
    if (radioShow->unk_59 != RADIO_STATION_COMMERCIALS) {
        radioShow->unk_5A = radioShow->unk_59;
    }
    radioShow->unk_59 = ov101_021F58E0(radioShow, a1);
    radioShow->unk_5E = 0;
    radioShow->unk_68 = 45;
    radioShow->unk_67 = 0;
    radioShow->unk_6A = 8;
    radioShow->unk_69 = 0;
    radioShow->unk_66_1 = a2;
    radioShow->unk_66_3 = 0;
    radioShow->unk_5F = 0;
    if (radioShow->unk_59 != RADIO_STATION_COMMERCIALS && radioShow->unk_5A != radioShow->unk_59) {
        radioShow->unk_54 = 0;
    }
    FillWindowPixelBuffer(radioShow->unk_0C, (radioShow->unk_5C << 4) | radioShow->unk_5C);
    CopyWindowToVram(radioShow->unk_0C);
    ov101_021F8A04[radioShow->unk_59].setup(radioShow);
    ov101_021F5C44(radioShow);
}

void ov101_021F5A50(RadioShow *radioShow) {
    if (radioShow->unk_1C) {
        ov101_021F8A04[radioShow->unk_59].teardown(radioShow);
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
        radioShow->unk_5E = ov101_021F8A04[radioShow->unk_59].print(radioShow);
        break;
    case 1:
        ov101_021F8A04[radioShow->unk_59].teardown(radioShow);
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
    AddTextPrinterParameterizedWithColor(radioShow->unk_10, 0, radioShow->unk_4C, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    AddTextPrinterParameterizedWithColor(radioShow->unk_14, 0, radioShow->unk_50, 0, 0, TEXT_SPEED_NOTRANSFER, MAKE_TEXT_COLOR(1, 2, 0), NULL);
    ScheduleWindowCopyToVram(radioShow->unk_10);
    ScheduleWindowCopyToVram(radioShow->unk_14);
}
