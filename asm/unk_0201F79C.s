	.include "asm/macros.inc"
	.include "unk_0201F79C.inc"
	.include "global.inc"

	.public NNS_G3dGlb
    .public NNS_G3dGlb

	.text

	thumb_func_start sub_0201F79C
sub_0201F79C: ; 0x0201F79C
	str r0, [r1]
	add r0, r0, #4
	str r0, [r1, #8]
	str r0, [r1, #4]
	mov r0, #0
	str r0, [r1, #0xc]
	str r0, [r1, #0x10]
	str r0, [r1, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0201F79C

	thumb_func_start sub_0201F7B0
sub_0201F7B0: ; 0x0201F7B0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5]
	mov r7, #0
	cmp r0, #0
	ble _0201F7DE
	add r4, r7, #0
	add r6, r7, #0
_0201F7C0:
	ldr r1, [r5, #0x24]
	add r0, r5, #0
	add r1, r1, r4
	bl sub_0201F79C
	ldr r0, [r5, #0x24]
	add r7, r7, #1
	add r1, r0, r4
	ldr r0, [r5, #0x20]
	add r4, #0x1c
	str r1, [r0, r6]
	ldrh r0, [r5]
	add r6, r6, #4
	cmp r7, r0
	blt _0201F7C0
_0201F7DE:
	mov r0, #0
	strh r0, [r5, #2]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0201F7B0

	thumb_func_start sub_0201F7E4
sub_0201F7E4: ; 0x0201F7E4
	ldrh r3, [r0, #2]
	ldrh r1, [r0]
	cmp r3, r1
	bne _0201F7F0
	mov r0, #0
	bx lr
_0201F7F0:
	ldr r2, [r0, #0x20]
	lsl r1, r3, #2
	ldr r2, [r2, r1]
	add r1, r3, #1
	strh r1, [r0, #2]
	add r0, r2, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0201F7E4

	thumb_func_start sub_0201F800
sub_0201F800: ; 0x0201F800
	ldrh r2, [r0, #2]
	cmp r2, #0
	bne _0201F80A
	mov r0, #0
	bx lr
_0201F80A:
	str r0, [r1]
	add r2, r0, #4
	str r2, [r1, #8]
	str r2, [r1, #4]
	mov r2, #0
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r1, #0x14]
	ldrh r2, [r0, #2]
	sub r2, r2, #1
	strh r2, [r0, #2]
	ldr r2, [r0, #0x20]
	ldrh r0, [r0, #2]
	lsl r0, r0, #2
	str r1, [r2, r0]
	mov r0, #1
	bx lr
	thumb_func_end sub_0201F800

	thumb_func_start sub_0201F82C
sub_0201F82C: ; 0x0201F82C
	lsl r0, r0, #5
	add r0, #0x34
	bx lr
	.balign 4, 0
	thumb_func_end sub_0201F82C

	thumb_func_start sub_0201F834
sub_0201F834: ; 0x0201F834
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bne _0201F840
	bl GF_AssertFail
_0201F840:
	add r1, r4, #0
	add r1, #0x34
	lsl r0, r5, #2
	str r1, [r4, #0x20]
	add r0, r1, r0
	str r0, [r4, #0x24]
	strh r5, [r4]
	mov r0, #0
	strh r0, [r4, #2]
	str r0, [r4, #0x28]
	add r0, r4, #0
	bl sub_0201F860
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0201F834

	thumb_func_start sub_0201F860
sub_0201F860: ; 0x0201F860
	push {r4, lr}
	add r4, r0, #0
	bl sub_0201F7B0
	str r4, [r4, #4]
	add r0, r4, #4
	str r0, [r4, #0xc]
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [r4, #0xc]
	str r0, [r4, #0x2c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0201F860

	thumb_func_start sub_0201F880
sub_0201F880: ; 0x0201F880
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	cmp r0, #0
	bne _0201F8BC
	ldr r1, [r5, #0xc]
	add r4, r5, #4
	str r1, [r5, #0x2c]
	cmp r1, r4
	beq _0201F8B8
	mov r6, #0
_0201F896:
	ldr r0, [r1, #8]
	str r0, [r5, #0x30]
	ldr r0, [r5, #0x2c]
	ldr r1, [r0, #0x18]
	cmp r1, #0
	bne _0201F8AE
	ldr r2, [r0, #0x14]
	cmp r2, #0
	beq _0201F8B0
	ldr r1, [r0, #0x10]
	blx r2
	b _0201F8B0
_0201F8AE:
	str r6, [r0, #0x18]
_0201F8B0:
	ldr r1, [r5, #0x30]
	str r1, [r5, #0x2c]
	cmp r1, r4
	bne _0201F896
_0201F8B8:
	mov r0, #0
	str r0, [r1, #0x14]
_0201F8BC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0201F880

	thumb_func_start sub_0201F8C0
sub_0201F8C0: ; 0x0201F8C0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r5, #1
	str r5, [r4, #0x28]
	bl sub_0201F8D4
	mov r1, #0
	str r1, [r4, #0x28]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0201F8C0

	thumb_func_start sub_0201F8D4
sub_0201F8D4: ; 0x0201F8D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	bl sub_0201F7E4
	cmp r0, #0
	bne _0201F8EA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0201F8EA:
	str r4, [r0, #0xc]
	str r7, [r0, #0x10]
	str r6, [r0, #0x14]
	ldr r2, [r5, #0x2c]
	ldr r1, [r2, #0x14]
	cmp r1, #0
	beq _0201F90A
	ldr r1, [r2, #0xc]
	cmp r1, r4
	bhi _0201F904
	mov r1, #1
	str r1, [r0, #0x18]
	b _0201F90E
_0201F904:
	mov r1, #0
	str r1, [r0, #0x18]
	b _0201F90E
_0201F90A:
	mov r1, #0
	str r1, [r0, #0x18]
_0201F90E:
	ldr r3, [r5, #0xc]
	add r2, r5, #4
	cmp r3, r2
	beq _0201F93A
	ldr r4, [r0, #0xc]
_0201F918:
	ldr r1, [r3, #0xc]
	cmp r1, r4
	bls _0201F934
	ldr r1, [r3, #4]
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r1, [r3, #4]
	str r0, [r1, #8]
	str r0, [r3, #4]
	ldr r1, [r5, #0x30]
	cmp r3, r1
	bne _0201F952
	str r0, [r5, #0x30]
	pop {r3, r4, r5, r6, r7, pc}
_0201F934:
	ldr r3, [r3, #8]
	cmp r3, r2
	bne _0201F918
_0201F93A:
	ldr r2, [r5, #0x30]
	add r1, r5, #4
	cmp r2, r1
	bne _0201F944
	str r0, [r5, #0x30]
_0201F944:
	ldr r1, [r5, #8]
	str r1, [r0, #4]
	add r1, r5, #4
	str r1, [r0, #8]
	ldr r1, [r5, #8]
	str r0, [r1, #8]
	str r0, [r5, #8]
_0201F952:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0201F8D4

	thumb_func_start sub_0201F954
sub_0201F954: ; 0x0201F954
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0201F962
	bl GF_AssertFail
_0201F962:
	ldr r1, [r4]
	ldr r0, [r1, #0x30]
	cmp r0, r4
	bne _0201F96E
	ldr r0, [r4, #8]
	str r0, [r1, #0x30]
_0201F96E:
	ldr r1, [r4, #8]
	ldr r0, [r4, #4]
	str r1, [r0, #8]
	ldr r1, [r4, #4]
	ldr r0, [r4, #8]
	str r1, [r0, #4]
	ldr r0, [r4]
	add r1, r4, #0
	bl sub_0201F800
	pop {r4, pc}
	thumb_func_end sub_0201F954

	thumb_func_start sub_0201F984
sub_0201F984: ; 0x0201F984
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end sub_0201F984

	thumb_func_start sub_0201F988
sub_0201F988: ; 0x0201F988
	ldr r0, [r0, #0x10]
	bx lr
	thumb_func_end sub_0201F988

	thumb_func_start sub_0201F98C
sub_0201F98C: ; 0x0201F98C
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_0201F98C

	thumb_func_start sub_0201F990
sub_0201F990: ; 0x0201F990
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r6, r1, #0
	add r4, r0, #0
	add r5, r2, #0
	ldmia r6!, {r0, r1}
	add r2, sp, #0x1c
	stmia r2!, {r0, r1}
	ldr r0, [r6]
	add r7, r3, #0
	str r0, [r2]
	cmp r4, #0
	beq _0201F9AE
	add r4, #0x14
	b _0201F9B0
_0201F9AE:
	mov r4, #0
_0201F9B0:
	mov r0, #0x20
	ldrsh r0, [r4, r0]
	mov r1, #0x1a
	mov r2, #0x1c
	str r0, [sp]
	mov r0, #0x22
	ldrsh r0, [r4, r0]
	mov r3, #0x1e
	str r0, [sp, #4]
	add r0, sp, #0x28
	str r0, [sp, #8]
	mov r0, #0x18
	ldrsh r0, [r4, r0]
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	bl sub_0201FAA4
	add r0, sp, #0x1c
	bl NNS_G3dGlbSetBaseTrans
	ldr r1, _0201FA2C ; =NNS_G3dGlb + 0xBC
	add r0, r5, #0
	bl MI_Copy36B
	ldr r1, _0201FA30 ; =NNS_G3dGlb + 0x80
	mov r0, #0xa4
	ldr r2, [r1, #0x7c]
	bic r2, r0
	add r0, r7, #0
	str r2, [r1, #0x7c]
	bl NNS_G3dGlbSetBaseScale
	bl NNS_G3dGlbFlushP
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	ldr r0, [r4, #0x24]
	add r1, sp, #0x10
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	mov r0, #0x1b
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
	add r0, sp, #0x28
	bl sub_0201FAC8
	add r4, r0, #0
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #0xc
	str r2, [sp, #0xc]
	bl NNS_G3dGeBufferOP_N
	add r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0201FA2C: .word NNS_G3dGlb + 0xBC
_0201FA30: .word NNS_G3dGlb + 0x80
	thumb_func_end sub_0201F990

	thumb_func_start sub_0201FA34
sub_0201FA34: ; 0x0201FA34
	push {r3, r4, r5, lr}
	sub sp, #0x28
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #2
	ldrsh r0, [r4, r0]
	str r0, [sp]
	mov r0, #4
	ldrsh r0, [r4, r0]
	str r0, [sp, #4]
	add r0, sp, #0x1c
	str r0, [sp, #8]
	mov r0, #0
	ldrsh r3, [r4, r0]
	add r1, r0, #0
	add r2, r0, #0
	bl sub_0201FAA4
	add r0, r5, #0
	bl NNS_G3dGlbSetBaseTrans
	bl NNS_G3dGlbFlushP
	mov r1, #0
	mov r0, #0x11
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	ldr r0, [r4, #0x10]
	lsl r2, r0, #0xc
	ldr r0, [r4, #0xc]
	lsl r1, r0, #0xc
	ldr r0, [r4, #8]
	lsl r0, r0, #0xc
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	str r2, [sp, #0x18]
	mov r0, #0x1b
	add r1, sp, #0x10
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
	add r0, sp, #0x1c
	bl sub_0201FAC8
	add r4, r0, #0
	mov r2, #1
	mov r0, #0x12
	add r1, sp, #0xc
	str r2, [sp, #0xc]
	bl NNS_G3dGeBufferOP_N
	add r0, r4, #0
	add sp, #0x28
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0201FA34

	thumb_func_start sub_0201FAA4
sub_0201FAA4: ; 0x0201FAA4
	push {r3, r4}
	ldr r4, [sp, #0x10]
	strh r0, [r4]
	strh r1, [r4, #2]
	ldr r1, _0201FAC4 ; =0xFFFFFFF8
	strh r2, [r4, #4]
	strh r3, [r4, #6]
	add r1, sp
	mov r0, #0x10
	ldrsh r0, [r1, r0]
	strh r0, [r4, #8]
	mov r0, #0x14
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0xa]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0201FAC4: .word 0xFFFFFFF8
	thumb_func_end sub_0201FAA4

	thumb_func_start sub_0201FAC8
sub_0201FAC8: ; 0x0201FAC8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, _0201FB18 ; =0x000030C1
	mov r2, #1
	str r0, [sp, #4]
	mov r0, #0x29
	add r1, sp, #4
	str r2, [sp, #8]
	bl NNS_G3dGeBufferOP_N
	mov r0, #0
	str r0, [sp]
	mov r0, #0x40
	add r1, sp, #0
	mov r2, #1
	bl NNS_G3dGeBufferOP_N
	mov r1, #0
	mov r0, #0x41
	add r2, r1, #0
	bl NNS_G3dGeBufferOP_N
	mov r0, #0x70
	add r1, r4, #0
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
	bl NNS_G3dGeFlushBuffer
	add r4, sp, #8
_0201FB06:
	add r0, r4, #0
	bl G3X_GetBoxTestResult
	cmp r0, #0
	bne _0201FB06
	ldr r0, [sp, #8]
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_0201FB18: .word 0x000030C1
	thumb_func_end sub_0201FAC8
