	.include "asm/macros.inc"
	.include "MSL_Common_wprintf.inc"
	.include "global.inc"

	.data

wstr$6DE4: ; 0x02111364
	; L"0x0p0"
	.short 0x0030, 0x0078, 0x0030, 0x0070, 0x0030, 0x0000

wstr$6DF0: ; 0x02111370
	; L"-INF"
	.short 0x002D, 0x0049, 0x004E, 0x0046, 0x0000, 0x0000

wstr$6DFC: ; 0x0211137C
	; L"-inf"
	.short 0x002D, 0x0069, 0x006E, 0x0066, 0x0000, 0x0000

wstr$6E08: ; 0x02111388
	; L"INF"
	.short 0x0049, 0x004E, 0x0046, 0x0000

wstr$6E10: ; 0x02111390
	; L"inf"
	.short 0x0069, 0x006E, 0x0066, 0x0000

wstr$6E18: ; 0x02111398
	; L"-NAN"
	.short 0x002D, 0x004E, 0x0041, 0x004E, 0x0000, 0x0000

wstr$6E24: ; 0x021113A4
	; L"-nan"
	.short 0x002D, 0x006E, 0x0061, 0x006E, 0x0000, 0x0000

wstr$6E30: ; 0x021113B0
	; L"NAN"
	.short 0x004E, 0x0041, 0x004E, 0x0000

wstr$6E38: ; 0x021113B8
	.short 0x006E, 0x0061, 0x006E, 0x0000

buff_ptr$6E40: ; 0x021113C0
	.short 0x0000, 0x0000

strptr$6E44: ; 0x021113C4
	.asciz ""

	.text

	arm_func_start parse_format__wide
parse_format__wide: ; 0x020EB8EC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldrh r3, [r0, #2]
	mov r4, #0
	mov r5, #1
	mov lr, r2
	strb r5, [sp]
	strb r4, [sp, #1]
	strb r4, [sp, #2]
	strb r4, [sp, #3]
	strb r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	cmp r3, #0x25
	add ip, r0, #2
	bne _020EB948
	add r0, sp, #0
	strh r3, [sp, #6]
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add sp, sp, #0x10
	add r0, ip, #2
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020EB948:
	mov r2, #2
	mov r0, r4
	mov r5, r2
	mov r6, r4
	mov r7, #1
_020EB95C:
	mov r8, r7
	cmp r3, #0x2b
	bgt _020EB98C
	bge _020EB9B4
	cmp r3, #0x23
	bgt _020EB9E4
	cmp r3, #0x20
	blt _020EB9E4
	beq _020EB9BC
	cmp r3, #0x23
	beq _020EB9CC
	b _020EB9E4
_020EB98C:
	cmp r3, #0x30
	bgt _020EB9E4
	cmp r3, #0x2d
	blt _020EB9E4
	beq _020EB9AC
	cmp r3, #0x30
	beq _020EB9D4
	b _020EB9E4
_020EB9AC:
	strb r6, [sp]
	b _020EB9E8
_020EB9B4:
	strb r7, [sp, #1]
	b _020EB9E8
_020EB9BC:
	ldrb r4, [sp, #1]
	cmp r4, #1
	strneb r5, [sp, #1]
	b _020EB9E8
_020EB9CC:
	strb r7, [sp, #3]
	b _020EB9E8
_020EB9D4:
	ldrb r4, [sp]
	cmp r4, #0
	strneb r2, [sp]
	b _020EB9E8
_020EB9E4:
	mov r8, r0
_020EB9E8:
	cmp r8, #0
	ldrneh r3, [ip, #2]!
	bne _020EB95C
	cmp r3, #0x2a
	bne _020EBA30
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	ldr r0, [r0, #-4]
	str r0, [sp, #8]
	cmp r0, #0
	bge _020EBA28
	rsb r0, r0, #0
	mov r2, #0
	strb r2, [sp]
	str r0, [sp, #8]
_020EBA28:
	ldrh r3, [ip, #2]!
	b _020EBA74
_020EBA30:
	mov r2, #0
	ldr r5, _020EBE58 ; =__wctype_mapC
	mov r0, #0xa
	b _020EBA54
_020EBA40:
	ldr r4, [sp, #8]
	sub r3, r3, #0x30
	mla r6, r4, r0, r3
	ldrh r3, [ip, #2]!
	str r6, [sp, #8]
_020EBA54:
	cmp r3, #0x80
	movhs r4, r2
	bhs _020EBA6C
	mov r4, r3, lsl #1
	ldrh r4, [r5, r4]
	and r4, r4, #8
_020EBA6C:
	cmp r4, #0
	bne _020EBA40
_020EBA74:
	ldr r2, [sp, #8]
	ldr r0, _020EBE5C ; =0x000001FD
	cmp r2, r0
	ble _020EBAA4
	ldr r1, _020EBE60 ; =0x0000FFFF
	add r0, sp, #0
	strh r1, [sp, #6]
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add sp, sp, #0x10
	add r0, ip, #2
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020EBAA4:
	cmp r3, #0x2e
	bne _020EBB2C
	ldrh r3, [ip, #2]!
	mov r0, #1
	strb r0, [sp, #2]
	cmp r3, #0x2a
	bne _020EBAE8
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	ldr r0, [r0, #-4]
	ldrh r3, [ip, #2]!
	str r0, [sp, #0xc]
	cmp r0, #0
	movlt r0, #0
	strltb r0, [sp, #2]
	b _020EBB2C
_020EBAE8:
	mov r1, #0
	ldr r4, _020EBE58 ; =__wctype_mapC
	mov r0, #0xa
	b _020EBB0C
_020EBAF8:
	ldr r2, [sp, #0xc]
	sub r3, r3, #0x30
	mla r5, r2, r0, r3
	ldrh r3, [ip, #2]!
	str r5, [sp, #0xc]
_020EBB0C:
	cmp r3, #0x80
	movhs r2, r1
	bhs _020EBB24
	mov r2, r3, lsl #1
	ldrh r2, [r4, r2]
	and r2, r2, #8
_020EBB24:
	cmp r2, #0
	bne _020EBAF8
_020EBB2C:
	cmp r3, #0x6c
	mov r0, #1
	bgt _020EBB64
	cmp r3, #0x68
	blt _020EBB58
	beq _020EBB80
	cmp r3, #0x6a
	beq _020EBBCC
	cmp r3, #0x6c
	beq _020EBB9C
	b _020EBBF0
_020EBB58:
	cmp r3, #0x4c
	beq _020EBBC0
	b _020EBBF0
_020EBB64:
	cmp r3, #0x74
	bgt _020EBB74
	beq _020EBBD8
	b _020EBBF0
_020EBB74:
	cmp r3, #0x7a
	beq _020EBBE4
	b _020EBBF0
_020EBB80:
	ldrh r1, [ip, #2]
	mov r2, #2
	strb r2, [sp, #4]
	cmp r1, #0x68
	streqb r0, [sp, #4]
	ldreqh r3, [ip, #2]!
	b _020EBBF4
_020EBB9C:
	ldrh r1, [ip, #2]
	mov r2, #3
	strb r2, [sp, #4]
	cmp r1, #0x6c
	bne _020EBBF4
	mov r1, #4
	strb r1, [sp, #4]
	ldrh r3, [ip, #2]!
	b _020EBBF4
_020EBBC0:
	mov r1, #9
	strb r1, [sp, #4]
	b _020EBBF4
_020EBBCC:
	mov r1, #6
	strb r1, [sp, #4]
	b _020EBBF4
_020EBBD8:
	mov r1, #8
	strb r1, [sp, #4]
	b _020EBBF4
_020EBBE4:
	mov r1, #7
	strb r1, [sp, #4]
	b _020EBBF4
_020EBBF0:
	mov r0, #0
_020EBBF4:
	cmp r0, #0
	ldrneh r3, [ip, #2]!
	strh r3, [sp, #6]
	cmp r3, #0x61
	bgt _020EBC48
	bge _020EBD2C
	cmp r3, #0x47
	bgt _020EBC3C
	subs r0, r3, #0x41
	addpl pc, pc, r0, lsl #2
	b _020EBE38
_020EBC20: ; jump table
	b _020EBD2C ; case 0
	b _020EBE38 ; case 1
	b _020EBE38 ; case 2
	b _020EBE38 ; case 3
	b _020EBD74 ; case 4
	b _020EBCF4 ; case 5
	b _020EBD64 ; case 6
_020EBC3C:
	cmp r3, #0x58
	beq _020EBCBC
	b _020EBE38
_020EBC48:
	cmp r3, #0x63
	bgt _020EBC58
	beq _020EBDD4
	b _020EBE38
_020EBC58:
	sub r0, r3, #0x64
	cmp r0, #0x14
	addls pc, pc, r0, lsl #2
	b _020EBE38
_020EBC68: ; jump table
	b _020EBCBC ; case 0
	b _020EBD74 ; case 1
	b _020EBCF4 ; case 2
	b _020EBD64 ; case 3
	b _020EBE38 ; case 4
	b _020EBCBC ; case 5
	b _020EBE38 ; case 6
	b _020EBE38 ; case 7
	b _020EBE38 ; case 8
	b _020EBE38 ; case 9
	b _020EBE24 ; case 10
	b _020EBCBC ; case 11
	b _020EBDB0 ; case 12
	b _020EBE38 ; case 13
	b _020EBE38 ; case 14
	b _020EBE00 ; case 15
	b _020EBE38 ; case 16
	b _020EBCBC ; case 17
	b _020EBE38 ; case 18
	b _020EBE38 ; case 19
	b _020EBCBC ; case 20
_020EBCBC:
	ldrb r0, [sp, #4]
	cmp r0, #9
	moveq r0, #4
	streqb r0, [sp, #4]
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
	beq _020EBE40
	ldrb r0, [sp]
	cmp r0, #2
	moveq r0, #1
	streqb r0, [sp]
	b _020EBE40
_020EBCF4:
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	ldreq r0, _020EBE60 ; =0x0000FFFF
	streqh r0, [sp, #6]
	beq _020EBE40
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp, #0xc]
	b _020EBE40
_020EBD2C:
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #0xd
	streq r0, [sp, #0xc]
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	cmpne r0, #1
	ldreq r0, _020EBE60 ; =0x0000FFFF
	streqh r0, [sp, #6]
	b _020EBE40
_020EBD64:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
_020EBD74:
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	cmpne r0, #1
	ldreq r0, _020EBE60 ; =0x0000FFFF
	streqh r0, [sp, #6]
	beq _020EBE40
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp, #0xc]
	b _020EBE40
_020EBDB0:
	mov r3, #3
	mov r2, #1
	mov r1, #0x78
	mov r0, #8
	strb r3, [sp, #4]
	strb r2, [sp, #3]
	strh r1, [sp, #6]
	str r0, [sp, #0xc]
	b _020EBE40
_020EBDD4:
	ldrb r1, [sp, #4]
	cmp r1, #3
	moveq r0, #5
	streqb r0, [sp, #4]
	beq _020EBE40
	ldrb r0, [sp, #2]
	cmp r0, #0
	cmpeq r1, #0
	ldrne r0, _020EBE60 ; =0x0000FFFF
	strneh r0, [sp, #6]
	b _020EBE40
_020EBE00:
	ldrb r0, [sp, #4]
	cmp r0, #3
	moveq r0, #5
	streqb r0, [sp, #4]
	beq _020EBE40
	cmp r0, #0
	ldrne r0, _020EBE60 ; =0x0000FFFF
	strneh r0, [sp, #6]
	b _020EBE40
_020EBE24:
	ldrb r0, [sp, #4]
	cmp r0, #9
	moveq r0, #4
	streqb r0, [sp, #4]
	b _020EBE40
_020EBE38:
	ldr r0, _020EBE60 ; =0x0000FFFF
	strh r0, [sp, #6]
_020EBE40:
	add r0, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add r0, ip, #2
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020EBE58: .word __wctype_mapC
_020EBE5C: .word 0x000001FD
_020EBE60: .word 0x0000FFFF
	arm_func_end parse_format__wide

	arm_func_start long2str__wide
long2str__wide: ; 0x020EBE64
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	movs sl, r0
	mov r0, #0
	mov r5, r1
	str r0, [sp, #0xc]
	ldr r7, [sp, #0x4c]
	mov r6, r0
	strh r0, [r5, #-2]!
	ldrb r0, [sp, #0x43]
	str r1, [sp]
	ldrh r8, [sp, #0x46]
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	ldrb fp, [sp, #0x41]
	str r0, [sp, #8]
	cmpeq r7, #0
	bne _020EBED8
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020EBEC4
	cmp r8, #0x6f
	beq _020EBED8
_020EBEC4:
	add sp, sp, #0x10
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EBED8:
	cmp r8, #0x69
	bgt _020EBF00
	bge _020EBF34
	cmp r8, #0x58
	bgt _020EBEF4
	beq _020EBF60
	b _020EBF68
_020EBEF4:
	cmp r8, #0x64
	beq _020EBF34
	b _020EBF68
_020EBF00:
	cmp r8, #0x6f
	bgt _020EBF14
	moveq r4, #8
	moveq fp, #0
	b _020EBF68
_020EBF14:
	cmp r8, #0x78
	bgt _020EBF68
	cmp r8, #0x75
	blt _020EBF68
	beq _020EBF54
	cmp r8, #0x78
	beq _020EBF60
	b _020EBF68
_020EBF34:
	cmp sl, #0
	mov r4, #0xa
	bge _020EBF68
	mov r0, #1
	cmp sl, #0x80000000
	rsbne sl, sl, #0
	str r0, [sp, #0xc]
	b _020EBF68
_020EBF54:
	mov r4, #0xa
	mov fp, #0
	b _020EBF68
_020EBF60:
	mov r4, #0x10
	mov fp, #0
_020EBF68:
	mov r0, sl
	mov r1, r4
	bl _u32_div_f
	mov sb, r1
	mov r0, sl
	mov r1, r4
	bl _u32_div_f
	cmp sb, #0xa
	mov sl, r0
	addlt sb, sb, #0x30
	blt _020EBFA0
	cmp r8, #0x78
	addeq sb, sb, #0x57
	addne sb, sb, #0x37
_020EBFA0:
	cmp sl, #0
	strh sb, [r5, #-2]!
	add r6, r6, #1
	bne _020EBF68
	cmp r4, #8
	bne _020EBFD4
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrneh r0, [r5]
	cmpne r0, #0x30
	movne r0, #0x30
	strneh r0, [r5, #-2]!
	addne r6, r6, #1
_020EBFD4:
	ldrb r0, [sp, #0x40]
	cmp r0, #2
	bne _020EC008
	ldr r0, [sp, #0xc]
	ldr r7, [sp, #8]
	cmp r0, #0
	cmpeq fp, #0
	subne r7, r7, #1
	cmp r4, #0x10
	bne _020EC008
	ldr r0, [sp, #4]
	cmp r0, #0
	subne r7, r7, #2
_020EC008:
	ldr r0, [sp]
	ldr r1, _020EC0B0 ; =0x000001FD
	sub r0, r0, r5
	add r0, r0, r0, lsr #31
	add r0, r7, r0, asr #1
	cmp r0, r1
	addgt sp, sp, #0x10
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	cmp r6, r7
	bge _020EC050
	mov r0, #0x30
_020EC040:
	add r6, r6, #1
	cmp r6, r7
	strh r0, [r5, #-2]!
	blt _020EC040
_020EC050:
	cmp r4, #0x10
	bne _020EC06C
	ldr r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x30
	strneh r8, [r5, #-2]
	strneh r0, [r5, #-4]!
_020EC06C:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	movne r0, #0x2d
	strneh r0, [r5, #-2]!
	bne _020EC09C
	cmp fp, #1
	moveq r0, #0x2b
	streqh r0, [r5, #-2]!
	beq _020EC09C
	cmp fp, #2
	moveq r0, #0x20
	streqh r0, [r5, #-2]!
_020EC09C:
	mov r0, r5
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020EC0B0: .word 0x000001FD
	arm_func_end long2str__wide

	arm_func_start longlong2str__wide
longlong2str__wide: ; 0x020EC0B4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov sb, r1
	mov r1, #0
	mov sl, r0
	mov r8, r2
	mov r0, r1
	strh r0, [r8, #-2]!
	ldr r0, [sp, #0x58]
	cmp sb, #0
	str r0, [sp, #0x14]
	ldrb r0, [sp, #0x4f]
	cmpeq sl, #0
	str r2, [sp]
	str r0, [sp, #4]
	ldrh r0, [sp, #0x52]
	str r1, [sp, #0x18]
	mov fp, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0x54]
	str r0, [sp, #0xc]
	ldrb r0, [sp, #0x4d]
	str r0, [sp, #0x10]
	ldreq r0, [sp, #0x14]
	cmpeq r0, #0
	bne _020EC14C
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020EC138
	ldr r0, [sp, #8]
	cmp r0, #0x6f
	beq _020EC14C
_020EC138:
	add sp, sp, #0x1c
	mov r0, r8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EC14C:
	ldr r0, [sp, #8]
	cmp r0, #0x69
	bgt _020EC178
	bge _020EC1A8
	cmp r0, #0x58
	bgt _020EC16C
	beq _020EC1FC
	b _020EC208
_020EC16C:
	cmp r0, #0x64
	beq _020EC1A8
	b _020EC208
_020EC178:
	cmp r0, #0x6f
	bgt _020EC188
	beq _020EC1DC
	b _020EC208
_020EC188:
	cmp r0, #0x78
	bgt _020EC208
	cmp r0, #0x75
	blt _020EC208
	beq _020EC1EC
	cmp r0, #0x78
	beq _020EC1FC
	b _020EC208
_020EC1A8:
	subs r0, sl, #0
	sbcs r0, sb, #0
	mov r7, #0xa
	mov r6, #0
	bge _020EC208
	cmp sb, #0x80000000
	cmpeq sl, r6
	beq _020EC1D0
	rsbs sl, sl, #0
	rsc sb, sb, #0
_020EC1D0:
	mov r0, #1
	str r0, [sp, #0x18]
	b _020EC208
_020EC1DC:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #8
	b _020EC208
_020EC1EC:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #0xa
	b _020EC208
_020EC1FC:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #0x10
_020EC208:
	mov r4, #0
_020EC20C:
	mov r0, sl
	mov r1, sb
	mov r2, r7
	mov r3, r6
	bl _ull_mod
	mov r5, r0
	mov r0, sl
	mov r1, sb
	mov r2, r7
	mov r3, r6
	bl _ll_udiv
	mov sl, r0
	cmp r5, #0xa
	mov sb, r1
	addlt r0, r5, #0x30
	blt _020EC25C
	ldr r0, [sp, #8]
	cmp r0, #0x78
	addeq r0, r5, #0x57
	addne r0, r5, #0x37
_020EC25C:
	strh r0, [r8, #-2]!
	mov r0, #0
	cmp sb, r0
	cmpeq sl, r4
	add fp, fp, #1
	bne _020EC20C
	cmp r6, #0
	cmpeq r7, #8
	bne _020EC29C
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrneh r0, [r8]
	cmpne r0, #0x30
	movne r0, #0x30
	strneh r0, [r8, #-2]!
	addne fp, fp, #1
_020EC29C:
	ldrb r0, [sp, #0x4c]
	cmp r0, #2
	bne _020EC2EC
	ldr r0, [sp, #0xc]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldreq r0, [sp, #0x10]
	cmpeq r0, #0
	ldrne r0, [sp, #0x14]
	subne r0, r0, #1
	strne r0, [sp, #0x14]
	cmp r6, #0
	cmpeq r7, #0x10
	bne _020EC2EC
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrne r0, [sp, #0x14]
	subne r0, r0, #2
	strne r0, [sp, #0x14]
_020EC2EC:
	ldr r0, [sp]
	ldr r2, _020EC3B0 ; =0x000001FD
	sub r0, r0, r8
	add r1, r0, r0, lsr #31
	ldr r0, [sp, #0x14]
	add r0, r0, r1, asr #1
	cmp r0, r2
	addgt sp, sp, #0x1c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	ldr r0, [sp, #0x14]
	cmp fp, r0
	bge _020EC340
	mov r1, #0x30
_020EC32C:
	ldr r0, [sp, #0x14]
	add fp, fp, #1
	cmp fp, r0
	strh r1, [r8, #-2]!
	blt _020EC32C
_020EC340:
	cmp r6, #0
	cmpeq r7, #0x10
	bne _020EC368
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020EC368
	ldr r0, [sp, #8]
	mov r1, #0x30
	strh r0, [r8, #-2]
	strh r1, [r8, #-4]!
_020EC368:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	movne r0, #0x2d
	strneh r0, [r8, #-2]!
	bne _020EC39C
	ldr r0, [sp, #0x10]
	cmp r0, #1
	moveq r0, #0x2b
	streqh r0, [r8, #-2]!
	beq _020EC39C
	cmp r0, #2
	moveq r0, #0x20
	streqh r0, [r8, #-2]!
_020EC39C:
	mov r0, r8
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020EC3B0: .word 0x000001FD
	arm_func_end longlong2str__wide

	arm_func_start double2hex__wide
double2hex__wide: ; 0x020EC3B4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x44
	ldr r7, [sp, #0x80]
	ldr r0, _020EC720 ; =0x000001FD
	mov r8, r2
	cmp r7, r0
	ldrh r6, [sp, #0x7a]
	ldrb r5, [sp, #0x77]
	ldrb r4, [sp, #0x75]
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x6c]
	addgt sp, sp, #0x44
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addgt sp, sp, #0x10
	bxgt lr
	mov sl, #0
	mov sb, #0x20
	add r0, sp, #8
	add r3, sp, #0xc
	strb sl, [sp, #8]
	strh sb, [sp, #0xa]
	bl __num2dec
	ldr r0, [sp, #0x68]
	ldr r1, [sp, #0x6c]
	bl fabs
	mov r2, r0
	mov r0, sl
	mov r3, r1
	mov r1, r0
	bl _deq
	bne _020EC45C
	sub r4, r8, #0xc
	ldr r1, _020EC724 ; =wstr$6DE4
	mov r0, r4
	bl wcscpy
	add sp, sp, #0x44
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020EC45C:
	ldrb r0, [sp, #0x11]
	cmp r0, #0x49
	bne _020EC4DC
	ldrsb r0, [sp, #0xc]
	cmp r0, #0
	beq _020EC4A0
	cmp r6, #0x41
	sub r4, r8, #0xa
	bne _020EC490
	ldr r1, _020EC728 ; =wstr$6DF0
	mov r0, r4
	bl wcscpy
	b _020EC4C8
_020EC490:
	ldr r1, _020EC72C ; =wstr$6DFC
	mov r0, r4
	bl wcscpy
	b _020EC4C8
_020EC4A0:
	cmp r6, #0x41
	sub r4, r8, #8
	bne _020EC4BC
	ldr r1, _020EC730 ; =wstr$6E08
	mov r0, r4
	bl wcscpy
	b _020EC4C8
_020EC4BC:
	ldr r1, _020EC734 ; =wstr$6E10
	mov r0, r4
	bl wcscpy
_020EC4C8:
	add sp, sp, #0x44
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020EC4DC:
	cmp r0, #0x4e
	bne _020EC558
	ldrsb r0, [sp, #0xc]
	cmp r0, #0
	beq _020EC51C
	cmp r6, #0x41
	sub r4, r8, #0xa
	bne _020EC50C
	ldr r1, _020EC738 ; =wstr$6E18
	mov r0, r4
	bl wcscpy
	b _020EC544
_020EC50C:
	ldr r1, _020EC73C ; =wstr$6E24
	mov r0, r4
	bl wcscpy
	b _020EC544
_020EC51C:
	cmp r6, #0x41
	sub r4, r8, #8
	bne _020EC538
	ldr r1, _020EC740 ; =wstr$6E30
	mov r0, r4
	bl wcscpy
	b _020EC544
_020EC538:
	ldr r1, _020EC744 ; =wstr$6E38
	mov r0, r4
	bl wcscpy
_020EC544:
	add sp, sp, #0x44
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020EC558:
	mov r3, sl
	mov r1, #1
	mov r0, #0x64
	add sb, sp, #0x68
	strb r1, [sp, #0x34]
	strb r1, [sp, #0x35]
	strb r3, [sp, #0x36]
	strb r3, [sp, #0x37]
	strb r3, [sp, #0x38]
	str r3, [sp, #0x3c]
	str r1, [sp, #0x40]
	strh r0, [sp, #0x3a]
_020EC588:
	rsb r1, r3, #7
	ldrsb r2, [sb, r3]
	ldrsb r0, [sb, r1]
	strb r0, [sb, r3]
	add r3, r3, #1
	strb r2, [sb, r1]
	cmp r3, #4
	blt _020EC588
	ldrb r0, [sp, #0x69]
	ldrb r1, [sp, #0x68]
	ldr sb, _020EC748 ; =0x000007FF
	mov r0, r0, lsl #0x11
	orr r1, r0, r1, lsl #25
	add r0, sp, #0x34
	and lr, sb, r1, lsr #21
	sub ip, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	rsb r0, sb, #0x400
	mov r1, r8
	add r0, lr, r0
	ldmia ip, {r2, r3}
	bl long2str__wide
	cmp r6, #0x61
	moveq r1, #0x70
	movne r1, #0x50
	strh r1, [r0, #-2]!
	mov r1, r7, lsl #2
	mov lr, r7
	cmp r7, #1
	add r8, r1, #0xb
	add ip, sp, #0x68
	blt _020EC698
	mov sb, #0x30
_020EC610:
	cmp r8, #0x40
	bge _020EC680
	ldrb r1, [ip, r8, asr #3]
	and r2, r8, #7
	rsb r3, r2, #7
	mov r2, r1, asr r3
	sub sl, r8, #4
	bic r1, r8, #7
	bic sl, sl, #7
	cmp r1, sl
	add sl, ip, r8, asr #3
	and r1, r2, #0xff
	beq _020EC654
	ldrb r2, [sl, #-1]
	mov r2, r2, lsl #8
	orr r1, r1, r2, asr r3
	and r1, r1, #0xff
_020EC654:
	and r1, r1, #0xf
	cmp r1, #0xa
	addlo r1, r1, #0x30
	andlo r1, r1, #0xff
	blo _020EC684
	cmp r6, #0x61
	addeq r1, r1, #0x57
	andeq r1, r1, #0xff
	addne r1, r1, #0x37
	andne r1, r1, #0xff
	b _020EC684
_020EC680:
	mov r1, sb
_020EC684:
	sub lr, lr, #1
	cmp lr, #1
	strh r1, [r0, #-2]!
	sub r8, r8, #4
	bge _020EC610
_020EC698:
	cmp r7, #0
	cmpeq r5, #0
	movne r1, #0x2e
	strneh r1, [r0, #-2]!
	mov r1, #0x31
	strh r1, [r0, #-2]
	cmp r6, #0x61
	moveq r1, #0x78
	movne r1, #0x58
	strh r1, [r0, #-4]!
	mov r1, #0x30
	strh r1, [r0, #-2]!
	ldrsb r1, [sp, #0xc]
	cmp r1, #0
	movne r1, #0x2d
	strneh r1, [r0, #-2]!
	addne sp, sp, #0x44
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addne sp, sp, #0x10
	bxne lr
	cmp r4, #1
	moveq r1, #0x2b
	streqh r1, [r0, #-2]!
	addeq sp, sp, #0x44
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addeq sp, sp, #0x10
	bxeq lr
	cmp r4, #2
	moveq r1, #0x20
	streqh r1, [r0, #-2]!
	add sp, sp, #0x44
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020EC720: .word 0x000001FD
_020EC724: .word wstr$6DE4
_020EC728: .word wstr$6DF0
_020EC72C: .word wstr$6DFC
_020EC730: .word wstr$6E08
_020EC734: .word wstr$6E10
_020EC738: .word wstr$6E18
_020EC73C: .word wstr$6E24
_020EC740: .word wstr$6E30
_020EC744: .word wstr$6E38
_020EC748: .word 0x000007FF
	arm_func_end double2hex__wide

	arm_func_start round_decimal__wide
round_decimal__wide: ; 0x020EC74C
	stmdb sp!, {r4, lr}
	cmp r1, #0
	bge _020EC774
_020EC758:
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #1
	strb r1, [r0, #4]
	mov r1, #0x30
	strb r1, [r0, #5]
	ldmia sp!, {r4, pc}
_020EC774:
	ldrb lr, [r0, #4]
	cmp r1, lr
	ldmgeia sp!, {r4, pc}
	add ip, r0, #5
	add r2, ip, r1
	add r2, r2, #1
	ldrsb r3, [r2, #-1]!
	sub r3, r3, #0x30
	mov r3, r3, lsl #0x18
	mov r3, r3, asr #0x18
	cmp r3, #5
	bne _020EC7D4
	add ip, ip, lr
_020EC7A8:
	sub ip, ip, #1
	cmp ip, r2
	bls _020EC7C0
	ldrsb r3, [ip]
	cmp r3, #0x30
	beq _020EC7A8
_020EC7C0:
	cmp ip, r2
	ldreqsb r3, [r2, #-1]
	andeq r4, r3, #1
	movne r4, #1
	b _020EC7DC
_020EC7D4:
	movgt r4, #1
	movle r4, #0
_020EC7DC:
	cmp r1, #0
	beq _020EC838
	mov ip, #0
	mov lr, #1
_020EC7EC:
	ldrsb r3, [r2, #-1]!
	sub r3, r3, #0x30
	add r3, r3, r4
	mov r3, r3, lsl #0x18
	mov r3, r3, asr #0x18
	cmp r3, #9
	movgt r4, lr
	movle r4, ip
	cmp r4, #0
	bne _020EC81C
	cmp r3, #0
	bne _020EC824
_020EC81C:
	sub r1, r1, #1
	b _020EC830
_020EC824:
	add r3, r3, #0x30
	strb r3, [r2]
	b _020EC838
_020EC830:
	cmp r1, #0
	bne _020EC7EC
_020EC838:
	cmp r4, #0
	beq _020EC860
	ldrsh r3, [r0, #2]
	mov r2, #1
	mov r1, #0x31
	add r3, r3, #1
	strh r3, [r0, #2]
	strb r2, [r0, #4]
	strb r1, [r0, #5]
	ldmia sp!, {r4, pc}
_020EC860:
	cmp r1, #0
	beq _020EC758
	strb r1, [r0, #4]
	ldmia sp!, {r4, pc}
	arm_func_end round_decimal__wide

	arm_func_start float2str__wide
float2str__wide: ; 0x020EC870
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x22c
	mov sl, r0
	add r0, sp, #0x250
	ldr r7, [sp, #0x268]
	ldr r3, _020ECE90 ; =0x000001FD
	ldrh r6, [r0, #0x12]
	cmp r7, r3
	ldrb r5, [sp, #0x25f]
	ldrb r4, [sp, #0x25d]
	mov r8, r1
	mov sb, r2
	addgt sp, sp, #0x22c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	mov ip, #0
	mov fp, #0x20
	add r0, sp, #0
	add r3, sp, #4
	mov r1, sl
	mov r2, r8
	strb ip, [sp]
	strh fp, [sp, #2]
	bl __num2dec
	ldrb r0, [sp, #8]
	add r1, sp, #9
	add r0, r1, r0
	b _020EC904
_020EC8EC:
	ldrb r2, [sp, #8]
	ldrsh r1, [sp, #6]
	sub r2, r2, #1
	add r1, r1, #1
	strb r2, [sp, #8]
	strh r1, [sp, #6]
_020EC904:
	ldrb r1, [sp, #8]
	cmp r1, #1
	bls _020EC91C
	ldrsb r1, [r0, #-1]!
	cmp r1, #0x30
	beq _020EC8EC
_020EC91C:
	ldrb r0, [sp, #9]
	cmp r0, #0x30
	beq _020EC93C
	cmp r0, #0x49
	beq _020EC948
	cmp r0, #0x4e
	beq _020ECA00
	b _020ECAAC
_020EC93C:
	mov r0, #0
	strh r0, [sp, #6]
	b _020ECAAC
_020EC948:
	mov r2, #0
	mov r0, sl
	mov r1, r8
	mov r3, r2
	bl _dls
	bhs _020EC9A8
	cmp r6, #0x80
	sub r4, sb, #0xa
	movhs r0, #0
	bhs _020EC980
	ldr r0, _020ECE94 ; =__wctype_mapC
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x200
_020EC980:
	cmp r0, #0
	beq _020EC998
	ldr r1, _020ECE98 ; =wstr$6DF0
	mov r0, r4
	bl wcscpy
	b _020EC9EC
_020EC998:
	ldr r1, _020ECE9C ; =wstr$6DFC
	mov r0, r4
	bl wcscpy
	b _020EC9EC
_020EC9A8:
	cmp r6, #0x80
	sub r4, sb, #8
	movhs r0, #0
	bhs _020EC9C8
	ldr r0, _020ECE94 ; =__wctype_mapC
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x200
_020EC9C8:
	cmp r0, #0
	beq _020EC9E0
	ldr r1, _020ECEA0 ; =wstr$6E08
	mov r0, r4
	bl wcscpy
	b _020EC9EC
_020EC9E0:
	ldr r1, _020ECEA4 ; =wstr$6E10
	mov r0, r4
	bl wcscpy
_020EC9EC:
	add sp, sp, #0x22c
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020ECA00:
	ldrsb r0, [sp, #4]
	cmp r0, #0
	beq _020ECA54
	cmp r6, #0x80
	sub r4, sb, #0xa
	movhs r0, #0
	bhs _020ECA2C
	ldr r0, _020ECE94 ; =__wctype_mapC
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x200
_020ECA2C:
	cmp r0, #0
	beq _020ECA44
	ldr r1, _020ECEA8 ; =wstr$6E18
	mov r0, r4
	bl wcscpy
	b _020ECA98
_020ECA44:
	ldr r1, _020ECEAC ; =wstr$6E24
	mov r0, r4
	bl wcscpy
	b _020ECA98
_020ECA54:
	cmp r6, #0x80
	sub r4, sb, #8
	movhs r0, #0
	bhs _020ECA74
	ldr r0, _020ECE94 ; =__wctype_mapC
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x200
_020ECA74:
	cmp r0, #0
	beq _020ECA8C
	ldr r1, _020ECEB0 ; =wstr$6E30
	mov r0, r4
	bl wcscpy
	b _020ECA98
_020ECA8C:
	ldr r1, _020ECEB4 ; =wstr$6E38
	mov r0, r4
	bl wcscpy
_020ECA98:
	add sp, sp, #0x22c
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020ECAAC:
	ldrb r1, [sp, #8]
	ldrsh r2, [sp, #6]
	add r0, sp, #0x200
	sub r1, r1, #1
	add r0, r0, #0x2a
	add r1, r2, r1
	sub r8, r0, #1
	strh r1, [sp, #6]
	mov r0, #0
	strb r0, [r8]
	cmp r6, #0x65
	bgt _020ECB08
	bge _020ECB94
	cmp r6, #0x47
	bgt _020ECE54
	cmp r6, #0x45
	blt _020ECE54
	beq _020ECB94
	cmp r6, #0x46
	beq _020ECCE0
	cmp r6, #0x47
	beq _020ECB20
	b _020ECE54
_020ECB08:
	cmp r6, #0x66
	bgt _020ECB18
	beq _020ECCE0
	b _020ECE54
_020ECB18:
	cmp r6, #0x67
	bne _020ECE54
_020ECB20:
	ldrb r0, [sp, #8]
	cmp r0, r7
	ble _020ECB38
	add r0, sp, #4
	mov r1, r7
	bl round_decimal__wide
_020ECB38:
	ldrsh r2, [sp, #6]
	mvn r0, #3
	cmp r2, r0
	blt _020ECB50
	cmp r2, r7
	blt _020ECB70
_020ECB50:
	cmp r5, #0
	ldreqb r0, [sp, #8]
	subne r7, r7, #1
	subeq r7, r0, #1
	cmp r6, #0x67
	moveq r6, #0x65
	movne r6, #0x45
	b _020ECB94
_020ECB70:
	cmp r5, #0
	addne r0, r2, #1
	subne r7, r7, r0
	bne _020ECCE0
	ldrb r1, [sp, #8]
	add r0, r2, #1
	subs r7, r1, r0
	movmi r7, #0
	b _020ECCE0
_020ECB94:
	ldrb r0, [sp, #8]
	add r1, r7, #1
	cmp r0, r1
	ble _020ECBAC
	add r0, sp, #4
	bl round_decimal__wide
_020ECBAC:
	ldrsh lr, [sp, #6]
	mov fp, #0x2b
	mov sl, #0
	cmp lr, #0
	rsblt lr, lr, #0
	movlt fp, #0x2d
	ldr r3, _020ECEB8 ; =0x66666667
	mov r0, #0xa
	b _020ECC00
_020ECBD0:
	mov r1, lr, lsr #0x1f
	smull r2, ip, r3, lr
	add ip, r1, ip, asr #2
	smull r1, r2, r0, ip
	sub ip, lr, r1
	add r1, ip, #0x30
	strb r1, [r8, #-1]!
	mov r2, lr
	smull r1, lr, r3, r2
	mov r1, r2, lsr #0x1f
	add lr, r1, lr, asr #2
	add sl, sl, #1
_020ECC00:
	cmp lr, #0
	bne _020ECBD0
	cmp sl, #2
	blt _020ECBD0
	add r0, sp, #0x2a
	strb fp, [r8, #-1]
	strb r6, [r8, #-2]!
	sub r1, r0, r8
	ldr r0, _020ECE90 ; =0x000001FD
	add r1, r1, r7
	cmp r1, r0
	addgt sp, sp, #0x22c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	ldrb r1, [sp, #8]
	add r0, r7, #1
	cmp r1, r0
	bge _020ECC70
	add r0, r7, #2
	sub r0, r0, r1
	subs r1, r0, #1
	beq _020ECC70
	mov r0, #0x30
_020ECC64:
	strb r0, [r8, #-1]!
	subs r1, r1, #1
	bne _020ECC64
_020ECC70:
	ldrb r1, [sp, #8]
	add r0, sp, #9
	add r2, r0, r1
	subs r1, r1, #1
	beq _020ECC94
_020ECC84:
	ldrsb r0, [r2, #-1]!
	subs r1, r1, #1
	strb r0, [r8, #-1]!
	bne _020ECC84
_020ECC94:
	cmp r7, #0
	cmpeq r5, #0
	movne r0, #0x2e
	strneb r0, [r8, #-1]!
	ldrb r0, [sp, #9]
	strb r0, [r8, #-1]!
	ldrsb r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r8, #-1]!
	bne _020ECE54
	cmp r4, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _020ECE54
	cmp r4, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
	b _020ECE54
_020ECCE0:
	ldrsh r3, [sp, #6]
	ldrb r2, [sp, #8]
	sub r0, r2, r3
	subs r1, r0, #1
	movmi r1, #0
	cmp r1, r7
	ble _020ECD20
	sub r1, r1, r7
	add r0, sp, #4
	sub r1, r2, r1
	bl round_decimal__wide
	ldrsh r3, [sp, #6]
	ldrb r2, [sp, #8]
	sub r0, r2, r3
	subs r1, r0, #1
	movmi r1, #0
_020ECD20:
	adds r0, r3, #1
	movmi r0, #0
	ldr r3, _020ECE90 ; =0x000001FD
	add r6, r0, r1
	cmp r6, r3
	addgt sp, sp, #0x22c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	add r3, sp, #9
	sub r6, r7, r1
	cmp r6, #0
	add r2, r3, r2
	mov sl, #0
	ble _020ECD74
	mov r3, #0x30
_020ECD64:
	add sl, sl, #1
	cmp sl, r6
	strb r3, [r8, #-1]!
	blt _020ECD64
_020ECD74:
	mov r6, #0
	b _020ECD88
_020ECD7C:
	ldrsb r3, [r2, #-1]!
	add r6, r6, #1
	strb r3, [r8, #-1]!
_020ECD88:
	cmp r6, r1
	ldrltb r3, [sp, #8]
	cmplt r6, r3
	blt _020ECD7C
	cmp r6, r1
	bge _020ECDB4
	mov r3, #0x30
_020ECDA4:
	add r6, r6, #1
	cmp r6, r1
	strb r3, [r8, #-1]!
	blt _020ECDA4
_020ECDB4:
	cmp r7, #0
	cmpeq r5, #0
	movne r1, #0x2e
	strneb r1, [r8, #-1]!
	cmp r0, #0
	beq _020ECE1C
	ldrb r1, [sp, #8]
	mov r5, #0
	sub r1, r0, r1
	cmp r1, #0
	ble _020ECDFC
	mov r3, #0x30
_020ECDE4:
	strb r3, [r8, #-1]!
	ldrb r1, [sp, #8]
	add r5, r5, #1
	sub r1, r0, r1
	cmp r5, r1
	blt _020ECDE4
_020ECDFC:
	cmp r5, r0
	bge _020ECE24
_020ECE04:
	ldrsb r1, [r2, #-1]!
	add r5, r5, #1
	cmp r5, r0
	strb r1, [r8, #-1]!
	blt _020ECE04
	b _020ECE24
_020ECE1C:
	mov r0, #0x30
	strb r0, [r8, #-1]!
_020ECE24:
	ldrsb r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r8, #-1]!
	bne _020ECE54
	cmp r4, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _020ECE54
	cmp r4, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
_020ECE54:
	mov r0, r8
	bl strlen
	sub r1, sb, r0, lsl #1
	mov r0, r8
	sub r4, r1, #2
	bl strlen
	mov r2, r0
	mov r0, r4
	mov r1, r8
	bl mbstowcs
	mov r0, r4
	add sp, sp, #0x22c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020ECE90: .word 0x000001FD
_020ECE94: .word __wctype_mapC
_020ECE98: .word wstr$6DF0
_020ECE9C: .word wstr$6DFC
_020ECEA0: .word wstr$6E08
_020ECEA4: .word wstr$6E10
_020ECEA8: .word wstr$6E18
_020ECEAC: .word wstr$6E24
_020ECEB0: .word wstr$6E30
_020ECEB4: .word wstr$6E38
_020ECEB8: .word 0x66666667
	arm_func_end float2str__wide

	arm_func_start __wpformatter
__wpformatter: ; 0x020ECEBC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x430
	mov r3, #0x20
	mov fp, r2
	strh r3, [sp, #0x1c]
	ldrh r2, [fp]
	mov sb, r0
	mov r8, r1
	cmp r2, #0
	mov r4, #0
	beq _020ED78C
_020ECEEC:
	mov r0, fp
	mov r1, #0x25
	bl wcschr
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _020ECF40
	mov r0, fp
	bl wcslen
	movs r2, r0
	add r4, r4, r2
	beq _020ED78C
	mov r0, r8
	mov r1, fp
	blx sb
	cmp r0, #0
	bne _020ED78C
	add sp, sp, #0x430
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020ECF40:
	sub r0, r0, fp
	add r0, r0, r0, lsr #31
	movs r2, r0, asr #1
	add r4, r4, r2
	beq _020ECF78
	mov r0, r8
	mov r1, fp
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x430
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_020ECF78:
	add r1, sp, #0x400
	ldr r0, [sp, #0xc]
	add r1, r1, #0x64
	add r2, sp, #0x20
	bl parse_format__wide
	ldrh r1, [sp, #0x26]
	mov fp, r0
	cmp r1, #0x61
	bgt _020ECFE8
	bge _020ED354
	cmp r1, #0x47
	bgt _020ECFDC
	subs r0, r1, #0x41
	addpl pc, pc, r0, lsl #2
	b _020ECFD0
_020ECFB4: ; jump table
	b _020ED354 ; case 0
	b _020ED5F8 ; case 1
	b _020ED5F8 ; case 2
	b _020ED5F8 ; case 3
	b _020ED2E4 ; case 4
	b _020ED2E4 ; case 5
	b _020ED2E4 ; case 6
_020ECFD0:
	cmp r1, #0x25
	beq _020ED5E4
	b _020ED5F8
_020ECFDC:
	cmp r1, #0x58
	beq _020ED1A8
	b _020ED5F8
_020ECFE8:
	cmp r1, #0x75
	bgt _020ED050
	subs r0, r1, #0x64
	addpl pc, pc, r0, lsl #2
	b _020ED044
_020ECFFC: ; jump table
	b _020ED06C ; case 0
	b _020ED2E4 ; case 1
	b _020ED2E4 ; case 2
	b _020ED2E4 ; case 3
	b _020ED5F8 ; case 4
	b _020ED06C ; case 5
	b _020ED5F8 ; case 6
	b _020ED5F8 ; case 7
	b _020ED5F8 ; case 8
	b _020ED5F8 ; case 9
	b _020ED500 ; case 10
	b _020ED1A8 ; case 11
	b _020ED5F8 ; case 12
	b _020ED5F8 ; case 13
	b _020ED5F8 ; case 14
	b _020ED3C4 ; case 15
	b _020ED5F8 ; case 16
	b _020ED1A8 ; case 17
_020ED044:
	cmp r1, #0x63
	beq _020ED58C
	b _020ED5F8
_020ED050:
	cmp r1, #0x78
	bgt _020ED060
	beq _020ED1A8
	b _020ED5F8
_020ED060:
	ldr r0, _020ED7A0 ; =0x0000FFFF
	cmp r1, r0
	b _020ED5F8
_020ED06C:
	ldrb r0, [sp, #0x24]
	cmp r0, #3
	bne _020ED08C
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
	b _020ED124
_020ED08C:
	cmp r0, #4
	bne _020ED0B4
	ldr r1, [sp, #0x464]
	add r2, r1, #8
	str r2, [sp, #0x464]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020ED124
_020ED0B4:
	cmp r0, #6
	bne _020ED0DC
	ldr r1, [sp, #0x464]
	add r2, r1, #8
	str r2, [sp, #0x464]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020ED124
_020ED0DC:
	cmp r0, #7
	bne _020ED0F8
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
	b _020ED124
_020ED0F8:
	cmp r0, #8
	bne _020ED114
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
	b _020ED124
_020ED114:
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
_020ED124:
	cmp r0, #2
	moveq r1, sl, lsl #0x10
	moveq sl, r1, asr #0x10
	cmp r0, #4
	cmpne r0, #6
	add r0, sp, #0x20
	bne _020ED16C
	sub r5, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r3, [r5]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x430
	bl longlong2str__wide
	movs r6, r0
	beq _020ED5F8
	b _020ED190
_020ED16C:
	sub r5, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	add r1, sp, #0x430
	mov r0, sl
	ldmia r5, {r2, r3}
	bl long2str__wide
	movs r6, r0
	beq _020ED5F8
_020ED190:
	add r0, sp, #0x400
	add r0, r0, #0x2e
	sub r0, r0, r6
	add r0, r0, r0, lsr #31
	mov r7, r0, asr #1
	b _020ED644
_020ED1A8:
	ldrb r0, [sp, #0x24]
	cmp r0, #3
	bne _020ED1C8
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
	b _020ED260
_020ED1C8:
	cmp r0, #4
	bne _020ED1F0
	ldr r1, [sp, #0x464]
	add r2, r1, #8
	str r2, [sp, #0x464]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020ED260
_020ED1F0:
	cmp r0, #6
	bne _020ED218
	ldr r1, [sp, #0x464]
	add r2, r1, #8
	str r2, [sp, #0x464]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020ED260
_020ED218:
	cmp r0, #7
	bne _020ED234
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
	b _020ED260
_020ED234:
	cmp r0, #8
	bne _020ED250
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
	b _020ED260
_020ED250:
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
_020ED260:
	cmp r0, #2
	moveq r1, sl, lsl #0x10
	moveq sl, r1, lsr #0x10
	cmp r0, #4
	cmpne r0, #6
	add r0, sp, #0x20
	bne _020ED2A8
	sub r5, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r3, [r5]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x430
	bl longlong2str__wide
	movs r6, r0
	beq _020ED5F8
	b _020ED2CC
_020ED2A8:
	sub r5, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	add r1, sp, #0x430
	mov r0, sl
	ldmia r5, {r2, r3}
	bl long2str__wide
	movs r6, r0
	beq _020ED5F8
_020ED2CC:
	add r0, sp, #0x400
	add r0, r0, #0x2e
	sub r0, r0, r6
	add r0, r0, r0, lsr #31
	mov r7, r0, asr #1
	b _020ED644
_020ED2E4:
	ldrb r0, [sp, #0x24]
	cmp r0, #9
	ldrne r0, [sp, #0x464]
	addne r0, r0, #8
	strne r0, [sp, #0x464]
	bne _020ED308
	ldr r0, [sp, #0x464]
	add r0, r0, #8
	str r0, [sp, #0x464]
_020ED308:
	ldr r7, [r0, #-8]
	ldr r6, [r0, #-4]
	add r0, sp, #0x20
	sub r5, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r3, [r5]
	mov r0, r7
	mov r1, r6
	add r2, sp, #0x430
	bl float2str__wide
	movs r6, r0
	beq _020ED5F8
	add r0, sp, #0x400
	add r0, r0, #0x2e
	sub r0, r0, r6
	add r0, r0, r0, lsr #31
	mov r7, r0, asr #1
	b _020ED644
_020ED354:
	ldrb r0, [sp, #0x24]
	cmp r0, #9
	ldrne r0, [sp, #0x464]
	addne r0, r0, #8
	strne r0, [sp, #0x464]
	bne _020ED378
	ldr r0, [sp, #0x464]
	add r0, r0, #8
	str r0, [sp, #0x464]
_020ED378:
	ldr r7, [r0, #-8]
	ldr r6, [r0, #-4]
	add r0, sp, #0x20
	sub r5, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r3, [r5]
	mov r0, r7
	mov r1, r6
	add r2, sp, #0x430
	bl double2hex__wide
	movs r6, r0
	beq _020ED5F8
	add r0, sp, #0x400
	add r0, r0, #0x2e
	sub r0, r0, r6
	add r0, r0, r0, lsr #31
	mov r7, r0, asr #1
	b _020ED644
_020ED3C4:
	ldrb r0, [sp, #0x24]
	cmp r0, #5
	bne _020ED460
	ldr r0, [sp, #0x464]
	add r0, r0, #4
	str r0, [sp, #0x464]
	ldr r6, [r0, #-4]
	ldrb r0, [sp, #0x23]
	cmp r6, #0
	ldreq r6, _020ED7A4 ; =buff_ptr$6E40
	cmp r0, #0
	beq _020ED418
	ldrh r1, [r6], #2
	ldrb r0, [sp, #0x22]
	and r7, r1, #0xff
	cmp r0, #0
	beq _020ED644
	ldr r0, [sp, #0x2c]
	cmp r7, r0
	movgt r7, r0
	b _020ED644
_020ED418:
	ldrb r0, [sp, #0x22]
	cmp r0, #0
	beq _020ED450
	ldr r7, [sp, #0x2c]
	mov r0, r6
	mov r2, r7
	mov r1, #0
	bl wmemchr
	cmp r0, #0
	beq _020ED644
	sub r0, r0, r6
	add r0, r0, r0, lsr #31
	mov r7, r0, asr #1
	b _020ED644
_020ED450:
	mov r0, r6
	bl wcslen
	mov r7, r0
	b _020ED644
_020ED460:
	ldr r0, [sp, #0x464]
	add r0, r0, #4
	str r0, [sp, #0x464]
	ldr r5, [r0, #-4]
	ldrb r0, [sp, #0x23]
	cmp r5, #0
	ldreq r5, _020ED7A8 ; =strptr$6E44
	cmp r0, #0
	beq _020ED4A8
	ldrh r1, [r6]
	ldrb r0, [sp, #0x22]
	and r6, r1, #0xff
	cmp r0, #0
	beq _020ED4E0
	ldr r0, [sp, #0x2c]
	cmp r6, r0
	movgt r6, r0
	b _020ED4E0
_020ED4A8:
	ldrb r0, [sp, #0x22]
	cmp r0, #0
	beq _020ED4D4
	ldr r6, [sp, #0x2c]
	mov r0, r5
	mov r2, r6
	mov r1, #0
	bl memchr
	cmp r0, #0
	subne r6, r0, r5
	b _020ED4E0
_020ED4D4:
	mov r0, r5
	bl strlen
	mov r6, r0
_020ED4E0:
	add r0, sp, #0x30
	mov r1, r5
	mov r2, r6
	bl mbstowcs
	movs r7, r0
	bmi _020ED5F8
	add r6, sp, #0x30
	b _020ED644
_020ED500:
	ldr r1, [sp, #0x464]
	ldrb r0, [sp, #0x24]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr r6, [r1, #-4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020ED780
_020ED520: ; jump table
	b _020ED544 ; case 0
	b _020ED780 ; case 1
	b _020ED54C ; case 2
	b _020ED554 ; case 3
	b _020ED57C ; case 4
	b _020ED780 ; case 5
	b _020ED55C ; case 6
	b _020ED56C ; case 7
	b _020ED574 ; case 8
_020ED544:
	str r4, [r6]
	b _020ED780
_020ED54C:
	strh r4, [r6]
	b _020ED780
_020ED554:
	str r4, [r6]
	b _020ED780
_020ED55C:
	str r4, [r6]
	mov r0, r4, asr #0x1f
	str r0, [r6, #4]
	b _020ED780
_020ED56C:
	str r4, [r6]
	b _020ED780
_020ED574:
	str r4, [r6]
	b _020ED780
_020ED57C:
	str r4, [r6]
	mov r0, r4, asr #0x1f
	str r0, [r6, #4]
	b _020ED780
_020ED58C:
	ldrb r0, [sp, #0x24]
	add r6, sp, #0x30
	cmp r0, #5
	bne _020ED5B8
	ldr r0, [sp, #0x464]
	mov r7, #1
	add r0, r0, #4
	str r0, [sp, #0x464]
	ldr r0, [r0, #-4]
	strh r0, [r6]
	b _020ED644
_020ED5B8:
	ldr r0, [sp, #0x464]
	add r1, sp, #0x18
	add r0, r0, #4
	str r0, [sp, #0x464]
	ldr r3, [r0, #-4]
	mov r0, r6
	mov r2, #1
	strb r3, [sp, #0x18]
	bl mbtowc
	mov r7, r0
	b _020ED644
_020ED5E4:
	mov r0, #0x25
	strh r0, [sp, #0x30]
	add r6, sp, #0x30
	mov r7, #1
	b _020ED644
_020ED5F8:
	ldr r0, [sp, #0xc]
	bl wcslen
	movs r5, r0
	beq _020ED630
	ldr r1, [sp, #0xc]
	mov r0, r8
	mov r2, r5
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x430
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_020ED630:
	add sp, sp, #0x430
	add r0, r4, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020ED644:
	ldrb r0, [sp, #0x20]
	mov r5, r7
	cmp r0, #0
	beq _020ED6F4
	cmp r0, #2
	moveq r1, #0x30
	movne r1, #0x20
	strh r1, [sp, #0x1c]
	ldrh r0, [r6]
	cmp r0, #0x2b
	cmpne r0, #0x2d
	cmpne r0, #0x20
	bne _020ED6B0
	cmp r1, #0x30
	bne _020ED6B0
	mov r0, r8
	mov r1, r6
	mov r2, #1
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x430
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	add r6, r6, #2
	sub r7, r7, #1
_020ED6B0:
	ldr r0, [sp, #0x28]
	cmp r5, r0
	bge _020ED6F4
_020ED6BC:
	mov r0, r8
	add r1, sp, #0x1c
	mov r2, #1
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x430
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #0x28]
	add r5, r5, #1
	cmp r5, r0
	blt _020ED6BC
_020ED6F4:
	cmp r7, #0
	beq _020ED724
	mov r0, r8
	mov r1, r6
	mov r2, r7
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x430
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_020ED724:
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	bne _020ED77C
	ldr r0, [sp, #0x28]
	cmp r5, r0
	bge _020ED77C
	mov r7, #0x20
_020ED740:
	mov r0, r8
	add r1, sp, #0x1a
	mov r2, #1
	strh r7, [sp, #0x1a]
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x430
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #0x28]
	add r5, r5, #1
	cmp r5, r0
	blt _020ED740
_020ED77C:
	add r4, r4, r5
_020ED780:
	ldrh r0, [fp]
	cmp r0, #0
	bne _020ECEEC
_020ED78C:
	mov r0, r4
	add sp, sp, #0x430
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020ED7A0: .word 0x0000FFFF
_020ED7A4: .word buff_ptr$6E40
_020ED7A8: .word strptr$6E44
	arm_func_end __wpformatter

	arm_func_start __wStringWrite
__wStringWrite: ; 0x020ED7AC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r3, [r4, #8]
	mov r5, r2
	ldr r2, [r4, #4]
	add r0, r3, r5
	cmp r0, r2
	ldr r0, [r4]
	subhi r5, r2, r3
	mov r2, r5
	add r0, r0, r3, lsl #1
	bl wmemcpy
	ldr r1, [r4, #8]
	add r1, r1, r5
	str r1, [r4, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __wStringWrite

	arm_func_start swprintf
swprintf: ; 0x020ED7EC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r3, sp, #0x10
	bic r3, r3, #3
	ldr r2, [sp, #0x10]
	add r3, r3, #4
	bl vswprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end swprintf

	arm_func_start vswprintf
vswprintf: ; 0x020ED814
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r4, r1
	mov ip, #0
	ldr r0, _020ED880 ; =__wStringWrite
	add r1, sp, #0
	str r5, [sp]
	str r4, [sp, #4]
	str ip, [sp, #8]
	bl __wpformatter
	cmp r0, #0
	addlt sp, sp, #0xc
	ldmltia sp!, {r4, r5, pc}
	cmp r0, r4
	bhs _020ED868
	mov r1, r0, lsl #1
	mov r2, #0
	add sp, sp, #0xc
	strh r2, [r5, r1]
	ldmia sp!, {r4, r5, pc}
_020ED868:
	mov r1, #0
	add r0, r5, r4, lsl #1
	strh r1, [r0, #-2]
	sub r0, r1, #1
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020ED880: .word __wStringWrite
	arm_func_end vswprintf

	exception long2str__wide, 0x0251, 0x0090FF20
	exception longlong2str__wide, 0x0301, 0x00A0FF20
	exception double2hex__wide, 0x0399, 0x00F07F20
	exception float2str__wide, 0x064C, float2str__wide_exception
	exception __wpformatter, 0x08F0, __wpformatter_exception
	exception __wStringWrite, 0x0041, 0x00200300
	exception swprintf, 0x0029, 0x00300020
	exception vswprintf, 0x0071, 0x00300300

	.section .exception,4,1,2

float2str__wide_exception: ; 0x020F4F9C
	.byte 0x20, 0xFF, 0x09, 0x60, 0x00, 0x00, 0x00, 0x00
__wpformatter_exception: ; 0x020F4FA4
	.byte 0x20, 0xFF, 0x11, 0x68, 0x00, 0x00, 0x00, 0x00
