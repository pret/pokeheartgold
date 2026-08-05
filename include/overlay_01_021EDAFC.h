#ifndef POKEHEARTGOLD_OVERLAY_01_021EDAFC_H
#define POKEHEARTGOLD_OVERLAY_01_021EDAFC_H

#include "bg_window.h"
#include "field_system.h"

typedef struct FieldMenuManager FieldMenuManager;

typedef BOOL (*UnkCallback_021F6B34)(FieldMenuManager *menu, int idx);

FieldMenuManager *FieldMenuManager_New(FieldSystem *fieldSystem, u8 anchorX, u8 anchorY, u8 initCursorPos, u8 cancellable, u16 *ret_p, MessageFormat *msgFmt, Window *window, MsgData *msgData);
void FieldMenuManager_AddMenuEntry(FieldMenuManager *menu, u32 msgID, u32 value);
void FieldMenuManager_ShowSingleColumnMenu(FieldMenuManager *menu);
void ov01_021EDF00(FieldMenuManager *menu);
void ov01_021EDF38(FieldMenuManager *menu);
void ov01_021EE014(FieldMenuManager *menu, u16 a1);
void ov01_021EE0EC(FieldMenuManager *menu, u16 *a1, u16 *a2);
void ov01_021EDFA4(FieldMenuManager *menu);
void ov01_021EE974(FieldMenuManager *menu, u8 a1);
void ov01_021EEC68(Window *window);
void ov01_021EEC7C(FieldSystem *fieldSystem, Window *window, u8 type);
void MoneyBoxSys_Delete(Window *moneyWindow);
void MoneyBoxSys_Update(FieldSystem *fieldSystem, Window *moneyWindow);
Window *ov01_021EED60(FieldSystem *fieldSystem, u8 arg1, u8 arg2);
void ov01_021EEE30(Window *window);
void ov01_021EEE44(FieldSystem *fieldSystem, Window *window);
void ov01_021EEF9C(FieldMenuManager *menu, int idx);
void ov01_021EF018(FieldMenuManager *menu, u8 a1);
void ov01_021EF034(FieldMenuManager *menu, u8 a1);
void MoveTutorMenu_SetListItem(FieldMenuManager *menu, int a1, int a2, int a3);

#endif // POKEHEARTGOLD_OVERLAY_01_021EDAFC_H
