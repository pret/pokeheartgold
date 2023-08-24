#include "scrcmd.h"
#include "overlay_01_apricorn_tree_anim.h"
#include "unk_02055418.h"
#include "unk_02031B0C.h"

BOOL ScrCmd_AnimApricornTree(ScriptContext *ctx) {
    u16 varId = ScriptReadHalfword(ctx);
    LocalMapObject **lastInteracted = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_LAST_INTERACTED);
    u16 *retPtr = GetVarPointer(ctx->fieldSystem, varId);
    FieldSystem_AnimApricornTree(ctx->fieldSystem, *lastInteracted, retPtr);
    return TRUE;
}

BOOL ScrCmd_ApricornTreeGetApricorn(ScriptContext *ctx) {
    u16 varId = ScriptReadHalfword(ctx);
    LocalMapObject **lastInteracted = FieldSysGetAttrAddr(ctx->fieldSystem, SCRIPTENV_LAST_INTERACTED);
    u16 *retPtr = GetVarPointer(ctx->fieldSystem, varId);
    *retPtr = FieldSystem_ApricornTree_GetApricorn(ctx->fieldSystem, *lastInteracted);
    return FALSE;
}

BOOL ScrCmd_GiveApricornFromTree(ScriptContext *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    u8 var1 = ScriptGetVar(ctx);
    u16 *retPtr = ScriptGetVarPointer(ctx);
    SaveApricornBox *apricornBox = Save_ApricornBox_Get(ctx->fieldSystem->saveData);
    u8 var2 = var0;
    int apricornCount = ApricornBox_CountApricorn(apricornBox, var2);

    if ((var1 + apricornCount) <= 99) {
        ApricornBox_GiveApricorn(apricornBox, var2, var1);
        *retPtr = TRUE;
    } else {
        *retPtr = FALSE;
    }
    return FALSE;
}
