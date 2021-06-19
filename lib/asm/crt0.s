	.include "asm/macros.inc"
	.text
	.syntax unified

	arm_func_start _start
_start: @ 0x02000800
	mov ip, #0x4000000
	str ip, [ip, #0x208]
_02000808:
	ldrh r0, [ip, #6]
	cmp r0, #0
	bne _02000808
	bl init_cp15
	mov r0, #0x13
	msr cpsr_c, r0
	ldr r0, _02000930 @ =OSi_IntrTable
	add r0, r0, #0x3fc0
	mov sp, r0
	mov r0, #0x12
	msr cpsr_c, r0
	ldr r0, _02000930 @ =OSi_IntrTable
	add r0, r0, #0x3fc0
	sub r0, r0, #0x40
	sub sp, r0, #4
	tst sp, #4
	beq _02000850
	b _02000854
_02000850:
	sub sp, sp, #4
_02000854:
	ldr r1, _02000934 @ =0x00000800
	sub r1, r0, r1
	mov r0, #0x1f
	msr cpsr_fsxc, r0
	sub sp, r1, #4
	mov r0, #0
	ldr r1, _02000930 @ =OSi_IntrTable
	mov r2, #0x4000
	bl INITi_CpuClear32
	mov r0, #0
	ldr r1, _02000938 @ =0x05000000
	mov r2, #0x400
	bl INITi_CpuClear32
	mov r0, #0x200
	ldr r1, _0200093C @ =0x07000000
	mov r2, #0x400
	bl INITi_CpuClear32
	ldr r1, _02000940 @ =_start_ModuleParams
	ldr r0, [r1, #0x14]
	bl MIi_UncompressBackward
	bl do_autoload
	ldr r0, _02000940 @ =_start_ModuleParams
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
	mcr p15, #0, r0, c7, c10, #4
	mcr p15, #0, r1, c7, c5, #1
	mcr p15, #0, r1, c7, c14, #1
	add r1, r1, #0x20
	cmp r1, r2
	blt _020008D4
	ldr r1, _02000944 @ =0x027FFF9C
	str r0, [r1]
	ldr r1, _02000930 @ =OSi_IntrTable
	add r1, r1, #0x3fc0
	add r1, r1, #0x3c
	ldr r0, _02000948 @ =FUN_01FF8000
	str r0, [r1]
	bl _fp_init
	bl NitroStartUp
	bl __call_static_initializers
	ldr r1, _0200094C @ =NitroMain
	ldr lr, _02000950 @ =0xFFFF0000
	tst sp, #4
	bne _02000928
	b _0200092C
_02000928:
	sub sp, sp, #4
_0200092C:
	bx r1
	.align 2, 0
_02000930: .4byte OSi_IntrTable
_02000934: .4byte 0x00000800
_02000938: .4byte 0x05000000
_0200093C: .4byte 0x07000000
_02000940: .4byte _start_ModuleParams
_02000944: .4byte 0x027FFF9C
_02000948: .4byte FUN_01FF8000
_0200094C: .4byte NitroMain
_02000950: .4byte 0xFFFF0000
	arm_func_end _start

	arm_func_start INITi_CpuClear32
INITi_CpuClear32: @ 0x02000954
	add ip, r1, r2
_02000958:
	cmp r1, ip
	blt _02000964
	b _02000968
_02000964:
	stm r1!, {r0}
_02000968:
	blt _02000958
	bx lr
	arm_func_end INITi_CpuClear32

	arm_func_start MIi_UncompressBackward
MIi_UncompressBackward: @ 0x02000970
	cmp r0, #0
	beq _02000A18
	push {r4, r5, r6, r7}
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
	lsl r5, r5, #1
	bgt _020009A4
_020009F4:
	mov r0, #0
	bic r3, r1, #0x1f
_020009FC:
	mcr p15, #0, r0, c7, c10, #4
	mcr p15, #0, r3, c7, c5, #1
	mcr p15, #0, r3, c7, c14, #1
	add r3, r3, #0x20
	cmp r3, r4
	blt _020009FC
	pop {r4, r5, r6, r7}
_02000A18:
	bx lr
	arm_func_end MIi_UncompressBackward

	arm_func_start do_autoload
do_autoload: @ 0x02000A1C
	ldr r0, _02000AA8 @ =_start_ModuleParams
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
	mcr p15, #0, r7, c7, c10, #4
	mcr p15, #0, r4, c7, c5, #1
	mcr p15, #0, r4, c7, c14, #1
	add r4, r4, #0x20
	cmp r4, r6
	blt _02000A88
	b _02000A2C
_02000AA4:
	b _02000AAC
	.align 2, 0
_02000AA8: .4byte _start_ModuleParams
	arm_func_end do_autoload
_02000AAC:
	bx lr
	arm_func_end do_autoload

	arm_func_start init_cp15
init_cp15: @ 0x02000AB0
	mrc p15, #0, r0, c1, c0, #0
	ldr r1, _02000B68 @ =0x000F9005
	bic r0, r0, r1
	mcr p15, #0, r0, c1, c0, #0
	mov r0, #0
	mcr p15, #0, r0, c7, c5, #0
	mcr p15, #0, r0, c7, c6, #0
	mcr p15, #0, r0, c7, c10, #4
	ldr r0, _02000B6C @ =0x04000033
	mcr p15, #0, r0, c6, c0, #0
	ldr r0, _02000B70 @ =0x0200002D
	mcr p15, #0, r0, c6, c1, #0
	ldr r0, _02000B74 @ =0x027E0021
	mcr p15, #0, r0, c6, c2, #0
	ldr r0, _02000B78 @ =0x08000035
	mcr p15, #0, r0, c6, c3, #0
	ldr r0, _02000B7C @ =OSi_IntrTable
	orr r0, r0, #0x1a
	orr r0, r0, #1
	mcr p15, #0, r0, c6, c4, #0
	ldr r0, _02000B80 @ =0x0100002F
	mcr p15, #0, r0, c6, c5, #0
	ldr r0, _02000B84 @ =0xFFFF001D
	mcr p15, #0, r0, c6, c6, #0
	ldr r0, _02000B88 @ =0x027FF017
	mcr p15, #0, r0, c6, c7, #0
	mov r0, #0x20
	mcr p15, #0, r0, c9, c1, #1
	ldr r0, _02000B7C @ =OSi_IntrTable
	orr r0, r0, #0xa
	mcr p15, #0, r0, c9, c1, #0
	mov r0, #0x42
	mcr p15, #0, r0, c2, c0, #1
	mov r0, #0x42
	mcr p15, #0, r0, c2, c0, #0
	mov r0, #2
	mcr p15, #0, r0, c3, c0, #0
	ldr r0, _02000B8C @ =0x05100011
	mcr p15, #0, r0, c5, c0, #3
	ldr r0, _02000B90 @ =0x15111011
	mcr p15, #0, r0, c5, c0, #2
	mrc p15, #0, r0, c1, c0, #0
	ldr r1, _02000B94 @ =0x0005707D
	orr r0, r0, r1
	mcr p15, #0, r0, c1, c0, #0
	bx lr
	.align 2, 0
_02000B68: .4byte 0x000F9005
_02000B6C: .4byte 0x04000033
_02000B70: .4byte 0x0200002D
_02000B74: .4byte 0x027E0021
_02000B78: .4byte 0x08000035
_02000B7C: .4byte OSi_IntrTable
_02000B80: .4byte 0x0100002F
_02000B84: .4byte 0xFFFF001D
_02000B88: .4byte 0x027FF017
_02000B8C: .4byte 0x05100011
_02000B90: .4byte 0x15111011
_02000B94: .4byte 0x0005707D
	arm_func_end init_cp15

	arm_func_start NitroStartUp
NitroStartUp: @ 0x02000B98
	bx lr
	arm_func_end NitroStartUp

	arm_func_start OSi_ReferSymbol
OSi_ReferSymbol: @ 0x02000B9C
	bx lr
	arm_func_end OSi_ReferSymbol

	.rodata
_start_ModuleParams: @ 0x02000BA0
	.byte 0xE0, 0x1E, 0x11, 0x02, 0xF8, 0x1E, 0x11, 0x02, 0x60, 0x18, 0x11, 0x02, 0x60, 0x18, 0x11, 0x02
	.byte 0x00, 0x59, 0x1E, 0x02, 0x14, 0xA3, 0x0B, 0x02, 0x33, 0x75, 0x02, 0x04, 0x21, 0x06, 0xC0, 0xDE
	.byte 0xDE, 0xC0, 0x06, 0x21
_version_NINTENDO_DWC: @ 0x02000BC4
	.byte 0x5B, 0x53, 0x44, 0x4B, 0x2B, 0x4E, 0x49, 0x4E, 0x54, 0x45, 0x4E, 0x44
	.byte 0x4F, 0x3A, 0x44, 0x57, 0x43, 0x32, 0x2E, 0x32, 0x2E, 0x33, 0x30, 0x30, 0x30, 0x38, 0x2E, 0x30
	.byte 0x38, 0x30, 0x36, 0x33, 0x30, 0x2E, 0x31, 0x39, 0x30, 0x36, 0x5F, 0x44, 0x57, 0x43, 0x5F, 0x32
	.byte 0x5F, 0x32, 0x5F, 0x50, 0x4C, 0x55, 0x53, 0x38, 0x5D, 0x00, 0x00, 0x00
_version_NINTENDO_WiFi: @ 0x02000BFC
	.byte 0x5B, 0x53, 0x44, 0x4B
	.byte 0x2B, 0x4E, 0x49, 0x4E, 0x54, 0x45, 0x4E, 0x44, 0x4F, 0x3A, 0x57, 0x69, 0x46, 0x69, 0x32, 0x2E
	.byte 0x31, 0x2E, 0x33, 0x30, 0x30, 0x30, 0x33, 0x2E, 0x30, 0x37, 0x30, 0x39, 0x32, 0x30, 0x30, 0x32
	.byte 0x32, 0x39, 0x5D, 0x00
_version_UBIQUITOUS_CPS: @ 0x02000C24
	.byte 0x5B, 0x53, 0x44, 0x4B, 0x2B, 0x55, 0x42, 0x49, 0x51, 0x55, 0x49, 0x54
	.byte 0x4F, 0x55, 0x53, 0x3A, 0x43, 0x50, 0x53, 0x5D, 0x00, 0x00, 0x00, 0x00
_version_UBIQUITOUS_SSL: @ 0x02000C3C
	.byte 0x5B, 0x53, 0x44, 0x4B
	.byte 0x2B, 0x55, 0x42, 0x49, 0x51, 0x55, 0x49, 0x54, 0x4F, 0x55, 0x53, 0x3A, 0x53, 0x53, 0x4C, 0x5D
	.byte 0x00, 0x00, 0x00, 0x00
_version_Abiosso_libVCT: @ 0x02000C54
	.byte 0x5B, 0x53, 0x44, 0x4B, 0x2B, 0x41, 0x62, 0x69, 0x6F, 0x73, 0x73, 0x6F
	.byte 0x3A, 0x6C, 0x69, 0x62, 0x56, 0x43, 0x54, 0x20, 0x31, 0x2E, 0x33, 0x2E, 0x31, 0x5D, 0x00, 0x00
_version_NINTENDO_BACKUP: @ 0x02000C70
	.byte 0x5B, 0x53, 0x44, 0x4B, 0x2B, 0x4E, 0x49, 0x4E, 0x54, 0x45, 0x4E, 0x44, 0x4F, 0x3A, 0x42, 0x41
	.byte 0x43, 0x4B, 0x55, 0x50, 0x5D, 0x00, 0x00, 0x00
_version_NINTENDO_DWC_LOBBY: @ 0x02000C88
	.byte 0x5B, 0x53, 0x44, 0x4B, 0x2B, 0x4E, 0x49, 0x4E
	.byte 0x54, 0x45, 0x4E, 0x44, 0x4F, 0x3A, 0x44, 0x57, 0x43, 0x5F, 0x4C, 0x4F, 0x42, 0x42, 0x59, 0x5D
	.byte 0x00, 0x00, 0x00, 0x00
