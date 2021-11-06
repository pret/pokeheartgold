	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D6040:
	.space 0x2470

	.text

	arm_func_start sub_020B03F0
sub_020B03F0: ; 0x020B03F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r6, #0
	cmp r2, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r4, #0x8000
	ldr lr, _020B0538 ; =0x00007FFF
	ldr ip, _020B053C ; =0x02108FF4
	ldr r5, _020B0540 ; =0x02109004
	rsb r4, r4, #0
_020B0414:
	ldrb r7, [r3, #2]
	ldrb sl, [r0]
	ldrsh r8, [r3]
	mov sb, r7, lsl #1
	ldrsh fp, [r5, sb]
	and sl, sl, #0xf
	tst sl, #4
	mov sb, fp, asr #3
	addne sb, sb, fp
	tst sl, #2
	addne sb, sb, fp, asr #1
	tst sl, #1
	addne sb, sb, fp, asr #2
	tst sl, #8
	beq _020B0460
	sub r8, r8, sb
	cmp r8, r4
	movlt r8, r4
	b _020B046C
_020B0460:
	add r8, r8, sb
	cmp r8, lr
	movgt r8, lr
_020B046C:
	ldrsb sb, [ip, sl]
	adds r7, r7, sb
	movmi r7, #0
	bmi _020B0484
	cmp r7, #0x58
	movgt r7, #0x58
_020B0484:
	mov r8, r8, lsl #0x10
	mov r8, r8, asr #0x10
	strh r8, [r3]
	strb r7, [r3, #2]
	strh r8, [r1]
	ldrb r7, [r3, #2]
	ldrb sl, [r0]
	ldrsh r8, [r3]
	mov sb, r7, lsl #1
	ldrsh fp, [r5, sb]
	mov sl, sl, asr #4
	and sl, sl, #0xf
	mov sb, fp, asr #3
	tst sl, #4
	addne sb, sb, fp
	tst sl, #2
	addne sb, sb, fp, asr #1
	tst sl, #1
	addne sb, sb, fp, asr #2
	tst sl, #8
	beq _020B04E8
	sub r8, r8, sb
	cmp r8, r4
	movlt r8, r4
	b _020B04F4
_020B04E8:
	add r8, r8, sb
	cmp r8, lr
	movgt r8, lr
_020B04F4:
	ldrsb sb, [ip, sl]
	adds r7, r7, sb
	movmi r7, #0
	bmi _020B050C
	cmp r7, #0x58
	movgt r7, #0x58
_020B050C:
	mov r8, r8, lsl #0x10
	mov r8, r8, asr #0x10
	strh r8, [r3]
	strb r7, [r3, #2]
	add r6, r6, #1
	strh r8, [r1, #2]
	cmp r6, r2
	add r1, r1, #4
	add r0, r0, #1
	blo _020B0414
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B0538: .word 0x00007FFF
_020B053C: .word 0x02108FF4
_020B0540: .word 0x02109004
	arm_func_end sub_020B03F0

	arm_func_start sub_020B0544
sub_020B0544: ; 0x020B0544
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r8, r2, lsr #1
	mov r4, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov ip, #0x8000
	rsb ip, ip, #0
	ldr lr, _020B06C8 ; =0x02109004
	mov r2, ip, lsr #0x11
_020B0564:
	ldrb r6, [r3, #2]
	ldrsh r7, [r3]
	ldrsh r5, [r1]
	mov sb, r6, lsl #1
	ldrsh sb, [lr, sb]
	subs sl, r5, r7
	movmi r5, #8
	rsbmi sl, sl, #0
	movpl r5, #0
	cmp sl, sb
	orrge r5, r5, #4
	subge sl, sl, sb
	cmp sl, sb, asr #1
	orrge r5, r5, #2
	subge sl, sl, sb, asr #1
	cmp sl, sb, asr #2
	orrge r5, r5, #1
	mov sl, sb, asr #3
	tst r5, #4
	addne sl, sl, sb
	tst r5, #2
	addne sl, sl, sb, asr #1
	tst r5, #1
	addne sl, sl, sb, asr #2
	tst r5, #8
	rsbne sl, sl, #0
	add sb, r7, sl
	ldr r7, _020B06CC ; =0x02108FF4
	cmp sb, ip
	movlt sb, ip
	cmp sb, ip, lsr #17
	ldrsb r7, [r7, r5]
	movgt sb, r2
	adds r6, r6, r7
	movmi r6, #0
	bmi _020B05FC
	cmp r6, #0x58
	movgt r6, #0x58
_020B05FC:
	strh sb, [r3]
	strb r6, [r3, #2]
	and r7, r6, #0xff
	ldrsh r6, [r1, #2]
	ldrsh sb, [r3]
	mov sl, r7, lsl #1
	ldrsh sl, [lr, sl]
	subs fp, r6, sb
	movmi r6, #8
	rsbmi fp, fp, #0
	movpl r6, #0
	cmp fp, sl
	orrge r6, r6, #4
	subge fp, fp, sl
	cmp fp, sl, asr #1
	orrge r6, r6, #2
	subge fp, fp, sl, asr #1
	cmp fp, sl, asr #2
	orrge r6, r6, #1
	mov fp, sl, asr #3
	tst r6, #4
	addne fp, fp, sl
	tst r6, #2
	addne fp, fp, sl, asr #1
	tst r6, #1
	addne fp, fp, sl, asr #2
	tst r6, #8
	rsbne fp, fp, #0
	add sl, sb, fp
	ldr sb, _020B06CC ; =0x02108FF4
	cmp sl, ip
	movlt sl, ip
	cmp sl, ip, lsr #17
	ldrsb sb, [sb, r6]
	movgt sl, r2
	and r5, r5, #0xff
	adds r7, r7, sb
	add r1, r1, #4
	movmi r7, #0
	bmi _020B06A4
	cmp r7, #0x58
	movgt r7, #0x58
_020B06A4:
	strh sl, [r3]
	strb r7, [r3, #2]
	and r6, r6, #0xff
	orr r5, r5, r6, lsl #4
	strb r5, [r0], #1
	add r4, r4, #1
	cmp r4, r8
	blo _020B0564
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B06C8: .word 0x02109004
_020B06CC: .word 0x02108FF4
	arm_func_end sub_020B0544

	arm_func_start sub_020B06D0
sub_020B06D0: ; 0x020B06D0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	ldr r5, _020B0B54 ; =0xAAAAAAAB
	mov r4, #0
	str r4, [sp, #0xc]
	umull r5, r4, r2, r5
	movs r2, r4, lsr #1
	str r2, [sp]
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r4, #0x8000
	ldr lr, _020B0B58 ; =0x00007FFF
	ldr r5, _020B0B5C ; =0x02109004
	rsb r4, r4, #0
_020B0708:
	ldrb r7, [r3, #2]
	ldrb fp, [r0]
	ldrb r2, [r0, #1]
	mov r6, r7, lsl #1
	ldrsh r6, [r5, r6]
	mov sb, fp, asr #5
	tst sb, #2
	str r6, [sp, #8]
	ldrne sl, [sp, #8]
	mov r6, r6, asr #2
	addne r6, r6, sl
	tst sb, #1
	ldrne sl, [sp, #8]
	ldrb ip, [r0, #2]
	addne r6, r6, sl, asr #1
	ldrsh r8, [r3]
	tst sb, #4
	beq _020B0760
	sub r8, r8, r6
	cmp r8, r4
	movlt r8, r4
	b _020B076C
_020B0760:
	add r8, r8, r6
	cmp r8, lr
	movgt r8, lr
_020B076C:
	ldr r6, _020B0B60 ; =0x02108FEC
	ldrsb r6, [r6, sb]
	adds r7, r7, r6
	movmi r7, #0
	bmi _020B0788
	cmp r7, #0x58
	movgt r7, #0x58
_020B0788:
	mov r6, r8, lsl #0x10
	mov r6, r6, asr #0x10
	strh r6, [r3]
	strb r7, [r3, #2]
	strh r6, [r1]
	ldrb r7, [r3, #2]
	mov sb, fp, asr #2
	tst sb, #2
	mov r6, r7, lsl #1
	ldrsh r6, [r5, r6]
	ldrsh r8, [r3]
	str r6, [sp, #4]
	ldrne sl, [sp, #4]
	mov r6, r6, asr #2
	addne r6, r6, sl
	tst sb, #1
	ldrne sl, [sp, #4]
	addne r6, r6, sl, asr #1
	tst sb, #4
	beq _020B07E8
	sub r8, r8, r6
	cmp r8, r4
	movlt r8, r4
	b _020B07F4
_020B07E8:
	add r8, r8, r6
	cmp r8, lr
	movgt r8, lr
_020B07F4:
	ldr r6, _020B0B60 ; =0x02108FEC
	and sb, sb, #7
	ldrsb r6, [r6, sb]
	adds r7, r7, r6
	movmi r7, #0
	bmi _020B0814
	cmp r7, #0x58
	movgt r7, #0x58
_020B0814:
	mov r6, r8, lsl #0x10
	mov r6, r6, asr #0x10
	strh r6, [r3]
	strb r7, [r3, #2]
	strh r6, [r1, #2]
	ldrb r6, [r3, #2]
	mov r8, fp, lsl #1
	and r8, r8, #7
	mov sb, r6, lsl #1
	ldrsh sl, [r5, sb]
	orr r8, r8, r2, asr #7
	tst r8, #2
	mov sb, sl, asr #2
	addne sb, sb, sl
	tst r8, #1
	addne sb, sb, sl, asr #1
	ldrsh r7, [r3]
	tst r8, #4
	beq _020B0870
	sub r7, r7, sb
	cmp r7, r4
	movlt r7, r4
	b _020B087C
_020B0870:
	add r7, r7, sb
	cmp r7, lr
	movgt r7, lr
_020B087C:
	ldr sb, _020B0B60 ; =0x02108FEC
	ldrsb r8, [sb, r8]
	adds r6, r6, r8
	movmi r6, #0
	bmi _020B0898
	cmp r6, #0x58
	movgt r6, #0x58
_020B0898:
	mov r7, r7, lsl #0x10
	mov r7, r7, asr #0x10
	strh r7, [r3]
	strb r6, [r3, #2]
	strh r7, [r1, #4]
	ldrb r6, [r3, #2]
	mov r8, r2, asr #4
	tst r8, #2
	mov sb, r6, lsl #1
	ldrsh sl, [r5, sb]
	ldrsh r7, [r3]
	mov sb, sl, asr #2
	addne sb, sb, sl
	tst r8, #1
	addne sb, sb, sl, asr #1
	tst r8, #4
	beq _020B08EC
	sub r7, r7, sb
	cmp r7, r4
	movlt r7, r4
	b _020B08F8
_020B08EC:
	add r7, r7, sb
	cmp r7, lr
	movgt r7, lr
_020B08F8:
	and sb, r8, #7
	ldr r8, _020B0B60 ; =0x02108FEC
	ldrsb r8, [r8, sb]
	adds r6, r6, r8
	movmi r6, #0
	bmi _020B0918
	cmp r6, #0x58
	movgt r6, #0x58
_020B0918:
	mov r7, r7, lsl #0x10
	mov r7, r7, asr #0x10
	strh r7, [r3]
	strb r6, [r3, #2]
	strh r7, [r1, #6]
	ldrb r6, [r3, #2]
	mov r8, r2, asr #1
	tst r8, #2
	mov sb, r6, lsl #1
	ldrsh sl, [r5, sb]
	ldrsh r7, [r3]
	mov sb, sl, asr #2
	addne sb, sb, sl
	tst r8, #1
	addne sb, sb, sl, asr #1
	tst r8, #4
	beq _020B096C
	sub r7, r7, sb
	cmp r7, r4
	movlt r7, r4
	b _020B0978
_020B096C:
	add r7, r7, sb
	cmp r7, lr
	movgt r7, lr
_020B0978:
	and sb, r8, #7
	ldr r8, _020B0B60 ; =0x02108FEC
	ldrsb r8, [r8, sb]
	adds r6, r6, r8
	movmi r6, #0
	bmi _020B0998
	cmp r6, #0x58
	movgt r6, #0x58
_020B0998:
	mov r7, r7, lsl #0x10
	mov r8, r7, asr #0x10
	strh r8, [r3]
	mov r2, r2, lsl #2
	strb r6, [r3, #2]
	and r2, r2, #7
	strh r8, [r1, #8]
	orr r7, r2, ip, asr #6
	ldrb r2, [r3, #2]
	tst r7, #2
	ldrsh r6, [r3]
	mov r8, r2, lsl #1
	ldrsh sb, [r5, r8]
	mov r8, sb, asr #2
	addne r8, r8, sb
	tst r7, #1
	addne r8, r8, sb, asr #1
	tst r7, #4
	beq _020B09F4
	sub r6, r6, r8
	cmp r6, r4
	movlt r6, r4
	b _020B0A00
_020B09F4:
	add r6, r6, r8
	cmp r6, lr
	movgt r6, lr
_020B0A00:
	ldr r8, _020B0B60 ; =0x02108FEC
	ldrsb r7, [r8, r7]
	adds r2, r2, r7
	movmi r2, #0
	bmi _020B0A1C
	cmp r2, #0x58
	movgt r2, #0x58
_020B0A1C:
	mov r6, r6, lsl #0x10
	mov r6, r6, asr #0x10
	strh r6, [r3]
	strb r2, [r3, #2]
	strh r6, [r1, #0xa]
	ldrb r2, [r3, #2]
	mov sb, ip, asr #3
	tst sb, #2
	mov r7, r2, lsl #1
	ldrsh r8, [r5, r7]
	ldrsh r6, [r3]
	mov r7, r8, asr #2
	addne r7, r7, r8
	tst sb, #1
	addne r7, r7, r8, asr #1
	tst sb, #4
	beq _020B0A70
	sub r6, r6, r7
	cmp r6, r4
	movlt r6, r4
	b _020B0A7C
_020B0A70:
	add r6, r6, r7
	cmp r6, lr
	movgt r6, lr
_020B0A7C:
	ldr r7, _020B0B60 ; =0x02108FEC
	and r8, sb, #7
	ldrsb r7, [r7, r8]
	adds r2, r2, r7
	movmi r2, #0
	bmi _020B0A9C
	cmp r2, #0x58
	movgt r2, #0x58
_020B0A9C:
	mov r6, r6, lsl #0x10
	mov r6, r6, asr #0x10
	strh r6, [r3]
	strb r2, [r3, #2]
	strh r6, [r1, #0xc]
	ldrb r2, [r3, #2]
	tst ip, #2
	ldrsh r6, [r3]
	mov r7, r2, lsl #1
	ldrsh r8, [r5, r7]
	mov r7, r8, asr #2
	addne r7, r7, r8
	tst ip, #1
	addne r7, r7, r8, asr #1
	tst ip, #4
	beq _020B0AEC
	sub r6, r6, r7
	cmp r6, r4
	movlt r6, r4
	b _020B0AF8
_020B0AEC:
	add r6, r6, r7
	cmp r6, lr
	movgt r6, lr
_020B0AF8:
	ldr r7, _020B0B60 ; =0x02108FEC
	and r8, ip, #7
	ldrsb r7, [r7, r8]
	adds r2, r2, r7
	movmi r2, #0
	bmi _020B0B18
	cmp r2, #0x58
	movgt r2, #0x58
_020B0B18:
	mov r6, r6, lsl #0x10
	mov r6, r6, asr #0x10
	strh r6, [r3]
	strb r2, [r3, #2]
	ldr r2, [sp, #0xc]
	strh r6, [r1, #0xe]
	add r6, r2, #1
	ldr r2, [sp]
	add r0, r0, #3
	add r1, r1, #0x10
	str r6, [sp, #0xc]
	cmp r6, r2
	blo _020B0708
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B0B54: .word 0xAAAAAAAB
_020B0B58: .word 0x00007FFF
_020B0B5C: .word 0x02109004
_020B0B60: .word 0x02108FEC
	arm_func_end sub_020B06D0

	arm_func_start sub_020B0B64
sub_020B0B64: ; 0x020B0B64
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	movs r2, r2, lsr #3
	str r2, [sp]
	mov r2, #0
	str r2, [sp, #4]
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r6, #0x8000
	rsb r6, r6, #0
	ldr r7, _020B1068 ; =0x02109004
	ldr r4, _020B106C ; =0x02108FEC
	mov r5, r6, lsr #0x11
_020B0B98:
	ldrsh r2, [r3]
	ldrsh sb, [r1]
	ldrb r8, [r3, #2]
	subs fp, sb, r2
	mov sb, r8, lsl #1
	movmi sl, #4
	ldrsh sb, [r7, sb]
	rsbmi fp, fp, #0
	movpl sl, #0
	cmp fp, sb
	orrge sl, sl, #2
	subge fp, fp, sb
	cmp fp, sb, asr #1
	orrge sl, sl, #1
	mov fp, sb, asr #2
	tst sl, #2
	addne fp, fp, sb
	tst sl, #1
	addne fp, fp, sb, asr #1
	tst sl, #4
	rsbne fp, fp, #0
	add sb, r2, fp
	cmp sb, r6
	movlt sb, r6
	cmp sb, r6, lsr #17
	ldrsb r2, [r4, sl]
	movgt sb, r5
	adds r8, r8, r2
	movmi r8, #0
	bmi _020B0C18
	cmp r8, #0x58
	movgt r8, #0x58
_020B0C18:
	strh sb, [r3]
	strb r8, [r3, #2]
	and r2, sl, #0xff
	and sb, r8, #0xff
	mov fp, sb, lsl #1
	ldrsh sl, [r3]
	ldrsh r8, [r1, #2]
	ldrsh fp, [r7, fp]
	mov r2, r2, lsl #5
	subs ip, r8, sl
	movmi r8, #4
	rsbmi ip, ip, #0
	movpl r8, #0
	cmp ip, fp
	orrge r8, r8, #2
	subge ip, ip, fp
	cmp ip, fp, asr #1
	orrge r8, r8, #1
	mov ip, fp, asr #2
	tst r8, #2
	addne ip, ip, fp
	tst r8, #1
	addne ip, ip, fp, asr #1
	tst r8, #4
	rsbne ip, ip, #0
	add fp, sl, ip
	cmp fp, r6
	movlt fp, r6
	cmp fp, r6, lsr #17
	ldrsb sl, [r4, r8]
	movgt fp, r5
	and r2, r2, #0xff
	adds sb, sb, sl
	movmi sb, #0
	bmi _020B0CAC
	cmp sb, #0x58
	movgt sb, #0x58
_020B0CAC:
	strh fp, [r3]
	strb sb, [r3, #2]
	and r8, r8, #0xff
	orr r2, r2, r8, lsl #2
	and sb, sb, #0xff
	mov fp, sb, lsl #1
	ldrsh sl, [r3]
	ldrsh r8, [r1, #4]
	ldrsh fp, [r7, fp]
	and r2, r2, #0xff
	subs ip, r8, sl
	movmi r8, #4
	rsbmi ip, ip, #0
	movpl r8, #0
	cmp ip, fp
	orrge r8, r8, #2
	subge ip, ip, fp
	cmp ip, fp, asr #1
	orrge r8, r8, #1
	mov ip, fp, asr #2
	tst r8, #2
	addne ip, ip, fp
	tst r8, #1
	addne ip, ip, fp, asr #1
	tst r8, #4
	rsbne ip, ip, #0
	add fp, sl, ip
	cmp fp, r6
	movlt fp, r6
	cmp fp, r6, lsr #17
	ldrsb sl, [r4, r8]
	movgt fp, r5
	adds sb, sb, sl
	movmi sb, #0
	bmi _020B0D40
	cmp sb, #0x58
	movgt sb, #0x58
_020B0D40:
	strh fp, [r3]
	and lr, r8, #0xff
	strb sb, [r3, #2]
	orr r2, r2, lr, asr #1
	strb r2, [r0]
	ldrb sb, [r3, #2]
	ldrsh r8, [r3]
	ldrsh r2, [r1, #6]
	mov sl, sb, lsl #1
	ldrsh sl, [r7, sl]
	subs fp, r2, r8
	movmi r2, #4
	rsbmi fp, fp, #0
	movpl r2, #0
	cmp fp, sl
	orrge r2, r2, #2
	subge fp, fp, sl
	cmp fp, sl, asr #1
	orrge r2, r2, #1
	mov fp, sl, asr #2
	tst r2, #2
	addne fp, fp, sl
	tst r2, #1
	addne fp, fp, sl, asr #1
	tst r2, #4
	rsbne fp, fp, #0
	add sl, r8, fp
	cmp sl, r6
	movlt sl, r6
	cmp sl, r6, lsr #17
	ldrsb r8, [r4, r2]
	movgt sl, r5
	adds sb, sb, r8
	movmi sb, #0
	bmi _020B0DD4
	cmp sb, #0x58
	movgt sb, #0x58
_020B0DD4:
	strh sl, [r3]
	and r2, r2, #0xff
	mov r2, r2, lsl #4
	strb sb, [r3, #2]
	and r8, r2, #0xff
	and ip, sb, #0xff
	ldrsh r2, [r3]
	ldrsh sb, [r1, #8]
	subs fp, sb, r2
	mov sb, ip, lsl #1
	movmi sl, #4
	ldrsh sb, [r7, sb]
	rsbmi fp, fp, #0
	movpl sl, #0
	cmp fp, sb
	orrge sl, sl, #2
	subge fp, fp, sb
	cmp fp, sb, asr #1
	orrge sl, sl, #1
	mov fp, sb, asr #2
	tst sl, #2
	addne fp, fp, sb
	tst sl, #1
	addne fp, fp, sb, asr #1
	tst sl, #4
	rsbne fp, fp, #0
	add sb, r2, fp
	cmp sb, r6
	movlt sb, r6
	cmp sb, r6, lsr #17
	ldrsb r2, [r4, sl]
	movgt sb, r5
	adds ip, ip, r2
	movmi ip, #0
	bmi _020B0E68
	cmp ip, #0x58
	movgt ip, #0x58
_020B0E68:
	strh sb, [r3]
	strb ip, [r3, #2]
	and r2, sl, #0xff
	orr r2, r8, r2, lsl #1
	and r8, r2, #0xff
	ldrsh r2, [r3]
	ldrsh sb, [r1, #0xa]
	and ip, ip, #0xff
	subs fp, sb, r2
	mov sb, ip, lsl #1
	movmi sl, #4
	ldrsh sb, [r7, sb]
	rsbmi fp, fp, #0
	movpl sl, #0
	cmp fp, sb
	orrge sl, sl, #2
	subge fp, fp, sb
	cmp fp, sb, asr #1
	orrge sl, sl, #1
	mov fp, sb, asr #2
	tst sl, #2
	addne fp, fp, sb
	tst sl, #1
	addne fp, fp, sb, asr #1
	tst sl, #4
	rsbne fp, fp, #0
	add r2, r2, fp
	cmp r2, r6
	movlt r2, r6
	cmp r2, r6, lsr #17
	ldrsb sb, [r4, sl]
	movgt r2, r5
	adds ip, ip, sb
	movmi ip, #0
	bmi _020B0EFC
	cmp ip, #0x58
	movgt ip, #0x58
_020B0EFC:
	strh r2, [r3]
	orr r8, r8, lr, lsl #7
	and r2, sl, #0xff
	strb ip, [r3, #2]
	orr r8, r8, r2, asr #2
	strb r8, [r0, #1]
	ldrb sb, [r3, #2]
	ldrsh sl, [r3]
	ldrsh r8, [r1, #0xc]
	mov fp, sb, lsl #1
	ldrsh fp, [r7, fp]
	subs ip, r8, sl
	movmi r8, #4
	rsbmi ip, ip, #0
	movpl r8, #0
	cmp ip, fp
	orrge r8, r8, #2
	subge ip, ip, fp
	cmp ip, fp, asr #1
	orrge r8, r8, #1
	mov ip, fp, asr #2
	tst r8, #2
	addne ip, ip, fp
	tst r8, #1
	addne ip, ip, fp, asr #1
	tst r8, #4
	rsbne ip, ip, #0
	add fp, sl, ip
	cmp fp, r6
	movlt fp, r6
	cmp fp, r6, lsr #17
	ldrsb sl, [r4, r8]
	movgt fp, r5
	adds sb, sb, sl
	movmi sb, #0
	bmi _020B0F94
	cmp sb, #0x58
	movgt sb, #0x58
_020B0F94:
	strh fp, [r3]
	and r8, r8, #0xff
	mov r8, r8, lsl #3
	strb sb, [r3, #2]
	and ip, r8, #0xff
	and sl, sb, #0xff
	ldrsh r8, [r1, #0xe]
	ldrsh fp, [r3]
	mov lr, sl, lsl #1
	ldrsh lr, [r7, lr]
	subs sb, r8, fp
	movmi r8, #4
	rsbmi sb, sb, #0
	movpl r8, #0
	cmp sb, lr
	orrge r8, r8, #2
	subge sb, sb, lr
	cmp sb, lr, asr #1
	orrge r8, r8, #1
	mov sb, lr, asr #2
	tst r8, #2
	addne sb, sb, lr
	tst r8, #1
	addne sb, sb, lr, asr #1
	tst r8, #4
	rsbne sb, sb, #0
	add fp, fp, sb
	cmp fp, r6
	movlt fp, r6
	cmp fp, r6, lsr #17
	ldrsb sb, [r4, r8]
	movgt fp, r5
	add r1, r1, #0x10
	adds sl, sl, sb
	movmi sl, #0
	bmi _020B102C
	cmp sl, #0x58
	movgt sl, #0x58
_020B102C:
	and r8, r8, #0xff
	strh fp, [r3]
	orr r8, ip, r8
	strb sl, [r3, #2]
	orr r2, r8, r2, lsl #6
	strb r2, [r0, #2]
	ldr r2, [sp, #4]
	add r0, r0, #3
	add r8, r2, #1
	ldr r2, [sp]
	str r8, [sp, #4]
	cmp r8, r2
	blo _020B0B98
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B1068: .word 0x02109004
_020B106C: .word 0x02108FEC
	arm_func_end sub_020B0B64

	arm_func_start sub_020B1070
sub_020B1070: ; 0x020B1070
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	cmp r2, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r4, #0x8000
	ldr lr, _020B127C ; =0x00007FFF
	ldr ip, _020B1280 ; =0x02108FE8
	ldr r6, _020B1284 ; =0x02109004
	rsb r4, r4, #0
	mov r5, r7
_020B1098:
	ldrb sl, [r0]
	ldrb r8, [r3, #2]
	ldrsh sb, [r3]
	and fp, sl, #3
	mov sl, r8, lsl #1
	ldrsh sl, [r6, sl]
	tst fp, #1
	moveq sl, r5
	tst fp, #2
	beq _020B10D0
	sub sb, sb, sl
	cmp sb, r4
	movlt sb, r4
	b _020B10DC
_020B10D0:
	add sb, sb, sl
	cmp sb, lr
	movgt sb, lr
_020B10DC:
	ldrsb sl, [ip, fp]
	adds r8, r8, sl
	movmi r8, #0
	bmi _020B10F4
	cmp r8, #0x58
	movgt r8, #0x58
_020B10F4:
	mov sb, sb, lsl #0x10
	mov sb, sb, asr #0x10
	strh sb, [r3]
	strb r8, [r3, #2]
	strh sb, [r1]
	ldrb sl, [r0]
	ldrb r8, [r3, #2]
	ldrsh sb, [r3]
	mov sl, sl, asr #2
	and fp, sl, #3
	mov sl, r8, lsl #1
	ldrsh sl, [r6, sl]
	tst fp, #1
	moveq sl, #0
	tst fp, #2
	beq _020B1144
	sub sb, sb, sl
	cmp sb, r4
	movlt sb, r4
	b _020B1150
_020B1144:
	add sb, sb, sl
	cmp sb, lr
	movgt sb, lr
_020B1150:
	ldrsb sl, [ip, fp]
	adds r8, r8, sl
	movmi r8, #0
	bmi _020B1168
	cmp r8, #0x58
	movgt r8, #0x58
_020B1168:
	mov sb, sb, lsl #0x10
	mov sb, sb, asr #0x10
	strh sb, [r3]
	strb r8, [r3, #2]
	strh sb, [r1, #2]
	ldrb sl, [r0]
	ldrb r8, [r3, #2]
	ldrsh sb, [r3]
	mov sl, sl, asr #4
	and fp, sl, #3
	mov sl, r8, lsl #1
	ldrsh sl, [r6, sl]
	tst fp, #1
	moveq sl, #0
	tst fp, #2
	beq _020B11B8
	sub sb, sb, sl
	cmp sb, r4
	movlt sb, r4
	b _020B11C4
_020B11B8:
	add sb, sb, sl
	cmp sb, lr
	movgt sb, lr
_020B11C4:
	ldrsb sl, [ip, fp]
	adds r8, r8, sl
	movmi r8, #0
	bmi _020B11DC
	cmp r8, #0x58
	movgt r8, #0x58
_020B11DC:
	mov sb, sb, lsl #0x10
	mov sb, sb, asr #0x10
	strh sb, [r3]
	strb r8, [r3, #2]
	strh sb, [r1, #4]
	ldrb sl, [r0]
	ldrb r8, [r3, #2]
	ldrsh sb, [r3]
	mov sl, sl, asr #6
	and fp, sl, #3
	mov sl, r8, lsl #1
	ldrsh sl, [r6, sl]
	tst fp, #1
	moveq sl, #0
	tst fp, #2
	beq _020B122C
	sub sb, sb, sl
	cmp sb, r4
	movlt sb, r4
	b _020B1238
_020B122C:
	add sb, sb, sl
	cmp sb, lr
	movgt sb, lr
_020B1238:
	ldrsb sl, [ip, fp]
	adds r8, r8, sl
	movmi r8, #0
	bmi _020B1250
	cmp r8, #0x58
	movgt r8, #0x58
_020B1250:
	mov sb, sb, lsl #0x10
	mov sb, sb, asr #0x10
	strh sb, [r3]
	strb r8, [r3, #2]
	add r7, r7, #1
	strh sb, [r1, #6]
	add r1, r1, #8
	add r0, r0, #1
	cmp r7, r2
	blo _020B1098
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B127C: .word 0x00007FFF
_020B1280: .word 0x02108FE8
_020B1284: .word 0x02109004
	arm_func_end sub_020B1070

	arm_func_start sub_020B1288
sub_020B1288: ; 0x020B1288
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r2, r2, lsr #2
	mov fp, #0
	str r2, [sp]
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r4, #0x8000
	rsb r4, r4, #0
	ldr r5, _020B14B0 ; =0x02109004
	ldr ip, _020B14B4 ; =0x02108FE8
	mov lr, r4, lsr #0x11
_020B12B0:
	ldrb r7, [r3, #2]
	ldrsh r6, [r3]
	ldrsh r2, [r1]
	mov r8, r7, lsl #1
	ldrsh r8, [r5, r8]
	subs sb, r2, r6
	movmi r2, #2
	rsbmi sb, sb, #0
	movpl r2, #0
	cmp sb, r8
	orrge r2, r2, #1
	tst r2, #1
	moveq r8, #0
	tst r2, #2
	rsbne r8, r8, #0
	add r8, r6, r8
	cmp r8, r4
	movlt r8, r4
	cmp r8, r4, lsr #17
	ldrsb r6, [ip, r2]
	movgt r8, lr
	adds r7, r7, r6
	movmi r7, #0
	bmi _020B1318
	cmp r7, #0x58
	movgt r7, #0x58
_020B1318:
	strh r8, [r3]
	strb r7, [r3, #2]
	and r6, r2, #0xff
	ldrsh sl, [r3]
	ldrsh r2, [r1, #2]
	and sb, r7, #0xff
	subs r8, r2, sl
	mov r2, sb, lsl #1
	movmi r7, #2
	ldrsh r2, [r5, r2]
	rsbmi r8, r8, #0
	movpl r7, #0
	cmp r8, r2
	orrge r7, r7, #1
	tst r7, #1
	moveq r2, #0
	tst r7, #2
	rsbne r2, r2, #0
	add r8, sl, r2
	cmp r8, r4
	movlt r8, r4
	cmp r8, r4, lsr #17
	ldrsb r2, [ip, r7]
	movgt r8, lr
	adds sb, sb, r2
	movmi sb, #0
	bmi _020B138C
	cmp sb, #0x58
	movgt sb, #0x58
_020B138C:
	strh r8, [r3]
	strb sb, [r3, #2]
	and r2, r7, #0xff
	orr r2, r6, r2, lsl #2
	and r6, r2, #0xff
	ldrsh sl, [r3]
	ldrsh r2, [r1, #4]
	and sb, sb, #0xff
	subs r8, r2, sl
	mov r2, sb, lsl #1
	movmi r7, #2
	ldrsh r2, [r5, r2]
	rsbmi r8, r8, #0
	movpl r7, #0
	cmp r8, r2
	orrge r7, r7, #1
	tst r7, #1
	moveq r2, #0
	tst r7, #2
	rsbne r2, r2, #0
	add r8, sl, r2
	cmp r8, r4
	movlt r8, r4
	cmp r8, r4, lsr #17
	ldrsb r2, [ip, r7]
	movgt r8, lr
	adds sb, sb, r2
	movmi sb, #0
	bmi _020B1408
	cmp sb, #0x58
	movgt sb, #0x58
_020B1408:
	strh r8, [r3]
	strb sb, [r3, #2]
	and r2, r7, #0xff
	orr r2, r6, r2, lsl #4
	and r6, r2, #0xff
	ldrsh r2, [r1, #6]
	ldrsh sl, [r3]
	and sb, sb, #0xff
	add r1, r1, #8
	subs r8, r2, sl
	mov r2, sb, lsl #1
	movmi r7, #2
	ldrsh r2, [r5, r2]
	rsbmi r8, r8, #0
	movpl r7, #0
	cmp r8, r2
	orrge r7, r7, #1
	tst r7, #1
	moveq r2, #0
	tst r7, #2
	rsbne r2, r2, #0
	add r8, sl, r2
	cmp r8, r4
	movlt r8, r4
	cmp r8, r4, lsr #17
	ldrsb r2, [ip, r7]
	movgt r8, lr
	adds sb, sb, r2
	movmi sb, #0
	bmi _020B1488
	cmp sb, #0x58
	movgt sb, #0x58
_020B1488:
	strh r8, [r3]
	and r2, r7, #0xff
	strb sb, [r3, #2]
	orr r2, r6, r2, lsl #6
	strb r2, [r0], #1
	ldr r2, [sp]
	add fp, fp, #1
	cmp fp, r2
	blo _020B12B0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B14B0: .word 0x02109004
_020B14B4: .word 0x02108FE8
	arm_func_end sub_020B1288

	arm_func_start sub_020B14B8
sub_020B14B8: ; 0x020B14B8
	stmdb sp!, {r3, lr}
	ldrsh ip, [r0]
	cmp r3, #2
	strh ip, [sp]
	ldrb ip, [r0, #2]
	strb ip, [sp, #2]
	beq _020B14E8
	cmp r3, #3
	beq _020B14FC
	cmp r3, #4
	beq _020B1510
	ldmia sp!, {r3, pc}
_020B14E8:
	add r3, sp, #0
	add r0, r0, #4
	sub r2, r2, #4
	bl sub_020B1070
	ldmia sp!, {r3, pc}
_020B14FC:
	add r3, sp, #0
	add r0, r0, #4
	sub r2, r2, #4
	bl sub_020B06D0
	ldmia sp!, {r3, pc}
_020B1510:
	add r3, sp, #0
	add r0, r0, #4
	sub r2, r2, #4
	bl sub_020B03F0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B14B8

	arm_func_start sub_020B1524
sub_020B1524: ; 0x020B1524
	stmdb sp!, {r4, lr}
	ldrsh r4, [r3]
	ldr ip, [sp, #8]
	mov lr, #0
	strh r4, [r0]
	ldrb r4, [r3, #2]
	cmp ip, #2
	strb r4, [r0, #2]
	strb lr, [r0, #3]
	beq _020B1560
	cmp ip, #3
	beq _020B156C
	cmp ip, #4
	beq _020B1578
	ldmia sp!, {r4, pc}
_020B1560:
	add r0, r0, #4
	bl sub_020B1288
	ldmia sp!, {r4, pc}
_020B156C:
	add r0, r0, #4
	bl sub_020B0B64
	ldmia sp!, {r4, pc}
_020B1578:
	add r0, r0, #4
	bl sub_020B0544
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B1524

	arm_func_start sub_020B1584
sub_020B1584: ; 0x020B1584
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	bl OS_GetTickLo
	ldr r2, _020B1668 ; =0x021D6040
	ldr r1, _020B166C ; =_021108D8
	mov r3, #1
	str r3, [r1]
	strh r0, [r2]
	mov r1, #0
	str r1, [r2, #0x20]
	ldr r0, _020B1670 ; =0x021D8498
	str r1, [r2, #4]
	ldr r0, [r0, #0x10]
	ldr r3, _020B1674 ; =0x021090B8
	cmp r0, #1
	streq r1, [r2, #0x1c]
	movne r0, #4
	strne r0, [r2, #0x1c]
	ldr r1, _020B1668 ; =0x021D6040
	mov r0, #0x440
	str r0, [r1, #0x24]
	ldr r5, [r1, #0x1c]
	mov r0, #0x44
	add r2, r3, r5, lsl #1
	ldrb r4, [r2, #1]
	ldrb r3, [r3, r5, lsl #1]
	mov r2, #0
	mla r0, r3, r0, r4
	add r0, r0, #0xc
	str r0, [r1, #0xc]
	str r2, [r1, #0xf00]
	str r2, [r1, #0xf04]
	str r2, [r1, #0xf0c]
	str r2, [r1, #0xf08]
	str r2, [r1, #0xf10]
	str r2, [r1, #0xf14]
	bl sub_020B43A8
	mov sb, #0
	mov r8, sb
	ldr r7, _020B1678 ; =0x021D606C
	ldr r6, _020B167C ; =0x021D6078
	mvn r5, #0
	mov r4, #0x94
	b _020B1650
_020B1630:
	mov r0, sb
	str r8, [r7, sb, lsl #2]
	bl sub_020B27E0
	mla r0, sb, r4, r6
	mov r1, sb
	mov r2, r5
	bl sub_020B2AC0
	add sb, sb, #1
_020B1650:
	cmp sb, #3
	blo _020B1630
	bl sub_020B23F0
	bl sub_020B44BC
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020B1668: .word 0x021D6040
_020B166C: .word _021108D8
_020B1670: .word 0x021D8498
_020B1674: .word 0x021090B8
_020B1678: .word 0x021D606C
_020B167C: .word 0x021D6078
	arm_func_end sub_020B1584

	arm_func_start sub_020B1680
sub_020B1680: ; 0x020B1680
	ldr r0, _020B1690 ; =0x021D6040
	mov r1, #0
	str r1, [r0, #0x20]
	bx lr
	.align 2, 0
_020B1690: .word 0x021D6040
	arm_func_end sub_020B1680

	arm_func_start sub_020B1694
sub_020B1694: ; 0x020B1694
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, _020B17C0 ; =0x021D6040
	ldr r0, [r0, #0x20]
	cmp r0, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0xc]
	cmp r0, #2
	cmpne r0, #3
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r4, #0
	ldr r1, _020B17C4 ; =0x021D606C
	b _020B16EC
_020B16D8:
	ldr r0, [r1, r4, lsl #2]
	cmp r0, r5
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	add r4, r4, #1
_020B16EC:
	cmp r4, #3
	blo _020B16D8
	mov r4, #0
	ldr r1, _020B17C4 ; =0x021D606C
	b _020B1714
_020B1700:
	ldr r0, [r1, r4, lsl #2]
	cmp r0, #0
	streq r5, [r1, r4, lsl #2]
	beq _020B171C
	add r4, r4, #1
_020B1714:
	cmp r4, #3
	blo _020B1700
_020B171C:
	ldr r1, _020B17C0 ; =0x021D6040
	ldr r2, _020B17C8 ; =0x021D6078
	ldr r3, [r1, #0x20]
	mov r0, #0x94
	add r3, r3, #1
	str r3, [r1, #0x20]
	ldr ip, [r1, #4]
	ldr r3, [r5, #8]
	mla r0, r4, r0, r2
	orr r2, ip, r3
	str r2, [r1, #4]
	ldrb r2, [r5, #5]
	mov r1, r4
	bl sub_020B2AC0
	mov r0, r4
	bl sub_020B27E0
	ldr r0, [r5, #0xc]
	cmp r0, #2
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, _020B17C0 ; =0x021D6040
	ldr r0, [r0, #0x20]
	cmp r0, #1
	bne _020B17B8
	bl sub_020B415C
	bl OS_GetTickLo
	ldr r1, _020B17C0 ; =0x021D6040
	mov r2, #0
	strh r0, [r1]
	strh r2, [r1, #0x10]
	strb r2, [r1, #0x12]
	mov r0, #1
	str r0, [r1, #0x14]
	str r2, [r1, #0xf00]
	str r2, [r1, #0xf04]
	str r2, [r1, #0xf0c]
	str r2, [r1, #0xf08]
	str r2, [r1, #0xf10]
	str r2, [r1, #0xf14]
_020B17B8:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B17C0: .word 0x021D6040
_020B17C4: .word 0x021D606C
_020B17C8: .word 0x021D6078
	arm_func_end sub_020B1694

	arm_func_start sub_020B17CC
sub_020B17CC: ; 0x020B17CC
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, _020B1874 ; =0x021D606C
	mov r5, r0
	mov r4, #0
_020B17DC:
	ldr r0, [ip, r4, lsl #2]
	cmp r0, r5
	bne _020B183C
	ldr r1, _020B1878 ; =0x021D6078
	mov r0, #0x94
	mla r0, r4, r0, r1
	ldr r1, _020B187C ; =0x021D6040
	mov r3, #0
	ldr r2, [r1, #0x20]
	str r3, [ip, r4, lsl #2]
	sub r2, r2, #1
	str r2, [r1, #0x20]
	bl sub_020B2B4C
	mov r0, r4
	bl sub_020B281C
	mov r0, r4
	bl sub_020B2430
	ldr r0, _020B187C ; =0x021D6040
	ldr r1, [r5, #8]
	ldr r2, [r0, #4]
	mvn r1, r1
	and r1, r2, r1
	str r1, [r0, #4]
	b _020B1848
_020B183C:
	add r4, r4, #1
	cmp r4, #3
	blo _020B17DC
_020B1848:
	ldr r0, _020B187C ; =0x021D6040
	ldr r1, [r0, #0x20]
	cmp r1, #0
	ldmneia sp!, {r3, r4, r5, pc}
	mov r1, #1
	str r1, [r0, #0x14]
	bl sub_020B415C
	ldr r0, _020B187C ; =0x021D6040
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B1874: .word 0x021D606C
_020B1878: .word 0x021D6078
_020B187C: .word 0x021D6040
	arm_func_end sub_020B17CC

	arm_func_start sub_020B1880
sub_020B1880: ; 0x020B1880
	stmdb sp!, {r4, lr}
	ldr r3, _020B1980 ; =0x021D6040
	mov r2, r1
	ldr r1, [r3, #0x24]
	mov ip, #0
	cmp r2, r1
	movne r0, ip
	ldmneia sp!, {r4, pc}
	ldr r1, [r3, #0x20]
	cmp r1, #0
	moveq r0, ip
	ldmeqia sp!, {r4, pc}
	mov r4, ip
	ldr r3, _020B1984 ; =0x021D606C
	b _020B18DC
_020B18BC:
	ldr r1, [r3, r4, lsl #2]
	cmp r1, #0
	beq _020B18D8
	ldr r1, [r1, #0xc]
	cmp r1, #2
	moveq ip, #1
	beq _020B18E4
_020B18D8:
	add r4, r4, #1
_020B18DC:
	cmp r4, #3
	blo _020B18BC
_020B18E4:
	cmp ip, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r1, _020B1980 ; =0x021D6040
	ldr ip, _020B1988 ; =0x021D6680
	ldr r1, [r1, #0xf04]
	ldr r3, _020B198C ; =0x5F564354
	tst r1, #1
	ldr r1, _020B1980 ; =0x021D6040
	movne r4, #0
	moveq r4, #0x460
	ldr r1, [r1, #0x1c]
	str r3, [ip, r4]
	cmp r1, #2
	add r4, ip, r4
	blt _020B1930
	add r1, r4, #0x10
	bl MIi_CpuCopyFast
	b _020B1938
_020B1930:
	add r1, r4, #0xc
	bl MIi_CpuCopyFast
_020B1938:
	ldr r0, _020B1980 ; =0x021D6040
	mov r1, #0x40
	ldrh r2, [r0]
	strb r1, [r4, #4]
	add r1, r2, #1
	strh r1, [r0]
	strh r2, [r4, #6]
	bl OS_GetTick
	mov r2, #0x40
	mov r3, #0
	bl _ll_udiv
	str r0, [r4, #8]
	ldr r1, _020B1980 ; =0x021D6040
	mov r0, #1
	ldr r2, [r1, #0xf04]
	add r2, r2, #1
	str r2, [r1, #0xf04]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B1980: .word 0x021D6040
_020B1984: .word 0x021D606C
_020B1988: .word 0x021D6680
_020B198C: .word 0x5F564354
	arm_func_end sub_020B1880

	arm_func_start sub_020B1990
sub_020B1990: ; 0x020B1990
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	ldr r4, _020B1BD4 ; =0x021D6078
	mov sl, r2
	mov r2, #0x94
	mla r6, sl, r2, r4
	str r0, [sp]
	mov r0, sl
	str r1, [sp, #4]
	mov fp, r3
	mov r7, #1
	bl sub_020B2AB0
	movs r4, r0
	beq _020B1BB0
_020B19C8:
	bl OS_GetTick
	mov r8, r0
	mov r0, sl
	mov sb, r1
	bl sub_020B2A0C
	movs r5, r0
	beq _020B1B98
	ldr r1, [r5, #0x46c]
	adds r3, r8, #0x34
	ldr r0, [r5, #0x470]
	adc r2, sb, #0
	cmp r0, r2
	cmpeq r1, r3
	bls _020B1A7C
	ldr r0, [r5, #0x45c]
	cmp r0, #0
	bne _020B1A70
	ldr r0, [r6, #0x3c]
	cmp r0, #0
	beq _020B1A70
	ldr r0, [r6, #0x20]
	ldr r1, [sp]
	add r0, r0, #1
	str r0, [r6, #0x20]
	ldr r0, [r6, #0x3c]
	ldr r2, [sp, #4]
	ldr r0, [r0, #0x474]
	bl MIi_CpuCopyFast
	ldr r0, [r6, #0x3c]
	bl sub_020B4128
	mov r0, #0
	str r0, [r6, #0x3c]
	cmp fp, #0
	beq _020B1A64
	ldrb r0, [r5, #0x10]
	ldr r2, [fp]
	mov r1, #1
	orr r0, r2, r1, lsl r0
	str r0, [fp]
_020B1A64:
	add sp, sp, #8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B1A70:
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B1A7C:
	ldr r2, _020B1BD8 ; =0x00008B4C
	adds r2, r1, r2
	adc r0, r0, #0
	cmp sb, r0
	cmpeq r8, r2
	bls _020B1ABC
	ldr r2, [r5, #0x18]
	mov r0, r6
	mov r1, r5
	str r2, [r6, #0x58]
	bl sub_020B2B78
	mov r4, r0
	mov r0, sl
	bl sub_020B2A0C
	mov r7, #0
	b _020B1BA8
_020B1ABC:
	ldr r1, [r6, #0x58]
	ldr r2, [r5, #0x18]
	add r0, r1, #1
	cmp r0, r2
	cmpne r1, #0
	beq _020B1AF0
	cmp r1, r2
	bhi _020B1AF0
	ldr r0, [r5, #0x45c]
	cmp r0, #0
	ldreq r0, [r6, #0x14]
	addeq r0, r0, #1
	streq r0, [r6, #0x14]
_020B1AF0:
	ldr r0, [r5, #0x18]
	cmp r7, #0
	str r0, [r6, #0x58]
	ldrne r0, [r6, #0x70]
	cmpne r0, #0
	beq _020B1B30
	mov r0, r6
	mov r1, r5
	bl sub_020B2B78
	mov r4, r0
	mov r0, sl
	bl sub_020B2A0C
	ldr r0, [r6, #0x70]
	sub r0, r0, #1
	str r0, [r6, #0x70]
	b _020B1BA8
_020B1B30:
	ldr r1, [r5, #0x464]
	ldr r0, [r6, #0x28]
	subs r1, r8, r1
	sub r0, r1, r0
	sub r0, r0, r1
	str r1, [r6, #0x28]
	add r0, r1, r0, lsr #4
	str r0, [r6, #0x2c]
	str r0, [r6]
	ldr r0, [r5, #0x474]
	ldr r1, [sp]
	ldr r2, [sp, #4]
	bl MIi_CpuCopyFast
	mov r0, r6
	mov r1, r5
	bl sub_020B2B78
	cmp fp, #0
	beq _020B1B8C
	ldrb r0, [r5, #0x10]
	ldr r2, [fp]
	mov r1, #1
	orr r0, r2, r1, lsl r0
	str r0, [fp]
_020B1B8C:
	add sp, sp, #8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B1B98:
	add sp, sp, #8
	str r4, [r6, #8]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B1BA8:
	cmp r4, #0
	bne _020B19C8
_020B1BB0:
	ldr r0, [r6, #0x3c]
	cmp r0, #0
	beq _020B1BC8
	bl sub_020B4128
	mov r0, #0
	str r0, [r6, #0x3c]
_020B1BC8:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B1BD4: .word 0x021D6078
_020B1BD8: .word 0x00008B4C
	arm_func_end sub_020B1990

	arm_func_start sub_020B1BDC
sub_020B1BDC: ; 0x020B1BDC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r5, r2
	mov r7, r0
	movne r0, #0
	strne r0, [r5]
	ldr r0, _020B1CF0 ; =0x021D6040
	mov r6, r1
	ldr r1, [r0, #0x24]
	mov r4, #0
	cmp r6, r1
	bne _020B1CB8
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _020B1CB8
	mov r8, r4
_020B1C18:
	mov r0, r7
	mov r1, r6
	mov r2, r8
	mov r3, r5
	bl sub_020B1990
	cmp r0, #1
	moveq r4, #1
	beq _020B1C44
	add r8, r8, #1
	cmp r8, #3
	blo _020B1C18
_020B1C44:
	cmp r4, #0
	beq _020B1CA4
	add sb, r8, #1
	cmp sb, #3
	moveq r4, #1
	beq _020B1CCC
	bhs _020B1CCC
	ldr r8, _020B1CF4 ; =0x021D6234
_020B1C64:
	mov r0, r8
	mov r1, r6
	mov r2, sb
	mov r3, r5
	bl sub_020B1990
	cmp r0, #1
	bne _020B1C94
	mov r0, r7
	mov r1, r8
	mov r2, r7
	mov r3, r6
	bl sub_020B478C
_020B1C94:
	add sb, sb, #1
	cmp sb, #3
	blo _020B1C64
	b _020B1CCC
_020B1CA4:
	mov r1, r7
	mov r2, r6
	mov r0, #0
	bl MIi_CpuClearFast
	b _020B1CCC
_020B1CB8:
	mov r1, r7
	mov r2, r6
	mov r0, #0
	bl MIi_CpuClearFast
	mov r4, #0
_020B1CCC:
	ldr r0, _020B1CF0 ; =0x021D6040
	ldr r0, [r0, #0x18]
	cmp r0, #0
	beq _020B1CE8
	mov r0, r7
	mov r1, r6
	bl sub_020B4538
_020B1CE8:
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020B1CF0: .word 0x021D6040
_020B1CF4: .word 0x021D6234
	arm_func_end sub_020B1BDC

	arm_func_start sub_020B1CF8
sub_020B1CF8: ; 0x020B1CF8
	cmp r0, #5
	movge r0, #0
	bxge lr
	ldr r1, _020B1D5C ; =0x021D8498
	ldr r1, [r1, #0x10]
	cmp r1, #1
	beq _020B1D20
	cmp r0, #1
	movls r0, #0
	bxls lr
_020B1D20:
	ldr r2, _020B1D60 ; =0x021090B9
	ldr r1, _020B1D64 ; =0x021090B8
	ldrb ip, [r2, r0, lsl #1]
	ldrb r3, [r1, r0, lsl #1]
	mov r1, #0x44
	ldr r2, _020B1D68 ; =0x021D6040
	mla r1, r3, r1, ip
	add r1, r1, #0xc
	str r1, [r2, #0xc]
	str r0, [r2, #0x1c]
	mov r0, #0
	strh r0, [r2, #0x10]
	strb r0, [r2, #0x12]
	mov r0, #1
	bx lr
	.align 2, 0
_020B1D5C: .word 0x021D8498
_020B1D60: .word 0x021090B9
_020B1D64: .word 0x021090B8
_020B1D68: .word 0x021D6040
	arm_func_end sub_020B1CF8

	arm_func_start sub_020B1D6C
sub_020B1D6C: ; 0x020B1D6C
	stmdb sp!, {r4, lr}
	ldr r1, _020B1D94 ; =_021108D8
	mov r4, r0
	str r4, [r1]
	bl sub_020B415C
	cmp r4, #0
	ldreq r0, _020B1D98 ; =0x021D6040
	moveq r1, #1
	streq r1, [r0, #8]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B1D94: .word _021108D8
_020B1D98: .word 0x021D6040
	arm_func_end sub_020B1D6C

	arm_func_start sub_020B1D9C
sub_020B1D9C: ; 0x020B1D9C
	ldr r1, _020B1DA8 ; =0x021D6040
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_020B1DA8: .word 0x021D6040
	arm_func_end sub_020B1D9C

	arm_func_start sub_020B1DAC
sub_020B1DAC: ; 0x020B1DAC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #4
	ldr r0, _020B200C ; =0x021D6040
	ldr r2, [r0, #0xf04]
	ldr r1, [r0, #0xf00]
	ldr r8, [r0, #0x1c]
	sub r1, r2, r1
	cmp r1, #1
	subhi r1, r2, #1
	strhi r1, [r0, #0xf00]
	movhi r1, #1
	cmp r1, #0
	addeq sp, sp, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r0, _020B200C ; =0x021D6040
	ldr r0, [r0, #0xf00]
	tst r0, #1
	movne r1, #0
	moveq r1, #0x460
	ldr r0, _020B2010 ; =0x021D6680
	cmp r8, #2
	add r5, r0, r1
	ldr r1, _020B200C ; =0x021D6040
	add r4, r5, #0xc
	addge r4, r4, #4
	ldr r1, [r1, #0x24]
	mov r0, r4
	bl sub_020B43D0
	ldr r1, _020B2014 ; =0x040002B0
	mov r2, #0
	mov r6, r0
	strh r2, [r1]
	str r6, [r1, #8]
_020B1E34:
	ldrh r0, [r1]
	tst r0, #0x8000
	bne _020B1E34
	ldr r0, _020B200C ; =0x021D6040
	ldr r2, _020B2018 ; =0x040002B4
	ldr r1, [r0, #0x18]
	ldr r7, [r2]
	cmp r1, #0
	beq _020B1E68
	ldr r1, [r0, #0x24]
	mov r0, r4
	mov r2, r7
	bl sub_020B476C
_020B1E68:
	ldr r0, _020B201C ; =_021108D8
	strb r8, [r5, #5]
	ldr r0, [r0]
	cmp r0, #0
	beq _020B1ED8
	mov r0, r6
	mov r1, r7
	mov r2, #0
	bl sub_020B41C8
	ldr r1, _020B200C ; =0x021D6040
	cmp r0, #0
	str r0, [r1, #0x28]
	beq _020B1EB4
	cmp r0, #1
	beq _020B1ECC
	cmp r0, #3
	moveq r0, #0x41
	streqb r0, [r5, #4]
	b _020B1ED8
_020B1EB4:
	ldr r2, [r1, #0xf00]
	add sp, sp, #4
	add r2, r2, #1
	str r2, [r1, #0xf00]
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_020B1ECC:
	ldrb r0, [r5, #5]
	orr r0, r0, #0x80
	strb r0, [r5, #5]
_020B1ED8:
	ldr r0, _020B201C ; =_021108D8
	ldr r0, [r0]
	cmp r0, #0
	bne _020B1F0C
	ldr r0, _020B200C ; =0x021D6040
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _020B1F0C
	ldrb r2, [r5, #5]
	mov r1, #0
	str r1, [r0, #8]
	orr r0, r2, #0x80
	strb r0, [r5, #5]
_020B1F0C:
	ldr r0, _020B200C ; =0x021D6040
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _020B1F30
	ldrb r2, [r5, #5]
	mov r1, #0
	str r1, [r0, #0x14]
	orr r0, r2, #0x80
	strb r0, [r5, #5]
_020B1F30:
	cmp r8, #2
	blt _020B1F78
	ldrb r0, [r5, #5]
	tst r0, #0x80
	beq _020B1F54
	ldr r0, _020B200C ; =0x021D6040
	mov r1, #0
	strh r1, [r0, #0x10]
	strb r1, [r0, #0x12]
_020B1F54:
	ldr r0, _020B200C ; =0x021D6040
	str r8, [sp]
	ldr r2, [r0, #0x24]
	ldr r3, _020B2020 ; =0x021D6050
	mov r1, r4
	sub r0, r4, #4
	mov r2, r2, lsr #1
	bl sub_020B1524
	b _020B1FBC
_020B1F78:
	cmp r8, #1
	bne _020B1F9C
	ldr r1, _020B200C ; =0x021D6040
	mov r0, r4
	ldr r2, [r1, #0x24]
	mov r1, r4
	mov r2, r2, lsr #1
	bl sub_020B2684
	b _020B1FBC
_020B1F9C:
	cmp r8, #0
	bne _020B1FBC
	ldr r1, _020B200C ; =0x021D6040
	mov r0, r4
	ldr r2, [r1, #0x24]
	mov r1, r4
	mov r2, r2, lsr #1
	bl sub_020B2784
_020B1FBC:
	ldr r1, _020B200C ; =0x021D6040
	ldr r0, _020B2024 ; =0x021D8498
	ldr r3, [r1, #4]
	mov r2, #1
	str r3, [r1, #0xf0c]
	ldrb r0, [r0]
	mvn r0, r2, lsl r0
	and r0, r3, r0
	str r0, [r1, #0xf0c]
	bl MATH_CountPopulation
	sub r0, r0, #1
	ldr r1, _020B200C ; =0x021D6040
	cmp r0, #7
	str r0, [r1, #0xf14]
	movgt r0, #0
	movle r2, #0
	movle r0, r5
	strle r2, [r1, #0xf10]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020B200C: .word 0x021D6040
_020B2010: .word 0x021D6680
_020B2014: .word 0x040002B0
_020B2018: .word 0x040002B4
_020B201C: .word _021108D8
_020B2020: .word 0x021D6050
_020B2024: .word 0x021D8498
	arm_func_end sub_020B1DAC

	arm_func_start sub_020B2028
sub_020B2028: ; 0x020B2028
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r4, _020B2204 ; =0x021D6040
	mov sl, r0
	ldr r0, [r4, #0x20]
	ldr r7, [sp, #0x28]
	mov sb, r1
	mov r8, r2
	mov fp, r3
	mov r5, #0
	cmp r0, #0
	moveq r0, r5
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, _020B2208 ; =0x021D6078
	mov r2, r5
_020B2060:
	ldr r0, [r1, #0x38]
	cmp sl, r0
	bne _020B207C
	ldr r1, _020B2208 ; =0x021D6078
	mov r0, #0x94
	mla r5, r2, r0, r1
	b _020B208C
_020B207C:
	add r2, r2, #1
	cmp r2, #3
	add r1, r1, #0x94
	blo _020B2060
_020B208C:
	cmp r5, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [sb, #4]
	cmp r0, #0x41
	bne _020B20C0
	ldrh r2, [sb, #6]
	mov r0, #0
	mov r1, #1
	str r2, [r5, #0x30]
	str r0, [r5, #0x4c]
	str r1, [r5, #0x6c]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B20C0:
	cmp r0, #0x40
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r0, [sb, #5]
	and r6, r0, #0x7f
	cmp r6, #5
	str r6, [r5, #0x24]
	movge r0, #0
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, _020B220C ; =0x021090B9
	ldr r0, _020B2210 ; =0x021090B8
	ldrb r2, [r1, r6, lsl #1]
	ldrb r1, [r0, r6, lsl #1]
	mov r0, #0x44
	mla r0, r1, r0, r2
	add r0, r0, #0xc
	cmp r8, r0
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	movne r0, #1
	movne r1, r0, lsl sl
	ldr r0, _020B2204 ; =0x021D6040
	moveq r1, #1
	ldr r0, [r0, #4]
	tst r0, r1
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl sub_020B40F4
	movs r4, r0
	bne _020B2174
	ldr r0, [r5, #0x34]
	bl sub_020B281C
	ldr r0, [r5, #0x34]
	bl sub_020B2430
	bl sub_020B40F4
	movs r4, r0
	bne _020B2168
	bl sub_020B288C
	bl sub_020B248C
	bl sub_020B40F4
	mov r4, r0
_020B2168:
	cmp r4, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B2174:
	add r0, r4, #0x5c
	add r0, r0, #0x400
	sub r2, r8, #0xc
	sub r1, r0, r2
	add r0, sb, #0xc
	str r1, [sp]
	bl MI_CpuCopy8
	ldr r0, [r5, #0x34]
	sub r1, r8, #0xc
	strb r0, [r4, #0x11]
	ldr r0, [sp]
	str r6, [r4, #0xc]
	str r0, [r4, #0x474]
	str r1, [r4, #0x14]
	str fp, [r4, #0x464]
	str r7, [r4, #0x468]
	strb sl, [r4, #0x10]
	ldrb r2, [sb, #5]
	mov r0, r5
	mov r1, r4
	and r2, r2, #0x80
	str r2, [r4, #0x45c]
	ldr r2, [sb, #8]
	str r2, [r4, #0x460]
	ldrh r2, [sb, #6]
	str r2, [r4, #0x18]
	bl sub_020B2C9C
	cmp r0, #0
	mov r0, r4
	bne _020B21F8
	bl sub_020B4128
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020B21F8:
	bl sub_020B24F8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B2204: .word 0x021D6040
_020B2208: .word 0x021D6078
_020B220C: .word 0x021090B9
_020B2210: .word 0x021090B8
	arm_func_end sub_020B2028

	arm_func_start sub_020B2214
sub_020B2214: ; 0x020B2214
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	bl sub_020B2580
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	bl OS_DisableInterrupts
	ldrb r6, [r4, #0x11]
	mov r7, r0
	mov r0, r6
	bl sub_020B2590
	mov r5, r0
	cmp r5, #0
	mov r4, #0
	ble _020B22D4
_020B224C:
	mov r0, r6
	bl sub_020B25A0
	mov r8, r0
	ldr r3, [r8, #0xc]
	cmp r3, #2
	blt _020B2278
	ldr r0, [r8, #0x474]
	ldr r2, [r8, #0x14]
	add r1, r8, #0x1c
	bl sub_020B14B8
	b _020B229C
_020B2278:
	cmp r3, #1
	ldr r0, [r8, #0x474]
	ldr r2, [r8, #0x14]
	bne _020B2294
	add r1, r8, #0x1c
	bl sub_020B2730
	b _020B229C
_020B2294:
	add r1, r8, #0x1c
	bl sub_020B27B0
_020B229C:
	add r1, r8, #0x1c
	mov r0, r8
	str r1, [r8, #0x474]
	bl sub_020B25F0
	ldrb r1, [r8, #0x11]
	mov r0, r8
	bl sub_020B290C
	cmp r0, #0
	bge _020B22C8
	mov r0, r8
	bl sub_020B4128
_020B22C8:
	add r4, r4, #1
	cmp r4, r5
	blt _020B224C
_020B22D4:
	mov r0, r7
	bl OS_RestoreInterrupts
	mov r0, r5
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end sub_020B2214

	arm_func_start sub_020B22E4
sub_020B22E4: ; 0x020B22E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _020B23E4 ; =0x021D6040
	ldr r0, [r1, #0x20]
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r1, #0xf08]
	cmp r0, #0
	bne _020B232C
	bl sub_020B1DAC
	ldr r1, _020B23E4 ; =0x021D6040
	cmp r0, #0
	str r0, [r1, #0xf08]
	ldrne r0, [r1, #0x18]
	cmpne r0, #0
	movne r0, #0
	moveq r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B232C:
	ldr r0, _020B23E8 ; =0x021D8498
	mov r5, #1
	ldr r0, [r0, #0x10]
	cmp r0, #2
	bne _020B2360
	ldr r3, [r1, #0xf10]
	ldr r0, _020B23EC ; =0x021090C2
	add r2, r3, #1
	str r2, [r1, #0xf10]
	ldr r1, [r1, #0xf14]
	add r1, r1, r1, lsl #1
	add r0, r0, r1
	ldrb r5, [r3, r0]
_020B2360:
	mov r4, #0
	mov r7, #0x80000000
	ldr r6, _020B23E4 ; =0x021D6040
	b _020B23D4
_020B2370:
	ldr r1, [r6, #0xf0c]
	mov r2, r1
	clz r2, r2
	cmp r2, #0x20
	beq _020B23DC
	mvn r0, r7, lsr r2
	and r0, r1, r0
	str r0, [r6, #0xf0c]
	rsb r0, r2, #0x1f
	ldr r1, [r6, #0xf08]
	ldr r2, [r6, #0xc]
	and r0, r0, #0xff
	bl ov00_021F97C0
	ldr r0, [r6, #0xf0c]
	cmp r0, #0
	bne _020B23D0
	ldr r0, _020B23E4 ; =0x021D6040
	mov r1, #0
	ldr r2, [r0, #0xf00]
	add r2, r2, #1
	str r2, [r0, #0xf00]
	str r1, [r0, #0xf08]
	str r1, [r0, #0xf0c]
	b _020B23DC
_020B23D0:
	add r4, r4, #1
_020B23D4:
	cmp r4, r5
	blt _020B2370
_020B23DC:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B23E4: .word 0x021D6040
_020B23E8: .word 0x021D8498
_020B23EC: .word 0x021090C2
	arm_func_end sub_020B22E4

	arm_func_start sub_020B23F0
sub_020B23F0: ; 0x020B23F0
	stmdb sp!, {r3, lr}
	bl OS_DisableInterrupts
	mov r3, #0
	ldr r1, _020B2428 ; =0x021D6F58
	mov r2, r3
	str r3, [r1, #4]
	str r3, [r1]
	ldr r1, _020B242C ; =0x021D6F60
_020B2410:
	str r2, [r1, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #3
	blt _020B2410
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B2428: .word 0x021D6F58
_020B242C: .word 0x021D6F60
	arm_func_end sub_020B23F0

	arm_func_start sub_020B2430
sub_020B2430: ; 0x020B2430
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	bl OS_DisableInterrupts
	mov r4, r0
	mov r0, r6
	bl sub_020B25A0
	movs r5, r0
	beq _020B2470
_020B2450:
	mov r0, r5
	bl sub_020B25F0
	mov r0, r5
	bl sub_020B4128
	mov r0, r6
	bl sub_020B25A0
	movs r5, r0
	bne _020B2450
_020B2470:
	ldr r1, _020B2488 ; =0x021D6F60
	mov r2, #0
	mov r0, r4
	str r2, [r1, r6, lsl #2]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B2488: .word 0x021D6F60
	arm_func_end sub_020B2430

	arm_func_start sub_020B248C
sub_020B248C: ; 0x020B248C
	stmdb sp!, {r3, r4, r5, lr}
	bl OS_DisableInterrupts
	ldr r1, _020B24F0 ; =0x021D6F58
	mov r4, r0
	ldr r5, [r1]
	cmp r5, #0
	beq _020B24BC
_020B24A8:
	mov r0, r5
	ldr r5, [r5, #8]
	bl sub_020B4128
	cmp r5, #0
	bne _020B24A8
_020B24BC:
	ldr r0, _020B24F0 ; =0x021D6F58
	mov r2, #0
	str r2, [r0]
	str r2, [r0, #4]
	ldr r0, _020B24F4 ; =0x021D6F60
	mov r1, r2
_020B24D4:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #3
	blt _020B24D4
	mov r0, r4
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B24F0: .word 0x021D6F58
_020B24F4: .word 0x021D6F60
	arm_func_end sub_020B248C

	arm_func_start sub_020B24F8
sub_020B24F8: ; 0x020B24F8
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r1, _020B2578 ; =0x021D6F58
	ldr r2, [r1]
	cmp r2, #0
	bne _020B2534
	str r4, [r1]
	mov r3, #0
	str r3, [r4, #4]
	ldr r2, [r1]
	str r3, [r2, #8]
	ldr r2, [r1]
	str r2, [r1, #4]
	b _020B2550
_020B2534:
	ldr r3, [r1, #4]
	mov r2, #0
	str r3, [r4, #4]
	str r2, [r4, #8]
	ldr r2, [r1, #4]
	str r4, [r2, #8]
	str r4, [r1, #4]
_020B2550:
	ldrb r2, [r4, #0x11]
	ldr r3, _020B257C ; =0x021D6F60
	ldr r1, [r3, r2, lsl #2]
	add r1, r1, #1
	str r1, [r3, r2, lsl #2]
	bl OS_RestoreInterrupts
	ldrb r1, [r4, #0x11]
	ldr r0, _020B257C ; =0x021D6F60
	ldr r0, [r0, r1, lsl #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B2578: .word 0x021D6F58
_020B257C: .word 0x021D6F60
	arm_func_end sub_020B24F8

	arm_func_start sub_020B2580
sub_020B2580: ; 0x020B2580
	ldr r0, _020B258C ; =0x021D6F58
	ldr r0, [r0]
	bx lr
	.align 2, 0
_020B258C: .word 0x021D6F58
	arm_func_end sub_020B2580

	arm_func_start sub_020B2590
sub_020B2590: ; 0x020B2590
	ldr r1, _020B259C ; =0x021D6F60
	ldr r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_020B259C: .word 0x021D6F60
	arm_func_end sub_020B2590

	arm_func_start sub_020B25A0
sub_020B25A0: ; 0x020B25A0
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _020B25EC ; =0x021D6F58
	mov r5, r0
	ldr r4, [r1]
	bl OS_DisableInterrupts
	cmp r4, #0
	beq _020B25E0
_020B25BC:
	ldrb r1, [r4, #0x11]
	cmp r1, r5
	bne _020B25D4
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r3, r4, r5, pc}
_020B25D4:
	ldr r4, [r4, #8]
	cmp r4, #0
	bne _020B25BC
_020B25E0:
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B25EC: .word 0x021D6F58
	arm_func_end sub_020B25A0

	arm_func_start sub_020B25F0
sub_020B25F0: ; 0x020B25F0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r2, [r4, #4]
	cmp r2, #0
	ldrne r1, [r4, #8]
	strne r1, [r2, #8]
	bne _020B2628
	ldr r2, [r4, #8]
	ldr r1, _020B267C ; =0x021D6F58
	cmp r2, #0
	str r2, [r1]
	movne r1, #0
	strne r1, [r2, #4]
_020B2628:
	ldr r2, [r4, #8]
	cmp r2, #0
	ldrne r1, [r4, #4]
	strne r1, [r2, #4]
	bne _020B2654
	ldr r2, [r4, #4]
	ldr r1, _020B267C ; =0x021D6F58
	cmp r2, #0
	str r2, [r1, #4]
	movne r1, #0
	strne r1, [r2, #8]
_020B2654:
	ldrb r2, [r4, #0x11]
	ldr r3, _020B2680 ; =0x021D6F60
	ldr r1, [r3, r2, lsl #2]
	sub r1, r1, #1
	str r1, [r3, r2, lsl #2]
	bl OS_RestoreInterrupts
	ldrb r1, [r4, #0x11]
	ldr r0, _020B2680 ; =0x021D6F60
	ldr r0, [r0, r1, lsl #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B267C: .word 0x021D6F58
_020B2680: .word 0x021D6F60
	arm_func_end sub_020B25F0

	arm_func_start sub_020B2684
sub_020B2684: ; 0x020B2684
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r7, #0
	cmp r2, #0
	ldmlsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr ip, _020B2728 ; =0x00001FDF
	ldr r3, _020B272C ; =_021108DC
	mov lr, #0xff
	mov r4, #0x7f
_020B26A4:
	mov r5, r7, lsl #1
	ldrsh r5, [r1, r5]
	mov fp, r3
	movs sl, r5, asr #2
	movmi r6, r4
	ldr r5, _020B2728 ; =0x00001FDF
	rsbmi sl, sl, #0
	movpl r6, lr
	cmp sl, r5
	movgt sl, ip
	mov r5, #0
	add sb, sl, #0x21
_020B26D4:
	ldr r8, [fp], #4
	cmp sb, r8
	ble _020B26F0
	add r5, r5, #1
	cmp r5, #8
	blt _020B26D4
	mov r5, #8
_020B26F0:
	cmp r5, #8
	eorge r5, r6, #0x7f
	bge _020B2714
	add sb, sl, #0x21
	add r8, r5, #1
	mov r8, sb, asr r8
	and r8, r8, #0xf
	orr r5, r8, r5, lsl #4
	eor r5, r5, r6
_020B2714:
	strb r5, [r0, r7]
	add r7, r7, #1
	cmp r7, r2
	blo _020B26A4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B2728: .word 0x00001FDF
_020B272C: .word _021108DC
	arm_func_end sub_020B2684

	arm_func_start sub_020B2730
sub_020B2730: ; 0x020B2730
	stmdb sp!, {r4, lr}
	mov r4, #0
	cmp r2, #0
	ldmlsia sp!, {r4, pc}
_020B2740:
	ldrb r3, [r0, r4]
	mvn lr, r3
	mov r3, lr, lsl #0x1c
	mov ip, r3, lsr #0x19
	and r3, lr, #0x70
	add ip, ip, #0x84
	mov r3, r3, asr #4
	mov r3, ip, lsl r3
	tst lr, #0x80
	rsbne ip, r3, #0x84
	subeq ip, r3, #0x84
	mov r3, r4, lsl #1
	add r4, r4, #1
	strh ip, [r1, r3]
	cmp r4, r2
	blo _020B2740
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B2730

	arm_func_start sub_020B2784
sub_020B2784: ; 0x020B2784
	cmp r2, #0
	mov ip, #0
	bxls lr
_020B2790:
	mov r3, ip, lsl #1
	ldrsh r3, [r1, r3]
	mov r3, r3, asr #8
	strb r3, [r0, ip]
	add ip, ip, #1
	cmp ip, r2
	blo _020B2790
	bx lr
	arm_func_end sub_020B2784

	arm_func_start sub_020B27B0
sub_020B27B0: ; 0x020B27B0
	stmdb sp!, {r3, lr}
	cmp r2, #0
	mov lr, #0
	ldmlsia sp!, {r3, pc}
_020B27C0:
	ldrsb ip, [r0, lr]
	mov r3, lr, lsl #1
	add lr, lr, #1
	mov ip, ip, lsl #8
	strh ip, [r1, r3]
	cmp lr, r2
	blo _020B27C0
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B27B0

	arm_func_start sub_020B27E0
sub_020B27E0: ; 0x020B27E0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r3, _020B2810 ; =0x021D6F84
	mov ip, #0
	ldr r1, _020B2814 ; =0x021D6F78
	ldr r2, _020B2818 ; =0x021D6F6C
	str ip, [r3, r4, lsl #2]
	str ip, [r2, r4, lsl #2]
	str ip, [r1, r4, lsl #2]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B2810: .word 0x021D6F84
_020B2814: .word 0x021D6F78
_020B2818: .word 0x021D6F6C
	arm_func_end sub_020B27E0

	arm_func_start sub_020B281C
sub_020B281C: ; 0x020B281C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r0
	bl OS_DisableInterrupts
	ldr r7, _020B2880 ; =0x021D6F6C
	mov r4, r0
	ldr r0, [r7, r5, lsl #2]
	cmp r0, #0
	beq _020B2860
	mov r6, #0
_020B2840:
	ldr r1, [r0, #8]
	str r1, [r7, r5, lsl #2]
	cmp r1, #0
	strne r6, [r1, #4]
	bl sub_020B4128
	ldr r0, [r7, r5, lsl #2]
	cmp r0, #0
	bne _020B2840
_020B2860:
	ldr r2, _020B2884 ; =0x021D6F84
	mov r3, #0
	ldr r1, _020B2888 ; =0x021D6F78
	mov r0, r4
	str r3, [r2, r5, lsl #2]
	str r3, [r1, r5, lsl #2]
	bl OS_RestoreInterrupts
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B2880: .word 0x021D6F6C
_020B2884: .word 0x021D6F84
_020B2888: .word 0x021D6F78
	arm_func_end sub_020B281C

	arm_func_start sub_020B288C
sub_020B288C: ; 0x020B288C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	bl OS_DisableInterrupts
	mov r6, #0
	mov r5, r0
	mov sl, r6
	ldr r4, _020B2900 ; =0x021D6F6C
	mov sb, r6
	ldr r8, _020B2904 ; =0x021D6F84
	ldr r7, _020B2908 ; =0x021D6F78
	b _020B28EC
_020B28B4:
	ldr r0, [r4, r6, lsl #2]
	cmp r0, #0
	beq _020B28E0
_020B28C0:
	ldr r1, [r0, #8]
	str r1, [r4, r6, lsl #2]
	cmp r1, #0
	strne sl, [r1, #4]
	bl sub_020B4128
	ldr r0, [r4, r6, lsl #2]
	cmp r0, #0
	bne _020B28C0
_020B28E0:
	str sb, [r8, r6, lsl #2]
	str sb, [r7, r6, lsl #2]
	add r6, r6, #1
_020B28EC:
	cmp r6, #3
	blt _020B28B4
	mov r0, r5
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020B2900: .word 0x021D6F6C
_020B2904: .word 0x021D6F84
_020B2908: .word 0x021D6F78
	arm_func_end sub_020B288C

	arm_func_start sub_020B290C
sub_020B290C: ; 0x020B290C
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #3
	mvnhs r0, #0
	ldmhsia sp!, {r3, r4, r5, pc}
	bl OS_DisableInterrupts
	ldr ip, _020B2A00 ; =0x021D6F6C
	ldr r1, [ip, r4, lsl #2]
	cmp r1, #0
	bne _020B2964
	str r5, [ip, r4, lsl #2]
	mov r3, #0
	str r3, [r5, #4]
	ldr r2, [ip, r4, lsl #2]
	ldr r1, _020B2A04 ; =0x021D6F84
	str r3, [r2, #8]
	ldr r2, [ip, r4, lsl #2]
	str r2, [r1, r4, lsl #2]
	b _020B29E0
_020B2964:
	ldr r1, _020B2A04 ; =0x021D6F84
	ldr r3, [r1, r4, lsl #2]
	cmp r3, #0
	beq _020B29C0
	ldr r2, [r5, #0x18]
_020B2978:
	ldr r1, [r3, #0x18]
	cmp r1, r2
	bhs _020B29B4
	str r3, [r5, #4]
	ldr r1, [r3, #8]
	ldr r2, _020B2A04 ; =0x021D6F84
	str r1, [r5, #8]
	str r5, [r3, #8]
	ldr r1, [r5, #8]
	cmp r1, #0
	strne r5, [r1, #4]
	ldr r1, [r2, r4, lsl #2]
	cmp r3, r1
	streq r5, [r2, r4, lsl #2]
	b _020B29E0
_020B29B4:
	ldr r3, [r3, #4]
	cmp r3, #0
	bne _020B2978
_020B29C0:
	mov r1, #0
	ldr r2, _020B2A00 ; =0x021D6F6C
	str r1, [r5, #4]
	ldr r1, [r2, r4, lsl #2]
	str r1, [r5, #8]
	ldr r1, [r2, r4, lsl #2]
	str r5, [r1, #4]
	str r5, [r2, r4, lsl #2]
_020B29E0:
	ldr r2, _020B2A08 ; =0x021D6F78
	ldr r1, [r2, r4, lsl #2]
	add r1, r1, #1
	str r1, [r2, r4, lsl #2]
	bl OS_RestoreInterrupts
	ldr r0, _020B2A08 ; =0x021D6F78
	ldr r0, [r0, r4, lsl #2]
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B2A00: .word 0x021D6F6C
_020B2A04: .word 0x021D6F84
_020B2A08: .word 0x021D6F78
	arm_func_end sub_020B290C

	arm_func_start sub_020B2A0C
sub_020B2A0C: ; 0x020B2A0C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r1, _020B2A44 ; =0x021D6F6C
	ldr r1, [r1, r4, lsl #2]
	cmp r1, #0
	beq _020B2A38
	bl OS_RestoreInterrupts
	ldr r0, _020B2A44 ; =0x021D6F6C
	ldr r0, [r0, r4, lsl #2]
	ldmia sp!, {r4, pc}
_020B2A38:
	bl OS_RestoreInterrupts
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B2A44: .word 0x021D6F6C
	arm_func_end sub_020B2A0C

	arm_func_start sub_020B2A48
sub_020B2A48: ; 0x020B2A48
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	ldr ip, _020B2AA4 ; =0x021D6F6C
	ldr r1, [ip, r4, lsl #2]
	cmp r1, #0
	beq _020B2A94
	ldr r2, _020B2AA8 ; =0x021D6F78
	ldr r3, [r1, #8]
	ldr r1, [r2, r4, lsl #2]
	str r3, [ip, r4, lsl #2]
	sub r1, r1, #1
	str r1, [r2, r4, lsl #2]
	cmp r3, #0
	movne r1, #0
	strne r1, [r3, #4]
	ldreq r1, _020B2AAC ; =0x021D6F84
	moveq r2, #0
	streq r2, [r1, r4, lsl #2]
_020B2A94:
	bl OS_RestoreInterrupts
	ldr r0, _020B2AA8 ; =0x021D6F78
	ldr r0, [r0, r4, lsl #2]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B2AA4: .word 0x021D6F6C
_020B2AA8: .word 0x021D6F78
_020B2AAC: .word 0x021D6F84
	arm_func_end sub_020B2A48

	arm_func_start sub_020B2AB0
sub_020B2AB0: ; 0x020B2AB0
	ldr r1, _020B2ABC ; =0x021D6F78
	ldr r0, [r1, r0, lsl #2]
	bx lr
	.align 2, 0
_020B2ABC: .word 0x021D6F78
	arm_func_end sub_020B2AB0

	arm_func_start sub_020B2AC0
sub_020B2AC0: ; 0x020B2AC0
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r1, #0
	mov r2, #0x28
	mov r6, r0
	bl MI_CpuFill8
	ldr r0, _020B2B48 ; =0x000134DF
	mov r1, #0
	str r0, [r6, #4]
	str r1, [r6, #0x28]
	str r1, [r6, #0x2c]
	str r5, [r6, #0x34]
	str r4, [r6, #0x38]
	str r1, [r6, #0x7c]
	str r1, [r6, #0x80]
	str r1, [r6, #0x84]
	str r1, [r6, #0x88]
	str r0, [r6, #0x8c]
	str r1, [r6, #0x90]
	str r1, [r6, #0x4c]
	str r1, [r6, #0x44]
	str r1, [r6, #0x48]
	str r1, [r6, #0x6c]
	str r1, [r6, #0x70]
	str r1, [r6, #0x50]
	str r1, [r6, #0x54]
	str r1, [r6, #0x58]
	mov r0, #1
	str r0, [r6, #0x5c]
	str r1, [r6, #0x3c]
	str r1, [r6, #0x40]
	str r1, [r6, #0x30]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B2B48: .word 0x000134DF
	arm_func_end sub_020B2AC0

	arm_func_start sub_020B2B4C
sub_020B2B4C: ; 0x020B2B4C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _020B2B6C
	bl sub_020B4128
	mov r0, #0
	str r0, [r4, #0x3c]
_020B2B6C:
	mvn r0, #0
	str r0, [r4, #0x38]
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B2B4C

	arm_func_start sub_020B2B78
sub_020B2B78: ; 0x020B2B78
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r0, [r5, #0x3c]
	mov r4, r1
	cmp r0, #0
	beq _020B2B94
	bl sub_020B4128
_020B2B94:
	str r4, [r5, #0x3c]
	ldr r0, [r5, #0x34]
	bl sub_020B2A48
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end sub_020B2B78

	arm_func_start sub_020B2BA4
sub_020B2BA4: ; 0x020B2BA4
	ldr r2, _020B2BC0 ; =0x00010001
	strh r1, [r0, #0x68]
	str r2, [r0, #0x64]
	mov r1, #0
	str r1, [r0, #0x60]
	str r1, [r0, #0x5c]
	bx lr
	.align 2, 0
_020B2BC0: .word 0x00010001
	arm_func_end sub_020B2BA4

	arm_func_start sub_020B2BC4
sub_020B2BC4: ; 0x020B2BC4
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	ldrh ip, [r6, #0x68]
	mov r4, r2
	ldr r3, _020B2C94 ; =0x00000BB8
	sub r2, r4, ip
	mov r2, r2, lsl #0x10
	mov r5, r1
	cmp r3, r2, lsr #16
	mov r2, r2, lsr #0x10
	bls _020B2C08
	cmp r4, ip
	ldrlo r0, [r6, #0x60]
	addlo r0, r0, #0x10000
	strlo r0, [r6, #0x60]
	strh r4, [r6, #0x68]
	b _020B2C80
_020B2C08:
	ldr r1, _020B2C98 ; =0x0000FF9C
	cmp r2, r1
	bhi _020B2C54
	ldr r1, [r6, #0x64]
	cmp r4, r1
	bne _020B2C3C
	mov r1, r4
	bl sub_020B2BA4
	sub r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r6, #0x54]
	b _020B2C80
_020B2C3C:
	add r0, r4, #1
	mov r0, r0, lsl #0x10
	mov r0, r0, lsr #0x10
	str r0, [r6, #0x64]
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020B2C54:
	ldr r0, [r6, #0x54]
	ldr r1, [r6, #0x60]
	add r0, r0, #0x39c
	add r1, r4, r1
	add r0, r0, #0xfc00
	cmp r1, r0
	bls _020B2C80
	sub r0, r1, #0x10000
	str r0, [r5, #0x18]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020B2C80:
	ldr r1, [r6, #0x60]
	mov r0, #1
	add r1, r4, r1
	str r1, [r5, #0x18]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B2C94: .word 0x00000BB8
_020B2C98: .word 0x0000FF9C
	arm_func_end sub_020B2BC4

	arm_func_start sub_020B2C9C
sub_020B2C9C: ; 0x020B2C9C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	ldr r2, [r7, #0x5c]
	mov r6, r1
	cmp r2, #0
	mov r5, #0
	beq _020B2CCC
	ldr r1, [r6, #0x18]
	mov r1, r1, lsl #0x10
	mov r1, r1, lsr #0x10
	bl sub_020B2BA4
	b _020B2D64
_020B2CCC:
	ldr r2, [r6, #0x18]
	mov r2, r2, lsl #0x10
	mov r2, r2, lsr #0x10
	bl sub_020B2BC4
	cmp r0, #0
	bne _020B2CF8
	ldr r1, [r7, #0x14]
	mov r0, r5
	add r1, r1, #1
	str r1, [r7, #0x14]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B2CF8:
	ldr r0, [r6, #0x18]
	str r0, [r7, #0x10]
	ldr r1, [r6, #0x18]
	ldr r2, [r7, #0x54]
	cmp r2, r1
	bne _020B2D24
	ldr r1, [r7, #0x14]
	mov r0, r5
	add r1, r1, #1
	str r1, [r7, #0x14]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B2D24:
	add r0, r2, #1
	cmp r0, r1
	beq _020B2D64
	ldr r0, [r6, #0x45c]
	cmp r0, #0
	bne _020B2D64
	subs r0, r1, r2
	rsbmi r0, r0, #0
	cmp r0, #0x64
	strgt r1, [r7, #0x54]
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r2, r1
	ldrhi r0, [r7, #0x1c]
	addhi r0, r0, #1
	strhi r0, [r7, #0x1c]
_020B2D64:
	ldr r0, [r6, #0x18]
	str r0, [r7, #0x54]
	ldr r0, [r7, #0x4c]
	cmp r0, #0
	bne _020B2D9C
	ldr r1, [r6, #0x460]
	add r0, r6, #0x64
	str r1, [r7, #0x4c]
	add r1, r0, #0x400
	add r0, r7, #0x44
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	mov r0, #0
	str r0, [r7, #0x6c]
_020B2D9C:
	ldr r2, [r6, #0x460]
	ldr r0, [r7, #0x4c]
	ldr r3, [r6, #0x464]
	ldr r1, [r7, #0x44]
	sub r0, r2, r0
	ldr r2, [r7, #0x80]
	mov r0, r0, lsl #6
	subs r1, r3, r1
	subs r4, r0, r1
	cmp r2, #0
	beq _020B2DD4
	ldr r1, [r6, #0x45c]
	cmp r1, #0
	beq _020B2DDC
_020B2DD4:
	str r4, [r7, #0x80]
	b _020B2E50
_020B2DDC:
	str r4, [r7, #0x80]
	subs r1, r4, r2
	ldr r2, [r7, #0x7c]
	rsbmi r1, r1, #0
	add r2, r2, #0x318
	add r2, r2, #0x8800
	mov ip, r2, lsl #1
	ldr r3, _020B302C ; =0x0000CC8D
	mov r2, #0
	adds r3, ip, r3
	mov lr, r1, asr #0x1f
	adc r2, r2, ip, asr #31
	cmp lr, r2
	cmpeq r1, r3
	bls _020B2E30
	ldr ip, _020B3030 ; =0x75CA82CB
	mov r2, r1, lsr #0x1f
	smull r3, lr, ip, r1
	add lr, r2, lr, asr #14
	add r2, lr, #2
	str r2, [r7, #0x84]
_020B2E30:
	ldr r2, [r7, #0x84]
	cmp r2, #0
	bgt _020B2E50
	ldr r2, [r7, #0x7c]
	sub r1, r1, r2
	add r1, r2, r1, asr #4
	str r1, [r7, #0x7c]
	str r1, [r7, #0x18]
_020B2E50:
	ldr r2, [r7, #0x44]
	ldr r3, [r7, #4]
	ldr r1, [r7, #0x48]
	adds r2, r0, r2
	adc r0, r1, #0
	adds r1, r3, r2
	str r1, [r6, #0x46c]
	adc r0, r0, #0
	str r0, [r6, #0x470]
	bl OS_GetTick
	ldr ip, [r6, #0x46c]
	ldr r2, _020B3034 ; =0x00008B18
	ldr lr, [r6, #0x470]
	adds r6, ip, r2
	adc r3, lr, #0
	cmp r3, r1
	mov r3, #0
	cmpeq r6, r0
	movlo r0, r3
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r6, _020B3038 ; =0x0007FD88
	adds r6, r0, r6
	adc r0, r1, r3
	cmp lr, r0
	cmpeq ip, r6
	movhi r0, r3
	ldmhiia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r7, #0x84]
	cmp r0, #0
	bgt _020B3018
	ldr r0, [r7, #0x7c]
	ldr r6, _020B3030 ; =0x75CA82CB
	add ip, r0, r0, lsl #1
	smull r1, r0, r6, ip
	ldr r6, [r7, #0x8c]
	mov r1, ip, lsr #0x1f
	cmp ip, r6
	add r0, r1, r0, asr #14
	bls _020B2F24
	add r1, r0, #1
	mul r6, r1, r2
	mul r1, r0, r2
	add r0, r6, #0xdf
	add r2, r0, #0x13400
	ldr r0, _020B303C ; =0xFFFF2F5C
	add r1, r1, #0xdf
	str r2, [r7, #0x8c]
	add r0, r2, r0
	str r0, [r7, #0x88]
	add r0, r1, #0x13400
	str r0, [r7, #4]
	str r3, [r7, #0x90]
	b _020B2F84
_020B2F24:
	ldr r1, [r7, #0x88]
	cmp ip, r1
	bge _020B2F84
	ldr r1, [r7, #0x90]
	add r1, r1, #1
	str r1, [r7, #0x90]
	cmp r1, #0x46
	bls _020B2F84
	add r1, r0, #1
	mul ip, r1, r2
	add r1, ip, #0xdf
	add r1, r1, #0x13400
	ldr r6, _020B3040 ; =0xFFFFBA74
	str r1, [r7, #0x8c]
	ldr r1, _020B3034 ; =0x00008B18
	mlas r2, r0, r2, r6
	str r2, [r7, #0x88]
	mul r1, r0, r1
	add r0, r1, #0xdf
	strmi r3, [r7, #0x88]
	add r0, r0, #0x13400
	mov r2, #0
	str r0, [r7, #4]
	str r2, [r7, #0x90]
_020B2F84:
	ldr r1, [r7, #4]
	ldr r0, _020B3044 ; =0x00068520
	cmp r1, r0
	strhi r0, [r7, #4]
	ldr r0, [r7, #0x6c]
	cmp r0, #0x10
	bhs _020B2FB4
	add r0, r0, #1
	str r0, [r7, #0x6c]
	str r4, [r7, #0x74]
	str r4, [r7, #0x78]
	b _020B2FD0
_020B2FB4:
	ldr r0, [r7, #0x74]
	rsb r0, r0, r0, lsl #5
	add r1, r4, r0
	mov r0, r1, asr #4
	add r0, r1, r0, lsr #27
	mov r0, r0, asr #5
	str r0, [r7, #0x74]
_020B2FD0:
	ldr r2, [r7, #0x78]
	ldr r1, [r7, #0x74]
	ldr r0, _020B3048 ; =0x00008701
	sub r1, r2, r1
	cmp r1, r0
	mvn r0, #0x8700
	movgt r5, #1
	str r1, [r7, #0xc]
	cmp r1, r0
	bge _020B3008
	ldr r1, [r7, #0x70]
	add r5, r0, #0x8700
	add r0, r1, #1
	str r0, [r7, #0x70]
_020B3008:
	cmp r5, #0
	movne r0, #0
	strne r0, [r7, #0x6c]
	strne r0, [r7, #0x4c]
_020B3018:
	ldr r1, [r7, #0x84]
	mov r0, #1
	sub r1, r1, #1
	str r1, [r7, #0x84]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B302C: .word 0x0000CC8D
_020B3030: .word 0x75CA82CB
_020B3034: .word 0x00008B18
_020B3038: .word 0x0007FD88
_020B303C: .word 0xFFFF2F5C
_020B3040: .word 0xFFFFBA74
_020B3044: .word 0x00068520
_020B3048: .word 0x00008701
	arm_func_end sub_020B2C9C

	arm_func_start sub_020B304C
sub_020B304C: ; 0x020B304C
	stmdb sp!, {r3, lr}
	ldr r1, _020B3070 ; =0x021D8498
	ldr r1, [r1, #0x10]
	cmp r1, #0
	cmpne r1, #2
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_020B35EC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B3070: .word 0x021D8498
	arm_func_end sub_020B304C

	arm_func_start sub_020B3074
sub_020B3074: ; 0x020B3074
	stmdb sp!, {r3, lr}
	ldr r2, _020B3124 ; =0x021D6F90
	mov ip, #0
	cmp r0, #0
	ldr lr, [r2, #0x14]
	moveq r0, ip
	ldmeqia sp!, {r3, pc}
	ldr r1, _020B3128 ; =0x021D8498
	ldr r1, [r1, #0x10]
	cmp r1, #2
	bne _020B30B4
	ldr r1, _020B312C ; =0x021D6FCC
	cmp r0, r1
	streq ip, [r2, #0x3c]
	mov r0, #1
	ldmia sp!, {r3, pc}
_020B30B4:
	cmp lr, #0
	beq _020B311C
_020B30BC:
	cmp lr, r0
	bne _020B310C
	mov r3, #0
	str r3, [r0]
	cmp ip, #0
	ldrne r1, [r0, #0x14]
	strne r1, [ip, #0x14]
	bne _020B30F4
	ldr r2, [lr, #0x14]
	cmp r2, #0
	ldrne r1, _020B3124 ; =0x021D6F90
	strne r2, [r1, #0x14]
	ldreq r1, _020B3124 ; =0x021D6F90
	streq r3, [r1, #0x14]
_020B30F4:
	ldr r1, _020B3124 ; =0x021D6F90
	ldr r2, [r1, #0x10]
	str r2, [r0, #0x14]
	str r0, [r1, #0x10]
	mov r0, #1
	ldmia sp!, {r3, pc}
_020B310C:
	mov ip, lr
	ldr lr, [lr, #0x14]
	cmp lr, #0
	bne _020B30BC
_020B311C:
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B3124: .word 0x021D6F90
_020B3128: .word 0x021D8498
_020B312C: .word 0x021D6FCC
	arm_func_end sub_020B3074

	arm_func_start sub_020B3130
sub_020B3130: ; 0x020B3130
	stmdb sp!, {r4, r5, r6, lr}
	movs r5, r0
	mov r4, r1
	mov r6, r2
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r3, #0x10
	mvnlo r0, #0
	ldmloia sp!, {r4, r5, r6, pc}
	ldr r1, _020B31DC ; =0x021D8498
	ldr r1, [r1, #0xc]
	cmp r1, #1
	mvneq r0, #2
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r4, #0
	blt _020B3178
	cmp r4, #5
	blt _020B3180
_020B3178:
	mvn r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_020B3180:
	mov r3, #0xff
	mov r1, r6
	and r2, r4, #0xff
	strb r3, [r6, #4]
	bl sub_020B393C
	mov r0, r5
	mov r1, r6
	bl sub_020B3AA8
	cmp r0, #0
	mvneq r0, #2
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, _020B31DC ; =0x021D8498
	ldr r0, [r0, #0x10]
	cmp r0, #1
	cmpeq r4, #0
	bne _020B31D4
	mov r0, r5
	bl sub_020B3A5C
	cmp r0, #0
	mvneq r0, #2
	ldmeqia sp!, {r4, r5, r6, pc}
_020B31D4:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B31DC: .word 0x021D8498
	arm_func_end sub_020B3130

	arm_func_start sub_020B31E0
sub_020B31E0: ; 0x020B31E0
	stmdb sp!, {r3, lr}
	ldr r2, _020B3200 ; =0x021D8498
	ldr r2, [r2, #0x10]
	cmp r2, #2
	mvneq r0, #2
	ldmeqia sp!, {r3, pc}
	bl sub_020B3658
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B3200: .word 0x021D8498
	arm_func_end sub_020B31E0

	arm_func_start sub_020B3204
sub_020B3204: ; 0x020B3204
	stmdb sp!, {r4, r5, r6, lr}
	movs r5, r0
	mov r6, r1
	mov r4, r2
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r3, #0x10
	mvnlo r0, #0
	ldmloia sp!, {r4, r5, r6, pc}
	cmp r6, #0
	blt _020B3238
	cmp r6, #6
	blt _020B3240
_020B3238:
	mvn r0, #2
	ldmia sp!, {r4, r5, r6, pc}
_020B3240:
	mov r3, #0
	mov r1, r4
	and r2, r6, #0xff
	strb r3, [r4, #4]
	bl sub_020B393C
	cmp r6, #0
	bne _020B329C
	ldr r0, _020B32B8 ; =0x021D8498
	ldr r0, [r0, #0x10]
	cmp r0, #1
	ldreq r0, [r5, #0xc]
	cmpeq r0, #4
	bne _020B3288
	mov r0, r5
	bl sub_020B3A5C
	cmp r0, #0
	mvneq r0, #2
	ldmeqia sp!, {r4, r5, r6, pc}
_020B3288:
	ldrb r1, [r5, #4]
	mov r0, #1
	cmp r1, #0
	movne r0, r0, lsl r1
	str r0, [r5, #8]
_020B329C:
	mov r0, r5
	mov r1, r4
	bl sub_020B3AA8
	cmp r0, #0
	mvneq r0, #2
	movne r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B32B8: .word 0x021D8498
	arm_func_end sub_020B3204

	arm_func_start sub_020B32BC
sub_020B32BC: ; 0x020B32BC
	stmdb sp!, {r3, lr}
	ldr r2, _020B32DC ; =0x021D8498
	ldr r2, [r2, #0x10]
	cmp r2, #2
	mvneq r0, #2
	ldmeqia sp!, {r3, pc}
	bl sub_020B369C
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B32DC: .word 0x021D8498
	arm_func_end sub_020B32BC

	arm_func_start sub_020B32E0
sub_020B32E0: ; 0x020B32E0
	stmdb sp!, {r4, lr}
	ldr r2, _020B3390 ; =0x021D8498
	mov r4, r0
	ldr r1, [r2, #0x10]
	cmp r1, #3
	mvnne r0, #1
	ldmneia sp!, {r4, pc}
	ldr r1, _020B3394 ; =0x021D6F90
	ldr r1, [r1]
	cmp r1, #3
	mvneq r0, #5
	ldmeqia sp!, {r4, pc}
	ldrb r1, [r2]
	cmp r4, r1
	mvneq r0, #0
	ldmeqia sp!, {r4, pc}
	bl sub_020B3B30
	cmp r0, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	mov r0, r4
	bl sub_020B304C
	movs r2, r0
	mvneq r0, #0
	ldmeqia sp!, {r4, pc}
	strb r4, [r2, #4]
	mov r0, #1
	strb r4, [r2, #5]
	mov r3, #2
	mov r1, r0, lsl r4
	str r3, [r2, #0xc]
	ldr r0, _020B3390 ; =0x021D8498
	str r1, [r2, #8]
	ldr r3, [r0, #8]
	ldr ip, [r0, #4]
	mov r0, r4
	mov r1, #7
	blx ip
	ldr r1, _020B3394 ; =0x021D6F90
	mov r0, #0
	ldr r2, [r1]
	add r2, r2, #1
	str r2, [r1]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B3390: .word 0x021D8498
_020B3394: .word 0x021D6F90
	arm_func_end sub_020B32E0

	arm_func_start sub_020B3398
sub_020B3398: ; 0x020B3398
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	ldrne r1, [r4, #4]
	cmpne r1, #0
	beq _020B33BC
	cmp r1, #8
	bls _020B33C4
_020B33BC:
	mov r0, #0
	ldmia sp!, {r4, pc}
_020B33C4:
	ldr r1, _020B3490 ; =0x021D6F90
	mov r2, #0x18
	str r0, [r1, #0x10]
	ldr r3, [r4, #4]
	mov r1, #0
	mul r2, r3, r2
	bl MI_CpuFill8
	ldr r0, _020B3494 ; =0x021D6FCC
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	ldr r0, _020B3498 ; =0x021D6FB4
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	ldr r3, [r4, #4]
	mov ip, #0
	subs r0, r3, #1
	beq _020B3444
	ldr r1, _020B3490 ; =0x021D6F90
	mov lr, ip
	mov r0, #0x18
_020B341C:
	ldr r2, [r1, #0x10]
	add ip, ip, #1
	mla r3, ip, r0, r2
	add r2, r2, lr
	str r3, [r2, #0x14]
	ldr r3, [r4, #4]
	add lr, lr, #0x18
	sub r2, r3, #1
	cmp ip, r2
	blo _020B341C
_020B3444:
	ldr r1, _020B3490 ; =0x021D6F90
	mov r0, #0x18
	ldr r2, [r1, #0x10]
	mov r4, #0
	mla r0, r3, r0, r2
	str r4, [r0, #-4]
	str r4, [r1, #0x14]
	str r4, [r1, #4]
	ldr r0, _020B349C ; =0x021D8498
	str r4, [r1]
	ldr r3, _020B34A0 ; =OS_GetTick
	str r4, [r0, #0x14]
	ldr r2, _020B34A4 ; =0x5D588B65
	str r3, [r1, #0x18]
	ldr r0, _020B34A8 ; =0x00269EC3
	str r2, [r1, #0x1c]
	str r0, [r1, #0x20]
	mov r0, #1
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B3490: .word 0x021D6F90
_020B3494: .word 0x021D6FCC
_020B3498: .word 0x021D6FB4
_020B349C: .word 0x021D8498
_020B34A0: .word OS_GetTick
_020B34A4: .word 0x5D588B65
_020B34A8: .word 0x00269EC3
	arm_func_end sub_020B3398

	arm_func_start sub_020B34AC
sub_020B34AC: ; 0x020B34AC
	ldr r0, _020B34C0 ; =0x021D6F90
	mov r1, #0
	str r1, [r0, #0x14]
	str r1, [r0, #0x10]
	bx lr
	.align 2, 0
_020B34C0: .word 0x021D6F90
	arm_func_end sub_020B34AC

	arm_func_start sub_020B34C4
sub_020B34C4: ; 0x020B34C4
	stmdb sp!, {r3, r4, r5, lr}
	bl OS_GetTick
	ldr r2, _020B3560 ; =0x021D8498
	ldr r3, [r2, #0x10]
	cmp r3, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r2, [r2, #0xc]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, _020B3564 ; =0x021D6F90
	mov ip, #0
	ldr r5, [r3, #0xc]
	ldr r4, [r3, #8]
	cmp r5, #0
	cmpeq r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r2, _020B3568 ; =_021108FC
	subs r4, r0, r4
	ldr lr, [r2]
	ldr r0, [r2, #4]
	sbc r1, r1, r5
	cmp r1, r0
	cmpeq r4, lr
	ldmlsia sp!, {r3, r4, r5, pc}
	str ip, [r3, #8]
	str ip, [r3, #0xc]
	str ip, [r3, #0x3c]
	mov r0, ip
	str ip, [r3, #0x48]
	bl sub_020B37C8
	ldr r1, _020B3560 ; =0x021D8498
	ldr r0, _020B3564 ; =0x021D6F90
	ldr r3, [r1, #8]
	ldrb r0, [r0, #0x40]
	ldr ip, [r1, #4]
	ldr r2, _020B356C ; =0x021D6FCC
	mov r1, #9
	blx ip
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B3560: .word 0x021D8498
_020B3564: .word 0x021D6F90
_020B3568: .word _021108FC
_020B356C: .word 0x021D6FCC
	arm_func_end sub_020B34C4

	arm_func_start sub_020B3570
sub_020B3570: ; 0x020B3570
	stmdb sp!, {r3, lr}
	cmp r2, #0x10
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrb r2, [r1, #8]
	cmp r2, r0
	bne _020B35A0
	ldr r0, _020B35E8 ; =0x021D8498
	ldrb ip, [r1, #9]
	ldrb r2, [r0]
	cmp ip, r2
	beq _020B35A8
_020B35A0:
	mov r0, #0
	ldmia sp!, {r3, pc}
_020B35A8:
	ldrb r2, [r1, #5]
	cmp r2, #0x10
	beq _020B35C4
	mov r0, r1
	mov r1, r3
	bl sub_020B3E7C
	ldmia sp!, {r3, pc}
_020B35C4:
	ldr r0, [r0, #0xc]
	cmp r0, #0
	mov r0, r1
	mov r1, r3
	bne _020B35E0
	bl sub_020B3BB0
	ldmia sp!, {r3, pc}
_020B35E0:
	bl sub_020B3CEC
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B35E8: .word 0x021D8498
	arm_func_end sub_020B3570

	arm_func_start sub_020B35EC
sub_020B35EC: ; 0x020B35EC
	stmdb sp!, {r4, lr}
	mov r1, r0
	cmp r1, #0x20
	movhs r0, #0
	ldmhsia sp!, {r4, pc}
	ldr r0, _020B3650 ; =0x021D8498
	ldrb r0, [r0]
	cmp r1, r0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r2, _020B3654 ; =0x021D6F90
	ldr r4, [r2, #0x10]
	cmp r4, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, [r4, #0x14]
	mov r0, r4
	str r3, [r2, #0x10]
	bl sub_020B3808
	ldr r1, _020B3654 ; =0x021D6F90
	mov r0, r4
	ldr r2, [r1, #0x14]
	str r2, [r4, #0x14]
	str r4, [r1, #0x14]
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B3650: .word 0x021D8498
_020B3654: .word 0x021D6F90
	arm_func_end sub_020B35EC

	arm_func_start sub_020B3658
sub_020B3658: ; 0x020B3658
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	add r2, sp, #0
	mov r3, #0x10
	mov r4, r0
	bl sub_020B3130
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r4, pc}
	add r1, sp, #0
	mov r0, r4
	bl sub_020B3850
	cmp r0, #0
	movne r0, #0
	mvneq r0, #3
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B3658

	arm_func_start sub_020B369C
sub_020B369C: ; 0x020B369C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	add r2, sp, #0
	mov r3, #0x10
	mov r4, r0
	bl sub_020B3204
	cmp r0, #0
	addne sp, sp, #0x10
	ldmneia sp!, {r4, pc}
	add r1, sp, #0
	mov r0, r4
	bl sub_020B3850
	cmp r0, #0
	movne r0, #0
	mvneq r0, #3
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	arm_func_end sub_020B369C

	arm_func_start sub_020B36E0
sub_020B36E0: ; 0x020B36E0
	ldrb r2, [r1, #0xa]
	cmp r2, #1
	bxne lr
	ldrb r2, [r0, #4]
	ldr r0, _020B3704 ; =0x021D6F90
	strb r2, [r1, #0xb]
	ldr r0, [r0, #4]
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_020B3704: .word 0x021D6F90
	arm_func_end sub_020B36E0

	arm_func_start sub_020B3708
sub_020B3708: ; 0x020B3708
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	str r0, [sp]
	mov sl, r1
	mov r8, #0
	bl sub_020B36E0
	mov r6, #1
	ldr r4, _020B37C0 ; =0x021D8498
	ldr r5, _020B37C4 ; =0x021D6F90
	mov sb, r8
	mov r7, r6
	mov fp, #0x10
_020B3734:
	cmp sb, #0
	movne r1, r7, lsl sb
	ldr r0, [r5, #4]
	moveq r1, r6
	tst r0, r1
	ldrneb r0, [r4]
	cmpne sb, r0
	beq _020B3770
	mov r0, sb
	mov r1, sl
	mov r2, fp
	strb sb, [sl, #9]
	bl ov00_021F9610
	cmp r0, #0
	addne r8, r8, #1
_020B3770:
	add r0, sb, #1
	and sb, r0, #0xff
	cmp sb, #0x20
	blo _020B3734
	ldrb r0, [sl, #0xa]
	cmp r0, #1
	bne _020B37A0
	ldr r0, _020B37C4 ; =0x021D6F90
	ldr r1, [r0, #4]
	ldr r0, [sp]
	str r1, [r0, #8]
	b _020B37B0
_020B37A0:
	cmp r0, #0
	ldreq r0, [sp]
	moveq r1, #0
	streq r1, [r0, #8]
_020B37B0:
	cmp r8, #0
	mvneq r0, #3
	movne r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020B37C0: .word 0x021D8498
_020B37C4: .word 0x021D6F90
	arm_func_end sub_020B3708

	arm_func_start sub_020B37C8
sub_020B37C8: ; 0x020B37C8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x10
	mov r4, r0
	mov r3, #0xff
	ldr r0, _020B3804 ; =0x021D6FCC
	add r1, sp, #0
	mov r2, #4
	strb r3, [sp, #4]
	bl sub_020B393C
	ldr r0, _020B3804 ; =0x021D6FCC
	add r1, sp, #0
	strb r4, [sp, #0xa]
	bl sub_020B3708
	add sp, sp, #0x10
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B3804: .word 0x021D6FCC
	arm_func_end sub_020B37C8

	arm_func_start sub_020B3808
sub_020B3808: ; 0x020B3808
	mov ip, r0
	mov r3, #6
	mov r2, #0
_020B3814:
	strb r2, [ip]
	strb r2, [ip, #1]
	strb r2, [ip, #2]
	strb r2, [ip, #3]
	add ip, ip, #4
	subs r3, r3, #1
	bne _020B3814
	ldr r2, _020B384C ; =0x021D8498
	mov r3, #0
	ldr r2, [r2, #0x10]
	str r2, [r0]
	str r3, [r0, #0xc]
	strb r1, [r0, #4]
	bx lr
	.align 2, 0
_020B384C: .word 0x021D8498
	arm_func_end sub_020B3808

	arm_func_start sub_020B3850
sub_020B3850: ; 0x020B3850
	stmdb sp!, {r3, lr}
	ldrb r2, [r1, #4]
	cmp r2, #0xff
	ldreqb r2, [r1, #6]
	cmpeq r2, #4
	bne _020B3870
	bl sub_020B3708
	b _020B3888
_020B3870:
	ldrb r0, [r0, #4]
	mov r2, #0x10
	bl ov00_021F9610
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_020B3888:
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end sub_020B3850

	arm_func_start sub_020B3890
sub_020B3890: ; 0x020B3890
	ldrb r2, [r0, #0xb]
	strb r2, [r1, #5]
	ldrb r2, [r0, #4]
	cmp r2, #0xff
	bne _020B38D4
	ldrb r2, [r0, #6]
	cmp r2, #0
	bne _020B38C4
	ldrb r3, [r1, #4]
	mov r2, #1
	cmp r3, #0
	movne r2, r2, lsl r3
	str r2, [r1, #8]
_020B38C4:
	ldrb r1, [r0, #6]
	ldr r0, _020B3934 ; =0x021090D8
	ldrb r0, [r0, r1]
	bx lr
_020B38D4:
	cmp r2, #0
	bne _020B392C
	ldrb r2, [r0, #6]
	cmp r2, #0
	bne _020B3920
	ldr r0, [r1, #0xc]
	cmp r0, #1
	bne _020B3910
	ldrb r2, [r1, #4]
	mov r0, #1
	cmp r2, #0
	movne r0, r0, lsl r2
	str r0, [r1, #8]
	mov r0, #7
	bx lr
_020B3910:
	cmp r0, #5
	moveq r0, #9
	movne r0, #0xc
	bx lr
_020B3920:
	ldr r0, _020B3938 ; =0x021090E0
	ldrb r0, [r0, r2]
	bx lr
_020B392C:
	mov r0, #0xc
	bx lr
	.align 2, 0
_020B3934: .word 0x021090D8
_020B3938: .word 0x021090E0
	arm_func_end sub_020B3890

	arm_func_start sub_020B393C
sub_020B393C: ; 0x020B393C
	ldr ip, _020B397C ; =0x5F564354
	mov r3, #0x10
	str ip, [r1]
	strb r3, [r1, #5]
	ldr r3, _020B3980 ; =0x021D8498
	strb r2, [r1, #6]
	ldrb r2, [r3]
	strb r2, [r1, #8]
	ldrb r2, [r0, #4]
	mov r0, #0
	strb r2, [r1, #9]
	strb r0, [r1, #0xa]
	ldrb r2, [r3]
	strb r2, [r1, #0xb]
	str r0, [r1, #0xc]
	bx lr
	.align 2, 0
_020B397C: .word 0x5F564354
_020B3980: .word 0x021D8498
	arm_func_end sub_020B393C

	arm_func_start sub_020B3984
sub_020B3984: ; 0x020B3984
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r2, [r1, #4]
	ldrb r3, [r1, #6]
	mov r4, r0
	cmp r2, #0
	addeq r3, r3, #5
	cmp r3, #0
	blt _020B39AC
	cmp r3, #0xb
	blt _020B39B0
_020B39AC:
	mvn r3, #0
_020B39B0:
	cmp r3, #0
	mvnlt r0, #0
	ldmltia sp!, {r3, r4, r5, pc}
	ldr r0, _020B3A50 ; =0x021D8498
	ldr r2, [r4, #0xc]
	ldr r0, [r0, #0x10]
	cmp r0, #1
	ldreq r1, _020B3A54 ; =0x021091AE
	mov r0, #0xb
	ldrne r1, _020B3A58 ; =0x021090E8
	mla r0, r2, r0, r1
	ldrsb r5, [r3, r0]
	mvn r1, #2
	cmp r5, r1
	beq _020B3A2C
	add r0, r1, #1
	cmp r5, r0
	beq _020B3A0C
	add r0, r1, #2
	cmp r5, r0
	mov r0, r5
	bne _020B3A4C
	ldmia sp!, {r3, r4, r5, pc}
_020B3A0C:
	mov r0, r4
	mov r1, #1
	bl sub_020B369C
	mov r1, #0
	str r1, [r4, #0xc]
	mov r0, r5
	str r1, [r4]
	ldmia sp!, {r3, r4, r5, pc}
_020B3A2C:
	mov r0, r4
	mov r1, #3
	bl sub_020B369C
	mov r1, #0
	str r1, [r4, #0xc]
	mov r0, r5
	str r1, [r4]
	ldmia sp!, {r3, r4, r5, pc}
_020B3A4C:
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B3A50: .word 0x021D8498
_020B3A54: .word 0x021091AE
_020B3A58: .word 0x021090E8
	arm_func_end sub_020B3984

	arm_func_start sub_020B3A5C
sub_020B3A5C: ; 0x020B3A5C
	ldr r1, _020B3AA4 ; =0x021D6F90
	ldr r2, [r1, #0x14]
	cmp r2, #0
	beq _020B3A9C
_020B3A6C:
	ldr r1, [r2]
	cmp r1, #0
	beq _020B3A90
	ldr r1, [r2, #0xc]
	cmp r1, #2
	bne _020B3A90
	cmp r0, r2
	movne r0, #0
	bxne lr
_020B3A90:
	ldr r2, [r2, #0x14]
	cmp r2, #0
	bne _020B3A6C
_020B3A9C:
	mov r0, #1
	bx lr
	.align 2, 0
_020B3AA4: .word 0x021D6F90
	arm_func_end sub_020B3A5C

	arm_func_start sub_020B3AA8
sub_020B3AA8: ; 0x020B3AA8
	ldrb r2, [r1, #4]
	ldrb ip, [r1, #6]
	cmp r2, #0
	addeq ip, ip, #5
	cmp ip, #0
	blt _020B3AC8
	cmp ip, #0xb
	blt _020B3ACC
_020B3AC8:
	mvn ip, #0
_020B3ACC:
	cmp ip, #0
	mvnlt r0, #0
	bxlt lr
	ldr r1, _020B3B24 ; =0x021D8498
	ldr r3, [r0, #0xc]
	ldr r1, [r1, #0x10]
	cmp r1, #1
	ldreq r2, _020B3B28 ; =0x0210912A
	mov r1, #0xb
	ldrne r2, _020B3B2C ; =0x0210916C
	mla r1, r3, r1, r2
	ldrsb r2, [ip, r1]
	mvn r1, #0
	cmp r2, r1
	moveq r0, #1
	bxeq lr
	sub r1, r1, #1
	cmp r2, r1
	moveq r0, #0
	strne r2, [r0, #0xc]
	movne r0, #1
	bx lr
	.align 2, 0
_020B3B24: .word 0x021D8498
_020B3B28: .word 0x0210912A
_020B3B2C: .word 0x0210916C
	arm_func_end sub_020B3AA8

	arm_func_start sub_020B3B30
sub_020B3B30: ; 0x020B3B30
	ldr r1, _020B3BA4 ; =0x021D8498
	ldr r2, _020B3BA8 ; =0x021D6F90
	ldr r1, [r1, #0x10]
	ldr r3, [r2, #0x14]
	cmp r1, #2
	bne _020B3B6C
	ldr r1, [r2, #0x3c]
	cmp r1, #0
	beq _020B3B64
	ldrb r1, [r2, #0x40]
	cmp r1, r0
	ldreq r0, _020B3BAC ; =0x021D6FCC
	bxeq lr
_020B3B64:
	mov r0, #0
	bx lr
_020B3B6C:
	cmp r3, #0
	beq _020B3B9C
_020B3B74:
	ldr r1, [r3]
	cmp r1, #0
	beq _020B3B90
	ldrb r1, [r3, #4]
	cmp r1, r0
	moveq r0, r3
	bxeq lr
_020B3B90:
	ldr r3, [r3, #0x14]
	cmp r3, #0
	bne _020B3B74
_020B3B9C:
	mov r0, #0
	bx lr
	.align 2, 0
_020B3BA4: .word 0x021D8498
_020B3BA8: .word 0x021D6F90
_020B3BAC: .word 0x021D6FCC
	arm_func_end sub_020B3B30

	arm_func_start sub_020B3BB0
sub_020B3BB0: ; 0x020B3BB0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	ldrb r2, [r6, #4]
	mov r5, r1
	cmp r2, #0xff
	bne _020B3BE8
	ldrb r2, [r6, #6]
	cmp r2, #4
	bne _020B3BDC
	bl sub_020B3EF4
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B3BDC:
	cmp r2, #3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_020B3BE8:
	ldrb r0, [r6, #8]
	bl sub_020B3B30
	movs r4, r0
	beq _020B3C68
	mov r1, r6
	bl sub_020B3984
	mov r7, r0
	mvn r0, #1
	cmp r7, r0
	beq _020B3C24
	add r0, r0, #1
	cmp r7, r0
	bne _020B3C40
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B3C24:
	mov r0, #0xc
	str r0, [r5]
	mov r0, #0
	str r0, [r4]
	str r4, [r5, #4]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B3C40:
	mov r0, r6
	mov r1, r4
	bl sub_020B3890
	stmia r5, {r0, r4}
	str r7, [r4, #0xc]
	ldr r0, [r5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B3C68:
	ldrb r0, [r6, #8]
	bl sub_020B35EC
	movs r7, r0
	bne _020B3C98
	ldrb r1, [r6, #8]
	ldr r0, _020B3CE8 ; =0x021D6FB4
	bl sub_020B3808
	ldr r0, _020B3CE8 ; =0x021D6FB4
	mov r1, #3
	bl sub_020B369C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B3C98:
	mov r1, r6
	bl sub_020B3984
	mov r4, r0
	add r0, r4, #2
	cmp r0, #1
	bhi _020B3CC0
	mov r0, r7
	bl sub_020B3074
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B3CC0:
	mov r0, r6
	mov r1, r7
	bl sub_020B3890
	stmia r5, {r0, r7}
	str r4, [r7, #0xc]
	ldr r0, [r5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B3CE8: .word 0x021D6FB4
	arm_func_end sub_020B3BB0

	arm_func_start sub_020B3CEC
sub_020B3CEC: ; 0x020B3CEC
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020B3E74 ; =0x021D6F90
	mov r5, r0
	ldr r0, [r2, #0x3c]
	mov r4, r1
	cmp r0, #2
	bne _020B3D9C
	ldrb r1, [r2, #0x40]
	ldrb r0, [r5, #8]
	cmp r1, r0
	bne _020B3D8C
	ldr r0, _020B3E78 ; =0x021D6FCC
	mov r1, r5
	bl sub_020B3984
	mov r6, r0
	mvn r1, #2
	cmp r6, r1
	beq _020B3D68
	add r0, r1, #1
	cmp r6, r0
	beq _020B3D50
	add r0, r1, #2
	cmp r6, r0
	beq _020B3D68
	b _020B3D70
_020B3D50:
	mov r0, #0xc
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
_020B3D68:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020B3D70:
	ldr r1, _020B3E78 ; =0x021D6FCC
	mov r0, r5
	bl sub_020B3890
	ldr r1, _020B3E78 ; =0x021D6FCC
	stmia r4, {r0, r1}
	str r6, [r1, #0xc]
	b _020B3E2C
_020B3D8C:
	mov r0, #1
	bl sub_020B37C8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020B3D9C:
	ldrb r1, [r5, #8]
	ldr r2, _020B3E74 ; =0x021D6F90
	cmp r1, #0
	movne r0, #1
	movne r3, r0, lsl r1
	ldr r0, [r2, #4]
	moveq r3, #1
	tst r0, r3
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	strb r1, [r2, #0x40]
	mov r3, #2
	str r3, [r2, #0x3c]
	mov r3, #0
	ldr r0, _020B3E78 ; =0x021D6FCC
	mov r1, r5
	str r3, [r2, #0x48]
	bl sub_020B3984
	mov r6, r0
	mvn r1, #2
	cmp r6, r1
	addne r0, r1, #1
	cmpne r6, r0
	addne r0, r1, #2
	cmpne r6, r0
	bne _020B3E14
	ldr r1, _020B3E74 ; =0x021D6F90
	mov r0, #0
	str r0, [r1, #0x3c]
	ldmia sp!, {r4, r5, r6, pc}
_020B3E14:
	ldr r1, _020B3E78 ; =0x021D6FCC
	mov r0, r5
	bl sub_020B3890
	ldr r1, _020B3E78 ; =0x021D6FCC
	stmia r4, {r0, r1}
	str r6, [r1, #0xc]
_020B3E2C:
	ldr r0, [r4]
	cmp r0, #0xa
	bne _020B3E54
	mov r0, #1
	bl sub_020B37C8
	bl OS_GetTick
	ldr r2, _020B3E74 ; =0x021D6F90
	str r0, [r2, #8]
	str r1, [r2, #0xc]
	b _020B3E6C
_020B3E54:
	mov r0, #0
	bl sub_020B37C8
	ldr r0, _020B3E74 ; =0x021D6F90
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
_020B3E6C:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B3E74: .word 0x021D6F90
_020B3E78: .word 0x021D6FCC
	arm_func_end sub_020B3CEC

	arm_func_start sub_020B3E7C
sub_020B3E7C: ; 0x020B3E7C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldrb r0, [r5, #4]
	mov r4, r1
	cmp r0, #0xff
	ldreqb r0, [r5, #6]
	cmpeq r0, #4
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r5, #8]
	bl sub_020B3B30
	cmp r0, #0
	beq _020B3ED0
	mov r1, #2
	str r1, [r4]
	str r0, [r4, #4]
	mov r2, #0
	str r2, [r0]
	bl sub_020B369C
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_020B3ED0:
	ldrb r1, [r5, #8]
	ldr r0, _020B3EF0 ; =0x021D6FB4
	bl sub_020B3808
	ldr r0, _020B3EF0 ; =0x021D6FB4
	mov r1, #2
	bl sub_020B369C
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020B3EF0: .word 0x021D6FB4
	arm_func_end sub_020B3E7C

	arm_func_start sub_020B3EF4
sub_020B3EF4: ; 0x020B3EF4
	stmdb sp!, {r3, lr}
	ldr r3, _020B4008 ; =0x021D8498
	ldr r2, [r3, #0x10]
	cmp r2, #2
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrb ip, [r3, #1]
	ldrb r2, [r0, #8]
	cmp ip, r2
	movne r0, #0
	ldmneia sp!, {r3, pc}
	ldrb r2, [r0, #0xa]
	cmp r2, #0
	beq _020B3F38
	cmp r2, #1
	beq _020B3F84
	b _020B3FF8
_020B3F38:
	ldr r0, _020B400C ; =0x021D6F90
	ldr r2, [r0, #0x3c]
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r0, #0x48]
	mov r3, #0
	cmp r0, #5
	cmpne r0, #2
	moveq r0, #9
	streq r0, [r1]
	movne r0, #5
	strne r0, [r1]
	ldr r0, _020B400C ; =0x021D6F90
	ldr r2, _020B4010 ; =0x021D6FCC
	str r3, [r0, #0x3c]
	str r3, [r0, #0x48]
	str r2, [r1, #4]
	b _020B4000
_020B3F84:
	ldr r2, _020B400C ; =0x021D6F90
	mov lr, #2
	str lr, [r2, #0x3c]
	ldrb ip, [r0, #0xb]
	ldrb r3, [r3]
	cmp ip, r3
	bne _020B3FB4
	str lr, [r2, #0x48]
	mov r3, #7
	str r3, [r1]
	ldr r3, [r0, #0xc]
	b _020B3FDC
_020B3FB4:
	mov r3, #3
	str r3, [r2, #0x48]
	mov r2, #6
	str r2, [r1]
	ldrb r3, [r0, #0xb]
	cmp r3, #0
	movne r2, #1
	movne r3, r2, lsl r3
	ldr r2, _020B400C ; =0x021D6F90
	moveq r3, #1
_020B3FDC:
	str r3, [r2, #0x44]
	ldrb r3, [r0, #0xb]
	ldr r0, _020B400C ; =0x021D6F90
	ldr r2, _020B4010 ; =0x021D6FCC
	strb r3, [r0, #0x41]
	str r2, [r1, #4]
	b _020B4000
_020B3FF8:
	mov r0, #0
	ldmia sp!, {r3, pc}
_020B4000:
	mov r0, #1
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B4008: .word 0x021D8498
_020B400C: .word 0x021D6F90
_020B4010: .word 0x021D6FCC
	arm_func_end sub_020B3EF4

	arm_func_start sub_020B4014
sub_020B4014: ; 0x020B4014
	stmdb sp!, {r4, r5, r6, lr}
	ldr r3, _020B40D0 ; =0xE525982B
	mov r2, r1
	umull r1, r4, r2, r3
	ldr r1, _020B40D4 ; =0x021D6FE4
	mov r4, r4, lsr #0xa
	str r0, [r1, #4]
	cmp r4, #4
	blo _020B4040
	cmp r4, #0x48
	bls _020B4048
_020B4040:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
_020B4048:
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	tst r0, #0x1f
	movne r0, #0
	strne r0, [r1, #4]
	ldmneia sp!, {r4, r5, r6, pc}
	mov r1, r0
	mov r0, #0
	bl MIi_CpuClearFast
	subs lr, r4, #1
	mov r5, #0
	beq _020B40A8
	ldr r2, _020B40D4 ; =0x021D6FE4
	ldr r0, _020B40D8 ; =0x00000478
	mov r6, r5
_020B4088:
	ldr ip, [r2, #4]
	add r5, r5, #1
	mla r3, r5, r0, ip
	add r1, r6, #0x78
	str r3, [ip, r6]
	cmp r5, lr
	add r6, r1, #0x400
	blo _020B4088
_020B40A8:
	ldr r1, _020B40D4 ; =0x021D6FE4
	ldr r0, _020B40D8 ; =0x00000478
	ldr r2, [r1, #4]
	mov r3, #0
	mla r0, r4, r0, r2
	str r3, [r0, #-0x478]
	ldr r2, [r1, #4]
	mov r0, #1
	str r2, [r1]
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020B40D0: .word 0xE525982B
_020B40D4: .word 0x021D6FE4
_020B40D8: .word 0x00000478
	arm_func_end sub_020B4014

	arm_func_start sub_020B40DC
sub_020B40DC: ; 0x020B40DC
	ldr r0, _020B40F0 ; =0x021D6FE4
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	bx lr
	.align 2, 0
_020B40F0: .word 0x021D6FE4
	arm_func_end sub_020B40DC

	arm_func_start sub_020B40F4
sub_020B40F4: ; 0x020B40F4
	stmdb sp!, {r4, lr}
	mov r4, #0
	bl OS_DisableInterrupts
	ldr r1, _020B4124 ; =0x021D6FE4
	ldr r3, [r1]
	cmp r3, #0
	ldrne r2, [r3]
	movne r4, r3
	strne r2, [r1]
	bl OS_RestoreInterrupts
	mov r0, r4
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B4124: .word 0x021D6FE4
	arm_func_end sub_020B40F4

	arm_func_start sub_020B4128
sub_020B4128: ; 0x020B4128
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl OS_DisableInterrupts
	ldr r1, _020B4158 ; =0x021D6FE4
	mov r2, #0
	ldr r3, [r1]
	str r3, [r4]
	str r4, [r1]
	str r2, [r4, #4]
	str r2, [r4, #8]
	bl OS_RestoreInterrupts
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B4158: .word 0x021D6FE4
	arm_func_end sub_020B4128

	arm_func_start sub_020B415C
sub_020B415C: ; 0x020B415C
	ldr r0, _020B419C ; =0x021D6FF8
	mov r2, #0
	mov r1, #0x1000000
_020B4168:
	str r1, [r0, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #4
	blt _020B4168
	ldr r1, _020B41A0 ; =0x021D6FEC
	mov r2, #0
	str r2, [r1, #4]
	ldr r0, _020B41A4 ; =_02110904
	str r2, [r1]
	str r2, [r0]
	str r2, [r0, #4]
	str r2, [r1, #8]
	bx lr
	.align 2, 0
_020B419C: .word 0x021D6FF8
_020B41A0: .word 0x021D6FEC
_020B41A4: .word _02110904
	arm_func_end sub_020B415C

	arm_func_start sub_020B41A8
sub_020B41A8: ; 0x020B41A8
	stmdb sp!, {r3, lr}
	movs r1, r0
	ldmeqia sp!, {r3, pc}
	ldr r0, _020B41C4 ; =_02110904
	mov r2, #0x10
	bl MI_CpuCopy8
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B41C4: .word _02110904
	arm_func_end sub_020B41A8

	arm_func_start sub_020B41C8
sub_020B41C8: ; 0x020B41C8
	stmdb sp!, {r4, lr}
	ldr r3, _020B4394 ; =_02110904
	mov ip, r1, lsr #8
	str ip, [r3, #4]
	cmp r2, #0
	strneb ip, [r2]
	ldr r2, _020B4394 ; =_02110904
	ldr r2, [r2]
	cmp r2, #0
	bne _020B42DC
	mov ip, #0
	ldr r3, _020B4398 ; =0x021D6FF8
	mov lr, ip
_020B41FC:
	ldr r2, [r3, lr, lsl #2]
	add lr, lr, #1
	cmp lr, #4
	add ip, ip, r2
	blt _020B41FC
	ldr r3, _020B439C ; =0x040002B0
	mov r2, #0
	strh r2, [r3]
	mov r2, ip, lsr #2
	str r2, [r3, #8]
_020B4224:
	ldrh r2, [r3]
	tst r2, #0x8000
	bne _020B4224
	ldr r2, _020B43A0 ; =0x040002B4
	cmp r1, #0
	ldr r2, [r2]
	beq _020B42B8
	cmp r1, r2, lsl #1
	blo _020B42B8
	mov r3, #0
	ldr r2, _020B4398 ; =0x021D6FF8
	mov ip, r3
_020B4254:
	ldr r1, [r2, ip, lsl #2]
	add ip, ip, #1
	cmp ip, #4
	add r3, r3, r1
	blo _020B4254
	ldr r2, _020B439C ; =0x040002B0
	mov r1, #0
	strh r1, [r2]
	mov r1, r3, lsr #2
	str r1, [r2, #8]
_020B427C:
	ldrh r1, [r2]
	tst r1, #0x8000
	bne _020B427C
	ldr r1, _020B43A0 ; =0x040002B4
	ldr r2, _020B43A4 ; =0x021D6FEC
	ldr r1, [r1]
	mov r3, #0
	add r1, r1, r1, lsl #1
	mov r1, r1, lsr #1
	str r1, [r2]
	ldr r1, _020B4394 ; =_02110904
	str r3, [r2, #4]
	mov lr, #1
	str lr, [r1]
	b _020B42BC
_020B42B8:
	mov lr, #0
_020B42BC:
	ldr r1, _020B43A4 ; =0x021D6FEC
	ldr r3, _020B4398 ; =0x021D6FF8
	ldr ip, [r1, #4]
	add r2, ip, #1
	and r2, r2, #3
	str r0, [r3, ip, lsl #2]
	str r2, [r1, #4]
	b _020B438C
_020B42DC:
	ldr r1, _020B43A4 ; =0x021D6FEC
	mov lr, #0
	ldr ip, [r1, #4]
	ldr r3, _020B4398 ; =0x021D6FF8
	add r2, ip, #1
	and r2, r2, #3
	mov r4, lr
	str r0, [r3, ip, lsl #2]
	str r2, [r1, #4]
_020B4300:
	ldr r0, [r3, r4, lsl #2]
	add r4, r4, #1
	cmp r4, #4
	add lr, lr, r0
	blt _020B4300
	ldr r1, _020B439C ; =0x040002B0
	mov r0, #0
	strh r0, [r1]
	mov r0, lr, lsr #2
	str r0, [r1, #8]
_020B4328:
	ldrh r0, [r1]
	tst r0, #0x8000
	bne _020B4328
	ldr r0, _020B43A0 ; =0x040002B4
	ldr r1, _020B43A4 ; =0x021D6FEC
	ldr r2, [r0]
	ldr r0, [r1]
	cmp r2, r0
	bhi _020B4380
	ldr r2, [r1, #8]
	ldr r0, _020B4394 ; =_02110904
	add r3, r2, #1
	str r3, [r1, #8]
	ldr r2, [r0, #8]
	cmp r3, r2
	ble _020B4388
	mov r2, #0
	str r2, [r0]
	str r2, [r1, #8]
	str r2, [r1, #4]
	mov r0, #3
	ldmia sp!, {r4, pc}
_020B4380:
	mov r0, #0
	str r0, [r1, #8]
_020B4388:
	mov lr, #2
_020B438C:
	mov r0, lr
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B4394: .word _02110904
_020B4398: .word 0x021D6FF8
_020B439C: .word 0x040002B0
_020B43A0: .word 0x040002B4
_020B43A4: .word 0x021D6FEC
	arm_func_end sub_020B41C8

	arm_func_start sub_020B43A8
sub_020B43A8: ; 0x020B43A8
	mov r2, #0xf
	ldr r1, _020B43C8 ; =_02110904
	mov r0, #0x44
	smulbb r0, r2, r0
	str r2, [r1, #8]
	ldr ip, _020B43CC ; =sub_020B415C
	str r0, [r1, #0xc]
	bx ip
	.align 2, 0
_020B43C8: .word _02110904
_020B43CC: .word sub_020B415C
	arm_func_end sub_020B43A8

	arm_func_start sub_020B43D0
sub_020B43D0: ; 0x020B43D0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldrsh r2, [r0]
	ldr r3, _020B44A8 ; =0x021D7008
	ldr r5, _020B44AC ; =0x00000E9F
	ldr r4, [r3, #4]
	smulbb r7, r2, r5
	ldr r2, [r3, #0x10]
	ldr r6, _020B44B0 ; =0x00000D3E
	add r4, r7, r4
	mla r4, r2, r6, r4
	mov r4, r4, asr #0xc
	mul lr, r4, r4
	mov r1, r1, lsr #1
	str r4, [r3, #0x10]
	rsb r2, r7, #0
	str r2, [r3, #4]
	cmp r1, #1
	mov ip, lr, asr #0x1f
	mov r3, #1
	bls _020B4468
_020B4420:
	mov r7, r3, lsl #1
	ldrsh r8, [r0, r7]
	add r7, r0, r3, lsl #1
	add r3, r3, #1
	smulbb r8, r8, r5
	add r2, r8, r2
	mla r2, r4, r6, r2
	strh r4, [r7, #-2]
	mov r4, r2, asr #0xc
	mul r2, r4, r4
	adds lr, lr, r2
	adc ip, ip, r2, asr #31
	rsb r2, r8, #0
	cmp r3, r1
	blo _020B4420
	ldr r3, _020B44A8 ; =0x021D7008
	str r2, [r3, #4]
	str r4, [r3, #0x10]
_020B4468:
	add r0, r0, r1, lsl #1
	strh r4, [r0, #-2]
	ldr r2, _020B44B4 ; =0x04000280
	mov r0, #1
	strh r0, [r2]
	str lr, [r2, #0x10]
	str ip, [r2, #0x14]
	str r1, [r2, #0x18]
	mov r0, #0
	str r0, [r2, #0x1c]
_020B4490:
	ldrh r0, [r2]
	tst r0, #0x8000
	bne _020B4490
	ldr r0, _020B44B8 ; =0x040002A0
	ldr r0, [r0]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020B44A8: .word 0x021D7008
_020B44AC: .word 0x00000E9F
_020B44B0: .word 0x00000D3E
_020B44B4: .word 0x04000280
_020B44B8: .word 0x040002A0
	arm_func_end sub_020B43D0

	arm_func_start sub_020B44BC
sub_020B44BC: ; 0x020B44BC
	stmdb sp!, {r3, lr}
	ldr r0, _020B4520 ; =0x021D7008
	mov r2, #0
	ldr r1, _020B4524 ; =0x0000019D
	str r2, [r0, #0xc]
	str r1, [r0, #8]
	ldr ip, _020B4528 ; =_02110914
	ldr r0, _020B452C ; =0x021D748C
	mov lr, r2
_020B44E0:
	mov r1, r2, lsl #1
	add r2, r2, #1
	strh lr, [r0, r1]
	cmp r2, #0x800
	blt _020B44E0
	ldr r2, _020B4530 ; =0x021D7034
	ldr r0, _020B4534 ; =0x021D701C
	mov r3, #0
_020B4500:
	mov r1, lr, lsl #1
	ldrsh r1, [ip, r1]
	str r3, [r2, lr, lsl #2]
	str r1, [r0, lr, lsl #2]
	add lr, lr, #1
	cmp lr, #6
	blt _020B4500
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B4520: .word 0x021D7008
_020B4524: .word 0x0000019D
_020B4528: .word _02110914
_020B452C: .word 0x021D748C
_020B4530: .word 0x021D7034
_020B4534: .word 0x021D701C
	arm_func_end sub_020B44BC

	arm_func_start sub_020B4538
sub_020B4538: ; 0x020B4538
	ldr ip, _020B4548 ; =MIi_CpuCopyFast
	mov r2, r1
	ldr r1, _020B454C ; =0x021D704C
	bx ip
	.align 2, 0
_020B4548: .word MIi_CpuCopyFast
_020B454C: .word 0x021D704C
	arm_func_end sub_020B4538

	arm_func_start sub_020B4550
sub_020B4550: ; 0x020B4550
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x10
	mov r4, #0
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	mov r8, r4
	movs r2, r2, lsr #1
	beq _020B4678
	ldr lr, _020B4754 ; =0x3FFF8000
	ldr ip, _020B4758 ; =0x021D7008
_020B4578:
	mov r4, r8, lsl #1
	ldr r7, [ip, #0xc]
	ldrsh r6, [r1, r4]
	ldr r4, _020B475C ; =0x021D748C
	mov r5, r7, lsl #1
	strh r6, [r4, r5]
	ldr r4, [ip, #8]
	str r4, [sp]
	mov r5, r4, lsl #1
	ldr r4, _020B475C ; =0x021D748C
	ldrsh r6, [r4, r5]
	str r6, [ip, #0x2c]
	ldr sb, [ip, #0x3c]
	ldr sl, [ip, #0x24]
	ldr r5, [ip, #0x40]
	mul sl, sb, sl
	ldr r4, [ip, #0x28]
	str sb, [sp, #4]
	mla r4, r5, r4, sl
	mov r5, sb
	str r5, [ip, #0x40]
	ldr sb, [ip, #0x38]
	ldr r5, [ip, #0x20]
	mla r5, sb, r5, r4
	str sb, [ip, #0x3c]
	ldr sb, [ip, #0x34]
	ldr r4, [ip, #0x1c]
	mla r5, sb, r4, r5
	str sb, [ip, #0x38]
	ldr sb, [ip, #0x30]
	ldr r4, [ip, #0x18]
	mla r5, sb, r4, r5
	str sb, [ip, #0x34]
	ldr r4, [ip, #0x14]
	mla r4, r6, r4, r5
	cmp r4, lr
	str r6, [ip, #0x30]
	movgt r4, lr
	bgt _020B461C
	cmp r4, #0xc0000000
	movlt r4, #0xc0000000
_020B461C:
	add r5, r7, #1
	and r5, r5, lr, lsr #19
	str r5, [ip, #0xc]
	ldr r5, [sp]
	mov r6, r8, lsl #1
	add r5, r5, #1
	and r5, r5, lr, lsr #19
	str r5, [ip, #8]
	mov r4, r4, asr #0xf
	strh r4, [r1, r6]
	ldrsh r5, [r1, r6]
	ldrsh r4, [r0, r6]
	add r8, r8, #1
	smulbb r5, r5, r5
	strh r4, [r1, r6]
	ldr r4, [sp, #8]
	adds r4, r4, r5
	str r4, [sp, #8]
	ldr r4, [sp, #0xc]
	adc r4, r4, r5, asr #31
	str r4, [sp, #0xc]
	cmp r8, r2
	blo _020B4578
_020B4678:
	ldr r4, _020B4760 ; =0x04000280
	mov r1, #1
	strh r1, [r4]
	ldr r1, [sp, #8]
	str r1, [r4, #0x10]
	ldr r1, [sp, #0xc]
	str r1, [r4, #0x14]
	str r2, [r4, #0x18]
	mov r1, #0
	str r1, [r4, #0x1c]
_020B46A0:
	ldrh r1, [r4]
	tst r1, #0x8000
	bne _020B46A0
	ldr r5, _020B4764 ; =0x040002A0
	mov r1, #0
	ldr r4, [r5]
	strh r1, [r5, #0x10]
	str r4, [r5, #0x18]
_020B46C0:
	ldrh r1, [r5, #0x10]
	tst r1, #0x8000
	bne _020B46C0
	ldr r1, _020B4768 ; =0x040002B4
	ldr r4, [r1]
	add r1, r4, r4, lsl #1
	cmp r1, r3, lsl #1
	bhs _020B46F4
	ldr r0, _020B4758 ; =0x021D7008
	mov r1, #0
	add sp, sp, #0x10
	strh r1, [r0]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_020B46F4:
	cmp r3, r4
	ldrlo r1, _020B4758 ; =0x021D7008
	movlo r3, #4
	strloh r3, [r1]
	ldr r1, _020B4758 ; =0x021D7008
	mov r5, #0
	ldrsh r3, [r1]
	cmp r3, #4
	addlt r3, r3, #1
	strlth r3, [r1]
	cmp r2, #0
	addls sp, sp, #0x10
	ldmlsia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, _020B4758 ; =0x021D7008
	ldrsh r4, [r1]
_020B4730:
	mov r3, r5, lsl #1
	ldrsh r1, [r0, r3]
	add r5, r5, #1
	cmp r5, r2
	mov r1, r1, asr r4
	strh r1, [r0, r3]
	blo _020B4730
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020B4754: .word 0x3FFF8000
_020B4758: .word 0x021D7008
_020B475C: .word 0x021D748C
_020B4760: .word 0x04000280
_020B4764: .word 0x040002A0
_020B4768: .word 0x040002B4
	arm_func_end sub_020B4550

	arm_func_start sub_020B476C
sub_020B476C: ; 0x020B476C
	stmdb sp!, {r3, lr}
	mov ip, r1
	mov r3, r2
	ldr r1, _020B4788 ; =0x021D704C
	mov r2, ip
	bl sub_020B4550
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B4788: .word 0x021D704C
	arm_func_end sub_020B476C

	arm_func_start sub_020B478C
sub_020B478C: ; 0x020B478C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, #0
	movs lr, r3, lsr #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r3, #0x8000
	rsb r3, r3, #0
	mov ip, r3, lsr #0x11
_020B47A8:
	mov r5, r4, lsl #1
	ldrsh r6, [r0, r5]
	ldrsh r5, [r1, r5]
	add r6, r6, r5
	cmp r6, r3, lsr #17
	movgt r6, ip
	bgt _020B47CC
	cmp r6, r3
	movlt r6, r3
_020B47CC:
	mov r5, r4, lsl #1
	strh r6, [r2, r5]
	add r6, r0, r4, lsl #1
	add r5, r1, r4, lsl #1
	ldrsh r6, [r6, #2]
	ldrsh r5, [r5, #2]
	add r6, r6, r5
	cmp r6, r3, lsr #17
	movgt r6, ip
	bgt _020B47FC
	cmp r6, r3
	movlt r6, r3
_020B47FC:
	add r5, r2, r4, lsl #1
	strh r6, [r5, #2]
	add r6, r0, r4, lsl #1
	add r5, r1, r4, lsl #1
	ldrsh r6, [r6, #4]
	ldrsh r5, [r5, #4]
	add r6, r6, r5
	cmp r6, r3, lsr #17
	movgt r6, ip
	bgt _020B482C
	cmp r6, r3
	movlt r6, r3
_020B482C:
	add r5, r2, r4, lsl #1
	strh r6, [r5, #4]
	add r6, r0, r4, lsl #1
	add r5, r1, r4, lsl #1
	ldrsh r6, [r6, #6]
	ldrsh r5, [r5, #6]
	add r6, r6, r5
	cmp r6, r3, lsr #17
	movgt r6, ip
	bgt _020B485C
	cmp r6, r3
	movlt r6, r3
_020B485C:
	add r5, r2, r4, lsl #1
	add r4, r4, #4
	strh r6, [r5, #6]
	cmp r4, lr
	blo _020B47A8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end sub_020B478C

	arm_func_start sub_020B4874
sub_020B4874: ; 0x020B4874
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, _020B49A0 ; =_version_Abiosso_libVCT
	bl OSi_ReferSymbol
	cmp r4, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, _020B49A4 ; =0x021D848C
	ldr r0, [r0, #8]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #8]
	cmp r0, #1
	cmpne r0, #2
	cmpne r0, #3
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #0x18]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r2, [r4, #0x10]
	cmp r2, #0
	ldrne r0, [r4, #0x14]
	cmpne r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, r2, lsr #0x1f
	rsb r0, r1, r2, lsl #27
	adds r0, r1, r0, ror #27
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldr r0, _020B49A8 ; =0x021D8498
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	ldr r2, [r4, #0x18]
	ldr r1, _020B49A4 ; =0x021D848C
	mov r0, #0
	str r2, [r1, #0x10]
	ldr r2, [r4, #0x1c]
	str r2, [r1, #0x14]
	ldr r2, [r4, #8]
	str r2, [r1, #0x1c]
	str r0, [r1, #0x18]
	ldrb r2, [r4, #0xc]
	cmp r2, #0x20
	ldmhsia sp!, {r4, pc}
	strb r2, [r1, #0xc]
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	bl sub_020B4014
	cmp r0, #0
	bne _020B495C
	bl sub_020B40DC
	mov r0, #0
	ldmia sp!, {r4, pc}
_020B495C:
	mov r0, r4
	bl sub_020B3398
	cmp r0, #0
	bne _020B4978
	bl sub_020B40DC
	mov r0, #0
	ldmia sp!, {r4, pc}
_020B4978:
	bl sub_020B1584
	cmp r0, #0
	ldrne r1, _020B49A4 ; =0x021D848C
	movne r0, #1
	strne r0, [r1, #8]
	ldmneia sp!, {r4, pc}
	bl sub_020B34AC
	bl sub_020B40DC
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B49A0: .word _version_Abiosso_libVCT
_020B49A4: .word 0x021D848C
_020B49A8: .word 0x021D8498
	arm_func_end sub_020B4874

	arm_func_start sub_020B49AC
sub_020B49AC: ; 0x020B49AC
	stmdb sp!, {r3, lr}
	bl sub_020B1680
	bl sub_020B34AC
	bl sub_020B40DC
	ldr r0, _020B49D0 ; =0x021D848C
	mov r1, #0
	str r1, [r0, #0x1c]
	str r1, [r0, #8]
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B49D0: .word 0x021D848C
	arm_func_end sub_020B49AC

	arm_func_start sub_020B49D4
sub_020B49D4: ; 0x020B49D4
	stmdb sp!, {r3, lr}
	ldr r0, _020B4A14 ; =0x021D848C
	ldr r1, [r0, #8]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	tst r1, #0xf
	bne _020B4A00
	bl sub_020B34C4
_020B4A00:
	bl sub_020B22E4
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl sub_020B2214
	ldmia sp!, {r3, pc}
	.align 2, 0
_020B4A14: .word 0x021D848C
	arm_func_end sub_020B49D4

	arm_func_start sub_020B4A18
sub_020B4A18: ; 0x020B4A18
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	add r3, sp, #0
	mov r4, r0
	bl sub_020B4A8C
	cmp r0, #0
	beq _020B4A7C
	cmp r0, #1
	beq _020B4A48
	cmp r0, #2
	beq _020B4A70
	b _020B4A7C
_020B4A48:
	ldr r0, _020B4A88 ; =0x021D848C
	ldr r1, [sp]
	ldr r2, [sp, #4]
	ldr r3, [r0, #0x14]
	ldr ip, [r0, #0x10]
	mov r0, r4
	blx ip
	add sp, sp, #8
	mov r0, #1
	ldmia sp!, {r4, pc}
_020B4A70:
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r4, pc}
_020B4A7C:
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.align 2, 0
_020B4A88: .word 0x021D848C
	arm_func_end sub_020B4A18

	arm_func_start sub_020B4A8C
sub_020B4A8C: ; 0x020B4A8C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r6, r1
	mov r7, r0
	mov r5, r2
	mov r4, r3
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, [r6]
	ldr r0, _020B4B60 ; =0x5F564354
	cmp r1, r0
	movne r0, #2
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _020B4B64 ; =0x021D848C
	ldr r1, [r0, #0x1c]
	cmp r1, #0
	ldrne r0, [r0, #8]
	cmpne r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	bl OS_GetTick
	ldrb r2, [r6, #4]
	and r3, r2, #0xf0
	cmp r3, #0x40
	bne _020B4B28
	ldr r2, _020B4B64 ; =0x021D848C
	mov r3, r0
	ldr r4, [r2, #4]
	mov r0, r7
	add r4, r4, #1
	str r4, [r2, #4]
	str r1, [sp]
	mov r1, r6
	mov r2, r5
	bl sub_020B2028
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B4B28:
	cmp r2, #0
	cmpne r2, #0xff
	bne _020B4B58
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl sub_020B3570
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020B4B58:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020B4B60: .word 0x5F564354
_020B4B64: .word 0x021D848C
	arm_func_end sub_020B4A8C

	.rodata

_02108FF4:
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x04, 0x06, 0x08, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x02, 0x04, 0x06, 0x08, 0x07, 0x00, 0x08, 0x00, 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0C, 0x00
	.byte 0x0D, 0x00, 0x0E, 0x00, 0x10, 0x00, 0x11, 0x00, 0x13, 0x00, 0x15, 0x00, 0x17, 0x00, 0x19, 0x00
	.byte 0x1C, 0x00, 0x1F, 0x00, 0x22, 0x00, 0x25, 0x00, 0x29, 0x00, 0x2D, 0x00, 0x32, 0x00, 0x37, 0x00
	.byte 0x3C, 0x00, 0x42, 0x00, 0x49, 0x00, 0x50, 0x00, 0x58, 0x00, 0x61, 0x00, 0x6B, 0x00, 0x76, 0x00
	.byte 0x82, 0x00, 0x8F, 0x00, 0x9D, 0x00, 0xAD, 0x00, 0xBE, 0x00, 0xD1, 0x00, 0xE6, 0x00, 0xFD, 0x00
	.byte 0x17, 0x01, 0x33, 0x01, 0x51, 0x01, 0x73, 0x01, 0x98, 0x01, 0xC1, 0x01, 0xEE, 0x01, 0x20, 0x02
	.byte 0x56, 0x02, 0x92, 0x02, 0xD4, 0x02, 0x1C, 0x03, 0x6C, 0x03, 0xC3, 0x03, 0x24, 0x04, 0x8E, 0x04
	.byte 0x02, 0x05, 0x83, 0x05, 0x10, 0x06, 0xAB, 0x06, 0x56, 0x07, 0x12, 0x08, 0xE0, 0x08, 0xC3, 0x09
	.byte 0xBD, 0x0A, 0xD0, 0x0B, 0xFF, 0x0C, 0x4C, 0x0E, 0xBA, 0x0F, 0x4C, 0x11, 0x07, 0x13, 0xEE, 0x14
	.byte 0x06, 0x17, 0x54, 0x19, 0xDC, 0x1B, 0xA5, 0x1E, 0xB6, 0x21, 0x15, 0x25, 0xCA, 0x28, 0xDF, 0x2C
	.byte 0x5B, 0x31, 0x4B, 0x36, 0xB9, 0x3B, 0xB2, 0x41, 0x44, 0x48, 0x7E, 0x4F, 0x71, 0x57, 0x2F, 0x60
	.byte 0xCE, 0x69, 0x62, 0x74, 0xFF, 0x7F, 0x00, 0x00, 0x08, 0x00, 0x08, 0x00, 0x02, 0x04, 0x03, 0x04
	.byte 0x04, 0x04, 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x01, 0x02
	.byte 0x02, 0x02, 0x02, 0x02, 0x02, 0x02, 0x03, 0x00, 0x01, 0x08, 0x04, 0x0A, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x0C, 0x02, 0x03, 0x09, 0x02, 0x00, 0x00, 0xFE, 0xFE, 0xFE, 0x03, 0xFF, 0xFF, 0x00, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFE, 0xFE, 0xFE, 0xFD, 0xFF, 0x02, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFE, 0xFE
	.byte 0xFE, 0xFD, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0x00, 0xFE, 0xFD, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFE, 0xFE, 0xFD, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE
	.byte 0xFE, 0xFE, 0xFD, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0xFF, 0x01, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE
	.byte 0x00, 0x00, 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0x05, 0xFE, 0xFE, 0xFE, 0x00, 0xFE, 0xFE, 0xFE, 0xFE
	.byte 0xFE, 0x05, 0xFE, 0xFE, 0xFE, 0xFE, 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE
	.byte 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0x02, 0x00, 0x00, 0x00, 0xFE
	.byte 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0x00, 0x00, 0xFE, 0xFE, 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0x01
	.byte 0xFF, 0xFE, 0x00, 0x00, 0x00, 0xFE, 0xFE, 0xFE, 0x05, 0x05, 0xFE, 0xFF, 0xFE, 0x00, 0xFE, 0xFE
	.byte 0xFE, 0xFE, 0xFE, 0x05, 0xFE, 0xFE, 0xFF, 0xFE, 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE
	.byte 0xFE, 0xFF, 0xFE, 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFF, 0x03, 0x00, 0x00
	.byte 0x00, 0xFE, 0x00, 0xFE, 0xFE, 0xFE, 0xFE, 0xFF, 0x00, 0x00, 0xFE, 0xFE, 0x00, 0xFE, 0x04, 0xFE
	.byte 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFE, 0xFE, 0xFE, 0xFF, 0x02, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0xFE, 0x05, 0x05, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE
	.byte 0xFE, 0xFE, 0xFE, 0xFE, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFE, 0x05, 0xFE, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFE, 0xFE, 0xFE, 0xFE, 0xFF, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0xFF
	.byte 0x14, 0x59, 0x0B, 0x02, 0x34, 0x59, 0x0B, 0x02, 0xFC, 0x58, 0x0B, 0x02, 0x10, 0x59, 0x0B, 0x02

	.data

_021108D8:
	.byte 0x01, 0x00, 0x00, 0x00
_021108DC:
	.byte 0x3F, 0x00, 0x00, 0x00
	.byte 0x7F, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x01, 0x00, 0x00, 0xFF, 0x03, 0x00, 0x00
	.byte 0xFF, 0x07, 0x00, 0x00, 0xFF, 0x0F, 0x00, 0x00, 0xFF, 0x1F, 0x00, 0x00
_021108FC:
	.byte 0xF7, 0xB5, 0xEF, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_02110904:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0xFC, 0x03, 0x00, 0x00
_02110914:
	.byte 0xFB, 0xE9, 0x3D, 0x40, 0xBC, 0xC7, 0xD1, 0x2C, 0x2A, 0xD0, 0x7C, 0x03
	.byte 0xF0, 0x08, 0x93, 0xF5
