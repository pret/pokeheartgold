#ifndef GUARD_POKEHEARTGOLD_UNK_0207F42C_H
#define GUARD_POKEHEARTGOLD_UNK_0207F42C_H

#include "party_menu.h"

u32 GetPartyMenuContextMenuActionFunc(int index);
int PartyMenu_Subtask_PrintTakeItemMessage(PartyMenuStruct *partyMenu);
int PartyMenu_Subtask_PrintTakeGriseousOrbMessage(PartyMenuStruct *partyMenu);
int PartyMenu_Subtask_WaitTakeGriseousOrbAnim(PartyMenuStruct *partyMenu);
int PartyMenu_Subtask_AfterTakeMail(PartyMenuStruct *partyMenu);
int PartyMenu_ConfirmRemoveCapsuleYes(PartyMenuStruct *partyMenu);
int PartyMenu_ConfirmRemoveCapsuleNo(PartyMenuStruct *partyMenu);
void sub_0207FBC8(PartyMenuStruct *partyMenu);
void sub_0207FC1C(PartyMenuStruct *partyMenu);
BOOL sub_0207FD6C(PartyMenuStruct *partyMenu);
int PartyMenu_Subtask_SelectMonsErrorMsgClose(PartyMenuStruct *partyMenu);
int PartyMenu_HandleSetMonCapsule(PartyMenuStruct *partyMenu);
int sub_02080B74(PartyMenuStruct *partyMenu);

#endif // GUARD_POKEHEARTGOLD_UNK_0207F42C_H
