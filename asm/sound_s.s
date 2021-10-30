#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.bss

	.public _0211194C
	.public _02111950
	.public sSndHeapFreeSize ; 02111954
	.public sSoundWork ; 02111958
	.public GF_SndHeapGetFreeSize

	.text

	thumb_func_start sub_0200480C
sub_0200480C: ; 0x0200480C
	push {r3, lr}
	cmp r0, #7
	bhi _0200484E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0200481E: ; jump table
	.short _02004832 - _0200481E - 2 ; case 0
	.short _0200482E - _0200481E - 2 ; case 1
	.short _02004836 - _0200481E - 2 ; case 2
	.short _0200483A - _0200481E - 2 ; case 3
	.short _0200483E - _0200481E - 2 ; case 4
	.short _02004842 - _0200481E - 2 ; case 5
	.short _02004846 - _0200481E - 2 ; case 6
	.short _0200484A - _0200481E - 2 ; case 7
_0200482E:
	mov r0, #0
	pop {r3, pc}
_02004832:
	mov r0, #1
	pop {r3, pc}
_02004836:
	mov r0, #2
	pop {r3, pc}
_0200483A:
	mov r0, #3
	pop {r3, pc}
_0200483E:
	mov r0, #4
	pop {r3, pc}
_02004842:
	mov r0, #5
	pop {r3, pc}
_02004846:
	mov r0, #6
	pop {r3, pc}
_0200484A:
	mov r0, #7
	pop {r3, pc}
_0200484E:
	bl GF_AssertFail
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0200480C

	thumb_func_start GF_SoundDataInit
GF_SoundDataInit: ; 0x02004858
	push {r4, lr}
	ldr r2, _02004874 ; =0x000BEC88
	mov r1, #0
	add r4, r0, #0
	bl memset
	ldr r0, _02004878 ; =0x000BEC0C
	mov r1, #0
_02004868:
	add r1, r1, #1
	str r1, [r4, r0]
	add r4, r4, #4
	cmp r1, #7
	blt _02004868
	pop {r4, pc}
	.balign 4, 0
_02004874: .word 0x000BEC88
_02004878: .word 0x000BEC0C
	thumb_func_end GF_SoundDataInit

	thumb_func_start GF_SndHandleInitAll
GF_SndHandleInitAll: ; 0x0200487C
	push {r3, r4, r5, lr}
	ldr r1, _02004894 ; =0x000BEB78
	mov r4, #0
	add r5, r0, r1
_02004884:
	add r0, r5, #0
	bl NNS_SndHandleInit
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #9
	blt _02004884
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02004894: .word 0x000BEB78
	thumb_func_end GF_SndHandleInitAll

	thumb_func_start sub_02004898
sub_02004898: ; 0x02004898
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020048BC ; =0x000BEC0C
	add r0, r4, r0
	bl GF_Snd_SaveState
	mov r0, #GROUP_GLOBAL
	bl GF_Snd_LoadGroup
	ldr r0, _020048C0 ; =BANK_GAMEBOY
	bl GF_Snd_LoadBank
	ldr r0, _020048C4 ; =0x000BEC10
	add r0, r4, r0
	bl GF_Snd_SaveState
	pop {r4, pc}
	nop
_020048BC: .word 0x000BEC0C
_020048C0: .word 0x000002BD
_020048C4: .word 0x000BEC10
	thumb_func_end sub_02004898

	thumb_func_start GF_InitMic
GF_InitMic: ; 0x020048C8
	push {r4, lr}
	add r4, r0, #0
	bl MIC_Init
	mov r0, #1
	bl PM_SetAmp
	mov r0, #2
	bl PM_SetAmpGain
	ldr r1, _020048EC ; =0x000BEC80
	mov r0, #1
	ldr r2, [r4, r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_020048EC: .word 0x000BEC80
	thumb_func_end GF_InitMic

	thumb_func_start sub_020048F0
sub_020048F0: ; 0x020048F0
	push {r3, lr}
	mov r0, #PLAYER_BGM
	mov r1, #0
	bl NNS_SndPlayerStopSeqByPlayerNo
	mov r0, #7
	bl GetSoundPlayer
	bl NNS_SndHandleReleaseSeq
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020048F0

	thumb_func_start sub_02004908
sub_02004908: ; 0x02004908
	push {r3, lr}
	mov r0, #PLAYER_FIELD
	mov r1, #0
	bl NNS_SndPlayerStopSeqByPlayerNo
	mov r0, #0
	bl GetSoundPlayer
	bl NNS_SndHandleReleaseSeq
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02004908

	thumb_func_start sub_02004920
sub_02004920: ; 0x02004920
	bx lr
	.balign 4, 0
	thumb_func_end sub_02004920

	thumb_func_start sub_02004924
sub_02004924: ; 0x02004924
	push {r3, lr}
	bl GetSoundDataPointer
	ldr r1, _0200493C ; =0x000BEC80
	ldr r0, [r0, r1]
	lsr r0, r0, #1
	cmp r0, #0x5a
	bls _02004938
	mov r0, #1
	pop {r3, pc}
_02004938:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0200493C: .word 0x000BEC80
	thumb_func_end sub_02004924

	thumb_func_start sub_02004940
sub_02004940: ; 0x02004940
	push {r3, lr}
	bl GetSoundDataPointer
	ldr r2, _02004954 ; =0x000BEC80
	mov r1, #1
	ldr r3, [r0, r2]
	and r1, r3
	str r1, [r0, r2]
	pop {r3, pc}
	nop
_02004954: .word 0x000BEC80
	thumb_func_end sub_02004940

	thumb_func_start sub_02004958
sub_02004958: ; 0x02004958
	push {r4, lr}
	add r4, r0, #0
	bl GetSoundDataPointer
	ldr r1, _02004968 ; =0x000BEC84
	str r4, [r0, r1]
	pop {r4, pc}
	nop
_02004968: .word 0x000BEC84
	thumb_func_end sub_02004958

	thumb_func_start sub_0200496C
sub_0200496C: ; 0x0200496C
	push {r3, lr}
	bl GetSoundDataPointer
	ldr r1, _0200497C ; =0x000BEC84
	ldr r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
_0200497C: .word 0x000BEC84
	thumb_func_end sub_0200496C

	thumb_func_start sub_02004980
sub_02004980: ; 0x02004980
	push {r3, lr}
	bl sub_02004908
	bl sub_020048F0
	pop {r3, pc}
	thumb_func_end sub_02004980
