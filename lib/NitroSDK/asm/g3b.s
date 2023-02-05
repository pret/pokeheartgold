	.include "asm/macros.inc"
	.include "g3b.inc"
	.include "global.inc"

	.text

	arm_func_start G3BS_LoadMtx44
G3BS_LoadMtx44: ; 0x020CF1E4
	mov r3, r0
	ldr r0, [r3]
	mov r2, #0x16
	str r2, [r0]
	mov r0, r1
	ldr ip, _020CF204 ; =MI_Copy64B
	ldr r1, [r3, #4]
	bx ip
	.align 2, 0
_020CF204: .word MI_Copy64B
	arm_func_end G3BS_LoadMtx44

	arm_func_start G3B_PushMtx
G3B_PushMtx: ; 0x020CF208
	ldr r1, [r0]
	mov r2, #0x11
	str r2, [r1]
	ldr r1, [r0, #4]
	str r1, [r0]
	add r1, r1, #4
	str r1, [r0, #4]
	bx lr
	arm_func_end G3B_PushMtx

	arm_func_start G3B_PopMtx
G3B_PopMtx: ; 0x020CF228
	ldr r2, [r0]
	mov r3, #0x12
	str r3, [r2]
	ldr r2, [r0, #4]
	str r1, [r2]
	ldr r1, [r0, #4]
	add r1, r1, #4
	str r1, [r0]
	add r1, r1, #4
	str r1, [r0, #4]
	bx lr
	arm_func_end G3B_PopMtx

	arm_func_start G3B_LoadMtx44
G3B_LoadMtx44: ; 0x020CF254
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl G3BS_LoadMtx44
	ldr r0, [r4, #4]
	add r0, r0, #0x40
	str r0, [r4]
	add r0, r0, #4
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	arm_func_end G3B_LoadMtx44

	arm_func_start G3B_Color
G3B_Color: ; 0x020CF278
	ldr r2, [r0]
	mov r3, #0x20
	str r3, [r2]
	ldr r2, [r0, #4]
	str r1, [r2]
	ldr r1, [r0, #4]
	add r1, r1, #4
	str r1, [r0]
	add r1, r1, #4
	str r1, [r0, #4]
	bx lr
	arm_func_end G3B_Color

	arm_func_start G3B_Normal
G3B_Normal: ; 0x020CF2A4
	stmdb sp!, {r4, lr}
	mov r4, #0x21
	ldr lr, [r0]
	rsb ip, r4, #0x420
	str r4, [lr]
	mov lr, r3, asr #3
	and r3, ip, r1, asr #3
	mov r2, r2, asr #3
	mov r1, r2, lsl #0x16
	orr r2, r3, r1, lsr #12
	mov ip, lr, lsl #0x16
	ldr r1, [r0, #4]
	orr r2, r2, ip, lsr #2
	str r2, [r1]
	ldr r1, [r0, #4]
	add r1, r1, #4
	str r1, [r0]
	add r1, r1, #4
	str r1, [r0, #4]
	ldmia sp!, {r4, pc}
	arm_func_end G3B_Normal

	arm_func_start G3B_Vtx
G3B_Vtx: ; 0x020CF2F4
	stmdb sp!, {r3, lr}
	ldr ip, [r0]
	mov r2, r2, lsl #0x10
	mov lr, #0x23
	str lr, [ip]
	mov r2, r2, lsr #0x10
	mov ip, r2, lsl #0x10
	mov r2, r3, lsl #0x10
	mov r1, r1, lsl #0x10
	ldr r3, [r0, #4]
	orr r1, ip, r1, lsr #16
	str r1, [r3]
	ldr r1, [r0, #4]
	mov r2, r2, lsr #0x10
	str r2, [r1, #4]
	ldr r1, [r0, #4]
	add r1, r1, #8
	str r1, [r0]
	add r1, r1, #4
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	arm_func_end G3B_Vtx

	arm_func_start G3B_PolygonAttr
G3B_PolygonAttr: ; 0x020CF348
	orr r1, r1, r2, lsl #4
	ldr r2, [r0]
	mov ip, #0x29
	str ip, [r2]
	orr r1, r1, r3, lsl #6
	ldr r2, [sp, #8]
	ldr r3, [sp]
	orr r1, r2, r1
	orr r2, r1, r3, lsl #24
	ldr ip, [sp, #4]
	ldr r1, [r0, #4]
	orr r2, r2, ip, lsl #16
	str r2, [r1]
	ldr r1, [r0, #4]
	add r1, r1, #4
	str r1, [r0]
	add r1, r1, #4
	str r1, [r0, #4]
	bx lr
	arm_func_end G3B_PolygonAttr

	arm_func_start G3B_MaterialColorDiffAmb
G3B_MaterialColorDiffAmb: ; 0x020CF394
	stmdb sp!, {r3, lr}
	ldr ip, [r0]
	mov lr, #0x30
	cmp r3, #0
	movne r3, #1
	str lr, [ip]
	orr r2, r1, r2, lsl #16
	moveq r3, #0
	ldr r1, [r0, #4]
	orr r2, r2, r3, lsl #15
	str r2, [r1]
	ldr r1, [r0, #4]
	add r1, r1, #4
	str r1, [r0]
	add r1, r1, #4
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	arm_func_end G3B_MaterialColorDiffAmb

	arm_func_start G3B_MaterialColorSpecEmi
G3B_MaterialColorSpecEmi: ; 0x020CF3D8
	stmdb sp!, {r3, lr}
	ldr ip, [r0]
	mov lr, #0x31
	cmp r3, #0
	movne r3, #1
	str lr, [ip]
	orr r2, r1, r2, lsl #16
	moveq r3, #0
	ldr r1, [r0, #4]
	orr r2, r2, r3, lsl #15
	str r2, [r1]
	ldr r1, [r0, #4]
	add r1, r1, #4
	str r1, [r0]
	add r1, r1, #4
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	arm_func_end G3B_MaterialColorSpecEmi

	arm_func_start G3B_LightVector
G3B_LightVector: ; 0x020CF41C
	stmdb sp!, {r3, r4, r5, lr}
	ldrsh lr, [sp, #0x10]
	ldr ip, _020CF474 ; =0x000003FF
	mov r3, r3, asr #3
	and ip, ip, r2, asr #3
	mov r2, r3, lsl #0x16
	mov lr, lr, asr #3
	ldr r4, [r0]
	mov r5, #0x32
	str r5, [r4]
	mov r3, lr, lsl #0x16
	orr r2, ip, r2, lsr #12
	orr r3, r2, r3, lsr #2
	ldr r2, [r0, #4]
	orr r1, r3, r1, lsl #30
	str r1, [r2]
	ldr r1, [r0, #4]
	add r1, r1, #4
	str r1, [r0]
	add r1, r1, #4
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020CF474: .word 0x000003FF
	arm_func_end G3B_LightVector

	arm_func_start G3B_LightColor
G3B_LightColor: ; 0x020CF478
	ldr r3, [r0]
	mov ip, #0x33
	str ip, [r3]
	ldr r3, [r0, #4]
	orr r1, r2, r1, lsl #30
	str r1, [r3]
	ldr r1, [r0, #4]
	add r1, r1, #4
	str r1, [r0]
	add r1, r1, #4
	str r1, [r0, #4]
	bx lr
	arm_func_end G3B_LightColor

	arm_func_start G3B_Begin
G3B_Begin: ; 0x020CF4A8
	ldr r2, [r0]
	mov r3, #0x40
	str r3, [r2]
	ldr r2, [r0, #4]
	str r1, [r2]
	ldr r1, [r0, #4]
	add r1, r1, #4
	str r1, [r0]
	add r1, r1, #4
	str r1, [r0, #4]
	bx lr
	arm_func_end G3B_Begin

	arm_func_start G3B_End
G3B_End: ; 0x020CF4D4
	ldr r1, [r0]
	mov r2, #0x41
	str r2, [r1]
	ldr r1, [r0, #4]
	str r1, [r0]
	add r1, r1, #4
	str r1, [r0, #4]
	bx lr
	arm_func_end G3B_End
