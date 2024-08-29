#ifndef POKEHEARTGOLD_PARTY_CONTEXT_MENU_H
#define POKEHEARTGOLD_PARTY_CONTEXT_MENU_H

#include "list_menu.h"
#include "party_menu.h"

void PartyMenu_SetBlendBrightness_ForYesNo(void);
void PartyMenu_DisableMainScreenBlend_AfterYesNo(void);
void PartyMenu_StartContextMenuButtonAnim(PartyMenu *partyMenu, int spriteId, int followUpState, BOOL restartAnim);
BOOL PartyMenu_AnimateContextMenuButtonPress(PartyMenu *partyMenu);
void PartyMenu_AddAllWindows(PartyMenu *partyMenu);
void PartyMenu_RemoveAllWindows(PartyMenu *partyMenu);
void PartyMenu_SetContextMenuStaticStrings(PartyMenu *partyMenu);
void PartyMenu_ContextMenuAddFieldMove(PartyMenu *partyMenu, u16 move, u8 index);
void PartyMenu_OpenContextMenu(PartyMenu *partyMenu, u8 *items, u8 numItems);
void sub_0207D1C8(PartyMenu *partyMenu);
void PartyMenu_BufferMonNickname(PartyMenu *partyMenu, Pokemon *mon, u32 partySlot);
void PartyMenu_PrintMonLevelOnWindow(PartyMenu *partyMenu, u8 partySlot);
void PartyMenu_PrintMonCurHpOnWindow(PartyMenu *partyMenu, u8 partySlot);
void PartyMenu_ClearMonHpTextWindow(PartyMenu *partyMenu, u8 partySlot);
void PartyMenu_DrawMonHpBarOnWindow(PartyMenu *partyMenu, u8 partySlot);
void sub_0207D5DC(PartyMenu *partyMenu, u8 partySlot);
void PartyMenu_CommitPartyMonPanelWindowsToVram_InVBlank(PartyMenu *partyMenu, u8 partySlot);
void PartyMenu_CommitPartyMonPanelWindowsToVram_NotInVBlank(PartyMenu *partyMenu, u8 partySlot);
void sub_0207D710(PartyMenu *partyMenu, u8 partySlot);
void PartyMenu_DrawPartyMonsList_UseTMHM(PartyMenu *partyMenu, u8 partySlot);
void PartyMenu_DrawPartyMonsList_SuperContestEntry(PartyMenu *partyMenu, u8 partySlot);
void PartyMenu_DrawPartyMonsList_FrontierFacilityEntry(PartyMenu *partyMenu, u8 partySlot);
void sub_0207D8EC(PartyMenu *partyMenu, u8 partySlot);
void sub_0207D998(PartyMenu *partyMenu, u8 a1);

// For these next three funcs, if msgId is -1, uses partyMenu->formattedStrBuf
void PartyMenu_PrintMessageOnWindow32(PartyMenu *partyMenu, int msgId, BOOL drawFrame);
void PartyMenu_PrintMessageOnWindow33(PartyMenu *partyMenu, int msgId, BOOL drawFrame);
void PartyMenu_PrintMessageOnWindow34(PartyMenu *partyMenu, int msgId, BOOL drawFrame);
void PartyMenu_PrintBufferedMessageOnWindow34(PartyMenu *partyMenu);
void PartyMenu_CreateYesNoPrompt(PartyMenu *partyMenu);
void PartyMenu_LevelUpPrintStatsChange(PartyMenu *partyMenu);
void sub_0207DF98(PartyMenu *partyMenu);
void sub_0207E04C(PartyMenu *partyMenu);
void sub_0207E068(PartyMenu *partyMenu);
void sub_0207E54C(PartyMenu *partyMenu, int numItems, int selection, int state);
PartyMenuContextMenuCursor *PartyMenu_CreateContextMenuCursor(PartyMenu *partyMenu, const PartyMenuContextMenu *template, int selection, HeapID heapId, int state);
void PartyMenu_CloseContextMenu(PartyMenu *partyMenu, PartyMenuContextMenuCursor *a1);
u32 PartyMenu_HandleInput_ContextMenu(PartyMenu *partyMenu, PartyMenuContextMenuCursor *a1);
u32 PartyMenu_HandleSubcontextMenuInput_TopLevel(PartyMenu *partyMenu, PartyMenuContextMenuCursor *a1);

#endif // POKEHEARTGOLD_PARTY_CONTEXT_MENU_H
