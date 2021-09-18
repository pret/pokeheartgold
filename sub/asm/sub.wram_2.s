	.include "asm/macros.inc"
	.include "global.inc"

	.text

	arm_func_start sub_03800920
sub_03800920: ; 0x03800920
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	ldr r1, _03800A20 ; =0x03808E30
	mov r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	bne _03800A14
	ldr r0, _03800A24 ; =0x03808E34
	mov r2, #0
	str r2, [r0]
	mov r3, #1
	mov r2, #5
	strh r3, [r1]
	str r2, [r0, #4]
	bl sub_03800DFC
	bl sub_03803860
	bl sub_038022E8
	bl sub_03801944
	bl PXI_Init
	ldr r1, _03800A28 ; =sub_03800D94
	mov r0, #6
	bl PXI_SetFifoRecvCallback
	ldr r1, _03800A28 ; =sub_03800D94
	mov r0, #9
	bl PXI_SetFifoRecvCallback
	ldr r1, _03800A28 ; =sub_03800D94
	mov r0, #8
	bl PXI_SetFifoRecvCallback
	ldr r1, _03800A28 ; =sub_03800D94
	mov r0, #4
	bl PXI_SetFifoRecvCallback
	ldr r0, _03800A2C ; =0x038090E0
	ldr r1, _03800A30 ; =0x03809100
	mov r2, #0x10
	bl OS_InitMessageQueue
	mov sb, #0
	mov r6, #0x18
	ldr r8, _03800A34 ; =0x03809140
	mov r7, sb
	mov r5, r6
_038009C0:
	mla r0, sb, r5, r8
	mov r1, r7
	mov r2, r6
	bl sub_037FB07C
	add sb, sb, #1
	cmp sb, #0x10
	blt _038009C0
	ldr r0, _03800A24 ; =0x03808E34
	mov r2, #0
	str r2, [r0, #0x48c]
	str r2, [r0, #0x494]
	str r2, [r0, #0x490]
	mov r0, #0x200
	str r0, [sp]
	ldr r0, _03800A38 ; =0x03808E3C
	ldr r1, _03800A3C ; =sub_03800D28
	ldr r3, _03800A2C ; =0x038090E0
	str r4, [sp, #4]
	bl OS_CreateThread
	ldr r0, _03800A38 ; =0x03808E3C
	bl OS_WakeupThreadDirect
_03800A14:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03800A20: .word 0x03808E30
_03800A24: .word 0x03808E34
_03800A28: .word sub_03800D94
_03800A2C: .word 0x038090E0
_03800A30: .word 0x03809100
_03800A34: .word 0x03809140
_03800A38: .word 0x03808E3C
_03800A3C: .word sub_03800D28
	arm_func_end sub_03800920

	arm_func_start sub_03800A40
sub_03800A40: ; 0x03800A40
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _03800A94 ; =0x038092C4
	ldr r4, _03800A98 ; =0x03808E34
	mov r6, r0
_03800A50:
	bl OS_DisableInterrupts
	ldr r1, [r4]
	cmp r1, #0
	beq _03800A70
	bl OS_RestoreInterrupts
	mov r0, r5
	bl OS_SleepThread
	b _03800A50
_03800A70:
	ldr r1, _03800A98 ; =0x03808E34
	mov r2, #1
	str r2, [r1]
	mov r2, #4
	str r2, [r1, #4]
	str r6, [r1, #0x498]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03800A94: .word 0x038092C4
_03800A98: .word 0x03808E34
	arm_func_end sub_03800A40

	arm_func_start sub_03800A9C
sub_03800A9C: ; 0x03800A9C
	stmdb sp!, {r3, lr}
	ldr r1, _03800AF4 ; =0x03808E34
	ldr r2, [r1]
	cmp r2, #0
	beq _03800AEC
	ldr r2, [r1, #4]
	cmp r2, #4
	ldreq r1, [r1, #0x498]
	cmpeq r1, r0
	bne _03800AEC
	bl OS_DisableInterrupts
	ldr r1, _03800AF4 ; =0x03808E34
	mov r2, #5
	str r2, [r1, #4]
	mov r2, #0
	str r2, [r1]
	str r2, [r1, #0x498]
	bl OS_RestoreInterrupts
	ldr r0, _03800AF8 ; =0x038092C4
	bl OS_WakeupThread
_03800AEC:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03800AF4: .word 0x03808E34
_03800AF8: .word 0x038092C4
	arm_func_end sub_03800A9C

	arm_func_start sub_03800AFC
sub_03800AFC: ; 0x03800AFC
	stmdb sp!, {r4, r5, r6, lr}
	and r2, r0, #0x70
	cmp r2, #0x30
	bgt _03800B34
	bge _03800B80
	cmp r2, #0x10
	bgt _03800B28
	bge _03800B68
	cmp r2, #0
	beq _03800B68
	b _03800B84
_03800B28:
	cmp r2, #0x20
	beq _03800B80
	b _03800B84
_03800B34:
	cmp r2, #0x50
	bgt _03800B4C
	bge _03800B70
	cmp r2, #0x40
	beq _03800B70
	b _03800B84
_03800B4C:
	cmp r2, #0x60
	bgt _03800B5C
	beq _03800B78
	b _03800B84
_03800B5C:
	cmp r2, #0x70
	beq _03800B78
	b _03800B84
_03800B68:
	mov r4, #6
	b _03800B84
_03800B70:
	mov r4, #9
	b _03800B84
_03800B78:
	mov r4, #8
	b _03800B84
_03800B80:
	mov r4, #4
_03800B84:
	and r0, r0, #0xff
	orr r0, r0, #0x80
	mov r0, r0, lsl #8
	orr r2, r0, #0x3000000
	and r0, r1, #0xff
	orr r6, r2, r0
	mov r5, #0
_03800BA0:
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl sub_037FB3A4
	cmp r0, #0
	blt _03800BA0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_03800AFC

	arm_func_start sub_03800BC0
sub_03800BC0: ; 0x03800BC0
	ldr r0, _03800BD8 ; =0x03808E34
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	.align 2, 0
_03800BD8: .word 0x03808E34
	arm_func_end sub_03800BC0

	arm_func_start sub_03800BDC
sub_03800BDC: ; 0x03800BDC
	ldr r1, _03800BF0 ; =0x03808E34
	mov r2, #1
	str r2, [r1]
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_03800BF0: .word 0x03808E34
	arm_func_end sub_03800BDC

	arm_func_start sub_03800BF4
sub_03800BF4: ; 0x03800BF4
	stmdb sp!, {r3, lr}
	ldr r1, _03800C28 ; =0x03808E34
	ldr r2, [r1, #4]
	cmp r2, r0
	bne _03800C20
	ldr r0, _03800C2C ; =0x038092C4
	mov r2, #5
	str r2, [r1, #4]
	mov r2, #0
	str r2, [r1]
	bl OS_WakeupThread
_03800C20:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03800C28: .word 0x03808E34
_03800C2C: .word 0x038092C4
	arm_func_end sub_03800BF4

	arm_func_start sub_03800C30
sub_03800C30: ; 0x03800C30
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	ldrh r2, [sp, #0x18]
	mov r5, r0
	cmp r2, #4
	mov r4, r1
	movhi r0, #0
	bhi _03800CEC
	bl OS_DisableInterrupts
	ldr ip, _03800CF8 ; =0x03808E34
	add r2, sp, #0x18
	ldr r3, [ip, #0x48c]
	mov r1, #0x18
	mul r6, r3, r1
	ldr lr, _03800CFC ; =0x03809140
	ldr r3, _03800D00 ; =0x03809144
	str r5, [lr, r6]
	ldr r5, [ip, #0x48c]
	bic r2, r2, #3
	mul lr, r5, r1
	add r5, r2, #4
	ldrh r1, [sp, #0x18]
	str r4, [r3, lr]
	mov r6, #0
	mov r2, #0x18
	b _03800CB4
_03800C98:
	ldr r4, [ip, #0x48c]
	add r5, r5, #4
	mla r3, r4, r2, ip
	add r3, r3, r6, lsl #2
	ldr r4, [r5, #-4]
	add r6, r6, #1
	str r4, [r3, #0x314]
_03800CB4:
	cmp r6, r1
	blt _03800C98
	ldr r1, _03800CF8 ; =0x03808E34
	ldr r4, [r1, #0x48c]
	add r2, r4, #1
	and r2, r2, #0xf
	str r2, [r1, #0x48c]
	bl OS_RestoreInterrupts
	ldr r1, _03800CFC ; =0x03809140
	mov r0, #0x18
	mla r1, r4, r0, r1
	ldr r0, _03800D04 ; =0x038090E0
	mov r2, #0
	bl OS_SendMessage
_03800CEC:
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_03800CF8: .word 0x03808E34
_03800CFC: .word 0x03809140
_03800D00: .word 0x03809144
_03800D04: .word 0x038090E0
	arm_func_end sub_03800C30

	arm_func_start sub_03800D08
sub_03800D08: ; 0x03800D08
	stmdb sp!, {r3, lr}
	ldr r0, _03800D24 ; =0x038090E0
	add r1, sp, #0
	mov r2, #0
	bl OS_ReadMessage
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03800D24: .word 0x038090E0
	arm_func_end sub_03800D08

	arm_func_start sub_03800D28
sub_03800D28: ; 0x03800D28
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r6, _03800D90 ; =0x038090E0
	add r5, sp, #0
	mov r4, #1
_03800D3C:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl OS_ReceiveMessage
	ldr r0, [sp]
	ldr r1, [r0]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	b _03800D3C
_03800D60: ; jump table
	b _03800D70 ; case 0
	b _03800D88 ; case 1
	b _03800D78 ; case 2
	b _03800D80 ; case 3
_03800D70:
	bl sub_038010E4
	b _03800D3C
_03800D78:
	bl sub_0380269C
	b _03800D3C
_03800D80:
	bl sub_03801B3C
	b _03800D3C
_03800D88:
	bl sub_03803A30
	b _03800D3C
	.align 2, 0
_03800D90: .word 0x038090E0
	arm_func_end sub_03800D28

	arm_func_start sub_03800D94
sub_03800D94: ; 0x03800D94
	stmdb sp!, {r3, lr}
	cmp r2, #0
	bne _03800DF4
	sub r0, r0, #4
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _03800DF4
_03800DB0: ; jump table
	b _03800DEC ; case 0
	b _03800DF4 ; case 1
	b _03800DC8 ; case 2
	b _03800DF4 ; case 3
	b _03800DE0 ; case 4
	b _03800DD4 ; case 5
_03800DC8:
	mov r0, r1
	bl sub_03800F04
	b _03800DF4
_03800DD4:
	mov r0, r1
	bl sub_03802330
	b _03800DF4
_03800DE0:
	mov r0, r1
	bl sub_03801980
	b _03800DF4
_03800DEC:
	mov r0, r1
	bl sub_03803888
_03800DF4:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_03800D94

	arm_func_start sub_03800DFC
sub_03800DFC: ; 0x03800DFC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r0, _03800EC4 ; =0x038092D4
	mov r3, #0
	str r3, [r0, #0x20]
	mov r1, #0x14
	str r1, [r0, #0x24]
	str r1, [r0, #0x28]
	mov r2, r3
_03800E1C:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _03800E1C
	bl sub_037FA7BC
	cmp r0, #0
	bne _03800E40
	bl sub_037FA770
_03800E40:
	ldr r7, _03800EC8 ; =0x03809300
	ldr r5, _03800ECC ; =0x54505641
	mov r8, #0
	mov r4, #0x28
_03800E50:
	mul r6, r8, r4
	add r0, r7, r6
	bl sub_037FA8A8
	mov r1, r5
	add r0, r7, r6
	bl sub_037FAA38
	add r8, r8, #1
	cmp r8, #4
	blt _03800E50
	ldr r2, _03800ED0 ; =0x040001C0
_03800E78:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03800E78
	ldr r1, _03800ED4 ; =0x00008A01
	ldr r0, _03800ED8 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0x84
	strh r1, [r0]
	sub r1, r0, #2
_03800E9C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03800E9C
	bl sub_03800EE0
	ldr r1, _03800EDC ; =0x00008201
	ldr r0, _03800ED0 ; =0x040001C0
	strh r1, [r0]
	bl sub_03800EE0
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_03800EC4: .word 0x038092D4
_03800EC8: .word 0x03809300
_03800ECC: .word 0x54505641
_03800ED0: .word 0x040001C0
_03800ED4: .word 0x00008A01
_03800ED8: .word 0x040001C2
_03800EDC: .word 0x00008201
	arm_func_end sub_03800DFC

	arm_func_start sub_03800EE0
sub_03800EE0: ; 0x03800EE0
	ldr r0, _03800F00 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03800EF0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03800EF0
	bx lr
	.align 2, 0
_03800F00: .word 0x040001C2
	arm_func_end sub_03800EE0

	arm_func_start sub_03800F04
sub_03800F04: ; 0x03800F04
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	tst r0, #0x2000000
	beq _03800F34
	ldr r1, _038010DC ; =0x038092D4
	mov r4, #0
	mov r3, r4
_03800F20:
	mov r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _03800F20
_03800F34:
	ldr r2, _038010DC ; =0x038092D4
	and r1, r0, #0xf0000
	mov r1, r1, lsr #0x10
	mov r1, r1, lsl #1
	strh r0, [r2, r1]
	tst r0, #0x1000000
	beq _038010D0
	ldrh r1, [r2]
	and r0, r1, #0xff00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _038010C4
_03800F6C: ; jump table
	b _03800FB0 ; case 0
	b _03800FD8 ; case 1
	b _03801074 ; case 2
	b _03800F7C ; case 3
_03800F7C:
	and r0, r1, #0xff
	mov r0, r0, lsl #0x10
	movs r3, r0, lsr #0x10
	mov r0, #3
	bne _03800F9C
	mov r1, #2
	bl sub_03800AFC
	b _038010D0
_03800F9C:
	str r3, [r2, #0x24]
	mov r1, #0
	str r3, [r2, #0x28]
	bl sub_03800AFC
	b _038010D0
_03800FB0:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl sub_03800C30
	cmp r0, #0
	bne _038010D0
	mov r0, r4
	mov r1, #4
	bl sub_03800AFC
	b _038010D0
_03800FD8:
	ldr r0, [r2, #0x20]
	cmp r0, #0
	beq _03800FF4
	mov r0, r4
	mov r1, #3
	bl sub_03800AFC
	b _038010D0
_03800FF4:
	and r0, r1, #0xff
	mov r0, r0, lsl #0x10
	movs r3, r0, lsr #0x10
	beq _0380100C
	cmp r3, #4
	bls _0380101C
_0380100C:
	mov r0, r4
	mov r1, #2
	bl sub_03800AFC
	b _038010D0
_0380101C:
	ldrh ip, [r2, #2]
	ldr r0, _038010E0 ; =0x00000107
	cmp ip, r0
	blo _0380103C
	mov r0, r4
	mov r1, #2
	bl sub_03800AFC
	b _038010D0
_0380103C:
	mov r1, r4
	mov r0, #0
	mov r2, #2
	str ip, [sp]
	bl sub_03800C30
	cmp r0, #0
	ldrne r0, _038010DC ; =0x038092D4
	movne r1, #1
	strne r1, [r0, #0x20]
	bne _038010D0
	mov r0, r4
	mov r1, #4
	bl sub_03800AFC
	b _038010D0
_03801074:
	ldr r0, [r2, #0x20]
	cmp r0, #2
	beq _03801090
	mov r0, r4
	mov r1, #3
	bl sub_03800AFC
	b _038010D0
_03801090:
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl sub_03800C30
	cmp r0, #0
	ldrne r0, _038010DC ; =0x038092D4
	movne r1, #3
	strne r1, [r0, #0x20]
	bne _038010D0
	mov r0, r4
	mov r1, #4
	bl sub_03800AFC
	b _038010D0
_038010C4:
	mov r0, r4
	mov r1, #1
	bl sub_03800AFC
_038010D0:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_038010DC: .word 0x038092D4
_038010E0: .word 0x00000107
	arm_func_end sub_03800F04

	arm_func_start sub_038010E4
sub_038010E4: ; 0x038010E4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sl, r0
	ldr r1, [sl, #4]
	cmp r1, #2
	bhi _03801118
	cmp r1, #0
	beq _03801130
	cmp r1, #1
	beq _038012A4
	cmp r1, #2
	beq _03801368
	b _038013B4
_03801118:
	cmp r1, #0x10
	bne _038013B4
	ldr r0, _038013C0 ; =0x038092D4
	ldr r0, [r0, #0x20]
	cmp r0, #2
	bne _038013B4
_03801130:
	bl OS_DisableInterrupts
	mov r4, r0
	mov r0, #0
	bl sub_03800BC0
	cmp r0, #0
	bne _03801168
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r0, [sl, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	b _038013B4
_03801168:
	mov r0, #0
	bl sub_03800BDC
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r1, _038013C0 ; =0x038092D4
	add r0, sp, #8
	ldr r1, [r1, #0x24]
	add r2, sp, #4
	bl sub_0380174C
	ldr r0, [sp, #8]
	ldrh r2, [sp, #4]
	mov r1, r0, lsl #7
	movs r1, r1, lsr #0x1f
	ldreq r0, _038013C4 ; =0x038092D0
	moveq r1, #0
	streqb r1, [r0, #1]
	streqb r1, [r0]
	beq _03801250
	mov r0, r0, lsl #5
	movs r0, r0, lsr #0x1e
	beq _038011FC
	ldr r1, _038013C4 ; =0x038092D0
	mov r3, #0
	strb r3, [r1]
	ldrb r0, [r1, #1]
	add r2, r0, #1
	and r0, r2, #0xff
	strb r2, [r1, #1]
	cmp r0, #4
	blo _03801250
	ldr r0, _038013C0 ; =0x038092D4
	strb r3, [r1, #1]
	ldr r1, [r0, #0x24]
	cmp r1, #0x23
	addlt r1, r1, #1
	strlt r1, [r0, #0x24]
	b _03801250
_038011FC:
	ldr r0, _038013C0 ; =0x038092D4
	ldr r1, _038013C4 ; =0x038092D0
	ldr r4, [r0, #0x24]
	mov r5, #0
	strb r5, [r1, #1]
	cmp r2, r4, asr #1
	strgeb r5, [r1]
	bge _03801250
	ldrb r2, [r1]
	add r3, r2, #1
	and r2, r3, #0xff
	strb r3, [r1]
	cmp r2, #4
	blo _03801250
	strb r5, [r1]
	ldr r2, [r0, #0x28]
	cmp r4, r2
	subgt r3, r4, #1
	movgt r2, #3
	strgt r3, [r0, #0x24]
	strgtb r2, [r1, #1]
_03801250:
	ldrh r0, [sp, #8]
	ldr r1, _038013C8 ; =0x027FFFAA
	strh r0, [r1]
	ldrh r0, [sp, #0xa]
	strh r0, [r1, #2]
	ldr r0, [sl, #4]
	cmp r0, #0
	bne _03801284
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #0
	bl sub_03800AFC
	b _03801298
_03801284:
	ldr r1, [sl, #8]
	mov r0, r0, lsl #0x10
	and r1, r1, #0xff
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
_03801298:
	mov r0, #0
	bl sub_03800BF4
	b _038013B4
_038012A4:
	ldr r6, _038013C0 ; =0x038092D4
	ldr r0, [r6, #0x20]
	cmp r0, #1
	bne _03801354
	ldr r8, _038013CC ; =0x00000107
	ldr r5, _038013D0 ; =0x03809300
	mov sb, #0
	mov r7, #0xd7
	mov fp, #0xa
	mov r4, #0x28
	b _03801324
_038012D0:
	mul r0, sb, r8
	bl sub_03806468
	ldr r2, [sl, #0xc]
	mov r1, r8
	add r0, r2, r0
	bl sub_03806468
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #0xc8
	blo _03801300
	cmp r0, #0xd7
	movlo r0, r7
_03801300:
	add r1, r6, sb, lsl #1
	strh r0, [r1, #0xcc]
	str sb, [sp]
	mla r0, sb, r4, r5
	ldrsh r1, [r1, #0xcc]
	ldr r3, _038013D4 ; =sub_038013DC
	mov r2, fp
	bl sub_037FA94C
	add sb, sb, #1
_03801324:
	ldr r1, [sl, #8]
	cmp sb, r1
	blo _038012D0
	ldr r0, [sl, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	ldr r0, _038013C0 ; =0x038092D4
	mov r1, #2
	str r1, [r0, #0x20]
	b _038013B4
_03801354:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #3
	bl sub_03800AFC
	b _038013B4
_03801368:
	ldr r0, _038013C0 ; =0x038092D4
	ldr r0, [r0, #0x20]
	cmp r0, #3
	bne _038013A4
	ldr r0, _038013D8 ; =0x54505641
	bl sub_037FAAA8
	ldr r0, [sl, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	ldr r0, _038013C0 ; =0x038092D4
	mov r1, #0
	str r1, [r0, #0x20]
	b _038013B4
_038013A4:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #3
	bl sub_03800AFC
_038013B4:
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_038013C0: .word 0x038092D4
_038013C4: .word 0x038092D0
_038013C8: .word 0x027FFFAA
_038013CC: .word 0x00000107
_038013D0: .word 0x03809300
_038013D4: .word sub_038013DC
_038013D8: .word 0x54505641
	arm_func_end sub_038010E4

	arm_func_start sub_038013DC
sub_038013DC: ; 0x038013DC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r3, r4
	mov r0, #0
	mov r1, #0x10
	mov r2, #1
	bl sub_03800C30
	cmp r0, #0
	bne _03801434
	ldr r0, [sp]
	ldr r3, _03801440 ; =0x027FFFAA
	bic r0, r0, #0x6000000
	orr r0, r0, #0x6000000
	str r0, [sp]
	ldrh r0, [sp]
	ldrh r2, [sp, #2]
	strh r0, [r3]
	and r1, r4, #0xff
	mov r0, #0x10
	strh r2, [r3, #2]
	bl sub_03800AFC
_03801434:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_03801440: .word 0x027FFFAA
	arm_func_end sub_038013DC

	arm_func_start sub_03801444
sub_03801444: ; 0x03801444
	stmdb sp!, {r3, lr}
	mov r0, #0x8000
	bl sub_037FB53C
	ldr r2, _03801520 ; =0x040001C0
_03801454:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03801454
	ldr r1, _03801524 ; =0x00008A01
	ldr r0, _03801528 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0x84
	strh r1, [r0]
	sub r1, r0, #2
_03801478:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03801478
	bl sub_03801538
	ldr r1, _0380152C ; =0x00008201
	ldr r0, _03801520 ; =0x040001C0
	strh r1, [r0]
	bl sub_03801538
	ldr r0, _03801530 ; =0x038093A8
	ldrh r0, [r0]
	cmp r0, #0
	bne _038014C0
	ldr r0, _03801534 ; =0x04000136
	ldrh r0, [r0]
	tst r0, #0x40
	moveq r0, #1
	movne r0, #0
	b _03801518
_038014C0:
	ldr r2, _03801534 ; =0x04000136
	ldrh r0, [r2]
	tst r0, #0x40
	moveq r0, #1
	beq _03801518
	ldr r1, _03801524 ; =0x00008A01
	mov r0, #0x84
	strh r1, [r2, #0x8a]
	strh r0, [r2, #0x8c]
_038014E4:
	ldrh r0, [r2, #0x8a]
	tst r0, #0x80
	bne _038014E4
	bl sub_03801538
	ldr r1, _0380152C ; =0x00008201
	ldr r0, _03801520 ; =0x040001C0
	strh r1, [r0]
	bl sub_03801538
	ldr r0, _03801534 ; =0x04000136
	ldrh r0, [r0]
	tst r0, #0x40
	movne r0, #0
	moveq r0, #2
_03801518:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03801520: .word 0x040001C0
_03801524: .word 0x00008A01
_03801528: .word 0x040001C2
_0380152C: .word 0x00008201
_03801530: .word 0x038093A8
_03801534: .word 0x04000136
	arm_func_end sub_03801444

	arm_func_start sub_03801538
sub_03801538: ; 0x03801538
	ldr r0, _03801558 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03801548:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03801548
	bx lr
	.align 2, 0
_03801558: .word 0x040001C2
	arm_func_end sub_03801538

	arm_func_start sub_0380155C
sub_0380155C: ; 0x0380155C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	cmp r2, #0
	ldr r2, _03801738 ; =0x040001C0
	mov r5, r3
	moveq r3, #0xd1
	moveq r4, #1
	mov r7, r0
	mov r6, r1
	movne r3, #0x91
	movne r4, #2
_03801588:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03801588
	ldr r1, _0380173C ; =0x00008A01
	ldr r0, _03801740 ; =0x040001C2
	strh r1, [r2]
	and r2, r3, #0xff
	strh r2, [r0]
	sub r1, r0, #2
_038015AC:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _038015AC
	mov r0, r2, lsl #0x10
	ldr r2, _03801738 ; =0x040001C0
	mov ip, #0
	ldr r8, _03801744 ; =0x00007FF8
	add r1, sp, #0
	mov r0, r0, lsr #0x10
	mov r3, ip
_038015D4:
	strh r3, [r2, #2]
_038015D8:
	ldrh sb, [r2]
	tst sb, #0x80
	bne _038015D8
	ldrh sb, [r2, #2]
	and sb, sb, #0xff
	mov lr, sb, lsl #0x10
	mov sb, lr, lsr #8
	str sb, [r1, ip, lsl #2]
	strh r0, [r2, #2]
_038015FC:
	ldrh sb, [r2]
	tst sb, #0x80
	bne _038015FC
	ldrh lr, [r2, #2]
	ldr sb, [r1, ip, lsl #2]
	and lr, lr, #0xff
	mov lr, lr, lsl #0x10
	orr sb, sb, lr, lsr #16
	and lr, sb, r8
	mov lr, lr, asr #3
	str lr, [r1, ip, lsl #2]
	add ip, ip, #1
	cmp ip, #5
	blt _038015D4
	ldr r0, _03801748 ; =0x00008201
	strh r0, [r2]
	bl sub_03801538
	mov r8, #0
	mov sb, r8
	add r2, sp, #0
_0380164C:
	ldr r1, [r2, sb, lsl #2]
	add r3, sb, #1
	b _03801670
_03801658:
	ldr r0, [r2, r3, lsl #2]
	add r3, r3, #1
	subs r0, r1, r0
	rsbmi r0, r0, #0
	cmp r0, r8
	movgt r8, r0
_03801670:
	cmp r3, #5
	blt _03801658
	add sb, sb, #1
	cmp sb, #4
	blt _0380164C
	strh r8, [r5]
	mov r8, #0
	add r0, sp, #0
	b _03801708
_03801694:
	ldr r3, [r0, r8, lsl #2]
	add sb, r8, #1
	b _038016FC
_038016A0:
	ldr r2, [r0, sb, lsl #2]
	subs r1, r3, r2
	rsbmi r1, r1, #0
	cmp r1, r6
	bgt _038016F8
	add r1, sb, #1
	b _038016F0
_038016BC:
	ldr r5, [r0, r1, lsl #2]
	subs ip, r3, r5
	rsbmi ip, ip, #0
	cmp ip, r6
	bgt _038016EC
	add r0, r2, r3, lsl #1
	add r0, r5, r0
	mov r0, r0, asr #2
	bic r0, r0, #7
	strh r0, [r7]
	mov r0, #0
	b _0380172C
_038016EC:
	add r1, r1, #1
_038016F0:
	cmp r1, #5
	blt _038016BC
_038016F8:
	add sb, sb, #1
_038016FC:
	cmp sb, #4
	blt _038016A0
	add r8, r8, #1
_03801708:
	cmp r8, #3
	blt _03801694
	ldr r2, [sp]
	ldr r1, [sp, #0x10]
	mov r0, r4
	add r1, r2, r1
	mov r1, r1, asr #1
	bic r1, r1, #7
	strh r1, [r7]
_0380172C:
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03801738: .word 0x040001C0
_0380173C: .word 0x00008A01
_03801740: .word 0x040001C2
_03801744: .word 0x00007FF8
_03801748: .word 0x00008201
	arm_func_end sub_0380155C

	arm_func_start sub_0380174C
sub_0380174C: ; 0x0380174C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	movs r6, r1
	mov r5, r2
	mov r1, #0
	mov r7, r0
	strh r1, [r5]
	rsbmi r6, r6, #0
	bl sub_03801444
	movs r4, r0
	bne _038017B4
	ldr r1, [r7]
	mov r0, #0x1000
	rsb r0, r0, #0
	and r1, r1, r0
	ldr r0, _03801930 ; =0xFF000FFF
	and r0, r1, r0
	bic r1, r0, #0x1000000
	bic r0, r1, #0x6000000
	str r1, [r7]
	orr r1, r0, #0x6000000
	str r1, [r7]
	ldr r0, _03801934 ; =0x038093A8
	mov r1, #0
	strh r1, [r0]
	b _03801924
_038017B4:
	add r0, sp, #4
	add r3, sp, #2
	mov r1, r6
	mov r2, #0
	bl sub_0380155C
	ldr r1, [r7]
	mov r0, r0, lsl #0x1e
	bic r1, r1, #0x6000000
	orr ip, r1, r0, lsr #5
	str ip, [r7]
	mov r1, #0x1000
	rsb r1, r1, #0
	ldrh r2, [sp, #4]
	and ip, ip, r1
	and r1, r2, r1, lsr #20
	orr ip, ip, r1
	add r0, sp, #4
	add r3, sp, #0
	mov r1, r6
	mov r2, #1
	str ip, [r7]
	bl sub_0380155C
	cmp r0, #2
	bne _03801834
	ldr r1, [r7]
	mov r0, r1, lsl #5
	mov r0, r0, lsr #0x1e
	orr r0, r0, #2
	bic r1, r1, #0x6000000
	mov r0, r0, lsl #0x1e
	orr r0, r1, r0, lsr #5
	str r0, [r7]
_03801834:
	ldrh r1, [sp, #4]
	ldr r2, [r7]
	ldr r0, _03801930 ; =0xFF000FFF
	mov r1, r1, lsl #0x14
	and r0, r2, r0
	orr r2, r0, r1, lsr #8
	ldr r1, _03801938 ; =0x00008A01
	ldr r0, _0380193C ; =0x040001C0
	str r2, [r7]
	strh r1, [r0]
	mov r6, #0
_03801860:
	bl sub_03801538
	add r6, r6, #1
	cmp r6, #0xc
	blt _03801860
	ldr r1, _03801940 ; =0x00008201
	ldr r0, _0380193C ; =0x040001C0
	strh r1, [r0]
	bl sub_03801538
	cmp r4, #2
	ldreq r0, [r7]
	biceq r0, r0, #0x6000000
	orreq r0, r0, #0x6000000
	streq r0, [r7]
	bl sub_03801444
	cmp r0, #0
	beq _03801904
	cmp r0, #1
	beq _038018D4
	cmp r0, #2
	bne _03801920
	ldr r1, [r7]
	ldr r0, _03801934 ; =0x038093A8
	orr r2, r1, #0x1000000
	bic r1, r2, #0x6000000
	orr r1, r1, #0x6000000
	str r1, [r7]
	mov r1, #0
	strh r1, [r0]
	b _03801924
_038018D4:
	ldr r1, [r7]
	ldr r0, _03801934 ; =0x038093A8
	orr r1, r1, #0x1000000
	str r1, [r7]
	mov r2, #1
	ldrh r1, [sp]
	ldrh r3, [sp, #2]
	strh r2, [r0]
	cmp r3, r1
	movlo r3, r1
	strh r3, [r5]
	b _03801924
_03801904:
	ldr r1, [r7]
	ldr r0, _03801934 ; =0x038093A8
	bic r1, r1, #0x1000000
	str r1, [r7]
	mov r1, #0
	strh r1, [r0]
	b _03801924
_03801920:
	bl OS_Terminate
_03801924:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03801930: .word 0xFF000FFF
_03801934: .word 0x038093A8
_03801938: .word 0x00008A01
_0380193C: .word 0x040001C0
_03801940: .word 0x00008201
	arm_func_end sub_0380174C

	arm_func_start sub_03801944
sub_03801944: ; 0x03801944
	ldr r0, _03801978 ; =0x038093AC
	mov r1, #1
	str r1, [r0, #4]
	mov r3, #0
	str r3, [r0, #0x28]
	ldr r0, _0380197C ; =0x038093B4
	mov r2, r3
_03801960:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _03801960
	bx lr
	.align 2, 0
_03801978: .word 0x038093AC
_0380197C: .word 0x038093B4
	arm_func_end sub_03801944

	arm_func_start sub_03801980
sub_03801980: ; 0x03801980
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	tst r0, #0x2000000
	beq _038019B0
	ldr r1, _03801B34 ; =0x038093B4
	mov r4, #0
	mov r3, r4
_0380199C:
	mov r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _0380199C
_038019B0:
	ldr r1, _03801B34 ; =0x038093B4
	and r2, r0, #0xf0000
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _03801B28
	ldr r1, _03801B38 ; =0x038093AC
	ldrh r2, [r1, #8]
	and r0, r2, #0xff00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	sub r0, r4, #0x60
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _03801B1C
_038019F0: ; jump table
	b _03801A10 ; case 0
	b _03801A20 ; case 1
	b _03801B1C ; case 2
	b _03801AB8 ; case 3
	b _03801A54 ; case 4
	b _03801A88 ; case 5
	b _03801AEC ; case 6
	b _03801B04 ; case 7
_03801A10:
	mov r0, #0x60
	mov r1, #0
	bl sub_03800AFC
	b _03801B28
_03801A20:
	ldrh ip, [r1, #0xa]
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #3
	mov r2, #2
	str ip, [sp]
	bl sub_03800C30
	cmp r0, #0
	bne _03801B28
	mov r0, r4
	mov r1, #4
	bl sub_03800AFC
	b _03801B28
_03801A54:
	ldrh ip, [r1, #0xa]
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #3
	mov r2, #2
	str ip, [sp]
	bl sub_03800C30
	cmp r0, #0
	bne _03801B28
	mov r0, r4
	mov r1, #4
	bl sub_03800AFC
	b _03801B28
_03801A88:
	mov r0, r2, lsl #0x10
	mov r1, r4
	mov r3, r0, lsr #0x10
	mov r0, #3
	mov r2, #1
	bl sub_03800C30
	cmp r0, #0
	bne _03801B28
	mov r0, r4
	mov r1, #4
	bl sub_03800AFC
	b _03801B28
_03801AB8:
	ldrh r0, [r1, #0xa]
	mov r2, r2, lsl #0x18
	mov r1, r4
	orr r3, r0, r2, lsr #8
	mov r0, #3
	mov r2, #1
	bl sub_03800C30
	cmp r0, #0
	bne _03801B28
	mov r0, r4
	mov r1, #4
	bl sub_03800AFC
	b _03801B28
_03801AEC:
	and r0, r2, #0xff
	bl sub_038022BC
	mov r0, #0x66
	mov r1, #0
	bl sub_03800AFC
	b _03801B28
_03801B04:
	bl sub_038022D8
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	mov r0, #0x67
	bl sub_03800AFC
	b _03801B28
_03801B1C:
	mov r0, r4
	mov r1, #1
	bl sub_03800AFC
_03801B28:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	.align 2, 0
_03801B34: .word 0x038093B4
_03801B38: .word 0x038093AC
	arm_func_end sub_03801980

	arm_func_start sub_03801B3C
sub_03801B3C: ; 0x03801B3C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	mov r5, r0
	mov r0, #3
	bl sub_03800BC0
	cmp r0, #0
	bne _03801B7C
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, [r4, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	b _03801CA0
_03801B7C:
	mov r0, #3
	bl sub_03800BDC
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r1, [r4, #4]
	sub r0, r1, #0x61
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _03801C88
_03801BA0: ; jump table
	b _03801BB8 ; case 0
	b _03801C88 ; case 1
	b _03801C54 ; case 2
	b _03801BDC ; case 3
	b _03801C18 ; case 4
	b _03801C7C ; case 5
_03801BB8:
	ldr r0, _03801CA8 ; =0x038093AC
	mov r1, #1
	str r1, [r0, #0x28]
	ldr r1, [r4, #8]
	strh r1, [r0, #2]
	ldr r1, [r4, #0xc]
	strh r1, [r0]
	bl sub_03801FBC
	b _03801C98
_03801BDC:
	ldr r2, _03801CA8 ; =0x038093AC
	mov r0, #4
	str r0, [r2, #0x28]
	ldr r0, [r4, #8]
	str r0, [r2, #0x30]
	ldr r3, [r4, #0xc]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	and r1, r3, #0xff
	str r3, [r2, #0x2c]
	bl sub_03801CF0
	mov r0, #0x64
	mov r1, #0
	bl sub_03800AFC
	b _03801C98
_03801C18:
	ldr r1, _03801CA8 ; =0x038093AC
	mov r0, #3
	str r0, [r1, #0x28]
	ldr r2, [r4, #8]
	mov r0, r2, lsl #0x10
	mov r4, r0, lsr #0x10
	mov r0, r4
	str r2, [r1, #0x30]
	bl sub_03801D6C
	add r1, r4, #0x70
	mov r2, r1, lsl #0x10
	mov r1, r0
	mov r0, r2, lsr #0x10
	bl sub_03800AFC
	b _03801C98
_03801C54:
	ldr r1, _03801CA8 ; =0x038093AC
	mov r0, #2
	str r0, [r1, #0x28]
	ldr r0, [r4, #8]
	str r0, [r1, #0x2c]
	bl sub_03801E30
	mov r0, #0x63
	mov r1, #0
	bl sub_03800AFC
	b _03801C98
_03801C7C:
	ldr r0, [r4, #8]
	bl sub_03801F54
	b _03801C98
_03801C88:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #1
	bl sub_03800AFC
_03801C98:
	mov r0, #3
	bl sub_03800BF4
_03801CA0:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03801CA8: .word 0x038093AC
	arm_func_end sub_03801B3C

	arm_func_start sub_03801CAC
sub_03801CAC: ; 0x03801CAC
	stmdb sp!, {r4, r5, r6, lr}
	and r1, r1, #0x3f0000
	and r3, r0, #0x3c00000
	mov r1, r1, lsl #0x10
	mov r0, r2, lsl #0x10
	orr r1, r1, r3, lsl #22
	orr r6, r1, r0, lsr #16
	mov r5, #8
	mov r4, #0
_03801CD0:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	bne _03801CD0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_03801CAC

	arm_func_start sub_03801CF0
sub_03801CF0: ; 0x03801CF0
	stmdb sp!, {r4, lr}
	ldr r2, _03801D3C ; =0x040001C0
	mov r4, r1
_03801CFC:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03801CFC
	ldr r1, _03801D40 ; =0x00008202
	and r0, r0, #0xff
	strh r1, [r2]
	add r1, r1, #0x600
	strh r1, [r2]
	bl sub_03801D48
	ldr r2, _03801D44 ; =0x00008002
	ldr r1, _03801D3C ; =0x040001C0
	and r0, r4, #0xff
	strh r2, [r1]
	strh r0, [r1, #2]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03801D3C: .word 0x040001C0
_03801D40: .word 0x00008202
_03801D44: .word 0x00008002
	arm_func_end sub_03801CF0

	arm_func_start sub_03801D48
sub_03801D48: ; 0x03801D48
	ldr r1, _03801D68 ; =0x040001C2
	and r0, r0, #0xff
	strh r0, [r1]
	sub r1, r1, #2
_03801D58:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03801D58
	bx lr
	.align 2, 0
_03801D68: .word 0x040001C2
	arm_func_end sub_03801D48

	arm_func_start sub_03801D6C
sub_03801D6C: ; 0x03801D6C
	stmdb sp!, {r3, lr}
	ldr r2, _03801DD0 ; =0x040001C0
_03801D74:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03801D74
	ldr r1, _03801DD4 ; =0x00008202
	orr r0, r0, #0x80
	strh r1, [r2]
	add r1, r1, #0x600
	and r0, r0, #0xff
	strh r1, [r2]
	bl sub_03801D48
	ldr r2, _03801DD8 ; =0x00008002
	ldr r1, _03801DD0 ; =0x040001C0
	mov r0, #0
	strh r2, [r1]
	strh r0, [r1, #2]
_03801DB0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03801DB0
	ldr r0, _03801DDC ; =0x040001C2
	ldrh r0, [r0]
	and r0, r0, #0xff
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03801DD0: .word 0x040001C0
_03801DD4: .word 0x00008202
_03801DD8: .word 0x00008002
_03801DDC: .word 0x040001C2
	arm_func_end sub_03801D6C

	arm_func_start sub_03801DE0
sub_03801DE0: ; 0x03801DE0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	bl sub_03801D6C
	orr r1, r0, r4
	mov r0, #0
	bl sub_03801CF0
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03801DE0

	arm_func_start sub_03801E04
sub_03801E04: ; 0x03801E04
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	bl sub_03801D6C
	mvn r1, r4
	and r0, r0, r1
	and r1, r0, #0xff
	mov r0, #0
	bl sub_03801CF0
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03801E04

	arm_func_start sub_03801E30
sub_03801E30: ; 0x03801E30
	stmdb sp!, {r3, lr}
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _03801F4C
_03801E40: ; jump table
	b _03801F4C ; case 0
	b _03801E80 ; case 1
	b _03801E94 ; case 2
	b _03801EA8 ; case 3
	b _03801EBC ; case 4
	b _03801EC8 ; case 5
	b _03801ED4 ; case 6
	b _03801EE0 ; case 7
	b _03801EEC ; case 8
	b _03801EF8 ; case 9
	b _03801F04 ; case 10
	b _03801F10 ; case 11
	b _03801F1C ; case 12
	b _03801F28 ; case 13
	b _03801F40 ; case 14
	b _03801F34 ; case 15
_03801E80:
	mov r0, #1
	bl sub_038022BC
	mov r0, #1
	bl sub_03801F54
	b _03801F4C
_03801E94:
	mov r0, #3
	bl sub_038022BC
	mov r0, #3
	bl sub_03801F54
	b _03801F4C
_03801EA8:
	mov r0, #2
	bl sub_038022BC
	mov r0, #2
	bl sub_03801F54
	b _03801F4C
_03801EBC:
	mov r0, #4
	bl sub_03801DE0
	b _03801F4C
_03801EC8:
	mov r0, #4
	bl sub_03801E04
	b _03801F4C
_03801ED4:
	mov r0, #8
	bl sub_03801DE0
	b _03801F4C
_03801EE0:
	mov r0, #8
	bl sub_03801E04
	b _03801F4C
_03801EEC:
	mov r0, #0xc
	bl sub_03801DE0
	b _03801F4C
_03801EF8:
	mov r0, #0xc
	bl sub_03801E04
	b _03801F4C
_03801F04:
	mov r0, #1
	bl sub_03801DE0
	b _03801F4C
_03801F10:
	mov r0, #1
	bl sub_03801E04
	b _03801F4C
_03801F1C:
	mov r0, #2
	bl sub_03801E04
	b _03801F4C
_03801F28:
	mov r0, #2
	bl sub_03801DE0
	b _03801F4C
_03801F34:
	mov r0, #0x40
	bl sub_03801E04
	b _03801F4C
_03801F40:
	bl sub_037FB69C
	mov r0, #0x40
	bl sub_03801DE0
_03801F4C:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_03801E30

	arm_func_start sub_03801F54
sub_03801F54: ; 0x03801F54
	stmdb sp!, {r4, lr}
	mov r4, r0
	cmp r4, #1
	beq _03801F78
	cmp r4, #2
	beq _03801F90
	cmp r4, #3
	beq _03801F84
	b _03801FA4
_03801F78:
	mov r0, #0x10
	bl sub_03801E04
	b _03801FA8
_03801F84:
	mov r0, #0x30
	bl sub_03801DE0
	b _03801FA8
_03801F90:
	mov r0, #0x20
	bl sub_03801E04
	mov r0, #0x10
	bl sub_03801DE0
	b _03801FA8
_03801FA4:
	bl OS_Terminate
_03801FA8:
	ldr r0, _03801FB8 ; =0x03806B08
	str r4, [r0]
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03801FB8: .word 0x03806B08
	arm_func_end sub_03801F54

	arm_func_start sub_03801FBC
sub_03801FBC: ; 0x03801FBC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _03802178 ; =0x04000208
	mov r8, #0
	ldrh sb, [r0]
	strh r8, [r0]
	bl OS_DisableInterrupts
	mov r4, r0
	mvn r0, #0xfe000000
	bl OS_DisableIrqMask
	mov r5, r0
	mov r0, r8
	bl sub_03801D6C
	mov r6, r0
	mov r0, #2
	bl sub_038022BC
	mov r0, #2
	bl sub_03801F54
	mov r0, #2
	bl sub_03801F54
	bl sub_037FB69C
	mov r0, #1
	bl sub_03801E04
	ldr r0, _0380217C ; =0x038093AE
	ldrh r0, [r0]
	tst r0, #1
	beq _03802040
	ldr r0, _03802180 ; =0x038093AC
	ldr r1, _03802184 ; =0x04000132
	ldrh r2, [r0]
	mov r0, #0x1000
	orr r2, r2, #0x4000
	strh r2, [r1]
	bl OS_EnableIrqMask
_03802040:
	ldr r0, _0380217C ; =0x038093AE
	ldrh r0, [r0]
	tst r0, #4
	beq _03802058
	mov r0, #0x400000
	bl OS_EnableIrqMask
_03802058:
	ldr r0, _0380217C ; =0x038093AE
	ldrh r0, [r0]
	tst r0, #2
	beq _0380209C
	ldr r1, _03802188 ; =0x04000134
	mov r0, #0x8000
	ldrh r7, [r1]
	mov r8, #1
	bl sub_037FB53C
	mov r0, #0x40
	mov r1, #0
	bl sub_037FB51C
	mov r0, #0x100
	mov r1, r0
	bl sub_037FB51C
	mov r0, #0x80
	bl OS_EnableIrqMask
_0380209C:
	ldr r0, _0380217C ; =0x038093AE
	ldrh r0, [r0]
	tst r0, #8
	beq _038020B4
	mov r0, #0x100000
	bl OS_EnableIrqMask
_038020B4:
	ldr r0, _0380217C ; =0x038093AE
	ldrh r0, [r0]
	tst r0, #0x10
	beq _038020CC
	mov r0, #0x2000
	bl OS_EnableIrqMask
_038020CC:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r2, _03802178 ; =0x04000208
	mov r0, #1
	ldrh r1, [r2]
	strh r0, [r2]
	bl sub_03802190
	mov r1, r6
	mov r0, #0
	bl sub_03801CF0
	ldr r0, _0380217C ; =0x038093AE
	ldrh r1, [r0]
	tst r1, #0x20
	movne r0, #6
	moveq r0, #7
	tst r1, #0x40
	movne r6, #4
	moveq r6, #5
	bl sub_03801E30
	mov r0, r6
	bl sub_03801E30
	cmp r8, #0
	ldrne r0, _03802188 ; =0x04000134
	strneh r7, [r0]
	mov r0, #1
	bl sub_03801DE0
	bl sub_037FB6F4
	mov r1, #0
	ldr r3, _0380218C ; =0x038093B4
	mov r2, r1
	mov r0, #0x62
	str r1, [r3, #0x20]
	bl sub_03801CAC
	bl OS_DisableInterrupts
	mov r0, r5
	bl OS_SetIrqMask
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r1, _03802178 ; =0x04000208
	ldrh r0, [r1]
	strh sb, [r1]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bx lr
	.align 2, 0
_03802178: .word 0x04000208
_0380217C: .word 0x038093AE
_03802180: .word 0x038093AC
_03802184: .word 0x04000132
_03802188: .word 0x04000134
_0380218C: .word 0x038093B4
	arm_func_end sub_03801FBC

	arm_func_start sub_03802190
sub_03802190: ; 0x03802190
	ldr ip, _03802198 ; =SVC_Sleep
	bx ip
	.align 2, 0
_03802198: .word SVC_Sleep
	arm_func_end sub_03802190

	arm_func_start sub_0380219C
sub_0380219C: ; 0x0380219C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _038022B0 ; =0x038093E0
	ldr r3, [r1, #4]
	cmp r3, #0
	bne _038021D8
	mov r2, #1
	mov r3, r2
	mov r0, #3
	mov r1, #0x66
	bl sub_03800C30
	cmp r0, #0
	beq _038022A8
	mov r0, #1
	bl sub_038022BC
	b _038022A8
_038021D8:
	cmp r3, #4
	bge _03802204
	ldr r0, _038022B4 ; =0x03806B08
	ldr r0, [r0]
	cmp r3, r0
	beq _038022A8
	mov r0, #3
	mov r1, #0x66
	mov r2, #1
	bl sub_03800C30
	b _038022A8
_03802204:
	sub r2, r3, #4
	mov r0, #0xc
	mul r4, r2, r0
	ldr r5, _038022B8 ; =0x03806B0C
	ldr r0, [r1]
	add r6, r5, r4
	ldrh r1, [r6, #0xa]
	bl sub_03806468
	mov r1, #0
	mov r3, r1, lsr r0
	ldr ip, [r6, #4]
	mov r2, #-0x80000000
	rsb r1, r0, #0x20
	orr r3, r3, r2, lsl r1
	sub r1, r0, #0x20
	and ip, ip, r2, lsr r0
	orr r3, r3, r2, lsr r1
	ldr r0, [r5, r4]
	cmp ip, #0
	and r0, r0, r3
	cmpeq r0, #0
	movne r3, #1
	ldrh r2, [r6, #8]
	ldrh r1, [r6, #0xa]
	ldr r0, _038022B0 ; =0x038093E0
	mul r1, r2, r1
	ldr r2, [r0]
	moveq r3, #2
	add r2, r2, #1
	cmp r2, r1
	str r2, [r0]
	movhs r1, #0
	strhs r1, [r0]
	ldr r0, _038022B4 ; =0x03806B08
	ldr r0, [r0]
	cmp r3, r0
	beq _038022A8
	mov r0, #3
	mov r1, #0x66
	mov r2, #1
	bl sub_03800C30
_038022A8:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_038022B0: .word 0x038093E0
_038022B4: .word 0x03806B08
_038022B8: .word 0x03806B0C
	arm_func_end sub_0380219C

	arm_func_start sub_038022BC
sub_038022BC: ; 0x038022BC
	cmp r0, #0xf
	ldrle r1, _038022D4 ; =0x038093E0
	movle r2, #0
	strle r0, [r1, #4]
	strle r2, [r1]
	bx lr
	.align 2, 0
_038022D4: .word 0x038093E0
	arm_func_end sub_038022BC

	arm_func_start sub_038022D8
sub_038022D8: ; 0x038022D8
	ldr r0, _038022E4 ; =0x038093E0
	ldr r0, [r0, #4]
	bx lr
	.align 2, 0
_038022E4: .word 0x038093E0
	arm_func_end sub_038022D8

	arm_func_start sub_038022E8
sub_038022E8: ; 0x038022E8
	ldr r0, _03802324 ; =0x038093E8
	mov r3, #0
	str r3, [r0, #0x20]
	ldr r0, _03802328 ; =0x038093E8
	mov r2, r3
_038022FC:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _038022FC
	ldr r1, _0380232C ; =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bx lr
	.align 2, 0
_03802324: .word 0x038093E8
_03802328: .word 0x038093E8
_0380232C: .word 0x0400010E
	arm_func_end sub_038022E8

	arm_func_start sub_03802330
sub_03802330: ; 0x03802330
	stmdb sp!, {r4, lr}
	tst r0, #0x2000000
	beq _0380235C
	ldr r1, _038025E8 ; =0x038093E8
	mov r4, #0
	mov r3, r4
_03802348:
	mov r2, r4, lsl #1
	add r4, r4, #1
	strh r3, [r1, r2]
	cmp r4, #0x10
	blt _03802348
_0380235C:
	ldr r1, _038025E8 ; =0x038093E8
	and r2, r0, #0xf0000
	mov r2, r2, lsr #0x10
	mov r2, r2, lsl #1
	strh r0, [r1, r2]
	tst r0, #0x1000000
	beq _038025E0
	ldr r1, _038025EC ; =0x038093E8
	ldrh r2, [r1]
	and r0, r2, #0xff00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	sub r0, r4, #0x40
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _038025D4
_0380239C: ; jump table
	b _038023AC ; case 0
	b _038023E8 ; case 1
	b _038024EC ; case 2
	b _03802550 ; case 3
_038023AC:
	mov r1, r4
	and r3, r2, #0xff
	mov r0, #2
	mov r2, #1
	bl sub_03800C30
	cmp r0, #0
	bne _038023D4
	mov r0, r4
	mov r1, #4
	bl sub_03800AFC
_038023D4:
	ldr r0, _038025F0 ; =0x027FFF94
	mov r1, #0
	strh r1, [r0]
	str r1, [r0, #-4]
	b _038025E0
_038023E8:
	ldr r0, [r1, #0x20]
	cmp r0, #0
	beq _03802404
	mov r0, r4
	mov r1, #3
	bl sub_03800AFC
	b _038025E0
_03802404:
	and r0, r2, #0xff
	strh r0, [r1, #0x24]
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	orr r3, r0, r2, lsl #16
	cmp r3, #0x2000000
	blo _03802428
	cmp r3, #0x2400000
	blo _03802438
_03802428:
	mov r0, r4
	mov r1, #2
	bl sub_03800AFC
	b _038025E0
_03802438:
	str r3, [r1, #0x28]
	ldrh r2, [r1, #6]
	ldrh r0, [r1, #8]
	orr r2, r0, r2, lsl #16
	add r0, r3, r2
	cmp r0, #0x2400000
	bls _03802464
	mov r0, r4
	mov r1, #2
	bl sub_03800AFC
	b _038025E0
_03802464:
	str r2, [r1, #0x30]
	ldrh r2, [r1, #0xa]
	ldrh r0, [r1, #0xc]
	orr r0, r0, r2, lsl #16
	bl sub_038025F8
	cmp r0, #0
	bne _03802490
	mov r0, r4
	mov r1, #2
	bl sub_03800AFC
	b _038025E0
_03802490:
	ldr r3, _038025EC ; =0x038093E8
	mov r2, #0
	str r2, [r3, #0x2c]
	ldrh r0, [r3, #0x24]
	mov r1, r4
	and ip, r0, #7
	mov r0, #2
	strh ip, [r3, #0x26]
	bl sub_03800C30
	cmp r0, #0
	bne _038024CC
	mov r0, r4
	mov r1, #4
	bl sub_03800AFC
	b _038025E0
_038024CC:
	ldr r1, _038025F0 ; =0x027FFF94
	mov r2, #0
	strh r2, [r1]
	ldr r0, _038025EC ; =0x038093E8
	str r2, [r1, #-4]
	mov r1, #1
	str r1, [r0, #0x20]
	b _038025E0
_038024EC:
	ldr r0, [r1, #0x20]
	cmp r0, #2
	beq _03802508
	mov r0, r4
	mov r1, #3
	bl sub_03800AFC
	b _038025E0
_03802508:
	mov r1, r4
	mov r0, #2
	mov r2, #0
	bl sub_03800C30
	cmp r0, #0
	bne _03802530
	mov r0, r4
	mov r1, #4
	bl sub_03800AFC
	b _038025E0
_03802530:
	ldr r0, _038025EC ; =0x038093E8
	mov r2, #3
	ldr r1, _038025F4 ; =0x0400010E
	str r2, [r0, #0x20]
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	b _038025E0
_03802550:
	ldr r0, [r1, #0x20]
	cmp r0, #2
	beq _0380256C
	mov r0, r4
	mov r1, #3
	bl sub_03800AFC
	b _038025E0
_0380256C:
	ldrh r2, [r1, #2]
	ldrh r0, [r1, #4]
	orr r0, r0, r2, lsl #16
	bl sub_038025F8
	cmp r0, #0
	bne _03802594
	mov r0, r4
	mov r1, #2
	bl sub_03800AFC
	b _038025E0
_03802594:
	bl OS_DisableInterrupts
	ldr r3, _038025F4 ; =0x0400010E
	ldr r1, _038025EC ; =0x038093E8
	ldrh r2, [r3]
	bic r2, r2, #0x80
	strh r2, [r3]
	ldrh r2, [r1, #0x34]
	strh r2, [r3, #-2]
	ldrh r1, [r1, #0x36]
	orr r1, r1, #0xc0
	strh r1, [r3]
	bl OS_RestoreInterrupts
	mov r0, r4
	mov r1, #0
	bl sub_03800AFC
	b _038025E0
_038025D4:
	mov r0, r4
	mov r1, #1
	bl sub_03800AFC
_038025E0:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038025E8: .word 0x038093E8
_038025EC: .word 0x038093E8
_038025F0: .word 0x027FFF94
_038025F4: .word 0x0400010E
	arm_func_end sub_03802330

	arm_func_start sub_038025F8
sub_038025F8: ; 0x038025F8
	cmp r0, #0x10000
	bhs _0380261C
	ldr r1, _03802698 ; =0x038093E8
	mov r2, #0
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
_0380261C:
	cmp r0, #0x400000
	bhs _03802644
	ldr r1, _03802698 ; =0x038093E8
	mov r3, #1
	mov r0, r0, lsr #6
	rsb r2, r0, #0x10000
	strh r3, [r1, #0x36]
	mov r0, r3
	strh r2, [r1, #0x34]
	bx lr
_03802644:
	cmp r0, #0x1000000
	bhs _0380266C
	ldr r1, _03802698 ; =0x038093E8
	mov r2, #2
	mov r0, r0, lsr #8
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
_0380266C:
	cmp r0, #0x4000000
	movhs r0, #0
	bxhs lr
	ldr r1, _03802698 ; =0x038093E8
	mov r2, #3
	mov r0, r0, lsr #0xa
	strh r2, [r1, #0x36]
	rsb r0, r0, #0x10000
	strh r0, [r1, #0x34]
	mov r0, #1
	bx lr
	.align 2, 0
_03802698: .word 0x038093E8
	arm_func_end sub_038025F8

	arm_func_start sub_0380269C
sub_0380269C: ; 0x0380269C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r2, [r4, #4]
	cmp r2, #0x40
	beq _038026C4
	cmp r2, #0x41
	beq _03802774
	cmp r2, #0x42
	beq _0380280C
	b _038028A8
_038026C4:
	bl OS_DisableInterrupts
	mov r5, r0
	mov r0, #2
	bl sub_03800BC0
	cmp r0, #0
	bne _038026FC
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, [r4, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	b _038028A8
_038026FC:
	mov r0, #2
	bl sub_03800BDC
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, [r4, #8]
	and r0, r0, #1
	cmp r0, #1
	bne _03802730
	bl sub_03802BB4
	ldr r1, [r4, #8]
	tst r1, #2
	eorne r0, r0, #0x8000
	b _03802740
_03802730:
	bl sub_03802A60
	ldr r1, [r4, #8]
	tst r1, #2
	eorne r0, r0, #0x80
_03802740:
	ldr r1, _038028B0 ; =0x027FFF94
	movne r0, r0, lsl #0x10
	movne r0, r0, lsr #0x10
	strh r0, [r1]
	str r1, [r1, #-4]
	ldr r0, [r4, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	mov r0, #2
	bl sub_03800BF4
	b _038028A8
_03802774:
	ldr r0, _038028B4 ; =0x038093E8
	ldr r1, [r0, #0x20]
	cmp r1, #1
	bne _038027F8
	mov r1, #0
	strh r1, [r0, #0x3a]
	strh r1, [r0, #0x38]
	bl OS_DisableInterrupts
	mov r5, r0
	mov r0, #0x40
	bl OS_EnableIrqMask
	ldr r1, _038028B8 ; =sub_038028C4
	mov r0, #0x40
	bl sub_03802CE8
	bl sub_03802D10
	ldr r1, _038028B4 ; =0x038093E8
	ldr r2, _038028BC ; =0x0400010C
	ldrh r3, [r1, #0x34]
	mov r0, r5
	strh r3, [r2]
	ldrh r1, [r1, #0x36]
	orr r1, r1, #0xc0
	strh r1, [r2, #2]
	bl OS_RestoreInterrupts
	ldr r0, [r4, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	ldr r0, _038028B4 ; =0x038093E8
	mov r1, #2
	str r1, [r0, #0x20]
	b _038028A8
_038027F8:
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	mov r1, #3
	bl sub_03800AFC
	b _038028A8
_0380280C:
	ldr r0, _038028B4 ; =0x038093E8
	ldr r1, [r0, #0x20]
	sub r0, r1, #3
	cmp r0, #1
	bhi _03802888
	ldr r1, _038028C0 ; =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
	bl OS_DisableInterrupts
	mov r4, r0
	mov r0, #0x40
	mov r1, #0
	bl sub_03802CE8
	bl sub_03802D70
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r0, _038028B4 ; =0x038093E8
	mov r1, #0
	ldr r0, [r0, #0x20]
	cmp r0, #3
	bne _03802870
	mov r0, #0x42
	bl sub_03800AFC
	b _03802878
_03802870:
	mov r0, #0x51
	bl sub_03800AFC
_03802878:
	ldr r0, _038028B4 ; =0x038093E8
	mov r1, #0
	str r1, [r0, #0x20]
	b _038028A8
_03802888:
	cmp r1, #3
	mov r1, #3
	bne _038028A0
	mov r0, #0x42
	bl sub_03800AFC
	b _038028A8
_038028A0:
	mov r0, #0x51
	bl sub_03800AFC
_038028A8:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038028B0: .word 0x027FFF94
_038028B4: .word 0x038093E8
_038028B8: .word sub_038028C4
_038028BC: .word 0x0400010C
_038028C0: .word 0x0400010E
	arm_func_end sub_0380269C

	arm_func_start sub_038028C4
sub_038028C4: ; 0x038028C4
	stmdb sp!, {r3, lr}
	bl sub_038028F8
	ldr r3, _038028F0 ; =0x0380FFF8
	ldr r0, _038028F4 ; =0x04000214
	ldr r2, [r3]
	mov r1, #0x40
	orr r2, r2, #0x40
	str r2, [r3]
	str r1, [r0]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038028F0: .word 0x0380FFF8
_038028F4: .word 0x04000214
	arm_func_end sub_038028C4

	arm_func_start sub_038028F8
sub_038028F8: ; 0x038028F8
	stmdb sp!, {r4, r5, r6, r7, lr}
	ldr r4, _03802A50 ; =0x038093E8
	ldrh r5, [r4, #0x26]
	and r0, r5, #4
	cmp r0, #4
	ldrh r6, [r4, #0x38]
	ldrneh r7, [r4, #0x3a]
	ldreq r7, _03802A54 ; =0x0000FFFF
	bl sub_03800D08
	cmp r0, #0
	bne _03802964
	mov r0, #2
	bl sub_03800BC0
	cmp r0, #0
	beq _03802964
	and r0, r5, #1
	cmp r0, #1
	bne _03802954
	bl sub_03802BB4
	tst r5, #2
	moveq r7, r0
	eorne r7, r0, #0x8000
	b _03802964
_03802954:
	bl sub_03802A60
	tst r5, #2
	moveq r7, r0
	eorne r7, r0, #0x80
_03802964:
	and r0, r5, #1
	ldr r3, _03802A58 ; =0x027FFC00
	ldr r1, [r4, #0x2c]
	cmp r0, #1
	bne _03802994
	ldr r2, [r4, #0x28]
	strh r7, [r2, r1]!
	str r2, [r3, #0x390]
	add r3, r3, #0x394
	strh r7, [r3]
	add r1, r1, #2
	b _038029CC
_03802994:
	and r7, r7, #0xff
	tst r1, #1
	bne _038029AC
	mov r6, r7
	add r1, r1, #1
	b _038029CC
_038029AC:
	orr r0, r6, r7, lsl #8
	ldr r2, [r4, #0x28]
	sub r1, r1, #1
	strh r0, [r2, r1]!
	str r2, [r3, #0x390]
	add r3, r3, #0x394
	strh r0, [r3]
	add r1, r1, #2
_038029CC:
	strh r6, [r4, #0x38]
	strh r7, [r4, #0x3a]
	ldr r0, [r4, #0x30]
	cmp r1, r0
	movhs r1, #0
	str r1, [r4, #0x2c]
	blo _03802A48
	ldrh r0, [r4, #0x24]
	and r0, r0, #0x10
	cmp r0, #0x10
	bne _03802A08
	mov r0, #0x51
	mov r1, #0
	bl sub_03800AFC
	b _03802A48
_03802A08:
	mov r0, #2
	mov r1, #0x42
	mov r2, #0
	bl sub_03800C30
	cmp r0, #0
	bne _03802A30
	mov r0, #0x51
	mov r1, #4
	bl sub_03800AFC
	b _03802A48
_03802A30:
	mov r0, #4
	str r0, [r4, #0x20]
	ldr r1, _03802A5C ; =0x0400010E
	ldrh r0, [r1]
	bic r0, r0, #0x80
	strh r0, [r1]
_03802A48:
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03802A50: .word 0x038093E8
_03802A54: .word 0x0000FFFF
_03802A58: .word 0x027FFC00
_03802A5C: .word 0x0400010E
	arm_func_end sub_038028F8

	arm_func_start sub_03802A60
sub_03802A60: ; 0x03802A60
	stmdb sp!, {r4, lr}
	ldr r2, _03802B6C ; =0x040001C0
_03802A68:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03802A68
	ldr r1, _03802B70 ; =0x00008A01
	ldr r0, _03802B74 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0xec
	strh r1, [r0]
	sub r1, r0, #2
_03802A8C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03802A8C
	bl sub_03802B84
	ldr r2, _03802B78 ; =0x00008201
	ldr r1, _03802B6C ; =0x040001C0
	mov r4, r0, lsl #0x18
	strh r2, [r1]
	bl sub_03802B84
	ldr r2, _03802B7C ; =0x03809424
	ldr r1, _03802B80 ; =0x00007F80
	orr r0, r0, r4, lsr #16
	and r1, r0, r1
	ldr r0, [r2, #0x10]
	mov r1, r1, lsl #9
	add r3, r0, r1, lsr #16
	str r3, [r2, #0x10]
	ldr r0, [r2, #0xc]
	add r0, r0, #1
	str r0, [r2, #0xc]
	cmp r0, #0x1000
	blo _03802B3C
	ldrsb r4, [r2]
	mov r0, r3, lsr #0xc
	sub r0, r0, #0x80
	mov r0, r0, lsl #0x18
	cmp r4, r0, asr #24
	mov r0, r0, asr #0x18
	cmplt r4, #0xc
	addlt r0, r4, #1
	strltb r0, [r2]
	blt _03802B2C
	cmp r0, r4
	bge _03802B2C
	mvn r0, #0xb
	cmp r4, r0
	ldrgt r0, _03802B7C ; =0x03809424
	ldrgtsb r2, [r0]
	subgt r2, r2, #1
	strgtb r2, [r0]
_03802B2C:
	ldr r0, _03802B7C ; =0x03809424
	mov r2, #0
	str r2, [r0, #0xc]
	str r2, [r0, #0x10]
_03802B3C:
	ldr r0, _03802B7C ; =0x03809424
	ldrsb r0, [r0]
	rsb r0, r0, r1, lsr #16
	cmp r0, #0xff
	movgt r0, #0xff
	bgt _03802B5C
	cmp r0, #0
	movlt r0, #0
_03802B5C:
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03802B6C: .word 0x040001C0
_03802B70: .word 0x00008A01
_03802B74: .word 0x040001C2
_03802B78: .word 0x00008201
_03802B7C: .word 0x03809424
_03802B80: .word 0x00007F80
	arm_func_end sub_03802A60

	arm_func_start sub_03802B84
sub_03802B84: ; 0x03802B84
	ldr r0, _03802BB0 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03802B94:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03802B94
	ldr r0, _03802BB0 ; =0x040001C2
	ldrh r0, [r0]
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_03802BB0: .word 0x040001C2
	arm_func_end sub_03802B84

	arm_func_start sub_03802BB4
sub_03802BB4: ; 0x03802BB4
	stmdb sp!, {r4, lr}
	ldr r2, _03802CCC ; =0x040001C0
_03802BBC:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03802BBC
	ldr r1, _03802CD0 ; =0x00008A01
	ldr r0, _03802CD4 ; =0x040001C2
	strh r1, [r2]
	mov r1, #0xe4
	strh r1, [r0]
	sub r1, r0, #2
_03802BE0:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03802BE0
	bl sub_03802B84
	ldr r2, _03802CD8 ; =0x00008201
	ldr r1, _03802CCC ; =0x040001C0
	mov r4, r0, lsl #0x18
	strh r2, [r1]
	bl sub_03802B84
	ldr r3, _03802CDC ; =0x03809424
	ldr r1, _03802CE0 ; =0x00007FF8
	orr r0, r0, r4, lsr #16
	and r2, r0, r1
	ldr r0, [r3, #4]
	mov r2, r2, lsl #0x11
	add r4, r0, r2, lsr #16
	str r4, [r3, #4]
	ldr r0, [r3, #8]
	add r0, r0, #1
	str r0, [r3, #8]
	cmp r0, #0x100
	blo _03802C98
	mov r0, r1, lsl #1
	and r0, r0, r4, lsr #8
	ldrsh r4, [r3, #2]
	sub r0, r0, #0x8000
	mov r0, r0, lsl #0x10
	cmp r4, r0, asr #16
	mov r1, r0, asr #0x10
	cmplt r4, #0xc00
	addlt r0, r4, #0x10
	strlth r0, [r3, #2]
	blt _03802C88
	cmp r1, r4
	bge _03802C88
	mov r0, #0xc00
	rsb r0, r0, #0
	cmp r4, r0
	ldrgt r0, _03802CDC ; =0x03809424
	ldrgtsh r1, [r0, #2]
	subgt r1, r1, #0x10
	strgth r1, [r0, #2]
_03802C88:
	ldr r0, _03802CDC ; =0x03809424
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #4]
_03802C98:
	ldr r1, _03802CDC ; =0x03809424
	ldr r0, _03802CE4 ; =0x0000FFF0
	ldrsh r1, [r1, #2]
	rsb r1, r1, r2, lsr #16
	cmp r1, r0
	movgt r1, r0
	bgt _03802CBC
	cmp r1, #0
	movlt r1, #0
_03802CBC:
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03802CCC: .word 0x040001C0
_03802CD0: .word 0x00008A01
_03802CD4: .word 0x040001C2
_03802CD8: .word 0x00008201
_03802CDC: .word 0x03809424
_03802CE0: .word 0x00007FF8
_03802CE4: .word 0x0000FFF0
	arm_func_end sub_03802BB4

	arm_func_start sub_03802CE8
sub_03802CE8: ; 0x03802CE8
	ldr r2, _03802D0C ; =0x03806A88
	mov r3, #0
_03802CF0:
	tst r0, #1
	strne r1, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x19
	mov r0, r0, lsr #1
	blt _03802CF0
	bx lr
	.align 2, 0
_03802D0C: .word 0x03806A88
	arm_func_end sub_03802CE8

	arm_func_start sub_03802D10
sub_03802D10: ; 0x03802D10
	stmdb sp!, {r3, lr}
	ldr r3, _03802D64 ; =0x0380FFFC
	ldr r0, _03802D68 ; =sub_03802DB4
	ldr r2, [r3]
	cmp r2, r0
	beq _03802D5C
	ldr r0, _03802D6C ; =0x03809438
	mov r1, #0
	str r1, [r0]
	sub r1, r3, #0x17c
	str r1, [r0, #4]
	mov r1, #0x40
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bl OS_DisableInterrupts
	ldr r2, _03802D68 ; =sub_03802DB4
	ldr r1, _03802D64 ; =0x0380FFFC
	str r2, [r1]
	bl OS_RestoreInterrupts
_03802D5C:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03802D64: .word 0x0380FFFC
_03802D68: .word sub_03802DB4
_03802D6C: .word 0x03809438
	arm_func_end sub_03802D10

	arm_func_start sub_03802D70
sub_03802D70: ; 0x03802D70
	stmdb sp!, {r3, lr}
	ldr r1, _03802DA8 ; =0x0380FFFC
	ldr r0, _03802DAC ; =sub_03802DB4
	ldr r1, [r1]
	cmp r1, r0
	bne _03802DA0
	bl OS_DisableInterrupts
	ldr r1, _03802DB0 ; =0x03809438
	ldr r2, _03802DA8 ; =0x0380FFFC
	ldr r1, [r1, #0xc]
	str r1, [r2]
	bl OS_RestoreInterrupts
_03802DA0:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03802DA8: .word 0x0380FFFC
_03802DAC: .word sub_03802DB4
_03802DB0: .word 0x03809438
	arm_func_end sub_03802D70

	arm_func_start sub_03802DB4
sub_03802DB4: ; 0x03802DB4
	mov ip, #0x4000000
	add r1, ip, #0x208
	ldrh r0, [r1]
	tst r0, r0
	bxeq lr
	ldr r3, [ip, #0x210]
	ldr r1, [ip, #0x214]
	ands r2, r1, r3
	bxeq lr
	ldr r0, _03802F20 ; =0x01DF3FFF
	tst r2, r0
	streq r2, [ip, #0x214]
	bxeq lr
	stmdb sp!, {lr}
	mrs r0, spsr
	stmdb sp!, {r0}
	stmdb sp, {sp, lr} ^
	sub sp, sp, #8
	mov r0, #0x9f
	msr cpsr_c, r0
	ldr r1, _03802F24 ; =OSi_ThreadInfo
	ldrh r0, [r1, #2]
	add r0, r0, #1
	strh r0, [r1, #2]
	ldr r1, _03802F28 ; =0x03809438
	cmp r0, #1
	moveq r0, sp
	ldreq sp, [r1, #4]
	streq r0, [r1, #4]
	stmdb sp!, {r3}
	ldr r1, _03802F2C ; =0x038067A4
	ldr r0, [r1]
	tst r0, r2
	strne r0, [ip, #0x214]
	ldrne r0, [r1, #4]
	ldrne r3, _03802F30 ; =0x03806A88
	ldrne r0, [r3, r0, lsl #2]
	bne _03802E90
	mov r3, #1
_03802E50:
	ldr r0, [r1, r3, lsl #3]
	tst r0, r2
	addeq r3, r3, #1
	beq _03802E50
	str r0, [ip, #0x214]
	add r0, r1, r3, lsl #3
	ldr r2, [r0, #4]
	ldr r3, _03802F30 ; =0x03806A88
	ldr r0, [r3, r2, lsl #2]
	ldr r2, _03802F24 ; =OSi_ThreadInfo
	ldrh r3, [r2, #2]
	cmp r3, #1
	ldreq r2, [r1]
	streq r2, [ip, #0x210]
	moveq r2, #0x1f
	msreq cpsr_c, r2
_03802E90:
	ldr r1, [ip, #0x210]
	stmdb sp!, {r1}
	add lr, pc, #0x0 ; =sub_03802EA0
	bx r0
	arm_func_end sub_03802DB4

	arm_func_start sub_03802EA0
sub_03802EA0: ; 0x03802EA0
	mov r0, #0x9f
	msr cpsr_c, r0
	mov ip, #0x4000000
	ldmia sp!, {r0}
	ldr r1, [ip, #0x210]
	eor r2, r0, r1
	and r1, r2, r1
	and r0, r2, r0
	ldmia sp!, {r3}
	orr r3, r3, r1
	bic r3, r3, r0
	str r3, [ip, #0x210]
	ldr r2, _03802F24 ; =OSi_ThreadInfo
	ldr r3, _03802F28 ; =0x03809438
	ldrh r0, [r2, #2]
	subs r1, r0, #1
	strh r1, [r2, #2]
	moveq r0, sp
	ldreq sp, [r3, #4]
	streq r0, [r3, #4]
	mov r0, #0x92
	msr cpsr_c, r0
	ldmia sp, {sp, lr} ^
	mov r0, r0
	add sp, sp, #8
	ldmia sp!, {r0}
	msr spsr_fc, r0
	tst r1, r1
	ldreq r0, _03802F34 ; =sub_037F8538
	addeq lr, pc, #0x0 ; =0x03802F1C
	bxeq r0
	ldmia sp!, {pc}
	.align 2, 0
_03802F20: .word 0x01DF3FFF
_03802F24: .word OSi_ThreadInfo
_03802F28: .word 0x03809438
_03802F2C: .word 0x038067A4
_03802F30: .word 0x03806A88
	arm_func_end sub_03802EA0
_03802F34: .word sub_037F8538

	arm_func_start sub_03802F38
sub_03802F38: ; 0x03802F38
	stmdb sp!, {r3, lr}
	ldr r1, _03802F68 ; =0x0380944C
	mov r3, #0
	ldr r2, _03802F6C ; =0x05000001
	add r0, sp, #0
	str r3, [sp]
	bl sub_03802F74
	bl OS_GetLockID
	ldr r1, _03802F70 ; =0x03809448
	strh r0, [r1, #6]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03802F68: .word 0x0380944C
_03802F6C: .word 0x05000001
_03802F70: .word 0x03809448
	arm_func_end sub_03802F38

	arm_func_start sub_03802F74
sub_03802F74: ; 0x03802F74
	ldr ip, _03802F7C ; =SVC_CpuSet
	bx ip
	.align 2, 0
_03802F7C: .word SVC_CpuSet
	arm_func_end sub_03802F74

	arm_func_start sub_03802F80
sub_03802F80: ; 0x03802F80
	stmdb sp!, {r3, lr}
	ldr r2, _03802FC8 ; =0x027FFC30
	ldr r0, _03802FCC ; =0x0000FFFF
	ldrh r1, [r2]
	cmp r1, r0
	moveq r0, #0
	beq _03802FC0
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1e
	movs r0, r0, lsr #0x1f
	bne _03802FB0
	bl sub_03802FD0
_03802FB0:
	ldr r0, _03802FC8 ; =0x027FFC30
	ldrb r0, [r0, #5]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
_03802FC0:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03802FC8: .word 0x027FFC30
_03802FCC: .word 0x0000FFFF
	arm_func_end sub_03802F80

	arm_func_start sub_03802FD0
sub_03802FD0: ; 0x03802FD0
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	ldr r2, _038030E8 ; =0x027FFC30
	mov r4, #1
	ldrh r1, [r2]
	rsb r0, r4, #0x10000
	cmp r1, r0
	moveq r0, #0
	beq _038030DC
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
	cmp r0, #1
	moveq r0, #0
	beq _038030DC
	ldr r0, _038030EC ; =0x03809448
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl sub_03803170
	cmp r0, #0
	bne _03803034
	ldr r0, [sp, #0xc]
	bl OS_RestoreInterrupts
	mov r0, r4
	b _038030DC
_03803034:
	add r0, sp, #0
	bl sub_038030F4
	mov r0, #0x8000000
	ldrb r2, [r0, #0xb2]
	cmp r2, #0x96
	bne _03803060
	ldr r1, _038030E8 ; =0x027FFC30
	ldrh r0, [r0, #0xbe]
	ldrh r1, [r1]
	cmp r1, r0
	bne _038030A4
_03803060:
	cmp r2, #0x96
	ldrne r1, _038030E8 ; =0x027FFC30
	ldrne r0, _038030F0 ; =0x0801FFFE
	ldrneh r1, [r1]
	ldrneh r0, [r0]
	cmpne r1, r0
	bne _038030A4
	ldr r2, _038030E8 ; =0x027FFC30
	mov r0, #0x8000000
	ldr r1, [r2, #8]
	ldr r0, [r0, #0xac]
	cmp r1, r0
	beq _038030B8
	ldrb r0, [r2, #5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	beq _038030B8
_038030A4:
	ldr r1, _038030E8 ; =0x027FFC30
	mov r4, #0
	ldrb r0, [r1, #5]
	orr r0, r0, #2
	strb r0, [r1, #5]
_038030B8:
	ldr r0, [sp]
	bl sub_03803138
	ldr r0, [sp, #4]
	bl sub_03803154
	ldr r0, _038030EC ; =0x03809448
	add r1, sp, #8
	ldrh r0, [r0, #6]
	bl sub_038031C0
	mov r0, r4
_038030DC:
	add sp, sp, #0x10
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038030E8: .word 0x027FFC30
_038030EC: .word 0x03809448
_038030F0: .word 0x0801FFFE
	arm_func_end sub_03802FD0

	arm_func_start sub_038030F4
sub_038030F4: ; 0x038030F4
	stmdb sp!, {r3, lr}
	ldr r2, _03803134 ; =0x04000204
	ldrh r1, [r2]
	and r1, r1, #0xc
	mov r1, r1, asr #2
	str r1, [r0]
	ldrh r1, [r2]
	and r1, r1, #0x10
	mov r1, r1, asr #4
	str r1, [r0, #4]
	mov r0, #3
	bl sub_03803138
	mov r0, #0
	bl sub_03803154
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03803134: .word 0x04000204
	arm_func_end sub_038030F4

	arm_func_start sub_03803138
sub_03803138: ; 0x03803138
	ldr r2, _03803150 ; =0x04000204
	ldrh r1, [r2]
	bic r1, r1, #0xc
	orr r0, r1, r0, lsl #2
	strh r0, [r2]
	bx lr
	.align 2, 0
_03803150: .word 0x04000204
	arm_func_end sub_03803138

	arm_func_start sub_03803154
sub_03803154: ; 0x03803154
	ldr r2, _0380316C ; =0x04000204
	ldrh r1, [r2]
	bic r1, r1, #0x10
	orr r0, r1, r0, lsl #4
	strh r0, [r2]
	bx lr
	.align 2, 0
_0380316C: .word 0x04000204
	arm_func_end sub_03803154

	arm_func_start sub_03803170
sub_03803170: ; 0x03803170
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	bl OS_DisableInterrupts
	str r0, [r4, #4]
	ldr r0, _038031BC ; =0x027FFFE8
	bl OS_ReadOwnerOfLockWord
	ands r0, r0, #0x80
	str r0, [r4]
	bne _038031A8
	mov r0, r5
	bl OS_TryLockCartridge
	cmp r0, #0
	bne _038031B0
_038031A8:
	mov r0, #1
	b _038031B4
_038031B0:
	mov r0, #0
_038031B4:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038031BC: .word 0x027FFFE8
	arm_func_end sub_03803170

	arm_func_start sub_038031C0
sub_038031C0: ; 0x038031C0
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldr r1, [r4]
	cmp r1, #0
	bne _038031D8
	bl OS_UnLockCartridge
_038031D8:
	ldr r0, [r4, #4]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_038031C0

	arm_func_start sub_038031E8
sub_038031E8: ; 0x038031E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, #1
	mov r5, #0xd
	mov r4, #0
	b _03803208
_03803200:
	mov r0, r6
	bl VENEER_SVC_WaitByLoop
_03803208:
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	bne _03803200
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_038031E8

	arm_func_start CTRDG_Init
CTRDG_Init: ; 0x03803228
	stmdb sp!, {r3, lr}
	bl OS_InitTick
	bl OS_InitAlarm
	ldr r0, _038032B0 ; =0x03809480
	bl OS_CreateAlarm
	ldr r0, _038032B4 ; =0x03809450
	ldr r1, [r0, #0x14]
	cmp r1, #0
	bne _038032A8
	mov r1, #1
	str r1, [r0, #0x14]
	bl sub_03802F38
	bl OS_GetLockID
	mvn r1, #2
	cmp r0, r1
	beq _038032A8
	ldr r1, _038032B4 ; =0x03809450
	strh r0, [r1]
	bl PXI_Init
	ldr r1, _038032B8 ; =sub_0380343C
	mov r0, #0xd
	bl PXI_SetFifoRecvCallback
	bl sub_038032C8
	ldr r1, _038032BC ; =sub_0380346C
	mov r0, #0xd
	bl PXI_SetFifoRecvCallback
	ldr r1, _038032C0 ; =sub_038034A0
	mov r0, #0x10
	bl PXI_SetFifoRecvCallback
	ldr r1, _038032C4 ; =sub_038037E4
	mov r0, #0x11
	bl PXI_SetFifoRecvCallback
_038032A8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_038032B0: .word 0x03809480
_038032B4: .word 0x03809450
_038032B8: .word sub_0380343C
_038032BC: .word sub_0380346C
_038032C0: .word sub_038034A0
_038032C4: .word sub_038037E4
	arm_func_end CTRDG_Init

	arm_func_start sub_038032C8
sub_038032C8: ; 0x038032C8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _03803424 ; =0x03809450
	ldr r1, [r0, #8]
	cmp r1, #0
	bne _0380341C
	ldr r1, _03803428 ; =0x04000300
	mov r2, #1
	ldrh r1, [r1]
	str r2, [r0, #8]
	tst r1, #1
	beq _0380341C
	mov r0, #0x40000
	bl OS_SetIrqMask
	ldr r2, _0380342C ; =0x04000208
	mov r1, #1
	ldrh sb, [r2]
	ldr r5, _03803424 ; =0x03809450
	mov r4, r0
	strh r1, [r2]
	mov r6, #0x100
	b _03803324
_0380331C:
	mov r0, r6
	bl VENEER_SVC_WaitByLoop
_03803324:
	ldr r0, [r5, #0x28]
	cmp r0, #1
	bne _0380331C
	ldr r0, _03803424 ; =0x03809450
	mov r1, #0x8000000
	ldr r2, [r0, #0x18]
	ldr r0, _03803430 ; =0x01FFFFC0
	add r8, r1, #4
	and r0, r2, r0
	mov r0, r0, lsr #6
	mov r0, r0, lsl #5
	add r5, r0, #0x2000000
	mov r6, #1
	bl OS_GetLockID
	mov r0, r0, lsl #0x10
	mov r7, r0, lsr #0x10
	mov r0, r7
	bl OSi_DoLockByWord
	ldr ip, _03803434 ; =0x0000FFFF
	mov sl, #0
	eor r0, ip, #3
	eor r1, ip, #0x84
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	mov r2, r0, lsr #0x10
	mov r3, r1, lsr #0x10
	b _038033CC
_03803390:
	mov lr, ip
	cmp sl, #0x4c
	moveq lr, r3
	beq _038033A8
	cmp sl, #0x4d
	moveq lr, r2
_038033A8:
	add r0, r5, sl, lsl #1
	mov r1, sl, lsl #1
	ldrh r0, [r0, #4]
	ldrh r1, [r8, r1]
	and r0, lr, r0
	cmp r0, r1
	movne r6, #0
	bne _038033D4
	add sl, sl, #1
_038033CC:
	cmp sl, #0x4e
	blt _03803390
_038033D4:
	mov r0, r7
	bl OS_UnLockCartridge
	mov r0, r7
	bl OS_ReleaseLockID
	ldr r2, _03803438 ; =0x027FFC30
	and r0, r6, #0xff
	ldrb r1, [r2, #5]
	and r0, r0, #1
	bic r1, r1, #1
	orr r1, r1, r0
	mov r0, #1
	strb r1, [r2, #5]
	bl sub_038031E8
	ldr r2, _0380342C ; =0x04000208
	mov r0, r4
	ldrh r1, [r2]
	strh sb, [r2]
	bl OS_SetIrqMask
_0380341C:
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_03803424: .word 0x03809450
_03803428: .word 0x04000300
_0380342C: .word 0x04000208
_03803430: .word 0x01FFFFC0
_03803434: .word 0x0000FFFF
_03803438: .word 0x027FFC30
	arm_func_end sub_038032C8

	arm_func_start sub_0380343C
sub_0380343C: ; 0x0380343C
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #1
	ldreq r0, _03803468 ; =0x03809450
	moveq r2, #1
	streq r1, [r0, #0x18]
	streq r2, [r0, #0x28]
	beq _03803460
	bl OS_Terminate
_03803460:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03803468: .word 0x03809450
	arm_func_end sub_0380343C

	arm_func_start sub_0380346C
sub_0380346C: ; 0x0380346C
	stmdb sp!, {r3, lr}
	and r0, r1, #0x3f
	cmp r0, #2
	bne _03803494
	mov r0, #0
	bl sub_038034B0
	bl sub_037FB69C
	bl sub_03805A3C
	bl OS_Terminate
	b _03803498
_03803494:
	bl OS_Terminate
_03803498:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_0380346C

	arm_func_start sub_038034A0
sub_038034A0: ; 0x038034A0
	ldr ip, _038034AC ; =sub_038034B0
	mov r0, r1
	bx ip
	.align 2, 0
_038034AC: .word sub_038034B0
	arm_func_end sub_038034A0

	arm_func_start sub_038034B0
sub_038034B0: ; 0x038034B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r5, r0
	beq _038034EC
	ldr r0, [r5]
	cmp r0, #0
	bne _038034EC
	ldr r0, [r5, #0x44]
	add r0, r0, #1
	str r0, [r5, #0x44]
	ldr r1, [r5, #0x40]
	cmp r1, #0
	beq _038034EC
	ldr r0, [r5, #0x44]
	cmp r0, r1
	movhi r5, #0
_038034EC:
	cmp r5, #0
	ldrne r0, [r5, #0x3c]
	cmpne r0, #0
	bne _03803590
	bl OS_DisableInterrupts
	ldr r4, _038036CC ; =0x03809450
	mov sb, r0
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _0380357C
	mov sl, #0
	ldr r7, _038036D0 ; =0x027FFFE8
	ldr r5, _038036D4 ; =0x08001000
	mov r6, sl
	mov fp, #1
	b _03803574
_0380352C:
	mov r0, r7
	bl OS_ReadOwnerOfLockWord
	ands r8, r0, #0x80
	bne _0380354C
	ldrh r0, [r4]
	bl OS_TryLockCartridge
	cmp r0, #0
	bne _0380356C
_0380354C:
	str r6, [r4, #4]
	mov sl, fp
	strh r6, [r5]
	cmp r8, #0
	bne _03803574
	ldrh r0, [r4]
	bl OS_UnlockCartridge
	b _03803574
_0380356C:
	ldr r0, _038036D8 ; =0x000080E8
	bl sub_037FAD88
_03803574:
	cmp sl, #0
	beq _0380352C
_0380357C:
	ldr r0, _038036DC ; =0x03809480
	bl sub_037FA5E4
	mov r0, sb
	bl OS_RestoreInterrupts
	b _038036C4
_03803590:
	cmp r5, #0
	beq _038036C4
	ldr r0, _038036D0 ; =0x027FFFE8
	bl OS_ReadOwnerOfLockWord
	ands r4, r0, #0x80
	bne _038035BC
	ldr r0, _038036CC ; =0x03809450
	ldrh r0, [r0]
	bl OS_TryLockCartridge
	cmp r0, #0
	bne _038036AC
_038035BC:
	ldr r1, [r5]
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _03803604
	ldr r0, _038036CC ; =0x03809450
	mov r2, #0
	ldr r1, _038036D4 ; =0x08001000
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5, #8]
	ldr r0, _038036DC ; =0x03809480
	ldr r3, _038036E0 ; =sub_038034B0
	mov r2, #0
	bl OS_SetAlarm
	mov r0, #0
	str r0, [r5]
	b _03803694
_03803604:
	tst r1, #1
	ldr r1, _038036D4 ; =0x08001000
	beq _03803654
	ldr r0, _038036CC ; =0x03809450
	mov r2, #0
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5]
	ldr r0, _038036DC ; =0x03809480
	mov r1, r1, lsr #1
	add r1, r5, r1, lsl #2
	ldr r1, [r1, #0x24]
	ldr r3, _038036E0 ; =sub_038034B0
	mov r2, #0
	bl OS_SetAlarm
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _03803694
_03803654:
	ldr r0, _038036CC ; =0x03809450
	mov r2, #2
	str r2, [r0, #4]
	strh r2, [r1]
	str r5, [sp]
	ldr r1, [r5]
	ldr r0, _038036DC ; =0x03809480
	mov r1, r1, lsr #1
	add r1, r5, r1, lsl #2
	ldr r1, [r1, #0xc]
	ldr r3, _038036E0 ; =sub_038034B0
	mov r2, #0
	bl OS_SetAlarm
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
_03803694:
	cmp r4, #0
	bne _038036C4
	ldr r0, _038036CC ; =0x03809450
	ldrh r0, [r0]
	bl OS_UnlockCartridge
	b _038036C4
_038036AC:
	ldr r0, _038036DC ; =0x03809480
	ldr r1, _038036E4 ; =0x0000020B
	ldr r3, _038036E0 ; =sub_038034B0
	mov r2, #0
	str r5, [sp]
	bl OS_SetAlarm
_038036C4:
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_038036CC: .word 0x03809450
_038036D0: .word 0x027FFFE8
_038036D4: .word 0x08001000
_038036D8: .word 0x000080E8
_038036DC: .word 0x03809480
_038036E0: .word sub_038034B0
_038036E4: .word 0x0000020B
	arm_func_end sub_038034B0

	arm_func_start sub_038036E8
sub_038036E8: ; 0x038036E8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _038037D8 ; =0x03806B9C
	mvn r0, #0
	ldr r3, [r1, #4]
	cmp r3, r0
	ldreq r0, _038037DC ; =0x027FFC3C
	ldreq r0, [r0]
	addeq r0, r0, #0xa
	streq r0, [r1, #4]
	beq _038037D0
	ldr r0, _038037E0 ; =0x03809450
	ldr r2, [r0, #0x10]
	cmp r2, #0
	ldreq r0, [r0, #0xc]
	cmpeq r0, #0
	bne _038037D0
	ldr r2, _038037DC ; =0x027FFC3C
	ldr r0, [r2]
	cmp r0, r3
	blo _038037D0
	ldr r0, [r2]
	add r0, r0, #0xa
	str r0, [r1, #4]
	bl sub_03802F80
	ldr r1, _038037E0 ; =0x03809450
	str r0, [r1, #0xc]
	bl sub_03802FD0
	cmp r0, #0
	bne _03803780
	ldr r0, _038037D8 ; =0x03806B9C
	mov r1, #1
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, _038037E0 ; =0x03809450
	strne r1, [r0, #0x10]
	bne _038037D0
	ldr r0, _038037E0 ; =0x03809450
	str r1, [r0, #0xc]
_03803780:
	ldr r0, _038037E0 ; =0x03809450
	ldr r1, _038037D8 ; =0x03806B9C
	ldr r0, [r0, #0xc]
	mov r2, #0
	str r2, [r1]
	cmp r0, #0
	beq _038037D0
	mov r7, #0x64
	mov r6, #0xd
	mov r5, #0x11
	mov r4, r2
	b _038037B8
_038037B0:
	mov r0, r7
	bl OS_Sleep
_038037B8:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	bne _038037B0
_038037D0:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_038037D8: .word 0x03806B9C
_038037DC: .word 0x027FFC3C
_038037E0: .word 0x03809450
	arm_func_end sub_038036E8

	arm_func_start sub_038037E4
sub_038037E4: ; 0x038037E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	and r0, r1, #0x3f
	cmp r0, #3
	bne _0380384C
	ldr r3, _03803858 ; =0x04000204
	ldr r0, _0380385C ; =0x01FFFFC0
	ldrh r2, [r3]
	and r0, r1, r0
	mov r1, r0, lsr #6
	bic r0, r2, #0x60
	orr r0, r0, r1, lsl #5
	strh r0, [r3]
	mov r7, #1
	mov r6, #0x11
	mov r5, #0x12
	mov r4, #0
	b _03803830
_03803828:
	mov r0, r7
	bl VENEER_SVC_WaitByLoop
_03803830:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	bne _03803828
	b _03803850
_0380384C:
	bl OS_Terminate
_03803850:
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03803858: .word 0x04000204
_0380385C: .word 0x01FFFFC0
	arm_func_end sub_038037E4

	arm_func_start sub_03803860
sub_03803860: ; 0x03803860
	ldr r0, _03803884 ; =0x038094AC
	mov r3, #0
	mov r2, r3
_0380386C:
	mov r1, r3, lsl #1
	add r3, r3, #1
	strh r2, [r0, r1]
	cmp r3, #0x10
	blt _0380386C
	bx lr
	.align 2, 0
_03803884: .word 0x038094AC
	arm_func_end sub_03803860

	arm_func_start sub_03803888
sub_03803888: ; 0x03803888
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	tst r0, #0x2000000
	beq _038038B8
	ldr r2, _03803A28 ; =0x038094AC
	mov r5, #0
	mov lr, r5
_038038A4:
	mov r4, r5, lsl #1
	add r5, r5, #1
	strh lr, [r2, r4]
	cmp r5, #0x10
	blt _038038A4
_038038B8:
	ldr r2, _03803A28 ; =0x038094AC
	and r4, r0, #0xf0000
	mov r4, r4, lsr #0x10
	mov r4, r4, lsl #1
	strh r0, [r2, r4]
	tst r0, #0x1000000
	beq _03803A1C
	ldr lr, _03803A2C ; =0x038094AC
	ldrh r0, [lr]
	and r2, r0, #0xff00
	mov r2, r2, lsl #8
	mov r4, r2, lsr #0x10
	sub r2, r4, #0x22
	cmp r2, #0xa
	addls pc, pc, r2, lsl #2
	b _038039F0
_038038F8: ; jump table
	b _03803924 ; case 0
	b _0380395C ; case 1
	b _0380395C ; case 2
	b _038039A4 ; case 3
	b _038039A4 ; case 4
	b _038039E4 ; case 5
	b _038039E4 ; case 6
	b _038039F0 ; case 7
	b _038039F0 ; case 8
	b _038039F0 ; case 9
	b _03803924 ; case 10
_03803924:
	ldrh ip, [lr, #4]
	ldrh r2, [lr, #2]
	mov r0, r0, lsl #0x18
	and ip, ip, #0xff00
	orr r0, r0, r2, lsl #8
	orr ip, r0, ip, lsr #8
	cmp ip, #0x2000000
	blo _0380394C
	cmp ip, #0x2800000
	blo _038039F0
_0380394C:
	mov r0, r4
	mov r1, #2
	bl sub_03800AFC
	b _03803A1C
_0380395C:
	ldrh r2, [lr, #8]
	ldrh r1, [lr, #0xa]
	orr ip, r1, r2, lsl #16
	cmp ip, #0x2000000
	blo _03803978
	cmp ip, #0x2800000
	blo _03803988
_03803978:
	mov r0, r4
	mov r1, #2
	bl sub_03800AFC
	b _03803A1C
_03803988:
	ldrh r2, [lr, #2]
	mov r3, r0, lsl #0x18
	ldrh r1, [lr, #4]
	ldrh r0, [lr, #6]
	orr r3, r2, r3, lsr #8
	orr r1, r0, r1, lsl #16
	b _038039F0
_038039A4:
	ldrh r2, [lr, #6]
	ldrh r1, [lr, #8]
	orr ip, r1, r2, lsl #16
	cmp ip, #0x2000000
	blo _038039C0
	cmp ip, #0x2800000
	blo _038039D0
_038039C0:
	mov r0, r4
	mov r1, #2
	bl sub_03800AFC
	b _03803A1C
_038039D0:
	ldrh r2, [lr, #2]
	mov r0, r0, lsl #0x18
	ldrh r1, [lr, #4]
	orr r3, r2, r0, lsr #8
	b _038039F0
_038039E4:
	ldrh r2, [lr, #2]
	mov r0, r0, lsl #0x18
	orr r3, r2, r0, lsr #8
_038039F0:
	str r1, [sp]
	mov r1, r4
	mov r0, #1
	mov r2, #3
	str ip, [sp, #4]
	bl sub_03800C30
	cmp r0, #0
	bne _03803A1C
	mov r0, r4
	mov r1, #4
	bl sub_03800AFC
_03803A1C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03803A28: .word 0x038094AC
_03803A2C: .word 0x038094AC
	arm_func_end sub_03803888

	arm_func_start sub_03803A30
sub_03803A30: ; 0x03803A30
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	mov r5, r0
	mov r0, #1
	bl sub_03800BC0
	cmp r0, #0
	bne _03803A70
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, [r4, #4]
	mov r1, #4
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	b _03803CFC
_03803A70:
	mov r0, #1
	bl sub_03800BDC
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r0, [r4, #4]
	sub r0, r0, #0x20
	cmp r0, #0xd
	addls pc, pc, r0, lsl #2
	b _03803CC0
_03803A94: ; jump table
	b _03803ACC ; case 0
	b _03803AD4 ; case 1
	b _03803ADC ; case 2
	b _03803AE8 ; case 3
	b _03803B28 ; case 4
	b _03803B68 ; case 5
	b _03803BB0 ; case 6
	b _03803BF8 ; case 7
	b _03803C30 ; case 8
	b _03803C68 ; case 9
	b _03803C70 ; case 10
	b _03803C78 ; case 11
	b _03803CAC ; case 12
	b _03803CB8 ; case 13
_03803ACC:
	bl sub_03803D58
	b _03803CE0
_03803AD4:
	bl sub_03803DBC
	b _03803CE0
_03803ADC:
	ldr r0, [r4, #0x10]
	bl sub_03803DFC
	b _03803CE0
_03803AE8:
	bl sub_03803D04
	cmp r0, #0
	bne _03803B14
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	mov r0, #1
	bl sub_03800BF4
	b _03803CFC
_03803B14:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	bl sub_03803E6C
	b _03803CE0
_03803B28:
	bl sub_03803D04
	cmp r0, #0
	bne _03803B54
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	mov r0, #1
	bl sub_03800BF4
	b _03803CFC
_03803B54:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	bl sub_03803F94
	b _03803CE0
_03803B68:
	bl sub_03803D28
	cmp r0, #0
	bne _03803B94
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	mov r0, #1
	bl sub_03800BF4
	b _03803CFC
_03803B94:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	mov r1, r1, lsl #0x10
	ldr r2, [r4, #0x10]
	mov r1, r1, lsr #0x10
	bl sub_038040B4
	b _03803CE0
_03803BB0:
	bl sub_03803D28
	cmp r0, #0
	bne _03803BDC
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	mov r0, #1
	bl sub_03800BF4
	b _03803CFC
_03803BDC:
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	mov r1, r1, lsl #0x10
	ldr r2, [r4, #0x10]
	mov r1, r1, lsr #0x10
	bl sub_038041C0
	b _03803CE0
_03803BF8:
	bl sub_03803D28
	cmp r0, #0
	bne _03803C24
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	mov r0, #1
	bl sub_03800BF4
	b _03803CFC
_03803C24:
	ldr r0, [r4, #8]
	bl sub_038042CC
	b _03803CE0
_03803C30:
	bl sub_03803D28
	cmp r0, #0
	bne _03803C5C
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	mov r0, #1
	bl sub_03800BF4
	b _03803CFC
_03803C5C:
	ldr r0, [r4, #8]
	bl sub_03804354
	b _03803CE0
_03803C68:
	bl sub_038043DC
	b _03803CE0
_03803C70:
	bl sub_0380441C
	b _03803CE0
_03803C78:
	bl sub_03803D28
	cmp r0, #0
	bne _03803CA4
	ldr r0, [r4, #4]
	mov r1, #3
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	mov r0, #1
	bl sub_03800BF4
	b _03803CFC
_03803CA4:
	bl sub_0380445C
	b _03803CE0
_03803CAC:
	ldr r0, [r4, #0x10]
	bl sub_0380449C
	b _03803CE0
_03803CB8:
	bl sub_03804538
	b _03803CE0
_03803CC0:
	mov r0, #1
	bl sub_03800BF4
	ldr r0, [r4, #4]
	mov r1, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	b _03803CFC
_03803CE0:
	ldr r0, [r4, #4]
	mov r1, #0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bl sub_03800AFC
	mov r0, #1
	bl sub_03800BF4
_03803CFC:
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	arm_func_end sub_03803A30

	arm_func_start sub_03803D04
sub_03803D04: ; 0x03803D04
	stmdb sp!, {r3, lr}
	add r0, sp, #0
	bl sub_03803DFC
	ldrh r0, [sp]
	tst r0, #1
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_03803D04

	arm_func_start sub_03803D28
sub_03803D28: ; 0x03803D28
	stmdb sp!, {r3, lr}
	add r0, sp, #0
	bl sub_03803DFC
	ldrh r0, [sp]
	tst r0, #1
	movne r0, #0
	bne _03803D50
	tst r0, #2
	movne r0, #1
	moveq r0, #0
_03803D50:
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_03803D28

	arm_func_start sub_03803D58
sub_03803D58: ; 0x03803D58
	ldr r2, _03803D90 ; =0x040001C0
_03803D5C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803D5C
	ldr r0, _03803D94 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #6
	strh r1, [r0]
	sub r1, r0, #2
_03803D80:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803D80
	bx lr
	.align 2, 0
_03803D90: .word 0x040001C0
_03803D94: .word 0x040001C2
	arm_func_end sub_03803D58

	arm_func_start sub_03803D98
sub_03803D98: ; 0x03803D98
	ldr r1, _03803DB8 ; =0x040001C2
	and r0, r0, #0xff
	strh r0, [r1]
	sub r1, r1, #2
_03803DA8:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803DA8
	bx lr
	.align 2, 0
_03803DB8: .word 0x040001C2
	arm_func_end sub_03803D98

	arm_func_start sub_03803DBC
sub_03803DBC: ; 0x03803DBC
	ldr r2, _03803DF4 ; =0x040001C0
_03803DC0:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803DC0
	ldr r0, _03803DF8 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #4
	strh r1, [r0]
	sub r1, r0, #2
_03803DE4:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803DE4
	bx lr
	.align 2, 0
_03803DF4: .word 0x040001C0
_03803DF8: .word 0x040001C2
	arm_func_end sub_03803DBC

	arm_func_start sub_03803DFC
sub_03803DFC: ; 0x03803DFC
	ldr r3, _03803E64 ; =0x040001C0
_03803E00:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _03803E00
	ldr r1, _03803E68 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #5
	strh r2, [r1]
	sub r3, r1, #2
_03803E24:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _03803E24
	ldr r1, _03803E68 ; =0x040001C2
	mov r2, #0x8100
	strh r2, [r3]
	mov r2, #0
	strh r2, [r1]
	sub r2, r1, #2
_03803E48:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03803E48
	ldr r1, _03803E68 ; =0x040001C2
	ldrh r1, [r1]
	strb r1, [r0]
	bx lr
	.align 2, 0
_03803E64: .word 0x040001C0
_03803E68: .word 0x040001C2
	arm_func_end sub_03803DFC

	arm_func_start sub_03803E6C
sub_03803E6C: ; 0x03803E6C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r2
	cmp r1, #1
	blo _03803F5C
	and r2, r0, #0xff00
	mov r2, r2, lsr #8
	and r3, r0, #0xff0000
	strh r2, [sp, #2]
	mov r3, r3, lsr #0x10
	and r0, r0, #0xff
	ldr r2, _03803F68 ; =0x040001C0
	strh r3, [sp]
	strh r0, [sp, #4]
_03803EA4:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803EA4
	ldr r4, _03803F6C ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r2]
	mov r0, #3
	strh r0, [r4]
	mov ip, #0
	add r2, sp, #0
	sub r3, r4, #2
_03803ED0:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _03803ED0
	mov r0, ip, lsl #1
	ldrh r0, [r2, r0]
	add ip, ip, #1
	and r0, r0, #0xff
	strh r0, [r4]
	cmp ip, #3
	blt _03803ED0
	ldr r2, _03803F68 ; =0x040001C0
_03803EFC:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803EFC
	mov r4, #0
	ldr r2, _03803F68 ; =0x040001C0
	sub r0, r1, #1
	mov r3, r4
	b _03803F38
_03803F1C:
	strh r3, [r2, #2]
_03803F20:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03803F20
	ldrh r1, [r2, #2]
	strb r1, [r5, r4]
	add r4, r4, #1
_03803F38:
	cmp r4, r0
	blo _03803F1C
	ldr r0, _03803F68 ; =0x040001C0
	mov r1, #0x8100
	strh r1, [r0]
	bl sub_03803F70
	ldr r0, _03803F6C ; =0x040001C2
	ldrh r0, [r0]
	strb r0, [r5, r4]
_03803F5C:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_03803F68: .word 0x040001C0
_03803F6C: .word 0x040001C2
	arm_func_end sub_03803E6C

	arm_func_start sub_03803F70
sub_03803F70: ; 0x03803F70
	ldr r0, _03803F90 ; =0x040001C2
	mov r1, #0
	strh r1, [r0]
	sub r1, r0, #2
_03803F80:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03803F80
	bx lr
	.align 2, 0
_03803F90: .word 0x040001C2
	arm_func_end sub_03803F70

	arm_func_start sub_03803F94
sub_03803F94: ; 0x03803F94
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r2
	cmp r1, #1
	blo _038040A0
	and r2, r0, #0xff00
	mov r2, r2, lsr #8
	and r3, r0, #0xff0000
	strh r2, [sp, #2]
	mov r3, r3, lsr #0x10
	and r0, r0, #0xff
	ldr r2, _038040AC ; =0x040001C0
	strh r3, [sp]
	strh r0, [sp, #4]
_03803FCC:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03803FCC
	ldr r4, _038040B0 ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r2]
	mov r0, #0xb
	strh r0, [r4]
	mov ip, #0
	add r2, sp, #0
	sub r3, r4, #2
_03803FF8:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _03803FF8
	mov r0, ip, lsl #1
	ldrh r0, [r2, r0]
	add ip, ip, #1
	and r0, r0, #0xff
	strh r0, [r4]
	cmp ip, #3
	blt _03803FF8
	ldr r2, _038040AC ; =0x040001C0
_03804024:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03804024
	ldr r0, _038040B0 ; =0x040001C2
	mov r2, #0
	strh r2, [r0]
	sub r2, r0, #2
_03804040:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03804040
	mov r4, #0
	ldr r2, _038040AC ; =0x040001C0
	sub r0, r1, #1
	mov r3, r4
	b _0380407C
_03804060:
	strh r3, [r2, #2]
_03804064:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03804064
	ldrh r1, [r2, #2]
	strb r1, [r5, r4]
	add r4, r4, #1
_0380407C:
	cmp r4, r0
	blo _03804060
	ldr r0, _038040AC ; =0x040001C0
	mov r1, #0x8100
	strh r1, [r0]
	bl sub_03803F70
	ldr r0, _038040B0 ; =0x040001C2
	ldrh r0, [r0]
	strb r0, [r5, r4]
_038040A0:
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038040AC: .word 0x040001C0
_038040B0: .word 0x040001C2
	arm_func_end sub_03803F94

	arm_func_start sub_038040B4
sub_038040B4: ; 0x038040B4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	cmp r1, #1
	blo _038041AC
	add r3, r0, r1
	sub r3, r3, #1
	mov r3, r3, lsr #8
	cmp r3, r0, lsr #8
	and r3, r0, #0xff00
	mov r3, r3, lsr #8
	andhi r1, r0, #0xff
	and ip, r0, #0xff0000
	strh r3, [sp, #2]
	rsbhi r1, r1, #0x100
	mov ip, ip, lsr #0x10
	and r0, r0, #0xff
	movhi r1, r1, lsl #0x10
	ldr r3, _038041B8 ; =0x040001C0
	strh ip, [sp]
	strh r0, [sp, #4]
	movhi r1, r1, lsr #0x10
_03804108:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _03804108
	ldr lr, _038041BC ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r3]
	mov r0, #0xa
	strh r0, [lr]
	mov r4, #0
	add r3, sp, #0
	sub ip, lr, #2
_03804134:
	ldrh r0, [ip]
	tst r0, #0x80
	bne _03804134
	mov r0, r4, lsl #1
	ldrh r0, [r3, r0]
	add r4, r4, #1
	and r0, r0, #0xff
	strh r0, [lr]
	cmp r4, #3
	blt _03804134
	sub r3, r1, #1
	ldr r1, _038041B8 ; =0x040001C0
	mov r4, #0
	b _03804184
_0380416C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0380416C
	ldrb r0, [r2, r4]
	add r4, r4, #1
	strh r0, [r1, #2]
_03804184:
	cmp r4, r3
	blt _0380416C
	ldr r1, _038041B8 ; =0x040001C0
_03804190:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804190
	mov r0, #0x8100
	strh r0, [r1]
	ldrb r0, [r2, r4]
	bl sub_03803D98
_038041AC:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038041B8: .word 0x040001C0
_038041BC: .word 0x040001C2
	arm_func_end sub_038040B4

	arm_func_start sub_038041C0
sub_038041C0: ; 0x038041C0
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	cmp r1, #1
	blo _038042B8
	add r3, r0, r1
	sub r3, r3, #1
	mov r3, r3, lsr #8
	cmp r3, r0, lsr #8
	and r3, r0, #0xff00
	mov r3, r3, lsr #8
	andhi r1, r0, #0xff
	and ip, r0, #0xff0000
	strh r3, [sp, #2]
	rsbhi r1, r1, #0x100
	mov ip, ip, lsr #0x10
	and r0, r0, #0xff
	movhi r1, r1, lsl #0x10
	ldr r3, _038042C4 ; =0x040001C0
	strh ip, [sp]
	strh r0, [sp, #4]
	movhi r1, r1, lsr #0x10
_03804214:
	ldrh r0, [r3]
	tst r0, #0x80
	bne _03804214
	ldr lr, _038042C8 ; =0x040001C2
	mov r0, #0x8900
	strh r0, [r3]
	mov r0, #2
	strh r0, [lr]
	mov r4, #0
	add r3, sp, #0
	sub ip, lr, #2
_03804240:
	ldrh r0, [ip]
	tst r0, #0x80
	bne _03804240
	mov r0, r4, lsl #1
	ldrh r0, [r3, r0]
	add r4, r4, #1
	and r0, r0, #0xff
	strh r0, [lr]
	cmp r4, #3
	blt _03804240
	sub r3, r1, #1
	ldr r1, _038042C4 ; =0x040001C0
	mov r4, #0
	b _03804290
_03804278:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804278
	ldrb r0, [r2, r4]
	add r4, r4, #1
	strh r0, [r1, #2]
_03804290:
	cmp r4, r3
	blt _03804278
	ldr r1, _038042C4 ; =0x040001C0
_0380429C:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _0380429C
	mov r0, #0x8100
	strh r0, [r1]
	ldrb r0, [r2, r4]
	bl sub_03803D98
_038042B8:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_038042C4: .word 0x040001C0
_038042C8: .word 0x040001C2
	arm_func_end sub_038041C0

	arm_func_start sub_038042CC
sub_038042CC: ; 0x038042CC
	stmdb sp!, {r3, r4, r5, lr}
	and r1, r0, #0xff0000
	mov r1, r1, lsr #0x10
	and r2, r0, #0xff00
	mov r2, r2, lsl #8
	ldr r3, _0380434C ; =0x040001C0
	mov r1, r1, lsl #0x10
	and r5, r0, #0xff
	mov r0, r1, lsr #0x10
	mov r4, r2, lsr #0x10
_038042F4:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _038042F4
	ldr r1, _03804350 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0xdb
	strh r2, [r1]
	sub r2, r1, #2
_03804318:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03804318
	bl sub_03803D98
	mov r0, r4
	bl sub_03803D98
	ldr r1, _0380434C ; =0x040001C0
	mov r2, #0x8100
	mov r0, r5
	strh r2, [r1]
	bl sub_03803D98
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380434C: .word 0x040001C0
_03804350: .word 0x040001C2
	arm_func_end sub_038042CC

	arm_func_start sub_03804354
sub_03804354: ; 0x03804354
	stmdb sp!, {r3, r4, r5, lr}
	and r1, r0, #0xff0000
	mov r1, r1, lsr #0x10
	and r2, r0, #0xff00
	mov r2, r2, lsl #8
	ldr r3, _038043D4 ; =0x040001C0
	mov r1, r1, lsl #0x10
	and r5, r0, #0xff
	mov r0, r1, lsr #0x10
	mov r4, r2, lsr #0x10
_0380437C:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _0380437C
	ldr r1, _038043D8 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0xd8
	strh r2, [r1]
	sub r2, r1, #2
_038043A0:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _038043A0
	bl sub_03803D98
	mov r0, r4
	bl sub_03803D98
	ldr r1, _038043D4 ; =0x040001C0
	mov r2, #0x8100
	mov r0, r5
	strh r2, [r1]
	bl sub_03803D98
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_038043D4: .word 0x040001C0
_038043D8: .word 0x040001C2
	arm_func_end sub_03804354

	arm_func_start sub_038043DC
sub_038043DC: ; 0x038043DC
	ldr r2, _03804414 ; =0x040001C0
_038043E0:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _038043E0
	ldr r0, _03804418 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xb9
	strh r1, [r0]
	sub r1, r0, #2
_03804404:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804404
	bx lr
	.align 2, 0
_03804414: .word 0x040001C0
_03804418: .word 0x040001C2
	arm_func_end sub_038043DC

	arm_func_start sub_0380441C
sub_0380441C: ; 0x0380441C
	ldr r2, _03804454 ; =0x040001C0
_03804420:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03804420
	ldr r0, _03804458 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xab
	strh r1, [r0]
	sub r1, r0, #2
_03804444:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804444
	bx lr
	.align 2, 0
_03804454: .word 0x040001C0
_03804458: .word 0x040001C2
	arm_func_end sub_0380441C

	arm_func_start sub_0380445C
sub_0380445C: ; 0x0380445C
	ldr r2, _03804494 ; =0x040001C0
_03804460:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _03804460
	ldr r0, _03804498 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xc7
	strh r1, [r0]
	sub r1, r0, #2
_03804484:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804484
	bx lr
	.align 2, 0
_03804494: .word 0x040001C0
_03804498: .word 0x040001C2
	arm_func_end sub_0380445C

	arm_func_start sub_0380449C
sub_0380449C: ; 0x0380449C
	stmdb sp!, {r3, lr}
	ldr r3, _03804530 ; =0x040001C0
_038044A4:
	ldrh r1, [r3]
	tst r1, #0x80
	bne _038044A4
	ldr r1, _03804534 ; =0x040001C2
	mov r2, #0x8900
	strh r2, [r3]
	mov r2, #0x9f
	strh r2, [r1]
	sub r2, r1, #2
_038044C8:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _038044C8
	ldr r1, _03804534 ; =0x040001C2
	mov r2, #0
	strh r2, [r1]
	sub lr, r1, #2
_038044E4:
	ldrh r1, [lr]
	tst r1, #0x80
	bne _038044E4
	ldr ip, _03804534 ; =0x040001C2
	mov r2, #0x8100
	ldrh r3, [ip]
	mov r1, #0
	strb r3, [r0]
	strh r2, [lr]
	strh r1, [ip]
	sub r2, ip, #2
_03804510:
	ldrh r1, [r2]
	tst r1, #0x80
	bne _03804510
	ldr r1, _03804534 ; =0x040001C2
	ldrh r1, [r1]
	strb r1, [r0, #1]
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03804530: .word 0x040001C0
_03804534: .word 0x040001C2
	arm_func_end sub_0380449C

	arm_func_start sub_03804538
sub_03804538: ; 0x03804538
	ldr r2, _03804570 ; =0x040001C0
_0380453C:
	ldrh r0, [r2]
	tst r0, #0x80
	bne _0380453C
	ldr r0, _03804574 ; =0x040001C2
	mov r1, #0x8100
	strh r1, [r2]
	mov r1, #0xff
	strh r1, [r0]
	sub r1, r0, #2
_03804560:
	ldrh r0, [r1]
	tst r0, #0x80
	bne _03804560
	bx lr
	.align 2, 0
_03804570: .word 0x040001C0
_03804574: .word 0x040001C2
	arm_func_end sub_03804538

	arm_func_start sub_03804578
sub_03804578: ; 0x03804578
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	ldr r2, _038047B8 ; =0x038094CC
	mov r8, r0
	ldrh r0, [r2]
	cmp r0, #0
	bne _038047AC
	ldr r1, _038047BC ; =0x038094D0
	mov r3, #1
	add r0, sp, #8
	strh r3, [r2]
	str r3, [r1, #0x1d4]
	bl sub_038053B0
	add r0, sp, #0xa
	bl sub_03805414
	ldrh r0, [sp, #8]
	mov r1, r0, lsl #0x18
	movs r1, r1, lsr #0x1f
	bne _038045E0
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	bne _038045E0
	ldrh r0, [sp, #0xa]
	mov r0, r0, lsl #0x18
	movs r0, r0, lsr #0x1f
	beq _038045F8
_038045E0:
	ldrh r1, [sp, #8]
	add r0, sp, #8
	bic r1, r1, #1
	orr r1, r1, #1
	strh r1, [sp, #8]
	bl sub_038053DC
_038045F8:
	ldrh r0, [sp, #8]
	mov r1, r0, lsl #0x1b
	movs r1, r1, lsr #0x1f
	bne _03804614
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _03804634
_03804614:
	ldrh r1, [sp, #0xa]
	add r0, sp, #0xa
	bic r1, r1, #0xf
	strh r1, [sp, #0xa]
	ldrh r1, [sp, #0xa]
	bic r1, r1, #0x40
	strh r1, [sp, #0xa]
	bl sub_03805440
_03804634:
	ldr r0, _038047C0 ; =0x027FFDE8
	bl sub_03805040
	ldr r0, _038047C0 ; =0x027FFDE8
	ldr r0, [r0]
	mov r0, r0, lsl #0xa
	mov r0, r0, lsr #0x1a
	bl sub_03804E68
	ldr r1, _038047C0 ; =0x027FFDE8
	mov r5, r0
	ldr r0, [r1]
	mov r0, r0, lsl #0x13
	mov r0, r0, lsr #0x1b
	bl sub_03804E68
	ldr r1, _038047C0 ; =0x027FFDE8
	mov r6, r0
	ldr r0, [r1]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x18
	bl sub_03804E68
	sub r1, r6, #1
	cmp r1, #1
	add r7, r0, #0x7d0
	subls r7, r7, #1
	mov r0, r7
	mov r1, #0x190
	addls r6, r6, #0xc
	bl sub_03806468
	mov r4, r0
	mov r0, r7
	mov r1, #0x64
	bl sub_03806468
	mov r1, #0xd
	mul r1, r6, r1
	mov r6, r0
	add r0, r1, #8
	mov r1, #5
	bl sub_03806468
	add r1, r7, r7, lsr #2
	sub r1, r1, r6
	add r1, r4, r1
	add r0, r1, r0
	add r0, r5, r0
	mov r1, #7
	bl sub_03806468
	ldr r0, _038047C0 ; =0x027FFDE8
	ldr r2, [r0]
	mov r3, r2, lsl #5
	mov r3, r3, lsr #0x1d
	cmp r3, r1
	beq _03804710
	bic r2, r2, #0x7000000
	mov r1, r1, lsl #0x1d
	orr r1, r2, r1, lsr #5
	str r1, [r0]
	bl sub_0380506C
_03804710:
	mov r0, #1
	bl sub_03804F1C
	ldr r0, _038047BC ; =0x038094D0
	mov r1, #0
	str r1, [r0, #0x1d4]
	bl PXI_Init
	ldr r1, _038047C4 ; =sub_038047DC
	mov r0, #5
	bl PXI_SetFifoRecvCallback
	ldr r0, _038047BC ; =0x038094D0
	ldr r1, _038047C8 ; =0x038094F0
	mov r2, #4
	bl OS_InitMessageQueue
	mov r0, #0x100
	stmia sp, {r0, r8}
	ldr r0, _038047CC ; =0x03809500
	ldr r1, _038047D0 ; =sub_03804958
	ldr r3, _038047D4 ; =0x038096A4
	mov r2, #0
	bl OS_CreateThread
	ldr r0, _038047CC ; =0x03809500
	bl OS_WakeupThreadDirect
	mov r0, #0x8000
	bl sub_037FB53C
	mov r0, #0x40
	mov r1, #0
	bl sub_037FB51C
	mov r0, #0x100
	mov r1, r0
	bl sub_037FB51C
	bl OS_DisableInterrupts
	mov r4, r0
	ldr r1, _038047D8 ; =sub_03804DD8
	mov r0, #0x80
	bl OS_SetIrqFunction
	mov r0, #0x80
	bl OS_EnableIrqMask
	mov r0, r4
	bl OS_RestoreInterrupts
_038047AC:
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, lr}
	bx lr
	.align 2, 0
_038047B8: .word 0x038094CC
_038047BC: .word 0x038094D0
_038047C0: .word 0x027FFDE8
_038047C4: .word sub_038047DC
_038047C8: .word 0x038094F0
_038047CC: .word 0x03809500
_038047D0: .word sub_03804958
_038047D4: .word 0x038096A4
_038047D8: .word sub_03804DD8
	arm_func_end sub_03804578

	arm_func_start sub_038047DC
sub_038047DC: ; 0x038047DC
	stmdb sp!, {r4, lr}
	cmp r2, #0
	bne _03804908
	and r0, r1, #0x7f00
	mov r0, r0, lsl #8
	mov r4, r0, lsr #0x10
	cmp r4, #0x29
	addls pc, pc, r4, lsl #2
	b _038048FC
_03804800: ; jump table
	b _038048A8 ; case 0
	b _038048A8 ; case 1
	b _038048FC ; case 2
	b _038048FC ; case 3
	b _038048FC ; case 4
	b _038048FC ; case 5
	b _038048FC ; case 6
	b _038048FC ; case 7
	b _038048FC ; case 8
	b _038048FC ; case 9
	b _038048FC ; case 10
	b _038048FC ; case 11
	b _038048FC ; case 12
	b _038048FC ; case 13
	b _038048FC ; case 14
	b _038048FC ; case 15
	b _038048A8 ; case 16
	b _038048A8 ; case 17
	b _038048A8 ; case 18
	b _038048A8 ; case 19
	b _038048A8 ; case 20
	b _038048A8 ; case 21
	b _038048A8 ; case 22
	b _038048A8 ; case 23
	b _038048A8 ; case 24
	b _038048A8 ; case 25
	b _038048FC ; case 26
	b _038048FC ; case 27
	b _038048FC ; case 28
	b _038048FC ; case 29
	b _038048FC ; case 30
	b _038048FC ; case 31
	b _038048FC ; case 32
	b _038048FC ; case 33
	b _038048FC ; case 34
	b _038048A8 ; case 35
	b _038048A8 ; case 36
	b _038048A8 ; case 37
	b _038048A8 ; case 38
	b _038048A8 ; case 39
	b _038048A8 ; case 40
	b _038048A8 ; case 41
_038048A8:
	ldr r0, _03804910 ; =0x038094D0
	ldr r1, [r0, #0x1d4]
	cmp r1, #0
	beq _038048C8
	mov r0, r4
	mov r1, #3
	bl sub_03804918
	b _03804908
_038048C8:
	ldr r3, _03804914 ; =0x038095D0
	mov r1, #1
	str r1, [r0, #0x1d4]
	mov r1, #0
	mov r2, r1
	strh r4, [r3, #0xd8]
	bl OS_SendMessage
	cmp r0, #0
	bne _03804908
	mov r0, r4
	mov r1, #4
	bl sub_03804918
	b _03804908
_038048FC:
	mov r0, r4
	mov r1, #1
	bl sub_03804918
_03804908:
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_03804910: .word 0x038094D0
_03804914: .word 0x038095D0
	arm_func_end sub_038047DC

	arm_func_start sub_03804918
sub_03804918: ; 0x03804918
	stmdb sp!, {r4, r5, r6, lr}
	mov r0, r0, lsl #8
	and r0, r0, #0x7f00
	orr r2, r0, #0x8000
	and r0, r1, #0xff
	orr r6, r2, r0
	mov r5, #5
	mov r4, #0
_03804938:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	blt _03804938
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_03804918

	arm_func_start sub_03804958
sub_03804958: ; 0x03804958
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r8, _03804DCC ; =0x027FFDE8
	mov r7, #0
	ldr sb, _03804DD0 ; =0x038094D0
	mov r6, r7
	mov r5, r7
	mov r4, r7
	mov sl, r7
	mov fp, r7
_0380497C:
	mov r0, sb
	add r1, sp, #0
	mov r2, #1
	bl OS_ReceiveMessage
	ldr r0, _03804DD4 ; =0x038095D0
	ldrh r0, [r0, #0xd8]
	cmp r0, #0x29
	addls pc, pc, r0, lsl #2
	b _03804DB8
_038049A0: ; jump table
	b _03804A48 ; case 0
	b _03804A60 ; case 1
	b _03804DB8 ; case 2
	b _03804DB8 ; case 3
	b _03804DB8 ; case 4
	b _03804DB8 ; case 5
	b _03804DB8 ; case 6
	b _03804DB8 ; case 7
	b _03804DB8 ; case 8
	b _03804DB8 ; case 9
	b _03804DB8 ; case 10
	b _03804DB8 ; case 11
	b _03804DB8 ; case 12
	b _03804DB8 ; case 13
	b _03804DB8 ; case 14
	b _03804DB8 ; case 15
	b _03804A88 ; case 16
	b _03804AA8 ; case 17
	b _03804AC8 ; case 18
	b _03804AE8 ; case 19
	b _03804B24 ; case 20
	b _03804B60 ; case 21
	b _03804B9C ; case 22
	b _03804BBC ; case 23
	b _03804BDC ; case 24
	b _03804BFC ; case 25
	b _03804DB8 ; case 26
	b _03804DB8 ; case 27
	b _03804DB8 ; case 28
	b _03804DB8 ; case 29
	b _03804DB8 ; case 30
	b _03804DB8 ; case 31
	b _03804C1C ; case 32
	b _03804C3C ; case 33
	b _03804C64 ; case 34
	b _03804C84 ; case 35
	b _03804CC0 ; case 36
	b _03804CFC ; case 37
	b _03804D38 ; case 38
	b _03804D58 ; case 39
	b _03804D78 ; case 40
	b _03804D98 ; case 41
_03804A48:
	bl sub_03804ED8
	mov r0, #0
	mov r1, r0
	str r0, [sb, #0x1d4]
	bl sub_03804918
	b _0380497C
_03804A60:
	ldrh r0, [r8]
	mov r0, r0, lsl #0x1e
	mov r0, r0, lsr #0x1f
	bl sub_03804F1C
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #1
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804A88:
	mov r0, r8
	bl sub_03805040
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x10
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804AA8:
	mov r0, r8
	bl sub_038050A4
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x11
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804AC8:
	add r0, r8, #4
	bl sub_038050D0
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x12
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804AE8:
	add r0, r8, #4
	bl sub_03805134
	cmp r0, #0
	bne _03804B0C
	mov r0, #0x13
	mov r1, #2
	str r7, [sb, #0x1d4]
	bl sub_03804918
	b _0380497C
_03804B0C:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x13
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804B24:
	add r0, r8, #4
	bl sub_03805210
	cmp r0, #0
	bne _03804B48
	mov r0, #0x14
	mov r1, #2
	str r6, [sb, #0x1d4]
	bl sub_03804918
	b _0380497C
_03804B48:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x14
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804B60:
	add r0, r8, #4
	bl sub_038052E4
	cmp r0, #0
	bne _03804B84
	mov r0, #0x15
	mov r1, #2
	str r5, [sb, #0x1d4]
	bl sub_03804918
	b _0380497C
_03804B84:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x15
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804B9C:
	mov r0, r8
	bl sub_038053B0
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x16
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804BBC:
	add r0, r8, #2
	bl sub_03805414
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x17
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804BDC:
	add r0, r8, #4
	bl sub_03805478
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x18
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804BFC:
	add r0, r8, #4
	bl sub_038054DC
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x19
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804C1C:
	mov r0, r8
	bl sub_0380506C
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x20
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804C3C:
	add r0, r8, #4
	bl sub_038050D0
	mov r0, r8
	bl sub_0380506C
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x21
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804C64:
	add r0, r8, #4
	bl sub_038050FC
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x22
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804C84:
	add r0, r8, #4
	bl sub_0380519C
	cmp r0, #0
	bne _03804CA8
	mov r0, #0x23
	mov r1, #2
	str r4, [sb, #0x1d4]
	bl sub_03804918
	b _0380497C
_03804CA8:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x23
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804CC0:
	add r0, r8, #4
	bl sub_03805274
	cmp r0, #0
	bne _03804CE4
	mov r0, #0x24
	mov r1, #2
	str sl, [sb, #0x1d4]
	bl sub_03804918
	b _0380497C
_03804CE4:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x24
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804CFC:
	add r0, r8, #4
	bl sub_03805344
	cmp r0, #0
	bne _03804D20
	mov r0, #0x25
	mov r1, #2
	str fp, [sb, #0x1d4]
	bl sub_03804918
	b _0380497C
_03804D20:
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x25
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804D38:
	mov r0, r8
	bl sub_038053DC
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x26
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804D58:
	add r0, r8, #2
	bl sub_03805440
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x27
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804D78:
	add r0, r8, #4
	bl sub_038054A4
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x28
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804D98:
	add r0, r8, #4
	bl sub_03805508
	mov r0, #0
	str r0, [sb, #0x1d4]
	mov r0, #0x29
	mov r1, #0
	bl sub_03804918
	b _0380497C
_03804DB8:
	mov r1, #0
	str r1, [sb, #0x1d4]
	mov r1, #1
	bl sub_03804918
	b _0380497C
	.align 2, 0
_03804DCC: .word 0x027FFDE8
_03804DD0: .word 0x038094D0
_03804DD4: .word 0x038095D0
	arm_func_end sub_03804958

	arm_func_start sub_03804DD8
sub_03804DD8: ; 0x03804DD8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	add r0, sp, #2
	bl sub_038053B0
	ldrh r0, [sp, #2]
	mov r1, r0, lsl #0x1b
	movs r1, r1, lsr #0x1f
	bne _03804E04
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	beq _03804E5C
_03804E04:
	add r0, sp, #0
	bl sub_03805414
	ldrh r0, [sp, #2]
	mov r4, #0
	mov r0, r0, lsl #0x1b
	movs r0, r0, lsr #0x1f
	ldrneh r0, [sp]
	orrne r4, r4, #1
	bicne r0, r0, #0xf
	strneh r0, [sp]
	ldrh r0, [sp, #2]
	mov r0, r0, lsl #0x1a
	movs r0, r0, lsr #0x1f
	ldrneh r0, [sp]
	orrne r4, r4, #2
	bicne r0, r0, #0x40
	strneh r0, [sp]
	add r0, sp, #0
	bl sub_03805440
	mov r1, r4
	mov r0, #0x30
	bl sub_03804918
_03804E5C:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_03804DD8

	arm_func_start sub_03804E68
sub_03804E68: ; 0x03804E68
	stmdb sp!, {r4, lr}
	mov ip, #0
	mov r2, ip
	b _03804E94
_03804E78:
	mov r1, r2, lsl #2
	mov r1, r0, lsr r1
	and r1, r1, #0xf
	cmp r1, #0xa
	movhs r0, #0
	bhs _03804ED0
	add r2, r2, #1
_03804E94:
	cmp r2, #8
	blt _03804E78
	mov r4, #0
	mov lr, #1
	mov r2, #0xa
_03804EA8:
	mov r1, r4, lsl #2
	mov r1, r0, lsr r1
	and r3, r1, #0xf
	mul r1, lr, r2
	mla ip, lr, r3, ip
	add r4, r4, #1
	mov lr, r1
	cmp r4, #8
	blt _03804EA8
	mov r0, ip
_03804ED0:
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03804E68

	arm_func_start sub_03804ED8
sub_03804ED8: ; 0x03804ED8
	stmdb sp!, {r3, lr}
	mov r0, #0x8000
	bl sub_037FB53C
	ldrh r0, [sp]
	bic r0, r0, #1
	orr r0, r0, #1
	strh r0, [sp]
	bl sub_038057BC
	mov r0, #6
	mov r1, #0
	bl sub_03805830
	add r0, sp, #0
	mov r1, #1
	bl sub_038058A0
	bl sub_038057FC
	ldmia sp!, {r3, lr}
	bx lr
	arm_func_end sub_03804ED8

	arm_func_start sub_03804F1C
sub_03804F1C: ; 0x03804F1C
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	mov r4, r0
	and r4, r4, #1
	cmp r4, #1
	bne _03805034
	mov r0, #0x8000
	bl sub_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0
	mov r3, #1
	bl sub_03805760
	ldrh r0, [sp]
	mov r1, r0, lsl #0x1e
	mov r1, r1, lsr #0x1f
	cmp r1, r4
	beq _03805034
	bic r1, r0, #2
	mov r0, r4, lsl #0x1f
	orr r1, r1, r0, lsr #30
	mov r0, #0x8000
	strh r1, [sp]
	bl sub_037FB53C
	bl sub_038057BC
	mov r0, #6
	mov r1, #0
	bl sub_03805830
	add r0, sp, #0
	mov r1, #1
	bl sub_038058A0
	bl sub_038057FC
	mov r0, #0x86
	mov r1, #0x10
	add r2, sp, #4
	mov r3, #3
	bl sub_03805760
	cmp r4, #0
	add r0, sp, #4
	bne _03804FC4
	bl sub_03805540
	b _03804FC8
_03804FC4:
	bl sub_03805650
_03804FC8:
	bl sub_038057BC
	mov r0, #6
	mov r1, #0x10
	bl sub_03805830
	add r0, sp, #4
	mov r1, #3
	bl sub_038058A0
	bl sub_038057FC
	mov r0, #0x86
	mov r1, #0x50
	add r2, sp, #4
	mov r3, #3
	bl sub_03805760
	cmp r4, #0
	add r0, sp, #4
	bne _03805010
	bl sub_03805540
	b _03805014
_03805010:
	bl sub_03805650
_03805014:
	bl sub_038057BC
	mov r0, #6
	mov r1, #0x50
	bl sub_03805830
	add r0, sp, #4
	mov r1, #3
	bl sub_038058A0
	bl sub_038057FC
_03805034:
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03804F1C

	arm_func_start sub_03805040
sub_03805040: ; 0x03805040
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x20
	mov r3, #7
	bl sub_03805760
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03805040

	arm_func_start sub_0380506C
sub_0380506C: ; 0x0380506C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	bl sub_038057BC
	mov r0, #6
	mov r1, #0x20
	bl sub_03805830
	mov r0, r4
	mov r1, #7
	bl sub_038058A0
	bl sub_038057FC
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_0380506C

	arm_func_start sub_038050A4
sub_038050A4: ; 0x038050A4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x20
	mov r3, #4
	bl sub_03805760
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_038050A4

	arm_func_start sub_038050D0
sub_038050D0: ; 0x038050D0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x60
	mov r3, #3
	bl sub_03805760
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_038050D0

	arm_func_start sub_038050FC
sub_038050FC: ; 0x038050FC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	bl sub_038057BC
	mov r0, #6
	mov r1, #0x60
	bl sub_03805830
	mov r0, r4
	mov r1, #3
	bl sub_038058A0
	bl sub_038057FC
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_038050FC

	arm_func_start sub_03805134
sub_03805134: ; 0x03805134
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_03805760
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	and r0, r0, #0xb
	cmp r0, #1
	movne r0, #0
	bne _03805190
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x10
	mov r3, #1
	bl sub_03805760
	mov r0, #1
_03805190:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_03805134

	arm_func_start sub_0380519C
sub_0380519C: ; 0x0380519C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_03805760
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	and r0, r0, #0xb
	cmp r0, #1
	movne r0, #0
	bne _03805204
	bl sub_038057BC
	mov r0, #6
	mov r1, #0x10
	bl sub_03805830
	mov r0, r4
	mov r1, #1
	bl sub_038058A0
	bl sub_038057FC
	mov r0, #1
_03805204:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_0380519C

	arm_func_start sub_03805210
sub_03805210: ; 0x03805210
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_03805760
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #4
	movne r0, #0
	bne _03805268
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x10
	mov r3, #3
	bl sub_03805760
	mov r0, #1
_03805268:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_03805210

	arm_func_start sub_03805274
sub_03805274: ; 0x03805274
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_03805760
	ldrh r0, [sp]
	mov r0, r0, lsl #0x1c
	mov r0, r0, lsr #0x1c
	cmp r0, #4
	movne r0, #0
	bne _038052D8
	bl sub_038057BC
	mov r0, #6
	mov r1, #0x10
	bl sub_03805830
	mov r0, r4
	mov r1, #3
	bl sub_038058A0
	bl sub_038057FC
	mov r0, #1
_038052D8:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_03805274

	arm_func_start sub_038052E4
sub_038052E4: ; 0x038052E4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_03805760
	ldrh r0, [sp]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	moveq r0, #0
	beq _03805338
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x50
	mov r3, #3
	bl sub_03805760
	mov r0, #1
_03805338:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_038052E4

	arm_func_start sub_03805344
sub_03805344: ; 0x03805344
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	add r2, sp, #0
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_03805760
	ldrh r0, [sp]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1f
	moveq r0, #0
	beq _038053A4
	bl sub_038057BC
	mov r0, #6
	mov r1, #0x50
	bl sub_03805830
	mov r0, r4
	mov r1, #3
	bl sub_038058A0
	bl sub_038057FC
	mov r0, #1
_038053A4:
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	bx lr
	arm_func_end sub_03805344

	arm_func_start sub_038053B0
sub_038053B0: ; 0x038053B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0
	mov r3, #1
	bl sub_03805760
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_038053B0

	arm_func_start sub_038053DC
sub_038053DC: ; 0x038053DC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	bl sub_038057BC
	mov r0, #6
	mov r1, #0
	bl sub_03805830
	mov r0, r4
	mov r1, #1
	bl sub_038058A0
	bl sub_038057FC
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_038053DC

	arm_func_start sub_03805414
sub_03805414: ; 0x03805414
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x40
	mov r3, #1
	bl sub_03805760
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03805414

	arm_func_start sub_03805440
sub_03805440: ; 0x03805440
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	bl sub_038057BC
	mov r0, #6
	mov r1, #0x40
	bl sub_03805830
	mov r0, r4
	mov r1, #1
	bl sub_038058A0
	bl sub_038057FC
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03805440

	arm_func_start sub_03805478
sub_03805478: ; 0x03805478
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x30
	mov r3, #1
	bl sub_03805760
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03805478

	arm_func_start sub_038054A4
sub_038054A4: ; 0x038054A4
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	bl sub_038057BC
	mov r0, #6
	mov r1, #0x30
	bl sub_03805830
	mov r0, r4
	mov r1, #1
	bl sub_038058A0
	bl sub_038057FC
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_038054A4

	arm_func_start sub_038054DC
sub_038054DC: ; 0x038054DC
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	mov r2, r4
	mov r0, #0x86
	mov r1, #0x70
	mov r3, #1
	bl sub_03805760
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_038054DC

	arm_func_start sub_03805508
sub_03805508: ; 0x03805508
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0x8000
	bl sub_037FB53C
	bl sub_038057BC
	mov r0, #6
	mov r1, #0x70
	bl sub_03805830
	mov r0, r4
	mov r1, #1
	bl sub_038058A0
	bl sub_038057FC
	ldmia sp!, {r4, lr}
	bx lr
	arm_func_end sub_03805508

	arm_func_start sub_03805540
sub_03805540: ; 0x03805540
	ldr r1, [r0]
	mov r2, r1, lsl #0x12
	mov r2, r2, lsr #0x1a
	cmp r2, #0x23
	addls pc, pc, r2, lsl #2
	b _0380563C
_03805558: ; jump table
	b _038055E8 ; case 0
	b _038055E8 ; case 1
	b _038055E8 ; case 2
	b _038055E8 ; case 3
	b _038055E8 ; case 4
	b _038055E8 ; case 5
	b _038055E8 ; case 6
	b _038055E8 ; case 7
	b _038055E8 ; case 8
	b _038055E8 ; case 9
	b _0380563C ; case 10
	b _0380563C ; case 11
	b _0380563C ; case 12
	b _0380563C ; case 13
	b _0380563C ; case 14
	b _0380563C ; case 15
	b _038055E8 ; case 16
	b _038055E8 ; case 17
	b _038055F4 ; case 18
	b _038055F4 ; case 19
	b _038055F4 ; case 20
	b _038055F4 ; case 21
	b _038055F4 ; case 22
	b _038055F4 ; case 23
	b _038055F4 ; case 24
	b _038055F4 ; case 25
	b _0380563C ; case 26
	b _0380563C ; case 27
	b _0380563C ; case 28
	b _0380563C ; case 29
	b _0380563C ; case 30
	b _0380563C ; case 31
	b _03805618 ; case 32
	b _03805618 ; case 33
	b _038055F4 ; case 34
	b _038055F4 ; case 35
_038055E8:
	bic r1, r1, #0x4000
	str r1, [r0]
	bx lr
_038055F4:
	orr r2, r1, #0x4000
	mov r1, r2, lsl #0x12
	mov r1, r1, lsr #0x1a
	sub r1, r1, #0x12
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_03805618:
	orr r2, r1, #0x4000
	mov r1, r2, lsl #0x12
	mov r1, r1, lsr #0x1a
	sub r1, r1, #0x18
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_0380563C:
	ldr r1, [r0]
	bic r1, r1, #0x4000
	bic r1, r1, #0x3f00
	str r1, [r0]
	bx lr
	arm_func_end sub_03805540

	arm_func_start sub_03805650
sub_03805650: ; 0x03805650
	ldr r2, [r0]
	mov r1, r2, lsl #0x12
	mov r3, r1, lsr #0x1a
	cmp r3, #0x23
	addls pc, pc, r3, lsl #2
	b _0380574C
_03805668: ; jump table
	b _038056F8 ; case 0
	b _038056F8 ; case 1
	b _038056F8 ; case 2
	b _038056F8 ; case 3
	b _038056F8 ; case 4
	b _038056F8 ; case 5
	b _038056F8 ; case 6
	b _038056F8 ; case 7
	b _0380571C ; case 8
	b _0380571C ; case 9
	b _0380574C ; case 10
	b _0380574C ; case 11
	b _0380574C ; case 12
	b _0380574C ; case 13
	b _0380574C ; case 14
	b _0380574C ; case 15
	b _038056F8 ; case 16
	b _038056F8 ; case 17
	b _03805740 ; case 18
	b _03805740 ; case 19
	b _03805740 ; case 20
	b _03805740 ; case 21
	b _03805740 ; case 22
	b _03805740 ; case 23
	b _03805740 ; case 24
	b _03805740 ; case 25
	b _0380574C ; case 26
	b _0380574C ; case 27
	b _0380574C ; case 28
	b _0380574C ; case 29
	b _0380574C ; case 30
	b _0380574C ; case 31
	b _03805740 ; case 32
	b _03805740 ; case 33
	b _03805740 ; case 34
	b _03805740 ; case 35
_038056F8:
	mov r1, r2, lsl #0x11
	movs r1, r1, lsr #0x1f
	bxeq lr
	add r1, r3, #0x12
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_0380571C:
	mov r1, r2, lsl #0x11
	movs r1, r1, lsr #0x1f
	bxeq lr
	add r1, r3, #0x18
	bic r2, r2, #0x3f00
	mov r1, r1, lsl #0x1a
	orr r1, r2, r1, lsr #18
	str r1, [r0]
	bx lr
_03805740:
	orr r1, r2, #0x4000
	str r1, [r0]
	bx lr
_0380574C:
	ldr r1, [r0]
	bic r1, r1, #0x4000
	bic r1, r1, #0x3f00
	str r1, [r0]
	bx lr
	arm_func_end sub_03805650

	arm_func_start sub_03805760
sub_03805760: ; 0x03805760
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl sub_038057BC
	mov r0, r7
	mov r1, r6
	bl sub_03805830
	cmp r7, #6
	beq _038057A4
	cmp r7, #0x86
	bne _038057B0
	mov r0, r5
	mov r1, r4
	bl sub_03805930
	b _038057B0
_038057A4:
	mov r0, r5
	mov r1, r4
	bl sub_038058A0
_038057B0:
	bl sub_038057FC
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_03805760

	arm_func_start sub_038057BC
sub_038057BC: ; 0x038057BC
	mov ip, #0x4000000
	add ip, ip, #0x138
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x72
	strh r0, [ip]
	mov r3, #2
_038057D8:
	subs r3, r3, #1
	bne _038057D8
	bic r0, r0, #4
	orr r0, r0, #4
	strh r0, [ip]
	mov r3, #2
_038057F0:
	subs r3, r3, #1
	bne _038057F0
	bx lr
	arm_func_end sub_038057BC

	arm_func_start sub_038057FC
sub_038057FC: ; 0x038057FC
	mov ip, #0x4000000
	add ip, ip, #0x138
	mov r3, #2
_03805808:
	subs r3, r3, #1
	bne _03805808
	ldrh r0, [ip]
	bic r0, r0, #4
	orr r0, r0, #0
	strh r0, [ip]
	mov r3, #2
_03805824:
	subs r3, r3, #1
	bne _03805824
	bx lr
	arm_func_end sub_038057FC

	arm_func_start sub_03805830
sub_03805830: ; 0x03805830
	mov ip, #0x4000000
	add ip, ip, #0x138
	orr r1, r0, r1
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x74
	mov r2, #0
_0380584C:
	bic r0, r0, #3
	orr r0, r0, #0
	mov r3, #1
	tst r3, r1, lsr r2
	movne r3, #1
	moveq r3, #0
	orr r0, r0, r3
	strh r0, [ip]
	mov r3, #9
_03805870:
	subs r3, r3, #1
	bne _03805870
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_03805888:
	subs r3, r3, #1
	bne _03805888
	add r2, r2, #1
	cmp r2, #8
	bne _0380584C
	bx lr
	arm_func_end sub_03805830

	arm_func_start sub_038058A0
sub_038058A0: ; 0x038058A0
	mov ip, #0x4000000
	add ip, ip, #0x138
_038058A8:
	stmdb sp!, {r0, r1}
	tst r0, #1
	ldreqh r1, [r0]
	ldrneh r1, [r0, #-1]
	movne r1, r1, lsr #8
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x74
	mov r2, #0
_038058CC:
	bic r0, r0, #3
	orr r0, r0, #0
	mov r3, #1
	tst r3, r1, lsr r2
	movne r3, #1
	moveq r3, #0
	orr r0, r0, r3
	strh r0, [ip]
	mov r3, #9
_038058F0:
	subs r3, r3, #1
	bne _038058F0
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_03805908:
	subs r3, r3, #1
	bne _03805908
	add r2, r2, #1
	cmp r2, #8
	bne _038058CC
	ldmia sp!, {r0, r1}
	add r0, r0, #1
	subs r1, r1, #1
	bne _038058A8
	bx lr
	arm_func_end sub_038058A0

	arm_func_start sub_03805930
sub_03805930: ; 0x03805930
	mov ip, #0x4000000
	add ip, ip, #0x138
_03805938:
	stmdb sp!, {r0, r1}
	ldrh r0, [ip]
	bic r0, r0, #0x77
	orr r0, r0, #0x64
	mov r2, #0
	mov r1, #0
_03805950:
	bic r0, r0, #3
	orr r0, r0, #0
	strh r0, [ip]
	mov r3, #9
_03805960:
	subs r3, r3, #1
	bne _03805960
	ldrh r0, [ip]
	and r3, r0, #1
	cmp r3, #1
	moveq r3, #0x80
	movne r3, #0
	orr r2, r3, r2, lsr #1
	bic r0, r0, #2
	orr r0, r0, #2
	strh r0, [ip]
	mov r3, #9
_03805990:
	subs r3, r3, #1
	bne _03805990
	add r1, r1, #1
	cmp r1, #8
	bne _03805950
	ldmia sp!, {r0, r1}
	tst r0, #1
	beq _038059C8
	ldrh r3, [r0, #-1]
	bic r3, r3, #0xff00
	mov r2, r2, lsl #8
	orr r3, r2, r3
	strh r3, [r0, #-1]
	b _038059D8
_038059C8:
	ldrh r3, [r0]
	bic r3, r3, #0xff
	orr r3, r3, r2
	strh r3, [r0]
_038059D8:
	add r0, r0, #1
	subs r1, r1, #1
	bne _03805938
	bx lr
	arm_func_end sub_03805930

	arm_func_start sub_038059E8
sub_038059E8: ; 0x038059E8
	stmdb sp!, {r3, lr}
	ldr r3, _03805A2C ; =0x03809884
	mov ip, #1
	str r0, [r3, #8]
	ldr r0, _03805A30 ; =0x03809894
	mov r1, #0
	mov r2, #0xa4
	strb ip, [r3]
	bl sub_037FB07C
	ldr r1, _03805A34 ; =sub_03805BC8
	mov r0, #0xf
	bl PXI_SetFifoRecvCallback
	ldr r1, _03805A38 ; =sub_03805B18
	mov r0, #0xa
	bl PXI_SetFifoRecvCallback
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03805A2C: .word 0x03809884
_03805A30: .word 0x03809894
_03805A34: .word sub_03805BC8
_03805A38: .word sub_03805B18
	arm_func_end sub_038059E8

	arm_func_start sub_03805A3C
sub_03805A3C: ; 0x03805A3C
	stmdb sp!, {r3, lr}
	ldr r2, _03805A68 ; =0x04000304
	mov r0, #1
	ldrh r1, [r2]
	bic r1, r1, #2
	strh r1, [r2]
	bl sub_038022BC
	mov r0, #1
	bl sub_03801F54
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_03805A68: .word 0x04000304
	arm_func_end sub_03805A3C

	arm_func_start sub_03805A6C
sub_03805A6C: ; 0x03805A6C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x50
	str r0, [sp, #0x44]
	ldr r0, _03805B04 ; =0x0380A4F8
	mov sb, #4
	mov r7, #8
	mov r4, #3
	ldr r1, _03805B08 ; =0x0380A4F8
	ldr r6, _03805B0C ; =0x03809938
	mov sl, #0x600
	mov r8, #0
	mov r5, #0x1c0
	mov lr, #0x40
	mov ip, #5
	mov r3, #7
	mov r2, #9
	str r0, [sp, #0x1c]
	str r1, [sp, #0x20]
	add r0, sp, #0x1c
	add r1, sp, #0
	str sl, [sp, #0x24]
	str sb, [sp, #0x28]
	str r8, [sp, #0x3c]
	str r7, [sp, #0x40]
	str r6, [sp, #0x48]
	str r5, [sp, #0x4c]
	str r4, [sp]
	str lr, [sp, #0x38]
	str r4, [sp, #8]
	str sb, [sp, #0x18]
	str ip, [sp, #0x10]
	str r3, [sp, #4]
	str r7, [sp, #0x14]
	str r2, [sp, #0xc]
	bl sub_03805B10
	add sp, sp, #0x50
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bx lr
	.align 2, 0
_03805B04: .word 0x0380A4F8
_03805B08: .word 0x0380A4F8
_03805B0C: .word 0x03809938
	arm_func_end sub_03805A6C

	arm_func_start sub_03805B10
sub_03805B10: ; 0x03805B10
	ldr pc, _03805B14 ; =0x06000000
	.align 2, 0
_03805B14: .word 0x06000000
	arm_func_end sub_03805B10

	arm_func_start sub_03805B18
sub_03805B18: ; 0x03805B18
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r1
	ldrh r4, [r6]
	beq _03805B60
	mov r0, #0
	mov r2, #0x100
	bl MIi_CpuClear32
	strh r4, [r6]
	mov r0, #4
	strh r0, [r6, #2]
	mov r5, #0xa
	mov r4, #0
_03805B48:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	blt _03805B48
_03805B60:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_03805B18

	arm_func_start sub_03805B68
sub_03805B68: ; 0x03805B68
	cmp r0, #0
	moveq r0, #0
	bxeq lr
	ldr r1, _03805BC4 ; =OSi_ThreadInfo
	ldr r1, [r1, #8]
	b _03805BB4
_03805B80:
	cmp r1, r0
	bne _03805BB0
	ldr r0, [r0, #0x48]
	cmp r0, #0
	cmpne r0, #1
	beq _03805BA0
	cmp r0, #2
	b _03805BA8
_03805BA0:
	mov r0, #1
	bx lr
_03805BA8:
	mov r0, #0
	bx lr
_03805BB0:
	ldr r1, [r1, #0x4c]
_03805BB4:
	cmp r1, #0
	bne _03805B80
	mov r0, #0
	bx lr
	.align 2, 0
_03805BC4: .word OSi_ThreadInfo
	arm_func_end sub_03805B68

	arm_func_start sub_03805BC8
sub_03805BC8: ; 0x03805BC8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r4, r1
	cmp r4, #0x10000
	beq _03805BE8
	cmp r4, #0x20000
	beq _03805C80
	b _03805D24
_03805BE8:
	bl OS_DisableInterrupts
	mov r5, r0
	ldr r0, _03805D54 ; =0x03809894
	bl sub_03805B68
	cmp r0, #0
	beq _03805C10
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	b _03805C70
_03805C10:
	ldr r1, _03805D58 ; =0x03809884
	ldrb r0, [r1]
	cmp r0, #1
	beq _03805C30
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	b _03805C70
_03805C30:
	mov r2, #2
	mov r0, r5
	strb r2, [r1]
	bl OS_RestoreInterrupts
	mov r2, #0x400
	ldr r0, _03805D54 ; =0x03809894
	ldr r1, _03805D5C ; =sub_03805D6C
	ldr r3, _03805D60 ; =0x03809EF8
	str r2, [sp]
	mov r5, #0xa
	mov r2, #0
	str r5, [sp, #4]
	bl OS_CreateThread
	ldr r0, _03805D54 ; =0x03809894
	bl OS_WakeupThreadDirect
	mov r0, #1
_03805C70:
	cmp r0, #0
	bne _03805D48
	orr r6, r4, #5
	b _03805D28
_03805C80:
	bl OS_DisableInterrupts
	mov r5, r0
	ldr r0, _03805D54 ; =0x03809894
	bl sub_03805B68
	cmp r0, #0
	beq _03805CA8
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	b _03805D14
_03805CA8:
	ldr r1, _03805D58 ; =0x03809884
	ldrb r0, [r1]
	cmp r0, #3
	beq _03805CC8
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	b _03805D14
_03805CC8:
	mov r2, #4
	mov r0, r5
	strb r2, [r1]
	bl OS_RestoreInterrupts
	ldr r1, _03805D64 ; =sub_03805B18
	mov r0, #0xa
	bl PXI_SetFifoRecvCallback
	mov r2, #0x400
	ldr r0, _03805D54 ; =0x03809894
	ldr r1, _03805D68 ; =sub_03805DDC
	ldr r3, _03805D60 ; =0x03809EF8
	str r2, [sp]
	mov r5, #2
	mov r2, #0
	str r5, [sp, #4]
	bl OS_CreateThread
	ldr r0, _03805D54 ; =0x03809894
	bl OS_WakeupThreadDirect
	mov r0, #1
_03805D14:
	cmp r0, #0
	bne _03805D48
	orr r6, r4, #5
	b _03805D28
_03805D24:
	orr r6, r4, #7
_03805D28:
	mov r5, #0xf
	mov r4, #0
_03805D30:
	mov r0, r5
	mov r1, r6
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	blt _03805D30
_03805D48:
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03805D54: .word 0x03809894
_03805D58: .word 0x03809884
_03805D5C: .word sub_03805D6C
_03805D60: .word 0x03809EF8
_03805D64: .word sub_03805B18
_03805D68: .word sub_03805DDC
	arm_func_end sub_03805BC8

	arm_func_start sub_03805D6C
sub_03805D6C: ; 0x03805D6C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _03805DD8 ; =0x03809884
	ldr r0, [r1, #4]
	cmp r0, #0
	beq _03805D8C
	ldr r2, [r1, #0xc]
	mov r1, #0x6000000
	bl sub_037FB044
_03805D8C:
	ldr r0, _03805DD8 ; =0x03809884
	ldr r0, [r0, #8]
	bl sub_03805A6C
	mov r6, #0xf
	mov r5, #0x10000
	mov r4, #0
_03805DA4:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	blt _03805DA4
	bl OS_DisableInterrupts
	ldr r0, _03805DD8 ; =0x03809884
	mov r1, #3
	strb r1, [r0]
	bl OS_ExitThread
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03805DD8: .word 0x03809884
	arm_func_end sub_03805D6C

	arm_func_start sub_03805DDC
sub_03805DDC: ; 0x03805DDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, _03805FDC ; =0x060198A4
	ldr sl, _03805FE0 ; =0x060188A4
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	addne r0, sl, #0x1000
	ldrne r0, [r0, #0x54c]
	ldrne r0, [r0]
	ldrneh r0, [r0]
	cmpne r0, #0
	beq _03805E10
	bl sub_03805FE8
	bl sub_03805FF0
_03805E10:
	mov r6, #0
	add sb, sp, #0
	add r4, sl, #0x1000
	mov fp, #0x100
	mov r5, #4
	mov r8, r6
_03805E28:
	mov r1, sb
	mov r2, r8
	add r0, sl, #0x88
	bl OS_ReceiveMessage
	cmp r0, #0
	beq _03805E90
	ldr r0, [r4, #0x54c]
	cmp r0, #0
	beq _03805E28
	bl sub_03806914
	mov r7, r0
	mov r0, r6
	mov r1, r7
	mov r2, fp
	bl MIi_CpuClear32
	ldr r1, [sp]
	mov r0, r7
	ldrh r1, [r1]
	strh r1, [r7]
	strh r5, [r7, #2]
	bl sub_038068C8
	ldr r1, [sp]
	ldrh r0, [r1]
	orr r0, r0, #0x8000
	strh r0, [r1]
	b _03805E28
_03805E90:
	bl sub_03805FF8
	bl sub_03805B68
	cmp r0, #0
	beq _03805EB8
	add r0, sl, #0x88
	mov r1, #0
	mov r2, #1
	bl OS_SendMessage
	bl sub_03805FF8
	bl OS_JoinThread
_03805EB8:
	add r1, sp, #0
	add r0, sl, #0x88
	mov r2, #0
	bl OS_ReceiveMessage
	mov r5, r0
	add r1, sp, #0
	add r0, sl, #0x58
	mov r2, #0
	bl OS_ReceiveMessage
	mov r4, r0
	add r1, sp, #0
	mov r0, sl
	mov r2, #0
	bl OS_ReceiveMessage
	orr r1, r5, r4
	orrs r0, r0, r1
	beq _03805F00
	bl OS_Terminate
_03805F00:
	bl sub_03806000
	add r5, sp, #0
	mov r4, #0
_03805F0C:
	mov r1, r5
	mov r2, r4
	add r0, sl, #0x28
	bl OS_ReceiveMessage
	cmp r0, #0
	bne _03805F0C
	bl sub_03806008
	bl sub_03805B68
	cmp r0, #0
	beq _03805F4C
	add r0, sl, #0x28
	mov r1, #0
	mov r2, #1
	bl OS_SendMessage
	bl sub_03806008
	bl OS_JoinThread
_03805F4C:
	mov r0, #1
	bl sub_038022BC
	mov r0, #1
	bl sub_03801F54
	add r0, sl, #0x1000
	ldr r0, [r0, #0x54c]
	cmp r0, #0
	ldrne r1, [r0]
	ldrneh r0, [r1]
	cmpne r0, #0
	movne r0, #0
	strneh r0, [r1]
	ldr r0, _03805FE4 ; =0x03809884
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _03805F9C
	ldr r2, [r0, #0xc]
	mov r0, #0
	mov r1, #0x6000000
	bl sub_037FAFF8
_03805F9C:
	mov r6, #0xf
	mov r5, #0x20000
	mov r4, #0
_03805FA8:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	blt _03805FA8
	bl OS_DisableInterrupts
	ldr r0, _03805FE4 ; =0x03809884
	mov r1, #1
	strb r1, [r0]
	bl OS_ExitThread
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bx lr
	.align 2, 0
_03805FDC: .word 0x060198A4
_03805FE0: .word 0x060188A4
_03805FE4: .word 0x03809884
	arm_func_end sub_03805DDC

	arm_func_start sub_03805FE8
sub_03805FE8: ; 0x03805FE8
	ldr pc, _03805FEC ; =0x06005CEC
	.align 2, 0
_03805FEC: .word 0x06005CEC
	arm_func_end sub_03805FE8

	arm_func_start sub_03805FF0
sub_03805FF0: ; 0x03805FF0
	ldr pc, _03805FF4 ; =0x06001DEC
	.align 2, 0
_03805FF4: .word 0x06001DEC
	arm_func_end sub_03805FF0

	arm_func_start sub_03805FF8
sub_03805FF8: ; 0x03805FF8
	ldr pc, _03805FFC ; =0x060007A8
	.align 2, 0
_03805FFC: .word 0x060007A8
	arm_func_end sub_03805FF8

	arm_func_start sub_03806000
sub_03806000: ; 0x03806000
	ldr pc, _03806004 ; =0x06008D54
	.align 2, 0
_03806004: .word 0x06008D54
	arm_func_end sub_03806000

	arm_func_start sub_03806008
sub_03806008: ; 0x03806008
	ldr pc, _0380600C ; =0x060007B4
	.align 2, 0
_0380600C: .word 0x060007B4
	arm_func_end sub_03806008

	arm_func_start sub_03806010
sub_03806010: ; 0x03806010
	ldr r1, _03806048 ; =0x55555555
	ldr r2, _0380604C ; =0x33333333
	and r1, r1, r0, lsr #1
	sub r1, r0, r1
	ldr r0, _03806050 ; =0x0F0F0F0F
	and r3, r1, r2
	and r1, r2, r1, lsr #2
	add r1, r3, r1
	add r1, r1, r1, lsr #4
	and r0, r1, r0
	add r0, r0, r0, lsr #8
	add r0, r0, r0, lsr #16
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_03806048: .word 0x55555555
_0380604C: .word 0x33333333
_03806050: .word 0x0F0F0F0F
	arm_func_end sub_03806010

	arm_func_start sub_03806054
sub_03806054: ; 0x03806054
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, r1
	orr r4, r4, #1
	b _03806074
	arm_func_end sub_03806054

	arm_func_start sub_03806064
sub_03806064: ; 0x03806064
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	eor r4, r1, r3
	mov r4, r4, asr #1
	mov r4, r4, lsl #1
_03806074:
	orrs r5, r3, r2
	bne _03806084
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_03806084:
	mov r5, r0, lsr #0x1f
	add r5, r5, r1
	mov r6, r2, lsr #0x1f
	add r6, r6, r3
	orrs r6, r5, r6
	bne _038060B8
	mov r1, r2
	bl _s32_div_f
	ands r4, r4, #1
	movne r0, r1
	mov r1, r0, asr #0x1f
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_038060B8:
	cmp r1, #0
	bge _038060C8
	rsbs r0, r0, #0
	rsc r1, r1, #0
_038060C8:
	cmp r3, #0
	bge _038060D8
	rsbs r2, r2, #0
	rsc r3, r3, #0
_038060D8:
	orrs r5, r1, r0
	beq _038061FC
	mov r5, #0
	mov r6, #1
	cmp r3, #0
	bmi _03806104
_038060F0:
	add r5, r5, #1
	adds r2, r2, r2
	adcs r3, r3, r3
	bpl _038060F0
	add r6, r6, r5
_03806104:
	cmp r1, #0
	blt _03806124
_0380610C:
	cmp r6, #1
	beq _03806124
	sub r6, r6, #1
	adds r0, r0, r0
	adcs r1, r1, r1
	bpl _0380610C
_03806124:
	mov r7, #0
	mov ip, #0
	mov fp, #0
	b _0380614C
_03806134:
	orr ip, ip, #1
	subs r6, r6, #1
	beq _038061A4
	adds r0, r0, r0
	adcs r1, r1, r1
	adcs r7, r7, r7
_0380614C:
	subs r0, r0, r2
	sbcs r1, r1, r3
	sbcs r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _03806134
_03806168:
	subs r6, r6, #1
	beq _0380619C
	adds r0, r0, r0
	adcs r1, r1, r1
	adc r7, r7, r7
	adds r0, r0, r2
	adcs r1, r1, r3
	adc r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _03806134
	b _03806168
_0380619C:
	adds r0, r0, r2
	adc r1, r1, r3
_038061A4:
	ands r7, r4, #1
	moveq r0, ip
	moveq r1, fp
	beq _038061DC
	subs r7, r5, #0x20
	movge r0, r1, lsr r7
	bge _03806200
	rsb r7, r5, #0x20
	mov r0, r0, lsr r5
	orr r0, r0, r1, lsl r7
	mov r1, r1, lsr r5
	b _038061DC
	arm_func_end sub_03806064

	arm_func_start sub_038061D4
sub_038061D4: ; 0x038061D4
	mov r0, r1, lsr r7
	mov r1, #0
_038061DC:
	cmp r4, #0
	blt _038061EC
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_038061EC:
	rsbs r0, r0, #0
	rsc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_038061FC:
	mov r0, #0
_03806200:
	mov r1, #0
	cmp r4, #0
	blt _038061EC
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
	arm_func_end sub_038061D4

	arm_func_start sub_03806214
sub_03806214: ; 0x03806214
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #0
	b _03806228
	arm_func_end sub_03806214

	arm_func_start sub_03806220
sub_03806220: ; 0x03806220
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #1
_03806228:
	orrs r5, r3, r2
	bne _03806238
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_03806238:
	orrs r5, r1, r3
	bne _038060D8
	mov r1, r2
	bl sub_03806470
	cmp r4, #0
	movne r0, r1
	mov r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
	arm_func_end sub_03806220

	arm_func_start _s32_div_f
_s32_div_f: ; 0x0380625C
	eor ip, r0, r1
	and ip, ip, #0x80000000
	cmp r0, #0
	rsblt r0, r0, #0
	addlt ip, ip, #1
	cmp r1, #0
	rsblt r1, r1, #0
	beq _03806454
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	blo _03806454
	mov r2, #0x1c
	mov r3, r0, lsr #4
	cmp r1, r3, lsr #12
	suble r2, r2, #0x10
	movle r3, r3, lsr #0x10
	cmp r1, r3, lsr #4
	suble r2, r2, #8
	movle r3, r3, lsr #8
	cmp r1, r3
	suble r2, r2, #4
	movle r3, r3, lsr #4
	mov r0, r0, lsl r2
	rsb r1, r1, #0
	adds r0, r0, r0
	add r2, r2, r2, lsl #1
	add pc, pc, r2, lsl #2
	mov r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	mov r1, r3
_03806454:
	ands r3, ip, #0x80000000
	rsbne r0, r0, #0
	ands r3, ip, #1
	rsbne r1, r1, #0
	bx lr
	arm_func_end _s32_div_f

	arm_func_start sub_03806468
sub_03806468: ; 0x03806468
	cmp r1, #0
	bxeq lr
	arm_func_end sub_03806468

	arm_func_start sub_03806470
sub_03806470: ; 0x03806470
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	bxlo lr
	mov r2, #0x1c
	mov r3, r0, lsr #4
	cmp r1, r3, lsr #12
	suble r2, r2, #0x10
	movle r3, r3, lsr #0x10
	cmp r1, r3, lsr #4
	suble r2, r2, #8
	movle r3, r3, lsr #8
	cmp r1, r3
	suble r2, r2, #4
	movle r3, r3, lsr #4
	mov r0, r0, lsl r2
	rsb r1, r1, #0
	adds r0, r0, r0
	add r2, r2, r2, lsl #1
	add pc, pc, r2, lsl #2
	mov r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	mov r1, r3
	bx lr
	arm_func_end sub_03806470

	.public _0380664C
_0380664C:
	.byte 0x00, 0x06, 0x0C, 0x13
	.byte 0x19, 0x1F, 0x25, 0x2B, 0x31, 0x36, 0x3C, 0x41, 0x47, 0x4C, 0x51, 0x55, 0x5A, 0x5E, 0x62, 0x66
	.byte 0x6A, 0x6D, 0x70, 0x73, 0x75, 0x78, 0x7A, 0x7B, 0x7D, 0x7E, 0x7E, 0x7F, 0x7F, 0x00, 0x00, 0x00
	.byte 0x00, 0x80, 0x2E, 0xFD, 0x2F, 0xFD, 0x75, 0xFD, 0xA7, 0xFD, 0xCE, 0xFD, 0xEE, 0xFD, 0x09, 0xFE
	.byte 0x20, 0xFE, 0x34, 0xFE, 0x46, 0xFE, 0x57, 0xFE, 0x66, 0xFE, 0x74, 0xFE, 0x81, 0xFE, 0x8D, 0xFE
	.byte 0x98, 0xFE, 0xA3, 0xFE, 0xAD, 0xFE, 0xB6, 0xFE, 0xBF, 0xFE, 0xC7, 0xFE, 0xCF, 0xFE, 0xD7, 0xFE
	.byte 0xDF, 0xFE, 0xE6, 0xFE, 0xEC, 0xFE, 0xF3, 0xFE, 0xF9, 0xFE, 0xFF, 0xFE, 0x05, 0xFF, 0x0B, 0xFF
	.byte 0x11, 0xFF, 0x16, 0xFF, 0x1B, 0xFF, 0x20, 0xFF, 0x25, 0xFF, 0x2A, 0xFF, 0x2E, 0xFF, 0x33, 0xFF
	.byte 0x37, 0xFF, 0x3C, 0xFF, 0x40, 0xFF, 0x44, 0xFF, 0x48, 0xFF, 0x4C, 0xFF, 0x50, 0xFF, 0x53, 0xFF
	.byte 0x57, 0xFF, 0x5B, 0xFF, 0x5E, 0xFF, 0x62, 0xFF, 0x65, 0xFF, 0x68, 0xFF, 0x6B, 0xFF, 0x6F, 0xFF
	.byte 0x72, 0xFF, 0x75, 0xFF, 0x78, 0xFF, 0x7B, 0xFF, 0x7E, 0xFF, 0x81, 0xFF, 0x83, 0xFF, 0x86, 0xFF
	.byte 0x89, 0xFF, 0x8C, 0xFF, 0x8E, 0xFF, 0x91, 0xFF, 0x93, 0xFF, 0x96, 0xFF, 0x99, 0xFF, 0x9B, 0xFF
	.byte 0x9D, 0xFF, 0xA0, 0xFF, 0xA2, 0xFF, 0xA5, 0xFF, 0xA7, 0xFF, 0xA9, 0xFF, 0xAB, 0xFF, 0xAE, 0xFF
	.byte 0xB0, 0xFF, 0xB2, 0xFF, 0xB4, 0xFF, 0xB6, 0xFF, 0xB8, 0xFF, 0xBA, 0xFF, 0xBC, 0xFF, 0xBE, 0xFF
	.byte 0xC0, 0xFF, 0xC2, 0xFF, 0xC4, 0xFF, 0xC6, 0xFF, 0xC8, 0xFF, 0xCA, 0xFF, 0xCC, 0xFF, 0xCE, 0xFF
	.byte 0xCF, 0xFF, 0xD1, 0xFF, 0xD3, 0xFF, 0xD5, 0xFF, 0xD6, 0xFF, 0xD8, 0xFF, 0xDA, 0xFF, 0xDC, 0xFF
	.byte 0xDD, 0xFF, 0xDF, 0xFF, 0xE1, 0xFF, 0xE2, 0xFF, 0xE4, 0xFF, 0xE5, 0xFF, 0xE7, 0xFF, 0xE9, 0xFF
	.byte 0xEA, 0xFF, 0xEC, 0xFF, 0xED, 0xFF, 0xEF, 0xFF, 0xF0, 0xFF, 0xF2, 0xFF, 0xF3, 0xFF, 0xF5, 0xFF
	.byte 0xF6, 0xFF, 0xF8, 0xFF, 0xF9, 0xFF, 0xFA, 0xFF, 0xFC, 0xFF, 0xFD, 0xFF, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x00, 0x01, 0x02, 0x04, 0x04, 0x05, 0x06, 0x07, 0x02, 0x00, 0x03, 0x01, 0x08, 0x09, 0x0A, 0x0B
	.byte 0x0E, 0x0C, 0x0F, 0x0D, 0x00, 0x01, 0x05, 0x0E, 0x1A, 0x26, 0x33, 0x3F, 0x49, 0x54, 0x5C, 0x64
	.byte 0x6D, 0x74, 0x7B, 0x7F, 0x84, 0x89, 0x8F, 0x00, 0xC7, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01
	.byte 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x12, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0x0D, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x16, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00
	.byte 0x17, 0x00, 0x00, 0x00

	arm_func_start sub_03806854
sub_03806854: ; 0x03806854
	mov ip, #0x4000000
	str ip, [ip, #0x208]
	ldr r1, _038068BC ; =0x0380FFFC
	mov r0, #0
	str r0, [r1]
	ldr r1, _038068C0 ; =0x04000180
	mov r0, #0x100
	strh r0, [r1]
_03806874:
	ldrh r0, [r1]
	and r0, r0, #0xf
	cmp r0, #1
	bne _03806874
	ldr r1, _038068C0 ; =0x04000180
	mov r0, #0
	strh r0, [r1]
_03806890:
	ldrh r0, [r1]
	cmp r0, #1
	beq _03806890
	ldr r3, _038068C4 ; =0x027FFE00
	ldr ip, [r3, #0x34]
	mov lr, ip
	mov r0, #0
	mov r1, #0
	mov r2, #0
	mov r3, #0
	bx ip
	.align 2, 0
_038068BC: .word 0x0380FFFC
_038068C0: .word 0x04000180
_038068C4: .word 0x027FFE00
	arm_func_end sub_03806854

	arm_func_start sub_038068C8
sub_038068C8: ; 0x038068C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, #0x100
	mov r5, #0xa
	mov r4, #0
	b _038068E8
_038068E0:
	mov r0, r6
	bl VENEER_SVC_WaitByLoop
_038068E8:
	mov r0, r5
	mov r1, r7
	mov r2, r4
	bl sub_037FB3A4
	cmp r0, #0
	blt _038068E0
	ldr r0, _03806910 ; =0x06019DCC
	bl OS_UnlockMutex
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_03806910: .word 0x06019DCC
	arm_func_end sub_038068C8

	arm_func_start sub_03806914
sub_03806914: ; 0x03806914
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _0380695C ; =0x06019DCC
	bl OS_LockMutex
	ldr r4, _03806960 ; =0x027FFF96
	mov r5, #0x100
	b _03806934
_0380692C:
	mov r0, r5
	bl VENEER_SVC_WaitByLoop
_03806934:
	ldrh r1, [r4]
	tst r1, #1
	bne _0380692C
	ldr r0, _03806964 ; =0x060198A4
	orr r1, r1, #1
	strh r1, [r4]
	ldr r0, [r0, #0x54c]
	ldr r0, [r0, #8]
	ldmia sp!, {r3, r4, r5, lr}
	bx lr
	.align 2, 0
_0380695C: .word 0x06019DCC
_03806960: .word 0x027FFF96
_03806964: .word 0x060198A4
	arm_func_end sub_03806914

	arm_func_start sub_03806968
sub_03806968: ; 0x03806968
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, _03806A70 ; =0x00001FFF
	and r0, r0, r1
	mov r0, r0, lsl #0x10
	movs r2, r0, lsr #0x10
	moveq r0, #0
	beq _03806A68
	mov r1, #0
	mov r0, #1
	b _0380699C
_03806990:
	tst r2, r0, lsl r1
	bne _038069A4
	add r1, r1, #1
_0380699C:
	cmp r1, #0x10
	blt _03806990
_038069A4:
	mov r0, #0xf
	mov r3, #1
	b _038069BC
_038069B0:
	tst r2, r3, lsl r0
	bne _038069C4
	sub r0, r0, #1
_038069BC:
	cmp r0, #0
	bne _038069B0
_038069C4:
	sub r6, r0, r1
	cmp r6, #5
	movlt r0, #1
	movlt r0, r0, lsl r1
	movlt r0, r0, lsl #0x10
	movlt r0, r0, lsr #0x10
	blt _03806A68
	add r3, r0, r1
	add r3, r3, r3, lsr #31
	mov r4, r3, asr #1
	mov r5, #0
	mov lr, #1
	b _03806A1C
_038069F8:
	mov ip, r5, lsr #0x1f
	rsb r3, ip, r5, lsl #31
	add r3, ip, r3, ror #31
	mov r3, r3, lsl #1
	sub r3, r3, #1
	mla r4, r5, r3, r4
	tst r2, lr, lsl r4
	bne _03806A24
	add r5, r5, #1
_03806A1C:
	cmp r5, r6
	blt _038069F8
_03806A24:
	sub r2, r0, r4
	cmp r2, #5
	subge r2, r4, r1
	cmpge r2, #5
	bge _03806A50
	mov r2, #1
	mov r0, r2, lsl r0
	orr r0, r0, r2, lsl r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	b _03806A68
_03806A50:
	mov r3, #1
	mov r2, r3, lsl r4
	orr r0, r2, r3, lsl r0
	orr r0, r0, r3, lsl r1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
_03806A68:
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_03806A70: .word 0x00001FFF
	arm_func_end sub_03806968

	.rodata

_03806A88:
	.word OSi_IrqVBlank
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OSi_IrqTimer0
    .word OSi_IrqTimer1
    .word OSi_IrqTimer2
    .word OSi_IrqTimer3
	.word OS_IrqDummy
	.word OSi_IrqDma0
    .word OSi_IrqDma1
    .word OSi_IrqDma2
    .word OSi_IrqDma3
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.word OS_IrqDummy
	.byte 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0xFE, 0x7F, 0x02
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0xAA, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCC
	.byte 0x08, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xE3, 0x0C, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xF0, 0x10, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x3E, 0xF8, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFC
	.byte 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x10, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xFF, 0x14, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0xFF, 0x20, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF
	.byte 0x20, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x20, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC3, 0x28, 0x00, 0x02, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF
