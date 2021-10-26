	.include "asm/macros.inc"
	.include "global.inc"

 	.bss

 _021D15A4:
 	.space 0x8

_021D15AC:
	.space 0x5F8

_021D1BA4:
	.space 0x380

_021D1F24:
	.space 0x48

	.data

_0210F6CC:
	.byte 0x71, 0x02, 0x00, 0x00
_0210F6D0:
	.byte 0x00, 0x00, 0x00, 0x00, 0xDF, 0xB0, 0x08, 0x99, 0x00, 0x00, 0x00, 0x00
	.public _0210F6DC
_0210F6DC:
	.byte 0x01, 0x00, 0x00, 0x00

	.text

	thumb_func_start sub_0201FBB8
sub_0201FBB8: ; 0x0201FBB8
	push {r4, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r0, r1
	blo _0201FBC6
	mov r0, #0
	pop {r4, pc}
_0201FBC6:
	bl sub_0201FCD4
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _0201FC28 ; =0x021094DC
	ldrsh r4, [r0, r1]
	add r0, r4, #0
	bl _fflt
	ldr r1, _0201FC2C ; =0x45800000
	bl _fdiv
	mov r1, #0
	bl _fgr
	bls _0201FC06
	; r4 / 4096. * 4096. + 0.5
	add r0, r4, #0
	bl _fflt
	ldr r1, _0201FC2C ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0201FC2C ; =0x45800000
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0201FC22
_0201FC06:
	; r4 / 4096. * 4096. - 0.5
	add r0, r4, #0
	bl _fflt
	ldr r1, _0201FC2C ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0201FC2C ; =0x45800000
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0201FC22:
	bl _ffix
	pop {r4, pc}
	.balign 4, 0
_0201FC28: .word 0x021094DC
_0201FC2C: .word 0x45800000
	thumb_func_end sub_0201FBB8

	thumb_func_start sub_0201FC30
sub_0201FC30: ; 0x0201FC30
	push {r4, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r0, r1
	blo _0201FC3E
	mov r0, #0
	pop {r4, pc}
_0201FC3E:
	bl sub_0201FCD4
	asr r0, r0, #4
	lsl r0, r0, #1
	add r0, r0, #1
	lsl r1, r0, #1
	ldr r0, _0201FCA4 ; =0x021094DC
	ldrsh r4, [r0, r1]
	add r0, r4, #0
	bl _fflt
	ldr r1, _0201FCA8 ; =0x45800000
	bl _fdiv
	mov r1, #0
	bl _fgr
	bls _0201FC82
	add r0, r4, #0
	bl _fflt
	ldr r1, _0201FCA8 ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0201FCA8 ; =0x45800000
	bl _fmul
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0201FC9E
_0201FC82:
	add r0, r4, #0
	bl _fflt
	ldr r1, _0201FCA8 ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	ldr r0, _0201FCA8 ; =0x45800000
	bl _fmul
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0201FC9E:
	bl _ffix
	pop {r4, pc}
	.balign 4, 0
_0201FCA4: .word 0x021094DC
_0201FCA8: .word 0x45800000
	thumb_func_end sub_0201FC30

	thumb_func_start sub_0201FCAC
sub_0201FCAC: ; 0x0201FCAC
	push {r3, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	bl sub_0201FBB8
	pop {r3, pc}
	thumb_func_end sub_0201FCAC

	thumb_func_start sub_0201FCC0
sub_0201FCC0: ; 0x0201FCC0
	push {r3, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	bl sub_0201FC30
	pop {r3, pc}
	thumb_func_end sub_0201FCC0

	thumb_func_start sub_0201FCD4
sub_0201FCD4: ; 0x0201FCD4
	push {r3, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	cmp r0, r1
	blo _0201FCE2
	mov r0, #0
	pop {r3, pc}
_0201FCE2:
	lsl r0, r0, #0xc
	ldr r2, _0201FCF8 ; =0x0B60B60B
	asr r1, r0, #0x1f
	mov r3, #0xb6
	bl _ll_mul
	ldr r0, _0201FCFC ; =0x00000800
	adc r1, r0
	lsl r0, r1, #4
	lsr r0, r0, #0x10
	pop {r3, pc}
	.balign 4, 0
_0201FCF8: .word 0x0B60B60B
_0201FCFC: .word 0x00000800
	thumb_func_end sub_0201FCD4

	thumb_func_start sub_0201FD00
sub_0201FD00: ; 0x0201FD00
	push {r3, lr}
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	bl sub_0201FCD4
	pop {r3, pc}
	thumb_func_end sub_0201FD00

	thumb_func_start sub_0201FD14
sub_0201FD14: ; 0x0201FD14
	ldr r3, _0201FD1C ; =sub_0201FCAC
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bx r3
	.balign 4, 0
_0201FD1C: .word sub_0201FCAC
	thumb_func_end sub_0201FD14

	thumb_func_start sub_0201FD20
sub_0201FD20: ; 0x0201FD20
	ldr r3, _0201FD28 ; =sub_0201FCC0
	lsl r0, r0, #4
	lsr r0, r0, #0x10
	bx r3
	.balign 4, 0
_0201FD28: .word sub_0201FCC0
	thumb_func_end sub_0201FD20

	thumb_func_start GetLCRNGSeed
GetLCRNGSeed: ; 0x0201FD2C
	ldr r0, _0201FD34 ; =_021D15A4
	ldr r0, [r0, #4]
	bx lr
	nop
_0201FD34: .word _021D15A4
	thumb_func_end GetLCRNGSeed

	thumb_func_start SetLCRNGSeed
SetLCRNGSeed: ; 0x0201FD38
	ldr r1, _0201FD40 ; =_021D15A4
	str r0, [r1, #4]
	bx lr
	nop
_0201FD40: .word _021D15A4
	thumb_func_end SetLCRNGSeed

	thumb_func_start LCRandom
LCRandom: ; 0x0201FD44
	ldr r1, _0201FD5C ; =_021D15A4
	ldr r0, _0201FD60 ; =0x41C64E6D
	ldr r2, [r1, #4]
	add r3, r2, #0
	mul r3, r0
	ldr r0, _0201FD64 ; =0x00006073
	add r0, r3, r0
	str r0, [r1, #4]
	lsr r0, r0, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	.balign 4, 0
_0201FD5C: .word _021D15A4
_0201FD60: .word 0x41C64E6D
_0201FD64: .word 0x00006073
	thumb_func_end LCRandom

	thumb_func_start PRandom
PRandom: ; 0x0201FD68
	ldr r1, _0201FD70 ; =0x6C078965
	mul r1, r0
	add r0, r1, #1
	bx lr
	.balign 4, 0
_0201FD70: .word 0x6C078965
	thumb_func_end PRandom

	thumb_func_start SetMTRNGSeed
SetMTRNGSeed: ; 0x0201FD74
	push {r4, r5}
	ldr r1, _0201FDA8 ; =_021D15A4
	mov r4, #0x27
	str r0, [r1, #8]
	ldr r1, _0201FDAC ; =_0210F6CC
	mov r0, #1
	str r0, [r1]
	ldr r1, _0201FDB0 ; =_021D15AC + 0x4
	ldr r3, _0201FDB4 ; =0x6C078965
	lsl r4, r4, #4
_0201FD88:
	sub r2, r1, #4
	ldr r5, [r2]
	lsr r2, r5, #0x1e
	eor r2, r5
	add r5, r2, #0
	mul r5, r3
	add r2, r0, r5
	add r0, r0, #1
	stmia r1!, {r2}
	cmp r0, r4
	blt _0201FD88
	ldr r1, _0201FDAC ; =_0210F6CC
	str r0, [r1]
	pop {r4, r5}
	bx lr
	nop
_0201FDA8: .word _021D15A4
_0201FDAC: .word _0210F6CC
_0201FDB0: .word _021D15AC + 0x4
_0201FDB4: .word 0x6C078965
	thumb_func_end SetMTRNGSeed

	thumb_func_start MTRandom
MTRandom: ; 0x0201FDB8
	push {r3, r4, r5, r6, r7, lr}
	ldr r0, _0201FE9C ; =_0210F6CC
	ldr r1, [r0]
	mov r0, #0x27
	lsl r0, r0, #4
	cmp r1, r0
	blt _0201FE70
	add r0, r0, #1
	cmp r1, r0
	bne _0201FDD2
	ldr r0, _0201FEA0 ; =0x00001571
	bl SetMTRNGSeed
_0201FDD2:
	ldr r4, _0201FEA4 ; =_021D15AC
	ldr r1, _0201FEA8 ; =_0210F6D0
	ldr r5, _0201FEAC ; =0x7FFFFFFF
	ldr r6, _0201FEB0 ; =0x00000634
	mov r0, #0
_0201FDDC:
	mov r2, #2
	ldr r3, [r4]
	lsl r2, r2, #0x1e
	and r3, r2
	ldr r2, [r4, #4]
	add r0, r0, #1
	and r2, r5
	orr r3, r2
	lsr r7, r3, #1
	lsl r3, r3, #0x1f
	ldr r2, [r4, r6]
	lsr r3, r3, #0x1d
	ldr r3, [r1, r3]
	eor r2, r7
	eor r2, r3
	stmia r4!, {r2}
	cmp r0, #0xe3
	blt _0201FDDC
	ldr r1, _0201FEB4 ; =0x0000026F
	cmp r0, r1
	bge _0201FE3C
	ldr r2, _0201FEA4 ; =_021D15AC
	lsl r1, r0, #2
	add r1, r2, r1
	mov r2, #0xe3
	ldr r4, _0201FEA8 ; =_0210F6D0
	ldr r3, _0201FEB4 ; =0x0000026F
	lsl r2, r2, #2
_0201FE14:
	mov r5, #2
	ldr r6, [r1]
	lsl r5, r5, #0x1e
	and r5, r6
	ldr r7, [r1, #4]
	ldr r6, _0201FEAC ; =0x7FFFFFFF
	add r0, r0, #1
	and r6, r7
	orr r6, r5
	lsr r5, r6, #1
	sub r7, r1, r2
	lsl r6, r6, #0x1f
	ldr r7, [r7]
	lsr r6, r6, #0x1d
	ldr r6, [r4, r6]
	eor r5, r7
	eor r5, r6
	stmia r1!, {r5}
	cmp r0, r3
	blt _0201FE14
_0201FE3C:
	ldr r2, _0201FEB8 ; =_021D1F24
	mov r0, #2
	ldr r1, [r2, #0x44]
	lsl r0, r0, #0x1e
	add r3, r1, #0
	ldr r1, _0201FEBC ; =_021D15A4
	and r3, r0
	ldr r1, [r1, #8]
	sub r0, r0, #1
	and r0, r1
	add r4, r3, #0
	orr r4, r0
	ldr r0, _0201FEC0 ; =_021D1BA4
	ldr r1, [r0, #0x38]
	lsr r0, r4, #1
	add r3, r1, #0
	eor r3, r0
	lsl r0, r4, #0x1f
	lsr r1, r0, #0x1d
	ldr r0, _0201FEA8 ; =_0210F6D0
	ldr r0, [r0, r1]
	mov r1, #0
	eor r0, r3
	str r0, [r2, #0x44]
	ldr r0, _0201FE9C ; =_0210F6CC
	str r1, [r0]
_0201FE70:
	ldr r0, _0201FE9C ; =_0210F6CC
	ldr r2, [r0]
	add r1, r2, #1
	str r1, [r0]
	ldr r0, _0201FEA4 ; =_021D15AC
	lsl r1, r2, #2
	ldr r1, [r0, r1]
	lsr r0, r1, #0xb
	add r2, r1, #0
	eor r2, r0
	ldr r0, _0201FEC4 ; =0x9D2C5680
	lsl r1, r2, #7
	and r0, r1
	eor r2, r0
	ldr r0, _0201FEC8 ; =0xEFC60000
	lsl r1, r2, #0xf
	and r0, r1
	add r1, r2, #0
	eor r1, r0
	lsr r0, r1, #0x12
	eor r0, r1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0201FE9C: .word _0210F6CC
_0201FEA0: .word 0x00001571
_0201FEA4: .word _021D15AC
_0201FEA8: .word _0210F6D0
_0201FEAC: .word 0x7FFFFFFF
_0201FEB0: .word 0x00000634
_0201FEB4: .word 0x0000026F
_0201FEB8: .word _021D1F24
_0201FEBC: .word _021D15A4
_0201FEC0: .word _021D1BA4
_0201FEC4: .word 0x9D2C5680
_0201FEC8: .word 0xEFC60000
	thumb_func_end MTRandom

	thumb_func_start sub_0201FECC
sub_0201FECC: ; 0x0201FECC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, sp, #0
	ldrb r0, [r0, #0x10]
	add r4, r2, #0
	add r6, r3, #0
	cmp r0, #1
	bne _0201FEE6
	ldr r0, _0201FF20 ; =0x0000FFFF
	mul r0, r1
	lsl r0, r0, #8
	lsr r1, r0, #0x10
	b _0201FEFA
_0201FEE6:
	cmp r0, #2
	bne _0201FEFA
	ldr r0, _0201FF20 ; =0x0000FFFF
	mul r0, r1
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _u32_div_f
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
_0201FEFA:
	asr r0, r1, #4
	lsl r3, r0, #1
	lsl r1, r3, #1
	ldr r2, _0201FF24 ; =0x021094DC
	add r3, r3, #1
	lsl r3, r3, #1
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	add r0, r5, #0
	bl MTX_Rot22_
	add r0, r5, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl MTX_ScaleApply22
	pop {r4, r5, r6, pc}
	nop
_0201FF20: .word 0x0000FFFF
_0201FF24: .word 0x021094DC
	thumb_func_end sub_0201FECC

	thumb_func_start Math_CalcArraySum
Math_CalcArraySum: ; 0x0201FF28
	push {r3, r4}
	mov r3, #0
	add r4, r3, #0
	cmp r1, #0
	bls _0201FF3E
_0201FF32:
	ldrb r2, [r0]
	add r4, r4, #1
	add r0, r0, #1
	add r3, r3, r2
	cmp r4, r1
	blo _0201FF32
_0201FF3E:
	add r0, r3, #0
	pop {r3, r4}
	bx lr
	thumb_func_end Math_CalcArraySum

	thumb_func_start _MonEncryptSegment
_MonEncryptSegment: ; 0x0201FF44
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r4, #0
	lsr r6, r1, #1
	beq _0201FF66
	add r7, sp, #0x20
_0201FF52:
	add r0, r7, #0
	bl MonEncryptionLCRNG
	ldrh r1, [r5]
	add r4, r4, #1
	eor r0, r1
	strh r0, [r5]
	add r5, r5, #2
	cmp r4, r6
	blo _0201FF52
_0201FF66:
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
	thumb_func_end _MonEncryptSegment

	thumb_func_start _MonDecryptSegment
_MonDecryptSegment: ; 0x0201FF70
	ldr r3, _0201FF74 ; =_MonEncryptSegment
	bx r3
	.balign 4, 0
_0201FF74: .word _MonEncryptSegment
	thumb_func_end _MonDecryptSegment

	thumb_func_start MonEncryptionLCRNG
MonEncryptionLCRNG: ; 0x0201FF78
	ldr r2, [r0]
	ldr r1, _0201FF90 ; =0x41C64E6D
	add r3, r2, #0
	mul r3, r1
	ldr r1, _0201FF94 ; =0x00006073
	add r1, r3, r1
	str r1, [r0]
	lsr r0, r1, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	nop
_0201FF90: .word 0x41C64E6D
_0201FF94: .word 0x00006073
	thumb_func_end MonEncryptionLCRNG

	thumb_func_start GF_CalcCRC16
GF_CalcCRC16: ; 0x0201FF98
	add r3, r0, #0
	add r2, r1, #0
	ldr r0, _0201FFA8 ; =_021D15A4
	add r1, r3, #0
	ldr r3, _0201FFAC ; =MATH_CalcCRC16CCITT
	ldr r0, [r0]
	bx r3
	nop
_0201FFA8: .word _021D15A4
_0201FFAC: .word MATH_CalcCRC16CCITT
	thumb_func_end GF_CalcCRC16

	thumb_func_start GF_CRC16Init
GF_CRC16Init: ; 0x0201FFB0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0201FFD8 ; =_021D15A4
	ldr r0, [r0]
	cmp r0, #0
	beq _0201FFC0
	bl GF_AssertFail
_0201FFC0:
	mov r1, #2
	add r0, r4, #0
	lsl r1, r1, #8
	bl AllocFromHeap
	ldr r1, _0201FFD8 ; =_021D15A4
	str r0, [r1]
	ldr r1, _0201FFDC ; =0x00001021
	bl MATHi_CRC16InitTable
	pop {r4, pc}
	nop
_0201FFD8: .word _021D15A4
_0201FFDC: .word 0x00001021
	thumb_func_end GF_CRC16Init
