#ifndef POKEHEARTGOLD_PARTY_CONTEXT_MENU_H
#define POKEHEARTGOLD_PARTY_CONTEXT_MENU_H

#include "party_menu.h"
#include "list_menu.h"

void sub_0207CB7C(void);
void sub_0207CB90(void);
void sub_0207CBD0(PartyMenuStruct *partyMenu, int a1, int a2, BOOL a3);
BOOL sub_0207CC24(PartyMenuStruct *partyMenu);
void sub_0207CDCC(PartyMenuStruct *partyMenu);
void sub_0207CF68(PartyMenuStruct *partyMenu);
void PartyMenu_SetContextMenuStaticStrings(PartyMenuStruct *partyMenu);
void sub_0207D0A0(PartyMenuStruct *partyMenu, u16 move, u8 index);
void sub_0207D0E4(PartyMenuStruct *partyMenu, u8 *items, u8 numItems);
void sub_0207D1C8(PartyMenuStruct *partyMenu);
void PartyMenu_BufferMonNickname(PartyMenuStruct *partyMenu, Pokemon *mon, u32 partySlot);
void PartyMenu_PrintMonLevelOnWindow(PartyMenuStruct *partyMenu, u8 partySlot);
void PartyMenu_PrintMonCurHpOnWindow(PartyMenuStruct *partyMenu, u8 partySlot);
void PartyMenu_ClearMonHpTextWindow(PartyMenuStruct *partyMenu, u8 partySlot);
void PartyMenu_DrawMonHpBarOnWindow(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207D5DC(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207D6A0(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207D6D8(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207D710(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207D7A8(PartyMenuStruct *partyMenu, u8 partySlot);
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
void sub_0207E54C(PartyMenuStruct *partyMenu, int a1, int a2, int a3);
UnkStruct_0207E590 *sub_0207E590(PartyMenuStruct *partyMenu, const UnkTemplate_0207E590 *template, int a2, HeapID heapId, int a4);
void sub_0207E618(PartyMenuStruct *partyMenu, UnkStruct_0207E590 *a1);
u32 sub_0207E778(PartyMenuStruct *partyMenu, UnkStruct_0207E590 *a1);
u32 sub_0207E93C(PartyMenuStruct *partyMenu, UnkStruct_0207E590 *a1);

#endif //POKEHEARTGOLD_PARTY_CONTEXT_MENU_H
