#include "constants/sndseq.h"
#include "constants/trainer_class.h"
	.include "asm/macros.inc"
	.include "unk_02054E00.inc"
	.include "global.inc"

	.rodata

	.extern sTrainerEncounterMusicParam

	.text

	.extern MapModel_IsHeadbuttTree
	.extern MapCoordToMatrixIndex
	.extern sub_02054EB0
	.extern sub_02054F14
	.extern FieldSystem_SetSavedMusicId
	.extern FieldSystem_GetSavedMusicId
	.extern FieldSystem_ClearSavedMusicId
	.extern FieldSystem_GetOverriddenMusicId

	thumb_func_start GetMapMusic
GetMapMusic: ; 0x02054FA8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl IsNighttime
	cmp r0, #0
	bne _02054FBE
	add r0, r4, #0
	bl MapHeader_GetDayMusicId
	b _02054FC4
_02054FBE:
	add r0, r4, #0
	bl MapHeader_GetNightMusicId
_02054FC4:
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_VarsFlags_Get
	add r1, r4, #0
	bl GetOverriddenMapMusic
	cmp r0, #0
	beq _02054FD8
	add r6, r0, #0
_02054FD8:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end GetMapMusic

	thumb_func_start FieldSystem_PlayOrFadeToNewMusicId
FieldSystem_PlayOrFadeToNewMusicId: ; 0x02054FDC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	add r4, r1, #0
	add r7, r2, #0
	bl PlayerAvatar_GetState
	add r6, r0, #0
	bl GF_SND_BGM_DisableCheck
	cmp r0, #1
	bne _02054FFC
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02054FFC:
	add r0, r5, #0
	bl GF_GetCurrentPlayingBGM
	cmp r4, r0
	bne _0205500C
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0205500C:
	bl Sound_ClearBGMPauseFlags
	add r0, r5, #0
	add r1, r7, #0
	add r2, sp, #0xc
	add r3, sp, #8
	bl sub_0205504C
	cmp r6, #1
	beq _02055022
	bne _02055036
_02055022:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	add r0, r4, #0
	mov r3, #0x1e
	bl GF_FadeStartMusicId
	b _02055044
_02055036:
	mov r3, #0
	str r3, [sp]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	add r0, r4, #0
	bl GF_NowStartMusicId
_02055044:
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end FieldSystem_PlayOrFadeToNewMusicId

	thumb_func_start sub_0205504C
sub_0205504C: ; 0x0205504C
	cmp r1, #4
	bhi _0205508E
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205505C: ; jump table
	.short _02055066 - _0205505C - 2 ; case 0
	.short _02055070 - _0205505C - 2 ; case 1
	.short _0205507A - _0205505C - 2 ; case 2
	.short _0205508E - _0205505C - 2 ; case 3
	.short _02055084 - _0205505C - 2 ; case 4
_02055066:
	mov r0, #0x1e
	str r0, [r2]
	mov r0, #0
	str r0, [r3]
	bx lr
_02055070:
	mov r0, #0x3c
	str r0, [r2]
	mov r0, #0
	str r0, [r3]
	bx lr
_0205507A:
	mov r0, #0x3c
	str r0, [r2]
	mov r0, #0xf
	str r0, [r3]
	bx lr
_02055084:
	mov r0, #0x1e
	str r0, [r2]
	mov r0, #0
	str r0, [r3]
	bx lr
_0205508E:
	mov r0, #0x3c
	str r0, [r2]
	mov r0, #0
	str r0, [r3]
	bx lr
	thumb_func_end sub_0205504C

	thumb_func_start Trainer_GetEncounterMusic
Trainer_GetEncounterMusic: ; 0x02055098
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #2
	blt _020550A6
	bl GF_AssertFail
_020550A6:
	add r0, r5, #0
	mov r1, #1
	bl TrainerData_GetAttr
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, _020550DC ; =SEQ_GS_EYE_J_SHOUNEN
	ldr r1, _020550E0 ; =sTrainerEncounterMusicParam
	mov r3, #0
	mov r6, #6
_020550BA:
	add r7, r3, #0
	mul r7, r6
	add r2, r1, r7
	ldrh r7, [r1, r7]
	cmp r5, r7
	bne _020550CE
	add r0, r4, #1
	lsl r0, r0, #1
	ldrh r0, [r2, r0]
	pop {r3, r4, r5, r6, r7, pc}
_020550CE:
	add r2, r3, #1
	lsl r2, r2, #0x10
	lsr r3, r2, #0x10
	cmp r3, #0x2c
	blo _020550BA
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020550DC: .word SEQ_GS_EYE_J_SHOUNEN
_020550E0: .word sTrainerEncounterMusicParam
	thumb_func_end Trainer_GetEncounterMusic

	thumb_func_start FieldSystem_BeginFadeOutMusic
FieldSystem_BeginFadeOutMusic: ; 0x020550E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl GF_SND_BGM_DisableCheck
	cmp r0, #1
	beq _0205510C
	bl GF_GetCurrentPlayingBGM
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl GetMapMusic
	cmp r4, r0
	beq _0205510C
	mov r0, #0
	mov r1, #0x28
	bl GF_SndStartFadeOutBGM
_0205510C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end FieldSystem_BeginFadeOutMusic

	thumb_func_start sub_02055110
sub_02055110: ; 0x02055110
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	bl GF_SND_BGM_DisableCheck
	cmp r0, #1
	beq _02055160
	mov r0, #0
	bl Sound_SetScene
	add r0, r5, #0
	add r1, r6, #0
	bl GetMapMusic
	add r6, r0, #0
	bl sub_02004AC8
	mov r0, #1
	bl sub_02005CF4
	mov r1, #2
	add r0, r5, #0
	mvn r1, r1
	add r0, #0xc4
	str r1, [r0]
	cmp r4, #1
	bne _02055152
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02055198
	b _0205515A
_02055152:
	mov r0, #0
	add r1, r6, #0
	bl sub_02055198
_0205515A:
	mov r0, #0
	bl sub_02005CF4
_02055160:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02055110

	thumb_func_start sub_02055164
sub_02055164: ; 0x02055164
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl FieldSystem_GetOverriddenMusicId
	add r6, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl GetMapMusic
	bl sub_02004AC8
	mov r0, #1
	bl sub_02005CF4
	mov r0, #0
	add r1, r6, #0
	bl sub_02055198
	add r4, r0, #0
	mov r0, #0
	bl sub_02005CF4
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02055164

	thumb_func_start sub_02055198
sub_02055198: ; 0x02055198
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl sub_02004EB4
	add r4, r0, #0
	cmp r4, #1
	bne _020551B4
	cmp r5, #0
	beq _020551B4
	add r0, r5, #0
	mov r1, #0
	bl ov01_021E7F00
_020551B4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02055198
