	.include "asm/macros.inc"
	.include "nnsys.inc"
	.include "global.inc"

	.public sIsDispOn
	.public GXi_DmaId

	.bss

	.public _021D84B0
_021D84B0:
	.space 0x4

	.public _021D84B4
_021D84B4:
	.space 0xC

	.public _021D84C0
_021D84C0:
	.space 0x4

	.public _021D84C4
_021D84C4:
	.space 0xC

	.public _021D84D0
_021D84D0:
	.space 0x14

	.public _021D84E4
_021D84E4:
	.space 0x4

	.public _021D84E8
_021D84E8:
	.space 0x4

	.public _021D84EC
_021D84EC:
	.space 0x14

	.public _021D8500
_021D8500:
	.space 0x4

	.public _021D8504
_021D8504:
	.space 0x10

	.public _021D8514
_021D8514:
	.space 0x4

	.public _021D8518
_021D8518:
	.space 0x100

	.public _021D8618
_021D8618:
	.space 0x400

	.public _021D8A18
_021D8A18:
	.space 0x40

	.public _021D8A58
_021D8A58:
	.space 0x100

	.public _021D8B58
_021D8B58:
	.space 0x400

	.public _021D8F58
_021D8F58:
	.space 0x40

	.public _021D8F98
_021D8F98:
	.space 0x100

	.public _021D9098
_021D9098:
	.space 0x400

	.public _021D9498
_021D9498:
	.space 0x40

	.public _021D94D8
_021D94D8:
	.space 0x10

	.public _021D94E8
_021D94E8:
	.space 0x80

	.public _021D9568
_021D9568:
	.space 0x4

	.public _021D956C
_021D956C:
	.space 0xFC

	.public _021D9668
_021D9668:
	.space 0x10

	.public _021D9678
_021D9678:
	.space 0x4

	.public _021D967C
_021D967C:
	.space 0x2EC

	.public _021D9968
_021D9968:
	.space 0x300

	.public _021D9C68
_021D9C68:
	.space 0x370

	.public _021D9FD8
_021D9FD8:
	.space 0x90

	.public _021DA068
_021DA068:
	.space 0x4

	.public _021DA06C
_021DA06C:
	.space 0x404

	.public _021DA470
_021DA470:
	.space 0xC

	.public _021DA47C
_021DA47C:
	.space 0x1C

	.public _021DA498
_021DA498:
	.space 0x4

	.public NNS_G3dGlb
NNS_G3dGlb: ; 0x021DA49C
	.space 0x264

	.public _021DA700
_021DA700:
	.space 0x4

	.public _021DA704
_021DA704:
	.space 0xE00

	.public _021DB504
_021DB504:
	.space 0x4

	.public _021DB508
_021DB508:
	.space 0x4

	.public _021DB50C
_021DB50C:
	.space 0x4

	.public _021DB510
_021DB510:
	.space 0x4

	.public _021DB514
_021DB514:
	.space 0x4

	.public _021DB518
_021DB518:
	.space 0x5EC

	.public _021DBB04
_021DBB04:
	.space 0x40

	.public _021DBB44
_021DBB44:
	.space 0x18C0

	.public _021DD404
_021DD404:
	.space 0x4

	.public _021DD408
_021DD408:
	.space 0x18

	.public _021DD420
_021DD420:
	.space 0x10

	.public _021DD430
_021DD430:
	.space 0xC

	.public _021DD43C
_021DD43C:
	.space 0x24

	.public _021DD460
_021DD460:
	.space 0x23C0

	.public _021DF820
_021DF820:
	.space 0xC

	.public _021DF82C
_021DF82C:
	.space 0x140

	.public _021DF96C
_021DF96C:
	.space 0xC

	.public _021DF978
_021DF978:
	.space 0xC

	.public _021DF984
_021DF984:
	.space 0x440

	.public _021DFDC4
_021DFDC4:
	.space 0x8

	.public _021DFDCC
_021DFDCC:
	.space 0x10

	.public _021DFDDC
_021DFDDC:
	.space 0x4

	.public _021DFDE0
_021DFDE0:
	.space 0x4

	.public _021DFDE4
_021DFDE4:
	.space 0x460

	.public _021E0244
_021E0244:
	.space 0x4

	.public _021E0248
_021E0248:
	.space 0xC

	.public _021E0254
_021E0254:
	.space 0x40

	.public _021E0294
_021E0294:
	.space 0x80

	.public _021E0314
_021E0314:
	.space 0x8

	.public _021E031C
_021E031C:
	.space 0x40

	.public _021E035C
_021E035C:
	.space 0x5B4

	.public _021E0910
_021E0910:
	.space 0x4

	.public _021E0914
_021E0914:
	.space 0x3C

	.public _021E0950
_021E0950:
	.space 0xC

	.public _021E095C
_021E095C:
	.space 0x66C

	.public _021E0FC8
_021E0FC8:
	.space 0x18

	.public _021E0FE0
_021E0FE0:
	.space 0xC

	.public _021E0FEC
_021E0FEC:
	.space 0x5D0

	.text

	arm_func_start NNS_FndInitList
NNS_FndInitList: ; 0x020B4B68
	mov r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	strh r2, [r0, #8]
	strh r1, [r0, #0xa]
	bx lr
	arm_func_end NNS_FndInitList

	arm_func_start SetFirstObject
SetFirstObject: ; 0x020B4B80
	ldrh r3, [r0, #0xa]
	mov r2, #0
	add ip, r1, r3
	str r2, [ip, #4]
	str r2, [r1, r3]
	str r1, [r0]
	str r1, [r0, #4]
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	bx lr
	arm_func_end SetFirstObject

	arm_func_start NNS_FndAppendListObject
NNS_FndAppendListObject: ; 0x020B4BAC
	stmdb sp!, {r3, lr}
	ldr r2, [r0]
	cmp r2, #0
	bne _020B4BC4
	bl SetFirstObject
	ldmia sp!, {r3, pc}
_020B4BC4:
	ldrh ip, [r0, #0xa]
	ldr r3, [r0, #4]
	mov r2, #0
	str r3, [r1, ip]
	add r3, r1, ip
	str r2, [r3, #4]
	ldrh r2, [r0, #0xa]
	ldr r3, [r0, #4]
	add r2, r3, r2
	str r1, [r2, #4]
	str r1, [r0, #4]
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_FndAppendListObject

	arm_func_start NNS_FndPrependListObject
NNS_FndPrependListObject: ; 0x020B4C00
	stmdb sp!, {r3, lr}
	ldr r2, [r0]
	cmp r2, #0
	bne _020B4C18
	bl SetFirstObject
	ldmia sp!, {r3, pc}
_020B4C18:
	ldrh r3, [r0, #0xa]
	mov r2, #0
	str r2, [r1, r3]
	ldr r2, [r0]
	add r3, r1, r3
	str r2, [r3, #4]
	ldrh r2, [r0, #0xa]
	ldr r3, [r0]
	str r1, [r3, r2]
	str r1, [r0]
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_FndPrependListObject

	arm_func_start NNS_FndInsertListObject
NNS_FndInsertListObject: ; 0x020B4C50
	stmdb sp!, {r3, lr}
	cmp r1, #0
	bne _020B4C68
	mov r1, r2
	bl NNS_FndAppendListObject
	ldmia sp!, {r3, pc}
_020B4C68:
	ldr r3, [r0]
	cmp r1, r3
	bne _020B4C80
	mov r1, r2
	bl NNS_FndPrependListObject
	ldmia sp!, {r3, pc}
_020B4C80:
	ldrh lr, [r0, #0xa]
	ldr r3, [r1, lr]
	add ip, r2, lr
	str r3, [r2, lr]
	str r1, [ip, #4]
	add r3, r3, lr
	str r2, [r3, #4]
	ldrh r3, [r0, #0xa]
	str r2, [r1, r3]
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_FndInsertListObject

	arm_func_start NNS_FndRemoveListObject
NNS_FndRemoveListObject: ; 0x020B4CB4
	stmdb sp!, {r3, lr}
	ldrh ip, [r0, #0xa]
	ldr r3, [r1, ip]
	add lr, r1, ip
	cmp r3, #0
	ldreq r1, [lr, #4]
	streq r1, [r0]
	ldrne r2, [lr, #4]
	addne r1, r3, ip
	strne r2, [r1, #4]
	ldr r3, [lr, #4]
	cmp r3, #0
	ldreq r1, [lr]
	streq r1, [r0, #4]
	ldrneh r1, [r0, #0xa]
	ldrne r2, [lr]
	strne r2, [r3, r1]
	mov r1, #0
	str r1, [lr]
	str r1, [lr, #4]
	ldrh r1, [r0, #8]
	sub r1, r1, #1
	strh r1, [r0, #8]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_FndRemoveListObject

	arm_func_start NNS_FndGetNextListObject
NNS_FndGetNextListObject: ; 0x020B4D14
	cmp r1, #0
	ldreq r0, [r0]
	ldrneh r0, [r0, #0xa]
	addne r0, r1, r0
	ldrne r0, [r0, #4]
	bx lr
	arm_func_end NNS_FndGetNextListObject

	arm_func_start NNS_FndGetPrevListObject
NNS_FndGetPrevListObject: ; 0x020B4D2C
	cmp r1, #0
	ldreq r0, [r0, #4]
	ldrneh r0, [r0, #0xa]
	ldrne r0, [r1, r0]
	bx lr
	arm_func_end NNS_FndGetPrevListObject

	arm_func_start FindContainHeap
FindContainHeap: ; 0x020B4D40
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r1, #0
	mov r6, r0
	bl NNS_FndGetNextListObject
	movs r4, r0
	beq _020B4DA0
_020B4D5C:
	ldr r0, [r4, #0x18]
	cmp r0, r5
	bhi _020B4D8C
	ldr r0, [r4, #0x1c]
	cmp r5, r0
	bhs _020B4D8C
	mov r1, r5
	add r0, r4, #0xc
	bl FindContainHeap
	cmp r0, #0
	moveq r0, r4
	ldmia sp!, {r4, r5, r6, pc}
_020B4D8C:
	mov r0, r6
	mov r1, r4
	bl NNS_FndGetNextListObject
	movs r4, r0
	bne _020B4D5C
_020B4DA0:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end FindContainHeap

	arm_func_start FindListContainHeap
FindListContainHeap: ; 0x020B4DA8
	stmdb sp!, {r4, lr}
	ldr r4, _020B4DCC ; =_021D84B4
	mov r1, r0
	mov r0, r4
	bl FindContainHeap
	cmp r0, #0
	addne r4, r0, #0xc
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B4DCC: .word _021D84B4
	arm_func_end FindListContainHeap

	arm_func_start NNSi_FndInitHeapHead
NNSi_FndInitHeapHead: ; 0x020B4DD0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r0, [sp, #8]
	str r1, [r4]
	mov ip, #0
	str r2, [r4, #0x18]
	bic r1, ip, #0xff
	and r0, r0, #0xff
	orr r2, r1, r0
	str r3, [r4, #0x1c]
	add r0, r4, #0xc
	mov r1, #4
	str r2, [r4, #0x20]
	bl NNS_FndInitList
	ldr r0, _020B4E44 ; =_021D84B0
	ldr r0, [r0]
	cmp r0, #0
	bne _020B4E30
	ldr r0, _020B4E48 ; =_021D84B4
	mov r1, #4
	bl NNS_FndInitList
	ldr r0, _020B4E44 ; =_021D84B0
	mov r1, #1
	str r1, [r0]
_020B4E30:
	mov r0, r4
	bl FindListContainHeap
	mov r1, r4
	bl NNS_FndAppendListObject
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B4E44: .word _021D84B0
_020B4E48: .word _021D84B4
	arm_func_end NNSi_FndInitHeapHead

	arm_func_start NNSi_FndFinalizeHeap
NNSi_FndFinalizeHeap: ; 0x020B4E4C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl FindListContainHeap
	mov r1, r4
	bl NNS_FndRemoveListObject
	ldmia sp!, {r4, pc}
	arm_func_end NNSi_FndFinalizeHeap

	arm_func_start GetRegionOfMBlock
GetRegionOfMBlock: ; 0x020B4E64
	ldrh r2, [r1, #2]
	add r3, r1, #0x10
	mov r2, r2, asr #8
	and r2, r2, #0x7f
	mov r2, r2, lsl #0x10
	sub r2, r1, r2, lsr #16
	str r2, [r0]
	ldr r1, [r1, #4]
	add r1, r1, r3
	str r1, [r0, #4]
	bx lr
	arm_func_end GetRegionOfMBlock

	arm_func_start RemoveMBlock
RemoveMBlock: ; 0x020B4E90
	ldr r2, [r1, #8]
	ldr r1, [r1, #0xc]
	cmp r2, #0
	strne r1, [r2, #0xc]
	streq r1, [r0]
	cmp r1, #0
	strne r2, [r1, #8]
	streq r2, [r0, #4]
	mov r0, r2
	bx lr
	arm_func_end RemoveMBlock

	arm_func_start InsertMBlock
InsertMBlock: ; 0x020B4EB8
	str r2, [r1, #8]
	cmp r2, #0
	ldrne r3, [r2, #0xc]
	strne r1, [r2, #0xc]
	ldreq r3, [r0]
	streq r1, [r0]
	str r3, [r1, #0xc]
	cmp r3, #0
	strne r1, [r3, #8]
	streq r1, [r0, #4]
	mov r0, r1
	bx lr
	arm_func_end InsertMBlock

	arm_func_start InitMBlock
InitMBlock: ; 0x020B4EE8
	ldr r3, [r0]
	mov r2, #0
	strh r1, [r3]
	strh r2, [r3, #2]
	ldr r1, [r0, #4]
	add r0, r3, #0x10
	sub r0, r1, r0
	stmib r3, {r0, r2}
	mov r0, r3
	str r2, [r3, #0xc]
	bx lr
	arm_func_end InitMBlock

	arm_func_start InitExpHeap
InitExpHeap: ; 0x020B4F14
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r3, r1
	mov r4, r0
	str r2, [sp]
	ldr r1, _020B4F80 ; =0x45585048
	add r2, r4, #0x38
	bl NNSi_FndInitHeapHead
	mov r0, #0
	strh r0, [r4, #0x34]
	bic r0, r0, #1
	strh r0, [r4, #0x36]
	ldr r1, [r4, #0x18]
	add r0, sp, #4
	str r1, [sp, #4]
	ldr r2, [r4, #0x1c]
	ldr r1, _020B4F84 ; =0x00004652
	str r2, [sp, #8]
	bl InitMBlock
	str r0, [r4, #0x24]
	str r0, [r4, #0x28]
	mov r1, #0
	str r1, [r4, #0x2c]
	mov r0, r4
	str r1, [r4, #0x30]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020B4F80: .word 0x45585048
_020B4F84: .word 0x00004652
	arm_func_end InitExpHeap

	arm_func_start AllocUsedBlockFromFreeBlock
AllocUsedBlockFromFreeBlock: ; 0x020B4F88
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	mov r7, r0
	add r0, sp, #0x10
	mov r8, r1
	mov r6, r2
	mov r4, r3
	bl GetRegionOfMBlock
	ldr r3, [sp, #0x14]
	sub r5, r6, #0x10
	add r2, r4, r6
	mov r0, r7
	mov r1, r8
	str r5, [sp, #0x14]
	str r3, [sp, #0xc]
	str r2, [sp, #8]
	bl RemoveMBlock
	ldr r2, [sp, #0x10]
	ldr r1, [sp, #0x14]
	mov r4, r0
	sub r0, r1, r2
	cmp r0, #0x14
	strlo r2, [sp, #0x14]
	blo _020B5008
	ldr r1, _020B5100 ; =0x00004652
	add r0, sp, #0x10
	bl InitMBlock
	mov r1, r0
	mov r0, r7
	mov r2, r4
	bl InsertMBlock
	mov r4, r0
_020B5008:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	sub r0, r1, r0
	cmp r0, #0x14
	strlo r1, [sp, #8]
	blo _020B503C
	ldr r1, _020B5100 ; =0x00004652
	add r0, sp, #8
	bl InitMBlock
	mov r1, r0
	mov r0, r7
	mov r2, r4
	bl InsertMBlock
_020B503C:
	ldr r0, [r7, #-4]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #8]
	and r0, r0, #0xff
	tst r0, #1
	sub r2, r2, r1
	beq _020B5060
	mov r0, #0
	bl MIi_CpuClear32
_020B5060:
	ldr r2, [sp, #8]
	ldr r1, _020B5104 ; =0x00005544
	add r0, sp, #0
	str r5, [sp]
	str r2, [sp, #4]
	bl InitMBlock
	mov r1, r0
	ldrh r3, [r1, #2]
	ldrh r2, [sp, #0x30]
	add r0, r7, #8
	bic r3, r3, #0x8000
	strh r3, [r1, #2]
	ldrh r3, [r1, #2]
	mov r2, r2, lsl #0x1f
	orr r2, r3, r2, lsr #16
	strh r2, [r1, #2]
	ldrh r2, [r1, #2]
	ldr r3, [sp, #0x14]
	bic r2, r2, #0x7f00
	strh r2, [r1, #2]
	sub r2, r1, r3
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	ldrh r3, [r1, #2]
	mov r2, r2, lsl #0x19
	orr r2, r3, r2, lsr #17
	strh r2, [r1, #2]
	ldrh r2, [r1, #2]
	ldrh r3, [r7, #0x10]
	bic r2, r2, #0xff
	strh r2, [r1, #2]
	ldrh r2, [r1, #2]
	and r3, r3, #0xff
	orr r2, r2, r3
	strh r2, [r1, #2]
	ldr r2, [r7, #0xc]
	bl InsertMBlock
	mov r0, r6
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020B5100: .word 0x00004652
_020B5104: .word 0x00005544
	arm_func_end AllocUsedBlockFromFreeBlock

	arm_func_start AllocFromHead__ExpHeap
AllocFromHead__ExpHeap: ; 0x020B5108
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldrh r4, [r0, #0x36]
	mov r3, r1
	ldr ip, [r0, #0x24]
	and r1, r4, #1
	mov r1, r1, lsl #0x10
	movs r1, r1, lsr #0x10
	mov r1, #0
	moveq r6, #1
	movne r6, #0
	mov r4, r1
	cmp ip, #0
	sub lr, r1, #1
	beq _020B5198
	sub r2, r2, #1
	mvn r5, r2
_020B5148:
	add r8, ip, #0x10
	add r7, r2, r8
	and sb, r5, r7
	sub r7, sb, r8
	ldr r8, [ip, #4]
	add r7, r3, r7
	cmp r8, r7
	blo _020B518C
	cmp lr, r8
	bls _020B518C
	mov r1, ip
	mov lr, r8
	mov r4, sb
	cmp r6, #0
	bne _020B5198
	cmp r8, r3
	beq _020B5198
_020B518C:
	ldr ip, [ip, #0xc]
	cmp ip, #0
	bne _020B5148
_020B5198:
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r5, #0
	mov r2, r4
	add r0, r0, #0x24
	str r5, [sp]
	bl AllocUsedBlockFromFreeBlock
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end AllocFromHead__ExpHeap

	arm_func_start AllocFromTail__ExpHeap
AllocFromTail__ExpHeap: ; 0x020B51BC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldrh r4, [r0, #0x36]
	mov r3, r1
	ldr ip, [r0, #0x28]
	and r1, r4, #1
	mov r1, r1, lsl #0x10
	movs r1, r1, lsr #0x10
	mov r1, #0
	moveq r5, #1
	movne r5, #0
	mov r4, r1
	cmp ip, #0
	sub lr, r1, #1
	beq _020B5248
	sub r2, r2, #1
	mvn r2, r2
_020B51FC:
	ldr r8, [ip, #4]
	add sb, ip, #0x10
	add r6, r8, sb
	sub r6, r6, r3
	and r7, r2, r6
	subs r6, r7, sb
	bmi _020B523C
	cmp lr, r8
	bls _020B523C
	mov r1, ip
	mov lr, r8
	mov r4, r7
	cmp r5, #0
	bne _020B5248
	cmp r8, r3
	beq _020B5248
_020B523C:
	ldr ip, [ip, #8]
	cmp ip, #0
	bne _020B51FC
_020B5248:
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r5, #1
	mov r2, r4
	add r0, r0, #0x24
	str r5, [sp]
	bl AllocUsedBlockFromFreeBlock
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end AllocFromTail__ExpHeap

	arm_func_start RecycleRegion
RecycleRegion: ; 0x020B526C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r1
	ldr r2, [r5]
	ldr r1, [r5, #4]
	mov r6, r0
	str r2, [sp]
	str r1, [sp, #4]
	ldr r1, [r6]
	mov r4, #0
	cmp r1, #0
	beq _020B52E0
	ldr r0, [r5]
_020B52A0:
	cmp r1, r0
	movlo r4, r1
	blo _020B52D4
	ldr r0, [r5, #4]
	cmp r1, r0
	bne _020B52E0
	ldr r2, [r1, #4]
	add r0, r1, #0x10
	add r2, r2, r0
	mov r0, r6
	str r2, [sp, #4]
	bl RemoveMBlock
	b _020B52E0
_020B52D4:
	ldr r1, [r1, #0xc]
	cmp r1, #0
	bne _020B52A0
_020B52E0:
	cmp r4, #0
	beq _020B5314
	ldr r2, [r4, #4]
	add r1, r4, #0x10
	ldr r0, [r5]
	add r1, r2, r1
	cmp r1, r0
	bne _020B5314
	mov r0, r6
	mov r1, r4
	str r4, [sp]
	bl RemoveMBlock
	mov r4, r0
_020B5314:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	sub r0, r1, r0
	cmp r0, #0x10
	addlo sp, sp, #8
	movlo r0, #0
	ldmloia sp!, {r4, r5, r6, pc}
	ldr r1, _020B5358 ; =0x00004652
	add r0, sp, #0
	bl InitMBlock
	mov r1, r0
	mov r0, r6
	mov r2, r4
	bl InsertMBlock
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B5358: .word 0x00004652
	arm_func_end RecycleRegion

	arm_func_start NNS_FndCreateExpHeapEx
NNS_FndCreateExpHeapEx: ; 0x020B535C
	stmdb sp!, {r3, lr}
	add r1, r1, r0
	add r0, r0, #3
	bic r1, r1, #3
	bic r0, r0, #3
	cmp r0, r1
	bhi _020B5384
	sub r3, r1, r0
	cmp r3, #0x4c
	bhs _020B538C
_020B5384:
	mov r0, #0
	ldmia sp!, {r3, pc}
_020B538C:
	bl InitExpHeap
	ldmia sp!, {r3, pc}
	arm_func_end NNS_FndCreateExpHeapEx

	arm_func_start NNS_FndDestroyExpHeap
NNS_FndDestroyExpHeap: ; 0x020B5394
	ldr ip, _020B539C ; =NNSi_FndFinalizeHeap
	bx ip
	.align 2, 0
_020B539C: .word NNSi_FndFinalizeHeap
	arm_func_end NNS_FndDestroyExpHeap

	arm_func_start NNS_FndAllocFromExpHeapEx
NNS_FndAllocFromExpHeapEx: ; 0x020B53A0
	stmdb sp!, {r3, lr}
	cmp r1, #0
	moveq r1, #1
	add r1, r1, #3
	cmp r2, #0
	bic r1, r1, #3
	blt _020B53C4
	bl AllocFromHead__ExpHeap
	ldmia sp!, {r3, pc}
_020B53C4:
	rsb r2, r2, #0
	bl AllocFromTail__ExpHeap
	ldmia sp!, {r3, pc}
	arm_func_end NNS_FndAllocFromExpHeapEx

	arm_func_start NNS_FndResizeForMBlockExpHeap
NNS_FndResizeForMBlockExpHeap: ; 0x020B53D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	mov r4, r1
	mov sb, r2
	sub r8, r4, #0x10
	add r1, sb, #3
	ldr r7, [r8, #4]
	bic sb, r1, #3
	cmp sb, r7
	mov r5, r0
	addeq sp, sp, #0x10
	moveq r0, sb
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bls _020B54F0
	ldr r6, [r5, #0x24]
	add r0, r8, #0x10
	cmp r6, #0
	add r0, r7, r0
	beq _020B542C
_020B541C:
	cmp r6, r0
	ldrne r6, [r6, #0xc]
	cmpne r6, #0
	bne _020B541C
_020B542C:
	cmp r6, #0
	beq _020B5448
	ldr r0, [r6, #4]
	add r1, r7, #0x10
	add r0, r1, r0
	cmp sb, r0
	bls _020B5454
_020B5448:
	add sp, sp, #0x10
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020B5454:
	add r0, sp, #8
	mov r1, r6
	bl GetRegionOfMBlock
	mov r1, r6
	add r0, r5, #0x24
	bl RemoveMBlock
	ldr r2, [sp, #0xc]
	add r3, sb, r4
	ldr r6, [sp, #8]
	sub r1, r2, r3
	str r3, [sp, #8]
	cmp r1, #0x10
	strlo r2, [sp, #8]
	mov r7, r0
	ldr r0, [sp, #8]
	sub r0, r0, r4
	str r0, [r8, #4]
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	sub r0, r1, r0
	cmp r0, #0x10
	blo _020B54C8
	ldr r1, _020B552C ; =0x00004652
	add r0, sp, #8
	bl InitMBlock
	mov r1, r0
	mov r2, r7
	add r0, r5, #0x24
	bl InsertMBlock
_020B54C8:
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #8]
	and r0, r0, #0xff
	tst r0, #1
	sub r2, r1, r6
	beq _020B5520
	mov r1, r6
	mov r0, #0
	bl MIi_CpuClear32
	b _020B5520
_020B54F0:
	add r0, sb, r4
	str r0, [sp]
	ldr r1, [r8, #4]
	add r0, r8, #0x10
	add r0, r1, r0
	str r0, [sp, #4]
	add r1, sp, #0
	add r0, r5, #0x24
	str sb, [r8, #4]
	bl RecycleRegion
	cmp r0, #0
	streq r7, [r8, #4]
_020B5520:
	ldr r0, [r8, #4]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020B552C: .word 0x00004652
	arm_func_end NNS_FndResizeForMBlockExpHeap

	arm_func_start NNS_FndFreeToExpHeap
NNS_FndFreeToExpHeap: ; 0x020B5530
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	sub r4, r1, #0x10
	mov r5, r0
	add r0, sp, #0
	mov r1, r4
	bl GetRegionOfMBlock
	mov r1, r4
	add r0, r5, #0x2c
	bl RemoveMBlock
	add r1, sp, #0
	add r0, r5, #0x24
	bl RecycleRegion
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNS_FndFreeToExpHeap

	arm_func_start NNS_FndGetTotalFreeSizeForExpHeap
NNS_FndGetTotalFreeSizeForExpHeap: ; 0x020B556C
	ldr r2, [r0, #0x24]
	mov r0, #0
	cmp r2, #0
	bxeq lr
_020B557C:
	ldr r1, [r2, #4]
	ldr r2, [r2, #0xc]
	add r0, r0, r1
	cmp r2, #0
	bne _020B557C
	bx lr
	arm_func_end NNS_FndGetTotalFreeSizeForExpHeap

	arm_func_start NNS_FndSetGroupIDForExpHeap
NNS_FndSetGroupIDForExpHeap: ; 0x020B5594
	ldrh r2, [r0, #0x34]
	strh r1, [r0, #0x34]
	mov r0, r2
	bx lr
	arm_func_end NNS_FndSetGroupIDForExpHeap

	arm_func_start NNS_FndGetSizeForMBlockExpHeap
NNS_FndGetSizeForMBlockExpHeap: ; 0x020B55A4
	ldr r0, [r0, #-0xc]
	bx lr
	arm_func_end NNS_FndGetSizeForMBlockExpHeap

	arm_func_start NNS_FndGetGroupIDForMBlockExpHeap
NNS_FndGetGroupIDForMBlockExpHeap: ; 0x020B55AC
	ldrh r0, [r0, #-0xe]
	and r0, r0, #0xff
	bx lr
	arm_func_end NNS_FndGetGroupIDForMBlockExpHeap

	arm_func_start InitFrameHeap
InitFrameHeap: ; 0x020B55B8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r3, r1
	mov r4, r0
	str r2, [sp]
	ldr r1, _020B55FC ; =0x46524D48
	add r2, r4, #0x30
	bl NNSi_FndInitHeapHead
	ldr r0, [r4, #0x18]
	mov r1, #0
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x1c]
	mov r0, r4
	str r2, [r4, #0x28]
	str r1, [r4, #0x2c]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020B55FC: .word 0x46524D48
	arm_func_end InitFrameHeap

	arm_func_start AllocFromHead__FrameHeap
AllocFromHead__FrameHeap: ; 0x020B5600
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r3, [r4]
	sub r0, r2, #1
	mvn r2, r0
	add r0, r0, r3
	and r5, r2, r0
	ldr r0, [r4, #4]
	add r6, r1, r5
	cmp r6, r0
	movhi r0, #0
	ldmhiia sp!, {r4, r5, r6, pc}
	ldr r0, [r4, #-4]
	sub r2, r6, r3
	and r0, r0, #0xff
	tst r0, #1
	beq _020B5650
	mov r1, r3
	mov r0, #0
	bl MIi_CpuClear32
_020B5650:
	mov r0, r5
	str r6, [r4]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end AllocFromHead__FrameHeap

	arm_func_start AllocFromTail__FrameHeap
AllocFromTail__FrameHeap: ; 0x020B565C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r3, [r4, #4]
	sub r0, r2, #1
	mvn r2, r0
	sub r1, r3, r1
	ldr r0, [r4]
	and r5, r2, r1
	cmp r5, r0
	movlo r0, #0
	ldmloia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #-4]
	sub r2, r3, r5
	and r0, r0, #0xff
	tst r0, #1
	beq _020B56A8
	mov r1, r5
	mov r0, #0
	bl MIi_CpuClear32
_020B56A8:
	mov r0, r5
	str r5, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end AllocFromTail__FrameHeap

	arm_func_start FreeHead__FrameHeap
FreeHead__FrameHeap: ; 0x020B56B4
	ldr r2, [r0, #0x18]
	mov r1, #0
	str r2, [r0, #0x24]
	str r1, [r0, #0x2c]
	bx lr
	arm_func_end FreeHead__FrameHeap

	arm_func_start FreeTail__FrameHeap
FreeTail__FrameHeap: ; 0x020B56C8
	ldr r2, [r0, #0x2c]
	cmp r2, #0
	beq _020B56E8
_020B56D4:
	ldr r1, [r0, #0x1c]
	str r1, [r2, #8]
	ldr r2, [r2, #0xc]
	cmp r2, #0
	bne _020B56D4
_020B56E8:
	ldr r1, [r0, #0x1c]
	str r1, [r0, #0x28]
	bx lr
	arm_func_end FreeTail__FrameHeap

	arm_func_start NNS_FndCreateFrmHeapEx
NNS_FndCreateFrmHeapEx: ; 0x020B56F4
	stmdb sp!, {r3, lr}
	add r1, r1, r0
	add r0, r0, #3
	bic r1, r1, #3
	bic r0, r0, #3
	cmp r0, r1
	bhi _020B571C
	sub r3, r1, r0
	cmp r3, #0x30
	bhs _020B5724
_020B571C:
	mov r0, #0
	ldmia sp!, {r3, pc}
_020B5724:
	bl InitFrameHeap
	ldmia sp!, {r3, pc}
	arm_func_end NNS_FndCreateFrmHeapEx

	arm_func_start NNS_FndDestroyFrmHeap
NNS_FndDestroyFrmHeap: ; 0x020B572C
	ldr ip, _020B5734 ; =NNSi_FndFinalizeHeap
	bx ip
	.align 2, 0
_020B5734: .word NNSi_FndFinalizeHeap
	arm_func_end NNS_FndDestroyFrmHeap

	arm_func_start NNS_FndAllocFromFrmHeapEx
NNS_FndAllocFromFrmHeapEx: ; 0x020B5738
	stmdb sp!, {r3, lr}
	cmp r1, #0
	moveq r1, #1
	add r1, r1, #3
	cmp r2, #0
	bic r1, r1, #3
	add r0, r0, #0x24
	blt _020B5760
	bl AllocFromHead__FrameHeap
	ldmia sp!, {r3, pc}
_020B5760:
	rsb r2, r2, #0
	bl AllocFromTail__FrameHeap
	ldmia sp!, {r3, pc}
	arm_func_end NNS_FndAllocFromFrmHeapEx

	arm_func_start NNS_FndFreeToFrmHeap
NNS_FndFreeToFrmHeap: ; 0x020B576C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	tst r4, #1
	beq _020B5784
	bl FreeHead__FrameHeap
_020B5784:
	tst r4, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	bl FreeTail__FrameHeap
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNS_FndFreeToFrmHeap

	arm_func_start NNS_FndGetAllocatableSizeForFrmHeapEx
NNS_FndGetAllocatableSizeForFrmHeapEx: ; 0x020B5798
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	bl abs
	sub r1, r0, #1
	ldr r0, [r4, #0x24]
	mvn r2, r1
	add r0, r1, r0
	ldr r1, [r4, #0x28]
	and r0, r2, r0
	cmp r0, r1
	movhi r0, #0
	subls r0, r1, r0
	ldmia sp!, {r4, pc}
	arm_func_end NNS_FndGetAllocatableSizeForFrmHeapEx

	arm_func_start NNS_FndRecordStateForFrmHeap
NNS_FndRecordStateForFrmHeap: ; 0x020B57D0
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #0x24]
	mov r5, r1
	add r0, r6, #0x24
	mov r1, #0x10
	mov r2, #4
	bl AllocFromHead__FrameHeap
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	str r5, [r0]
	str r4, [r0, #4]
	ldr r1, [r6, #0x28]
	str r1, [r0, #8]
	ldr r1, [r6, #0x2c]
	str r1, [r0, #0xc]
	str r0, [r6, #0x2c]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_FndRecordStateForFrmHeap

	arm_func_start NNS_FndFreeByStateToFrmHeap
NNS_FndFreeByStateToFrmHeap: ; 0x020B5820
	ldr r3, [r0, #0x2c]
	cmp r1, #0
	cmpne r3, #0
	beq _020B5844
_020B5830:
	ldr r2, [r3]
	cmp r2, r1
	ldrne r3, [r3, #0xc]
	cmpne r3, #0
	bne _020B5830
_020B5844:
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	ldr r1, [r3, #4]
	str r1, [r0, #0x24]
	ldr r1, [r3, #8]
	str r1, [r0, #0x28]
	ldr r1, [r3, #0xc]
	str r1, [r0, #0x2c]
	mov r0, #1
	bx lr
	arm_func_end NNS_FndFreeByStateToFrmHeap

	arm_func_start PopMBlock__UnitHeap
PopMBlock__UnitHeap: ; 0x020B5870
	ldr r2, [r0]
	cmp r2, #0
	ldrne r1, [r2]
	strne r1, [r0]
	mov r0, r2
	bx lr
	arm_func_end PopMBlock__UnitHeap

	arm_func_start NNS_FndAllocFromUnitHeap
NNS_FndAllocFromUnitHeap: ; 0x020B5888
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	add r0, r5, #0x24
	bl PopMBlock__UnitHeap
	movs r4, r0
	beq _020B58C0
	ldr r0, [r5, #0x20]
	ldr r2, [r5, #0x28]
	and r0, r0, #0xff
	tst r0, #1
	beq _020B58C0
	mov r1, r4
	mov r0, #0
	bl MIi_CpuClear32
_020B58C0:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNS_FndAllocFromUnitHeap

	arm_func_start NNS_FndFreeToUnitHeap
NNS_FndFreeToUnitHeap: ; 0x020B58C8
	ldr r2, [r0, #0x24]
	str r2, [r1]
	str r1, [r0, #0x24]
	bx lr
	arm_func_end NNS_FndFreeToUnitHeap

	arm_func_start AllocatorAllocForExpHeap
AllocatorAllocForExpHeap: ; 0x020B58D8
	ldr ip, _020B58E8 ; =NNS_FndAllocFromExpHeapEx
	mov r2, r0
	ldmib r2, {r0, r2}
	bx ip
	.align 2, 0
_020B58E8: .word NNS_FndAllocFromExpHeapEx
	arm_func_end AllocatorAllocForExpHeap

	arm_func_start AllocatorFreeForExpHeap
AllocatorFreeForExpHeap: ; 0x020B58EC
	ldr ip, _020B58F8 ; =NNS_FndFreeToExpHeap
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_020B58F8: .word NNS_FndFreeToExpHeap
	arm_func_end AllocatorFreeForExpHeap

	arm_func_start AllocatorAllocForFrmHeap
AllocatorAllocForFrmHeap: ; 0x020B58FC
	ldr ip, _020B590C ; =NNS_FndAllocFromFrmHeapEx
	mov r2, r0
	ldmib r2, {r0, r2}
	bx ip
	.align 2, 0
_020B590C: .word NNS_FndAllocFromFrmHeapEx
	arm_func_end AllocatorAllocForFrmHeap

	arm_func_start AllocatorFreeForFrmHeap
AllocatorFreeForFrmHeap: ; 0x020B5910
	bx lr
	arm_func_end AllocatorFreeForFrmHeap

	arm_func_start AllocatorAllocForUnitHeap
AllocatorAllocForUnitHeap: ; 0x020B5914
	stmdb sp!, {r3, lr}
	ldr r0, [r0, #4]
	ldr r2, [r0, #0x28]
	cmp r1, r2
	movhi r0, #0
	ldmhiia sp!, {r3, pc}
	bl NNS_FndAllocFromUnitHeap
	ldmia sp!, {r3, pc}
	arm_func_end AllocatorAllocForUnitHeap

	arm_func_start AllocatorFreeForUnitHeap
AllocatorFreeForUnitHeap: ; 0x020B5934
	ldr ip, _020B5940 ; =NNS_FndFreeToUnitHeap
	ldr r0, [r0, #4]
	bx ip
	.align 2, 0
_020B5940: .word NNS_FndFreeToUnitHeap
	arm_func_end AllocatorFreeForUnitHeap

	arm_func_start AllocatorAllocForSDKHeap
AllocatorAllocForSDKHeap: ; 0x020B5944
	ldr ip, _020B595C ; =OS_AllocFromHeap
	mov r3, r0
	mov r2, r1
	ldr r0, [r3, #8]
	ldr r1, [r3, #4]
	bx ip
	.align 2, 0
_020B595C: .word OS_AllocFromHeap
	arm_func_end AllocatorAllocForSDKHeap

	arm_func_start AllocatorFreeForSDKHeap
AllocatorFreeForSDKHeap: ; 0x020B5960
	ldr ip, _020B5978 ; =OS_FreeToHeap
	mov r3, r0
	mov r2, r1
	ldr r0, [r3, #8]
	ldr r1, [r3, #4]
	bx ip
	.align 2, 0
_020B5978: .word OS_FreeToHeap
	arm_func_end AllocatorFreeForSDKHeap

	arm_func_start NNS_FndAllocFromAllocator
NNS_FndAllocFromAllocator: ; 0x020B597C
	stmdb sp!, {r3, lr}
	ldr r2, [r0]
	ldr r2, [r2]
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end NNS_FndAllocFromAllocator

	arm_func_start NNS_FndFreeToAllocator
NNS_FndFreeToAllocator: ; 0x020B5990
	stmdb sp!, {r3, lr}
	ldr r2, [r0]
	ldr r2, [r2, #4]
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end NNS_FndFreeToAllocator

	arm_func_start NNS_FndInitAllocatorForExpHeap
NNS_FndInitAllocatorForExpHeap: ; 0x020B59A4
	ldr ip, _020B59B8 ; =_02109200
	mov r3, #0
	str ip, [r0]
	stmib r0, {r1, r2, r3}
	bx lr
	.align 2, 0
_020B59B8: .word _02109200
	arm_func_end NNS_FndInitAllocatorForExpHeap

	arm_func_start AllocTexVram_
AllocTexVram_: ; 0x020B59BC
	mov r0, #0
	bx lr
	arm_func_end AllocTexVram_

	arm_func_start FreeTexVram_
FreeTexVram_: ; 0x020B59C4
	mvn r0, #0
	bx lr
	arm_func_end FreeTexVram_

	arm_func_start AllocPlttVram_
AllocPlttVram_: ; 0x020B59CC
	mov r0, #0
	bx lr
	arm_func_end AllocPlttVram_

	arm_func_start FreePlttVram_
FreePlttVram_: ; 0x020B59D4
	mvn r0, #0
	bx lr
	arm_func_end FreePlttVram_

	arm_func_start NNSi_GfdSetTexNrmSearchArray
NNSi_GfdSetTexNrmSearchArray: ; 0x020B59DC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _020B5A1C ; =_02110950
	mov ip, #0x18
	mla r6, r0, ip, r5
	ldr lr, [sp, #0x10]
	ldr r0, _020B5A20 ; =_02110934
	mla r4, r1, ip, r5
	str r6, [r0, #8]
	mla r1, r2, ip, r5
	str r4, [r0, #0xc]
	mla r2, r3, ip, r5
	str r1, [r0, #0x10]
	mla r1, lr, ip, r5
	str r2, [r0, #0x14]
	str r1, [r0, #0x18]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B5A1C: .word _02110950
_020B5A20: .word _02110934
	arm_func_end NNSi_GfdSetTexNrmSearchArray

	arm_func_start NNS_GfdInitFrmTexVramManager
NNS_GfdInitFrmTexVramManager: ; 0x020B5A24
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	cmp r5, #2
	mov ip, #1
	mov r0, #4
	mov r1, #3
	bhi _020B5A58
	mov r2, #2
	mov r3, #0
	str ip, [sp]
	bl NNSi_GfdSetTexNrmSearchArray
	b _020B5A68
_020B5A58:
	mov r2, #0
	mov r3, #2
	str ip, [sp]
	bl NNSi_GfdSetTexNrmSearchArray
_020B5A68:
	ldr r0, _020B5A98 ; =_021D84C0
	strh r5, [r0]
	bl NNS_GfdResetFrmTexVramState
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, _020B5A9C ; =NNS_GfdAllocFrmTexVram
	ldr r1, _020B5AA0 ; =NNS_GfdDefaultFuncAllocTexVram
	ldr r2, _020B5AA4 ; =NNS_GfdFreeFrmTexVram
	ldr r0, _020B5AA8 ; =NNS_GfdDefaultFuncFreeTexVram
	str r3, [r1]
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B5A98: .word _021D84C0
_020B5A9C: .word NNS_GfdAllocFrmTexVram
_020B5AA0: .word NNS_GfdDefaultFuncAllocTexVram
_020B5AA4: .word NNS_GfdFreeFrmTexVram
_020B5AA8: .word NNS_GfdDefaultFuncFreeTexVram
	arm_func_end NNS_GfdInitFrmTexVramManager

	arm_func_start NNS_GfdResetFrmTexVramState
NNS_GfdResetFrmTexVramState: ; 0x020B5AAC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _020B5B18 ; =_021D84C0
	mov r5, #0
	ldrh r7, [r0]
	ldr r6, _020B5B1C ; =_02110950
	mov lr, r5
	cmp r7, #1
	addhi r7, r7, #1
	mov r4, #1
	mov r1, r5
	mov r0, #0x20000
	mov r3, r5
	mov r2, #0x10000
_020B5AE0:
	cmp r5, r7
	strlt r4, [r6, #8]
	strge lr, [r6, #8]
	ldr ip, [r6, #0xc]
	add r5, r5, #1
	cmp ip, #0
	strne r3, [r6]
	strne r2, [r6, #4]
	streq r1, [r6]
	streq r0, [r6, #4]
	cmp r5, #5
	add r6, r6, #0x18
	blt _020B5AE0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B5B18: .word _021D84C0
_020B5B1C: .word _02110950
	arm_func_end NNS_GfdResetFrmTexVramState

	arm_func_start NNS_GfdAllocFrmTexVram
NNS_GfdAllocFrmTexVram: ; 0x020B5B20
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	cmp r0, #0
	moveq r3, #0x10
	addne r0, r0, #0xf
	bicne r3, r0, #0xf
	ldr r0, _020B5C7C ; =0x0007FFF0
	cmp r3, r0
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r1, #0
	beq _020B5C04
	mov r4, #0
	ldr r8, _020B5C80 ; =_02110980
	ldr sb, _020B5C84 ; =_02110968
	ldr r0, _020B5C88 ; =_02110934
	mov r7, r4
_020B5B60:
	ldr lr, [r0, r4, lsl #2]
	ldr r5, [lr, #8]
	cmp r5, #0
	beq _020B5BF0
	ldmia lr, {r5, r6}
	sub r5, r6, r5
	cmp r5, r3
	blo _020B5BF0
	ldrh r5, [lr, #0x10]
	cmp r5, #0
	beq _020B5B98
	cmp r5, #3
	beq _020B5BA0
	b _020B5BA8
_020B5B98:
	mov ip, sb
	b _020B5BAC
_020B5BA0:
	mov ip, r8
	b _020B5BAC
_020B5BA8:
	mov ip, r7
_020B5BAC:
	ldr r5, [ip, #8]
	cmp r5, #0
	beq _020B5BF0
	ldmia ip, {r5, r6}
	sub r5, r6, r5
	cmp r5, r3, lsr #1
	blo _020B5BF0
	ldr r4, [lr]
	mov r0, #1
	add r2, r4, r3
	str r2, [lr]
	ldr r2, [ip]
	add r2, r2, r3, lsr #1
	str r2, [ip]
	ldr r2, [lr, #0x14]
	add r2, r4, r2
	b _020B5C58
_020B5BF0:
	add r4, r4, #1
	cmp r4, #2
	blt _020B5B60
	mov r0, #0
	b _020B5C58
_020B5C04:
	ldr lr, _020B5C8C ; =_0211093C
	mov r5, #0
_020B5C0C:
	ldr ip, [lr, r5, lsl #2]
	ldr r0, [ip, #8]
	cmp r0, #0
	beq _020B5C48
	ldmia ip, {r0, r4}
	sub r0, r4, r0
	cmp r0, r3
	blo _020B5C48
	ldr r2, [ip, #4]
	mov r0, #1
	sub r4, r2, r3
	str r4, [ip, #4]
	ldr r2, [ip, #0x14]
	add r2, r4, r2
	b _020B5C58
_020B5C48:
	add r5, r5, #1
	cmp r5, #5
	blt _020B5C0C
	mov r0, #0
_020B5C58:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r2, lsl #0xd
	mov r2, r3, lsr #4
	mov r0, r0, lsr #0x10
	orr r0, r0, r2, lsl #16
	orr r0, r0, r1, lsl #31
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020B5C7C: .word 0x0007FFF0
_020B5C80: .word _02110980
_020B5C84: .word _02110968
_020B5C88: .word _02110934
_020B5C8C: .word _0211093C
	arm_func_end NNS_GfdAllocFrmTexVram

	arm_func_start NNS_GfdFreeFrmTexVram
NNS_GfdFreeFrmTexVram: ; 0x020B5C90
	mov r0, #0
	bx lr
	arm_func_end NNS_GfdFreeFrmTexVram

	arm_func_start NNS_GfdGetFrmTexVramState
NNS_GfdGetFrmTexVramState: ; 0x020B5C98
	stmdb sp!, {r3, lr}
	mov r3, #0
	ldr ip, _020B5CD4 ; =_02110950
	mov lr, r3
_020B5CA8:
	ldr r1, [ip]
	add r3, r3, #1
	str r1, [r0, lr, lsl #2]
	ldr r2, [ip, #4]
	add r1, r0, lr, lsl #2
	str r2, [r1, #4]
	cmp r3, #5
	add ip, ip, #0x18
	add lr, lr, #2
	blt _020B5CA8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B5CD4: .word _02110950
	arm_func_end NNS_GfdGetFrmTexVramState

	arm_func_start NNS_GfdSetFrmTexVramState
NNS_GfdSetFrmTexVramState: ; 0x020B5CD8
	stmdb sp!, {r3, lr}
	mov r3, #0
	ldr lr, _020B5D14 ; =_02110950
	mov ip, r3
_020B5CE8:
	ldr r2, [r0, ip, lsl #2]
	add r1, r0, ip, lsl #2
	str r2, [lr]
	ldr r1, [r1, #4]
	add r3, r3, #1
	str r1, [lr, #4]
	cmp r3, #5
	add ip, ip, #2
	add lr, lr, #0x18
	blt _020B5CE8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B5D14: .word _02110950
	arm_func_end NNS_GfdSetFrmTexVramState

	arm_func_start NNS_GfdInitFrmPlttVramManager
NNS_GfdInitFrmPlttVramManager: ; 0x020B5D18
	stmdb sp!, {r4, lr}
	ldr r2, _020B5D50 ; =_021D84C4
	mov r4, r1
	str r0, [r2, #8]
	bl NNS_GfdResetFrmPlttVramState
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, _020B5D54 ; =NNS_GfdAllocFrmPlttVram
	ldr r1, _020B5D58 ; =NNS_GfdDefaultFuncAllocPlttVram
	ldr r2, _020B5D5C ; =NNS_GfdFreeFrmPlttVram
	ldr r0, _020B5D60 ; =NNS_GfdDefaultFuncFreePlttVram
	str r3, [r1]
	str r2, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B5D50: .word _021D84C4
_020B5D54: .word NNS_GfdAllocFrmPlttVram
_020B5D58: .word NNS_GfdDefaultFuncAllocPlttVram
_020B5D5C: .word NNS_GfdFreeFrmPlttVram
_020B5D60: .word NNS_GfdDefaultFuncFreePlttVram
	arm_func_end NNS_GfdInitFrmPlttVramManager

	arm_func_start NNS_GfdAllocFrmPlttVram
NNS_GfdAllocFrmPlttVram: ; 0x020B5D64
	stmdb sp!, {r4, lr}
	cmp r0, #0
	moveq r0, #8
	addne r0, r0, #7
	ldr ip, _020B5E98 ; =0x0007FFF8
	bicne r0, r0, #7
	cmp r0, ip
	mov r3, #0
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	cmp r2, #1
	bne _020B5E10
	ldr r2, _020B5E9C ; =_021D84C4
	cmp r1, #0
	ldr lr, [r2]
	andeq r2, lr, #0xf
	rsbeq r2, r2, #0x10
	andeq r4, r2, #0xf
	beq _020B5DBC
	and r2, lr, #7
	rsb r2, r2, #8
	and r4, r2, #7
_020B5DBC:
	ldr r2, _020B5E9C ; =_021D84C4
	add ip, r0, r4
	ldr r2, [r2, #4]
	sub r2, r2, lr
	cmp r2, ip
	blo _020B5E08
	cmp r1, #0
	add r1, lr, ip
	beq _020B5DEC
	cmp r1, #0x10000
	movhi lr, #0
	bhi _020B5E78
_020B5DEC:
	ldr r1, _020B5E9C ; =_021D84C4
	add r3, lr, r4
	ldr r2, [r1]
	mov lr, #1
	add r2, r2, ip
	str r2, [r1]
	b _020B5E78
_020B5E08:
	mov lr, #0
	b _020B5E78
_020B5E10:
	ldr r2, _020B5E9C ; =_021D84C4
	ldr lr, [r2, #4]
	cmp lr, r0
	blo _020B5E74
	sub r2, lr, r0
	cmp r1, #0
	andne r4, r2, #7
	andeq r4, r2, #0xf
	ldr r2, _020B5E9C ; =_021D84C4
	add ip, r0, r4
	ldr r2, [r2]
	sub r2, lr, r2
	cmp r2, ip
	blo _020B5E74
	cmp r1, #0
	beq _020B5E5C
	cmp lr, #0x10000
	movhi lr, #0
	bhi _020B5E78
_020B5E5C:
	ldr r1, _020B5E9C ; =_021D84C4
	mov lr, #1
	ldr r2, [r1, #4]
	sub r3, r2, ip
	str r3, [r1, #4]
	b _020B5E78
_020B5E74:
	mov lr, #0
_020B5E78:
	cmp lr, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, r3, lsl #0xd
	mov r2, r0, lsr #3
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B5E98: .word 0x0007FFF8
_020B5E9C: .word _021D84C4
	arm_func_end NNS_GfdAllocFrmPlttVram

	arm_func_start NNS_GfdFreeFrmPlttVram
NNS_GfdFreeFrmPlttVram: ; 0x020B5EA0
	mov r0, #0
	bx lr
	arm_func_end NNS_GfdFreeFrmPlttVram

	arm_func_start NNS_GfdGetFrmPlttVramState
NNS_GfdGetFrmPlttVramState: ; 0x020B5EA8
	ldr r1, _020B5EC0 ; =_021D84C4
	ldr r2, [r1]
	str r2, [r0]
	ldr r1, [r1, #4]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_020B5EC0: .word _021D84C4
	arm_func_end NNS_GfdGetFrmPlttVramState

	arm_func_start NNS_GfdSetFrmPlttVramState
NNS_GfdSetFrmPlttVramState: ; 0x020B5EC4
	ldr r2, [r0]
	ldr r1, _020B5EDC ; =_021D84C4
	str r2, [r1]
	ldr r0, [r0, #4]
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_020B5EDC: .word _021D84C4
	arm_func_end NNS_GfdSetFrmPlttVramState

	arm_func_start NNS_GfdResetFrmPlttVramState
NNS_GfdResetFrmPlttVramState: ; 0x020B5EE0
	ldr r0, _020B5EF8 ; =_021D84C4
	mov r1, #0
	str r1, [r0]
	ldr r1, [r0, #8]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_020B5EF8: .word _021D84C4
	arm_func_end NNS_GfdResetFrmPlttVramState

	arm_func_start GetNextIndex_
GetNextIndex_: ; 0x020B5EFC
	stmdb sp!, {r3, lr}
	mov r2, r0
	add r0, r1, #1
	ldr r1, [r2, #4]
	bl _u32_div_f
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x10
	ldmia sp!, {r3, pc}
	arm_func_end GetNextIndex_

	arm_func_start IsVramTransferTaskQueueFull_
IsVramTransferTaskQueueFull_: ; 0x020B5F1C
	ldrh r1, [r0, #0xc]
	ldr r0, [r0, #4]
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end IsVramTransferTaskQueueFull_

	arm_func_start IsVramTransferTaskQueueEmpty_
IsVramTransferTaskQueueEmpty_: ; 0x020B5F34
	ldrh r0, [r0, #0xc]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end IsVramTransferTaskQueueEmpty_

	arm_func_start DoTransfer3dTex
DoTransfer3dTex: ; 0x020B5F48
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl GX_BeginLoadTex
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl GX_LoadTex
	bl GX_EndLoadTex
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DoTransfer3dTex

	arm_func_start DoTransfer3dTexPltt
DoTransfer3dTexPltt: ; 0x020B5F74
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl GX_BeginLoadTexPltt
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl GX_LoadTexPltt
	bl GX_EndLoadTexPltt
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DoTransfer3dTexPltt

	arm_func_start DoTransfer3dClearImageColor
DoTransfer3dClearImageColor: ; 0x020B5FA0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	bl GX_BeginLoadClearImage
	mov r0, r5
	mov r1, r4
	bl GX_LoadClearImageColor
	bl GX_EndLoadClearImage
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DoTransfer3dClearImageColor

	arm_func_start DoTransfer3dClearImageDepth
DoTransfer3dClearImageDepth: ; 0x020B5FC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	bl GX_BeginLoadClearImage
	mov r0, r5
	mov r1, r4
	bl GX_LoadClearImageDepth
	bl GX_EndLoadClearImage
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end DoTransfer3dClearImageDepth

	arm_func_start DoTransfer2dBG0CharMain
DoTransfer2dBG0CharMain: ; 0x020B5FE8
	ldr ip, _020B5FF0 ; =GX_LoadBG0Char
	bx ip
	.align 2, 0
_020B5FF0: .word GX_LoadBG0Char
	arm_func_end DoTransfer2dBG0CharMain

	arm_func_start DoTransfer2dBG1CharMain
DoTransfer2dBG1CharMain: ; 0x020B5FF4
	ldr ip, _020B5FFC ; =GX_LoadBG1Char
	bx ip
	.align 2, 0
_020B5FFC: .word GX_LoadBG1Char
	arm_func_end DoTransfer2dBG1CharMain

	arm_func_start DoTransfer2dBG2CharMain
DoTransfer2dBG2CharMain: ; 0x020B6000
	ldr ip, _020B6008 ; =GX_LoadBG2Char
	bx ip
	.align 2, 0
_020B6008: .word GX_LoadBG2Char
	arm_func_end DoTransfer2dBG2CharMain

	arm_func_start DoTransfer2dBG3CharMain
DoTransfer2dBG3CharMain: ; 0x020B600C
	ldr ip, _020B6014 ; =GX_LoadBG3Char
	bx ip
	.align 2, 0
_020B6014: .word GX_LoadBG3Char
	arm_func_end DoTransfer2dBG3CharMain

	arm_func_start DoTransfer2dBG0ScrMain
DoTransfer2dBG0ScrMain: ; 0x020B6018
	ldr ip, _020B6020 ; =GX_LoadBG0Scr
	bx ip
	.align 2, 0
_020B6020: .word GX_LoadBG0Scr
	arm_func_end DoTransfer2dBG0ScrMain

	arm_func_start DoTransfer2dBG1ScrMain
DoTransfer2dBG1ScrMain: ; 0x020B6024
	ldr ip, _020B602C ; =GX_LoadBG1Scr
	bx ip
	.align 2, 0
_020B602C: .word GX_LoadBG1Scr
	arm_func_end DoTransfer2dBG1ScrMain

	arm_func_start DoTransfer2dBG2ScrMain
DoTransfer2dBG2ScrMain: ; 0x020B6030
	ldr ip, _020B6038 ; =GX_LoadBG2Scr
	bx ip
	.align 2, 0
_020B6038: .word GX_LoadBG2Scr
	arm_func_end DoTransfer2dBG2ScrMain

	arm_func_start DoTransfer2dBG3ScrMain
DoTransfer2dBG3ScrMain: ; 0x020B603C
	ldr ip, _020B6044 ; =GX_LoadBG3Scr
	bx ip
	.align 2, 0
_020B6044: .word GX_LoadBG3Scr
	arm_func_end DoTransfer2dBG3ScrMain

	arm_func_start DoTransfer2dBG2BmpMain
DoTransfer2dBG2BmpMain: ; 0x020B6048
	ldr ip, _020B6050 ; =GX_LoadBG2Scr
	bx ip
	.align 2, 0
_020B6050: .word GX_LoadBG2Scr
	arm_func_end DoTransfer2dBG2BmpMain

	arm_func_start DoTransfer2dBG3BmpMain
DoTransfer2dBG3BmpMain: ; 0x020B6054
	ldr ip, _020B605C ; =GX_LoadBG3Scr
	bx ip
	.align 2, 0
_020B605C: .word GX_LoadBG3Scr
	arm_func_end DoTransfer2dBG3BmpMain

	arm_func_start DoTransfer2dObjPlttMain
DoTransfer2dObjPlttMain: ; 0x020B6060
	ldr ip, _020B6068 ; =GX_LoadOBJPltt
	bx ip
	.align 2, 0
_020B6068: .word GX_LoadOBJPltt
	arm_func_end DoTransfer2dObjPlttMain

	arm_func_start DoTransfer2dBGPlttMain
DoTransfer2dBGPlttMain: ; 0x020B606C
	ldr ip, _020B6074 ; =GX_LoadBGPltt
	bx ip
	.align 2, 0
_020B6074: .word GX_LoadBGPltt
	arm_func_end DoTransfer2dBGPlttMain

	arm_func_start DoTransfer2dObjExtPlttMain
DoTransfer2dObjExtPlttMain: ; 0x020B6078
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl GX_BeginLoadOBJExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl GX_LoadOBJExtPltt
	bl GX_EndLoadOBJExtPltt
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DoTransfer2dObjExtPlttMain

	arm_func_start DoTransfer2dBGExtPlttMain
DoTransfer2dBGExtPlttMain: ; 0x020B60A4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl GX_BeginLoadBGExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DoTransfer2dBGExtPlttMain

	arm_func_start DoTransfer2dObjOamMain
DoTransfer2dObjOamMain: ; 0x020B60D0
	ldr ip, _020B60D8 ; =GX_LoadOAM
	bx ip
	.align 2, 0
_020B60D8: .word GX_LoadOAM
	arm_func_end DoTransfer2dObjOamMain

	arm_func_start DoTransfer2dObjCharMain
DoTransfer2dObjCharMain: ; 0x020B60DC
	ldr ip, _020B60E4 ; =GX_LoadOBJ
	bx ip
	.align 2, 0
_020B60E4: .word GX_LoadOBJ
	arm_func_end DoTransfer2dObjCharMain

	arm_func_start DoTransfer2dBG0CharSub
DoTransfer2dBG0CharSub: ; 0x020B60E8
	ldr ip, _020B60F0 ; =GXS_LoadBG0Char
	bx ip
	.align 2, 0
_020B60F0: .word GXS_LoadBG0Char
	arm_func_end DoTransfer2dBG0CharSub

	arm_func_start DoTransfer2dBG1CharSub
DoTransfer2dBG1CharSub: ; 0x020B60F4
	ldr ip, _020B60FC ; =GXS_LoadBG1Char
	bx ip
	.align 2, 0
_020B60FC: .word GXS_LoadBG1Char
	arm_func_end DoTransfer2dBG1CharSub

	arm_func_start DoTransfer2dBG2CharSub
DoTransfer2dBG2CharSub: ; 0x020B6100
	ldr ip, _020B6108 ; =GXS_LoadBG2Char
	bx ip
	.align 2, 0
_020B6108: .word GXS_LoadBG2Char
	arm_func_end DoTransfer2dBG2CharSub

	arm_func_start DoTransfer2dBG3CharSub
DoTransfer2dBG3CharSub: ; 0x020B610C
	ldr ip, _020B6114 ; =GXS_LoadBG3Char
	bx ip
	.align 2, 0
_020B6114: .word GXS_LoadBG3Char
	arm_func_end DoTransfer2dBG3CharSub

	arm_func_start DoTransfer2dBG0ScrSub
DoTransfer2dBG0ScrSub: ; 0x020B6118
	ldr ip, _020B6120 ; =GXS_LoadBG0Scr
	bx ip
	.align 2, 0
_020B6120: .word GXS_LoadBG0Scr
	arm_func_end DoTransfer2dBG0ScrSub

	arm_func_start DoTransfer2dBG1ScrSub
DoTransfer2dBG1ScrSub: ; 0x020B6124
	ldr ip, _020B612C ; =GXS_LoadBG1Scr
	bx ip
	.align 2, 0
_020B612C: .word GXS_LoadBG1Scr
	arm_func_end DoTransfer2dBG1ScrSub

	arm_func_start DoTransfer2dBG2ScrSub
DoTransfer2dBG2ScrSub: ; 0x020B6130
	ldr ip, _020B6138 ; =GXS_LoadBG2Scr
	bx ip
	.align 2, 0
_020B6138: .word GXS_LoadBG2Scr
	arm_func_end DoTransfer2dBG2ScrSub

	arm_func_start DoTransfer2dBG3ScrSub
DoTransfer2dBG3ScrSub: ; 0x020B613C
	ldr ip, _020B6144 ; =GXS_LoadBG3Scr
	bx ip
	.align 2, 0
_020B6144: .word GXS_LoadBG3Scr
	arm_func_end DoTransfer2dBG3ScrSub

	arm_func_start DoTransfer2dBG2BmpSub
DoTransfer2dBG2BmpSub: ; 0x020B6148
	ldr ip, _020B6150 ; =GXS_LoadBG2Scr
	bx ip
	.align 2, 0
_020B6150: .word GXS_LoadBG2Scr
	arm_func_end DoTransfer2dBG2BmpSub

	arm_func_start DoTransfer2dBG3BmpSub
DoTransfer2dBG3BmpSub: ; 0x020B6154
	ldr ip, _020B615C ; =GXS_LoadBG3Scr
	bx ip
	.align 2, 0
_020B615C: .word GXS_LoadBG3Scr
	arm_func_end DoTransfer2dBG3BmpSub

	arm_func_start DoTransfer2dObjPlttSub
DoTransfer2dObjPlttSub: ; 0x020B6160
	ldr ip, _020B6168 ; =GXS_LoadOBJPltt
	bx ip
	.align 2, 0
_020B6168: .word GXS_LoadOBJPltt
	arm_func_end DoTransfer2dObjPlttSub

	arm_func_start DoTransfer2dBGPlttSub
DoTransfer2dBGPlttSub: ; 0x020B616C
	ldr ip, _020B6174 ; =GXS_LoadBGPltt
	bx ip
	.align 2, 0
_020B6174: .word GXS_LoadBGPltt
	arm_func_end DoTransfer2dBGPlttSub

	arm_func_start DoTransfer2dObjExtPlttSub
DoTransfer2dObjExtPlttSub: ; 0x020B6178
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl GXS_BeginLoadOBJExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl GXS_LoadOBJExtPltt
	bl GXS_EndLoadOBJExtPltt
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DoTransfer2dObjExtPlttSub

	arm_func_start DoTransfer2dBGExtPlttSub
DoTransfer2dBGExtPlttSub: ; 0x020B61A4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl GXS_BeginLoadBGExtPltt
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl GXS_LoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end DoTransfer2dBGExtPlttSub

	arm_func_start DoTransfer2dObjOamSub
DoTransfer2dObjOamSub: ; 0x020B61D0
	ldr ip, _020B61D8 ; =GXS_LoadOAM
	bx ip
	.align 2, 0
_020B61D8: .word GXS_LoadOAM
	arm_func_end DoTransfer2dObjOamSub

	arm_func_start DoTransfer2dObjCharSub
DoTransfer2dObjCharSub: ; 0x020B61DC
	ldr ip, _020B61E4 ; =GXS_LoadOBJ
	bx ip
	.align 2, 0
_020B61E4: .word GXS_LoadOBJ
	arm_func_end DoTransfer2dObjCharSub

	arm_func_start DoTransfer_
DoTransfer_: ; 0x020B61E8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r3, [r5]
	ldr r2, _020B6214 ; =_02109210
	ldr r0, [r5, #4]
	ldr r1, [r5, #0xc]
	ldr r4, [r2, r3, lsl #2]
	bl DC_FlushRange
	ldmib r5, {r0, r1, r2}
	blx r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B6214: .word _02109210
	arm_func_end DoTransfer_

	arm_func_start ResetTaskQueue_
ResetTaskQueue_: ; 0x020B6218
	mov r1, #0
	strh r1, [r0, #0xa]
	strh r1, [r0, #8]
	strh r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end ResetTaskQueue_

	arm_func_start NNSi_GfdPushVramTransferTaskQueue
NNSi_GfdPushVramTransferTaskQueue: ; 0x020B6230
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsVramTransferTaskQueueFull_
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldrh r1, [r4, #0xa]
	mov r0, r4
	bl GetNextIndex_
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #0xc]
	mov r0, #1
	add r1, r1, #1
	strh r1, [r4, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end NNSi_GfdPushVramTransferTaskQueue

	arm_func_start NNSi_GfdGetFrontVramTransferTaskQueue
NNSi_GfdGetFrontVramTransferTaskQueue: ; 0x020B626C
	ldrh r1, [r0, #8]
	ldr r0, [r0]
	add r0, r0, r1, lsl #4
	bx lr
	arm_func_end NNSi_GfdGetFrontVramTransferTaskQueue

	arm_func_start NNSi_GfdGetEndVramTransferTaskQueue
NNSi_GfdGetEndVramTransferTaskQueue: ; 0x020B627C
	ldrh r1, [r0, #0xa]
	ldr r0, [r0]
	add r0, r0, r1, lsl #4
	bx lr
	arm_func_end NNSi_GfdGetEndVramTransferTaskQueue

	arm_func_start NNSi_GfdPopVramTransferTaskQueue
NNSi_GfdPopVramTransferTaskQueue: ; 0x020B628C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl IsVramTransferTaskQueueEmpty_
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldrh r1, [r4, #8]
	mov r0, r4
	bl GetNextIndex_
	strh r0, [r4, #8]
	ldrh r1, [r4, #0xc]
	mov r0, #1
	sub r1, r1, #1
	strh r1, [r4, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end NNSi_GfdPopVramTransferTaskQueue

	arm_func_start NNS_GfdInitVramTransferManager
NNS_GfdInitVramTransferManager: ; 0x020B62C8
	ldr r2, _020B62E0 ; =_021D84D0
	ldr ip, _020B62E4 ; =ResetTaskQueue_
	str r0, [r2]
	ldr r0, _020B62E8 ; =_021D84D0
	str r1, [r2, #4]
	bx ip
	.align 2, 0
_020B62E0: .word _021D84D0
_020B62E4: .word ResetTaskQueue_
_020B62E8: .word _021D84D0
	arm_func_end NNS_GfdInitVramTransferManager

	arm_func_start NNS_GfdDoVramTransfer
NNS_GfdDoVramTransfer: ; 0x020B62EC
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020B6348 ; =_021D84D0
	mov r0, r4
	bl NNSi_GfdGetFrontVramTransferTaskQueue
	mov r5, r0
	mov r0, r4
	bl NNSi_GfdPopVramTransferTaskQueue
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_020B6310:
	mov r0, r5
	bl DoTransfer_
	ldr r2, [r4, #0x10]
	ldr r1, [r5, #0xc]
	mov r0, r4
	sub r1, r2, r1
	str r1, [r4, #0x10]
	bl NNSi_GfdGetFrontVramTransferTaskQueue
	mov r5, r0
	mov r0, r4
	bl NNSi_GfdPopVramTransferTaskQueue
	cmp r0, #0
	bne _020B6310
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B6348: .word _021D84D0
	arm_func_end NNS_GfdDoVramTransfer

	arm_func_start NNS_GfdRegisterNewVramTransferTask
NNS_GfdRegisterNewVramTransferTask: ; 0x020B634C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r5, _020B63B0 ; =_021D84D0
	mov sb, r0
	mov r0, r5
	mov r8, r1
	mov r7, r2
	mov r6, r3
	bl IsVramTransferTaskQueueFull_
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r5
	bl NNSi_GfdGetEndVramTransferTaskQueue
	mov r4, r0
	str sb, [r4]
	stmib r4, {r7, r8}
	mov r0, r5
	str r6, [r4, #0xc]
	bl NNSi_GfdPushVramTransferTaskQueue
	ldr r2, [r5, #0x10]
	ldr r1, [r4, #0xc]
	mov r0, #1
	add r1, r2, r1
	str r1, [r5, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020B63B0: .word _021D84D0
	arm_func_end NNS_GfdRegisterNewVramTransferTask

	arm_func_start TryToMergeBlockRegion_
TryToMergeBlockRegion_: ; 0x020B63B4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r3, [r0]
	mov lr, #0
	cmp r3, #0
	beq _020B6490
	mov r8, lr
	mov r4, lr
_020B63D0:
	ldr r6, [r3]
	ldr r5, [r2, #4]
	ldr ip, [r3, #0xc]
	cmp r6, r5
	bne _020B642C
	ldr r5, [r3, #4]
	orr lr, lr, #1
	add r5, r6, r5
	str r5, [r2, #4]
	ldr r6, [r3, #8]
	ldr r5, [r3, #0xc]
	cmp r6, #0
	strne r5, [r6, #0xc]
	streq r5, [r0]
	cmp r5, #0
	strne r6, [r5, #8]
	ldr r5, [r1]
	cmp r5, #0
	strne r3, [r5, #8]
	ldr r5, [r1]
	str r5, [r3, #0xc]
	str r8, [r3, #8]
	str r3, [r1]
_020B642C:
	ldr r7, [r3]
	ldr r5, [r3, #4]
	ldr r6, [r2]
	add r5, r7, r5
	cmp r6, r5
	bne _020B6484
	str r7, [r2]
	ldr r6, [r3, #8]
	ldr r5, [r3, #0xc]
	cmp r6, #0
	strne r5, [r6, #0xc]
	streq r5, [r0]
	cmp r5, #0
	strne r6, [r5, #8]
	ldr r5, [r1]
	orr lr, lr, #1
	cmp r5, #0
	strne r3, [r5, #8]
	ldr r5, [r1]
	str r5, [r3, #0xc]
	str r4, [r3, #8]
	str r3, [r1]
_020B6484:
	mov r3, ip
	cmp ip, #0
	bne _020B63D0
_020B6490:
	mov r0, lr
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end TryToMergeBlockRegion_

	arm_func_start NNSi_GfdInitLnkVramMan
NNSi_GfdInitLnkVramMan: ; 0x020B6498
	mov r1, #0
	str r1, [r0]
	bx lr
	arm_func_end NNSi_GfdInitLnkVramMan

	arm_func_start NNSi_GfdInitLnkVramBlockPool
NNSi_GfdInitLnkVramBlockPool: ; 0x020B64A4
	stmdb sp!, {r4, lr}
	subs lr, r1, #1
	mov r2, #0
	beq _020B64DC
	mov r4, r0
_020B64B8:
	add r3, r2, #1
	add r2, r0, r2, lsl #4
	add ip, r0, r3, lsl #4
	str ip, [r2, #0xc]
	str r4, [r2, #0x18]
	mov r2, r3
	cmp r3, lr
	add r4, r4, #0x10
	blo _020B64B8
_020B64DC:
	mov r2, #0
	str r2, [r0, #8]
	add r1, r0, r1, lsl #4
	str r2, [r1, #-4]
	ldmia sp!, {r4, pc}
	arm_func_end NNSi_GfdInitLnkVramBlockPool

	arm_func_start NNSi_GfdAddNewFreeBlock
NNSi_GfdAddNewFreeBlock: ; 0x020B64F0
	stmdb sp!, {r3, lr}
	ldr lr, [r1]
	cmp lr, #0
	ldrne ip, [lr, #0xc]
	strne ip, [r1]
	cmp lr, #0
	beq _020B6544
	stmia lr, {r2, r3}
	mov r1, #0
	str r1, [lr, #8]
	str r1, [lr, #0xc]
	ldr r1, [r0]
	cmp r1, #0
	strne lr, [r1, #8]
	ldr r2, [r0]
	mov r1, #0
	str r2, [lr, #0xc]
	str r1, [lr, #8]
	str lr, [r0]
	mov r0, #1
	ldmia sp!, {r3, pc}
_020B6544:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end NNSi_GfdAddNewFreeBlock

	arm_func_start NNSi_GfdAllocLnkVram
NNSi_GfdAllocLnkVram: ; 0x020B654C
	stmdb sp!, {r3, lr}
	mov ip, #0
	str ip, [sp]
	bl NNSi_GfdAllocLnkVramAligned
	ldmia sp!, {r3, pc}
	arm_func_end NNSi_GfdAllocLnkVram

	arm_func_start NNSi_GfdAllocLnkVramAligned
NNSi_GfdAllocLnkVramAligned: ; 0x020B6560
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r7, [r0]
	ldr sb, [sp, #0x28]
	cmp r7, #0
	mov r6, #0
	beq _020B65C8
	sub ip, sb, #1
	mvn r8, ip
	mov fp, r6
_020B6584:
	cmp sb, #1
	ldrls lr, [r7]
	movls r5, fp
	movls r4, r3
	bls _020B65AC
	ldr r5, [r7]
	add r4, r5, ip
	and lr, r8, r4
	sub r5, lr, r5
	add r4, r3, r5
_020B65AC:
	ldr sl, [r7, #4]
	cmp sl, r4
	movhs r6, r7
	bhs _020B65C8
	ldr r7, [r7, #0xc]
	cmp r7, #0
	bne _020B6584
_020B65C8:
	cmp r6, #0
	beq _020B6694
	cmp r5, #0
	beq _020B6628
	ldr r8, [r1]
	cmp r8, #0
	ldrne r3, [r8, #0xc]
	strne r3, [r1]
	cmp r8, #0
	beq _020B6694
	ldr r7, [r6]
	mov r3, #0
	str r7, [r8]
	str r5, [r8, #4]
	str r3, [r8, #8]
	str r3, [r8, #0xc]
	ldr r3, [r0]
	cmp r3, #0
	strne r8, [r3, #8]
	ldr r5, [r0]
	mov r3, #0
	str r5, [r8, #0xc]
	str r3, [r8, #8]
	str r8, [r0]
_020B6628:
	ldr r3, [r6, #4]
	sub r3, r3, r4
	str r3, [r6, #4]
	ldr r3, [r6]
	add r3, r3, r4
	str r3, [r6]
	ldr r3, [r6, #4]
	cmp r3, #0
	bne _020B6688
	ldr r4, [r6, #8]
	ldr r3, [r6, #0xc]
	cmp r4, #0
	strne r3, [r4, #0xc]
	streq r3, [r0]
	cmp r3, #0
	strne r4, [r3, #8]
	ldr r0, [r1]
	cmp r0, #0
	strne r6, [r0, #8]
	ldr r3, [r1]
	mov r0, #0
	str r3, [r6, #0xc]
	str r0, [r6, #8]
	str r6, [r1]
_020B6688:
	str lr, [r2]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B6694:
	mov r0, #0
	str r0, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end NNSi_GfdAllocLnkVramAligned

	arm_func_start NNSi_GfdMergeAllFreeBlocks
NNSi_GfdMergeAllFreeBlocks: ; 0x020B66A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	ldr r5, [r7]
	mov r6, r1
	cmp r5, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r4, sp, #0
_020B66C4:
	ldr r1, [r5]
	mov r0, r7
	str r1, [sp]
	ldr r3, [r5]
	ldr r2, [r5, #4]
	mov r1, r6
	add r3, r3, r2
	mov r2, r4
	str r3, [sp, #4]
	bl TryToMergeBlockRegion_
	cmp r0, #0
	ldreq r5, [r5, #0xc]
	beq _020B6714
	ldr r0, [sp]
	str r0, [r5]
	ldr r1, [sp, #4]
	ldr r0, [sp]
	sub r0, r1, r0
	str r0, [r5, #4]
	ldr r5, [r7]
_020B6714:
	cmp r5, #0
	bne _020B66C4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNSi_GfdMergeAllFreeBlocks

	arm_func_start NNSi_GfdFreeLnkVram
NNSi_GfdFreeLnkVram: ; 0x020B6724
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	add r3, r2, r3
	str r2, [sp]
	add r2, sp, #0
	mov r5, r1
	str r3, [sp, #4]
	mov r4, r0
	bl TryToMergeBlockRegion_
	ldr r3, [r5]
	cmp r3, #0
	ldrne r0, [r3, #0xc]
	strne r0, [r5]
	cmp r3, #0
	addeq sp, sp, #8
	mov r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [sp]
	str r1, [r3]
	ldr r2, [sp, #4]
	ldr r1, [sp]
	sub r1, r2, r1
	str r1, [r3, #4]
	str r0, [r3, #8]
	str r0, [r3, #0xc]
	ldr r0, [r4]
	cmp r0, #0
	strne r3, [r0, #8]
	ldr r1, [r4]
	mov r0, #0
	str r1, [r3, #0xc]
	str r0, [r3, #8]
	str r3, [r4]
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNSi_GfdFreeLnkVram

	arm_func_start NNS_GfdGetLnkTexVramManagerWorkSize
NNS_GfdGetLnkTexVramManagerWorkSize: ; 0x020B67B4
	mov r0, r0, lsl #4
	bx lr
	arm_func_end NNS_GfdGetLnkTexVramManagerWorkSize

	arm_func_start NNS_GfdInitLnkTexVramManager
NNS_GfdInitLnkTexVramManager: ; 0x020B67BC
	stmdb sp!, {r3, lr}
	ldr ip, _020B6800 ; =_021D84E4
	str r0, [ip, #0xc]
	str r1, [ip, #0x10]
	str r2, [ip, #0x14]
	str r3, [ip, #0x18]
	bl NNS_GfdResetLnkTexVramState
	ldr r0, [sp, #8]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r3, _020B6804 ; =NNS_GfdAllocLnkTexVram
	ldr r1, _020B6808 ; =NNS_GfdDefaultFuncAllocTexVram
	ldr r2, _020B680C ; =NNS_GfdFreeLnkTexVram
	ldr r0, _020B6810 ; =NNS_GfdDefaultFuncFreeTexVram
	str r3, [r1]
	str r2, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B6800: .word _021D84E4
_020B6804: .word NNS_GfdAllocLnkTexVram
_020B6808: .word NNS_GfdDefaultFuncAllocTexVram
_020B680C: .word NNS_GfdFreeLnkTexVram
_020B6810: .word NNS_GfdDefaultFuncFreeTexVram
	arm_func_end NNS_GfdInitLnkTexVramManager

	arm_func_start NNS_GfdAllocLnkTexVram
NNS_GfdAllocLnkTexVram: ; 0x020B6814
	stmdb sp!, {r3, r4, r5, lr}
	cmp r0, #0
	moveq r5, #0x10
	addne r0, r0, #0xf
	bicne r5, r0, #0xf
	ldr r0, _020B6894 ; =0x0007FFF0
	mov r4, r1
	cmp r5, r0
	movhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	add r2, sp, #0
	beq _020B685C
	ldr r0, _020B6898 ; =_021D84E8
	ldr r1, _020B689C ; =_021D84EC
	mov r3, r5
	bl NNSi_GfdAllocLnkVram
	b _020B686C
_020B685C:
	ldr r0, _020B68A0 ; =_021D84E4
	ldr r1, _020B689C ; =_021D84EC
	mov r3, r5
	bl NNSi_GfdAllocLnkVram
_020B686C:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [sp]
	mov r1, r5, lsr #4
	mov r0, r0, lsl #0xd
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	orr r0, r0, r4, lsl #31
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B6894: .word 0x0007FFF0
_020B6898: .word _021D84E8
_020B689C: .word _021D84EC
_020B68A0: .word _021D84E4
	arm_func_end NNS_GfdAllocLnkTexVram

	arm_func_start NNS_GfdFreeLnkTexVram
NNS_GfdFreeLnkTexVram: ; 0x020B68A4
	stmdb sp!, {r3, lr}
	ldr r1, _020B6908 ; =0x7FFF0000
	mov r2, r0, lsl #0x10
	and r1, r0, r1
	mov r1, r1, lsr #0x10
	and r0, r0, #0x80000000
	mov r2, r2, lsr #0xd
	movs r3, r1, lsl #4
	mov r0, r0, lsr #0x1f
	beq _020B6900
	cmp r0, #0
	beq _020B68E4
	ldr r0, _020B690C ; =_021D84E8
	ldr r1, _020B6910 ; =_021D84EC
	bl NNSi_GfdFreeLnkVram
	b _020B68F0
_020B68E4:
	ldr r0, _020B6914 ; =_021D84E4
	ldr r1, _020B6910 ; =_021D84EC
	bl NNSi_GfdFreeLnkVram
_020B68F0:
	cmp r0, #0
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, pc}
_020B6900:
	mov r0, #2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B6908: .word 0x7FFF0000
_020B690C: .word _021D84E8
_020B6910: .word _021D84EC
_020B6914: .word _021D84E4
	arm_func_end NNS_GfdFreeLnkTexVram

	arm_func_start NNS_GfdResetLnkTexVramState
NNS_GfdResetLnkTexVramState: ; 0x020B6918
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x30
	ldr lr, _020B6B00 ; =_021092A0
	add r4, sp, #0
	ldmia lr!, {r0, r1, r2, r3}
	mov ip, r4
	stmia r4!, {r0, r1, r2, r3}
	ldmia lr!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r0, _020B6B04 ; =_021D84E4
	mov r3, #0
	ldr r2, [r0, #0x10]
	ldr r1, [r0, #0xc]
	add r0, r2, r2, lsr #1
	mov r4, r2, lsr #1
	sub r1, r1, r0
_020B6960:
	cmp r3, #0
	cmpne r3, #2
	bne _020B69A0
	ldr lr, [ip]
	cmp lr, #0
	cmpne r2, #0
	beq _020B69A0
	ldr r0, [ip, #8]
	cmp lr, r2
	movhi lr, r2
	add r0, r0, lr
	str r0, [ip, #8]
	ldr r0, [ip]
	sub r2, r2, lr
	sub r0, r0, lr
	str r0, [ip]
_020B69A0:
	add r3, r3, #1
	cmp r3, #4
	add ip, ip, #0xc
	blo _020B6960
	ldr r0, [sp, #0xc]
	add r2, sp, #0
	sub r0, r0, r4
	str r0, [sp, #0xc]
	mov r3, #0
_020B69C4:
	ldr ip, [r2]
	cmp ip, #0
	cmpne r1, #0
	beq _020B69F8
	ldr r0, [r2, #4]
	cmp ip, r1
	movhi ip, r1
	add r0, r0, ip
	str r0, [r2, #4]
	ldr r0, [r2]
	sub r1, r1, ip
	sub r0, r0, ip
	str r0, [r2]
_020B69F8:
	add r3, r3, #1
	cmp r3, #4
	add r2, r2, #0xc
	blo _020B69C4
	ldr r0, _020B6B08 ; =_021D84E4
	bl NNSi_GfdInitLnkVramMan
	ldr r0, _020B6B0C ; =_021D84E8
	bl NNSi_GfdInitLnkVramMan
	ldr r0, _020B6B04 ; =_021D84E4
	ldr r1, [r0, #0x18]
	ldr r0, [r0, #0x14]
	mov r1, r1, lsr #4
	bl NNSi_GfdInitLnkVramBlockPool
	ldr r3, [sp, #8]
	ldr r1, _020B6B04 ; =_021D84E4
	cmp r3, #0
	str r0, [r1, #8]
	beq _020B6A50
	ldr r0, _020B6B0C ; =_021D84E8
	ldr r1, _020B6B10 ; =_021D84EC
	mov r2, #0
	bl NNSi_GfdAddNewFreeBlock
_020B6A50:
	ldr r3, [sp, #4]
	ldr r2, [sp, #8]
	cmp r3, #0
	beq _020B6A6C
	ldr r0, _020B6B08 ; =_021D84E4
	ldr r1, _020B6B10 ; =_021D84EC
	bl NNSi_GfdAddNewFreeBlock
_020B6A6C:
	ldr r3, [sp, #0x20]
	cmp r3, #0
	beq _020B6A88
	ldr r0, _020B6B0C ; =_021D84E8
	ldr r1, _020B6B10 ; =_021D84EC
	mov r2, #0x40000
	bl NNSi_GfdAddNewFreeBlock
_020B6A88:
	ldr r3, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	cmp r3, #0
	beq _020B6AA8
	ldr r0, _020B6B08 ; =_021D84E4
	ldr r1, _020B6B10 ; =_021D84EC
	add r2, r2, #0x40000
	bl NNSi_GfdAddNewFreeBlock
_020B6AA8:
	ldr r3, [sp, #0x28]
	cmp r3, #0
	beq _020B6AC4
	ldr r0, _020B6B08 ; =_021D84E4
	ldr r1, _020B6B10 ; =_021D84EC
	mov r2, #0x60000
	bl NNSi_GfdAddNewFreeBlock
_020B6AC4:
	ldr r3, [sp, #0x10]
	cmp r3, #0
	beq _020B6AE0
	ldr r0, _020B6B08 ; =_021D84E4
	ldr r1, _020B6B10 ; =_021D84EC
	add r2, r4, #0x20000
	bl NNSi_GfdAddNewFreeBlock
_020B6AE0:
	ldr r0, _020B6B08 ; =_021D84E4
	ldr r1, _020B6B10 ; =_021D84EC
	bl NNSi_GfdMergeAllFreeBlocks
	ldr r0, _020B6B0C ; =_021D84E8
	ldr r1, _020B6B10 ; =_021D84EC
	bl NNSi_GfdMergeAllFreeBlocks
	add sp, sp, #0x30
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B6B00: .word _021092A0
_020B6B04: .word _021D84E4
_020B6B08: .word _021D84E4
_020B6B0C: .word _021D84E8
_020B6B10: .word _021D84EC
	arm_func_end NNS_GfdResetLnkTexVramState

	arm_func_start NNS_GfdGetLnkPlttVramManagerWorkSize
NNS_GfdGetLnkPlttVramManagerWorkSize: ; 0x020B6B14
	mov r0, r0, lsl #4
	bx lr
	arm_func_end NNS_GfdGetLnkPlttVramManagerWorkSize

	arm_func_start NNS_GfdInitLnkPlttVramManager
NNS_GfdInitLnkPlttVramManager: ; 0x020B6B1C
	stmdb sp!, {r4, lr}
	ldr ip, _020B6B5C ; =_021D8500
	mov r4, r3
	str r0, [ip, #8]
	str r1, [ip, #0xc]
	str r2, [ip, #0x10]
	bl NNS_GfdResetLnkPlttVramState
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, _020B6B60 ; =NNS_GfdAllocLnkPlttVram
	ldr r1, _020B6B64 ; =NNS_GfdDefaultFuncAllocPlttVram
	ldr r2, _020B6B68 ; =NNS_GfdFreeLnkPlttVram
	ldr r0, _020B6B6C ; =NNS_GfdDefaultFuncFreePlttVram
	str r3, [r1]
	str r2, [r0]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B6B5C: .word _021D8500
_020B6B60: .word NNS_GfdAllocLnkPlttVram
_020B6B64: .word NNS_GfdDefaultFuncAllocPlttVram
_020B6B68: .word NNS_GfdFreeLnkPlttVram
_020B6B6C: .word NNS_GfdDefaultFuncFreePlttVram
	arm_func_end NNS_GfdInitLnkPlttVramManager

	arm_func_start NNS_GfdAllocLnkPlttVram
NNS_GfdAllocLnkPlttVram: ; 0x020B6B70
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	cmp r0, #0
	moveq r4, #8
	addne r0, r0, #7
	bicne r4, r0, #7
	ldr r0, _020B6C30 ; =0x0007FFF8
	cmp r4, r0
	addhs sp, sp, #8
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	cmp r1, #0
	add r2, sp, #4
	beq _020B6BEC
	mov ip, #8
	ldr r0, _020B6C34 ; =_021D8500
	ldr r1, _020B6C38 ; =_021D8504
	mov r3, r4
	str ip, [sp]
	bl NNSi_GfdAllocLnkVramAligned
	ldr r2, [sp, #4]
	add r1, r2, r4
	cmp r1, #0x10000
	bls _020B6C04
	ldr r0, _020B6C34 ; =_021D8500
	ldr r1, _020B6C38 ; =_021D8504
	mov r3, r4
	bl NNSi_GfdFreeLnkVram
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r4, pc}
_020B6BEC:
	ldr r0, _020B6C34 ; =_021D8500
	mov ip, #0x10
	ldr r1, _020B6C38 ; =_021D8504
	mov r3, r4
	str ip, [sp]
	bl NNSi_GfdAllocLnkVramAligned
_020B6C04:
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [sp, #4]
	mov r1, r4, lsr #3
	mov r0, r0, lsl #0xd
	mov r0, r0, lsr #0x10
	orr r0, r0, r1, lsl #16
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B6C30: .word 0x0007FFF8
_020B6C34: .word _021D8500
_020B6C38: .word _021D8504
	arm_func_end NNS_GfdAllocLnkPlttVram

	arm_func_start NNS_GfdFreeLnkPlttVram
NNS_GfdFreeLnkPlttVram: ; 0x020B6C3C
	stmdb sp!, {r3, lr}
	mov r1, #0x10000
	rsb r1, r1, #0
	and r1, r0, r1
	mov r2, r0, lsl #0x10
	mov r3, r1, lsr #0x10
	ldr r0, _020B6C78 ; =_021D8500
	ldr r1, _020B6C7C ; =_021D8504
	mov r2, r2, lsr #0xd
	mov r3, r3, lsl #3
	bl NNSi_GfdFreeLnkVram
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B6C78: .word _021D8500
_020B6C7C: .word _021D8504
	arm_func_end NNS_GfdFreeLnkPlttVram

	arm_func_start NNS_GfdResetLnkPlttVramState
NNS_GfdResetLnkPlttVramState: ; 0x020B6C80
	stmdb sp!, {r3, lr}
	ldr r0, _020B6CD0 ; =_021D8500
	ldr r1, [r0, #0x10]
	ldr r0, [r0, #0xc]
	mov r1, r1, lsr #4
	bl NNSi_GfdInitLnkVramBlockPool
	ldr r1, _020B6CD0 ; =_021D8500
	str r0, [r1, #4]
	ldr r0, _020B6CD4 ; =_021D8500
	bl NNSi_GfdInitLnkVramMan
	ldr r1, _020B6CD0 ; =_021D8500
	ldr r0, _020B6CD4 ; =_021D8500
	ldr r3, [r1, #8]
	ldr r1, _020B6CD8 ; =_021D8504
	mov r2, #0
	bl NNSi_GfdAddNewFreeBlock
	ldr r0, _020B6CD4 ; =_021D8500
	ldr r1, _020B6CD8 ; =_021D8504
	bl NNSi_GfdMergeAllFreeBlocks
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B6CD0: .word _021D8500
_020B6CD4: .word _021D8500
_020B6CD8: .word _021D8504
	arm_func_end NNS_GfdResetLnkPlttVramState

	arm_func_start GetUnpackedAnimBankImpl_
GetUnpackedAnimBankImpl_: ; 0x020B6CDC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B6D14 ; =0x41424E4B
	bl NNS_G2dFindBinaryBlock
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl NNS_G2dUnpackNAN
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B6D14: .word 0x41424E4B
	arm_func_end GetUnpackedAnimBankImpl_

	arm_func_start NNS_G2dGetUnpackedAnimBank
NNS_G2dGetUnpackedAnimBank: ; 0x020B6D18
	ldr ip, _020B6D20 ; =GetUnpackedAnimBankImpl_
	bx ip
	.align 2, 0
_020B6D20: .word GetUnpackedAnimBankImpl_
	arm_func_end NNS_G2dGetUnpackedAnimBank

	arm_func_start NNS_G2dGetUnpackedMCAnimBank
NNS_G2dGetUnpackedMCAnimBank: ; 0x020B6D24
	ldr ip, _020B6D2C ; =GetUnpackedAnimBankImpl_
	bx ip
	.align 2, 0
_020B6D2C: .word GetUnpackedAnimBankImpl_
	arm_func_end NNS_G2dGetUnpackedMCAnimBank

	arm_func_start NNS_G2dUnpackNAN
NNS_G2dUnpackNAN: ; 0x020B6D30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r1, [r0, #4]
	mov ip, #0
	add r1, r1, r0
	str r1, [r0, #4]
	ldr r1, [r0, #8]
	add r1, r1, r0
	str r1, [r0, #8]
	ldr r1, [r0, #0xc]
	add r6, r1, r0
	str r6, [r0, #0xc]
	ldrh r1, [r0]
	ldmib r0, {r4, r5}
	cmp r1, #0
	bls _020B6DD4
	mov r1, ip
_020B6D70:
	add r2, r4, ip, lsl #4
	ldr r7, [r2, #0xc]
	mov r3, ip, lsl #4
	add r7, r5, r7
	str r7, [r2, #0xc]
	ldrh r7, [r4, r3]
	mov lr, r1
	cmp r7, #0
	bls _020B6DBC
_020B6D94:
	ldr sb, [r2, #0xc]
	add r7, lr, #1
	ldr r8, [sb, lr, lsl #3]
	mov r7, r7, lsl #0x10
	add r8, r6, r8
	str r8, [sb, lr, lsl #3]
	ldrh r8, [r4, r3]
	mov lr, r7, lsr #0x10
	cmp r8, r7, lsr #16
	bhi _020B6D94
_020B6DBC:
	ldrh r3, [r0]
	add r2, ip, #1
	mov r2, r2, lsl #0x10
	cmp r3, r2, lsr #16
	mov ip, r2, lsr #0x10
	bhi _020B6D70
_020B6DD4:
	ldr r1, [r0, #0x14]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r2, r1, r0
	str r2, [r0, #0x14]
	add r4, r2, #8
	ldr r1, [r4, #4]
	mov r0, #0
	add r1, r1, r4
	str r1, [r4, #4]
	ldrh r1, [r2, #8]
	cmp r1, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r3, r0
	mov r7, r0
_020B6E10:
	ldr r6, [r4, #4]
	mov r1, r7
	add r2, r6, r3
	ldr r5, [r2, #4]
	add r5, r5, r4
	str r5, [r2, #4]
	ldr r5, [r2, #8]
	add r5, r5, r4
	str r5, [r2, #8]
	ldrh r5, [r6, r3]
	cmp r5, #0
	bls _020B6E68
	mov r8, r7
_020B6E44:
	ldr r6, [r2, #8]
	add r1, r1, #1
	ldr r5, [r6, r8]
	add r5, r5, r4
	str r5, [r6, r8]
	ldrh r5, [r2]
	add r8, r8, #4
	cmp r1, r5
	blo _020B6E44
_020B6E68:
	ldrh r1, [r4]
	add r0, r0, #1
	add r3, r3, #0xc
	cmp r0, r1
	blo _020B6E10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end NNS_G2dUnpackNAN

	arm_func_start NNS_G2dGetAnimSequenceByIdx
NNS_G2dGetAnimSequenceByIdx: ; 0x020B6E80
	ldrh r2, [r0]
	cmp r2, r1
	ldrhi r0, [r0, #4]
	addhi r0, r0, r1, lsl #4
	movls r0, #0
	bx lr
	arm_func_end NNS_G2dGetAnimSequenceByIdx

	arm_func_start GetPtrOamArrayHead_
GetPtrOamArrayHead_: ; 0x020B6E98
	ldrh r1, [r0, #2]
	tst r1, #1
	ldrh r1, [r0]
	ldrne r0, [r0, #4]
	addne r0, r0, r1, lsl #4
	ldreq r0, [r0, #4]
	addeq r0, r0, r1, lsl #3
	bx lr
	arm_func_end GetPtrOamArrayHead_

	arm_func_start UnPackExtendedData_
UnPackExtendedData_: ; 0x020B6EB8
	ldr ip, _020B6EC4 ; =NNSi_G2dUnpackUserExCellAttrBank
	add r0, r0, #8
	bx ip
	.align 2, 0
_020B6EC4: .word NNSi_G2dUnpackUserExCellAttrBank
	arm_func_end UnPackExtendedData_

	arm_func_start NNS_G2dGetUnpackedCellBank
NNS_G2dGetUnpackedCellBank: ; 0x020B6EC8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B6F00 ; =0x4345424B
	bl NNS_G2dFindBinaryBlock
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl NNS_G2dUnpackNCE
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B6F00: .word 0x4345424B
	arm_func_end NNS_G2dGetUnpackedCellBank

	arm_func_start NNS_G2dGetCellDataByIdx
NNS_G2dGetCellDataByIdx: ; 0x020B6F04
	ldrh r2, [r0]
	cmp r1, r2
	movhs r0, #0
	bxhs lr
	ldrh r2, [r0, #2]
	ldr r0, [r0, #4]
	tst r2, #1
	addne r0, r0, r1, lsl #4
	addeq r0, r0, r1, lsl #3
	bx lr
	arm_func_end NNS_G2dGetCellDataByIdx

	arm_func_start NNS_G2dUnpackNCE
NNS_G2dUnpackNCE: ; 0x020B6F2C
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r1, [r5, #4]
	add r1, r1, r5
	str r1, [r5, #4]
	bl GetPtrOamArrayHead_
	ldrh r1, [r5]
	mov r4, r0
	mov r6, #0
	cmp r1, #0
	bls _020B6F88
_020B6F58:
	mov r0, r5
	mov r1, r6
	bl NNS_G2dGetCellDataByIdx
	ldr r2, [r0, #4]
	add r1, r6, #1
	add r2, r2, r4
	str r2, [r0, #4]
	mov r0, r1, lsl #0x10
	ldrh r1, [r5]
	mov r6, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020B6F58
_020B6F88:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _020B6FAC
	add r1, r0, r5
	str r1, [r5, #0xc]
	ldr r0, [r1, #4]
	add r0, r0, r1
	str r0, [r1, #4]
	str r1, [r5, #0xc]
_020B6FAC:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r0, r5
	str r0, [r5, #0x14]
	bl UnPackExtendedData_
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G2dUnpackNCE

	arm_func_start NNS_G2dGetUnpackedMultiCellBank
NNS_G2dGetUnpackedMultiCellBank: ; 0x020B6FC8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B7000 ; =0x4D43424B
	bl NNS_G2dFindBinaryBlock
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl NNS_G2dUnpackNMC
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B7000: .word 0x4D43424B
	arm_func_end NNS_G2dGetUnpackedMultiCellBank

	arm_func_start UnpackExtendedData_
UnpackExtendedData_: ; 0x020B7004
	ldr ip, _020B7010 ; =NNSi_G2dUnpackUserExCellAttrBank
	add r0, r0, #8
	bx ip
	.align 2, 0
_020B7010: .word NNSi_G2dUnpackUserExCellAttrBank
	arm_func_end UnpackExtendedData_

	arm_func_start NNS_G2dUnpackNMC
NNS_G2dUnpackNMC: ; 0x020B7014
	stmdb sp!, {r4, lr}
	ldr r1, [r0, #4]
	mov lr, #0
	add r1, r1, r0
	str r1, [r0, #4]
	ldr r1, [r0, #8]
	add r1, r1, r0
	str r1, [r0, #8]
	ldrh r1, [r0]
	ldr r4, [r0, #4]
	cmp r1, #0
	bls _020B7070
_020B7044:
	add r3, r4, lr, lsl #3
	ldr ip, [r0, #8]
	ldr r2, [r3, #4]
	add r1, lr, #1
	add r2, ip, r2
	str r2, [r3, #4]
	ldrh r2, [r0]
	mov r1, r1, lsl #0x10
	mov lr, r1, lsr #0x10
	cmp r2, r1, lsr #16
	bhi _020B7044
_020B7070:
	ldr r1, [r0, #0x10]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	add r1, r1, r0
	str r1, [r0, #0x10]
	mov r0, r1
	bl UnpackExtendedData_
	ldmia sp!, {r4, pc}
	arm_func_end NNS_G2dUnpackNMC

	arm_func_start NNS_G2dGetMultiCellDataByIdx
NNS_G2dGetMultiCellDataByIdx: ; 0x020B7090
	ldrh r2, [r0]
	cmp r1, r2
	ldrlo r0, [r0, #4]
	addlo r0, r0, r1, lsl #3
	movhs r0, #0
	bx lr
	arm_func_end NNS_G2dGetMultiCellDataByIdx

	arm_func_start NNS_G2dGetUnpackedCharacterData
NNS_G2dGetUnpackedCharacterData: ; 0x020B70A8
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B70E0 ; =0x43484152
	bl NNS_G2dFindBinaryBlock
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl NNS_G2dUnpackNCG
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B70E0: .word 0x43484152
	arm_func_end NNS_G2dGetUnpackedCharacterData

	arm_func_start NNS_G2dUnpackNCG
NNS_G2dUnpackNCG: ; 0x020B70E4
	ldr r1, [r0, #0x14]
	add r1, r1, r0
	str r1, [r0, #0x14]
	bx lr
	arm_func_end NNS_G2dUnpackNCG

	arm_func_start NNS_G2dGetUnpackedBGCharacterData
NNS_G2dGetUnpackedBGCharacterData: ; 0x020B70F4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B712C ; =0x43484152
	bl NNS_G2dFindBinaryBlock
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl NNS_G2dUnpackBGNCG
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B712C: .word 0x43484152
	arm_func_end NNS_G2dGetUnpackedBGCharacterData

	arm_func_start NNS_G2dUnpackBGNCG
NNS_G2dUnpackBGNCG: ; 0x020B7130
	ldr r1, [r0, #0x14]
	add r1, r1, r0
	str r1, [r0, #0x14]
	bx lr
	arm_func_end NNS_G2dUnpackBGNCG

	arm_func_start NNS_G2dGetUnpackedPaletteData
NNS_G2dGetUnpackedPaletteData: ; 0x020B7140
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B7178 ; =0x504C5454
	bl NNS_G2dFindBinaryBlock
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl NNS_G2dUnpackNCL
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B7178: .word 0x504C5454
	arm_func_end NNS_G2dGetUnpackedPaletteData

	arm_func_start NNS_G2dGetUnpackedPaletteCompressInfo
NNS_G2dGetUnpackedPaletteCompressInfo: ; 0x020B717C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	ldr r1, _020B71B4 ; =0x50434D50
	bl NNS_G2dFindBinaryBlock
	movs r4, r0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, r4, #8
	bl NNSi_G2dUnpackNCLCmpInfo
	add r0, r4, #8
	str r0, [r5]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B71B4: .word 0x50434D50
	arm_func_end NNS_G2dGetUnpackedPaletteCompressInfo

	arm_func_start NNSi_G2dUnpackNCLCmpInfo
NNSi_G2dUnpackNCLCmpInfo: ; 0x020B71B8
	ldr r1, [r0, #4]
	add r1, r1, r0
	str r1, [r0, #4]
	bx lr
	arm_func_end NNSi_G2dUnpackNCLCmpInfo

	arm_func_start NNS_G2dUnpackNCL
NNS_G2dUnpackNCL: ; 0x020B71C8
	ldr r1, [r0, #0xc]
	add r1, r1, r0
	str r1, [r0, #0xc]
	bx lr
	arm_func_end NNS_G2dUnpackNCL

	arm_func_start NNS_G2dGetUnpackedScreenData
NNS_G2dGetUnpackedScreenData: ; 0x020B71D8
	stmdb sp!, {r4, lr}
	mov r4, r1
	ldr r1, _020B7208 ; =0x5343524E
	bl NNS_G2dFindBinaryBlock
	cmp r0, #0
	moveq r0, #0
	streq r0, [r4]
	ldmeqia sp!, {r4, pc}
	add r0, r0, #8
	str r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B7208: .word 0x5343524E
	arm_func_end NNS_G2dGetUnpackedScreenData

	arm_func_start NNS_G2dFindBinaryBlock
NNS_G2dFindBinaryBlock: ; 0x020B720C
	ldrh r2, [r0, #0xc]
	ldrh ip, [r0, #0xe]
	mov r3, #0
	add r0, r0, r2
	cmp ip, #0
	bls _020B724C
_020B7224:
	ldr r2, [r0]
	cmp r2, r1
	bxeq lr
	add r2, r3, #1
	mov r2, r2, lsl #0x10
	ldr r3, [r0, #4]
	cmp ip, r2, lsr #16
	add r0, r0, r3
	mov r3, r2, lsr #0x10
	bhi _020B7224
_020B724C:
	mov r0, #0
	bx lr
	arm_func_end NNS_G2dFindBinaryBlock

	arm_func_start NNSi_G2dUnpackUserExCellAttrBank
NNSi_G2dUnpackUserExCellAttrBank: ; 0x020B7254
	ldr r1, [r0, #4]
	mov ip, #0
	add r1, r1, r0
	str r1, [r0, #4]
	ldrh r1, [r0]
	cmp r1, #0
	bxls lr
_020B7270:
	ldr r3, [r0, #4]
	add r1, ip, #1
	ldr r2, [r3, ip, lsl #2]
	mov r1, r1, lsl #0x10
	add r2, r0, r2
	str r2, [r3, ip, lsl #2]
	ldrh r2, [r0]
	mov ip, r1, lsr #0x10
	cmp r2, r1, lsr #16
	bhi _020B7270
	bx lr
	arm_func_end NNSi_G2dUnpackUserExCellAttrBank

	arm_func_start DrawOneQuad_
DrawOneQuad_: ; 0x020B729C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov ip, r3, lsl #8
	mov r0, r0, lsl #8
	ldr r3, _020B734C ; =0x04000500
	mov r4, ip, asr #0x10
	mov r0, r0, asr #0x10
	mov lr, r4, lsl #0x10
	mov r4, r0, lsl #0x10
	mov r0, r1, lsl #8
	mov ip, #1
	mov r0, r0, asr #0x10
	mov r5, r0, lsl #0x10
	mov r0, #0x10000000
	mov r1, r2, lsl #8
	mov r1, r1, asr #0x10
	mov r2, r1, lsl #0x10
	mov r7, lr, lsr #0x10
	mov r1, r4, lsr #0x10
	mov r5, r5, lsr #0x10
	mov r2, r2, lsr #0x10
	str ip, [r3]
	orr r4, r1, r7, lsl #16
	sub r6, r3, #0x78
	str r4, [r6]
	sub lr, r3, #0x74
	str r0, [lr]
	mov ip, #0
	str ip, [lr]
	orr r4, r5, r7, lsl #16
	str r4, [r6]
	add r0, r0, #0x1000
	str r0, [lr]
	str ip, [lr]
	orr r0, r5, r2, lsl #16
	str r0, [r6]
	mov r0, #0x1000
	str r0, [lr]
	str ip, [lr]
	orr r0, r1, r2, lsl #16
	str r0, [r6]
	str ip, [lr]
	str ip, [lr]
	str ip, [r3, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B734C: .word 0x04000500
	arm_func_end DrawOneQuad_

	arm_func_start NNS_G2dSetupSoftwareSpriteCamera
NNS_G2dSetupSoftwareSpriteCamera: ; 0x020B7350
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x38
	ldr r2, _020B7400 ; =0xBFFF0000
	ldr r1, _020B7404 ; =0x04000580
	mov r0, r2, lsl #6
	str r2, [r1]
	str r0, [sp]
	mov r1, #0x400000
	str r1, [sp, #4]
	mov r0, #0
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	mov r2, r0
	mov r1, #0xc0000
	mov r3, #0x100000
	str r0, [sp, #0x10]
	bl G3i_OrthoW_
	ldr r1, _020B7408 ; =0x0400044C
	mov r5, #0
	ldr r0, _020B740C ; =_021092E0
	str r5, [r1]
	add r4, sp, #0x2c
	ldr ip, _020B7410 ; =_021092EC
	add lr, sp, #0x20
	ldmia r0, {r0, r1, r2}
	stmia lr, {r0, r1, r2}
	add r3, sp, #0x14
	ldmia ip, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	mov r2, r3
	str r5, [r4]
	str r5, [r4, #4]
	str r5, [r4, #8]
	mov r0, r4
	mov r1, lr
	mov r3, #1
	str r5, [sp]
	bl G3i_LookAt_
	ldr r0, _020B7414 ; =0x04000440
	mov r1, #1
	str r1, [r0]
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B7400: .word 0xBFFF0000
_020B7404: .word 0x04000580
_020B7408: .word 0x0400044C
_020B740C: .word _021092E0
_020B7410: .word _021092EC
_020B7414: .word 0x04000440
	arm_func_end NNS_G2dSetupSoftwareSpriteCamera

	arm_func_start NNS_G2dDrawSpriteFast
NNS_G2dDrawSpriteFast: ; 0x020B7418
	stmdb sp!, {r4, lr}
	ldr lr, _020B747C ; =0x04000470
	mov r0, r0, lsl #0xc
	str r0, [lr]
	mov r4, r1, lsl #0xc
	ldr ip, [sp, #8]
	str r4, [lr]
	mov r4, r2, lsl #0xc
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	str r4, [lr]
	mov r4, r3, lsl #0xc
	ldr r3, [sp, #0x18]
	mov ip, ip, lsl #0xc
	str r4, [lr, #-4]!
	str ip, [lr]
	mov ip, #0x1000
	mov r0, r0, lsl #0xc
	mov r1, r1, lsl #0xc
	mov r2, r2, lsl #0xc
	mov r3, r3, lsl #0xc
	str ip, [lr]
	bl DrawOneQuad_
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B747C: .word 0x04000470
	arm_func_end NNS_G2dDrawSpriteFast

	arm_func_start SequenceEdgeHandle_
SequenceEdgeHandle_: ; 0x020B7480
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ldreq r0, [r4, #0x1c]
	ldreq r0, [r0, #8]
	cmp r0, #3
	cmpne r0, #4
	bne _020B751C
	ldr r0, [r4, #8]
	eor r0, r0, #1
	str r0, [r4, #8]
	ldr r1, [r4, #0x1c]
	ldr r2, [r4]
	ldrh r0, [r1, #2]
	ldr r1, [r1, #0xc]
	add r0, r1, r0, lsl #3
	sub r0, r0, #8
	cmp r2, r0
	bhi _020B7564
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _020B74EC
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x28]
	blx r2
_020B74EC:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ldreq r0, [r4, #0x1c]
	ldreq r0, [r0, #8]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #0
	strne r0, [r4, #0xc]
	bne _020B7564
	mov r0, r4
	bl NNS_G2dResetAnimCtrlState
	b _020B7564
_020B751C:
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _020B7538
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x28]
	blx r2
_020B7538:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ldreq r0, [r4, #0x1c]
	ldreq r0, [r0, #8]
	cmp r0, #2
	cmpne r0, #4
	movne r0, #0
	strne r0, [r4, #0xc]
	bne _020B7564
	mov r0, r4
	bl NNS_G2dResetAnimCtrlState
_020B7564:
	ldr r1, [r4, #0x1c]
	ldr r2, [r4]
	ldrh r0, [r1]
	ldr r1, [r1, #0xc]
	add r0, r1, r0, lsl #3
	sub r0, r0, #8
	cmp r2, r0
	strhi r0, [r4]
	ldmhiia sp!, {r4, pc}
	cmp r2, r1
	strlo r1, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end SequenceEdgeHandle_

	arm_func_start SetAnimCtrlCurrentFrameImpl_
SetAnimCtrlCurrentFrameImpl_: ; 0x020B7594
	ldr r3, [r0, #0x1c]
	ldrh r2, [r3]
	cmp r1, r2
	bhs _020B75C4
	ldr r2, [r3, #0xc]
	add r2, r2, r1, lsl #3
	str r2, [r0]
	ldrh r1, [r2, #4]
	cmp r1, #0
	strne r2, [r0, #4]
	mov r0, #1
	bx lr
_020B75C4:
	mov r0, #0
	bx lr
	arm_func_end SetAnimCtrlCurrentFrameImpl_

	arm_func_start NNS_G2dGetAnimCtrlCurrentElement
NNS_G2dGetAnimCtrlCurrentElement: ; 0x020B75CC
	ldr r0, [r0, #4]
	ldr r0, [r0]
	bx lr
	arm_func_end NNS_G2dGetAnimCtrlCurrentElement

	arm_func_start NNS_G2dTickAnimCtrl
NNS_G2dTickAnimCtrl: ; 0x020B75D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r0, [sl, #0xc]
	mov sb, #0
	cmp r0, #1
	movne r0, sb
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sl, #0x14]
	smull r2, r1, r0, r1
	adds r0, r2, #0x800
	adc r1, r1, sb
	mov r0, r0, lsr #0xc
	orr r0, r0, r1, lsl #20
	bl abs
	mov r4, #1
	ldr r1, [sl, #0x10]
	mov fp, sb
	add r0, r1, r0
	str r0, [sl, #0x10]
	mov r8, r4
	mov r7, sb
	mov r5, sb
	mov r6, r4
	b _020B7754
_020B7638:
	ldr r0, [sl]
	ldr r1, [sl, #0x10]
	ldrh r0, [r0, #4]
	mov sb, r8
	sub r0, r1, r0, lsl #12
	str r0, [sl, #0x10]
	ldr r0, [sl, #0x14]
	cmp r0, #0
	movgt r1, r8
	ldr r0, [sl, #8]
	movle r1, r7
	teq r1, r0
	ldr r0, [sl]
	addne r0, r0, #8
	subeq r0, r0, #8
	str r0, [sl]
	ldr r1, [sl, #0x14]
	ldr r0, [sl]
	cmp r1, #0
	movgt r2, r6
	ldr r1, [sl, #8]
	movle r2, r5
	teq r2, r1
	ldr r1, [sl, #0x1c]
	ldr r2, [r1, #0xc]
	beq _020B76B8
	ldrh r1, [r1]
	add r1, r2, r1, lsl #3
	cmp r0, r1
	movhs r0, r4
	movlo r0, fp
	b _020B76D0
_020B76B8:
	ldrh r1, [r1, #2]
	add r1, r2, r1, lsl #3
	sub r1, r1, #8
	cmp r0, r1
	movls r0, #1
	movhi r0, #0
_020B76D0:
	cmp r0, #0
	beq _020B76E0
	mov r0, sl
	bl SequenceEdgeHandle_
_020B76E0:
	ldr r1, [sl]
	ldrh r0, [r1, #4]
	cmp r0, #0
	strne r1, [sl, #4]
	ldr r0, [sl, #0x20]
	cmp r0, #0
	beq _020B7754
	ldr r0, [sl, #0x1c]
	ldr r2, [sl, #0x20]
	ldr r0, [r0, #0xc]
	cmp r2, #2
	ldr r1, [sl]
	sub r0, r1, r0
	mov r0, r0, lsl #0xd
	mov r1, r0, lsr #0x10
	beq _020B772C
	cmp r2, #3
	beq _020B7748
	b _020B7754
_020B772C:
	ldrh r0, [sl, #0x2c]
	cmp r1, r0
	bne _020B7754
	ldr r0, [sl, #0x24]
	ldr r2, [sl, #0x28]
	blx r2
	b _020B7754
_020B7748:
	ldr r0, [sl, #0x24]
	ldr r2, [sl, #0x28]
	blx r2
_020B7754:
	ldr r0, [sl, #0xc]
	cmp r0, #0
	beq _020B7778
	ldr r0, [sl]
	ldr r1, [sl, #0x10]
	ldrh r0, [r0, #4]
	cmp r1, r0, lsl #12
	movge r0, #1
	bge _020B777C
_020B7778:
	mov r0, #0
_020B777C:
	cmp r0, #0
	bne _020B7638
	mov r0, sb
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end NNS_G2dTickAnimCtrl

	arm_func_start NNS_G2dSetAnimCtrlCurrentFrame
NNS_G2dSetAnimCtrlCurrentFrame: ; 0x020B778C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl SetAnimCtrlCurrentFrameImpl_
	cmp r0, #0
	movne r1, #0
	strne r1, [r4, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end NNS_G2dSetAnimCtrlCurrentFrame

	arm_func_start NNS_G2dGetAnimCtrlCurrentFrame
NNS_G2dGetAnimCtrlCurrentFrame: ; 0x020B77A8
	ldr r1, [r0, #0x1c]
	ldr r2, [r0]
	ldr r0, [r1, #0xc]
	sub r0, r2, r0
	mov r0, r0, lsl #0xd
	mov r0, r0, lsr #0x10
	bx lr
	arm_func_end NNS_G2dGetAnimCtrlCurrentFrame

	arm_func_start NNS_G2dInitAnimCtrl
NNS_G2dInitAnimCtrl: ; 0x020B77C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x20
	bl NNS_G2dInitAnimCallBackFunctor
	mov r1, #0
	str r1, [r4]
	str r1, [r4, #4]
	str r1, [r4, #8]
	mov r0, #1
	str r0, [r4, #0xc]
	str r1, [r4, #0x10]
	mov r0, #0x1000
	str r0, [r4, #0x14]
	str r1, [r4, #0x18]
	str r1, [r4, #0x1c]
	ldmia sp!, {r4, pc}
	arm_func_end NNS_G2dInitAnimCtrl

	arm_func_start NNS_G2dInitAnimCallBackFunctor
NNS_G2dInitAnimCallBackFunctor: ; 0x020B7804
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	strh r1, [r0, #0xc]
	bx lr
	arm_func_end NNS_G2dInitAnimCallBackFunctor

	arm_func_start NNS_G2dResetAnimCtrlState
NNS_G2dResetAnimCtrlState: ; 0x020B781C
	ldr r1, [r0, #0x14]
	cmp r1, #0
	movgt r2, #1
	ldr r1, [r0, #8]
	movle r2, #0
	teq r2, r1
	ldr r2, [r0, #0x1c]
	beq _020B784C
	ldrh r1, [r2, #2]
	ldr r2, [r2, #0xc]
	add r1, r2, r1, lsl #3
	b _020B785C
_020B784C:
	ldrh r1, [r2]
	ldr r2, [r2, #0xc]
	add r1, r2, r1, lsl #3
	sub r1, r1, #8
_020B785C:
	str r1, [r0]
	ldr r2, [r0]
	ldr ip, _020B7878 ; =NNS_G2dTickAnimCtrl
	mov r1, #0
	str r2, [r0, #4]
	str r1, [r0, #0x10]
	bx ip
	.align 2, 0
_020B7878: .word NNS_G2dTickAnimCtrl
	arm_func_end NNS_G2dResetAnimCtrlState

	arm_func_start NNS_G2dBindAnimCtrl
NNS_G2dBindAnimCtrl: ; 0x020B787C
	ldr ip, _020B7888 ; =NNS_G2dResetAnimCtrlState
	str r1, [r0, #0x1c]
	bx ip
	.align 2, 0
_020B7888: .word NNS_G2dResetAnimCtrlState
	arm_func_end NNS_G2dBindAnimCtrl

	arm_func_start NNSi_G2dIsAnimCtrlLoopAnim
NNSi_G2dIsAnimCtrlLoopAnim: ; 0x020B788C
	ldr r1, [r0, #0x18]
	cmp r1, #0
	ldreq r0, [r0, #0x1c]
	ldreq r1, [r0, #8]
	cmp r1, #2
	cmpne r1, #4
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end NNSi_G2dIsAnimCtrlLoopAnim

	arm_func_start CpuLoadOAMSub_
CpuLoadOAMSub_: ; 0x020B78B0
	ldr ip, _020B78C0 ; =MIi_CpuCopy16
	add r1, r1, #0x400
	add r1, r1, #0x7000000
	bx ip
	.align 2, 0
_020B78C0: .word MIi_CpuCopy16
	arm_func_end CpuLoadOAMSub_

	arm_func_start CpuLoadOAMMain_
CpuLoadOAMMain_: ; 0x020B78C4
	ldr ip, _020B78D0 ; =MIi_CpuCopy16
	add r1, r1, #0x7000000
	bx ip
	.align 2, 0
_020B78D0: .word MIi_CpuCopy16
	arm_func_end CpuLoadOAMMain_

	arm_func_start NNS_G2dInitOamManagerModule
NNS_G2dInitOamManagerModule: ; 0x020B78D4
	stmdb sp!, {r3, lr}
	ldr r1, _020B796C ; =_021D8618
	mov r0, #0xc0
	mov r2, #0x400
	bl MIi_CpuClear16
	ldr r1, _020B7970 ; =_021D8B58
	mov r0, #0xc0
	mov r2, #0x400
	bl MIi_CpuClear16
	ldr r1, _020B7974 ; =_021D9098
	mov r0, #0xc0
	mov r2, #0x400
	bl MIi_CpuClear16
	ldr r0, _020B7978 ; =0x0000FFFF
	ldr r1, _020B797C ; =_021D8518
	mov r2, #0x100
	bl MIi_CpuClear16
	ldr r0, _020B7978 ; =0x0000FFFF
	ldr r1, _020B7980 ; =_021D8A58
	mov r2, #0x100
	bl MIi_CpuClear16
	ldr r0, _020B7978 ; =0x0000FFFF
	ldr r1, _020B7984 ; =_021D8F98
	mov r2, #0x100
	bl MIi_CpuClear16
	ldr r0, _020B7978 ; =0x0000FFFF
	ldr r1, _020B7988 ; =_021D8A18
	mov r2, #0x40
	bl MIi_CpuClear16
	ldr r0, _020B7978 ; =0x0000FFFF
	ldr r1, _020B798C ; =_021D8F58
	mov r2, #0x40
	bl MIi_CpuClear16
	ldr r0, _020B7978 ; =0x0000FFFF
	ldr r1, _020B7990 ; =_021D9498
	mov r2, #0x40
	bl MIi_CpuClear16
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B796C: .word _021D8618
_020B7970: .word _021D8B58
_020B7974: .word _021D9098
_020B7978: .word 0x0000FFFF
_020B797C: .word _021D8518
_020B7980: .word _021D8A58
_020B7984: .word _021D8F98
_020B7988: .word _021D8A18
_020B798C: .word _021D8F58
_020B7990: .word _021D9498
	arm_func_end NNS_G2dInitOamManagerModule

	arm_func_start NNS_G2dGetNewOamManagerInstance
NNS_G2dGetNewOamManagerInstance: ; 0x020B7994
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, [sp, #0x1c]
	ldr r6, _020B7B04 ; =_021D8518
	mov r4, #0x540
	mla r4, r5, r4, r6
	mov ip, r1
	sub r1, r2, #1
	add r1, ip, r1
	mov r1, r1, lsl #0x10
	mov r2, r1, lsr #0x10
	add lr, r4, ip, lsl #1
	add r7, r4, r2, lsl #1
	mov r6, r0
	mov r5, r3
	cmp lr, r7
	bhi _020B79F4
	ldr r0, _020B7B08 ; =0x0000FFFF
_020B79D8:
	ldrh r1, [lr]
	cmp r1, r0
	movne r0, #0
	bne _020B79F8
	add lr, lr, #2
	cmp lr, r7
	bls _020B79D8
_020B79F4:
	mov r0, #1
_020B79F8:
	cmp r0, #0
	beq _020B7A3C
	ldr r0, _020B7B0C ; =_021D8514
	sub r1, r2, ip
	ldrh r7, [r0]
	add r3, r1, #1
	add r1, r4, ip, lsl #1
	add lr, r7, #1
	strh lr, [r0]
	strh r7, [r6, #0x10]
	strh ip, [r6, #4]
	strh r2, [r6, #6]
	strh ip, [r6, #8]
	ldrh r0, [r6, #0x10]
	mov r2, r3, lsl #1
	bl MIi_CpuClear16
	b _020B7A44
_020B7A3C:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B7A44:
	ldrh r0, [sp, #0x18]
	add r3, r4, #0x500
	cmp r0, #0
	bne _020B7A70
	mov r0, #0x20
	strh r0, [r6, #0xa]
	mov r0, #0
	strh r0, [r6, #0xc]
	ldrh r0, [r6, #0xa]
	strh r0, [r6, #0xe]
	b _020B7AEC
_020B7A70:
	sub r0, r0, #1
	add r0, r5, r0
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	add r7, r3, r5, lsl #1
	add r4, r3, r2, lsl #1
	cmp r7, r4
	bhi _020B7AB0
	ldr r0, _020B7B08 ; =0x0000FFFF
_020B7A94:
	ldrh r1, [r7]
	cmp r1, r0
	movne r0, #0
	bne _020B7AB4
	add r7, r7, #2
	cmp r7, r4
	bls _020B7A94
_020B7AB0:
	mov r0, #1
_020B7AB4:
	cmp r0, #0
	beq _020B7AE4
	strh r5, [r6, #0xa]
	strh r2, [r6, #0xc]
	strh r5, [r6, #0xe]
	sub r0, r2, r5
	add r2, r0, #1
	ldrh r0, [r6, #0x10]
	add r1, r3, r5, lsl #1
	mov r2, r2, lsl #1
	bl MIi_CpuClear16
	b _020B7AEC
_020B7AE4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B7AEC:
	mov r1, #0
	ldr r0, [sp, #0x1c]
	str r1, [r6, #0x14]
	str r0, [r6]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B7B04: .word _021D8518
_020B7B08: .word 0x0000FFFF
_020B7B0C: .word _021D8514
	arm_func_end NNS_G2dGetNewOamManagerInstance

	arm_func_start NNS_G2dEntryOamManagerOamWithAffineIdx
NNS_G2dEntryOamManagerOamWithAffineIdx: ; 0x020B7B10
	stmdb sp!, {r4, lr}
	ldrh lr, [r0, #6]
	ldrh ip, [r0, #8]
	mov r4, #0
	add r3, lr, #1
	cmp ip, r3
	bgt _020B7B38
	ldrh r3, [r0, #4]
	cmp r3, lr
	movls r4, #1
_020B7B38:
	cmp r4, #0
	moveq r3, #0
	beq _020B7B54
	sub r3, lr, ip
	add r3, r3, #1
	mov r3, r3, lsl #0x10
	mov r3, r3, lsr #0x10
_020B7B54:
	cmp r3, #1
	movhs r3, #1
	movlo r3, #0
	cmp r3, #0
	beq _020B7BE4
	ldr r4, [r0]
	ldr ip, _020B7BEC ; =_021D8518
	mov r3, #0x540
	mla ip, r4, r3, ip
	ldrh r3, [r0, #8]
	add r4, ip, #0x100
	ldrh ip, [r1]
	mov lr, r3, lsl #3
	add r3, r4, r3, lsl #3
	strh ip, [r4, lr]
	ldrh lr, [r1, #2]
	ldr ip, _020B7BF0 ; =0x0000FFFE
	strh lr, [r3, #2]
	ldrh r1, [r1, #4]
	cmp r2, ip
	strh r1, [r3, #4]
	beq _020B7BD0
	ldr r1, [r3]
	mov ip, r1, lsl #0x16
	mov ip, ip, lsr #0x1e
	tst ip, #1
	beq _020B7BD0
	bic ip, r1, #0x3e000000
	mov r1, r2, lsl #0x1b
	orr r1, ip, r1, lsr #2
	str r1, [r3]
_020B7BD0:
	ldrh r1, [r0, #8]
	add r1, r1, #1
	strh r1, [r0, #8]
	mov r0, #1
	ldmia sp!, {r4, pc}
_020B7BE4:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B7BEC: .word _021D8518
_020B7BF0: .word 0x0000FFFE
	arm_func_end NNS_G2dEntryOamManagerOamWithAffineIdx

	arm_func_start NNS_G2dEntryOamManagerAffine
NNS_G2dEntryOamManagerAffine: ; 0x020B7BF4
	stmdb sp!, {r3, lr}
	ldrh lr, [r0, #0xc]
	ldrh ip, [r0, #0xe]
	mov r3, #0
	add r2, lr, #1
	cmp ip, r2
	bgt _020B7C1C
	ldrh r2, [r0, #0xa]
	cmp r2, lr
	movls r3, #1
_020B7C1C:
	cmp r3, #0
	moveq r2, #0
	beq _020B7C38
	sub r2, lr, ip
	add r2, r2, #1
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
_020B7C38:
	cmp r2, #1
	movhs r2, #1
	movlo r2, #0
	cmp r2, #0
	ldreq r0, _020B7CB0 ; =0x0000FFFE
	ldmeqia sp!, {r3, pc}
	ldr lr, [r0]
	ldr r3, _020B7CB4 ; =_021D8518
	mov r2, #0x540
	mla ip, lr, r2, r3
	ldr r3, [r1]
	ldrh r2, [r0, #0xe]
	add ip, ip, #0x100
	mov r3, r3, asr #4
	add ip, ip, r2, lsl #5
	strh r3, [ip, #6]
	ldr r3, [r1, #4]
	mov r3, r3, asr #4
	strh r3, [ip, #0xe]
	ldr r3, [r1, #8]
	mov r3, r3, asr #4
	strh r3, [ip, #0x16]
	ldr r1, [r1, #0xc]
	mov r1, r1, asr #4
	strh r1, [ip, #0x1e]
	ldrh r1, [r0, #0xe]
	add r1, r1, #1
	strh r1, [r0, #0xe]
	mov r0, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B7CB0: .word 0x0000FFFE
_020B7CB4: .word _021D8518
	arm_func_end NNS_G2dEntryOamManagerAffine

	arm_func_start NNS_G2dApplyOamManagerToHW
NNS_G2dApplyOamManagerToHW: ; 0x020B7CB8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, r0
	ldr r0, [r7, #0x14]
	cmp r0, #0
	beq _020B7D4C
	ldr r6, [r7]
	ldr r1, _020B7EB4 ; =_021D8518
	mov r0, #0x540
	mla r1, r6, r0, r1
	ldrh r3, [r7, #4]
	ldrh r0, [r7, #6]
	add r5, r1, #0x100
	mov r4, r3, lsl #3
	sub r0, r0, r3
	add r0, r0, #1
	mov r0, r0, lsl #0x13
	mov r8, r0, lsr #0x10
	mov r2, r4, lsl #0x10
	mov r1, r8
	add r0, r5, r3, lsl #3
	mov r7, r2, lsr #0x10
	bl DC_FlushRange
	cmp r6, #0
	beq _020B7D24
	cmp r6, #1
	beq _020B7D38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B7D24:
	mov r1, r7
	mov r2, r8
	add r0, r5, r4
	bl GX_LoadOAM
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B7D38:
	mov r1, r7
	mov r2, r8
	add r0, r5, r4
	bl GXS_LoadOAM
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B7D4C:
	ldr r0, [r7]
	ldr r2, _020B7EB4 ; =_021D8518
	mov r1, #0x540
	mla r2, r0, r1, r2
	ldrh r5, [r7, #4]
	ldrh r1, [r7, #6]
	ldr r3, _020B7EB8 ; =_021109C8
	add r4, r2, #0x100
	sub r1, r1, r5
	add r1, r1, #1
	mov r1, r1, lsl #0x10
	mov r2, r5, lsl #0x13
	add r6, r4, r5, lsl #3
	movs r5, r1, lsr #0x10
	mov r4, r2, lsr #0x10
	ldr sb, [r3, r0, lsl #2]
	mov sl, #0
	beq _020B7DCC
	mov r8, #6
_020B7D98:
	mov r0, r6
	mov r1, r4
	mov r2, r8
	blx sb
	add r2, r4, #8
	add r0, sl, #1
	mov r1, r0, lsl #0x10
	mov r0, r2, lsl #0x10
	cmp r5, r1, lsr #16
	mov r4, r0, lsr #0x10
	add r6, r6, #8
	mov sl, r1, lsr #0x10
	bhi _020B7D98
_020B7DCC:
	ldrh r2, [r7, #0xc]
	ldrh r1, [r7, #0xe]
	mov r3, #0
	add r0, r2, #1
	cmp r1, r0
	bgt _020B7DF0
	ldrh r0, [r7, #0xa]
	cmp r0, r2
	movls r3, #1
_020B7DF0:
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r7]
	ldr r2, _020B7EB4 ; =_021D8518
	mov r1, #0x540
	mla r2, r0, r1, r2
	ldr r3, _020B7EB8 ; =_021109C8
	ldrh r5, [r7, #0xa]
	ldrh r1, [r7, #0xc]
	add r4, r2, #0x100
	mov r2, r5, lsl #0x15
	sub r1, r1, r5
	add r1, r1, #1
	mov r1, r1, lsl #0x10
	ldr r6, [r3, r0, lsl #2]
	add sl, r4, r5, lsl #5
	movs sb, r1, lsr #0x10
	mov r8, r2, lsr #0x10
	mov r7, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r5, #2
	mov r4, r5
	mov fp, r5
_020B7E4C:
	mov r2, r5
	add r0, sl, #6
	add r1, r8, #6
	blx r6
	mov r2, r4
	add r0, sl, #0xe
	add r1, r8, #0xe
	blx r6
	add r0, sl, #0x16
	add r1, r8, #0x16
	mov r2, fp
	blx r6
	add r0, sl, #0x1e
	add r1, r8, #0x1e
	mov r2, #2
	blx r6
	add r0, r8, #0x20
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	add sl, sl, #0x20
	cmp sb, r0, lsr #16
	mov r7, r0, lsr #0x10
	bhi _020B7E4C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B7EB4: .word _021D8518
_020B7EB8: .word _021109C8
	arm_func_end NNS_G2dApplyOamManagerToHW

	arm_func_start NNS_G2dResetOamManagerBuffer
NNS_G2dResetOamManagerBuffer: ; 0x020B7EBC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _020B7F74
	ldrh r3, [r5, #6]
	ldrh r1, [r5, #8]
	mov r2, #0
	add r0, r3, #1
	cmp r1, r0
	bgt _020B7EF4
	ldrh r0, [r5, #4]
	cmp r0, r3
	movls r2, #1
_020B7EF4:
	cmp r2, #0
	moveq r4, #0
	beq _020B7F14
	ldrh r0, [r5, #4]
	sub r0, r3, r0
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0xd
_020B7F14:
	ldr r2, [r5]
	ldr r1, _020B7FDC ; =_021D8518
	mov r0, #0x540
	mla r1, r2, r0, r1
	add r2, r1, #0x100
	ldrh r0, [r5, #4]
	mov r1, r4
	add r6, r2, r0, lsl #3
	mov r0, r6
	bl DC_InvalidateRange
	ldr r0, _020B7FE0 ; =GXi_DmaId
	mvn r1, #0
	ldr r0, [r0]
	cmp r0, r1
	mov r1, r6
	beq _020B7F64
	mov r3, r4
	mov r2, #0xc0
	bl MI_DmaFill32
	b _020B7FC8
_020B7F64:
	mov r2, r4
	mov r0, #0xc0
	bl MIi_CpuClear32
	b _020B7FC8
_020B7F74:
	ldr r2, [r5]
	ldr r1, _020B7FDC ; =_021D8518
	mov r0, #0x540
	mla r1, r2, r0, r1
	ldrh r2, [r5, #4]
	ldrh r0, [r5, #6]
	add r1, r1, #0x100
	add r3, r1, r2, lsl #3
	sub r0, r0, r2
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	movs r2, r0, lsr #0x10
	mov r0, #0
	beq _020B7FC8
	mov r1, #0xc0
_020B7FB0:
	add r0, r0, #1
	mov r0, r0, lsl #0x10
	cmp r2, r0, lsr #16
	strh r1, [r3], #8
	mov r0, r0, lsr #0x10
	bhi _020B7FB0
_020B7FC8:
	ldrh r0, [r5, #4]
	strh r0, [r5, #8]
	ldrh r0, [r5, #0xa]
	strh r0, [r5, #0xe]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B7FDC: .word _021D8518
_020B7FE0: .word GXi_DmaId
	arm_func_end NNS_G2dResetOamManagerBuffer

	arm_func_start NNS_G2dApplyAndResetOamManagerBuffer
NNS_G2dApplyAndResetOamManagerBuffer: ; 0x020B7FE4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NNS_G2dApplyOamManagerToHW
	mov r0, r4
	bl NNS_G2dResetOamManagerBuffer
	ldmia sp!, {r4, pc}
	arm_func_end NNS_G2dApplyAndResetOamManagerBuffer

	arm_func_start NNS_G2dGetPaletteTableValue
NNS_G2dGetPaletteTableValue: ; 0x020B7FFC
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bx lr
	arm_func_end NNS_G2dGetPaletteTableValue

	arm_func_start NNS_G2dInitImageProxy
NNS_G2dInitImageProxy: ; 0x020B8008
	mov r2, #0
	mvn r1, #0
_020B8010:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #3
	blt _020B8010
	bx lr
	arm_func_end NNS_G2dInitImageProxy

	arm_func_start NNS_G2dSetImageLocation
NNS_G2dSetImageLocation: ; 0x020B8024
	str r2, [r0, r1, lsl #2]
	bx lr
	arm_func_end NNS_G2dSetImageLocation

	arm_func_start NNS_G2dGetImageLocation
NNS_G2dGetImageLocation: ; 0x020B802C
	ldr r0, [r0, r1, lsl #2]
	bx lr
	arm_func_end NNS_G2dGetImageLocation

	arm_func_start NNS_G2dIsImageReadyToUse
NNS_G2dIsImageReadyToUse: ; 0x020B8034
	ldr r1, [r0, r1, lsl #2]
	mvn r0, #0
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end NNS_G2dIsImageReadyToUse

	arm_func_start NNS_G2dInitImagePaletteProxy
NNS_G2dInitImagePaletteProxy: ; 0x020B804C
	mov r3, #0
	mvn r2, #0
_020B8054:
	add r1, r0, r3, lsl #2
	add r3, r3, #1
	str r2, [r1, #8]
	cmp r3, #3
	blt _020B8054
	bx lr
	arm_func_end NNS_G2dInitImagePaletteProxy

	arm_func_start NNS_G2dSetImagePaletteLocation
NNS_G2dSetImagePaletteLocation: ; 0x020B806C
	add r0, r0, r1, lsl #2
	str r2, [r0, #8]
	bx lr
	arm_func_end NNS_G2dSetImagePaletteLocation

	arm_func_start NNS_G2dGetImagePaletteLocation
NNS_G2dGetImagePaletteLocation: ; 0x020B8078
	add r0, r0, r1, lsl #2
	ldr r0, [r0, #8]
	bx lr
	arm_func_end NNS_G2dGetImagePaletteLocation

	arm_func_start NNS_G2dIsImagePaletteReadyToUse
NNS_G2dIsImagePaletteReadyToUse: ; 0x020B8084
	add r0, r0, r1, lsl #2
	ldr r1, [r0, #8]
	mvn r0, #0
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end NNS_G2dIsImagePaletteReadyToUse

	arm_func_start NNS_G2dLoadImage1DMapping
NNS_G2dLoadImage1DMapping: ; 0x020B80A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	movs r5, r2
	mov r6, r1
	mov r4, r3
	ldr r0, [r7, #8]
	beq _020B8104
	cmp r5, #1
	beq _020B80D0
	cmp r5, #2
	beq _020B80EC
	b _020B8104
_020B80D0:
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r1, _020B82C4 ; =0xFFCFFFEF
	and r1, r2, r1
	orr r0, r1, r0
	str r0, [r3]
	b _020B8104
_020B80EC:
	ldr r3, _020B82C8 ; =0x04001000
	ldr r1, _020B82C4 ; =0xFFCFFFEF
	ldr r2, [r3]
	and r1, r2, r1
	orr r0, r1, r0
	str r0, [r3]
_020B8104:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x10]
	bl DC_FlushRange
	cmp r5, #0
	beq _020B812C
	cmp r5, #1
	beq _020B8148
	cmp r5, #2
	beq _020B815C
	b _020B816C
_020B812C:
	bl GX_BeginLoadTex
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	mov r1, r6
	bl GX_LoadTex
	bl GX_EndLoadTex
	b _020B816C
_020B8148:
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	mov r1, r6
	bl GX_LoadOBJ
	b _020B816C
_020B815C:
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	mov r1, r6
	bl GXS_LoadOBJ
_020B816C:
	ldr r0, [r7, #8]
	cmp r0, #0
	ldrh r0, [r7, #2]
	bne _020B8284
	cmp r0, #0x10
	bgt _020B81B8
	bge _020B81E4
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B81F4
_020B8194: ; jump table
	b _020B81F4 ; case 0
	b _020B81C4 ; case 1
	b _020B81CC ; case 2
	b _020B81F4 ; case 3
	b _020B81D4 ; case 4
	b _020B81F4 ; case 5
	b _020B81F4 ; case 6
	b _020B81F4 ; case 7
	b _020B81DC ; case 8
_020B81B8:
	cmp r0, #0x20
	beq _020B81EC
	b _020B81F4
_020B81C4:
	mov r0, #0
	b _020B81F8
_020B81CC:
	mov r0, #1
	b _020B81F8
_020B81D4:
	mov r0, #2
	b _020B81F8
_020B81DC:
	mov r0, #3
	b _020B81F8
_020B81E4:
	mov r0, #4
	b _020B81F8
_020B81EC:
	mov r0, #5
	b _020B81F8
_020B81F4:
	mov r0, #0
_020B81F8:
	str r0, [r4, #0xc]
	ldrh r0, [r7]
	cmp r0, #0x10
	bgt _020B823C
	bge _020B8268
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B8278
_020B8218: ; jump table
	b _020B8278 ; case 0
	b _020B8248 ; case 1
	b _020B8250 ; case 2
	b _020B8278 ; case 3
	b _020B8258 ; case 4
	b _020B8278 ; case 5
	b _020B8278 ; case 6
	b _020B8278 ; case 7
	b _020B8260 ; case 8
_020B823C:
	cmp r0, #0x20
	beq _020B8270
	b _020B8278
_020B8248:
	mov r0, #0
	b _020B827C
_020B8250:
	mov r0, #1
	b _020B827C
_020B8258:
	mov r0, #2
	b _020B827C
_020B8260:
	mov r0, #3
	b _020B827C
_020B8268:
	mov r0, #4
	b _020B827C
_020B8270:
	mov r0, #5
	b _020B827C
_020B8278:
	mov r0, #0
_020B827C:
	str r0, [r4, #0x10]
	b _020B8290
_020B8284:
	str r0, [r4, #0xc]
	ldrh r0, [r7]
	str r0, [r4, #0x10]
_020B8290:
	ldr r1, [r7, #4]
	mov r0, #0
	str r1, [r4, #0x14]
	str r0, [r4, #0x18]
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r3, [r7, #8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	str r3, [r4, #0x20]
	bl NNS_G2dSetImageLocation
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B82C4: .word 0xFFCFFFEF
_020B82C8: .word 0x04001000
	arm_func_end NNS_G2dLoadImage1DMapping

	arm_func_start NNS_G2dLoadImage2DMapping
NNS_G2dLoadImage2DMapping: ; 0x020B82CC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	movs r5, r2
	mov r6, r1
	mov r4, r3
	ldr r0, [r7, #8]
	beq _020B8330
	cmp r5, #1
	beq _020B82FC
	cmp r5, #2
	beq _020B8318
	b _020B8330
_020B82FC:
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r1, _020B84F0 ; =0xFFCFFFEF
	and r1, r2, r1
	orr r0, r1, r0
	str r0, [r3]
	b _020B8330
_020B8318:
	ldr r3, _020B84F4 ; =0x04001000
	ldr r1, _020B84F0 ; =0xFFCFFFEF
	ldr r2, [r3]
	and r1, r2, r1
	orr r0, r1, r0
	str r0, [r3]
_020B8330:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x10]
	bl DC_FlushRange
	cmp r5, #0
	beq _020B8358
	cmp r5, #1
	beq _020B8374
	cmp r5, #2
	beq _020B8388
	b _020B8398
_020B8358:
	bl GX_BeginLoadTex
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	mov r1, r6
	bl GX_LoadTex
	bl GX_EndLoadTex
	b _020B8398
_020B8374:
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	mov r1, r6
	bl GX_LoadOBJ
	b _020B8398
_020B8388:
	ldr r0, [r7, #0x14]
	ldr r2, [r7, #0x10]
	mov r1, r6
	bl GXS_LoadOBJ
_020B8398:
	ldr r0, [r7, #8]
	cmp r0, #0
	ldrh r0, [r7, #2]
	bne _020B84B0
	cmp r0, #0x10
	bgt _020B83E4
	bge _020B8410
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B8420
_020B83C0: ; jump table
	b _020B8420 ; case 0
	b _020B83F0 ; case 1
	b _020B83F8 ; case 2
	b _020B8420 ; case 3
	b _020B8400 ; case 4
	b _020B8420 ; case 5
	b _020B8420 ; case 6
	b _020B8420 ; case 7
	b _020B8408 ; case 8
_020B83E4:
	cmp r0, #0x20
	beq _020B8418
	b _020B8420
_020B83F0:
	mov r0, #0
	b _020B8424
_020B83F8:
	mov r0, #1
	b _020B8424
_020B8400:
	mov r0, #2
	b _020B8424
_020B8408:
	mov r0, #3
	b _020B8424
_020B8410:
	mov r0, #4
	b _020B8424
_020B8418:
	mov r0, #5
	b _020B8424
_020B8420:
	mov r0, #0
_020B8424:
	str r0, [r4, #0xc]
	ldrh r0, [r7]
	cmp r0, #0x10
	bgt _020B8468
	bge _020B8494
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B84A4
_020B8444: ; jump table
	b _020B84A4 ; case 0
	b _020B8474 ; case 1
	b _020B847C ; case 2
	b _020B84A4 ; case 3
	b _020B8484 ; case 4
	b _020B84A4 ; case 5
	b _020B84A4 ; case 6
	b _020B84A4 ; case 7
	b _020B848C ; case 8
_020B8468:
	cmp r0, #0x20
	beq _020B849C
	b _020B84A4
_020B8474:
	mov r0, #0
	b _020B84A8
_020B847C:
	mov r0, #1
	b _020B84A8
_020B8484:
	mov r0, #2
	b _020B84A8
_020B848C:
	mov r0, #3
	b _020B84A8
_020B8494:
	mov r0, #4
	b _020B84A8
_020B849C:
	mov r0, #5
	b _020B84A8
_020B84A4:
	mov r0, #0
_020B84A8:
	str r0, [r4, #0x10]
	b _020B84BC
_020B84B0:
	str r0, [r4, #0xc]
	ldrh r0, [r7]
	str r0, [r4, #0x10]
_020B84BC:
	ldr r1, [r7, #4]
	mov r0, #0
	str r1, [r4, #0x14]
	str r0, [r4, #0x18]
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r3, [r7, #8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	str r3, [r4, #0x20]
	bl NNS_G2dSetImageLocation
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B84F0: .word 0xFFCFFFEF
_020B84F4: .word 0x04001000
	arm_func_end NNS_G2dLoadImage2DMapping

	arm_func_start NNS_G2dLoadImageVramTransfer
NNS_G2dLoadImageVramTransfer: ; 0x020B84F8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x10]
	mov r5, r2
	mov r4, r3
	bl DC_FlushRange
	cmp r5, #0
	ldr r0, [r7, #8]
	beq _020B856C
	cmp r5, #1
	beq _020B8538
	cmp r5, #2
	beq _020B8554
	b _020B856C
_020B8538:
	mov r3, #0x4000000
	ldr r2, [r3]
	ldr r1, _020B86C4 ; =0xFFCFFFEF
	and r1, r2, r1
	orr r0, r1, r0
	str r0, [r3]
	b _020B856C
_020B8554:
	ldr r3, _020B86C8 ; =0x04001000
	ldr r1, _020B86C4 ; =0xFFCFFFEF
	ldr r2, [r3]
	and r1, r2, r1
	orr r0, r1, r0
	str r0, [r3]
_020B856C:
	ldr r0, [r7, #8]
	cmp r0, #0
	ldrh r0, [r7, #2]
	bne _020B8684
	cmp r0, #0x10
	bgt _020B85B8
	bge _020B85E4
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B85F4
_020B8594: ; jump table
	b _020B85F4 ; case 0
	b _020B85C4 ; case 1
	b _020B85CC ; case 2
	b _020B85F4 ; case 3
	b _020B85D4 ; case 4
	b _020B85F4 ; case 5
	b _020B85F4 ; case 6
	b _020B85F4 ; case 7
	b _020B85DC ; case 8
_020B85B8:
	cmp r0, #0x20
	beq _020B85EC
	b _020B85F4
_020B85C4:
	mov r0, #0
	b _020B85F8
_020B85CC:
	mov r0, #1
	b _020B85F8
_020B85D4:
	mov r0, #2
	b _020B85F8
_020B85DC:
	mov r0, #3
	b _020B85F8
_020B85E4:
	mov r0, #4
	b _020B85F8
_020B85EC:
	mov r0, #5
	b _020B85F8
_020B85F4:
	mov r0, #0
_020B85F8:
	str r0, [r4, #0xc]
	ldrh r0, [r7]
	cmp r0, #0x10
	bgt _020B863C
	bge _020B8668
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020B8678
_020B8618: ; jump table
	b _020B8678 ; case 0
	b _020B8648 ; case 1
	b _020B8650 ; case 2
	b _020B8678 ; case 3
	b _020B8658 ; case 4
	b _020B8678 ; case 5
	b _020B8678 ; case 6
	b _020B8678 ; case 7
	b _020B8660 ; case 8
_020B863C:
	cmp r0, #0x20
	beq _020B8670
	b _020B8678
_020B8648:
	mov r0, #0
	b _020B867C
_020B8650:
	mov r0, #1
	b _020B867C
_020B8658:
	mov r0, #2
	b _020B867C
_020B8660:
	mov r0, #3
	b _020B867C
_020B8668:
	mov r0, #4
	b _020B867C
_020B8670:
	mov r0, #5
	b _020B867C
_020B8678:
	mov r0, #0
_020B867C:
	str r0, [r4, #0x10]
	b _020B8690
_020B8684:
	str r0, [r4, #0xc]
	ldrh r0, [r7]
	str r0, [r4, #0x10]
_020B8690:
	ldr r1, [r7, #4]
	mov r0, #0
	str r1, [r4, #0x14]
	str r0, [r4, #0x18]
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r3, [r7, #8]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	str r3, [r4, #0x20]
	bl NNS_G2dSetImageLocation
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B86C4: .word 0xFFCFFFEF
_020B86C8: .word 0x04001000
	arm_func_end NNS_G2dLoadImageVramTransfer

	arm_func_start NNS_G2dLoadPalette
NNS_G2dLoadPalette: ; 0x020B86CC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	ldr r4, [sb, #0xc]
	ldr r5, [sb, #8]
	mov r8, r1
	mov r7, r2
	mov r0, r4
	mov r1, r5
	mov r6, r3
	bl DC_FlushRange
	cmp r7, #0
	beq _020B8788
	cmp r7, #1
	beq _020B8710
	cmp r7, #2
	beq _020B874C
	b _020B87A0
_020B8710:
	ldr r0, [sb, #4]
	cmp r0, #0
	beq _020B8738
	bl GX_BeginLoadOBJExtPltt
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl GX_LoadOBJExtPltt
	bl GX_EndLoadOBJExtPltt
	b _020B87A0
_020B8738:
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl GX_LoadOBJPltt
	b _020B87A0
_020B874C:
	ldr r0, [sb, #4]
	cmp r0, #0
	beq _020B8774
	bl GXS_BeginLoadOBJExtPltt
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl GXS_LoadOBJExtPltt
	bl GXS_EndLoadOBJExtPltt
	b _020B87A0
_020B8774:
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl GXS_LoadOBJPltt
	b _020B87A0
_020B8788:
	bl GX_BeginLoadTexPltt
	mov r0, r4
	mov r1, r8
	mov r2, r5
	bl GX_LoadTexPltt
	bl GX_EndLoadTexPltt
_020B87A0:
	ldr r1, [sb]
	mov r0, r6
	str r1, [r6]
	ldr r3, [sb, #4]
	mov r1, r7
	mov r2, r8
	str r3, [r6, #4]
	bl NNS_G2dSetImagePaletteLocation
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end NNS_G2dLoadPalette

	arm_func_start NNS_G2dLoadPaletteEx
NNS_G2dLoadPaletteEx: ; 0x020B87C4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	ldr r0, [sl]
	str r1, [sp]
	cmp r0, #3
	ldr r0, [sp, #0x30]
	moveq r8, #0x20
	str r0, [sp, #0x30]
	ldr r0, [sp]
	mov sb, r2
	ldrh r0, [r0]
	mov fp, r3
	movne r8, #0x200
	str r0, [sp, #4]
	mov r7, #0
	movs r0, r0
	beq _020B88F8
_020B880C:
	ldr r0, [sp]
	ldr r5, [sl, #0xc]
	ldr r1, [r0, #4]
	mov r0, r7, lsl #1
	ldrh r0, [r1, r0]
	mul r4, r8, r7
	mul r6, r8, r0
	ldr r1, [sl, #8]
	mov r0, r5
	bl DC_FlushRange
	cmp fp, #0
	beq _020B88C8
	cmp fp, #1
	beq _020B8850
	cmp fp, #2
	beq _020B888C
	b _020B88E0
_020B8850:
	ldr r0, [sl, #4]
	cmp r0, #0
	beq _020B8878
	bl GX_BeginLoadOBJExtPltt
	add r0, r5, r4
	mov r2, r8
	add r1, sb, r6
	bl GX_LoadOBJExtPltt
	bl GX_EndLoadOBJExtPltt
	b _020B88E0
_020B8878:
	mov r2, r8
	add r0, r5, r4
	add r1, sb, r6
	bl GX_LoadOBJPltt
	b _020B88E0
_020B888C:
	ldr r0, [sl, #4]
	cmp r0, #0
	beq _020B88B4
	bl GXS_BeginLoadOBJExtPltt
	add r0, r5, r4
	mov r2, r8
	add r1, sb, r6
	bl GXS_LoadOBJExtPltt
	bl GXS_EndLoadOBJExtPltt
	b _020B88E0
_020B88B4:
	mov r2, r8
	add r0, r5, r4
	add r1, sb, r6
	bl GXS_LoadOBJPltt
	b _020B88E0
_020B88C8:
	bl GX_BeginLoadTexPltt
	add r0, r5, r4
	mov r2, r8
	add r1, sb, r6
	bl GX_LoadTexPltt
	bl GX_EndLoadTexPltt
_020B88E0:
	add r0, r7, #1
	mov r1, r0, lsl #0x10
	ldr r0, [sp, #4]
	mov r7, r1, lsr #0x10
	cmp r0, r1, lsr #16
	bhi _020B880C
_020B88F8:
	ldr r0, [sp, #0x30]
	ldr r2, [sl]
	mov r1, r0
	str r2, [r1]
	ldr r4, [sl, #4]
	mov r3, r0
	mov r1, fp
	mov r2, sb
	str r4, [r3, #4]
	bl NNS_G2dSetImagePaletteLocation
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end NNS_G2dLoadPaletteEx

	arm_func_start NNSi_G2dInitializeVRamLocation
NNSi_G2dInitializeVRamLocation: ; 0x020B8928
	mov r2, #0
	mvn r1, #0
_020B8930:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #3
	blt _020B8930
	bx lr
	arm_func_end NNSi_G2dInitializeVRamLocation

	arm_func_start NNSi_G2dSetVramLocation
NNSi_G2dSetVramLocation: ; 0x020B8944
	str r2, [r0, r1, lsl #2]
	bx lr
	arm_func_end NNSi_G2dSetVramLocation

	arm_func_start NNSi_G2dGetVramLocation
NNSi_G2dGetVramLocation: ; 0x020B894C
	ldr r0, [r0, r1, lsl #2]
	bx lr
	arm_func_end NNSi_G2dGetVramLocation

	arm_func_start NNSi_G2dSrtcSetTrans
NNSi_G2dSrtcSetTrans: ; 0x020B8954
	ldr r3, [r0]
	cmp r3, #1
	bxne lr
	ldrh r3, [r0, #0x12]
	orr r3, r3, #8
	strh r3, [r0, #0x12]
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	bx lr
	arm_func_end NNSi_G2dSrtcSetTrans

	arm_func_start NNSi_G2dSrtcSetSRTRotZ
NNSi_G2dSrtcSetSRTRotZ: ; 0x020B8978
	ldr r2, [r0]
	cmp r2, #1
	bxne lr
	ldrh r2, [r0, #0x12]
	orr r2, r2, #4
	strh r2, [r0, #0x12]
	strh r1, [r0, #0x10]
	bx lr
	arm_func_end NNSi_G2dSrtcSetSRTRotZ

	arm_func_start NNSi_G2dSrtcSetSRTScale
NNSi_G2dSrtcSetSRTScale: ; 0x020B8998
	ldr r3, [r0]
	cmp r3, #1
	bxne lr
	ldrh r3, [r0, #0x12]
	orr r3, r3, #2
	strh r3, [r0, #0x12]
	stmib r0, {r1, r2}
	bx lr
	arm_func_end NNSi_G2dSrtcSetSRTScale

	arm_func_start NNSi_G2dSrtcInitControl
NNSi_G2dSrtcInitControl: ; 0x020B89B8
	ldr ip, _020B89C4 ; =NNSi_G2dSrtcSetInitialValue
	str r1, [r0]
	bx ip
	.align 2, 0
_020B89C4: .word NNSi_G2dSrtcSetInitialValue
	arm_func_end NNSi_G2dSrtcInitControl

	arm_func_start NNSi_G2dSrtcSetInitialValue
NNSi_G2dSrtcSetInitialValue: ; 0x020B89C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r1, r4, #4
	mov r0, #0
	mov r2, #0x18
	bl MIi_CpuClear16
	mov r0, #0x1000
	str r0, [r4, #4]
	str r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end NNSi_G2dSrtcSetInitialValue

	arm_func_start NNSi_G2dInitializeNode
NNSi_G2dInitializeNode: ; 0x020B89F0
	mov r2, #0
	str r2, [r0]
	str r1, [r0, #4]
	mov r1, #1
	str r1, [r0, #8]
	ldr ip, _020B8A10 ; =NNSi_G2dSrtcInitControl
	add r0, r0, #0xc
	bx ip
	.align 2, 0
_020B8A10: .word NNSi_G2dSrtcInitControl
	arm_func_end NNSi_G2dInitializeNode

	arm_func_start ApplyCurrentAnimResult_
ApplyCurrentAnimResult_: ; 0x020B8A14
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldr r1, [r4, #4]
	ldrh r1, [r1, #4]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl NNS_G2dGetAnimCtrlCurrentElement
	mov r0, r4
	bl NNS_G2dGetAnimCtrlCurrentElement
	mov r5, r0
	ldr r6, [r4, #0x34]
	ldrh r1, [r5]
	mov r0, r6
	bl NNS_G2dGetCellDataByIdx
	str r0, [r4, #0x30]
	ldr r1, [r4, #0x1c]
	add r0, r4, #0x3c
	ldr r2, [r1, #4]
	mov r1, #1
	and r7, r2, #0xff
	bl NNSi_G2dSrtcInitControl
	cmp r7, #0
	beq _020B8AB4
	cmp r7, #2
	bne _020B8A8C
	ldrsh r1, [r5, #4]
	ldrsh r2, [r5, #6]
	add r0, r4, #0x3c
	bl NNSi_G2dSrtcSetTrans
	b _020B8AB4
_020B8A8C:
	add r0, r4, #0x3c
	ldmib r5, {r1, r2}
	bl NNSi_G2dSrtcSetSRTScale
	ldrh r1, [r5, #2]
	add r0, r4, #0x3c
	bl NNSi_G2dSrtcSetSRTRotZ
	ldrsh r1, [r5, #0xc]
	ldrsh r2, [r5, #0xe]
	add r0, r4, #0x3c
	bl NNSi_G2dSrtcSetTrans
_020B8AB4:
	ldr r2, [r6, #0xc]
	cmp r2, #0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0x38]
	mvn r0, #0
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrh r1, [r5]
	ldr r2, [r2, #4]
	ldr r0, [r4, #0x38]
	add r3, r2, r1, lsl #3
	ldmia r3, {r1, r2}
	bl NNS_G2dSetCellTransferStateRequested
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ApplyCurrentAnimResult_

	arm_func_start NNS_G2dInitCellAnimation
NNS_G2dInitCellAnimation: ; 0x020B8B04
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	str r2, [r5, #0x34]
	mvn r2, #0
	add r0, r5, #0x3c
	mov r1, #1
	str r2, [r5, #0x38]
	bl NNSi_G2dSrtcInitControl
	mov r0, r5
	bl NNS_G2dInitAnimCtrl
	mov r0, r5
	mov r1, r4
	bl NNS_G2dSetCellAnimationSequence
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNS_G2dInitCellAnimation

	arm_func_start NNS_G2dInitCellAnimationVramTransfered
NNS_G2dInitCellAnimationVramTransfered: ; 0x020B8B40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r4, r2
	ldr r2, [r4, #0xc]
	mov r5, r1
	ldr r1, [r2]
	ldr r2, [sp, #0x34]
	str r1, [sp]
	ldr r1, [sp, #0x38]
	str r2, [sp, #4]
	mov r6, r3
	mov r7, r0
	ldr ip, [sp, #0x3c]
	str r1, [sp, #8]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x30]
	mov r0, r6
	str ip, [sp, #0xc]
	bl NNSi_G2dInitCellTransferState
	str r6, [r7, #0x38]
	str r4, [r7, #0x34]
	add r0, r7, #0x3c
	mov r1, #1
	str r6, [r7, #0x38]
	bl NNSi_G2dSrtcInitControl
	mov r0, r7
	bl NNS_G2dInitAnimCtrl
	mov r0, r7
	mov r1, r5
	bl NNS_G2dSetCellAnimationSequence
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNS_G2dInitCellAnimationVramTransfered

	arm_func_start NNS_G2dSetCellAnimationSequence
NNS_G2dSetCellAnimationSequence: ; 0x020B8BC4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NNS_G2dBindAnimCtrl
	mov r0, r4
	bl ApplyCurrentAnimResult_
	ldmia sp!, {r4, pc}
	arm_func_end NNS_G2dSetCellAnimationSequence

	arm_func_start NNS_G2dTickCellAnimation
NNS_G2dTickCellAnimation: ; 0x020B8BDC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NNS_G2dTickAnimCtrl
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ApplyCurrentAnimResult_
	ldmia sp!, {r4, pc}
	arm_func_end NNS_G2dTickCellAnimation

	arm_func_start NNS_G2dSetCellAnimationCurrentFrame
NNS_G2dSetCellAnimationCurrentFrame: ; 0x020B8BFC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NNS_G2dSetAnimCtrlCurrentFrame
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ApplyCurrentAnimResult_
	ldmia sp!, {r4, pc}
	arm_func_end NNS_G2dSetCellAnimationCurrentFrame

	arm_func_start SetMCDataToMCInstanceImpl_
SetMCDataToMCInstanceImpl_: ; 0x020B8C1C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r1
	str r0, [sp]
	str sl, [r0]
	ldr r0, [r0, #8]
	mov sb, r2
	cmp r0, #1
	bne _020B8D84
	ldrh r1, [sl, #2]
	ldr r0, [sp]
	mov r4, #0
	ldr r5, [r0, #0xc]
	cmp r1, #0
	bls _020B8C7C
	mov r3, r4
	mov r0, #0x5c
_020B8C5C:
	mla r1, r4, r0, r5
	str r3, [r1, #0x58]
	ldrh r2, [sl, #2]
	add r1, r4, #1
	mov r1, r1, lsl #0x10
	cmp r2, r1, lsr #16
	mov r4, r1, lsr #0x10
	bhi _020B8C5C
_020B8C7C:
	ldrh r0, [sl]
	mov r8, #0
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B8C8C:
	ldr r0, [sl, #4]
	mov r1, #0x5c
	add r6, r0, r8, lsl #3
	ldrh r0, [r6, #6]
	and r0, r0, #0xff00
	mov r0, r0, lsl #8
	mov r0, r0, lsr #0x10
	mla r7, r0, r1, r5
	ldr r0, [r7, #0x58]
	cmp r0, #0
	bne _020B8D68
	ldr r0, [sp]
	ldrh r1, [r6]
	ldr r0, [r0, #4]
	bl NNS_G2dGetAnimSequenceByIdx
	mov r4, r0
	mov r0, r7
	mov r1, r4
	bl NNS_G2dSetCellAnimationSequence
	mov r0, #1
	str r0, [r7, #0xc]
	ldrh r0, [r6, #6]
	and r0, r0, #0xf
	cmp r0, #1
	bne _020B8D60
	ldrh r3, [r4]
	mov r6, #0
	mov r1, r6
	cmp r3, #0
	bls _020B8D20
	ldr r2, [r4, #0xc]
_020B8D08:
	add r0, r2, r1, lsl #3
	ldrh r0, [r0, #4]
	add r1, r1, #1
	cmp r1, r3
	add r6, r6, r0
	blo _020B8D08
_020B8D20:
	mov r0, r7
	bl NNSi_G2dIsAnimCtrlLoopAnim
	cmp r0, #0
	beq _020B8D4C
	mov r0, sb
	mov r1, r6
	bl _u32_div_f
	mov r0, r7
	mov r1, r1, lsl #0xc
	bl NNS_G2dTickCellAnimation
	b _020B8D60
_020B8D4C:
	cmp sb, r6
	movlo r6, sb
	mov r0, r7
	mov r1, r6, lsl #0xc
	bl NNS_G2dTickCellAnimation
_020B8D60:
	mov r0, #1
	str r0, [r7, #0x58]
_020B8D68:
	ldrh r1, [sl]
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	cmp r1, r0, lsr #16
	mov r8, r0, lsr #0x10
	bhi _020B8C8C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B8D84:
	ldr r0, [sp]
	ldrh r1, [sl]
	ldr fp, [r0, #0xc]
	mov r7, #0
	cmp r1, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B8D9C:
	mov r0, #0x28
	mul r2, r7, r0
	ldr r3, [sl, #4]
	mov r0, r7, lsl #3
	ldrh r1, [r3, r0]
	ldr r0, [sp]
	ldr r6, [fp, r2]
	ldr r0, [r0, #4]
	add r5, r3, r7, lsl #3
	bl NNS_G2dGetAnimSequenceByIdx
	mov r4, r0
	mov r0, r6
	mov r1, r4
	bl NNS_G2dSetCellAnimationSequence
	mov r0, #1
	str r0, [r6, #0xc]
	ldrh r0, [r5, #6]
	and r0, r0, #0xf
	cmp r0, #1
	bne _020B8E5C
	ldrh r3, [r4]
	mov r8, #0
	mov r1, r8
	cmp r3, #0
	bls _020B8E1C
	ldr r2, [r4, #0xc]
_020B8E04:
	add r0, r2, r1, lsl #3
	ldrh r0, [r0, #4]
	add r1, r1, #1
	cmp r1, r3
	add r8, r8, r0
	blo _020B8E04
_020B8E1C:
	mov r0, r6
	bl NNSi_G2dIsAnimCtrlLoopAnim
	cmp r0, #0
	beq _020B8E48
	mov r0, sb
	mov r1, r8
	bl _u32_div_f
	mov r0, r6
	mov r1, r1, lsl #0xc
	bl NNS_G2dTickCellAnimation
	b _020B8E5C
_020B8E48:
	cmp sb, r8
	movlo r8, sb
	mov r0, r6
	mov r1, r8, lsl #0xc
	bl NNS_G2dTickCellAnimation
_020B8E5C:
	mov r0, #0x28
	mla r3, r7, r0, fp
	mov r0, #1
	str r0, [r3, #8]
	ldrsh r1, [r5, #2]
	ldrsh r2, [r5, #4]
	add r0, r3, #0xc
	bl NNSi_G2dSrtcSetTrans
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [sl]
	mov r7, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020B8D9C
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end SetMCDataToMCInstanceImpl_

	arm_func_start NNS_G2dSetAnimSequenceToMCAnimation
NNS_G2dSetAnimSequenceToMCAnimation: ; 0x020B8E98
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	bl NNS_G2dBindAnimCtrl
	mov r0, #0
	strh r0, [r4, #0x30]
	ldr r0, [r4, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r4
	bl NNS_G2dGetAnimCtrlCurrentElement
	mov r5, r0
	ldrh r1, [r5]
	ldr r0, [r4, #0x44]
	bl NNS_G2dGetMultiCellDataByIdx
	ldr r1, [r4, #0x1c]
	mov r7, r0
	ldr r1, [r1, #4]
	add r0, r4, #0x48
	and r6, r1, #0xff
	mov r1, #1
	bl NNSi_G2dSrtcInitControl
	cmp r6, #0
	beq _020B8F3C
	cmp r6, #2
	bne _020B8F14
	ldrsh r1, [r5, #4]
	ldrsh r2, [r5, #6]
	add r0, r4, #0x48
	bl NNSi_G2dSrtcSetTrans
	b _020B8F3C
_020B8F14:
	add r0, r4, #0x48
	ldmib r5, {r1, r2}
	bl NNSi_G2dSrtcSetSRTScale
	ldrh r1, [r5, #2]
	add r0, r4, #0x48
	bl NNSi_G2dSrtcSetSRTRotZ
	ldrsh r1, [r5, #0xc]
	ldrsh r2, [r5, #0xe]
	add r0, r4, #0x48
	bl NNSi_G2dSrtcSetTrans
_020B8F3C:
	ldrh r2, [r4, #0x30]
	mov r1, r7
	add r0, r4, #0x34
	bl SetMCDataToMCInstanceImpl_
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNS_G2dSetAnimSequenceToMCAnimation

	arm_func_start NNS_G2dGetMCBankNumNodesRequired
NNS_G2dGetMCBankNumNodesRequired: ; 0x020B8F50
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldrh r0, [r4]
	mov r5, #0
	mov r6, r5
	cmp r0, #0
	bls _020B8F9C
_020B8F6C:
	mov r0, r4
	mov r1, r6
	bl NNS_G2dGetMultiCellDataByIdx
	ldrh r0, [r0]
	ldrh r1, [r4]
	cmp r0, r5
	movhi r5, r0
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	cmp r1, r0, lsr #16
	mov r6, r0, lsr #0x10
	bhi _020B8F6C
_020B8F9C:
	mov r0, r5
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G2dGetMCBankNumNodesRequired

	arm_func_start NNS_G2dTickMCInstance
NNS_G2dTickMCInstance: ; 0x020B8FA4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	ldr r0, [r7, #8]
	mov r6, r1
	cmp r0, #1
	ldr r0, [r7]
	mov r4, #0
	ldr r5, [r7, #0xc]
	bne _020B9004
	ldrh r0, [r0, #2]
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
	mov r8, #0x5c
_020B8FD8:
	mla r0, r4, r8, r5
	mov r1, r6
	bl NNS_G2dTickCellAnimation
	ldr r1, [r7]
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [r1, #2]
	mov r4, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020B8FD8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020B9004:
	ldrh r0, [r0]
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
	mov r8, #0x28
_020B9014:
	mul r0, r4, r8
	ldr r0, [r5, r0]
	mov r1, r6
	bl NNS_G2dTickCellAnimation
	ldr r1, [r7]
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [r1]
	mov r4, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020B9014
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end NNS_G2dTickMCInstance

	arm_func_start NNS_G2dTickMCAnimation
NNS_G2dTickMCAnimation: ; 0x020B9044
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	ldr r2, [r4]
	mov r6, r1
	ldrh r5, [r2, #4]
	bl NNS_G2dTickAnimCtrl
	cmp r0, #0
	beq _020B9114
	ldrh r0, [r4, #0x30]
	add r0, r0, r5
	strh r0, [r4, #0x30]
	ldr r0, [r4, #4]
	ldrh r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r4
	bl NNS_G2dGetAnimCtrlCurrentElement
	mov r5, r0
	ldrh r1, [r5]
	ldr r0, [r4, #0x44]
	bl NNS_G2dGetMultiCellDataByIdx
	ldr r1, [r4, #0x1c]
	mov r7, r0
	ldr r1, [r1, #4]
	add r0, r4, #0x48
	and r6, r1, #0xff
	mov r1, #1
	bl NNSi_G2dSrtcInitControl
	cmp r6, #0
	beq _020B9100
	cmp r6, #2
	bne _020B90D8
	ldrsh r1, [r5, #4]
	ldrsh r2, [r5, #6]
	add r0, r4, #0x48
	bl NNSi_G2dSrtcSetTrans
	b _020B9100
_020B90D8:
	add r0, r4, #0x48
	ldmib r5, {r1, r2}
	bl NNSi_G2dSrtcSetSRTScale
	ldrh r1, [r5, #2]
	add r0, r4, #0x48
	bl NNSi_G2dSrtcSetSRTRotZ
	ldrsh r1, [r5, #0xc]
	ldrsh r2, [r5, #0xe]
	add r0, r4, #0x48
	bl NNSi_G2dSrtcSetTrans
_020B9100:
	ldrh r2, [r4, #0x30]
	mov r1, r7
	add r0, r4, #0x34
	bl SetMCDataToMCInstanceImpl_
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B9114:
	mov r1, r6
	add r0, r4, #0x34
	bl NNS_G2dTickMCInstance
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNS_G2dTickMCAnimation

	arm_func_start NNS_G2dSetMCAnimationCurrentFrame
NNS_G2dSetMCAnimationCurrentFrame: ; 0x020B9124
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	bl NNS_G2dSetAnimCtrlCurrentFrame
	cmp r0, #0
	ldrne r0, [r4, #4]
	ldrneh r0, [r0, #4]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r4
	bl NNS_G2dGetAnimCtrlCurrentElement
	mov r5, r0
	ldrh r1, [r5]
	ldr r0, [r4, #0x44]
	bl NNS_G2dGetMultiCellDataByIdx
	ldr r1, [r4, #0x1c]
	mov r7, r0
	ldr r1, [r1, #4]
	add r0, r4, #0x48
	and r6, r1, #0xff
	mov r1, #1
	bl NNSi_G2dSrtcInitControl
	cmp r6, #0
	beq _020B91C4
	cmp r6, #2
	bne _020B919C
	ldrsh r1, [r5, #4]
	ldrsh r2, [r5, #6]
	add r0, r4, #0x48
	bl NNSi_G2dSrtcSetTrans
	b _020B91C4
_020B919C:
	add r0, r4, #0x48
	ldmib r5, {r1, r2}
	bl NNSi_G2dSrtcSetSRTScale
	ldrh r1, [r5, #2]
	add r0, r4, #0x48
	bl NNSi_G2dSrtcSetSRTRotZ
	ldrsh r1, [r5, #0xc]
	ldrsh r2, [r5, #0xe]
	add r0, r4, #0x48
	bl NNSi_G2dSrtcSetTrans
_020B91C4:
	ldrh r2, [r4, #0x30]
	mov r1, r7
	add r0, r4, #0x34
	bl SetMCDataToMCInstanceImpl_
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNS_G2dSetMCAnimationCurrentFrame

	arm_func_start NNS_G2dInitMCAnimation
NNS_G2dInitMCAnimation: ; 0x020B91D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r5, #0
	str r5, [r0, #0x3c]
	ldr r7, [sp, #0x28]
	str r5, [r0, #0x34]
	mov sl, r1
	str r7, [r0, #0x38]
	str r0, [sp]
	movs r8, r3
	mov sb, r2
	str sl, [r0, #0x40]
	ldr fp, [sp, #0x2c]
	beq _020B925C
_020B920C:
	mov r0, #0x28
	mul r4, r5, r0
	mov r1, #1
	add r0, sl, r4
	bl NNSi_G2dInitializeNode
	mov r0, #0x58
	mla r6, r5, r0, sb
	mov r0, r7
	mov r1, #0
	str r6, [sl, r4]
	bl NNS_G2dGetAnimSequenceByIdx
	mov r1, r0
	mov r0, r6
	mov r2, fp
	bl NNS_G2dInitCellAnimation
	add r0, r5, #1
	mov r0, r0, lsl #0x10
	cmp r8, r0, lsr #16
	mov r5, r0, lsr #0x10
	bhi _020B920C
_020B925C:
	ldr r0, [sp]
	bl NNS_G2dInitAnimCtrl
	ldr r0, [sp]
	ldr r3, [sp, #0x30]
	ldr r2, [sp]
	add r0, r0, #0x48
	mov r1, #1
	str r3, [r2, #0x44]
	bl NNSi_G2dSrtcInitControl
	ldr r0, [sp]
	mov r1, #0
	strh r1, [r0, #0x30]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end NNS_G2dInitMCAnimation

	arm_func_start NNSi_G2dIdentity
NNSi_G2dIdentity: ; 0x020B9290
	stmdb sp!, {r4, lr}
	ldr r0, _020B9318 ; =_021D94D8
	ldr ip, [r0, #0xc]
	ldr r1, [r0, #4]
	mov r0, #0x18
	mul r3, ip, r0
	cmp r1, #0
	beq _020B92C8
	ldr r1, _020B931C ; =_021D9678
	mov r2, #0
	ldr r0, _020B9320 ; =_021D967C
	str r2, [r1, r3]
	str r2, [r0, r3]
	b _020B9308
_020B92C8:
	ldr r1, _020B9324 ; =_021D9668
	mov r2, #0x1000
	str r2, [r1, r3]
	add r4, r1, r3
	mov r1, #0
	str r1, [r4, #4]
	ldr r0, _020B9328 ; =_021D9968
	str r1, [r4, #8]
	str r2, [r4, #0xc]
	str r1, [r4, #0x10]
	add lr, r0, r3
	str r1, [r4, #0x14]
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
_020B9308:
	ldr r0, _020B932C ; =_021D94E8
	mov r1, #0
	str r1, [r0, ip, lsl #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B9318: .word _021D94D8
_020B931C: .word _021D9678
_020B9320: .word _021D967C
_020B9324: .word _021D9668
_020B9328: .word _021D9968
_020B932C: .word _021D94E8
	arm_func_end NNSi_G2dIdentity

	arm_func_start NNSi_G2dMCMStoreCurrentMtxToMtxCache
NNSi_G2dMCMStoreCurrentMtxToMtxCache: ; 0x020B9330
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020B9454 ; =_021D94D8
	ldr r1, _020B9458 ; =_021D9568
	ldr r0, [r0, #0xc]
	mov r2, #1
	mov r0, r0, lsl #0x10
	add r3, r1, r0, lsr #13
	ldrh r0, [r3, #4]
	cmp r0, #1
	cmpne r0, #2
	movne r2, #0
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _020B9454 ; =_021D94D8
	ldrh r4, [r3, #2]
	ldrh r5, [r0]
	mov r2, #0x10
	cmp r5, #0x1f
	addlo r1, r5, #1
	strloh r1, [r0]
	ldr r0, _020B945C ; =_021D9C68
	strh r5, [r3]
	add r0, r0, r5, lsl #5
	add r1, r0, #0x10
	mvn r0, #0
	bl MIi_CpuClearFast
	ldr r0, _020B9454 ; =_021D94D8
	ldr r1, [r0, #4]
	ldr ip, [r0, #0xc]
	cmp r1, #0
	ldreq r1, _020B9460 ; =_021D9968
	mov r0, #0x18
	mlaeq r1, ip, r0, r1
	beq _020B93DC
	mul r3, ip, r0
	ldr r1, _020B9464 ; =_021D9678
	ldr r0, _020B9468 ; =_021109DC
	ldr r2, [r1, r3]
	ldr r1, _020B946C ; =_021D967C
	str r2, [r0, #0x18]
	ldr r2, [r1, r3]
	ldr r1, _020B9470 ; =_021109E4
	str r2, [r0, #0x1c]
_020B93DC:
	mov r2, ip, lsl #0x10
	ldr r0, _020B9458 ; =_021D9568
	mov r2, r2, lsr #0xd
	ldrh ip, [r0, r2]
	ldr lr, _020B945C ; =_021D9C68
	ldr r3, [r1]
	ldr r2, _020B9454 ; =_021D94D8
	str r3, [lr, ip, lsl #5]
	ldr r3, [r1, #4]
	add ip, lr, ip, lsl #5
	str r3, [ip, #4]
	ldr r3, [r1, #8]
	ldr r2, [r2, #0xc]
	str r3, [ip, #8]
	ldr r3, [r1, #0xc]
	mov r1, r2, lsl #0x10
	str r3, [ip, #0xc]
	movs lr, r1, lsr #0x10
	ldmmiia sp!, {r3, r4, r5, pc}
	mov r1, #3
_020B942C:
	add r3, r0, lr, lsl #3
	ldrh r2, [r3, #2]
	mov ip, lr, lsl #3
	cmp r4, r2
	ldmneia sp!, {r3, r4, r5, pc}
	strh r1, [r3, #4]
	strh r5, [r0, ip]
	subs lr, lr, #1
	bpl _020B942C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B9454: .word _021D94D8
_020B9458: .word _021D9568
_020B945C: .word _021D9C68
_020B9460: .word _021D9968
_020B9464: .word _021D9678
_020B9468: .word _021109DC
_020B946C: .word _021D967C
_020B9470: .word _021109E4
	arm_func_end NNSi_G2dMCMStoreCurrentMtxToMtxCache

	arm_func_start RndCoreCBFuncBeforeCell_
RndCoreCBFuncBeforeCell_: ; 0x020B9474
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020B9570 ; =_021D94D8
	mov r6, r0
	ldr r0, [r2, #8]
	mov r5, r1
	ldr r4, [r0, #0x74]
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _020B9504
	ldr r0, [r2, #4]
	cmp r0, #0
	ldreq r2, [r2, #0xc]
	ldreq r1, _020B9574 ; =_021D9668
	mov r0, #0x18
	mlaeq r1, r2, r0, r1
	beq _020B94DC
	ldr r1, [r2, #0xc]
	mul r3, r1, r0
	ldr r1, _020B9578 ; =_021D9678
	ldr r0, _020B957C ; =_021109DC
	ldr r2, [r1, r3]
	ldr r1, _020B9580 ; =_021D967C
	str r2, [r0, #0x18]
	ldr r2, [r1, r3]
	ldr r1, _020B9584 ; =_021109E4
	str r2, [r0, #0x1c]
_020B94DC:
	ldr r3, [r4, #0x34]
	mov r0, r5
	mov r2, r4
	blx r3
	cmp r0, #0
	moveq r0, #0
	streq r0, [r6, #0x30]
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r6, #0x30]
_020B9504:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _020B9570 ; =_021D94D8
	ldr r1, [r0, #4]
	cmp r1, #0
	ldr r1, [r0, #0xc]
	ldreq r2, _020B9574 ; =_021D9668
	mov r0, #0x18
	mlaeq r3, r1, r0, r2
	beq _020B9554
	mul r3, r1, r0
	ldr r1, _020B9578 ; =_021D9678
	ldr r0, _020B957C ; =_021109DC
	ldr r2, [r1, r3]
	ldr r1, _020B9580 ; =_021D967C
	str r2, [r0, #0x18]
	ldr r1, [r1, r3]
	ldr r3, _020B9584 ; =_021109E4
	str r1, [r0, #0x1c]
_020B9554:
	ldr r0, _020B9570 ; =_021D94D8
	ldr r6, [r4, #0x38]
	ldr r0, [r0, #8]
	mov r1, r4
	mov r2, r5
	blx r6
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B9570: .word _021D94D8
_020B9574: .word _021D9668
_020B9578: .word _021D9678
_020B957C: .word _021109DC
_020B9580: .word _021D967C
_020B9584: .word _021109E4
	arm_func_end RndCoreCBFuncBeforeCell_

	arm_func_start RndCoreCBFuncAfterCell_
RndCoreCBFuncAfterCell_: ; 0x020B9588
	stmdb sp!, {r4, lr}
	ldr r3, _020B95F4 ; =_021D94D8
	mov r2, r1
	ldr r0, [r3, #8]
	ldr r1, [r0, #0x74]
	ldr r4, [r1, #0x3c]
	cmp r4, #0
	ldmeqia sp!, {r4, pc}
	ldr r4, [r3, #4]
	ldr ip, [r3, #0xc]
	cmp r4, #0
	ldreq lr, _020B95F8 ; =_021D9668
	mov r3, #0x18
	mlaeq r3, ip, r3, lr
	beq _020B95E8
	mul r4, ip, r3
	ldr r3, _020B95FC ; =_021D9678
	ldr ip, _020B9600 ; =_021109DC
	ldr lr, [r3, r4]
	ldr r3, _020B9604 ; =_021D967C
	str lr, [ip, #0x18]
	ldr lr, [r3, r4]
	ldr r3, _020B9608 ; =_021109E4
	str lr, [ip, #0x1c]
_020B95E8:
	ldr ip, [r1, #0x3c]
	blx ip
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B95F4: .word _021D94D8
_020B95F8: .word _021D9668
_020B95FC: .word _021D9678
_020B9600: .word _021109DC
_020B9604: .word _021D967C
_020B9608: .word _021109E4
	arm_func_end RndCoreCBFuncAfterCell_

	arm_func_start RndCoreCBFuncBeforeOBJ_
RndCoreCBFuncBeforeOBJ_: ; 0x020B960C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	ldr r3, _020B97E0 ; =_021D94D8
	mov r6, r0
	ldr r0, [r3, #8]
	mov r5, r1
	mov r4, r2
	bl NNS_G2dGetRendererPaletteTbl
	cmp r0, #0
	beq _020B965C
	ldrh r1, [r6, #0x3c]
	and r1, r1, #0xf000
	mov r1, r1, lsl #4
	mov r1, r1, lsr #0x10
	bl NNS_G2dGetPaletteTableValue
	ldr r1, [r6, #0x3c]
	mov r0, r0, lsl #0x1c
	bic r1, r1, #0xf000
	orr r0, r1, r0, lsr #16
	str r0, [r6, #0x3c]
_020B965C:
	ldr r0, _020B97E0 ; =_021D94D8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x84]
	cmp r0, #0
	beq _020B9768
	ldr r0, [r1, #0x84]
	tst r0, #1
	beq _020B9694
	ldrh r0, [r1, #0x88]
	ldr r1, [r6, #0x3c]
	bic r1, r1, #0xc00
	mov r0, r0, lsl #0x1e
	orr r0, r1, r0, lsr #20
	str r0, [r6, #0x3c]
_020B9694:
	ldr r0, _020B97E0 ; =_021D94D8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x84]
	tst r0, #2
	beq _020B96C0
	ldrh r0, [r1, #0x8a]
	ldr r1, [r6, #0x3c]
	bic r1, r1, #0xf000
	mov r0, r0, lsl #0x1c
	orr r0, r1, r0, lsr #16
	str r0, [r6, #0x3c]
_020B96C0:
	ldr r0, _020B97E0 ; =_021D94D8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x84]
	tst r0, #0x10
	beq _020B96F4
	ldr r2, [r6, #0x3c]
	ldrh r0, [r1, #0x94]
	mov r1, r2, lsl #0x10
	bic r2, r2, #0xf000
	add r0, r0, r1, lsr #28
	mov r0, r0, lsl #0x1c
	orr r0, r2, r0, lsr #16
	str r0, [r6, #0x3c]
_020B96F4:
	ldr r0, _020B97E0 ; =_021D94D8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x84]
	tst r0, #4
	beq _020B9724
	ldr r0, [r1, #0x90]
	cmp r0, #0
	ldr r0, [r6, #0x38]
	orrne r0, r0, #0x1000
	strne r0, [r6, #0x38]
	biceq r0, r0, #0x1000
	streq r0, [r6, #0x38]
_020B9724:
	ldr r0, _020B97E0 ; =_021D94D8
	ldr r1, [r0, #8]
	ldr r0, [r1, #0x84]
	tst r0, #8
	beq _020B9768
	ldr r0, [r6, #0x38]
	ldrh r2, [r6, #0x3c]
	ldr r1, [r1, #0x8c]
	bic r0, r0, #0xc00
	orr r0, r0, r1, lsl #10
	str r0, [r6, #0x38]
	ldrh r0, [r6, #0x3c]
	and r1, r2, #0xf000
	mov r1, r1, asr #0xc
	bic r0, r0, #0xf000
	orr r0, r0, r1, lsl #12
	strh r0, [r6, #0x3c]
_020B9768:
	ldr r2, _020B97E0 ; =_021D94D8
	ldr r0, [r2, #8]
	ldr r1, [r0, #0x74]
	ldr r3, [r1, #0x40]
	cmp r3, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r3, [r2, #4]
	cmp r3, #0
	ldr r3, [r2, #0xc]
	ldreq r6, _020B97E4 ; =_021D9668
	mov r2, #0x18
	mlaeq r6, r3, r2, r6
	beq _020B97C4
	mul ip, r3, r2
	ldr r3, _020B97E8 ; =_021D9678
	ldr r2, _020B97EC ; =_021109DC
	ldr r6, [r3, ip]
	ldr r3, _020B97F0 ; =_021D967C
	str r6, [r2, #0x18]
	ldr r3, [r3, ip]
	ldr r6, _020B97F4 ; =_021109E4
	str r3, [r2, #0x1c]
_020B97C4:
	str r6, [sp]
	ldr r6, [r1, #0x40]
	mov r2, r5
	mov r3, r4
	blx r6
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020B97E0: .word _021D94D8
_020B97E4: .word _021D9668
_020B97E8: .word _021D9678
_020B97EC: .word _021109DC
_020B97F0: .word _021D967C
_020B97F4: .word _021109E4
	arm_func_end RndCoreCBFuncBeforeOBJ_

	arm_func_start RndCoreCBFuncAfterOBJ_
RndCoreCBFuncAfterOBJ_: ; 0x020B97F8
	stmdb sp!, {r3, r4, r5, lr}
	ldr lr, _020B9874 ; =_021D94D8
	mov ip, r1
	ldr r0, [lr, #8]
	mov r3, r2
	ldr r1, [r0, #0x74]
	ldr r2, [r1, #0x44]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, [lr, #4]
	cmp r2, #0
	ldreq lr, [lr, #0xc]
	ldreq r4, _020B9878 ; =_021D9668
	mov r2, #0x18
	mlaeq r5, lr, r2, r4
	beq _020B9860
	ldr r4, [lr, #0xc]
	mul r5, r4, r2
	ldr r4, _020B987C ; =_021D9678
	ldr r2, _020B9880 ; =_021109DC
	ldr lr, [r4, r5]
	ldr r4, _020B9884 ; =_021D967C
	str lr, [r2, #0x18]
	ldr r4, [r4, r5]
	ldr r5, _020B9888 ; =_021109E4
	str r4, [r2, #0x1c]
_020B9860:
	str r5, [sp]
	ldr lr, [r1, #0x44]
	mov r2, ip
	blx lr
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B9874: .word _021D94D8
_020B9878: .word _021D9668
_020B987C: .word _021D9678
_020B9880: .word _021109DC
_020B9884: .word _021D967C
_020B9888: .word _021109E4
	arm_func_end RndCoreCBFuncAfterOBJ_

	arm_func_start DrawCellImpl_
DrawCellImpl_: ; 0x020B988C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r7, _020B9CA8 ; =_021D94D8
	mov r4, r0
	ldr fp, [r7, #8]
	ldr r0, [fp, #0x7c]
	ldr sb, [fp, #0x70]
	tst r0, #2
	beq _020B9A7C
	ldr r0, [sb, #0x14]
	cmp r0, #0
	beq _020B99EC
	ldr r0, [r7, #4]
	mov r1, #0
	cmp r0, #0
	bne _020B98E0
	ldr r2, _020B9CAC ; =_021109DC
	ldr r0, _020B9CB0 ; =0x0000FFFE
	ldrh r2, [r2]
	cmp r2, r0
	movne r0, #1
	bne _020B98E4
_020B98E0:
	mov r0, #0
_020B98E4:
	cmp r0, #0
	beq _020B9970
	ldr r0, _020B9CA8 ; =_021D94D8
	ldr r0, [r0, #0xf94]
	cmp r0, #0
	beq _020B994C
	ldr r0, _020B9CB4 ; =_021D9FD8
	ldr r1, _020B9CB8 ; =_021DA06C
	ldrh r0, [r0, #0x90]
	ldr r1, [r1, r0, lsl #2]
	cmp r1, #0
	bne _020B9970
	bl NNSi_G2dMCMStoreCurrentMtxToMtxCache
	ldr r0, _020B9CA8 ; =_021D94D8
	ldr r2, _020B9CBC ; =_021D9568
	ldr r0, [r0, #0xc]
	ldr r1, _020B9CB4 ; =_021D9FD8
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0xd
	ldrh r3, [r2, r0]
	ldr r5, _020B9CC0 ; =_021D9C68
	ldrh r2, [r1, #0x90]
	ldr r0, _020B9CB8 ; =_021DA06C
	add r1, r5, r3, lsl #5
	str r1, [r0, r2, lsl #2]
	b _020B9970
_020B994C:
	bl NNSi_G2dMCMStoreCurrentMtxToMtxCache
	ldr r0, _020B9CA8 ; =_021D94D8
	ldr r1, _020B9CBC ; =_021D9568
	ldr r0, [r0, #0xc]
	ldr r2, _020B9CC0 ; =_021D9C68
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0xd
	ldrh r0, [r1, r0]
	add r1, r2, r0, lsl #5
_020B9970:
	ldr r0, _020B9CA8 ; =_021D94D8
	ldr r2, [r0, #4]
	cmp r2, #0
	ldr r2, [r0, #0xc]
	ldreq r3, _020B9CC4 ; =_021D9668
	mov r0, #0x18
	mlaeq r0, r2, r0, r3
	beq _020B99B4
	mul r5, r2, r0
	ldr r0, _020B9CC8 ; =_021D9678
	ldr r2, _020B9CAC ; =_021109DC
	ldr r3, [r0, r5]
	ldr r0, _020B9CCC ; =_021D967C
	str r3, [r2, #0x18]
	ldr r3, [r0, r5]
	ldr r0, _020B9CD0 ; =_021109E4
	str r3, [r2, #0x1c]
_020B99B4:
	bl NNS_G2dSetRndCoreCurrentMtx2D
	ldr r1, _020B9CAC ; =_021109DC
	mvn r0, #0
	ldr r1, [r1, #4]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	mov r0, r4
	beq _020B99E4
	bl NNS_G2dRndCoreDrawCellVramTransfer
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B99E4:
	bl NNS_G2dRndCoreDrawCell
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B99EC:
	ldr r2, [r7, #0xc]
	ldr r1, _020B9CD4 ; =_021D94E8
	mov r0, fp
	ldr r1, [r1, r2, lsl #2]
	bl NNS_G2dSetRndCore3DSoftSpriteZvalue
	mov r0, r7
	ldr r1, [r0, #4]
	cmp r1, #0
	ldr r1, [r0, #0xc]
	ldreq r2, _020B9CC4 ; =_021D9668
	mov r0, #0x18
	mlaeq r0, r1, r0, r2
	beq _020B9A44
	mul r3, r1, r0
	ldr r0, _020B9CC8 ; =_021D9678
	ldr r1, _020B9CAC ; =_021109DC
	ldr r2, [r0, r3]
	ldr r0, _020B9CCC ; =_021D967C
	str r2, [r1, #0x18]
	ldr r2, [r0, r3]
	ldr r0, _020B9CD0 ; =_021109E4
	str r2, [r1, #0x1c]
_020B9A44:
	bl NNS_G2dSetRndCoreCurrentMtx3D
	ldr r1, _020B9CAC ; =_021109DC
	mvn r0, #0
	ldr r1, [r1, #4]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	mov r0, r4
	beq _020B9A74
	bl NNS_G2dRndCoreDrawCellVramTransfer
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B9A74:
	bl NNS_G2dRndCoreDrawCell
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B9A7C:
	cmp sb, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r8, _020B9CC4 ; =_021D9668
	ldr r6, _020B9CAC ; =_021109DC
	mvn r5, #0
_020B9A90:
	ldr r0, [sb, #0x10]
	cmp r0, #0
	beq _020B9C98
	ldr r0, [sb, #0x14]
	ldr sl, [r7, #8]
	cmp r0, #0
	mov r1, sb
	beq _020B9BFC
	str sb, [sl, #0x74]
	mov r0, sl
	bl NNS_G2dSetRndCoreSurface
	ldr r1, [sb, #0x28]
	ldr r2, [sb, #0x2c]
	mov r0, sl
	bl NNS_G2dSetRndCoreOamRegisterFunc
	mov r0, sl
	bl NNS_G2dRndCoreBeginRendering
	ldr r0, [r7, #4]
	mov r1, #0
	cmp r0, #0
	bne _020B9AF8
	ldrh r2, [r6]
	ldr r0, _020B9CB0 ; =0x0000FFFE
	cmp r2, r0
	movne r0, #1
	bne _020B9AFC
_020B9AF8:
	mov r0, #0
_020B9AFC:
	cmp r0, #0
	beq _020B9B84
	ldr r0, [r7, #0xf94]
	cmp r0, #0
	beq _020B9B64
	ldr r0, _020B9CB4 ; =_021D9FD8
	ldrh r1, [r0, #0x90]
	ldr r0, _020B9CD8 ; =_021DA068
	add r0, r0, r1, lsl #2
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _020B9B84
	bl NNSi_G2dMCMStoreCurrentMtxToMtxCache
	ldr r0, _020B9CB4 ; =_021D9FD8
	ldr r2, [r7, #0xc]
	ldrh r1, [r0, #0x90]
	mov r0, r2, lsl #0x10
	mov r2, r0, lsr #0xd
	ldr r0, _020B9CBC ; =_021D9568
	ldrh r3, [r0, r2]
	ldr r0, _020B9CD8 ; =_021DA068
	add r2, r0, r1, lsl #2
	ldr r0, _020B9CC0 ; =_021D9C68
	add r1, r0, r3, lsl #5
	str r1, [r2, #4]
	b _020B9B84
_020B9B64:
	bl NNSi_G2dMCMStoreCurrentMtxToMtxCache
	ldr r0, [r7, #0xc]
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0xd
	ldr r0, _020B9CBC ; =_021D9568
	ldrh r1, [r0, r1]
	ldr r0, _020B9CC0 ; =_021D9C68
	add r1, r0, r1, lsl #5
_020B9B84:
	ldr r0, [r7, #4]
	cmp r0, #0
	ldreq r2, [r7, #0xc]
	moveq r0, #0x18
	mlaeq r0, r2, r0, r8
	beq _020B9BBC
	ldr r3, [r7, #0xc]
	mov r2, #0x18
	mla sl, r3, r2, r8
	ldr r2, [sl, #0x10]
	ldr r0, _020B9CD0 ; =_021109E4
	str r2, [r6, #0x18]
	ldr r2, [sl, #0x14]
	str r2, [r6, #0x1c]
_020B9BBC:
	bl NNS_G2dSetRndCoreCurrentMtx2D
	ldr r1, [r6, #4]
	cmp r1, r5
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	mov r0, r4
	beq _020B9BE4
	bl NNS_G2dRndCoreDrawCellVramTransfer
	b _020B9BE8
_020B9BE4:
	bl NNS_G2dRndCoreDrawCell
_020B9BE8:
	ldr r1, [r7, #8]
	mov r0, #0
	str r0, [r1, #0x74]
	bl NNS_G2dRndCoreEndRendering
	b _020B9C98
_020B9BFC:
	mov r0, sl
	str sb, [sl, #0x74]
	bl NNS_G2dSetRndCoreSurface
	mov r0, sl
	bl NNS_G2dRndCoreBeginRendering
	ldr r2, [r7, #0xc]
	ldr r1, _020B9CD4 ; =_021D94E8
	mov r0, fp
	ldr r1, [r1, r2, lsl #2]
	bl NNS_G2dSetRndCore3DSoftSpriteZvalue
	ldr r0, [r7, #4]
	cmp r0, #0
	ldreq r1, [r7, #0xc]
	moveq r0, #0x18
	mlaeq r0, r1, r0, r8
	beq _020B9C5C
	ldr r2, [r7, #0xc]
	mov r1, #0x18
	mla r3, r2, r1, r8
	ldr r1, [r3, #0x10]
	ldr r0, _020B9CD0 ; =_021109E4
	str r1, [r6, #0x18]
	ldr r1, [r3, #0x14]
	str r1, [r6, #0x1c]
_020B9C5C:
	bl NNS_G2dSetRndCoreCurrentMtx3D
	ldr r1, [r6, #4]
	cmp r1, r5
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	mov r0, r4
	beq _020B9C84
	bl NNS_G2dRndCoreDrawCellVramTransfer
	b _020B9C88
_020B9C84:
	bl NNS_G2dRndCoreDrawCell
_020B9C88:
	ldr r1, [r7, #8]
	mov r0, #0
	str r0, [r1, #0x74]
	bl NNS_G2dRndCoreEndRendering
_020B9C98:
	ldr sb, [sb, #0x30]
	cmp sb, #0
	bne _020B9A90
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B9CA8: .word _021D94D8
_020B9CAC: .word _021109DC
_020B9CB0: .word 0x0000FFFE
_020B9CB4: .word _021D9FD8
_020B9CB8: .word _021DA06C
_020B9CBC: .word _021D9568
_020B9CC0: .word _021D9C68
_020B9CC4: .word _021D9668
_020B9CC8: .word _021D9678
_020B9CCC: .word _021D967C
_020B9CD0: .word _021109E4
_020B9CD4: .word _021D94E8
_020B9CD8: .word _021DA068
	arm_func_end DrawCellImpl_

	arm_func_start DrawCellAnimationImpl_
DrawCellAnimationImpl_: ; 0x020B9CDC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	ldrh r0, [r5, #0x4e]
	ldr r4, [r5, #0x30]
	cmp r0, #0
	bne _020B9D3C
	ldr r2, [r5, #0x38]
	mvn r0, #0
	cmp r2, r0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020B9D30
	ldr r1, _020B9E2C ; =_021109DC
	mov r0, r4
	str r2, [r1, #4]
	bl DrawCellImpl_
	ldr r0, _020B9E2C ; =_021109DC
	mvn r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B9D30:
	mov r0, r4
	bl DrawCellImpl_
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B9D3C:
	bl NNS_G2dPushMtx
	ldrh r0, [r5, #0x4e]
	tst r0, #8
	beq _020B9D8C
	ldr r0, _020B9E30 ; =_021D94D8
	ldrsh r7, [r5, #0x4a]
	ldr r0, [r0, #8]
	ldrsh r6, [r5, #0x48]
	bl NNS_G2dIsRndCoreFlipH
	cmp r0, #0
	ldr r0, _020B9E30 ; =_021D94D8
	rsbne r6, r6, #0
	ldr r0, [r0, #8]
	bl NNS_G2dIsRndCoreFlipV
	cmp r0, #0
	rsbne r7, r7, #0
	mov r0, r6, lsl #0xc
	mov r1, r7, lsl #0xc
	mov r2, #0
	bl NNS_G2dTranslate
_020B9D8C:
	ldrh r0, [r5, #0x4e]
	tst r0, #4
	beq _020B9DC0
	ldrh r0, [r5, #0x4c]
	ldr r2, _020B9E34 ; =FX_SinCosTable_
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	add r0, r1, #1
	mov r3, r1, lsl #1
	mov r1, r0, lsl #1
	ldrsh r0, [r2, r3]
	ldrsh r1, [r2, r1]
	bl NNS_G2dRotZ
_020B9DC0:
	ldrh r0, [r5, #0x4e]
	tst r0, #2
	beq _020B9DDC
	ldr r0, [r5, #0x40]
	ldr r1, [r5, #0x44]
	mov r2, #0x1000
	bl NNS_G2dScale
_020B9DDC:
	ldr r2, [r5, #0x38]
	mvn r0, #0
	cmp r2, r0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020B9E18
	ldr r1, _020B9E2C ; =_021109DC
	mov r0, r4
	str r2, [r1, #4]
	bl DrawCellImpl_
	ldr r0, _020B9E2C ; =_021109DC
	mvn r1, #0
	str r1, [r0, #4]
	b _020B9E20
_020B9E18:
	mov r0, r4
	bl DrawCellImpl_
_020B9E20:
	mov r0, #1
	bl NNS_G2dPopMtx
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B9E2C: .word _021109DC
_020B9E30: .word _021D94D8
_020B9E34: .word FX_SinCosTable_
	arm_func_end DrawCellAnimationImpl_

	arm_func_start DrawNode_
DrawNode_: ; 0x020B9E38
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	ldr r0, [r5, #8]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r4, [r5]
	bl NNS_G2dPushMtx
	ldrh r0, [r5, #0x1e]
	tst r0, #8
	beq _020B9EA0
	ldr r0, _020B9F04 ; =_021D94D8
	ldrsh r7, [r5, #0x1a]
	ldr r0, [r0, #8]
	ldrsh r6, [r5, #0x18]
	bl NNS_G2dIsRndCoreFlipH
	cmp r0, #0
	ldr r0, _020B9F04 ; =_021D94D8
	rsbne r6, r6, #0
	ldr r0, [r0, #8]
	bl NNS_G2dIsRndCoreFlipV
	cmp r0, #0
	rsbne r7, r7, #0
	mov r0, r6, lsl #0xc
	mov r1, r7, lsl #0xc
	mov r2, #0
	bl NNS_G2dTranslate
_020B9EA0:
	ldrh r0, [r5, #0x1e]
	tst r0, #4
	beq _020B9ED4
	ldrh r0, [r5, #0x1c]
	ldr r2, _020B9F08 ; =FX_SinCosTable_
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	add r0, r1, #1
	mov r3, r1, lsl #1
	mov r1, r0, lsl #1
	ldrsh r0, [r2, r3]
	ldrsh r1, [r2, r1]
	bl NNS_G2dRotZ
_020B9ED4:
	ldrh r0, [r5, #0x1e]
	tst r0, #2
	beq _020B9EF0
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0x14]
	mov r2, #0x1000
	bl NNS_G2dScale
_020B9EF0:
	mov r0, r4
	bl DrawCellAnimationImpl_
	mov r0, #1
	bl NNS_G2dPopMtx
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B9F04: .word _021D94D8
_020B9F08: .word FX_SinCosTable_
	arm_func_end DrawNode_

	arm_func_start NNS_G2dInitRenderer
NNS_G2dInitRenderer: ; 0x020B9F0C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r0
	bl NNS_G2dInitRndCore
	mov r6, #0
	str r6, [r4, #0x70]
	str r6, [r4, #0x74]
	str r6, [r4, #0x78]
	str r6, [r4, #0x7c]
	str r6, [r4, #0x80]
	str r6, [r4, #0x84]
	strh r6, [r4, #0x88]
	strh r6, [r4, #0x8a]
	str r6, [r4, #0x8c]
	str r6, [r4, #0x90]
	strh r6, [r4, #0x94]
	ldr r1, _020B9FB4 ; =_021D94D8
	ldr r2, _020B9FB8 ; =0x0000FFFE
	ldr r0, _020B9FBC ; =_021109DC
	ldr r7, _020B9FC0 ; =_021D9C68
	str r6, [r1, #0xc]
	strh r2, [r0]
	mvn r5, #0
	mov r4, #0x10
_020B9F68:
	mov r0, r5
	mov r2, r4
	add r1, r7, #0x10
	bl MIi_CpuClearFast
	add r6, r6, #1
	cmp r6, #0x20
	add r7, r7, #0x20
	blt _020B9F68
	ldr r3, _020B9FB4 ; =_021D94D8
	mov r0, #0
	strh r0, [r3]
	ldr r1, _020B9FC4 ; =_021D9568
	mov r2, #0x100
	strh r0, [r3, #2]
	bl MIi_CpuClearFast
	ldr r0, _020B9FB4 ; =_021D94D8
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B9FB4: .word _021D94D8
_020B9FB8: .word 0x0000FFFE
_020B9FBC: .word _021109DC
_020B9FC0: .word _021D9C68
_020B9FC4: .word _021D9568
	arm_func_end NNS_G2dInitRenderer

	arm_func_start NNS_G2dAddRendererTargetSurface
NNS_G2dAddRendererTargetSurface: ; 0x020B9FC8
	ldr r2, [r0, #0x70]
	str r2, [r1, #0x30]
	str r1, [r0, #0x70]
	bx lr
	arm_func_end NNS_G2dAddRendererTargetSurface

	arm_func_start NNS_G2dInitRenderSurface
NNS_G2dInitRenderSurface: ; 0x020B9FD8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #0
	mov r2, #0x48
	bl MIi_CpuClear16
	mov r0, #1
	str r0, [r4, #0x10]
	mov r0, #3
	ldr r1, _020BA024 ; =RndCoreCBFuncBeforeCell_
	str r0, [r4, #0x14]
	ldr r0, _020BA028 ; =RndCoreCBFuncAfterCell_
	str r1, [r4, #0x18]
	ldr r1, _020BA02C ; =RndCoreCBFuncBeforeOBJ_
	str r0, [r4, #0x1c]
	ldr r0, _020BA030 ; =RndCoreCBFuncAfterOBJ_
	str r1, [r4, #0x20]
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020BA024: .word RndCoreCBFuncBeforeCell_
_020BA028: .word RndCoreCBFuncAfterCell_
_020BA02C: .word RndCoreCBFuncBeforeOBJ_
_020BA030: .word RndCoreCBFuncAfterOBJ_
	arm_func_end NNS_G2dInitRenderSurface

	arm_func_start NNS_G2dBeginRendering
NNS_G2dBeginRendering: ; 0x020BA034
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r5, _020BA0C4 ; =_021D94D8
	mov r4, #0
	str r0, [r5, #8]
	ldr r1, _020BA0C8 ; =0x0000FFFE
	ldr r0, _020BA0CC ; =_021109DC
	str r4, [r5, #0xc]
	strh r1, [r0]
	ldrh r0, [r5]
	cmp r0, #0
	ble _020BA090
	ldr r8, _020BA0D0 ; =_021D9C68
	mvn r7, #0
	mov r6, #0x10
_020BA06C:
	mov r0, r7
	mov r2, r6
	add r1, r8, #0x10
	bl MIi_CpuClearFast
	ldrh r0, [r5]
	add r4, r4, #1
	add r8, r8, #0x20
	cmp r4, r0
	blt _020BA06C
_020BA090:
	ldr r3, _020BA0C4 ; =_021D94D8
	mov r0, #0
	strh r0, [r3]
	ldr r1, _020BA0D4 ; =_021D9568
	mov r2, #0x100
	strh r0, [r3, #2]
	bl MIi_CpuClearFast
	ldr r0, _020BA0D8 ; =0x04000444
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #0x10]
	bl NNSi_G2dIdentity
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020BA0C4: .word _021D94D8
_020BA0C8: .word 0x0000FFFE
_020BA0CC: .word _021109DC
_020BA0D0: .word _021D9C68
_020BA0D4: .word _021D9568
_020BA0D8: .word 0x04000444
	arm_func_end NNS_G2dBeginRendering

	arm_func_start NNS_G2dEndRendering
NNS_G2dEndRendering: ; 0x020BA0DC
	stmdb sp!, {r3, lr}
	ldr r1, _020BA140 ; =0x04000448
	mov r2, #1
	ldr r0, _020BA144 ; =_021D94D8
	str r2, [r1]
	ldr r3, [r0, #8]
	ldr r2, [r3, #0x7c]
	cmp r2, #0
	beq _020BA130
	tst r2, #1
	movne r1, #0
	strne r1, [r0, #4]
	tst r2, #2
	beq _020BA120
	mov r0, #0
	str r0, [r3, #0x74]
	bl NNS_G2dRndCoreEndRendering
_020BA120:
	ldr r0, _020BA144 ; =_021D94D8
	mov r1, #0
	ldr r0, [r0, #8]
	str r1, [r0, #0x7c]
_020BA130:
	ldr r0, _020BA144 ; =_021D94D8
	mov r1, #0
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BA140: .word 0x04000448
_020BA144: .word _021D94D8
	arm_func_end NNS_G2dEndRendering

	arm_func_start NNS_G2dDrawCellAnimation
NNS_G2dDrawCellAnimation: ; 0x020BA148
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020BA1AC ; =_021D94D8
	mov r5, r0
	ldr r1, [r1, #8]
	ldr r1, [r1, #0x80]
	cmp r1, #0
	beq _020BA1A4
	bl NNSi_G2dGetOamSoftEmuAutoZOffsetStep
	mov r4, r0
	mov r0, #1
	bl NNSi_G2dSetOamSoftEmuAutoZOffsetFlag
	ldr r0, _020BA1AC ; =_021D94D8
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x80]
	bl NNSi_G2dSetOamSoftEmuAutoZOffsetStep
	mov r0, r5
	bl DrawCellAnimationImpl_
	mov r0, #0
	bl NNSi_G2dSetOamSoftEmuAutoZOffsetFlag
	mov r0, r4
	bl NNSi_G2dSetOamSoftEmuAutoZOffsetStep
	bl NNSi_G2dResetOamSoftEmuAutoZOffset
	ldmia sp!, {r3, r4, r5, pc}
_020BA1A4:
	bl DrawCellAnimationImpl_
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BA1AC: .word _021D94D8
	arm_func_end NNS_G2dDrawCellAnimation

	arm_func_start NNS_G2dDrawMultiCell
NNS_G2dDrawMultiCell: ; 0x020BA1B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r5, r0
	ldr r0, [r5, #8]
	cmp r0, #1
	bne _020BA3AC
	ldr r0, [r5]
	mov r2, #0
	ldrh r0, [r0, #2]
	cmp r0, #0
	bls _020BA204
	ldr r3, _020BA478 ; =_021DA068
	mov r4, r2
_020BA1E0:
	add r0, r3, r2, lsl #2
	str r4, [r0, #4]
	ldr r0, [r5]
	add r2, r2, #1
	ldrh r1, [r0, #2]
	mov r0, r2, lsl #0x10
	mov r2, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020BA1E0
_020BA204:
	ldr r6, _020BA47C ; =_021D94D8
	mov r0, #1
	str r0, [r6, #0xf94]
	ldr r0, [r6, #8]
	mov sl, #0
	ldr r0, [r0, #0x80]
	cmp r0, #0
	beq _020BA2FC
	bl NNSi_G2dGetOamSoftEmuAutoZOffsetStep
	str r0, [sp]
	mov r0, #1
	bl NNSi_G2dSetOamSoftEmuAutoZOffsetFlag
	mov r0, r6
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x80]
	bl NNSi_G2dSetOamSoftEmuAutoZOffsetStep
	ldr r2, [r5]
	ldrh r0, [r2]
	cmp r0, #0
	bls _020BA2E4
	ldr fp, _020BA480 ; =_021D9FD8
_020BA258:
	ldr r0, [r2, #4]
	ldr r8, [r5, #0xc]
	add r7, r0, sl, lsl #3
	ldrh r0, [r7, #6]
	and r0, r0, #0xff00
	mov r0, r0, lsl #8
	mov sb, r0, lsr #0x10
	strh sb, [fp, #0x90]
	bl NNS_G2dPushMtx
	ldrsh r4, [r7, #4]
	ldr r0, [r6, #8]
	ldrsh r7, [r7, #2]
	bl NNS_G2dIsRndCoreFlipH
	cmp r0, #0
	ldr r0, [r6, #8]
	rsbne r7, r7, #0
	bl NNS_G2dIsRndCoreFlipV
	cmp r0, #0
	rsbne r4, r4, #0
	mov r2, #0
	mov r0, r7, lsl #0xc
	mov r1, r4, lsl #0xc
	bl NNS_G2dTranslate
	mov r0, #0x5c
	mla r0, sb, r0, r8
	bl DrawCellAnimationImpl_
	mov r0, #1
	bl NNS_G2dPopMtx
	ldr r2, [r5]
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [r2]
	mov sl, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020BA258
_020BA2E4:
	mov r0, #0
	bl NNSi_G2dSetOamSoftEmuAutoZOffsetFlag
	ldr r0, [sp]
	bl NNSi_G2dSetOamSoftEmuAutoZOffsetStep
	bl NNSi_G2dResetOamSoftEmuAutoZOffset
	b _020BA39C
_020BA2FC:
	ldr r2, [r5]
	ldrh r0, [r2]
	cmp r0, #0
	bls _020BA39C
	ldr fp, _020BA480 ; =_021D9FD8
_020BA310:
	ldr r0, [r2, #4]
	ldr r8, [r5, #0xc]
	add r7, r0, sl, lsl #3
	ldrh r0, [r7, #6]
	and r0, r0, #0xff00
	mov r0, r0, lsl #8
	mov sb, r0, lsr #0x10
	strh sb, [fp, #0x90]
	bl NNS_G2dPushMtx
	ldrsh r4, [r7, #4]
	ldr r0, [r6, #8]
	ldrsh r7, [r7, #2]
	bl NNS_G2dIsRndCoreFlipH
	cmp r0, #0
	ldr r0, [r6, #8]
	rsbne r7, r7, #0
	bl NNS_G2dIsRndCoreFlipV
	cmp r0, #0
	rsbne r4, r4, #0
	mov r2, #0
	mov r0, r7, lsl #0xc
	mov r1, r4, lsl #0xc
	bl NNS_G2dTranslate
	mov r0, #0x5c
	mla r0, sb, r0, r8
	bl DrawCellAnimationImpl_
	mov r0, #1
	bl NNS_G2dPopMtx
	ldr r2, [r5]
	add r0, sl, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [r2]
	mov sl, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020BA310
_020BA39C:
	ldr r0, _020BA47C ; =_021D94D8
	mov r1, #0
	str r1, [r0, #0xf94]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BA3AC:
	ldr r0, _020BA47C ; =_021D94D8
	ldr r4, [r5, #0xc]
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x80]
	cmp r0, #0
	beq _020BA438
	bl NNSi_G2dGetOamSoftEmuAutoZOffsetStep
	mov r6, r0
	mov r0, #1
	bl NNSi_G2dSetOamSoftEmuAutoZOffsetFlag
	ldr r0, _020BA47C ; =_021D94D8
	ldr r0, [r0, #8]
	ldr r0, [r0, #0x80]
	bl NNSi_G2dSetOamSoftEmuAutoZOffsetStep
	ldr r0, [r5]
	mov r7, #0
	ldrh r0, [r0]
	cmp r0, #0
	bls _020BA420
	mov r8, #0x28
_020BA3FC:
	mla r0, r7, r8, r4
	bl DrawNode_
	ldr r1, [r5]
	add r0, r7, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [r1]
	mov r7, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020BA3FC
_020BA420:
	mov r0, #0
	bl NNSi_G2dSetOamSoftEmuAutoZOffsetFlag
	mov r0, r6
	bl NNSi_G2dSetOamSoftEmuAutoZOffsetStep
	bl NNSi_G2dResetOamSoftEmuAutoZOffset
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BA438:
	ldr r0, [r5]
	mov r6, #0
	ldrh r0, [r0]
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r7, #0x28
_020BA450:
	mla r0, r6, r7, r4
	bl DrawNode_
	ldr r1, [r5]
	add r0, r6, #1
	mov r0, r0, lsl #0x10
	ldrh r1, [r1]
	mov r6, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bhi _020BA450
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020BA478: .word _021DA068
_020BA47C: .word _021D94D8
_020BA480: .word _021D9FD8
	arm_func_end NNS_G2dDrawMultiCell

	arm_func_start NNS_G2dDrawMultiCellAnimation
NNS_G2dDrawMultiCellAnimation: ; 0x020BA484
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldrh r0, [r4, #0x5a]
	cmp r0, #0
	bne _020BA4A4
	add r0, r4, #0x34
	bl NNS_G2dDrawMultiCell
	ldmia sp!, {r4, r5, r6, pc}
_020BA4A4:
	bl NNS_G2dPushMtx
	ldrh r0, [r4, #0x5a]
	tst r0, #8
	beq _020BA4F4
	ldr r0, _020BA558 ; =_021D94D8
	ldrsh r6, [r4, #0x56]
	ldr r0, [r0, #8]
	ldrsh r5, [r4, #0x54]
	bl NNS_G2dIsRndCoreFlipH
	cmp r0, #0
	ldr r0, _020BA558 ; =_021D94D8
	rsbne r5, r5, #0
	ldr r0, [r0, #8]
	bl NNS_G2dIsRndCoreFlipV
	cmp r0, #0
	rsbne r6, r6, #0
	mov r0, r5, lsl #0xc
	mov r1, r6, lsl #0xc
	mov r2, #0
	bl NNS_G2dTranslate
_020BA4F4:
	ldrh r0, [r4, #0x5a]
	tst r0, #4
	beq _020BA528
	ldrh r0, [r4, #0x58]
	ldr r2, _020BA55C ; =FX_SinCosTable_
	mov r0, r0, asr #4
	mov r1, r0, lsl #1
	add r0, r1, #1
	mov r3, r1, lsl #1
	mov r1, r0, lsl #1
	ldrsh r0, [r2, r3]
	ldrsh r1, [r2, r1]
	bl NNS_G2dRotZ
_020BA528:
	ldrh r0, [r4, #0x5a]
	tst r0, #2
	beq _020BA544
	ldr r0, [r4, #0x4c]
	ldr r1, [r4, #0x50]
	mov r2, #0x1000
	bl NNS_G2dScale
_020BA544:
	add r0, r4, #0x34
	bl NNS_G2dDrawMultiCell
	mov r0, #1
	bl NNS_G2dPopMtx
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020BA558: .word _021D94D8
_020BA55C: .word FX_SinCosTable_
	arm_func_end NNS_G2dDrawMultiCellAnimation

	arm_func_start NNS_G2dPushMtx
NNS_G2dPushMtx: ; 0x020BA560
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _020BA764 ; =_021D94D8
	ldr r1, [r0, #8]
	ldr r1, [r1, #0x7c]
	tst r1, #1
	bne _020BA6A0
	ldr r1, [r0, #0xc]
	mov r0, r1, lsl #0x10
	add r6, r1, #1
	cmp r6, #0x20
	mov r5, r0, lsr #0x10
	movlt r0, #1
	movge r0, #0
	cmp r0, #0
	beq _020BA640
	ldr r0, _020BA764 ; =_021D94D8
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _020BA5E4
	ldr r3, [r0, #0xc]
	mov r0, #0x18
	mul r8, r3, r0
	ldr r4, _020BA768 ; =_021D9678
	ldr r1, _020BA76C ; =_021D94E8
	mul r7, r6, r0
	ldr r2, [r4, r8]
	ldr r0, [r1, r3, lsl #2]
	ldr r3, _020BA770 ; =_021D967C
	str r2, [r4, r7]
	ldr r2, [r3, r8]
	str r0, [r1, r6, lsl #2]
	str r2, [r3, r7]
	b _020BA638
_020BA5E4:
	ldr r4, [r0, #0xc]
	mov r0, #0x18
	mul lr, r4, r0
	ldr r1, _020BA774 ; =_021D9668
	mul ip, r6, r0
	ldr r8, _020BA778 ; =_021D9968
	add sl, r1, lr
	ldr r7, _020BA76C ; =_021D94E8
	add sb, r1, ip
	ldmia sl!, {r0, r1, r2, r3}
	stmia sb!, {r0, r1, r2, r3}
	ldmia sl, {r0, r1}
	stmia sb, {r0, r1}
	add sb, r8, lr
	ldr r4, [r7, r4, lsl #2]
	add r8, r8, ip
	ldmia sb!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	str r4, [r7, r6, lsl #2]
	ldmia sb, {r0, r1}
	stmia r8, {r0, r1}
_020BA638:
	ldr r0, _020BA764 ; =_021D94D8
	str r6, [r0, #0xc]
_020BA640:
	ldr r0, _020BA764 ; =_021D94D8
	ldr r2, _020BA77C ; =_021D9568
	ldr r0, [r0, #0xc]
	mov r6, r5, lsl #3
	mov r0, r0, lsl #0x10
	add r4, r2, r5, lsl #3
	mov r3, r0, lsr #0x10
	mov r5, r3, lsl #3
	ldrh r1, [r2, r6]
	ldrh r0, [r4, #2]
	add r3, r2, r3, lsl #3
	strh r1, [r2, r5]
	strh r0, [r3, #2]
	ldrh r2, [r4, #4]
	ldrh r0, [r4, #6]
	ldr r1, _020BA780 ; =_021D956C
	strh r2, [r3, #4]
	strh r0, [r3, #6]
	ldrh r0, [r1, r6]
	cmp r0, #1
	moveq r0, #2
	streqh r0, [r1, r5]
	strneh r0, [r1, r5]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020BA6A0:
	ldr r0, [r0, #0xc]
	add r4, r0, #1
	cmp r4, #0x20
	movlt r0, #1
	movge r0, #0
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, _020BA764 ; =_021D94D8
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _020BA704
	ldr r3, [r0, #0xc]
	mov r0, #0x18
	mul r7, r3, r0
	ldr r5, _020BA768 ; =_021D9678
	ldr r1, _020BA76C ; =_021D94E8
	mul r6, r4, r0
	ldr r2, [r5, r7]
	ldr r0, [r1, r3, lsl #2]
	ldr r3, _020BA770 ; =_021D967C
	str r2, [r5, r6]
	ldr r2, [r3, r7]
	str r0, [r1, r4, lsl #2]
	str r2, [r3, r6]
	b _020BA758
_020BA704:
	ldr sb, [r0, #0xc]
	mov r0, #0x18
	mul lr, sb, r0
	ldr r1, _020BA774 ; =_021D9668
	mul r8, r4, r0
	ldr ip, _020BA778 ; =_021D9968
	add r5, r1, lr
	ldr r6, _020BA76C ; =_021D94E8
	add r7, r1, r8
	ldmia r5!, {r0, r1, r2, r3}
	stmia r7!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1}
	ldr r5, [r6, sb, lsl #2]
	add lr, ip, lr
	stmia r7, {r0, r1}
	add ip, ip, r8
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1}
	stmia ip, {r0, r1}
	str r5, [r6, r4, lsl #2]
_020BA758:
	ldr r0, _020BA764 ; =_021D94D8
	str r4, [r0, #0xc]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020BA764: .word _021D94D8
_020BA768: .word _021D9678
_020BA76C: .word _021D94E8
_020BA770: .word _021D967C
_020BA774: .word _021D9668
_020BA778: .word _021D9968
_020BA77C: .word _021D9568
_020BA780: .word _021D956C
	arm_func_end NNS_G2dPushMtx

	arm_func_start NNS_G2dPopMtx
NNS_G2dPopMtx: ; 0x020BA784
	ldr r0, _020BA7C8 ; =_021D94D8
	ldr r0, [r0, #0xc]
	cmp r0, #0
	movle r0, #1
	movgt r0, #0
	cmp r0, #0
	bxne lr
	ldr r1, _020BA7C8 ; =_021D94D8
	ldr r0, _020BA7CC ; =_021109DC
	ldr r3, [r1, #0xc]
	ldrh r2, [r0]
	sub r3, r3, #1
	str r3, [r1, #0xc]
	cmp r2, r3
	ldrgt r1, _020BA7D0 ; =0x0000FFFE
	strgth r1, [r0]
	bx lr
	.align 2, 0
_020BA7C8: .word _021D94D8
_020BA7CC: .word _021109DC
_020BA7D0: .word 0x0000FFFE
	arm_func_end NNS_G2dPopMtx

	arm_func_start NNS_G2dTranslate
NNS_G2dTranslate: ; 0x020BA7D4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	ldr r3, _020BA8B8 ; =_021D94D8
	mov r4, r2
	ldr r2, [r3, #4]
	cmp r2, #0
	beq _020BA834
	ldr r2, [r3, #0xc]
	mov r3, #0x18
	mul r6, r2, r3
	ldr r5, _020BA8BC ; =_021D9678
	ldr r3, _020BA8C0 ; =_021D94E8
	ldr ip, [r5, r6]
	ldr lr, _020BA8C4 ; =_021D967C
	add r0, ip, r0
	str r0, [r5, r6]
	ldr r0, [r3, r2, lsl #2]
	ldr ip, [lr, r6]
	add r0, r0, r4
	add r1, ip, r1
	str r0, [r3, r2, lsl #2]
	add sp, sp, #0x18
	str r1, [lr, r6]
	ldmia sp!, {r4, r5, r6, pc}
_020BA834:
	mov ip, #0x1000
	mov r2, #0
	str r0, [sp, #0x10]
	str ip, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	str ip, [sp, #0xc]
	str r1, [sp, #0x14]
	ldr r1, [r3, #0xc]
	mov r0, #0x18
	mul r3, r1, r0
	ldr r2, _020BA8C8 ; =_021D9668
	add r0, sp, #0
	add r1, r2, r3
	add r2, r2, r3
	bl NNSi_G2dMtxConcat32
	ldr r1, _020BA8B8 ; =_021D94D8
	mov r0, #0x18
	ldr r1, [r1, #0xc]
	ldr r2, _020BA8CC ; =_021D9968
	mul r3, r1, r0
	add r1, r2, r3
	add r0, sp, #0
	add r2, r2, r3
	bl NNSi_G2dMtxConcat32
	ldr r0, _020BA8B8 ; =_021D94D8
	ldr r2, _020BA8C0 ; =_021D94E8
	ldr r1, [r0, #0xc]
	ldr r0, [r2, r1, lsl #2]
	add r0, r0, r4
	str r0, [r2, r1, lsl #2]
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020BA8B8: .word _021D94D8
_020BA8BC: .word _021D9678
_020BA8C0: .word _021D94E8
_020BA8C4: .word _021D967C
_020BA8C8: .word _021D9668
_020BA8CC: .word _021D9968
	arm_func_end NNS_G2dTranslate

	arm_func_start NNS_G2dScale
NNS_G2dScale: ; 0x020BA8D0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	ldr r2, _020BAA0C ; =_021D94D8
	mov lr, #0
	ldr r3, [r2, #0xc]
	mov r2, #0x18
	mul ip, r3, r2
	mov r5, r0
	mov r4, r1
	ldr r2, _020BAA10 ; =_021D9668
	add r0, sp, #0
	add r1, r2, ip
	add r2, r2, ip
	str r5, [sp]
	str lr, [sp, #4]
	str lr, [sp, #8]
	str r4, [sp, #0xc]
	str lr, [sp, #0x10]
	str lr, [sp, #0x14]
	bl NNSi_G2dMtxConcat32
	mov r0, r5
	bl FX_Inv
	mov r1, #0
	str r0, [sp]
	mov r0, r4
	str r1, [sp, #4]
	str r1, [sp, #8]
	bl FX_Inv
	mov ip, #0
	ldr r1, _020BAA0C ; =_021D94D8
	str r0, [sp, #0xc]
	ldr r1, [r1, #0xc]
	mov r0, #0x18
	mul r3, r1, r0
	ldr r2, _020BAA14 ; =_021D9968
	add r0, sp, #0
	add r1, r2, r3
	add r2, r2, r3
	str ip, [sp, #0x10]
	str ip, [sp, #0x14]
	bl NNSi_G2dMtxConcat32
	ldr r0, _020BAA0C ; =_021D94D8
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _020BA99C
	ldr r1, _020BAA18 ; =_021109DC
	ldr r0, _020BAA1C ; =0x0000FFFE
	ldrh r1, [r1]
	cmp r1, r0
	movne r0, #1
	bne _020BA9A0
_020BA99C:
	mov r0, #0
_020BA9A0:
	cmp r0, #0
	bne _020BA9B8
	ldr r1, _020BAA0C ; =_021D94D8
	ldr r0, _020BAA18 ; =_021109DC
	ldr r1, [r1, #0xc]
	strh r1, [r0]
_020BA9B8:
	ldr r1, _020BAA0C ; =_021D94D8
	ldr r2, _020BAA20 ; =_021D9568
	ldr r0, [r1, #0xc]
	mov r0, r0, lsl #0x10
	add ip, r2, r0, lsr #13
	ldrh r0, [ip, #4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020BAA04
_020BA9DC: ; jump table
	b _020BA9EC ; case 0
	b _020BAA04 ; case 1
	b _020BA9EC ; case 2
	b _020BA9EC ; case 3
_020BA9EC:
	ldrh r3, [r1, #2]
	mov r0, #1
	add r2, r3, #1
	strh r2, [r1, #2]
	strh r3, [ip, #2]
	strh r0, [ip, #4]
_020BAA04:
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BAA0C: .word _021D94D8
_020BAA10: .word _021D9668
_020BAA14: .word _021D9968
_020BAA18: .word _021109DC
_020BAA1C: .word 0x0000FFFE
_020BAA20: .word _021D9568
	arm_func_end NNS_G2dScale

	arm_func_start NNS_G2dRotZ
NNS_G2dRotZ: ; 0x020BAA24
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x18
	ldr r2, _020BAB2C ; =_021D94D8
	mov lr, #0
	ldr r3, [r2, #0xc]
	mov r2, #0x18
	mul ip, r3, r2
	rsb r3, r0, #0
	str r0, [sp, #4]
	ldr r2, _020BAB30 ; =_021D9668
	add r0, sp, #0
	str r1, [sp]
	str r1, [sp, #0xc]
	add r1, r2, ip
	add r2, r2, ip
	str r3, [sp, #8]
	str lr, [sp, #0x10]
	str lr, [sp, #0x14]
	bl NNSi_G2dMtxConcat32
	ldr r1, _020BAB2C ; =_021D94D8
	mov r0, #0x18
	ldr r1, [r1, #0xc]
	ldr r2, _020BAB34 ; =_021D9968
	mul r3, r1, r0
	add r1, r2, r3
	add r0, sp, #0
	add r2, r2, r3
	bl NNSi_G2dMtxConcat32
	ldr r0, _020BAB2C ; =_021D94D8
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _020BAABC
	ldr r1, _020BAB38 ; =_021109DC
	ldr r0, _020BAB3C ; =0x0000FFFE
	ldrh r1, [r1]
	cmp r1, r0
	movne r0, #1
	bne _020BAAC0
_020BAABC:
	mov r0, #0
_020BAAC0:
	cmp r0, #0
	bne _020BAAD8
	ldr r1, _020BAB2C ; =_021D94D8
	ldr r0, _020BAB38 ; =_021109DC
	ldr r1, [r1, #0xc]
	strh r1, [r0]
_020BAAD8:
	ldr r1, _020BAB2C ; =_021D94D8
	ldr r2, _020BAB40 ; =_021D9568
	ldr r0, [r1, #0xc]
	mov r0, r0, lsl #0x10
	add ip, r2, r0, lsr #13
	ldrh r0, [ip, #4]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020BAB24
_020BAAFC: ; jump table
	b _020BAB0C ; case 0
	b _020BAB24 ; case 1
	b _020BAB0C ; case 2
	b _020BAB0C ; case 3
_020BAB0C:
	ldrh r3, [r1, #2]
	mov r0, #1
	add r2, r3, #1
	strh r2, [r1, #2]
	strh r3, [ip, #2]
	strh r0, [ip, #4]
_020BAB24:
	add sp, sp, #0x18
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BAB2C: .word _021D94D8
_020BAB30: .word _021D9668
_020BAB34: .word _021D9968
_020BAB38: .word _021109DC
_020BAB3C: .word 0x0000FFFE
_020BAB40: .word _021D9568
	arm_func_end NNS_G2dRotZ

	arm_func_start NNS_G2dGetRendererPaletteTbl
NNS_G2dGetRendererPaletteTbl: ; 0x020BAB44
	ldr r0, [r0, #0x78]
	bx lr
	arm_func_end NNS_G2dGetRendererPaletteTbl

	arm_func_start NNS_G2dSetRendererImageProxy
NNS_G2dSetRendererImageProxy: ; 0x020BAB4C
	ldr ip, _020BAB54 ; =NNS_G2dSetRndCoreImageProxy
	bx ip
	.align 2, 0
_020BAB54: .word NNS_G2dSetRndCoreImageProxy
	arm_func_end NNS_G2dSetRendererImageProxy

	arm_func_start NNSi_G2dMtxConcat32
NNSi_G2dMtxConcat32: ; 0x020BAB58
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	ldr r4, [r0, #4]
	ldr r3, [r1, #8]
	mov ip, r2
	smull r6, r5, r4, r3
	ldr r4, [r0]
	ldr r3, [r1]
	cmp ip, r1
	smlal r6, r5, r4, r3
	mov r3, r6, lsr #0xc
	addeq r2, sp, #0
	orr r3, r3, r5, lsl #20
	str r3, [r2]
	ldr r4, [r0, #4]
	ldr r3, [r1, #0xc]
	ldr r5, [r0]
	smull r7, r6, r4, r3
	ldr r3, [r1, #4]
	add lr, sp, #0
	smlal r7, r6, r5, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r6, lsl #20
	str r3, [r2, #4]
	ldr r4, [r0, #0xc]
	ldr r3, [r1, #8]
	ldr r5, [r0, #8]
	smull r7, r6, r4, r3
	ldr r3, [r1]
	cmp r2, lr
	smlal r7, r6, r5, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r6, lsl #20
	str r3, [r2, #8]
	ldr r4, [r0, #0xc]
	ldr r3, [r1, #0xc]
	ldr r5, [r0, #8]
	smull r7, r6, r4, r3
	ldr r3, [r1, #4]
	addne sp, sp, #0x18
	smlal r7, r6, r5, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r6, lsl #20
	str r3, [r2, #0xc]
	ldr r4, [r0, #0x14]
	ldr r3, [r1, #8]
	ldr r5, [r0, #0x10]
	smull r7, r6, r4, r3
	ldr r3, [r1]
	ldr r4, [r1, #0x10]
	smlal r7, r6, r5, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r6, lsl #20
	add r3, r4, r3
	str r3, [r2, #0x10]
	ldr r4, [r0, #0x14]
	ldr r3, [r1, #0xc]
	ldr r5, [r0, #0x10]
	ldr r0, [r1, #4]
	smull r6, r3, r4, r3
	smlal r6, r3, r5, r0
	mov r0, r6, lsr #0xc
	ldr r1, [r1, #0x14]
	orr r0, r0, r3, lsl #20
	add r0, r1, r0
	str r0, [r2, #0x14]
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1}
	stmia ip, {r0, r1}
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNSi_G2dMtxConcat32

	arm_func_start NNSi_G2dGetCellTransferState
NNSi_G2dGetCellTransferState: ; 0x020BAC7C
	ldr r2, _020BAC90 ; =_021DA470
	mov r1, #0x30
	ldr r2, [r2, #8]
	mla r0, r1, r0, r2
	bx lr
	.align 2, 0
_020BAC90: .word _021DA470
	arm_func_end NNSi_G2dGetCellTransferState

	arm_func_start NNSi_G2dInitCellTransferState
NNSi_G2dInitCellTransferState: ; 0x020BAC94
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, _020BAD34 ; =_021DA470
	mov r4, #0x30
	ldr ip, [ip, #8]
	mov r7, r1
	mla r4, r0, r4, ip
	mov r0, r4
	mov r6, r2
	mov r5, r3
	bl NNSi_G2dInitializeVRamLocation
	mvn r0, #0
	cmp r7, r0
	beq _020BACD8
	mov r0, r4
	mov r2, r7
	mov r1, #0
	bl NNSi_G2dSetVramLocation
_020BACD8:
	mvn r0, #0
	cmp r6, r0
	beq _020BACF4
	mov r0, r4
	mov r2, r6
	mov r1, #1
	bl NNSi_G2dSetVramLocation
_020BACF4:
	mvn r0, #0
	cmp r5, r0
	beq _020BAD10
	mov r0, r4
	mov r2, r5
	mov r1, #2
	bl NNSi_G2dSetVramLocation
_020BAD10:
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r1, [r4, #0xc]
	ldr r1, [sp, #0x20]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x24]
	str r1, [r4, #0x14]
	str r0, [r4, #0x18]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020BAD34: .word _021DA470
	arm_func_end NNSi_G2dInitCellTransferState

	arm_func_start NNS_G2dInitCellTransferStateManager
NNS_G2dInitCellTransferStateManager: ; 0x020BAD38
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _020BAD98 ; =_021DA470
	movs r6, r1
	mov r7, r0
	mov r5, #0
	stmia r3, {r2, r6, r7}
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r4, r5
_020BAD58:
	mov r0, r7
	bl NNSi_G2dInitializeVRamLocation
	str r4, [r7, #0xc]
	str r4, [r7, #0x10]
	str r4, [r7, #0x14]
	str r4, [r7, #0x18]
	str r4, [r7, #0x1c]
	str r4, [r7, #0x20]
	str r4, [r7, #0x24]
	str r4, [r7, #0x28]
	add r5, r5, #1
	str r4, [r7, #0x2c]
	cmp r5, r6
	add r7, r7, #0x30
	blo _020BAD58
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020BAD98: .word _021DA470
	arm_func_end NNS_G2dInitCellTransferStateManager

	arm_func_start NNS_G2dUpdateCellTransferStateManager
NNS_G2dUpdateCellTransferStateManager: ; 0x020BAD9C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r1, _020BAEB8 ; =_021DA470
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [r1, #4]
	cmp r0, #0
	addls sp, sp, #8
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #4]
	str r0, [sp]
_020BADC8:
	ldr r4, _020BAEB8 ; =_021DA470
	ldr r0, [sp]
	ldr r1, [r4, #8]
	add r8, r1, r0
	ldr r0, [r8, #0x1c]
	cmp r0, #0
	beq _020BAE84
	mov r7, #0
	cmp r7, #3
	bge _020BAE7C
	ldr r5, _020BAEBC ; =_02109328
	mov fp, r7
	mov r6, #1
_020BADFC:
	ldr r0, [r8, #0x24]
	mov r1, fp
	tst r0, r6, lsl r7
	beq _020BAE18
	ldr r0, [r8, #0x20]
	tst r0, r6, lsl r7
	movne r1, r6
_020BAE18:
	cmp r1, #0
	beq _020BAE70
	cmp r7, #0
	ldreq sl, [r8, #0x14]
	ldr sb, [r5, r7, lsl #2]
	mov r0, r8
	mov r1, r7
	ldrne sl, [r8, #0x10]
	bl NNSi_G2dGetVramLocation
	ldr r2, [r8, #0x28]
	mov r1, r0
	mov r0, sb
	ldr r3, [r8, #0x2c]
	ldr sb, [r4]
	add r2, sl, r2
	blx sb
	cmp r0, #0
	beq _020BAE70
	mvn r0, r6, lsl r7
	ldr r1, [r8, #0x24]
	and r0, r1, r0
	str r0, [r8, #0x24]
_020BAE70:
	add r7, r7, #1
	cmp r7, #3
	blt _020BADFC
_020BAE7C:
	mov r0, #0
	str r0, [r8, #0x20]
_020BAE84:
	ldr r0, [sp, #4]
	ldr r1, _020BAEB8 ; =_021DA470
	add r0, r0, #1
	str r0, [sp, #4]
	ldr r0, [sp]
	ldr r1, [r1, #4]
	add r0, r0, #0x30
	str r0, [sp]
	ldr r0, [sp, #4]
	cmp r0, r1
	blo _020BADC8
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020BAEB8: .word _021DA470
_020BAEBC: .word _02109328
	arm_func_end NNS_G2dUpdateCellTransferStateManager

	arm_func_start NNS_G2dSetCellTransferStateRequested
NNS_G2dSetCellTransferStateRequested: ; 0x020BAEC0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r1
	mov r4, r2
	bl NNSi_G2dGetCellTransferState
	mvn r1, #0
	str r1, [r0, #0x24]
	str r5, [r0, #0x28]
	str r4, [r0, #0x2c]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNS_G2dSetCellTransferStateRequested

	arm_func_start NNS_G2dGetNewCellTransferStateHandle
NNS_G2dGetNewCellTransferStateHandle: ; 0x020BAEE4
	ldr r1, _020BAF38 ; =_021DA470
	mov r0, #0
	ldr r3, [r1, #4]
	cmp r3, #0
	bls _020BAF30
	ldr ip, [r1, #8]
	mov r2, ip
_020BAF00:
	ldr r1, [r2, #0x1c]
	cmp r1, #1
	beq _020BAF20
	mov r1, #0x30
	mla r1, r0, r1, ip
	mov r2, #1
	str r2, [r1, #0x1c]
	bx lr
_020BAF20:
	add r0, r0, #1
	cmp r0, r3
	add r2, r2, #0x30
	blo _020BAF00
_020BAF30:
	mvn r0, #0
	bx lr
	.align 2, 0
_020BAF38: .word _021DA470
	arm_func_end NNS_G2dGetNewCellTransferStateHandle

	arm_func_start NNS_G2dFreeCellTransferStateHandle
NNS_G2dFreeCellTransferStateHandle: ; 0x020BAF3C
	stmdb sp!, {r4, lr}
	ldr r2, _020BAF84 ; =_021DA470
	mov r1, #0x30
	ldr r2, [r2, #8]
	mla r4, r0, r1, r2
	mov r0, r4
	bl NNSi_G2dInitializeVRamLocation
	mov r0, #0
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r0, [r4, #0x24]
	str r0, [r4, #0x28]
	str r0, [r4, #0x2c]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020BAF84: .word _021DA470
	arm_func_end NNS_G2dFreeCellTransferStateHandle

	arm_func_start CalcSpriteParams_
CalcSpriteParams_: ; 0x020BAF88
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r6, r0
	ldr r0, _020BB1C8 ; =0xC000C000
	ldmia r6, {r4, r5}
	and r0, r4, r0
	and r4, r0, #0xc0000000
	mov lr, r4, lsr #0x1e
	and r0, r0, #0xc000
	mov r5, r5, lsl #0x16
	mov ip, r0, asr #0xe
	mov r5, r5, lsr #0x16
	ldr r4, _020BB1CC ; =_02109310
	mov r7, r5, lsl #0x10
	ldr r0, _020BB1D0 ; =_021092F8
	add r5, r4, ip, lsl #3
	mov r8, lr, lsl #1
	add r4, r0, ip, lsl #3
	ldrh r5, [r8, r5]
	ldr r0, [sp, #0x20]
	ldrh r4, [r8, r4]
	str r5, [r0, #0x10]
	mov r5, r1
	str r4, [r0, #0x14]
	ldr r8, [r5, #0x14]
	mov r4, r3
	cmp r8, #0
	mov r1, r7, lsr #0x10
	bne _020BB068
	ldr r3, [r5, #8]
	ldr r7, [r5]
	mov r3, r3, lsl #0x1a
	orr r2, r3, r2, lsr #3
	orr r2, r2, #0x40000000
	orr r2, r2, r7, lsl #20
	ldr r3, [r5, #4]
	ldr r7, [r5, #0x10]
	orr r3, r2, r3, lsl #23
	ldr r2, _020BB1D4 ; =0x040004A8
	orr r3, r3, r7, lsl #29
	str r3, [r2]
	ldr r2, [r5, #8]
	ldr r3, [r5]
	cmp r2, #4
	ldr r2, _020BB1D8 ; =_02109344
	moveq r1, r1, lsl #0xf
	ldr r2, [r2, r3, lsl #2]
	moveq r1, r1, lsr #0x10
	sub r2, r2, #1
	and r2, r1, r2
	mov r2, r2, lsl #0xf
	str r2, [r0]
	ldr r2, [r5]
	mov r1, r1, asr r2
	mov r1, r1, lsl #0xf
	b _020BB0D0
_020BB068:
	and r3, r8, #0x700000
	mov r3, r3, asr #0x14
	add r7, r3, #5
	mov r3, ip, lsl #0x10
	add ip, r2, r1, lsl r7
	mov r1, lr, lsl #0x10
	mov r8, r3, lsr #0x10
	ldr r7, _020BB1DC ; =_02109364
	ldr lr, [r5, #8]
	mov r3, ip, lsr #3
	orr ip, r3, lr, lsl #26
	ldr r2, _020BB1E0 ; =_02109394
	mov lr, r1, lsr #0x10
	add r1, r2, r8, lsl #4
	add r3, r7, r8, lsl #4
	ldr r2, [r3, lr, lsl #2]
	orr r3, ip, #0x40000000
	orr r2, r3, r2, lsl #20
	ldr r1, [r1, lr, lsl #2]
	ldr r3, [r5, #0x10]
	orr r2, r2, r1, lsl #23
	ldr r1, _020BB1D4 ; =0x040004A8
	orr r2, r2, r3, lsl #29
	str r2, [r1]
	mov r1, #0
	str r1, [r0]
_020BB0D0:
	str r1, [r0, #4]
	ldr r2, [r0]
	ldr r1, [r0, #0x10]
	add r1, r2, r1, lsl #12
	str r1, [r0, #8]
	ldr r2, [r0, #4]
	ldr r1, [r0, #0x14]
	add r1, r2, r1, lsl #12
	str r1, [r0, #0xc]
	ldr r1, [r6]
	mov r2, r1, lsl #2
	mov r1, r1, lsl #3
	mov ip, r2, lsr #0x1f
	movs r3, r1, lsr #0x1f
	beq _020BB11C
	ldr r2, [r0]
	ldr r1, [r0, #8]
	str r1, [r0]
	str r2, [r0, #8]
_020BB11C:
	cmp ip, #0
	beq _020BB134
	ldr r2, [r0, #4]
	ldr r1, [r0, #0xc]
	str r1, [r0, #4]
	str r2, [r0, #0xc]
_020BB134:
	ldr r1, _020BB1E4 ; =_021DA47C
	ldr r7, [r1]
	cmp r7, #0
	beq _020BB15C
	str r3, [sp]
	add r1, r0, #4
	add r2, r0, #8
	add r3, r0, #0xc
	str ip, [sp, #4]
	blx r7
_020BB15C:
	ldr r0, [r6, #4]
	ldr r1, [r6]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x1c
	mov r3, r1, lsl #0x12
	ldr r1, [r5, #0xc]
	mov r0, r0, lsl #0x10
	ldr r2, _020BB1E8 ; =_0210933C
	mov r3, r3, lsr #0x1f
	cmp r1, #0
	mov r0, r0, lsr #0x10
	ldr r1, [r2, r3, lsl #2]
	movne r0, r0, lsl #9
	bne _020BB1A0
	cmp r1, #4
	moveq r0, #0
	movne r0, r0, lsl #5
_020BB1A0:
	cmp r1, #2
	moveq r2, #1
	movne r2, #0
	add r1, r4, r0
	rsb r0, r2, #4
	mov r1, r1, lsr r0
	ldr r0, _020BB1EC ; =0x040004AC
	str r1, [r0]
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020BB1C8: .word 0xC000C000
_020BB1CC: .word _02109310
_020BB1D0: .word _021092F8
_020BB1D4: .word 0x040004A8
_020BB1D8: .word _02109344
_020BB1DC: .word _02109364
_020BB1E0: .word _02109394
_020BB1E4: .word _021DA47C
_020BB1E8: .word _0210933C
_020BB1EC: .word 0x040004AC
	arm_func_end CalcSpriteParams_

	arm_func_start NNSi_G2dSetOamSoftEmuAutoZOffsetFlag
NNSi_G2dSetOamSoftEmuAutoZOffsetFlag: ; 0x020BB1F0
	ldr r1, _020BB1FC ; =_021DA47C
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_020BB1FC: .word _021DA47C
	arm_func_end NNSi_G2dSetOamSoftEmuAutoZOffsetFlag

	arm_func_start NNSi_G2dResetOamSoftEmuAutoZOffset
NNSi_G2dResetOamSoftEmuAutoZOffset: ; 0x020BB200
	ldr r0, _020BB210 ; =_021DA47C
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_020BB210: .word _021DA47C
	arm_func_end NNSi_G2dResetOamSoftEmuAutoZOffset

	arm_func_start NNSi_G2dSetOamSoftEmuAutoZOffsetStep
NNSi_G2dSetOamSoftEmuAutoZOffsetStep: ; 0x020BB214
	ldr r1, _020BB220 ; =_021109FC
	str r0, [r1]
	bx lr
	.align 2, 0
_020BB220: .word _021109FC
	arm_func_end NNSi_G2dSetOamSoftEmuAutoZOffsetStep

	arm_func_start NNSi_G2dGetOamSoftEmuAutoZOffsetStep
NNSi_G2dGetOamSoftEmuAutoZOffsetStep: ; 0x020BB224
	ldr r0, _020BB230 ; =_021109FC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020BB230: .word _021109FC
	arm_func_end NNSi_G2dGetOamSoftEmuAutoZOffsetStep

	arm_func_start NNS_G2dDrawOneOam3DDirectWithPosFast
NNS_G2dDrawOneOam3DDirectWithPosFast: ; 0x020BB234
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x1c
	add ip, sp, #4
	mov r5, r1
	mov r4, r2
	mov r7, r3
	mov r6, r0
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #0x34]
	ldr r3, [sp, #0x38]
	mov r0, r7
	str ip, [sp]
	bl CalcSpriteParams_
	ldr r2, [r7]
	and r1, r2, #0x300
	cmp r1, #0x100
	cmpne r1, #0x300
	andne r0, r2, #0x30000000
	orrne r1, r1, r0
	cmp r1, #0x300
	bne _020BB2F8
	ldr r0, _020BB468 ; =0xC000C000
	ldr r3, _020BB46C ; =_02109310
	and r2, r2, r0
	and r0, r2, #0xc0000000
	and r2, r2, #0xc000
	mov ip, r2, asr #0xe
	mov lr, r0, lsr #0x1e
	ldr r1, _020BB470 ; =_021DA47C
	ldr r2, _020BB474 ; =_021092F8
	ldr r0, [r1, #8]
	mov lr, lr, lsl #1
	cmp r0, #0
	ldrne r0, [r1, #4]
	add r3, r3, ip, lsl #3
	add r2, r2, ip, lsl #3
	ldrh ip, [lr, r3]
	ldrh r3, [lr, r2]
	addne r4, r0, r4, lsl #12
	add r2, r6, ip, asr #1
	add r0, r5, r3, asr #1
	ldr r1, _020BB478 ; =0x04000470
	mov r2, r2, lsl #0xc
	str r2, [r1]
	mov r0, r0, lsl #0xc
	moveq r4, r4, lsl #0xc
	str r0, [r1]
	str r4, [r1]
	b _020BB328
_020BB2F8:
	ldr r0, _020BB470 ; =_021DA47C
	ldr r1, [r0, #8]
	cmp r1, #0
	ldrne r0, [r0, #4]
	ldr r1, _020BB478 ; =0x04000470
	addne r2, r0, r4, lsl #12
	mov r0, r6, lsl #0xc
	str r0, [r1]
	mov r0, r5, lsl #0xc
	moveq r2, r4, lsl #0xc
	str r0, [r1]
	str r2, [r1]
_020BB328:
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x18]
	ldr r1, _020BB47C ; =0x0400046C
	mov r0, r0, lsl #0xc
	str r0, [r1]
	mov r0, r2, lsl #0xc
	str r0, [r1]
	mov r0, #0x1000
	str r0, [r1]
	mov r0, #1
	str r0, [r1, #0x94]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #4]
	mov r0, r0, lsl #8
	mov r2, r0, asr #0x10
	mov r0, r3, lsl #8
	mov r2, r2, lsl #0x10
	mov r4, r0, asr #0x10
	mov r3, r2, lsr #0x10
	mov r2, r4, lsl #0x10
	mov r3, r3, lsl #0x10
	orr r2, r3, r2, lsr #16
	mov r0, #0x10000
	str r2, [r1, #0x1c]
	str r0, [r1, #0x24]
	ldr r2, [sp, #0x10]
	ldr r4, [sp, #0xc]
	mov r2, r2, lsl #8
	mov r3, r2, asr #0x10
	mov r2, r4, lsl #8
	mov r3, r3, lsl #0x10
	mov r2, r2, asr #0x10
	mov r3, r3, lsr #0x10
	mov r2, r2, lsl #0x10
	mov r3, r3, lsl #0x10
	orr r2, r3, r2, lsr #16
	str r2, [r1, #0x1c]
	add r0, r0, #0x40
	str r0, [r1, #0x24]
	ldr r0, [sp, #8]
	ldr r3, [sp, #0xc]
	mov r0, r0, lsl #8
	mov r2, r0, asr #0x10
	mov r0, r3, lsl #8
	mov r2, r2, lsl #0x10
	mov r0, r0, asr #0x10
	mov r2, r2, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r2, r2, lsl #0x10
	orr r0, r2, r0, lsr #16
	str r0, [r1, #0x1c]
	mov r0, #0x40
	str r0, [r1, #0x24]
	ldr r0, [sp, #8]
	ldr r3, [sp, #4]
	mov r0, r0, lsl #8
	mov r2, r0, asr #0x10
	mov r0, r3, lsl #8
	mov r2, r2, lsl #0x10
	mov r0, r0, asr #0x10
	mov r2, r2, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r2, r2, lsl #0x10
	orr r0, r2, r0, lsr #16
	str r0, [r1, #0x1c]
	mov r0, #0
	str r0, [r1, #0x24]
	ldr r2, _020BB470 ; =_021DA47C
	str r0, [r1, #0x98]
	ldr r0, [r2, #8]
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	ldr r0, _020BB480 ; =_021109FC
	ldr r1, [r2, #4]
	ldr r0, [r0]
	add r0, r1, r0
	str r0, [r2, #4]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_020BB468: .word 0xC000C000
_020BB46C: .word _02109310
_020BB470: .word _021DA47C
_020BB474: .word _021092F8
_020BB478: .word 0x04000470
_020BB47C: .word 0x0400046C
_020BB480: .word _021109FC
	arm_func_end NNS_G2dDrawOneOam3DDirectWithPosFast

	arm_func_start DoAffineTransforme_
DoAffineTransforme_: ; 0x020BB484
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldr r4, [r1]
	ldr r3, _020BB728 ; =0x01FF0000
	and r3, r4, r3
	mov r3, r3, lsr #0x10
	mov r3, r3, lsl #0x10
	mov r3, r3, asr #0x10
	cmp r3, #0xff
	orrgt r3, r3, #0xff00
	movgt r3, r3, lsl #0x10
	movgt r3, r3, asr #0x10
	mov r3, r3, lsl #0xc
	str r3, [sp, #8]
	ldr r3, [r1]
	and r3, r3, #0xff
	cmp r3, #0x7f
	orrgt r3, r3, #0xff00
	movgt r3, r3, lsl #0x10
	movgt r3, r3, asr #0x10
	mov r3, r3, lsl #0xc
	str r3, [sp, #0xc]
	ldr r5, [r1]
	and r4, r5, #0x300
	cmp r4, #0x100
	cmpne r4, #0x300
	andne r3, r5, #0x30000000
	orrne r4, r4, r3
	cmp r4, #0x300
	bne _020BB548
	ldr r3, _020BB72C ; =0xC000C000
	ldr r4, _020BB730 ; =_02109310
	and r3, r5, r3
	and r5, r3, #0xc0000000
	and r3, r3, #0xc000
	mov r6, r5, lsr #0x1e
	mov r5, r3, asr #0xe
	ldr r3, _020BB734 ; =_021092F8
	mov r6, r6, lsl #1
	add r4, r4, r5, lsl #3
	add r3, r3, r5, lsl #3
	ldrh r5, [r6, r4]
	ldr r7, [sp, #8]
	ldrh r3, [r6, r3]
	ldr r4, [sp, #0xc]
	add r5, r7, r5, lsl #11
	add r3, r4, r3, lsl #11
	str r5, [sp, #8]
	str r3, [sp, #0xc]
_020BB548:
	ldr r6, [r0, #8]
	ldr r4, [sp, #0xc]
	add r3, sp, #8
	smull r4, r7, r6, r4
	cmp r3, r3
	addeq r3, sp, #0
	adds r8, r4, #0x1000
	ldr r5, [r0]
	ldr r4, [sp, #8]
	adc r6, r7, #0
	smlal r8, r6, r5, r4
	mov r4, r8, lsr #0xc
	orr r4, r4, r6, lsl #20
	str r4, [r3]
	ldr r6, [r0, #0xc]
	ldr r4, [sp, #0xc]
	ldr r5, [r0, #4]
	smull r4, r7, r6, r4
	adds r8, r4, #0x1000
	ldr r4, [sp, #8]
	adc r6, r7, #0
	smlal r8, r6, r5, r4
	mov r5, r8, lsr #0xc
	add r4, sp, #0
	orr r5, r5, r6, lsl #20
	str r5, [r3, #4]
	cmp r3, r4
	bne _020BB5C8
	ldr r4, [sp]
	ldr r3, [sp, #4]
	str r4, [sp, #8]
	str r3, [sp, #0xc]
_020BB5C8:
	ldr r3, _020BB738 ; =_021DA498
	ldr r3, [r3]
	ldr r3, [r3, #4]
	cmp r3, #0
	beq _020BB610
	cmp r3, #2
	moveq r5, #0x300
	movne r5, #0x100
	ldr r4, [r1]
	ldr r3, _020BB73C ; =0xC1FFFCFF
	cmp r5, #0x100
	andeq r3, r4, r3
	orreq r3, r3, r5
	streq r3, [r1]
	beq _020BB610
	and r3, r4, r3
	orr r3, r3, r5
	str r3, [r1]
_020BB610:
	ldr r6, [r1]
	ldr r5, _020BB730 ; =_02109310
	and r4, r6, #0x300
	cmp r4, #0x100
	cmpne r4, #0x300
	andne r3, r6, #0x30000000
	orrne r4, r4, r3
	ldr r3, _020BB72C ; =0xC000C000
	ldr r8, _020BB734 ; =_021092F8
	and r3, r6, r3
	and r6, r3, #0xc0000000
	and r3, r3, #0xc000
	mov lr, r3, asr #0xe
	mov r6, r6, lsr #0x1e
	mov r3, r6, lsl #1
	add r5, r5, lr, lsl #3
	ldrh r5, [r3, r5]
	add lr, r8, lr, lsl #3
	ldrh r3, [r3, lr]
	mov ip, r5, asr #1
	mov r5, ip, lsl #0xc
	ldr r6, [r0]
	rsb r7, r5, #0
	mla r7, r6, ip, r7
	ldr r6, [r0, #8]
	mov r3, r3, asr #1
	mla r7, r6, r3, r7
	ldr lr, [sp, #8]
	cmp r4, #0x300
	add r6, lr, r7
	str r6, [sp, #8]
	mov lr, r3, lsl #0xc
	ldr r6, [r0, #4]
	rsb r7, lr, #0
	mla r7, r6, ip, r7
	ldr r0, [r0, #0xc]
	ldr r6, [sp, #0xc]
	mla r3, r0, r3, r7
	add r0, r6, r3
	str r0, [sp, #0xc]
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	beq _020BB6D8
	ldr r3, [sp, #8]
	ldr r0, [sp, #0xc]
	sub r3, r3, r5
	sub r0, r0, lr
	str r3, [sp, #8]
	str r0, [sp, #0xc]
_020BB6D8:
	ldr r4, [sp, #8]
	ldr r0, [r2]
	ldr r3, [sp, #0xc]
	add r4, r4, r0
	str r4, [sp, #8]
	ldr r0, [r2, #4]
	mov r4, r4, asr #0xc
	add r0, r3, r0
	str r0, [sp, #0xc]
	mov r2, r0, asr #0xc
	ldr r3, [r1]
	ldr r0, _020BB740 ; =0xFE00FF00
	and r2, r2, #0xff
	and r0, r3, r0
	mov r3, r4, lsl #0x17
	orr r0, r0, r2
	orr r0, r0, r3, lsr #7
	str r0, [r1]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020BB728: .word 0x01FF0000
_020BB72C: .word 0xC000C000
_020BB730: .word _02109310
_020BB734: .word _021092F8
_020BB738: .word _021DA498
_020BB73C: .word 0xC1FFFCFF
_020BB740: .word 0xFE00FF00
	arm_func_end DoAffineTransforme_

	arm_func_start DrawCellToSurface2D_
DrawCellToSurface2D_: ; 0x020BB744
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	ldr r2, _020BBB44 ; =_021DA498
	mov r6, r0
	ldr r4, [r2]
	ldr r0, _020BBB44 ; =_021DA498
	ldr r5, [r4, #0x2c]
	mov fp, r1
	cmp r5, #0
	ldreq r5, _020BBB48 ; =_021093CC
	ldr r2, [r0]
	ldr r3, [r5, #0x10]
	str r3, [sp, #0x18]
	ldr r1, [r5, #0x14]
	str r1, [sp, #0x1c]
	ldr r0, [r6]
	sub r0, r3, r0
	str r0, [sp, #0x18]
	ldr r0, [r6, #4]
	sub r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r1, [r2, #0x24]
	ldr r0, [r2, #0x10]
	cmp r1, #0
	str r0, [sp, #0xc]
	bne _020BB7C0
	ldr r0, [r2, #0x28]
	cmp r0, #0
	movne r0, #1
	strne r0, [sp]
	bne _020BB7C8
_020BB7C0:
	mov r0, #0
	str r0, [sp]
_020BB7C8:
	ldrh r0, [fp]
	mov r8, #0
	cmp r0, #0
	addls sp, sp, #0x40
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0x400
	str r0, [sp, #0x10]
	ldr r0, _020BBB4C ; =0x0000FFFE
	ldr r7, _020BBB44 ; =_021DA498
	add r0, r0, #1
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	rsb r0, r0, #0
	str r0, [sp, #0x10]
_020BB800:
	mov r0, #6
	mul r1, r8, r0
	ldr r2, [r7]
	mov r0, #1
	str r0, [r2, #0x30]
	ldr r0, [fp, #4]
	add r2, r0, r1
	ldrh r0, [r0, r1]
	strh r0, [r4, #0x38]
	ldrh r0, [r2, #2]
	strh r0, [r4, #0x3a]
	ldrh r0, [r2, #4]
	strh r0, [r4, #0x3c]
	ldr r3, [r6, #0x20]
	cmp r3, #0
	beq _020BB850
	ldr r0, [r7]
	mov r1, fp
	mov r2, r8
	blx r3
_020BB850:
	ldr r0, [r7]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _020BBB24
	ldr r0, [sp]
	ldr r1, [r4, #0x3c]
	cmp r0, #0
	ldr r0, [sp, #0x10]
	and r2, r1, r0
	ldr r0, [sp, #0xc]
	mov r1, r1, lsl #0x16
	add r1, r0, r1, lsr #22
	ldr r0, [sp, #0x10]
	and r0, r1, r0, lsr #22
	orr r0, r2, r0
	str r0, [r4, #0x3c]
	beq _020BB994
	ldr r0, [r4, #0x38]
	ldr lr, [r7]
	mov r1, r0, lsl #2
	mov r0, r0, lsl #3
	mov r1, r1, lsr #0x1f
	mov r0, r0, lsr #0x1f
	orr sl, r0, r1, lsl #1
	ldr sb, [lr, #0x28]
	ldr r1, [r6, #0x14]
	add r0, sb, sl, lsl #2
	add r0, r0, r1, lsl #1
	ldrh r1, [r0, #0xe]
	ldr r0, [sp, #0x14]
	str r1, [sp, #8]
	cmp r1, r0
	bne _020BB960
	cmp sl, #0
	bne _020BB8F0
	ldr r1, [lr, #0x20]
	mov r0, sb
	blx r1
	str r0, [sp, #8]
	b _020BB94C
_020BB8F0:
	add ip, sp, #0x20
	ldmia sb, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	tst sl, #1
	beq _020BB91C
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x24]
	rsb r1, r1, #0
	str r1, [sp, #0x20]
	rsb r0, r0, #0
	str r0, [sp, #0x24]
_020BB91C:
	tst sl, #2
	beq _020BB93C
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	rsb r1, r1, #0
	str r1, [sp, #0x28]
	rsb r0, r0, #0
	str r0, [sp, #0x2c]
_020BB93C:
	ldr r1, [lr, #0x20]
	add r0, sp, #0x20
	blx r1
	str r0, [sp, #8]
_020BB94C:
	ldr r1, [r6, #0x14]
	add r0, sb, sl, lsl #2
	add r1, r0, r1, lsl #1
	ldr r0, [sp, #8]
	strh r0, [r1, #0xe]
_020BB960:
	ldr r1, [r5]
	add r0, sp, #0x30
	str r1, [sp, #0x30]
	ldr r2, [r5, #4]
	add r1, r4, #0x38
	str r2, [sp, #0x34]
	ldr r3, [r5, #8]
	add r2, sp, #0x18
	str r3, [sp, #0x38]
	ldr r3, [r5, #0xc]
	str r3, [sp, #0x3c]
	bl DoAffineTransforme_
	b _020BBAE4
_020BB994:
	ldr r0, _020BBB4C ; =0x0000FFFE
	str r0, [sp, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0x24]
	cmp r1, #0
	beq _020BBA9C
	ldr r2, [r4, #0x38]
	ldr r1, _020BBB50 ; =0xC000C000
	mov sl, r2, lsl #3
	and sb, r2, r1
	bl NNS_G2dIsRndCoreFlipH
	eor r0, r0, sl, lsr #31
	ldr r1, [r4, #0x38]
	str r0, [sp, #4]
	ldr r0, [r7]
	mov sl, r1, lsl #2
	bl NNS_G2dIsRndCoreFlipV
	eor r2, r0, sl, lsr #31
	ldr r0, [r4, #0x38]
	bic r1, r0, #0x10000000
	ldr r0, [sp, #4]
	orr r0, r1, r0, lsl #28
	bic r0, r0, #0x20000000
	orr r0, r0, r2, lsl #29
	str r0, [r4, #0x38]
	ldr r0, [r7]
	bl NNS_G2dIsRndCoreFlipH
	cmp r0, #0
	beq _020BBA4C
	and r1, sb, #0xc000
	mov r2, r1, asr #0xe
	ldr r1, _020BBB54 ; =_02109310
	and r3, sb, #0xc0000000
	mov r3, r3, lsr #0x1e
	add r2, r1, r2, lsl #3
	mov r3, r3, lsl #1
	ldr r0, [r4, #0x38]
	ldr r1, _020BBB58 ; =0xFE00FFFF
	ldrh r2, [r3, r2]
	and r1, r0, r1
	mov r0, r0, lsl #7
	add r0, r2, r0, lsr #23
	rsb r0, r0, #0
	mov r0, r0, lsl #0x17
	orr r0, r1, r0, lsr #7
	str r0, [r4, #0x38]
_020BBA4C:
	ldr r0, [r7]
	bl NNS_G2dIsRndCoreFlipV
	cmp r0, #0
	beq _020BBA9C
	and r1, sb, #0xc000
	mov r3, r1, asr #0xe
	and r1, sb, #0xc0000000
	mov r1, r1, lsr #0x1e
	mov r2, r1, lsl #1
	ldr r1, _020BBB5C ; =_021092F8
	ldr r0, [r4, #0x38]
	add r1, r1, r3, lsl #3
	ldrh r1, [r2, r1]
	bic r2, r0, #0xff
	mov r0, r0, lsl #0x18
	add r0, r1, r0, lsr #24
	rsb r0, r0, #0
	and r0, r0, #0xff
	orr r0, r2, r0
	str r0, [r4, #0x38]
_020BBA9C:
	ldr r2, [r4, #0x38]
	ldr r0, _020BBB58 ; =0xFE00FFFF
	ldr r1, [sp, #0x18]
	and r3, r2, r0
	mov r2, r2, lsl #7
	mov r0, r1, asr #0xc
	add r0, r0, r2, lsr #23
	mov r0, r0, lsl #0x17
	orr r0, r3, r0, lsr #7
	str r0, [r4, #0x38]
	bic r2, r0, #0xff
	mov r1, r0, lsl #0x18
	ldr r0, [sp, #0x1c]
	mov r0, r0, asr #0xc
	add r0, r0, r1, lsr #24
	and r0, r0, #0xff
	orr r0, r2, r0
	str r0, [r4, #0x38]
_020BBAE4:
	ldr r3, [r7]
	ldr r1, [sp, #8]
	ldr r3, [r3, #0x1c]
	add r0, r4, #0x38
	mov r2, #0
	blx r3
	cmp r0, #1
	addne sp, sp, #0x40
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r3, [r6, #0x24]
	cmp r3, #0
	beq _020BBB24
	ldr r0, [r7]
	mov r1, fp
	mov r2, r8
	blx r3
_020BBB24:
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	mov r8, r0, lsr #0x10
	ldrh r1, [fp]
	cmp r1, r0, lsr #16
	bhi _020BB800
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020BBB44: .word _021DA498
_020BBB48: .word _021093CC
_020BBB4C: .word 0x0000FFFE
_020BBB50: .word 0xC000C000
_020BBB54: .word _02109310
_020BBB58: .word 0xFE00FFFF
_020BBB5C: .word _021092F8
	arm_func_end DrawCellToSurface2D_

	arm_func_start DrawOamToSurface3D_
DrawOamToSurface3D_: ; 0x020BBB60
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	ldr r1, _020BBD94 ; =_021DA498
	mov r7, r0
	ldr r0, [r1]
	add r0, r0, #0x40
	bl G3_LoadMtx43
	ldr r0, _020BBD94 ; =_021DA498
	ldr r0, [r0]
	ldr r1, [r0, #0x24]
	cmp r1, #0
	beq _020BBD24
	ldr r2, [r7]
	ldr r1, _020BBD98 ; =0xC000C000
	and r4, r2, r1
	bl NNS_G2dIsRndCoreFlipH
	cmp r0, #0
	ldr r0, [r7]
	beq _020BBBF0
	mov r0, r0, lsl #7
	mov r3, r0, lsr #0x17
	and r2, r4, #0xc000
	and r1, r4, #0xc0000000
	mov r1, r1, lsr #0x1e
	ldr r0, _020BBD9C ; =_02109310
	mov r2, r2, asr #0xe
	mov r1, r1, lsl #1
	add r0, r0, r2, lsl #3
	cmp r3, #0xff
	ldrh r1, [r1, r0]
	orrgt r0, r3, #0xff00
	movgt r0, r0, lsl #0x10
	movgt r3, r0, asr #0x10
	add r0, r3, r1
	rsb r0, r0, #0
	b _020BBC08
_020BBBF0:
	mov r0, r0, lsl #7
	mov r0, r0, lsr #0x17
	cmp r0, #0xff
	orrgt r0, r0, #0xff00
	movgt r0, r0, lsl #0x10
	movgt r0, r0, asr #0x10
_020BBC08:
	mov r0, r0, lsl #0x10
	mov r1, r0, lsr #0x10
	ldr r0, _020BBD94 ; =_021DA498
	mov r1, r1, lsl #0x10
	ldr r0, [r0]
	mov r5, r1, asr #0x10
	bl NNS_G2dIsRndCoreFlipV
	cmp r0, #0
	ldr r0, [r7]
	beq _020BBC74
	mov r0, r0, lsl #0x18
	mov r3, r0, lsr #0x18
	and r2, r4, #0xc000
	and r1, r4, #0xc0000000
	mov r1, r1, lsr #0x1e
	ldr r0, _020BBDA0 ; =_021092F8
	mov r2, r2, asr #0xe
	mov r1, r1, lsl #1
	add r0, r0, r2, lsl #3
	cmp r3, #0x7f
	ldrh r1, [r1, r0]
	orrgt r0, r3, #0xff00
	movgt r0, r0, lsl #0x10
	movgt r3, r0, asr #0x10
	add r0, r3, r1
	rsb r0, r0, #0
	b _020BBC8C
_020BBC74:
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x18
	cmp r0, #0x7f
	orrgt r0, r0, #0xff00
	movgt r0, r0, lsl #0x10
	movgt r0, r0, asr #0x10
_020BBC8C:
	mov r0, r0, lsl #0x10
	mov r4, r0, lsr #0x10
	ldr r0, _020BBD94 ; =_021DA498
	ldr r1, [r7]
	ldr r0, [r0]
	mov r6, r1, lsl #3
	bl NNS_G2dIsRndCoreFlipH
	ldr r2, [r7]
	ldr r1, _020BBD94 ; =_021DA498
	eor r6, r0, r6, lsr #31
	ldr r0, [r1]
	mov r8, r2, lsl #2
	bl NNS_G2dIsRndCoreFlipV
	ldr r1, [r7]
	eor r3, r0, r8, lsr #31
	bic r2, r1, #0x10000000
	orr r2, r2, r6, lsl #28
	bic r2, r2, #0x20000000
	mov r1, r4, lsl #0x10
	orr r3, r2, r3, lsl #29
	str r2, [r7]
	str r3, [r7]
	ldr r2, _020BBD94 ; =_021DA498
	mov r0, r5
	ldr r5, [r2]
	mov r1, r1, asr #0x10
	ldr r4, [r5, #8]
	mov r3, r7
	add r4, r4, #0xc
	str r4, [sp]
	ldr r4, [r5, #0x14]
	mvn r2, #0
	str r4, [sp, #4]
	ldr r4, [r5, #0x18]
	str r4, [sp, #8]
	bl NNS_G2dDrawOneOam3DDirectWithPosFast
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020BBD24:
	ldr r2, _020BBD94 ; =_021DA498
	ldr r0, [r7]
	ldr r5, [r2]
	mov r0, r0, lsl #7
	ldr r1, [r7]
	ldr r4, [r5, #8]
	mov r0, r0, lsr #0x17
	cmp r0, #0xff
	orrgt r0, r0, #0xff00
	mov r1, r1, lsl #0x18
	add r4, r4, #0xc
	movgt r0, r0, lsl #0x10
	str r4, [sp]
	ldr r4, [r5, #0x14]
	mov r1, r1, lsr #0x18
	movgt r0, r0, asr #0x10
	cmp r1, #0x7f
	orrgt r1, r1, #0xff00
	movgt r1, r1, lsl #0x10
	str r4, [sp, #4]
	ldr r4, [r5, #0x18]
	movgt r1, r1, asr #0x10
	mov r3, r7
	mvn r2, #0
	str r4, [sp, #8]
	bl NNS_G2dDrawOneOam3DDirectWithPosFast
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020BBD94: .word _021DA498
_020BBD98: .word 0xC000C000
_020BBD9C: .word _02109310
_020BBDA0: .word _021092F8
	arm_func_end DrawOamToSurface3D_

	arm_func_start DrawCellToSurface3D_
DrawCellToSurface3D_: ; 0x020BBDA4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sb, r1
	ldr r5, _020BBE68 ; =_021DA498
	ldrh r1, [sb]
	ldr r7, [r5]
	mov sl, r0
	mov r8, #0
	cmp r1, #0
	ldmlsia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r6, #1
	mov r4, #6
_020BBDD0:
	mul r1, r8, r4
	ldr r0, [r5]
	str r6, [r0, #0x30]
	ldr r2, [sb, #4]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	strh r0, [r7, #0x38]
	ldrh r0, [r1, #2]
	strh r0, [r7, #0x3a]
	ldrh r0, [r1, #4]
	strh r0, [r7, #0x3c]
	ldr r3, [sl, #0x20]
	cmp r3, #0
	beq _020BBE18
	ldr r0, [r5]
	mov r1, sb
	mov r2, r8
	blx r3
_020BBE18:
	ldr r0, [r5]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _020BBE30
	add r0, r7, #0x38
	bl DrawOamToSurface3D_
_020BBE30:
	ldr r3, [sl, #0x24]
	cmp r3, #0
	beq _020BBE4C
	ldr r0, [r5]
	mov r1, sb
	mov r2, r8
	blx r3
_020BBE4C:
	ldrh r1, [sb]
	add r0, r8, #1
	mov r0, r0, lsl #0x10
	cmp r1, r0, lsr #16
	mov r8, r0, lsr #0x10
	bhi _020BBDD0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020BBE68: .word _021DA498
	arm_func_end DrawCellToSurface3D_

	arm_func_start NNS_G2dInitRndCore
NNS_G2dInitRndCore: ; 0x020BBE6C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, r4
	mov r0, #0
	mov r2, #0x70
	bl MIi_CpuClear16
	mov r1, #0
	str r1, [r4]
	mov r0, #2
	stmib r4, {r0, r1}
	str r1, [r4, #0xc]
	str r1, [r4, #0x24]
	mov r0, #1
	str r0, [r4, #0x30]
	str r1, [r4, #0x28]
	ldmia sp!, {r4, pc}
	arm_func_end NNS_G2dInitRndCore

	arm_func_start NNS_G2dSetRndCoreImageProxy
NNS_G2dSetRndCoreImageProxy: ; 0x020BBEAC
	str r1, [r0, #8]
	str r2, [r0, #0xc]
	bx lr
	arm_func_end NNS_G2dSetRndCoreImageProxy

	arm_func_start NNS_G2dSetRndCoreOamRegisterFunc
NNS_G2dSetRndCoreOamRegisterFunc: ; 0x020BBEB8
	str r1, [r0, #0x1c]
	str r2, [r0, #0x20]
	bx lr
	arm_func_end NNS_G2dSetRndCoreOamRegisterFunc

	arm_func_start NNS_G2dSetRndCoreAffineOverwriteMode
NNS_G2dSetRndCoreAffineOverwriteMode: ; 0x020BBEC4
	str r1, [r0, #4]
	bx lr
	arm_func_end NNS_G2dSetRndCoreAffineOverwriteMode

	arm_func_start NNS_G2dSetRndCoreCurrentMtx3D
NNS_G2dSetRndCoreCurrentMtx3D: ; 0x020BBECC
	ldr r1, _020BBF30 ; =_021DA498
	mov r3, #0
	ldr ip, [r1]
	mov r1, #0x1000
	str r0, [ip, #0x2c]
	ldr r2, [r0]
	str r2, [ip, #0x40]
	ldr r2, [r0, #4]
	str r2, [ip, #0x44]
	str r3, [ip, #0x48]
	ldr r2, [r0, #8]
	str r2, [ip, #0x4c]
	ldr r2, [r0, #0xc]
	str r2, [ip, #0x50]
	str r3, [ip, #0x54]
	str r3, [ip, #0x58]
	str r3, [ip, #0x5c]
	str r1, [ip, #0x60]
	ldr r1, [r0, #0x10]
	str r1, [ip, #0x64]
	ldr r0, [r0, #0x14]
	str r0, [ip, #0x68]
	ldr r0, [ip, #0x34]
	str r0, [ip, #0x6c]
	bx lr
	.align 2, 0
_020BBF30: .word _021DA498
	arm_func_end NNS_G2dSetRndCoreCurrentMtx3D

	arm_func_start NNS_G2dSetRndCoreCurrentMtx2D
NNS_G2dSetRndCoreCurrentMtx2D: ; 0x020BBF34
	ldr r2, _020BBF48 ; =_021DA498
	ldr r2, [r2]
	str r0, [r2, #0x2c]
	str r1, [r2, #0x28]
	bx lr
	.align 2, 0
_020BBF48: .word _021DA498
	arm_func_end NNS_G2dSetRndCoreCurrentMtx2D

	arm_func_start NNS_G2dSetRndCore3DSoftSpriteZvalue
NNS_G2dSetRndCore3DSoftSpriteZvalue: ; 0x020BBF4C
	str r1, [r0, #0x34]
	bx lr
	arm_func_end NNS_G2dSetRndCore3DSoftSpriteZvalue

	arm_func_start NNS_G2dSetRndCoreSurface
NNS_G2dSetRndCoreSurface: ; 0x020BBF54
	str r1, [r0]
	bx lr
	arm_func_end NNS_G2dSetRndCoreSurface

	arm_func_start NNS_G2dIsRndCoreFlipH
NNS_G2dIsRndCoreFlipH: ; 0x020BBF5C
	ldr r0, [r0, #0x24]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end NNS_G2dIsRndCoreFlipH

	arm_func_start NNS_G2dIsRndCoreFlipV
NNS_G2dIsRndCoreFlipV: ; 0x020BBF70
	ldr r0, [r0, #0x24]
	tst r0, #2
	movne r0, #1
	moveq r0, #0
	bx lr
	arm_func_end NNS_G2dIsRndCoreFlipV

	arm_func_start NNS_G2dSetRndCoreFlipMode
NNS_G2dSetRndCoreFlipMode: ; 0x020BBF84
	cmp r1, #0
	ldr r1, [r0, #0x24]
	orrne r1, r1, #1
	biceq r1, r1, #1
	str r1, [r0, #0x24]
	ldr r1, [r0, #0x24]
	cmp r2, #0
	orrne r1, r1, #2
	biceq r1, r1, #2
	str r1, [r0, #0x24]
	bx lr
	arm_func_end NNS_G2dSetRndCoreFlipMode

	arm_func_start NNS_G2dRndCoreBeginRendering
NNS_G2dRndCoreBeginRendering: ; 0x020BBFB0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _020BC0B4 ; =_021DA498
	mov r4, r0
	str r4, [r2]
	ldr r0, [r4]
	ldr r5, [r0, #0x14]
	cmp r5, #0
	bne _020BC068
	ldr lr, _020BC0B8 ; =0x04000440
	mov r1, #0
	str r1, [lr]
	str r1, [lr, #4]
	ldr ip, [r4]
	mov r0, #1
	ldmia ip, {r3, ip}
	rsb r3, r3, #0
	str r3, [lr, #0x30]
	rsb r3, ip, #0
	str r3, [lr, #0x30]
	str r1, [lr, #0x30]
	str r0, [lr]
	ldr r0, [r2]
	ldr r5, [r0, #8]
	mov r0, r5
	bl NNS_G2dIsImageReadyToUse
	cmp r0, #0
	moveq r0, #0
	beq _020BC02C
	mov r0, r5
	mov r1, #0
	bl NNS_G2dGetImageLocation
_020BC02C:
	ldr r1, _020BC0B4 ; =_021DA498
	str r0, [r4, #0x14]
	ldr r0, [r1]
	mov r1, #0
	ldr r5, [r0, #0xc]
	mov r0, r5
	bl NNS_G2dIsImagePaletteReadyToUse
	cmp r0, #0
	moveq r0, #0
	beq _020BC060
	mov r0, r5
	mov r1, #0
	bl NNS_G2dGetImagePaletteLocation
_020BC060:
	str r0, [r4, #0x18]
	ldmia sp!, {r3, r4, r5, pc}
_020BC068:
	ldr r4, [r4, #8]
	mov r1, r5
	mov r0, r4
	bl NNS_G2dIsImageReadyToUse
	cmp r0, #0
	moveq r1, #0
	beq _020BC0A4
	mov r0, r4
	mov r1, r5
	bl NNS_G2dGetImageLocation
	ldr r1, [r4, #0x20]
	and r1, r1, #0x700000
	mov r1, r1, asr #0x14
	add r1, r1, #5
	mov r1, r0, lsr r1
_020BC0A4:
	ldr r0, _020BC0B4 ; =_021DA498
	ldr r0, [r0]
	str r1, [r0, #0x10]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BC0B4: .word _021DA498
_020BC0B8: .word 0x04000440
	arm_func_end NNS_G2dRndCoreBeginRendering

	arm_func_start NNS_G2dRndCoreEndRendering
NNS_G2dRndCoreEndRendering: ; 0x020BC0BC
	ldr r0, _020BC118 ; =_021DA498
	ldr r3, [r0]
	ldr r1, [r3]
	ldr r1, [r1, #0x14]
	cmp r1, #0
	bne _020BC0F0
	ldr r1, _020BC11C ; =0x04000440
	mov r0, #0
	str r0, [r1]
	mov r0, #1
	str r0, [r1, #8]
	str r0, [r1]
	b _020BC108
_020BC0F0:
	mov r2, #0
	str r2, [r3, #0x10]
	ldr r1, [r0]
	str r2, [r1, #0x2c]
	ldr r0, [r0]
	str r2, [r0, #0x28]
_020BC108:
	ldr r0, _020BC118 ; =_021DA498
	mov r1, #0
	str r1, [r0]
	bx lr
	.align 2, 0
_020BC118: .word _021DA498
_020BC11C: .word 0x04000440
	arm_func_end NNS_G2dRndCoreEndRendering

	arm_func_start NNS_G2dRndCoreDrawCell
NNS_G2dRndCoreDrawCell: ; 0x020BC120
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020BC1D0 ; =_021DA498
	mov r5, r0
	ldr r2, [r1]
	ldr r4, [r2]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #1
	str r0, [r2, #0x30]
	ldr r2, [r4, #0x18]
	cmp r2, #0
	beq _020BC160
	ldr r0, [r1]
	mov r1, r5
	blx r2
_020BC160:
	ldr r0, _020BC1D0 ; =_021DA498
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _020BC1B0
	ldr r0, [r4, #0x14]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020BC1B0
_020BC184: ; jump table
	b _020BC194 ; case 0
	b _020BC1A4 ; case 1
	b _020BC1A4 ; case 2
	b _020BC1B0 ; case 3
_020BC194:
	mov r0, r4
	mov r1, r5
	bl DrawCellToSurface3D_
	b _020BC1B0
_020BC1A4:
	mov r0, r4
	mov r1, r5
	bl DrawCellToSurface2D_
_020BC1B0:
	ldr r2, [r4, #0x1c]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _020BC1D0 ; =_021DA498
	mov r1, r5
	ldr r0, [r0]
	blx r2
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BC1D0: .word _021DA498
	arm_func_end NNS_G2dRndCoreDrawCell

	arm_func_start NNS_G2dRndCoreDrawCellVramTransfer
NNS_G2dRndCoreDrawCellVramTransfer: ; 0x020BC1D4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020BC2B8 ; =_021DA498
	mov r6, r0
	ldr r3, [r2]
	mov r4, r1
	ldr r5, [r3]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, #1
	str r0, [r3, #0x30]
	ldr r3, [r5, #0x18]
	cmp r3, #0
	beq _020BC218
	ldr r0, [r2]
	mov r1, r6
	blx r3
_020BC218:
	ldr r0, _020BC2B8 ; =_021DA498
	ldr r0, [r0]
	ldr r0, [r0, #0x30]
	cmp r0, #0
	beq _020BC298
	mvn r0, #0
	cmp r4, r0
	beq _020BC25C
	mov r0, r4
	ldr r4, [r5, #0x14]
	bl NNSi_G2dGetCellTransferState
	mov r3, #1
	mvn r1, r3, lsl r4
	ldr r2, [r0, #0x20]
	and r1, r2, r1
	orr r1, r1, r3, lsl r4
	str r1, [r0, #0x20]
_020BC25C:
	ldr r0, [r5, #0x14]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020BC298
_020BC26C: ; jump table
	b _020BC27C ; case 0
	b _020BC28C ; case 1
	b _020BC28C ; case 2
	b _020BC298 ; case 3
_020BC27C:
	mov r0, r5
	mov r1, r6
	bl DrawCellToSurface3D_
	b _020BC298
_020BC28C:
	mov r0, r5
	mov r1, r6
	bl DrawCellToSurface2D_
_020BC298:
	ldr r2, [r5, #0x1c]
	cmp r2, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _020BC2B8 ; =_021DA498
	mov r1, r6
	ldr r0, [r0]
	blx r2
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020BC2B8: .word _021DA498
	arm_func_end NNS_G2dRndCoreDrawCellVramTransfer

	arm_func_start GetGlyphIndex
GetGlyphIndex: ; 0x020BC2BC
	stmdb sp!, {r3, lr}
	ldrh r3, [r0, #4]
	ldr r2, _020BC380 ; =0x0000FFFF
	cmp r3, #0
	beq _020BC2E4
	cmp r3, #1
	beq _020BC300
	cmp r3, #2
	beq _020BC314
	b _020BC378
_020BC2E4:
	ldrh r2, [r0]
	ldrh r3, [r0, #0xc]
	sub r0, r1, r2
	add r0, r3, r0
	mov r0, r0, lsl #0x10
	mov r2, r0, lsr #0x10
	b _020BC378
_020BC300:
	ldrh r2, [r0]
	sub r1, r1, r2
	add r0, r0, r1, lsl #1
	ldrh r2, [r0, #0xc]
	b _020BC378
_020BC314:
	ldrh r3, [r0, #0xc]
	add ip, r0, #0xe
	sub r0, r3, #1
	add lr, ip, r0, lsl #2
	cmp ip, lr
	bhi _020BC378
_020BC32C:
	sub r3, lr, ip
	mov r0, r3, asr #1
	add r0, r3, r0, lsr #30
	mov r0, r0, asr #2
	add r0, r0, r0, lsr #31
	mov r3, r0, asr #1
	mov r0, r3, lsl #2
	ldrh r0, [ip, r0]
	add r3, ip, r3, lsl #2
	cmp r0, r1
	addlo ip, r3, #4
	blo _020BC370
	cmp r1, r0
	sublo lr, r3, #4
	blo _020BC370
	ldrh r2, [r3, #2]
	b _020BC378
_020BC370:
	cmp ip, lr
	bls _020BC32C
_020BC378:
	mov r0, r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BC380: .word 0x0000FFFF
	arm_func_end GetGlyphIndex

	arm_func_start NNS_G2dFontInitUTF16
NNS_G2dFontInitUTF16: ; 0x020BC384
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	mov r1, r4
	bl NNSi_G2dGetUnpackedFont
	ldr r0, _020BC3A4 ; =NNSi_G2dSplitCharUTF16
	str r0, [r4, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020BC3A4: .word NNSi_G2dSplitCharUTF16
	arm_func_end NNS_G2dFontInitUTF16

	arm_func_start NNS_G2dFontFindGlyphIndex
NNS_G2dFontFindGlyphIndex: ; 0x020BC3A8
	stmdb sp!, {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #0x10]
	cmp r0, #0
	beq _020BC3E4
_020BC3BC:
	ldrh r2, [r0]
	cmp r2, r1
	ldrlsh r2, [r0, #2]
	cmpls r1, r2
	bhi _020BC3D8
	bl GetGlyphIndex
	ldmia sp!, {r3, pc}
_020BC3D8:
	ldr r0, [r0, #8]
	cmp r0, #0
	bne _020BC3BC
_020BC3E4:
	ldr r0, _020BC3EC ; =0x0000FFFF
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BC3EC: .word 0x0000FFFF
	arm_func_end NNS_G2dFontFindGlyphIndex

	arm_func_start NNS_G2dFontGetCharWidthsFromIndex
NNS_G2dFontGetCharWidthsFromIndex: ; 0x020BC3F0
	ldr ip, [r0]
	ldr r3, [ip, #0xc]
	cmp r3, #0
	beq _020BC434
_020BC400:
	ldrh r2, [r3]
	cmp r2, r1
	ldrlsh r0, [r3, #2]
	cmpls r1, r0
	bhi _020BC428
	sub r0, r1, r2
	add r1, r3, #8
	add r0, r0, r0, lsl #1
	add r0, r1, r0
	bx lr
_020BC428:
	ldr r3, [r3, #4]
	cmp r3, #0
	bne _020BC400
_020BC434:
	add r0, ip, #4
	bx lr
	arm_func_end NNS_G2dFontGetCharWidthsFromIndex

	arm_func_start NNSi_G2dFontGetStringWidth
NNSi_G2dFontGetStringWidth: ; 0x020BC43C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r8, r0
	str r2, [sp]
	ldr r5, [r8, #4]
	add r0, sp, #0
	mov r7, r1
	mov r6, r3
	mov r4, #0
	blx r5
	movs r1, r0
	beq _020BC4B8
	ldr sb, _020BC4E4 ; =0x0000FFFF
	add sl, sp, #0
_020BC474:
	cmp r1, #0xa
	beq _020BC4B8
	mov r0, r8
	bl NNS_G2dFontFindGlyphIndex
	mov r1, r0
	cmp r1, sb
	ldreq r0, [r8]
	ldreqh r1, [r0, #2]
	mov r0, r8
	bl NNS_G2dFontGetCharWidthsFromIndex
	ldrsb r1, [r0, #2]
	mov r0, sl
	add r1, r7, r1
	add r4, r4, r1
	blx r5
	movs r1, r0
	bne _020BC474
_020BC4B8:
	cmp r6, #0
	beq _020BC4D0
	cmp r1, #0xa
	ldreq r0, [sp]
	movne r0, #0
	str r0, [r6]
_020BC4D0:
	cmp r4, #0
	subgt r4, r4, r7
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020BC4E4: .word 0x0000FFFF
	arm_func_end NNSi_G2dFontGetStringWidth

	arm_func_start NNSi_G2dFontGetTextHeight
NNSi_G2dFontGetTextHeight: ; 0x020BC4E8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	add r4, sp, #0
	mov r3, #0
	mov r8, r0
	str r2, [sp, #8]
	str r3, [r4]
	str r3, [r4, #4]
	ldr r7, [r8, #4]
	add r0, sp, #8
	mov r4, r1
	mov r6, #1
	blx r7
	cmp r0, #0
	beq _020BC540
	add r5, sp, #8
_020BC528:
	cmp r0, #0xa
	mov r0, r5
	addeq r6, r6, #1
	blx r7
	cmp r0, #0
	bne _020BC528
_020BC540:
	ldr r0, [r8]
	ldrsb r0, [r0, #1]
	add r0, r4, r0
	mul r0, r6, r0
	sub r0, r0, r4
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end NNSi_G2dFontGetTextHeight

	arm_func_start NNSi_G2dFontGetTextRect
NNSi_G2dFontGetTextRect: ; 0x020BC55C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #8
	mov r6, r2
	ldr r2, [sp, #0x28]
	add sb, sp, #0
	mov r4, #0
	mov r8, r0
	mov r7, r1
	mov r5, r3
	str r4, [sb]
	str r4, [sb, #4]
	cmp r2, #0
	mov r4, #1
	beq _020BC5C4
	add sb, sp, #0x28
_020BC598:
	mov r0, r7
	mov r1, r6
	mov r3, sb
	bl NNSi_G2dFontGetStringWidth
	ldr r1, [sp]
	ldr r2, [sp, #0x28]
	cmp r0, r1
	strgt r0, [sp]
	add r4, r4, #1
	cmp r2, #0
	bne _020BC598
_020BC5C4:
	ldr r0, [r7]
	sub r2, r4, #1
	ldrsb r1, [r0, #1]
	ldr r0, [sp]
	add r1, r5, r1
	mul r1, r2, r1
	sub r1, r1, r5
	str r1, [sp, #4]
	stmia r8, {r0, r1}
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end NNSi_G2dFontGetTextRect

	arm_func_start GetCharIndex1D
GetCharIndex1D: ; 0x020BC5F0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, #3
	ldr r7, [sp, #0x20]
	ldr r6, [sp, #0x24]
	ldr r8, _020BC6E4 ; =_02109414
	mov r5, #0
	mov sb, sl
	mvn r4, #0
_020BC610:
	and ip, r3, r4, lsl r6
	cmp ip, r1
	and lr, r2, r4, lsl r7
	bhi _020BC654
	mla r5, r2, ip, r5
	cmp lr, r0
	bhi _020BC644
	sub r3, r3, ip
	mla r5, lr, r3, r5
	sub r0, r0, lr
	sub r1, r1, ip
	sub r2, r2, lr
	b _020BC69C
_020BC644:
	mov r2, lr
	sub r1, r1, ip
	sub r3, r3, ip
	b _020BC69C
_020BC654:
	cmp lr, r0
	mvn r3, r4, lsl r6
	bhi _020BC674
	mla r5, lr, ip, r5
	mov r3, ip
	sub r0, r0, lr
	sub r2, r2, lr
	b _020BC69C
_020BC674:
	and r2, r1, r4, lsl r6
	mla r5, lr, r2, r5
	and r2, r0, r4, lsl r7
	mvn r4, r4, lsl r7
	add r2, r5, r2, lsl r6
	and r1, r1, r3
	add r1, r2, r1, lsl r7
	and r0, r0, r4
	add r0, r1, r0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020BC69C:
	cmp r2, #8
	movge r6, sl
	movlt r6, r2
	clzlt r6, r6
	rsblt r6, r6, #0x1f
	cmp r3, #8
	movge r7, sb
	movlt r7, r3
	clzlt r7, r7
	rsblt r7, r7, #0x1f
	add r7, r8, r7, lsl #3
	add ip, r7, r6, lsl #1
	ldrb r7, [r7, r6, lsl #1]
	ldrb r6, [ip, #1]
	str r7, [sp, #0x20]
	str r6, [sp, #0x24]
	b _020BC610
_020BC6E0: ; 0x020BC6E0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020BC6E4: .word _02109414
	arm_func_end GetCharIndex1D

	arm_func_start OBJSizeToShape
OBJSizeToShape: ; 0x020BC6E8
	ldrb r3, [r0, #1]
	ldr r2, _020BC700 ; =_02109434
	ldrb r1, [r0]
	add r0, r2, r3, lsl #4
	ldr r0, [r0, r1, lsl #2]
	bx lr
	.align 2, 0
_020BC700: .word _02109434
	arm_func_end OBJSizeToShape

	arm_func_start ClearChar
ClearChar: ; 0x020BC704
	stmdb sp!, {r3, r4, r5, lr}
	cmp r3, #8
	ldreq r4, [sp, #0x10]
	mov ip, r0
	ldr r0, [sp, #0x14]
	cmpeq r4, #8
	bne _020BC734
	ldr r2, [sp, #0x18]
	mov r1, ip
	mov r2, r2, lsl #3
	bl MIi_CpuClearFast
	ldmia sp!, {r3, r4, r5, pc}
_020BC734:
	ldr r4, [sp, #0x18]
	cmp r4, #4
	bne _020BC794
	mov r5, r1, lsl #2
	add r4, r5, r3, lsl #2
	mvn r3, #0
	rsb r4, r4, #0x20
	mov r3, r3, lsr r5
	add r1, r4, r1, lsl #2
	mov r3, r3, lsl r1
	ldr r1, [sp, #0x10]
	add r2, ip, r2, lsl #2
	add r5, r2, r1, lsl #2
	and r1, r0, r3, lsr r4
	mvn r3, r3, lsr r4
	cmp r2, r5
	ldmhsia sp!, {r3, r4, r5, pc}
_020BC778:
	ldr r0, [r2]
	and r0, r0, r3
	orr r0, r1, r0
	str r0, [r2], #4
	cmp r2, r5
	blo _020BC778
	ldmia sp!, {r3, r4, r5, pc}
_020BC794:
	mov r1, r1, lsl #3
	mvn r4, #0
	add r3, r1, r3, lsl #3
	rsb r3, r3, #0x40
	mov r5, r4, lsr r1
	cmp r3, #0x20
	movlo r5, r5, lsl r1
	blo _020BC7C4
	sub lr, r3, #0x20
	add r4, r1, lr
	mov r4, r5, lsl r4
	mov r5, r4, lsr lr
_020BC7C4:
	mvn lr, #0
	mov r4, lr, lsl r3
	cmp r1, #0x20
	movlo r3, r4, lsr r3
	blo _020BC7E8
	sub lr, r1, #0x20
	add r1, lr, r3
	mov r1, r4, lsr r1
	mov r3, r1, lsl lr
_020BC7E8:
	ldr r1, [sp, #0x10]
	add r4, ip, r2, lsl #3
	add ip, r4, r1, lsl #3
	and r1, r0, r5
	and r2, r0, r3
	mvn r5, r5
	mvn r3, r3
	cmp r4, ip
	ldmhsia sp!, {r3, r4, r5, pc}
_020BC80C:
	ldr r0, [r4]
	and r0, r0, r5
	orr r0, r1, r0
	str r0, [r4]
	ldr r0, [r4, #4]
	and r0, r0, r3
	orr r0, r2, r0
	str r0, [r4, #4]
	add r4, r4, #8
	cmp r4, ip
	blo _020BC80C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ClearChar

	arm_func_start LetterChar
LetterChar: ; 0x020BC83C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	ldr r5, [r0, #8]
	ldr r4, [r0, #0xc]
	cmp r5, #0
	strge r5, [sp]
	movlt r1, #0
	strlt r1, [sp]
	ldr r1, [r0, #0x10]
	cmp r4, #0
	add sl, r5, r1
	ldr r1, [r0, #0x14]
	movge r2, r4
	movlt r2, #0
	cmp sl, #8
	add r3, r4, r1
	movge sl, #8
	cmp r3, #8
	movge r3, #8
	cmp r4, #0
	movgt r4, #0
	cmp r5, #0
	ldr r7, [r0, #0x20]
	movgt r5, #0
	rsb r1, r4, #0
	mul r6, sl, r7
	ldr r8, [r0, #0x1c]
	rsb r4, r5, #0
	mul sb, r8, r4
	ldr r4, [r0, #0x18]
	mov sl, r6
	str r4, [sp, #0x10]
	ldr r4, [sp]
	cmp r7, #4
	mul r5, r4, r7
	ldr r4, [sp, #0x10]
	str r5, [sp]
	mla r4, r1, r4, sb
	ldr r1, [r0, #4]
	str r1, [sp, #0x14]
	ldr r1, [r0]
	bne _020BC9AC
	ldr r7, [r0, #0x24]
	add r0, r1, r2, lsl #2
	str r0, [sp, #0xc]
	add r0, r1, r3, lsl #2
	ldr r1, [sp, #0xc]
	str r0, [sp, #8]
	cmp r1, r0
	addhs sp, sp, #0x28
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov fp, #0xf
	add r5, sp, #0x20
_020BC910:
	ldr r0, [sp, #0xc]
	mov r1, r4, lsr #0x1f
	ldr sb, [r0]
	ldr r0, [sp, #0x14]
	rsb r2, r1, r4, lsl #29
	add r0, r0, r4, lsr #3
	str r0, [sp, #0x20]
	mov r0, #0
	strb r0, [sp, #0x24]
	strb r0, [sp, #0x25]
	mov r0, r5
	add r1, r1, r2, ror #29
	bl NNSi_G2dBitReaderRead
	ldr r6, [sp]
	mov r0, r6
	cmp r0, sl
	bhs _020BC984
_020BC954:
	mov r0, r5
	mov r1, r8
	bl NNSi_G2dBitReaderRead
	cmp r0, #0
	beq _020BC978
	add r0, r7, r0
	mvn r1, fp, lsl r6
	and r1, sb, r1
	orr sb, r1, r0, lsl r6
_020BC978:
	add r6, r6, #4
	cmp r6, sl
	blo _020BC954
_020BC984:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	str sb, [r1], #4
	cmp r1, r0
	ldr r0, [sp, #0x10]
	str r1, [sp, #0xc]
	add r4, r4, r0
	blo _020BC910
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BC9AC:
	ldr r5, [r0, #0x24]
	add r0, r1, r3, lsl #3
	add fp, r1, r2, lsl #3
	str r0, [sp, #4]
	cmp fp, r0
	addhs sp, sp, #0x28
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BC9C8:
	mov r1, r4, lsr #0x1f
	rsb r0, r1, r4, lsl #29
	add r1, r1, r0, ror #29
	ldr r0, [sp, #0x14]
	ldmia fp, {r6, r7}
	mov r2, #0
	add r0, r0, r4, lsr #3
	str r0, [sp, #0x18]
	add r0, sp, #0x18
	strb r2, [sp, #0x1c]
	strb r2, [sp, #0x1d]
	bl NNSi_G2dBitReaderRead
	ldr sb, [sp]
	mov r0, sb
	cmp r0, sl
	bhs _020BCA58
_020BCA08:
	add r0, sp, #0x18
	mov r1, r8
	bl NNSi_G2dBitReaderRead
	cmp r0, #0
	beq _020BCA4C
	add r1, r5, r0
	cmp sb, #0x20
	mov r0, #0xff
	bhs _020BCA3C
	mvn r0, r0, lsl sb
	and r0, r6, r0
	orr r6, r0, r1, lsl sb
	b _020BCA4C
_020BCA3C:
	sub r2, sb, #0x20
	mvn r0, r0, lsl r2
	and r0, r7, r0
	orr r7, r0, r1, lsl r2
_020BCA4C:
	add sb, sb, #8
	cmp sb, sl
	blo _020BCA08
_020BCA58:
	ldr r0, [sp, #4]
	stmia fp, {r6, r7}
	add fp, fp, #8
	cmp fp, r0
	ldr r0, [sp, #0x10]
	add r4, r4, r0
	blo _020BC9C8
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end LetterChar

	arm_func_start DrawGlyphLine
DrawGlyphLine: ; 0x020BCA7C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	ldr r4, [sp, #0x54]
	ldrb r6, [r0, #0xc]
	str r4, [sp, #0x54]
	ldr r4, [r4]
	ldr r5, [r1]
	mov r7, r6, lsl #6
	ldrb r4, [r4, #1]
	mov r6, r7, asr #2
	add r6, r7, r6, lsr #29
	cmp r4, #0
	ldr r5, [r5, #8]
	mov sl, r2
	mov sb, r3
	mov r8, r6, asr #3
	addeq sp, sp, #0x2c
	ldmib r0, {fp, ip}
	ldr lr, [r0]
	ldrb r2, [r5, #1]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	adds r7, sl, r4
	addmi sp, sp, #0x2c
	ldmmiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	adds r3, sb, r2
	addmi sp, sp, #0x2c
	ldmmiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	movle r5, #0
	movgt r5, sl, lsr #3
	cmp sb, #0
	movle r6, #0
	add r7, r7, #7
	movgt r6, sb, lsr #3
	cmp fp, r7, lsr #3
	mov r7, r7, lsr #3
	add r3, r3, #7
	movls r7, fp
	mov fp, r3, lsr #3
	cmp ip, r3, lsr #3
	movls fp, ip
	subs r3, r7, r5
	sub fp, fp, r6
	addmi sp, sp, #0x2c
	ldmmiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp fp, #0
	addlt sp, sp, #0x2c
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, [r0, #0x10]
	cmp sl, #0
	mla r6, r7, r6, r5
	sub r5, r7, r3
	mul r5, r8, r5
	str r5, [sp]
	ldr r5, [sp, #0x54]
	mla r7, r8, r6, lr
	ldr ip, [r5, #4]
	ldr r6, [sp, #0x50]
	str ip, [sp, #8]
	sub r5, r6, #1
	str r4, [sp, #0x14]
	str r5, [sp, #0x28]
	str r2, [sp, #0x18]
	ldr r2, [r1]
	andge sl, sl, #7
	ldr r2, [r2, #8]
	cmp sb, #0
	ldrb r2, [r2, #6]
	andge sb, sb, #7
	sub fp, sb, fp, lsl #3
	str r2, [sp, #0x20]
	ldrb r0, [r0, #0xc]
	cmp sb, fp
	sub r6, sl, r3, lsl #3
	str r0, [sp, #0x24]
	ldr r0, [r1]
	ldr r0, [r0, #8]
	ldrb r0, [r0]
	smulbb r0, r2, r0
	str r0, [sp, #0x1c]
	addle sp, sp, #0x2c
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r4, sp, #4
_020BCBC8:
	mov r5, sl
	str sb, [sp, #0x10]
	cmp sl, r6
	ble _020BCBF8
_020BCBD8:
	mov r0, r4
	str r7, [sp, #4]
	str r5, [sp, #0xc]
	bl LetterChar
	sub r5, r5, #8
	cmp r5, r6
	add r7, r7, r8
	bgt _020BCBD8
_020BCBF8:
	ldr r0, [sp]
	sub sb, sb, #8
	cmp sb, fp
	add r7, r7, r0
	bgt _020BCBC8
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DrawGlyphLine

	arm_func_start DrawGlyph1D
DrawGlyph1D: ; 0x020BCC14
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x4c
	ldr r6, [sp, #0x74]
	ldrb r5, [r0, #0xc]
	ldr r4, [r6]
	ldr r7, [r1]
	mov r8, r5, lsl #6
	ldrb r4, [r4, #1]
	mov r5, r8, asr #2
	add r5, r8, r5, lsr #29
	ldr r7, [r7, #8]
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r4, #0
	mov sb, r5, asr #3
	addeq sp, sp, #0x4c
	ldmib r0, {r3, r5}
	ldrb r2, [r7, #1]
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r7, [sp, #8]
	adds r7, r7, r4
	addmi sp, sp, #0x4c
	ldmmiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r8, [sp, #0xc]
	adds r8, r8, r2
	addmi sp, sp, #0x4c
	ldmmiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr sl, [sp, #8]
	add r7, r7, #7
	cmp sl, #0
	movle sl, #0
	strle sl, [sp, #0x10]
	movgt sl, sl, lsr #3
	strgt sl, [sp, #0x10]
	ldr sl, [sp, #0xc]
	cmp sl, #0
	movle sl, #0
	movgt sl, sl, lsr #3
	cmp r3, r7, lsr #3
	mov r7, r7, lsr #3
	movls r7, r3
	add r3, r8, #7
	cmp r5, r3, lsr #3
	mov r8, r3, lsr #3
	ldr r3, [sp, #0x10]
	movls r8, r5
	subs r5, r7, r3
	sub r7, r8, sl
	addmi sp, sp, #0x4c
	ldmmiia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r7, #0
	addlt sp, sp, #0x4c
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r3, [sp, #8]
	ldr fp, [r0]
	cmp r3, #0
	andge r3, r3, #7
	strge r3, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r8, [sp, #8]
	ldr r6, [r6, #4]
	cmp r3, #0
	andge r3, r3, #7
	strge r3, [sp, #0xc]
	ldr r3, [sp, #0x70]
	sub r5, r8, r5, lsl #3
	ldr r8, [sp, #0xc]
	sub r3, r3, #1
	str r3, [sp, #0x48]
	sub r7, r8, r7, lsl #3
	str r2, [sp, #0x38]
	str r6, [sp, #0x28]
	str r4, [sp, #0x34]
	ldr r4, [r1]
	mov r3, r8
	mov r2, r7
	cmp r3, r2
	ldr r2, [r4, #8]
	str r7, [sp, #0x1c]
	ldrb r3, [r2, #6]
	str r3, [sp, #0x40]
	ldrb r2, [r0, #0xc]
	str r2, [sp, #0x44]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	ldrb r1, [r1]
	smulbb r1, r3, r1
	str r1, [sp, #0x3c]
	ldr r3, [r0, #0x10]
	ldr r1, [r0, #4]
	ldr r0, [r0, #8]
	str r1, [sp, #0x14]
	mov r2, r3, lsl #0x18
	mov r1, r3, lsl #0x10
	str r3, [sp, #0x20]
	str r0, [sp, #0x18]
	mov r8, r2, lsr #0x18
	mov r7, r1, lsr #0x18
	addle sp, sp, #0x4c
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BCDA4:
	ldr r0, [sp, #0xc]
	ldr r6, [sp, #0x10]
	str r0, [sp, #0x30]
	ldr r0, [sp, #8]
	cmp r0, r5
	mov r4, r0
	ble _020BCE00
_020BCDC0:
	ldr r2, [sp, #0x14]
	str r8, [sp]
	ldr r3, [sp, #0x18]
	mov r0, r6
	mov r1, sl
	str r7, [sp, #4]
	bl GetCharIndex1D
	mla r1, r0, sb, fp
	add r0, sp, #0x24
	str r4, [sp, #0x2c]
	str r1, [sp, #0x24]
	bl LetterChar
	sub r4, r4, #8
	add r6, r6, #1
	cmp r4, r5
	bgt _020BCDC0
_020BCE00:
	ldr r0, [sp, #0xc]
	add sl, sl, #1
	sub r1, r0, #8
	ldr r0, [sp, #0x1c]
	str r1, [sp, #0xc]
	cmp r1, r0
	bgt _020BCDA4
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end DrawGlyph1D

	arm_func_start ClearContinuous
ClearContinuous: ; 0x020BCE24
	stmdb sp!, {r3, lr}
	mov r3, r0
	ldrb r2, [r3, #0xc]
	ldr ip, [r3, #4]
	cmp r2, #4
	orreq r0, r1, r1, lsl #4
	orreq r0, r0, r0, lsl #8
	orrne r0, r1, r1, lsl #8
	orr r1, r0, r0, lsl #16
	ldr r0, [r3, #8]
	mov r2, r2, lsl #6
	mul lr, ip, r0
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	mov r2, r0, asr #3
	mov r0, r1
	mul r2, lr, r2
	ldr r1, [r3]
	bl MIi_CpuClearFast
	ldmia sp!, {r3, pc}
	arm_func_end ClearContinuous

	arm_func_start ClearLine
ClearLine: ; 0x020BCE74
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	ldrb r2, [r7, #0xc]
	mov r6, r1
	ldr sb, [r7]
	cmp r2, #4
	orreq r0, r6, r6, lsl #4
	orreq r0, r0, r0, lsl #8
	orrne r0, r6, r6, lsl #8
	mov r1, r2, lsl #6
	orr r6, r0, r0, lsl #16
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r3, r0, asr #3
	ldr r2, [r7, #0x10]
	ldr r1, [r7, #4]
	ldr r0, [r7, #8]
	mul r5, r3, r2
	mul r4, r3, r1
	mov r8, #0
	cmp r0, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_020BCECC:
	mov r0, r6
	mov r1, sb
	mov r2, r4
	bl MIi_CpuClearFast
	ldr r0, [r7, #8]
	add r8, r8, #1
	cmp r8, r0
	add sb, sb, r5
	blt _020BCECC
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ClearLine

	arm_func_start ClearAreaLine
ClearAreaLine: ; 0x020BCEF4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	ldr r4, [sp, #0x58]
	mov sb, r2
	ldrb fp, [r0, #0xc]
	mov sl, r1
	add r1, sb, r4
	str r1, [sp, #0x28]
	ldr r2, [sp, #0x5c]
	mov r1, r3
	add r1, r1, r2
	cmp fp, #4
	str r1, [sp, #0x24]
	orreq r1, sl, sl, lsl #4
	orreq r1, r1, r1, lsl #8
	orrne r1, sl, sl, lsl #8
	str r3, [sp, #0xc]
	orr sl, r1, r1, lsl #16
	ldr r1, [sp, #0xc]
	mov r6, fp, lsl #6
	bic r1, r1, #7
	mov r4, r6, asr #2
	mov r2, r1, asr #2
	str r1, [sp, #0x2c]
	add r1, r1, r2, lsr #29
	ldr r2, [r0, #0x10]
	mov r3, r1, asr #3
	mul r1, r3, r2
	bic r3, sb, #7
	mov r5, r3, asr #2
	add r4, r6, r4, lsr #29
	str r3, [sp, #0x18]
	add r5, r3, r5, lsr #29
	mov r3, r4, asr #3
	str r3, [sp, #0x14]
	add r4, r1, r5, asr #3
	ldr r3, [sp, #0x24]
	ldr r5, [r0]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x28]
	mla r4, r1, r4, r5
	add r3, r3, #7
	bic r1, r3, #7
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x14]
	add r0, r0, #7
	mul r1, r2, r1
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x2c]
	ldr r1, [sp, #0x20]
	str r4, [sp, #0x1c]
	cmp r2, r1
	bic r6, r0, #7
	addge sp, sp, #0x30
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BCFD0:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	movge r8, #0
	bge _020BCFF0
	mov r1, r0
	ldr r0, [sp, #0x2c]
	sub r8, r1, r0
_020BCFF0:
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x2c]
	ldr r7, [sp, #0x1c]
	sub r0, r1, r0
	cmp r0, #8
	movgt r0, #8
	sub r5, r0, r8
	ldr r0, [sp, #0x18]
	cmp r0, r6
	mov r4, r0
	bge _020BD060
_020BD01C:
	ldr r0, [sp, #0x28]
	cmp r4, sb
	sublt r1, sb, r4
	sub r0, r0, r4
	movge r1, #0
	cmp r0, #8
	movgt r0, #8
	sub r3, r0, r1
	mov r0, r7
	mov r2, r8
	stmia sp, {r5, sl, fp}
	bl ClearChar
	ldr r0, [sp, #0x14]
	add r4, r4, #8
	add r7, r7, r0
	cmp r4, r6
	blt _020BD01C
_020BD060:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	add r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x2c]
	add r1, r0, #8
	ldr r0, [sp, #0x20]
	str r1, [sp, #0x2c]
	cmp r1, r0
	blt _020BCFD0
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ClearAreaLine

	arm_func_start ClearArea1D
ClearArea1D: ; 0x020BD090
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x48
	ldrb r4, [r0, #0xc]
	mov sl, r2
	mov fp, r1
	str r4, [sp, #0x10]
	ldr r1, [sp, #0x10]
	ldr r4, [sp, #0x70]
	cmp r1, #4
	add r1, sl, r4
	str r1, [sp, #0x3c]
	ldr r2, [sp, #0x74]
	mov r1, r3
	add r1, r1, r2
	bic r2, sl, #7
	str r1, [sp, #0x38]
	str r3, [sp, #0xc]
	str r2, [sp, #0x28]
	ldr r2, [sp, #0xc]
	orreq r1, fp, fp, lsl #4
	bic r2, r2, #7
	str r2, [sp, #0x40]
	ldr r2, [sp, #0x10]
	orreq r1, r1, r1, lsl #8
	mov r5, r2, lsl #6
	ldr r2, [sp, #0x38]
	mov r3, r5, asr #2
	add r6, r2, #7
	ldr r2, [sp, #0x28]
	add r3, r5, r3, lsr #29
	mov r4, r2, asr #2
	ldr r2, [sp, #0x40]
	orrne r1, fp, fp, lsl #8
	mov r5, r2, asr #2
	bic r2, r6, #7
	str r2, [sp, #0x34]
	mov r2, r3, asr #3
	str r2, [sp, #0x14]
	ldr r2, [sp, #0x28]
	orr fp, r1, r1, lsl #16
	add r2, r2, r4, lsr #29
	mov r2, r2, asr #3
	str r2, [sp, #0x2c]
	ldr r2, [sp, #0x40]
	ldr r1, [r0, #0x10]
	add r2, r2, r5, lsr #29
	mov r8, r2, asr #3
	ldr r3, [sp, #0x40]
	ldr r2, [sp, #0x34]
	str r1, [sp, #0x44]
	cmp r3, r2
	ldr r2, [sp, #0x3c]
	add r2, r2, #7
	bic r7, r2, #7
	ldr r2, [r0, #4]
	str r2, [sp, #0x18]
	ldr r2, [r0, #8]
	ldr r0, [r0]
	str r2, [sp, #0x1c]
	str r0, [sp, #0x30]
	mov r0, r1, lsl #0x18
	mov r0, r0, lsr #0x18
	str r0, [sp, #0x20]
	mov r0, r1, lsl #0x10
	mov r0, r0, lsr #0x18
	str r0, [sp, #0x24]
	addge sp, sp, #0x48
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BD1A0:
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0xc]
	cmp r1, r0
	movge sb, #0
	bge _020BD1C0
	mov r1, r0
	ldr r0, [sp, #0x40]
	sub sb, r1, r0
_020BD1C0:
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x40]
	ldr r6, [sp, #0x2c]
	sub r0, r1, r0
	cmp r0, #8
	movgt r0, #8
	sub r5, r0, sb
	ldr r0, [sp, #0x28]
	cmp r0, r7
	mov r4, r0
	bge _020BD260
_020BD1EC:
	ldr r0, [sp, #0x20]
	ldr r2, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r3, [sp, #0x1c]
	str r0, [sp, #4]
	mov r0, r6
	mov r1, r8
	bl GetCharIndex1D
	ldr r2, [sp, #0x3c]
	cmp r4, sl
	sublt r1, sl, r4
	sub r2, r2, r4
	movge r1, #0
	cmp r2, #8
	movgt r2, #8
	stmia sp, {r5, fp}
	sub r3, r2, r1
	ldr r2, [sp, #0x10]
	ldr ip, [sp, #0x14]
	str r2, [sp, #8]
	ldr r2, [sp, #0x30]
	mla r0, ip, r0, r2
	mov r2, sb
	bl ClearChar
	add r4, r4, #8
	add r6, r6, #1
	cmp r4, r7
	blt _020BD1EC
_020BD260:
	ldr r0, [sp, #0x40]
	add r8, r8, #1
	add r1, r0, #8
	ldr r0, [sp, #0x34]
	str r1, [sp, #0x40]
	cmp r1, r0
	blt _020BD1A0
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ClearArea1D

	arm_func_start InitCharCanvas
InitCharCanvas: ; 0x020BD284
	str r2, [r0, #4]
	ldr r2, [sp]
	str r3, [r0, #8]
	strb r2, [r0, #0xc]
	ldr r2, [sp, #4]
	str r1, [r0]
	ldr r1, [sp, #8]
	str r2, [r0, #0x14]
	str r1, [r0, #0x10]
	bx lr
	arm_func_end InitCharCanvas

	arm_func_start NNS_G2dCharCanvasDrawChar
NNS_G2dCharCanvasDrawChar: ; 0x020BD2AC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	mov r7, r1
	ldrh r1, [sp, #0x2c]
	mov r8, r0
	mov r0, r7
	mov r6, r2
	mov r5, r3
	bl NNS_G2dFontFindGlyphIndex
	ldr r1, _020BD3CC ; =0x0000FFFF
	mov r4, r0
	cmp r4, r1
	ldreq r0, [r7]
	ldreqh r4, [r0, #2]
	mov r0, r7
	mov r1, r4
	bl NNS_G2dFontGetCharWidthsFromIndex
	str r0, [sp, #8]
	ldr r1, [r7]
	ldr r2, [r1, #8]
	ldrh r1, [r2, #2]
	add r2, r2, #8
	mla r1, r4, r1, r2
	str r1, [sp, #0xc]
	ldr r1, [r7]
	ldr r3, [r1, #8]
	ldrb r1, [r3, #7]
	cmp r1, #7
	addls pc, pc, r1, lsl #2
	b _020BD390
_020BD324: ; jump table
	b _020BD344 ; case 0
	b _020BD350 ; case 1
	b _020BD350 ; case 2
	b _020BD364 ; case 3
	b _020BD364 ; case 4
	b _020BD380 ; case 5
	b _020BD380 ; case 6
	b _020BD344 ; case 7
_020BD344:
	ldrsb r0, [r0]
	add r6, r6, r0
	b _020BD390
_020BD350:
	ldrb r1, [r3]
	ldrsb r0, [r0]
	sub r6, r6, r1
	add r5, r5, r0
	b _020BD390
_020BD364:
	ldrsb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r0, [r3, #1]
	add r1, r2, r1
	sub r6, r6, r1
	sub r5, r5, r0
	b _020BD390
_020BD380:
	ldrsb r1, [r0]
	ldrb r0, [r3, #1]
	add r0, r1, r0
	sub r5, r5, r0
_020BD390:
	ldr r1, [sp, #0x28]
	add r0, sp, #8
	str r1, [sp]
	str r0, [sp, #4]
	ldr r1, [r8, #0x14]
	mov r0, r8
	ldr r4, [r1]
	mov r1, r7
	mov r2, r6
	mov r3, r5
	blx r4
	ldr r0, [sp, #8]
	ldrsb r0, [r0, #2]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020BD3CC: .word 0x0000FFFF
	arm_func_end NNS_G2dCharCanvasDrawChar

	arm_func_start NNS_G2dCharCanvasInitForBG
NNS_G2dCharCanvasInitForBG: ; 0x020BD3D0
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr lr, [sp, #0x10]
	ldr ip, _020BD3F8 ; =_021093FC
	str lr, [sp]
	str ip, [sp, #4]
	str r2, [sp, #8]
	bl InitCharCanvas
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_020BD3F8: .word _021093FC
	arm_func_end NNS_G2dCharCanvasInitForBG

	arm_func_start NNS_G2dCharCanvasInitForOBJ1D
NNS_G2dCharCanvasInitForOBJ1D: ; 0x020BD3FC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x10
	cmp r2, #8
	movlt r4, r2
	movge ip, #3
	clzlt r4, r4
	rsblt ip, r4, #0x1f
	cmp r3, #8
	movlt r4, r3
	movge r5, #3
	clzlt r4, r4
	rsblt r5, r4, #0x1f
	ldr r4, _020BD47C ; =_02109414
	ldr lr, [sp, #0xc]
	add r5, r4, r5, lsl #3
	add r4, r5, ip, lsl #1
	ldrb ip, [r5, ip, lsl #1]
	bic r5, lr, #0xff
	ldrb r4, [r4, #1]
	ldr lr, [sp, #0x20]
	orr r5, r5, ip
	str lr, [sp]
	ldr ip, _020BD480 ; =_02109408
	bic lr, r5, #0xff00
	mov r4, r4, lsl #0x18
	orr r4, lr, r4, lsr #16
	str ip, [sp, #4]
	str r4, [sp, #0xc]
	str r4, [sp, #8]
	bl InitCharCanvas
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BD47C: .word _02109414
_020BD480: .word _02109408
	arm_func_end NNS_G2dCharCanvasInitForOBJ1D

	arm_func_start NNS_G2dMapScrToCharText
NNS_G2dMapScrToCharText: ; 0x020BD484
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	ldr r5, [sp, #0x24]
	ldr lr, [sp, #0x20]
	cmp r5, #0x20
	ldr ip, [sp, #0x28]
	bgt _020BD4C0
	mla r4, r5, lr, r3
	ldr lr, [sp, #0x2c]
	mov r3, r5
	add r0, r0, r4, lsl #1
	stmia sp, {ip, lr}
	bl NNS_G2dMapScrToChar256x16Pltt
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020BD4C0:
	add r6, lr, r2
	ldr r4, [sp, #0x2c]
	cmp lr, r6
	add r5, r3, r1
	addge sp, sp, #8
	mov r1, r4, lsl #0x1c
	ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
_020BD4DC:
	cmp lr, #0x20
	movlt r2, lr
	addge r2, lr, #0x20
	mov r7, r3
	cmp r3, r5
	add r8, r0, r2, lsl #6
	bge _020BD520
_020BD4F8:
	cmp r7, #0x20
	movlt r2, r7
	addge r2, r7, #0x3e0
	orr r4, ip, r1, lsr #16
	mov r2, r2, lsl #1
	add r7, r7, #1
	strh r4, [r8, r2]
	cmp r7, r5
	add ip, ip, #1
	blt _020BD4F8
_020BD520:
	add lr, lr, #1
	cmp lr, r6
	blt _020BD4DC
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end NNS_G2dMapScrToCharText

	arm_func_start NNS_G2dMapScrToChar256x16Pltt
NNS_G2dMapScrToChar256x16Pltt: ; 0x020BD534
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, [sp, #0x1c]
	ldr r8, [sp, #0x18]
	mov r6, #0
	cmp r2, #0
	mov ip, r4, lsl #0x1c
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
	mov r4, r6
_020BD554:
	mov r7, r0
	mov r5, r4
	cmp r1, #0
	ble _020BD57C
_020BD564:
	orr lr, r8, ip, lsr #16
	add r5, r5, #1
	cmp r5, r1
	add r8, r8, #1
	strh lr, [r7], #2
	blt _020BD564
_020BD57C:
	add r6, r6, #1
	cmp r6, r2
	add r0, r0, r3, lsl #1
	blt _020BD554
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end NNS_G2dMapScrToChar256x16Pltt

	arm_func_start NNSi_G2dCalcRequiredOBJ
NNSi_G2dCalcRequiredOBJ: ; 0x020BD590
	stmdb sp!, {r3, r4, r5, lr}
	mov r3, r0, lsr #3
	mov r5, r1, lsr #3
	mov r2, #0
	mla lr, r3, r5, r2
	and r4, r0, #2
	and r2, r0, #1
	add r2, r2, r4, lsr #1
	and r0, r0, #4
	mov ip, r2, lsl #1
	add ip, ip, r0, lsr #2
	mla ip, r5, ip, lr
	and r4, r1, #2
	and lr, r1, #1
	add r4, lr, r4, lsr #1
	and lr, r1, #4
	mov r1, r4, lsl #1
	add r1, r1, lr, lsr #2
	mla ip, r3, r1, ip
	add r1, r2, r0, lsr #2
	add r0, r4, lr, lsr #2
	mla r0, r1, r0, ip
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNSi_G2dCalcRequiredOBJ

	arm_func_start NNS_G2dArrangeOBJ1D
NNS_G2dArrangeOBJ1D: ; 0x020BD5EC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x38
	mov r7, r0
	mov r0, r1
	cmp r0, #8
	ldr r0, [sp, #0x60]
	str r1, [sp, #0x10]
	str r0, [sp, #0x60]
	str r2, [sp, #0x14]
	ldrlt r0, [sp, #0x10]
	str r3, [sp, #0x34]
	ldr r6, [sp, #0x64]
	ldr r5, [sp, #0x68]
	ldr r4, [sp, #0x6c]
	movge r2, #3
	clzlt r0, r0
	rsblt r2, r0, #0x1f
	ldr r0, [sp, #0x14]
	cmp r0, #8
	ldrlt r0, [sp, #0x14]
	movge r1, #3
	clzlt r0, r0
	rsblt r1, r0, #0x1f
	ldr r0, _020BD8D8 ; =_02109414
	mvn r3, #0
	add r1, r0, r1, lsl #3
	add r0, r1, r2, lsl #1
	ldrb fp, [r1, r2, lsl #1]
	ldrb r1, [r0, #1]
	ldr r2, [sp, #0x14]
	cmp r6, #0
	str r1, [sp, #0x30]
	ldr r1, [sp, #0x10]
	and r1, r1, r3, lsl fp
	str r1, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	and r1, r2, r3, lsl r1
	str r1, [sp, #0x28]
	moveq r1, #1
	streq r1, [sp, #0x18]
	movne r1, #2
	strne r1, [sp, #0x18]
	mov r1, #0
	str r1, [sp, #0x24]
	bl OBJSizeToShape
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0x14]
	mov sb, r1, asr fp
	ldr r1, [sp, #0x30]
	mov r1, r2, asr r1
	str r1, [sp, #0x20]
	ldr r1, [sp, #0x18]
	mov r2, r1, lsl fp
	ldr r1, [sp, #0x30]
	mov r8, r2, lsl r1
	mov r1, #0
	str r1, [sp, #0x1c]
	b _020BD76C
_020BD6D4:
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x30]
	mov sl, #0
	mov r2, r2, lsl r1
	ldr r1, [sp, #0x60]
	add r1, r1, r2, lsl #3
	mov r2, #0x400
	and r3, r1, #0xff
	rsb r2, r2, #0
	b _020BD758
_020BD6FC:
	mov ip, sl, lsl fp
	ldr r1, [sp, #0x34]
	add sl, sl, #1
	add r1, r1, ip, lsl #3
	mov lr, r1, lsl #0x17
	ldr ip, [r7]
	ldr r1, _020BD8DC ; =0xFE00FF00
	and r1, ip, r1
	orr r1, r1, r3
	orr ip, r1, lr, lsr #7
	ldr r1, _020BD8E0 ; =0x3FFF3FFF
	and r1, ip, r1
	orr r1, r1, r0
	str r1, [r7]
	ldrh r1, [r7, #4]
	and r1, r1, r2
	orr r1, r1, r5
	strh r1, [r7, #4]
	ldr r1, [r7]
	add r5, r5, r8, asr r4
	bic r1, r1, #0x2000
	orr r1, r1, r6, lsl #13
	str r1, [r7], #8
_020BD758:
	cmp sl, sb
	blt _020BD6FC
	ldr r1, [sp, #0x1c]
	add r1, r1, #1
	str r1, [sp, #0x1c]
_020BD76C:
	ldr r2, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	cmp r2, r1
	blt _020BD6D4
	ldr r0, [sp, #0x24]
	mla r0, sb, r1, r0
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	bhs _020BD7F4
	ldr r0, [sp, #0x60]
	ldr r1, [sp, #0x10]
	stmia sp, {r0, r6}
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x2c]
	sub r8, r1, r0
	ldr r1, [sp, #0x34]
	str r5, [sp, #8]
	add r3, r1, r2, lsl #3
	ldr r2, [sp, #0x28]
	mov r0, r7
	mov r1, r8
	str r4, [sp, #0xc]
	bl NNS_G2dArrangeOBJ1D
	ldr r1, [sp, #0x18]
	add r7, r7, r0, lsl #3
	mul r2, r1, r8
	ldr r1, [sp, #0x28]
	mul r2, r1, r2
	ldr r1, [sp, #0x24]
	add r5, r5, r2, lsr r4
	add r0, r1, r0
	str r0, [sp, #0x24]
_020BD7F4:
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	bhs _020BD860
	ldr r1, [sp, #0x60]
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x34]
	add r0, r1, r0, lsl #3
	stmia sp, {r0, r6}
	str r5, [sp, #8]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x28]
	str r4, [sp, #0xc]
	sub r8, r1, r0
	ldr r1, [sp, #0x2c]
	mov r0, r7
	mov r2, r8
	bl NNS_G2dArrangeOBJ1D
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x2c]
	add r7, r7, r0, lsl #3
	mul r1, r2, r1
	mul r1, r8, r1
	add r5, r5, r1, lsr r4
	ldr r1, [sp, #0x24]
	add r0, r1, r0
	str r0, [sp, #0x24]
_020BD860:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	ldrlo r1, [sp, #0x28]
	ldrlo r0, [sp, #0x14]
	cmplo r1, r0
	bhs _020BD8CC
	ldr r1, [sp, #0x60]
	ldr r0, [sp, #0x28]
	ldr r2, [sp, #0x10]
	add r0, r1, r0, lsl #3
	stmia sp, {r0, r6}
	str r5, [sp, #8]
	ldr r1, [sp, #0x2c]
	ldr r3, [sp, #0x14]
	sub r1, r2, r1
	ldr r2, [sp, #0x28]
	ldr r5, [sp, #0x2c]
	sub r2, r3, r2
	ldr r3, [sp, #0x34]
	mov r0, r7
	add r3, r3, r5, lsl #3
	str r4, [sp, #0xc]
	bl NNS_G2dArrangeOBJ1D
	ldr r1, [sp, #0x24]
	add r0, r1, r0
	str r0, [sp, #0x24]
_020BD8CC:
	ldr r0, [sp, #0x24]
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020BD8D8: .word _02109414
_020BD8DC: .word 0xFE00FF00
_020BD8E0: .word 0x3FFF3FFF
	arm_func_end NNS_G2dArrangeOBJ1D

	arm_func_start NNSi_G2dTextCanvasDrawString
NNSi_G2dTextCanvasDrawString: ; 0x020BD8E4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov fp, r0
	ldr r4, [fp, #8]
	ldr r5, [fp, #4]
	ldr r6, [sp, #0x38]
	add r0, sp, #0xc
	str r6, [sp, #0xc]
	ldr r6, [r5, #4]
	mov sl, r1
	mov sb, r2
	str r3, [sp, #8]
	ldrsb r8, [sp, #0x41]
	blx r6
	cmp r0, #0
	beq _020BD96C
	ldrsb r7, [sp, #0x40]
_020BD928:
	cmp r0, #0xa
	beq _020BD96C
	ldr r1, [sp, #8]
	mov r2, sl
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, [fp]
	mov r1, r5
	mov r3, sb
	bl NNS_G2dCharCanvasDrawChar
	add r0, r4, r0
	mla sl, r0, r7, sl
	mla sb, r0, r8, sb
	add r0, sp, #0xc
	blx r6
	cmp r0, #0
	bne _020BD928
_020BD96C:
	ldr r1, [sp, #0x3c]
	cmp r1, #0
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r0, #0xa
	ldreq r1, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	movne r1, #0
	str r1, [r0]
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end NNSi_G2dTextCanvasDrawString

	arm_func_start NNSi_G2dTextCanvasDrawTextAlign
NNSi_G2dTextCanvasDrawTextAlign: ; 0x020BD998
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	mov sl, r0
	ldr r0, [sl, #4]
	ldr r4, [sp, #0x60]
	ldr r0, [r0]
	ldrsb r8, [sp, #0x65]
	ldrsb r0, [r0, #1]
	ldr r5, [sl, #0xc]
	ldrsb sb, [sp, #0x64]
	add r5, r5, r0
	rsb r0, r8, #0
	mul r0, r5, r0
	str r0, [sp, #0x20]
	mul r0, r5, sb
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x58]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	mov fp, r3
	str r4, [sp, #0x30]
	cmp r4, #0
	str r0, [sp, #0x58]
	addeq sp, sp, #0x34
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [sp, #0x5c]
	mov r6, #0
	and r0, r2, #0x800
	add r1, fp, #1
	str r0, [sp, #0x18]
	add r0, r1, r1, lsr #31
	str r0, [sp, #0x2c]
	and r0, r2, #0x400
	str r0, [sp, #0x14]
	ldrb r0, [sp, #0x64]
	mov r7, r6
	str r0, [sp, #0x24]
	ldrb r0, [sp, #0x65]
	str r0, [sp, #0x28]
_020BDA34:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldr r0, [sp, #0xc]
	add r4, r0, r6
	ldr r0, [sp, #0x10]
	add r5, r0, r7
	beq _020BDA70
	ldr r2, [sp, #0x30]
	mov r3, #0
	ldmib sl, {r0, r1}
	bl NNSi_G2dFontGetStringWidth
	sub r0, fp, r0
	mla r4, r0, sb, r4
	mla r5, r0, r8, r5
	b _020BDAA8
_020BDA70:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _020BDAA8
	ldr r2, [sp, #0x30]
	mov r3, #0
	ldmib sl, {r0, r1}
	bl NNSi_G2dFontGetStringWidth
	add r0, r0, #1
	add r0, r0, r0, lsr #31
	mov r1, r0, asr #1
	ldr r0, [sp, #0x2c]
	rsb r0, r1, r0, asr #1
	mla r4, r0, sb, r4
	mla r5, r0, r8, r5
_020BDAA8:
	ldr r3, [sp, #0x30]
	mov r1, r4
	str r3, [sp]
	add r3, sp, #0x30
	str r3, [sp, #4]
	ldr r3, [sp, #0x24]
	mov r2, r5
	strb r3, [sp, #8]
	ldr r3, [sp, #0x28]
	mov r0, sl
	strb r3, [sp, #9]
	ldr r3, [sp, #0x58]
	bl NNSi_G2dTextCanvasDrawString
	ldr r0, [sp, #0x20]
	add r6, r6, r0
	ldr r0, [sp, #0x1c]
	add r7, r7, r0
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _020BDA34
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end NNSi_G2dTextCanvasDrawTextAlign

	arm_func_start NNSi_G2dTextCanvasDrawText
NNSi_G2dTextCanvasDrawText: ; 0x020BDB00
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	ldr r4, [sp, #0x44]
	mov r8, r0
	str r4, [sp]
	add r0, sp, #0x18
	mov r7, r1
	mov r6, r2
	mov r5, r3
	ldmib r8, {r1, r2, r3}
	ldr r4, [sp, #0x40]
	bl NNSi_G2dFontGetTextRect
	ldr r2, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r2, [sp, #0x10]
	str r0, [sp, #0x14]
	str r2, [sp, #0x20]
	str r0, [sp, #0x24]
	tst r4, #0x10
	beq _020BDB74
	add r0, r2, #1
	rsb r0, r0, #0
	add r0, r0, r0, lsr #31
	ldrsb r1, [sp, #0x48]
	mov r2, r0, asr #1
	ldrsb r0, [sp, #0x49]
	mla r7, r2, r1, r7
	mla r6, r2, r0, r6
	b _020BDB90
_020BDB74:
	tst r4, #0x20
	beq _020BDB90
	ldrsb r1, [sp, #0x48]
	ldrsb r0, [sp, #0x49]
	rsb r2, r2, #0
	mla r7, r2, r1, r7
	mla r6, r2, r0, r6
_020BDB90:
	tst r4, #2
	beq _020BDBC4
	ldr r0, [sp, #0x24]
	ldrsb r2, [sp, #0x49]
	add r0, r0, #1
	rsb r0, r0, #0
	add r0, r0, r0, lsr #31
	ldrsb r1, [sp, #0x48]
	mov r3, r0, asr #1
	rsb r0, r2, #0
	mla r7, r3, r0, r7
	mla r6, r3, r1, r6
	b _020BDBE8
_020BDBC4:
	tst r4, #4
	beq _020BDBE8
	ldrsb r1, [sp, #0x49]
	ldr r2, [sp, #0x24]
	ldrsb r0, [sp, #0x48]
	rsb r2, r2, #0
	rsb r1, r1, #0
	mla r7, r2, r1, r7
	mla r6, r2, r0, r6
_020BDBE8:
	str r5, [sp]
	ldr r1, [sp, #0x44]
	str r4, [sp, #4]
	ldrb r0, [sp, #0x48]
	str r1, [sp, #8]
	ldrb r4, [sp, #0x49]
	strb r0, [sp, #0xc]
	ldr r3, [sp, #0x20]
	mov r0, r8
	mov r1, r7
	mov r2, r6
	strb r4, [sp, #0xd]
	bl NNSi_G2dTextCanvasDrawTextAlign
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end NNSi_G2dTextCanvasDrawText

	arm_func_start NNSi_G2dTextCanvasDrawTextRect
NNSi_G2dTextCanvasDrawTextRect: ; 0x020BDC24
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	ldr ip, [sp, #0x30]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	tst ip, #0x100
	beq _020BDC78
	ldr r0, [r7, #4]
	ldr r1, [r7, #0xc]
	ldr r2, [sp, #0x34]
	bl NNSi_G2dFontGetTextHeight
	ldrsb r2, [sp, #0x39]
	ldr r3, [sp, #0x28]
	ldrsb r1, [sp, #0x38]
	sub r3, r3, r0
	rsb r0, r2, #0
	mla r6, r3, r0, r6
	mla r5, r3, r1, r5
	b _020BDCC0
_020BDC78:
	tst ip, #0x80
	beq _020BDCC0
	ldr r0, [r7, #4]
	ldr r1, [r7, #0xc]
	ldr r2, [sp, #0x34]
	bl NNSi_G2dFontGetTextHeight
	ldr r1, [sp, #0x28]
	add r0, r0, #1
	ldrsb r3, [sp, #0x39]
	add ip, r1, #1
	add r1, r0, r0, lsr #31
	ldrsb r2, [sp, #0x38]
	add r0, ip, ip, lsr #31
	mov r1, r1, asr #1
	rsb r1, r1, r0, asr #1
	rsb r0, r3, #0
	mla r6, r1, r0, r6
	mla r5, r1, r2, r5
_020BDCC0:
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	str r1, [sp]
	ldr r1, [sp, #0x34]
	str r0, [sp, #4]
	ldrb r0, [sp, #0x38]
	str r1, [sp, #8]
	ldrb ip, [sp, #0x39]
	strb r0, [sp, #0xc]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	strb ip, [sp, #0xd]
	bl NNSi_G2dTextCanvasDrawTextAlign
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNSi_G2dTextCanvasDrawTextRect

	arm_func_start NNSi_G2dGetUnpackedFont
NNSi_G2dGetUnpackedFont: ; 0x020BDD04
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r0
	mov r5, r1
	mov r4, #0
	beq _020BDD7C
	cmp r6, #0
	beq _020BDD34
	ldr r1, [r6]
	ldr r0, _020BDE4C ; =0x4E465452
	cmp r1, r0
	moveq r0, #1
	beq _020BDD38
_020BDD34:
	mov r0, #0
_020BDD38:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020BDD80
	cmp r6, #0
	beq _020BDD68
	ldrh r1, [r6, #6]
	ldr r0, _020BDE50 ; =0x00000101
	cmp r1, r0
	movhs r0, #1
	bhs _020BDD6C
_020BDD68:
	mov r0, #0
_020BDD6C:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _020BDD80
_020BDD7C:
	mov r0, r4
_020BDD80:
	cmp r0, #0
	bne _020BDE00
	cmp r6, #0
	beq _020BDDEC
	beq _020BDDA8
	ldr r1, [r6]
	ldr r0, _020BDE4C ; =0x4E465452
	cmp r1, r0
	moveq r0, #1
	beq _020BDDAC
_020BDDA8:
	mov r0, #0
_020BDDAC:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _020BDDF0
	cmp r6, #0
	beq _020BDDD8
	ldrh r0, [r6, #6]
	cmp r0, #0x100
	movhs r0, #1
	bhs _020BDDDC
_020BDDD8:
	mov r0, #0
_020BDDDC:
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	b _020BDDF0
_020BDDEC:
	mov r0, #0
_020BDDF0:
	cmp r0, #0
	bne _020BDDFC
	bl OS_Terminate
_020BDDFC:
	mov r4, #1
_020BDE00:
	mov r0, r6
	bl NNSi_G2dUnpackNFT
	ldr r1, _020BDE54 ; =0x46494E46
	mov r0, r6
	bl NNS_G2dFindBinaryBlock
	cmp r0, #0
	moveq r0, #0
	streq r0, [r5]
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r0, #8
	str r0, [r5]
	cmp r4, #0
	beq _020BDE44
	ldr r0, [r5]
	mov r1, #0
	ldr r0, [r0, #8]
	strb r1, [r0, #7]
_020BDE44:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020BDE4C: .word 0x4E465452
_020BDE50: .word 0x00000101
_020BDE54: .word 0x46494E46
	arm_func_end NNSi_G2dGetUnpackedFont

	arm_func_start NNSi_G2dUnpackNFT
NNSi_G2dUnpackNFT: ; 0x020BDE58
	stmdb sp!, {r4, r5, r6, lr}
	ldrh r1, [r0, #0xc]
	ldrh r3, [r0, #0xe]
	mov r2, #0
	add r1, r0, r1
	cmp r3, #0
	ldmleia sp!, {r4, r5, r6, pc}
	ldr r3, _020BDF24 ; =0x46494E46
	ldr ip, _020BDF28 ; =0x43574448
	ldr r4, _020BDF2C ; =0x434D4150
	ldr lr, _020BDF30 ; =0x43474C50
_020BDE84:
	ldr r5, [r1]
	cmp r5, r4
	bhi _020BDE9C
	bhs _020BDEF8
	cmp r5, lr
	b _020BDF08
_020BDE9C:
	cmp r5, ip
	bhi _020BDEAC
	beq _020BDEE4
	b _020BDF08
_020BDEAC:
	cmp r5, r3
	bne _020BDF08
	ldr r5, [r1, #0x10]
	add r5, r5, r0
	str r5, [r1, #0x10]
	ldr r5, [r1, #0x14]
	cmp r5, #0
	addne r5, r5, r0
	strne r5, [r1, #0x14]
	ldr r5, [r1, #0x18]
	cmp r5, #0
	addne r5, r5, r0
	strne r5, [r1, #0x18]
	b _020BDF08
_020BDEE4:
	ldr r5, [r1, #0xc]
	cmp r5, #0
	addne r5, r5, r0
	strne r5, [r1, #0xc]
	b _020BDF08
_020BDEF8:
	ldr r5, [r1, #0x10]
	cmp r5, #0
	addne r5, r5, r0
	strne r5, [r1, #0x10]
_020BDF08:
	ldrh r5, [r0, #0xe]
	ldr r6, [r1, #4]
	add r2, r2, #1
	cmp r2, r5
	add r1, r1, r6
	blt _020BDE84
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020BDF24: .word 0x46494E46
_020BDF28: .word 0x43574448
_020BDF2C: .word 0x434D4150
_020BDF30: .word 0x43474C50
	arm_func_end NNSi_G2dUnpackNFT

	arm_func_start NNSi_G2dBitReaderRead
NNSi_G2dBitReaderRead: ; 0x020BDF34
	stmdb sp!, {r4, r5, r6, lr}
	ldrsb r3, [r0, #4]
	ldrb r4, [r0, #5]
	mov r5, r1
	cmp r3, r5
	subge r1, r3, r5
	movge r2, r4, lsr r1
	strgeb r1, [r0, #4]
	bge _020BDF84
	ldr r2, [r0]
	sub r6, r5, r3
	add r1, r2, #1
	str r1, [r0]
	ldrb r3, [r2]
	mov r1, r6
	mov r2, #8
	strb r3, [r0, #5]
	strb r2, [r0, #4]
	bl NNSi_G2dBitReaderRead
	orr r2, r0, r4, lsl r6
_020BDF84:
	rsb r0, r5, #8
	mov r1, #0xff
	and r0, r2, r1, asr r0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNSi_G2dBitReaderRead

	arm_func_start NNSi_G2dSplitCharUTF16
NNSi_G2dSplitCharUTF16: ; 0x020BDF94
	ldr r1, [r0]
	ldrh r2, [r1], #2
	str r1, [r0]
	mov r0, r2
	bx lr
	arm_func_end NNSi_G2dSplitCharUTF16

	arm_func_start NNS_G3dAnmObjCalcSizeRequired
NNS_G3dAnmObjCalcSizeRequired: ; 0x020BDFA8
	cmp r0, #0
	cmpne r1, #0
	moveq r0, #0
	bxeq lr
	ldrb r0, [r0]
	cmp r0, #0x4a
	beq _020BDFEC
	cmp r0, #0x4d
	beq _020BDFD8
	cmp r0, #0x56
	beq _020BDFEC
	b _020BE000
_020BDFD8:
	ldrb r0, [r1, #0x18]
	mov r0, r0, lsl #1
	add r0, r0, #0x1c
	bic r0, r0, #3
	bx lr
_020BDFEC:
	ldrb r0, [r1, #0x17]
	mov r0, r0, lsl #1
	add r0, r0, #0x1c
	bic r0, r0, #3
	bx lr
_020BE000:
	mov r0, #0
	bx lr
	arm_func_end NNS_G3dAnmObjCalcSizeRequired

	arm_func_start NNS_G3dAnmObjInit
NNS_G3dAnmObjInit: ; 0x020BE008
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov ip, #0
	str ip, [r0]
	str r1, [r0, #8]
	str ip, [r0, #0x10]
	mov r4, #0x7f
	strb r4, [r0, #0x18]
	mov r4, #0x1000
	str r4, [r0, #4]
	str r3, [r0, #0x14]
	strb ip, [r0, #0x19]
	ldr r3, _020BE09C ; =_02110A00
	str ip, [r0, #0xc]
	ldr r7, [r3]
	cmp r7, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r6, [r1]
	ldr r4, _020BE0A0 ; =_02110A24
_020BE050:
	ldrb r3, [r4, ip, lsl #3]
	mov r5, ip, lsl #3
	cmp r6, r3
	bne _020BE08C
	add r3, r4, r5
	ldrh lr, [r1, #2]
	ldrh r3, [r3, #2]
	cmp lr, r3
	bne _020BE08C
	ldr r3, _020BE0A4 ; =_02110A28
	ldr r3, [r3, r5]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	blx r3
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020BE08C:
	add ip, ip, #1
	cmp ip, r7
	blo _020BE050
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020BE09C: .word _02110A00
_020BE0A0: .word _02110A24
_020BE0A4: .word _02110A28
	arm_func_end NNS_G3dAnmObjInit

	arm_func_start NNS_G3dAnmObjEnableID
NNS_G3dAnmObjEnableID: ; 0x020BE0A8
	cmp r1, #0
	bxlt lr
	ldrb r2, [r0, #0x19]
	cmp r1, r2
	bxge lr
	add r2, r0, r1, lsl #1
	ldrh r2, [r2, #0x1a]
	mov r3, r1, lsl #1
	tst r2, #0x100
	bxeq lr
	add r1, r0, #0x1a
	ldrh r0, [r1, r3]
	bic r0, r0, #0x200
	strh r0, [r1, r3]
	bx lr
	arm_func_end NNS_G3dAnmObjEnableID

	arm_func_start NNS_G3dAnmObjDisableID
NNS_G3dAnmObjDisableID: ; 0x020BE0E4
	cmp r1, #0
	bxlt lr
	ldrb r2, [r0, #0x19]
	cmp r1, r2
	bxge lr
	add r2, r0, r1, lsl #1
	ldrh r2, [r2, #0x1a]
	mov r3, r1, lsl #1
	tst r2, #0x100
	bxeq lr
	add r1, r0, #0x1a
	ldrh r0, [r1, r3]
	orr r0, r0, #0x200
	strh r0, [r1, r3]
	bx lr
	arm_func_end NNS_G3dAnmObjDisableID

	arm_func_start NNS_G3dRenderObjInit
NNS_G3dRenderObjInit: ; 0x020BE120
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r1, r5
	mov r0, #0
	mov r2, #0x54
	bl MIi_CpuClear32
	ldr r0, _020BE168 ; =_02110A20
	ldr r1, _020BE16C ; =_02110A1C
	ldr r2, [r0]
	ldr r0, _020BE170 ; =_02110A18
	str r2, [r5, #0xc]
	ldr r1, [r1]
	str r1, [r5, #0x14]
	ldr r0, [r0]
	str r0, [r5, #0x1c]
	str r4, [r5, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BE168: .word _02110A20
_020BE16C: .word _02110A1C
_020BE170: .word _02110A18
	arm_func_end NNS_G3dRenderObjInit

	arm_func_start addLink_
addLink_: ; 0x020BE174
	ldr ip, [r0]
	cmp ip, #0
	streq r1, [r0]
	bxeq lr
	ldr r2, [ip, #0x10]
	cmp r2, #0
	bne _020BE1D4
	ldrb r3, [ip, #0x18]
	ldrb r2, [r1, #0x18]
	cmp r3, r2
	bls _020BE1CC
	ldr r2, [r1, #0x10]
	mov r3, r1
	cmp r2, #0
	beq _020BE1C0
_020BE1B0:
	ldr r3, [r3, #0x10]
	ldr r2, [r3, #0x10]
	cmp r2, #0
	bne _020BE1B0
_020BE1C0:
	str ip, [r3, #0x10]
	str r1, [r0]
	bx lr
_020BE1CC:
	str r1, [ip, #0x10]
	bx lr
_020BE1D4:
	beq _020BE224
	ldrb r3, [r1, #0x18]
_020BE1DC:
	ldrb r0, [r2, #0x18]
	cmp r0, r3
	blo _020BE214
	ldr r0, [r1, #0x10]
	mov r3, r1
	cmp r0, #0
	beq _020BE208
_020BE1F8:
	ldr r3, [r3, #0x10]
	ldr r0, [r3, #0x10]
	cmp r0, #0
	bne _020BE1F8
_020BE208:
	str r1, [ip, #0x10]
	str r2, [r3, #0x10]
	bx lr
_020BE214:
	mov ip, r2
	ldr r2, [r2, #0x10]
	cmp r2, #0
	bne _020BE1DC
_020BE224:
	str r1, [ip, #0x10]
	bx lr
	arm_func_end addLink_

	arm_func_start updateHintVec_
updateHintVec_: ; 0x020BE22C
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r3, #1
	mov r4, #0
_020BE240:
	ldrb r2, [r1, #0x19]
	mov r5, r4
	cmp r2, #0
	ble _020BE284
_020BE250:
	add r2, r1, r5, lsl #1
	ldrh r2, [r2, #0x1a]
	tst r2, #0x100
	beq _020BE274
	mov lr, r5, asr #5
	ldr ip, [r0, lr, lsl #2]
	and r2, r5, #0x1f
	orr r2, ip, r3, lsl r2
	str r2, [r0, lr, lsl #2]
_020BE274:
	ldrb r2, [r1, #0x19]
	add r5, r5, #1
	cmp r5, r2
	blt _020BE250
_020BE284:
	ldr r1, [r1, #0x10]
	cmp r1, #0
	bne _020BE240
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end updateHintVec_

	arm_func_start NNS_G3dRenderObjAddAnmObj
NNS_G3dRenderObjAddAnmObj: ; 0x020BE294
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r1
	mov r5, r0
	ldrne r0, [r4, #8]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r0]
	cmp r0, #0x4a
	beq _020BE2E4
	cmp r0, #0x4d
	beq _020BE2CC
	cmp r0, #0x56
	beq _020BE2FC
	ldmia sp!, {r3, r4, r5, pc}
_020BE2CC:
	add r0, r5, #0x3c
	bl updateHintVec_
	mov r1, r4
	add r0, r5, #8
	bl addLink_
	ldmia sp!, {r3, r4, r5, pc}
_020BE2E4:
	add r0, r5, #0x44
	bl updateHintVec_
	mov r1, r4
	add r0, r5, #0x10
	bl addLink_
	ldmia sp!, {r3, r4, r5, pc}
_020BE2FC:
	add r0, r5, #0x4c
	bl updateHintVec_
	mov r1, r4
	add r0, r5, #0x18
	bl addLink_
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNS_G3dRenderObjAddAnmObj

	arm_func_start removeLink_
removeLink_: ; 0x020BE314
	ldr r3, [r0]
	cmp r3, #0
	moveq r0, #0
	bxeq lr
	cmp r3, r1
	bne _020BE344
	ldr r3, [r3, #0x10]
	mov r2, #0
	str r3, [r0]
	str r2, [r1, #0x10]
	mov r0, #1
	bx lr
_020BE344:
	ldr r2, [r3, #0x10]
	cmp r2, #0
	beq _020BE380
_020BE350:
	cmp r2, r1
	bne _020BE370
	ldr r1, [r2, #0x10]
	mov r0, #0
	str r1, [r3, #0x10]
	str r0, [r2, #0x10]
	mov r0, #1
	bx lr
_020BE370:
	mov r3, r2
	ldr r2, [r2, #0x10]
	cmp r2, #0
	bne _020BE350
_020BE380:
	mov r0, #0
	bx lr
	arm_func_end removeLink_

	arm_func_start NNS_G3dRenderObjRemoveAnmObj
NNS_G3dRenderObjRemoveAnmObj: ; 0x020BE388
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	add r0, r5, #8
	mov r4, r1
	bl removeLink_
	cmp r0, #0
	bne _020BE3CC
	mov r1, r4
	add r0, r5, #0x10
	bl removeLink_
	cmp r0, #0
	bne _020BE3CC
	mov r1, r4
	add r0, r5, #0x18
	bl removeLink_
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_020BE3CC:
	ldr r0, [r5]
	orr r0, r0, #0x10
	str r0, [r5]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNS_G3dRenderObjRemoveAnmObj

	arm_func_start NNS_G3dTexGetRequiredSize
NNS_G3dTexGetRequiredSize: ; 0x020BE3DC
	cmp r0, #0
	ldrneh r0, [r0, #0xc]
	movne r0, r0, lsl #3
	moveq r0, #0
	bx lr
	arm_func_end NNS_G3dTexGetRequiredSize

	arm_func_start NNS_G3dTex4x4GetRequiredSize
NNS_G3dTex4x4GetRequiredSize: ; 0x020BE3F0
	cmp r0, #0
	ldrneh r0, [r0, #0x1c]
	movne r0, r0, lsl #3
	moveq r0, #0
	bx lr
	arm_func_end NNS_G3dTex4x4GetRequiredSize

	arm_func_start NNS_G3dTexSetTexKey
NNS_G3dTexSetTexKey: ; 0x020BE404
	cmp r1, #0
	strne r1, [r0, #8]
	cmp r2, #0
	strne r2, [r0, #0x18]
	bx lr
	arm_func_end NNS_G3dTexSetTexKey

	arm_func_start NNS_G3dTexLoad
NNS_G3dTexLoad: ; 0x020BE418
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r8, r1
	mov sb, r0
	beq _020BE42C
	bl GX_BeginLoadTex
_020BE42C:
	ldrh r0, [sb, #0xc]
	movs r2, r0, lsl #3
	beq _020BE45C
	ldr r0, [sb, #8]
	ldr r3, [sb, #0x14]
	mov r1, r0, lsl #0x10
	add r0, sb, r3
	mov r1, r1, lsr #0xd
	bl GX_LoadTex
	ldrh r0, [sb, #0x10]
	orr r0, r0, #1
	strh r0, [sb, #0x10]
_020BE45C:
	ldrh r0, [sb, #0x1c]
	movs r6, r0, lsl #3
	beq _020BE4BC
	ldr r1, [sb, #0x18]
	ldr r0, [sb, #0x24]
	mov r4, r1, lsl #0x10
	mov r7, r4, lsr #0xd
	mov r1, r7
	mov r2, r6
	add r0, sb, r0
	ldr r5, [sb, #0x28]
	bl GX_LoadTex
	ldr r0, _020BE4CC ; =0x0001FFFF
	and r1, r7, #0x40000
	and r0, r0, r4, lsr #13
	mov r0, r0, lsr #1
	add r2, r0, #0x20000
	add r0, sb, r5
	add r1, r2, r1, lsr #2
	mov r2, r6, lsr #1
	bl GX_LoadTex
	ldrh r0, [sb, #0x20]
	orr r0, r0, #1
	strh r0, [sb, #0x20]
_020BE4BC:
	cmp r8, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	bl GX_EndLoadTex
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020BE4CC: .word 0x0001FFFF
	arm_func_end NNS_G3dTexLoad

	arm_func_start NNS_G3dTexReleaseTexKey
NNS_G3dTexReleaseTexKey: ; 0x020BE4D0
	cmp r1, #0
	beq _020BE4F4
	ldrh ip, [r0, #0x10]
	mov r3, #0
	bic ip, ip, #1
	strh ip, [r0, #0x10]
	ldr ip, [r0, #8]
	str ip, [r1]
	str r3, [r0, #8]
_020BE4F4:
	cmp r2, #0
	bxeq lr
	ldrh r3, [r0, #0x20]
	mov r1, #0
	bic r3, r3, #1
	strh r3, [r0, #0x20]
	ldr r3, [r0, #0x18]
	str r3, [r2]
	str r1, [r0, #0x18]
	bx lr
	arm_func_end NNS_G3dTexReleaseTexKey

	arm_func_start NNS_G3dPlttGetRequiredSize
NNS_G3dPlttGetRequiredSize: ; 0x020BE51C
	cmp r0, #0
	ldrneh r0, [r0, #0x30]
	movne r0, r0, lsl #3
	moveq r0, #0
	bx lr
	arm_func_end NNS_G3dPlttGetRequiredSize

	arm_func_start NNS_G3dPlttSetPlttKey
NNS_G3dPlttSetPlttKey: ; 0x020BE530
	str r1, [r0, #0x2c]
	bx lr
	arm_func_end NNS_G3dPlttSetPlttKey

	arm_func_start NNS_G3dPlttLoad
NNS_G3dPlttLoad: ; 0x020BE538
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r1
	mov r4, r0
	beq _020BE54C
	bl GX_BeginLoadTexPltt
_020BE54C:
	ldr r0, [r4, #0x2c]
	ldrh r2, [r4, #0x30]
	mov r1, r0, lsl #0x10
	ldr r3, [r4, #0x38]
	mov r1, r1, lsr #0xd
	add r0, r4, r3
	mov r2, r2, lsl #3
	bl GX_LoadTexPltt
	ldrh r0, [r4, #0x32]
	cmp r5, #0
	orr r0, r0, #1
	strh r0, [r4, #0x32]
	ldmeqia sp!, {r3, r4, r5, pc}
	bl GX_EndLoadTexPltt
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNS_G3dPlttLoad

	arm_func_start NNS_G3dPlttReleasePlttKey
NNS_G3dPlttReleasePlttKey: ; 0x020BE588
	ldrh r2, [r0, #0x32]
	mov r1, #0
	bic r2, r2, #1
	strh r2, [r0, #0x32]
	ldr r2, [r0, #0x2c]
	str r1, [r0, #0x2c]
	mov r0, r2
	bx lr
	arm_func_end NNS_G3dPlttReleasePlttKey

	arm_func_start bindMdlTex_Internal_
bindMdlTex_Internal_: ; 0x020BE5A8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	mov r8, r3
	ldr r1, [r8]
	mov sl, r0
	and r0, r1, #0x1c000000
	ldrh r3, [sb]
	cmp r0, #0x14000000
	mov r5, #0
	add r0, sl, r3
	str r0, [sp]
	ldrne r0, [r2, #8]
	ldreq r0, [r2, #0x18]
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bic fp, r0, #0xe0000000
	ldrb r0, [sb, #2]
	cmp r0, #0
	bls _020BE6C4
	add r4, sl, #4
_020BE5F8:
	ldr r0, [sp]
	cmp sl, #0
	ldrb r2, [r0, r5]
	beq _020BE648
	cmp r4, #0
	beq _020BE634
	ldrb r0, [sl, #5]
	cmp r2, r0
	bhs _020BE634
	ldrh r0, [sl, #0xa]
	add r1, r4, r0
	add r1, r1, #4
	ldrh r0, [r4, r0]
	mla r1, r0, r2, r1
	b _020BE638
_020BE634:
	mov r1, #0
_020BE638:
	cmp r1, #0
	ldrne r0, [r1]
	addne r7, sl, r0
	bne _020BE64C
_020BE648:
	mov r7, #0
_020BE64C:
	ldr r0, [r8]
	ldr r1, [r7, #0x14]
	add r0, r0, fp
	orr r0, r1, r0
	str r0, [r7, #0x14]
	ldr r3, [r8, #4]
	ldr r0, _020BE6D4 ; =0x000007FF
	ldrh r1, [r7, #0x20]
	and r2, r3, r0
	and r0, r3, r0, lsl #11
	mov r6, r0, lsr #0xb
	cmp r2, r1
	moveq r0, #0x1000
	beq _020BE690
	mov r0, r2, lsl #0xc
	mov r1, r1, lsl #0xc
	bl FX_Div
_020BE690:
	str r0, [r7, #0x24]
	ldrh r1, [r7, #0x22]
	cmp r6, r1
	moveq r0, #0x1000
	beq _020BE6B0
	mov r0, r6, lsl #0xc
	mov r1, r1, lsl #0xc
	bl FX_Div
_020BE6B0:
	str r0, [r7, #0x28]
	ldrb r0, [sb, #2]
	add r5, r5, #1
	cmp r5, r0
	blo _020BE5F8
_020BE6C4:
	ldrb r0, [sb, #3]
	orr r0, r0, #1
	strb r0, [sb, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020BE6D4: .word 0x000007FF
	arm_func_end bindMdlTex_Internal_

	arm_func_start releaseMdlTex_Internal_
releaseMdlTex_Internal_: ; 0x020BE6D8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldrh r3, [r1]
	ldrb r2, [r1, #2]
	mov lr, #0
	add ip, r0, r3
	cmp r2, #0
	bls _020BE77C
	ldr r4, _020BE78C ; =0xC00F0000
	add r2, r0, #4
	mov r7, lr
	mov r6, lr
	mov r5, #0x1000
_020BE708:
	cmp r0, #0
	ldrb r3, [ip, lr]
	beq _020BE754
	cmp r2, #0
	beq _020BE740
	ldrb r8, [r0, #5]
	cmp r3, r8
	bhs _020BE740
	ldrh sb, [r0, #0xa]
	ldrh r8, [r2, sb]
	add sb, r2, sb
	add sb, sb, #4
	mla r3, r8, r3, sb
	b _020BE744
_020BE740:
	mov r3, r7
_020BE744:
	cmp r3, #0
	ldrne r3, [r3]
	addne r8, r0, r3
	bne _020BE758
_020BE754:
	mov r8, r6
_020BE758:
	ldr r3, [r8, #0x14]
	add lr, lr, #1
	and r3, r3, r4
	str r3, [r8, #0x14]
	str r5, [r8, #0x24]
	str r5, [r8, #0x28]
	ldrb r3, [r1, #2]
	cmp lr, r3
	blo _020BE708
_020BE77C:
	ldrb r0, [r1, #3]
	bic r0, r0, #1
	strb r0, [r1, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020BE78C: .word 0xC00F0000
	arm_func_end releaseMdlTex_Internal_

	arm_func_start NNS_G3dBindMdlTex
NNS_G3dBindMdlTex: ; 0x020BE790
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r1
	cmp r0, #0
	ldrne r1, [r0, #8]
	mov r7, #1
	cmpne r1, #0
	addne r8, r0, r1
	moveq r8, #0
	ldrh r0, [r8]
	mov r6, #0
	add r5, r8, r0
	ldrb r0, [r5, #1]
	cmp r0, #0
	bls _020BE888
	mov sb, r6
	mov r4, r6
	mov fp, r6
_020BE7D4:
	cmp r5, #0
	beq _020BE800
	ldrb r0, [r5, #1]
	cmp r6, r0
	bhs _020BE800
	ldrh r0, [r5, #6]
	add r1, r5, r0
	ldrh r0, [r1, #2]
	add r0, r1, r0
	add r1, r0, sb
	b _020BE804
_020BE800:
	mov r1, r4
_020BE804:
	cmp sl, #0
	moveq r3, fp
	beq _020BE81C
	add r0, sl, #0x3c
	bl NNS_G3dGetResDataByName
	mov r3, r0
_020BE81C:
	cmp r3, #0
	beq _020BE870
	cmp r5, #0
	beq _020BE850
	ldrb r0, [r5, #1]
	cmp r6, r0
	bhs _020BE850
	ldrh r1, [r5, #6]
	ldrh r0, [r5, r1]
	add r1, r5, r1
	add r1, r1, #4
	mla r1, r0, r6, r1
	b _020BE854
_020BE850:
	mov r1, #0
_020BE854:
	ldrb r0, [r1, #3]
	tst r0, #1
	bne _020BE874
	mov r0, r8
	mov r2, sl
	bl bindMdlTex_Internal_
	b _020BE874
_020BE870:
	mov r7, #0
_020BE874:
	ldrb r0, [r5, #1]
	add r6, r6, #1
	add sb, sb, #0x10
	cmp r6, r0
	blo _020BE7D4
_020BE888:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end NNS_G3dBindMdlTex

	arm_func_start NNS_G3dForceBindMdlTex
NNS_G3dForceBindMdlTex: ; 0x020BE890
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, r1
	cmp r0, #0
	ldrne r1, [r0, #8]
	cmpne r1, #0
	addne r0, r0, r1
	moveq r0, #0
	ldrh r1, [r0]
	cmp ip, #0
	add r1, r0, r1
	beq _020BE8F0
	adds r5, ip, #0x3c
	beq _020BE8E8
	ldrb r4, [ip, #0x3d]
	cmp r3, r4
	bhs _020BE8E8
	ldrh lr, [ip, #0x42]
	ldrh r4, [r5, lr]
	add lr, r5, lr
	add lr, lr, #4
	mla r3, r4, r3, lr
	b _020BE8F4
_020BE8E8:
	mov r3, #0
	b _020BE8F4
_020BE8F0:
	mov r3, #0
_020BE8F4:
	cmp r1, #0
	beq _020BE920
	ldrb r4, [r1, #1]
	cmp r2, r4
	bhs _020BE920
	ldrh r4, [r1, #6]
	ldrh lr, [r1, r4]
	add r1, r1, r4
	add r1, r1, #4
	mla r1, lr, r2, r1
	b _020BE924
_020BE920:
	mov r1, #0
_020BE924:
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r2, ip
	bl bindMdlTex_Internal_
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNS_G3dForceBindMdlTex

	arm_func_start NNS_G3dReleaseMdlTex
NNS_G3dReleaseMdlTex: ; 0x020BE940
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	cmp r0, #0
	ldrne r1, [r0, #8]
	mov r5, #0
	cmpne r1, #0
	addne r6, r0, r1
	moveq r6, #0
	ldrh r0, [r6]
	add r4, r6, r0
	ldrb r0, [r4, #1]
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, pc}
	mov r7, r5
_020BE974:
	cmp r4, #0
	beq _020BE9A0
	ldrb r0, [r4, #1]
	cmp r5, r0
	bhs _020BE9A0
	ldrh r1, [r4, #6]
	ldrh r0, [r4, r1]
	add r1, r4, r1
	add r1, r1, #4
	mla r1, r0, r5, r1
	b _020BE9A4
_020BE9A0:
	mov r1, r7
_020BE9A4:
	ldrb r0, [r1, #3]
	tst r0, #1
	beq _020BE9B8
	mov r0, r6
	bl releaseMdlTex_Internal_
_020BE9B8:
	ldrb r0, [r4, #1]
	add r5, r5, #1
	cmp r5, r0
	blo _020BE974
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNS_G3dReleaseMdlTex

	arm_func_start bindMdlPltt_Internal_
bindMdlPltt_Internal_: ; 0x020BE9CC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r2, [r2, #0x2c]
	ldrh r5, [r1]
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	ldrh r4, [r3, #2]
	bic r2, r2, #0xe0000000
	mov r2, r2, lsl #0x10
	tst r4, #1
	add ip, r0, r5
	mov r5, r2, lsr #0x10
	ldrh r4, [r3]
	bne _020BEA10
	mov r2, r4, lsl #0xf
	mov r3, r5, lsl #0xf
	mov r4, r2, lsr #0x10
	mov r5, r3, lsr #0x10
_020BEA10:
	ldrb r2, [r1, #2]
	mov r3, #0
	cmp r2, #0
	bls _020BEA9C
	add r2, r4, r5
	mov lr, r2, lsl #0x10
	add r2, r0, #4
	mov r4, lr, lsr #0x10
	mov r6, r3
	mov r5, r3
_020BEA38:
	cmp r0, #0
	ldrb r8, [ip, r3]
	beq _020BEA84
	cmp r2, #0
	beq _020BEA70
	ldrb r7, [r0, #5]
	cmp r8, r7
	bhs _020BEA70
	ldrh r7, [r0, #0xa]
	ldrh lr, [r2, r7]
	add r7, r2, r7
	add r7, r7, #4
	mla r7, lr, r8, r7
	b _020BEA74
_020BEA70:
	mov r7, r6
_020BEA74:
	cmp r7, #0
	ldrne lr, [r7]
	addne r7, r0, lr
	bne _020BEA88
_020BEA84:
	mov r7, r5
_020BEA88:
	strh r4, [r7, #0x1c]
	ldrb lr, [r1, #2]
	add r3, r3, #1
	cmp r3, lr
	blo _020BEA38
_020BEA9C:
	ldrb r0, [r1, #3]
	orr r0, r0, #1
	strb r0, [r1, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end bindMdlPltt_Internal_

	arm_func_start NNS_G3dBindMdlPltt
NNS_G3dBindMdlPltt: ; 0x020BEAAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r1
	cmp r0, #0
	ldrne r1, [r0, #8]
	mov r7, #1
	cmpne r1, #0
	addne r8, r0, r1
	moveq r8, #0
	ldrh r0, [r8, #2]
	mov r6, #0
	add r5, r8, r0
	ldrb r0, [r5, #1]
	cmp r0, #0
	bls _020BEBAC
	mov sb, r6
	mov r4, r6
	mov fp, r6
_020BEAF0:
	cmp r5, #0
	beq _020BEB1C
	ldrb r0, [r5, #1]
	cmp r6, r0
	bhs _020BEB1C
	ldrh r0, [r5, #6]
	add r1, r5, r0
	ldrh r0, [r1, #2]
	add r0, r1, r0
	add r1, r0, sb
	b _020BEB20
_020BEB1C:
	mov r1, r4
_020BEB20:
	cmp sl, #0
	ldrneh r0, [sl, #0x34]
	cmpne r0, #0
	moveq r3, fp
	beq _020BEB40
	add r0, sl, r0
	bl NNS_G3dGetResDataByName
	mov r3, r0
_020BEB40:
	cmp r3, #0
	beq _020BEB94
	cmp r5, #0
	beq _020BEB74
	ldrb r0, [r5, #1]
	cmp r6, r0
	bhs _020BEB74
	ldrh r1, [r5, #6]
	ldrh r0, [r5, r1]
	add r1, r5, r1
	add r1, r1, #4
	mla r1, r0, r6, r1
	b _020BEB78
_020BEB74:
	mov r1, #0
_020BEB78:
	ldrb r0, [r1, #3]
	tst r0, #1
	bne _020BEB98
	mov r0, r8
	mov r2, sl
	bl bindMdlPltt_Internal_
	b _020BEB98
_020BEB94:
	mov r7, #0
_020BEB98:
	ldrb r0, [r5, #1]
	add r6, r6, #1
	add sb, sb, #0x10
	cmp r6, r0
	blo _020BEAF0
_020BEBAC:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end NNS_G3dBindMdlPltt

	arm_func_start NNS_G3dForceBindMdlPltt
NNS_G3dForceBindMdlPltt: ; 0x020BEBB4
	stmdb sp!, {r3, r4, r5, lr}
	mov ip, r1
	cmp r0, #0
	ldrne r1, [r0, #8]
	cmpne r1, #0
	addne r0, r0, r1
	moveq r0, #0
	ldrh r1, [r0, #2]
	cmp ip, #0
	ldrneh r4, [ip, #0x34]
	add r1, r0, r1
	cmpne r4, #0
	beq _020BEC1C
	adds r5, ip, r4
	beq _020BEC14
	ldrb r4, [r5, #1]
	cmp r3, r4
	bhs _020BEC14
	ldrh lr, [r5, #6]
	ldrh r4, [r5, lr]
	add lr, r5, lr
	add lr, lr, #4
	mla r3, r4, r3, lr
	b _020BEC20
_020BEC14:
	mov r3, #0
	b _020BEC20
_020BEC1C:
	mov r3, #0
_020BEC20:
	cmp r1, #0
	beq _020BEC4C
	ldrb r4, [r1, #1]
	cmp r2, r4
	bhs _020BEC4C
	ldrh r4, [r1, #6]
	ldrh lr, [r1, r4]
	add r1, r1, r4
	add r1, r1, #4
	mla r1, lr, r2, r1
	b _020BEC50
_020BEC4C:
	mov r1, #0
_020BEC50:
	cmp r1, #0
	beq _020BEC74
	ldrb r2, [r1, #3]
	tst r2, #1
	bne _020BEC74
	mov r2, ip
	bl bindMdlPltt_Internal_
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_020BEC74:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNS_G3dForceBindMdlPltt

	arm_func_start NNS_G3dReleaseMdlPltt
NNS_G3dReleaseMdlPltt: ; 0x020BEC7C
	cmp r0, #0
	ldrne r1, [r0, #8]
	mov ip, #0
	cmpne r1, #0
	addne r1, r0, r1
	moveq r1, #0
	ldrh r0, [r1, #2]
	add r3, r1, r0
	ldrb r0, [r3, #1]
	cmp r0, #0
	bxls lr
	mov r1, ip
_020BECAC:
	cmp r3, #0
	beq _020BECD8
	ldrb r0, [r3, #1]
	cmp ip, r0
	bhs _020BECD8
	ldrh r2, [r3, #6]
	ldrh r0, [r3, r2]
	add r2, r3, r2
	add r2, r2, #4
	mla r2, r0, ip, r2
	b _020BECDC
_020BECD8:
	mov r2, r1
_020BECDC:
	ldrb r0, [r2, #3]
	add ip, ip, #1
	tst r0, #1
	bicne r0, r0, #1
	strneb r0, [r2, #3]
	ldrb r0, [r3, #1]
	cmp ip, r0
	blo _020BECAC
	bx lr
	arm_func_end NNS_G3dReleaseMdlPltt

	arm_func_start NNS_G3dBindMdlSet
NNS_G3dBindMdlSet: ; 0x020BED00
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldrb r0, [sl, #9]
	mov sb, r1
	mov r7, #1
	cmp r0, #0
	mov r6, #0
	bls _020BEDA8
	add r5, sl, #8
	mov r4, r6
	mov fp, r6
_020BED2C:
	cmp sl, #0
	beq _020BED74
	cmp r5, #0
	beq _020BED60
	ldrb r0, [sl, #9]
	cmp r6, r0
	bhs _020BED60
	ldrh r1, [sl, #0xe]
	ldrh r0, [r5, r1]
	add r1, r5, r1
	add r1, r1, #4
	mla r1, r0, r6, r1
	b _020BED64
_020BED60:
	mov r1, r4
_020BED64:
	cmp r1, #0
	ldrne r0, [r1]
	addne r8, sl, r0
	bne _020BED78
_020BED74:
	mov r8, fp
_020BED78:
	mov r0, r8
	mov r1, sb
	bl NNS_G3dBindMdlTex
	and r7, r7, r0
	mov r0, r8
	mov r1, sb
	bl NNS_G3dBindMdlPltt
	ldrb r1, [sl, #9]
	add r6, r6, #1
	and r7, r7, r0
	cmp r6, r1
	blo _020BED2C
_020BEDA8:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end NNS_G3dBindMdlSet

	arm_func_start NNS_G3dReleaseMdlSet
NNS_G3dReleaseMdlSet: ; 0x020BEDB0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r6, r0
	ldrb r0, [r6, #9]
	mov r5, #0
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r4, r6, #8
	mov r8, r5
	mov r7, r5
_020BEDD4:
	cmp r6, #0
	beq _020BEE1C
	cmp r4, #0
	beq _020BEE08
	ldrb r0, [r6, #9]
	cmp r5, r0
	bhs _020BEE08
	ldrh r1, [r6, #0xe]
	ldrh r0, [r4, r1]
	add r1, r4, r1
	add r1, r1, #4
	mla r1, r0, r5, r1
	b _020BEE0C
_020BEE08:
	mov r1, r8
_020BEE0C:
	cmp r1, #0
	ldrne r0, [r1]
	addne sb, r6, r0
	bne _020BEE20
_020BEE1C:
	mov sb, r7
_020BEE20:
	mov r0, sb
	bl NNS_G3dReleaseMdlTex
	mov r0, sb
	bl NNS_G3dReleaseMdlPltt
	ldrb r0, [r6, #9]
	add r5, r5, #1
	cmp r5, r0
	blo _020BEDD4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end NNS_G3dReleaseMdlSet

	arm_func_start NNS_G3dGlbInit
NNS_G3dGlbInit: ; 0x020BEE44
	stmdb sp!, {r3, lr}
	ldr r2, _020BEF58 ; =0x17101610
	ldr r1, _020BEF5C ; =NNS_G3dGlb
	mov r0, #0
	str r2, [r1]
	str r0, [r1, #4]
	mov r2, #2
	ldr r0, _020BEF60 ; =0x32323232
	str r2, [r1, #0x48]
	ldr r2, _020BEF64 ; =0x60293130
	str r0, [r1, #0x7c]
	ldr r0, _020BEF68 ; =0x33333333
	str r2, [r1, #0x90]
	ldr r2, _020BEF6C ; =0x002A1B19
	str r0, [r1, #0xa4]
	ldr r0, _020BEF70 ; =NNS_G3dGlb + 0x4C
	str r2, [r1, #0xb8]
	bl MTX_Identity43_
	ldr r0, _020BEF74 ; =NNS_G3dGlb + 0x8
	bl MTX_Identity44_
	ldr ip, _020BEF78 ; =0x40000200
	ldr r3, _020BEF7C ; =0xC0080000
	ldr r2, _020BEF80 ; =0x2D8B62D8
	ldr r1, _020BEF5C ; =NNS_G3dGlb
	sub r0, ip, #0xc0000001
	str r2, [r1, #0x80]
	str ip, [r1, #0x84]
	str r0, [r1, #0x88]
	ldr r2, _020BEF84 ; =0x4210C210
	str r3, [r1, #0x8c]
	str r2, [r1, #0x94]
	ldr r0, _020BEF88 ; =0x001F008F
	str r2, [r1, #0x98]
	str r0, [r1, #0x9c]
	sub r2, r3, #0x90000
	ldr r0, _020BEF8C ; =0x00007FFF
	str r2, [r1, #0xa0]
	str r0, [r1, #0xa8]
	mov r2, #0x4000001f
	ldr r0, _020BEF90 ; =0x800003E0
	str r2, [r1, #0xac]
	str r0, [r1, #0xb0]
	rsb r0, ip, #0x7e00
	str r0, [r1, #0xb4]
	mov r2, #0
	str r2, [r1, #0xe0]
	str r2, [r1, #0xe4]
	ldr r0, _020BEF94 ; =NNS_G3dGlb + 0xBC
	str r2, [r1, #0xe8]
	bl MTX_Identity33_
	mov r1, #0
	ldr r0, _020BEF5C ; =NNS_G3dGlb
	mov r2, #0x1000
	str r2, [r0, #0xec]
	str r2, [r0, #0xf0]
	str r2, [r0, #0xf4]
	str r1, [r0, #0xf8]
	str r1, [r0, #0xfc]
	str r1, [r0, #0x248]
	str r1, [r0, #0x244]
	str r1, [r0, #0x240]
	str r1, [r0, #0x254]
	str r1, [r0, #0x24c]
	str r2, [r0, #0x250]
	str r1, [r0, #0x25c]
	str r1, [r0, #0x258]
	sub r1, r1, #0x1000
	str r1, [r0, #0x260]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BEF58: .word 0x17101610
_020BEF5C: .word NNS_G3dGlb
_020BEF60: .word 0x32323232
_020BEF64: .word 0x60293130
_020BEF68: .word 0x33333333
_020BEF6C: .word 0x002A1B19
_020BEF70: .word NNS_G3dGlb + 0x4C
_020BEF74: .word NNS_G3dGlb + 0x8
_020BEF78: .word 0x40000200
_020BEF7C: .word 0xC0080000
_020BEF80: .word 0x2D8B62D8
_020BEF84: .word 0x4210C210
_020BEF88: .word 0x001F008F
_020BEF8C: .word 0x00007FFF
_020BEF90: .word 0x800003E0
_020BEF94: .word NNS_G3dGlb + 0xBC
	arm_func_end NNS_G3dGlbInit

	arm_func_start NNS_G3dGlbFlushP
NNS_G3dGlbFlushP: ; 0x020BEF98
	stmdb sp!, {r3, lr}
	ldr r0, _020BEFCC ; =NNS_G3dGlb
	ldr r1, _020BEFD0 ; =NNS_G3dGlb
	ldr r0, [r0]
	add r1, r1, #4
	mov r2, #0x3e
	bl NNS_G3dGeBufferOP_N
	ldr r0, _020BEFCC ; =NNS_G3dGlb
	ldr r1, [r0, #0xfc]
	bic r1, r1, #1
	bic r1, r1, #2
	str r1, [r0, #0xfc]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BEFCC: .word NNS_G3dGlb
_020BEFD0: .word NNS_G3dGlb
	arm_func_end NNS_G3dGlbFlushP

	arm_func_start NNS_G3dGlbSetBaseTrans
NNS_G3dGlbSetBaseTrans: ; 0x020BEFD4
	cmp r0, #0
	bxeq lr
	ldr r3, _020BEFFC ; =NNS_G3dGlb + 0xE0
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r0, _020BF000 ; =NNS_G3dGlb
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0xa4
	str r1, [r0, #0xfc]
	bx lr
	.align 2, 0
_020BEFFC: .word NNS_G3dGlb + 0xE0
_020BF000: .word NNS_G3dGlb
	arm_func_end NNS_G3dGlbSetBaseTrans

	arm_func_start NNS_G3dGlbSetBaseScale
NNS_G3dGlbSetBaseScale: ; 0x020BF004
	cmp r0, #0
	bxeq lr
	ldr r3, _020BF02C ; =NNS_G3dGlb + 0xEC
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r0, _020BF030 ; =NNS_G3dGlb
	ldr r1, [r0, #0xfc]
	bic r1, r1, #0xa4
	str r1, [r0, #0xfc]
	bx lr
	.align 2, 0
_020BF02C: .word NNS_G3dGlb + 0xEC
_020BF030: .word NNS_G3dGlb
	arm_func_end NNS_G3dGlbSetBaseScale

	arm_func_start NNS_G3dGlbLightVector
NNS_G3dGlbLightVector: ; 0x020BF034
	stmdb sp!, {r3, lr}
	ldr ip, _020BF068 ; =0x000003FF
	mov r2, r2, asr #3
	mov lr, r3, asr #3
	and r3, ip, r1, asr #3
	mov r1, r2, lsl #0x16
	mov r2, lr, lsl #0x16
	orr r1, r3, r1, lsr #12
	orr r2, r1, r2, lsr #2
	ldr r1, _020BF06C ; =NNS_G3dGlb + 0x80
	orr r2, r2, r0, lsl #30
	str r2, [r1, r0, lsl #2]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BF068: .word 0x000003FF
_020BF06C: .word NNS_G3dGlb + 0x80
	arm_func_end NNS_G3dGlbLightVector

	arm_func_start NNS_G3dGlbLightColor
NNS_G3dGlbLightColor: ; 0x020BF070
	ldr r2, _020BF080 ; =NNS_G3dGlb + 0xA8
	orr r1, r1, r0, lsl #30
	str r1, [r2, r0, lsl #2]
	bx lr
	.align 2, 0
_020BF080: .word NNS_G3dGlb + 0xA8
	arm_func_end NNS_G3dGlbLightColor

	arm_func_start NNS_G3dGlbMaterialColorDiffAmb
NNS_G3dGlbMaterialColorDiffAmb: ; 0x020BF084
	cmp r2, #0
	movne r2, #1
	orr r1, r0, r1, lsl #16
	moveq r2, #0
	ldr r0, _020BF0A4 ; =NNS_G3dGlb
	orr r1, r1, r2, lsl #15
	str r1, [r0, #0x94]
	bx lr
	.align 2, 0
_020BF0A4: .word NNS_G3dGlb
	arm_func_end NNS_G3dGlbMaterialColorDiffAmb

	arm_func_start NNS_G3dGlbMaterialColorSpecEmi
NNS_G3dGlbMaterialColorSpecEmi: ; 0x020BF0A8
	cmp r2, #0
	movne r2, #1
	orr r1, r0, r1, lsl #16
	moveq r2, #0
	ldr r0, _020BF0C8 ; =NNS_G3dGlb
	orr r1, r1, r2, lsl #15
	str r1, [r0, #0x98]
	bx lr
	.align 2, 0
_020BF0C8: .word NNS_G3dGlb
	arm_func_end NNS_G3dGlbMaterialColorSpecEmi

	arm_func_start NNS_G3dGlbPolygonAttr
NNS_G3dGlbPolygonAttr: ; 0x020BF0CC
	orr r0, r0, r1, lsl #4
	ldr r1, [sp, #4]
	orr r0, r0, r2, lsl #6
	orr r0, r1, r0
	ldr r2, [sp]
	orr r1, r0, r3, lsl #24
	ldr r0, _020BF0F4 ; =NNS_G3dGlb
	orr r1, r1, r2, lsl #16
	str r1, [r0, #0x9c]
	bx lr
	.align 2, 0
_020BF0F4: .word NNS_G3dGlb
	arm_func_end NNS_G3dGlbPolygonAttr

	arm_func_start NNS_G3dGlbGetInvV
NNS_G3dGlbGetInvV: ; 0x020BF0F8
	stmdb sp!, {r3, lr}
	ldr r0, _020BF130 ; =NNS_G3dGlb
	ldr r0, [r0, #0xfc]
	tst r0, #8
	bne _020BF128
	ldr r0, _020BF134 ; =NNS_G3dGlb + 0x4C
	ldr r1, _020BF138 ; =NNS_G3dGlb + 0x100
	bl MTX_Inverse43
	ldr r0, _020BF130 ; =NNS_G3dGlb
	ldr r1, [r0, #0xfc]
	orr r1, r1, #8
	str r1, [r0, #0xfc]
_020BF128:
	ldr r0, _020BF138 ; =NNS_G3dGlb + 0x100
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BF130: .word NNS_G3dGlb
_020BF134: .word NNS_G3dGlb + 0x4C
_020BF138: .word NNS_G3dGlb + 0x100
	arm_func_end NNS_G3dGlbGetInvV

	arm_func_start mtx_inverse44
mtx_inverse44: ; 0x020BF13C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x48
	str r1, [sp]
	add r1, sp, #8
	bl MI_Copy64B
	ldr r0, [sp]
	bl MTX_Identity44_
	mov fp, #0
_020BF15C:
	mov r3, fp
	mov r1, fp
	cmp fp, #4
	mov r2, #0
	bge _020BF19C
	add r0, sp, #8
	add r0, r0, fp, lsl #2
_020BF178:
	ldr r4, [r0, r1, lsl #4]
	cmp r4, #0
	rsblt r4, r4, #0
	cmp r4, r2
	movgt r3, r1
	add r1, r1, #1
	movgt r2, r4
	cmp r1, #4
	blt _020BF178
_020BF19C:
	cmp r2, #0
	addeq sp, sp, #0x48
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r3, fp
	beq _020BF1FC
	ldr r1, [sp]
	add r2, sp, #8
	mov r0, #0
	add r4, r1, fp, lsl #4
	add r6, r2, fp, lsl #4
	add r5, r2, r3, lsl #4
	add r2, r1, r3, lsl #4
_020BF1D0:
	ldr r3, [r6, r0, lsl #2]
	ldr r1, [r5, r0, lsl #2]
	str r1, [r6, r0, lsl #2]
	str r3, [r5, r0, lsl #2]
	ldr r3, [r4, r0, lsl #2]
	ldr r1, [r2, r0, lsl #2]
	str r1, [r4, r0, lsl #2]
	str r3, [r2, r0, lsl #2]
	add r0, r0, #1
	cmp r0, #4
	blt _020BF1D0
_020BF1FC:
	add r0, sp, #8
	add r0, r0, fp, lsl #4
	ldr r0, [r0, fp, lsl #2]
	bl FX_InvFx64c
	ldr r2, [sp]
	mov r3, #0
	mov lr, #0x80000000
	add r4, sp, #8
	add sb, r2, fp, lsl #4
	add r2, r4, fp, lsl #4
	mov r4, r3
	mov r6, r3
	mov r5, lr
_020BF230:
	ldr r8, [r2, r3, lsl #2]
	mov r7, r8, asr #0x1f
	umull ip, sl, r0, r8
	adds ip, ip, lr
	mla sl, r0, r7, sl
	mla sl, r1, r8, sl
	adc r7, sl, r4
	str r7, [r2, r3, lsl #2]
	ldr r8, [sb, r3, lsl #2]
	mov r7, r8, asr #0x1f
	umull ip, sl, r0, r8
	adds ip, ip, r5
	mla sl, r0, r7, sl
	mla sl, r1, r8, sl
	adc r7, sl, r6
	str r7, [sb, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #4
	blt _020BF230
	ldr r0, [sp]
	add r1, sp, #8
	add r6, r0, fp, lsl #4
	add r0, sp, #8
	add r1, r1, fp, lsl #2
	mov ip, #0
	add r0, r0, fp, lsl #4
	str r1, [sp, #4]
_020BF29C:
	cmp ip, fp
	beq _020BF320
	ldr r1, [sp, #4]
	ldr r4, [sp]
	ldr r3, [r1, ip, lsl #4]
	add r1, sp, #8
	mov lr, #0
	mov r2, r3, asr #0x1f
	add r1, r1, ip, lsl #4
	add sl, r4, ip, lsl #4
_020BF2C4:
	ldr r5, [r0, lr, lsl #2]
	ldr sb, [r1, lr, lsl #2]
	mov r4, r5, asr #0x1f
	umull r8, r7, r3, r5
	mla r7, r3, r4, r7
	mla r7, r2, r5, r7
	mov r4, r8, lsr #0xc
	orr r4, r4, r7, lsl #20
	sub r4, sb, r4
	str r4, [r1, lr, lsl #2]
	ldr sb, [sl, lr, lsl #2]
	ldr r5, [r6, lr, lsl #2]
	mov r4, r5, asr #0x1f
	umull r8, r7, r3, r5
	mla r7, r3, r4, r7
	mla r7, r2, r5, r7
	mov r4, r8, lsr #0xc
	orr r4, r4, r7, lsl #20
	sub r4, sb, r4
	str r4, [sl, lr, lsl #2]
	add lr, lr, #1
	cmp lr, #4
	blt _020BF2C4
_020BF320:
	add ip, ip, #1
	cmp ip, #4
	blt _020BF29C
	add fp, fp, #1
	cmp fp, #4
	blt _020BF15C
	mov r0, #0
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end mtx_inverse44

	arm_func_start NNS_G3dGlbGetInvP
NNS_G3dGlbGetInvP: ; 0x020BF344
	stmdb sp!, {r3, lr}
	ldr r0, _020BF37C ; =NNS_G3dGlb
	ldr r0, [r0, #0xfc]
	tst r0, #0x10
	bne _020BF374
	ldr r0, _020BF380 ; =NNS_G3dGlb + 0x8
	ldr r1, _020BF384 ; =NNS_G3dGlb + 0x1C0
	bl mtx_inverse44
	ldr r0, _020BF37C ; =NNS_G3dGlb
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x10
	str r1, [r0, #0xfc]
_020BF374:
	ldr r0, _020BF384 ; =NNS_G3dGlb + 0x1C0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BF37C: .word NNS_G3dGlb
_020BF380: .word NNS_G3dGlb + 0x8
_020BF384: .word NNS_G3dGlb + 0x1C0
	arm_func_end NNS_G3dGlbGetInvP

	arm_func_start calcSrtCameraMtx_
calcSrtCameraMtx_: ; 0x020BF388
	stmdb sp!, {r3, lr}
	ldr r0, _020BF3CC ; =NNS_G3dGlb + 0xBC
	ldr r1, _020BF3D0 ; =NNS_G3dGlb + 0x4C
	ldr r2, _020BF3D4 ; =NNS_G3dGlb + 0x130
	bl MTX_Concat43
	ldr r3, _020BF3D8 ; =NNS_G3dGlb
	ldr r0, _020BF3D4 ; =NNS_G3dGlb + 0x130
	ldr r2, [r3, #0xf4]
	mov r1, r0
	str r2, [sp]
	ldr r2, [r3, #0xec]
	ldr r3, [r3, #0xf0]
	bl MTX_ScaleApply43
	ldr r0, _020BF3D4 ; =NNS_G3dGlb + 0x130
	ldr r1, _020BF3DC ; =NNS_G3dGlb + 0x160
	bl MTX_Inverse43
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BF3CC: .word NNS_G3dGlb + 0xBC
_020BF3D0: .word NNS_G3dGlb + 0x4C
_020BF3D4: .word NNS_G3dGlb + 0x130
_020BF3D8: .word NNS_G3dGlb
_020BF3DC: .word NNS_G3dGlb + 0x160
	arm_func_end calcSrtCameraMtx_

	arm_func_start NNS_G3dGlbGetWV
NNS_G3dGlbGetWV: ; 0x020BF3E0
	stmdb sp!, {r3, lr}
	ldr r0, _020BF410 ; =NNS_G3dGlb
	ldr r0, [r0, #0xfc]
	tst r0, #0x80
	bne _020BF408
	bl calcSrtCameraMtx_
	ldr r0, _020BF410 ; =NNS_G3dGlb
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x80
	str r1, [r0, #0xfc]
_020BF408:
	ldr r0, _020BF414 ; =NNS_G3dGlb + 0x130
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BF410: .word NNS_G3dGlb
_020BF414: .word NNS_G3dGlb + 0x130
	arm_func_end NNS_G3dGlbGetWV

	arm_func_start NNS_G3dGlbGetInvWV
NNS_G3dGlbGetInvWV: ; 0x020BF418
	stmdb sp!, {r3, lr}
	ldr r0, _020BF448 ; =NNS_G3dGlb
	ldr r0, [r0, #0xfc]
	tst r0, #0x80
	bne _020BF440
	bl calcSrtCameraMtx_
	ldr r0, _020BF448 ; =NNS_G3dGlb
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x80
	str r1, [r0, #0xfc]
_020BF440:
	ldr r0, _020BF44C ; =NNS_G3dGlb + 0x160
	ldmia sp!, {r3, pc}
	.align 2, 0
_020BF448: .word NNS_G3dGlb
_020BF44C: .word NNS_G3dGlb + 0x160
	arm_func_end NNS_G3dGlbGetInvWV

	arm_func_start NNS_G3dGlbGetInvVP
NNS_G3dGlbGetInvVP: ; 0x020BF450
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	ldr r0, _020BF4B0 ; =NNS_G3dGlb
	ldr r0, [r0, #0xfc]
	tst r0, #0x40
	bne _020BF4A4
	bl NNS_G3dGlbGetInvV
	mov r5, r0
	bl NNS_G3dGlbGetInvP
	mov r4, r0
	add r1, sp, #0
	mov r0, r5
	bl MTX_Copy43To44_
	ldr r2, _020BF4B4 ; =NNS_G3dGlb + 0x200
	add r1, sp, #0
	mov r0, r4
	bl MTX_Concat44
	ldr r0, _020BF4B0 ; =NNS_G3dGlb
	ldr r1, [r0, #0xfc]
	orr r1, r1, #0x40
	str r1, [r0, #0xfc]
_020BF4A4:
	ldr r0, _020BF4B4 ; =NNS_G3dGlb + 0x200
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BF4B0: .word NNS_G3dGlb
_020BF4B4: .word NNS_G3dGlb + 0x200
	arm_func_end NNS_G3dGlbGetInvVP

	arm_func_start NNS_G3dGlbGetViewPort
NNS_G3dGlbGetViewPort: ; 0x020BF4B8
	cmp r0, #0
	beq _020BF4D0
	ldr ip, _020BF528 ; =NNS_G3dGlb
	ldr ip, [ip, #0xa0]
	and ip, ip, #0xff
	str ip, [r0]
_020BF4D0:
	cmp r1, #0
	beq _020BF4EC
	ldr r0, _020BF528 ; =NNS_G3dGlb
	ldr r0, [r0, #0xa0]
	mov r0, r0, lsr #8
	and r0, r0, #0xff
	str r0, [r1]
_020BF4EC:
	cmp r2, #0
	beq _020BF508
	ldr r0, _020BF528 ; =NNS_G3dGlb
	ldr r0, [r0, #0xa0]
	mov r0, r0, lsr #0x10
	and r0, r0, #0xff
	str r0, [r2]
_020BF508:
	cmp r3, #0
	bxeq lr
	ldr r0, _020BF528 ; =NNS_G3dGlb
	ldr r0, [r0, #0xa0]
	mov r0, r0, lsr #0x18
	and r0, r0, #0xff
	str r0, [r3]
	bx lr
	.align 2, 0
_020BF528: .word NNS_G3dGlb
	arm_func_end NNS_G3dGlbGetViewPort

	arm_func_start NNSi_G3dAnmBlendMat
NNSi_G3dAnmBlendMat: ; 0x020BF52C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	movs r5, r1
	mov r4, r2
	mov r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r7, #1
_020BF548:
	ldrb r1, [r5, #0x19]
	cmp r4, r1
	bhs _020BF588
	add r1, r5, r4, lsl #1
	ldrh r2, [r1, #0x1a]
	and r1, r2, #0x300
	cmp r1, #0x100
	bne _020BF588
	ldr r3, [r5, #0xc]
	cmp r3, #0
	beq _020BF588
	mov r0, r6
	mov r1, r5
	and r2, r2, #0xff
	blx r3
	mov r0, r7
_020BF588:
	ldr r5, [r5, #0x10]
	cmp r5, #0
	bne _020BF548
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNSi_G3dAnmBlendMat

	arm_func_start blendScaleVec_
blendScaleVec_: ; 0x020BF598
	cmp r3, #0
	beq _020BF5C8
	ldr r1, [r0]
	add r1, r1, r2
	str r1, [r0]
	ldr r1, [r0, #4]
	add r1, r1, r2
	str r1, [r0, #4]
	ldr r1, [r0, #8]
	add r1, r1, r2
	str r1, [r0, #8]
	bx lr
_020BF5C8:
	ldr r3, [r1]
	ldr ip, [r0]
	mul r3, r2, r3
	add r3, ip, r3, asr #12
	str r3, [r0]
	ldr r3, [r1, #4]
	ldr ip, [r0, #4]
	mul r3, r2, r3
	add r3, ip, r3, asr #12
	str r3, [r0, #4]
	ldr r1, [r1, #8]
	ldr r3, [r0, #8]
	mul r1, r2, r1
	add r1, r3, r1, asr #12
	str r1, [r0, #8]
	bx lr
	arm_func_end blendScaleVec_

	arm_func_start NNSi_G3dAnmBlendJnt
NNSi_G3dAnmBlendJnt: ; 0x020BF608
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x70
	movs sb, r1
	mov sl, r0
	mov r8, r2
	addeq sp, sp, #0x70
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [sb, #0x10]
	cmp r2, #0
	bne _020BF694
	ldrb r2, [sb, #0x19]
	cmp r8, r2
	bhs _020BF688
	add r2, sb, r8, lsl #1
	ldrh r4, [r2, #0x1a]
	and r2, r4, #0x300
	cmp r2, #0x100
	bne _020BF67C
	ldr r3, [sb, #0xc]
	cmp r3, #0
	addeq sp, sp, #0x70
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	and r2, r4, #0xff
	blx r3
	add sp, sp, #0x70
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BF67C:
	add sp, sp, #0x70
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BF688:
	add sp, sp, #0x70
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BF694:
	mov r5, #0
	mov r3, r5
	mov r6, r5
	mov r2, sb
_020BF6A4:
	ldrb r0, [r2, #0x19]
	cmp r8, r0
	bhs _020BF6E4
	add r0, r2, r8, lsl #1
	ldrh r0, [r0, #0x1a]
	and r0, r0, #0x300
	cmp r0, #0x100
	bne _020BF6E4
	ldr r0, [r2, #4]
	cmp r0, #0x1000
	addgt r5, r5, #0x1000
	bgt _020BF6DC
	cmp r0, #0
	addgt r5, r5, r0
_020BF6DC:
	mov r1, r2
	add r3, r3, #1
_020BF6E4:
	ldr r2, [r2, #0x10]
	cmp r2, #0
	bne _020BF6A4
	cmp r5, #0
	addeq sp, sp, #0x70
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r3, #1
	bne _020BF73C
	ldr r3, [r1, #0xc]
	add r0, r1, r8, lsl #1
	cmp r3, #0
	ldrh r2, [r0, #0x1a]
	addeq sp, sp, #0x70
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sl
	and r2, r2, #0xff
	blx r3
	add sp, sp, #0x70
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020BF73C:
	mov r1, sl
	mov r0, #0
	mov r2, #0x58
	bl MIi_CpuClearFast
	mvn r0, #0
	str r0, [sl]
	add fp, sp, #0x40
	add r4, sp, #0x18
_020BF75C:
	ldrb r0, [sb, #0x19]
	cmp r8, r0
	bhs _020BF940
	add r0, sb, r8, lsl #1
	ldrh r1, [r0, #0x1a]
	and r0, r1, #0x300
	cmp r0, #0x100
	bne _020BF940
	ldr r0, [sb, #4]
	cmp r0, #0
	ble _020BF940
	ldr r3, [sb, #0xc]
	cmp r3, #0
	beq _020BF940
	and r2, r1, #0xff
	mov r0, r4
	mov r1, sb
	blx r3
	cmp r6, #0
	bne _020BF7CC
	mov r0, fp
	add r1, sp, #0xc
	mov r2, #0xc
	bl MIi_CpuCopy32
	add r0, sp, #0x58
	add r1, sp, #0
	mov r2, #0xc
	bl MIi_CpuCopy32
_020BF7CC:
	cmp r5, #0x1000
	ldreq r7, [sb, #4]
	beq _020BF7E8
	ldr r0, [sb, #4]
	mov r1, r5
	bl FX_Div
	mov r7, r0
_020BF7E8:
	ldr r3, [sp, #0x18]
	add r0, sl, #4
	add r1, sp, #0x1c
	mov r2, r7
	and r3, r3, #1
	bl blendScaleVec_
	ldr r3, [sp, #0x18]
	add r0, sl, #0x10
	add r1, sp, #0x28
	mov r2, r7
	and r3, r3, #8
	bl blendScaleVec_
	ldr r3, [sp, #0x18]
	add r0, sl, #0x1c
	add r1, sp, #0x34
	mov r2, r7
	and r3, r3, #0x10
	bl blendScaleVec_
	ldr r0, [sp, #0x18]
	tst r0, #4
	bne _020BF890
	ldr r2, [sl, #0x4c]
	ldr r0, [sp, #0x64]
	smull r1, r0, r7, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	add r0, r2, r1
	str r0, [sl, #0x4c]
	ldr r2, [sl, #0x50]
	ldr r0, [sp, #0x68]
	smull r1, r0, r7, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	add r0, r2, r1
	str r0, [sl, #0x50]
	ldr r2, [sl, #0x54]
	ldr r0, [sp, #0x6c]
	smull r1, r0, r7, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	add r0, r2, r1
	str r0, [sl, #0x54]
_020BF890:
	ldr r0, [sp, #0x18]
	tst r0, #2
	bne _020BF918
	ldr r1, [sl, #0x28]
	ldr r0, [sp, #0x40]
	mul r0, r7, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x28]
	ldr r1, [sl, #0x2c]
	ldr r0, [sp, #0x44]
	mul r0, r7, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x2c]
	ldr r1, [sl, #0x30]
	ldr r0, [sp, #0x48]
	mul r0, r7, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x30]
	ldr r1, [sl, #0x34]
	ldr r0, [sp, #0x4c]
	mul r0, r7, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x34]
	ldr r1, [sl, #0x38]
	ldr r0, [sp, #0x50]
	mul r0, r7, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x38]
	ldr r1, [sl, #0x3c]
	ldr r0, [sp, #0x54]
	mul r0, r7, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x3c]
	b _020BF930
_020BF918:
	ldr r0, [sl, #0x28]
	add r0, r0, r7
	str r0, [sl, #0x28]
	ldr r0, [sl, #0x38]
	add r0, r0, r7
	str r0, [sl, #0x38]
_020BF930:
	ldr r1, [sl]
	ldr r0, [sp, #0x18]
	and r0, r1, r0
	str r0, [sl]
_020BF940:
	ldr sb, [sb, #0x10]
	add r6, r6, #1
	cmp sb, #0
	bne _020BF75C
	add r0, sl, #0x28
	add r1, sl, #0x34
	add r2, sl, #0x40
	bl VEC_CrossProduct
	ldr r0, [sl, #0x28]
	cmp r0, #0
	ldreq r0, [sl, #0x2c]
	cmpeq r0, #0
	ldreq r0, [sl, #0x30]
	cmpeq r0, #0
	bne _020BF990
	add r0, sp, #0xc
	add r1, sl, #0x28
	mov r2, #0xc
	bl MIi_CpuCopy32
	b _020BF99C
_020BF990:
	add r0, sl, #0x28
	mov r1, r0
	bl VEC_Normalize
_020BF99C:
	ldr r0, [sl, #0x40]
	cmp r0, #0
	ldreq r0, [sl, #0x44]
	cmpeq r0, #0
	ldreq r0, [sl, #0x48]
	cmpeq r0, #0
	bne _020BF9CC
	add r0, sp, #0
	add r1, sl, #0x40
	mov r2, #0xc
	bl MIi_CpuCopy32
	b _020BF9D8
_020BF9CC:
	add r0, sl, #0x40
	mov r1, r0
	bl VEC_Normalize
_020BF9D8:
	add r0, sl, #0x40
	add r1, sl, #0x28
	add r2, sl, #0x34
	bl VEC_CrossProduct
	mov r0, #1
	add sp, sp, #0x70
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end NNSi_G3dAnmBlendJnt

	arm_func_start NNSi_G3dAnmBlendVis
NNSi_G3dAnmBlendVis: ; 0x020BF9F4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r7, r0
	mov r0, #0
	mov r6, r1
	mov r5, r2
	str r0, [r7]
	add r4, sp, #0
	mov r8, #1
_020BFA18:
	ldrb r1, [r6, #0x19]
	cmp r5, r1
	bhs _020BFA68
	add r1, r6, r5, lsl #1
	ldrh r2, [r1, #0x1a]
	and r1, r2, #0x300
	cmp r1, #0x100
	bne _020BFA68
	ldr r3, [r6, #0xc]
	cmp r3, #0
	beq _020BFA68
	mov r0, r4
	mov r1, r6
	and r2, r2, #0xff
	blx r3
	ldr r2, [r7]
	ldr r1, [sp]
	mov r0, r8
	orr r1, r2, r1
	str r1, [r7]
_020BFA68:
	ldr r6, [r6, #0x10]
	cmp r6, #0
	bne _020BFA18
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end NNSi_G3dAnmBlendVis

	arm_func_start G3dDrawInternal_Loop_
G3dDrawInternal_Loop_: ; 0x020BFA7C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r5, _020BFAC0 ; =_02110B9C
	mov r4, r0
_020BFA88:
	ldr r1, [r4, #8]
	mov r0, r4
	bic r1, r1, #0x40
	str r1, [r4, #8]
	ldr r1, [r4]
	ldrb r3, [r1]
	and r1, r3, #0x1f
	ldr r2, [r5, r1, lsl #2]
	and r1, r3, #0xe0
	blx r2
	ldr r0, [r4, #8]
	tst r0, #0x20
	beq _020BFA88
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BFAC0: .word _02110B9C
	arm_func_end G3dDrawInternal_Loop_

	arm_func_start G3dDrawInternal_
G3dDrawInternal_: ; 0x020BFAC4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r1, r5
	mov r0, #0
	mov r2, #0x188
	bl MIi_CpuClearFast
	mov r0, #1
	str r0, [r5, #0xc4]
	str r0, [r5, #8]
	ldr r0, [r4, #0x30]
	ldr r2, _020BFC54 ; =_02110A80
	cmp r0, #0
	ldreq r1, [r4, #4]
	ldreq r0, [r1, #4]
	addeq r0, r1, r0
	str r0, [r5]
	str r4, [r5, #4]
	ldr r0, [r4, #4]
	cmp r0, #0
	addne r0, r0, #0x40
	moveq r0, #0
	str r0, [r5, #0xd4]
	ldr r1, [r4, #4]
	cmp r1, #0
	ldrne r0, [r1, #8]
	cmpne r0, #0
	addne r0, r1, r0
	moveq r0, #0
	str r0, [r5, #0xd8]
	ldr r1, [r4, #4]
	cmp r1, #0
	ldrne r0, [r1, #0xc]
	cmpne r0, #0
	addne r0, r1, r0
	moveq r0, #0
	str r0, [r5, #0xdc]
	ldr r0, [r4, #4]
	ldr r1, _020BFC58 ; =_02110A74
	ldrb r3, [r0, #0x15]
	ldr r0, _020BFC5C ; =_02110A8C
	ldr r2, [r2, r3, lsl #2]
	str r2, [r5, #0xe8]
	ldr r2, [r4, #4]
	ldrb r2, [r2, #0x15]
	ldr r1, [r1, r2, lsl #2]
	str r1, [r5, #0xec]
	ldr r1, [r4, #4]
	ldrb r1, [r1, #0x16]
	ldr r0, [r0, r1, lsl #2]
	str r0, [r5, #0xf0]
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x1c]
	str r0, [r5, #0xe0]
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x20]
	str r0, [r5, #0xe4]
	ldr r1, [r4, #0x20]
	cmp r1, #0
	beq _020BFBD8
	ldrb r0, [r4, #0x24]
	cmp r0, #0x20
	bhs _020BFBD8
	add r0, r5, r0, lsl #2
	str r1, [r0, #0xc]
	ldrb r0, [r4, #0x24]
	ldrb r1, [r4, #0x25]
	add r0, r5, r0
	strb r1, [r0, #0x8c]
_020BFBD8:
	ldr r0, [r4]
	tst r0, #1
	ldrne r0, [r5, #8]
	orrne r0, r0, #0x80
	strne r0, [r5, #8]
	ldr r0, [r4]
	tst r0, #2
	ldrne r0, [r5, #8]
	orrne r0, r0, #0x100
	strne r0, [r5, #8]
	ldr r0, [r4]
	tst r0, #4
	ldrne r0, [r5, #8]
	orrne r0, r0, #0x200
	strne r0, [r5, #8]
	ldr r0, [r4]
	tst r0, #8
	ldrne r0, [r5, #8]
	orrne r0, r0, #0x400
	strne r0, [r5, #8]
	ldr r1, [r4, #0x28]
	cmp r1, #0
	beq _020BFC3C
	mov r0, r5
	blx r1
_020BFC3C:
	mov r0, r5
	bl G3dDrawInternal_Loop_
	ldr r0, [r4]
	bic r0, r0, #1
	str r0, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020BFC54: .word _02110A80
_020BFC58: .word _02110A74
_020BFC5C: .word _02110A8C
	arm_func_end G3dDrawInternal_

	arm_func_start updateHintVec___g3d
updateHintVec___g3d: ; 0x020BFC60
	stmdb sp!, {r3, r4, r5, lr}
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r3, #1
	mov r4, #0
_020BFC74:
	ldrb r2, [r1, #0x19]
	mov r5, r4
	cmp r2, #0
	ble _020BFCB8
_020BFC84:
	add r2, r1, r5, lsl #1
	ldrh r2, [r2, #0x1a]
	tst r2, #0x100
	beq _020BFCA8
	mov lr, r5, asr #5
	ldr ip, [r0, lr, lsl #2]
	and r2, r5, #0x1f
	orr r2, ip, r3, lsl r2
	str r2, [r0, lr, lsl #2]
_020BFCA8:
	ldrb r2, [r1, #0x19]
	add r5, r5, #1
	cmp r5, r2
	blt _020BFC84
_020BFCB8:
	ldr r1, [r1, #0x10]
	cmp r1, #0
	bne _020BFC74
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end updateHintVec___g3d

	arm_func_start NNS_G3dDraw
NNS_G3dDraw: ; 0x020BFCC8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x188
	mov r4, r0
	ldr r0, [r4]
	and r0, r0, #0x10
	cmp r0, #0x10
	bne _020BFD5C
	add r1, r4, #0x3c
	mov r0, #0
	mov r2, #8
	bl MIi_CpuClear32
	add r1, r4, #0x44
	mov r0, #0
	mov r2, #8
	bl MIi_CpuClear32
	add r1, r4, #0x4c
	mov r0, #0
	mov r2, #8
	bl MIi_CpuClear32
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _020BFD28
	add r0, r4, #0x3c
	bl updateHintVec___g3d
_020BFD28:
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _020BFD3C
	add r0, r4, #0x44
	bl updateHintVec___g3d
_020BFD3C:
	ldr r1, [r4, #0x18]
	cmp r1, #0
	beq _020BFD50
	add r0, r4, #0x4c
	bl updateHintVec___g3d
_020BFD50:
	ldr r0, [r4]
	bic r0, r0, #0x10
	str r0, [r4]
_020BFD5C:
	ldr r2, _020BFDA0 ; =_021DA700
	ldr r0, [r2]
	cmp r0, #0
	beq _020BFD7C
	mov r1, r4
	bl G3dDrawInternal_
	add sp, sp, #0x188
	ldmia sp!, {r4, pc}
_020BFD7C:
	add r0, sp, #0
	mov r1, r4
	str r0, [r2]
	bl G3dDrawInternal_
	ldr r0, _020BFDA0 ; =_021DA700
	mov r1, #0
	str r1, [r0]
	add sp, sp, #0x188
	ldmia sp!, {r4, pc}
	.align 2, 0
_020BFDA0: .word _021DA700
	arm_func_end NNS_G3dDraw

	arm_func_start NNSi_G3dFuncSbc_NOP
NNSi_G3dFuncSbc_NOP: ; 0x020BFDA4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	beq _020BFDBC
	blx r1
_020BFDBC:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end NNSi_G3dFuncSbc_NOP

	arm_func_start NNSi_G3dFuncSbc_RET
NNSi_G3dFuncSbc_RET: ; 0x020BFDCC
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x10]
	cmp r1, #0
	beq _020BFDE4
	blx r1
_020BFDE4:
	ldr r0, [r4, #8]
	orr r0, r0, #0x20
	str r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end NNSi_G3dFuncSbc_RET

	arm_func_start NNSi_G3dFuncSbc_NODE
NNSi_G3dFuncSbc_NODE: ; 0x020BFDF4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, [r6, #8]
	tst r0, #0x200
	bne _020BFF60
	ldr r1, [r6]
	add r0, r6, #0x184
	ldrb r4, [r1, #1]
	strb r4, [r6, #0xac]
	ldr r1, [r6, #8]
	orr r1, r1, #4
	str r1, [r6, #8]
	str r0, [r6, #0xb8]
	ldr r0, [r6, #0x14]
	cmp r0, #0
	ldrneb r5, [r6, #0x8e]
	moveq r5, #0
	cmp r5, #1
	bne _020BFE74
	ldr r1, [r6, #8]
	mov r0, r6
	bic r1, r1, #0x40
	str r1, [r6, #8]
	ldr r1, [r6, #0x14]
	blx r1
	ldr r0, [r6, #0x14]
	cmp r0, #0
	ldrneb r5, [r6, #0x8e]
	ldr r0, [r6, #8]
	moveq r5, #0
	and r0, r0, #0x40
	b _020BFE78
_020BFE74:
	mov r0, #0
_020BFE78:
	cmp r0, #0
	bne _020BFED8
	ldr ip, [r6, #4]
	ldr r1, [ip, #0x18]
	cmp r1, #0
	beq _020BFEC4
	mov r0, r4, lsr #5
	add r0, ip, r0, lsl #2
	ldr r0, [r0, #0x4c]
	and r2, r4, #0x1f
	mov r3, #1
	tst r0, r3, lsl r2
	beq _020BFEC4
	ldr r0, [r6, #0xb8]
	ldr r3, [ip, #0x1c]
	mov r2, r4
	blx r3
	cmp r0, #0
	bne _020BFED8
_020BFEC4:
	ldr r1, [r6]
	ldr r0, [r6, #0xb8]
	ldrb r1, [r1, #2]
	and r1, r1, #1
	str r1, [r0]
_020BFED8:
	cmp r5, #2
	bne _020BFF14
	ldr r1, [r6, #8]
	mov r0, r6
	bic r1, r1, #0x40
	str r1, [r6, #8]
	ldr r1, [r6, #0x14]
	blx r1
	ldr r0, [r6, #0x14]
	cmp r0, #0
	ldrneb r5, [r6, #0x8e]
	ldr r0, [r6, #8]
	moveq r5, #0
	and r0, r0, #0x40
	b _020BFF18
_020BFF14:
	mov r0, #0
_020BFF18:
	cmp r0, #0
	bne _020BFF40
	ldr r0, [r6, #0xb8]
	ldr r0, [r0]
	cmp r0, #0
	ldr r0, [r6, #8]
	orrne r0, r0, #1
	strne r0, [r6, #8]
	biceq r0, r0, #1
	streq r0, [r6, #8]
_020BFF40:
	cmp r5, #3
	bne _020BFF60
	ldr r1, [r6, #8]
	mov r0, r6
	bic r1, r1, #0x40
	str r1, [r6, #8]
	ldr r1, [r6, #0x14]
	blx r1
_020BFF60:
	ldr r0, [r6]
	add r0, r0, #3
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNSi_G3dFuncSbc_NODE

	arm_func_start NNSi_G3dFuncSbc_MTX
NNSi_G3dFuncSbc_MTX: ; 0x020BFF70
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	tst r0, #0x200
	bne _020C002C
	tst r0, #1
	beq _020C002C
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ldrneb r5, [r4, #0x8f]
	moveq r5, #0
	cmp r5, #1
	bne _020BFFD8
	ldr r1, [r4, #8]
	mov r0, r4
	bic r1, r1, #0x40
	str r1, [r4, #8]
	ldr r1, [r4, #0x18]
	blx r1
	ldr r0, [r4, #0x18]
	cmp r0, #0
	ldrneb r5, [r4, #0x8f]
	ldr r0, [r4, #8]
	moveq r5, #0
	and r0, r0, #0x40
	b _020BFFDC
_020BFFD8:
	mov r0, #0
_020BFFDC:
	cmp r0, #0
	bne _020C000C
	ldr r0, [r4]
	ldrb r0, [r0, #1]
	str r0, [sp]
	ldr r0, [r4, #8]
	tst r0, #0x100
	bne _020C000C
	add r1, sp, #0
	mov r0, #0x14
	mov r2, #1
	bl NNS_G3dGeBufferOP_N
_020C000C:
	cmp r5, #3
	bne _020C002C
	ldr r1, [r4, #8]
	mov r0, r4
	bic r1, r1, #0x40
	str r1, [r4, #8]
	ldr r1, [r4, #0x18]
	blx r1
_020C002C:
	ldr r0, [r4]
	add r0, r0, #2
	str r0, [r4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNSi_G3dFuncSbc_MTX

	arm_func_start NNSi_G3dFuncSbc_MAT_InternalDefault
NNSi_G3dFuncSbc_MAT_InternalDefault: ; 0x020C003C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x1c
	mov r7, r0
	mov r5, r3
	strb r5, [r7, #0xad]
	ldr r3, [r7, #8]
	add r0, r7, #0xf4
	orr r3, r3, #8
	str r3, [r7, #8]
	str r0, [r7, #0xb0]
	ldr r0, [r7, #0x1c]
	mov r8, r1
	cmp r0, #0
	ldrneb r4, [r7, #0x90]
	mov r6, r2
	moveq r4, #0
	cmp r4, #1
	bne _020C00B8
	ldr r1, [r7, #8]
	mov r0, r7
	bic r1, r1, #0x40
	str r1, [r7, #8]
	ldr r1, [r7, #0x1c]
	blx r1
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	ldrneb r4, [r7, #0x90]
	ldr r0, [r7, #8]
	moveq r4, #0
	and r0, r0, #0x40
	b _020C00BC
_020C00B8:
	mov r0, #0
_020C00BC:
	cmp r0, #0
	bne _020C039C
	ldr r0, [r7, #4]
	ldr r0, [r0, #0x38]
	cmp r0, #0
	beq _020C00E8
	ldr r1, [r7, #8]
	tst r1, #0x80
	moveq r1, #0x38
	mlaeq r8, r5, r1, r0
	beq _020C0398
_020C00E8:
	cmp r8, #0x20
	cmpne r8, #0x40
	bne _020C0130
	mov r1, r5, lsr #5
	add r1, r7, r1, lsl #2
	ldr r1, [r1, #0xbc]
	and r2, r5, #0x1f
	mov r3, #1
	tst r1, r3, lsl r2
	beq _020C0130
	cmp r0, #0
	movne r1, #0x38
	mlane r8, r5, r1, r0
	bne _020C0398
	ldr r1, _020C04B0 ; =_021DA704
	mov r0, #0x38
	mla r8, r5, r0, r1
	b _020C0398
_020C0130:
	cmp r0, #0
	beq _020C0168
	add r8, r7, #0xbc
	mov r3, r5, lsr #5
	ldr r2, [r8, r3, lsl #2]
	and r0, r5, #0x1f
	mov r1, #1
	orr r0, r2, r1, lsl r0
	str r0, [r8, r3, lsl #2]
	ldr r1, [r7, #4]
	mov r0, #0x38
	ldr r1, [r1, #0x38]
	mla r8, r5, r0, r1
	b _020C019C
_020C0168:
	cmp r8, #0x40
	addne r8, r7, #0xf4
	bne _020C019C
	add lr, r7, #0xbc
	mov ip, r5, lsr #5
	ldr r1, _020C04B0 ; =_021DA704
	ldr r8, [lr, ip, lsl #2]
	mov r0, #0x38
	and r2, r5, #0x1f
	mov r3, #1
	orr r2, r8, r3, lsl r2
	mla r8, r5, r0, r1
	str r2, [lr, ip, lsl #2]
_020C019C:
	mov r0, #0
	str r0, [r8]
	ldr r3, [r7, #0xd8]
	cmp r3, #0
	beq _020C01F0
	adds r2, r3, #4
	beq _020C01DC
	ldrb r0, [r3, #5]
	cmp r5, r0
	bhs _020C01DC
	ldrh r1, [r3, #0xa]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	add r1, r1, #4
	mla r1, r0, r5, r1
	b _020C01E0
_020C01DC:
	mov r1, #0
_020C01E0:
	cmp r1, #0
	ldrne r0, [r1]
	addne r0, r3, r0
	bne _020C01F4
_020C01F0:
	mov r0, #0
_020C01F4:
	ldrh r0, [r0, #0x1e]
	ldr r1, _020C04B4 ; =NNS_G3dGlb
	tst r0, #0x20
	ldrne r0, [r8]
	orrne r0, r0, #0x20
	strne r0, [r8]
	ldrh r2, [r6, #0x1e]
	ldr r0, _020C04B8 ; =_02109474
	ldr ip, [r1, #0x94]
	mov r2, r2, asr #6
	and r2, r2, #7
	ldr lr, [r0, r2, lsl #2]
	ldr r2, [r6, #4]
	mvn r3, lr
	and r3, ip, r3
	and r2, r2, lr
	orr r2, r3, r2
	str r2, [r8, #4]
	ldrh ip, [r6, #0x1e]
	ldr r3, [r1, #0x98]
	ldr r2, [r6, #8]
	mov ip, ip, asr #9
	and ip, ip, #7
	ldr ip, [r0, ip, lsl #2]
	mvn r0, ip
	and r3, r3, r0
	and r0, r2, ip
	orr r0, r3, r0
	str r0, [r8, #8]
	ldr r3, [r6, #0x10]
	ldr r0, [r6, #0xc]
	ldr r2, [r1, #0x9c]
	mvn r1, r3
	and r1, r2, r1
	and r0, r0, r3
	orr r0, r1, r0
	str r0, [r8, #0xc]
	ldr r0, [r6, #0x14]
	str r0, [r8, #0x10]
	ldrh r0, [r6, #0x1c]
	str r0, [r8, #0x14]
	ldrh r0, [r6, #0x1e]
	tst r0, #1
	beq _020C0330
	tst r0, #2
	ldrne r1, [r8]
	add r0, r6, #0x2c
	orrne r1, r1, #1
	strne r1, [r8]
	bne _020C02D0
	ldr r1, [r0]
	str r1, [r8, #0x18]
	ldr r1, [r0, #4]
	add r0, r0, #8
	str r1, [r8, #0x1c]
_020C02D0:
	ldrh r1, [r6, #0x1e]
	tst r1, #4
	ldrne r1, [r8]
	orrne r1, r1, #2
	strne r1, [r8]
	bne _020C02FC
	ldrsh r1, [r0]
	strh r1, [r8, #0x20]
	ldrsh r1, [r0, #2]
	add r0, r0, #4
	strh r1, [r8, #0x22]
_020C02FC:
	ldrh r1, [r6, #0x1e]
	tst r1, #8
	ldrne r0, [r8]
	orrne r0, r0, #4
	strne r0, [r8]
	bne _020C0324
	ldr r1, [r0]
	str r1, [r8, #0x24]
	ldr r0, [r0, #4]
	str r0, [r8, #0x28]
_020C0324:
	ldr r0, [r8]
	orr r0, r0, #8
	str r0, [r8]
_020C0330:
	ldr ip, [r7, #4]
	ldr r1, [ip, #8]
	cmp r1, #0
	beq _020C036C
	mov r0, r5, lsr #5
	add r0, ip, r0, lsl #2
	ldr r0, [r0, #0x3c]
	and r2, r5, #0x1f
	mov r3, #1
	tst r0, r3, lsl r2
	beq _020C036C
	ldr r3, [ip, #0xc]
	mov r0, r8
	mov r2, r5
	blx r3
_020C036C:
	ldr r0, [r8]
	tst r0, #0x18
	beq _020C0398
	ldrh r0, [r6, #0x20]
	strh r0, [r8, #0x2c]
	ldrh r0, [r6, #0x22]
	strh r0, [r8, #0x2e]
	ldr r0, [r6, #0x24]
	str r0, [r8, #0x30]
	ldr r0, [r6, #0x28]
	str r0, [r8, #0x34]
_020C0398:
	str r8, [r7, #0xb0]
_020C039C:
	cmp r4, #2
	bne _020C03D8
	ldr r1, [r7, #8]
	mov r0, r7
	bic r1, r1, #0x40
	str r1, [r7, #8]
	ldr r1, [r7, #0x1c]
	blx r1
	ldr r0, [r7, #0x1c]
	cmp r0, #0
	ldrneb r4, [r7, #0x90]
	ldr r0, [r7, #8]
	moveq r4, #0
	and r0, r0, #0x40
	b _020C03DC
_020C03D8:
	mov r0, #0
_020C03DC:
	cmp r0, #0
	bne _020C0484
	ldr r5, [r7, #0xb0]
	ldr r1, [r5, #0xc]
	tst r1, #0x1f0000
	beq _020C0478
	ldr r0, [r5]
	tst r0, #0x20
	bicne r0, r1, #0x1f0000
	strne r0, [r5, #0xc]
	ldr r0, [r7, #8]
	bic r0, r0, #2
	str r0, [r7, #8]
	tst r0, #0x100
	bne _020C0484
	ldr r0, _020C04BC ; =0x00293130
	ldr r3, _020C04C0 ; =0x00002B2A
	str r0, [sp]
	ldr r2, [r5, #4]
	add r1, sp, #4
	str r2, [sp, #4]
	ldr r6, [r5, #8]
	mov r2, #6
	str r6, [sp, #8]
	ldr r6, [r5, #0xc]
	str r6, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r3, [r5, #0x10]
	str r3, [sp, #0x14]
	ldr r3, [r5, #0x14]
	str r3, [sp, #0x18]
	bl NNS_G3dGeBufferOP_N
	ldr r0, [r5]
	tst r0, #0x18
	beq _020C0484
	ldr r1, [r7, #0xf0]
	mov r0, r5
	blx r1
	b _020C0484
_020C0478:
	ldr r0, [r7, #8]
	orr r0, r0, #2
	str r0, [r7, #8]
_020C0484:
	cmp r4, #3
	addne sp, sp, #0x1c
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r1, [r7, #8]
	mov r0, r7
	bic r1, r1, #0x40
	str r1, [r7, #8]
	ldr r1, [r7, #0x1c]
	blx r1
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020C04B0: .word _021DA704
_020C04B4: .word NNS_G3dGlb
_020C04B8: .word _02109474
_020C04BC: .word 0x00293130
_020C04C0: .word 0x00002B2A
	arm_func_end NNSi_G3dFuncSbc_MAT_InternalDefault

	arm_func_start NNSi_G3dFuncSbc_MAT
NNSi_G3dFuncSbc_MAT: ; 0x020C04C4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r2, [r4, #8]
	tst r2, #0x200
	bne _020C0560
	ldr r0, [r4]
	tst r2, #1
	ldrb r3, [r0, #1]
	bne _020C04FC
	tst r2, #8
	beq _020C04FC
	ldrb r0, [r4, #0xad]
	cmp r3, r0
	beq _020C0560
_020C04FC:
	ldr lr, [r4, #0xd8]
	cmp lr, #0
	beq _020C0548
	adds ip, lr, #4
	beq _020C0534
	ldrb r0, [lr, #5]
	cmp r3, r0
	bhs _020C0534
	ldrh r2, [lr, #0xa]
	ldrh r0, [ip, r2]
	add r2, ip, r2
	add r2, r2, #4
	mla r2, r0, r3, r2
	b _020C0538
_020C0534:
	mov r2, #0
_020C0538:
	cmp r2, #0
	ldrne r0, [r2]
	addne r2, lr, r0
	bne _020C054C
_020C0548:
	mov r2, #0
_020C054C:
	ldrh lr, [r2]
	ldr ip, _020C0570 ; =_02110AAC
	mov r0, r4
	ldr ip, [ip, lr, lsl #2]
	blx ip
_020C0560:
	ldr r0, [r4]
	add r0, r0, #2
	str r0, [r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C0570: .word _02110AAC
	arm_func_end NNSi_G3dFuncSbc_MAT

	arm_func_start NNSi_G3dFuncSbc_SHP_InternalDefault
NNSi_G3dFuncSbc_SHP_InternalDefault: ; 0x020C0574
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r0, [r5, #0x20]
	mov r4, r2
	cmp r0, #0
	ldrneb r6, [r5, #0x91]
	moveq r6, #0
	cmp r6, #1
	bne _020C05CC
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x20]
	blx r1
	ldr r0, [r5, #0x20]
	cmp r0, #0
	ldrneb r6, [r5, #0x91]
	ldr r0, [r5, #8]
	moveq r6, #0
	and r0, r0, #0x40
	b _020C05D0
_020C05CC:
	mov r0, #0
_020C05D0:
	cmp r0, #0
	bne _020C05F4
	ldr r0, [r5, #8]
	tst r0, #0x100
	bne _020C05F4
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r0, r4, r0
	bl NNS_G3dGeSendDL
_020C05F4:
	cmp r6, #2
	bne _020C0624
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x20]
	blx r1
	ldr r0, [r5, #0x20]
	cmp r0, #0
	ldrneb r6, [r5, #0x91]
	moveq r6, #0
_020C0624:
	cmp r6, #3
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x20]
	blx r1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNSi_G3dFuncSbc_SHP_InternalDefault

	arm_func_start NNSi_G3dFuncSbc_SHP
NNSi_G3dFuncSbc_SHP: ; 0x020C0648
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	tst r0, #0x200
	bne _020C06D4
	tst r0, #1
	beq _020C06D4
	tst r0, #2
	bne _020C06D4
	ldr r0, [r4]
	ldr ip, [r4, #0xdc]
	ldrb r3, [r0, #1]
	cmp ip, #0
	beq _020C06BC
	beq _020C06A8
	ldrb r0, [ip, #1]
	cmp r3, r0
	bhs _020C06A8
	ldrh r2, [ip, #6]
	ldrh r0, [ip, r2]
	add r2, ip, r2
	add r2, r2, #4
	mla r2, r0, r3, r2
	b _020C06AC
_020C06A8:
	mov r2, #0
_020C06AC:
	cmp r2, #0
	ldrne r0, [r2]
	addne r2, ip, r0
	bne _020C06C0
_020C06BC:
	mov r2, #0
_020C06C0:
	ldrh lr, [r2]
	ldr ip, _020C06E4 ; =_02110ABC
	mov r0, r4
	ldr ip, [ip, lr, lsl #2]
	blx ip
_020C06D4:
	ldr r0, [r4]
	add r0, r0, #2
	str r0, [r4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C06E4: .word _02110ABC
	arm_func_end NNSi_G3dFuncSbc_SHP

	arm_func_start NNSi_G3dFuncSbc_NODEDESC
NNSi_G3dFuncSbc_NODEDESC: ; 0x020C06E8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov sl, r0
	ldr r0, [sl]
	mov sb, r1
	ldrb r6, [r0, #1]
	mov r4, #4
	strb r6, [sl, #0xae]
	ldr r0, [sl, #8]
	orr r0, r0, #0x10
	str r0, [sl, #8]
	tst r0, #0x400
	beq _020C0770
	cmp sb, #0x40
	cmpne sb, #0x60
	addeq r4, r4, #1
	cmp sb, #0x20
	cmpne sb, #0x60
	bne _020C075C
	tst r0, #0x100
	add r4, r4, #1
	bne _020C075C
	ldr r0, [sl]
	add r1, sp, #0x10
	ldrb r3, [r0, #4]
	mov r0, #0x14
	mov r2, #1
	str r3, [sp, #0x10]
	bl NNS_G3dGeBufferOP_N
_020C075C:
	ldr r0, [sl]
	add sp, sp, #0x14
	add r0, r0, r4
	str r0, [sl]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C0770:
	cmp sb, #0x40
	cmpne sb, #0x60
	bne _020C07B4
	ldr r0, [sl]
	cmp sb, #0x40
	ldreqb r0, [r0, #4]
	add r4, r4, #1
	streq r0, [sp, #0xc]
	ldrneb r0, [r0, #5]
	strne r0, [sp, #0xc]
	ldr r0, [sl, #8]
	tst r0, #0x100
	bne _020C07B4
	add r1, sp, #0xc
	mov r0, #0x14
	mov r2, #1
	bl NNS_G3dGeBufferOP_N
_020C07B4:
	add r0, sl, #0x12c
	str r0, [sl, #0xb4]
	ldr r0, [sl, #0x24]
	cmp r0, #0
	ldrneb r8, [sl, #0x92]
	moveq r8, #0
	cmp r8, #1
	bne _020C0808
	ldr r1, [sl, #8]
	mov r0, sl
	bic r1, r1, #0x40
	str r1, [sl, #8]
	ldr r1, [sl, #0x24]
	blx r1
	ldr r0, [sl, #0x24]
	cmp r0, #0
	ldrneb r8, [sl, #0x92]
	ldr r0, [sl, #8]
	moveq r8, #0
	and r0, r0, #0x40
	b _020C080C
_020C0808:
	mov r0, #0
_020C080C:
	cmp r0, #0
	bne _020C0A54
	ldr r0, [sl, #4]
	ldr r1, [r0, #0x34]
	cmp r1, #0
	beq _020C0840
	mov r0, #0x58
	mla r5, r6, r0, r1
	ldr r0, [sl, #8]
	tst r0, #0x80
	moveq r0, #1
	movne r0, #0
	b _020C0848
_020C0840:
	add r5, sl, #0x12c
	mov r0, #0
_020C0848:
	cmp r0, #0
	bne _020C0A50
	mov r0, #0
	str r0, [r5]
	ldr r0, [sl, #4]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _020C0880
	ldr r3, [r0, #0x14]
	mov r0, r5
	mov r2, r6
	blx r3
	cmp r0, #0
	bne _020C0A50
_020C0880:
	ldr r2, [sl, #0xd4]
	cmp r2, #0
	beq _020C08C8
	beq _020C08B4
	ldrb r0, [r2, #1]
	cmp r6, r0
	bhs _020C08B4
	ldrh r1, [r2, #6]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	add r1, r1, #4
	mla r1, r0, r6, r1
	b _020C08B8
_020C08B4:
	mov r1, #0
_020C08B8:
	cmp r1, #0
	ldrne r0, [r1]
	addne r7, r2, r0
	bne _020C08CC
_020C08C8:
	mov r7, #0
_020C08CC:
	ldrh r0, [r7]
	add r6, r7, #4
	tst r0, #1
	beq _020C08EC
	ldr r0, [r5]
	orr r0, r0, #4
	str r0, [r5]
	b _020C0908
_020C08EC:
	ldr r0, [r6]
	str r0, [r5, #0x4c]
	ldr r0, [r6, #4]
	str r0, [r5, #0x50]
	ldr r0, [r6, #8]
	add r6, r6, #0xc
	str r0, [r5, #0x54]
_020C0908:
	ldrh r0, [r7]
	tst r0, #2
	beq _020C0924
	ldr r0, [r5]
	orr r0, r0, #2
	str r0, [r5]
	b _020C0A38
_020C0924:
	tst r0, #8
	beq _020C09EC
	and r1, r0, #0xf0
	mov fp, r1, asr #4
	ldrsh r1, [r6]
	add r0, r5, #0x28
	str r1, [sp]
	ldrsh r1, [r6, #2]
	str r1, [sp, #4]
	bl MI_Zero36B
	ldrh r0, [r7]
	ldr r2, _020C0B38 ; =_02109494
	ldr r1, _020C0B3C ; =_02109494 + 1
	tst r0, #0x100
	mov r0, #0x1000
	ldrb r2, [r2, fp, lsl #2]
	ldrb r1, [r1, fp, lsl #2]
	rsbne r0, r0, #0
	add r3, r5, fp, lsl #2
	str r0, [r3, #0x28]
	ldr r0, [sp]
	add r2, r5, r2, lsl #2
	str r0, [r2, #0x28]
	ldr r0, [sp, #4]
	add r1, r5, r1, lsl #2
	str r0, [r1, #0x28]
	ldrh r0, [r7]
	tst r0, #0x200
	beq _020C09A4
	ldr r0, [sp, #4]
	rsb r0, r0, #0
	str r0, [sp, #4]
_020C09A4:
	ldr r0, _020C0B40 ; =_02109494 + 2
	ldrb r0, [r0, fp, lsl #2]
	add r1, r5, r0, lsl #2
	ldr r0, [sp, #4]
	str r0, [r1, #0x28]
	ldrh r0, [r7]
	tst r0, #0x400
	beq _020C09D0
	ldr r0, [sp]
	rsb r0, r0, #0
	str r0, [sp]
_020C09D0:
	ldr r0, _020C0B44 ; =_02109494 + 3
	add r6, r6, #4
	ldrb r0, [r0, fp, lsl #2]
	add r1, r5, r0, lsl #2
	ldr r0, [sp]
	str r0, [r1, #0x28]
	b _020C0A38
_020C09EC:
	ldrsh r0, [r7, #2]
	str r0, [r5, #0x28]
	ldrsh r0, [r6]
	str r0, [r5, #0x2c]
	ldrsh r0, [r6, #2]
	str r0, [r5, #0x30]
	ldrsh r0, [r6, #4]
	str r0, [r5, #0x34]
	ldrsh r0, [r6, #6]
	str r0, [r5, #0x38]
	ldrsh r0, [r6, #8]
	str r0, [r5, #0x3c]
	ldrsh r0, [r6, #0xa]
	str r0, [r5, #0x40]
	ldrsh r0, [r6, #0xc]
	str r0, [r5, #0x44]
	ldrsh r0, [r6, #0xe]
	add r6, r6, #0x10
	str r0, [r5, #0x48]
_020C0A38:
	ldrh r3, [r7]
	ldr r2, [sl]
	ldr r7, [sl, #0xe8]
	mov r0, r5
	mov r1, r6
	blx r7
_020C0A50:
	str r5, [sl, #0xb4]
_020C0A54:
	cmp r8, #2
	bne _020C0A90
	ldr r1, [sl, #8]
	mov r0, sl
	bic r1, r1, #0x40
	str r1, [sl, #8]
	ldr r1, [sl, #0x24]
	blx r1
	ldr r0, [sl, #0x24]
	cmp r0, #0
	ldrneb r8, [sl, #0x92]
	ldr r0, [sl, #8]
	moveq r8, #0
	and r0, r0, #0x40
	b _020C0A94
_020C0A90:
	mov r0, #0
_020C0A94:
	cmp r0, #0
	bne _020C0AB4
	ldr r0, [sl, #8]
	tst r0, #0x100
	bne _020C0AB4
	ldr r0, [sl, #0xb4]
	ldr r1, [sl, #0xec]
	blx r1
_020C0AB4:
	mov r0, #0
	str r0, [sl, #0xb4]
	cmp r8, #3
	bne _020C0AE4
	ldr r1, [sl, #8]
	mov r0, sl
	bic r1, r1, #0x40
	str r1, [sl, #8]
	ldr r1, [sl, #0x24]
	blx r1
	ldr r0, [sl, #8]
	and r0, r0, #0x40
_020C0AE4:
	cmp sb, #0x20
	cmpne sb, #0x60
	bne _020C0B24
	cmp r0, #0
	add r4, r4, #1
	bne _020C0B24
	ldr r0, [sl, #8]
	tst r0, #0x100
	bne _020C0B24
	ldr r0, [sl]
	add r1, sp, #8
	ldrb r3, [r0, #4]
	mov r0, #0x13
	mov r2, #1
	str r3, [sp, #8]
	bl NNS_G3dGeBufferOP_N
_020C0B24:
	ldr r0, [sl]
	add r0, r0, r4
	str r0, [sl]
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C0B38: .word _02109494
_020C0B3C: .word _02109494 + 1
_020C0B40: .word _02109494 + 2
_020C0B44: .word _02109494 + 3
	arm_func_end NNSi_G3dFuncSbc_NODEDESC

	arm_func_start NNSi_G3dFuncSbc_BB
NNSi_G3dFuncSbc_BB: ; 0x020C0B48
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xc8
	mov sb, r0
	ldr r0, [sb, #8]
	mov r8, r1
	tst r0, #0x200
	mov r4, #2
	ldr r5, _020C0E24 ; =_02110B3C
	ldr r6, _020C0E28 ; =_02110B48
	beq _020C0B9C
	cmp r8, #0x40
	cmpne r8, #0x60
	addeq r4, r4, #1
	cmp r8, #0x20
	cmpne r8, #0x60
	ldr r0, [sb]
	addeq r4, r4, #1
	add r0, r0, r4
	add sp, sp, #0xc8
	str r0, [sb]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C0B9C:
	cmp r8, #0x40
	cmpne r8, #0x60
	bne _020C0BDC
	tst r0, #0x100
	add r4, r4, #1
	bne _020C0BDC
	ldr r0, [sb]
	cmp r8, #0x40
	ldreqb r0, [r0, #2]
	add r1, sp, #4
	mov r2, #1
	streq r0, [sp, #4]
	ldrneb r0, [r0, #3]
	strne r0, [sp, #4]
	mov r0, #0x14
	bl NNS_G3dGeBufferOP_N
_020C0BDC:
	ldr r0, [sb, #0x28]
	cmp r0, #0
	ldrneb r7, [sb, #0x93]
	moveq r7, #0
	cmp r7, #1
	bne _020C0C28
	ldr r1, [sb, #8]
	mov r0, sb
	bic r1, r1, #0x40
	str r1, [sb, #8]
	ldr r1, [sb, #0x28]
	blx r1
	ldr r0, [sb, #0x28]
	cmp r0, #0
	ldrneb r7, [sb, #0x93]
	ldr r0, [sb, #8]
	moveq r7, #0
	and r1, r0, #0x40
	b _020C0C2C
_020C0C28:
	mov r1, #0
_020C0C2C:
	ldr r0, [sb, #8]
	tst r0, #0x100
	cmpeq r1, #0
	bne _020C0DA4
	bl NNS_G3dGeFlushBuffer
	ldr r2, _020C0E2C ; =0x00151110
	ldr r1, _020C0E30 ; =0x04000400
	mov r0, #0
	str r2, [r1]
	str r0, [r1]
	str r0, [r1]
	add sl, sp, #0x88
_020C0C5C:
	mov r0, sl
	bl G3X_GetClipMtx
	cmp r0, #0
	bne _020C0C5C
	ldr r0, _020C0E34 ; =NNS_G3dGlb
	ldr r0, [r0, #0xfc]
	tst r0, #1
	beq _020C0C9C
	bl NNS_G3dGlbGetWV
	add r1, sp, #0x48
	bl MTX_Copy43To44_
	add r0, sp, #0x88
	add r1, sp, #0x48
	mov r2, r0
	bl MTX_Concat44
	b _020C0CC0
_020C0C9C:
	tst r0, #2
	beq _020C0CC0
	ldr r0, _020C0E38 ; =NNS_G3dGlb + 0x4C
	add r1, sp, #8
	bl MTX_Copy43To44_
	add r0, sp, #0x88
	add r1, sp, #8
	mov r2, r0
	bl MTX_Concat44
_020C0CC0:
	ldr r3, [sp, #0xb8]
	ldr r2, [sp, #0xbc]
	ldr r1, [sp, #0xc0]
	add r0, sp, #0x88
	str r3, [r5]
	str r2, [r5, #4]
	str r1, [r5, #8]
	bl VEC_Mag
	str r0, [r6]
	add r0, sp, #0x98
	bl VEC_Mag
	str r0, [r6, #4]
	add r0, sp, #0xa8
	bl VEC_Mag
	ldr r1, _020C0E34 ; =NNS_G3dGlb
	str r0, [r6, #8]
	ldr r0, [r1, #0xfc]
	ldr r1, _020C0E30 ; =0x04000400
	tst r0, #1
	beq _020C0D50
	ldr r3, _020C0E3C ; =0x00171012
	ldr r0, _020C0E40 ; =_02110B10
	mov r2, #8
	str r3, [r1]
	bl MIi_CpuSend32
	bl NNS_G3dGlbGetInvWV
	ldr r1, _020C0E30 ; =0x04000400
	mov r2, #0x30
	bl MIi_CpuSend32
	ldr r2, _020C0E44 ; =0x00001B19
	ldr r1, _020C0E30 ; =0x04000400
	ldr r0, _020C0E48 ; =_02110B18
	str r2, [r1]
	mov r2, #0x3c
	bl MIi_CpuSend32
	b _020C0DA4
_020C0D50:
	tst r0, #2
	beq _020C0D98
	ldr r3, _020C0E3C ; =0x00171012
	ldr r0, _020C0E40 ; =_02110B10
	mov r2, #8
	str r3, [r1]
	bl MIi_CpuSend32
	bl NNS_G3dGlbGetInvV
	ldr r1, _020C0E30 ; =0x04000400
	mov r2, #0x30
	bl MIi_CpuSend32
	ldr r2, _020C0E44 ; =0x00001B19
	ldr r1, _020C0E30 ; =0x04000400
	ldr r0, _020C0E48 ; =_02110B18
	str r2, [r1]
	mov r2, #0x3c
	bl MIi_CpuSend32
	b _020C0DA4
_020C0D98:
	ldr r0, _020C0E4C ; =_02110B0C
	mov r2, #0x48
	bl MIi_CpuSend32
_020C0DA4:
	cmp r7, #3
	movne r0, #0
	bne _020C0DD0
	ldr r1, [sb, #8]
	mov r0, sb
	bic r1, r1, #0x40
	str r1, [sb, #8]
	ldr r1, [sb, #0x28]
	blx r1
	ldr r0, [sb, #8]
	and r0, r0, #0x40
_020C0DD0:
	cmp r8, #0x20
	cmpne r8, #0x60
	bne _020C0E10
	cmp r0, #0
	add r4, r4, #1
	bne _020C0E10
	ldr r0, [sb, #8]
	tst r0, #0x100
	bne _020C0E10
	ldr r0, [sb]
	add r1, sp, #0
	ldrb r3, [r0, #2]
	mov r0, #0x13
	mov r2, #1
	str r3, [sp]
	bl NNS_G3dGeBufferOP_N
_020C0E10:
	ldr r0, [sb]
	add r0, r0, r4
	str r0, [sb]
	add sp, sp, #0xc8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020C0E24: .word _02110B3C
_020C0E28: .word _02110B48
_020C0E2C: .word 0x00151110
_020C0E30: .word 0x04000400
_020C0E34: .word NNS_G3dGlb
_020C0E38: .word NNS_G3dGlb + 0x4C
_020C0E3C: .word 0x00171012
_020C0E40: .word _02110B10
_020C0E44: .word 0x00001B19
_020C0E48: .word _02110B18
_020C0E4C: .word _02110B0C
	arm_func_end NNSi_G3dFuncSbc_BB

	arm_func_start NNSi_G3dFuncSbc_BBY
NNSi_G3dFuncSbc_BBY: ; 0x020C0E50
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc8
	mov sl, r0
	ldr r0, [sl, #8]
	mov sb, r1
	tst r0, #0x200
	mov r5, #2
	ldr fp, _020C1188 ; =_02110B84
	ldr r6, _020C118C ; =_02110B90
	ldr r7, _020C1190 ; =_02110B60
	beq _020C0EA8
	cmp sb, #0x40
	cmpne sb, #0x60
	addeq r5, r5, #1
	cmp sb, #0x20
	cmpne sb, #0x60
	ldr r0, [sl]
	addeq r5, r5, #1
	add r0, r0, r5
	add sp, sp, #0xc8
	str r0, [sl]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C0EA8:
	cmp sb, #0x40
	cmpne sb, #0x60
	bne _020C0EE8
	tst r0, #0x100
	add r5, r5, #1
	bne _020C0EE8
	ldr r0, [sl]
	cmp sb, #0x40
	ldreqb r0, [r0, #2]
	add r1, sp, #4
	mov r2, #1
	streq r0, [sp, #4]
	ldrneb r0, [r0, #3]
	strne r0, [sp, #4]
	mov r0, #0x14
	bl NNS_G3dGeBufferOP_N
_020C0EE8:
	ldr r0, [sl, #0x2c]
	cmp r0, #0
	ldrneb r8, [sl, #0x94]
	moveq r8, #0
	cmp r8, #1
	bne _020C0F34
	ldr r1, [sl, #8]
	mov r0, sl
	bic r1, r1, #0x40
	str r1, [sl, #8]
	ldr r1, [sl, #0x2c]
	blx r1
	ldr r0, [sl, #0x2c]
	cmp r0, #0
	ldrneb r8, [sl, #0x94]
	ldr r0, [sl, #8]
	moveq r8, #0
	and r1, r0, #0x40
	b _020C0F38
_020C0F34:
	mov r1, #0
_020C0F38:
	ldr r0, [sl, #8]
	tst r0, #0x100
	cmpeq r1, #0
	bne _020C1108
	bl NNS_G3dGeFlushBuffer
	ldr r2, _020C1194 ; =0x00151110
	ldr r1, _020C1198 ; =0x04000400
	mov r0, #0
	str r2, [r1]
	str r0, [r1]
	str r0, [r1]
	add r4, sp, #0x88
_020C0F68:
	mov r0, r4
	bl G3X_GetClipMtx
	cmp r0, #0
	bne _020C0F68
	ldr r0, _020C119C ; =NNS_G3dGlb
	ldr r0, [r0, #0xfc]
	tst r0, #1
	beq _020C0FA8
	bl NNS_G3dGlbGetWV
	add r1, sp, #0x48
	bl MTX_Copy43To44_
	add r0, sp, #0x88
	add r1, sp, #0x48
	mov r2, r0
	bl MTX_Concat44
	b _020C0FCC
_020C0FA8:
	tst r0, #2
	beq _020C0FCC
	ldr r0, _020C11A0 ; =NNS_G3dGlb + 0x4C
	add r1, sp, #8
	bl MTX_Copy43To44_
	add r0, sp, #0x88
	add r1, sp, #8
	mov r2, r0
	bl MTX_Concat44
_020C0FCC:
	ldr r3, [sp, #0xb8]
	ldr r2, [sp, #0xbc]
	ldr r1, [sp, #0xc0]
	add r0, sp, #0x88
	str r3, [fp]
	str r2, [fp, #4]
	str r1, [fp, #8]
	bl VEC_Mag
	str r0, [r6]
	add r0, sp, #0x98
	bl VEC_Mag
	str r0, [r6, #4]
	add r0, sp, #0xa8
	bl VEC_Mag
	ldr r1, [sp, #0x9c]
	str r0, [r6, #8]
	cmp r1, #0
	ldreq r0, [sp, #0xa0]
	cmpeq r0, #0
	beq _020C1040
	add r0, sp, #0x98
	add r1, r7, #0xc
	bl VEC_Normalize
	ldr r1, [r7, #0x14]
	ldr r0, [r7, #0x10]
	rsb r1, r1, #0
	str r1, [r7, #0x1c]
	str r0, [r7, #0x20]
	b _020C1060
_020C1040:
	add r0, sp, #0xa8
	add r1, r7, #0x18
	bl VEC_Normalize
	ldr r1, [r7, #0x1c]
	ldr r0, [r7, #0x20]
	rsb r1, r1, #0
	str r1, [r7, #0x14]
	str r0, [r7, #0x10]
_020C1060:
	ldr r0, _020C119C ; =NNS_G3dGlb
	ldr r1, _020C1198 ; =0x04000400
	ldr r0, [r0, #0xfc]
	tst r0, #1
	beq _020C10B4
	ldr r3, _020C11A4 ; =0x00171012
	ldr r0, _020C11A8 ; =_02110B58
	mov r2, #8
	str r3, [r1]
	bl MIi_CpuSend32
	bl NNS_G3dGlbGetInvWV
	ldr r1, _020C1198 ; =0x04000400
	mov r2, #0x30
	bl MIi_CpuSend32
	ldr r2, _020C11AC ; =0x00001B19
	ldr r1, _020C1198 ; =0x04000400
	ldr r0, _020C1190 ; =_02110B60
	str r2, [r1]
	mov r2, #0x3c
	bl MIi_CpuSend32
	b _020C1108
_020C10B4:
	tst r0, #2
	beq _020C10FC
	ldr r3, _020C11A4 ; =0x00171012
	ldr r0, _020C11A8 ; =_02110B58
	mov r2, #8
	str r3, [r1]
	bl MIi_CpuSend32
	bl NNS_G3dGlbGetInvV
	ldr r1, _020C1198 ; =0x04000400
	mov r2, #0x30
	bl MIi_CpuSend32
	ldr r2, _020C11AC ; =0x00001B19
	ldr r1, _020C1198 ; =0x04000400
	ldr r0, _020C1190 ; =_02110B60
	str r2, [r1]
	mov r2, #0x3c
	bl MIi_CpuSend32
	b _020C1108
_020C10FC:
	ldr r0, _020C11B0 ; =_02110B54
	mov r2, #0x48
	bl MIi_CpuSend32
_020C1108:
	cmp r8, #3
	movne r0, #0
	bne _020C1134
	ldr r1, [sl, #8]
	mov r0, sl
	bic r1, r1, #0x40
	str r1, [sl, #8]
	ldr r1, [sl, #0x2c]
	blx r1
	ldr r0, [sl, #8]
	and r0, r0, #0x40
_020C1134:
	cmp sb, #0x20
	cmpne sb, #0x60
	bne _020C1174
	cmp r0, #0
	add r5, r5, #1
	bne _020C1174
	ldr r0, [sl, #8]
	tst r0, #0x100
	bne _020C1174
	ldr r0, [sl]
	add r1, sp, #0
	ldrb r3, [r0, #2]
	mov r0, #0x13
	mov r2, #1
	str r3, [sp]
	bl NNS_G3dGeBufferOP_N
_020C1174:
	ldr r0, [sl]
	add r0, r0, r5
	str r0, [sl]
	add sp, sp, #0xc8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C1188: .word _02110B84
_020C118C: .word _02110B90
_020C1190: .word _02110B60
_020C1194: .word 0x00151110
_020C1198: .word 0x04000400
_020C119C: .word NNS_G3dGlb
_020C11A0: .word NNS_G3dGlb + 0x4C
_020C11A4: .word 0x00171012
_020C11A8: .word _02110B58
_020C11AC: .word 0x00001B19
_020C11B0: .word _02110B54
	arm_func_end NNSi_G3dFuncSbc_BBY

	arm_func_start NNSi_G3dFuncSbc_NODEMIX
NNSi_G3dFuncSbc_NODEMIX: ; 0x020C11B4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x104
	ldr r1, [r0, #4]
	ldr r6, [r0]
	ldr r7, [r1, #4]
	ldrb r2, [r6, #2]
	ldr r3, [r7, #0x10]
	mov r5, #0
	str r0, [sp]
	str r2, [sp, #0x10]
	add r3, r7, r3
	add r1, sp, #0xb0
	mov r0, r5
	mov r2, #0x54
	mov r4, r5
	str r3, [sp, #0x14]
	add r6, r6, #3
	bl MIi_CpuClearFast
	bl NNS_G3dGeFlushBuffer
	mov r0, r5
	ldr r1, _020C1900 ; =0x04000440
	str r0, [sp, #0xc]
	str r0, [r1]
	mov r0, #1
	str r0, [r1, #0xc]
	ldr r0, [sp, #0xc]
	str r0, [r1, #0x14]
	mov r0, #2
	str r0, [r1]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bls _020C16A4
_020C1234:
	ldrb fp, [r6, #1]
	mov r1, #0x64
	ldr r0, [sp]
	smulbb r1, fp, r1
	mov r2, fp, lsr #5
	str r1, [sp, #4]
	add r0, r0, r2, lsl #2
	ldr r3, _020C1904 ; =_021DBB04
	ldr r2, [sp, #4]
	ldr sb, [r0, #0xcc]
	add r7, r3, r2
	and r1, fp, #0x1f
	mov r2, #1
	ands r3, sb, r2, lsl r1
	str r3, [sp, #8]
	bne _020C12A0
	ldr sb, [r0, #0xcc]
	ldr r3, _020C1908 ; =0x04000450
	orr r1, sb, r2, lsl r1
	str r1, [r0, #0xcc]
	ldr r0, [sp, #0x14]
	mov r1, #0x54
	mla r0, fp, r1, r0
	ldrb sb, [r6]
	str sb, [r3]
	str r2, [r3, #-0x10]
	bl G3_MultMtx43
_020C12A0:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _020C14C8
	ldr r0, [sp, #0xe0]
	ldmia r8, {sb, lr}
	str r0, [sp, #0x18]
	mov r0, sb, asr #0x1f
	str r0, [sp, #0x20]
	ldr r0, [sp, #0xe4]
	ldr ip, [r8, #8]
	str r0, [sp, #0x24]
	mov r0, lr, asr #0x1f
	str r0, [sp, #0x28]
	ldr r0, [sp, #0xe8]
	ldr r3, [r8, #0xc]
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0xec]
	ldr r2, [r8, #0x10]
	str r0, [sp, #0x34]
	mov r0, ip, asr #0x1f
	str r0, [sp, #0x30]
	ldr r0, [sp, #0xf0]
	ldr r1, [r8, #0x14]
	str r0, [sp, #0x3c]
	mov r0, r3, asr #0x1f
	str r0, [sp, #0x38]
	ldr r0, [sp, #0xf4]
	str r0, [sp, #0x44]
	mov r0, r2, asr #0x1f
	str r0, [sp, #0x40]
	ldr r0, [sp, #0xf8]
	str r0, [sp, #0x4c]
	mov r0, r1, asr #0x1f
	str r0, [sp, #0x48]
	ldr r0, [r8, #0x18]
	str r0, [sp, #0x50]
	ldr r0, [sp, #0xfc]
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x50]
	mov r0, r0, asr #0x1f
	str r0, [sp, #0x54]
	ldr r0, [r8, #0x1c]
	str r0, [sp, #0xa8]
	ldr r0, [r8, #0x20]
	ldr r8, [sp, #0xa8]
	mov r8, r8, asr #0x1f
	str r8, [sp, #0x5c]
	ldr r8, [sp, #0x100]
	str r8, [sp, #0x60]
	mov r8, r0, asr #0x1f
	str r8, [sp, #0x64]
	umull sl, r8, r5, sb
	str sl, [sp, #0x1c]
	ldr sl, [sp, #0x20]
	mla r8, r5, sl, r8
	mla r8, r4, sb, r8
	ldr sb, [sp, #0x1c]
	mov sb, sb, lsr #0xc
	orr sb, sb, r8, lsl #20
	ldr r8, [sp, #0x18]
	adds r8, r8, sb
	str r8, [sp, #0xe0]
	umull sl, sb, r5, lr
	ldr r8, [sp, #0x28]
	mov sl, sl, lsr #0xc
	mla sb, r5, r8, sb
	mla sb, r4, lr, sb
	ldr r8, [sp, #0x24]
	orr sl, sl, sb, lsl #20
	adds r8, r8, sl
	str r8, [sp, #0xe4]
	umull sl, sb, r5, ip
	ldr r8, [sp, #0x30]
	mov sl, sl, lsr #0xc
	mla sb, r5, r8, sb
	mla sb, r4, ip, sb
	ldr r8, [sp, #0x2c]
	orr sl, sl, sb, lsl #20
	adds r8, r8, sl
	str r8, [sp, #0xe8]
	ldr r8, [sp, #0x38]
	umull sl, sb, r5, r3
	mla sb, r5, r8, sb
	mla sb, r4, r3, sb
	mov r8, sl, lsr #0xc
	ldr r3, [sp, #0x34]
	orr r8, r8, sb, lsl #20
	adds r3, r3, r8
	str r3, [sp, #0xec]
	ldr r3, [sp, #0x40]
	umull sb, r8, r5, r2
	mla r8, r5, r3, r8
	mla r8, r4, r2, r8
	mov r3, sb, lsr #0xc
	ldr r2, [sp, #0x3c]
	orr r3, r3, r8, lsl #20
	adds r2, r2, r3
	str r2, [sp, #0xf0]
	ldr r2, [sp, #0x48]
	umull r8, r3, r5, r1
	mla r3, r5, r2, r3
	mla r3, r4, r1, r3
	mov r2, r8, lsr #0xc
	ldr r1, [sp, #0x44]
	orr r2, r2, r3, lsl #20
	adds r1, r1, r2
	str r1, [sp, #0xf4]
	ldr r1, [sp, #0x50]
	umull r3, r2, r5, r1
	ldr r1, [sp, #0x54]
	mov r3, r3, lsr #0xc
	mla r2, r5, r1, r2
	ldr r1, [sp, #0x50]
	mla r2, r4, r1, r2
	ldr r1, [sp, #0x4c]
	orr r3, r3, r2, lsl #20
	adds r1, r1, r3
	str r1, [sp, #0xf8]
	ldr r1, [sp, #0xa8]
	umull r3, r2, r5, r1
	ldr r1, [sp, #0x5c]
	mov r3, r3, lsr #0xc
	mla r2, r5, r1, r2
	ldr r1, [sp, #0xa8]
	mla r2, r4, r1, r2
	ldr r1, [sp, #0x58]
	orr r3, r3, r2, lsl #20
	adds r1, r1, r3
	str r1, [sp, #0xfc]
	ldr r1, [sp, #0x64]
	umull r3, r2, r5, r0
	mla r2, r5, r1, r2
	mla r2, r4, r0, r2
	mov r1, r3, lsr #0xc
	ldr r0, [sp, #0x60]
	orr r1, r1, r2, lsl #20
	adds r0, r0, r1
	str r0, [sp, #0x100]
_020C14C8:
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _020C1504
_020C14D4:
	mov r0, r7
	bl G3X_GetClipMtx
	cmp r0, #0
	bne _020C14D4
	ldr r0, [sp, #0x14]
	mov r1, #0x54
	mla r0, fp, r1, r0
	ldr r1, _020C1900 ; =0x04000440
	mov r2, #2
	add r0, r0, #0x30
	str r2, [r1]
	bl G3_MultMtx33
_020C1504:
	ldrb r0, [r6, #2]
	ldr r2, [r7]
	ldr r1, [r7, #4]
	mov r5, r0, lsl #4
	ldr r0, [r7, #8]
	ldr r4, [r7, #0x10]
	ldr r3, [r7, #0x14]
	smull r2, r8, r5, r2
	mov r2, r2, lsr #0xc
	orr r2, r2, r8, lsl #20
	smull r1, r8, r5, r1
	mov r1, r1, lsr #0xc
	orr r1, r1, r8, lsl #20
	smull r0, r8, r5, r0
	mov r0, r0, lsr #0xc
	orr r0, r0, r8, lsl #20
	smull r8, r4, r5, r4
	mov sb, r8, lsr #0xc
	orr sb, sb, r4, lsl #20
	smull r4, r3, r5, r3
	mov r8, r4, lsr #0xc
	orr r8, r8, r3, lsl #20
	mov r4, r5, asr #0x1f
	ldr sl, [sp, #0xb0]
	ldr r3, [sp, #0xb4]
	adds r2, sl, r2
	adds r1, r3, r1
	str r2, [sp, #0xb0]
	str r1, [sp, #0xb4]
	ldr r2, [sp, #0xb8]
	ldr r1, [sp, #0xbc]
	adds r2, r2, r0
	adds r0, r1, sb
	str r2, [sp, #0xb8]
	str r0, [sp, #0xbc]
	ldr r0, [sp, #0xc0]
	ldr r2, [sp, #0xc4]
	adds r0, r0, r8
	str r0, [sp, #0xc0]
	ldr r0, [r7, #0x18]
	ldr r3, [sp, #0xc8]
	smull r1, r0, r5, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	adds r0, r2, r1
	str r0, [sp, #0xc4]
	ldr r0, [r7, #0x20]
	ldr r2, [sp, #0xcc]
	smull r1, r0, r5, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	adds r0, r3, r1
	str r0, [sp, #0xc8]
	ldr r0, [r7, #0x24]
	ldr r3, [sp, #0xd0]
	smull r1, r0, r5, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	adds r0, r2, r1
	str r0, [sp, #0xcc]
	ldr r0, [r7, #0x28]
	ldr r2, [sp, #0xd4]
	smull r1, r0, r5, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	adds r0, r3, r1
	str r0, [sp, #0xd0]
	ldr r0, [r7, #0x30]
	ldr r3, [sp, #0xd8]
	smull r1, r0, r5, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	adds r0, r2, r1
	str r0, [sp, #0xd4]
	ldr r1, [r7, #0x34]
	ldr r0, [r7, #0x38]
	smull r2, r1, r5, r1
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	adds r1, r3, r2
	str r1, [sp, #0xd8]
	smull r1, r0, r5, r0
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	ldr r0, [sp, #0xdc]
	adds r0, r0, r1
	str r0, [sp, #0xdc]
	ldr r1, _020C190C ; =_021DBB44
	ldr r0, [sp, #8]
	cmp r0, #0
	add r6, r6, #3
	ldr r0, [sp, #4]
	add r8, r1, r0
	bne _020C168C
_020C167C:
	mov r0, r8
	bl G3X_GetVectorMtx
	cmp r0, #0
	bne _020C167C
_020C168C:
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0xc]
	cmp r1, r0
	blo _020C1234
_020C16A4:
	ldmia r8, {r0, fp}
	ldr sl, [r8, #8]
	ldr sb, [r8, #0xc]
	ldr r7, [r8, #0x10]
	ldr r6, [r8, #0x14]
	ldr r3, [r8, #0x18]
	ldr r2, [r8, #0x1c]
	ldr r1, [r8, #0x20]
	umull ip, r8, r5, r0
	mov lr, ip, lsr #0xc
	ldr ip, [sp, #0xe0]
	str ip, [sp, #0x68]
	mov ip, r0, asr #0x1f
	mla r8, r5, ip, r8
	mla r8, r4, r0, r8
	orr lr, lr, r8, lsl #20
	umull ip, r8, r5, fp
	ldr r0, [sp, #0x68]
	str ip, [sp, #0x6c]
	adds r0, r0, lr
	str r0, [sp, #0xe0]
	mov r0, fp, asr #0x1f
	str r0, [sp, #0xac]
	ldr ip, [sp, #0xac]
	ldr r0, [sp, #0xe8]
	mla r8, r5, ip, r8
	mla r8, r4, fp, r8
	ldr fp, [sp, #0x6c]
	str r0, [sp, #0x70]
	mov fp, fp, lsr #0xc
	mov r0, sl, asr #0x1f
	str r0, [sp, #0x74]
	ldr r0, [sp, #0xec]
	ldr lr, [sp, #0xe4]
	orr fp, fp, r8, lsl #20
	adds r8, lr, fp
	str r8, [sp, #0xe4]
	str r0, [sp, #0x78]
	mov r0, sb, asr #0x1f
	str r0, [sp, #0x7c]
	ldr r0, [sp, #0xf0]
	ldr r8, [sp, #0x74]
	umull ip, fp, r5, sl
	mla fp, r5, r8, fp
	mla fp, r4, sl, fp
	mov sl, ip, lsr #0xc
	str r0, [sp, #0x80]
	mov r0, r7, asr #0x1f
	str r0, [sp, #0x84]
	ldr r0, [sp, #0xf4]
	ldr r8, [sp, #0x70]
	orr sl, sl, fp, lsl #20
	adds r8, r8, sl
	str r8, [sp, #0xe8]
	str r0, [sp, #0x88]
	mov r0, r6, asr #0x1f
	str r0, [sp, #0x8c]
	ldr r0, [sp, #0xf8]
	ldr r8, [sp, #0x7c]
	umull fp, sl, r5, sb
	mla sl, r5, r8, sl
	mla sl, r4, sb, sl
	mov sb, fp, lsr #0xc
	str r0, [sp, #0x90]
	mov r0, r3, asr #0x1f
	str r0, [sp, #0x94]
	ldr r0, [sp, #0xfc]
	ldr r8, [sp, #0x78]
	orr sb, sb, sl, lsl #20
	adds r8, r8, sb
	str r8, [sp, #0xec]
	str r0, [sp, #0x98]
	mov r0, r2, asr #0x1f
	str r0, [sp, #0x9c]
	ldr r0, [sp, #0x100]
	ldr r8, [sp, #0x84]
	umull sl, sb, r5, r7
	mla sb, r5, r8, sb
	mla sb, r4, r7, sb
	mov r8, sl, lsr #0xc
	str r0, [sp, #0xa0]
	mov r0, r1, asr #0x1f
	str r0, [sp, #0xa4]
	ldr r7, [sp, #0x80]
	orr r8, r8, sb, lsl #20
	adds r7, r7, r8
	str r7, [sp, #0xf0]
	ldr r7, [sp, #0x8c]
	umull sb, r8, r5, r6
	mla r8, r5, r7, r8
	mla r8, r4, r6, r8
	mov r7, sb, lsr #0xc
	ldr r6, [sp, #0x88]
	orr r7, r7, r8, lsl #20
	adds r6, r6, r7
	str r6, [sp, #0xf4]
	ldr r6, [sp, #0x94]
	umull r8, r7, r5, r3
	mla r7, r5, r6, r7
	mla r7, r4, r3, r7
	mov r6, r8, lsr #0xc
	ldr r3, [sp, #0x90]
	orr r6, r6, r7, lsl #20
	adds r3, r3, r6
	str r3, [sp, #0xf8]
	ldr r3, [sp, #0x9c]
	umull r7, r6, r5, r2
	mla r6, r5, r3, r6
	mla r6, r4, r2, r6
	mov r3, r7, lsr #0xc
	ldr r2, [sp, #0x98]
	orr r3, r3, r6, lsl #20
	adds r2, r2, r3
	str r2, [sp, #0xfc]
	ldr r2, [sp, #0xa4]
	umull r6, r3, r5, r1
	mla r3, r5, r2, r3
	mla r3, r4, r1, r3
	mov r2, r6, lsr #0xc
	ldr r1, [sp, #0xa0]
	orr r2, r2, r3, lsl #20
	adds r1, r1, r2
	add r0, sp, #0xe0
	str r1, [sp, #0x100]
	bl G3_LoadMtx43
	ldr r1, _020C1900 ; =0x04000440
	mov r2, #1
	add r0, sp, #0xb0
	str r2, [r1]
	bl G3_LoadMtx43
	ldr r1, _020C1900 ; =0x04000440
	mov r2, #0
	mov r0, #1
	str r2, [r1]
	str r0, [r1, #0x10]
	mov r0, #2
	str r0, [r1]
	ldr r0, [sp]
	ldr r0, [r0]
	ldrb r0, [r0, #1]
	str r0, [r1, #0xc]
	ldr r0, [sp]
	ldr r1, [r0]
	ldrb r0, [r1, #2]
	add r0, r0, #1
	add r0, r0, r0, lsl #1
	add r1, r1, r0
	ldr r0, [sp]
	str r1, [r0]
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C1900: .word 0x04000440
_020C1904: .word _021DBB04
_020C1908: .word 0x04000450
_020C190C: .word _021DBB44
	arm_func_end NNSi_G3dFuncSbc_NODEMIX

	arm_func_start NNSi_G3dFuncSbc_CALLDL
NNSi_G3dFuncSbc_CALLDL: ; 0x020C1910
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r0
	ldr r0, [r5, #0x34]
	cmp r0, #0
	ldrneb r4, [r5, #0x96]
	moveq r4, #0
	cmp r4, #1
	bne _020C1964
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x34]
	blx r1
	ldr r0, [r5, #0x34]
	cmp r0, #0
	ldrneb r4, [r5, #0x96]
	ldr r0, [r5, #8]
	moveq r4, #0
	and r1, r0, #0x40
	b _020C1968
_020C1964:
	mov r1, #0
_020C1968:
	ldr r0, [r5, #8]
	tst r0, #0x100
	cmpeq r1, #0
	bne _020C19BC
	ldr r0, [r5]
	ldrb ip, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb lr, [r0, #3]
	ldrb r2, [r0, #5]
	ldrb r1, [r0, #6]
	orr r3, ip, r3, lsl #8
	ldrb r6, [r0, #4]
	orr ip, r3, lr, lsl #16
	ldrb r3, [r0, #7]
	orr r1, r2, r1, lsl #8
	orr r6, ip, r6, lsl #24
	ldrb r2, [r0, #8]
	orr r1, r1, r3, lsl #16
	add r0, r0, r6
	orr r1, r1, r2, lsl #24
	bl NNS_G3dGeSendDL
_020C19BC:
	cmp r4, #3
	bne _020C19DC
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x34]
	blx r1
_020C19DC:
	ldr r0, [r5]
	add r0, r0, #9
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNSi_G3dFuncSbc_CALLDL

	arm_func_start NNSi_G3dFuncSbc_POSSCALE
NNSi_G3dFuncSbc_POSSCALE: ; 0x020C19EC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	ldr r0, [r4, #8]
	tst r0, #0x100
	bne _020C1A48
	tst r0, #0x200
	bne _020C1A48
	cmp r1, #0
	bne _020C1A28
	ldr r0, [r4, #0xe0]
	str r0, [sp, #8]
	str r0, [sp, #4]
	str r0, [sp]
	b _020C1A38
_020C1A28:
	ldr r0, [r4, #0xe4]
	str r0, [sp, #8]
	str r0, [sp, #4]
	str r0, [sp]
_020C1A38:
	add r1, sp, #0
	mov r0, #0x1b
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
_020C1A48:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end NNSi_G3dFuncSbc_POSSCALE

	arm_func_start NNSi_G3dFuncSbc_ENVMAP
NNSi_G3dFuncSbc_ENVMAP: ; 0x020C1A5C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x44
	mov r7, r0
	ldr r0, [r7, #8]
	tst r0, #0x200
	bne _020C1D78
	tst r0, #1
	beq _020C1D78
	ldr r2, [r7, #0xb0]
	ldr r0, [r2, #0x10]
	and r1, r0, #0xc0000000
	cmp r1, #0x80000000
	beq _020C1AC8
	bic r0, r0, #0xc0000000
	str r0, [r2, #0x10]
	ldr r3, [r7, #0xb0]
	ldr r0, _020C1D8C ; =_02110A9C
	ldr r2, [r3, #0x10]
	ldr r1, _020C1D90 ; =_02110AA8
	orr r2, r2, #0x80000000
	str r2, [r3, #0x10]
	ldr r3, [r7, #0xb0]
	mov r2, #1
	ldr r3, [r3, #0x10]
	str r3, [r0, #0xc]
	ldr r0, [r0, #8]
	bl NNS_G3dGeBufferOP_N
_020C1AC8:
	mov r0, #3
	str r0, [sp, #0x10]
	add r1, sp, #0x10
	mov r0, #0x10
	mov r2, #1
	bl NNS_G3dGeBufferOP_N
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	ldrneb r6, [r7, #0x98]
	moveq r6, #0
	cmp r6, #1
	bne _020C1B2C
	ldr r1, [r7, #8]
	mov r0, r7
	bic r1, r1, #0x40
	str r1, [r7, #8]
	ldr r1, [r7, #0x3c]
	blx r1
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	ldrneb r6, [r7, #0x98]
	ldr r0, [r7, #8]
	moveq r6, #0
	and r0, r0, #0x40
	b _020C1B30
_020C1B2C:
	mov r0, #0
_020C1B30:
	cmp r0, #0
	bne _020C1BA8
	ldr r0, [r7, #0xb0]
	add r1, sp, #0x14
	ldrh r5, [r0, #0x2e]
	ldrh r4, [r0, #0x2c]
	mov r3, #0x10000
	rsb r0, r5, #0
	mov ip, r0, lsl #0xf
	mov lr, r4, lsl #0xf
	mov r0, #0x1b
	mov r2, #3
	str lr, [sp, #0x14]
	str ip, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl NNS_G3dGeBufferOP_N
	mov r0, r5, lsl #0x13
	mov r1, r0, asr #0x10
	mov r0, r4, lsl #0x13
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	orr r3, r1, r0, lsr #16
	add r1, sp, #0xc
	mov r0, #0x22
	mov r2, #1
	str r3, [sp, #0xc]
	bl NNS_G3dGeBufferOP_N
_020C1BA8:
	cmp r6, #2
	bne _020C1BE4
	ldr r1, [r7, #8]
	mov r0, r7
	bic r1, r1, #0x40
	str r1, [r7, #8]
	ldr r1, [r7, #0x3c]
	blx r1
	ldr r0, [r7, #0x3c]
	cmp r0, #0
	ldrneb r6, [r7, #0x98]
	ldr r0, [r7, #8]
	moveq r6, #0
	and r0, r0, #0x40
	b _020C1BE8
_020C1BE4:
	mov r0, #0
_020C1BE8:
	cmp r0, #0
	bne _020C1C7C
	ldr r0, [r7]
	ldr r4, [r7, #0xd8]
	ldrb r3, [r0, #1]
	cmp r4, #0
	beq _020C1C44
	adds r2, r4, #4
	beq _020C1C30
	ldrb r0, [r4, #5]
	cmp r3, r0
	bhs _020C1C30
	ldrh r1, [r4, #0xa]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	add r1, r1, #4
	mla r1, r0, r3, r1
	b _020C1C34
_020C1C30:
	mov r1, #0
_020C1C34:
	cmp r1, #0
	ldrne r0, [r1]
	addne r0, r4, r0
	bne _020C1C48
_020C1C44:
	mov r0, #0
_020C1C48:
	ldrh r2, [r0, #0x1e]
	tst r2, #0x2000
	beq _020C1C7C
	add r1, r0, #0x2c
	tst r2, #2
	addeq r1, r1, #8
	tst r2, #4
	addeq r1, r1, #4
	tst r2, #8
	addeq r1, r1, #8
	mov r0, #0x18
	mov r2, #0x10
	bl NNS_G3dGeBufferOP_N
_020C1C7C:
	cmp r6, #3
	movne r0, #0
	bne _020C1CA8
	ldr r1, [r7, #8]
	mov r0, r7
	bic r1, r1, #0x40
	str r1, [r7, #8]
	ldr r1, [r7, #0x3c]
	blx r1
	ldr r0, [r7, #8]
	and r0, r0, #0x40
_020C1CA8:
	cmp r0, #0
	bne _020C1D60
	mov r3, #2
	add r1, sp, #8
	mov r0, #0x10
	mov r2, #1
	str r3, [sp, #8]
	bl NNS_G3dGeBufferOP_N
	add r1, sp, #0x20
	mov r0, #0
	bl NNS_G3dGetCurrentMtx
	mov r3, #3
	add r1, sp, #4
	mov r0, #0x10
	mov r2, #1
	str r3, [sp, #4]
	bl NNS_G3dGeBufferOP_N
	ldr r0, _020C1D94 ; =NNS_G3dGlb
	mov r2, #9
	ldr r0, [r0, #0xfc]
	tst r0, #1
	beq _020C1D30
	ldr r1, _020C1D98 ; =NNS_G3dGlb + 0x4C
	mov r0, #0x1a
	bl NNS_G3dGeBufferOP_N
	ldr r1, _020C1D9C ; =NNS_G3dGlb + 0xBC
	mov r0, #0x1a
	mov r2, #9
	bl NNS_G3dGeBufferOP_N
	add r1, sp, #0x20
	mov r0, #0x1a
	mov r2, #9
	bl NNS_G3dGeBufferOP_N
	b _020C1D60
_020C1D30:
	tst r0, #2
	mov r0, #0x1a
	beq _020C1D58
	ldr r1, _020C1D98 ; =NNS_G3dGlb + 0x4C
	bl NNS_G3dGeBufferOP_N
	add r1, sp, #0x20
	mov r0, #0x1a
	mov r2, #9
	bl NNS_G3dGeBufferOP_N
	b _020C1D60
_020C1D58:
	add r1, sp, #0x20
	bl NNS_G3dGeBufferOP_N
_020C1D60:
	mov r3, #2
	add r1, sp, #0
	mov r0, #0x10
	mov r2, #1
	str r3, [sp]
	bl NNS_G3dGeBufferOP_N
_020C1D78:
	ldr r0, [r7]
	add r0, r0, #3
	str r0, [r7]
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_020C1D8C: .word _02110A9C
_020C1D90: .word _02110AA8
_020C1D94: .word NNS_G3dGlb
_020C1D98: .word NNS_G3dGlb + 0x4C
_020C1D9C: .word NNS_G3dGlb + 0xBC
	arm_func_end NNSi_G3dFuncSbc_ENVMAP

	arm_func_start NNSi_G3dFuncSbc_PRJMAP
NNSi_G3dFuncSbc_PRJMAP: ; 0x020C1DA0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x80
	mov r5, r0
	ldr r0, [r5, #8]
	tst r0, #0x200
	bne _020C211C
	tst r0, #1
	beq _020C211C
	add r0, sp, #0x50
	mov r1, #0
	bl NNS_G3dGetCurrentMtx
	mov r0, #0x1e
	str r0, [sp, #0xc]
	add r1, sp, #0xc
	mov r0, #0x13
	mov r2, #1
	bl NNS_G3dGeBufferOP_N
	ldr r2, [r5, #0xb0]
	ldr r0, [r2, #0x10]
	and r1, r0, #0xc0000000
	cmp r1, #0xc0000000
	beq _020C1E30
	bic r0, r0, #0xc0000000
	str r0, [r2, #0x10]
	ldr r3, [r5, #0xb0]
	ldr r0, _020C2130 ; =_02110A9C
	ldr r2, [r3, #0x10]
	ldr r1, _020C2134 ; =_02110AA0
	orr r2, r2, #0xc0000000
	str r2, [r3, #0x10]
	ldr r3, [r5, #0xb0]
	mov r2, #1
	ldr r3, [r3, #0x10]
	str r3, [r0, #4]
	ldr r0, [r0]
	bl NNS_G3dGeBufferOP_N
_020C1E30:
	ldr r0, [r5, #0x40]
	cmp r0, #0
	ldrneb r4, [r5, #0x99]
	moveq r4, #0
	cmp r4, #1
	bne _020C1E7C
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x40]
	blx r1
	ldr r0, [r5, #0x40]
	cmp r0, #0
	ldrneb r4, [r5, #0x99]
	ldr r0, [r5, #8]
	moveq r4, #0
	and r0, r0, #0x40
	b _020C1E80
_020C1E7C:
	mov r0, #0
_020C1E80:
	cmp r0, #0
	bne _020C1EC8
	ldr r0, [r5, #0xb0]
	ldr r3, _020C2130 ; =_02110A9C
	ldrh ip, [r0, #0x2e]
	ldrh r2, [r0, #0x2c]
	ldr r1, _020C2138 ; =_02110ACC
	rsb r0, ip, #0
	mov r2, r2, lsl #0xf
	str r2, [r3, #0x30]
	mov r0, r0, lsl #0xf
	str r0, [r3, #0x44]
	str r2, [r3, #0x60]
	mov ip, ip, lsl #0xf
	mov r0, #0x16
	mov r2, #0x10
	str ip, [r3, #0x64]
	bl NNS_G3dGeBufferOP_N
_020C1EC8:
	cmp r4, #2
	bne _020C1F04
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x40]
	blx r1
	ldr r0, [r5, #0x40]
	cmp r0, #0
	ldrneb r4, [r5, #0x99]
	ldr r0, [r5, #8]
	moveq r4, #0
	and r0, r0, #0x40
	b _020C1F08
_020C1F04:
	mov r0, #0
_020C1F08:
	cmp r0, #0
	bne _020C1F9C
	ldr r0, [r5]
	ldr ip, [r5, #0xd8]
	ldrb r3, [r0, #1]
	cmp ip, #0
	beq _020C1F64
	adds r2, ip, #4
	beq _020C1F50
	ldrb r0, [ip, #5]
	cmp r3, r0
	bhs _020C1F50
	ldrh r1, [ip, #0xa]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	add r1, r1, #4
	mla r1, r0, r3, r1
	b _020C1F54
_020C1F50:
	mov r1, #0
_020C1F54:
	cmp r1, #0
	ldrne r0, [r1]
	addne r0, ip, r0
	bne _020C1F68
_020C1F64:
	mov r0, #0
_020C1F68:
	ldrh r2, [r0, #0x1e]
	tst r2, #0x2000
	beq _020C1F9C
	add r1, r0, #0x2c
	tst r2, #2
	addeq r1, r1, #8
	tst r2, #4
	addeq r1, r1, #4
	tst r2, #8
	addeq r1, r1, #8
	mov r0, #0x18
	mov r2, #0x10
	bl NNS_G3dGeBufferOP_N
_020C1F9C:
	cmp r4, #3
	movne r0, #0
	bne _020C1FC8
	ldr r1, [r5, #8]
	mov r0, r5
	bic r1, r1, #0x40
	str r1, [r5, #8]
	ldr r1, [r5, #0x40]
	blx r1
	ldr r0, [r5, #8]
	and r0, r0, #0x40
_020C1FC8:
	cmp r0, #0
	bne _020C20EC
	ldr r0, _020C213C ; =NNS_G3dGlb
	ldr r0, [r0, #0xfc]
	tst r0, #1
	beq _020C2014
	ldr r1, _020C2140 ; =NNS_G3dGlb + 0xE0
	mov r0, #0x1c
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
	ldr r1, _020C2144 ; =NNS_G3dGlb + 0xBC
	mov r0, #0x1a
	mov r2, #9
	bl NNS_G3dGeBufferOP_N
	add r1, sp, #0x50
	mov r0, #0x19
	mov r2, #0xc
	bl NNS_G3dGeBufferOP_N
	b _020C2054
_020C2014:
	tst r0, #2
	beq _020C2030
	add r1, sp, #0x50
	mov r0, #0x19
	mov r2, #0xc
	bl NNS_G3dGeBufferOP_N
	b _020C2054
_020C2030:
	bl NNS_G3dGlbGetInvV
	mov r1, r0
	mov r0, #0x19
	mov r2, #0xc
	bl NNS_G3dGeBufferOP_N
	add r1, sp, #0x50
	mov r0, #0x19
	mov r2, #0xc
	bl NNS_G3dGeBufferOP_N
_020C2054:
	bl NNS_G3dGeFlushBuffer
	ldr r0, _020C2148 ; =0x04000440
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #0x14]
	add r4, sp, #0x10
_020C2070:
	mov r0, r4
	bl G3X_GetClipMtx
	cmp r0, #0
	bne _020C2070
	ldr r2, _020C214C ; =0x04000448
	mov r0, #1
	str r0, [r2]
	mov r0, #3
	str r0, [r2, #-8]
	add r1, sp, #0x10
	mov r0, #0x16
	mov r2, #0x10
	bl NNS_G3dGeBufferOP_N
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x40]
	mov r0, r0, asr #4
	mov r0, r0, lsl #8
	mov r2, r1, asr #4
	mov r1, r0, asr #0x10
	mov r0, r2, lsl #8
	mov r1, r1, lsl #0x10
	mov r0, r0, asr #0x10
	mov r1, r1, lsr #0x10
	mov r0, r0, lsl #0x10
	mov r1, r1, lsl #0x10
	orr r3, r1, r0, lsr #16
	add r1, sp, #8
	mov r0, #0x22
	mov r2, #1
	str r3, [sp, #8]
	bl NNS_G3dGeBufferOP_N
_020C20EC:
	mov r3, #2
	add r1, sp, #4
	mov r0, #0x10
	mov r2, #1
	str r3, [sp, #4]
	bl NNS_G3dGeBufferOP_N
	mov r3, #0x1e
	add r1, sp, #0
	mov r0, #0x14
	mov r2, #1
	str r3, [sp]
	bl NNS_G3dGeBufferOP_N
_020C211C:
	ldr r0, [r5]
	add r0, r0, #3
	str r0, [r5]
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C2130: .word _02110A9C
_020C2134: .word _02110AA0
_020C2138: .word _02110ACC
_020C213C: .word NNS_G3dGlb
_020C2140: .word NNS_G3dGlb + 0xE0
_020C2144: .word NNS_G3dGlb + 0xBC
_020C2148: .word 0x04000440
_020C214C: .word 0x04000448
	arm_func_end NNSi_G3dFuncSbc_PRJMAP

	arm_func_start NNS_G3dDraw1Mat1Shp
NNS_G3dDraw1Mat1Shp: ; 0x020C2150
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x6c
	mov r6, r0
	ldr ip, [r6, #0x1c]
	mov r4, r1
	mov r5, r2
	mov r7, r3
	cmp ip, #0x1000
	beq _020C2190
	add r1, sp, #0xc
	mov r0, #0x1b
	mov r2, #3
	str ip, [sp, #0xc]
	str ip, [sp, #0x10]
	str ip, [sp, #0x14]
	bl NNS_G3dGeBufferOP_N
_020C2190:
	cmp r7, #0
	beq _020C233C
	ldrb r0, [r6, #0x18]
	cmp r4, r0
	bhs _020C233C
	cmp r6, #0
	ldrne r0, [r6, #8]
	cmpne r0, #0
	addne r3, r6, r0
	moveq r3, #0
	cmp r3, #0
	beq _020C2200
	adds r2, r3, #4
	beq _020C21EC
	ldrb r0, [r3, #5]
	cmp r4, r0
	bhs _020C21EC
	ldrh r1, [r3, #0xa]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	add r1, r1, #4
	mla r1, r0, r4, r1
	b _020C21F0
_020C21EC:
	mov r1, #0
_020C21F0:
	cmp r1, #0
	ldrne r0, [r1]
	addne r4, r3, r0
	bne _020C2204
_020C2200:
	mov r4, #0
_020C2204:
	ldr r0, [r4, #0xc]
	tst r0, #0x1f0000
	addeq sp, sp, #0x6c
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	ldr r0, _020C23E8 ; =0x00293130
	str r0, [sp, #0x50]
	ldr r0, [r4, #4]
	str r0, [sp, #0x54]
	ldr r0, [r4, #8]
	str r0, [sp, #0x58]
	ldr r1, [r4, #0xc]
	str r1, [sp, #0x5c]
	ldrh r0, [r4, #0x1e]
	tst r0, #0x20
	bicne r0, r1, #0x1f0000
	ldr r1, _020C23EC ; =0x00002B2A
	strne r0, [sp, #0x5c]
	str r1, [sp, #0x60]
	ldr r2, [r4, #0x14]
	ldr r0, [sp, #0x50]
	str r2, [sp, #0x64]
	ldrh r3, [r4, #0x1c]
	add r1, sp, #0x54
	mov r2, #6
	str r3, [sp, #0x68]
	bl NNS_G3dGeBufferOP_N
	ldrh r0, [r4, #0x1e]
	tst r0, #1
	beq _020C233C
	mov r2, #8
	str r2, [sp, #0x18]
	ldrh r1, [r4, #0x20]
	add r0, r4, #0x2c
	strh r1, [sp, #0x44]
	ldrh r1, [r4, #0x22]
	strh r1, [sp, #0x46]
	ldr r1, [r4, #0x24]
	str r1, [sp, #0x48]
	ldr r1, [r4, #0x28]
	str r1, [sp, #0x4c]
	ldrh r1, [r4, #0x1e]
	tst r1, #2
	orrne r1, r2, #1
	strne r1, [sp, #0x18]
	bne _020C22CC
	ldr r1, [r0]
	str r1, [sp, #0x30]
	ldr r1, [r0, #4]
	add r0, r0, #8
	str r1, [sp, #0x34]
_020C22CC:
	ldrh r1, [r4, #0x1e]
	tst r1, #4
	ldrne r1, [sp, #0x18]
	orrne r1, r1, #2
	strne r1, [sp, #0x18]
	bne _020C22F8
	ldrsh r1, [r0]
	strh r1, [sp, #0x38]
	ldrsh r1, [r0, #2]
	add r0, r0, #4
	strh r1, [sp, #0x3a]
_020C22F8:
	ldrh r1, [r4, #0x1e]
	tst r1, #8
	ldrne r0, [sp, #0x18]
	orrne r0, r0, #4
	strne r0, [sp, #0x18]
	bne _020C2320
	ldr r1, [r0]
	str r1, [sp, #0x3c]
	ldr r0, [r0, #4]
	str r0, [sp, #0x40]
_020C2320:
	ldrb r1, [r6, #0x16]
	ldr r0, _020C23F0 ; =_02110A8C
	ldr r1, [r0, r1, lsl #2]
	cmp r1, #0
	beq _020C233C
	add r0, sp, #0x18
	blx r1
_020C233C:
	ldrb r0, [r6, #0x19]
	cmp r5, r0
	bhs _020C23B4
	cmp r6, #0
	ldrne r0, [r6, #0xc]
	cmpne r0, #0
	addne r2, r6, r0
	moveq r2, #0
	cmp r2, #0
	beq _020C23A0
	beq _020C238C
	ldrb r0, [r2, #1]
	cmp r5, r0
	bhs _020C238C
	ldrh r1, [r2, #6]
	ldrh r0, [r2, r1]
	add r1, r2, r1
	add r1, r1, #4
	mla r1, r0, r5, r1
	b _020C2390
_020C238C:
	mov r1, #0
_020C2390:
	cmp r1, #0
	ldrne r0, [r1]
	addne r2, r2, r0
	bne _020C23A4
_020C23A0:
	mov r2, #0
_020C23A4:
	ldr r0, [r2, #8]
	ldr r1, [r2, #0xc]
	add r0, r2, r0
	bl NNS_G3dGeSendDL
_020C23B4:
	ldr r3, [r6, #0x20]
	cmp r3, #0x1000
	addeq sp, sp, #0x6c
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	add r1, sp, #0
	mov r0, #0x1b
	mov r2, #3
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	bl NNS_G3dGeBufferOP_N
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_020C23E8: .word 0x00293130
_020C23EC: .word 0x00002B2A
_020C23F0: .word _02110A8C
	arm_func_end NNS_G3dDraw1Mat1Shp

	arm_func_start NNS_G3dGeFlushBuffer
NNS_G3dGeFlushBuffer: ; 0x020C23F4
	stmdb sp!, {r3, lr}
	ldr r0, _020C2448 ; =_021DD404
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020C240C
	bl NNS_G3dGeWaitSendDL
_020C240C:
	ldr r0, _020C2448 ; =_021DD404
	ldr r0, [r0]
	cmp r0, #0
	ldrne r2, [r0]
	cmpne r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, _020C244C ; =0x04000400
	add r0, r0, #4
	mov r2, r2, lsl #2
	bl MIi_CpuSend32
	ldr r0, _020C2448 ; =_021DD404
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020C2448: .word _021DD404
_020C244C: .word 0x04000400
	arm_func_end NNS_G3dGeFlushBuffer

	arm_func_start NNS_G3dGeWaitSendDL
NNS_G3dGeWaitSendDL: ; 0x020C2450
	ldr r0, _020C2464 ; =_021DD404
_020C2454:
	ldr r1, [r0, #4]
	cmp r1, #0
	bne _020C2454
	bx lr
	.align 2, 0
_020C2464: .word _021DD404
	arm_func_end NNS_G3dGeWaitSendDL

	arm_func_start simpleUnlock_
simpleUnlock_: ; 0x020C2468
	mov r1, #0
	str r1, [r0]
	bx lr
	arm_func_end simpleUnlock_

	arm_func_start NNS_G3dGeSendDL
NNS_G3dGeSendDL: ; 0x020C2474
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	cmp r4, #0x100
	blo _020C249C
	ldr r1, _020C2518 ; =GXi_DmaId
	mvn r0, #0
	ldr r1, [r1]
	cmp r1, r0
	bne _020C24B4
_020C249C:
	mov r2, r4, lsr #2
	ldr r0, [r5]
	add r1, r5, #4
	sub r2, r2, #1
	bl NNS_G3dGeBufferOP_N
	ldmia sp!, {r3, r4, r5, pc}
_020C24B4:
	bl NNS_G3dGeFlushBuffer
	ldr r0, _020C251C ; =_021DD404
	mov r1, #1
	str r1, [r0, #4]
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _020C24F4
	ldr r1, _020C2520 ; =_021DD408
	ldr r0, _020C2518 ; =GXi_DmaId
	str r1, [sp]
	ldr r0, [r0]
	ldr r3, _020C2524 ; =simpleUnlock_
	mov r1, r5
	mov r2, r4
	bl MI_SendGXCommandAsyncFast
	ldmia sp!, {r3, r4, r5, pc}
_020C24F4:
	ldr r1, _020C2520 ; =_021DD408
	ldr r0, _020C2518 ; =GXi_DmaId
	str r1, [sp]
	ldr r0, [r0]
	ldr r3, _020C2524 ; =simpleUnlock_
	mov r1, r5
	mov r2, r4
	bl MI_SendGXCommandAsync
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C2518: .word GXi_DmaId
_020C251C: .word _021DD404
_020C2520: .word _021DD408
_020C2524: .word simpleUnlock_
	arm_func_end NNS_G3dGeSendDL

	arm_func_start NNS_G3dGeBufferOP_N
NNS_G3dGeBufferOP_N: ; 0x020C2528
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _020C2604 ; =_021DD404
	mov r6, r0
	ldr ip, [r3]
	mov r5, r1
	mov r4, r2
	cmp ip, #0
	beq _020C25DC
	ldr r0, [r3, #4]
	cmp r0, #0
	beq _020C25B0
	ldr r2, [ip]
	add r0, r2, #1
	add r1, r0, r4
	cmp r1, #0xc0
	bhi _020C25B0
	str r0, [ip]
	ldr r0, [r3]
	cmp r4, #0
	add r0, r0, r2, lsl #2
	str r6, [r0, #4]
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r2, [r3]
	mov r0, r5
	ldr r1, [r2], #4
	add r1, r2, r1, lsl #2
	mov r2, r4, lsl #2
	bl MIi_CpuCopyFast
	ldr r0, _020C2604 ; =_021DD404
	ldr r1, [r0]
	ldr r0, [r1]
	add r0, r0, r4
	str r0, [r1]
	ldmia sp!, {r4, r5, r6, pc}
_020C25B0:
	ldr r0, [ip]
	cmp r0, #0
	beq _020C25C4
	bl NNS_G3dGeFlushBuffer
	b _020C25EC
_020C25C4:
	ldr r0, _020C2604 ; =_021DD404
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020C25EC
	bl NNS_G3dGeWaitSendDL
	b _020C25EC
_020C25DC:
	ldr r0, [r3, #4]
	cmp r0, #0
	beq _020C25EC
	bl NNS_G3dGeWaitSendDL
_020C25EC:
	ldr r1, _020C2608 ; =0x04000400
	mov r0, r5
	mov r2, r4, lsl #2
	str r6, [r1]
	bl MIi_CpuSend32
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020C2604: .word _021DD404
_020C2608: .word 0x04000400
	arm_func_end NNS_G3dGeBufferOP_N

	arm_func_start NNS_G3dGetCurrentMtx
NNS_G3dGetCurrentMtx: ; 0x020C260C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x40
	mov r6, r0
	mov r5, r1
	bl NNS_G3dGeFlushBuffer
	ldr r0, _020C2690 ; =0x04000440
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #0x14]
	cmp r6, #0
	beq _020C265C
	add r4, sp, #0
_020C2640:
	mov r0, r4
	bl G3X_GetClipMtx
	cmp r0, #0
	bne _020C2640
	add r0, sp, #0
	mov r1, r6
	bl MTX_Copy44To43_
_020C265C:
	cmp r5, #0
	beq _020C2674
_020C2664:
	mov r0, r5
	bl G3X_GetVectorMtx
	cmp r0, #0
	bne _020C2664
_020C2674:
	ldr r1, _020C2694 ; =0x04000448
	mov r0, #1
	str r0, [r1]
	mov r0, #2
	str r0, [r1, #-8]
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020C2690: .word 0x04000440
_020C2694: .word 0x04000448
	arm_func_end NNS_G3dGetCurrentMtx

	arm_func_start NNS_G3dInit
NNS_G3dInit: ; 0x020C2698
	stmdb sp!, {r3, lr}
	bl G3X_Init
	bl NNS_G3dGlbInit
	ldr r1, _020C26BC ; =0x04000600
	ldr r0, [r1]
	bic r0, r0, #0xc0000000
	orr r0, r0, #0x80000000
	str r0, [r1]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020C26BC: .word 0x04000600
	arm_func_end NNS_G3dInit

	arm_func_start NNS_G3dResDefaultSetup
NNS_G3dResDefaultSetup: ; 0x020C26C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r2, [sl]
	ldr r1, _020C28DC ; =0x30415642
	cmp r2, r1
	bhi _020C270C
	bhs _020C28CC
	sub r0, r1, #0x900
	cmp r2, r0
	bhi _020C26FC
	bhs _020C28CC
	sub r0, r1, #0x1300
	cmp r2, r0
	beq _020C28CC
	b _020C28D4
_020C26FC:
	sub r0, r1, #0x200
	cmp r2, r0
	beq _020C28CC
	b _020C28D4
_020C270C:
	ldr r0, _020C28E0 ; =0x30505442
	cmp r2, r0
	bhi _020C272C
	bhs _020C28CC
	ldr r0, _020C28E4 ; =0x30444D42
	cmp r2, r0
	beq _020C2738
	b _020C28D4
_020C272C:
	add r0, r0, #0x80000
	cmp r2, r0
	bne _020C28D4
_020C2738:
	mov r5, #1
	mov r0, sl
	mov r6, r5
	mov r7, r5
	bl NNS_G3dGetTex
	movs r4, r0
	beq _020C289C
	bl NNS_G3dTexGetRequiredSize
	mov sb, r0
	mov r0, r4
	bl NNS_G3dTex4x4GetRequiredSize
	mov r8, r0
	mov r0, r4
	bl NNS_G3dPlttGetRequiredSize
	str r0, [sp]
	cmp sb, #0
	beq _020C27A0
	ldr r0, _020C28E8 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r1, #0
	ldr r3, [r0]
	mov r0, sb
	mov r2, r1
	blx r3
	movs fp, r0
	moveq r5, #0
	b _020C27A4
_020C27A0:
	mov fp, #0
_020C27A4:
	cmp r8, #0
	beq _020C27D0
	ldr r1, _020C28E8 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r0, r8
	ldr r3, [r1]
	mov r1, #1
	mov r2, #0
	blx r3
	movs r8, r0
	moveq r6, #0
	b _020C27D4
_020C27D0:
	mov r8, #0
_020C27D4:
	ldr r0, [sp]
	cmp r0, #0
	beq _020C2804
	ldr r1, _020C28EC ; =NNS_GfdDefaultFuncAllocPlttVram
	ldrh r2, [r4, #0x20]
	ldr r3, [r1]
	and r1, r2, #0x8000
	mov r2, #0
	blx r3
	movs sb, r0
	moveq r7, #0
	b _020C2808
_020C2804:
	mov sb, #0
_020C2808:
	cmp r5, #0
	cmpne r6, #0
	cmpne r7, #0
	bne _020C2868
	cmp r7, #0
	beq _020C2830
	ldr r1, _020C28F0 ; =NNS_GfdDefaultFuncFreePlttVram
	mov r0, sb
	ldr r1, [r1]
	blx r1
_020C2830:
	cmp r6, #0
	beq _020C2848
	ldr r1, _020C28F4 ; =NNS_GfdDefaultFuncFreeTexVram
	mov r0, r8
	ldr r1, [r1]
	blx r1
_020C2848:
	cmp r5, #0
	beq _020C2860
	ldr r1, _020C28F4 ; =NNS_GfdDefaultFuncFreeTexVram
	mov r0, fp
	ldr r1, [r1]
	blx r1
_020C2860:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C2868:
	mov r0, r4
	mov r1, fp
	mov r2, r8
	bl NNS_G3dTexSetTexKey
	mov r0, r4
	mov r1, sb
	bl NNS_G3dPlttSetPlttKey
	mov r0, r4
	mov r1, #1
	bl NNS_G3dTexLoad
	mov r0, r4
	mov r1, #1
	bl NNS_G3dPlttLoad
_020C289C:
	ldr r1, [sl]
	ldr r0, _020C28E4 ; =0x30444D42
	cmp r1, r0
	bne _020C28C4
	mov r0, sl
	bl NNS_G3dGetMdlSet
	cmp r4, #0
	beq _020C28C4
	mov r1, r4
	bl NNS_G3dBindMdlSet
_020C28C4:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C28CC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C28D4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C28DC: .word 0x30415642
_020C28E0: .word 0x30505442
_020C28E4: .word 0x30444D42
_020C28E8: .word NNS_GfdDefaultFuncAllocTexVram
_020C28EC: .word NNS_GfdDefaultFuncAllocPlttVram
_020C28F0: .word NNS_GfdDefaultFuncFreePlttVram
_020C28F4: .word NNS_GfdDefaultFuncFreeTexVram
	arm_func_end NNS_G3dResDefaultSetup

	arm_func_start NNS_G3dScrPosToWorldLine
NNS_G3dScrPosToWorldLine: ; 0x020C28F8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x24
	mov r7, r0
	mov r6, r1
	mov fp, r2
	mov r4, r3
	add r0, sp, #0x20
	add r1, sp, #0x1c
	add r2, sp, #0x18
	add r3, sp, #0x14
	bl NNS_G3dGlbGetViewPort
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	sub r5, r1, r0
	ldr r1, [sp, #0x18]
	sub r0, r7, r2
	sub r1, r1, r2
	mov r0, r0, lsl #0xc
	mov r1, r1, lsl #0xc
	bl FX_Div
	rsb r1, r5, #0
	mov r5, r0
	ldr r0, [sp, #0x1c]
	mov r1, r1, lsl #0xc
	add r0, r6, r0
	sub r0, r0, #0xbf
	mov r0, r0, lsl #0xc
	bl FX_Div
	cmp r5, #0
	cmpge r0, #0
	blt _020C2984
	cmp r5, #0x1000
	cmple r0, #0x1000
	ble _020C2990
_020C2984:
	mvn r1, #0
	str r1, [sp, #0x10]
	b _020C2998
_020C2990:
	mov r1, #0
	str r1, [sp, #0x10]
_020C2998:
	sub r1, r5, #0x800
	sub r0, r0, #0x800
	mov r8, r1, lsl #1
	mov sl, r0, lsl #1
	bl NNS_G3dGlbGetInvVP
	mov r5, r0
	ldr r0, [r5, #0x1c]
	ldr r1, [r5, #0xc]
	smull r2, r0, sl, r0
	smlal r2, r0, r8, r1
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	ldr r0, [r5, #0x3c]
	ldr r1, [r5, #0x2c]
	add r0, r0, r2
	str r0, [sp, #0xc]
	sub r0, r0, r1
	bl FX_InvAsync
	ldr r0, [r5, #0x10]
	ldr r2, [r5]
	smull r3, r0, sl, r0
	smlal r3, r0, r8, r2
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	ldr r6, [r5, #0x30]
	ldr r3, [r5, #4]
	add r6, r6, r2
	ldr r2, [r5, #0x14]
	ldr r1, [r5, #0x34]
	smull r7, r2, sl, r2
	smlal r7, r2, r8, r3
	mov r3, r7, lsr #0xc
	orr r3, r3, r2, lsl #20
	add r7, r1, r3
	ldr r1, [r5, #0x18]
	ldr r2, [r5, #8]
	smull r3, r1, sl, r1
	smlal r3, r1, r8, r2
	mov r2, r3, lsr #0xc
	ldr r0, [r5, #0x38]
	orr r2, r2, r1, lsl #20
	cmp r4, #0
	add r8, r0, r2
	beq _020C2A78
	ldr r0, [r5, #0x20]
	ldr r3, [r5, #0x24]
	add r0, r6, r0
	str r0, [sp, #4]
	add r0, r7, r3
	str r0, [sp]
	ldr r2, [r5, #0x28]
	ldr r1, [r5, #0x2c]
	ldr r0, [sp, #0xc]
	add sb, r8, r2
	add r0, r0, r1
	str r0, [sp, #8]
_020C2A78:
	ldr r2, [r5, #0x20]
	ldr r1, [r5, #0x24]
	ldr r0, [r5, #0x28]
	sub r6, r6, r2
	sub r7, r7, r1
	sub r8, r8, r0
	bl FX_GetDivResultFx64c
	mov r5, r0
	mov sl, r1
	cmp r4, #0
	beq _020C2AAC
	ldr r0, [sp, #8]
	bl FX_InvAsync
_020C2AAC:
	mov r0, r6, asr #0x1f
	umull r2, r1, r5, r6
	adds r2, r2, #0x80000000
	mla r1, r5, r0, r1
	mla r1, sl, r6, r1
	adc r2, r1, #0
	umull r0, r1, r5, r7
	str r2, [fp]
	adds r0, r0, #0x80000000
	mov r0, r7, asr #0x1f
	mla r1, r5, r0, r1
	mla r1, sl, r7, r1
	adc r0, r1, #0
	str r0, [fp, #4]
	umull r0, r1, r5, r8
	adds r0, r0, #0x80000000
	mov r0, r8, asr #0x1f
	mla r1, r5, r0, r1
	mla r1, sl, r8, r1
	adc r0, r1, #0
	str r0, [fp, #8]
	cmp r4, #0
	beq _020C2B70
	bl FX_GetDivResultFx64c
	ldr r2, [sp, #4]
	umull r6, r5, r0, r2
	mov r2, r2, asr #0x1f
	mla r5, r0, r2, r5
	ldr r2, [sp]
	adds r6, r6, #0x80000000
	mov r7, r2, asr #0x1f
	umull r3, r2, r0, r2
	mla r2, r0, r7, r2
	mov r7, sb, asr #0x1f
	umull r8, r6, r0, sb
	mla r6, r0, r7, r6
	ldr r0, [sp, #4]
	mla r6, r1, sb, r6
	mla r5, r1, r0, r5
	adc r0, r5, #0
	str r0, [r4]
	ldr r0, [sp]
	mla r2, r1, r0, r2
	adds r0, r3, #0x80000000
	adc r2, r2, #0
	adds r0, r8, #0x80000000
	str r2, [r4, #4]
	adc r0, r6, #0
	str r0, [r4, #8]
_020C2B70:
	ldr r0, [sp, #0x10]
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end NNS_G3dScrPosToWorldLine

	arm_func_start NNS_G3dAllocAnmObj
NNS_G3dAllocAnmObj: ; 0x020C2B7C
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	mov r1, r2
	bl NNS_G3dAnmObjCalcSizeRequired
	mov r1, r0
	mov r0, r4
	bl NNS_FndAllocFromAllocator
	ldmia sp!, {r4, pc}
	arm_func_end NNS_G3dAllocAnmObj

	arm_func_start NNS_G3dFreeAnmObj
NNS_G3dFreeAnmObj: ; 0x020C2BA0
	ldr ip, _020C2BA8 ; =NNS_FndFreeToAllocator
	bx ip
	.align 2, 0
_020C2BA8: .word NNS_FndFreeToAllocator
	arm_func_end NNS_G3dFreeAnmObj

	arm_func_start NNSi_G3dModifyMatFlag
NNSi_G3dModifyMatFlag: ; 0x020C2BAC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	cmp r0, #0
	ldrne r4, [r0, #8]
	ldrb r3, [r0, #0x18]
	cmpne r4, #0
	addne lr, r0, r4
	moveq lr, #0
	cmp r3, #0
	mov ip, #0
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
	mvn r4, r2
	add r0, lr, #4
	mov r7, ip
	mov r6, ip
_020C2BE4:
	cmp lr, #0
	beq _020C2C2C
	cmp r0, #0
	beq _020C2C18
	ldrb r5, [lr, #5]
	cmp ip, r5
	bhs _020C2C18
	ldrh r8, [lr, #0xa]
	ldrh r5, [r0, r8]
	add r8, r0, r8
	add r8, r8, #4
	mla r8, r5, ip, r8
	b _020C2C1C
_020C2C18:
	mov r8, r7
_020C2C1C:
	cmp r8, #0
	ldrne r5, [r8]
	addne r8, lr, r5
	bne _020C2C30
_020C2C2C:
	mov r8, r6
_020C2C30:
	ldrh r5, [r8, #0x1e]
	cmp r1, #0
	add ip, ip, #1
	orrne r5, r5, r2
	andeq r5, r5, r4
	strh r5, [r8, #0x1e]
	cmp ip, r3
	blo _020C2BE4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end NNSi_G3dModifyMatFlag

	arm_func_start NNSi_G3dModifyPolygonAttrMask
NNSi_G3dModifyPolygonAttrMask: ; 0x020C2C54
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	cmp r0, #0
	ldrne r4, [r0, #8]
	ldrb r3, [r0, #0x18]
	cmpne r4, #0
	addne lr, r0, r4
	moveq lr, #0
	cmp r3, #0
	mov ip, #0
	ldmlsia sp!, {r4, r5, r6, r7, r8, pc}
	mvn r4, r2
	add r0, lr, #4
	mov r7, ip
	mov r6, ip
_020C2C8C:
	cmp lr, #0
	beq _020C2CD4
	cmp r0, #0
	beq _020C2CC0
	ldrb r5, [lr, #5]
	cmp ip, r5
	bhs _020C2CC0
	ldrh r8, [lr, #0xa]
	ldrh r5, [r0, r8]
	add r8, r0, r8
	add r8, r8, #4
	mla r8, r5, ip, r8
	b _020C2CC4
_020C2CC0:
	mov r8, r7
_020C2CC4:
	cmp r8, #0
	ldrne r5, [r8]
	addne r8, lr, r5
	bne _020C2CD8
_020C2CD4:
	mov r8, r6
_020C2CD8:
	ldr r5, [r8, #0x10]
	cmp r1, #0
	orrne r5, r5, r2
	andeq r5, r5, r4
	add ip, ip, #1
	str r5, [r8, #0x10]
	cmp ip, r3
	blo _020C2C8C
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end NNSi_G3dModifyPolygonAttrMask

	arm_func_start NNS_G3dMdlSetMdlDiff
NNS_G3dMdlSetMdlDiff: ; 0x020C2CFC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C2D5C
	adds ip, lr, #4
	beq _020C2D48
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C2D48
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C2D4C
_020C2D48:
	mov r1, #0
_020C2D4C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r3, lr, r0
	bne _020C2D60
_020C2D5C:
	mov r3, #0
_020C2D60:
	mov r0, #0x8000
	ldr r1, [r3, #4]
	rsb r0, r0, #0
	and r0, r1, r0
	orr r0, r0, r2
	str r0, [r3, #4]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_G3dMdlSetMdlDiff

	arm_func_start NNS_G3dMdlSetMdlAmb
NNS_G3dMdlSetMdlAmb: ; 0x020C2D7C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C2DDC
	adds ip, lr, #4
	beq _020C2DC8
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C2DC8
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C2DCC
_020C2DC8:
	mov r1, #0
_020C2DCC:
	cmp r1, #0
	ldrne r0, [r1]
	addne r3, lr, r0
	bne _020C2DE0
_020C2DDC:
	mov r3, #0
_020C2DE0:
	ldr r1, [r3, #4]
	ldr r0, _020C2DF8 ; =0x8000FFFF
	and r0, r1, r0
	orr r0, r0, r2, lsl #16
	str r0, [r3, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020C2DF8: .word 0x8000FFFF
	arm_func_end NNS_G3dMdlSetMdlAmb

	arm_func_start NNS_G3dMdlSetMdlSpec
NNS_G3dMdlSetMdlSpec: ; 0x020C2DFC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C2E5C
	adds ip, lr, #4
	beq _020C2E48
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C2E48
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C2E4C
_020C2E48:
	mov r1, #0
_020C2E4C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r3, lr, r0
	bne _020C2E60
_020C2E5C:
	mov r3, #0
_020C2E60:
	mov r0, #0x8000
	ldr r1, [r3, #8]
	rsb r0, r0, #0
	and r0, r1, r0
	orr r0, r0, r2
	str r0, [r3, #8]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_G3dMdlSetMdlSpec

	arm_func_start NNS_G3dMdlSetMdlEmi
NNS_G3dMdlSetMdlEmi: ; 0x020C2E7C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C2EDC
	adds ip, lr, #4
	beq _020C2EC8
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C2EC8
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C2ECC
_020C2EC8:
	mov r1, #0
_020C2ECC:
	cmp r1, #0
	ldrne r0, [r1]
	addne r3, lr, r0
	bne _020C2EE0
_020C2EDC:
	mov r3, #0
_020C2EE0:
	ldr r1, [r3, #8]
	ldr r0, _020C2EF8 ; =0x8000FFFF
	and r0, r1, r0
	orr r0, r0, r2, lsl #16
	str r0, [r3, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020C2EF8: .word 0x8000FFFF
	arm_func_end NNS_G3dMdlSetMdlEmi

	arm_func_start NNS_G3dMdlSetMdlLightEnableFlag
NNS_G3dMdlSetMdlLightEnableFlag: ; 0x020C2EFC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C2F5C
	adds ip, lr, #4
	beq _020C2F48
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C2F48
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C2F4C
_020C2F48:
	mov r1, #0
_020C2F4C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C2F60
_020C2F5C:
	mov r1, #0
_020C2F60:
	ldr r0, [r1, #0xc]
	bic r0, r0, #0xf
	orr r0, r0, r2
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_G3dMdlSetMdlLightEnableFlag

	arm_func_start NNS_G3dMdlSetMdlPolygonMode
NNS_G3dMdlSetMdlPolygonMode: ; 0x020C2F74
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C2FD4
	adds ip, lr, #4
	beq _020C2FC0
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C2FC0
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C2FC4
_020C2FC0:
	mov r1, #0
_020C2FC4:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C2FD8
_020C2FD4:
	mov r1, #0
_020C2FD8:
	ldr r0, [r1, #0xc]
	bic r0, r0, #0x30
	orr r0, r0, r2, lsl #4
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_G3dMdlSetMdlPolygonMode

	arm_func_start NNS_G3dMdlSetMdlCullMode
NNS_G3dMdlSetMdlCullMode: ; 0x020C2FEC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C304C
	adds ip, lr, #4
	beq _020C3038
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C3038
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C303C
_020C3038:
	mov r1, #0
_020C303C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C3050
_020C304C:
	mov r1, #0
_020C3050:
	ldr r0, [r1, #0xc]
	bic r0, r0, #0xc0
	orr r0, r0, r2, lsl #6
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_G3dMdlSetMdlCullMode

	arm_func_start NNS_G3dMdlSetMdlPolygonID
NNS_G3dMdlSetMdlPolygonID: ; 0x020C3064
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C30C4
	adds ip, lr, #4
	beq _020C30B0
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C30B0
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C30B4
_020C30B0:
	mov r1, #0
_020C30B4:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C30C8
_020C30C4:
	mov r1, #0
_020C30C8:
	ldr r0, [r1, #0xc]
	bic r0, r0, #0x3f000000
	orr r0, r0, r2, lsl #24
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_G3dMdlSetMdlPolygonID

	arm_func_start NNS_G3dMdlSetMdlAlpha
NNS_G3dMdlSetMdlAlpha: ; 0x020C30DC
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C313C
	adds ip, lr, #4
	beq _020C3128
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C3128
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C312C
_020C3128:
	mov r1, #0
_020C312C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C3140
_020C313C:
	mov r1, #0
_020C3140:
	ldr r0, [r1, #0xc]
	bic r0, r0, #0x1f0000
	orr r0, r0, r2, lsl #16
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_G3dMdlSetMdlAlpha

	arm_func_start NNS_G3dMdlSetMdlFogEnableFlag
NNS_G3dMdlSetMdlFogEnableFlag: ; 0x020C3154
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C31B4
	adds ip, lr, #4
	beq _020C31A0
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C31A0
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C31A4
_020C31A0:
	mov r1, #0
_020C31A4:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C31B8
_020C31B4:
	mov r1, #0
_020C31B8:
	ldr r0, [r1, #0xc]
	cmp r2, #0
	orrne r0, r0, #0x8000
	biceq r0, r0, #0x8000
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_G3dMdlSetMdlFogEnableFlag

	arm_func_start NNS_G3dMdlSetMdlDepthTestCond
NNS_G3dMdlSetMdlDepthTestCond: ; 0x020C31D0
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C3230
	adds ip, lr, #4
	beq _020C321C
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C321C
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C3220
_020C321C:
	mov r1, #0
_020C3220:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C3234
_020C3230:
	mov r1, #0
_020C3234:
	ldr r0, [r1, #0xc]
	cmp r2, #0
	orrne r0, r0, #0x4000
	biceq r0, r0, #0x4000
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_G3dMdlSetMdlDepthTestCond

	arm_func_start NNS_G3dMdlSetMdl1Dot
NNS_G3dMdlSetMdl1Dot: ; 0x020C324C
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C32AC
	adds ip, lr, #4
	beq _020C3298
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C3298
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C329C
_020C3298:
	mov r1, #0
_020C329C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C32B0
_020C32AC:
	mov r1, #0
_020C32B0:
	ldr r0, [r1, #0xc]
	cmp r2, #0
	orrne r0, r0, #0x2000
	biceq r0, r0, #0x2000
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_G3dMdlSetMdl1Dot

	arm_func_start NNS_G3dMdlSetMdlFarClip
NNS_G3dMdlSetMdlFarClip: ; 0x020C32C8
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C3328
	adds ip, lr, #4
	beq _020C3314
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C3314
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C3318
_020C3314:
	mov r1, #0
_020C3318:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C332C
_020C3328:
	mov r1, #0
_020C332C:
	ldr r0, [r1, #0xc]
	cmp r2, #0
	orrne r0, r0, #0x1000
	biceq r0, r0, #0x1000
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_G3dMdlSetMdlFarClip

	arm_func_start NNS_G3dMdlSetMdlXLDepthUpdate
NNS_G3dMdlSetMdlXLDepthUpdate: ; 0x020C3344
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldrne r3, [r0, #8]
	cmpne r3, #0
	addne lr, r0, r3
	moveq lr, #0
	cmp lr, #0
	beq _020C33A4
	adds ip, lr, #4
	beq _020C3390
	ldrb r0, [lr, #5]
	cmp r1, r0
	bhs _020C3390
	ldrh r3, [lr, #0xa]
	ldrh r0, [ip, r3]
	add r3, ip, r3
	add r3, r3, #4
	mla r1, r0, r1, r3
	b _020C3394
_020C3390:
	mov r1, #0
_020C3394:
	cmp r1, #0
	ldrne r0, [r1]
	addne r1, lr, r0
	bne _020C33A8
_020C33A4:
	mov r1, #0
_020C33A8:
	ldr r0, [r1, #0xc]
	cmp r2, #0
	orrne r0, r0, #0x800
	biceq r0, r0, #0x800
	str r0, [r1, #0xc]
	ldmia sp!, {r3, pc}
	arm_func_end NNS_G3dMdlSetMdlXLDepthUpdate

	arm_func_start NNS_G3dMdlGetMdlLightEnableFlag
NNS_G3dMdlGetMdlLightEnableFlag: ; 0x020C33C0
	cmp r0, #0
	ldrne r2, [r0, #8]
	cmpne r2, #0
	addne ip, r0, r2
	moveq ip, #0
	cmp ip, #0
	beq _020C341C
	adds r3, ip, #4
	beq _020C3408
	ldrb r0, [ip, #5]
	cmp r1, r0
	bhs _020C3408
	ldrh r2, [ip, #0xa]
	ldrh r0, [r3, r2]
	add r2, r3, r2
	add r2, r2, #4
	mla r1, r0, r1, r2
	b _020C340C
_020C3408:
	mov r1, #0
_020C340C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r0, ip, r0
	bne _020C3420
_020C341C:
	mov r0, #0
_020C3420:
	ldr r0, [r0, #0xc]
	and r0, r0, #0xf
	bx lr
	arm_func_end NNS_G3dMdlGetMdlLightEnableFlag

	arm_func_start NNS_G3dMdlGetMdlFogEnableFlag
NNS_G3dMdlGetMdlFogEnableFlag: ; 0x020C342C
	cmp r0, #0
	ldrne r2, [r0, #8]
	cmpne r2, #0
	addne ip, r0, r2
	moveq ip, #0
	cmp ip, #0
	beq _020C3488
	adds r3, ip, #4
	beq _020C3474
	ldrb r0, [ip, #5]
	cmp r1, r0
	bhs _020C3474
	ldrh r2, [ip, #0xa]
	ldrh r0, [r3, r2]
	add r2, r3, r2
	add r2, r2, #4
	mla r1, r0, r1, r2
	b _020C3478
_020C3474:
	mov r1, #0
_020C3478:
	cmp r1, #0
	ldrne r0, [r1]
	addne r0, ip, r0
	bne _020C348C
_020C3488:
	mov r0, #0
_020C348C:
	ldr r0, [r0, #0xc]
	and r0, r0, #0x8000
	bx lr
	arm_func_end NNS_G3dMdlGetMdlFogEnableFlag

	arm_func_start NNS_G3dMdlSetMdlDiffAll
NNS_G3dMdlSetMdlDiffAll: ; 0x020C3498
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C34B4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlDiff
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C34B4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlDiffAll

	arm_func_start NNS_G3dMdlSetMdlAmbAll
NNS_G3dMdlSetMdlAmbAll: ; 0x020C34D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C34F4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlAmb
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C34F4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlAmbAll

	arm_func_start NNS_G3dMdlSetMdlSpecAll
NNS_G3dMdlSetMdlSpecAll: ; 0x020C3518
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C3534:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlSpec
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C3534
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlSpecAll

	arm_func_start NNS_G3dMdlSetMdlEmiAll
NNS_G3dMdlSetMdlEmiAll: ; 0x020C3558
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C3574:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlEmi
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C3574
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlEmiAll

	arm_func_start NNS_G3dMdlSetMdlLightEnableFlagAll
NNS_G3dMdlSetMdlLightEnableFlagAll: ; 0x020C3598
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C35B4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlLightEnableFlag
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C35B4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlLightEnableFlagAll

	arm_func_start NNS_G3dMdlSetMdlPolygonModeAll
NNS_G3dMdlSetMdlPolygonModeAll: ; 0x020C35D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C35F4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlPolygonMode
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C35F4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlPolygonModeAll

	arm_func_start NNS_G3dMdlSetMdlCullModeAll
NNS_G3dMdlSetMdlCullModeAll: ; 0x020C3618
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C3634:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlCullMode
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C3634
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlCullModeAll

	arm_func_start NNS_G3dMdlSetMdlPolygonIDAll
NNS_G3dMdlSetMdlPolygonIDAll: ; 0x020C3658
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C3674:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlPolygonID
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C3674
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlPolygonIDAll

	arm_func_start NNS_G3dMdlSetMdlAlphaAll
NNS_G3dMdlSetMdlAlphaAll: ; 0x020C3698
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C36B4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlAlpha
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C36B4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlAlphaAll

	arm_func_start NNS_G3dMdlSetMdlFogEnableFlagAll
NNS_G3dMdlSetMdlFogEnableFlagAll: ; 0x020C36D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C36F4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlFogEnableFlag
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C36F4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlFogEnableFlagAll

	arm_func_start NNS_G3dMdlSetMdlDepthTestCondAll
NNS_G3dMdlSetMdlDepthTestCondAll: ; 0x020C3718
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C3734:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlDepthTestCond
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C3734
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlDepthTestCondAll

	arm_func_start NNS_G3dMdlSetMdl1DotAll
NNS_G3dMdlSetMdl1DotAll: ; 0x020C3758
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C3774:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdl1Dot
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C3774
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdl1DotAll

	arm_func_start NNS_G3dMdlSetMdlFarClipAll
NNS_G3dMdlSetMdlFarClipAll: ; 0x020C3798
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C37B4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlFarClip
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C37B4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlFarClipAll

	arm_func_start NNS_G3dMdlSetMdlXLDepthUpdateAll
NNS_G3dMdlSetMdlXLDepthUpdateAll: ; 0x020C37D8
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrb r0, [r6, #0x18]
	mov r5, r1
	mov r4, #0
	cmp r0, #0
	ldmlsia sp!, {r4, r5, r6, pc}
_020C37F4:
	mov r0, r6
	mov r1, r4
	mov r2, r5
	bl NNS_G3dMdlSetMdlXLDepthUpdate
	ldrb r0, [r6, #0x18]
	add r4, r4, #1
	cmp r4, r0
	blo _020C37F4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_G3dMdlSetMdlXLDepthUpdateAll

	arm_func_start NNS_G3dGetResDataByName
NNS_G3dGetResDataByName: ; 0x020C3818
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r5, [r0, #1]
	cmp r5, #0x10
	bhs _020C38E8
	ldmia r1, {r2, r3, ip, lr}
	cmp r5, #0
	mov r1, #0
	bls _020C39D0
	mov r4, r1
	mov r7, r1
_020C384C:
	cmp r0, #0
	beq _020C3878
	ldrb r6, [r0, #1]
	cmp r1, r6
	bhs _020C3878
	ldrh r6, [r0, #6]
	add r8, r0, r6
	ldrh r6, [r8, #2]
	add r6, r8, r6
	add r8, r6, r4
	b _020C387C
_020C3878:
	mov r8, r7
_020C387C:
	ldr r6, [r8]
	cmp r6, r2
	ldreq r6, [r8, #4]
	cmpeq r6, r3
	ldreq r6, [r8, #8]
	cmpeq r6, ip
	ldreq r6, [r8, #0xc]
	cmpeq r6, lr
	bne _020C38D0
	cmp r0, #0
	beq _020C38C8
	cmp r1, r5
	bhs _020C38C8
	ldrh r3, [r0, #6]
	ldrh r2, [r0, r3]
	add r0, r0, r3
	add r0, r0, #4
	mla r0, r2, r1, r0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C38C8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C38D0:
	ldrb r6, [r0, #1]
	add r1, r1, #1
	add r4, r4, #0x10
	cmp r1, r6
	blo _020C384C
	b _020C39D0
_020C38E8:
	add r4, r0, #8
	ldrb r3, [r4, #1]
	cmp r3, #0
	beq _020C39D0
	ldrb r7, [r4, r3, lsl #2]
	ldrb r2, [r4]
	add r6, r4, r3, lsl #2
	cmp r2, r7
	bls _020C393C
_020C390C:
	mov r2, r7, asr #5
	ldr r3, [r1, r2, lsl #2]
	and r2, r7, #0x1f
	mov r2, r3, lsr r2
	and r2, r2, #1
	add r2, r6, r2
	ldrb r3, [r2, #1]
	ldrb r2, [r6]
	ldrb r7, [r4, r3, lsl #2]
	add r6, r4, r3, lsl #2
	cmp r2, r7
	bhi _020C390C
_020C393C:
	cmp r0, #0
	ldrb r2, [r6, #3]
	beq _020C3968
	cmp r2, r5
	bhs _020C3968
	ldrh r3, [r0, #6]
	add r4, r0, r3
	ldrh r3, [r4, #2]
	add r3, r4, r3
	add r6, r3, r2, lsl #4
	b _020C396C
_020C3968:
	mov r6, #0
_020C396C:
	ldr r4, [r6]
	ldr r3, [r1]
	cmp r4, r3
	ldreq r4, [r6, #4]
	ldreq r3, [r1, #4]
	cmpeq r4, r3
	ldreq r4, [r6, #8]
	ldreq r3, [r1, #8]
	cmpeq r4, r3
	ldreq r3, [r6, #0xc]
	ldreq r1, [r1, #0xc]
	cmpeq r3, r1
	bne _020C39D0
	cmp r0, #0
	beq _020C39C8
	cmp r2, r5
	bhs _020C39C8
	ldrh r3, [r0, #6]
	ldrh r1, [r0, r3]
	add r0, r0, r3
	add r0, r0, #4
	mla r0, r1, r2, r0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C39C8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C39D0:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end NNS_G3dGetResDataByName

	arm_func_start NNS_G3dGetResDictIdxByName
NNS_G3dGetResDictIdxByName: ; 0x020C39D8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	cmp r1, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r2, [r0, #1]
	cmp r2, #0x10
	bhs _020C3A7C
	cmp r2, #0
	ldmia r1, {r2, r3, ip, lr}
	mov r1, #0
	bls _020C3B38
	mov r4, r1
	mov r6, r1
_020C3A0C:
	cmp r0, #0
	beq _020C3A38
	ldrb r5, [r0, #1]
	cmp r1, r5
	bhs _020C3A38
	ldrh r5, [r0, #6]
	add r7, r0, r5
	ldrh r5, [r7, #2]
	add r5, r7, r5
	add r7, r5, r4
	b _020C3A3C
_020C3A38:
	mov r7, r6
_020C3A3C:
	ldr r5, [r7]
	cmp r5, r2
	ldreq r5, [r7, #4]
	cmpeq r5, r3
	ldreq r5, [r7, #8]
	cmpeq r5, ip
	ldreq r5, [r7, #0xc]
	cmpeq r5, lr
	moveq r0, r1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r5, [r0, #1]
	add r1, r1, #1
	add r4, r4, #0x10
	cmp r1, r5
	blo _020C3A0C
	b _020C3B38
_020C3A7C:
	add r5, r0, #8
	ldrb r4, [r5, #1]
	cmp r4, #0
	beq _020C3B38
	ldrb r7, [r5, r4, lsl #2]
	ldrb r3, [r5]
	add r6, r5, r4, lsl #2
	cmp r3, r7
	bls _020C3AD0
_020C3AA0:
	mov r3, r7, asr #5
	ldr r4, [r1, r3, lsl #2]
	and r3, r7, #0x1f
	mov r3, r4, lsr r3
	and r3, r3, #1
	add r3, r6, r3
	ldrb r4, [r3, #1]
	ldrb r3, [r6]
	ldrb r7, [r5, r4, lsl #2]
	add r6, r5, r4, lsl #2
	cmp r3, r7
	bhi _020C3AA0
_020C3AD0:
	cmp r0, #0
	ldrb r3, [r6, #3]
	beq _020C3AFC
	cmp r3, r2
	bhs _020C3AFC
	ldrh r2, [r0, #6]
	add r2, r0, r2
	ldrh r0, [r2, #2]
	add r0, r2, r0
	add r4, r0, r3, lsl #4
	b _020C3B00
_020C3AFC:
	mov r4, #0
_020C3B00:
	ldr r2, [r4]
	ldr r0, [r1]
	cmp r2, r0
	ldreq r2, [r4, #4]
	ldreq r0, [r1, #4]
	cmpeq r2, r0
	ldreq r2, [r4, #8]
	ldreq r0, [r1, #8]
	cmpeq r2, r0
	ldreq r2, [r4, #0xc]
	ldreq r0, [r1, #0xc]
	cmpeq r2, r0
	moveq r0, r3
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_020C3B38:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNS_G3dGetResDictIdxByName

	arm_func_start NNS_G3dGetMdlSet
NNS_G3dGetMdlSet: ; 0x020C3B40
	ldrh r1, [r0, #0xc]
	ldr r1, [r0, r1]
	add r0, r0, r1
	bx lr
	arm_func_end NNS_G3dGetMdlSet

	arm_func_start NNS_G3dGetTex
NNS_G3dGetTex: ; 0x020C3B50
	ldrh r2, [r0, #0xc]
	ldrh r1, [r0, #0xe]
	add r3, r0, r2
	cmp r1, #1
	bne _020C3B80
	ldr r2, [r0]
	ldr r1, _020C3B8C ; =0x30585442
	cmp r2, r1
	ldreq r1, [r3]
	addeq r0, r0, r1
	movne r0, #0
	bx lr
_020C3B80:
	ldr r1, [r3, #4]
	add r0, r0, r1
	bx lr
	.align 2, 0
_020C3B8C: .word 0x30585442
	arm_func_end NNS_G3dGetTex

	arm_func_start NNS_G3dGetAnmByIdx
NNS_G3dGetAnmByIdx: ; 0x020C3B90
	cmp r0, #0
	beq _020C3BE4
	ldrh r2, [r0, #0xc]
	ldr r2, [r0, r2]
	add ip, r0, r2
	adds r3, ip, #8
	beq _020C3BD0
	ldrb r0, [ip, #9]
	cmp r1, r0
	bhs _020C3BD0
	ldrh r2, [ip, #0xe]
	ldrh r0, [r3, r2]
	add r2, r3, r2
	add r2, r2, #4
	mla r1, r0, r1, r2
	b _020C3BD4
_020C3BD0:
	mov r1, #0
_020C3BD4:
	cmp r1, #0
	ldrne r0, [r1]
	addne r0, ip, r0
	bxne lr
_020C3BE4:
	mov r0, #0
	bx lr
	arm_func_end NNS_G3dGetAnmByIdx

	arm_func_start NNSi_G3dGetTexPatAnmTexNameByIdx
NNSi_G3dGetTexPatAnmTexNameByIdx: ; 0x020C3BEC
	cmp r0, #0
	beq _020C3C10
	ldrb r2, [r0, #6]
	cmp r1, r2
	bhs _020C3C10
	ldrh r2, [r0, #8]
	add r0, r0, r2
	add r0, r0, r1, lsl #4
	bx lr
_020C3C10:
	mov r0, #0
	bx lr
	arm_func_end NNSi_G3dGetTexPatAnmTexNameByIdx

	arm_func_start NNSi_G3dGetTexPatAnmPlttNameByIdx
NNSi_G3dGetTexPatAnmPlttNameByIdx: ; 0x020C3C18
	cmp r0, #0
	beq _020C3C3C
	ldrb r2, [r0, #7]
	cmp r1, r2
	bhs _020C3C3C
	ldrh r2, [r0, #0xa]
	add r0, r0, r2
	add r0, r0, r1, lsl #4
	bx lr
_020C3C3C:
	mov r0, #0
	bx lr
	arm_func_end NNSi_G3dGetTexPatAnmPlttNameByIdx

	arm_func_start NNSi_G3dGetTexPatAnmFV
NNSi_G3dGetTexPatAnmFV: ; 0x020C3C44
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r2
	bl NNSi_G3dGetTexPatAnmDataByIdx
	ldrsh r1, [r0, #4]
	ldrh r3, [r0, #6]
	mul r2, r1, r4
	add r3, r5, r3
	mov r2, r2, lsr #0xc
	b _020C3C70
_020C3C6C:
	sub r2, r2, #1
_020C3C70:
	cmp r2, #0
	beq _020C3C88
	mov r1, r2, lsl #2
	ldrh r1, [r3, r1]
	cmp r1, r4
	bhs _020C3C6C
_020C3C88:
	ldrh r1, [r0]
	b _020C3C94
_020C3C90:
	add r2, r2, #1
_020C3C94:
	add r0, r2, #1
	cmp r0, r1
	bhs _020C3CB0
	add r0, r3, r2, lsl #2
	ldrh r0, [r0, #4]
	cmp r0, r4
	bls _020C3C90
_020C3CB0:
	add r0, r3, r2, lsl #2
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNSi_G3dGetTexPatAnmFV

	arm_func_start NNSi_G3dGetTexPatAnmDataByIdx
NNSi_G3dGetTexPatAnmDataByIdx: ; 0x020C3CB8
	adds r3, r0, #0xc
	beq _020C3CE4
	ldrb r2, [r0, #0xd]
	cmp r1, r2
	bhs _020C3CE4
	ldrh r0, [r0, #0x12]
	ldrh r2, [r3, r0]
	add r0, r3, r0
	add r0, r0, #4
	mla r0, r2, r1, r0
	bx lr
_020C3CE4:
	mov r0, #0
	bx lr
	arm_func_end NNSi_G3dGetTexPatAnmDataByIdx

	arm_func_start NNSi_G3dAnmObjInitNsBca
NNSi_G3dAnmObjInitNsBca: ; 0x020C3CEC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	ldr r0, _020C3D64 ; =_02110A08
	str r4, [r5, #8]
	ldr r0, [r0]
	add r1, r5, #0x1a
	str r0, [r5, #0xc]
	ldrb r2, [r2, #0x17]
	mov r0, #0
	strb r2, [r5, #0x19]
	mov r2, r2, lsl #1
	bl MIi_CpuClear16
	ldrh r0, [r4, #6]
	add r3, r4, #0x14
	mov r2, #0
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, pc}
_020C3D34:
	mov r0, r2, lsl #1
	ldrh r1, [r3, r0]
	add r0, r5, r2, lsl #1
	add r2, r2, #1
	ldr r1, [r4, r1]
	mov r1, r1, lsr #0x18
	orr r1, r1, #0x100
	strh r1, [r0, #0x1a]
	ldrh r0, [r4, #6]
	cmp r2, r0
	blo _020C3D34
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C3D64: .word _02110A08
	arm_func_end NNSi_G3dAnmObjInitNsBca

	arm_func_start NNSi_G3dAnmCalcNsBca
NNSi_G3dAnmCalcNsBca: ; 0x020C3D68
	stmdb sp!, {r3, lr}
	mov r3, r0
	ldr r0, [r1, #8]
	ldr ip, [r1]
	ldrh r1, [r0, #4]
	cmp ip, r1, lsl #12
	mov r1, r1, lsl #0xc
	subge ip, r1, #1
	bge _020C3D94
	cmp ip, #0
	movlt ip, #0
_020C3D94:
	mov r1, r2
	mov r2, ip
	bl getJntSRTAnmResult_
	ldmia sp!, {r3, pc}
	arm_func_end NNSi_G3dAnmCalcNsBca

	arm_func_start getMdlTrans_
getMdlTrans_: ; 0x020C3DA4
	ldr r1, _020C3E38 ; =_021DA700
	ldr r2, [r1]
	ldr r1, [r2]
	ldr ip, [r2, #0xd4]
	ldrb r3, [r1, #1]
	cmp ip, #0
	beq _020C3DFC
	beq _020C3DE8
	ldrb r1, [ip, #1]
	cmp r3, r1
	bhs _020C3DE8
	ldrh r2, [ip, #6]
	ldrh r1, [ip, r2]
	add r2, ip, r2
	add r2, r2, #4
	mla r2, r1, r3, r2
	b _020C3DEC
_020C3DE8:
	mov r2, #0
_020C3DEC:
	cmp r2, #0
	ldrne r1, [r2]
	addne r2, ip, r1
	bne _020C3E00
_020C3DFC:
	mov r2, #0
_020C3E00:
	ldrh r1, [r2]
	tst r1, #1
	beq _020C3E1C
	ldr r1, [r0]
	orr r1, r1, #4
	str r1, [r0]
	bx lr
_020C3E1C:
	ldr r1, [r2, #4]
	str r1, [r0, #0x4c]
	ldr r1, [r2, #8]
	str r1, [r0, #0x50]
	ldr r1, [r2, #0xc]
	str r1, [r0, #0x54]
	bx lr
	.align 2, 0
_020C3E38: .word _021DA700
	arm_func_end getMdlTrans_

	arm_func_start getMdlScale_
getMdlScale_: ; 0x020C3E3C
	stmdb sp!, {r4, lr}
	ldr r1, _020C3EC8 ; =_021DA700
	ldr ip, [r1]
	ldr r2, [ip]
	ldr r4, [ip, #0xd4]
	ldrb lr, [r2, #1]
	cmp r4, #0
	beq _020C3E98
	beq _020C3E84
	ldrb r1, [r4, #1]
	cmp lr, r1
	bhs _020C3E84
	ldrh r3, [r4, #6]
	ldrh r1, [r4, r3]
	add r3, r4, r3
	add r3, r3, #4
	mla r3, r1, lr, r3
	b _020C3E88
_020C3E84:
	mov r3, #0
_020C3E88:
	cmp r3, #0
	ldrne r1, [r3]
	addne r1, r4, r1
	bne _020C3E9C
_020C3E98:
	mov r1, #0
_020C3E9C:
	ldrh r3, [r1], #4
	tst r3, #1
	addeq r1, r1, #0xc
	tst r3, #2
	bne _020C3EBC
	tst r3, #8
	addne r1, r1, #4
	addeq r1, r1, #0x10
_020C3EBC:
	ldr ip, [ip, #0xe8]
	blx ip
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C3EC8: .word _021DA700
	arm_func_end getMdlScale_

	arm_func_start getMdlRot_
getMdlRot_: ; 0x020C3ECC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r1, _020C4038 ; =_021DA700
	mov r8, r0
	ldr r1, [r1]
	ldr r0, [r1]
	ldr r3, [r1, #0xd4]
	ldrb r2, [r0, #1]
	cmp r3, #0
	beq _020C3F2C
	beq _020C3F18
	ldrb r0, [r3, #1]
	cmp r2, r0
	bhs _020C3F18
	ldrh r1, [r3, #6]
	ldrh r0, [r3, r1]
	add r1, r3, r1
	add r1, r1, #4
	mla r1, r0, r2, r1
	b _020C3F1C
_020C3F18:
	mov r1, #0
_020C3F1C:
	cmp r1, #0
	ldrne r0, [r1]
	addne r5, r3, r0
	bne _020C3F30
_020C3F2C:
	mov r5, #0
_020C3F30:
	ldrh r0, [r5]
	add r1, r5, #4
	tst r0, #1
	addeq r1, r1, #0xc
	tst r0, #2
	bne _020C4028
	tst r0, #8
	beq _020C3FDC
	and r2, r0, #0xf0
	add r0, r8, #0x28
	mov r4, r2, asr #4
	ldrsh r7, [r1]
	ldrsh r6, [r1, #2]
	bl MI_Zero36B
	ldrh r0, [r5]
	ldr r1, _020C403C ; =_021094B8
	mov r3, #0x1000
	tst r0, #0x100
	ldr r0, _020C4040 ; =_021094B8 + 1
	ldrb r1, [r1, r4, lsl #2]
	ldrb r0, [r0, r4, lsl #2]
	rsbne r3, r3, #0
	add r2, r8, r4, lsl #2
	str r3, [r2, #0x28]
	add r1, r8, r1, lsl #2
	str r7, [r1, #0x28]
	add r0, r8, r0, lsl #2
	str r6, [r0, #0x28]
	ldrh r0, [r5]
	tst r0, #0x200
	ldr r0, _020C4044 ; =_021094B8 + 2
	rsbne r6, r6, #0
	ldrb r0, [r0, r4, lsl #2]
	add r0, r8, r0, lsl #2
	str r6, [r0, #0x28]
	ldrh r0, [r5]
	tst r0, #0x400
	ldr r0, _020C4048 ; =_021094B8 + 3
	rsbne r7, r7, #0
	ldrb r0, [r0, r4, lsl #2]
	add r0, r8, r0, lsl #2
	str r7, [r0, #0x28]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C3FDC:
	ldrsh r0, [r5, #2]
	str r0, [r8, #0x28]
	ldrsh r0, [r1]
	str r0, [r8, #0x2c]
	ldrsh r0, [r1, #2]
	str r0, [r8, #0x30]
	ldrsh r0, [r1, #4]
	str r0, [r8, #0x34]
	ldrsh r0, [r1, #6]
	str r0, [r8, #0x38]
	ldrsh r0, [r1, #8]
	str r0, [r8, #0x3c]
	ldrsh r0, [r1, #0xa]
	str r0, [r8, #0x40]
	ldrsh r0, [r1, #0xc]
	str r0, [r8, #0x44]
	ldrsh r0, [r1, #0xe]
	str r0, [r8, #0x48]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C4028:
	ldr r0, [r8]
	orr r0, r0, #2
	str r0, [r8]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020C4038: .word _021DA700
_020C403C: .word _021094B8
_020C4040: .word _021094B8 + 1
_020C4044: .word _021094B8 + 2
_020C4048: .word _021094B8 + 3
	arm_func_end getMdlRot_

	arm_func_start getJntSRTAnmResult_
getJntSRTAnmResult_: ; 0x020C404C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov sb, r0
	add r0, sb, r1, lsl #1
	ldrh r0, [r0, #0x14]
	mov r7, r3
	mov r8, r2
	ldr r4, [sb, r0]
	add r1, sb, r0
	tst r4, #1
	movne r0, #7
	strne r0, [r7]
	bne _020C43C4
	ldr r0, _020C43F8 ; =0x00000FFF
	add r5, r1, #4
	tst r8, r0
	beq _020C40A0
	ldr r0, [sb, #8]
	tst r0, #1
	movne r6, #1
	bne _020C40A4
_020C40A0:
	mov r6, #0
_020C40A4:
	mov r0, #0
	str r0, [r7]
	tst r4, #6
	bne _020C4184
	tst r4, #8
	bne _020C40F0
	cmp r6, #0
	mov r1, r8
	mov r2, r5
	beq _020C40DC
	mov r3, sb
	add r0, r7, #0x4c
	bl getTransDataEx_
	b _020C40E8
_020C40DC:
	mov r3, sb
	add r0, r7, #0x4c
	bl getTransData_
_020C40E8:
	add r5, r5, #8
	b _020C40F8
_020C40F0:
	ldr r0, [r5], #4
	str r0, [r7, #0x4c]
_020C40F8:
	tst r4, #0x10
	bne _020C4134
	cmp r6, #0
	mov r1, r8
	mov r2, r5
	beq _020C4120
	mov r3, sb
	add r0, r7, #0x50
	bl getTransDataEx_
	b _020C412C
_020C4120:
	mov r3, sb
	add r0, r7, #0x50
	bl getTransData_
_020C412C:
	add r5, r5, #8
	b _020C413C
_020C4134:
	ldr r0, [r5], #4
	str r0, [r7, #0x50]
_020C413C:
	tst r4, #0x20
	bne _020C4178
	cmp r6, #0
	mov r1, r8
	mov r2, r5
	beq _020C4164
	mov r3, sb
	add r0, r7, #0x54
	bl getTransDataEx_
	b _020C4170
_020C4164:
	mov r3, sb
	add r0, r7, #0x54
	bl getTransData_
_020C4170:
	add r5, r5, #8
	b _020C41A4
_020C4178:
	ldr r0, [r5], #4
	str r0, [r7, #0x54]
	b _020C41A4
_020C4184:
	tst r4, #2
	beq _020C419C
	ldr r0, [r7]
	orr r0, r0, #4
	str r0, [r7]
	b _020C41A4
_020C419C:
	mov r0, r7
	bl getMdlTrans_
_020C41A4:
	tst r4, #0xc0
	bne _020C4268
	tst r4, #0x100
	bne _020C41E8
	cmp r6, #0
	mov r1, r8
	mov r2, r5
	beq _020C41D4
	mov r3, sb
	add r0, r7, #0x28
	bl getRotDataEx_
	b _020C41E0
_020C41D4:
	mov r3, sb
	add r0, r7, #0x28
	bl getRotData_
_020C41E0:
	add r5, r5, #8
	b _020C4288
_020C41E8:
	ldr r1, [sb, #0xc]
	ldr r2, [sb, #0x10]
	ldr r3, [r5]
	add r0, r7, #0x28
	add r1, sb, r1
	add r2, sb, r2
	bl getRotDataByIdx_
	cmp r0, #0
	beq _020C4260
	ldr ip, [r7, #0x3c]
	ldr r0, [r7, #0x2c]
	ldr r3, [r7, #0x28]
	ldr fp, [r7, #0x38]
	ldr r1, [r7, #0x30]
	ldr r2, [r7, #0x34]
	mul sl, r0, ip
	mul lr, r1, fp
	sub sl, sl, lr
	mov sl, sl, asr #0xc
	mul lr, r1, r2
	mul r1, r3, ip
	sub r1, lr, r1
	mul fp, r3, fp
	mul r2, r0, r2
	sub r0, fp, r2
	str sl, [r7, #0x40]
	mov r1, r1, asr #0xc
	str r1, [r7, #0x44]
	mov r0, r0, asr #0xc
	str r0, [r7, #0x48]
_020C4260:
	add r5, r5, #4
	b _020C4288
_020C4268:
	tst r4, #0x40
	beq _020C4280
	ldr r0, [r7]
	orr r0, r0, #2
	str r0, [r7]
	b _020C4288
_020C4280:
	mov r0, r7
	bl getMdlRot_
_020C4288:
	tst r4, #0x600
	bne _020C439C
	tst r4, #0x800
	bne _020C42D8
	cmp r6, #0
	add r0, sp, #0x10
	mov r1, r8
	beq _020C42B8
	mov r2, r5
	mov r3, sb
	bl getScaleDataEx_
	b _020C42C4
_020C42B8:
	mov r2, r5
	mov r3, sb
	bl getScaleData_
_020C42C4:
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #0x14]
	str r1, [sp, #0x18]
	str r0, [sp, #0x24]
	b _020C42E8
_020C42D8:
	ldr r0, [r5]
	str r0, [sp, #0x18]
	ldr r0, [r5, #4]
	str r0, [sp, #0x24]
_020C42E8:
	tst r4, #0x1000
	bne _020C4330
	cmp r6, #0
	add r0, sp, #8
	mov r1, r8
	beq _020C4310
	mov r3, sb
	add r2, r5, #8
	bl getScaleDataEx_
	b _020C431C
_020C4310:
	mov r3, sb
	add r2, r5, #8
	bl getScaleData_
_020C431C:
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	str r1, [sp, #0x1c]
	str r0, [sp, #0x28]
	b _020C4340
_020C4330:
	ldr r0, [r5, #8]
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0xc]
	str r0, [sp, #0x28]
_020C4340:
	tst r4, #0x2000
	bne _020C4388
	cmp r6, #0
	add r0, sp, #0
	mov r1, r8
	beq _020C4368
	mov r3, sb
	add r2, r5, #0x10
	bl getScaleDataEx_
	b _020C4374
_020C4368:
	mov r3, sb
	add r2, r5, #0x10
	bl getScaleData_
_020C4374:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [sp, #0x20]
	str r0, [sp, #0x2c]
	b _020C43C4
_020C4388:
	ldr r0, [r5, #0x10]
	str r0, [sp, #0x20]
	ldr r0, [r5, #0x14]
	str r0, [sp, #0x2c]
	b _020C43C4
_020C439C:
	tst r4, #0x200
	beq _020C43B4
	ldr r0, [r7]
	orr r0, r0, #1
	str r0, [r7]
	b _020C43C4
_020C43B4:
	mov r0, r7
	bl getMdlScale_
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C43C4:
	ldr r0, [r7]
	add r1, sp, #0x18
	tst r0, #1
	ldr r0, _020C43FC ; =_021DA700
	movne r3, #4
	ldr r4, [r0]
	moveq r3, #0
	ldr r2, [r4]
	ldr r4, [r4, #0xe8]
	mov r0, r7
	blx r4
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C43F8: .word 0x00000FFF
_020C43FC: .word _021DA700
	arm_func_end getJntSRTAnmResult_

	arm_func_start getTransData_
getTransData_: ; 0x020C4400
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, [r2, #4]
	ldr ip, [r2]
	mov r5, r1, asr #0xc
	tst ip, #0xc0000000
	add r1, r3, r4
	beq _020C453C
	ldr r2, _020C455C ; =0x1FFF0000
	tst ip, #0x40000000
	and r2, ip, r2
	mov r3, r2, lsr #0x10
	beq _020C4458
	tst r5, #1
	beq _020C4450
	cmp r5, r3
	movhi r2, r3, lsr #1
	addhi r5, r2, #1
	bhi _020C453C
	mov r4, r5, lsr #1
	b _020C44FC
_020C4450:
	mov r5, r5, lsr #1
	b _020C453C
_020C4458:
	ands r2, r5, #3
	beq _020C44F4
	cmp r5, r3
	addhi r5, r2, r3, lsr #2
	bhi _020C453C
	tst r5, #1
	beq _020C44EC
	tst r5, #2
	movne r5, r5, lsr #2
	addne r2, r5, #1
	moveq r2, r5, lsr #2
	addeq r5, r2, #1
	tst ip, #0x20000000
	beq _020C44B4
	mov r3, r2, lsl #1
	mov r2, r5, lsl #1
	ldrsh r3, [r1, r3]
	ldrsh r1, [r1, r2]
	add r2, r3, r3, lsl #1
	add r1, r2, r1
	mov r1, r1, asr #2
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_020C44B4:
	ldr ip, [r1, r2, lsl #2]
	mov r2, #3
	mov r3, #0
	umull r4, lr, ip, r2
	mla lr, ip, r3, lr
	mov r3, ip, asr #0x1f
	mla lr, r3, r2, lr
	ldr r1, [r1, r5, lsl #2]
	adds r2, r4, r1
	adc r1, lr, r1, asr #31
	mov r2, r2, lsr #2
	orr r2, r2, r1, lsl #30
	str r2, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_020C44EC:
	mov r4, r5, lsr #2
	b _020C44FC
_020C44F4:
	mov r5, r5, lsr #2
	b _020C453C
_020C44FC:
	tst ip, #0x20000000
	beq _020C4520
	mov r3, r4, lsl #1
	add r2, r1, r4, lsl #1
	ldrsh r3, [r1, r3]
	ldrsh r1, [r2, #2]
	add r1, r3, r1
	mov r1, r1, asr #1
	b _020C4534
_020C4520:
	add r2, r1, r4, lsl #2
	ldr r2, [r2, #4]
	ldr r3, [r1, r4, lsl #2]
	mov r1, r2, asr #1
	add r1, r1, r3, asr #1
_020C4534:
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_020C453C:
	tst ip, #0x20000000
	ldreq r1, [r1, r5, lsl #2]
	streq r1, [r0]
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r2, r5, lsl #1
	ldrsh r1, [r1, r2]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C455C: .word 0x1FFF0000
	arm_func_end getTransData_

	arm_func_start getTransDataEx_
getTransDataEx_: ; 0x020C4560
	stmdb sp!, {r3, r4, r5, lr}
	ldrh r4, [r3, #4]
	ldr ip, [r2, #4]
	mov lr, r1, asr #0xc
	sub r4, r4, #1
	cmp r4, r1, asr #12
	add ip, r3, ip
	ldr r2, [r2]
	bne _020C45FC
	tst r2, #0xc0000000
	beq _020C45A0
	tst r2, #0x40000000
	andne r4, lr, #1
	addne lr, r4, lr, lsr #1
	andeq r4, lr, #3
	addeq lr, r4, lr, lsr #2
_020C45A0:
	ldr r3, [r3, #8]
	tst r3, #2
	beq _020C45E4
	ldr r3, _020C46B0 ; =0x00000FFF
	tst r2, #0x20000000
	and r2, r1, r3
	ldreq r3, [ip, lr, lsl #2]
	ldreq r1, [ip]
	beq _020C45D0
	mov r1, lr, lsl #1
	ldrsh r3, [ip, r1]
	ldrsh r1, [ip]
_020C45D0:
	sub r1, r1, r3
	mul r1, r2, r1
	add r1, r3, r1, asr #12
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_020C45E4:
	tst r2, #0x20000000
	movne r1, lr, lsl #1
	ldrnesh r1, [ip, r1]
	ldreq r1, [ip, lr, lsl #2]
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
_020C45FC:
	tst r2, #0xc0000000
	beq _020C4660
	ldr r3, _020C46B4 ; =0x1FFF0000
	tst r2, #0x40000000
	and r4, r2, r3
	mov r4, r4, lsr #0x10
	beq _020C4638
	cmp lr, r4
	movhs lr, r4, lsr #1
	bhs _020C4660
	mov lr, lr, lsr #1
	and r1, r1, r3, lsr #16
	mov r4, #2
	mov r5, #1
	b _020C4670
_020C4638:
	cmp lr, r4
	andhs r3, lr, #3
	addhs lr, r3, lr, lsr #2
	bhs _020C4660
	ldr r3, _020C46B8 ; =0x00003FFF
	mov lr, lr, lsr #2
	and r1, r1, r3
	mov r4, #4
	mov r5, #2
	b _020C4670
_020C4660:
	ldr r3, _020C46B0 ; =0x00000FFF
	mov r4, #1
	and r1, r1, r3
	mov r5, #0
_020C4670:
	tst r2, #0x20000000
	addeq r2, ip, lr, lsl #2
	ldreq ip, [ip, lr, lsl #2]
	ldreq r2, [r2, #4]
	beq _020C4694
	add r2, ip, lr, lsl #1
	mov r3, lr, lsl #1
	ldrsh ip, [ip, r3]
	ldrsh r2, [r2, #2]
_020C4694:
	sub r2, r2, ip
	mul r3, ip, r4
	mul r2, r1, r2
	add r1, r3, r2, asr #12
	mov r1, r1, asr r5
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C46B0: .word 0x00000FFF
_020C46B4: .word 0x1FFF0000
_020C46B8: .word 0x00003FFF
	arm_func_end getTransDataEx_

	arm_func_start getScaleData_
getScaleData_: ; 0x020C46BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r4, [r2, #4]
	ldr r5, [r2]
	mov r6, r1, asr #0xc
	tst r5, #0xc0000000
	add r1, r3, r4
	beq _020C4808
	ldr r2, _020C48AC ; =0x1FFF0000
	tst r5, #0x40000000
	and r2, r5, r2
	mov r3, r2, lsr #0x10
	beq _020C4714
	tst r6, #1
	beq _020C470C
	cmp r6, r3
	movhi r2, r3, lsr #1
	addhi r6, r2, #1
	bhi _020C4808
	mov r4, r6, lsr #1
	b _020C4840
_020C470C:
	mov r6, r6, lsr #1
	b _020C4808
_020C4714:
	ands r2, r6, #3
	beq _020C4804
	cmp r6, r3
	addhi r6, r2, r3, lsr #2
	bhi _020C4808
	tst r6, #1
	beq _020C47FC
	tst r6, #2
	movne r3, r6, lsr #2
	addne r2, r3, #1
	moveq r2, r6, lsr #2
	addeq r3, r2, #1
	tst r5, #0x20000000
	beq _020C4790
	mov r5, r2, lsl #2
	mov r4, r3, lsl #2
	ldrsh r6, [r1, r5]
	ldrsh r5, [r1, r4]
	add r2, r1, r2, lsl #2
	add r4, r6, r6, lsl #1
	add r4, r5, r4
	mov r4, r4, asr #2
	str r4, [r0]
	add r1, r1, r3, lsl #2
	ldrsh r3, [r2, #2]
	ldrsh r2, [r1, #2]
	add r1, r3, r3, lsl #1
	add r1, r2, r1
	mov r1, r1, asr #2
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020C4790:
	ldr r4, [r1, r2, lsl #3]
	mov ip, #3
	mov lr, #0
	umull r6, r5, r4, ip
	mla r5, r4, lr, r5
	mov r4, r4, asr #0x1f
	ldr r7, [r1, r3, lsl #3]
	add r2, r1, r2, lsl #3
	mla r5, r4, ip, r5
	adds r6, r6, r7
	adc r4, r5, r7, asr #31
	mov r5, r6, lsr #2
	orr r5, r5, r4, lsl #30
	str r5, [r0]
	add r1, r1, r3, lsl #3
	ldr r2, [r2, #4]
	ldr r1, [r1, #4]
	umull r4, r3, r2, ip
	mla r3, r2, lr, r3
	mov r2, r2, asr #0x1f
	mla r3, r2, ip, r3
	adds r4, r4, r1
	adc r1, r3, r1, asr #31
	mov r2, r4, lsr #2
	orr r2, r2, r1, lsl #30
	str r2, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020C47FC:
	mov r4, r6, lsr #2
	b _020C4840
_020C4804:
	mov r6, r6, lsr #2
_020C4808:
	tst r5, #0x20000000
	beq _020C4828
	mov r2, r6, lsl #2
	ldrsh r2, [r1, r2]
	add r1, r1, r6, lsl #2
	str r2, [r0]
	ldrsh r1, [r1, #2]
	b _020C4838
_020C4828:
	ldr r2, [r1, r6, lsl #3]
	add r1, r1, r6, lsl #3
	str r2, [r0]
	ldr r1, [r1, #4]
_020C4838:
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020C4840:
	tst r5, #0x20000000
	beq _020C487C
	mov r2, r4, lsl #2
	add r3, r1, r4, lsl #2
	ldrsh r2, [r1, r2]
	ldrsh r1, [r3, #4]
	add r1, r2, r1
	mov r1, r1, asr #1
	str r1, [r0]
	ldrsh r2, [r3, #2]
	ldrsh r1, [r3, #6]
	add r1, r2, r1
	mov r1, r1, asr #1
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020C487C:
	add r3, r1, r4, lsl #3
	ldr r2, [r1, r4, lsl #3]
	ldr r1, [r3, #8]
	add r1, r2, r1
	mov r1, r1, asr #1
	str r1, [r0]
	ldr r2, [r3, #4]
	ldr r1, [r3, #0xc]
	add r1, r2, r1
	mov r1, r1, asr #1
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020C48AC: .word 0x1FFF0000
	arm_func_end getScaleData_

	arm_func_start getScaleDataEx_
getScaleDataEx_: ; 0x020C48B0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldrh r4, [r3, #4]
	ldr r5, [r2, #4]
	mov lr, r1, asr #0xc
	sub r4, r4, #1
	cmp r4, r1, asr #12
	add ip, r3, r5
	ldr r2, [r2]
	bne _020C4938
	tst r2, #0xc0000000
	beq _020C48F0
	tst r2, #0x40000000
	andne r4, lr, #1
	addne lr, r4, lr, lsr #1
	andeq r4, lr, #3
	addeq lr, r4, lr, lsr #2
_020C48F0:
	ldr r3, [r3, #8]
	tst r3, #2
	movne r3, #0
	bne _020C49B4
	tst r2, #0x20000000
	beq _020C4920
	mov r1, lr, lsl #2
	ldrsh r2, [ip, r1]
	add r1, ip, lr, lsl #2
	str r2, [r0]
	ldrsh r1, [r1, #2]
	b _020C4930
_020C4920:
	ldr r2, [ip, lr, lsl #3]
	add r1, ip, lr, lsl #3
	str r2, [r0]
	ldr r1, [r1, #4]
_020C4930:
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020C4938:
	tst r2, #0xc0000000
	beq _020C49B0
	ldr r4, _020C4A38 ; =0x1FFF0000
	tst r2, #0x40000000
	and r3, r2, r4
	mov r3, r3, lsr #0x10
	beq _020C497C
	cmp lr, r3
	movhs lr, r3, lsr #1
	addhs r3, lr, #1
	bhs _020C49B4
	mov lr, lr, lsr #1
	add r3, lr, #1
	and r1, r1, r4, lsr #16
	mov r4, #2
	mov r5, #1
	b _020C49C4
_020C497C:
	cmp lr, r3
	blo _020C4994
	and r3, lr, #3
	add lr, r3, lr, lsr #2
	add r3, lr, #1
	b _020C49B4
_020C4994:
	ldr r4, _020C4A3C ; =0x00003FFF
	mov lr, lr, lsr #2
	add r3, lr, #1
	and r1, r1, r4
	mov r4, #4
	mov r5, #2
	b _020C49C4
_020C49B0:
	add r3, lr, #1
_020C49B4:
	ldr r5, _020C4A40 ; =0x00000FFF
	mov r4, #1
	and r1, r1, r5
	mov r5, #0
_020C49C4:
	tst r2, #0x20000000
	beq _020C49F0
	mov r2, lr, lsl #2
	add r7, ip, lr, lsl #2
	mov r6, r3, lsl #2
	add r3, ip, r3, lsl #2
	ldrsh r2, [ip, r2]
	ldrsh lr, [r7, #2]
	ldrsh r7, [ip, r6]
	ldrsh r3, [r3, #2]
	b _020C4A04
_020C49F0:
	add r7, ip, lr, lsl #3
	ldmia r7, {r2, lr}
	add r6, ip, r3, lsl #3
	ldr r7, [ip, r3, lsl #3]
	ldr r3, [r6, #4]
_020C4A04:
	sub ip, r7, r2
	sub r3, r3, lr
	mul r6, r2, r4
	mul r2, r1, ip
	add r2, r6, r2, asr #12
	mov r6, r2, asr r5
	mul r4, lr, r4
	mul r2, r1, r3
	add r1, r4, r2, asr #12
	mov r1, r1, asr r5
	str r6, [r0]
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020C4A38: .word 0x1FFF0000
_020C4A3C: .word 0x00003FFF
_020C4A40: .word 0x00000FFF
	arm_func_end getScaleDataEx_

	arm_func_start getRotData_
getRotData_: ; 0x020C4A44
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x48
	ldr sb, [r2]
	mov r4, r3
	ldr r2, [r2, #4]
	mov r5, r0
	tst sb, #0xc0000000
	mov r3, r1, asr #0xc
	add r8, r4, r2
	ldr r7, [r4, #0xc]
	ldr r6, [r4, #0x10]
	beq _020C4DC8
	ldr r0, _020C4E58 ; =0x1FFF0000
	tst sb, #0x40000000
	and r0, sb, r0
	mov r1, r0, lsr #0x10
	beq _020C4AB0
	tst r3, #1
	beq _020C4AA8
	cmp r3, r1
	movhi r0, r1, lsr #1
	addhi r3, r0, #1
	bhi _020C4DC8
	mov sb, r3, lsr #1
	b _020C4C70
_020C4AA8:
	mov r3, r3, lsr #1
	b _020C4DC8
_020C4AB0:
	ands r0, r3, #3
	beq _020C4C68
	cmp r3, r1
	addhi r3, r0, r1, lsr #2
	bhi _020C4DC8
	tst r3, #1
	beq _020C4C60
	tst r3, #2
	movne sb, r3, lsr #2
	addne r0, sb, #1
	moveq r0, r3, lsr #2
	addeq sb, r0, #1
	mov r0, r0, lsl #1
	ldrh r3, [r8, r0]
	mov r0, r5
	add r1, r4, r7
	add r2, r4, r6
	mov sl, #0
	bl getRotDataByIdx_
	mov r1, sb, lsl #1
	ldrh r3, [r8, r1]
	orr sl, sl, r0
	add r0, sp, #0x24
	add r1, r4, r7
	add r2, r4, r6
	bl getRotDataByIdx_
	ldr r1, [r5]
	ldr r2, [sp, #0x24]
	add r1, r1, r1, lsl #1
	add r1, r2, r1
	str r1, [r5]
	ldr r1, [r5, #4]
	ldr r2, [sp, #0x28]
	add r1, r1, r1, lsl #1
	add r1, r2, r1
	str r1, [r5, #4]
	ldr r1, [r5, #8]
	ldr r2, [sp, #0x2c]
	add r1, r1, r1, lsl #1
	add r1, r2, r1
	str r1, [r5, #8]
	ldr r1, [r5, #0xc]
	ldr r2, [sp, #0x30]
	add r1, r1, r1, lsl #1
	add r1, r2, r1
	str r1, [r5, #0xc]
	ldr r1, [r5, #0x10]
	orr sl, sl, r0
	ldr r2, [sp, #0x34]
	add r0, r1, r1, lsl #1
	add r0, r2, r0
	str r0, [r5, #0x10]
	ldr r0, [r5, #0x14]
	ldr r1, [sp, #0x38]
	add r0, r0, r0, lsl #1
	add r2, r1, r0
	mov r0, r5
	mov r1, r5
	str r2, [r5, #0x14]
	bl VEC_Normalize
	add r0, r5, #0xc
	mov r1, r0
	bl VEC_Normalize
	cmp sl, #0
	bne _020C4C04
	ldr r0, [r5, #0x18]
	ldr r1, [sp, #0x3c]
	add r0, r0, r0, lsl #1
	add r0, r1, r0
	str r0, [r5, #0x18]
	ldr r0, [r5, #0x1c]
	ldr r1, [sp, #0x40]
	add r0, r0, r0, lsl #1
	add r0, r1, r0
	str r0, [r5, #0x1c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x44]
	add r0, r0, r0, lsl #1
	add r2, r1, r0
	add r0, r5, #0x18
	mov r1, r0
	str r2, [r5, #0x20]
	bl VEC_Normalize
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C4C04:
	ldr sb, [r5, #0x14]
	ldr r6, [r5, #4]
	ldr r4, [r5, #0x10]
	ldr r2, [r5, #8]
	mul r1, r6, sb
	mul r0, r2, r4
	sub r0, r1, r0
	ldr r7, [r5, #0xc]
	ldr r8, [r5]
	mov r3, r0, asr #0xc
	mul r1, r2, r7
	mul r0, r8, sb
	sub r2, r1, r0
	mul r1, r8, r4
	mul r0, r6, r7
	sub r0, r1, r0
	str r3, [r5, #0x18]
	mov r1, r2, asr #0xc
	str r1, [r5, #0x1c]
	mov r0, r0, asr #0xc
	add sp, sp, #0x48
	str r0, [r5, #0x20]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C4C60:
	mov sb, r3, lsr #2
	b _020C4C70
_020C4C68:
	mov r3, r3, lsr #2
	b _020C4DC8
_020C4C70:
	mov r0, sb, lsl #1
	ldrh r3, [r8, r0]
	mov r0, r5
	add r1, r4, r7
	add r2, r4, r6
	bl getRotDataByIdx_
	add r1, r8, sb, lsl #1
	ldrh r3, [r1, #2]
	orr r8, r0, #0
	add r0, sp, #0
	add r1, r4, r7
	add r2, r4, r6
	bl getRotDataByIdx_
	ldr r2, [r5]
	ldr r1, [sp]
	orr r8, r8, r0
	add r0, r2, r1
	str r0, [r5]
	ldr r2, [r5, #4]
	ldr r1, [sp, #4]
	mov r0, r5
	add r1, r2, r1
	str r1, [r5, #4]
	ldr r3, [r5, #8]
	ldr r2, [sp, #8]
	mov r1, r5
	add r2, r3, r2
	str r2, [r5, #8]
	ldr r3, [r5, #0xc]
	ldr r2, [sp, #0xc]
	add r2, r3, r2
	str r2, [r5, #0xc]
	ldr r3, [r5, #0x10]
	ldr r2, [sp, #0x10]
	add r2, r3, r2
	str r2, [r5, #0x10]
	ldr r3, [r5, #0x14]
	ldr r2, [sp, #0x14]
	add r2, r3, r2
	str r2, [r5, #0x14]
	bl VEC_Normalize
	add r0, r5, #0xc
	mov r1, r0
	bl VEC_Normalize
	cmp r8, #0
	bne _020C4D6C
	ldr r2, [r5, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0x18
	add r1, r2, r1
	str r1, [r5, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r2, [sp, #0x1c]
	mov r1, r0
	add r2, r3, r2
	str r2, [r5, #0x1c]
	ldr r3, [r5, #0x20]
	ldr r2, [sp, #0x20]
	add r2, r3, r2
	str r2, [r5, #0x20]
	bl VEC_Normalize
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C4D6C:
	ldr sb, [r5, #0x14]
	ldr r6, [r5, #4]
	ldr r4, [r5, #0x10]
	ldr r2, [r5, #8]
	mul r1, r6, sb
	mul r0, r2, r4
	sub r0, r1, r0
	ldr r7, [r5, #0xc]
	ldr r8, [r5]
	mov r3, r0, asr #0xc
	mul r1, r2, r7
	mul r0, r8, sb
	sub r2, r1, r0
	mul r1, r8, r4
	mul r0, r6, r7
	sub r0, r1, r0
	str r3, [r5, #0x18]
	mov r1, r2, asr #0xc
	str r1, [r5, #0x1c]
	mov r0, r0, asr #0xc
	add sp, sp, #0x48
	str r0, [r5, #0x20]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C4DC8:
	mov r0, r3, lsl #1
	ldrh r3, [r8, r0]
	mov r0, r5
	add r1, r4, r7
	add r2, r4, r6
	bl getRotDataByIdx_
	cmp r0, #0
	beq _020C4E44
	ldr sb, [r5, #0x14]
	ldr r6, [r5, #4]
	ldr r4, [r5, #0x10]
	ldr r2, [r5, #8]
	mul r1, r6, sb
	mul r0, r2, r4
	sub r0, r1, r0
	ldr r7, [r5, #0xc]
	ldr r8, [r5]
	mov r3, r0, asr #0xc
	mul r1, r2, r7
	mul r0, r8, sb
	sub r2, r1, r0
	mul r1, r8, r4
	mul r0, r6, r7
	sub r0, r1, r0
	str r3, [r5, #0x18]
	mov r1, r2, asr #0xc
	str r1, [r5, #0x1c]
	mov r0, r0, asr #0xc
	add sp, sp, #0x48
	str r0, [r5, #0x20]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C4E44:
	add r0, r5, #0x18
	mov r1, r0
	bl VEC_Normalize
	add sp, sp, #0x48
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020C4E58: .word 0x1FFF0000
	arm_func_end getRotData_

	arm_func_start getRotDataEx_
getRotDataEx_: ; 0x020C4E5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x48
	mov sb, r3
	ldrh r3, [sb, #4]
	ldr r4, [r2, #4]
	mov sl, r0
	sub r0, r3, #1
	cmp r0, r1, asr #12
	add r8, sb, r4
	mov r0, r1, asr #0xc
	ldr r4, [sb, #0xc]
	ldr fp, [sb, #0x10]
	ldr r3, [r2]
	bne _020C4F50
	tst r3, #0xc0000000
	beq _020C4EB0
	tst r3, #0x40000000
	andne r2, r0, #1
	addne r0, r2, r0, lsr #1
	andeq r2, r0, #3
	addeq r0, r2, r0, lsr #2
_020C4EB0:
	ldr r2, [sb, #8]
	tst r2, #2
	movne r5, #0
	bne _020C4FC4
	mov r0, r0, lsl #1
	ldrh r3, [r8, r0]
	mov r0, sl
	add r1, sb, r4
	add r2, sb, fp
	bl getRotDataByIdx_
	cmp r0, #0
	beq _020C4F3C
	ldr r8, [sl, #0x14]
	ldr r5, [sl, #4]
	ldr r4, [sl, #0x10]
	ldr r2, [sl, #8]
	mul r1, r5, r8
	mul r0, r2, r4
	sub r0, r1, r0
	ldr r6, [sl, #0xc]
	ldr r7, [sl]
	mov r3, r0, asr #0xc
	mul r1, r2, r6
	mul r0, r7, r8
	sub r2, r1, r0
	mul r1, r7, r4
	mul r0, r5, r6
	sub r0, r1, r0
	str r3, [sl, #0x18]
	mov r1, r2, asr #0xc
	str r1, [sl, #0x1c]
	mov r0, r0, asr #0xc
	add sp, sp, #0x48
	str r0, [sl, #0x20]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C4F3C:
	add r0, sl, #0x18
	mov r1, r0
	bl VEC_Normalize
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C4F50:
	tst r3, #0xc0000000
	beq _020C4FC0
	ldr r2, _020C5194 ; =0x1FFF0000
	tst r3, #0x40000000
	and r3, r3, r2
	mov r3, r3, lsr #0x10
	beq _020C4F90
	cmp r0, r3
	movhs r0, r3, lsr #1
	addhs r5, r0, #1
	bhs _020C4FC4
	mov r0, r0, lsr #1
	add r5, r0, #1
	and r6, r1, r2, lsr #16
	mov r7, #2
	b _020C4FD0
_020C4F90:
	cmp r0, r3
	blo _020C4FA8
	and r2, r0, #3
	add r0, r2, r0, lsr #2
	add r5, r0, #1
	b _020C4FC4
_020C4FA8:
	ldr r2, _020C5198 ; =0x00003FFF
	mov r0, r0, lsr #2
	add r5, r0, #1
	and r6, r1, r2
	mov r7, #4
	b _020C4FD0
_020C4FC0:
	add r5, r0, #1
_020C4FC4:
	ldr r2, _020C519C ; =0x00000FFF
	mov r7, #1
	and r6, r1, r2
_020C4FD0:
	mov r0, r0, lsl #1
	ldrh r3, [r8, r0]
	add r0, sp, #0x24
	add r1, sb, r4
	add r2, sb, fp
	bl getRotDataByIdx_
	mov r1, r5, lsl #1
	ldrh r3, [r8, r1]
	orr r5, r0, #0
	add r0, sp, #0
	add r1, sb, r4
	add r2, sb, fp
	bl getRotDataByIdx_
	ldr r3, [sp, #0x24]
	ldr r1, [sp]
	mul r2, r3, r7
	sub r1, r1, r3
	mul r1, r6, r1
	add r1, r2, r1, asr #12
	str r1, [sl]
	ldr r3, [sp, #0x28]
	ldr r1, [sp, #4]
	mul r2, r3, r7
	sub r1, r1, r3
	mul r1, r6, r1
	add r1, r2, r1, asr #12
	str r1, [sl, #4]
	ldr r3, [sp, #0x2c]
	ldr r1, [sp, #8]
	mul r2, r3, r7
	sub r1, r1, r3
	mul r1, r6, r1
	add r1, r2, r1, asr #12
	str r1, [sl, #8]
	ldr r3, [sp, #0x30]
	ldr r1, [sp, #0xc]
	mul r2, r3, r7
	sub r1, r1, r3
	mul r1, r6, r1
	add r1, r2, r1, asr #12
	str r1, [sl, #0xc]
	ldr r2, [sp, #0x34]
	ldr r1, [sp, #0x10]
	orr r5, r5, r0
	sub r0, r1, r2
	mul r1, r2, r7
	mul r0, r6, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x10]
	ldr r2, [sp, #0x38]
	ldr r0, [sp, #0x14]
	mul r1, r2, r7
	sub r0, r0, r2
	mul r0, r6, r0
	add r2, r1, r0, asr #12
	mov r0, sl
	mov r1, sl
	str r2, [sl, #0x14]
	bl VEC_Normalize
	add r0, sl, #0xc
	mov r1, r0
	bl VEC_Normalize
	cmp r5, #0
	bne _020C5138
	ldr r2, [sp, #0x3c]
	ldr r0, [sp, #0x18]
	mul r1, r2, r7
	sub r0, r0, r2
	mul r0, r6, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x18]
	ldr r2, [sp, #0x40]
	ldr r0, [sp, #0x1c]
	mul r1, r2, r7
	sub r0, r0, r2
	mul r0, r6, r0
	add r0, r1, r0, asr #12
	str r0, [sl, #0x1c]
	ldr r2, [sp, #0x44]
	ldr r0, [sp, #0x20]
	mul r1, r2, r7
	sub r0, r0, r2
	mul r0, r6, r0
	add r2, r1, r0, asr #12
	add r0, sl, #0x18
	mov r1, r0
	str r2, [sl, #0x20]
	bl VEC_Normalize
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C5138:
	ldr r8, [sl, #0x14]
	ldr r5, [sl, #4]
	ldr r7, [sl]
	ldr r4, [sl, #0x10]
	ldr r2, [sl, #8]
	ldr r6, [sl, #0xc]
	mul r1, r5, r8
	mul r0, r2, r4
	sub r0, r1, r0
	mov r3, r0, asr #0xc
	mul r1, r2, r6
	mul r0, r7, r8
	sub r2, r1, r0
	mul r1, r7, r4
	mul r0, r5, r6
	sub r0, r1, r0
	str r3, [sl, #0x18]
	mov r1, r2, asr #0xc
	str r1, [sl, #0x1c]
	mov r0, r0, asr #0xc
	str r0, [sl, #0x20]
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C5194: .word 0x1FFF0000
_020C5198: .word 0x00003FFF
_020C519C: .word 0x00000FFF
	arm_func_end getRotDataEx_

	arm_func_start getRotDataByIdx_
getRotDataByIdx_: ; 0x020C51A0
	stmdb sp!, {r3, r4, r5, lr}
	tst r3, #0x8000
	beq _020C5258
	mov r4, #0
	str r4, [r0, #0x20]
	str r4, [r0, #0x1c]
	str r4, [r0, #0x18]
	str r4, [r0, #0x14]
	str r4, [r0, #0x10]
	ldr r2, _020C52F8 ; =0x00007FFF
	str r4, [r0, #0xc]
	str r4, [r0, #8]
	and r2, r3, r2
	add r3, r2, r2, lsl #1
	str r4, [r0, #4]
	add r2, r1, r3, lsl #1
	str r4, [r0]
	mov r3, r3, lsl #1
	ldrsh r1, [r1, r3]
	ldrsh ip, [r2, #2]
	ldrsh r3, [r2, #4]
	tst r1, #0x10
	subne r5, r4, #0x1000
	ldr r4, _020C52FC ; =_021094B8
	and r1, r1, #0xf
	ldr lr, _020C5300 ; =_021094B8 + 1
	moveq r5, #0x1000
	ldrb r4, [r4, r1, lsl #2]
	str r5, [r0, r1, lsl #2]
	ldrb lr, [lr, r1, lsl #2]
	str ip, [r0, r4, lsl #2]
	str r3, [r0, lr, lsl #2]
	ldrsh lr, [r2]
	tst lr, #0x20
	ldr lr, _020C5304 ; =_021094B8 + 2
	rsbne r3, r3, #0
	ldrb lr, [lr, r1, lsl #2]
	str r3, [r0, lr, lsl #2]
	ldrsh r2, [r2]
	tst r2, #0x40
	ldr r2, _020C5308 ; =_021094B8 + 3
	rsbne ip, ip, #0
	ldrb r1, [r2, r1, lsl #2]
	str ip, [r0, r1, lsl #2]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020C5258:
	ldr r1, _020C52F8 ; =0x00007FFF
	and r1, r3, r1
	add r3, r1, r1, lsl #2
	add r1, r2, r3, lsl #1
	ldrsh lr, [r1, #8]
	mov ip, r3, lsl #1
	mov r3, lr, asr #3
	str r3, [r0, #0x10]
	ldrsh ip, [r2, ip]
	and r2, lr, #7
	mov r2, r2, lsl #0x10
	mov r3, ip, asr #3
	str r3, [r0]
	ldrsh r3, [r1, #2]
	and ip, ip, #7
	orr lr, ip, r2, asr #13
	mov r2, r3, asr #3
	str r2, [r0, #4]
	ldrsh ip, [r1, #4]
	mov r2, lr, lsl #0x10
	and lr, r3, #7
	mov r3, ip, asr #3
	str r3, [r0, #8]
	ldrsh r3, [r1, #6]
	orr r1, lr, r2, asr #13
	mov r1, r1, lsl #0x10
	and r2, ip, #7
	orr r1, r2, r1, asr #13
	mov r1, r1, lsl #0x10
	and r2, r3, #7
	orr r1, r2, r1, asr #13
	mov r1, r1, lsl #0x10
	mov r1, r1, asr #0x10
	mov r2, r3, asr #3
	mov r1, r1, lsl #0x13
	str r2, [r0, #0xc]
	mov r1, r1, asr #0x13
	str r1, [r0, #0x14]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C52F8: .word 0x00007FFF
_020C52FC: .word _021094B8
_020C5300: .word _021094B8 + 1
_020C5304: .word _021094B8 + 2
_020C5308: .word _021094B8 + 3
	arm_func_end getRotDataByIdx_

	arm_func_start GetMatColAnmValue_
GetMatColAnmValue_: ; 0x020C530C
	tst r1, #0x20000000
	movne r0, r1, lsl #0x10
	movne r0, r0, lsr #0x10
	bxne lr
	mov r3, r1, lsl #0x10
	tst r1, #0xc0000000
	add r0, r0, r3, lsr #16
	moveq r1, r2, lsl #1
	ldreqh r0, [r0, r1]
	bxeq lr
	ldr r3, _020C546C ; =0x1FFF0000
	tst r1, #0x40000000
	and r1, r1, r3
	mov r3, r1, lsr #0x10
	beq _020C537C
	tst r2, #1
	beq _020C5370
	cmp r2, r3
	bls _020C5368
	bic r1, r3, #1
	add r0, r0, r1
	ldrh r0, [r0, #2]
	bx lr
_020C5368:
	mov r1, r2, lsr #1
	b _020C5424
_020C5370:
	bic r1, r2, #1
	ldrh r0, [r0, r1]
	bx lr
_020C537C:
	ands r1, r2, #3
	beq _020C5414
	cmp r2, r3
	bls _020C53A0
	mov r2, r3, lsr #2
	mov r1, r1, lsl #1
	add r0, r0, r2, lsl #1
	ldrh r0, [r1, r0]
	bx lr
_020C53A0:
	tst r2, #1
	beq _020C540C
	tst r2, #2
	movne r3, r2, lsr #2
	addne r1, r3, #1
	moveq r1, r2, lsr #2
	mov r2, r1, lsl #1
	addeq r3, r1, #1
	mov r1, r3, lsl #1
	ldrh r2, [r0, r2]
	ldrh ip, [r0, r1]
	ldr r0, _020C5470 ; =0x00007C1F
	and r1, r2, #0x3e0
	and r3, r2, r0
	add r2, r1, r1, lsl #1
	and r1, ip, #0x3e0
	add r1, r2, r1
	add r3, r3, r3, lsl #1
	and r2, ip, r0
	add r2, r3, r2
	mov r1, r1, lsr #2
	and r2, r0, r2, lsr #2
	and r0, r1, #0x3e0
	orr r0, r2, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
_020C540C:
	mov r1, r2, lsr #2
	b _020C5424
_020C5414:
	mov r1, r2, lsr #2
	mov r1, r1, lsl #1
	ldrh r0, [r0, r1]
	bx lr
_020C5424:
	mov r2, r1, lsl #1
	add r1, r0, r1, lsl #1
	ldrh r3, [r0, r2]
	ldrh ip, [r1, #2]
	ldr r0, _020C5470 ; =0x00007C1F
	and r2, r3, #0x3e0
	and r1, ip, #0x3e0
	add r1, r2, r1
	mov r1, r1, lsr #1
	and r3, r3, r0
	and r2, ip, r0
	add r2, r3, r2
	and r2, r0, r2, lsr #1
	and r0, r1, #0x3e0
	orr r0, r2, r0
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_020C546C: .word 0x1FFF0000
_020C5470: .word 0x00007C1F
	arm_func_end GetMatColAnmValue_

	arm_func_start GetMatColAnmuAlphaValue_
GetMatColAnmuAlphaValue_: ; 0x020C5474
	tst r1, #0x20000000
	movne r0, r1, lsl #0x10
	movne r0, r0, lsr #0x10
	bxne lr
	mov r3, r1, lsl #0x10
	add r3, r0, r3, lsr #16
	tst r1, #0xc0000000
	ldreqb r0, [r3, r2]
	bxeq lr
	ldr r0, _020C555C ; =0x1FFF0000
	tst r1, #0x40000000
	and r0, r1, r0
	mov r0, r0, lsr #0x10
	beq _020C54E8
	tst r2, #1
	beq _020C54E0
	cmp r2, r0
	addhi r0, r3, r0, lsr #1
	ldrhib r0, [r0, #1]
	bxhi lr
	add r0, r3, r2, lsr #1
	ldrb r1, [r3, r2, lsr #1]
	ldrb r0, [r0, #1]
	add r0, r1, r0
	mov r0, r0, lsl #0xf
	mov r0, r0, lsr #0x10
	bx lr
_020C54E0:
	ldrb r0, [r3, r2, lsr #1]
	bx lr
_020C54E8:
	ands r1, r2, #3
	beq _020C5554
	cmp r2, r0
	addhi r0, r3, r0, lsr #2
	ldrhib r0, [r1, r0]
	bxhi lr
	tst r2, #1
	beq _020C5538
	tst r2, #2
	movne r2, r2, lsr #2
	addne r0, r2, #1
	moveq r0, r2, lsr #2
	ldrb r1, [r3, r0]
	addeq r2, r0, #1
	ldrb r0, [r3, r2]
	add r1, r1, r1, lsl #1
	add r0, r1, r0
	mov r0, r0, lsl #0xe
	mov r0, r0, lsr #0x10
	bx lr
_020C5538:
	add r0, r3, r2, lsr #2
	ldrb r1, [r3, r2, lsr #2]
	ldrb r0, [r0, #1]
	add r0, r1, r0
	mov r0, r0, lsl #0xf
	mov r0, r0, lsr #0x10
	bx lr
_020C5554:
	ldrb r0, [r3, r2, lsr #2]
	bx lr
	.align 2, 0
_020C555C: .word 0x1FFF0000
	arm_func_end GetMatColAnmuAlphaValue_

	arm_func_start NNSi_G3dAnmObjInitNsBma
NNSi_G3dAnmObjInitNsBma: ; 0x020C5560
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	cmp r2, #0
	ldrne r0, [r2, #8]
	mov sb, r1
	cmpne r0, #0
	addne r7, r2, r0
	ldr r0, _020C5630 ; =_02110A14
	add r1, sl, #0x1a
	ldr r3, [r0]
	mov r0, #0
	str r3, [sl, #0xc]
	ldrb r2, [r2, #0x18]
	moveq r7, #0
	strb r2, [sl, #0x19]
	mov r2, r2, lsl #1
	bl MIi_CpuClear16
	ldrb r0, [sb, #9]
	mov r6, #0
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, r6
	add r5, sb, #8
	mov fp, r6
	mvn r4, #0
_020C55C4:
	cmp r5, #0
	beq _020C55F0
	ldrb r0, [sb, #9]
	cmp r6, r0
	bhs _020C55F0
	ldrh r0, [sb, #0xe]
	add r1, r5, r0
	ldrh r0, [r1, #2]
	add r0, r1, r0
	add r1, r0, r8
	b _020C55F4
_020C55F0:
	mov r1, fp
_020C55F4:
	cmp r7, #0
	moveq r0, r4
	beq _020C5608
	add r0, r7, #4
	bl NNS_G3dGetResDictIdxByName
_020C5608:
	cmp r0, #0
	orrge r1, r6, #0x100
	addge r0, sl, r0, lsl #1
	strgeh r1, [r0, #0x1a]
	ldrb r0, [sb, #9]
	add r6, r6, #1
	add r8, r8, #0x10
	cmp r6, r0
	blo _020C55C4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C5630: .word _02110A14
	arm_func_end NNSi_G3dAnmObjInitNsBma

	arm_func_start NNSi_G3dAnmCalcNsBma
NNSi_G3dAnmCalcNsBma: ; 0x020C5634
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, [r1, #8]
	ldr r1, [r1]
	mov r7, r0
	mov r5, r1, asr #0xc
	adds r3, r4, #8
	beq _020C567C
	ldrb r1, [r4, #9]
	mov r0, r2, lsl #0x10
	mov r2, r0, lsr #0x10
	cmp r1, r0, lsr #16
	bls _020C567C
	ldrh r1, [r4, #0xe]
	ldrh r0, [r3, r1]
	add r1, r3, r1
	add r1, r1, #4
	mla r6, r0, r2, r1
	b _020C5680
_020C567C:
	mov r6, #0
_020C5680:
	ldr r1, [r6]
	mov r0, r4
	mov r2, r5
	bl GetMatColAnmValue_
	mov r8, r0
	ldr r1, [r6, #4]
	mov r0, r4
	mov r2, r5
	bl GetMatColAnmValue_
	ldr r1, [r7, #4]
	orr r0, r8, r0, lsl #16
	tst r1, #0x8000
	movne r1, #1
	moveq r1, #0
	orr r0, r0, r1, lsl #15
	str r0, [r7, #4]
	ldr r1, [r6, #0xc]
	mov r0, r4
	mov r2, r5
	bl GetMatColAnmValue_
	mov r8, r0
	ldr r1, [r6, #8]
	mov r0, r4
	mov r2, r5
	bl GetMatColAnmValue_
	ldr r1, [r7, #8]
	orr r0, r0, r8, lsl #16
	tst r1, #0x8000
	movne r1, #1
	moveq r1, #0
	orr r0, r0, r1, lsl #15
	str r0, [r7, #8]
	ldr r1, [r6, #0x10]
	mov r0, r4
	mov r2, r5
	bl GetMatColAnmuAlphaValue_
	ldr r1, [r7, #0xc]
	bic r1, r1, #0x1f0000
	orr r0, r1, r0, lsl #16
	str r0, [r7, #0xc]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end NNSi_G3dAnmCalcNsBma

	arm_func_start GetTexSRTAnmVectorVal_
GetTexSRTAnmVectorVal_: ; 0x020C5724
	tst r1, #0x20000000
	movne r0, r2
	bxne lr
	tst r1, #0xc0000000
	add r0, r0, r2
	beq _020C57E0
	mov r2, r1, lsl #0x10
	tst r1, #0x40000000
	mov ip, r2, lsr #0x10
	beq _020C5774
	tst r3, #1
	beq _020C576C
	cmp r3, ip
	movhi r2, ip, lsr #1
	addhi r3, r2, #1
	bhi _020C57E0
	mov r3, r3, lsr #1
	b _020C57F4
_020C576C:
	mov r3, r3, lsr #1
	b _020C57E0
_020C5774:
	ands r2, r3, #3
	beq _020C57DC
	cmp r3, ip
	addhi r3, r2, ip, lsr #2
	bhi _020C57E0
	tst r3, #1
	beq _020C57D4
	tst r3, #2
	movne r3, r3, lsr #2
	addne r2, r3, #1
	moveq r2, r3, lsr #2
	addeq r3, r2, #1
	tst r1, #0x10000000
	ldreq r2, [r0, r2, lsl #2]
	ldreq r1, [r0, r3, lsl #2]
	beq _020C57C4
	mov r2, r2, lsl #1
	mov r1, r3, lsl #1
	ldrsh r2, [r0, r2]
	ldrsh r1, [r0, r1]
_020C57C4:
	add r0, r2, r2, lsl #1
	add r0, r0, r1
	mov r0, r0, asr #2
	bx lr
_020C57D4:
	mov r3, r3, lsr #2
	b _020C57F4
_020C57DC:
	mov r3, r3, lsr #2
_020C57E0:
	tst r1, #0x10000000
	movne r1, r3, lsl #1
	ldrnesh r0, [r0, r1]
	ldreq r0, [r0, r3, lsl #2]
	bx lr
_020C57F4:
	tst r1, #0x10000000
	addeq r1, r0, r3, lsl #2
	ldreq r0, [r0, r3, lsl #2]
	ldreq r1, [r1, #4]
	beq _020C5818
	add r1, r0, r3, lsl #1
	mov r2, r3, lsl #1
	ldrsh r0, [r0, r2]
	ldrsh r1, [r1, #2]
_020C5818:
	add r0, r0, r1
	mov r0, r0, asr #1
	bx lr
	arm_func_end GetTexSRTAnmVectorVal_

	arm_func_start GetTexSRTAnmSinCosVal_
GetTexSRTAnmSinCosVal_: ; 0x020C5824
	tst r1, #0x20000000
	movne r0, r2
	bxne lr
	tst r1, #0xc0000000
	add r0, r0, r2
	beq _020C58F4
	mov r2, r1, lsl #0x10
	tst r1, #0x40000000
	mov r2, r2, lsr #0x10
	beq _020C5874
	tst r3, #1
	beq _020C586C
	cmp r3, r2
	movhi r1, r2, lsr #1
	addhi r3, r1, #1
	bhi _020C58F4
	mov r1, r3, lsr #1
	b _020C58FC
_020C586C:
	mov r3, r3, lsr #1
	b _020C58F4
_020C5874:
	ands r1, r3, #3
	beq _020C58F0
	cmp r3, r2
	addhi r3, r1, r2, lsr #2
	bhi _020C58F4
	tst r3, #1
	beq _020C58E8
	tst r3, #2
	movne r3, r3, lsr #2
	addne r1, r3, #1
	moveq r1, r3, lsr #2
	add r2, r0, r1, lsl #2
	mov ip, r1, lsl #2
	addeq r3, r1, #1
	add r1, r0, r3, lsl #2
	ldrsh r2, [r2, #2]
	mov r3, r3, lsl #2
	ldrsh ip, [r0, ip]
	ldrsh r1, [r1, #2]
	ldrsh r3, [r0, r3]
	add r2, r2, r2, lsl #1
	add r0, r2, r1
	add ip, ip, ip, lsl #1
	mov r1, r0, asr #2
	add r2, ip, r3
	mov r0, r2, lsl #0xe
	mov r1, r1, lsl #0x10
	orr r0, r1, r0, lsr #16
	bx lr
_020C58E8:
	mov r1, r3, lsr #2
	b _020C58FC
_020C58F0:
	mov r3, r3, lsr #2
_020C58F4:
	ldr r0, [r0, r3, lsl #2]
	bx lr
_020C58FC:
	add r3, r0, r1, lsl #2
	mov ip, r1, lsl #2
	ldrsh r2, [r3, #2]
	ldrsh r1, [r3, #6]
	ldrsh ip, [r0, ip]
	ldrsh r3, [r3, #4]
	add r0, r2, r1
	mov r1, r0, asr #1
	add r0, ip, r3
	mov r0, r0, lsl #0xf
	mov r1, r1, lsl #0x10
	orr r0, r1, r0, lsr #16
	bx lr
	arm_func_end GetTexSRTAnmSinCosVal_

	arm_func_start GetTexSRTAnm_
GetTexSRTAnm_: ; 0x020C5930
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r7, r0
	mov r6, r2
	mov r5, r3
	adds r3, r7, #8
	beq _020C596C
	ldrb r0, [r7, #9]
	cmp r1, r0
	bhs _020C596C
	ldrh r2, [r7, #0xe]
	ldrh r0, [r3, r2]
	add r2, r3, r2
	add r2, r2, #4
	mla r4, r0, r1, r2
	b _020C5970
_020C596C:
	mov r4, #0
_020C5970:
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x1c]
	mov r0, r7
	mov r3, r6
	ldr r8, [r5]
	bl GetTexSRTAnmVectorVal_
	mov sb, r0
	ldr r1, [r4, #0x20]
	ldr r2, [r4, #0x24]
	mov r0, r7
	mov r3, r6
	bl GetTexSRTAnmVectorVal_
	cmp sb, #0
	cmpeq r0, #0
	strne sb, [r5, #0x24]
	strne r0, [r5, #0x28]
	orreq r8, r8, #4
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x14]
	bicne r8, r8, #4
	mov r0, r7
	mov r3, r6
	bl GetTexSRTAnmSinCosVal_
	cmp r0, #0x10000000
	orreq r8, r8, #2
	beq _020C59E8
	strh r0, [r5, #0x20]
	mov r0, r0, lsr #0x10
	strh r0, [r5, #0x22]
	bic r8, r8, #2
_020C59E8:
	mov r0, r7
	mov r3, r6
	ldmia r4, {r1, r2}
	bl GetTexSRTAnmVectorVal_
	mov sb, r0
	ldr r1, [r4, #8]
	ldr r2, [r4, #0xc]
	mov r0, r7
	mov r3, r6
	bl GetTexSRTAnmVectorVal_
	cmp sb, #0x1000
	cmpeq r0, #0x1000
	orreq r8, r8, #1
	strne sb, [r5, #0x18]
	strne r0, [r5, #0x1c]
	bicne r8, r8, #1
	str r8, [r5]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end GetTexSRTAnm_

	arm_func_start NNSi_G3dAnmObjInitNsBta
NNSi_G3dAnmObjInitNsBta: ; 0x020C5A30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	cmp r2, #0
	ldrne r0, [r2, #8]
	mov sb, r1
	cmpne r0, #0
	addne r7, r2, r0
	ldr r0, _020C5B00 ; =_02110A0C
	add r1, sl, #0x1a
	ldr r3, [r0]
	mov r0, #0
	str r3, [sl, #0xc]
	ldrb r2, [r2, #0x18]
	moveq r7, #0
	strb r2, [sl, #0x19]
	mov r2, r2, lsl #1
	bl MIi_CpuClear16
	ldrb r0, [sb, #9]
	mov r6, #0
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, r6
	add r5, sb, #8
	mov fp, r6
	mvn r4, #0
_020C5A94:
	cmp r5, #0
	beq _020C5AC0
	ldrb r0, [sb, #9]
	cmp r6, r0
	bhs _020C5AC0
	ldrh r0, [sb, #0xe]
	add r1, r5, r0
	ldrh r0, [r1, #2]
	add r0, r1, r0
	add r1, r0, r8
	b _020C5AC4
_020C5AC0:
	mov r1, fp
_020C5AC4:
	cmp r7, #0
	moveq r0, r4
	beq _020C5AD8
	add r0, r7, #4
	bl NNS_G3dGetResDictIdxByName
_020C5AD8:
	cmp r0, #0
	orrge r1, r6, #0x100
	addge r0, sl, r0, lsl #1
	strgeh r1, [r0, #0x1a]
	ldrb r0, [sb, #9]
	add r6, r6, #1
	add r8, r8, #0x10
	cmp r6, r0
	blo _020C5A94
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C5B00: .word _02110A0C
	arm_func_end NNSi_G3dAnmObjInitNsBta

	arm_func_start NNSi_G3dAnmCalcNsBta
NNSi_G3dAnmCalcNsBta: ; 0x020C5B04
	stmdb sp!, {r4, lr}
	ldr ip, [r1]
	mov r4, r0
	mov r2, r2, lsl #0x10
	ldr r0, [r1, #8]
	mov r1, r2, lsr #0x10
	mov r3, r4
	mov r2, ip, asr #0xc
	bl GetTexSRTAnm_
	ldr r0, [r4, #0x10]
	bic r0, r0, #0xc0000000
	orr r0, r0, #0x40000000
	str r0, [r4, #0x10]
	ldr r0, [r4]
	orr r0, r0, #8
	str r0, [r4]
	ldmia sp!, {r4, pc}
	arm_func_end NNSi_G3dAnmCalcNsBta

	arm_func_start NNSi_G3dAnmObjInitNsBtp
NNSi_G3dAnmObjInitNsBtp: ; 0x020C5B48
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	cmp r2, #0
	ldrne r0, [r2, #8]
	mov sb, r1
	cmpne r0, #0
	addne r7, r2, r0
	ldr r0, _020C5C20 ; =_02110A10
	add r1, sl, #0x1a
	ldr r3, [r0]
	mov r0, #0
	str r3, [sl, #0xc]
	ldrb r2, [r2, #0x18]
	moveq r7, #0
	strb r2, [sl, #0x19]
	str sb, [sl, #8]
	ldrb r2, [sl, #0x19]
	mov r2, r2, lsl #1
	bl MIi_CpuClear16
	ldrb r0, [sb, #0xd]
	mov r6, #0
	cmp r0, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r8, r6
	add r5, sb, #0xc
	mov fp, r6
	mvn r4, #0
_020C5BB4:
	cmp r5, #0
	beq _020C5BE0
	ldrb r0, [sb, #0xd]
	cmp r6, r0
	bhs _020C5BE0
	ldrh r0, [sb, #0x12]
	add r1, r5, r0
	ldrh r0, [r1, #2]
	add r0, r1, r0
	add r1, r0, r8
	b _020C5BE4
_020C5BE0:
	mov r1, fp
_020C5BE4:
	cmp r7, #0
	moveq r0, r4
	beq _020C5BF8
	add r0, r7, #4
	bl NNS_G3dGetResDictIdxByName
_020C5BF8:
	cmp r0, #0
	orrge r1, r6, #0x100
	addge r0, sl, r0, lsl #1
	strgeh r1, [r0, #0x1a]
	ldrb r0, [sb, #0xd]
	add r6, r6, #1
	add r8, r8, #0x10
	cmp r6, r0
	blo _020C5BB4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C5C20: .word _02110A10
	arm_func_end NNSi_G3dAnmObjInitNsBtp

	arm_func_start SetTexParamaters_
SetTexParamaters_: ; 0x020C5C24
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r2
	moveq r0, #0
	beq _020C5C40
	add r0, r5, #0x3c
	bl NNS_G3dGetResDataByName
_020C5C40:
	ldr r1, [r0]
	ldr r3, [r4, #0x10]
	and r1, r1, #0x1c000000
	cmp r1, #0x14000000
	ldrne r1, [r5, #8]
	ldr r2, _020C5CF4 ; =0x000007FF
	ldreq r1, [r5, #0x18]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bic r5, r1, #0xe0000000
	ldr r1, _020C5CF8 ; =0xC00F0000
	and r3, r3, r1
	str r3, [r4, #0x10]
	ldr r1, [r0]
	add r1, r1, r5
	orr r1, r3, r1
	str r1, [r4, #0x10]
	ldr r1, [r0, #4]
	and r1, r1, r2
	strh r1, [r4, #0x2c]
	ldr r1, [r0, #4]
	and r1, r1, r2, lsl #11
	mov r1, r1, lsr #0xb
	strh r1, [r4, #0x2e]
	ldr r0, [r0, #4]
	ldrh r1, [r4, #0x2c]
	and r3, r0, r2
	and r0, r0, r2, lsl #11
	cmp r3, r1
	mov r5, r0, lsr #0xb
	moveq r0, #0x1000
	beq _020C5CCC
	mov r0, r3, lsl #0xc
	mov r1, r1, lsl #0xc
	bl FX_Div
_020C5CCC:
	str r0, [r4, #0x30]
	ldrh r1, [r4, #0x2e]
	cmp r5, r1
	moveq r0, #0x1000
	beq _020C5CEC
	mov r0, r5, lsl #0xc
	mov r1, r1, lsl #0xc
	bl FX_Div
_020C5CEC:
	str r0, [r4, #0x34]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C5CF4: .word 0x000007FF
_020C5CF8: .word 0xC00F0000
	arm_func_end SetTexParamaters_

	arm_func_start SetPlttParamaters_
SetPlttParamaters_: ; 0x020C5CFC
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	ldrneh r0, [r5, #0x34]
	mov r4, r2
	cmpne r0, #0
	moveq r0, #0
	beq _020C5D20
	add r0, r5, r0
	bl NNS_G3dGetResDataByName
_020C5D20:
	ldr r1, [r5, #0x2c]
	ldrh r2, [r0, #2]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bic r1, r1, #0xe0000000
	mov r1, r1, lsl #0x10
	tst r2, #1
	mov r1, r1, lsr #0x10
	ldrh r0, [r0]
	bne _020C5D58
	mov r0, r0, lsl #0xf
	mov r1, r1, lsl #0xf
	mov r0, r0, lsr #0x10
	mov r1, r1, lsr #0x10
_020C5D58:
	add r0, r0, r1
	str r0, [r4, #0x14]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SetPlttParamaters_

	arm_func_start NNSi_G3dAnmCalcNsBtp
NNSi_G3dAnmCalcNsBtp: ; 0x020C5D64
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	ldr r3, [r6]
	ldr r5, [r6, #8]
	mov r1, r2, lsl #0x10
	mov r2, r3, lsl #4
	mov r7, r0
	mov r0, r5
	mov r1, r1, lsr #0x10
	mov r2, r2, lsr #0x10
	bl NNSi_G3dGetTexPatAnmFV
	mov r4, r0
	ldrb r1, [r4, #2]
	mov r0, r5
	bl NNSi_G3dGetTexPatAnmTexNameByIdx
	mov r1, r0
	ldr r0, [r6, #0x14]
	mov r2, r7
	bl SetTexParamaters_
	ldrb r1, [r4, #3]
	cmp r1, #0xff
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl NNSi_G3dGetTexPatAnmPlttNameByIdx
	mov r1, r0
	ldr r0, [r6, #0x14]
	mov r2, r7
	bl SetPlttParamaters_
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNSi_G3dAnmCalcNsBtp

	arm_func_start NNSi_G3dAnmObjInitNsBva
NNSi_G3dAnmObjInitNsBva: ; 0x020C5DD8
	ldr r3, _020C5E20 ; =_02110A04
	mov ip, #0
	ldr r3, [r3]
	str r3, [r0, #0xc]
	ldrb r2, [r2, #0x17]
	strb r2, [r0, #0x19]
	str r1, [r0, #8]
	ldrb r1, [r0, #0x19]
	cmp r1, #0
	bxls lr
_020C5E00:
	orr r2, ip, #0x100
	add r1, r0, ip, lsl #1
	strh r2, [r1, #0x1a]
	ldrb r1, [r0, #0x19]
	add ip, ip, #1
	cmp ip, r1
	blo _020C5E00
	bx lr
	.align 2, 0
_020C5E20: .word _02110A04
	arm_func_end NNSi_G3dAnmObjInitNsBva

	arm_func_start NNSi_G3dAnmCalcNsBva
NNSi_G3dAnmCalcNsBva: ; 0x020C5E24
	stmdb sp!, {r3, lr}
	ldr lr, [r1, #8]
	ldr r3, [r1]
	ldrh r1, [lr, #6]
	mov ip, r3, asr #0xc
	mov r3, #1
	mla r2, ip, r1, r2
	mov r1, r2, lsr #5
	add r1, lr, r1, lsl #2
	ldr r1, [r1, #0xc]
	and r2, r2, #0x1f
	and r1, r1, r3, lsl r2
	str r1, [r0]
	ldmia sp!, {r3, pc}
	arm_func_end NNSi_G3dAnmCalcNsBva

	arm_func_start NNSi_G3dSendJointSRTBasic
NNSi_G3dSendJointSRTBasic: ; 0x020C5E5C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	tst r0, #4
	bne _020C5EA0
	tst r0, #2
	bne _020C5E8C
	add r1, r4, #0x28
	mov r0, #0x19
	mov r2, #0xc
	bl NNS_G3dGeBufferOP_N
	b _020C5EB8
_020C5E8C:
	add r1, r4, #0x4c
	mov r0, #0x1c
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
	b _020C5EB8
_020C5EA0:
	tst r0, #2
	bne _020C5EB8
	add r1, r4, #0x28
	mov r0, #0x1a
	mov r2, #9
	bl NNS_G3dGeBufferOP_N
_020C5EB8:
	ldr r0, [r4]
	tst r0, #1
	ldmneia sp!, {r4, pc}
	add r1, r4, #4
	mov r0, #0x1b
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
	ldmia sp!, {r4, pc}
	arm_func_end NNSi_G3dSendJointSRTBasic

	arm_func_start NNSi_G3dGetJointScaleBasic
NNSi_G3dGetJointScaleBasic: ; 0x020C5ED8
	tst r3, #4
	beq _020C5EF0
	ldr r1, [r0]
	orr r1, r1, #1
	str r1, [r0]
	b _020C5F08
_020C5EF0:
	ldr r2, [r1]
	str r2, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #8]
	ldr r1, [r1, #8]
	str r1, [r0, #0xc]
_020C5F08:
	ldr r1, [r0]
	orr r1, r1, #0x18
	str r1, [r0]
	bx lr
	arm_func_end NNSi_G3dGetJointScaleBasic

	arm_func_start NNSi_G3dSendJointSRTMaya
NNSi_G3dSendJointSRTMaya: ; 0x020C5F18
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	mov r4, #0
	tst r0, #4
	moveq r4, #1
	tst r0, #0x20
	beq _020C5F6C
	tst r0, #8
	bne _020C5F6C
	cmp r4, #0
	beq _020C5F5C
	add r1, r5, #0x4c
	mov r0, #0x1c
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
	mov r4, #0
_020C5F5C:
	add r1, r5, #0x10
	mov r0, #0x1b
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
_020C5F6C:
	ldr r0, [r5]
	tst r0, #2
	bne _020C5FA4
	cmp r4, #0
	add r1, r5, #0x28
	beq _020C5F94
	mov r0, #0x19
	mov r2, #0xc
	bl NNS_G3dGeBufferOP_N
	b _020C5FBC
_020C5F94:
	mov r0, #0x1a
	mov r2, #9
	bl NNS_G3dGeBufferOP_N
	b _020C5FBC
_020C5FA4:
	cmp r4, #0
	beq _020C5FBC
	add r1, r5, #0x4c
	mov r0, #0x1c
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
_020C5FBC:
	ldr r0, [r5]
	tst r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	add r1, r5, #4
	mov r0, #0x1b
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNSi_G3dSendJointSRTMaya

	arm_func_start NNSi_G3dGetJointScaleMaya
NNSi_G3dGetJointScaleMaya: ; 0x020C5FDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov ip, r0
	tst r3, #4
	ldrb r0, [r2, #3]
	beq _020C6030
	ldr r1, [ip]
	tst r0, #2
	orr r1, r1, #1
	str r1, [ip]
	beq _020C60A8
	ldr r1, _020C611C ; =_021DA700
	ldrb r7, [r2, #1]
	ldr r1, [r1]
	mov r3, #1
	add r6, r1, #0xc4
	mov r5, r7, lsr #5
	ldr r4, [r6, r5, lsl #2]
	and r1, r7, #0x1f
	orr r1, r4, r3, lsl r1
	str r1, [r6, r5, lsl #2]
	b _020C60A8
_020C6030:
	ldr r3, [r1]
	tst r0, #2
	str r3, [ip, #4]
	ldr r3, [r1, #4]
	str r3, [ip, #8]
	ldr r3, [r1, #8]
	str r3, [ip, #0xc]
	beq _020C60A8
	ldr r3, _020C611C ; =_021DA700
	ldrb r8, [r2, #1]
	ldr r4, [r3]
	mov r3, #0x18
	add r7, r4, #0xc4
	mov r6, r8, lsr #5
	and r4, r8, #0x1f
	mov r5, #1
	mvn r4, r5, lsl r4
	ldr lr, [r7, r6, lsl #2]
	smulbb r5, r8, r3
	and r3, lr, r4
	str r3, [r7, r6, lsl #2]
	ldr r4, [r1, #0xc]
	ldr r3, _020C6120 ; =_021DB510
	ldr lr, _020C6124 ; =_021DB514
	str r4, [r3, r5]
	ldr r4, [r1, #0x10]
	ldr r3, _020C6128 ; =_021DB518
	str r4, [lr, r5]
	ldr r1, [r1, #0x14]
	str r1, [r3, r5]
_020C60A8:
	tst r0, #1
	beq _020C610C
	ldrb r3, [r2, #2]
	ldr r1, [ip]
	ldr r0, _020C611C ; =_021DA700
	orr r1, r1, #0x20
	str r1, [ip]
	ldr r1, [r0]
	mov r0, r3, lsr #5
	add r0, r1, r0, lsl #2
	ldr r0, [r0, #0xc4]
	and r1, r3, #0x1f
	mov r2, #1
	tst r0, r2, lsl r1
	beq _020C60F4
	ldr r0, [ip]
	orr r0, r0, #8
	str r0, [ip]
	b _020C610C
_020C60F4:
	ldr r1, _020C6120 ; =_021DB510
	mov r0, #0x18
	mla r0, r3, r0, r1
	add r3, ip, #0x10
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
_020C610C:
	ldr r0, [ip]
	orr r0, r0, #0x10
	str r0, [ip]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020C611C: .word _021DA700
_020C6120: .word _021DB510
_020C6124: .word _021DB514
_020C6128: .word _021DB518
	arm_func_end NNSi_G3dGetJointScaleMaya

	arm_func_start texmtxCalc_flag_
texmtxCalc_flag_: ; 0x020C612C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldrh r2, [sb, #0x2c]
	ldrh r1, [sb, #0x2e]
	mov sl, r0
	mov r8, r2, lsl #0xc
	mov fp, r1, lsl #0xc
	mov r0, fp
	mov r1, r8
	bl FX_DivAsync
	ldrsh r5, [sb, #0x22]
	ldr r3, [sb, #0x18]
	ldrsh r0, [sb, #0x20]
	ldr r4, [sb, #0x1c]
	smull r2, r1, r3, r5
	mov r6, r2, lsr #0xc
	orr r6, r6, r1, lsl #20
	smull r2, r1, r3, r0
	mov r7, r2, lsr #0xc
	orr r7, r7, r1, lsl #20
	smull r3, r2, r4, r0
	smull r1, r0, r4, r5
	mov r5, r3, lsr #0xc
	orr r5, r5, r2, lsl #20
	mov r4, r1, lsr #0xc
	orr r4, r4, r0, lsl #20
	str r6, [sl]
	str r4, [sl, #0x14]
	bl FX_GetDivResult
	mov r1, fp
	rsb r2, r5, #0
	mul r0, r2, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #4]
	mov r0, r8
	bl FX_DivAsync
	sub r0, r5, r4
	add r1, r7, r6
	ldr r5, [sb, #0x18]
	ldrh r4, [sb, #0x2c]
	sub r2, r5, r1
	ldr r1, [sb, #0x24]
	mul r3, r4, r2
	smull r2, r1, r5, r1
	mov r2, r2, lsr #8
	orr r2, r2, r1, lsl #24
	mul r1, r4, r2
	rsb r1, r1, r3, lsl #3
	str r1, [sl, #0x30]
	ldr r4, [sb, #0x1c]
	ldrh r3, [sb, #0x2e]
	sub r0, r0, r4
	add r0, r0, #0x2000
	mul r2, r3, r0
	ldr r0, [sb, #0x28]
	smull r1, r0, r4, r0
	mov r1, r1, lsr #8
	orr r1, r1, r0, lsl #24
	mul r0, r3, r1
	add r0, r0, r2, lsl #3
	str r0, [sl, #0x34]
	bl FX_GetDivResult
	mul r0, r7, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end texmtxCalc_flag_

	arm_func_start texmtxCalc_flagS_
texmtxCalc_flagS_: ; 0x020C6234
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	mov r6, r0
	mov r4, r2, lsl #0xc
	mov r7, r1, lsl #0xc
	mov r0, r7
	mov r1, r4
	bl FX_DivAsync
	ldrsh r0, [r5, #0x22]
	str r0, [r6]
	ldrsh r0, [r5, #0x22]
	str r0, [r6, #0x14]
	bl FX_GetDivResult
	ldrsh r2, [r5, #0x20]
	mov r1, r7
	rsb r2, r2, #0
	mul r0, r2, r0
	mov r2, r0, asr #0xc
	mov r0, r4
	str r2, [r6, #4]
	bl FX_DivAsync
	ldrsh r2, [r5, #0x20]
	ldrsh r1, [r5, #0x22]
	ldrh r3, [r5, #0x2c]
	ldr r0, [r5, #0x24]
	add r1, r2, r1
	rsb r1, r1, #0
	add r2, r1, #0x1000
	mul r1, r0, r3
	mul r2, r3, r2
	mov r0, r1, lsl #4
	rsb r0, r0, r2, lsl #3
	str r0, [r6, #0x30]
	ldrsh r2, [r5, #0x20]
	ldrsh r1, [r5, #0x22]
	ldrh r3, [r5, #0x2e]
	ldr r0, [r5, #0x28]
	sub r1, r2, r1
	add r2, r1, #0x1000
	mul r1, r0, r3
	mul r2, r3, r2
	mov r0, r1, lsl #4
	add r0, r0, r2, lsl #3
	str r0, [r6, #0x34]
	bl FX_GetDivResult
	ldrsh r1, [r5, #0x20]
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r6, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end texmtxCalc_flagS_

	arm_func_start texmtxCalc_flagR_
texmtxCalc_flagR_: ; 0x020C6304
	stmdb sp!, {r4, lr}
	ldr r3, [r1, #0x18]
	mov r2, #0
	str r3, [r0]
	ldr r3, [r1, #0x1c]
	str r3, [r0, #0x14]
	str r2, [r0, #4]
	ldr r4, [r1, #0x18]
	ldr r3, [r1, #0x24]
	ldrh lr, [r1, #0x2c]
	smull ip, r3, r4, r3
	mov r4, ip, lsr #8
	orr r4, r4, r3, lsl #24
	rsb r3, r4, #0
	mul r3, lr, r3
	str r3, [r0, #0x30]
	ldr r4, [r1, #0x1c]
	ldr ip, [r1, #0x28]
	mov r3, r4, lsl #1
	smull lr, ip, r4, ip
	rsb r4, r3, #0
	mov r3, lr, lsr #8
	ldrh lr, [r1, #0x2e]
	add r1, r4, #0x2000
	orr r3, r3, ip, lsl #24
	mul r4, lr, r1
	mul r1, lr, r3
	add r1, r1, r4, lsl #3
	str r1, [r0, #0x34]
	str r2, [r0, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end texmtxCalc_flagR_

	arm_func_start texmtxCalc_flagRS_
texmtxCalc_flagRS_: ; 0x020C6380
	mov r2, #0x1000
	str r2, [r0]
	str r2, [r0, #0x14]
	mov ip, #0
	str ip, [r0, #4]
	ldrh r2, [r1, #0x2c]
	ldr r3, [r1, #0x24]
	mul r2, r3, r2
	rsb r2, r2, #0
	mov r2, r2, lsl #4
	str r2, [r0, #0x30]
	ldrh r2, [r1, #0x2e]
	ldr r1, [r1, #0x28]
	mul r2, r1, r2
	mov r1, r2, lsl #4
	str r1, [r0, #0x34]
	str ip, [r0, #0x10]
	bx lr
	arm_func_end texmtxCalc_flagRS_

	arm_func_start texmtxCalc_flagT_
texmtxCalc_flagT_: ; 0x020C63C8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldrh r2, [sb, #0x2c]
	ldrh r1, [sb, #0x2e]
	mov sl, r0
	mov r8, r2, lsl #0xc
	mov fp, r1, lsl #0xc
	mov r0, fp
	mov r1, r8
	bl FX_DivAsync
	ldrsh r5, [sb, #0x22]
	ldr r3, [sb, #0x18]
	ldrsh r0, [sb, #0x20]
	ldr r4, [sb, #0x1c]
	smull r2, r1, r3, r5
	mov r6, r2, lsr #0xc
	orr r6, r6, r1, lsl #20
	smull r2, r1, r3, r0
	mov r7, r2, lsr #0xc
	orr r7, r7, r1, lsl #20
	smull r3, r2, r4, r0
	smull r1, r0, r4, r5
	mov r5, r3, lsr #0xc
	orr r5, r5, r2, lsl #20
	mov r4, r1, lsr #0xc
	orr r4, r4, r0, lsl #20
	str r6, [sl]
	str r4, [sl, #0x14]
	bl FX_GetDivResult
	mov r1, fp
	rsb r2, r5, #0
	mul r0, r2, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #4]
	mov r0, r8
	bl FX_DivAsync
	sub r1, r5, r4
	add r0, r7, r6
	ldrh r3, [sb, #0x2c]
	ldr r2, [sb, #0x18]
	sub r0, r2, r0
	mul r0, r3, r0
	mov r0, r0, lsl #3
	str r0, [sl, #0x30]
	ldrh r2, [sb, #0x2e]
	ldr r0, [sb, #0x1c]
	sub r0, r1, r0
	add r0, r0, #0x2000
	mul r0, r2, r0
	mov r0, r0, lsl #3
	str r0, [sl, #0x34]
	bl FX_GetDivResult
	mul r0, r7, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end texmtxCalc_flagT_

	arm_func_start texmtxCalc_flagTS_
texmtxCalc_flagTS_: ; 0x020C64A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	mov r6, r0
	mov r4, r2, lsl #0xc
	mov r7, r1, lsl #0xc
	mov r0, r7
	mov r1, r4
	bl FX_DivAsync
	ldrsh r0, [r5, #0x22]
	str r0, [r6]
	ldrsh r0, [r5, #0x22]
	str r0, [r6, #0x14]
	bl FX_GetDivResult
	ldrsh r2, [r5, #0x20]
	mov r1, r7
	rsb r2, r2, #0
	mul r0, r2, r0
	mov r2, r0, asr #0xc
	mov r0, r4
	str r2, [r6, #4]
	bl FX_DivAsync
	ldrsh r1, [r5, #0x20]
	ldrsh r0, [r5, #0x22]
	ldrh r2, [r5, #0x2c]
	add r0, r1, r0
	rsb r0, r0, #0
	add r0, r0, #0x1000
	mul r0, r2, r0
	mov r0, r0, lsl #3
	str r0, [r6, #0x30]
	ldrsh r1, [r5, #0x20]
	ldrsh r0, [r5, #0x22]
	ldrh r2, [r5, #0x2e]
	sub r0, r1, r0
	add r0, r0, #0x1000
	mul r0, r2, r0
	mov r0, r0, lsl #3
	str r0, [r6, #0x34]
	bl FX_GetDivResult
	ldrsh r1, [r5, #0x20]
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r6, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end texmtxCalc_flagTS_

	arm_func_start texmtxCalc_flagTR_
texmtxCalc_flagTR_: ; 0x020C6560
	ldr r2, [r1, #0x18]
	mov ip, #0
	str r2, [r0]
	ldr r2, [r1, #0x1c]
	str r2, [r0, #0x14]
	str ip, [r0, #4]
	str ip, [r0, #0x30]
	ldr r2, [r1, #0x1c]
	ldrh r3, [r1, #0x2e]
	mov r1, r2, lsl #1
	rsb r1, r1, #0
	add r1, r1, #0x2000
	mul r1, r3, r1
	mov r1, r1, lsl #3
	str r1, [r0, #0x34]
	str ip, [r0, #0x10]
	bx lr
	arm_func_end texmtxCalc_flagTR_

	arm_func_start texmtxCalc_flagTRS_
texmtxCalc_flagTRS_: ; 0x020C65A4
	mov r2, #0x1000
	str r2, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	bx lr
	arm_func_end texmtxCalc_flagTRS_

	arm_func_start NNSi_G3dSendTexSRTMaya
NNSi_G3dSendTexSRTMaya: ; 0x020C65C8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x4c
	mov r4, r0
	ldr r0, [r4]
	mov r1, #0
	tst r0, #8
	ldrne r0, _020C6704 ; =0x00101610
	mov r3, #3
	strne r0, [sp]
	ldreq r0, _020C6708 ; =0x00101810
	mov r2, #2
	streq r0, [sp]
	mov r0, #0x1000
	str r0, [sp, #0x44]
	str r3, [sp, #4]
	str r2, [sp, #0x48]
	str r1, [sp, #0x40]
	str r1, [sp, #0x34]
	str r1, [sp, #0x30]
	str r1, [sp, #0x2c]
	str r1, [sp, #0x28]
	str r1, [sp, #0x24]
	str r1, [sp, #0x20]
	str r1, [sp, #0x14]
	str r1, [sp, #0x10]
	ldr r1, [r4]
	ldr r0, _020C670C ; =_02110C1C
	and r1, r1, #7
	ldr r2, [r0, r1, lsl #2]
	add r0, sp, #8
	mov r1, r4
	blx r2
	ldr r3, [r4, #0x30]
	cmp r3, #0x1000
	beq _020C6698
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #8]
	ldr r2, [r4, #0x30]
	ldr r0, [sp, #0x38]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0xc]
	ldr r1, [r4, #0x30]
	smull r2, r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x38]
_020C6698:
	ldr r3, [r4, #0x34]
	cmp r3, #0x1000
	beq _020C66E8
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #0x18]
	ldr r2, [r4, #0x34]
	ldr r0, [sp, #0x3c]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0x1c]
	ldr r1, [r4, #0x34]
	smull r2, r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x3c]
_020C66E8:
	add r1, sp, #0
	ldr r0, [sp]
	add r1, r1, #4
	mov r2, #0x12
	bl NNS_G3dGeBufferOP_N
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020C6704: .word 0x00101610
_020C6708: .word 0x00101810
_020C670C: .word _02110C1C
	arm_func_end NNSi_G3dSendTexSRTMaya

	arm_func_start NNSi_G3dSendJointSRTSi3d
NNSi_G3dSendJointSRTSi3d: ; 0x020C6710
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r6, r0
	ldr r0, [r6]
	mov r4, #0
	ands r5, r0, #0x18
	bne _020C673C
	add r1, r6, #0x1c
	mov r0, #0x1b
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
_020C673C:
	ldr r0, [r6]
	tst r0, #4
	bne _020C67AC
	cmp r5, #0
	movne r4, #1
	bne _020C67AC
	ldr r2, [r6, #0x4c]
	ldr r0, [r6, #0x10]
	add r1, sp, #0
	smull r3, r0, r2, r0
	mov r2, r3, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp]
	ldr r3, [r6, #0x50]
	ldr r2, [r6, #0x14]
	mov r0, #0x1c
	smull ip, r2, r3, r2
	mov r3, ip, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [sp, #4]
	ldr ip, [r6, #0x54]
	ldr r3, [r6, #0x18]
	mov r2, #3
	smull lr, r3, ip, r3
	mov ip, lr, lsr #0xc
	orr ip, ip, r3, lsl #20
	str ip, [sp, #8]
	bl NNS_G3dGeBufferOP_N
_020C67AC:
	ldr r0, [r6]
	tst r0, #2
	bne _020C67E4
	cmp r4, #0
	add r1, r6, #0x28
	beq _020C67D4
	mov r0, #0x19
	mov r2, #0xc
	bl NNS_G3dGeBufferOP_N
	b _020C67FC
_020C67D4:
	mov r0, #0x1a
	mov r2, #9
	bl NNS_G3dGeBufferOP_N
	b _020C67FC
_020C67E4:
	cmp r4, #0
	beq _020C67FC
	add r1, r6, #0x4c
	mov r0, #0x1c
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
_020C67FC:
	cmp r5, #0
	bne _020C6814
	add r1, r6, #0x10
	mov r0, #0x1b
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
_020C6814:
	ldr r0, [r6]
	tst r0, #1
	addne sp, sp, #0xc
	ldmneia sp!, {r3, r4, r5, r6, pc}
	add r1, r6, #4
	mov r0, #0x1b
	mov r2, #3
	bl NNS_G3dGeBufferOP_N
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end NNSi_G3dSendJointSRTSi3d

	arm_func_start NNSi_G3dGetJointScaleSi3d
NNSi_G3dGetJointScaleSi3d: ; 0x020C683C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r5, r0
	tst r3, #4
	ldrb r4, [r2, #1]
	ldrb r0, [r2, #2]
	beq _020C68D8
	ldr r2, [r5]
	ldr r1, _020C6A3C ; =_021DA700
	orr r2, r2, #1
	str r2, [r5]
	ldr r3, [r1]
	mov r1, r0, lsr #5
	add r1, r3, r1, lsl #2
	ldr r1, [r1, #0xc4]
	and r2, r0, #0x1f
	mov r6, #1
	tst r1, r6, lsl r2
	beq _020C68AC
	add r3, r3, #0xc4
	mov r2, r4, lsr #5
	ldr r1, [r3, r2, lsl #2]
	and r0, r4, #0x1f
	orr r0, r1, r6, lsl r0
	str r0, [r3, r2, lsl #2]
	ldr r0, [r5]
	orr r0, r0, #0x18
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C68AC:
	mov r2, #0x18
	ldr r7, _020C6A40 ; =_021DB504
	mul r6, r0, r2
	mla r1, r4, r2, r7
	add r0, r7, r6
	bl MIi_CpuCopy32
	add r0, r7, r6
	add r1, r5, #0x10
	mov r2, #0x18
	bl MIi_CpuCopy32
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C68D8:
	ldr r3, [r1]
	ldr r2, _020C6A3C ; =_021DA700
	str r3, [r5, #4]
	ldr r3, [r1, #4]
	mov r7, r0, lsr #5
	str r3, [r5, #8]
	ldr r3, [r1, #8]
	and r8, r0, #0x1f
	str r3, [r5, #0xc]
	ldr r6, [r2]
	mov r3, #1
	add r2, r6, r7, lsl #2
	ldr r2, [r2, #0xc4]
	tst r2, r3, lsl r8
	mov r2, #0x18
	beq _020C6960
	ldr r3, _020C6A40 ; =_021DB504
	mov r0, r1
	mla r1, r4, r2, r3
	bl MIi_CpuCopy32
	ldr r0, _020C6A3C ; =_021DA700
	mov r2, r4, lsr #5
	ldr r1, [r0]
	and r0, r4, #0x1f
	add r3, r1, #0xc4
	mov r1, #1
	mvn r0, r1, lsl r0
	ldr r1, [r3, r2, lsl #2]
	and r0, r1, r0
	str r0, [r3, r2, lsl #2]
	ldr r0, [r5]
	orr r0, r0, #0x18
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020C6960:
	mul ip, r0, r2
	and r7, r4, #0x1f
	mvn r7, r3, lsl r7
	add r6, r6, #0xc4
	mov lr, r4, lsr #5
	ldr r8, [r6, lr, lsl #2]
	mul r3, r4, r2
	and r4, r8, r7
	str r4, [r6, lr, lsl #2]
	ldr r0, _020C6A40 ; =_021DB504
	ldr r7, [r1]
	ldr r4, [r0, ip]
	ldr r6, _020C6A44 ; =_021DB508
	smull r8, r4, r7, r4
	mov r7, r8, lsr #0xc
	orr r7, r7, r4, lsl #20
	str r7, [r0, r3]
	ldr r8, [r1, #4]
	ldr r4, [r6, ip]
	ldr r7, _020C6A48 ; =_021DB50C
	smull lr, r4, r8, r4
	mov r8, lr, lsr #0xc
	orr r8, r8, r4, lsl #20
	str r8, [r6, r3]
	ldr r8, [r1, #8]
	ldr r4, [r7, ip]
	ldr r6, _020C6A4C ; =_021DB510
	smull lr, r4, r8, r4
	mov r8, lr, lsr #0xc
	orr r8, r8, r4, lsl #20
	str r8, [r7, r3]
	ldr r7, [r1, #0xc]
	ldr r4, [r6, ip]
	ldr lr, _020C6A50 ; =_021DB514
	smull r8, r4, r7, r4
	mov r7, r8, lsr #0xc
	orr r7, r7, r4, lsl #20
	str r7, [r6, r3]
	ldr r7, [r1, #0x10]
	ldr r6, [lr, ip]
	ldr r4, _020C6A54 ; =_021DB518
	smull r8, r6, r7, r6
	mov r7, r8, lsr #0xc
	orr r7, r7, r6, lsl #20
	str r7, [lr, r3]
	ldr r6, [r1, #0x14]
	ldr r1, [r4, ip]
	add r0, r0, ip
	smull ip, r1, r6, r1
	mov r6, ip, lsr #0xc
	orr r6, r6, r1, lsl #20
	add r1, r5, #0x10
	str r6, [r4, r3]
	bl MIi_CpuCopy32
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020C6A3C: .word _021DA700
_020C6A40: .word _021DB504
_020C6A44: .word _021DB508
_020C6A48: .word _021DB50C
_020C6A4C: .word _021DB510
_020C6A50: .word _021DB514
_020C6A54: .word _021DB518
	arm_func_end NNSi_G3dGetJointScaleSi3d

	arm_func_start NNSi_G3dSendTexSRTSi3d
NNSi_G3dSendTexSRTSi3d: ; 0x020C6A58
	stmdb sp!, {lr}
	sub sp, sp, #0x3c
	ldr r1, [r0]
	mov r2, #0
	tst r1, #8
	ldrne r1, _020C6C1C ; =0x00101710
	mov r3, #3
	strne r1, [sp]
	ldreq r1, _020C6C20 ; =0x00101910
	str r3, [sp, #4]
	streq r1, [sp]
	mov r1, #2
	str r2, [sp, #0x34]
	str r2, [sp, #0x28]
	str r2, [sp, #0x24]
	str r2, [sp, #0x20]
	str r2, [sp, #0x1c]
	str r2, [sp, #0x14]
	str r2, [sp, #0x10]
	str r2, [sp, #0xc]
	str r1, [sp, #0x38]
	ldr r1, [r0]
	tst r1, #4
	beq _020C6AF0
	str r2, [sp, #0x2c]
	str r2, [sp, #0x30]
	ldr r1, [r0]
	tst r1, #1
	beq _020C6ADC
	mov r1, #0x1000
	str r1, [sp, #8]
	str r1, [sp, #0x18]
	b _020C6B90
_020C6ADC:
	ldr r1, [r0, #0x18]
	str r1, [sp, #8]
	ldr r1, [r0, #0x1c]
	str r1, [sp, #0x18]
	b _020C6B90
_020C6AF0:
	tst r1, #1
	beq _020C6B38
	ldr r2, [r0, #0x24]
	ldrh r1, [r0, #0x2c]
	mov r2, r2, lsl #4
	rsb r2, r2, #0
	mul r1, r2, r1
	str r1, [sp, #0x2c]
	ldr r2, [r0, #0x28]
	ldrh r1, [r0, #0x2e]
	mov r2, r2, lsl #4
	rsb r2, r2, #0
	mul r3, r2, r1
	mov r1, #0x1000
	str r3, [sp, #0x30]
	str r1, [sp, #8]
	str r1, [sp, #0x18]
	b _020C6B90
_020C6B38:
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x24]
	ldrh ip, [r0, #0x2c]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #8
	orr r2, r2, r1, lsl #24
	rsb r1, r2, #0
	mul r1, ip, r1
	str r1, [sp, #0x2c]
	ldr r2, [r0, #0x1c]
	ldr r1, [r0, #0x28]
	ldrh ip, [r0, #0x2e]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #8
	orr r2, r2, r1, lsl #24
	rsb r1, r2, #0
	mul r1, ip, r1
	str r1, [sp, #0x30]
	ldr r1, [r0, #0x18]
	str r1, [sp, #8]
	ldr r1, [r0, #0x1c]
	str r1, [sp, #0x18]
_020C6B90:
	ldr ip, [r0, #0x30]
	cmp ip, #0x1000
	beq _020C6BC8
	ldr r2, [sp, #8]
	ldr r1, [sp, #0x2c]
	smull r3, r2, ip, r2
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [sp, #8]
	ldr r2, [r0, #0x30]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0x2c]
_020C6BC8:
	ldr ip, [r0, #0x34]
	cmp ip, #0x1000
	beq _020C6C00
	ldr r2, [sp, #0x18]
	ldr r1, [sp, #0x30]
	smull r3, r2, ip, r2
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	str r3, [sp, #0x18]
	ldr r0, [r0, #0x34]
	smull r2, r1, r0, r1
	mov r0, r2, lsr #0xc
	orr r0, r0, r1, lsl #20
	str r0, [sp, #0x30]
_020C6C00:
	add r1, sp, #0
	ldr r0, [sp]
	add r1, r1, #4
	mov r2, #0xe
	bl NNS_G3dGeBufferOP_N
	add sp, sp, #0x3c
	ldmia sp!, {pc}
	.align 2, 0
_020C6C1C: .word 0x00101710
_020C6C20: .word 0x00101910
	arm_func_end NNSi_G3dSendTexSRTSi3d

	arm_func_start texmtxCalc_flag___3dsmax
texmtxCalc_flag___3dsmax: ; 0x020C6C24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldrh r2, [sb, #0x2c]
	ldrh r1, [sb, #0x2e]
	mov sl, r0
	mov r8, r2, lsl #0xc
	mov fp, r1, lsl #0xc
	mov r0, fp
	mov r1, r8
	bl FX_DivAsync
	ldrsh r0, [sb, #0x22]
	ldr r3, [sb, #0x18]
	ldrsh r5, [sb, #0x20]
	ldr r4, [sb, #0x1c]
	smull r2, r1, r3, r0
	mov r7, r2, lsr #0xc
	orr r7, r7, r1, lsl #20
	smull r2, r1, r3, r5
	mov r6, r2, lsr #0xc
	orr r6, r6, r1, lsl #20
	smull r3, r2, r4, r0
	smull r1, r0, r4, r5
	mov r5, r3, lsr #0xc
	orr r5, r5, r2, lsl #20
	mov r4, r1, lsr #0xc
	orr r4, r4, r0, lsl #20
	str r7, [sl]
	str r5, [sl, #0x14]
	bl FX_GetDivResult
	mov r1, fp
	mul r0, r4, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #4]
	mov r0, r8
	bl FX_DivAsync
	ldrh r1, [sb, #0x2c]
	ldrh r8, [sb, #0x2e]
	ldr r2, [sb, #0x28]
	rsb r0, r1, #0
	mul r3, r2, r8
	rsb r2, r8, #0
	add r8, r3, r2, lsl #11
	smull r3, r2, r5, r8
	smull r8, r5, r6, r8
	ldr fp, [sb, #0x24]
	mul ip, fp, r1
	rsb r0, ip, r0, lsl #11
	smlal r3, r2, r4, r0
	smull r4, r0, r7, r0
	subs r4, r4, r8
	sbc r0, r0, r5
	mov r4, r4, lsr #8
	orr r4, r4, r0, lsl #24
	add r0, r4, r1, lsl #15
	str r0, [sl, #0x30]
	ldrh r1, [sb, #0x2e]
	mov r0, r3, lsr #8
	orr r0, r0, r2, lsl #24
	add r0, r0, r1, lsl #15
	str r0, [sl, #0x34]
	bl FX_GetDivResult
	rsb r1, r6, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end texmtxCalc_flag___3dsmax

	arm_func_start texmtxCalc_flagS___3dsmax
texmtxCalc_flagS___3dsmax: ; 0x020C6D2C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	mov r6, r0
	mov r4, r2, lsl #0xc
	mov r7, r1, lsl #0xc
	mov r0, r7
	mov r1, r4
	bl FX_DivAsync
	ldrsh r0, [r5, #0x22]
	str r0, [r6]
	ldrsh r0, [r5, #0x22]
	str r0, [r6, #0x14]
	bl FX_GetDivResult
	ldrsh r2, [r5, #0x20]
	mov r1, r7
	mul r0, r2, r0
	mov r2, r0, asr #0xc
	mov r0, r4
	str r2, [r6, #4]
	bl FX_DivAsync
	ldrh r2, [r5, #0x2c]
	ldrh r4, [r5, #0x2e]
	ldr r1, [r5, #0x28]
	ldr r0, [r5, #0x24]
	mul r3, r1, r4
	rsb r1, r4, #0
	mul r4, r0, r2
	rsb r0, r2, #0
	add r1, r3, r1, lsl #11
	ldrsh r3, [r5, #0x20]
	rsb r0, r4, r0, lsl #11
	ldrsh lr, [r5, #0x22]
	smull ip, r4, r3, r1
	smull r7, r3, lr, r0
	subs r7, r7, ip
	sbc r3, r3, r4
	mov r4, r7, lsr #8
	orr r4, r4, r3, lsl #24
	add r2, r4, r2, lsl #15
	str r2, [r6, #0x30]
	ldrsh r2, [r5, #0x22]
	ldrsh r3, [r5, #0x20]
	ldrh ip, [r5, #0x2e]
	smull r4, r1, r2, r1
	smlal r4, r1, r3, r0
	mov r0, r4, lsr #8
	orr r0, r0, r1, lsl #24
	add r0, r0, ip, lsl #15
	str r0, [r6, #0x34]
	bl FX_GetDivResult
	ldrsh r1, [r5, #0x20]
	rsb r1, r1, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r6, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end texmtxCalc_flagS___3dsmax

	arm_func_start texmtxCalc_flagR___3dsmax
texmtxCalc_flagR___3dsmax: ; 0x020C6E14
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, [r1, #0x18]
	mov r3, #0
	str r2, [r0]
	ldr r2, [r1, #0x1c]
	str r2, [r0, #0x14]
	str r3, [r0, #4]
	ldrh r5, [r1, #0x2c]
	ldr ip, [r1, #0x24]
	ldrh r2, [r1, #0x2e]
	mul lr, ip, r5
	rsb ip, r5, #0
	ldr r4, [r1, #0x18]
	rsb ip, lr, ip, lsl #11
	smull lr, ip, r4, ip
	ldr r6, [r1, #0x28]
	mov r4, lr, lsr #8
	orr r4, r4, ip, lsl #24
	add r4, r4, r5, lsl #15
	str r4, [r0, #0x30]
	mul r4, r6, r2
	rsb r5, r2, #0
	ldr r2, [r1, #0x1c]
	add r4, r4, r5, lsl #11
	smull lr, ip, r2, r4
	mov r2, lr, lsr #8
	ldrh r1, [r1, #0x2e]
	orr r2, r2, ip, lsl #24
	add r1, r2, r1, lsl #15
	str r1, [r0, #0x34]
	str r3, [r0, #0x10]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end texmtxCalc_flagR___3dsmax

	arm_func_start texmtxCalc_flagRS___3dsmax
texmtxCalc_flagRS___3dsmax: ; 0x020C6E94
	mov r2, #0x1000
	str r2, [r0]
	str r2, [r0, #0x14]
	mov ip, #0
	str ip, [r0, #4]
	ldr r3, [r1, #0x24]
	ldrh r2, [r1, #0x2c]
	rsb r3, r3, #0
	mul r2, r3, r2
	mov r2, r2, lsl #4
	str r2, [r0, #0x30]
	ldrh r2, [r1, #0x2e]
	ldr r1, [r1, #0x28]
	mul r2, r1, r2
	mov r1, r2, lsl #4
	str r1, [r0, #0x34]
	str ip, [r0, #0x10]
	bx lr
	arm_func_end texmtxCalc_flagRS___3dsmax

	arm_func_start texmtxCalc_flagT___3dsmax
texmtxCalc_flagT___3dsmax: ; 0x020C6EDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldrh r2, [sb, #0x2c]
	ldrh r1, [sb, #0x2e]
	mov sl, r0
	mov r8, r2, lsl #0xc
	mov fp, r1, lsl #0xc
	mov r0, fp
	mov r1, r8
	bl FX_DivAsync
	ldrsh r0, [sb, #0x22]
	ldr r3, [sb, #0x18]
	ldrsh r5, [sb, #0x20]
	ldr r4, [sb, #0x1c]
	smull r2, r1, r3, r0
	mov r7, r2, lsr #0xc
	orr r7, r7, r1, lsl #20
	smull r2, r1, r3, r5
	mov r6, r2, lsr #0xc
	orr r6, r6, r1, lsl #20
	smull r3, r2, r4, r0
	smull r1, r0, r4, r5
	mov r5, r3, lsr #0xc
	orr r5, r5, r2, lsl #20
	mov r4, r1, lsr #0xc
	orr r4, r4, r0, lsl #20
	str r7, [sl]
	str r5, [sl, #0x14]
	bl FX_GetDivResult
	mov r1, fp
	mul r0, r4, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #4]
	mov r0, r8
	bl FX_DivAsync
	ldrh r3, [sb, #0x2c]
	ldrh r1, [sb, #0x2e]
	rsb r0, r3, #0
	rsb r1, r1, #0
	mov r2, r1, lsl #0xb
	mov fp, r0, lsl #0xb
	smull r1, r0, r7, fp
	smull r8, r7, r5, r2
	smlal r8, r7, r4, fp
	mov r4, r8, lsr #8
	orr r4, r4, r7, lsl #24
	smull r5, r2, r6, r2
	subs r1, r1, r5
	sbc r0, r0, r2
	mov r1, r1, lsr #8
	orr r1, r1, r0, lsl #24
	add r0, r1, r3, lsl #15
	str r0, [sl, #0x30]
	ldrh r0, [sb, #0x2e]
	add r0, r4, r0, lsl #15
	str r0, [sl, #0x34]
	bl FX_GetDivResult
	rsb r1, r6, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end texmtxCalc_flagT___3dsmax

	arm_func_start texmtxCalc_flagTS___3dsmax
texmtxCalc_flagTS___3dsmax: ; 0x020C6FD4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	mov r6, r0
	mov r4, r2, lsl #0xc
	mov r7, r1, lsl #0xc
	mov r0, r7
	mov r1, r4
	bl FX_DivAsync
	ldrsh r0, [r5, #0x22]
	str r0, [r6]
	ldrsh r0, [r5, #0x22]
	str r0, [r6, #0x14]
	bl FX_GetDivResult
	ldrsh r2, [r5, #0x20]
	mov r1, r7
	mul r0, r2, r0
	mov r2, r0, asr #0xc
	mov r0, r4
	str r2, [r6, #4]
	bl FX_DivAsync
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	ldrsh r4, [r5, #0x22]
	rsb r0, r2, #0
	rsb r1, r1, #0
	mov r0, r0, lsl #0xb
	ldrsh r3, [r5, #0x20]
	mov r1, r1, lsl #0xb
	smull r7, lr, r4, r0
	smull ip, r4, r3, r1
	subs r7, r7, ip
	sbc r3, lr, r4
	mov r4, r7, lsr #8
	orr r4, r4, r3, lsl #24
	add r2, r4, r2, lsl #15
	str r2, [r6, #0x30]
	ldrsh r2, [r5, #0x22]
	ldrsh r3, [r5, #0x20]
	ldrh ip, [r5, #0x2e]
	smull r4, r1, r2, r1
	smlal r4, r1, r3, r0
	mov r0, r4, lsr #8
	orr r0, r0, r1, lsl #24
	add r0, r0, ip, lsl #15
	str r0, [r6, #0x34]
	bl FX_GetDivResult
	ldrsh r1, [r5, #0x20]
	rsb r1, r1, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r6, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end texmtxCalc_flagTS___3dsmax

	arm_func_start texmtxCalc_flagTR___3dsmax
texmtxCalc_flagTR___3dsmax: ; 0x020C70AC
	ldr r2, [r1, #0x18]
	mov ip, #0
	str r2, [r0]
	ldr r2, [r1, #0x1c]
	str r2, [r0, #0x14]
	str ip, [r0, #4]
	ldr r3, [r1, #0x18]
	ldrh r2, [r1, #0x2c]
	rsb r3, r3, #0x1000
	mul r2, r3, r2
	mov r2, r2, lsl #3
	str r2, [r0, #0x30]
	ldr r2, [r1, #0x1c]
	ldrh r1, [r1, #0x2e]
	rsb r2, r2, #0x1000
	mul r1, r2, r1
	mov r1, r1, lsl #3
	str r1, [r0, #0x34]
	str ip, [r0, #0x10]
	bx lr
	arm_func_end texmtxCalc_flagTR___3dsmax

	arm_func_start texmtxCalc_flagTRS___3dsmax
texmtxCalc_flagTRS___3dsmax: ; 0x020C70FC
	mov r2, #0x1000
	str r2, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	bx lr
	arm_func_end texmtxCalc_flagTRS___3dsmax

	arm_func_start NNSi_G3dSendTexSRT3dsMax
NNSi_G3dSendTexSRT3dsMax: ; 0x020C7120
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x4c
	mov r4, r0
	ldr r0, [r4]
	mov r1, #0
	tst r0, #8
	ldrne r0, _020C725C ; =0x00101610
	mov r3, #3
	strne r0, [sp]
	ldreq r0, _020C7260 ; =0x00101810
	mov r2, #2
	streq r0, [sp]
	mov r0, #0x1000
	str r0, [sp, #0x44]
	str r3, [sp, #4]
	str r2, [sp, #0x48]
	str r1, [sp, #0x40]
	str r1, [sp, #0x34]
	str r1, [sp, #0x30]
	str r1, [sp, #0x2c]
	str r1, [sp, #0x28]
	str r1, [sp, #0x24]
	str r1, [sp, #0x20]
	str r1, [sp, #0x14]
	str r1, [sp, #0x10]
	ldr r1, [r4]
	ldr r0, _020C7264 ; =_02110C3C
	and r1, r1, #7
	ldr r2, [r0, r1, lsl #2]
	add r0, sp, #8
	mov r1, r4
	blx r2
	ldr r3, [r4, #0x30]
	cmp r3, #0x1000
	beq _020C71F0
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #8]
	ldr r2, [r4, #0x30]
	ldr r0, [sp, #0x38]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0xc]
	ldr r1, [r4, #0x30]
	smull r2, r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x38]
_020C71F0:
	ldr r3, [r4, #0x34]
	cmp r3, #0x1000
	beq _020C7240
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #0x18]
	ldr r2, [r4, #0x34]
	ldr r0, [sp, #0x3c]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0x1c]
	ldr r1, [r4, #0x34]
	smull r2, r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x3c]
_020C7240:
	add r1, sp, #0
	ldr r0, [sp]
	add r1, r1, #4
	mov r2, #0x12
	bl NNS_G3dGeBufferOP_N
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020C725C: .word 0x00101610
_020C7260: .word 0x00101810
_020C7264: .word _02110C3C
	arm_func_end NNSi_G3dSendTexSRT3dsMax

	arm_func_start texmtxCalc_flag___xsi
texmtxCalc_flag___xsi: ; 0x020C7268
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, r1
	ldrh r2, [r6, #0x2c]
	ldrh r1, [r6, #0x2e]
	mov r7, r0
	mov sl, r2, lsl #0xc
	mov fp, r1, lsl #0xc
	mov r0, fp
	mov r1, sl
	bl FX_DivAsync
	ldrsh r3, [r6, #0x22]
	ldr r0, [r6, #0x18]
	ldrsh sb, [r6, #0x20]
	smull r2, r1, r0, r3
	mov r2, r2, lsr #0xc
	ldr r8, [r6, #0x1c]
	orr r2, r2, r1, lsl #20
	str r2, [r7]
	smull r2, r1, r8, r3
	mov r4, r2, lsr #0xc
	orr r4, r4, r1, lsl #20
	smull r2, r1, r0, sb
	mov r5, r2, lsr #0xc
	orr r5, r5, r1, lsl #20
	str r4, [r7, #0x14]
	bl FX_GetDivResult
	smull r2, r1, r8, sb
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	mul r0, r2, r0
	mov r0, r0, asr #0xc
	str r0, [r7, #4]
	mov r0, sl
	mov r1, fp
	bl FX_DivAsync
	ldr lr, [r6, #0x1c]
	ldrsh r2, [r6, #0x20]
	ldr r8, [r6, #0x24]
	ldr r0, [r6, #0x28]
	smull sl, sb, r8, r2
	ldrh r1, [r6, #0x2c]
	smull r3, r2, r0, r2
	ldrsh ip, [r6, #0x22]
	str r1, [sp]
	mov fp, lr, asr #0x1f
	smlal r3, r2, r8, ip
	smull r8, ip, r0, ip
	subs r8, sl, r8
	sbc r0, sb, ip
	mov sb, r8, lsr #0xc
	mov ip, r3, lsr #0xc
	orr sb, sb, r0, lsl #20
	mov r3, r2, asr #0xc
	orr ip, ip, r2, lsl #20
	umull sl, r2, sb, lr
	mla r2, sb, fp, r2
	mov r8, r0, asr #0xc
	mla r2, r8, lr, r2
	ldr r1, [r6, #0x18]
	mov r8, sl, lsr #0xc
	orr r8, r8, r2, lsl #20
	add r2, r4, r8
	mov r0, r1, asr #0x1f
	umull r8, r4, ip, r1
	mla r4, ip, r0, r4
	mla r4, r3, r1, r4
	mov r0, r8, lsr #0xc
	orr r0, r0, r4, lsl #20
	sub r1, r5, r0
	ldr r0, [sp]
	sub r2, r2, #0x1000
	mul r1, r0, r1
	mov r0, r1, lsl #4
	str r0, [r7, #0x30]
	ldrh r0, [r6, #0x2e]
	rsb r0, r0, #0
	mul r1, r0, r2
	mov r0, r1, lsl #4
	str r0, [r7, #0x34]
	bl FX_GetDivResult
	rsb r1, r5, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r7, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end texmtxCalc_flag___xsi

	arm_func_start texmtxCalc_flagS___xsi
texmtxCalc_flagS___xsi: ; 0x020C73BC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	mov r6, r0
	mov r4, r2, lsl #0xc
	mov r7, r1, lsl #0xc
	mov r0, r7
	mov r1, r4
	bl FX_DivAsync
	ldrsh r0, [r5, #0x22]
	str r0, [r6]
	ldrsh r0, [r5, #0x22]
	str r0, [r6, #0x14]
	bl FX_GetDivResult
	ldrsh r2, [r5, #0x20]
	mov r1, r7
	mul r0, r2, r0
	mov r2, r0, asr #0xc
	mov r0, r4
	str r2, [r6, #4]
	bl FX_DivAsync
	ldrsh lr, [r5, #0x20]
	ldr r4, [r5, #0x28]
	ldrsh r0, [r5, #0x22]
	ldr ip, [r5, #0x24]
	smull r3, r2, r4, lr
	smlal r3, r2, ip, r0
	smull r1, r0, r4, r0
	mov r3, r3, lsr #0xc
	orr r3, r3, r2, lsl #20
	sub r4, lr, r3
	smull r3, r2, ip, lr
	subs r1, r3, r1
	sbc r0, r2, r0
	ldrh r2, [r5, #0x2c]
	mov r1, r1, lsr #0xc
	orr r1, r1, r0, lsl #20
	mul r0, r2, r4
	mov r0, r0, lsl #4
	str r0, [r6, #0x30]
	ldrsh r0, [r5, #0x22]
	ldrh r2, [r5, #0x2e]
	add r0, r0, r1
	rsb r1, r2, #0
	sub r0, r0, #0x1000
	mul r0, r1, r0
	mov r0, r0, lsl #4
	str r0, [r6, #0x34]
	bl FX_GetDivResult
	ldrsh r1, [r5, #0x20]
	rsb r1, r1, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r6, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end texmtxCalc_flagS___xsi

	arm_func_start texmtxCalc_flagR___xsi
texmtxCalc_flagR___xsi: ; 0x020C749C
	stmdb sp!, {r4, lr}
	ldr r3, [r1, #0x18]
	mov r2, #0
	str r3, [r0]
	ldr r3, [r1, #0x1c]
	str r3, [r0, #0x14]
	str r2, [r0, #4]
	ldr ip, [r1, #0x24]
	ldr r3, [r1, #0x18]
	ldr r4, [r1, #0x28]
	smull lr, r3, ip, r3
	mov ip, lr, lsr #0xc
	orr ip, ip, r3, lsl #20
	ldrh lr, [r1, #0x2c]
	rsb r3, ip, #0
	ldr ip, [r1, #0x1c]
	rsb r4, r4, #0
	mul r3, lr, r3
	smull lr, ip, r4, ip
	mov r3, r3, lsl #4
	str r3, [r0, #0x30]
	mov r4, lr, lsr #0xc
	ldrh r3, [r1, #0x2e]
	ldr r1, [r1, #0x1c]
	orr r4, r4, ip, lsl #20
	add r1, r1, r4
	rsb r3, r3, #0
	sub r1, r1, #0x1000
	mul r1, r3, r1
	mov r1, r1, lsl #4
	str r1, [r0, #0x34]
	str r2, [r0, #0x10]
	ldmia sp!, {r4, pc}
	arm_func_end texmtxCalc_flagR___xsi

	arm_func_start texmtxCalc_flagRS___xsi
texmtxCalc_flagRS___xsi: ; 0x020C7520
	stmdb sp!, {r3, lr}
	mov r2, #0x1000
	str r2, [r0]
	str r2, [r0, #0x14]
	mov lr, #0
	str lr, [r0, #4]
	ldr r2, [r1, #0x24]
	ldrh r3, [r1, #0x2c]
	rsb r2, r2, #0
	ldr ip, [r1, #0x28]
	mul r2, r3, r2
	mov r2, r2, lsl #4
	str r2, [r0, #0x30]
	ldrh r1, [r1, #0x2e]
	rsb r2, ip, #0
	rsb r1, r1, #0
	mul r2, r1, r2
	mov r1, r2, lsl #4
	str r1, [r0, #0x34]
	str lr, [r0, #0x10]
	ldmia sp!, {r3, pc}
	arm_func_end texmtxCalc_flagRS___xsi

	arm_func_start texmtxCalc_flagT___xsi
texmtxCalc_flagT___xsi: ; 0x020C7574
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	ldrh r2, [sb, #0x2c]
	ldrh r1, [sb, #0x2e]
	mov sl, r0
	mov r8, r2, lsl #0xc
	mov fp, r1, lsl #0xc
	mov r0, fp
	mov r1, r8
	bl FX_DivAsync
	ldrsh r3, [sb, #0x22]
	ldr r0, [sb, #0x18]
	ldrsh r7, [sb, #0x20]
	ldr r5, [sb, #0x1c]
	smull r2, r1, r0, r3
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sl]
	smull r2, r1, r5, r3
	mov r4, r2, lsr #0xc
	orr r4, r4, r1, lsl #20
	smull r2, r1, r0, r7
	mov r6, r2, lsr #0xc
	orr r6, r6, r1, lsl #20
	str r4, [sl, #0x14]
	bl FX_GetDivResult
	smull r2, r1, r5, r7
	mov r2, r2, lsr #0xc
	orr r2, r2, r1, lsl #20
	mul r0, r2, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #4]
	mov r0, r8
	mov r1, fp
	bl FX_DivAsync
	sub r0, r4, #0x1000
	ldrh r1, [sb, #0x2c]
	mul r2, r1, r6
	mov r1, r2, lsl #4
	str r1, [sl, #0x30]
	ldrh r1, [sb, #0x2e]
	rsb r1, r1, #0
	mul r0, r1, r0
	mov r0, r0, lsl #4
	str r0, [sl, #0x34]
	bl FX_GetDivResult
	rsb r1, r6, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [sl, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end texmtxCalc_flagT___xsi

	arm_func_start texmtxCalc_flagTS___xsi
texmtxCalc_flagTS___xsi: ; 0x020C7640
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r1
	ldrh r2, [r5, #0x2c]
	ldrh r1, [r5, #0x2e]
	mov r6, r0
	mov r4, r2, lsl #0xc
	mov r7, r1, lsl #0xc
	mov r0, r7
	mov r1, r4
	bl FX_DivAsync
	ldrsh r0, [r5, #0x22]
	str r0, [r6]
	ldrsh r0, [r5, #0x22]
	str r0, [r6, #0x14]
	bl FX_GetDivResult
	ldrsh r2, [r5, #0x20]
	mov r1, r7
	mul r0, r2, r0
	mov r2, r0, asr #0xc
	mov r0, r4
	str r2, [r6, #4]
	bl FX_DivAsync
	ldrh r1, [r5, #0x2c]
	ldrsh r0, [r5, #0x20]
	mul r0, r1, r0
	mov r0, r0, lsl #4
	str r0, [r6, #0x30]
	ldrh r1, [r5, #0x2e]
	ldrsh r0, [r5, #0x22]
	rsb r1, r1, #0
	sub r0, r0, #0x1000
	mul r0, r1, r0
	mov r0, r0, lsl #4
	str r0, [r6, #0x34]
	bl FX_GetDivResult
	ldrsh r1, [r5, #0x20]
	rsb r1, r1, #0
	mul r0, r1, r0
	mov r0, r0, asr #0xc
	str r0, [r6, #0x10]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end texmtxCalc_flagTS___xsi

	arm_func_start texmtxCalc_flagTR___xsi
texmtxCalc_flagTR___xsi: ; 0x020C76E4
	ldr r2, [r1, #0x18]
	mov r3, #0
	str r2, [r0]
	ldr r2, [r1, #0x1c]
	str r2, [r0, #0x14]
	str r3, [r0, #4]
	str r3, [r0, #0x30]
	ldrh r2, [r1, #0x2e]
	ldr r1, [r1, #0x1c]
	rsb r2, r2, #0
	sub r1, r1, #0x1000
	mul r1, r2, r1
	mov r1, r1, lsl #4
	str r1, [r0, #0x34]
	str r3, [r0, #0x10]
	bx lr
	arm_func_end texmtxCalc_flagTR___xsi

	arm_func_start texmtxCalc_flagTRS___xsi
texmtxCalc_flagTRS___xsi: ; 0x020C7724
	mov r2, #0x1000
	str r2, [r0]
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	bx lr
	arm_func_end texmtxCalc_flagTRS___xsi

	arm_func_start NNSi_G3dSendTexSRTXsi
NNSi_G3dSendTexSRTXsi: ; 0x020C7748
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x4c
	mov r4, r0
	ldr r0, [r4]
	mov r3, #3
	tst r0, #8
	ldrne r0, _020C78C4 ; =0x00101610
	mov r2, #2
	strne r0, [sp]
	ldreq r0, _020C78C8 ; =0x00101810
	mov r1, #0x1000
	streq r0, [sp]
	mov r0, #0
	str r3, [sp, #4]
	str r2, [sp, #0x48]
	str r1, [sp, #0x44]
	str r0, [sp, #0x40]
	str r0, [sp, #0x34]
	str r0, [sp, #0x30]
	str r0, [sp, #0x2c]
	str r0, [sp, #0x28]
	str r0, [sp, #0x24]
	str r0, [sp, #0x20]
	str r0, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r0, [r4]
	tst r0, #1
	strne r1, [r4, #0x1c]
	strne r1, [r4, #0x18]
	ldr r0, [r4]
	tst r0, #2
	beq _020C77D8
	mov r0, #0x1000
	strh r0, [r4, #0x22]
	mov r0, #0
	strh r0, [r4, #0x20]
_020C77D8:
	ldr r0, [r4]
	tst r0, #4
	movne r0, #0
	strne r0, [r4, #0x28]
	strne r0, [r4, #0x24]
	ldr r1, [r4]
	ldr r0, _020C78CC ; =_02110C5C
	and r1, r1, #7
	ldr r2, [r0, r1, lsl #2]
	add r0, sp, #8
	mov r1, r4
	blx r2
	ldr r3, [r4, #0x30]
	cmp r3, #0x1000
	beq _020C7858
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #8]
	ldr r2, [r4, #0x30]
	ldr r0, [sp, #0x38]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0xc]
	ldr r1, [r4, #0x30]
	smull r2, r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x38]
_020C7858:
	ldr r3, [r4, #0x34]
	cmp r3, #0x1000
	beq _020C78A8
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	smull r2, r0, r3, r0
	mov r2, r2, lsr #0xc
	orr r2, r2, r0, lsl #20
	str r2, [sp, #0x18]
	ldr r2, [r4, #0x34]
	ldr r0, [sp, #0x3c]
	smull r3, r1, r2, r1
	mov r2, r3, lsr #0xc
	orr r2, r2, r1, lsl #20
	str r2, [sp, #0x1c]
	ldr r1, [r4, #0x34]
	smull r2, r0, r1, r0
	mov r1, r2, lsr #0xc
	orr r1, r1, r0, lsl #20
	str r1, [sp, #0x3c]
_020C78A8:
	add r1, sp, #0
	ldr r0, [sp]
	add r1, r1, #4
	mov r2, #0x12
	bl NNS_G3dGeBufferOP_N
	add sp, sp, #0x4c
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020C78C4: .word 0x00101610
_020C78C8: .word 0x00101810
_020C78CC: .word _02110C5C
	arm_func_end NNSi_G3dSendTexSRTXsi

	arm_func_start NNS_SndInit
NNS_SndInit: ; 0x020C78D0
	stmdb sp!, {r3, lr}
	ldr r0, _020C7944 ; =_021DD420
	ldr r1, [r0, #0xc]
	cmp r1, #0
	ldmneia sp!, {r3, pc}
	mov r1, #1
	str r1, [r0, #0xc]
	bl SND_Init
	ldr r0, _020C7948 ; =BeginSleep
	ldr r1, _020C7944 ; =_021DD420
	mov r2, #0
	str r0, [r1, #0x10]
	ldr r0, _020C794C ; =EndSleep
	str r2, [r1, #0x14]
	str r0, [r1, #0x1c]
	ldr r0, _020C7950 ; =_021DD430
	str r2, [r1, #0x20]
	bl PM_PrependPreSleepCallback
	ldr r0, _020C7954 ; =_021DD43C
	bl PM_AppendPostSleepCallback
	bl NNSi_SndInitResourceMgr
	bl NNSi_SndCaptureInit
	bl NNSi_SndPlayerInit
	ldr r0, _020C7944 ; =_021DD420
	mvn r1, #0
	strb r1, [r0]
	mov r1, #1
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020C7944: .word _021DD420
_020C7948: .word BeginSleep
_020C794C: .word EndSleep
_020C7950: .word _021DD430
_020C7954: .word _021DD43C
	arm_func_end NNS_SndInit

	arm_func_start NNS_SndMain
NNS_SndMain: ; 0x020C7958
	stmdb sp!, {r4, lr}
	mov r4, #0
_020C7960:
	mov r0, r4
	bl SND_RecvCommandReply
	cmp r0, #0
	bne _020C7960
	bl NNSi_SndPlayerMain
	bl NNSi_SndCaptureMain
	bl NNSi_SndArcStrmMain
	mov r0, #0
	bl SND_FlushCommand
	ldmia sp!, {r4, pc}
	arm_func_end NNS_SndMain

	arm_func_start NNS_SndSetMasterVolume
NNS_SndSetMasterVolume: ; 0x020C7988
	ldr ip, _020C7990 ; =SND_SetMasterVolume
	bx ip
	.align 2, 0
_020C7990: .word SND_SetMasterVolume
	arm_func_end NNS_SndSetMasterVolume

	arm_func_start NNS_SndSetMonoFlag
NNS_SndSetMonoFlag: ; 0x020C7994
	stmdb sp!, {r3, lr}
	cmp r0, #0
	beq _020C79AC
	mov r0, #0x40
	bl SND_SetMasterPan
	ldmia sp!, {r3, pc}
_020C79AC:
	bl SND_ResetMasterPan
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndSetMonoFlag

	arm_func_start NNS_SndUpdateDriverInfo
NNS_SndUpdateDriverInfo: ; 0x020C79B4
	stmdb sp!, {r4, lr}
	ldr r0, _020C7A88 ; =_021DD420
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _020C7A68
	mov r4, #0
_020C79CC:
	mov r0, r4
	bl SND_RecvCommandReply
	cmp r0, #0
	bne _020C79CC
	ldr r0, _020C7A88 ; =_021DD420
	ldr r0, [r0, #8]
	bl SND_IsFinishedCommandTag
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _020C7A88 ; =_021DD420
	ldr r2, _020C7A8C ; =_021DD460
	ldrsb r1, [r0]
	cmp r1, #0
	movlt r1, #1
	strltb r1, [r0]
	ldr r0, _020C7A88 ; =_021DD420
	ldrsb r1, [r0]
	ldr r0, _020C7A90 ; =0x000011E0
	mla r0, r1, r0, r2
	bl SND_ReadDriverInfo
	bl SND_GetCurrentCommandTag
	ldr r1, _020C7A88 ; =_021DD420
	ldr r3, _020C7A8C ; =_021DD460
	str r0, [r1, #8]
	ldrsb r0, [r1]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	strb r0, [r1]
	ldr r0, _020C7A88 ; =_021DD420
	ldr r1, _020C7A90 ; =0x000011E0
	ldrsb r2, [r0]
	mla r0, r2, r1, r3
	bl DC_InvalidateRange
	mov r0, #0
	bl SND_FlushCommand
	mov r0, #1
	ldmia sp!, {r4, pc}
_020C7A68:
	ldr r0, _020C7A8C ; =_021DD460
	bl SND_ReadDriverInfo
	bl SND_GetCurrentCommandTag
	ldr r1, _020C7A88 ; =_021DD420
	str r0, [r1, #8]
	mov r0, #0
	str r0, [r1, #4]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C7A88: .word _021DD420
_020C7A8C: .word _021DD460
_020C7A90: .word 0x000011E0
	arm_func_end NNS_SndUpdateDriverInfo

	arm_func_start NNS_SndReadDriverChannelInfo
NNS_SndReadDriverChannelInfo: ; 0x020C7A94
	stmdb sp!, {r3, lr}
	ldr r2, _020C7AD4 ; =_021DD420
	mov ip, r0
	ldrsb r3, [r2]
	mov r2, r1
	cmp r3, #0
	movlt r0, #0
	ldrge r1, _020C7AD8 ; =_021DD460
	ldrge r0, _020C7ADC ; =0x000011E0
	mlage r0, r3, r0, r1
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	mov r1, ip
	bl SND_ReadChannelInfo
	ldmia sp!, {r3, pc}
	.align 2, 0
_020C7AD4: .word _021DD420
_020C7AD8: .word _021DD460
_020C7ADC: .word 0x000011E0
	arm_func_end NNS_SndReadDriverChannelInfo

	arm_func_start NNSi_SndReadDriverTrackInfo
NNSi_SndReadDriverTrackInfo: ; 0x020C7AE0
	stmdb sp!, {r4, lr}
	ldr r3, _020C7B28 ; =_021DD420
	mov r4, r0
	ldrsb ip, [r3]
	mov lr, r1
	mov r3, r2
	cmp ip, #0
	movlt r0, #0
	ldrge r1, _020C7B2C ; =_021DD460
	ldrge r0, _020C7B30 ; =0x000011E0
	mlage r0, ip, r0, r1
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, r4
	mov r2, lr
	bl SND_ReadTrackInfo
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C7B28: .word _021DD420
_020C7B2C: .word _021DD460
_020C7B30: .word 0x000011E0
	arm_func_end NNSi_SndReadDriverTrackInfo

	arm_func_start BeginSleep
BeginSleep: ; 0x020C7B34
	stmdb sp!, {r4, lr}
	bl NNSi_SndCaptureBeginSleep
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl SND_StopTimer
	bl SND_GetCurrentCommandTag
	mov r4, r0
	mov r0, #1
	bl SND_FlushCommand
	mov r0, r4
	bl SND_WaitForCommandProc
	ldmia sp!, {r4, pc}
	arm_func_end BeginSleep

	arm_func_start EndSleep
EndSleep: ; 0x020C7B6C
	ldr ip, _020C7B74 ; =NNSi_SndCaptureEndSleep
	bx ip
	.align 2, 0
_020C7B74: .word NNSi_SndCaptureEndSleep
	arm_func_end EndSleep

	arm_func_start NNS_SndLockChannel
NNS_SndLockChannel: ; 0x020C7B78
	stmdb sp!, {r4, lr}
	movs r4, r0
	moveq r0, #1
	ldmeqia sp!, {r4, pc}
	ldr r1, _020C7BBC ; =_021DF820
	ldr r1, [r1, #8]
	tst r4, r1
	movne r0, #0
	ldmneia sp!, {r4, pc}
	mov r1, #0
	bl SND_LockChannel
	ldr r1, _020C7BBC ; =_021DF820
	mov r0, #1
	ldr r2, [r1, #8]
	orr r2, r2, r4
	str r2, [r1, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C7BBC: .word _021DF820
	arm_func_end NNS_SndLockChannel

	arm_func_start NNS_SndUnlockChannel
NNS_SndUnlockChannel: ; 0x020C7BC0
	stmdb sp!, {r4, lr}
	movs r4, r0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	bl SND_UnlockChannel
	ldr r0, _020C7BEC ; =_021DF820
	mvn r1, r4
	ldr r2, [r0, #8]
	and r1, r2, r1
	str r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C7BEC: .word _021DF820
	arm_func_end NNS_SndUnlockChannel

	arm_func_start NNS_SndUnlockCapture
NNS_SndUnlockCapture: ; 0x020C7BF0
	ldr r1, _020C7C08 ; =_021DF820
	mvn r0, r0
	ldr r2, [r1]
	and r0, r2, r0
	str r0, [r1]
	bx lr
	.align 2, 0
_020C7C08: .word _021DF820
	arm_func_end NNS_SndUnlockCapture

	arm_func_start NNS_SndAllocAlarm
NNS_SndAllocAlarm: ; 0x020C7C0C
	ldr r0, _020C7C50 ; =_021DF820
	mov r3, #1
	ldr r1, [r0, #4]
	mov r0, #0
_020C7C1C:
	tst r1, r3
	bne _020C7C38
	ldr r1, _020C7C50 ; =_021DF820
	ldr r2, [r1, #4]
	orr r2, r2, r3
	str r2, [r1, #4]
	bx lr
_020C7C38:
	add r0, r0, #1
	cmp r0, #8
	mov r3, r3, lsl #1
	blt _020C7C1C
	mvn r0, #0
	bx lr
	.align 2, 0
_020C7C50: .word _021DF820
	arm_func_end NNS_SndAllocAlarm

	arm_func_start NNS_SndFreeAlarm
NNS_SndFreeAlarm: ; 0x020C7C54
	ldr r1, _020C7C70 ; =_021DF820
	mov r2, #1
	mvn r0, r2, lsl r0
	ldr r2, [r1, #4]
	and r0, r2, r0
	str r0, [r1, #4]
	bx lr
	.align 2, 0
_020C7C70: .word _021DF820
	arm_func_end NNS_SndFreeAlarm

	arm_func_start NNSi_SndInitResourceMgr
NNSi_SndInitResourceMgr: ; 0x020C7C74
	ldr r0, _020C7C8C ; =_021DF820
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_020C7C8C: .word _021DF820
	arm_func_end NNSi_SndInitResourceMgr

	arm_func_start NNS_SndWaveOutAllocChannel
NNS_SndWaveOutAllocChannel: ; 0x020C7C90
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #1
	mov r0, r0, lsl r4
	bl NNS_SndLockChannel
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, #0x14
	mul r0, r4, r0
	ldr r2, _020C7CD0 ; =_021DF82C
	mov r1, #0
	str r4, [r2, r0]
	add r0, r2, r0
	str r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C7CD0: .word _021DF82C
	arm_func_end NNS_SndWaveOutAllocChannel

	arm_func_start NNS_SndWaveOutFreeChannel
NNS_SndWaveOutFreeChannel: ; 0x020C7CD4
	ldr r0, [r0]
	mov r1, #1
	ldr ip, _020C7CE8 ; =NNS_SndUnlockChannel
	mov r0, r1, lsl r0
	bx ip
	.align 2, 0
_020C7CE8: .word NNS_SndUnlockChannel
	arm_func_end NNS_SndWaveOutFreeChannel

	arm_func_start NNS_SndWaveOutStart
NNS_SndWaveOutStart: ; 0x020C7CEC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x18
	movs r8, r1
	mov sb, r0
	mov r7, r2
	mov r6, r3
	beq _020C7D14
	cmp r8, #1
	beq _020C7D28
	b _020C7D38
_020C7D14:
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	mov r4, r1, asr #2
	rsb r5, r4, r0, asr #2
	b _020C7D38
_020C7D28:
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	mov r4, r1, asr #1
	rsb r5, r4, r0, asr #1
_020C7D38:
	ldr r2, [sp, #0x40]
	ldr r0, _020C7E04 ; =0xD87F8000
	mov r3, r2, asr #0x1f
	mov r1, #0x7f
	bl _ll_udiv
	ldr r2, [sp, #0x48]
	mov r3, r2, asr #0x1f
	bl _ll_udiv
	cmp r1, #0
	mov r2, #0x10
	cmpeq r0, #0x10
	mov r3, #0
	movlo r0, r2
	blo _020C7D80
	ldr r2, _020C7E08 ; =0x0000FFFF
	cmp r1, r3
	cmpeq r0, r2
	movhi r0, r2
_020C7D80:
	ldr r1, [sp, #0x44]
	stmia sp, {r4, r5}
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	cmp r6, #0
	movne r3, #1
	ldr r1, [sp, #0x4c]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [sb]
	moveq r3, #2
	mov r1, r8
	mov r2, r7
	bl SND_SetupChannelPcm
	mov r1, #0
	ldr r0, [sb]
	mov r2, #1
	mov r0, r2, lsl r0
	mov r2, r1
	mov r3, r1
	bl SND_StartTimer
	mov r0, #1
	str r0, [sb, #8]
	mov r0, #0
	str r0, [sb, #0xc]
	bl SND_GetCurrentCommandTag
	str r0, [sb, #0x10]
	ldr r1, [sp, #0x40]
	mov r0, #1
	str r1, [sb, #4]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020C7E04: .word 0xD87F8000
_020C7E08: .word 0x0000FFFF
	arm_func_end NNS_SndWaveOutStart

	arm_func_start NNS_SndWaveOutStop
NNS_SndWaveOutStop: ; 0x020C7E0C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4]
	mov r2, #1
	mov r1, #0
	mov r0, r2, lsl r0
	mov r2, r1
	mov r3, r1
	bl SND_StopTimer
	mov r0, #0
	str r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end NNS_SndWaveOutStop

	arm_func_start NNS_SndWaveOutSetVolume
NNS_SndWaveOutSetVolume: ; 0x020C7E48
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #8]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	mov r2, #1
	mov r0, r2, lsl r0
	mov r2, #0
	bl SND_SetChannelVolume
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndWaveOutSetVolume

	arm_func_start NNS_SndWaveOutSetSpeed
NNS_SndWaveOutSetSpeed: ; 0x020C7E70
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #8]
	mov r4, r1
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, [r5, #4]
	ldr r0, _020C7EEC ; =0xD87F8000
	mov r3, r2, asr #0x1f
	mov r1, #0x7f
	bl _ll_udiv
	mov r2, r4
	mov r3, r4, asr #0x1f
	bl _ll_udiv
	mov r3, r0
	cmp r1, #0
	mov r0, #0x10
	cmpeq r3, #0x10
	mov r2, #0
	movlo r3, r0
	blo _020C7ED4
	ldr r0, _020C7EF0 ; =0x0000FFFF
	cmp r1, r2
	cmpeq r3, r0
	movhi r3, r0
_020C7ED4:
	ldr r0, [r5]
	mov r1, #1
	mov r0, r1, lsl r0
	mov r1, r3
	bl SND_SetChannelTimer
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C7EEC: .word 0xD87F8000
_020C7EF0: .word 0x0000FFFF
	arm_func_end NNS_SndWaveOutSetSpeed

	arm_func_start NNS_SndWaveOutSetPan
NNS_SndWaveOutSetPan: ; 0x020C7EF4
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #8]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	mov r2, #1
	mov r0, r2, lsl r0
	bl SND_SetChannelPan
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndWaveOutSetPan

	arm_func_start NNS_SndWaveOutIsPlaying
NNS_SndWaveOutIsPlaying: ; 0x020C7F18
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _020C7F54
	ldr r0, [r4, #0x10]
	bl SND_IsFinishedCommandTag
	cmp r0, #0
	mov r0, #1
	ldmeqia sp!, {r4, pc}
	str r0, [r4, #0xc]
_020C7F54:
	bl SND_GetChannelStatus
	ldr r1, [r4]
	mov r2, #1
	tst r0, r2, lsl r1
	movne r0, r2
	moveq r0, #0
	streq r0, [r4, #8]
	ldmia sp!, {r4, pc}
	arm_func_end NNS_SndWaveOutIsPlaying

	arm_func_start NNS_SndPlayerSetPlayerVolume
NNS_SndPlayerSetPlayerVolume: ; 0x020C7F74
	mov r2, #0x24
	mul r2, r0, r2
	ldr r0, _020C7F88 ; =_021DFDE4
	strb r1, [r0, r2]
	bx lr
	.align 2, 0
_020C7F88: .word _021DFDE4
	arm_func_end NNS_SndPlayerSetPlayerVolume

	arm_func_start NNS_SndPlayerSetPlayableSeqCount
NNS_SndPlayerSetPlayableSeqCount: ; 0x020C7F8C
	mov r2, #0x24
	mul r2, r0, r2
	mov r0, r1, lsl #0x10
	ldr r1, _020C7FA8 ; =_021DFDDC
	mov r0, r0, lsr #0x10
	str r0, [r1, r2]
	bx lr
	.align 2, 0
_020C7FA8: .word _021DFDDC
	arm_func_end NNS_SndPlayerSetPlayableSeqCount

	arm_func_start NNS_SndPlayerSetAllocatableChannel
NNS_SndPlayerSetAllocatableChannel: ; 0x020C7FAC
	mov r2, #0x24
	mul r2, r0, r2
	ldr r0, _020C7FC0 ; =_021DFDE0
	str r1, [r0, r2]
	bx lr
	.align 2, 0
_020C7FC0: .word _021DFDE0
	arm_func_end NNS_SndPlayerSetAllocatableChannel

	arm_func_start NNS_SndPlayerCreateHeap
NNS_SndPlayerCreateHeap: ; 0x020C7FC4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r2
	mov r6, r0
	mov r0, r1
	mov r3, #0
	ldr r2, _020C8050 ; =PlayerHeapDisposeCallback
	add r1, r5, #0x14
	str r3, [sp]
	bl NNS_SndHeapAlloc
	movs r4, r0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	mov r2, #0
	str r2, [r4, #0xc]
	str r6, [r4, #0x10]
	mov r1, r5
	add r0, r4, #0x14
	str r2, [r4, #8]
	bl NNS_SndHeapCreate
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r2, _020C8054 ; =_021DFDC4
	mov r1, #0x24
	mla r2, r6, r1, r2
	str r0, [r4, #8]
	mov r1, r4
	add r0, r2, #0xc
	bl NNS_FndAppendListObject
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020C8050: .word PlayerHeapDisposeCallback
_020C8054: .word _021DFDC4
	arm_func_end NNS_SndPlayerCreateHeap

	arm_func_start NNS_SndPlayerStopSeq
NNS_SndPlayerStopSeq: ; 0x020C8058
	ldr ip, _020C8064 ; =NNSi_SndPlayerStopSeq
	ldr r0, [r0]
	bx ip
	.align 2, 0
_020C8064: .word NNSi_SndPlayerStopSeq
	arm_func_end NNS_SndPlayerStopSeq

	arm_func_start NNS_SndPlayerStopSeqByPlayerNo
NNS_SndPlayerStopSeqByPlayerNo: ; 0x020C8068
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r3, _020C80BC ; =_021DFDC4
	mov r2, #0x24
	mla r6, r0, r2, r3
	ldr r5, _020C80C0 ; =_021DF984
	mov r7, r1
	mov r4, #0
_020C8084:
	ldrb r0, [r5, #0x2c]
	cmp r0, #0
	beq _020C80A8
	ldr r0, [r5, #4]
	cmp r0, r6
	bne _020C80A8
	mov r0, r5
	mov r1, r7
	bl NNSi_SndPlayerStopSeq
_020C80A8:
	add r4, r4, #1
	cmp r4, #0x10
	add r5, r5, #0x44
	blt _020C8084
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020C80BC: .word _021DFDC4
_020C80C0: .word _021DF984
	arm_func_end NNS_SndPlayerStopSeqByPlayerNo

	arm_func_start NNS_SndPlayerStopSeqBySeqNo
NNS_SndPlayerStopSeqBySeqNo: ; 0x020C80C4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r5, _020C8118 ; =_021DF984
	mov r7, r0
	mov r6, r1
	mov r4, #0
_020C80D8:
	ldrb r0, [r5, #0x2c]
	cmp r0, #0
	beq _020C8104
	ldrh r0, [r5, #0x34]
	cmp r0, #1
	ldreqh r0, [r5, #0x38]
	cmpeq r0, r7
	bne _020C8104
	mov r0, r5
	mov r1, r6
	bl NNSi_SndPlayerStopSeq
_020C8104:
	add r4, r4, #1
	cmp r4, #0x10
	add r5, r5, #0x44
	blt _020C80D8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020C8118: .word _021DF984
	arm_func_end NNS_SndPlayerStopSeqBySeqNo

	arm_func_start NNS_SndPlayerStopSeqAll
NNS_SndPlayerStopSeqAll: ; 0x020C811C
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, _020C8158 ; =_021DF984
	mov r6, r0
	mov r4, #0
_020C812C:
	ldrb r0, [r5, #0x2c]
	cmp r0, #0
	beq _020C8144
	mov r0, r5
	mov r1, r6
	bl NNSi_SndPlayerStopSeq
_020C8144:
	add r4, r4, #1
	cmp r4, #0x10
	add r5, r5, #0x44
	blt _020C812C
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020C8158: .word _021DF984
	arm_func_end NNS_SndPlayerStopSeqAll

	arm_func_start NNS_SndPlayerPause
NNS_SndPlayerPause: ; 0x020C815C
	ldr ip, _020C8168 ; =NNSi_SndPlayerPause
	ldr r0, [r0]
	bx ip
	.align 2, 0
_020C8168: .word NNSi_SndPlayerPause
	arm_func_end NNS_SndPlayerPause

	arm_func_start NNS_SndPlayerPauseByPlayerNo
NNS_SndPlayerPauseByPlayerNo: ; 0x020C816C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r2, #0x24
	mul r6, r0, r2
	ldr r5, _020C81C0 ; =_021DFDC4
	mov r8, r1
	add r0, r5, r6
	mov r1, #0
	bl NNS_FndGetNextListObject
	movs r7, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_020C8194:
	mov r1, r7
	add r0, r5, r6
	bl NNS_FndGetNextListObject
	mov r4, r0
	mov r0, r7
	mov r1, r8
	bl NNSi_SndPlayerPause
	mov r7, r4
	cmp r4, #0
	bne _020C8194
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020C81C0: .word _021DFDC4
	arm_func_end NNS_SndPlayerPauseByPlayerNo

	arm_func_start NNS_SndHandleInit
NNS_SndHandleInit: ; 0x020C81C4
	mov r1, #0
	str r1, [r0]
	bx lr
	arm_func_end NNS_SndHandleInit

	arm_func_start NNS_SndHandleReleaseSeq
NNS_SndHandleReleaseSeq: ; 0x020C81D0
	ldr r1, [r0]
	cmp r1, #0
	bxeq lr
	ldr r1, [r0]
	mov r2, #0
	str r2, [r1]
	str r2, [r0]
	bx lr
	arm_func_end NNS_SndHandleReleaseSeq

	arm_func_start NNS_SndPlayerCountPlayingSeqByPlayerNo
NNS_SndPlayerCountPlayingSeqByPlayerNo: ; 0x020C81F0
	mov r1, #0x24
	mul r1, r0, r1
	ldr r0, _020C8204 ; =_021DFDCC
	ldrh r0, [r0, r1]
	bx lr
	.align 2, 0
_020C8204: .word _021DFDCC
	arm_func_end NNS_SndPlayerCountPlayingSeqByPlayerNo

	arm_func_start NNS_SndPlayerSetVolume
NNS_SndPlayerSetVolume: ; 0x020C8208
	ldr r2, [r0]
	cmp r2, #0
	ldrne r0, [r0]
	strneb r1, [r0, #0x41]
	bx lr
	arm_func_end NNS_SndPlayerSetVolume

	arm_func_start NNS_SndPlayerSetInitialVolume
NNS_SndPlayerSetInitialVolume: ; 0x020C821C
	ldr r2, [r0]
	cmp r2, #0
	ldrne r0, [r0]
	strneb r1, [r0, #0x40]
	bx lr
	arm_func_end NNS_SndPlayerSetInitialVolume

	arm_func_start NNS_SndPlayerMoveVolume
NNS_SndPlayerMoveVolume: ; 0x020C8230
	stmdb sp!, {r3, lr}
	ldr r3, [r0]
	cmp r3, #0
	ldrne r3, [r0]
	ldrneb r0, [r3, #0x2c]
	cmpne r0, #2
	ldmeqia sp!, {r3, pc}
	add r0, r3, #0x1c
	mov r1, r1, lsl #8
	bl NNSi_SndFaderSet
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndPlayerMoveVolume

	arm_func_start NNS_SndPlayerSetChannelPriority
NNS_SndPlayerSetChannelPriority: ; 0x020C825C
	stmdb sp!, {r3, lr}
	ldr r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl SND_SetPlayerChannelPriority
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndPlayerSetChannelPriority

	arm_func_start NNS_SndPlayerSetTrackPitch
NNS_SndPlayerSetTrackPitch: ; 0x020C827C
	stmdb sp!, {r3, lr}
	ldr r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl SND_SetTrackPitch
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndPlayerSetTrackPitch

	arm_func_start NNS_SndPlayerSetTrackPan
NNS_SndPlayerSetTrackPan: ; 0x020C829C
	stmdb sp!, {r3, lr}
	ldr r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl SND_SetTrackPan
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndPlayerSetTrackPan

	arm_func_start NNS_SndPlayerSetTrackAllocatableChannel
NNS_SndPlayerSetTrackAllocatableChannel: ; 0x020C82BC
	stmdb sp!, {r3, lr}
	ldr r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl SND_SetTrackAllocatableChannel
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndPlayerSetTrackAllocatableChannel

	arm_func_start NNS_SndPlayerSetTempoRatio
NNS_SndPlayerSetTempoRatio: ; 0x020C82DC
	stmdb sp!, {r3, lr}
	ldr r2, [r0]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl SND_SetPlayerTempoRatio
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndPlayerSetTempoRatio

	arm_func_start NNS_SndPlayerSetSeqNo
NNS_SndPlayerSetSeqNo: ; 0x020C82FC
	ldr r2, [r0]
	cmp r2, #0
	bxeq lr
	ldr r2, [r0]
	mov r3, #1
	strh r3, [r2, #0x34]
	ldr r0, [r0]
	strh r1, [r0, #0x38]
	bx lr
	arm_func_end NNS_SndPlayerSetSeqNo

	arm_func_start NNS_SndPlayerSetSeqArcNo
NNS_SndPlayerSetSeqArcNo: ; 0x020C8320
	ldr r3, [r0]
	cmp r3, #0
	bxeq lr
	ldr r3, [r0]
	mov ip, #2
	strh ip, [r3, #0x34]
	ldr r3, [r0]
	strh r1, [r3, #0x38]
	ldr r0, [r0]
	strh r2, [r0, #0x3a]
	bx lr
	arm_func_end NNS_SndPlayerSetSeqArcNo

	arm_func_start NNS_SndPlayerGetSeqNo
NNS_SndPlayerGetSeqNo: ; 0x020C834C
	ldr r1, [r0]
	cmp r1, #0
	mvneq r0, #0
	bxeq lr
	ldr r1, [r0]
	ldrh r0, [r1, #0x34]
	cmp r0, #1
	mvnne r0, #0
	ldreqh r0, [r1, #0x38]
	bx lr
	arm_func_end NNS_SndPlayerGetSeqNo

	arm_func_start NNS_SndPlayerReadVariable
NNS_SndPlayerReadVariable: ; 0x020C8374
	stmdb sp!, {r4, lr}
	ldr r3, [r0]
	mov r4, r2
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r2, [r0]
	ldrb r0, [r2, #0x2d]
	cmp r0, #0
	bne _020C83AC
	mvn r0, #0
	strh r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
_020C83AC:
	ldrb r0, [r2, #0x3c]
	bl SND_GetPlayerLocalVariable
	strh r0, [r4]
	mov r0, #1
	ldmia sp!, {r4, pc}
	arm_func_end NNS_SndPlayerReadVariable

	arm_func_start NNS_SndPlayerReadDriverTrackInfo
NNS_SndPlayerReadDriverTrackInfo: ; 0x020C83C0
	stmdb sp!, {r3, lr}
	ldr r3, [r0]
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0]
	ldrb r0, [r0, #0x3c]
	bl NNSi_SndReadDriverTrackInfo
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndPlayerReadDriverTrackInfo

	arm_func_start NNSi_SndPlayerInit
NNSi_SndPlayerInit: ; 0x020C83E4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r0, _020C8488 ; =_021DF978
	mov r1, #0x14
	bl NNS_FndInitList
	ldr r0, _020C848C ; =_021DF96C
	mov r1, #0x14
	bl NNS_FndInitList
	mov r6, #0
	ldr r7, _020C8490 ; =_021DF984
	ldr r4, _020C848C ; =_021DF96C
	mov r5, r6
_020C8410:
	strb r5, [r7, #0x2c]
	mov r0, r4
	mov r1, r7
	strb r6, [r7, #0x3c]
	bl NNS_FndAppendListObject
	add r6, r6, #1
	cmp r6, #0x10
	add r7, r7, #0x44
	blt _020C8410
	mov sl, #0
	ldr sb, _020C8494 ; =_021DFDC4
	mov r8, #0xc
	mov r7, sl
	mov r6, #0x7f
	mov r5, #1
	mov r4, sl
_020C8450:
	mov r0, sb
	mov r1, r8
	bl NNS_FndInitList
	mov r1, r7
	add r0, sb, #0xc
	bl NNS_FndInitList
	strb r6, [sb, #0x20]
	str r5, [sb, #0x18]
	add sl, sl, #1
	str r4, [sb, #0x1c]
	cmp sl, #0x20
	add sb, sb, #0x24
	blt _020C8450
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020C8488: .word _021DF978
_020C848C: .word _021DF96C
_020C8490: .word _021DF984
_020C8494: .word _021DFDC4
	arm_func_end NNSi_SndPlayerInit

	arm_func_start NNSi_SndPlayerMain
NNSi_SndPlayerMain: ; 0x020C8498
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	bl SND_GetPlayerStatus
	mov fp, r0
	ldr r0, _020C85F0 ; =_021DF978
	mov r1, #0
	bl NNS_FndGetNextListObject
	movs r6, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r4, #0x8000
	ldr r5, _020C85F4 ; =_0210D750
	rsb r4, r4, #0
_020C84C4:
	ldr r0, _020C85F0 ; =_021DF978
	mov r1, r6
	bl NNS_FndGetNextListObject
	ldrb r1, [r6, #0x2d]
	mov r7, r0
	cmp r1, #0
	bne _020C84F4
	ldr r0, [r6, #0x30]
	bl SND_IsFinishedCommandTag
	cmp r0, #0
	movne r0, #1
	strneb r0, [r6, #0x2d]
_020C84F4:
	ldrb r0, [r6, #0x2d]
	cmp r0, #0
	beq _020C851C
	ldrb r1, [r6, #0x3c]
	mov r0, #1
	tst fp, r0, lsl r1
	bne _020C851C
	mov r0, r6
	bl ShutdownPlayer
	b _020C85E0
_020C851C:
	add r0, r6, #0x1c
	bl NNSi_SndFaderUpdate
	ldr r0, [r6, #4]
	ldrb r2, [r6, #0x41]
	ldrb r0, [r0, #0x20]
	ldrb r1, [r6, #0x40]
	mov r2, r2, lsl #1
	mov r0, r0, lsl #1
	mov r1, r1, lsl #1
	ldrsh sl, [r5, r0]
	add r0, r6, #0x1c
	ldrsh r8, [r5, r2]
	ldrsh sb, [r5, r1]
	bl NNSi_SndFaderGet
	mov r0, r0, asr #8
	mov r0, r0, lsl #1
	add r1, sb, r8
	ldrsh r0, [r5, r0]
	add r1, sl, r1
	add r8, r0, r1
	cmp r8, r4
	movlt r8, r4
	blt _020C8584
	ldr r0, _020C85F8 ; =0x00007FFF
	cmp r8, r0
	movgt r8, r0
_020C8584:
	ldrsh r0, [r6, #0x3e]
	cmp r8, r0
	beq _020C85A0
	ldrb r0, [r6, #0x3c]
	mov r1, r8
	bl SND_SetPlayerVolume
	strh r8, [r6, #0x3e]
_020C85A0:
	ldrb r0, [r6, #0x2c]
	cmp r0, #2
	bne _020C85C4
	add r0, r6, #0x1c
	bl NNSi_SndFaderIsFinished
	cmp r0, #0
	beq _020C85C4
	mov r0, r6
	bl ForceStopSeq
_020C85C4:
	ldrb r0, [r6, #0x2f]
	cmp r0, #0
	beq _020C85E0
	ldrb r0, [r6, #0x3c]
	bl SND_StartPreparedSeq
	mov r0, #0
	strb r0, [r6, #0x2f]
_020C85E0:
	mov r6, r7
	cmp r7, #0
	bne _020C84C4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C85F0: .word _021DF978
_020C85F4: .word _0210D750
_020C85F8: .word 0x00007FFF
	arm_func_end NNSi_SndPlayerMain

	arm_func_start NNSi_SndPlayerAllocSeqPlayer
NNSi_SndPlayerAllocSeqPlayer: ; 0x020C85FC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, _020C8690 ; =_021DFDC4
	mov r3, #0x24
	mov r4, r0
	ldr r5, [r4]
	mla r6, r1, r3, ip
	mov r7, r2
	cmp r5, #0
	beq _020C8624
	bl NNS_SndHandleReleaseSeq
_020C8624:
	ldrh r1, [r6, #8]
	ldr r0, [r6, #0x18]
	cmp r1, r0
	blo _020C8660
	mov r0, r6
	mov r1, #0
	bl NNS_FndGetNextListObject
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r1, [r0, #0x3d]
	cmp r7, r1
	movlt r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, pc}
	bl ForceStopSeq
_020C8660:
	mov r0, r7
	bl AllocSeqPlayer
	movs r5, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r6
	mov r1, r5
	bl InsertPlayerList
	str r4, [r5]
	mov r0, r5
	str r5, [r4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020C8690: .word _021DFDC4
	arm_func_end NNSi_SndPlayerAllocSeqPlayer

	arm_func_start NNSi_SndPlayerFreeSeqPlayer
NNSi_SndPlayerFreeSeqPlayer: ; 0x020C8694
	ldr ip, _020C869C ; =ShutdownPlayer
	bx ip
	.align 2, 0
_020C869C: .word ShutdownPlayer
	arm_func_end NNSi_SndPlayerFreeSeqPlayer

	arm_func_start NNSi_SndPlayerStartSeq
NNSi_SndPlayerStartSeq: ; 0x020C86A0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #0x3c]
	ldr r4, [r5, #4]
	bl SND_PrepareSeq
	ldr r2, [r4, #0x1c]
	cmp r2, #0
	beq _020C86CC
	ldrb r0, [r5, #0x3c]
	ldr r1, _020C86EC ; =0x0000FFFF
	bl SND_SetTrackAllocatableChannel
_020C86CC:
	mov r0, r5
	bl InitPlayer
	bl SND_GetCurrentCommandTag
	str r0, [r5, #0x30]
	mov r0, #1
	strb r0, [r5, #0x2f]
	strb r0, [r5, #0x2c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C86EC: .word 0x0000FFFF
	arm_func_end NNSi_SndPlayerStartSeq

	arm_func_start NNSi_SndPlayerStopSeq
NNSi_SndPlayerStopSeq: ; 0x020C86F0
	stmdb sp!, {r4, lr}
	movs r4, r0
	mov r2, r1
	ldrneb r1, [r4, #0x2c]
	cmpne r1, #0
	ldmeqia sp!, {r4, pc}
	cmp r2, #0
	bne _020C8718
	bl ForceStopSeq
	ldmia sp!, {r4, pc}
_020C8718:
	add r0, r4, #0x1c
	mov r1, #0
	bl NNSi_SndFaderSet
	mov r0, r4
	mov r1, #0
	bl SetPlayerPriority
	mov r0, #2
	strb r0, [r4, #0x2c]
	ldmia sp!, {r4, pc}
	arm_func_end NNSi_SndPlayerStopSeq

	arm_func_start NNSi_SndPlayerPause
NNSi_SndPlayerPause: ; 0x020C873C
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	ldrneb r0, [r5, #0x2e]
	mov r4, r1
	cmpne r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #0x3c]
	bl SND_PauseSeq
	strb r4, [r5, #0x2e]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNSi_SndPlayerPause

	arm_func_start NNSi_SndPlayerAllocHeap
NNSi_SndPlayerAllocHeap: ; 0x020C8764
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _020C87B4 ; =_021DFDC4
	mov r2, #0x24
	mla r5, r0, r2, r3
	mov r6, r1
	add r0, r5, #0xc
	mov r1, #0
	bl NNS_FndGetNextListObject
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r1, r4
	add r0, r5, #0xc
	bl NNS_FndRemoveListObject
	str r6, [r4, #0xc]
	str r4, [r6, #8]
	ldr r0, [r4, #8]
	bl NNS_SndHeapClear
	ldr r0, [r4, #8]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020C87B4: .word _021DFDC4
	arm_func_end NNSi_SndPlayerAllocHeap

	arm_func_start InitPlayer
InitPlayer: ; 0x020C87B8
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, #0
	strb r0, [r4, #0x2e]
	strb r0, [r4, #0x2d]
	strb r0, [r4, #0x2f]
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x3e]
	mov r1, #0x7f
	strb r1, [r4, #0x40]
	add r0, r4, #0x1c
	strb r1, [r4, #0x41]
	bl NNSi_SndFaderInit
	add r0, r4, #0x1c
	mov r1, #0x7f00
	mov r2, #1
	bl NNSi_SndFaderSet
	ldmia sp!, {r4, pc}
	arm_func_end InitPlayer

	arm_func_start InsertPlayerList
InsertPlayerList: ; 0x020C8800
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0
	mov r5, r0
	bl NNS_FndGetNextListObject
	movs r1, r0
	beq _020C883C
_020C881C:
	ldrb r2, [r4, #0x3d]
	ldrb r0, [r1, #0x3d]
	cmp r2, r0
	blo _020C883C
	mov r0, r5
	bl NNS_FndGetNextListObject
	movs r1, r0
	bne _020C881C
_020C883C:
	mov r0, r5
	mov r2, r4
	bl NNS_FndInsertListObject
	str r5, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end InsertPlayerList

	arm_func_start InsertPrioList
InsertPrioList: ; 0x020C8850
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _020C88A0 ; =_021DF978
	mov r1, #0
	bl NNS_FndGetNextListObject
	movs r1, r0
	beq _020C8890
	ldr r4, _020C88A0 ; =_021DF978
_020C8870:
	ldrb r2, [r5, #0x3d]
	ldrb r0, [r1, #0x3d]
	cmp r2, r0
	blo _020C8890
	mov r0, r4
	bl NNS_FndGetNextListObject
	movs r1, r0
	bne _020C8870
_020C8890:
	ldr r0, _020C88A0 ; =_021DF978
	mov r2, r5
	bl NNS_FndInsertListObject
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C88A0: .word _021DF978
	arm_func_end InsertPrioList

	arm_func_start ForceStopSeq
ForceStopSeq: ; 0x020C88A4
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrb r0, [r4, #0x2c]
	cmp r0, #2
	bne _020C88C4
	ldrb r0, [r4, #0x3c]
	ldr r1, _020C88D8 ; =0xFFFFFD2D
	bl SND_SetPlayerVolume
_020C88C4:
	ldrb r0, [r4, #0x3c]
	bl SND_StopSeq
	mov r0, r4
	bl ShutdownPlayer
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C88D8: .word 0xFFFFFD2D
	arm_func_end ForceStopSeq

	arm_func_start AllocSeqPlayer
AllocSeqPlayer: ; 0x020C88DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, _020C893C ; =_021DF96C
	mov r1, #0
	bl NNS_FndGetNextListObject
	movs r4, r0
	bne _020C891C
	ldr r0, _020C8940 ; =_021DF978
	mov r1, #0
	bl NNS_FndGetNextListObject
	mov r4, r0
	ldrb r1, [r4, #0x3d]
	cmp r5, r1
	movlt r0, #0
	ldmltia sp!, {r3, r4, r5, pc}
	bl ForceStopSeq
_020C891C:
	ldr r0, _020C893C ; =_021DF96C
	mov r1, r4
	bl NNS_FndRemoveListObject
	mov r0, r4
	strb r5, [r4, #0x3d]
	bl InsertPrioList
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C893C: .word _021DF96C
_020C8940: .word _021DF978
	arm_func_end AllocSeqPlayer

	arm_func_start ShutdownPlayer
ShutdownPlayer: ; 0x020C8944
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r1, [r4]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1]
	strne r0, [r4]
	ldr r5, [r4, #4]
	mov r1, r4
	mov r0, r5
	bl NNS_FndRemoveListObject
	mov r0, #0
	str r0, [r4, #4]
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _020C899C
	add r0, r5, #0xc
	bl NNS_FndAppendListObject
	ldr r0, [r4, #8]
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r4, #8]
_020C899C:
	ldr r0, _020C89C0 ; =_021DF978
	mov r1, r4
	bl NNS_FndRemoveListObject
	ldr r0, _020C89C4 ; =_021DF96C
	mov r1, r4
	bl NNS_FndAppendListObject
	mov r0, #0
	strb r0, [r4, #0x2c]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C89C0: .word _021DF978
_020C89C4: .word _021DF96C
	arm_func_end ShutdownPlayer

	arm_func_start PlayerHeapDisposeCallback
PlayerHeapDisposeCallback: ; 0x020C89C8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #8]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl NNS_SndHeapDestroy
	ldr r1, [r4, #0xc]
	cmp r1, #0
	movne r0, #0
	strne r0, [r1, #8]
	ldmneia sp!, {r4, pc}
	ldr r1, [r4, #0x10]
	ldr r2, _020C8A14 ; =_021DFDC4
	mov r0, #0x24
	mla r0, r1, r0, r2
	mov r1, r4
	add r0, r0, #0xc
	bl NNS_FndRemoveListObject
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C8A14: .word _021DFDC4
	arm_func_end PlayerHeapDisposeCallback

	arm_func_start SetPlayerPriority
SetPlayerPriority: ; 0x020C8A18
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r4, [r6, #4]
	mov r5, r1
	cmp r4, #0
	beq _020C8A44
	mov r0, r4
	mov r1, r6
	bl NNS_FndRemoveListObject
	mov r0, #0
	str r0, [r6, #4]
_020C8A44:
	ldr r0, _020C8A74 ; =_021DF978
	mov r1, r6
	bl NNS_FndRemoveListObject
	strb r5, [r6, #0x3d]
	cmp r4, #0
	beq _020C8A68
	mov r0, r4
	mov r1, r6
	bl InsertPlayerList
_020C8A68:
	mov r0, r6
	bl InsertPrioList
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020C8A74: .word _021DF978
	arm_func_end SetPlayerPriority

	arm_func_start NNS_SndStrmInit
NNS_SndStrmInit: ; 0x020C8A78
	stmdb sp!, {r4, lr}
	ldr r1, _020C8AE0 ; =_021E0244
	mov r4, r0
	ldr r0, [r1]
	cmp r0, #0
	bne _020C8AA8
	ldr r0, _020C8AE4 ; =_021E0248
	mov r1, #0
	bl NNS_FndInitList
	ldr r0, _020C8AE0 ; =_021E0244
	mov r1, #1
	str r1, [r0]
_020C8AA8:
	ldr r1, _020C8AE8 ; =BeginSleep__Strm
	ldr r0, _020C8AEC ; =EndSleep__Strm
	str r1, [r4, #8]
	str r4, [r4, #0xc]
	str r0, [r4, #0x14]
	str r4, [r4, #0x18]
	mov r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	ldr r0, [r4, #0x24]
	bic r0, r0, #1
	bic r0, r0, #2
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C8AE0: .word _021E0244
_020C8AE4: .word _021E0248
_020C8AE8: .word BeginSleep__Strm
_020C8AEC: .word EndSleep__Strm
	arm_func_end NNS_SndStrmInit

	arm_func_start NNS_SndStrmAllocChannel
NNS_SndStrmAllocChannel: ; 0x020C8AF0
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	mov r6, #0
	mov r5, r0
	mov ip, r6
	cmp r4, #0
	ble _020C8B30
	mov r1, #1
_020C8B10:
	ldrb r3, [r2, ip]
	add r0, r5, ip
	strb r3, [r0, #0x4c]
	ldrb r0, [r2, ip]
	add ip, ip, #1
	cmp ip, r4
	orr r6, r6, r1, lsl r0
	blt _020C8B10
_020C8B30:
	mov r0, r6
	bl NNS_SndLockChannel
	cmp r0, #0
	moveq r0, #0
	strne r4, [r5, #0x48]
	strne r6, [r5, #0x44]
	movne r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNS_SndStrmAllocChannel

	arm_func_start NNS_SndStrmFreeChannel
NNS_SndStrmFreeChannel: ; 0x020C8B50
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x44]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl NNS_SndUnlockChannel
	mov r0, #0
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	ldmia sp!, {r4, pc}
	arm_func_end NNS_SndStrmFreeChannel

	arm_func_start NNS_SndStrmSetup
NNS_SndStrmSetup: ; 0x020C8B78
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov sl, r0
	ldr r4, [sl, #0x24]
	mov sb, r1
	mov r1, r4, lsl #0x1f
	mov r8, r2
	mov r4, r3
	movs r1, r1, asr #0x1f
	ldr fp, [sp, #0x44]
	beq _020C8BA8
	bl NNS_SndStrmStop
_020C8BA8:
	ldr r2, [sl, #0x48]
	mov r0, fp, lsl #5
	mul r1, r2, r0
	mov r0, r4
	bl _u32_div_f
	mul r1, r0, fp
	mov r0, r1, lsl #5
	ldr r2, [sp, #0x40]
	str r0, [sl, #0x28]
	cmp sb, #1
	moveq r0, r0, lsr #1
	mul r0, r2, r0
	mov r1, fp
	bl _u32_div_f
	str r0, [sp, #0x18]
	bl NNS_SndAllocAlarm
	cmp r0, #0
	str r0, [sl, #0x40]
	addlt sp, sp, #0x1c
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sl, #0x48]
	mov r6, #0
	cmp r0, #0
	ble _020C8C80
	ldr r0, [sp, #0x40]
	ldr r5, _020C8D0C ; =_021E0294
	mov r7, r0, lsl #5
	mov r4, r6
_020C8C1C:
	ldr r1, [sl, #0x28]
	add r0, sl, r6
	mla r2, r1, r6, r8
	ldrb r0, [r0, #0x4c]
	mov r3, #1
	str r2, [r5, r0, lsl #3]
	add r1, r5, r0, lsl #3
	str r4, [r1, #4]
	str r4, [sp]
	ldr r2, [sl, #0x28]
	mov r1, sb
	mov r2, r2, lsr #2
	str r2, [sp, #4]
	mov r2, #0x7f
	str r2, [sp, #8]
	str r4, [sp, #0xc]
	str r7, [sp, #0x10]
	mov r2, #0x40
	str r2, [sp, #0x14]
	ldr r2, [r5, r0, lsl #3]
	bl SND_SetupChannelPcm
	ldr r0, [sl, #0x48]
	add r6, r6, #1
	cmp r6, r0
	blt _020C8C1C
_020C8C80:
	str sl, [sp]
	ldr r1, [sp, #0x18]
	ldr r0, [sl, #0x40]
	ldr r3, _020C8D10 ; =AlarmCallback
	mov r2, r1
	bl SND_SetupAlarm
	ldr r0, _020C8D14 ; =_021E0248
	mov r1, sl
	bl NNS_FndAppendListObject
	str sb, [sl, #0x20]
	ldr r1, [sp, #0x48]
	str fp, [sl, #0x2c]
	ldr r0, [sp, #0x4c]
	str r1, [sl, #0x30]
	str r0, [sl, #0x34]
	mov r0, #0
	str r0, [sl, #0x38]
	str r0, [sl, #0x3c]
	ldr r0, [sl, #0x24]
	bic r0, r0, #1
	orr r0, r0, #1
	str r0, [sl, #0x24]
	bl OS_DisableInterrupts
	mov r4, r0
	mov r2, #1
	mov r0, sl
	mov r1, #0
	str r2, [sl, #0x2c]
	bl StrmCallback
	mov r0, r4
	str fp, [sl, #0x2c]
	bl OS_RestoreInterrupts
	mov r0, #1
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C8D0C: .word _021E0294
_020C8D10: .word AlarmCallback
_020C8D14: .word _021E0248
	arm_func_end NNS_SndStrmSetup

	arm_func_start NNS_SndStrmStart
NNS_SndStrmStart: ; 0x020C8D18
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x40]
	mov r2, #1
	mov r1, #0
	mov r2, r2, lsl r0
	ldr r0, [r4, #0x44]
	mov r3, r1
	bl SND_StartTimer
	ldr r0, [r4, #0x24]
	mov r0, r0, lsl #0x1e
	movs r0, r0, asr #0x1f
	ldmneia sp!, {r4, pc}
	add r0, r4, #8
	bl PM_PrependPreSleepCallback
	add r0, r4, #0x14
	bl PM_AppendPostSleepCallback
	ldr r0, [r4, #0x24]
	orr r0, r0, #2
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	arm_func_end NNS_SndStrmStart

	arm_func_start NNS_SndStrmStop
NNS_SndStrmStop: ; 0x020C8D6C
	stmdb sp!, {r3, lr}
	ldr r1, [r0, #0x24]
	mov r1, r1, lsl #0x1f
	movs r1, r1, asr #0x1f
	ldmeqia sp!, {r3, pc}
	bl ForceStopStrm
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndStrmStop

	arm_func_start NNS_SndStrmSetVolume
NNS_SndStrmSetVolume: ; 0x020C8D88
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	str r1, [r7, #0x3c]
	ldr r0, [r7, #0x48]
	mov r6, #0
	cmp r0, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r4, _020C8DF0 ; =_021E0294
	mov r8, #1
_020C8DAC:
	add r0, r7, r6
	ldrb r5, [r0, #0x4c]
	ldr r1, [r7, #0x3c]
	add r0, r4, r5, lsl #3
	ldr r0, [r0, #4]
	add r0, r1, r0
	bl SND_CalcChannelVolume
	mov r2, r0
	mov r0, r8, lsl r5
	and r1, r2, #0xff
	mov r2, r2, asr #8
	bl SND_SetChannelVolume
	ldr r0, [r7, #0x48]
	add r6, r6, #1
	cmp r6, r0
	blt _020C8DAC
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020C8DF0: .word _021E0294
	arm_func_end NNS_SndStrmSetVolume

	arm_func_start ForceStopStrm
ForceStopStrm: ; 0x020C8DF4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r0, [r4, #0x24]
	mov r0, r0, lsl #0x1e
	movs r0, r0, asr #0x1f
	beq _020C8E5C
	ldr r0, [r4, #0x40]
	mov r2, #1
	mov r1, #0
	mov r2, r2, lsl r0
	ldr r0, [r4, #0x44]
	mov r3, r1
	bl SND_StopTimer
	add r0, r4, #8
	bl PM_DeletePreSleepCallback
	add r0, r4, #0x14
	bl PM_DeletePostSleepCallback
	ldr r0, [r4, #0x24]
	bic r0, r0, #2
	str r0, [r4, #0x24]
	bl SND_GetCurrentCommandTag
	mov r5, r0
	mov r0, #1
	bl SND_FlushCommand
	mov r0, r5
	bl SND_WaitForCommandProc
_020C8E5C:
	mov r0, r4
	bl ShutdownStrm
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ForceStopStrm

	arm_func_start ShutdownStrm
ShutdownStrm: ; 0x020C8E68
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x40]
	bl NNS_SndFreeAlarm
	ldr r0, _020C8E94 ; =_021E0248
	mov r1, r4
	bl NNS_FndRemoveListObject
	ldr r0, [r4, #0x24]
	bic r0, r0, #1
	str r0, [r4, #0x24]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C8E94: .word _021E0248
	arm_func_end ShutdownStrm

	arm_func_start AlarmCallback
AlarmCallback: ; 0x020C8E98
	ldr ip, _020C8EA4 ; =StrmCallback
	mov r1, #1
	bx ip
	.align 2, 0
_020C8EA4: .word StrmCallback
	arm_func_end AlarmCallback

	arm_func_start StrmCallback
StrmCallback: ; 0x020C8EA8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	ldr r0, [r5, #0x28]
	ldr r1, [r5, #0x2c]
	bl _u32_div_f
	ldr r1, [r5, #0x48]
	ldr r2, [r5, #0x38]
	mov r3, r0
	mul ip, r3, r2
	cmp r1, #0
	mov lr, #0
	ble _020C8F0C
	ldr r2, _020C8F50 ; =_021E0294
	ldr r0, _020C8F54 ; =_021E0254
_020C8EE8:
	add r1, r5, lr
	ldrb r1, [r1, #0x4c]
	ldr r1, [r2, r1, lsl #3]
	add r1, r1, ip
	str r1, [r0, lr, lsl #2]
	ldr r1, [r5, #0x48]
	add lr, lr, #1
	cmp lr, r1
	blt _020C8EE8
_020C8F0C:
	ldr r0, [r5, #0x20]
	ldr r2, _020C8F54 ; =_021E0254
	str r0, [sp]
	ldr ip, [r5, #0x34]
	mov r0, r4
	str ip, [sp, #4]
	ldr r4, [r5, #0x30]
	blx r4
	ldr r0, [r5, #0x38]
	add r1, r0, #1
	str r1, [r5, #0x38]
	ldr r0, [r5, #0x2c]
	cmp r1, r0
	movge r0, #0
	strge r0, [r5, #0x38]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C8F50: .word _021E0294
_020C8F54: .word _021E0254
	arm_func_end StrmCallback

	arm_func_start BeginSleep__Strm
BeginSleep__Strm: ; 0x020C8F58
	stmdb sp!, {r4, lr}
	ldr r1, [r0, #0x24]
	mov r1, r1, lsl #0x1e
	movs r1, r1, asr #0x1f
	ldmeqia sp!, {r4, pc}
	ldr r2, [r0, #0x40]
	mov r3, #1
	mov r1, #0
	mov r2, r3, lsl r2
	ldr r0, [r0, #0x44]
	mov r3, r1
	bl SND_StopTimer
	bl SND_GetCurrentCommandTag
	mov r4, r0
	mov r0, #1
	bl SND_FlushCommand
	mov r0, r4
	bl SND_WaitForCommandProc
	ldmia sp!, {r4, pc}
	arm_func_end BeginSleep__Strm

	arm_func_start EndSleep__Strm
EndSleep__Strm: ; 0x020C8FA4
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r0, [r4, #0x24]
	mov r0, r0, lsl #0x1e
	movs r0, r0, asr #0x1f
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _020C8FF4
	mov r5, #1
_020C8FCC:
	bl OS_DisableInterrupts
	mov r6, r0
	mov r0, r4
	mov r1, r5
	bl StrmCallback
	mov r0, r6
	bl OS_RestoreInterrupts
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _020C8FCC
_020C8FF4:
	ldr r0, [r4, #0x40]
	mov r2, #1
	mov r1, #0
	mov r2, r2, lsl r0
	ldr r0, [r4, #0x44]
	mov r3, r1
	bl SND_StartTimer
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end EndSleep__Strm

	arm_func_start NNS_SndCaptureStopReverb
NNS_SndCaptureStopReverb: ; 0x020C9014
	stmdb sp!, {r4, lr}
	ldr r1, _020C9064 ; =_021E0314
	mov r2, r0
	ldr r0, [r1, #0x48]
	ldr r4, _020C9068 ; =_021E035C
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #4]
	cmp r0, #0
	ldmneia sp!, {r4, pc}
	cmp r2, #0
	bne _020C904C
	bl NNSi_SndCaptureStop
	ldmia sp!, {r4, pc}
_020C904C:
	add r0, r4, #0x3c
	mov r1, #0
	bl NNSi_SndFaderSet
	mov r0, #1
	str r0, [r4, #0x4c]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C9064: .word _021E0314
_020C9068: .word _021E035C
	arm_func_end NNS_SndCaptureStopReverb

	arm_func_start NNS_SndCaptureIsActive
NNS_SndCaptureIsActive: ; 0x020C906C
	ldr r0, _020C9078 ; =_021E0314
	ldr r0, [r0, #0x48]
	bx lr
	.align 2, 0
_020C9078: .word _021E0314
	arm_func_end NNS_SndCaptureIsActive

	arm_func_start NNS_SndCaptureGetCaptureType
NNS_SndCaptureGetCaptureType: ; 0x020C907C
	ldr r0, _020C9088 ; =_021E0314
	ldr r0, [r0, #0x4c]
	bx lr
	.align 2, 0
_020C9088: .word _021E0314
	arm_func_end NNS_SndCaptureGetCaptureType

	arm_func_start NNSi_SndCaptureInit
NNSi_SndCaptureInit: ; 0x020C908C
	ldr r0, _020C90A0 ; =_021E0314
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #0x48]
	bx lr
	.align 2, 0
_020C90A0: .word _021E0314
	arm_func_end NNSi_SndCaptureInit

	arm_func_start NNSi_SndCaptureMain
NNSi_SndCaptureMain: ; 0x020C90A4
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020C9124 ; =_021E0314
	ldr r4, _020C9128 ; =_021E035C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #4]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	add r0, r4, #0x3c
	bl NNSi_SndFaderUpdate
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _020C90F4
	add r0, r4, #0x3c
	bl NNSi_SndFaderIsFinished
	cmp r0, #0
	beq _020C90F4
	bl NNSi_SndCaptureStop
	ldmia sp!, {r3, r4, r5, pc}
_020C90F4:
	add r0, r4, #0x3c
	bl NNSi_SndFaderGet
	ldr r1, [r4, #0x50]
	mov r5, r0, asr #8
	cmp r5, r1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #0x24]
	mov r1, r5
	mov r2, #0
	bl SND_SetChannelVolume
	str r5, [r4, #0x50]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C9124: .word _021E0314
_020C9128: .word _021E035C
	arm_func_end NNSi_SndCaptureMain

	arm_func_start NNSi_SndCaptureStop
NNSi_SndCaptureStop: ; 0x020C912C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r0, _020C9210 ; =_021E0314
	ldr r4, _020C9214 ; =_021E035C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r4, #0x2c]
	mov r3, #0
	cmp r1, #0
	movge r7, #1
	movlt r7, #0
	cmp r7, #0
	movne r0, #1
	movne r2, r0, lsl r1
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	moveq r2, #0
	bl SND_StopTimer
	cmp r7, #0
	beq _020C91B4
	bl SND_GetCurrentCommandTag
	mov r5, r0
	mov r0, #1
	bl SND_FlushCommand
	mov r0, r5
	bl SND_WaitForCommandProc
	ldr r6, _020C9218 ; =_021E031C
	mov r5, #0
_020C919C:
	mov r0, r6
	mov r1, r5
	mov r2, r5
	bl OS_ReceiveMessage
	cmp r0, #0
	bne _020C919C
_020C91B4:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _020C91C4
	bl NNS_SndUnlockCapture
_020C91C4:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _020C91D4
	bl NNS_SndUnlockChannel
_020C91D4:
	cmp r7, #0
	beq _020C91E4
	ldr r0, [r4, #0x2c]
	bl NNS_SndFreeAlarm
_020C91E4:
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _020C9204
	mov r0, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	bl SND_SetOutputSelector
_020C9204:
	mov r0, #0
	str r0, [r4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020C9210: .word _021E0314
_020C9214: .word _021E035C
_020C9218: .word _021E031C
	arm_func_end NNSi_SndCaptureStop

	arm_func_start NNSi_SndCaptureBeginSleep
NNSi_SndCaptureBeginSleep: ; 0x020C921C
	stmdb sp!, {r4, lr}
	ldr r0, _020C9274 ; =_021E0314
	ldr r3, _020C9278 ; =_021E035C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r3, #0x2c]
	cmp r1, #0
	movge r0, #1
	movge r2, r0, lsl r1
	ldr r0, [r3, #0x24]
	ldr r1, [r3, #0x28]
	movlt r2, #0
	mov r3, #0
	bl SND_StopTimer
	bl SND_GetCurrentCommandTag
	mov r4, r0
	mov r0, #1
	bl SND_FlushCommand
	mov r0, r4
	bl SND_WaitForCommandProc
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C9274: .word _021E0314
_020C9278: .word _021E035C
	arm_func_end NNSi_SndCaptureBeginSleep

	arm_func_start NNSi_SndCaptureEndSleep
NNSi_SndCaptureEndSleep: ; 0x020C927C
	stmdb sp!, {r4, lr}
	ldr r0, _020C92F8 ; =_021E0314
	ldr r4, _020C92FC ; =_021E035C
	ldr r0, [r0, #0x48]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, [r4, #0xc]
	mov r0, #0
	ldr r2, [r4, #0x14]
	str r0, [r4, #0x1c]
	bl MIi_CpuClear32
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0x14]
	mov r0, #0
	bl MIi_CpuClear32
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x14]
	bl DC_FlushRange
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	bl DC_FlushRange
	ldr r1, [r4, #0x2c]
	mov r3, #0
	cmp r1, #0
	movge r0, #1
	movge r2, r0, lsl r1
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x28]
	movlt r2, #0
	bl SND_StartTimer
	ldmia sp!, {r4, pc}
	.align 2, 0
_020C92F8: .word _021E0314
_020C92FC: .word _021E035C
	arm_func_end NNSi_SndCaptureEndSleep

	arm_func_start NNS_SndArcInit
NNS_SndArcInit: ; 0x020C9300
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov ip, #0
	str ip, [r6, #0x8c]
	str ip, [r6, #0x84]
	str ip, [r6, #0x88]
	add r0, r6, #0x7c
	mov r5, r2
	mov r4, r3
	str ip, [r6, #0x90]
	bl FS_ConvertPathToFileID
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, r6, #0x34
	bl FS_InitFile
	add r1, r6, #0x7c
	add r0, r6, #0x34
	ldmia r1, {r1, r2}
	bl FS_OpenFileFast
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r3, #1
	mov r0, r6
	mov r1, r5
	mov r2, r4
	str r3, [r6, #0x30]
	bl NNS_SndArcSetup
	cmp r0, #0
	ldrne r0, _020C937C ; =_021E0910
	strne r6, [r0]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020C937C: .word _021E0910
	arm_func_end NNS_SndArcInit

	arm_func_start NNS_SndArcSetup
NNS_SndArcSetup: ; 0x020C9380
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r0
	mov r4, r1
	mov r1, #0
	mov r6, r2
	mov r2, r1
	add r0, r5, #0x34
	bl FS_SeekFile
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	mov r1, r5
	add r0, r5, #0x34
	mov r2, #0x30
	bl FS_ReadFile
	cmp r0, #0x30
	addne sp, sp, #4
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, pc}
	cmp r4, #0
	beq _020C9540
	mov r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x1c]
	ldr r2, _020C954C ; =InfoDisposeCallback
	mov r0, r4
	mov r3, r5
	bl NNS_SndHeapAlloc
	cmp r0, #0
	str r0, [r5, #0x8c]
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [r5, #0x18]
	add r0, r5, #0x34
	mov r2, #0
	bl FS_SeekFile
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [r5, #0x8c]
	ldr r2, [r5, #0x1c]
	add r0, r5, #0x34
	bl FS_ReadFile
	ldr r1, [r5, #0x1c]
	cmp r0, r1
	addne sp, sp, #4
	mov r0, #0
	ldmneia sp!, {r3, r4, r5, r6, pc}
	str r0, [sp]
	ldr r1, [r5, #0x24]
	ldr r2, _020C9550 ; =FatDisposeCallback
	mov r0, r4
	mov r3, r5
	bl NNS_SndHeapAlloc
	cmp r0, #0
	str r0, [r5, #0x84]
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [r5, #0x20]
	add r0, r5, #0x34
	mov r2, #0
	bl FS_SeekFile
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [r5, #0x84]
	ldr r2, [r5, #0x24]
	add r0, r5, #0x34
	bl FS_ReadFile
	ldr r1, [r5, #0x24]
	cmp r0, r1
	addne sp, sp, #4
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, pc}
	cmp r6, #0
	ldrne r1, [r5, #0x14]
	cmpne r1, #0
	beq _020C9540
	ldr r2, _020C9554 ; =SymbolDisposeCallback
	mov ip, #0
	mov r0, r4
	mov r3, r5
	str ip, [sp]
	bl NNS_SndHeapAlloc
	cmp r0, #0
	str r0, [r5, #0x88]
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [r5, #0x10]
	add r0, r5, #0x34
	mov r2, #0
	bl FS_SeekFile
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r1, [r5, #0x88]
	ldr r2, [r5, #0x14]
	add r0, r5, #0x34
	bl FS_ReadFile
	ldr r1, [r5, #0x14]
	cmp r0, r1
	addne sp, sp, #4
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, pc}
_020C9540:
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_020C954C: .word InfoDisposeCallback
_020C9550: .word FatDisposeCallback
_020C9554: .word SymbolDisposeCallback
	arm_func_end NNS_SndArcSetup

	arm_func_start NNS_SndArcInitOnMemory
NNS_SndArcInitOnMemory: ; 0x020C9558
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	mov r0, r4
	mov r1, r5
	mov r2, #0x30
	bl MIi_CpuCopy32
	ldr r0, [r5, #0x18]
	mov r3, #0
	cmp r0, #0
	moveq r0, #0
	addne r0, r4, r0
	str r0, [r5, #0x8c]
	ldr r0, [r5, #0x20]
	cmp r0, #0
	moveq r0, #0
	addne r0, r4, r0
	str r0, [r5, #0x84]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	moveq r0, #0
	addne r0, r4, r0
	str r0, [r5, #0x88]
	str r3, [r5, #0x90]
	ldr r2, [r5, #0x84]
	ldr r0, [r2, #8]
	cmp r0, #0
	bls _020C9604
	mov ip, r3
	mov r1, r3
_020C95D0:
	add r2, r2, #0xc
	ldr r0, [r2, ip]
	add r2, r2, ip
	cmp r0, #0
	moveq r0, r1
	addne r0, r4, r0
	str r0, [r2, #8]
	ldr r2, [r5, #0x84]
	add r3, r3, #1
	ldr r0, [r2, #8]
	add ip, ip, #0x10
	cmp r3, r0
	blo _020C95D0
_020C9604:
	mov r1, #0
	ldr r0, _020C9618 ; =_021E0910
	str r1, [r5, #0x30]
	str r5, [r0]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020C9618: .word _021E0910
	arm_func_end NNS_SndArcInitOnMemory

	arm_func_start NNS_SndArcSetCurrent
NNS_SndArcSetCurrent: ; 0x020C961C
	ldr r1, _020C9630 ; =_021E0910
	ldr r2, [r1]
	str r0, [r1]
	mov r0, r2
	bx lr
	.align 2, 0
_020C9630: .word _021E0910
	arm_func_end NNS_SndArcSetCurrent

	arm_func_start NNS_SndArcGetCurrent
NNS_SndArcGetCurrent: ; 0x020C9634
	ldr r0, _020C9640 ; =_021E0910
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020C9640: .word _021E0910
	arm_func_end NNS_SndArcGetCurrent

	arm_func_start NNS_SndArcGetSeqParam
NNS_SndArcGetSeqParam: ; 0x020C9644
	stmdb sp!, {r3, lr}
	bl NNS_SndArcGetSeqInfo
	cmp r0, #0
	moveq r0, #0
	addne r0, r0, #4
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndArcGetSeqParam

	arm_func_start NNS_SndArcGetSeqInfo
NNS_SndArcGetSeqInfo: ; 0x020C965C
	ldr r1, _020C96BC ; =_021E0910
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #8]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_020C96BC: .word _021E0910
	arm_func_end NNS_SndArcGetSeqInfo

	arm_func_start NNS_SndArcGetSeqArcInfo
NNS_SndArcGetSeqArcInfo: ; 0x020C96C0
	ldr r1, _020C9720 ; =_021E0910
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0xc]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_020C9720: .word _021E0910
	arm_func_end NNS_SndArcGetSeqArcInfo

	arm_func_start NNS_SndArcGetBankInfo
NNS_SndArcGetBankInfo: ; 0x020C9724
	ldr r1, _020C9784 ; =_021E0910
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0x10]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_020C9784: .word _021E0910
	arm_func_end NNS_SndArcGetBankInfo

	arm_func_start NNS_SndArcGetWaveArcInfo
NNS_SndArcGetWaveArcInfo: ; 0x020C9788
	ldr r1, _020C97E8 ; =_021E0910
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0x14]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_020C97E8: .word _021E0910
	arm_func_end NNS_SndArcGetWaveArcInfo

	arm_func_start NNS_SndArcGetStrmInfo
NNS_SndArcGetStrmInfo: ; 0x020C97EC
	ldr r1, _020C984C ; =_021E0910
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0x18]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_020C984C: .word _021E0910
	arm_func_end NNS_SndArcGetStrmInfo

	arm_func_start NNS_SndArcGetGroupInfo
NNS_SndArcGetGroupInfo: ; 0x020C9850
	ldr r1, _020C98B0 ; =_021E0910
	ldr r3, [r1]
	ldr r2, [r3, #0x8c]
	ldr r1, [r2, #0x1c]
	cmp r1, #0
	moveq r2, #0
	addne r2, r2, r1
	cmp r2, #0
	moveq r0, #0
	bxeq lr
	cmp r0, #0
	movlt r0, #0
	bxlt lr
	ldr r1, [r2]
	cmp r0, r1
	movhs r0, #0
	bxhs lr
	add r0, r2, r0, lsl #2
	ldr r1, [r0, #4]
	ldr r0, [r3, #0x8c]
	cmp r1, #0
	moveq r0, #0
	addne r0, r0, r1
	bx lr
	.align 2, 0
_020C98B0: .word _021E0910
	arm_func_end NNS_SndArcGetGroupInfo

	arm_func_start NNS_SndArcGetFileSize
NNS_SndArcGetFileSize: ; 0x020C98B4
	ldr r1, _020C98D8 ; =_021E0910
	ldr r1, [r1]
	ldr r2, [r1, #0x84]
	ldr r1, [r2, #8]
	cmp r0, r1
	movhs r0, #0
	addlo r0, r2, r0, lsl #4
	ldrlo r0, [r0, #0x10]
	bx lr
	.align 2, 0
_020C98D8: .word _021E0910
	arm_func_end NNS_SndArcGetFileSize

	arm_func_start NNS_SndArcReadFile
NNS_SndArcReadFile: ; 0x020C98DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _020C99A0 ; =_021E0910
	mov sb, r2
	ldr r7, [r4]
	mov sl, r1
	ldr r2, [r7, #0x84]
	mov r8, r3
	ldr r1, [r2, #8]
	cmp r0, r1
	mvnhs r0, #0
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, [r7, #0x90]
	add r1, r2, #0xc
	cmp r5, #0
	moveq r5, sb
	add fp, r1, r0, lsl #4
	cmp sb, #0
	mov r4, #0
	ble _020C9998
_020C9928:
	ldr r0, [fp, #4]
	sub r6, sb, r4
	cmp r6, r5
	movgt r6, r5
	sub r0, r0, r8
	cmp r6, r0
	movhi r6, r0
	cmp r6, #0
	beq _020C9998
	ldr r1, [fp]
	mov r2, #0
	add r0, r7, #0x34
	add r1, r1, r8
	bl FS_SeekFile
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r1, sl
	mov r2, r6
	add r0, r7, #0x34
	bl FS_ReadFile
	cmp r0, #0
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r4, r4, r0
	cmp r4, sb
	add r8, r8, r0
	add sl, sl, r0
	blt _020C9928
_020C9998:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020C99A0: .word _021E0910
	arm_func_end NNS_SndArcReadFile

	arm_func_start NNS_SndArcGetFileAddress
NNS_SndArcGetFileAddress: ; 0x020C99A4
	ldr r1, _020C99C8 ; =_021E0910
	ldr r1, [r1]
	ldr r2, [r1, #0x84]
	ldr r1, [r2, #8]
	cmp r0, r1
	movhs r0, #0
	addlo r0, r2, r0, lsl #4
	ldrlo r0, [r0, #0x14]
	bx lr
	.align 2, 0
_020C99C8: .word _021E0910
	arm_func_end NNS_SndArcGetFileAddress

	arm_func_start NNS_SndArcSetFileAddress
NNS_SndArcSetFileAddress: ; 0x020C99CC
	ldr r2, _020C99E4 ; =_021E0910
	ldr r2, [r2]
	ldr r2, [r2, #0x84]
	add r0, r2, r0, lsl #4
	str r1, [r0, #0x14]
	bx lr
	.align 2, 0
_020C99E4: .word _021E0910
	arm_func_end NNS_SndArcSetFileAddress

	arm_func_start InfoDisposeCallback
InfoDisposeCallback: ; 0x020C99E8
	mov r0, #0
	str r0, [r2, #0x8c]
	bx lr
	arm_func_end InfoDisposeCallback

	arm_func_start FatDisposeCallback
FatDisposeCallback: ; 0x020C99F4
	mov r0, #0
	str r0, [r2, #0x84]
	bx lr
	arm_func_end FatDisposeCallback

	arm_func_start SymbolDisposeCallback
SymbolDisposeCallback: ; 0x020C9A00
	mov r0, #0
	str r0, [r2, #0x88]
	bx lr
	arm_func_end SymbolDisposeCallback

	arm_func_start NNS_SndHeapCreate
NNS_SndHeapCreate: ; 0x020C9A0C
	stmdb sp!, {r3, r4, r5, lr}
	add r2, r0, #3
	add r0, r0, r1
	bic r5, r2, #3
	cmp r5, r0
	movhi r0, #0
	ldmhiia sp!, {r3, r4, r5, pc}
	sub r1, r0, r5
	cmp r1, #0x10
	movlo r0, #0
	ldmloia sp!, {r3, r4, r5, pc}
	add r0, r5, #0x10
	sub r1, r1, #0x10
	mov r2, #0
	bl NNS_FndCreateFrmHeapEx
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl InitHeap
	cmp r0, #0
	movne r0, r5
	ldmneia sp!, {r3, r4, r5, pc}
	mov r0, r4
	bl NNS_FndDestroyFrmHeap
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NNS_SndHeapCreate

	arm_func_start NNS_SndHeapDestroy
NNS_SndHeapDestroy: ; 0x020C9A7C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl NNS_SndHeapClear
	ldr r0, [r4]
	bl NNS_FndDestroyFrmHeap
	ldmia sp!, {r4, pc}
	arm_func_end NNS_SndHeapDestroy

	arm_func_start NNS_SndHeapClear
NNS_SndHeapClear: ; 0x020C9A94
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r0
	mov r6, #0
	mov r1, r6
	add r0, r8, #4
	bl NNS_FndGetPrevListObject
	movs r5, r0
	beq _020C9B2C
	mov sl, #1
	mov sb, r6
	mov r4, r6
_020C9AC0:
	mov r0, r5
	mov r1, r4
	bl NNS_FndGetPrevListObject
	movs r7, r0
	beq _020C9B0C
_020C9AD4:
	ldr ip, [r7, #0xc]
	cmp ip, #0
	beq _020C9AF8
	ldr r1, [r7, #8]
	ldr r2, [r7, #0x10]
	ldr r3, [r7, #0x14]
	add r0, r7, #0x20
	blx ip
	mov r6, sl
_020C9AF8:
	mov r0, r5
	mov r1, r7
	bl NNS_FndGetPrevListObject
	movs r7, r0
	bne _020C9AD4
_020C9B0C:
	mov r1, r5
	add r0, r8, #4
	bl NNS_FndRemoveListObject
	mov r1, sb
	add r0, r8, #4
	bl NNS_FndGetPrevListObject
	movs r5, r0
	bne _020C9AC0
_020C9B2C:
	ldr r0, [r8]
	mov r1, #3
	bl NNS_FndFreeToFrmHeap
	cmp r6, #0
	beq _020C9B44
	bl EraseSync
_020C9B44:
	mov r0, r8
	bl NewSection
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end NNS_SndHeapClear

	arm_func_start NNS_SndHeapAlloc
NNS_SndHeapAlloc: ; 0x020C9B50
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r8, r0
	add r0, r7, #0x1f
	bic r1, r0, #0x1f
	mov r6, r2
	ldr r0, [r8]
	add r1, r1, #0x20
	mov r2, #0x20
	mov r5, r3
	bl NNS_FndAllocFromFrmHeapEx
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, r8, #4
	mov r1, #0
	bl NNS_FndGetPrevListObject
	str r7, [r4, #8]
	str r6, [r4, #0xc]
	ldr r2, [sp, #0x18]
	str r5, [r4, #0x10]
	mov r1, r4
	str r2, [r4, #0x14]
	bl NNS_FndAppendListObject
	add r0, r4, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end NNS_SndHeapAlloc

	arm_func_start NNS_SndHeapSaveState
NNS_SndHeapSaveState: ; 0x020C9BB8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldrh r1, [r4, #0xc]
	ldr r0, [r4]
	bl NNS_FndRecordStateForFrmHeap
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl NewSection
	cmp r0, #0
	ldrneh r0, [r4, #0xc]
	subne r0, r0, #1
	ldmneia sp!, {r4, pc}
	ldr r0, [r4]
	mov r1, #0
	bl NNS_FndFreeByStateToFrmHeap
	mvn r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end NNS_SndHeapSaveState

	arm_func_start NNS_SndHeapLoadState
NNS_SndHeapLoadState: ; 0x020C9C04
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, #0
	movs sb, r1
	mov sl, r0
	mov r7, r8
	bne _020C9C24
	bl NNS_SndHeapClear
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020C9C24:
	ldrh r0, [sl, #0xc]
	cmp sb, r0
	bge _020C9CA8
	mov r4, #1
	mov r5, r8
_020C9C38:
	mov r1, r5
	add r0, sl, #4
	bl NNS_FndGetPrevListObject
	mov r1, r8
	mov r6, r0
	bl NNS_FndGetPrevListObject
	movs r8, r0
	beq _020C9C90
_020C9C58:
	ldr ip, [r8, #0xc]
	cmp ip, #0
	beq _020C9C7C
	ldr r1, [r8, #8]
	ldr r2, [r8, #0x10]
	ldr r3, [r8, #0x14]
	add r0, r8, #0x20
	blx ip
	mov r7, r4
_020C9C7C:
	mov r0, r6
	mov r1, r8
	bl NNS_FndGetPrevListObject
	movs r8, r0
	bne _020C9C58
_020C9C90:
	mov r1, r6
	add r0, sl, #4
	bl NNS_FndRemoveListObject
	ldrh r0, [sl, #0xc]
	cmp sb, r0
	blt _020C9C38
_020C9CA8:
	ldr r0, [sl]
	mov r1, sb
	bl NNS_FndFreeByStateToFrmHeap
	cmp r7, #0
	beq _020C9CC0
	bl EraseSync
_020C9CC0:
	ldrh r1, [sl, #0xc]
	ldr r0, [sl]
	bl NNS_FndRecordStateForFrmHeap
	mov r0, sl
	bl NewSection
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end NNS_SndHeapLoadState

	arm_func_start NNS_SndHeapGetSize
NNS_SndHeapGetSize: ; 0x020C9CD8
	ldr r1, [r0]
	ldr r0, [r1, #0x1c]
	sub r0, r0, r1
	bx lr
	arm_func_end NNS_SndHeapGetSize

	arm_func_start NNS_SndHeapGetFreeSize
NNS_SndHeapGetFreeSize: ; 0x020C9CE8
	stmdb sp!, {r3, lr}
	ldr r0, [r0]
	mov r1, #0x20
	bl NNS_FndGetAllocatableSizeForFrmHeapEx
	cmp r0, #0x20
	movlo r0, #0
	subhs r0, r0, #0x20
	bichs r0, r0, #0x1f
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndHeapGetFreeSize

	arm_func_start InitHeapSection
InitHeapSection: ; 0x020C9D0C
	ldr ip, _020C9D18 ; =NNS_FndInitList
	mov r1, #0
	bx ip
	.align 2, 0
_020C9D18: .word NNS_FndInitList
	arm_func_end InitHeapSection

	arm_func_start InitHeap
InitHeap: ; 0x020C9D1C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	add r0, r5, #4
	mov r1, #0xc
	bl NNS_FndInitList
	mov r0, r5
	str r4, [r5]
	bl NewSection
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end InitHeap

	arm_func_start NewSection
NewSection: ; 0x020C9D50
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5]
	mov r1, #0x14
	mov r2, #4
	bl NNS_FndAllocFromFrmHeapEx
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl InitHeapSection
	mov r1, r4
	add r0, r5, #4
	bl NNS_FndAppendListObject
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end NewSection

	arm_func_start EraseSync
EraseSync: ; 0x020C9D8C
	stmdb sp!, {r4, lr}
	bl SND_GetCurrentCommandTag
	mov r4, r0
	mov r0, #1
	bl SND_FlushCommand
	mov r0, r4
	bl SND_WaitForCommandProc
	ldmia sp!, {r4, pc}
	arm_func_end EraseSync

	arm_func_start NNS_SndArcLoadGroup
NNS_SndArcLoadGroup: ; 0x020C9DAC
	stmdb sp!, {r3, lr}
	bl NNSi_SndArcLoadGroup
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndArcLoadGroup

	arm_func_start NNS_SndArcLoadSeq
NNS_SndArcLoadSeq: ; 0x020C9DC4
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov ip, #0
	mov r1, #0xff
	mov r3, #1
	str ip, [sp]
	bl NNSi_SndArcLoadSeq
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndArcLoadSeq

	arm_func_start NNS_SndArcLoadBank
NNS_SndArcLoadBank: ; 0x020C9DF0
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov ip, #0
	mov r1, #0xff
	mov r3, #1
	str ip, [sp]
	bl NNSi_SndArcLoadBank
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndArcLoadBank

	arm_func_start NNS_SndArcLoadWaveArc
NNS_SndArcLoadWaveArc: ; 0x020C9E1C
	stmdb sp!, {r3, lr}
	mov r2, r1
	mov ip, #0
	mov r1, #0xff
	mov r3, #1
	str ip, [sp]
	bl NNSi_SndArcLoadWaveArc
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndArcLoadWaveArc

	arm_func_start NNS_SndArcLoadSeqEx
NNS_SndArcLoadSeqEx: ; 0x020C9E48
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r3, #1
	str ip, [sp]
	bl NNSi_SndArcLoadSeq
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end NNS_SndArcLoadSeqEx

	arm_func_start NNSi_SndArcLoadGroup
NNSi_SndArcLoadGroup: ; 0x020C9E6C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r1
	bl NNS_SndArcGetGroupInfo
	movs r6, r0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r6]
	mov r7, #0
	cmp r0, #0
	bls _020C9F68
	add r8, r6, #4
	mov fp, r7
	mov sl, r7
	mov r4, r7
	mov r5, r7
_020C9EA8:
	ldrb r0, [r8]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _020C9F54
_020C9EB8: ; jump table
	b _020C9EC8 ; case 0
	b _020C9F10 ; case 1
	b _020C9F34 ; case 2
	b _020C9EEC ; case 3
_020C9EC8:
	str r5, [sp]
	ldrb r1, [r8, #1]
	ldr r0, [r8, #4]
	mov r2, sb
	mov r3, #1
	bl NNSi_SndArcLoadSeq
	cmp r0, #0
	beq _020C9F54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C9EEC:
	str r4, [sp]
	ldrb r1, [r8, #1]
	ldr r0, [r8, #4]
	mov r2, sb
	mov r3, #1
	bl NNSi_SndArcLoadSeqArc
	cmp r0, #0
	beq _020C9F54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C9F10:
	str sl, [sp]
	ldrb r1, [r8, #1]
	ldr r0, [r8, #4]
	mov r2, sb
	mov r3, #1
	bl NNSi_SndArcLoadBank
	cmp r0, #0
	beq _020C9F54
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C9F34:
	str fp, [sp]
	ldrb r1, [r8, #1]
	ldr r0, [r8, #4]
	mov r2, sb
	mov r3, #1
	bl NNSi_SndArcLoadWaveArc
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020C9F54:
	ldr r0, [r6]
	add r7, r7, #1
	cmp r7, r0
	add r8, r8, #8
	blo _020C9EA8
_020C9F68:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end NNSi_SndArcLoadGroup

	arm_func_start NNSi_SndArcLoadSeq
NNSi_SndArcLoadSeq: ; 0x020C9F70
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl NNS_SndArcGetSeqInfo
	movs r4, r0
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	str r0, [sp]
	ldrh r0, [r4, #4]
	mov r1, r7
	mov r2, r6
	mov r3, r5
	bl NNSi_SndArcLoadBank
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	tst r7, #1
	ldr r0, [r4]
	beq _020C9FDC
	mov r1, r6
	mov r2, r5
	bl LoadSeq
	cmp r0, #0
	bne _020C9FE0
	mov r0, #6
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020C9FDC:
	bl NNS_SndArcGetFileAddress
_020C9FE0:
	ldr r1, [sp, #0x18]
	cmp r1, #0
	strne r0, [r1]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNSi_SndArcLoadSeq

	arm_func_start NNSi_SndArcLoadSeqArc
NNSi_SndArcLoadSeqArc: ; 0x020C9FF4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl NNS_SndArcGetSeqArcInfo
	cmp r0, #0
	moveq r0, #3
	ldmeqia sp!, {r4, r5, r6, pc}
	tst r6, #8
	ldr r0, [r0]
	beq _020CA03C
	mov r1, r5
	mov r2, r4
	bl LoadSeqArc
	cmp r0, #0
	bne _020CA040
	mov r0, #7
	ldmia sp!, {r4, r5, r6, pc}
_020CA03C:
	bl NNS_SndArcGetFileAddress
_020CA040:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	strne r0, [r1]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNSi_SndArcLoadSeqArc

	arm_func_start NNSi_SndArcLoadBank
NNSi_SndArcLoadBank: ; 0x020CA054
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r1
	mov sb, r2
	mov fp, r3
	bl NNS_SndArcGetBankInfo
	movs r5, r0
	addeq sp, sp, #8
	moveq r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	tst sl, #2
	ldr r0, [r5]
	beq _020CA0A8
	mov r1, sb
	mov r2, fp
	bl LoadBank
	movs r6, r0
	bne _020CA0B0
	add sp, sp, #8
	mov r0, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020CA0A8:
	bl NNS_SndArcGetFileAddress
	mov r6, r0
_020CA0B0:
	and r8, sl, #4
	mov r7, #0
_020CA0B8:
	add r0, r5, r7, lsl #1
	ldrh r0, [r0, #4]
	ldr r1, _020CA190 ; =0x0000FFFF
	cmp r0, r1
	beq _020CA16C
	bl NNS_SndArcGetWaveArcInfo
	movs r4, r0
	addeq sp, sp, #8
	moveq r0, #5
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, sp, #4
	str r0, [sp]
	add r0, r5, r7, lsl #1
	ldrh r0, [r0, #4]
	mov r1, sl
	mov r2, sb
	mov r3, fp
	bl NNSi_SndArcLoadWaveArc
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r4]
	mov r0, r0, lsr #0x18
	tst r0, #1
	cmpne r8, #0
	beq _020CA150
	str sb, [sp]
	ldr r1, [r4]
	ldr r0, [sp, #4]
	mov r3, r1, lsl #8
	mov r1, r6
	mov r2, r7
	mov r3, r3, lsr #8
	bl LoadSingleWaves
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #9
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020CA150:
	cmp r6, #0
	ldrne r2, [sp, #4]
	cmpne r2, #0
	beq _020CA16C
	mov r0, r6
	mov r1, r7
	bl SND_AssignWaveArc
_020CA16C:
	add r7, r7, #1
	cmp r7, #4
	blt _020CA0B8
	ldr r0, [sp, #0x30]
	cmp r0, #0
	strne r6, [r0]
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020CA190: .word 0x0000FFFF
	arm_func_end NNSi_SndArcLoadBank

	arm_func_start NNSi_SndArcLoadWaveArc
NNSi_SndArcLoadWaveArc: ; 0x020CA194
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl NNS_SndArcGetWaveArcInfo
	cmp r0, #0
	moveq r0, #5
	ldmeqia sp!, {r4, r5, r6, pc}
	tst r6, #4
	ldr r0, [r0]
	beq _020CA200
	mov r1, r0, lsr #0x18
	tst r1, #1
	mov r0, r0, lsl #8
	mov r1, r5
	beq _020CA1E4
	mov r2, r4
	mov r0, r0, lsr #8
	bl LoadWaveArcTable
	b _020CA1F0
_020CA1E4:
	mov r2, r4
	mov r0, r0, lsr #8
	bl LoadWaveArc
_020CA1F0:
	cmp r0, #0
	bne _020CA20C
	mov r0, #9
	ldmia sp!, {r4, r5, r6, pc}
_020CA200:
	mov r0, r0, lsl #8
	mov r0, r0, lsr #8
	bl NNS_SndArcGetFileAddress
_020CA20C:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	strne r0, [r1]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNSi_SndArcLoadWaveArc

	arm_func_start NNSi_SndArcLoadFile
NNSi_SndArcLoadFile: ; 0x020CA220
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r4, r3
	bl NNS_SndArcGetFileSize
	movs r5, r0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r0, [sp, #0x20]
	cmp r0, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r2, r7
	mov r3, r6
	add r1, r5, #0x20
	str r4, [sp]
	bl NNS_SndHeapAlloc
	movs r4, r0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r0, r8
	mov r1, r4
	mov r2, r5
	mov r3, #0
	bl NNS_SndArcReadFile
	cmp r5, r0
	addne sp, sp, #4
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r0, r4
	mov r1, r5
	bl DC_StoreRange
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end NNSi_SndArcLoadFile

	arm_func_start LoadSeq
LoadSeq: ; 0x020CA2C0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl NNS_SndArcGetFileAddress
	movs r4, r0
	bne _020CA320
	cmp r5, #0
	moveq r2, #0
	beq _020CA2F0
	bl NNS_SndArcGetCurrent
	mov r2, r0
_020CA2F0:
	ldr r1, _020CA328 ; =SeqDisposeCallback
	mov r0, r7
	mov r3, r7
	str r6, [sp]
	bl NNSi_SndArcLoadFile
	mov r4, r0
	cmp r5, #0
	cmpne r4, #0
	beq _020CA320
	mov r0, r7
	mov r1, r4
	bl NNS_SndArcSetFileAddress
_020CA320:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020CA328: .word SeqDisposeCallback
	arm_func_end LoadSeq

	arm_func_start LoadSeqArc
LoadSeqArc: ; 0x020CA32C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl NNS_SndArcGetFileAddress
	movs r4, r0
	bne _020CA38C
	cmp r5, #0
	moveq r2, #0
	beq _020CA35C
	bl NNS_SndArcGetCurrent
	mov r2, r0
_020CA35C:
	ldr r1, _020CA394 ; =SeqDisposeCallback
	mov r0, r7
	mov r3, r7
	str r6, [sp]
	bl NNSi_SndArcLoadFile
	mov r4, r0
	cmp r5, #0
	cmpne r4, #0
	beq _020CA38C
	mov r0, r7
	mov r1, r4
	bl NNS_SndArcSetFileAddress
_020CA38C:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020CA394: .word SeqDisposeCallback
	arm_func_end LoadSeqArc

	arm_func_start LoadBank
LoadBank: ; 0x020CA398
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl NNS_SndArcGetFileAddress
	movs r4, r0
	bne _020CA3F8
	cmp r5, #0
	moveq r2, #0
	beq _020CA3C8
	bl NNS_SndArcGetCurrent
	mov r2, r0
_020CA3C8:
	ldr r1, _020CA400 ; =BankDisposeCallback
	mov r0, r7
	mov r3, r7
	str r6, [sp]
	bl NNSi_SndArcLoadFile
	mov r4, r0
	cmp r5, #0
	cmpne r4, #0
	beq _020CA3F8
	mov r0, r7
	mov r1, r4
	bl NNS_SndArcSetFileAddress
_020CA3F8:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020CA400: .word BankDisposeCallback
	arm_func_end LoadBank

	arm_func_start LoadWaveArc
LoadWaveArc: ; 0x020CA404
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	bl NNS_SndArcGetFileAddress
	movs r4, r0
	bne _020CA464
	cmp r5, #0
	moveq r2, #0
	beq _020CA434
	bl NNS_SndArcGetCurrent
	mov r2, r0
_020CA434:
	ldr r1, _020CA46C ; =WaveArcDisposeCallback
	mov r0, r7
	mov r3, r7
	str r6, [sp]
	bl NNSi_SndArcLoadFile
	mov r4, r0
	cmp r5, #0
	cmpne r4, #0
	beq _020CA464
	mov r0, r7
	mov r1, r4
	bl NNS_SndArcSetFileAddress
_020CA464:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020CA46C: .word WaveArcDisposeCallback
	arm_func_end LoadWaveArc

	arm_func_start LoadWaveArcTable
LoadWaveArcTable: ; 0x020CA470
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov sb, r0
	mov r8, r1
	mov r7, r2
	bl NNS_SndArcGetFileAddress
	movs r5, r0
	bne _020CA564
	ldr r1, _020CA56C ; =_021E0914
	mov r0, sb
	mov r2, #0x3c
	mov r3, #0
	bl NNS_SndArcReadFile
	cmp r0, #0x3c
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, _020CA570 ; =_021E0914
	cmp r8, #0
	ldr r0, [r0, #0x38]
	mov r6, r0, lsl #2
	mov r4, r6, lsl #1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r7, #0
	moveq r3, #0
	beq _020CA4DC
	bl NNS_SndArcGetCurrent
	mov r3, r0
_020CA4DC:
	ldr r2, _020CA574 ; =WaveArcTableDisposeCallback
	mov r0, r8
	add r1, r4, #0x5c
	str sb, [sp]
	bl NNS_SndHeapAlloc
	movs r5, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, sb
	mov r1, r5
	add r2, r6, #0x3c
	mov r3, #0
	bl NNS_SndArcReadFile
	add r1, r6, #0x3c
	cmp r0, r1
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [r5, #0x38]
	add r0, r5, #0x3c
	mov r2, r6
	add r1, r0, r1, lsl #2
	bl MI_CpuCopy8
	mov r2, r6
	add r0, r5, #0x3c
	mov r1, #0
	bl MI_CpuFill8
	mov r0, r5
	add r1, r4, #0x3c
	bl DC_StoreRange
	cmp r7, #0
	beq _020CA564
	mov r0, sb
	mov r1, r5
	bl NNS_SndArcSetFileAddress
_020CA564:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020CA56C: .word _021E0914
_020CA570: .word _021E0914
_020CA574: .word WaveArcTableDisposeCallback
	arm_func_end LoadWaveArcTable

	arm_func_start DisposeCallback
DisposeCallback: ; 0x020CA578
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r4, r1
	mov r7, r0
	mov r6, r2
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	bl OS_DisableInterrupts
	mov r5, r0
	mov r0, r4
	bl NNS_SndArcSetCurrent
	mov r4, r0
	mov r0, r6
	bl NNS_SndArcGetFileAddress
	cmp r7, r0
	bne _020CA5BC
	mov r0, r6
	mov r1, #0
	bl NNS_SndArcSetFileAddress
_020CA5BC:
	mov r0, r4
	bl NNS_SndArcSetCurrent
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end DisposeCallback

	arm_func_start SeqDisposeCallback
SeqDisposeCallback: ; 0x020CA5D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, r2
	mov r5, r0
	mov r2, r3
	bl DisposeCallback
	mov r0, r5
	add r1, r5, r4
	bl SND_InvalidateSeqData
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end SeqDisposeCallback

	arm_func_start BankDisposeCallback
BankDisposeCallback: ; 0x020CA5F8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, r2
	mov r5, r0
	mov r2, r3
	bl DisposeCallback
	mov r0, r5
	add r1, r5, r4
	bl SND_InvalidateBankData
	mov r0, r5
	bl SND_DestroyBank
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end BankDisposeCallback

	arm_func_start WaveArcDisposeCallback
WaveArcDisposeCallback: ; 0x020CA628
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, r2
	mov r5, r0
	mov r2, r3
	bl DisposeCallback
	mov r0, r5
	add r1, r5, r4
	bl SND_InvalidateWaveData
	mov r0, r5
	bl SND_DestroyWaveArc
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end WaveArcDisposeCallback

	arm_func_start WaveArcTableDisposeCallback
WaveArcTableDisposeCallback: ; 0x020CA658
	stmdb sp!, {r4, lr}
	mov r1, r2
	mov r4, r0
	mov r2, r3
	bl DisposeCallback
	mov r0, r4
	bl SND_DestroyWaveArc
	ldmia sp!, {r4, pc}
	arm_func_end WaveArcTableDisposeCallback

	arm_func_start SingleWaveDisposeCallback
SingleWaveDisposeCallback: ; 0x020CA678
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r2
	mov r7, r0
	mov r4, r3
	mov r6, r1
	mov r0, r5
	mov r1, r4
	bl SND_GetWaveDataAddress
	cmp r7, r0
	bne _020CA6B0
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl SND_SetWaveDataAddress
_020CA6B0:
	mov r0, r7
	add r1, r7, r6
	bl SND_InvalidateWaveData
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end SingleWaveDisposeCallback

	arm_func_start LoadSingleWave
LoadSingleWave: ; 0x020CA6C0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl SND_GetWaveDataAddress
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r8
	bl SND_GetWaveDataCount
	ldr r1, [r8, #0x38]
	sub r0, r0, #1
	add r1, r1, r7
	add r1, r8, r1, lsl #2
	cmp r7, r0
	ldrlo r0, [r1, #0x40]
	ldr r4, [r1, #0x3c]
	ldrhs r0, [r8, #8]
	cmp r5, #0
	sub sb, r0, r4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r2, _020CA784 ; =SingleWaveDisposeCallback
	mov r0, r5
	mov r3, r8
	add r1, sb, #0x20
	str r7, [sp]
	bl NNS_SndHeapAlloc
	movs r5, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r6
	mov r1, r5
	mov r2, sb
	mov r3, r4
	bl NNS_SndArcReadFile
	cmp sb, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r5
	mov r1, sb
	bl DC_StoreRange
	mov r0, r8
	mov r1, r7
	mov r2, r5
	bl SND_SetWaveDataAddress
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020CA784: .word SingleWaveDisposeCallback
	arm_func_end LoadSingleWave

	arm_func_start LoadSingleWaves
LoadSingleWaves: ; 0x020CA788
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x1c
	mov r8, r0
	add r0, sp, #0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	ldr r4, [sp, #0x40]
	bl SND_GetFirstInstDataPos
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	cmp r7, #0
	add r2, sp, #8
	addeq sp, sp, #0x1c
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r1, sp, #0x10
	mov r0, r7
	bl SND_GetNextInstData
	cmp r0, #0
	beq _020CA83C
	add sl, sp, #0x10
	add sb, sp, #8
_020CA7EC:
	ldrb r0, [sp, #0x10]
	cmp r0, #1
	ldreqh r0, [sp, #0x14]
	cmpeq r6, r0
	bne _020CA824
	ldrh r1, [sp, #0x12]
	mov r0, r8
	mov r2, r5
	mov r3, r4
	bl LoadSingleWave
	cmp r0, #0
	addeq sp, sp, #0x1c
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020CA824:
	mov r0, r7
	mov r1, sl
	mov r2, sb
	bl SND_GetNextInstData
	cmp r0, #0
	bne _020CA7EC
_020CA83C:
	mov r0, #1
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end LoadSingleWaves

	arm_func_start NNS_SndArcPlayerSetup
NNS_SndArcPlayerSetup: ; 0x020CA848
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r4, r0
	bl NNS_SndArcGetCurrent
	mov r6, #0
	mov r5, r6
_020CA85C:
	mov r0, r6
	bl NNS_SndArcGetStrmInfo
	movs r7, r0
	beq _020CA8D0
	ldrb r1, [r7]
	mov r0, r6
	bl NNS_SndPlayerSetPlayableSeqCount
	ldrh r1, [r7, #2]
	mov r0, r6
	bl NNS_SndPlayerSetAllocatableChannel
	ldr r0, [r7, #4]
	cmp r0, #0
	cmpne r4, #0
	beq _020CA8D0
	ldrb r0, [r7]
	mov r8, r5
	cmp r0, #0
	ble _020CA8D0
_020CA8A4:
	ldr r2, [r7, #4]
	mov r0, r6
	mov r1, r4
	bl NNS_SndPlayerCreateHeap
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldrb r0, [r7]
	add r8, r8, #1
	cmp r8, r0
	blt _020CA8A4
_020CA8D0:
	add r6, r6, #1
	cmp r6, #0x20
	blt _020CA85C
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end NNS_SndArcPlayerSetup

	arm_func_start NNS_SndArcPlayerStartSeqEx
NNS_SndArcPlayerStartSeqEx: ; 0x020CA8E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r7, r0
	ldr r0, [sp, #0x20]
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl NNS_SndArcGetSeqInfo
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #0
	ldrltb r4, [r0, #8]
	cmp r5, #0
	ldrlth r5, [r0, #4]
	cmp r6, #0
	ldrltb r6, [r0, #9]
	ldr ip, [sp, #0x20]
	mov r2, r5
	str r0, [sp]
	mov r0, r7
	mov r1, r6
	mov r3, r4
	str ip, [sp, #4]
	bl StartSeq
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNS_SndArcPlayerStartSeqEx

	arm_func_start NNS_SndArcPlayerStartSeqArc
NNS_SndArcPlayerStartSeqArc: ; 0x020CA954
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r6, r1
	mov r7, r0
	mov r0, r6
	mov r5, r2
	bl NNS_SndArcGetSeqArcInfo
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r0]
	bl NNS_SndArcGetFileAddress
	movs r4, r0
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, r5
	bl NNSi_SndSeqArcGetSeqInfo
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	stmia sp, {r0, r4, r6}
	str r5, [sp, #0xc]
	ldrb r1, [r0, #9]
	ldrh r2, [r0, #4]
	ldrb r3, [r0, #8]
	mov r0, r7
	bl StartSeqArc
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end NNS_SndArcPlayerStartSeqArc

	arm_func_start StartSeq
StartSeq: ; 0x020CA9D4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r8, r2
	mov r2, r3
	ldr r5, [sp, #0x28]
	mov r6, r0
	mov r7, r1
	bl NNSi_SndPlayerAllocSeqPlayer
	movs r4, r0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r0, r7
	mov r1, r4
	bl NNSi_SndPlayerAllocHeap
	mov r7, r0
	add ip, sp, #4
	mov r0, r8
	mov r2, r7
	mov r1, #6
	mov r3, #0
	str ip, [sp]
	bl NNSi_SndArcLoadBank
	cmp r0, #0
	beq _020CAA4C
	mov r0, r4
	bl NNSi_SndPlayerFreeSeqPlayer
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020CAA4C:
	ldr r0, [sp, #0x2c]
	add ip, sp, #8
	mov r2, r7
	mov r1, #1
	mov r3, #0
	str ip, [sp]
	bl NNSi_SndArcLoadSeq
	cmp r0, #0
	beq _020CAA84
	mov r0, r4
	bl NNSi_SndPlayerFreeSeqPlayer
	add sp, sp, #0xc
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020CAA84:
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	ldr r1, [r2, #0x18]
	mov r0, r4
	add r1, r2, r1
	mov r2, #0
	bl NNSi_SndPlayerStartSeq
	ldrb r1, [r5, #6]
	mov r0, r6
	bl NNS_SndPlayerSetInitialVolume
	ldrb r1, [r5, #7]
	mov r0, r6
	bl NNS_SndPlayerSetChannelPriority
	ldr r1, [sp, #0x2c]
	mov r0, r6
	bl NNS_SndPlayerSetSeqNo
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end StartSeq

	arm_func_start StartSeqArc
StartSeqArc: ; 0x020CAAD0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r7, r2
	mov r2, r3
	ldr r6, [sp, #0x20]
	mov r4, r0
	mov r8, r1
	bl NNSi_SndPlayerAllocSeqPlayer
	movs r5, r0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r8
	mov r1, r5
	bl NNSi_SndPlayerAllocHeap
	add ip, sp, #4
	mov r2, r0
	mov r0, r7
	mov r1, #6
	mov r3, #0
	str ip, [sp]
	bl NNSi_SndArcLoadBank
	cmp r0, #0
	beq _020CAB44
	mov r0, r5
	bl NNSi_SndPlayerFreeSeqPlayer
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020CAB44:
	ldr ip, [sp, #0x24]
	ldr r2, [r6]
	ldr r1, [ip, #0x18]
	ldr r3, [sp, #4]
	mov r0, r5
	add r1, ip, r1
	bl NNSi_SndPlayerStartSeq
	ldrb r1, [r6, #6]
	mov r0, r4
	bl NNS_SndPlayerSetInitialVolume
	ldrb r1, [r6, #7]
	mov r0, r4
	bl NNS_SndPlayerSetChannelPriority
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov r0, r4
	bl NNS_SndPlayerSetSeqArcNo
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end StartSeqArc

	arm_func_start NNSi_SndArcStrmMain
NNSi_SndArcStrmMain: ; 0x020CAB94
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r7, _020CAC9C ; =_021E0FEC
	ldr r4, _020CACA0 ; =_0210D750
	mov r5, #0
_020CABA4:
	ldr r1, [r7, #0x110]
	mov r0, r1, lsl #0x1f
	movs r0, r0, asr #0x1f
	beq _020CAC88
	ldr r0, [r7, #0x114]
	cmp r0, #0
	bne _020CABCC
	mov r0, r7
	bl ForceStopStrm__SndArc
	b _020CAC88
_020CABCC:
	mov r0, r1, lsl #0x1d
	movs r0, r0, asr #0x1f
	ldrne r0, [r7, #0x118]
	cmpne r0, #0
	beq _020CABF8
	mov r0, r7
	bl NNS_SndStrmStart
	ldr r0, [r7, #0x110]
	orr r0, r0, #2
	bic r0, r0, #4
	str r0, [r7, #0x110]
_020CABF8:
	ldr r0, [r7, #0x110]
	mov r0, r0, lsl #0x1e
	movs r0, r0, asr #0x1f
	beq _020CAC88
	add r0, r7, #0xe8
	bl NNSi_SndFaderUpdate
	ldr r1, [r7, #0x154]
	add r0, r7, #0xe8
	mov r1, r1, lsl #1
	ldrsh r6, [r4, r1]
	bl NNSi_SndFaderGet
	mov r0, r0, asr #8
	ldr r1, [r7, #0x158]
	mov r0, r0, lsl #1
	mov r2, r1, lsl #1
	ldrsh r1, [r4, r0]
	ldrsh r2, [r4, r2]
	ldr r0, [r7, #0x15c]
	add r1, r1, r6
	add r6, r2, r1
	cmp r6, r0
	beq _020CAC60
	mov r0, r7
	mov r1, r6
	bl NNS_SndStrmSetVolume
	str r6, [r7, #0x15c]
_020CAC60:
	ldr r0, [r7, #0x110]
	mov r0, r0, lsl #0x1c
	movs r0, r0, asr #0x1f
	beq _020CAC88
	add r0, r7, #0xe8
	bl NNSi_SndFaderIsFinished
	cmp r0, #0
	beq _020CAC88
	mov r0, r7
	bl ForceStopStrm__SndArc
_020CAC88:
	add r5, r5, #1
	cmp r5, #4
	add r7, r7, #0x174
	blt _020CABA4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020CAC9C: .word _021E0FEC
_020CACA0: .word _0210D750
	arm_func_end NNSi_SndArcStrmMain

	arm_func_start FreePlayer
FreePlayer: ; 0x020CACA4
	ldr r2, [r0, #0x14c]
	cmp r2, #0
	movne r1, #0
	strne r1, [r2]
	strne r1, [r0, #0x14c]
	ldr r1, [r0, #0x110]
	bic r2, r1, #1
	bic r1, r2, #4
	bic r1, r1, #2
	str r1, [r0, #0x110]
	bx lr
	arm_func_end FreePlayer

	arm_func_start ForceStopStrm__SndArc
ForceStopStrm__SndArc: ; 0x020CACD0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _020CAD60 ; =_021E0FC8
	bl OS_LockMutex
	ldr r0, _020CAD64 ; =_021E0950
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020CACFC
	add r0, r0, #0xc8
	add r0, r0, #0x400
	bl OS_LockMutex
_020CACFC:
	ldr r0, [r4, #0x110]
	mov r0, r0, lsl #0x1e
	movs r0, r0, asr #0x1f
	beq _020CAD14
	mov r0, r4
	bl NNS_SndStrmStop
_020CAD14:
	ldr r0, [r4, #0x110]
	mov r0, r0, lsl #0x1f
	movs r0, r0, asr #0x1f
	beq _020CAD30
	ldr r1, [r4, #0x170]
	mov r0, r4
	blx r1
_020CAD30:
	mov r0, r4
	bl ShutdownPlayer__SndArc
	ldr r0, _020CAD60 ; =_021E0FC8
	bl OS_UnlockMutex
	ldr r0, _020CAD64 ; =_021E0950
	ldr r0, [r0, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r0, #0xc8
	add r0, r0, #0x400
	bl OS_UnlockMutex
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CAD60: .word _021E0FC8
_020CAD64: .word _021E0950
	arm_func_end ForceStopStrm__SndArc

	arm_func_start ShutdownPlayer__SndArc
ShutdownPlayer__SndArc: ; 0x020CAD68
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #0x110]
	mov r1, r1, lsl #0x1f
	movs r1, r1, asr #0x1f
	ldmeqia sp!, {r4, pc}
	bl FreeChannel
	ldr r1, [r4, #0x168]
	mov r0, r4
	blx r1
	ldr r0, _020CADC4 ; =_021E0FE0
	mov r1, r4
	bl RemoveCommandByPlayer
	ldr r0, _020CADC8 ; =_021E0950
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020CADB8
	mov r1, r4
	add r0, r0, #0x4e0
	bl RemoveCommandByPlayer
_020CADB8:
	mov r0, r4
	bl FreePlayer
	ldmia sp!, {r4, pc}
	.align 2, 0
_020CADC4: .word _021E0FE0
_020CADC8: .word _021E0950
	arm_func_end ShutdownPlayer__SndArc

	arm_func_start FreeChannel
FreeChannel: ; 0x020CADCC
	stmdb sp!, {r3, lr}
	ldr r1, [r0, #0x120]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	subs r1, r1, #1
	str r1, [r0, #0x120]
	ldmneia sp!, {r3, pc}
	bl NNS_SndStrmFreeChannel
	ldmia sp!, {r3, pc}
	arm_func_end FreeChannel

	arm_func_start RemoveCommandByPlayer
RemoveCommandByPlayer: ; 0x020CADF0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r8, r0
	mov r7, r1
	bl OS_DisableInterrupts
	mov r4, r0
	mov r0, r8
	mov r1, #0
	bl NNS_FndGetNextListObject
	movs r5, r0
	beq _020CAE54
_020CAE18:
	mov r0, r8
	mov r1, r5
	bl NNS_FndGetNextListObject
	ldr r1, [r5, #8]
	mov r6, r0
	cmp r1, r7
	bne _020CAE48
	mov r0, r8
	mov r1, r5
	bl NNS_FndRemoveListObject
	mov r0, r5
	bl FreeCommandBuffer
_020CAE48:
	mov r5, r6
	cmp r6, #0
	bne _020CAE18
_020CAE54:
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end RemoveCommandByPlayer

	arm_func_start FreeCommandBuffer
FreeCommandBuffer: ; 0x020CAE60
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	mov r4, r0
	ldr r0, _020CAE88 ; =_021E095C
	mov r1, r5
	bl NNS_FndAppendListObject
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020CAE88: .word _021E095C
	arm_func_end FreeCommandBuffer

	arm_func_start NNSi_SndSeqArcGetSeqInfo
NNSi_SndSeqArcGetSeqInfo: ; 0x020CAE8C
	cmp r1, #0
	movlt r0, #0
	bxlt lr
	ldr r2, [r0, #0x1c]
	cmp r1, r2
	movhs r0, #0
	bxhs lr
	mov r2, #0xc
	mul r3, r1, r2
	add ip, r0, #0x20
	ldr r1, [ip, r3]
	sub r0, r2, #0xd
	cmp r1, r0
	add r0, ip, r3
	moveq r0, #0
	bx lr
	arm_func_end NNSi_SndSeqArcGetSeqInfo

	arm_func_start NNSi_SndFaderInit
NNSi_SndFaderInit: ; 0x020CAECC
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	str r1, [r0, #0xc]
	str r1, [r0, #8]
	bx lr
	arm_func_end NNSi_SndFaderInit

	arm_func_start NNSi_SndFaderSet
NNSi_SndFaderSet: ; 0x020CAEE4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl NNSi_SndFaderGet
	stmia r6, {r0, r5}
	str r4, [r6, #0xc]
	mov r0, #0
	str r0, [r6, #8]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end NNSi_SndFaderSet

	arm_func_start NNSi_SndFaderGet
NNSi_SndFaderGet: ; 0x020CAF0C
	stmdb sp!, {r4, lr}
	ldr r1, [r0, #0xc]
	ldr r2, [r0, #8]
	cmp r2, r1
	ldrge r0, [r0, #4]
	ldmgeia sp!, {r4, pc}
	ldr r4, [r0]
	ldr r0, [r0, #4]
	sub r0, r0, r4
	mul r0, r2, r0
	bl _s32_div_f
	add r0, r4, r0
	ldmia sp!, {r4, pc}
	arm_func_end NNSi_SndFaderGet

	arm_func_start NNSi_SndFaderUpdate
NNSi_SndFaderUpdate: ; 0x020CAF40
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	cmp r2, r1
	addlt r1, r2, #1
	strlt r1, [r0, #8]
	bx lr
	arm_func_end NNSi_SndFaderUpdate

	arm_func_start NNSi_SndFaderIsFinished
NNSi_SndFaderIsFinished: ; 0x020CAF58
	ldr r1, [r0, #8]
	ldr r0, [r0, #0xc]
	cmp r1, r0
	movge r0, #1
	movlt r0, #0
	bx lr
	arm_func_end NNSi_SndFaderIsFinished

	.rodata

_02109200:
	.word AllocatorAllocForExpHeap
	.word AllocatorFreeForExpHeap
	.word AllocatorAllocForSDKHeap
	.word AllocatorFreeForSDKHeap
_02109210:
	.word DoTransfer3dTex
	.word DoTransfer3dTexPltt
	.word DoTransfer3dClearImageColor
	.word DoTransfer3dClearImageDepth
	.word DoTransfer2dBG0CharMain
	.word DoTransfer2dBG1CharMain
	.word DoTransfer2dBG2CharMain
	.word DoTransfer2dBG3CharMain
	.word DoTransfer2dBG0ScrMain
	.word DoTransfer2dBG1ScrMain
	.word DoTransfer2dBG2ScrMain
	.word DoTransfer2dBG3ScrMain
	.word DoTransfer2dBG2BmpMain
	.word DoTransfer2dBG3BmpMain
	.word DoTransfer2dObjPlttMain
	.word DoTransfer2dBGPlttMain
	.word DoTransfer2dObjExtPlttMain
	.word DoTransfer2dBGExtPlttMain
	.word DoTransfer2dObjOamMain
	.word DoTransfer2dObjCharMain
	.word DoTransfer2dBG0CharSub
	.word DoTransfer2dBG1CharSub
	.word DoTransfer2dBG2CharSub
	.word DoTransfer2dBG3CharSub
	.word DoTransfer2dBG0ScrSub
	.word DoTransfer2dBG1ScrSub
	.word DoTransfer2dBG2ScrSub
	.word DoTransfer2dBG3ScrSub
	.word DoTransfer2dBG2BmpSub
	.word DoTransfer2dBG3BmpSub
	.word DoTransfer2dObjPlttSub
	.word DoTransfer2dBGPlttSub
	.word DoTransfer2dObjExtPlttSub
	.word DoTransfer2dBGExtPlttSub
	.word DoTransfer2dObjOamSub
	.word DoTransfer2dObjCharSub
_021092A0:
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
_021092E0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021092EC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF, 0xFF
_021092F8:
	.byte 0x08, 0x00, 0x10, 0x00, 0x20, 0x00, 0x40, 0x00
	.byte 0x08, 0x00, 0x08, 0x00, 0x10, 0x00, 0x20, 0x00, 0x10, 0x00, 0x20, 0x00, 0x20, 0x00, 0x40, 0x00
_02109310:
	.byte 0x08, 0x00, 0x10, 0x00, 0x20, 0x00, 0x40, 0x00, 0x10, 0x00, 0x20, 0x00, 0x20, 0x00, 0x40, 0x00
	.byte 0x08, 0x00, 0x08, 0x00, 0x10, 0x00, 0x20, 0x00
_02109328:
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
_0210933C:
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00
_02109344:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00
_02109364:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00
_02109394:
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
_021093CC:
	.byte 0x00, 0x10, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
_021093F0:
	.word DrawGlyphLine, ClearLine, ClearAreaLine
_021093FC:
	.word DrawGlyphLine, ClearContinuous, ClearAreaLine
_02109408:
	.word DrawGlyph1D, ClearContinuous, ClearArea1D
_02109414:
	.byte 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x01, 0x01, 0x01
	.byte 0x02, 0x01, 0x02, 0x01, 0x00, 0x02, 0x01, 0x02, 0x02, 0x02, 0x03, 0x02, 0x00, 0x02, 0x01, 0x02
	.byte 0x02, 0x03, 0x03, 0x03
_02109434:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x40, 0x00, 0x40
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x00, 0x40, 0x00, 0x80
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x40, 0x00, 0x80, 0x00, 0x80, 0x00, 0x00, 0x00, 0x80
	.byte 0x00, 0x40, 0x00, 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0xC0
	.byte 0x00, 0x00, 0x00, 0xC0
_02109474:
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x7F
	.byte 0xFF, 0x7F, 0xFF, 0x7F, 0x00, 0x80, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x80, 0xFF, 0x7F
	.byte 0xFF, 0xFF, 0xFF, 0x7F
_02109494:
	.byte 0x04, 0x05, 0x07, 0x08, 0x03, 0x05, 0x06, 0x08, 0x03, 0x04, 0x06, 0x07
	.byte 0x01, 0x02, 0x07, 0x08, 0x00, 0x02, 0x06, 0x08, 0x00, 0x01, 0x06, 0x07, 0x01, 0x02, 0x04, 0x05
	.byte 0x00, 0x02, 0x03, 0x05, 0x00, 0x01, 0x03, 0x04
_021094B8:
	.byte 0x04, 0x05, 0x07, 0x08, 0x03, 0x05, 0x06, 0x08
	.byte 0x03, 0x04, 0x06, 0x07, 0x01, 0x02, 0x07, 0x08, 0x00, 0x02, 0x06, 0x08, 0x00, 0x01, 0x06, 0x07
	.byte 0x01, 0x02, 0x04, 0x05, 0x00, 0x02, 0x03, 0x05, 0x00, 0x01, 0x03, 0x04
	.public FX_SinCosTable_
FX_SinCosTable_: ; fx16 sin/cos lookup table? there's too many of these
	.short 0x0000, 0x1000
	.short 0x0006, 0x1000
	.short 0x000D, 0x1000
	.short 0x0013, 0x1000
	.short 0x0019, 0x1000
	.short 0x001F, 0x1000
	.short 0x0026, 0x1000
	.short 0x002C, 0x1000
	.short 0x0032, 0x1000
	.short 0x0039, 0x1000
	.short 0x003F, 0x1000
	.short 0x0045, 0x0FFF
	.short 0x004B, 0x0FFF
	.short 0x0052, 0x0FFF
	.short 0x0058, 0x0FFF
	.short 0x005E, 0x0FFF
	.short 0x0065, 0x0FFF
	.short 0x006B, 0x0FFF
	.short 0x0071, 0x0FFE
	.short 0x0077, 0x0FFE
	.short 0x007E, 0x0FFE
	.short 0x0084, 0x0FFE
	.short 0x008A, 0x0FFE
	.short 0x0090, 0x0FFD
	.short 0x0097, 0x0FFD
	.short 0x009D, 0x0FFD
	.short 0x00A3, 0x0FFD
	.short 0x00AA, 0x0FFC
	.short 0x00B0, 0x0FFC
	.short 0x00B6, 0x0FFC
	.short 0x00BC, 0x0FFC
	.short 0x00C3, 0x0FFB
	.short 0x00C9, 0x0FFB
	.short 0x00CF, 0x0FFB
	.short 0x00D6, 0x0FFA
	.short 0x00DC, 0x0FFA
	.short 0x00E2, 0x0FFA
	.short 0x00E8, 0x0FF9
	.short 0x00EF, 0x0FF9
	.short 0x00F5, 0x0FF9
	.short 0x00FB, 0x0FF8
	.short 0x0101, 0x0FF8
	.short 0x0108, 0x0FF8
	.short 0x010E, 0x0FF7
	.short 0x0114, 0x0FF7
	.short 0x011B, 0x0FF6
	.short 0x0121, 0x0FF6
	.short 0x0127, 0x0FF5
	.short 0x012D, 0x0FF5
	.short 0x0134, 0x0FF4
	.short 0x013A, 0x0FF4
	.short 0x0140, 0x0FF3
	.short 0x0146, 0x0FF3
	.short 0x014D, 0x0FF2
	.short 0x0153, 0x0FF2
	.short 0x0159, 0x0FF1
	.short 0x015F, 0x0FF1
	.short 0x0166, 0x0FF0
	.short 0x016C, 0x0FF0
	.short 0x0172, 0x0FEF
	.short 0x0178, 0x0FEF
	.short 0x017F, 0x0FEE
	.short 0x0185, 0x0FED
	.short 0x018B, 0x0FED
	.short 0x0191, 0x0FEC
	.short 0x0198, 0x0FEC
	.short 0x019E, 0x0FEB
	.short 0x01A4, 0x0FEA
	.short 0x01AA, 0x0FEA
	.short 0x01B1, 0x0FE9
	.short 0x01B7, 0x0FE8
	.short 0x01BD, 0x0FE8
	.short 0x01C3, 0x0FE7
	.short 0x01CA, 0x0FE6
	.short 0x01D0, 0x0FE6
	.short 0x01D6, 0x0FE5
	.short 0x01DC, 0x0FE4
	.short 0x01E3, 0x0FE3
	.short 0x01E9, 0x0FE3
	.short 0x01EF, 0x0FE2
	.short 0x01F5, 0x0FE1
	.short 0x01FC, 0x0FE0
	.short 0x0202, 0x0FE0
	.short 0x0208, 0x0FDF
	.short 0x020E, 0x0FDE
	.short 0x0215, 0x0FDD
	.short 0x021B, 0x0FDC
	.short 0x0221, 0x0FDC
	.short 0x0227, 0x0FDB
	.short 0x022D, 0x0FDA
	.short 0x0234, 0x0FD9
	.short 0x023A, 0x0FD8
	.short 0x0240, 0x0FD7
	.short 0x0246, 0x0FD6
	.short 0x024D, 0x0FD5
	.short 0x0253, 0x0FD5
	.short 0x0259, 0x0FD4
	.short 0x025F, 0x0FD3
	.short 0x0265, 0x0FD2
	.short 0x026C, 0x0FD1
	.short 0x0272, 0x0FD0
	.short 0x0278, 0x0FCF
	.short 0x027E, 0x0FCE
	.short 0x0284, 0x0FCD
	.short 0x028B, 0x0FCC
	.short 0x0291, 0x0FCB
	.short 0x0297, 0x0FCA
	.short 0x029D, 0x0FC9
	.short 0x02A3, 0x0FC8
	.short 0x02AA, 0x0FC7
	.short 0x02B0, 0x0FC6
	.short 0x02B6, 0x0FC5
	.short 0x02BC, 0x0FC4
	.short 0x02C2, 0x0FC3
	.short 0x02C9, 0x0FC2
	.short 0x02CF, 0x0FC0
	.short 0x02D5, 0x0FBF
	.short 0x02DB, 0x0FBE
	.short 0x02E1, 0x0FBD
	.short 0x02E8, 0x0FBC
	.short 0x02EE, 0x0FBB
	.short 0x02F4, 0x0FBA
	.short 0x02FA, 0x0FB8
	.short 0x0300, 0x0FB7
	.short 0x0306, 0x0FB6
	.short 0x030D, 0x0FB5
	.short 0x0313, 0x0FB4
	.short 0x0319, 0x0FB3
	.short 0x031F, 0x0FB1
	.short 0x0325, 0x0FB0
	.short 0x032B, 0x0FAF
	.short 0x0332, 0x0FAE
	.short 0x0338, 0x0FAC
	.short 0x033E, 0x0FAB
	.short 0x0344, 0x0FAA
	.short 0x034A, 0x0FA8
	.short 0x0350, 0x0FA7
	.short 0x0356, 0x0FA6
	.short 0x035D, 0x0FA5
	.short 0x0363, 0x0FA3
	.short 0x0369, 0x0FA2
	.short 0x036F, 0x0FA1
	.short 0x0375, 0x0F9F
	.short 0x037B, 0x0F9E
	.short 0x0381, 0x0F9C
	.short 0x0388, 0x0F9B
	.short 0x038E, 0x0F9A
	.short 0x0394, 0x0F98
	.short 0x039A, 0x0F97
	.short 0x03A0, 0x0F95
	.short 0x03A6, 0x0F94
	.short 0x03AC, 0x0F93
	.short 0x03B2, 0x0F91
	.short 0x03B9, 0x0F90
	.short 0x03BF, 0x0F8E
	.short 0x03C5, 0x0F8D
	.short 0x03CB, 0x0F8B
	.short 0x03D1, 0x0F8A
	.short 0x03D7, 0x0F88
	.short 0x03DD, 0x0F87
	.short 0x03E3, 0x0F85
	.short 0x03E9, 0x0F84
	.short 0x03EF, 0x0F82
	.short 0x03F6, 0x0F81
	.short 0x03FC, 0x0F7F
	.short 0x0402, 0x0F7D
	.short 0x0408, 0x0F7C
	.short 0x040E, 0x0F7A
	.short 0x0414, 0x0F79
	.short 0x041A, 0x0F77
	.short 0x0420, 0x0F76
	.short 0x0426, 0x0F74
	.short 0x042C, 0x0F72
	.short 0x0432, 0x0F71
	.short 0x0438, 0x0F6F
	.short 0x043E, 0x0F6D
	.short 0x0444, 0x0F6C
	.short 0x044B, 0x0F6A
	.short 0x0451, 0x0F68
	.short 0x0457, 0x0F67
	.short 0x045D, 0x0F65
	.short 0x0463, 0x0F63
	.short 0x0469, 0x0F61
	.short 0x046F, 0x0F60
	.short 0x0475, 0x0F5E
	.short 0x047B, 0x0F5C
	.short 0x0481, 0x0F5A
	.short 0x0487, 0x0F59
	.short 0x048D, 0x0F57
	.short 0x0493, 0x0F55
	.short 0x0499, 0x0F53
	.short 0x049F, 0x0F51
	.short 0x04A5, 0x0F50
	.short 0x04AB, 0x0F4E
	.short 0x04B1, 0x0F4C
	.short 0x04B7, 0x0F4A
	.short 0x04BD, 0x0F48
	.short 0x04C3, 0x0F46
	.short 0x04C9, 0x0F45
	.short 0x04CF, 0x0F43
	.short 0x04D5, 0x0F41
	.short 0x04DB, 0x0F3F
	.short 0x04E1, 0x0F3D
	.short 0x04E7, 0x0F3B
	.short 0x04ED, 0x0F39
	.short 0x04F3, 0x0F37
	.short 0x04F9, 0x0F35
	.short 0x04FF, 0x0F33
	.short 0x0505, 0x0F31
	.short 0x050B, 0x0F2F
	.short 0x0511, 0x0F2D
	.short 0x0517, 0x0F2B
	.short 0x051D, 0x0F29
	.short 0x0523, 0x0F27
	.short 0x0529, 0x0F25
	.short 0x052F, 0x0F23
	.short 0x0534, 0x0F21
	.short 0x053A, 0x0F1F
	.short 0x0540, 0x0F1D
	.short 0x0546, 0x0F1B
	.short 0x054C, 0x0F19
	.short 0x0552, 0x0F17
	.short 0x0558, 0x0F15
	.short 0x055E, 0x0F13
	.short 0x0564, 0x0F11
	.short 0x056A, 0x0F0E
	.short 0x0570, 0x0F0C
	.short 0x0576, 0x0F0A
	.short 0x057C, 0x0F08
	.short 0x0581, 0x0F06
	.short 0x0587, 0x0F04
	.short 0x058D, 0x0F02
	.short 0x0593, 0x0EFF
	.short 0x0599, 0x0EFD
	.short 0x059F, 0x0EFB
	.short 0x05A5, 0x0EF9
	.short 0x05AB, 0x0EF7
	.short 0x05B1, 0x0EF4
	.short 0x05B6, 0x0EF2
	.short 0x05BC, 0x0EF0
	.short 0x05C2, 0x0EEE
	.short 0x05C8, 0x0EEB
	.short 0x05CE, 0x0EE9
	.short 0x05D4, 0x0EE7
	.short 0x05DA, 0x0EE4
	.short 0x05DF, 0x0EE2
	.short 0x05E5, 0x0EE0
	.short 0x05EB, 0x0EDD
	.short 0x05F1, 0x0EDB
	.short 0x05F7, 0x0ED9
	.short 0x05FD, 0x0ED6
	.short 0x0602, 0x0ED4
	.short 0x0608, 0x0ED2
	.short 0x060E, 0x0ECF
	.short 0x0614, 0x0ECD
	.short 0x061A, 0x0ECB
	.short 0x061F, 0x0EC8
	.short 0x0625, 0x0EC6
	.short 0x062B, 0x0EC3
	.short 0x0631, 0x0EC1
	.short 0x0637, 0x0EBF
	.short 0x063C, 0x0EBC
	.short 0x0642, 0x0EBA
	.short 0x0648, 0x0EB7
	.short 0x064E, 0x0EB5
	.short 0x0654, 0x0EB2
	.short 0x0659, 0x0EB0
	.short 0x065F, 0x0EAD
	.short 0x0665, 0x0EAB
	.short 0x066B, 0x0EA8
	.short 0x0670, 0x0EA6
	.short 0x0676, 0x0EA3
	.short 0x067C, 0x0EA1
	.short 0x0682, 0x0E9E
	.short 0x0687, 0x0E9B
	.short 0x068D, 0x0E99
	.short 0x0693, 0x0E96
	.short 0x0699, 0x0E94
	.short 0x069E, 0x0E91
	.short 0x06A4, 0x0E8F
	.short 0x06AA, 0x0E8C
	.short 0x06AF, 0x0E89
	.short 0x06B5, 0x0E87
	.short 0x06BB, 0x0E84
	.short 0x06C1, 0x0E81
	.short 0x06C6, 0x0E7F
	.short 0x06CC, 0x0E7C
	.short 0x06D2, 0x0E79
	.short 0x06D7, 0x0E77
	.short 0x06DD, 0x0E74
	.short 0x06E3, 0x0E71
	.short 0x06E8, 0x0E6F
	.short 0x06EE, 0x0E6C
	.short 0x06F4, 0x0E69
	.short 0x06F9, 0x0E66
	.short 0x06FF, 0x0E64
	.short 0x0705, 0x0E61
	.short 0x070A, 0x0E5E
	.short 0x0710, 0x0E5B
	.short 0x0715, 0x0E59
	.short 0x071B, 0x0E56
	.short 0x0721, 0x0E53
	.short 0x0726, 0x0E50
	.short 0x072C, 0x0E4D
	.short 0x0732, 0x0E4B
	.short 0x0737, 0x0E48
	.short 0x073D, 0x0E45
	.short 0x0742, 0x0E42
	.short 0x0748, 0x0E3F
	.short 0x074E, 0x0E3C
	.short 0x0753, 0x0E3A
	.short 0x0759, 0x0E37
	.short 0x075E, 0x0E34
	.short 0x0764, 0x0E31
	.short 0x076A, 0x0E2E
	.short 0x076F, 0x0E2B
	.short 0x0775, 0x0E28
	.short 0x077A, 0x0E25
	.short 0x0780, 0x0E22
	.short 0x0785, 0x0E1F
	.short 0x078B, 0x0E1C
	.short 0x0790, 0x0E19
	.short 0x0796, 0x0E16
	.short 0x079B, 0x0E13
	.short 0x07A1, 0x0E10
	.short 0x07A6, 0x0E0D
	.short 0x07AC, 0x0E0A
	.short 0x07B2, 0x0E07
	.short 0x07B7, 0x0E04
	.short 0x07BD, 0x0E01
	.short 0x07C2, 0x0DFE
	.short 0x07C8, 0x0DFB
	.short 0x07CD, 0x0DF8
	.short 0x07D2, 0x0DF5
	.short 0x07D8, 0x0DF2
	.short 0x07DD, 0x0DEF
	.short 0x07E3, 0x0DEC
	.short 0x07E8, 0x0DE9
	.short 0x07EE, 0x0DE6
	.short 0x07F3, 0x0DE3
	.short 0x07F9, 0x0DDF
	.short 0x07FE, 0x0DDC
	.short 0x0804, 0x0DD9
	.short 0x0809, 0x0DD6
	.short 0x080E, 0x0DD3
	.short 0x0814, 0x0DD0
	.short 0x0819, 0x0DCC
	.short 0x081F, 0x0DC9
	.short 0x0824, 0x0DC6
	.short 0x082A, 0x0DC3
	.short 0x082F, 0x0DC0
	.short 0x0834, 0x0DBC
	.short 0x083A, 0x0DB9
	.short 0x083F, 0x0DB6
	.short 0x0845, 0x0DB3
	.short 0x084A, 0x0DB0
	.short 0x084F, 0x0DAC
	.short 0x0855, 0x0DA9
	.short 0x085A, 0x0DA6
	.short 0x085F, 0x0DA2
	.short 0x0865, 0x0D9F
	.short 0x086A, 0x0D9C
	.short 0x086F, 0x0D99
	.short 0x0875, 0x0D95
	.short 0x087A, 0x0D92
	.short 0x087F, 0x0D8F
	.short 0x0885, 0x0D8B
	.short 0x088A, 0x0D88
	.short 0x088F, 0x0D85
	.short 0x0895, 0x0D81
	.short 0x089A, 0x0D7E
	.short 0x089F, 0x0D7A
	.short 0x08A5, 0x0D77
	.short 0x08AA, 0x0D74
	.short 0x08AF, 0x0D70
	.short 0x08B4, 0x0D6D
	.short 0x08BA, 0x0D69
	.short 0x08BF, 0x0D66
	.short 0x08C4, 0x0D62
	.short 0x08C9, 0x0D5F
	.short 0x08CF, 0x0D5C
	.short 0x08D4, 0x0D58
	.short 0x08D9, 0x0D55
	.short 0x08DE, 0x0D51
	.short 0x08E4, 0x0D4E
	.short 0x08E9, 0x0D4A
	.short 0x08EE, 0x0D47
	.short 0x08F3, 0x0D43
	.short 0x08F8, 0x0D40
	.short 0x08FE, 0x0D3C
	.short 0x0903, 0x0D39
	.short 0x0908, 0x0D35
	.short 0x090D, 0x0D32
	.short 0x0912, 0x0D2E
	.short 0x0918, 0x0D2A
	.short 0x091D, 0x0D27
	.short 0x0922, 0x0D23
	.short 0x0927, 0x0D20
	.short 0x092C, 0x0D1C
	.short 0x0931, 0x0D18
	.short 0x0937, 0x0D15
	.short 0x093C, 0x0D11
	.short 0x0941, 0x0D0E
	.short 0x0946, 0x0D0A
	.short 0x094B, 0x0D06
	.short 0x0950, 0x0D03
	.short 0x0955, 0x0CFF
	.short 0x095A, 0x0CFB
	.short 0x095F, 0x0CF8
	.short 0x0965, 0x0CF4
	.short 0x096A, 0x0CF0
	.short 0x096F, 0x0CED
	.short 0x0974, 0x0CE9
	.short 0x0979, 0x0CE5
	.short 0x097E, 0x0CE1
	.short 0x0983, 0x0CDE
	.short 0x0988, 0x0CDA
	.short 0x098D, 0x0CD6
	.short 0x0992, 0x0CD2
	.short 0x0997, 0x0CCF
	.short 0x099C, 0x0CCB
	.short 0x09A1, 0x0CC7
	.short 0x09A6, 0x0CC3
	.short 0x09AB, 0x0CC0
	.short 0x09B0, 0x0CBC
	.short 0x09B5, 0x0CB8
	.short 0x09BA, 0x0CB4
	.short 0x09BF, 0x0CB0
	.short 0x09C4, 0x0CAC
	.short 0x09C9, 0x0CA9
	.short 0x09CE, 0x0CA5
	.short 0x09D3, 0x0CA1
	.short 0x09D8, 0x0C9D
	.short 0x09DD, 0x0C99
	.short 0x09E2, 0x0C95
	.short 0x09E7, 0x0C91
	.short 0x09EC, 0x0C8E
	.short 0x09F1, 0x0C8A
	.short 0x09F6, 0x0C86
	.short 0x09FB, 0x0C82
	.short 0x09FF, 0x0C7E
	.short 0x0A04, 0x0C7A
	.short 0x0A09, 0x0C76
	.short 0x0A0E, 0x0C72
	.short 0x0A13, 0x0C6E
	.short 0x0A18, 0x0C6A
	.short 0x0A1D, 0x0C66
	.short 0x0A22, 0x0C62
	.short 0x0A26, 0x0C5E
	.short 0x0A2B, 0x0C5A
	.short 0x0A30, 0x0C56
	.short 0x0A35, 0x0C52
	.short 0x0A3A, 0x0C4E
	.short 0x0A3F, 0x0C4A
	.short 0x0A44, 0x0C46
	.short 0x0A48, 0x0C42
	.short 0x0A4D, 0x0C3E
	.short 0x0A52, 0x0C3A
	.short 0x0A57, 0x0C36
	.short 0x0A5C, 0x0C32
	.short 0x0A60, 0x0C2E
	.short 0x0A65, 0x0C2A
	.short 0x0A6A, 0x0C26
	.short 0x0A6F, 0x0C22
	.short 0x0A73, 0x0C1E
	.short 0x0A78, 0x0C19
	.short 0x0A7D, 0x0C15
	.short 0x0A82, 0x0C11
	.short 0x0A86, 0x0C0D
	.short 0x0A8B, 0x0C09
	.short 0x0A90, 0x0C05
	.short 0x0A95, 0x0C01
	.short 0x0A99, 0x0BFC
	.short 0x0A9E, 0x0BF8
	.short 0x0AA3, 0x0BF4
	.short 0x0AA7, 0x0BF0
	.short 0x0AAC, 0x0BEC
	.short 0x0AB1, 0x0BE8
	.short 0x0AB5, 0x0BE3
	.short 0x0ABA, 0x0BDF
	.short 0x0ABF, 0x0BDB
	.short 0x0AC3, 0x0BD7
	.short 0x0AC8, 0x0BD2
	.short 0x0ACD, 0x0BCE
	.short 0x0AD1, 0x0BCA
	.short 0x0AD6, 0x0BC6
	.short 0x0ADB, 0x0BC1
	.short 0x0ADF, 0x0BBD
	.short 0x0AE4, 0x0BB9
	.short 0x0AE8, 0x0BB5
	.short 0x0AED, 0x0BB0
	.short 0x0AF2, 0x0BAC
	.short 0x0AF6, 0x0BA8
	.short 0x0AFB, 0x0BA3
	.short 0x0AFF, 0x0B9F
	.short 0x0B04, 0x0B9B
	.short 0x0B08, 0x0B97
	.short 0x0B0D, 0x0B92
	.short 0x0B11, 0x0B8E
	.short 0x0B16, 0x0B89
	.short 0x0B1B, 0x0B85
	.short 0x0B1F, 0x0B81
	.short 0x0B24, 0x0B7C
	.short 0x0B28, 0x0B78
	.short 0x0B2D, 0x0B74
	.short 0x0B31, 0x0B6F
	.short 0x0B36, 0x0B6B
	.short 0x0B3A, 0x0B66
	.short 0x0B3E, 0x0B62
	.short 0x0B43, 0x0B5E
	.short 0x0B47, 0x0B59
	.short 0x0B4C, 0x0B55
	.short 0x0B50, 0x0B50
	.short 0x0B55, 0x0B4C
	.short 0x0B59, 0x0B47
	.short 0x0B5E, 0x0B43
	.short 0x0B62, 0x0B3E
	.short 0x0B66, 0x0B3A
	.short 0x0B6B, 0x0B36
	.short 0x0B6F, 0x0B31
	.short 0x0B74, 0x0B2D
	.short 0x0B78, 0x0B28
	.short 0x0B7C, 0x0B24
	.short 0x0B81, 0x0B1F
	.short 0x0B85, 0x0B1B
	.short 0x0B89, 0x0B16
	.short 0x0B8E, 0x0B11
	.short 0x0B92, 0x0B0D
	.short 0x0B97, 0x0B08
	.short 0x0B9B, 0x0B04
	.short 0x0B9F, 0x0AFF
	.short 0x0BA3, 0x0AFB
	.short 0x0BA8, 0x0AF6
	.short 0x0BAC, 0x0AF2
	.short 0x0BB0, 0x0AED
	.short 0x0BB5, 0x0AE8
	.short 0x0BB9, 0x0AE4
	.short 0x0BBD, 0x0ADF
	.short 0x0BC1, 0x0ADB
	.short 0x0BC6, 0x0AD6
	.short 0x0BCA, 0x0AD1
	.short 0x0BCE, 0x0ACD
	.short 0x0BD2, 0x0AC8
	.short 0x0BD7, 0x0AC3
	.short 0x0BDB, 0x0ABF
	.short 0x0BDF, 0x0ABA
	.short 0x0BE3, 0x0AB5
	.short 0x0BE8, 0x0AB1
	.short 0x0BEC, 0x0AAC
	.short 0x0BF0, 0x0AA7
	.short 0x0BF4, 0x0AA3
	.short 0x0BF8, 0x0A9E
	.short 0x0BFC, 0x0A99
	.short 0x0C01, 0x0A95
	.short 0x0C05, 0x0A90
	.short 0x0C09, 0x0A8B
	.short 0x0C0D, 0x0A86
	.short 0x0C11, 0x0A82
	.short 0x0C15, 0x0A7D
	.short 0x0C19, 0x0A78
	.short 0x0C1E, 0x0A73
	.short 0x0C22, 0x0A6F
	.short 0x0C26, 0x0A6A
	.short 0x0C2A, 0x0A65
	.short 0x0C2E, 0x0A60
	.short 0x0C32, 0x0A5C
	.short 0x0C36, 0x0A57
	.short 0x0C3A, 0x0A52
	.short 0x0C3E, 0x0A4D
	.short 0x0C42, 0x0A48
	.short 0x0C46, 0x0A44
	.short 0x0C4A, 0x0A3F
	.short 0x0C4E, 0x0A3A
	.short 0x0C52, 0x0A35
	.short 0x0C56, 0x0A30
	.short 0x0C5A, 0x0A2B
	.short 0x0C5E, 0x0A26
	.short 0x0C62, 0x0A22
	.short 0x0C66, 0x0A1D
	.short 0x0C6A, 0x0A18
	.short 0x0C6E, 0x0A13
	.short 0x0C72, 0x0A0E
	.short 0x0C76, 0x0A09
	.short 0x0C7A, 0x0A04
	.short 0x0C7E, 0x09FF
	.short 0x0C82, 0x09FB
	.short 0x0C86, 0x09F6
	.short 0x0C8A, 0x09F1
	.short 0x0C8E, 0x09EC
	.short 0x0C91, 0x09E7
	.short 0x0C95, 0x09E2
	.short 0x0C99, 0x09DD
	.short 0x0C9D, 0x09D8
	.short 0x0CA1, 0x09D3
	.short 0x0CA5, 0x09CE
	.short 0x0CA9, 0x09C9
	.short 0x0CAC, 0x09C4
	.short 0x0CB0, 0x09BF
	.short 0x0CB4, 0x09BA
	.short 0x0CB8, 0x09B5
	.short 0x0CBC, 0x09B0
	.short 0x0CC0, 0x09AB
	.short 0x0CC3, 0x09A6
	.short 0x0CC7, 0x09A1
	.short 0x0CCB, 0x099C
	.short 0x0CCF, 0x0997
	.short 0x0CD2, 0x0992
	.short 0x0CD6, 0x098D
	.short 0x0CDA, 0x0988
	.short 0x0CDE, 0x0983
	.short 0x0CE1, 0x097E
	.short 0x0CE5, 0x0979
	.short 0x0CE9, 0x0974
	.short 0x0CED, 0x096F
	.short 0x0CF0, 0x096A
	.short 0x0CF4, 0x0965
	.short 0x0CF8, 0x095F
	.short 0x0CFB, 0x095A
	.short 0x0CFF, 0x0955
	.short 0x0D03, 0x0950
	.short 0x0D06, 0x094B
	.short 0x0D0A, 0x0946
	.short 0x0D0E, 0x0941
	.short 0x0D11, 0x093C
	.short 0x0D15, 0x0937
	.short 0x0D18, 0x0931
	.short 0x0D1C, 0x092C
	.short 0x0D20, 0x0927
	.short 0x0D23, 0x0922
	.short 0x0D27, 0x091D
	.short 0x0D2A, 0x0918
	.short 0x0D2E, 0x0912
	.short 0x0D32, 0x090D
	.short 0x0D35, 0x0908
	.short 0x0D39, 0x0903
	.short 0x0D3C, 0x08FE
	.short 0x0D40, 0x08F8
	.short 0x0D43, 0x08F3
	.short 0x0D47, 0x08EE
	.short 0x0D4A, 0x08E9
	.short 0x0D4E, 0x08E4
	.short 0x0D51, 0x08DE
	.short 0x0D55, 0x08D9
	.short 0x0D58, 0x08D4
	.short 0x0D5C, 0x08CF
	.short 0x0D5F, 0x08C9
	.short 0x0D62, 0x08C4
	.short 0x0D66, 0x08BF
	.short 0x0D69, 0x08BA
	.short 0x0D6D, 0x08B4
	.short 0x0D70, 0x08AF
	.short 0x0D74, 0x08AA
	.short 0x0D77, 0x08A5
	.short 0x0D7A, 0x089F
	.short 0x0D7E, 0x089A
	.short 0x0D81, 0x0895
	.short 0x0D85, 0x088F
	.short 0x0D88, 0x088A
	.short 0x0D8B, 0x0885
	.short 0x0D8F, 0x087F
	.short 0x0D92, 0x087A
	.short 0x0D95, 0x0875
	.short 0x0D99, 0x086F
	.short 0x0D9C, 0x086A
	.short 0x0D9F, 0x0865
	.short 0x0DA2, 0x085F
	.short 0x0DA6, 0x085A
	.short 0x0DA9, 0x0855
	.short 0x0DAC, 0x084F
	.short 0x0DB0, 0x084A
	.short 0x0DB3, 0x0845
	.short 0x0DB6, 0x083F
	.short 0x0DB9, 0x083A
	.short 0x0DBC, 0x0834
	.short 0x0DC0, 0x082F
	.short 0x0DC3, 0x082A
	.short 0x0DC6, 0x0824
	.short 0x0DC9, 0x081F
	.short 0x0DCC, 0x0819
	.short 0x0DD0, 0x0814
	.short 0x0DD3, 0x080E
	.short 0x0DD6, 0x0809
	.short 0x0DD9, 0x0804
	.short 0x0DDC, 0x07FE
	.short 0x0DDF, 0x07F9
	.short 0x0DE3, 0x07F3
	.short 0x0DE6, 0x07EE
	.short 0x0DE9, 0x07E8
	.short 0x0DEC, 0x07E3
	.short 0x0DEF, 0x07DD
	.short 0x0DF2, 0x07D8
	.short 0x0DF5, 0x07D2
	.short 0x0DF8, 0x07CD
	.short 0x0DFB, 0x07C8
	.short 0x0DFE, 0x07C2
	.short 0x0E01, 0x07BD
	.short 0x0E04, 0x07B7
	.short 0x0E07, 0x07B2
	.short 0x0E0A, 0x07AC
	.short 0x0E0D, 0x07A6
	.short 0x0E10, 0x07A1
	.short 0x0E13, 0x079B
	.short 0x0E16, 0x0796
	.short 0x0E19, 0x0790
	.short 0x0E1C, 0x078B
	.short 0x0E1F, 0x0785
	.short 0x0E22, 0x0780
	.short 0x0E25, 0x077A
	.short 0x0E28, 0x0775
	.short 0x0E2B, 0x076F
	.short 0x0E2E, 0x076A
	.short 0x0E31, 0x0764
	.short 0x0E34, 0x075E
	.short 0x0E37, 0x0759
	.short 0x0E3A, 0x0753
	.short 0x0E3C, 0x074E
	.short 0x0E3F, 0x0748
	.short 0x0E42, 0x0742
	.short 0x0E45, 0x073D
	.short 0x0E48, 0x0737
	.short 0x0E4B, 0x0732
	.short 0x0E4D, 0x072C
	.short 0x0E50, 0x0726
	.short 0x0E53, 0x0721
	.short 0x0E56, 0x071B
	.short 0x0E59, 0x0715
	.short 0x0E5B, 0x0710
	.short 0x0E5E, 0x070A
	.short 0x0E61, 0x0705
	.short 0x0E64, 0x06FF
	.short 0x0E66, 0x06F9
	.short 0x0E69, 0x06F4
	.short 0x0E6C, 0x06EE
	.short 0x0E6F, 0x06E8
	.short 0x0E71, 0x06E3
	.short 0x0E74, 0x06DD
	.short 0x0E77, 0x06D7
	.short 0x0E79, 0x06D2
	.short 0x0E7C, 0x06CC
	.short 0x0E7F, 0x06C6
	.short 0x0E81, 0x06C1
	.short 0x0E84, 0x06BB
	.short 0x0E87, 0x06B5
	.short 0x0E89, 0x06AF
	.short 0x0E8C, 0x06AA
	.short 0x0E8F, 0x06A4
	.short 0x0E91, 0x069E
	.short 0x0E94, 0x0699
	.short 0x0E96, 0x0693
	.short 0x0E99, 0x068D
	.short 0x0E9B, 0x0687
	.short 0x0E9E, 0x0682
	.short 0x0EA1, 0x067C
	.short 0x0EA3, 0x0676
	.short 0x0EA6, 0x0670
	.short 0x0EA8, 0x066B
	.short 0x0EAB, 0x0665
	.short 0x0EAD, 0x065F
	.short 0x0EB0, 0x0659
	.short 0x0EB2, 0x0654
	.short 0x0EB5, 0x064E
	.short 0x0EB7, 0x0648
	.short 0x0EBA, 0x0642
	.short 0x0EBC, 0x063C
	.short 0x0EBF, 0x0637
	.short 0x0EC1, 0x0631
	.short 0x0EC3, 0x062B
	.short 0x0EC6, 0x0625
	.short 0x0EC8, 0x061F
	.short 0x0ECB, 0x061A
	.short 0x0ECD, 0x0614
	.short 0x0ECF, 0x060E
	.short 0x0ED2, 0x0608
	.short 0x0ED4, 0x0602
	.short 0x0ED6, 0x05FD
	.short 0x0ED9, 0x05F7
	.short 0x0EDB, 0x05F1
	.short 0x0EDD, 0x05EB
	.short 0x0EE0, 0x05E5
	.short 0x0EE2, 0x05DF
	.short 0x0EE4, 0x05DA
	.short 0x0EE7, 0x05D4
	.short 0x0EE9, 0x05CE
	.short 0x0EEB, 0x05C8
	.short 0x0EEE, 0x05C2
	.short 0x0EF0, 0x05BC
	.short 0x0EF2, 0x05B6
	.short 0x0EF4, 0x05B1
	.short 0x0EF7, 0x05AB
	.short 0x0EF9, 0x05A5
	.short 0x0EFB, 0x059F
	.short 0x0EFD, 0x0599
	.short 0x0EFF, 0x0593
	.short 0x0F02, 0x058D
	.short 0x0F04, 0x0587
	.short 0x0F06, 0x0581
	.short 0x0F08, 0x057C
	.short 0x0F0A, 0x0576
	.short 0x0F0C, 0x0570
	.short 0x0F0E, 0x056A
	.short 0x0F11, 0x0564
	.short 0x0F13, 0x055E
	.short 0x0F15, 0x0558
	.short 0x0F17, 0x0552
	.short 0x0F19, 0x054C
	.short 0x0F1B, 0x0546
	.short 0x0F1D, 0x0540
	.short 0x0F1F, 0x053A
	.short 0x0F21, 0x0534
	.short 0x0F23, 0x052F
	.short 0x0F25, 0x0529
	.short 0x0F27, 0x0523
	.short 0x0F29, 0x051D
	.short 0x0F2B, 0x0517
	.short 0x0F2D, 0x0511
	.short 0x0F2F, 0x050B
	.short 0x0F31, 0x0505
	.short 0x0F33, 0x04FF
	.short 0x0F35, 0x04F9
	.short 0x0F37, 0x04F3
	.short 0x0F39, 0x04ED
	.short 0x0F3B, 0x04E7
	.short 0x0F3D, 0x04E1
	.short 0x0F3F, 0x04DB
	.short 0x0F41, 0x04D5
	.short 0x0F43, 0x04CF
	.short 0x0F45, 0x04C9
	.short 0x0F46, 0x04C3
	.short 0x0F48, 0x04BD
	.short 0x0F4A, 0x04B7
	.short 0x0F4C, 0x04B1
	.short 0x0F4E, 0x04AB
	.short 0x0F50, 0x04A5
	.short 0x0F51, 0x049F
	.short 0x0F53, 0x0499
	.short 0x0F55, 0x0493
	.short 0x0F57, 0x048D
	.short 0x0F59, 0x0487
	.short 0x0F5A, 0x0481
	.short 0x0F5C, 0x047B
	.short 0x0F5E, 0x0475
	.short 0x0F60, 0x046F
	.short 0x0F61, 0x0469
	.short 0x0F63, 0x0463
	.short 0x0F65, 0x045D
	.short 0x0F67, 0x0457
	.short 0x0F68, 0x0451
	.short 0x0F6A, 0x044B
	.short 0x0F6C, 0x0444
	.short 0x0F6D, 0x043E
	.short 0x0F6F, 0x0438
	.short 0x0F71, 0x0432
	.short 0x0F72, 0x042C
	.short 0x0F74, 0x0426
	.short 0x0F76, 0x0420
	.short 0x0F77, 0x041A
	.short 0x0F79, 0x0414
	.short 0x0F7A, 0x040E
	.short 0x0F7C, 0x0408
	.short 0x0F7D, 0x0402
	.short 0x0F7F, 0x03FC
	.short 0x0F81, 0x03F6
	.short 0x0F82, 0x03EF
	.short 0x0F84, 0x03E9
	.short 0x0F85, 0x03E3
	.short 0x0F87, 0x03DD
	.short 0x0F88, 0x03D7
	.short 0x0F8A, 0x03D1
	.short 0x0F8B, 0x03CB
	.short 0x0F8D, 0x03C5
	.short 0x0F8E, 0x03BF
	.short 0x0F90, 0x03B9
	.short 0x0F91, 0x03B2
	.short 0x0F93, 0x03AC
	.short 0x0F94, 0x03A6
	.short 0x0F95, 0x03A0
	.short 0x0F97, 0x039A
	.short 0x0F98, 0x0394
	.short 0x0F9A, 0x038E
	.short 0x0F9B, 0x0388
	.short 0x0F9C, 0x0381
	.short 0x0F9E, 0x037B
	.short 0x0F9F, 0x0375
	.short 0x0FA1, 0x036F
	.short 0x0FA2, 0x0369
	.short 0x0FA3, 0x0363
	.short 0x0FA5, 0x035D
	.short 0x0FA6, 0x0356
	.short 0x0FA7, 0x0350
	.short 0x0FA8, 0x034A
	.short 0x0FAA, 0x0344
	.short 0x0FAB, 0x033E
	.short 0x0FAC, 0x0338
	.short 0x0FAE, 0x0332
	.short 0x0FAF, 0x032B
	.short 0x0FB0, 0x0325
	.short 0x0FB1, 0x031F
	.short 0x0FB3, 0x0319
	.short 0x0FB4, 0x0313
	.short 0x0FB5, 0x030D
	.short 0x0FB6, 0x0306
	.short 0x0FB7, 0x0300
	.short 0x0FB8, 0x02FA
	.short 0x0FBA, 0x02F4
	.short 0x0FBB, 0x02EE
	.short 0x0FBC, 0x02E8
	.short 0x0FBD, 0x02E1
	.short 0x0FBE, 0x02DB
	.short 0x0FBF, 0x02D5
	.short 0x0FC0, 0x02CF
	.short 0x0FC2, 0x02C9
	.short 0x0FC3, 0x02C2
	.short 0x0FC4, 0x02BC
	.short 0x0FC5, 0x02B6
	.short 0x0FC6, 0x02B0
	.short 0x0FC7, 0x02AA
	.short 0x0FC8, 0x02A3
	.short 0x0FC9, 0x029D
	.short 0x0FCA, 0x0297
	.short 0x0FCB, 0x0291
	.short 0x0FCC, 0x028B
	.short 0x0FCD, 0x0284
	.short 0x0FCE, 0x027E
	.short 0x0FCF, 0x0278
	.short 0x0FD0, 0x0272
	.short 0x0FD1, 0x026C
	.short 0x0FD2, 0x0265
	.short 0x0FD3, 0x025F
	.short 0x0FD4, 0x0259
	.short 0x0FD5, 0x0253
	.short 0x0FD5, 0x024D
	.short 0x0FD6, 0x0246
	.short 0x0FD7, 0x0240
	.short 0x0FD8, 0x023A
	.short 0x0FD9, 0x0234
	.short 0x0FDA, 0x022D
	.short 0x0FDB, 0x0227
	.short 0x0FDC, 0x0221
	.short 0x0FDC, 0x021B
	.short 0x0FDD, 0x0215
	.short 0x0FDE, 0x020E
	.short 0x0FDF, 0x0208
	.short 0x0FE0, 0x0202
	.short 0x0FE0, 0x01FC
	.short 0x0FE1, 0x01F5
	.short 0x0FE2, 0x01EF
	.short 0x0FE3, 0x01E9
	.short 0x0FE3, 0x01E3
	.short 0x0FE4, 0x01DC
	.short 0x0FE5, 0x01D6
	.short 0x0FE6, 0x01D0
	.short 0x0FE6, 0x01CA
	.short 0x0FE7, 0x01C3
	.short 0x0FE8, 0x01BD
	.short 0x0FE8, 0x01B7
	.short 0x0FE9, 0x01B1
	.short 0x0FEA, 0x01AA
	.short 0x0FEA, 0x01A4
	.short 0x0FEB, 0x019E
	.short 0x0FEC, 0x0198
	.short 0x0FEC, 0x0191
	.short 0x0FED, 0x018B
	.short 0x0FED, 0x0185
	.short 0x0FEE, 0x017F
	.short 0x0FEF, 0x0178
	.short 0x0FEF, 0x0172
	.short 0x0FF0, 0x016C
	.short 0x0FF0, 0x0166
	.short 0x0FF1, 0x015F
	.short 0x0FF1, 0x0159
	.short 0x0FF2, 0x0153
	.short 0x0FF2, 0x014D
	.short 0x0FF3, 0x0146
	.short 0x0FF3, 0x0140
	.short 0x0FF4, 0x013A
	.short 0x0FF4, 0x0134
	.short 0x0FF5, 0x012D
	.short 0x0FF5, 0x0127
	.short 0x0FF6, 0x0121
	.short 0x0FF6, 0x011B
	.short 0x0FF7, 0x0114
	.short 0x0FF7, 0x010E
	.short 0x0FF8, 0x0108
	.short 0x0FF8, 0x0101
	.short 0x0FF8, 0x00FB
	.short 0x0FF9, 0x00F5
	.short 0x0FF9, 0x00EF
	.short 0x0FF9, 0x00E8
	.short 0x0FFA, 0x00E2
	.short 0x0FFA, 0x00DC
	.short 0x0FFA, 0x00D6
	.short 0x0FFB, 0x00CF
	.short 0x0FFB, 0x00C9
	.short 0x0FFB, 0x00C3
	.short 0x0FFC, 0x00BC
	.short 0x0FFC, 0x00B6
	.short 0x0FFC, 0x00B0
	.short 0x0FFC, 0x00AA
	.short 0x0FFD, 0x00A3
	.short 0x0FFD, 0x009D
	.short 0x0FFD, 0x0097
	.short 0x0FFD, 0x0090
	.short 0x0FFE, 0x008A
	.short 0x0FFE, 0x0084
	.short 0x0FFE, 0x007E
	.short 0x0FFE, 0x0077
	.short 0x0FFE, 0x0071
	.short 0x0FFF, 0x006B
	.short 0x0FFF, 0x0065
	.short 0x0FFF, 0x005E
	.short 0x0FFF, 0x0058
	.short 0x0FFF, 0x0052
	.short 0x0FFF, 0x004B
	.short 0x0FFF, 0x0045
	.short 0x1000, 0x003F
	.short 0x1000, 0x0039
	.short 0x1000, 0x0032
	.short 0x1000, 0x002C
	.short 0x1000, 0x0026
	.short 0x1000, 0x001F
	.short 0x1000, 0x0019
	.short 0x1000, 0x0013
	.short 0x1000, 0x000D
	.short 0x1000, 0x0006
	.short 0x1000, 0x0000
	.short 0x1000, 0xFFFA
	.short 0x1000, 0xFFF3
	.short 0x1000, 0xFFED
	.short 0x1000, 0xFFE7
	.short 0x1000, 0xFFE1
	.short 0x1000, 0xFFDA
	.short 0x1000, 0xFFD4
	.short 0x1000, 0xFFCE
	.short 0x1000, 0xFFC7
	.short 0x1000, 0xFFC1
	.short 0x0FFF, 0xFFBB
	.short 0x0FFF, 0xFFB5
	.short 0x0FFF, 0xFFAE
	.short 0x0FFF, 0xFFA8
	.short 0x0FFF, 0xFFA2
	.short 0x0FFF, 0xFF9B
	.short 0x0FFF, 0xFF95
	.short 0x0FFE, 0xFF8F
	.short 0x0FFE, 0xFF89
	.short 0x0FFE, 0xFF82
	.short 0x0FFE, 0xFF7C
	.short 0x0FFE, 0xFF76
	.short 0x0FFD, 0xFF70
	.short 0x0FFD, 0xFF69
	.short 0x0FFD, 0xFF63
	.short 0x0FFD, 0xFF5D
	.short 0x0FFC, 0xFF56
	.short 0x0FFC, 0xFF50
	.short 0x0FFC, 0xFF4A
	.short 0x0FFC, 0xFF44
	.short 0x0FFB, 0xFF3D
	.short 0x0FFB, 0xFF37
	.short 0x0FFB, 0xFF31
	.short 0x0FFA, 0xFF2A
	.short 0x0FFA, 0xFF24
	.short 0x0FFA, 0xFF1E
	.short 0x0FF9, 0xFF18
	.short 0x0FF9, 0xFF11
	.short 0x0FF9, 0xFF0B
	.short 0x0FF8, 0xFF05
	.short 0x0FF8, 0xFEFF
	.short 0x0FF8, 0xFEF8
	.short 0x0FF7, 0xFEF2
	.short 0x0FF7, 0xFEEC
	.short 0x0FF6, 0xFEE5
	.short 0x0FF6, 0xFEDF
	.short 0x0FF5, 0xFED9
	.short 0x0FF5, 0xFED3
	.short 0x0FF4, 0xFECC
	.short 0x0FF4, 0xFEC6
	.short 0x0FF3, 0xFEC0
	.short 0x0FF3, 0xFEBA
	.short 0x0FF2, 0xFEB3
	.short 0x0FF2, 0xFEAD
	.short 0x0FF1, 0xFEA7
	.short 0x0FF1, 0xFEA1
	.short 0x0FF0, 0xFE9A
	.short 0x0FF0, 0xFE94
	.short 0x0FEF, 0xFE8E
	.short 0x0FEF, 0xFE88
	.short 0x0FEE, 0xFE81
	.short 0x0FED, 0xFE7B
	.short 0x0FED, 0xFE75
	.short 0x0FEC, 0xFE6F
	.short 0x0FEC, 0xFE68
	.short 0x0FEB, 0xFE62
	.short 0x0FEA, 0xFE5C
	.short 0x0FEA, 0xFE56
	.short 0x0FE9, 0xFE4F
	.short 0x0FE8, 0xFE49
	.short 0x0FE8, 0xFE43
	.short 0x0FE7, 0xFE3D
	.short 0x0FE6, 0xFE36
	.short 0x0FE6, 0xFE30
	.short 0x0FE5, 0xFE2A
	.short 0x0FE4, 0xFE24
	.short 0x0FE3, 0xFE1D
	.short 0x0FE3, 0xFE17
	.short 0x0FE2, 0xFE11
	.short 0x0FE1, 0xFE0B
	.short 0x0FE0, 0xFE04
	.short 0x0FE0, 0xFDFE
	.short 0x0FDF, 0xFDF8
	.short 0x0FDE, 0xFDF2
	.short 0x0FDD, 0xFDEB
	.short 0x0FDC, 0xFDE5
	.short 0x0FDC, 0xFDDF
	.short 0x0FDB, 0xFDD9
	.short 0x0FDA, 0xFDD3
	.short 0x0FD9, 0xFDCC
	.short 0x0FD8, 0xFDC6
	.short 0x0FD7, 0xFDC0
	.short 0x0FD6, 0xFDBA
	.short 0x0FD5, 0xFDB3
	.short 0x0FD5, 0xFDAD
	.short 0x0FD4, 0xFDA7
	.short 0x0FD3, 0xFDA1
	.short 0x0FD2, 0xFD9B
	.short 0x0FD1, 0xFD94
	.short 0x0FD0, 0xFD8E
	.short 0x0FCF, 0xFD88
	.short 0x0FCE, 0xFD82
	.short 0x0FCD, 0xFD7C
	.short 0x0FCC, 0xFD75
	.short 0x0FCB, 0xFD6F
	.short 0x0FCA, 0xFD69
	.short 0x0FC9, 0xFD63
	.short 0x0FC8, 0xFD5D
	.short 0x0FC7, 0xFD56
	.short 0x0FC6, 0xFD50
	.short 0x0FC5, 0xFD4A
	.short 0x0FC4, 0xFD44
	.short 0x0FC3, 0xFD3E
	.short 0x0FC2, 0xFD37
	.short 0x0FC0, 0xFD31
	.short 0x0FBF, 0xFD2B
	.short 0x0FBE, 0xFD25
	.short 0x0FBD, 0xFD1F
	.short 0x0FBC, 0xFD18
	.short 0x0FBB, 0xFD12
	.short 0x0FBA, 0xFD0C
	.short 0x0FB8, 0xFD06
	.short 0x0FB7, 0xFD00
	.short 0x0FB6, 0xFCFA
	.short 0x0FB5, 0xFCF3
	.short 0x0FB4, 0xFCED
	.short 0x0FB3, 0xFCE7
	.short 0x0FB1, 0xFCE1
	.short 0x0FB0, 0xFCDB
	.short 0x0FAF, 0xFCD5
	.short 0x0FAE, 0xFCCE
	.short 0x0FAC, 0xFCC8
	.short 0x0FAB, 0xFCC2
	.short 0x0FAA, 0xFCBC
	.short 0x0FA8, 0xFCB6
	.short 0x0FA7, 0xFCB0
	.short 0x0FA6, 0xFCAA
	.short 0x0FA5, 0xFCA3
	.short 0x0FA3, 0xFC9D
	.short 0x0FA2, 0xFC97
	.short 0x0FA1, 0xFC91
	.short 0x0F9F, 0xFC8B
	.short 0x0F9E, 0xFC85
	.short 0x0F9C, 0xFC7F
	.short 0x0F9B, 0xFC78
	.short 0x0F9A, 0xFC72
	.short 0x0F98, 0xFC6C
	.short 0x0F97, 0xFC66
	.short 0x0F95, 0xFC60
	.short 0x0F94, 0xFC5A
	.short 0x0F93, 0xFC54
	.short 0x0F91, 0xFC4E
	.short 0x0F90, 0xFC47
	.short 0x0F8E, 0xFC41
	.short 0x0F8D, 0xFC3B
	.short 0x0F8B, 0xFC35
	.short 0x0F8A, 0xFC2F
	.short 0x0F88, 0xFC29
	.short 0x0F87, 0xFC23
	.short 0x0F85, 0xFC1D
	.short 0x0F84, 0xFC17
	.short 0x0F82, 0xFC11
	.short 0x0F81, 0xFC0A
	.short 0x0F7F, 0xFC04
	.short 0x0F7D, 0xFBFE
	.short 0x0F7C, 0xFBF8
	.short 0x0F7A, 0xFBF2
	.short 0x0F79, 0xFBEC
	.short 0x0F77, 0xFBE6
	.short 0x0F76, 0xFBE0
	.short 0x0F74, 0xFBDA
	.short 0x0F72, 0xFBD4
	.short 0x0F71, 0xFBCE
	.short 0x0F6F, 0xFBC8
	.short 0x0F6D, 0xFBC2
	.short 0x0F6C, 0xFBBC
	.short 0x0F6A, 0xFBB5
	.short 0x0F68, 0xFBAF
	.short 0x0F67, 0xFBA9
	.short 0x0F65, 0xFBA3
	.short 0x0F63, 0xFB9D
	.short 0x0F61, 0xFB97
	.short 0x0F60, 0xFB91
	.short 0x0F5E, 0xFB8B
	.short 0x0F5C, 0xFB85
	.short 0x0F5A, 0xFB7F
	.short 0x0F59, 0xFB79
	.short 0x0F57, 0xFB73
	.short 0x0F55, 0xFB6D
	.short 0x0F53, 0xFB67
	.short 0x0F51, 0xFB61
	.short 0x0F50, 0xFB5B
	.short 0x0F4E, 0xFB55
	.short 0x0F4C, 0xFB4F
	.short 0x0F4A, 0xFB49
	.short 0x0F48, 0xFB43
	.short 0x0F46, 0xFB3D
	.short 0x0F45, 0xFB37
	.short 0x0F43, 0xFB31
	.short 0x0F41, 0xFB2B
	.short 0x0F3F, 0xFB25
	.short 0x0F3D, 0xFB1F
	.short 0x0F3B, 0xFB19
	.short 0x0F39, 0xFB13
	.short 0x0F37, 0xFB0D
	.short 0x0F35, 0xFB07
	.short 0x0F33, 0xFB01
	.short 0x0F31, 0xFAFB
	.short 0x0F2F, 0xFAF5
	.short 0x0F2D, 0xFAEF
	.short 0x0F2B, 0xFAE9
	.short 0x0F29, 0xFAE3
	.short 0x0F27, 0xFADD
	.short 0x0F25, 0xFAD7
	.short 0x0F23, 0xFAD1
	.short 0x0F21, 0xFACC
	.short 0x0F1F, 0xFAC6
	.short 0x0F1D, 0xFAC0
	.short 0x0F1B, 0xFABA
	.short 0x0F19, 0xFAB4
	.short 0x0F17, 0xFAAE
	.short 0x0F15, 0xFAA8
	.short 0x0F13, 0xFAA2
	.short 0x0F11, 0xFA9C
	.short 0x0F0E, 0xFA96
	.short 0x0F0C, 0xFA90
	.short 0x0F0A, 0xFA8A
	.short 0x0F08, 0xFA84
	.short 0x0F06, 0xFA7F
	.short 0x0F04, 0xFA79
	.short 0x0F02, 0xFA73
	.short 0x0EFF, 0xFA6D
	.short 0x0EFD, 0xFA67
	.short 0x0EFB, 0xFA61
	.short 0x0EF9, 0xFA5B
	.short 0x0EF7, 0xFA55
	.short 0x0EF4, 0xFA4F
	.short 0x0EF2, 0xFA4A
	.short 0x0EF0, 0xFA44
	.short 0x0EEE, 0xFA3E
	.short 0x0EEB, 0xFA38
	.short 0x0EE9, 0xFA32
	.short 0x0EE7, 0xFA2C
	.short 0x0EE4, 0xFA26
	.short 0x0EE2, 0xFA21
	.short 0x0EE0, 0xFA1B
	.short 0x0EDD, 0xFA15
	.short 0x0EDB, 0xFA0F
	.short 0x0ED9, 0xFA09
	.short 0x0ED6, 0xFA03
	.short 0x0ED4, 0xF9FE
	.short 0x0ED2, 0xF9F8
	.short 0x0ECF, 0xF9F2
	.short 0x0ECD, 0xF9EC
	.short 0x0ECB, 0xF9E6
	.short 0x0EC8, 0xF9E1
	.short 0x0EC6, 0xF9DB
	.short 0x0EC3, 0xF9D5
	.short 0x0EC1, 0xF9CF
	.short 0x0EBF, 0xF9C9
	.short 0x0EBC, 0xF9C4
	.short 0x0EBA, 0xF9BE
	.short 0x0EB7, 0xF9B8
	.short 0x0EB5, 0xF9B2
	.short 0x0EB2, 0xF9AC
	.short 0x0EB0, 0xF9A7
	.short 0x0EAD, 0xF9A1
	.short 0x0EAB, 0xF99B
	.short 0x0EA8, 0xF995
	.short 0x0EA6, 0xF990
	.short 0x0EA3, 0xF98A
	.short 0x0EA1, 0xF984
	.short 0x0E9E, 0xF97E
	.short 0x0E9B, 0xF979
	.short 0x0E99, 0xF973
	.short 0x0E96, 0xF96D
	.short 0x0E94, 0xF967
	.short 0x0E91, 0xF962
	.short 0x0E8F, 0xF95C
	.short 0x0E8C, 0xF956
	.short 0x0E89, 0xF951
	.short 0x0E87, 0xF94B
	.short 0x0E84, 0xF945
	.short 0x0E81, 0xF93F
	.short 0x0E7F, 0xF93A
	.short 0x0E7C, 0xF934
	.short 0x0E79, 0xF92E
	.short 0x0E77, 0xF929
	.short 0x0E74, 0xF923
	.short 0x0E71, 0xF91D
	.short 0x0E6F, 0xF918
	.short 0x0E6C, 0xF912
	.short 0x0E69, 0xF90C
	.short 0x0E66, 0xF907
	.short 0x0E64, 0xF901
	.short 0x0E61, 0xF8FB
	.short 0x0E5E, 0xF8F6
	.short 0x0E5B, 0xF8F0
	.short 0x0E59, 0xF8EB
	.short 0x0E56, 0xF8E5
	.short 0x0E53, 0xF8DF
	.short 0x0E50, 0xF8DA
	.short 0x0E4D, 0xF8D4
	.short 0x0E4B, 0xF8CE
	.short 0x0E48, 0xF8C9
	.short 0x0E45, 0xF8C3
	.short 0x0E42, 0xF8BE
	.short 0x0E3F, 0xF8B8
	.short 0x0E3C, 0xF8B2
	.short 0x0E3A, 0xF8AD
	.short 0x0E37, 0xF8A7
	.short 0x0E34, 0xF8A2
	.short 0x0E31, 0xF89C
	.short 0x0E2E, 0xF896
	.short 0x0E2B, 0xF891
	.short 0x0E28, 0xF88B
	.short 0x0E25, 0xF886
	.short 0x0E22, 0xF880
	.short 0x0E1F, 0xF87B
	.short 0x0E1C, 0xF875
	.short 0x0E19, 0xF870
	.short 0x0E16, 0xF86A
	.short 0x0E13, 0xF865
	.short 0x0E10, 0xF85F
	.short 0x0E0D, 0xF85A
	.short 0x0E0A, 0xF854
	.short 0x0E07, 0xF84E
	.short 0x0E04, 0xF849
	.short 0x0E01, 0xF843
	.short 0x0DFE, 0xF83E
	.short 0x0DFB, 0xF838
	.short 0x0DF8, 0xF833
	.short 0x0DF5, 0xF82E
	.short 0x0DF2, 0xF828
	.short 0x0DEF, 0xF823
	.short 0x0DEC, 0xF81D
	.short 0x0DE9, 0xF818
	.short 0x0DE6, 0xF812
	.short 0x0DE3, 0xF80D
	.short 0x0DDF, 0xF807
	.short 0x0DDC, 0xF802
	.short 0x0DD9, 0xF7FC
	.short 0x0DD6, 0xF7F7
	.short 0x0DD3, 0xF7F2
	.short 0x0DD0, 0xF7EC
	.short 0x0DCC, 0xF7E7
	.short 0x0DC9, 0xF7E1
	.short 0x0DC6, 0xF7DC
	.short 0x0DC3, 0xF7D6
	.short 0x0DC0, 0xF7D1
	.short 0x0DBC, 0xF7CC
	.short 0x0DB9, 0xF7C6
	.short 0x0DB6, 0xF7C1
	.short 0x0DB3, 0xF7BB
	.short 0x0DB0, 0xF7B6
	.short 0x0DAC, 0xF7B1
	.short 0x0DA9, 0xF7AB
	.short 0x0DA6, 0xF7A6
	.short 0x0DA2, 0xF7A1
	.short 0x0D9F, 0xF79B
	.short 0x0D9C, 0xF796
	.short 0x0D99, 0xF791
	.short 0x0D95, 0xF78B
	.short 0x0D92, 0xF786
	.short 0x0D8F, 0xF781
	.short 0x0D8B, 0xF77B
	.short 0x0D88, 0xF776
	.short 0x0D85, 0xF771
	.short 0x0D81, 0xF76B
	.short 0x0D7E, 0xF766
	.short 0x0D7A, 0xF761
	.short 0x0D77, 0xF75B
	.short 0x0D74, 0xF756
	.short 0x0D70, 0xF751
	.short 0x0D6D, 0xF74C
	.short 0x0D69, 0xF746
	.short 0x0D66, 0xF741
	.short 0x0D62, 0xF73C
	.short 0x0D5F, 0xF737
	.short 0x0D5C, 0xF731
	.short 0x0D58, 0xF72C
	.short 0x0D55, 0xF727
	.short 0x0D51, 0xF722
	.short 0x0D4E, 0xF71C
	.short 0x0D4A, 0xF717
	.short 0x0D47, 0xF712
	.short 0x0D43, 0xF70D
	.short 0x0D40, 0xF708
	.short 0x0D3C, 0xF702
	.short 0x0D39, 0xF6FD
	.short 0x0D35, 0xF6F8
	.short 0x0D32, 0xF6F3
	.short 0x0D2E, 0xF6EE
	.short 0x0D2A, 0xF6E8
	.short 0x0D27, 0xF6E3
	.short 0x0D23, 0xF6DE
	.short 0x0D20, 0xF6D9
	.short 0x0D1C, 0xF6D4
	.short 0x0D18, 0xF6CF
	.short 0x0D15, 0xF6C9
	.short 0x0D11, 0xF6C4
	.short 0x0D0E, 0xF6BF
	.short 0x0D0A, 0xF6BA
	.short 0x0D06, 0xF6B5
	.short 0x0D03, 0xF6B0
	.short 0x0CFF, 0xF6AB
	.short 0x0CFB, 0xF6A6
	.short 0x0CF8, 0xF6A1
	.short 0x0CF4, 0xF69B
	.short 0x0CF0, 0xF696
	.short 0x0CED, 0xF691
	.short 0x0CE9, 0xF68C
	.short 0x0CE5, 0xF687
	.short 0x0CE1, 0xF682
	.short 0x0CDE, 0xF67D
	.short 0x0CDA, 0xF678
	.short 0x0CD6, 0xF673
	.short 0x0CD2, 0xF66E
	.short 0x0CCF, 0xF669
	.short 0x0CCB, 0xF664
	.short 0x0CC7, 0xF65F
	.short 0x0CC3, 0xF65A
	.short 0x0CC0, 0xF655
	.short 0x0CBC, 0xF650
	.short 0x0CB8, 0xF64B
	.short 0x0CB4, 0xF646
	.short 0x0CB0, 0xF641
	.short 0x0CAC, 0xF63C
	.short 0x0CA9, 0xF637
	.short 0x0CA5, 0xF632
	.short 0x0CA1, 0xF62D
	.short 0x0C9D, 0xF628
	.short 0x0C99, 0xF623
	.short 0x0C95, 0xF61E
	.short 0x0C91, 0xF619
	.short 0x0C8E, 0xF614
	.short 0x0C8A, 0xF60F
	.short 0x0C86, 0xF60A
	.short 0x0C82, 0xF605
	.short 0x0C7E, 0xF601
	.short 0x0C7A, 0xF5FC
	.short 0x0C76, 0xF5F7
	.short 0x0C72, 0xF5F2
	.short 0x0C6E, 0xF5ED
	.short 0x0C6A, 0xF5E8
	.short 0x0C66, 0xF5E3
	.short 0x0C62, 0xF5DE
	.short 0x0C5E, 0xF5DA
	.short 0x0C5A, 0xF5D5
	.short 0x0C56, 0xF5D0
	.short 0x0C52, 0xF5CB
	.short 0x0C4E, 0xF5C6
	.short 0x0C4A, 0xF5C1
	.short 0x0C46, 0xF5BC
	.short 0x0C42, 0xF5B8
	.short 0x0C3E, 0xF5B3
	.short 0x0C3A, 0xF5AE
	.short 0x0C36, 0xF5A9
	.short 0x0C32, 0xF5A4
	.short 0x0C2E, 0xF5A0
	.short 0x0C2A, 0xF59B
	.short 0x0C26, 0xF596
	.short 0x0C22, 0xF591
	.short 0x0C1E, 0xF58D
	.short 0x0C19, 0xF588
	.short 0x0C15, 0xF583
	.short 0x0C11, 0xF57E
	.short 0x0C0D, 0xF57A
	.short 0x0C09, 0xF575
	.short 0x0C05, 0xF570
	.short 0x0C01, 0xF56B
	.short 0x0BFC, 0xF567
	.short 0x0BF8, 0xF562
	.short 0x0BF4, 0xF55D
	.short 0x0BF0, 0xF559
	.short 0x0BEC, 0xF554
	.short 0x0BE8, 0xF54F
	.short 0x0BE3, 0xF54B
	.short 0x0BDF, 0xF546
	.short 0x0BDB, 0xF541
	.short 0x0BD7, 0xF53D
	.short 0x0BD2, 0xF538
	.short 0x0BCE, 0xF533
	.short 0x0BCA, 0xF52F
	.short 0x0BC6, 0xF52A
	.short 0x0BC1, 0xF525
	.short 0x0BBD, 0xF521
	.short 0x0BB9, 0xF51C
	.short 0x0BB5, 0xF518
	.short 0x0BB0, 0xF513
	.short 0x0BAC, 0xF50E
	.short 0x0BA8, 0xF50A
	.short 0x0BA3, 0xF505
	.short 0x0B9F, 0xF501
	.short 0x0B9B, 0xF4FC
	.short 0x0B97, 0xF4F8
	.short 0x0B92, 0xF4F3
	.short 0x0B8E, 0xF4EF
	.short 0x0B89, 0xF4EA
	.short 0x0B85, 0xF4E5
	.short 0x0B81, 0xF4E1
	.short 0x0B7C, 0xF4DC
	.short 0x0B78, 0xF4D8
	.short 0x0B74, 0xF4D3
	.short 0x0B6F, 0xF4CF
	.short 0x0B6B, 0xF4CA
	.short 0x0B66, 0xF4C6
	.short 0x0B62, 0xF4C2
	.short 0x0B5E, 0xF4BD
	.short 0x0B59, 0xF4B9
	.short 0x0B55, 0xF4B4
	.short 0x0B50, 0xF4B0
	.short 0x0B4C, 0xF4AB
	.short 0x0B47, 0xF4A7
	.short 0x0B43, 0xF4A2
	.short 0x0B3E, 0xF49E
	.short 0x0B3A, 0xF49A
	.short 0x0B36, 0xF495
	.short 0x0B31, 0xF491
	.short 0x0B2D, 0xF48C
	.short 0x0B28, 0xF488
	.short 0x0B24, 0xF484
	.short 0x0B1F, 0xF47F
	.short 0x0B1B, 0xF47B
	.short 0x0B16, 0xF477
	.short 0x0B11, 0xF472
	.short 0x0B0D, 0xF46E
	.short 0x0B08, 0xF469
	.short 0x0B04, 0xF465
	.short 0x0AFF, 0xF461
	.short 0x0AFB, 0xF45D
	.short 0x0AF6, 0xF458
	.short 0x0AF2, 0xF454
	.short 0x0AED, 0xF450
	.short 0x0AE8, 0xF44B
	.short 0x0AE4, 0xF447
	.short 0x0ADF, 0xF443
	.short 0x0ADB, 0xF43F
	.short 0x0AD6, 0xF43A
	.short 0x0AD1, 0xF436
	.short 0x0ACD, 0xF432
	.short 0x0AC8, 0xF42E
	.short 0x0AC3, 0xF429
	.short 0x0ABF, 0xF425
	.short 0x0ABA, 0xF421
	.short 0x0AB5, 0xF41D
	.short 0x0AB1, 0xF418
	.short 0x0AAC, 0xF414
	.short 0x0AA7, 0xF410
	.short 0x0AA3, 0xF40C
	.short 0x0A9E, 0xF408
	.short 0x0A99, 0xF404
	.short 0x0A95, 0xF3FF
	.short 0x0A90, 0xF3FB
	.short 0x0A8B, 0xF3F7
	.short 0x0A86, 0xF3F3
	.short 0x0A82, 0xF3EF
	.short 0x0A7D, 0xF3EB
	.short 0x0A78, 0xF3E7
	.short 0x0A73, 0xF3E2
	.short 0x0A6F, 0xF3DE
	.short 0x0A6A, 0xF3DA
	.short 0x0A65, 0xF3D6
	.short 0x0A60, 0xF3D2
	.short 0x0A5C, 0xF3CE
	.short 0x0A57, 0xF3CA
	.short 0x0A52, 0xF3C6
	.short 0x0A4D, 0xF3C2
	.short 0x0A48, 0xF3BE
	.short 0x0A44, 0xF3BA
	.short 0x0A3F, 0xF3B6
	.short 0x0A3A, 0xF3B2
	.short 0x0A35, 0xF3AE
	.short 0x0A30, 0xF3AA
	.short 0x0A2B, 0xF3A6
	.short 0x0A26, 0xF3A2
	.short 0x0A22, 0xF39E
	.short 0x0A1D, 0xF39A
	.short 0x0A18, 0xF396
	.short 0x0A13, 0xF392
	.short 0x0A0E, 0xF38E
	.short 0x0A09, 0xF38A
	.short 0x0A04, 0xF386
	.short 0x09FF, 0xF382
	.short 0x09FB, 0xF37E
	.short 0x09F6, 0xF37A
	.short 0x09F1, 0xF376
	.short 0x09EC, 0xF372
	.short 0x09E7, 0xF36F
	.short 0x09E2, 0xF36B
	.short 0x09DD, 0xF367
	.short 0x09D8, 0xF363
	.short 0x09D3, 0xF35F
	.short 0x09CE, 0xF35B
	.short 0x09C9, 0xF357
	.short 0x09C4, 0xF354
	.short 0x09BF, 0xF350
	.short 0x09BA, 0xF34C
	.short 0x09B5, 0xF348
	.short 0x09B0, 0xF344
	.short 0x09AB, 0xF340
	.short 0x09A6, 0xF33D
	.short 0x09A1, 0xF339
	.short 0x099C, 0xF335
	.short 0x0997, 0xF331
	.short 0x0992, 0xF32E
	.short 0x098D, 0xF32A
	.short 0x0988, 0xF326
	.short 0x0983, 0xF322
	.short 0x097E, 0xF31F
	.short 0x0979, 0xF31B
	.short 0x0974, 0xF317
	.short 0x096F, 0xF313
	.short 0x096A, 0xF310
	.short 0x0965, 0xF30C
	.short 0x095F, 0xF308
	.short 0x095A, 0xF305
	.short 0x0955, 0xF301
	.short 0x0950, 0xF2FD
	.short 0x094B, 0xF2FA
	.short 0x0946, 0xF2F6
	.short 0x0941, 0xF2F2
	.short 0x093C, 0xF2EF
	.short 0x0937, 0xF2EB
	.short 0x0931, 0xF2E8
	.short 0x092C, 0xF2E4
	.short 0x0927, 0xF2E0
	.short 0x0922, 0xF2DD
	.short 0x091D, 0xF2D9
	.short 0x0918, 0xF2D6
	.short 0x0912, 0xF2D2
	.short 0x090D, 0xF2CE
	.short 0x0908, 0xF2CB
	.short 0x0903, 0xF2C7
	.short 0x08FE, 0xF2C4
	.short 0x08F8, 0xF2C0
	.short 0x08F3, 0xF2BD
	.short 0x08EE, 0xF2B9
	.short 0x08E9, 0xF2B6
	.short 0x08E4, 0xF2B2
	.short 0x08DE, 0xF2AF
	.short 0x08D9, 0xF2AB
	.short 0x08D4, 0xF2A8
	.short 0x08CF, 0xF2A4
	.short 0x08C9, 0xF2A1
	.short 0x08C4, 0xF29E
	.short 0x08BF, 0xF29A
	.short 0x08BA, 0xF297
	.short 0x08B4, 0xF293
	.short 0x08AF, 0xF290
	.short 0x08AA, 0xF28C
	.short 0x08A5, 0xF289
	.short 0x089F, 0xF286
	.short 0x089A, 0xF282
	.short 0x0895, 0xF27F
	.short 0x088F, 0xF27B
	.short 0x088A, 0xF278
	.short 0x0885, 0xF275
	.short 0x087F, 0xF271
	.short 0x087A, 0xF26E
	.short 0x0875, 0xF26B
	.short 0x086F, 0xF267
	.short 0x086A, 0xF264
	.short 0x0865, 0xF261
	.short 0x085F, 0xF25E
	.short 0x085A, 0xF25A
	.short 0x0855, 0xF257
	.short 0x084F, 0xF254
	.short 0x084A, 0xF250
	.short 0x0845, 0xF24D
	.short 0x083F, 0xF24A
	.short 0x083A, 0xF247
	.short 0x0834, 0xF244
	.short 0x082F, 0xF240
	.short 0x082A, 0xF23D
	.short 0x0824, 0xF23A
	.short 0x081F, 0xF237
	.short 0x0819, 0xF234
	.short 0x0814, 0xF230
	.short 0x080E, 0xF22D
	.short 0x0809, 0xF22A
	.short 0x0804, 0xF227
	.short 0x07FE, 0xF224
	.short 0x07F9, 0xF221
	.short 0x07F3, 0xF21D
	.short 0x07EE, 0xF21A
	.short 0x07E8, 0xF217
	.short 0x07E3, 0xF214
	.short 0x07DD, 0xF211
	.short 0x07D8, 0xF20E
	.short 0x07D2, 0xF20B
	.short 0x07CD, 0xF208
	.short 0x07C8, 0xF205
	.short 0x07C2, 0xF202
	.short 0x07BD, 0xF1FF
	.short 0x07B7, 0xF1FC
	.short 0x07B2, 0xF1F9
	.short 0x07AC, 0xF1F6
	.short 0x07A6, 0xF1F3
	.short 0x07A1, 0xF1F0
	.short 0x079B, 0xF1ED
	.short 0x0796, 0xF1EA
	.short 0x0790, 0xF1E7
	.short 0x078B, 0xF1E4
	.short 0x0785, 0xF1E1
	.short 0x0780, 0xF1DE
	.short 0x077A, 0xF1DB
	.short 0x0775, 0xF1D8
	.short 0x076F, 0xF1D5
	.short 0x076A, 0xF1D2
	.short 0x0764, 0xF1CF
	.short 0x075E, 0xF1CC
	.short 0x0759, 0xF1C9
	.short 0x0753, 0xF1C6
	.short 0x074E, 0xF1C4
	.short 0x0748, 0xF1C1
	.short 0x0742, 0xF1BE
	.short 0x073D, 0xF1BB
	.short 0x0737, 0xF1B8
	.short 0x0732, 0xF1B5
	.short 0x072C, 0xF1B3
	.short 0x0726, 0xF1B0
	.short 0x0721, 0xF1AD
	.short 0x071B, 0xF1AA
	.short 0x0715, 0xF1A7
	.short 0x0710, 0xF1A5
	.short 0x070A, 0xF1A2
	.short 0x0705, 0xF19F
	.short 0x06FF, 0xF19C
	.short 0x06F9, 0xF19A
	.short 0x06F4, 0xF197
	.short 0x06EE, 0xF194
	.short 0x06E8, 0xF191
	.short 0x06E3, 0xF18F
	.short 0x06DD, 0xF18C
	.short 0x06D7, 0xF189
	.short 0x06D2, 0xF187
	.short 0x06CC, 0xF184
	.short 0x06C6, 0xF181
	.short 0x06C1, 0xF17F
	.short 0x06BB, 0xF17C
	.short 0x06B5, 0xF179
	.short 0x06AF, 0xF177
	.short 0x06AA, 0xF174
	.short 0x06A4, 0xF171
	.short 0x069E, 0xF16F
	.short 0x0699, 0xF16C
	.short 0x0693, 0xF16A
	.short 0x068D, 0xF167
	.short 0x0687, 0xF165
	.short 0x0682, 0xF162
	.short 0x067C, 0xF15F
	.short 0x0676, 0xF15D
	.short 0x0670, 0xF15A
	.short 0x066B, 0xF158
	.short 0x0665, 0xF155
	.short 0x065F, 0xF153
	.short 0x0659, 0xF150
	.short 0x0654, 0xF14E
	.short 0x064E, 0xF14B
	.short 0x0648, 0xF149
	.short 0x0642, 0xF146
	.short 0x063C, 0xF144
	.short 0x0637, 0xF141
	.short 0x0631, 0xF13F
	.short 0x062B, 0xF13D
	.short 0x0625, 0xF13A
	.short 0x061F, 0xF138
	.short 0x061A, 0xF135
	.short 0x0614, 0xF133
	.short 0x060E, 0xF131
	.short 0x0608, 0xF12E
	.short 0x0602, 0xF12C
	.short 0x05FD, 0xF12A
	.short 0x05F7, 0xF127
	.short 0x05F1, 0xF125
	.short 0x05EB, 0xF123
	.short 0x05E5, 0xF120
	.short 0x05DF, 0xF11E
	.short 0x05DA, 0xF11C
	.short 0x05D4, 0xF119
	.short 0x05CE, 0xF117
	.short 0x05C8, 0xF115
	.short 0x05C2, 0xF112
	.short 0x05BC, 0xF110
	.short 0x05B6, 0xF10E
	.short 0x05B1, 0xF10C
	.short 0x05AB, 0xF109
	.short 0x05A5, 0xF107
	.short 0x059F, 0xF105
	.short 0x0599, 0xF103
	.short 0x0593, 0xF101
	.short 0x058D, 0xF0FE
	.short 0x0587, 0xF0FC
	.short 0x0581, 0xF0FA
	.short 0x057C, 0xF0F8
	.short 0x0576, 0xF0F6
	.short 0x0570, 0xF0F4
	.short 0x056A, 0xF0F2
	.short 0x0564, 0xF0EF
	.short 0x055E, 0xF0ED
	.short 0x0558, 0xF0EB
	.short 0x0552, 0xF0E9
	.short 0x054C, 0xF0E7
	.short 0x0546, 0xF0E5
	.short 0x0540, 0xF0E3
	.short 0x053A, 0xF0E1
	.short 0x0534, 0xF0DF
	.short 0x052F, 0xF0DD
	.short 0x0529, 0xF0DB
	.short 0x0523, 0xF0D9
	.short 0x051D, 0xF0D7
	.short 0x0517, 0xF0D5
	.short 0x0511, 0xF0D3
	.short 0x050B, 0xF0D1
	.short 0x0505, 0xF0CF
	.short 0x04FF, 0xF0CD
	.short 0x04F9, 0xF0CB
	.short 0x04F3, 0xF0C9
	.short 0x04ED, 0xF0C7
	.short 0x04E7, 0xF0C5
	.short 0x04E1, 0xF0C3
	.short 0x04DB, 0xF0C1
	.short 0x04D5, 0xF0BF
	.short 0x04CF, 0xF0BD
	.short 0x04C9, 0xF0BB
	.short 0x04C3, 0xF0BA
	.short 0x04BD, 0xF0B8
	.short 0x04B7, 0xF0B6
	.short 0x04B1, 0xF0B4
	.short 0x04AB, 0xF0B2
	.short 0x04A5, 0xF0B0
	.short 0x049F, 0xF0AF
	.short 0x0499, 0xF0AD
	.short 0x0493, 0xF0AB
	.short 0x048D, 0xF0A9
	.short 0x0487, 0xF0A7
	.short 0x0481, 0xF0A6
	.short 0x047B, 0xF0A4
	.short 0x0475, 0xF0A2
	.short 0x046F, 0xF0A0
	.short 0x0469, 0xF09F
	.short 0x0463, 0xF09D
	.short 0x045D, 0xF09B
	.short 0x0457, 0xF099
	.short 0x0451, 0xF098
	.short 0x044B, 0xF096
	.short 0x0444, 0xF094
	.short 0x043E, 0xF093
	.short 0x0438, 0xF091
	.short 0x0432, 0xF08F
	.short 0x042C, 0xF08E
	.short 0x0426, 0xF08C
	.short 0x0420, 0xF08A
	.short 0x041A, 0xF089
	.short 0x0414, 0xF087
	.short 0x040E, 0xF086
	.short 0x0408, 0xF084
	.short 0x0402, 0xF083
	.short 0x03FC, 0xF081
	.short 0x03F6, 0xF07F
	.short 0x03EF, 0xF07E
	.short 0x03E9, 0xF07C
	.short 0x03E3, 0xF07B
	.short 0x03DD, 0xF079
	.short 0x03D7, 0xF078
	.short 0x03D1, 0xF076
	.short 0x03CB, 0xF075
	.short 0x03C5, 0xF073
	.short 0x03BF, 0xF072
	.short 0x03B9, 0xF070
	.short 0x03B2, 0xF06F
	.short 0x03AC, 0xF06D
	.short 0x03A6, 0xF06C
	.short 0x03A0, 0xF06B
	.short 0x039A, 0xF069
	.short 0x0394, 0xF068
	.short 0x038E, 0xF066
	.short 0x0388, 0xF065
	.short 0x0381, 0xF064
	.short 0x037B, 0xF062
	.short 0x0375, 0xF061
	.short 0x036F, 0xF05F
	.short 0x0369, 0xF05E
	.short 0x0363, 0xF05D
	.short 0x035D, 0xF05B
	.short 0x0356, 0xF05A
	.short 0x0350, 0xF059
	.short 0x034A, 0xF058
	.short 0x0344, 0xF056
	.short 0x033E, 0xF055
	.short 0x0338, 0xF054
	.short 0x0332, 0xF052
	.short 0x032B, 0xF051
	.short 0x0325, 0xF050
	.short 0x031F, 0xF04F
	.short 0x0319, 0xF04D
	.short 0x0313, 0xF04C
	.short 0x030D, 0xF04B
	.short 0x0306, 0xF04A
	.short 0x0300, 0xF049
	.short 0x02FA, 0xF048
	.short 0x02F4, 0xF046
	.short 0x02EE, 0xF045
	.short 0x02E8, 0xF044
	.short 0x02E1, 0xF043
	.short 0x02DB, 0xF042
	.short 0x02D5, 0xF041
	.short 0x02CF, 0xF040
	.short 0x02C9, 0xF03E
	.short 0x02C2, 0xF03D
	.short 0x02BC, 0xF03C
	.short 0x02B6, 0xF03B
	.short 0x02B0, 0xF03A
	.short 0x02AA, 0xF039
	.short 0x02A3, 0xF038
	.short 0x029D, 0xF037
	.short 0x0297, 0xF036
	.short 0x0291, 0xF035
	.short 0x028B, 0xF034
	.short 0x0284, 0xF033
	.short 0x027E, 0xF032
	.short 0x0278, 0xF031
	.short 0x0272, 0xF030
	.short 0x026C, 0xF02F
	.short 0x0265, 0xF02E
	.short 0x025F, 0xF02D
	.short 0x0259, 0xF02C
	.short 0x0253, 0xF02B
	.short 0x024D, 0xF02B
	.short 0x0246, 0xF02A
	.short 0x0240, 0xF029
	.short 0x023A, 0xF028
	.short 0x0234, 0xF027
	.short 0x022D, 0xF026
	.short 0x0227, 0xF025
	.short 0x0221, 0xF024
	.short 0x021B, 0xF024
	.short 0x0215, 0xF023
	.short 0x020E, 0xF022
	.short 0x0208, 0xF021
	.short 0x0202, 0xF020
	.short 0x01FC, 0xF020
	.short 0x01F5, 0xF01F
	.short 0x01EF, 0xF01E
	.short 0x01E9, 0xF01D
	.short 0x01E3, 0xF01D
	.short 0x01DC, 0xF01C
	.short 0x01D6, 0xF01B
	.short 0x01D0, 0xF01A
	.short 0x01CA, 0xF01A
	.short 0x01C3, 0xF019
	.short 0x01BD, 0xF018
	.short 0x01B7, 0xF018
	.short 0x01B1, 0xF017
	.short 0x01AA, 0xF016
	.short 0x01A4, 0xF016
	.short 0x019E, 0xF015
	.short 0x0198, 0xF014
	.short 0x0191, 0xF014
	.short 0x018B, 0xF013
	.short 0x0185, 0xF013
	.short 0x017F, 0xF012
	.short 0x0178, 0xF011
	.short 0x0172, 0xF011
	.short 0x016C, 0xF010
	.short 0x0166, 0xF010
	.short 0x015F, 0xF00F
	.short 0x0159, 0xF00F
	.short 0x0153, 0xF00E
	.short 0x014D, 0xF00E
	.short 0x0146, 0xF00D
	.short 0x0140, 0xF00D
	.short 0x013A, 0xF00C
	.short 0x0134, 0xF00C
	.short 0x012D, 0xF00B
	.short 0x0127, 0xF00B
	.short 0x0121, 0xF00A
	.short 0x011B, 0xF00A
	.short 0x0114, 0xF009
	.short 0x010E, 0xF009
	.short 0x0108, 0xF008
	.short 0x0101, 0xF008
	.short 0x00FB, 0xF008
	.short 0x00F5, 0xF007
	.short 0x00EF, 0xF007
	.short 0x00E8, 0xF007
	.short 0x00E2, 0xF006
	.short 0x00DC, 0xF006
	.short 0x00D6, 0xF006
	.short 0x00CF, 0xF005
	.short 0x00C9, 0xF005
	.short 0x00C3, 0xF005
	.short 0x00BC, 0xF004
	.short 0x00B6, 0xF004
	.short 0x00B0, 0xF004
	.short 0x00AA, 0xF004
	.short 0x00A3, 0xF003
	.short 0x009D, 0xF003
	.short 0x0097, 0xF003
	.short 0x0090, 0xF003
	.short 0x008A, 0xF002
	.short 0x0084, 0xF002
	.short 0x007E, 0xF002
	.short 0x0077, 0xF002
	.short 0x0071, 0xF002
	.short 0x006B, 0xF001
	.short 0x0065, 0xF001
	.short 0x005E, 0xF001
	.short 0x0058, 0xF001
	.short 0x0052, 0xF001
	.short 0x004B, 0xF001
	.short 0x0045, 0xF001
	.short 0x003F, 0xF000
	.short 0x0039, 0xF000
	.short 0x0032, 0xF000
	.short 0x002C, 0xF000
	.short 0x0026, 0xF000
	.short 0x001F, 0xF000
	.short 0x0019, 0xF000
	.short 0x0013, 0xF000
	.short 0x000D, 0xF000
	.short 0x0006, 0xF000
	.short 0x0000, 0xF000
	.short 0xFFFA, 0xF000
	.short 0xFFF3, 0xF000
	.short 0xFFED, 0xF000
	.short 0xFFE7, 0xF000
	.short 0xFFE1, 0xF000
	.short 0xFFDA, 0xF000
	.short 0xFFD4, 0xF000
	.short 0xFFCE, 0xF000
	.short 0xFFC7, 0xF000
	.short 0xFFC1, 0xF000
	.short 0xFFBB, 0xF001
	.short 0xFFB5, 0xF001
	.short 0xFFAE, 0xF001
	.short 0xFFA8, 0xF001
	.short 0xFFA2, 0xF001
	.short 0xFF9B, 0xF001
	.short 0xFF95, 0xF001
	.short 0xFF8F, 0xF002
	.short 0xFF89, 0xF002
	.short 0xFF82, 0xF002
	.short 0xFF7C, 0xF002
	.short 0xFF76, 0xF002
	.short 0xFF70, 0xF003
	.short 0xFF69, 0xF003
	.short 0xFF63, 0xF003
	.short 0xFF5D, 0xF003
	.short 0xFF56, 0xF004
	.short 0xFF50, 0xF004
	.short 0xFF4A, 0xF004
	.short 0xFF44, 0xF004
	.short 0xFF3D, 0xF005
	.short 0xFF37, 0xF005
	.short 0xFF31, 0xF005
	.short 0xFF2A, 0xF006
	.short 0xFF24, 0xF006
	.short 0xFF1E, 0xF006
	.short 0xFF18, 0xF007
	.short 0xFF11, 0xF007
	.short 0xFF0B, 0xF007
	.short 0xFF05, 0xF008
	.short 0xFEFF, 0xF008
	.short 0xFEF8, 0xF008
	.short 0xFEF2, 0xF009
	.short 0xFEEC, 0xF009
	.short 0xFEE5, 0xF00A
	.short 0xFEDF, 0xF00A
	.short 0xFED9, 0xF00B
	.short 0xFED3, 0xF00B
	.short 0xFECC, 0xF00C
	.short 0xFEC6, 0xF00C
	.short 0xFEC0, 0xF00D
	.short 0xFEBA, 0xF00D
	.short 0xFEB3, 0xF00E
	.short 0xFEAD, 0xF00E
	.short 0xFEA7, 0xF00F
	.short 0xFEA1, 0xF00F
	.short 0xFE9A, 0xF010
	.short 0xFE94, 0xF010
	.short 0xFE8E, 0xF011
	.short 0xFE88, 0xF011
	.short 0xFE81, 0xF012
	.short 0xFE7B, 0xF013
	.short 0xFE75, 0xF013
	.short 0xFE6F, 0xF014
	.short 0xFE68, 0xF014
	.short 0xFE62, 0xF015
	.short 0xFE5C, 0xF016
	.short 0xFE56, 0xF016
	.short 0xFE4F, 0xF017
	.short 0xFE49, 0xF018
	.short 0xFE43, 0xF018
	.short 0xFE3D, 0xF019
	.short 0xFE36, 0xF01A
	.short 0xFE30, 0xF01A
	.short 0xFE2A, 0xF01B
	.short 0xFE24, 0xF01C
	.short 0xFE1D, 0xF01D
	.short 0xFE17, 0xF01D
	.short 0xFE11, 0xF01E
	.short 0xFE0B, 0xF01F
	.short 0xFE04, 0xF020
	.short 0xFDFE, 0xF020
	.short 0xFDF8, 0xF021
	.short 0xFDF2, 0xF022
	.short 0xFDEB, 0xF023
	.short 0xFDE5, 0xF024
	.short 0xFDDF, 0xF024
	.short 0xFDD9, 0xF025
	.short 0xFDD3, 0xF026
	.short 0xFDCC, 0xF027
	.short 0xFDC6, 0xF028
	.short 0xFDC0, 0xF029
	.short 0xFDBA, 0xF02A
	.short 0xFDB3, 0xF02B
	.short 0xFDAD, 0xF02B
	.short 0xFDA7, 0xF02C
	.short 0xFDA1, 0xF02D
	.short 0xFD9B, 0xF02E
	.short 0xFD94, 0xF02F
	.short 0xFD8E, 0xF030
	.short 0xFD88, 0xF031
	.short 0xFD82, 0xF032
	.short 0xFD7C, 0xF033
	.short 0xFD75, 0xF034
	.short 0xFD6F, 0xF035
	.short 0xFD69, 0xF036
	.short 0xFD63, 0xF037
	.short 0xFD5D, 0xF038
	.short 0xFD56, 0xF039
	.short 0xFD50, 0xF03A
	.short 0xFD4A, 0xF03B
	.short 0xFD44, 0xF03C
	.short 0xFD3E, 0xF03D
	.short 0xFD37, 0xF03E
	.short 0xFD31, 0xF040
	.short 0xFD2B, 0xF041
	.short 0xFD25, 0xF042
	.short 0xFD1F, 0xF043
	.short 0xFD18, 0xF044
	.short 0xFD12, 0xF045
	.short 0xFD0C, 0xF046
	.short 0xFD06, 0xF048
	.short 0xFD00, 0xF049
	.short 0xFCFA, 0xF04A
	.short 0xFCF3, 0xF04B
	.short 0xFCED, 0xF04C
	.short 0xFCE7, 0xF04D
	.short 0xFCE1, 0xF04F
	.short 0xFCDB, 0xF050
	.short 0xFCD5, 0xF051
	.short 0xFCCE, 0xF052
	.short 0xFCC8, 0xF054
	.short 0xFCC2, 0xF055
	.short 0xFCBC, 0xF056
	.short 0xFCB6, 0xF058
	.short 0xFCB0, 0xF059
	.short 0xFCAA, 0xF05A
	.short 0xFCA3, 0xF05B
	.short 0xFC9D, 0xF05D
	.short 0xFC97, 0xF05E
	.short 0xFC91, 0xF05F
	.short 0xFC8B, 0xF061
	.short 0xFC85, 0xF062
	.short 0xFC7F, 0xF064
	.short 0xFC78, 0xF065
	.short 0xFC72, 0xF066
	.short 0xFC6C, 0xF068
	.short 0xFC66, 0xF069
	.short 0xFC60, 0xF06B
	.short 0xFC5A, 0xF06C
	.short 0xFC54, 0xF06D
	.short 0xFC4E, 0xF06F
	.short 0xFC47, 0xF070
	.short 0xFC41, 0xF072
	.short 0xFC3B, 0xF073
	.short 0xFC35, 0xF075
	.short 0xFC2F, 0xF076
	.short 0xFC29, 0xF078
	.short 0xFC23, 0xF079
	.short 0xFC1D, 0xF07B
	.short 0xFC17, 0xF07C
	.short 0xFC11, 0xF07E
	.short 0xFC0A, 0xF07F
	.short 0xFC04, 0xF081
	.short 0xFBFE, 0xF083
	.short 0xFBF8, 0xF084
	.short 0xFBF2, 0xF086
	.short 0xFBEC, 0xF087
	.short 0xFBE6, 0xF089
	.short 0xFBE0, 0xF08A
	.short 0xFBDA, 0xF08C
	.short 0xFBD4, 0xF08E
	.short 0xFBCE, 0xF08F
	.short 0xFBC8, 0xF091
	.short 0xFBC2, 0xF093
	.short 0xFBBC, 0xF094
	.short 0xFBB5, 0xF096
	.short 0xFBAF, 0xF098
	.short 0xFBA9, 0xF099
	.short 0xFBA3, 0xF09B
	.short 0xFB9D, 0xF09D
	.short 0xFB97, 0xF09F
	.short 0xFB91, 0xF0A0
	.short 0xFB8B, 0xF0A2
	.short 0xFB85, 0xF0A4
	.short 0xFB7F, 0xF0A6
	.short 0xFB79, 0xF0A7
	.short 0xFB73, 0xF0A9
	.short 0xFB6D, 0xF0AB
	.short 0xFB67, 0xF0AD
	.short 0xFB61, 0xF0AF
	.short 0xFB5B, 0xF0B0
	.short 0xFB55, 0xF0B2
	.short 0xFB4F, 0xF0B4
	.short 0xFB49, 0xF0B6
	.short 0xFB43, 0xF0B8
	.short 0xFB3D, 0xF0BA
	.short 0xFB37, 0xF0BB
	.short 0xFB31, 0xF0BD
	.short 0xFB2B, 0xF0BF
	.short 0xFB25, 0xF0C1
	.short 0xFB1F, 0xF0C3
	.short 0xFB19, 0xF0C5
	.short 0xFB13, 0xF0C7
	.short 0xFB0D, 0xF0C9
	.short 0xFB07, 0xF0CB
	.short 0xFB01, 0xF0CD
	.short 0xFAFB, 0xF0CF
	.short 0xFAF5, 0xF0D1
	.short 0xFAEF, 0xF0D3
	.short 0xFAE9, 0xF0D5
	.short 0xFAE3, 0xF0D7
	.short 0xFADD, 0xF0D9
	.short 0xFAD7, 0xF0DB
	.short 0xFAD1, 0xF0DD
	.short 0xFACC, 0xF0DF
	.short 0xFAC6, 0xF0E1
	.short 0xFAC0, 0xF0E3
	.short 0xFABA, 0xF0E5
	.short 0xFAB4, 0xF0E7
	.short 0xFAAE, 0xF0E9
	.short 0xFAA8, 0xF0EB
	.short 0xFAA2, 0xF0ED
	.short 0xFA9C, 0xF0EF
	.short 0xFA96, 0xF0F2
	.short 0xFA90, 0xF0F4
	.short 0xFA8A, 0xF0F6
	.short 0xFA84, 0xF0F8
	.short 0xFA7F, 0xF0FA
	.short 0xFA79, 0xF0FC
	.short 0xFA73, 0xF0FE
	.short 0xFA6D, 0xF101
	.short 0xFA67, 0xF103
	.short 0xFA61, 0xF105
	.short 0xFA5B, 0xF107
	.short 0xFA55, 0xF109
	.short 0xFA4F, 0xF10C
	.short 0xFA4A, 0xF10E
	.short 0xFA44, 0xF110
	.short 0xFA3E, 0xF112
	.short 0xFA38, 0xF115
	.short 0xFA32, 0xF117
	.short 0xFA2C, 0xF119
	.short 0xFA26, 0xF11C
	.short 0xFA21, 0xF11E
	.short 0xFA1B, 0xF120
	.short 0xFA15, 0xF123
	.short 0xFA0F, 0xF125
	.short 0xFA09, 0xF127
	.short 0xFA03, 0xF12A
	.short 0xF9FE, 0xF12C
	.short 0xF9F8, 0xF12E
	.short 0xF9F2, 0xF131
	.short 0xF9EC, 0xF133
	.short 0xF9E6, 0xF135
	.short 0xF9E1, 0xF138
	.short 0xF9DB, 0xF13A
	.short 0xF9D5, 0xF13D
	.short 0xF9CF, 0xF13F
	.short 0xF9C9, 0xF141
	.short 0xF9C4, 0xF144
	.short 0xF9BE, 0xF146
	.short 0xF9B8, 0xF149
	.short 0xF9B2, 0xF14B
	.short 0xF9AC, 0xF14E
	.short 0xF9A7, 0xF150
	.short 0xF9A1, 0xF153
	.short 0xF99B, 0xF155
	.short 0xF995, 0xF158
	.short 0xF990, 0xF15A
	.short 0xF98A, 0xF15D
	.short 0xF984, 0xF15F
	.short 0xF97E, 0xF162
	.short 0xF979, 0xF165
	.short 0xF973, 0xF167
	.short 0xF96D, 0xF16A
	.short 0xF967, 0xF16C
	.short 0xF962, 0xF16F
	.short 0xF95C, 0xF171
	.short 0xF956, 0xF174
	.short 0xF951, 0xF177
	.short 0xF94B, 0xF179
	.short 0xF945, 0xF17C
	.short 0xF93F, 0xF17F
	.short 0xF93A, 0xF181
	.short 0xF934, 0xF184
	.short 0xF92E, 0xF187
	.short 0xF929, 0xF189
	.short 0xF923, 0xF18C
	.short 0xF91D, 0xF18F
	.short 0xF918, 0xF191
	.short 0xF912, 0xF194
	.short 0xF90C, 0xF197
	.short 0xF907, 0xF19A
	.short 0xF901, 0xF19C
	.short 0xF8FB, 0xF19F
	.short 0xF8F6, 0xF1A2
	.short 0xF8F0, 0xF1A5
	.short 0xF8EB, 0xF1A7
	.short 0xF8E5, 0xF1AA
	.short 0xF8DF, 0xF1AD
	.short 0xF8DA, 0xF1B0
	.short 0xF8D4, 0xF1B3
	.short 0xF8CE, 0xF1B5
	.short 0xF8C9, 0xF1B8
	.short 0xF8C3, 0xF1BB
	.short 0xF8BE, 0xF1BE
	.short 0xF8B8, 0xF1C1
	.short 0xF8B2, 0xF1C4
	.short 0xF8AD, 0xF1C6
	.short 0xF8A7, 0xF1C9
	.short 0xF8A2, 0xF1CC
	.short 0xF89C, 0xF1CF
	.short 0xF896, 0xF1D2
	.short 0xF891, 0xF1D5
	.short 0xF88B, 0xF1D8
	.short 0xF886, 0xF1DB
	.short 0xF880, 0xF1DE
	.short 0xF87B, 0xF1E1
	.short 0xF875, 0xF1E4
	.short 0xF870, 0xF1E7
	.short 0xF86A, 0xF1EA
	.short 0xF865, 0xF1ED
	.short 0xF85F, 0xF1F0
	.short 0xF85A, 0xF1F3
	.short 0xF854, 0xF1F6
	.short 0xF84E, 0xF1F9
	.short 0xF849, 0xF1FC
	.short 0xF843, 0xF1FF
	.short 0xF83E, 0xF202
	.short 0xF838, 0xF205
	.short 0xF833, 0xF208
	.short 0xF82E, 0xF20B
	.short 0xF828, 0xF20E
	.short 0xF823, 0xF211
	.short 0xF81D, 0xF214
	.short 0xF818, 0xF217
	.short 0xF812, 0xF21A
	.short 0xF80D, 0xF21D
	.short 0xF807, 0xF221
	.short 0xF802, 0xF224
	.short 0xF7FC, 0xF227
	.short 0xF7F7, 0xF22A
	.short 0xF7F2, 0xF22D
	.short 0xF7EC, 0xF230
	.short 0xF7E7, 0xF234
	.short 0xF7E1, 0xF237
	.short 0xF7DC, 0xF23A
	.short 0xF7D6, 0xF23D
	.short 0xF7D1, 0xF240
	.short 0xF7CC, 0xF244
	.short 0xF7C6, 0xF247
	.short 0xF7C1, 0xF24A
	.short 0xF7BB, 0xF24D
	.short 0xF7B6, 0xF250
	.short 0xF7B1, 0xF254
	.short 0xF7AB, 0xF257
	.short 0xF7A6, 0xF25A
	.short 0xF7A1, 0xF25E
	.short 0xF79B, 0xF261
	.short 0xF796, 0xF264
	.short 0xF791, 0xF267
	.short 0xF78B, 0xF26B
	.short 0xF786, 0xF26E
	.short 0xF781, 0xF271
	.short 0xF77B, 0xF275
	.short 0xF776, 0xF278
	.short 0xF771, 0xF27B
	.short 0xF76B, 0xF27F
	.short 0xF766, 0xF282
	.short 0xF761, 0xF286
	.short 0xF75B, 0xF289
	.short 0xF756, 0xF28C
	.short 0xF751, 0xF290
	.short 0xF74C, 0xF293
	.short 0xF746, 0xF297
	.short 0xF741, 0xF29A
	.short 0xF73C, 0xF29E
	.short 0xF737, 0xF2A1
	.short 0xF731, 0xF2A4
	.short 0xF72C, 0xF2A8
	.short 0xF727, 0xF2AB
	.short 0xF722, 0xF2AF
	.short 0xF71C, 0xF2B2
	.short 0xF717, 0xF2B6
	.short 0xF712, 0xF2B9
	.short 0xF70D, 0xF2BD
	.short 0xF708, 0xF2C0
	.short 0xF702, 0xF2C4
	.short 0xF6FD, 0xF2C7
	.short 0xF6F8, 0xF2CB
	.short 0xF6F3, 0xF2CE
	.short 0xF6EE, 0xF2D2
	.short 0xF6E8, 0xF2D6
	.short 0xF6E3, 0xF2D9
	.short 0xF6DE, 0xF2DD
	.short 0xF6D9, 0xF2E0
	.short 0xF6D4, 0xF2E4
	.short 0xF6CF, 0xF2E8
	.short 0xF6C9, 0xF2EB
	.short 0xF6C4, 0xF2EF
	.short 0xF6BF, 0xF2F2
	.short 0xF6BA, 0xF2F6
	.short 0xF6B5, 0xF2FA
	.short 0xF6B0, 0xF2FD
	.short 0xF6AB, 0xF301
	.short 0xF6A6, 0xF305
	.short 0xF6A1, 0xF308
	.short 0xF69B, 0xF30C
	.short 0xF696, 0xF310
	.short 0xF691, 0xF313
	.short 0xF68C, 0xF317
	.short 0xF687, 0xF31B
	.short 0xF682, 0xF31F
	.short 0xF67D, 0xF322
	.short 0xF678, 0xF326
	.short 0xF673, 0xF32A
	.short 0xF66E, 0xF32E
	.short 0xF669, 0xF331
	.short 0xF664, 0xF335
	.short 0xF65F, 0xF339
	.short 0xF65A, 0xF33D
	.short 0xF655, 0xF340
	.short 0xF650, 0xF344
	.short 0xF64B, 0xF348
	.short 0xF646, 0xF34C
	.short 0xF641, 0xF350
	.short 0xF63C, 0xF354
	.short 0xF637, 0xF357
	.short 0xF632, 0xF35B
	.short 0xF62D, 0xF35F
	.short 0xF628, 0xF363
	.short 0xF623, 0xF367
	.short 0xF61E, 0xF36B
	.short 0xF619, 0xF36F
	.short 0xF614, 0xF372
	.short 0xF60F, 0xF376
	.short 0xF60A, 0xF37A
	.short 0xF605, 0xF37E
	.short 0xF601, 0xF382
	.short 0xF5FC, 0xF386
	.short 0xF5F7, 0xF38A
	.short 0xF5F2, 0xF38E
	.short 0xF5ED, 0xF392
	.short 0xF5E8, 0xF396
	.short 0xF5E3, 0xF39A
	.short 0xF5DE, 0xF39E
	.short 0xF5DA, 0xF3A2
	.short 0xF5D5, 0xF3A6
	.short 0xF5D0, 0xF3AA
	.short 0xF5CB, 0xF3AE
	.short 0xF5C6, 0xF3B2
	.short 0xF5C1, 0xF3B6
	.short 0xF5BC, 0xF3BA
	.short 0xF5B8, 0xF3BE
	.short 0xF5B3, 0xF3C2
	.short 0xF5AE, 0xF3C6
	.short 0xF5A9, 0xF3CA
	.short 0xF5A4, 0xF3CE
	.short 0xF5A0, 0xF3D2
	.short 0xF59B, 0xF3D6
	.short 0xF596, 0xF3DA
	.short 0xF591, 0xF3DE
	.short 0xF58D, 0xF3E2
	.short 0xF588, 0xF3E7
	.short 0xF583, 0xF3EB
	.short 0xF57E, 0xF3EF
	.short 0xF57A, 0xF3F3
	.short 0xF575, 0xF3F7
	.short 0xF570, 0xF3FB
	.short 0xF56B, 0xF3FF
	.short 0xF567, 0xF404
	.short 0xF562, 0xF408
	.short 0xF55D, 0xF40C
	.short 0xF559, 0xF410
	.short 0xF554, 0xF414
	.short 0xF54F, 0xF418
	.short 0xF54B, 0xF41D
	.short 0xF546, 0xF421
	.short 0xF541, 0xF425
	.short 0xF53D, 0xF429
	.short 0xF538, 0xF42E
	.short 0xF533, 0xF432
	.short 0xF52F, 0xF436
	.short 0xF52A, 0xF43A
	.short 0xF525, 0xF43F
	.short 0xF521, 0xF443
	.short 0xF51C, 0xF447
	.short 0xF518, 0xF44B
	.short 0xF513, 0xF450
	.short 0xF50E, 0xF454
	.short 0xF50A, 0xF458
	.short 0xF505, 0xF45D
	.short 0xF501, 0xF461
	.short 0xF4FC, 0xF465
	.short 0xF4F8, 0xF469
	.short 0xF4F3, 0xF46E
	.short 0xF4EF, 0xF472
	.short 0xF4EA, 0xF477
	.short 0xF4E5, 0xF47B
	.short 0xF4E1, 0xF47F
	.short 0xF4DC, 0xF484
	.short 0xF4D8, 0xF488
	.short 0xF4D3, 0xF48C
	.short 0xF4CF, 0xF491
	.short 0xF4CA, 0xF495
	.short 0xF4C6, 0xF49A
	.short 0xF4C2, 0xF49E
	.short 0xF4BD, 0xF4A2
	.short 0xF4B9, 0xF4A7
	.short 0xF4B4, 0xF4AB
	.short 0xF4B0, 0xF4B0
	.short 0xF4AB, 0xF4B4
	.short 0xF4A7, 0xF4B9
	.short 0xF4A2, 0xF4BD
	.short 0xF49E, 0xF4C2
	.short 0xF49A, 0xF4C6
	.short 0xF495, 0xF4CA
	.short 0xF491, 0xF4CF
	.short 0xF48C, 0xF4D3
	.short 0xF488, 0xF4D8
	.short 0xF484, 0xF4DC
	.short 0xF47F, 0xF4E1
	.short 0xF47B, 0xF4E5
	.short 0xF477, 0xF4EA
	.short 0xF472, 0xF4EF
	.short 0xF46E, 0xF4F3
	.short 0xF469, 0xF4F8
	.short 0xF465, 0xF4FC
	.short 0xF461, 0xF501
	.short 0xF45D, 0xF505
	.short 0xF458, 0xF50A
	.short 0xF454, 0xF50E
	.short 0xF450, 0xF513
	.short 0xF44B, 0xF518
	.short 0xF447, 0xF51C
	.short 0xF443, 0xF521
	.short 0xF43F, 0xF525
	.short 0xF43A, 0xF52A
	.short 0xF436, 0xF52F
	.short 0xF432, 0xF533
	.short 0xF42E, 0xF538
	.short 0xF429, 0xF53D
	.short 0xF425, 0xF541
	.short 0xF421, 0xF546
	.short 0xF41D, 0xF54B
	.short 0xF418, 0xF54F
	.short 0xF414, 0xF554
	.short 0xF410, 0xF559
	.short 0xF40C, 0xF55D
	.short 0xF408, 0xF562
	.short 0xF404, 0xF567
	.short 0xF3FF, 0xF56B
	.short 0xF3FB, 0xF570
	.short 0xF3F7, 0xF575
	.short 0xF3F3, 0xF57A
	.short 0xF3EF, 0xF57E
	.short 0xF3EB, 0xF583
	.short 0xF3E7, 0xF588
	.short 0xF3E2, 0xF58D
	.short 0xF3DE, 0xF591
	.short 0xF3DA, 0xF596
	.short 0xF3D6, 0xF59B
	.short 0xF3D2, 0xF5A0
	.short 0xF3CE, 0xF5A4
	.short 0xF3CA, 0xF5A9
	.short 0xF3C6, 0xF5AE
	.short 0xF3C2, 0xF5B3
	.short 0xF3BE, 0xF5B8
	.short 0xF3BA, 0xF5BC
	.short 0xF3B6, 0xF5C1
	.short 0xF3B2, 0xF5C6
	.short 0xF3AE, 0xF5CB
	.short 0xF3AA, 0xF5D0
	.short 0xF3A6, 0xF5D5
	.short 0xF3A2, 0xF5DA
	.short 0xF39E, 0xF5DE
	.short 0xF39A, 0xF5E3
	.short 0xF396, 0xF5E8
	.short 0xF392, 0xF5ED
	.short 0xF38E, 0xF5F2
	.short 0xF38A, 0xF5F7
	.short 0xF386, 0xF5FC
	.short 0xF382, 0xF601
	.short 0xF37E, 0xF605
	.short 0xF37A, 0xF60A
	.short 0xF376, 0xF60F
	.short 0xF372, 0xF614
	.short 0xF36F, 0xF619
	.short 0xF36B, 0xF61E
	.short 0xF367, 0xF623
	.short 0xF363, 0xF628
	.short 0xF35F, 0xF62D
	.short 0xF35B, 0xF632
	.short 0xF357, 0xF637
	.short 0xF354, 0xF63C
	.short 0xF350, 0xF641
	.short 0xF34C, 0xF646
	.short 0xF348, 0xF64B
	.short 0xF344, 0xF650
	.short 0xF340, 0xF655
	.short 0xF33D, 0xF65A
	.short 0xF339, 0xF65F
	.short 0xF335, 0xF664
	.short 0xF331, 0xF669
	.short 0xF32E, 0xF66E
	.short 0xF32A, 0xF673
	.short 0xF326, 0xF678
	.short 0xF322, 0xF67D
	.short 0xF31F, 0xF682
	.short 0xF31B, 0xF687
	.short 0xF317, 0xF68C
	.short 0xF313, 0xF691
	.short 0xF310, 0xF696
	.short 0xF30C, 0xF69B
	.short 0xF308, 0xF6A1
	.short 0xF305, 0xF6A6
	.short 0xF301, 0xF6AB
	.short 0xF2FD, 0xF6B0
	.short 0xF2FA, 0xF6B5
	.short 0xF2F6, 0xF6BA
	.short 0xF2F2, 0xF6BF
	.short 0xF2EF, 0xF6C4
	.short 0xF2EB, 0xF6C9
	.short 0xF2E8, 0xF6CF
	.short 0xF2E4, 0xF6D4
	.short 0xF2E0, 0xF6D9
	.short 0xF2DD, 0xF6DE
	.short 0xF2D9, 0xF6E3
	.short 0xF2D6, 0xF6E8
	.short 0xF2D2, 0xF6EE
	.short 0xF2CE, 0xF6F3
	.short 0xF2CB, 0xF6F8
	.short 0xF2C7, 0xF6FD
	.short 0xF2C4, 0xF702
	.short 0xF2C0, 0xF708
	.short 0xF2BD, 0xF70D
	.short 0xF2B9, 0xF712
	.short 0xF2B6, 0xF717
	.short 0xF2B2, 0xF71C
	.short 0xF2AF, 0xF722
	.short 0xF2AB, 0xF727
	.short 0xF2A8, 0xF72C
	.short 0xF2A4, 0xF731
	.short 0xF2A1, 0xF737
	.short 0xF29E, 0xF73C
	.short 0xF29A, 0xF741
	.short 0xF297, 0xF746
	.short 0xF293, 0xF74C
	.short 0xF290, 0xF751
	.short 0xF28C, 0xF756
	.short 0xF289, 0xF75B
	.short 0xF286, 0xF761
	.short 0xF282, 0xF766
	.short 0xF27F, 0xF76B
	.short 0xF27B, 0xF771
	.short 0xF278, 0xF776
	.short 0xF275, 0xF77B
	.short 0xF271, 0xF781
	.short 0xF26E, 0xF786
	.short 0xF26B, 0xF78B
	.short 0xF267, 0xF791
	.short 0xF264, 0xF796
	.short 0xF261, 0xF79B
	.short 0xF25E, 0xF7A1
	.short 0xF25A, 0xF7A6
	.short 0xF257, 0xF7AB
	.short 0xF254, 0xF7B1
	.short 0xF250, 0xF7B6
	.short 0xF24D, 0xF7BB
	.short 0xF24A, 0xF7C1
	.short 0xF247, 0xF7C6
	.short 0xF244, 0xF7CC
	.short 0xF240, 0xF7D1
	.short 0xF23D, 0xF7D6
	.short 0xF23A, 0xF7DC
	.short 0xF237, 0xF7E1
	.short 0xF234, 0xF7E7
	.short 0xF230, 0xF7EC
	.short 0xF22D, 0xF7F2
	.short 0xF22A, 0xF7F7
	.short 0xF227, 0xF7FC
	.short 0xF224, 0xF802
	.short 0xF221, 0xF807
	.short 0xF21D, 0xF80D
	.short 0xF21A, 0xF812
	.short 0xF217, 0xF818
	.short 0xF214, 0xF81D
	.short 0xF211, 0xF823
	.short 0xF20E, 0xF828
	.short 0xF20B, 0xF82E
	.short 0xF208, 0xF833
	.short 0xF205, 0xF838
	.short 0xF202, 0xF83E
	.short 0xF1FF, 0xF843
	.short 0xF1FC, 0xF849
	.short 0xF1F9, 0xF84E
	.short 0xF1F6, 0xF854
	.short 0xF1F3, 0xF85A
	.short 0xF1F0, 0xF85F
	.short 0xF1ED, 0xF865
	.short 0xF1EA, 0xF86A
	.short 0xF1E7, 0xF870
	.short 0xF1E4, 0xF875
	.short 0xF1E1, 0xF87B
	.short 0xF1DE, 0xF880
	.short 0xF1DB, 0xF886
	.short 0xF1D8, 0xF88B
	.short 0xF1D5, 0xF891
	.short 0xF1D2, 0xF896
	.short 0xF1CF, 0xF89C
	.short 0xF1CC, 0xF8A2
	.short 0xF1C9, 0xF8A7
	.short 0xF1C6, 0xF8AD
	.short 0xF1C4, 0xF8B2
	.short 0xF1C1, 0xF8B8
	.short 0xF1BE, 0xF8BE
	.short 0xF1BB, 0xF8C3
	.short 0xF1B8, 0xF8C9
	.short 0xF1B5, 0xF8CE
	.short 0xF1B3, 0xF8D4
	.short 0xF1B0, 0xF8DA
	.short 0xF1AD, 0xF8DF
	.short 0xF1AA, 0xF8E5
	.short 0xF1A7, 0xF8EB
	.short 0xF1A5, 0xF8F0
	.short 0xF1A2, 0xF8F6
	.short 0xF19F, 0xF8FB
	.short 0xF19C, 0xF901
	.short 0xF19A, 0xF907
	.short 0xF197, 0xF90C
	.short 0xF194, 0xF912
	.short 0xF191, 0xF918
	.short 0xF18F, 0xF91D
	.short 0xF18C, 0xF923
	.short 0xF189, 0xF929
	.short 0xF187, 0xF92E
	.short 0xF184, 0xF934
	.short 0xF181, 0xF93A
	.short 0xF17F, 0xF93F
	.short 0xF17C, 0xF945
	.short 0xF179, 0xF94B
	.short 0xF177, 0xF951
	.short 0xF174, 0xF956
	.short 0xF171, 0xF95C
	.short 0xF16F, 0xF962
	.short 0xF16C, 0xF967
	.short 0xF16A, 0xF96D
	.short 0xF167, 0xF973
	.short 0xF165, 0xF979
	.short 0xF162, 0xF97E
	.short 0xF15F, 0xF984
	.short 0xF15D, 0xF98A
	.short 0xF15A, 0xF990
	.short 0xF158, 0xF995
	.short 0xF155, 0xF99B
	.short 0xF153, 0xF9A1
	.short 0xF150, 0xF9A7
	.short 0xF14E, 0xF9AC
	.short 0xF14B, 0xF9B2
	.short 0xF149, 0xF9B8
	.short 0xF146, 0xF9BE
	.short 0xF144, 0xF9C4
	.short 0xF141, 0xF9C9
	.short 0xF13F, 0xF9CF
	.short 0xF13D, 0xF9D5
	.short 0xF13A, 0xF9DB
	.short 0xF138, 0xF9E1
	.short 0xF135, 0xF9E6
	.short 0xF133, 0xF9EC
	.short 0xF131, 0xF9F2
	.short 0xF12E, 0xF9F8
	.short 0xF12C, 0xF9FE
	.short 0xF12A, 0xFA03
	.short 0xF127, 0xFA09
	.short 0xF125, 0xFA0F
	.short 0xF123, 0xFA15
	.short 0xF120, 0xFA1B
	.short 0xF11E, 0xFA21
	.short 0xF11C, 0xFA26
	.short 0xF119, 0xFA2C
	.short 0xF117, 0xFA32
	.short 0xF115, 0xFA38
	.short 0xF112, 0xFA3E
	.short 0xF110, 0xFA44
	.short 0xF10E, 0xFA4A
	.short 0xF10C, 0xFA4F
	.short 0xF109, 0xFA55
	.short 0xF107, 0xFA5B
	.short 0xF105, 0xFA61
	.short 0xF103, 0xFA67
	.short 0xF101, 0xFA6D
	.short 0xF0FE, 0xFA73
	.short 0xF0FC, 0xFA79
	.short 0xF0FA, 0xFA7F
	.short 0xF0F8, 0xFA84
	.short 0xF0F6, 0xFA8A
	.short 0xF0F4, 0xFA90
	.short 0xF0F2, 0xFA96
	.short 0xF0EF, 0xFA9C
	.short 0xF0ED, 0xFAA2
	.short 0xF0EB, 0xFAA8
	.short 0xF0E9, 0xFAAE
	.short 0xF0E7, 0xFAB4
	.short 0xF0E5, 0xFABA
	.short 0xF0E3, 0xFAC0
	.short 0xF0E1, 0xFAC6
	.short 0xF0DF, 0xFACC
	.short 0xF0DD, 0xFAD1
	.short 0xF0DB, 0xFAD7
	.short 0xF0D9, 0xFADD
	.short 0xF0D7, 0xFAE3
	.short 0xF0D5, 0xFAE9
	.short 0xF0D3, 0xFAEF
	.short 0xF0D1, 0xFAF5
	.short 0xF0CF, 0xFAFB
	.short 0xF0CD, 0xFB01
	.short 0xF0CB, 0xFB07
	.short 0xF0C9, 0xFB0D
	.short 0xF0C7, 0xFB13
	.short 0xF0C5, 0xFB19
	.short 0xF0C3, 0xFB1F
	.short 0xF0C1, 0xFB25
	.short 0xF0BF, 0xFB2B
	.short 0xF0BD, 0xFB31
	.short 0xF0BB, 0xFB37
	.short 0xF0BA, 0xFB3D
	.short 0xF0B8, 0xFB43
	.short 0xF0B6, 0xFB49
	.short 0xF0B4, 0xFB4F
	.short 0xF0B2, 0xFB55
	.short 0xF0B0, 0xFB5B
	.short 0xF0AF, 0xFB61
	.short 0xF0AD, 0xFB67
	.short 0xF0AB, 0xFB6D
	.short 0xF0A9, 0xFB73
	.short 0xF0A7, 0xFB79
	.short 0xF0A6, 0xFB7F
	.short 0xF0A4, 0xFB85
	.short 0xF0A2, 0xFB8B
	.short 0xF0A0, 0xFB91
	.short 0xF09F, 0xFB97
	.short 0xF09D, 0xFB9D
	.short 0xF09B, 0xFBA3
	.short 0xF099, 0xFBA9
	.short 0xF098, 0xFBAF
	.short 0xF096, 0xFBB5
	.short 0xF094, 0xFBBC
	.short 0xF093, 0xFBC2
	.short 0xF091, 0xFBC8
	.short 0xF08F, 0xFBCE
	.short 0xF08E, 0xFBD4
	.short 0xF08C, 0xFBDA
	.short 0xF08A, 0xFBE0
	.short 0xF089, 0xFBE6
	.short 0xF087, 0xFBEC
	.short 0xF086, 0xFBF2
	.short 0xF084, 0xFBF8
	.short 0xF083, 0xFBFE
	.short 0xF081, 0xFC04
	.short 0xF07F, 0xFC0A
	.short 0xF07E, 0xFC11
	.short 0xF07C, 0xFC17
	.short 0xF07B, 0xFC1D
	.short 0xF079, 0xFC23
	.short 0xF078, 0xFC29
	.short 0xF076, 0xFC2F
	.short 0xF075, 0xFC35
	.short 0xF073, 0xFC3B
	.short 0xF072, 0xFC41
	.short 0xF070, 0xFC47
	.short 0xF06F, 0xFC4E
	.short 0xF06D, 0xFC54
	.short 0xF06C, 0xFC5A
	.short 0xF06B, 0xFC60
	.short 0xF069, 0xFC66
	.short 0xF068, 0xFC6C
	.short 0xF066, 0xFC72
	.short 0xF065, 0xFC78
	.short 0xF064, 0xFC7F
	.short 0xF062, 0xFC85
	.short 0xF061, 0xFC8B
	.short 0xF05F, 0xFC91
	.short 0xF05E, 0xFC97
	.short 0xF05D, 0xFC9D
	.short 0xF05B, 0xFCA3
	.short 0xF05A, 0xFCAA
	.short 0xF059, 0xFCB0
	.short 0xF058, 0xFCB6
	.short 0xF056, 0xFCBC
	.short 0xF055, 0xFCC2
	.short 0xF054, 0xFCC8
	.short 0xF052, 0xFCCE
	.short 0xF051, 0xFCD5
	.short 0xF050, 0xFCDB
	.short 0xF04F, 0xFCE1
	.short 0xF04D, 0xFCE7
	.short 0xF04C, 0xFCED
	.short 0xF04B, 0xFCF3
	.short 0xF04A, 0xFCFA
	.short 0xF049, 0xFD00
	.short 0xF048, 0xFD06
	.short 0xF046, 0xFD0C
	.short 0xF045, 0xFD12
	.short 0xF044, 0xFD18
	.short 0xF043, 0xFD1F
	.short 0xF042, 0xFD25
	.short 0xF041, 0xFD2B
	.short 0xF040, 0xFD31
	.short 0xF03E, 0xFD37
	.short 0xF03D, 0xFD3E
	.short 0xF03C, 0xFD44
	.short 0xF03B, 0xFD4A
	.short 0xF03A, 0xFD50
	.short 0xF039, 0xFD56
	.short 0xF038, 0xFD5D
	.short 0xF037, 0xFD63
	.short 0xF036, 0xFD69
	.short 0xF035, 0xFD6F
	.short 0xF034, 0xFD75
	.short 0xF033, 0xFD7C
	.short 0xF032, 0xFD82
	.short 0xF031, 0xFD88
	.short 0xF030, 0xFD8E
	.short 0xF02F, 0xFD94
	.short 0xF02E, 0xFD9B
	.short 0xF02D, 0xFDA1
	.short 0xF02C, 0xFDA7
	.short 0xF02B, 0xFDAD
	.short 0xF02B, 0xFDB3
	.short 0xF02A, 0xFDBA
	.short 0xF029, 0xFDC0
	.short 0xF028, 0xFDC6
	.short 0xF027, 0xFDCC
	.short 0xF026, 0xFDD3
	.short 0xF025, 0xFDD9
	.short 0xF024, 0xFDDF
	.short 0xF024, 0xFDE5
	.short 0xF023, 0xFDEB
	.short 0xF022, 0xFDF2
	.short 0xF021, 0xFDF8
	.short 0xF020, 0xFDFE
	.short 0xF020, 0xFE04
	.short 0xF01F, 0xFE0B
	.short 0xF01E, 0xFE11
	.short 0xF01D, 0xFE17
	.short 0xF01D, 0xFE1D
	.short 0xF01C, 0xFE24
	.short 0xF01B, 0xFE2A
	.short 0xF01A, 0xFE30
	.short 0xF01A, 0xFE36
	.short 0xF019, 0xFE3D
	.short 0xF018, 0xFE43
	.short 0xF018, 0xFE49
	.short 0xF017, 0xFE4F
	.short 0xF016, 0xFE56
	.short 0xF016, 0xFE5C
	.short 0xF015, 0xFE62
	.short 0xF014, 0xFE68
	.short 0xF014, 0xFE6F
	.short 0xF013, 0xFE75
	.short 0xF013, 0xFE7B
	.short 0xF012, 0xFE81
	.short 0xF011, 0xFE88
	.short 0xF011, 0xFE8E
	.short 0xF010, 0xFE94
	.short 0xF010, 0xFE9A
	.short 0xF00F, 0xFEA1
	.short 0xF00F, 0xFEA7
	.short 0xF00E, 0xFEAD
	.short 0xF00E, 0xFEB3
	.short 0xF00D, 0xFEBA
	.short 0xF00D, 0xFEC0
	.short 0xF00C, 0xFEC6
	.short 0xF00C, 0xFECC
	.short 0xF00B, 0xFED3
	.short 0xF00B, 0xFED9
	.short 0xF00A, 0xFEDF
	.short 0xF00A, 0xFEE5
	.short 0xF009, 0xFEEC
	.short 0xF009, 0xFEF2
	.short 0xF008, 0xFEF8
	.short 0xF008, 0xFEFF
	.short 0xF008, 0xFF05
	.short 0xF007, 0xFF0B
	.short 0xF007, 0xFF11
	.short 0xF007, 0xFF18
	.short 0xF006, 0xFF1E
	.short 0xF006, 0xFF24
	.short 0xF006, 0xFF2A
	.short 0xF005, 0xFF31
	.short 0xF005, 0xFF37
	.short 0xF005, 0xFF3D
	.short 0xF004, 0xFF44
	.short 0xF004, 0xFF4A
	.short 0xF004, 0xFF50
	.short 0xF004, 0xFF56
	.short 0xF003, 0xFF5D
	.short 0xF003, 0xFF63
	.short 0xF003, 0xFF69
	.short 0xF003, 0xFF70
	.short 0xF002, 0xFF76
	.short 0xF002, 0xFF7C
	.short 0xF002, 0xFF82
	.short 0xF002, 0xFF89
	.short 0xF002, 0xFF8F
	.short 0xF001, 0xFF95
	.short 0xF001, 0xFF9B
	.short 0xF001, 0xFFA2
	.short 0xF001, 0xFFA8
	.short 0xF001, 0xFFAE
	.short 0xF001, 0xFFB5
	.short 0xF001, 0xFFBB
	.short 0xF000, 0xFFC1
	.short 0xF000, 0xFFC7
	.short 0xF000, 0xFFCE
	.short 0xF000, 0xFFD4
	.short 0xF000, 0xFFDA
	.short 0xF000, 0xFFE1
	.short 0xF000, 0xFFE7
	.short 0xF000, 0xFFED
	.short 0xF000, 0xFFF3
	.short 0xF000, 0xFFFA
	.short 0xF000, 0x0000
	.short 0xF000, 0x0006
	.short 0xF000, 0x000D
	.short 0xF000, 0x0013
	.short 0xF000, 0x0019
	.short 0xF000, 0x001F
	.short 0xF000, 0x0026
	.short 0xF000, 0x002C
	.short 0xF000, 0x0032
	.short 0xF000, 0x0039
	.short 0xF000, 0x003F
	.short 0xF001, 0x0045
	.short 0xF001, 0x004B
	.short 0xF001, 0x0052
	.short 0xF001, 0x0058
	.short 0xF001, 0x005E
	.short 0xF001, 0x0065
	.short 0xF001, 0x006B
	.short 0xF002, 0x0071
	.short 0xF002, 0x0077
	.short 0xF002, 0x007E
	.short 0xF002, 0x0084
	.short 0xF002, 0x008A
	.short 0xF003, 0x0090
	.short 0xF003, 0x0097
	.short 0xF003, 0x009D
	.short 0xF003, 0x00A3
	.short 0xF004, 0x00AA
	.short 0xF004, 0x00B0
	.short 0xF004, 0x00B6
	.short 0xF004, 0x00BC
	.short 0xF005, 0x00C3
	.short 0xF005, 0x00C9
	.short 0xF005, 0x00CF
	.short 0xF006, 0x00D6
	.short 0xF006, 0x00DC
	.short 0xF006, 0x00E2
	.short 0xF007, 0x00E8
	.short 0xF007, 0x00EF
	.short 0xF007, 0x00F5
	.short 0xF008, 0x00FB
	.short 0xF008, 0x0101
	.short 0xF008, 0x0108
	.short 0xF009, 0x010E
	.short 0xF009, 0x0114
	.short 0xF00A, 0x011B
	.short 0xF00A, 0x0121
	.short 0xF00B, 0x0127
	.short 0xF00B, 0x012D
	.short 0xF00C, 0x0134
	.short 0xF00C, 0x013A
	.short 0xF00D, 0x0140
	.short 0xF00D, 0x0146
	.short 0xF00E, 0x014D
	.short 0xF00E, 0x0153
	.short 0xF00F, 0x0159
	.short 0xF00F, 0x015F
	.short 0xF010, 0x0166
	.short 0xF010, 0x016C
	.short 0xF011, 0x0172
	.short 0xF011, 0x0178
	.short 0xF012, 0x017F
	.short 0xF013, 0x0185
	.short 0xF013, 0x018B
	.short 0xF014, 0x0191
	.short 0xF014, 0x0198
	.short 0xF015, 0x019E
	.short 0xF016, 0x01A4
	.short 0xF016, 0x01AA
	.short 0xF017, 0x01B1
	.short 0xF018, 0x01B7
	.short 0xF018, 0x01BD
	.short 0xF019, 0x01C3
	.short 0xF01A, 0x01CA
	.short 0xF01A, 0x01D0
	.short 0xF01B, 0x01D6
	.short 0xF01C, 0x01DC
	.short 0xF01D, 0x01E3
	.short 0xF01D, 0x01E9
	.short 0xF01E, 0x01EF
	.short 0xF01F, 0x01F5
	.short 0xF020, 0x01FC
	.short 0xF020, 0x0202
	.short 0xF021, 0x0208
	.short 0xF022, 0x020E
	.short 0xF023, 0x0215
	.short 0xF024, 0x021B
	.short 0xF024, 0x0221
	.short 0xF025, 0x0227
	.short 0xF026, 0x022D
	.short 0xF027, 0x0234
	.short 0xF028, 0x023A
	.short 0xF029, 0x0240
	.short 0xF02A, 0x0246
	.short 0xF02B, 0x024D
	.short 0xF02B, 0x0253
	.short 0xF02C, 0x0259
	.short 0xF02D, 0x025F
	.short 0xF02E, 0x0265
	.short 0xF02F, 0x026C
	.short 0xF030, 0x0272
	.short 0xF031, 0x0278
	.short 0xF032, 0x027E
	.short 0xF033, 0x0284
	.short 0xF034, 0x028B
	.short 0xF035, 0x0291
	.short 0xF036, 0x0297
	.short 0xF037, 0x029D
	.short 0xF038, 0x02A3
	.short 0xF039, 0x02AA
	.short 0xF03A, 0x02B0
	.short 0xF03B, 0x02B6
	.short 0xF03C, 0x02BC
	.short 0xF03D, 0x02C2
	.short 0xF03E, 0x02C9
	.short 0xF040, 0x02CF
	.short 0xF041, 0x02D5
	.short 0xF042, 0x02DB
	.short 0xF043, 0x02E1
	.short 0xF044, 0x02E8
	.short 0xF045, 0x02EE
	.short 0xF046, 0x02F4
	.short 0xF048, 0x02FA
	.short 0xF049, 0x0300
	.short 0xF04A, 0x0306
	.short 0xF04B, 0x030D
	.short 0xF04C, 0x0313
	.short 0xF04D, 0x0319
	.short 0xF04F, 0x031F
	.short 0xF050, 0x0325
	.short 0xF051, 0x032B
	.short 0xF052, 0x0332
	.short 0xF054, 0x0338
	.short 0xF055, 0x033E
	.short 0xF056, 0x0344
	.short 0xF058, 0x034A
	.short 0xF059, 0x0350
	.short 0xF05A, 0x0356
	.short 0xF05B, 0x035D
	.short 0xF05D, 0x0363
	.short 0xF05E, 0x0369
	.short 0xF05F, 0x036F
	.short 0xF061, 0x0375
	.short 0xF062, 0x037B
	.short 0xF064, 0x0381
	.short 0xF065, 0x0388
	.short 0xF066, 0x038E
	.short 0xF068, 0x0394
	.short 0xF069, 0x039A
	.short 0xF06B, 0x03A0
	.short 0xF06C, 0x03A6
	.short 0xF06D, 0x03AC
	.short 0xF06F, 0x03B2
	.short 0xF070, 0x03B9
	.short 0xF072, 0x03BF
	.short 0xF073, 0x03C5
	.short 0xF075, 0x03CB
	.short 0xF076, 0x03D1
	.short 0xF078, 0x03D7
	.short 0xF079, 0x03DD
	.short 0xF07B, 0x03E3
	.short 0xF07C, 0x03E9
	.short 0xF07E, 0x03EF
	.short 0xF07F, 0x03F6
	.short 0xF081, 0x03FC
	.short 0xF083, 0x0402
	.short 0xF084, 0x0408
	.short 0xF086, 0x040E
	.short 0xF087, 0x0414
	.short 0xF089, 0x041A
	.short 0xF08A, 0x0420
	.short 0xF08C, 0x0426
	.short 0xF08E, 0x042C
	.short 0xF08F, 0x0432
	.short 0xF091, 0x0438
	.short 0xF093, 0x043E
	.short 0xF094, 0x0444
	.short 0xF096, 0x044B
	.short 0xF098, 0x0451
	.short 0xF099, 0x0457
	.short 0xF09B, 0x045D
	.short 0xF09D, 0x0463
	.short 0xF09F, 0x0469
	.short 0xF0A0, 0x046F
	.short 0xF0A2, 0x0475
	.short 0xF0A4, 0x047B
	.short 0xF0A6, 0x0481
	.short 0xF0A7, 0x0487
	.short 0xF0A9, 0x048D
	.short 0xF0AB, 0x0493
	.short 0xF0AD, 0x0499
	.short 0xF0AF, 0x049F
	.short 0xF0B0, 0x04A5
	.short 0xF0B2, 0x04AB
	.short 0xF0B4, 0x04B1
	.short 0xF0B6, 0x04B7
	.short 0xF0B8, 0x04BD
	.short 0xF0BA, 0x04C3
	.short 0xF0BB, 0x04C9
	.short 0xF0BD, 0x04CF
	.short 0xF0BF, 0x04D5
	.short 0xF0C1, 0x04DB
	.short 0xF0C3, 0x04E1
	.short 0xF0C5, 0x04E7
	.short 0xF0C7, 0x04ED
	.short 0xF0C9, 0x04F3
	.short 0xF0CB, 0x04F9
	.short 0xF0CD, 0x04FF
	.short 0xF0CF, 0x0505
	.short 0xF0D1, 0x050B
	.short 0xF0D3, 0x0511
	.short 0xF0D5, 0x0517
	.short 0xF0D7, 0x051D
	.short 0xF0D9, 0x0523
	.short 0xF0DB, 0x0529
	.short 0xF0DD, 0x052F
	.short 0xF0DF, 0x0534
	.short 0xF0E1, 0x053A
	.short 0xF0E3, 0x0540
	.short 0xF0E5, 0x0546
	.short 0xF0E7, 0x054C
	.short 0xF0E9, 0x0552
	.short 0xF0EB, 0x0558
	.short 0xF0ED, 0x055E
	.short 0xF0EF, 0x0564
	.short 0xF0F2, 0x056A
	.short 0xF0F4, 0x0570
	.short 0xF0F6, 0x0576
	.short 0xF0F8, 0x057C
	.short 0xF0FA, 0x0581
	.short 0xF0FC, 0x0587
	.short 0xF0FE, 0x058D
	.short 0xF101, 0x0593
	.short 0xF103, 0x0599
	.short 0xF105, 0x059F
	.short 0xF107, 0x05A5
	.short 0xF109, 0x05AB
	.short 0xF10C, 0x05B1
	.short 0xF10E, 0x05B6
	.short 0xF110, 0x05BC
	.short 0xF112, 0x05C2
	.short 0xF115, 0x05C8
	.short 0xF117, 0x05CE
	.short 0xF119, 0x05D4
	.short 0xF11C, 0x05DA
	.short 0xF11E, 0x05DF
	.short 0xF120, 0x05E5
	.short 0xF123, 0x05EB
	.short 0xF125, 0x05F1
	.short 0xF127, 0x05F7
	.short 0xF12A, 0x05FD
	.short 0xF12C, 0x0602
	.short 0xF12E, 0x0608
	.short 0xF131, 0x060E
	.short 0xF133, 0x0614
	.short 0xF135, 0x061A
	.short 0xF138, 0x061F
	.short 0xF13A, 0x0625
	.short 0xF13D, 0x062B
	.short 0xF13F, 0x0631
	.short 0xF141, 0x0637
	.short 0xF144, 0x063C
	.short 0xF146, 0x0642
	.short 0xF149, 0x0648
	.short 0xF14B, 0x064E
	.short 0xF14E, 0x0654
	.short 0xF150, 0x0659
	.short 0xF153, 0x065F
	.short 0xF155, 0x0665
	.short 0xF158, 0x066B
	.short 0xF15A, 0x0670
	.short 0xF15D, 0x0676
	.short 0xF15F, 0x067C
	.short 0xF162, 0x0682
	.short 0xF165, 0x0687
	.short 0xF167, 0x068D
	.short 0xF16A, 0x0693
	.short 0xF16C, 0x0699
	.short 0xF16F, 0x069E
	.short 0xF171, 0x06A4
	.short 0xF174, 0x06AA
	.short 0xF177, 0x06AF
	.short 0xF179, 0x06B5
	.short 0xF17C, 0x06BB
	.short 0xF17F, 0x06C1
	.short 0xF181, 0x06C6
	.short 0xF184, 0x06CC
	.short 0xF187, 0x06D2
	.short 0xF189, 0x06D7
	.short 0xF18C, 0x06DD
	.short 0xF18F, 0x06E3
	.short 0xF191, 0x06E8
	.short 0xF194, 0x06EE
	.short 0xF197, 0x06F4
	.short 0xF19A, 0x06F9
	.short 0xF19C, 0x06FF
	.short 0xF19F, 0x0705
	.short 0xF1A2, 0x070A
	.short 0xF1A5, 0x0710
	.short 0xF1A7, 0x0715
	.short 0xF1AA, 0x071B
	.short 0xF1AD, 0x0721
	.short 0xF1B0, 0x0726
	.short 0xF1B3, 0x072C
	.short 0xF1B5, 0x0732
	.short 0xF1B8, 0x0737
	.short 0xF1BB, 0x073D
	.short 0xF1BE, 0x0742
	.short 0xF1C1, 0x0748
	.short 0xF1C4, 0x074E
	.short 0xF1C6, 0x0753
	.short 0xF1C9, 0x0759
	.short 0xF1CC, 0x075E
	.short 0xF1CF, 0x0764
	.short 0xF1D2, 0x076A
	.short 0xF1D5, 0x076F
	.short 0xF1D8, 0x0775
	.short 0xF1DB, 0x077A
	.short 0xF1DE, 0x0780
	.short 0xF1E1, 0x0785
	.short 0xF1E4, 0x078B
	.short 0xF1E7, 0x0790
	.short 0xF1EA, 0x0796
	.short 0xF1ED, 0x079B
	.short 0xF1F0, 0x07A1
	.short 0xF1F3, 0x07A6
	.short 0xF1F6, 0x07AC
	.short 0xF1F9, 0x07B2
	.short 0xF1FC, 0x07B7
	.short 0xF1FF, 0x07BD
	.short 0xF202, 0x07C2
	.short 0xF205, 0x07C8
	.short 0xF208, 0x07CD
	.short 0xF20B, 0x07D2
	.short 0xF20E, 0x07D8
	.short 0xF211, 0x07DD
	.short 0xF214, 0x07E3
	.short 0xF217, 0x07E8
	.short 0xF21A, 0x07EE
	.short 0xF21D, 0x07F3
	.short 0xF221, 0x07F9
	.short 0xF224, 0x07FE
	.short 0xF227, 0x0804
	.short 0xF22A, 0x0809
	.short 0xF22D, 0x080E
	.short 0xF230, 0x0814
	.short 0xF234, 0x0819
	.short 0xF237, 0x081F
	.short 0xF23A, 0x0824
	.short 0xF23D, 0x082A
	.short 0xF240, 0x082F
	.short 0xF244, 0x0834
	.short 0xF247, 0x083A
	.short 0xF24A, 0x083F
	.short 0xF24D, 0x0845
	.short 0xF250, 0x084A
	.short 0xF254, 0x084F
	.short 0xF257, 0x0855
	.short 0xF25A, 0x085A
	.short 0xF25E, 0x085F
	.short 0xF261, 0x0865
	.short 0xF264, 0x086A
	.short 0xF267, 0x086F
	.short 0xF26B, 0x0875
	.short 0xF26E, 0x087A
	.short 0xF271, 0x087F
	.short 0xF275, 0x0885
	.short 0xF278, 0x088A
	.short 0xF27B, 0x088F
	.short 0xF27F, 0x0895
	.short 0xF282, 0x089A
	.short 0xF286, 0x089F
	.short 0xF289, 0x08A5
	.short 0xF28C, 0x08AA
	.short 0xF290, 0x08AF
	.short 0xF293, 0x08B4
	.short 0xF297, 0x08BA
	.short 0xF29A, 0x08BF
	.short 0xF29E, 0x08C4
	.short 0xF2A1, 0x08C9
	.short 0xF2A4, 0x08CF
	.short 0xF2A8, 0x08D4
	.short 0xF2AB, 0x08D9
	.short 0xF2AF, 0x08DE
	.short 0xF2B2, 0x08E4
	.short 0xF2B6, 0x08E9
	.short 0xF2B9, 0x08EE
	.short 0xF2BD, 0x08F3
	.short 0xF2C0, 0x08F8
	.short 0xF2C4, 0x08FE
	.short 0xF2C7, 0x0903
	.short 0xF2CB, 0x0908
	.short 0xF2CE, 0x090D
	.short 0xF2D2, 0x0912
	.short 0xF2D6, 0x0918
	.short 0xF2D9, 0x091D
	.short 0xF2DD, 0x0922
	.short 0xF2E0, 0x0927
	.short 0xF2E4, 0x092C
	.short 0xF2E8, 0x0931
	.short 0xF2EB, 0x0937
	.short 0xF2EF, 0x093C
	.short 0xF2F2, 0x0941
	.short 0xF2F6, 0x0946
	.short 0xF2FA, 0x094B
	.short 0xF2FD, 0x0950
	.short 0xF301, 0x0955
	.short 0xF305, 0x095A
	.short 0xF308, 0x095F
	.short 0xF30C, 0x0965
	.short 0xF310, 0x096A
	.short 0xF313, 0x096F
	.short 0xF317, 0x0974
	.short 0xF31B, 0x0979
	.short 0xF31F, 0x097E
	.short 0xF322, 0x0983
	.short 0xF326, 0x0988
	.short 0xF32A, 0x098D
	.short 0xF32E, 0x0992
	.short 0xF331, 0x0997
	.short 0xF335, 0x099C
	.short 0xF339, 0x09A1
	.short 0xF33D, 0x09A6
	.short 0xF340, 0x09AB
	.short 0xF344, 0x09B0
	.short 0xF348, 0x09B5
	.short 0xF34C, 0x09BA
	.short 0xF350, 0x09BF
	.short 0xF354, 0x09C4
	.short 0xF357, 0x09C9
	.short 0xF35B, 0x09CE
	.short 0xF35F, 0x09D3
	.short 0xF363, 0x09D8
	.short 0xF367, 0x09DD
	.short 0xF36B, 0x09E2
	.short 0xF36F, 0x09E7
	.short 0xF372, 0x09EC
	.short 0xF376, 0x09F1
	.short 0xF37A, 0x09F6
	.short 0xF37E, 0x09FB
	.short 0xF382, 0x09FF
	.short 0xF386, 0x0A04
	.short 0xF38A, 0x0A09
	.short 0xF38E, 0x0A0E
	.short 0xF392, 0x0A13
	.short 0xF396, 0x0A18
	.short 0xF39A, 0x0A1D
	.short 0xF39E, 0x0A22
	.short 0xF3A2, 0x0A26
	.short 0xF3A6, 0x0A2B
	.short 0xF3AA, 0x0A30
	.short 0xF3AE, 0x0A35
	.short 0xF3B2, 0x0A3A
	.short 0xF3B6, 0x0A3F
	.short 0xF3BA, 0x0A44
	.short 0xF3BE, 0x0A48
	.short 0xF3C2, 0x0A4D
	.short 0xF3C6, 0x0A52
	.short 0xF3CA, 0x0A57
	.short 0xF3CE, 0x0A5C
	.short 0xF3D2, 0x0A60
	.short 0xF3D6, 0x0A65
	.short 0xF3DA, 0x0A6A
	.short 0xF3DE, 0x0A6F
	.short 0xF3E2, 0x0A73
	.short 0xF3E7, 0x0A78
	.short 0xF3EB, 0x0A7D
	.short 0xF3EF, 0x0A82
	.short 0xF3F3, 0x0A86
	.short 0xF3F7, 0x0A8B
	.short 0xF3FB, 0x0A90
	.short 0xF3FF, 0x0A95
	.short 0xF404, 0x0A99
	.short 0xF408, 0x0A9E
	.short 0xF40C, 0x0AA3
	.short 0xF410, 0x0AA7
	.short 0xF414, 0x0AAC
	.short 0xF418, 0x0AB1
	.short 0xF41D, 0x0AB5
	.short 0xF421, 0x0ABA
	.short 0xF425, 0x0ABF
	.short 0xF429, 0x0AC3
	.short 0xF42E, 0x0AC8
	.short 0xF432, 0x0ACD
	.short 0xF436, 0x0AD1
	.short 0xF43A, 0x0AD6
	.short 0xF43F, 0x0ADB
	.short 0xF443, 0x0ADF
	.short 0xF447, 0x0AE4
	.short 0xF44B, 0x0AE8
	.short 0xF450, 0x0AED
	.short 0xF454, 0x0AF2
	.short 0xF458, 0x0AF6
	.short 0xF45D, 0x0AFB
	.short 0xF461, 0x0AFF
	.short 0xF465, 0x0B04
	.short 0xF469, 0x0B08
	.short 0xF46E, 0x0B0D
	.short 0xF472, 0x0B11
	.short 0xF477, 0x0B16
	.short 0xF47B, 0x0B1B
	.short 0xF47F, 0x0B1F
	.short 0xF484, 0x0B24
	.short 0xF488, 0x0B28
	.short 0xF48C, 0x0B2D
	.short 0xF491, 0x0B31
	.short 0xF495, 0x0B36
	.short 0xF49A, 0x0B3A
	.short 0xF49E, 0x0B3E
	.short 0xF4A2, 0x0B43
	.short 0xF4A7, 0x0B47
	.short 0xF4AB, 0x0B4C
	.short 0xF4B0, 0x0B50
	.short 0xF4B4, 0x0B55
	.short 0xF4B9, 0x0B59
	.short 0xF4BD, 0x0B5E
	.short 0xF4C2, 0x0B62
	.short 0xF4C6, 0x0B66
	.short 0xF4CA, 0x0B6B
	.short 0xF4CF, 0x0B6F
	.short 0xF4D3, 0x0B74
	.short 0xF4D8, 0x0B78
	.short 0xF4DC, 0x0B7C
	.short 0xF4E1, 0x0B81
	.short 0xF4E5, 0x0B85
	.short 0xF4EA, 0x0B89
	.short 0xF4EF, 0x0B8E
	.short 0xF4F3, 0x0B92
	.short 0xF4F8, 0x0B97
	.short 0xF4FC, 0x0B9B
	.short 0xF501, 0x0B9F
	.short 0xF505, 0x0BA3
	.short 0xF50A, 0x0BA8
	.short 0xF50E, 0x0BAC
	.short 0xF513, 0x0BB0
	.short 0xF518, 0x0BB5
	.short 0xF51C, 0x0BB9
	.short 0xF521, 0x0BBD
	.short 0xF525, 0x0BC1
	.short 0xF52A, 0x0BC6
	.short 0xF52F, 0x0BCA
	.short 0xF533, 0x0BCE
	.short 0xF538, 0x0BD2
	.short 0xF53D, 0x0BD7
	.short 0xF541, 0x0BDB
	.short 0xF546, 0x0BDF
	.short 0xF54B, 0x0BE3
	.short 0xF54F, 0x0BE8
	.short 0xF554, 0x0BEC
	.short 0xF559, 0x0BF0
	.short 0xF55D, 0x0BF4
	.short 0xF562, 0x0BF8
	.short 0xF567, 0x0BFC
	.short 0xF56B, 0x0C01
	.short 0xF570, 0x0C05
	.short 0xF575, 0x0C09
	.short 0xF57A, 0x0C0D
	.short 0xF57E, 0x0C11
	.short 0xF583, 0x0C15
	.short 0xF588, 0x0C19
	.short 0xF58D, 0x0C1E
	.short 0xF591, 0x0C22
	.short 0xF596, 0x0C26
	.short 0xF59B, 0x0C2A
	.short 0xF5A0, 0x0C2E
	.short 0xF5A4, 0x0C32
	.short 0xF5A9, 0x0C36
	.short 0xF5AE, 0x0C3A
	.short 0xF5B3, 0x0C3E
	.short 0xF5B8, 0x0C42
	.short 0xF5BC, 0x0C46
	.short 0xF5C1, 0x0C4A
	.short 0xF5C6, 0x0C4E
	.short 0xF5CB, 0x0C52
	.short 0xF5D0, 0x0C56
	.short 0xF5D5, 0x0C5A
	.short 0xF5DA, 0x0C5E
	.short 0xF5DE, 0x0C62
	.short 0xF5E3, 0x0C66
	.short 0xF5E8, 0x0C6A
	.short 0xF5ED, 0x0C6E
	.short 0xF5F2, 0x0C72
	.short 0xF5F7, 0x0C76
	.short 0xF5FC, 0x0C7A
	.short 0xF601, 0x0C7E
	.short 0xF605, 0x0C82
	.short 0xF60A, 0x0C86
	.short 0xF60F, 0x0C8A
	.short 0xF614, 0x0C8E
	.short 0xF619, 0x0C91
	.short 0xF61E, 0x0C95
	.short 0xF623, 0x0C99
	.short 0xF628, 0x0C9D
	.short 0xF62D, 0x0CA1
	.short 0xF632, 0x0CA5
	.short 0xF637, 0x0CA9
	.short 0xF63C, 0x0CAC
	.short 0xF641, 0x0CB0
	.short 0xF646, 0x0CB4
	.short 0xF64B, 0x0CB8
	.short 0xF650, 0x0CBC
	.short 0xF655, 0x0CC0
	.short 0xF65A, 0x0CC3
	.short 0xF65F, 0x0CC7
	.short 0xF664, 0x0CCB
	.short 0xF669, 0x0CCF
	.short 0xF66E, 0x0CD2
	.short 0xF673, 0x0CD6
	.short 0xF678, 0x0CDA
	.short 0xF67D, 0x0CDE
	.short 0xF682, 0x0CE1
	.short 0xF687, 0x0CE5
	.short 0xF68C, 0x0CE9
	.short 0xF691, 0x0CED
	.short 0xF696, 0x0CF0
	.short 0xF69B, 0x0CF4
	.short 0xF6A1, 0x0CF8
	.short 0xF6A6, 0x0CFB
	.short 0xF6AB, 0x0CFF
	.short 0xF6B0, 0x0D03
	.short 0xF6B5, 0x0D06
	.short 0xF6BA, 0x0D0A
	.short 0xF6BF, 0x0D0E
	.short 0xF6C4, 0x0D11
	.short 0xF6C9, 0x0D15
	.short 0xF6CF, 0x0D18
	.short 0xF6D4, 0x0D1C
	.short 0xF6D9, 0x0D20
	.short 0xF6DE, 0x0D23
	.short 0xF6E3, 0x0D27
	.short 0xF6E8, 0x0D2A
	.short 0xF6EE, 0x0D2E
	.short 0xF6F3, 0x0D32
	.short 0xF6F8, 0x0D35
	.short 0xF6FD, 0x0D39
	.short 0xF702, 0x0D3C
	.short 0xF708, 0x0D40
	.short 0xF70D, 0x0D43
	.short 0xF712, 0x0D47
	.short 0xF717, 0x0D4A
	.short 0xF71C, 0x0D4E
	.short 0xF722, 0x0D51
	.short 0xF727, 0x0D55
	.short 0xF72C, 0x0D58
	.short 0xF731, 0x0D5C
	.short 0xF737, 0x0D5F
	.short 0xF73C, 0x0D62
	.short 0xF741, 0x0D66
	.short 0xF746, 0x0D69
	.short 0xF74C, 0x0D6D
	.short 0xF751, 0x0D70
	.short 0xF756, 0x0D74
	.short 0xF75B, 0x0D77
	.short 0xF761, 0x0D7A
	.short 0xF766, 0x0D7E
	.short 0xF76B, 0x0D81
	.short 0xF771, 0x0D85
	.short 0xF776, 0x0D88
	.short 0xF77B, 0x0D8B
	.short 0xF781, 0x0D8F
	.short 0xF786, 0x0D92
	.short 0xF78B, 0x0D95
	.short 0xF791, 0x0D99
	.short 0xF796, 0x0D9C
	.short 0xF79B, 0x0D9F
	.short 0xF7A1, 0x0DA2
	.short 0xF7A6, 0x0DA6
	.short 0xF7AB, 0x0DA9
	.short 0xF7B1, 0x0DAC
	.short 0xF7B6, 0x0DB0
	.short 0xF7BB, 0x0DB3
	.short 0xF7C1, 0x0DB6
	.short 0xF7C6, 0x0DB9
	.short 0xF7CC, 0x0DBC
	.short 0xF7D1, 0x0DC0
	.short 0xF7D6, 0x0DC3
	.short 0xF7DC, 0x0DC6
	.short 0xF7E1, 0x0DC9
	.short 0xF7E7, 0x0DCC
	.short 0xF7EC, 0x0DD0
	.short 0xF7F2, 0x0DD3
	.short 0xF7F7, 0x0DD6
	.short 0xF7FC, 0x0DD9
	.short 0xF802, 0x0DDC
	.short 0xF807, 0x0DDF
	.short 0xF80D, 0x0DE3
	.short 0xF812, 0x0DE6
	.short 0xF818, 0x0DE9
	.short 0xF81D, 0x0DEC
	.short 0xF823, 0x0DEF
	.short 0xF828, 0x0DF2
	.short 0xF82E, 0x0DF5
	.short 0xF833, 0x0DF8
	.short 0xF838, 0x0DFB
	.short 0xF83E, 0x0DFE
	.short 0xF843, 0x0E01
	.short 0xF849, 0x0E04
	.short 0xF84E, 0x0E07
	.short 0xF854, 0x0E0A
	.short 0xF85A, 0x0E0D
	.short 0xF85F, 0x0E10
	.short 0xF865, 0x0E13
	.short 0xF86A, 0x0E16
	.short 0xF870, 0x0E19
	.short 0xF875, 0x0E1C
	.short 0xF87B, 0x0E1F
	.short 0xF880, 0x0E22
	.short 0xF886, 0x0E25
	.short 0xF88B, 0x0E28
	.short 0xF891, 0x0E2B
	.short 0xF896, 0x0E2E
	.short 0xF89C, 0x0E31
	.short 0xF8A2, 0x0E34
	.short 0xF8A7, 0x0E37
	.short 0xF8AD, 0x0E3A
	.short 0xF8B2, 0x0E3C
	.short 0xF8B8, 0x0E3F
	.short 0xF8BE, 0x0E42
	.short 0xF8C3, 0x0E45
	.short 0xF8C9, 0x0E48
	.short 0xF8CE, 0x0E4B
	.short 0xF8D4, 0x0E4D
	.short 0xF8DA, 0x0E50
	.short 0xF8DF, 0x0E53
	.short 0xF8E5, 0x0E56
	.short 0xF8EB, 0x0E59
	.short 0xF8F0, 0x0E5B
	.short 0xF8F6, 0x0E5E
	.short 0xF8FB, 0x0E61
	.short 0xF901, 0x0E64
	.short 0xF907, 0x0E66
	.short 0xF90C, 0x0E69
	.short 0xF912, 0x0E6C
	.short 0xF918, 0x0E6F
	.short 0xF91D, 0x0E71
	.short 0xF923, 0x0E74
	.short 0xF929, 0x0E77
	.short 0xF92E, 0x0E79
	.short 0xF934, 0x0E7C
	.short 0xF93A, 0x0E7F
	.short 0xF93F, 0x0E81
	.short 0xF945, 0x0E84
	.short 0xF94B, 0x0E87
	.short 0xF951, 0x0E89
	.short 0xF956, 0x0E8C
	.short 0xF95C, 0x0E8F
	.short 0xF962, 0x0E91
	.short 0xF967, 0x0E94
	.short 0xF96D, 0x0E96
	.short 0xF973, 0x0E99
	.short 0xF979, 0x0E9B
	.short 0xF97E, 0x0E9E
	.short 0xF984, 0x0EA1
	.short 0xF98A, 0x0EA3
	.short 0xF990, 0x0EA6
	.short 0xF995, 0x0EA8
	.short 0xF99B, 0x0EAB
	.short 0xF9A1, 0x0EAD
	.short 0xF9A7, 0x0EB0
	.short 0xF9AC, 0x0EB2
	.short 0xF9B2, 0x0EB5
	.short 0xF9B8, 0x0EB7
	.short 0xF9BE, 0x0EBA
	.short 0xF9C4, 0x0EBC
	.short 0xF9C9, 0x0EBF
	.short 0xF9CF, 0x0EC1
	.short 0xF9D5, 0x0EC3
	.short 0xF9DB, 0x0EC6
	.short 0xF9E1, 0x0EC8
	.short 0xF9E6, 0x0ECB
	.short 0xF9EC, 0x0ECD
	.short 0xF9F2, 0x0ECF
	.short 0xF9F8, 0x0ED2
	.short 0xF9FE, 0x0ED4
	.short 0xFA03, 0x0ED6
	.short 0xFA09, 0x0ED9
	.short 0xFA0F, 0x0EDB
	.short 0xFA15, 0x0EDD
	.short 0xFA1B, 0x0EE0
	.short 0xFA21, 0x0EE2
	.short 0xFA26, 0x0EE4
	.short 0xFA2C, 0x0EE7
	.short 0xFA32, 0x0EE9
	.short 0xFA38, 0x0EEB
	.short 0xFA3E, 0x0EEE
	.short 0xFA44, 0x0EF0
	.short 0xFA4A, 0x0EF2
	.short 0xFA4F, 0x0EF4
	.short 0xFA55, 0x0EF7
	.short 0xFA5B, 0x0EF9
	.short 0xFA61, 0x0EFB
	.short 0xFA67, 0x0EFD
	.short 0xFA6D, 0x0EFF
	.short 0xFA73, 0x0F02
	.short 0xFA79, 0x0F04
	.short 0xFA7F, 0x0F06
	.short 0xFA84, 0x0F08
	.short 0xFA8A, 0x0F0A
	.short 0xFA90, 0x0F0C
	.short 0xFA96, 0x0F0E
	.short 0xFA9C, 0x0F11
	.short 0xFAA2, 0x0F13
	.short 0xFAA8, 0x0F15
	.short 0xFAAE, 0x0F17
	.short 0xFAB4, 0x0F19
	.short 0xFABA, 0x0F1B
	.short 0xFAC0, 0x0F1D
	.short 0xFAC6, 0x0F1F
	.short 0xFACC, 0x0F21
	.short 0xFAD1, 0x0F23
	.short 0xFAD7, 0x0F25
	.short 0xFADD, 0x0F27
	.short 0xFAE3, 0x0F29
	.short 0xFAE9, 0x0F2B
	.short 0xFAEF, 0x0F2D
	.short 0xFAF5, 0x0F2F
	.short 0xFAFB, 0x0F31
	.short 0xFB01, 0x0F33
	.short 0xFB07, 0x0F35
	.short 0xFB0D, 0x0F37
	.short 0xFB13, 0x0F39
	.short 0xFB19, 0x0F3B
	.short 0xFB1F, 0x0F3D
	.short 0xFB25, 0x0F3F
	.short 0xFB2B, 0x0F41
	.short 0xFB31, 0x0F43
	.short 0xFB37, 0x0F45
	.short 0xFB3D, 0x0F46
	.short 0xFB43, 0x0F48
	.short 0xFB49, 0x0F4A
	.short 0xFB4F, 0x0F4C
	.short 0xFB55, 0x0F4E
	.short 0xFB5B, 0x0F50
	.short 0xFB61, 0x0F51
	.short 0xFB67, 0x0F53
	.short 0xFB6D, 0x0F55
	.short 0xFB73, 0x0F57
	.short 0xFB79, 0x0F59
	.short 0xFB7F, 0x0F5A
	.short 0xFB85, 0x0F5C
	.short 0xFB8B, 0x0F5E
	.short 0xFB91, 0x0F60
	.short 0xFB97, 0x0F61
	.short 0xFB9D, 0x0F63
	.short 0xFBA3, 0x0F65
	.short 0xFBA9, 0x0F67
	.short 0xFBAF, 0x0F68
	.short 0xFBB5, 0x0F6A
	.short 0xFBBC, 0x0F6C
	.short 0xFBC2, 0x0F6D
	.short 0xFBC8, 0x0F6F
	.short 0xFBCE, 0x0F71
	.short 0xFBD4, 0x0F72
	.short 0xFBDA, 0x0F74
	.short 0xFBE0, 0x0F76
	.short 0xFBE6, 0x0F77
	.short 0xFBEC, 0x0F79
	.short 0xFBF2, 0x0F7A
	.short 0xFBF8, 0x0F7C
	.short 0xFBFE, 0x0F7D
	.short 0xFC04, 0x0F7F
	.short 0xFC0A, 0x0F81
	.short 0xFC11, 0x0F82
	.short 0xFC17, 0x0F84
	.short 0xFC1D, 0x0F85
	.short 0xFC23, 0x0F87
	.short 0xFC29, 0x0F88
	.short 0xFC2F, 0x0F8A
	.short 0xFC35, 0x0F8B
	.short 0xFC3B, 0x0F8D
	.short 0xFC41, 0x0F8E
	.short 0xFC47, 0x0F90
	.short 0xFC4E, 0x0F91
	.short 0xFC54, 0x0F93
	.short 0xFC5A, 0x0F94
	.short 0xFC60, 0x0F95
	.short 0xFC66, 0x0F97
	.short 0xFC6C, 0x0F98
	.short 0xFC72, 0x0F9A
	.short 0xFC78, 0x0F9B
	.short 0xFC7F, 0x0F9C
	.short 0xFC85, 0x0F9E
	.short 0xFC8B, 0x0F9F
	.short 0xFC91, 0x0FA1
	.short 0xFC97, 0x0FA2
	.short 0xFC9D, 0x0FA3
	.short 0xFCA3, 0x0FA5
	.short 0xFCAA, 0x0FA6
	.short 0xFCB0, 0x0FA7
	.short 0xFCB6, 0x0FA8
	.short 0xFCBC, 0x0FAA
	.short 0xFCC2, 0x0FAB
	.short 0xFCC8, 0x0FAC
	.short 0xFCCE, 0x0FAE
	.short 0xFCD5, 0x0FAF
	.short 0xFCDB, 0x0FB0
	.short 0xFCE1, 0x0FB1
	.short 0xFCE7, 0x0FB3
	.short 0xFCED, 0x0FB4
	.short 0xFCF3, 0x0FB5
	.short 0xFCFA, 0x0FB6
	.short 0xFD00, 0x0FB7
	.short 0xFD06, 0x0FB8
	.short 0xFD0C, 0x0FBA
	.short 0xFD12, 0x0FBB
	.short 0xFD18, 0x0FBC
	.short 0xFD1F, 0x0FBD
	.short 0xFD25, 0x0FBE
	.short 0xFD2B, 0x0FBF
	.short 0xFD31, 0x0FC0
	.short 0xFD37, 0x0FC2
	.short 0xFD3E, 0x0FC3
	.short 0xFD44, 0x0FC4
	.short 0xFD4A, 0x0FC5
	.short 0xFD50, 0x0FC6
	.short 0xFD56, 0x0FC7
	.short 0xFD5D, 0x0FC8
	.short 0xFD63, 0x0FC9
	.short 0xFD69, 0x0FCA
	.short 0xFD6F, 0x0FCB
	.short 0xFD75, 0x0FCC
	.short 0xFD7C, 0x0FCD
	.short 0xFD82, 0x0FCE
	.short 0xFD88, 0x0FCF
	.short 0xFD8E, 0x0FD0
	.short 0xFD94, 0x0FD1
	.short 0xFD9B, 0x0FD2
	.short 0xFDA1, 0x0FD3
	.short 0xFDA7, 0x0FD4
	.short 0xFDAD, 0x0FD5
	.short 0xFDB3, 0x0FD5
	.short 0xFDBA, 0x0FD6
	.short 0xFDC0, 0x0FD7
	.short 0xFDC6, 0x0FD8
	.short 0xFDCC, 0x0FD9
	.short 0xFDD3, 0x0FDA
	.short 0xFDD9, 0x0FDB
	.short 0xFDDF, 0x0FDC
	.short 0xFDE5, 0x0FDC
	.short 0xFDEB, 0x0FDD
	.short 0xFDF2, 0x0FDE
	.short 0xFDF8, 0x0FDF
	.short 0xFDFE, 0x0FE0
	.short 0xFE04, 0x0FE0
	.short 0xFE0B, 0x0FE1
	.short 0xFE11, 0x0FE2
	.short 0xFE17, 0x0FE3
	.short 0xFE1D, 0x0FE3
	.short 0xFE24, 0x0FE4
	.short 0xFE2A, 0x0FE5
	.short 0xFE30, 0x0FE6
	.short 0xFE36, 0x0FE6
	.short 0xFE3D, 0x0FE7
	.short 0xFE43, 0x0FE8
	.short 0xFE49, 0x0FE8
	.short 0xFE4F, 0x0FE9
	.short 0xFE56, 0x0FEA
	.short 0xFE5C, 0x0FEA
	.short 0xFE62, 0x0FEB
	.short 0xFE68, 0x0FEC
	.short 0xFE6F, 0x0FEC
	.short 0xFE75, 0x0FED
	.short 0xFE7B, 0x0FED
	.short 0xFE81, 0x0FEE
	.short 0xFE88, 0x0FEF
	.short 0xFE8E, 0x0FEF
	.short 0xFE94, 0x0FF0
	.short 0xFE9A, 0x0FF0
	.short 0xFEA1, 0x0FF1
	.short 0xFEA7, 0x0FF1
	.short 0xFEAD, 0x0FF2
	.short 0xFEB3, 0x0FF2
	.short 0xFEBA, 0x0FF3
	.short 0xFEC0, 0x0FF3
	.short 0xFEC6, 0x0FF4
	.short 0xFECC, 0x0FF4
	.short 0xFED3, 0x0FF5
	.short 0xFED9, 0x0FF5
	.short 0xFEDF, 0x0FF6
	.short 0xFEE5, 0x0FF6
	.short 0xFEEC, 0x0FF7
	.short 0xFEF2, 0x0FF7
	.short 0xFEF8, 0x0FF8
	.short 0xFEFF, 0x0FF8
	.short 0xFF05, 0x0FF8
	.short 0xFF0B, 0x0FF9
	.short 0xFF11, 0x0FF9
	.short 0xFF18, 0x0FF9
	.short 0xFF1E, 0x0FFA
	.short 0xFF24, 0x0FFA
	.short 0xFF2A, 0x0FFA
	.short 0xFF31, 0x0FFB
	.short 0xFF37, 0x0FFB
	.short 0xFF3D, 0x0FFB
	.short 0xFF44, 0x0FFC
	.short 0xFF4A, 0x0FFC
	.short 0xFF50, 0x0FFC
	.short 0xFF56, 0x0FFC
	.short 0xFF5D, 0x0FFD
	.short 0xFF63, 0x0FFD
	.short 0xFF69, 0x0FFD
	.short 0xFF70, 0x0FFD
	.short 0xFF76, 0x0FFE
	.short 0xFF7C, 0x0FFE
	.short 0xFF82, 0x0FFE
	.short 0xFF89, 0x0FFE
	.short 0xFF8F, 0x0FFE
	.short 0xFF95, 0x0FFF
	.short 0xFF9B, 0x0FFF
	.short 0xFFA2, 0x0FFF
	.short 0xFFA8, 0x0FFF
	.short 0xFFAE, 0x0FFF
	.short 0xFFB5, 0x0FFF
	.short 0xFFBB, 0x0FFF
	.short 0xFFC1, 0x1000
	.short 0xFFC7, 0x1000
	.short 0xFFCE, 0x1000
	.short 0xFFD4, 0x1000
	.short 0xFFDA, 0x1000
	.short 0xFFE1, 0x1000
	.short 0xFFE7, 0x1000
	.short 0xFFED, 0x1000
	.short 0xFFF3, 0x1000
	.short 0xFFFA, 0x1000

	.data

	.public NNS_GfdDefaultFuncAllocTexVram
NNS_GfdDefaultFuncAllocTexVram:
	.word AllocTexVram_
	.public NNS_GfdDefaultFuncFreeTexVram
NNS_GfdDefaultFuncFreeTexVram:
	.word FreeTexVram_
	.public NNS_GfdDefaultFuncAllocPlttVram
NNS_GfdDefaultFuncAllocPlttVram:
	.word AllocPlttVram_
	.public NNS_GfdDefaultFuncFreePlttVram
NNS_GfdDefaultFuncFreePlttVram:
	.word FreePlttVram_
_02110934:
	.word _02110950
	.word _02110998
_0211093C:
	.word _021109B0
	.word _02110998
	.word _02110950
	.word _02110980
	.word _02110968
_02110950:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
_02110968:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x00
_02110980:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x03, 0x00
_02110998:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x04, 0x00
_021109B0:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x06, 0x00
_021109C8:
	.word CpuLoadOAMMain_
	.word CpuLoadOAMSub_
	.word 0
	.word 0
	.word 0
_021109DC:
	.byte 0xFE, 0xFF, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF
_021109E4:
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_021109FC:
	.byte 0x00, 0xF0, 0xFF, 0xFF
_02110A00:
	.byte 0x05, 0x00, 0x00, 0x00
_02110A04:
	.word NNSi_G3dAnmCalcNsBva
_02110A08:
	.word NNSi_G3dAnmCalcNsBca
	.public _02110A0C
_02110A0C:
	.word NNSi_G3dAnmCalcNsBta
_02110A10:
	.word NNSi_G3dAnmCalcNsBtp
_02110A14:
	.word NNSi_G3dAnmCalcNsBma
_02110A18:
	.word NNSi_G3dAnmBlendVis
_02110A1C:
	.word NNSi_G3dAnmBlendJnt
_02110A20:
	.word NNSi_G3dAnmBlendMat
_02110A24:
	.byte 0x4D, 0x00, 0x41, 0x4D
_02110A28:
	.word NNSi_G3dAnmObjInitNsBma
	.byte 0x4D, 0x00, 0x50, 0x54
	.word NNSi_G3dAnmObjInitNsBtp
	.byte 0x4D, 0x00, 0x41, 0x54
	.word NNSi_G3dAnmObjInitNsBta
	.byte 0x56, 0x00, 0x41, 0x56
	.word NNSi_G3dAnmObjInitNsBva
	.byte 0x4A, 0x00, 0x41, 0x43
	.word NNSi_G3dAnmObjInitNsBca
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02110A74:
	.word NNSi_G3dSendJointSRTBasic
	.word NNSi_G3dSendJointSRTMaya
	.word NNSi_G3dSendJointSRTSi3d
_02110A80:
	.word NNSi_G3dGetJointScaleBasic
	.word NNSi_G3dGetJointScaleMaya
	.word NNSi_G3dGetJointScaleSi3d
_02110A8C:
	.word NNSi_G3dSendTexSRTMaya
	.word NNSi_G3dSendTexSRTSi3d
	.word NNSi_G3dSendTexSRT3dsMax
	.word NNSi_G3dSendTexSRTXsi
_02110A9C:
	.byte 0x2A, 0x00, 0x00, 0x00
_02110AA0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00
_02110AA8:
	.byte 0x00, 0x00, 0x00, 0x00
_02110AAC:
	.word NNSi_G3dFuncSbc_MAT_InternalDefault
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110ABC:
	.word NNSi_G3dFuncSbc_SHP_InternalDefault
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110ACC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
_02110B0C:
	.byte 0x12, 0x10, 0x17, 0x1B
_02110B10:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_02110B18:
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
_02110B3C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110B48:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02110B54:
	.byte 0x12, 0x10, 0x17, 0x1B
_02110B58:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_02110B60:
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00
_02110B84:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110B90:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_02110B9C:
	.word NNSi_G3dFuncSbc_NOP
	.word NNSi_G3dFuncSbc_RET
	.word NNSi_G3dFuncSbc_NODE
	.word NNSi_G3dFuncSbc_MTX
	.word NNSi_G3dFuncSbc_MAT
	.word NNSi_G3dFuncSbc_SHP
	.word NNSi_G3dFuncSbc_NODEDESC
	.word NNSi_G3dFuncSbc_BB
	.word NNSi_G3dFuncSbc_BBY
	.word NNSi_G3dFuncSbc_NODEMIX
	.word NNSi_G3dFuncSbc_CALLDL
	.word NNSi_G3dFuncSbc_POSSCALE
	.word NNSi_G3dFuncSbc_ENVMAP
	.word NNSi_G3dFuncSbc_PRJMAP
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
	.word 0x00000000
_02110C1C:
	.word texmtxCalc_flag_
	.word texmtxCalc_flagS_
	.word texmtxCalc_flagR_
	.word texmtxCalc_flagRS_
	.word texmtxCalc_flagT_
	.word texmtxCalc_flagTS_
	.word texmtxCalc_flagTR_
	.word texmtxCalc_flagTRS_
_02110C3C:
	.word texmtxCalc_flag___3dsmax
	.word texmtxCalc_flagS___3dsmax
	.word texmtxCalc_flagR___3dsmax
	.word texmtxCalc_flagRS___3dsmax
	.word texmtxCalc_flagT___3dsmax
	.word texmtxCalc_flagTS___3dsmax
	.word texmtxCalc_flagTR___3dsmax
	.word texmtxCalc_flagTRS___3dsmax
_02110C5C:
	.word texmtxCalc_flag___xsi
	.word texmtxCalc_flagS___xsi
	.word texmtxCalc_flagR___xsi
	.word texmtxCalc_flagRS___xsi
	.word texmtxCalc_flagT___xsi
	.word texmtxCalc_flagTS___xsi
	.word texmtxCalc_flagTR___xsi
	.word texmtxCalc_flagTRS___xsi
