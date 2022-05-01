#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov01_021FB5D4
ov01_021FB5D4: ; 0x021FB5D4
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #0xca
	lsl r1, r1, #2
	add r6, r0, #0
	bl AllocFromHeap
	mov r2, #0xca
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	mov r2, #0x63
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #2
	str r0, [r4]
	add r0, r6, #0
	add r1, #0xc
	add r2, r4, r2
	bl sub_02014A08
	mov r1, #0xc3
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r1, #4
	str r5, [r4, r0]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021FB5D4

	thumb_func_start ov01_021FB610
ov01_021FB610: ; 0x021FB610
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #1
	bne _021FB61E
	bl ov01_021FB82C
_021FB61E:
	mov r0, #0xc3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02014A38
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov01_021FB610

	thumb_func_start ov01_021FB630
ov01_021FB630: ; 0x021FB630
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021FB63E
	bl GF_AssertFail
_021FB63E:
	mov r0, #0x31
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, _021FB6B0 ; =ov01_021FB7DC
	add r2, r4, #0
	bl ov01_021FB530
	mov r2, #0xc5
	lsl r2, r2, #2
	str r0, [r4, r2]
	ldr r0, _021FB6B4 ; =ov01_021FB6C4
	add r1, r4, #0
	add r2, #0xec
	bl CreateSysTask
	mov r2, #0xc7
	lsl r2, r2, #2
	str r0, [r4, r2]
	ldr r0, _021FB6B8 ; =ov01_021FB7CC
	add r1, r4, #0
	add r2, #0xe4
	bl sub_0200E33C
	mov r2, #0x32
	lsl r2, r2, #4
	str r0, [r4, r2]
	ldr r0, _021FB6BC ; =ov01_021FB800
	add r1, r4, #0
	add r2, #0xe0
	bl sub_0200E33C
	mov r1, #0xc9
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	mov r2, #6
	add r0, #0xc
	mov r1, #0
	lsl r2, r2, #6
	bl memset
	mov r2, #0x63
	lsl r2, r2, #2
	add r0, r4, r2
	mov r1, #0
	sub r2, #0xc
	bl memset
	mov r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, _021FB6C0 ; =SEQ_SE_DP_DOKU2
	bl PlaySE
	pop {r4, pc}
	nop
_021FB6B0: .word ov01_021FB7DC
_021FB6B4: .word ov01_021FB6C4
_021FB6B8: .word ov01_021FB7CC
_021FB6BC: .word ov01_021FB800
_021FB6C0: .word SEQ_SE_DP_DOKU2
	thumb_func_end ov01_021FB630

	thumb_func_start ov01_021FB6C4
ov01_021FB6C4: ; 0x021FB6C4
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _021FB74C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021FB6DA: ; jump table
	.short _021FB6E2 - _021FB6DA - 2 ; case 0
	.short _021FB6EE - _021FB6DA - 2 ; case 1
	.short _021FB71A - _021FB6DA - 2 ; case 2
	.short _021FB740 - _021FB6DA - 2 ; case 3
_021FB6E2:
	mov r0, #3
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r4, pc}
_021FB6EE:
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0xc3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02014A4C
	ldr r1, [r4, #4]
	mov r2, #3
	sub r1, r2, r1
	bl ov01_021FB788
	ldr r0, [r4, #4]
	cmp r0, #0
	bgt _021FB74C
	mov r0, #3
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r4, pc}
_021FB71A:
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0xc3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02014A4C
	ldr r1, [r4, #4]
	mov r2, #3
	bl ov01_021FB788
	ldr r0, [r4, #4]
	cmp r0, #0
	bgt _021FB74C
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r4, pc}
_021FB740:
	add r0, r4, #0
	bl ov01_021FB82C
	mov r0, #0
	bl G3X_SetHOffset
_021FB74C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FB6C4

	thumb_func_start ov01_021FB750
ov01_021FB750: ; 0x021FB750
	push {r4, lr}
	ldr r1, _021FB780 ; =0x04000006
	ldrh r4, [r1]
	mov r1, #0xc3
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl sub_02014A60
	cmp r4, #0xc0
	bge _021FB77E
	add r3, r4, #1
	cmp r3, #0xc0
	blt _021FB76C
	sub r3, #0xc0
_021FB76C:
	ldr r1, _021FB784 ; =0x04000004
	ldrh r2, [r1]
	mov r1, #2
	tst r1, r2
	beq _021FB77E
	lsl r1, r3, #1
	ldrh r0, [r0, r1]
	bl G3X_SetHOffset
_021FB77E:
	pop {r4, pc}
	.balign 4, 0
_021FB780: .word 0x04000006
_021FB784: .word 0x04000004
	thumb_func_end ov01_021FB750

	thumb_func_start ov01_021FB788
ov01_021FB788: ; 0x021FB788
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	lsl r0, r1, #1
	add r0, r1, r0
	add r1, r2, #0
	mov r4, #1
	bl _s32_div_f
	neg r1, r0
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	lsl r0, r0, #0x10
	mov r6, #0
	str r1, [sp]
	lsr r7, r0, #0x10
_021FB7A6:
	add r0, r6, #0
	mov r1, #0xa
	bl _s32_div_f
	cmp r1, #0
	bne _021FB7B6
	mov r0, #1
	eor r4, r0
_021FB7B6:
	cmp r4, #0
	beq _021FB7BE
	strh r7, [r5]
	b _021FB7C2
_021FB7BE:
	ldr r0, [sp]
	strh r0, [r5]
_021FB7C2:
	add r6, r6, #1
	add r5, r5, #2
	cmp r6, #0xc0
	blt _021FB7A6
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021FB788

	thumb_func_start ov01_021FB7CC
ov01_021FB7CC: ; 0x021FB7CC
	mov r2, #0xc6
	ldr r3, _021FB7D8 ; =G3X_SetHOffset
	mov r0, #0
	lsl r2, r2, #2
	str r0, [r1, r2]
	bx r3
	.balign 4, 0
_021FB7D8: .word G3X_SetHOffset
	thumb_func_end ov01_021FB7CC

	thumb_func_start ov01_021FB7DC
ov01_021FB7DC: ; 0x021FB7DC
	ldr r3, _021FB7E4 ; =ov01_021FB7E8
	add r0, r1, #0
	bx r3
	nop
_021FB7E4: .word ov01_021FB7E8
	thumb_func_end ov01_021FB7DC

	thumb_func_start ov01_021FB7E8
ov01_021FB7E8: ; 0x021FB7E8
	push {r3, lr}
	ldr r1, [r0]
	cmp r1, #1
	bne _021FB7FE
	mov r1, #0xc6
	lsl r1, r1, #2
	ldr r1, [r0, r1]
	cmp r1, #1
	bne _021FB7FE
	bl ov01_021FB750
_021FB7FE:
	pop {r3, pc}
	thumb_func_end ov01_021FB7E8

	thumb_func_start ov01_021FB800
ov01_021FB800: ; 0x021FB800
	ldr r3, _021FB808 ; =ov01_021FB80C
	add r0, r1, #0
	bx r3
	nop
_021FB808: .word ov01_021FB80C
	thumb_func_end ov01_021FB800

	thumb_func_start ov01_021FB80C
ov01_021FB80C: ; 0x021FB80C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #1
	bne _021FB828
	mov r0, #0xc3
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02014A8C
	mov r0, #0xc6
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
_021FB828:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FB80C

	thumb_func_start ov01_021FB82C
ov01_021FB82C: ; 0x021FB82C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xc5
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov01_021FB554
	mov r0, #0xc5
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #8
	ldr r0, [r4, r0]
	bl DestroySysTask
	mov r0, #0xc7
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroySysTask
	mov r0, #0x32
	mov r1, #0
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r0, #4
	ldr r0, [r4, r0]
	bl DestroySysTask
	mov r0, #0xc9
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	str r1, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021FB82C
