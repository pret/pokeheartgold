#include "constants/sndseq.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public sub_02004980

	.bss

_021D05E0:	.space 4
_021D05E4:	.space 4

	.text

	thumb_func_start sub_0200498C
sub_0200498C: ; 0x0200498C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020049C0 ; =_021D05E4
	bl NNS_SndHandleInit
	ldr r1, _020049C4 ; =0x0000A7FE
	mov r0, #9
	bl NNS_SndPlayerSetAllocatableChannel
	mov r0, #9
	mov r1, #1
	bl NNS_SndPlayerSetPlayableSeqCount
	ldr r1, [r4]
	ldr r2, _020049C8 ; =0x00002EE0
	mov r0, #9
	bl NNS_SndPlayerCreateHeap
	cmp r0, #1
	beq _020049B8
	bl GF_AssertFail
_020049B8:
	ldr r0, _020049CC ; =_021D05E0
	mov r1, #0
	str r1, [r0]
	pop {r4, pc}
	.balign 4, 0
_020049C0: .word _021D05E4
_020049C4: .word 0x0000A7FE
_020049C8: .word 0x00002EE0
_020049CC: .word _021D05E0
	thumb_func_end sub_0200498C

	thumb_func_start sub_020049D0
sub_020049D0: ; 0x020049D0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl sub_02004980
	add r0, r4, #0
	bl NNS_SndArcGetSeqParam
	add r2, r0, #0
	str r4, [sp]
	ldrh r2, [r2]
	ldr r0, _02004A00 ; =_021D05E4
	mov r1, #9
	mov r3, #0x41
	bl NNS_SndArcPlayerStartSeqEx
	cmp r0, #1
	beq _020049F6
	mov r4, #0
_020049F6:
	ldr r1, _02004A04 ; =_021D05E0
	str r4, [r1]
	add sp, #4
	pop {r3, r4, pc}
	nop
_02004A00: .word _021D05E4
_02004A04: .word _021D05E0
	thumb_func_end sub_020049D0

	thumb_func_start sub_02004A08
sub_02004A08: ; 0x02004A08
	push {r3, lr}
	add r1, r0, #0
	mov r0, #9
	bl NNS_SndPlayerStopSeqByPlayerNo
	ldr r0, _02004A1C ; =_021D05E0
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	nop
_02004A1C: .word _021D05E0
	thumb_func_end sub_02004A08

	thumb_func_start sub_02004A20
sub_02004A20: ; 0x02004A20
	ldr r0, _02004A28 ; =_021D05E0
	ldr r0, [r0]
	bx lr
	nop
_02004A28: .word _021D05E0
	thumb_func_end sub_02004A20

	thumb_func_start sub_02004A2C
sub_02004A2C: ; 0x02004A2C
	ldr r3, _02004A34 ; =NNS_SndPlayerPauseByPlayerNo
	add r1, r0, #0
	mov r0, #9
	bx r3
	.balign 4, 0
_02004A34: .word NNS_SndPlayerPauseByPlayerNo
	thumb_func_end sub_02004A2C

	thumb_func_start sub_02004A38
sub_02004A38: ; 0x02004A38
	ldr r3, _02004A40 ; =NNS_SndPlayerCountPlayingSeqByPlayerNo
	mov r0, #9
	bx r3
	nop
_02004A40: .word NNS_SndPlayerCountPlayingSeqByPlayerNo
	thumb_func_end sub_02004A38
