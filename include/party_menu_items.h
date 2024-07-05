#ifndef GUARD_POKEHEARTGOLD_PARTY_MENU_MOVES_H
#define GUARD_POKEHEARTGOLD_PARTY_MENU_MOVES_H

#include "party_menu.h"

#define LEARN_MOVE_CHECK_KNOWN         0xFD
#define LEARN_MOVE_CHECK_FULL          0xFE
#define LEARN_MOVE_CHECK_INCOMPAT      0xFF

void PartyMenu_SetItemUseFuncFromBagSelection(PartyMenuStruct *partyMenu);
int sub_02081378(PartyMenuStruct *partyMenu);
BOOL sub_020817C4(u16 itemId);
int PartyMenu_Subtask_SacredAsh(PartyMenuStruct *partyMenu);
int PartyMenu_ItemUseFunc_LevelUpDoLearnMove(PartyMenuStruct *partyMenu);
u8 PartyMenu_CheckCanLearnTMHMMove(PartyMenuStruct *partyMenu, Pokemon *mon);
int sub_02082134(PartyMenuStruct *partyMenu);
int sub_020822CC(PartyMenuStruct *partyMenu);
int sub_02082370(PartyMenuStruct *partyMenu);
int PartyMenu_Subtask_SelectMove(PartyMenuStruct *partyMenu);
void PartyMenu_SelectMoveForPpRestoreOrPpUp(PartyMenuStruct *partyMenu, BOOL isPpRestore);
void PartyMenu_HandleAttachMailFromMailbox(PartyMenuStruct *partyMenu);

#endif //GUARD_POKEHEARTGOLD_PARTY_MENU_MOVES_H
