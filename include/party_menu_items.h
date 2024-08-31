#ifndef GUARD_POKEHEARTGOLD_PARTY_MENU_MOVES_H
#define GUARD_POKEHEARTGOLD_PARTY_MENU_MOVES_H

#include "party_menu.h"

#define LEARN_MOVE_CHECK_KNOWN    0xFD
#define LEARN_MOVE_CHECK_FULL     0xFE
#define LEARN_MOVE_CHECK_INCOMPAT 0xFF

void PartyMenu_SetItemUseFuncFromBagSelection(PartyMenu *partyMenu);
int PartyMenu_ItemUseFunc_WaitTextPrinterThenExit(PartyMenu *partyMenu);
BOOL ItemId_IsReviveAll(u16 itemId);
int PartyMenu_Subtask_SacredAsh(PartyMenu *partyMenu);
int PartyMenu_ItemUseFunc_LevelUpDoLearnMove(PartyMenu *partyMenu);
u8 PartyMenu_CheckCanLearnTMHMMove(PartyMenu *partyMenu, Pokemon *mon);
int PartyMenu_HandleUseTMHMonMon(PartyMenu *partyMenu);
int PartyMenu_ItemUseFunc_TMHMDoLearnMove(PartyMenu *partyMenu);
int PartyMenu_Subtask_TMHMLearnMove(PartyMenu *partyMenu);
int PartyMenu_Subtask_SelectMove(PartyMenu *partyMenu);
void PartyMenu_SelectMoveForPpRestoreOrPpUp(PartyMenu *partyMenu, BOOL isPpRestore);
void PartyMenu_HandleAttachMailFromMailbox(PartyMenu *partyMenu);

#endif // GUARD_POKEHEARTGOLD_PARTY_MENU_MOVES_H
