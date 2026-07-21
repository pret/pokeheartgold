#include "overlay_03.h"

#include "field_system.h"
#include "font.h"
#include "global.h"
#include "link_ruleset_data.h"
#include "list_menu_items.h"
#include "save_link_ruleset.h"
#include "task.h"
#include "text.h"
#include "text_0205B4EC.h"
#include "unk_02005D10.h"

#include "msgdata/msg.naix"
#include "msgdata/msg/msg_0046.h"
#include "msgdata/msg/msg_0182.h"

enum RegulationMenus {
    REGULATION_MENU_REGULATIONS,
    REGULATION_MENU_CONFIRM,
    REGULATION_MENU_MAX,
};

enum RegulationMenuStrings {
    REGULATION_MENU_STRING_FMT,
    REGULATION_MENU_STRING_DESTINATION,
    REGULATION_MENU_STRING_REGULATION_NAME,
    REGULATION_MENU_STRING_CUP_NAME,
    REGULATION_MENU_STRING_MAX,
};

enum RegulationMenuWindows {
    REGULATION_MENU_WINDOW_RULES,
    REGULATION_MENU_WINDOW_REGULATIONS,
    REGULATION_MENU_WINDOW_CONFIRM,
    REGULATION_MENU_WINDOW_MSGBOX,
    REGULATION_MENU_WINDOW_MAX,
};

typedef struct BattleRegulationMenu {
    ListMenu *listMenu[REGULATION_MENU_MAX];
    ListMenuItem *items[REGULATION_MENU_MAX];
    FieldSystem *fieldSystem;
    String *strings[REGULATION_MENU_STRING_MAX];
    Window windows[REGULATION_MENU_WINDOW_MAX];
    MessageFormat *messageFormat;
    MsgData *msgData;
    PokedexData *pokedexData;
    u16 *result;
    int printerID;
    u16 itemsAbove[REGULATION_MENU_MAX];
    int state;
    u16 unk80[REGULATION_MENU_MAX];
} BattleRegulationMenu;

typedef struct ConfirmMenuEntry {
    u32 bankEntry;
    u32 index;
} ConfirmMenuEntry;

static const ListMenuTemplate sListMenuTemplate = {
    .items = NULL,
    .moveCursorFunc = NULL,
    .itemPrintFunc = NULL,
    .window = NULL,
    .totalItems = 0,
    .maxShowed = 0,
    .header_X = 0,
    .item_X = 8,
    .cursor_X = 0,
    .upText_Y = 0,
    .cursorPal = 1,
    .fillValue = 15,
    .cursorShadowPal = 2,
    .lettersSpacing = 0,
    .itemVerticalPadding = 16,
    .scrollMultiple = LIST_MULTIPLE_SCROLL_DPAD,
    .fontId = 0, // FONT_SYSTEM
    .cursorKind = 0,
    .data = NULL
};

static void BattleRegulationMenu_PrintMessage(BattleRegulationMenu *menu, int entryID) {
    if (WindowIsInUse(&menu->windows[REGULATION_MENU_WINDOW_MSGBOX]) == FALSE) {
        InitWindow(&menu->windows[REGULATION_MENU_WINDOW_MSGBOX]);
        sub_0205B514(menu->fieldSystem->bgConfig, &menu->windows[REGULATION_MENU_WINDOW_MSGBOX], 3);
        sub_0205B564(&menu->windows[REGULATION_MENU_WINDOW_MSGBOX], Save_PlayerData_GetOptionsAddr(menu->fieldSystem->saveData));
    } else {
        sub_0205B5A8(&menu->windows[REGULATION_MENU_WINDOW_MSGBOX]);
    }
    ReadMsgDataIntoString(menu->msgData, entryID, menu->strings[REGULATION_MENU_STRING_FMT]);
    StringExpandPlaceholders(menu->messageFormat, menu->strings[REGULATION_MENU_STRING_DESTINATION], menu->strings[REGULATION_MENU_STRING_FMT]);
    menu->printerID = sub_0205B5B4(&menu->windows[REGULATION_MENU_WINDOW_MSGBOX], menu->strings[REGULATION_MENU_STRING_DESTINATION], Save_PlayerData_GetOptionsAddr(menu->fieldSystem->saveData), 1);
}

static void BattleRegulationMenu_RemoveMsgBox(BattleRegulationMenu *menu, BOOL clear) {
    if (clear) {
        ClearFrameAndWindow2(&menu->windows[REGULATION_MENU_WINDOW_MSGBOX], FALSE);
        ClearWindowTilemapAndCopyToVram(&menu->windows[REGULATION_MENU_WINDOW_MSGBOX]);
    }
    RemoveWindow(&menu->windows[REGULATION_MENU_WINDOW_MSGBOX]);
}

static void BattleRegulationMenu_GetRegulationName(BattleRegulationMenu *menu, int index) {
    sub_0202921C(menu->fieldSystem->saveData, index, menu->strings[REGULATION_MENU_STRING_REGULATION_NAME], HEAP_ID_FIELD1);
    BufferString(menu->messageFormat, 0, menu->strings[REGULATION_MENU_STRING_REGULATION_NAME], 0, 1, LANGUAGE_ENGLISH);
}

static void BattleRegulationMenu_ShowListMenuRegulations(BattleRegulationMenu *menu) {
    ListMenuTemplate listMenuTemplate;
    Window *window = &menu->windows[REGULATION_MENU_WINDOW_REGULATIONS];
    LinkBattleRuleset *ruleset = Save_LinkBattleRuleset_GetByIndex(menu->fieldSystem->saveData, 0);
    int items = 5;
    if (ruleset) {
        items++;
    }
    if (!WindowIsInUse(window)) {
        menu->items[REGULATION_MENU_REGULATIONS] = ListMenuItems_New(items + 2, HEAP_ID_FIELD1);
        AddWindowParameterized(menu->fieldSystem->bgConfig, window, 3, 1, 1, 16, (items + 2) * 2, 13, 1);
        DrawFrameAndWindow1(&menu->windows[REGULATION_MENU_WINDOW_REGULATIONS], TRUE, 985, 11);
        ListMenuItems_AppendFromMsgData(menu->items[REGULATION_MENU_REGULATIONS], menu->msgData, 138, 12); // PokemonCenter2FCommon_Text_NoRestrictions?
        for (int i = 0; i < items; i++) {
            BattleRegulationMenu_GetRegulationName(menu, i);
            ReadMsgDataIntoString(menu->msgData, 128, menu->strings[REGULATION_MENU_STRING_REGULATION_NAME]); // PokemonCenter2FCommon_Text_Cup?
            StringExpandPlaceholders(menu->messageFormat, menu->strings[REGULATION_MENU_STRING_CUP_NAME], menu->strings[REGULATION_MENU_STRING_REGULATION_NAME]);
            ListMenuItems_AddItem(menu->items[REGULATION_MENU_REGULATIONS], menu->strings[REGULATION_MENU_STRING_CUP_NAME], i);
        }
        ListMenuItems_AppendFromMsgData(menu->items[REGULATION_MENU_REGULATIONS], menu->msgData, 129, -2); // PokemonCenter2FCommon_Text_Cancel?
    }

    listMenuTemplate = sListMenuTemplate;
    listMenuTemplate.totalItems = items + 2;
    listMenuTemplate.maxShowed = items + 2;
    listMenuTemplate.items = menu->items[REGULATION_MENU_REGULATIONS];
    listMenuTemplate.window = &menu->windows[REGULATION_MENU_WINDOW_REGULATIONS];
    listMenuTemplate.data = menu;
    
    menu->listMenu[REGULATION_MENU_REGULATIONS] = ListMenuInit(&listMenuTemplate, 0, menu->itemsAbove[REGULATION_MENU_REGULATIONS], HEAP_ID_FIELD1);
    CopyWindowToVram(&menu->windows[REGULATION_MENU_WINDOW_REGULATIONS]);
}

static void BattleRegulationMenu_RemoveListMenuRegulations(BattleRegulationMenu *menu) {
    if (menu->listMenu[REGULATION_MENU_REGULATIONS]) {
        DestroyListMenu(menu->listMenu[REGULATION_MENU_REGULATIONS], NULL, NULL);
        sub_0200E5D4(&menu->windows[REGULATION_MENU_STRING_DESTINATION], TRUE);
        ScheduleBgTilemapBufferTransfer(menu->windows[REGULATION_MENU_STRING_DESTINATION].bgConfig, menu->windows[REGULATION_MENU_STRING_DESTINATION].bgId);
        RemoveWindow(&menu->windows[REGULATION_MENU_STRING_DESTINATION]);
        ListMenuItems_Delete(menu->items[REGULATION_MENU_REGULATIONS]);
        menu->listMenu[REGULATION_MENU_REGULATIONS] = NULL;
    }
}

static int BattleRegulationMenu_ProcessListMenuInputRegulations(BattleRegulationMenu *menu) {
    int input = ListMenu_ProcessInput(menu->listMenu[REGULATION_MENU_REGULATIONS]);
    ListMenuGetScrollAndRow(menu->listMenu[REGULATION_MENU_REGULATIONS], 0, &menu->itemsAbove[REGULATION_MENU_REGULATIONS]);
    
    u16 prev = menu->unk80[REGULATION_MENU_REGULATIONS];
    ListMenuGetCurrentItemArrayId(menu->listMenu[REGULATION_MENU_REGULATIONS], &menu->unk80[REGULATION_MENU_REGULATIONS]);
    
    if (prev != menu->unk80[REGULATION_MENU_REGULATIONS]) {
        PlaySE(SEQ_SE_DP_SELECT);
    }
    
    switch (input) {
    case -1:
        return 0;
    case 12:
        PlaySE(SEQ_SE_DP_SELECT);
        menu->fieldSystem->linkBattleRuleset = NULL;
        BattleRegulationMenu_RemoveListMenuRegulations(menu);
        return 2;
    case -2:
        PlaySE(SEQ_SE_DP_SELECT);
        menu->fieldSystem->linkBattleRuleset = NULL;
        BattleRegulationMenu_RemoveListMenuRegulations(menu);
        return -1;
    default:
        PlaySE(SEQ_SE_DP_SELECT);
        &menu->fieldSystem->linkBattleRuleset->rules[0] = sub_020291E8(menu->fieldSystem->saveData, input);
        return 1;
    }
}

static ConfirmMenuEntry sConfirmMenuEntries[3] = {
    {msg_0046_Confirm, 1},          // CONFIRM
    {msg_0046_Rules, 2},            // RULES
    {msg_0046_Cancel, 0xFFFFFFFE}   // CANCEL
};

static void BattleRegulationMenu_ShowListMenuConfirm(BattleRegulationMenu *menu) {
    ListMenuTemplate listMenuTemplate;
    ConfirmMenuEntry *menuEntry = sConfirmMenuEntries;
    menu->items[REGULATION_MENU_CONFIRM] = ListMenuItems_New(3, HEAP_ID_FIELD1);
    AddWindowParameterized(menu->fieldSystem->bgConfig, &menu->windows[REGULATION_MENU_WINDOW_CONFIRM], 3, 22, 10, 9, 6, 13, 513);
    DrawFrameAndWindow1(&menu->windows[REGULATION_MENU_WINDOW_CONFIRM], TRUE, 985, 11); // 985 == BASE_TILE_STANDARD_WINDOW_FRAME in pokeplatinum

    for (int i = 0; i < 3; i++) {
        ListMenuItems_AppendFromMsgData(menu->items[REGULATION_MENU_CONFIRM], menu->msgData, menuEntry->bankEntry, menuEntry->index);
        menuEntry++;
    };
    
    listMenuTemplate = sListMenuTemplate;
    listMenuTemplate.totalItems = 3;
    listMenuTemplate.maxShowed = 3;
    listMenuTemplate.items = menu->items[REGULATION_MENU_CONFIRM];
    listMenuTemplate.window = &menu->windows[REGULATION_MENU_WINDOW_CONFIRM];
    listMenuTemplate.data = menu;
    menu->listMenu[REGULATION_MENU_CONFIRM] = ListMenuInit(&listMenuTemplate, 0, menu->itemsAbove[REGULATION_MENU_CONFIRM], HEAP_ID_FIELD1);
    CopyWindowToVram(&menu->windows[REGULATION_MENU_WINDOW_CONFIRM]);
}

static int BattleRegulationMenu_ProcessListMenuInputConfirm(BattleRegulationMenu *menu) {
    int input = ListMenu_ProcessInput(menu->listMenu[REGULATION_MENU_CONFIRM]);
    ListMenuGetScrollAndRow(menu->listMenu[REGULATION_MENU_CONFIRM], 0, &menu->itemsAbove[REGULATION_MENU_CONFIRM]);
    
    u16 prev = menu->unk80[REGULATION_MENU_CONFIRM];
    ListMenuGetCurrentItemArrayId(menu->listMenu[REGULATION_MENU_CONFIRM], &menu->unk80[REGULATION_MENU_CONFIRM]);
    
    if (prev != menu->unk80[REGULATION_MENU_CONFIRM]) {
        PlaySE(SEQ_SE_DP_SELECT);
    }

    switch(input) {
        case -1:
            return 0;
        case -2:
            PlaySE(SEQ_SE_DP_SELECT);
            input = -1;
            break;
        default:
            PlaySE(SEQ_SE_DP_SELECT);
            BattleRegulationMenu_RemoveListMenuRegulations(menu);
            break;
    }

    if (menu->listMenu[REGULATION_MENU_CONFIRM]) {
        DestroyListMenu(menu->listMenu[REGULATION_MENU_CONFIRM], NULL, NULL);
        sub_0200E5D4(&menu->windows[REGULATION_MENU_WINDOW_CONFIRM], TRUE);
        ScheduleBgTilemapBufferTransfer(menu->windows[REGULATION_MENU_WINDOW_CONFIRM].bgConfig, menu->windows[REGULATION_MENU_WINDOW_CONFIRM].bgId);
        RemoveWindow(&menu->windows[REGULATION_MENU_WINDOW_CONFIRM]);
        ListMenuItems_Delete(menu->items[REGULATION_MENU_CONFIRM]);
        menu->listMenu[REGULATION_MENU_CONFIRM] = NULL;
    }
    return input;
}

#define RULES_COUNT 9

static u8 sLinkBattleRules[RULES_COUNT] = {
    LINKBATTLERULE_PARTY_COUNT,
    LINKBATTLERULE_MAX_LEVEL,
    LINKBATTLERULE_MAX_TOTAL_LEVEL,
    LINKBATTLERULE_HEIGHT_LIMIT,
    LINKBATTLERULE_WEIGHT_LIMIT,
    LINKBATTLERULE_EVOLVED_POKEMON,
    LINKBATTLERULE_UBERS_CLAUSE,
    LINKBATTLERULE_SPECIES_DUPE_CLAUSE,
    LINKBATTLERULE_ITEM_DUPE_CLAUSE,
};

static u8 sLinkBattleRuleValueMessages[RULES_COUNT] = {
    CommunicationClub_Text_ValueNoOfPokemon,      // {STRVAR_1 50, 0, 0}
    CommunicationClub_Text_ValueMaxLevel,         // Max. {STRVAR_1 52, 0, 0}
    CommunicationClub_Text_ValueMaxTotalLevels,   // Max. {STRVAR_1 52, 0, 0}
    CommunicationClub_Text_ValueMaxHeight,        // Max. {STRVAR_1 50, 0, 0}’ {STRVAR_1 50, 1, 0}"
    CommunicationClub_Text_ValueMaxWeight,        // Max. {STRVAR_1 51, 0, 0} lbs.
    CommunicationClub_Text_ValuePokemonPermitted, // Permitted
    CommunicationClub_Text_ValuePokemonPermitted, // Permitted
    CommunicationClub_Text_ValuePokemonPermitted, // Permitted
    CommunicationClub_Text_ValueItemsPermitted,   // Permitted
};

static void BattleRegulationMenu_ShowRules(BattleRegulationMenu *menu) {
    MessageFormat *messageFormat = menu->messageFormat;
    int i, ruleValue, valueMessage;
    const int yOffset = 16;
    const int xOffset = 2;
    const int lineHeight = 15;
    const int xOffsetCupName = 55;
    const int xRightSide = (24 * 8) - 1;
    
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0182_bin, HEAP_ID_FIELD1);
    String *fmtString = String_New(180, HEAP_ID_FIELD1);
    String *destString = String_New(180, HEAP_ID_FIELD1);
    Window *window = &menu->windows[REGULATION_MENU_WINDOW_RULES];
    
    AddWindowParameterized(menu->fieldSystem->bgConfig, window, 3, 4, 2, 24, 19, 13, 1);
    DrawFrameAndWindow1(window, TRUE, 985, 11);
    FillWindowPixelBuffer(window, 15);
    
    BattleRegulationMenu_GetRegulationName(menu, menu->itemsAbove[REGULATION_MENU_REGULATIONS] - 1);
    
    ReadMsgDataIntoString(msgData, CommunicationClub_Text_Cup, fmtString); // {STRVAR_1 26, 0, 0} Cup
    StringExpandPlaceholders(messageFormat, destString, fmtString);
    AddTextPrinterParameterized(window, 0, destString, xOffset + xOffsetCupName, 0, TEXT_SPEED_NOTRANSFER, NULL);

    for (i = 0; i < RULES_COUNT; i++) {
        ReadMsgDataIntoString(msgData, i + CommunicationClub_Text_RuleNoOfPokemon, fmtString); // Prints rule names.
        AddTextPrinterParameterized(window, 0, fmtString, xOffset, yOffset + lineHeight * i, TEXT_SPEED_NOTRANSFER, NULL);
    };

    for (i = 0; i < RULES_COUNT; i++) {
        ruleValue = LinkBattleRuleset_GetRuleValue(&menu->fieldSystem->linkBattleRuleset->rules[0], (LinkBattleRule)sLinkBattleRules[i]);
        valueMessage = sLinkBattleRuleValueMessages[i];
        
        switch (sLinkBattleRules[i]) {
        case LINKBATTLERULE_PARTY_COUNT:
            BufferIntegerAsString(messageFormat, 0, ruleValue, 1, PRINTING_MODE_RIGHT_ALIGN, TRUE);
            break;
        case LINKBATTLERULE_MAX_LEVEL:
            BufferIntegerAsString(messageFormat, 0, ruleValue, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
            break;
        case LINKBATTLERULE_MAX_TOTAL_LEVEL:
            if (ruleValue == 0) {
                valueMessage = CommunicationClub_Text_NoRestrictions; // NO RESTRICTIONS
            } else {
                BufferIntegerAsString(messageFormat, 0, ruleValue, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
            }
            break;
        case LINKBATTLERULE_HEIGHT_LIMIT:
            ruleValue = (ruleValue >= 0) ? (((ruleValue * 10 * 1000) / 254 + 5) / 10) : -(((-ruleValue * 10 * 1000) / 254 + 5) / 10);

            BufferIntegerAsString(messageFormat, 0, abs(ruleValue / 12), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
            BufferIntegerAsString(messageFormat, 1, abs(ruleValue % 12), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
            
            if (ruleValue == 0) {
                valueMessage = CommunicationClub_Text_NoRestrictions; // NO RESTRICTIONS
            } else if (ruleValue > 0) {
                valueMessage++;
            }
            break;
        case LINKBATTLERULE_WEIGHT_LIMIT:
            ruleValue = (ruleValue >= 0) ? (((ruleValue * 220462) + 50000) / 100000) : -(((-ruleValue * 220462) + 50000) / 100000);
            BufferIntegerAsString(messageFormat, 0, abs(ruleValue), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
            if (ruleValue == 0) {
                valueMessage = CommunicationClub_Text_NoRestrictions; // NO RESTRICTIONS
            } else if (ruleValue > 0) {
                valueMessage++;
            }
            break;
        case LINKBATTLERULE_UBERS_CLAUSE:
            if (LinkBattleRuleset_GetRuleValue(&menu->fieldSystem->linkBattleRuleset->rules[0], LINKBATTLERULE_SOUL_DEW_CLAUSE) == FLAG_RULESET_BAN_SOUL_DEW) {
                valueMessage = CommunicationClub_Text_Limit2; // Limit 2
            } else if (ruleValue == 0) {
                valueMessage++;
            }
            break;
        case LINKBATTLERULE_EVOLVED_POKEMON:
        case LINKBATTLERULE_ITEM_DUPE_CLAUSE:
        case LINKBATTLERULE_SPECIES_DUPE_CLAUSE:
            if (ruleValue == 0) {
                valueMessage++;
            }
            break;
        }
        
        ReadMsgDataIntoString(msgData, valueMessage, fmtString);
        StringExpandPlaceholders(messageFormat, destString, fmtString);

        int valueWidth = FontID_String_GetWidth(0, destString, 0);
        int valueXOffset = xRightSide - valueWidth;
        
        AddTextPrinterParameterized(window, 0, destString, valueXOffset, yOffset + lineHeight * i, 0xFF, NULL);
    }
    String_Delete(fmtString);
    String_Delete(destString);
    DestroyMsgData(msgData);
    CopyWindowToVram(window);
}

static void BattleRegulationMenu_RemoveRulesWindow(BattleRegulationMenu *menu) {
    sub_0200E5D4(&menu->windows[REGULATION_MENU_WINDOW_RULES], TRUE);
    ScheduleBgTilemapBufferTransfer(menu->windows[REGULATION_MENU_WINDOW_RULES].bgConfig, menu->windows[REGULATION_MENU_WINDOW_RULES].bgId);
    RemoveWindow(&menu->windows[REGULATION_MENU_WINDOW_RULES]);
}

static BOOL BattleRegulationMenu_HandleValidationResult(BattleRegulationMenu *menu) {
    int result = sub_02074CD0(&menu->fieldSystem->linkBattleRuleset->rules[0], SaveArray_Party_Get(menu->fieldSystem->saveData), menu->pokedexData);
    switch (result) {
    case BATTLE_REGULATION_VALIDATION_RESULT_SUCCESS:
        return TRUE;
    case BATTLE_REGULATION_VALIDATION_RESULT_INVALID_TEAM_SIZE:
        PlaySE(SEQ_SE_DP_BOX03);
        BattleRegulationMenu_GetRegulationName(menu, menu->itemsAbove[REGULATION_MENU_REGULATIONS] - 1);
        BufferIntegerAsString(menu->messageFormat, 1, LinkBattleRuleset_GetRuleValue(&menu->fieldSystem->linkBattleRuleset->rules[0], LINKBATTLERULE_PARTY_COUNT), 1, PRINTING_MODE_RIGHT_ALIGN, TRUE);
        BattleRegulationMenu_PrintMessage(menu, msg_0046_NeedXPokemonForCup); // You need at least {STRVAR_1 50, 1, 0} Pokémon\nthat qualify under the\f{STRVAR_1 26, 0, 0} Cup rules.
        break;
    default:
    case BATTLE_REGULATION_VALIDATION_RESULT_TOTAL_LEVEL_EXCEEDED:
        PlaySE(SEQ_SE_DP_BOX03);
        BattleRegulationMenu_GetRegulationName(menu, menu->itemsAbove[REGULATION_MENU_REGULATIONS] - 1);
        BufferIntegerAsString(menu->messageFormat, 1, LinkBattleRuleset_GetRuleValue(&menu->fieldSystem->linkBattleRuleset->rules[0], LINKBATTLERULE_MAX_TOTAL_LEVEL), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
        BattleRegulationMenu_PrintMessage(menu, msg_0046_CantFormTeamWithLevelLimit); // It’s impossible to form a team of\nPokémon that qualify under the\f{STRVAR_1 26, 0, 0} Cup rules with a\ftotal level limit of {STRVAR_1 52, 1, 0}.
        break;
    }
    return FALSE;
}

enum BattleRegulationMenuState {
    STATE_REGULATION_MENU_PRINT_WHICH_RULESET = 0,
    STATE_REGULATION_MENU_SHOW_LIST_MENU_REGULATIONS,
    STATE_REGULATION_MENU_HANDLE_INPUT_REGULATIONS,
    STATE_REGULATION_MENU_SHOW_LIST_MENU_CONFIRM,
    STATE_REGULATION_MENU_HANDLE_INPUT_CONFIRM,
    STATE_REGULATION_MENU_CHECK_VALID_TEAM, // 5
    STATE_REGULATION_MENU_WAIT_MESSAGE_INVALID_TEAM,
    STATE_REGULATION_MENU_PRINT_RULES,
    STATE_REGULATION_MENU_RESHOW_MENU_AFTER_RULES,
    STATE_REGULATION_MENU_WAIT_RESHOW_CONFIRM_MENU,
    STATE_REGULATION_MENU_UNUSED, // 10
    STATE_REGULATION_MENU_EXIT,
};

static BOOL Task_BattleRegulationMenu(TaskManager *taskManager) {
    FieldSystem *fieldSystem = TaskManager_GetFieldSystem(taskManager);
    BattleRegulationMenu *menu = TaskManager_GetEnvironment(taskManager);
    int input;
    switch (menu->state) {
    case STATE_REGULATION_MENU_PRINT_WHICH_RULESET:
        BattleRegulationMenu_PrintMessage(menu, msg_0046_WhichSetOfRules); // Which set of rules would you like\nto use? {YESNO 0}
        menu->state++;
        break;
    case STATE_REGULATION_MENU_SHOW_LIST_MENU_REGULATIONS:
        if (IsPrintFinished(menu->printerID)) {
            BattleRegulationMenu_ShowListMenuRegulations(menu);
            menu->state++;
        }
        break;
    case STATE_REGULATION_MENU_HANDLE_INPUT_REGULATIONS:
        input = BattleRegulationMenu_ProcessListMenuInputRegulations(menu);
        if (input == -1) {
            *menu->result = 2;
            menu->state = STATE_REGULATION_MENU_EXIT;
        } else if (input == 2) {
            *menu->result = 3;
            menu->state = STATE_REGULATION_MENU_EXIT;
        } else if (input == 1) {
            menu->state = STATE_REGULATION_MENU_SHOW_LIST_MENU_CONFIRM;
        }
        break;
    case STATE_REGULATION_MENU_SHOW_LIST_MENU_CONFIRM:
        BattleRegulationMenu_ShowListMenuConfirm(menu);
        menu->state++;
        break;
    case STATE_REGULATION_MENU_HANDLE_INPUT_CONFIRM:
        input = BattleRegulationMenu_ProcessListMenuInputConfirm(menu);
        if (input == -1) {
            menu->state = STATE_REGULATION_MENU_HANDLE_INPUT_REGULATIONS;
        } else if (input == 1) {
            menu->state = STATE_REGULATION_MENU_CHECK_VALID_TEAM;
        } else if (input == 2) {
            menu->state = STATE_REGULATION_MENU_PRINT_RULES;
        }
        break;
    case STATE_REGULATION_MENU_CHECK_VALID_TEAM:
        if (BattleRegulationMenu_HandleValidationResult(menu)) {
            *menu->result = 1;
            menu->state = STATE_REGULATION_MENU_EXIT;
        } else {
            menu->state = STATE_REGULATION_MENU_WAIT_MESSAGE_INVALID_TEAM;
        }
        break;
    case STATE_REGULATION_MENU_WAIT_MESSAGE_INVALID_TEAM:
        if (IsPrintFinished(menu->printerID) && (PAD_BUTTON_A | PAD_BUTTON_B) & gSystem.newKeys) {
            menu->state = STATE_REGULATION_MENU_PRINT_WHICH_RULESET;
        }
        break;
    case STATE_REGULATION_MENU_PRINT_RULES:
        BattleRegulationMenu_RemoveMsgBox(menu, TRUE);
        BattleRegulationMenu_ShowRules(menu);
        menu->state++;
        break;
    case STATE_REGULATION_MENU_RESHOW_MENU_AFTER_RULES:
        if ((PAD_BUTTON_A | PAD_BUTTON_B) & gSystem.newKeys) {
            BattleRegulationMenu_RemoveRulesWindow(menu);
            BattleRegulationMenu_PrintMessage(menu, msg_0046_WhichSetOfRules); // Which set of rules would you like\nto use? {YESNO 0}
            BattleRegulationMenu_ShowListMenuRegulations(menu);
            menu->state = STATE_REGULATION_MENU_WAIT_RESHOW_CONFIRM_MENU;
        }
        break;
    case STATE_REGULATION_MENU_WAIT_RESHOW_CONFIRM_MENU:
        if (IsPrintFinished(menu->printerID)) {
            menu->state = STATE_REGULATION_MENU_SHOW_LIST_MENU_CONFIRM;
        }
        break;
    case STATE_REGULATION_MENU_UNUSED:
        break;
    case STATE_REGULATION_MENU_EXIT:
        BattleRegulationMenu_RemoveListMenuRegulations(menu);
        BattleRegulationMenu_RemoveMsgBox(menu, FALSE);
        MessageFormat_Delete(menu->messageFormat);
        DestroyMsgData(menu->msgData);
        String_Delete(menu->strings[REGULATION_MENU_STRING_FMT]);
        String_Delete(menu->strings[REGULATION_MENU_STRING_DESTINATION]);
        String_Delete(menu->strings[REGULATION_MENU_STRING_REGULATION_NAME]);
        String_Delete(menu->strings[REGULATION_MENU_STRING_CUP_NAME]);
        PokedexData_UnloadAndDelete(menu->pokedexData);
        Heap_Free(menu);
        return TRUE;
    default:
        return TRUE;
    }
    return FALSE;
}

static BattleRegulationMenu *BattleRegulationMenu_New(FieldSystem *fieldSystem) {
    BattleRegulationMenu *menu = Heap_AllocAtEnd(HEAP_ID_FIELD2, sizeof(BattleRegulationMenu));
    MI_CpuFill8(menu, 0, sizeof(BattleRegulationMenu));
    menu->state = STATE_REGULATION_MENU_PRINT_WHICH_RULESET;
    menu->fieldSystem = fieldSystem;
    fieldSystem->linkBattleRuleset = NULL;
    menu->messageFormat = MessageFormat_New(HEAP_ID_FIELD1);
    menu->msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0046_bin, HEAP_ID_FIELD1); // TEXT_BANK_POKEMON_CENTER_2F_COMMON
    menu->strings[REGULATION_MENU_STRING_FMT] = String_New(180, HEAP_ID_FIELD1);
    menu->strings[REGULATION_MENU_STRING_DESTINATION] = String_New(180, HEAP_ID_FIELD1);
    menu->strings[REGULATION_MENU_STRING_REGULATION_NAME] = String_New(180, HEAP_ID_FIELD1);
    menu->strings[REGULATION_MENU_STRING_CUP_NAME] = String_New(180, HEAP_ID_FIELD1);
    menu->pokedexData = PokedexData_CreateAndLoad(HEAP_ID_FIELD2);
    return menu;
}

void StartTask_BattleRegulationMenu(TaskManager *taskManager, u16 *result) {
    BattleRegulationMenu *menu = BattleRegulationMenu_New(TaskManager_GetFieldSystem(taskManager));
    menu->result = result;
    TaskManager_Call(taskManager, Task_BattleRegulationMenu, menu);
}

void ov03_022566D0(FieldSystem *fieldSystem, MessageFormat *messageFormat, u32 ruleset) {
    String *string = String_New(180, HEAP_ID_FIELD1);
    sub_0202921C(fieldSystem->saveData, ruleset, string, HEAP_ID_FIELD1);
    BufferString(messageFormat, 0, string, 0, 1, 2);
    String_Delete(string);
}

void ov03_02256710(FieldSystem *fieldSystem, u16 arg1) {
    if (arg1 == 12 || arg1 == 6) {
        &fieldSystem->linkBattleRuleset->rules[0] = NULL;
    } else {
        &fieldSystem->linkBattleRuleset->rules[0] = sub_020291E8(fieldSystem->saveData, arg1);
    }
}

void ov03_02256730(FieldSystem *fieldSystem, Window *window, u32 ruleset) {
    int ruleValue, valueMessage;
    const int xOffset = 2;
    const int xOffsetCupName = 55;
    const int yOffset = 16;
    const int lineHeight = 15;
    const int xRightSide = (24 * 8) - 1;

    AddWindowParameterized(fieldSystem->bgConfig, window, 3, 4, 2, 24, 19, 13, 1);
    LoadUserFrameGfx1(fieldSystem->bgConfig, GF_BG_LYR_MAIN_3, 985, 11, 0, HEAP_ID_FIELD1);
    DrawFrameAndWindow1(window, TRUE, 985, 11);
    FillWindowPixelBuffer(window, 15);
    MsgData *msgData = NewMsgDataFromNarc(MSGDATA_LOAD_DIRECT, NARC_msgdata_msg, NARC_msg_msg_0182_bin, HEAP_ID_FIELD1);
    MessageFormat *messageFormat = MessageFormat_New(HEAP_ID_FIELD1);
    String *fmtString = String_New(180, HEAP_ID_FIELD1);
    String *destString = String_New(180, HEAP_ID_FIELD1);
    ov03_022566D0(fieldSystem, messageFormat, ruleset);
    ReadMsgDataIntoString(msgData, CommunicationClub_Text_Cup, fmtString); // {STRVAR_1 26, 0, 0} Cup
    StringExpandPlaceholders(messageFormat, destString, fmtString);
    AddTextPrinterParameterized(window, 0, destString, xOffset + xOffsetCupName, 0, TEXT_SPEED_NOTRANSFER, 0);

    for (int i = 0; i < RULES_COUNT; i++) {
        ReadMsgDataIntoString(msgData, i + CommunicationClub_Text_RuleNoOfPokemon, fmtString); // // Prints rule names.
        AddTextPrinterParameterized(window, 0, fmtString, xOffset, yOffset + lineHeight * i, TEXT_SPEED_NOTRANSFER, NULL);
        ruleValue = LinkBattleRuleset_GetRuleValue(&fieldSystem->linkBattleRuleset->rules[0], (LinkBattleRule)sLinkBattleRules[i]);
        valueMessage = sLinkBattleRuleValueMessages[i];
        switch (sLinkBattleRules[i]) {
        case LINKBATTLERULE_PARTY_COUNT:
            BufferIntegerAsString(messageFormat, 0, ruleValue, 1, PRINTING_MODE_RIGHT_ALIGN, TRUE);
            break;
        case LINKBATTLERULE_MAX_LEVEL:
            BufferIntegerAsString(messageFormat, 0, ruleValue, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
            break;
        case LINKBATTLERULE_MAX_TOTAL_LEVEL:
            if (ruleValue == 0) {
                valueMessage = CommunicationClub_Text_NoRestrictions; // NO RESTRICTIONS
            } else {
                BufferIntegerAsString(messageFormat, 0, ruleValue, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
            }
            break;
        case LINKBATTLERULE_HEIGHT_LIMIT:
            ruleValue = (ruleValue >= 0) ? (((ruleValue * 10 * 1000) / 254 + 5) / 10) : -(((-ruleValue * 10 * 1000) / 254 + 5) / 10);
            BufferIntegerAsString(messageFormat, 0, abs(ruleValue / 12), 2, PRINTING_MODE_LEFT_ALIGN, TRUE);
            BufferIntegerAsString(messageFormat, 1, abs(ruleValue % 12), 2, PRINTING_MODE_LEADING_ZEROS, TRUE);
            if (ruleValue == 0) {
                valueMessage = CommunicationClub_Text_NoRestrictions; // NO RESTRICTIONS
            } else if (ruleValue > 0) {
                valueMessage++;
            }
            break;
        case LINKBATTLERULE_WEIGHT_LIMIT:
            ruleValue = (ruleValue >= 0) ? (((ruleValue * 220462) + 50000) / 100000) : -(((-ruleValue * 220462) + 50000) / 100000);
            BufferIntegerAsString(messageFormat, 0, abs(ruleValue), 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
            if (ruleValue == 0) {
                valueMessage = CommunicationClub_Text_NoRestrictions; // NO RESTRICTIONS
            } else if (ruleValue > 0) {
                valueMessage++;
            }
            break;
        case LINKBATTLERULE_UBERS_CLAUSE:
            if (LinkBattleRuleset_GetRuleValue(&fieldSystem->linkBattleRuleset->rules[0], LINKBATTLERULE_SOUL_DEW_CLAUSE) == FLAG_RULESET_BAN_SOUL_DEW) {
                valueMessage = CommunicationClub_Text_Limit2; // Limit 2
            } else if (ruleValue == 0) {
                valueMessage++;
            }
            break;
        case LINKBATTLERULE_EVOLVED_POKEMON:
        case LINKBATTLERULE_ITEM_DUPE_CLAUSE:
        case LINKBATTLERULE_SPECIES_DUPE_CLAUSE:
            if (ruleValue == 0) {
                valueMessage++;
            }
            break;
        }
        ReadMsgDataIntoString(msgData, valueMessage, fmtString);
        StringExpandPlaceholders(messageFormat, destString, fmtString);
        
        int valueWidth = FontID_String_GetWidth(0, destString, 0);
        int valueXOffset = xRightSide - valueWidth;
        AddTextPrinterParameterized(window, 0, destString, valueXOffset, yOffset + lineHeight * i, TEXT_SPEED_NOTRANSFER, NULL);
    }
    String_Delete(destString);
    String_Delete(fmtString);
    MessageFormat_Delete(messageFormat);
    DestroyMsgData(msgData);
    CopyWindowToVram(window);
}

u16 ov03_02256A2C(FieldSystem *fieldSystem, MessageFormat *messageFormat, u32 ruleset) {
    Party *party = SaveArray_Party_Get(fieldSystem->saveData);
    PokedexData *pokedexData = PokedexData_CreateAndLoad(HEAP_ID_FIELD2);
    u32 unkValue;
    if (ruleset == 10) {
        int partySize = Party_GetCount(party);
        int validMons = partySize;
        for (int index = 0; index < partySize; index++) {
            if (GetMonData(Party_GetMonByIndex(party, index), MON_DATA_IS_EGG, NULL)) {
                validMons--;
            }
        }
        unkValue = validMons < 2 ? 7 : 0;
    } else {
        unkValue = sub_02074CD0(&fieldSystem->linkBattleRuleset->rules[0], party, pokedexData);
    }
    PokedexData_UnloadAndDelete(pokedexData);
    int ruleValue;
    switch (unkValue)
    {
        case 0:
            return 0;
        case 4:
            ov03_022566D0(fieldSystem, messageFormat, ruleset);
            ruleValue = LinkBattleRuleset_GetRuleValue(&fieldSystem->linkBattleRuleset->rules[0], LINKBATTLERULE_PARTY_COUNT);
            BufferIntegerAsString(messageFormat, 1, ruleValue, 1, PRINTING_MODE_RIGHT_ALIGN, TRUE);
            return 1;
        case 7:
            ov03_022566D0(fieldSystem, messageFormat, ruleset);
            BufferIntegerAsString(messageFormat, 1, 2, 1, PRINTING_MODE_RIGHT_ALIGN, TRUE);
            return 1;
        case 1:
        case 2:
        case 3:
        case 5:
        case 6:
        default:
            ov03_022566D0(fieldSystem, messageFormat, ruleset);
            ruleValue = LinkBattleRuleset_GetRuleValue(&fieldSystem->linkBattleRuleset->rules[0], LINKBATTLERULE_MAX_TOTAL_LEVEL);
            BufferIntegerAsString(messageFormat, 1, ruleValue, 3, PRINTING_MODE_LEFT_ALIGN, TRUE);
            return 2;
    }
}

u32 ov03_02256B40(int arg0) {
    u32 unkValue = arg0;
    switch (unkValue) {
        case 6:
            return 0xFF;
        case 7:
            return 0;
        case 8:
            return 3;
        case 9:
            return 4;
        case 10:
        case 11:
            return -1;
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        default:
            break;
    }
    if (unkValue >= 9) {
        unkValue = 0xFF;
    }
    return unkValue;
}
