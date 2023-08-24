#include "scrcmd.h"
#include "unk_02005D10.h"
#include "sound.h"
#include "sound_02004A44.h"
#include "unk_02054E00.h"
#include "sav_chatot.h"

BOOL ScrNative_GetFadeTimer(ScriptContext *ctx);
BOOL ScrNative_SEPlaying(ScriptContext *ctx);
BOOL ScrNative_WaitCry(ScriptContext *ctx);
BOOL ScrNative_WaitFanfare(ScriptContext *ctx);

BOOL ScrCmd_575(ScriptContext *ctx) {
    u16 var0 = ScriptReadHalfword(ctx);
    u16 *retPtr = ScriptGetVarPointer(ctx);
    *retPtr = sub_02005F94(var0);
    return FALSE;
}

BOOL ScrCmd_PlayBGM(ScriptContext *ctx) {
    u16 seqno = ScriptReadHalfword(ctx);
    PlayBGM(seqno);
    return FALSE;
}

BOOL ScrCmd_StopBGM(ScriptContext *ctx) {
    u16 var0 = ScriptReadHalfword(ctx);
    u16 bgm = GF_GetCurrentPlayingBGM();
    StopBGM(bgm, 0);
    return FALSE;
}

BOOL ScrCmd_ResetBGM(ScriptContext *ctx) {
    u16 seqno = GetMapMusic(ctx->fieldSystem, ctx->fieldSystem->location->mapId);
    PlayBGM(seqno);
    return FALSE;
}

BOOL ScrCmd_083(ScriptContext *ctx) {
    u16 seqno = ScriptReadHalfword(ctx);
    FieldSystem_SetSavedMusicId(ctx->fieldSystem, seqno);
    return FALSE;
}

BOOL ScrCmd_FadeOutBGM(ScriptContext *ctx) {
    u16 seqno = ScriptReadHalfword(ctx);
    u16 length = ScriptReadHalfword(ctx);
    GF_SndStartFadeOutBGM(seqno, length);
    SetupNativeScript(ctx, ScrNative_GetFadeTimer);
    return TRUE;
}

BOOL ScrNative_GetFadeTimer(ScriptContext *ctx) {
    if (!GF_SndGetFadeTimer()) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_FadeInBGM(ScriptContext *ctx) {
    u16 var0 = ScriptReadHalfword(ctx);
    GF_SndStartFadeInBGM(0x7f, var0, 0);
    SetupNativeScript(ctx, ScrNative_GetFadeTimer);
    return TRUE;
}

BOOL ScrCmd_086(ScriptContext *ctx) {
    u8 var0 = ScriptReadByte(ctx);
    u8 var1 = ScriptReadByte(ctx);
    sub_020053A8(var0, var1);
    return FALSE;
}

BOOL ScrCmd_TempBGM(ScriptContext *ctx) {
    u16 var0 = ScriptReadHalfword(ctx);
    sub_02005E44(var0);
    return FALSE;
}

BOOL ScrCmd_088(ScriptContext *ctx) {
    u8 var0 = ScriptReadByte(ctx);
    GF_SND_BGM_DisableSet(var0);
    return FALSE;
}

BOOL ScrCmd_PlaySE(ScriptContext *ctx) {
    u16 sndseq = ScriptGetVar(ctx);
    PlaySE(sndseq);
    return FALSE;
}

BOOL ScrCmd_StopSE(ScriptContext *ctx) {
    u16 sndseq = ScriptGetVar(ctx);
    StopSE(sndseq, 0);
    return FALSE;
}

BOOL ScrCmd_WaitSE(ScriptContext *ctx) {
    u16 sndseq = ScriptGetVar(ctx);
    ctx->data[0] = sndseq;
    SetupNativeScript(ctx, ScrNative_SEPlaying);
    return TRUE;
}

BOOL ScrNative_SEPlaying(ScriptContext *ctx) {
    if (!IsSEPlaying(ctx->data[0])) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_PlayCry(ScriptContext *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    u16 var1 = ScriptGetVar(ctx);
    PlayCryEx(var1, var0, 0, 100, 0x20, 0);
    return FALSE;
}

BOOL ScrCmd_WaitCry(ScriptContext *ctx) {
    SetupNativeScript(ctx, ScrNative_WaitCry);
    return TRUE;
}

BOOL ScrNative_WaitCry(ScriptContext *ctx) {
    if (!IsCryFinished()) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_PlayFanfare(ScriptContext *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    PlayFanfare(var0);
    return FALSE;
}

BOOL ScrCmd_WaitFanfare(ScriptContext *ctx) {
    SetupNativeScript(ctx, ScrNative_WaitFanfare);
    return TRUE;
}

BOOL ScrNative_WaitFanfare(ScriptContext *ctx) {
    if (!IsFanfarePlaying()) {
        return TRUE;
    } else {
        return FALSE;
    }
}

BOOL ScrCmd_ChatotHasCry(ScriptContext *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    SOUND_CHATOT *chatot = Save_Chatot_Get(ctx->fieldSystem->saveData);
    if (Chatot_CheckCry(chatot) == TRUE) {
        *retPtr = TRUE;
        return FALSE;
    } else {
        *retPtr = FALSE;
        return FALSE;
    }
}

BOOL ScrCmd_ChatotStartRecording(ScriptContext *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    GF_ASSERT(sub_02005518());
    if (!Chatot_StartRecording()) {
        *retPtr = TRUE;
        return FALSE;
    } else {
        *retPtr = FALSE;
        return FALSE;
    }
}

BOOL ScrCmd_ChatotStopRecording(ScriptContext *ctx) {
    Chatot_StopRecording();
    return TRUE;
}

BOOL ScrCmd_ChatotSaveRecording(ScriptContext *ctx) {
    SOUND_CHATOT *chatot = Save_Chatot_Get(ctx->fieldSystem->saveData);
    Chatot_SaveRecording(chatot);
    return TRUE;
}

BOOL ScrCmd_093(ScriptContext *ctx) {
    sub_02004EC4(0x3f, 0, 0);
    return TRUE;
}

BOOL ScrCmd_544(ScriptContext *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    u16 var1 = ScriptGetVar(ctx);
    GF_SetVolumeBySeqNo(var0, var1);
    return FALSE;
}

BOOL ScrCmd_664(ScriptContext *ctx) {
    return TRUE;
}

BOOL ScrCmd_665(ScriptContext *ctx) {
    u16 var0 = ScriptGetVar(ctx);
    sub_02055198(ctx->fieldSystem, var0);
    return TRUE;
}

BOOL ScrCmd_666(ScriptContext *ctx) {
    u16 *retPtr = ScriptGetVarPointer(ctx);
    *retPtr = GF_GetCurrentPlayingBGM();
    return FALSE;
}
