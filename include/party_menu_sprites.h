#ifndef POKEHEARTGOLD_PARTY_MENU_SPRITES_H
#define POKEHEARTGOLD_PARTY_MENU_SPRITES_H

#include "party_menu.h"

void sub_0207EB24(PartyMenu *partyMenu);
void sub_0207EBE4(PartyMenu *partyMenu, u8 partySlot, u16 x, u16 y, NARC *narc);
void sub_0207ECE0(PartyMenu *partyMenu, u8 partySlot);
void sub_0207EDD4(PartyMenu *partyMenu);
void sub_0207EF5C(PartyMenu *partyMenu, u8 partySlot, u16 x, u16 y);
void PartyMenu_RemoveSpriteRenderer(PartyMenu *partyMenu);
void PartyMenu_DrawMonStatusIcon(PartyMenu *partyMenu, u8 partySlot, u8 status);
void PartyMenu_DrawMonHeldItemIcon(PartyMenu *partyMenu, u8 partySlot, u16 heldItem);
void PartyMenu_SetMonHeldMailIcon(PartyMenu *partyMenu, u8 partySlot);
void PartyMenu_SetMonHeldItemIconCoords(PartyMenu *partyMenu, u8 partySlot, s16 x, s16 y);
void PartyMenu_RefreshMonCapsuleIconSpritePos(PartyMenu *partyMenu, u8 partySlot);
void PartyMenu_DrawMonCapsuleIcon(PartyMenu *partyMenu, u8 partySlot);
void sub_0207F178(PartyMenu *partyMenu);
void sub_0207F240(PartyMenu *partyMenu, u8 partySlot, int selected);
void sub_0207F2A8(PartyMenu *partyMenu, s16 x, s16 y);
void sub_0207F2F8(PartyMenu *partyMenu);
void PartyMenu_SetTopScreenSelectionPanelYDisplacement(PartyMenu *partyMenu, int dy);
void PartyMenu_SetTopScreenMonIconSprite(PartyMenu *partyMenu, u8 selection);

#endif // POKEHEARTGOLD_PARTY_MENU_SPRITES_H
