#ifndef POKEHEARGOLD_APPLICATION_POKEGEAR_RADIO_RADIO_INTERNAL_H
#define POKEHEARGOLD_APPLICATION_POKEGEAR_RADIO_RADIO_INTERNAL_H

#include "application/pokegear/pokegear_internal.h"

typedef enum RadioStationSelection {
    RADIO_STATION_SELECTION_JOHTO,
    RADIO_STATION_SELECTION_KANTO,
    RADIO_STATION_SELECTION_KANTO_EXPN,
    RADIO_STATION_SELECTION_NO_SIGNAL,
    RADIO_STATION_SELECTION_ALPH,
    RADIO_STATION_SELECTION_ROCKET,
    RADIO_STATION_SELECTION_MAHOGANY,
} RadioStationSelection;

typedef enum RadioMainState {
    RADIO_MAIN_STATE_INIT,
    RADIO_MAIN_STATE_INPUT_LOOP,
    RADIO_MAIN_STATE_UNLOAD,
    RADIO_MAIN_STATE_3,
    RADIO_MAIN_STATE_4,
    RADIO_MAIN_STATE_FADE_IN,
    RADIO_MAIN_STATE_FADE_OUT,
    RADIO_MAIN_STATE_FADE_IN_APP,
    RADIO_MAIN_STATE_FADE_OUT_APP,
    RADIO_MAIN_STATE_QUIT,
} RadioMainState;

typedef struct RadioShow {
    HeapID heapID;             // 0x00
    SaveData *saveData;        // 0x04
    u16 mapID;                 // 0x08
    u16 mapHeader;             // 0x0A
    Window *showScriptWindow;  // 0x0C
    Window *showTitleWindow;   // 0x10
    Window *showHostWindow;    // 0x14
    u32 textColor;             // 0x18
    void *showData;            // 0x1C
    MsgData *msgData_269;      // 0x20
    MsgData *showMsgData;      // 0x24
    RTCDate date;              // 0x28
    RTCTime time;              // 0x38
    MessageFormat *msgFormat;  // 0x44
    String *curLineStr;        // 0x48
    String *showTitle;         // 0x4C
    String *showHost;          // 0x50
    u32 lastEpisodeID;         // 0x54
    u8 nextStation;            // 0x58
    u8 curStation;             // 0x59
    u8 lastStation;            // 0x5A
    u8 fgColor;                // 0x5B
    u8 bgColor;                // 0x5C
    u8 shadowColor;            // 0x5D
    u8 runState;               // 0x5E
    u8 printWithJingleState;   // 0x5F
    u8 unk_60;                 // 0x60 unused
    u8 unk_61;                 // 0x61 write-only
    u8 curLineIdx;             // 0x62
    u8 numLines;               // 0x63
    u8 printState;             // 0x64
    u8 textNoScroll;           // 0x65
    u8 isSecondLine : 1;       // 0x66
    u8 statik : 1;             // 0x66. spelling intentional, "static" is a reserved keyword
    u8 inKanto : 1;            // 0x66
    u8 isPlayingJingle : 1;    // 0x66
    u8 triggerCommercials : 1; // 0x66
    u8 delayCounter;           // 0x67
    u8 delayFrames;            // 0x68
    u8 scrollCounter;          // 0x69
    u8 scrollFrames;           // 0x6A
    String *msgbufFormatted;   // 0x6C
    String *msgbufRaw;         // 0x70
} RadioShow;                   // size: 0x74

typedef struct PokegearRadioAppData {
    HeapID heapId;                // 0x00
    int state;                    // 0x04
    int substate;                 // 0x08
    PokegearAppData *pokegear;    // 0x0C
    Sprite *sprites[5];           // 0x10
    u8 unk_24_0 : 1;              // 0x24 unused
    u8 isDraggingCursor : 4;      // 0x24
    u8 selectedButton : 3;        // 0x24
    u8 backgroundStyle;           // 0x25
    u8 stationSelection : 4;      // 0x26
    u8 signalStrength : 2;        // 0x26
    u8 stationActive : 2;         // 0x26
    u8 station;                   // 0x27
    s16 cursorX;                  // 0x28
    s16 cursorY;                  // 0x2A
    u16 bgmBak;                   // 0x2C
    u16 windowScrollStep : 15;    // 0x2E
    u16 windowScrollFinished : 1; // 0x2E
    Window windows[3];            // 0x30
    RadioShow *showData;          // 0x60
    void *pNSCR;                  // 0x64
    NNSG2dScreenData *screenData; // 0x68
} PokegearRadioAppData;           // size: 0x6C

BOOL Radio_VideoInit(PokegearRadioAppData *radioApp);
BOOL Radio_VideoUnload(PokegearRadioAppData *radioApp);

void Radio_OnReselectApp(void *cbArg);
void Radio_UnknownCB(void *cbArg);
void Radio_CloseStation(PokegearRadioAppData *radioApp);
void Radio_Start(PokegearRadioAppData *radioApp);
void Radio_Run(PokegearAppData *pokegear, void *cbArg);
void Radio_BeginScriptWindowSlide(PokegearRadioAppData *radioApp, int direction);
BOOL Radio_RunScriptWindowSlide(PokegearRadioAppData *radioApp, int direction);
int Radio_HandleKeyInput(PokegearRadioAppData *radioApp);
int Radio_HandleTouchInput(PokegearRadioAppData *radioApp, BOOL *inputWasTouch);
u8 Radio_GetTunedStationID(PokegearRadioAppData *radioApp, s16 x, s16 y, u8 *pSignalStrengthRet);
int Radio_HandleTouchInput_Internal(PokegearRadioAppData *radioApp, BOOL *inputWasTouch);
int Radio_HandleDragCursor(PokegearRadioAppData *radioApp);
BOOL Radio_CoordsToStation(PokegearRadioAppData *radioApp, s16 x, s16 y);
void Radio_SnapCursorToChannelHitbox(PokegearRadioAppData *radioApp, u8 channel);

RadioShow *RadioShow_Create(SaveData *saveData, u16 mapID, u16 mapHeader, BOOL inKanto, Window *win1, Window *win2, Window *win3, u32 textColor, HeapID heapId);
void RadioShow_Delete(RadioShow *radioShow);
void RadioShow_BeginSegment(RadioShow *radioShow, int station, int statik);
void RadioShow_EndSegment(RadioShow *radioShow);
void RadioShow_SetStaticLevel(RadioShow *radioShow, int statik);
BOOL RadioShow_DelayAndScrollLine(RadioShow *radioShow);
BOOL RadioShow_Delay(RadioShow *radioShow);
void RadioShow_Main(RadioShow *radioShow);
void RadioPrintInit(RadioShow *radioShow, int msgId, int textNoScroll);
void RadioPrintInitEz(RadioShow *radioShow, int msgId);
void RadioPrintAndPlayJingle(RadioShow *radioShow, int msgId);
BOOL Radio_RunTextPrinter(RadioShow *radioShow);
BOOL Radio_RunTextPrinter_WaitJingle(RadioShow *radioShow);

BOOL RadioShow_PokemonMusic_Setup(RadioShow *radioShow);
BOOL RadioShow_PokemonMusic_Print(RadioShow *radioShow);
BOOL RadioShow_PokemonMusic_Teardown(RadioShow *radioShow);

BOOL RadioShow_PokemonTalk_Setup(RadioShow *radioShow);
BOOL RadioShow_PokemonTalk_Print(RadioShow *radioShow);
BOOL RadioShow_PokemonTalk_Teardown(RadioShow *radioShow);

BOOL RadioShow_PokemonSearchParty_Setup(RadioShow *radioShow);
BOOL RadioShow_PokemonSearchParty_Print(RadioShow *radioShow);
BOOL RadioShow_PokemonSearchParty_Teardown(RadioShow *radioShow);

BOOL RadioShow_SerialRadioDrama_Setup(RadioShow *radioShow);
BOOL RadioShow_SerialRadioDrama_Print(RadioShow *radioShow);
BOOL RadioShow_SerialRadioDrama_Teardown(RadioShow *radioShow);

BOOL RadioShow_BuenasPassword_Setup(RadioShow *radioShow);
BOOL RadioShow_BuenasPassword_Print(RadioShow *radioShow);
BOOL RadioShow_BuenasPassword_Teardown(RadioShow *radioShow);

BOOL RadioShow_TrainerProfiles_Setup(RadioShow *radioShow);
BOOL RadioShow_TrainerProfiles_Print(RadioShow *radioShow);
BOOL RadioShow_TrainerProfiles_Teardown(RadioShow *radioShow);

BOOL RadioShow_ThatTownThesePeople_Setup(RadioShow *radioShow);
BOOL RadioShow_ThatTownThesePeople_Print(RadioShow *radioShow);
BOOL RadioShow_ThatTownThesePeople_Teardown(RadioShow *radioShow);

BOOL RadioShow_PokeFlute_Setup(RadioShow *radioShow);
BOOL RadioShow_PokeFlute_Print(RadioShow *radioShow);
BOOL RadioShow_PokeFlute_Teardown(RadioShow *radioShow);

BOOL RadioShow_Unown_Setup(RadioShow *radioShow);
BOOL RadioShow_Unown_Print(RadioShow *radioShow);
BOOL RadioShow_Unown_Teardown(RadioShow *radioShow);

BOOL RadioShow_TeamRocket_Setup(RadioShow *radioShow);
BOOL RadioShow_TeamRocket_Print(RadioShow *radioShow);
BOOL RadioShow_TeamRocket_Teardown(RadioShow *radioShow);

BOOL RadioShow_MahoganySignal_Setup(RadioShow *radioShow);
BOOL RadioShow_MahoganySignal_Print(RadioShow *radioShow);
BOOL RadioShow_MahoganySignal_Teardown(RadioShow *radioShow);

BOOL RadioShow_Commercials_Setup(RadioShow *radioShow);
BOOL RadioShow_Commercials_Print(RadioShow *radioShow);
BOOL RadioShow_Commercials_Teardown(RadioShow *radioShow);

#endif // POKEHEARGOLD_APPLICATION_POKEGEAR_RADIO_RADIO_INTERNAL_H
