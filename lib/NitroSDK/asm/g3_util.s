	.include "asm/macros.inc"
	.include "g3_util.inc"
	.include "global.inc"

	.public G3_LoadMtx44

	.text

	arm_func_start G3i_OrthoW_
G3i_OrthoW_: ; 0x020CFB08
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x50
	ldr ip, [sp, #0x58]
	ldr lr, [sp, #0x5c]
	str ip, [sp]
	ldr r4, [sp, #0x68]
	ldr ip, [sp, #0x60]
	str lr, [sp, #4]
	cmp r4, #0
	addeq r4, sp, #0x10
	str ip, [sp, #8]
	str r4, [sp, #0xc]
	bl MTX_OrthoW
	ldr r0, [sp, #0x64]
	cmp r0, #0
	addeq sp, sp, #0x50
	ldmeqia sp!, {r4, pc}
	ldr r1, _020CFB68 ; =0x04000440
	mov r2, #0
	mov r0, r4
	str r2, [r1]
	bl G3_LoadMtx44
	add sp, sp, #0x50
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CFB68: .word 0x04000440
	arm_func_end G3i_OrthoW_

	arm_func_start G3i_LookAt_
G3i_LookAt_: ; 0x020CFB6C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x30
	ldr r4, [sp, #0x40]
	mov r5, r3
	cmp r4, #0
	addeq r4, sp, #0
	mov r3, r4
	bl MTX_LookAt
	cmp r5, #0
	addeq sp, sp, #0x30
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _020CFBB4 ; =0x04000440
	mov r2, #2
	mov r0, r4
	str r2, [r1]
	bl G3_LoadMtx43
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020CFBB4: .word 0x04000440
	arm_func_end G3i_LookAt_

	arm_func_start G3_RotX
G3_RotX: ; 0x020CFBB8
	ldr r3, _020CFBF0 ; =0x04000468
	mov r2, #0x1000
	str r2, [r3]
	mov r2, #0
	str r2, [r3]
	str r2, [r3]
	str r2, [r3]
	str r1, [r3]
	str r0, [r3]
	str r2, [r3]
	rsb r0, r0, #0
	str r0, [r3]
	str r1, [r3]
	bx lr
	.align 2, 0
_020CFBF0: .word 0x04000468
	arm_func_end G3_RotX

	arm_func_start G3_RotY
G3_RotY: ; 0x020CFBF4
	ldr ip, _020CFC2C ; =0x04000468
	mov r3, #0
	str r1, [ip]
	str r3, [ip]
	rsb r2, r0, #0
	str r2, [ip]
	str r3, [ip]
	mov r2, #0x1000
	str r2, [ip]
	str r3, [ip]
	str r0, [ip]
	str r3, [ip]
	str r1, [ip]
	bx lr
	.align 2, 0
_020CFC2C: .word 0x04000468
	arm_func_end G3_RotY

	arm_func_start G3_RotZ
G3_RotZ: ; 0x020CFC30
	ldr r3, _020CFC68 ; =0x04000468
	mov r2, #0
	str r1, [r3]
	str r0, [r3]
	str r2, [r3]
	rsb r0, r0, #0
	str r0, [r3]
	str r1, [r3]
	str r2, [r3]
	str r2, [r3]
	str r2, [r3]
	mov r0, #0x1000
	str r0, [r3]
	bx lr
	.align 2, 0
_020CFC68: .word 0x04000468
	arm_func_end G3_RotZ
