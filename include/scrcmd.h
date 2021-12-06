#ifndef POKEHEARTGOLD_SCRCMD_H
#define POKEHEARTGOLD_SCRCMD_H

#include "fieldmap.h"
#include "script.h"

extern SAVEDATA* ScriptEnvironment_GetSav2Ptr(UnkSavStruct80*);

// scrcmd_fossils.c
BOOL ScrCmd_CountFossils(SCRIPTCONTEXT* ctx);
BOOL ScrCmd_GetFossilPokemon(SCRIPTCONTEXT* ctx);
BOOL ScrCmd_GetFossilMinimumAmount(SCRIPTCONTEXT* ctx);

// scrcmd_items.c
BOOL ScrCmd_GiveItem(SCRIPTCONTEXT* ctx);
BOOL ScrCmd_TakeItem(SCRIPTCONTEXT* ctx);
BOOL ScrCmd_HasSpaceForItem(SCRIPTCONTEXT* ctx);
BOOL ScrCmd_HasItem(SCRIPTCONTEXT* ctx);
BOOL ScrCmd_GetItemQuantity(SCRIPTCONTEXT* ctx);
BOOL ScrCmd_ItemIsTMOrHM(SCRIPTCONTEXT* ctx);
BOOL ScrCmd_GetItemPocket(SCRIPTCONTEXT* ctx);

// scrcmd_money.c
BOOL ScrCmd_AddMoney(SCRIPTCONTEXT* ctx);
BOOL ScrCmd_SubMoneyImmediate(SCRIPTCONTEXT* ctx);
BOOL ScrCmd_SubMoneyVar(SCRIPTCONTEXT* ctx);
BOOL ScrCmd_HasEnoughMoneyImmediate(SCRIPTCONTEXT* ctx);
BOOL ScrCmd_HasEnoughMoneyVar(SCRIPTCONTEXT* ctx);

#endif
