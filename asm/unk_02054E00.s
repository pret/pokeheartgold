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
	.extern GetMapMusic
	.extern FieldSystem_PlayOrFadeToNewMusicId
	.extern Trainer_GetEncounterMusic

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
