	.include "asm/macros.inc"
	.include "unk_0201F990.inc"
	.include "global.inc"

	.public NNS_G3dGlb
	.extern SysTaskQueue_InitTask
	.extern SysTaskQueue_InitHeap
	.extern SysTaskQueue_CreateTask
	.extern SysTaskQueue_DeleteTask

	.text

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
