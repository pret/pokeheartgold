	.include "asm/macros.inc"
	.include "crt0.inc"
	.include "global.inc"
	.public SDK_AUTOLOAD_DTCM_START
	.public SDK_AUTOLOAD_LIST
	.public SDK_AUTOLOAD_LIST_END
	.public SDK_AUTOLOAD_START
	.public SDK_STATIC_BSS_START
	.public SDK_STATIC_BSS_END
	.public SDK_IRQ_STACKSIZE
	.text

	arm_func_start _start
_start: ; 0x02000800
	mov ip, #0x4000000
	str ip, [ip, #0x208]
_02000808:
	ldrh r0, [ip, #6]
	cmp r0, #0
	bne _02000808
	bl init_cp15
	mov r0, #0x13
	msr cpsr_c, r0
	ldr r0, _02000930 ; =SDK_AUTOLOAD_DTCM_START
	add r0, r0, #0x3fc0
	mov sp, r0
	mov r0, #0x12
	msr cpsr_c, r0
	ldr r0, _02000930 ; =SDK_AUTOLOAD_DTCM_START
	add r0, r0, #0x3fc0
	sub r0, r0, #0x40
	sub sp, r0, #4
	tst sp, #4
	beq _02000850
	b _02000854
_02000850:
	sub sp, sp, #4
_02000854:
	ldr r1, _02000934 ; =SDK_IRQ_STACKSIZE
	sub r1, r0, r1
	mov r0, #0x1f
	msr cpsr_fsxc, r0
	sub sp, r1, #4
	mov r0, #0
	ldr r1, _02000930 ; =SDK_AUTOLOAD_DTCM_START
	mov r2, #0x4000
	bl INITi_CpuClear32
	mov r0, #0
	ldr r1, _02000938 ; =0x05000000
	mov r2, #0x400
	bl INITi_CpuClear32
	mov r0, #0x200
	ldr r1, _0200093C ; =0x07000000
	mov r2, #0x400
	bl INITi_CpuClear32
	ldr r1, _02000940 ; =_start_ModuleParams
	ldr r0, [r1, #0x14]
	bl MIi_UncompressBackward
	bl do_autoload
	ldr r0, _02000940 ; =_start_ModuleParams
	ldr r1, [r0, #0xc]
	ldr r2, [r0, #0x10]
	mov r3, r1
	mov r0, #0
_020008BC:
	cmp r1, r2
	blo _020008C8
	b _020008CC
_020008C8:
	str r0, [r1], #4
_020008CC:
	blo _020008BC
	bic r1, r3, #0x1f
_020008D4:
	mcr p15, 0, r0, c7, c10, 4
	mcr p15, 0, r1, c7, c5, 1
	mcr p15, 0, r1, c7, c14, 1
	add r1, r1, #0x20
	cmp r1, r2
	blt _020008D4
	ldr r1, _02000944 ; =0x027FFF9C
	str r0, [r1]
	ldr r1, _02000930 ; =SDK_AUTOLOAD_DTCM_START
	add r1, r1, #0x3fc0
	add r1, r1, #0x3c
	ldr r0, _02000948 ; =OS_IrqHandler
	str r0, [r1]
	bl _fp_init
	bl NitroStartUp
	bl __call_static_initializers
	ldr r1, _0200094C ; =NitroMain
	ldr lr, _02000950 ; =0xFFFF0000
	tst sp, #4
	bne _02000928
	b _0200092C
_02000928:
	sub sp, sp, #4
_0200092C:
	bx r1
	.align 2, 0
_02000930: .word SDK_AUTOLOAD_DTCM_START
_02000934: .word SDK_IRQ_STACKSIZE
_02000938: .word 0x05000000
_0200093C: .word 0x07000000
_02000940: .word _start_ModuleParams
_02000944: .word 0x027FFF9C
_02000948: .word OS_IrqHandler
_0200094C: .word NitroMain
_02000950: .word 0xFFFF0000
	arm_func_end _start

	arm_func_start INITi_CpuClear32
INITi_CpuClear32: ; 0x02000954
	add ip, r1, r2
_02000958:
	cmp r1, ip
	blt _02000964
	b _02000968
_02000964:
	stmia r1!, {r0}
_02000968:
	blt _02000958
	bx lr
	arm_func_end INITi_CpuClear32

	arm_func_start MIi_UncompressBackward
MIi_UncompressBackward: ; 0x02000970
	cmp r0, #0
	beq _02000A18
	stmdb sp!, {r4, r5, r6, r7}
	ldmdb r0, {r1, r2}
	add r2, r0, r2
	sub r3, r0, r1, lsr #24
	bic r1, r1, #0xff000000
	sub r1, r0, r1
	mov r4, r2
_02000994:
	cmp r3, r1
	ble _020009F4
	ldrb r5, [r3, #-1]!
	mov r6, #8
_020009A4:
	subs r6, r6, #1
	blt _02000994
	tst r5, #0x80
	bne _020009C0
	ldrb r0, [r3, #-1]!
	strb r0, [r2, #-1]!
	b _020009E8
_020009C0:
	ldrb ip, [r3, #-1]!
	ldrb r7, [r3, #-1]!
	orr r7, r7, ip, lsl #8
	bic r7, r7, #0xf000
	add r7, r7, #2
	add ip, ip, #0x20
_020009D8:
	ldrb r0, [r2, r7]
	strb r0, [r2, #-1]!
	subs ip, ip, #0x10
	bge _020009D8
_020009E8:
	cmp r3, r1
	mov r5, r5, lsl #1
	bgt _020009A4
_020009F4:
	mov r0, #0
	bic r3, r1, #0x1f
_020009FC:
	mcr p15, 0, r0, c7, c10, 4
	mcr p15, 0, r3, c7, c5, 1
	mcr p15, 0, r3, c7, c14, 1
	add r3, r3, #0x20
	cmp r3, r4
	blt _020009FC
	ldmia sp!, {r4, r5, r6, r7}
_02000A18:
	bx lr
	arm_func_end MIi_UncompressBackward

	arm_func_start do_autoload
do_autoload: ; 0x02000A1C
	ldr r0, _02000AA8 ; =_start_ModuleParams
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r3, [r0, #8]
_02000A2C:
	cmp r1, r2
	beq _02000AA4
	ldr r5, [r1], #4
	ldr r7, [r1], #4
	add r6, r5, r7
	mov r4, r5
_02000A44:
	cmp r4, r6
	bmi _02000A50
	b _02000A54
_02000A50:
	ldr r7, [r3], #4
_02000A54:
	bmi _02000A5C
	b _02000A60
_02000A5C:
	str r7, [r4], #4
_02000A60:
	bmi _02000A44
	ldr r7, [r1], #4
	add r6, r4, r7
	mov r7, #0
_02000A70:
	cmp r4, r6
	blo _02000A7C
	b _02000A80
_02000A7C:
	str r7, [r4], #4
_02000A80:
	blo _02000A70
	bic r4, r5, #0x1f
_02000A88:
	mcr p15, 0, r7, c7, c10, 4
	mcr p15, 0, r4, c7, c5, 1
	mcr p15, 0, r4, c7, c14, 1
	add r4, r4, #0x20
	cmp r4, r6
	blt _02000A88
	b _02000A2C
_02000AA4:
	b _start_AutoloadDoneCallback
	.align 2, 0
_02000AA8: .word _start_ModuleParams
	arm_func_end do_autoload

	arm_func_start _start_AutoloadDoneCallback
_start_AutoloadDoneCallback:
	bx lr
	arm_func_end _start_AutoloadDoneCallback

	arm_func_start init_cp15
init_cp15: ; 0x02000AB0
	mrc p15, 0, r0, c1, c0, 0
	ldr r1, _02000B68 ; =0x000F9005
	bic r0, r0, r1
	mcr p15, 0, r0, c1, c0, 0
	mov r0, #0
	mcr p15, 0, r0, c7, c5, 0
	mcr p15, 0, r0, c7, c6, 0
	mcr p15, 0, r0, c7, c10, 4
	ldr r0, _02000B6C ; =0x04000033
	mcr p15, 0, r0, c6, c0, 0
	ldr r0, _02000B70 ; =0x0200002D
	mcr p15, 0, r0, c6, c1, 0
	ldr r0, _02000B74 ; =0x027E0021
	mcr p15, 0, r0, c6, c2, 0
	ldr r0, _02000B78 ; =0x08000035
	mcr p15, 0, r0, c6, c3, 0
	ldr r0, _02000B7C ; =OS_IRQTable
	orr r0, r0, #0x1a
	orr r0, r0, #1
	mcr p15, 0, r0, c6, c4, 0
	ldr r0, _02000B80 ; =0x0100002F
	mcr p15, 0, r0, c6, c5, 0
	ldr r0, _02000B84 ; =0xFFFF001D
	mcr p15, 0, r0, c6, c6, 0
	ldr r0, _02000B88 ; =0x027FF017
	mcr p15, 0, r0, c6, c7, 0
	mov r0, #0x20
	mcr p15, 0, r0, c9, c1, 1
	ldr r0, _02000B7C ; =OS_IRQTable
	orr r0, r0, #0xa
	mcr p15, 0, r0, c9, c1, 0
	mov r0, #0x42
	mcr p15, 0, r0, c2, c0, 1
	mov r0, #0x42
	mcr p15, 0, r0, c2, c0, 0
	mov r0, #2
	mcr p15, 0, r0, c3, c0, 0
	ldr r0, _02000B8C ; =0x05100011
	mcr p15, 0, r0, c5, c0, 3
	ldr r0, _02000B90 ; =0x15111011
	mcr p15, 0, r0, c5, c0, 2
	mrc p15, 0, r0, c1, c0, 0
	ldr r1, _02000B94 ; =0x0005707D
	orr r0, r0, r1
	mcr p15, 0, r0, c1, c0, 0
	bx lr
	.align 2, 0
_02000B68: .word 0x000F9005
_02000B6C: .word 0x04000033
_02000B70: .word 0x0200002D
_02000B74: .word 0x027E0021
_02000B78: .word 0x08000035
_02000B7C: .word OS_IRQTable
_02000B80: .word 0x0100002F
_02000B84: .word 0xFFFF001D
_02000B88: .word 0x027FF017
_02000B8C: .word 0x05100011
_02000B90: .word 0x15111011
_02000B94: .word 0x0005707D
	arm_func_end init_cp15

	arm_func_start NitroStartUp
NitroStartUp: ; 0x02000B98
	bx lr
	arm_func_end NitroStartUp

	arm_func_start OSi_ReferSymbol
OSi_ReferSymbol: ; 0x02000B9C
	bx lr
	arm_func_end OSi_ReferSymbol

	.rodata
	.public _start_ModuleParams
_start_ModuleParams: ; 0x02000BA0
	.word SDK_AUTOLOAD_LIST
	.word SDK_AUTOLOAD_LIST_END
	.word SDK_AUTOLOAD_START
	.word SDK_STATIC_BSS_START
	.word SDK_STATIC_BSS_END
	.word 0 ; SDK_COMPRESSED_STATIC_END
	.word 0x04027533 ; SDK_VERSION_ID
	.word 0xDEC00621 ; SDK_NITROCODE_BE
	.word 0x2106C0DE ; SDK_NITROCODE_LE
