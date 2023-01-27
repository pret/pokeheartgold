	.include "asm/macros.inc"
	.include "unk_02025C44.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02025C44
sub_02025C44: ; 0x02025C44
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl NNS_G2dInitRenderer
	add r5, #0x80
	str r4, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02025C44

	thumb_func_start sub_02025C54
sub_02025C54: ; 0x02025C54
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl NNS_G2dInitRenderSurface
	add r2, r5, #0
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	str r6, [r5, #0x28]
	ldr r0, [sp, #0x18]
	str r7, [r5, #0x2c]
	str r0, [r5, #0x34]
	ldr r0, [sp, #0x1c]
	str r0, [r5, #0x14]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	beq _02025C84
	add r1, r5, #0
	bl NNS_G2dAddRendererTargetSurface
_02025C84:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02025C54

	thumb_func_start sub_02025C88
sub_02025C88: ; 0x02025C88
	add r3, r0, #0
	add r2, r1, #0
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025C88

	thumb_func_start sub_02025C98
sub_02025C98: ; 0x02025C98
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x60
	add r5, r1, #0
	add r6, r2, #0
	ldr r4, [r5, #0x10]
	ldr r3, [r6]
	add r2, r0, #0
	sub r3, r4, r3
	ldrh r1, [r0, #2]
	mov r0, #0x3f
	str r3, [sp, #0x18]
	and r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1a
	ldr r4, [r5, #0x14]
	ldr r3, [r6, #4]
	add r2, #8
	sub r3, r4, r3
	str r3, [sp, #0x14]
	asr r3, r1, #0xb
	mov r1, #1
	and r1, r3
	lsr r0, r0, #0x18
	cmp r1, #1
	bne _02025CEC
	mov r0, #6
	ldrsh r0, [r2, r0]
	lsl r4, r0, #0xc
	mov r0, #2
	ldrsh r0, [r2, r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	mov r0, #4
	ldrsh r0, [r2, r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	mov r0, #0
	ldrsh r0, [r2, r0]
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	b _02025CF8
_02025CEC:
	neg r1, r0
	lsl r0, r0, #0xc
	lsl r4, r1, #0xc
	str r0, [sp, #0x10]
	str r4, [sp, #0xc]
	str r0, [sp, #8]
_02025CF8:
	ldr r0, [r5, #0xc]
	str r0, [sp, #0x1c]
	asr r0, r0, #0x1f
	str r0, [sp, #0x20]
	asr r0, r4, #0x1f
	str r0, [sp, #0x24]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x28]
	asr r0, r0, #0x1f
	str r0, [sp, #0x2c]
	ldr r2, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	add r0, r4, #0
	bl _ll_mul
	add r7, r1, #0
	str r0, [sp, #0x30]
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	add r0, r4, #0
	bl _ll_mul
	add r2, r0, #0
	add r3, r1, #0
	mov r0, #2
	ldr r1, [sp, #0x30]
	mov r4, #0
	lsl r0, r0, #0xa
	add r0, r1, r0
	adc r7, r4
	lsl r1, r7, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	mov r1, #2
	lsl r1, r1, #0xa
	add r2, r2, r1
	adc r3, r4
	lsl r1, r3, #0x14
	lsr r2, r2, #0xc
	orr r2, r1
	add r1, r0, r2
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x28]
	add r0, r0, r1
	str r0, [sp, #0x5c]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x2c]
	asr r0, r0, #0x1f
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x34]
	bl _ll_mul
	str r0, [sp, #0x38]
	add r4, r1, #0
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x34]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	bl _ll_mul
	mov r2, #2
	ldr r3, [sp, #0x38]
	lsl r2, r2, #0xa
	add r2, r3, r2
	ldr r3, _02025E84 ; =0x00000000
	adc r4, r3
	lsl r3, r4, #0x14
	lsr r2, r2, #0xc
	orr r2, r3
	mov r3, #2
	lsl r3, r3, #0xa
	add r3, r0, r3
	ldr r0, _02025E84 ; =0x00000000
	adc r1, r0
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	ldr r0, [sp, #0x14]
	add r1, r2, r1
	add r4, r0, r1
	ldr r0, [r5, #8]
	str r0, [sp, #0x3c]
	asr r0, r0, #0x1f
	str r0, [sp, #0x40]
	ldr r0, [sp, #0xc]
	asr r0, r0, #0x1f
	str r0, [sp, #0x44]
	ldr r0, [r5]
	ldr r1, [sp, #0x44]
	str r0, [sp, #0x48]
	asr r0, r0, #0x1f
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0xc]
	ldr r2, [sp, #0x48]
	ldr r3, [sp, #0x4c]
	bl _ll_mul
	str r0, [sp, #0x50]
	add r5, r1, #0
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x3c]
	ldr r3, [sp, #0x40]
	bl _ll_mul
	mov r2, #2
	ldr r3, [sp, #0x50]
	lsl r2, r2, #0xa
	add r2, r3, r2
	ldr r3, _02025E84 ; =0x00000000
	adc r5, r3
	lsl r3, r5, #0x14
	lsr r2, r2, #0xc
	orr r2, r3
	mov r3, #2
	lsl r3, r3, #0xa
	add r3, r0, r3
	ldr r0, _02025E84 ; =0x00000000
	adc r1, r0
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	ldr r0, [sp, #0x18]
	add r1, r2, r1
	add r5, r0, r1
	ldr r0, [sp, #8]
	asr r0, r0, #0x1f
	str r0, [sp, #0x54]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x48]
	ldr r3, [sp, #0x4c]
	bl _ll_mul
	str r0, [sp, #0x58]
	str r1, [sp, #4]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x3c]
	ldr r3, [sp, #0x40]
	bl _ll_mul
	mov ip, r0
	add r2, r1, #0
	mov r0, #2
	ldr r1, [sp, #0x58]
	lsl r0, r0, #0xa
	add r3, r1, r0
	ldr r1, [sp, #4]
	ldr r0, _02025E84 ; =0x00000000
	adc r1, r0
	str r1, [sp, #4]
	lsl r0, r1, #0x14
	lsr r1, r3, #0xc
	orr r1, r0
	mov r0, #2
	lsl r0, r0, #0xa
	mov r3, ip
	add r0, r3, r0
	ldr r3, _02025E84 ; =0x00000000
	adc r2, r3
	lsl r2, r2, #0x14
	lsr r0, r0, #0xc
	orr r0, r2
	add r1, r1, r0
	ldr r0, [sp, #0x18]
	add r0, r0, r1
	ldr r1, [sp, #0x5c]
	cmp r4, r1
	bge _02025E58
	add r1, r4, #0
	ldr r4, [sp, #0x5c]
	str r1, [sp, #0x5c]
_02025E58:
	cmp r0, r5
	bge _02025E62
	add r1, r0, #0
	add r0, r5, #0
	add r5, r1, #0
_02025E62:
	cmp r4, #0
	ble _02025E7E
	ldr r2, [r6, #0xc]
	ldr r1, [sp, #0x5c]
	cmp r1, r2
	bge _02025E7E
	cmp r0, #0
	ble _02025E7E
	ldr r0, [r6, #8]
	cmp r5, r0
	bge _02025E7E
	add sp, #0x60
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02025E7E:
	mov r0, #0
	add sp, #0x60
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02025E84: .word 0x00000000
	thumb_func_end sub_02025C98
