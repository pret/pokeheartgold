#include "constants/snd_system.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_575
ScrCmd_575: ; 0x0204910C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02005F94
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_575

	thumb_func_start ScrCmd_PlayBGM
ScrCmd_PlayBGM: ; 0x02049134
	push {r3, lr}
	bl ScriptReadHalfword
	bl PlayBGM
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_PlayBGM

	thumb_func_start ScrCmd_081
ScrCmd_081: ; 0x02049144
	push {r3, lr}
	bl ScriptReadHalfword
	bl Snd_GetCurrentlyPlayingBGM
	mov r1, #0
	bl StopBGM
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_081

	thumb_func_start ScrCmd_ResetBGM
ScrCmd_ResetBGM: ; 0x02049158
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	bl GetMapMusic
	bl PlayBGM
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_ResetBGM

	thumb_func_start ScrCmd_083
ScrCmd_083: ; 0x02049170
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl Fsys_SetSavedMusicId
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_083

	thumb_func_start ScrCmd_FadeOutBGM
ScrCmd_FadeOutBGM: ; 0x02049188
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	bl GF_SndStartFadeOutBGM
	ldr r1, _020491AC ; =sub_020491B0
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020491AC: .word sub_020491B0
	thumb_func_end ScrCmd_FadeOutBGM

	thumb_func_start sub_020491B0
sub_020491B0: ; 0x020491B0
	push {r3, lr}
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _020491BE
	mov r0, #1
	pop {r3, pc}
_020491BE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020491B0

	thumb_func_start ScrCmd_085
ScrCmd_085: ; 0x020491C4
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	mov r0, #0x7f
	mov r2, #0
	bl GF_SndStartFadeInBGM
	ldr r1, _020491E4 ; =sub_020491B0
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_020491E4: .word sub_020491B0
	thumb_func_end ScrCmd_085

	thumb_func_start ScrCmd_086
ScrCmd_086: ; 0x020491E8
	push {r3, lr}
	ldr r1, [r0, #8]
	add r3, r1, #1
	str r3, [r0, #8]
	ldrb r2, [r1]
	add r1, r3, #1
	str r1, [r0, #8]
	ldrb r1, [r3]
	add r0, r2, #0
	bl SndPause
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_086

	thumb_func_start ScrCmd_TempBGM
ScrCmd_TempBGM: ; 0x02049204
	push {r3, lr}
	bl ScriptReadHalfword
	bl sub_02005E44
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_TempBGM

	thumb_func_start ScrCmd_088
ScrCmd_088: ; 0x02049214
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r0, [r2]
	bl Snd_SetCntrlBGMFlag
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_088

	thumb_func_start ScrCmd_PlaySE
ScrCmd_PlaySE: ; 0x02049228
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	bl PlaySE
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_PlaySE

	thumb_func_start ScrCmd_StopSE
ScrCmd_StopSE: ; 0x02049244
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	mov r1, #0
	bl StopSE
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ScrCmd_StopSE

	thumb_func_start ScrCmd_WaitSE
ScrCmd_WaitSE: ; 0x02049260
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [r4, #0x64]
	ldr r1, _02049284 ; =sub_02049288
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_02049284: .word sub_02049288
	thumb_func_end ScrCmd_WaitSE

	thumb_func_start sub_02049288
sub_02049288: ; 0x02049288
	push {r3, lr}
	ldr r0, [r0, #0x64]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl IsSEPlaying
	cmp r0, #0
	bne _0204929C
	mov r0, #1
	pop {r3, pc}
_0204929C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02049288

	thumb_func_start ScrCmd_PlayCry
ScrCmd_PlayCry: ; 0x020492A0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	mov r1, #0x20
	str r1, [sp]
	mov r2, #0
	add r1, r4, #0
	mov r3, #0x64
	str r2, [sp, #4]
	bl PlayCryEx
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_PlayCry

	thumb_func_start ScrCmd_WaitCry
ScrCmd_WaitCry: ; 0x020492E0
	push {r3, lr}
	ldr r1, _020492EC ; =ScrNative_WaitCry
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_020492EC: .word ScrNative_WaitCry
	thumb_func_end ScrCmd_WaitCry

	thumb_func_start ScrNative_WaitCry
ScrNative_WaitCry: ; 0x020492F0
	push {r3, lr}
	bl IsCryFinished
	cmp r0, #0
	bne _020492FE
	mov r0, #1
	pop {r3, pc}
_020492FE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrNative_WaitCry

	thumb_func_start ScrCmd_PlayFanfare
ScrCmd_PlayFanfare: ; 0x02049304
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	bl PlayFanfare
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_PlayFanfare

	thumb_func_start ScrCmd_WaitFanfare
ScrCmd_WaitFanfare: ; 0x02049320
	push {r3, lr}
	ldr r1, _0204932C ; =ScrNative_WaitFanfare
	bl SetupNativeScript
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0204932C: .word ScrNative_WaitFanfare
	thumb_func_end ScrCmd_WaitFanfare

	thumb_func_start ScrNative_WaitFanfare
ScrNative_WaitFanfare: ; 0x02049330
	push {r3, lr}
	bl IsFanfarePlaying
	cmp r0, #0
	bne _0204933E
	mov r0, #1
	pop {r3, pc}
_0204933E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrNative_WaitFanfare

	thumb_func_start ScrCmd_ChatotHasCry
ScrCmd_ChatotHasCry: ; 0x02049344
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_Chatot_get
	bl Chatot_checkCry
	cmp r0, #1
	bne _02049374
	mov r0, #1
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
_02049374:
	mov r0, #0
	strh r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_ChatotHasCry

	thumb_func_start ScrCmd_ChatotStartRecording
ScrCmd_ChatotStartRecording: ; 0x0204937C
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl IsWorkMicCounterFull
	cmp r0, #0
	bne _0204939C
	bl GF_AssertFail
_0204939C:
	bl Chatot_startRecording
	cmp r0, #0
	bne _020493AC
	mov r0, #1
	strh r0, [r4]
	mov r0, #0
	pop {r4, pc}
_020493AC:
	mov r0, #0
	strh r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_ChatotStartRecording

	thumb_func_start ScrCmd_ChatotStopRecording
ScrCmd_ChatotStopRecording: ; 0x020493B4
	push {r3, lr}
	bl Chatot_stopRecording
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_ChatotStopRecording

	thumb_func_start ScrCmd_ChatotSaveRecording
ScrCmd_ChatotSaveRecording: ; 0x020493C0
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_Chatot_get
	bl Chatot_saveRecording
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_ChatotSaveRecording

	thumb_func_start ScrCmd_093
ScrCmd_093: ; 0x020493D4
	push {r3, lr}
	mov r1, #0
	mov r0, #SOUND_SUB_CLIMAX
	add r2, r1, #0
	bl Snd_SetDataByScene
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ScrCmd_093

	thumb_func_start ScrCmd_544
ScrCmd_544: ; 0x020493E4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r1, r0, #0
	add r0, r5, #0
	bl Snd_SetVol
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_544

	thumb_func_start ScrCmd_664
ScrCmd_664: ; 0x02049418
	mov r0, #1
	bx lr
	thumb_func_end ScrCmd_664

	thumb_func_start ScrCmd_665
ScrCmd_665: ; 0x0204941C
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_02055198
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_665

	thumb_func_start ScrCmd_666
ScrCmd_666: ; 0x02049440
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	bl Snd_GetCurrentlyPlayingBGM
	strh r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_666
