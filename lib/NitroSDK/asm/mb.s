	.include "asm/macros.inc"
	.include "mb.inc"
	.include "global.inc"

	.public _start_AutoloadDoneCallback

	.text

	arm_func_start MB_CommSetParentStateCallback
MB_CommSetParentStateCallback: ; 0x0221BA70
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r1, _0221BA94 ; =mbc
	ldr r1, [r1]
	add r1, r1, #0x1000
	str r4, [r1, #0x4e4]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0221BA94: .word mbc
	arm_func_end MB_CommSetParentStateCallback

	arm_func_start MB_CommGetChildUser
MB_CommGetChildUser: ; 0x0221BA98
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r1, _0221BB18 ; =mbc
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	beq _0221BB08
	mov r0, r5
	bl IsChildAidValid
	cmp r0, #0
	beq _0221BB08
	ldr r0, _0221BB18 ; =mbc
	sub r1, r5, #1
	ldr r3, [r0]
	mov r2, #0x16
	add r0, r3, #0x1340
	mla r0, r1, r2, r0
	add r1, r3, #0x72
	add r1, r1, #0x1700
	bl MI_CpuCopy8
	mov r0, r4
	bl OS_RestoreInterrupts
	ldr r0, _0221BB18 ; =mbc
	ldr r0, [r0]
	add r0, r0, #0x72
	add r0, r0, #0x1700
	ldmia sp!, {r3, r4, r5, pc}
_0221BB08:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0221BB18: .word mbc
	arm_func_end MB_CommGetChildUser

	arm_func_start MB_CommIsBootable
MB_CommIsBootable: ; 0x0221BB1C
	stmdb sp!, {r4, lr}
	ldr r1, _0221BB6C ; =mbc
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	beq _0221BB64
	bl IsChildAidValid
	cmp r0, #0
	beq _0221BB64
	ldr r0, _0221BB6C ; =mbc
	sub r1, r4, #1
	ldr r0, [r0]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x1000
	ldr r0, [r0, #0x4e8]
	cmp r0, #7
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
_0221BB64:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0221BB6C: .word mbc
	arm_func_end MB_CommIsBootable

	arm_func_start MB_CommResponseRequest
MB_CommResponseRequest: ; 0x0221BB70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r7, r0
	bl OS_DisableInterrupts
	mov r6, r0
	cmp r4, #3
	addls pc, pc, r4, lsl #2
	b _0221BBD0
_0221BB90: ; jump table
	b _0221BBA0 ; case 0
	b _0221BBAC ; case 1
	b _0221BBB8 ; case 2
	b _0221BBC4 ; case 3
_0221BBA0:
	mov r5, #0xa
	mov r4, #4
	b _0221BBE0
_0221BBAC:
	mov r5, #0xa
	mov r4, #3
	b _0221BBE0
_0221BBB8:
	mov r5, #0xe
	mov r4, #2
	b _0221BBE0
_0221BBC4:
	mov r5, #7
	mov r4, #5
	b _0221BBE0
_0221BBD0:
	mov r0, r6
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0221BBE0:
	ldr r0, _0221BC4C ; =mbc
	ldr r0, [r0]
	cmp r0, #0
	beq _0221BC3C
	mov r0, r7
	bl IsChildAidValid
	cmp r0, #0
	beq _0221BC3C
	ldr r0, _0221BC4C ; =mbc
	sub r2, r7, #1
	ldr r1, [r0]
	add r0, r1, r2, lsl #2
	add r0, r0, #0x1000
	ldr r0, [r0, #0x4e8]
	cmp r5, r0
	bne _0221BC3C
	add r0, r1, r2, lsl #1
	add r1, r0, #0x1700
	mov r0, r6
	strh r4, [r1, #0x54]
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0221BC3C:
	mov r0, r6
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221BC4C: .word mbc
	arm_func_end MB_CommResponseRequest

	arm_func_start MBi_CommChangeParentState
MBi_CommChangeParentState: ; 0x0221BC50
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl IsChildAidValid
	cmp r0, #0
	beq _0221BC84
	ldr r0, _0221BC98 ; =mbc
	sub r1, r6, #1
	ldr r0, [r0]
	add r0, r0, r1, lsl #2
	add r0, r0, #0x1000
	str r5, [r0, #0x4e8]
_0221BC84:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl MBi_CommChangeParentStateCallbackOnly
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0221BC98: .word mbc
	arm_func_end MBi_CommChangeParentState

	arm_func_start MBi_CommChangeParentStateCallbackOnly
MBi_CommChangeParentStateCallbackOnly: ; 0x0221BC9C
	stmdb sp!, {r3, lr}
	ldr r3, _0221BCC0 ; =mbc
	ldr r3, [r3]
	add r3, r3, #0x1000
	ldr r3, [r3, #0x4e4]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	blx r3
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0221BCC0: .word mbc
	arm_func_end MBi_CommChangeParentStateCallbackOnly

	arm_func_start MBi_CommParentCallback
MBi_CommParentCallback: ; 0x0221BCC4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, #0x19
	bgt _0221BD1C
	bge _0221BF60
	cmp r5, #0x11
	bgt _0221BD10
	bge _0221C114
	cmp r5, #3
	bgt _0221C114
	cmp r5, #0
	blt _0221C114
	beq _0221BD54
	cmp r5, #1
	beq _0221BD78
	cmp r5, #3
	beq _0221BF54
	b _0221C114
_0221BD10:
	cmp r5, #0x15
	beq _0221BD40
	b _0221C114
_0221BD1C:
	cmp r5, #0xff
	bgt _0221BD34
	bge _0221C000
	cmp r5, #0x1c
	beq _0221BF68
	b _0221C114
_0221BD34:
	cmp r5, #0x100
	beq _0221C070
	b _0221C114
_0221BD40:
	mov r2, r4
	mov r0, #0
	mov r1, #1
	bl MBi_CommChangeParentState
	b _0221C114
_0221BD54:
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _0221C114
	cmp r0, #0x10
	bhs _0221C114
	mov r2, r4
	mov r1, #2
	bl MBi_CommChangeParentState
	b _0221C114
_0221BD78:
	ldrh r0, [r4, #0x10]
	cmp r0, #0
	beq _0221C114
	cmp r0, #0x10
	bhs _0221C114
	ldr r2, _0221C15C ; =mbc
	sub r0, r0, #1
	ldr r3, [r2]
	mov r1, #0
	add r0, r3, r0, lsl #1
	add r0, r0, #0x1400
	strh r1, [r0, #0x8a]
	ldr r0, [r2]
	ldrh r2, [r4, #0x10]
	add r0, r0, #0xa8
	add r3, r0, #0x1400
	sub r0, r2, #1
	add r0, r3, r0, lsl #2
	mov r2, #4
	bl MI_CpuFill8
	ldr r0, _0221C15C ; =mbc
	ldrh r1, [r4, #0x10]
	ldr r0, [r0]
	mov r2, #0x16
	add r0, r0, #0x1340
	sub r1, r1, #1
	mla r0, r1, r2, r0
	mov r1, #0
	bl MI_CpuFill8
	ldrh r0, [r4, #0x10]
	bl MBi_ClearParentPieceBuffer
	ldrh r1, [r4, #0x10]
	ldr r0, _0221C15C ; =mbc
	mov r3, #0
	ldr r2, [r0]
	sub r1, r1, #1
	add r1, r2, r1, lsl #1
	add r1, r1, #0x1700
	strh r3, [r1, #0x54]
	ldrh r7, [r4, #0x10]
	ldr r8, [r0]
	sub r2, r3, #1
	sub r6, r7, #1
	add r1, r8, r6
	add r1, r1, #0x1500
	ldrsb r3, [r1, #0x26]
	cmp r3, r2
	beq _0221BEA4
	ldr r1, _0221C160 ; =0x000005D4
	and r2, r3, #0xff
	mul r1, r2, r1
	add r2, r8, r1
	add r8, r2, #0x1d00
	mov r3, #1
	ldrh sb, [r8, #0x4e]
	mvn r2, r3, lsl r7
	and sb, sb, r2
	strh sb, [r8, #0x4e]
	ldr r8, [r0]
	sub sb, r3, #2
	add r8, r8, r1
	add r8, r8, #0x1d00
	ldrh ip, [r8, #0x50]
	orr r3, ip, r3, lsl r7
	strh r3, [r8, #0x50]
	ldr r3, [r0]
	add r3, r3, r6
	add r3, r3, #0x1000
	strb sb, [r3, #0x526]
	ldr r0, [r0]
	add r0, r0, r1
	add r0, r0, #0x1d00
	ldrh r1, [r0, #0x4c]
	and r1, r1, r2
	strh r1, [r0, #0x4c]
_0221BEA4:
	ldr r1, _0221C15C ; =mbc
	ldrh r2, [r4, #0x10]
	ldr r6, [r1]
	mov r3, #1
	add r0, r6, #0x1500
	ldrh r0, [r0, #0x36]
	tst r0, r3, lsl r2
	beq _0221BEF0
	add r0, r6, #0x1000
	ldrb r2, [r0, #0x535]
	sub r2, r2, #1
	strb r2, [r0, #0x535]
	ldr r0, [r1]
	ldrh r1, [r4, #0x10]
	add r0, r0, #0x1500
	ldrh r2, [r0, #0x36]
	mvn r1, r3, lsl r1
	and r1, r2, r1
	strh r1, [r0, #0x36]
_0221BEF0:
	ldrh r0, [r4, #0x10]
	ldr r1, _0221C15C ; =mbc
	ldr r2, [r1]
	sub r1, r0, #1
	add r1, r2, r1, lsl #2
	add r1, r1, #0x1000
	ldr r1, [r1, #0x4e8]
	cmp r1, #8
	bne _0221BF20
	mov r1, #9
	mov r2, #0
	bl MBi_CommChangeParentState
_0221BF20:
	ldrh r0, [r4, #0x10]
	mov r2, r4
	mov r1, #3
	bl MBi_CommChangeParentState
	ldrh r1, [r4, #0x10]
	ldr r0, _0221C15C ; =mbc
	mov r3, #0
	ldr r2, [r0]
	sub r0, r1, #1
	add r0, r2, r0, lsl #2
	add r0, r0, #0x1000
	str r3, [r0, #0x4e8]
	b _0221C114
_0221BF54:
	mov r0, r4
	bl MBi_CommParentRecvData
	b _0221C114
_0221BF60:
	bl MBi_CommParentSendData
	b _0221C114
_0221BF68:
	mov r8, #0
	ldr r6, _0221C15C ; =mbc
	ldr r4, _0221C160 ; =0x000005D4
	mov r7, r8
_0221BF78:
	mul sb, r8, r4
	ldr r1, [r6]
	add r2, r1, sb
	add r0, r2, #0x1000
	ldrb r0, [r0, #0xd52]
	cmp r0, #0
	addne r2, r2, #0x1d00
	ldrneh r3, [r2, #0x50]
	cmpne r3, #0
	beq _0221BFC8
	add r0, r1, #0x6c
	add r0, r0, #0x1800
	ldrh r2, [r2, #0x4e]
	add r0, r0, sb
	add r1, r1, #0x1340
	bl MB_UpdateGameInfoMember
	ldr r0, [r6]
	add r0, r0, sb
	add r0, r0, #0x1d00
	strh r7, [r0, #0x50]
_0221BFC8:
	add r0, r8, #1
	and r8, r0, #0xff
	cmp r8, #0x10
	blo _0221BF78
	bl MBi_GetGgid
	mov r6, r0
	bl MBi_GetTgid
	mov r4, r0
	bl MBi_GetAttribute
	mov r2, r0
	mov r0, r6
	mov r1, r4
	bl MB_SendGameInfoBeacon
	b _0221C114
_0221C000:
	ldrh r0, [r4, #2]
	cmp r0, #0xf
	addls pc, pc, r0, lsl #2
	b _0221C060
_0221C010: ; jump table
	b _0221C060 ; case 0
	b _0221C050 ; case 1
	b _0221C060 ; case 2
	b _0221C060 ; case 3
	b _0221C050 ; case 4
	b _0221C050 ; case 5
	b _0221C050 ; case 6
	b _0221C060 ; case 7
	b _0221C050 ; case 8
	b _0221C050 ; case 9
	b _0221C060 ; case 10
	b _0221C060 ; case 11
	b _0221C060 ; case 12
	b _0221C060 ; case 13
	b _0221C060 ; case 14
	b _0221C060 ; case 15
_0221C050:
	mov r0, #0
	mov r1, #9
	bl MBi_CommCallParentError
	b _0221C114
_0221C060:
	mov r0, #0
	mov r1, #8
	bl MBi_CommCallParentError
	b _0221C114
_0221C070:
	ldrh r0, [r4]
	cmp r0, #0x1d
	addls pc, pc, r0, lsl #2
	b _0221C108
_0221C080: ; jump table
	b _0221C0F8 ; case 0
	b _0221C108 ; case 1
	b _0221C108 ; case 2
	b _0221C108 ; case 3
	b _0221C108 ; case 4
	b _0221C108 ; case 5
	b _0221C108 ; case 6
	b _0221C0F8 ; case 7
	b _0221C0F8 ; case 8
	b _0221C108 ; case 9
	b _0221C108 ; case 10
	b _0221C108 ; case 11
	b _0221C108 ; case 12
	b _0221C0F8 ; case 13
	b _0221C0F8 ; case 14
	b _0221C0F8 ; case 15
	b _0221C108 ; case 16
	b _0221C0F8 ; case 17
	b _0221C0F8 ; case 18
	b _0221C108 ; case 19
	b _0221C108 ; case 20
	b _0221C0F8 ; case 21
	b _0221C108 ; case 22
	b _0221C108 ; case 23
	b _0221C108 ; case 24
	b _0221C0F8 ; case 25
	b _0221C108 ; case 26
	b _0221C108 ; case 27
	b _0221C108 ; case 28
	b _0221C0F8 ; case 29
_0221C0F8:
	mov r0, #0
	mov r1, #9
	bl MBi_CommCallParentError
	b _0221C114
_0221C108:
	mov r0, #0
	mov r1, #8
	bl MBi_CommCallParentError
_0221C114:
	cmp r5, #0x11
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, _0221C15C ; =mbc
	mov r0, #0
	ldr r1, [r1]
	mov r2, #0x7d00
	add r3, r1, #0x1000
	ldr r4, [r3, #0x4e4]
	bl MIi_CpuClearFast
	ldr r1, _0221C15C ; =mbc
	mov r0, #0
	str r0, [r1]
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r2, r0
	mov r1, #0xc
	blx r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0221C15C: .word mbc
_0221C160: .word 0x000005D4
	arm_func_end MBi_CommParentCallback

	arm_func_start MBi_CommParentRecvDataPerChild
MBi_CommParentRecvDataPerChild: ; 0x0221C164
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x34
	movs r6, r1
	addeq sp, sp, #0x34
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	cmp r6, #0xf
	addhi sp, sp, #0x34
	ldmhiia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r1, sp, #0x20
	mov r2, r6
	add r0, r0, #0xa
	bl MBi_SetRecvBufferFromChild
	ldr r1, _0221C63C ; =mbc
	ldrb r7, [sp, #0x20]
	ldr r2, [r1]
	sub r3, r6, #1
	add r4, r2, r3, lsl #2
	add r4, r4, #0x1000
	ldr r4, [r4, #0x4e8]
	mov r5, r0
	cmp r7, #0xb
	addls pc, pc, r7, lsl #2
	b _0221C634
_0221C1C0: ; jump table
	b _0221C634 ; case 0
	b _0221C634 ; case 1
	b _0221C634 ; case 2
	b _0221C634 ; case 3
	b _0221C634 ; case 4
	b _0221C634 ; case 5
	b _0221C634 ; case 6
	b _0221C1F0 ; case 7
	b _0221C488 ; case 8
	b _0221C530 ; case 9
	b _0221C5A0 ; case 10
	b _0221C634 ; case 11
_0221C1F0:
	cmp r4, #2
	bne _0221C298
	cmp r5, #0
	addeq sp, sp, #0x34
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r1, sp, #0
	mov r2, #0x1d
	bl MI_CpuCopy8
	ldr r2, _0221C63C ; =mbc
	sub r0, r6, #1
	ldr r1, [r2]
	ldr r3, [sp]
	add r1, r1, r0, lsl #2
	add r1, r1, #0x1000
	str r3, [r1, #0x4a8]
	ldr r1, [r2]
	ldrh r3, [sp, #0x1a]
	add r1, r1, r0, lsl #1
	add r1, r1, #0x1400
	strh r3, [r1, #0x8a]
	ldr r1, [r2]
	mov r2, #0x16
	add r1, r1, #0x1340
	mla r1, r0, r2, r1
	add r0, sp, #4
	bl MI_CpuCopy8
	ldr r0, _0221C63C ; =mbc
	sub r2, r6, #1
	ldr r3, [r0]
	mov r0, #0x16
	mul r7, r2, r0
	add r8, r3, #0x1340
	and r1, r6, #0xff
	ldrb r3, [r8, r7]
	mov r0, r1, lsl #0x1c
	add r2, sp, #4
	bic r1, r3, #0xf0
	orr r1, r1, r0, lsr #24
	strb r1, [r8, r7]
	mov r0, r6
	mov r1, #0xa
	bl MBi_CommChangeParentState
_0221C298:
	cmp r4, #0xa
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldrb lr, [r5, #0x1c]
	mov r0, #0
	cmp lr, #0x10
	bhs _0221C2F4
	ldr r2, _0221C63C ; =mbc
	ldr r1, _0221C640 ; =0x000005D4
	ldr r3, [r2]
	mla r4, lr, r1, r3
	add r1, r4, #0x1000
	ldrb r2, [r1, #0xd52]
	cmp r2, #0
	beq _0221C2F4
	sub r2, r6, #1
	add r3, r3, r2, lsl #2
	ldr r2, [r1, #0xd40]
	add r1, r3, #0x1000
	ldr r3, [r1, #0x4a8]
	ldr r1, [r2, #0x14]
	cmp r3, r1
	beq _0221C314
_0221C2F4:
	ldr r0, _0221C63C ; =mbc
	sub r1, r6, #1
	ldr r0, [r0]
	mov r2, #4
	add r0, r0, r1, lsl #1
	add r0, r0, #0x1700
	strh r2, [r0, #0x54]
	b _0221C390
_0221C314:
	mov r5, r0
	add r1, r4, #0x1d00
	mov r3, #1
	b _0221C33C
_0221C324:
	ldrh r2, [r1, #0x4e]
	tst r2, r3, lsl r5
	addne r0, r0, #1
	add r2, r5, #1
	andne r0, r0, #0xff
	and r5, r2, #0xff
_0221C33C:
	cmp r5, #0x10
	blo _0221C324
	ldr r2, _0221C63C ; =mbc
	ldr r1, _0221C640 ; =0x000005D4
	ldr r2, [r2]
	mla r1, lr, r1, r2
	add r1, r1, #0x1000
	ldr r1, [r1, #0xd40]
	ldrb r1, [r1, #0x18]
	cmp r0, r1
	blo _0221C390
	sub r0, r6, #1
	add r1, r2, r0, lsl #1
	add r3, r1, #0x1700
	mov r2, #0
	mov r0, r6
	mov r1, #0xb
	strh r2, [r3, #0x54]
	bl MBi_CommChangeParentState
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_0221C390:
	ldr r3, _0221C63C ; =mbc
	sub ip, r6, #1
	ldr r1, [r3]
	add r0, r1, ip, lsl #1
	add r4, r0, #0x1700
	ldrh r0, [r4, #0x54]
	cmp r0, #3
	beq _0221C3C0
	cmp r0, #4
	beq _0221C46C
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_0221C3C0:
	add r0, r1, #0x1500
	ldrh r0, [r0, #0x36]
	mov r5, #1
	tst r0, r5, lsl r6
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r1, r1, #0x1000
	ldrb r4, [r1, #0x535]
	ldr r2, _0221C640 ; =0x000005D4
	mov r0, r6
	add r4, r4, #1
	strb r4, [r1, #0x535]
	ldr r1, [r3]
	mul r4, lr, r2
	add r7, r1, #0x1500
	ldrh r8, [r7, #0x36]
	mov r2, #0
	mov r1, #5
	orr r8, r8, r5, lsl r6
	strh r8, [r7, #0x36]
	ldr r7, [r3]
	add r7, r7, ip
	add r7, r7, #0x1000
	strb lr, [r7, #0x526]
	ldr r7, [r3]
	add r7, r7, #0x4e
	add lr, r7, #0x1d00
	ldrh r7, [lr, r4]
	orr r7, r7, r5, lsl r6
	strh r7, [lr, r4]
	ldr r7, [r3]
	add r7, r7, #0xd50
	add lr, r7, #0x1000
	ldrh r7, [lr, r4]
	orr r5, r7, r5, lsl r6
	strh r5, [lr, r4]
	ldr r3, [r3]
	add r3, r3, ip, lsl #1
	add r3, r3, #0x1700
	strh r2, [r3, #0x54]
	bl MBi_CommChangeParentState
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_0221C46C:
	mov r2, #0
	mov r0, r6
	mov r1, #4
	strh r2, [r4, #0x54]
	bl MBi_CommChangeParentState
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_0221C488:
	cmp r4, #5
	bne _0221C4A8
	mov r0, r6
	mov r1, #0xe
	mov r2, #0
	bl MBi_CommChangeParentState
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_0221C4A8:
	cmp r4, #0xe
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r0, r2, r3, lsl #1
	add r0, r0, #0x1700
	ldrh r0, [r0, #0x54]
	cmp r0, #2
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r0, r2, r3
	add r0, r0, #0x1000
	ldrb r7, [r0, #0x526]
	ldr r4, _0221C640 ; =0x000005D4
	add r0, r2, #0x14c
	mul r5, r7, r4
	add r7, r0, #0x1c00
	ldrh r4, [r7, r5]
	mov r0, #1
	mov r2, #0
	orr r0, r4, r0, lsl r6
	strh r0, [r7, r5]
	ldr r4, [r1]
	mov r0, r6
	add r4, r4, r5
	add r4, r4, #0x1d00
	strh r2, [r4, #0x48]
	ldr r4, [r1]
	mov r1, #6
	add r3, r4, r3, lsl #1
	add r3, r3, #0x1700
	strh r2, [r3, #0x54]
	bl MBi_CommChangeParentState
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_0221C530:
	cmp r4, #6
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r0, r2, r3
	add r0, r0, #0x1000
	ldrb r4, [r0, #0x526]
	cmp r4, #0xff
	addeq sp, sp, #0x34
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r0, _0221C640 ; =0x000005D4
	ldrh r1, [sp, #0x22]
	mla r0, r4, r0, r2
	add r0, r0, #0x1d00
	ldrh r0, [r0, #0x4a]
	bl MBi_calc_nextsendblock
	ldr r2, _0221C63C ; =mbc
	ldr r1, _0221C640 ; =0x000005D4
	ldr r3, [r2]
	ldr r2, _0221C644 ; =_02247480
	mla r1, r4, r1, r3
	add r1, r1, #0x1d00
	strh r0, [r1, #0x4a]
	ldr r1, [r2]
	mov r0, #1
	orr r0, r1, r0, lsl r4
	str r0, [r2]
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_0221C5A0:
	cmp r4, #6
	bne _0221C5FC
	add r0, r2, r3
	add r0, r0, #0x1000
	ldrb r3, [r0, #0x526]
	cmp r3, #0xff
	addeq sp, sp, #0x34
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r1, _0221C640 ; =0x000005D4
	add r0, r2, #0x14c
	mul r4, r3, r1
	add r5, r0, #0x1c00
	mov r0, #1
	ldrh r1, [r5, r4]
	mvn r0, r0, lsl r6
	and r3, r1, r0
	mov r0, r6
	mov r1, #7
	mov r2, #0
	strh r3, [r5, r4]
	bl MBi_CommChangeParentState
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_0221C5FC:
	cmp r4, #7
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r0, r2, r3, lsl #1
	add r3, r0, #0x1700
	ldrh r0, [r3, #0x54]
	cmp r0, #5
	addne sp, sp, #0x34
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r2, #0
	mov r0, r6
	mov r1, #8
	strh r2, [r3, #0x54]
	bl MBi_CommChangeParentState
_0221C634:
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0221C63C: .word mbc
_0221C640: .word 0x000005D4
_0221C644: .word _02247480
	arm_func_end MBi_CommParentRecvDataPerChild

	arm_func_start MBi_CommParentRecvData
MBi_CommParentRecvData: ; 0x0221C648
	stmdb sp!, {r4, r5, r6, lr}
	mov ip, #0
	ldr r2, _0221C6E4 ; =mbc
	ldr r1, _0221C6E8 ; =0x000005D4
	mov r4, r0
	mov r3, ip
_0221C660:
	ldr r0, [r2]
	mla r5, ip, r1, r0
	add r0, r5, #0x1000
	ldrb r0, [r0, #0xd52]
	cmp r0, #0
	addne r0, r5, #0x1d00
	strneh r3, [r0, #0x4a]
	add r0, ip, #1
	mov r0, r0, lsl #0x10
	mov ip, r0, lsr #0x10
	cmp ip, #0x10
	blo _0221C660
	ldr r0, _0221C6EC ; =_02247480
	mov r1, #0
	ldr r5, _0221C6F0 ; =0x0000FFFF
	str r1, [r0]
	mov r6, #1
_0221C6A4:
	mov r0, r4
	mov r1, r6
	bl WM_ReadMPData
	cmp r0, #0
	ldrneh r1, [r0]
	cmpne r1, r5
	cmpne r1, #0
	beq _0221C6CC
	mov r1, r6
	bl MBi_CommParentRecvDataPerChild
_0221C6CC:
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	mov r6, r0, lsr #0x10
	cmp r6, #0xf
	bls _0221C6A4
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0221C6E4: .word mbc
_0221C6E8: .word 0x000005D4
_0221C6EC: .word _02247480
_0221C6F0: .word 0x0000FFFF
	arm_func_end MBi_CommParentRecvData

	arm_func_start MBi_CommParentSendMsg
MBi_CommParentSendMsg: ; 0x0221C6F4
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r2, _0221C730 ; =mbc
	mov r4, r1
	ldr r1, [r2]
	strb r0, [sp]
	add r0, sp, #0
	bl MBi_MakeParentSendBuffer
	ldr r0, _0221C730 ; =mbc
	mov r1, r4
	ldr r2, [r0]
	mov r0, #6
	bl MBi_BlockHeaderEnd
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0221C730: .word mbc
	arm_func_end MBi_CommParentSendMsg

	arm_func_start MBi_CommParentSendDLFileInfo
MBi_CommParentSendDLFileInfo: ; 0x0221C734
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	mov r5, #0
	add r0, sp, #6
	mov r1, r5
	mov r2, #0x10
	mvn r4, #0
	bl MI_CpuFill8
	ldr r1, _0221C8C0 ; =mbc
	mov r0, #1
	ldr r1, [r1]
	add ip, sp, #6
_0221C764:
	add r2, r1, r0, lsl #2
	add r2, r2, #0x1000
	ldr r2, [r2, #0x4e4]
	cmp r2, #5
	bne _0221C790
	add r2, r1, r0
	add r2, r2, #0x1500
	ldrsb r3, [r2, #0x25]
	ldrb r2, [ip, r3]
	add r2, r2, #1
	strb r2, [ip, r3]
_0221C790:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #0xf
	bls _0221C764
	ldr r2, _0221C8C4 ; =_02245980
	ldr ip, _0221C8C8 ; =0x000005D4
	ldrb r3, [r2]
	mov r0, #0
	add lr, sp, #6
_0221C7B8:
	add r2, r3, #1
	mov r3, r2, lsr #0x1f
	rsb r2, r3, r2, lsl #28
	add r2, r3, r2, ror #28
	and r3, r2, #0xff
	mla r2, r3, ip, r1
	add r2, r2, #0x1000
	ldrb r2, [r2, #0xd52]
	cmp r2, #0
	ldrneb r2, [lr, r3]
	cmpne r2, #0
	movne r0, r3, lsl #0x18
	movne r4, r0, asr #0x18
	bne _0221C800
	add r0, r0, #1
	and r0, r0, #0xff
	cmp r0, #0x10
	blo _0221C7B8
_0221C800:
	mvn r0, #0
	cmp r4, r0
	addeq sp, sp, #0x18
	moveq r0, #0x15
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, _0221C8C4 ; =_02245980
	mov r0, #1
	strb r4, [r2]
	mov r3, r0
_0221C824:
	add r2, r1, r0, lsl #2
	add r2, r2, #0x1000
	ldr r2, [r2, #0x4e4]
	cmp r2, #5
	bne _0221C854
	add r2, r1, r0
	add r2, r2, #0x1500
	ldrsb r2, [r2, #0x25]
	cmp r4, r2
	orreq r2, r5, r3, lsl r0
	moveq r2, r2, lsl #0x10
	moveq r5, r2, lsr #0x10
_0221C854:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	cmp r0, #0xf
	bls _0221C824
	mov r2, #3
	add r0, sp, #0
	strb r2, [sp]
	strh r4, [sp, #2]
	bl MBi_MakeParentSendBuffer
	movs r1, r0
	beq _0221C8A4
	ldr r0, _0221C8C0 ; =mbc
	ldr r3, _0221C8C8 ; =0x000005D4
	ldr r0, [r0]
	mov r2, #0xe4
	add r0, r0, #0x388
	add r0, r0, #0x1400
	mla r0, r4, r3, r0
	bl MI_CpuCopy8
_0221C8A4:
	ldr r0, _0221C8C0 ; =mbc
	mov r1, r5
	ldr r2, [r0]
	mov r0, #0xea
	bl MBi_BlockHeaderEnd
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0221C8C0: .word mbc
_0221C8C4: .word _02245980
_0221C8C8: .word 0x000005D4
	arm_func_end MBi_CommParentSendDLFileInfo

	arm_func_start MBi_ReloadCache
MBi_ReloadCache: ; 0x0221C8CC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x4c
	ldr r5, [r0, #0x14]
	ldr r4, [r0, #0x10]
	ldr r1, [r5, #0x14]
	add r0, r5, #0x10
	bl FS_FindArchive
	movs r6, r0
	add r0, sp, #4
	ldreq r6, [r5, #0x18]
	bl FS_InitFile
	ldr r2, [r4]
	mvn r0, #0
	str r0, [sp]
	ldr r3, [r4, #4]
	add r0, sp, #4
	mov r1, r6
	add r3, r2, r3
	bl FS_OpenFileDirect
	cmp r0, #0
	beq _0221C948
	ldr r1, [r4, #8]
	ldr r2, [r4, #4]
	add r0, sp, #4
	bl FS_ReadFile
	ldr r1, [r4, #4]
	cmp r1, r0
	moveq r0, #2
	streq r0, [r4, #0xc]
	add r0, sp, #4
	bl FS_CloseFile
_0221C948:
	ldr r0, [r4, #0xc]
	cmp r0, #2
	addeq sp, sp, #0x4c
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	mov r0, #0
	str r0, [r4]
	mov r0, #2
	str r0, [r4, #0xc]
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end MBi_ReloadCache

	arm_func_start MBi_CommParentSendBlock
MBi_CommParentSendBlock: ; 0x0221C970
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	ldr r5, _0221CC00 ; =mbc
	ldr r0, [r5]
	add r0, r0, #0x1000
	ldrb r0, [r0, #0x524]
	cmp r0, #0
	addeq sp, sp, #0x18
	moveq r0, #0x15
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r4, _0221CC04 ; =0x000005D4
	mov r1, #0
_0221C9A0:
	ldr r0, [r5]
	add r3, r0, #0x1000
	ldrb r0, [r3, #0x525]
	add r0, r0, #1
	mov r2, r0, lsr #0x1f
	rsb r0, r2, r0, lsl #28
	add r0, r2, r0, ror #28
	strb r0, [r3, #0x525]
	ldr r2, [r5]
	add r0, r2, #0x1000
	ldrb r0, [r0, #0x525]
	mla r3, r0, r4, r2
	add r2, r3, #0x1000
	ldrb r2, [r2, #0xd52]
	cmp r2, #0
	addne r2, r3, #0x1d00
	ldrneh r2, [r2, #0x4c]
	cmpne r2, #0
	bne _0221C9FC
	add r1, r1, #1
	and r1, r1, #0xff
	cmp r1, #0x10
	blo _0221C9A0
_0221C9FC:
	cmp r1, #0x10
	addeq sp, sp, #0x18
	moveq r0, #0x15
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl MBi_calc_sendblock
	ldr r0, _0221CC00 ; =mbc
	ldr r2, _0221CC04 ; =0x000005D4
	ldr r6, [r0]
	add r0, sp, #8
	add r1, r6, #0x1000
	ldrb r4, [r1, #0x525]
	add r1, r6, #0x12c
	add r3, r6, #0x388
	mul r5, r4, r2
	add r2, r6, r5
	add r2, r2, #0x1d00
	add r1, r1, #0x1c00
	add r3, r3, #0x1400
	ldrh r2, [r2, #0x48]
	add r1, r1, r5
	add r3, r3, r5
	bl MBi_get_blockinfo
	cmp r0, #0
	addeq sp, sp, #0x18
	moveq r0, #0x15
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _0221CC00 ; =mbc
	mov r3, #4
	ldr r1, [r0]
	strb r3, [sp]
	add r2, r1, #0x1000
	ldrb r4, [r2, #0x525]
	add r3, r3, #0x5d0
	add r0, sp, #0
	strh r4, [sp, #2]
	ldrb r4, [r2, #0x525]
	mla r2, r4, r3, r1
	add r2, r2, #0x1d00
	ldrh r2, [r2, #0x48]
	strh r2, [sp, #4]
	bl MBi_MakeParentSendBuffer
	ldr r1, _0221CC00 ; =mbc
	ldr r4, _0221CC04 ; =0x000005D4
	ldr r5, [r1]
	ldrb r1, [sp, #0x14]
	add r2, r5, #0x1000
	ldrb r2, [r2, #0x525]
	ldr r6, [sp, #0x10]
	ldr r3, [sp, #0xc]
	mla r4, r2, r4, r5
	add r2, r4, r1, lsl #2
	add r5, r4, #0x1000
	ldr r4, [r5, #0xd58]
	add r2, r2, #0x1000
	ldr r2, [r2, #0xd2c]
	ldr r1, [r4, r1, lsl #2]
	sub r2, r6, r2
	add r4, r2, r1
	ldr r5, [r5, #0xd54]
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl MBi_ReadFromCache
	cmp r0, #0
	bne _0221CBCC
	ldr r0, _0221CC00 ; =mbc
	ldr r0, [r0]
	add r0, r0, #0xce0
	add r6, r0, #0x7000
	mov r0, r6
	bl MBi_IsTaskBusy
	cmp r0, #0
	bne _0221CBC0
	ldr r0, [r5]
	cmp r0, #0
	subne r0, r0, #1
	strne r0, [r5]
	bne _0221CBC0
	add r2, r5, #0x30
	mov r7, #0
	mov r3, r7
	mov ip, r2
_0221CB44:
	add r0, r2, r3, lsl #4
	ldr r0, [r0, #0xc]
	cmp r0, #2
	bne _0221CB70
	cmp r7, #0
	beq _0221CB6C
	ldr r1, [r7]
	ldr r0, [r2, r3, lsl #4]
	cmp r1, r0
	bls _0221CB70
_0221CB6C:
	mov r7, ip
_0221CB70:
	add r3, r3, #1
	cmp r3, #4
	add ip, ip, #0x10
	blt _0221CB44
	cmp r7, #0
	bne _0221CB8C
	bl OS_Terminate
_0221CB8C:
	mov r0, #2
	str r0, [r5]
	mov r0, #1
	str r0, [r7, #0xc]
	bic r0, r4, #0x1f
	str r0, [r7]
	str r7, [r6, #0x10]
	ldr r1, _0221CC08 ; =MBi_ReloadCache
	mov r0, r6
	mov r2, #0
	mov r3, #4
	str r5, [r6, #0x14]
	bl MBi_SetTask
_0221CBC0:
	add sp, sp, #0x18
	mov r0, #0x15
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0221CBCC:
	ldr r0, _0221CC00 ; =mbc
	ldr r4, [sp, #0xc]
	ldr r2, [r0]
	ldr r1, _0221CC04 ; =0x000005D4
	add r0, r2, #0x1000
	ldrb r3, [r0, #0x525]
	add r0, r4, #6
	mla r1, r3, r1, r2
	add r1, r1, #0x1d00
	ldrh r1, [r1, #0x4c]
	bl MBi_BlockHeaderEnd
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221CC00: .word mbc
_0221CC04: .word 0x000005D4
_0221CC08: .word MBi_ReloadCache
	arm_func_end MBi_CommParentSendBlock

	arm_func_start MBi_CommParentSendData
MBi_CommParentSendData: ; 0x0221CC0C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	add r1, sp, #0
	mov r0, #0
	mov r2, #0xa
	bl MIi_CpuClear16
	mov r3, #1
	ldr r0, _0221CD84 ; =mbc
	mov r4, r3
	ldr ip, [r0]
	mov r5, r3
	mov r0, r3
	mov r1, r3
	mov r2, r3
_0221CC44:
	add lr, ip, r3, lsl #2
	add lr, lr, #0x1000
	ldr lr, [lr, #0x4e4]
	cmp lr, #0xb
	addls pc, pc, lr, lsl #2
	b _0221CCD8
_0221CC5C: ; jump table
	b _0221CCD8 ; case 0
	b _0221CCD8 ; case 1
	b _0221CC8C ; case 2
	b _0221CCD8 ; case 3
	b _0221CCAC ; case 4
	b _0221CC9C ; case 5
	b _0221CCD8 ; case 6
	b _0221CCD8 ; case 7
	b _0221CCBC ; case 8
	b _0221CCD8 ; case 9
	b _0221CCD8 ; case 10
	b _0221CCCC ; case 11
_0221CC8C:
	ldrh lr, [sp]
	orr lr, lr, r2, lsl r3
	strh lr, [sp]
	b _0221CCD8
_0221CC9C:
	ldrh lr, [sp, #2]
	orr lr, lr, r1, lsl r3
	strh lr, [sp, #2]
	b _0221CCD8
_0221CCAC:
	ldrh lr, [sp, #4]
	orr lr, lr, r0, lsl r3
	strh lr, [sp, #4]
	b _0221CCD8
_0221CCBC:
	ldrh lr, [sp, #6]
	orr lr, lr, r5, lsl r3
	strh lr, [sp, #6]
	b _0221CCD8
_0221CCCC:
	ldrh lr, [sp, #8]
	orr lr, lr, r4, lsl r3
	strh lr, [sp, #8]
_0221CCD8:
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
	cmp r3, #0xf
	bls _0221CC44
	ldrh r1, [sp, #6]
	cmp r1, #0
	beq _0221CD04
	mov r0, #5
	bl MBi_CommParentSendMsg
	b _0221CD64
_0221CD04:
	ldrh r1, [sp]
	cmp r1, #0
	beq _0221CD1C
	mov r0, #1
	bl MBi_CommParentSendMsg
	b _0221CD64
_0221CD1C:
	ldrh r1, [sp, #8]
	cmp r1, #0
	beq _0221CD34
	mov r0, #6
	bl MBi_CommParentSendMsg
	b _0221CD64
_0221CD34:
	ldrh r1, [sp, #4]
	cmp r1, #0
	beq _0221CD4C
	mov r0, #2
	bl MBi_CommParentSendMsg
	b _0221CD64
_0221CD4C:
	ldrh r0, [sp, #2]
	cmp r0, #0
	beq _0221CD60
	bl MBi_CommParentSendDLFileInfo
	b _0221CD64
_0221CD60:
	bl MBi_CommParentSendBlock
_0221CD64:
	cmp r0, #0x15
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, pc}
	ldr r1, _0221CD88 ; =0x0000FFFF
	mov r0, #0
	bl MBi_CommParentSendMsg
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0221CD84: .word mbc
_0221CD88: .word 0x0000FFFF
	arm_func_end MBi_CommParentSendData

	arm_func_start MBi_calc_sendblock
MBi_calc_sendblock: ; 0x0221CD8C
	ldr r1, _0221CDFC ; =_02247480
	mov r2, #1
	ldr r1, [r1]
	tst r1, r2, lsl r0
	bxeq lr
	ldr r2, _0221CE00 ; =mbc
	ldr r1, _0221CE04 ; =0x000005D4
	ldr r2, [r2]
	mla ip, r0, r1, r2
	add r0, ip, #0x1000
	ldrb r0, [r0, #0xd52]
	cmp r0, #0
	addne r0, ip, #0x1d00
	ldrneh r1, [r0, #0x4c]
	cmpne r1, #0
	bxeq lr
	ldrh r2, [r0, #0x48]
	ldrh r3, [r0, #0x4a]
	cmp r3, r2
	bhi _0221CDF0
	add r1, r3, #2
	cmp r2, r1
	addle r1, r2, #1
	strleh r1, [r0, #0x48]
	bxle lr
_0221CDF0:
	add r0, ip, #0x1d00
	strh r3, [r0, #0x48]
	bx lr
	.balign 4, 0
_0221CDFC: .word _02247480
_0221CE00: .word mbc
_0221CE04: .word 0x000005D4
	arm_func_end MBi_calc_sendblock

	arm_func_start MBi_calc_nextsendblock
MBi_calc_nextsendblock: ; 0x0221CE08
	cmp r1, r0
	movls r1, r0
	mov r0, r1
	bx lr
	arm_func_end MBi_calc_nextsendblock

	arm_func_start IsChildAidValid
IsChildAidValid: ; 0x0221CE18
	cmp r0, #1
	blo _0221CE2C
	cmp r0, #0xf
	movls r0, #1
	bxls lr
_0221CE2C:
	mov r0, #0
	bx lr
	arm_func_end IsChildAidValid

	arm_func_start MBi_CommCallParentError
MBi_CommCallParentError: ; 0x0221CE34
	stmdb sp!, {r3, lr}
	strh r1, [sp]
	add r2, sp, #0
	mov r1, #0xd
	bl MBi_CommChangeParentStateCallbackOnly
	ldmia sp!, {r3, pc}
	arm_func_end MBi_CommCallParentError

	arm_func_start MB_GetSegmentLength
MB_GetSegmentLength: ; 0x0221CE4C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x60
	mov r4, #0
	movs r7, r0
	mov r5, r4
	beq _0221CE98
	ldr ip, [r7, #0x2c]
	ldr r3, [r7, #0x24]
	add r1, sp, #0
	mov r2, #0x60
	sub r6, ip, r3
	bl FS_ReadFile
	cmp r0, #0x60
	mov r0, r7
	mov r1, r6
	mov r2, #0
	addhs r4, sp, #0
	bl FS_SeekFile
	b _0221CE9C
_0221CE98:
	ldr r4, _0221CEC8 ; =0x027FFE00
_0221CE9C:
	cmp r4, #0
	beq _0221CEBC
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x3c]
	add r1, r1, #0x268
	add r5, r1, r0
	cmp r5, #0x10000
	movlo r5, #0x10000
_0221CEBC:
	mov r0, r5
	add sp, sp, #0x60
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221CEC8: .word 0x027FFE00
	arm_func_end MB_GetSegmentLength

	arm_func_start MB_ReadSegment
MB_ReadSegment: ; 0x0221CECC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x6c
	str r2, [sp, #4]
	cmp r2, #0x164
	mov r2, #0
	mov sl, r0
	mov sb, r1
	str r2, [sp, #0x10]
	blo _0221D324
	ldr r4, [sp, #4]
	mov r5, sb
	str r2, [sp, #0xc]
	mov r6, r2
	mov fp, r2
	cmp sl, #0
	add r5, r5, #0x160
	sub r4, r4, #0x160
	beq _0221CF44
	ldr r7, [sl, #0x2c]
	ldr r3, [sl, #0x24]
	mov r2, #0x160
	sub r3, r7, r3
	str r3, [sp, #8]
	bl FS_ReadFile
	cmp r0, #0x160
	ldr r7, [sb, #0x80]
	movlt r4, fp
	cmp r7, #0
	moveq r7, #0x1000000
	b _0221CFC0
_0221CF44:
	ldr r0, _0221D330 ; =0x027FFE00
	mov r1, #1
	ldr r7, [r0, #0x80]
	add r0, sp, #0x24
	cmp r7, #0
	moveq r7, #0x1000000
	str r1, [sp, #0xc]
	bl FS_InitFile
	ldr r0, _0221D334 ; =ov13_02245988
	mov r1, #3
	bl FS_FindArchive
	mov r1, r0
	mvn r0, #0
	str r0, [sp]
	add r0, sp, #0x24
	mov r2, #0
	add r3, r7, #0x88
	bl FS_OpenFileDirect
	ldr r2, [sp, #0x50]
	ldr r1, [sp, #0x48]
	ldr r0, _0221D330 ; =0x027FFE00
	sub r1, r2, r1
	str r1, [sp, #8]
	mov r1, sb
	mov r2, #0x160
	add sl, sp, #0x24
	bl MI_CpuCopy8
	ldr r0, [sb, #0x60]
	orr r0, r0, #0x6000
	orr r0, r0, #0x400000
	str r0, [sb, #0x60]
_0221CFC0:
	cmp r4, #0x88
	movlo r4, #0
	blo _0221CFF8
	ldr r1, [sp, #8]
	mov r0, sl
	add r1, r1, r7
	mov r2, #0
	bl FS_SeekFile
	mov r0, sl
	mov r1, r5
	mov r2, #0x88
	bl FS_ReadFile
	add r5, r5, #0x88
	sub r4, r4, #0x88
_0221CFF8:
	cmp r4, #0x70
	blo _0221D070
	mov r0, r5
	mov r6, r5
	bl MBi_InitCache
	mov r0, #3
	str r0, [sp]
	mov r0, r6
	mov r1, #0
	mov r2, #0x160
	mov r3, sb
	add r5, r5, #0x70
	sub r4, r4, #0x70
	bl MBi_AttachCacheBuffer
	ldr r8, [sl, #8]
	mov r7, #0
	b _0221D040
_0221D03C:
	add r7, r7, #1
_0221D040:
	cmp r7, #3
	bge _0221D054
	ldrsb r0, [r8, r7]
	cmp r0, #0
	bne _0221D03C
_0221D054:
	mov r0, r8
	mov r2, r7
	add r1, r6, #0x10
	bl MI_CpuCopy8
	str r7, [r6, #0x14]
	str r8, [r6, #0x18]
	b _0221D074
_0221D070:
	mov r4, #0
_0221D074:
	cmp r4, #0x10
	movlo r4, #0
	blo _0221D0C4
	mov r0, #0
	str r0, [r5]
	ldr r1, [sl, #0x24]
	ldr r0, [sp, #8]
	ldr r2, [sb, #0x20]
	add r0, r0, r1
	add r0, r2, r0
	str r0, [r5, #4]
	ldr r1, [sl, #0x24]
	ldr r0, [sp, #8]
	ldr r2, [sb, #0x30]
	add r0, r0, r1
	add r0, r2, r0
	mov fp, r5
	str r0, [r5, #8]
	add r5, r5, #0x10
	sub r4, r4, #0x10
_0221D0C4:
	ldr r1, [sb, #0x2c]
	ldr r0, [sb, #0x3c]
	add r0, r1, r0
	cmp r4, r0
	blo _0221D16C
	ldr r7, [sl, #0x24]
	ldr r1, [fp, #4]
	mov r0, sl
	sub r1, r1, r7
	mov r2, #0
	bl FS_SeekFile
	ldr r2, [sb, #0x2c]
	mov r0, sl
	mov r1, r5
	bl FS_ReadFile
	mov r0, #3
	str r0, [sp]
	ldr r1, [fp, #4]
	ldr r2, [sb, #0x2c]
	mov r0, r6
	mov r3, r5
	bl MBi_AttachCacheBuffer
	ldr r1, [fp, #8]
	ldr r4, [sb, #0x2c]
	mov r0, sl
	mov r2, #0
	sub r1, r1, r7
	bl FS_SeekFile
	ldr r2, [sb, #0x3c]
	mov r0, sl
	add r1, r5, r4
	bl FS_ReadFile
	mov r0, #3
	str r0, [sp]
	ldr r1, [fp, #8]
	ldr r2, [sb, #0x3c]
	add r3, r5, r4
	mov r0, r6
	bl MBi_AttachCacheBuffer
	mov r0, #1
	str r0, [sp, #0x10]
	b _0221D240
_0221D16C:
	cmp r4, #0xcc00
	blo _0221D240
	ldr r7, [sl, #0x24]
	ldr r4, [fp, #4]
	mov r0, sl
	sub r1, r4, r7
	mov r2, #0
	bl FS_SeekFile
	mov r0, sl
	mov r1, r5
	mov r2, #0x4400
	bl FS_ReadFile
	mov r0, #3
	str r0, [sp]
	mov r0, r6
	mov r1, r4
	mov r2, #0x4400
	mov r3, r5
	bl MBi_AttachCacheBuffer
	add r1, r4, #0x4400
	mov r0, sl
	sub r1, r1, r7
	mov r2, #0
	bl FS_SeekFile
	mov r0, sl
	add r1, r5, #0x4400
	mov r2, #0x4400
	bl FS_ReadFile
	mov r0, #2
	str r0, [sp]
	mov r0, r6
	add r1, r4, #0x4400
	mov r2, #0x4400
	add r3, r5, #0x4400
	bl MBi_AttachCacheBuffer
	add r1, r4, #0x8800
	mov r0, sl
	sub r1, r1, r7
	mov r2, #0
	bl FS_SeekFile
	mov r0, sl
	add r1, r5, #0x8800
	mov r2, #0x4400
	bl FS_ReadFile
	mov r0, #2
	str r0, [sp]
	add r1, r4, #0x8800
	add r3, r5, #0x8800
	mov r0, r6
	mov r2, #0x4400
	bl MBi_AttachCacheBuffer
	mov r0, #1
	str r0, [sp, #0x10]
_0221D240:
	ldr r1, [sp, #8]
	mov r0, sl
	mov r2, #0
	bl FS_SeekFile
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0221D30C
	add r0, sp, #0x24
	bl FS_CloseFile
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0221D30C
	ldr r1, [sb, #0x20]
	ldr r0, _0221D338 ; =mbi_seg_header
	str r1, [sp, #0x14]
	ldr r2, [sb, #0x28]
	ldr r1, [sb, #0x20]
	ldr r4, [r0]
	sub r0, r2, r1
	str r0, [sp, #0x18]
	ldr r2, [r6, #0x48]
	ldr r1, [sb, #0x20]
	add r0, sp, #0x14
	sub r1, r2, r1
	str r1, [sp, #0x1c]
	ldr r1, [sp, #4]
	mov r2, #0x8000
	str r1, [sp, #0x20]
	mov r1, #0x4000
	mov r3, #1
	bl MBi_ReadSegmentHeader
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0221D2F4
	add r7, sp, #0x14
	mov r5, #0
_0221D2D0:
	ldmia r4, {r1, r2}
	mov r0, r7
	mov r3, r5
	add r2, r1, r2
	bl MBi_ReadSegmentHeader
	add r4, r4, #8
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0221D2D0
_0221D2F4:
	ldr r1, [sb, #0x28]
	ldr r2, _0221D33C ; =_start_AutoloadDoneCallback
	ldr r3, [r6, #0x48]
	ldr r0, _0221D340 ; =0xE12FFF1E
	sub r1, r2, r1
	str r0, [r3, r1]
_0221D30C:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0221D324
	ldr r1, [sp, #4]
	mov r0, sb
	bl DC_FlushRange
_0221D324:
	ldr r0, [sp, #0x10]
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0221D330: .word 0x027FFE00
_0221D334: .word ov13_02245988
_0221D338: .word mbi_seg_header
_0221D33C: .word _start_AutoloadDoneCallback
_0221D340: .word 0xE12FFF1E
	arm_func_end MB_ReadSegment

	arm_func_start MBi_ReadSegmentHeader
MBi_ReadSegmentHeader: ; 0x0221D344
	stmdb sp!, {r3, lr}
	mov lr, r1
	ldr ip, [r0]
	ldr r1, [r0, #0xc]
	cmp lr, #0x4000
	movlo lr, #0x4000
	cmp r2, #0x8000
	movhi r2, #0x8000
	cmp lr, ip
	add r1, ip, r1
	movlo lr, ip
	cmp r2, r1
	movhi r2, r1
	cmp lr, r2
	ldmhsia sp!, {r3, pc}
	cmp r3, #0
	beq _0221D3A0
	ldr r0, [r0, #8]
	sub r2, r2, lr
	add r0, r0, lr
	mov r1, #0
	bl MI_CpuFill8
	ldmia sp!, {r3, pc}
_0221D3A0:
	ldr r3, [r0, #4]
	ldr r1, [r0, #8]
	add r0, r3, lr
	add r1, r1, lr
	sub r2, r2, lr
	bl MI_CpuCopy8
	ldmia sp!, {r3, pc}
	arm_func_end MBi_ReadSegmentHeader

	arm_func_start MB_RegisterFile
MB_RegisterFile: ; 0x0221D3BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r4, #0xff
	bl OS_DisableInterrupts
	mov r5, r0
	bl MBi_IsStarted
	cmp r0, #0
	bne _0221D3F0
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0221D3F0:
	ldr r0, _0221D640 ; =mbc
	ldr r0, [r0]
	add r1, r0, #0x1000
	ldrb r1, [r1, #0x524]
	add r1, r1, #1
	cmp r1, #0x10
	ble _0221D41C
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0221D41C:
	ldr r1, _0221D644 ; =0x000005D4
	mov r6, #0
_0221D424:
	mla r2, r6, r1, r0
	add r2, r2, #0x1000
	ldr r3, [r2, #0xd40]
	cmp r3, r8
	bne _0221D448
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0221D448:
	ldrb r2, [r2, #0xd52]
	cmp r2, #0
	moveq r4, r6
	beq _0221D468
	add r2, r6, #1
	and r6, r2, #0xff
	cmp r6, #0x10
	blo _0221D424
_0221D468:
	cmp r6, #0x10
	bne _0221D480
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0221D480:
	ldr r1, _0221D644 ; =0x000005D4
	ldr r2, _0221D640 ; =mbc
	mul r6, r4, r1
	add r0, r0, r6
	add r0, r0, #0x1000
	str r8, [r0, #0xd40]
	ldr r0, [r2]
	mov r1, r7
	add r0, r0, #0x388
	add r0, r0, #0x1400
	add sb, r0, r6
	mov r0, sb
	bl MBi_MakeDownloadFileInfo
	add r0, r8, #0x1c
	add r1, sb, #0xc4
	mov r2, #0x20
	bl MI_CpuCopy8
	ldr r0, _0221D640 ; =mbc
	mov r1, sb
	ldr r0, [r0]
	add r0, r0, #0x12c
	add r0, r0, #0x1c00
	add r0, r0, r6
	bl MBi_MakeBlockInfoTable
	cmp r0, #0
	bne _0221D4F8
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0221D4F8:
	ldr r0, _0221D640 ; =mbc
	mov r1, r8
	ldr r2, [r0]
	add r0, r2, #0x6c
	add r0, r0, #0x1800
	add r0, r0, r6
	add r2, r2, #0x1300
	bl MBi_MakeGameInfo
	ldr r1, _0221D640 ; =mbc
	ldr r0, [r1]
	add r0, r0, r6
	add r0, r0, #0x1000
	strb r4, [r0, #0xd21]
	ldr r0, [r1]
	add r0, r0, #0x6c
	add r0, r0, #0x1800
	add r0, r0, r6
	bl MB_AddGameInfo
	ldr r2, _0221D640 ; =mbc
	ldr r3, _0221D648 ; =ov13_02247484
	ldr r1, [r2]
	ldrb r0, [r3]
	add r1, r1, r6
	add r1, r1, #0x1000
	strb r0, [r1, #0xd1f]
	ldr r1, [r2]
	mov r4, #1
	add r1, r1, r6
	add r1, r1, #0x1d00
	strh r4, [r1, #0x4e]
	ldr r1, [r2]
	add r8, r7, #0x1e8
	add r1, r1, r6
	add r1, r1, #0x1000
	str r7, [r1, #0xd44]
	ldr r1, [r2]
	add r4, r7, #0x258
	add r1, r1, r6
	add r1, r1, #0x1000
	str r8, [r1, #0xd54]
	ldr r1, [r2]
	add r7, r0, #1
	add r0, r1, r6
	add r0, r0, #0x1000
	str r4, [r0, #0xd58]
	ldr r0, [r2]
	strb r7, [r3]
	add r0, r0, r6
	add r0, r0, #0x1000
	ldr r0, [r0, #0xd54]
	ldr r0, [r0, #0x6c]
	cmp r0, #0
	beq _0221D604
	bl MBi_IsTaskAvailable
	cmp r0, #0
	bne _0221D604
	ldr r0, _0221D640 ; =mbc
	ldr r0, [r0]
	add r0, r0, #0xce0
	add r0, r0, #0x7000
	bl MBi_InitTaskInfo
	ldr r0, _0221D640 ; =mbc
	mov r1, #0x800
	ldr r0, [r0]
	add r0, r0, #0x4e0
	add r0, r0, #0x7000
	bl MBi_InitTaskThread
_0221D604:
	ldr r2, _0221D640 ; =mbc
	mov r3, #1
	ldr r1, [r2]
	mov r0, r5
	add r1, r1, r6
	add r1, r1, #0x1000
	strb r3, [r1, #0xd52]
	ldr r1, [r2]
	add r1, r1, #0x1000
	ldrb r2, [r1, #0x524]
	add r2, r2, #1
	strb r2, [r1, #0x524]
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0221D640: .word mbc
_0221D644: .word 0x000005D4
_0221D648: .word ov13_02247484
	arm_func_end MB_RegisterFile

	arm_func_start MBi_MakeDownloadFileInfo
MBi_MakeDownloadFileInfo: ; 0x0221D64C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r2, #0x22c0000
	mov r4, r1
	mov r5, r0
	str r2, [sp]
	ldr r0, [r4, #0x24]
	ldr r7, _0221D6BC ; =MBi_defaultLoadSegList
	str r0, [r5]
	ldr r0, [r4, #0x34]
	add r8, r5, #0xc
	str r0, [r5, #4]
	mov sb, #0
	add r6, sp, #0
_0221D680:
	mov r0, r4
	mov r1, r7
	mov r2, r8
	mov r3, r6
	bl MBi_SetSegmentInfo
	add sb, sb, #1
	cmp sb, #3
	add r8, r8, #0x10
	add r7, r7, #4
	blt _0221D680
	add r0, r4, #0x160
	add r1, r5, #0x3c
	mov r2, #0x88
	bl MI_CpuCopy8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0221D6BC: .word MBi_defaultLoadSegList
	arm_func_end MBi_MakeDownloadFileInfo

	arm_func_start MBi_SetSegmentInfo
MBi_SetSegmentInfo: ; 0x0221D6C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, [r1]
	mov r7, r0
	mov r6, r2
	mov r5, r3
	cmp r1, #0
	beq _0221D6F0
	cmp r1, #1
	beq _0221D73C
	cmp r1, #2
	beq _0221D80C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0221D6F0:
	ldr r0, [r7, #0x28]
	cmp r0, #0x2000000
	blo _0221D734
	cmp r0, #0x22c0000
	bhs _0221D734
	ldr r1, [r7, #0x2c]
	add r0, r0, r1
	cmp r0, #0x22c0000
	bhi _0221D734
	str r1, [r6, #8]
	ldr r0, [r7, #0x28]
	str r0, [r6, #4]
	str r0, [r6]
	ldr r0, [r6, #0xc]
	bic r0, r0, #1
	str r0, [r6, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0221D734:
	bl OS_Terminate
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0221D73C:
	ldr ip, [r7, #0x38]
	ldr r1, [r7, #0x3c]
	mov r2, #0
	mov r4, r2
	cmp ip, #0x2000000
	add r3, ip, r1
	blo _0221D788
	ldr r0, _0221D82C ; =0x023FE800
	cmp ip, r0
	bhs _0221D788
	cmp r3, #0x2300000
	bls _0221D7B4
	cmp r3, r0
	bhs _0221D780
	cmp r1, #0x40000
	movls r4, #1
	bls _0221D7B4
_0221D780:
	mov r2, #1
	b _0221D7B4
_0221D788:
	ldr r1, _0221D830 ; =0x037F8000
	cmp ip, r1
	blo _0221D7B0
	add r0, r1, #0x17000
	cmp ip, r0
	bhs _0221D7B0
	cmp r3, r0
	movls r4, #1
	movhi r2, #1
	b _0221D7B4
_0221D7B0:
	mov r2, #1
_0221D7B4:
	cmp r2, #1
	bne _0221D7C0
	bl OS_Terminate
_0221D7C0:
	ldr r0, [r7, #0x3c]
	cmp r4, #0
	str r0, [r6, #8]
	ldr r0, [r7, #0x38]
	str r0, [r6, #4]
	ldreq r0, [r6, #4]
	streq r0, [r6]
	beq _0221D7F8
	ldr r0, [r5]
	str r0, [r6]
	ldr r1, [r5]
	ldr r0, [r6, #8]
	add r0, r1, r0
	str r0, [r5]
_0221D7F8:
	ldr r0, [r6, #0xc]
	bic r0, r0, #1
	orr r0, r0, #1
	str r0, [r6, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0221D80C:
	ldr r0, _0221D834 ; =0x027FFE00
	mov r1, #0x160
	stmib r6, {r0, r1}
	str r0, [r6]
	ldr r0, [r6, #0xc]
	bic r0, r0, #1
	str r0, [r6, #0xc]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221D82C: .word 0x023FE800
_0221D830: .word 0x037F8000
_0221D834: .word 0x027FFE00
	arm_func_end MBi_SetSegmentInfo

	arm_func_start MBi_MakeBlockInfoTable
MBi_MakeBlockInfoTable: ; 0x0221D838
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	add r6, sl, #0xc
	cmp r1, #0
	mov r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r2, r0
_0221D854:
	str r0, [sl, r2, lsl #2]
	add r3, r1, r2, lsl #4
	add r2, r2, #1
	ldr r3, [r3, #0x14]
	and r2, r2, #0xff
	cmp r2, #3
	add r0, r0, r3
	blo _0221D854
	mov sb, #0
	ldr r4, _0221D900 ; =mbc
	strh sb, [r6]
	add r5, r1, #0xc
_0221D884:
	ldr r0, [r4]
	add r7, r5, sb, lsl #4
	add r0, r0, #0x1000
	ldr r1, [r0, #0x318]
	ldr r8, [r7, #8]
	add r0, r8, r1
	sub r0, r0, #1
	bl _u32_div_f
	mov r1, sb, lsl #1
	ldrh r3, [r6, r1]
	mov r2, r0, lsl #0x10
	ldr r1, [r7, #4]
	add r2, r3, r2, lsr #16
	mov r3, r2, lsl #0x10
	mov r0, sb
	mov r2, r8
	mov r7, r3, lsr #0x10
	bl IsAbleToLoad
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp sb, #2
	addlo r0, r6, sb, lsl #1
	strloh r7, [r0, #2]
	add r0, sb, #1
	and sb, r0, #0xff
	strhsh r7, [sl, #0x12]
	cmp sb, #3
	blo _0221D884
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_0221D900: .word mbc
	arm_func_end MBi_MakeBlockInfoTable

	arm_func_start MBi_get_blockinfo
MBi_get_blockinfo: ; 0x0221D904
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r4, [r1, #0x12]
	cmp r2, r4
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	mov ip, #2
_0221D91C:
	add r4, r1, ip, lsl #1
	ldrh r4, [r4, #0xc]
	cmp r2, r4
	bhs _0221D93C
	sub r4, ip, #1
	mov ip, r4, lsl #0x18
	movs ip, ip, asr #0x18
	bpl _0221D91C
_0221D93C:
	cmp ip, #0
	movlt r0, #0
	ldmltia sp!, {r3, r4, r5, pc}
	ldr r4, _0221D9B4 ; =mbc
	add r5, r1, ip, lsl #1
	ldr lr, [r4]
	ldrh r5, [r5, #0xc]
	add lr, lr, #0x1000
	ldr lr, [lr, #0x318]
	sub r5, r2, r5
	mul r2, r5, lr
	add r3, r3, #0xc
	add r5, r3, ip, lsl #4
	ldr r3, [r5, #8]
	sub lr, r3, r2
	str lr, [r0, #4]
	ldr r3, [r4]
	add r3, r3, #0x1000
	ldr r3, [r3, #0x318]
	cmp lr, r3
	strhi r3, [r0, #4]
	ldr r1, [r1, ip, lsl #2]
	add r1, r2, r1
	str r1, [r0, #8]
	ldr r1, [r5]
	add r1, r2, r1
	str r1, [r0]
	strb ip, [r0, #0xc]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0221D9B4: .word mbc
	arm_func_end MBi_get_blockinfo

	arm_func_start MBi_IsAbleToRecv
MBi_IsAbleToRecv: ; 0x0221D9B8
	ldr r3, _0221DA5C ; =MBi_defaultLoadSegList
	ldr r0, [r3, r0, lsl #2]
	cmp r0, #0
	beq _0221D9FC
	cmp r0, #1
	beq _0221DA18
	cmp r0, #2
	bne _0221DA4C
	ldr r0, _0221DA60 ; =0x027FFE00
	cmp r1, r0
	blo _0221DA54
	add r1, r1, r2
	add r0, r0, #0x160
	cmp r1, r0
	bhi _0221DA54
	mov r0, #1
	bx lr
_0221D9FC:
	cmp r1, #0x2000000
	blo _0221DA54
	add r0, r1, r2
	cmp r0, #0x22c0000
	bhi _0221DA54
	mov r0, #1
	bx lr
_0221DA18:
	cmp r1, #0x22c0000
	blo _0221DA30
	add r0, r1, r2
	cmp r0, #0x2300000
	movls r0, #1
	bxls lr
_0221DA30:
	cmp r1, #0x2000000
	blo _0221DA54
	add r0, r1, r2
	cmp r0, #0x2300000
	bhi _0221DA54
	mov r0, #1
	bx lr
_0221DA4C:
	mov r0, #0
	bx lr
_0221DA54:
	mov r0, #0
	bx lr
	.balign 4, 0
_0221DA5C: .word MBi_defaultLoadSegList
_0221DA60: .word 0x027FFE00
	arm_func_end MBi_IsAbleToRecv

	arm_func_start IsAbleToLoad
IsAbleToLoad: ; 0x0221DA64
	stmdb sp!, {r3, lr}
	ldr r3, _0221DB24 ; =MBi_defaultLoadSegList
	ldr r3, [r3, r0, lsl #2]
	cmp r3, #0
	beq _0221DA88
	cmp r3, #1
	beq _0221DA90
	cmp r3, #2
	bne _0221DB14
_0221DA88:
	bl MBi_IsAbleToRecv
	ldmia sp!, {r3, pc}
_0221DA90:
	cmp r1, #0x2000000
	blo _0221DAE8
	ldr r0, _0221DB28 ; =0x023FE800
	cmp r1, r0
	bhs _0221DAE8
	cmp r1, #0x2300000
	add r1, r1, r2
	bhs _0221DABC
	cmp r1, #0x2300000
	movhi r0, #0
	ldmhiia sp!, {r3, pc}
_0221DABC:
	cmp r1, #0x2300000
	movls r0, #1
	ldmlsia sp!, {r3, pc}
	ldr r0, _0221DB28 ; =0x023FE800
	cmp r1, r0
	bhs _0221DAE0
	cmp r2, #0x40000
	movls r0, #1
	ldmlsia sp!, {r3, pc}
_0221DAE0:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0221DAE8:
	ldr r3, _0221DB2C ; =0x037F8000
	cmp r1, r3
	blo _0221DB1C
	add r0, r3, #0x17000
	cmp r1, r0
	bhs _0221DB1C
	add r1, r1, r2
	cmp r1, r0
	movls r0, #1
	movhi r0, #0
	ldmia sp!, {r3, pc}
_0221DB14:
	mov r0, #0
	ldmia sp!, {r3, pc}
_0221DB1C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0221DB24: .word MBi_defaultLoadSegList
_0221DB28: .word 0x023FE800
_0221DB2C: .word 0x037F8000
	arm_func_end IsAbleToLoad

	arm_func_start MBi_BlockHeaderEnd
MBi_BlockHeaderEnd: ; 0x0221DB30
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r4, r2
	add r2, r6, #0x1f
	mov r5, r1
	mov r0, r4
	bic r1, r2, #0x1f
	bl DC_FlushRange
	bl DC_WaitWriteBufferEmpty
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl MBi_SendMP
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end MBi_BlockHeaderEnd

	arm_func_start MBi_calc_cksum
MBi_calc_cksum: ; 0x0221DB68
	mov r3, r1, asr #1
	cmp r3, #0
	mov r2, #0
	ble _0221DB8C
_0221DB78:
	ldrh r1, [r0], #2
	sub r3, r3, #1
	cmp r3, #0
	add r2, r2, r1
	bgt _0221DB78
_0221DB8C:
	mov r0, r2, lsl #0x10
	mov r0, r0, lsr #0x10
	add r1, r0, r2, lsr #16
	ldr r0, _0221DBB0 ; =0x0000FFFF
	add r1, r1, r1, lsr #16
	eor r0, r1, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.balign 4, 0
_0221DBB0: .word 0x0000FFFF
	arm_func_end MBi_calc_cksum

	arm_func_start MBi_MakeGameInfo
MBi_MakeGameInfo: ; 0x0221DBB4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	mov r1, r6
	mov r0, #0
	mov r2, #0x4c0
	bl MIi_CpuClear16
	mov r0, #0
	strb r0, [r6, #0x4b2]
	ldr r0, [r5, #0xc]
	mov r1, r6
	mov r2, #1
	bl MBi_ReadIconInfo
	cmp r0, #0
	moveq r7, #1
	ldr r0, [r5, #0x10]
	mov r1, r6
	mov r2, #0
	movne r7, #0
	bl MBi_ReadIconInfo
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	orrs r0, r7, r0
	beq _0221DC34
	mov r3, #1
	mov r1, r6
	mov r0, #0
	mov r2, #0x220
	strb r3, [r6, #0x4b2]
	bl MIi_CpuClearFast
_0221DC34:
	ldr r0, [r5, #0x14]
	cmp r4, #0
	str r0, [r6, #0x4b8]
	beq _0221DC54
	mov r0, r4
	add r1, r6, #0x220
	mov r2, #0x16
	bl MIi_CpuCopy16
_0221DC54:
	ldrb r0, [r5, #0x18]
	strb r0, [r6, #0x236]
	ldr r0, [r5, #4]
	bl mystrlen
	mov r2, r0, lsl #0x11
	ldr r0, [r5, #4]
	add r1, r6, #0x238
	mov r2, r2, lsr #0x10
	bl MIi_CpuCopy16
	ldr r0, [r5, #8]
	add r1, r6, #0x298
	mov r2, #0xc0
	bl MIi_CpuCopy16
	mov r1, #1
	strb r1, [r6, #0x358]
	add r0, r6, #0x300
	strh r1, [r0, #0x5a]
	add r0, r6, #0x400
	strh r1, [r0, #0xb0]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end MBi_MakeGameInfo

	arm_func_start MBi_ReadIconInfo
MBi_ReadIconInfo: ; 0x0221DCA4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x48
	cmp r2, #0
	movne r4, #0x200
	moveq r4, #0x20
	mov r6, r0
	mov r5, r1
	cmp r2, #0
	addne r5, r5, #0x20
	cmp r6, #0
	addeq sp, sp, #0x48
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, sp, #0
	bl FS_InitFile
	add r0, sp, #0
	mov r1, r6
	bl FS_OpenFile
	cmp r0, #0
	addeq sp, sp, #0x48
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x24]
	sub r0, r1, r0
	cmp r4, r0
	add r0, sp, #0
	beq _0221DD24
	bl FS_CloseFile
	add sp, sp, #0x48
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0221DD24:
	mov r1, r5
	mov r2, r4
	bl FS_ReadFile
	add r0, sp, #0
	bl FS_CloseFile
	mov r0, #1
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end MBi_ReadIconInfo

	arm_func_start MB_UpdateGameInfoMember
MB_UpdateGameInfoMember: ; 0x0221DD44
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, r2
	add r4, r6, #0x5e
	mov r0, r1
	add r1, r4, #0x300
	ldr r2, _0221DDB0 ; =0x0000014A
	mov r4, r3
	mov r7, #1
	bl MIi_CpuCopy16
	mov r2, #0
	mov r1, #2
_0221DD74:
	tst r5, r1, lsl r2
	addne r0, r7, #1
	add r2, r2, #1
	andne r7, r0, #0xff
	cmp r2, #0xf
	blt _0221DD74
	strb r7, [r6, #0x358]
	orr r1, r5, #1
	add r0, r6, #0x300
	strh r1, [r0, #0x5a]
	strh r4, [r0, #0x5c]
	ldrb r0, [r6, #0x4b4]
	add r0, r0, #1
	strb r0, [r6, #0x4b4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221DDB0: .word 0x0000014A
	arm_func_end MB_UpdateGameInfoMember

	arm_func_start mystrlen
mystrlen: ; 0x0221DDB4
	ldrh r1, [r0], #2
	mov r2, #0
	cmp r1, #0
	beq _0221DDD4
_0221DDC4:
	ldrh r1, [r0], #2
	add r2, r2, #1
	cmp r1, #0
	bne _0221DDC4
_0221DDD4:
	mov r0, r2
	bx lr
	arm_func_end mystrlen

	arm_func_start MB_AddGameInfo
MB_AddGameInfo: ; 0x0221DDDC
	ldr r1, _0221DE1C ; =ov13_022474A0
	ldr r2, [r1, #0x18]
	cmp r2, #0
	streq r0, [r1, #0x18]
	beq _0221DE10
	ldr r1, [r2, #0x4bc]
	cmp r1, #0
	beq _0221DE0C
_0221DDFC:
	mov r2, r1
	ldr r1, [r1, #0x4bc]
	cmp r1, #0
	bne _0221DDFC
_0221DE0C:
	str r0, [r2, #0x4bc]
_0221DE10:
	mov r1, #0
	str r1, [r0, #0x4bc]
	bx lr
	.balign 4, 0
_0221DE1C: .word ov13_022474A0
	arm_func_end MB_AddGameInfo

	arm_func_start MB_InitSendGameInfoStatus
MB_InitSendGameInfoStatus: ; 0x0221DE20
	ldr r0, _0221DE44 ; =ov13_022474A0
	mov r2, #0
	str r2, [r0, #0x18]
	str r2, [r0, #0x1c]
	mov r1, #1
	strb r1, [r0, #0x24]
	ldr ip, _0221DE48 ; =MBi_ClearSendStatus
	str r2, [r0, #0x14]
	bx ip
	.balign 4, 0
_0221DE44: .word ov13_022474A0
_0221DE48: .word MBi_ClearSendStatus
	arm_func_end MB_InitSendGameInfoStatus

	arm_func_start MBi_ClearSendStatus
MBi_ClearSendStatus: ; 0x0221DE4C
	ldr r0, _0221DE6C ; =ov13_022474A0
	mov r1, #0
	strb r1, [r0, #0x25]
	strb r1, [r0, #0x26]
	strb r1, [r0, #0x27]
	strb r1, [r0, #0x28]
	strb r1, [r0, #0x29]
	bx lr
	.balign 4, 0
_0221DE6C: .word ov13_022474A0
	arm_func_end MBi_ClearSendStatus

	arm_func_start MB_SendGameInfoBeacon
MB_SendGameInfoBeacon: ; 0x0221DE70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, _0221DEF8 ; =ov13_022474A0
	mov r7, r0
	mov r6, r1
	mov r5, r2
_0221DE84:
	ldrb r0, [r4, #0x24]
	cmp r0, #6
	addls pc, pc, r0, lsl #2
	b _0221DE84
_0221DE94: ; jump table
	b _0221DEB0 ; case 0
	b _0221DEB0 ; case 1
	b _0221DEC0 ; case 2
	b _0221DEC8 ; case 3
	b _0221DEDC ; case 4
	b _0221DEE4 ; case 5
	b _0221DE84 ; case 6
_0221DEB0:
	bl MBi_ReadyBeaconSendStatus
	cmp r0, #0
	bne _0221DE84
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0221DEC0:
	bl MBi_InitSendFixedBeacon
	b _0221DE84
_0221DEC8:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl MBi_SendFixedBeacon
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0221DEDC:
	bl MBi_InitSendVolatBeacon
	b _0221DE84
_0221DEE4:
	mov r0, r7
	mov r1, r6
	mov r2, r5
	bl MBi_SendVolatBeacon
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221DEF8: .word ov13_022474A0
	arm_func_end MB_SendGameInfoBeacon

	arm_func_start MBi_ReadyBeaconSendStatus
MBi_ReadyBeaconSendStatus: ; 0x0221DEFC
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r0, _0221DF94 ; =ov13_022474A0
	ldr r1, [r0, #0x18]
	cmp r1, #0
	bne _0221DF4C
	bl MBi_GetGgid
	mov r4, r0
	bl MBi_GetTgid
	str r0, [sp]
	mov ip, #8
	ldr r1, _0221DF98 ; =bsendBuff
	mov r3, r4
	mov r0, #0
	mov r2, #0x70
	str ip, [sp, #4]
	bl WM_SetGameInfo
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r4, pc}
_0221DF4C:
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	ldrne r1, [r0, #0x4bc]
	cmpne r1, #0
	ldreq r0, _0221DF94 ; =ov13_022474A0
	ldreq r1, [r0, #0x18]
	ldr r0, _0221DF94 ; =ov13_022474A0
	str r1, [r0, #0x1c]
	bl MBi_ClearSendStatus
	ldr r1, _0221DF94 ; =ov13_022474A0
	mov r2, #2
	ldr r3, [r1, #0x1c]
	mov r0, #1
	ldrb r3, [r3, #0x4b4]
	strb r3, [r1, #0x26]
	strb r2, [r1, #0x24]
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0221DF94: .word ov13_022474A0
_0221DF98: .word bsendBuff
	arm_func_end MBi_ReadyBeaconSendStatus

	arm_func_start MBi_InitSendFixedBeacon
MBi_InitSendFixedBeacon: ; 0x0221DF9C
	ldr r0, _0221DFEC ; =ov13_022474A0
	ldrb r1, [r0, #0x24]
	cmp r1, #2
	bxne lr
	ldr r2, [r0, #0x1c]
	ldrb r1, [r2, #0x4b2]
	cmp r1, #0
	bne _0221DFCC
	mov r1, #9
	strb r1, [r0, #0x28]
	str r2, [r0, #0x20]
	b _0221DFDC
_0221DFCC:
	mov r1, #4
	strb r1, [r0, #0x28]
	add r1, r2, #0x220
	str r1, [r0, #0x20]
_0221DFDC:
	ldr r0, _0221DFEC ; =ov13_022474A0
	mov r1, #3
	strb r1, [r0, #0x24]
	bx lr
	.balign 4, 0
_0221DFEC: .word ov13_022474A0
	arm_func_end MBi_InitSendFixedBeacon

	arm_func_start MBi_SendFixedBeacon
MBi_SendFixedBeacon: ; 0x0221DFF0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r3, _0221E144 ; =ov13_022474A0
	mov r6, r0
	ldr r4, [r3, #0x1c]
	ldr r0, [r3, #0x20]
	add ip, r4, #0x358
	add r7, r0, #0x62
	cmp r7, ip
	movls r0, #0x62
	mov r5, r1
	mov r4, r2
	strlsb r0, [r3, #0x4c]
	bls _0221E048
	sub r7, ip, r0
	and r1, r7, #0xff
	ldr r0, _0221E148 ; =bsendBuff + 0xE
	rsb r2, r1, #0x62
	add r1, r0, r1
	mov r0, #0
	strb r7, [r3, #0x4c]
	bl MIi_CpuClear16
_0221E048:
	ldr r0, _0221E144 ; =ov13_022474A0
	ldr r1, _0221E148 ; =bsendBuff + 0xE
	ldrb r2, [r0, #0x4c]
	ldr r0, [r0, #0x20]
	bl MIi_CpuCopy16
	ldr r2, _0221E144 ; =ov13_022474A0
	ldr r0, _0221E14C ; =bsendBuff + 0x8
	ldrb r7, [r2, #0x27]
	mov r3, #0
	mov r1, #0x68
	strb r7, [r2, #0x4a]
	ldrb r7, [r2, #0x28]
	strb r7, [r2, #0x4b]
	ldr r7, [r2, #0x1c]
	ldrb lr, [r2, #0x44]
	ldrb ip, [r7, #0x4b2]
	bic lr, lr, #3
	and ip, ip, #3
	orr ip, lr, ip
	strb ip, [r2, #0x44]
	ldrb ip, [r7, #0x4b3]
	strb ip, [r2, #0x45]
	ldrb ip, [r2, #0x26]
	strb ip, [r2, #0x46]
	ldr ip, [r7, #0x4b8]
	str ip, [r2, #0x40]
	ldrb lr, [r2, #0x44]
	ldrb ip, [r7, #0x4b5]
	bic lr, lr, #0xfc
	mov ip, ip, lsl #0x1a
	orr ip, lr, ip, lsr #24
	strb ip, [r2, #0x44]
	ldrb lr, [r2, #0x29]
	add ip, lr, #1
	strb ip, [r2, #0x29]
	strb lr, [r2, #0x47]
	strh r3, [r2, #0x48]
	bl MBi_calc_cksum
	ldr r1, _0221E144 ; =ov13_022474A0
	strh r0, [r1, #0x48]
	ldrb r0, [r1, #0x27]
	add r2, r0, #1
	strb r2, [r1, #0x27]
	ldrb r0, [r1, #0x28]
	and r2, r2, #0xff
	cmp r2, r0
	movhs r0, #4
	strhsb r0, [r1, #0x24]
	bhs _0221E118
	ldr r0, [r1, #0x20]
	add r0, r0, #0x62
	str r0, [r1, #0x20]
_0221E118:
	orr r0, r4, #3
	ldr r1, _0221E150 ; =bsendBuff
	mov r3, r6
	str r5, [sp]
	and r4, r0, #0xff
	mov r0, #0
	mov r2, #0x70
	str r4, [sp, #4]
	bl WM_SetGameInfo
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E144: .word ov13_022474A0
_0221E148: .word bsendBuff + 0xE
_0221E14C: .word bsendBuff + 0x8
_0221E150: .word bsendBuff
	arm_func_end MBi_SendFixedBeacon

	arm_func_start MBi_InitSendVolatBeacon
MBi_InitSendVolatBeacon: ; 0x0221E154
	ldr r1, _0221E180 ; =ov13_022474A0
	mov r3, #1
	ldr r0, [r1, #0x1c]
	mov r2, #5
	add r0, r0, #0x400
	strh r3, [r0, #0xb0]
	ldr r0, [r1, #0x1c]
	ldrb r0, [r0, #0x4b4]
	strb r0, [r1, #0x26]
	strb r2, [r1, #0x24]
	bx lr
	.balign 4, 0
_0221E180: .word ov13_022474A0
	arm_func_end MBi_InitSendVolatBeacon

	arm_func_start MBi_SendVolatBeacon
MBi_SendVolatBeacon: ; 0x0221E184
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	ldr r3, _0221E3DC ; =ov13_022474A0
	str r0, [sp, #8]
	ldr r0, [r3, #0x1c]
	ldrb r3, [r3, #0x26]
	ldrb r0, [r0, #0x4b4]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	cmp r3, r0
	beq _0221E1B4
	bl MBi_InitSendVolatBeacon
_0221E1B4:
	ldr r2, _0221E3DC ; =ov13_022474A0
	ldrb r0, [r2, #0x44]
	bic r0, r0, #3
	orr r0, r0, #2
	strb r0, [r2, #0x44]
	ldr r0, [r2, #0x1c]
	ldrb r3, [r0, #0x4b3]
	add r1, r0, #0x300
	strb r3, [r2, #0x45]
	ldrb r3, [r2, #0x26]
	strb r3, [r2, #0x46]
	ldr r3, [r0, #0x4b8]
	str r3, [r2, #0x40]
	ldrb r4, [r2, #0x44]
	ldrb r3, [r0, #0x4b5]
	bic r4, r4, #0xfc
	mov r3, r3, lsl #0x1a
	orr r3, r4, r3, lsr #24
	strb r3, [r2, #0x44]
	ldrb r4, [r2, #0x29]
	add r3, r4, #1
	strb r3, [r2, #0x29]
	strb r4, [r2, #0x47]
	ldrb r3, [r0, #0x358]
	strb r3, [r2, #0x4a]
	ldrh r3, [r1, #0x5a]
	strh r3, [r2, #0x4c]
	ldrh r1, [r1, #0x5c]
	strh r1, [r2, #0x4e]
	ldr r1, [r2, #0x10]
	cmp r1, #0
	bne _0221E248
	ldr r1, [r2, #0x14]
	cmp r1, #0
	beq _0221E248
	ldr r0, [r0, #0x4b8]
	blx r1
_0221E248:
	ldr r0, _0221E3DC ; =ov13_022474A0
	mov sb, #0
	ldr r1, _0221E3E0 ; =bsendBuff + 0x68
	ldr r2, [r0, #0x1c]
	b _0221E26C
_0221E25C:
	add r0, r2, sb
	ldrb r0, [r0, #0x4a8]
	strb r0, [r1, sb]
	add sb, sb, #1
_0221E26C:
	cmp sb, #8
	blt _0221E25C
	ldr r1, _0221E3E4 ; =bsendBuff + 0x10
	mov r0, #0
	mov r2, #0x58
	bl MIi_CpuClear16
	ldr r5, _0221E3DC ; =ov13_022474A0
	mov sl, #0
	ldr r1, [r5, #0x1c]
	mov r6, #2
	add r0, r1, #0x400
	add r1, r1, #0x300
	ldrh r2, [r0, #0xb0]
	ldrh r0, [r1, #0x5a]
	mov sb, sl
	ldr r7, _0221E3E4 ; =bsendBuff + 0x10
	eor r0, r2, r0
	mov r4, r0, lsl #0x10
	mov r8, r6
	mov fp, #0x16
	b _0221E310
_0221E2C0:
	mov r0, r8, lsl sb
	tst r0, r4, lsr #16
	beq _0221E30C
	ldr r0, [r5, #0x1c]
	mla r1, sl, fp, r7
	add r0, r0, #0x5e
	add r2, r0, #0x300
	mov r0, #0x16
	mla r0, sb, r0, r2
	mov r2, #0x16
	bl MIi_CpuCopy16
	ldr r0, [r5, #0x1c]
	add sl, sl, #1
	add r0, r0, #0x400
	ldrh r1, [r0, #0xb0]
	cmp sl, #4
	orr r1, r1, r6, lsl sb
	strh r1, [r0, #0xb0]
	beq _0221E318
_0221E30C:
	add sb, sb, #1
_0221E310:
	cmp sb, #0xf
	blt _0221E2C0
_0221E318:
	cmp sl, #4
	bhs _0221E338
	mov r0, #0x16
	mul r1, sl, r0
	ldr r2, _0221E3E4 ; =bsendBuff + 0x10
	ldrb r0, [r2, r1]
	bic r0, r0, #0xf0
	strb r0, [r2, r1]
_0221E338:
	ldr r2, _0221E3DC ; =ov13_022474A0
	mov r3, #0
	ldr r0, _0221E3E8 ; =bsendBuff + 0x8
	mov r1, #0x68
	strh r3, [r2, #0x48]
	bl MBi_calc_cksum
	ldr r2, _0221E3DC ; =ov13_022474A0
	strh r0, [r2, #0x48]
	ldr r1, [r2, #0x1c]
	add r0, r1, #0x400
	add r1, r1, #0x300
	ldrh r3, [r0, #0xb0]
	ldrh r0, [r1, #0x5a]
	ldr r1, _0221E3EC ; =bsendBuff
	cmp r3, r0
	moveq r0, #1
	streqb r0, [r2, #0x24]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #8]
	orr r2, r0, #3
	ldr r0, [sp, #0xc]
	and r4, r2, #0xff
	str r0, [sp]
	mov r0, #0
	mov r2, #0x70
	str r4, [sp, #4]
	bl WM_SetGameInfo
	ldr r0, _0221E3DC ; =ov13_022474A0
	ldr r1, [r0, #0x10]
	cmp r1, #1
	addne sp, sp, #0x14
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r0, #0x14]
	cmp r1, #0
	addeq sp, sp, #0x14
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r0, #0x1c]
	ldr r0, [r0, #0x4b8]
	blx r1
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0221E3DC: .word ov13_022474A0
_0221E3E0: .word bsendBuff + 0x68
_0221E3E4: .word bsendBuff + 0x10
_0221E3E8: .word bsendBuff + 0x8
_0221E3EC: .word bsendBuff
	arm_func_end MBi_SendVolatBeacon

	arm_func_start changeScanChannel
changeScanChannel: ; 0x0221E3F0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	bl WM_GetAllowedChannel
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh lr, [r4, #4]
	mov r2, #1
	mov ip, #0
	mov r5, lr
	mov r3, r2
_0221E41C:
	sub r1, r5, #1
	tst r0, r3, lsl r1
	cmpne lr, r5
	strneh r5, [r4, #4]
	bne _0221E458
	add r1, ip, #1
	mov r1, r1, lsl #0x10
	cmp r5, #0x10
	mov ip, r1, lsr #0x10
	moveq r1, r2
	addne r1, r5, #1
	mov r1, r1, lsl #0x10
	cmp ip, #0x10
	mov r5, r1, lsr #0x10
	blo _0221E41C
_0221E458:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end changeScanChannel

	arm_func_start MBi_IsSendEnabled
MBi_IsSendEnabled: ; 0x0221E460
	ldr r1, _0221E4BC ; =ov13_0224CF40
	mov r0, #0
	ldr ip, [r1, #8]
	mov r3, r0
	add r1, ip, #0x500
	ldrh r1, [r1, #0x28]
	mov r2, r0
	cmp r1, #1
	ldreqb r1, [ip, #0x50c]
	cmpeq r1, #0
	moveq r3, #1
	cmp r3, #0
	beq _0221E4A4
	add r1, ip, #0x500
	ldrh r1, [r1, #0x26]
	cmp r1, #0
	moveq r2, #1
_0221E4A4:
	cmp r2, #0
	addne r1, ip, #0x500
	ldrneh r1, [r1, #0x2a]
	cmpne r1, #0
	movne r0, #1
	bx lr
	.balign 4, 0
_0221E4BC: .word ov13_0224CF40
	arm_func_end MBi_IsSendEnabled

	arm_func_start MBi_OnInitializeDone
MBi_OnInitializeDone: ; 0x0221E4C0
	stmdb sp!, {r3, lr}
	ldr r0, _0221E508 ; =MBi_ParentCallback
	bl WM_SetIndCallback
	mov r1, r0
	mov r0, #0x80
	bl MBi_CheckWmErrcode
	ldr r3, _0221E50C ; =ov13_0224598C
	ldr r0, _0221E508 ; =MBi_ParentCallback
	ldrh r1, [r3, #4]
	str r1, [sp]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	bl WM_SetLifeTime
	mov r1, r0
	mov r0, #0x1d
	bl MBi_CheckWmErrcode
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0221E508: .word MBi_ParentCallback
_0221E50C: .word ov13_0224598C
	arm_func_end MBi_OnInitializeDone

	arm_func_start MBi_EndCommon
MBi_EndCommon: ; 0x0221E510
	stmdb sp!, {r3, lr}
	ldr r2, _0221E550 ; =ov13_0224CF40
	mov ip, #0
	ldr r3, [r2, #8]
	mov r1, r0
	strb ip, [r3, #0x50d]
	ldr r0, [r2, #0xc]
	add r0, r0, #0x1300
	strh ip, [r0, #0x16]
	ldr r0, [r2, #8]
	ldr r2, [r0, #0x51c]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0x11
	blx r2
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0221E550: .word ov13_0224CF40
	arm_func_end MBi_EndCommon

	arm_func_start MBi_ParentCallback
MBi_ParentCallback: ; 0x0221E554
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x1c
	mov r4, r0
	ldrh r1, [r4]
	cmp r1, #0x19
	bgt _0221E5BC
	bge _0221E698
	cmp r1, #0xf
	addls pc, pc, r1, lsl #2
	b _0221ED7C
_0221E57C: ; jump table
	b _0221E5D8 ; case 0
	b _0221EB4C ; case 1
	b _0221EC3C ; case 2
	b _0221ED7C ; case 3
	b _0221ED7C ; case 4
	b _0221ED7C ; case 5
	b _0221ED7C ; case 6
	b _0221E660 ; case 7
	b _0221E734 ; case 8
	b _0221ED7C ; case 9
	b _0221ED7C ; case 10
	b _0221ED7C ; case 11
	b _0221ED7C ; case 12
	b _0221EC84 ; case 13
	b _0221E988 ; case 14
	b _0221EA28 ; case 15
_0221E5BC:
	cmp r1, #0x1d
	bgt _0221E5CC
	beq _0221E610
	b _0221ED7C
_0221E5CC:
	cmp r1, #0x80
	beq _0221ECBC
	b _0221ED7C
_0221E5D8:
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0221E604
	ldr r0, _0221ED9C ; =ov13_0224CF40
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E604:
	bl MBi_OnInitializeDone
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E610:
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0221E63C
	ldr r0, _0221ED9C ; =ov13_0224CF40
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E63C:
	ldr r1, _0221ED9C ; =ov13_0224CF40
	ldr r0, _0221EDA0 ; =MBi_ParentCallback
	ldr r1, [r1, #8]
	bl WM_SetParentParameter
	mov r1, r0
	mov r0, #7
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E660:
	ldr r0, _0221ED9C ; =ov13_0224CF40
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x15
	ldr r2, [r2, #0x51c]
	blx r2
	ldr r0, _0221EDA0 ; =MBi_ParentCallback
	mov r1, #1
	bl WM_SetBeaconIndication
	mov r1, r0
	mov r0, #0x19
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E698:
	ldr r2, _0221ED9C ; =ov13_0224CF40
	ldr ip, [r2, #8]
	add r1, ip, #0x500
	ldrh r3, [r1, #0x26]
	cmp r3, #0
	bne _0221E6F8
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0221E6D4
	ldr r2, [ip, #0x51c]
	mov r1, r4
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E6D4:
	ldr r1, _0221EDA4 ; =ov13_0224598C
	ldr r0, _0221EDA0 ; =MBi_ParentCallback
	ldr r1, [r1, #0xc]
	bl WMi_StartParentEx
	mov r1, r0
	mov r0, #8
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E6F8:
	ldrh r3, [r4, #2]
	cmp r3, #0
	beq _0221E728
	mov r0, #0
	strh r0, [r1, #0x26]
	ldr r0, [r2, #8]
	mov r1, r4
	ldr r2, [r0, #0x51c]
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E728:
	bl MBi_EndCommon
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E734:
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0221E760
	ldr r0, _0221ED9C ; =ov13_0224CF40
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E760:
	ldrh r0, [r4, #8]
	cmp r0, #7
	bgt _0221E790
	bge _0221E7D8
	cmp r0, #2
	bgt _0221E968
	cmp r0, #0
	blt _0221E968
	beq _0221E7B0
	cmp r0, #2
	beq _0221E934
	b _0221E968
_0221E790:
	cmp r0, #9
	bgt _0221E7A0
	beq _0221E8F8
	b _0221E968
_0221E7A0:
	cmp r0, #0x1a
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r3, r4, pc}
	b _0221E968
_0221E7B0:
	ldr r1, _0221ED9C ; =ov13_0224CF40
	mov r2, #0
	ldr r0, [r1, #8]
	add sp, sp, #0x1c
	add r0, r0, #0x500
	strh r2, [r0, #0x2a]
	ldr r0, [r1, #8]
	add r0, r0, #0x500
	strh r2, [r0, #0x28]
	ldmia sp!, {r3, r4, pc}
_0221E7D8:
	ldr r2, _0221ED9C ; =ov13_0224CF40
	ldr r0, [r2, #8]
	add r0, r0, #0x500
	ldrh r1, [r0, #0x26]
	cmp r1, #1
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r3, r4, pc}
	ldrh lr, [r0, #0x2a]
	ldrh r3, [r4, #0x10]
	mov ip, #1
	mov r1, r4
	orr r3, lr, ip, lsl r3
	strh r3, [r0, #0x2a]
	ldr r2, [r2, #8]
	mov r0, #0
	ldr r2, [r2, #0x51c]
	blx r2
	ldr r1, _0221ED9C ; =ov13_0224CF40
	ldr r0, [r1, #8]
	add r0, r0, #0x500
	ldrh r0, [r0, #0x28]
	cmp r0, #0
	bne _0221E8C8
	ldr r0, [r1, #0xc]
	add r0, r0, #0x1000
	ldr r2, [r0, #0x31c]
	cmp r2, #0
	bne _0221E8C8
	mov r2, #1
	str r2, [r0, #0x31c]
	ldr r0, [r1, #8]
	ldr r1, _0221ED9C ; =ov13_0224CF40
	add r0, r0, #0x500
	ldrh r0, [r0, #0x2c]
	ldr ip, [r1, #8]
	mov r1, #1
	cmp r0, #0
	movne r2, #0
	mov r0, r2, lsl #0x10
	mov r3, r0, lsr #0x10
	add r0, ip, #0x500
	ldrh r4, [r0, #0x18]
	mov r2, #0
	str r4, [sp]
	str r3, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r1, [sp, #0x14]
	str r1, [sp, #0x18]
	ldrh r2, [r0, #0x1a]
	ldr r1, [ip, #0x504]
	ldr r0, _0221EDA0 ; =MBi_ParentCallback
	add r3, ip, #0x40
	bl WM_StartMPEx
	mov r1, r0
	mov r0, #0xe
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E8C8:
	bl MBi_IsSendEnabled
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r3, r4, pc}
	ldr r1, _0221ED9C ; =ov13_0224CF40
	mov r0, #0x19
	ldr r2, [r1, #8]
	mov r1, #0
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E8F8:
	ldr r2, _0221ED9C ; =ov13_0224CF40
	ldrh r3, [r4, #0x10]
	ldr r1, [r2, #8]
	mov r0, #1
	add r1, r1, #0x500
	ldrh ip, [r1, #0x2a]
	mvn r3, r0, lsl r3
	and r3, ip, r3
	strh r3, [r1, #0x2a]
	ldr r2, [r2, #8]
	mov r1, r4
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E934:
	ldr r0, _0221ED9C ; =ov13_0224CF40
	ldr r1, [r0, #8]
	add r0, r1, #0x500
	ldrh r0, [r0, #0x26]
	cmp r0, #1
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r3, r4, pc}
	ldr r2, [r1, #0x51c]
	mov r1, r4
	mov r0, #0x1c
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E968:
	ldr r0, _0221ED9C ; =ov13_0224CF40
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E988:
	ldr r2, _0221ED9C ; =ov13_0224CF40
	mov r1, #0
	ldr r0, [r2, #0xc]
	add r0, r0, #0x1000
	str r1, [r0, #0x31c]
	ldrh r0, [r4, #4]
	cmp r0, #0xa
	beq _0221E9B4
	cmp r0, #0xb
	beq _0221E9F0
	b _0221EA0C
_0221E9B4:
	ldr r0, [r2, #8]
	mov r3, #1
	add r0, r0, #0x500
	strh r3, [r0, #0x28]
	ldr r2, [r2, #8]
	add r0, r2, #0x500
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	addne sp, sp, #0x1c
	ldmneia sp!, {r3, r4, pc}
	ldr r2, [r2, #0x51c]
	mov r0, #0x19
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221E9F0:
	ldr r0, [r2, #8]
	ldr r1, [r4, #8]
	ldr r2, [r0, #0x51c]
	mov r0, #3
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221EA0C:
	ldr r0, [r2, #8]
	mov r1, r4
	ldr r2, [r0, #0x51c]
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221EA28:
	ldr r0, _0221ED9C ; =ov13_0224CF40
	ldr r3, [r0, #0xc]
	add r0, r3, #0x7000
	ldr r0, [r0, #0x4c8]
	cmp r0, #0
	beq _0221EA84
	mov r2, #0
	mov r1, r2
_0221EA48:
	add r0, r3, r1, lsl #2
	add r0, r0, #0x1000
	ldr r0, [r0, #0x4e8]
	cmp r0, #0
	beq _0221EA68
	add r2, r2, #1
	cmp r2, #2
	bhs _0221EA74
_0221EA68:
	add r1, r1, #1
	cmp r1, #0xf
	blo _0221EA48
_0221EA74:
	cmp r2, #1
	bne _0221EA84
	ldr r0, _0221EDA8 ; =0x000032C8
	bl OS_SpinWait
_0221EA84:
	ldr r0, _0221ED9C ; =ov13_0224CF40
	mov r2, #0
	ldr r1, [r0, #8]
	strb r2, [r1, #0x50c]
	ldrh r1, [r4, #2]
	cmp r1, #0
	bne _0221EAE8
	ldr r0, [r0, #8]
	mov r1, r4
	ldr r2, [r0, #0x51c]
	mov r0, #2
	blx r2
	ldr r0, _0221ED9C ; =ov13_0224CF40
	ldr r1, [r0, #8]
	add r0, r1, #0x500
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	addne sp, sp, #0x1c
	ldmneia sp!, {r3, r4, pc}
	ldr r2, [r1, #0x51c]
	mov r0, #0x19
	mov r1, #0
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221EAE8:
	cmp r1, #0xa
	ldr r0, [r0, #8]
	mov r1, r4
	bne _0221EB0C
	ldr r2, [r0, #0x51c]
	mov r0, #0x2a
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221EB0C:
	ldr r2, [r0, #0x51c]
	mov r0, #0x13
	blx r2
	ldr r0, _0221ED9C ; =ov13_0224CF40
	ldr r1, [r0, #8]
	add r0, r1, #0x500
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	addne sp, sp, #0x1c
	ldmneia sp!, {r3, r4, pc}
	ldr r2, [r1, #0x51c]
	mov r0, #0x19
	mov r1, #0
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221EB4C:
	ldr r1, _0221ED9C ; =ov13_0224CF40
	ldr r0, [r1, #0xc]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x320]
	cmp r0, #0
	bne _0221EBC8
	ldrh r0, [r4, #2]
	mov r2, #0
	cmp r0, #0
	ldr r0, [r1, #8]
	add r0, r0, #0x500
	beq _0221EB9C
	strh r2, [r0, #0x26]
	ldr r0, [r1, #8]
	mov r1, r4
	ldr r2, [r0, #0x51c]
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221EB9C:
	strh r2, [r0, #0x2a]
	ldr r1, [r1, #8]
	ldr r0, _0221EDA0 ; =MBi_ParentCallback
	add r1, r1, #0x500
	strh r2, [r1, #0x28]
	bl WM_End
	mov r1, r0
	mov r0, #2
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221EBC8:
	mov r1, #0
	mov r2, r1
	mov r0, #1
	bl WM_SetPortCallback
	mov r0, #0
	bl WM_SetIndCallback
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _0221EC1C
	ldr r2, _0221ED9C ; =ov13_0224CF40
	mov r3, #0
	ldr r0, [r2, #8]
	mov r1, r4
	add r0, r0, #0x500
	strh r3, [r0, #0x26]
	ldr r2, [r2, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221EC1C:
	ldr r0, _0221EDA0 ; =MBi_ParentCallback
	mov r1, #0
	bl WM_SetBeaconIndication
	mov r1, r0
	mov r0, #0x19
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221EC3C:
	ldrh r1, [r4, #2]
	cmp r1, #0
	beq _0221EC78
	ldr r2, _0221ED9C ; =ov13_0224CF40
	mov r3, #0
	ldr r0, [r2, #8]
	mov r1, r4
	add r0, r0, #0x500
	strh r3, [r0, #0x26]
	ldr r2, [r2, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221EC78:
	bl MBi_EndCommon
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221EC84:
	ldrh r0, [r4, #2]
	cmp r0, #0
	addne sp, sp, #0x1c
	ldmneia sp!, {r3, r4, pc}
	ldr r0, _0221ED9C ; =ov13_0224CF40
	ldrh r1, [r4, #0xa]
	ldr r0, [r0, #8]
	add sp, sp, #0x1c
	add r0, r0, #0x500
	ldrh r2, [r0, #0x2a]
	mvn r1, r1
	and r1, r2, r1
	strh r1, [r0, #0x2a]
	ldmia sp!, {r3, r4, pc}
_0221ECBC:
	ldrh r0, [r4, #4]
	sub r0, r0, #0x10
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _0221ED94
_0221ECD0: ; jump table
	b _0221ECF0 ; case 0
	b _0221ED10 ; case 1
	b _0221ED30 ; case 2
	b _0221ED50 ; case 3
	b _0221ED94 ; case 4
	b _0221ED94 ; case 5
	b _0221ED70 ; case 6
	b _0221ED94 ; case 7
_0221ECF0:
	ldr r0, _0221ED9C ; =ov13_0224CF40
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x1d
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221ED10:
	ldr r0, _0221ED9C ; =ov13_0224CF40
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x1f
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221ED30:
	ldr r0, _0221ED9C ; =ov13_0224CF40
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x20
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221ED50:
	ldr r0, _0221ED9C ; =ov13_0224CF40
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x21
	ldr r2, [r2, #0x51c]
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221ED70:
	bl OS_Terminate
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
_0221ED7C:
	ldr r0, _0221ED9C ; =ov13_0224CF40
	mov r1, r4
	ldr r2, [r0, #8]
	mov r0, #0x100
	ldr r2, [r2, #0x51c]
	blx r2
_0221ED94:
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0221ED9C: .word ov13_0224CF40
_0221EDA0: .word MBi_ParentCallback
_0221EDA4: .word ov13_0224598C
_0221EDA8: .word 0x000032C8
	arm_func_end MBi_ParentCallback

	arm_func_start MBi_ChildPortCallback
MBi_ChildPortCallback: ; 0x0221EDAC
	stmdb sp!, {r3, lr}
	mov r1, r0
	ldrh r0, [r1, #2]
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldrh r0, [r1, #4]
	cmp r0, #0x15
	bgt _0221EDE8
	bge _0221EE00
	cmp r0, #9
	ldmgtia sp!, {r3, pc}
	cmp r0, #7
	ldmltia sp!, {r3, pc}
	cmpne r0, #9
	ldmia sp!, {r3, pc}
_0221EDE8:
	cmp r0, #0x1a
	ldmgtia sp!, {r3, pc}
	cmp r0, #0x19
	ldmltia sp!, {r3, pc}
	cmpne r0, #0x1a
	ldmia sp!, {r3, pc}
_0221EE00:
	ldr r2, _0221EE18 ; =ov13_0224CF40
	mov r0, #9
	ldr r2, [r2, #8]
	ldr r2, [r2, #0x51c]
	blx r2
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0221EE18: .word ov13_0224CF40
	arm_func_end MBi_ChildPortCallback

	arm_func_start MBi_ChildCallback
MBi_ChildCallback: ; 0x0221EE1C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov r6, r0
	ldrh r2, [r6]
	ldr r1, _0221F634 ; =ov13_0224CF40
	cmp r2, #0x1d
	ldr r4, [r1, #8]
	bgt _0221EEA8
	cmp r2, #0x1d
	bge _0221EF14
	cmp r2, #0x15
	addls pc, pc, r2, lsl #2
	b _0221F61C
_0221EE50: ; jump table
	b _0221EEB4 ; case 0
	b _0221F534 ; case 1
	b _0221F594 ; case 2
	b _0221F61C ; case 3
	b _0221F61C ; case 4
	b _0221F61C ; case 5
	b _0221F61C ; case 6
	b _0221F61C ; case 7
	b _0221F61C ; case 8
	b _0221F61C ; case 9
	b _0221EFB0 ; case 10
	b _0221F278 ; case 11
	b _0221F2C8 ; case 12
	b _0221F61C ; case 13
	b _0221F440 ; case 14
	b _0221F4B4 ; case 15
	b _0221F61C ; case 16
	b _0221F61C ; case 17
	b _0221F61C ; case 18
	b _0221F61C ; case 19
	b _0221F61C ; case 20
	b _0221F5D0 ; case 21
_0221EEA8:
	cmp r2, #0x80
	beq _0221F5F8
	b _0221F61C
_0221EEB4:
	ldrh r0, [r6, #2]
	ldr r2, [r4, #0x51c]
	mov r1, r6
	cmp r0, #0
	beq _0221EED8
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221EED8:
	mov r0, #0x15
	blx r2
	ldr r3, _0221F638 ; =ov13_0224598C
	ldr r0, _0221F63C ; =MBi_ChildCallback
	ldrh r1, [r3, #4]
	str r1, [sp]
	ldrh r1, [r3, #6]
	ldrh r2, [r3, #2]
	ldrh r3, [r3]
	bl WM_SetLifeTime
	mov r1, r0
	mov r0, #0x1d
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221EF14:
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _0221EF38
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221EF38:
	add r0, r4, #0x440
	str r0, [r1, #0x20]
	ldrh r0, [r1, #0x24]
	mov r2, #1
	cmp r0, #0
	moveq r0, #1
	streqh r0, [r1, #0x24]
	ldr r0, _0221F634 ; =ov13_0224CF40
	ldrh r1, [r0, #0x26]
	cmp r1, #0
	moveq r1, #0xc8
	streqh r1, [r0, #0x26]
	ldr r0, _0221F634 ; =ov13_0224CF40
	mov r1, #0xff
	strb r1, [r0, #0x28]
	strb r1, [r0, #0x29]
	strb r1, [r0, #0x2a]
	strb r1, [r0, #0x2b]
	strb r1, [r0, #0x2c]
	strb r1, [r0, #0x2d]
	str r2, [r4, #0x5e4]
	ldr r0, _0221F63C ; =MBi_ChildCallback
	ldr r1, _0221F640 ; =ov13_0224CF60
	str r2, [r4, #0x5e8]
	bl WM_StartScan
	mov r1, r0
	mov r0, #0xa
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221EFB0:
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _0221EFD4
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221EFD4:
	ldrh r0, [r6, #8]
	cmp r0, #3
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r0, #4
	beq _0221F200
	cmp r0, #5
	bne _0221F260
	add ip, r4, #0x600
	mov r5, #0
	add r0, r4, #0x500
	mov fp, #0x180
	b _0221F130
_0221F008:
	mla r2, r5, fp, ip
	ldrb r3, [r6, #0xa]
	ldrb r1, [r2, #0xca]
	mov lr, #0
	mov sl, lr
	cmp r3, r1
	ldreqb r1, [r2, #0xcb]
	ldreqb r2, [r6, #0xb]
	mov r7, lr
	mov r8, lr
	cmpeq r2, r1
	moveq sl, #1
	mov sb, lr
	cmp sl, #0
	beq _0221F05C
	mov r2, #0x180
	mla r2, r5, r2, ip
	ldrb r1, [r6, #0xc]
	ldrb r2, [r2, #0xcc]
	cmp r1, r2
	moveq sb, #1
_0221F05C:
	cmp sb, #0
	beq _0221F07C
	mov r1, #0x180
	mla r1, r5, r1, ip
	ldrb r2, [r6, #0xd]
	ldrb r1, [r1, #0xcd]
	cmp r2, r1
	moveq r8, #1
_0221F07C:
	cmp r8, #0
	beq _0221F09C
	mov r1, #0x180
	mla r1, r5, r1, ip
	ldrb r2, [r6, #0xe]
	ldrb r1, [r1, #0xce]
	cmp r2, r1
	moveq r7, #1
_0221F09C:
	cmp r7, #0
	beq _0221F0BC
	mov r1, #0x180
	mla r1, r5, r1, ip
	ldrb r2, [r6, #0xf]
	ldrb r1, [r1, #0xcf]
	cmp r2, r1
	moveq lr, #1
_0221F0BC:
	cmp lr, #0
	beq _0221F12C
	mov r0, #0x180
	mla r0, r5, r0, ip
	ldrh r1, [r6, #0x36]
	add sb, r6, #0x38
	add r8, r0, #0xf8
	strh r1, [r0, #0xf6]
	mov r7, #8
_0221F0E0:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _0221F0E0
	add r1, r4, #0x600
	mov r0, #0x180
	mla r0, r5, r0, r1
	mov r1, #0xc0
	bl DC_InvalidateRange
	ldr r1, _0221F634 ; =ov13_0224CF40
	add r2, r4, #0x600
	mov r0, #0x180
	mla r2, r5, r0, r2
	ldrh r0, [r1]
	add r1, r4, #0x440
	mov r3, #0xc0
	bl MI_DmaCopy16
	str r5, [r4, #0x5ec]
	b _0221F1A0
_0221F12C:
	add r5, r5, #1
_0221F130:
	ldrh r1, [r0, #0xe0]
	cmp r5, r1
	blt _0221F008
	cmp r5, #0x10
	bge _0221F1A0
	mov r0, #0x180
	mla r1, r5, r0, ip
	mov r0, r6
	add r7, r5, #1
	add r3, r4, #0x500
	add r1, r1, #0xc0
	mov r2, #0xb8
	strh r7, [r3, #0xe0]
	bl MIi_CpuCopy16
	add r1, r4, #0x600
	mov r0, #0x180
	mla r0, r5, r0, r1
	mov r1, #0xc0
	bl DC_InvalidateRange
	ldr r1, _0221F634 ; =ov13_0224CF40
	add r2, r4, #0x600
	mov r0, #0x180
	mla r2, r5, r0, r2
	ldrh r0, [r1]
	add r1, r4, #0x440
	mov r3, #0xc0
	bl MI_DmaCopy16
	str r5, [r4, #0x5ec]
_0221F1A0:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #4
	blx r2
	ldr r0, [r4, #0x5e4]
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4, #0x5e8]
	cmp r0, #0
	beq _0221F1E0
	ldr r0, _0221F640 ; =ov13_0224CF60
	bl changeScanChannel
	cmp r0, #0
	bne _0221F1E0
	bl MBi_CommEnd
_0221F1E0:
	ldr r0, _0221F63C ; =MBi_ChildCallback
	ldr r1, _0221F640 ; =ov13_0224CF60
	bl WM_StartScan
	mov r1, r0
	mov r0, #0xa
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F200:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #5
	blx r2
	ldr r0, [r4, #0x5e4]
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4, #0x5e8]
	cmp r0, #0
	beq _0221F240
	ldr r0, _0221F640 ; =ov13_0224CF60
	bl changeScanChannel
	cmp r0, #0
	bne _0221F240
	bl MBi_CommEnd
_0221F240:
	ldr r0, _0221F63C ; =MBi_ChildCallback
	ldr r1, _0221F640 ; =ov13_0224CF60
	bl WM_StartScan
	mov r1, r0
	mov r0, #0xa
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F260:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F278:
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _0221F29C
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F29C:
	ldr r1, [r4, #0x520]
	mov r2, #0
	ldr r0, _0221F63C ; =MBi_ChildCallback
	mov r3, #1
	str r2, [sp]
	bl WM_StartConnectEx
	mov r1, r0
	mov r0, #0xc
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F2C8:
	ldrh r0, [r6, #2]
	cmp r0, #0
	beq _0221F2F8
	add r0, r4, #0x500
	mov r1, #0
	strh r1, [r0, #0xe0]
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0xb
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F2F8:
	ldrh r0, [r6, #8]
	cmp r0, #9
	bgt _0221F324
	cmp r0, #6
	blt _0221F428
	beq _0221F334
	cmp r0, #7
	beq _0221F350
	cmp r0, #9
	beq _0221F400
	b _0221F428
_0221F324:
	cmp r0, #0x1a
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	b _0221F428
_0221F334:
	add r0, r4, #0x500
	mov r1, #0
	strh r1, [r0, #0x2a]
	mov r1, #1
	strh r1, [r0, #0x28]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F350:
	ldrh r2, [r6, #0xa]
	add r0, r4, #0x500
	mov r1, r6
	strh r2, [r0, #0xe2]
	ldr r2, [r4, #0x51c]
	mov r0, #6
	blx r2
	ldr r1, _0221F644 ; =MBi_ChildPortCallback
	add r3, r4, #0x500
	mov r0, #1
	mov r2, #0
	strh r0, [r3, #0x2a]
	bl WM_SetPortCallback
	cmp r0, #0
	addne sp, sp, #0x1c
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, r4, #0x500
	ldrh r0, [r0, #0x2c]
	add r1, r4, #0x500
	ldrh r2, [r1, #0x18]
	cmp r0, #0
	movne r0, #0
	moveq r0, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r2, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #1
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	ldrh r2, [r1, #0x1a]
	ldr r1, [r4, #0x504]
	ldr r0, _0221F63C ; =MBi_ChildCallback
	add r3, r4, #0x40
	bl WM_StartMPEx
	mov r1, r0
	mov r0, #0xe
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F400:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0xa
	blx r2
	add r0, r4, #0x500
	mov r1, #0
	strh r1, [r0, #0x2a]
	strh r1, [r0, #0x28]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F428:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F440:
	ldrh r0, [r6, #4]
	cmp r0, #0xa
	beq _0221F468
	cmp r0, #0xc
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r0, #0xd
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	b _0221F49C
_0221F468:
	add r0, r4, #0x500
	mov r1, #1
	strh r1, [r0, #0x28]
	bl MBi_IsSendEnabled
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [r4, #0x51c]
	mov r0, #0x19
	mov r1, #0
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F49C:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F4B4:
	mov r0, #0
	strb r0, [r4, #0x50c]
	ldrh r0, [r6, #2]
	cmp r0, #0
	bne _0221F4DC
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #8
	blx r2
	b _0221F500
_0221F4DC:
	cmp r0, #9
	ldr r2, [r4, #0x51c]
	mov r1, r6
	bne _0221F4F8
	mov r0, #0x29
	blx r2
	b _0221F500
_0221F4F8:
	mov r0, #0x12
	blx r2
_0221F500:
	ldr r0, _0221F634 ; =ov13_0224CF40
	ldr r0, [r0, #8]
	add r0, r0, #0x500
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	addne sp, sp, #0x1c
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [r4, #0x51c]
	mov r0, #0x19
	mov r1, #0
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F534:
	ldrh r0, [r6, #2]
	cmp r0, #0
	add r0, r4, #0x500
	beq _0221F564
	mov r1, #0
	strh r1, [r0, #0x26]
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F564:
	mov r2, #0
	strh r2, [r0, #0x2a]
	ldr r1, [r1, #8]
	ldr r0, _0221F63C ; =MBi_ChildCallback
	add r1, r1, #0x500
	strh r2, [r1, #0x28]
	bl WM_End
	mov r1, r0
	mov r0, #2
	bl MBi_CheckWmErrcode
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F594:
	ldrh r1, [r6, #2]
	cmp r1, #0
	beq _0221F5C4
	add r0, r4, #0x500
	mov r1, #0
	strh r1, [r0, #0x26]
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F5C4:
	bl MBi_EndCommon
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F5D0:
	bl MBi_IsSendEnabled
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [r4, #0x51c]
	mov r0, #0x19
	mov r1, #0
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F5F8:
	ldrh r0, [r6, #4]
	cmp r0, #0x16
	beq _0221F610
	add sp, sp, #0x1c
	cmp r0, #0x17
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F610:
	bl OS_Terminate
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0221F61C:
	ldr r2, [r4, #0x51c]
	mov r1, r6
	mov r0, #0x100
	blx r2
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0221F634: .word ov13_0224CF40
_0221F638: .word ov13_0224598C
_0221F63C: .word MBi_ChildCallback
_0221F640: .word ov13_0224CF60
_0221F644: .word MBi_ChildPortCallback
	arm_func_end MBi_ChildCallback

	arm_func_start MBi_GetBeaconPeriodDispersion
MBi_GetBeaconPeriodDispersion: ; 0x0221F648
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	add r0, sp, #0
	bl OS_GetMacAddress
	mov r1, #0
	add r2, sp, #0
	mov r3, r1
_0221F664:
	ldrb r0, [r2], #1
	add r1, r1, #1
	cmp r1, #6
	add r3, r3, r0
	blt _0221F664
	ldr r1, _0221F6A8 ; =0x027FFC3C
	ldr r0, _0221F6AC ; =0xCCCCCCCD
	ldr r1, [r1]
	mov r2, #0x14
	add r1, r3, r1
	rsb r3, r1, r1, lsl #3
	umull r1, r0, r3, r0
	mov r0, r0, lsr #4
	umull r0, r1, r2, r0
	sub r0, r3, r0
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0221F6A8: .word 0x027FFC3C
_0221F6AC: .word 0xCCCCCCCD
	arm_func_end MBi_GetBeaconPeriodDispersion

	arm_func_start MB_Init
MB_Init: ; 0x0221F6B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _0221F888 ; =ov13_0224CF40
	mov sb, r1
	ldr r1, [r4, #0xc]
	mov r8, r2
	cmp r1, #0
	addne r1, r1, #0x1300
	ldrneh r1, [r1, #0x16]
	mov r7, r3
	cmpne r1, #0
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r0, #0x1f
	bic r4, r0, #0x1f
	add r0, r4, #0x1f
	add r0, r0, #0x1e00
	cmp r7, #0x10000
	bic r5, r0, #0x1f
	bne _0221F704
	bl WM_GetNextTgid
	mov r7, r0
_0221F704:
	bl OS_DisableInterrupts
	ldr r3, _0221F88C ; =0x0000FFFF
	ldr r1, _0221F890 ; =ov13_0224598C
	mov r2, #5
	strh r3, [r1, #6]
	strh r2, [r1]
	mov r2, #0x28
	strh r2, [r1, #2]
	mov r6, r0
	strh r2, [r1, #4]
	mov r2, #1
	ldr r0, [sp, #0x20]
	ldr r3, _0221F888 ; =ov13_0224CF40
	str r2, [r1, #0xc]
	strh r0, [r3]
	str r4, [r3, #8]
	mov r1, r4
	mov r0, #0
	mov r2, #0x1e00
	str r5, [r3, #0xc]
	bl MIi_CpuClear32
	mov r1, r5
	mov r0, #0
	mov r2, #0x1340
	bl MIi_CpuClear16
	ldrb r0, [sb, #1]
	add r2, r4, #0x530
	mov r1, #0
	cmp r0, #0
	ble _0221F798
_0221F77C:
	add r0, sb, r1, lsl #1
	ldrh r0, [r0, #2]
	add r1, r1, #1
	strh r0, [r2], #2
	ldrb r0, [sb, #1]
	cmp r1, r0
	blt _0221F77C
_0221F798:
	add r0, r4, #0x138
	add r3, r0, #0x400
	ldr r0, _0221F890 ; =ov13_0224598C
	mov ip, #0
	ldr r1, [r0, #8]
_0221F7AC:
	ldrh r2, [r1]
	cmp r2, #0
	beq _0221F7D0
	add r1, r1, #2
	add ip, ip, #1
	str r1, [r0, #8]
	cmp ip, #0x10
	strh r2, [r3], #2
	blt _0221F7AC
_0221F7D0:
	mov r0, sb
	add r1, r5, #0x1300
	mov r2, #0x16
	bl MI_CpuCopy8
	ldrb r0, [sb, #1]
	cmp r0, #0xa
	bhs _0221F7FC
	add r0, r5, r0, lsl #1
	add r0, r0, #0x1300
	mov r1, #0
	strh r1, [r0, #2]
_0221F7FC:
	add r0, r4, #0x500
	mov r1, #0x100
	strh r1, [r0]
	mov r1, #8
	strh r1, [r0, #2]
	mov r2, #0
	strh r2, [r0, #0x18]
	strh r2, [r0, #0x1a]
	mov r1, #1
	strh r1, [r0, #0x2c]
	add r0, r5, #0x400
	str r0, [r4, #0x504]
	strh r2, [r4, #0xe]
	strh r2, [r4, #0x12]
	strh r1, [r4, #0x16]
	strh r2, [r4, #0x14]
	str r8, [r4, #8]
	strh r7, [r4, #0xc]
	bl MBi_GetBeaconPeriodDispersion
	add r0, r0, #0xc8
	strh r0, [r4, #0x18]
	mov r0, #0xf
	strh r0, [r4, #0x10]
	mov r3, #0
	strb r3, [r4, #0x50c]
	strb r3, [r4, #0x50d]
	add r1, r5, #0x1300
	mov r2, #1
	mov r0, r6
	strh r2, [r1, #0x16]
	add r1, r5, #0x1000
	str r3, [r1, #0x31c]
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0221F888: .word ov13_0224CF40
_0221F88C: .word 0x0000FFFF
_0221F890: .word ov13_0224598C
	arm_func_end MB_Init

	arm_func_start MBi_IsCommSizeValid
MBi_IsCommSizeValid: ; 0x0221F894
	ldr r3, _0221F8FC ; =0x000001FE
	cmp r0, r3
	bhi _0221F8A8
	cmp r0, #0xe4
	bhs _0221F8B0
_0221F8A8:
	mov r0, #0
	bx lr
_0221F8B0:
	cmp r1, #0x10
	bhi _0221F8C0
	cmp r1, #8
	bhs _0221F8C8
_0221F8C0:
	mov r0, #0
	bx lr
_0221F8C8:
	add r0, r0, #0x26
	mov r0, r0, lsl #2
	add r1, r1, #0x20
	add r0, r0, #0x4a
	mov r1, r1, lsl #2
	add r3, r0, #0x100
	add r0, r1, #0x70
	mla r1, r2, r0, r3
	ldr r0, _0221F900 ; =0x000015E0
	cmp r1, r0
	movlt r0, #1
	movge r0, #0
	bx lr
	.balign 4, 0
_0221F8FC: .word 0x000001FE
_0221F900: .word 0x000015E0
	arm_func_end MBi_IsCommSizeValid

	arm_func_start MB_SetParentCommParam
MB_SetParentCommParam: ; 0x0221F904
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	mov r4, r1
	bl OS_DisableInterrupts
	ldr r1, _0221F998 ; =ov13_0224CF40
	mov r6, r0
	ldr r1, [r1, #8]
	ldrb r1, [r1, #0x50d]
	cmp r1, #0
	beq _0221F938
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0221F938:
	mov r0, r5
	mov r2, r4
	mov r1, #8
	bl MBi_IsCommSizeValid
	cmp r0, #0
	bne _0221F960
	mov r0, r6
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_0221F960:
	ldr r2, _0221F998 ; =ov13_0224CF40
	mov r0, r6
	ldr r1, [r2, #8]
	mov r3, #8
	strh r4, [r1, #0x10]
	ldr r1, [r2, #8]
	add r1, r1, #0x500
	strh r5, [r1]
	ldr r1, [r2, #8]
	add r1, r1, #0x500
	strh r3, [r1, #2]
	bl OS_RestoreInterrupts
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0221F998: .word ov13_0224CF40
	arm_func_end MB_SetParentCommParam

	arm_func_start MBi_StartCommon
MBi_StartCommon: ; 0x0221F99C
	stmdb sp!, {r4, lr}
	ldr r2, _0221FA6C ; =ov13_0224CF40
	mov r3, #0
	ldr r1, [r2, #8]
	mov r0, #0xa
	add r1, r1, #0x500
	strh r3, [r1, #0x28]
	ldr r1, [r2, #8]
	add r1, r1, #0x500
	strh r3, [r1, #0x2a]
	ldr r1, [r2, #8]
	add r1, r1, #0x500
	strh r3, [r1, #0x26]
	ldr r1, [r2, #8]
	add r1, r1, #0x500
	strh r3, [r1, #0x48]
	bl MBi_SetMaxScanTime
	ldr r4, _0221FA6C ; =ov13_0224CF40
	ldr r0, [r4, #0xc]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x320]
	cmp r0, #0
	bne _0221FA44
_0221F9F8:
	ldrh r2, [r4]
	ldmib r4, {r0, r1}
	ldr r1, [r1, #0x508]
	bl WM_Initialize
	cmp r0, #4
	beq _0221F9F8
	cmp r0, #2
	movne r0, #8
	ldmneia sp!, {r4, pc}
	ldr r0, _0221FA6C ; =ov13_0224CF40
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x508]
	bl WM_SetIndCallback
	ldr r0, _0221FA6C ; =ov13_0224CF40
	mov r2, #1
	ldr r1, [r0, #8]
	mov r0, #0
	strb r2, [r1, #0x50d]
	ldmia sp!, {r4, pc}
_0221FA44:
	ldr r0, [r4, #8]
	ldr r0, [r0, #0x508]
	bl WM_SetIndCallback
	mov r0, r4
	ldr r0, [r0, #8]
	mov r1, #1
	strb r1, [r0, #0x50d]
	bl MBi_OnInitializeDone
	mov r0, #0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0221FA6C: .word ov13_0224CF40
	arm_func_end MBi_StartCommon

	arm_func_start MBi_StartParentCore
MBi_StartParentCore: ; 0x0221FA70
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r3, _0221FC40 ; =ov13_0224CF40
	mov r4, r0
	ldr r0, [r3, #8]
	ldr r2, _0221FC44 ; =0x000069C0
	strh r5, [r0, #0x32]
	ldr r5, [r3, #0xc]
	mov r0, #0
	add r1, r5, #0x1f
	add r1, r1, #0x7d00
	bic r1, r1, #0x1f
	str r1, [r3, #4]
	add r1, r5, #0x1000
	ldr r6, [r1, #0x4e4]
	add r1, r5, #0x1340
	bl MIi_CpuClear16
	mov r0, r6
	bl MB_CommSetParentStateCallback
	ldr r1, _0221FC40 ; =ov13_0224CF40
	ldr r0, [r1, #8]
	ldr r2, [r1, #0xc]
	add r0, r0, #0x500
	ldrh r3, [r0]
	add r0, r2, #0x1000
	sub r2, r3, #6
	str r2, [r0, #0x318]
	ldr r0, [r1, #8]
	add r0, r0, #0x500
	ldrh r0, [r0, #2]
	bl MBi_SetChildMPMaxSize
	ldr r0, _0221FC40 ; =ov13_0224CF40
	ldr r0, [r0, #0xc]
	add r0, r0, #0x138
	add r0, r0, #0x1400
	bl MBi_SetParentPieceBuffer
	mov r5, #0
	ldr r2, _0221FC40 ; =ov13_0224CF40
	mov r0, r5
	mvn r3, #0
_0221FB14:
	ldr r1, [r2, #0xc]
	add r1, r1, r5, lsl #2
	add r1, r1, #0x1000
	str r0, [r1, #0x4e8]
	ldr r1, [r2, #0xc]
	add r1, r1, r5
	add r1, r1, #0x1000
	add r5, r5, #1
	strb r3, [r1, #0x526]
	cmp r5, #0xf
	blt _0221FB14
	ldr r3, _0221FC40 ; =ov13_0224CF40
	ldr r2, _0221FC48 ; =0x00005D40
	ldr r1, [r3, #0xc]
	add r1, r1, #0x1000
	strb r0, [r1, #0x524]
	ldr r1, [r3, #0xc]
	add r1, r1, #0x388
	add r1, r1, #0x1400
	bl MIi_CpuClear16
	ldr r0, _0221FC40 ; =ov13_0224CF40
	mov r1, #0
	ldr r0, [r0, #0xc]
	mov r2, #0x1e
	add r0, r0, #0x354
	add r0, r0, #0x1400
	bl MI_CpuFill8
	ldr r1, _0221FC40 ; =ov13_0224CF40
	mov r2, #1
	ldr r0, [r1, #8]
	ldr r3, _0221FC4C ; =MBi_CommParentCallback
	add r0, r0, #0x500
	strh r2, [r0, #0x24]
	ldr r0, [r1, #8]
	ldr r2, _0221FC50 ; =MBi_ParentCallback
	str r3, [r0, #0x51c]
	ldr r0, [r1, #8]
	str r2, [r0, #0x508]
	ldr r2, [r1, #8]
	add r0, r2, #0x500
	ldrh r0, [r0]
	strh r0, [r2, #0x34]
	ldr r0, [r1, #8]
	ldrh r2, [r0, #0x34]
	add r0, r0, #0x500
	add r2, r2, #0x23
	bic r2, r2, #0x1f
	strh r2, [r0, #0x18]
	ldr r2, [r1, #8]
	add r0, r2, #0x500
	ldrh r0, [r0, #2]
	strh r0, [r2, #0x36]
	ldr r0, [r1, #8]
	ldrh r1, [r0, #0x36]
	add r0, r0, #0x500
	add r1, r1, #0xe
	rsb r1, r1, r1, lsl #4
	add r1, r1, #0x29
	bic r1, r1, #0x1f
	mov r1, r1, lsl #1
	strh r1, [r0, #0x1a]
	bl MB_InitSendGameInfoStatus
	bl MBi_StartCommon
	mov r5, r0
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, #0xf
	mov r1, #1
	bl PXI_IsCallbackReady
	ldr r1, _0221FC40 ; =ov13_0224CF40
	ldr r1, [r1, #0xc]
	add r1, r1, #0x7000
	str r0, [r1, #0x4c8]
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0221FC40: .word ov13_0224CF40
_0221FC44: .word 0x000069C0
_0221FC48: .word 0x00005D40
_0221FC4C: .word MBi_CommParentCallback
_0221FC50: .word MBi_ParentCallback
	arm_func_end MBi_StartParentCore

	arm_func_start MB_StartParentFromIdle
MB_StartParentFromIdle: ; 0x0221FC54
	ldr r1, _0221FC70 ; =ov13_0224CF40
	ldr ip, _0221FC74 ; =MBi_StartParentCore
	ldr r1, [r1, #0xc]
	mov r2, #1
	add r1, r1, #0x1000
	str r2, [r1, #0x320]
	bx ip
	.balign 4, 0
_0221FC70: .word ov13_0224CF40
_0221FC74: .word MBi_StartParentCore
	arm_func_end MB_StartParentFromIdle

	arm_func_start MBi_CallReset
MBi_CallReset: ; 0x0221FC78
	stmdb sp!, {r4, lr}
	ldr r0, _0221FCAC ; =ov13_0224CF40
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x508]
	bl WM_Reset
	mov r4, r0
	mov r1, r4
	mov r0, #1
	bl MBi_CheckWmErrcode
	cmp r4, #2
	moveq r4, #0
	mov r0, r4
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0221FCAC: .word ov13_0224CF40
	arm_func_end MBi_CallReset

	arm_func_start MBi_OnReset
MBi_OnReset: ; 0x0221FCB0
	ldr ip, _0221FCB8 ; =MBi_CallReset
	bx ip
	.balign 4, 0
_0221FCB8: .word MBi_CallReset
	arm_func_end MBi_OnReset

	arm_func_start MBi_CommEnd
MBi_CommEnd: ; 0x0221FCBC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, #1
	bl OS_DisableInterrupts
	ldr r1, _0221FD48 ; =ov13_0224CF40
	mov r4, r0
	ldr r2, [r1, #8]
	ldrb r0, [r2, #0x50d]
	cmp r0, #0
	bne _0221FCEC
	mov r0, #0
	bl MBi_EndCommon
	b _0221FD38
_0221FCEC:
	add r0, r2, #0x500
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	bne _0221FD38
	mov r0, #0
	str r0, [r2, #0x5e4]
	ldr r0, [r1, #8]
	mov r1, r5
	add r0, r0, #0x500
	strh r1, [r0, #0x26]
	bl MBi_IsTaskAvailable
	cmp r0, #0
	beq _0221FD30
	ldr r0, _0221FD4C ; =MBi_OnReset
	bl MBi_EndTaskThread
	mov r5, #0
	b _0221FD38
_0221FD30:
	bl MBi_CallReset
	mov r5, r0
_0221FD38:
	mov r0, r4
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0221FD48: .word ov13_0224CF40
_0221FD4C: .word MBi_OnReset
	arm_func_end MBi_CommEnd

	arm_func_start MB_End
MB_End: ; 0x0221FD50
	stmdb sp!, {r4, lr}
	bl OS_DisableInterrupts
	ldr r1, _0221FD88 ; =ov13_0224CF40
	mov r4, r0
	ldr r0, [r1, #0xc]
	add r0, r0, #0x1000
	ldr r0, [r0, #0x320]
	cmp r0, #0
	bne _0221FD78
	bl OS_Terminate
_0221FD78:
	bl MBi_CommEnd
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0221FD88: .word ov13_0224CF40
	arm_func_end MB_End

	arm_func_start MB_DisconnectChild
MB_DisconnectChild: ; 0x0221FD8C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	ldr r0, _0221FF0C ; =MBi_ParentCallback
	mov r1, r5
	bl WM_Disconnect
	cmp r5, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #0x10
	ldmhsia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r2, _0221FF10 ; =ov13_0224CF40
	sub r4, r5, #1
	ldr r0, [r2, #0xc]
	mov r1, #0
	add r0, r0, r4, lsl #1
	add r0, r0, #0x1400
	strh r1, [r0, #0x8a]
	ldr r0, [r2, #0xc]
	mov r2, #4
	add r0, r0, #0xa8
	add r0, r0, #0x1400
	add r0, r0, r4, lsl #2
	bl MI_CpuFill8
	ldr r0, _0221FF10 ; =ov13_0224CF40
	mov r2, #0x16
	ldr r0, [r0, #0xc]
	mov r1, #0
	add r0, r0, #0x1340
	mla r0, r4, r2, r0
	bl MI_CpuFill8
	mov r0, r5
	bl MBi_ClearParentPieceBuffer
	ldr ip, _0221FF10 ; =ov13_0224CF40
	mov r2, #0
	ldr r0, [ip, #0xc]
	sub r1, r2, #1
	add r0, r0, r4, lsl #1
	add r0, r0, #0x1700
	strh r2, [r0, #0x54]
	ldr r3, [ip, #0xc]
	add r0, r3, r4
	add r0, r0, #0x1500
	ldrsb r2, [r0, #0x26]
	cmp r2, r1
	beq _0221FEAC
	ldr r0, _0221FF14 ; =0x000005D4
	and r1, r2, #0xff
	mul r0, r1, r0
	add r1, r3, r0
	add r3, r1, #0x1d00
	mov r2, #1
	ldrh r6, [r3, #0x4e]
	mvn r1, r2, lsl r5
	and r6, r6, r1
	strh r6, [r3, #0x4e]
	ldr r3, [ip, #0xc]
	sub r6, r2, #2
	add r3, r3, r0
	add r3, r3, #0x1d00
	ldrh r7, [r3, #0x50]
	mov lr, r4
	orr r2, r7, r2, lsl r5
	strh r2, [r3, #0x50]
	ldr r2, [ip, #0xc]
	add r2, r2, lr
	add r2, r2, #0x1000
	strb r6, [r2, #0x526]
	ldr r2, [ip, #0xc]
	add r0, r2, r0
	add r0, r0, #0x1d00
	ldrh r2, [r0, #0x4c]
	and r1, r2, r1
	strh r1, [r0, #0x4c]
_0221FEAC:
	ldr r1, _0221FF10 ; =ov13_0224CF40
	mov ip, #1
	ldr r2, [r1, #0xc]
	add r0, r2, #0x1500
	ldrh r0, [r0, #0x36]
	tst r0, ip, lsl r5
	beq _0221FEF0
	add r0, r2, #0x1000
	ldrb r3, [r0, #0x535]
	mvn r2, ip, lsl r5
	sub r3, r3, #1
	strb r3, [r0, #0x535]
	ldr r0, [r1, #0xc]
	add r0, r0, #0x1500
	ldrh r1, [r0, #0x36]
	and r1, r1, r2
	strh r1, [r0, #0x36]
_0221FEF0:
	ldr r0, _0221FF10 ; =ov13_0224CF40
	mov r1, #0
	ldr r0, [r0, #0xc]
	add r0, r0, r4, lsl #2
	add r0, r0, #0x1000
	str r1, [r0, #0x4e8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221FF0C: .word MBi_ParentCallback
_0221FF10: .word ov13_0224CF40
_0221FF14: .word 0x000005D4
	arm_func_end MB_DisconnectChild

	arm_func_start MBi_SetMaxScanTime
MBi_SetMaxScanTime: ; 0x0221FF18
	ldr r1, _0221FF24 ; =ov13_0224CF40
	strh r0, [r1, #0x26]
	bx lr
	.balign 4, 0
_0221FF24: .word ov13_0224CF40
	arm_func_end MBi_SetMaxScanTime

	arm_func_start MBi_SetMPData
MBi_SetMPData: ; 0x0221FF28
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldrh r4, [sp, #0x18]
	mov r3, r2
	mov r2, r1
	str r4, [sp]
	mov r4, #1
	str r4, [sp, #4]
	mov r4, #3
	mov r1, #0
	str r4, [sp, #8]
	bl WM_SetMPDataToPortEx
	mov r4, r0
	mov r1, r4
	mov r0, #0xf
	bl MBi_CheckWmErrcode
	mov r0, r4
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end MBi_SetMPData

	arm_func_start MBi_SendMP
MBi_SendMP: ; 0x0221FF74
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _0222004C ; =ov13_0224CF40
	mov r3, r1, lsl #0x10
	ldr r5, [ip, #8]
	mov ip, r2, lsl #0x10
	add lr, r5, #0x500
	ldrh r4, [lr, #0x28]
	mov r1, r0
	mov r2, r3, lsr #0x10
	cmp r4, #0
	ldrneh r0, [lr, #0x26]
	mov r4, ip, lsr #0x10
	cmpne r0, #1
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrh r0, [lr, #0x24]
	cmp r0, #1
	beq _0221FFC8
	cmp r0, #2
	beq _02220010
	b _02220044
_0221FFC8:
	ldrh r0, [lr, #0x2c]
	cmp r0, #0
	moveq r0, #0x3e8
	movne r0, #0
	mov r3, r0, lsl #0x10
	str r4, [sp]
	ldr r0, [r5, #0x508]
	mov r3, r3, lsr #0x10
	bl MBi_SetMPData
	cmp r0, #2
	bne _02220004
	ldr r1, _0222004C ; =ov13_0224CF40
	mov r2, #1
	ldr r1, [r1, #8]
	strb r2, [r1, #0x50c]
_02220004:
	cmp r0, #2
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02220010:
	ldr r0, _02220050 ; =MBi_ChildCallback
	mov r3, #0
	str r4, [sp]
	bl MBi_SetMPData
	cmp r0, #2
	bne _02220038
	ldr r1, _0222004C ; =ov13_0224CF40
	mov r2, #1
	ldr r1, [r1, #8]
	strb r2, [r1, #0x50c]
_02220038:
	cmp r0, #2
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02220044:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0222004C: .word ov13_0224CF40
_02220050: .word MBi_ChildCallback
	arm_func_end MBi_SendMP

	arm_func_start MBi_GetGgid
MBi_GetGgid: ; 0x02220054
	ldr r0, _02220064 ; =ov13_0224CF40
	ldr r0, [r0, #8]
	ldr r0, [r0, #8]
	bx lr
	.balign 4, 0
_02220064: .word ov13_0224CF40
	arm_func_end MBi_GetGgid

	arm_func_start MBi_GetTgid
MBi_GetTgid: ; 0x02220068
	ldr r0, _02220078 ; =ov13_0224CF40
	ldr r0, [r0, #8]
	ldrh r0, [r0, #0xc]
	bx lr
	.balign 4, 0
_02220078: .word ov13_0224CF40
	arm_func_end MBi_GetTgid

	arm_func_start MBi_GetAttribute
MBi_GetAttribute: ; 0x0222007C
	ldr r0, _022200D8 ; =ov13_0224CF40
	ldr r1, [r0, #8]
	ldrh r0, [r1, #0x12]
	cmp r0, #0
	ldrh r0, [r1, #0xe]
	movne r2, #2
	moveq r2, #0
	cmp r0, #0
	movne r3, #1
	ldrh r0, [r1, #0x14]
	moveq r3, #0
	cmp r0, #0
	movne ip, #4
	ldrh r0, [r1, #0x16]
	moveq ip, #0
	cmp r0, #0
	movne r1, #8
	orr r0, r3, r2
	moveq r1, #0
	orr r0, ip, r0
	orr r0, r1, r0
	and r0, r0, #0xff
	bx lr
	.balign 4, 0
_022200D8: .word ov13_0224CF40
	arm_func_end MBi_GetAttribute

	arm_func_start MBi_IsStarted
MBi_IsStarted: ; 0x022200DC
	ldr r0, _022200F8 ; =ov13_0224CF40
	ldr r0, [r0, #8]
	ldrb r0, [r0, #0x50d]
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	bx lr
	.balign 4, 0
_022200F8: .word ov13_0224CF40
	arm_func_end MBi_IsStarted

	arm_func_start MBi_CheckWmErrcode
MBi_CheckWmErrcode: ; 0x022200FC
	stmdb sp!, {r3, lr}
	cmp r1, #2
	cmpne r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r2, _02220130 ; =ov13_0224CF40
	strh r0, [sp]
	ldr r0, [r2, #8]
	strh r1, [sp, #2]
	ldr r2, [r0, #0x51c]
	add r1, sp, #0
	mov r0, #0xff
	blx r2
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02220130: .word ov13_0224CF40
	arm_func_end MBi_CheckWmErrcode

	arm_func_start MBi_InitCache
MBi_InitCache: ; 0x02220134
	ldr ip, _02220144 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x70
	bx ip
	.balign 4, 0
_02220144: .word MI_CpuFill8
	arm_func_end MBi_InitCache

	arm_func_start MBi_AttachCacheBuffer
MBi_AttachCacheBuffer: ; 0x02220148
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r4, r0
	mov sb, r1
	mov r8, r2
	mov r7, r3
	bl OS_DisableInterrupts
	add r6, r4, #0x30
	mov r5, r0
	add r4, r4, #0x70
_0222016C:
	cmp r6, r4
	blo _02220178
	bl OS_Terminate
_02220178:
	ldr r0, [r6, #0xc]
	cmp r0, #0
	bne _0222019C
	str sb, [r6]
	str r8, [r6, #4]
	ldr r0, [sp, #0x20]
	str r7, [r6, #8]
	str r0, [r6, #0xc]
	b _022201A4
_0222019C:
	add r6, r6, #0x10
	b _0222016C
_022201A4:
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end MBi_AttachCacheBuffer

	arm_func_start MBi_ReadFromCache
MBi_ReadFromCache: ; 0x022201B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	mov r4, #0
	bl OS_DisableInterrupts
	add r2, sb, #0x30
	add r1, sb, #0x70
	mov r5, r0
	cmp r2, r1
	bhs _02220238
_022201E0:
	ldr r0, [r2, #0xc]
	cmp r0, #2
	blo _0222022C
	ldr r0, [r2]
	subs r0, r8, r0
	bmi _0222022C
	ldr r3, [r2, #4]
	add ip, r0, r6
	cmp ip, r3
	bhi _0222022C
	ldr r3, [r2, #8]
	mov r1, r7
	mov r2, r6
	add r0, r3, r0
	bl MI_CpuCopy8
	mov r0, #0
	str r0, [sb]
	mov r4, #1
	b _02220238
_0222022C:
	add r2, r2, #0x10
	cmp r2, r1
	blo _022201E0
_02220238:
	mov r0, r5
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end MBi_ReadFromCache

	arm_func_start MBi_TaskThread
MBi_TaskThread: ; 0x02220248
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
_02220250:
	bl OS_DisableInterrupts
	ldr r1, [r7, #0xc0]
	mov r5, r0
	cmp r1, #0
	bne _0222028C
	mov r6, #0
	mov r4, r6
_0222026C:
	mov r0, r7
	mov r1, r6
	bl OS_SetThreadPriority
	mov r0, r4
	bl OS_SleepThread
	ldr r0, [r7, #0xc0]
	cmp r0, #0
	beq _0222026C
_0222028C:
	ldr r4, [r7, #0xc0]
	ldr r1, [r7, #0xc0]
	mov r0, r7
	ldr r1, [r1]
	str r1, [r7, #0xc0]
	ldr r1, [r4, #4]
	mov r1, r1, lsr #1
	bl OS_SetThreadPriority
	mov r0, r5
	bl OS_RestoreInterrupts
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _022202C8
	mov r0, r4
	blx r1
_022202C8:
	bl OS_DisableInterrupts
	mov r5, r0
	mov r0, r7
	ldr r6, [r4, #0xc]
	bl OS_GetThreadPriority
	ldr r1, [r7, #0xc0]
	cmp r1, #0
	moveq r1, #0
	beq _0222030C
	ldr r1, [r7, #0xc0]
	ldr r1, [r1, #4]
	cmp r0, r1, lsr #1
	movhs r1, r0
	bhs _0222030C
	ldr r1, [r7, #0xc0]
	ldr r1, [r1, #4]
	mov r1, r1, lsr #1
_0222030C:
	cmp r1, r0
	beq _0222031C
	mov r0, r7
	bl OS_SetThreadPriority
_0222031C:
	mov r0, #0
	str r0, [r4]
	ldr r0, [r4, #4]
	cmp r6, #0
	bic r0, r0, #1
	str r0, [r4, #4]
	beq _02220340
	mov r0, r4
	blx r6
_02220340:
	add r0, r7, #0xc4
	cmp r4, r0
	beq _02220358
	mov r0, r5
	bl OS_RestoreInterrupts
	b _02220250
_02220358:
	bl OS_ExitThread
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end MBi_TaskThread

	arm_func_start MBi_InitTaskThread
MBi_InitTaskThread: ; 0x02220360
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r6, r1
	bl OS_DisableInterrupts
	ldr r1, _022203D8 ; =ov13_0224CF80
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _022203C8
	add r0, r5, #0xc4
	str r5, [r1]
	bl MBi_InitTaskInfo
	sub r0, r6, #0xe4
	mov lr, #0
	bic ip, r0, #3
	add r3, r5, #0xe4
	str lr, [r5, #0xc0]
	ldr r1, _022203DC ; =MBi_TaskThread
	mov r0, r5
	mov r2, r5
	add r3, r3, ip
	stmia sp, {ip, lr}
	bl OS_CreateThread
	mov r0, r5
	bl OS_WakeupThreadDirect
_022203C8:
	mov r0, r4
	bl OS_RestoreInterrupts
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_022203D8: .word ov13_0224CF80
_022203DC: .word MBi_TaskThread
	arm_func_end MBi_InitTaskThread

	arm_func_start MBi_IsTaskAvailable
MBi_IsTaskAvailable: ; 0x022203E0
	ldr r0, _022203F8 ; =ov13_0224CF80
	ldr r0, [r0]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	bx lr
	.balign 4, 0
_022203F8: .word ov13_0224CF80
	arm_func_end MBi_IsTaskAvailable

	arm_func_start MBi_InitTaskInfo
MBi_InitTaskInfo: ; 0x022203FC
	ldr ip, _0222040C ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x20
	bx ip
	.balign 4, 0
_0222040C: .word MI_CpuFill8
	arm_func_end MBi_InitTaskInfo

	arm_func_start MBi_IsTaskBusy
MBi_IsTaskBusy: ; 0x02220410
	ldr r0, [r0, #4]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end MBi_IsTaskBusy

	arm_func_start MBi_SetTask
MBi_SetTask: ; 0x02220428
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r4, _02220588 ; =ov13_0224CF80
	mov sb, r0
	ldr r4, [r4]
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl MBi_IsTaskAvailable
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [sb, #4]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r6, #0x1f
	bls _022204AC
	mov r0, r4
	bl OS_GetThreadPriority
	cmp r6, #0x20
	bne _02220488
	cmp r0, #0
	subne r6, r0, #1
	moveq r6, #0
	b _022204AC
_02220488:
	cmp r6, #0x21
	bne _022204A0
	cmp r0, #0x1f
	addlo r6, r0, #1
	movhs r6, #0x1f
	b _022204AC
_022204A0:
	cmp r6, #0x22
	moveq r6, r0
	movne r6, #0x1f
_022204AC:
	bl OS_DisableInterrupts
	ldr r1, [sb, #4]
	mov r5, r0
	bic r0, r1, #1
	orr r1, r0, #1
	and r0, r1, #1
	str r1, [sb, #4]
	orr r0, r0, r6, lsl #1
	stmib sb, {r0, r8}
	str r7, [sb, #0xc]
	ldr r0, [r4, #0xc0]
	cmp r0, #0
	add r0, r4, #0xc4
	bne _02220504
	cmp sb, r0
	ldreq r0, _02220588 ; =ov13_0224CF80
	moveq r1, #0
	streq r1, [r0]
	mov r0, r4
	str sb, [r4, #0xc0]
	bl OS_WakeupThreadDirect
	b _0222057C
_02220504:
	cmp sb, r0
	ldr r1, [r4, #0xc0]
	bne _02220540
	ldr r0, [r1]
	cmp r0, #0
	beq _0222052C
_0222051C:
	mov r1, r0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222051C
_0222052C:
	ldr r0, _02220588 ; =ov13_0224CF80
	str sb, [r1]
	mov r1, #0
	str r1, [r0]
	b _0222057C
_02220540:
	ldr r0, [r1, #4]
	cmp r6, r0, lsr #1
	strlo sb, [r4, #0xc0]
	strlo r1, [sb]
	blo _0222057C
	b _0222055C
_02220558:
	mov r1, r2
_0222055C:
	ldr r2, [r1]
	cmp r2, #0
	beq _02220574
	ldr r0, [r2, #4]
	cmp r6, r0, lsr #1
	bhs _02220558
_02220574:
	str r2, [sb]
	str sb, [r1]
_0222057C:
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_02220588: .word ov13_0224CF80
	arm_func_end MBi_SetTask

	arm_func_start MBi_EndTaskThread
MBi_EndTaskThread: ; 0x0222058C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	mov r4, r0
	bl MBi_IsTaskAvailable
	cmp r0, #0
	beq _022205C4
	ldr r0, _022205D0 ; =ov13_0224CF80
	mov r1, #0
	ldr r0, [r0]
	mov r2, r5
	mov r3, r1
	add r0, r0, #0xc4
	bl MBi_SetTask
_022205C4:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022205D0: .word ov13_0224CF80
	arm_func_end MBi_EndTaskThread

	arm_func_start MBi_SetChildMPMaxSize
MBi_SetChildMPMaxSize: ; 0x022205D4
	stmdb sp!, {r3, lr}
	ldr r2, _02220600 ; =ov13_0224CF84
	sub r1, r0, #2
	mov r0, #0x1e
	str r1, [r2, #8]
	bl _s32_div_f
	ldr r1, _02220600 ; =ov13_0224CF84
	mov r2, #0x1e
	str r0, [r1, #0xc]
	str r2, [r1, #0x10]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02220600: .word ov13_0224CF84
	arm_func_end MBi_SetChildMPMaxSize

	arm_func_start MBi_SetParentPieceBuffer
MBi_SetParentPieceBuffer: ; 0x02220604
	ldr r3, _0222061C ; =ov13_0224CF84
	ldr ip, _02220620 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x21c
	str r0, [r3, #4]
	bx ip
	.balign 4, 0
_0222061C: .word ov13_0224CF84
_02220620: .word MI_CpuFill8
	arm_func_end MBi_SetParentPieceBuffer

	arm_func_start MBi_ClearParentPieceBuffer
MBi_ClearParentPieceBuffer: ; 0x02220624
	stmdb sp!, {r4, lr}
	ldr r1, _02220664 ; =ov13_0224CF84
	ldr r1, [r1, #4]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	sub r4, r0, #1
	add r0, r1, r4, lsl #5
	mov r1, #0
	mov r2, #0x1e
	bl MI_CpuFill8
	ldr r0, _02220664 ; =ov13_0224CF84
	mov r1, #0
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #2
	str r1, [r0, #0x1e0]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02220664: .word ov13_0224CF84
	arm_func_end MBi_ClearParentPieceBuffer

	arm_func_start MBi_MakeParentSendBuffer
MBi_MakeParentSendBuffer: ; 0x02220668
	ldrb r2, [r0]
	mov r3, r1
	add r3, r3, #1
	strb r2, [r1]
	ldrb r1, [r0]
	cmp r1, #6
	addls pc, pc, r1, lsl #2
	b _022206DC
_02220688: ; jump table
	b _022206DC ; case 0
	b _022206E4 ; case 1
	b _022206E4 ; case 2
	b _022206E4 ; case 3
	b _022206A4 ; case 4
	b _022206E4 ; case 5
	b _022206E4 ; case 6
_022206A4:
	ldrh r1, [r0, #2]
	strb r1, [r3]
	ldrh r1, [r0, #2]
	and r1, r1, #0xff00
	mov r1, r1, asr #8
	strb r1, [r3, #1]
	ldrh r1, [r0, #4]
	strb r1, [r3, #2]
	ldrh r0, [r0, #4]
	and r0, r0, #0xff00
	mov r0, r0, asr #8
	strb r0, [r3, #3]
	add r3, r3, #4
	b _022206E4
_022206DC:
	mov r0, #0
	bx lr
_022206E4:
	mov r0, r3
	bx lr
	arm_func_end MBi_MakeParentSendBuffer

	arm_func_start MBi_SetRecvBufferFromChild
MBi_SetRecvBufferFromChild: ; 0x022206EC
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6]
	mov r5, r1
	mov r4, r2
	strb r0, [r5]
	cmp r0, #7
	beq _02220720
	cmp r0, #8
	beq _02220784
	cmp r0, #9
	beq _022207AC
	b _022207F4
_02220720:
	mov r0, r4
	bl IsGetAllRequestData
	cmp r0, #0
	beq _02220744
	ldr r0, _02220804 ; =ov13_0224CF84
	sub r1, r4, #1
	ldr r0, [r0, #4]
	add r0, r0, r1, lsl #5
	ldmia sp!, {r4, r5, r6, pc}
_02220744:
	ldrb r2, [r6, #1]
	ldr r0, _02220804 ; =ov13_0224CF84
	strb r2, [r5, #2]
	ldr r1, [r0, #0xc]
	cmp r2, r1
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, pc}
	ldr r2, [r0, #8]
	add r0, r6, #2
	add r1, r5, #3
	bl MI_CpuCopy8
	mov r0, r5
	mov r1, r4
	bl MBi_ReceiveRequestDataPiece
	mov r4, r0
	b _022207FC
_02220784:
	ldrb r0, [r6, #1]
	add r4, r6, #3
	strh r0, [r5, #2]
	ldrb r0, [r6, #2]
	ldrh r1, [r5, #2]
	mov r0, r0, lsl #8
	and r0, r0, #0xff00
	orr r0, r1, r0
	strh r0, [r5, #2]
	b _022207FC
_022207AC:
	ldrb r0, [r6, #1]
	add r4, r6, #3
	ldr r1, _02220804 ; =ov13_0224CF84
	strh r0, [r5, #2]
	ldrb r2, [r6, #2]
	ldrh r3, [r5, #2]
	mov r0, r4
	mov r2, r2, lsl #8
	and r2, r2, #0xff00
	orr r2, r3, r2
	strh r2, [r5, #2]
	ldr r2, [r1, #8]
	add r1, r5, #4
	bl MI_CpuCopy8
	ldr r0, _02220804 ; =ov13_0224CF84
	ldr r0, [r0, #8]
	add r4, r4, r0
	b _022207FC
_022207F4:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_022207FC:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02220804: .word ov13_0224CF84
	arm_func_end MBi_SetRecvBufferFromChild

	arm_func_start MBi_ReceiveRequestDataPiece
MBi_ReceiveRequestDataPiece: ; 0x02220808
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _02220890 ; =ov13_0224CF84
	mov r6, r1
	ldr r3, [r2, #4]
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldrb r5, [r0, #2]
	ldr r1, [r2, #0xc]
	cmp r5, r1
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, pc}
	sub r4, r6, #1
	ldr r2, [r2, #8]
	add r1, r3, r4, lsl #5
	mla r1, r5, r2, r1
	add r0, r0, #3
	bl MI_CpuCopy8
	ldr r0, _02220890 ; =ov13_0224CF84
	mov r1, #1
	ldr r2, [r0, #4]
	mov r0, r6
	add r3, r2, #0x1e0
	ldr r2, [r3, r4, lsl #2]
	orr r1, r2, r1, lsl r5
	str r1, [r3, r4, lsl #2]
	bl IsGetAllRequestData
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _02220890 ; =ov13_0224CF84
	ldr r0, [r0, #4]
	add r0, r0, r4, lsl #5
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02220890: .word ov13_0224CF84
	arm_func_end MBi_ReceiveRequestDataPiece

	arm_func_start IsGetAllRequestData
IsGetAllRequestData: ; 0x02220894
	ldr r1, _022208E4 ; =ov13_0224CF84
	mov r2, #0
	ldr ip, [r1, #0xc]
	cmp ip, #0
	ble _022208DC
	ldr r1, [r1, #4]
	sub r0, r0, #1
	add r0, r1, r0, lsl #2
	ldr r3, [r0, #0x1e0]
	mov r1, #1
_022208BC:
	tst r3, r1, lsl r2
	moveq r0, #0
	bxeq lr
	add r0, r2, #1
	mov r0, r0, lsl #0x10
	cmp ip, r0, lsr #16
	mov r2, r0, lsr #0x10
	bgt _022208BC
_022208DC:
	mov r0, #1
	bx lr
	.balign 4, 0
_022208E4: .word ov13_0224CF84
	arm_func_end IsGetAllRequestData

	.rodata

MBi_defaultLoadSegList:
	.word 2
	.word 0
	.word 1

mbi_seg_header_default:
	.word 0x00004000, 0x00001000
	.word 0x00007000, 0x00001000
	.word 0x00000000, 0x00000000

	.data

_02245980:
	.byte 0xFF, 0x00, 0x00, 0x00

mbi_seg_header: ; 0x02245984
	.word mbi_seg_header_default

ov13_02245988: ; 0x02245988
	.asciz "rom"
	.balign 4, 0

ov13_0224598C: ; 0x0224598C
	.byte 0x05, 0x00, 0x28, 0x00
	.byte 0x28, 0x00, 0xFF, 0xFF
	.word ov13_0224599C
	.byte 0x01, 0x00, 0x00, 0x00

ov13_0224599C:
	.byte 0x6D, 0x00, 0x75, 0x00
	.byte 0x6C, 0x00, 0x74, 0x00, 0x69, 0x00, 0x62, 0x00, 0x6F, 0x00, 0x6F, 0x00, 0x74, 0x00, 0x00, 0x00

	.bss

_02247480:
	.space 0x4

ov13_02247484: ; 0x02247484
	.space 0x1C

ov13_022474A0: ; 0x022474A0
	.space 0x40

bsendBuff: ; 0x022474E0
	.space 0x5A60

ov13_0224CF40: ; 0x0224CF40
	.space 0xC

mbc: ; 0x0224CF4C
	.space 0x14

ov13_0224CF60: ; 0x0224CF60
	.space 0x20

ov13_0224CF80: ; 0x0224CF80
	.space 0x4

ov13_0224CF84: ; 0x0224CF84
	.space 0x14
