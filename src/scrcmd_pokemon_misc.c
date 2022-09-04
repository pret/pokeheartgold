#include "bug_contest.h"
#include "fieldmap.h"
#include "scrcmd.h"
#include "unk_0206D494.h"

BOOL ScrCmd_839(SCRIPTCONTEXT *ctx) {
    if (VarGet(ctx->fsys, ScriptReadHalfword(ctx)) != 0) {
        Sys_SetSleepDisableFlag(1 << 3);
    } else {
        Sys_ClearSleepDisableFlag(1 << 3);
    }
    return FALSE;
}

BOOL ScrCmd_BugContestAction(SCRIPTCONTEXT *ctx) {
    u8 unkVar1 = *(ctx->script_ptr++);
    u32 weekday = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    
    FieldSystem *fsys = ctx->fsys;
    
    if (unkVar1 == 0) {
        fsys->bugContest = BugContest_new(fsys, weekday);
    } else {
        BugContest_delete(fsys->bugContest);
        fsys->bugContest = NULL;
        sub_02093070(fsys);
    }
    return FALSE;
}

BOOL ScrCmd_BufferBugContestWinner(SCRIPTCONTEXT *ctx) {
    struct MSGFMT **msgfmt;
    BUGCONTEST *bugContest;

    msgfmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    bugContest = FieldSys_BugContest_get(ctx->fsys);

    BugContest_BufferContestWinnerNames(bugContest, ctx->msg_data, *msgfmt, *ctx->script_ptr++);

    return FALSE;
}

BOOL ScrCmd_JudgeBugContest(SCRIPTCONTEXT *ctx) { 
    BUGCONTEST *bugContest;
    u16 *prize;
    u16 *placement;
    u16 *species;

    bugContest = FieldSys_BugContest_get(ctx->fsys);
    placement = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    prize = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    species = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));

    BugContest_Judge(bugContest);

    *placement = bugContest->placement;
    *prize = bugContest->prize;
    
    if (bugContest->caught_poke == 0) {
        *species = 0;
    } else {
        *species = GetMonData(bugContest->pokemon, MON_DATA_SPECIES, NULL);
    }

    return FALSE;
}

BOOL ScrCmd_BufferBugContestMonNick(SCRIPTCONTEXT *ctx) {
    struct MSGFMT **msgfmt;
    BUGCONTEST *bugContest;
    u32 script_index;

    msgfmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);
    bugContest = FieldSys_BugContest_get(ctx->fsys);

    script_index = *(ctx->script_ptr++);

    u16 *monNick = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    *monNick = BugContest_BufferCaughtMonNick(bugContest, *msgfmt, script_index);
    return FALSE;
}

BOOL ScrCmd_BugContestGetTimeLeft(SCRIPTCONTEXT *ctx) {
    struct MSGFMT **msgfmt;    
    BUGCONTEST *bugContest;
    u32 script_index;
    u32 timeLeft;

    msgfmt = FieldSysGetAttrAddr(ctx->fsys, SCRIPTENV_MSGFMT);

    script_index = *(ctx->script_ptr++);  
    timeLeft = 1;

    bugContest = FieldSys_BugContest_get(ctx->fsys);

    if (bugContest != 0 && bugContest->elapsed_time < 20) {
        timeLeft = 20 - bugContest->elapsed_time;
    }

    BufferIntegerAsString(*msgfmt, script_index, timeLeft, 2, STRCONVMODE_LEFT_ALIGN, 1);

    return FALSE;
}

BOOL ScrCmd_IsBugContestantRegistered(SCRIPTCONTEXT *ctx) {
    BUGCONTEST *bugContest = FieldSys_BugContest_get(ctx->fsys);
    u32 id = VarGet(ctx->fsys, ScriptReadHalfword(ctx));
    u16 *ptr = GetVarPointer(ctx->fsys, ScriptReadHalfword(ctx));
    *ptr = BugContest_ContestantIsRegistered(bugContest, id);
    return FALSE;
}