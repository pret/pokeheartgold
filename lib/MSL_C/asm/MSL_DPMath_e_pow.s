	.include "asm/macros.inc"
	.include "MSL_DPMath_e_pow.inc"
	.include "global.inc"

	.rodata

	.public dp_h
dp_h: ; 0x0210E93C
	; 0.0, 5.84962487220764160156e-01
	.word 0x00000000, 0x00000000
	.word 0x40000000, 0x3FE2B803
	.size dp_h,.-dp_h

	.public bp
bp: ; 0x0210E94C
	; 1.0, 1.5
	.word 0x00000000, 0x3FF00000
	.word 0x00000000, 0x3FF80000
	.size bp,.-bp

	.public dp_l
dp_l: ; 0x0210E95C
	; 0.0, 1.35003920212974897128e-08
	.word 0x00000000, 0x00000000
	.word 0x43CFD006, 0x3E4CFDEB
	.size dp_l,.-dp_l

	.text

	arm_func_start __ieee754_pow
__ieee754_pow: ; 0x020ED8F4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x80
	ldr r8, [sp, #0xb4]
	ldr r6, [sp, #0xac]
	ldr r0, [sp, #0xb0]
	bic sb, r8, #0x80000000
	orrs r1, sb, r0
	ldr r7, [sp, #0xa8]
	bic r4, r6, #0x80000000
	addeq sp, sp, #0x80
	moveq r0, #0
	ldreq r1, _020EDEA0 ; =0x3FF00000
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r1, _020EDEA4 ; =0x7FF00000
	cmp r4, r1
	bgt _020ED964
	bne _020ED94C
	cmp r7, #0
	bne _020ED964
_020ED94C:
	ldr r1, _020EDEA4 ; =0x7FF00000
	cmp sb, r1
	bgt _020ED964
	bne _020ED988
	cmp r0, #0
	beq _020ED988
_020ED964:
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	ldr r2, [sp, #0xb0]
	ldr r3, [sp, #0xb4]
	bl _dadd
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020ED988:
	cmp r6, #0
	mov r5, #0
	bge _020ED9F0
	ldr r1, _020EDEA8 ; =0x43400000
	cmp sb, r1
	movge r5, #2
	bge _020ED9F0
	sub r1, r1, #0x3500000
	cmp sb, r1
	blt _020ED9F0
	ldr r1, _020EDEAC ; =0xFFFFFC01
	add r1, r1, sb, asr #20
	cmp r1, #0x14
	ble _020ED9D8
	rsb r2, r1, #0x34
	mov r1, r0, lsr r2
	cmp r0, r1, lsl r2
	andeq r1, r1, #1
	rsbeq r5, r1, #2
	b _020ED9F0
_020ED9D8:
	cmp r0, #0
	rsbeq r2, r1, #0x14
	moveq r1, sb, asr r2
	cmpeq sb, r1, lsl r2
	andeq r1, r1, #1
	rsbeq r5, r1, #2
_020ED9F0:
	cmp r0, #0
	bne _020EDB4C
	ldr r1, _020EDEA4 ; =0x7FF00000
	cmp sb, r1
	bne _020EDAA4
	add r0, r4, #0x100000
	add r0, r0, #0xc0000000
	orrs r0, r0, r7
	bne _020EDA38
	ldr r0, [sp, #0xb0]
	ldr r1, [sp, #0xb4]
	mov r2, r0
	mov r3, r1
	bl _dsub
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDA38:
	sub r0, r1, #0x40000000
	cmp r4, r0
	blt _020EDA68
	cmp r8, #0
	ldrge r0, [sp, #0xb0]
	ldrge r1, [sp, #0xb4]
	movlt r0, #0
	add sp, sp, #0x80
	movlt r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDA68:
	cmp r8, #0
	mov r0, #0
	addge sp, sp, #0x80
	movge r1, r0
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addge sp, sp, #0x10
	bxge lr
	ldr r2, [sp, #0xb0]
	ldr r3, [sp, #0xb4]
	mov r1, r0
	bl _dsub
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDAA4:
	sub r0, r1, #0x40000000
	cmp sb, r0
	bne _020EDAF0
	cmp r8, #0
	ldrge r0, [sp, #0xa8]
	ldrge r1, [sp, #0xac]
	addge sp, sp, #0x80
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addge sp, sp, #0x10
	bxge lr
	ldr r2, [sp, #0xa8]
	ldr r3, [sp, #0xac]
	sub r1, r1, #0x40000000
	mov r0, #0
	bl _ddiv
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDAF0:
	cmp r8, #0x40000000
	bne _020EDB1C
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	mov r2, r0
	mov r3, r1
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDB1C:
	ldr r0, _020EDEB0 ; =0x3FE00000
	cmp r8, r0
	bne _020EDB4C
	cmp r6, #0
	blt _020EDB4C
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	bl _dsqrt
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDB4C:
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	bl fabs
	str r0, [sp, #0x70]
	str r1, [sp, #0x74]
	cmp r7, #0
	bne _020EDC50
	ldr r0, _020EDEA4 ; =0x7FF00000
	cmp r4, r0
	cmpne r4, #0
	subne r0, r0, #0x40000000
	cmpne r4, r0
	bne _020EDC50
	ldr r2, [sp, #0x70]
	ldr r3, [sp, #0x74]
	str r2, [sp, #0x78]
	str r3, [sp, #0x7c]
	cmp r8, #0
	bge _020EDBAC
	ldr r1, _020EDEA0 ; =0x3FF00000
	mov r0, #0
	bl _ddiv
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
_020EDBAC:
	cmp r6, #0
	bge _020EDC38
	add r0, r4, #0x100000
	add r0, r0, #0xc0000000
	orrs r0, r0, r5
	bne _020EDC14
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	mov r2, r0
	mov r3, r1
	bl _dsub
	mov r4, r0
	mov r5, r1
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	mov r2, r0
	mov r3, r1
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, r5
	bl _ddiv
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
	b _020EDC38
_020EDC14:
	cmp r5, #1
	bne _020EDC38
	mov r0, #0
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	mov r1, r0
	bl _dsub
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
_020EDC38:
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDC50:
	mov r0, r6, asr #0x1f
	add r7, r0, #1
	orrs r0, r7, r5
	bne _020EDC88
	ldr r0, _020EDEB4 ; =__float_nan
	ldr r1, _020EDEB8 ; =errno
	ldr r0, [r0]
	mov r2, #0x21
	str r2, [r1]
	bl _f2d
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDC88:
	ldr r3, _020EDEBC ; =0x41E00000
	cmp sb, r3
	ble _020EDF8C
	add r0, r3, #0x2100000
	cmp sb, r0
	ble _020EDCF8
	ldr r1, _020EDEC0 ; =0x3FEFFFFF
	cmp r4, r1
	bgt _020EDCCC
	cmp r8, #0
	mov r0, #0
	addlt r1, r1, #0x40000001
	add sp, sp, #0x80
	movge r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDCCC:
	add r0, r1, #1
	cmp r4, r0
	blt _020EDCF8
	cmp r8, #0
	mov r0, #0
	addgt r1, r1, #0x40000001
	add sp, sp, #0x80
	movle r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDCF8:
	ldr r2, _020EDEC0 ; =0x3FEFFFFF
	cmp r4, r2
	bge _020EDD24
	cmp r8, #0
	mov r0, #0
	addlt r1, r2, #0x40000001
	add sp, sp, #0x80
	movge r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDD24:
	add r0, r2, #1
	cmp r4, r0
	ble _020EDD50
	cmp r8, #0
	mov r0, #0
	addgt r1, r2, #0x40000001
	add sp, sp, #0x80
	movle r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDD50:
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	add r3, r2, #1
	mov r2, #0
	bl _dsub
	mov r2, r0
	mov r3, r1
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	bl _dmul
	mov r6, r1
	mov r4, r0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	ldr r1, _020EDEC4 ; =0x3FD00000
	mov r0, #0
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDEC8 ; =0x55555555
	sub r1, r0, #0x15800000
	bl _dsub
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, #0
	ldr r1, _020EDEB0 ; =0x3FE00000
	bl _dsub
	mov r2, r0
	mov r0, r4
	mov r3, r1
	mov r1, r6
	bl _dmul
	mov r6, r0
	mov r8, r1
	mov r0, #0x60000000
	ldr r1, _020EDECC ; =0x3FF71547
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl _dmul
	mov r4, r0
	mov sb, r1
	ldr r0, _020EDED0 ; =0xF85DDF44
	ldr r1, _020EDED4 ; =0x3E54AE0B
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl _dmul
	mov fp, r0
	mov sl, r1
	ldr r0, _020EDED8 ; =0x652B82FE
	ldr r1, _020EDECC ; =0x3FF71547
	mov r2, r6
	mov r3, r8
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, fp
	mov r1, sl
	bl _dsub
	mov r6, r0
	mov r8, r1
	mov r0, r4
	mov r1, sb
	mov r2, r6
	mov r3, r8
	bl _dadd
	mov r2, r4
	mov r3, sb
	str r1, [sp, #0x5c]
	mov r0, #0
	str r0, [sp, #0x58]
	bl _dsub
	mov r2, r0
	mov r0, r6
	mov r3, r1
	mov r1, r8
	bl _dsub
	mov r4, r0
	mov r8, r1
	b _020EE4E8
	.align 2, 0
_020EDEA0: .word 0x3FF00000
_020EDEA4: .word 0x7FF00000
_020EDEA8: .word 0x43400000
_020EDEAC: .word 0xFFFFFC01
_020EDEB0: .word 0x3FE00000
_020EDEB4: .word __float_nan
_020EDEB8: .word errno
_020EDEBC: .word 0x41E00000
_020EDEC0: .word 0x3FEFFFFF
_020EDEC4: .word 0x3FD00000
_020EDEC8: .word 0x55555555
_020EDECC: .word 0x3FF71547
_020EDED0: .word 0xF85DDF44
_020EDED4: .word 0x3E54AE0B
_020EDED8: .word 0x652B82FE
_020EDEDC: .word 0x0003988E
_020EDEE0: .word 0x000BB67A
_020EDEE4: .word bp
_020EDEE8: .word 0x4A454EEF
_020EDEEC: .word 0x3FCA7E28
_020EDEF0: .word 0x93C9DB65
_020EDEF4: .word 0x3FCD864A
_020EDEF8: .word 0xA91D4101
_020EDEFC: .word 0x3FD17460
_020EDF00: .word 0x518F264D
_020EDF04: .word 0x3FD55555
_020EDF08: .word 0xDB6FABFF
_020EDF0C: .word 0x3FDB6DB6
_020EDF10: .word 0x33333303
_020EDF14: .word 0x3FE33333
_020EDF18: .word 0x40080000
_020EDF1C: .word 0x3FEEC709
_020EDF20: .word 0x145B01F5
_020EDF24: .word 0xBE3E2FE0
_020EDF28: .word 0xDC3A03FD
_020EDF2C: .word dp_l
_020EDF30: .word dp_h
_020EDF34: .word 0x40900000
_020EDF38: .word 0x8800759C
_020EDF3C: .word 0x7E37E43C
_020EDF40: .word 0x3C971547
_020EDF44: .word 0x3F6F3400
_020EDF48: .word 0xC2F8F359
_020EDF4C: .word 0x01A56E1F
_020EDF50: .word 0x3FE62E43
_020EDF54: .word 0xFEFA39EF
_020EDF58: .word 0x3FE62E42
_020EDF5C: .word 0x0CA86C39
_020EDF60: .word 0xBE205C61
_020EDF64: .word 0x72BEA4D0
_020EDF68: .word 0x3E663769
_020EDF6C: .word 0xC5D26BF1
_020EDF70: .word 0xBEBBBD41
_020EDF74: .word 0xAF25DE2C
_020EDF78: .word 0x3F11566A
_020EDF7C: .word 0x16BEBD93
_020EDF80: .word 0xBF66C16C
_020EDF84: .word 0x5555553E
_020EDF88: .word 0x3FC55555
_020EDF8C:
	cmp r4, #0x100000
	mov r6, #0
	bge _020EDFBC
	ldr r0, [sp, #0x70]
	ldr r1, [sp, #0x74]
	mov r2, r6
	add r3, r3, #0x1600000
	bl _dmul
	mov r4, r1
	str r0, [sp, #0x70]
	str r4, [sp, #0x74]
	sub r6, r6, #0x35
_020EDFBC:
	ldr r0, _020EDEAC ; =0xFFFFFC01
	ldr r1, _020EDEDC ; =0x0003988E
	and r2, r4, r0, lsr #12
	add r0, r0, r4, asr #20
	orr sb, r2, #0xff00000
	cmp r2, r1
	add r6, r6, r0
	orr sb, sb, #0x30000000
	movle r8, #0
	ble _020EDFFC
	ldr r0, _020EDEE0 ; =0x000BB67A
	cmp r2, r0
	movlt r8, #1
	addge r6, r6, #1
	subge sb, sb, #0x100000
	movge r8, #0
_020EDFFC:
	ldr r2, _020EDEE4 ; =bp
	ldr r0, [sp, #0x70]
	add r1, r2, r8, lsl #3
	ldr r3, [r1, #4]
	ldr r2, [r2, r8, lsl #3]
	mov r1, sb
	str sb, [sp, #0x74]
	bl _dsub
	ldr r2, _020EDEE4 ; =bp
	mov sl, r0
	add r3, r2, r8, lsl #3
	mov r4, r1
	ldr r0, [sp, #0x70]
	ldr r2, [r2, r8, lsl #3]
	ldr r3, [r3, #4]
	mov r1, sb
	bl _dadd
	mov r3, r1
	mov r2, r0
	ldr r1, _020EDEA0 ; =0x3FF00000
	mov r0, #0
	bl _ddiv
	str r1, [sp, #0x24]
	mov fp, r0
	ldr r3, [sp, #0x24]
	mov r0, sl
	mov r1, r4
	mov r2, fp
	bl _dmul
	mov r2, sb, asr #1
	orr r2, r2, #0x20000000
	mov sb, r1
	add r2, r2, #0x80000
	add r1, r2, r8, lsl #18
	ldr r2, _020EDEE4 ; =bp
	str r0, [sp, #0x28]
	add r3, r2, r8, lsl #3
	mov r0, #0
	ldr r2, [r2, r8, lsl #3]
	ldr r3, [r3, #4]
	str sb, [sp, #0x4c]
	str r1, [sp, #0x44]
	str r0, [sp, #0x48]
	str r0, [sp, #0x40]
	bl _dsub
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x70]
	ldr r1, [sp, #0x74]
	bl _dsub
	str r0, [sp, #0x2c]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	mov r1, sb
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, sl
	mov r1, r4
	bl _dsub
	mov sl, r0
	mov r4, r1
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x48]
	mov r1, sb
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, sl
	mov r1, r4
	bl _dsub
	mov r3, r1
	mov r2, r0
	ldr r1, [sp, #0x24]
	mov r0, fp
	bl _dmul
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x28]
	str r1, [sp, #0x14]
	mov r1, sb
	mov r2, r0
	mov r3, sb
	bl _dmul
	mov r4, r0
	mov sl, r1
	mov r2, r4
	mov r3, sl
	bl _dmul
	str r0, [sp, #0x34]
	mov fp, r1
	ldr r0, _020EDEE8 ; =0x4A454EEF
	ldr r1, _020EDEEC ; =0x3FCA7E28
	mov r2, r4
	mov r3, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDEF0 ; =0x93C9DB65
	ldr r1, _020EDEF4 ; =0x3FCD864A
	bl _dadd
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDEF8 ; =0xA91D4101
	ldr r1, _020EDEFC ; =0x3FD17460
	bl _dadd
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF00 ; =0x518F264D
	ldr r1, _020EDF04 ; =0x3FD55555
	bl _dadd
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF08 ; =0xDB6FABFF
	ldr r1, _020EDF0C ; =0x3FDB6DB6
	bl _dadd
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF10 ; =0x33333303
	ldr r1, _020EDF14 ; =0x3FE33333
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x34]
	mov r1, fp
	bl _dmul
	mov r4, r0
	mov sl, r1
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x28]
	mov r1, sb
	mov r3, sb
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x14]
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dadd
	mov r4, r0
	ldr r0, [sp, #0x48]
	mov sl, r1
	mov r1, sb
	mov r2, r0
	mov r3, r1
	bl _dmul
	str r1, [sp, #0xc]
	mov fp, r0
	ldr r1, _020EDF18 ; =0x40080000
	ldr r3, [sp, #0xc]
	mov r0, #0
	mov r2, fp
	bl _dadd
	mov r2, r4
	mov r3, sl
	bl _dadd
	mov r0, #0
	ldr r3, _020EDF18 ; =0x40080000
	mov r2, r0
	str r1, [sp, #0x44]
	str r0, [sp, #0x40]
	bl _dsub
	ldr r3, [sp, #0xc]
	mov r2, fp
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dsub
	str r0, [sp, #0x38]
	str r1, [sp, #4]
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	mov r1, sb
	bl _dmul
	mov r4, r0
	mov sl, r1
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl _dmul
	str r0, [sp, #0x3c]
	mov fp, r1
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #4]
	ldr r2, [sp, #0x28]
	mov r3, sb
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x3c]
	mov r1, fp
	bl _dadd
	mov sb, r0
	mov fp, r1
	mov r0, r4
	mov r1, sl
	mov r2, sb
	mov r3, fp
	bl _dadd
	mov r0, #0
	mov r2, r4
	mov r3, sl
	str r1, [sp, #0x6c]
	str r0, [sp, #0x68]
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, sb
	mov r1, fp
	bl _dsub
	mov sl, r1
	mov fp, r0
	ldr r1, _020EDF1C ; =0x3FEEC709
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	mov r0, #0xe0000000
	bl _dmul
	mov r4, r0
	mov sb, r1
	ldr r0, _020EDF20 ; =0x145B01F5
	ldr r1, _020EDF24 ; =0xBE3E2FE0
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	bl _dmul
	mov r2, fp
	mov r3, sl
	mov fp, r0
	mov sl, r1
	ldr r0, _020EDF28 ; =0xDC3A03FD
	ldr r1, _020EDF1C ; =0x3FEEC709
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, fp
	mov r1, sl
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF2C ; =dp_l
	add r1, r0, r8, lsl #3
	ldr r0, [r0, r8, lsl #3]
	ldr r1, [r1, #4]
	bl _dadd
	mov fp, r0
	mov sl, r1
	mov r0, r6
	bl _dflt
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	mov r0, r4
	mov r1, sb
	mov r2, fp
	mov r3, sl
	bl _dadd
	ldr r2, _020EDF30 ; =dp_h
	add r3, r2, r8, lsl #3
	ldr r2, [r2, r8, lsl #3]
	ldr r3, [r3, #4]
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dadd
	str r1, [sp, #0x5c]
	mov r0, #0
	str r0, [sp, #0x58]
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl _dsub
	ldr r2, _020EDF30 ; =dp_h
	add r3, r2, r8, lsl #3
	ldr r2, [r2, r8, lsl #3]
	ldr r3, [r3, #4]
	bl _dsub
	mov r2, r4
	mov r3, sb
	bl _dsub
	mov r2, r0
	mov r0, fp
	mov r3, r1
	mov r1, sl
	bl _dsub
	mov r4, r0
	mov r8, r1
_020EE4E8:
	sub r0, r5, #1
	ldr r1, [sp, #0xb4]
	orrs r0, r7, r0
	ldr r5, _020EDEA0 ; =0x3FF00000
	mov r2, #0
	ldr r0, [sp, #0xb0]
	mov r3, r1
	mov r6, #0
	subeq r5, r5, #0x80000000
	str r1, [sp, #0x64]
	str r2, [sp, #0x60]
	bl _dsub
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0x5c]
	bl _dmul
	mov r7, r0
	mov sb, r1
	ldr r0, [sp, #0xb0]
	ldr r1, [sp, #0xb4]
	mov r2, r4
	mov r3, r8
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, r7
	mov r1, sb
	bl _dadd
	mov r7, r0
	mov r8, r1
	ldr r0, [sp, #0x60]
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x58]
	ldr r3, [sp, #0x5c]
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, r7
	mov r1, r8
	str r2, [sp, #0x68]
	str r3, [sp, #0x6c]
	bl _dadd
	mov sb, r1
	ldr r2, _020EDF34 ; =0x40900000
	str r0, [sp, #0x78]
	str sb, [sp, #0x7c]
	cmp sb, r2
	blt _020EE674
	add r1, sb, #0xf700000
	add r1, r1, #0xb0000000
	orrs r0, r1, r0
	beq _020EE5F4
	ldr r0, _020EDF38 ; =0x8800759C
	ldr r1, _020EDF3C ; =0x7E37E43C
	mov r2, r6
	mov r3, r5
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF38 ; =0x8800759C
	ldr r1, _020EDF3C ; =0x7E37E43C
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EE5F4:
	ldr r0, _020EDED8 ; =0x652B82FE
	ldr r1, _020EDF40 ; =0x3C971547
	mov r2, r7
	mov r3, r8
	bl _dadd
	mov r4, r0
	mov sl, r1
	ldr r0, [sp, #0x78]
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	mov r1, sb
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dgr
	bls _020EE728
	ldr r0, _020EDF38 ; =0x8800759C
	ldr r1, _020EDF3C ; =0x7E37E43C
	mov r2, r6
	mov r3, r5
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF38 ; =0x8800759C
	ldr r1, _020EDF3C ; =0x7E37E43C
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EE674:
	bic r3, sb, #0x80000000
	add r2, r2, #0xcc00
	cmp r3, r2
	blt _020EE728
	ldr r2, _020EDF44 ; =0x3F6F3400
	add r2, sb, r2
	orrs r2, r2, r0
	beq _020EE6CC
	ldr r0, _020EDF48 ; =0xC2F8F359
	ldr r1, _020EDF4C ; =0x01A56E1F
	mov r2, r6
	mov r3, r5
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF48 ; =0xC2F8F359
	ldr r1, _020EDF4C ; =0x01A56E1F
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EE6CC:
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r7
	mov r1, r8
	bl _dleq
	bhi _020EE728
	ldr r0, _020EDF48 ; =0xC2F8F359
	ldr r1, _020EDF4C ; =0x01A56E1F
	mov r2, r6
	mov r3, r5
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF48 ; =0xC2F8F359
	ldr r1, _020EDF4C ; =0x01A56E1F
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EE728:
	ldr r0, _020EDEAC ; =0xFFFFFC01
	bic r3, sb, #0x80000000
	ldr r1, _020EDEB0 ; =0x3FE00000
	add r2, r0, r3, asr #20
	cmp r3, r1
	mov r4, #0
	ble _020EE7A4
	mov r1, #0x100000
	add r2, r2, #1
	add r2, sb, r1, asr r2
	bic r3, r2, #0x80000000
	add r0, r0, r3, asr #20
	sub r3, r1, #1
	mvn r3, r3, asr r0
	sub r1, r1, #1
	and r1, r2, r1
	and r2, r2, r3
	str r2, [sp, #0x54]
	str r4, [sp, #0x50]
	orr r1, r1, #0x100000
	rsb r0, r0, #0x14
	mov r4, r1, asr r0
	cmp sb, #0
	ldr r0, [sp, #0x68]
	ldr r1, [sp, #0x6c]
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	rsblt r4, r4, #0
	bl _dsub
	str r0, [sp, #0x68]
	str r1, [sp, #0x6c]
_020EE7A4:
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	mov r0, r7
	mov r1, r8
	bl _dadd
	mov r3, r1
	mov r0, #0
	ldr r1, _020EDF50 ; =0x3FE62E43
	mov r2, r0
	str r3, [sp, #0x54]
	str r0, [sp, #0x50]
	bl _dmul
	mov sb, r0
	mov sl, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	bl _dsub
	mov r2, r0
	mov r0, r7
	mov r3, r1
	mov r1, r8
	bl _dsub
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF54 ; =0xFEFA39EF
	ldr r1, _020EDF58 ; =0x3FE62E42
	bl _dmul
	mov r7, r0
	mov r8, r1
	ldr r0, _020EDF5C ; =0x0CA86C39
	ldr r1, _020EDF60 ; =0xBE205C61
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r0, r7
	mov r3, r1
	mov r1, r8
	bl _dadd
	mov r7, r0
	mov r8, r1
	mov r0, sb
	mov r1, sl
	mov r2, r7
	mov r3, r8
	bl _dadd
	mov r2, sb
	mov r3, sl
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r7
	mov r1, r8
	bl _dsub
	mov r8, r0
	mov sb, r1
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	mov r2, r0
	mov r3, r1
	bl _dmul
	mov r2, r0
	str r2, [sp, #0x50]
	mov r3, r1
	str r3, [sp, #0x54]
	ldr r0, _020EDF64 ; =0x72BEA4D0
	ldr r1, _020EDF68 ; =0x3E663769
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF6C ; =0xC5D26BF1
	ldr r1, _020EDF70 ; =0xBEBBBD41
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF74 ; =0xAF25DE2C
	ldr r1, _020EDF78 ; =0x3F11566A
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF7C ; =0x16BEBD93
	ldr r1, _020EDF80 ; =0xBF66C16C
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF84 ; =0x5555553E
	ldr r1, _020EDF88 ; =0x3FC55555
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	bl _dsub
	mov r2, r0
	str r2, [sp, #0x58]
	mov r3, r1
	str r3, [sp, #0x5c]
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	bl _dmul
	mov r7, r0
	mov sl, r1
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0x5c]
	mov r2, #0
	mov r3, #0x40000000
	bl _dsub
	mov r2, r0
	mov r0, r7
	mov r3, r1
	mov r1, sl
	bl _ddiv
	mov r7, r0
	mov sl, r1
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	mov r2, r8
	mov r3, sb
	bl _dmul
	mov r2, r0
	mov r0, r8
	mov r3, r1
	mov r1, sb
	bl _dadd
	mov r2, r0
	mov r0, r7
	mov r3, r1
	mov r1, sl
	bl _dsub
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	bl _dsub
	mov r3, r1
	mov r2, r0
	ldr r1, _020EDEA0 ; =0x3FF00000
	mov r0, #0
	bl _dsub
	add r3, r1, r4, lsl #20
	mov r2, r3, asr #0x14
	str r0, [sp, #0x78]
	cmp r2, #0
	str r1, [sp, #0x7c]
	addgt r0, sp, #0x78
	strgt r3, [r0, #4]
	bgt _020EEA58
	mov r2, r4
	bl scalbn
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
_020EEA58:
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	mov r0, r6
	mov r1, r5
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end __ieee754_pow

	exception __ieee754_pow, 0x1188, __ieee754_pow_exception

	.section .exception,4,1,2

	.public __ieee754_pow_exception
__ieee754_pow_exception: ; 0x020F4FAC
	.byte 0x20, 0xFF, 0x01, 0xB8, 0x00, 0x00, 0x00, 0x00
