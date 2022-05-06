#include "scrcmd.h"
#include "fieldmap.h"
#include "friend_group.h"
#include "unk_0202C730.h"
#include "unk_0203E348.h"
#include "math_util.h"

BOOL ScrCmd_683(SCRIPTCONTEXT *ctx) {
    u32 *unkC = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_0C);
    u16 *var0 = ScriptGetVarPointer(ctx);
    *var0 = *unkC;
    return TRUE;
}

BOOL ScrCmd_465(SCRIPTCONTEXT *ctx) {
    MSGFMT **msg = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    SAV_FRIEND_GRP *group = Save_FriendGroup_get(ctx->fsys->savedata);
    SAVEDATA *save = ctx->fsys->savedata;

    u16 var = ScriptReadHalfword(ctx);
    switch (var) {
    case 0: {
        u16 var0 = ScriptGetVar(ctx);
        u16 *retPtr = ScriptGetVarPointer(ctx);
        *retPtr = sub_0202C860(group, var0);
        return FALSE;
    }
    case 1: {
        u16 var0 = ScriptGetVar(ctx);
        u16 *retPtr = ScriptGetVarPointer(ctx);
        *retPtr = sub_0202C878(group, var0);
        return FALSE;
    }
    case 2: {
        u16 groupId = ScriptGetVar(ctx);
        u16 fieldNo = ScriptGetVar(ctx);
        BufferGroupName(*msg, save, groupId, fieldNo, 0);
        break;
    }
    case 3: {
        u16 groupId = ScriptGetVar(ctx);
        u16 fieldNo = ScriptGetVar(ctx);
        BufferGroupName(*msg, save, groupId, fieldNo, 1);
        break;
    }
    case 4: {
        u16 *r5 = sub_0202C7E0(group, 0, 0);
        u16 *retPtr = ScriptGetVarPointer(ctx);
        CreateNamingScreen(ctx->taskman, NAMINGSCREEN_GROUP, 0, OT_NAME_LENGTH, 0, r5, retPtr);
        return TRUE;
    }
    case 5: {
        u16 var0 = ScriptGetVar(ctx);
        sub_0202C860(group, 1);
        sub_0202C738(group, var0, 1);
        return FALSE;
    }
    case 6: {
        STRING *str = String_ctor(64, 32);
        PLAYERPROFILE *profile = Sav2_PlayerData_GetProfileAddr(ctx->fsys->savedata);
        PlayerName_FlatToString(profile, str);
        sub_0202C7F8(group, 0, 1, str);
        sub_0202C824(group, 0, PlayerProfile_GetTrainerGender(profile));
        sub_0202C848(group, 0, 2);
        sub_0202C7C0(group, 0, MTRandom());
        String_dtor(str);
        sub_0202C738(group, 0, 1);
        break;
    }
    case 7: {
        u16 *retPtr = ScriptGetVarPointer(ctx);
        u16 i, count;
        for (count = 0, i = 0; i < FGRP_MAX; i++) {
            if (sub_0202C860(group, i) && sub_0202C878(group, i) != TRUE) {
                count++;
            }
        }

        if (count >= 4) {
            *retPtr = TRUE;
        } else {
            *retPtr = FALSE;
        }
    }
    }

    return FALSE;
}
