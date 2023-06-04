#include "scrcmd.h"
#include "overlay_01_apricorn_tree_anim.h"
#include "unk_02055418.h"
#include "unk_02031B0C.h"

BOOL ScrCmd_AnimApricornTree(SCRIPTCONTEXT *ctx) {
    u16 varId = ScriptReadHalfword(ctx);
    LocalMapObject **lastInteracted = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_LAST_INTERACTED);
    u16 *retPtr = GetVarPointer(ctx->fsys, varId);
    FieldSys_AnimApricornTree(ctx->fsys, *lastInteracted, retPtr);
    return TRUE;
}

BOOL ScrCmd_ApricornTreeGetApricorn(SCRIPTCONTEXT *ctx) {
    u16 varId = ScriptReadHalfword(ctx);
    LocalMapObject **lastInteracted = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_LAST_INTERACTED);
    u16 *retPtr = GetVarPointer(ctx->fsys, varId);
    *retPtr = FieldSys_ApricornTree_GetApricorn(ctx->fsys, *lastInteracted);
    return FALSE;
}

BOOL ScrCmd_GiveApricornFromTree(SCRIPTCONTEXT *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    u8 var1 = ScriptGetVar(ctx);
    u16 *retPtr = ScriptGetVarPointer(ctx);
    SaveApricornBox *apricornBox = Save_ApricornBox_Get(ctx->fsys->savedata);
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
