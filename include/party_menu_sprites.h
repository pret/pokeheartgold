#ifndef POKEHEARTGOLD_PARTY_MENU_SPRITES_H
#define POKEHEARTGOLD_PARTY_MENU_SPRITES_H

#include "party_menu.h"

void sub_0207EB24(PartyMenuStruct *partyMenu);
void sub_0207EBE4(PartyMenuStruct *partyMenu, u8 partySlot, u16 x, u16 y, NARC *narc);
void sub_0207ECE0(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207EDD4(PartyMenuStruct *partyMenu);
void sub_0207EF5C(PartyMenuStruct *partyMenu, u8 partySlot, u16 x, u16 y);
void PartyMenu_RemoveSpriteRenderer(PartyMenuStruct *partyMenu);
void PartyMenu_DrawMonStatusIcon(PartyMenuStruct *partyMenu, u8 partySlot, u8 status);
void PartyMenu_DrawMonHeldItemIcon(PartyMenuStruct *partyMenu, u8 partySlot, u16 heldItem);
void PartyMenu_SetMonHeldMailIcon(PartyMenuStruct *partyMenu, u8 partySlot);
void PartyMenu_SetMonHeldItemIconCoords(PartyMenuStruct *partyMenu, u8 partySlot, s16 x, s16 y);
void PartyMenu_RefreshMonCapsuleIconSpritePos(PartyMenuStruct *partyMenu, u8 partySlot);
void PartyMenu_DrawMonCapsuleIcon(PartyMenuStruct *partyMenu, u8 partySlot);
void sub_0207F178(PartyMenuStruct *partyMenu);
void sub_0207F240(PartyMenuStruct *partyMenu, u8 partySlot, int selected);
void sub_0207F2A8(PartyMenuStruct *partyMenu, s16 x, s16 y);
void sub_0207F2F8(PartyMenuStruct *partyMenu);
void PartyMenu_SetTopScreenSelectionPanelYDisplacement(PartyMenuStruct *partyMenu, int dy);
void PartyMenu_SetTopScreenMonIconSprite(PartyMenuStruct *partyMenu, u8 selection);

#endif // POKEHEARTGOLD_PARTY_MENU_SPRITES_H
