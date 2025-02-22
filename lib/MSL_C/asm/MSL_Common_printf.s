	.include "asm/macros.inc"
	.include "MSL_Common_printf.inc"
	.include "global.inc"

	.data

	.balign 4, 0
printf_double2hex_0p0: ; 0x02111314
	.asciz "0x0p0"
	.size printf_double2hex_0p0,.-printf_double2hex_0p0

	.balign 4, 0
printf_double2hex_neg_inf_upper: ; 0x0211131C
	.asciz "-INF"
	.size printf_double2hex_neg_inf_upper,.-printf_double2hex_neg_inf_upper

	.balign 4, 0
printf_double2hex_neg_inf_lower: ; 0x02111324
	.asciz "-inf"
	.size printf_double2hex_neg_inf_lower,.-printf_double2hex_neg_inf_lower

	.balign 4, 0
printf_double2hex_inf_upper: ; 0x0211132C
	.asciz "INF"
	.size printf_double2hex_inf_upper,.-printf_double2hex_inf_upper

	.balign 4, 0
printf_double2hex_inf_lower: ; 0x02111330
	.asciz "inf"
	.size printf_double2hex_inf_lower,.-printf_double2hex_inf_lower

	.balign 4, 0
printf_double2hex_neg_nan_upper: ; 0x02111334
	.asciz "-NAN"
	.size printf_double2hex_neg_nan_upper,.-printf_double2hex_neg_nan_upper

	.balign 4, 0
printf_double2hex_neg_nan_lower: ; 0x0211133C
	.asciz "-nan"
	.size printf_double2hex_neg_nan_lower,.-printf_double2hex_neg_nan_lower

	.balign 4, 0
printf_double2hex_nan_upper: ; 0x02111344
	.asciz "NAN"
	.size printf_double2hex_nan_upper,.-printf_double2hex_nan_upper

	.balign 4, 0
printf_double2hex_nan_lower: ; 0x02111348
	.asciz "nan"
	.size printf_double2hex_nan_lower,.-printf_double2hex_nan_lower

	.balign 4, 0
__pformatter_empty_string_1: ; 0x0211134C
	.asciz ""
	.size __pformatter_empty_string_1,.-__pformatter_empty_string_1

	.balign 4, 0
__pformatter_empty_string_2: ; 0x02111350
	.asciz ""
	.size __pformatter_empty_string_2,.-__pformatter_empty_string_2

	.balign 4, 0
	.text

	arm_func_start parse_format
parse_format: ; 0x020E5CA0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldrsb r3, [r0, #1]
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
	add ip, r0, #1
	bne _020E5CFC
	add r0, sp, #0
	strb r3, [sp, #5]
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add sp, sp, #0x10
	add r0, ip, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020E5CFC:
	mov r2, #2
	mov r0, r4
	mov r5, r2
	mov r6, r4
	mov r7, #1
_020E5D10:
	mov r8, r7
	cmp r3, #0x2b
	bgt _020E5D40
	bge _020E5D68
	cmp r3, #0x23
	bgt _020E5D98
	cmp r3, #0x20
	blt _020E5D98
	beq _020E5D70
	cmp r3, #0x23
	beq _020E5D80
	b _020E5D98
_020E5D40:
	cmp r3, #0x30
	bgt _020E5D98
	cmp r3, #0x2d
	blt _020E5D98
	beq _020E5D60
	cmp r3, #0x30
	beq _020E5D88
	b _020E5D98
_020E5D60:
	strb r6, [sp]
	b _020E5D9C
_020E5D68:
	strb r7, [sp, #1]
	b _020E5D9C
_020E5D70:
	ldrb r4, [sp, #1]
	cmp r4, #1
	strneb r5, [sp, #1]
	b _020E5D9C
_020E5D80:
	strb r7, [sp, #3]
	b _020E5D9C
_020E5D88:
	ldrb r4, [sp]
	cmp r4, #0
	strneb r2, [sp]
	b _020E5D9C
_020E5D98:
	mov r8, r0
_020E5D9C:
	cmp r8, #0
	ldrnesb r3, [ip, #1]!
	bne _020E5D10
	cmp r3, #0x2a
	bne _020E5DE4
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	ldr r0, [r0, #-4]
	str r0, [sp, #8]
	cmp r0, #0
	bge _020E5DDC
	rsb r0, r0, #0
	mov r2, #0
	strb r2, [sp]
	str r0, [sp, #8]
_020E5DDC:
	ldrsb r3, [ip, #1]!
	b _020E5E34
_020E5DE4:
	ldr r4, _020E6228 ; =__msl_digit
	mov r5, #0
	mov r0, #0xa
	b _020E5E08
_020E5DF4:
	ldr r2, [sp, #8]
	sub r3, r3, #0x30
	mla r6, r2, r0, r3
	ldrsb r3, [ip, #1]!
	str r6, [sp, #8]
_020E5E08:
	cmp r3, #0
	blt _020E5E18
	cmp r3, #0x80
	blt _020E5E20
_020E5E18:
	mov r2, r5
	b _020E5E2C
_020E5E20:
	mov r2, r3, lsl #1
	ldrh r2, [r4, r2]
	and r2, r2, #8
_020E5E2C:
	cmp r2, #0
	bne _020E5DF4
_020E5E34:
	ldr r2, [sp, #8]
	ldr r0, _020E622C ; =0x000001FD
	cmp r2, r0
	ble _020E5E64
	mov r1, #0xff
	add r0, sp, #0
	strb r1, [sp, #5]
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add sp, sp, #0x10
	add r0, ip, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020E5E64:
	cmp r3, #0x2e
	bne _020E5EF8
	ldrsb r3, [ip, #1]!
	mov r0, #1
	strb r0, [sp, #2]
	cmp r3, #0x2a
	bne _020E5EA8
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	ldr r0, [r0, #-4]
	ldrsb r3, [ip, #1]!
	str r0, [sp, #0xc]
	cmp r0, #0
	movlt r0, #0
	strltb r0, [sp, #2]
	b _020E5EF8
_020E5EA8:
	ldr r2, _020E6228 ; =__msl_digit
	mov r4, #0
	mov r0, #0xa
	b _020E5ECC
_020E5EB8:
	ldr r1, [sp, #0xc]
	sub r3, r3, #0x30
	mla r5, r1, r0, r3
	ldrsb r3, [ip, #1]!
	str r5, [sp, #0xc]
_020E5ECC:
	cmp r3, #0
	blt _020E5EDC
	cmp r3, #0x80
	blt _020E5EE4
_020E5EDC:
	mov r1, r4
	b _020E5EF0
_020E5EE4:
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	and r1, r1, #8
_020E5EF0:
	cmp r1, #0
	bne _020E5EB8
_020E5EF8:
	cmp r3, #0x6c
	mov r0, #1
	bgt _020E5F30
	cmp r3, #0x68
	blt _020E5F24
	beq _020E5F4C
	cmp r3, #0x6a
	beq _020E5F98
	cmp r3, #0x6c
	beq _020E5F68
	b _020E5FBC
_020E5F24:
	cmp r3, #0x4c
	beq _020E5F8C
	b _020E5FBC
_020E5F30:
	cmp r3, #0x74
	bgt _020E5F40
	beq _020E5FA4
	b _020E5FBC
_020E5F40:
	cmp r3, #0x7a
	beq _020E5FB0
	b _020E5FBC
_020E5F4C:
	ldrsb r1, [ip, #1]
	mov r2, #2
	strb r2, [sp, #4]
	cmp r1, #0x68
	streqb r0, [sp, #4]
	ldreqsb r3, [ip, #1]!
	b _020E5FC0
_020E5F68:
	ldrsb r1, [ip, #1]
	mov r2, #3
	strb r2, [sp, #4]
	cmp r1, #0x6c
	bne _020E5FC0
	mov r1, #4
	strb r1, [sp, #4]
	ldrsb r3, [ip, #1]!
	b _020E5FC0
_020E5F8C:
	mov r1, #9
	strb r1, [sp, #4]
	b _020E5FC0
_020E5F98:
	mov r1, #6
	strb r1, [sp, #4]
	b _020E5FC0
_020E5FA4:
	mov r1, #8
	strb r1, [sp, #4]
	b _020E5FC0
_020E5FB0:
	mov r1, #7
	strb r1, [sp, #4]
	b _020E5FC0
_020E5FBC:
	mov r0, #0
_020E5FC0:
	cmp r0, #0
	ldrnesb r3, [ip, #1]!
	strb r3, [sp, #5]
	cmp r3, #0x61
	bgt _020E6014
	bge _020E60FC
	cmp r3, #0x47
	bgt _020E6008
	subs r0, r3, #0x41
	addpl pc, pc, r0, lsl #2
	b _020E6208
_020E5FEC: ; jump table
	b _020E60FC ; case 0
	b _020E6208 ; case 1
	b _020E6208 ; case 2
	b _020E6208 ; case 3
	b _020E6144 ; case 4
	b _020E60C4 ; case 5
	b _020E6134 ; case 6
_020E6008:
	cmp r3, #0x58
	beq _020E6088
	b _020E6208
_020E6014:
	cmp r3, #0x63
	bgt _020E6024
	beq _020E61A4
	b _020E6208
_020E6024:
	sub r0, r3, #0x64
	cmp r0, #0x14
	addls pc, pc, r0, lsl #2
	b _020E6208
_020E6034: ; jump table
	b _020E6088 ; case 0
	b _020E6144 ; case 1
	b _020E60C4 ; case 2
	b _020E6134 ; case 3
	b _020E6208 ; case 4
	b _020E6088 ; case 5
	b _020E6208 ; case 6
	b _020E6208 ; case 7
	b _020E6208 ; case 8
	b _020E6208 ; case 9
	b _020E61F4 ; case 10
	b _020E6088 ; case 11
	b _020E6180 ; case 12
	b _020E6208 ; case 13
	b _020E6208 ; case 14
	b _020E61D0 ; case 15
	b _020E6208 ; case 16
	b _020E6088 ; case 17
	b _020E6208 ; case 18
	b _020E6208 ; case 19
	b _020E6088 ; case 20
_020E6088:
	ldrb r0, [sp, #4]
	cmp r0, #9
	moveq r0, #0xff
	streqb r0, [sp, #5]
	beq _020E6210
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
	beq _020E6210
	ldrb r0, [sp]
	cmp r0, #2
	moveq r0, #1
	streqb r0, [sp]
	b _020E6210
_020E60C4:
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	moveq r0, #0xff
	streqb r0, [sp, #5]
	beq _020E6210
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp, #0xc]
	b _020E6210
_020E60FC:
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
	moveq r0, #0xff
	streqb r0, [sp, #5]
	b _020E6210
_020E6134:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
_020E6144:
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	cmpne r0, #1
	moveq r0, #0xff
	streqb r0, [sp, #5]
	beq _020E6210
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp, #0xc]
	b _020E6210
_020E6180:
	mov r3, #0x78
	mov r2, #1
	mov r1, #3
	mov r0, #8
	strb r3, [sp, #5]
	strb r2, [sp, #3]
	strb r1, [sp, #4]
	str r0, [sp, #0xc]
	b _020E6210
_020E61A4:
	ldrb r1, [sp, #4]
	cmp r1, #3
	moveq r0, #5
	streqb r0, [sp, #4]
	beq _020E6210
	ldrb r0, [sp, #2]
	cmp r0, #0
	cmpeq r1, #0
	movne r0, #0xff
	strneb r0, [sp, #5]
	b _020E6210
_020E61D0:
	ldrb r0, [sp, #4]
	cmp r0, #3
	moveq r0, #5
	streqb r0, [sp, #4]
	beq _020E6210
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sp, #5]
	b _020E6210
_020E61F4:
	ldrb r0, [sp, #4]
	cmp r0, #9
	moveq r0, #0xff
	streqb r0, [sp, #5]
	b _020E6210
_020E6208:
	mov r0, #0xff
	strb r0, [sp, #5]
_020E6210:
	add r0, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add r0, ip, #1
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020E6228: .word __msl_digit
_020E622C: .word 0x000001FD
	arm_func_end parse_format

	arm_func_start long2str
long2str: ; 0x020E6230
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	movs sl, r0
	mov r0, #0
	mov r5, r1
	str r0, [sp, #0xc]
	ldr r7, [sp, #0x4c]
	mov r6, r0
	strb r0, [r5, #-1]!
	ldrb r0, [sp, #0x43]
	str r1, [sp]
	ldrb r8, [sp, #0x45]
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	ldrb fp, [sp, #0x41]
	str r0, [sp, #8]
	cmpeq r7, #0
	bne _020E62A4
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020E6290
	cmp r8, #0x6f
	beq _020E62A4
_020E6290:
	add sp, sp, #0x10
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E62A4:
	cmp r8, #0x69
	bgt _020E62CC
	bge _020E6300
	cmp r8, #0x58
	bgt _020E62C0
	beq _020E632C
	b _020E6334
_020E62C0:
	cmp r8, #0x64
	beq _020E6300
	b _020E6334
_020E62CC:
	cmp r8, #0x6f
	bgt _020E62E0
	moveq r4, #8
	moveq fp, #0
	b _020E6334
_020E62E0:
	cmp r8, #0x78
	bgt _020E6334
	cmp r8, #0x75
	blt _020E6334
	beq _020E6320
	cmp r8, #0x78
	beq _020E632C
	b _020E6334
_020E6300:
	cmp sl, #0
	mov r4, #0xa
	bge _020E6334
	mov r0, #1
	cmp sl, #0x80000000
	rsbne sl, sl, #0
	str r0, [sp, #0xc]
	b _020E6334
_020E6320:
	mov r4, #0xa
	mov fp, #0
	b _020E6334
_020E632C:
	mov r4, #0x10
	mov fp, #0
_020E6334:
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
	blt _020E636C
	cmp r8, #0x78
	addeq sb, sb, #0x57
	addne sb, sb, #0x37
_020E636C:
	cmp sl, #0
	strb sb, [r5, #-1]!
	add r6, r6, #1
	bne _020E6334
	cmp r4, #8
	bne _020E63A0
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrnesb r0, [r5]
	cmpne r0, #0x30
	movne r0, #0x30
	strneb r0, [r5, #-1]!
	addne r6, r6, #1
_020E63A0:
	ldrb r0, [sp, #0x40]
	cmp r0, #2
	bne _020E63D4
	ldr r0, [sp, #0xc]
	ldr r7, [sp, #8]
	cmp r0, #0
	cmpeq fp, #0
	subne r7, r7, #1
	cmp r4, #0x10
	bne _020E63D4
	ldr r0, [sp, #4]
	cmp r0, #0
	subne r7, r7, #2
_020E63D4:
	ldr r0, [sp]
	sub r1, r0, r5
	ldr r0, _020E6478 ; =0x000001FD
	add r1, r7, r1
	cmp r1, r0
	addgt sp, sp, #0x10
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	cmp r6, r7
	bge _020E6418
	mov r0, #0x30
_020E6408:
	add r6, r6, #1
	cmp r6, r7
	strb r0, [r5, #-1]!
	blt _020E6408
_020E6418:
	cmp r4, #0x10
	bne _020E6434
	ldr r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x30
	strneb r8, [r5, #-1]
	strneb r0, [r5, #-2]!
_020E6434:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r5, #-1]!
	bne _020E6464
	cmp fp, #1
	moveq r0, #0x2b
	streqb r0, [r5, #-1]!
	beq _020E6464
	cmp fp, #2
	moveq r0, #0x20
	streqb r0, [r5, #-1]!
_020E6464:
	mov r0, r5
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E6478: .word 0x000001FD
	arm_func_end long2str

	arm_func_start longlong2str
longlong2str: ; 0x020E647C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov sb, r1
	mov r1, #0
	mov sl, r0
	mov r8, r2
	mov r0, r1
	strb r0, [r8, #-1]!
	ldr r0, [sp, #0x58]
	cmp sb, #0
	str r0, [sp, #0x14]
	ldrb r0, [sp, #0x4f]
	cmpeq sl, #0
	str r2, [sp]
	str r0, [sp, #4]
	ldrb r0, [sp, #0x51]
	str r1, [sp, #0x18]
	mov fp, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0x54]
	str r0, [sp, #0xc]
	ldrb r0, [sp, #0x4d]
	str r0, [sp, #0x10]
	ldreq r0, [sp, #0x14]
	cmpeq r0, #0
	bne _020E6514
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020E6500
	ldr r0, [sp, #8]
	cmp r0, #0x6f
	beq _020E6514
_020E6500:
	add sp, sp, #0x1c
	mov r0, r8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E6514:
	ldr r0, [sp, #8]
	cmp r0, #0x69
	bgt _020E6540
	bge _020E6570
	cmp r0, #0x58
	bgt _020E6534
	beq _020E65C4
	b _020E65D0
_020E6534:
	cmp r0, #0x64
	beq _020E6570
	b _020E65D0
_020E6540:
	cmp r0, #0x6f
	bgt _020E6550
	beq _020E65A4
	b _020E65D0
_020E6550:
	cmp r0, #0x78
	bgt _020E65D0
	cmp r0, #0x75
	blt _020E65D0
	beq _020E65B4
	cmp r0, #0x78
	beq _020E65C4
	b _020E65D0
_020E6570:
	subs r0, sl, #0
	sbcs r0, sb, #0
	mov r7, #0xa
	mov r6, #0
	bge _020E65D0
	cmp sb, #0x80000000
	cmpeq sl, r6
	beq _020E6598
	rsbs sl, sl, #0
	rsc sb, sb, #0
_020E6598:
	mov r0, #1
	str r0, [sp, #0x18]
	b _020E65D0
_020E65A4:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #8
	b _020E65D0
_020E65B4:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #0xa
	b _020E65D0
_020E65C4:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #0x10
_020E65D0:
	mov r4, #0
_020E65D4:
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
	blt _020E6624
	ldr r0, [sp, #8]
	cmp r0, #0x78
	addeq r0, r5, #0x57
	addne r0, r5, #0x37
_020E6624:
	strb r0, [r8, #-1]!
	mov r0, #0
	cmp sb, r0
	cmpeq sl, r4
	add fp, fp, #1
	bne _020E65D4
	cmp r6, #0
	cmpeq r7, #8
	bne _020E6664
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrnesb r0, [r8]
	cmpne r0, #0x30
	movne r0, #0x30
	strneb r0, [r8, #-1]!
	addne fp, fp, #1
_020E6664:
	ldrb r0, [sp, #0x4c]
	cmp r0, #2
	bne _020E66B4
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
	bne _020E66B4
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrne r0, [sp, #0x14]
	subne r0, r0, #2
	strne r0, [sp, #0x14]
_020E66B4:
	ldr r0, [sp]
	ldr r1, _020E6774 ; =0x000001FD
	sub r2, r0, r8
	ldr r0, [sp, #0x14]
	add r0, r0, r2
	cmp r0, r1
	addgt sp, sp, #0x1c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	ldr r0, [sp, #0x14]
	cmp fp, r0
	bge _020E6704
	mov r1, #0x30
_020E66F0:
	ldr r0, [sp, #0x14]
	add fp, fp, #1
	cmp fp, r0
	strb r1, [r8, #-1]!
	blt _020E66F0
_020E6704:
	cmp r6, #0
	cmpeq r7, #0x10
	bne _020E672C
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020E672C
	ldr r0, [sp, #8]
	mov r1, #0x30
	strb r0, [r8, #-1]
	strb r1, [r8, #-2]!
_020E672C:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r8, #-1]!
	bne _020E6760
	ldr r0, [sp, #0x10]
	cmp r0, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _020E6760
	cmp r0, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
_020E6760:
	mov r0, r8
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E6774: .word 0x000001FD
	arm_func_end longlong2str

	arm_func_start double2hex
double2hex: ; 0x020E6778
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x44
	ldr r7, [sp, #0x80]
	ldr r0, _020E6C28 ; =0x000001FD
	mov r8, r2
	cmp r7, r0
	ldrb r6, [sp, #0x79]
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
	bne _020E6844
	ldr r3, _020E6C2C ; =printf_double2hex_0p0
	sub r0, r8, #6
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	add sp, sp, #0x44
	strb r2, [r8, #-6]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r2, [r3, #4]
	ldrb r1, [r3, #5]
	strb r2, [r0, #4]
	strb r1, [r0, #5]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E6844:
	ldrb r0, [sp, #0x11]
	cmp r0, #0x49
	bne _020E6954
	ldrsb r0, [sp, #0xc]
	cmp r0, #0
	beq _020E68E0
	cmp r6, #0x41
	sub r0, r8, #5
	bne _020E68A4
	ldr r3, _020E6C30 ; =printf_double2hex_neg_inf_upper
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E68A4:
	ldr r3, _020E6C34 ; =printf_double2hex_neg_inf_lower
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E68E0:
	cmp r6, #0x41
	sub r0, r8, #4
	bne _020E6920
	ldr r3, _020E6C38 ; =printf_double2hex_inf_upper
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E6920:
	ldr r3, _020E6C3C ; =printf_double2hex_inf_lower
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E6954:
	cmp r0, #0x4e
	bne _020E6A60
	ldrsb r0, [sp, #0xc]
	cmp r0, #0
	beq _020E69EC
	cmp r6, #0x41
	sub r0, r8, #5
	bne _020E69B0
	ldr r3, _020E6C40 ; =printf_double2hex_neg_nan_upper
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E69B0:
	ldr r3, _020E6C44 ; =printf_double2hex_neg_nan_lower
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E69EC:
	cmp r6, #0x41
	sub r0, r8, #4
	bne _020E6A2C
	ldr r3, _020E6C48 ; =printf_double2hex_nan_upper
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E6A2C:
	ldr r3, _020E6C4C ; =printf_double2hex_nan_lower
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E6A60:
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
	strb r0, [sp, #0x39]
_020E6A90:
	rsb r1, r3, #7
	ldrsb r2, [sb, r3]
	ldrsb r0, [sb, r1]
	strb r0, [sb, r3]
	add r3, r3, #1
	strb r2, [sb, r1]
	cmp r3, #4
	blt _020E6A90
	ldrb r0, [sp, #0x69]
	ldrb r1, [sp, #0x68]
	ldr sb, _020E6C50 ; =0x000007FF
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
	bl long2str
	cmp r6, #0x61
	moveq r1, #0x70
	movne r1, #0x50
	strb r1, [r0, #-1]!
	mov r1, r7, lsl #2
	mov lr, r7
	cmp r7, #1
	add r8, r1, #0xb
	add ip, sp, #0x68
	blt _020E6BA0
	mov sb, #0x30
_020E6B18:
	cmp r8, #0x40
	bge _020E6B88
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
	beq _020E6B5C
	ldrb r2, [sl, #-1]
	mov r2, r2, lsl #8
	orr r1, r1, r2, asr r3
	and r1, r1, #0xff
_020E6B5C:
	and r1, r1, #0xf
	cmp r1, #0xa
	addlo r1, r1, #0x30
	andlo r1, r1, #0xff
	blo _020E6B8C
	cmp r6, #0x61
	addeq r1, r1, #0x57
	andeq r1, r1, #0xff
	addne r1, r1, #0x37
	andne r1, r1, #0xff
	b _020E6B8C
_020E6B88:
	mov r1, sb
_020E6B8C:
	sub lr, lr, #1
	cmp lr, #1
	strb r1, [r0, #-1]!
	sub r8, r8, #4
	bge _020E6B18
_020E6BA0:
	cmp r7, #0
	cmpeq r5, #0
	movne r1, #0x2e
	strneb r1, [r0, #-1]!
	mov r1, #0x31
	strb r1, [r0, #-1]
	cmp r6, #0x61
	moveq r1, #0x78
	movne r1, #0x58
	strb r1, [r0, #-2]!
	mov r1, #0x30
	strb r1, [r0, #-1]!
	ldrsb r1, [sp, #0xc]
	cmp r1, #0
	movne r1, #0x2d
	strneb r1, [r0, #-1]!
	addne sp, sp, #0x44
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addne sp, sp, #0x10
	bxne lr
	cmp r4, #1
	moveq r1, #0x2b
	streqb r1, [r0, #-1]!
	addeq sp, sp, #0x44
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addeq sp, sp, #0x10
	bxeq lr
	cmp r4, #2
	moveq r1, #0x20
	streqb r1, [r0, #-1]!
	add sp, sp, #0x44
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E6C28: .word 0x000001FD
_020E6C2C: .word printf_double2hex_0p0
_020E6C30: .word printf_double2hex_neg_inf_upper
_020E6C34: .word printf_double2hex_neg_inf_lower
_020E6C38: .word printf_double2hex_inf_upper
_020E6C3C: .word printf_double2hex_inf_lower
_020E6C40: .word printf_double2hex_neg_nan_upper
_020E6C44: .word printf_double2hex_neg_nan_lower
_020E6C48: .word printf_double2hex_nan_upper
_020E6C4C: .word printf_double2hex_nan_lower
_020E6C50: .word 0x000007FF
	arm_func_end double2hex

	arm_func_start round_decimal
round_decimal: ; 0x020E6C54
	stmdb sp!, {r4, lr}
	cmp r1, #0
	bge _020E6C7C
_020E6C60:
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #1
	strb r1, [r0, #4]
	mov r1, #0x30
	strb r1, [r0, #5]
	ldmia sp!, {r4, pc}
_020E6C7C:
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
	bne _020E6CDC
	add ip, ip, lr
_020E6CB0:
	sub ip, ip, #1
	cmp ip, r2
	bls _020E6CC8
	ldrsb r3, [ip]
	cmp r3, #0x30
	beq _020E6CB0
_020E6CC8:
	cmp ip, r2
	ldreqsb r3, [r2, #-1]
	andeq r4, r3, #1
	movne r4, #1
	b _020E6CE4
_020E6CDC:
	movgt r4, #1
	movle r4, #0
_020E6CE4:
	cmp r1, #0
	beq _020E6D40
	mov ip, #0
	mov lr, #1
_020E6CF4:
	ldrsb r3, [r2, #-1]!
	sub r3, r3, #0x30
	add r3, r3, r4
	mov r3, r3, lsl #0x18
	mov r3, r3, asr #0x18
	cmp r3, #9
	movgt r4, lr
	movle r4, ip
	cmp r4, #0
	bne _020E6D24
	cmp r3, #0
	bne _020E6D2C
_020E6D24:
	sub r1, r1, #1
	b _020E6D38
_020E6D2C:
	add r3, r3, #0x30
	strb r3, [r2]
	b _020E6D40
_020E6D38:
	cmp r1, #0
	bne _020E6CF4
_020E6D40:
	cmp r4, #0
	beq _020E6D68
	ldrsh r3, [r0, #2]
	mov r2, #1
	mov r1, #0x31
	add r3, r3, #1
	strh r3, [r0, #2]
	strb r2, [r0, #4]
	strb r1, [r0, #5]
	ldmia sp!, {r4, pc}
_020E6D68:
	cmp r1, #0
	beq _020E6C60
	strb r1, [r0, #4]
	ldmia sp!, {r4, pc}
	arm_func_end round_decimal

	arm_func_start float2str
float2str: ; 0x020E6D78
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	ldr r7, [sp, #0x68]
	ldr r3, _020E74B0 ; =0x000001FD
	ldrb r6, [sp, #0x61]
	ldrb r5, [sp, #0x5f]
	ldrb r4, [sp, #0x5d]
	cmp r7, r3
	mov sl, r0
	mov r8, r1
	mov sb, r2
	addgt sp, sp, #0x2c
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
	b _020E6E08
_020E6DF0:
	ldrb r2, [sp, #8]
	ldrsh r1, [sp, #6]
	sub r2, r2, #1
	add r1, r1, #1
	strb r2, [sp, #8]
	strh r1, [sp, #6]
_020E6E08:
	ldrb r1, [sp, #8]
	cmp r1, #1
	bls _020E6E20
	ldrsb r1, [r0, #-1]!
	cmp r1, #0x30
	beq _020E6DF0
_020E6E20:
	ldrb r0, [sp, #9]
	cmp r0, #0x30
	beq _020E6E40
	cmp r0, #0x49
	beq _020E6E4C
	cmp r0, #0x4e
	beq _020E6FAC
	b _020E7100
_020E6E40:
	mov r0, #0
	strh r0, [sp, #6]
	b _020E7100
_020E6E4C:
	mov r2, #0
	mov r0, sl
	mov r1, r8
	mov r3, r2
	bl _dls
	bhs _020E6F10
	cmp r6, #0
	sub r0, sb, #5
	blt _020E6E78
	cmp r6, #0x80
	blt _020E6E80
_020E6E78:
	mov r1, #0
	b _020E6E90
_020E6E80:
	ldr r1, _020E74B4 ; =__msl_digit
	mov r2, r6, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #0x200
_020E6E90:
	cmp r1, #0
	beq _020E6ED4
	ldr r3, _020E74B8 ; =printf_double2hex_neg_inf_upper
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E6ED4:
	ldr r3, _020E74BC ; =printf_double2hex_neg_inf_lower
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E6F10:
	cmp r6, #0
	sub r0, sb, #4
	blt _020E6F24
	cmp r6, #0x80
	blt _020E6F2C
_020E6F24:
	mov r1, #0
	b _020E6F3C
_020E6F2C:
	ldr r1, _020E74B4 ; =__msl_digit
	mov r2, r6, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #0x200
_020E6F3C:
	cmp r1, #0
	beq _020E6F78
	ldr r3, _020E74C0 ; =printf_double2hex_inf_upper
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E6F78:
	ldr r3, _020E74C4 ; =printf_double2hex_inf_lower
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E6FAC:
	ldrsb r0, [sp, #4]
	cmp r0, #0
	beq _020E7064
	cmp r6, #0
	sub r0, sb, #5
	blt _020E6FCC
	cmp r6, #0x80
	blt _020E6FD4
_020E6FCC:
	mov r1, #0
	b _020E6FE4
_020E6FD4:
	ldr r1, _020E74B4 ; =__msl_digit
	mov r2, r6, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #0x200
_020E6FE4:
	cmp r1, #0
	beq _020E7028
	ldr r3, _020E74C8 ; =printf_double2hex_neg_nan_upper
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E7028:
	ldr r3, _020E74CC ; =printf_double2hex_neg_nan_lower
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E7064:
	cmp r6, #0
	sub r0, sb, #4
	blt _020E7078
	cmp r6, #0x80
	blt _020E7080
_020E7078:
	mov r1, #0
	b _020E7090
_020E7080:
	ldr r1, _020E74B4 ; =__msl_digit
	mov r2, r6, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #0x200
_020E7090:
	cmp r1, #0
	beq _020E70CC
	ldr r3, _020E74D0 ; =printf_double2hex_nan_upper
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E70CC:
	ldr r3, _020E74D4 ; =printf_double2hex_nan_lower
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E7100:
	ldrb r0, [sp, #8]
	ldrsh r1, [sp, #6]
	sub r8, sb, #1
	sub r0, r0, #1
	add r0, r1, r0
	strh r0, [sp, #6]
	mov r0, #0
	strb r0, [r8]
	cmp r6, #0x65
	bgt _020E7154
	bge _020E71E0
	cmp r6, #0x47
	bgt _020E749C
	cmp r6, #0x45
	blt _020E749C
	beq _020E71E0
	cmp r6, #0x46
	beq _020E7328
	cmp r6, #0x47
	beq _020E716C
	b _020E749C
_020E7154:
	cmp r6, #0x66
	bgt _020E7164
	beq _020E7328
	b _020E749C
_020E7164:
	cmp r6, #0x67
	bne _020E749C
_020E716C:
	ldrb r0, [sp, #8]
	cmp r0, r7
	ble _020E7184
	add r0, sp, #4
	mov r1, r7
	bl round_decimal
_020E7184:
	ldrsh r2, [sp, #6]
	mvn r0, #3
	cmp r2, r0
	blt _020E719C
	cmp r2, r7
	blt _020E71BC
_020E719C:
	cmp r5, #0
	ldreqb r0, [sp, #8]
	subne r7, r7, #1
	subeq r7, r0, #1
	cmp r6, #0x67
	moveq r6, #0x65
	movne r6, #0x45
	b _020E71E0
_020E71BC:
	cmp r5, #0
	addne r0, r2, #1
	subne r7, r7, r0
	bne _020E7328
	ldrb r1, [sp, #8]
	add r0, r2, #1
	subs r7, r1, r0
	movmi r7, #0
	b _020E7328
_020E71E0:
	ldrb r0, [sp, #8]
	add r1, r7, #1
	cmp r0, r1
	ble _020E71F8
	add r0, sp, #4
	bl round_decimal
_020E71F8:
	ldrsh lr, [sp, #6]
	mov fp, #0x2b
	mov sl, #0
	cmp lr, #0
	rsblt lr, lr, #0
	movlt fp, #0x2d
	ldr r3, _020E74D8 ; =0x66666667
	mov r0, #0xa
	b _020E724C
_020E721C:
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
_020E724C:
	cmp lr, #0
	bne _020E721C
	cmp sl, #2
	blt _020E721C
	strb fp, [r8, #-1]
	strb r6, [r8, #-2]!
	sub r1, sb, r8
	ldr r0, _020E74B0 ; =0x000001FD
	add r1, r7, r1
	cmp r1, r0
	addgt sp, sp, #0x2c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	ldrb r1, [sp, #8]
	add r0, r7, #1
	cmp r1, r0
	bge _020E72B8
	add r0, r7, #2
	sub r0, r0, r1
	subs r1, r0, #1
	beq _020E72B8
	mov r0, #0x30
_020E72AC:
	strb r0, [r8, #-1]!
	subs r1, r1, #1
	bne _020E72AC
_020E72B8:
	ldrb r1, [sp, #8]
	add r0, sp, #9
	add r2, r0, r1
	subs r1, r1, #1
	beq _020E72DC
_020E72CC:
	ldrsb r0, [r2, #-1]!
	subs r1, r1, #1
	strb r0, [r8, #-1]!
	bne _020E72CC
_020E72DC:
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
	bne _020E749C
	cmp r4, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _020E749C
	cmp r4, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
	b _020E749C
_020E7328:
	ldrsh r3, [sp, #6]
	ldrb r2, [sp, #8]
	sub r0, r2, r3
	subs r1, r0, #1
	movmi r1, #0
	cmp r1, r7
	ble _020E7368
	sub r1, r1, r7
	add r0, sp, #4
	sub r1, r2, r1
	bl round_decimal
	ldrsh r3, [sp, #6]
	ldrb r2, [sp, #8]
	sub r0, r2, r3
	subs r1, r0, #1
	movmi r1, #0
_020E7368:
	adds r0, r3, #1
	movmi r0, #0
	ldr r3, _020E74B0 ; =0x000001FD
	add r6, r0, r1
	cmp r6, r3
	addgt sp, sp, #0x2c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	add r3, sp, #9
	sub r6, r7, r1
	cmp r6, #0
	add r2, r3, r2
	mov sb, #0
	ble _020E73BC
	mov r3, #0x30
_020E73AC:
	add sb, sb, #1
	cmp sb, r6
	strb r3, [r8, #-1]!
	blt _020E73AC
_020E73BC:
	mov r6, #0
	b _020E73D0
_020E73C4:
	ldrsb r3, [r2, #-1]!
	add r6, r6, #1
	strb r3, [r8, #-1]!
_020E73D0:
	cmp r6, r1
	ldrltb r3, [sp, #8]
	cmplt r6, r3
	blt _020E73C4
	cmp r6, r1
	bge _020E73FC
	mov r3, #0x30
_020E73EC:
	add r6, r6, #1
	cmp r6, r1
	strb r3, [r8, #-1]!
	blt _020E73EC
_020E73FC:
	cmp r7, #0
	cmpeq r5, #0
	movne r1, #0x2e
	strneb r1, [r8, #-1]!
	cmp r0, #0
	beq _020E7464
	ldrb r1, [sp, #8]
	mov r5, #0
	sub r1, r0, r1
	cmp r1, #0
	ble _020E7444
	mov r3, #0x30
_020E742C:
	strb r3, [r8, #-1]!
	ldrb r1, [sp, #8]
	add r5, r5, #1
	sub r1, r0, r1
	cmp r5, r1
	blt _020E742C
_020E7444:
	cmp r5, r0
	bge _020E746C
_020E744C:
	ldrsb r1, [r2, #-1]!
	add r5, r5, #1
	cmp r5, r0
	strb r1, [r8, #-1]!
	blt _020E744C
	b _020E746C
_020E7464:
	mov r0, #0x30
	strb r0, [r8, #-1]!
_020E746C:
	ldrsb r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r8, #-1]!
	bne _020E749C
	cmp r4, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _020E749C
	cmp r4, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
_020E749C:
	mov r0, r8
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E74B0: .word 0x000001FD
_020E74B4: .word __msl_digit
_020E74B8: .word printf_double2hex_neg_inf_upper
_020E74BC: .word printf_double2hex_neg_inf_lower
_020E74C0: .word printf_double2hex_inf_upper
_020E74C4: .word printf_double2hex_inf_lower
_020E74C8: .word printf_double2hex_neg_nan_upper
_020E74CC: .word printf_double2hex_neg_nan_lower
_020E74D0: .word printf_double2hex_nan_upper
_020E74D4: .word printf_double2hex_nan_lower
_020E74D8: .word 0x66666667
	arm_func_end float2str

	arm_func_start __pformatter
__pformatter: ; 0x020E74DC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x22c
	mov r3, #0x20
	mov fp, r2
	strb r3, [sp, #0x19]
	ldrsb r2, [fp]
	mov sb, r0
	mov r8, r1
	cmp r2, #0
	mov sl, #0
	beq _020E7CE4
_020E750C:
	mov r0, fp
	mov r1, #0x25
	bl strchr
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _020E7560
	mov r0, fp
	bl strlen
	movs r2, r0
	add sl, sl, r2
	beq _020E7CE4
	mov r0, r8
	mov r1, fp
	blx sb
	cmp r0, #0
	bne _020E7CE4
	add sp, sp, #0x22c
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E7560:
	subs r2, r0, fp
	add sl, sl, r2
	beq _020E7590
	mov r0, r8
	mov r1, fp
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_020E7590:
	ldr r0, [sp, #0xc]
	add r1, sp, #0x25c
	add r2, sp, #0x1c
	bl parse_format
	ldrb r1, [sp, #0x21]
	mov fp, r0
	cmp r1, #0x61
	bgt _020E75FC
	bge _020E7960
	cmp r1, #0x47
	bgt _020E75F0
	subs r0, r1, #0x41
	addpl pc, pc, r0, lsl #2
	b _020E75E4
_020E75C8: ; jump table
	b _020E7960 ; case 0
	b _020E7B48 ; case 1
	b _020E7B48 ; case 2
	b _020E7B48 ; case 3
	b _020E78F8 ; case 4
	b _020E78F8 ; case 5
	b _020E78F8 ; case 6
_020E75E4:
	cmp r1, #0x25
	beq _020E7B34
	b _020E7B48
_020E75F0:
	cmp r1, #0x58
	beq _020E77BC
	b _020E7B48
_020E75FC:
	cmp r1, #0x75
	bgt _020E7664
	subs r0, r1, #0x64
	addpl pc, pc, r0, lsl #2
	b _020E7658
_020E7610: ; jump table
	b _020E767C ; case 0
	b _020E78F8 ; case 1
	b _020E78F8 ; case 2
	b _020E78F8 ; case 3
	b _020E7B48 ; case 4
	b _020E767C ; case 5
	b _020E7B48 ; case 6
	b _020E7B48 ; case 7
	b _020E7B48 ; case 8
	b _020E7B48 ; case 9
	b _020E7A88 ; case 10
	b _020E77BC ; case 11
	b _020E7B48 ; case 12
	b _020E7B48 ; case 13
	b _020E7B48 ; case 14
	b _020E79C8 ; case 15
	b _020E7B48 ; case 16
	b _020E77BC ; case 17
_020E7658:
	cmp r1, #0x63
	beq _020E7B14
	b _020E7B48
_020E7664:
	cmp r1, #0x78
	bgt _020E7674
	beq _020E77BC
	b _020E7B48
_020E7674:
	cmp r1, #0xff
	b _020E7B48
_020E767C:
	ldrb r0, [sp, #0x20]
	cmp r0, #3
	bne _020E769C
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _020E7734
_020E769C:
	cmp r0, #4
	bne _020E76C4
	ldr r1, [sp, #0x25c]
	add r2, r1, #8
	str r2, [sp, #0x25c]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020E7734
_020E76C4:
	cmp r0, #6
	bne _020E76EC
	ldr r1, [sp, #0x25c]
	add r2, r1, #8
	str r2, [sp, #0x25c]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020E7734
_020E76EC:
	cmp r0, #7
	bne _020E7708
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _020E7734
_020E7708:
	cmp r0, #8
	bne _020E7724
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _020E7734
_020E7724:
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
_020E7734:
	cmp r0, #2
	moveq r1, r5, lsl #0x10
	moveq r5, r1, asr #0x10
	cmp r0, #1
	moveq r1, r5, lsl #0x18
	moveq r5, r1, asr #0x18
	cmp r0, #4
	cmpne r0, #6
	add r0, sp, #0x1c
	bne _020E7788
	sub r4, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r3, [r4]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x22c
	bl longlong2str
	movs r7, r0
	beq _020E7B48
	b _020E77AC
_020E7788:
	sub r4, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	add r1, sp, #0x22c
	mov r0, r5
	ldmia r4, {r2, r3}
	bl long2str
	movs r7, r0
	beq _020E7B48
_020E77AC:
	add r0, sp, #0x200
	add r0, r0, #0x2b
	sub r6, r0, r7
	b _020E7B94
_020E77BC:
	ldrb r0, [sp, #0x20]
	cmp r0, #3
	bne _020E77DC
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _020E7874
_020E77DC:
	cmp r0, #4
	bne _020E7804
	ldr r1, [sp, #0x25c]
	add r2, r1, #8
	str r2, [sp, #0x25c]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020E7874
_020E7804:
	cmp r0, #6
	bne _020E782C
	ldr r1, [sp, #0x25c]
	add r2, r1, #8
	str r2, [sp, #0x25c]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020E7874
_020E782C:
	cmp r0, #7
	bne _020E7848
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _020E7874
_020E7848:
	cmp r0, #8
	bne _020E7864
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _020E7874
_020E7864:
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
_020E7874:
	cmp r0, #2
	moveq r1, r5, lsl #0x10
	moveq r5, r1, lsr #0x10
	cmp r0, #1
	andeq r5, r5, #0xff
	cmp r0, #4
	cmpne r0, #6
	add r0, sp, #0x1c
	bne _020E78C4
	sub r4, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r3, [r4]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x22c
	bl longlong2str
	movs r7, r0
	beq _020E7B48
	b _020E78E8
_020E78C4:
	sub r4, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	add r1, sp, #0x22c
	mov r0, r5
	ldmia r4, {r2, r3}
	bl long2str
	movs r7, r0
	beq _020E7B48
_020E78E8:
	add r0, sp, #0x200
	add r0, r0, #0x2b
	sub r6, r0, r7
	b _020E7B94
_020E78F8:
	ldrb r0, [sp, #0x20]
	cmp r0, #9
	ldrne r0, [sp, #0x25c]
	addne r0, r0, #8
	strne r0, [sp, #0x25c]
	bne _020E791C
	ldr r0, [sp, #0x25c]
	add r0, r0, #8
	str r0, [sp, #0x25c]
_020E791C:
	ldr r7, [r0, #-8]
	ldr r6, [r0, #-4]
	add r0, sp, #0x1c
	sub r4, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r3, [r4]
	mov r0, r7
	mov r1, r6
	add r2, sp, #0x22c
	bl float2str
	movs r7, r0
	beq _020E7B48
	add r0, sp, #0x200
	add r0, r0, #0x2b
	sub r6, r0, r7
	b _020E7B94
_020E7960:
	ldrb r0, [sp, #0x20]
	cmp r0, #9
	ldrne r0, [sp, #0x25c]
	addne r0, r0, #8
	strne r0, [sp, #0x25c]
	bne _020E7984
	ldr r0, [sp, #0x25c]
	add r0, r0, #8
	str r0, [sp, #0x25c]
_020E7984:
	ldr r7, [r0, #-8]
	ldr r6, [r0, #-4]
	add r0, sp, #0x1c
	sub r4, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r3, [r4]
	mov r0, r7
	mov r1, r6
	add r2, sp, #0x22c
	bl double2hex
	movs r7, r0
	beq _020E7B48
	add r0, sp, #0x200
	add r0, r0, #0x2b
	sub r6, r0, r7
	b _020E7B94
_020E79C8:
	ldrb r0, [sp, #0x20]
	cmp r0, #5
	bne _020E7A08
	ldr r0, [sp, #0x25c]
	mov r2, #0x200
	add r0, r0, #4
	str r0, [sp, #0x25c]
	ldr r1, [r0, #-4]
	add r0, sp, #0x2c
	cmp r1, #0
	ldreq r1, _020E7CF8 ; =__pformatter_empty_string_1
	bl wcstombs
	cmp r0, #0
	blt _020E7B48
	add r7, sp, #0x2c
	b _020E7A18
_020E7A08:
	ldr r0, [sp, #0x25c]
	add r0, r0, #4
	str r0, [sp, #0x25c]
	ldr r7, [r0, #-4]
_020E7A18:
	ldrb r0, [sp, #0x1f]
	cmp r7, #0
	ldreq r7, _020E7CFC ; =__pformatter_empty_string_2
	cmp r0, #0
	beq _020E7A4C
	ldrb r0, [sp, #0x1e]
	ldrb r6, [r7], #1
	cmp r0, #0
	beq _020E7B94
	ldr r0, [sp, #0x28]
	cmp r6, r0
	movgt r6, r0
	b _020E7B94
_020E7A4C:
	ldrb r0, [sp, #0x1e]
	cmp r0, #0
	beq _020E7A78
	ldr r6, [sp, #0x28]
	mov r0, r7
	mov r2, r6
	mov r1, #0
	bl memchr
	cmp r0, #0
	subne r6, r0, r7
	b _020E7B94
_020E7A78:
	mov r0, r7
	bl strlen
	mov r6, r0
	b _020E7B94
_020E7A88:
	ldr r1, [sp, #0x25c]
	ldrb r0, [sp, #0x20]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r1, [r1, #-4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020E7CD8
_020E7AA8: ; jump table
	b _020E7ACC ; case 0
	b _020E7CD8 ; case 1
	b _020E7AD4 ; case 2
	b _020E7ADC ; case 3
	b _020E7B04 ; case 4
	b _020E7CD8 ; case 5
	b _020E7AE4 ; case 6
	b _020E7AF4 ; case 7
	b _020E7AFC ; case 8
_020E7ACC:
	str sl, [r1]
	b _020E7CD8
_020E7AD4:
	strh sl, [r1]
	b _020E7CD8
_020E7ADC:
	str sl, [r1]
	b _020E7CD8
_020E7AE4:
	str sl, [r1]
	mov r0, sl, asr #0x1f
	str r0, [r1, #4]
	b _020E7CD8
_020E7AF4:
	str sl, [r1]
	b _020E7CD8
_020E7AFC:
	str sl, [r1]
	b _020E7CD8
_020E7B04:
	str sl, [r1]
	mov r0, sl, asr #0x1f
	str r0, [r1, #4]
	b _020E7CD8
_020E7B14:
	ldr r0, [sp, #0x25c]
	add r7, sp, #0x2c
	add r0, r0, #4
	str r0, [sp, #0x25c]
	ldr r0, [r0, #-4]
	mov r6, #1
	strb r0, [sp, #0x2c]
	b _020E7B94
_020E7B34:
	mov r0, #0x25
	strb r0, [sp, #0x2c]
	add r7, sp, #0x2c
	mov r6, #1
	b _020E7B94
_020E7B48:
	ldr r0, [sp, #0xc]
	bl strlen
	movs r4, r0
	beq _020E7B80
	ldr r1, [sp, #0xc]
	mov r0, r8
	mov r2, r4
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_020E7B80:
	add sp, sp, #0x22c
	add r0, sl, r4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E7B94:
	ldrb r0, [sp, #0x1c]
	mov r4, r6
	cmp r0, #0
	beq _020E7C48
	cmp r0, #2
	moveq r0, #0x30
	movne r0, #0x20
	strb r0, [sp, #0x19]
	ldrsb r0, [r7]
	cmp r0, #0x2b
	cmpne r0, #0x2d
	cmpne r0, #0x20
	bne _020E7C04
	ldrsb r0, [sp, #0x19]
	cmp r0, #0x30
	bne _020E7C04
	mov r0, r8
	mov r1, r7
	mov r2, #1
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	add r7, r7, #1
	sub r6, r6, #1
_020E7C04:
	ldr r0, [sp, #0x24]
	cmp r4, r0
	bge _020E7C48
_020E7C10:
	mov r0, r8
	add r1, sp, #0x19
	mov r2, #1
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #0x24]
	add r4, r4, #1
	cmp r4, r0
	blt _020E7C10
_020E7C48:
	cmp r6, #0
	beq _020E7C78
	mov r0, r8
	mov r1, r7
	mov r2, r6
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_020E7C78:
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	bne _020E7CD4
	ldr r0, [sp, #0x24]
	cmp r4, r0
	bge _020E7CD4
	mov r6, #0x20
	add r7, sp, #0x18
_020E7C98:
	mov r0, r8
	mov r1, r7
	mov r2, #1
	strb r6, [sp, #0x18]
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #0x24]
	add r4, r4, #1
	cmp r4, r0
	blt _020E7C98
_020E7CD4:
	add sl, sl, r4
_020E7CD8:
	ldrsb r0, [fp]
	cmp r0, #0
	bne _020E750C
_020E7CE4:
	mov r0, sl
	add sp, sp, #0x22c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E7CF8: .word __pformatter_empty_string_1
_020E7CFC: .word __pformatter_empty_string_2
	arm_func_end __pformatter

	arm_func_start __FileWrite
__FileWrite: ; 0x020E7D00
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	mov r3, r5
	mov r1, #1
	mov r4, r2
	bl __fwrite
	cmp r4, r0
	movne r5, #0
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __FileWrite

	arm_func_start __StringWrite
__StringWrite: ; 0x020E7D2C
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
	add r0, r0, r3
	bl memcpy
	ldr r1, [r4, #8]
	mov r0, #1
	add r1, r1, r5
	str r1, [r4, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __StringWrite

	arm_func_start printf
printf: ; 0x020E7D70
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	ldr r0, _020E7E70 ; =__files + 0x4C
	mvn r1, #0
	bl fwide
	cmp r0, #0
	mvnge r0, #0
	ldmgeia sp!, {r4, lr}
	addge sp, sp, #0x10
	bxge lr
	ldr r0, _020E7E74 ; =__cs + 0x48
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020E7DCC
	ldr r0, _020E7E78 ; =OSi_ThreadInfo
	ldr r1, _020E7E7C ; =__cs_id
	ldr r2, [r0, #4]
	ldr r0, _020E7E80 ; =__cs_ref
	ldr r3, [r2, #0x6c]
	mov r2, #1
	str r3, [r1, #0xc]
	str r2, [r0, #0xc]
	b _020E7E24
_020E7DCC:
	ldr r0, _020E7E78 ; =OSi_ThreadInfo
	ldr r1, _020E7E7C ; =__cs_id
	ldr r0, [r0, #4]
	ldr r1, [r1, #0xc]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _020E7DFC
	ldr r0, _020E7E80 ; =__cs_ref
	ldr r1, [r0, #0xc]
	add r1, r1, #1
	str r1, [r0, #0xc]
	b _020E7E24
_020E7DFC:
	ldr r0, _020E7E74 ; =__cs + 0x48
	bl OS_LockMutex
	ldr r0, _020E7E78 ; =OSi_ThreadInfo
	ldr r1, _020E7E7C ; =__cs_id
	ldr r2, [r0, #4]
	ldr r0, _020E7E80 ; =__cs_ref
	ldr r3, [r2, #0x6c]
	mov r2, #1
	str r3, [r1, #0xc]
	str r2, [r0, #0xc]
_020E7E24:
	add r0, sp, #8
	bic r3, r0, #3
	ldr r2, [sp, #8]
	ldr r0, _020E7E84 ; =__FileWrite
	ldr r1, _020E7E70 ; =__files + 0x4C
	add r3, r3, #4
	bl __pformatter
	ldr r1, _020E7E80 ; =__cs_ref
	mov r4, r0
	ldr r0, [r1, #0xc]
	subs r0, r0, #1
	str r0, [r1, #0xc]
	bne _020E7E60
	ldr r0, _020E7E74 ; =__cs + 0x48
	bl OS_UnlockMutex
_020E7E60:
	mov r0, r4
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E7E70: .word __files + 0x4C
_020E7E74: .word __cs + 0x48
_020E7E78: .word OSi_ThreadInfo
_020E7E7C: .word __cs_id
_020E7E80: .word __cs_ref
_020E7E84: .word __FileWrite
	arm_func_end printf

	arm_func_start vsnprintf
vsnprintf: ; 0x020E7E88
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r4, r1
	mov ip, #0
	ldr r0, _020E7EEC ; =__StringWrite
	add r1, sp, #0
	str r5, [sp]
	str r4, [sp, #4]
	str ip, [sp, #8]
	bl __pformatter
	cmp r5, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, pc}
	cmp r0, r4
	movlo r1, #0
	addlo sp, sp, #0xc
	strlob r1, [r5, r0]
	ldmloia sp!, {r4, r5, pc}
	cmp r4, #0
	addne r1, r5, r4
	movne r2, #0
	strneb r2, [r1, #-1]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020E7EEC: .word __StringWrite
	arm_func_end vsnprintf

	arm_func_start vsprintf
vsprintf: ; 0x020E7EF0
	ldr ip, _020E7F04 ; =vsnprintf
	mov r3, r2
	mov r2, r1
	mvn r1, #0
	bx ip
	.align 2, 0
_020E7F04: .word vsnprintf
	arm_func_end vsprintf

	arm_func_start snprintf
snprintf: ; 0x020E7F08
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r3, sp, #0x10
	bic r3, r3, #3
	ldr r2, [sp, #0x10]
	add r3, r3, #4
	bl vsnprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end snprintf

	arm_func_start sprintf
sprintf: ; 0x020E7F30
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	bic r1, r1, #3
	add r3, r1, #4
	ldr r2, [sp, #0xc]
	mvn r1, #0
	bl vsnprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sprintf

	exception long2str, 0x024D, 0x0090FF20
	exception longlong2str, 0x02FD, 0x00A0FF20
	exception double2hex, 0x04DD, 0x00F07F20
	exception float2str, 0x0765, 0x00C0FF20
	exception __pformatter, 0x0824, __pformatter_exception
	exception __FileWrite, 0x002D, 0x00200300
	exception __StringWrite, 0x0045, 0x00200300
	exception printf, 0x0119, 0x00300120
	exception vsnprintf, 0x0069, 0x00300300
	exception vsprintf, 0x0019, 0x00000000
	exception snprintf, 0x0029, 0x00300020
	exception sprintf, 0x002D, 0x00300020

	.section .exception,4,1,2

__pformatter_exception: ; 0x020F4F84
	.byte 0x20, 0xFF, 0x09, 0x60, 0x00, 0x00, 0x00, 0x00
