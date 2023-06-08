	.include "asm/macros.inc"
	.include "overlay_12_0226BEC4.inc"
	.include "global.inc"

	.text

    thumb_func_start ov12_0226BEC4
ov12_0226BEC4: ; 0x0226BEC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	mov r2, #0xfa
	ldr r0, _0226BEEC ; =ov12_0226BF04
	add r1, r4, #0
	lsl r2, r2, #2
	str r5, [r4]
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	nop
_0226BEEC: .word ov12_0226BF04
	thumb_func_end ov12_0226BEC4

	thumb_func_start ov12_0226BEF0
ov12_0226BEF0: ; 0x0226BEF0
	push {r4, lr}
	add r4, r0, #0
	bl sub_0201F988
	bl FreeToHeap
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	thumb_func_end ov12_0226BEF0

	thumb_func_start ov12_0226BF04
ov12_0226BF04: ; 0x0226BF04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	ldr r0, [r4]
	bl ov12_0223A900
	mov r1, #4
	ldrsh r1, [r4, r1]
	add r5, r0, #0
	cmp r1, #4
	bhi _0226BFCE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0226BF26: ; jump table
	.short _0226BF30 - _0226BF26 - 2 ; case 0
	.short _0226BF76 - _0226BF26 - 2 ; case 1
	.short _0226BF8A - _0226BF26 - 2 ; case 2
	.short _0226BFB0 - _0226BF26 - 2 ; case 3
	.short _0226BFCE - _0226BF26 - 2 ; case 4
_0226BF30:
	cmp r5, #0
	bne _0226BF38
	bl GF_AssertFail
_0226BF38:
	mov r0, #7
	mov r1, #5
	bl NARC_New
	add r6, r0, #0
	mov r0, #8
	mov r1, #5
	bl NARC_New
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r6, #0
	add r1, r7, #0
	add r2, r5, #0
	mov r3, #0x12
	bl ov12_02266508
	add r0, r6, #0
	bl NARC_Delete
	add r0, r7, #0
	bl NARC_Delete
	mov r0, #4
	ldrsh r0, [r4, r0]
	add sp, #8
	add r0, r0, #1
	strh r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0226BF76:
	bl ov12_02266C64
	cmp r0, #1
	bne _0226BFCE
	mov r0, #4
	ldrsh r0, [r4, r0]
	add sp, #8
	add r0, r0, #1
	strh r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0226BF8A:
	ldr r0, [r4]
	bl ov12_0223C080
	cmp r0, #1
	bne _0226BFCE
	add r0, r5, #0
	bl ov12_02266B78
	cmp r0, #1
	bne _0226BFCE
	ldr r0, _0226BFD4 ; =0x000005DD
	bl PlaySE
	mov r0, #4
	ldrsh r0, [r4, r0]
	add sp, #8
	add r0, r0, #1
	strh r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0226BFB0:
	mov r0, #6
	ldrsh r1, [r4, r0]
	add r1, r1, #1
	strh r1, [r4, #6]
	ldrsh r0, [r4, r0]
	cmp r0, #8
	ble _0226BFCE
	ldr r0, [r4]
	mov r1, #0
	bl ov12_0223BFFC
	mov r0, #4
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #4]
_0226BFCE:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0226BFD4: .word 0x000005DD
	thumb_func_end ov12_0226BF04