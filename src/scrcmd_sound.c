#include "scrcmd.h"
#include "unk_02005D10.h"
#include "sound.h"
#include "sound_02004A44.h"
#include "unk_02054E00.h"
#include "sav_chatot.h"

BOOL ScrNative_GetFadeTimer(SCRIPTCONTEXT *ctx);
BOOL ScrNative_SEPlaying(SCRIPTCONTEXT *ctx);
BOOL ScrNative_WaitCry(SCRIPTCONTEXT *ctx);
BOOL ScrNative_WaitFanfare(SCRIPTCONTEXT *ctx);

BOOL ScrCmd_575(SCRIPTCONTEXT *ctx) {
    u16 var0 = ScriptReadHalfword(ctx);
    u16 *retPtr = ScriptGetVarPointer(ctx);
    *retPtr = sub_02005F94(var0);
    return FALSE;
}

BOOL ScrCmd_PlayBGM(SCRIPTCONTEXT *ctx) {
    u16 seqno = ScriptReadHalfword(ctx);
    PlayBGM(seqno);
    return FALSE;
}

BOOL ScrCmd_StopBGM(SCRIPTCONTEXT *ctx) {
    u16 var0 = ScriptReadHalfword(ctx);
    u16 bgm = GF_GetCurrentPlayingBGM();
    StopBGM(bgm, 0);
    return FALSE;
}

BOOL ScrCmd_ResetBGM(SCRIPTCONTEXT *ctx) {
    u16 seqno = GetMapMusic(ctx->fsys, ctx->fsys->location->mapId);
    PlayBGM(seqno);
    return FALSE;
}

BOOL ScrCmd_083(SCRIPTCONTEXT *ctx) {
    u16 seqno = ScriptReadHalfword(ctx);
    Fsys_SetSavedMusicId(ctx->fsys, seqno);
    return FALSE;
}

BOOL ScrCmd_FadeOutBGM(SCRIPTCONTEXT *ctx) {
    u16 seqno = ScriptReadHalfword(ctx);
    u16 length = ScriptReadHalfword(ctx);
    GF_SndStartFadeOutBGM(seqno, length);
    SetupNativeScript(ctx, ScrNative_GetFadeTimer);
    return TRUE;
}

BOOL ScrNative_GetFadeTimer(SCRIPTCONTEXT *ctx) {
    if (!GF_SndGetFadeTimer()) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_FadeInBGM(SCRIPTCONTEXT *ctx) {
    u16 var0 = ScriptReadHalfword(ctx);
    GF_SndStartFadeInBGM(0x7f, var0, 0);
    SetupNativeScript(ctx, ScrNative_GetFadeTimer);
    return TRUE;
}

BOOL ScrCmd_086(SCRIPTCONTEXT *ctx) {
    u8 var0 = ScriptReadByte(ctx);
    u8 var1 = ScriptReadByte(ctx);
    sub_020053A8(var0, var1);
    return FALSE;
}

BOOL ScrCmd_TempBGM(SCRIPTCONTEXT *ctx) {
    u16 var0 = ScriptReadHalfword(ctx);
    sub_02005E44(var0);
    return FALSE;
}

BOOL ScrCmd_088(SCRIPTCONTEXT *ctx) {
    u8 var0 = ScriptReadByte(ctx);
    GF_SND_BGM_DisableSet(var0);
    return FALSE;
}

BOOL ScrCmd_PlaySE(SCRIPTCONTEXT *ctx) {
    u16 sndseq = ScriptGetVar(ctx);
    PlaySE(sndseq);
    return FALSE;
}

BOOL ScrCmd_StopSE(SCRIPTCONTEXT *ctx) {
    u16 sndseq = ScriptGetVar(ctx);
    StopSE(sndseq, 0);
    return FALSE;
}

BOOL ScrCmd_WaitSE(SCRIPTCONTEXT *ctx) {
    u16 sndseq = ScriptGetVar(ctx);
    ctx->data[0] = sndseq;
    SetupNativeScript(ctx, ScrNative_SEPlaying);
    return TRUE;
}

BOOL ScrNative_SEPlaying(SCRIPTCONTEXT *ctx) {
    if (!IsSEPlaying(ctx->data[0])) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_PlayCry(SCRIPTCONTEXT *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    u16 var1 = ScriptGetVar(ctx);
    PlayCryEx(var1, var0, 0, 100, 0x20, 0);
    return FALSE;
}

BOOL ScrCmd_WaitCry(SCRIPTCONTEXT *ctx) {
    SetupNativeScript(ctx, ScrNative_WaitCry);
    return TRUE;
}

BOOL ScrNative_WaitCry(SCRIPTCONTEXT *ctx) {
    if (!IsCryFinished()) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_PlayFanfare(SCRIPTCONTEXT *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    PlayFanfare(var0);
    return FALSE;
}

BOOL ScrCmd_WaitFanfare(SCRIPTCONTEXT *ctx) {
    SetupNativeScript(ctx, ScrNative_WaitFanfare);
    return TRUE;
}

BOOL ScrNative_WaitFanfare(SCRIPTCONTEXT *ctx) {
    if (!IsFanfarePlaying()) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_ChatotHasCry(SCRIPTCONTEXT *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    SOUND_CHATOT *chatot = Save_Chatot_Get(ctx->fsys->savedata);
    if (Chatot_checkCry(chatot) == TRUE) {
        *retPtr = TRUE;
        return FALSE;
    } else {
        *retPtr = FALSE;
        return FALSE;
    }
}

BOOL ScrCmd_ChatotStartRecording(SCRIPTCONTEXT *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    GF_ASSERT(sub_02005518());
    if (!Chatot_startRecording()) {
        *retPtr = TRUE;
        return FALSE;
    } else {
        *retPtr = FALSE;
        return FALSE;
    }
}

BOOL ScrCmd_ChatotStopRecording(SCRIPTCONTEXT *ctx) {
    Chatot_stopRecording();
    return TRUE;
}

BOOL ScrCmd_ChatotSaveRecording(SCRIPTCONTEXT *ctx) {
    SOUND_CHATOT *chatot = Save_Chatot_Get(ctx->fsys->savedata);
    Chatot_saveRecording(chatot);
    return TRUE;
}

BOOL ScrCmd_093(SCRIPTCONTEXT *ctx) {
    sub_02004EC4(0x3f, 0, 0);
    return TRUE;
}

BOOL ScrCmd_544(SCRIPTCONTEXT *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    u16 var1 = ScriptGetVar(ctx);
    GF_SetVolumeBySeqNo(var0, var1);
    return FALSE;
}

BOOL ScrCmd_664(SCRIPTCONTEXT *ctx) {
    return TRUE;
}

BOOL ScrCmd_665(SCRIPTCONTEXT *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    sub_02055198(ctx->fsys, var0);
    return TRUE;
}

BOOL ScrCmd_666(SCRIPTCONTEXT *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    *retPtr = GF_GetCurrentPlayingBGM();
    return FALSE;
}
