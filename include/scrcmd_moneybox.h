#ifndef POKEHEARTGOLD_SCRCMD_MONEYBOX_H
#define POKEHEARTGOLD_SCRCMD_MONEYBOX_H

#include "global.h"
#include "scrcmd.h"

BOOL ScrCmd_ShowMoneyBox(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_HideMoneyBox(SCRIPTCONTEXT *ctx);
BOOL ScrCmd_UpdateMoneyBox(SCRIPTCONTEXT *ctx);

extern WINDOW *Fsys_ShowMoneyBox(FieldSystem *, u8, u8); 

#endif //POKEHEARTGOLD_SCRCMD_MONEYBOX_H