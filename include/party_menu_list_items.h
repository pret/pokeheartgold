#ifndef GUARD_POKEHEARTGOLD_UNK_0207F42C_H
#define GUARD_POKEHEARTGOLD_UNK_0207F42C_H

#include "party_menu.h"

u32 GetPartyMenuContextMenuActionFunc(int index);
int PartyMenu_Subtask_PrintTakeItemMessage(PartyMenu *partyMenu);
int PartyMenu_Subtask_PrintTakeGriseousOrbMessage(PartyMenu *partyMenu);
int PartyMenu_Subtask_WaitTakeGriseousOrbAnim(PartyMenu *partyMenu);
int PartyMenu_Subtask_AfterTakeMail(PartyMenu *partyMenu);
int PartyMenu_ConfirmRemoveCapsuleYes(PartyMenu *partyMenu);
int PartyMenu_ConfirmRemoveCapsuleNo(PartyMenu *partyMenu);
void sub_0207FBC8(PartyMenu *partyMenu);
void sub_0207FC1C(PartyMenu *partyMenu);
BOOL sub_0207FD6C(PartyMenu *partyMenu);
int PartyMenu_Subtask_SelectMonsErrorMsgClose(PartyMenu *partyMenu);
int PartyMenu_HandleSetMonCapsule(PartyMenu *partyMenu);
int sub_02080B74(PartyMenu *partyMenu);

#endif // GUARD_POKEHEARTGOLD_UNK_0207F42C_H
