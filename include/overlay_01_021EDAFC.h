#ifndef POKEHEARTGOLD_OVERLAY_01_021EDAFC_H
#define POKEHEARTGOLD_OVERLAY_01_021EDAFC_H

#include "bg_window.h"
#include "field_system.h"

void ov01_021EEC68(Window *window);
void ov01_021EEC7C(FieldSystem *fieldSystem, Window *window, u8 type);
void MoneyBoxSys_Delete(Window *moneybox);
void MoneyBoxSys_Update(FieldSystem *fieldSystem, Window *moneybox);
Window *ov01_021EED60(FieldSystem *fieldSystem, u8 arg1, u8 arg2);
void ov01_021EEE30(Window *window);
void ov01_021EEE44(FieldSystem *fieldSystem, Window *window);

#endif // POKEHEARTGOLD_OVERLAY_01_021EDAFC_H
