#ifndef POKEHEARTGOLD_PARTY_CONTEXT_MENU_H
#define POKEHEARTGOLD_PARTY_CONTEXT_MENU_H

#include "party_menu.h"
#include "list_menu.h"

void PartyMenu_SetBlendBrightness_ForYesNo(void);
void PartyMenu_DisableMainScreenBlend_AfterYesNo(void);
void PartyMenu_StartContextMenuButtonAnim(PartyMenuStruct *partyMenu, int spriteId, int followUpState, BOOL restartAnim);
BOOL PartyMenu_AnimateContextMenuButtonPress(PartyMenuStruct *partyMenu);
void PartyMenu_AddAllWindows(PartyMenuStruct *partyMenu);
void PartyMenu_RemoveAllWindows(PartyMenuStruct *partyMenu);
void PartyMenu_SetContextMenuStaticStrings(PartyMenuStruct *partyMenu);
void PartyMenu_ContextMenuAddFieldMove(PartyMenuStruct *partyMenu, u16 move, u8 index);
void PartyMenu_OpenContextMenu(PartyMenuStruct *partyMenu, u8 *items, u8 numItems);
void sub_0207D1C8(PartyMenuStruct *partyMenu);
void PartyMenu_BufferMonNickname(PartyMenuStruct *partyMenu, Pokemon *mon, u32 partySlot);
void PartyMenu_PrintMonLevelOnWindow(PartyMenuStruct *partyMenu, u8 partySlot);
void PartyMenu_PrintMonCurHpOnWindow(PartyMenuStruct *partyMenu, u8 partySlot);
void PartyMenu_ClearMonHpTextWindow(PartyMenuStruct *partyMenu, u8 partySlot);
void PartyMenu_DrawMonHpBarOnWindow(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207D5DC(PartyMenuStruct *partyMenu, u8 partySlot);
void PartyMenu_CommitPartyMonPanelWindowsToVram_InVBlank(PartyMenuStruct *partyMenu, u8 partySlot);
void PartyMenu_CommitPartyMonPanelWindowsToVram_NotInVBlank(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207D710(PartyMenuStruct *partyMenu, u8 partySlot);
void PartyMenu_DrawPartyMonsList_UseTMHM(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207D840(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207D8A4(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207D8EC(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207D998(PartyMenuStruct *partyMenu, u8 a1);
void sub_0207DAC4(PartyMenuStruct *partyMenu, int msgId, BOOL drawFrame);
void sub_0207DAD8(PartyMenuStruct *partyMenu, int msgId, BOOL drawFrame);
void sub_0207DAEC(PartyMenuStruct *partyMenu, int msgId, BOOL drawFrame);
void sub_0207DB30(PartyMenuStruct *partyMenu);
void sub_0207DBCC(PartyMenuStruct *partyMenu);
void PartyMenu_LevelUpPrintStatsChange(PartyMenuStruct *partyMenu);
void sub_0207DF98(PartyMenuStruct *partyMenu);
void sub_0207E04C(PartyMenuStruct *partyMenu);
void sub_0207E068(PartyMenuStruct *partyMenu);
void sub_0207E54C(PartyMenuStruct *partyMenu, int numItems, int selection, int state);
PartyMenuContextMenuCursor *PartyMenu_CreateContextMenuCursor(PartyMenuStruct *partyMenu, const PartyMenuContextMenu *template, int selection, HeapID heapId, int state);
void PartyMenu_CloseContextMenu(PartyMenuStruct *partyMenu, PartyMenuContextMenuCursor *a1);
u32 PartyMenu_HandleInput_ContextMenu(PartyMenuStruct *partyMenu, PartyMenuContextMenuCursor *a1);
u32 PartyMenu_HandleInput_TopLevel(PartyMenuStruct *partyMenu, PartyMenuContextMenuCursor *a1);

#endif //POKEHEARTGOLD_PARTY_CONTEXT_MENU_H
