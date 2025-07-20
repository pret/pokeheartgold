	.include "asm/macros.inc"
	.include "msl.inc"
	.include "global.inc"
	.public __sinit__
	.public __exception_table_start__
	.public __exception_table_end__
	.type __sinit__, @function
	.public OSi_ThreadInfo
	.type OSi_ThreadInfo, @function

	.bss

	.public _ZSt7nothrow
_ZSt7nothrow:
	.space 0x4

_ZSt13__new_handler:
	.space 0x4

__global_destructor_chain: ; 0x021E58E8
	.space 4

	.text

	; FP_fastI_v5t_LE.a

	.public _dadd
	.type _dadd, @function
	.public _d_add
	.type _d_add, @function
_dadd: ; 0x020F068C
_d_add:
	stmdb sp!, {r4, lr}
	eors ip, r1, r3
	eormi r3, r3, #0x80000000
	bmi __dsub_start
__dadd_start:
	subs ip, r0, r2
	sbcs lr, r1, r3
	bhs _020F06B8
	adds r2, r2, ip
	adc r3, r3, lr
	subs r0, r0, ip
	sbc r1, r1, lr
_020F06B8:
	mov lr, #0x80000000
	mov ip, r1, lsr #0x14
	orr r1, lr, r1, lsl #11
	orr r1, r1, r0, lsr #21
	mov r0, r0, lsl #0xb
	movs r4, ip, lsl #0x15
	cmnne r4, #0x200000
	beq _020F07B4
	mov r4, r3, lsr #0x14
	orr r3, lr, r3, lsl #11
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs lr, r4, lsl #0x15
	beq _020F07FC
_020F06F0:
	subs r4, ip, r4
	beq _020F0748
	cmp r4, #0x20
	ble _020F072C
	cmp r4, #0x38
	movge r4, #0x3f
	sub r4, r4, #0x20
	rsb lr, r4, #0x20
	orrs lr, r2, r3, lsl lr
	mov r2, r3, lsr r4
	orrne r2, r2, #1
	adds r0, r0, r2
	adcs r1, r1, #0
	blo _020F0770
	b _020F0754
_020F072C:
	rsb lr, r4, #0x20
	movs lr, r2, lsl lr
	rsb lr, r4, #0x20
	mov r2, r2, lsr r4
	orr r2, r2, r3, lsl lr
	mov r3, r3, lsr r4
	orrne r2, r2, #1
_020F0748:
	adds r0, r0, r2
	adcs r1, r1, r3
	blo _020F0770
_020F0754:
	add ip, ip, #1
	and r4, r0, #1
	movs r1, r1, rrx
	orr r0, r4, r0, rrx
	mov lr, ip, lsl #0x15
	cmn lr, #0x200000
	beq _020F0980
_020F0770:
	movs r2, r0, lsl #0x15
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	mov r1, r1, lsr #0xc
	orr r1, r1, ip, lsl #20
	tst r2, #0x80000000
	ldmeqia sp!, {r4, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, lr}
	bxeq lr
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, lr}
	bx lr
_020F07B4:
	cmp ip, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	bics ip, ip, #0x800
	beq _020F0820
	orrs r4, r0, r1, lsl #1
	bne _020F095C
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r4, r4, lsl #0x15
	beq _020F0948
	cmn r4, #0x200000
	bne _020F0948
	orrs r4, r2, r3, lsl #1
	beq _020F0948
	b _020F095C
_020F07FC:
	cmp r4, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	bic ip, ip, #0x800
	bics r4, r4, #0x800
	beq _020F088C
	orrs r4, r2, r3, lsl #1
	bne _020F095C
	b _020F0948
_020F0820:
	orrs r4, r0, r1, lsl #1
	beq _020F0860
	mov ip, #1
	bic r1, r1, #0x80000000
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r4, r4, lsl #0x15
	cmnne r4, #0x200000
	mov r4, r4, lsr #0x15
	orr r4, r4, lr, lsr #20
	beq _020F07FC
	orr r3, r3, #0x80000000
	orr ip, ip, lr, lsr #20
	b _020F06F0
_020F0860:
	mov ip, r3, lsr #0x14
	mov r1, r3, lsl #0xb
	orr r1, r1, r2, lsr #21
	mov r0, r2, lsl #0xb
	movs r4, ip, lsl #0x15
	beq _020F0914
	cmn r4, #0x200000
	bne _020F0914
	orrs r4, r0, r1, lsl #1
	beq _020F0948
	b _020F0960
_020F088C:
	orrs r4, r2, r3, lsl #1
	beq _020F0924
	mov r4, #1
	bic r3, r3, #0x80000000
	cmp r1, #0
	bpl _020F08B0
	orr ip, ip, lr, lsr #20
	orr r4, r4, lr, lsr #20
	b _020F06F0
_020F08B0:
	adds r0, r0, r2
	adcs r1, r1, r3
	blo _020F08D0
	add ip, ip, #1
	and r4, r0, #1
	movs r1, r1, rrx
	mov r0, r0, rrx
	orr r0, r0, r4
_020F08D0:
	cmp r1, #0
	subges ip, ip, #1
	movs r2, r0, lsl #0x15
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmeqia sp!, {r4, lr}
	bxeq lr
	tst r2, #0x80000000
	ldmeqia sp!, {r4, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, lr}
	bxeq lr
_020F0914:
	mov r1, r3
	mov r0, r2
	ldmia sp!, {r4, lr}
	bx lr
_020F0924:
	cmp r1, #0
	subges ip, ip, #1
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmia sp!, {r4, lr}
	bx lr
_020F0948:
	ldr r1, _020F09A0 ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
_020F095C:
	mov r1, r3
_020F0960:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, lr}
	bx lr
_020F0970: ; 0x020F0970
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, lr}
	bx lr
_020F0980:
	cmp ip, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	ldr r1, _020F09A0 ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020F09A0: .word 0x7FF00000

	.public _d2f
	.type _d2f, @function
	.public _d_dtof
	.type _d_dtof, @function
    .public _f_qtof
    .type _f_qtof, @function
_d2f: ; 0x020F09A4
_d_dtof:
_f_qtof:
	and r2, r1, #0x80000000
	mov ip, r1, lsr #0x14
	bics ip, ip, #0x800
	beq _020F0A1C
	mov r3, ip, lsl #0x15
	cmn r3, #0x200000
	bhs _020F0A00
	subs ip, ip, #0x380
	bls _020F0A2C
	cmp ip, #0xff
	bge _020F0A9C
	mov r1, r1, lsl #0xc
	orr r3, r2, r1, lsr #9
	orr r3, r3, r0, lsr #29
	movs r1, r0, lsl #3
	orr r0, r3, ip, lsl #23
	bxeq lr
	tst r1, #0x80000000
	bxeq lr
	movs r1, r1, lsl #1
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F0A00:
	orrs r3, r0, r1, lsl #12
	bne _020F0A14
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_020F0A14:
	mvn r0, #0x80000000
	bx lr
_020F0A1C:
	orrs r3, r0, r1, lsl #12
	bne __f_underflow
__f_result_zero:
	mov r0, r2
	bx lr
_020F0A2C:
	cmn ip, #0x17
	beq _020F0A80
	bmi __f_underflow
	mov r1, r1, lsl #0xb
	orr r1, r1, #0x80000000
	mov r3, r1, lsr #8
	orr r3, r3, r0, lsr #29
	rsb ip, ip, #1
	movs r1, r0, lsl #3
	orr r0, r2, r3, lsr ip
	rsb ip, ip, #0x20
	mov r3, r3, lsl ip
	orrne r3, r3, #1
	movs r1, r3
	bxeq lr
	tst r1, #0x80000000
	bxeq lr
	movs r1, r1, lsl #1
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F0A80:
	orr r0, r0, r1, lsl #12
__f_very_tiny_result:
	movs r1, r0
	mov r0, r2
	addne r0, r0, #1
	bx lr
__f_underflow:
	mov r0, r2
	bx lr
_020F0A9C:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr

	.public _dfix
	.type _dfix, @function
	.public _d_dtoi
	.type _d_dtoi, @function
_dfix: ; 0x020F0AA8
_d_dtoi:
	bic r3, r1, #0x80000000
	ldr r2, _020F0AF0 ; =0x0000041E
	subs r2, r2, r3, lsr #20
	ble _020F0AE4
	cmp r2, #0x20
	bge _020F0ADC
	mov r3, r1, lsl #0xb
	orr r3, r3, #0x80000000
	orr r3, r3, r0, lsr #21
	cmp r1, #0
	mov r0, r3, lsr r2
	rsbmi r0, r0, #0
	bx lr
_020F0ADC:
	mov r0, #0
	bx lr
_020F0AE4:
	mvn r0, r1, asr #31
	add r0, r0, #0x80000000
	bx lr
	.align 2, 0
_020F0AF0: .word 0x0000041E

	.public _dfixu
	.type _dfixu, @function
	.public _d_dtou
	.type _d_dtou, @function
_dfixu: ; 0x020F0AF4
_d_dtou:
	tst r1, #0x80000000
	bne _020F0B2C
	ldr r2, _020F0B48 ; =0x0000041E
	subs r2, r2, r1, lsr #20
	blt _020F0B40
	cmp r2, #0x20
	bge _020F0B24
	mov r3, r1, lsl #0xb
	orr r3, r3, #0x80000000
	orr r3, r3, r0, lsr #21
	mov r0, r3, lsr r2
	bx lr
_020F0B24:
	mov r0, #0
	bx lr
_020F0B2C:
	cmn r1, #0x100000
	cmpeq r0, #0
	movls r0, #0
	mvnhi r0, #0
	bx lr
_020F0B40:
	mvn r0, #0
	bx lr
	.align 2, 0
_020F0B48: .word 0x0000041E

	.public _ll_ufrom_d
	.type _ll_ufrom_d, @function
	.public _d_dtoull
	.type _d_dtoull, @function
_ll_ufrom_d: ; 0x020F0B4C
_d_dtoull:
	tst r1, #0x80000000
	bne _020F0BB0
	ldr r2, _020F0BD4 ; =0x0000043E
	subs r2, r2, r1, lsr #20
	blt _020F0BC8
	cmp r2, #0x40
	bge _020F0BA4
	mov ip, r1, lsl #0xb
	orr ip, ip, #0x80000000
	orr ip, ip, r0, lsr #21
	cmp r2, #0x20
	ble _020F0B8C
	sub r2, r2, #0x20
	mov r1, #0
	mov r0, ip, lsr r2
	bx lr
_020F0B8C:
	mov r3, r0, lsl #0xb
	mov r1, ip, lsr r2
	mov r0, r3, lsr r2
	rsb r2, r2, #0x20
	orr r0, r0, ip, lsl r2
	bx lr
_020F0BA4:
	mov r1, #0
	mov r0, #0
	bx lr
_020F0BB0:
	cmn r1, #0x100000
	cmpeq r0, #0
	bhi _020F0BC8
	mov r1, #0
	mov r0, #0
	bx lr
_020F0BC8:
	mvn r1, #0
	mvn r0, #0
	bx lr
	.align 2, 0
_020F0BD4: .word 0x0000043E

	.public _dflt
	.type _dflt, @function
	.public _d_itod
	.type _d_itod, @function
_dflt: ; 0x020F0BD8
_d_itod:
	ands r2, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r0, #0
__d_itod_common:
	mov r1, #0
	bxeq lr
	mov r3, #0x400
	add r3, r3, #0x1e
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
	movs r1, r0
	mov r0, r1, lsl #0x15
	add r1, r1, r1
	orr r1, r2, r1, lsr #12
	orr r1, r1, r3, lsl #20
	bx lr

	.public _dfltu
	.type _dfltu, @function
	.public _d_utod
	.type _d_utod, @function
_dfltu: ; 0x020F0C18
_d_utod:
	cmp r0, #0
__d_utod_common:
	mov r1, #0
	bxeq lr
	mov r3, #0x400
	add r3, r3, #0x1e
	bmi _020F0C3C
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
_020F0C3C:
	mov r1, r0
	mov r0, r1, lsl #0x15
	add r1, r1, r1
	mov r1, r1, lsr #0xc
	orr r1, r1, r3, lsl #20
	bx lr

	.public _dmul
	.type _dmul, @function
	.public _d_mul
	.type _d_mul, @function
_dmul: ; 0x020F0C54
_d_mul:
	stmdb sp!, {r4, r5, r6, r7, lr}
	eor lr, r1, r3
	and lr, lr, #0x80000000
	mov ip, r1, lsr #0x14
	mov r1, r1, lsl #0xb
	orr r1, r1, r0, lsr #21
	mov r0, r0, lsl #0xb
	movs r6, ip, lsl #0x15
	cmnne r6, #0x200000
	beq _020F0D5C
	orr r1, r1, #0x80000000
	bic ip, ip, #0x800
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r5, r4, lsl #0x15
	cmnne r5, #0x200000
	beq _020F0DA4
	orr r3, r3, #0x80000000
	bic r4, r4, #0x800
_020F0CA8:
	add ip, r4, ip
	umull r5, r4, r0, r2
	umull r7, r6, r0, r3
	adds r4, r7, r4
	adc r6, r6, #0
	umull r7, r0, r1, r2
	adds r4, r7, r4
	adcs r0, r0, r6
	umull r7, r2, r1, r3
	adc r1, r2, #0
	adds r0, r0, r7
	adc r1, r1, #0
	orrs r4, r4, r5
	orrne r0, r0, #1
	cmp r1, #0
	blt _020F0CF4
	sub ip, ip, #1
	adds r0, r0, r0
	adc r1, r1, r1
_020F0CF4:
	add ip, ip, #2
	subs ip, ip, #0x400
	bmi _020F0E90
	beq _020F0E90
	mov r6, ip, lsl #0x14
	cmn r6, #0x100000
	bmi _020F0F90
	movs r2, r0, lsl #0x15
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	tst r2, #0x80000000
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0D5C:
	bics ip, ip, #0x800
	beq _020F0DB8
	orrs r6, r0, r1, lsl #1
	bne _020F0F44
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r5, r4, lsl #0x15
	beq _020F0D98
	cmn r5, #0x200000
	bne _020F0F30
	orrs r5, r2, r3, lsl #1
	beq _020F0F30
	b _020F0F44
_020F0D98:
	orrs r5, r3, r2
	beq _020F0F58
	b _020F0F30
_020F0DA4:
	bics r4, r4, #0x800
	beq _020F0E4C
	orrs r6, r2, r3, lsl #1
	bne _020F0F44
	b _020F0F30
_020F0DB8:
	orrs r6, r0, r1, lsl #1
	beq _020F0E20
	mov ip, #1
	cmp r1, #0
	bne _020F0DDC
	sub ip, ip, #0x20
	movs r1, r0
	mov r0, #0
	bmi _020F0DF8
_020F0DDC:
	clz r6, r1
	movs r1, r1, lsl r6
	rsb r6, r6, #0x20
	orr r1, r1, r0, lsr r6
	rsb r6, r6, #0x20
	mov r0, r0, lsl r6
	sub ip, ip, r6
_020F0DF8:
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r5, r4, lsl #0x15
	cmnne r5, #0x200000
	beq _020F0DA4
	orr r3, r3, #0x80000000
	bic r4, r4, #0x800
	b _020F0CA8
_020F0E20:
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r5, r4, lsl #0x15
	beq _020F0FA4
	cmn r5, #0x200000
	bne _020F0FA4
	orrs r6, r2, r3, lsl #1
	beq _020F0F58
	b _020F0F44
_020F0E4C:
	orrs r5, r2, r3, lsl #1
	beq _020F0FA4
	mov r4, #1
	cmp r3, #0
	bne _020F0E70
	sub r4, r4, #0x20
	movs r3, r2
	mov r2, #0
	bmi _020F0CA8
_020F0E70:
	clz r6, r3
	movs r3, r3, lsl r6
	rsb r6, r6, #0x20
	orr r3, r3, r2, lsr r6
	rsb r6, r6, #0x20
	mov r2, r2, lsl r6
	sub r4, r4, r6
	b _020F0CA8
_020F0E90:
	cmn ip, #0x34
	beq _020F0F28
	bmi _020F0F80
	mov r2, r1
	mov r3, r0
	add r4, ip, #0x34
	cmp r4, #0x20
	movge r2, r3
	movge r3, #0
	subge r4, r4, #0x20
	rsb r5, r4, #0x20
	mov r2, r2, lsl r4
	orr r2, r2, r3, lsr r5
	movs r3, r3, lsl r4
	orrne r2, r2, #1
	rsb ip, ip, #0xc
	cmp ip, #0x20
	movge r0, r1
	movge r1, #0
	subge ip, ip, #0x20
	rsb r4, ip, #0x20
	mov r0, r0, lsr ip
	orr r0, r0, r1, lsl r4
	orr r1, lr, r1, lsr ip
	cmp r2, #0
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	tst r2, #0x80000000
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0F28:
	orr r0, r0, r1, lsl #1
	b _020F0F68
_020F0F30:
	ldr r1, _020F0FB4 ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0F44:
	mov r1, r3
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0F58:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0F68:
	movs r2, r0
	mov r1, lr
	mov r0, #0
	addne r0, r0, #1
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0F80:
	mov r1, lr
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0F90:
	ldr r1, _020F0FB4 ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0FA4:
	mov r1, lr
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_020F0FB4: .word 0x7FF00000

	.public _dsqrt
	.type _dsqrt, @function
_dsqrt: ; 0x020F0FB8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020F1148 ; =0x7FF00000
	cmp r1, r2
	bhs _020F1104
	movs ip, r1, lsr #0x14
	beq _020F10B0
	bic r1, r1, r2
	orr r1, r1, #0x100000
_020F0FD8:
	movs ip, ip, asr #1
	bhs _020F0FEC
	sub ip, ip, #1
	movs r0, r0, lsl #1
	adc r1, r1, r1
_020F0FEC:
	movs r3, r0, lsl #1
	adc r1, r1, r1
	mov r2, #0
	mov r4, #0
	mov lr, #0x200000
_020F1000:
	add r6, r4, lr
	cmp r6, r1
	addle r4, r6, lr
	suble r1, r1, r6
	addle r2, r2, lr
	movs r3, r3, lsl #1
	adc r1, r1, r1
	movs lr, lr, lsr #1
	bne _020F1000
	mov r0, #0
	mov r5, #0
	cmp r1, r4
	cmpeq r3, #0x80000000
	blo _020F1048
	subs r3, r3, #0x80000000
	sbc r1, r1, r4
	add r4, r4, #1
	mov r0, #0x80000000
_020F1048:
	movs r3, r3, lsl #1
	adc r1, r1, r1
	mov lr, #0x40000000
_020F1054:
	add r6, r5, lr
	cmp r4, r1
	cmpeq r6, r3
	bhi _020F1074
	add r5, r6, lr
	subs r3, r3, r6
	sbc r1, r1, r4
	add r0, r0, lr
_020F1074:
	movs r3, r3, lsl #1
	adc r1, r1, r1
	movs lr, lr, lsr #1
	bne _020F1054
	orrs r1, r1, r3
	biceq r0, r0, #1
	movs r1, r2, lsr #1
	movs r0, r0, rrx
	adcs r0, r0, #0
	adc r1, r1, #0
	add r1, r1, #0x20000000
	sub r1, r1, #0x100000
	add r1, r1, ip, lsl #20
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F10B0:
	cmp r1, #0
	bne _020F10E0
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	mvn ip, #0x13
	clz r5, r0
	movs r0, r0, lsl r5
	sub ip, ip, r5
	mov r1, r0, lsr #0xb
	mov r0, r0, lsl #0x15
	b _020F0FD8
_020F10E0:
	clz r2, r1
	movs r1, r1, lsl r2
	rsb r2, r2, #0x2b
	mov r1, r1, lsr #0xb
	orr r1, r1, r0, lsr r2
	rsb r2, r2, #0x20
	mov r0, r0, lsl r2
	rsb ip, r2, #1
	b _020F0FD8
_020F1104:
	tst r1, #0x80000000
	beq _020F1120
	bics r3, r1, #0x80000000
	cmpeq r0, #0
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	b _020F112C
_020F1120:
	orrs r2, r0, r1, lsl #12
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
_020F112C:
	ldr r2, _020F114C ; =0x7FF80000
	orr r1, r1, r2
	ldr r3, _020F1150 ; =errno
	mov r4, #0x21
	str r4, [r3]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_020F1148: .word 0x7FF00000
_020F114C: .word 0x7FF80000
_020F1150: .word errno

	.public _drsb
	.type _drsb, @function
_drsb: ; 0x020F1154
	eor r1, r1, r3
	eor r3, r1, r3
	eor r1, r1, r3
	eor r0, r0, r2
	eor r2, r0, r2
	eor r0, r0, r2
	.public _dsub
	.type _dsub, @function
	.public _d_sub
	.type _d_sub, @function
_dsub: ; 0x020F116C
_d_sub: ; 0x020F116C
	stmdb sp!, {r4, lr}
	eors ip, r1, r3
	eormi r3, r3, #0x80000000
	bmi __dadd_start
__dsub_start:
	subs ip, r0, r2
	sbcs lr, r1, r3
	bhs _020F119C
	eor lr, lr, #0x80000000
	adds r2, r2, ip
	adc r3, r3, lr
	subs r0, r0, ip
	sbc r1, r1, lr
_020F119C:
	mov lr, #0x80000000
	mov ip, r1, lsr #0x14
	orr r1, lr, r1, lsl #11
	orr r1, r1, r0, lsr #21
	mov r0, r0, lsl #0xb
	movs r4, ip, lsl #0x15
	cmnne r4, #0x200000
	beq _020F13A0
	mov r4, r3, lsr #0x14
	orr r3, lr, r3, lsl #11
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs lr, r4, lsl #0x15
	beq _020F13E8
_020F11D4:
	subs r4, ip, r4
	beq _020F127C
	cmp r4, #0x20
	ble _020F1210
	cmp r4, #0x38
	movge r4, #0x3f
	sub r4, r4, #0x20
	rsb lr, r4, #0x20
	orrs lr, r2, r3, lsl lr
	mov r2, r3, lsr r4
	orrne r2, r2, #1
	subs r0, r0, r2
	sbcs r1, r1, #0
	bmi _020F1238
	b _020F1328
_020F1210:
	rsb lr, r4, #0x20
	movs lr, r2, lsl lr
	rsb lr, r4, #0x20
	mov r2, r2, lsr r4
	orr r2, r2, r3, lsl lr
	mov r3, r3, lsr r4
	orrne r2, r2, #1
	subs r0, r0, r2
	sbcs r1, r1, r3
	bpl _020F1328
_020F1238:
	movs r2, r0, lsl #0x15
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	mov r1, r1, lsr #0xc
	orr r1, r1, ip, lsl #20
	tst r2, #0x80000000
	ldmeqia sp!, {r4, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, lr}
	bxeq lr
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, lr}
	bx lr
_020F127C:
	subs r0, r0, r2
	sbc r1, r1, r3
	orrs lr, r1, r0
	beq _020F150C
	mov lr, ip, lsl #0x14
	and lr, lr, #0x80000000
	bic ip, ip, #0x800
	cmp r1, #0
	bmi _020F1304
	bne _020F12B4
	sub ip, ip, #0x20
	movs r1, r0
	mov r0, #0
	bmi _020F12D0
_020F12B4:
	clz r4, r1
	movs r1, r1, lsl r4
	rsb r4, r4, #0x20
	orr r1, r1, r0, lsr r4
	rsb r4, r4, #0x20
	mov r0, r0, lsl r4
	sub ip, ip, r4
_020F12D0:
	cmp ip, #0
	bgt _020F130C
	rsb ip, ip, #0xc
	cmp ip, #0x20
	movge r0, r1
	movge r1, #0
	subge ip, ip, #0x20
	rsb r4, ip, #0x20
	mov r0, r0, lsr ip
	orr r0, r0, r1, lsl r4
	orr r1, lr, r1, lsr ip
	ldmia sp!, {r4, lr}
	bx lr
_020F1304:
	cmp r1, #0
	subges ip, ip, #1
_020F130C:
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmia sp!, {r4, lr}
	bx lr
_020F1328:
	mov lr, ip, lsl #0x14
	and lr, lr, #0x80000000
	bic ip, ip, #0x800
	cmp r1, #0
	bne _020F134C
	sub ip, ip, #0x20
	movs r1, r0
	mov r0, #0
	bmi _020F1368
_020F134C:
	clz r4, r1
	movs r1, r1, lsl r4
	rsb r4, r4, #0x20
	orr r1, r1, r0, lsr r4
	rsb r4, r4, #0x20
	mov r0, r0, lsl r4
	sub ip, ip, r4
_020F1368:
	cmp ip, #0
	orrgt ip, ip, lr, lsr #20
	bgt _020F1238
	rsb ip, ip, #0xc
	cmp ip, #0x20
	movge r0, r1
	movge r1, #0
	subge ip, ip, #0x20
	rsb r4, ip, #0x20
	mov r0, r0, lsr ip
	orr r0, r0, r1, lsl r4
	orr r1, lr, r1, lsr ip
	ldmia sp!, {r4, lr}
	bx lr
_020F13A0:
	cmp ip, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	bics ip, ip, #0x800
	beq _020F140C
	orrs r4, r0, r1, lsl #1
	bne _020F14E8
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r4, r4, lsl #0x15
	beq _020F14D4
	cmn r4, #0x200000
	bne _020F14D4
	orrs r4, r2, r3, lsl #1
	beq _020F14FC
	b _020F14E8
_020F13E8:
	cmp r4, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	bic ip, ip, #0x800
	bics r4, r4, #0x800
	beq _020F1484
	orrs r4, r2, r3, lsl #1
	bne _020F14E8
	b _020F14D4
_020F140C:
	orrs r4, r0, r1, lsl #1
	beq _020F144C
	mov ip, #1
	bic r1, r1, #0x80000000
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r4, r4, lsl #0x15
	cmnne r4, #0x200000
	mov r4, r4, lsr #0x15
	orr r4, r4, lr, lsr #20
	beq _020F13E8
	orr r3, r3, #0x80000000
	orr ip, ip, lr, lsr #20
	b _020F11D4
_020F144C:
	mov ip, r3, lsr #0x14
	mov r1, r3, lsl #0xb
	orr r1, r1, r2, lsr #21
	mov r0, r2, lsl #0xb
	movs r4, ip, lsl #0x15
	beq _020F1478
	cmn r4, #0x200000
	bne _020F14A0
	orrs r4, r0, r1, lsl #1
	bne _020F14EC
	b _020F14D4
_020F1478:
	orrs r4, r0, r1, lsl #1
	beq _020F150C
	b _020F14A0
_020F1484:
	orrs r4, r2, r3, lsl #1
	beq _020F14B0
	mov r4, #1
	bic r3, r3, #0x80000000
	orr ip, ip, lr, lsr #20
	orr r4, r4, lr, lsr #20
	b _020F11D4
_020F14A0:
	mov r1, r3
	mov r0, r2
	ldmia sp!, {r4, lr}
	bx lr
_020F14B0:
	cmp r1, #0
	subges ip, ip, #1
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmia sp!, {r4, lr}
	bx lr
_020F14D4:
	ldr r1, _020F151C ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
_020F14E8:
	mov r1, r3
_020F14EC:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, lr}
	bx lr
_020F14FC:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, lr}
	bx lr
_020F150C:
	mov r1, #0
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020F151C: .word 0x7FF00000

	arm_func_start _fadd
	arm_func_start _f_add
_fadd: ; 0x020F1520
_f_add: ; 0x020F1520
	eors r2, r0, r1
	eormi r1, r1, #0x80000000
	bmi __fsub_start
__fadd_start:
	subs ip, r0, r1
	sublo r0, r0, ip
	addlo r1, r1, ip
	mov r2, #0x80000000
	mov r3, r0, lsr #0x17
	orr r0, r2, r0, lsl #8
	ands ip, r3, #0xff
	cmpne ip, #0xff
	beq _020F15C0
	mov ip, r1, lsr #0x17
	orr r1, r2, r1, lsl #8
	ands r2, ip, #0xff
	beq _020F1600
_020F1560:
	subs ip, r3, ip
	beq _020F1578
	rsb r2, ip, #0x20
	movs r2, r1, lsl r2
	mov r1, r1, lsr ip
	orrne r1, r1, #1
_020F1578:
	adds r0, r0, r1
	blo _020F1598
	and r1, r0, #1
	orr r0, r1, r0, rrx
	add r3, r3, #1
	and r2, r3, #0xff
	cmp r2, #0xff
	beq _020F1708
_020F1598:
	ands r1, r0, #0xff
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	tst r1, #0x80
	bxeq lr
	ands r1, r1, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F15C0:
	cmp r3, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	ands r3, r3, #0xff
	beq _020F1624
	movs r0, r0, lsl #1
	bne _020F1734
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _020F1728
	cmp ip, #0xff
	blt _020F1728
	cmp r1, #0
	beq _020F1728
	b _020F1734
_020F1600:
	cmp r3, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	and r3, r3, #0xff
	ands ip, ip, #0xff
	beq _020F1680
_020F1618:
	movs r1, r1, lsl #1
	bne _020F1734
	b _020F1728
_020F1624:
	movs r0, r0, lsl #1
	beq _020F165C
	mov r3, #1
	mov r0, r0, lsr #1
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #8
	ands ip, ip, #0xff
	beq _020F1680
	cmp ip, #0xff
	beq _020F1618
	orr r1, r1, #0x80000000
	orr r3, r3, r2, lsr #23
	orr ip, ip, r2, lsr #23
	b _020F1560
_020F165C:
	mov r3, r1, lsr #0x17
	mov r0, r1, lsl #9
	ands r3, r3, #0xff
	beq _020F16E8
	cmp r3, #0xff
	blt _020F16E8
	cmp r0, #0
	beq _020F1728
	b _020F1720
_020F1680:
	movs r1, r1, lsl #1
	beq _020F16F0
	mov r1, r1, lsr #1
	mov ip, #1
	orr r3, r3, r2, lsr #23
	orr ip, ip, r2, lsr #23
	cmp r0, #0
	bmi _020F1560
	adds r0, r0, r1
	blo _020F16B4
	and r1, r0, #1
	orr r0, r1, r0, rrx
	add ip, ip, #1
_020F16B4:
	cmp r0, #0
	subge ip, ip, #1
	ands r1, r0, #0xff
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, ip, lsl #23
	bxeq lr
	tst r1, #0x80
	bxeq lr
	ands r1, r1, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F16E8:
	mov r0, r1
	bx lr
_020F16F0:
	cmp r0, #0
	subges r3, r3, #1
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bx lr
_020F1708:
	cmp r3, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_020F1720:
	mvn r0, #0x80000000
	bx lr
_020F1728:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_020F1734:
	mvn r0, #0x80000000
	bx lr
_020F173C: ; 0x020F173C
	mvn r0, #0x80000000
	bx lr

	.public _dgeq
	.type _dgeq, @function
	.public _d_fge
	.type _d_fge, @function
_dgeq: ; 0x020F1744
_d_fge:
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _020F17B8
	cmn ip, r3, lsl #1
	bhs _020F17CC
_020F1758:
	orrs ip, r3, r1
	bmi _020F1788
	cmp r1, r3
	cmpeq r0, r2
	movhs r0, #1
	movlo r0, #0
	bx lr
_020F1774:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_020F1788:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #1
	mrs ip, cpsr
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bxeq lr
	cmp r3, r1
	cmpeq r2, r0
	movhs r0, #1
	movlo r0, #0
	bx lr
_020F17B8:
	bne _020F1774
	cmp r0, #0
	bhi _020F1774
	cmn ip, r3, lsl #1
	blo _020F1758
_020F17CC:
	bne _020F1774
	cmp r2, #0
	bhi _020F1774
	b _020F1758

	.public _dgr
	.type _dgr, @function
	.public _d_fgt
	.type _d_fgt, @function
_dgr: ; 0x020F17DC
_d_fgt:
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _020F1850
	cmn ip, r3, lsl #1
	bhs _020F1864
_020F17F0:
	orrs ip, r3, r1
	bmi _020F1820
	cmp r1, r3
	cmpeq r0, r2
	movhi r0, #1
	movls r0, #0
	bx lr
_020F180C:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_020F1820:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	msr cpsr_f, ip
	bxeq lr
	cmp r3, r1
	cmpeq r2, r0
	movhi r0, #1
	movls r0, #0
	bx lr
_020F1850:
	bne _020F180C
	cmp r0, #0
	bhi _020F180C
	cmn ip, r3, lsl #1
	blo _020F17F0
_020F1864:
	bne _020F180C
	cmp r2, #0
	bhi _020F180C
	b _020F17F0

	.public _dleq
	.type _dleq, @function
	.public _d_fle
	.type _d_fle, @function
_dleq: ; 0x020F1874
_d_fle:
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _020F18F4
	cmn ip, r3, lsl #1
	bhs _020F1908
_020F1888:
	orrs ip, r3, r1
	bmi _020F18BC
	cmp r1, r3
	cmpeq r0, r2
	movls r0, #1
	movhi r0, #0
	bx lr
_020F18A4:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_020F18BC:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #1
	bne _020F18E0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	orr ip, ip, #0x40000000
	msr cpsr_f, ip
	bxeq lr
_020F18E0:
	cmp r3, r1
	cmpeq r2, r0
	movls r0, #1
	movhi r0, #0
	bx lr
_020F18F4:
	bne _020F18A4
	cmp r0, #0
	bhi _020F18A4
	cmn ip, r3, lsl #1
	blo _020F1888
_020F1908:
	bne _020F18A4
	cmp r2, #0
	bhi _020F18A4
	b _020F1888

	.public _dls
	.type _dls, @function
	.public _d_flt
	.type _d_flt, @function
_dls: ; 0x020F1918
_d_flt:
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _020F1990
	cmn ip, r3, lsl #1
	bhs _020F19A4
_020F192C:
	orrs ip, r3, r1
	bmi _020F195C
	cmp r1, r3
	cmpeq r0, r2
	movlo r0, #1
	movhs r0, #0
	bx lr
_020F1948:
	mov r0, #0
	mrs ip, cpsr
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_020F195C:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #0
	bne _020F197C
	mrs ip, cpsr
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bxeq lr
_020F197C:
	cmp r3, r1
	cmpeq r2, r0
	movlo r0, #1
	movhs r0, #0
	bx lr
_020F1990:
	bne _020F1948
	cmp r0, #0
	bhi _020F1948
	cmn ip, r3, lsl #1
	blo _020F192C
_020F19A4:
	bne _020F1948
	cmp r2, #0
	bhi _020F1948
	b _020F192C

	.public _deq
	.type _deq, @function
	.public _d_feq
	.type _d_feq, @function
_deq: ; 0x020F19B4
_d_feq:
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _020F1A1C
	cmn ip, r3, lsl #1
	bhs _020F1A30
_020F19C8:
	orrs ip, r3, r1
	bmi _020F19F8
	cmp r1, r3
	cmpeq r0, r2
	moveq r0, #1
	movne r0, #0
	bx lr
_020F19E4:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F19F8:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #1
	bxeq lr
	cmp r3, r1
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
_020F1A1C:
	bne _020F19E4
	cmp r0, #0
	bhi _020F19E4
	cmn ip, r3, lsl #1
	blo _020F19C8
_020F1A30:
	bne _020F19E4
	cmp r2, #0
	bhi _020F19E4
	b _020F19C8

	.public _dneq
	.type _dneq, @function
	.public _d_fne
	.type _d_fne, @function
_dneq: ; 0x020F1A40
_d_fne:
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _020F1AA8
	cmn ip, r3, lsl #1
	bhs _020F1ABC
_020F1A54:
	orrs ip, r3, r1
	bmi _020F1A84
	cmp r1, r3
	cmpeq r0, r2
	movne r0, #1
	moveq r0, #0
	bx lr
_020F1A70:
	mov r0, #1
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F1A84:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #0
	bxeq lr
	cmp r3, r1
	cmpeq r2, r0
	movne r0, #1
	moveq r0, #0
	bx lr
_020F1AA8:
	bne _020F1A70
	cmp r0, #0
	bhi _020F1A70
	cmn ip, r3, lsl #1
	blo _020F1A54
_020F1ABC:
	bne _020F1A70
	cmp r2, #0
	bhi _020F1A70
	b _020F1A54

	.public _fgr
	.type _fgr, @function
	.public _f_fgt
	.type _f_fgt, @function
_fgr: ; 0x020F1ACC
_f_fgt:
	mov r3, #0xff000000
	cmp r3, r0, lsl #1
	cmphs r3, r1, lsl #1
	blo _020F1B14
	cmp r0, #0
	bicmi r0, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r1, #0
	bicmi r1, r1, #0x80000000
	rsbmi r1, r1, #0
	cmp r0, r1
	movgt r0, #1
	movle r0, #0
	mrs ip, cpsr
	bicle ip, ip, #0x20000000
	orrgt ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_020F1B14:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr

	.public _fleq
	.type _fleq, @function
	.public _f_fle
	.type _f_fle, @function
_fleq: ; 0x020F1B28
_f_fle:
	mov r3, #0xff000000
	cmp r3, r0, lsl #1
	cmphs r3, r1, lsl #1
	blo _020F1B78
	cmp r0, #0
	bicmi r0, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r1, #0
	bicmi r1, r1, #0x80000000
	rsbmi r1, r1, #0
	cmp r0, r1
	movle r0, #1
	movgt r0, #0
	mrs ip, cpsr
	orrgt ip, ip, #0x20000000
	bicgt ip, ip, #0x40000000
	bicle ip, ip, #0x20000000
	orrle ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F1B78:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr

	.public _fls
	.type _fls, @function
	.public _f_flt
	.type _f_flt, @function
_fls: ; 0x020F1B90
_f_flt:
	mov r3, #0xff000000
	cmp r3, r0, lsl #1
	cmphs r3, r1, lsl #1
	blo _020F1BD8
	cmp r0, #0
	bicmi r0, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r1, #0
	bicmi r1, r1, #0x80000000
	rsbmi r1, r1, #0
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
	mrs ip, cpsr
	orrge ip, ip, #0x20000000
	biclt ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_020F1BD8:
	mov r0, #0
	mrs ip, cpsr
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr

	.public _feq
	.type _feq, @function
	.public _f_feq
	.type _f_feq, @function
_feq: ; 0x020F1BEC
_f_feq:
	mov r3, #0xff000000
	cmp r3, r0, lsl #1
	blo _020F1C40
	cmp r3, r1, lsl #1
	blo _020F1C40
	orr r3, r0, r1
	movs r3, r3, lsl #1
	moveq r0, #1
	bne _020F1C20
	mrs ip, cpsr
	orr ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F1C20:
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	mrs ip, cpsr
	orreq ip, ip, #0x40000000
	bicne ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F1C40:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr

	.public _fneq
	.type _fneq, @function
	.public _f_fne
	.type _f_fne, @function
_fneq: ; 0x020F1C54
_f_fne:
	mov r3, #0xff000000
	cmp r3, r0, lsl #1
	blo _020F1CA8
	cmp r3, r1, lsl #1
	blo _020F1CA8
	orr r3, r0, r1
	movs r3, r3, lsl #1
	moveq r0, #0
	bne _020F1C88
	mrs ip, cpsr
	orr ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F1C88:
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	mrs ip, cpsr
	bicne ip, ip, #0x40000000
	orreq ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F1CA8:
	mov r0, #1
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr

	.public _frdiv
	.type _frdiv, @function
_frdiv: ; 0x020F1CBC
	eor r0, r0, r1
	eor r1, r0, r1
	eor r0, r0, r1
	.public _fdiv
	.type _fdiv, @function
	.public _f_div
	.type _f_div, @function
_fdiv: ; 0x020F1CC8
_f_div:
	stmdb sp!, {lr}
	mov ip, #0xff
	ands r3, ip, r0, lsr #23
	cmpne r3, #0xff
	beq _020F1E9C
	ands ip, ip, r1, lsr #23
	cmpne ip, #0xff
	beq _020F1ED8
	orr r1, r1, #0x800000
	orr r0, r0, #0x800000
	bic r2, r0, #0xff000000
	bic lr, r1, #0xff000000
_020F1CF8:
	cmp r2, lr
	movlo r2, r2, lsl #1
	sublo r3, r3, #1
	teq r0, r1
	adr r0, UNK_020F1D7C - 0x100
	ldrb r1, [r0, lr, lsr #15]
	rsb lr, lr, #0
	mov r0, lr, asr #1
	mul r0, r1, r0
	add r0, r0, #0x80000000
	mov r0, r0, lsr #6
	mul r0, r1, r0
	mov r0, r0, lsr #0xe
	mul r1, lr, r0
	sub ip, r3, ip
	mov r1, r1, lsr #0xc
	mul r1, r0, r1
	mov r0, r0, lsl #0xe
	add r0, r0, r1, lsr #15
	umull r1, r0, r2, r0
	mov r3, r0
	orrmi r0, r0, #0x80000000
	adds ip, ip, #0x7e
	bmi _020F1FA0
	cmp ip, #0xfe
	bge _020F2054
	add r0, r0, ip, lsl #23
	mov ip, r1, lsr #0x1c
	cmp ip, #7
	beq _020F1E7C
	add r0, r0, r1, lsr #31
	ldmia sp!, {lr}
	bx lr
UNK_020F1D7C: ; 0x020F1D7C
	.byte 0xFF, 0xFF, 0xFE, 0xFD
	.byte 0xFC, 0xFB, 0xFA, 0xF9, 0xF8, 0xF7, 0xF6, 0xF5, 0xF4, 0xF3, 0xF2, 0xF1, 0xF0, 0xF0, 0xEF, 0xEE
	.byte 0xED, 0xEC, 0xEB, 0xEA, 0xEA, 0xE9, 0xE8, 0xE7, 0xE6, 0xE6, 0xE5, 0xE4, 0xE3, 0xE2, 0xE2, 0xE1
	.byte 0xE0, 0xDF, 0xDF, 0xDE, 0xDD, 0xDC, 0xDC, 0xDB, 0xDA, 0xD9, 0xD9, 0xD8, 0xD7, 0xD7, 0xD6, 0xD5
	.byte 0xD4, 0xD4, 0xD3, 0xD2, 0xD2, 0xD1, 0xD0, 0xD0, 0xCF, 0xCE, 0xCE, 0xCD, 0xCC, 0xCC, 0xCB, 0xCB
	.byte 0xCA, 0xC9, 0xC9, 0xC8, 0xC8, 0xC7, 0xC6, 0xC6, 0xC5, 0xC5, 0xC4, 0xC3, 0xC3, 0xC2, 0xC2, 0xC1
	.byte 0xC0, 0xC0, 0xBF, 0xBF, 0xBE, 0xBE, 0xBD, 0xBD, 0xBC, 0xBC, 0xBB, 0xBA, 0xBA, 0xB9, 0xB9, 0xB8
	.byte 0xB8, 0xB7, 0xB7, 0xB6, 0xB6, 0xB5, 0xB5, 0xB4, 0xB4, 0xB3, 0xB3, 0xB2, 0xB2, 0xB1, 0xB1, 0xB0
	.byte 0xB0, 0xAF, 0xAF, 0xAF, 0xAE, 0xAE, 0xAD, 0xAD, 0xAC, 0xAC, 0xAB, 0xAB, 0xAA, 0xAA, 0xAA, 0xA9
	.byte 0xA9, 0xA8, 0xA8, 0xA7, 0xA7, 0xA7, 0xA6, 0xA6, 0xA5, 0xA5, 0xA4, 0xA4, 0xA4, 0xA3, 0xA3, 0xA2
	.byte 0xA2, 0xA2, 0xA1, 0xA1, 0xA0, 0xA0, 0xA0, 0x9F, 0x9F, 0x9E, 0x9E, 0x9E, 0x9D, 0x9D, 0x9D, 0x9C
	.byte 0x9C, 0x9B, 0x9B, 0x9B, 0x9A, 0x9A, 0x9A, 0x99, 0x99, 0x99, 0x98, 0x98, 0x98, 0x97, 0x97, 0x96
	.byte 0x96, 0x96, 0x95, 0x95, 0x95, 0x94, 0x94, 0x94, 0x93, 0x93, 0x93, 0x92, 0x92, 0x92, 0x91, 0x91
	.byte 0x91, 0x91, 0x90, 0x90, 0x90, 0x8F, 0x8F, 0x8F, 0x8E, 0x8E, 0x8E, 0x8D, 0x8D, 0x8D, 0x8C, 0x8C
	.byte 0x8C, 0x8C, 0x8B, 0x8B, 0x8B, 0x8A, 0x8A, 0x8A, 0x8A, 0x89, 0x89, 0x89, 0x88, 0x88, 0x88, 0x88
	.byte 0x87, 0x87, 0x87, 0x86, 0x86, 0x86, 0x86, 0x85, 0x85, 0x85, 0x85, 0x84, 0x84, 0x84, 0x83, 0x83
	.byte 0x83, 0x83, 0x82, 0x82, 0x82, 0x82, 0x81, 0x81, 0x81, 0x81, 0x80, 0x80
_020F1E7C:
	mov r1, r3, lsl #1
	add r1, r1, #1
	rsb lr, lr, #0
	mul r1, lr, r1
	cmp r1, r2, lsl #24
	addmi r0, r0, #1
	ldmia sp!, {lr}
	bx lr
_020F1E9C:
	eor lr, r0, r1
	and lr, lr, #0x80000000
	cmp r3, #0
	beq _020F1EF4
	movs r0, r0, lsl #9
	bne _020F203C
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _020F202C
	cmp ip, #0xff
	blt _020F202C
	cmp r1, #0
	beq _020F2048
	b _020F2024
_020F1ED8:
	eor lr, r0, r1
	and lr, lr, #0x80000000
	cmp ip, #0
	beq _020F1F58
_020F1EE8:
	movs r1, r1, lsl #9
	bne _020F2024
	b _020F2074
_020F1EF4:
	movs r2, r0, lsl #9
	beq _020F1F28
	clz r3, r2
	movs r2, r2, lsl r3
	rsb r3, r3, #0
	mov r2, r2, lsr #8
	ands ip, ip, r1, lsr #23
	beq _020F1F80
	cmp ip, #0xff
	beq _020F1EE8
	orr r1, r1, #0x800000
	bic lr, r1, #0xff000000
	b _020F1CF8
_020F1F28:
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _020F1F4C
	cmp ip, #0xff
	blt _020F2074
	cmp r1, #0
	beq _020F2074
	b _020F2024
_020F1F4C:
	cmp r1, #0
	beq _020F2048
	b _020F2074
_020F1F58:
	movs ip, r1, lsl #9
	beq _020F202C
	mov lr, ip
	clz ip, lr
	movs lr, lr, lsl ip
	rsb ip, ip, #0
	mov lr, lr, lsr #8
	orr r0, r0, #0x800000
	bic r2, r0, #0xff000000
	b _020F1CF8
_020F1F80:
	movs ip, r1, lsl #9
	beq _020F202C
	mov lr, ip
	clz ip, lr
	movs lr, lr, lsl ip
	rsb ip, ip, #0
	mov lr, lr, lsr #8
	b _020F1CF8
_020F1FA0:
	and r0, r0, #0x80000000
	cmn ip, #0x18
	beq _020F2014
	bmi _020F206C
	add r1, ip, #0x17
	mov r2, r2, lsl r1
	rsb ip, ip, #0
	mov r3, r3, lsr ip
	orr r0, r0, r3
	rsb lr, lr, #0
	mul r1, lr, r3
	cmp r1, r2
	ldmeqia sp!, {lr}
	bxeq lr
	add r1, r1, lr
	cmp r1, r2
	beq _020F2008
	addmi r0, r0, #1
	subpl r1, r1, lr
	add r1, lr, r1, lsl #1
	cmp r1, r2, lsl #1
	and r3, r0, #1
	addmi r0, r0, #1
	addeq r0, r0, r3
	ldmia sp!, {lr}
	bx lr
_020F2008:
	add r0, r0, #1
	ldmia sp!, {lr}
	bx lr
_020F2014:
	cmn r2, lr
	addne r0, r0, #1
	ldmia sp!, {lr}
	bx lr
_020F2024:
	mov r0, r1
	b _020F203C
_020F202C:
	mov r0, #0xff000000
	orr r0, lr, r0, lsr #1
	ldmia sp!, {lr}
	bx lr
_020F203C:
	mvn r0, #0x80000000
	ldmia sp!, {lr}
	bx lr
_020F2048:
	mvn r0, #0x80000000
	ldmia sp!, {lr}
	bx lr
_020F2054:
	tst r0, #0x80000000
	mov r0, #0xff000000
	movne r0, r0, asr #1
	moveq r0, r0, lsr #1
	ldmia sp!, {lr}
	bx lr
_020F206C:
	ldmia sp!, {lr}
	bx lr
_020F2074:
	mov r0, lr
	ldmia sp!, {lr}
	bx lr

	.public _f2d
	.type _f2d, @function
	.public _f_ftod
	.type _f_ftod, @function
_f2d: ; 0x020F2080
_f_ftod:
	and r2, r0, #0x80000000
	mov ip, r0, lsr #0x17
	mov r3, r0, lsl #9
	ands ip, ip, #0xff
	beq _020F20B0
	cmp ip, #0xff
	beq _020F20DC
_020F209C:
	add ip, ip, #0x380
	mov r0, r3, lsl #0x14
	orr r1, r2, r3, lsr #12
	orr r1, r1, ip, lsl #20
	bx lr
_020F20B0:
	cmp r3, #0
	bne _020F20C4
	mov r1, r2
	mov r0, #0
	bx lr
_020F20C4:
	mov r3, r3, lsr #1
	clz ip, r3
	movs r3, r3, lsl ip
	rsb ip, ip, #1
	add r3, r3, r3
	b _020F209C
_020F20DC:
	cmp r3, #0
	bhi _020F20F4
	ldr r1, _020F2100 ; =0x7FF00000
	orr r1, r1, r2
	mov r0, #0
	bx lr
_020F20F4:
	mvn r0, #0
	bic r1, r0, #0x80000000
	bx lr
	.align 2, 0
_020F2100: .word 0x7FF00000

	.public _f_ftoi
	.type _f_ftoi, @function
	.public _ffix
	.type _ffix, @function
_f_ftoi: ; 0x020F2104
_ffix:
	bic r1, r0, #0x80000000
	mov r2, #0x9e
	subs r2, r2, r1, lsr #23
	ble _020F212C
	mov r1, r1, lsl #8
	orr r1, r1, #0x80000000
	cmp r0, #0
	mov r0, r1, lsr r2
	rsbmi r0, r0, #0
	bx lr
_020F212C:
	mvn r0, r0, asr #31
	add r0, r0, #0x80000000
	bx lr

	.public _ffixu
	.type _ffixu, @function
	.public _f_ftou
	.type _f_ftou, @function
_ffixu: ; 0x020F2138
_f_ftou:
	tst r0, #0x80000000
	bne _020F215C
	mov r1, #0x9e
	subs r1, r1, r0, lsr #23
	blt _020F2170
	mov r2, r0, lsl #8
	orr r0, r2, #0x80000000
	mov r0, r0, lsr r1
	bx lr
_020F215C:
	mov r2, #0xff000000
	cmp r2, r0, lsl #1
	movhs r0, #0
	mvnlo r0, #0
	bx lr
_020F2170:
	mvn r0, #0
	bx lr

	.public _fflt
	.type _fflt, @function
	.public _f_itof
	.type _f_itof, @function
_fflt: ; 0x020F2178
_f_itof:
	ands r2, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r0, #0
__f_itof_common:
	bxeq lr
	clz r3, r0
	movs r0, r0, lsl r3
	rsb r3, r3, #0x9e
	ands r1, r0, #0xff
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst r1, #0x80
	bxeq lr
	ands r3, r1, #0x7f
	andeqs r3, r0, #1
	addne r0, r0, #1
	bx lr

	.public _ffltu
	.type _ffltu, @function
	.public _f_utof
	.type _f_utof, @function
_ffltu: ; 0x020F21C0
_f_utof:
	cmp r0, #0
__f_utof_common:
	bxeq lr
	mov r3, #0x9e
	bmi _020F21DC
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
_020F21DC:
	ands r2, r0, #0xff
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst r2, #0x80
	bxeq lr
	ands r1, r2, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr

	.public _f_lltof
	.type _f_lltof, @function
	.public _ll_sto_f
	.type _ll_sto_f, @function
_f_lltof: ; 0x020F2208
_ll_sto_f:
	ands r2, r1, #0x80000000
	beq _020F2218
	rsbs r0, r0, #0
	rsc r1, r1, #0
_020F2218:
	cmp r1, #0
	bne _020F2228
	movs r0, r0
	b __f_itof_common
_020F2228:
	clz r3, r1
	movs r1, r1, lsl r3
	rsb r3, r3, #0x20
	orr r1, r1, r0, lsr r3
	rsb ip, r3, #0x20
	movs r0, r0, lsl ip
	orrne r1, r1, #1
	add r3, r3, #0x9e
	ands ip, r1, #0xff
	add r0, r1, r1
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst ip, #0x80
	bxeq lr
	ands r3, ip, #0x7f
	andeqs r3, r0, #1
	addne r0, r0, #1
	bx lr

	.public _f_ulltof
	.type _f_ulltof, @function
	.public _ll_uto_f
	.type _ll_uto_f, @function
_f_ulltof: ; 0x020F2274
_ll_uto_f:
	cmp r1, #0
	bne _020F2284
	movs r0, r0
	b __f_utof_common
_020F2284:
	mov r3, #0x20
	bmi _020F22A4
	clz ip, r1
	movs r1, r1, lsl ip
	sub r3, r3, ip
	orr r1, r1, r0, lsr r3
	rsb r2, r3, #0x20
	mov r0, r0, lsl r2
_020F22A4:
	cmp r0, #0
	orrne r1, r1, #1
	add r3, r3, #0x9e
	ands r2, r1, #0xff
	add r0, r1, r1
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst r2, #0x80
	bxeq lr
	ands r1, r2, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr

	.public _fmul
	.type _fmul, @function
	.public _f_mul
	.type _f_mul, @function
_fmul: ; 0x020F22DC
_f_mul:
	eor r2, r0, r1
	and r2, r2, #0x80000000
	mov ip, #0xff
	ands r3, ip, r0, lsr #23
	mov r0, r0, lsl #8
	cmpne r3, #0xff
	beq _020F2358
	orr r0, r0, #0x80000000
	ands ip, ip, r1, lsr #23
	mov r1, r1, lsl #8
	cmpne ip, #0xff
	beq _020F2398
	orr r1, r1, #0x80000000
_020F2310:
	add ip, r3, ip
	umull r1, r3, r0, r1
	movs r0, r3
	addpl r0, r0, r0
	subpl ip, ip, #1
	subs ip, ip, #0x7f
	bmi _020F2424
	cmp ip, #0xfe
	bge _020F2490
	ands r3, r0, #0xff
	orr r0, r2, r0, lsr #8
	add r0, r0, ip, lsl #23
	tst r3, #0x80
	bxeq lr
	orrs r1, r1, r3, lsl #25
	andeqs r3, r0, #1
	addne r0, r0, #1
	bx lr
_020F2358:
	cmp r3, #0
	beq _020F23AC
	movs r0, r0, lsl #1
	bne __f_result_x_NaN
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _020F238C
	cmp ip, #0xff
	blt __f_result_INF
	cmp r1, #0
	beq __f_result_INF
	b __f_result_x_NaN
_020F238C:
	cmp r1, #0
	beq __f_result_invalid
	b __f_result_INF
_020F2398:
	cmp ip, #0
	beq _020F2408
_020F23A0:
	movs r1, r1, lsl #1
	bne __f_result_x_NaN
	b __f_result_INF
_020F23AC:
	movs r0, r0, lsl #1
	beq _020F23E4
	mov r0, r0, lsr #1
	clz r3, r0
	movs r0, r0, lsl r3
	rsb r3, r3, #1
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #8
	ands ip, ip, #0xff
	beq _020F2408
	cmp ip, #0xff
	beq _020F23A0
	orr r1, r1, #0x80000000
	b _020F2310
_020F23E4:
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _020F24B4
	cmp ip, #0xff
	blt _020F24B4
	cmp r1, #0
	beq __f_result_invalid
	b __f_result_x_NaN
_020F2408:
	movs r1, r1, lsl #1
	beq _020F24B4
	mov r1, r1, lsr #1
	clz ip, r1
	movs r1, r1, lsl ip
	rsb ip, ip, #1
	b _020F2310
_020F2424:
	cmn ip, #0x18
	beq _020F246C
	bmi _020F24AC
	cmp r1, #0
	orrne r0, r0, #1
	mov r3, r0
	mov r0, r0, lsr #8
	rsb ip, ip, #0
	orr r0, r2, r0, lsr ip
	rsb ip, ip, #0x18
	movs r1, r3, lsl ip
	bxeq lr
	tst r1, #0x80000000
	bxeq lr
	movs r1, r1, lsl #1
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F246C:
	mov r0, r0, lsl #1
	b _020F249C
__f_result_INF:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
__f_result_x_NaN:
	mvn r0, #0x80000000
	bx lr
__f_result_invalid:
	mvn r0, #0x80000000
	bx lr
_020F2490:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_020F249C:
	movs r1, r0
	mov r0, r2
	addne r0, r0, #1
	bx lr
_020F24AC:
	mov r0, r2
	bx lr
_020F24B4:
	mov r0, r2
	bx lr

	.public _frsb
	.type _frsb, @function
_frsb: ; 0x020F24BC
	eor r0, r0, r1
	eor r1, r0, r1
	eor r0, r0, r1
	.public _fsub
	.type _fsub, @function
	.public _f_sub
	.type _f_sub, @function
_fsub: ; 0x020F24C8
_f_sub: ; 0x020F24C8
	eors r2, r0, r1
	eormi r1, r1, #0x80000000
	bmi __fadd_start
__fsub_start:
	subs ip, r0, r1
	eorlo ip, ip, #0x80000000
	sublo r0, r0, ip
	addlo r1, r1, ip
	mov r2, #0x80000000
	mov r3, r0, lsr #0x17
	orr r0, r2, r0, lsl #8
	ands ip, r3, #0xff
	cmpne ip, #0xff
	beq _020F25F0
	mov ip, r1, lsr #0x17
	orr r1, r2, r1, lsl #8
	ands r2, ip, #0xff
	beq _020F2630
_020F250C:
	subs ip, r3, ip
	beq _020F2554
	rsb r2, ip, #0x20
	movs r2, r1, lsl r2
	mov r1, r1, lsr ip
	orrne r1, r1, #1
	subs r0, r0, r1
	bpl _020F2598
	ands r1, r0, #0xff
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	tst r1, #0x80
	bxeq lr
	ands r1, r1, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F2554:
	subs r0, r0, r1
	beq _020F26FC
	mov r2, r3, lsl #0x17
	and r2, r2, #0x80000000
	bic r3, r3, #0x100
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
	cmp r3, #0
	bgt _020F2588
	rsb r3, r3, #9
	orr r0, r2, r0, lsr r3
	bx lr
_020F2588:
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bx lr
_020F2598:
	mov r2, r3, lsl #0x17
	and r2, r2, #0x80000000
	bic r3, r3, #0x100
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
	cmp r3, #0
	bgt _020F25C4
	rsb r3, r3, #9
	orr r0, r2, r0, lsr r3
	bx lr
_020F25C4:
	ands r1, r0, #0xff
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst r1, #0x80
	bxeq lr
	ands r1, r1, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F25F0:
	cmp r3, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	ands r3, r3, #0xff
	beq _020F2658
	movs r0, r0, lsl #1
	bne _020F2730
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _020F2724
	cmp ip, #0xff
	blt _020F2724
	cmp r1, #0
	beq _020F2738
	b _020F2730
_020F2630:
	cmp ip, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	and r3, r3, #0xff
	ands ip, ip, #0xff
	beq _020F26C0
_020F2648:
	eor r2, r2, #0x80000000
	movs r1, r1, lsl #1
	bne _020F2730
	b _020F2724
_020F2658:
	movs r0, r0, lsl #1
	beq _020F2690
	mov r0, r0, lsr #1
	mov r3, #1
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #8
	ands ip, ip, #0xff
	beq _020F26C0
	cmp ip, #0xff
	beq _020F2648
	orr r1, r1, #0x80000000
	orr r3, r3, r2, lsr #23
	orr ip, ip, r2, lsr #23
	b _020F250C
_020F2690:
	mov r3, r1, lsr #0x17
	mov r0, r1, lsl #9
	ands r2, r3, #0xff
	beq _020F26B4
	cmp r2, #0xff
	blt _020F26DC
	cmp r0, #0
	bne _020F271C
	b _020F2724
_020F26B4:
	cmp r0, #0
	beq _020F26FC
	b _020F26DC
_020F26C0:
	movs r1, r1, lsl #1
	beq _020F26E4
	mov r1, r1, lsr #1
	mov ip, #1
	orr ip, ip, r2, lsr #23
	orr r3, r3, r2, lsr #23
	b _020F250C
_020F26DC:
	mov r0, r1
	bx lr
_020F26E4:
	cmp r0, #0
	subges r3, r3, #1
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bx lr
_020F26FC:
	mov r0, #0
	bx lr
_020F2704: ; 0x020F2704
	cmp r0, #0
	subges r3, r3, #1
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bx lr
_020F271C:
	mvn r0, #0x80000000
	bx lr
_020F2724:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_020F2730:
	mvn r0, #0x80000000
	bx lr
_020F2738:
	mvn r0, #0x80000000
	bx lr

	.public _ll_mod
	.type _ll_mod, @function
_ll_mod: ; 0x020F2740
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, r1
	orr r4, r4, #1
	b _020F2760

	.public _ll_sdiv
	.type _ll_sdiv, @function
	.public _ll_div
	.type _ll_div, @function
_ll_sdiv: ; 0x020F2750
_ll_div: ; 0x020F2750
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	eor r4, r1, r3
	mov r4, r4, asr #1
	mov r4, r4, lsl #1
_020F2760:
	orrs r5, r3, r2
	bne _020F2770
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_020F2770:
	mov r5, r0, lsr #0x1f
	add r5, r5, r1
	mov r6, r2, lsr #0x1f
	add r6, r6, r3
	orrs r6, r5, r6
	bne _020F27A4
	mov r1, r2
	bl _s32_div_f
	ands r4, r4, #1
	movne r0, r1
	mov r1, r0, asr #0x1f
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_020F27A4:
	cmp r1, #0
	bge _020F27B4
	rsbs r0, r0, #0
	rsc r1, r1, #0
_020F27B4:
	cmp r3, #0
	bge _020F27C4
	rsbs r2, r2, #0
	rsc r3, r3, #0
_020F27C4:
	orrs r5, r1, r0
	beq _020F28E8
	mov r5, #0
	mov r6, #1
	cmp r3, #0
	bmi _020F27F0
_020F27DC:
	add r5, r5, #1
	adds r2, r2, r2
	adcs r3, r3, r3
	bpl _020F27DC
	add r6, r6, r5
_020F27F0:
	cmp r1, #0
	blt _020F2810
_020F27F8:
	cmp r6, #1
	beq _020F2810
	sub r6, r6, #1
	adds r0, r0, r0
	adcs r1, r1, r1
	bpl _020F27F8
_020F2810:
	mov r7, #0
	mov ip, #0
	mov fp, #0
	b _020F2838
_020F2820:
	orr ip, ip, #1
	subs r6, r6, #1
	beq _020F2890
	adds r0, r0, r0
	adcs r1, r1, r1
	adcs r7, r7, r7
_020F2838:
	subs r0, r0, r2
	sbcs r1, r1, r3
	sbcs r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _020F2820
_020F2854:
	subs r6, r6, #1
	beq _020F2888
	adds r0, r0, r0
	adcs r1, r1, r1
	adc r7, r7, r7
	adds r0, r0, r2
	adcs r1, r1, r3
	adc r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _020F2820
	b _020F2854
_020F2888:
	adds r0, r0, r2
	adc r1, r1, r3
_020F2890:
	ands r7, r4, #1
	moveq r0, ip
	moveq r1, fp
	beq _020F28C8
	subs r7, r5, #0x20
	movge r0, r1, lsr r7
	bge _020F28EC
	rsb r7, r5, #0x20
	mov r0, r0, lsr r5
	orr r0, r0, r1, lsl r7
	mov r1, r1, lsr r5
	b _020F28C8
_020F28C0: ; 0x020F28C0
	mov r0, r1, lsr r7
	mov r1, #0
_020F28C8:
	cmp r4, #0
	blt _020F28D8
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_020F28D8:
	rsbs r0, r0, #0
	rsc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_020F28E8:
	mov r0, #0
_020F28EC:
	mov r1, #0
	cmp r4, #0
	blt _020F28D8
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr

	.public _ll_udiv
	.type _ll_udiv, @function
	.public _ull_div
	.type _ull_div, @function
_ll_udiv: ; 0x020F2900
_ull_div:
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #0
	b _020F2914

	.public _ull_mod
	.type _ull_mod, @function
_ull_mod: ; 0x020F290C
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #1
_020F2914:
	orrs r5, r3, r2
	bne _020F2924
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_020F2924:
	orrs r5, r1, r3
	bne _020F27C4
	mov r1, r2
	bl _u32_div_not_0_f
	cmp r4, #0
	movne r0, r1
	mov r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr

	.public _ll_mul
	.type _ll_mul, @function
	.public _ull_mul
	.type _ull_mul, @function
_ll_mul: ; 0x020F2948
_ull_mul: ; 0x020F2948
	stmdb sp!, {r4, r5, lr}
	umull r5, r4, r0, r2
	mla r4, r0, r3, r4
	mla r4, r2, r1, r4
	mov r1, r4
	mov r0, r5
	ldmia sp!, {r4, r5, lr}
	bx lr

	.public _ll_shl
	.type _ll_shl, @function
	.public _ll_sll
	.type _ll_sll, @function
	.public _ull_sll
	.type _ull_sll, @function
_ll_shl: ; 0x020F2968
_ll_sll:
_ull_sll:
	ands r2, r2, #0x3f
	bxeq lr
	subs r3, r2, #0x20
	bge _020F298C
	rsb r3, r2, #0x20
	mov r1, r1, lsl r2
	orr r1, r1, r0, lsr r3
	mov r0, r0, lsl r2
	bx lr
_020F298C:
	mov r1, r0, lsl r3
	mov r0, #0
	bx lr

	.public _s32_div_f
	.type _s32_div_f, @function
_s32_div_f: ; 0x020F2998
	eor ip, r0, r1
	and ip, ip, #0x80000000
	cmp r0, #0
	rsblt r0, r0, #0
	addlt ip, ip, #1
	cmp r1, #0
	rsblt r1, r1, #0
	beq _020F2B90
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	blo _020F2B90
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
	nop
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
_020F2B90:
	ands r3, ip, #0x80000000
	rsbne r0, r0, #0
	ands r3, ip, #1
	rsbne r1, r1, #0
	bx lr

	.public _u32_div_f
	.type _u32_div_f, @function
_u32_div_f: ; 0x020F2BA4
	cmp r1, #0
	bxeq lr
	.public _u32_div_not_0_f
	.type _u32_div_not_0_f, @function
_u32_div_not_0_f: ; 0x020F2BAC
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
	nop
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

	.public _drdiv
	.type _drdiv, @function
_drdiv: ; 0x020F2D88
	eor r1, r1, r3
	eor r3, r1, r3
	eor r1, r1, r3
	eor r0, r0, r2
	eor r2, r0, r2
	eor r0, r0, r2
	.public _ddiv
	.type _ddiv, @function
	.public _d_div
	.type _d_div, @function
_ddiv: ; 0x020F2DA0
_d_div:
	stmdb sp!, {r4, r5, r6, lr}
	ldr lr, _020F32E0 ; =0x00000FFE
	eor r4, r1, r3
	ands ip, lr, r1, lsr #19
	cmpne ip, lr
	beq _020F314C
	bic r1, r1, lr, lsl #20
	orr r1, r1, #0x100000
	add ip, ip, r4, lsr #31
_020F2DC4:
	ands r4, lr, r3, lsr #19
	cmpne r4, lr
	beq _020F31E4
	bic r3, r3, lr, lsl #20
	orr r3, r3, #0x100000
_020F2DD8:
	sub ip, ip, r4
	cmp r1, r3
	cmpeq r0, r2
	bhs _020F2DF4
	adds r0, r0, r0
	adc r1, r1, r1
	sub ip, ip, #2
_020F2DF4:
	adr r4, UNK_020F2ED8 - 0x100
	ldrb lr, [r4, r3, lsr #12]
	rsbs r2, r2, #0
	rsc r3, r3, #0
	mov r4, #0x20000000
	mla r5, lr, r3, r4
	mov r6, r3, lsl #0xa
	mov r5, r5, lsr #7
	mul lr, r5, lr
	orr r6, r6, r2, lsr #22
	mov lr, lr, lsr #0xd
	mul r5, lr, r6
	mov r6, r1, lsl #0xa
	orr r6, r6, r0, lsr #22
	mov r5, r5, lsr #0x10
	mul r5, lr, r5
	mov lr, lr, lsl #0xe
	add lr, lr, r5, lsr #16
	umull r5, r6, lr, r6
	umull r4, r5, r6, r2
	mla r5, r3, r6, r5
	mov r4, r4, lsr #0x1a
	orr r4, r4, r5, lsl #6
	add r4, r4, r0, lsl #2
	umull lr, r5, r4, lr
	mov r4, #0
	adds r5, r5, r6, lsl #24
	adc r4, r4, r6, lsr #8
	cmp ip, #0x800
	bge _020F2FD8
	add ip, ip, #0x7f0
	adds ip, ip, #0xc
	bmi _020F2FF0
	orr r1, r4, ip, lsl #31
	bic ip, ip, #1
	add r1, r1, ip, lsl #19
	tst lr, #0x80000000
	bne _020F2EC8
	rsbs r2, r2, #0
	mov r4, r4, lsl #1
	add r4, r4, r5, lsr #31
	mul lr, r2, r4
	mov r6, #0
	mov r4, r5, lsl #1
	orr r4, r4, #1
	umlal r6, lr, r4, r2
	rsc r3, r3, #0
	mla lr, r4, r3, lr
	cmp lr, r0, lsl #21
	bmi _020F2EC8
	mov r0, r5
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F2EC8:
	adds r0, r5, #1
	adc r1, r1, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
UNK_020F2ED8: ; 0x020F2ED8
	.byte 0xFF, 0xFF, 0xFE, 0xFD, 0xFC, 0xFB, 0xFA, 0xF9
	.byte 0xF8, 0xF7, 0xF6, 0xF5, 0xF4, 0xF3, 0xF2, 0xF1, 0xF0, 0xF0, 0xEF, 0xEE, 0xED, 0xEC, 0xEB, 0xEA
	.byte 0xEA, 0xE9, 0xE8, 0xE7, 0xE6, 0xE6, 0xE5, 0xE4, 0xE3, 0xE2, 0xE2, 0xE1, 0xE0, 0xDF, 0xDF, 0xDE
	.byte 0xDD, 0xDC, 0xDC, 0xDB, 0xDA, 0xD9, 0xD9, 0xD8, 0xD7, 0xD7, 0xD6, 0xD5, 0xD4, 0xD4, 0xD3, 0xD2
	.byte 0xD2, 0xD1, 0xD0, 0xD0, 0xCF, 0xCE, 0xCE, 0xCD, 0xCC, 0xCC, 0xCB, 0xCB, 0xCA, 0xC9, 0xC9, 0xC8
	.byte 0xC8, 0xC7, 0xC6, 0xC6, 0xC5, 0xC5, 0xC4, 0xC3, 0xC3, 0xC2, 0xC2, 0xC1, 0xC0, 0xC0, 0xBF, 0xBF
	.byte 0xBE, 0xBE, 0xBD, 0xBD, 0xBC, 0xBC, 0xBB, 0xBA, 0xBA, 0xB9, 0xB9, 0xB8, 0xB8, 0xB7, 0xB7, 0xB6
	.byte 0xB6, 0xB5, 0xB5, 0xB4, 0xB4, 0xB3, 0xB3, 0xB2, 0xB2, 0xB1, 0xB1, 0xB0, 0xB0, 0xAF, 0xAF, 0xAF
	.byte 0xAE, 0xAE, 0xAD, 0xAD, 0xAC, 0xAC, 0xAB, 0xAB, 0xAA, 0xAA, 0xAA, 0xA9, 0xA9, 0xA8, 0xA8, 0xA7
	.byte 0xA7, 0xA7, 0xA6, 0xA6, 0xA5, 0xA5, 0xA4, 0xA4, 0xA4, 0xA3, 0xA3, 0xA2, 0xA2, 0xA2, 0xA1, 0xA1
	.byte 0xA0, 0xA0, 0xA0, 0x9F, 0x9F, 0x9E, 0x9E, 0x9E, 0x9D, 0x9D, 0x9D, 0x9C, 0x9C, 0x9B, 0x9B, 0x9B
	.byte 0x9A, 0x9A, 0x9A, 0x99, 0x99, 0x99, 0x98, 0x98, 0x98, 0x97, 0x97, 0x96, 0x96, 0x96, 0x95, 0x95
	.byte 0x95, 0x94, 0x94, 0x94, 0x93, 0x93, 0x93, 0x92, 0x92, 0x92, 0x91, 0x91, 0x91, 0x91, 0x90, 0x90
	.byte 0x90, 0x8F, 0x8F, 0x8F, 0x8E, 0x8E, 0x8E, 0x8D, 0x8D, 0x8D, 0x8C, 0x8C, 0x8C, 0x8C, 0x8B, 0x8B
	.byte 0x8B, 0x8A, 0x8A, 0x8A, 0x8A, 0x89, 0x89, 0x89, 0x88, 0x88, 0x88, 0x88, 0x87, 0x87, 0x87, 0x86
	.byte 0x86, 0x86, 0x86, 0x85, 0x85, 0x85, 0x85, 0x84, 0x84, 0x84, 0x83, 0x83, 0x83, 0x83, 0x82, 0x82
	.byte 0x82, 0x82, 0x81, 0x81, 0x81, 0x81, 0x80, 0x80
_020F2FD8:
	movs r1, ip, lsl #0x1f
	orr r1, r1, #0x7f000000
	orr r1, r1, #0xf00000
	mov r0, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F2FF0:
	mvn r6, ip, asr #1
	cmp r6, #0x34
	bgt _020F313C
	beq _020F3118
	cmp r6, #0x14
	bge _020F3038
	rsb r6, r6, #0x13
	mov lr, r0, lsl r6
	rsb r6, r6, #0x14
	mov r0, r5, lsr r6
	rsb r6, r6, #0x20
	orr r0, r0, r4, lsl r6
	rsb r6, r6, #0x20
	mov r4, r4, lsr r6
	orr r1, r4, ip, lsl #31
	mov ip, lr
	mov lr, #0
	b _020F3068
_020F3038:
	rsb r6, r6, #0x33
	mov lr, r1, lsl r6
	mov r1, ip, lsl #0x1f
	rsb r6, r6, #0x20
	orr ip, lr, r0, lsr r6
	rsb r6, r6, #0x20
	mov lr, r0, lsl r6
	mov r5, r5, lsr #0x15
	orr r5, r5, r4, lsl #11
	rsb r6, r6, #0x1f
	mov r0, r5, lsr r6
	mov r4, #0
_020F3068:
	rsbs r2, r2, #0
	mul r4, r2, r4
	mov r5, #0
	umlal r5, r4, r2, r0
	rsc r3, r3, #0
	mla r4, r0, r3, r4
	cmp r4, ip
	cmpeq r5, lr
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	adds r5, r5, r2
	adc r4, r4, r3
	cmp r4, ip
	bmi _020F310C
	bne _020F30B0
	cmp r5, lr
	beq _020F30FC
	blo _020F310C
_020F30B0:
	subs r5, r5, r2
	sbc r4, r4, r3
_020F30B8:
	adds r5, r5, r5
	adc r4, r4, r4
	adds r5, r5, r2
	adc r4, r4, r3
	adds lr, lr, lr
	adc ip, ip, ip
	cmp r4, ip
	bmi _020F30FC
	ldmneia sp!, {r4, r5, r6, lr}
	bxne lr
	cmp r5, lr
	blo _020F30FC
	ldmneia sp!, {r4, r5, r6, lr}
	bxne lr
	tst r0, #1
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
_020F30FC:
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F310C:
	adds r0, r0, #1
	adc r1, r1, #0
	b _020F30B8
_020F3118:
	rsbs r2, r2, #0
	rsc r3, r3, #0
	cmp r1, r3
	cmpeq r0, r2
	mov r1, ip, lsl #0x1f
	mov r0, #0
	movne r0, #1
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F313C:
	mov r1, ip, lsl #0x1f
	mov r0, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F314C:
	orrs r5, r0, r1, lsl #1
	beq _020F3270
	cmp ip, lr
	beq _020F31B4
	movs r1, r1, lsl #0xc
	beq _020F3190
	clz r5, r1
	movs r1, r1, lsl r5
	sub ip, ip, r5
	add r5, ip, #0x1f
	mov r1, r1, lsr #0xb
	orr r1, r1, r0, lsr r5
	rsb r5, r5, #0x20
	mov r0, r0, lsl r5
	mov ip, ip, lsl #1
	orr ip, ip, r4, lsr #31
	b _020F2DC4
_020F3190:
	mvn ip, #0x13
	clz r5, r0
	movs r0, r0, lsl r5
	sub ip, ip, r5
	mov r1, r0, lsr #0xb
	mov r0, r0, lsl #0x15
	mov ip, ip, lsl #1
	orr ip, ip, r4, lsr #31
	b _020F2DC4
_020F31B4:
	orrs r5, r0, r1, lsl #12
	bne _020F3298
	bic r5, r3, #0x80000000
	cmp r5, lr, lsl #19
	bhs _020F31D8
	and r5, r3, #0x80000000
	eor r1, r5, r1
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F31D8:
	orrs r5, r2, r3, lsl #12
	bne _020F32B8
	b _020F32D0
_020F31E4:
	orrs r5, r2, r3, lsl #1
	beq _020F325C
	cmp r4, lr
	beq _020F3244
	movs r3, r3, lsl #0xc
	beq _020F3224
	clz r5, r3
	movs r3, r3, lsl r5
	sub r4, r4, r5
	add r5, r4, #0x1f
	mov r3, r3, lsr #0xb
	orr r3, r3, r2, lsr r5
	rsb r5, r5, #0x20
	mov r2, r2, lsl r5
	mov r4, r4, lsl #1
	b _020F2DD8
_020F3224:
	mvn r4, #0x13
	clz r5, r2
	movs r2, r2, lsl r5
	sub r4, r4, r5
	mov r3, r2, lsr #0xb
	mov r2, r2, lsl #0x15
	mov r4, r4, lsl #1
	b _020F2DD8
_020F3244:
	orrs r5, r2, r3, lsl #12
	bne _020F32B8
	mov r1, ip, lsl #0x1f
	mov r0, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F325C:
	mov r1, ip, lsl #0x1f
	orr r1, r1, lr, lsl #19
	mov r0, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F3270:
	orrs r5, r2, r3, lsl #1
	beq _020F32D0
	bic r5, r3, #0x80000000
	cmp r5, lr, lsl #19
	cmpeq r2, #0
	bhi _020F32B8
	eor r1, r1, r3
	and r1, r1, #0x80000000
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F3298:
	tst r1, #0x80000
	beq _020F32D0
	bic r5, r3, #0x80000000
	cmp r5, lr, lsl #19
	cmpeq r2, #0
	bhi _020F32B8
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F32B8:
	tst r3, #0x80000
	beq _020F32D0
	mov r1, r3
	mov r0, r2
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F32D0:
	orr r1, r1, #0x7f000000
	orr r1, r1, #0xf80000
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_020F32E0: .word 0x00000FFE

	.public _fp_init
	.type _fp_init, @function
_fp_init: ; 0x020F32E4
	bx lr

	; NITRO_Runtime_Ai_LE.a

	arm_func_start sys_writec
sys_writec: ; 0x020F32E8
	str lr, [sp, #-4]!
	mov r1, r0
	mov r0, #3
	swi 0x123456
	ldr pc, [sp], #4
	arm_func_end sys_writec

	arm_func_start sys_readc
sys_readc: ; 0x020F32FC
	str lr, [sp, #-4]!
	mov r1, #0
	mov r0, #7
	swi 0x123456
	ldr pc, [sp], #4
	arm_func_end sys_readc

	arm_func_start sys_exit
sys_exit: ; 0x020F3310
	mov r1, #0
	mov r0, #0x18
	swi 0x123456
	mov pc, lr
	arm_func_end sys_exit

	arm_func_start __read_console
__read_console: ; 0x020F3320
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	ldr r5, [r6]
	mov r7, r1
	cmp r5, #0
	mov r4, #0
	bls _020F3368
_020F333C:
	bl sys_readc
	and r1, r0, #0xff
	cmp r1, #0xd
	strb r0, [r7, r4]
	cmpne r1, #0xa
	addeq r0, r4, #1
	streq r0, [r6]
	beq _020F3368
	add r4, r4, #1
	cmp r4, r5
	blo _020F333C
_020F3368:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end __read_console

	arm_func_start __write_console
__write_console: ; 0x020F3370
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, [r2]
	mov r6, r1
	cmp r5, #0
	mov r4, #0
	bls _020F339C
_020F3388:
	add r0, r6, r4
	bl sys_writec
	add r4, r4, #1
	cmp r4, r5
	blo _020F3388
_020F339C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end __write_console

	arm_func_start __close_console
__close_console: ; 0x020F33A4
	mov r0, #0
	bx lr
	arm_func_end __close_console

	arm_func_start _Z20__DecodeSignedNumberPcPl
_Z20__DecodeSignedNumberPcPl: ; 0x020F33AC
	stmdb sp!, {r4, lr}
	ldrsb r2, [r0]
	tst r2, #1
	bne _020F33CC
	mov r2, r2, asr #1
	str r2, [r1]
	add r0, r0, #1
	ldmia sp!, {r4, pc}
_020F33CC:
	tst r2, #2
	ldrb r4, [r0, #1]
	bne _020F33EC
	mov r2, r2, asr #2
	orr r2, r4, r2, lsl #8
	str r2, [r1]
	add r0, r0, #2
	ldmia sp!, {r4, pc}
_020F33EC:
	tst r2, #4
	ldrb lr, [r0, #2]
	bne _020F3414
	mov r3, r2, asr #3
	mov r2, r4, lsl #8
	orr r2, r2, r3, lsl #16
	orr r2, lr, r2
	str r2, [r1]
	add r0, r0, #3
	ldmia sp!, {r4, pc}
_020F3414:
	ldrb ip, [r0, #3]
	mov r3, r2, asr #3
	mov r2, r4, lsl #0x10
	orr r2, r2, r3, lsl #24
	orr r2, r2, lr, lsl #8
	orr r2, ip, r2
	str r2, [r1]
	add r0, r0, #4
	ldmia sp!, {r4, pc}
	arm_func_end _Z20__DecodeSignedNumberPcPl

	arm_func_start _Z22__DecodeUnsignedNumberPcPm
_Z22__DecodeUnsignedNumberPcPm: ; 0x020F3438
	stmdb sp!, {r4, lr}
	ldrb r2, [r0]
	tst r2, #1
	bne _020F3458
	mov r2, r2, lsr #1
	str r2, [r1]
	add r0, r0, #1
	ldmia sp!, {r4, pc}
_020F3458:
	tst r2, #2
	ldrb r4, [r0, #1]
	bne _020F3478
	mov r2, r2, lsr #2
	orr r2, r4, r2, lsl #8
	str r2, [r1]
	add r0, r0, #2
	ldmia sp!, {r4, pc}
_020F3478:
	tst r2, #4
	ldrb lr, [r0, #2]
	bne _020F34A0
	mov r3, r2, lsr #3
	mov r2, r4, lsl #8
	orr r2, r2, r3, lsl #16
	orr r2, lr, r2
	str r2, [r1]
	add r0, r0, #3
	ldmia sp!, {r4, pc}
_020F34A0:
	ldrb ip, [r0, #3]
	mov r3, r2, lsr #3
	mov r2, r4, lsl #0x10
	orr r2, r2, r3, lsl #24
	orr r2, r2, lr, lsl #8
	orr r2, ip, r2
	str r2, [r1]
	add r0, r0, #4
	ldmia sp!, {r4, pc}
	arm_func_end _Z22__DecodeUnsignedNumberPcPm

	arm_func_start _Z12BinarySearchP19ExceptionTableIndexmPc
_Z12BinarySearchP19ExceptionTableIndexmPc: ; 0x020F34C4
	stmdb sp!, {r4, r5, r6, lr}
	subs r6, r1, #1
	mov r5, #0
	bmi _020F3520
	mov r1, #0xc
_020F34D8:
	add r3, r5, r6
	mov r4, r3, asr #1
	mul r3, r4, r1
	ldr ip, [r0, r3]
	add lr, r0, r3
	cmp r2, ip
	sublo r6, r4, #1
	blo _020F3518
	ldr r3, [lr, #4]
	bic r3, r3, #1
	add r3, ip, r3
	cmp r2, r3
	addhi r5, r4, #1
	bhi _020F3518
	mov r0, lr
	ldmia sp!, {r4, r5, r6, pc}
_020F3518:
	cmp r5, r6
	ble _020F34D8
_020F3520:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end _Z12BinarySearchP19ExceptionTableIndexmPc

	arm_func_start _Z19FindExceptionRecordPcP13ExceptionInfo
_Z19FindExceptionRecordPcP13ExceptionInfo: ; 0x020F3528
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov sb, r1
	mov r2, #0
	str r2, [sb, #4]
	mov r0, sb
	mov r1, r4
	str r2, [sb, #8]
	bl _Z20__FindExceptionTableP13ExceptionInfoPc
	cmp r0, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [sb, #0xc]
	ldr r1, [sb, #0x10]
	ldr r3, _020F362C ; =0x2AAAAAAB
	sub r5, r1, r0
	smull r2, r1, r3, r5
	mov r3, r5, lsr #0x1f
	mov r2, r4
	add r1, r3, r1, asr #1
	bl _Z12BinarySearchP19ExceptionTableIndexmPc
	cmp r0, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [r0, #4]
	tst r1, #1
	addne r1, r0, #8
	ldreq r1, [r0, #8]
	str r1, [sb, #4]
	ldr r1, [r0]
	str r1, [sb]
	ldr r1, [r0]
	ldr r0, [sb, #4]
	sub r7, r4, r1
	bl _Z16__SkipUnwindInfoPc
	mov r8, #0
	add r5, sp, #4
	add r4, sp, #0
	add r6, sp, #8
_020F35C8:
	mov r1, r6
	bl _Z22__DecodeUnsignedNumberPcPm
	ldr r1, [sp, #8]
	cmp r1, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r1, r5
	bl _Z22__DecodeUnsignedNumberPcPm
	mov r1, r4
	bl _Z22__DecodeUnsignedNumberPcPm
	ldr r1, [sp, #8]
	add r2, r8, r1
	cmp r7, r2
	addlo sp, sp, #0xc
	ldmloia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [sp, #4]
	add r8, r2, r1
	cmp r7, r8
	bhi _020F35C8
	ldr r1, [sb, #4]
	ldr r0, [sp]
	add r0, r1, r0
	str r0, [sb, #8]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020F362C: .word 0x2AAAAAAB
	arm_func_end _Z19FindExceptionRecordPcP13ExceptionInfo

	arm_func_start _Z13CurrentActionPK14ActionIterator
_Z13CurrentActionPK14ActionIterator: ; 0x020F3630
	ldr r0, [r0, #8]
	cmp r0, #0
	ldrneb r0, [r0]
	andne r0, r0, #0x1f
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end _Z13CurrentActionPK14ActionIterator

	arm_func_start _Z10NextActionP14ActionIterator
_Z10NextActionP14ActionIterator: ; 0x020F364C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0xa0
	mov r4, r0
_020F3658:
	ldr r2, [r4, #8]
	cmp r2, #0
	beq _020F3670
	ldrb r0, [r2]
	tst r0, #0x80
	beq _020F36B4
_020F3670:
	mov r1, r4
	add r0, r4, #0x18
	bl _Z15__PopStackFrameP12ThrowContextP13ExceptionInfo
	mov r1, r4
	bl _Z19FindExceptionRecordPcP13ExceptionInfo
	ldr r0, [r4, #4]
	cmp r0, #0
	addeq sp, sp, #0xa0
	moveq r0, #0xff
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r4
	add r0, r4, #0x18
	bl _Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _020F3658
	b _020F3984
_020F36B4:
	and r0, r0, #0x1f
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _020F3978
_020F36C4: ; jump table
	b _020F3978 ; case 0
	b _020F3978 ; case 1
	b _020F3714 ; case 2
	b _020F372C ; case 3
	b _020F374C ; case 4
	b _020F3764 ; case 5
	b _020F378C ; case 6
	b _020F37AC ; case 7
	b _020F37CC ; case 8
	b _020F37F4 ; case 9
	b _020F3824 ; case 10
	b _020F383C ; case 11
	b _020F385C ; case 12
	b _020F3878 ; case 13
	b _020F3978 ; case 14
	b _020F388C ; case 15
	b _020F38B8 ; case 16
	b _020F3904 ; case 17
	b _020F3938 ; case 18
	b _020F3964 ; case 19
_020F3714:
	add r1, sp, #0x9c
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F372C:
	add r1, sp, #0x94
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x98
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F374C:
	add r1, sp, #0x90
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F3764:
	add r1, sp, #0x84
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x88
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x8c
	bl _Z22__DecodeUnsignedNumberPcPm
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F378C:
	add r1, sp, #0x7c
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x80
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F37AC:
	add r1, sp, #0x74
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x78
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F37CC:
	add r1, sp, #0x68
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x6c
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x70
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F37F4:
	add r1, sp, #0x58
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x5c
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x60
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x64
	bl _Z22__DecodeUnsignedNumberPcPm
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F3824:
	add r1, sp, #0x54
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F383C:
	add r1, sp, #0x4c
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x50
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F385C:
	add r1, sp, #0x44
	add r0, r2, #5
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x48
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [r4, #8]
	b _020F3984
_020F3878:
	add r1, sp, #0x40
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [r4, #8]
	b _020F3984
_020F388C:
	add r1, sp, #0x34
	add r0, r2, #1
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x38
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x3c
	bl _Z20__DecodeSignedNumberPcPl
	ldr r1, [sp, #0x34]
	add r0, r0, r1, lsl #2
	str r0, [r4, #8]
	b _020F3984
_020F38B8:
	add r1, sp, #0x24
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x28
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	orr r2, r1, r5, lsl #24
	add r1, sp, #0x2c
	add r0, r0, #4
	str r2, [sp, #0x30]
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F3904:
	add r1, sp, #0x14
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x1c
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x18
	add r0, r0, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F3938:
	add r1, sp, #8
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0xc
	add r0, r0, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x10
	bl _Z22__DecodeUnsignedNumberPcPm
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F3964:
	add r1, sp, #4
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [r4, #8]
	b _020F3984
_020F3978:
	add sp, sp, #0xa0
	mov r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_020F3984:
	ldr r2, [r4, #8]
	ldrb r0, [r2]
	and r0, r0, #0x1f
	cmp r0, #1
	addne sp, sp, #0xa0
	ldmneia sp!, {r3, r4, r5, pc}
	add r5, sp, #0
_020F39A0:
	mov r1, r5
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	ldr r1, [r4, #8]
	ldr r0, [sp]
	add r2, r1, r0
	str r2, [r4, #8]
	ldrb r0, [r2]
	and r0, r0, #0x1f
	cmp r0, #1
	beq _020F39A0
	add sp, sp, #0xa0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end _Z10NextActionP14ActionIterator

	arm_func_start _Z11UnwindStackP12ThrowContextP13ExceptionInfoPc
_Z11UnwindStackP12ThrowContextP13ExceptionInfoPc: ; 0x020F39D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa4
	mov sb, r0
	mov r8, r1
	str r2, [sp]
_020F39E8:
	ldr r2, [r8, #8]
	cmp r2, #0
	bne _020F3A30
	mov r0, sb
	mov r1, r8
	bl _Z15__PopStackFrameP12ThrowContextP13ExceptionInfo
	mov r1, r8
	bl _Z19FindExceptionRecordPcP13ExceptionInfo
	ldr r0, [r8, #4]
	cmp r0, #0
	bne _020F3A18
	bl _ZSt9terminatev
_020F3A18:
	mov r0, sb
	mov r1, r8
	bl _Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo
	ldr r2, [r8, #8]
	cmp r2, #0
	beq _020F39E8
_020F3A30:
	ldrb r7, [r2]
	and r0, r7, #0x1f
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _020F4268
_020F3A44: ; jump table
	b _020F4268 ; case 0
	b _020F3A94 ; case 1
	b _020F3AB4 ; case 2
	b _020F3B00 ; case 3
	b _020F3B80 ; case 4
	b _020F3BE0 ; case 5
	b _020F3C64 ; case 6
	b _020F3CD4 ; case 7
	b _020F3D44 ; case 8
	b _020F3DEC ; case 9
	b _020F3EA0 ; case 10
	b _020F3EFC ; case 11
	b _020F3F8C ; case 12
	b _020F3FB8 ; case 13
	b _020F4268 ; case 14
	b _020F4004 ; case 15
	b _020F4040 ; case 16
	b _020F40E4 ; case 17
	b _020F4190 ; case 18
	b _020F4254 ; case 19
_020F3A94:
	add r1, sp, #0xa0
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	ldr r1, [r8, #8]
	ldr r0, [sp, #0xa0]
	add r0, r1, r0
	str r0, [r8, #8]
	b _020F426C
_020F3AB4:
	add r1, sp, #0x9c
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	mov r4, r0
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	orr r0, r1, r0, lsl #8
	orr r0, r0, r2, lsl #16
	ldr r5, [sb, #0x18]
	ldr r1, [sp, #0x9c]
	orr r2, r0, r3, lsl #24
	add r0, r5, r1
	mvn r1, #0
	blx r2
	add r0, r4, #4
	str r0, [r8, #8]
	b _020F426C
_020F3B00:
	add r1, sp, #0x94
	add r0, r2, #1
	and r4, r7, #0x40
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x98
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r2, r1, r5, lsl #24
	add r4, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x94]
	ldreqb r0, [r1, r0]
	beq _020F3B5C
	ldr r0, [sp, #0x94]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
	and r0, r0, #0xff
_020F3B5C:
	cmp r0, #0
	beq _020F3B78
	ldr r3, [sb, #0x18]
	ldr r0, [sp, #0x98]
	mvn r1, #0
	add r0, r3, r0
	blx r2
_020F3B78:
	str r4, [r8, #8]
	b _020F426C
_020F3B80:
	add r1, sp, #0x90
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r2, r1, r5, lsl #24
	add r4, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x90]
	ldreq r0, [r1, r0]
	beq _020F3BD0
	ldr r0, [sp, #0x90]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
_020F3BD0:
	mvn r1, #0
	blx r2
	str r4, [r8, #8]
	b _020F426C
_020F3BE0:
	add r1, sp, #0x84
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x88
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x8c
	bl _Z22__DecodeUnsignedNumberPcPm
	ldr r3, [sb, #0x18]
	ldr r2, [sp, #0x84]
	ldr r6, [sp, #0x88]
	ldrb r5, [r0]
	ldrb r4, [r0, #1]
	ldr r1, [sp, #0x8c]
	add r2, r3, r2
	ldrb sl, [r0, #2]
	orr r3, r5, r4, lsl #8
	mla r4, r6, r1, r2
	ldrb r2, [r0, #3]
	orr r1, r3, sl, lsl #16
	cmp r6, #0
	orr r5, r1, r2, lsl #24
	add fp, r0, #4
	beq _020F3C5C
	mvn sl, #0
_020F3C40:
	ldr r0, [sp, #0x8c]
	mov r1, sl
	sub r4, r4, r0
	mov r0, r4
	blx r5
	subs r6, r6, #1
	bne _020F3C40
_020F3C5C:
	str fp, [r8, #8]
	b _020F426C
_020F3C64:
	add r1, sp, #0x7c
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x80
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r2, r1, r5, lsl #24
	add r4, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x7c]
	ldreq r3, [r1, r0]
	beq _020F3CBC
	ldr r0, [sp, #0x7c]
	add r0, sb, r0, lsl #2
	ldr r3, [r0, #0x1c]
_020F3CBC:
	ldr r0, [sp, #0x80]
	mov r1, #0
	add r0, r3, r0
	blx r2
	str r4, [r8, #8]
	b _020F426C
_020F3CD4:
	add r1, sp, #0x74
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x78
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r2, r1, r5, lsl #24
	add r4, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x74]
	ldreq r3, [r1, r0]
	beq _020F3D2C
	ldr r0, [sp, #0x74]
	add r0, sb, r0, lsl #2
	ldr r3, [r0, #0x1c]
_020F3D2C:
	ldr r0, [sp, #0x78]
	mvn r1, #0
	add r0, r3, r0
	blx r2
	str r4, [r8, #8]
	b _020F426C
_020F3D44:
	add r1, sp, #0x68
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x6c
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x70
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	orr r2, r1, r5, lsl #24
	tst r7, #0x40
	add r5, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x68]
	ldreqsh r0, [r1, r0]
	beq _020F3DAC
	ldr r0, [sp, #0x68]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_020F3DAC:
	cmp r0, #0
	beq _020F3DE4
	cmp r4, #0
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x6c]
	ldreq r3, [r1, r0]
	beq _020F3DD4
	ldr r0, [sp, #0x6c]
	add r0, sb, r0, lsl #2
	ldr r3, [r0, #0x1c]
_020F3DD4:
	ldr r0, [sp, #0x70]
	mvn r1, #0
	add r0, r3, r0
	blx r2
_020F3DE4:
	str r5, [r8, #8]
	b _020F426C
_020F3DEC:
	add r1, sp, #0x58
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x5c
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x60
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x64
	bl _Z22__DecodeUnsignedNumberPcPm
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r5, r1, r5, lsl #24
	add fp, r0, #4
	beq _020F3E50
	ldr r1, [sp, #0x58]
	ldr r0, [sp, #0x5c]
	add r1, sb, r1, lsl #2
	ldr r1, [r1, #0x1c]
	b _020F3E60
_020F3E50:
	ldr r2, [sb, #0x18]
	ldr r1, [sp, #0x58]
	ldr r0, [sp, #0x5c]
	ldr r1, [r2, r1]
_020F3E60:
	add r4, r1, r0
	ldr r6, [sp, #0x60]
	ldr r0, [sp, #0x64]
	cmp r6, #0
	mla r4, r6, r0, r4
	beq _020F3E98
	mvn sl, #0
_020F3E7C:
	ldr r0, [sp, #0x64]
	mov r1, sl
	sub r4, r4, r0
	mov r0, r4
	blx r5
	subs r6, r6, #1
	bne _020F3E7C
_020F3E98:
	str fp, [r8, #8]
	b _020F426C
_020F3EA0:
	add r1, sp, #0x54
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r2, r1, r5, lsl #24
	add r4, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x54]
	ldreq r0, [r1, r0]
	beq _020F3EF0
	ldr r0, [sp, #0x54]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
_020F3EF0:
	blx r2
	str r4, [r8, #8]
	b _020F426C
_020F3EFC:
	add r1, sp, #0x4c
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x50
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	tst r7, #0x40
	orr r1, r1, r5, lsl #24
	add r5, r0, #4
	ldreq r2, [sb, #0x18]
	ldreq r0, [sp, #0x4c]
	ldreqb r0, [r2, r0]
	beq _020F3F58
	ldr r0, [sp, #0x4c]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
	and r0, r0, #0xff
_020F3F58:
	cmp r0, #0
	beq _020F3F84
	cmp r4, #0
	ldreq r2, [sb, #0x18]
	ldreq r0, [sp, #0x50]
	ldreq r0, [r2, r0]
	beq _020F3F80
	ldr r0, [sp, #0x50]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
_020F3F80:
	blx r1
_020F3F84:
	str r5, [r8, #8]
	b _020F426C
_020F3F8C:
	ldr r0, [sp]
	cmp r0, r2
	addeq sp, sp, #0xa4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r1, sp, #0x44
	add r0, r2, #5
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x48
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [r8, #8]
	b _020F426C
_020F3FB8:
	add r1, sp, #0x40
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	ldr r2, [sb, #0x18]
	ldr r1, [sp, #0x40]
	mov r4, r0
	add r0, r2, r1
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _020F3FFC
	ldr r0, [r0]
	ldr r1, [sb, #4]
	cmp r1, r0
	streq r2, [sb, #8]
	beq _020F3FFC
	mvn r1, #0
	blx r2
_020F3FFC:
	str r4, [r8, #8]
	b _020F426C
_020F4004:
	ldr r0, [sp]
	cmp r0, r2
	addeq sp, sp, #0xa4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r1, sp, #0x34
	add r0, r2, #1
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x38
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x3c
	bl _Z20__DecodeSignedNumberPcPl
	ldr r1, [sp, #0x34]
	add r0, r0, r1, lsl #2
	str r0, [r8, #8]
	b _020F426C
_020F4040:
	add r1, sp, #0x24
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x28
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	orr r2, r1, r5, lsl #24
	add r1, sp, #0x2c
	add r0, r0, #4
	str r2, [sp, #0x30]
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r2, r1, r5, lsl #24
	add r4, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x24]
	ldreq r5, [r1, r0]
	beq _020F40C4
	ldr r0, [sp, #0x24]
	add r0, sb, r0, lsl #2
	ldr r5, [r0, #0x1c]
_020F40C4:
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x30]
	ldr r1, [sp, #0x2c]
	add r0, r5, r0
	add r1, r3, r1
	blx r2
	str r4, [r8, #8]
	b _020F426C
_020F40E4:
	add r1, sp, #0x14
	add r0, r2, #1
	and r5, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x1c
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0], #1
	add r1, sp, #0x18
	and r4, r2, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r6, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r5, #0
	orr r2, r1, r6, lsl #24
	add r5, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x14]
	ldreq r0, [r1, r0]
	beq _020F4154
	ldr r0, [sp, #0x14]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
_020F4154:
	cmp r4, #0
	ldreq r3, [sb, #0x18]
	ldreq r1, [sp, #0x18]
	ldreq r4, [r3, r1]
	beq _020F4174
	ldr r1, [sp, #0x18]
	add r1, sb, r1, lsl #2
	ldr r4, [r1, #0x1c]
_020F4174:
	ldr r3, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	add r0, r0, r3
	add r1, r4, r1
	blx r2
	str r5, [r8, #8]
	b _020F426C
_020F4190:
	add r1, sp, #8
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0], #1
	add r1, sp, #0xc
	and r6, r2, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x10
	bl _Z22__DecodeUnsignedNumberPcPm
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r5, r1, r5, lsl #24
	add fp, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #8]
	ldreq r4, [r1, r0]
	beq _020F41F8
	ldr r0, [sp, #8]
	add r0, sb, r0, lsl #2
	ldr r4, [r0, #0x1c]
_020F41F8:
	cmp r6, #0
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0xc]
	ldreq r0, [r1, r0]
	beq _020F4218
	ldr r0, [sp, #0xc]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
_020F4218:
	ldr r1, [sp, #0x10]
	add r4, r4, r0
	bl _u32_div_f
	movs r6, r0
	beq _020F424C
	mvn sl, #0
_020F4230:
	ldr r0, [sp, #0x10]
	mov r1, sl
	sub r4, r4, r0
	mov r0, r4
	blx r5
	subs r6, r6, #1
	bne _020F4230
_020F424C:
	str fp, [r8, #8]
	b _020F426C
_020F4254:
	add r1, sp, #4
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [r8, #8]
	b _020F426C
_020F4268:
	bl _ZSt9terminatev
_020F426C:
	tst r7, #0x80
	movne r0, #0
	strne r0, [r8, #8]
	b _020F39E8
_020F427C:
	add sp, sp, #0xa4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end _Z11UnwindStackP12ThrowContextP13ExceptionInfoPc

	arm_func_start _Z23FindMostRecentExceptionP12ThrowContextP13ExceptionInfo
_Z23FindMostRecentExceptionP12ThrowContextP13ExceptionInfo: ; 0x020F4284
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x8c
	ldr r2, [r1]
	mov r4, r0
	str r2, [sp, #4]
	ldr r0, [r1, #4]
	add ip, sp, #0x38
	str r0, [sp, #8]
	ldr r0, [r1, #8]
	add lr, r4, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r1, #0xc]
	mov r5, #5
	str r0, [sp, #0x10]
	ldr r0, [r1, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [r1, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r4]
	str r0, [sp, #0x1c]
	ldr r0, [r4, #4]
	str r0, [sp, #0x20]
	ldr r0, [r4, #8]
	str r0, [sp, #0x24]
	ldr r0, [r4, #0xc]
	str r0, [sp, #0x28]
	ldr r0, [r4, #0x10]
	str r0, [sp, #0x2c]
	ldr r0, [r4, #0x14]
	str r0, [sp, #0x30]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0x34]
_020F4304:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _020F4304
	ldr r1, [lr]
	add r0, sp, #4
	str r1, [ip]
	bl _Z13CurrentActionPK14ActionIterator
	add r5, sp, #4
_020F4328:
	cmp r0, #0x12
	addls pc, pc, r0, lsl #2
	b _020F4380
_020F4334: ; jump table
	b _020F438C ; case 0
	b _020F4380 ; case 1
	b _020F438C ; case 2
	b _020F438C ; case 3
	b _020F438C ; case 4
	b _020F438C ; case 5
	b _020F438C ; case 6
	b _020F438C ; case 7
	b _020F438C ; case 8
	b _020F438C ; case 9
	b _020F438C ; case 10
	b _020F438C ; case 11
	b _020F438C ; case 12
	b _020F4398 ; case 13
	b _020F4380 ; case 14
	b _020F438C ; case 15
	b _020F438C ; case 16
	b _020F438C ; case 17
	b _020F438C ; case 18
_020F4380:
	add sp, sp, #0x8c
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_020F438C:
	mov r0, r5
	bl _Z10NextActionP14ActionIterator
	b _020F4328
_020F4398:
	ldr r0, [sp, #0xc]
	add r1, sp, #0
	add r0, r0, #1
	bl _Z20__DecodeSignedNumberPcPl
	ldr ip, [sp, #0x34]
	ldr r3, [sp]
	mov r1, #0
	add r0, ip, r3
	ldr r2, [r0, #4]
	str r2, [r4]
	ldr r2, [ip, r3]
	str r2, [r4, #4]
	str r1, [r4, #8]
	str r0, [r4, #0xc]
	add sp, sp, #0x8c
	ldmia sp!, {r4, r5, pc}
	arm_func_end _Z23FindMostRecentExceptionP12ThrowContextP13ExceptionInfo

	arm_func_start _Z17IsInSpecificationPcP16ex_specification
_Z17IsInSpecificationPcP16ex_specification: ; 0x020F43D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r6, r1
	ldr r1, [r6]
	mov r7, r0
	cmp r1, #0
	ldr r4, [r6, #0xc]
	mov r5, #0
	bls _020F4450
	add r8, sp, #0
_020F4400:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	orr r0, r1, r0, lsl #8
	orr r0, r0, r2, lsl #16
	orr r1, r0, r3, lsl #24
	mov r0, r7
	mov r2, r8
	str r1, [sp, #4]
	bl __throw_catch_compare
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r6]
	add r5, r5, #1
	cmp r5, r0
	add r4, r4, #4
	blo _020F4400
_020F4450:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end _Z17IsInSpecificationPcP16ex_specification

	arm_func_start __unexpected
__unexpected: ; 0x020F445C
	stmdb sp!, {r4, fp, lr}
	sub sp, sp, #0x2c
	mov fp, sp
	str sp, [fp, #0x18]
	ldr r4, [r0, #0x14]
	bl _ZSt10unexpectedv
	b _020F44E8
_020F4478:
	add r1, fp, #0x1c
	add r0, r4, #1
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, fp, #0x20
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, fp, #0x24
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [fp, #0x28]
	ldr r0, [fp, #8]
	add r1, fp, #0x1c
	bl _Z17IsInSpecificationPcP16ex_specification
	cmp r0, #0
	beq _020F44B0
	bl __rethrow
_020F44B0:
	ldr r0, _020F44F4 ; =_021116F4
	add r1, fp, #0x1c
	bl _Z17IsInSpecificationPcP16ex_specification
	cmp r0, #0
	beq _020F44DC
	ldr r3, _020F44F8 ; =_021116E8
	ldr r0, _020F44FC ; =_0211170C
	ldr r2, _020F4500 ; =_ZNSt13bad_exceptionD1Ev
	add r1, fp, #0
	str r3, [fp]
	bl __throw
_020F44DC:
	add r0, fp, #4
	bl __end__catch
	ldr sp, [fp, #0x18]
_020F44E8:
	bl _ZSt9terminatev
	add sp, fp, #0x2c
	ldmia sp!, {r4, fp, pc}
	.balign 4, 0
_020F44F4: .word _021116F4
_020F44F8: .word _021116E8
_020F44FC: .word _0211170C
_020F4500: .word _ZNSt13bad_exceptionD1Ev
	arm_func_end __unexpected

	arm_func_start _ZNSt13bad_exceptionD1Ev
_ZNSt13bad_exceptionD1Ev: ; 0x020F4504
	bx lr
	arm_func_end _ZNSt13bad_exceptionD1Ev

	arm_func_start _Z16HandleUnexpectedP12ThrowContextP13ExceptionInfoP16ex_specificationPc
_Z16HandleUnexpectedP12ThrowContextP13ExceptionInfoP16ex_specificationPc: ; 0x020F4508
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r3
	mov r5, r2
	mov r2, r4
	mov r7, r0
	mov r6, r1
	bl _Z11UnwindStackP12ThrowContextP13ExceptionInfoPc
	ldr r2, [r7, #0x18]
	ldr r1, [r5, #8]
	ldr r0, [r7, #4]
	add r3, r2, r1
	str r0, [r2, r1]
	ldr r1, [r7]
	mov r0, r7
	str r1, [r3, #4]
	ldr r2, [r7, #8]
	mov r1, r6
	str r2, [r3, #8]
	str r4, [r3, #0x14]
	ldr r3, [r6]
	ldr r2, [r5, #4]
	add r2, r3, r2
	bl _Z17__TransferControlP12ThrowContextP13ExceptionInfoPc
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end _Z16HandleUnexpectedP12ThrowContextP13ExceptionInfoP16ex_specificationPc

	arm_func_start _Z20FindExceptionHandlerP12ThrowContextP13ExceptionInfoPl
_Z20FindExceptionHandlerP12ThrowContextP13ExceptionInfoPl: ; 0x020F4568
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa4
	mov r5, r1
	ldr r1, [r5]
	mov r6, r0
	str r1, [sp, #0x1c]
	ldr r0, [r5, #4]
	add r8, sp, #0x50
	str r0, [sp, #0x20]
	ldr r0, [r5, #8]
	mov r4, r2
	str r0, [sp, #0x24]
	ldr r0, [r5, #0xc]
	add sb, r6, #0x1c
	str r0, [sp, #0x28]
	ldr r0, [r5, #0x10]
	mov r7, #5
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x14]
	str r0, [sp, #0x30]
	ldr r0, [r6]
	str r0, [sp, #0x34]
	ldr r0, [r6, #4]
	str r0, [sp, #0x38]
	ldr r0, [r6, #8]
	str r0, [sp, #0x3c]
	ldr r0, [r6, #0xc]
	str r0, [sp, #0x40]
	ldr r0, [r6, #0x10]
	str r0, [sp, #0x44]
	ldr r0, [r6, #0x14]
	str r0, [sp, #0x48]
	ldr r0, [r6, #0x18]
	str r0, [sp, #0x4c]
_020F45F0:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _020F45F0
	ldr r1, [sb]
	add r0, sp, #0x1c
	str r1, [r8]
	bl _Z13CurrentActionPK14ActionIterator
	add r7, sp, #0
	add sl, sp, #4
	add fp, sp, #8
	add sb, sp, #0x14
	add r8, sp, #0x18
_020F4624:
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _020F4724
_020F4630: ; jump table
	b _020F472C ; case 0
	b _020F4724 ; case 1
	b _020F472C ; case 2
	b _020F472C ; case 3
	b _020F472C ; case 4
	b _020F472C ; case 5
	b _020F472C ; case 6
	b _020F472C ; case 7
	b _020F472C ; case 8
	b _020F472C ; case 9
	b _020F472C ; case 10
	b _020F472C ; case 11
	b _020F4680 ; case 12
	b _020F472C ; case 13
	b _020F4724 ; case 14
	b _020F46D4 ; case 15
	b _020F472C ; case 16
	b _020F472C ; case 17
	b _020F472C ; case 18
	b _020F472C ; case 19
_020F4680:
	ldr lr, [sp, #0x24]
	mov r1, sb
	ldrb r2, [lr, #1]
	ldrb r0, [lr, #2]
	ldrb r3, [lr, #3]
	ldrb ip, [lr, #4]
	orr r0, r2, r0, lsl #8
	orr r0, r0, r3, lsl #16
	orr r2, r0, ip, lsl #24
	add r0, lr, #5
	str r2, [sp, #0x10]
	bl _Z22__DecodeUnsignedNumberPcPm
	mov r1, r8
	bl _Z20__DecodeSignedNumberPcPl
	ldr r0, [r6]
	ldr r1, [sp, #0x10]
	mov r2, r4
	bl __throw_catch_compare
	cmp r0, #0
	beq _020F472C
	b _020F4738
_020F46D4:
	ldr r0, [sp, #0x24]
	mov r1, r7
	add r0, r0, #1
	bl _Z22__DecodeUnsignedNumberPcPm
	mov r1, sl
	bl _Z22__DecodeUnsignedNumberPcPm
	mov r1, fp
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [sp, #0xc]
	ldr r0, [r6]
	mov r1, r7
	bl _Z17IsInSpecificationPcP16ex_specification
	cmp r0, #0
	bne _020F472C
	ldr r3, [sp, #0x24]
	mov r0, r6
	mov r1, r5
	mov r2, r7
	bl _Z16HandleUnexpectedP12ThrowContextP13ExceptionInfoP16ex_specificationPc
	b _020F472C
_020F4724:
	bl _ZSt9terminatev
	b _020F4738
_020F472C:
	add r0, sp, #0x1c
	bl _Z10NextActionP14ActionIterator
	b _020F4624
_020F4738:
	ldr r0, [sp, #0x24]
	add sp, sp, #0xa4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end _Z20FindExceptionHandlerP12ThrowContextP13ExceptionInfoPl

	arm_func_start _Z14SetupCatchInfoP12ThrowContextll
_Z14SetupCatchInfoP12ThrowContextll: ; 0x020F4744
	stmdb sp!, {r3, lr}
	ldr lr, [r0, #0x18]
	ldr ip, [r0, #4]
	add r3, lr, r1
	str ip, [lr, r1]
	ldr r1, [r0]
	str r1, [r3, #4]
	ldr r1, [r0, #8]
	str r1, [r3, #8]
	ldr r1, [r0]
	ldrb r1, [r1]
	cmp r1, #0x2a
	ldrne r0, [r0, #4]
	addne r0, r0, r2
	strne r0, [r3, #0xc]
	ldmneia sp!, {r3, pc}
	add r1, r3, #0x10
	str r1, [r3, #0xc]
	ldr r0, [r0, #4]
	ldr r0, [r0]
	add r0, r0, r2
	str r0, [r3, #0x10]
	ldmia sp!, {r3, pc}
	arm_func_end _Z14SetupCatchInfoP12ThrowContextll

	arm_func_start _Z14__ThrowHandlerP12ThrowContext
_Z14__ThrowHandlerP12ThrowContext:
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x28
	mov r5, r0
	ldr r0, [r5, #0x10]
	add r1, sp, #0x10
	bl _Z19FindExceptionRecordPcP13ExceptionInfo
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _020F47C8
	bl _ZSt9terminatev
_020F47C8:
	add r1, sp, #0x10
	mov r0, r5
	bl _Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo
	ldr r0, [r5]
	cmp r0, #0
	movne r0, #0
	strne r0, [r5, #0xc]
	bne _020F4804
	add r1, sp, #0x10
	mov r0, r5
	bl _Z23FindMostRecentExceptionP12ThrowContextP13ExceptionInfo
	str r0, [r5, #0xc]
	cmp r0, #0
	bne _020F4804
	bl _ZSt9terminatev
_020F4804:
	add r1, sp, #0x10
	add r2, sp, #0
	mov r0, r5
	bl _Z20FindExceptionHandlerP12ThrowContextP13ExceptionInfoPl
	mov r4, r0
	ldrb r1, [r4, #1]
	ldrb r0, [r4, #2]
	ldrb r2, [r4, #3]
	ldrb r3, [r4, #4]
	orr r0, r1, r0, lsl #8
	orr r0, r0, r2, lsl #16
	orr r2, r0, r3, lsl #24
	add r1, sp, #8
	add r0, r4, #5
	str r2, [sp, #4]
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0xc
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x10
	mov r0, r5
	mov r2, r4
	bl _Z11UnwindStackP12ThrowContextP13ExceptionInfoPc
	ldr r1, [sp, #0xc]
	ldr r2, [sp]
	mov r0, r5
	bl _Z14SetupCatchInfoP12ThrowContextll
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #8]
	mov r0, r5
	add r1, sp, #0x10
	add r2, r3, r2
	bl _Z17__TransferControlP12ThrowContextP13ExceptionInfoPc
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end _Z14__ThrowHandlerP12ThrowContext

	arm_func_start __end__catch
__end__catch: ; 0x020F488C
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	ldrne r2, [r0, #8]
	cmpne r2, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	mvn r1, #0
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end __end__catch

	arm_func_start _ZNSt13bad_exceptionD0Ev
_ZNSt13bad_exceptionD0Ev: ; 0x020F48B4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt13bad_exceptionD0Ev

	arm_func_start _ZNKSt13bad_exception4whatEv
_ZNKSt13bad_exception4whatEv: ; 0x020F48C8
	ldr r0, _020F48D0 ; =_ZZNKSt13bad_exception4whatEvEs
	bx lr
	.align 2, 0
_020F48D0: .word _ZZNKSt13bad_exception4whatEvEs
	arm_func_end _ZNKSt13bad_exception4whatEv

	arm_func_start _ZSt17__throw_bad_allocv
_ZSt17__throw_bad_allocv: ; 0x020F48D4
	stmdb sp!, {r3, lr}
	ldr r0, _020F4904 ; =_02111734
	ldrb r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r3, _020F4908 ; =_ZTVSt9bad_alloc
	ldr r0, _020F490C ; =_02111788
	ldr r2, _020F4910 ; =_ZNSt9bad_allocD1Ev
	add r1, sp, #0
	str r3, [sp]
	bl __throw
	ldmia sp!, {r3, pc}
	.align 2, 0
_020F4904: .word _02111734
_020F4908: .word _ZTVSt9bad_alloc
_020F490C: .word _02111788
_020F4910: .word _ZNSt9bad_allocD1Ev
	arm_func_end _ZSt17__throw_bad_allocv

	arm_func_start _ZNSt9bad_allocD1Ev
_ZNSt9bad_allocD1Ev: ; 0x020F4914
	bx lr
	arm_func_end _ZNSt9bad_allocD1Ev

	arm_func_start _Znwm
_Znwm: ; 0x020F4918
	stmdb sp!, {r3, r4, r5, r6, fp, lr}
	sub sp, sp, #0x18
	mov fp, sp
	movs r6, r0
	ldr r4, _020F4978 ; =_ZSt13__new_handler
	moveq r6, #4
_020F4930:
	mov r0, r6
	bl malloc
	movs r5, r0
	bne _020F4958
	ldr r0, [r4]
	cmp r0, #0
	beq _020F4954
	blx r0
	b _020F4930
_020F4954:
	bl _ZSt17__throw_bad_allocv
_020F4958:
	add sp, fp, #0x18
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, fp, pc}
_020F4964:
	add r0, fp, #0
	bl __unexpected
_020F496C:
	b _020F496C
_020F4970:
	add sp, fp, #0x18
	ldmia sp!, {r3, r4, r5, r6, fp, pc}
	.align 2, 0
_020F4978: .word _ZSt13__new_handler
	arm_func_end _Znwm

	arm_func_start _ZnwmRKSt9nothrow_t
_ZnwmRKSt9nothrow_t: ; 0x020F497C
	stmdb sp!, {fp, lr}
	sub sp, sp, #0x30
	mov fp, sp
	str sp, [fp, #0x2c]
	bl _Znwm
	add sp, fp, #0x30
	ldmia sp!, {fp, pc}
_020F4998:
	add r0, fp, #0x18
	bl __end__catch
	add sp, fp, #0x30
	mov r0, #0
	ldmia sp!, {fp, pc}
_020F49AC:
	add r0, fp, #0
	bl __unexpected
_020F49B4:
	b _020F49B4
_020F49B8: ; 0x020F49B8
	add sp, fp, #0x30
	ldmia sp!, {fp, pc}
	arm_func_end _ZnwmRKSt9nothrow_t

	arm_func_start _ZdlPv
_ZdlPv: ; 0x020F49C0
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl free
	ldmia sp!, {r3, pc}
	arm_func_end _ZdlPv

	arm_func_start _Znam
_Znam: ; 0x020F49D4
	stmdb sp!, {fp, lr}
	sub sp, sp, #0x18
	mov fp, sp
	bl _Znwm
	add sp, fp, #0x18
	ldmia sp!, {fp, pc}
_020F49EC: ; 0x020F49EC
	add r0, fp, #0
	bl __unexpected
_020F49F4:
	b _020F49F4
_020F49F8: ; 0x020F49F8
	add sp, fp, #0x18
	ldmia sp!, {fp, pc}
	arm_func_end _Znam

	arm_func_start _ZnamRKSt9nothrow_t
_ZnamRKSt9nothrow_t: ; 0x020F4A00
	stmdb sp!, {fp, lr}
	sub sp, sp, #0x18
	mov fp, sp
	bl _ZnwmRKSt9nothrow_t
	add sp, fp, #0x18
	ldmia sp!, {fp, pc}
_020F4A18: ; 0x020F4A18
	add r0, fp, #0
	bl __unexpected
_020F4A20:
	b _020F4A20
_020F4A24: ; 0x020F4A24
	add sp, fp, #0x18
	ldmia sp!, {fp, pc}
	arm_func_end _ZnamRKSt9nothrow_t

	arm_func_start _ZdaPv
_ZdaPv: ; 0x020F4A2C
	ldr ip, _020F4A34 ; =_ZdlPv
	bx ip
	.align 2, 0
_020F4A34: .word _ZdlPv
	arm_func_end _ZdaPv

	arm_func_start _ZNSt9bad_allocD0Ev
_ZNSt9bad_allocD0Ev: ; 0x020F4A38
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt9bad_allocD0Ev

	arm_func_start _ZNKSt9bad_alloc4whatEv
_ZNKSt9bad_alloc4whatEv: ; 0x020F4A4C
	ldr r0, _020F4A54 ; =_02111738
	bx lr
	.align 2, 0
_020F4A54: .word _02111738
	arm_func_end _ZNKSt9bad_alloc4whatEv

	arm_func_start __call_static_initializers
__call_static_initializers: ; 0x020F4A58
	stmdb sp!, {r4, lr}
	ldr r4, _020F4A80 ; =__sinit__
	b _020F4A6C
_020F4A64:
	blx r0
	add r4, r4, #4
_020F4A6C:
	cmp r4, #0
	ldrne r0, [r4]
	cmpne r0, #0
	bne _020F4A64
	ldmia sp!, {r4, pc}
	.align 2, 0
_020F4A80: .word __sinit__
	arm_func_end __call_static_initializers

	arm_func_start __destroy_global_chain
__destroy_global_chain: ; 0x020F4A84
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020F4AC4 ; =__global_destructor_chain
	ldr r2, [r4]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mvn r5, #0
_020F4A9C:
	ldr r0, [r2]
	mov r1, r5
	str r0, [r4]
	ldr r0, [r2, #8]
	ldr r2, [r2, #4]
	blx r2
	ldr r2, [r4]
	cmp r2, #0
	bne _020F4A9C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020F4AC4: .word __global_destructor_chain
	arm_func_end __destroy_global_chain

	arm_func_start _ZNSt9type_infoD2Ev
_ZNSt9type_infoD2Ev: ; 0x020F4AC8
	bx lr
	arm_func_end _ZNSt9type_infoD2Ev

	arm_func_start _ZNKSt9type_infoeqERKS_
_ZNKSt9type_infoeqERKS_: ; 0x020F4ACC
	stmdb sp!, {r3, lr}
	cmp r0, r1
	beq _020F4AEC
	ldr r0, [r0, #4]
	ldr r1, [r1, #4]
	bl strcmp
	cmp r0, #0
	bne _020F4AF4
_020F4AEC:
	mov r0, #1
	ldmia sp!, {r3, pc}
_020F4AF4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end _ZNKSt9type_infoeqERKS_

	arm_func_start _ZN10__cxxabiv117__class_type_infoD1Ev
_ZN10__cxxabiv117__class_type_infoD1Ev: ; 0x020F4AFC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZNSt9type_infoD2Ev
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZN10__cxxabiv117__class_type_infoD1Ev

	arm_func_start _ZN10__cxxabiv117__class_type_infoD0Ev
_ZN10__cxxabiv117__class_type_infoD0Ev: ; 0x020F4B10
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZNSt9type_infoD2Ev
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZN10__cxxabiv117__class_type_infoD0Ev

	arm_func_start _ZN10__cxxabiv117__class_type_infoD2Ev
_ZN10__cxxabiv117__class_type_infoD2Ev: ; 0x020F4B2C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZNSt9type_infoD2Ev
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZN10__cxxabiv117__class_type_infoD2Ev

	arm_func_start _ZN10__cxxabiv120__si_class_type_infoD1Ev
_ZN10__cxxabiv120__si_class_type_infoD1Ev: ; 0x020F4B40
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZN10__cxxabiv117__class_type_infoD2Ev
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZN10__cxxabiv120__si_class_type_infoD1Ev

	arm_func_start _ZN10__cxxabiv120__si_class_type_infoD0Ev
_ZN10__cxxabiv120__si_class_type_infoD0Ev: ; 0x020F4B54
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZN10__cxxabiv117__class_type_infoD2Ev
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZN10__cxxabiv120__si_class_type_infoD0Ev

	arm_func_start _ZSt9dthandlerv
_ZSt9dthandlerv: ; 0x020F4B70
	ldr ip, _020F4B78 ; =abort
	bx ip
	.align 2, 0
_020F4B78: .word abort
	arm_func_end _ZSt9dthandlerv

	arm_func_start _ZSt9duhandlerv
_ZSt9duhandlerv: ; 0x020F4B7C
	ldr ip, _020F4B84 ; =_ZSt9terminatev
	bx ip
	.align 2, 0
_020F4B84: .word _ZSt9terminatev
	arm_func_end _ZSt9duhandlerv

	arm_func_start _ZSt9terminatev
_ZSt9terminatev: ; 0x020F4B88
	stmdb sp!, {r3, lr}
	ldr r0, _020F4B9C ; =_02111848
	ldr r0, [r0]
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020F4B9C: .word _02111848
	arm_func_end _ZSt9terminatev

	arm_func_start _ZSt10unexpectedv
_ZSt10unexpectedv: ; 0x020F4BA0
	stmdb sp!, {r3, lr}
	ldr r0, _020F4BB4 ; =_02111848
	ldr r0, [r0, #4]
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020F4BB4: .word _02111848
	arm_func_end _ZSt10unexpectedv

	arm_func_start __throw_catch_compare
__throw_catch_compare: ; 0x020F4BB8
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r3, r1
	cmp r1, #0
	str ip, [r2]
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrb ip, [r1]
	cmp ip, #0x50
	bne _020F4C1C
	ldrb ip, [r3, #1]!
	cmp ip, #0x56
	addeq r3, r3, #1
	ldrb ip, [r3]
	cmp ip, #0x4b
	addeq r3, r3, #1
	ldrb r3, [r3]
	cmp r3, #0x76
	bne _020F4C18
	ldrb r3, [r0]
	cmp r3, #0x50
	cmpne r3, #0x2a
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_020F4C18:
	mov r3, r1
_020F4C1C:
	ldrb ip, [r0]
	cmp ip, #0x21
	cmpne ip, #0x2a
	bne _020F4D1C
	ldrb lr, [r0], #1
	ldrb ip, [r3], #1
	cmp lr, ip
	movne r0, #0
	ldmneia sp!, {r3, pc}
_020F4C40:
	ldrb lr, [r0]
	ldrb ip, [r3], #1
	cmp lr, ip
	bne _020F4C94
	cmp lr, #0x21
	add r0, r0, #1
	bne _020F4C40
	ldrb r1, [r0]
	mov lr, #0
	cmp r1, #0x21
	beq _020F4C88
	mov r1, #0xa
_020F4C70:
	ldrb ip, [r0]
	ldrb r3, [r0, #1]!
	mla ip, lr, r1, ip
	cmp r3, #0x21
	sub lr, ip, #0x30
	bne _020F4C70
_020F4C88:
	str lr, [r2]
	mov r0, #1
	ldmia sp!, {r3, pc}
_020F4C94:
	ldrb r3, [r0], #1
	cmp r3, #0x21
	bne _020F4C94
_020F4CA0:
	ldrb r3, [r0], #1
	cmp r3, #0x21
	bne _020F4CA0
	ldrb r3, [r0]
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r3, r1, #1
	b _020F4C40
_020F4CC4:
	ldrb r1, [r3, #1]!
	add r0, r0, #1
	cmp r1, #0x4b
	bne _020F4CE4
	ldrb r1, [r0]
	add r3, r3, #1
	cmp r1, #0x4b
	addeq r0, r0, #1
_020F4CE4:
	ldrb r2, [r0]
	cmp r2, #0x4b
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r1, [r3]
	cmp r1, #0x56
	bne _020F4D0C
	cmp r2, #0x56
	addeq r0, r0, #1
	add r3, r3, #1
_020F4D0C:
	ldrb r1, [r0]
	cmp r1, #0x56
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_020F4D1C:
	ldrb r2, [r0]
	cmp r2, #0x50
	cmpne r2, #0x52
	bne _020F4D38
	ldrb r1, [r3]
	cmp r2, r1
	beq _020F4CC4
_020F4D38:
	ldrb r1, [r3]
	cmp r2, r1
	bne _020F4D60
_020F4D44:
	cmp r2, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r0, #1]!
	ldrb r1, [r3, #1]!
	cmp r2, r1
	beq _020F4D44
_020F4D60:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end __throw_catch_compare

	arm_func_start _Z15__PopStackFrameP12ThrowContextP13ExceptionInfo
_Z15__PopStackFrameP12ThrowContextP13ExceptionInfo: ; 0x020F4D68
	stmdb sp!, {r4, lr}
	ldrb r1, [r0, #0x6a]
	ldr ip, [r0, #0x60]
	mov r4, #0xf
	cmp r1, #0
	ldr r1, [r0, #0x18]
	movne r2, #0x10
	moveq r2, #0
	add r1, r1, ip
	sub lr, r1, r2
	mov r3, #1
_020F4D94:
	ldrh r1, [r0, #0x68]
	tst r1, r3, lsl r4
	ldrne r2, [lr, #-4]!
	addne r1, r0, r4, lsl #2
	strne r2, [r1, #0x1c]
	subs r4, r4, #1
	bpl _020F4D94
	ldr r1, [r0, #0x18]
	add r1, r1, ip
	str r1, [r0, #0x14]
	ldr r0, [r0, #0x54]
	ldmia sp!, {r4, pc}
	arm_func_end _Z15__PopStackFrameP12ThrowContextP13ExceptionInfo

	arm_func_start _Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo
_Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo: ; 0x020F4DC4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, [r1, #4]
	mov r6, r0
	ldrb r0, [r1]
	ands r4, r0, #0x40
	movne r2, #1
	moveq r2, #0
	strb r2, [r6, #0x6b]
	tst r0, #0x20
	movne r2, #1
	moveq r2, #0
	ands r5, r0, #0x80
	movne r0, #1
	strb r2, [r6, #0x6a]
	moveq r0, #0
	strb r0, [r6, #0x6c]
	ldrb r2, [r1, #1]
	add r0, r1, #2
	add r1, r6, #0x60
	mov r2, r2, lsl #4
	strh r2, [r6, #0x68]
	ldrh r2, [r6, #0x68]
	orr r2, r2, #0x4000
	strh r2, [r6, #0x68]
	bl _Z22__DecodeUnsignedNumberPcPm
	cmp r4, #0
	beq _020F4E38
	add r1, r6, #0x64
	bl _Z22__DecodeUnsignedNumberPcPm
_020F4E38:
	cmp r4, #0
	beq _020F4E58
	cmp r5, #0
	ldrne r0, [r6, #0x38]
	strne r0, [r6, #0x18]
	ldreq r0, [r6, #0x48]
	streq r0, [r6, #0x18]
	ldmia sp!, {r4, r5, r6, pc}
_020F4E58:
	ldr r0, [r6, #0x14]
	str r0, [r6, #0x18]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end _Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo

	arm_func_start _Z20__FindExceptionTableP13ExceptionInfoPc
_Z20__FindExceptionTableP13ExceptionInfoPc: ; 0x020F4E64
	ldr r2, _020F4E7C ; =__exception_table_start__
	ldr r1, _020F4E80 ; =__exception_table_end__
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	mov r0, #1
	bx lr
	.align 2, 0
_020F4E7C: .word __exception_table_start__
_020F4E80: .word __exception_table_end__
	arm_func_end _Z20__FindExceptionTableP13ExceptionInfoPc

	arm_func_start _Z16__SkipUnwindInfoPc
_Z16__SkipUnwindInfoPc: ; 0x020F4E84
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldrb r4, [r0], #2
	add r1, sp, #0
	bl _Z22__DecodeUnsignedNumberPcPm
	tst r4, #0x40
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	add r1, sp, #0
	bl _Z22__DecodeUnsignedNumberPcPm
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end _Z16__SkipUnwindInfoPc

	arm_func_start _Z17__TransferControlP12ThrowContextP13ExceptionInfoPc
_Z17__TransferControlP12ThrowContextP13ExceptionInfoPc: ; 0x020F4EB4
	ldr r4, [r0, #0x2c]
	ldr r5, [r0, #0x30]
	ldr r6, [r0, #0x34]
	ldr r7, [r0, #0x38]
	ldr r8, [r0, #0x3c]
	ldr sb, [r0, #0x40]
	ldr sl, [r0, #0x44]
	ldr fp, [r0, #0x48]
	ldr sp, [r0, #0x5c]
	ldr ip, [r0, #0x64]
	sub sp, sp, ip
	bx r2
	arm_func_end _Z17__TransferControlP12ThrowContextP13ExceptionInfoPc

	arm_func_start __throw
__throw: ; 0x020F4EE4
	mov ip, sp
	sub sp, sp, #0x70
	str r4, [sp, #0x2c]
	str r5, [sp, #0x30]
	str r6, [sp, #0x34]
	str r7, [sp, #0x38]
	str r8, [sp, #0x3c]
	str sb, [sp, #0x40]
	str sl, [sp, #0x44]
	str fp, [sp, #0x48]
	str ip, [sp, #0x14]
	str ip, [sp, #0x5c]
	str lr, [sp, #0x10]
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r0, sp
	b _Z14__ThrowHandlerP12ThrowContext
	arm_func_end __throw

	arm_func_start __rethrow
__rethrow: ; 0x020F4F2C
	mov ip, sp
	sub sp, sp, #0x70
	str r4, [sp, #0x2c]
	str r5, [sp, #0x30]
	str r6, [sp, #0x34]
	str r7, [sp, #0x38]
	str r8, [sp, #0x3c]
	str sb, [sp, #0x40]
	str sl, [sp, #0x44]
	str fp, [sp, #0x48]
	str ip, [sp, #0x14]
	str ip, [sp, #0x5c]
	str lr, [sp, #0x10]
	mov ip, #0
	str ip, [sp]
	str ip, [sp, #4]
	str ip, [sp, #8]
	mov r0, sp
	b _Z14__ThrowHandlerP12ThrowContext
	arm_func_end __rethrow

	arm_func_start _ExitProcess
_ExitProcess: ; 0x020F4F78
	ldr ip, _020F4F80 ; =sys_exit
	bx ip
	.align 2, 0
_020F4F80: .word sys_exit
	arm_func_end _ExitProcess

	.data

	.balign 4, 0
_021116B0:
	.word _021117E4
	.word _021116CC
	.word _02111504
_ZZNKSt13bad_exception4whatEvEs:
	.asciz "bad_exception"
	.balign 4, 0
_021116CC:
	.asciz "St13bad_exception"
	.balign 4, 0
_021116E0:
	.word 0
	.word _021116B0
_021116E8:
	.word _ZNSt13bad_exceptionD1Ev
	.word _ZNSt13bad_exceptionD0Ev
	.word _ZNKSt13bad_exception4whatEv
_021116F4:
	.asciz "!std::bad_exception!!"
	.balign 4, 0
_0211170C:
	.asciz "!std::exception!!std::bad_exception!!"
	.balign 4, 0
_02111734:
	.byte 1
	.balign 4, 0
_02111738:
	.asciz "bad_alloc"
	.balign 4, 0
_02111744:
	.word _021117E4
	.word _02111750
	.word _02111504
_02111750:
	.asciz "St9bad_alloc"
	.balign 4, 0
_02111760:
	.asciz "!std::bad_alloc!"
	.balign 4, 0
_02111774:
	.word 0
	.word _02111744
_ZTVSt9bad_alloc:
	.word _ZNSt9bad_allocD1Ev
	.word _ZNSt9bad_allocD0Ev
	.word _ZNKSt9bad_alloc4whatEv
_02111788:
	.asciz "!std::exception!!std::bad_alloc!!"
	.balign 4, 0
_021117AC:
	.word _021117F4
	.word _021117CC
_021117B4:
	.word _021117E4
	.word _02111820
	.word _021117C0
_021117C0:
	.word _021117E4
	.word _021117FC
	.word _021117AC
_021117CC:
	.asciz "St9type_info"
	.balign 4, 0
_021117DC:
	.word 0
	.word _021117B4
	.public _021117E4
_021117E4:
	.word _ZN10__cxxabiv120__si_class_type_infoD1Ev
	.word _ZN10__cxxabiv120__si_class_type_infoD0Ev
	.word 0
	.word _021117C0
	.public _021117F4
_021117F4:
	.word _ZN10__cxxabiv117__class_type_infoD1Ev
	.word _ZN10__cxxabiv117__class_type_infoD0Ev
_021117FC:
	.asciz "N10__cxxabiv117__class_type_infoE"
	.balign 4, 0
_02111820:
	.asciz "N10__cxxabiv120__si_class_type_infoE"
	.balign 4, 0
_02111848:
	.word _ZSt9dthandlerv
	.word _ZSt9duhandlerv

	exception __read_console, 0x0051, 0x00300F00
	exception __write_console, 0x0035, 0x00200700
	exception _Z19FindExceptionRecordPcP13ExceptionInfo, 0x0109, 0x00503F00
	exception _Z10NextActionP14ActionIterator, 0x0388, _020F4FF8
	exception _Z11UnwindStackP12ThrowContextP13ExceptionInfoPc, 0x08B0, _020F5000
	exception _Z23FindMostRecentExceptionP12ThrowContextP13ExceptionInfo, 0x0154, _020F5010
	exception _Z17IsInSpecificationPcP16ex_specification, 0x0085, 0x00401F00
	exception __unexpected, 0x00A8, _020F5018
	exception _Z16HandleUnexpectedP12ThrowContextP13ExceptionInfoP16ex_specificationPc, 0x0060, _020F502C
	exception _Z20FindExceptionHandlerP12ThrowContextP13ExceptionInfoPl, 0x01DC, _020F5034
	exception _Z14__ThrowHandlerP12ThrowContext, 0x00ED, 0x00700300
	exception __end__catch, 0x0029, 0x00100000
	exception _ZNSt13bad_exceptionD0Ev, 0x0015, 0x00100100
	exception _ZSt17__throw_bad_allocv, 0x0041, 0x00100000
	exception _Znwm, 0x0064, _020F503C
	exception _ZnwmRKSt9nothrow_t, 0x0044, _020F5054
	exception _ZdlPv, 0x0015, 0x00100000
	exception _Znam, 0x002C, _020F5070
	exception _ZnamRKSt9nothrow_t, 0x002C, _020F5088
	exception _ZdaPv, 0x000D, 0x00000000
	exception _ZNSt9bad_allocD0Ev, 0x0015, 0x00100100
	exception __call_static_initializers, 0x002D, 0x00100100
	exception __destroy_global_chain, 0x0045, 0x00200300
	exception _ZNKSt9type_infoeqERKS_, 0x0031, 0x00100000
	exception _ZN10__cxxabiv117__class_type_infoD1Ev, 0x0015, 0x00100100
	exception _ZN10__cxxabiv117__class_type_infoD0Ev, 0x001D, 0x00100100
	exception _ZN10__cxxabiv117__class_type_infoD2Ev, 0x0015, 0x00100100
	exception _ZN10__cxxabiv120__si_class_type_infoD1Ev, 0x0015, 0x00100100
	exception _ZN10__cxxabiv120__si_class_type_infoD0Ev, 0x001D, 0x00100100
	exception _ZSt9dthandlerv, 0x000D, 0x00000000
	exception _ZSt9duhandlerv, 0x000D, 0x00000000
	exception _ZSt9terminatev, 0x0019, 0x00100000
	exception _ZSt10unexpectedv, 0x0019, 0x00100000
	exception _Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo, 0x00A1, 0x00200700
	exception _Z16__SkipUnwindInfoPc, 0x0031, 0x00200100
	exception _ExitProcess, 0x000D, 0x00000000

	.section .exception,4,1,2
	; MSL symbols have exceptions for C++ mode, even when compiling C.

_020F4FF8:
	.byte 0x00, 0x03, 0x01, 0xB0, 0x00, 0x00, 0x00, 0x00
_020F5000:
	.byte 0x00, 0xFF, 0x01, 0xC8, 0x58, 0x1D, 0xB8, 0x1A, 0x01, 0x8C, 0x50, 0x1A, 0x00, 0x8E, 0x00, 0x00
_020F5010:
	.byte 0x00, 0x03, 0x01, 0x98, 0x00, 0x00, 0x00, 0x00
_020F5018:
	.byte 0x40, 0x81, 0x70, 0x00, 0x30, 0x00, 0x16, 0x20
	.byte 0xB0, 0x24, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x00, 0x38, 0x08, 0x8D, 0x08
_020F502C:
	.byte 0x00, 0x0F, 0x30, 0x38, 0x80, 0x0E, 0x00, 0x8E
_020F5034:
	.byte 0x00, 0xFF, 0x01, 0xC8, 0x00, 0x00, 0x00, 0x00
_020F503C:
	.byte 0x40, 0x87, 0x60, 0x00
	.byte 0x40, 0x40, 0x16, 0x28, 0x00, 0x26, 0x00, 0x8F, 0x02, 0x98, 0x00, 0x60, 0x17, 0x11, 0x02, 0x8D
	.byte 0x00, 0x00, 0x00, 0x00
_020F5054:
	.byte 0x40, 0x80, 0x70, 0x00, 0x28, 0x00, 0x1C, 0x20, 0x00, 0x2A, 0x28, 0x00
	.byte 0x32, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x38, 0x30, 0x8F, 0x00, 0x60, 0x00, 0x8D, 0x00, 0x00
_020F5070:
	.byte 0x40, 0x80, 0x40, 0x00, 0x20, 0x00, 0x16, 0x20, 0x00, 0x26, 0x00, 0x8F, 0x02, 0x30, 0x00, 0x60
	.byte 0x17, 0x11, 0x02, 0x8D, 0x00, 0x00, 0x00, 0x00
_020F5088:
	.byte 0x40, 0x80, 0x40, 0x00, 0x20, 0x00, 0x16, 0x20
	.byte 0x00, 0x1E, 0x00, 0x8F, 0x00, 0x30, 0x00, 0x8D, 0x00, 0x00, 0x00, 0x00
