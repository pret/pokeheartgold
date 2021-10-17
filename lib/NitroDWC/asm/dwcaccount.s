	.include "asm/macros.inc"
	.include "global.inc"

	.text

	arm_func_start sub_0209FAE4
sub_0209FAE4: ; 0x0209FAE4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldr r0, _0209FB44 ; =_version_NINTENDO_DWC
	mov r5, #0
	bl OSi_ReferSymbol
	mov r0, r6
	bl sub_0209EFF8
	mov r4, r0
	bl sub_0209FA94
	cmp r0, #0
	beq _0209FB1C
	mov r0, r6
	bl sub_0209F80C
	mov r5, #1
_0209FB1C:
	cmp r4, #0
	bge _0209FB34
	cmp r5, #0
	movne r0, #2
	moveq r0, #3
	ldmia sp!, {r4, r5, r6, pc}
_0209FB34:
	cmp r5, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0209FB44: .word _version_NINTENDO_DWC
	arm_func_end sub_0209FAE4

	arm_func_start sub_0209FB48
sub_0209FB48: ; 0x0209FB48
	mvn ip, r3
	tst r1, ip
	movne r0, #0
	bxne lr
	mvn r3, r3, lsl r2
	ldr ip, [r0]
	and r3, ip, r3
	orr r1, r3, r1, lsl r2
	str r1, [r0]
	mov r0, #1
	bx lr
	arm_func_end sub_0209FB48

	arm_func_start sub_0209FB74
sub_0209FB74: ; 0x0209FB74
	ldr r2, [r0]
	ldr r1, _0209FB90 ; =0x000007FF
	ldr r0, [r0, #4]
	and r1, r2, r1
	orr r1, r1, #0
	orr r0, r0, #0
	bx lr
	.align 2, 0
_0209FB90: .word 0x000007FF
	arm_func_end sub_0209FB74

	arm_func_start sub_0209FB94
sub_0209FB94: ; 0x0209FB94
	ldr r0, [r0, #8]
	bx lr
	arm_func_end sub_0209FB94

	arm_func_start sub_0209FB9C
sub_0209FB9C: ; 0x0209FB9C
	ldr r1, [r0, #8]
	ldr r0, [r0, #4]
	orr r1, r1, #0
	orr r0, r0, #0
	bx lr
	arm_func_end sub_0209FB9C

	arm_func_start sub_0209FBB0
sub_0209FBB0: ; 0x0209FBB0
	ldr r0, [r0, #4]
	bx lr
	arm_func_end sub_0209FBB0

	arm_func_start sub_0209FBB8
sub_0209FBB8: ; 0x0209FBB8
	stmdb sp!, {r3, r4, r5, lr}
	ldr r3, _0209FBDC ; =0x000007FF
	mov r4, r1
	mov r1, r2
	mov r2, #0
	mov r5, r0
	bl sub_0209FB48
	str r4, [r5, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0209FBDC: .word 0x000007FF
	arm_func_end sub_0209FBB8

	arm_func_start sub_0209FBE0
sub_0209FBE0: ; 0x0209FBE0
	str r1, [r0, #8]
	bx lr
	arm_func_end sub_0209FBE0

	arm_func_start sub_0209FBE8
sub_0209FBE8: ; 0x0209FBE8
	stmib r0, {r1, r2}
	bx lr
	arm_func_end sub_0209FBE8

	arm_func_start sub_0209FBF0
sub_0209FBF0: ; 0x0209FBF0
	str r1, [r0, #4]
	bx lr
	arm_func_end sub_0209FBF0

	arm_func_start sub_0209FBF8
sub_0209FBF8: ; 0x0209FBF8
	ldr r1, [r0]
	ldr r0, _0209FC08 ; =0x001FFFFF
	and r0, r0, r1, lsr #11
	bx lr
	.align 2, 0
_0209FC08: .word 0x001FFFFF
	arm_func_end sub_0209FBF8

	arm_func_start sub_0209FC0C
sub_0209FC0C: ; 0x0209FC0C
	stmdb sp!, {r3, lr}
	bl sub_0209FBF8
	and r0, r0, #3
	ldmia sp!, {r3, pc}
	arm_func_end sub_0209FC0C

	arm_func_start sub_0209FC1C
sub_0209FC1C: ; 0x0209FC1C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0209FC0C
	cmp r0, #3
	bne _0209FC4C
	mov r0, r4
	bl sub_0209FBF8
	and r0, r0, #4
	cmp r0, #4
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, pc}
_0209FC4C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0209FC1C

	arm_func_start sub_0209FC54
sub_0209FC54: ; 0x0209FC54
	ldr ip, _0209FC5C ; =sub_0209FC0C
	bx ip
	.align 2, 0
_0209FC5C: .word sub_0209FC0C
	arm_func_end sub_0209FC54

	arm_func_start sub_0209FC60
sub_0209FC60: ; 0x0209FC60
	ldr ip, _0209FC70 ; =sub_0209FB48
	ldr r3, _0209FC74 ; =0x001FFFFF
	mov r2, #0xb
	bx ip
	.align 2, 0
_0209FC70: .word sub_0209FB48
_0209FC74: .word 0x001FFFFF
	arm_func_end sub_0209FC60

	arm_func_start sub_0209FC78
sub_0209FC78: ; 0x0209FC78
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl sub_0209FBF8
	bic r1, r0, #3
	mov r0, r5
	orr r1, r1, r4
	bl sub_0209FC60
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_0209FC78

	arm_func_start sub_0209FC9C
sub_0209FC9C: ; 0x0209FC9C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0209FC0C
	cmp r0, #3
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl sub_0209FBF8
	orr r1, r0, #4
	mov r0, r4
	bl sub_0209FC60
	ldmia sp!, {r4, pc}
	arm_func_end sub_0209FC9C

	arm_func_start sub_0209FCC8
sub_0209FCC8: ; 0x0209FCC8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x108
	mov r4, r0
	str r1, [sp, #4]
	add r0, sp, #8
	mov r1, #7
	str r4, [sp]
	bl MATHi_CRC8InitTable
	add r0, sp, #8
	add r1, sp, #0
	mov r2, #8
	bl MATH_CalcCRC8
	and r0, r0, #0x7f
	orr r1, r0, #0
	orr r0, r4, #0
	add sp, sp, #0x108
	ldmia sp!, {r4, pc}
	arm_func_end sub_0209FCC8

	arm_func_start sub_0209FD0C
sub_0209FD0C: ; 0x0209FD0C
	ldr ip, _0209FD24 ; =sub_0209FD28
	mov r3, r0
	mov r0, r1
	mov r1, r2
	ldr r2, [r3, #0x24]
	bx ip
	.align 2, 0
_0209FD24: .word sub_0209FD28
	arm_func_end sub_0209FD0C

	arm_func_start sub_0209FD28
sub_0209FD28: ; 0x0209FD28
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x108
	mov r4, r1
	and r1, r4, #0
	cmp r1, #0
	and r3, r0, #0x80000000
	cmpeq r3, #0
	mov r1, #0
	addne sp, sp, #0x108
	movne r0, r1
	ldmneia sp!, {r4, pc}
	str r0, [sp]
	add r0, sp, #8
	mov r1, #7
	str r2, [sp, #4]
	bl MATHi_CRC8InitTable
	add r0, sp, #8
	add r1, sp, #0
	mov r2, #8
	bl MATH_CalcCRC8
	and r1, r0, #0x7f
	mov r0, r1, asr #0x1f
	cmp r0, #0
	cmpeq r1, r4
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x108
	ldmia sp!, {r4, pc}
	arm_func_end sub_0209FD28

	arm_func_start sub_0209FD98
sub_0209FD98: ; 0x0209FD98
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0209FD28
	cmp r0, #0
	mov r0, #0
	subne r0, r0, #1
	andne r0, r4, r0
	ldmia sp!, {r4, pc}
	arm_func_end sub_0209FD98

	arm_func_start sub_0209FDB8
sub_0209FDB8: ; 0x0209FDB8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr lr, _0209FE20 ; =0x66666667
	add r4, r2, #4
	smull ip, r2, lr, r4
	mov ip, r4, lsr #0x1f
	add r2, ip, r2, asr #1
	cmp r2, #0
	ldr r7, _0209FE24 ; =_021105F4
	mov r6, #0
	ble _0209FE14
	add r4, r3, r2
	sub r4, r4, #1
	mov ip, #0x1f
_0209FDEC:
	and r5, r0, ip
	ldrsb r5, [r7, r5]
	mov r0, r0, lsr #5
	mov lr, r1, lsr #5
	strb r5, [r4, -r6]
	add r6, r6, #1
	orr r0, r0, r1, lsl #27
	mov r1, lr
	cmp r6, r2
	blt _0209FDEC
_0209FE14:
	mov r0, #0
	strb r0, [r3, r2]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0209FE20: .word 0x66666667
_0209FE24: .word _021105F4
	arm_func_end sub_0209FDB8

	arm_func_start sub_0209FE28
sub_0209FE28: ; 0x0209FE28
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x40
	mov r6, r0
	mov r4, r1
	mov r5, r2
	bl sub_0209FB74
	add r3, sp, #0x29
	mov r2, #0x2b
	bl sub_0209FDB8
	mov r0, r6
	bl sub_0209FB94
	mov r1, #0
	mov r2, #0x20
	add r3, sp, #0x14
	bl sub_0209FDB8
	mov r1, r4, lsr #0x18
	and r1, r1, #0xff
	str r1, [sp]
	mov r1, r4, lsr #0x10
	and r1, r1, #0xff
	str r1, [sp, #4]
	mov r1, r4, lsr #8
	and r1, r1, #0xff
	str r1, [sp, #8]
	and r1, r4, #0xff
	str r1, [sp, #0xc]
	add r2, sp, #0x14
	str r2, [sp, #0x10]
	ldr r2, _0209FEB4 ; =_02110618
	mov r0, r5
	mov r1, #0x15
	add r3, sp, #0x29
	bl OS_SNPrintf
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_0209FEB4: .word _02110618
	arm_func_end sub_0209FE28

	arm_func_start sub_0209FEB8
sub_0209FEB8: ; 0x0209FEB8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x400
	mov r4, r1
	mov r1, #0
	mov r2, #0x40
	mov r5, r0
	bl MI_CpuFill8
	mov r0, #0x40
	str r0, [r5]
	mov r0, #0
	str r0, [r5, #0x1c]
	add r0, r5, #4
	str r4, [r5, #0x24]
	bl sub_0209FF34
	add r0, r5, #0x10
	mov r1, #0
	bl sub_0209FC78
	ldr r1, _0209FF30 ; =0xEDB88320
	add r0, sp, #0
	bl MATHi_CRC32InitTableRev
	add r0, sp, #0
	mov r1, r5
	mov r2, #0x3c
	bl MATH_CalcCRC32
	str r0, [r5, #0x3c]
	ldr r0, [r5, #0x20]
	orr r0, r0, #1
	str r0, [r5, #0x20]
	add sp, sp, #0x400
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_0209FF30: .word 0xEDB88320
	arm_func_end sub_0209FEB8

	arm_func_start sub_0209FF34
sub_0209FF34: ; 0x0209FF34
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x34
	mov r6, r0
	add r0, sp, #0
	bl OS_GetLowEntropyData
	mov r3, #1
	add r2, sp, #0
_0209FF50:
	add r0, r2, r3, lsl #2
	ldr r1, [r2, r3, lsl #2]
	ldr r0, [r0, #-4]
	eor r0, r1, r0
	str r0, [r2, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #8
	blo _0209FF50
	add r0, sp, #0x20
	ldr r5, [sp, #0x1c]
	mov r4, #0
	bl sub_0209FA40
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _0209FFA0
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x24]
	mov r0, r6
	bl sub_0209FBB8
	b _0209FFB0
_0209FFA0:
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	mov r0, r6
	bl sub_0209FBB8
_0209FFB0:
	ldr r0, _0209FFEC ; =0x6C078965
	ldr r1, _0209FFF0 ; =0x5D588B65
	umull r3, r2, r5, r0
	mla r2, r5, r1, r2
	ldr r1, _0209FFF4 ; =0x00269EC3
	mla r2, r4, r0, r2
	adds r0, r3, r1
	mov r0, r6
	adc r1, r2, #0
	bl sub_0209FBE0
	mov r0, r6
	mov r1, #1
	bl sub_0209FC78
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, pc}
	.align 2, 0
_0209FFEC: .word 0x6C078965
_0209FFF0: .word 0x5D588B65
_0209FFF4: .word 0x00269EC3
	arm_func_end sub_0209FF34

	arm_func_start sub_0209FFF8
sub_0209FFF8: ; 0x0209FFF8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	add r0, sp, #0
	bl sub_0209FA40
	ldr r0, [sp, #0x10]
	cmp r0, #0
	mov r0, r4
	beq _020A0040
	bl sub_0209FB74
	ldr r2, [sp, #4]
	ldr r3, [sp]
	cmp r2, r1
	cmpeq r3, r0
	moveq r0, #1
	add sp, sp, #0x14
	movne r0, #0
	ldmia sp!, {r3, r4, pc}
_020A0040:
	bl sub_0209FB74
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	cmp r2, r1
	cmpeq r3, r0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_0209FFF8

	arm_func_start sub_020A0064
sub_020A0064: ; 0x020A0064
	stmdb sp!, {r3, lr}
	bl sub_0209FC0C
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A0064

	arm_func_start sub_020A007C
sub_020A007C: ; 0x020A007C
	ldr ip, _020A0088 ; =sub_020A0064
	add r0, r0, #0x10
	bx ip
	.align 2, 0
_020A0088: .word sub_020A0064
	arm_func_end sub_020A007C

	arm_func_start sub_020A008C
sub_020A008C: ; 0x020A008C
	stmdb sp!, {r3, lr}
	bl sub_0209FC0C
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A008C

	arm_func_start sub_020A00A4
sub_020A00A4: ; 0x020A00A4
	ldr ip, _020A00AC ; =sub_020A008C
	bx ip
	.align 2, 0
_020A00AC: .word sub_020A008C
	arm_func_end sub_020A00A4

	arm_func_start sub_020A00B0
sub_020A00B0: ; 0x020A00B0
	ldr ip, _020A00B8 ; =sub_0209FEB8
	bx ip
	.align 2, 0
_020A00B8: .word sub_0209FEB8
	arm_func_end sub_020A00B0

	arm_func_start sub_020A00BC
sub_020A00BC: ; 0x020A00BC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x400
	ldr r1, _020A00FC ; =0xEDB88320
	mov r4, r0
	add r0, sp, #0
	bl MATHi_CRC32InitTableRev
	add r0, sp, #0
	mov r1, r4
	mov r2, #0x3c
	bl MATH_CalcCRC32
	ldr r1, [r4, #0x3c]
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A00FC: .word 0xEDB88320
	arm_func_end sub_020A00BC

	arm_func_start sub_020A0100
sub_020A0100: ; 0x020A0100
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x10
	bl sub_020A0064
	cmp r0, #0
	beq _020A0128
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	movgt r0, #1
	ldmgtia sp!, {r4, pc}
_020A0128:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A0100

	arm_func_start sub_020A0130
sub_020A0130: ; 0x020A0130
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	mov r4, r0
	add r0, r4, #0x10
	bl sub_0209FC0C
	cmp r0, #0
	addeq sp, sp, #0x14
	moveq r0, #1
	ldmeqia sp!, {r3, r4, pc}
	add r0, sp, #0
	bl sub_0209FA40
	ldr r0, [sp, #0x10]
	cmp r0, #0
	addeq sp, sp, #0x14
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	add r0, r4, #0x10
	bl sub_0209FB74
	ldr r2, [sp, #4]
	ldr r3, [sp]
	cmp r2, r1
	cmpeq r3, r0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, pc}
	arm_func_end sub_020A0130

	arm_func_start sub_020A0198
sub_020A0198: ; 0x020A0198
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x400
	mov r4, r0
	add r3, r4, #0x10
	mov ip, r2
	ldmia r1, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r1, _020A01EC ; =0xEDB88320
	add r0, sp, #0
	str ip, [r4, #0x1c]
	bl MATHi_CRC32InitTableRev
	add r0, sp, #0
	mov r1, r4
	mov r2, #0x3c
	bl MATH_CalcCRC32
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x20]
	orr r0, r0, #1
	str r0, [r4, #0x20]
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A01EC: .word 0xEDB88320
	arm_func_end sub_020A0198

	arm_func_start sub_020A01F0
sub_020A01F0: ; 0x020A01F0
	ldr ip, _020A01F8 ; =sub_020A01FC
	bx ip
	.align 2, 0
_020A01F8: .word sub_020A01FC
	arm_func_end sub_020A01F0

	arm_func_start sub_020A01FC
sub_020A01FC: ; 0x020A01FC
	ldr r0, [r0, #0x20]
	and r0, r0, #1
	cmp r0, #1
	moveq r0, #1
	movne r0, #0
	bx lr
	arm_func_end sub_020A01FC

	arm_func_start sub_020A0214
sub_020A0214: ; 0x020A0214
	ldr ip, _020A021C ; =sub_020A0220
	bx ip
	.align 2, 0
_020A021C: .word sub_020A0220
	arm_func_end sub_020A0214

	arm_func_start sub_020A0220
sub_020A0220: ; 0x020A0220
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x400
	mov r4, r0
	ldr r1, [r4, #0x20]
	add r0, sp, #0
	bic r2, r1, #1
	ldr r1, _020A0260 ; =0xEDB88320
	str r2, [r4, #0x20]
	bl MATHi_CRC32InitTableRev
	add r0, sp, #0
	mov r1, r4
	mov r2, #0x3c
	bl MATH_CalcCRC32
	str r0, [r4, #0x3c]
	add sp, sp, #0x400
	ldmia sp!, {r4, pc}
	.align 2, 0
_020A0260: .word 0xEDB88320
	arm_func_end sub_020A0220

	arm_func_start sub_020A0264
sub_020A0264: ; 0x020A0264
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl sub_0209FC0C
	cmp r0, #2
	movne r0, #0
	movne r1, r0
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl sub_0209FB9C
	ldmia sp!, {r4, pc}
	arm_func_end sub_020A0264

	arm_func_start sub_020A028C
sub_020A028C: ; 0x020A028C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	mov r6, r0
	mov r0, r4
	bl sub_0209FC0C
	cmp r0, #1
	beq _020A0300
	cmp r0, #2
	beq _020A02BC
	cmp r0, #3
	beq _020A02F4
	b _020A0308
_020A02BC:
	mov r0, r4
	bl sub_0209FB9C
	ldr r2, [r6, #0x24]
	mov r4, r0
	mov r5, r1
	bl sub_0209FD28
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r2, [r6, #0x24]
	mov r0, r4
	mov r1, r5
	bl sub_0209FD98
	ldmia sp!, {r4, r5, r6, pc}
_020A02F4:
	mov r0, r4
	bl sub_0209FBB0
	ldmia sp!, {r4, r5, r6, pc}
_020A0300:
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020A0308:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A028C

	arm_func_start sub_020A0310
sub_020A0310: ; 0x020A0310
	stmdb sp!, {r3, lr}
	mov r3, r0
	ldr r0, [r3, #0x1c]
	mov r2, #0
	mov r1, r2
	cmp r0, #0
	beq _020A0338
	ldr r1, [r3, #0x24]
	bl sub_0209FCC8
	mov r2, r0
_020A0338:
	mov r0, r2
	ldmia sp!, {r3, pc}
	arm_func_end sub_020A0310

	arm_func_start sub_020A0340
sub_020A0340: ; 0x020A0340
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	mov r0, r6
	mov r1, r5
	mov r2, r4
	bl sub_0209FBE8
	mov r0, r6
	mov r1, #2
	bl sub_0209FC78
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020A0340

	arm_func_start sub_020A037C
sub_020A037C: ; 0x020A037C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	mov r0, r5
	bl sub_020A007C
	cmp r0, #0
	addeq r0, r5, #4
	ldmeqia r0, {r0, r1, r2}
	stmeqia r4, {r0, r1, r2}
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #0x1c]
	mov r0, r4
	bl sub_0209FBF0
	mov r0, r4
	mov r1, #3
	bl sub_0209FC78
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A037C

	arm_func_start sub_020A03D0
sub_020A03D0: ; 0x020A03D0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	mov r0, r5
	mov r1, r4
	bl sub_0209FBF0
	mov r0, r5
	mov r1, #3
	bl sub_0209FC78
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020A03D0

	arm_func_start sub_020A0404
sub_020A0404: ; 0x020A0404
	ldr ip, _020A0418 ; =sub_0209FE28
	mov r3, r0
	mov r0, r1
	ldr r1, [r3, #0x24]
	bx ip
	.align 2, 0
_020A0418: .word sub_0209FE28
	arm_func_end sub_020A0404

	arm_func_start sub_020A041C
sub_020A041C: ; 0x020A041C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r1
	mov r7, r0
	bl sub_0209FC0C
	mov r5, r0
	mov r0, r4
	bl sub_0209FC0C
	cmp r5, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #3
	bne _020A0470
	mov r0, r7
	bl sub_0209FBB0
	mov r5, r0
	mov r0, r4
	bl sub_0209FBB0
	cmp r5, r0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A0470:
	cmp r5, #1
	bne _020A04C4
	mov r0, r7
	bl sub_0209FB74
	mov r5, r0
	mov r6, r1
	mov r0, r4
	bl sub_0209FB74
	cmp r6, r1
	cmpeq r5, r0
	bne _020A04BC
	mov r0, r7
	bl sub_0209FB94
	mov r5, r0
	mov r0, r4
	bl sub_0209FB94
	cmp r5, r0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_020A04BC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A04C4:
	cmp r5, #2
	bne _020A04F8
	mov r0, r7
	bl sub_0209FB9C
	mov r5, r0
	mov r6, r1
	mov r0, r4
	bl sub_0209FB9C
	cmp r6, r1
	cmpeq r5, r0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020A04F8:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end sub_020A041C

	arm_func_start sub_020A0500
sub_020A0500: ; 0x020A0500
	stmdb sp!, {r4, r5, r6, lr}
	mov r3, #0
	str r3, [r0]
	cmp r2, #0x10
	str r3, [r0, #4]
	movhi r2, #0x10
	add r0, r0, #8
_020A051C:
	str r3, [r0, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #0x100
	blt _020A051C
	mov r5, #0
	mov r6, r5
	mov lr, r5
	mov ip, r5
_020A053C:
	ldrb r3, [r1, r6]
	ldr r4, [r0, lr, lsl #2]
	add r6, r6, #1
	add r3, r4, r3
	add r3, r5, r3
	and r5, r3, #0xff
	ldr r3, [r0, r5, lsl #2]
	cmp r6, r2
	str r3, [r0, lr, lsl #2]
	add lr, lr, #1
	moveq r6, ip
	str r4, [r0, r5, lsl #2]
	cmp lr, #0x100
	blt _020A053C
	mov r2, #0
_020A0578:
	ldr r1, [r0, r2, lsl #2]
	mov r1, r1, lsl #0x18
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #0x100
	blt _020A0578
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	arm_func_end sub_020A0500

	arm_func_start sub_020A0598
sub_020A0598: ; 0x020A0598
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #4
	mov r3, #0
	strb r3, [r0]
	cmp r2, #0x10
	strb r3, [r0, #1]
	movhi r2, #0x10
	add r0, r0, #4
_020A05B8:
	strb r3, [r0, r3]
	add r3, r3, #1
	cmp r3, #0x100
	blt _020A05B8
	mov r6, #0
	mov r7, r6
	mov r4, r6
	mov r3, r6
	and ip, r2, #0xff
_020A05DC:
	ldrb r5, [r0, r4]
	ldrb lr, [r1, r7]
	add r2, r7, #1
	and r7, r2, #0xff
	add r2, r5, lr
	add r2, r6, r2
	and r6, r2, #0xff
	ldrb r2, [r0, r6]
	add lr, r0, r4
	add r4, r4, #1
	strb r2, [lr]
	cmp r7, ip
	moveq r7, r3
	cmp r4, #0x100
	strb r5, [r0, r6]
	blt _020A05DC
	add sp, sp, #4
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	arm_func_end sub_020A0598

	arm_func_start sub_020A0628
sub_020A0628: ; 0x020A0628
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	ldr r7, [r0]
	ldr r6, [r0, #4]
	add r0, r0, #8
	mov lr, #0x1000000
	add r7, r7, lr
	subs r2, r2, #8
	ldr sb, [r0, r7, lsr #22]
	bmi _020A07B4
_020A064C:
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	add r6, r6, sb
	subs r2, r2, #8
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	bpl _020A064C
_020A07B4:
	adds r2, r2, #8
	ble _020A07F0
_020A07BC:
	add r6, r6, sb
	subs r2, r2, #1
	ldr r8, [r0, r6, lsr #22]
	ldrb r5, [r1], #1
	str r8, [r0, r7, lsr #22]
	str sb, [r0, r6, lsr #22]
	add r4, sb, r8
	add r7, r7, lr
	ldr r4, [r0, r4, lsr #22]
	ldr sb, [r0, r7, lsr #22]
	eor r5, r5, r4, lsr #24
	strb r5, [r3], #1
	bgt _020A07BC
_020A07F0:
	sub r7, r7, lr
	and r7, r7, #0xff000000
	str r6, [r0, #-4]
	str r7, [r0, #-8]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end sub_020A0628

	.data

_021105F4:
	.asciz "0123456789abcdefghijklmnopqrstuv"
	.balign 4, 0
_02110618:
	.asciz "%s%c%c%c%c%s"
