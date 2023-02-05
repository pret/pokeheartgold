	.include "asm/macros.inc"
	.include "overlay_45_arm.inc"
	.include "global.inc"
	.public _version_NINTENDO_DWC_LOBBY

	.text

	arm_func_start ov45_022310B0
ov45_022310B0: ; 0x022310B0
	ldr r0, _022310BC ; =_022577C4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
_022310BC: .word _022577C4
	arm_func_end ov45_022310B0

	arm_func_start ov45_022310C0
ov45_022310C0: ; 0x022310C0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldr r8, [sp, #0x28]
	mov r7, r0
	mov r0, r8
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl DWC_CheckUserData
	cmp r0, #0
	beq _022310FC
	mov r0, r8
	bl DWC_CheckHasProfile
	cmp r0, #0
	bne _02231108
_022310FC:
	add sp, sp, #0x10
	mov r0, #3
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02231108:
	ldr r1, [r8, #0x1c]
	ldr r0, [sp, #0x2c]
	str r1, [sp]
	ldr ip, [sp, #0x30]
	str r0, [sp, #4]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	str ip, [sp, #8]
	mov r4, #1
	str r4, [sp, #0xc]
	bl ov45_02231144
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov45_022310C0

	arm_func_start ov45_02231144
ov45_02231144: ; 0x02231144
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x30
	ldr r4, _02231430 ; =_022577C4
	mov r8, r0
	ldr r0, [r4]
	mov r7, r1
	cmp r0, #0
	mov r6, r2
	mov r5, r3
	addne sp, sp, #0x30
	movne r0, #4
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r3, _02231434 ; =ov45_02236070
	ldr r2, _02231438 ; =ov45_022362B4
	mov r1, #5
	ldr r0, _0223143C ; =0x0000047C
	str r3, [sp, #0x24]
	str r2, [sp, #0x28]
	str r1, [sp, #0x2c]
	bl ov45_02242394
	movs r4, r0
	beq _022312D8
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	add lr, r4, #8
	mov ip, #4
_022311B0:
	ldmia r5!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022311B0
	ldr r1, [r5]
	ldr r0, [sp, #0x48]
	str r1, [lr]
	str r0, [r4, #0x4c]
	ldr r0, [sp, #0x54]
	str r6, [r4, #0x50]
	str r0, [r4, #0x54]
	mov r0, #0
	add r2, r4, #0x58
	mov r1, r0
_022311E8:
	str r1, [r2, r0, lsl #2]
	add r0, r0, #1
	cmp r0, #3
	blo _022311E8
	str r1, [r4, #0x64]
	str r1, [r4, #0x68]
	str r1, [r4, #0x6c]
	str r1, [r4, #0x70]
	mov r0, #5
	str r0, [r4, #0xb8]
	add r0, r4, #0xbc
	mov r3, #0
_02231218:
	str r3, [r0, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #3
	blo _02231218
	mov r0, #5
	str r0, [r4, #0xd0]
	add r0, r4, #0xd4
	mov r2, #0
_02231238:
	str r2, [r0, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #3
	blo _02231238
	ldr r0, _02231440 ; =ov45_02254FA0
	add r1, r4, #0xf0
	str r0, [r4, #0xe8]
	str r2, [r4, #0xec]
	str r2, [r4, #0xf0]
	str r1, [r4, #0xf4]
	ldr r0, _02231444 ; =ov45_02254FB0
	add r1, sp, #8
	str r0, [r4, #0xf8]
	mov r0, #5
	str r0, [r4, #0xfc]
	str r2, [r4, #0x100]
	str r2, [r4, #0x104]
	add r0, sp, #0x14
	str r2, [r4, #0x108]
	bl ov00_021ECB94
	add r0, sp, #0x14
	add r1, sp, #8
	bl RTC_ConvertDateTimeToSecond
	str r0, [r4, #0x100]
	str r1, [r4, #0x104]
	mov r0, #1
	mov r2, #0
	str r0, [r4, #0x10c]
	str r2, [r4, #0x110]
	str r2, [r4, #0x114]
	str r2, [r4, #0x118]
	str r0, [r4, #0x11c]
	sub r0, r2, #1
	str r0, [r4, #0x124]
	str r2, [r4, #0x134]
	str r2, [r4, #0x138]
	add r1, r4, #0x138
	add r0, r4, #0x144
	str r1, [r4, #0x140]
	bl ov45_02238B08
_022312D8:
	ldr r0, _02231430 ; =_022577C4
	cmp r4, #0
	str r4, [r0]
	addeq sp, sp, #0x30
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r4, [sp, #0x48]
	add r3, sp, #0x24
	mov r0, r8
	mov r1, r7
	mov r2, r6
	str r4, [sp]
	bl ov45_02240B10
	mov r4, r0
	ldr r1, _02231430 ; =_022577C4
	mov r0, #0
	strb r0, [sp, #4]
	cmp r4, #1
	ldr r1, [r1]
	beq _02231334
	cmp r4, #2
	moveq r0, #3
	b _02231338
_02231334:
	mov r0, #2
_02231338:
	cmp r0, #0
	strne r0, [r1, #4]
	movne r0, #0xa
	strne r0, [r1]
	cmp r4, #0
	beq _022313F4
	ldr r0, _02231430 ; =_022577C4
	ldr r5, [r0]
	cmp r5, #0
	beq _022313E8
	beq _022313DC
	add r0, r5, #0x194
	bl ov45_0223770C
	add r0, r5, #0x17c
	bl ov45_02236AE8
	add r0, r5, #0x170
	bl ov45_0223775C
	add r0, r5, #0x134
	bl ov45_02236CB0
	add r0, r5, #0x134
	bl ov45_02236E38
	ldr r1, _02231440 ; =ov45_02254FA0
	add r0, r5, #0xe8
	str r1, [r5, #0xe8]
	bl ov45_0223DF4C
	add r0, r5, #0x110
	bl ov45_022379D4
	add r0, r5, #0xec
	bl ov45_02236B88
	add r0, r5, #0xd4
	bl ov45_02237BC8
	add r0, r5, #0xbc
	bl ov45_02237BC8
	add r0, r5, #0x58
	bl ov45_02237BC8
	cmp r5, #0
	beq _022313DC
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl ov00_021EC2EC
_022313DC:
	ldr r0, _02231430 ; =_022577C4
	mov r1, #0
	str r1, [r0]
_022313E8:
	add sp, sp, #0x30
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022313F4:
	ldr r0, _02231430 ; =_022577C4
	ldr r1, [sp, #0x48]
	ldr r0, [r0]
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	add r0, r0, #0xe8
	bl ov45_0223E100
	bl ov45_022335A0
	ldr r0, _02231430 ; =_022577C4
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1]
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02231430: .word _022577C4
_02231434: .word ov45_02236070
_02231438: .word ov45_022362B4
_0223143C: .word 0x0000047C
_02231440: .word ov45_02254FA0
_02231444: .word ov45_02254FB0
	arm_func_end ov45_02231144

	arm_func_start ov45_02231448
ov45_02231448: ; 0x02231448
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x18
	bl ov45_022379D4
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02231448

	arm_func_start ov45_02231460
ov45_02231460: ; 0x02231460
	stmdb sp!, {r4, lr}
	ldr r1, _0223148C ; =ov45_02254FA0
	mov r4, r0
	str r1, [r4]
	bl ov45_0223DF4C
	add r0, r4, #0x28
	bl ov45_022379D4
	add r0, r4, #4
	bl ov45_02236B88
	mov r0, r4
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223148C: .word ov45_02254FA0
	arm_func_end ov45_02231460

	arm_func_start ov45_02231490
ov45_02231490: ; 0x02231490
	stmdb sp!, {r3, lr}
	ldr r0, _02231510 ; =_022577C4
	ldr r1, [r0]
	cmp r1, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r1]
	cmp r0, #9
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r1, #0x134
	bl ov45_02236CB0
	ldr r0, _02231510 ; =_022577C4
	mov r1, #9
	ldr r0, [r0]
	str r1, [r0]
	bl ov45_02240F9C
	ldr r1, _02231510 ; =_022577C4
	mov r2, #0
	strb r2, [sp]
	cmp r0, #1
	ldr r3, [r1]
	beq _022314F8
	cmp r0, #2
	moveq r2, #3
	b _022314FC
_022314F8:
	mov r2, #2
_022314FC:
	cmp r2, #0
	strne r2, [r3, #4]
	movne r1, #0xa
	strne r1, [r3]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02231510: .word _022577C4
	arm_func_end ov45_02231490

	arm_func_start ov45_02231514
ov45_02231514: ; 0x02231514
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x6c
	ldr r0, _02231C20 ; =ov45_022577D4
	ldr r7, [r0]
	mov r0, #0
	cmp r7, #0
	beq _022317B0
	str r0, [sp, #0x10]
	bl ov45_022545F0
	cmp r0, #0
	beq _02231734
	cmp r0, #1
	beq _02231620
	cmp r0, #8
	bne _02231778
	add r0, sp, #0x10
	bl ov45_02254774
	mov r5, r0
	ldr r1, [sp, #0x10]
	mov r0, #0
	bl ov00_021EC2A8
	movs r4, r0
	beq _02231580
	ldr r2, [sp, #0x10]
	mov r0, r5
	mov r1, r4
	bl MI_CpuCopy8
_02231580:
	cmp r4, #0
	beq _022315C8
	ldr r6, [r7, #0x38]
	ldr r5, [sp, #0x10]
	bl ov45_022546F8
	ldr r2, _02231C24 ; =ov45_022577D8
	ldr r0, _02231C20 ; =ov45_022577D4
	ldr r8, [r2]
	ldr r3, [r0]
	mov r1, r4
	str r3, [r2]
	str r8, [r0]
	ldr r7, [r7, #0x34]
	mov r2, r5
	mov r3, r6
	mov r0, #1
	blx r7
	b _02231600
_022315C8:
	ldr r5, [r7, #0x38]
	bl ov45_022546F8
	ldr r3, _02231C24 ; =ov45_022577D8
	mov r0, #0
	ldr r2, _02231C20 ; =ov45_022577D4
	ldr r8, [r3]
	ldr r6, [r2]
	mov r1, r0
	str r6, [r3]
	str r8, [r2]
	ldr r6, [r7, #0x34]
	mov r2, r0
	mov r3, r5
	blx r6
_02231600:
	cmp r4, #0
	beq _02231618
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02231618:
	mov r0, #1
	b _0223177C
_02231620:
	bl ov00_021EC210
	ldr r0, [r7, #4]
	subs r0, r0, #1
	str r0, [r7, #4]
	beq _022316F4
	bl ov45_022546F8
	ldr r0, [r7, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, r7, #0xd
	ldrne r1, [r7, #0x14]
	ldr r0, [r7, #8]
	bl ov45_0225443C
	ldr r0, [r7, #0x3c]
	ldr r4, [r7, #0x2c]
	cmp r0, #0
	ldr r0, [r7, #0x18]
	beq _022316A0
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r5, r7, #0x19
	ldrne r5, [r7, #0x20]
	add r0, r7, #0x28
	bl ov45_02231C78
	mov r1, #0
	str r1, [sp]
	mov r2, r0
	ldr r1, [r7, #0x24]
	mov r0, r5
	mov r3, r4
	bl ov45_02254A04
	b _022316D4
_022316A0:
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r5, r7, #0x19
	ldrne r5, [r7, #0x20]
	add r0, r7, #0x28
	bl ov45_02231C78
	mov r1, #0
	str r1, [sp]
	mov r2, r0
	ldr r1, [r7, #0x24]
	mov r0, r5
	mov r3, r4
	bl ov45_022549E0
_022316D4:
	cmp r0, #0
	moveq r0, #1
	beq _022316E8
	bl ov45_022546F8
	mov r0, #0
_022316E8:
	cmp r0, #0
	movne r0, #0
	bne _0223177C
_022316F4:
	ldr r4, [r7, #0x38]
	bl ov45_022546F8
	ldr r3, _02231C24 ; =ov45_022577D8
	mov r0, #0
	ldr r2, _02231C20 ; =ov45_022577D4
	ldr r6, [r3]
	ldr r5, [r2]
	mov r1, r0
	str r5, [r3]
	str r6, [r2]
	ldr r5, [r7, #0x34]
	mov r2, r0
	mov r3, r4
	blx r5
	mov r0, #1
	b _0223177C
_02231734:
	bl ov00_021EC210
	ldr r5, [r7, #0x38]
	bl ov45_022546F8
	mov r0, #0
	ldr r4, _02231C24 ; =ov45_022577D8
	ldr r2, _02231C20 ; =ov45_022577D4
	ldr r6, [r4]
	mov r3, r5
	ldr r5, [r2]
	mov r1, r0
	str r5, [r4]
	str r6, [r2]
	ldr r4, [r7, #0x34]
	mov r2, r0
	blx r4
	mov r0, #1
	b _0223177C
_02231778:
	mov r0, #0
_0223177C:
	cmp r0, #0
	ldrne r0, _02231C24 ; =ov45_022577D8
	ldrne r0, [r0]
	cmpne r0, #0
	beq _022317AC
	beq _022317A0
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
_022317A0:
	ldr r0, _02231C24 ; =ov45_022577D8
	mov r1, #0
	str r1, [r0]
_022317AC:
	mov r0, #1
_022317B0:
	cmp r0, #0
	beq _022317D4
	ldr r0, _02231C28 ; =_022577C4
	ldr r0, [r0]
	cmp r0, #0
	bne _022317EC
	add sp, sp, #0x6c
	mov r0, #9
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022317D4:
	ldr r0, _02231C28 ; =_022577C4
	ldr r0, [r0]
	cmp r0, #0
	addeq sp, sp, #0x6c
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022317EC:
	cmp r0, #0
	beq _02231810
	ldr r0, _02231C28 ; =_022577C4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0xa
	addeq sp, sp, #0x6c
	moveq r0, #0xa
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02231810:
	bl ov45_02240874
	cmp r0, #5
	addls pc, pc, r0, lsl #2
	b _02231918
_02231820: ; jump table
	b _02231838 ; case 0
	b _02231918 ; case 1
	b _02231918 ; case 2
	b _022318E0 ; case 3
	b _02231918 ; case 4
	b _022318FC ; case 5
_02231838:
	bl ov45_02231490
	ldr r0, _02231C28 ; =_022577C4
	ldr r4, [r0]
	cmp r4, #0
	beq _022318D4
	beq _022318C8
	add r0, r4, #0x194
	bl ov45_0223770C
	add r0, r4, #0x17c
	bl ov45_02236AE8
	add r0, r4, #0x170
	bl ov45_0223775C
	add r0, r4, #0x134
	bl ov45_02236CB0
	add r0, r4, #0x134
	bl ov45_02236E38
	ldr r1, _02231C2C ; =ov45_02254FA0
	add r0, r4, #0xe8
	str r1, [r4, #0xe8]
	bl ov45_0223DF4C
	add r0, r4, #0x110
	bl ov45_022379D4
	add r0, r4, #0xec
	bl ov45_02236B88
	add r0, r4, #0xd4
	bl ov45_02237BC8
	add r0, r4, #0xbc
	bl ov45_02237BC8
	add r0, r4, #0x58
	bl ov45_02237BC8
	cmp r4, #0
	beq _022318C8
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_022318C8:
	ldr r0, _02231C28 ; =_022577C4
	mov r1, #0
	str r1, [r0]
_022318D4:
	add sp, sp, #0x6c
	mov r0, #9
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022318E0:
	ldr r0, _02231C28 ; =_022577C4
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #1
	moveq r0, #2
	streq r0, [r1]
	b _02231918
_022318FC:
	bl ov45_02240A58
	ldr r1, _02231C28 ; =_022577C4
	cmp r0, #0
	ldr r1, [r1]
	strne r0, [r1, #4]
	movne r0, #0xa
	strne r0, [r1]
_02231918:
	ldr r2, _02231C28 ; =_022577C4
	add r0, sp, #0x28
	add r1, sp, #0x38
	ldr r5, [r2]
	bl ov00_021ECB94
	add r0, sp, #0x28
	add r1, sp, #0x38
	bl RTC_ConvertDateTimeToSecond
	ldr r2, [r5, #0x140]
	add r7, r5, #0x138
	mov r6, r0
	mov sb, r1
	str r2, [sp, #0xc]
	cmp r2, r7
	beq _022319E8
	mov fp, #1
	mov sl, #0
	add r4, sp, #0xc
_02231960:
	ldr r1, [r2, #0x10]
	ldr r0, [r2, #0x14]
	subs r1, r6, r1
	ldr r8, [r2, #0x18]
	sbc r0, sb, r0
	ldr r3, [r2, #0x1c]
	subs r1, r8, r1
	sbcs r1, r3, r0
	bge _022319A4
	str r6, [r2, #0x10]
	str sb, [r2, #0x14]
	ldr r0, [r2, #0x20]
	ldr r1, [r2, #0x24]
	blx r1
	cmp r0, #0
	moveq r0, sl
	beq _022319A8
_022319A4:
	mov r0, fp
_022319A8:
	cmp r0, #0
	bne _022319D4
	ldr r8, [sp, #0xc]
	mov r0, r4
	bl ov45_02236E58
	add r0, sp, #8
	mov r2, r8
	add r1, r5, #0x134
	str r8, [sp, #4]
	bl ov45_02236C40
	b _022319DC
_022319D4:
	mov r0, r4
	bl ov45_02236E58
_022319DC:
	ldr r2, [sp, #0xc]
	cmp r2, r7
	bne _02231960
_022319E8:
	add r0, r5, #0xe8
	bl ov45_0223E558
	add r0, r5, #0x144
	bl ov45_0223AF28
	ldr r0, _02231C28 ; =_022577C4
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _02231C0C
_02231A10: ; jump table
	b _02231A3C ; case 0
	b _02231C0C ; case 1
	b _02231A48 ; case 2
	b _02231A54 ; case 3
	b _02231A74 ; case 4
	b _02231C0C ; case 5
	b _02231AD4 ; case 6
	b _02231B3C ; case 7
	b _02231C0C ; case 8
	b _02231C0C ; case 9
	b _02231C0C ; case 10
_02231A3C:
	add sp, sp, #0x6c
	mov r0, #9
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02231A48:
	mov r0, #3
	str r0, [r1]
	b _02231C0C
_02231A54:
	ldr r0, [r1, #0x144]
	cmp r0, #2
	movge r0, #1
	movlt r0, #0
	cmp r0, #0
	movne r0, #4
	strne r0, [r1]
	b _02231C0C
_02231A74:
	ldr r1, _02231C30 ; =ov45_022550B0
	add r0, sp, #0x50
	bl ov45_02237B58
	add r0, sp, #0x44
	add r2, sp, #0x50
	mov r1, #0
	bl ov45_02233994
	ldr r0, [sp, #0x44]
	ldr r1, _02231C34 ; =ov45_0223633C
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #0x45
	ldrne r0, [sp, #0x4c]
	mov r2, #0
	bl ov45_02241A20
	add r0, sp, #0x44
	bl ov45_02237BC8
	add r0, sp, #0x50
	bl ov45_02237BC8
	ldr r0, _02231C28 ; =_022577C4
	mov r1, #5
	ldr r0, [r0]
	str r1, [r0]
	b _02231C0C
_02231AD4:
	bl ov45_02233CA0
	cmp r0, #0
	beq _02231B28
	ldr r1, _02231C28 ; =_022577C4
	cmp r0, #1
	ldr r1, [r1]
	beq _02231AFC
	cmp r0, #2
	beq _02231B04
	b _02231B0C
_02231AFC:
	mov r0, #2
	b _02231B10
_02231B04:
	mov r0, #3
	b _02231B10
_02231B0C:
	mov r0, #0
_02231B10:
	cmp r0, #0
	beq _02231C0C
	str r0, [r1, #4]
	mov r0, #0xa
	str r0, [r1]
	b _02231C0C
_02231B28:
	ldr r0, _02231C28 ; =_022577C4
	mov r1, #7
	ldr r0, [r0]
	str r1, [r0]
	b _02231C0C
_02231B3C:
	bl ov45_02234688
	cmp r0, #0
	beq _02231C0C
	ldr r0, _02231C28 ; =_022577C4
	add r7, sp, #0x60
	ldr r4, [r0]
	mov r0, #0
	str r0, [r4, #0x10c]
	ldr r0, [r4, #0xfc]
	mov r6, #1
	str r0, [sp, #0x5c]
	add r0, r4, #0x100
	ldmia r0, {r2, r3}
	stmia r7, {r2, r3}
	ldr r1, [sp, #0x5c]
	str r6, [sp, #0x68]
	add r0, sp, #0x18
	str r1, [sp, #0x14]
	add r5, sp, #0x14
	ldmia r7, {r2, r3}
	stmia r0, {r2, r3}
	mov r1, r5
	add r0, r4, #0xfc
	mov r2, #0x10
	str r6, [sp, #0x20]
	str r6, [sp, #0x24]
	bl memcmp
	cmp r0, #0
	moveq r0, r6
	movne r0, #0
	cmp r0, #0
	bne _02231BE4
	ldr r0, [r5]
	add r1, r5, #4
	str r0, [r4, #0xfc]
	add r0, r4, #0x100
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldr r1, [r5, #0xc]
	mov r0, #1
	str r1, [r4, #0x108]
	str r0, [r4, #0x10c]
_02231BE4:
	mov r0, #1
	ldr r1, _02231C28 ; =_022577C4
	str r0, [r4, #0x128]
	ldr r2, [r1]
	mov r3, #8
	str r3, [r2]
	ldr r2, [r1]
	mov r1, #0
	ldr r2, [r2, #8]
	blx r2
_02231C0C:
	ldr r0, _02231C28 ; =_022577C4
	ldr r0, [r0]
	ldr r0, [r0]
	add sp, sp, #0x6c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02231C20: .word ov45_022577D4
_02231C24: .word ov45_022577D8
_02231C28: .word _022577C4
_02231C2C: .word ov45_02254FA0
_02231C30: .word ov45_022550B0
_02231C34: .word ov45_0223633C
	arm_func_end ov45_02231514

	arm_func_start ov45_02231C38
ov45_02231C38: ; 0x02231C38
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x28
	bl ov45_022379D4
	add r0, r4, #0x18
	bl ov45_02237BC8
	add r0, r4, #0xc
	bl ov45_02237BC8
	cmp r4, #0
	beq _02231C70
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02231C70:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02231C38

	arm_func_start ov45_02231C78
ov45_02231C78: ; 0x02231C78
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	ldrne r0, [r0]
	bx lr
	arm_func_end ov45_02231C78

	arm_func_start ov45_02231C8C
ov45_02231C8C: ; 0x02231C8C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x54
	ldr r1, _02231E88 ; =_022577C4
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	addeq sp, sp, #0x54
	moveq r0, #4
	ldmeqia sp!, {r4, r5, pc}
	beq _02231CC8
	ldr r0, [r1]
	cmp r0, #0xa
	addeq sp, sp, #0x54
	moveq r0, #7
	ldmeqia sp!, {r4, r5, pc}
_02231CC8:
	cmp r1, #0
	beq _02231CEC
	ldr r0, _02231E88 ; =_022577C4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	addne sp, sp, #0x54
	movne r0, #4
	ldmneia sp!, {r4, r5, pc}
_02231CEC:
	cmp r1, #0
	beq _02231D14
	ldr r0, [r1, #0xd0]
	cmp r0, #5
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	addne sp, sp, #0x54
	movne r0, #4
	ldmneia sp!, {r4, r5, pc}
_02231D14:
	ldr r5, _02231E8C ; =ov45_02235C40
	ldr lr, _02231E90 ; =ov45_02235E4C
	ldr ip, _02231E94 ; =ov45_02236090
	ldr r3, _02231E98 ; =ov45_022362D0
	ldr r2, _02231E9C ; =ov45_02236A44
	add r0, sp, #0x24
	str r5, [sp, #0x3c]
	str lr, [sp, #0x40]
	str ip, [sp, #0x44]
	str r3, [sp, #0x48]
	str r2, [sp, #0x4c]
	str r4, [sp, #0x50]
	bl ov45_02231EB0
	add r0, sp, #0x30
	add r2, sp, #0x24
	mov r1, r4
	bl ov45_02233994
	add r0, sp, #0x24
	bl ov45_02237BC8
	cmp r4, #4
	addls pc, pc, r4, lsl #2
	b _02231D98
_02231D6C: ; jump table
	b _02231D98 ; case 0
	b _02231D80 ; case 1
	b _02231D80 ; case 2
	b _02231D88 ; case 3
	b _02231D90 ; case 4
_02231D80:
	ldr r2, _02231EA0 ; =ov45_02254D5C
	b _02231D9C
_02231D88:
	ldr r2, _02231EA4 ; =ov45_02254D1C
	b _02231D9C
_02231D90:
	ldr r2, _02231EA8 ; =ov45_02254D3C
	b _02231D9C
_02231D98:
	mov r2, #0
_02231D9C:
	ldr r0, [sp, #0x30]
	ldr r1, _02231EAC ; =ov45_02235A94
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #0x31
	ldrne r0, [sp, #0x38]
	add r3, sp, #0x3c
	stmia sp, {r1, r4}
	ldr r2, [r2, #0x1c]
	mov r1, #0
	bl ov45_02241048
	mov r5, r0
	ldr r1, _02231E88 ; =_022577C4
	mov r0, #0
	strb r0, [sp, #8]
	cmp r5, #1
	ldr r1, [r1]
	beq _02231DF0
	cmp r5, #2
	moveq r0, #3
	b _02231DF4
_02231DF0:
	mov r0, #2
_02231DF4:
	cmp r0, #0
	strne r0, [r1, #4]
	movne r0, #0xa
	strne r0, [r1]
	cmp r5, #0
	beq _02231E20
	add r0, sp, #0x30
	bl ov45_02237BC8
	add sp, sp, #0x54
	mov r0, r5
	ldmia sp!, {r4, r5, pc}
_02231E20:
	add r0, sp, #0x10
	str r4, [sp, #0xc]
	add r1, sp, #0x30
	add r4, sp, #0xc
	bl ov45_02237A24
	mov r1, #0
	ldr r0, _02231E88 ; =_022577C4
	ldr r2, [sp, #0xc]
	ldr r5, [r0]
	str r1, [r4, #0x10]
	str r1, [r4, #0x14]
	add r1, sp, #0x10
	str r2, [r5, #0xd0]
	add r0, r5, #0xd4
	bl ov45_02237D48
	ldr r1, [sp, #0x1c]
	add r0, sp, #0x10
	str r1, [r5, #0xe0]
	ldr r1, [sp, #0x20]
	str r1, [r5, #0xe4]
	bl ov45_02237BC8
	add r0, sp, #0x30
	bl ov45_02237BC8
	mov r0, #0
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_02231E88: .word _022577C4
_02231E8C: .word ov45_02235C40
_02231E90: .word ov45_02235E4C
_02231E94: .word ov45_02236090
_02231E98: .word ov45_022362D0
_02231E9C: .word ov45_02236A44
_02231EA0: .word ov45_02254D5C
_02231EA4: .word ov45_02254D1C
_02231EA8: .word ov45_02254D3C
_02231EAC: .word ov45_02235A94
	arm_func_end ov45_02231C8C

	arm_func_start ov45_02231EB0
ov45_02231EB0: ; 0x02231EB0
	ldr ip, _02231EBC ; =ov45_02237A24
	add r1, r1, #0x58
	bx ip
	.balign 4, 0
_02231EBC: .word ov45_02237A24
	arm_func_end ov45_02231EB0

	arm_func_start ov45_02231EC0
ov45_02231EC0: ; 0x02231EC0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	ldr r0, _022320B0 ; =_022577C4
	ldr r1, [r0]
	cmp r1, #0
	addeq sp, sp, #0x40
	moveq r0, #4
	ldmeqia sp!, {r3, r4, r5, pc}
	beq _02231EF8
	ldr r0, [r1]
	cmp r0, #0xa
	addeq sp, sp, #0x40
	moveq r0, #7
	ldmeqia sp!, {r3, r4, r5, pc}
_02231EF8:
	cmp r1, #0
	beq _02231F1C
	ldr r0, _022320B0 ; =_022577C4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	addne sp, sp, #0x40
	movne r0, #4
	ldmneia sp!, {r3, r4, r5, pc}
_02231F1C:
	cmp r1, #0
	beq _02231F3C
	ldr r0, [r1, #0xd0]
	cmp r0, #5
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _02231F48
_02231F3C:
	add sp, sp, #0x40
	mov r0, #4
	ldmia sp!, {r3, r4, r5, pc}
_02231F48:
	add r0, sp, #0x24
	add r1, r1, #0xd0
	bl ov45_022320B4
	ldr r0, [sp, #0x24]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #0x25
	ldrne r0, [sp, #0x2c]
	bl ov45_022412CC
	ldr r1, _022320B0 ; =_022577C4
	mov r2, #0
	strb r2, [sp]
	cmp r0, #1
	ldr r1, [r1]
	beq _02231F90
	cmp r0, #2
	moveq r2, #3
	b _02231F94
_02231F90:
	mov r2, #2
_02231F94:
	cmp r2, #0
	strne r2, [r1, #4]
	movne r0, #0xa
	strne r0, [r1]
	add r0, sp, #0x24
	bl ov45_02237BC8
	ldr r0, _022320B0 ; =_022577C4
	mov r1, #0
	ldr r4, [r0]
	add r2, sp, #0x18
	mov r0, r1
_02231FC0:
	str r0, [r2, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #3
	blo _02231FC0
	mov r2, #5
	add r1, sp, #0x18
	add r0, r4, #0xd4
	str r2, [r4, #0xd0]
	bl ov45_02237D48
	mov r1, #0
	str r1, [r4, #0xe0]
	add r0, sp, #0x18
	str r1, [r4, #0xe4]
	bl ov45_02237BC8
	ldr r0, _022320B0 ; =_022577C4
	mov r1, #0
	ldr r4, [r0]
	add r5, sp, #4
	str r1, [r4, #0x10c]
	ldr r0, [r4, #0xfc]
	add r1, sp, #0x34
	str r0, [sp, #0x30]
	add r0, r4, #0x100
	ldmia r0, {r2, r3}
	stmia r1, {r2, r3}
	ldr ip, [r4, #0x108]
	mov r0, #5
	str ip, [sp, #0x3c]
	str r0, [sp, #0x30]
	str r0, [sp, #4]
	ldmia r1, {r2, r3}
	add r1, sp, #8
	stmia r1, {r2, r3}
	mov r0, #1
	str r0, [sp, #0x14]
	mov r1, r5
	add r0, r4, #0xfc
	mov r2, #0x10
	str ip, [sp, #0x10]
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	bne _0223209C
	ldr r0, [r5]
	add r1, r5, #4
	str r0, [r4, #0xfc]
	add r0, r4, #0x100
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldr r1, [r5, #0xc]
	mov r0, #1
	str r1, [r4, #0x108]
	str r0, [r4, #0x10c]
_0223209C:
	mov r0, #1
	str r0, [r4, #0x128]
	mov r0, #0
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022320B0: .word _022577C4
	arm_func_end ov45_02231EC0

	arm_func_start ov45_022320B4
ov45_022320B4: ; 0x022320B4
	ldr ip, _022320C0 ; =ov45_02237A24
	add r1, r1, #4
	bx ip
	.balign 4, 0
_022320C0: .word ov45_02237A24
	arm_func_end ov45_022320B4

	arm_func_start ov45_022320C4
ov45_022320C4: ; 0x022320C4
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x1c
	ldr r1, _0223216C ; =_022577C4
	mov r5, r0
	ldr r4, [r1]
	cmp r4, #0
	addeq sp, sp, #0x1c
	moveq r0, #4
	ldmeqia sp!, {r4, r5, pc}
	beq _02232100
	ldr r0, [r4]
	cmp r0, #0xa
	addeq sp, sp, #0x1c
	moveq r0, #7
	ldmeqia sp!, {r4, r5, pc}
_02232100:
	cmp r4, #0
	beq _02232124
	ldr r0, _0223216C ; =_022577C4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	addne sp, sp, #0x1c
	movne r0, #4
	ldmneia sp!, {r4, r5, pc}
_02232124:
	add r0, sp, #0xc
	add r1, sp, #0
	bl ov00_021ECB94
	add r0, sp, #0xc
	add r1, sp, #0
	bl RTC_ConvertDateTimeToSecond
	stmia r5, {r0, r1}
	ldr r2, [r4, #0x14c]
	ldr r1, [r4, #0x150]
	mov r0, #0
	str r2, [r5, #8]
	str r1, [r5, #0xc]
	ldr r2, [r4, #0x154]
	ldr r1, [r4, #0x158]
	str r2, [r5, #0x10]
	str r1, [r5, #0x14]
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0223216C: .word _022577C4
	arm_func_end ov45_022320C4

	arm_func_start ov45_02232170
ov45_02232170: ; 0x02232170
	stmdb sp!, {r3, lr}
	ldr r2, _022321DC ; =_022577C4
	ldr r3, [r2]
	mov r2, r1
	cmp r3, #0
	moveq r0, #4
	ldmeqia sp!, {r3, pc}
	beq _022321A0
	ldr r1, [r3]
	cmp r1, #0xa
	moveq r0, #7
	ldmeqia sp!, {r3, pc}
_022321A0:
	cmp r3, #0
	beq _022321C0
	ldr r1, _022321DC ; =_022577C4
	ldr r1, [r1]
	ldr r1, [r1]
	cmp r1, #8
	movne r0, #4
	ldmneia sp!, {r3, pc}
_022321C0:
	mov r1, r0
	add r0, r3, #0x144
	bl ov45_02238B70
	cmp r0, #0
	movne r0, #0
	moveq r0, #3
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022321DC: .word _022577C4
	arm_func_end ov45_02232170

	arm_func_start ov45_022321E0
ov45_022321E0: ; 0x022321E0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r0, _022322A0 ; =_022577C4
	ldr r1, [r0]
	cmp r1, #0
	addeq sp, sp, #0xc
	moveq r0, #3
	ldmeqia sp!, {r3, r4, pc}
	beq _02232218
	ldr r0, [r1]
	cmp r0, #0xa
	addeq sp, sp, #0xc
	moveq r0, #3
	ldmeqia sp!, {r3, r4, pc}
_02232218:
	cmp r1, #0
	beq _0223223C
	ldr r0, _022322A0 ; =_022577C4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	addne sp, sp, #0xc
	movne r0, #3
	ldmneia sp!, {r3, r4, pc}
_0223223C:
	ldr r0, [r1, #0xd0]
	cmp r0, #5
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	add r0, sp, #0
	add r1, r1, #0xd0
	bl ov45_022320B4
	ldr r0, [sp]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #1
	ldrne r0, [sp, #8]
	bl ov45_02240A80
	mov r4, r0
	add r0, sp, #0
	bl ov45_02237BC8
	cmp r4, #0
	movne r0, #2
	moveq r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_022322A0: .word _022577C4
	arm_func_end ov45_022321E0

	arm_func_start ov45_022322A4
ov45_022322A4: ; 0x022322A4
	stmdb sp!, {r3, lr}
	ldr ip, _02232300 ; =_022577C4
	ldr lr, [ip]
	cmp lr, #0
	moveq r0, #4
	ldmeqia sp!, {r3, pc}
	beq _022322D0
	ldr ip, [lr]
	cmp ip, #0xa
	moveq r0, #7
	ldmeqia sp!, {r3, pc}
_022322D0:
	cmp lr, #0
	beq _022322F0
	ldr ip, _02232300 ; =_022577C4
	ldr ip, [ip]
	ldr ip, [ip]
	cmp ip, #8
	movne r0, #4
	ldmneia sp!, {r3, pc}
_022322F0:
	ldr ip, [sp, #8]
	str ip, [sp]
	bl ov45_02233434
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232300: .word _022577C4
	arm_func_end ov45_022322A4

	arm_func_start ov45_02232304
ov45_02232304: ; 0x02232304
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x14
	ldr r4, _02232428 ; =_022577C4
	mov r6, r0
	ldr ip, [r4]
	mov r5, r2
	cmp ip, #0
	mov r4, r3
	addeq sp, sp, #0x14
	moveq r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	beq _02232348
	ldr r0, [ip]
	cmp r0, #0xa
	addeq sp, sp, #0x14
	moveq r0, #7
	ldmeqia sp!, {r3, r4, r5, r6, pc}
_02232348:
	cmp ip, #0
	beq _0223236C
	ldr r0, _02232428 ; =_022577C4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	addne sp, sp, #0x14
	movne r0, #4
	ldmneia sp!, {r3, r4, r5, r6, pc}
_0223236C:
	mov r2, r1
	add r0, sp, #8
	add r1, ip, #0xb8
	bl ov45_02232434
	ldr r1, _0223242C ; =ov45_022550B4
	add r0, sp, #8
	bl ov45_02237FD8
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	beq _022323B0
	add r0, sp, #8
	bl ov45_02237BC8
	add sp, sp, #0x14
	mov r0, #5
	ldmia sp!, {r3, r4, r5, r6, pc}
_022323B0:
	ldr r0, [sp, #8]
	ldr r3, _02232430 ; =ov45_02236308
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #9
	ldrne r0, [sp, #0x10]
	mov r1, r6
	mov r2, r5
	str r4, [sp]
	bl ov45_022417B4
	mov r4, r0
	ldr r1, _02232428 ; =_022577C4
	mov r0, #0
	strb r0, [sp, #4]
	cmp r4, #1
	ldr r1, [r1]
	beq _02232400
	cmp r4, #2
	moveq r0, #3
	b _02232404
_02232400:
	mov r0, #2
_02232404:
	cmp r0, #0
	strne r0, [r1, #4]
	movne r0, #0xa
	strne r0, [r1]
	add r0, sp, #8
	bl ov45_02237BC8
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_02232428: .word _022577C4
_0223242C: .word ov45_022550B4
_02232430: .word ov45_02236308
	arm_func_end ov45_02232304

	arm_func_start ov45_02232434
ov45_02232434: ; 0x02232434
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	cmp r2, #0
	bne _02232460
	bl ov45_022320B4
	add r3, sp, #0
	ldmia r4, {r0, r1, r2}
	add sp, sp, #0xc
	stmia r3, {r0, r1, r2}
	ldmia sp!, {r3, r4, pc}
_02232460:
	add r1, r1, #0x18
	bl ov45_022320B4
	add r3, sp, #0
	ldmia r4, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_02232434

	arm_func_start ov45_0223247C
ov45_0223247C: ; 0x0223247C
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, _022324FC ; =_022577C4
	ldr lr, [ip]
	cmp lr, #0
	addeq sp, sp, #0xc
	moveq r0, #4
	ldmeqia sp!, {pc}
	beq _022324B4
	ldr ip, [lr]
	cmp ip, #0xa
	addeq sp, sp, #0xc
	moveq r0, #7
	ldmeqia sp!, {pc}
_022324B4:
	cmp lr, #0
	beq _022324D8
	ldr ip, _022324FC ; =_022577C4
	ldr ip, [ip]
	ldr ip, [ip]
	cmp ip, #8
	addne sp, sp, #0xc
	movne r0, #4
	ldmneia sp!, {pc}
_022324D8:
	stmia sp, {r1, r2}
	mov r1, r0
	mov r2, #1
	str r3, [sp, #8]
	mov r3, r2
	mvn r0, #0
	bl ov45_0223325C
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.balign 4, 0
_022324FC: .word _022577C4
	arm_func_end ov45_0223247C

	arm_func_start ov45_02232500
ov45_02232500: ; 0x02232500
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, _0223257C ; =_022577C4
	ldr lr, [ip]
	cmp lr, #0
	addeq sp, sp, #0xc
	moveq r0, #4
	ldmeqia sp!, {pc}
	beq _02232538
	ldr ip, [lr]
	cmp ip, #0xa
	addeq sp, sp, #0xc
	moveq r0, #7
	ldmeqia sp!, {pc}
_02232538:
	cmp lr, #0
	beq _0223255C
	ldr ip, _0223257C ; =_022577C4
	ldr ip, [ip]
	ldr ip, [ip]
	cmp ip, #8
	addne sp, sp, #0xc
	movne r0, #4
	ldmneia sp!, {pc}
_0223255C:
	stmia sp, {r1, r2}
	mov r2, #1
	str r3, [sp, #8]
	mov r3, r2
	mov r1, #5
	bl ov45_0223325C
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.balign 4, 0
_0223257C: .word _022577C4
	arm_func_end ov45_02232500

	arm_func_start ov45_02232580
ov45_02232580: ; 0x02232580
	ldr r0, _02232598 ; =_022577C4
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #0x4c]
	mvneq r0, #0
	bx lr
	.balign 4, 0
_02232598: .word _022577C4
	arm_func_end ov45_02232580

	arm_func_start ov45_0223259C
ov45_0223259C: ; 0x0223259C
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	ldrne r0, [r0]
	bx lr
	arm_func_end ov45_0223259C

	arm_func_start ov45_022325B0
ov45_022325B0: ; 0x022325B0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x3c
	ldr r3, _0223275C ; =_022577C4
	mov r6, r2
	ldr r5, [r3]
	cmp r5, #0
	addeq sp, sp, #0x3c
	moveq r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	beq _022325EC
	ldr r2, [r5]
	cmp r2, #0xa
	addeq sp, sp, #0x3c
	moveq r0, #7
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
_022325EC:
	cmp r5, #0
	beq _02232610
	ldr r2, _0223275C ; =_022577C4
	ldr r2, [r2]
	ldr r2, [r2]
	cmp r2, #8
	addne sp, sp, #0x3c
	movne r0, #4
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
_02232610:
	mov r2, #0
	str r2, [sp, #0x20]
	add r4, r0, r1
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	strb r2, [sp, #9]
	strb r2, [sp, #0xa]
	strb r2, [sp, #8]
	strb r2, [sp, #4]
	sub r2, sp, #4
	ldr r1, [sp, #0x1c]
	str r4, [r2]
	str r1, [r2, #4]
	add ip, sp, #0x20
	str r0, [sp, #0x10]
	ldr r3, [r2]
	add r1, sp, #0x10
	mov r0, ip
	str r4, [sp, #0x18]
	ldmia r1, {r1, r2}
	bl ov45_022327B8
	mov r2, #0
	ldrb r0, [sp, #0xc]
	ldr r1, [sp, #0x20]
	ldr ip, [sp, #0x24]
	str r2, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r2, [sp, #0x34]
	sub r2, sp, #4
	strb r0, [r2]
	add r4, sp, #0x2c
	ldr r3, [r2]
	mov r0, r4
	add r2, r1, ip
	bl ov45_022383E0
	mov r0, #1
	cmp r6, #0
	str r0, [r4, #0xc]
	strne r0, [r5, #0x11c]
	mov r6, r4
	ldr r8, [r5, #0x114]
	ldr r0, [r6, #4]
	mov r7, #0
	cmp r8, r0
	bne _022326FC
	cmp r8, #0
	beq _022326F8
	add r0, r5, #0x110
	bl ov45_02231C78
	mov r4, r0
	mov r0, r6
	bl ov45_02231C78
	mov r1, r0
	mov r0, r4
	mov r2, r8
	bl memcmp
	cmp r0, #0
	bne _022326FC
_022326F8:
	mov r7, #1
_022326FC:
	cmp r7, #0
	bne _02232738
	add r0, r5, #0x110
	cmp r0, r6
	beq _02232730
	mov r3, #0
	ldmia r6, {r1, r4}
	strb r3, [sp, #0xb]
	sub r2, sp, #4
	strb r3, [r2]
	ldr r3, [r2]
	add r2, r1, r4
	bl ov45_02232760
_02232730:
	mov r0, #1
	str r0, [r5, #0x11c]
_02232738:
	add r0, sp, #0x2c
	bl ov45_022379D4
	mov r1, #1
	add r0, sp, #0x20
	str r1, [r5, #0x12c]
	bl ov45_022379D4
	mov r0, #0
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223275C: .word _022577C4
	arm_func_end ov45_022325B0

	arm_func_start ov45_02232760
ov45_02232760: ; 0x02232760
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	ldr r1, [r7, #8]
	sub r4, r5, r6
	cmp r4, r1
	bls _022327A0
	mov r2, #0
	sub r1, r4, r1
	strb r2, [sp]
	bl ov45_02237890
	mov r2, r0
	mov r0, r7
	mov r1, r4
	bl ov45_02237820
_022327A0:
	ldr r0, [r7]
	mov r1, r6
	sub r2, r5, r6
	bl memmove
	str r4, [r7, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_02232760

	arm_func_start ov45_022327B8
ov45_022327B8: ; 0x022327B8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	ldr r3, [sp, #0x24]
	ldr r2, [sp, #0x1c]
	ldr r1, [r5, #8]
	sub r4, r3, r2
	cmp r4, r1
	bls _02232800
	mov r2, #0
	sub r1, r4, r1
	strb r2, [sp, #2]
	bl ov45_02237890
	mov r2, r0
	mov r0, r5
	mov r1, r4
	bl ov45_02237820
_02232800:
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #0x20]
	ldr r3, [sp, #0x24]
	str r1, [sp, #4]
	str r0, [sp, #8]
	cmp r1, r3
	ldr ip, [r5]
	beq _02232848
	mov r2, #0
_02232824:
	ldr r0, [sp, #4]
	strb r2, [sp]
	ldrb r1, [r0], #1
	str r0, [sp, #4]
	cmp r0, r3
	strb r1, [sp, #1]
	ldrsb r1, [sp, #1]
	strb r1, [ip], #1
	bne _02232824
_02232848:
	str r4, [r5, #4]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_022327B8

	arm_func_start ov45_0223285C
ov45_0223285C: ; 0x0223285C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x94
	ldr r1, _02232AD8 ; =_022577C4
	mov r5, r0
	ldr r1, [r1]
	cmp r1, #0
	addeq sp, sp, #0x94
	moveq r0, #4
	ldmeqia sp!, {r4, r5, pc}
	beq _02232898
	ldr r0, [r1]
	cmp r0, #0xa
	addeq sp, sp, #0x94
	moveq r0, #7
	ldmeqia sp!, {r4, r5, pc}
_02232898:
	cmp r1, #0
	beq _022328BC
	ldr r0, _02232AD8 ; =_022577C4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	addne sp, sp, #0x94
	movne r0, #4
	ldmneia sp!, {r4, r5, pc}
_022328BC:
	mov r1, #0
	add r0, sp, #0x88
	mov r2, r1
_022328C8:
	str r2, [r0, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #3
	blo _022328C8
	ldr r0, _02232AD8 ; =_022577C4
	ldr r4, [r0]
	ldr r0, [r4, #0x68]
	cmp r0, #0
	bne _022329D8
	mov r0, #1
	str r0, [r4, #0x68]
	ldr r0, [r5]
	add ip, r5, #0x10
	str r0, [r4, #0x74]
	ldr r0, [r5, #4]
	add r3, r4, #0x84
	str r0, [r4, #0x78]
	ldr r0, [r5, #8]
	mov r2, #0x10
	str r0, [r4, #0x7c]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x80]
_02232920:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	subs r2, r2, #1
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	bne _02232920
	add ip, r5, #0x30
	add r3, r4, #0xa4
	mov r2, #0xa
_0223294C:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	subs r2, r2, #1
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	bne _0223294C
	bl ov00_021FF368
	ldr r1, _02232ADC ; =0x10624DD3
	mov r3, #0x3e8
	umull r1, r2, r0, r1
	mov r2, r2, lsr #6
	umull r1, r2, r3, r2
	sub r2, r0, r1
	str r2, [sp]
	ldr r3, [r4, #0x4c]
	ldr r2, _02232AE0 ; =ov45_02254F88
	add r0, sp, #0x7c
	mov r1, #0x14
	bl ov45_02232B24
	add r0, sp, #0x88
	add r1, sp, #0x7c
	bl ov45_02237D48
	add r0, sp, #0x7c
	bl ov45_02237BC8
	ldr r0, [sp, #0x88]
	mov r2, #0x13
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #0x89
	ldrne r1, [sp, #0x90]
	add r0, r4, #0xa4
	bl strncpy
	mov r2, #1
_022329D8:
	cmp r2, #0
	bne _022329F4
	add r0, sp, #0x88
	bl ov45_02237BC8
	add sp, sp, #0x94
	mov r0, #4
	ldmia sp!, {r4, r5, pc}
_022329F4:
	ldr r0, [sp, #0x88]
	mov r2, #0x13
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #0x89
	ldrne r1, [sp, #0x90]
	add r0, r5, #0x30
	bl strncpy
	ldr r2, _02232AD8 ; =_022577C4
	add r0, sp, #0x6c
	add r1, sp, #0x60
	ldr r4, [r2]
	bl ov00_021ECB94
	add r0, sp, #0x6c
	add r1, sp, #0x60
	bl RTC_ConvertDateTimeToSecond
	mov r2, #0
	subs r0, r0, #0x15
	str r0, [sp, #0x10]
	sbc r0, r1, #0
	str r0, [sp, #0x14]
	ldr r0, _02232AE4 ; =ov45_02234814
	mov r1, #0x15
	str r1, [sp, #0x18]
	str r0, [sp, #0x24]
	str r2, [sp, #0x1c]
	str r2, [sp, #0x20]
	add r0, sp, #0x28
	mov r1, #3
	add r2, sp, #0x10
	bl ov45_02232AE8
	mov r0, #0
	add r2, sp, #0x2c
	add lr, sp, #0x48
	add r1, r4, #0x134
	strb r0, [sp, #5]
	strb r0, [sp, #4]
	ldr r0, [sp, #0x28]
	add ip, r2, #8
	str r0, [sp, #0x44]
	ldr r4, [r2, #0x10]
	ldr r0, [r2, #0x14]
	ldmia r2, {r2, r3}
	stmia lr, {r2, r3}
	add r5, lr, #8
	ldmia ip, {r2, r3}
	stmia r5, {r2, r3}
	str r0, [lr, #0x14]
	add r0, sp, #8
	add r2, sp, #0x44
	str r4, [lr, #0x10]
	bl ov45_02236BA8
	add r0, sp, #0x88
	bl ov45_02237BC8
	mov r0, #0
	add sp, sp, #0x94
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_02232AD8: .word _022577C4
_02232ADC: .word 0x10624DD3
_02232AE0: .word ov45_02254F88
_02232AE4: .word ov45_02234814
	arm_func_end ov45_0223285C

	arm_func_start ov45_02232AE8
ov45_02232AE8: ; 0x02232AE8
	stmdb sp!, {r3, lr}
	mov lr, r2
	str r1, [r0]
	add ip, r0, #4
	ldmia lr, {r2, r3}
	stmia ip, {r2, r3}
	add r1, lr, #8
	add r0, ip, #8
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldr r0, [lr, #0x10]
	str r0, [ip, #0x10]
	ldr r0, [lr, #0x14]
	str r0, [ip, #0x14]
	ldmia sp!, {r3, pc}
	arm_func_end ov45_02232AE8

	arm_func_start ov45_02232B24
ov45_02232B24: ; 0x02232B24
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r2, #0
	mov r5, r0
	add r0, sp, #0
	mov r4, r1
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	bl ov45_022377AC
	add r0, sp, #0
	bl ov45_02232B9C
	add r1, sp, #0x20
	bic r3, r1, #3
	ldr r2, [sp, #0x20]
	mov r1, r4
	add r3, r3, #4
	bl OS_VSNPrintf
	add r0, sp, #0
	bl ov45_02232B9C
	mov r1, r0
	mov r0, r5
	bl ov45_02237B58
	add r0, sp, #0
	bl ov45_022379D4
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02232B24

	arm_func_start ov45_02232B9C
ov45_02232B9C: ; 0x02232B9C
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	ldrne r0, [r0]
	bx lr
	arm_func_end ov45_02232B9C

	arm_func_start ov45_02232BB0
ov45_02232BB0: ; 0x02232BB0
	stmdb sp!, {r4, lr}
	ldr r1, _02232CA0 ; =_022577C4
	ldr r2, [r1]
	cmp r2, #0
	moveq r0, #4
	ldmeqia sp!, {r4, pc}
	beq _02232BDC
	ldr r1, [r2]
	cmp r1, #0xa
	moveq r0, #7
	ldmeqia sp!, {r4, pc}
_02232BDC:
	cmp r2, #0
	beq _02232BFC
	ldr r1, _02232CA0 ; =_022577C4
	ldr r1, [r1]
	ldr r1, [r1]
	cmp r1, #8
	movne r0, #4
	ldmneia sp!, {r4, pc}
_02232BFC:
	ldr r1, _02232CA0 ; =_022577C4
	ldr r4, [r1]
	ldr r1, [r4, #0x68]
	cmp r1, #0
	moveq r0, #0
	beq _02232C90
	ldr r1, [r0]
	add lr, r0, #0x10
	str r1, [r4, #0x74]
	ldr r1, [r0, #4]
	add ip, r4, #0x84
	str r1, [r4, #0x78]
	ldr r1, [r0, #8]
	mov r3, #0x10
	str r1, [r4, #0x7c]
	ldr r1, [r0, #0xc]
	str r1, [r4, #0x80]
_02232C40:
	ldrb r2, [lr]
	ldrb r1, [lr, #1]
	add lr, lr, #2
	subs r3, r3, #1
	strb r2, [ip]
	strb r1, [ip, #1]
	add ip, ip, #2
	bne _02232C40
	add ip, r0, #0x30
	add r3, r4, #0xa4
	mov r2, #0xa
_02232C6C:
	ldrb r1, [ip]
	ldrb r0, [ip, #1]
	add ip, ip, #2
	subs r2, r2, #1
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	bne _02232C6C
	mov r0, #1
_02232C90:
	cmp r0, #0
	moveq r0, #4
	movne r0, #0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02232CA0: .word _022577C4
	arm_func_end ov45_02232BB0

	arm_func_start ov45_02232CA4
ov45_02232CA4: ; 0x02232CA4
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _02232D88 ; =_022577C4
	ldr r1, [r0]
	cmp r1, #0
	addeq sp, sp, #0x10
	moveq r0, #4
	ldmeqia sp!, {r3, pc}
	beq _02232CDC
	ldr r0, [r1]
	cmp r0, #0xa
	addeq sp, sp, #0x10
	moveq r0, #7
	ldmeqia sp!, {r3, pc}
_02232CDC:
	cmp r1, #0
	beq _02232D00
	ldr r0, _02232D88 ; =_022577C4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #8
	addne sp, sp, #0x10
	movne r0, #4
	ldmneia sp!, {r3, pc}
_02232D00:
	ldr r0, _02232D88 ; =_022577C4
	ldr r1, [r0]
	ldr r0, [r1, #0x68]
	cmp r0, #0
	mov r0, #0
	strne r0, [r1, #0x68]
	movne r0, #1
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #4
	ldmeqia sp!, {r3, pc}
	ldr r0, _02232D88 ; =_022577C4
	mov r1, #0
	ldr r2, [r0]
	mov r0, #2
	str r0, [sp]
	add r0, r2, #0x74
	str r0, [sp, #4]
	mov r0, #0x44
	str r0, [sp, #8]
	ldr r0, [r2, #0x4c]
	mov r3, r1
	mov r2, #1
	bl ov45_0223325C
	ldr r0, _02232D88 ; =_022577C4
	mov r2, #3
	ldr r0, [r0]
	add r1, sp, #0xc
	add r0, r0, #0x134
	str r2, [sp, #0xc]
	bl ov45_02232D8C
	mov r0, #0
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02232D88: .word _022577C4
	arm_func_end ov45_02232CA4

	arm_func_start ov45_02232D8C
ov45_02232D8C: ; 0x02232D8C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r2, r1
	add r0, sp, #8
	mov r1, r4
	bl ov45_02232DDC
	ldr r2, [sp, #8]
	add r0, r4, #4
	cmp r2, r0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	add r0, sp, #4
	mov r1, r4
	str r2, [sp]
	bl ov45_02236C40
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_02232D8C

	arm_func_start ov45_02232DDC
ov45_02232DDC: ; 0x02232DDC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	ldr r2, [r5, #4]
	mov r0, r5
	mov r1, r4
	add r3, r5, #4
	bl ov45_02232E30
	add r1, r5, #4
	cmp r0, r1
	beq _02232E1C
	ldr r2, [r4]
	ldr r1, [r0, #0xc]
	cmp r2, r1
	bhs _02232E28
_02232E1C:
	add r0, r5, #4
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
_02232E28:
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_02232DDC

	arm_func_start ov45_02232E30
ov45_02232E30: ; 0x02232E30
	cmp r2, #0
	beq _02232E58
	ldr r1, [r1]
_02232E3C:
	ldr r0, [r2, #0xc]
	cmp r0, r1
	movhs r3, r2
	ldrhs r2, [r2]
	ldrlo r2, [r2, #4]
	cmp r2, #0
	bne _02232E3C
_02232E58:
	mov r0, r3
	bx lr
	arm_func_end ov45_02232E30

	arm_func_start ov45_02232E60
ov45_02232E60: ; 0x02232E60
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x334
	ldr r1, _022331D4 ; =_022577C4
	mov r5, r0
	ldr r2, [r1]
	cmp r2, #0
	addeq sp, sp, #0x334
	moveq r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	beq _02232E9C
	ldr r0, [r2]
	cmp r0, #0xa
	addeq sp, sp, #0x334
	moveq r0, #7
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
_02232E9C:
	cmp r5, #0
	blt _02232EAC
	cmp r5, #2
	ble _02232EB8
_02232EAC:
	add sp, sp, #0x334
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_02232EB8:
	add r1, sp, #0x5c
	add r0, r2, #0x144
	bl ov45_0223AEDC
	cmp r0, #0
	beq _02232EE0
	ldr r0, _022331D4 ; =_022577C4
	ldr r1, [r0]
	ldr r0, [r1, #0x6c]
	cmp r0, #0
	beq _02232EEC
_02232EE0:
	add sp, sp, #0x334
	mov r0, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_02232EEC:
	add r0, r1, #0x110
	bl ov45_02231C78
	mov r4, r0
	mov r0, #0
	add r3, sp, #0x30
	mov r1, r0
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r2, _022331D4 ; =_022577C4
	str r0, [r3]
	ldr r1, [r2]
	add r0, r1, #0x110
	bl ov45_02231C78
	ldr r1, _022331D4 ; =_022577C4
	mov r2, #1
	ldr r1, [r1]
	ldr r1, [r1, #0x4c]
	strh r2, [sp, #0x20]
	str r1, [sp, #0x1c]
	ldrb r1, [r0, #0x42]
	strb r1, [sp, #0x22]
	ldrb r1, [r0, #0x39]
	add r0, sp, #0x24
	strb r1, [sp, #0x23]
	bl OS_GetMacAddress
	ldrh r8, [sp, #0x20]
	ldrb r7, [sp, #0x22]
	ldrb r6, [sp, #0x23]
	ldrb r2, [sp, #0x25]
	ldrb r3, [sp, #0x24]
	ldrb r1, [sp, #0x26]
	ldrb r0, [sp, #0x27]
	ldrb ip, [sp, #0x28]
	strh r8, [sp, #0x34]
	ldrb r8, [sp, #0x29]
	strb r7, [sp, #0x36]
	ldrh r7, [sp, #0x2a]
	strb r6, [sp, #0x37]
	ldr lr, [sp, #0x1c]
	ldr r6, [sp, #0x2c]
	strb r2, [sp, #0x39]
	ldr r2, [sp, #0x60]
	strb r3, [sp, #0x38]
	ldr r3, [sp, #0x5c]
	strb r1, [sp, #0x3a]
	strb r0, [sp, #0x3b]
	str lr, [sp, #0x30]
	strb ip, [sp, #0x3c]
	strb r8, [sp, #0x3d]
	strh r7, [sp, #0x3e]
	str r6, [sp, #0x40]
	str r2, [sp, #0x48]
	ldr r1, _022331D4 ; =_022577C4
	str r5, [sp, #0x4c]
	str r3, [sp, #0x44]
	ldr r3, [r4, #4]
	ldr r0, _022331D8 ; =_02254F58
	str r3, [sp, #0x50]
	ldr r2, [r1]
	ldrb r1, [r4, #0x38]
	ldr r5, [r0, #4]
	str r1, [sp, #0x54]
	ldrh r1, [r4, #0x3c]
	strh r1, [sp, #0x58]
	ldrb r1, [r4, #0x3e]
	strh r1, [sp, #0x5a]
	ldr r4, [r0, #0xc]
	ldr r0, _022331DC ; =ov45_022577D4
	ldr r1, [r2, #0x50]
	ldr r0, [r0]
	cmp r1, #0
	moveq r8, #0
	movne r8, #1
	ldr r7, [r2, #0x4c]
	cmp r0, #0
	bne _022331B8
	mov r0, #0x40
	bl ov45_02242394
	movs r6, r0
	beq _022330CC
	ldr r1, _022331E0 ; =ov45_02254FC0
	mov r0, #3
	str r1, [r6]
	str r0, [r6, #4]
	mov r1, r4
	add r0, r6, #0xc
	str r8, [r6, #8]
	bl ov45_02237B58
	mov r1, r5
	add r0, r6, #0x18
	bl ov45_02237B58
	add r2, sp, #0x30
	add r4, r2, #0x2c
	mov r1, #0
	str r7, [r6, #0x24]
	str r1, [r6, #0x28]
	str r1, [r6, #0x2c]
	ldr r0, _022331E4 ; =ov45_022354AC
	str r1, [r6, #0x30]
	str r0, [r6, #0x34]
	str r1, [r6, #0x38]
	str r1, [r6, #0x3c]
	strb r1, [sp, #9]
	strb r1, [sp, #0xa]
	strb r1, [sp, #8]
	strb r1, [sp, #4]
	sub r1, sp, #4
	ldr r0, [sp, #0x18]
	str r4, [r1]
	str r0, [r1, #4]
	ldr r3, [r1]
	add r1, sp, #0xc
	str r2, [sp, #0xc]
	add r0, r6, #0x28
	str r4, [sp, #0x14]
	ldmia r1, {r1, r2}
	bl ov45_022327B8
_022330CC:
	ldr r0, _022331DC ; =ov45_022577D4
	str r6, [r0]
	ldr r0, [r6, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, r6, #0xd
	ldrne r1, [r6, #0x14]
	ldr r0, [r6, #8]
	bl ov45_0225443C
	ldr r0, [r6, #0x3c]
	ldr r4, [r6, #0x2c]
	cmp r0, #0
	ldr r0, [r6, #0x18]
	beq _0223313C
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r5, r6, #0x19
	ldrne r5, [r6, #0x20]
	add r0, r6, #0x28
	bl ov45_02231C78
	mov r1, #0
	str r1, [sp]
	mov r2, r0
	ldr r1, [r6, #0x24]
	mov r0, r5
	mov r3, r4
	bl ov45_02254A04
	b _02233170
_0223313C:
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r5, r6, #0x19
	ldrne r5, [r6, #0x20]
	add r0, r6, #0x28
	bl ov45_02231C78
	mov r1, #0
	str r1, [sp]
	mov r2, r0
	ldr r1, [r6, #0x24]
	mov r0, r5
	mov r3, r4
	bl ov45_022549E0
_02233170:
	cmp r0, #0
	moveq r0, #1
	beq _02233184
	bl ov45_022546F8
	mov r0, #0
_02233184:
	cmp r0, #0
	bne _022331B8
	ldr r0, _022331DC ; =ov45_022577D4
	ldr r0, [r0]
	cmp r0, #0
	beq _022331B8
	beq _022331AC
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
_022331AC:
	ldr r0, _022331DC ; =ov45_022577D4
	mov r1, #0
	str r1, [r0]
_022331B8:
	ldr r0, _022331D4 ; =_022577C4
	mov r2, #1
	ldr r1, [r0]
	mov r0, #0
	str r2, [r1, #0x6c]
	add sp, sp, #0x334
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_022331D4: .word _022577C4
_022331D8: .word _02254F58
_022331DC: .word ov45_022577D4
_022331E0: .word ov45_02254FC0
_022331E4: .word ov45_022354AC
	arm_func_end ov45_02232E60

	arm_func_start ov45_022331E8
ov45_022331E8: ; 0x022331E8
	ldr r0, _02233200 ; =_022577C4
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #4]
	moveq r0, #0
	bx lr
	.balign 4, 0
_02233200: .word _022577C4
	arm_func_end ov45_022331E8

	arm_func_start ov45_02233204
ov45_02233204: ; 0x02233204
	stmdb sp!, {r3, lr}
	cmp r0, #4
	addge r0, r0, #0x17c
	addge r0, r0, #0x2800
	ldmgeia sp!, {r3, pc}
	bl ov45_02240A74
	ldmia sp!, {r3, pc}
	arm_func_end ov45_02233204

	arm_func_start ov45_02233220
ov45_02233220: ; 0x02233220
	cmp r0, #0
	beq _0223323C
	cmp r0, #1
	beq _02233244
	cmp r0, #2
	beq _0223324C
	b _02233254
_0223323C:
	mov r0, #0
	bx lr
_02233244:
	mov r0, #2
	bx lr
_0223324C:
	mov r0, #3
	bx lr
_02233254:
	mov r0, #1
	bx lr
	arm_func_end ov45_02233220

	arm_func_start ov45_0223325C
ov45_0223325C: ; 0x0223325C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x24
	mov r5, r0
	mvn r0, #0
	mov r4, r1
	cmp r5, r0
	cmpeq r4, #5
	addeq sp, sp, #0x24
	moveq r0, #3
	ldmeqia sp!, {r4, r5, pc}
	mov ip, #0
	add r1, sp, #0x18
	mov r0, ip
_02233290:
	str r0, [r1, ip, lsl #2]
	add ip, ip, #1
	cmp ip, #3
	blo _02233290
	ldr lr, [sp, #0x38]
	mov r0, r2
	mov r1, r3
	ldr r2, [sp, #0x30]
	ldr r3, [sp, #0x34]
	add ip, sp, #0x18
	str lr, [sp]
	str ip, [sp, #4]
	bl ov45_0223D7D4
	cmp r0, #0
	bne _022332E0
	add r0, sp, #0x18
	bl ov45_02237BC8
	add sp, sp, #0x24
	mov r0, #3
	ldmia sp!, {r4, r5, pc}
_022332E0:
	cmp r4, #5
	bne _02233354
	ldr r0, [sp, #0x18]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #0x19
	ldrne r1, [sp, #0x20]
	mov r0, r5
	bl ov45_022414C0
	mov r4, r0
	ldr r1, _0223342C ; =_022577C4
	mov r0, #0
	strb r0, [sp, #9]
	cmp r4, #1
	ldr r1, [r1]
	beq _0223332C
	cmp r4, #2
	moveq r0, #3
	b _02233330
_0223332C:
	mov r0, #2
_02233330:
	cmp r0, #0
	strne r0, [r1, #4]
	movne r0, #0xa
	strne r0, [r1]
	add r0, sp, #0x18
	bl ov45_02237BC8
	add sp, sp, #0x24
	mov r0, r4
	ldmia sp!, {r4, r5, pc}
_02233354:
	ldr r1, _0223342C ; =_022577C4
	add r0, sp, #0xc
	ldr r1, [r1]
	mov r2, r4
	add r1, r1, #0xb8
	bl ov45_02232434
	ldr r1, _02233430 ; =ov45_022550B4
	add r0, sp, #0xc
	bl ov45_02237FD8
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	beq _022333A8
	add r0, sp, #0xc
	bl ov45_02237BC8
	add r0, sp, #0x18
	bl ov45_02237BC8
	add sp, sp, #0x24
	mov r0, #5
	ldmia sp!, {r4, r5, pc}
_022333A8:
	ldr r0, [sp, #0x18]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldr r0, [sp, #0xc]
	addeq r1, sp, #0x19
	mov r0, r0, lsl #0x1f
	ldrne r1, [sp, #0x20]
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #0xd
	ldrne r0, [sp, #0x14]
	bl ov45_022413D4
	mov r4, r0
	ldr r1, _0223342C ; =_022577C4
	mov r0, #0
	strb r0, [sp, #8]
	cmp r4, #1
	ldr r1, [r1]
	beq _022333FC
	cmp r4, #2
	moveq r0, #3
	b _02233400
_022333FC:
	mov r0, #2
_02233400:
	cmp r0, #0
	strne r0, [r1, #4]
	movne r0, #0xa
	strne r0, [r1]
	add r0, sp, #0xc
	bl ov45_02237BC8
	add r0, sp, #0x18
	bl ov45_02237BC8
	mov r0, r4
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0223342C: .word _022577C4
_02233430: .word ov45_022550B4
	arm_func_end ov45_0223325C

	arm_func_start ov45_02233434
ov45_02233434: ; 0x02233434
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x1c
	ldr r4, _02233594 ; =_022577C4
	mov r6, r0
	ldr r4, [r4]
	mov r5, r2
	mov r2, r1
	add r1, r4, #0xb8
	add r0, sp, #0x10
	mov r4, r3
	bl ov45_02232434
	ldr r1, _02233598 ; =ov45_022550B4
	add r0, sp, #0x10
	bl ov45_02237FD8
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	beq _02233494
	add r0, sp, #0x10
	bl ov45_02237BC8
	add sp, sp, #0x1c
	mov r0, #5
	ldmia sp!, {r3, r4, r5, r6, pc}
_02233494:
	ldr r1, [sp, #0x30]
	cmp r1, #0x12c
	bls _022334B4
	add r0, sp, #0x10
	bl ov45_02237BC8
	add sp, sp, #0x1c
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, pc}
_022334B4:
	ldr r0, _0223359C ; =0xAAAAAAAB
	add r1, r1, #2
	umull r0, r2, r1, r0
	mov r3, #0
	mov r2, r2, lsr #1
	mov r1, r2, lsl #2
	add r0, sp, #4
	add r1, r1, #1
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	bl ov45_022377AC
	add r0, sp, #4
	bl ov45_02232B9C
	mov r2, r0
	ldr r1, [sp, #0x30]
	ldr r3, [sp, #8]
	mov r0, r4
	bl ov00_021EFF30
	ldr r1, [sp, #4]
	mov r2, #0
	strb r2, [r1, r0]
	ldr r0, [sp, #0x10]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r4, sp, #0x11
	ldrne r4, [sp, #0x18]
	add r0, sp, #4
	bl ov45_02232B9C
	mov r3, r0
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl ov45_022415CC
	mov r4, r0
	ldr r1, _02233594 ; =_022577C4
	mov r0, #0
	strb r0, [sp]
	cmp r4, #1
	ldr r1, [r1]
	beq _02233564
	cmp r4, #2
	moveq r0, #3
	b _02233568
_02233564:
	mov r0, #2
_02233568:
	cmp r0, #0
	strne r0, [r1, #4]
	movne r0, #0xa
	strne r0, [r1]
	add r0, sp, #4
	bl ov45_022379D4
	add r0, sp, #0x10
	bl ov45_02237BC8
	mov r0, r4
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_02233594: .word _022577C4
_02233598: .word ov45_022550B4
_0223359C: .word 0xAAAAAAAB
	arm_func_end ov45_02233434

	arm_func_start ov45_022335A0
ov45_022335A0: ; 0x022335A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc4
	ldr r0, _02233980 ; =_022577C4
	ldr r0, [r0]
	add r0, r0, #0x110
	bl ov45_02231C78
	ldr r1, _02233980 ; =_022577C4
	mov r4, r0
	ldr r0, [r1]
	add r0, r0, #0x110
	bl ov45_02231C78
	ldr r1, _02233980 ; =_022577C4
	mov r2, #1
	ldr r1, [r1]
	ldr r1, [r1, #0x4c]
	strh r2, [sp, #0x20]
	str r1, [sp, #0x1c]
	ldrb r1, [r0, #0x42]
	strb r1, [sp, #0x22]
	ldrb r1, [r0, #0x39]
	add r0, sp, #0x24
	strb r1, [sp, #0x23]
	bl OS_GetMacAddress
	ldr r0, [r4]
	add r3, sp, #0x38
	str r0, [sp, #0x30]
	ldr r0, [r4, #4]
	add r5, r4, #8
	str r0, [sp, #0x34]
	mov r2, #4
_02233618:
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	add r5, r5, #4
	subs r2, r2, #1
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	bne _02233618
	ldr r1, [r4, #0x18]
	add r0, sp, #0x74
	str r1, [sp, #0x48]
	ldr r2, [r4, #0x1c]
	add r1, r4, #0x44
	str r2, [sp, #0x4c]
	ldrh r3, [r4, #0x20]
	ldrh r2, [r4, #0x22]
	add r6, sp, #0x7c
	add r7, r4, #0x4c
	strh r3, [sp, #0x50]
	strh r2, [sp, #0x52]
	ldrh r3, [r4, #0x24]
	ldrh r2, [r4, #0x26]
	mov r5, #6
	strh r3, [sp, #0x54]
	strh r2, [sp, #0x56]
	ldrh r3, [r4, #0x28]
	ldrh r2, [r4, #0x2a]
	strh r3, [sp, #0x58]
	strh r2, [sp, #0x5a]
	ldrb r3, [r4, #0x2c]
	ldrb r2, [r4, #0x2d]
	strb r3, [sp, #0x5c]
	strb r2, [sp, #0x5d]
	ldrb r3, [r4, #0x2e]
	ldrb r2, [r4, #0x2f]
	strb r3, [sp, #0x5e]
	strb r2, [sp, #0x5f]
	ldrb r3, [r4, #0x30]
	ldrb r2, [r4, #0x31]
	strb r3, [sp, #0x60]
	strb r2, [sp, #0x61]
	ldrb r3, [r4, #0x32]
	ldrb r2, [r4, #0x33]
	strb r3, [sp, #0x62]
	strb r2, [sp, #0x63]
	ldrb r3, [r4, #0x34]
	ldrb r2, [r4, #0x35]
	strb r3, [sp, #0x64]
	strb r2, [sp, #0x65]
	ldrb r3, [r4, #0x36]
	ldrb r2, [r4, #0x37]
	strb r3, [sp, #0x66]
	strb r2, [sp, #0x67]
	ldrb r2, [r4, #0x38]
	strb r2, [sp, #0x68]
	ldrb r2, [r4, #0x39]
	strb r2, [sp, #0x69]
	ldrh r2, [r4, #0x3a]
	strh r2, [sp, #0x6a]
	ldrh r2, [r4, #0x3c]
	strh r2, [sp, #0x6c]
	ldrb r2, [r4, #0x3e]
	strb r2, [sp, #0x6e]
	ldrb r2, [r4, #0x3f]
	strb r2, [sp, #0x6f]
	ldrb r2, [r4, #0x40]
	strb r2, [sp, #0x70]
	ldrb r2, [r4, #0x41]
	strb r2, [sp, #0x71]
	ldrb r2, [r4, #0x42]
	strb r2, [sp, #0x72]
	ldrb r2, [r4, #0x43]
	strb r2, [sp, #0x73]
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
_02233744:
	ldrb r1, [r7]
	ldrb r0, [r7, #1]
	add r7, r7, #2
	subs r5, r5, #1
	strb r1, [r6]
	strb r0, [r6, #1]
	add r6, r6, #2
	bne _02233744
	add r6, r4, #0x58
	add r5, sp, #0x88
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia r6, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r1, _02233980 ; =_022577C4
	ldr r0, _02233984 ; =_02254F58
	ldrh r6, [r4, #0x88]
	ldrh r3, [r4, #0x8a]
	ldr r2, [r1]
	ldr r5, [r0, #0x18]
	strh r6, [sp, #0xb8]
	strh r3, [sp, #0xba]
	ldr r3, [r4, #0x8c]
	ldr r1, [r4, #0x90]
	str r3, [sp, #0xbc]
	str r1, [sp, #0xc0]
	ldr r4, [r0, #0xc]
	ldr r0, _02233988 ; =ov45_022577D4
	ldr r1, [r2, #0x50]
	ldr r0, [r0]
	cmp r1, #0
	moveq r8, #0
	movne r8, #1
	cmp r0, #0
	ldr r7, [r2, #0x4c]
	addne sp, sp, #0xc4
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r0, #0x40
	bl ov45_02242394
	movs r6, r0
	beq _02233884
	ldr r1, _0223398C ; =ov45_02254FC0
	mov r0, #3
	str r1, [r6]
	str r0, [r6, #4]
	mov r1, r4
	add r0, r6, #0xc
	str r8, [r6, #8]
	bl ov45_02237B58
	mov r1, r5
	add r0, r6, #0x18
	bl ov45_02237B58
	add r2, sp, #0x1c
	add r4, r2, #0xa8
	mov r1, #0
	str r7, [r6, #0x24]
	str r1, [r6, #0x28]
	str r1, [r6, #0x2c]
	ldr r0, _02233990 ; =ov45_02234A88
	str r1, [r6, #0x30]
	str r0, [r6, #0x34]
	str r1, [r6, #0x38]
	str r1, [r6, #0x3c]
	strb r1, [sp, #9]
	strb r1, [sp, #0xa]
	strb r1, [sp, #8]
	strb r1, [sp, #4]
	sub r1, sp, #4
	ldr r0, [sp, #0x18]
	str r4, [r1]
	str r0, [r1, #4]
	ldr r3, [r1]
	add r1, sp, #0xc
	str r2, [sp, #0xc]
	add r0, r6, #0x28
	str r4, [sp, #0x14]
	ldmia r1, {r1, r2}
	bl ov45_022327B8
_02233884:
	ldr r0, _02233988 ; =ov45_022577D4
	str r6, [r0]
	ldr r0, [r6, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, r6, #0xd
	ldrne r1, [r6, #0x14]
	ldr r0, [r6, #8]
	bl ov45_0225443C
	ldr r0, [r6, #0x3c]
	ldr r4, [r6, #0x2c]
	cmp r0, #0
	ldr r0, [r6, #0x18]
	beq _022338F4
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r5, r6, #0x19
	ldrne r5, [r6, #0x20]
	add r0, r6, #0x28
	bl ov45_02231C78
	mov r1, #0
	str r1, [sp]
	mov r2, r0
	ldr r1, [r6, #0x24]
	mov r0, r5
	mov r3, r4
	bl ov45_02254A04
	b _02233928
_022338F4:
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r5, r6, #0x19
	ldrne r5, [r6, #0x20]
	add r0, r6, #0x28
	bl ov45_02231C78
	mov r1, #0
	str r1, [sp]
	mov r2, r0
	ldr r1, [r6, #0x24]
	mov r0, r5
	mov r3, r4
	bl ov45_022549E0
_02233928:
	cmp r0, #0
	moveq r0, #1
	beq _0223393C
	bl ov45_022546F8
	mov r0, #0
_0223393C:
	cmp r0, #0
	addne sp, sp, #0xc4
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r0, _02233988 ; =ov45_022577D4
	ldr r0, [r0]
	cmp r0, #0
	addeq sp, sp, #0xc4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	beq _0223396C
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
_0223396C:
	ldr r0, _02233988 ; =ov45_022577D4
	mov r1, #0
	str r1, [r0]
	add sp, sp, #0xc4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02233980: .word _022577C4
_02233984: .word _02254F58
_02233988: .word ov45_022577D4
_0223398C: .word ov45_02254FC0
_02233990: .word ov45_02234A88
	arm_func_end ov45_022335A0

	arm_func_start ov45_02233994
ov45_02233994: ; 0x02233994
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	ldr r3, _022339EC ; =_02254D04
	mov r5, r0
	ldr r1, [r3, r1, lsl #2]
	add r0, sp, #0xc
	mov r4, r2
	bl ov45_02237B58
	ldr r2, _022339F0 ; =ov45_022550B8
	add r0, sp, #0
	add r1, sp, #0xc
	bl ov45_02233ABC
	add r1, sp, #0
	mov r0, r5
	mov r2, r4
	bl ov45_022339F4
	add r0, sp, #0
	bl ov45_02237BC8
	add r0, sp, #0xc
	bl ov45_02237BC8
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022339EC: .word _02254D04
_022339F0: .word ov45_022550B8
	arm_func_end ov45_02233994

	arm_func_start ov45_022339F4
ov45_022339F4: ; 0x022339F4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r3, #0
	mov r7, r0
	mov r0, r3
_02233A08:
	str r0, [r7, r3, lsl #2]
	add r3, r3, #1
	cmp r3, #3
	blo _02233A08
	ldr r0, [r1]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldmneib r1, {r4, r5}
	bne _02233A3C
	ldrb r0, [r1]
	add r5, r1, #1
	mov r0, r0, lsl #0x18
	mov r4, r0, lsr #0x19
_02233A3C:
	ldr r0, [r2]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldrne r6, [r2, #8]
	ldrne r8, [r2, #4]
	bne _02233A64
	ldrb r0, [r2]
	add r6, r2, #1
	mov r0, r0, lsl #0x18
	mov r8, r0, lsr #0x19
_02233A64:
	mov r0, r7
	add r1, r4, r8
	bl ov45_02237BFC
	add r0, r5, r4
	mov r1, #0
	ldrb ip, [sp, #9]
	str r0, [sp]
	mov r0, r7
	mov r2, r1
	mov r3, r5
	strb ip, [sp, #4]
	bl ov45_02238104
	add r1, r6, r8
	ldrb r5, [sp, #8]
	str r1, [sp]
	mov r1, r4
	mov r3, r6
	mov r2, #0
	strb r5, [sp, #4]
	bl ov45_02238104
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov45_022339F4

	arm_func_start ov45_02233ABC
ov45_02233ABC: ; 0x02233ABC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r4, r1
	mov r1, #0
	mov r8, r0
	mov r7, r2
	mov r0, r1
_02233AD8:
	str r0, [r8, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #3
	blo _02233AD8
	mov r0, r7
	bl strlen
	ldr r1, [r4]
	mov r6, r0
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldrne r5, [r4, #8]
	ldrne r4, [r4, #4]
	bne _02233B1C
	ldrb r0, [r4]
	add r5, r4, #1
	mov r0, r0, lsl #0x18
	mov r4, r0, lsr #0x19
_02233B1C:
	mov r0, r8
	add r1, r4, r6
	bl ov45_02237BFC
	add r0, r5, r4
	mov r1, #0
	ldrb ip, [sp, #9]
	str r0, [sp]
	mov r0, r8
	mov r2, r1
	mov r3, r5
	strb ip, [sp, #4]
	bl ov45_02238104
	add r1, r7, r6
	ldrb r5, [sp, #8]
	str r1, [sp]
	mov r1, r4
	mov r3, r7
	mov r2, #0
	strb r5, [sp, #4]
	bl ov45_02238104
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov45_02233ABC

	arm_func_start ov45_02233B74
ov45_02233B74: ; 0x02233B74
	stmdb sp!, {r3, r4, r5, lr}
	ldr r1, _02233BBC ; =_022577C4
	mov r5, r0
	ldr r0, [r1]
	ldr r4, [r0, #0x4c]
	bl ov00_021FF368
	mov ip, r0
	ldr r0, _02233BC0 ; =0x10624DD3
	mov r1, #0x3e8
	umull r0, r3, ip, r0
	mov r3, r3, lsr #6
	umull r3, r0, r1, r3
	ldr r1, _02233BC4 ; =ov45_022550BC
	mov r0, r5
	mov r2, r4
	sub r3, ip, r3
	bl ov45_02233BC8
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02233BBC: .word _022577C4
_02233BC0: .word 0x10624DD3
_02233BC4: .word ov45_022550BC
	arm_func_end ov45_02233B74

	arm_func_start ov45_02233BC8
ov45_02233BC8: ; 0x02233BC8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	add r1, sp, #0x24
	mov r6, r0
	mov r0, #0
	bic r4, r1, #3
	ldr r2, [sp, #0x24]
	mov r1, r0
	str r0, [sp, #8]
	add r3, r4, #4
	str r0, [sp, #4]
	str r0, [sp, #0xc]
	bl OS_VSNPrintf
	ldr r3, [sp, #8]
	add r5, r0, #1
	cmp r5, r3
	bls _02233C34
	mov r1, #0
	strb r1, [sp]
	sub r0, sp, #4
	strb r1, [r0]
	ldr r2, [r0]
	add r0, sp, #4
	sub r1, r5, r3
	bl ov45_0223795C
	b _02233C4C
_02233C34:
	bhs _02233C4C
	sub r0, r3, r5
	sub r0, r3, r0
	mov r1, #0
	strb r1, [sp, #1]
	str r0, [sp, #8]
_02233C4C:
	add r0, sp, #4
	bl ov45_02232B9C
	ldr r2, [sp, #0x24]
	mov r1, r5
	add r3, r4, #4
	bl OS_VSNPrintf
	ldr r1, [sp, #4]
	add r0, sp, #4
	add r1, r1, r5
	mov r2, #0
	strb r2, [r1, #-1]
	bl ov45_02232B9C
	mov r1, r0
	mov r0, r6
	bl ov45_02237B58
	add r0, sp, #4
	bl ov45_022379D4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02233BC8

	arm_func_start ov45_02233CA0
ov45_02233CA0: ; 0x02233CA0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x54
	ldr r0, _02233DF4 ; =_022577C4
	ldr r5, _02233DF8 ; =ov45_02235C40
	ldr lr, _02233DFC ; =ov45_02235E4C
	ldr ip, _02233E00 ; =ov45_02236090
	ldr r4, _02233E04 ; =ov45_022362D0
	ldr r3, _02233E08 ; =ov45_02236A44
	ldr r1, [r0]
	mov r2, #0
	add r0, sp, #0x24
	str r5, [sp, #0x3c]
	str lr, [sp, #0x40]
	str ip, [sp, #0x44]
	str r4, [sp, #0x48]
	str r3, [sp, #0x4c]
	str r2, [sp, #0x50]
	bl ov45_02231EB0
	add r0, sp, #0x30
	add r2, sp, #0x24
	mov r1, #0
	bl ov45_02233994
	add r0, sp, #0x24
	bl ov45_02237BC8
	ldr r0, [sp, #0x30]
	ldr r1, _02233E0C ; =ov45_022354F4
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #0x31
	ldrne r0, [sp, #0x38]
	add r3, sp, #0x3c
	str r1, [sp]
	mov r1, #0
	mov r2, #0x14
	str r1, [sp, #4]
	bl ov45_02241048
	mov r4, r0
	ldr r1, _02233DF4 ; =_022577C4
	mov r0, #0
	strb r0, [sp, #8]
	cmp r4, #1
	ldr r1, [r1]
	beq _02233D58
	cmp r4, #2
	moveq r0, #3
	b _02233D5C
_02233D58:
	mov r0, #2
_02233D5C:
	cmp r0, #0
	strne r0, [r1, #4]
	movne r0, #0xa
	strne r0, [r1]
	cmp r4, #0
	beq _02233D88
	add r0, sp, #0x30
	bl ov45_02237BC8
	add sp, sp, #0x54
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, pc}
_02233D88:
	mov r2, #0
	add r0, sp, #0x10
	add r1, sp, #0x30
	str r2, [sp, #0xc]
	add r5, sp, #0xc
	bl ov45_02237A24
	mov r1, #0
	ldr r0, _02233DF4 ; =_022577C4
	ldr r2, [sp, #0xc]
	ldr r6, [r0]
	str r1, [r5, #0x10]
	str r1, [r5, #0x14]
	add r1, sp, #0x10
	str r2, [r6, #0xb8]
	add r0, r6, #0xbc
	bl ov45_02237D48
	ldr r1, [sp, #0x1c]
	add r0, sp, #0x10
	str r1, [r6, #0xc8]
	ldr r1, [sp, #0x20]
	str r1, [r6, #0xcc]
	bl ov45_02237BC8
	add r0, sp, #0x30
	bl ov45_02237BC8
	mov r0, r4
	add sp, sp, #0x54
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_02233DF4: .word _022577C4
_02233DF8: .word ov45_02235C40
_02233DFC: .word ov45_02235E4C
_02233E00: .word ov45_02236090
_02233E04: .word ov45_022362D0
_02233E08: .word ov45_02236A44
_02233E0C: .word ov45_022354F4
	arm_func_end ov45_02233CA0

	arm_func_start ov45_02233E10
ov45_02233E10: ; 0x02233E10
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x40
	mov r8, r0
	mov r7, r1
	add r0, sp, #0x28
	mov r1, r2
	mov r6, r3
	bl ov45_02237B58
	ldr r1, _02233FE0 ; =_022577C4
	add r0, sp, #0x10
	ldr r5, [r1]
	add sb, sp, #0x28
	add r1, r5, #0xb8
	bl ov45_022320B4
	add r0, sp, #0x10
	mov r1, sb
	bl ov45_022340F8
	mov r4, r0
	add r0, sp, #0x10
	bl ov45_02237BC8
	cmp r4, #0
	ldrne r5, [r5, #0xb8]
	bne _02233E9C
	add r0, sp, #0x1c
	add r1, r5, #0xd0
	bl ov45_022320B4
	add r0, sp, #0x1c
	mov r1, sb
	bl ov45_022340F8
	mov r4, r0
	add r0, sp, #0x1c
	bl ov45_02237BC8
	cmp r4, #0
	ldrne r5, [r5, #0xd0]
	moveq r5, #5
_02233E9C:
	add r0, sp, #0x28
	bl ov45_02237BC8
	cmp r5, #5
	addeq sp, sp, #0x40
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [sp, #0x64]
	mov r2, #0
	add r1, sp, #0x34
	str r2, [sp, #0x34]
	str r2, [sp, #0x38]
	str r2, [sp, #0x3c]
	bl ov45_02233FE4
	cmp r0, #0
	add r0, sp, #0x34
	bne _02233EE4
	bl ov45_022379D4
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02233EE4:
	ldr sb, [sp, #0x38]
	cmp sb, #0
	bne _02233EFC
	bl ov45_022379D4
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02233EFC:
	bl ov45_02231C78
	ldr r1, [sp, #0x60]
	ldr r4, [sp, #0x68]
	str r1, [sp]
	stmib sp, {r0, sb}
	mov r0, r8
	mov r1, r7
	mov r2, r5
	mov r3, r6
	str r4, [sp, #0xc]
	bl ov45_0223415C
	cmp r0, #0
	beq _02233F40
	add r0, sp, #0x34
	bl ov45_022379D4
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02233F40:
	mvn r0, #0
	cmp r6, r0
	beq _02233F8C
	ldr r0, _02233FE0 ; =_022577C4
	mov r1, r6
	ldr r0, [r0]
	add r0, r0, #0xe8
	bl ov45_0223DEC4
	cmp r0, #0
	ldrne r0, [r0, #0x38]
	cmpne r0, #0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _02233F8C
	add r0, sp, #0x34
	bl ov45_022379D4
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02233F8C:
	ldr r1, _02233FE0 ; =_022577C4
	add r0, sp, #0x34
	ldr r4, [r1]
	bl ov45_02231C78
	ldr r2, [sp, #0x60]
	ldr r1, [sp, #0x68]
	str r2, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x38]
	mov r0, r8
	str r2, [sp, #8]
	str r1, [sp, #0xc]
	ldr r4, [r4, #0x1c]
	mov r1, r7
	mov r2, r5
	mov r3, r6
	blx r4
	add r0, sp, #0x34
	bl ov45_022379D4
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_02233FE0: .word _022577C4
	arm_func_end ov45_02233E10

	arm_func_start ov45_02233FE4
ov45_02233FE4: ; 0x02233FE4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r2, #0
	mov r5, r1
	strb r2, [sp, #4]
	mov r6, r0
	bl strlen
	ldr r3, [r5, #4]
	mov r4, r0
	cmp r4, r3
	bls _02234034
	mov r1, #0
	strb r1, [sp, #2]
	sub r0, sp, #4
	strb r1, [r0]
	ldr r2, [r0]
	mov r0, r5
	sub r1, r4, r3
	bl ov45_0223795C
	b _02234050
_02234034:
	bhs _02234050
	mov r0, #0
	strb r0, [sp, #3]
	ldr r1, [r5, #4]
	sub r0, r3, r4
	sub r0, r1, r0
	str r0, [r5, #4]
_02234050:
	cmp r4, #0
	addeq sp, sp, #8
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r6
	bl strlen
	mov r4, r0
	mov r0, r5
	bl ov45_02231C78
	mov r2, r0
	ldr r3, [r5, #4]
	mov r0, r6
	mov r1, r4
	bl ov00_021EFF3C
	mov r4, r0
	mvn r0, #0
	cmp r4, r0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r3, [r5, #4]
	cmp r4, r3
	bls _022340D0
	mov r1, #0
	strb r1, [sp]
	sub r0, sp, #4
	strb r1, [r0]
	ldr r2, [r0]
	mov r0, r5
	sub r1, r4, r3
	bl ov45_0223795C
	b _022340EC
_022340D0:
	bhs _022340EC
	mov r0, #0
	strb r0, [sp, #1]
	ldr r1, [r5, #4]
	sub r0, r3, r4
	sub r0, r1, r0
	str r0, [r5, #4]
_022340EC:
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_02233FE4

	arm_func_start ov45_022340F8
ov45_022340F8: ; 0x022340F8
	stmdb sp!, {r4, lr}
	ldr r2, [r1]
	mov r4, #0
	mov r2, r2, lsl #0x1f
	movs r2, r2, lsr #0x1f
	ldrne r3, [r1, #4]
	bne _02234120
	ldrb r2, [r1]
	mov r2, r2, lsl #0x18
	mov r3, r2, lsr #0x19
_02234120:
	ldr r2, [r0]
	mov r2, r2, lsl #0x1f
	movs r2, r2, lsr #0x1f
	ldrne r2, [r0, #4]
	bne _02234140
	ldrb r2, [r0]
	mov r2, r2, lsl #0x18
	mov r2, r2, lsr #0x19
_02234140:
	cmp r2, r3
	bne _02234154
	bl ov45_02237F7C
	cmp r0, #0
	moveq r4, #1
_02234154:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_022340F8

	arm_func_start ov45_0223415C
ov45_0223415C: ; 0x0223415C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x70
	ldr r4, [sp, #0x98]
	cmp r2, #0
	ldr sb, [sp, #0x9c]
	ldr r8, [sp, #0xa0]
	mov sl, r3
	addne sp, sp, #0x70
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, _02234538 ; =ov45_022550C4
	mov r0, r4
	bl strcmp
	cmp r0, #0
	bne _02234334
	ldr r0, _0223453C ; =_022577C4
	ldr r2, [r0]
	ldr r0, [r2, #0x4c]
	cmp sl, r0
	addeq sp, sp, #0x70
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r1, sl
	add r0, r2, #0xe8
	bl ov45_0223DEC4
	movs r4, r0
	addeq sp, sp, #0x70
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, #0
	str r0, [sp, #0x48]
	add r2, sb, r8
	str r0, [sp, #0x4c]
	str r0, [sp, #0x50]
	strb r0, [sp, #9]
	strb r0, [sp, #0xa]
	strb r0, [sp, #8]
	strb r0, [sp, #4]
	sub r1, sp, #4
	ldr r0, [sp, #0x24]
	str r2, [r1]
	str r0, [r1, #4]
	ldr r3, [r1]
	add r0, sp, #0x48
	add r1, sp, #0x18
	str sb, [sp, #0x18]
	str r2, [sp, #0x20]
	ldmia r1, {r1, r2}
	bl ov45_022327B8
	mov r2, #0
	ldrb r0, [sp, #0xc]
	ldr r1, [sp, #0x48]
	ldr r6, [sp, #0x4c]
	str r2, [sp, #0x54]
	str r2, [sp, #0x58]
	str r2, [sp, #0x5c]
	sub r2, sp, #4
	strb r0, [r2]
	add r5, sp, #0x54
	ldr r3, [r2]
	mov r0, r5
	add r2, r1, r6
	bl ov45_022383E0
	mov r0, #1
	str r0, [r5, #0xc]
	ldr r7, [r4, #0x1c]
	ldr r0, [sp, #0x58]
	mov r6, #0
	cmp r7, r0
	bne _022342AC
	cmp r7, #0
	beq _022342A8
	add r0, r4, #0x18
	bl ov45_02231C78
	mov fp, r0
	mov r0, r5
	bl ov45_02231C78
	mov r2, r7
	mov r1, r0
	mov r0, fp
	bl memcmp
	cmp r0, #0
	bne _022342AC
_022342A8:
	mov r6, #1
_022342AC:
	cmp r6, #0
	bne _022342E8
	add r0, r4, #0x18
	cmp r0, r5
	beq _022342E0
	mov r3, #0
	ldmia r5, {r1, r5}
	strb r3, [sp, #0xb]
	sub r2, sp, #4
	strb r3, [r2]
	ldr r3, [r2]
	add r2, r1, r5
	bl ov45_02232760
_022342E0:
	mov r0, #1
	str r0, [r4, #0x24]
_022342E8:
	add r0, sp, #0x54
	bl ov45_022379D4
	mov r1, #1
	add r0, sp, #0x48
	str r1, [r4, #0x34]
	bl ov45_022379D4
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _02234328
	ldr r1, _0223453C ; =_022577C4
	mov r0, sl
	ldr r2, [r1]
	mov r1, sb
	ldr r3, [r2, #0x24]
	mov r2, r8
	blx r3
_02234328:
	add sp, sp, #0x70
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02234334:
	ldr r1, _02234540 ; =ov45_022550D4
	mov r0, r4
	bl strcmp
	cmp r0, #0
	bne _02234478
	ldr r0, _0223453C ; =_022577C4
	ldr r2, [r0]
	ldr r0, [r2, #0x4c]
	cmp sl, r0
	addeq sp, sp, #0x70
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r8, #0x10
	addne sp, sp, #0x70
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r1, sl
	add r0, r2, #0xe8
	bl ov45_0223DEC4
	movs r4, r0
	addeq sp, sp, #0x70
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sb]
	add r0, sp, #0x38
	str r1, [sp, #0x34]
	add r1, sb, #4
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	add r5, sp, #0x34
	ldr r6, [sb, #0xc]
	mov r3, #1
	mov r1, r5
	add r0, r4, #4
	mov r2, #0x10
	str r6, [sp, #0x40]
	str r3, [sp, #0x44]
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	bne _02234408
	ldr r0, [r5]
	add r1, r5, #4
	str r0, [r4, #4]
	add r0, r4, #8
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldr r1, [r5, #0xc]
	mov r0, #1
	str r1, [r4, #0x10]
	str r0, [r4, #0x14]
_02234408:
	mov r0, #1
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x38]
	cmp r0, #0
	ldrne r0, [r4, #0x14]
	cmpne r0, #0
	beq _0223446C
	mov r0, #0
	str r0, [r4, #0x14]
	ldr r5, [r4, #4]
	ldr r2, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r3, _0223453C ; =_022577C4
	add r0, sp, #0x28
	add r4, sp, #0x64
	str r5, [sp, #0x30]
	str r2, [sp, #0x28]
	str r1, [sp, #0x2c]
	ldmia r0, {r0, r1, r2}
	stmia r4, {r0, r1, r2}
	ldr r1, [r3]
	mov r0, sl
	ldr r2, [r1, #0x20]
	mov r1, r4
	blx r2
_0223446C:
	add sp, sp, #0x70
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02234478:
	ldr r1, _02234544 ; =ov45_022550E4
	mov r0, r4
	bl strcmp
	cmp r0, #0
	bne _022344D4
	cmp r8, #8
	addne sp, sp, #0x70
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0223453C ; =_022577C4
	ldr r4, [sb]
	ldr r3, [sb, #4]
	ldr r1, [r0]
	mov r0, #1
	str r0, [r1, #0x148]
	add r2, sp, #0x10
	str r4, [sp, #0x10]
	str r3, [sp, #0x14]
	add r1, r1, #0x14c
	ldmia r2, {r2, r3}
	add sp, sp, #0x70
	stmia r1, {r2, r3}
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022344D4:
	ldr r1, _02234548 ; =ov45_022550F4
	mov r0, r4
	bl strcmp
	cmp r0, #0
	bne _0223452C
	ldr r0, _0223453C ; =_022577C4
	mov r1, sb
	ldr r0, [r0]
	mov r2, r8
	add r0, r0, #0x144
	bl ov45_02238C74
	cmp r0, #0
	addeq sp, sp, #0x70
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0223453C ; =_022577C4
	mov r2, #4
	ldr r1, [r0]
	add sp, sp, #0x70
	str r2, [r1, #0x144]
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223452C:
	mov r0, #0
	add sp, sp, #0x70
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02234538: .word ov45_022550C4
_0223453C: .word _022577C4
_02234540: .word ov45_022550D4
_02234544: .word ov45_022550E4
_02234548: .word ov45_022550F4
	arm_func_end ov45_0223415C

	arm_func_start ov45_0223454C
ov45_0223454C: ; 0x0223454C
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	cmp r2, #0
	mov r5, r1
	mov r4, r3
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r0, [r6, #0x10]
	cmp r0, #0
	beq _02234658
	cmp r0, #1
	beq _02234588
	cmp r0, #2
	beq _022345F0
	b _0223467C
_02234588:
	ldr r0, _02234684 ; =_022577C4
	ldr r2, [r0]
	ldr r0, [r2, #0x4c]
	cmp r5, r0
	beq _0223467C
	add r0, r2, #0xe8
	bl ov45_0223DEC4
	cmp r0, #0
	ldrne r0, [r0, #0x38]
	cmpne r0, #0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0223467C
	ldr r0, [r6, #8]
	cmp r0, #1
	ldreq r0, [sp, #0x10]
	cmpeq r0, #0x44
	bne _0223467C
	ldr r1, _02234684 ; =_022577C4
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	ldr r2, [r2, #0x28]
	blx r2
	b _0223467C
_022345F0:
	ldr r0, _02234684 ; =_022577C4
	ldr r2, [r0]
	ldr r0, [r2, #0x4c]
	cmp r5, r0
	beq _0223467C
	add r0, r2, #0xe8
	bl ov45_0223DEC4
	cmp r0, #0
	ldrne r0, [r0, #0x38]
	cmpne r0, #0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0223467C
	ldr r0, [r6, #8]
	cmp r0, #1
	ldreq r0, [sp, #0x10]
	cmpeq r0, #0x44
	bne _0223467C
	ldr r1, _02234684 ; =_022577C4
	mov r0, r5
	ldr r2, [r1]
	mov r1, r4
	ldr r2, [r2, #0x2c]
	blx r2
	b _0223467C
_02234658:
	ldr r0, [r6, #8]
	cmp r0, #1
	ldreq r0, [sp, #0x10]
	cmpeq r0, #4
	bne _0223467C
	ldr r0, _02234684 ; =_022577C4
	ldr r0, [r0]
	add r0, r0, #0x144
	bl ov45_0223B1C8
_0223467C:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02234684: .word _022577C4
	arm_func_end ov45_0223454C

	arm_func_start ov45_02234688
ov45_02234688: ; 0x02234688
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r1, _02234760 ; =_022577C4
	add r0, sp, #0
	ldr r1, [r1]
	add r1, r1, #0xb8
	bl ov45_022320B4
	ldr r0, [sp]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #1
	ldrne r0, [sp, #8]
	bl ov45_02240A80
	cmp r0, #0
	moveq r4, #1
	movne r4, #0
	add r0, sp, #0
	bl ov45_02237BC8
	cmp r4, #0
	addne sp, sp, #0xc
	movne r0, #0
	ldmneia sp!, {r3, r4, pc}
	ldr r0, _02234760 ; =_022577C4
	ldr r1, [r0]
	ldr r0, [r1, #0xc8]
	cmp r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	ldr r0, [r1, #0xcc]
	cmp r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	ldr r0, [r1, #0x148]
	cmp r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	ldr r0, [r1, #0x144]
	cmp r0, #4
	movge r0, #1
	movlt r0, #0
	cmp r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	add r0, r1, #0xe8
	bl ov45_0223E4A8
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_02234760: .word _022577C4
	arm_func_end ov45_02234688

	arm_func_start ov45_02234764
ov45_02234764: ; 0x02234764
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _022347BC ; =_022577C4
	ldr r4, [r0]
	ldr r1, [r4, #0x11c]
	cmp r1, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	str r1, [r4, #0x11c]
	ldr r1, [r0]
	add r0, r4, #0x110
	ldr r5, [r1, #0x4c]
	bl ov45_02231C78
	ldr ip, [r4, #0x114]
	mov r3, r0
	ldr r2, _022347C0 ; =ov45_022550C4
	mov r0, r5
	mov r1, #0
	str ip, [sp]
	bl ov45_02233434
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022347BC: .word _022577C4
_022347C0: .word ov45_022550C4
	arm_func_end ov45_02234764

	arm_func_start ov45_022347C4
ov45_022347C4: ; 0x022347C4
	stmdb sp!, {r3, lr}
	ldr r0, _0223480C ; =_022577C4
	ldr r3, [r0]
	ldr r1, [r3, #0x10c]
	cmp r1, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	mov r1, #0
	str r1, [r3, #0x10c]
	mov r2, #0x10
	str r2, [sp]
	ldr r0, [r0]
	ldr r2, _02234810 ; =ov45_022550D4
	ldr r0, [r0, #0x4c]
	add r3, r3, #0xfc
	bl ov45_02233434
	mov r0, #1
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223480C: .word _022577C4
_02234810: .word ov45_022550D4
	arm_func_end ov45_022347C4

	arm_func_start ov45_02234814
ov45_02234814: ; 0x02234814
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r0, _0223486C ; =_022577C4
	ldr r3, [r0]
	ldr r0, [r3, #0x68]
	cmp r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {pc}
	mov r2, #1
	str r2, [sp]
	add r0, r3, #0x74
	str r0, [sp, #4]
	mov r0, #0x44
	str r0, [sp, #8]
	mov r1, #0
	ldr r0, [r3, #0x4c]
	mov r3, r1
	bl ov45_0223325C
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.balign 4, 0
_0223486C: .word _022577C4
	arm_func_end ov45_02234814

	arm_func_start ov45_02234870
ov45_02234870: ; 0x02234870
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r1, _022348C0 ; =_022577C4
	add r0, sp, #0
	ldr r1, [r1]
	add r1, r1, #0xb8
	bl ov45_022320B4
	ldr r0, [sp]
	ldr r1, _022348C4 ; =ov45_022367E0
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #1
	ldrne r0, [sp, #8]
	mov r2, #0
	bl ov45_02241E24
	add r0, sp, #0
	bl ov45_02237BC8
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.balign 4, 0
_022348C0: .word _022577C4
_022348C4: .word ov45_022367E0
	arm_func_end ov45_02234870

	arm_func_start ov45_022348C8
ov45_022348C8: ; 0x022348C8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _02234938 ; =_022577C4
	ldr r1, [r0]
	ldr r0, [r1, #0x148]
	cmp r0, #0
	addne sp, sp, #0x10
	movne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, sp, #4
	add r1, r1, #0xb8
	bl ov45_022320B4
	ldr r0, [sp, #4]
	mov ip, #0
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #5
	ldrne r0, [sp, #0xc]
	ldr r2, _0223493C ; =ov45_022550E4
	ldr r3, _02234940 ; =ov45_0223683C
	sub r1, ip, #1
	str ip, [sp]
	bl ov45_022417B4
	add r0, sp, #4
	bl ov45_02237BC8
	mov r0, #1
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02234938: .word _022577C4
_0223493C: .word ov45_022550E4
_02234940: .word ov45_0223683C
	arm_func_end ov45_022348C8

	arm_func_start ov45_02234944
ov45_02234944: ; 0x02234944
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	ldr r0, _022349C0 ; =_022577C4
	ldr r1, [r0]
	ldr r0, [r1, #0x144]
	cmp r0, #4
	movge r0, #1
	movlt r0, #0
	cmp r0, #0
	addne sp, sp, #0x10
	movne r0, #0
	ldmneia sp!, {r3, pc}
	add r0, sp, #4
	add r1, r1, #0xb8
	bl ov45_022320B4
	ldr r0, [sp, #4]
	mov ip, #0
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #5
	ldrne r0, [sp, #0xc]
	ldr r2, _022349C4 ; =ov45_022550F4
	ldr r3, _022349C8 ; =ov45_0223694C
	sub r1, ip, #1
	str ip, [sp]
	bl ov45_022417B4
	add r0, sp, #4
	bl ov45_02237BC8
	mov r0, #1
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022349C0: .word _022577C4
_022349C4: .word ov45_022550F4
_022349C8: .word ov45_0223694C
	arm_func_end ov45_02234944

	arm_func_start ov45_022349CC
ov45_022349CC: ; 0x022349CC
	cmp r0, #0xa
	addls pc, pc, r0, lsl #2
	b _02234A1C
_022349D8: ; jump table
	b _02234A04 ; case 0
	b _02234A1C ; case 1
	b _02234A1C ; case 2
	b _02234A1C ; case 3
	b _02234A1C ; case 4
	b _02234A1C ; case 5
	b _02234A0C ; case 6
	b _02234A14 ; case 7
	b _02234A14 ; case 8
	b _02234A14 ; case 9
	b _02234A14 ; case 10
_02234A04:
	mov r0, #0
	bx lr
_02234A0C:
	mov r0, #1
	bx lr
_02234A14:
	mov r0, #2
	bx lr
_02234A1C:
	mov r0, #2
	bx lr
	arm_func_end ov45_022349CC

	arm_func_start ov45_02234A24
ov45_02234A24: ; 0x02234A24
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r5, r3
	mov r3, #0
	cmp r0, #0
	ldr r4, [sp, #0x18]
	str r3, [r5]
	mov r7, r1
	mov r6, r2
	str r3, [r4]
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #4
	movlo r0, #2
	ldmloia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r0, [r7]
	bl ov45_022349CC
	cmp r0, #2
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r1, r7, #4
	str r1, [r5]
	sub r1, r6, #4
	str r1, [r4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_02234A24

	arm_func_start ov45_02234A88
ov45_02234A88: ; 0x02234A88
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x38
	ldr r3, _02234D54 ; =_022577C4
	ldr r3, [r3]
	cmp r3, #0
	ldrne r3, [r3]
	cmpne r3, #9
	addeq sp, sp, #0x38
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r5, #0
	add r4, sp, #0x1c
	add r3, sp, #0x20
	str r5, [sp, #0x20]
	str r5, [sp, #0x1c]
	str r4, [sp]
	bl ov45_02234A24
	movs r4, r0
	bne _02234ADC
	ldr r0, [sp, #0x1c]
	cmp r0, #0x94
	movne r4, #2
_02234ADC:
	cmp r4, #0
	bne _02234AF4
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	mov r2, #0
	bl ov45_022325B0
_02234AF4:
	ldr r0, _02234D54 ; =_022577C4
	ldr r1, [sp, #0x20]
	ldr r0, [r0]
	ldr r2, [sp, #0x1c]
	ldr r3, [r0, #0x34]
	mov r0, r4
	blx r3
	cmp r4, #0
	beq _02234B34
	ldr r0, _02234D54 ; =_022577C4
	mov r1, #6
	ldr r2, [r0]
	mov r0, #0xa
	stmia r2, {r0, r1}
	add sp, sp, #0x38
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02234B34:
	ldr r0, _02234D54 ; =_022577C4
	ldr r0, [r0]
	add r0, r0, #0x110
	bl ov45_02231C78
	ldr r1, _02234D54 ; =_022577C4
	mov r2, #1
	ldr r1, [r1]
	ldr r1, [r1, #0x4c]
	strh r2, [sp, #0x28]
	str r1, [sp, #0x24]
	ldrb r1, [r0, #0x42]
	strb r1, [sp, #0x2a]
	ldrb r1, [r0, #0x39]
	add r0, sp, #0x2c
	strb r1, [sp, #0x2b]
	bl OS_GetMacAddress
	ldr r0, _02234D58 ; =_02254F58
	ldr r1, _02234D54 ; =_022577C4
	ldr r5, [r0, #0x10]
	ldr r1, [r1]
	ldr r4, [r0, #0xc]
	ldr r0, [r1, #0x50]
	ldr r7, [r1, #0x4c]
	cmp r0, #0
	ldr r0, _02234D5C ; =ov45_022577D4
	moveq r8, #0
	ldr r0, [r0]
	movne r8, #1
	cmp r0, #0
	addne sp, sp, #0x38
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, #0x40
	bl ov45_02242394
	movs r6, r0
	beq _02234C58
	ldr r1, _02234D60 ; =ov45_02254FC0
	mov r0, #3
	str r1, [r6]
	str r0, [r6, #4]
	mov r1, r4
	add r0, r6, #0xc
	str r8, [r6, #8]
	bl ov45_02237B58
	mov r1, r5
	add r0, r6, #0x18
	bl ov45_02237B58
	add r2, sp, #0x24
	add r4, r2, #0x14
	mov r1, #0
	str r7, [r6, #0x24]
	str r1, [r6, #0x28]
	str r1, [r6, #0x2c]
	ldr r0, _02234D64 ; =ov45_02234D68
	str r1, [r6, #0x30]
	str r0, [r6, #0x34]
	str r1, [r6, #0x38]
	mov r0, #1
	str r0, [r6, #0x3c]
	strb r1, [sp, #9]
	strb r1, [sp, #0xa]
	strb r1, [sp, #8]
	strb r1, [sp, #4]
	sub r1, sp, #4
	ldr r0, [sp, #0x18]
	str r4, [r1]
	str r0, [r1, #4]
	ldr r3, [r1]
	add r1, sp, #0xc
	str r2, [sp, #0xc]
	add r0, r6, #0x28
	str r4, [sp, #0x14]
	ldmia r1, {r1, r2}
	bl ov45_022327B8
_02234C58:
	ldr r0, _02234D5C ; =ov45_022577D4
	str r6, [r0]
	ldr r0, [r6, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, r6, #0xd
	ldrne r1, [r6, #0x14]
	ldr r0, [r6, #8]
	bl ov45_0225443C
	ldr r0, [r6, #0x3c]
	ldr r4, [r6, #0x2c]
	cmp r0, #0
	ldr r0, [r6, #0x18]
	beq _02234CC8
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r5, r6, #0x19
	ldrne r5, [r6, #0x20]
	add r0, r6, #0x28
	bl ov45_02231C78
	mov r1, #0
	str r1, [sp]
	mov r2, r0
	ldr r1, [r6, #0x24]
	mov r0, r5
	mov r3, r4
	bl ov45_02254A04
	b _02234CFC
_02234CC8:
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r5, r6, #0x19
	ldrne r5, [r6, #0x20]
	add r0, r6, #0x28
	bl ov45_02231C78
	mov r1, #0
	str r1, [sp]
	mov r2, r0
	ldr r1, [r6, #0x24]
	mov r0, r5
	mov r3, r4
	bl ov45_022549E0
_02234CFC:
	cmp r0, #0
	moveq r0, #1
	beq _02234D10
	bl ov45_022546F8
	mov r0, #0
_02234D10:
	cmp r0, #0
	addne sp, sp, #0x38
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, _02234D5C ; =ov45_022577D4
	ldr r0, [r0]
	cmp r0, #0
	addeq sp, sp, #0x38
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	beq _02234D40
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
_02234D40:
	ldr r0, _02234D5C ; =ov45_022577D4
	mov r1, #0
	str r1, [r0]
	add sp, sp, #0x38
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02234D54: .word _022577C4
_02234D58: .word _02254F58
_02234D5C: .word ov45_022577D4
_02234D60: .word ov45_02254FC0
_02234D64: .word ov45_02234D68
	arm_func_end ov45_02234A88

	arm_func_start ov45_02234D68
ov45_02234D68: ; 0x02234D68
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x50
	ldr r3, _022350E8 ; =_022577C4
	ldr r3, [r3]
	cmp r3, #0
	ldrne r3, [r3]
	cmpne r3, #9
	addeq sp, sp, #0x50
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r5, #0
	add r4, sp, #0x1c
	add r3, sp, #0x20
	str r5, [sp, #0x20]
	str r5, [sp, #0x1c]
	str r4, [sp]
	bl ov45_02234A24
	movs r4, r0
	bne _02234DD0
	ldr r0, _022350E8 ; =_022577C4
	ldr r1, [sp, #0x20]
	ldr r0, [r0]
	ldr r2, [sp, #0x1c]
	add r0, r0, #0x144
	bl ov45_0223AC78
	cmp r0, #0
	moveq r4, #2
_02234DD0:
	ldr r0, _022350E8 ; =_022577C4
	ldr r1, [sp, #0x20]
	ldr r2, [r0]
	mov r0, r4
	ldr r2, [r2, #0x38]
	blx r2
	cmp r4, #0
	beq _02234E0C
	ldr r0, _022350E8 ; =_022577C4
	mov r1, #4
	ldr r2, [r0]
	mov r0, #0xa
	stmia r2, {r0, r1}
	add sp, sp, #0x50
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02234E0C:
	cmp r0, #0
	beq _02234E2C
	ldr r0, _022350E8 ; =_022577C4
	ldr r1, [sp, #0x20]
	ldr r0, [r0]
	ldr r2, [sp, #0x1c]
	add r0, r0, #0x144
	bl ov45_02238C74
_02234E2C:
	ldr r0, _022350E8 ; =_022577C4
	ldr r0, [r0]
	add r0, r0, #0x110
	bl ov45_02231C78
	ldr r1, _022350E8 ; =_022577C4
	add r2, sp, #0x38
	mov r3, #0
	ldr r1, [r1]
	mov r4, r0
	add r0, r1, #0x110
	str r3, [r2]
	str r3, [r2, #4]
	str r3, [r2, #8]
	str r3, [r2, #0xc]
	str r3, [r2, #0x10]
	str r3, [r2, #0x14]
	bl ov45_02231C78
	ldr r1, _022350E8 ; =_022577C4
	mov r2, #1
	ldr r1, [r1]
	ldr r1, [r1, #0x4c]
	strh r2, [sp, #0x28]
	str r1, [sp, #0x24]
	ldrb r1, [r0, #0x42]
	strb r1, [sp, #0x2a]
	ldrb r1, [r0, #0x39]
	add r0, sp, #0x2c
	strb r1, [sp, #0x2b]
	bl OS_GetMacAddress
	ldrh r1, [sp, #0x28]
	ldrb r0, [sp, #0x2a]
	ldrb sb, [sp, #0x2b]
	ldrb lr, [sp, #0x2c]
	ldrb ip, [sp, #0x2d]
	ldrb r8, [sp, #0x2e]
	ldrb r7, [sp, #0x2f]
	ldrb r6, [sp, #0x30]
	ldrb r5, [sp, #0x31]
	ldrh r3, [sp, #0x32]
	ldr sl, [sp, #0x24]
	ldr r2, [sp, #0x34]
	strh r1, [sp, #0x3c]
	strb r0, [sp, #0x3e]
	str sl, [sp, #0x38]
	strb sb, [sp, #0x3f]
	strb lr, [sp, #0x40]
	strb ip, [sp, #0x41]
	strb r8, [sp, #0x42]
	strb r7, [sp, #0x43]
	strb r6, [sp, #0x44]
	strb r5, [sp, #0x45]
	ldr r0, _022350EC ; =_02254F58
	str r2, [sp, #0x48]
	ldr r1, _022350E8 ; =_022577C4
	strh r3, [sp, #0x46]
	ldr r3, [r4, #4]
	ldr r2, [r1]
	str r3, [sp, #0x4c]
	ldr r1, [r2, #0x50]
	ldr r5, [r0, #0x14]
	ldr r4, [r0, #0xc]
	ldr r0, _022350F0 ; =ov45_022577D4
	cmp r1, #0
	moveq r8, #0
	ldr r0, [r0]
	movne r8, #1
	cmp r0, #0
	ldr r7, [r2, #0x4c]
	addne sp, sp, #0x50
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, #0x40
	bl ov45_02242394
	movs r6, r0
	beq _02234FEC
	ldr r1, _022350F4 ; =ov45_02254FC0
	mov r0, #3
	str r1, [r6]
	str r0, [r6, #4]
	mov r1, r4
	add r0, r6, #0xc
	str r8, [r6, #8]
	bl ov45_02237B58
	mov r1, r5
	add r0, r6, #0x18
	bl ov45_02237B58
	add r2, sp, #0x38
	add r4, r2, #0x18
	mov r1, #0
	str r7, [r6, #0x24]
	str r1, [r6, #0x28]
	str r1, [r6, #0x2c]
	ldr r0, _022350F8 ; =ov45_022350FC
	str r1, [r6, #0x30]
	str r0, [r6, #0x34]
	str r1, [r6, #0x38]
	mov r0, #1
	str r0, [r6, #0x3c]
	strb r1, [sp, #9]
	strb r1, [sp, #0xa]
	strb r1, [sp, #8]
	strb r1, [sp, #4]
	sub r1, sp, #4
	ldr r0, [sp, #0x18]
	str r4, [r1]
	str r0, [r1, #4]
	ldr r3, [r1]
	add r1, sp, #0xc
	str r2, [sp, #0xc]
	add r0, r6, #0x28
	str r4, [sp, #0x14]
	ldmia r1, {r1, r2}
	bl ov45_022327B8
_02234FEC:
	ldr r0, _022350F0 ; =ov45_022577D4
	str r6, [r0]
	ldr r0, [r6, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, r6, #0xd
	ldrne r1, [r6, #0x14]
	ldr r0, [r6, #8]
	bl ov45_0225443C
	ldr r0, [r6, #0x3c]
	ldr r4, [r6, #0x2c]
	cmp r0, #0
	ldr r0, [r6, #0x18]
	beq _0223505C
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r5, r6, #0x19
	ldrne r5, [r6, #0x20]
	add r0, r6, #0x28
	bl ov45_02231C78
	mov r1, #0
	str r1, [sp]
	mov r2, r0
	ldr r1, [r6, #0x24]
	mov r0, r5
	mov r3, r4
	bl ov45_02254A04
	b _02235090
_0223505C:
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r5, r6, #0x19
	ldrne r5, [r6, #0x20]
	add r0, r6, #0x28
	bl ov45_02231C78
	mov r1, #0
	str r1, [sp]
	mov r2, r0
	ldr r1, [r6, #0x24]
	mov r0, r5
	mov r3, r4
	bl ov45_022549E0
_02235090:
	cmp r0, #0
	moveq r0, #1
	beq _022350A4
	bl ov45_022546F8
	mov r0, #0
_022350A4:
	cmp r0, #0
	addne sp, sp, #0x50
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, _022350F0 ; =ov45_022577D4
	ldr r0, [r0]
	cmp r0, #0
	addeq sp, sp, #0x50
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	beq _022350D4
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
_022350D4:
	ldr r0, _022350F0 ; =ov45_022577D4
	mov r1, #0
	str r1, [r0]
	add sp, sp, #0x50
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_022350E8: .word _022577C4
_022350EC: .word _02254F58
_022350F0: .word ov45_022577D4
_022350F4: .word ov45_02254FC0
_022350F8: .word ov45_022350FC
	arm_func_end ov45_02234D68

	arm_func_start ov45_022350FC
ov45_022350FC: ; 0x022350FC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x38
	ldr r3, _022353DC ; =_022577C4
	ldr r3, [r3]
	cmp r3, #0
	ldrne r3, [r3]
	cmpne r3, #9
	addeq sp, sp, #0x38
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r5, #0
	add r4, sp, #0x1c
	add r3, sp, #0x20
	str r5, [sp, #0x20]
	str r5, [sp, #0x1c]
	str r4, [sp]
	bl ov45_02234A24
	ldr r2, _022353DC ; =_022577C4
	ldr r1, [sp, #0x20]
	ldr r3, [r2]
	mov r4, r0
	ldr r2, [sp, #0x1c]
	add r0, r3, #0x144
	bl ov45_0223AE84
	cmp r0, #0
	moveq r4, #2
	cmp r4, #0
	beq _02235184
	ldr r0, _022353DC ; =_022577C4
	mov r1, #5
	ldr r2, [r0]
	mov r0, #0xa
	stmia r2, {r0, r1}
	add sp, sp, #0x38
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02235184:
	ldr r0, _022353DC ; =_022577C4
	ldr r1, [sp, #0x20]
	ldr r0, [r0]
	ldr r2, [sp, #0x1c]
	add r0, r0, #0x144
	bl ov45_0223ACA4
	ldr r0, _022353DC ; =_022577C4
	ldr r2, [sp, #0x1c]
	ldr r0, [r0]
	ldr r1, [sp, #0x20]
	ldr r3, [r0, #0x3c]
	mov r0, r4
	mov r2, r2, lsr #3
	blx r3
	ldr r0, _022353DC ; =_022577C4
	ldr r0, [r0]
	add r0, r0, #0x110
	bl ov45_02231C78
	ldr r1, _022353DC ; =_022577C4
	mov r2, #1
	ldr r1, [r1]
	ldr r1, [r1, #0x4c]
	strh r2, [sp, #0x28]
	str r1, [sp, #0x24]
	ldrb r1, [r0, #0x42]
	strb r1, [sp, #0x2a]
	ldrb r1, [r0, #0x39]
	add r0, sp, #0x2c
	strb r1, [sp, #0x2b]
	bl OS_GetMacAddress
	ldr r0, _022353E0 ; =_02254F58
	ldr r1, _022353DC ; =_022577C4
	ldr r5, [r0, #8]
	ldr r1, [r1]
	ldr r4, [r0, #0xc]
	ldr r0, [r1, #0x50]
	ldr r7, [r1, #0x4c]
	cmp r0, #0
	ldr r0, _022353E4 ; =ov45_022577D4
	moveq r8, #0
	ldr r0, [r0]
	movne r8, #1
	cmp r0, #0
	addne sp, sp, #0x38
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, #0x40
	bl ov45_02242394
	movs r6, r0
	beq _022352E0
	ldr r1, _022353E8 ; =ov45_02254FC0
	mov r0, #3
	str r1, [r6]
	str r0, [r6, #4]
	mov r1, r4
	add r0, r6, #0xc
	str r8, [r6, #8]
	bl ov45_02237B58
	mov r1, r5
	add r0, r6, #0x18
	bl ov45_02237B58
	add r2, sp, #0x24
	add r4, r2, #0x14
	mov r1, #0
	str r7, [r6, #0x24]
	str r1, [r6, #0x28]
	str r1, [r6, #0x2c]
	ldr r0, _022353EC ; =ov45_022353F0
	str r1, [r6, #0x30]
	str r0, [r6, #0x34]
	str r1, [r6, #0x38]
	mov r0, #1
	str r0, [r6, #0x3c]
	strb r1, [sp, #9]
	strb r1, [sp, #0xa]
	strb r1, [sp, #8]
	strb r1, [sp, #4]
	sub r1, sp, #4
	ldr r0, [sp, #0x18]
	str r4, [r1]
	str r0, [r1, #4]
	ldr r3, [r1]
	add r1, sp, #0xc
	str r2, [sp, #0xc]
	add r0, r6, #0x28
	str r4, [sp, #0x14]
	ldmia r1, {r1, r2}
	bl ov45_022327B8
_022352E0:
	ldr r0, _022353E4 ; =ov45_022577D4
	str r6, [r0]
	ldr r0, [r6, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, r6, #0xd
	ldrne r1, [r6, #0x14]
	ldr r0, [r6, #8]
	bl ov45_0225443C
	ldr r0, [r6, #0x3c]
	ldr r4, [r6, #0x2c]
	cmp r0, #0
	ldr r0, [r6, #0x18]
	beq _02235350
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r5, r6, #0x19
	ldrne r5, [r6, #0x20]
	add r0, r6, #0x28
	bl ov45_02231C78
	mov r1, #0
	str r1, [sp]
	mov r2, r0
	ldr r1, [r6, #0x24]
	mov r0, r5
	mov r3, r4
	bl ov45_02254A04
	b _02235384
_02235350:
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r5, r6, #0x19
	ldrne r5, [r6, #0x20]
	add r0, r6, #0x28
	bl ov45_02231C78
	mov r1, #0
	str r1, [sp]
	mov r2, r0
	ldr r1, [r6, #0x24]
	mov r0, r5
	mov r3, r4
	bl ov45_022549E0
_02235384:
	cmp r0, #0
	moveq r0, #1
	beq _02235398
	bl ov45_022546F8
	mov r0, #0
_02235398:
	cmp r0, #0
	addne sp, sp, #0x38
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, _022353E4 ; =ov45_022577D4
	ldr r0, [r0]
	cmp r0, #0
	addeq sp, sp, #0x38
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	beq _022353C8
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
_022353C8:
	ldr r0, _022353E4 ; =ov45_022577D4
	mov r1, #0
	str r1, [r0]
	add sp, sp, #0x38
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_022353DC: .word _022577C4
_022353E0: .word _02254F58
_022353E4: .word ov45_022577D4
_022353E8: .word ov45_02254FC0
_022353EC: .word ov45_022353F0
	arm_func_end ov45_022350FC

	arm_func_start ov45_022353F0
ov45_022353F0: ; 0x022353F0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r3, _022354A8 ; =_022577C4
	ldr r3, [r3]
	cmp r3, #0
	ldrne r3, [r3]
	cmpne r3, #9
	addeq sp, sp, #0xc
	ldmeqia sp!, {r3, r4, pc}
	mov r3, #0
	add ip, sp, #4
	str r3, [sp, #8]
	str r3, [sp, #4]
	add r3, sp, #8
	str ip, [sp]
	bl ov45_02234A24
	ldr r1, [sp, #4]
	mov r4, r0
	cmp r1, #0x2d8
	movne r4, #2
	cmp r4, #0
	beq _02235464
	ldr r0, _022354A8 ; =_022577C4
	mov r1, #7
	ldr r2, [r0]
	mov r0, #0xa
	stmia r2, {r0, r1}
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
_02235464:
	ldr r0, _022354A8 ; =_022577C4
	ldr r1, [sp, #8]
	ldr r0, [r0]
	add r0, r0, #0x144
	bl ov45_0223AF04
	ldr r0, _022354A8 ; =_022577C4
	ldr r1, [sp, #8]
	ldr r2, [r0]
	mov r0, r4
	ldr r2, [r2, #0x40]
	blx r2
	ldr r0, _022354A8 ; =_022577C4
	mov r1, #2
	ldr r0, [r0]
	str r1, [r0, #0x144]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_022354A8: .word _022577C4
	arm_func_end ov45_022353F0

	arm_func_start ov45_022354AC
ov45_022354AC: ; 0x022354AC
	stmdb sp!, {r3, lr}
	ldr r1, _022354F0 ; =_022577C4
	ldr r2, [r1]
	cmp r2, #0
	ldrne r1, [r2]
	cmpne r1, #9
	ldmeqia sp!, {r3, pc}
	mov r3, #0
	ldr r1, _022354F0 ; =_022577C4
	str r3, [r2, #0x6c]
	ldr r1, [r1]
	cmp r0, #0
	moveq r3, #2
	ldr r1, [r1, #0x44]
	mov r0, r3
	blx r1
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022354F0: .word _022577C4
	arm_func_end ov45_022354AC

	arm_func_start ov45_022354F4
ov45_022354F4: ; 0x022354F4
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x2b4
	mov r6, r3
	cmp r6, #5
	mov r7, r2
	addeq sp, sp, #0x2b4
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	cmp r0, #0
	beq _022359D0
	ldr r0, _02235A78 ; =_022577C4
	mov r4, #0
	ldr r3, [r0]
	mov r2, #5
	add r0, sp, #0x288
	add r1, sp, #0x27c
	str r4, [r3, #0x70]
	str r2, [sp, #0x298]
	str r4, [sp, #0x29c]
	str r4, [sp, #0x2a0]
	str r4, [sp, #0x2a4]
	bl ov00_021ECB94
	add r0, sp, #0x288
	add r1, sp, #0x27c
	bl RTC_ConvertDateTimeToSecond
	ldr r4, [sp, #0x298]
	str r0, [sp, #0x29c]
	str r1, [sp, #0x2a0]
	ldr r2, _02235A78 ; =_022577C4
	str r4, [sp, #0x268]
	add r3, sp, #0x29c
	ldr r4, [r2]
	add ip, sp, #0x26c
	ldmia r3, {r2, r3}
	stmia ip, {r2, r3}
	ldr r1, [sp, #0x2a4]
	mov r0, #1
	str r0, [sp, #0x278]
	add r5, sp, #0x268
	str r1, [sp, #0x274]
	mov r1, r5
	add r0, r4, #0xfc
	mov r2, #0x10
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	bne _022355DC
	ldr r0, [r5]
	add r1, r5, #4
	str r0, [r4, #0xfc]
	add r0, r4, #0x100
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldr r1, [r5, #0xc]
	mov r0, #1
	str r1, [r4, #0x108]
	str r0, [r4, #0x10c]
_022355DC:
	ldr r1, _02235A7C ; =ov45_02236690
	mov r3, #1
	mov r0, r7
	mov r2, r6
	str r3, [r4, #0x128]
	bl ov45_02241B84
	ldr r2, _02235A78 ; =_022577C4
	add r0, sp, #0x258
	add r1, sp, #0x24c
	ldr r4, [r2]
	bl ov00_021ECB94
	add r0, sp, #0x258
	add r1, sp, #0x24c
	bl RTC_ConvertDateTimeToSecond
	mov r2, #0
	subs r0, r0, #3
	str r0, [sp, #0x1fc]
	sbc r0, r1, #0
	str r0, [sp, #0x200]
	ldr r0, _02235A80 ; =ov45_022347C4
	mov r1, #3
	str r1, [sp, #0x204]
	str r0, [sp, #0x210]
	str r2, [sp, #0x208]
	str r2, [sp, #0x20c]
	add r0, sp, #0x214
	mov r1, #1
	add r2, sp, #0x1fc
	bl ov45_02232AE8
	mov r0, #0
	add r2, sp, #0x218
	add r7, sp, #0x234
	add r1, r4, #0x134
	strb r0, [sp, #9]
	strb r0, [sp, #8]
	ldr r0, [sp, #0x214]
	add r6, r2, #8
	str r0, [sp, #0x230]
	ldr r4, [r2, #0x10]
	ldr r0, [r2, #0x14]
	ldmia r2, {r2, r3}
	stmia r7, {r2, r3}
	add r5, r7, #8
	ldmia r6, {r2, r3}
	stmia r5, {r2, r3}
	str r0, [r7, #0x14]
	add r0, sp, #0x2c
	add r2, sp, #0x230
	str r4, [r7, #0x10]
	bl ov45_02236BA8
	ldr r1, _02235A78 ; =_022577C4
	add r0, sp, #0x1ec
	ldr r4, [r1]
	add r1, sp, #0x1e0
	bl ov00_021ECB94
	add r0, sp, #0x1ec
	add r1, sp, #0x1e0
	bl RTC_ConvertDateTimeToSecond
	ldr r6, _02235A84 ; =ov45_02234764
	mov r7, #0
	subs r5, r0, #4
	str r0, [sp, #0x190]
	sbc r3, r1, #0
	mov ip, #4
	add r0, sp, #0x1a8
	add r2, sp, #0x190
	mov r1, #2
	str ip, [sp, #0x198]
	str r7, [sp, #0x19c]
	str r7, [sp, #0x1a0]
	str r6, [sp, #0x1a4]
	str r5, [sp, #0x190]
	str r3, [sp, #0x194]
	bl ov45_02232AE8
	ldr r0, [sp, #0x1a8]
	add r6, sp, #0x1ac
	add r5, sp, #0x1c8
	str r0, [sp, #0x1c4]
	ldmia r6, {r2, r3}
	stmia r5, {r2, r3}
	add r2, r6, #8
	add r0, r5, #8
	ldmia r2, {r2, r3}
	stmia r0, {r2, r3}
	ldr r2, [r6, #0x10]
	ldr r3, [r6, #0x14]
	str r2, [r5, #0x10]
	add r1, r4, #0x134
	add r0, sp, #0x24
	add r2, sp, #0x1c4
	strb r7, [sp, #7]
	strb r7, [sp, #6]
	str r3, [r5, #0x14]
	bl ov45_02236BA8
	ldr r1, _02235A78 ; =_022577C4
	add r0, sp, #0x180
	ldr r4, [r1]
	add r1, sp, #0x174
	bl ov00_021ECB94
	add r0, sp, #0x180
	add r1, sp, #0x174
	bl RTC_ConvertDateTimeToSecond
	mov r2, #4
	str r2, [sp, #0x12c]
	mov r2, r7
	str r0, [sp, #0x124]
	subs r0, r0, #4
	str r0, [sp, #0x124]
	str r2, [sp, #0x130]
	str r2, [sp, #0x134]
	ldr r2, _02235A88 ; =ov45_022348C8
	str r1, [sp, #0x128]
	sbc r0, r1, #0
	str r2, [sp, #0x138]
	str r0, [sp, #0x128]
	add r0, sp, #0x13c
	mov r1, #5
	add r2, sp, #0x124
	bl ov45_02232AE8
	ldr r0, [sp, #0x13c]
	add r7, sp, #0x140
	add r6, sp, #0x15c
	str r0, [sp, #0x158]
	ldmia r7, {r2, r3}
	mov ip, #0
	stmia r6, {r2, r3}
	add r1, r7, #8
	ldmia r1, {r2, r3}
	add r0, r6, #8
	stmia r0, {r2, r3}
	ldr r5, [r7, #0x10]
	ldr r3, [r7, #0x14]
	add r0, sp, #0x1c
	add r2, sp, #0x158
	add r1, r4, #0x134
	strb ip, [sp, #5]
	strb ip, [sp, #4]
	str r5, [r6, #0x10]
	str r3, [r6, #0x14]
	bl ov45_02236BA8
	ldr r2, _02235A78 ; =_022577C4
	add r0, sp, #0x114
	add r1, sp, #0x108
	ldr r4, [r2]
	bl ov00_021ECB94
	add r0, sp, #0x114
	add r1, sp, #0x108
	bl RTC_ConvertDateTimeToSecond
	mov r2, #3
	str r2, [sp, #0xc0]
	mov r2, #0
	str r0, [sp, #0xb8]
	subs r0, r0, #3
	str r0, [sp, #0xb8]
	str r2, [sp, #0xc4]
	str r2, [sp, #0xc8]
	ldr r2, _02235A8C ; =ov45_02234870
	str r1, [sp, #0xbc]
	sbc r0, r1, #0
	str r2, [sp, #0xcc]
	str r0, [sp, #0xbc]
	add r0, sp, #0xd0
	mov r1, #4
	add r2, sp, #0xb8
	bl ov45_02232AE8
	mov r0, #0
	add r2, sp, #0xd4
	add r7, sp, #0xf0
	strb r0, [sp, #3]
	strb r0, [sp, #2]
	ldr r0, [sp, #0xd0]
	add r6, r2, #8
	str r0, [sp, #0xec]
	ldr r1, [r2, #0x10]
	ldr r0, [r2, #0x14]
	ldmia r2, {r2, r3}
	stmia r7, {r2, r3}
	add r5, r7, #8
	ldmia r6, {r2, r3}
	stmia r5, {r2, r3}
	str r1, [r7, #0x10]
	str r0, [r7, #0x14]
	add r0, sp, #0x14
	add r2, sp, #0xec
	add r1, r4, #0x134
	bl ov45_02236BA8
	ldr r2, _02235A78 ; =_022577C4
	add r0, sp, #0xa8
	add r1, sp, #0x9c
	ldr r4, [r2]
	bl ov00_021ECB94
	add r0, sp, #0xa8
	add r1, sp, #0x9c
	bl RTC_ConvertDateTimeToSecond
	mov r2, #0
	subs r0, r0, #4
	str r0, [sp, #0x4c]
	sbc r0, r1, #0
	str r0, [sp, #0x50]
	ldr r0, _02235A90 ; =ov45_02234944
	mov r1, #4
	str r1, [sp, #0x54]
	str r0, [sp, #0x60]
	str r2, [sp, #0x58]
	str r2, [sp, #0x5c]
	add r0, sp, #0x64
	mov r1, #6
	add r2, sp, #0x4c
	bl ov45_02232AE8
	mov r0, #0
	add r2, sp, #0x68
	add r7, sp, #0x84
	add r1, r4, #0x134
	strb r0, [sp, #1]
	strb r0, [sp]
	ldr r0, [sp, #0x64]
	add r6, r2, #8
	str r0, [sp, #0x80]
	ldr r4, [r2, #0x10]
	ldr r0, [r2, #0x14]
	ldmia r2, {r2, r3}
	stmia r7, {r2, r3}
	add r5, r7, #8
	ldmia r6, {r2, r3}
	stmia r5, {r2, r3}
	str r0, [r7, #0x14]
	add r0, sp, #0xc
	add r2, sp, #0x80
	str r4, [r7, #0x10]
	bl ov45_02236BA8
	ldr r0, _02235A78 ; =_022577C4
	add r1, sp, #0x40
	ldr r4, [r0]
	add r3, sp, #0x2a8
	ldr r0, [r4, #0x100]
	ldr r2, [r4, #0xfc]
	str r0, [sp, #0x40]
	ldr r0, [r4, #0x104]
	str r2, [sp, #0x48]
	str r0, [sp, #0x44]
	ldmia r1, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r5, [r4, #0x124]
	add r0, r4, #0x110
	bl ov45_02231C78
	ldr r3, [r4, #0x114]
	mov r2, r0
	ldr r4, [r4, #0xc]
	add r1, sp, #0x2a8
	mov r0, r5
	blx r4
	add sp, sp, #0x2b4
	ldmia sp!, {r4, r5, r6, r7, pc}
_022359D0:
	ldr r0, _02235A78 ; =_022577C4
	mov r1, #0
	ldr r4, [r0]
	add r2, sp, #0x34
	mov r0, r1
_022359E4:
	str r0, [r2, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #3
	blo _022359E4
	mov r2, #5
	add r1, sp, #0x34
	add r0, r4, #0xbc
	str r2, [r4, #0xb8]
	bl ov45_02237D48
	mov r1, #0
	str r1, [r4, #0xc8]
	add r0, sp, #0x34
	str r1, [r4, #0xcc]
	bl ov45_02237BC8
	ldr r0, _02235A78 ; =_022577C4
	ldr r1, [r0]
	ldr r0, [r1, #0x70]
	cmp r0, #3
	movge r0, #0
	addlt r0, r0, #1
	strlt r0, [r1, #0x70]
	movlt r0, #1
	cmp r0, #0
	beq _02235A5C
	ldr r0, _02235A78 ; =_022577C4
	mov r1, #4
	ldr r0, [r0]
	add sp, sp, #0x2b4
	str r1, [r0]
	ldmia sp!, {r4, r5, r6, r7, pc}
_02235A5C:
	ldr r0, _02235A78 ; =_022577C4
	mov r1, #3
	ldr r2, [r0]
	mov r0, #0xa
	stmia r2, {r0, r1}
	add sp, sp, #0x2b4
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_02235A78: .word _022577C4
_02235A7C: .word ov45_02236690
_02235A80: .word ov45_022347C4
_02235A84: .word ov45_02234764
_02235A88: .word ov45_022348C8
_02235A8C: .word ov45_02234870
_02235A90: .word ov45_02234944
	arm_func_end ov45_022354F4

	arm_func_start ov45_02235A94
ov45_02235A94: ; 0x02235A94
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	mov r6, r3
	cmp r6, #5
	mov r7, r0
	addeq sp, sp, #0x30
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, #0
	beq _02235BC4
	cmp r6, #4
	addls pc, pc, r6, lsl #2
	b _02235AF0
_02235AC4: ; jump table
	b _02235AF0 ; case 0
	b _02235AD8 ; case 1
	b _02235AD8 ; case 2
	b _02235AE0 ; case 3
	b _02235AE8 ; case 4
_02235AD8:
	ldr r1, _02235C30 ; =ov45_02254D5C
	b _02235AF4
_02235AE0:
	ldr r1, _02235C34 ; =ov45_02254D1C
	b _02235AF4
_02235AE8:
	ldr r1, _02235C38 ; =ov45_02254D3C
	b _02235AF4
_02235AF0:
	mov r1, #0
_02235AF4:
	cmp r1, #0
	bne _02235B10
	ldr r0, _02235C3C ; =_022577C4
	mov r3, #1
	ldr r4, [r0]
	mov r0, #0xa
	stmia r4, {r0, r3}
_02235B10:
	mov r0, r2
	bl ov45_02241D58
	ldr r0, _02235C3C ; =_022577C4
	mov r1, #0
	ldr r4, [r0]
	add ip, sp, #0x24
	str r1, [r4, #0x10c]
	ldr r1, [r4, #0xfc]
	add r0, r4, #0x100
	str r1, [sp, #0x20]
	ldmia r0, {r2, r3}
	stmia ip, {r2, r3}
	ldr r1, [r4, #0x108]
	add r0, sp, #0x10
	str r1, [sp, #0x2c]
	str r6, [sp, #0x20]
	str r6, [sp, #0xc]
	ldmia ip, {r2, r3}
	stmia r0, {r2, r3}
	mov r0, #1
	str r0, [sp, #0x1c]
	add r5, sp, #0xc
	str r1, [sp, #0x18]
	mov r1, r5
	add r0, r4, #0xfc
	mov r2, #0x10
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	bne _02235BB8
	ldr r0, [r5]
	add r1, r5, #4
	str r0, [r4, #0xfc]
	add r0, r4, #0x100
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldr r1, [r5, #0xc]
	mov r0, #1
	str r1, [r4, #0x108]
	str r0, [r4, #0x10c]
_02235BB8:
	mov r0, #1
	str r0, [r4, #0x128]
	b _02235C10
_02235BC4:
	ldr r0, _02235C3C ; =_022577C4
	mov r1, #0
	ldr r4, [r0]
	add r2, sp, #0
	mov r0, r1
_02235BD8:
	str r0, [r2, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #3
	blo _02235BD8
	mov r2, #5
	add r1, sp, #0
	add r0, r4, #0xd4
	str r2, [r4, #0xd0]
	bl ov45_02237D48
	mov r1, #0
	str r1, [r4, #0xe0]
	add r0, sp, #0
	str r1, [r4, #0xe4]
	bl ov45_02237BC8
_02235C10:
	ldr r1, _02235C3C ; =_022577C4
	mov r0, r7
	ldr r2, [r1]
	mov r1, r6
	ldr r2, [r2, #8]
	blx r2
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02235C30: .word ov45_02254D5C
_02235C34: .word ov45_02254D1C
_02235C38: .word ov45_02254D3C
_02235C3C: .word _022577C4
	arm_func_end ov45_02235A94

	arm_func_start ov45_02235C40
ov45_02235C40: ; 0x02235C40
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x60
	mov r2, r0
	mov r7, r1
	add r0, sp, #0x38
	mov r1, r2
	bl ov45_02237B58
	ldr r1, _02235E48 ; =_022577C4
	add r0, sp, #0x20
	ldr r5, [r1]
	add r6, sp, #0x38
	add r1, r5, #0xb8
	bl ov45_022320B4
	add r0, sp, #0x20
	mov r1, r6
	bl ov45_022340F8
	mov r4, r0
	add r0, sp, #0x20
	bl ov45_02237BC8
	cmp r4, #0
	ldrne r5, [r5, #0xb8]
	bne _02235CC8
	add r0, sp, #0x2c
	add r1, r5, #0xd0
	bl ov45_022320B4
	add r0, sp, #0x2c
	mov r1, r6
	bl ov45_022340F8
	mov r4, r0
	add r0, sp, #0x2c
	bl ov45_02237BC8
	cmp r4, #0
	ldrne r5, [r5, #0xd0]
	moveq r5, #5
_02235CC8:
	add r0, sp, #0x38
	bl ov45_02237BC8
	cmp r5, #5
	addeq sp, sp, #0x60
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #0
	bne _02235D00
	ldr r0, _02235E48 ; =_022577C4
	mov r1, r7
	ldr r0, [r0]
	add r0, r0, #0xe8
	bl ov45_0223DD3C
	add sp, sp, #0x60
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02235D00:
	ldr r0, _02235E48 ; =_022577C4
	mov r1, r7
	ldr r0, [r0]
	add r0, r0, #0xe8
	bl ov45_0223DEC4
	movs r4, r0
	bne _02235D48
	ldr r0, _02235E48 ; =_022577C4
	mov r1, r7
	ldr r0, [r0]
	add r0, r0, #0xe8
	bl ov45_0223DD3C
	ldr r0, _02235E48 ; =_022577C4
	mov r1, r7
	ldr r0, [r0]
	add r0, r0, #0xe8
	bl ov45_0223DEC4
	mov r4, r0
_02235D48:
	mov r0, #0
	str r0, [r4, #0x14]
	ldr r0, [r4, #4]
	add r1, sp, #0x54
	str r0, [sp, #0x50]
	add r0, r4, #8
	ldmia r0, {r2, r3}
	stmia r1, {r2, r3}
	ldr ip, [r4, #0x10]
	add r0, sp, #0x10
	str ip, [sp, #0x5c]
	str r5, [sp, #0x50]
	str r5, [sp, #0xc]
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	add r6, sp, #0xc
	mov r3, #1
	mov r1, r6
	add r0, r4, #4
	mov r2, #0x10
	str ip, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	bne _02235DE0
	ldr r0, [r6]
	add r1, r6, #4
	str r0, [r4, #4]
	add r0, r4, #8
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldr r1, [r6, #0xc]
	mov r0, #1
	str r1, [r4, #0x10]
	str r0, [r4, #0x14]
_02235DE0:
	mov r0, #1
	str r0, [r4, #0x30]
	mov r0, #0
	str r0, [r4, #0x14]
	ldr r5, [r4, #4]
	ldr r2, [r4, #8]
	ldr r1, [r4, #0xc]
	add r0, sp, #0
	add r3, sp, #0x44
	str r5, [sp, #8]
	str r2, [sp]
	str r1, [sp, #4]
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r0, [r4, #0x38]
	cmp r0, #0
	addeq sp, sp, #0x60
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _02235E48 ; =_022577C4
	mov r0, r7
	ldr r2, [r1]
	mov r1, r3
	ldr r2, [r2, #0x20]
	blx r2
	add sp, sp, #0x60
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02235E48: .word _022577C4
	arm_func_end ov45_02235C40

	arm_func_start ov45_02235E4C
ov45_02235E4C: ; 0x02235E4C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x60
	mov r2, r0
	mov r6, r1
	add r0, sp, #0x38
	mov r1, r2
	bl ov45_02237B58
	ldr r1, _0223606C ; =_022577C4
	add r0, sp, #0x20
	ldr r5, [r1]
	add r7, sp, #0x38
	add r1, r5, #0xb8
	bl ov45_022320B4
	add r0, sp, #0x20
	mov r1, r7
	bl ov45_022340F8
	mov r4, r0
	add r0, sp, #0x20
	bl ov45_02237BC8
	cmp r4, #0
	ldrne r4, [r5, #0xb8]
	bne _02235ED4
	add r0, sp, #0x2c
	add r1, r5, #0xd0
	bl ov45_022320B4
	add r0, sp, #0x2c
	mov r1, r7
	bl ov45_022340F8
	mov r4, r0
	add r0, sp, #0x2c
	bl ov45_02237BC8
	cmp r4, #0
	ldrne r4, [r5, #0xd0]
	moveq r4, #5
_02235ED4:
	add r0, sp, #0x38
	bl ov45_02237BC8
	cmp r4, #5
	addeq sp, sp, #0x60
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #0
	bne _02235F48
	ldr r0, _0223606C ; =_022577C4
	mov r1, r6
	ldr r0, [r0]
	add r0, r0, #0xe8
	bl ov45_0223DEC4
	cmp r0, #0
	ldrne r0, [r0, #0x38]
	cmpne r0, #0
	addeq sp, sp, #0x60
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _0223606C ; =_022577C4
	mov r0, r6
	ldr r1, [r1]
	ldr r1, [r1, #0x10]
	blx r1
	ldr r0, _0223606C ; =_022577C4
	mov r1, r6
	ldr r0, [r0]
	add r0, r0, #0xe8
	bl ov45_0223DE38
	add sp, sp, #0x60
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02235F48:
	ldr r0, _0223606C ; =_022577C4
	mov r1, r6
	ldr r0, [r0]
	add r0, r0, #0xe8
	bl ov45_0223DEC4
	movs r4, r0
	addeq sp, sp, #0x60
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	str r0, [r4, #0x14]
	ldr r0, [r4, #4]
	add lr, sp, #0x54
	str r0, [sp, #0x50]
	add r0, r4, #8
	ldmia r0, {r2, r3}
	stmia lr, {r2, r3}
	ldr ip, [r4, #0x10]
	mov r1, #5
	add r0, sp, #0x10
	str ip, [sp, #0x5c]
	str r1, [sp, #0x50]
	str r1, [sp, #0xc]
	add r5, sp, #0xc
	ldmia lr, {r2, r3}
	stmia r0, {r2, r3}
	mov r3, #1
	mov r1, r5
	add r0, r4, #4
	mov r2, #0x10
	str ip, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	bne _02236004
	ldr r0, [r5]
	add r1, r5, #4
	str r0, [r4, #4]
	add r0, r4, #8
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldr r1, [r5, #0xc]
	mov r0, #1
	str r1, [r4, #0x10]
	str r0, [r4, #0x14]
_02236004:
	mov r0, #1
	str r0, [r4, #0x30]
	mov r0, #0
	str r0, [r4, #0x14]
	ldr r5, [r4, #4]
	ldr r2, [r4, #8]
	ldr r1, [r4, #0xc]
	add r0, sp, #0
	add r3, sp, #0x44
	str r5, [sp, #8]
	str r2, [sp]
	str r1, [sp, #4]
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r0, [r4, #0x38]
	cmp r0, #0
	addeq sp, sp, #0x60
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _0223606C ; =_022577C4
	mov r0, r6
	ldr r2, [r1]
	mov r1, r3
	ldr r2, [r2, #0x20]
	blx r2
	add sp, sp, #0x60
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223606C: .word _022577C4
	arm_func_end ov45_02235E4C

	arm_func_start ov45_02236070
ov45_02236070: ; 0x02236070
	stmdb sp!, {r3, lr}
	mov ip, r1
	mov r3, r2
	mov r1, r0
	mov r2, ip
	mov r0, #0
	bl ov45_02236090
	ldmia sp!, {r3, pc}
	arm_func_end ov45_02236070

	arm_func_start ov45_02236090
ov45_02236090: ; 0x02236090
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x58
	movs r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, #5
	beq _0223612C
	add r0, sp, #0x28
	mov r1, r7
	bl ov45_02237B58
	ldr r1, _022362B0 ; =_022577C4
	add r0, sp, #4
	ldr r8, [r1]
	add sb, sp, #0x28
	add r1, r8, #0xb8
	bl ov45_022320B4
	add r0, sp, #4
	mov r1, sb
	bl ov45_022340F8
	mov r4, r0
	add r0, sp, #4
	bl ov45_02237BC8
	cmp r4, #0
	ldrne r4, [r8, #0xb8]
	bne _02236124
	add r0, sp, #0x10
	add r1, r8, #0xd0
	bl ov45_022320B4
	add r0, sp, #0x10
	mov r1, sb
	bl ov45_022340F8
	mov r4, r0
	add r0, sp, #0x10
	bl ov45_02237BC8
	cmp r4, #0
	ldrne r4, [r8, #0xd0]
	moveq r4, #5
_02236124:
	add r0, sp, #0x28
	bl ov45_02237BC8
_0223612C:
	cmp r7, #0
	beq _02236140
	cmp r4, #5
	addeq sp, sp, #0x58
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02236140:
	mov r7, #0
	add r2, sp, #0x4c
	mov r3, #6
	add r0, sp, #0x1c
	mov r1, r5
	str r7, [sp, #0x34]
	str r3, [sp, #0x38]
	str r7, [sp, #0x3c]
	str r7, [sp, #0x40]
	str r7, [sp, #0x44]
	str r7, [sp, #0x48]
	str r7, [r2]
	str r7, [r2, #4]
	str r7, [r2, #8]
	bl ov45_02237B58
	add r0, sp, #0x1c
	add r1, sp, #0x34
	bl ov45_0223D27C
	cmp r0, #0
	moveq r5, #1
	movne r5, r7
	add r0, sp, #0x1c
	bl ov45_02237BC8
	cmp r5, #0
	beq _022361B4
	add r0, sp, #0x4c
	bl ov45_022379D4
	add sp, sp, #0x58
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_022361B4:
	ldr r0, [sp, #0x40]
	cmp r0, #0
	beq _0223627C
	cmp r0, #1
	bne _022362A0
	ldr r0, _022362B0 ; =_022577C4
	mov r1, r6
	ldr r0, [r0]
	add r0, r0, #0xe8
	bl ov45_0223DEC4
	cmp r0, #0
	ldrne r0, [r0, #0x38]
	cmpne r0, #0
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	bne _02236208
	add r0, sp, #0x4c
	bl ov45_022379D4
	add sp, sp, #0x58
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_02236208:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _02236250
	cmp r0, #1
	bne _022362A0
	ldr r1, _022362B0 ; =_022577C4
	add r0, sp, #0x4c
	ldr r5, [r1]
	bl ov45_02231C78
	ldr r1, [sp, #0x50]
	mov r3, r0
	str r1, [sp]
	ldr r2, [sp, #0x44]
	ldr r5, [r5, #0x18]
	mov r0, r6
	mov r1, r4
	blx r5
	b _022362A0
_02236250:
	ldr r1, _022362B0 ; =_022577C4
	add r0, sp, #0x4c
	ldr r5, [r1]
	bl ov45_02231C78
	mov r3, r0
	ldr r2, [sp, #0x44]
	ldr r5, [r5, #0x14]
	mov r0, r6
	mov r1, r4
	blx r5
	b _022362A0
_0223627C:
	add r0, sp, #0x4c
	bl ov45_02231C78
	ldr r5, [sp, #0x50]
	mov r3, r0
	add r0, sp, #0x34
	mov r1, r6
	mov r2, r4
	str r5, [sp]
	bl ov45_0223454C
_022362A0:
	add r0, sp, #0x4c
	bl ov45_022379D4
	add sp, sp, #0x58
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_022362B0: .word _022577C4
	arm_func_end ov45_02236090

	arm_func_start ov45_022362B4
ov45_022362B4: ; 0x022362B4
	stmdb sp!, {r3, lr}
	ldr r1, _022362CC ; =_022577C4
	ldr r1, [r1]
	ldr r1, [r1, #0x48]
	blx r1
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022362CC: .word _022577C4
	arm_func_end ov45_022362B4

	arm_func_start ov45_022362D0
ov45_022362D0: ; 0x022362D0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	stmia sp, {r2, r3}
	mov lr, r1
	mov r0, #1
	mov ip, #0
	mov r1, r0
	mov r2, r4
	mov r3, lr
	str ip, [sp, #8]
	bl ov45_02233E10
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_022362D0

	arm_func_start ov45_02236308
ov45_02236308: ; 0x02236308
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr lr, [sp, #0x18]
	mov r4, r2
	stmia sp, {r3, lr}
	ldr ip, [sp, #0x1c]
	mov r2, r1
	mov r3, r4
	mov r1, #0
	str ip, [sp, #8]
	bl ov45_02233E10
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_02236308

	arm_func_start ov45_0223633C
ov45_0223633C: ; 0x0223633C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x3c
	ldr r8, [sp, #0x60]
	cmp r0, #0
	mov sl, r1
	mov sb, r2
	addeq sp, sp, #0x3c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	mov r7, #0
	ble _0223644C
	ldr fp, _02236494 ; =ov45_022550B8
	add r6, sp, #0x24
	add r5, sp, #0x18
	add r4, sp, #0x30
_02236378:
	ldr r0, [r8, r7, lsl #2]
	cmp r0, #0x14
	bge _02236440
	ldr r1, [sb, r7, lsl #2]
	mov r0, r6
	bl ov45_02237B58
	mov r0, r5
	mov r1, fp
	bl ov45_02237B58
	mov r0, r4
	mov r1, r6
	mov r2, r5
	mov r3, #0
	bl ov45_0223649C
	mov r0, r5
	bl ov45_02237BC8
	mov r0, r6
	bl ov45_02237BC8
	ldr r0, [sp, #0x34]
	cmp r0, #2
	bhs _022363D8
	mov r0, r4
	bl ov45_02237664
	b _02236440
_022363D8:
	ldr r1, [sp, #0x30]
	ldr r0, [r1, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, r1, #0xd
	ldrne r1, [r1, #0x14]
	add r0, sp, #0xc
	bl ov45_02237B58
	ldr r0, _02236498 ; =_022577C4
	add r1, sp, #0xc
	ldr r0, [r0]
	add r0, r0, #0x58
	bl ov45_02237D48
	add r0, sp, #0xc
	bl ov45_02237BC8
	ldr r1, _02236498 ; =_022577C4
	mov r3, #0
	ldr r2, [r1]
	add r0, sp, #0x30
	str r3, [r2, #0x64]
	ldr r1, [r1]
	mov r2, #6
	str r2, [r1]
	bl ov45_02237664
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02236440:
	add r7, r7, #1
	cmp r7, sl
	blt _02236378
_0223644C:
	add r0, sp, #0
	bl ov45_02233B74
	ldr r0, _02236498 ; =_022577C4
	add r1, sp, #0
	ldr r0, [r0]
	add r0, r0, #0x58
	bl ov45_02237D48
	add r0, sp, #0
	bl ov45_02237BC8
	ldr r0, _02236498 ; =_022577C4
	mov r3, #1
	ldr r2, [r0]
	mov r1, #6
	str r3, [r2, #0x64]
	ldr r0, [r0]
	str r1, [r0]
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02236494: .word ov45_022550B8
_02236498: .word _022577C4
	arm_func_end ov45_0223633C

	arm_func_start ov45_0223649C
ov45_0223649C: ; 0x0223649C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	mov sl, r0
	mov r4, #0
	str r4, [sl]
	str r4, [sl, #4]
	add r0, sp, #0x20
	mov sb, r2
	str r3, [sp]
	str r4, [sl, #8]
	mov r7, #1
	bl ov45_02237A24
	sub r5, sp, #4
	add fp, sp, #0x20
	add r6, sp, #0x14
	mvn r4, #0
	b _022365BC
_022364E0:
	cmp r8, #0
	beq _02236574
	mov r0, r6
	mov r1, fp
	mov r2, #0
	mov r3, r8
	bl ov45_02236680
	mov r1, #0
	add r0, sp, #7
	strb r1, [r0]
	ldr r1, [sl, #4]
	ldr r0, [sl, #8]
	cmp r1, r0
	bhs _02236544
	mov r0, #0xc
	mul r0, r1, r0
	ldr r1, [sl]
	adds r0, r1, r0
	beq _02236534
	mov r1, r6
	bl ov45_02237A24
_02236534:
	ldr r0, [sl, #4]
	add r0, r0, #1
	str r0, [sl, #4]
	b _02236568
_02236544:
	mov r0, #0
	mov r2, #0
	strb r0, [sp, #6]
	mov r2, r2
	strb r2, [r5]
	ldr r2, [r5]
	mov r0, sl
	mov r1, r6
	bl ov45_02237634
_02236568:
	mov r0, r6
	bl ov45_02237BC8
	add r7, r7, #1
_02236574:
	ldr r0, [sb]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldrne r0, [sb, #4]
	bne _02236594
	ldrb r0, [sb]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x19
_02236594:
	add r2, r8, r0
	add r0, sp, #8
	mov r1, fp
	mov r3, r4
	bl ov45_02236680
	mov r0, fp
	add r1, sp, #8
	bl ov45_02237D48
	add r0, sp, #8
	bl ov45_02237BC8
_022365BC:
	ldr r0, [sp]
	cmp r7, r0
	beq _022365E4
	mov r0, fp
	mov r1, sb
	mov r2, #0
	bl ov45_02237EB0
	mov r8, r0
	cmp r8, r4
	bne _022364E0
_022365E4:
	ldr r0, [sp, #0x20]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldrne r0, [sp, #0x24]
	bne _02236604
	ldrb r0, [sp, #0x20]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x19
_02236604:
	cmp r0, #0
	beq _02236670
	mov r2, #0
	strb r2, [sp, #5]
	ldr r1, [sl, #4]
	ldr r0, [sl, #8]
	cmp r1, r0
	bhs _02236650
	mov r0, #0xc
	mul r0, r1, r0
	ldr r1, [sl]
	adds r0, r1, r0
	beq _02236640
	add r1, sp, #0x20
	bl ov45_02237A24
_02236640:
	ldr r0, [sl, #4]
	add r0, r0, #1
	str r0, [sl, #4]
	b _02236670
_02236650:
	strb r2, [sp, #4]
	sub r1, sp, #4
	and r0, r2, #0xff
	strb r0, [r1]
	ldr r2, [r1]
	add r1, sp, #0x20
	mov r0, sl
	bl ov45_02237634
_02236670:
	add r0, sp, #0x20
	bl ov45_02237BC8
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov45_0223649C

	arm_func_start ov45_02236680
ov45_02236680: ; 0x02236680
	stmdb sp!, {r3, lr}
	str r1, [sp]
	bl ov45_02237AA0
	ldmia sp!, {r3, pc}
	arm_func_end ov45_02236680

	arm_func_start ov45_02236690
ov45_02236690: ; 0x02236690
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	cmp r0, #0
	mov sl, r1
	mov sb, r2
	mov r8, r3
	addeq sp, sp, #0x28
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r0, sp, #0x1c
	bl ov45_02237B58
	ldr r1, _022367D0 ; =_022577C4
	add r0, sp, #4
	ldr r5, [r1]
	add r6, sp, #0x1c
	add r1, r5, #0xb8
	bl ov45_022320B4
	add r0, sp, #4
	mov r1, r6
	bl ov45_022340F8
	mov r4, r0
	add r0, sp, #4
	bl ov45_02237BC8
	cmp r4, #0
	ldrne r4, [r5, #0xb8]
	bne _02236724
	add r0, sp, #0x10
	add r1, r5, #0xd0
	bl ov45_022320B4
	add r0, sp, #0x10
	mov r1, r6
	bl ov45_022340F8
	mov r4, r0
	add r0, sp, #0x10
	bl ov45_02237BC8
	cmp r4, #0
	ldrne r4, [r5, #0xd0]
	moveq r4, #5
_02236724:
	add r0, sp, #0x1c
	bl ov45_02237BC8
	cmp r4, #5
	addeq sp, sp, #0x28
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r4, #0
	addne sp, sp, #0x28
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sb, #0
	mov r7, #0
	ble _022367B8
	ldr r5, _022367D4 ; =ov45_02236308
	ldr fp, _022367D0 ; =_022577C4
	mov r6, r7
	mov r4, r7
_02236760:
	ldr r2, [fp]
	ldr r1, [r8, r7, lsl #2]
	ldr r0, [r2, #0x4c]
	cmp r1, r0
	beq _022367AC
	add r0, r2, #0xe8
	bl ov45_0223DD3C
	str r6, [sp]
	ldr r1, [r8, r7, lsl #2]
	ldr r2, _022367D8 ; =ov45_022550C4
	mov r0, sl
	mov r3, r5
	bl ov45_022417B4
	str r4, [sp]
	ldr r1, [r8, r7, lsl #2]
	ldr r2, _022367DC ; =ov45_022550D4
	mov r0, sl
	mov r3, r5
	bl ov45_022417B4
_022367AC:
	add r7, r7, #1
	cmp r7, sb
	blt _02236760
_022367B8:
	ldr r0, _022367D0 ; =_022577C4
	mov r1, #1
	ldr r0, [r0]
	str r1, [r0, #0xc8]
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_022367D0: .word _022577C4
_022367D4: .word ov45_02236308
_022367D8: .word ov45_022550C4
_022367DC: .word ov45_022550D4
	arm_func_end ov45_02236690

	arm_func_start ov45_022367E0
ov45_022367E0: ; 0x022367E0
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r0, [r2, #0x1c]
	cmp r0, #0x14
	bne _02236824
	ldr r0, _02236834 ; =_022577C4
	mov r3, #1
	ldr r2, [r0]
	add r1, sp, #0
	str r3, [r2, #0xcc]
	ldr r0, [r0]
	mov r2, #4
	add r0, r0, #0x134
	str r2, [sp]
	bl ov45_02232D8C
	ldmia sp!, {r3, pc}
_02236824:
	mov r0, r1
	ldr r1, _02236838 ; =ov45_02254D7C
	bl ov45_02241D58
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02236834: .word _022577C4
_02236838: .word ov45_02254D7C
	arm_func_end ov45_022367E0

	arm_func_start ov45_0223683C
ov45_0223683C: ; 0x0223683C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x40
	cmp r0, #0
	addeq sp, sp, #0x40
	ldmeqia sp!, {r4, pc}
	ldr r0, [sp, #0x48]
	mov r2, #0
	add r1, sp, #0x34
	str r2, [sp, #0x34]
	str r2, [sp, #0x38]
	str r2, [sp, #0x3c]
	bl ov45_02233FE4
	cmp r0, #0
	beq _02236880
	ldr r0, [sp, #0x38]
	cmp r0, #8
	beq _022368E4
_02236880:
	ldr r2, _02236944 ; =_022577C4
	add r0, sp, #0x18
	add r1, sp, #0x28
	ldr r4, [r2]
	bl ov00_021ECB94
	add r0, sp, #0x18
	add r1, sp, #0x28
	bl RTC_ConvertDateTimeToSecond
	str r0, [r4, #0x14c]
	str r1, [r4, #0x150]
	add r2, r4, #0x14c
	add r0, sp, #0x10
	ldmia r2, {r2, r3}
	stmia r0, {r2, r3}
	mov r1, #8
	mov r3, r0
	ldr r2, _02236948 ; =ov45_022550E4
	sub r0, r1, #9
	str r1, [sp]
	mov r1, #0
	bl ov45_02233434
	add r0, sp, #0x34
	bl ov45_022379D4
	add sp, sp, #0x40
	ldmia sp!, {r4, pc}
_022368E4:
	add r0, sp, #0x34
	bl ov45_02231C78
	ldr r1, _02236944 ; =_022577C4
	ldr lr, [r0]
	ldr ip, [r0, #4]
	ldr r2, [r1]
	mov r0, #1
	str r0, [r2, #0x148]
	add r3, sp, #8
	str lr, [sp, #8]
	str ip, [sp, #0xc]
	add r0, r2, #0x14c
	ldmia r3, {r2, r3}
	stmia r0, {r2, r3}
	ldr r0, [r1]
	mov r2, #5
	add r1, sp, #4
	add r0, r0, #0x134
	str r2, [sp, #4]
	bl ov45_02232D8C
	add r0, sp, #0x34
	bl ov45_022379D4
	add sp, sp, #0x40
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02236944: .word _022577C4
_02236948: .word ov45_022550E4
	arm_func_end ov45_0223683C

	arm_func_start ov45_0223694C
ov45_0223694C: ; 0x0223694C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	cmp r0, #0
	addeq sp, sp, #0x20
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r2, #0
	ldr r0, [sp, #0x30]
	add r1, sp, #0x14
	str r2, [sp, #0x18]
	str r2, [sp, #0x14]
	str r2, [sp, #0x1c]
	bl ov45_02233FE4
	cmp r0, #0
	ldrne r5, [sp, #0x18]
	cmpne r5, #0
	beq _022369B4
	ldr r1, _02236A3C ; =_022577C4
	add r0, sp, #0x14
	ldr r4, [r1]
	bl ov45_02231C78
	mov r1, r0
	mov r2, r5
	add r0, r4, #0x144
	bl ov45_02238C74
	cmp r0, #0
	bne _02236A04
_022369B4:
	ldr r1, _02236A3C ; =_022577C4
	add r0, sp, #8
	ldr r1, [r1]
	add r1, r1, #0x144
	bl ov45_02238C1C
	add r0, sp, #8
	bl ov45_02231C78
	ldr ip, [sp, #0xc]
	mov r3, r0
	ldr r2, _02236A40 ; =ov45_022550F4
	mvn r0, #0
	mov r1, #0
	str ip, [sp]
	bl ov45_02233434
	add r0, sp, #8
	bl ov45_022379D4
	add r0, sp, #0x14
	bl ov45_022379D4
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
_02236A04:
	ldr r0, _02236A3C ; =_022577C4
	mov r3, #4
	ldr r2, [r0]
	add r1, sp, #4
	str r3, [r2, #0x144]
	ldr r0, [r0]
	mov r2, #6
	add r0, r0, #0x134
	str r2, [sp, #4]
	bl ov45_02232D8C
	add r0, sp, #0x14
	bl ov45_022379D4
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02236A3C: .word _022577C4
_02236A40: .word ov45_022550F4
	arm_func_end ov45_0223694C

	arm_func_start ov45_02236A44
ov45_02236A44: ; 0x02236A44
	bx lr
	arm_func_end ov45_02236A44

	arm_func_start ov45_02236A48
ov45_02236A48: ; 0x02236A48
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x28
	bl ov45_022379D4
	add r0, r4, #0x18
	bl ov45_02237BC8
	add r0, r4, #0xc
	bl ov45_02237BC8
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02236A48

	arm_func_start ov45_02236A70
ov45_02236A70: ; 0x02236A70
	stmdb sp!, {r4, lr}
	ldr r1, _02236AB4 ; =ov45_02254FA0
	mov r4, r0
	str r1, [r4]
	bl ov45_0223DF4C
	add r0, r4, #0x28
	bl ov45_022379D4
	add r0, r4, #4
	bl ov45_02236B88
	cmp r4, #0
	beq _02236AAC
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02236AAC:
	mov r0, r4
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02236AB4: .word ov45_02254FA0
	arm_func_end ov45_02236A70

	arm_func_start ov45_02236AB8
ov45_02236AB8: ; 0x02236AB8
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x18
	bl ov45_022379D4
	cmp r4, #0
	beq _02236AE0
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02236AE0:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02236AB8

	arm_func_start ov45_02236AE8
ov45_02236AE8: ; 0x02236AE8
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r2, #0
	mov r4, r0
	strb r2, [sp]
	str r2, [r4, #4]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02236B78
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _02236B28
	ldr r2, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r0, r2, r0
	bl _u32_div_f
	mov r2, r1
_02236B28:
	ldr r8, [r4, #8]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x14]
	add r6, r8, r2, lsl #2
	add r7, r8, r0, lsl #2
	cmp r7, r6
	add sb, r8, r1, lsl #2
	beq _02236B78
	mov r5, #0
_02236B4C:
	ldr r1, [r7]
	cmp r1, #0
	beq _02236B64
	mov r0, r5
	mov r2, r5
	bl ov00_021EC2EC
_02236B64:
	add r7, r7, #4
	cmp r7, sb
	moveq r7, r8
	cmp r7, r6
	bne _02236B4C
_02236B78:
	add r0, r4, #8
	bl ov45_02238508
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov45_02236AE8

	arm_func_start ov45_02236B88
ov45_02236B88: ; 0x02236B88
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02236BA0
	bl ov45_02238558
_02236BA0:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02236B88

	arm_func_start ov45_02236BA8
ov45_02236BA8: ; 0x02236BA8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	add ip, sp, #4
	mov r5, r2
	mov r6, r1
	mov r4, r0
	add r2, sp, #8
	add r3, sp, #5
	mov r0, r6
	mov r1, r5
	str ip, [sp]
	bl ov45_02238450
	ldr r3, [sp, #8]
	mov r1, r0
	cmp r3, #0
	beq _02236BF8
	ldr r2, [r3, #0xc]
	ldr r0, [r5]
	cmp r2, r0
	bhs _02236C24
_02236BF8:
	str r5, [sp]
	ldrb r2, [sp, #5]
	ldrb r3, [sp, #4]
	mov r0, r6
	bl ov45_02236CE0
	ldr r1, _02236C3C ; =_02254F58
	str r0, [r4]
	ldrb r0, [r1, #2]
	add sp, sp, #0xc
	strb r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, pc}
_02236C24:
	ldr r0, _02236C3C ; =_02254F58
	str r3, [r4]
	ldrb r0, [r0]
	strb r0, [r4, #4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_02236C3C: .word _02254F58
	arm_func_end ov45_02236BA8

	arm_func_start ov45_02236C40
ov45_02236C40: ; 0x02236C40
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [sp, #0x18]
	ldr r1, [r5, #0xc]
	mov r6, r0
	cmp r4, r1
	bne _02236C70
	add r0, sp, #0x18
	bl ov45_02236E58
	ldr r0, [sp, #0x18]
	str r0, [r5, #0xc]
_02236C70:
	ldr r1, [r5, #4]
	mov r0, r4
	bl ov45_022370D0
	str r0, [r6]
	cmp r4, #0
	beq _02236C98
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02236C98:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02236C40

	arm_func_start ov45_02236CB0
ov45_02236CB0: ; 0x02236CB0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #4]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
	bl ov45_02236DEC
	mov r0, #0
	str r0, [r4]
	str r0, [r4, #4]
	add r0, r4, #4
	str r0, [r4, #0xc]
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02236CB0

	arm_func_start ov45_02236CE0
ov45_02236CE0: ; 0x02236CE0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov sb, r0
	ldr r4, [sb]
	mvn r0, #0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	cmp r4, r0
	ldr r5, [sp, #0x30]
	bne _02236D18
	ldr r0, _02236DE8 ; =ov45_02255104
	bl printf
	bl abort
_02236D18:
	mov r1, #0
	mov r0, #0x28
	strb r1, [sp]
	bl ov45_02242394
	mov r4, r0
	add r0, sb, #4
	str r4, [sp, #4]
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r2, r4, #0xc
	beq _02236D80
	ldr r1, [r5]
	add r0, r2, #4
	str r1, [r2]
	add r1, r5, #4
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	add r2, r5, #0xc
	add r1, r0, #8
	ldmia r2, {r2, r3}
	stmia r1, {r2, r3}
	ldr r1, [r5, #0x14]
	str r1, [r0, #0x10]
	ldr r1, [r5, #0x18]
	str r1, [r0, #0x14]
_02236D80:
	mov r0, #0
	str r0, [r4, #4]
	str r0, [sp, #0x10]
	str r0, [r4]
	adds r0, r4, #8
	strne r8, [r0]
	cmp r7, #0
	strne r4, [r8]
	streq r4, [r8, #4]
	ldr r1, [sb]
	mov r0, r4
	add r1, r1, #1
	str r1, [sb]
	ldr r1, [sb, #4]
	bl ov45_02236EC4
	cmp r6, #0
	ldr r1, [sp, #0x10]
	strne r4, [sb, #0xc]
	cmp r1, #0
	beq _02236DDC
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
_02236DDC:
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_02236DE8: .word ov45_02255104
	arm_func_end ov45_02236CE0

	arm_func_start ov45_02236DEC
ov45_02236DEC: ; 0x02236DEC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r1, [r4]
	mov r5, r0
	cmp r1, #0
	beq _02236E08
	bl ov45_02236DEC
_02236E08:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02236E1C
	mov r0, r5
	bl ov45_02236DEC
_02236E1C:
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02236DEC

	arm_func_start ov45_02236E38
ov45_02236E38: ; 0x02236E38
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02236E50
	bl ov45_02236DEC
_02236E50:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02236E38

	arm_func_start ov45_02236E58
ov45_02236E58: ; 0x02236E58
	ldr r2, [r0]
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _02236E8C
	ldr r2, [r1]
	cmp r2, #0
	beq _02236E84
_02236E74:
	mov r1, r2
	ldr r2, [r2]
	cmp r2, #0
	bne _02236E74
_02236E84:
	str r1, [r0]
	bx lr
_02236E8C:
	ldr r1, [r2, #8]
	bic r3, r1, #1
	ldr r1, [r3]
	cmp r2, r1
	beq _02236EBC
_02236EA0:
	mov r2, r3
	str r3, [r0]
	ldr r1, [r2, #8]
	bic r3, r1, #1
	ldr r1, [r3]
	cmp r2, r1
	bne _02236EA0
_02236EBC:
	str r3, [r0]
	bx lr
	arm_func_end ov45_02236E58

	arm_func_start ov45_02236EC4
ov45_02236EC4: ; 0x02236EC4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	ldr r0, [sl, #8]
	mov r8, #0
	mov sb, #1
	orr r0, r0, #1
	str r0, [sl, #8]
	add r7, sp, #0x2c
	mov fp, r8
	mov r4, sb
	mov r5, r8
	mov r6, sb
	b _02237088
_02236EFC:
	ldr r1, [r0, #8]
	bic r2, r1, #1
	ldr r1, [r2]
	cmp r0, r1
	bne _02236FD0
	ldr r1, [r2, #4]
	cmp r1, #0
	beq _02236F6C
	ldr r2, [r1, #8]
	tst r2, #1
	movne r2, sb
	moveq r2, r8
	cmp r2, #1
	bne _02236F6C
	ldr r2, [r0, #8]
	bic r2, r2, #1
	str r2, [r0, #8]
	ldr r0, [r1, #8]
	bic r0, r0, #1
	str r0, [r1, #8]
	ldr r0, [sl, #8]
	bic r0, r0, #1
	ldr r0, [r0, #8]
	bic sl, r0, #1
	ldr r0, [sl, #8]
	orr r0, r0, #1
	str r0, [sl, #8]
	b _02237088
_02236F6C:
	ldr r1, [r0, #4]
	cmp sl, r1
	bne _02236F84
	mov r1, r7
	mov sl, r0
	bl ov45_0223753C
_02236F84:
	ldr r0, [sl, #8]
	mov r1, r7
	bic r2, r0, #1
	ldr r0, [r2, #8]
	bic r0, r0, #1
	str r0, [r2, #8]
	ldr r0, [sl, #8]
	bic r0, r0, #1
	ldr r0, [r0, #8]
	bic r2, r0, #1
	ldr r0, [r2, #8]
	orr r0, r0, #1
	str r0, [r2, #8]
	ldr r0, [sl, #8]
	bic r0, r0, #1
	ldr r0, [r0, #8]
	bic r0, r0, #1
	bl ov45_022375B8
	b _02237088
_02236FD0:
	cmp r1, #0
	beq _02237028
	ldr r2, [r1, #8]
	tst r2, #1
	movne r2, r6
	moveq r2, r5
	cmp r2, #1
	bne _02237028
	ldr r2, [r0, #8]
	bic r2, r2, #1
	str r2, [r0, #8]
	ldr r0, [r1, #8]
	bic r0, r0, #1
	str r0, [r1, #8]
	ldr r0, [sl, #8]
	bic r0, r0, #1
	ldr r0, [r0, #8]
	bic sl, r0, #1
	ldr r0, [sl, #8]
	orr r0, r0, #1
	str r0, [sl, #8]
	b _02237088
_02237028:
	ldr r1, [r0]
	cmp sl, r1
	bne _02237040
	mov r1, r7
	mov sl, r0
	bl ov45_022375B8
_02237040:
	ldr r0, [sl, #8]
	mov r1, r7
	bic r2, r0, #1
	ldr r0, [r2, #8]
	bic r0, r0, #1
	str r0, [r2, #8]
	ldr r0, [sl, #8]
	bic r0, r0, #1
	ldr r0, [r0, #8]
	bic r2, r0, #1
	ldr r0, [r2, #8]
	orr r0, r0, #1
	str r0, [r2, #8]
	ldr r0, [sl, #8]
	bic r0, r0, #1
	ldr r0, [r0, #8]
	bic r0, r0, #1
	bl ov45_0223753C
_02237088:
	ldr r0, [sp, #0x2c]
	cmp sl, r0
	beq _022370B4
	ldr r0, [sl, #8]
	bic r0, r0, #1
	ldr r1, [r0, #8]
	tst r1, #1
	movne r1, r4
	moveq r1, fp
	cmp r1, #1
	beq _02236EFC
_022370B4:
	ldr r1, [sp, #0x2c]
	ldr r0, [r1, #8]
	bic r0, r0, #1
	str r0, [r1, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02236EC4

	arm_func_start ov45_022370D0
ov45_022370D0: ; 0x022370D0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov r4, r0
	add r0, sp, #0
	str r4, [sp]
	bl ov45_02236E58
	ldr r1, [r4]
	mov r0, r4
	cmp r1, #0
	ldrne r1, [r4, #4]
	cmpne r1, #0
	ldrne r0, [sp]
	ldr r1, [r0]
	ldr r2, [r0, #8]
	cmp r1, #0
	ldreq r1, [r0, #4]
	bic sb, r2, #1
	cmp r1, #0
	beq _0223712C
	ldr r2, [r1, #8]
	and r2, r2, #1
	orr r2, sb, r2
	str r2, [r1, #8]
_0223712C:
	ldr r2, [r0, #8]
	bic r3, r2, #1
	ldr r2, [r3]
	cmp r0, r2
	streq r1, [r3]
	strne r1, [r3, #4]
	moveq sl, #1
	ldr r2, [r0, #8]
	movne sl, #0
	tst r2, #1
	movne r2, #1
	moveq r2, #0
	cmp r2, #0
	moveq r2, #1
	movne r2, #0
	cmp r0, r4
	beq _02237218
	ldr r5, [r4, #8]
	ldr r3, [r0, #8]
	bic r5, r5, #1
	and r3, r3, #1
	orr r3, r5, r3
	bic r5, r3, #1
	str r3, [r0, #8]
	ldr r3, [r5]
	cmp r4, r3
	streq r0, [r5]
	strne r0, [r5, #4]
	ldr r5, [r4]
	cmp r5, #0
	str r5, [r0]
	moveq sb, r0
	beq _022371C0
	ldr r3, [r5, #8]
	and r3, r3, #1
	orr r3, r0, r3
	str r3, [r5, #8]
_022371C0:
	ldr r5, [r4, #4]
	cmp r5, #0
	str r5, [r0, #4]
	moveq sb, r0
	beq _022371E4
	ldr r3, [r5, #8]
	and r3, r3, #1
	orr r3, r0, r3
	str r3, [r5, #8]
_022371E4:
	ldr r3, [r4, #8]
	tst r3, #1
	movne r3, #1
	moveq r3, #0
	cmp r3, #0
	ldr r3, [r0, #8]
	orrne r3, r3, #1
	biceq r3, r3, #1
	str r3, [r0, #8]
	ldr r3, [sp, #0x2c]
	cmp r3, r4
	streq r0, [sp, #0x2c]
	b _02237228
_02237218:
	cmp r1, #0
	ldreq r0, [sp, #0x2c]
	cmpeq r4, r0
	moveq r2, #0
_02237228:
	cmp r2, #0
	beq _0223752C
	mov r5, #1
	mov r4, #0
	mov r7, r4
	mov r8, r5
	add r6, sp, #0x2c
	mov fp, r5
	b _022374F0
_0223724C:
	cmp sl, #0
	beq _022373A4
	ldr r0, [sb, #4]
	ldr r1, [r0, #8]
	tst r1, #1
	movne r2, r8
	moveq r2, r7
	cmp r2, #1
	bne _02237294
	bic r1, r1, #1
	str r1, [r0, #8]
	ldr r1, [sb, #8]
	mov r0, sb
	orr r1, r1, #1
	str r1, [sb, #8]
	mov r1, r6
	bl ov45_0223753C
	ldr r0, [sb, #4]
_02237294:
	ldr r2, [r0]
	cmp r2, #0
	beq _022372B8
	ldr r1, [r2, #8]
	tst r1, #1
	movne r1, r5
	moveq r1, r4
	cmp r1, #0
	bne _02237308
_022372B8:
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _022372DC
	ldr r1, [r1, #8]
	tst r1, #1
	movne r1, fp
	moveq r1, #0
	cmp r1, #0
	bne _02237308
_022372DC:
	ldr r2, [r0, #8]
	mov r1, sb
	orr r2, r2, #1
	str r2, [r0, #8]
	ldr r0, [sb, #8]
	bic sb, r0, #1
	ldr r0, [sb]
	cmp r1, r0
	moveq sl, #1
	movne sl, #0
	b _022374F0
_02237308:
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0223732C
	ldr r1, [r1, #8]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	bne _02237350
_0223732C:
	ldr r3, [r2, #8]
	mov r1, r6
	bic r3, r3, #1
	str r3, [r2, #8]
	ldr r2, [r0, #8]
	orr r2, r2, #1
	str r2, [r0, #8]
	bl ov45_022375B8
	ldr r0, [sb, #4]
_02237350:
	ldr r1, [sb, #8]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	ldr r1, [r0, #8]
	orrne r1, r1, #1
	biceq r1, r1, #1
	str r1, [r0, #8]
	ldr r2, [sb, #8]
	mov r1, r6
	bic r2, r2, #1
	str r2, [sb, #8]
	ldr r3, [r0, #4]
	mov r0, sb
	ldr r2, [r3, #8]
	bic r2, r2, #1
	str r2, [r3, #8]
	bl ov45_0223753C
	ldr r1, [sp, #0x2c]
	b _022374F0
_022373A4:
	ldr r0, [sb]
	ldr r1, [r0, #8]
	tst r1, #1
	movne r2, #1
	moveq r2, #0
	cmp r2, #1
	bne _022373E4
	bic r1, r1, #1
	str r1, [r0, #8]
	ldr r1, [sb, #8]
	mov r0, sb
	orr r1, r1, #1
	str r1, [sb, #8]
	mov r1, r6
	bl ov45_022375B8
	ldr r0, [sb]
_022373E4:
	ldr r2, [r0]
	cmp r2, #0
	beq _02237408
	ldr r1, [r2, #8]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	bne _02237458
_02237408:
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _0223742C
	ldr r1, [r1, #8]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	bne _02237458
_0223742C:
	ldr r2, [r0, #8]
	mov r1, sb
	orr r2, r2, #1
	str r2, [r0, #8]
	ldr r0, [sb, #8]
	bic sb, r0, #1
	ldr r0, [sb]
	cmp r1, r0
	moveq sl, #1
	movne sl, #0
	b _022374F0
_02237458:
	cmp r2, #0
	beq _02237478
	ldr r1, [r2, #8]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	bne _022374A0
_02237478:
	ldr r3, [r0, #4]
	mov r1, r6
	ldr r2, [r3, #8]
	bic r2, r2, #1
	str r2, [r3, #8]
	ldr r2, [r0, #8]
	orr r2, r2, #1
	str r2, [r0, #8]
	bl ov45_0223753C
	ldr r0, [sb]
_022374A0:
	ldr r1, [sb, #8]
	tst r1, #1
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	ldr r1, [r0, #8]
	orrne r1, r1, #1
	biceq r1, r1, #1
	str r1, [r0, #8]
	ldr r2, [sb, #8]
	mov r1, r6
	bic r2, r2, #1
	str r2, [sb, #8]
	ldr r3, [r0]
	mov r0, sb
	ldr r2, [r3, #8]
	bic r2, r2, #1
	str r2, [r3, #8]
	bl ov45_022375B8
	ldr r1, [sp, #0x2c]
_022374F0:
	ldr r0, [sp, #0x2c]
	cmp r1, r0
	beq _0223751C
	cmp r1, #0
	beq _0223724C
	ldr r0, [r1, #8]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	beq _0223724C
_0223751C:
	cmp r1, #0
	ldrne r0, [r1, #8]
	bicne r0, r0, #1
	strne r0, [r1, #8]
_0223752C:
	ldr r0, [sp]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_022370D0

	arm_func_start ov45_0223753C
ov45_0223753C: ; 0x0223753C
	ldr r3, [r1]
	ldr r2, [r0, #4]
	cmp r3, r0
	streq r2, [r1]
	ldr r1, [r2]
	str r1, [r0, #4]
	ldr r3, [r2]
	cmp r3, #0
	beq _02237570
	ldr r1, [r3, #8]
	and r1, r1, #1
	orr r1, r0, r1
	str r1, [r3, #8]
_02237570:
	ldr r3, [r0, #8]
	ldr r1, [r2, #8]
	bic r3, r3, #1
	and r1, r1, #1
	orr r1, r3, r1
	str r1, [r2, #8]
	ldr r1, [r0, #8]
	bic r3, r1, #1
	ldr r1, [r3]
	cmp r0, r1
	streq r2, [r3]
	strne r2, [r3, #4]
	str r0, [r2]
	ldr r1, [r0, #8]
	and r1, r1, #1
	orr r1, r2, r1
	str r1, [r0, #8]
	bx lr
	arm_func_end ov45_0223753C

	arm_func_start ov45_022375B8
ov45_022375B8: ; 0x022375B8
	ldr r3, [r1]
	ldr r2, [r0]
	cmp r3, r0
	streq r2, [r1]
	ldr r1, [r2, #4]
	str r1, [r0]
	ldr r3, [r2, #4]
	cmp r3, #0
	beq _022375EC
	ldr r1, [r3, #8]
	and r1, r1, #1
	orr r1, r0, r1
	str r1, [r3, #8]
_022375EC:
	ldr r3, [r0, #8]
	ldr r1, [r2, #8]
	bic r3, r3, #1
	and r1, r1, #1
	orr r1, r3, r1
	str r1, [r2, #8]
	ldr r1, [r0, #8]
	bic r3, r1, #1
	ldr r1, [r3]
	cmp r0, r1
	streq r2, [r3]
	strne r2, [r3, #4]
	str r0, [r2, #4]
	ldr r1, [r0, #8]
	and r1, r1, #1
	orr r1, r2, r1
	str r1, [r0, #8]
	bx lr
	arm_func_end ov45_022375B8

	arm_func_start ov45_02237634
ov45_02237634: ; 0x02237634
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r2, #0
	mov r5, r0
	mov r1, #1
	strb r2, [sp]
	bl ov45_022385A4
	mov r0, r5
	mov r2, r4
	mov r1, #1
	bl ov45_02238674
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02237634

	arm_func_start ov45_02237664
ov45_02237664: ; 0x02237664
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r1, [r4]
	cmp r1, #0
	beq _022376B0
	ldr r1, [r4, #4]
	mov r3, #0
	strb r3, [sp]
	sub r2, sp, #4
	strb r3, [r2]
	ldr r2, [r2]
	bl ov45_022387E4
	ldr r1, [r4]
	cmp r1, #0
	beq _022376B0
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
_022376B0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_02237664

	arm_func_start ov45_022376BC
ov45_022376BC: ; 0x022376BC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _02237700
	ldr r2, [r4, #4]
	mov r0, #0
	strb r0, [sp]
	ldr r1, [r4, #4]
	sub r1, r1, r2
	str r1, [r4, #4]
	ldr r1, [r4]
	cmp r1, #0
	beq _02237700
	mov r2, r0
	bl ov00_021EC2EC
_02237700:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_022376BC

	arm_func_start ov45_0223770C
ov45_0223770C: ; 0x0223770C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _02237750
	ldr r2, [r4, #4]
	mov r0, #0
	strb r0, [sp]
	ldr r1, [r4, #4]
	sub r1, r1, r2
	str r1, [r4, #4]
	ldr r1, [r4]
	cmp r1, #0
	beq _02237750
	mov r2, r0
	bl ov00_021EC2EC
_02237750:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_0223770C

	arm_func_start ov45_0223775C
ov45_0223775C: ; 0x0223775C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _022377A0
	ldr r2, [r4, #4]
	mov r0, #0
	strb r0, [sp]
	ldr r1, [r4, #4]
	sub r1, r1, r2
	str r1, [r4, #4]
	ldr r1, [r4]
	cmp r1, #0
	beq _022377A0
	mov r2, r0
	bl ov00_021EC2EC
_022377A0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_0223775C

	arm_func_start ov45_022377AC
ov45_022377AC: ; 0x022377AC
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r1
	mov r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r3, #0
	strb r3, [sp, #1]
	sub r2, sp, #4
	strb r3, [r2]
	ldr r2, [r2]
	bl ov45_02237800
	mov r1, #0
	strb r1, [sp]
	ldr r3, [r4]
	ldr r0, [r4, #4]
	mov r2, r5
	add r0, r3, r0
	bl memset
	ldr r0, [r4, #4]
	add r0, r0, r5
	str r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_022377AC

	arm_func_start ov45_02237800
ov45_02237800: ; 0x02237800
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl ov45_02242394
	str r0, [r5]
	str r4, [r5, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02237800

	arm_func_start ov45_02237820
ov45_02237820: ; 0x02237820
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r3, [r5, #4]
	mov r0, #0
	strb r0, [sp, #2]
	ldr r1, [r5, #4]
	mov r4, r2
	sub r1, r1, r3
	str r1, [r5, #4]
	ldr r1, [r5]
	cmp r1, #0
	beq _02237868
	beq _0223785C
	mov r2, r0
	bl ov00_021EC2EC
_0223785C:
	mov r0, #0
	str r0, [r5]
	str r0, [r5, #8]
_02237868:
	mov r3, #0
	strb r3, [sp]
	sub r0, sp, #4
	strb r3, [r0]
	ldr r2, [r0]
	mov r0, r5
	mov r1, r4
	strb r3, [sp, #1]
	bl ov45_02237800
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02237820

	arm_func_start ov45_02237890
ov45_02237890: ; 0x02237890
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r4, [r0, #8]
	mvn r0, #0
	ldr r1, [sp, #0x14]
	sub r0, r0, r4
	cmp r1, r0
	bls _022378B8
	bl _ZNSt15__vector_commonILb1EE18throw_length_errorEv
_022378B8:
	ldr r0, _02237954 ; =0x55555555
	cmp r4, r0
	bhs _02237904
	add r1, r4, #1
	ldr r0, _02237958 ; =0xCCCCCCCD
	add r1, r1, r1, lsl #1
	umull r0, r2, r1, r0
	mov r2, r2, lsr #2
	ldr r0, [sp, #0x14]
	str r2, [sp, #4]
	cmp r0, r2
	addhi r0, sp, #0x14
	addls r0, sp, #4
	ldr r0, [r0]
	add sp, sp, #8
	add r0, r4, r0
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_02237904:
	cmp r4, r0, lsl #1
	bhs _02237940
	ldr r0, [sp, #0x14]
	add r1, r4, #1
	mov r2, r1, lsr #1
	cmp r0, r1, lsr #1
	addhi r0, sp, #0x14
	str r2, [sp]
	addls r0, sp, #0
	ldr r0, [r0]
	add sp, sp, #8
	add r0, r4, r0
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_02237940:
	mvn r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_02237954: .word 0x55555555
_02237958: .word 0xCCCCCCCD
	arm_func_end ov45_02237890

	arm_func_start ov45_0223795C
ov45_0223795C: ; 0x0223795C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r3, [r5, #8]
	mov r4, r1
	cmp r4, r3
	ldrls r1, [r5, #4]
	subls r0, r3, r4
	cmpls r1, r0
	bls _022379A0
	ldr r0, [r5, #4]
	mov r2, #0
	add r1, r0, r4
	mov r0, r5
	sub r1, r1, r3
	strb r2, [sp]
	bl ov45_02237890
	b _022379C4
_022379A0:
	ldr r0, [r5]
	mov r2, r4
	add r0, r0, r1
	mov r1, #0
	bl memset
	ldr r0, [r5, #4]
	add r0, r0, r4
	str r0, [r5, #4]
	ldmia sp!, {r3, r4, r5, pc}
_022379C4:
	mov r0, r5
	mov r1, r4
	bl ov45_02238820
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0223795C

	arm_func_start ov45_022379D4
ov45_022379D4: ; 0x022379D4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _02237A18
	ldr r2, [r4, #4]
	mov r0, #0
	strb r0, [sp]
	ldr r1, [r4, #4]
	sub r1, r1, r2
	str r1, [r4, #4]
	ldr r1, [r4]
	cmp r1, #0
	beq _02237A18
	mov r2, r0
	bl ov00_021EC2EC
_02237A18:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_022379D4

	arm_func_start ov45_02237A24
ov45_02237A24: ; 0x02237A24
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r1
	ldr r1, [r5]
	mov r4, r0
	mov r0, r1, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldmeqia r5, {r0, r1, r2}
	stmeqia r4, {r0, r1, r2}
	beq _02237A94
	mov r1, #0
	mov r0, r1
_02237A54:
	str r0, [r4, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #3
	blo _02237A54
	ldr r1, [r5, #4]
	mov r0, r4
	bl ov45_02237BFC
	ldmib r5, {r0, r3}
	mov r1, #0
	add r0, r3, r0
	str r0, [sp]
	ldrb ip, [sp, #8]
	mov r0, r4
	mov r2, r1
	strb ip, [sp, #4]
	bl ov45_02238104
_02237A94:
	mov r0, r4
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	arm_func_end ov45_02237A24

	arm_func_start ov45_02237AA0
ov45_02237AA0: ; 0x02237AA0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r5, r1
	mov r1, #0
	mov r6, r0
	mov r4, r2
	mov r0, r1
_02237AC0:
	str r0, [r6, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #3
	blo _02237AC0
	ldr r0, [r5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldrne r1, [r5, #4]
	bne _02237AF0
	ldrb r0, [r5]
	mov r0, r0, lsl #0x18
	mov r1, r0, lsr #0x19
_02237AF0:
	cmp r4, r1
	bhi _02237B18
	ldr r0, [sp, #0x2c]
	sub r1, r1, r4
	cmp r1, r0
	addlo r0, sp, #8
	addhs r0, sp, #0x2c
	str r1, [sp, #8]
	ldr r1, [r0]
	b _02237B1C
_02237B18:
	mov r1, #0
_02237B1C:
	mov r0, r6
	bl ov45_02237BFC
	str r4, [sp]
	ldr r4, [sp, #0x2c]
	mov r1, #0
	mov r0, r6
	mov r2, r1
	mov r3, r5
	str r4, [sp, #4]
	bl ov45_02237E04
	mov r0, r6
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02237AA0

	arm_func_start ov45_02237B58
ov45_02237B58: ; 0x02237B58
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov r5, r1
	mov r1, #0
	mov r6, r0
	mov r0, r1
_02237B70:
	str r0, [r6, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #3
	blo _02237B70
	mov r0, r5
	bl strlen
	mov r4, r0
	mov r0, r6
	mov r1, r4
	bl ov45_02237BFC
	add r0, r5, r4
	mov r1, #0
	ldrb r3, [sp, #8]
	str r0, [sp]
	mov r0, r6
	mov r2, r1
	strb r3, [sp, #4]
	mov r3, r5
	bl ov45_02238104
	mov r0, r6
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov45_02237B58

	arm_func_start ov45_02237BC8
ov45_02237BC8: ; 0x02237BC8
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldrne r1, [r4, #8]
	cmpne r1, #0
	beq _02237BF4
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
_02237BF4:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02237BC8

	arm_func_start ov45_02237BFC
ov45_02237BFC: ; 0x02237BFC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r1
	mvn r1, #0x80000001
	mov sb, r0
	cmp r8, r1
	bls _02237C20
	ldr r0, _02237D44 ; =ov45_02255120
	bl printf
	bl abort
_02237C20:
	ldr r0, [sb]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	movne r7, #1
	moveq r7, #0
	cmp r7, #0
	ldmneia sb, {r0, r4}
	movne r1, r0, lsr #1
	bne _02237C54
	ldrb r0, [sb]
	mov r1, #0xb
	mov r0, r0, lsl #0x18
	mov r4, r0, lsr #0x19
_02237C54:
	cmp r8, r4
	movlo r8, r4
	add r0, r8, #1
	cmp r0, #0xb
	movls r8, #0xb
	addhi r0, r8, #0x10
	bichi r8, r0, #0xf
	cmp r8, r1
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp r8, #0xb
	bne _02237C90
	add r5, sb, #1
	ldr sl, [sb, #8]
	mov r6, #0
	b _02237CC4
_02237C90:
	cmp r8, r1
	mov r0, r8
	bls _02237CA8
	bl ov45_02242394
	mov r5, r0
	b _02237CB4
_02237CA8:
	bl ov45_02242394
	movs r5, r0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02237CB4:
	cmp r7, #0
	ldrne sl, [sb, #8]
	mov r6, #1
	addeq sl, sb, #1
_02237CC4:
	mov r0, r5
	mov r1, sl
	mov r2, r4
	bl memmove
	mov r0, #0
	cmp r7, #0
	strb r0, [r5, r4]
	cmpne sl, #0
	beq _02237CF4
	mov r1, sl
	mov r2, r0
	bl ov00_021EC2EC
_02237CF4:
	ldr r1, [sb]
	and r0, r6, #1
	bic r1, r1, #1
	orr r0, r1, r0
	str r0, [sb]
	cmp r6, #0
	bne _02237D2C
	ldrb r1, [sb]
	and r0, r4, #0xff
	mov r0, r0, lsl #0x19
	bic r1, r1, #0xfe
	orr r0, r1, r0, lsr #24
	strb r0, [sb]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02237D2C:
	stmib sb, {r4, r5}
	ldr r0, [sb]
	and r0, r0, #1
	orr r0, r0, r8, lsl #1
	str r0, [sb]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_02237D44: .word ov45_02255120
	arm_func_end ov45_02237BFC

	arm_func_start ov45_02237D48
ov45_02237D48: ; 0x02237D48
	stmdb sp!, {r3, lr}
	mov ip, r0
	ldr r0, [ip]
	mov r3, r1
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	movne r1, #1
	moveq r1, #0
	cmp r1, #0
	bne _02237D90
	ldr r0, [r3]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	bne _02237D90
	ldmia r3, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	mov r0, ip
	ldmia sp!, {r3, pc}
_02237D90:
	cmp r1, #0
	ldreqb r0, [ip]
	ldrne r2, [ip, #4]
	mov r1, #0
	moveq r0, r0, lsl #0x18
	moveq r2, r0, lsr #0x19
	mov r0, ip
	bl ov45_02237DB4
	ldmia sp!, {r3, pc}
	arm_func_end ov45_02237D48

	arm_func_start ov45_02237DB4
ov45_02237DB4: ; 0x02237DB4
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, [r3]
	mov ip, ip, lsl #0x1f
	movs ip, ip, lsr #0x1f
	ldrne lr, [r3, #8]
	ldrne r3, [r3, #4]
	bne _02237DE4
	ldrb ip, [r3]
	add lr, r3, #1
	mov r3, ip, lsl #0x18
	mov r3, r3, lsr #0x19
_02237DE4:
	ldrb ip, [sp, #8]
	add r3, lr, r3
	str r3, [sp]
	mov r3, lr
	strb ip, [sp, #4]
	bl ov45_02238104
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ov45_02237DB4

	arm_func_start ov45_02237E04
ov45_02237E04: ; 0x02237E04
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldr r4, [r3]
	mov r8, r0
	mov r0, r4, lsl #0x1f
	movs r0, r0, lsr #0x1f
	mov r7, r1
	mov r6, r2
	ldrne r4, [r3, #8]
	ldrne r5, [r3, #4]
	bne _02237E40
	ldrb r0, [r3]
	add r4, r3, #1
	mov r0, r0, lsl #0x18
	mov r5, r0, lsr #0x19
_02237E40:
	ldr r0, [sp, #0x28]
	cmp r0, r5
	bls _02237E58
	ldr r0, _02237EAC ; =ov45_02255144
	bl printf
	bl abort
_02237E58:
	ldr r2, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	sub r1, r5, r2
	cmp r1, r0
	addlo r0, sp, #0xc
	str r1, [sp, #0xc]
	add r4, r4, r2
	addhs r0, sp, #0x2c
	ldr r0, [r0]
	ldrb r5, [sp, #8]
	str r0, [sp, #0x2c]
	add r0, r4, r0
	str r0, [sp]
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, r4
	strb r5, [sp, #4]
	bl ov45_02238104
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02237EAC: .word ov45_02255144
	arm_func_end ov45_02237E04

	arm_func_start ov45_02237EB0
ov45_02237EB0: ; 0x02237EB0
	stmdb sp!, {r3, lr}
	ldr r3, [r1]
	mov r3, r3, lsl #0x1f
	movs r3, r3, lsr #0x1f
	ldmneib r1, {r3, ip}
	bne _02237ED8
	ldrb r3, [r1]
	add ip, r1, #1
	mov r1, r3, lsl #0x18
	mov r3, r1, lsr #0x19
_02237ED8:
	mov r1, ip
	bl ov45_02237EE4
	ldmia sp!, {r3, pc}
	arm_func_end ov45_02237EB0

	arm_func_start ov45_02237EE4
ov45_02237EE4: ; 0x02237EE4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, [r0]
	mov ip, ip, lsl #0x1f
	movs ip, ip, lsr #0x1f
	ldrne lr, [r0, #8]
	ldrne r0, [r0, #4]
	bne _02237F10
	ldrb ip, [r0]
	add lr, r0, #1
	mov r0, ip, lsl #0x18
	mov r0, r0, lsr #0x19
_02237F10:
	cmp r2, r0
	bhi _02237F74
	sub ip, r0, r2
	cmp ip, r3
	add r4, r1, r3
	add r5, lr, r2
	blo _02237F74
_02237F2C:
	mov r6, r5
	mov r7, r1
	cmp r1, r4
	bhs _02237F5C
_02237F3C:
	ldrsb r2, [r7]
	ldrsb r0, [r6]
	cmp r2, r0
	bne _02237F64
	add r7, r7, #1
	cmp r7, r4
	add r6, r6, #1
	blo _02237F3C
_02237F5C:
	sub r0, r5, lr
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02237F64:
	sub ip, ip, #1
	cmp ip, r3
	add r5, r5, #1
	bhs _02237F2C
_02237F74:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_02237EE4

	arm_func_start ov45_02237F7C
ov45_02237F7C: ; 0x02237F7C
	stmdb sp!, {r3, lr}
	ldr r2, [r1]
	mov r2, r2, lsl #0x1f
	movs r2, r2, lsr #0x1f
	ldrne r3, [r1, #8]
	ldrne ip, [r1, #4]
	bne _02237FA8
	ldrb r2, [r1]
	add r3, r1, #1
	mov r1, r2, lsl #0x18
	mov ip, r1, lsr #0x19
_02237FA8:
	ldr r1, [r0]
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	ldrne r2, [r0, #4]
	bne _02237FC8
	ldrb r1, [r0]
	mov r1, r1, lsl #0x18
	mov r2, r1, lsr #0x19
_02237FC8:
	mov r1, #0
	str ip, [sp]
	bl ov45_02238024
	ldmia sp!, {r3, pc}
	arm_func_end ov45_02237F7C

	arm_func_start ov45_02237FD8
ov45_02237FD8: ; 0x02237FD8
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl strlen
	ldr r1, [r5]
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	ldrne r2, [r5, #4]
	bne _0223800C
	ldrb r1, [r5]
	mov r1, r1, lsl #0x18
	mov r2, r1, lsr #0x19
_0223800C:
	str r0, [sp]
	mov r0, r5
	mov r3, r4
	mov r1, #0
	bl ov45_02238024
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02237FD8

	arm_func_start ov45_02238024
ov45_02238024: ; 0x02238024
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	ldr r2, [r0]
	mov r6, r1
	mov r1, r2, lsl #0x1f
	movs r1, r1, lsr #0x1f
	mov r5, r3
	ldrne r4, [r0, #8]
	ldrne r7, [r0, #4]
	bne _02238060
	ldrb r1, [r0]
	add r4, r0, #1
	mov r0, r1, lsl #0x18
	mov r7, r0, lsr #0x19
_02238060:
	cmp r6, r7
	bls _02238074
	ldr r0, _02238100 ; =ov45_02255160
	bl printf
	bl abort
_02238074:
	ldr r0, [sp, #0x28]
	sub r1, r7, r6
	cmp r0, r1
	addlo r0, sp, #0x28
	addhs r0, sp, #0
	str r1, [sp]
	ldr r1, [r0]
	ldr r0, [sp, #0x30]
	str r1, [sp, #4]
	cmp r0, r1
	addlo r0, sp, #0x30
	addhs r0, sp, #4
	ldr r2, [r0]
	mov r1, r5
	add r0, r4, r6
	bl memcmp
	cmp r0, #0
	addne sp, sp, #8
	ldmneia sp!, {r3, r4, r5, r6, r7, lr}
	addne sp, sp, #0x10
	bxne lr
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #4]
	cmp r0, r1
	addlo sp, sp, #8
	mvnlo r0, #0
	ldmloia sp!, {r3, r4, r5, r6, r7, lr}
	addlo sp, sp, #0x10
	bxlo lr
	movne r0, #1
	moveq r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_02238100: .word ov45_02255160
	arm_func_end ov45_02238024

	arm_func_start ov45_02238104
ov45_02238104: ; 0x02238104
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	mov r6, r0
	ldr r0, [r6]
	mov r5, r1
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	movne r0, #1
	strne r0, [sp]
	moveq r0, #0
	streq r0, [sp]
	ldr r0, [sp]
	mov fp, r3
	ldr r4, [sp, #0x60]
	cmp r0, #0
	bne _02238164
	ldrb r1, [r6]
	mov r0, #0xb
	str r0, [sp, #0x14]
	mov r0, r1, lsl #0x18
	add r7, r6, #1
	mov r8, r0, lsr #0x19
	b _02238174
_02238164:
	ldmia r6, {r0, r8}
	mov r0, r0, lsr #1
	ldr r7, [r6, #8]
	str r0, [sp, #0x14]
_02238174:
	cmp r5, r8
	bls _02238188
	ldr r0, _022383D4 ; =ov45_02255144
	bl printf
	bl abort
_02238188:
	ldr r0, [sp, #0x58]
	sub r1, r8, r5
	cmp r1, r0
	addlo r0, sp, #0x18
	str r1, [sp, #0x18]
	addhs r0, sp, #0x58
	ldr r0, [r0]
	sub sb, r4, fp
	mvn r1, #0x80000001
	cmp sb, r1
	str r0, [sp, #0x10]
	subls sl, r8, r0
	subls r0, r1, sb
	cmpls sl, r0
	bls _022381D0
	ldr r0, _022383D8 ; =ov45_0225517C
	bl printf
	bl abort
_022381D0:
	ldr r0, [sp, #0x10]
	add sl, sb, sl
	add r1, r5, r0
	ldr r0, [sp, #0x14]
	cmp sl, r0
	sub r0, r8, r1
	str r0, [sp, #0xc]
	blo _022382E4
	ldr r0, [sp, #0x14]
	add r1, sl, #1
	add r0, r0, #0xf
	bic r8, r0, #0xf
	cmp r8, r1
	bhs _0223821C
_02238208:
	mov r0, r8, lsl #1
	add r0, r0, #0xf
	bic r8, r0, #0xf
	cmp r8, r1
	blo _02238208
_0223821C:
	mov r0, r8
	bl ov45_02242394
	str r0, [sp, #8]
	cmp r5, #0
	beq _0223823C
	mov r1, r7
	mov r2, r5
	bl memcpy
_0223823C:
	ldr r0, [sp, #8]
	sub r2, r4, fp
	add r0, r0, r5
	mov r1, fp
	str r0, [sp, #4]
	bl memmove
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0223827C
	mov r2, r0
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x10]
	add r3, r7, r5
	add r0, r0, sb
	add r1, r3, r1
	bl memcpy
_0223827C:
	ldr r1, _022383DC ; =_02254F58
	ldr r0, [sp]
	ldrsb r1, [r1, #3]
	cmp r0, #0
	ldr r0, [sp, #8]
	strb r1, [r0, sl]
	beq _022382B4
	cmp r7, #0
	beq _022382C4
	mov r0, #0
	mov r1, r7
	mov r2, r0
	bl ov00_021EC2EC
	b _022382C4
_022382B4:
	ldr r0, [r6]
	bic r0, r0, #1
	orr r0, r0, #1
	str r0, [r6]
_022382C4:
	ldr r0, [sp, #8]
	str r0, [r6, #8]
	str sl, [r6, #4]
	ldr r0, [r6]
	and r0, r0, #1
	orr r0, r0, r8, lsl #1
	str r0, [r6]
	b _022383C0
_022382E4:
	mov r1, #0
	add r0, sp, #0x1c
	mov r3, r1
_022382F0:
	str r3, [r0, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #3
	blo _022382F0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02238350
	add r0, r7, r5
	add r0, r0, sb
	cmp r0, r4
	bhs _02238350
	add r0, r7, r8
	cmp r4, r0
	bhi _02238350
	add r0, sp, #0x1c
	mov r1, fp
	mov r2, r4
	bl ov45_022384BC
	ldr r0, [sp, #0x1c]
	add r1, sp, #0x1c
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq fp, r1, #1
	ldrne fp, [r1, #8]
_02238350:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02238374
	ldr r1, [sp, #0x10]
	add r3, r7, r5
	mov r2, r0
	add r0, r3, sb
	add r1, r3, r1
	bl memmove
_02238374:
	mov r1, fp
	mov r2, sb
	add r0, r7, r5
	bl memmove
	ldr r0, [sp]
	ldr r1, _022383DC ; =_02254F58
	cmp r0, #0
	ldrsb r0, [r1, #1]
	strb r0, [r7, sl]
	strne sl, [r6, #4]
	bne _022383B8
	ldrb r1, [r6]
	and r0, sl, #0xff
	mov r0, r0, lsl #0x19
	bic r1, r1, #0xfe
	orr r0, r1, r0, lsr #24
	strb r0, [r6]
_022383B8:
	add r0, sp, #0x1c
	bl ov45_02237BC8
_022383C0:
	mov r0, r6
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_022383D4: .word ov45_02255144
_022383D8: .word ov45_0225517C
_022383DC: .word _02254F58
	arm_func_end ov45_02238104

	arm_func_start ov45_022383E0
ov45_022383E0: ; 0x022383E0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r5, r1
	mov r4, r2
	subs r1, r4, r5
	mov r6, r0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	mov r3, #0
	strb r3, [sp, #1]
	sub r2, sp, #4
	strb r3, [r2]
	ldr r2, [r2]
	bl ov45_02237800
	mov r0, #0
	strb r0, [sp]
	ldr r2, [r6]
	ldr r0, [r6, #4]
	mov r1, r5
	add r0, r2, r0
	sub r2, r4, r5
	bl memmove
	ldr r1, [r6, #4]
	sub r0, r4, r5
	add r0, r1, r0
	str r0, [r6, #4]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov45_022383E0

	arm_func_start ov45_02238450
ov45_02238450: ; 0x02238450
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	str r4, [r2]
	ldr r6, [r0, #4]
	mov r4, #1
	ldr r7, [sp, #0x18]
	strb r4, [r3]
	strb r4, [r7]
	cmp r6, #0
	add r0, r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov ip, #0
	mov lr, r4
_02238484:
	ldr r5, [r1]
	ldr r4, [r6, #0xc]
	mov r0, r6
	cmp r5, r4
	ldrlo r6, [r6]
	strlob lr, [r3]
	blo _022384B0
	str r6, [r2]
	ldr r6, [r6, #4]
	strb ip, [r3]
	strb ip, [r7]
_022384B0:
	cmp r6, #0
	bne _02238484
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_02238450

	arm_func_start ov45_022384BC
ov45_022384BC: ; 0x022384BC
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr ip, [r0]
	mov r3, r1
	mov r1, ip, lsl #0x1f
	movs r1, r1, lsr #0x1f
	ldrne r1, [r0, #4]
	bne _022384E8
	ldrb r1, [r0]
	mov r1, r1, lsl #0x18
	mov r1, r1, lsr #0x19
_022384E8:
	ldrb ip, [sp, #8]
	str r2, [sp]
	mov r2, r1
	mov r1, #0
	strb ip, [sp, #4]
	bl ov45_02238104
	add sp, sp, #0xc
	ldmia sp!, {pc}
	arm_func_end ov45_022384BC

	arm_func_start ov45_02238508
ov45_02238508: ; 0x02238508
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _0223854C
	ldr r2, [r4, #8]
	mov r0, #0
	strb r0, [sp]
	ldr r1, [r4, #8]
	sub r1, r1, r2
	str r1, [r4, #8]
	ldr r1, [r4]
	cmp r1, #0
	beq _0223854C
	mov r2, r0
	bl ov00_021EC2EC
_0223854C:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_02238508

	arm_func_start ov45_02238558
ov45_02238558: ; 0x02238558
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r1, [r4]
	mov r5, r0
	cmp r1, #0
	beq _02238574
	bl ov45_02238558
_02238574:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02238588
	mov r0, r5
	bl ov45_02238558
_02238588:
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02238558

	arm_func_start ov45_022385A4
ov45_022385A4: ; 0x022385A4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r4, [r0, #8]
	ldr r0, _02238668 ; =0x15555555
	ldr r1, [sp, #0x14]
	sub r0, r0, r4
	cmp r1, r0
	bls _022385CC
	bl _ZNSt15__vector_commonILb1EE18throw_length_errorEv
_022385CC:
	ldr r0, _0223866C ; =0x071C71C7
	cmp r4, r0
	bhs _02238618
	add r1, r4, #1
	ldr r0, _02238670 ; =0xCCCCCCCD
	add r1, r1, r1, lsl #1
	umull r0, r2, r1, r0
	mov r2, r2, lsr #2
	ldr r0, [sp, #0x14]
	str r2, [sp, #4]
	cmp r0, r2
	addhi r0, sp, #0x14
	addls r0, sp, #4
	ldr r0, [r0]
	add sp, sp, #8
	add r0, r4, r0
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_02238618:
	cmp r4, r0, lsl #1
	bhs _02238654
	ldr r0, [sp, #0x14]
	add r1, r4, #1
	mov r2, r1, lsr #1
	cmp r0, r1, lsr #1
	addhi r0, sp, #0x14
	str r2, [sp]
	addls r0, sp, #0
	ldr r0, [r0]
	add sp, sp, #8
	add r0, r4, r0
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_02238654:
	ldr r0, _02238668 ; =0x15555555
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_02238668: .word 0x15555555
_0223866C: .word 0x071C71C7
_02238670: .word 0xCCCCCCCD
	arm_func_end ov45_022385A4

	arm_func_start ov45_02238674
ov45_02238674: ; 0x02238674
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x1c
	mov r4, #0
	mov r7, r0
	add r3, r7, #8
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x18]
	str r3, [sp, #0x14]
	mov r6, r1
	ldr r3, [r7, #4]
	ldr r1, [r7, #8]
	add r3, r3, r6
	sub r1, r3, r1
	mov r5, r2
	bl ov45_022385A4
	mov r3, r4
	mov r1, r0
	strb r3, [sp, #3]
	sub r0, sp, #4
	strb r3, [r0]
	ldr r2, [r0]
	add r0, sp, #8
	strb r3, [sp, #4]
	bl ov45_02238A3C
	ldr r4, [r7, #4]
	mov r3, #0
	ldr r1, [sp, #8]
	mov r0, #0xc
	mla r2, r4, r0, r1
	ldr r1, [sp, #0xc]
	str r4, [sp, #0x18]
	mla r4, r1, r0, r2
	strb r3, [sp, #2]
	cmp r6, #0
	beq _02238734
_02238708:
	cmp r4, #0
	beq _0223871C
	mov r0, r4
	mov r1, r5
	bl ov45_02237A24
_0223871C:
	ldr r0, [sp, #0xc]
	subs r6, r6, #1
	add r0, r0, #1
	str r0, [sp, #0xc]
	add r4, r4, #0xc
	bne _02238708
_02238734:
	ldr r6, [r7]
	ldr r1, [r7, #4]
	mov r0, #0xc
	mla r5, r1, r0, r6
	mov r3, #0
	ldr r2, [sp, #8]
	ldr r1, [sp, #0x18]
	strb r3, [sp, #1]
	mla r4, r1, r0, r2
	cmp r5, r6
	bls _02238798
_02238760:
	sub r5, r5, #0xc
	subs r4, r4, #0xc
	beq _02238778
	mov r0, r4
	mov r1, r5
	bl ov45_02237A24
_02238778:
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0xc]
	sub r1, r1, #1
	add r0, r0, #1
	str r1, [sp, #0x18]
	str r0, [sp, #0xc]
	cmp r5, r6
	bhi _02238760
_02238798:
	mov r0, #0
	strb r0, [sp]
	add r3, sp, #0x10
	ldr r2, [r7, #8]
	ldr r1, [r3]
	add r0, sp, #8
	str r1, [r7, #8]
	str r2, [r3]
	ldr r2, [r7]
	ldr r1, [sp, #8]
	str r1, [r7]
	str r2, [sp, #8]
	ldr r2, [r7, #4]
	ldr r1, [sp, #0xc]
	str r1, [r7, #4]
	str r2, [sp, #0xc]
	bl ov45_0223895C
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ov45_02238674

	arm_func_start ov45_022387E4
ov45_022387E4: ; 0x022387E4
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [r0]
	ldr r3, [r0, #4]
	mov r2, #0xc
	mla r4, r3, r2, ip
	movs r5, r1
	sub r1, r3, r5
	str r1, [r0, #4]
	ldmeqia sp!, {r3, r4, r5, pc}
_02238808:
	sub r4, r4, #0xc
	mov r0, r4
	bl ov45_02237BC8
	subs r5, r5, #1
	bne _02238808
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_022387E4

	arm_func_start ov45_02238820
ov45_02238820: ; 0x02238820
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x1c
	mov r3, #0
	mov r6, r0
	add r2, r6, #8
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	str r3, [sp, #0x18]
	str r2, [sp, #0x14]
	mov r4, r1
	ldr r2, [r6, #4]
	ldr r1, [r6, #8]
	add r2, r2, r4
	sub r1, r2, r1
	bl ov45_02237890
	mov r3, #0
	mov r1, r0
	strb r3, [sp, #3]
	sub r0, sp, #4
	strb r3, [r0]
	ldr r2, [r0]
	add r0, sp, #8
	strb r3, [sp, #4]
	bl ov45_022389CC
	ldr r5, [r6, #4]
	ldr r2, [sp, #8]
	mov r1, #0
	add r3, r2, r5
	ldr r0, [sp, #0xc]
	mov r2, r4
	add r0, r3, r0
	str r5, [sp, #0x18]
	strb r1, [sp, #2]
	bl memset
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x18]
	add r1, r1, r4
	str r1, [sp, #0xc]
	ldr r5, [r6]
	ldr r2, [r6, #4]
	mov r1, #0
	strb r1, [sp, #1]
	add r1, r5, r2
	sub r4, r1, r5
	sub r2, r0, r4
	ldr r0, [sp, #8]
	str r2, [sp, #0x18]
	add r0, r0, r2
	mov r1, r5
	mov r2, r4
	bl memcpy
	mov r0, r5
	mov r1, #0
	mov r2, r4
	bl memset
	ldr r1, [sp, #0xc]
	mov r0, #0
	add r1, r1, r4
	str r1, [sp, #0xc]
	strb r0, [sp]
	str r0, [r6, #4]
	add r3, sp, #0x10
	ldr r2, [r6, #8]
	ldr r1, [r3]
	add r0, sp, #8
	str r1, [r6, #8]
	str r2, [r3]
	ldr r2, [r6]
	ldr r1, [sp, #8]
	str r1, [r6]
	str r2, [sp, #8]
	ldr r2, [r6, #4]
	ldr r1, [sp, #0xc]
	str r1, [r6, #4]
	str r2, [sp, #0xc]
	bl ov45_022389B0
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov45_02238820

	arm_func_start ov45_0223895C
ov45_0223895C: ; 0x0223895C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r0
	ldr r2, [r4]
	ldr r1, [r4, #0x10]
	mov r0, #0xc
	mla r5, r1, r0, r2
	ldr r1, [r4, #4]
	mla r6, r1, r0, r5
	cmp r6, r5
	bls _02238998
_02238984:
	sub r6, r6, #0xc
	mov r0, r6
	bl ov45_02237BC8
	cmp r6, r5
	bhi _02238984
_02238998:
	mov r1, #0
	mov r0, r4
	str r1, [r4, #4]
	bl ov45_02238A74
	mov r0, r4
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_0223895C

	arm_func_start ov45_022389B0
ov45_022389B0: ; 0x022389B0
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0
	str r1, [r4, #4]
	bl ov45_022389EC
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_022389B0

	arm_func_start ov45_022389CC
ov45_022389CC: ; 0x022389CC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl ov45_02242394
	str r0, [r5]
	str r4, [r5, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_022389CC

	arm_func_start ov45_022389EC
ov45_022389EC: ; 0x022389EC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _02238A30
	ldr r2, [r4, #4]
	mov r0, #0
	strb r0, [sp]
	ldr r1, [r4, #4]
	sub r1, r1, r2
	str r1, [r4, #4]
	ldr r1, [r4]
	cmp r1, #0
	beq _02238A30
	mov r2, r0
	bl ov00_021EC2EC
_02238A30:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_022389EC

	arm_func_start ov45_02238A3C
ov45_02238A3C: ; 0x02238A3C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _02238A70 ; =0x15555555
	mov r4, r1
	mov r5, r0
	cmp r4, r2
	bls _02238A58
	bl _ZNSt15__vector_commonILb1EE18throw_length_errorEv
_02238A58:
	mov r0, #0xc
	mul r0, r4, r0
	bl ov45_02242394
	str r0, [r5]
	str r4, [r5, #8]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02238A70: .word 0x15555555
	arm_func_end ov45_02238A3C

	arm_func_start ov45_02238A74
ov45_02238A74: ; 0x02238A74
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r1, [r4]
	cmp r1, #0
	beq _02238AC0
	ldr r1, [r4, #4]
	mov r3, #0
	strb r3, [sp]
	sub r2, sp, #4
	strb r3, [r2]
	ldr r2, [r2]
	bl ov45_02238ACC
	ldr r1, [r4]
	cmp r1, #0
	beq _02238AC0
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
_02238AC0:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_02238A74

	arm_func_start ov45_02238ACC
ov45_02238ACC: ; 0x02238ACC
	stmdb sp!, {r3, r4, r5, lr}
	ldr ip, [r0]
	ldr r3, [r0, #4]
	mov r2, #0xc
	mla r4, r3, r2, ip
	movs r5, r1
	sub r1, r3, r5
	str r1, [r0, #4]
	ldmeqia sp!, {r3, r4, r5, pc}
_02238AF0:
	sub r4, r4, #0xc
	mov r0, r4
	bl ov45_02237BC8
	subs r5, r5, #1
	bne _02238AF0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02238ACC

	arm_func_start ov45_02238B08
ov45_02238B08: ; 0x02238B08
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	str r1, [r0, #0x18]
	str r1, [r0, #0x1c]
	str r1, [r0, #0x20]
	str r1, [r0, #0x24]
	strb r1, [r0, #0x28]
	strb r1, [r0, #0x29]
	str r1, [r0, #0x2c]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	str r1, [r0, #0x38]
	str r1, [r0, #0x3c]
	str r1, [r0, #0x40]
	str r1, [r0, #0x44]
	str r1, [r0, #0x48]
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	str r1, [r0, #0x54]
	str r1, [r0, #0x58]
	bx lr
	arm_func_end ov45_02238B08

	arm_func_start ov45_02238B70
ov45_02238B70: ; 0x02238B70
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r3, [r5, #0x30]
	ldr r0, [r2]
	sub r3, r3, #1
	mov r3, r3, lsl #3
	add r3, r3, #0x18
	mov r4, r1
	str r3, [r2]
	cmp r0, r3
	blo _02238BA4
	cmp r4, #0
	bne _02238BAC
_02238BA4:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_02238BAC:
	ldr r0, [r5, #0x1c]
	str r0, [r4]
	ldr r0, [r5, #0x20]
	str r0, [r4, #4]
	ldr r0, [r5, #0x24]
	str r0, [r4, #8]
	ldrb r0, [r5, #0x28]
	strb r0, [r4, #0xc]
	ldrb r0, [r5, #0x29]
	strb r0, [r4, #0xd]
	ldr r0, [r5, #0x30]
	strh r0, [r4, #0xe]
	ldrh r0, [r4, #0xe]
	cmp r0, #0
	beq _02238C00
	add r0, r5, #0x2c
	bl ov45_02238C08
	ldr r2, [r5, #0x30]
	add r1, r4, #0x10
	mov r2, r2, lsl #3
	bl MI_CpuCopy8
_02238C00:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02238B70

	arm_func_start ov45_02238C08
ov45_02238C08: ; 0x02238C08
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	ldrne r0, [r0]
	bx lr
	arm_func_end ov45_02238C08

	arm_func_start ov45_02238C1C
ov45_02238C1C: ; 0x02238C1C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r1, #0
	mov r5, r0
	add r2, sp, #0
	mov r0, r4
	str r1, [sp]
	bl ov45_02238B70
	ldr r1, [sp]
	mov r2, #0
	str r2, [r5]
	str r2, [r5, #4]
	mov r0, r5
	str r2, [r5, #8]
	bl ov45_022377AC
	mov r0, r5
	bl ov45_02231C78
	mov r1, r0
	add r2, sp, #0
	mov r0, r4
	bl ov45_02238B70
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02238C1C

	arm_func_start ov45_02238C74
ov45_02238C74: ; 0x02238C74
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	mov r5, r0
	mov r4, r1
	bl ov45_0223AC78
	cmp r0, #0
	addeq sp, sp, #0x18
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrb r0, [r4, #0xc]
	add r1, r4, #0x10
	mov r3, #0
	strb r0, [r5, #0x28]
	ldrb r0, [r4, #0xd]
	sub r2, sp, #4
	strb r0, [r5, #0x29]
	ldr ip, [r4]
	add r0, r5, #0x2c
	str ip, [r5, #0x1c]
	ldr ip, [r4, #4]
	str ip, [r5, #0x20]
	ldr ip, [r4, #8]
	str ip, [r5, #0x24]
	ldrh r4, [r4, #0xe]
	strb r3, [sp, #1]
	strb r3, [r2]
	ldr r3, [r2]
	add r2, r1, r4, lsl #3
	bl ov45_0223AAE4
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x30]
	ldrb r2, [sp, #2]
	sub r3, sp, #4
	add r1, r0, r1, lsl #3
	strb r2, [r3]
	ldr r2, [r3]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	bl ov45_022391EC
	ldr r2, [r5, #0x2c]
	ldr r1, [r5, #0x30]
	ldrb r0, [sp]
	add r4, r2, r1, lsl #3
	str r4, [sp, #4]
	ldr r1, [r5, #0x2c]
	sub r2, sp, #4
	strb r0, [r2]
	ldr r3, [r2]
	add r2, sp, #4
	add r0, r5, #0x38
	str r4, [sp, #8]
	str r1, [sp, #0xc]
	bl ov45_02238D54
	mov r0, #1
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02238C74

	arm_func_start ov45_02238D54
ov45_02238D54: ; 0x02238D54
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x3c
	mov r5, r2
	ldr r3, [r5]
	ldr r2, [sp, #0x54]
	mov r6, r0
	sub r1, r3, r2
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r1, r0, asr #3
	str r1, [sp, #0x10]
	ldr r1, [r6, #4]
	str r2, [sp, #8]
	cmp r1, r0, asr #3
	addlo r0, r6, #4
	addhs r0, sp, #0x10
	ldr r4, [r0]
	ldr r1, [sp, #0x54]
	str r3, [sp, #4]
	add r3, r1, r4, lsl #3
	add r0, sp, #0x14
	mov r1, r6
	mov r2, #0
	str r3, [sp, #0xc]
	bl ov45_0223B250
	add r1, sp, #0x54
	add r0, sp, #0xc
	ldr r2, [r0]
	ldr r1, [r1]
	add r0, sp, #0x28
	add r3, sp, #0x14
	bl ov45_02239090
	ldr r0, [sp, #0x10]
	subs r0, r0, r4
	str r0, [sp, #0x10]
	beq _02238E18
	ldrb r0, [sp, #1]
	sub r2, sp, #4
	add r1, sp, #0xc
	strb r0, [r2]
	ldr r3, [r2]
	mov r0, r6
	mov r2, r5
	bl ov45_02238E60
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
_02238E18:
	ldr r3, [r6, #4]
	cmp r4, r3
	addhs sp, sp, #0x3c
	ldmhsia sp!, {r3, r4, r5, r6, lr}
	addhs sp, sp, #0x10
	bxhs lr
	mov r1, #0
	strb r1, [sp]
	sub r0, sp, #4
	strb r1, [r0]
	ldr r2, [r0]
	mov r0, r6
	sub r1, r3, r4
	bl ov45_0223B764
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02238D54

	arm_func_start ov45_02238E60
ov45_02238E60: ; 0x02238E60
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x38
	mov r5, r1
	mov r4, r2
	ldr r1, [r5]
	ldr ip, [r4]
	mov r6, r0
	cmp r1, ip
	addeq sp, sp, #0x38
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r3, [r5]
	ldr r1, [r6, #0x10]
	sub r2, ip, r3
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	str r3, [sp, #0xc]
	cmp r1, #0
	mov r2, r0, asr #3
	subne r0, r1, #1
	moveq r3, #0
	movne r3, r0, lsl #7
	ldr r1, [r6]
	ldr r0, [r6, #4]
	str ip, [sp, #8]
	add r0, r1, r0
	sub r1, r3, r0
	cmp r2, r1
	bls _02238EDC
	mov r0, r6
	sub r1, r2, r1
	bl ov45_0223B2DC
_02238EDC:
	ldr r2, [r6, #4]
	add r0, sp, #0x10
	mov r1, r6
	bl ov45_0223B250
	add r0, r6, #8
	str r0, [sp]
	add r0, r6, #4
	str r0, [sp, #4]
	ldr r1, [r5]
	ldr r2, [r4]
	add r0, sp, #0x24
	add r3, sp, #0x10
	bl ov45_02238F18
	add sp, sp, #0x38
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_02238E60

	arm_func_start ov45_02238F18
ov45_02238F18: ; 0x02238F18
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x14
	ldr r4, [sp, #0x2c]
	ldr r2, [sp, #0x30]
	ldr r1, [sp, #0x3c]
	cmp r4, r2
	beq _02239058
	sub r4, r2, r4
	mov r2, r4, asr #2
	add r2, r4, r2, lsr #29
	mov r2, r2, asr #3
	str r2, [sp, #0x10]
_02238F4C:
	ldr r4, [r3, #0x10]
	cmp r4, #0
	moveq r2, r4
	ldrne r2, [r3]
	ldrne r2, [r2]
	addne r2, r2, #0x400
	sub r4, r2, r4
	mov r2, r4, asr #2
	add r2, r4, r2, lsr #29
	ldr r4, [sp, #0x10]
	mov ip, r2, asr #3
	cmp r4, r2, asr #3
	addgt r2, sp, #8
	str ip, [sp, #8]
	addle r2, sp, #0x10
	ldr r4, [sp, #0x2c]
	ldr r5, [r2]
	str r4, [sp, #4]
	add lr, r4, r5, lsl #3
	str lr, [sp, #0xc]
	str lr, [sp]
	cmp r4, lr
	ldr r6, [r3, #0x10]
	beq _02238FE4
_02238FAC:
	cmp r6, #0
	beq _02238FC4
	ldr ip, [r4]
	ldr r2, [r4, #4]
	str ip, [r6]
	str r2, [r6, #4]
_02238FC4:
	ldr r2, [r1]
	add r4, r4, #8
	add r2, r2, #1
	str r2, [r1]
	cmp r4, lr
	add r6, r6, #8
	bne _02238FAC
	str r4, [sp, #4]
_02238FE4:
	ldr ip, [sp, #0x10]
	sub r2, r5, #1
	sub ip, ip, r5
	str ip, [sp, #0x10]
	ldr ip, [r3, #0x10]
	add r2, ip, r2, lsl #3
	str r2, [r3, #0x10]
	add ip, r2, #8
	ldr r2, [r3]
	str ip, [r3, #0x10]
	ldr r2, [r2]
	add r2, r2, #0x400
	cmp ip, r2
	bne _02239044
	ldr r2, [r3]
	add ip, r2, #4
	str ip, [r3]
	ldr r2, [r3, #0xc]
	cmp ip, r2
	ldreq r2, [r3, #4]
	streq r2, [r3]
	ldr r2, [r3]
	ldr r2, [r2]
	str r2, [r3, #0x10]
_02239044:
	ldr r2, [sp, #0x10]
	cmp r2, #0
	ldrne r2, [sp, #0xc]
	strne r2, [sp, #0x2c]
	bne _02238F4C
_02239058:
	ldr r1, [r3]
	str r1, [r0]
	ldr r1, [r3, #4]
	str r1, [r0, #4]
	ldr r1, [r3, #8]
	str r1, [r0, #8]
	ldr r1, [r3, #0xc]
	str r1, [r0, #0xc]
	ldr r1, [r3, #0x10]
	str r1, [r0, #0x10]
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02238F18

	arm_func_start ov45_02239090
ov45_02239090: ; 0x02239090
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x14
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x28]
	cmp r2, r1
	beq _022391B4
	sub r2, r1, r2
	mov r1, r2, asr #2
	add r1, r2, r1, lsr #29
	mov r1, r1, asr #3
	str r1, [sp, #0x10]
_022390C0:
	ldr r2, [r3, #0x10]
	cmp r2, #0
	moveq r1, r2
	ldrne r1, [r3]
	ldrne r1, [r1]
	addne r1, r1, #0x400
	sub r2, r1, r2
	mov r1, r2, asr #2
	add r1, r2, r1, lsr #29
	ldr r2, [sp, #0x10]
	mov ip, r1, asr #3
	cmp r2, r1, asr #3
	addgt r1, sp, #8
	str ip, [sp, #8]
	addle r1, sp, #0x10
	ldr r2, [sp, #0x24]
	ldr ip, [r1]
	str r2, [sp, #4]
	add r4, r2, ip, lsl #3
	str r4, [sp, #0xc]
	str r4, [sp]
	cmp r2, r4
	ldr lr, [r3, #0x10]
	bhs _02239140
_02239120:
	ldr r1, [r2]
	str r1, [lr]
	ldr r1, [r2, #4]
	add r2, r2, #8
	str r1, [lr, #4]
	cmp r2, r4
	add lr, lr, #8
	blo _02239120
_02239140:
	ldr r2, [sp, #0x10]
	sub r1, ip, #1
	sub r2, r2, ip
	str r2, [sp, #0x10]
	ldr r2, [r3, #0x10]
	add r1, r2, r1, lsl #3
	str r1, [r3, #0x10]
	add r2, r1, #8
	ldr r1, [r3]
	str r2, [r3, #0x10]
	ldr r1, [r1]
	add r1, r1, #0x400
	cmp r2, r1
	bne _022391A0
	ldr r1, [r3]
	add r2, r1, #4
	str r2, [r3]
	ldr r1, [r3, #0xc]
	cmp r2, r1
	ldreq r1, [r3, #4]
	streq r1, [r3]
	ldr r1, [r3]
	ldr r1, [r1]
	str r1, [r3, #0x10]
_022391A0:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	ldrne r1, [sp, #0xc]
	strne r1, [sp, #0x24]
	bne _022390C0
_022391B4:
	ldr r1, [r3]
	str r1, [r0]
	ldr r1, [r3, #4]
	str r1, [r0, #4]
	ldr r1, [r3, #8]
	str r1, [r0, #8]
	ldr r1, [r3, #0xc]
	str r1, [r0, #0xc]
	ldr r1, [r3, #0x10]
	str r1, [r0, #0x10]
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02239090

	arm_func_start ov45_022391EC
ov45_022391EC: ; 0x022391EC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x30
	ldr r1, [sp, #0x3c]
	ldr r0, [sp, #0x38]
	sub r1, r1, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r1, r0, asr #3
	cmp r1, #0x14
	movle r1, #0
	add r0, sp, #0xc
	bl ov45_0223AA80
	ldr r4, [sp, #0xc]
	ldr r3, [sp, #0x10]
	add ip, sp, #0x24
	mov r2, #0
	add lr, r4, r3, lsl #3
	str r3, [sp, #0x24]
	str r2, [sp, #0x28]
	str r4, [sp, #0x2c]
	add r0, sp, #0x38
	add r1, sp, #0x3c
	str lr, [sp]
	add r3, sp, #0x40
	str ip, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0x1c
	str r4, [sp, #0x1c]
	str ip, [sp, #0x20]
	str r3, [sp, #8]
	str lr, [sp, #0x14]
	str ip, [sp, #0x18]
	ldmia r2, {r2, r3}
	bl ov45_02239294
	ldr r0, [sp, #0x2c]
	bl _ZdaPv
	add sp, sp, #0x30
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_022391EC

	arm_func_start ov45_02239294
ov45_02239294: ; 0x02239294
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x4c
	ldr r0, [sp, #0x64]
	ldr r6, [sp, #0x60]
	ldr r7, [sp, #0x78]
	sub r1, r0, r6
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r5, r0, asr #3
	cmp r5, #1
	addle sp, sp, #0x4c
	ldmleia sp!, {r4, r5, r6, r7, lr}
	addle sp, sp, #0x10
	bxle lr
	cmp r5, #2
	bne _02239338
	ldr r0, [sp, #0x64]
	ldr r1, [sp, #0x60]
	sub r4, r0, #8
	ldr r3, [r4]
	ldr r0, [r1]
	str r4, [sp, #0x64]
	cmp r3, r0
	addge sp, sp, #0x4c
	ldmgeia sp!, {r4, r5, r6, r7, lr}
	addge sp, sp, #0x10
	bxge lr
	ldr r2, [r1]
	ldr r1, [r1, #4]
	str r2, [sp, #0x1c]
	str r3, [r6]
	ldr r0, [r4, #4]
	str r1, [sp, #0x20]
	str r0, [r6, #4]
	str r2, [r4]
	add sp, sp, #0x4c
	str r1, [r4, #4]
	ldmia sp!, {r4, r5, r6, r7, lr}
	add sp, sp, #0x10
	bx lr
_02239338:
	cmp r5, #0x14
	bgt _02239368
	add r0, sp, #0x60
	add r1, sp, #0x64
	ldr r0, [r0]
	ldr r1, [r1]
	mov r2, r7
	bl ov45_0223A9C0
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, lr}
	add sp, sp, #0x10
	bx lr
_02239368:
	ldr r2, [sp, #0x70]
	ldr r1, [sp, #0x68]
	add r0, r5, r5, lsr #31
	sub r2, r2, r1
	mov r1, r2, asr #2
	add r2, r2, r1, lsr #29
	sub r4, r5, r0, asr #1
	ldr r1, [sp, #0x60]
	cmp r5, r2, asr #3
	add r1, r1, r4, lsl #3
	str r1, [sp, #0x48]
	add r0, sp, #0x60
	add r2, sp, #0x68
	bgt _0223944C
	ldr r0, [r0]
	str r7, [sp]
	ldmia r2, {r2, r3}
	bl ov45_0223A0CC
	ldr r2, [sp, #0x68]
	add r0, sp, #0x48
	add r3, r2, r4, lsl #3
	add r1, sp, #0x64
	ldr r6, [sp, #0x6c]
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0x40
	str r6, [sp, #0x44]
	str r3, [sp, #0x40]
	str r7, [sp]
	ldmia r2, {r2, r3}
	bl ov45_0223A0CC
	ldr r0, [sp, #0x68]
	add r1, sp, #0x68
	add r2, r0, r4, lsl #3
	add r3, r0, r5, lsl #3
	stmib sp, {r2, r6}
	str r3, [sp, #0xc]
	ldr r0, [sp, #0x60]
	str r6, [sp, #0x10]
	str r0, [sp, #0x14]
	str r7, [sp, #0x18]
	sub r0, sp, #4
	stmia r0, {r2, r6}
	str r3, [sp, #0x24]
	ldr r3, [r0]
	add r0, sp, #0x3c
	str r6, [sp, #0x28]
	str r2, [sp, #0x2c]
	str r2, [sp, #0x34]
	str r6, [sp, #0x30]
	str r6, [sp, #0x38]
	ldmia r1, {r1, r2}
	bl ov45_02239F48
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, lr}
	add sp, sp, #0x10
	bx lr
_0223944C:
	ldr r4, [sp, #0x70]
	ldr r3, [sp, #0x74]
	str r4, [sp]
	stmib sp, {r3, r7}
	ldr r0, [r0]
	ldmia r2, {r2, r3}
	bl ov45_02239294
	ldr r4, [sp, #0x70]
	add r0, sp, #0x48
	add r1, sp, #0x64
	ldr r3, [sp, #0x74]
	str r4, [sp]
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0x68
	stmib sp, {r3, r7}
	ldmia r2, {r2, r3}
	bl ov45_02239294
	add r0, sp, #0x60
	add r1, sp, #0x48
	add r2, sp, #0x64
	ldr ip, [sp, #0x48]
	ldr r3, [sp, #0x60]
	ldr r0, [r0]
	sub r5, ip, r3
	mov r4, r5, asr #2
	add r4, r5, r4, lsr #29
	mov r4, r4, asr #3
	str r4, [sp]
	ldr r4, [sp, #0x64]
	ldr r5, [sp, #0x68]
	sub r6, r4, ip
	mov r4, r6, asr #2
	add r4, r6, r4, lsr #29
	mov r4, r4, asr #3
	str r4, [sp, #4]
	str r5, [sp, #8]
	ldr r4, [sp, #0x6c]
	ldr r5, [sp, #0x70]
	str r4, [sp, #0xc]
	ldr r1, [r1]
	ldr r2, [r2]
	ldr r4, [sp, #0x74]
	str r5, [sp, #0x10]
	mov r3, r7
	str r4, [sp, #0x14]
	bl ov45_02239518
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, r6, r7, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02239294

	arm_func_start ov45_02239518
ov45_02239518: ; 0x02239518
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x88
	ldr r8, [sp, #0xb0]
	ldr r7, [sp, #0xb4]
	cmp r8, #0
	cmpne r7, #0
	mov r4, r3
	addeq sp, sp, #0x88
	ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
	addeq sp, sp, #0x10
	bxeq lr
	add r0, r8, r7
	cmp r0, #2
	bne _022395B4
	ldr r6, [sp, #0xa4]
	ldr r1, [sp, #0xa0]
	ldr r5, [r6]
	ldr r0, [r1]
	cmp r5, r0
	addge sp, sp, #0x88
	ldmgeia sp!, {r4, r5, r6, r7, r8, lr}
	addge sp, sp, #0x10
	bxge lr
	ldr r4, [r1]
	ldr r3, [r1, #4]
	ldr r2, [sp, #0xa0]
	ldr r0, [sp, #0xa4]
	str r5, [r2]
	ldr r1, [r6, #4]
	str r4, [sp, #0x54]
	str r1, [r2, #4]
	str r4, [r0]
	str r3, [sp, #0x58]
	str r3, [r0, #4]
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
_022395B4:
	ldr r1, [sp, #0xc0]
	ldr r0, [sp, #0xb8]
	cmp r8, r7
	sub r1, r1, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	cmple r8, r0, asr #3
	bgt _022396FC
	ldr r1, [sp, #0xa4]
	ldr r0, [sp, #0xa0]
	ldr r3, [sp, #0xb8]
	ldr r2, [sp, #0xbc]
	str r0, [sp, #0x50]
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	str r3, [sp, #0x44]
	str r2, [sp, #0x48]
	str r1, [sp, #0x4c]
	cmp r0, #0
	beq _022396A0
	cmp r0, #0
	add r1, sp, #0x3c
	beq _022396A0
	ldr r5, [sp, #0x50]
	ldr r3, [sp, #0x4c]
_0223961C:
	ldr r0, [sp, #0x44]
	ldr r6, [sp, #0x48]
	str r0, [sp, #0x3c]
	str r6, [sp, #0x40]
	ldr r2, [r6, #8]
	ldr r6, [r6, #4]
	sub r7, r0, r2
	mov r2, r7, asr #2
	add r2, r7, r2, lsr #29
	cmp r6, r2, asr #3
	ble _0223965C
	ldr r2, [r5]
	str r2, [r0]
	ldr r2, [r5, #4]
	str r2, [r0, #4]
	b _02239684
_0223965C:
	cmp r0, #0
	beq _02239674
	ldr r6, [r5]
	ldr r2, [r5, #4]
	str r6, [r0]
	str r2, [r0, #4]
_02239674:
	ldr r2, [r1, #4]
	ldr r0, [r2, #4]
	add r0, r0, #1
	str r0, [r2, #4]
_02239684:
	ldr r0, [sp, #0x44]
	add r5, r5, #8
	add r0, r0, #8
	str r0, [sp, #0x44]
	cmp r5, r3
	bne _0223961C
	str r5, [sp, #0x50]
_022396A0:
	ldr r0, [sp, #0xa4]
	ldr r1, [sp, #0xa8]
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [sp, #0xa0]
	ldr r5, [sp, #0x44]
	str r0, [sp, #0xc]
	ldr r2, [sp, #0x48]
	str r4, [sp, #0x10]
	sub r0, sp, #4
	str r5, [r0]
	str r2, [r0, #4]
	ldr r3, [r0]
	add r1, sp, #0xb8
	str r2, [sp, #0x78]
	add r0, sp, #0x7c
	str r5, [sp, #0x74]
	ldmia r1, {r1, r2}
	bl ov45_02239DF0
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
_022396FC:
	cmp r7, r0, asr #3
	bgt _02239830
	ldr r1, [sp, #0xa4]
	ldr r0, [sp, #0xa8]
	ldr r3, [sp, #0xb8]
	ldr r2, [sp, #0xbc]
	cmp r1, r0
	movne r0, #1
	moveq r0, #0
	str r3, [sp, #0x30]
	str r2, [sp, #0x34]
	str r1, [sp, #0x38]
	cmp r0, #0
	beq _022397CC
	cmp r0, #0
	add r1, sp, #0x28
	beq _022397CC
	ldr r5, [sp, #0x38]
	ldr r3, [sp, #0xa8]
_02239748:
	ldr r0, [sp, #0x30]
	ldr r6, [sp, #0x34]
	str r0, [sp, #0x28]
	str r6, [sp, #0x2c]
	ldr r2, [r6, #8]
	ldr r6, [r6, #4]
	sub r7, r0, r2
	mov r2, r7, asr #2
	add r2, r7, r2, lsr #29
	cmp r6, r2, asr #3
	ble _02239788
	ldr r2, [r5]
	str r2, [r0]
	ldr r2, [r5, #4]
	str r2, [r0, #4]
	b _022397B0
_02239788:
	cmp r0, #0
	beq _022397A0
	ldr r6, [r5]
	ldr r2, [r5, #4]
	str r6, [r0]
	str r2, [r0, #4]
_022397A0:
	ldr r2, [r1, #4]
	ldr r0, [r2, #4]
	add r0, r0, #1
	str r0, [r2, #4]
_022397B0:
	ldr r0, [sp, #0x30]
	add r5, r5, #8
	add r0, r0, #8
	str r0, [sp, #0x30]
	cmp r5, r3
	bne _02239748
	str r5, [sp, #0x38]
_022397CC:
	ldr r6, [sp, #0x30]
	ldr r5, [sp, #0x34]
	str r6, [sp, #4]
	ldr r0, [sp, #0xa8]
	str r5, [sp, #8]
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	add r1, sp, #0xa0
	ldr r3, [sp, #0xb8]
	sub r4, sp, #4
	ldr r2, [sp, #0xbc]
	str r3, [r4]
	str r2, [r4, #4]
	add r0, sp, #0xa4
	ldr r2, [r0]
	ldr r3, [r4]
	ldr r1, [r1]
	add r0, sp, #0x70
	str r6, [sp, #0x68]
	str r5, [sp, #0x6c]
	bl ov45_02239BBC
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
_02239830:
	cmp r8, r7
	bgt _02239890
	add r1, sp, #0xa0
	add r2, sp, #0xa4
	add r0, r7, r7, lsr #31
	mov r6, r0, asr #1
	ldr r3, [sp, #0xa4]
	ldr r1, [r1]
	add r3, r3, r6, lsl #3
	ldr r2, [r2]
	add r0, sp, #0x64
	str r4, [sp]
	str r3, [sp, #0x80]
	bl ov45_02239B3C
	ldr r3, [sp, #0x64]
	ldr r2, [sp, #0xa0]
	str r3, [sp, #0x84]
	sub r1, r3, r2
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	str r3, [sp, #0x20]
	str r2, [sp, #0x24]
	mov r5, r0, asr #3
	b _022398E4
_02239890:
	add r1, sp, #0xa4
	add r2, sp, #0xa8
	add r0, r8, r8, lsr #31
	mov r5, r0, asr #1
	ldr r3, [sp, #0xa0]
	ldr r1, [r1]
	add r3, r3, r5, lsl #3
	ldr r2, [r2]
	add r0, sp, #0x60
	str r4, [sp]
	str r3, [sp, #0x84]
	bl ov45_02239ABC
	ldr r3, [sp, #0x60]
	ldr r2, [sp, #0xa4]
	str r3, [sp, #0x80]
	sub r1, r3, r2
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	str r3, [sp, #0x18]
	str r2, [sp, #0x1c]
	mov r6, r0, asr #3
_022398E4:
	add r1, sp, #0x84
	add r2, sp, #0xa4
	add r0, sp, #0x80
	ldr r3, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	add r0, sp, #0x5c
	bl ov45_022399A8
	ldr r2, [sp, #0x5c]
	add r0, sp, #0xa0
	add r1, sp, #0x84
	ldr r3, [sp, #0xb8]
	stmia sp, {r5, r6}
	str r3, [sp, #8]
	ldr ip, [sp, #0xbc]
	ldr r3, [sp, #0xc0]
	str ip, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr ip, [sp, #0xc4]
	ldr r0, [r0]
	ldr r1, [r1]
	mov r3, r4
	str ip, [sp, #0x14]
	str r2, [sp, #0xa4]
	bl ov45_02239518
	sub r2, r8, r5
	str r2, [sp]
	sub r5, r7, r6
	str r5, [sp, #4]
	ldr r3, [sp, #0xb8]
	add r0, sp, #0xa4
	add r1, sp, #0x80
	add r2, sp, #0xa8
	str r3, [sp, #8]
	ldr r5, [sp, #0xbc]
	ldr r3, [sp, #0xc0]
	str r5, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r5, [sp, #0xc4]
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2]
	mov r3, r4
	str r5, [sp, #0x14]
	bl ov45_02239518
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02239518

	arm_func_start ov45_022399A8
ov45_022399A8: ; 0x022399A8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r4, [sp, #0x24]
	ldr lr, [sp, #0x28]
	cmp r4, lr
	ldreq r1, [sp, #0x2c]
	addeq sp, sp, #0x10
	streq r1, [r0]
	ldmeqia sp!, {r4, r5, r6, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr ip, [sp, #0x2c]
	cmp lr, ip
	ldreq r1, [sp, #0x24]
	addeq sp, sp, #0x10
	streq r1, [r0]
	ldmeqia sp!, {r4, r5, r6, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r5, [sp, #0x28]
_022399FC:
	ldr r3, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r5]
	str r3, [sp, #8]
	str r1, [r4]
	ldr r1, [r5, #4]
	str r2, [sp, #0xc]
	str r1, [r4, #4]
	str r3, [r5]
	str r2, [r5, #4]
	add r5, r5, #8
	cmp r5, ip
	add r4, r4, #8
	beq _02239A40
	cmp r4, lr
	moveq lr, r5
	b _022399FC
_02239A40:
	mov r5, r4
	cmp r4, lr
	beq _02239AA8
	ldr r1, [sp, #0x2c]
	mov r6, lr
_02239A54:
	ldr ip, [r4]
	ldr r3, [r4, #4]
	ldr r2, [r6]
	str ip, [sp]
	str r2, [r4]
	ldr r2, [r6, #4]
	str r3, [sp, #4]
	str r2, [r4, #4]
	str ip, [r6]
	str r3, [r6, #4]
	add r6, r6, #8
	cmp r6, r1
	add r4, r4, #8
	bne _02239A9C
	cmp r4, lr
	beq _02239AA8
	mov r6, lr
	b _02239A54
_02239A9C:
	cmp r4, lr
	moveq lr, r6
	b _02239A54
_02239AA8:
	str r5, [r0]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_022399A8

	arm_func_start ov45_02239ABC
ov45_02239ABC: ; 0x02239ABC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str ip, [sp]
	sub r2, r1, ip
	mov r1, r2, asr #2
	add r1, r2, r1, lsr #29
	mov lr, r1, asr #3
	cmp lr, #0
	ble _02239B24
	ldr r4, [r3]
_02239AF0:
	add r1, lr, lr, lsr #31
	mov r3, r1, asr #1
	ldr r1, [ip, r3, lsl #3]
	add r2, ip, r3, lsl #3
	cmp r1, r4
	movge lr, r3
	bge _02239B1C
	add ip, r2, #8
	add r1, r3, #1
	str ip, [sp, #0x14]
	sub lr, lr, r1
_02239B1C:
	cmp lr, #0
	bgt _02239AF0
_02239B24:
	ldr r1, [sp, #0x14]
	str r1, [r0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02239ABC

	arm_func_start ov45_02239B3C
ov45_02239B3C: ; 0x02239B3C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr ip, [sp, #0x14]
	ldr r1, [sp, #0x18]
	str ip, [sp]
	sub r2, r1, ip
	mov r1, r2, asr #2
	add r1, r2, r1, lsr #29
	mov lr, r1, asr #3
	cmp lr, #0
	ble _02239BA4
	ldr r4, [r3]
_02239B70:
	add r1, lr, lr, lsr #31
	mov r3, r1, asr #1
	ldr r1, [ip, r3, lsl #3]
	add r2, ip, r3, lsl #3
	cmp r4, r1
	movlt lr, r3
	blt _02239B9C
	add ip, r2, #8
	add r1, r3, #1
	str ip, [sp, #0x14]
	sub lr, lr, r1
_02239B9C:
	cmp lr, #0
	bgt _02239B70
_02239BA4:
	ldr r1, [sp, #0x14]
	str r1, [r0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02239B3C

	arm_func_start ov45_02239BBC
ov45_02239BBC: ; 0x02239BBC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x40
	ldr r3, [sp, #0x54]
	ldr r1, [sp, #0x58]
	cmp r3, r1
	bne _02239C48
	ldr r5, [sp, #0x6c]
	ldr r4, [sp, #0x64]
	ldr r3, [sp, #0x5c]
	ldr r2, [sp, #0x68]
	ldr r1, [sp, #0x60]
	str r5, [sp, #0x2c]
	str r4, [sp, #0x30]
	str r2, [sp, #0x34]
	str r3, [sp, #0x38]
	str r1, [sp, #0x3c]
	cmp r4, r3
	beq _02239C30
_02239C08:
	ldr r1, [sp, #0x30]
	sub r2, r1, #8
	ldr r1, [r2]
	str r2, [sp, #0x30]
	str r1, [r5, #-8]!
	ldr r1, [r2, #4]
	cmp r2, r3
	str r1, [r5, #4]
	bne _02239C08
	str r5, [sp, #0x2c]
_02239C30:
	ldr r1, [sp, #0x2c]
	add sp, sp, #0x40
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_02239C48:
	ldr r2, [sp, #0x5c]
	ldr r1, [sp, #0x64]
	cmp r2, r1
	bne _02239CA4
	ldr r3, [sp, #0x6c]
	ldr r2, [sp, #0x58]
	ldr r4, [sp, #0x54]
	str r3, [sp, #0x20]
	str r2, [sp, #0x24]
	str r4, [sp, #0x28]
	cmp r2, r4
	bls _02239C90
_02239C78:
	ldr r1, [r2, #-8]!
	cmp r2, r4
	str r1, [r3, #-8]!
	ldr r1, [r2, #4]
	str r1, [r3, #4]
	bhi _02239C78
_02239C90:
	add sp, sp, #0x40
	str r3, [r0]
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_02239CA4:
	ldr r1, [sp, #0x58]
	ldr r4, [sp, #0x64]
	sub r1, r1, #8
	sub r4, r4, #8
	ldr ip, [sp, #0x6c]
	str r1, [sp, #0x58]
	str r4, [sp, #0x64]
_02239CC0:
	ldr r5, [sp, #0x64]
	ldr lr, [r1]
	ldr r4, [r5]
	cmp r4, lr
	bge _02239D6C
	str lr, [ip, #-8]!
	ldr lr, [r1, #4]
	str ip, [sp, #0x6c]
	str lr, [ip, #4]
	cmp r3, r1
	bne _02239D60
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x68]
	add lr, r1, #8
	ldr r3, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	str ip, [sp, #0xc]
	str lr, [sp, #0x64]
	str lr, [sp, #0x10]
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	str r1, [sp, #0x1c]
	cmp lr, r3
	beq _02239D48
_02239D20:
	ldr r1, [sp, #0x10]
	sub r2, r1, #8
	ldr r1, [r2]
	str r2, [sp, #0x10]
	str r1, [ip, #-8]!
	ldr r1, [r2, #4]
	cmp r2, r3
	str r1, [ip, #4]
	bne _02239D20
	str ip, [sp, #0xc]
_02239D48:
	ldr r1, [sp, #0xc]
	add sp, sp, #0x40
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_02239D60:
	sub r1, r1, #8
	str r1, [sp, #0x58]
	b _02239CC0
_02239D6C:
	str r4, [ip, #-8]!
	ldr lr, [r5, #4]
	str ip, [sp, #0x6c]
	str lr, [ip, #4]
	cmp r2, r5
	bne _02239DD0
	ldr r3, [sp, #0x54]
	add r2, r1, #8
	str ip, [sp]
	str r2, [sp, #0x58]
	str r2, [sp, #4]
	str r3, [sp, #8]
	cmp r2, r3
	bls _02239DBC
_02239DA4:
	ldr r1, [r2, #-8]!
	cmp r2, r3
	str r1, [ip, #-8]!
	ldr r1, [r2, #4]
	str r1, [ip, #4]
	bhi _02239DA4
_02239DBC:
	str ip, [r0]
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_02239DD0:
	ldr lr, [sp, #0x64]
	sub lr, lr, #8
	str lr, [sp, #0x64]
	b _02239CC0
	arm_func_end ov45_02239BBC

	arm_func_start ov45_02239DE0
ov45_02239DE0: ; 0x02239DE0
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02239DE0

	arm_func_start ov45_02239DF0
ov45_02239DF0: ; 0x02239DF0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	ldr r4, [sp, #0x44]
	ldr r1, [sp, #0x48]
	ldr ip, [sp, #0x4c]
	ldr r2, [sp, #0x3c]
	b _02239E5C
_02239E10:
	ldr lr, [sp, #0x34]
	ldr r5, [r4]
	ldr r3, [lr]
	cmp r5, r3
	bge _02239E3C
	str r5, [ip]
	ldr r3, [r4, #4]
	add r4, r4, #8
	str r3, [ip, #4]
	str r4, [sp, #0x44]
	b _02239E54
_02239E3C:
	str r3, [ip]
	ldr r3, [sp, #0x34]
	ldr lr, [lr, #4]
	add r3, r3, #8
	str lr, [ip, #4]
	str r3, [sp, #0x34]
_02239E54:
	add ip, ip, #8
	str ip, [sp, #0x4c]
_02239E5C:
	ldr r3, [sp, #0x34]
	cmp r3, r2
	cmpne r4, r1
	bne _02239E10
	ldr r2, [sp, #0x34]
	ldr r1, [sp, #0x3c]
	cmp r2, r1
	bne _02239ED0
	ldr r3, [sp, #0x4c]
	ldr r4, [sp, #0x48]
	ldr r2, [sp, #0x44]
	str r3, [sp, #0x14]
	str r4, [sp, #0x18]
	str r2, [sp, #0x1c]
	cmp r2, r4
	bhs _02239EBC
_02239E9C:
	ldr r1, [r2]
	str r1, [r3]
	ldr r1, [r2, #4]
	add r2, r2, #8
	str r1, [r3, #4]
	cmp r2, r4
	add r3, r3, #8
	blo _02239E9C
_02239EBC:
	add sp, sp, #0x20
	str r3, [r0]
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_02239ED0:
	ldr lr, [sp, #0x4c]
	ldr ip, [sp, #0x3c]
	ldr r2, [sp, #0x34]
	ldr r3, [sp, #0x40]
	ldr r1, [sp, #0x38]
	str lr, [sp]
	str ip, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	cmp r2, ip
	beq _02239F30
_02239F00:
	ldr r3, [sp, #0xc]
	ldr r2, [r3]
	mov r1, r3
	str r2, [lr]
	add r1, r1, #8
	ldr r2, [r3, #4]
	str r1, [sp, #0xc]
	str r2, [lr, #4]
	cmp r1, ip
	add lr, lr, #8
	bne _02239F00
	str lr, [sp]
_02239F30:
	ldr r1, [sp]
	str r1, [r0]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02239DF0

	arm_func_start ov45_02239F48
ov45_02239F48: ; 0x02239F48
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x28
	ldr r1, [sp, #0x54]
	ldr ip, [sp, #0x5c]
	ldr r3, [sp, #0x44]
	b _02239FB8
_02239F64:
	ldr r5, [sp, #0x4c]
	ldr lr, [sp, #0x3c]
	ldr r4, [r5]
	ldr r2, [lr]
	cmp r4, r2
	bge _02239F98
	str r4, [ip]
	ldr r2, [sp, #0x4c]
	ldr lr, [r5, #4]
	add r2, r2, #8
	str lr, [ip, #4]
	str r2, [sp, #0x4c]
	b _02239FB0
_02239F98:
	str r2, [ip]
	ldr r2, [sp, #0x3c]
	ldr lr, [lr, #4]
	add r2, r2, #8
	str lr, [ip, #4]
	str r2, [sp, #0x3c]
_02239FB0:
	add ip, ip, #8
	str ip, [sp, #0x5c]
_02239FB8:
	ldr r2, [sp, #0x3c]
	cmp r2, r3
	ldrne r2, [sp, #0x4c]
	cmpne r2, r1
	bne _02239F64
	ldr r2, [sp, #0x3c]
	ldr r1, [sp, #0x44]
	cmp r2, r1
	bne _0223A054
	ldr lr, [sp, #0x5c]
	ldr ip, [sp, #0x54]
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x58]
	ldr r1, [sp, #0x50]
	str lr, [sp, #0x14]
	str ip, [sp, #0x18]
	str r3, [sp, #0x1c]
	str r2, [sp, #0x20]
	str r1, [sp, #0x24]
	cmp r2, ip
	beq _0223A03C
_0223A00C:
	ldr r3, [sp, #0x20]
	ldr r2, [r3]
	mov r1, r3
	str r2, [lr]
	add r1, r1, #8
	ldr r2, [r3, #4]
	str r1, [sp, #0x20]
	str r2, [lr, #4]
	cmp r1, ip
	add lr, lr, #8
	bne _0223A00C
	str lr, [sp, #0x14]
_0223A03C:
	ldr r1, [sp, #0x14]
	add sp, sp, #0x28
	str r1, [r0]
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_0223A054:
	ldr lr, [sp, #0x5c]
	ldr ip, [sp, #0x44]
	ldr r2, [sp, #0x3c]
	ldr r3, [sp, #0x48]
	ldr r1, [sp, #0x40]
	str lr, [sp]
	str ip, [sp, #4]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	cmp r2, ip
	beq _0223A0B4
_0223A084:
	ldr r3, [sp, #0xc]
	ldr r2, [r3]
	mov r1, r3
	str r2, [lr]
	add r1, r1, #8
	ldr r2, [r3, #4]
	str r1, [sp, #0xc]
	str r2, [lr, #4]
	cmp r1, ip
	add lr, lr, #8
	bne _0223A084
	str lr, [sp]
_0223A0B4:
	ldr r1, [sp]
	str r1, [r0]
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02239F48

	arm_func_start ov45_0223A0CC
ov45_0223A0CC: ; 0x0223A0CC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x80
	ldr r1, [sp, #0x9c]
	ldr r0, [sp, #0x98]
	ldr r7, [sp, #0xa8]
	sub r1, r1, r0
	mov r0, r1, asr #2
	add r0, r1, r0, lsr #29
	mov r5, r0, asr #3
	cmp r5, #0
	addle sp, sp, #0x80
	ldmleia sp!, {r3, r4, r5, r6, r7, lr}
	addle sp, sp, #0x10
	bxle lr
	cmp r5, #1
	bne _0223A1A0
	ldr r3, [sp, #0xa0]
	ldr r1, [sp, #0xa4]
	str r3, [sp, #0x74]
	str r1, [sp, #0x78]
	ldr r0, [r1, #8]
	ldr r1, [r1, #4]
	sub r2, r3, r0
	mov r0, r2, asr #2
	add r0, r2, r0, lsr #29
	cmp r1, r0, asr #3
	add r2, sp, #0x74
	ble _0223A164
	ldr r1, [sp, #0x98]
	add sp, sp, #0x80
	ldr r0, [r1]
	str r0, [r3]
	ldr r0, [r1, #4]
	str r0, [r3, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	add sp, sp, #0x10
	bx lr
_0223A164:
	cmp r3, #0
	beq _0223A180
	ldr r0, [sp, #0x98]
	ldr r1, [r0]
	ldr r0, [r0, #4]
	str r1, [r3]
	str r0, [r3, #4]
_0223A180:
	ldr r1, [r2, #4]
	add sp, sp, #0x80
	ldr r0, [r1, #4]
	add r0, r0, #1
	str r0, [r1, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	add sp, sp, #0x10
	bx lr
_0223A1A0:
	cmp r5, #2
	bne _0223A39C
	ldr r3, [sp, #0x9c]
	ldr r2, [sp, #0x98]
	ldr r1, [r3, #-8]
	ldr r0, [r2]
	cmp r1, r0
	bge _0223A2B0
	ldr r0, [sp, #0xa4]
	ldr r1, [sp, #0xa0]
	str r0, [sp, #0x34]
	cmp r2, r3
	movne r0, #1
	moveq r0, #0
	str r1, [sp, #0x30]
	str r3, [sp, #0x38]
	str r2, [sp, #0x3c]
	cmp r0, #0
	addeq sp, sp, #0x80
	ldmeqia sp!, {r3, r4, r5, r6, r7, lr}
	addeq sp, sp, #0x10
	bxeq lr
	cmp r0, #0
	add r2, sp, #0x28
	addeq sp, sp, #0x80
	ldmeqia sp!, {r3, r4, r5, r6, r7, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r4, [sp, #0x3c]
	ldr r1, [sp, #0x38]
_0223A218:
	ldr r0, [sp, #0x30]
	ldr r5, [sp, #0x34]
	str r0, [sp, #0x28]
	str r5, [sp, #0x2c]
	ldr r3, [r5, #8]
	sub r1, r1, #8
	sub r6, r0, r3
	mov r3, r6, asr #2
	ldr r5, [r5, #4]
	add r3, r6, r3, lsr #29
	str r1, [sp, #0x38]
	cmp r5, r3, asr #3
	ble _0223A260
	ldr r3, [r1]
	str r3, [r0]
	ldr r3, [r1, #4]
	str r3, [r0, #4]
	b _0223A288
_0223A260:
	cmp r0, #0
	beq _0223A278
	ldr r5, [r1]
	ldr r3, [r1, #4]
	str r5, [r0]
	str r3, [r0, #4]
_0223A278:
	ldr r3, [r2, #4]
	ldr r0, [r3, #4]
	add r0, r0, #1
	str r0, [r3, #4]
_0223A288:
	ldr r3, [sp, #0x30]
	ldr r0, [sp, #0x38]
	add r3, r3, #8
	str r3, [sp, #0x30]
	cmp r4, r0
	bne _0223A218
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	add sp, sp, #0x10
	bx lr
_0223A2B0:
	ldr r0, [sp, #0xa4]
	ldr r1, [sp, #0xa0]
	str r0, [sp, #0x1c]
	cmp r2, r3
	movne r0, #1
	moveq r0, #0
	str r1, [sp, #0x18]
	str r3, [sp, #0x20]
	str r2, [sp, #0x24]
	cmp r0, #0
	addeq sp, sp, #0x80
	ldmeqia sp!, {r3, r4, r5, r6, r7, lr}
	addeq sp, sp, #0x10
	bxeq lr
	cmp r0, #0
	add r1, sp, #0x10
	addeq sp, sp, #0x80
	ldmeqia sp!, {r3, r4, r5, r6, r7, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r4, [sp, #0x24]
	ldr r3, [sp, #0x20]
_0223A308:
	ldr r0, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	str r0, [sp, #0x10]
	str r5, [sp, #0x14]
	ldr r2, [r5, #8]
	ldr r5, [r5, #4]
	sub r6, r0, r2
	mov r2, r6, asr #2
	add r2, r6, r2, lsr #29
	cmp r5, r2, asr #3
	ble _0223A348
	ldr r2, [r4]
	str r2, [r0]
	ldr r2, [r4, #4]
	str r2, [r0, #4]
	b _0223A370
_0223A348:
	cmp r0, #0
	beq _0223A360
	ldr r5, [r4]
	ldr r2, [r4, #4]
	str r5, [r0]
	str r2, [r0, #4]
_0223A360:
	ldr r2, [r1, #4]
	ldr r0, [r2, #4]
	add r0, r0, #1
	str r0, [r2, #4]
_0223A370:
	ldr r0, [sp, #0x18]
	add r4, r4, #8
	add r0, r0, #8
	str r0, [sp, #0x18]
	cmp r4, r3
	bne _0223A308
	str r4, [sp, #0x24]
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	add sp, sp, #0x10
	bx lr
_0223A39C:
	cmp r5, #0x14
	bgt _0223A3E8
	ldr r3, [sp, #0xa0]
	str r7, [sp, #4]
	sub r4, sp, #4
	add r1, sp, #0x98
	ldr r2, [sp, #0xa4]
	str r3, [r4]
	str r2, [r4, #4]
	add r0, sp, #0x9c
	ldr r2, [r0]
	ldr r3, [r4]
	ldr r1, [r1]
	add r0, sp, #0x6c
	bl ov45_0223A7E4
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	add sp, sp, #0x10
	bx lr
_0223A3E8:
	add r0, r5, r5, lsr #31
	sub r4, r5, r0, asr #1
	ldr r1, [sp, #0xa0]
	ldr r6, [sp, #0xa4]
	add ip, r1, r4, lsl #3
	ldr r0, [sp, #0x98]
	str ip, [sp]
	add r1, r0, r4, lsl #3
	add r3, sp, #0x98
	str r6, [sp, #4]
	ldr r0, [r3]
	add r2, sp, #0xa0
	str r1, [sp, #0x7c]
	str ip, [sp, #0x64]
	str r6, [sp, #0x68]
	str r7, [sp, #8]
	ldmia r2, {r2, r3}
	bl ov45_02239294
	ldr r2, [sp, #0xa0]
	add r0, sp, #0x7c
	add ip, r2, r5, lsl #3
	add r3, r2, r4, lsl #3
	add r1, sp, #0x9c
	str ip, [sp]
	str r6, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0x5c
	str r6, [sp, #0x60]
	str r3, [sp, #0x5c]
	str ip, [sp, #0x54]
	str r6, [sp, #0x58]
	str r7, [sp, #8]
	ldmia r2, {r2, r3}
	bl ov45_02239294
	ldr r1, [sp, #0x98]
	ldr r3, [sp, #0xa0]
	add r2, r1, r4, lsl #3
	add r4, r1, r5, lsl #3
	str r4, [sp]
	str r3, [sp, #4]
	ldr r1, [sp, #0xa4]
	add r0, sp, #0x98
	str r1, [sp, #8]
	ldr r1, [r0]
	add r0, sp, #0x4c
	mov r3, r2
	str r4, [sp, #0x40]
	str r2, [sp, #0x44]
	str r2, [sp, #0x48]
	str r7, [sp, #0xc]
	bl ov45_0223A4C8
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_0223A0CC

	arm_func_start ov45_0223A4C8
ov45_0223A4C8: ; 0x0223A4C8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x40
	ldr r3, [sp, #0x64]
	ldr r5, [sp, #0x68]
	ldr r1, [sp, #0x5c]
	ldr r6, [sp, #0x60]
	add ip, sp, #0x38
	add lr, sp, #0x30
	b _0223A5F0
_0223A4F0:
	ldr r4, [r3]
	ldr r2, [r1]
	cmp r4, r2
	bge _0223A574
	ldr r2, [sp, #0x6c]
	ldr r7, [sp, #0x70]
	str r2, [sp, #0x38]
	str r7, [sp, #0x3c]
	ldr r4, [r7, #8]
	ldr r7, [r7, #4]
	sub r8, r2, r4
	mov r4, r8, asr #2
	add r4, r8, r4, lsr #29
	cmp r7, r4, asr #3
	ble _0223A540
	ldr r4, [r3]
	str r4, [r2]
	ldr r4, [r3, #4]
	str r4, [r2, #4]
	b _0223A568
_0223A540:
	cmp r2, #0
	beq _0223A558
	ldr r7, [r3]
	ldr r4, [r3, #4]
	str r7, [r2]
	str r4, [r2, #4]
_0223A558:
	ldr r4, [ip, #4]
	ldr r2, [r4, #4]
	add r2, r2, #1
	str r2, [r4, #4]
_0223A568:
	add r3, r3, #8
	str r3, [sp, #0x64]
	b _0223A5E4
_0223A574:
	ldr r2, [sp, #0x6c]
	ldr r7, [sp, #0x70]
	str r2, [sp, #0x30]
	str r7, [sp, #0x34]
	ldr r4, [r7, #8]
	ldr r7, [r7, #4]
	sub r8, r2, r4
	mov r4, r8, asr #2
	add r4, r8, r4, lsr #29
	cmp r7, r4, asr #3
	ble _0223A5B4
	ldr r4, [r1]
	str r4, [r2]
	ldr r4, [r1, #4]
	str r4, [r2, #4]
	b _0223A5DC
_0223A5B4:
	cmp r2, #0
	beq _0223A5CC
	ldr r7, [r1]
	ldr r4, [r1, #4]
	str r7, [r2]
	str r4, [r2, #4]
_0223A5CC:
	ldr r4, [lr, #4]
	ldr r2, [r4, #4]
	add r2, r2, #1
	str r2, [r4, #4]
_0223A5DC:
	add r1, r1, #8
	str r1, [sp, #0x5c]
_0223A5E4:
	ldr r2, [sp, #0x6c]
	add r2, r2, #8
	str r2, [sp, #0x6c]
_0223A5F0:
	cmp r1, r6
	cmpne r3, r5
	bne _0223A4F0
	ldr r2, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	cmp r2, r1
	bne _0223A6F8
	ldr r2, [sp, #0x68]
	ldr r1, [sp, #0x64]
	ldr r4, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	str r1, [sp, #0x2c]
	cmp r1, r2
	movne r1, #1
	moveq r1, #0
	str r4, [sp, #0x20]
	str r3, [sp, #0x24]
	str r2, [sp, #0x28]
	cmp r1, #0
	beq _0223A6D8
	cmp r1, #0
	add r2, sp, #0x18
	beq _0223A6D8
	ldr r5, [sp, #0x2c]
	ldr r4, [sp, #0x28]
_0223A654:
	ldr r1, [sp, #0x20]
	ldr ip, [sp, #0x24]
	str r1, [sp, #0x18]
	str ip, [sp, #0x1c]
	ldr r3, [ip, #8]
	ldr ip, [ip, #4]
	sub lr, r1, r3
	mov r3, lr, asr #2
	add r3, lr, r3, lsr #29
	cmp ip, r3, asr #3
	ble _0223A694
	ldr r3, [r5]
	str r3, [r1]
	ldr r3, [r5, #4]
	str r3, [r1, #4]
	b _0223A6BC
_0223A694:
	cmp r1, #0
	beq _0223A6AC
	ldr ip, [r5]
	ldr r3, [r5, #4]
	str ip, [r1]
	str r3, [r1, #4]
_0223A6AC:
	ldr r3, [r2, #4]
	ldr r1, [r3, #4]
	add r1, r1, #1
	str r1, [r3, #4]
_0223A6BC:
	ldr r1, [sp, #0x20]
	add r5, r5, #8
	add r1, r1, #8
	str r1, [sp, #0x20]
	cmp r5, r4
	bne _0223A654
	str r5, [sp, #0x2c]
_0223A6D8:
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r2, [r0]
	str r1, [r0, #4]
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
_0223A6F8:
	ldr r2, [sp, #0x60]
	ldr r1, [sp, #0x5c]
	ldr r4, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	str r1, [sp, #0x14]
	cmp r1, r2
	movne r1, #1
	moveq r1, #0
	str r4, [sp, #8]
	str r3, [sp, #0xc]
	str r2, [sp, #0x10]
	cmp r1, #0
	beq _0223A7C4
	cmp r1, #0
	add r2, sp, #0
	beq _0223A7C4
	ldr ip, [sp, #0x14]
	ldr r4, [sp, #0x10]
_0223A740:
	ldr r1, [sp, #8]
	ldr r5, [sp, #0xc]
	str r1, [sp]
	str r5, [sp, #4]
	ldr r3, [r5, #8]
	ldr lr, [r5, #4]
	sub r5, r1, r3
	mov r3, r5, asr #2
	add r3, r5, r3, lsr #29
	cmp lr, r3, asr #3
	ble _0223A780
	ldr r3, [ip]
	str r3, [r1]
	ldr r3, [ip, #4]
	str r3, [r1, #4]
	b _0223A7A8
_0223A780:
	cmp r1, #0
	beq _0223A798
	ldr lr, [ip]
	ldr r3, [ip, #4]
	str lr, [r1]
	str r3, [r1, #4]
_0223A798:
	ldr r3, [r2, #4]
	ldr r1, [r3, #4]
	add r1, r1, #1
	str r1, [r3, #4]
_0223A7A8:
	ldr r1, [sp, #8]
	add ip, ip, #8
	add r1, r1, #8
	str r1, [sp, #8]
	cmp ip, r4
	bne _0223A740
	str ip, [sp, #0x14]
_0223A7C4:
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	str r2, [r0]
	str r1, [r0, #4]
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, r7, r8, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_0223A4C8

	arm_func_start ov45_0223A7E4
ov45_0223A7E4: ; 0x0223A7E4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x18
	ldr r3, [sp, #0x3c]
	ldr r1, [sp, #0x40]
	ldr r4, [sp, #0x48]
	cmp r3, r1
	ldr ip, [sp, #0x44]
	beq _0223A9A8
	ldr r1, [sp, #0x44]
	str r4, [sp, #0x14]
	str r1, [sp, #0x10]
	ldr r2, [r4, #8]
	ldr r5, [r4, #4]
	sub r6, r1, r2
	mov r2, r6, asr #2
	add r2, r6, r2, lsr #29
	cmp r5, r2, asr #3
	add r6, sp, #0x10
	ble _0223A84C
	ldr r5, [sp, #0x3c]
	ldr r2, [r5]
	str r2, [r1]
	ldr r2, [r5, #4]
	str r2, [r1, #4]
	b _0223A878
_0223A84C:
	cmp r1, #0
	beq _0223A868
	ldr r2, [sp, #0x3c]
	ldr r5, [r2]
	ldr r2, [r2, #4]
	str r5, [r1]
	str r2, [r1, #4]
_0223A868:
	ldr r2, [r6, #4]
	ldr r1, [r2, #4]
	add r1, r1, #1
	str r1, [r2, #4]
_0223A878:
	ldr r1, [sp, #0x40]
	add r3, r3, #8
	cmp r3, r1
	movne r1, #1
	moveq r1, #0
	add ip, ip, #8
	cmp r1, #0
	beq _0223A9A8
	cmp r1, #0
	add r2, sp, #0
	beq _0223A9A8
_0223A8A4:
	mov lr, ip
	mov r5, ip
	ldr r8, [sp, #0x44]
	add r1, sp, #8
	b _0223A91C
_0223A8B8:
	str lr, [sp, #8]
	str r4, [sp, #0xc]
	ldr r6, [r4, #8]
	ldr r7, [r4, #4]
	sub sb, lr, r6
	mov r6, sb, asr #2
	add r6, sb, r6, lsr #29
	cmp r7, r6, asr #3
	ble _0223A8F0
	ldr r6, [r5]
	str r6, [lr]
	ldr r6, [r5, #4]
	str r6, [lr, #4]
	b _0223A918
_0223A8F0:
	cmp lr, #0
	beq _0223A908
	ldr r7, [r5]
	ldr r6, [r5, #4]
	str r7, [lr]
	str r6, [lr, #4]
_0223A908:
	ldr r7, [r1, #4]
	ldr r6, [r7, #4]
	add r6, r6, #1
	str r6, [r7, #4]
_0223A918:
	sub lr, lr, #8
_0223A91C:
	cmp r5, r8
	beq _0223A934
	ldr r7, [r3]
	ldr r6, [r5, #-8]!
	cmp r7, r6
	blt _0223A8B8
_0223A934:
	str lr, [sp]
	str r4, [sp, #4]
	ldr r1, [r4, #8]
	ldr r5, [r4, #4]
	sub r6, lr, r1
	mov r1, r6, asr #2
	add r1, r6, r1, lsr #29
	cmp r5, r1, asr #3
	ble _0223A96C
	ldr r1, [r3]
	str r1, [lr]
	ldr r1, [r3, #4]
	str r1, [lr, #4]
	b _0223A994
_0223A96C:
	cmp lr, #0
	beq _0223A984
	ldr r5, [r3]
	ldr r1, [r3, #4]
	str r5, [lr]
	str r1, [lr, #4]
_0223A984:
	ldr r5, [r2, #4]
	ldr r1, [r5, #4]
	add r1, r1, #1
	str r1, [r5, #4]
_0223A994:
	ldr r1, [sp, #0x40]
	add r3, r3, #8
	cmp r3, r1
	add ip, ip, #8
	bne _0223A8A4
_0223A9A8:
	str ip, [r0]
	str r4, [r0, #4]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_0223A7E4

	arm_func_start ov45_0223A9C0
ov45_0223A9C0: ; 0x0223A9C0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr ip, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	cmp ip, r3
	ldrne r0, [sp, #0x18]
	addne lr, r0, #8
	cmpne lr, r3
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
_0223A9F4:
	sub r5, lr, #8
	ldr r1, [lr]
	ldr r0, [r5]
	cmp r1, r0
	bge _0223AA64
	ldr r2, [lr]
	ldr r1, [lr, #4]
	mov r4, r5
	str r0, [lr]
	ldr r0, [r5, #4]
	str r2, [sp]
	str r1, [sp, #4]
	str r0, [lr, #4]
	b _0223AA40
_0223AA2C:
	ldr r0, [r5]
	str r0, [r4]
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	sub r4, r4, #8
_0223AA40:
	cmp r5, ip
	beq _0223AA54
	ldr r0, [r5, #-8]!
	cmp r2, r0
	blt _0223AA2C
_0223AA54:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [r4]
	str r0, [r4, #4]
_0223AA64:
	add lr, lr, #8
	cmp lr, r3
	bne _0223A9F4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_0223A9C0

	arm_func_start ov45_0223AA80
ov45_0223AA80: ; 0x0223AA80
	stmdb sp!, {r4, r5, r6, lr}
	mov r6, r0
	mov r2, #0
	ldr r0, _0223AADC ; =ov45_02255198
	str r2, [r6]
	ldr r0, [r0, #4]
	mov r5, r1
	str r0, [r6, #4]
	cmp r5, #0
	ldmleia sp!, {r4, r5, r6, pc}
	ldr r4, _0223AAE0 ; =_ZSt7nothrow
_0223AAAC:
	mov r1, r4
	mov r0, r5, lsl #3
	bl _ZnamRKSt9nothrow_t
	str r0, [r6]
	cmp r0, #0
	strne r5, [r6, #4]
	ldmneia sp!, {r4, r5, r6, pc}
	add r0, r5, r5, lsr #31
	mov r5, r0, asr #1
	cmp r5, #0
	bgt _0223AAAC
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0223AADC: .word ov45_02255198
_0223AAE0: .word _ZSt7nothrow
	arm_func_end ov45_0223AA80

	arm_func_start ov45_0223AAE4
ov45_0223AAE4: ; 0x0223AAE4
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r1
	mov r4, r2
	sub r2, r4, r5
	mov r1, r2, asr #2
	add r1, r2, r1, lsr #29
	mov ip, r1, asr #3
	mov r6, r0
	str ip, [sp, #4]
	ldr r3, [r6, #8]
	cmp r3, r1, asr #3
	bhs _0223AB30
	mov r2, #0
	sub r1, ip, r3
	strb r2, [sp, #3]
	bl ov45_0223BED0
	mov r2, r0
	b _0223AC10
_0223AB30:
	ldr r1, [r6, #4]
	mov r0, r5
	cmp r1, ip
	addlo r1, r6, #4
	addhs r1, sp, #4
	ldr r1, [r1]
	ldr r2, [r6]
	add r0, r0, r1, lsl #3
	cmp r5, r0
	bhs _0223AB78
_0223AB58:
	ldr r1, [r5]
	str r1, [r2]
	ldr r1, [r5, #4]
	add r5, r5, #8
	str r1, [r2, #4]
	cmp r5, r0
	add r2, r2, #8
	blo _0223AB58
_0223AB78:
	ldr r3, [r6, #4]
	ldr r2, [sp, #4]
	cmp r2, r3
	bhs _0223ABA8
	mov r0, #0
	strb r0, [sp, #2]
	ldr r1, [r6, #4]
	sub r0, r3, r2
	sub r0, r1, r0
	add sp, sp, #8
	str r0, [r6, #4]
	ldmia sp!, {r4, r5, r6, pc}
_0223ABA8:
	cmp r3, r2
	addhs sp, sp, #8
	ldmhsia sp!, {r4, r5, r6, pc}
	mov r1, #0
	strb r1, [sp, #1]
	ldr r2, [r6]
	ldr r1, [r6, #4]
	cmp r0, r4
	addeq sp, sp, #8
	add r3, r2, r1, lsl #3
	ldmeqia sp!, {r4, r5, r6, pc}
_0223ABD4:
	cmp r3, #0
	beq _0223ABEC
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r2, [r3]
	str r1, [r3, #4]
_0223ABEC:
	ldr r1, [r6, #4]
	add r0, r0, #8
	add r1, r1, #1
	str r1, [r6, #4]
	cmp r0, r4
	add r3, r3, #8
	bne _0223ABD4
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
_0223AC10:
	ldr r1, [sp, #4]
	mov r0, r6
	bl ov45_0223BE60
	mov r0, #0
	strb r0, [sp]
	cmp r5, r4
	ldr r1, [r6]
	ldr r0, [r6, #4]
	addeq sp, sp, #8
	add r2, r1, r0, lsl #3
	ldmeqia sp!, {r4, r5, r6, pc}
_0223AC3C:
	cmp r2, #0
	beq _0223AC54
	ldr r1, [r5]
	ldr r0, [r5, #4]
	str r1, [r2]
	str r0, [r2, #4]
_0223AC54:
	ldr r0, [r6, #4]
	add r5, r5, #8
	add r0, r0, #1
	str r0, [r6, #4]
	cmp r5, r4
	add r2, r2, #8
	bne _0223AC3C
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_0223AAE4

	arm_func_start ov45_0223AC78
ov45_0223AC78: ; 0x0223AC78
	cmp r2, #0x10
	movlo r0, #0
	bxlo lr
	ldrh r0, [r1, #0xe]
	sub r0, r0, #1
	mov r0, r0, lsl #3
	add r0, r0, #0x18
	cmp r2, r0
	movhs r0, #1
	movlo r0, #0
	bx lr
	arm_func_end ov45_0223AC78

	arm_func_start ov45_0223ACA4
ov45_0223ACA4: ; 0x0223ACA4
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	mov r6, r0
	mov r5, r1
	mov r4, r2
	bl ov45_0223AE84
	mov r1, #0
	bic r2, r4, #7
	strb r1, [sp]
	sub r0, sp, #4
	strb r1, [r0]
	ldr r3, [r0]
	mov r1, r5
	add r0, r6, #0x50
	add r2, r5, r2
	bl ov45_0223ACF0
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov45_0223ACA4

	arm_func_start ov45_0223ACF0
ov45_0223ACF0: ; 0x0223ACF0
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	mov r5, r1
	mov r4, r2
	sub r2, r4, r5
	mov r1, r2, asr #2
	add r1, r2, r1, lsr #29
	mov ip, r1, asr #3
	mov r6, r0
	str ip, [sp, #4]
	ldr r3, [r6, #8]
	cmp r3, r1, asr #3
	bhs _0223AD3C
	mov r2, #0
	sub r1, ip, r3
	strb r2, [sp, #3]
	bl ov45_0223BD94
	mov r2, r0
	b _0223AE1C
_0223AD3C:
	ldr r1, [r6, #4]
	mov r0, r5
	cmp r1, ip
	addlo r1, r6, #4
	addhs r1, sp, #4
	ldr r1, [r1]
	ldr r2, [r6]
	add r0, r0, r1, lsl #3
	cmp r5, r0
	bhs _0223AD84
_0223AD64:
	ldr r1, [r5]
	str r1, [r2]
	ldr r1, [r5, #4]
	add r5, r5, #8
	str r1, [r2, #4]
	cmp r5, r0
	add r2, r2, #8
	blo _0223AD64
_0223AD84:
	ldr r3, [r6, #4]
	ldr r2, [sp, #4]
	cmp r2, r3
	bhs _0223ADB4
	mov r0, #0
	strb r0, [sp, #2]
	ldr r1, [r6, #4]
	sub r0, r3, r2
	sub r0, r1, r0
	add sp, sp, #8
	str r0, [r6, #4]
	ldmia sp!, {r4, r5, r6, pc}
_0223ADB4:
	cmp r3, r2
	addhs sp, sp, #8
	ldmhsia sp!, {r4, r5, r6, pc}
	mov r1, #0
	strb r1, [sp, #1]
	ldr r2, [r6]
	ldr r1, [r6, #4]
	cmp r0, r4
	addeq sp, sp, #8
	add r3, r2, r1, lsl #3
	ldmeqia sp!, {r4, r5, r6, pc}
_0223ADE0:
	cmp r3, #0
	beq _0223ADF8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r2, [r3]
	str r1, [r3, #4]
_0223ADF8:
	ldr r1, [r6, #4]
	add r0, r0, #8
	add r1, r1, #1
	str r1, [r6, #4]
	cmp r0, r4
	add r3, r3, #8
	bne _0223ADE0
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
_0223AE1C:
	ldr r1, [sp, #4]
	mov r0, r6
	bl ov45_0223BD24
	mov r0, #0
	strb r0, [sp]
	cmp r5, r4
	ldr r1, [r6]
	ldr r0, [r6, #4]
	addeq sp, sp, #8
	add r2, r1, r0, lsl #3
	ldmeqia sp!, {r4, r5, r6, pc}
_0223AE48:
	cmp r2, #0
	beq _0223AE60
	ldr r1, [r5]
	ldr r0, [r5, #4]
	str r1, [r2]
	str r0, [r2, #4]
_0223AE60:
	ldr r0, [r6, #4]
	add r5, r5, #8
	add r0, r0, #1
	str r0, [r6, #4]
	cmp r5, r4
	add r2, r2, #8
	bne _0223AE48
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_0223ACF0

	arm_func_start ov45_0223AE84
ov45_0223AE84: ; 0x0223AE84
	stmdb sp!, {r3}
	sub sp, sp, #4
	tst r2, #7
	addne sp, sp, #4
	movne r0, #0
	ldmneia sp!, {r3}
	bxne lr
	cmp r2, #0
	addne sp, sp, #4
	movne r0, #1
	ldmneia sp!, {r3}
	bxne lr
	ldr r2, [r0, #0x54]
	mov r1, #0
	strb r1, [sp]
	ldr r1, [r0, #0x54]
	sub r1, r1, r2
	str r1, [r0, #0x54]
	mov r0, #1
	add sp, sp, #4
	ldmia sp!, {r3}
	bx lr
	arm_func_end ov45_0223AE84

	arm_func_start ov45_0223AEDC
ov45_0223AEDC: ; 0x0223AEDC
	stmdb sp!, {r3, lr}
	ldr r2, [r0, #0x334]
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r0, r0, #0x5c
	mov r2, #0x2d8
	bl MI_CpuCopy8
	mov r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov45_0223AEDC

	arm_func_start ov45_0223AF04
ov45_0223AF04: ; 0x0223AF04
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	add r1, r4, #0x5c
	mov r2, #0x2d8
	bl MI_CpuCopy8
	mov r0, #1
	str r0, [r4, #0x334]
	ldmia sp!, {r4, pc}
	arm_func_end ov45_0223AF04

	arm_func_start ov45_0223AF28
ov45_0223AF28: ; 0x0223AF28
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x3c
	mov r4, r0
	ldr r1, [r4]
	cmp r1, #5
	addls pc, pc, r1, lsl #2
	b _0223B0F8
_0223AF44: ; jump table
	b _0223B0F8 ; case 0
	b _0223B0F8 ; case 1
	b _0223B0F8 ; case 2
	b _0223B0F8 ; case 3
	b _0223AF5C ; case 4
	b _0223AFE0 ; case 5
_0223AF5C:
	bl ov45_0223B104
	cmp r0, #0
	addeq sp, sp, #0x3c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl ov45_022310B0
	mov r1, r0
	add r0, sp, #0x30
	add r1, r1, #0xb8
	bl ov45_022320B4
	ldr r0, [sp, #0x30]
	ldr r1, _0223B100 ; =ov45_02254D9C
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #0x31
	ldrne r0, [sp, #0x38]
	bl ov45_02241D58
	add r0, sp, #0x30
	bl ov45_02237BC8
	mov r1, #0
	str r1, [sp, #0x10]
	mov r5, #4
	add r0, sp, #0x10
	str r1, [sp]
	str r0, [sp, #4]
	mov r3, r1
	sub r0, r5, #5
	mov r2, #1
	str r5, [sp, #8]
	bl ov45_0223325C
	mov r0, r4
	bl ov45_0223B1C8
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223AFE0:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	addeq sp, sp, #0x3c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r5, [r4, #0x38]
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	add r0, r0, r5, lsr #7
	bl _u32_div_f
	ldr r2, [r4, #0x40]
	add r0, sp, #0x14
	ldr r6, [r2, r1, lsl #2]
	mov r5, r5, lsl #0x19
	add r1, sp, #0x24
	add r7, r6, r5, lsr #22
	bl ov00_021ECB94
	add r0, sp, #0x14
	add r1, sp, #0x24
	bl RTC_ConvertDateTimeToSecond
	mov r8, r0
	ldr r2, [r4, #0x10]
	ldr r3, [r6, r5, lsr #22]
	ldr r0, [r4, #0x14]
	mov sl, r1
	subs r2, r8, r2
	sbc r1, sl, r0
	subs r0, r2, r3
	sbcs r0, r1, r3, asr #31
	addlt sp, sp, #0x3c
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	sub r5, sp, #4
	add r6, sp, #0xc
	mov fp, #0
_0223B064:
	bl ov45_022310B0
	mov r1, r0
	ldr r0, [r7, #4]
	ldr r1, [r1, #0x30]
	blx r1
	strb fp, [r6]
	and r2, fp, #0xff
	strb r2, [r5]
	ldr r2, [r5]
	add r0, r4, #0x38
	mov r1, #1
	bl ov45_0223B81C
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	addeq sp, sp, #0x3c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr sb, [r4, #0x38]
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x4c]
	add r0, r0, sb, lsr #7
	bl _u32_div_f
	ldr r0, [r4, #0x40]
	mov r2, sb, lsl #0x19
	ldr r1, [r0, r1, lsl #2]
	ldr r0, [r1, r2, lsr #22]
	add r1, r1, r2, lsr #22
	str r0, [r7]
	ldr r0, [r1, #4]
	str r0, [r7, #4]
	ldr r1, [r4, #0x10]
	ldr r3, [r7]
	ldr r0, [r4, #0x14]
	subs r2, r8, r1
	sbc r1, sl, r0
	subs r0, r2, r3
	sbcs r0, r1, r3, asr #31
	bge _0223B064
_0223B0F8:
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0223B100: .word ov45_02254D9C
	arm_func_end ov45_0223AF28

	arm_func_start ov45_0223B104
ov45_0223B104: ; 0x0223B104
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x1c
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #5
	beq _0223B12C
	bl ov45_022310B0
	ldr r0, [r0]
	cmp r0, #8
	beq _0223B138
_0223B12C:
	add sp, sp, #0x1c
	mov r0, #0
	ldmia sp!, {r3, r4, pc}
_0223B138:
	ldr r2, [r4, #0x10]
	ldr r1, [r4, #0x14]
	mov r0, #0
	cmp r1, r0
	cmpeq r2, r0
	addne sp, sp, #0x1c
	ldmneia sp!, {r3, r4, pc}
	ldr r0, [r4, #0x18]
	cmp r0, #0
	addne sp, sp, #0x1c
	movne r0, #1
	ldmneia sp!, {r3, r4, pc}
	bl ov45_022310B0
	add r0, r0, #0xe8
	bl ov45_0223DFC8
	cmp r0, #0
	addne sp, sp, #0x1c
	movne r0, #1
	ldmneia sp!, {r3, r4, pc}
	add r0, sp, #0
	add r1, sp, #0x10
	bl ov00_021ECB94
	add r0, sp, #0
	add r1, sp, #0x10
	bl RTC_ConvertDateTimeToSecond
	ldr ip, [r4, #8]
	ldr r2, [r4, #0x1c]
	ldr r3, [r4, #0xc]
	adds r4, ip, r2
	adc r2, r3, #0
	subs r0, r4, r0
	sbcs r0, r2, r1
	movlt r0, #1
	movge r0, #0
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_0223B104

	arm_func_start ov45_0223B1C8
ov45_0223B1C8: ; 0x0223B1C8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x1c
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #5
	beq _0223B23C
	bl ov45_022310B0
	ldr r0, [r0]
	cmp r0, #8
	bne _0223B23C
	add r0, sp, #0
	add r1, sp, #0x10
	bl ov00_021ECB94
	add r0, sp, #0
	add r1, sp, #0x10
	bl RTC_ConvertDateTimeToSecond
	str r0, [r4, #0x10]
	str r1, [r4, #0x14]
	mov r0, #5
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #0x18]
	bl ov45_022310B0
	ldr r1, [r0, #0x30]
	mov r0, #0
	blx r1
	add sp, sp, #0x1c
	mov r0, #1
	ldmia sp!, {r3, r4, pc}
_0223B23C:
	mov r0, #1
	str r0, [r4, #0x18]
	mov r0, #0
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_0223B1C8

	arm_func_start ov45_0223B250
ov45_0223B250: ; 0x0223B250
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	mov r5, r1
	ldr r1, [r5]
	mov r4, r2
	mov r6, r0
	add r4, r4, r1
	ldr r3, [r5, #8]
	ldr r1, [r5, #0xc]
	ldr r0, [r5, #0x14]
	add r2, r3, r1, lsl #2
	add r1, r3, r0, lsl #2
	str r1, [sp, #0xc]
	add r0, sp, #0
	str r2, [sp]
	str r3, [sp, #4]
	str r2, [sp, #8]
	mov r1, r4, lsr #7
	bl ov45_0223CD78
	ldr r0, [r5, #0x10]
	ldr r1, [sp]
	cmp r0, #0
	moveq r5, #0
	ldr r0, [sp, #4]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	ldrne r5, [r1]
	str r1, [r6]
	stmib r6, {r0, r2}
	mov r0, r4, lsl #0x19
	str r3, [r6, #0xc]
	add r0, r5, r0, lsr #22
	str r0, [r6, #0x10]
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_0223B250

	arm_func_start ov45_0223B2DC
ov45_0223B2DC: ; 0x0223B2DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xbc
	mov r5, r0
	tst r1, #0x7f
	movne r0, #1
	moveq r0, #0
	mov r8, #0
	add r4, r0, r1, lsr #7
	mov r7, r8
	add r6, sp, #0x28
	b _0223B378
_0223B308:
	ldr r1, [r5, #8]
	ldr r0, [r5, #0xc]
	ldr sb, [r1, r0, lsl #2]
	strb r8, [sp, #0x13]
	ldr r0, [r5, #0xc]
	add r1, r0, #1
	str r1, [r5, #0xc]
	ldr r0, [r5, #0x14]
	cmp r1, r0
	streq r8, [r5, #0xc]
	ldr r0, [r5, #0x10]
	sub r1, r0, #1
	str r1, [r5, #0x10]
	ldr r0, [r5, #0xc]
	add r0, r0, r1
	ldr r1, [r5, #0x14]
	sub r0, r0, #1
	bl _u32_div_f
	ldr r2, [r5, #8]
	add r0, r5, #8
	str sb, [r2, r1, lsl #2]
	mov r1, r6
	str r7, [sp, #0x28]
	bl ov45_0223BA3C
	ldr r0, [r5]
	sub r4, r4, #1
	sub r0, r0, #0x80
	str r0, [r5]
_0223B378:
	cmp r4, #0
	beq _0223B38C
	ldr r0, [r5]
	cmp r0, #0x80
	bhs _0223B308
_0223B38C:
	cmp r4, #0
	addeq sp, sp, #0xbc
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, _0223B758 ; =ov45_022577C8
	ldr r2, [r1]
	tst r2, #1
	bne _0223B3BC
	ldr r0, _0223B75C ; =ov45_022551A8
	orr r2, r2, #1
	mvn r3, #0xff
	str r3, [r0]
	str r2, [r1]
_0223B3BC:
	ldr r1, _0223B75C ; =ov45_022551A8
	mov r6, r4, lsl #7
	ldr r0, [r1]
	cmp r0, r4, lsl #7
	blo _0223B418
	ldr r0, _0223B758 ; =ov45_022577C8
	ldr r2, [r0]
	tst r2, #1
	bne _0223B3F0
	orr r2, r2, #1
	mvn r3, #0xff
	str r3, [r1]
	str r2, [r0]
_0223B3F0:
	ldr r1, [r5, #0x10]
	ldr r0, _0223B75C ; =ov45_022551A8
	cmp r1, #0
	ldr r2, [r0]
	moveq r1, #0
	subne r0, r1, #1
	movne r1, r0, lsl #7
	sub r0, r2, r6
	cmp r1, r0
	bls _0223B420
_0223B418:
	ldr r0, _0223B760 ; =ov45_022551AC
	bl ov45_0223B8D0
_0223B420:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	moveq r1, #0
	subne r1, r0, #1
	ldr r0, [r5, #0x10]
	add r0, r4, r0
	cmp r0, r1
	bhi _0223B4A4
	cmp r4, #0
	addeq sp, sp, #0xbc
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	mov r7, #0x400
	mov sb, #0
	add r8, sp, #0x24
_0223B458:
	mov r0, r7
	bl ov45_02242394
	ldr r3, [r5, #0xc]
	ldr r2, [r5, #0x10]
	ldr r1, [r5, #0x14]
	add r2, r3, r2
	mov r6, r0
	sub r0, r2, #1
	bl _u32_div_f
	ldr r2, [r5, #8]
	add r0, r5, #8
	str r6, [r2, r1, lsl #2]
	mov r1, r8
	str sb, [sp, #0x24]
	bl ov45_0223BA3C
	subs r4, r4, #1
	bne _0223B458
	add sp, sp, #0xbc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_0223B4A4:
	movs r1, #0
	add r6, sp, #0xac
	str r1, [sp, #0xa4]
	str r1, [sp, #0xa8]
	str r1, [sp, #0x74]
	str r1, [sp, #0x78]
	str r1, [sp, #0x7c]
	str r1, [sp, #0x80]
	str r1, [r6]
	str r1, [r6, #4]
	str r1, [r6, #8]
	str r1, [r6, #0xc]
	add r8, sp, #0x74
	beq _0223B4E4
	add r0, r1, r1
	bl _u32_div_f
_0223B4E4:
	ldr r7, [r8]
	ldr r2, [r8, #4]
	ldr r0, [r8, #0xc]
	add r3, r7, r2, lsl #2
	add r2, r7, r0, lsl #2
	add r8, r7, r1, lsl #2
	ldrb r1, [sp, #0x12]
	add r0, sp, #0x84
	str r8, [sp, #0x84]
	str r7, [sp, #0x88]
	str r7, [sp, #0x98]
	str r3, [sp, #0x8c]
	str r2, [sp, #0x90]
	str r0, [sp, #4]
	add r0, sp, #0x94
	strb r1, [sp, #8]
	sub r7, sp, #0xc
	str r3, [sp, #0x94]
	str r3, [sp, #0x9c]
	str r2, [sp, #0xa0]
	ldmia r0, {r0, r1, r2, r3}
	stmia r7, {r0, r1, r2, r3}
	mov r0, r6
	ldmia r7, {r1, r2, r3}
	bl ov45_0223CE90
	add r0, sp, #0x74
	bl ov45_02238508
	ldr r0, [r5, #0x10]
	add r8, sp, #0xac
	add r0, r4, r0
	add r0, r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x14]
	cmp r0, #0
	moveq r2, #0
	subne r2, r0, #1
	ldr r0, [sp, #0x1c]
	mov r1, r2, lsl #1
	cmp r0, r2, lsl #1
	addhi r0, sp, #0x1c
	addls r0, sp, #0x20
	str r1, [sp, #0x20]
	ldr r1, [r0]
	mov r0, r8
	bl ov45_0223B8E0
	mov r2, #0
	add r1, sp, #0x18
	mov r0, r8
	str r2, [sp, #0x18]
	bl ov45_0223BA3C
	cmp r4, #0
	beq _0223B604
	mov r7, #0x400
	mov sl, #0
	add sb, sp, #0x14
_0223B5C0:
	mov r0, r7
	bl ov45_02242394
	ldr r3, [r8, #4]
	ldr r2, [r8, #8]
	ldr r1, [r8, #0xc]
	add r2, r3, r2
	mov r6, r0
	sub r0, r2, #1
	bl _u32_div_f
	ldr r2, [r8]
	mov r0, r8
	str r6, [r2, r1, lsl #2]
	mov r1, sb
	str sl, [sp, #0x14]
	bl ov45_0223BA3C
	subs r4, r4, #1
	bne _0223B5C0
_0223B604:
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _0223B6F4
	ldr r1, [r5, #0x14]
	cmp r1, #0
	moveq r1, #0
	beq _0223B630
	ldr r2, [r5, #0xc]
	ldr r0, [r5, #0x10]
	add r0, r2, r0
	bl _u32_div_f
_0223B630:
	ldr r4, [r5, #8]
	ldr r2, [r5, #0xc]
	ldr r0, [r5, #0x14]
	add r3, r4, r2, lsl #2
	add r2, r4, r0, lsl #2
	add r1, r4, r1, lsl #2
	str r1, [sp, #0x64]
	add r0, sp, #0x64
	str r4, [sp, #0x68]
	str r3, [sp, #0x6c]
	str r2, [sp, #0x70]
	mvn r1, #0
	bl ov45_0223CD78
	ldr r0, [r5, #8]
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #0x14]
	add sb, r0, r2, lsl #2
	mov r6, #0
	ldr r7, [r8]
	ldr r2, [r8, #0xc]
	ldr r3, [r8, #4]
	add r2, r7, r2, lsl #2
	add r4, r7, r3, lsl #2
	ldr r3, [sp, #0x64]
	str r2, [sp, #0x38]
	ldr r2, [sp, #0x68]
	str r3, [sp, #0x50]
	ldr r3, [sp, #0x6c]
	str r2, [sp, #0x54]
	ldr r2, [sp, #0x70]
	str r7, [sp, #0x30]
	add r7, r0, r1, lsl #2
	str r3, [sp, #0x58]
	str r2, [sp, #0x5c]
	str r0, [sp, #0x40]
	add r1, sp, #0x2c
	add r2, sp, #0x3c
	add r3, sp, #0x50
	str r7, [sp, #0x48]
	strb r6, [sp, #0xe]
	strb r6, [sp, #0xf]
	strb r6, [sp, #0xd]
	mov r0, r8
	str sb, [sp, #0x3c]
	str sb, [sp, #0x44]
	str r4, [sp, #0x2c]
	str r4, [sp, #0x34]
	strb r6, [sp]
	bl ov45_0223BF9C
_0223B6F4:
	ldr r2, [r5, #8]
	ldr r1, [r8]
	add r0, sp, #0xa4
	str r1, [r5, #8]
	str r2, [r8]
	ldr r3, [r5, #0xc]
	ldr r1, [r8, #4]
	mov r2, #0
	str r1, [r5, #0xc]
	str r3, [r8, #4]
	ldr r3, [r5, #0x10]
	ldr r1, [r8, #8]
	str r1, [r5, #0x10]
	str r3, [r8, #8]
	ldr r3, [r5, #0x14]
	ldr r1, [r8, #0xc]
	str r1, [r5, #0x14]
	ldr r1, [r8, #8]
	str r3, [r8, #0xc]
	sub r1, r1, r1
	strb r2, [sp, #0xc]
	str r1, [r8, #8]
	bl ov45_0223CA14
	add sp, sp, #0xbc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_0223B758: .word ov45_022577C8
_0223B75C: .word ov45_022551A8
_0223B760: .word ov45_022551AC
	arm_func_end ov45_0223B2DC

	arm_func_start ov45_0223B764
ov45_0223B764: ; 0x0223B764
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	cmp r1, #0
	mov r6, r0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, [r6, #4]
	sub r0, r0, r1
	str r0, [r6, #4]
	ldr r0, [r6, #0x10]
	cmp r0, #0
	moveq r2, #0
	subne r0, r0, #1
	movne r2, r0, lsl #7
	ldmia r6, {r0, r1}
	add r0, r0, r1
	sub r5, r2, r0
	cmp r5, #0x100
	addlo sp, sp, #4
	ldmloia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	mov r8, #0
	mov r7, r8
	mov r4, r8
_0223B7C0:
	strb r4, [sp]
	ldr r0, [r6, #0x10]
	sub r1, r0, #1
	str r1, [r6, #0x10]
	ldr r0, [r6, #0xc]
	add r0, r0, r1
	ldr r1, [r6, #0x14]
	sub r0, r0, #1
	bl _u32_div_f
	ldr sb, [r6, #8]
	mov sl, r1
	ldr r1, [sb, sl, lsl #2]
	cmp r1, #0
	beq _0223B804
	mov r0, r8
	mov r2, r8
	bl ov00_021EC2EC
_0223B804:
	sub r5, r5, #0x80
	str r7, [sb, sl, lsl #2]
	cmp r5, #0x100
	bhs _0223B7C0
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov45_0223B764

	arm_func_start ov45_0223B81C
ov45_0223B81C: ; 0x0223B81C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #4
	cmp r1, #0
	mov r6, r0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	ldr r0, [r6, #4]
	sub r0, r0, r1
	str r0, [r6, #4]
	ldr r0, [r6]
	add r0, r0, r1
	str r0, [r6]
	cmp r0, #0x100
	blo _0223B8B8
	mov r5, #0
	mov r4, r5
_0223B85C:
	ldr r1, [r6, #8]
	ldr r0, [r6, #0xc]
	ldr r1, [r1, r0, lsl #2]
	cmp r1, #0
	beq _0223B87C
	mov r0, r5
	mov r2, r5
	bl ov00_021EC2EC
_0223B87C:
	strb r4, [sp]
	ldr r0, [r6, #0xc]
	add r1, r0, #1
	str r1, [r6, #0xc]
	ldr r0, [r6, #0x14]
	cmp r1, r0
	streq r4, [r6, #0xc]
	ldr r0, [r6, #0x10]
	sub r0, r0, #1
	str r0, [r6, #0x10]
	ldr r0, [r6]
	sub r0, r0, #0x80
	str r0, [r6]
	cmp r0, #0x100
	bhs _0223B85C
_0223B8B8:
	ldr r0, [r6, #4]
	cmp r0, #0
	moveq r0, #0x40
	streq r0, [r6]
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov45_0223B81C

	arm_func_start ov45_0223B8D0
ov45_0223B8D0: ; 0x0223B8D0
	stmdb sp!, {r3, lr}
	bl printf
	bl abort
	ldmia sp!, {r3, pc}
	arm_func_end ov45_0223B8D0

	arm_func_start ov45_0223B8E0
ov45_0223B8E0: ; 0x0223B8E0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x38
	mov r4, r0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	moveq r0, #0
	subne r0, r0, #1
	cmp r1, r0
	addls sp, sp, #0x38
	ldmlsia sp!, {r3, r4, r5, pc}
	mov r2, #0
	add r0, r4, #0xc
	str r0, [sp, #0x34]
	str r2, [sp, #0x24]
	str r2, [sp, #0x28]
	str r2, [sp, #0x2c]
	str r2, [sp, #0x30]
	strb r2, [sp, #2]
	sub r0, sp, #4
	strb r2, [r0]
	ldr r2, [r0]
	add r0, sp, #0x24
	bl ov45_0223CB04
	ldr r1, [r4, #0xc]
	cmp r1, #0
	moveq r1, #0
	beq _0223B95C
	ldr r2, [r4, #4]
	ldr r0, [r4, #8]
	add r0, r2, r0
	bl _u32_div_f
_0223B95C:
	ldr r0, [r4]
	mov ip, #0
	add r0, r0, r1, lsl #2
	str r0, [sp, #4]
	ldr r2, [r4]
	sub r3, sp, #4
	str r2, [sp, #8]
	ldr r0, [r4, #4]
	add r0, r2, r0, lsl #2
	str r0, [sp, #0xc]
	ldr r1, [r4, #0xc]
	add r0, sp, #0x24
	add r1, r2, r1, lsl #2
	str r1, [sp, #0x10]
	ldr r5, [r4]
	ldr r2, [r4, #4]
	add r1, sp, #0x14
	add r2, r5, r2, lsl #2
	str r2, [sp, #0x14]
	ldr r5, [r4]
	add r2, sp, #4
	str r5, [sp, #0x18]
	ldr lr, [r4, #4]
	add lr, r5, lr, lsl #2
	str lr, [sp, #0x1c]
	ldr lr, [r4, #0xc]
	add lr, r5, lr, lsl #2
	str lr, [sp, #0x20]
	strb ip, [sp, #1]
	strb ip, [r3]
	ldr r3, [r3]
	bl ov45_0223CC78
	mov r0, #0
	strb r0, [sp]
	str r0, [r4, #8]
	ldr r1, [r4]
	ldr r0, [sp, #0x24]
	add r3, sp, #0x30
	str r0, [r4]
	str r1, [sp, #0x24]
	ldr r2, [r4, #4]
	ldr r1, [sp, #0x28]
	add r0, sp, #0x24
	str r1, [r4, #4]
	str r2, [sp, #0x28]
	ldr r2, [r4, #8]
	ldr r1, [sp, #0x2c]
	str r1, [r4, #8]
	str r2, [sp, #0x2c]
	ldr r2, [r4, #0xc]
	ldr r1, [r3]
	str r1, [r4, #0xc]
	str r2, [r3]
	bl ov45_0223CAB4
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0223B8E0

	arm_func_start ov45_0223BA3C
ov45_0223BA3C: ; 0x0223BA3C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x38
	mov r5, r0
	ldr r3, [r5, #8]
	mov r4, r1
	ldr r1, [r5, #0xc]
	add r2, r3, #1
	cmp r2, r1
	bhs _0223BA90
	ldr r0, [r5, #4]
	add r0, r0, r3
	bl _u32_div_f
	ldr r0, [r5]
	add sp, sp, #0x38
	adds r1, r0, r1, lsl #2
	ldrne r0, [r4]
	strne r0, [r1]
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	ldmia sp!, {r3, r4, r5, pc}
_0223BA90:
	mov r3, #0
	add r2, r5, #0xc
	mov r1, #1
	str r3, [sp, #0x24]
	str r3, [sp, #0x28]
	str r3, [sp, #0x2c]
	str r3, [sp, #0x30]
	str r2, [sp, #0x34]
	bl ov45_0223BBFC
	mov r3, #0
	mov r1, r0
	strb r3, [sp, #2]
	sub r0, sp, #4
	strb r3, [r0]
	ldr r2, [r0]
	add r0, sp, #0x24
	strb r3, [sp, #3]
	bl ov45_0223CB04
	ldr r1, [r5, #8]
	ldr r0, [sp, #0x24]
	str r1, [sp, #0x28]
	adds r1, r0, r1, lsl #2
	ldrne r0, [r4]
	strne r0, [r1]
	ldr r0, [sp, #0x2c]
	add r0, r0, #1
	str r0, [sp, #0x2c]
	ldr r1, [r5, #0xc]
	cmp r1, #0
	moveq r1, #0
	beq _0223BB1C
	ldr r2, [r5, #4]
	ldr r0, [r5, #8]
	add r0, r2, r0
	bl _u32_div_f
_0223BB1C:
	ldr r0, [r5]
	mov r4, #0
	add r0, r0, r1, lsl #2
	str r0, [sp, #4]
	ldr r2, [r5]
	sub r3, sp, #4
	str r2, [sp, #8]
	ldr r0, [r5, #4]
	add r0, r2, r0, lsl #2
	str r0, [sp, #0xc]
	ldr r1, [r5, #0xc]
	add r0, sp, #0x24
	add r1, r2, r1, lsl #2
	str r1, [sp, #0x10]
	ldr ip, [r5]
	ldr r2, [r5, #4]
	add r1, sp, #0x14
	add r2, ip, r2, lsl #2
	str r2, [sp, #0x14]
	ldr lr, [r5]
	add r2, sp, #4
	str lr, [sp, #0x18]
	ldr ip, [r5, #4]
	add ip, lr, ip, lsl #2
	str ip, [sp, #0x1c]
	ldr ip, [r5, #0xc]
	add ip, lr, ip, lsl #2
	str ip, [sp, #0x20]
	strb r4, [sp, #1]
	strb r4, [r3]
	ldr r3, [r3]
	bl ov45_0223CB6C
	mov r0, r4
	strb r0, [sp]
	str r0, [r5, #8]
	ldr r1, [r5]
	ldr r0, [sp, #0x24]
	add r3, sp, #0x30
	str r0, [r5]
	str r1, [sp, #0x24]
	ldr r2, [r5, #4]
	ldr r1, [sp, #0x28]
	add r0, sp, #0x24
	str r1, [r5, #4]
	str r2, [sp, #0x28]
	ldr r2, [r5, #8]
	ldr r1, [sp, #0x2c]
	str r1, [r5, #8]
	str r2, [sp, #0x2c]
	ldr r2, [r5, #0xc]
	ldr r1, [r3]
	str r1, [r5, #0xc]
	str r2, [r3]
	bl ov45_0223CAB4
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0223BA3C

	arm_func_start ov45_0223BBFC
ov45_0223BBFC: ; 0x0223BBFC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	ldr r2, _0223BCFC ; =ov45_022577D0
	ldr r3, [r2]
	tst r3, #1
	bne _0223BC2C
	ldr r1, _0223BD00 ; =ov45_022551A4
	orr r3, r3, #1
	mvn r4, #0xc0000001
	str r4, [r1]
	str r3, [r2]
_0223BC2C:
	ldr r1, [r0, #0xc]
	ldr r0, _0223BD00 ; =ov45_022551A4
	cmp r1, #0
	moveq r5, #0
	subne r5, r1, #1
	ldr r4, [r0]
	ldr r1, [sp, #0x1c]
	sub r0, r4, r5
	cmp r1, r0
	bls _0223BC58
	bl ov45_0223BD0C
_0223BC58:
	ldr r0, _0223BD04 ; =0xAAAAAAAB
	umull r0, r1, r4, r0
	mov r1, r1, lsr #1
	cmp r5, r1
	bhs _0223BCAC
	add r1, r5, #1
	ldr r0, _0223BD08 ; =0xCCCCCCCD
	add r1, r1, r1, lsl #1
	umull r0, r2, r1, r0
	mov r2, r2, lsr #2
	ldr r0, [sp, #0x1c]
	str r2, [sp, #4]
	cmp r0, r2
	addhi r0, sp, #0x1c
	addls r0, sp, #4
	ldr r0, [r0]
	add sp, sp, #8
	add r0, r5, r0
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_0223BCAC:
	cmp r5, r1, lsl #1
	bhs _0223BCE8
	ldr r0, [sp, #0x1c]
	add r1, r5, #1
	mov r2, r1, lsr #1
	cmp r0, r1, lsr #1
	addhi r0, sp, #0x1c
	str r2, [sp]
	addls r0, sp, #0
	ldr r0, [r0]
	add sp, sp, #8
	add r0, r5, r0
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_0223BCE8:
	mov r0, r4
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_0223BCFC: .word ov45_022577D0
_0223BD00: .word ov45_022551A4
_0223BD04: .word 0xAAAAAAAB
_0223BD08: .word 0xCCCCCCCD
	arm_func_end ov45_0223BBFC

	arm_func_start ov45_0223BD0C
ov45_0223BD0C: ; 0x0223BD0C
	stmdb sp!, {r3, lr}
	ldr r0, _0223BD20 ; =ov45_022551C4
	bl printf
	bl abort
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0223BD20: .word ov45_022551C4
	arm_func_end ov45_0223BD0C

	arm_func_start ov45_0223BD24
ov45_0223BD24: ; 0x0223BD24
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r3, [r5, #4]
	mov r0, #0
	strb r0, [sp, #2]
	ldr r1, [r5, #4]
	mov r4, r2
	sub r1, r1, r3
	str r1, [r5, #4]
	ldr r1, [r5]
	cmp r1, #0
	beq _0223BD6C
	beq _0223BD60
	mov r2, r0
	bl ov00_021EC2EC
_0223BD60:
	mov r0, #0
	str r0, [r5]
	str r0, [r5, #8]
_0223BD6C:
	mov r3, #0
	strb r3, [sp]
	sub r0, sp, #4
	strb r3, [r0]
	ldr r2, [r0]
	mov r0, r5
	mov r1, r4
	strb r3, [sp, #1]
	bl ov45_0223CE30
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0223BD24

	arm_func_start ov45_0223BD94
ov45_0223BD94: ; 0x0223BD94
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r4, [r0, #8]
	mvn r0, #0xe0000000
	ldr r1, [sp, #0x14]
	sub r0, r0, r4
	cmp r1, r0
	bls _0223BDBC
	bl _ZNSt15__vector_commonILb1EE18throw_length_errorEv
_0223BDBC:
	ldr r0, _0223BE58 ; =0x0AAAAAAA
	cmp r4, r0
	bhs _0223BE08
	add r1, r4, #1
	ldr r0, _0223BE5C ; =0xCCCCCCCD
	add r1, r1, r1, lsl #1
	umull r0, r2, r1, r0
	mov r2, r2, lsr #2
	ldr r0, [sp, #0x14]
	str r2, [sp, #4]
	cmp r0, r2
	addhi r0, sp, #0x14
	addls r0, sp, #4
	ldr r0, [r0]
	add sp, sp, #8
	add r0, r4, r0
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0223BE08:
	cmp r4, r0, lsl #1
	bhs _0223BE44
	ldr r0, [sp, #0x14]
	add r1, r4, #1
	mov r2, r1, lsr #1
	cmp r0, r1, lsr #1
	addhi r0, sp, #0x14
	str r2, [sp]
	addls r0, sp, #0
	ldr r0, [r0]
	add sp, sp, #8
	add r0, r4, r0
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0223BE44:
	mvn r0, #0xe0000000
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_0223BE58: .word 0x0AAAAAAA
_0223BE5C: .word 0xCCCCCCCD
	arm_func_end ov45_0223BD94

	arm_func_start ov45_0223BE60
ov45_0223BE60: ; 0x0223BE60
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r3, [r5, #4]
	mov r0, #0
	strb r0, [sp, #2]
	ldr r1, [r5, #4]
	mov r4, r2
	sub r1, r1, r3
	str r1, [r5, #4]
	ldr r1, [r5]
	cmp r1, #0
	beq _0223BEA8
	beq _0223BE9C
	mov r2, r0
	bl ov00_021EC2EC
_0223BE9C:
	mov r0, #0
	str r0, [r5]
	str r0, [r5, #8]
_0223BEA8:
	mov r3, #0
	strb r3, [sp]
	sub r0, sp, #4
	strb r3, [r0]
	ldr r2, [r0]
	mov r0, r5
	mov r1, r4
	strb r3, [sp, #1]
	bl ov45_0223CE60
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0223BE60

	arm_func_start ov45_0223BED0
ov45_0223BED0: ; 0x0223BED0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r4, [r0, #8]
	mvn r0, #0xe0000000
	ldr r1, [sp, #0x14]
	sub r0, r0, r4
	cmp r1, r0
	bls _0223BEF8
	bl _ZNSt15__vector_commonILb1EE18throw_length_errorEv
_0223BEF8:
	ldr r0, _0223BF94 ; =0x0AAAAAAA
	cmp r4, r0
	bhs _0223BF44
	add r1, r4, #1
	ldr r0, _0223BF98 ; =0xCCCCCCCD
	add r1, r1, r1, lsl #1
	umull r0, r2, r1, r0
	mov r2, r2, lsr #2
	ldr r0, [sp, #0x14]
	str r2, [sp, #4]
	cmp r0, r2
	addhi r0, sp, #0x14
	addls r0, sp, #4
	ldr r0, [r0]
	add sp, sp, #8
	add r0, r4, r0
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0223BF44:
	cmp r4, r0, lsl #1
	bhs _0223BF80
	ldr r0, [sp, #0x14]
	add r1, r4, #1
	mov r2, r1, lsr #1
	cmp r0, r1, lsr #1
	addhi r0, sp, #0x14
	str r2, [sp]
	addls r0, sp, #0
	ldr r0, [r0]
	add sp, sp, #8
	add r0, r4, r0
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0223BF80:
	mvn r0, #0xe0000000
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_0223BF94: .word 0x0AAAAAAA
_0223BF98: .word 0xCCCCCCCD
	arm_func_end ov45_0223BED0

	arm_func_start ov45_0223BF9C
ov45_0223BF9C: ; 0x0223BF9C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1a4
	mov sb, r2
	mov r8, r3
	ldrb r6, [r8, #0x10]
	ldrb r2, [sb, #0x10]
	str r1, [sp]
	mov sl, r0
	ldr ip, [r8, #4]
	ldr fp, [r8, #8]
	ldr r7, [r8, #0xc]
	ldr r5, [sb]
	ldr r4, [sb, #4]
	ldr r3, [sb, #8]
	ldr lr, [sb, #0xc]
	ldr r1, [r8]
	add r0, sp, #0x5c
	str r1, [sp, #0x5c]
	add r1, sp, #0x48
	strb r6, [sp, #0x168]
	strb r2, [sp, #0x17c]
	str ip, [sp, #0x60]
	str fp, [sp, #0x64]
	str r7, [sp, #0x68]
	strb r6, [sp, #0x6c]
	str r5, [sp, #0x48]
	str r4, [sp, #0x4c]
	str r3, [sp, #0x50]
	str lr, [sp, #0x54]
	strb r2, [sp, #0x58]
	bl ov45_0223CDBC
	movs r4, r0
	addeq sp, sp, #0x1a4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp]
	ldr r3, [sl]
	ldr r1, [sl, #4]
	ldr r2, [r0]
	add r7, r3, r1, lsl #2
	sub r1, r2, r7
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	cmp r2, r7
	mov r5, r0, asr #2
	ldrlo r0, [sl, #0xc]
	addlo r5, r5, r0
	ldr r0, [sl, #0xc]
	cmp r0, #0
	moveq r0, #0
	subne r0, r0, #1
	cmp r4, r0
	ldrls r1, [sl, #8]
	subls r0, r0, r4
	cmpls r1, r0
	bhi _0223C364
	str r7, [sp, #0x194]
	ldr r6, [sl]
	str r6, [sp, #0x198]
	ldr r0, [sl, #4]
	add r0, r6, r0, lsl #2
	str r0, [sp, #4]
	str r0, [sp, #0x19c]
	ldr r0, [sl, #0xc]
	add fp, r6, r0, lsl #2
	str fp, [sp, #0x1a0]
	ldr r1, [sl, #8]
	sub r0, r1, r5
	str r0, [sp, #8]
	cmp r5, r0
	bhs _0223C19C
	add r0, sp, #0x194
	rsb r1, r4, #0
	bl ov45_0223CD78
	ldr r1, [sp, #0x194]
	ldr r0, [sl]
	cmp r5, #0
	sub r1, r1, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r0, r0, asr #2
	str r0, [sl, #4]
	ldr r0, [sl, #8]
	add r0, r0, r4
	str r0, [sl, #8]
	beq _0223C2D8
	ldr r2, [sp, #0x1a0]
	ldr sl, [sp, #0x194]
	ldr r4, [sp, #0x198]
	ldr r3, [sp, #0x19c]
	str r2, [sp, #0x124]
	ldr r2, [sp, #4]
	add r0, sp, #0x38
	mov r1, r5
	str sl, [sp, #0x118]
	str r4, [sp, #0x11c]
	str r3, [sp, #0x120]
	str r7, [sp, #0x38]
	str r6, [sp, #0x3c]
	str r2, [sp, #0x40]
	str fp, [sp, #0x44]
	bl ov45_0223CD78
	ldr r2, [r0]
	add r1, sp, #0x138
	str r2, [sp, #0x128]
	ldr r3, [r0, #4]
	add r2, sp, #0x128
	str r3, [sp, #0x12c]
	ldr r4, [r0, #8]
	add r3, sp, #0x118
	str r4, [sp, #0x130]
	ldr r4, [r0, #0xc]
	add r0, sp, #0x148
	str r4, [sp, #0x134]
	ldr r4, [sp, #4]
	str r7, [sp, #0x138]
	str r6, [sp, #0x13c]
	str r4, [sp, #0x140]
	str fp, [sp, #0x144]
	bl ov45_0223C8A0
	ldr r3, [sp, #0x148]
	ldr r2, [sp, #0x14c]
	ldr r1, [sp, #0x150]
	ldr r0, [sp, #0x154]
	str r3, [sp, #0x194]
	str r2, [sp, #0x198]
	str r1, [sp, #0x19c]
	str r0, [sp, #0x1a0]
	b _0223C2D8
_0223C19C:
	add r0, r1, r4
	str r0, [sl, #8]
	ldr r1, [sl, #0xc]
	cmp r1, #0
	moveq r1, #0
	beq _0223C1C4
	ldr r2, [sl, #4]
	ldr r0, [sl, #8]
	add r0, r2, r0
	bl _u32_div_f
_0223C1C4:
	ldr r5, [sl]
	ldr r2, [sl, #4]
	ldr r0, [sl, #0xc]
	add r3, r5, r2, lsl #2
	add r2, r5, r0, lsl #2
	ldr r0, [sp, #8]
	add r1, r5, r1, lsl #2
	str r1, [sp, #0x194]
	str r5, [sp, #0x198]
	str r3, [sp, #0x19c]
	str r2, [sp, #0x1a0]
	cmp r0, #0
	beq _0223C2CC
	add r0, sp, #0x18
	str r1, [sp, #0xd8]
	str r1, [sp, #0x18]
	str r5, [sp, #0xdc]
	str r3, [sp, #0xe0]
	str r2, [sp, #0xe4]
	str r5, [sp, #0x1c]
	str r3, [sp, #0x20]
	str r2, [sp, #0x24]
	rsb r1, r4, #0
	bl ov45_0223CD78
	ldr r2, [r0]
	ldr r1, [sp, #8]
	str r2, [sp, #0xe8]
	ldr r2, [r0, #4]
	add r1, r4, r1
	str r2, [sp, #0xec]
	ldr r2, [r0, #8]
	ldr r6, [sp, #0x194]
	str r2, [sp, #0xf0]
	ldr r7, [r0, #0xc]
	ldr r5, [sp, #0x198]
	ldr r3, [sp, #0x19c]
	ldr r2, [sp, #0x1a0]
	add r0, sp, #0x28
	str r7, [sp, #0xf4]
	str r6, [sp, #0x28]
	str r5, [sp, #0x2c]
	str r3, [sp, #0x30]
	str r2, [sp, #0x34]
	rsb r1, r1, #0
	bl ov45_0223CD78
	ldr r2, [r0]
	add r1, sp, #0xf8
	str r2, [sp, #0xf8]
	ldr r3, [r0, #4]
	add r2, sp, #0xe8
	str r3, [sp, #0xfc]
	ldr r5, [r0, #8]
	add r3, sp, #0xd8
	str r5, [sp, #0x100]
	ldr r5, [r0, #0xc]
	add r0, sp, #0x108
	str r5, [sp, #0x104]
	bl ov45_0223C70C
	ldr r0, [sp, #0x108]
	ldr r2, [sp, #0x10c]
	ldr r1, [sp, #0x110]
	str r0, [sp, #0x194]
	ldr r0, [sp, #0x114]
	str r2, [sp, #0x198]
	str r1, [sp, #0x19c]
	str r0, [sp, #0x1a0]
_0223C2CC:
	add r0, sp, #0x194
	rsb r1, r4, #0
	bl ov45_0223CD78
_0223C2D8:
	ldr r3, [sp, #0x194]
	ldr r2, [sp, #0x198]
	ldr r0, [sp, #0x1a0]
	ldr r1, [sp, #0x19c]
	str r0, [sp, #0x9c]
	str r3, [sp, #0x90]
	str r2, [sp, #0x94]
	str r1, [sp, #0x98]
	ldr r1, [r8]
	add r0, sp, #0xc8
	str r1, [sp, #0xa0]
	ldr r2, [r8, #4]
	add r1, sp, #0xb4
	str r2, [sp, #0xa4]
	ldr r3, [r8, #8]
	add r2, sp, #0xa0
	str r3, [sp, #0xa8]
	ldr r4, [r8, #0xc]
	add r3, sp, #0x90
	str r4, [sp, #0xac]
	ldrb r4, [r8, #0x10]
	strb r4, [sp, #0xb0]
	ldr r4, [sb]
	str r4, [sp, #0xb4]
	ldr r4, [sb, #4]
	str r4, [sp, #0xb8]
	ldr r4, [sb, #8]
	str r4, [sp, #0xbc]
	ldr r4, [sb, #0xc]
	str r4, [sp, #0xc0]
	ldrb r4, [sb, #0x10]
	strb r4, [sp, #0xc4]
	bl ov45_0223C53C
	add sp, sp, #0x1a4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0223C364:
	mov r3, #0
	add r2, sl, #0xc
	mov r0, sl
	mov r1, r4
	str r3, [sp, #0x180]
	str r3, [sp, #0x184]
	str r3, [sp, #0x188]
	str r3, [sp, #0x18c]
	str r2, [sp, #0x190]
	bl ov45_0223BBFC
	mov r3, #0
	mov r1, r0
	strb r3, [sp, #0x10]
	sub r0, sp, #4
	strb r3, [r0]
	ldr r2, [r0]
	add r0, sp, #0x180
	strb r3, [sp, #0x11]
	bl ov45_0223CB04
	ldr r0, [sp, #0x180]
	str r5, [sp, #0x184]
	cmp r4, #0
	add r5, r0, r5, lsl #2
	beq _0223C418
	mov r3, #0
_0223C3C8:
	ldr r0, [sb]
	cmp r5, #0
	strb r3, [sp, #0xf]
	ldr r2, [r0]
	sub r4, r4, #1
	strne r2, [r5]
	ldr r0, [sp, #0x188]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #0x188]
	ldr r0, [sb]
	add r1, r0, #4
	str r1, [sb]
	ldr r0, [sb, #0xc]
	cmp r1, r0
	ldreq r0, [sb, #4]
	streq r0, [sb]
	cmp r4, #0
	bne _0223C3C8
	str r2, [sp, #0x14]
_0223C418:
	ldr r1, [sl, #0xc]
	cmp r1, #0
	moveq r1, #0
	beq _0223C438
	ldr r2, [sl, #4]
	ldr r0, [sl, #8]
	add r0, r2, r0
	bl _u32_div_f
_0223C438:
	ldr r0, [sl]
	mov r2, #0
	add r0, r0, r1, lsl #2
	str r0, [sp, #0x80]
	ldr r4, [sl]
	sub r1, sp, #4
	str r4, [sp, #0x84]
	ldr r0, [sl, #4]
	add r0, r4, r0, lsl #2
	str r0, [sp, #0x88]
	ldr r3, [sl, #0xc]
	add r0, sp, #0x180
	add r3, r4, r3, lsl #2
	str r3, [sp, #0x8c]
	strb r2, [sp, #0xe]
	strb r2, [r1]
	ldr r3, [r1]
	ldr r1, [sp]
	add r2, sp, #0x80
	bl ov45_0223CC78
	ldr r1, [sl]
	ldr r0, [sl, #4]
	mov r2, #0
	add r0, r1, r0, lsl #2
	str r0, [sp, #0x70]
	ldr r4, [sl]
	sub r1, sp, #4
	str r4, [sp, #0x74]
	ldr r0, [sl, #4]
	add r0, r4, r0, lsl #2
	str r0, [sp, #0x78]
	ldr r3, [sl, #0xc]
	add r0, sp, #0x180
	add r3, r4, r3, lsl #2
	str r3, [sp, #0x7c]
	strb r2, [sp, #0xd]
	strb r2, [r1]
	ldr r3, [r1]
	ldr r2, [sp]
	add r1, sp, #0x70
	bl ov45_0223CB6C
	mov r0, #0
	strb r0, [sp, #0xc]
	str r0, [sl, #8]
	ldr r1, [sl]
	ldr r0, [sp, #0x180]
	add r3, sp, #0x18c
	str r0, [sl]
	str r1, [sp, #0x180]
	ldr r2, [sl, #4]
	ldr r1, [sp, #0x184]
	add r0, sp, #0x180
	str r1, [sl, #4]
	str r2, [sp, #0x184]
	ldr r2, [sl, #8]
	ldr r1, [sp, #0x188]
	str r1, [sl, #8]
	str r2, [sp, #0x188]
	ldr r2, [sl, #0xc]
	ldr r1, [r3]
	str r1, [sl, #0xc]
	str r2, [r3]
	bl ov45_0223CAB4
	add sp, sp, #0x1a4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov45_0223BF9C

	arm_func_start ov45_0223C53C
ov45_0223C53C: ; 0x0223C53C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x60
	mov r5, r1
	ldr r8, [r5]
	ldr r7, [r2]
	mov r6, r0
	mov r4, r3
	cmp r8, r7
	beq _0223C6E4
	mov r0, r2
	bl ov45_0223CDBC
	str r0, [sp, #0xc]
_0223C56C:
	ldr r2, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, [sp, #0xc]
	sub r2, r2, r0
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	mov r2, r0, asr #2
	cmp r1, r0, asr #2
	addle r0, sp, #0xc
	str r2, [sp, #8]
	addgt r0, sp, #8
	ldr r7, [r0]
	ldr r1, [r5]
	add r0, sp, #0x10
	str r1, [sp, #0x10]
	ldr r2, [r5, #4]
	mov r1, r7
	str r2, [sp, #0x14]
	ldr r2, [r5, #8]
	str r2, [sp, #0x18]
	ldr r2, [r5, #0xc]
	str r2, [sp, #0x1c]
	ldrb r2, [r5, #0x10]
	strb r2, [sp, #0x20]
	bl ov45_0223CD78
	ldrb r2, [sp, #0x20]
	ldr r0, [sp, #0x10]
	ldr ip, [r4]
	ldr sb, [sp, #0x14]
	ldr r8, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	str r0, [sp, #0x24]
	str sb, [sp, #0x28]
	str r8, [sp, #0x2c]
	str r3, [sp, #0x30]
	strb r2, [sp, #0x34]
	ldr lr, [r5]
	str r3, [sp, #0x58]
	str lr, [sp, #0x38]
	ldr r1, [r5, #4]
	str r0, [sp, #0x4c]
	str r1, [sp, #0x3c]
	ldr r1, [r5, #8]
	str sb, [sp, #0x50]
	str r1, [sp, #0x40]
	ldr r1, [r5, #0xc]
	str r8, [sp, #0x54]
	str r1, [sp, #0x44]
	ldrb r1, [r5, #0x10]
	strb r2, [sp, #0x5c]
	strb r2, [sp]
	strb r1, [sp, #0x48]
	cmp lr, r0
	add r3, sp, #0x24
	add r2, sp, #0x38
	beq _0223C690
	mov r1, #0
_0223C650:
	strb r1, [sp, #1]
	ldr r0, [lr]
	str r0, [ip]
	ldr lr, [r2]
	ldr r8, [r2, #0xc]
	add lr, lr, #4
	cmp lr, r8
	ldreq r8, [r2, #4]
	str lr, [r2]
	streq r8, [r2]
	ldr lr, [r2]
	ldr r8, [r3]
	add ip, ip, #4
	cmp lr, r8
	bne _0223C650
	str r0, [sp, #4]
_0223C690:
	ldr r1, [sp, #0xc]
	sub r0, r7, #1
	sub r1, r1, r7
	str r1, [sp, #0xc]
	ldr r1, [r4]
	add r0, r1, r0, lsl #2
	add r1, r0, #4
	str r1, [r4]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	ldreq r0, [r4, #4]
	streq r0, [r4]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _0223C6E4
	add r0, sp, #0x4c
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldrb r7, [sp]
	strb r7, [r5, #0x10]
	b _0223C56C
_0223C6E4:
	ldr r0, [r4]
	str r0, [r6]
	ldr r0, [r4, #4]
	str r0, [r6, #4]
	ldr r0, [r4, #8]
	str r0, [r6, #8]
	ldr r0, [r4, #0xc]
	str r0, [r6, #0xc]
	add sp, sp, #0x60
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov45_0223C53C

	arm_func_start ov45_0223C70C
ov45_0223C70C: ; 0x0223C70C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sb, r1
	mov r8, r2
	ldr r2, [r8]
	ldr r1, [sb]
	mov sl, r0
	mov r7, r3
	cmp r1, r2
	beq _0223C878
	add r4, sp, #8
	mov fp, #0
	mov r5, #1
_0223C740:
	ldr r0, [r8, #4]
	cmp r2, r0
	ldreq r0, [r8, #0xc]
	streq r0, [r8]
	ldr r0, [r8]
	sub r0, r0, #4
	str r0, [r8]
	ldr r1, [r7]
	ldr r0, [r7, #4]
	cmp r1, r0
	ldreq r0, [r7, #0xc]
	streq r0, [r7]
	ldr r0, [r7]
	sub r0, r0, #4
	str r0, [r7]
	ldr r1, [r7, #8]
	cmp r0, r1
	ldrlo r1, [r7, #4]
	sub r1, r0, r1
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r0, r0, asr #2
	str r0, [sp, #8]
	ldr r1, [sb]
	ldr r0, [sb, #8]
	ldr r6, [r8, #8]
	cmp r1, r0
	movhs r2, r5
	ldr r0, [r8]
	movlo r2, fp
	cmp r0, r6
	movhs r3, #1
	movlo r3, #0
	cmp r2, r3
	bne _0223C7F4
	sub r1, r0, r1
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	ldr r1, [sp, #8]
	mov r2, r0, asr #2
	cmp r1, r0, asr #2
	movlt r0, r4
	str r2, [sp, #4]
	addge r0, sp, #4
	b _0223C820
_0223C7F4:
	cmp r0, r6
	ldrlo r6, [r8, #4]
	sub r1, r0, r6
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	ldr r1, [sp, #8]
	mov r2, r0, asr #2
	cmp r1, r0, asr #2
	movlt r0, r4
	str r2, [sp]
	addge r0, sp, #0
_0223C820:
	ldr r6, [r0]
	ldr r1, [r8]
	add r0, r6, #1
	sub r1, r1, r6, lsl #2
	add r0, r1, r0, lsl #2
	str r1, [r8]
	sub r2, r0, r1
	ldr r3, [r7]
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	add r3, r3, #4
	mov r2, r0, asr #2
	sub r0, r3, r2, lsl #2
	mov r2, r2, lsl #2
	bl memmove
	ldr r0, [r7]
	sub r0, r0, r6, lsl #2
	str r0, [r7]
	ldr r2, [r8]
	ldr r0, [sb]
	cmp r0, r2
	bne _0223C740
_0223C878:
	ldr r0, [r7]
	str r0, [sl]
	ldr r0, [r7, #4]
	str r0, [sl, #4]
	ldr r0, [r7, #8]
	str r0, [sl, #8]
	ldr r0, [r7, #0xc]
	str r0, [sl, #0xc]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov45_0223C70C

	arm_func_start ov45_0223C8A0
ov45_0223C8A0: ; 0x0223C8A0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov sb, r1
	mov r8, r2
	ldr r2, [sb]
	ldr r1, [r8]
	mov sl, r0
	mov r7, r3
	cmp r2, r1
	beq _0223C9EC
	add r4, sp, #8
	mov fp, #0
	mov r5, #1
_0223C8D4:
	ldr r1, [r7, #0xc]
	ldr r0, [r7]
	sub r1, r1, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r0, r0, asr #2
	str r0, [sp, #8]
	ldr r2, [sb]
	ldr r0, [sb, #8]
	ldr r1, [r8]
	cmp r2, r0
	movhs r3, r5
	ldr r0, [r8, #8]
	movlo r3, fp
	cmp r1, r0
	movhs r0, #1
	movlo r0, #0
	cmp r3, r0
	bne _0223C948
	sub r1, r1, r2
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	ldr r1, [sp, #8]
	mov r2, r0, asr #2
	cmp r1, r0, asr #2
	movlt r0, r4
	str r2, [sp, #4]
	addge r0, sp, #4
	b _0223C970
_0223C948:
	ldr r0, [sb, #0xc]
	ldr r1, [sp, #8]
	sub r2, r0, r2
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	mov r2, r0, asr #2
	cmp r1, r0, asr #2
	movlt r0, r4
	str r2, [sp]
	addge r0, sp, #0
_0223C970:
	ldr r6, [r0]
	ldr r1, [sb]
	ldr r0, [r7]
	add r2, r1, r6, lsl #2
	sub r3, r2, r1
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov r2, r2, asr #2
	mov r2, r2, lsl #2
	bl memmove
	ldr r1, [sb]
	sub r0, r6, #1
	add r1, r1, r0, lsl #2
	add r2, r1, #4
	str r2, [sb]
	ldr r1, [sb, #0xc]
	cmp r2, r1
	ldreq r1, [sb, #4]
	streq r1, [sb]
	ldr r1, [r7]
	add r0, r1, r0, lsl #2
	add r1, r0, #4
	str r1, [r7]
	ldr r0, [r7, #0xc]
	cmp r1, r0
	ldreq r0, [r7, #4]
	streq r0, [r7]
	ldr r1, [sb]
	ldr r0, [r8]
	cmp r1, r0
	bne _0223C8D4
_0223C9EC:
	ldr r0, [r7]
	str r0, [sl]
	ldr r0, [r7, #4]
	str r0, [sl, #4]
	ldr r0, [r7, #8]
	str r0, [sl, #8]
	ldr r0, [r7, #0xc]
	str r0, [sl, #0xc]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov45_0223C8A0

	arm_func_start ov45_0223CA14
ov45_0223CA14: ; 0x0223CA14
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	mov r2, #0
	mov r4, r0
	strb r2, [sp]
	str r2, [r4, #4]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _0223CAA4
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _0223CA54
	ldr r2, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r0, r2, r0
	bl _u32_div_f
	mov r2, r1
_0223CA54:
	ldr r8, [r4, #8]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x14]
	add r6, r8, r2, lsl #2
	add r7, r8, r0, lsl #2
	cmp r7, r6
	add sb, r8, r1, lsl #2
	beq _0223CAA4
	mov r5, #0
_0223CA78:
	ldr r1, [r7]
	cmp r1, #0
	beq _0223CA90
	mov r0, r5
	mov r2, r5
	bl ov00_021EC2EC
_0223CA90:
	add r7, r7, #4
	cmp r7, sb
	moveq r7, r8
	cmp r7, r6
	bne _0223CA78
_0223CAA4:
	add r0, r4, #8
	bl ov45_02238508
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov45_0223CA14

	arm_func_start ov45_0223CAB4
ov45_0223CAB4: ; 0x0223CAB4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _0223CAF8
	ldr r2, [r4, #8]
	mov r0, #0
	strb r0, [sp]
	ldr r1, [r4, #8]
	sub r1, r1, r2
	str r1, [r4, #8]
	ldr r1, [r4]
	cmp r1, #0
	beq _0223CAF8
	mov r2, r0
	bl ov00_021EC2EC
_0223CAF8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_0223CAB4

	arm_func_start ov45_0223CB04
ov45_0223CB04: ; 0x0223CB04
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0223CB64 ; =ov45_022577CC
	mov r5, r0
	ldr r3, [r2]
	mov r4, r1
	tst r3, #1
	bne _0223CB34
	ldr r0, _0223CB68 ; =ov45_022551A0
	orr r1, r3, #1
	mvn r3, #0xc0000001
	str r3, [r0]
	str r1, [r2]
_0223CB34:
	ldr r0, _0223CB68 ; =ov45_022551A0
	ldr r0, [r0]
	cmp r4, r0
	bls _0223CB48
	bl ov45_0223BD0C
_0223CB48:
	add r0, r4, #1
	mov r0, r0, lsl #2
	bl ov45_02242394
	str r0, [r5]
	add r0, r4, #1
	str r0, [r5, #0xc]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223CB64: .word ov45_022577CC
_0223CB68: .word ov45_022551A0
	arm_func_end ov45_0223CB04

	arm_func_start ov45_0223CB6C
ov45_0223CB6C: ; 0x0223CB6C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r7, r0
	mov r6, r1
	mov r5, r2
	ldr r3, [r7]
	ldr r0, [r7, #4]
	ldr r2, [r5]
	ldr r1, [r6]
	add r0, r3, r0, lsl #2
	cmp r1, r2
	bhi _0223CBE4
	sub r3, r2, r1
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov r3, r2, asr #2
	mov r2, r3, lsl #2
	sub r0, r0, r3, lsl #2
	bl memmove
	ldr r2, [r5]
	ldr r0, [r6]
	ldr r1, [r7, #8]
	sub r2, r2, r0
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	add r1, r1, r0, asr #2
	str r1, [r7, #8]
	ldr r1, [r7, #4]
	sub r0, r1, r0, asr #2
	str r0, [r7, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0223CBE4:
	ldr r1, [r5, #4]
	sub r3, r2, r1
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov r2, r2, asr #2
	sub r4, r0, r2, lsl #2
	mov r0, r4
	mov r2, r2, lsl #2
	bl memmove
	ldr r1, [r6]
	ldr r0, [r6, #0xc]
	sub r2, r0, r1
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	mov r0, r0, asr #2
	mov r2, r0, lsl #2
	sub r0, r4, r0, lsl #2
	bl memmove
	ldr r1, [r6, #0xc]
	ldr r0, [r6]
	ldr r4, [r5]
	ldr r3, [r5, #4]
	sub r2, r1, r0
	sub r3, r4, r3
	mov r1, r2, asr #1
	mov r0, r3, asr #1
	add r1, r2, r1, lsr #30
	add r0, r3, r0, lsr #30
	mov r2, r1, asr #2
	ldr r1, [r7, #4]
	add r2, r2, r0, asr #2
	sub r0, r1, r2
	str r0, [r7, #4]
	ldr r0, [r7, #8]
	add r0, r0, r2
	str r0, [r7, #8]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_0223CB6C

	arm_func_start ov45_0223CC78
ov45_0223CC78: ; 0x0223CC78
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r0
	ldr r3, [r7, #4]
	ldr r0, [r7, #8]
	mov r6, r1
	ldr r1, [r7, #0xc]
	add r0, r3, r0
	mov r5, r2
	bl _u32_div_f
	ldr r2, [r7]
	ldr r0, [r5]
	add r4, r2, r1, lsl #2
	ldr r1, [r6]
	cmp r1, r0
	bhi _0223CCF4
	sub r2, r0, r1
	mov r0, r2, asr #1
	add r0, r2, r0, lsr #30
	mov r2, r0, asr #2
	mov r0, r4
	mov r2, r2, lsl #2
	bl memmove
	ldr r1, [r5]
	ldr r0, [r6]
	ldr r2, [r7, #8]
	sub r1, r1, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	add r0, r2, r0, asr #2
	str r0, [r7, #8]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0223CCF4:
	ldr r2, [r6, #0xc]
	mov r0, r4
	sub r3, r2, r1
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov r8, r2, asr #2
	mov r2, r8, lsl #2
	bl memmove
	ldr r1, [r5, #4]
	ldr r2, [r5]
	add r0, r4, r8, lsl #2
	sub r3, r2, r1
	mov r2, r3, asr #1
	add r2, r3, r2, lsr #30
	mov r2, r2, asr #2
	mov r2, r2, lsl #2
	bl memmove
	ldr r1, [r5]
	ldr r0, [r5, #4]
	ldr r4, [r6, #0xc]
	ldr r3, [r6]
	sub r2, r1, r0
	sub r3, r4, r3
	mov r1, r2, asr #1
	add r1, r2, r1, lsr #30
	mov r0, r3, asr #1
	add r0, r3, r0, lsr #30
	mov r1, r1, asr #2
	ldr r2, [r7, #8]
	add r0, r1, r0, asr #2
	add r0, r2, r0
	str r0, [r7, #8]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov45_0223CC78

	arm_func_start ov45_0223CD78
ov45_0223CD78: ; 0x0223CD78
	stmdb sp!, {r4, lr}
	ldr r3, [r0, #0xc]
	ldmia r0, {r2, r4}
	sub ip, r2, r4
	sub lr, r3, r4
	mov r3, ip, asr #1
	mov r2, lr, asr #1
	add r3, ip, r3, lsr #30
	add r2, lr, r2, lsr #30
	adds r1, r1, r3, asr #2
	addmi r1, r1, r2, asr #2
	bmi _0223CDB0
	cmp r1, r2, asr #2
	subge r1, r1, r2, asr #2
_0223CDB0:
	add r1, r4, r1, lsl #2
	str r1, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end ov45_0223CD78

	arm_func_start ov45_0223CDBC
ov45_0223CDBC: ; 0x0223CDBC
	stmdb sp!, {r3, lr}
	ldr ip, [r1]
	ldr r3, [r0]
	ldr lr, [r0, #8]
	sub r2, r3, ip
	mov r1, r2, asr #1
	add r1, r2, r1, lsr #30
	cmp r3, lr
	mov r2, r1, asr #2
	blo _0223CE08
	cmp ip, lr
	bhs _0223CE28
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #4]
	sub r1, r1, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	sub r2, r2, r0, asr #2
	b _0223CE28
_0223CE08:
	cmp ip, lr
	blo _0223CE28
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #4]
	sub r1, r1, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	add r2, r2, r0, asr #2
_0223CE28:
	mov r0, r2
	ldmia sp!, {r3, pc}
	arm_func_end ov45_0223CDBC

	arm_func_start ov45_0223CE30
ov45_0223CE30: ; 0x0223CE30
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mvn r1, #0xe0000000
	mov r5, r0
	cmp r4, r1
	bls _0223CE4C
	bl _ZNSt15__vector_commonILb1EE18throw_length_errorEv
_0223CE4C:
	mov r0, r4, lsl #3
	bl ov45_02242394
	str r0, [r5]
	str r4, [r5, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0223CE30

	arm_func_start ov45_0223CE60
ov45_0223CE60: ; 0x0223CE60
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mvn r1, #0xe0000000
	mov r5, r0
	cmp r4, r1
	bls _0223CE7C
	bl _ZNSt15__vector_commonILb1EE18throw_length_errorEv
_0223CE7C:
	mov r0, r4, lsl #3
	bl ov45_02242394
	str r0, [r5]
	str r4, [r5, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0223CE60

	arm_func_start ov45_0223CE90
ov45_0223CE90: ; 0x0223CE90
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x24
	ldr r1, [sp, #0x44]
	mov r4, r0
	ldmia r1, {r0, r1, r2, r3}
	add r5, sp, #0x14
	add lr, sp, #0x34
	stmia r5, {r0, r1, r2, r3}
	add ip, sp, #4
	ldmia lr, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	mov r0, r5
	mov r1, ip
	bl ov45_0223D208
	movs r1, r0
	addeq sp, sp, #0x24
	ldmeqia sp!, {r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	mov r2, #0
	strb r2, [sp, #1]
	sub r0, sp, #4
	strb r2, [r0]
	ldr r2, [r0]
	mov r0, r4
	bl ov45_0223D15C
	mov r1, #0
	strb r1, [sp]
	sub r0, sp, #4
	strb r1, [r0]
	ldr r3, [r0]
	ldr r2, [sp, #0x44]
	add r1, sp, #0x34
	mov r0, r4
	bl ov45_0223CF30
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_0223CE90

	arm_func_start ov45_0223CF30
ov45_0223CF30: ; 0x0223CF30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x5c
	mov r7, r0
	ldr r4, [r7]
	mov r6, r1
	cmp r4, #0
	mov r5, r2
	addeq sp, sp, #0x5c
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r2, [r7, #4]
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	add r0, r2, r0
	bl _u32_div_f
	add r4, r4, r1, lsl #2
	mov r0, r5
	mov r1, r6
	bl ov45_0223D208
	str r0, [sp, #0x18]
	ldr r2, [r7]
	ldr r1, [r7, #0xc]
	add r1, r2, r1, lsl #2
	sub r2, r1, r4
	mov r1, r2, asr #1
	add r1, r2, r1, lsr #30
	mov r2, r1, asr #2
	cmp r0, r1, asr #2
	addlt r1, sp, #0x18
	str r2, [sp, #0x14]
	addge r1, sp, #0x14
	ldr r1, [r1]
	str r1, [sp, #0x14]
	ldr r1, [r7, #8]
	add r0, r1, r0
	str r0, [r7, #8]
	ldr r0, [r6]
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x2c]
	ldr r2, [r6, #4]
	add r0, sp, #0x2c
	str r2, [sp, #0x30]
	ldr r2, [r6, #8]
	str r2, [sp, #0x34]
	ldr r2, [r6, #0xc]
	str r2, [sp, #0x38]
	bl ov45_0223D1C4
	ldr r8, [r0]
	ldr r3, [r0, #4]
	ldr r2, [r0, #8]
	ldr r1, [r0, #0xc]
	str r8, [sp, #0x4c]
	add r0, sp, #0x4c
	mov r8, sp
	str r3, [sp, #0x50]
	str r2, [sp, #0x54]
	str r1, [sp, #0x58]
	ldmia r0, {r0, r1, r2, r3}
	stmia r8, {r0, r1, r2, r3}
	str r4, [sp, #0x10]
	ldmia r6, {r0, r1, r2, r3}
	bl ov45_0223D0A8
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	subs r0, r0, r1
	str r0, [sp, #0x18]
	addeq sp, sp, #0x5c
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	ldr r2, [r6]
	add r0, sp, #0x1c
	str r2, [sp, #0x1c]
	ldr r2, [r6, #4]
	str r2, [sp, #0x20]
	ldr r2, [r6, #8]
	str r2, [sp, #0x24]
	ldr r2, [r6, #0xc]
	str r2, [sp, #0x28]
	bl ov45_0223D1C4
	ldmia r0, {r8, lr}
	ldr ip, [r0, #8]
	ldr r6, [r0, #0xc]
	mov r4, sp
	ldmia r5, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r4, [r7]
	str r8, [sp, #0x3c]
	add r0, sp, #0x3c
	str lr, [sp, #0x40]
	str ip, [sp, #0x44]
	str r6, [sp, #0x48]
	ldmia r0, {r0, r1, r2, r3}
	str r4, [sp, #0x10]
	bl ov45_0223D0A8
	add sp, sp, #0x5c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov45_0223CF30

	arm_func_start ov45_0223D0A8
ov45_0223D0A8: ; 0x0223D0A8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	ldr r0, [sp, #0x2c]
	ldr r6, [sp, #0x28]
	ldr r5, [sp, #0x38]
	ldr sl, [sp, #0x48]
	cmp r6, r5
	str r0, [sp]
	ldr r8, [sp, #0x34]
	ldr r7, [sp, #0x30]
	ldr fp, [sp, #0x40]
	beq _0223D14C
_0223D0D8:
	cmp r6, r7
	movhs r0, #1
	movlo r0, #0
	cmp r5, fp
	movhs r1, #1
	movlo r1, #0
	cmp r0, r1
	subeq r1, r5, r6
	subne r1, r8, r6
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov sb, r0, asr #2
	add r0, r6, sb, lsl #2
	sub r1, r0, r6
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r4, r0, asr #2
	mov r2, r4, lsl #2
	mov r0, sl
	mov r1, r6
	bl memmove
	sub r0, sb, #1
	add r0, r6, r0, lsl #2
	add r6, r0, #4
	cmp r6, r8
	ldreq r6, [sp]
	add sl, sl, r4, lsl #2
	cmp r6, r5
	bne _0223D0D8
_0223D14C:
	mov r0, sl
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_0223D0A8

	arm_func_start ov45_0223D15C
ov45_0223D15C: ; 0x0223D15C
	stmdb sp!, {r3, r4, r5, lr}
	ldr r2, _0223D1BC ; =ov45_022577D0
	mov r5, r0
	ldr r3, [r2]
	mov r4, r1
	tst r3, #1
	bne _0223D18C
	ldr r0, _0223D1C0 ; =ov45_022551A4
	orr r1, r3, #1
	mvn r3, #0xc0000001
	str r3, [r0]
	str r1, [r2]
_0223D18C:
	ldr r0, _0223D1C0 ; =ov45_022551A4
	ldr r0, [r0]
	cmp r4, r0
	bls _0223D1A0
	bl ov45_0223BD0C
_0223D1A0:
	add r0, r4, #1
	mov r0, r0, lsl #2
	bl ov45_02242394
	str r0, [r5]
	add r0, r4, #1
	str r0, [r5, #0xc]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0223D1BC: .word ov45_022577D0
_0223D1C0: .word ov45_022551A4
	arm_func_end ov45_0223D15C

	arm_func_start ov45_0223D1C4
ov45_0223D1C4: ; 0x0223D1C4
	stmdb sp!, {r4, lr}
	ldr r3, [r0, #0xc]
	ldmia r0, {r2, r4}
	sub ip, r2, r4
	sub lr, r3, r4
	mov r3, ip, asr #1
	mov r2, lr, asr #1
	add r3, ip, r3, lsr #30
	add r2, lr, r2, lsr #30
	adds r1, r1, r3, asr #2
	addmi r1, r1, r2, asr #2
	bmi _0223D1FC
	cmp r1, r2, asr #2
	subge r1, r1, r2, asr #2
_0223D1FC:
	add r1, r4, r1, lsl #2
	str r1, [r0]
	ldmia sp!, {r4, pc}
	arm_func_end ov45_0223D1C4

	arm_func_start ov45_0223D208
ov45_0223D208: ; 0x0223D208
	stmdb sp!, {r3, lr}
	ldr ip, [r1]
	ldr r3, [r0]
	ldr lr, [r0, #8]
	sub r2, r3, ip
	mov r1, r2, asr #1
	add r1, r2, r1, lsr #30
	cmp r3, lr
	mov r2, r1, asr #2
	blo _0223D254
	cmp ip, lr
	bhs _0223D274
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #4]
	sub r1, r1, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	sub r2, r2, r0, asr #2
	b _0223D274
_0223D254:
	cmp ip, lr
	blo _0223D274
	ldr r1, [r0, #0xc]
	ldr r0, [r0, #4]
	sub r1, r1, r0
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	add r2, r2, r0, asr #2
_0223D274:
	mov r0, r2
	ldmia sp!, {r3, pc}
	arm_func_end ov45_0223D208

	arm_func_start ov45_0223D27C
ov45_0223D27C: ; 0x0223D27C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x84
	mov r4, r1
	mov r5, r0
	ldr r1, _0223D62C ; =ov45_022551DC
	add r0, sp, #0x60
	bl ov45_02237B58
	add r0, sp, #0x78
	add r2, sp, #0x60
	mov r1, r5
	mov r3, #2
	bl ov45_0223649C
	add r0, sp, #0x60
	bl ov45_02237BC8
	ldr r0, [sp, #0x7c]
	cmp r0, #2
	beq _0223D2D4
	add r0, sp, #0x78
	bl ov45_02237664
	add sp, sp, #0x84
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_0223D2D4:
	ldr r1, [sp, #0x78]
	ldr r0, [r1]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldrne r0, [r1, #4]
	bne _0223D2F8
	ldrb r0, [r1]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x19
_0223D2F8:
	cmp r0, #0x28
	bls _0223D314
	add r0, sp, #0x78
	bl ov45_02237664
	add sp, sp, #0x84
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_0223D314:
	ldr r0, [r1, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldrne r0, [r1, #0x10]
	bne _0223D334
	ldrb r0, [r1, #0xc]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x19
_0223D334:
	cmp r0, #0x190
	bls _0223D350
	add r0, sp, #0x78
	bl ov45_02237664
	add sp, sp, #0x84
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_0223D350:
	ldr r1, _0223D630 ; =ov45_022551E0
	add r0, sp, #0x54
	bl ov45_02237B58
	ldr r1, [sp, #0x78]
	add r0, sp, #0x6c
	add r2, sp, #0x54
	mov r3, #0
	bl ov45_0223649C
	add r0, sp, #0x54
	bl ov45_02237BC8
	ldr r0, [sp, #0x70]
	cmp r0, #6
	bhs _0223D3A0
	add r0, sp, #0x6c
	bl ov45_02237664
	add r0, sp, #0x78
	bl ov45_02237664
	add sp, sp, #0x84
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_0223D3A0:
	ldr r1, [sp, #0x6c]
	mov r2, #0x10
	ldr r0, [r1]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, r1, #1
	ldrne r0, [r1, #8]
	add r1, sp, #0x20
	bl strtoul
	str r0, [r4]
	ldr r1, [sp, #0x6c]
	mov r2, #0x10
	ldr r0, [r1, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, r1, #0xd
	ldrne r0, [r1, #0x14]
	add r1, sp, #0x20
	bl strtoul
	str r0, [r4, #4]
	ldr r1, [sp, #0x6c]
	ldr r5, _0223D634 ; =ov45_022551E4
	ldr r0, [r1, #0x18]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, r1, #0x19
	ldrne r1, [r1, #0x20]
	add r0, sp, #0x3c
	bl ov45_02237B58
	add r0, sp, #0x48
	mov r1, r5
	bl ov45_02237B58
	add r0, sp, #0x3c
	add r1, sp, #0x48
	mov r2, #1
	bl ov45_0223D644
	mov r5, r0
	add r0, sp, #0x48
	bl ov45_02237BC8
	add r0, sp, #0x3c
	bl ov45_02237BC8
	cmp r5, #0
	moveq r0, #1
	movne r0, #0
	str r0, [r4, #8]
	ldr r1, [sp, #0x6c]
	ldr r5, _0223D638 ; =ov45_022551E8
	ldr r0, [r1, #0x24]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, r1, #0x25
	ldrne r1, [r1, #0x2c]
	add r0, sp, #0x24
	bl ov45_02237B58
	add r0, sp, #0x30
	mov r1, r5
	bl ov45_02237B58
	add r0, sp, #0x24
	add r1, sp, #0x30
	mov r2, #1
	bl ov45_0223D644
	mov r5, r0
	add r0, sp, #0x30
	bl ov45_02237BC8
	add r0, sp, #0x24
	bl ov45_02237BC8
	cmp r5, #0
	moveq r0, #0
	movne r0, #1
	str r0, [r4, #0xc]
	ldr r1, [sp, #0x6c]
	mov r2, #0x10
	ldr r0, [r1, #0x30]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, r1, #0x31
	ldrne r0, [r1, #0x38]
	add r1, sp, #0x20
	bl strtol
	str r0, [r4, #0x10]
	add r0, sp, #0x6c
	bl ov45_02237664
	ldr r0, [r4, #8]
	cmp r0, #1
	bne _0223D530
	ldr r1, [sp, #0x78]
	ldr r0, [r1, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, r1, #0xd
	ldrne r0, [r1, #0x14]
	add r1, r4, #0x18
	bl ov45_02233FE4
	cmp r0, #0
	bne _0223D618
	add r0, sp, #0x78
	bl ov45_02237664
	add sp, sp, #0x84
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_0223D530:
	ldr r0, [sp, #0x78]
	ldr r1, [r0, #0xc]
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	ldrne r2, [r0, #0x10]
	bne _0223D554
	ldrb r1, [r0, #0xc]
	mov r1, r1, lsl #0x18
	mov r2, r1, lsr #0x19
_0223D554:
	ldr r1, [r0, #0xc]
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	ldr r1, [r0, #0xc]
	addeq r3, r0, #0xd
	mov r1, r1, lsl #0x1f
	ldrne r3, [r0, #0x14]
	movs r1, r1, lsr #0x1f
	addeq r5, r0, #0xd
	ldrne r5, [r0, #0x14]
	mov r0, #0
	add r2, r3, r2
	strb r0, [sp, #0xb]
	strb r0, [sp, #0xc]
	strb r0, [sp, #0xa]
	strb r0, [sp, #4]
	sub r1, sp, #4
	ldr r0, [sp, #0x1c]
	str r2, [r1]
	str r0, [r1, #4]
	ldr r3, [r1]
	add r1, sp, #0x10
	str r5, [sp, #0x10]
	str r2, [sp, #0x18]
	add r0, r4, #0x18
	ldmia r1, {r1, r2}
	bl ov45_022327B8
	mov r2, #0
	strb r2, [sp, #8]
	ldr r1, [r4, #0x1c]
	ldr r0, [r4, #0x20]
	cmp r1, r0
	bhs _0223D5F8
	add r3, r1, #1
	str r3, [r4, #0x1c]
	ldr r0, _0223D63C ; =ov45_022551D8
	ldr r1, [r4, #0x18]
	ldrsb r2, [r0, #1]
	add r0, r1, r3
	strb r2, [r0, #-1]
	b _0223D618
_0223D5F8:
	strb r2, [sp, #9]
	sub r1, sp, #4
	and r0, r2, #0xff
	strb r0, [r1]
	ldr r2, [r1]
	ldr r1, _0223D640 ; =ov45_022551D9
	add r0, r4, #0x18
	bl ov45_0223DA3C
_0223D618:
	add r0, sp, #0x78
	bl ov45_02237664
	mov r0, #1
	add sp, sp, #0x84
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0223D62C: .word ov45_022551DC
_0223D630: .word ov45_022551E0
_0223D634: .word ov45_022551E4
_0223D638: .word ov45_022551E8
_0223D63C: .word ov45_022551D8
_0223D640: .word ov45_022551D9
	arm_func_end ov45_0223D27C

	arm_func_start ov45_0223D644
ov45_0223D644: ; 0x0223D644
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x30
	mov r6, r0
	ldr r0, [r6]
	mov r5, r1
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	mov r4, r2
	ldmneib r6, {r0, r1}
	bne _0223D67C
	ldrb r0, [r6]
	add r1, r6, #1
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x19
_0223D67C:
	add r0, r1, r0
	str r0, [sp, #0x28]
	ldr r0, [r6]
	add r1, sp, #0x28
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	moveq r2, #1
	movne r2, #0
	ldr r0, [r1]
	cmp r2, #0
	addne r3, r6, #1
	ldreq r3, [r6, #8]
	str r0, [sp, #0x10]
	cmp r2, #0
	addne sb, r6, #1
	ldreq sb, [r6, #8]
	ldr r8, [sp, #0x10]
	str r3, [sp, #0x24]
	str r3, [sp, #0xc]
	str sb, [sp, #0x2c]
	str sb, [sp, #0x14]
	cmp sb, r8
	beq _0223D6F8
	ldr r7, [sp, #0xc]
_0223D6DC:
	ldrsb r0, [sb], #1
	bl ov45_0223D7B4
	cmp sb, r8
	strb r0, [r7], #1
	bne _0223D6DC
	str r7, [sp, #0xc]
	str sb, [sp, #0x14]
_0223D6F8:
	ldr r0, [r5]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldmneib r5, {r0, r1}
	bne _0223D71C
	ldrb r0, [r5]
	add r1, r5, #1
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x19
_0223D71C:
	add r0, r1, r0
	str r0, [sp, #0x1c]
	ldr r0, [r5]
	add r1, sp, #0x1c
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	moveq r2, #1
	movne r2, #0
	ldr r0, [r1]
	cmp r2, #0
	addne r3, r5, #1
	ldreq r3, [r5, #8]
	str r0, [sp, #4]
	cmp r2, #0
	addne sb, r5, #1
	ldreq sb, [r5, #8]
	ldr r8, [sp, #4]
	str r3, [sp, #0x18]
	str r3, [sp]
	str sb, [sp, #0x20]
	str sb, [sp, #8]
	cmp sb, r8
	beq _0223D798
	ldr r7, [sp]
_0223D77C:
	ldrsb r0, [sb], #1
	bl ov45_0223D7B4
	cmp sb, r8
	strb r0, [r7], #1
	bne _0223D77C
	str r7, [sp]
	str sb, [sp, #8]
_0223D798:
	mov r0, r6
	mov r2, r4
	mov r3, r5
	mov r1, #0
	bl ov45_0223DB54
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov45_0223D644

	arm_func_start ov45_0223D7B4
ov45_0223D7B4: ; 0x0223D7B4
	cmp r0, #0
	bxlt lr
	cmp r0, #0x80
	bxge lr
	ldr r1, _0223D7D0 ; =_0210E404
	ldrb r0, [r1, r0]
	bx lr
	.balign 4, 0
_0223D7D0: .word _0210E404
	arm_func_end ov45_0223D7B4

	arm_func_start ov45_0223D7D4
ov45_0223D7D4: ; 0x0223D7D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x1c4
	movs sb, r0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	ldr r5, [sp, #0x1e0]
	ldr r4, [sp, #0x1e4]
	bne _0223D808
	cmp r5, #0x190
	addhi sp, sp, #0x1c4
	movhi r0, #0
	ldmhiia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0223D808:
	cmp sb, #1
	bne _0223D820
	cmp r5, #0x12c
	addhi sp, sp, #0x1c4
	movhi r0, #0
	ldmhiia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0223D820:
	ldr r1, _0223DA14 ; =ov45_022551EC
	mov r0, r4
	bl ov45_0223DAD4
	ldr r2, _0223DA18 ; =ov45_022551F0
	add r0, sp, #0x24
	mov r1, #3
	mov r3, #0
	bl ov45_02232B24
	mov r0, r4
	add r1, sp, #0x24
	bl ov45_0223DA6C
	add r0, sp, #0x24
	bl ov45_02237BC8
	ldr r1, _0223DA1C ; =ov45_022551E0
	mov r0, r4
	bl ov45_0223DAA0
	ldr r2, _0223DA18 ; =ov45_022551F0
	add r0, sp, #0x18
	mov r1, #2
	mov r3, #6
	bl ov45_02232B24
	mov r0, r4
	add r1, sp, #0x18
	bl ov45_0223DA6C
	add r0, sp, #0x18
	bl ov45_02237BC8
	ldr r1, _0223DA1C ; =ov45_022551E0
	mov r0, r4
	bl ov45_0223DAA0
	cmp sb, #0
	beq _0223D8A8
	cmp sb, #1
	beq _0223D8B8
	b _0223D8C8
_0223D8A8:
	ldr r1, _0223DA20 ; =ov45_022551E8
	mov r0, r4
	bl ov45_0223DAA0
	b _0223D8D4
_0223D8B8:
	ldr r1, _0223DA24 ; =ov45_022551E4
	mov r0, r4
	bl ov45_0223DAA0
	b _0223D8D4
_0223D8C8:
	add sp, sp, #0x1c4
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0223D8D4:
	ldr r1, _0223DA1C ; =ov45_022551E0
	mov r0, r4
	bl ov45_0223DAA0
	cmp r8, #0
	beq _0223D900
	cmp r8, #1
	bne _0223D910
	ldr r1, _0223DA28 ; =ov45_022551F4
	mov r0, r4
	bl ov45_0223DAA0
	b _0223D91C
_0223D900:
	ldr r1, _0223DA20 ; =ov45_022551E8
	mov r0, r4
	bl ov45_0223DAA0
	b _0223D91C
_0223D910:
	add sp, sp, #0x1c4
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0223D91C:
	ldr r1, _0223DA1C ; =ov45_022551E0
	mov r0, r4
	bl ov45_0223DAA0
	ldr r2, _0223DA18 ; =ov45_022551F0
	add r0, sp, #0xc
	mov r3, r7
	mov r1, #8
	bl ov45_02232B24
	add r1, sp, #0xc
	mov r0, r4
	bl ov45_0223DA6C
	add r0, sp, #0xc
	bl ov45_02237BC8
	ldr r1, _0223DA1C ; =ov45_022551E0
	mov r0, r4
	bl ov45_0223DAA0
	ldr r1, _0223DA2C ; =ov45_022551F8
	mov r0, r4
	bl ov45_0223DAA0
	ldr r1, _0223DA30 ; =ov45_022551DC
	mov r0, r4
	bl ov45_0223DAA0
	cmp sb, #0
	beq _0223D988
	cmp sb, #1
	beq _0223D9B4
	b _0223D9FC
_0223D988:
	ldr r2, _0223DA34 ; =ov45_022551FC
	add r0, sp, #0
	mov r1, r5
	mov r3, r6
	bl ov45_02232B24
	add r1, sp, #0
	mov r0, r4
	bl ov45_0223DA6C
	add r0, sp, #0
	bl ov45_02237BC8
	b _0223DA08
_0223D9B4:
	ldr r2, _0223DA38 ; =0x00000191
	add r0, sp, #0x30
	mov r1, #0
	bl MI_CpuFill8
	ldr r3, _0223DA38 ; =0x00000191
	add r2, sp, #0x30
	mov r0, r6
	mov r1, r5
	bl ov00_021EFF30
	mvn r1, #0
	cmp r0, r1
	addeq sp, sp, #0x1c4
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	add r1, sp, #0x30
	mov r0, r4
	bl ov45_0223DAA0
	b _0223DA08
_0223D9FC:
	add sp, sp, #0x1c4
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0223DA08:
	mov r0, #1
	add sp, sp, #0x1c4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0223DA14: .word ov45_022551EC
_0223DA18: .word ov45_022551F0
_0223DA1C: .word ov45_022551E0
_0223DA20: .word ov45_022551E8
_0223DA24: .word ov45_022551E4
_0223DA28: .word ov45_022551F4
_0223DA2C: .word ov45_022551F8
_0223DA30: .word ov45_022551DC
_0223DA34: .word ov45_022551FC
_0223DA38: .word 0x00000191
	arm_func_end ov45_0223D7D4

	arm_func_start ov45_0223DA3C
ov45_0223DA3C: ; 0x0223DA3C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r2, #0
	mov r5, r0
	mov r1, #1
	strb r2, [sp]
	bl ov45_02237890
	mov r0, r5
	mov r2, r4
	mov r1, #1
	bl ov45_0223DB8C
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0223DA3C

	arm_func_start ov45_0223DA6C
ov45_0223DA6C: ; 0x0223DA6C
	ldr r2, [r0]
	mov r3, r1
	mov r1, r2, lsl #0x1f
	movs r1, r1, lsr #0x1f
	ldrne r1, [r0, #4]
	bne _0223DA90
	ldrb r1, [r0]
	mov r1, r1, lsl #0x18
	mov r1, r1, lsr #0x19
_0223DA90:
	ldr ip, _0223DA9C ; =ov45_02237DB4
	mov r2, #0
	bx ip
	.balign 4, 0
_0223DA9C: .word ov45_02237DB4
	arm_func_end ov45_0223DA6C

	arm_func_start ov45_0223DAA0
ov45_0223DAA0: ; 0x0223DAA0
	ldr r2, [r0]
	mov r3, r1
	mov r1, r2, lsl #0x1f
	movs r1, r1, lsr #0x1f
	ldrne r1, [r0, #4]
	bne _0223DAC4
	ldrb r1, [r0]
	mov r1, r1, lsl #0x18
	mov r1, r1, lsr #0x19
_0223DAC4:
	ldr ip, _0223DAD0 ; =ov45_0223DB08
	mov r2, #0
	bx ip
	.balign 4, 0
_0223DAD0: .word ov45_0223DB08
	arm_func_end ov45_0223DAA0

	arm_func_start ov45_0223DAD4
ov45_0223DAD4: ; 0x0223DAD4
	ldr r2, [r0]
	mov r3, r1
	mov r1, r2, lsl #0x1f
	movs r1, r1, lsr #0x1f
	ldrne r2, [r0, #4]
	bne _0223DAF8
	ldrb r1, [r0]
	mov r1, r1, lsl #0x18
	mov r2, r1, lsr #0x19
_0223DAF8:
	ldr ip, _0223DB04 ; =ov45_0223DB08
	mov r1, #0
	bx ip
	.balign 4, 0
_0223DB04: .word ov45_0223DB08
	arm_func_end ov45_0223DAD4

	arm_func_start ov45_0223DB08
ov45_0223DB08: ; 0x0223DB08
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r4, r3
	mov r7, r0
	mov r0, r4
	mov r6, r1
	mov r5, r2
	bl strlen
	add r0, r4, r0
	ldrb ip, [sp, #8]
	str r0, [sp]
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, r4
	strb ip, [sp, #4]
	bl ov45_02238104
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ov45_0223DB08

	arm_func_start ov45_0223DB54
ov45_0223DB54: ; 0x0223DB54
	stmdb sp!, {r3, lr}
	ldr ip, [r3]
	mov ip, ip, lsl #0x1f
	movs ip, ip, lsr #0x1f
	ldmneib r3, {ip, lr}
	bne _0223DB7C
	ldrb ip, [r3]
	add lr, r3, #1
	mov r3, ip, lsl #0x18
	mov ip, r3, lsr #0x19
_0223DB7C:
	mov r3, lr
	str ip, [sp]
	bl ov45_02238024
	ldmia sp!, {r3, pc}
	arm_func_end ov45_0223DB54

	arm_func_start ov45_0223DB8C
ov45_0223DB8C: ; 0x0223DB8C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x1c
	mov r4, #0
	mov r6, r0
	add r3, r6, #8
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x18]
	str r3, [sp, #0x14]
	mov r5, r1
	ldr r3, [r6, #4]
	ldr r1, [r6, #8]
	add r3, r3, r5
	sub r1, r3, r1
	mov r4, r2
	bl ov45_02237890
	mov r3, #0
	mov r1, r0
	strb r3, [sp, #3]
	sub r0, sp, #4
	strb r3, [r0]
	ldr r2, [r0]
	add r0, sp, #8
	strb r3, [sp, #4]
	bl ov45_022389CC
	ldr r2, [r6, #4]
	mov r0, #0
	ldr r1, [sp, #8]
	strb r0, [sp, #2]
	str r2, [sp, #0x18]
	add r3, r1, r2
	ldr r0, [sp, #0xc]
	ldrb r1, [r4]
	mov r2, r5
	add r0, r3, r0
	bl memset
	ldr r0, [sp, #0xc]
	mov r1, #0
	add r0, r0, r5
	str r0, [sp, #0xc]
	ldr r5, [r6]
	ldr r2, [r6, #4]
	ldr r0, [sp, #0x18]
	strb r1, [sp, #1]
	add r1, r5, r2
	sub r4, r1, r5
	sub r2, r0, r4
	ldr r0, [sp, #8]
	str r2, [sp, #0x18]
	add r0, r0, r2
	mov r1, r5
	mov r2, r4
	bl memcpy
	mov r0, r5
	mov r1, #0
	mov r2, r4
	bl memset
	ldr r1, [sp, #0xc]
	mov r0, #0
	add r1, r1, r4
	str r1, [sp, #0xc]
	strb r0, [sp]
	str r0, [r6, #4]
	add r3, sp, #0x10
	ldr r2, [r6, #8]
	ldr r1, [r3]
	add r0, sp, #8
	str r1, [r6, #8]
	str r2, [r3]
	ldr r2, [r6]
	ldr r1, [sp, #8]
	str r1, [r6]
	str r2, [sp, #8]
	ldr r2, [r6, #4]
	ldr r1, [sp, #0xc]
	str r1, [r6, #4]
	str r2, [sp, #0xc]
	bl ov45_022389B0
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov45_0223DB8C

	arm_func_start ov45_0223DCD0
ov45_0223DCD0: ; 0x0223DCD0
	ldr r1, [r0, #0x28]
	cmp r1, #3
	addls pc, pc, r1, lsl #2
	bx lr
_0223DCE0: ; jump table
	b _0223DCF0 ; case 0
	b _0223DD14 ; case 1
	b _0223DD28 ; case 2
	bx lr ; case 3
_0223DCF0:
	ldr r1, [r0, #0x30]
	cmp r1, #0
	ldrne r1, [r0, #0x34]
	cmpne r1, #0
	movne r1, #1
	moveq r1, #0
	str r1, [r0, #0x28]
	cmp r1, #0
	bxeq lr
_0223DD14:
	ldr r1, [r0, #0x10]
	cmp r1, #0
	movne r1, #2
	strne r1, [r0, #0x28]
	bx lr
_0223DD28:
	ldr r1, [r0, #0x38]
	cmp r1, #0
	movne r1, #3
	strne r1, [r0, #0x28]
	bx lr
	arm_func_end ov45_0223DCD0

	arm_func_start ov45_0223DD3C
ov45_0223DD3C: ; 0x0223DD3C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x34
	mov r6, r0
	mov r0, #0x3c
	mov r5, r1
	bl ov45_02242394
	movs r4, r0
	beq _0223DDCC
	ldr r1, _0223DE34 ; =ov45_02254FB0
	mov r0, #5
	str r1, [r4]
	str r0, [r4, #4]
	mov r2, #0
	str r2, [r4, #8]
	str r2, [r4, #0xc]
	add r0, sp, #0x24
	add r1, sp, #0x18
	str r2, [r4, #0x10]
	bl ov00_021ECB94
	add r0, sp, #0x24
	add r1, sp, #0x18
	bl RTC_ConvertDateTimeToSecond
	str r0, [r4, #8]
	str r1, [r4, #0xc]
	mov r1, #1
	str r1, [r4, #0x14]
	mov r0, #0
	str r0, [r4, #0x18]
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	str r1, [r4, #0x24]
	str r0, [r4, #0x28]
	str r5, [r4, #0x2c]
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	str r0, [r4, #0x38]
_0223DDCC:
	add r0, sp, #4
	add r2, sp, #0x14
	add r1, r6, #4
	str r4, [sp, #0x14]
	bl ov45_0223E648
	ldrb r0, [sp, #8]
	mov r2, #0
	ldr r1, [sp, #4]
	strb r2, [sp, #1]
	str r1, [sp, #0xc]
	strb r2, [sp]
	strb r0, [sp, #0x10]
	tst r0, #0xff
	bne _0223DE28
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0223DE1C
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
_0223DE1C:
	add sp, sp, #0x34
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, pc}
_0223DE28:
	mov r0, #1
	add sp, sp, #0x34
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223DE34: .word ov45_02254FB0
	arm_func_end ov45_0223DD3C

	arm_func_start ov45_0223DE38
ov45_0223DE38: ; 0x0223DE38
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	mov r4, r0
	ldr r0, [r4, #0xc]
	add r6, r4, #8
	mov r7, r1
	str r0, [sp, #4]
	cmp r0, r6
	beq _0223DEB8
	add r5, sp, #4
_0223DE60:
	ldr r0, [r0, #0xc]
	ldr r1, [r0, #0x2c]
	cmp r7, r1
	bne _0223DEA4
	cmp r0, #0
	beq _0223DE84
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
_0223DE84:
	add r1, sp, #4
	ldr r2, [r1]
	add r0, sp, #0
	add r1, r4, #4
	bl ov45_0223E6E8
	add sp, sp, #8
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0223DEA4:
	mov r0, r5
	bl ov45_02236E58
	ldr r0, [sp, #4]
	cmp r0, r6
	bne _0223DE60
_0223DEB8:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_0223DE38

	arm_func_start ov45_0223DEC4
ov45_0223DEC4: ; 0x0223DEC4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	mov r5, r0
	ldr r0, [r5, #0x3c]
	mov r4, r1
	cmp r4, r0
	addeq sp, sp, #0x18
	addeq r0, r5, #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r5, #0xc]
	add r7, r5, #8
	str r4, [sp, #0xc]
	str r4, [sp]
	str r7, [sp, #0x10]
	str r7, [sp, #4]
	str r0, [sp, #0x14]
	str r0, [sp, #8]
	add r6, sp, #8
	b _0223DF18
_0223DF10:
	mov r0, r6
	bl ov45_02236E58
_0223DF18:
	ldr r1, [sp, #8]
	cmp r1, r7
	ldrne r0, [r1, #0xc]
	ldrne r0, [r0, #0x2c]
	cmpne r4, r0
	bne _0223DF10
	add r0, r5, #8
	cmp r1, r0
	ldr r0, [sp, #8]
	moveq r0, #0
	ldrne r0, [r0, #0xc]
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_0223DEC4

	arm_func_start ov45_0223DF4C
ov45_0223DF4C: ; 0x0223DF4C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r5, r0
	ldr r0, [r5, #0xc]
	add r4, r5, #8
	str r0, [sp, #8]
	cmp r0, r4
	addeq sp, sp, #0xc
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r8, sp, #8
	add r7, sp, #0
	add r6, sp, #4
_0223DF7C:
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _0223DF94
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
_0223DF94:
	ldr r1, [sp, #8]
	mov r0, r8
	str r1, [sp, #4]
	bl ov45_02236E58
	ldr r2, [r6]
	mov r0, r7
	add r1, r5, #4
	bl ov45_0223E6E8
	ldr r0, [sp, #8]
	cmp r0, r4
	bne _0223DF7C
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov45_0223DF4C

	arm_func_start ov45_0223DFC8
ov45_0223DFC8: ; 0x0223DFC8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r1, r0
	ldr r0, [r1, #4]
	mov r2, #0
	add r0, r0, #1
	mov r4, r2
	cmp r0, #0x14
	bne _0223E008
	add r0, sp, #0
	bl ov45_0223E024
	ldr r0, [sp, #4]
	mov r2, #1
	add r0, r0, #1
	cmp r0, #0x14
	moveq r4, r2
_0223E008:
	cmp r2, #0
	beq _0223E018
	add r0, sp, #0
	bl ov45_022376BC
_0223E018:
	mov r0, r4
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_0223DFC8

	arm_func_start ov45_0223E024
ov45_0223E024: ; 0x0223E024
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r2, #0
	mov r6, r0
	str r2, [r6]
	str r2, [r6, #4]
	mov r4, r1
	str r2, [r6, #8]
	ldr r1, [r4, #4]
	cmp r1, #0
	bls _0223E054
	bl ov45_0223E830
_0223E054:
	ldr r0, [r4, #0xc]
	add r5, r4, #8
	str r0, [sp, #8]
	cmp r0, r5
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	sub r8, sp, #4
	mov r4, #0
	add sb, sp, #4
	add r7, sp, #8
_0223E07C:
	ldr r1, [r0, #0xc]
	ldr r0, [r1, #0x38]
	cmp r0, #0
	beq _0223E0E4
	ldr r0, [r1, #0x2c]
	str r0, [sp, #4]
	strb r4, [sp]
	ldr r1, [r6, #4]
	ldr r0, [r6, #8]
	cmp r1, r0
	bhs _0223E0C8
	mov r0, r1
	add r2, r0, #1
	str r2, [r6, #4]
	ldr r0, [r6]
	ldr r1, [sp, #4]
	add r0, r0, r2, lsl #2
	str r1, [r0, #-4]
	b _0223E0E4
_0223E0C8:
	strb r4, [sp, #1]
	and r0, r4, #0xff
	strb r0, [r8]
	ldr r2, [r8]
	mov r0, r6
	mov r1, sb
	bl ov45_0223E910
_0223E0E4:
	mov r0, r7
	bl ov45_02236E58
	ldr r0, [sp, #8]
	cmp r0, r5
	bne _0223E07C
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	arm_func_end ov45_0223E024

	arm_func_start ov45_0223E100
ov45_0223E100: ; 0x0223E100
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0xd4
	ldr ip, _0223E490 ; =ov45_02254FB0
	mov r6, r0
	mov sb, r1
	add r8, sp, #0x9c
	mov r7, #0
	mov sl, #5
	add r0, sp, #0x78
	add r1, sp, #0x6c
	mov r5, r2
	mov r4, r3
	str ip, [sp, #0x98]
	str sl, [r8]
	str r7, [r8, #4]
	str r7, [r8, #8]
	str r7, [r8, #0xc]
	add r7, sp, #0x98
	bl ov00_021ECB94
	add r0, sp, #0x78
	add r1, sp, #0x6c
	bl RTC_ConvertDateTimeToSecond
	str sb, [r7, #0x2c]
	stmib r8, {r0, r1}
	mov r0, #1
	str r0, [r8, #0x10]
	str r0, [r7, #0x24]
	mov r0, #0
	str r0, [r7, #0x18]
	str r0, [r7, #0x1c]
	str r0, [r7, #0x20]
	str r0, [r7, #0x28]
	str r0, [r7, #0x30]
	str r0, [r7, #0x34]
	str r0, [r7, #0x38]
	mov r1, r8
	add r0, r6, #0x14
	mov r2, #0x10
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	bne _0223E1D8
	ldr r0, [r7, #4]
	add r1, r7, #8
	str r0, [r6, #0x14]
	add r0, r6, #0x18
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldr r1, [r7, #0x10]
	mov r0, #1
	str r1, [r6, #0x20]
	str r0, [r6, #0x24]
_0223E1D8:
	ldr sb, [r6, #0x2c]
	ldr r0, [r7, #0x1c]
	mov r8, #0
	cmp sb, r0
	bne _0223E224
	cmp sb, #0
	beq _0223E220
	add r0, r6, #0x28
	bl ov45_02231C78
	mov sl, r0
	add r0, r7, #0x18
	bl ov45_02231C78
	mov r1, r0
	mov r0, sl
	mov r2, sb
	bl memcmp
	cmp r0, #0
	bne _0223E224
_0223E220:
	mov r8, #1
_0223E224:
	cmp r8, #0
	bne _0223E268
	add r0, r6, #0x28
	add r1, r7, #0x18
	cmp r0, r1
	beq _0223E260
	mov r3, #0
	ldr r1, [r7, #0x18]
	ldr r8, [r7, #0x1c]
	strb r3, [sp, #0xd]
	sub r2, sp, #4
	strb r3, [r2]
	ldr r3, [r2]
	add r2, r1, r8
	bl ov45_02232760
_0223E260:
	mov r0, #1
	str r0, [r6, #0x34]
_0223E268:
	ldr r1, [r7, #0x28]
	add r0, sp, #0xb0
	str r1, [r6, #0x38]
	ldr r1, [r7, #0x2c]
	str r1, [r6, #0x3c]
	ldr r1, [r7, #0x30]
	str r1, [r6, #0x40]
	ldr r1, [r7, #0x34]
	str r1, [r6, #0x44]
	ldr r1, [r7, #0x38]
	str r1, [r6, #0x48]
	bl ov45_022379D4
	mov r2, #0
	mov r3, #5
	add r0, sp, #0x5c
	add r1, sp, #0x50
	str r3, [sp, #0x88]
	str r2, [sp, #0x8c]
	str r2, [sp, #0x90]
	str r2, [sp, #0x94]
	bl ov00_021ECB94
	add r0, sp, #0x5c
	add r1, sp, #0x50
	bl RTC_ConvertDateTimeToSecond
	str r1, [sp, #0x90]
	ldr r1, [sp, #0x88]
	str r0, [sp, #0x8c]
	add r0, sp, #0x8c
	str r1, [sp, #0x3c]
	ldmia r0, {r2, r3}
	add r1, sp, #0x40
	stmia r1, {r2, r3}
	ldr r0, [sp, #0x94]
	add r7, sp, #0x3c
	str r0, [sp, #0x48]
	mov r0, #1
	str r0, [sp, #0x4c]
	add r0, r6, #0x14
	mov r1, r7
	mov r2, #0x10
	bl memcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	bne _0223E348
	ldr r0, [r7]
	add r1, r7, #4
	str r0, [r6, #0x14]
	add r0, r6, #0x18
	ldmia r1, {r2, r3}
	stmia r0, {r2, r3}
	ldr r1, [r7, #0xc]
	mov r0, #1
	str r1, [r6, #0x20]
	str r0, [r6, #0x24]
_0223E348:
	mov r1, #1
	str r1, [r6, #0x40]
	mov r0, #0
	add r2, r5, r4
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	str r0, [sp, #0x28]
	strb r0, [sp, #9]
	strb r0, [sp, #0xa]
	strb r0, [sp, #8]
	strb r0, [sp, #4]
	sub r1, sp, #4
	ldr r0, [sp, #0x1c]
	str r2, [r1]
	str r0, [r1, #4]
	ldr r3, [r1]
	add r0, sp, #0x20
	add r1, sp, #0x10
	str r5, [sp, #0x10]
	str r2, [sp, #0x18]
	ldmia r1, {r1, r2}
	bl ov45_022327B8
	mov r2, #0
	ldrb r0, [sp, #0xc]
	ldr r1, [sp, #0x20]
	ldr r4, [sp, #0x24]
	str r2, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r2, [sp, #0x34]
	sub r2, sp, #4
	strb r0, [r2]
	add r5, sp, #0x2c
	ldr r3, [r2]
	mov r0, r5
	add r2, r1, r4
	bl ov45_022383E0
	mov r0, #1
	str r0, [r5, #0xc]
	ldr r8, [r6, #0x2c]
	ldr r0, [sp, #0x30]
	mov r7, #0
	cmp r8, r0
	bne _0223E42C
	cmp r8, #0
	beq _0223E428
	add r0, r6, #0x28
	bl ov45_02231C78
	mov r4, r0
	mov r0, r5
	bl ov45_02231C78
	mov r1, r0
	mov r0, r4
	mov r2, r8
	bl memcmp
	cmp r0, #0
	bne _0223E42C
_0223E428:
	mov r7, #1
_0223E42C:
	cmp r7, #0
	bne _0223E468
	add r0, r6, #0x28
	cmp r0, r5
	beq _0223E460
	mov r3, #0
	ldmia r5, {r1, r4}
	strb r3, [sp, #0xb]
	sub r2, sp, #4
	strb r3, [r2]
	ldr r3, [r2]
	add r2, r1, r4
	bl ov45_02232760
_0223E460:
	mov r0, #1
	str r0, [r6, #0x34]
_0223E468:
	add r0, sp, #0x2c
	bl ov45_022379D4
	mov r1, #1
	add r0, sp, #0x20
	str r1, [r6, #0x44]
	bl ov45_022379D4
	mov r0, #1
	str r0, [r6, #0x48]
	add sp, sp, #0xd4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_0223E490: .word ov45_02254FB0
	arm_func_end ov45_0223E100

	arm_func_start ov45_0223E494
ov45_0223E494: ; 0x0223E494
	ldr r0, [r0, #0x28]
	cmp r0, #1
	movge r0, #1
	movlt r0, #0
	bx lr
	arm_func_end ov45_0223E494

	arm_func_start ov45_0223E4A8
ov45_0223E4A8: ; 0x0223E4A8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x20
	ldr r1, _0223E554 ; =ov45_02255200
	mov r7, r0
	ldr r2, [r1, #8]
	ldr r1, [r1, #4]
	str r2, [sp, #4]
	str r1, [sp]
	ldr r0, [r7, #0xc]
	add r5, r7, #8
	str r1, [sp, #0x10]
	str r2, [sp, #0x14]
	str r5, [sp, #0x18]
	str r5, [sp, #8]
	str r0, [sp, #0x1c]
	str r0, [sp, #0xc]
	add r6, sp, #0
	add r4, sp, #0xc
	b _0223E4FC
_0223E4F4:
	mov r0, r4
	bl ov45_02236E58
_0223E4FC:
	ldr r0, [sp, #0xc]
	cmp r0, r5
	beq _0223E538
	ldr r1, [sp, #4]
	ldr r0, [r0, #0xc]
	tst r1, #1
	add r0, r0, r1, asr #1
	ldreq r1, [r6]
	beq _0223E52C
	ldr r2, [r0]
	ldr r1, [r6]
	ldr r1, [r2, r1]
_0223E52C:
	blx r1
	cmp r0, #0
	bne _0223E4F4
_0223E538:
	ldr r1, [sp, #0xc]
	add r0, r7, #8
	cmp r1, r0
	moveq r0, #1
	movne r0, #0
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223E554: .word ov45_02255200
	arm_func_end ov45_0223E4A8

	arm_func_start ov45_0223E558
ov45_0223E558: ; 0x0223E558
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	ldr r1, [r0, #0xc]
	add sb, r0, #8
	str r1, [sp]
	cmp r1, sb
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r6, #0
	add fp, sp, #4
	add sl, sp, #0x10
_0223E584:
	ldr r0, [r1, #0xc]
	bl ov45_0223DCD0
	ldr r0, [sp]
	ldr r3, [r0, #0xc]
	ldr r0, [r3, #0x28]
	cmp r0, #3
	addls pc, pc, r0, lsl #2
	b _0223E62C
_0223E5A4: ; jump table
	b _0223E62C ; case 0
	b _0223E62C ; case 1
	b _0223E5B4 ; case 2
	b _0223E62C ; case 3
_0223E5B4:
	str r6, [r3, #0x14]
	ldr r0, [sp]
	ldr r5, [r0, #0xc]
	str r6, [r5, #0x24]
	ldr r2, [r3, #4]
	ldr r1, [r3, #8]
	ldr r0, [r3, #0xc]
	str r2, [sp, #0xc]
	str r1, [sp, #4]
	str r0, [sp, #8]
	ldmia fp, {r0, r1, r2}
	stmia sl, {r0, r1, r2}
	ldr r0, [sp]
	ldr r7, [r5, #0x1c]
	ldr r0, [r0, #0xc]
	ldr r8, [r0, #0x2c]
	bl ov45_022310B0
	mov r4, r0
	add r0, r5, #0x18
	bl ov45_02231C78
	mov r2, r0
	ldr r4, [r4, #0xc]
	mov r3, r7
	mov r0, r8
	mov r1, sl
	blx r4
	ldr r0, [sp]
	ldr r1, [r0, #0xc]
	mov r0, #1
	str r0, [r1, #0x38]
_0223E62C:
	add r0, sp, #0
	bl ov45_02236E58
	ldr r1, [sp]
	cmp r1, sb
	bne _0223E584
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov45_0223E558

	arm_func_start ov45_0223E648
ov45_0223E648: ; 0x0223E648
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	add ip, sp, #4
	mov r4, r2
	mov r5, r1
	mov r6, r0
	add r2, sp, #8
	add r3, sp, #5
	mov r0, r5
	mov r1, r4
	str ip, [sp]
	bl ov45_0223E940
	ldr r3, [sp, #8]
	mov r1, r0
	cmp r3, #0
	beq _0223E6A0
	ldr r2, [r3, #0xc]
	ldr r0, [r4]
	ldr r2, [r2, #0x2c]
	ldr r0, [r0, #0x2c]
	cmp r2, r0
	bge _0223E6CC
_0223E6A0:
	str r4, [sp]
	ldrb r2, [sp, #5]
	ldrb r3, [sp, #4]
	mov r0, r5
	bl ov45_0223E758
	ldr r1, _0223E6E4 ; =ov45_02255200
	str r0, [r6]
	ldrb r0, [r1]
	add sp, sp, #0xc
	strb r0, [r6, #4]
	ldmia sp!, {r3, r4, r5, r6, pc}
_0223E6CC:
	ldr r0, _0223E6E4 ; =ov45_02255200
	str r3, [r6]
	ldrb r0, [r0, #1]
	strb r0, [r6, #4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223E6E4: .word ov45_02255200
	arm_func_end ov45_0223E648

	arm_func_start ov45_0223E6E8
ov45_0223E6E8: ; 0x0223E6E8
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [sp, #0x18]
	ldr r1, [r5, #8]
	mov r6, r0
	cmp r4, r1
	bne _0223E718
	add r0, sp, #0x18
	bl ov45_02236E58
	ldr r0, [sp, #0x18]
	str r0, [r5, #8]
_0223E718:
	ldr r1, [r5, #4]
	mov r0, r4
	bl ov45_022370D0
	str r0, [r6]
	cmp r4, #0
	beq _0223E740
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_0223E740:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_0223E6E8

	arm_func_start ov45_0223E758
ov45_0223E758: ; 0x0223E758
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r8, r0
	ldr r4, [r8]
	mvn r0, #0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp r4, r0
	bne _0223E78C
	ldr r0, _0223E82C ; =ov45_0225520C
	bl printf
	bl abort
_0223E78C:
	mov r1, #0
	mov r0, #0x10
	strb r1, [sp]
	bl ov45_02242394
	mov r4, r0
	add r0, r8, #4
	str r0, [sp, #0xc]
	adds r1, r4, #0xc
	ldrne r0, [sp, #0x30]
	str r4, [sp, #0x10]
	ldrne r0, [r0]
	str r4, [sp, #4]
	strne r0, [r1]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [sp, #0x10]
	str r0, [r4]
	adds r0, r4, #8
	strne r7, [r0]
	cmp r6, #0
	strne r4, [r7]
	streq r4, [r7, #4]
	ldr r1, [r8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r8]
	ldr r1, [r8, #4]
	str r4, [sp, #8]
	bl ov45_02236EC4
	cmp r5, #0
	ldr r1, [sp, #0x10]
	strne r4, [r8, #8]
	cmp r1, #0
	beq _0223E820
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
_0223E820:
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0223E82C: .word ov45_0225520C
	arm_func_end ov45_0223E758

	arm_func_start ov45_0223E830
ov45_0223E830: ; 0x0223E830
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r2, #0
	mov r5, r0
	str r2, [sp, #4]
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	strb r2, [sp, #2]
	sub r0, sp, #4
	strb r2, [r0]
	ldr r2, [r0]
	add r0, sp, #4
	bl ov45_0223EA04
	ldr r4, [r5]
	ldr r0, [r5, #4]
	mov ip, #0
	add r0, r4, r0, lsl #2
	sub r1, r0, r4
	mov r0, r1, asr #1
	add r6, r1, r0, lsr #30
	mov r0, r6, asr #2
	mov r7, r0, lsl #2
	ldr r3, [sp, #4]
	ldr r0, [sp, #8]
	mov r1, r4
	mov r2, r7
	add r0, r3, r0, lsl #2
	strb ip, [sp, #1]
	bl memcpy
	mov r0, r4
	mov r2, r7
	mov r1, #0
	bl memset
	ldr r1, [sp, #8]
	mov r0, #0
	add r1, r1, r6, asr #2
	str r1, [sp, #8]
	strb r0, [sp]
	str r0, [r5, #4]
	add r3, sp, #0xc
	ldr r2, [r5, #8]
	ldr r1, [r3]
	add r0, sp, #4
	str r1, [r5, #8]
	str r2, [r3]
	ldr r2, [r5]
	ldr r1, [sp, #4]
	str r1, [r5]
	str r2, [sp, #4]
	ldr r2, [r5, #4]
	ldr r1, [sp, #8]
	str r1, [r5, #4]
	str r2, [sp, #8]
	bl ov45_0223E9B4
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_0223E830

	arm_func_start ov45_0223E910
ov45_0223E910: ; 0x0223E910
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r2, #0
	mov r5, r0
	mov r1, #1
	strb r2, [sp]
	bl ov45_0223EA34
	mov r0, r5
	mov r2, r4
	mov r1, #1
	bl ov45_0223EB00
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0223E910

	arm_func_start ov45_0223E940
ov45_0223E940: ; 0x0223E940
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	str r4, [r2]
	ldr r6, [r0, #4]
	mov r4, #1
	ldr r7, [sp, #0x18]
	strb r4, [r3]
	strb r4, [r7]
	cmp r6, #0
	add r0, r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov ip, #0
	mov lr, r4
_0223E974:
	ldr r4, [r1]
	ldr r0, [r6, #0xc]
	ldr r5, [r4, #0x2c]
	ldr r4, [r0, #0x2c]
	mov r0, r6
	cmp r5, r4
	ldrlt r6, [r6]
	strltb lr, [r3]
	blt _0223E9A8
	str r6, [r2]
	ldr r6, [r6, #4]
	strb ip, [r3]
	strb ip, [r7]
_0223E9A8:
	cmp r6, #0
	bne _0223E974
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_0223E940

	arm_func_start ov45_0223E9B4
ov45_0223E9B4: ; 0x0223E9B4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _0223E9F8
	ldr r2, [r4, #4]
	mov r0, #0
	strb r0, [sp]
	ldr r1, [r4, #4]
	sub r1, r1, r2
	str r1, [r4, #4]
	ldr r1, [r4]
	cmp r1, #0
	beq _0223E9F8
	mov r2, r0
	bl ov00_021EC2EC
_0223E9F8:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_0223E9B4

	arm_func_start ov45_0223EA04
ov45_0223EA04: ; 0x0223EA04
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mvn r1, #0xc0000000
	mov r5, r0
	cmp r4, r1
	bls _0223EA20
	bl _ZNSt15__vector_commonILb1EE18throw_length_errorEv
_0223EA20:
	mov r0, r4, lsl #2
	bl ov45_02242394
	str r0, [r5]
	str r4, [r5, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0223EA04

	arm_func_start ov45_0223EA34
ov45_0223EA34: ; 0x0223EA34
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r4, [r0, #8]
	mvn r0, #0xc0000000
	ldr r1, [sp, #0x14]
	sub r0, r0, r4
	cmp r1, r0
	bls _0223EA5C
	bl _ZNSt15__vector_commonILb1EE18throw_length_errorEv
_0223EA5C:
	ldr r0, _0223EAF8 ; =0x15555555
	cmp r4, r0
	bhs _0223EAA8
	add r1, r4, #1
	ldr r0, _0223EAFC ; =0xCCCCCCCD
	add r1, r1, r1, lsl #1
	umull r0, r2, r1, r0
	mov r2, r2, lsr #2
	ldr r0, [sp, #0x14]
	str r2, [sp, #4]
	cmp r0, r2
	addhi r0, sp, #0x14
	addls r0, sp, #4
	ldr r0, [r0]
	add sp, sp, #8
	add r0, r4, r0
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0223EAA8:
	cmp r4, r0, lsl #1
	bhs _0223EAE4
	ldr r0, [sp, #0x14]
	add r1, r4, #1
	mov r2, r1, lsr #1
	cmp r0, r1, lsr #1
	addhi r0, sp, #0x14
	str r2, [sp]
	addls r0, sp, #0
	ldr r0, [r0]
	add sp, sp, #8
	add r0, r4, r0
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_0223EAE4:
	mvn r0, #0xc0000000
	add sp, sp, #8
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_0223EAF8: .word 0x15555555
_0223EAFC: .word 0xCCCCCCCD
	arm_func_end ov45_0223EA34

	arm_func_start ov45_0223EB00
ov45_0223EB00: ; 0x0223EB00
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x1c
	mov r4, #0
	mov r6, r0
	add r3, r6, #8
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x18]
	str r3, [sp, #0x14]
	mov r5, r1
	ldr r3, [r6, #4]
	ldr r1, [r6, #8]
	add r3, r3, r5
	sub r1, r3, r1
	mov r4, r2
	bl ov45_0223EA34
	mov r3, #0
	mov r1, r0
	strb r3, [sp, #3]
	sub r0, sp, #4
	strb r3, [r0]
	ldr r2, [r0]
	add r0, sp, #8
	strb r3, [sp, #4]
	bl ov45_0223EC80
	ldr r3, [r6, #4]
	ldr r1, [sp, #8]
	mov r2, #0
	ldr r0, [sp, #0xc]
	add r1, r1, r3, lsl #2
	mov ip, r5
	str r3, [sp, #0x18]
	strb r2, [sp, #2]
	cmp r5, #0
	add r1, r1, r0, lsl #2
	beq _0223EBA4
_0223EB94:
	ldr r0, [r4]
	subs ip, ip, #1
	str r0, [r1], #4
	bne _0223EB94
_0223EBA4:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x18]
	add r0, r0, r5
	str r0, [sp, #0xc]
	ldr r4, [r6]
	ldr r0, [r6, #4]
	mov ip, #0
	add r0, r4, r0, lsl #2
	sub r2, r0, r4
	mov r0, r2, asr #1
	add r5, r2, r0, lsr #30
	sub r3, r1, r5, asr #2
	mov r2, r5, asr #2
	ldr r0, [sp, #8]
	mov r7, r2, lsl #2
	mov r1, r4
	mov r2, r7
	add r0, r0, r3, lsl #2
	strb ip, [sp, #1]
	str r3, [sp, #0x18]
	bl memcpy
	mov r0, r4
	mov r2, r7
	mov r1, #0
	bl memset
	ldr r1, [sp, #0xc]
	mov r0, #0
	add r1, r1, r5, asr #2
	str r1, [sp, #0xc]
	strb r0, [sp]
	str r0, [r6, #4]
	add r3, sp, #0x10
	ldr r2, [r6, #8]
	ldr r1, [r3]
	add r0, sp, #8
	str r1, [r6, #8]
	str r2, [r3]
	ldr r2, [r6]
	ldr r1, [sp, #8]
	str r1, [r6]
	str r2, [sp, #8]
	ldr r2, [r6, #4]
	ldr r1, [sp, #0xc]
	str r1, [r6, #4]
	str r2, [sp, #0xc]
	bl ov45_0223EC64
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ov45_0223EB00

	arm_func_start ov45_0223EC64
ov45_0223EC64: ; 0x0223EC64
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r1, #0
	str r1, [r4, #4]
	bl ov45_0223ECB0
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_0223EC64

	arm_func_start ov45_0223EC80
ov45_0223EC80: ; 0x0223EC80
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mvn r1, #0xc0000000
	mov r5, r0
	cmp r4, r1
	bls _0223EC9C
	bl _ZNSt15__vector_commonILb1EE18throw_length_errorEv
_0223EC9C:
	mov r0, r4, lsl #2
	bl ov45_02242394
	str r0, [r5]
	str r4, [r5, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0223EC80

	arm_func_start ov45_0223ECB0
ov45_0223ECB0: ; 0x0223ECB0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _0223ECF4
	ldr r2, [r4, #4]
	mov r0, #0
	strb r0, [sp]
	ldr r1, [r4, #4]
	sub r1, r1, r2
	str r1, [r4, #4]
	ldr r1, [r4]
	cmp r1, #0
	beq _0223ECF4
	mov r2, r0
	bl ov00_021EC2EC
_0223ECF4:
	mov r0, r4
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_0223ECB0

	arm_func_start ov45_0223ED00
ov45_0223ED00: ; 0x0223ED00
	ldr r0, _0223ED18 ; =ov45_022577DC
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #4]
	cmpne r0, #5
	bx lr
	.balign 4, 0
_0223ED18: .word ov45_022577DC
	arm_func_end ov45_0223ED00

	arm_func_start ov45_0223ED1C
ov45_0223ED1C: ; 0x0223ED1C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _0223EDD4 ; =ov45_022577DC
	ldr r3, [r0]
	cmp r3, #0
	beq _0223ED44
	ldr r0, [r3, #4]
	cmp r0, #5
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
_0223ED44:
	mov r2, #0
	add r1, sp, #0
	add r0, r3, #0x9c
	str r2, [sp]
	bl ov45_02232D8C
	ldr r0, _0223EDD4 ; =ov45_022577DC
	ldr r4, [r0]
	ldr r1, [r4, #4]
	cmp r1, #4
	bne _0223EDB0
	cmp r4, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	beq _0223ED9C
	mov r0, r4
	bl ov45_02242858
	cmp r4, #0
	beq _0223ED9C
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_0223ED9C:
	ldr r0, _0223EDD4 ; =ov45_022577DC
	mov r1, #0
	str r1, [r0]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0223EDB0:
	mov r1, #3
	str r1, [r4, #0x58]
	mov r1, #5
	str r1, [r4, #4]
	ldr r0, [r0]
	mov r1, #1
	str r1, [r0, #0x60]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0223EDD4: .word ov45_022577DC
	arm_func_end ov45_0223ED1C

	arm_func_start ov45_0223EDD8
ov45_0223EDD8: ; 0x0223EDD8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x78
	ldr r0, _0223EFF0 ; =ov45_022577DC
	mov r4, r1
	ldr r0, [r0]
	mov r5, r2
	mov r7, r3
	cmp r0, #0
	beq _0223EE0C
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0x78
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0223EE0C:
	ldr r6, _0223EFF4 ; =ov45_022552C0
	add r0, sp, #0x18
	mov r1, r4
	bl ov45_02237B58
	add r0, sp, #0x24
	mov r1, r6
	bl ov45_02237B58
	add r0, sp, #0x18
	add r1, sp, #0x24
	mov r2, #6
	bl ov45_0223D644
	mov r6, r0
	add r0, sp, #0x24
	bl ov45_02237BC8
	add r0, sp, #0x18
	bl ov45_02237BC8
	cmp r6, #0
	bne _0223EF78
	ldr r4, _0223EFF8 ; =ov45_022552C8
	add r0, sp, #0
	mov r1, r5
	bl ov45_02237B58
	add r0, sp, #0xc
	mov r1, r4
	bl ov45_02237B58
	add r0, sp, #0
	add r1, sp, #0xc
	mov r2, #0xc
	bl ov45_0223D644
	mov r4, r0
	add r0, sp, #0xc
	bl ov45_02237BC8
	add r0, sp, #0
	bl ov45_02237BC8
	cmp r4, #0
	addne sp, sp, #0x78
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, sp, #0x60
	mov r1, r5
	bl ov45_02237B58
	ldr r1, _0223EFFC ; =ov45_022552D8
	add r0, sp, #0x54
	bl ov45_02237B58
	add r0, sp, #0x6c
	add r1, sp, #0x60
	add r2, sp, #0x54
	mov r3, #0
	bl ov45_0223F000
	add r0, sp, #0x54
	bl ov45_02237BC8
	add r0, sp, #0x60
	bl ov45_02237BC8
	ldr r0, [sp, #0x70]
	cmp r0, #0
	bne _0223EEF8
	add r0, sp, #0x6c
	bl ov45_02237664
	add sp, sp, #0x78
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0223EEF8:
	ldr r1, [sp, #0x70]
	mov r0, #0xc
	sub r1, r1, #1
	mul r2, r1, r0
	ldr r1, [sp, #0x6c]
	ldr r0, [r1, r2]
	add r1, r1, r2
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, r1, #1
	ldrne r0, [r1, #8]
	bl atoi
	movs r4, r0
	bne _0223EF40
	add r0, sp, #0x6c
	bl ov45_02237664
	add sp, sp, #0x78
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0223EF40:
	ldr r0, _0223EFF0 ; =ov45_022577DC
	add r3, sp, #0x48
	ldr r0, [r0]
	add r0, r0, #0x64
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r1, [sp, #0x90]
	ldr r2, [sp, #0x4c]
	mov r0, r4
	blx r2
	add r0, sp, #0x6c
	bl ov45_02237664
	add sp, sp, #0x78
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0223EF78:
	cmp r7, #3
	addne sp, sp, #0x78
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, sp, #0x3c
	mov r1, r4
	bl ov45_02237B58
	ldr r0, _0223EFF0 ; =ov45_022577DC
	add r1, sp, #0x3c
	ldr r0, [r0]
	bl ov45_022435F8
	mov r4, r0
	add r0, sp, #0x3c
	bl ov45_02237BC8
	mvn r0, #0
	cmp r4, r0
	addeq sp, sp, #0x78
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _0223EFF0 ; =ov45_022577DC
	add r3, sp, #0x30
	ldr r0, [r0]
	add r0, r0, #0x64
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	ldr r2, [sp, #0x90]
	ldr r3, [sp, #0x30]
	mov r0, r4
	mov r1, r5
	blx r3
	add sp, sp, #0x78
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223EFF0: .word ov45_022577DC
_0223EFF4: .word ov45_022552C0
_0223EFF8: .word ov45_022552C8
_0223EFFC: .word ov45_022552D8
	arm_func_end ov45_0223EDD8

	arm_func_start ov45_0223F000
ov45_0223F000: ; 0x0223F000
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x30
	mov sl, r0
	mov r4, #0
	str r4, [sl]
	str r4, [sl, #4]
	add r0, sp, #0x24
	str r2, [sp]
	str r3, [sp, #4]
	str r4, [sl, #8]
	mov r8, #1
	bl ov45_02237A24
	sub r5, sp, #4
	add r6, sp, #0x24
	add r7, sp, #0x18
	add fp, sp, #0xc
	mvn r4, #0
	b _0223F104
_0223F048:
	cmp sb, #0
	beq _0223F0DC
	mov r0, r7
	mov r1, r6
	mov r2, #0
	mov r3, sb
	bl ov45_02236680
	mov r1, #0
	add r0, sp, #0xb
	strb r1, [r0]
	ldr r1, [sl, #4]
	ldr r0, [sl, #8]
	cmp r1, r0
	bhs _0223F0AC
	mov r0, #0xc
	mul r0, r1, r0
	ldr r1, [sl]
	adds r0, r1, r0
	beq _0223F09C
	mov r1, r7
	bl ov45_02237A24
_0223F09C:
	ldr r0, [sl, #4]
	add r0, r0, #1
	str r0, [sl, #4]
	b _0223F0D0
_0223F0AC:
	mov r0, #0
	mov r2, #0
	strb r0, [sp, #0xa]
	mov r2, r2
	strb r2, [r5]
	ldr r2, [r5]
	mov r0, sl
	mov r1, r7
	bl ov45_02237634
_0223F0D0:
	mov r0, r7
	bl ov45_02237BC8
	add r8, r8, #1
_0223F0DC:
	add r2, sb, #1
	mov r0, fp
	mov r1, r6
	mov r3, r4
	bl ov45_02236680
	mov r0, r6
	mov r1, fp
	bl ov45_02237D48
	mov r0, fp
	bl ov45_02237BC8
_0223F104:
	ldr r0, [sp, #4]
	cmp r8, r0
	beq _0223F12C
	ldr r1, [sp]
	mov r0, r6
	mov r2, #0
	bl ov45_02242254
	mov sb, r0
	cmp sb, r4
	bne _0223F048
_0223F12C:
	ldr r0, [sp, #0x24]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldrne r0, [sp, #0x28]
	bne _0223F14C
	ldrb r0, [sp, #0x24]
	mov r0, r0, lsl #0x18
	mov r0, r0, lsr #0x19
_0223F14C:
	cmp r0, #0
	beq _0223F1B8
	mov r2, #0
	strb r2, [sp, #9]
	ldr r1, [sl, #4]
	ldr r0, [sl, #8]
	cmp r1, r0
	bhs _0223F198
	mov r0, #0xc
	mul r0, r1, r0
	ldr r1, [sl]
	adds r0, r1, r0
	beq _0223F188
	add r1, sp, #0x24
	bl ov45_02237A24
_0223F188:
	ldr r0, [sl, #4]
	add r0, r0, #1
	str r0, [sl, #4]
	b _0223F1B8
_0223F198:
	strb r2, [sp, #8]
	sub r1, sp, #4
	and r0, r2, #0xff
	strb r0, [r1]
	ldr r2, [r1]
	add r1, sp, #0x24
	mov r0, sl
	bl ov45_02237634
_0223F1B8:
	add r0, sp, #0x24
	bl ov45_02237BC8
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov45_0223F000

	arm_func_start ov45_0223F1C8
ov45_0223F1C8: ; 0x0223F1C8
	ldr r0, _0223F1E0 ; =ov45_022577DC
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #4]
	cmpne r0, #5
	bx lr
	.balign 4, 0
_0223F1E0: .word ov45_022577DC
	arm_func_end ov45_0223F1C8

	arm_func_start ov45_0223F1E4
ov45_0223F1E4: ; 0x0223F1E4
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	ldr r0, _0223F2D4 ; =ov45_022577DC
	mov r7, r1
	ldr r0, [r0]
	mov r6, r3
	cmp r0, #0
	beq _0223F214
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0x30
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0223F214:
	ldr r0, [sp, #0x48]
	cmp r0, #3
	addne sp, sp, #0x30
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, sp, #0x24
	mov r1, r2
	bl ov45_02237B58
	ldr r0, _0223F2D4 ; =ov45_022577DC
	add r1, sp, #0x24
	ldr r0, [r0]
	bl ov45_022435F8
	mov r4, r0
	add r0, sp, #0x24
	bl ov45_02237BC8
	add r0, sp, #0x18
	mov r1, r7
	bl ov45_02237B58
	ldr r0, _0223F2D4 ; =ov45_022577DC
	add r1, sp, #0x18
	ldr r0, [r0]
	bl ov45_02242C3C
	mov r5, r0
	add r0, sp, #0x18
	bl ov45_02237BC8
	mov r1, r7
	add r0, sp, #0xc
	bl ov45_02237B58
	ldr r1, _0223F2D4 ; =ov45_022577DC
	add r0, sp, #0
	ldr r1, [r1]
	add r2, sp, #0xc
	bl ov45_022428D8
	ldr r0, [sp]
	ldr r3, [r5, #0x14]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #1
	ldrne r0, [sp, #8]
	ldr r5, [r5, #8]
	mov r1, r4
	mov r2, r6
	blx r5
	add r0, sp, #0
	bl ov45_02237BC8
	add r0, sp, #0xc
	bl ov45_02237BC8
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223F2D4: .word ov45_022577DC
	arm_func_end ov45_0223F1E4

	arm_func_start ov45_0223F2D8
ov45_0223F2D8: ; 0x0223F2D8
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r0, _0223F328 ; =ov45_022577DC
	ldr r0, [r0]
	cmp r0, #0
	beq _0223F300
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0xc
	ldmeqia sp!, {pc}
_0223F300:
	add r0, sp, #0
	bl ov45_02237B58
	ldr r0, _0223F328 ; =ov45_022577DC
	add r1, sp, #0
	ldr r0, [r0]
	bl ov45_0224335C
	add r0, sp, #0
	bl ov45_02237BC8
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.balign 4, 0
_0223F328: .word ov45_022577DC
	arm_func_end ov45_0223F2D8

	arm_func_start ov45_0223F32C
ov45_0223F32C: ; 0x0223F32C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0xa8
	ldr r0, _0223F5C4 ; =ov45_022577DC
	mov r5, r1
	ldr r0, [r0]
	mov r4, r2
	cmp r0, #0
	beq _0223F35C
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0xa8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0223F35C:
	add r0, sp, #0x90
	mov r1, r5
	bl ov45_02237B58
	ldr r0, _0223F5C4 ; =ov45_022577DC
	add r1, sp, #0x90
	ldr r0, [r0]
	bl ov45_02243808
	mov r6, r0
	add r0, sp, #0x90
	bl ov45_02237BC8
	cmp r6, #0
	beq _0223F3AC
	ldr r0, _0223F5C4 ; =ov45_022577DC
	mov r1, r5
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov45_02250F5C
	cmp r0, r6
	addgt sp, sp, #0xa8
	ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
_0223F3AC:
	add r0, sp, #0x84
	mov r1, r4
	bl ov45_02237B58
	add r0, sp, #0x84
	bl ov45_02242A2C
	ldr r1, _0223F5C4 ; =ov45_022577DC
	mov r2, r0
	ldr r1, [r1]
	add r0, sp, #0x9c
	bl ov45_0224367C
	add r0, sp, #0x84
	bl ov45_02237BC8
	add r0, sp, #0x78
	mov r1, r5
	bl ov45_02237B58
	ldr r0, _0223F5C4 ; =ov45_022577DC
	add r1, sp, #0x9c
	ldr r0, [r0]
	add r2, sp, #0x78
	bl ov45_02243280
	mov r6, r0
	add r0, sp, #0x78
	bl ov45_02237BC8
	cmp r6, #0
	beq _0223F4AC
	add r0, sp, #0x6c
	mov r1, r5
	bl ov45_02237B58
	ldr r0, _0223F5C4 ; =ov45_022577DC
	add r1, sp, #0x6c
	ldr r0, [r0]
	bl ov45_02242C3C
	mov r6, r0
	add r0, sp, #0x6c
	bl ov45_02237BC8
	add r0, sp, #0x60
	mov r1, r5
	bl ov45_02237B58
	ldr r1, _0223F5C4 ; =ov45_022577DC
	add r0, sp, #0x54
	ldr r1, [r1]
	add r2, sp, #0x60
	bl ov45_022428D8
	add r0, sp, #0x48
	mov r1, r4
	bl ov45_02237B58
	ldr r1, [sp, #0x54]
	add r0, sp, #0x48
	mov r1, r1, lsl #0x1f
	movs r1, r1, lsr #0x1f
	addeq r7, sp, #0x55
	ldrne r7, [sp, #0x5c]
	bl ov45_02242A2C
	mov r1, r0
	ldr r2, [r6, #0x14]
	ldr r3, [r6, #4]
	mov r0, r7
	blx r3
	add r0, sp, #0x48
	bl ov45_02237BC8
	add r0, sp, #0x54
	bl ov45_02237BC8
	add r0, sp, #0x60
	bl ov45_02237BC8
_0223F4AC:
	add r0, sp, #0x3c
	mov r1, r4
	bl ov45_02237B58
	add r0, sp, #0x30
	mov r1, r5
	bl ov45_02237B58
	ldr r0, _0223F5C4 ; =ov45_022577DC
	add r1, sp, #0x3c
	ldr r0, [r0]
	add r2, sp, #0x30
	bl ov45_02242D30
	mov r4, r0
	add r0, sp, #0x30
	bl ov45_02237BC8
	add r0, sp, #0x3c
	bl ov45_02237BC8
	mvn r0, #0
	cmp r4, r0
	bne _0223F508
	add r0, sp, #0x9c
	bl ov45_02237BC8
	add sp, sp, #0xa8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0223F508:
	add r0, sp, #0x24
	mov r1, r5
	bl ov45_02237B58
	ldr r0, _0223F5C4 ; =ov45_022577DC
	add r1, sp, #0x24
	ldr r0, [r0]
	bl ov45_02243794
	mov r6, r0
	add r0, sp, #0x24
	bl ov45_02237BC8
	cmp r6, #0
	beq _0223F5B4
	add r0, sp, #0x18
	mov r1, r5
	bl ov45_02237B58
	ldr r0, _0223F5C4 ; =ov45_022577DC
	add r1, sp, #0x18
	ldr r0, [r0]
	bl ov45_02242C3C
	mov r6, r0
	add r0, sp, #0x18
	bl ov45_02237BC8
	add r0, sp, #0xc
	mov r1, r5
	bl ov45_02237B58
	ldr r1, _0223F5C4 ; =ov45_022577DC
	add r0, sp, #0
	ldr r1, [r1]
	add r2, sp, #0xc
	bl ov45_022428D8
	ldr r0, [sp]
	ldr r2, [r6, #0x14]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #1
	ldrne r0, [sp, #8]
	ldr r3, [r6]
	mov r1, r4
	blx r3
	add r0, sp, #0
	bl ov45_02237BC8
	add r0, sp, #0xc
	bl ov45_02237BC8
_0223F5B4:
	add r0, sp, #0x9c
	bl ov45_02237BC8
	add sp, sp, #0xa8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223F5C4: .word ov45_022577DC
	arm_func_end ov45_0223F32C

	arm_func_start ov45_0223F5C8
ov45_0223F5C8: ; 0x0223F5C8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x48
	ldr r0, _0223F6F0 ; =ov45_022577DC
	mov r7, r1
	ldr r0, [r0]
	mov r6, r2
	cmp r0, #0
	beq _0223F5F8
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0x48
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_0223F5F8:
	add r0, sp, #0x3c
	mov r1, r6
	bl ov45_02237B58
	ldr r0, _0223F6F0 ; =ov45_022577DC
	add r1, sp, #0x3c
	ldr r0, [r0]
	bl ov45_022435F8
	mov r4, r0
	add r0, sp, #0x3c
	bl ov45_02237BC8
	mvn r0, #0
	cmp r4, r0
	addeq sp, sp, #0x48
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r0, sp, #0x30
	mov r1, r7
	bl ov45_02237B58
	ldr r0, _0223F6F0 ; =ov45_022577DC
	add r1, sp, #0x30
	ldr r0, [r0]
	bl ov45_02242C3C
	mov r5, r0
	add r0, sp, #0x30
	bl ov45_02237BC8
	add r0, sp, #0x24
	mov r1, r7
	bl ov45_02237B58
	ldr r1, _0223F6F0 ; =ov45_022577DC
	add r0, sp, #0x18
	ldr r1, [r1]
	add r2, sp, #0x24
	bl ov45_022428D8
	ldr r0, [sp, #0x18]
	ldr r2, [r5, #0x14]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #0x19
	ldrne r0, [sp, #0x20]
	ldr r3, [r5, #4]
	mov r1, r4
	blx r3
	add r0, sp, #0x18
	bl ov45_02237BC8
	add r0, sp, #0x24
	bl ov45_02237BC8
	add r0, sp, #0xc
	mov r1, r6
	bl ov45_02237B58
	add r0, sp, #0
	mov r1, r7
	bl ov45_02237B58
	ldr r0, _0223F6F0 ; =ov45_022577DC
	add r1, sp, #0xc
	ldr r0, [r0]
	add r2, sp, #0
	bl ov45_02243280
	add r0, sp, #0
	bl ov45_02237BC8
	add r0, sp, #0xc
	bl ov45_02237BC8
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223F6F0: .word ov45_022577DC
	arm_func_end ov45_0223F5C8

	arm_func_start ov45_0223F6F4
ov45_0223F6F4: ; 0x0223F6F4
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x18
	ldr r0, _0223F764 ; =ov45_022577DC
	mov r4, r3
	ldr r0, [r0]
	cmp r0, #0
	beq _0223F720
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0x18
	ldmeqia sp!, {r4, pc}
_0223F720:
	add r0, sp, #0xc
	mov r1, r2
	bl ov45_02237B58
	add r0, sp, #0
	mov r1, r4
	bl ov45_02237B58
	ldr r0, _0223F764 ; =ov45_022577DC
	add r1, sp, #0xc
	ldr r0, [r0]
	add r2, sp, #0
	bl ov45_022436E0
	add r0, sp, #0
	bl ov45_02237BC8
	add r0, sp, #0xc
	bl ov45_02237BC8
	add sp, sp, #0x18
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223F764: .word ov45_022577DC
	arm_func_end ov45_0223F6F4

	arm_func_start ov45_0223F768
ov45_0223F768: ; 0x0223F768
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	ldr r0, _0223F824 ; =ov45_022577DC
	ldr r0, [r0]
	cmp r0, #0
	beq _0223F790
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0xc
	ldmeqia sp!, {pc}
_0223F790:
	mov r2, #0
	add r1, sp, #0
	mov r0, r2
_0223F79C:
	str r0, [r1, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #3
	blo _0223F79C
	cmp r3, #3
	addls pc, pc, r3, lsl #2
	b _0223F808
_0223F7B8: ; jump table
	b _0223F7C8 ; case 0
	b _0223F7D8 ; case 1
	b _0223F7E8 ; case 2
	b _0223F7F8 ; case 3
_0223F7C8:
	ldr r1, _0223F828 ; =ov45_022552DC
	add r0, sp, #0
	bl ov45_0223DAD4
	b _0223F814
_0223F7D8:
	ldr r1, _0223F82C ; =ov45_022552E4
	add r0, sp, #0
	bl ov45_0223DAD4
	b _0223F814
_0223F7E8:
	ldr r1, _0223F830 ; =ov45_022552EC
	add r0, sp, #0
	bl ov45_0223DAD4
	b _0223F814
_0223F7F8:
	ldr r1, _0223F834 ; =ov45_022552F0
	add r0, sp, #0
	bl ov45_0223DAD4
	b _0223F814
_0223F808:
	ldr r1, _0223F838 ; =ov45_022552FC
	add r0, sp, #0
	bl ov45_0223DAD4
_0223F814:
	add r0, sp, #0
	bl ov45_02237BC8
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.balign 4, 0
_0223F824: .word ov45_022577DC
_0223F828: .word ov45_022552DC
_0223F82C: .word ov45_022552E4
_0223F830: .word ov45_022552EC
_0223F834: .word ov45_022552F0
_0223F838: .word ov45_022552FC
	arm_func_end ov45_0223F768

	arm_func_start ov45_0223F83C
ov45_0223F83C: ; 0x0223F83C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x24
	ldr r0, _0223F8F0 ; =ov45_022577DC
	mov r6, r1
	ldr r0, [r0]
	mov r4, r2
	cmp r0, #0
	beq _0223F86C
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0x24
	ldmeqia sp!, {r3, r4, r5, r6, pc}
_0223F86C:
	add r0, sp, #0x18
	mov r1, r6
	bl ov45_02237B58
	ldr r0, _0223F8F0 ; =ov45_022577DC
	add r1, sp, #0x18
	ldr r0, [r0]
	bl ov45_02242C3C
	mov r5, r0
	add r0, sp, #0x18
	bl ov45_02237BC8
	add r0, sp, #0xc
	mov r1, r6
	bl ov45_02237B58
	ldr r1, _0223F8F0 ; =ov45_022577DC
	add r0, sp, #0
	ldr r1, [r1]
	add r2, sp, #0xc
	bl ov45_022428D8
	ldr r0, [sp]
	ldr r2, [r5, #0x14]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #1
	ldrne r0, [sp, #8]
	ldr r3, [r5, #0x10]
	mov r1, r4
	blx r3
	add r0, sp, #0
	bl ov45_02237BC8
	add r0, sp, #0xc
	bl ov45_02237BC8
	add sp, sp, #0x24
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223F8F0: .word ov45_022577DC
	arm_func_end ov45_0223F83C

	arm_func_start ov45_0223F8F4
ov45_0223F8F4: ; 0x0223F8F4
	ldr r0, _0223F90C ; =ov45_022577DC
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #4]
	cmpne r0, #5
	bx lr
	.balign 4, 0
_0223F90C: .word ov45_022577DC
	arm_func_end ov45_0223F8F4

	arm_func_start ov45_0223F910
ov45_0223F910: ; 0x0223F910
	ldr r0, _0223F928 ; =ov45_022577DC
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #4]
	cmpne r0, #5
	bx lr
	.balign 4, 0
_0223F928: .word ov45_022577DC
	arm_func_end ov45_0223F910

	arm_func_start ov45_0223F92C
ov45_0223F92C: ; 0x0223F92C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldr r0, _0223F9C0 ; =ov45_022577DC
	mov r4, r1
	ldr r3, [r0]
	cmp r3, #0
	beq _0223F958
	ldr r0, [r3, #4]
	cmp r0, #5
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
_0223F958:
	mov r2, #0
	add r1, sp, #0
	add r0, r3, #0x9c
	str r2, [sp]
	bl ov45_02232D8C
	cmp r4, #0
	bne _0223F9A0
	ldr r0, _0223F9C0 ; =ov45_022577DC
	mov r2, #3
	ldr r3, [r0]
	mov r1, #5
	str r2, [r3, #0x58]
	str r1, [r3, #4]
	ldr r0, [r0]
	mov r1, #1
	str r1, [r0, #0x60]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0223F9A0:
	ldr r0, _0223F9C0 ; =ov45_022577DC
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #5
	movne r0, #2
	strne r0, [r1, #4]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0223F9C0: .word ov45_022577DC
	arm_func_end ov45_0223F92C

	arm_func_start ov45_0223F9C4
ov45_0223F9C4: ; 0x0223F9C4
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	ldr r0, _0223FA28 ; =ov45_022577DC
	mov r4, r2
	ldr r1, [r0]
	cmp r1, #0
	beq _0223F9F0
	ldr r0, [r1, #4]
	cmp r0, #5
	addeq sp, sp, #0xc
	ldmeqia sp!, {r3, r4, pc}
_0223F9F0:
	add r0, sp, #0
	bl ov45_0223FA2C
	ldr r0, [sp]
	mov r2, #0x7f
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #1
	ldrne r1, [sp, #8]
	mov r0, r4
	bl strncpy
	add r0, sp, #0
	bl ov45_02237BC8
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0223FA28: .word ov45_022577DC
	arm_func_end ov45_0223F9C4

	arm_func_start ov45_0223FA2C
ov45_0223FA2C: ; 0x0223FA2C
	ldr ip, _0223FA38 ; =ov45_02237A24
	add r1, r1, #0x18
	bx ip
	.balign 4, 0
_0223FA38: .word ov45_02237A24
	arm_func_end ov45_0223FA2C

	arm_func_start ov45_0223FA3C
ov45_0223FA3C: ; 0x0223FA3C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x60
	ldr r2, _0223FC54 ; =ov45_022577DC
	mov r4, r0
	ldr r0, [r2]
	cmp r0, #0
	beq _0223FA68
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0x60
	ldmeqia sp!, {r4, pc}
_0223FA68:
	cmp r1, #1
	bne _0223FADC
	ldr r1, _0223FC54 ; =ov45_022577DC
	add r0, sp, #0x54
	ldr r1, [r1]
	ldr r1, [r1, #8]
	bl ov45_022429E0
	ldr r0, _0223FC54 ; =ov45_022577DC
	add r1, sp, #0x54
	ldr r0, [r0]
	add r0, r0, #0xc
	bl ov45_02237D48
	add r0, sp, #0x54
	bl ov45_02237BC8
	ldr r1, _0223FC54 ; =ov45_022577DC
	add r0, sp, #0x48
	ldr r1, [r1]
	bl ov45_0223FC5C
	ldr r0, [sp, #0x48]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #0x49
	ldrne r1, [sp, #0x50]
	mov r0, r4
	bl ov45_0225035C
	add r0, sp, #0x48
	bl ov45_02237BC8
	add sp, sp, #0x60
	ldmia sp!, {r4, pc}
_0223FADC:
	cmp r1, #2
	bne _0223FB50
	ldr r1, _0223FC54 ; =ov45_022577DC
	add r0, sp, #0x3c
	ldr r1, [r1]
	ldr r1, [r1, #8]
	bl ov45_022429E0
	ldr r0, _0223FC54 ; =ov45_022577DC
	add r1, sp, #0x3c
	ldr r0, [r0]
	add r0, r0, #0xc
	bl ov45_02237D48
	add r0, sp, #0x3c
	bl ov45_02237BC8
	ldr r1, _0223FC54 ; =ov45_022577DC
	add r0, sp, #0x30
	ldr r1, [r1]
	bl ov45_0223FC5C
	ldr r0, [sp, #0x30]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #0x31
	ldrne r1, [sp, #0x38]
	mov r0, r4
	bl ov45_0225035C
	add r0, sp, #0x30
	bl ov45_02237BC8
	add sp, sp, #0x60
	ldmia sp!, {r4, pc}
_0223FB50:
	sub r0, r1, #3
	cmp r0, #1
	bhi _0223FBD0
	ldr r1, _0223FC54 ; =ov45_022577DC
	add r0, sp, #0x24
	ldr r1, [r1]
	ldr r1, [r1, #8]
	bl ov45_022429E0
	ldr r0, _0223FC54 ; =ov45_022577DC
	add r1, sp, #0x24
	ldr r0, [r0]
	add r0, r0, #0xc
	bl ov45_02237D48
	add r0, sp, #0x24
	bl ov45_02237BC8
	ldr r1, _0223FC54 ; =ov45_022577DC
	add r0, sp, #0x18
	ldr r1, [r1]
	bl ov45_0223FC5C
	ldr r0, [sp, #0x18]
	ldr r3, _0223FC58 ; =ov45_02255304
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r2, sp, #0x19
	ldrne r2, [sp, #0x20]
	mov r0, r4
	mov r1, #2
	bl ov45_02250424
	add r0, sp, #0x18
	bl ov45_02237BC8
	add sp, sp, #0x60
	ldmia sp!, {r4, pc}
_0223FBD0:
	cmp r1, #5
	addeq sp, sp, #0x60
	ldmeqia sp!, {r4, pc}
	cmp r1, #6
	addne sp, sp, #0x60
	ldmneia sp!, {r4, pc}
	ldr r1, _0223FC54 ; =ov45_022577DC
	add r0, sp, #0xc
	ldr r1, [r1]
	ldr r1, [r1, #8]
	bl ov45_022429E0
	ldr r0, _0223FC54 ; =ov45_022577DC
	add r1, sp, #0xc
	ldr r0, [r0]
	add r0, r0, #0xc
	bl ov45_02237D48
	add r0, sp, #0xc
	bl ov45_02237BC8
	ldr r1, _0223FC54 ; =ov45_022577DC
	add r0, sp, #0
	ldr r1, [r1]
	bl ov45_0223FC5C
	ldr r0, [sp]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #1
	ldrne r1, [sp, #8]
	mov r0, r4
	bl ov45_0225035C
	add r0, sp, #0
	bl ov45_02237BC8
	add sp, sp, #0x60
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0223FC54: .word ov45_022577DC
_0223FC58: .word ov45_02255304
	arm_func_end ov45_0223FA3C

	arm_func_start ov45_0223FC5C
ov45_0223FC5C: ; 0x0223FC5C
	ldr ip, _0223FC68 ; =ov45_02237A24
	add r1, r1, #0xc
	bx ip
	.balign 4, 0
_0223FC68: .word ov45_02237A24
	arm_func_end ov45_0223FC5C

	arm_func_start ov45_0223FC6C
ov45_0223FC6C: ; 0x0223FC6C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x28
	ldr r0, _0223FD64 ; =ov45_022577DC
	mov r6, r1
	ldr r1, [r0]
	mov r7, r2
	cmp r1, #0
	beq _0223FC9C
	ldr r0, [r1, #4]
	cmp r0, #5
	addeq sp, sp, #0x28
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
_0223FC9C:
	add r0, sp, #0x1c
	mov r2, r7
	bl ov45_02242910
	ldr r0, _0223FD64 ; =ov45_022577DC
	ldr r5, [sp, #0x50]
	ldr r4, [r0]
	ldr ip, _0223FD68 ; =ov45_02255238
	add r3, sp, #0x10
	mov r8, #0
	add r0, sp, #0xc
	add r2, sp, #8
	add r1, r4, #0x90
	str ip, [sp, #0x10]
	str r5, [sp, #0x14]
	str r8, [sp, #0x18]
	str r3, [sp, #8]
	bl ov45_0223FD8C
	ldr r1, [sp, #0xc]
	add r0, r4, #0x94
	cmp r1, r0
	moveq sb, r8
	ldrne sb, [r1, #0xc]
	cmp r6, #1
	moveq r6, #1
	add r0, sp, #0x1c
	ldr r4, [sb, #0xc]
	movne r6, #0
	bl ov45_0223FD74
	mov r8, r0
	mov r0, sb
	ldr r1, [r0]
	ldr r1, [r1, #0xc]
	blx r1
	mov r1, r7
	ldr r7, [sp, #0x4c]
	ldr r3, [sp, #0x48]
	str r7, [sp]
	str r0, [sp, #4]
	mov r2, r8
	mov r0, r6
	blx r4
	ldr r0, _0223FD64 ; =ov45_022577DC
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x90
	bl ov45_02242510
	add r0, sp, #0x1c
	bl ov45_022376BC
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0223FD64: .word ov45_022577DC
_0223FD68: .word ov45_02255238
	arm_func_end ov45_0223FC6C

	arm_func_start ov45_0223FD6C
ov45_0223FD6C: ; 0x0223FD6C
	ldr r0, [r0, #8]
	bx lr
	arm_func_end ov45_0223FD6C

	arm_func_start ov45_0223FD74
ov45_0223FD74: ; 0x0223FD74
	ldr r1, [r0, #4]
	cmp r1, #0
	moveq r0, #0
	ldrne r0, [r0]
	bx lr
	arm_func_end ov45_0223FD74

	arm_func_start ov45_0223FD88
ov45_0223FD88: ; 0x0223FD88
	bx lr
	arm_func_end ov45_0223FD88

	arm_func_start ov45_0223FD8C
ov45_0223FD8C: ; 0x0223FD8C
	stmdb sp!, {r4, r5, r6, lr}
	mov r4, r1
	mov r6, r2
	mov r5, r0
	ldr r2, [r4, #4]
	mov r0, r4
	mov r1, r6
	add r3, r4, #4
	bl ov45_0223FDE8
	add r1, r4, #4
	cmp r0, r1
	beq _0223FDD4
	ldr r2, [r6]
	ldr r1, [r0, #0xc]
	ldr r2, [r2, #4]
	ldr r1, [r1, #4]
	cmp r2, r1
	bhs _0223FDE0
_0223FDD4:
	add r0, r4, #4
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, pc}
_0223FDE0:
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_0223FD8C

	arm_func_start ov45_0223FDE8
ov45_0223FDE8: ; 0x0223FDE8
	cmp r2, #0
	beq _0223FE18
	ldr r0, [r1]
	ldr r1, [r0, #4]
_0223FDF8:
	ldr r0, [r2, #0xc]
	ldr r0, [r0, #4]
	cmp r0, r1
	movhs r3, r2
	ldrhs r2, [r2]
	ldrlo r2, [r2, #4]
	cmp r2, #0
	bne _0223FDF8
_0223FE18:
	mov r0, r3
	bx lr
	arm_func_end ov45_0223FDE8

	arm_func_start ov45_0223FE20
ov45_0223FE20: ; 0x0223FE20
	cmp r1, #0
	bx lr
	arm_func_end ov45_0223FE20

	arm_func_start ov45_0223FE28
ov45_0223FE28: ; 0x0223FE28
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x58
	ldr r0, _0223FFE0 ; =ov45_022577DC
	mov r4, r1
	ldr r0, [r0]
	mov r6, r2
	mov r5, r3
	cmp r0, #0
	beq _0223FE5C
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0x58
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0223FE5C:
	mov r0, #0
	str r0, [sp, #0x4c]
	str r0, [sp, #0x50]
	str r0, [sp, #0x54]
	cmp r5, #0
	beq _0223FEE4
	add r0, sp, #0x40
	mov r1, r6
	bl ov45_02237B58
	add r1, sp, #0x40
	ldr r0, _0223FFE0 ; =ov45_022577DC
	str r1, [sp]
	ldr r1, [r0]
	ldr r3, [sp, #0x78]
	add r0, sp, #0x34
	mov r2, r5
	bl ov45_02242EF4
	add r0, sp, #0x4c
	add r1, sp, #0x34
	cmp r0, r1
	beq _0223FED4
	mov r3, #0
	ldr r1, [sp, #0x34]
	ldr r5, [sp, #0x38]
	strb r3, [sp, #4]
	sub r2, sp, #4
	strb r3, [r2]
	ldr r3, [r2]
	add r2, r1, r5, lsl #2
	bl ov45_0223FFE8
_0223FED4:
	add r0, sp, #0x34
	bl ov45_022376BC
	add r0, sp, #0x40
	bl ov45_02237BC8
_0223FEE4:
	ldr r0, _0223FFE0 ; =ov45_022577DC
	ldr r8, [sp, #0x80]
	ldr r5, [r0]
	ldr sb, _0223FFE4 ; =ov45_02255238
	add r3, sp, #0x10
	mov r7, #0
	add r0, sp, #0xc
	add r2, sp, #8
	add r1, r5, #0x90
	str sb, [sp, #0x10]
	str r8, [sp, #0x14]
	str r7, [sp, #0x18]
	str r3, [sp, #8]
	bl ov45_0223FD8C
	ldr r1, [sp, #0xc]
	add r0, r5, #0x94
	cmp r1, r0
	moveq r5, r7
	ldrne r5, [r1, #0xc]
	add r0, sp, #0x28
	mov r1, r6
	bl ov45_02237B58
	ldr r1, _0223FFE0 ; =ov45_022577DC
	add r0, sp, #0x1c
	ldr r1, [r1]
	add r2, sp, #0x28
	bl ov45_022428D8
	ldr r0, [sp, #0x1c]
	ldr r6, [sp, #0x50]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq sb, sp, #0x1d
	ldrne sb, [sp, #0x24]
	cmp r4, #1
	moveq sl, #1
	add r0, sp, #0x4c
	ldr r7, [r5, #0xc]
	movne sl, #0
	bl ov45_0223259C
	mov r4, r0
	mov r0, r5
	ldr r1, [r0]
	ldr r1, [r1, #0xc]
	blx r1
	str r0, [sp]
	mov r1, sb
	mov r2, r6
	mov r3, r4
	mov r0, sl
	blx r7
	add r0, sp, #0x1c
	bl ov45_02237BC8
	add r0, sp, #0x28
	bl ov45_02237BC8
	ldr r0, _0223FFE0 ; =ov45_022577DC
	mov r1, r8
	ldr r0, [r0]
	add r0, r0, #0x90
	bl ov45_02242510
	add r0, sp, #0x4c
	bl ov45_022376BC
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_0223FFE0: .word ov45_022577DC
_0223FFE4: .word ov45_02255238
	arm_func_end ov45_0223FE28

	arm_func_start ov45_0223FFE8
ov45_0223FFE8: ; 0x0223FFE8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r5, r2
	mov r7, r0
	sub r2, r5, r6
	mov r1, r2, asr #1
	add r1, r2, r1, lsr #30
	ldr r3, [r7, #8]
	mov r4, r1, asr #2
	cmp r3, r1, asr #2
	bhs _02240034
	mov r2, #0
	sub r1, r4, r3
	strb r2, [sp]
	bl ov45_0223EA34
	mov r2, r0
	mov r0, r7
	mov r1, r4
	bl ov45_022421E4
_02240034:
	sub r1, r5, r6
	mov r0, r1, asr #1
	add r0, r1, r0, lsr #30
	mov r2, r0, asr #2
	ldr r0, [r7]
	mov r1, r6
	mov r2, r2, lsl #2
	bl memmove
	str r4, [r7, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_0223FFE8

	arm_func_start ov45_0224005C
ov45_0224005C: ; 0x0224005C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x6c
	ldr r0, _0224022C ; =ov45_022577DC
	mov r5, r1
	ldr r0, [r0]
	mov r4, r2
	mov r6, r3
	cmp r0, #0
	beq _02240090
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0x6c
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_02240090:
	cmp r5, #1
	bne _022400D4
	add r0, sp, #0x60
	mov r1, r4
	bl ov45_02237B58
	add r1, sp, #0x60
	ldr r0, _0224022C ; =ov45_022577DC
	str r1, [sp]
	ldr r1, [r0]
	ldr r3, [sp, #0x90]
	add r0, sp, #0x54
	mov r2, r6
	bl ov45_02242EF4
	add r0, sp, #0x54
	bl ov45_022376BC
	add r0, sp, #0x60
	bl ov45_02237BC8
_022400D4:
	add r0, sp, #0x48
	mov r1, r4
	bl ov45_02237B58
	ldr r0, _0224022C ; =ov45_022577DC
	add r1, sp, #0x48
	ldr r0, [r0]
	bl ov45_022437CC
	add r0, sp, #0x48
	bl ov45_02237BC8
	ldr r0, _0224022C ; =ov45_022577DC
	ldr r8, [sp, #0x98]
	ldr r6, [r0]
	ldr r0, _02240230 ; =ov45_02255238
	mov r1, #0
	str r0, [sp, #0xc]
	add r0, sp, #0xc
	str r1, [sp, #0x14]
	str r0, [sp, #4]
	add r0, sp, #8
	add r1, r6, #0x90
	add r2, sp, #4
	str r8, [sp, #0x10]
	bl ov45_0223FD8C
	ldr r1, [sp, #8]
	add r0, r6, #0x94
	cmp r1, r0
	moveq r6, #0
	ldrne r6, [r1, #0xc]
	add r0, sp, #0x3c
	mov r1, r4
	bl ov45_02237B58
	ldr r1, _0224022C ; =ov45_022577DC
	add r0, sp, #0x30
	ldr r1, [r1]
	add r2, sp, #0x3c
	bl ov45_022428D8
	ldr r0, [sp, #0x30]
	ldr r7, [r6, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	mov r0, r6
	ldr r1, [r0]
	addeq sb, sp, #0x31
	ldrne sb, [sp, #0x38]
	cmp r5, #1
	moveq sl, #1
	ldr r1, [r1, #0xc]
	movne sl, #0
	blx r1
	mov r3, r0
	mov r0, sl
	mov r2, sb
	mov r1, #0
	blx r7
	add r0, sp, #0x30
	bl ov45_02237BC8
	add r0, sp, #0x3c
	bl ov45_02237BC8
	ldr r0, _0224022C ; =ov45_022577DC
	mov r1, r8
	ldr r0, [r0]
	add r0, r0, #0x90
	bl ov45_02242510
	cmp r5, #0
	addne sp, sp, #0x6c
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	add r0, sp, #0x24
	mov r1, r4
	bl ov45_02237B58
	ldr r1, _0224022C ; =ov45_022577DC
	add r0, sp, #0x18
	ldr r1, [r1]
	add r2, sp, #0x24
	bl ov45_022428D8
	ldr r0, [sp, #0x18]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #0x19
	ldrne r0, [sp, #0x20]
	bl ov45_022412CC
	add r0, sp, #0x18
	bl ov45_02237BC8
	add r0, sp, #0x24
	bl ov45_02237BC8
	add sp, sp, #0x6c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_0224022C: .word ov45_022577DC
_02240230: .word ov45_02255238
	arm_func_end ov45_0224005C

	arm_func_start ov45_02240234
ov45_02240234: ; 0x02240234
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x6c
	ldr r4, _02240488 ; =ov45_022577DC
	mov r8, r0
	ldr r0, [r4]
	mov r5, r1
	mov r7, r2
	mov r6, r3
	cmp r0, #0
	beq _0224026C
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0x6c
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
_0224026C:
	cmp r5, #1
	bne _02240300
	add r0, sp, #0x60
	mov r1, r6
	bl ov45_02237B58
	ldr r0, _02240488 ; =ov45_022577DC
	add r1, sp, #0x60
	ldr r0, [r0]
	bl ov45_02243808
	mov r4, r0
	add r0, sp, #0x60
	bl ov45_02237BC8
	cmp r4, #0
	beq _02240300
	ldr r0, _02240488 ; =ov45_022577DC
	mov r1, r6
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov45_02250F5C
	mvn r1, #0
	cmp r4, r1
	moveq r5, #0
	moveq r7, #7
	beq _02240300
	cmp r0, r4
	bgt _022402DC
	cmp r0, r1
	bne _022402E8
_022402DC:
	mov r5, #0
	mov r7, #2
	b _02240300
_022402E8:
	ldr r0, _02240488 ; =ov45_022577DC
	mov r1, r6
	ldr r0, [r0]
	mov r2, r4
	ldr r0, [r0]
	bl ov45_02250E6C
_02240300:
	cmp r5, #1
	bne _0224036C
	ldr r1, _02240488 ; =ov45_022577DC
	add r0, sp, #0x54
	ldr r1, [r1]
	bl ov45_0223FC5C
	add r0, sp, #0x48
	mov r1, r6
	bl ov45_02237B58
	ldr r0, _02240488 ; =ov45_022577DC
	add r1, sp, #0x54
	ldr r0, [r0]
	add r2, sp, #0x48
	bl ov45_02242D30
	add r0, sp, #0x48
	bl ov45_02237BC8
	add r0, sp, #0x54
	bl ov45_02237BC8
	mov r2, #0
	str r2, [sp]
	ldr r2, _0224048C ; =ov45_0224005C
	ldr r3, [sp, #0x88]
	mov r0, r8
	mov r1, r6
	bl ov45_02251208
	add sp, sp, #0x6c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_0224036C:
	add r0, sp, #0x3c
	mov r1, r6
	bl ov45_02237B58
	ldr r1, _02240488 ; =ov45_022577DC
	add r0, sp, #0x30
	ldr r1, [r1]
	add r2, sp, #0x3c
	bl ov45_022428D8
	ldr r0, [sp, #0x30]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #0x31
	ldrne r0, [sp, #0x38]
	bl ov45_022412CC
	add r0, sp, #0x30
	bl ov45_02237BC8
	add r0, sp, #0x3c
	bl ov45_02237BC8
	ldr r0, _02240488 ; =ov45_022577DC
	ldr r5, [sp, #0x88]
	ldr r4, [r0]
	ldr r0, _02240490 ; =ov45_02255238
	mov r1, #0
	str r0, [sp, #0xc]
	add r0, sp, #0xc
	str r1, [sp, #0x14]
	str r0, [sp, #4]
	add r0, sp, #8
	add r1, r4, #0x90
	add r2, sp, #4
	str r5, [sp, #0x10]
	bl ov45_0223FD8C
	ldr r1, [sp, #8]
	add r0, r4, #0x94
	cmp r1, r0
	moveq r4, #0
	ldrne r4, [r1, #0xc]
	add r0, sp, #0x24
	mov r1, r6
	bl ov45_02237B58
	ldr r1, _02240488 ; =ov45_022577DC
	add r0, sp, #0x18
	ldr r1, [r1]
	add r2, sp, #0x24
	bl ov45_022428D8
	ldr r0, [sp, #0x18]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	mov r0, r4
	ldr r1, [r0]
	addeq r6, sp, #0x19
	ldrne r6, [sp, #0x20]
	ldr r1, [r1, #0xc]
	ldr r4, [r4, #0xc]
	blx r1
	mov r3, r0
	mov r1, r7
	mov r2, r6
	mov r0, #0
	blx r4
	add r0, sp, #0x18
	bl ov45_02237BC8
	add r0, sp, #0x24
	bl ov45_02237BC8
	ldr r0, _02240488 ; =ov45_022577DC
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x90
	bl ov45_02242510
	add sp, sp, #0x6c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02240488: .word ov45_022577DC
_0224048C: .word ov45_0224005C
_02240490: .word ov45_02255238
	arm_func_end ov45_02240234

	arm_func_start ov45_02240494
ov45_02240494: ; 0x02240494
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	ldr r0, _02240618 ; =ov45_022577DC
	mov r7, r1
	ldr r0, [r0]
	mov sb, r2
	cmp r0, #0
	beq _022404C4
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0x40
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022404C4:
	cmp sb, #0
	addeq sp, sp, #0x40
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r3, #0
	mvneq fp, #0
	beq _02240504
	add r0, sp, #0x34
	mov r1, r3
	bl ov45_02237B58
	ldr r0, _02240618 ; =ov45_022577DC
	add r1, sp, #0x34
	ldr r0, [r0]
	bl ov45_022435F8
	mov fp, r0
	add r0, sp, #0x34
	bl ov45_02237BC8
_02240504:
	ldr r0, _02240618 ; =ov45_022577DC
	ldr r8, [sp, #0x74]
	ldr r4, [r0]
	ldr r6, _0224061C ; =ov45_02255238
	add r3, sp, #0x10
	mov r5, #0
	add r0, sp, #0xc
	add r2, sp, #8
	add r1, r4, #0x90
	str r6, [sp, #0x10]
	str r8, [sp, #0x14]
	str r5, [sp, #0x18]
	str r3, [sp, #8]
	bl ov45_0223FD8C
	add r0, r4, #0x94
	ldr r1, [sp, #0xc]
	mov r4, #0
	cmp r1, r0
	moveq r6, r5
	ldrne r6, [r1, #0xc]
	mov r5, r4
	cmp r7, #1
	bne _0224057C
	ldr r0, [sp, #0x68]
	cmp r0, #0
	ble _0224057C
	ldr r1, [sp, #0x6c]
	ldr r0, [sp, #0x70]
	ldr r4, [r1]
	ldr r5, [r0]
_0224057C:
	add r0, sp, #0x28
	mov r1, sb
	bl ov45_02237B58
	ldr r1, _02240618 ; =ov45_022577DC
	add r0, sp, #0x1c
	ldr r1, [r1]
	add r2, sp, #0x28
	bl ov45_022428D8
	ldr r0, [sp, #0x1c]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	mov r0, r6
	ldr r1, [r0]
	addeq sb, sp, #0x1d
	ldrne sb, [sp, #0x24]
	cmp r7, #1
	moveq sl, #1
	ldr r7, [r6, #0xc]
	ldr r1, [r1, #0xc]
	movne sl, #0
	blx r1
	str r5, [sp]
	str r0, [sp, #4]
	mov r0, sl
	mov r1, sb
	mov r2, fp
	mov r3, r4
	blx r7
	add r0, sp, #0x1c
	bl ov45_02237BC8
	add r0, sp, #0x28
	bl ov45_02237BC8
	ldr r0, _02240618 ; =ov45_022577DC
	mov r1, r8
	ldr r0, [r0]
	add r0, r0, #0x90
	bl ov45_02242510
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02240618: .word ov45_022577DC
_0224061C: .word ov45_02255238
	arm_func_end ov45_02240494

	arm_func_start ov45_02240620
ov45_02240620: ; 0x02240620
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x34
	ldr r0, _02240714 ; =ov45_022577DC
	mov r7, r1
	ldr r0, [r0]
	mov r6, r3
	cmp r0, #0
	beq _02240650
	ldr r0, [r0, #4]
	cmp r0, #5
	addeq sp, sp, #0x34
	ldmeqia sp!, {r4, r5, r6, r7, pc}
_02240650:
	cmp r2, #0
	mvneq r4, #0
	beq _02240684
	add r0, sp, #0x28
	mov r1, r2
	bl ov45_02237B58
	ldr r0, _02240714 ; =ov45_022577DC
	add r1, sp, #0x28
	ldr r0, [r0]
	bl ov45_022435F8
	mov r4, r0
	add r0, sp, #0x28
	bl ov45_02237BC8
_02240684:
	add r0, sp, #0x1c
	mov r1, r7
	bl ov45_02237B58
	ldr r0, _02240714 ; =ov45_022577DC
	add r1, sp, #0x1c
	ldr r0, [r0]
	bl ov45_02242C3C
	mov r5, r0
	add r0, sp, #0x1c
	bl ov45_02237BC8
	add r0, sp, #0x10
	mov r1, r7
	bl ov45_02237B58
	ldr r1, _02240714 ; =ov45_022577DC
	add r0, sp, #4
	ldr r1, [r1]
	add r2, sp, #0x10
	bl ov45_022428D8
	ldr r0, [sp, #4]
	ldr r1, [r5, #0x14]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #5
	ldrne r0, [sp, #0xc]
	ldr r3, [sp, #0x48]
	str r1, [sp]
	ldr r5, [r5, #0xc]
	mov r1, r4
	mov r2, r6
	blx r5
	add r0, sp, #4
	bl ov45_02237BC8
	add r0, sp, #0x10
	bl ov45_02237BC8
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_02240714: .word ov45_022577DC
	arm_func_end ov45_02240620

	arm_func_start ov45_02240718
ov45_02240718: ; 0x02240718
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x2c
	ldr r4, _02240848 ; =ov45_022577DC
	mov r8, r1
	ldr r1, [r4]
	mov r7, r2
	mov r6, r3
	cmp r1, #0
	beq _0224074C
	ldr r1, [r1, #4]
	cmp r1, #5
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0224074C:
	cmp r8, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r3, [sp, #0x48]
	mov r1, r7
	mov r2, r6
	bl ov45_0223F8F4
	ldr r0, _02240848 ; =ov45_022577DC
	ldr r5, [sp, #0x48]
	ldr r4, [r0]
	ldr lr, _0224084C ; =ov45_02255238
	add r3, sp, #8
	mov ip, #0
	add r0, sp, #4
	add r2, sp, #0
	add r1, r4, #0x90
	str lr, [sp, #8]
	str r5, [sp, #0xc]
	str ip, [sp, #0x10]
	str r3, [sp]
	bl ov45_0223FD8C
	ldr r1, [sp, #4]
	add r0, r4, #0x94
	cmp r1, r0
	moveq r4, #0
	ldrne r4, [r1, #0xc]
	add r0, sp, #0x20
	mov r1, r7
	bl ov45_02237B58
	ldr r1, _02240848 ; =ov45_022577DC
	add r0, sp, #0x14
	ldr r1, [r1]
	add r2, sp, #0x20
	bl ov45_022428D8
	ldr r0, [sp, #0x14]
	ldr r7, [r4, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	mov r0, r4
	ldr r1, [r0]
	addeq sb, sp, #0x15
	ldrne sb, [sp, #0x1c]
	cmp r8, #1
	moveq r8, #1
	ldr r1, [r1, #0xc]
	movne r8, #0
	blx r1
	mov r3, r0
	mov r0, r8
	mov r1, sb
	mov r2, r6
	blx r7
	add r0, sp, #0x14
	bl ov45_02237BC8
	add r0, sp, #0x20
	bl ov45_02237BC8
	ldr r0, _02240848 ; =ov45_022577DC
	mov r1, r5
	ldr r0, [r0]
	add r0, r0, #0x90
	bl ov45_02242510
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_02240848: .word ov45_022577DC
_0224084C: .word ov45_02255238
	arm_func_end ov45_02240718

	arm_func_start ov45_02240850
ov45_02240850: ; 0x02240850
	ldr r0, _02240870 ; =ov45_022577DC
	mov r1, #3
	ldr r2, [r0]
	mov r0, #5
	str r1, [r2, #0x58]
	str r0, [r2, #4]
	mov r0, #0
	bx lr
	.balign 4, 0
_02240870: .word ov45_022577DC
	arm_func_end ov45_02240850

	arm_func_start ov45_02240874
ov45_02240874: ; 0x02240874
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	ldr r0, _02240A54 ; =ov45_022577DC
	ldr r1, [r0]
	cmp r1, #0
	addeq sp, sp, #0x28
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	beq _022408AC
	ldr r0, [r1, #4]
	cmp r0, #5
	addeq sp, sp, #0x28
	moveq r0, #5
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022408AC:
	ldr r0, [r1]
	cmp r0, #0
	beq _022408BC
	bl ov45_02250590
_022408BC:
	ldr r2, _02240A54 ; =ov45_022577DC
	add r0, sp, #0xc
	add r1, sp, #0x1c
	ldr r5, [r2]
	bl ov00_021ECB94
	add r0, sp, #0xc
	add r1, sp, #0x1c
	bl RTC_ConvertDateTimeToSecond
	ldr r2, [r5, #0xa8]
	add r7, r5, #0xa0
	mov r6, r0
	mov sb, r1
	str r2, [sp, #8]
	cmp r2, r7
	beq _0224098C
	mov fp, #1
	mov sl, #0
	add r4, sp, #8
_02240904:
	ldr r1, [r2, #0x10]
	ldr r0, [r2, #0x14]
	subs r1, r6, r1
	ldr r8, [r2, #0x18]
	sbc r0, sb, r0
	ldr r3, [r2, #0x1c]
	subs r1, r8, r1
	sbcs r1, r3, r0
	bge _02240948
	str r6, [r2, #0x10]
	str sb, [r2, #0x14]
	ldr r0, [r2, #0x20]
	ldr r1, [r2, #0x24]
	blx r1
	cmp r0, #0
	moveq r0, sl
	beq _0224094C
_02240948:
	mov r0, fp
_0224094C:
	cmp r0, #0
	bne _02240978
	ldr r8, [sp, #8]
	mov r0, r4
	bl ov45_02236E58
	add r0, sp, #4
	mov r2, r8
	add r1, r5, #0x9c
	str r8, [sp]
	bl ov45_02236C40
	b _02240980
_02240978:
	mov r0, r4
	bl ov45_02236E58
_02240980:
	ldr r2, [sp, #8]
	cmp r2, r7
	bne _02240904
_0224098C:
	ldr r0, _02240A54 ; =ov45_022577DC
	ldr r3, [r0]
	cmp r3, #0
	beq _022409B0
	ldr r0, [r3, #4]
	cmp r0, #5
	addeq sp, sp, #0x28
	moveq r0, #5
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022409B0:
	ldr r1, [r3, #0x54]
	ldr r0, _02240A54 ; =ov45_022577DC
	cmp r1, #3
	ldr r2, [r0]
	blo _022409F0
	mov r1, #0
	str r1, [r3, #0x54]
	ldr r2, [r0]
	mov r1, #3
	str r1, [r2, #0x58]
	mov r1, #5
	str r1, [r2, #4]
	ldr r0, [r0]
	add sp, sp, #0x28
	ldr r0, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022409F0:
	ldr r0, [r2, #4]
	cmp r0, #4
	addls pc, pc, r0, lsl #2
	b _02240A40
_02240A00: ; jump table
	b _02240A40 ; case 0
	b _02240A40 ; case 1
	b _02240A14 ; case 2
	b _02240A40 ; case 3
	b _02240A40 ; case 4
_02240A14:
	ldr r1, [r2, #0x5c]
	add r0, r1, #1
	str r0, [r2, #0x5c]
	cmp r1, #0x3c
	bne _02240A40
	mov r0, #0
	str r0, [r2, #0x5c]
	ldr r0, [r2, #4]
	cmp r0, #5
	movne r0, #3
	strne r0, [r2, #4]
_02240A40:
	ldr r0, _02240A54 ; =ov45_022577DC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02240A54: .word ov45_022577DC
	arm_func_end ov45_02240874

	arm_func_start ov45_02240A58
ov45_02240A58: ; 0x02240A58
	ldr r0, _02240A70 ; =ov45_022577DC
	ldr r0, [r0]
	cmp r0, #0
	ldrne r0, [r0, #0x58]
	moveq r0, #0
	bx lr
	.balign 4, 0
_02240A70: .word ov45_022577DC
	arm_func_end ov45_02240A58

	arm_func_start ov45_02240A74
ov45_02240A74: ; 0x02240A74
	add r0, r0, #0x410
	add r0, r0, #0xa000
	bx lr
	arm_func_end ov45_02240A74

	arm_func_start ov45_02240A80
ov45_02240A80: ; 0x02240A80
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x18
	ldr r2, _02240B0C ; =ov45_022577DC
	mov r1, r0
	ldr r0, [r2]
	cmp r0, #0
	addeq sp, sp, #0x18
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, sp, #0xc
	bl ov45_02237B58
	ldr r1, _02240B0C ; =ov45_022577DC
	add r0, sp, #0
	ldr r1, [r1]
	add r2, sp, #0xc
	bl ov45_022428C8
	ldr r0, [sp]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldr r0, _02240B0C ; =ov45_022577DC
	addeq r1, sp, #1
	ldr r0, [r0]
	ldrne r1, [sp, #8]
	ldr r0, [r0]
	bl ov45_02251024
	cmp r0, #1
	moveq r4, #1
	add r0, sp, #0
	movne r4, #0
	bl ov45_02237BC8
	add r0, sp, #0xc
	bl ov45_02237BC8
	mov r0, r4
	add sp, sp, #0x18
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02240B0C: .word ov45_022577DC
	arm_func_end ov45_02240A80

	arm_func_start ov45_02240B10
ov45_02240B10: ; 0x02240B10
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x13c
	mov sl, r0
	ldr r0, _02240F30 ; =_version_NINTENDO_DWC_LOBBY
	mov sb, r1
	mov r8, r2
	mov r7, r3
	bl OSi_ReferSymbol
	ldr r0, _02240F34 ; =ov45_022577DC
	ldr r0, [r0]
	cmp r0, #0
	addne sp, sp, #0x13c
	movne r0, #4
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r1, [sp, #0x160]
	add r0, sp, #0x130
	bl ov45_022429E0
	ldr r1, _02240F38 ; =ov45_02255308
	add r0, sp, #0x124
	bl ov45_02237B58
	ldr r1, _02240F3C ; =ov45_02255310
	add r0, sp, #0x118
	bl ov45_02237B58
	mov r4, #0
	mov r0, #0xac
	mov r5, r4
	bl ov45_02242394
	movs r6, r0
	beq _02240BE0
	add r0, sp, #0xf8
	mov r1, sb
	bl ov45_02237B58
	add r0, sp, #0xec
	mov r1, sl
	mov r4, #1
	bl ov45_02237B58
	ldr r1, [sp, #0x160]
	add r0, sp, #0x130
	str r1, [sp]
	str r0, [sp, #4]
	add r1, sp, #0x124
	str r1, [sp, #8]
	add r0, sp, #0x118
	str r0, [sp, #0xc]
	add r1, sp, #0xec
	add r2, sp, #0xf8
	mov r3, r8
	mov r0, r6
	str r7, [sp, #0x10]
	mov r5, r4
	bl ov45_0224268C
	mov r6, r0
_02240BE0:
	ldr r0, _02240F34 ; =ov45_022577DC
	cmp r5, #0
	str r6, [r0]
	beq _02240BF8
	add r0, sp, #0xec
	bl ov45_02237BC8
_02240BF8:
	cmp r4, #0
	beq _02240C08
	add r0, sp, #0xf8
	bl ov45_02237BC8
_02240C08:
	ldr r0, _02240F34 ; =ov45_022577DC
	ldr r0, [r0]
	cmp r0, #0
	bne _02240C3C
	add r0, sp, #0x118
	bl ov45_02237BC8
	add r0, sp, #0x124
	bl ov45_02237BC8
	add r0, sp, #0x130
	bl ov45_02237BC8
	add sp, sp, #0x13c
	mov r0, #1
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_02240C3C:
	bl ov45_0224246C
	cmp r0, #0
	moveq r4, #1
	beq _02240EC8
	add r0, sp, #0x104
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r4, _02240F40 ; =ov45_0223ED00
	ldr r3, _02240F44 ; =ov45_0223ED1C
	ldr r1, _02240F48 ; =ov45_0223F1C8
	ldr r2, _02240F4C ; =ov45_0223EDD8
	ldr r0, _02240F34 ; =ov45_022577DC
	str r1, [sp, #0x110]
	ldr r1, [r0]
	str r4, [sp, #0x104]
	str r3, [sp, #0x108]
	str r2, [sp, #0x10c]
	ldr r2, [r7, #8]
	add r0, sp, #0xe0
	str r2, [sp, #0x114]
	bl ov45_02240F6C
	ldr r2, _02240F50 ; =ov45_02255318
	add r0, sp, #0xd4
	add r1, sp, #0xe0
	bl ov45_02233ABC
	ldr r2, _02240F54 ; =ov45_0225531C
	add r0, sp, #0xc8
	add r1, sp, #0xd4
	bl ov45_02233ABC
	ldr r1, _02240F34 ; =ov45_022577DC
	add r0, sp, #0xbc
	ldr r1, [r1]
	bl ov45_0223FC5C
	ldr r1, _02240F34 ; =ov45_022577DC
	add r0, sp, #0xb0
	ldr r1, [r1]
	bl ov45_02240F7C
	ldr r1, _02240F34 ; =ov45_022577DC
	add r0, sp, #0xa4
	ldr r1, [r1]
	bl ov45_02240F6C
	ldr r1, _02240F34 ; =ov45_022577DC
	add r0, sp, #0x98
	ldr r1, [r1]
	bl ov45_02240F8C
	ldr r0, [sp, #0x98]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldr r0, [sp, #0xa4]
	addeq r1, sp, #0x99
	mov r0, r0, lsl #0x1f
	ldrne r1, [sp, #0xa0]
	movs r0, r0, lsr #0x1f
	ldr r0, [sp, #0xb0]
	addeq r4, sp, #0xa5
	mov r0, r0, lsl #0x1f
	ldrne r4, [sp, #0xac]
	movs r0, r0, lsr #0x1f
	ldr r0, [sp, #0xbc]
	addeq r3, sp, #0xb1
	mov r0, r0, lsl #0x1f
	ldrne r3, [sp, #0xb8]
	movs r0, r0, lsr #0x1f
	ldr r0, [sp, #0xc8]
	addeq r2, sp, #0xbd
	mov r0, r0, lsl #0x1f
	ldrne r2, [sp, #0xc4]
	movs r0, r0, lsr #0x1f
	addeq r0, sp, #0xc9
	ldrne r0, [sp, #0xd0]
	str r4, [sp]
	str r1, [sp, #4]
	add r4, sp, #0x104
	str r4, [sp, #8]
	ldr r1, _02240F58 ; =ov45_0223FA3C
	ldr r4, _02240F5C ; =ov45_0223F9C4
	str r1, [sp, #0xc]
	ldr r1, _02240F60 ; =ov45_0223F92C
	str r4, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r4, [r7, #8]
	ldr r1, _02240F64 ; =0x00001A0B
	str r4, [sp, #0x18]
	mov r4, #0
	str r4, [sp, #0x1c]
	bl ov45_022502D0
	mov r4, r0
	add r0, sp, #0x98
	bl ov45_02237BC8
	add r0, sp, #0xa4
	bl ov45_02237BC8
	add r0, sp, #0xb0
	bl ov45_02237BC8
	add r0, sp, #0xbc
	bl ov45_02237BC8
	add r0, sp, #0xc8
	bl ov45_02237BC8
	add r0, sp, #0xd4
	bl ov45_02237BC8
	add r0, sp, #0xe0
	bl ov45_02237BC8
	cmp r4, #0
	moveq r4, #2
	beq _02240EC8
	ldr r0, _02240F34 ; =ov45_022577DC
	ldr r2, _02240F34 ; =ov45_022577DC
	ldr r1, [r0]
	str r4, [r1]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	cmp r0, #5
	movne r0, #1
	strne r0, [r1, #4]
	add r0, sp, #0x88
	add r1, sp, #0x7c
	ldr r5, [r2]
	bl ov00_021ECB94
	add r0, sp, #0x88
	add r1, sp, #0x7c
	bl RTC_ConvertDateTimeToSecond
	ldr r3, _02240F68 ; =ov45_02240850
	str r0, [sp, #0x2c]
	str r1, [sp, #0x30]
	mov r4, #0x1e
	mov r1, #0
	add r0, sp, #0x44
	add r2, sp, #0x2c
	str r4, [sp, #0x34]
	str r1, [sp, #0x38]
	str r5, [sp, #0x3c]
	str r3, [sp, #0x40]
	bl ov45_02232AE8
	mov r0, #0
	add r2, sp, #0x48
	strb r0, [sp, #0x21]
	strb r0, [sp, #0x20]
	ldr r0, [sp, #0x44]
	add r7, sp, #0x64
	str r0, [sp, #0x60]
	add r1, r5, #0x9c
	add r6, r2, #8
	ldr r4, [r2, #0x10]
	ldr r0, [r2, #0x14]
	ldmia r2, {r2, r3}
	stmia r7, {r2, r3}
	add r5, r7, #8
	ldmia r6, {r2, r3}
	stmia r5, {r2, r3}
	str r0, [r7, #0x14]
	add r0, sp, #0x24
	add r2, sp, #0x60
	str r4, [r7, #0x10]
	bl ov45_02236BA8
	add r0, sp, #0x118
	bl ov45_02237BC8
	add r0, sp, #0x124
	bl ov45_02237BC8
	add r0, sp, #0x130
	bl ov45_02237BC8
	add sp, sp, #0x13c
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_02240EC8:
	bl ov45_022424DC
	ldr r0, _02240F34 ; =ov45_022577DC
	ldr r5, [r0]
	cmp r5, #0
	beq _02240F0C
	beq _02240F00
	mov r0, r5
	bl ov45_02242858
	cmp r5, #0
	beq _02240F00
	mov r0, #0
	mov r1, r5
	mov r2, r0
	bl ov00_021EC2EC
_02240F00:
	ldr r0, _02240F34 ; =ov45_022577DC
	mov r1, #0
	str r1, [r0]
_02240F0C:
	add r0, sp, #0x118
	bl ov45_02237BC8
	add r0, sp, #0x124
	bl ov45_02237BC8
	add r0, sp, #0x130
	bl ov45_02237BC8
	mov r0, r4
	add sp, sp, #0x13c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_02240F30: .word _version_NINTENDO_DWC_LOBBY
_02240F34: .word ov45_022577DC
_02240F38: .word ov45_02255308
_02240F3C: .word ov45_02255310
_02240F40: .word ov45_0223ED00
_02240F44: .word ov45_0223ED1C
_02240F48: .word ov45_0223F1C8
_02240F4C: .word ov45_0223EDD8
_02240F50: .word ov45_02255318
_02240F54: .word ov45_0225531C
_02240F58: .word ov45_0223FA3C
_02240F5C: .word ov45_0223F9C4
_02240F60: .word ov45_0223F92C
_02240F64: .word 0x00001A0B
_02240F68: .word ov45_02240850
	arm_func_end ov45_02240B10

	arm_func_start ov45_02240F6C
ov45_02240F6C: ; 0x02240F6C
	ldr ip, _02240F78 ; =ov45_02237A24
	add r1, r1, #0x30
	bx ip
	.balign 4, 0
_02240F78: .word ov45_02237A24
	arm_func_end ov45_02240F6C

	arm_func_start ov45_02240F7C
ov45_02240F7C: ; 0x02240F7C
	ldr ip, _02240F88 ; =ov45_02237A24
	add r1, r1, #0x24
	bx ip
	.balign 4, 0
_02240F88: .word ov45_02237A24
	arm_func_end ov45_02240F7C

	arm_func_start ov45_02240F8C
ov45_02240F8C: ; 0x02240F8C
	ldr ip, _02240F98 ; =ov45_02237A24
	add r1, r1, #0x3c
	bx ip
	.balign 4, 0
_02240F98: .word ov45_02237A24
	arm_func_end ov45_02240F8C

	arm_func_start ov45_02240F9C
ov45_02240F9C: ; 0x02240F9C
	stmdb sp!, {r4, lr}
	ldr r0, _02241044 ; =ov45_022577DC
	ldr r0, [r0]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r0, #4]
	cmp r0, #4
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	bl ov45_022424DC
	ldr r0, _02241044 ; =ov45_022577DC
	ldr r2, [r0]
	ldr r1, [r2, #0x60]
	cmp r1, #0
	beq _02241028
	ldr r0, [r2]
	bl ov45_022504E0
	ldr r0, _02241044 ; =ov45_022577DC
	ldr r4, [r0]
	cmp r4, #0
	beq _0224103C
	beq _02241018
	mov r0, r4
	bl ov45_02242858
	cmp r4, #0
	beq _02241018
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02241018:
	ldr r0, _02241044 ; =ov45_022577DC
	mov r1, #0
	str r1, [r0]
	b _0224103C
_02241028:
	mov r1, #4
	str r1, [r2, #4]
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov45_022504E0
_0224103C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02241044: .word ov45_022577DC
	arm_func_end ov45_02240F9C

	arm_func_start ov45_02241048
ov45_02241048: ; 0x02241048
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x88
	ldr r4, _02241288 ; =ov45_022577DC
	mov r8, r0
	ldr r4, [r4]
	mov r7, r1
	cmp r4, #0
	mov r6, r2
	mov r5, r3
	addeq sp, sp, #0x88
	moveq r0, #4
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	beq _02241090
	ldr r0, [r4, #4]
	cmp r0, #5
	addeq sp, sp, #0x88
	moveq r0, #7
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
_02241090:
	cmp r4, #0
	beq _022410B4
	ldr r0, _02241288 ; =ov45_022577DC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	addne sp, sp, #0x88
	movne r0, #4
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
_022410B4:
	mov r0, r8
	bl strlen
	mov r0, #0x10
	bl ov45_02242394
	cmp r0, #0
	beq _02241108
	ldr r2, _0224128C ; =ov45_02255238
	ldr r1, _02241290 ; =ov45_022577E0
	str r2, [r0]
	mov ip, #0
	ldr r2, [r1]
	ldr r3, [sp, #0xa4]
	str ip, [r0, #4]
	str r3, [r0, #8]
	add ip, r2, #1
	ldr r3, _02241294 ; =ov45_02255280
	str r2, [r0, #4]
	ldr r2, [sp, #0xa0]
	str r3, [r0]
	str ip, [r1]
	str r2, [r0, #0xc]
_02241108:
	str r0, [sp, #0x10]
	add r0, sp, #0x14
	add r2, sp, #0x10
	add r1, r4, #0x90
	bl ov45_0224206C
	mov r1, #0
	ldr r0, [sp, #0x10]
	strb r1, [sp, #0xc]
	strb r1, [sp, #0xd]
	ldr r1, [r0]
	ldr r1, [r1, #8]
	blx r1
	mov r4, r0
	add r0, sp, #0x4c
	mov r1, r8
	bl ov45_02237B58
	ldr r1, _02241288 ; =ov45_022577DC
	add r0, sp, #0x40
	ldr r1, [r1]
	add r2, sp, #0x4c
	bl ov45_022428C8
	ldr r0, [sp, #0x40]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #0x41
	ldrne r1, [sp, #0x48]
	add r0, sp, #0x34
	bl ov45_02237B58
	ldr r0, _02241288 ; =ov45_022577DC
	add r1, sp, #0x34
	ldr r0, [r0]
	mov r2, r5
	mov r3, r6
	bl ov45_02242ACC
	add r0, sp, #0x34
	bl ov45_02237BC8
	add r0, sp, #0x40
	bl ov45_02237BC8
	add r0, sp, #0x4c
	bl ov45_02237BC8
	add r0, sp, #0x58
	mov r1, #0
	mov r2, #0x30
	bl MI_CpuFill8
	ldr r0, _02241298 ; =ov45_0223F8F4
	ldr r2, _0224129C ; =ov45_0223F1E4
	str r0, [sp, #0x70]
	ldr r0, _022412A0 ; =ov45_0223F83C
	str r2, [sp, #0x58]
	ldr r2, _022412A4 ; =ov45_0223F2D8
	str r0, [sp, #0x6c]
	ldr r0, _022412A8 ; =ov45_0223F32C
	str r2, [sp, #0x5c]
	ldr r2, _022412AC ; =ov45_0223F5C8
	str r0, [sp, #0x60]
	ldr r0, _022412B0 ; =ov45_0223F768
	str r2, [sp, #0x64]
	ldr r2, _022412B4 ; =ov45_0223F910
	str r0, [sp, #0x74]
	ldr r0, _022412B8 ; =ov45_02240620
	str r2, [sp, #0x78]
	ldr r2, _022412BC ; =ov45_0223F6F4
	str r0, [sp, #0x80]
	str r2, [sp, #0x68]
	ldr r2, [r5, #0x14]
	mov r1, r8
	add r0, sp, #0x28
	str r2, [sp, #0x84]
	bl ov45_02237B58
	ldr r1, _02241288 ; =ov45_022577DC
	add r0, sp, #0x1c
	ldr r1, [r1]
	add r2, sp, #0x28
	bl ov45_022428C8
	ldr r0, [sp, #0x1c]
	mov r2, #0
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #0x1d
	ldrne r1, [sp, #0x24]
	ldr r0, _022412C0 ; =ov45_02240234
	add r3, sp, #0x58
	stmia sp, {r0, r4}
	str r2, [sp, #8]
	ldr r0, _02241288 ; =ov45_022577DC
	mov r2, r7
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov45_02250688
	add r0, sp, #0x1c
	bl ov45_02237BC8
	add r0, sp, #0x28
	bl ov45_02237BC8
	mov r0, #0
	add sp, sp, #0x88
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02241288: .word ov45_022577DC
_0224128C: .word ov45_02255238
_02241290: .word ov45_022577E0
_02241294: .word ov45_02255280
_02241298: .word ov45_0223F8F4
_0224129C: .word ov45_0223F1E4
_022412A0: .word ov45_0223F83C
_022412A4: .word ov45_0223F2D8
_022412A8: .word ov45_0223F32C
_022412AC: .word ov45_0223F5C8
_022412B0: .word ov45_0223F768
_022412B4: .word ov45_0223F910
_022412B8: .word ov45_02240620
_022412BC: .word ov45_0223F6F4
_022412C0: .word ov45_02240234
	arm_func_end ov45_02241048

	arm_func_start ov45_022412C4
ov45_022412C4: ; 0x022412C4
	ldr r0, [r0, #4]
	bx lr
	arm_func_end ov45_022412C4

	arm_func_start ov45_022412CC
ov45_022412CC: ; 0x022412CC
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x30
	ldr r1, _022413D0 ; =ov45_022577DC
	mov r4, r0
	ldr r1, [r1]
	cmp r1, #0
	addeq sp, sp, #0x30
	moveq r0, #4
	ldmeqia sp!, {r4, pc}
	beq _02241308
	ldr r0, [r1, #4]
	cmp r0, #5
	addeq sp, sp, #0x30
	moveq r0, #7
	ldmeqia sp!, {r4, pc}
_02241308:
	cmp r1, #0
	beq _0224132C
	ldr r0, _022413D0 ; =ov45_022577DC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	addne sp, sp, #0x30
	movne r0, #4
	ldmneia sp!, {r4, pc}
_0224132C:
	add r0, sp, #0x24
	mov r1, r4
	bl ov45_02237B58
	ldr r1, _022413D0 ; =ov45_022577DC
	add r0, sp, #0x18
	ldr r1, [r1]
	add r2, sp, #0x24
	bl ov45_022428C8
	ldr r0, [sp, #0x18]
	mov r2, #0
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldr r0, _022413D0 ; =ov45_022577DC
	addeq r1, sp, #0x19
	ldr r0, [r0]
	ldrne r1, [sp, #0x20]
	ldr r0, [r0]
	bl ov45_022507D8
	add r0, sp, #0x18
	bl ov45_02237BC8
	add r0, sp, #0x24
	bl ov45_02237BC8
	add r0, sp, #0xc
	mov r1, r4
	bl ov45_02237B58
	ldr r1, _022413D0 ; =ov45_022577DC
	add r0, sp, #0
	ldr r1, [r1]
	add r2, sp, #0xc
	bl ov45_022428C8
	ldr r0, _022413D0 ; =ov45_022577DC
	add r1, sp, #0
	ldr r0, [r0]
	bl ov45_0224335C
	add r0, sp, #0
	bl ov45_02237BC8
	add r0, sp, #0xc
	bl ov45_02237BC8
	mov r0, #0
	add sp, sp, #0x30
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022413D0: .word ov45_022577DC
	arm_func_end ov45_022412CC

	arm_func_start ov45_022413D4
ov45_022413D4: ; 0x022413D4
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	ldr r2, _022414BC ; =ov45_022577DC
	mov r5, r0
	ldr r2, [r2]
	mov r4, r1
	cmp r2, #0
	addeq sp, sp, #0x18
	moveq r0, #4
	ldmeqia sp!, {r3, r4, r5, pc}
	beq _02241414
	ldr r0, [r2, #4]
	cmp r0, #5
	addeq sp, sp, #0x18
	moveq r0, #7
	ldmeqia sp!, {r3, r4, r5, pc}
_02241414:
	cmp r2, #0
	beq _02241438
	ldr r0, _022414BC ; =ov45_022577DC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	addne sp, sp, #0x18
	movne r0, #4
	ldmneia sp!, {r3, r4, r5, pc}
_02241438:
	mov r0, r4
	bl strlen
	add r0, r0, #1
	cmp r0, #0x190
	addhi sp, sp, #0x18
	movhi r0, #3
	ldmhiia sp!, {r3, r4, r5, pc}
	add r0, sp, #0xc
	mov r1, r5
	bl ov45_02237B58
	ldr r1, _022414BC ; =ov45_022577DC
	add r0, sp, #0
	ldr r1, [r1]
	add r2, sp, #0xc
	bl ov45_022428C8
	ldr r0, [sp]
	mov r2, r4
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldr r0, _022414BC ; =ov45_022577DC
	addeq r1, sp, #1
	ldr r0, [r0]
	ldrne r1, [sp, #8]
	ldr r0, [r0]
	mov r3, #3
	bl ov45_0225089C
	add r0, sp, #0
	bl ov45_02237BC8
	add r0, sp, #0xc
	bl ov45_02237BC8
	mov r0, #0
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022414BC: .word ov45_022577DC
	arm_func_end ov45_022413D4

	arm_func_start ov45_022414C0
ov45_022414C0: ; 0x022414C0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	ldr r2, _022415C4 ; =ov45_022577DC
	mov r6, r0
	ldr r4, [r2]
	mov r5, r1
	cmp r4, #0
	addeq sp, sp, #0xc
	moveq r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	beq _02241500
	ldr r0, [r4, #4]
	cmp r0, #5
	addeq sp, sp, #0xc
	moveq r0, #7
	ldmeqia sp!, {r3, r4, r5, r6, pc}
_02241500:
	cmp r4, #0
	beq _02241524
	ldr r0, _022415C4 ; =ov45_022577DC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	addne sp, sp, #0xc
	movne r0, #4
	ldmneia sp!, {r3, r4, r5, r6, pc}
_02241524:
	mov r0, r5
	bl strlen
	add r0, r0, #1
	cmp r0, #0x190
	addhi sp, sp, #0xc
	movhi r0, #3
	ldmhiia sp!, {r3, r4, r5, r6, pc}
	add r0, sp, #0
	mov r1, r4
	mov r2, r6
	bl ov45_0224367C
	ldr r1, _022415C8 ; =ov45_02255304
	add r0, sp, #0
	bl ov45_02237FD8
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	beq _02241584
	add r0, sp, #0
	bl ov45_02237BC8
	add sp, sp, #0xc
	mov r0, #3
	ldmia sp!, {r3, r4, r5, r6, pc}
_02241584:
	ldr r0, [sp]
	mov r2, r5
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldr r0, _022415C4 ; =ov45_022577DC
	addeq r1, sp, #1
	ldr r0, [r0]
	ldrne r1, [sp, #8]
	ldr r0, [r0]
	mov r3, #3
	bl ov45_02251350
	add r0, sp, #0
	bl ov45_02237BC8
	mov r0, #0
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_022415C4: .word ov45_022577DC
_022415C8: .word ov45_02255304
	arm_func_end ov45_022414C0

	arm_func_start ov45_022415CC
ov45_022415CC: ; 0x022415CC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x38
	ldr r2, _022417AC ; =ov45_022577DC
	mov r5, r0
	ldr r2, [r2]
	mov r4, r1
	cmp r2, #0
	addeq sp, sp, #0x38
	moveq r0, #4
	ldmeqia sp!, {r3, r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
	beq _02241620
	ldr r0, [r2, #4]
	cmp r0, #5
	addeq sp, sp, #0x38
	moveq r0, #7
	ldmeqia sp!, {r3, r4, r5, lr}
	addeq sp, sp, #0x10
	bxeq lr
_02241620:
	cmp r2, #0
	beq _0224164C
	ldr r0, _022417AC ; =ov45_022577DC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	addne sp, sp, #0x38
	movne r0, #4
	ldmneia sp!, {r3, r4, r5, lr}
	addne sp, sp, #0x10
	bxne lr
_0224164C:
	ldr r0, [sp, #0x54]
	bl strlen
	add r0, r0, #1
	cmp r0, #0x190
	bhi _02241674
	ldr r0, [sp, #0x50]
	bl strlen
	add r0, r0, #1
	cmp r0, #0x14
	bls _02241688
_02241674:
	add sp, sp, #0x38
	mov r0, #3
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_02241688:
	ldr r1, _022417B0 ; =ov45_02255304
	add r0, sp, #0x2c
	bl ov45_02237B58
	mvn r0, #0
	cmp r4, r0
	bne _022416B0
	ldr r1, _022417B0 ; =ov45_02255304
	add r0, sp, #0x2c
	bl ov45_0223DAD4
	b _02241714
_022416B0:
	ldr r1, _022417AC ; =ov45_022577DC
	add r0, sp, #0x20
	ldr r1, [r1]
	mov r2, r4
	bl ov45_0224367C
	add r0, sp, #0x2c
	add r1, sp, #0x20
	bl ov45_02237D48
	add r0, sp, #0x20
	bl ov45_02237BC8
	ldr r1, _022417B0 ; =ov45_02255304
	add r0, sp, #0x2c
	bl ov45_02237FD8
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	beq _02241714
	add r0, sp, #0x2c
	bl ov45_02237BC8
	add sp, sp, #0x38
	mov r0, #3
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_02241714:
	add r0, sp, #0x14
	mov r1, r5
	bl ov45_02237B58
	ldr r1, _022417AC ; =ov45_022577DC
	add r0, sp, #8
	ldr r1, [r1]
	add r2, sp, #0x14
	bl ov45_022428C8
	ldr r0, [sp, #0x2c]
	add r3, sp, #0x54
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldr r0, [sp, #8]
	addeq r2, sp, #0x2d
	mov r0, r0, lsl #0x1f
	ldrne r2, [sp, #0x34]
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #9
	ldrne r1, [sp, #0x10]
	add r0, sp, #0x50
	str r0, [sp]
	str r3, [sp, #4]
	ldr r0, _022417AC ; =ov45_022577DC
	mov r3, #1
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov45_02251554
	add r0, sp, #8
	bl ov45_02237BC8
	add r0, sp, #0x14
	bl ov45_02237BC8
	add r0, sp, #0x2c
	bl ov45_02237BC8
	mov r0, #0
	add sp, sp, #0x38
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_022417AC: .word ov45_022577DC
_022417B0: .word ov45_02255304
	arm_func_end ov45_022415CC

	arm_func_start ov45_022417B4
ov45_022417B4: ; 0x022417B4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x50
	ldr r2, _02241A08 ; =ov45_022577DC
	mov r6, r0
	ldr r2, [r2]
	mov r4, r1
	cmp r2, #0
	mov r5, r3
	addeq sp, sp, #0x50
	moveq r0, #4
	ldmeqia sp!, {r4, r5, r6, lr}
	addeq sp, sp, #0x10
	bxeq lr
	beq _0224180C
	ldr r0, [r2, #4]
	cmp r0, #5
	addeq sp, sp, #0x50
	moveq r0, #7
	ldmeqia sp!, {r4, r5, r6, lr}
	addeq sp, sp, #0x10
	bxeq lr
_0224180C:
	cmp r2, #0
	beq _02241838
	ldr r0, _02241A08 ; =ov45_022577DC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	addne sp, sp, #0x50
	movne r0, #4
	ldmneia sp!, {r4, r5, r6, lr}
	addne sp, sp, #0x10
	bxne lr
_02241838:
	ldr r0, [sp, #0x68]
	bl strlen
	add r0, r0, #1
	cmp r0, #0x14
	addhi sp, sp, #0x50
	movhi r0, #3
	ldmhiia sp!, {r4, r5, r6, lr}
	addhi sp, sp, #0x10
	bxhi lr
	ldr r1, _02241A0C ; =ov45_02255304
	add r0, sp, #0x44
	bl ov45_02237B58
	mvn r0, #0
	cmp r4, r0
	bne _02241884
	ldr r1, _02241A0C ; =ov45_02255304
	add r0, sp, #0x44
	bl ov45_0223DAD4
	b _022418E8
_02241884:
	ldr r1, _02241A08 ; =ov45_022577DC
	add r0, sp, #0x38
	ldr r1, [r1]
	mov r2, r4
	bl ov45_0224367C
	add r0, sp, #0x44
	add r1, sp, #0x38
	bl ov45_02237D48
	add r0, sp, #0x38
	bl ov45_02237BC8
	ldr r1, _02241A0C ; =ov45_02255304
	add r0, sp, #0x44
	bl ov45_02237FD8
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	beq _022418E8
	add r0, sp, #0x44
	bl ov45_02237BC8
	add sp, sp, #0x50
	mov r0, #3
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
_022418E8:
	ldr r1, _02241A08 ; =ov45_022577DC
	mov r0, #0x10
	ldr r4, [r1]
	bl ov45_02242394
	cmp r0, #0
	beq _02241934
	ldr r2, _02241A10 ; =ov45_02255238
	ldr r1, _02241A14 ; =ov45_022577E0
	str r2, [r0]
	mov r3, #0
	ldr r2, [sp, #0x70]
	str r3, [r0, #4]
	ldr ip, [r1]
	str r2, [r0, #8]
	ldr r2, _02241A18 ; =ov45_02255268
	add r3, ip, #1
	stmia r0, {r2, ip}
	str r3, [r1]
	str r5, [r0, #0xc]
_02241934:
	str r0, [sp, #0x14]
	add r0, sp, #0x18
	add r2, sp, #0x14
	add r1, r4, #0x90
	bl ov45_0224206C
	mov r1, #0
	ldr r0, [sp, #0x14]
	strb r1, [sp, #0x10]
	strb r1, [sp, #0x11]
	ldr r1, [r0]
	ldr r1, [r1, #8]
	blx r1
	mov r4, r0
	add r0, sp, #0x2c
	mov r1, r6
	bl ov45_02237B58
	ldr r1, _02241A08 ; =ov45_022577DC
	add r0, sp, #0x20
	ldr r1, [r1]
	add r2, sp, #0x2c
	bl ov45_022428C8
	ldr r0, [sp, #0x44]
	add r3, sp, #0x68
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldr r0, [sp, #0x20]
	addeq r2, sp, #0x45
	mov r0, r0, lsl #0x1f
	ldrne r2, [sp, #0x4c]
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #0x21
	ldrne r1, [sp, #0x28]
	ldr r0, _02241A1C ; =ov45_02240494
	str r3, [sp]
	stmib sp, {r0, r4}
	mov r3, #0
	str r3, [sp, #0xc]
	ldr r0, _02241A08 ; =ov45_022577DC
	mov r3, #1
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov45_022518F0
	add r0, sp, #0x20
	bl ov45_02237BC8
	add r0, sp, #0x2c
	bl ov45_02237BC8
	add r0, sp, #0x44
	bl ov45_02237BC8
	mov r0, #0
	add sp, sp, #0x50
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_02241A08: .word ov45_022577DC
_02241A0C: .word ov45_02255304
_02241A10: .word ov45_02255238
_02241A14: .word ov45_022577E0
_02241A18: .word ov45_02255268
_02241A1C: .word ov45_02240494
	arm_func_end ov45_022417B4

	arm_func_start ov45_02241A20
ov45_02241A20: ; 0x02241A20
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x30
	ldr r3, _02241B6C ; =ov45_022577DC
	mov r7, r0
	ldr r4, [r3]
	mov r6, r1
	cmp r4, #0
	mov r5, r2
	addeq sp, sp, #0x30
	moveq r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	beq _02241A64
	ldr r0, [r4, #4]
	cmp r0, #5
	addeq sp, sp, #0x30
	moveq r0, #7
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
_02241A64:
	cmp r4, #0
	beq _02241A88
	ldr r0, _02241B6C ; =ov45_022577DC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	addne sp, sp, #0x30
	movne r0, #4
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
_02241A88:
	mov r0, #0x10
	bl ov45_02242394
	cmp r0, #0
	beq _02241AC4
	ldr r2, _02241B70 ; =ov45_02255238
	ldr r1, _02241B74 ; =ov45_022577E0
	str r2, [r0]
	mov r2, #0
	ldr ip, [r1]
	stmib r0, {r2, r5}
	ldr r2, _02241B78 ; =ov45_022552B0
	add r3, ip, #1
	stmia r0, {r2, ip}
	str r3, [r1]
	str r6, [r0, #0xc]
_02241AC4:
	str r0, [sp, #0xc]
	add r0, sp, #0x10
	add r2, sp, #0xc
	add r1, r4, #0x90
	bl ov45_0224206C
	mov r1, #0
	ldr r0, [sp, #0xc]
	strb r1, [sp, #8]
	strb r1, [sp, #9]
	ldr r1, [r0]
	ldr r1, [r1, #8]
	blx r1
	mov r4, r0
	add r0, sp, #0x24
	mov r1, r7
	bl ov45_02237B58
	ldr r1, _02241B6C ; =ov45_022577DC
	add r0, sp, #0x18
	ldr r1, [r1]
	add r2, sp, #0x24
	bl ov45_022428C8
	ldr r0, [sp, #0x18]
	mov r2, #0
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #0x19
	ldrne r1, [sp, #0x20]
	ldr r0, _02241B6C ; =ov45_022577DC
	str r4, [sp]
	str r2, [sp, #4]
	ldr r0, [r0]
	ldr r2, _02241B7C ; =ov45_0223FE20
	ldr r0, [r0]
	ldr r3, _02241B80 ; =ov45_0223FC6C
	bl ov45_022505A0
	add r0, sp, #0x18
	bl ov45_02237BC8
	add r0, sp, #0x24
	bl ov45_02237BC8
	mov r0, #0
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02241B6C: .word ov45_022577DC
_02241B70: .word ov45_02255238
_02241B74: .word ov45_022577E0
_02241B78: .word ov45_022552B0
_02241B7C: .word ov45_0223FE20
_02241B80: .word ov45_0223FC6C
	arm_func_end ov45_02241A20

	arm_func_start ov45_02241B84
ov45_02241B84: ; 0x02241B84
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x44
	ldr r3, _02241D44 ; =ov45_022577DC
	mov r7, r0
	ldr r3, [r3]
	mov r6, r1
	cmp r3, #0
	mov r5, r2
	addeq sp, sp, #0x44
	moveq r0, #4
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	beq _02241BC8
	ldr r0, [r3, #4]
	cmp r0, #5
	addeq sp, sp, #0x44
	moveq r0, #7
	ldmeqia sp!, {r4, r5, r6, r7, pc}
_02241BC8:
	cmp r3, #0
	beq _02241BEC
	ldr r0, _02241D44 ; =ov45_022577DC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	addne sp, sp, #0x44
	movne r0, #4
	ldmneia sp!, {r4, r5, r6, r7, pc}
_02241BEC:
	add r0, sp, #0x38
	mov r1, r7
	bl ov45_02237B58
	ldr r1, _02241D44 ; =ov45_022577DC
	add r0, sp, #0x2c
	ldr r1, [r1]
	add r2, sp, #0x38
	bl ov45_022428C8
	ldr r0, [sp, #0x2c]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldr r0, _02241D44 ; =ov45_022577DC
	addeq r1, sp, #0x2d
	ldr r0, [r0]
	ldrne r1, [sp, #0x34]
	ldr r0, [r0]
	bl ov45_02251024
	cmp r0, #0
	moveq r4, #1
	add r0, sp, #0x2c
	movne r4, #0
	bl ov45_02237BC8
	add r0, sp, #0x38
	bl ov45_02237BC8
	cmp r4, #0
	addne sp, sp, #0x44
	movne r0, #5
	ldmneia sp!, {r4, r5, r6, r7, pc}
	ldr r1, _02241D44 ; =ov45_022577DC
	mov r0, #0x10
	ldr r4, [r1]
	bl ov45_02242394
	cmp r0, #0
	beq _02241CA0
	ldr r2, _02241D48 ; =ov45_02255238
	ldr r1, _02241D4C ; =ov45_022577E0
	str r2, [r0]
	mov r2, #0
	ldr ip, [r1]
	stmib r0, {r2, r5}
	ldr r2, _02241D50 ; =ov45_02255298
	add r3, ip, #1
	stmia r0, {r2, ip}
	str r3, [r1]
	str r6, [r0, #0xc]
_02241CA0:
	str r0, [sp, #8]
	add r0, sp, #0xc
	add r2, sp, #8
	add r1, r4, #0x90
	bl ov45_0224206C
	mov r1, #0
	ldr r0, [sp, #8]
	strb r1, [sp, #4]
	strb r1, [sp, #5]
	ldr r1, [r0]
	ldr r1, [r1, #8]
	blx r1
	mov r4, r0
	add r0, sp, #0x20
	mov r1, r7
	bl ov45_02237B58
	ldr r1, _02241D44 ; =ov45_022577DC
	add r0, sp, #0x14
	ldr r1, [r1]
	add r2, sp, #0x20
	bl ov45_022428C8
	ldr r0, [sp, #0x14]
	mov r2, #0
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #0x15
	ldrne r1, [sp, #0x1c]
	ldr r0, _02241D44 ; =ov45_022577DC
	str r2, [sp]
	ldr r0, [r0]
	ldr r2, _02241D54 ; =ov45_0223FE28
	ldr r0, [r0]
	mov r3, r4
	bl ov45_02251208
	add r0, sp, #0x14
	bl ov45_02237BC8
	add r0, sp, #0x20
	bl ov45_02237BC8
	mov r0, #0
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_02241D44: .word ov45_022577DC
_02241D48: .word ov45_02255238
_02241D4C: .word ov45_022577E0
_02241D50: .word ov45_02255298
_02241D54: .word ov45_0223FE28
	arm_func_end ov45_02241B84

	arm_func_start ov45_02241D58
ov45_02241D58: ; 0x02241D58
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x18
	ldr r2, _02241E20 ; =ov45_022577DC
	mov r4, r1
	ldr r2, [r2]
	mov r3, r0
	cmp r2, #0
	addeq sp, sp, #0x18
	moveq r0, #4
	ldmeqia sp!, {r4, pc}
	beq _02241D98
	ldr r0, [r2, #4]
	cmp r0, #5
	addeq sp, sp, #0x18
	moveq r0, #7
	ldmeqia sp!, {r4, pc}
_02241D98:
	cmp r2, #0
	beq _02241DBC
	ldr r0, _02241E20 ; =ov45_022577DC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	addne sp, sp, #0x18
	movne r0, #4
	ldmneia sp!, {r4, pc}
_02241DBC:
	add r0, sp, #0xc
	mov r1, r3
	bl ov45_02237B58
	ldr r1, _02241E20 ; =ov45_022577DC
	add r0, sp, #0
	ldr r1, [r1]
	add r2, sp, #0xc
	bl ov45_022428C8
	ldr r0, [sp]
	mov r2, r4
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldr r0, _02241E20 ; =ov45_022577DC
	addeq r1, sp, #1
	ldr r0, [r0]
	ldrne r1, [sp, #8]
	ldr r0, [r0]
	bl ov45_02250A80
	add r0, sp, #0
	bl ov45_02237BC8
	add r0, sp, #0xc
	bl ov45_02237BC8
	mov r0, #0
	add sp, sp, #0x18
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02241E20: .word ov45_022577DC
	arm_func_end ov45_02241D58

	arm_func_start ov45_02241E24
ov45_02241E24: ; 0x02241E24
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x2c
	ldr r3, _02241F6C ; =ov45_022577DC
	mov r7, r0
	ldr r4, [r3]
	mov r6, r1
	cmp r4, #0
	mov r5, r2
	addeq sp, sp, #0x2c
	moveq r0, #4
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	beq _02241E68
	ldr r0, [r4, #4]
	cmp r0, #5
	addeq sp, sp, #0x2c
	moveq r0, #7
	ldmeqia sp!, {r4, r5, r6, r7, pc}
_02241E68:
	cmp r4, #0
	beq _02241E8C
	ldr r0, _02241F6C ; =ov45_022577DC
	ldr r0, [r0]
	ldr r0, [r0, #4]
	cmp r0, #3
	addne sp, sp, #0x2c
	movne r0, #4
	ldmneia sp!, {r4, r5, r6, r7, pc}
_02241E8C:
	mov r0, #0x10
	bl ov45_02242394
	cmp r0, #0
	beq _02241EC8
	ldr r2, _02241F70 ; =ov45_02255238
	ldr r1, _02241F74 ; =ov45_022577E0
	str r2, [r0]
	mov r2, #0
	ldr ip, [r1]
	stmib r0, {r2, r5}
	ldr r2, _02241F78 ; =ov45_02255250
	add r3, ip, #1
	stmia r0, {r2, ip}
	str r3, [r1]
	str r6, [r0, #0xc]
_02241EC8:
	str r0, [sp, #8]
	add r0, sp, #0xc
	add r2, sp, #8
	add r1, r4, #0x90
	bl ov45_0224206C
	mov r1, #0
	ldr r0, [sp, #8]
	strb r1, [sp, #4]
	strb r1, [sp, #5]
	ldr r1, [r0]
	ldr r1, [r1, #8]
	blx r1
	mov r4, r0
	add r0, sp, #0x20
	mov r1, r7
	bl ov45_02237B58
	ldr r1, _02241F6C ; =ov45_022577DC
	add r0, sp, #0x14
	ldr r1, [r1]
	add r2, sp, #0x20
	bl ov45_022428C8
	ldr r0, [sp, #0x14]
	mov r2, #0
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r1, sp, #0x15
	ldrne r1, [sp, #0x1c]
	ldr r0, _02241F6C ; =ov45_022577DC
	str r2, [sp]
	ldr r0, [r0]
	ldr r2, _02241F7C ; =ov45_02240718
	ldr r0, [r0]
	mov r3, r4
	bl ov45_02250C80
	add r0, sp, #0x14
	bl ov45_02237BC8
	add r0, sp, #0x20
	bl ov45_02237BC8
	mov r0, #0
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_02241F6C: .word ov45_022577DC
_02241F70: .word ov45_02255238
_02241F74: .word ov45_022577E0
_02241F78: .word ov45_02255250
_02241F7C: .word ov45_02240718
	arm_func_end ov45_02241E24

	arm_func_start ov45_02241F80
ov45_02241F80: ; 0x02241F80
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _02241F9C
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02241F9C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02241F80

	arm_func_start ov45_02241FA4
ov45_02241FA4: ; 0x02241FA4
	bx lr
	arm_func_end ov45_02241FA4

	arm_func_start ov45_02241FA8
ov45_02241FA8: ; 0x02241FA8
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _02241FC4
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02241FC4:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02241FA8

	arm_func_start ov45_02241FCC
ov45_02241FCC: ; 0x02241FCC
	bx lr
	arm_func_end ov45_02241FCC

	arm_func_start ov45_02241FD0
ov45_02241FD0: ; 0x02241FD0
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _02241FEC
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02241FEC:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02241FD0

	arm_func_start ov45_02241FF4
ov45_02241FF4: ; 0x02241FF4
	bx lr
	arm_func_end ov45_02241FF4

	arm_func_start ov45_02241FF8
ov45_02241FF8: ; 0x02241FF8
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _02242014
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02242014:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02241FF8

	arm_func_start ov45_0224201C
ov45_0224201C: ; 0x0224201C
	bx lr
	arm_func_end ov45_0224201C

	arm_func_start ov45_02242020
ov45_02242020: ; 0x02242020
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _0224203C
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_0224203C:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02242020

	arm_func_start ov45_02242044
ov45_02242044: ; 0x02242044
	bx lr
	arm_func_end ov45_02242044

	arm_func_start ov45_02242048
ov45_02242048: ; 0x02242048
	stmdb sp!, {r4, lr}
	movs r4, r0
	beq _02242064
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02242064:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02242048

	arm_func_start ov45_0224206C
ov45_0224206C: ; 0x0224206C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	add ip, sp, #4
	mov r4, r2
	mov r5, r1
	mov r6, r0
	add r2, sp, #8
	add r3, sp, #5
	mov r0, r5
	mov r1, r4
	str ip, [sp]
	bl ov45_02242320
	ldr r3, [sp, #8]
	mov r1, r0
	cmp r3, #0
	beq _022420C4
	ldr r2, [r3, #0xc]
	ldr r0, [r4]
	ldr r2, [r2, #4]
	ldr r0, [r0, #4]
	cmp r2, r0
	bhs _022420F0
_022420C4:
	str r4, [sp]
	ldrb r2, [sp, #5]
	ldrb r3, [sp, #4]
	mov r0, r5
	bl ov45_0224210C
	ldr r1, _02242108 ; =ov45_02255228
	str r0, [r6]
	ldrb r0, [r1, #1]
	add sp, sp, #0xc
	strb r0, [r6, #4]
	ldmia sp!, {r3, r4, r5, r6, pc}
_022420F0:
	ldr r0, _02242108 ; =ov45_02255228
	str r3, [r6]
	ldrb r0, [r0, #2]
	strb r0, [r6, #4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_02242108: .word ov45_02255228
	arm_func_end ov45_0224206C

	arm_func_start ov45_0224210C
ov45_0224210C: ; 0x0224210C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r8, r0
	ldr r4, [r8]
	mvn r0, #0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp r4, r0
	bne _02242140
	ldr r0, _022421E0 ; =ov45_0225533C
	bl printf
	bl abort
_02242140:
	mov r1, #0
	mov r0, #0x10
	strb r1, [sp]
	bl ov45_02242394
	mov r4, r0
	add r0, r8, #4
	str r0, [sp, #0xc]
	adds r1, r4, #0xc
	ldrne r0, [sp, #0x30]
	str r4, [sp, #0x10]
	ldrne r0, [r0]
	str r4, [sp, #4]
	strne r0, [r1]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [sp, #0x10]
	str r0, [r4]
	adds r0, r4, #8
	strne r7, [r0]
	cmp r6, #0
	strne r4, [r7]
	streq r4, [r7, #4]
	ldr r1, [r8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r8]
	ldr r1, [r8, #4]
	str r4, [sp, #8]
	bl ov45_02236EC4
	cmp r5, #0
	ldr r1, [sp, #0x10]
	strne r4, [r8, #8]
	cmp r1, #0
	beq _022421D4
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
_022421D4:
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_022421E0: .word ov45_0225533C
	arm_func_end ov45_0224210C

	arm_func_start ov45_022421E4
ov45_022421E4: ; 0x022421E4
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r3, [r5, #4]
	mov r0, #0
	strb r0, [sp, #2]
	ldr r1, [r5, #4]
	mov r4, r2
	sub r1, r1, r3
	str r1, [r5, #4]
	ldr r1, [r5]
	cmp r1, #0
	beq _0224222C
	beq _02242220
	mov r2, r0
	bl ov00_021EC2EC
_02242220:
	mov r0, #0
	str r0, [r5]
	str r0, [r5, #8]
_0224222C:
	mov r3, #0
	strb r3, [sp]
	sub r0, sp, #4
	strb r3, [r0]
	ldr r2, [r0]
	mov r0, r5
	mov r1, r4
	strb r3, [sp, #1]
	bl ov45_0223EA04
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_022421E4

	arm_func_start ov45_02242254
ov45_02242254: ; 0x02242254
	stmdb sp!, {r3, lr}
	ldr r3, [r1]
	mov r3, r3, lsl #0x1f
	movs r3, r3, lsr #0x1f
	ldmneib r1, {r3, ip}
	bne _0224227C
	ldrb r3, [r1]
	add ip, r1, #1
	mov r1, r3, lsl #0x18
	mov r3, r1, lsr #0x19
_0224227C:
	mov r1, ip
	bl ov45_02242288
	ldmia sp!, {r3, pc}
	arm_func_end ov45_02242254

	arm_func_start ov45_02242288
ov45_02242288: ; 0x02242288
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr ip, [r0]
	mov ip, ip, lsl #0x1f
	movs ip, ip, lsr #0x1f
	ldrne lr, [r0, #8]
	ldrne r0, [r0, #4]
	bne _022422B4
	ldrb ip, [r0]
	add lr, r0, #1
	mov r0, ip, lsl #0x18
	mov r0, r0, lsr #0x19
_022422B4:
	cmp r2, r0
	bhs _02242318
	cmp r3, #0
	beq _02242318
	add ip, lr, r0
	add r4, lr, r2
	cmp r4, ip
	bhs _02242318
	mov r2, #0
_022422D8:
	mov r5, r1
	mov r6, r2
	cmp r3, #0
	bls _0224230C
	ldrsb r7, [r4]
_022422EC:
	ldrsb r0, [r5]
	cmp r7, r0
	subeq r0, r4, lr
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r6, r6, #1
	cmp r6, r3
	add r5, r5, #1
	blo _022422EC
_0224230C:
	add r4, r4, #1
	cmp r4, ip
	blo _022422D8
_02242318:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_02242288

	arm_func_start ov45_02242320
ov45_02242320: ; 0x02242320
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	str r4, [r2]
	ldr r6, [r0, #4]
	mov r4, #1
	ldr r7, [sp, #0x18]
	strb r4, [r3]
	strb r4, [r7]
	cmp r6, #0
	add r0, r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov ip, #0
	mov lr, r4
_02242354:
	ldr r4, [r1]
	ldr r0, [r6, #0xc]
	ldr r5, [r4, #4]
	ldr r4, [r0, #4]
	mov r0, r6
	cmp r5, r4
	ldrlo r6, [r6]
	strlob lr, [r3]
	blo _02242388
	str r6, [r2]
	ldr r6, [r6, #4]
	strb ip, [r3]
	strb ip, [r7]
_02242388:
	cmp r6, #0
	bne _02242354
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_02242320

	arm_func_start ov45_02242394
ov45_02242394: ; 0x02242394
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r0
	ldr r4, _022423DC ; =ov45_022577E4
	moveq r6, #1
	mov r5, #0
_022423A8:
	mov r0, r5
	mov r1, r6
	bl ov00_021EC2A8
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r0, [r4]
	str r0, [r4]
	cmp r0, #0
	beq _022423D4
	blx r0
	b _022423A8
_022423D4:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_022423DC: .word ov45_022577E4
	arm_func_end ov45_02242394

	arm_func_start ov45_022423E0
ov45_022423E0: ; 0x022423E0
	stmdb sp!, {r3, lr}
	ldr r0, _02242404 ; =ov45_022577E8
	ldr r0, [r0]
	ldr r0, [r0]
	bl ov45_022504E0
	ldr r0, _02242408 ; =ov45_022577E4
	mov r1, #0
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02242404: .word ov45_022577E8
_02242408: .word ov45_022577E4
	arm_func_end ov45_022423E0

	arm_func_start ov45_0224240C
ov45_0224240C: ; 0x0224240C
	stmdb sp!, {r3, lr}
	ldr r0, _02242460 ; =ov45_022577E8
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _02242438
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
	ldr r0, _02242460 ; =ov45_022577E8
	mov r1, #0
	str r1, [r0, #4]
_02242438:
	ldr r0, _02242460 ; =ov45_022577E8
	mov r1, #2
	ldr r3, [r0]
	mov r2, #5
	str r1, [r3, #0x58]
	ldr r1, _02242464 ; =ov45_022423E0
	ldr r0, _02242468 ; =ov45_022577E4
	str r2, [r3, #4]
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02242460: .word ov45_022577E8
_02242464: .word ov45_022423E0
_02242468: .word ov45_022577E4
	arm_func_end ov45_0224240C

	arm_func_start ov45_0224246C
ov45_0224246C: ; 0x0224246C
	stmdb sp!, {r3, lr}
	ldr r1, _022424D0 ; =ov45_022577E8
	str r0, [r1]
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _0224249C
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
	ldr r0, _022424D0 ; =ov45_022577E8
	mov r1, #0
	str r1, [r0, #4]
_0224249C:
	mov r0, #0
	mov r1, #0x400
	bl ov00_021EC2A8
	ldr r1, _022424D0 ; =ov45_022577E8
	cmp r0, #0
	str r0, [r1, #4]
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r2, _022424D4 ; =ov45_0224240C
	ldr r1, _022424D8 ; =ov45_022577E4
	mov r0, #1
	str r2, [r1]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022424D0: .word ov45_022577E8
_022424D4: .word ov45_0224240C
_022424D8: .word ov45_022577E4
	arm_func_end ov45_0224246C

	arm_func_start ov45_022424DC
ov45_022424DC: ; 0x022424DC
	stmdb sp!, {r3, lr}
	ldr r0, _0224250C ; =ov45_022577E8
	ldr r1, [r0, #4]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
	ldr r0, _0224250C ; =ov45_022577E8
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_0224250C: .word ov45_022577E8
	arm_func_end ov45_022424DC

	arm_func_start ov45_02242510
ov45_02242510: ; 0x02242510
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x1c
	mov r4, r0
	ldr lr, _0224259C ; =ov45_02255238
	add r3, sp, #0x10
	str r1, [sp, #0x14]
	mov ip, #0
	add r0, sp, #4
	add r2, sp, #8
	mov r1, r4
	str lr, [sp, #0x10]
	str ip, [sp, #0x18]
	str r3, [sp, #8]
	bl ov45_0223FD8C
	ldr r1, [sp, #4]
	add r0, r4, #4
	cmp r1, r0
	str r1, [sp, #0xc]
	addeq sp, sp, #0x1c
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _0224257C
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
_0224257C:
	add r1, sp, #0xc
	ldr r2, [r1]
	add r0, sp, #0
	mov r1, r4
	bl ov45_0224261C
	mov r0, #1
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0224259C: .word ov45_02255238
	arm_func_end ov45_02242510

	arm_func_start ov45_022425A0
ov45_022425A0: ; 0x022425A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	mov r5, r0
	ldr r0, [r5, #8]
	add r4, r5, #4
	str r0, [sp, #8]
	cmp r0, r4
	addeq sp, sp, #0xc
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	add r8, sp, #8
	add r7, sp, #0
	add r6, sp, #4
_022425D0:
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _022425E8
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
_022425E8:
	ldr r1, [sp, #8]
	mov r0, r8
	str r1, [sp, #4]
	bl ov45_02236E58
	ldr r2, [r6]
	mov r0, r7
	mov r1, r5
	bl ov45_0224261C
	ldr r0, [sp, #8]
	cmp r0, r4
	bne _022425D0
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	arm_func_end ov45_022425A0

	arm_func_start ov45_0224261C
ov45_0224261C: ; 0x0224261C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [sp, #0x18]
	ldr r1, [r5, #8]
	mov r6, r0
	cmp r4, r1
	bne _0224264C
	add r0, sp, #0x18
	bl ov45_02236E58
	ldr r0, [sp, #0x18]
	str r0, [r5, #8]
_0224264C:
	ldr r1, [r5, #4]
	mov r0, r4
	bl ov45_022370D0
	str r0, [r6]
	cmp r4, #0
	beq _02242674
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02242674:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_0224261C

	arm_func_start ov45_0224268C
ov45_0224268C: ; 0x0224268C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x84
	mov r5, r0
	mov r0, #0
	mov r7, r1
	str r0, [r5]
	str r0, [r5, #4]
	ldr ip, [sp, #0x98]
	ldr r1, [sp, #0x9c]
	add r0, r5, #0xc
	mov r6, r2
	mov r4, r3
	str ip, [r5, #8]
	bl ov45_02237A24
	ldr r1, [sp, #0xa0]
	add r0, r5, #0x18
	bl ov45_02237A24
	ldr r1, [sp, #0xa4]
	add r0, r5, #0x24
	bl ov45_02237A24
	mov r1, r7
	add r0, r5, #0x30
	bl ov45_02237A24
	mov r1, r6
	add r0, r5, #0x3c
	bl ov45_02237A24
	mov r1, #0
	add r0, r5, #0x48
	mov ip, r1
_02242700:
	str ip, [r0, r1, lsl #2]
	add r1, r1, #1
	cmp r1, #3
	blo _02242700
	str ip, [r5, #0x54]
	str ip, [r5, #0x58]
	str ip, [r5, #0x5c]
	ldr r0, [sp, #0xa8]
	str ip, [r5, #0x60]
	add r3, r5, #0x64
	ldmia r0, {r0, r1, r2}
	stmia r3, {r0, r1, r2}
	str ip, [r5, #0x70]
	str ip, [r5, #0x74]
	add r0, r5, #0x74
	str r0, [r5, #0x7c]
	str ip, [r5, #0x80]
	str ip, [r5, #0x84]
	add r0, r5, #0x84
	str r0, [r5, #0x8c]
	str ip, [r5, #0x90]
	str ip, [r5, #0x94]
	add r0, r5, #0x94
	str r0, [r5, #0x98]
	str ip, [r5, #0x9c]
	str ip, [r5, #0xa0]
	add r0, r5, #0xa0
	ldr lr, _0224284C ; =ov45_02254DC4
	str r0, [r5, #0xa8]
	add ip, sp, #0x54
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r1, _02242850 ; =ov45_02254DBC
	add r0, sp, #0x48
	bl ov45_02237B58
	ldr r2, _02242854 ; =ov45_02255398
	add r0, sp, #0x3c
	add r1, sp, #0x48
	bl ov45_02233ABC
	add r0, sp, #0x30
	add r1, sp, #0x3c
	add r2, r5, #0x30
	bl ov45_022339F4
	ldr r2, _02242854 ; =ov45_02255398
	add r0, sp, #0x24
	add r1, sp, #0x30
	bl ov45_02233ABC
	add r1, sp, #0x54
	ldr r1, [r1, r4, lsl #2]
	add r0, sp, #0x18
	bl ov45_02237B58
	add r0, sp, #0xc
	add r1, sp, #0x24
	add r2, sp, #0x18
	bl ov45_022339F4
	ldr r2, _02242854 ; =ov45_02255398
	add r0, sp, #0
	add r1, sp, #0xc
	bl ov45_02233ABC
	add r1, sp, #0
	add r0, r5, #0x48
	bl ov45_02237D48
	add r0, sp, #0
	bl ov45_02237BC8
	add r0, sp, #0xc
	bl ov45_02237BC8
	add r0, sp, #0x18
	bl ov45_02237BC8
	add r0, sp, #0x24
	bl ov45_02237BC8
	add r0, sp, #0x30
	bl ov45_02237BC8
	add r0, sp, #0x3c
	bl ov45_02237BC8
	add r0, sp, #0x48
	bl ov45_02237BC8
	mov r0, r5
	add sp, sp, #0x84
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_0224284C: .word ov45_02254DC4
_02242850: .word ov45_02254DBC
_02242854: .word ov45_02255398
	arm_func_end ov45_0224268C

	arm_func_start ov45_02242858
ov45_02242858: ; 0x02242858
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #0x9c
	bl ov45_02236CB0
	add r0, r4, #0x9c
	bl ov45_02236E38
	add r0, r4, #0x90
	bl ov45_022425A0
	add r0, r4, #0x90
	bl ov45_02244150
	add r0, r4, #0x80
	bl ov45_02243A98
	add r0, r4, #0x70
	bl ov45_02244130
	add r0, r4, #0x48
	bl ov45_02237BC8
	add r0, r4, #0x3c
	bl ov45_02237BC8
	add r0, r4, #0x30
	bl ov45_02237BC8
	add r0, r4, #0x24
	bl ov45_02237BC8
	add r0, r4, #0x18
	bl ov45_02237BC8
	add r0, r4, #0xc
	bl ov45_02237BC8
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02242858

	arm_func_start ov45_022428C8
ov45_022428C8: ; 0x022428C8
	ldr ip, _022428D4 ; =ov45_022339F4
	add r1, r1, #0x48
	bx ip
	.balign 4, 0
_022428D4: .word ov45_022339F4
	arm_func_end ov45_022428C8

	arm_func_start ov45_022428D8
ov45_022428D8: ; 0x022428D8
	ldr r3, [r1, #0x48]
	mov r3, r3, lsl #0x1f
	movs r3, r3, lsr #0x1f
	ldrne r3, [r1, #0x4c]
	bne _022428F8
	ldrb r1, [r1, #0x48]
	mov r1, r1, lsl #0x18
	mov r3, r1, lsr #0x19
_022428F8:
	ldr ip, _0224290C ; =ov45_02236680
	mov r1, r2
	mov r2, r3
	mvn r3, #0
	bx ip
	.balign 4, 0
_0224290C: .word ov45_02236680
	arm_func_end ov45_022428D8

	arm_func_start ov45_02242910
ov45_02242910: ; 0x02242910
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sl, r0
	mov r6, #0
	str r6, [sl]
	mov r8, r2
	str r6, [sl, #4]
	cmp r8, #0
	mov sb, r1
	mov r7, r3
	addle sp, sp, #8
	str r6, [sl, #8]
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	sub r4, sp, #4
	mov r5, r6
	add fp, sp, #4
_02242950:
	ldr r0, [sb, #0x48]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	ldrne r1, [sb, #0x4c]
	bne _02242970
	ldrb r0, [sb, #0x48]
	mov r0, r0, lsl #0x18
	mov r1, r0, lsr #0x19
_02242970:
	ldr r0, [r7, r6, lsl #2]
	add r0, r0, r1
	str r0, [sp, #4]
	strb r5, [sp]
	ldr r1, [sl, #4]
	ldr r0, [sl, #8]
	cmp r1, r0
	bhs _022429B0
	mov r0, r1
	add r2, r0, #1
	str r2, [sl, #4]
	ldr r0, [sl]
	ldr r1, [sp, #4]
	add r0, r0, r2, lsl #2
	str r1, [r0, #-4]
	b _022429CC
_022429B0:
	strb r5, [sp, #1]
	and r0, r5, #0xff
	strb r0, [r4]
	ldr r2, [r4]
	mov r0, sl
	mov r1, fp
	bl ov45_0223E910
_022429CC:
	add r6, r6, #1
	cmp r6, r8
	blt _02242950
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov45_02242910

	arm_func_start ov45_022429E0
ov45_022429E0: ; 0x022429E0
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl ov00_021FF368
	ldr r1, _02242A24 ; =0x10624DD3
	mov r3, #0x3e8
	umull r1, ip, r0, r1
	mov ip, ip, lsr #6
	umull r1, r2, r3, ip
	sub ip, r0, r1
	ldr r2, _02242A28 ; =ov45_0225539C
	mov r0, r5
	mov r3, r4
	mov r1, #0x14
	str ip, [sp]
	bl ov45_02232B24
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02242A24: .word 0x10624DD3
_02242A28: .word ov45_0225539C
	arm_func_end ov45_022429E0

	arm_func_start ov45_02242A2C
ov45_02242A2C: ; 0x02242A2C
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x18
	ldr r1, _02242AC8 ; =ov45_022553A4
	mov r4, r0
	add r0, sp, #0
	bl ov45_02237B58
	add r0, sp, #0xc
	add r2, sp, #0
	mov r1, r4
	mov r3, #0
	bl ov45_0223F000
	add r0, sp, #0
	bl ov45_02237BC8
	ldr r0, [sp, #0x10]
	cmp r0, #2
	bhs _02242A80
	add r0, sp, #0xc
	bl ov45_02237664
	add sp, sp, #0x18
	mvn r0, #0
	ldmia sp!, {r4, pc}
_02242A80:
	ldr r1, [sp, #0xc]
	ldr r0, [r1, #0xc]
	mov r0, r0, lsl #0x1f
	movs r0, r0, lsr #0x1f
	addeq r0, r1, #0xd
	ldrne r0, [r1, #0x14]
	bl atoi
	movs r4, r0
	add r0, sp, #0xc
	bne _02242AB8
	bl ov45_02237664
	add sp, sp, #0x18
	mvn r0, #0
	ldmia sp!, {r4, pc}
_02242AB8:
	bl ov45_02237664
	mov r0, r4
	add sp, sp, #0x18
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02242AC8: .word ov45_022553A4
	arm_func_end ov45_02242A2C

	arm_func_start ov45_02242ACC
ov45_02242ACC: ; 0x02242ACC
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xb4
	mov r4, r0
	add r0, sp, #0xa8
	mov r6, r2
	mov r5, r3
	bl ov45_02237A24
	add r1, sp, #0x80
	mov r2, #0
	add r0, r1, #4
	add ip, sp, #0x90
	str r0, [r1, #8]
	str r2, [sp, #0x7c]
	str r2, [r1]
	str r2, [r1, #4]
	str r5, [sp, #0x8c]
	ldmia r6!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia r6, {r0, r1}
	stmia ip, {r0, r1}
	add r0, sp, #0x44
	add r1, sp, #0xa8
	add r2, sp, #0x7c
	bl ov45_02242BE0
	mov r1, #0
	strb r1, [sp]
	add r0, sp, #0xc
	add r1, sp, #0x44
	bl ov45_02237A24
	add r6, sp, #0x50
	mov r1, #0
	ldr r0, [r6]
	add r5, sp, #0x18
	stmia r5, {r0, r1}
	add r0, r5, #8
	str r0, [r5, #0xc]
	strb r1, [sp, #1]
	str r1, [r5, #8]
	add r0, r5, #4
	add r1, r6, #4
	bl ov45_02243BC0
	ldr r0, [r6, #0x10]
	add lr, r6, #0x14
	str r0, [r5, #0x10]
	add ip, r5, #0x14
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1}
	stmia ip, {r0, r1}
	add r1, r4, #0x80
	add r0, sp, #4
	add r2, sp, #0xc
	bl ov45_02243840
	add r0, sp, #0x1c
	ldrb r4, [sp, #8]
	bl ov45_02243F1C
	add r0, sp, #0xc
	bl ov45_02237BC8
	add r0, sp, #0x54
	bl ov45_02243F1C
	add r0, sp, #0x44
	bl ov45_02237BC8
	add r0, sp, #0x80
	bl ov45_02243F1C
	add r0, sp, #0xa8
	bl ov45_02237BC8
	mov r0, r4
	add sp, sp, #0xb4
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov45_02242ACC

	arm_func_start ov45_02242BE0
ov45_02242BE0: ; 0x02242BE0
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r2
	mov r5, r0
	bl ov45_02237A24
	ldr r1, [r4]
	mov r0, #0
	str r1, [r5, #0xc]
	str r0, [r5, #0x10]
	str r0, [r5, #0x14]
	add r0, r5, #0x14
	str r0, [r5, #0x18]
	add r0, r5, #0x10
	add r1, r4, #4
	bl ov45_02243BC0
	ldr r0, [r4, #0x10]
	add lr, r4, #0x14
	str r0, [r5, #0x1c]
	add ip, r5, #0x20
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1}
	stmia ip, {r0, r1}
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02242BE0

	arm_func_start ov45_02242C3C
ov45_02242C3C: ; 0x02242C3C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r2, r1
	add r0, sp, #0
	add r1, r4, #0x80
	bl ov45_02242C74
	ldr r1, [sp]
	add r0, r4, #0x84
	cmp r1, r0
	moveq r0, #0
	addne r0, r1, #0x2c
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_02242C3C

	arm_func_start ov45_02242C74
ov45_02242C74: ; 0x02242C74
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r1
	mov r5, r2
	mov r7, r0
	ldr r2, [r6, #4]
	mov r0, r6
	mov r1, r5
	add r3, r6, #4
	bl ov45_02242CDC
	mov r4, r0
	add r0, r6, #4
	cmp r4, r0
	beq _02242CC8
	mov r0, r5
	add r1, r4, #0xc
	bl ov45_02237F7C
	cmp r0, #0
	movlt r0, #1
	movge r0, #0
	cmp r0, #0
	beq _02242CD4
_02242CC8:
	add r0, r6, #4
	str r0, [r7]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02242CD4:
	str r4, [r7]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_02242C74

	arm_func_start ov45_02242CDC
ov45_02242CDC: ; 0x02242CDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r7, r2
	mov r8, r1
	mov r6, r3
	beq _02242D28
	mov r4, #0
	mov r5, #1
_02242CF8:
	mov r1, r8
	add r0, r7, #0xc
	bl ov45_02237F7C
	cmp r0, #0
	movlt r0, r5
	movge r0, r4
	cmp r0, #0
	moveq r6, r7
	ldreq r7, [r7]
	ldrne r7, [r7, #4]
	cmp r7, #0
	bne _02242CF8
_02242D28:
	mov r0, r6
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov45_02242CDC

	arm_func_start ov45_02242D30
ov45_02242D30: ; 0x02242D30
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x14
	mov r5, r1
	mov r6, r0
	mov r0, r5
	mov r4, r2
	bl ov45_02242A2C
	mvn r1, #0
	str r0, [sp, #0x10]
	cmp r0, r1
	addeq sp, sp, #0x14
	moveq r0, r1
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	add r0, sp, #0xc
	mov r2, r4
	add r1, r6, #0x80
	bl ov45_02242C74
	ldr r1, [sp, #0xc]
	add r0, r6, #0x84
	cmp r1, r0
	addeq sp, sp, #0x14
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	add r0, sp, #4
	add r2, sp, #0x10
	add r1, r1, #0x1c
	bl ov45_02243AB8
	mov r2, #0
	add r1, sp, #0x10
	add r0, r6, #0x70
	strb r2, [sp, #1]
	strb r2, [sp]
	bl ov45_02242DCC
	mov r1, r5
	add r0, r0, #4
	bl ov45_02237D48
	ldr r0, [sp, #0x10]
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov45_02242D30

	arm_func_start ov45_02242DCC
ov45_02242DCC: ; 0x02242DCC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x28
	add r4, sp, #4
	add r2, sp, #8
	add r3, sp, #5
	str r4, [sp]
	mov r6, r0
	mov r5, r1
	bl ov45_02242E88
	ldr r2, [sp, #8]
	mov r4, r0
	cmp r2, #0
	beq _02242E10
	ldr r1, [r2, #0xc]
	ldr r0, [r5]
	cmp r1, r0
	bge _02242E7C
_02242E10:
	mov r2, #0
	add r1, sp, #0x1c
	mov r0, r2
_02242E1C:
	str r0, [r1, r2, lsl #2]
	add r2, r2, #1
	cmp r2, #3
	blo _02242E1C
	ldr r2, [r5]
	add r0, sp, #0x10
	add r1, sp, #0x1c
	str r2, [sp, #0xc]
	bl ov45_02237A24
	add r1, sp, #0xc
	str r1, [sp]
	ldrb r2, [sp, #5]
	ldrb r3, [sp, #4]
	mov r0, r6
	mov r1, r4
	bl ov45_0224404C
	mov r4, r0
	add r0, sp, #0x10
	bl ov45_02237BC8
	add r0, sp, #0x1c
	bl ov45_02237BC8
	add sp, sp, #0x28
	add r0, r4, #0xc
	ldmia sp!, {r4, r5, r6, pc}
_02242E7C:
	add r0, r2, #0xc
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_02242DCC

	arm_func_start ov45_02242E88
ov45_02242E88: ; 0x02242E88
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	str r4, [r2]
	ldr r6, [r0, #4]
	mov r4, #1
	ldr r7, [sp, #0x18]
	strb r4, [r3]
	strb r4, [r7]
	cmp r6, #0
	add r0, r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov ip, #0
	mov lr, r4
_02242EBC:
	ldr r5, [r1]
	ldr r4, [r6, #0xc]
	mov r0, r6
	cmp r5, r4
	ldrlt r6, [r6]
	strltb lr, [r3]
	blt _02242EE8
	str r6, [r2]
	ldr r6, [r6, #4]
	strb ip, [r3]
	strb ip, [r7]
_02242EE8:
	cmp r6, #0
	bne _02242EBC
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_02242E88

	arm_func_start ov45_02242EF4
ov45_02242EF4: ; 0x02242EF4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	mov sb, r1
	movs r1, r2
	ldr r1, [sp, #0x58]
	mov r4, #0
	mov sl, r0
	str r4, [sl]
	str r4, [sl, #4]
	str r2, [sp]
	mov r8, r3
	str r4, [sl, #8]
	str r1, [sp, #0x58]
	beq _02242F34
	mov r1, r2
	bl ov45_0223E830
_02242F34:
	ldr r0, [sp]
	mov r7, #0
	cmp r0, #0
	addle sp, sp, #0x34
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mvn r0, #0
	sub r4, sp, #4
	str r0, [sp, #4]
_02242F54:
	ldr r1, [r8, r7, lsl #2]
	add r0, sp, #0x28
	bl ov45_02237B58
	mov fp, #0
	ldr r6, [sb, #8]
	add r0, sp, #0x28
	mov r5, fp
	bl ov45_02242A2C
	cmp r0, r6
	bne _02242FB0
	ldr r6, [r8, r7, lsl #2]
	add r0, sp, #0x1c
	mov r1, sb
	bl ov45_0223FC5C
	mov r1, r6
	mov fp, #1
	add r0, sp, #0x1c
	bl ov45_02237FD8
	cmp r0, #0
	movne r0, fp
	moveq r0, r5
	cmp r0, #0
	movne r5, #1
_02242FB0:
	cmp fp, #0
	beq _02242FC0
	add r0, sp, #0x1c
	bl ov45_02237BC8
_02242FC0:
	add r0, sp, #0x28
	bl ov45_02237BC8
	cmp r5, #0
	bne _02243064
	ldr r1, [r8, r7, lsl #2]
	add r0, sp, #0x10
	bl ov45_02237B58
	ldr r2, [sp, #0x58]
	mov r0, sb
	add r1, sp, #0x10
	bl ov45_02242D30
	str r0, [sp, #0xc]
	add r0, sp, #0x10
	bl ov45_02237BC8
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #4]
	cmp r1, r0
	beq _02243064
	mov r0, #0
	strb r0, [sp, #8]
	ldr r1, [sl, #4]
	ldr r0, [sl, #8]
	cmp r1, r0
	bhs _02243040
	mov r0, r1
	add r2, r0, #1
	str r2, [sl, #4]
	ldr r0, [sl]
	ldr r1, [sp, #0xc]
	add r0, r0, r2, lsl #2
	str r1, [r0, #-4]
	b _02243064
_02243040:
	mov r0, #0
	mov r2, #0
	strb r0, [sp, #9]
	mov r2, r2
	strb r2, [r4]
	ldr r2, [r4]
	mov r0, sl
	add r1, sp, #0xc
	bl ov45_0223E910
_02243064:
	ldr r0, [sp]
	add r7, r7, #1
	cmp r7, r0
	blt _02242F54
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov45_02242EF4

	arm_func_start ov45_0224307C
ov45_0224307C: ; 0x0224307C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	ldr r1, [sp, #0x34]
	mov r7, r0
	str r1, [sp, #4]
	ldr r0, [r7, #0x8c]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	add r6, r7, #0x84
	add r5, sp, #4
	add r8, sp, #0
	add r4, sp, #0xc
	b _022430BC
_022430B4:
	mov r0, r4
	bl ov45_02236E58
_022430BC:
	ldr sb, [sp, #0xc]
	cmp sb, r6
	beq _022430E8
	mov r0, r8
	mov r2, r5
	add r1, sb, #0x1c
	bl ov45_02243128
	ldr r1, [sp]
	add r0, sb, #0x20
	cmp r1, r0
	beq _022430B4
_022430E8:
	ldr r1, [sp, #0xc]
	add r0, r7, #0x84
	cmp r1, r0
	addne sp, sp, #0x10
	movne r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	addne sp, sp, #0x10
	bxne lr
	add r1, sp, #0x34
	add r0, r7, #0x70
	bl ov45_022431AC
	mov r0, #1
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_0224307C

	arm_func_start ov45_02243128
ov45_02243128: ; 0x02243128
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	ldr r2, [r5, #4]
	mov r0, r5
	mov r1, r4
	add r3, r5, #4
	bl ov45_0224317C
	add r1, r5, #4
	cmp r0, r1
	beq _02243168
	ldr r2, [r4]
	ldr r1, [r0, #0xc]
	cmp r2, r1
	bge _02243174
_02243168:
	add r0, r5, #4
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
_02243174:
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_02243128

	arm_func_start ov45_0224317C
ov45_0224317C: ; 0x0224317C
	cmp r2, #0
	beq _022431A4
	ldr r1, [r1]
_02243188:
	ldr r0, [r2, #0xc]
	cmp r0, r1
	movge r3, r2
	ldrge r2, [r2]
	ldrlt r2, [r2, #4]
	cmp r2, #0
	bne _02243188
_022431A4:
	mov r0, r3
	bx lr
	arm_func_end ov45_0224317C

	arm_func_start ov45_022431AC
ov45_022431AC: ; 0x022431AC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r2, r1
	add r0, sp, #8
	mov r1, r4
	bl ov45_022431FC
	ldr r2, [sp, #8]
	add r0, r4, #4
	cmp r2, r0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	add r0, sp, #4
	mov r1, r4
	str r2, [sp]
	bl ov45_02243FD4
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_022431AC

	arm_func_start ov45_022431FC
ov45_022431FC: ; 0x022431FC
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	mov r4, r2
	mov r6, r0
	ldr r2, [r5, #4]
	mov r0, r5
	mov r1, r4
	add r3, r5, #4
	bl ov45_02243250
	add r1, r5, #4
	cmp r0, r1
	beq _0224323C
	ldr r2, [r4]
	ldr r1, [r0, #0xc]
	cmp r2, r1
	bge _02243248
_0224323C:
	add r0, r5, #4
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
_02243248:
	str r0, [r6]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_022431FC

	arm_func_start ov45_02243250
ov45_02243250: ; 0x02243250
	cmp r2, #0
	beq _02243278
	ldr r1, [r1]
_0224325C:
	ldr r0, [r2, #0xc]
	cmp r0, r1
	movge r3, r2
	ldrge r2, [r2]
	ldrlt r2, [r2, #4]
	cmp r2, #0
	bne _0224325C
_02243278:
	mov r0, r3
	bx lr
	arm_func_end ov45_02243250

	arm_func_start ov45_02243280
ov45_02243280: ; 0x02243280
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r0, r1
	mov r4, r2
	bl ov45_02242A2C
	mvn r1, #0
	str r0, [sp, #4]
	cmp r0, r1
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, sp, #0
	mov r2, r4
	add r1, r5, #0x80
	bl ov45_02242C74
	ldr r2, [sp]
	add r0, r5, #0x84
	cmp r2, r0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	add r1, sp, #4
	add r0, r2, #0x1c
	bl ov45_0224330C
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [sp, #4]
	mov r0, r5
	bl ov45_0224307C
	mov r0, #1
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02243280

	arm_func_start ov45_0224330C
ov45_0224330C: ; 0x0224330C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r2, r1
	add r0, sp, #8
	mov r1, r4
	bl ov45_02243128
	ldr r2, [sp, #8]
	add r0, r4, #4
	cmp r2, r0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	add r0, sp, #4
	mov r1, r4
	str r2, [sp]
	bl ov45_02243B50
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_0224330C

	arm_func_start ov45_0224335C
ov45_0224335C: ; 0x0224335C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x64
	mov r5, r0
	mov r4, r1
	add r0, sp, #0x3c
	mov r2, r4
	add r1, r5, #0x80
	bl ov45_02242C74
	ldr r1, [sp, #0x3c]
	add r0, r5, #0x84
	cmp r1, r0
	addeq sp, sp, #0x64
	mov r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	str r0, [sp, #0x58]
	str r0, [sp, #0x5c]
	str r0, [sp, #0x60]
	ldr r2, [r1, #0x24]
	add ip, r1, #0x20
	strb r0, [sp, #9]
	strb r0, [sp, #0xa]
	strb r0, [sp, #8]
	strb r0, [sp, #4]
	sub r1, sp, #4
	ldr r0, [sp, #0x20]
	str ip, [r1]
	str r0, [r1, #4]
	ldr r3, [r1]
	add r0, sp, #0x58
	add r1, sp, #0x14
	str r2, [sp, #0x14]
	str ip, [sp, #0x34]
	str ip, [sp, #0x24]
	str r2, [sp, #0x38]
	str r2, [sp, #0x28]
	str ip, [sp, #0x1c]
	ldmia r1, {r1, r2}
	bl ov45_022434C0
	mov r1, r4
	add r0, r5, #0x80
	bl ov45_022435A8
	ldr r0, _022434BC ; =ov45_02255358
	ldr r4, [sp, #0x58]
	ldr lr, [r0, #8]
	ldr r2, [r0, #0xc]
	ldr r0, [sp, #0x5c]
	add r1, sp, #0x4c
	add r3, r4, r0, lsl #2
	add ip, sp, #0x40
	str lr, [sp, #0x4c]
	str r5, [sp, #0x54]
	str r2, [sp, #0x50]
	ldmia r1, {r0, r1, r2}
	stmia ip, {r0, r1, r2}
	cmp r4, r3
	movne r0, #1
	moveq r0, #0
	str r3, [sp, #0x2c]
	str r3, [sp, #0xc]
	str r4, [sp, #0x30]
	str r4, [sp, #0x10]
	cmp r0, #0
	beq _022434A8
	cmp r0, #0
	add r6, sp, #0x40
	beq _022434A8
	ldr r5, [sp, #0x10]
	ldr r4, [sp, #0xc]
_0224346C:
	ldr r1, [sp, #0x44]
	ldr r0, [sp, #0x48]
	tst r1, #1
	add r0, r0, r1, asr #1
	ldr r1, [r5]
	ldreq r2, [r6]
	beq _02243494
	ldr r3, [r0]
	ldr r2, [r6]
	ldr r2, [r3, r2]
_02243494:
	blx r2
	add r5, r5, #4
	cmp r5, r4
	bne _0224346C
	str r5, [sp, #0x10]
_022434A8:
	add r0, sp, #0x58
	bl ov45_022376BC
	mov r0, #1
	add sp, sp, #0x64
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_022434BC: .word ov45_02255358
	arm_func_end ov45_0224335C

	arm_func_start ov45_022434C0
ov45_022434C0: ; 0x022434C0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x20
	ldr r2, [sp, #0x4c]
	ldr r1, [sp, #0x50]
	ldr r4, [sp, #0x54]
	mov sl, r0
	str r2, [sp, #0x18]
	str r1, [sp, #0x1c]
	cmp r2, r4
	add r5, sp, #0x18
	mov r8, #0
	beq _0224350C
_022434F4:
	mov r0, r5
	add r8, r8, #1
	bl ov45_02236E58
	ldr r0, [sp, #0x18]
	cmp r0, r4
	bne _022434F4
_0224350C:
	ldr r1, [sl, #8]
	cmp r8, r1
	bls _0224353C
	mov r2, #0
	mov r0, sl
	sub r1, r8, r1
	strb r2, [sp, #1]
	bl ov45_0223EA34
	mov r2, r0
	mov r0, sl
	mov r1, r8
	bl ov45_022421E4
_0224353C:
	ldr sb, [sl]
	ldr r1, [sp, #0x4c]
	ldr r0, [sp, #0x50]
	ldr r7, [sp, #0x54]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	cmp r1, r7
	add fp, sp, #0x10
	beq _02243594
	mov r5, #0
_02243564:
	ldr r6, [sp, #0x10]
	strb r5, [sp]
	ldr r4, [r6, #0xc]
	mov r0, fp
	str r4, [sb], #4
	bl ov45_02236E58
	ldr r0, [sp, #0x10]
	cmp r0, r7
	bne _02243564
	str r4, [sp, #8]
	str r6, [sp, #4]
	str r6, [sp, #0xc]
_02243594:
	str r8, [sl, #4]
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_022434C0

	arm_func_start ov45_022435A8
ov45_022435A8: ; 0x022435A8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov r2, r1
	add r0, sp, #8
	mov r1, r4
	bl ov45_02242C74
	ldr r2, [sp, #8]
	add r0, r4, #4
	cmp r2, r0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r3, r4, pc}
	add r0, sp, #4
	mov r1, r4
	str r2, [sp]
	bl ov45_022438F0
	mov r0, #1
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_022435A8

	arm_func_start ov45_022435F8
ov45_022435F8: ; 0x022435F8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r4, r1
	mov r5, r0
	mov r0, r4
	bl ov45_02242A2C
	mvn r1, #0
	str r0, [sp, #4]
	cmp r0, r1
	addeq sp, sp, #8
	moveq r0, r1
	ldmeqia sp!, {r3, r4, r5, pc}
	add r0, sp, #0
	add r2, sp, #4
	add r1, r5, #0x70
	bl ov45_022431FC
	ldr r2, [sp]
	add r0, r5, #0x74
	cmp r2, r0
	addeq sp, sp, #8
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r4
	add r0, r2, #0x10
	bl ov45_022340F8
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	cmp r0, #0
	mvnne r0, #0
	ldreq r0, [sp, #4]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_022435F8

	arm_func_start ov45_0224367C
ov45_0224367C: ; 0x0224367C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	add r0, sp, #0
	add r2, sp, #0x18
	add r1, r4, #0x70
	bl ov45_022431FC
	ldr r1, [sp]
	add r0, r4, #0x74
	cmp r1, r0
	bne _022436C4
	ldr r1, _022436DC ; =ov45_022553A8
	mov r0, r5
	bl ov45_02237B58
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_022436C4:
	mov r0, r5
	add r1, r1, #0x10
	bl ov45_02237A24
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_022436DC: .word ov45_022553A8
	arm_func_end ov45_0224367C

	arm_func_start ov45_022436E0
ov45_022436E0: ; 0x022436E0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x3c
	mov r5, r0
	mov r4, r2
	bl ov45_022435F8
	str r0, [sp, #0xc]
	add r1, sp, #0xc
	add r0, r5, #0x70
	bl ov45_022431AC
	add r0, sp, #0x30
	mov r1, r4
	bl ov45_02237A24
	ldr r1, [sp, #0xc]
	add r0, sp, #0x20
	add r2, sp, #0x30
	bl ov45_02243780
	mov r0, #0
	ldr r1, [sp, #0x20]
	strb r0, [sp]
	strb r0, [sp, #1]
	str r1, [sp, #0x10]
	add r0, sp, #0x14
	add r1, sp, #0x24
	bl ov45_02237A24
	add r1, r5, #0x70
	add r0, sp, #4
	add r2, sp, #0x10
	bl ov45_02243F3C
	ldrb r4, [sp, #8]
	add r0, sp, #0x14
	bl ov45_02237BC8
	add r0, sp, #0x24
	bl ov45_02237BC8
	add r0, sp, #0x30
	bl ov45_02237BC8
	cmp r4, #0
	ldrne r0, [sp, #0xc]
	mvneq r0, #0
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, pc}
	arm_func_end ov45_022436E0

	arm_func_start ov45_02243780
ov45_02243780: ; 0x02243780
	ldr ip, _02243790 ; =ov45_02237A24
	str r1, [r0], #4
	mov r1, r2
	bx ip
	.balign 4, 0
_02243790: .word ov45_02237A24
	arm_func_end ov45_02243780

	arm_func_start ov45_02243794
ov45_02243794: ; 0x02243794
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r2, r1
	add r0, sp, #0
	add r1, r4, #0x80
	bl ov45_02242C74
	ldr r1, [sp]
	add r0, r4, #0x84
	cmp r1, r0
	moveq r0, #0
	ldrne r0, [r1, #0x18]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_02243794

	arm_func_start ov45_022437CC
ov45_022437CC: ; 0x022437CC
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r2, r1
	add r0, sp, #0
	add r1, r4, #0x80
	bl ov45_02242C74
	ldr r1, [sp]
	add r0, r4, #0x84
	cmp r1, r0
	moveq r0, #0
	movne r0, #1
	strne r0, [r1, #0x18]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_022437CC

	arm_func_start ov45_02243808
ov45_02243808: ; 0x02243808
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov r2, r1
	add r0, sp, #0
	add r1, r4, #0x80
	bl ov45_02242C74
	ldr r1, [sp]
	add r0, r4, #0x84
	cmp r1, r0
	mvneq r0, #0
	ldrne r0, [r1, #0x28]
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_02243808

	arm_func_start ov45_02243840
ov45_02243840: ; 0x02243840
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	add ip, sp, #4
	mov r6, r2
	mov r7, r1
	mov r4, r0
	add r2, sp, #8
	add r3, sp, #5
	mov r0, r7
	mov r1, r6
	str ip, [sp]
	bl ov45_02244170
	ldr r2, [sp, #8]
	mov r5, r0
	cmp r2, #0
	beq _022438A0
	mov r1, r6
	add r0, r2, #0xc
	bl ov45_02237F7C
	cmp r0, #0
	movlt r0, #1
	movge r0, #0
	cmp r0, #0
	beq _022438D0
_022438A0:
	str r6, [sp]
	ldrb r2, [sp, #5]
	ldrb r3, [sp, #4]
	mov r0, r7
	mov r1, r5
	bl ov45_02243970
	ldr r1, _022438EC ; =ov45_02255358
	str r0, [r4]
	ldrb r0, [r1, #4]
	add sp, sp, #0xc
	strb r0, [r4, #4]
	ldmia sp!, {r4, r5, r6, r7, pc}
_022438D0:
	ldr r1, [sp, #8]
	ldr r0, _022438EC ; =ov45_02255358
	str r1, [r4]
	ldrb r0, [r0, #5]
	strb r0, [r4, #4]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_022438EC: .word ov45_02255358
	arm_func_end ov45_02243840

	arm_func_start ov45_022438F0
ov45_022438F0: ; 0x022438F0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [sp, #0x18]
	ldr r1, [r5, #0xc]
	mov r6, r0
	cmp r4, r1
	bne _02243920
	add r0, sp, #0x18
	bl ov45_02236E58
	ldr r0, [sp, #0x18]
	str r0, [r5, #0xc]
_02243920:
	ldr r1, [r5, #4]
	mov r0, r4
	bl ov45_022370D0
	str r0, [r6]
	add r0, r4, #0x1c
	bl ov45_02243F1C
	add r0, r4, #0xc
	bl ov45_02237BC8
	cmp r4, #0
	beq _02243958
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02243958:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_022438F0

	arm_func_start ov45_02243970
ov45_02243970: ; 0x02243970
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	mov sb, r0
	ldr r4, [sb]
	mvn r0, #0
	mov r8, r1
	mov r7, r2
	mov r6, r3
	cmp r4, r0
	ldr r5, [sp, #0x30]
	bne _022439A8
	ldr r0, _02243A94 ; =ov45_022553AC
	bl printf
	bl abort
_022439A8:
	mov r1, #0
	mov r0, #0x44
	strb r1, [sp, #1]
	bl ov45_02242394
	add r1, sb, #4
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r4, r0, #0xc
	beq _02243A28
	mov r0, r4
	mov r1, r5
	bl ov45_02237A24
	ldr r1, [r5, #0xc]
	mov r0, #0
	str r1, [r4, #0xc]
	str r0, [r4, #0x10]
	str r0, [r4, #0x14]
	add r0, r4, #0x14
	str r0, [r4, #0x18]
	add r0, r4, #0x10
	add r1, r5, #0x10
	bl ov45_02243BC0
	ldr r0, [r5, #0x1c]
	add r5, r5, #0x20
	str r0, [r4, #0x1c]
	add r4, r4, #0x20
	ldmia r5!, {r0, r1, r2, r3}
	stmia r4!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1}
	stmia r4, {r0, r1}
_02243A28:
	ldr r4, [sp, #0x10]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [sp, #0x10]
	str r0, [r4]
	adds r0, r4, #8
	strne r8, [r0]
	cmp r7, #0
	strne r4, [r8]
	streq r4, [r8, #4]
	ldr r1, [sb]
	mov r0, r4
	add r1, r1, #1
	str r1, [sb]
	ldr r1, [sb, #4]
	bl ov45_02236EC4
	cmp r6, #0
	ldr r1, [sp, #0x10]
	strne r4, [sb, #0xc]
	cmp r1, #0
	beq _02243A88
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
_02243A88:
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_02243A94: .word ov45_022553AC
	arm_func_end ov45_02243970

	arm_func_start ov45_02243A98
ov45_02243A98: ; 0x02243A98
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02243AB0
	bl ov45_022442D4
_02243AB0:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02243A98

	arm_func_start ov45_02243AB8
ov45_02243AB8: ; 0x02243AB8
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	add ip, sp, #4
	mov r5, r2
	mov r6, r1
	mov r4, r0
	add r2, sp, #8
	add r3, sp, #5
	mov r0, r6
	mov r1, r5
	str ip, [sp]
	bl ov45_022441FC
	ldr r3, [sp, #8]
	mov r1, r0
	cmp r3, #0
	beq _02243B08
	ldr r2, [r3, #0xc]
	ldr r0, [r5]
	cmp r2, r0
	bge _02243B34
_02243B08:
	str r5, [sp]
	ldrb r2, [sp, #5]
	ldrb r3, [sp, #4]
	mov r0, r6
	bl ov45_02243E44
	ldr r1, _02243B4C ; =ov45_02255358
	str r0, [r4]
	ldrb r0, [r1, #3]
	add sp, sp, #0xc
	strb r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, pc}
_02243B34:
	ldr r0, _02243B4C ; =ov45_02255358
	str r3, [r4]
	ldrb r0, [r0, #7]
	strb r0, [r4, #4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_02243B4C: .word ov45_02255358
	arm_func_end ov45_02243AB8

	arm_func_start ov45_02243B50
ov45_02243B50: ; 0x02243B50
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [sp, #0x18]
	ldr r1, [r5, #8]
	mov r6, r0
	cmp r4, r1
	bne _02243B80
	add r0, sp, #0x18
	bl ov45_02236E58
	ldr r0, [sp, #0x18]
	str r0, [r5, #8]
_02243B80:
	ldr r1, [r5, #4]
	mov r0, r4
	bl ov45_022370D0
	str r0, [r6]
	cmp r4, #0
	beq _02243BA8
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02243BA8:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02243B50

	arm_func_start ov45_02243BC0
ov45_02243BC0: ; 0x02243BC0
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	mov r4, r1
	ldr r1, [r4, #4]
	mov r5, r0
	cmp r1, #0
	addeq sp, sp, #0x20
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, #0
	mov r0, #0x10
	strb r1, [sp, #1]
	bl ov45_02242394
	add r1, r5, #4
	str r1, [sp, #0xc]
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r0, [sp, #0x10]
	adds r1, r0, #0xc
	ldr r0, [r4, #4]
	add r2, sp, #0x18
	ldrne r0, [r0, #0xc]
	mov r3, #0
	strne r0, [r1]
	ldr r1, [sp, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	str r2, [sp, #0x1c]
	str r3, [r1, #4]
	str r3, [r1]
	ldr r0, [r1, #8]
	and r0, r0, #1
	orr r0, r2, r0
	str r0, [r1, #8]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x10]
	ldr r0, [r0, #8]
	tst r0, #1
	movne r3, #1
	cmp r3, #0
	ldr r0, [r1, #8]
	mov r3, #0
	orrne r0, r0, #1
	biceq r0, r0, #1
	str r0, [r1, #8]
	ldr r1, [sp, #0x10]
	mov r0, #1
	str r1, [sp, #0x18]
	str r0, [sp, #0x14]
	str r1, [sp, #0x1c]
	ldr r2, [r4, #4]
	str r3, [sp, #0x10]
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _02243CA0
	add r0, sp, #0x14
	bl ov45_02243CF8
_02243CA0:
	ldr r2, [r4, #4]
	ldr r0, [r2]
	cmp r0, #0
	beq _02243CC0
	ldr r1, [sp, #0x18]
	add r0, sp, #0x14
	mov r3, #1
	bl ov45_02243CF8
_02243CC0:
	add r1, sp, #0x14
	mov r0, r5
	bl ov45_02244350
	add r0, sp, #0x14
	bl ov45_02244330
	ldr r1, [sp, #0x10]
	cmp r1, #0
	addeq sp, sp, #0x20
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02243BC0

	arm_func_start ov45_02243CF8
ov45_02243CF8: ; 0x02243CF8
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov ip, #0
	mov r0, #0x10
	mov r6, r1
	mov r5, r2
	mov r4, r3
	strb ip, [sp]
	bl ov45_02242394
	mov r1, #0
	str r1, [r0, #4]
	str r1, [r0]
	ldr r1, [r0, #8]
	add r2, r7, #4
	and r1, r1, #1
	orr r1, r6, r1
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	str r1, [r0, #8]
	cmp r4, #0
	beq _02243D88
	adds r1, r0, #0xc
	ldr r0, [r5]
	ldrne r0, [r0, #0xc]
	strne r0, [r1]
	ldr r1, [sp, #0x10]
	mov r0, #0
	str r1, [r7, #8]
	str r1, [r6]
	mov r6, r1
	str r0, [sp, #0x10]
	ldr r5, [r5]
	b _02243DB0
_02243D88:
	adds r1, r0, #0xc
	ldr r0, [r5, #4]
	ldrne r0, [r0, #0xc]
	strne r0, [r1]
	ldr r1, [sp, #0x10]
	mov r0, #0
	str r1, [r6, #4]
	ldr r5, [r5, #4]
	mov r6, r1
	str r0, [sp, #0x10]
_02243DB0:
	ldr r0, [r5, #8]
	tst r0, #1
	movne r0, #1
	moveq r0, #0
	cmp r0, #0
	ldr r0, [r6, #8]
	orrne r0, r0, #1
	biceq r0, r0, #1
	str r0, [r6, #8]
	ldr r0, [r7]
	add r0, r0, #1
	str r0, [r7]
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _02243E00
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, #0
	bl ov45_02243CF8
_02243E00:
	ldr r0, [r5]
	cmp r0, #0
	beq _02243E20
	mov r0, r7
	mov r1, r6
	mov r2, r5
	mov r3, #1
	bl ov45_02243CF8
_02243E20:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	addeq sp, sp, #0x14
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	arm_func_end ov45_02243CF8

	arm_func_start ov45_02243E44
ov45_02243E44: ; 0x02243E44
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r8, r0
	ldr r4, [r8]
	mvn r0, #0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp r4, r0
	bne _02243E78
	ldr r0, _02243F18 ; =ov45_022553AC
	bl printf
	bl abort
_02243E78:
	mov r1, #0
	mov r0, #0x10
	strb r1, [sp]
	bl ov45_02242394
	mov r4, r0
	add r0, r8, #4
	str r0, [sp, #0xc]
	adds r1, r4, #0xc
	ldrne r0, [sp, #0x30]
	str r4, [sp, #0x10]
	ldrne r0, [r0]
	str r4, [sp, #4]
	strne r0, [r1]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [sp, #0x10]
	str r0, [r4]
	adds r0, r4, #8
	strne r7, [r0]
	cmp r6, #0
	strne r4, [r7]
	streq r4, [r7, #4]
	ldr r1, [r8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r8]
	ldr r1, [r8, #4]
	str r4, [sp, #8]
	bl ov45_02236EC4
	cmp r5, #0
	ldr r1, [sp, #0x10]
	strne r4, [r8, #8]
	cmp r1, #0
	beq _02243F0C
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
_02243F0C:
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02243F18: .word ov45_022553AC
	arm_func_end ov45_02243E44

	arm_func_start ov45_02243F1C
ov45_02243F1C: ; 0x02243F1C
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02243F34
	bl ov45_022443DC
_02243F34:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02243F1C

	arm_func_start ov45_02243F3C
ov45_02243F3C: ; 0x02243F3C
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	add ip, sp, #4
	mov r5, r2
	mov r6, r1
	mov r4, r0
	add r2, sp, #8
	add r3, sp, #5
	mov r0, r6
	mov r1, r5
	str ip, [sp]
	bl ov45_02244268
	ldr r3, [sp, #8]
	mov r1, r0
	cmp r3, #0
	beq _02243F8C
	ldr r2, [r3, #0xc]
	ldr r0, [r5]
	cmp r2, r0
	bge _02243FB8
_02243F8C:
	str r5, [sp]
	ldrb r2, [sp, #5]
	ldrb r3, [sp, #4]
	mov r0, r6
	bl ov45_0224404C
	ldr r1, _02243FD0 ; =ov45_02255358
	str r0, [r4]
	ldrb r0, [r1]
	add sp, sp, #0xc
	strb r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, r6, pc}
_02243FB8:
	ldr r0, _02243FD0 ; =ov45_02255358
	str r3, [r4]
	ldrb r0, [r0, #1]
	strb r0, [r4, #4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_02243FD0: .word ov45_02255358
	arm_func_end ov45_02243F3C

	arm_func_start ov45_02243FD4
ov45_02243FD4: ; 0x02243FD4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r4, [sp, #0x18]
	ldr r1, [r5, #0xc]
	mov r6, r0
	cmp r4, r1
	bne _02244004
	add r0, sp, #0x18
	bl ov45_02236E58
	ldr r0, [sp, #0x18]
	str r0, [r5, #0xc]
_02244004:
	ldr r1, [r5, #4]
	mov r0, r4
	bl ov45_022370D0
	str r0, [r6]
	add r0, r4, #0x10
	bl ov45_02237BC8
	cmp r4, #0
	beq _02244034
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
_02244034:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	ldmia sp!, {r4, r5, r6, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end ov45_02243FD4

	arm_func_start ov45_0224404C
ov45_0224404C: ; 0x0224404C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	mov r8, r0
	ldr r4, [r8]
	mvn r0, #0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	cmp r4, r0
	bne _02244080
	ldr r0, _0224412C ; =ov45_022553AC
	bl printf
	bl abort
_02244080:
	mov r1, #0
	mov r0, #0x1c
	strb r1, [sp]
	bl ov45_02242394
	add r1, r8, #4
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r3, r0, #0xc
	beq _022440C0
	ldr r1, [sp, #0x30]
	add r0, r3, #4
	ldr r2, [r1], #4
	str r2, [r3]
	bl ov45_02237A24
_022440C0:
	ldr r4, [sp, #0x10]
	mov r0, #0
	str r0, [r4, #4]
	str r0, [sp, #0x10]
	str r0, [r4]
	adds r0, r4, #8
	strne r7, [r0]
	cmp r6, #0
	strne r4, [r7]
	streq r4, [r7, #4]
	ldr r1, [r8]
	mov r0, r4
	add r1, r1, #1
	str r1, [r8]
	ldr r1, [r8, #4]
	bl ov45_02236EC4
	cmp r5, #0
	ldr r1, [sp, #0x10]
	strne r4, [r8, #0xc]
	cmp r1, #0
	beq _02244120
	mov r0, #0
	mov r2, r0
	bl ov00_021EC2EC
_02244120:
	mov r0, r4
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0224412C: .word ov45_022553AC
	arm_func_end ov45_0224404C

	arm_func_start ov45_02244130
ov45_02244130: ; 0x02244130
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02244148
	bl ov45_02244428
_02244148:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02244130

	arm_func_start ov45_02244150
ov45_02244150: ; 0x02244150
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02244168
	bl ov45_0224447C
_02244168:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02244150

	arm_func_start ov45_02244170
ov45_02244170: ; 0x02244170
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sb, r2
	mov r2, #0
	str r2, [sb]
	ldr r6, [r0, #4]
	mov r8, r3
	mov r2, #1
	ldr r7, [sp, #0x28]
	strb r2, [r8]
	mov sl, r1
	strb r2, [r7]
	cmp r6, #0
	add r5, r0, #4
	beq _022441F4
	mov fp, #0
	mov r4, r2
_022441B0:
	mov r0, sl
	add r1, r6, #0xc
	mov r5, r6
	bl ov45_02237F7C
	cmp r0, #0
	movlt r0, #1
	movge r0, #0
	cmp r0, #0
	ldrne r6, [r6]
	strneb r4, [r8]
	bne _022441EC
	str r6, [sb]
	ldr r6, [r6, #4]
	strb fp, [r8]
	strb fp, [r7]
_022441EC:
	cmp r6, #0
	bne _022441B0
_022441F4:
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end ov45_02244170

	arm_func_start ov45_022441FC
ov45_022441FC: ; 0x022441FC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	str r4, [r2]
	ldr r6, [r0, #4]
	mov r4, #1
	ldr r7, [sp, #0x18]
	strb r4, [r3]
	strb r4, [r7]
	cmp r6, #0
	add r0, r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov ip, #0
	mov lr, r4
_02244230:
	ldr r5, [r1]
	ldr r4, [r6, #0xc]
	mov r0, r6
	cmp r5, r4
	ldrlt r6, [r6]
	strltb lr, [r3]
	blt _0224425C
	str r6, [r2]
	ldr r6, [r6, #4]
	strb ip, [r3]
	strb ip, [r7]
_0224425C:
	cmp r6, #0
	bne _02244230
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_022441FC

	arm_func_start ov45_02244268
ov45_02244268: ; 0x02244268
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	str r4, [r2]
	ldr r6, [r0, #4]
	mov r4, #1
	ldr r7, [sp, #0x18]
	strb r4, [r3]
	strb r4, [r7]
	cmp r6, #0
	add r0, r0, #4
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov ip, #0
	mov lr, r4
_0224429C:
	ldr r5, [r1]
	ldr r4, [r6, #0xc]
	mov r0, r6
	cmp r5, r4
	ldrlt r6, [r6]
	strltb lr, [r3]
	blt _022442C8
	str r6, [r2]
	ldr r6, [r6, #4]
	strb ip, [r3]
	strb ip, [r7]
_022442C8:
	cmp r6, #0
	bne _0224429C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_02244268

	arm_func_start ov45_022442D4
ov45_022442D4: ; 0x022442D4
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r1, [r4]
	mov r5, r0
	cmp r1, #0
	beq _022442F0
	bl ov45_022442D4
_022442F0:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02244304
	mov r0, r5
	bl ov45_022442D4
_02244304:
	add r0, r4, #0x1c
	bl ov45_02243F1C
	add r0, r4, #0xc
	bl ov45_02237BC8
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_022442D4

	arm_func_start ov45_02244330
ov45_02244330: ; 0x02244330
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02244348
	bl ov45_022443DC
_02244348:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end ov45_02244330

	arm_func_start ov45_02244350
ov45_02244350: ; 0x02244350
	cmp r0, r1
	bxeq lr
	ldr r3, [r0]
	ldr r2, [r1]
	str r2, [r0]
	str r3, [r1]
	ldr r3, [r0, #4]
	ldr r2, [r1, #4]
	str r2, [r0, #4]
	str r3, [r1, #4]
	ldr r3, [r0, #8]
	ldr r2, [r1, #8]
	str r2, [r0, #8]
	str r3, [r1, #8]
	ldr ip, [r0, #4]
	cmp ip, #0
	addeq r2, r0, #4
	streq r2, [r0, #8]
	beq _022443B0
	ldr r2, [ip, #8]
	add r3, r0, #4
	and r0, r2, #1
	orr r0, r3, r0
	str r0, [ip, #8]
_022443B0:
	ldr r2, [r1, #4]
	cmp r2, #0
	addeq r0, r1, #4
	streq r0, [r1, #8]
	bxeq lr
	ldr r0, [r2, #8]
	add r1, r1, #4
	and r0, r0, #1
	orr r0, r1, r0
	str r0, [r2, #8]
	bx lr
	arm_func_end ov45_02244350

	arm_func_start ov45_022443DC
ov45_022443DC: ; 0x022443DC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r1, [r4]
	mov r5, r0
	cmp r1, #0
	beq _022443F8
	bl ov45_022443DC
_022443F8:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _0224440C
	mov r0, r5
	bl ov45_022443DC
_0224440C:
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_022443DC

	arm_func_start ov45_02244428
ov45_02244428: ; 0x02244428
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r1, [r4]
	mov r5, r0
	cmp r1, #0
	beq _02244444
	bl ov45_02244428
_02244444:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02244458
	mov r0, r5
	bl ov45_02244428
_02244458:
	add r0, r4, #0x10
	bl ov45_02237BC8
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_02244428

	arm_func_start ov45_0224447C
ov45_0224447C: ; 0x0224447C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r1, [r4]
	mov r5, r0
	cmp r1, #0
	beq _02244498
	bl ov45_0224447C
_02244498:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _022444AC
	mov r0, r5
	bl ov45_0224447C
_022444AC:
	cmp r4, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, #0
	mov r1, r4
	mov r2, r0
	bl ov00_021EC2EC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0224447C

	arm_func_start ov45_022444C8
ov45_022444C8: ; 0x022444C8
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _022444E8
	ldr r0, _022444F4 ; =ov45_02255458
	ldr r1, _022444F8 ; =ov45_02255468
	ldr r2, _022444FC ; =ov45_02255438
	mov r3, #0xa4
	bl __msl_assertion_failed
_022444E8:
	ldr r0, [r4, #0x14]
	bl ov00_021EC3D8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022444F4: .word ov45_02255458
_022444F8: .word ov45_02255468
_022444FC: .word ov45_02255438
	arm_func_end ov45_022444C8

	arm_func_start ov45_02244500
ov45_02244500: ; 0x02244500
	stmdb sp!, {r4, r5, r6, lr}
	movs r4, r0
	bne _02244520
	ldr r0, _02244B74 ; =ov45_02255458
	ldr r1, _02244B78 ; =ov45_02255468
	ldr r2, _02244B7C ; =ov45_022553F8
	mov r3, #0xab
	bl __msl_assertion_failed
_02244520:
	ldr r0, [r4]
	cmp r0, #0
	bge _02244540
	ldr r0, _02244B80 ; =ov45_02255478
	ldr r1, _02244B78 ; =ov45_02255468
	ldr r2, _02244B7C ; =ov45_022553F8
	mov r3, #0xab
	bl __msl_assertion_failed
_02244540:
	ldr r0, [r4]
	cmp r0, #0x20
	blt _02244560
	ldr r0, _02244B84 ; =ov45_02255488
	ldr r1, _02244B78 ; =ov45_02255468
	ldr r2, _02244B7C ; =ov45_022553F8
	mov r3, #0xab
	bl __msl_assertion_failed
_02244560:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02244580
	ldr r0, _02244B88 ; =ov45_022554A4
	ldr r1, _02244B78 ; =ov45_02255468
	ldr r2, _02244B7C ; =ov45_022553F8
	mov r3, #0xab
	bl __msl_assertion_failed
_02244580:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _022445A0
	ldr r0, _02244B8C ; =ov45_022554BC
	ldr r1, _02244B78 ; =ov45_02255468
	ldr r2, _02244B7C ; =ov45_022553F8
	mov r3, #0xab
	bl __msl_assertion_failed
_022445A0:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bge _022445C0
	ldr r0, _02244B90 ; =ov45_022554DC
	ldr r1, _02244B78 ; =ov45_02255468
	ldr r2, _02244B7C ; =ov45_022553F8
	mov r3, #0xab
	bl __msl_assertion_failed
_022445C0:
	ldr r0, [r4]
	cmp r0, #0x1f
	addls pc, pc, r0, lsl #2
	b _02244B54
_022445D0: ; jump table
	b _02244650 ; case 0
	b _02244660 ; case 1
	b _02244670 ; case 2
	b _02244688 ; case 3
	b _022446A0 ; case 4
	b _022446C0 ; case 5
	b _022446E0 ; case 6
	b _022446F8 ; case 7
	b _02244720 ; case 8
	b _02244740 ; case 9
	b _02244758 ; case 10
	b _02244770 ; case 11
	b _02244788 ; case 12
	b _02244798 ; case 13
	b _022447B0 ; case 14
	b _02244808 ; case 15
	b _02244818 ; case 16
	b _02244830 ; case 17
	b _02244848 ; case 18
	b _02244860 ; case 19
	b _022448AC ; case 20
	b _02244908 ; case 21
	b _02244928 ; case 22
	b _02244950 ; case 23
	b _02244968 ; case 24
	b _022449AC ; case 25
	b _022449F0 ; case 26
	b _02244A08 ; case 27
	b _02244A54 ; case 28
	b _02244A7C ; case 29
	b _02244ADC ; case 30
	b _02244B44 ; case 31
_02244650:
	ldr r0, [r4, #8]
	ldr r0, [r0]
	bl ov00_021EC3D8
	b _02244B68
_02244660:
	ldr r0, [r4, #8]
	ldr r0, [r0]
	bl ov00_021EC3D8
	b _02244B68
_02244670:
	ldr r5, [r4, #8]
	ldr r0, [r5]
	bl ov00_021EC3D8
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	b _02244B68
_02244688:
	ldr r5, [r4, #8]
	ldr r0, [r5]
	bl ov00_021EC3D8
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	b _02244B68
_022446A0:
	ldr r5, [r4, #8]
	ldr r0, [r5]
	bl ov00_021EC3D8
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	ldr r0, [r5, #8]
	bl ov00_021EC3D8
	b _02244B68
_022446C0:
	ldr r5, [r4, #8]
	ldr r0, [r5]
	bl ov00_021EC3D8
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	ldr r0, [r5, #8]
	bl ov00_021EC3D8
	b _02244B68
_022446E0:
	ldr r5, [r4, #8]
	ldr r0, [r5]
	bl ov00_021EC3D8
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	b _02244B68
_022446F8:
	ldr r5, [r4, #8]
	ldr r0, [r5]
	bl ov00_021EC3D8
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	ldr r0, [r5, #0xc]
	bl ov00_021EC3D8
	ldr r0, [r5, #0x10]
	bl ov00_021EC3D8
	b _02244B68
_02244720:
	ldr r5, [r4, #8]
	ldr r0, [r5]
	bl ov00_021EC3D8
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	ldr r0, [r5, #8]
	bl ov00_021EC3D8
	b _02244B68
_02244740:
	ldr r5, [r4, #8]
	ldr r0, [r5]
	bl ov00_021EC3D8
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	b _02244B68
_02244758:
	ldr r5, [r4, #8]
	ldr r0, [r5]
	bl ov00_021EC3D8
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	b _02244B68
_02244770:
	ldr r5, [r4, #8]
	ldr r0, [r5]
	bl ov00_021EC3D8
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	b _02244B68
_02244788:
	ldr r0, [r4, #8]
	ldr r0, [r0]
	bl ov00_021EC3D8
	b _02244B68
_02244798:
	ldr r5, [r4, #8]
	ldr r0, [r5, #8]
	bl ov00_021EC3D8
	ldr r0, [r5, #0xc]
	bl ov00_021EC3D8
	b _02244B68
_022447B0:
	ldr r6, [r4, #8]
	mov r5, #0
	ldr r0, [r6, #4]
	cmp r0, #0
	ble _022447EC
_022447C4:
	ldr r0, [r6, #8]
	ldr r0, [r0, r5, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r6, #0xc]
	ldr r0, [r0, r5, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r6, #4]
	add r5, r5, #1
	cmp r5, r0
	blt _022447C4
_022447EC:
	ldr r0, [r6, #8]
	bl ov00_021EC3D8
	ldr r0, [r6, #0xc]
	bl ov00_021EC3D8
	ldr r0, [r6, #0x10]
	bl ov00_021EC3D8
	b _02244B68
_02244808:
	ldr r0, [r4, #8]
	ldr r0, [r0, #8]
	bl ov00_021EC3D8
	b _02244B68
_02244818:
	ldr r5, [r4, #8]
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	ldr r0, [r5, #8]
	bl ov00_021EC3D8
	b _02244B68
_02244830:
	ldr r5, [r4, #8]
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	ldr r0, [r5, #8]
	bl ov00_021EC3D8
	b _02244B68
_02244848:
	ldr r5, [r4, #8]
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	ldr r0, [r5, #0xc]
	bl ov00_021EC3D8
	b _02244B68
_02244860:
	ldr r6, [r4, #8]
	ldr r0, [r6, #4]
	bl ov00_021EC3D8
	ldr r0, [r6, #8]
	mov r5, #0
	cmp r0, #0
	ble _02244898
_0224487C:
	ldr r0, [r6, #0xc]
	ldr r0, [r0, r5, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r6, #8]
	add r5, r5, #1
	cmp r5, r0
	blt _0224487C
_02244898:
	ldr r0, [r6, #0xc]
	bl ov00_021EC3D8
	ldr r0, [r6, #0x10]
	bl ov00_021EC3D8
	b _02244B68
_022448AC:
	ldr r6, [r4, #8]
	ldr r0, [r6, #4]
	bl ov00_021EC3D8
	ldr r0, [r6, #8]
	bl ov00_021EC3D8
	ldr r0, [r6, #0xc]
	bl ov00_021EC3D8
	ldr r0, [r6, #0x10]
	bl ov00_021EC3D8
	ldr r0, [r6, #0x14]
	mov r5, #0
	cmp r0, #0
	ble _022448FC
_022448E0:
	ldr r0, [r6, #0x18]
	ldr r0, [r0, r5, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r6, #0x14]
	add r5, r5, #1
	cmp r5, r0
	blt _022448E0
_022448FC:
	ldr r0, [r6, #0x18]
	bl ov00_021EC3D8
	b _02244B68
_02244908:
	ldr r5, [r4, #8]
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	ldr r0, [r5, #8]
	bl ov00_021EC3D8
	ldr r0, [r5, #0xc]
	bl ov00_021EC3D8
	b _02244B68
_02244928:
	ldr r5, [r4, #8]
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	ldr r0, [r5, #8]
	bl ov00_021EC3D8
	ldr r0, [r5, #0xc]
	bl ov00_021EC3D8
	ldr r0, [r5, #0x10]
	bl ov00_021EC3D8
	b _02244B68
_02244950:
	ldr r5, [r4, #8]
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	ldr r0, [r5, #8]
	bl ov00_021EC3D8
	b _02244B68
_02244968:
	ldr r6, [r4, #8]
	ldr r0, [r6, #4]
	bl ov00_021EC3D8
	ldr r0, [r6, #8]
	mov r5, #0
	cmp r0, #0
	ble _022449A0
_02244984:
	ldr r0, [r6, #0xc]
	ldr r0, [r0, r5, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r6, #8]
	add r5, r5, #1
	cmp r5, r0
	blt _02244984
_022449A0:
	ldr r0, [r6, #0xc]
	bl ov00_021EC3D8
	b _02244B68
_022449AC:
	ldr r6, [r4, #8]
	ldr r0, [r6, #4]
	bl ov00_021EC3D8
	ldr r0, [r6, #8]
	mov r5, #0
	cmp r0, #0
	ble _022449E4
_022449C8:
	ldr r0, [r6, #0xc]
	ldr r0, [r0, r5, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r6, #8]
	add r5, r5, #1
	cmp r5, r0
	blt _022449C8
_022449E4:
	ldr r0, [r6, #0xc]
	bl ov00_021EC3D8
	b _02244B68
_022449F0:
	ldr r5, [r4, #8]
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	ldr r0, [r5, #8]
	bl ov00_021EC3D8
	b _02244B68
_02244A08:
	ldr r6, [r4, #8]
	ldr r0, [r6]
	bl ov00_021EC3D8
	ldr r0, [r6, #4]
	mov r5, #0
	cmp r0, #0
	ble _02244A40
_02244A24:
	ldr r0, [r6, #8]
	ldr r0, [r0, r5, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r6, #4]
	add r5, r5, #1
	cmp r5, r0
	blt _02244A24
_02244A40:
	ldr r0, [r6, #8]
	bl ov00_021EC3D8
	ldr r0, [r6, #0xc]
	bl ov00_021EC3D8
	b _02244B68
_02244A54:
	ldr r5, [r4, #8]
	ldr r0, [r5]
	bl ov00_021EC3D8
	ldr r0, [r5, #4]
	bl ov00_021EC3D8
	ldr r0, [r5, #8]
	bl ov00_021EC3D8
	ldr r0, [r5, #0xc]
	bl ov00_021EC3D8
	b _02244B68
_02244A7C:
	ldr r6, [r4, #8]
	ldr r0, [r6, #4]
	bl ov00_021EC3D8
	ldr r0, [r6, #8]
	mov r5, #0
	cmp r0, #0
	ble _02244AC8
_02244A98:
	ldr r0, [r6, #0xc]
	ldr r0, [r0, r5, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r6, #0x10]
	cmp r0, #0
	beq _02244AB8
	ldr r0, [r0, r5, lsl #2]
	bl ov00_021EC3D8
_02244AB8:
	ldr r0, [r6, #8]
	add r5, r5, #1
	cmp r5, r0
	blt _02244A98
_02244AC8:
	ldr r0, [r6, #0xc]
	bl ov00_021EC3D8
	ldr r0, [r6, #0x10]
	bl ov00_021EC3D8
	b _02244B68
_02244ADC:
	ldr r6, [r4, #8]
	ldr r0, [r6, #4]
	bl ov00_021EC3D8
	ldr r0, [r6, #8]
	bl ov00_021EC3D8
	ldr r0, [r6, #0xc]
	mov r5, #0
	cmp r0, #0
	ble _02244B30
_02244B00:
	ldr r0, [r6, #0x10]
	ldr r0, [r0, r5, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r6, #0x14]
	cmp r0, #0
	beq _02244B20
	ldr r0, [r0, r5, lsl #2]
	bl ov00_021EC3D8
_02244B20:
	ldr r0, [r6, #0xc]
	add r5, r5, #1
	cmp r5, r0
	blt _02244B00
_02244B30:
	ldr r0, [r6, #0x10]
	bl ov00_021EC3D8
	ldr r0, [r6, #0x14]
	bl ov00_021EC3D8
	b _02244B68
_02244B44:
	ldr r0, [r4, #8]
	ldr r0, [r0, #4]
	bl ov00_021EC3D8
	b _02244B68
_02244B54:
	ldr r0, _02244B94 ; =ov45_022554EC
	ldr r1, _02244B78 ; =ov45_02255468
	ldr r2, _02244B7C ; =ov45_022553F8
	ldr r3, _02244B98 ; =0x000001E5
	bl __msl_assertion_failed
_02244B68:
	ldr r0, [r4, #8]
	bl ov00_021EC3D8
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02244B74: .word ov45_02255458
_02244B78: .word ov45_02255468
_02244B7C: .word ov45_022553F8
_02244B80: .word ov45_02255478
_02244B84: .word ov45_02255488
_02244B88: .word ov45_022554A4
_02244B8C: .word ov45_022554BC
_02244B90: .word ov45_022554DC
_02244B94: .word ov45_022554EC
_02244B98: .word 0x000001E5
	arm_func_end ov45_02244500

	arm_func_start ov45_02244B9C
ov45_02244B9C: ; 0x02244B9C
	stmdb sp!, {r4, lr}
	ldr r2, _02244BC8 ; =ov45_022444C8
	mov r4, r0
	mov r0, #0x18
	mov r1, #0x80
	bl ov00_021FE5B4
	str r0, [r4, #0x820]
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02244BC8: .word ov45_022444C8
	arm_func_end ov45_02244B9C

	arm_func_start ov45_02244BCC
ov45_02244BCC: ; 0x02244BCC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	bne _02244BEC
	ldr r0, _02244D04 ; =ov45_022554F0
	ldr r1, _02244D08 ; =ov45_02255468
	ldr r2, _02244D0C ; =ov45_0225540C
	ldr r3, _02244D10 ; =0x000001FA
	bl __msl_assertion_failed
_02244BEC:
	ldr r0, [sl, #0x820]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bl ArrayLength
	mov r8, r0
	cmp r8, #0
	mov sb, #0
	ble _02244CF8
	ldr fp, _02244D14 ; =ov45_02255458
	ldr r6, _02244D08 ; =ov45_02255468
	ldr r5, _02244D0C ; =ov45_0225540C
	ldr r4, _02244D18 ; =0x0000020D
_02244C1C:
	ldr r0, [sl, #0x820]
	mov r1, sb
	bl ov00_021FE6EC
	movs r7, r0
	bne _02244C44
	mov r0, fp
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_02244C44:
	ldr r0, [r7]
	cmp r0, #0
	bge _02244C64
	ldr r0, _02244D1C ; =ov45_02255478
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_02244C64:
	ldr r0, [r7]
	cmp r0, #0x20
	blt _02244C84
	ldr r0, _02244D20 ; =ov45_02255488
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_02244C84:
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _02244CA4
	ldr r0, _02244D24 ; =ov45_022554A4
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_02244CA4:
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _02244CC4
	ldr r0, _02244D28 ; =ov45_022554BC
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_02244CC4:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bge _02244CE4
	ldr r0, _02244D2C ; =ov45_022554DC
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_02244CE4:
	mov r0, r7
	bl ov45_02244500
	add sb, sb, #1
	cmp sb, r8
	blt _02244C1C
_02244CF8:
	ldr r0, [sl, #0x820]
	bl ov00_021FE678
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02244D04: .word ov45_022554F0
_02244D08: .word ov45_02255468
_02244D0C: .word ov45_0225540C
_02244D10: .word 0x000001FA
_02244D14: .word ov45_02255458
_02244D18: .word 0x0000020D
_02244D1C: .word ov45_02255478
_02244D20: .word ov45_02255488
_02244D24: .word ov45_022554A4
_02244D28: .word ov45_022554BC
_02244D2C: .word ov45_022554DC
	arm_func_end ov45_02244BCC

	arm_func_start ov45_02244D30
ov45_02244D30: ; 0x02244D30
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x18
	movs r5, r0
	mov r7, r1
	mov r6, r2
	mov r4, r3
	bne _02244D60
	ldr r0, _02245C60 ; =ov45_022554F0
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245C6C ; =0x0000021F
	bl __msl_assertion_failed
_02244D60:
	cmp r7, #0
	bge _02244D7C
	ldr r0, _02245C70 ; =ov45_02255500
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245C74 ; =0x00000221
	bl __msl_assertion_failed
_02244D7C:
	cmp r7, #0x20
	blt _02244D98
	ldr r0, _02245C78 ; =ov45_0225550C
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245C7C ; =0x00000222
	bl __msl_assertion_failed
_02244D98:
	ldr r0, [r5, #0x820]
	cmp r0, #0
	bne _02244DB8
	ldr r0, _02245C80 ; =ov45_02255520
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245C84 ; =0x00000223
	bl __msl_assertion_failed
_02244DB8:
	cmp r6, #0
	bne _02244DD4
	ldr r0, _02245C88 ; =ov45_02255544
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	mov r3, #0x224
	bl __msl_assertion_failed
_02244DD4:
	cmp r4, #0
	bne _02244DF0
	ldr r0, _02245C8C ; =ov45_02255558
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245C90 ; =0x00000225
	bl __msl_assertion_failed
_02244DF0:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	bne _02244E10
	ldr r0, _02245C94 ; =ov45_02255570
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245C98 ; =0x00000226
	bl __msl_assertion_failed
_02244E10:
	ldr r0, [sp, #0x34]
	cmp r0, #0
	bge _02244E30
	ldr r0, _02245C9C ; =ov45_02255588
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245CA0 ; =0x00000227
	bl __msl_assertion_failed
_02244E30:
	add r2, sp, #0
	mov r1, #0
	str r1, [r2]
	str r1, [r2, #4]
	ldr r0, [sp, #0x3c]
	str r1, [r2, #8]
	str r1, [r2, #0xc]
	str r1, [r2, #0x10]
	str r1, [r2, #0x14]
	str r7, [sp]
	str r6, [sp, #4]
	bl ov00_021EC3A8
	str r0, [sp, #8]
	cmp r0, #0
	addeq sp, sp, #0x18
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r2, [sp, #0x3c]
	mov r1, r4
	bl memcpy
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x30]
	ldr r1, [sp, #0x34]
	cmp r0, #0
	moveq r0, #0
	str r2, [sp, #0xc]
	str r1, [sp, #0x10]
	streq r0, [sp, #0x14]
	beq _02244EE0
	bl strlen
	mov r6, r0
	add r0, r6, #1
	bl ov00_021EC3A8
	str r0, [sp, #0x14]
	cmp r0, #0
	bne _02244ED4
	ldr r0, [sp, #8]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02244ED4:
	ldr r1, [sp, #0x38]
	add r2, r6, #1
	bl memcpy
_02244EE0:
	ldr r0, [sp]
	cmp r0, #0x1f
	addls pc, pc, r0, lsl #2
	b _02246B4C
_02244EF0: ; jump table
	b _02244F70 ; case 0
	b _02244FAC ; case 1
	b _02244FE8 ; case 2
	b _0224505C ; case 3
	b _022450D0 ; case 4
	b _0224517C ; case 5
	b _02245228 ; case 6
	b _0224529C ; case 7
	b _02245380 ; case 8
	b _0224542C ; case 9
	b _022454A0 ; case 10
	b _02245528 ; case 11
	b _0224559C ; case 12
	b _022455D8 ; case 13
	b _0224564C ; case 14
	b _022458E4 ; case 15
	b _02245920 ; case 16
	b _02245994 ; case 17
	b _02245A1C ; case 18
	b _02245A90 ; case 19
	b _02245CC4 ; case 20
	b _02245EAC ; case 21
	b _02245F58 ; case 22
	b _0224603C ; case 23
	b _022460B0 ; case 24
	b _022461F0 ; case 25
	b _02246330 ; case 26
	b _022463A4 ; case 27
	b _02246574 ; case 28
	b _02246658 ; case 29
	b _02246898 ; case 30
	b _02246B10 ; case 31
_02244F70:
	ldr r0, [r4]
	ldr r4, [sp, #8]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r4]
	cmp r0, #0
	bne _02246B60
	mov r0, r4
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02244FAC:
	ldr r0, [r4]
	ldr r4, [sp, #8]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r4]
	cmp r0, #0
	bne _02246B60
	mov r0, r4
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02244FE8:
	ldr r0, [r4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _02245024
	bl ov00_021FF3D4
	str r0, [r6]
	cmp r0, #0
	bne _02245024
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245024:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224505C:
	ldr r0, [r4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _02245098
	bl ov00_021FF3D4
	str r0, [r6]
	cmp r0, #0
	bne _02245098
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245098:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022450D0:
	ldr r0, [r4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _0224510C
	bl ov00_021FF3D4
	str r0, [r6]
	cmp r0, #0
	bne _0224510C
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224510C:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02245144
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _02245144
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245144:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #8]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224517C:
	ldr r0, [r4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _022451B8
	bl ov00_021FF3D4
	str r0, [r6]
	cmp r0, #0
	bne _022451B8
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022451B8:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022451F0
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _022451F0
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022451F0:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #8]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245228:
	ldr r0, [r4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _02245264
	bl ov00_021FF3D4
	str r0, [r6]
	cmp r0, #0
	bne _02245264
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245264:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224529C:
	ldr r0, [r4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _022452D8
	bl ov00_021FF3D4
	str r0, [r6]
	cmp r0, #0
	bne _022452D8
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022452D8:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02245310
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _02245310
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245310:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02245348
	bl ov00_021FF3D4
	str r0, [r6, #0xc]
	cmp r0, #0
	bne _02245348
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245348:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #0x10]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245380:
	ldr r0, [r4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _022453BC
	bl ov00_021FF3D4
	str r0, [r6]
	cmp r0, #0
	bne _022453BC
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022453BC:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022453F4
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _022453F4
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022453F4:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #8]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224542C:
	ldr r0, [r4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _02245468
	bl ov00_021FF3D4
	str r0, [r6]
	cmp r0, #0
	bne _02245468
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245468:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022454A0:
	ldr r0, [r4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _022454DC
	bl ov00_021FF3D4
	str r0, [r6]
	cmp r0, #0
	bne _022454DC
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022454DC:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02246B60
	mov r0, #0x20
	bl ov00_021EC3A8
	str r0, [r6, #4]
	cmp r0, #0
	bne _02245518
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245518:
	ldr r1, [r4, #4]
	mov r2, #0x20
	bl memcpy
	b _02246B60
_02245528:
	ldr r0, [r4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _02245564
	bl ov00_021FF3D4
	str r0, [r6]
	cmp r0, #0
	bne _02245564
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245564:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224559C:
	ldr r0, [r4]
	ldr r4, [sp, #8]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r4]
	cmp r0, #0
	bne _02246B60
	mov r0, r4
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022455D8:
	ldr r0, [r4, #8]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _02245614
	bl ov00_021FF3D4
	str r0, [r6, #8]
	cmp r0, #0
	bne _02245614
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245614:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #0xc]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224564C:
	ldr r0, [r4, #4]
	ldr r8, [sp, #8]
	cmp r0, #0
	bge _02245670
	ldr r0, _02245CA4 ; =ov45_02255590
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245CA8 ; =0x000002D3
	bl __msl_assertion_failed
_02245670:
	ldr r0, [r4, #8]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r8, #8]
	beq _02245750
	ldr r0, [r4, #4]
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r8, #8]
	cmp r0, #0
	bne _022456B8
	mov r0, r8
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022456B8:
	ldr r0, [r4, #4]
	mov r7, #0
	cmp r0, #0
	ble _02245750
	mov r6, r7
_022456CC:
	ldr r0, [r4, #8]
	ldr r0, [r0, r7, lsl #2]
	cmp r0, #0
	ldreq r0, [r8, #8]
	streq r6, [r0, r7, lsl #2]
	beq _02245740
	bl ov00_021FF3D4
	ldr r1, [r8, #8]
	str r0, [r1, r7, lsl #2]
	ldr r0, [r8, #8]
	ldr r0, [r0, r7, lsl #2]
	cmp r0, #0
	bne _02245740
	subs r7, r7, #1
	bmi _0224571C
_02245708:
	ldr r0, [r8, #8]
	ldr r0, [r0, r7, lsl #2]
	bl ov00_021EC3D8
	subs r7, r7, #1
	bpl _02245708
_0224571C:
	ldr r0, [r8, #8]
	bl ov00_021EC3D8
	mov r0, r8
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245740:
	ldr r0, [r4, #4]
	add r7, r7, #1
	cmp r7, r0
	blt _022456CC
_02245750:
	ldr r0, [r4, #4]
	cmp r0, #0
	bge _02245770
	ldr r0, _02245CA4 ; =ov45_02255590
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	mov r3, #0x2d4
	bl __msl_assertion_failed
_02245770:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r8, #0xc]
	beq _02245850
	ldr r0, [r4, #4]
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r8, #0xc]
	cmp r0, #0
	bne _022457B8
	mov r0, r8
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022457B8:
	ldr r0, [r4, #4]
	mov r7, #0
	cmp r0, #0
	ble _02245850
	mov r6, r7
_022457CC:
	ldr r0, [r4, #0xc]
	ldr r0, [r0, r7, lsl #2]
	cmp r0, #0
	ldreq r0, [r8, #0xc]
	streq r6, [r0, r7, lsl #2]
	beq _02245840
	bl ov00_021FF3D4
	ldr r1, [r8, #0xc]
	str r0, [r1, r7, lsl #2]
	ldr r0, [r8, #0xc]
	ldr r0, [r0, r7, lsl #2]
	cmp r0, #0
	bne _02245840
	subs r7, r7, #1
	bmi _0224581C
_02245808:
	ldr r0, [r8, #0xc]
	ldr r0, [r0, r7, lsl #2]
	bl ov00_021EC3D8
	subs r7, r7, #1
	bpl _02245808
_0224581C:
	ldr r0, [r8, #0xc]
	bl ov00_021EC3D8
	mov r0, r8
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245840:
	ldr r0, [r4, #4]
	add r7, r7, #1
	cmp r7, r0
	blt _022457CC
_02245850:
	ldr r0, [r4, #4]
	cmp r0, #0
	bge _02245870
	ldr r0, _02245CA4 ; =ov45_02255590
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245CAC ; =0x000002D5
	bl __msl_assertion_failed
_02245870:
	ldr r0, [r4, #4]
	cmp r0, #0
	ble _02246B60
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0224589C
	ldr r0, _02245CB0 ; =ov45_022555B0
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245CAC ; =0x000002D5
	bl __msl_assertion_failed
_0224589C:
	ldr r0, [r4, #4]
	mov r6, r0, lsl #2
	mov r0, r6
	bl ov00_021EC3A8
	str r0, [r8, #0x10]
	cmp r0, #0
	bne _022458D4
	mov r0, r8
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022458D4:
	ldr r1, [r4, #0x10]
	mov r2, r6
	bl memcpy
	b _02246B60
_022458E4:
	ldr r0, [r4, #8]
	ldr r4, [sp, #8]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r4, #8]
	cmp r0, #0
	bne _02246B60
	mov r0, r4
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245920:
	ldr r0, [r4, #4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _0224595C
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _0224595C
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224595C:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #8]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245994:
	ldr r0, [r4, #4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _022459D0
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _022459D0
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022459D0:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02246B60
	mov r0, #0x20
	bl ov00_021EC3A8
	str r0, [r6, #8]
	cmp r0, #0
	bne _02245A0C
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245A0C:
	ldr r1, [r4, #8]
	mov r2, #0x20
	bl memcpy
	b _02246B60
_02245A1C:
	ldr r0, [r4, #4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _02245A58
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _02245A58
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245A58:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #0xc]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245A90:
	ldr r0, [r4, #4]
	ldr r7, [sp, #8]
	cmp r0, #0
	beq _02245ACC
	bl ov00_021FF3D4
	str r0, [r7, #4]
	cmp r0, #0
	bne _02245ACC
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245ACC:
	ldr r0, [r4, #8]
	cmp r0, #0
	bge _02245AEC
	ldr r0, _02245CB4 ; =ov45_022555CC
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245CB8 ; =0x00000301
	bl __msl_assertion_failed
_02245AEC:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r7, #0xc]
	beq _02245BCC
	ldr r0, [r4, #8]
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r7, #0xc]
	cmp r0, #0
	bne _02245B34
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245B34:
	ldr r0, [r4, #8]
	mov r8, #0
	cmp r0, #0
	ble _02245BCC
	mov r6, r8
_02245B48:
	ldr r0, [r4, #0xc]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	ldreq r0, [r7, #0xc]
	streq r6, [r0, r8, lsl #2]
	beq _02245BBC
	bl ov00_021FF3D4
	ldr r1, [r7, #0xc]
	str r0, [r1, r8, lsl #2]
	ldr r0, [r7, #0xc]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	bne _02245BBC
	subs r8, r8, #1
	bmi _02245B98
_02245B84:
	ldr r0, [r7, #0xc]
	ldr r0, [r0, r8, lsl #2]
	bl ov00_021EC3D8
	subs r8, r8, #1
	bpl _02245B84
_02245B98:
	ldr r0, [r7, #0xc]
	bl ov00_021EC3D8
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245BBC:
	ldr r0, [r4, #8]
	add r8, r8, #1
	cmp r8, r0
	blt _02245B48
_02245BCC:
	ldr r0, [r4, #8]
	cmp r0, #0
	bge _02245BEC
	ldr r0, _02245CB4 ; =ov45_022555CC
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245CBC ; =0x00000302
	bl __msl_assertion_failed
_02245BEC:
	ldr r0, [r4, #8]
	cmp r0, #0
	ble _02246B60
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _02245C18
	ldr r0, _02245CC0 ; =ov45_022555E8
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02245CBC ; =0x00000302
	bl __msl_assertion_failed
_02245C18:
	ldr r0, [r4, #8]
	mov r6, r0, lsl #2
	mov r0, r6
	bl ov00_021EC3A8
	str r0, [r7, #0x10]
	cmp r0, #0
	bne _02245C50
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245C50:
	ldr r1, [r4, #0x10]
	mov r2, r6
	bl memcpy
	b _02246B60
	.balign 4, 0
_02245C60: .word ov45_022554F0
_02245C64: .word ov45_02255468
_02245C68: .word ov45_022553C8
_02245C6C: .word 0x0000021F
_02245C70: .word ov45_02255500
_02245C74: .word 0x00000221
_02245C78: .word ov45_0225550C
_02245C7C: .word 0x00000222
_02245C80: .word ov45_02255520
_02245C84: .word 0x00000223
_02245C88: .word ov45_02255544
_02245C8C: .word ov45_02255558
_02245C90: .word 0x00000225
_02245C94: .word ov45_02255570
_02245C98: .word 0x00000226
_02245C9C: .word ov45_02255588
_02245CA0: .word 0x00000227
_02245CA4: .word ov45_02255590
_02245CA8: .word 0x000002D3
_02245CAC: .word 0x000002D5
_02245CB0: .word ov45_022555B0
_02245CB4: .word ov45_022555CC
_02245CB8: .word 0x00000301
_02245CBC: .word 0x00000302
_02245CC0: .word ov45_022555E8
_02245CC4:
	ldr r0, [r4, #4]
	ldr r7, [sp, #8]
	cmp r0, #0
	beq _02245D00
	bl ov00_021FF3D4
	str r0, [r7, #4]
	cmp r0, #0
	bne _02245D00
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245D00:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02245D38
	bl ov00_021FF3D4
	str r0, [r7, #8]
	cmp r0, #0
	bne _02245D38
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245D38:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02245D70
	bl ov00_021FF3D4
	str r0, [r7, #0xc]
	cmp r0, #0
	bne _02245D70
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245D70:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02245DA8
	bl ov00_021FF3D4
	str r0, [r7, #0x10]
	cmp r0, #0
	bne _02245DA8
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245DA8:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bge _02245DC8
	ldr r0, _02245CA4 ; =ov45_02255590
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02246B78 ; =0x0000030E
	bl __msl_assertion_failed
_02245DC8:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r7, #0x18]
	beq _02246B60
	ldr r0, [r4, #0x14]
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r7, #0x18]
	cmp r0, #0
	bne _02245E10
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245E10:
	ldr r0, [r4, #0x14]
	mov r8, #0
	cmp r0, #0
	ble _02246B60
	mov r6, r8
_02245E24:
	ldr r0, [r4, #0x18]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	ldreq r0, [r7, #0x18]
	streq r6, [r0, r8, lsl #2]
	beq _02245E98
	bl ov00_021FF3D4
	ldr r1, [r7, #0x18]
	str r0, [r1, r8, lsl #2]
	ldr r0, [r7, #0x18]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	bne _02245E98
	subs r8, r8, #1
	bmi _02245E74
_02245E60:
	ldr r0, [r7, #0x18]
	ldr r0, [r0, r8, lsl #2]
	bl ov00_021EC3D8
	subs r8, r8, #1
	bpl _02245E60
_02245E74:
	ldr r0, [r7, #0x18]
	bl ov00_021EC3D8
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245E98:
	ldr r0, [r4, #0x14]
	add r8, r8, #1
	cmp r8, r0
	blt _02245E24
	b _02246B60
_02245EAC:
	ldr r0, [r4, #4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _02245EE8
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _02245EE8
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245EE8:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02245F20
	bl ov00_021FF3D4
	str r0, [r6, #8]
	cmp r0, #0
	bne _02245F20
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245F20:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #0xc]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245F58:
	ldr r0, [r4, #4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _02245F94
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _02245F94
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245F94:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02245FCC
	bl ov00_021FF3D4
	str r0, [r6, #8]
	cmp r0, #0
	bne _02245FCC
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02245FCC:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02246004
	bl ov00_021FF3D4
	str r0, [r6, #0xc]
	cmp r0, #0
	bne _02246004
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246004:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #0x10]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224603C:
	ldr r0, [r4, #4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _02246078
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _02246078
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246078:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #8]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022460B0:
	ldr r0, [r4, #4]
	ldr r7, [sp, #8]
	cmp r0, #0
	beq _022460EC
	bl ov00_021FF3D4
	str r0, [r7, #4]
	cmp r0, #0
	bne _022460EC
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022460EC:
	ldr r0, [r4, #8]
	cmp r0, #0
	bge _0224610C
	ldr r0, _02246B7C ; =ov45_02255604
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02246B80 ; =0x00000335
	bl __msl_assertion_failed
_0224610C:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r7, #0xc]
	beq _02246B60
	ldr r0, [r4, #8]
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r7, #0xc]
	cmp r0, #0
	bne _02246154
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246154:
	ldr r0, [r4, #8]
	mov r8, #0
	cmp r0, #0
	ble _02246B60
	mov r6, r8
_02246168:
	ldr r0, [r4, #0xc]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	ldreq r0, [r7, #0xc]
	streq r6, [r0, r8, lsl #2]
	beq _022461DC
	bl ov00_021FF3D4
	ldr r1, [r7, #0xc]
	str r0, [r1, r8, lsl #2]
	ldr r0, [r7, #0xc]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	bne _022461DC
	subs r8, r8, #1
	bmi _022461B8
_022461A4:
	ldr r0, [r7, #0xc]
	ldr r0, [r0, r8, lsl #2]
	bl ov00_021EC3D8
	subs r8, r8, #1
	bpl _022461A4
_022461B8:
	ldr r0, [r7, #0xc]
	bl ov00_021EC3D8
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022461DC:
	ldr r0, [r4, #8]
	add r8, r8, #1
	cmp r8, r0
	blt _02246168
	b _02246B60
_022461F0:
	ldr r0, [r4, #4]
	ldr r7, [sp, #8]
	cmp r0, #0
	beq _0224622C
	bl ov00_021FF3D4
	str r0, [r7, #4]
	cmp r0, #0
	bne _0224622C
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224622C:
	ldr r0, [r4, #8]
	cmp r0, #0
	bge _0224624C
	ldr r0, _02246B84 ; =ov45_02255620
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02246B88 ; =0x0000033E
	bl __msl_assertion_failed
_0224624C:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r7, #0xc]
	beq _02246B60
	ldr r0, [r4, #8]
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r7, #0xc]
	cmp r0, #0
	bne _02246294
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246294:
	ldr r0, [r4, #8]
	mov r8, #0
	cmp r0, #0
	ble _02246B60
	mov r6, r8
_022462A8:
	ldr r0, [r4, #0xc]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	ldreq r0, [r7, #0xc]
	streq r6, [r0, r8, lsl #2]
	beq _0224631C
	bl ov00_021FF3D4
	ldr r1, [r7, #0xc]
	str r0, [r1, r8, lsl #2]
	ldr r0, [r7, #0xc]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	bne _0224631C
	subs r8, r8, #1
	bmi _022462F8
_022462E4:
	ldr r0, [r7, #0xc]
	ldr r0, [r0, r8, lsl #2]
	bl ov00_021EC3D8
	subs r8, r8, #1
	bpl _022462E4
_022462F8:
	ldr r0, [r7, #0xc]
	bl ov00_021EC3D8
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224631C:
	ldr r0, [r4, #8]
	add r8, r8, #1
	cmp r8, r0
	blt _022462A8
	b _02246B60
_02246330:
	ldr r0, [r4, #4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _0224636C
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _0224636C
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224636C:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #8]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022463A4:
	ldr r0, [r4]
	ldr r7, [sp, #8]
	cmp r0, #0
	beq _022463E0
	bl ov00_021FF3D4
	str r0, [r7]
	cmp r0, #0
	bne _022463E0
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022463E0:
	ldr r0, [r4, #4]
	cmp r0, #0
	bge _02246400
	ldr r0, _02245CB4 ; =ov45_022555CC
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	mov r3, #0x350
	bl __msl_assertion_failed
_02246400:
	ldr r0, [r4, #8]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r7, #8]
	beq _022464E0
	ldr r0, [r4, #4]
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r7, #8]
	cmp r0, #0
	bne _02246448
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246448:
	ldr r0, [r4, #4]
	mov r8, #0
	cmp r0, #0
	ble _022464E0
	mov r6, r8
_0224645C:
	ldr r0, [r4, #8]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	ldreq r0, [r7, #8]
	streq r6, [r0, r8, lsl #2]
	beq _022464D0
	bl ov00_021FF3D4
	ldr r1, [r7, #8]
	str r0, [r1, r8, lsl #2]
	ldr r0, [r7, #8]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	bne _022464D0
	subs r8, r8, #1
	bmi _022464AC
_02246498:
	ldr r0, [r7, #8]
	ldr r0, [r0, r8, lsl #2]
	bl ov00_021EC3D8
	subs r8, r8, #1
	bpl _02246498
_022464AC:
	ldr r0, [r7, #8]
	bl ov00_021EC3D8
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022464D0:
	ldr r0, [r4, #4]
	add r8, r8, #1
	cmp r8, r0
	blt _0224645C
_022464E0:
	ldr r0, [r4, #4]
	cmp r0, #0
	bge _02246500
	ldr r0, _02245CB4 ; =ov45_022555CC
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02246B8C ; =0x00000351
	bl __msl_assertion_failed
_02246500:
	ldr r0, [r4, #4]
	cmp r0, #0
	ble _02246B60
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _0224652C
	ldr r0, _02245CC0 ; =ov45_022555E8
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02246B8C ; =0x00000351
	bl __msl_assertion_failed
_0224652C:
	ldr r0, [r4, #4]
	mov r6, r0, lsl #2
	mov r0, r6
	bl ov00_021EC3A8
	str r0, [r7, #0xc]
	cmp r0, #0
	bne _02246564
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246564:
	ldr r1, [r4, #0xc]
	mov r2, r6
	bl memcpy
	b _02246B60
_02246574:
	ldr r0, [r4]
	ldr r6, [sp, #8]
	cmp r0, #0
	beq _022465B0
	bl ov00_021FF3D4
	str r0, [r6]
	cmp r0, #0
	bne _022465B0
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022465B0:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022465E8
	bl ov00_021FF3D4
	str r0, [r6, #4]
	cmp r0, #0
	bne _022465E8
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022465E8:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02246620
	bl ov00_021FF3D4
	str r0, [r6, #8]
	cmp r0, #0
	bne _02246620
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246620:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r6, #0xc]
	cmp r0, #0
	bne _02246B60
	mov r0, r6
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246658:
	ldr r0, [r4, #4]
	ldr r7, [sp, #8]
	cmp r0, #0
	beq _02246694
	bl ov00_021FF3D4
	str r0, [r7, #4]
	cmp r0, #0
	bne _02246694
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246694:
	ldr r0, [r4, #8]
	cmp r0, #0
	bge _022466B4
	ldr r0, _02246B90 ; =ov45_02255644
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02246B94 ; =0x00000365
	bl __msl_assertion_failed
_022466B4:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r7, #0xc]
	beq _02246794
	ldr r0, [r4, #8]
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r7, #0xc]
	cmp r0, #0
	bne _022466FC
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022466FC:
	ldr r0, [r4, #8]
	mov r8, #0
	cmp r0, #0
	ble _02246794
	mov r6, r8
_02246710:
	ldr r0, [r4, #0xc]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	ldreq r0, [r7, #0xc]
	streq r6, [r0, r8, lsl #2]
	beq _02246784
	bl ov00_021FF3D4
	ldr r1, [r7, #0xc]
	str r0, [r1, r8, lsl #2]
	ldr r0, [r7, #0xc]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	bne _02246784
	subs r8, r8, #1
	bmi _02246760
_0224674C:
	ldr r0, [r7, #0xc]
	ldr r0, [r0, r8, lsl #2]
	bl ov00_021EC3D8
	subs r8, r8, #1
	bpl _0224674C
_02246760:
	ldr r0, [r7, #0xc]
	bl ov00_021EC3D8
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246784:
	ldr r0, [r4, #8]
	add r8, r8, #1
	cmp r8, r0
	blt _02246710
_02246794:
	ldr r0, [r4, #8]
	cmp r0, #0
	bge _022467B4
	ldr r0, _02246B90 ; =ov45_02255644
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02246B98 ; =0x00000366
	bl __msl_assertion_failed
_022467B4:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r7, #0x10]
	beq _02246B60
	ldr r0, [r4, #8]
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r7, #0x10]
	cmp r0, #0
	bne _022467FC
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022467FC:
	ldr r0, [r4, #8]
	mov r8, #0
	cmp r0, #0
	ble _02246B60
	mov r6, r8
_02246810:
	ldr r0, [r4, #0x10]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	ldreq r0, [r7, #0x10]
	streq r6, [r0, r8, lsl #2]
	beq _02246884
	bl ov00_021FF3D4
	ldr r1, [r7, #0x10]
	str r0, [r1, r8, lsl #2]
	ldr r0, [r7, #0x10]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	bne _02246884
	subs r8, r8, #1
	bmi _02246860
_0224684C:
	ldr r0, [r7, #0x10]
	ldr r0, [r0, r8, lsl #2]
	bl ov00_021EC3D8
	subs r8, r8, #1
	bpl _0224684C
_02246860:
	ldr r0, [r7, #0x10]
	bl ov00_021EC3D8
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246884:
	ldr r0, [r4, #8]
	add r8, r8, #1
	cmp r8, r0
	blt _02246810
	b _02246B60
_02246898:
	ldr r0, [r4, #4]
	ldr r7, [sp, #8]
	cmp r0, #0
	beq _022468D4
	bl ov00_021FF3D4
	str r0, [r7, #4]
	cmp r0, #0
	bne _022468D4
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022468D4:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224690C
	bl ov00_021FF3D4
	str r0, [r7, #8]
	cmp r0, #0
	bne _0224690C
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224690C:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bge _0224692C
	ldr r0, _02246B90 ; =ov45_02255644
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	mov r3, #0x370
	bl __msl_assertion_failed
_0224692C:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r7, #0x10]
	beq _02246A0C
	ldr r0, [r4, #0xc]
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r7, #0x10]
	cmp r0, #0
	bne _02246974
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246974:
	ldr r0, [r4, #0xc]
	mov r8, #0
	cmp r0, #0
	ble _02246A0C
	mov r6, r8
_02246988:
	ldr r0, [r4, #0x10]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	ldreq r0, [r7, #0x10]
	streq r6, [r0, r8, lsl #2]
	beq _022469FC
	bl ov00_021FF3D4
	ldr r1, [r7, #0x10]
	str r0, [r1, r8, lsl #2]
	ldr r0, [r7, #0x10]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	bne _022469FC
	subs r8, r8, #1
	bmi _022469D8
_022469C4:
	ldr r0, [r7, #0x10]
	ldr r0, [r0, r8, lsl #2]
	bl ov00_021EC3D8
	subs r8, r8, #1
	bpl _022469C4
_022469D8:
	ldr r0, [r7, #0x10]
	bl ov00_021EC3D8
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022469FC:
	ldr r0, [r4, #0xc]
	add r8, r8, #1
	cmp r8, r0
	blt _02246988
_02246A0C:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bge _02246A2C
	ldr r0, _02246B90 ; =ov45_02255644
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	ldr r3, _02246B9C ; =0x00000371
	bl __msl_assertion_failed
_02246A2C:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	moveq r0, #0
	streq r0, [r7, #0x14]
	beq _02246B60
	ldr r0, [r4, #0xc]
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r7, #0x14]
	cmp r0, #0
	bne _02246A74
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246A74:
	ldr r0, [r4, #0xc]
	mov r8, #0
	cmp r0, #0
	ble _02246B60
	mov r6, r8
_02246A88:
	ldr r0, [r4, #0x14]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	ldreq r0, [r7, #0x14]
	streq r6, [r0, r8, lsl #2]
	beq _02246AFC
	bl ov00_021FF3D4
	ldr r1, [r7, #0x14]
	str r0, [r1, r8, lsl #2]
	ldr r0, [r7, #0x14]
	ldr r0, [r0, r8, lsl #2]
	cmp r0, #0
	bne _02246AFC
	subs r8, r8, #1
	bmi _02246AD8
_02246AC4:
	ldr r0, [r7, #0x14]
	ldr r0, [r0, r8, lsl #2]
	bl ov00_021EC3D8
	subs r8, r8, #1
	bpl _02246AC4
_02246AD8:
	ldr r0, [r7, #0x14]
	bl ov00_021EC3D8
	mov r0, r7
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246AFC:
	ldr r0, [r4, #0xc]
	add r8, r8, #1
	cmp r8, r0
	blt _02246A88
	b _02246B60
_02246B10:
	ldr r0, [r4, #4]
	ldr r4, [sp, #8]
	cmp r0, #0
	beq _02246B60
	bl ov00_021FF3D4
	str r0, [r4, #4]
	cmp r0, #0
	bne _02246B60
	mov r0, r4
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_02246B4C:
	ldr r0, _02246BA0 ; =ov45_022554EC
	ldr r1, _02245C64 ; =ov45_02255468
	ldr r2, _02245C68 ; =ov45_022553C8
	mov r3, #0x380
	bl __msl_assertion_failed
_02246B60:
	ldr r0, [r5, #0x820]
	add r1, sp, #0
	bl ov00_021FE754
	mov r0, #1
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02246B78: .word 0x0000030E
_02246B7C: .word ov45_02255604
_02246B80: .word 0x00000335
_02246B84: .word ov45_02255620
_02246B88: .word 0x0000033E
_02246B8C: .word 0x00000351
_02246B90: .word ov45_02255644
_02246B94: .word 0x00000365
_02246B98: .word 0x00000366
_02246B9C: .word 0x00000371
_02246BA0: .word ov45_022554EC
	arm_func_end ov45_02244D30

	arm_func_start ov45_02246BA4
ov45_02246BA4: ; 0x02246BA4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x14
	movs r6, r0
	mov r5, r1
	bne _02246BCC
	ldr r0, _0224716C ; =ov45_022554F0
	ldr r1, _02247170 ; =ov45_02255468
	ldr r2, _02247174 ; =ov45_022553D8
	ldr r3, _02247178 ; =0x0000038D
	bl __msl_assertion_failed
_02246BCC:
	cmp r5, #0
	bne _02246BE8
	ldr r0, _0224717C ; =ov45_02255458
	ldr r1, _02247170 ; =ov45_02255468
	ldr r2, _02247174 ; =ov45_022553D8
	ldr r3, _02247180 ; =0x0000038F
	bl __msl_assertion_failed
_02246BE8:
	ldr r0, [r5]
	cmp r0, #0
	bge _02246C08
	ldr r0, _02247184 ; =ov45_02255478
	ldr r1, _02247170 ; =ov45_02255468
	ldr r2, _02247174 ; =ov45_022553D8
	ldr r3, _02247180 ; =0x0000038F
	bl __msl_assertion_failed
_02246C08:
	ldr r0, [r5]
	cmp r0, #0x20
	blt _02246C28
	ldr r0, _02247188 ; =ov45_02255488
	ldr r1, _02247170 ; =ov45_02255468
	ldr r2, _02247174 ; =ov45_022553D8
	ldr r3, _02247180 ; =0x0000038F
	bl __msl_assertion_failed
_02246C28:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02246C48
	ldr r0, _0224718C ; =ov45_022554A4
	ldr r1, _02247170 ; =ov45_02255468
	ldr r2, _02247174 ; =ov45_022553D8
	ldr r3, _02247180 ; =0x0000038F
	bl __msl_assertion_failed
_02246C48:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _02246C68
	ldr r0, _02247190 ; =ov45_022554BC
	ldr r1, _02247170 ; =ov45_02255468
	ldr r2, _02247174 ; =ov45_022553D8
	ldr r3, _02247180 ; =0x0000038F
	bl __msl_assertion_failed
_02246C68:
	ldr r0, [r5, #0x10]
	cmp r0, #0
	bge _02246C88
	ldr r0, _02247194 ; =ov45_022554DC
	ldr r1, _02247170 ; =ov45_02255468
	ldr r2, _02247174 ; =ov45_022553D8
	ldr r3, _02247180 ; =0x0000038F
	bl __msl_assertion_failed
_02246C88:
	ldr r0, [r5]
	ldr r4, [r5, #0xc]
	cmp r0, #0x1f
	addls pc, pc, r0, lsl #2
	b _02247148
_02246C9C: ; jump table
	b _02246D1C ; case 0
	b _02246D38 ; case 1
	b _02246D54 ; case 2
	b _02246D70 ; case 3
	b _02246D8C ; case 4
	b _02246DAC ; case 5
	b _02246DC8 ; case 6
	b _02246DE4 ; case 7
	b _02246E0C ; case 8
	b _02246E28 ; case 9
	b _02246E44 ; case 10
	b _02246E60 ; case 11
	b _02246E7C ; case 12
	b _02246E98 ; case 13
	b _02246EC0 ; case 14
	b _02246EE8 ; case 15
	b _02246F10 ; case 16
	b _02246F2C ; case 17
	b _02246F48 ; case 18
	b _02246F68 ; case 19
	b _02246F90 ; case 20
	b _02246FCC ; case 21
	b _02246FEC ; case 22
	b _02247014 ; case 23
	b _02247034 ; case 24
	b _02247054 ; case 25
	b _02247074 ; case 26
	b _02247090 ; case 27
	b _022470B0 ; case 28
	b _022470D0 ; case 29
	b _022470F8 ; case 30
	b _0224712C ; case 31
_02246D1C:
	ldr r0, [r5, #8]
	ldr r3, [r5, #4]
	ldr r1, [r0]
	mov r0, r6
	mov r2, r4
	blx r3
	b _0224715C
_02246D38:
	ldr r0, [r5, #8]
	ldr r3, [r5, #4]
	ldr r1, [r0]
	mov r0, r6
	mov r2, r4
	blx r3
	b _0224715C
_02246D54:
	ldr r3, [r5, #8]
	mov r0, r6
	str r4, [sp]
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246D70:
	ldr r0, [r5, #8]
	ldr ip, [r5, #4]
	ldmia r0, {r1, r2}
	mov r0, r6
	mov r3, r4
	blx ip
	b _0224715C
_02246D8C:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	stmia sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246DAC:
	ldr r3, [r5, #8]
	mov r0, r6
	str r4, [sp]
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246DC8:
	ldr r3, [r5, #8]
	mov r0, r6
	str r4, [sp]
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246DE4:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	str r1, [sp]
	ldr r1, [r3, #0x10]
	stmib sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246E0C:
	ldr r3, [r5, #8]
	mov r0, r6
	str r4, [sp]
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246E28:
	ldr r0, [r5, #8]
	ldr ip, [r5, #4]
	ldmia r0, {r1, r2}
	mov r0, r6
	mov r3, r4
	blx ip
	b _0224715C
_02246E44:
	ldr r0, [r5, #8]
	ldr ip, [r5, #4]
	ldmia r0, {r1, r2}
	mov r0, r6
	mov r3, r4
	blx ip
	b _0224715C
_02246E60:
	ldr r3, [r5, #8]
	mov r0, r6
	str r4, [sp]
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246E7C:
	ldr r0, [r5, #8]
	ldr r3, [r5, #4]
	ldr r1, [r0]
	mov r0, r6
	mov r2, r4
	blx r3
	b _0224715C
_02246E98:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	str r1, [sp]
	ldr r1, [r3, #0x10]
	stmib sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246EC0:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	str r1, [sp]
	ldr r1, [r3, #0x10]
	stmib sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246EE8:
	ldr r7, [r5, #8]
	ldr r8, [r5, #4]
	ldr r1, [r7, #8]
	mov r0, r6
	bl ov45_02248558
	str r4, [sp]
	mov r0, r6
	ldmia r7, {r1, r2, r3}
	blx r8
	b _0224715C
_02246F10:
	ldr r3, [r5, #8]
	mov r0, r6
	str r4, [sp]
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246F2C:
	ldr r3, [r5, #8]
	mov r0, r6
	str r4, [sp]
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246F48:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	stmia sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246F68:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	str r1, [sp]
	ldr r1, [r3, #0x10]
	stmib sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246F90:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	str r1, [sp]
	ldr r1, [r3, #0x10]
	str r1, [sp, #4]
	ldr r1, [r3, #0x14]
	str r1, [sp, #8]
	ldr r1, [r3, #0x18]
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246FCC:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	stmia sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02246FEC:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	str r1, [sp]
	ldr r1, [r3, #0x10]
	stmib sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02247014:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	stmia sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02247034:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	stmia sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02247054:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	stmia sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02247074:
	ldr r3, [r5, #8]
	mov r0, r6
	str r4, [sp]
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_02247090:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	stmia sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_022470B0:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	stmia sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_022470D0:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	str r1, [sp]
	ldr r1, [r3, #0x10]
	stmib sp, {r1, r4}
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_022470F8:
	ldr r3, [r5, #8]
	mov r0, r6
	ldr r1, [r3, #0xc]
	str r1, [sp]
	ldr r1, [r3, #0x10]
	str r1, [sp, #4]
	ldr r1, [r3, #0x14]
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	ldr r4, [r5, #4]
	ldmia r3, {r1, r2, r3}
	blx r4
	b _0224715C
_0224712C:
	ldr r0, [r5, #8]
	ldr ip, [r5, #4]
	ldmia r0, {r1, r2}
	mov r0, r6
	mov r3, r4
	blx ip
	b _0224715C
_02247148:
	ldr r0, _02247198 ; =ov45_022554EC
	ldr r1, _02247170 ; =ov45_02255468
	ldr r2, _02247174 ; =ov45_022553D8
	ldr r3, _0224719C ; =0x000005EF
	bl __msl_assertion_failed
_0224715C:
	mov r0, r5
	bl ov45_02244500
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0224716C: .word ov45_022554F0
_02247170: .word ov45_02255468
_02247174: .word ov45_022553D8
_02247178: .word 0x0000038D
_0224717C: .word ov45_02255458
_02247180: .word 0x0000038F
_02247184: .word ov45_02255478
_02247188: .word ov45_02255488
_0224718C: .word ov45_022554A4
_02247190: .word ov45_022554BC
_02247194: .word ov45_022554DC
_02247198: .word ov45_022554EC
_0224719C: .word 0x000005EF
	arm_func_end ov45_02246BA4

	arm_func_start ov45_022471A0
ov45_022471A0: ; 0x022471A0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x18
	movs sl, r0
	mov sb, r1
	bne _022471C8
	ldr r0, _02247370 ; =ov45_022554F0
	ldr r1, _02247374 ; =ov45_02255468
	ldr r2, _02247378 ; =ov45_022553E8
	ldr r3, _0224737C ; =0x000005FC
	bl __msl_assertion_failed
_022471C8:
	ldr r0, [sl, #0x820]
	mov r8, #0
	bl ArrayLength
	cmp r0, #0
	addle sp, sp, #0x18
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr fp, _02247380 ; =ov45_02255458
	ldr r6, _02247374 ; =ov45_02255468
	ldr r5, _02247378 ; =ov45_022553E8
	ldr r4, _02247384 ; =0x00000605
_022471F0:
	ldr r0, [sl, #0x820]
	mov r1, r8
	bl ov00_021FE6EC
	movs r7, r0
	bne _02247218
	mov r0, fp
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_02247218:
	ldr r0, [r7]
	cmp r0, #0
	bge _02247238
	ldr r0, _02247388 ; =ov45_02255478
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_02247238:
	ldr r0, [r7]
	cmp r0, #0x20
	blt _02247258
	ldr r0, _0224738C ; =ov45_02255488
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_02247258:
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _02247278
	ldr r0, _02247390 ; =ov45_022554A4
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_02247278:
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _02247298
	ldr r0, _02247394 ; =ov45_022554BC
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_02247298:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bge _022472B8
	ldr r0, _02247398 ; =ov45_022554DC
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_022472B8:
	ldr r1, [r7, #0x14]
	cmp r1, #0
	beq _022472EC
	mov r0, sl
	bl ov45_02248238
	cmp r0, #0
	bne _022472EC
	mov r0, r7
	bl ov45_02244500
	ldr r0, [sl, #0x820]
	mov r1, r8
	bl ov00_021FE968
	b _02247358
_022472EC:
	ldr r1, [r7, #0x14]
	cmp r1, #0
	beq _02247308
	mov r0, sl
	bl ov45_0224861C
	cmp r0, #0
	beq _02247354
_02247308:
	cmp sb, #0
	ldrne r0, [r7, #0x10]
	cmpne r0, sb
	bne _02247354
	add ip, sp, #0
	ldmia r7!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia r7, {r0, r1}
	stmia ip, {r0, r1}
	ldr r0, [sl, #0x820]
	mov r1, r8
	bl ov00_021FE968
	mov r0, sl
	add r1, sp, #0
	bl ov45_02246BA4
	cmp sb, #0
	beq _02247358
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02247354:
	add r8, r8, #1
_02247358:
	ldr r0, [sl, #0x820]
	bl ArrayLength
	cmp r8, r0
	blt _022471F0
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02247370: .word ov45_022554F0
_02247374: .word ov45_02255468
_02247378: .word ov45_022553E8
_0224737C: .word 0x000005FC
_02247380: .word ov45_02255458
_02247384: .word 0x00000605
_02247388: .word ov45_02255478
_0224738C: .word ov45_02255488
_02247390: .word ov45_022554A4
_02247394: .word ov45_022554BC
_02247398: .word ov45_022554DC
	arm_func_end ov45_022471A0

	arm_func_start ov45_0224739C
ov45_0224739C: ; 0x0224739C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	mov sb, r1
	bne _022473C0
	ldr r0, _022474D0 ; =ov45_022554F0
	ldr r1, _022474D4 ; =ov45_02255468
	ldr r2, _022474D8 ; =ov45_02255420
	ldr r3, _022474DC ; =0x0000063B
	bl __msl_assertion_failed
_022473C0:
	ldr r0, [sl, #0x820]
	bl ArrayLength
	mov fp, r0
	cmp fp, #0
	mov r8, #0
	ble _022474C8
	ldr r6, _022474D4 ; =ov45_02255468
	ldr r5, _022474D8 ; =ov45_02255420
	ldr r4, _022474E0 ; =0x00000648
_022473E4:
	ldr r0, [sl, #0x820]
	mov r1, r8
	bl ov00_021FE6EC
	movs r7, r0
	bne _0224740C
	ldr r0, _022474E4 ; =ov45_02255458
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_0224740C:
	ldr r0, [r7]
	cmp r0, #0
	bge _0224742C
	ldr r0, _022474E8 ; =ov45_02255478
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_0224742C:
	ldr r0, [r7]
	cmp r0, #0x20
	blt _0224744C
	ldr r0, _022474EC ; =ov45_02255488
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_0224744C:
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0224746C
	ldr r0, _022474F0 ; =ov45_022554A4
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_0224746C:
	ldr r0, [r7, #8]
	cmp r0, #0
	bne _0224748C
	ldr r0, _022474F4 ; =ov45_022554BC
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_0224748C:
	ldr r0, [r7, #0x10]
	cmp r0, #0
	bge _022474AC
	ldr r0, _022474F8 ; =ov45_022554DC
	mov r1, r6
	mov r2, r5
	mov r3, r4
	bl __msl_assertion_failed
_022474AC:
	ldr r0, [r7, #0x10]
	cmp r0, sb
	moveq r0, r8
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r8, r8, #1
	cmp r8, fp
	blt _022473E4
_022474C8:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_022474D0: .word ov45_022554F0
_022474D4: .word ov45_02255468
_022474D8: .word ov45_02255420
_022474DC: .word 0x0000063B
_022474E0: .word 0x00000648
_022474E4: .word ov45_02255458
_022474E8: .word ov45_02255478
_022474EC: .word ov45_02255488
_022474F0: .word ov45_022554A4
_022474F4: .word ov45_022554BC
_022474F8: .word ov45_022554DC
	arm_func_end ov45_0224739C

	arm_func_start ov45_022474FC
ov45_022474FC: ; 0x022474FC
	stmdb sp!, {r3, lr}
	bl ov45_0224739C
	mvn r1, #0
	cmp r0, r1
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, pc}
	arm_func_end ov45_022474FC

	arm_func_start ov45_02247518
ov45_02247518: ; 0x02247518
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _0224753C
	ldr r0, _022475A4 ; =ov45_0225590C
	ldr r1, _022475A8 ; =ov45_02255918
	ldr r2, _022475AC ; =ov45_02255668
	mov r3, #0x99
	bl __msl_assertion_failed
_0224753C:
	ldrsb r0, [r5]
	cmp r0, #0
	bne _0224755C
	ldr r0, _022475B0 ; =ov45_02255928
	ldr r1, _022475A8 ; =ov45_02255918
	ldr r2, _022475AC ; =ov45_02255668
	mov r3, #0x99
	bl __msl_assertion_failed
_0224755C:
	ldrsb r2, [r5], #1
	mov r0, #0
	cmp r2, #0
	beq _02247594
	ldr r1, _022475B4 ; =_0210E404
_02247570:
	cmp r2, #0
	blt _02247584
	cmp r2, #0x80
	bge _02247584
	ldrb r2, [r1, r2]
_02247584:
	add r0, r0, r2
	ldrsb r2, [r5], #1
	cmp r2, #0
	bne _02247570
_02247594:
	mov r1, r4
	bl _s32_div_f
	mov r0, r1
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022475A4: .word ov45_0225590C
_022475A8: .word ov45_02255918
_022475AC: .word ov45_02255668
_022475B0: .word ov45_02255928
_022475B4: .word _0210E404
	arm_func_end ov45_02247518

	arm_func_start ov45_022475B8
ov45_022475B8: ; 0x022475B8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x1e4
	ldr r2, _022475EC ; =0x00000101
	mov r4, r0
	add r0, sp, #0
	bl strncpy
	mov r0, #0
	strb r0, [sp, #0x100]
	ldr r0, [r4, #0x80c]
	add r1, sp, #0
	bl ov00_021FF0C0
	add sp, sp, #0x1e4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_022475EC: .word 0x00000101
	arm_func_end ov45_022475B8

	arm_func_start ov45_022475F0
ov45_022475F0: ; 0x022475F0
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _02247614
	ldr r0, _02247640 ; =ov45_02255938
	ldr r1, _02247644 ; =ov45_02255918
	ldr r2, _02247648 ; =ov45_022557FC
	mov r3, #0xb4
	bl __msl_assertion_failed
_02247614:
	cmp r4, #0
	bgt _02247630
	ldr r0, _0224764C ; =ov45_02255948
	ldr r1, _02247644 ; =ov45_02255918
	ldr r2, _02247648 ; =ov45_022557FC
	mov r3, #0xb5
	bl __msl_assertion_failed
_02247630:
	mov r0, r5
	mov r1, r4
	bl ov45_02247518
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02247640: .word ov45_02255938
_02247644: .word ov45_02255918
_02247648: .word ov45_022557FC
_0224764C: .word ov45_02255948
	arm_func_end ov45_022475F0

	arm_func_start ov45_02247650
ov45_02247650: ; 0x02247650
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _02247674
	ldr r0, _02247750 ; =ov45_02255958
	ldr r1, _02247754 ; =ov45_02255918
	ldr r2, _02247758 ; =ov45_022558BC
	mov r3, #0xc1
	bl __msl_assertion_failed
_02247674:
	cmp r4, #0
	bne _02247690
	ldr r0, _0224775C ; =ov45_02255968
	ldr r1, _02247754 ; =ov45_02255918
	ldr r2, _02247758 ; =ov45_022558BC
	mov r3, #0xc2
	bl __msl_assertion_failed
_02247690:
	cmp r5, #0
	bne _022476AC
	ldr r0, _02247760 ; =ov45_02255978
	ldr r1, _02247754 ; =ov45_02255918
	ldr r2, _02247758 ; =ov45_022558BC
	mov r3, #0xc6
	bl __msl_assertion_failed
_022476AC:
	cmp r4, #0
	bne _022476C8
	ldr r0, _02247764 ; =ov45_02255988
	ldr r1, _02247754 ; =ov45_02255918
	ldr r2, _02247758 ; =ov45_022558BC
	mov r3, #0xc7
	bl __msl_assertion_failed
_022476C8:
	cmp r5, #0
	bne _022476E4
	ldr r0, _02247760 ; =ov45_02255978
	ldr r1, _02247754 ; =ov45_02255918
	ldr r2, _02247758 ; =ov45_022558BC
	mov r3, #0xc8
	bl __msl_assertion_failed
_022476E4:
	ldrsb r0, [r5]
	cmp r0, #0
	bne _02247704
	ldr r0, _02247768 ; =ov45_02255998
	ldr r1, _02247754 ; =ov45_02255918
	ldr r2, _02247758 ; =ov45_022558BC
	mov r3, #0xc8
	bl __msl_assertion_failed
_02247704:
	cmp r4, #0
	bne _02247720
	ldr r0, _02247764 ; =ov45_02255988
	ldr r1, _02247754 ; =ov45_02255918
	ldr r2, _02247758 ; =ov45_022558BC
	mov r3, #0xc9
	bl __msl_assertion_failed
_02247720:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _02247740
	ldr r0, _0224776C ; =ov45_022559A8
	ldr r1, _02247754 ; =ov45_02255918
	ldr r2, _02247758 ; =ov45_022558BC
	mov r3, #0xc9
	bl __msl_assertion_failed
_02247740:
	mov r0, r5
	mov r1, r4
	bl strnicmp
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02247750: .word ov45_02255958
_02247754: .word ov45_02255918
_02247758: .word ov45_022558BC
_0224775C: .word ov45_02255968
_02247760: .word ov45_02255978
_02247764: .word ov45_02255988
_02247768: .word ov45_02255998
_0224776C: .word ov45_022559A8
	arm_func_end ov45_02247650

	arm_func_start ov45_02247770
ov45_02247770: ; 0x02247770
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02247790
	ldr r0, _022477AC ; =ov45_02255938
	ldr r1, _022477B0 ; =ov45_02255918
	ldr r2, _022477B4 ; =ov45_022558F0
	mov r3, #0xd2
	bl __msl_assertion_failed
_02247790:
	ldr r0, [r4, #0x15c]
	bl ov00_021EC3D8
	ldr r0, [r4, #0x134]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl ov00_021FEE8C
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022477AC: .word ov45_02255938
_022477B0: .word ov45_02255918
_022477B4: .word ov45_022558F0
	arm_func_end ov45_02247770

	arm_func_start ov45_022477B8
ov45_022477B8: ; 0x022477B8
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _022477DC
	ldr r0, _02247808 ; =ov45_02255938
	ldr r1, _0224780C ; =ov45_02255918
	ldr r2, _02247810 ; =ov45_02255714
	mov r3, #0xe1
	bl __msl_assertion_failed
_022477DC:
	cmp r4, #0
	bgt _022477F8
	ldr r0, _02247814 ; =ov45_02255948
	ldr r1, _0224780C ; =ov45_02255918
	ldr r2, _02247810 ; =ov45_02255714
	mov r3, #0xe2
	bl __msl_assertion_failed
_022477F8:
	mov r0, r5
	mov r1, r4
	bl ov45_02247518
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02247808: .word ov45_02255938
_0224780C: .word ov45_02255918
_02247810: .word ov45_02255714
_02247814: .word ov45_02255948
	arm_func_end ov45_022477B8

	arm_func_start ov45_02247818
ov45_02247818: ; 0x02247818
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _0224783C
	ldr r0, _0224790C ; =ov45_02255958
	ldr r1, _02247910 ; =ov45_02255918
	ldr r2, _02247914 ; =ov45_022557B4
	mov r3, #0xee
	bl __msl_assertion_failed
_0224783C:
	cmp r4, #0
	bne _02247858
	ldr r0, _02247918 ; =ov45_02255968
	ldr r1, _02247910 ; =ov45_02255918
	ldr r2, _02247914 ; =ov45_022557B4
	mov r3, #0xef
	bl __msl_assertion_failed
_02247858:
	cmp r5, #0
	cmpne r4, #0
	bne _02247884
	cmp r5, #0
	cmpeq r4, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	mvneq r0, #0
	movne r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_02247884:
	cmp r5, #0
	bne _022478A0
	ldr r0, _0224791C ; =ov45_02255978
	ldr r1, _02247910 ; =ov45_02255918
	ldr r2, _02247914 ; =ov45_022557B4
	ldr r3, _02247920 ; =0x00000102
	bl __msl_assertion_failed
_022478A0:
	ldrsb r0, [r5]
	cmp r0, #0
	bne _022478C0
	ldr r0, _02247924 ; =ov45_02255998
	ldr r1, _02247910 ; =ov45_02255918
	ldr r2, _02247914 ; =ov45_022557B4
	ldr r3, _02247920 ; =0x00000102
	bl __msl_assertion_failed
_022478C0:
	cmp r4, #0
	bne _022478DC
	ldr r0, _02247928 ; =ov45_02255988
	ldr r1, _02247910 ; =ov45_02255918
	ldr r2, _02247914 ; =ov45_022557B4
	ldr r3, _0224792C ; =0x00000103
	bl __msl_assertion_failed
_022478DC:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _022478FC
	ldr r0, _02247930 ; =ov45_022559A8
	ldr r1, _02247910 ; =ov45_02255918
	ldr r2, _02247914 ; =ov45_022557B4
	ldr r3, _0224792C ; =0x00000103
	bl __msl_assertion_failed
_022478FC:
	mov r0, r5
	mov r1, r4
	bl strnicmp
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224790C: .word ov45_02255958
_02247910: .word ov45_02255918
_02247914: .word ov45_022557B4
_02247918: .word ov45_02255968
_0224791C: .word ov45_02255978
_02247920: .word 0x00000102
_02247924: .word ov45_02255998
_02247928: .word ov45_02255988
_0224792C: .word 0x00000103
_02247930: .word ov45_022559A8
	arm_func_end ov45_02247818

	arm_func_start ov45_02247934
ov45_02247934: ; 0x02247934
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmneia sp!, {r3, pc}
	ldr r0, _02247958 ; =ov45_02255938
	ldr r1, _0224795C ; =ov45_02255918
	ldr r2, _02247960 ; =ov45_022558D4
	ldr r3, _02247964 ; =0x0000010A
	bl __msl_assertion_failed
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02247958: .word ov45_02255938
_0224795C: .word ov45_02255918
_02247960: .word ov45_022558D4
_02247964: .word 0x0000010A
	arm_func_end ov45_02247934

	arm_func_start ov45_02247968
ov45_02247968: ; 0x02247968
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	ldr r1, _022479E4 ; =ov45_02247650
	ldr ip, _022479E8 ; =ov45_02247770
	str r1, [sp]
	mov r4, r0
	ldr r3, _022479EC ; =ov45_022475F0
	mov r0, #0x1e4
	mov r1, #7
	mov r2, #2
	str ip, [sp, #4]
	bl ov00_021FED4C
	cmp r0, #0
	str r0, [r4, #0x80c]
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	mov r2, r1
	mov r0, #0x1e4
	bl ov00_021FE5B4
	cmp r0, #0
	str r0, [r4, #0x810]
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r4, pc}
	ldr r0, [r4, #0x80c]
	bl ov00_021FEE8C
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_022479E4: .word ov45_02247650
_022479E8: .word ov45_02247770
_022479EC: .word ov45_022475F0
	arm_func_end ov45_02247968

	arm_func_start ov45_022479F0
ov45_022479F0: ; 0x022479F0
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02247A10
	ldr r0, _02247A34 ; =ov45_022559B8
	ldr r1, _02247A38 ; =ov45_02255918
	ldr r2, _02247A3C ; =ov45_02255700
	ldr r3, _02247A40 ; =0x00000127
	bl __msl_assertion_failed
_02247A10:
	ldr r0, [r4, #0x80c]
	cmp r0, #0
	beq _02247A20
	bl ov00_021FEE8C
_02247A20:
	ldr r0, [r4, #0x810]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	bl ov00_021FE678
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02247A34: .word ov45_022559B8
_02247A38: .word ov45_02255918
_02247A3C: .word ov45_02255700
_02247A40: .word 0x00000127
	arm_func_end ov45_022479F0

	arm_func_start ov45_02247A44
ov45_02247A44: ; 0x02247A44
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x1e4
	movs r5, r0
	mov r4, r1
	bne _02247A6C
	ldr r0, _02247AC4 ; =ov45_022559B8
	ldr r1, _02247AC8 ; =ov45_02255918
	ldr r2, _02247ACC ; =ov45_0225573C
	mov r3, #0x134
	bl __msl_assertion_failed
_02247A6C:
	mov r0, #0
	add lr, sp, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	mov ip, #0xf
_02247A84:
	stmia lr!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02247A84
	ldr r2, _02247AD0 ; =0x00000101
	str r0, [lr]
	add r0, sp, #0
	mov r1, r4
	bl strncpy
	mov r0, #0
	strb r0, [sp, #0x100]
	ldr r0, [r5, #0x810]
	add r1, sp, #0
	bl ov00_021FE754
	add sp, sp, #0x1e4
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_02247AC4: .word ov45_022559B8
_02247AC8: .word ov45_02255918
_02247ACC: .word ov45_0225573C
_02247AD0: .word 0x00000101
	arm_func_end ov45_02247A44

	arm_func_start ov45_02247AD4
ov45_02247AD4: ; 0x02247AD4
	ldr ip, _02247ADC ; =strnicmp
	bx ip
	.balign 4, 0
_02247ADC: .word strnicmp
	arm_func_end ov45_02247AD4

	arm_func_start ov45_02247AE0
ov45_02247AE0: ; 0x02247AE0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	mov sb, r1
	bne _02247B04
	ldr r0, _02247B7C ; =ov45_022559B8
	ldr r1, _02247B80 ; =ov45_02255918
	ldr r2, _02247B84 ; =ov45_022557A0
	ldr r3, _02247B88 ; =0x0000014D
	bl __msl_assertion_failed
_02247B04:
	ldr r0, [sl, #0x810]
	bl ArrayLength
	mov r7, r0
	cmp r7, #0
	mov r6, #0
	ble _02247B74
	ldr r5, _02247B8C ; =ov45_022559C8
	ldr r4, _02247B80 ; =ov45_02255918
	ldr fp, _02247B84 ; =ov45_022557A0
_02247B28:
	ldr r0, [sl, #0x810]
	mov r1, r6
	bl ov00_021FE6EC
	movs r8, r0
	bne _02247B50
	ldr r3, _02247B90 ; =0x00000153
	mov r0, r5
	mov r1, r4
	mov r2, fp
	bl __msl_assertion_failed
_02247B50:
	mov r0, r8
	mov r1, sb
	bl strnicmp
	cmp r0, #0
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r6, r6, #1
	cmp r6, r7
	blt _02247B28
_02247B74:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02247B7C: .word ov45_022559B8
_02247B80: .word ov45_02255918
_02247B84: .word ov45_022557A0
_02247B88: .word 0x0000014D
_02247B8C: .word ov45_022559C8
_02247B90: .word 0x00000153
	arm_func_end ov45_02247AE0

	arm_func_start ov45_02247B94
ov45_02247B94: ; 0x02247B94
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x1ec
	movs r7, r0
	mov r6, r1
	mov r5, r2
	bne _02247BC0
	ldr r0, _02247D48 ; =ov45_022559B8
	ldr r1, _02247D4C ; =ov45_02255918
	ldr r2, _02247D50 ; =ov45_0225569C
	mov r3, #0x160
	bl __msl_assertion_failed
_02247BC0:
	cmp r6, #0
	bne _02247BDC
	ldr r0, _02247D54 ; =ov45_022559D4
	ldr r1, _02247D4C ; =ov45_02255918
	ldr r2, _02247D50 ; =ov45_0225569C
	ldr r3, _02247D58 ; =0x00000162
	bl __msl_assertion_failed
_02247BDC:
	ldrsb r0, [r6]
	cmp r0, #0
	bne _02247BFC
	ldr r0, _02247D5C ; =ov45_022559E4
	ldr r1, _02247D4C ; =ov45_02255918
	ldr r2, _02247D50 ; =ov45_0225569C
	ldr r3, _02247D58 ; =0x00000162
	bl __msl_assertion_failed
_02247BFC:
	mov r0, r6
	bl strlen
	ldr r3, _02247D60 ; =0x00000101
	cmp r0, r3
	blo _02247C24
	ldr r0, _02247D64 ; =ov45_022559F8
	ldr r1, _02247D4C ; =ov45_02255918
	ldr r2, _02247D50 ; =ov45_0225569C
	add r3, r3, #0x61
	bl __msl_assertion_failed
_02247C24:
	cmp r5, #0
	bne _02247C40
	ldr r0, _02247D68 ; =ov45_02255A18
	ldr r1, _02247D4C ; =ov45_02255918
	ldr r2, _02247D50 ; =ov45_0225569C
	ldr r3, _02247D6C ; =0x00000163
	bl __msl_assertion_failed
_02247C40:
	mov r0, #2
	bl ov00_021EC3A8
	movs r4, r0
	addeq sp, sp, #0x1ec
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	ldr r1, _02247D70 ; =ov45_02255A2C
	mov r0, #0
	ldrb ip, [r1]
	add lr, sp, #8
	mov r1, r0
	strb ip, [r4]
	mov r2, r0
	mov r3, r0
	mov ip, #0xf
_02247C78:
	stmia lr!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _02247C78
	str r0, [lr]
	add ip, sp, #0x10c
	ldmia r5!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia r5!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia r5, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r2, _02247D60 ; =0x00000101
	mov r1, r6
	add r0, sp, #8
	bl strncpy
	mov r0, #0
	strb r0, [sp, #0x108]
	ldr r1, _02247D74 ; =ov45_02247818
	ldr r0, _02247D78 ; =ov45_02247934
	str r1, [sp]
	str r0, [sp, #4]
	ldr r3, _02247D7C ; =ov45_022477B8
	mov r0, #0xe0
	mov r1, #0x3d
	mov r2, #2
	bl ov00_021FED4C
	str r0, [sp, #0x13c]
	cmp r0, #0
	addeq sp, sp, #0x1ec
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	mov r3, #0
	str r3, [sp, #0x160]
	str r4, [sp, #0x164]
	str r3, [sp, #0x168]
	strb r3, [sp, #0x16c]
	str r3, [sp]
	ldr r0, [r7, #0x810]
	ldr r2, _02247D80 ; =ov45_02247AD4
	add r1, sp, #8
	bl ov00_021FEA40
	mov r1, r0
	mvn r0, #0
	cmp r1, r0
	beq _02247D34
	ldr r0, [r7, #0x810]
	bl ov00_021FE8D8
_02247D34:
	ldr r0, [r7, #0x80c]
	add r1, sp, #8
	bl ov00_021FEF74
	add sp, sp, #0x1ec
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_02247D48: .word ov45_022559B8
_02247D4C: .word ov45_02255918
_02247D50: .word ov45_0225569C
_02247D54: .word ov45_022559D4
_02247D58: .word 0x00000162
_02247D5C: .word ov45_022559E4
_02247D60: .word 0x00000101
_02247D64: .word ov45_022559F8
_02247D68: .word ov45_02255A18
_02247D6C: .word 0x00000163
_02247D70: .word ov45_02255A2C
_02247D74: .word ov45_02247818
_02247D78: .word ov45_02247934
_02247D7C: .word ov45_022477B8
_02247D80: .word ov45_02247AD4
	arm_func_end ov45_02247B94

	arm_func_start ov45_02247D84
ov45_02247D84: ; 0x02247D84
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x1e8
	movs r5, r0
	mov r4, r1
	bne _02247DAC
	ldr r0, _02247E70 ; =ov45_022559B8
	ldr r1, _02247E74 ; =ov45_02255918
	ldr r2, _02247E78 ; =ov45_02255678
	ldr r3, _02247E7C ; =0x00000189
	bl __msl_assertion_failed
_02247DAC:
	cmp r4, #0
	bne _02247DC8
	ldr r0, _02247E80 ; =ov45_022559D4
	ldr r1, _02247E74 ; =ov45_02255918
	ldr r2, _02247E78 ; =ov45_02255678
	ldr r3, _02247E84 ; =0x0000018B
	bl __msl_assertion_failed
_02247DC8:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _02247DE8
	ldr r0, _02247E88 ; =ov45_022559E4
	ldr r1, _02247E74 ; =ov45_02255918
	ldr r2, _02247E78 ; =ov45_02255678
	ldr r3, _02247E84 ; =0x0000018B
	bl __msl_assertion_failed
_02247DE8:
	mov r0, r4
	bl strlen
	ldr r3, _02247E8C ; =0x00000101
	cmp r0, r3
	blo _02247E10
	ldr r0, _02247E90 ; =ov45_022559F8
	ldr r1, _02247E74 ; =ov45_02255918
	ldr r2, _02247E78 ; =ov45_02255678
	add r3, r3, #0x8a
	bl __msl_assertion_failed
_02247E10:
	ldr r2, _02247E8C ; =0x00000101
	add r0, sp, #4
	mov r1, r4
	bl strncpy
	mov r3, #0
	strb r3, [sp, #0x104]
	str r3, [sp]
	ldr r0, [r5, #0x810]
	ldr r2, _02247E94 ; =ov45_02247AD4
	add r1, sp, #4
	bl ov00_021FEA40
	mov r1, r0
	mvn r0, #0
	cmp r1, r0
	beq _02247E5C
	ldr r0, [r5, #0x810]
	bl ov00_021FE8D8
	add sp, sp, #0x1e8
	ldmia sp!, {r3, r4, r5, pc}
_02247E5C:
	ldr r0, [r5, #0x80c]
	add r1, sp, #4
	bl ov00_021FF01C
	add sp, sp, #0x1e8
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02247E70: .word ov45_022559B8
_02247E74: .word ov45_02255918
_02247E78: .word ov45_02255678
_02247E7C: .word 0x00000189
_02247E80: .word ov45_022559D4
_02247E84: .word 0x0000018B
_02247E88: .word ov45_022559E4
_02247E8C: .word 0x00000101
_02247E90: .word ov45_022559F8
_02247E94: .word ov45_02247AD4
	arm_func_end ov45_02247D84

	arm_func_start ov45_02247E98
ov45_02247E98: ; 0x02247E98
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _02247EBC
	ldr r0, _02247F3C ; =ov45_022559B8
	ldr r1, _02247F40 ; =ov45_02255918
	ldr r2, _02247F44 ; =ov45_02255844
	ldr r3, _02247F48 ; =0x000001A9
	bl __msl_assertion_failed
_02247EBC:
	cmp r4, #0
	bne _02247ED8
	ldr r0, _02247F4C ; =ov45_022559D4
	ldr r1, _02247F40 ; =ov45_02255918
	ldr r2, _02247F44 ; =ov45_02255844
	ldr r3, _02247F50 ; =0x000001AB
	bl __msl_assertion_failed
_02247ED8:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _02247EF8
	ldr r0, _02247F54 ; =ov45_022559E4
	ldr r1, _02247F40 ; =ov45_02255918
	ldr r2, _02247F44 ; =ov45_02255844
	ldr r3, _02247F50 ; =0x000001AB
	bl __msl_assertion_failed
_02247EF8:
	mov r0, r4
	bl strlen
	ldr r3, _02247F58 ; =0x00000101
	cmp r0, r3
	blo _02247F20
	ldr r0, _02247F5C ; =ov45_022559F8
	ldr r1, _02247F40 ; =ov45_02255918
	ldr r2, _02247F44 ; =ov45_02255844
	add r3, r3, #0xaa
	bl __msl_assertion_failed
_02247F20:
	mov r0, r5
	mov r1, r4
	bl ov45_022475B8
	cmp r0, #0
	moveq r0, #0
	addne r0, r0, #0x104
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02247F3C: .word ov45_022559B8
_02247F40: .word ov45_02255918
_02247F44: .word ov45_02255844
_02247F48: .word 0x000001A9
_02247F4C: .word ov45_022559D4
_02247F50: .word 0x000001AB
_02247F54: .word ov45_022559E4
_02247F58: .word 0x00000101
_02247F5C: .word ov45_022559F8
	arm_func_end ov45_02247E98

	arm_func_start ov45_02247F60
ov45_02247F60: ; 0x02247F60
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _02247F84
	ldr r0, _022480B8 ; =ov45_02255938
	ldr r1, _022480BC ; =ov45_02255918
	ldr r2, _022480C0 ; =ov45_0225585C
	mov r3, #0x1bc
	bl __msl_assertion_failed
_02247F84:
	cmp r4, #0
	bne _02247FA0
	ldr r0, _022480C4 ; =ov45_02255A30
	ldr r1, _022480BC ; =ov45_02255918
	ldr r2, _022480C0 ; =ov45_0225585C
	ldr r3, _022480C8 ; =0x000001BD
	bl __msl_assertion_failed
_02247FA0:
	cmp r5, #0
	bne _02247FBC
	ldr r0, _022480CC ; =ov45_02255A44
	ldr r1, _022480BC ; =ov45_02255918
	ldr r2, _022480C0 ; =ov45_0225585C
	ldr r3, _022480D0 ; =0x000001C2
	bl __msl_assertion_failed
_02247FBC:
	ldrsb r0, [r5]
	cmp r0, #0
	bne _02247FDC
	ldr r0, _022480D4 ; =ov45_02255A58
	ldr r1, _022480BC ; =ov45_02255918
	ldr r2, _022480C0 ; =ov45_0225585C
	ldr r3, _022480D0 ; =0x000001C2
	bl __msl_assertion_failed
_02247FDC:
	mov r0, r5
	bl strlen
	cmp r0, #0x80
	blo _02248000
	ldr r0, _022480D8 ; =ov45_02255A70
	ldr r1, _022480BC ; =ov45_02255918
	ldr r2, _022480C0 ; =ov45_0225585C
	ldr r3, _022480D0 ; =0x000001C2
	bl __msl_assertion_failed
_02248000:
	ldr r0, [r4, #4]
	cmp r0, #0
	bge _02248020
	ldr r0, _022480DC ; =ov45_02255A90
	ldr r1, _022480BC ; =ov45_02255918
	ldr r2, _022480C0 ; =ov45_0225585C
	ldr r3, _022480E0 ; =0x000001C7
	bl __msl_assertion_failed
_02248020:
	ldr r1, [r4, #4]
	ldr r0, [r4, #8]
	add r1, r1, #1
	mov r1, r1, lsl #2
	bl ov00_021EC3BC
	cmp r0, #0
	bne _02248054
	ldr r0, _022480E4 ; =ov45_02255AA4
	ldr r1, _022480BC ; =ov45_02255918
	ldr r2, _022480C0 ; =ov45_0225585C
	ldr r3, _022480E8 ; =0x000001D9
	bl __msl_assertion_failed
	ldmia sp!, {r3, r4, r5, pc}
_02248054:
	str r0, [r4, #8]
	ldr r1, [r4, #4]
	ldr r0, [r4, #0xc]
	add r1, r1, #1
	mov r1, r1, lsl #2
	bl ov00_021EC3BC
	cmp r0, #0
	bne _0224808C
	ldr r0, _022480E4 ; =ov45_02255AA4
	ldr r1, _022480BC ; =ov45_02255918
	ldr r2, _022480C0 ; =ov45_0225585C
	mov r3, #0x1e0
	bl __msl_assertion_failed
	ldmia sp!, {r3, r4, r5, pc}
_0224808C:
	str r0, [r4, #0xc]
	ldmib r4, {r0, r1}
	str r5, [r1, r0, lsl #2]
	ldr r2, [r5, #0xdc]
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #4]
	str r2, [r1, r0, lsl #2]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022480B8: .word ov45_02255938
_022480BC: .word ov45_02255918
_022480C0: .word ov45_0225585C
_022480C4: .word ov45_02255A30
_022480C8: .word 0x000001BD
_022480CC: .word ov45_02255A44
_022480D0: .word 0x000001C2
_022480D4: .word ov45_02255A58
_022480D8: .word ov45_02255A70
_022480DC: .word ov45_02255A90
_022480E0: .word 0x000001C7
_022480E4: .word ov45_02255AA4
_022480E8: .word 0x000001D9
	arm_func_end ov45_02247F60

	arm_func_start ov45_022480EC
ov45_022480EC: ; 0x022480EC
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	movs r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bne _0224811C
	ldr r0, _0224820C ; =ov45_022559B8
	ldr r1, _02248210 ; =ov45_02255918
	ldr r2, _02248214 ; =ov45_02255778
	mov r3, #0x1f0
	bl __msl_assertion_failed
_0224811C:
	cmp r6, #0
	bne _02248138
	ldr r0, _02248218 ; =ov45_022559D4
	ldr r1, _02248210 ; =ov45_02255918
	ldr r2, _02248214 ; =ov45_02255778
	ldr r3, _0224821C ; =0x000001F2
	bl __msl_assertion_failed
_02248138:
	ldrsb r0, [r6]
	cmp r0, #0
	bne _02248158
	ldr r0, _02248220 ; =ov45_022559E4
	ldr r1, _02248210 ; =ov45_02255918
	ldr r2, _02248214 ; =ov45_02255778
	ldr r3, _0224821C ; =0x000001F2
	bl __msl_assertion_failed
_02248158:
	mov r0, r6
	bl strlen
	ldr r3, _02248224 ; =0x00000101
	cmp r0, r3
	blo _02248180
	ldr r0, _02248228 ; =ov45_022559F8
	ldr r1, _02248210 ; =ov45_02255918
	ldr r2, _02248214 ; =ov45_02255778
	add r3, r3, #0xf1
	bl __msl_assertion_failed
_02248180:
	cmp r5, #0
	bne _0224819C
	ldr r0, _0224822C ; =ov45_02255AA8
	ldr r1, _02248210 ; =ov45_02255918
	ldr r2, _02248214 ; =ov45_02255778
	ldr r3, _02248230 ; =0x000001F3
	bl __msl_assertion_failed
_0224819C:
	mov r0, r7
	mov r1, r6
	bl ov45_022475B8
	cmp r0, #0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r1, #0
	str r7, [sp, #8]
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [r0, #0x134]
	ldr r1, _02248234 ; =ov45_02247F60
	add r2, sp, #8
	bl ov00_021FF160
	ldr r1, [sp, #0x14]
	mov r0, r7
	stmia sp, {r1, r4}
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	mov r1, r6
	blx r5
	ldr r0, [sp, #0x10]
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224820C: .word ov45_022559B8
_02248210: .word ov45_02255918
_02248214: .word ov45_02255778
_02248218: .word ov45_022559D4
_0224821C: .word 0x000001F2
_02248220: .word ov45_022559E4
_02248224: .word 0x00000101
_02248228: .word ov45_022559F8
_0224822C: .word ov45_02255AA8
_02248230: .word 0x000001F3
_02248234: .word ov45_02247F60
	arm_func_end ov45_022480EC

	arm_func_start ov45_02248238
ov45_02248238: ; 0x02248238
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _0224825C
	ldr r0, _02248278 ; =ov45_022559B8
	ldr r1, _0224827C ; =ov45_02255918
	ldr r2, _02248280 ; =ov45_0225565C
	ldr r3, _02248284 ; =0x0000020F
	bl __msl_assertion_failed
_0224825C:
	mov r0, r5
	mov r1, r4
	bl ov45_022475B8
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02248278: .word ov45_022559B8
_0224827C: .word ov45_02255918
_02248280: .word ov45_0225565C
_02248284: .word 0x0000020F
	arm_func_end ov45_02248238

	arm_func_start ov45_02248288
ov45_02248288: ; 0x02248288
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	bne _022482B0
	ldr r0, _02248354 ; =ov45_022559B8
	ldr r1, _02248358 ; =ov45_02255918
	ldr r2, _0224835C ; =ov45_022556B0
	ldr r3, _02248360 ; =0x0000021A
	bl __msl_assertion_failed
_022482B0:
	cmp r5, #0
	bne _022482CC
	ldr r0, _02248364 ; =ov45_022559D4
	ldr r1, _02248358 ; =ov45_02255918
	ldr r2, _0224835C ; =ov45_022556B0
	mov r3, #0x21c
	bl __msl_assertion_failed
_022482CC:
	ldrsb r0, [r5]
	cmp r0, #0
	bne _022482EC
	ldr r0, _02248368 ; =ov45_022559E4
	ldr r1, _02248358 ; =ov45_02255918
	ldr r2, _0224835C ; =ov45_022556B0
	mov r3, #0x21c
	bl __msl_assertion_failed
_022482EC:
	mov r0, r5
	bl strlen
	ldr r1, _0224836C ; =0x00000101
	cmp r0, r1
	blo _02248314
	ldr r0, _02248370 ; =ov45_022559F8
	ldr r1, _02248358 ; =ov45_02255918
	ldr r2, _0224835C ; =ov45_022556B0
	mov r3, #0x21c
	bl __msl_assertion_failed
_02248314:
	mov r0, r6
	mov r1, r5
	bl ov45_022475B8
	movs r1, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r1, #0x158]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r0, r4
	add r1, r1, #0x138
	mov r2, #0x20
	bl memcpy
	mov r0, #1
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02248354: .word ov45_022559B8
_02248358: .word ov45_02255918
_0224835C: .word ov45_022556B0
_02248360: .word 0x0000021A
_02248364: .word ov45_022559D4
_02248368: .word ov45_022559E4
_0224836C: .word 0x00000101
_02248370: .word ov45_022559F8
	arm_func_end ov45_02248288

	arm_func_start ov45_02248374
ov45_02248374: ; 0x02248374
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	bne _0224839C
	ldr r0, _02248430 ; =ov45_022559B8
	ldr r1, _02248434 ; =ov45_02255918
	ldr r2, _02248438 ; =ov45_02255688
	ldr r3, _0224843C ; =0x00000233
	bl __msl_assertion_failed
_0224839C:
	cmp r5, #0
	bne _022483B8
	ldr r0, _02248440 ; =ov45_022559D4
	ldr r1, _02248434 ; =ov45_02255918
	ldr r2, _02248438 ; =ov45_02255688
	ldr r3, _02248444 ; =0x00000235
	bl __msl_assertion_failed
_022483B8:
	ldrsb r0, [r5]
	cmp r0, #0
	bne _022483D8
	ldr r0, _02248448 ; =ov45_022559E4
	ldr r1, _02248434 ; =ov45_02255918
	ldr r2, _02248438 ; =ov45_02255688
	ldr r3, _02248444 ; =0x00000235
	bl __msl_assertion_failed
_022483D8:
	mov r0, r5
	bl strlen
	ldr r3, _0224844C ; =0x00000101
	cmp r0, r3
	blo _02248400
	ldr r0, _02248450 ; =ov45_022559F8
	ldr r1, _02248434 ; =ov45_02255918
	ldr r2, _02248438 ; =ov45_02255688
	add r3, r3, #0x134
	bl __msl_assertion_failed
_02248400:
	mov r0, r6
	mov r1, r5
	bl ov45_022475B8
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r1, #1
	str r1, [r0, #0x158]
	mov r1, r4
	add r0, r0, #0x138
	mov r2, #0x20
	bl memcpy
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02248430: .word ov45_022559B8
_02248434: .word ov45_02255918
_02248438: .word ov45_02255688
_0224843C: .word 0x00000233
_02248440: .word ov45_022559D4
_02248444: .word 0x00000235
_02248448: .word ov45_022559E4
_0224844C: .word 0x00000101
_02248450: .word ov45_022559F8
	arm_func_end ov45_02248374

	arm_func_start ov45_02248454
ov45_02248454: ; 0x02248454
	stmdb sp!, {r4, r5, r6, lr}
	movs r5, r0
	mov r4, r1
	mov r6, r2
	bne _0224847C
	ldr r0, _02248534 ; =ov45_022559B8
	ldr r1, _02248538 ; =ov45_02255918
	ldr r2, _0224853C ; =ov45_022557CC
	ldr r3, _02248540 ; =0x0000024A
	bl __msl_assertion_failed
_0224847C:
	cmp r4, #0
	bne _02248498
	ldr r0, _02248544 ; =ov45_022559D4
	ldr r1, _02248538 ; =ov45_02255918
	ldr r2, _0224853C ; =ov45_022557CC
	mov r3, #0x24c
	bl __msl_assertion_failed
_02248498:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _022484B8
	ldr r0, _02248548 ; =ov45_022559E4
	ldr r1, _02248538 ; =ov45_02255918
	ldr r2, _0224853C ; =ov45_022557CC
	mov r3, #0x24c
	bl __msl_assertion_failed
_022484B8:
	mov r0, r4
	bl strlen
	ldr r1, _0224854C ; =0x00000101
	cmp r0, r1
	blo _022484E0
	ldr r0, _02248550 ; =ov45_022559F8
	ldr r1, _02248538 ; =ov45_02255918
	ldr r2, _0224853C ; =ov45_022557CC
	mov r3, #0x24c
	bl __msl_assertion_failed
_022484E0:
	mov r0, r5
	mov r1, r4
	bl ov45_022475B8
	movs r5, r0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r5, #0x15c]
	bl ov00_021EC3D8
	cmp r6, #0
	ldreq r6, _02248554 ; =ov45_02255A2C
	mov r0, r6
	bl strlen
	mov r4, r0
	add r0, r4, #1
	bl ov00_021EC3A8
	str r0, [r5, #0x15c]
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r1, r6
	add r2, r4, #1
	bl memcpy
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02248534: .word ov45_022559B8
_02248538: .word ov45_02255918
_0224853C: .word ov45_022557CC
_02248540: .word 0x0000024A
_02248544: .word ov45_022559D4
_02248548: .word ov45_022559E4
_0224854C: .word 0x00000101
_02248550: .word ov45_022559F8
_02248554: .word ov45_02255A2C
	arm_func_end ov45_02248454

	arm_func_start ov45_02248558
ov45_02248558: ; 0x02248558
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _0224857C
	ldr r0, _022485FC ; =ov45_022559B8
	ldr r1, _02248600 ; =ov45_02255918
	ldr r2, _02248604 ; =ov45_022557E4
	mov r3, #0x278
	bl __msl_assertion_failed
_0224857C:
	cmp r4, #0
	bne _02248598
	ldr r0, _02248608 ; =ov45_022559D4
	ldr r1, _02248600 ; =ov45_02255918
	ldr r2, _02248604 ; =ov45_022557E4
	ldr r3, _0224860C ; =0x0000027A
	bl __msl_assertion_failed
_02248598:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _022485B8
	ldr r0, _02248610 ; =ov45_022559E4
	ldr r1, _02248600 ; =ov45_02255918
	ldr r2, _02248604 ; =ov45_022557E4
	ldr r3, _0224860C ; =0x0000027A
	bl __msl_assertion_failed
_022485B8:
	mov r0, r4
	bl strlen
	ldr r1, _02248614 ; =0x00000101
	cmp r0, r1
	blo _022485E0
	ldr r0, _02248618 ; =ov45_022559F8
	ldr r1, _02248600 ; =ov45_02255918
	ldr r2, _02248604 ; =ov45_022557E4
	ldr r3, _0224860C ; =0x0000027A
	bl __msl_assertion_failed
_022485E0:
	mov r0, r5
	mov r1, r4
	bl ov45_022475B8
	cmp r0, #0
	movne r1, #1
	strne r1, [r0, #0x160]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022485FC: .word ov45_022559B8
_02248600: .word ov45_02255918
_02248604: .word ov45_022557E4
_02248608: .word ov45_022559D4
_0224860C: .word 0x0000027A
_02248610: .word ov45_022559E4
_02248614: .word 0x00000101
_02248618: .word ov45_022559F8
	arm_func_end ov45_02248558

	arm_func_start ov45_0224861C
ov45_0224861C: ; 0x0224861C
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _02248640
	ldr r0, _022486C0 ; =ov45_022559B8
	ldr r1, _022486C4 ; =ov45_02255918
	ldr r2, _022486C8 ; =ov45_022558A4
	ldr r3, _022486CC ; =0x0000028A
	bl __msl_assertion_failed
_02248640:
	cmp r4, #0
	bne _0224865C
	ldr r0, _022486D0 ; =ov45_022559D4
	ldr r1, _022486C4 ; =ov45_02255918
	ldr r2, _022486C8 ; =ov45_022558A4
	mov r3, #0x28c
	bl __msl_assertion_failed
_0224865C:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _0224867C
	ldr r0, _022486D4 ; =ov45_022559E4
	ldr r1, _022486C4 ; =ov45_02255918
	ldr r2, _022486C8 ; =ov45_022558A4
	mov r3, #0x28c
	bl __msl_assertion_failed
_0224867C:
	mov r0, r4
	bl strlen
	ldr r1, _022486D8 ; =0x00000101
	cmp r0, r1
	blo _022486A4
	ldr r0, _022486DC ; =ov45_022559F8
	ldr r1, _022486C4 ; =ov45_02255918
	ldr r2, _022486C8 ; =ov45_022558A4
	mov r3, #0x28c
	bl __msl_assertion_failed
_022486A4:
	mov r0, r5
	mov r1, r4
	bl ov45_022475B8
	cmp r0, #0
	moveq r0, #0
	ldrne r0, [r0, #0x160]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022486C0: .word ov45_022559B8
_022486C4: .word ov45_02255918
_022486C8: .word ov45_022558A4
_022486CC: .word 0x0000028A
_022486D0: .word ov45_022559D4
_022486D4: .word ov45_022559E4
_022486D8: .word 0x00000101
_022486DC: .word ov45_022559F8
	arm_func_end ov45_0224861C

	arm_func_start ov45_022486E0
ov45_022486E0: ; 0x022486E0
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r0
	mov r4, r1
	mov r5, r2
	bne _02248708
	ldr r0, _0224879C ; =ov45_022559B8
	ldr r1, _022487A0 ; =ov45_02255918
	ldr r2, _022487A4 ; =ov45_02255728
	ldr r3, _022487A8 ; =0x0000029A
	bl __msl_assertion_failed
_02248708:
	cmp r4, #0
	bne _02248724
	ldr r0, _022487AC ; =ov45_022559D4
	ldr r1, _022487A0 ; =ov45_02255918
	ldr r2, _022487A4 ; =ov45_02255728
	mov r3, #0x29c
	bl __msl_assertion_failed
_02248724:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _02248744
	ldr r0, _022487B0 ; =ov45_022559E4
	ldr r1, _022487A0 ; =ov45_02255918
	ldr r2, _022487A4 ; =ov45_02255728
	mov r3, #0x29c
	bl __msl_assertion_failed
_02248744:
	mov r0, r4
	bl strlen
	ldr r1, _022487B4 ; =0x00000101
	cmp r0, r1
	blo _0224876C
	ldr r0, _022487B8 ; =ov45_022559F8
	ldr r1, _022487A0 ; =ov45_02255918
	ldr r2, _022487A4 ; =ov45_02255728
	mov r3, #0x29c
	bl __msl_assertion_failed
_0224876C:
	mov r0, r6
	mov r1, r4
	bl ov45_022475B8
	movs r4, r0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r1, r5
	add r0, r4, #0x164
	mov r2, #0x80
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x1e3]
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0224879C: .word ov45_022559B8
_022487A0: .word ov45_02255918
_022487A4: .word ov45_02255728
_022487A8: .word 0x0000029A
_022487AC: .word ov45_022559D4
_022487B0: .word ov45_022559E4
_022487B4: .word 0x00000101
_022487B8: .word ov45_022559F8
	arm_func_end ov45_022486E0

	arm_func_start ov45_022487BC
ov45_022487BC: ; 0x022487BC
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _022487E0
	ldr r0, _02248868 ; =ov45_022559B8
	ldr r1, _0224886C ; =ov45_02255918
	ldr r2, _02248870 ; =ov45_02255814
	mov r3, #0x2bc
	bl __msl_assertion_failed
_022487E0:
	cmp r4, #0
	bne _022487FC
	ldr r0, _02248874 ; =ov45_022559D4
	ldr r1, _0224886C ; =ov45_02255918
	ldr r2, _02248870 ; =ov45_02255814
	ldr r3, _02248878 ; =0x000002BE
	bl __msl_assertion_failed
_022487FC:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _0224881C
	ldr r0, _0224887C ; =ov45_022559E4
	ldr r1, _0224886C ; =ov45_02255918
	ldr r2, _02248870 ; =ov45_02255814
	ldr r3, _02248878 ; =0x000002BE
	bl __msl_assertion_failed
_0224881C:
	mov r0, r4
	bl strlen
	ldr r1, _02248880 ; =0x00000101
	cmp r0, r1
	blo _02248844
	ldr r0, _02248884 ; =ov45_022559F8
	ldr r1, _0224886C ; =ov45_02255918
	ldr r2, _02248870 ; =ov45_02255814
	ldr r3, _02248878 ; =0x000002BE
	bl __msl_assertion_failed
_02248844:
	mov r0, r5
	mov r1, r4
	bl ov45_022475B8
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r0, [r0, #0x134]
	bl ov00_021FEF00
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02248868: .word ov45_022559B8
_0224886C: .word ov45_02255918
_02248870: .word ov45_02255814
_02248874: .word ov45_022559D4
_02248878: .word 0x000002BE
_0224887C: .word ov45_022559E4
_02248880: .word 0x00000101
_02248884: .word ov45_022559F8
	arm_func_end ov45_022487BC

	arm_func_start ov45_02248888
ov45_02248888: ; 0x02248888
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0xe0
	movs r7, r0
	mov r6, r1
	mov r4, r2
	mov r5, r3
	bne _022488B8
	ldr r0, _02248A64 ; =ov45_022559B8
	ldr r1, _02248A68 ; =ov45_02255918
	ldr r2, _02248A6C ; =ov45_0225582C
	mov r3, #0x2d0
	bl __msl_assertion_failed
_022488B8:
	cmp r6, #0
	bne _022488D4
	ldr r0, _02248A70 ; =ov45_02255ABC
	ldr r1, _02248A68 ; =ov45_02255918
	ldr r2, _02248A6C ; =ov45_0225582C
	ldr r3, _02248A74 ; =0x000002D2
	bl __msl_assertion_failed
_022488D4:
	ldrsb r0, [r6]
	cmp r0, #0
	bne _022488F4
	ldr r0, _02248A78 ; =ov45_02255ACC
	ldr r1, _02248A68 ; =ov45_02255918
	ldr r2, _02248A6C ; =ov45_0225582C
	ldr r3, _02248A74 ; =0x000002D2
	bl __msl_assertion_failed
_022488F4:
	mov r0, r6
	bl strlen
	cmp r0, #0x80
	blo _02248918
	ldr r0, _02248A7C ; =ov45_02255ADC
	ldr r1, _02248A68 ; =ov45_02255918
	ldr r2, _02248A6C ; =ov45_0225582C
	ldr r3, _02248A74 ; =0x000002D2
	bl __msl_assertion_failed
_02248918:
	cmp r4, #0
	bne _02248934
	ldr r0, _02248A80 ; =ov45_022559D4
	ldr r1, _02248A68 ; =ov45_02255918
	ldr r2, _02248A6C ; =ov45_0225582C
	ldr r3, _02248A84 ; =0x000002D3
	bl __msl_assertion_failed
_02248934:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _02248954
	ldr r0, _02248A88 ; =ov45_022559E4
	ldr r1, _02248A68 ; =ov45_02255918
	ldr r2, _02248A6C ; =ov45_0225582C
	ldr r3, _02248A84 ; =0x000002D3
	bl __msl_assertion_failed
_02248954:
	cmp r5, #0
	blt _02248964
	cmp r5, #3
	ble _02248978
_02248964:
	ldr r0, _02248A8C ; =ov45_02255AF4
	ldr r1, _02248A68 ; =ov45_02255918
	ldr r2, _02248A6C ; =ov45_0225582C
	mov r3, #0x2d4
	bl __msl_assertion_failed
_02248978:
	mov r0, r7
	mov r1, r4
	bl ov45_022475B8
	movs r4, r0
	addeq sp, sp, #0xe0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, #0
	add lr, sp, #0
	mov r1, r0
	mov r2, r0
	mov r3, r0
	mov ip, #7
_022489A8:
	stmia lr!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	subs ip, ip, #1
	bne _022489A8
	add r0, sp, #0
	mov r1, r6
	mov r2, #0x80
	bl strncpy
	ldr r1, [sp, #0xf8]
	mov r0, #0
	strb r0, [sp, #0x7f]
	cmp r1, #0
	ldrne r0, [sp, #0xfc]
	cmpne r0, #0
	moveq r0, #0
	streq r0, [sp, #0xd8]
	beq _02248A20
	add r0, sp, #0x80
	mov r2, #0x18
	bl strncpy
	mov r3, #0
	ldr r1, [sp, #0xfc]
	add r0, sp, #0x98
	mov r2, #0x40
	strb r3, [sp, #0x97]
	bl strncpy
	mov r1, #0
	mov r0, #1
	strb r1, [sp, #0xd7]
	str r0, [sp, #0xd8]
_02248A20:
	str r5, [sp, #0xdc]
	ldr r0, [r4, #0x134]
	add r1, sp, #0
	bl ov00_021FEF74
	ldr r0, [r4, #0x134]
	add r1, sp, #0
	bl ov00_021FF0C0
	cmp r0, #0
	addne sp, sp, #0xe0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, _02248A90 ; =ov45_02255B10
	ldr r1, _02248A68 ; =ov45_02255918
	ldr r2, _02248A6C ; =ov45_0225582C
	ldr r3, _02248A94 ; =0x000002F7
	bl __msl_assertion_failed
	add sp, sp, #0xe0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02248A64: .word ov45_022559B8
_02248A68: .word ov45_02255918
_02248A6C: .word ov45_0225582C
_02248A70: .word ov45_02255ABC
_02248A74: .word 0x000002D2
_02248A78: .word ov45_02255ACC
_02248A7C: .word ov45_02255ADC
_02248A80: .word ov45_022559D4
_02248A84: .word 0x000002D3
_02248A88: .word ov45_022559E4
_02248A8C: .word ov45_02255AF4
_02248A90: .word ov45_02255B10
_02248A94: .word 0x000002F7
	arm_func_end ov45_02248888

	arm_func_start ov45_02248A98
ov45_02248A98: ; 0x02248A98
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0xe0
	movs r6, r0
	mov r5, r1
	mov r4, r2
	bne _02248AC4
	ldr r0, _02248BA4 ; =ov45_022559B8
	ldr r1, _02248BA8 ; =ov45_02255918
	ldr r2, _02248BAC ; =ov45_022556EC
	ldr r3, _02248BB0 ; =0x000002FE
	bl __msl_assertion_failed
_02248AC4:
	cmp r5, #0
	bne _02248AE0
	ldr r0, _02248BB4 ; =ov45_02255B44
	ldr r1, _02248BA8 ; =ov45_02255918
	ldr r2, _02248BAC ; =ov45_022556EC
	mov r3, #0x300
	bl __msl_assertion_failed
_02248AE0:
	ldrsb r0, [r5]
	cmp r0, #0
	bne _02248B00
	ldr r0, _02248BB8 ; =ov45_02255B54
	ldr r1, _02248BA8 ; =ov45_02255918
	ldr r2, _02248BAC ; =ov45_022556EC
	mov r3, #0x300
	bl __msl_assertion_failed
_02248B00:
	mov r0, r5
	bl strlen
	cmp r0, #0x80
	blo _02248B24
	ldr r0, _02248BBC ; =ov45_02255B64
	ldr r1, _02248BA8 ; =ov45_02255918
	ldr r2, _02248BAC ; =ov45_022556EC
	mov r3, #0x300
	bl __msl_assertion_failed
_02248B24:
	cmp r4, #0
	bne _02248B40
	ldr r0, _02248BC0 ; =ov45_022559D4
	ldr r1, _02248BA8 ; =ov45_02255918
	ldr r2, _02248BAC ; =ov45_022556EC
	ldr r3, _02248BC4 ; =0x00000301
	bl __msl_assertion_failed
_02248B40:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _02248B60
	ldr r0, _02248BC8 ; =ov45_022559E4
	ldr r1, _02248BA8 ; =ov45_02255918
	ldr r2, _02248BAC ; =ov45_022556EC
	ldr r3, _02248BC4 ; =0x00000301
	bl __msl_assertion_failed
_02248B60:
	mov r0, r6
	mov r1, r4
	bl ov45_022475B8
	movs r4, r0
	addeq sp, sp, #0xe0
	ldmeqia sp!, {r4, r5, r6, pc}
	add r0, sp, #0
	mov r1, r5
	mov r2, #0x80
	bl strncpy
	mov r0, #0
	strb r0, [sp, #0x7f]
	ldr r0, [r4, #0x134]
	add r1, sp, #0
	bl ov00_021FF01C
	add sp, sp, #0xe0
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02248BA4: .word ov45_022559B8
_02248BA8: .word ov45_02255918
_02248BAC: .word ov45_022556EC
_02248BB0: .word 0x000002FE
_02248BB4: .word ov45_02255B44
_02248BB8: .word ov45_02255B54
_02248BBC: .word ov45_02255B64
_02248BC0: .word ov45_022559D4
_02248BC4: .word 0x00000301
_02248BC8: .word ov45_022559E4
	arm_func_end ov45_02248A98

	arm_func_start ov45_02248BCC
ov45_02248BCC: ; 0x02248BCC
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r0
	mov r5, r1
	bne _02248BF0
	ldr r0, _02248CB8 ; =ov45_02255938
	ldr r1, _02248CBC ; =ov45_02255918
	ldr r2, _02248CC0 ; =ov45_0225588C
	mov r3, #0x318
	bl __msl_assertion_failed
_02248BF0:
	cmp r5, #0
	bne _02248C0C
	ldr r0, _02248CC4 ; =ov45_02255A30
	ldr r1, _02248CBC ; =ov45_02255918
	ldr r2, _02248CC0 ; =ov45_0225588C
	ldr r3, _02248CC8 ; =0x00000319
	bl __msl_assertion_failed
_02248C0C:
	ldr r0, [r4, #0x134]
	cmp r0, #0
	bne _02248C2C
	ldr r0, _02248CCC ; =ov45_02255B7C
	ldr r1, _02248CBC ; =ov45_02255918
	ldr r2, _02248CC0 ; =ov45_0225588C
	ldr r3, _02248CD0 ; =0x0000031E
	bl __msl_assertion_failed
_02248C2C:
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _02248C4C
	ldr r0, _02248CD4 ; =ov45_02255B94
	ldr r1, _02248CBC ; =ov45_02255918
	ldr r2, _02248CC0 ; =ov45_0225588C
	ldr r3, _02248CD8 ; =0x00000323
	bl __msl_assertion_failed
_02248C4C:
	ldr r0, [r5, #4]
	ldrsb r0, [r0]
	cmp r0, #0
	bne _02248C70
	ldr r0, _02248CDC ; =ov45_02255BA8
	ldr r1, _02248CBC ; =ov45_02255918
	ldr r2, _02248CC0 ; =ov45_0225588C
	mov r3, #0x324
	bl __msl_assertion_failed
_02248C70:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _02248C90
	ldr r0, _02248CE0 ; =ov45_02255BC4
	ldr r1, _02248CBC ; =ov45_02255918
	ldr r2, _02248CC0 ; =ov45_0225588C
	ldr r3, _02248CE4 ; =0x00000325
	bl __msl_assertion_failed
_02248C90:
	ldr r0, [r4, #0x134]
	ldr r1, [r5, #4]
	bl ov00_021FF0C0
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, [r5, #0xc]
	mov r2, r4
	ldmia r5, {r0, r1, ip}
	blx ip
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02248CB8: .word ov45_02255938
_02248CBC: .word ov45_02255918
_02248CC0: .word ov45_0225588C
_02248CC4: .word ov45_02255A30
_02248CC8: .word 0x00000319
_02248CCC: .word ov45_02255B7C
_02248CD0: .word 0x0000031E
_02248CD4: .word ov45_02255B94
_02248CD8: .word 0x00000323
_02248CDC: .word ov45_02255BA8
_02248CE0: .word ov45_02255BC4
_02248CE4: .word 0x00000325
	arm_func_end ov45_02248BCC

	arm_func_start ov45_02248CE8
ov45_02248CE8: ; 0x02248CE8
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0xf0
	movs r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bne _02248D18
	ldr r0, _02248DD8 ; =ov45_022559B8
	ldr r1, _02248DDC ; =ov45_02255918
	ldr r2, _02248DE0 ; =ov45_02255750
	ldr r3, _02248DE4 ; =0x00000336
	bl __msl_assertion_failed
_02248D18:
	cmp r6, #0
	bne _02248D34
	ldr r0, _02248DE8 ; =ov45_02255B44
	ldr r1, _02248DDC ; =ov45_02255918
	ldr r2, _02248DE0 ; =ov45_02255750
	mov r3, #0x338
	bl __msl_assertion_failed
_02248D34:
	ldrsb r0, [r6]
	cmp r0, #0
	bne _02248D54
	ldr r0, _02248DEC ; =ov45_02255B54
	ldr r1, _02248DDC ; =ov45_02255918
	ldr r2, _02248DE0 ; =ov45_02255750
	mov r3, #0x338
	bl __msl_assertion_failed
_02248D54:
	mov r0, r6
	bl strlen
	cmp r0, #0x80
	blo _02248D78
	ldr r0, _02248DF0 ; =ov45_02255B64
	ldr r1, _02248DDC ; =ov45_02255918
	ldr r2, _02248DE0 ; =ov45_02255750
	mov r3, #0x338
	bl __msl_assertion_failed
_02248D78:
	cmp r5, #0
	bne _02248D94
	ldr r0, _02248DF4 ; =ov45_02255AA8
	ldr r1, _02248DDC ; =ov45_02255918
	ldr r2, _02248DE0 ; =ov45_02255750
	ldr r3, _02248DF8 ; =0x00000339
	bl __msl_assertion_failed
_02248D94:
	add r0, sp, #0x10
	mov r1, r6
	mov r2, #0x80
	bl strncpy
	mov r1, #0
	add r0, sp, #0x10
	strb r1, [sp, #0x8f]
	str r7, [sp]
	str r5, [sp, #8]
	str r4, [sp, #0xc]
	str r0, [sp, #4]
	ldr r0, [r7, #0x80c]
	ldr r1, _02248DFC ; =ov45_02248BCC
	add r2, sp, #0
	bl ov00_021FF160
	add sp, sp, #0xf0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02248DD8: .word ov45_022559B8
_02248DDC: .word ov45_02255918
_02248DE0: .word ov45_02255750
_02248DE4: .word 0x00000336
_02248DE8: .word ov45_02255B44
_02248DEC: .word ov45_02255B54
_02248DF0: .word ov45_02255B64
_02248DF4: .word ov45_02255AA8
_02248DF8: .word 0x00000339
_02248DFC: .word ov45_02248BCC
	arm_func_end ov45_02248CE8

	arm_func_start ov45_02248E00
ov45_02248E00: ; 0x02248E00
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xfc
	movs r5, r0
	mov r4, r1
	bne _02248E28
	ldr r0, _02249010 ; =ov45_02255938
	ldr r1, _02249014 ; =ov45_02255918
	ldr r2, _02249018 ; =ov45_0225578C
	ldr r3, _0224901C ; =0x0000034F
	bl __msl_assertion_failed
_02248E28:
	cmp r4, #0
	bne _02248E44
	ldr r0, _02249020 ; =ov45_02255A30
	ldr r1, _02249014 ; =ov45_02255918
	ldr r2, _02249018 ; =ov45_0225578C
	mov r3, #0x350
	bl __msl_assertion_failed
_02248E44:
	ldr r0, [r5, #0x134]
	cmp r0, #0
	bne _02248E64
	ldr r0, _02249024 ; =ov45_02255B7C
	ldr r1, _02249014 ; =ov45_02255918
	ldr r2, _02249018 ; =ov45_0225578C
	ldr r3, _02249028 ; =0x00000355
	bl __msl_assertion_failed
_02248E64:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _02248E84
	ldr r0, _0224902C ; =ov45_02255BDC
	ldr r1, _02249014 ; =ov45_02255918
	ldr r2, _02249018 ; =ov45_0225578C
	ldr r3, _02249030 ; =0x0000035A
	bl __msl_assertion_failed
_02248E84:
	ldr r0, [r4, #8]
	ldrsb r0, [r0]
	cmp r0, #0
	bne _02248EA8
	ldr r0, _02249034 ; =ov45_02255BF4
	ldr r1, _02249014 ; =ov45_02255918
	ldr r2, _02249018 ; =ov45_0225578C
	ldr r3, _02249030 ; =0x0000035A
	bl __msl_assertion_failed
_02248EA8:
	ldr r0, [r4, #8]
	bl strlen
	cmp r0, #0x80
	blo _02248ECC
	ldr r0, _02249038 ; =ov45_02255C10
	ldr r1, _02249014 ; =ov45_02255918
	ldr r2, _02249018 ; =ov45_0225578C
	ldr r3, _02249030 ; =0x0000035A
	bl __msl_assertion_failed
_02248ECC:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02248EEC
	ldr r0, _0224903C ; =ov45_02255C34
	ldr r1, _02249014 ; =ov45_02255918
	ldr r2, _02249018 ; =ov45_0225578C
	ldr r3, _02249040 ; =0x0000035B
	bl __msl_assertion_failed
_02248EEC:
	ldr r0, [r4, #4]
	ldrsb r0, [r0]
	cmp r0, #0
	bne _02248F10
	ldr r0, _02249044 ; =ov45_02255C4C
	ldr r1, _02249014 ; =ov45_02255918
	ldr r2, _02249018 ; =ov45_0225578C
	ldr r3, _02249040 ; =0x0000035B
	bl __msl_assertion_failed
_02248F10:
	ldr r0, [r4, #4]
	bl strlen
	cmp r0, #0x80
	blo _02248F34
	ldr r0, _02249048 ; =ov45_02255C68
	ldr r1, _02249014 ; =ov45_02255918
	ldr r2, _02249018 ; =ov45_0225578C
	ldr r3, _02249040 ; =0x0000035B
	bl __msl_assertion_failed
_02248F34:
	ldr r0, [r5, #0x134]
	ldr r1, [r4, #4]
	bl ov00_021FF0C0
	movs r6, r0
	addeq sp, sp, #0xfc
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	add r0, sp, #0x1c
	mov r1, r6
	mov r2, #0xe0
	bl memcpy
	ldr r0, [r5, #0x134]
	mov r1, r6
	bl ov00_021FF01C
	cmp r0, #0
	bne _02248F84
	ldr r0, _0224904C ; =ov45_02255C8C
	ldr r1, _02249014 ; =ov45_02255918
	ldr r2, _02249018 ; =ov45_0225578C
	ldr r3, _02249050 ; =0x00000367
	bl __msl_assertion_failed
_02248F84:
	ldr r1, [r4, #8]
	add r0, sp, #0x1c
	mov r2, #0x80
	bl strncpy
	mov r0, #0
	strb r0, [sp, #0x9b]
	ldr r0, [r5, #0x134]
	add r1, sp, #0x1c
	bl ov00_021FEF74
	ldr r0, [r4]
	mov r1, r5
	bl ov45_0224861C
	cmp r0, #0
	ldrne r0, [r5, #0x114]
	cmpne r0, #0
	addeq sp, sp, #0xfc
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	str r5, [sp, #0x10]
	ldr r0, [r4, #4]
	mov r1, #0
	str r0, [sp, #0x14]
	ldr r2, [r4, #8]
	mov r0, #0xc
	str r2, [sp, #0x18]
	ldr r2, [r5, #0x130]
	add r3, sp, #0x10
	str r2, [sp]
	stmib sp, {r1, r5}
	str r0, [sp, #0xc]
	ldr r0, [r4]
	ldr r2, [r5, #0x114]
	mov r1, #8
	bl ov45_02244D30
	add sp, sp, #0xfc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_02249010: .word ov45_02255938
_02249014: .word ov45_02255918
_02249018: .word ov45_0225578C
_0224901C: .word 0x0000034F
_02249020: .word ov45_02255A30
_02249024: .word ov45_02255B7C
_02249028: .word 0x00000355
_0224902C: .word ov45_02255BDC
_02249030: .word 0x0000035A
_02249034: .word ov45_02255BF4
_02249038: .word ov45_02255C10
_0224903C: .word ov45_02255C34
_02249040: .word 0x0000035B
_02249044: .word ov45_02255C4C
_02249048: .word ov45_02255C68
_0224904C: .word ov45_02255C8C
_02249050: .word 0x00000367
	arm_func_end ov45_02248E00

	arm_func_start ov45_02249054
ov45_02249054: ; 0x02249054
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	movs r6, r0
	mov r5, r1
	mov r4, r2
	bne _02249080
	ldr r0, _02249164 ; =ov45_022559B8
	ldr r1, _02249168 ; =ov45_02255918
	ldr r2, _0224916C ; =ov45_022556C4
	ldr r3, _02249170 ; =0x00000386
	bl __msl_assertion_failed
_02249080:
	cmp r5, #0
	bne _0224909C
	ldr r0, _02249174 ; =ov45_02255C98
	ldr r1, _02249168 ; =ov45_02255918
	ldr r2, _0224916C ; =ov45_022556C4
	mov r3, #0x388
	bl __msl_assertion_failed
_0224909C:
	ldrsb r0, [r5]
	cmp r0, #0
	bne _022490BC
	ldr r0, _02249178 ; =ov45_02255CA8
	ldr r1, _02249168 ; =ov45_02255918
	ldr r2, _0224916C ; =ov45_022556C4
	mov r3, #0x388
	bl __msl_assertion_failed
_022490BC:
	mov r0, r5
	bl strlen
	cmp r0, #0x80
	blo _022490E0
	ldr r0, _0224917C ; =ov45_02255CBC
	ldr r1, _02249168 ; =ov45_02255918
	ldr r2, _0224916C ; =ov45_022556C4
	mov r3, #0x388
	bl __msl_assertion_failed
_022490E0:
	cmp r4, #0
	bne _022490FC
	ldr r0, _02249180 ; =ov45_02255CD8
	ldr r1, _02249168 ; =ov45_02255918
	ldr r2, _0224916C ; =ov45_022556C4
	ldr r3, _02249184 ; =0x00000389
	bl __msl_assertion_failed
_022490FC:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _0224911C
	ldr r0, _02249188 ; =ov45_02255CE8
	ldr r1, _02249168 ; =ov45_02255918
	ldr r2, _0224916C ; =ov45_022556C4
	ldr r3, _02249184 ; =0x00000389
	bl __msl_assertion_failed
_0224911C:
	mov r0, r4
	bl strlen
	cmp r0, #0x80
	blo _02249140
	ldr r0, _0224918C ; =ov45_02255CFC
	ldr r1, _02249168 ; =ov45_02255918
	ldr r2, _0224916C ; =ov45_022556C4
	ldr r3, _02249184 ; =0x00000389
	bl __msl_assertion_failed
_02249140:
	str r6, [sp]
	str r5, [sp, #4]
	str r4, [sp, #8]
	ldr r0, [r6, #0x80c]
	ldr r1, _02249190 ; =ov45_02248E00
	add r2, sp, #0
	bl ov00_021FF160
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_02249164: .word ov45_022559B8
_02249168: .word ov45_02255918
_0224916C: .word ov45_022556C4
_02249170: .word 0x00000386
_02249174: .word ov45_02255C98
_02249178: .word ov45_02255CA8
_0224917C: .word ov45_02255CBC
_02249180: .word ov45_02255CD8
_02249184: .word 0x00000389
_02249188: .word ov45_02255CE8
_0224918C: .word ov45_02255CFC
_02249190: .word ov45_02248E00
	arm_func_end ov45_02249054

	arm_func_start ov45_02249194
ov45_02249194: ; 0x02249194
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x2e0
	movs r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bne _022491C4
	ldr r0, _02249358 ; =ov45_022559B8
	ldr r1, _0224935C ; =ov45_02255918
	ldr r2, _02249360 ; =ov45_022556D8
	ldr r3, _02249364 ; =0x0000039B
	bl __msl_assertion_failed
_022491C4:
	cmp r7, #0
	bne _022491E0
	ldr r0, _02249368 ; =ov45_02255B44
	ldr r1, _0224935C ; =ov45_02255918
	ldr r2, _02249360 ; =ov45_022556D8
	ldr r3, _0224936C ; =0x0000039D
	bl __msl_assertion_failed
_022491E0:
	ldrsb r0, [r7]
	cmp r0, #0
	bne _02249200
	ldr r0, _02249370 ; =ov45_02255B54
	ldr r1, _0224935C ; =ov45_02255918
	ldr r2, _02249360 ; =ov45_022556D8
	ldr r3, _0224936C ; =0x0000039D
	bl __msl_assertion_failed
_02249200:
	mov r0, r7
	bl strlen
	cmp r0, #0x80
	blo _02249224
	ldr r0, _02249374 ; =ov45_02255B64
	ldr r1, _0224935C ; =ov45_02255918
	ldr r2, _02249360 ; =ov45_022556D8
	ldr r3, _0224936C ; =0x0000039D
	bl __msl_assertion_failed
_02249224:
	cmp r6, #0
	bne _02249240
	ldr r0, _02249378 ; =ov45_022559D4
	ldr r1, _0224935C ; =ov45_02255918
	ldr r2, _02249360 ; =ov45_022556D8
	ldr r3, _0224937C ; =0x0000039E
	bl __msl_assertion_failed
_02249240:
	ldrsb r0, [r6]
	cmp r0, #0
	bne _02249260
	ldr r0, _02249380 ; =ov45_022559E4
	ldr r1, _0224935C ; =ov45_02255918
	ldr r2, _02249360 ; =ov45_022556D8
	ldr r3, _0224937C ; =0x0000039E
	bl __msl_assertion_failed
_02249260:
	cmp r5, #0
	blt _02249270
	cmp r5, #3
	ble _02249284
_02249270:
	ldr r0, _02249384 ; =ov45_02255AF4
	ldr r1, _0224935C ; =ov45_02255918
	ldr r2, _02249360 ; =ov45_022556D8
	ldr r3, _02249388 ; =0x0000039F
	bl __msl_assertion_failed
_02249284:
	ldr r2, _0224938C ; =0x00000101
	add r0, sp, #0xfc
	mov r1, r6
	bl strncpy
	mov r0, #0
	strb r0, [sp, #0x1fc]
	ldr r0, [r8, #0x80c]
	add r1, sp, #0xfc
	bl ov00_021FF0C0
	movs r4, r0
	addeq sp, sp, #0x2e0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	add r0, sp, #0x1c
	mov r1, r7
	mov r2, #0x80
	bl strncpy
	mov r0, #0
	strb r0, [sp, #0x9b]
	ldr r0, [r4, #0x134]
	add r1, sp, #0x1c
	bl ov00_021FF0C0
	cmp r0, #0
	addeq sp, sp, #0x2e0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r1, [sp, #0x2f8]
	cmp r1, #0
	ldrne r1, [r0, #0xdc]
	ldreq r2, [r0, #0xdc]
	orrne r1, r1, r5
	mvneq r1, r5
	andeq r1, r2, r1
	str r1, [r0, #0xdc]
	ldr r1, [r4, #0x120]
	cmp r1, #0
	addeq sp, sp, #0x2e0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	str r6, [sp, #0x10]
	str r7, [sp, #0x14]
	ldr r0, [r0, #0xdc]
	mov r1, #0
	str r0, [sp, #0x18]
	ldr r2, [r4, #0x130]
	mov r0, #0xc
	str r2, [sp]
	stmib sp, {r1, r6}
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x120]
	add r3, sp, #0x10
	mov r0, r8
	mov r1, #0xb
	bl ov45_02244D30
	add sp, sp, #0x2e0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02249358: .word ov45_022559B8
_0224935C: .word ov45_02255918
_02249360: .word ov45_022556D8
_02249364: .word 0x0000039B
_02249368: .word ov45_02255B44
_0224936C: .word 0x0000039D
_02249370: .word ov45_02255B54
_02249374: .word ov45_02255B64
_02249378: .word ov45_022559D4
_0224937C: .word 0x0000039E
_02249380: .word ov45_022559E4
_02249384: .word ov45_02255AF4
_02249388: .word 0x0000039F
_0224938C: .word 0x00000101
	arm_func_end ov45_02249194

	arm_func_start ov45_02249390
ov45_02249390: ; 0x02249390
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r0
	mov r5, r1
	bne _022493B4
	ldr r0, _02249440 ; =ov45_02255938
	ldr r1, _02249444 ; =ov45_02255918
	ldr r2, _02249448 ; =ov45_02255874
	ldr r3, _0224944C ; =0x0000041A
	bl __msl_assertion_failed
_022493B4:
	cmp r5, #0
	bne _022493D0
	ldr r0, _02249450 ; =ov45_02255A30
	ldr r1, _02249444 ; =ov45_02255918
	ldr r2, _02249448 ; =ov45_02255874
	ldr r3, _02249454 ; =0x0000041B
	bl __msl_assertion_failed
_022493D0:
	ldr r0, [r4, #0x134]
	cmp r0, #0
	bne _022493F0
	ldr r0, _02249458 ; =ov45_02255B7C
	ldr r1, _02249444 ; =ov45_02255918
	ldr r2, _02249448 ; =ov45_02255874
	ldr r3, _0224945C ; =0x00000424
	bl __msl_assertion_failed
_022493F0:
	ldr r0, [r4, #0x134]
	ldr r1, [r5]
	bl ov00_021FF0C0
	movs r4, r0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #4]
	add r0, r4, #0x80
	mov r2, #0x18
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x97]
	ldr r1, [r5, #8]
	add r0, r4, #0x98
	mov r2, #0x40
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0xd7]
	mov r0, #1
	str r0, [r4, #0xd8]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02249440: .word ov45_02255938
_02249444: .word ov45_02255918
_02249448: .word ov45_02255874
_0224944C: .word 0x0000041A
_02249450: .word ov45_02255A30
_02249454: .word 0x0000041B
_02249458: .word ov45_02255B7C
_0224945C: .word 0x00000424
	arm_func_end ov45_02249390

	arm_func_start ov45_02249460
ov45_02249460: ; 0x02249460
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xec
	movs r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bne _02249490
	ldr r0, _02249530 ; =ov45_022559B8
	ldr r1, _02249534 ; =ov45_02255918
	ldr r2, _02249538 ; =ov45_02255764
	ldr r3, _0224953C ; =0x0000043D
	bl __msl_assertion_failed
_02249490:
	cmp r6, #0
	bne _022494AC
	ldr r0, _02249540 ; =ov45_02255D18
	ldr r1, _02249534 ; =ov45_02255918
	ldr r2, _02249538 ; =ov45_02255764
	ldr r3, _02249544 ; =0x0000043F
	bl __msl_assertion_failed
_022494AC:
	ldrsb r0, [r6]
	cmp r0, #0
	bne _022494CC
	ldr r0, _02249548 ; =ov45_02255D28
	ldr r1, _02249534 ; =ov45_02255918
	ldr r2, _02249538 ; =ov45_02255764
	ldr r3, _02249544 ; =0x0000043F
	bl __msl_assertion_failed
_022494CC:
	mov r0, r6
	bl strlen
	cmp r0, #0x80
	blo _022494F0
	ldr r0, _0224954C ; =ov45_02255D38
	ldr r1, _02249534 ; =ov45_02255918
	ldr r2, _02249538 ; =ov45_02255764
	ldr r3, _02249544 ; =0x0000043F
	bl __msl_assertion_failed
_022494F0:
	add r0, sp, #0xc
	mov r1, r6
	mov r2, #0x80
	bl strncpy
	mov r1, #0
	add r0, sp, #0xc
	strb r1, [sp, #0x8b]
	str r5, [sp, #4]
	str r4, [sp, #8]
	str r0, [sp]
	ldr r0, [r7, #0x80c]
	ldr r1, _02249550 ; =ov45_02249390
	add r2, sp, #0
	bl ov00_021FF160
	add sp, sp, #0xec
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_02249530: .word ov45_022559B8
_02249534: .word ov45_02255918
_02249538: .word ov45_02255764
_0224953C: .word 0x0000043D
_02249540: .word ov45_02255D18
_02249544: .word 0x0000043F
_02249548: .word ov45_02255D28
_0224954C: .word ov45_02255D38
_02249550: .word ov45_02249390
	arm_func_end ov45_02249460

	arm_func_start ov45_02249554
ov45_02249554: ; 0x02249554
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r8, r0
	mov r6, r2
	mov r1, #0
_02249568:
	rsb r0, r1, #0xff
	strb r1, [r6, r0]
	add r1, r1, #1
	cmp r1, #0x100
	blt _02249568
	mov r0, #0
	strb r0, [r6, #0x100]
	mov r4, r0
	mov r5, r0
	strb r0, [r6, #0x101]
_02249590:
	ldrb r2, [r6, r5]
	ldrb r3, [r8, r0]
	mov r1, r7
	add r0, r0, #1
	add r3, r3, r2
	add r3, r4, r3
	mov r4, r3, lsr #0x1f
	rsb r3, r4, r3, lsl #24
	add r3, r4, r3, ror #24
	and r4, r3, #0xff
	ldrb r3, [r6, r4]
	strb r3, [r6, r5]
	strb r2, [r6, r4]
	bl _s32_div_f
	add r5, r5, #1
	cmp r5, #0x100
	and r0, r1, #0xff
	blt _02249590
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end ov45_02249554

	arm_func_start ov45_022495DC
ov45_022495DC: ; 0x022495DC
	stmdb sp!, {r4, r5, r6, lr}
	cmp r1, #0
	ldrb r3, [r2, #0x100]
	ldrb ip, [r2, #0x101]
	mov lr, #0
	ble _02249660
_022495F4:
	add r3, r3, #1
	mov r4, r3, lsr #0x1f
	rsb r3, r4, r3, lsl #24
	add r3, r4, r3, ror #24
	and r3, r3, #0xff
	ldrb r5, [r2, r3]
	add r4, ip, r5
	mov ip, r4, lsr #0x1f
	rsb r4, ip, r4, lsl #24
	add r4, ip, r4, ror #24
	and ip, r4, #0xff
	ldrb r4, [r2, ip]
	strb r4, [r2, r3]
	strb r5, [r2, ip]
	ldrb r4, [r2, r3]
	ldrb r6, [r0, lr]
	add r4, r4, r5
	mov r5, r4, lsr #0x1f
	rsb r4, r5, r4, lsl #24
	add r4, r5, r4, ror #24
	and r4, r4, #0xff
	ldrb r4, [r2, r4]
	eor r4, r6, r4
	strb r4, [r0, lr]
	add lr, lr, #1
	cmp lr, r1
	blt _022495F4
_02249660:
	strb r3, [r2, #0x100]
	strb ip, [r2, #0x101]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_022495DC

	arm_func_start ov45_0224966C
ov45_0224966C: ; 0x0224966C
	stmdb sp!, {r4, lr}
	mov r4, r2
	cmp r1, #0
	mov lr, #0
	ldmleia sp!, {r4, pc}
_02249680:
	ldrsb ip, [r0, lr]
	ldrsb r3, [r4]
	eor r3, ip, r3
	strb r3, [r0, lr]
	ldrsb r3, [r4, #1]!
	add lr, lr, #1
	cmp r3, #0
	moveq r4, r2
	cmp lr, r1
	blt _02249680
	ldmia sp!, {r4, pc}
	arm_func_end ov45_0224966C

	arm_func_start ov45_022496AC
ov45_022496AC: ; 0x022496AC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs r4, r0
	mov sl, r1
	str r2, [sp]
	bne _022496D4
	ldr r0, _02249818 ; =ov45_022565C0
	ldr r1, _0224981C ; =ov45_022565D0
	ldr r2, _02249820 ; =ov45_02255EB4
	ldr r3, _02249824 ; =0x0000015B
	bl __msl_assertion_failed
_022496D4:
	cmp sl, #0
	bgt _022496F0
	ldr r0, _02249828 ; =ov45_022565E0
	ldr r1, _0224981C ; =ov45_022565D0
	ldr r2, _02249820 ; =ov45_02255EB4
	ldr r3, _0224982C ; =0x0000015D
	bl __msl_assertion_failed
_022496F0:
	ldr r0, [sp]
	cmp r0, #0
	bne _02249710
	ldr r0, _02249830 ; =ov45_022565F0
	ldr r1, _0224981C ; =ov45_022565D0
	ldr r2, _02249820 ; =ov45_02255EB4
	ldr r3, _02249834 ; =0x0000015E
	bl __msl_assertion_failed
_02249710:
	ldr r8, [r4, #0x814]
	cmp r8, #0
	beq _02249810
_0224971C:
	cmp sl, #0
	mov r6, #0
	ble _02249804
	ldr sb, [sp]
	ldr fp, _02249838 ; =ov45_022565F8
	mov r4, #1
	mov r5, r6
_02249738:
	ldr r0, [sb]
	mov r1, r5
	cmp r0, #0
	blt _02249750
	cmp r0, #0x11
	movlt r1, r4
_02249750:
	cmp r1, #0
	bne _0224976C
	ldr r1, _0224981C ; =ov45_022565D0
	ldr r2, _02249820 ; =ov45_02255EB4
	mov r0, fp
	mov r3, #0x164
	bl __msl_assertion_failed
_0224976C:
	ldr r1, [r8]
	ldr r0, [sb]
	cmp r1, r0
	bne _022497F4
	ldmib sb, {r0, r7}
	cmp r0, #0
	ldreq r1, [r8, #8]
	cmpeq r1, #0
	beq _022497AC
	cmp r0, #0
	ldrne r1, [r8, #8]
	cmpne r1, #0
	beq _022497F4
	bl strnicmp
	cmp r0, #0
	bne _022497F4
_022497AC:
	cmp r7, #0
	ldreq r0, [r8, #0xc]
	cmpeq r0, #0
	beq _022497DC
	cmp r7, #0
	ldrne r1, [r8, #0xc]
	cmpne r1, #0
	beq _022497F4
	mov r0, r7
	bl strnicmp
	cmp r0, #0
	bne _022497F4
_022497DC:
	bl ov00_021FF368
	add r0, r0, #0xa60
	add r1, r0, #0xe000
	mov r0, r8
	str r1, [r8, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022497F4:
	add r6, r6, #1
	cmp r6, sl
	add sb, sb, #0xc
	blt _02249738
_02249804:
	ldr r8, [r8, #0x24]
	cmp r8, #0
	bne _0224971C
_02249810:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02249818: .word ov45_022565C0
_0224981C: .word ov45_022565D0
_02249820: .word ov45_02255EB4
_02249824: .word 0x0000015B
_02249828: .word ov45_022565E0
_0224982C: .word 0x0000015D
_02249830: .word ov45_022565F0
_02249834: .word 0x0000015E
_02249838: .word ov45_022565F8
	arm_func_end ov45_022496AC

	arm_func_start ov45_0224983C
ov45_0224983C: ; 0x0224983C
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r0
	mov r5, r1
	bne _02249860
	ldr r0, _022498E4 ; =ov45_022565C0
	ldr r1, _022498E8 ; =ov45_022565D0
	ldr r2, _022498EC ; =ov45_0225609C
	ldr r3, _022498F0 ; =0x0000017F
	bl __msl_assertion_failed
_02249860:
	cmp r5, #0
	bne _0224987C
	ldr r0, _022498F4 ; =ov45_02256630
	ldr r1, _022498E8 ; =ov45_022565D0
	ldr r2, _022498EC ; =ov45_0225609C
	ldr r3, _022498F8 ; =0x00000181
	bl __msl_assertion_failed
_0224987C:
	ldrsb r0, [r5]
	cmp r0, #0
	bne _0224989C
	ldr r0, _022498FC ; =ov45_02256638
	ldr r1, _022498E8 ; =ov45_022565D0
	ldr r2, _022498EC ; =ov45_0225609C
	ldr r3, _02249900 ; =0x00000182
	bl __msl_assertion_failed
_0224989C:
	ldr r4, [r4, #0x814]
	cmp r4, #0
	beq _022498DC
_022498A8:
	ldr r0, [r4]
	cmp r0, #0xc
	bne _022498D0
	ldr r0, [r4, #0x1c]
	mov r1, r5
	ldr r0, [r0, #8]
	bl strnicmp
	cmp r0, #0
	moveq r0, r4
	ldmeqia sp!, {r3, r4, r5, pc}
_022498D0:
	ldr r4, [r4, #0x24]
	cmp r4, #0
	bne _022498A8
_022498DC:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022498E4: .word ov45_022565C0
_022498E8: .word ov45_022565D0
_022498EC: .word ov45_0225609C
_022498F0: .word 0x0000017F
_022498F4: .word ov45_02256630
_022498F8: .word 0x00000181
_022498FC: .word ov45_02256638
_02249900: .word 0x00000182
	arm_func_end ov45_0224983C

	arm_func_start ov45_02249904
ov45_02249904: ; 0x02249904
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02249924
	ldr r0, _02249948 ; =ov45_02256644
	ldr r1, _0224994C ; =ov45_022565D0
	ldr r2, _02249950 ; =ov45_02255FC4
	ldr r3, _02249954 ; =0x00000193
	bl __msl_assertion_failed
_02249924:
	ldr r0, [r4, #0x1c]
	bl ov00_021EC3D8
	ldr r0, [r4, #8]
	bl ov00_021EC3D8
	ldr r0, [r4, #0xc]
	bl ov00_021EC3D8
	mov r0, r4
	bl ov00_021EC3D8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02249948: .word ov45_02256644
_0224994C: .word ov45_022565D0
_02249950: .word ov45_02255FC4
_02249954: .word 0x00000193
	arm_func_end ov45_02249904

	arm_func_start ov45_02249958
ov45_02249958: ; 0x02249958
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r0
	mov r5, r1
	mov r4, #0
	bne _02249980
	ldr r0, _022499F4 ; =ov45_022565C0
	ldr r1, _022499F8 ; =ov45_022565D0
	ldr r2, _022499FC ; =ov45_02255F74
	ldr r3, _02249A00 ; =0x0000019F
	bl __msl_assertion_failed
_02249980:
	cmp r5, #0
	bne _0224999C
	ldr r0, _02249A04 ; =ov45_02256644
	ldr r1, _022499F8 ; =ov45_022565D0
	ldr r2, _022499FC ; =ov45_02255F74
	ldr r3, _02249A08 ; =0x000001A1
	bl __msl_assertion_failed
_0224999C:
	ldr r1, [r6, #0x814]
	mov r0, r1
	cmp r1, #0
	ldmeqia sp!, {r4, r5, r6, pc}
_022499AC:
	cmp r0, r5
	bne _022499E0
	cmp r1, r0
	ldreq r1, [r0, #0x24]
	streq r1, [r6, #0x814]
	ldr r1, [r6, #0x818]
	cmp r1, r0
	streq r4, [r6, #0x818]
	cmp r4, #0
	ldrne r1, [r0, #0x24]
	strne r1, [r4, #0x24]
	bl ov45_02249904
	ldmia sp!, {r4, r5, r6, pc}
_022499E0:
	mov r4, r0
	ldr r0, [r0, #0x24]
	cmp r0, #0
	bne _022499AC
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_022499F4: .word ov45_022565C0
_022499F8: .word ov45_022565D0
_022499FC: .word ov45_02255F74
_02249A00: .word 0x0000019F
_02249A04: .word ov45_02256644
_02249A08: .word 0x000001A1
	arm_func_end ov45_02249958

	arm_func_start ov45_02249A0C
ov45_02249A0C: ; 0x02249A0C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	movs r5, r1
	mov r6, r0
	mov r4, r2
	bne _02249A38
	ldr r0, _0224A130 ; =ov45_02256654
	ldr r1, _0224A134 ; =ov45_022565D0
	ldr r2, _0224A138 ; =ov45_02255F84
	ldr r3, _0224A13C ; =0x000001C1
	bl __msl_assertion_failed
_02249A38:
	ldr r0, [r5]
	mov r1, #0
	cmp r0, #0
	blt _02249A50
	cmp r0, #0x11
	movlt r1, #1
_02249A50:
	cmp r1, #0
	bne _02249A6C
	ldr r0, _0224A140 ; =ov45_0225665C
	ldr r1, _0224A134 ; =ov45_022565D0
	ldr r2, _0224A138 ; =ov45_02255F84
	ldr r3, _0224A144 ; =0x000001C2
	bl __msl_assertion_failed
_02249A6C:
	ldr r0, [r5]
	cmp r0, #0
	bne _02249B0C
	ldr r2, [r5, #0x14]
	ldr r7, [r5, #0x1c]
	cmp r2, #0
	beq _02249AB8
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0x14
	mov r1, #0xe
	str r4, [sp, #0xc]
	bl ov45_02244D30
_02249AB8:
	ldr r0, [r7, #4]
	mov r4, #0
	cmp r0, #0
	ble _02249AF0
_02249AC8:
	ldr r0, [r7, #8]
	ldr r0, [r0, r4, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r7, #0x10]
	ldr r0, [r0, r4, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r7, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _02249AC8
_02249AF0:
	ldr r0, [r7, #8]
	bl ov00_021EC3D8
	ldr r0, [r7, #0x10]
	bl ov00_021EC3D8
	ldr r0, [r7, #0xc]
	bl ov00_021EC3D8
	b _0224A11C
_02249B0C:
	cmp r0, #1
	bne _02249B54
	ldr r2, [r5, #0x10]
	cmp r2, #0
	beq _0224A11C
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0xc
	mov r1, #0xf
	str r4, [sp, #0xc]
	bl ov45_02244D30
	b _0224A11C
_02249B54:
	cmp r0, #2
	bne _02249B98
	ldr r2, [r5, #0x10]
	ldr r7, [r4, #4]
	cmp r2, #0
	beq _0224A11C
	ldr r1, [r5, #0x18]
	mov r3, r4
	str r1, [sp]
	ldr r1, [r5, #0x20]
	mov r0, r6
	stmib sp, {r1, r7}
	mov r4, #0xc
	mov r1, #0x10
	str r4, [sp, #0xc]
	bl ov45_02244D30
	b _0224A11C
_02249B98:
	cmp r0, #3
	bne _02249C20
	ldr r2, [r5, #0x10]
	ldr r7, [r5, #0x1c]
	cmp r2, #0
	beq _02249BE0
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0x14
	mov r1, #0x13
	str r4, [sp, #0xc]
	bl ov45_02244D30
_02249BE0:
	ldr r0, [r7, #4]
	mov r4, #0
	cmp r0, #0
	ble _02249C0C
_02249BF0:
	ldr r0, [r7, #8]
	ldr r0, [r0, r4, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r7, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _02249BF0
_02249C0C:
	ldr r0, [r7, #8]
	bl ov00_021EC3D8
	ldr r0, [r7, #0xc]
	bl ov00_021EC3D8
	b _0224A11C
_02249C20:
	cmp r0, #4
	bne _02249CB8
	ldr r2, [r5, #0x10]
	ldr r7, [r5, #0x1c]
	cmp r2, #0
	beq _02249C68
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0x1c
	mov r1, #0x14
	str r4, [sp, #0xc]
	bl ov45_02244D30
_02249C68:
	ldr r0, [r7, #0xc]
	mov r4, #0
	cmp r0, #0
	ble _02249C94
_02249C78:
	ldr r0, [r7, #0x10]
	ldr r0, [r0, r4, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r7, #0xc]
	add r4, r4, #1
	cmp r4, r0
	blt _02249C78
_02249C94:
	ldr r0, [r7, #0x10]
	bl ov00_021EC3D8
	ldr r0, [r7, #4]
	bl ov00_021EC3D8
	ldr r0, [r7, #8]
	bl ov00_021EC3D8
	ldr r0, [r7]
	bl ov00_021EC3D8
	b _0224A11C
_02249CB8:
	cmp r0, #0xa
	bne _02249D00
	ldr r2, [r5, #0x10]
	cmp r2, #0
	beq _0224A11C
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0x10
	mov r1, #0x15
	str r4, [sp, #0xc]
	bl ov45_02244D30
	b _0224A11C
_02249D00:
	cmp r0, #0xb
	bne _02249D48
	ldr r2, [r5, #0x10]
	cmp r2, #0
	beq _0224A11C
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0x10
	mov r1, #0x16
	str r4, [sp, #0xc]
	bl ov45_02244D30
	b _0224A11C
_02249D48:
	cmp r0, #5
	bne _02249D90
	ldr r2, [r5, #0x10]
	cmp r2, #0
	beq _0224A11C
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0xc
	mov r1, #0x11
	str r4, [sp, #0xc]
	bl ov45_02244D30
	b _0224A11C
_02249D90:
	cmp r0, #6
	bne _02249DD8
	ldr r2, [r5, #0x10]
	cmp r2, #0
	beq _0224A11C
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0x10
	mov r1, #0x17
	str r4, [sp, #0xc]
	bl ov45_02244D30
	b _0224A11C
_02249DD8:
	cmp r0, #7
	bne _02249DF0
	ldr r0, [r5, #0x1c]
	ldr r0, [r0]
	bl ov00_021EC3D8
	b _0224A11C
_02249DF0:
	cmp r0, #8
	bne _02249E68
	ldr r2, [r5, #0x10]
	ldr r7, [r5, #0x1c]
	cmp r2, #0
	beq _02249E38
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0x10
	mov r1, #0x18
	str r4, [sp, #0xc]
	bl ov45_02244D30
_02249E38:
	ldr r0, [r7]
	mov r4, #0
	cmp r0, #0
	ble _0224A11C
_02249E48:
	ldr r0, [r7, #4]
	ldr r0, [r0, r4, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r7]
	add r4, r4, #1
	cmp r4, r0
	blt _02249E48
	b _0224A11C
_02249E68:
	cmp r0, #9
	bne _02249EB0
	ldr r2, [r5, #0x10]
	cmp r2, #0
	beq _0224A11C
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0xc
	mov r1, #0x1a
	str r4, [sp, #0xc]
	bl ov45_02244D30
	b _0224A11C
_02249EB0:
	cmp r0, #0xc
	bne _02249F38
	ldr r2, [r5, #0x10]
	ldr r7, [r5, #0x1c]
	cmp r2, #0
	beq _02249EF8
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0x14
	mov r1, #0x1d
	str r4, [sp, #0xc]
	bl ov45_02244D30
_02249EF8:
	ldr r0, [r7, #8]
	bl ov00_021EC3D8
	ldr r0, [r7]
	mov r4, #0
	cmp r0, #0
	ble _02249F2C
_02249F10:
	ldr r0, [r7, #4]
	ldr r0, [r0, r4, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r7]
	add r4, r4, #1
	cmp r4, r0
	blt _02249F10
_02249F2C:
	ldr r0, [r7, #4]
	bl ov00_021EC3D8
	b _0224A11C
_02249F38:
	cmp r0, #0xd
	bne _02249FB8
	ldr r2, [r5, #0x10]
	ldr r7, [r5, #0x1c]
	cmp r2, #0
	beq _02249F80
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0x18
	mov r1, #0x1e
	str r4, [sp, #0xc]
	bl ov45_02244D30
_02249F80:
	ldr r0, [r7]
	mov r4, #0
	cmp r0, #0
	ble _02249FAC
_02249F90:
	ldr r0, [r7, #4]
	ldr r0, [r0, r4, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r7]
	add r4, r4, #1
	cmp r4, r0
	blt _02249F90
_02249FAC:
	ldr r0, [r7, #4]
	bl ov00_021EC3D8
	b _0224A11C
_02249FB8:
	cmp r0, #0xe
	bne _0224A038
	ldr r2, [r5, #0x10]
	ldr r7, [r5, #0x1c]
	cmp r2, #0
	beq _0224A000
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0x18
	mov r1, #0x1e
	str r4, [sp, #0xc]
	bl ov45_02244D30
_0224A000:
	ldr r0, [r7]
	mov r4, #0
	cmp r0, #0
	ble _0224A02C
_0224A010:
	ldr r0, [r7, #4]
	ldr r0, [r0, r4, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r7]
	add r4, r4, #1
	cmp r4, r0
	blt _0224A010
_0224A02C:
	ldr r0, [r7, #4]
	bl ov00_021EC3D8
	b _0224A11C
_0224A038:
	cmp r0, #0xf
	bne _0224A0C0
	ldr r2, [r5, #0x10]
	ldr r7, [r5, #0x1c]
	cmp r2, #0
	beq _0224A080
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #0x10
	mov r1, #0x1b
	str r4, [sp, #0xc]
	bl ov45_02244D30
_0224A080:
	ldr r0, [r7, #4]
	mov r4, #0
	cmp r0, #0
	ble _0224A0AC
_0224A090:
	ldr r0, [r7, #8]
	ldr r0, [r0, r4, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r7, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _0224A090
_0224A0AC:
	ldr r0, [r7, #8]
	bl ov00_021EC3D8
	ldr r0, [r7, #0xc]
	bl ov00_021EC3D8
	b _0224A11C
_0224A0C0:
	cmp r0, #0x10
	bne _0224A108
	ldr r2, [r5, #0x10]
	cmp r2, #0
	beq _0224A11C
	ldr r0, [r5, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r3, [r5, #0x20]
	mov r0, r6
	str r3, [sp, #4]
	mov r3, r4
	str r1, [sp, #8]
	mov r4, #8
	mov r1, #0x1f
	str r4, [sp, #0xc]
	bl ov45_02244D30
	b _0224A11C
_0224A108:
	ldr r0, _0224A148 ; =ov45_02256690
	ldr r1, _0224A134 ; =ov45_022565D0
	ldr r2, _0224A138 ; =ov45_02255F84
	mov r3, #0x25c
	bl __msl_assertion_failed
_0224A11C:
	mov r0, r6
	mov r1, r5
	bl ov45_02249958
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224A130: .word ov45_02256654
_0224A134: .word ov45_022565D0
_0224A138: .word ov45_02255F84
_0224A13C: .word 0x000001C1
_0224A140: .word ov45_0225665C
_0224A144: .word 0x000001C2
_0224A148: .word ov45_02256690
	arm_func_end ov45_02249A0C

	arm_func_start ov45_0224A14C
ov45_0224A14C: ; 0x0224A14C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x104
	movs r4, r1
	mov r5, r0
	bne _0224A174
	ldr r0, _0224A558 ; =ov45_02256654
	ldr r1, _0224A55C ; =ov45_022565D0
	ldr r2, _0224A560 ; =ov45_02256010
	mov r3, #0x268
	bl __msl_assertion_failed
_0224A174:
	ldr r0, [r4]
	mov r1, #0
	cmp r0, #0
	blt _0224A18C
	cmp r0, #0x11
	movlt r1, #1
_0224A18C:
	cmp r1, #0
	bne _0224A1A8
	ldr r0, _0224A564 ; =ov45_0225665C
	ldr r1, _0224A55C ; =ov45_022565D0
	ldr r2, _0224A560 ; =ov45_02256010
	ldr r3, _0224A568 ; =0x00000269
	bl __msl_assertion_failed
_0224A1A8:
	ldr r0, [r4]
	cmp r0, #0
	bne _0224A1E4
	mov r3, #0
	add r2, sp, #0xf0
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0xf0]
	str r3, [sp, #0xf4]
	str r3, [sp, #0xf8]
	str r3, [sp, #0xfc]
	str r3, [sp, #0x100]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A1E4:
	cmp r0, #1
	bne _0224A21C
	mov r1, #0
	mov r0, #7
	str r1, [sp, #0xe4]
	str r0, [sp, #0xe8]
	ldr r3, [r4, #8]
	add r2, sp, #0xe4
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0xec]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A21C:
	cmp r0, #2
	bne _0224A250
	mov ip, #0
	str ip, [sp, #0xd8]
	ldr r3, [r4, #8]
	add r2, sp, #0xd8
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0xdc]
	str ip, [sp, #0xe0]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A250:
	cmp r0, #3
	bne _0224A28C
	mov ip, #0
	str ip, [sp, #0xc4]
	ldr r3, [r4, #8]
	add r2, sp, #0xc4
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0xc8]
	str ip, [sp, #0xcc]
	str ip, [sp, #0xd0]
	str ip, [sp, #0xd4]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A28C:
	cmp r0, #4
	bne _0224A2D0
	mov ip, #0
	str ip, [sp, #0xa8]
	ldr r3, [r4, #8]
	add r2, sp, #0xa8
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0xac]
	str ip, [sp, #0xb0]
	str ip, [sp, #0xb4]
	str ip, [sp, #0xb8]
	str ip, [sp, #0xbc]
	str ip, [sp, #0xc0]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A2D0:
	cmp r0, #0xa
	bne _0224A308
	mov ip, #0
	str ip, [sp, #0x98]
	ldr r3, [r4, #8]
	add r2, sp, #0x98
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0x9c]
	str ip, [sp, #0xa0]
	str ip, [sp, #0xa4]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A308:
	cmp r0, #0xb
	bne _0224A344
	mov ip, #0
	str ip, [sp, #0x84]
	ldr r3, [r4, #8]
	add r2, sp, #0x84
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0x88]
	str ip, [sp, #0x8c]
	str ip, [sp, #0x90]
	str ip, [sp, #0x94]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A344:
	cmp r0, #5
	bne _0224A378
	mov ip, #0
	str ip, [sp, #0x78]
	ldr r3, [r4, #8]
	add r2, sp, #0x78
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0x7c]
	str ip, [sp, #0x80]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A378:
	cmp r0, #6
	bne _0224A3B4
	mov ip, #0
	str ip, [sp, #0x68]
	ldr r0, [r4, #0xc]
	add r2, sp, #0x68
	str r0, [sp, #0x6c]
	ldr r3, [r4, #8]
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0x70]
	str ip, [sp, #0x74]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A3B4:
	cmp r0, #7
	bne _0224A3D4
	mov r0, r5
	mov r1, r4
	mov r2, #0
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A3D4:
	cmp r0, #8
	bne _0224A408
	ldr ip, [r4, #8]
	mov r3, #0
	add r2, sp, #0x58
	mov r0, r5
	mov r1, r4
	str ip, [sp, #0x5c]
	str r3, [sp, #0x60]
	str r3, [sp, #0x64]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A408:
	cmp r0, #9
	bne _0224A440
	mov r0, #0
	str r0, [sp, #0x4c]
	ldr r0, [r4, #8]
	add r2, sp, #0x4c
	str r0, [sp, #0x50]
	ldr r3, [r4, #0xc]
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0x54]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A440:
	cmp r0, #0xc
	bne _0224A478
	mov r3, #0
	add r2, sp, #0x38
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0x38]
	str r3, [sp, #0x3c]
	str r3, [sp, #0x40]
	str r3, [sp, #0x44]
	str r3, [sp, #0x48]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A478:
	cmp r0, #0xd
	bne _0224A4B4
	mov r3, #0
	add r2, sp, #0x20
	mov r0, r5
	mov r1, r4
	str r3, [sp, #0x20]
	str r3, [sp, #0x24]
	str r3, [sp, #0x28]
	str r3, [sp, #0x2c]
	str r3, [sp, #0x30]
	str r3, [sp, #0x34]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A4B4:
	cmp r0, #0xe
	bne _0224A4F0
	mov r3, #0
	add r2, sp, #8
	mov r0, r5
	mov r1, r4
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A4F0:
	cmp r0, #0xf
	bne _0224A50C
	mov r0, r5
	mov r1, r4
	bl ov45_02249958
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A50C:
	cmp r0, #0x10
	bne _0224A53C
	ldr r3, _0224A56C ; =ov45_02256694
	mov ip, #0
	add r2, sp, #0
	mov r0, r5
	mov r1, r4
	str ip, [sp]
	str r3, [sp, #4]
	bl ov45_02249A0C
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
_0224A53C:
	ldr r0, _0224A570 ; =ov45_02256690
	ldr r1, _0224A55C ; =ov45_022565D0
	ldr r2, _0224A560 ; =ov45_02256010
	ldr r3, _0224A574 ; =0x00000311
	bl __msl_assertion_failed
	add sp, sp, #0x104
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0224A558: .word ov45_02256654
_0224A55C: .word ov45_022565D0
_0224A560: .word ov45_02256010
_0224A564: .word ov45_0225665C
_0224A568: .word 0x00000269
_0224A56C: .word ov45_02256694
_0224A570: .word ov45_02256690
_0224A574: .word 0x00000311
	arm_func_end ov45_0224A14C

	arm_func_start ov45_0224A578
ov45_0224A578: ; 0x0224A578
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r0
	bne _0224A598
	ldr r0, _0224A5D4 ; =ov45_022565C0
	ldr r1, _0224A5D8 ; =ov45_022565D0
	ldr r2, _0224A5DC ; =ov45_02255EC4
	ldr r3, _0224A5E0 ; =0x0000031A
	bl __msl_assertion_failed
_0224A598:
	bl ov00_021FF368
	ldr r1, [r6, #0x814]
	mov r5, r0
	cmp r1, #0
	ldmeqia sp!, {r4, r5, r6, pc}
_0224A5AC:
	ldr r0, [r1, #4]
	ldr r4, [r1, #0x24]
	cmp r5, r0
	bls _0224A5C4
	mov r0, r6
	bl ov45_0224A14C
_0224A5C4:
	mov r1, r4
	cmp r4, #0
	bne _0224A5AC
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0224A5D4: .word ov45_022565C0
_0224A5D8: .word ov45_022565D0
_0224A5DC: .word ov45_02255EC4
_0224A5E0: .word 0x0000031A
	arm_func_end ov45_0224A578

	arm_func_start ov45_0224A5E4
ov45_0224A5E4: ; 0x0224A5E4
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _0224A604
	ldr r0, _0224A620 ; =ov45_022565C0
	ldr r1, _0224A624 ; =ov45_022565D0
	ldr r2, _0224A628 ; =ov45_02255E60
	ldr r3, _0224A62C ; =0x0000032D
	bl __msl_assertion_failed
_0224A604:
	ldr r0, [r4, #0x81c]
	mvn r1, #0x80000000
	cmp r0, r1
	moveq r1, #1
	addne r1, r0, #1
	str r1, [r4, #0x81c]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0224A620: .word ov45_022565C0
_0224A624: .word ov45_022565D0
_0224A628: .word ov45_02255E60
_0224A62C: .word 0x0000032D
	arm_func_end ov45_0224A5E4

	arm_func_start ov45_0224A630
ov45_0224A630: ; 0x0224A630
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _0224A654
	ldr r0, _0224A6A0 ; =ov45_022565C0
	ldr r1, _0224A6A4 ; =ov45_022565D0
	ldr r2, _0224A6A8 ; =ov45_022560B0
	mov r3, #0x340
	bl __msl_assertion_failed
_0224A654:
	cmp r4, #0
	bgt _0224A670
	ldr r0, _0224A6AC ; =ov45_022566A0
	ldr r1, _0224A6A4 ; =ov45_022565D0
	ldr r2, _0224A6A8 ; =ov45_022560B0
	ldr r3, _0224A6B0 ; =0x00000342
	bl __msl_assertion_failed
_0224A670:
	ldr r1, [r5, #0x814]
	cmp r1, #0
	beq _0224A698
_0224A67C:
	ldr r0, [r1, #0x20]
	cmp r0, r4
	moveq r0, #1
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [r1, #0x24]
	cmp r1, #0
	bne _0224A67C
_0224A698:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224A6A0: .word ov45_022565C0
_0224A6A4: .word ov45_022565D0
_0224A6A8: .word ov45_022560B0
_0224A6AC: .word ov45_022566A0
_0224A6B0: .word 0x00000342
	arm_func_end ov45_0224A630

	arm_func_start ov45_0224A6B4
ov45_0224A6B4: ; 0x0224A6B4
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _0224A6D4
	ldr r0, _0224A6F8 ; =ov45_022565C0
	ldr r1, _0224A6FC ; =ov45_022565D0
	ldr r2, _0224A700 ; =ov45_02255FD4
	ldr r3, _0224A704 ; =0x00000353
	bl __msl_assertion_failed
_0224A6D4:
	ldr r1, [r4, #0x814]
	cmp r1, #0
	ldmeqia sp!, {r4, pc}
_0224A6E0:
	mov r0, r4
	bl ov45_0224A14C
	ldr r1, [r4, #0x814]
	cmp r1, #0
	bne _0224A6E0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0224A6F8: .word ov45_022565C0
_0224A6FC: .word ov45_022565D0
_0224A700: .word ov45_02255FD4
_0224A704: .word 0x00000353
	arm_func_end ov45_0224A6B4

	arm_func_start ov45_0224A708
ov45_0224A708: ; 0x0224A708
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r7, r0
	mov r8, r1
	mov r6, r2
	mov r5, r3
	bne _0224A734
	ldr r0, _0224A7E4 ; =ov45_022565C0
	ldr r1, _0224A7E8 ; =ov45_022565D0
	ldr r2, _0224A7EC ; =ov45_02255E6C
	mov r3, #0x35c
	bl __msl_assertion_failed
_0224A734:
	mov r0, #0x28
	bl ov00_021EC3A8
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r1, #0
	mov r2, #0x28
	bl memset
	str r8, [r4]
	bl ov00_021FF368
	add r0, r0, #0xa60
	add r0, r0, #0xe000
	str r0, [r4, #4]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r1, [r4, #0x10]
	str r0, [r4, #0x14]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x24]
	str r1, [r4, #0x18]
	str r0, [r4, #0x1c]
	cmp r6, #0
	moveq r0, #0
	beq _0224A79C
	mov r0, r6
	bl ov00_021FF3D4
_0224A79C:
	str r0, [r4, #8]
	cmp r5, #0
	moveq r0, #0
	beq _0224A7B4
	mov r0, r5
	bl ov00_021FF3D4
_0224A7B4:
	str r0, [r4, #0xc]
	mov r0, r7
	bl ov45_0224A5E4
	str r0, [r4, #0x20]
	ldr r0, [r7, #0x814]
	cmp r0, #0
	streq r4, [r7, #0x814]
	ldrne r0, [r7, #0x818]
	strne r4, [r0, #0x24]
	str r4, [r7, #0x818]
	ldr r0, [r4, #0x20]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0224A7E4: .word ov45_022565C0
_0224A7E8: .word ov45_022565D0
_0224A7EC: .word ov45_02255E6C
	arm_func_end ov45_0224A708

	arm_func_start ov45_0224A7F0
ov45_0224A7F0: ; 0x0224A7F0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r0, #0x14
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov00_021EC3A8
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r3, r0
	mov r2, #5
	mov r1, #0
_0224A82C:
	strb r1, [r3]
	strb r1, [r3, #1]
	strb r1, [r3, #2]
	strb r1, [r3, #3]
	add r3, r3, #4
	subs r2, r2, #1
	bne _0224A82C
	str r6, [sp]
	str r5, [sp, #4]
	mov r1, #0
	str r4, [sp, #8]
	str r0, [sp, #0xc]
	mov r0, r7
	mov r2, r1
	mov r3, r1
	bl ov45_0224A708
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_0224A7F0

	arm_func_start ov45_0224A874
ov45_0224A874: ; 0x0224A874
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldr r8, [sp, #0x2c]
	mov r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	cmp r8, #0
	bne _0224A8AC
	ldr r0, _0224A960 ; =ov45_022566A8
	ldr r1, _0224A964 ; =ov45_022565D0
	ldr r2, _0224A968 ; =ov45_02255F94
	ldr r3, _0224A96C ; =0x00000391
	bl __msl_assertion_failed
_0224A8AC:
	ldr r0, [sp, #0x2c]
	bl strlen
	cmp r0, #0x20
	blo _0224A8D0
	ldr r0, _0224A970 ; =ov45_022566BC
	ldr r1, _0224A964 ; =ov45_022565D0
	ldr r2, _0224A968 ; =ov45_02255F94
	ldr r3, _0224A974 ; =0x00000392
	bl __msl_assertion_failed
_0224A8D0:
	mov r0, #0x54
	bl ov00_021EC3A8
	movs r8, r0
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r1, #0
	mov r2, #0x54
	bl memset
	ldr lr, [sp, #0x28]
	mov ip, r8
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	ldmia lr, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	ldr r1, [sp, #0x2c]
	add r0, r8, #0x34
	mov r2, #0x20
	bl strncpy
	mov r3, #0
	strb r3, [r8, #0x53]
	str r5, [sp]
	mov r0, r7
	mov r2, r6
	mov r1, #1
	stmib sp, {r3, r4, r8}
	bl ov45_0224A708
	movs r4, r0
	bne _0224A954
	mov r0, r8
	bl ov00_021EC3D8
_0224A954:
	mov r0, r4
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0224A960: .word ov45_022566A8
_0224A964: .word ov45_022565D0
_0224A968: .word ov45_02255F94
_0224A96C: .word 0x00000391
_0224A970: .word ov45_022566BC
_0224A974: .word 0x00000392
	arm_func_end ov45_0224A874

	arm_func_start ov45_0224A978
ov45_0224A978: ; 0x0224A978
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x10
	mov r7, r0
	mov r0, #0x10
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bl ov00_021EC3A8
	cmp r0, #0
	addeq sp, sp, #0x10
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r3, r0
	mov r2, #4
	mov r1, #0
_0224A9B4:
	strb r1, [r3]
	strb r1, [r3, #1]
	strb r1, [r3, #2]
	strb r1, [r3, #3]
	add r3, r3, #4
	subs r2, r2, #1
	bne _0224A9B4
	str r5, [sp]
	mov r3, #0
	stmib sp, {r3, r4}
	str r0, [sp, #0xc]
	mov r0, r7
	mov r2, r6
	mov r1, #3
	bl ov45_0224A708
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end ov45_0224A978

	arm_func_start ov45_0224A9F8
ov45_0224A9F8: ; 0x0224A9F8
	stmdb sp!, {r3, lr}
	sub sp, sp, #0x10
	str r2, [sp]
	mov ip, #0
	str ip, [sp, #4]
	str r3, [sp, #8]
	mov r2, r1
	mov r3, ip
	mov r1, #5
	str ip, [sp, #0xc]
	bl ov45_0224A708
	add sp, sp, #0x10
	ldmia sp!, {r3, pc}
	arm_func_end ov45_0224A9F8

	arm_func_start ov45_0224AA2C
ov45_0224AA2C: ; 0x0224AA2C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov fp, r0
	mov r0, #0x10
	str r1, [sp, #0x10]
	mov sl, r2
	mov sb, r3
	bl ov00_021EC3A8
	movs r7, r0
	addeq sp, sp, #0x14
	mov r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r2, r7
	mov r1, #4
_0224AA64:
	strb r0, [r2]
	strb r0, [r2, #1]
	strb r0, [r2, #2]
	strb r0, [r2, #3]
	add r2, r2, #4
	subs r1, r1, #1
	bne _0224AA64
	ldr r1, [sp, #0x3c]
	ldr r0, [sp, #0x38]
	str r1, [r7, #0xc]
	str sl, [r7]
	str r0, [r7, #8]
	cmp r1, #0
	ldrne r0, [r7]
	subne r0, r0, #1
	strne r0, [r7]
	ldr r0, [r7]
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r7, #4]
	cmp r0, #0
	bne _0224AAD0
	mov r0, r7
	bl ov00_021EC3D8
	add sp, sp, #0x14
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224AAD0:
	mov r5, #0
	mov r6, r5
	cmp sl, #0
	ble _0224AB64
	ldr r4, _0224AB9C ; =ov45_022566DC
_0224AAE4:
	ldr r8, [sb, r5, lsl #2]
	mov r1, r4
	mov r0, r8
	bl strcmp
	cmp r0, #0
	beq _0224AB58
	mov r0, r8
	bl ov00_021FF3D4
	ldr r1, [r7, #4]
	str r0, [r1, r6, lsl #2]
	ldr r0, [r7, #4]
	ldr r0, [r0, r6, lsl #2]
	cmp r0, #0
	bne _0224AB54
	subs r6, r6, #1
	bmi _0224AB38
_0224AB24:
	ldr r0, [r7, #4]
	ldr r0, [r0, r6, lsl #2]
	bl ov00_021EC3D8
	subs r6, r6, #1
	bpl _0224AB24
_0224AB38:
	ldr r0, [r7, #4]
	bl ov00_021EC3D8
	mov r0, r7
	bl ov00_021EC3D8
	add sp, sp, #0x14
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224AB54:
	add r6, r6, #1
_0224AB58:
	add r5, r5, #1
	cmp r5, sl
	blt _0224AAE4
_0224AB64:
	ldr r0, [sp, #0x40]
	str r6, [r7]
	str r0, [sp]
	mov r3, #0
	ldr r0, [sp, #0x44]
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0x10]
	mov r0, fp
	mov r1, #0xd
	str r7, [sp, #0xc]
	bl ov45_0224A708
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0224AB9C: .word ov45_022566DC
	arm_func_end ov45_0224AA2C

	arm_func_start ov45_0224ABA0
ov45_0224ABA0: ; 0x0224ABA0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x14
	mov fp, r0
	mov r0, #0xc
	str r1, [sp, #0x10]
	mov sl, r2
	mov sb, r3
	bl ov00_021EC3A8
	movs r7, r0
	addeq sp, sp, #0x14
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r1, #0
	strb r1, [r7]
	strb r1, [r7, #1]
	strb r1, [r7, #2]
	strb r1, [r7, #3]
	strb r1, [r7, #4]
	strb r1, [r7, #5]
	strb r1, [r7, #6]
	strb r1, [r7, #7]
	strb r1, [r7, #8]
	strb r1, [r7, #9]
	strb r1, [r7, #0xa]
	ldr r0, [sp, #0x38]
	strb r1, [r7, #0xb]
	str r0, [r7, #8]
	str sl, [r7]
	cmp r0, #0
	ldrne r0, [r7]
	subne r0, r0, #1
	strne r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _0224ACEC
	mov r0, r0, lsl #2
	bl ov00_021EC3A8
	str r0, [r7, #4]
	cmp r0, #0
	bne _0224AC54
	mov r0, r7
	bl ov00_021EC3D8
	add sp, sp, #0x14
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224AC54:
	mov r5, #0
	mov r6, r5
	cmp sl, #0
	ble _0224ACE8
	ldr r4, _0224AD20 ; =ov45_022566DC
_0224AC68:
	ldr r8, [sb, r5, lsl #2]
	mov r1, r4
	mov r0, r8
	bl strcmp
	cmp r0, #0
	beq _0224ACDC
	mov r0, r8
	bl ov00_021FF3D4
	ldr r1, [r7, #4]
	str r0, [r1, r6, lsl #2]
	ldr r0, [r7, #4]
	ldr r0, [r0, r6, lsl #2]
	cmp r0, #0
	bne _0224ACD8
	subs r6, r6, #1
	bmi _0224ACBC
_0224ACA8:
	ldr r0, [r7, #4]
	ldr r0, [r0, r6, lsl #2]
	bl ov00_021EC3D8
	subs r6, r6, #1
	bpl _0224ACA8
_0224ACBC:
	ldr r0, [r7, #4]
	bl ov00_021EC3D8
	mov r0, r7
	bl ov00_021EC3D8
	add sp, sp, #0x14
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224ACD8:
	add r6, r6, #1
_0224ACDC:
	add r5, r5, #1
	cmp r5, sl
	blt _0224AC68
_0224ACE8:
	str r6, [r7]
_0224ACEC:
	ldr r1, [sp, #0x3c]
	ldr r0, [sp, #0x40]
	str r1, [sp]
	mov r3, #0
	str r3, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [sp, #0x10]
	mov r0, fp
	mov r1, #0xe
	str r7, [sp, #0xc]
	bl ov45_0224A708
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0224AD20: .word ov45_022566DC
	arm_func_end ov45_0224ABA0

	arm_func_start ov45_0224AD24
ov45_0224AD24: ; 0x0224AD24
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov r3, #0
	str r3, [sp, #4]
	movs fp, r0
	str r1, [sp]
	mov sb, r2
	mov r8, r3
	mov r7, r3
	bne _0224AD60
	ldr r0, _0224AFC8 ; =ov45_022566E0
	ldr r1, _0224AFCC ; =ov45_022565D0
	ldr r2, _0224AFD0 ; =ov45_02255E78
	ldr r3, _0224AFD4 ; =0x00000494
	bl __msl_assertion_failed
_0224AD60:
	ldrsb r0, [fp]
	cmp r0, #0x2b
	moveq sl, #1
	beq _0224AD88
	cmp r0, #0x2d
	moveq sl, #0
	beq _0224AD88
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224AD88:
	add fp, fp, #1
	mvn r4, #0
_0224AD90:
	ldrsb r5, [fp], #1
	cmp r5, #0x2d
	bgt _0224ADC0
	cmp r5, #0x2b
	blt _0224ADB4
	beq _0224AE2C
	cmp r5, #0x2d
	beq _0224AE38
	b _0224AEF8
_0224ADB4:
	cmp r5, #0
	beq _0224AE44
	b _0224AEF8
_0224ADC0:
	cmp r5, #0x62
	bgt _0224ADD0
	beq _0224AEC8
	b _0224AEF8
_0224ADD0:
	sub r0, r5, #0x65
	cmp r0, #0x12
	addls pc, pc, r0, lsl #2
	b _0224AEF8
_0224ADE0: ; jump table
	b _0224AEEC ; case 0
	b _0224AEF8 ; case 1
	b _0224AEF8 ; case 2
	b _0224AEF8 ; case 3
	b _0224AE50 ; case 4
	b _0224AEF8 ; case 5
	b _0224AE80 ; case 6
	b _0224AE5C ; case 7
	b _0224AE8C ; case 8
	b _0224AE98 ; case 9
	b _0224AEB0 ; case 10
	b _0224AE68 ; case 11
	b _0224AEF8 ; case 12
	b _0224AEF8 ; case 13
	b _0224AE74 ; case 14
	b _0224AEA4 ; case 15
	b _0224AED4 ; case 16
	b _0224AEBC ; case 17
	b _0224AEE0 ; case 18
_0224AE2C:
	mov sl, #1
	mov r6, r4
	b _0224AEFC
_0224AE38:
	mov sl, #0
	mov r6, r4
	b _0224AEFC
_0224AE44:
	mov r6, #0
	mov r7, r6
	b _0224AEFC
_0224AE50:
	mov r6, #2
	mov r7, #0
	b _0224AEFC
_0224AE5C:
	mov r6, #3
	mov r7, #1
	b _0224AEFC
_0224AE68:
	mov r6, #4
	mov r7, #0
	b _0224AEFC
_0224AE74:
	mov r6, #5
	mov r7, #0
	b _0224AEFC
_0224AE80:
	mov r6, #6
	mov r7, #1
	b _0224AEFC
_0224AE8C:
	mov r6, #7
	mov r7, #0
	b _0224AEFC
_0224AE98:
	mov r6, #8
	mov r7, #0
	b _0224AEFC
_0224AEA4:
	mov r6, #9
	mov r7, #0
	b _0224AEFC
_0224AEB0:
	mov r6, #0xa
	mov r7, #1
	b _0224AEFC
_0224AEBC:
	mov r6, #0xb
	mov r7, #1
	b _0224AEFC
_0224AEC8:
	mov r6, #1
	mov r7, r6
	b _0224AEFC
_0224AED4:
	mov r6, #0xc
	mov r7, #0
	b _0224AEFC
_0224AEE0:
	mov r6, #0xd
	mov r7, #0
	b _0224AEFC
_0224AEEC:
	mov r6, #0xe
	mov r7, #0
	b _0224AEFC
_0224AEF8:
	mov r6, r4
_0224AEFC:
	cmp r6, r4
	beq _0224AFB4
	add r2, r8, #1
	mov r1, #0xc
	mul r1, r2, r1
	ldr r0, [sp, #4]
	bl ov00_021EC3BC
	cmp r0, #0
	bne _0224AF34
	ldr r0, [sp, #4]
	bl ov00_021EC3D8
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224AF34:
	mov r1, #0xc
	mul r1, r8, r1
	mov r2, #0
	strb r2, [r0, r1]
	add r2, r0, r1
	mov r3, #0
	strb r3, [r2, #1]
	strb r3, [r2, #2]
	strb r3, [r2, #3]
	strb r3, [r2, #4]
	strb r3, [r2, #5]
	strb r3, [r2, #6]
	strb r3, [r2, #7]
	strb r3, [r2, #8]
	strb r3, [r2, #9]
	strb r3, [r2, #0xa]
	strb r3, [r2, #0xb]
	str sl, [r2, #4]
	cmp r7, #0
	str r0, [sp, #4]
	add r8, r8, #1
	str r6, [r0, r1]
	beq _0224AFB4
	cmp sb, #0
	movle r0, r3
	strle r0, [r2, #8]
	ble _0224AFB4
	ldr r0, [sp]
	sub sb, sb, #1
	ldr r1, [r0], #4
	str r0, [sp]
	str r1, [r2, #8]
_0224AFB4:
	cmp r5, #0
	bne _0224AD90
	ldr r0, [sp, #4]
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0224AFC8: .word ov45_022566E0
_0224AFCC: .word ov45_022565D0
_0224AFD0: .word ov45_02255E78
_0224AFD4: .word 0x00000494
	arm_func_end ov45_0224AD24

	arm_func_start ov45_0224AFD8
ov45_0224AFD8: ; 0x0224AFD8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov r8, r1
	ldr r1, [r8]
	mov sb, r0
	cmp r1, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r6, _0224B0EC ; =ov45_02256690
	ldr r5, _0224B0F0 ; =ov45_022565D0
	ldr r4, _0224B0F4 ; =ov45_02256128
	ldr sl, _0224B0F8 ; =0x0000056C
	mov r7, #0
_0224B004:
	ldr r0, [r8]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _0224B0C8
_0224B014: ; jump table
	b _0224B0C8 ; case 0
	b _0224B0DC ; case 1
	b _0224B050 ; case 2
	b _0224B05C ; case 3
	b _0224B080 ; case 4
	b _0224B08C ; case 5
	b _0224B0DC ; case 6
	b _0224B098 ; case 7
	b _0224B0A4 ; case 8
	b _0224B0B0 ; case 9
	b _0224B0DC ; case 10
	b _0224B0DC ; case 11
	b _0224B0DC ; case 12
	b _0224B0DC ; case 13
	b _0224B0BC ; case 14
_0224B050:
	ldr r0, [r8, #4]
	str r0, [sb]
	b _0224B0DC
_0224B05C:
	ldr r0, [r8, #4]
	cmp r0, #0
	ldrne r0, [r8, #8]
	cmpne r0, #0
	streq r7, [sb, #0x1c]
	beq _0224B0DC
	bl atoi
	str r0, [sb, #0x1c]
	b _0224B0DC
_0224B080:
	ldr r0, [r8, #4]
	str r0, [sb, #4]
	b _0224B0DC
_0224B08C:
	ldr r0, [r8, #4]
	str r0, [sb, #8]
	b _0224B0DC
_0224B098:
	ldr r0, [r8, #4]
	str r0, [sb, #0xc]
	b _0224B0DC
_0224B0A4:
	ldr r0, [r8, #4]
	str r0, [sb, #0x10]
	b _0224B0DC
_0224B0B0:
	ldr r0, [r8, #4]
	str r0, [sb, #0x14]
	b _0224B0DC
_0224B0BC:
	ldr r0, [r8, #4]
	str r0, [sb, #0x18]
	b _0224B0DC
_0224B0C8:
	mov r0, r6
	mov r1, r5
	mov r2, r4
	mov r3, sl
	bl __msl_assertion_failed
_0224B0DC:
	ldr r0, [r8, #0xc]!
	cmp r0, #0
	bne _0224B004
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_0224B0EC: .word ov45_02256690
_0224B0F0: .word ov45_022565D0
_0224B0F4: .word ov45_02256128
_0224B0F8: .word 0x0000056C
	arm_func_end ov45_0224AFD8

	arm_func_start ov45_0224B0FC
ov45_0224B0FC: ; 0x0224B0FC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x2c
	movs sb, r0
	mov r4, r1
	mov r7, #0
	bne _0224B128
	ldr r0, _0224B2F0 ; =ov45_022565C0
	ldr r1, _0224B2F4 ; =ov45_022565D0
	ldr r2, _0224B2F8 ; =ov45_02255FE8
	ldr r3, _0224B2FC ; =0x0000057C
	bl __msl_assertion_failed
_0224B128:
	ldr r0, [r4, #0x24]
	cmp r0, #2
	beq _0224B148
	ldr r0, _0224B300 ; =ov45_022566F0
	ldr r1, _0224B2F4 ; =ov45_022565D0
	ldr r2, _0224B2F8 ; =ov45_02255FE8
	ldr r3, _0224B304 ; =0x00000582
	bl __msl_assertion_failed
_0224B148:
	ldr r0, [r4, #0x24]
	cmp r0, #2
	addne sp, sp, #0x2c
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r4, #0x20]
	ldr r6, [r4, #8]
	ldmia r0, {r5, r8}
	mov r0, r8
	bl strlen
	ldrsb r1, [r8]
	ldr r4, _0224B308 ; =ov45_02256708
	cmp r1, #1
	bne _0224B1DC
	ldrsb r1, [r8, #1]
	cmp r1, #0x41
	blt _0224B190
	cmp r1, #0x5a
	ble _0224B1A0
_0224B190:
	cmp r1, #0x61
	blt _0224B1DC
	cmp r1, #0x7a
	bgt _0224B1DC
_0224B1A0:
	sub r3, r0, #1
	ldrsb r0, [r8, r3]
	cmp r0, #1
	bne _0224B1DC
	mov r2, #0
	mov r0, r8
	mov r1, #0x20
	strb r2, [r8, r3]
	bl strchr
	cmp r0, #0
	beq _0224B1DC
	mov r1, #0
	add r4, r8, #1
	strb r1, [r0]
	add r8, r0, #1
_0224B1DC:
	ldr r1, _0224B30C ; =ov45_0225670C
	mov r0, r4
	bl strcmp
	cmp r0, #0
	moveq r7, #1
	beq _0224B204
	ldrsb r0, [r4]
	cmp r0, #0
	addne sp, sp, #0x2c
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0224B204:
	mov r0, r5
	add r1, sb, #0x36c
	bl strnicmp
	cmp r0, #0
	bne _0224B27C
	ldr r0, [sb, #0x800]
	cmp r0, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	cmp r7, #0
	movne r0, #1
	strne r0, [sp, #0x28]
	moveq r0, #0
	streq r0, [sp, #0x28]
	str r6, [sp, #0x20]
	str r8, [sp, #0x24]
	ldr r1, [sb, #0x808]
	mov r0, #0
	str r1, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [sb, #0x800]
	add r3, sp, #0x20
	mov r0, sb
	mov r1, #2
	bl ov45_02244D30
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0224B27C:
	mov r0, sb
	mov r1, r5
	bl ov45_02247E98
	cmp r0, #0
	ldrne r1, [r0]
	cmpne r1, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	cmp r7, #0
	movne r1, #1
	strne r1, [sp, #0x1c]
	moveq r1, #0
	streq r1, [sp, #0x1c]
	str r5, [sp, #0x10]
	str r6, [sp, #0x14]
	str r8, [sp, #0x18]
	ldr r2, [r0, #0x2c]
	mov r1, #0
	str r2, [sp]
	stmib sp, {r1, r5}
	mov r1, #0x10
	str r1, [sp, #0xc]
	ldr r2, [r0]
	add r3, sp, #0x10
	mov r0, sb
	mov r1, #4
	bl ov45_02244D30
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0224B2F0: .word ov45_022565C0
_0224B2F4: .word ov45_022565D0
_0224B2F8: .word ov45_02255FE8
_0224B2FC: .word 0x0000057C
_0224B300: .word ov45_022566F0
_0224B304: .word 0x00000582
_0224B308: .word ov45_02256708
_0224B30C: .word ov45_0225670C
	arm_func_end ov45_0224B0FC

	arm_func_start ov45_0224B310
ov45_0224B310: ; 0x0224B310
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x2c
	movs r7, r0
	mov r6, r1
	bne _0224B338
	ldr r0, _0224B460 ; =ov45_022565C0
	ldr r1, _0224B464 ; =ov45_022565D0
	ldr r2, _0224B468 ; =ov45_02255FA4
	ldr r3, _0224B46C ; =0x000005EA
	bl __msl_assertion_failed
_0224B338:
	ldr r0, [r6, #0x24]
	cmp r0, #2
	beq _0224B358
	ldr r0, _0224B470 ; =ov45_022566F0
	ldr r1, _0224B464 ; =ov45_022565D0
	ldr r2, _0224B468 ; =ov45_02255FA4
	mov r3, #0x5f0
	bl __msl_assertion_failed
_0224B358:
	ldr r0, [r6, #0x24]
	cmp r0, #2
	addne sp, sp, #0x2c
	ldmneia sp!, {r4, r5, r6, r7, pc}
	ldr r0, [r6, #0x20]
	add r1, r7, #0x36c
	ldmia r0, {r4, r5}
	mov r0, r4
	bl strnicmp
	cmp r0, #0
	bne _0224B3E8
	ldr r0, [r7, #0x800]
	cmp r0, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	ldr r0, [r6, #8]
	mov r1, #2
	cmp r0, #0
	strne r0, [sp, #0x20]
	moveq r0, #0
	streq r0, [sp, #0x20]
	str r5, [sp, #0x24]
	str r1, [sp, #0x28]
	ldr r2, [r7, #0x808]
	mov r0, #0
	str r2, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r7, #0x800]
	add r3, sp, #0x20
	mov r0, r7
	bl ov45_02244D30
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, pc}
_0224B3E8:
	mov r0, r7
	mov r1, r4
	bl ov45_02247E98
	cmp r0, #0
	ldrne r1, [r0]
	cmpne r1, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	str r4, [sp, #0x10]
	ldr r1, [r6, #8]
	add r3, sp, #0x10
	cmp r1, #0
	strne r1, [sp, #0x14]
	moveq r1, #0
	streq r1, [sp, #0x14]
	mov r1, #2
	str r1, [sp, #0x1c]
	str r5, [sp, #0x18]
	ldr r2, [r0, #0x2c]
	mov r1, #0
	str r2, [sp]
	stmib sp, {r1, r4}
	mov r1, #0x10
	str r1, [sp, #0xc]
	ldr r2, [r0]
	mov r0, r7
	mov r1, #4
	bl ov45_02244D30
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_0224B460: .word ov45_022565C0
_0224B464: .word ov45_022565D0
_0224B468: .word ov45_02255FA4
_0224B46C: .word 0x000005EA
_0224B470: .word ov45_022566F0
	arm_func_end ov45_0224B310

	arm_func_start ov45_0224B474
ov45_0224B474: ; 0x0224B474
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x2c
	movs r7, r0
	mov r6, r1
	bne _0224B49C
	ldr r0, _0224B5C8 ; =ov45_022565C0
	ldr r1, _0224B5CC ; =ov45_022565D0
	ldr r2, _0224B5D0 ; =ov45_02255E94
	ldr r3, _0224B5D4 ; =0x0000061F
	bl __msl_assertion_failed
_0224B49C:
	ldr r0, [r6, #0x24]
	cmp r0, #2
	beq _0224B4BC
	ldr r0, _0224B5D8 ; =ov45_022566F0
	ldr r1, _0224B5CC ; =ov45_022565D0
	ldr r2, _0224B5D0 ; =ov45_02255E94
	ldr r3, _0224B5DC ; =0x00000625
	bl __msl_assertion_failed
_0224B4BC:
	ldr r0, [r6, #0x24]
	cmp r0, #2
	addne sp, sp, #0x2c
	ldmneia sp!, {r4, r5, r6, r7, pc}
	ldr r0, [r6, #0x20]
	add r1, r7, #0x36c
	ldmia r0, {r4, r5}
	mov r0, r4
	bl strnicmp
	cmp r0, #0
	bne _0224B550
	ldr r0, [r7, #0x800]
	cmp r0, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	ldr r0, [r6, #8]
	add r3, sp, #0x20
	cmp r0, #0
	strne r0, [sp, #0x20]
	moveq r0, #0
	streq r0, [sp, #0x20]
	mov r0, #3
	str r0, [sp, #0x28]
	str r5, [sp, #0x24]
	ldr r1, [r7, #0x808]
	mov r0, #0
	str r1, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r7, #0x800]
	mov r0, r7
	mov r1, #2
	bl ov45_02244D30
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, pc}
_0224B550:
	mov r0, r7
	mov r1, r4
	bl ov45_02247E98
	cmp r0, #0
	ldrne r1, [r0]
	cmpne r1, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	str r4, [sp, #0x10]
	ldr r1, [r6, #8]
	add r3, sp, #0x10
	cmp r1, #0
	strne r1, [sp, #0x14]
	moveq r1, #0
	streq r1, [sp, #0x14]
	mov r1, #3
	str r1, [sp, #0x1c]
	str r5, [sp, #0x18]
	ldr r2, [r0, #0x2c]
	mov r1, #0
	str r2, [sp]
	stmib sp, {r1, r4}
	mov r1, #0x10
	str r1, [sp, #0xc]
	ldr r2, [r0]
	mov r0, r7
	mov r1, #4
	bl ov45_02244D30
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_0224B5C8: .word ov45_022565C0
_0224B5CC: .word ov45_022565D0
_0224B5D0: .word ov45_02255E94
_0224B5D4: .word 0x0000061F
_0224B5D8: .word ov45_022566F0
_0224B5DC: .word 0x00000625
	arm_func_end ov45_0224B474

	arm_func_start ov45_0224B5E0
ov45_0224B5E0: ; 0x0224B5E0
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x2c
	movs r7, r0
	mov r6, r1
	bne _0224B608
	ldr r0, _0224B730 ; =ov45_022565C0
	ldr r1, _0224B734 ; =ov45_022565D0
	ldr r2, _0224B738 ; =ov45_02255EA4
	ldr r3, _0224B73C ; =0x00000654
	bl __msl_assertion_failed
_0224B608:
	ldr r0, [r6, #0x24]
	cmp r0, #2
	beq _0224B628
	ldr r0, _0224B740 ; =ov45_022566F0
	ldr r1, _0224B734 ; =ov45_022565D0
	ldr r2, _0224B738 ; =ov45_02255EA4
	ldr r3, _0224B744 ; =0x0000065A
	bl __msl_assertion_failed
_0224B628:
	ldr r0, [r6, #0x24]
	cmp r0, #2
	addne sp, sp, #0x2c
	ldmneia sp!, {r4, r5, r6, r7, pc}
	ldr r0, [r6, #0x20]
	add r1, r7, #0x36c
	ldmia r0, {r4, r5}
	mov r0, r4
	bl strnicmp
	cmp r0, #0
	bne _0224B6BC
	ldr r0, [r7, #0x800]
	cmp r0, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	ldr r0, [r6, #8]
	add r3, sp, #0x20
	cmp r0, #0
	strne r0, [sp, #0x20]
	moveq r0, #0
	streq r0, [sp, #0x20]
	mov r0, #4
	str r0, [sp, #0x28]
	str r5, [sp, #0x24]
	ldr r1, [r7, #0x808]
	mov r0, #0
	str r1, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r7, #0x800]
	mov r0, r7
	mov r1, #2
	bl ov45_02244D30
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, pc}
_0224B6BC:
	mov r0, r7
	mov r1, r4
	bl ov45_02247E98
	cmp r0, #0
	ldrne r1, [r0]
	cmpne r1, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	str r4, [sp, #0x10]
	ldr r1, [r6, #8]
	mov r2, #0
	cmp r1, #0
	strne r1, [sp, #0x14]
	moveq r1, #0
	streq r1, [sp, #0x14]
	mov r1, #4
	str r5, [sp, #0x18]
	str r1, [sp, #0x1c]
	ldr r3, [r0, #0x2c]
	str r3, [sp]
	stmib sp, {r2, r4}
	mov r2, #0x10
	str r2, [sp, #0xc]
	ldr r2, [r0]
	add r3, sp, #0x10
	mov r0, r7
	bl ov45_02244D30
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_0224B730: .word ov45_022565C0
_0224B734: .word ov45_022565D0
_0224B738: .word ov45_02255EA4
_0224B73C: .word 0x00000654
_0224B740: .word ov45_022566F0
_0224B744: .word 0x0000065A
	arm_func_end ov45_0224B5E0

	arm_func_start ov45_0224B748
ov45_0224B748: ; 0x0224B748
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _0224B76C
	ldr r0, _0224B780 ; =ov45_022565C0
	ldr r1, _0224B784 ; =ov45_022565D0
	ldr r2, _0224B788 ; =ov45_02255ED4
	ldr r3, _0224B78C ; =0x00000687
	bl __msl_assertion_failed
_0224B76C:
	ldr r2, [r4, #0x1c]
	ldr r1, _0224B790 ; =ov45_02256714
	add r0, r5, #0x1c
	bl ov45_02252F74
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224B780: .word ov45_022565C0
_0224B784: .word ov45_022565D0
_0224B788: .word ov45_02255ED4
_0224B78C: .word 0x00000687
_0224B790: .word ov45_02256714
	arm_func_end ov45_0224B748

	arm_func_start ov45_0224B794
ov45_0224B794: ; 0x0224B794
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	movs r4, r0
	mov r6, r1
	bne _0224B7BC
	ldr r0, _0224B8B0 ; =ov45_022565C0
	ldr r1, _0224B8B4 ; =ov45_022565D0
	ldr r2, _0224B8B8 ; =ov45_02255EE4
	ldr r3, _0224B8BC ; =0x00000694
	bl __msl_assertion_failed
_0224B7BC:
	ldr r0, [r6, #0x24]
	cmp r0, #1
	beq _0224B7DC
	ldr r0, _0224B8C0 ; =ov45_0225671C
	ldr r1, _0224B8B4 ; =ov45_022565D0
	ldr r2, _0224B8B8 ; =ov45_02255EE4
	ldr r3, _0224B8C4 ; =0x0000069A
	bl __msl_assertion_failed
_0224B7DC:
	ldr r0, [r6, #0x24]
	cmp r0, #1
	addne sp, sp, #0x18
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r5, [r6, #8]
	ldr r2, [r6, #0x20]
	mov r0, r5
	add r1, r4, #0x36c
	ldr r6, [r2]
	bl strnicmp
	cmp r0, #0
	bne _0224B898
	mov r0, r6
	bl strlen
	cmp r0, #0x40
	blo _0224B830
	ldr r0, _0224B8C8 ; =ov45_02256734
	ldr r1, _0224B8B4 ; =ov45_022565D0
	ldr r2, _0224B8B8 ; =ov45_02255EE4
	ldr r3, _0224B8CC ; =0x000006AA
	bl __msl_assertion_failed
_0224B830:
	mov r1, r6
	add r0, r4, #0x36c
	mov r2, #0x40
	bl strncpy
	mov r1, #0
	add r2, sp, #0xc
	strb r1, [r4, #0x3ab]
	str r1, [r2, #4]
	str r1, [r2, #8]
	str r1, [r2]
	mov r3, #9
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0xc]
	str r5, [sp, #0x10]
	str r6, [sp, #0x14]
	bl ov45_022496AC
	movs r1, r0
	beq _0224B898
	mov r3, #1
	add r2, sp, #0
	mov r0, r4
	str r3, [sp]
	str r5, [sp, #4]
	str r6, [sp, #8]
	bl ov45_02249A0C
_0224B898:
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl ov45_02249054
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0224B8B0: .word ov45_022565C0
_0224B8B4: .word ov45_022565D0
_0224B8B8: .word ov45_02255EE4
_0224B8BC: .word 0x00000694
_0224B8C0: .word ov45_0225671C
_0224B8C4: .word 0x0000069A
_0224B8C8: .word ov45_02256734
_0224B8CC: .word 0x000006AA
	arm_func_end ov45_0224B794

	arm_func_start ov45_0224B8D0
ov45_0224B8D0: ; 0x0224B8D0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x2c
	movs r4, r0
	mov r8, r1
	bne _0224B8F8
	ldr r0, _0224BB28 ; =ov45_022565C0
	ldr r1, _0224BB2C ; =ov45_022565D0
	ldr r2, _0224BB30 ; =ov45_02255EF4
	ldr r3, _0224BB34 ; =0x000006D6
	bl __msl_assertion_failed
_0224B8F8:
	ldr r0, [r8, #0x24]
	cmp r0, #1
	beq _0224B918
	ldr r0, _0224BB38 ; =ov45_0225671C
	ldr r1, _0224BB2C ; =ov45_022565D0
	ldr r2, _0224BB30 ; =ov45_02255EF4
	ldr r3, _0224BB3C ; =0x000006DC
	bl __msl_assertion_failed
_0224B918:
	ldr r0, [r8, #0x24]
	cmp r0, #1
	addne sp, sp, #0x2c
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r6, [r8, #8]
	ldr r1, [r8, #0x20]
	ldrsb r0, [r6]
	ldr r5, [r1]
	ldr r7, [r8, #0xc]
	cmp r0, #0x40
	ldr r8, [r8, #0x10]
	bne _0224B970
	ldrsb r0, [r6, #1]!
	mov sb, #2
	cmp r0, #0
	bne _0224B9A4
	ldr r0, _0224BB40 ; =ov45_02256750
	ldr r1, _0224BB2C ; =ov45_022565D0
	ldr r2, _0224BB30 ; =ov45_02255EF4
	ldr r3, _0224BB44 ; =0x000006EB
	bl __msl_assertion_failed
	b _0224B9A4
_0224B970:
	cmp r0, #0x2b
	bne _0224B9A0
	ldrsb r0, [r6, #1]!
	mov sb, #1
	cmp r0, #0
	bne _0224B9A4
	ldr r0, _0224BB40 ; =ov45_02256750
	ldr r1, _0224BB2C ; =ov45_022565D0
	ldr r2, _0224BB30 ; =ov45_02255EF4
	add r3, sb, #0x6f0
	bl __msl_assertion_failed
	b _0224B9A4
_0224B9A0:
	mov sb, #0
_0224B9A4:
	mov r0, r6
	add r1, r4, #0x36c
	bl strcmp
	cmp r0, #0
	mov r0, r4
	mov r1, r5
	bne _0224BA48
	bl ov45_02247AE0
	cmp r0, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	add r2, sp, #0x20
	mov r3, #0
	str r3, [r2, #4]
	mov r0, r4
	str r3, [r2]
	mov r1, #1
	str r3, [r2, #8]
	str r1, [sp, #0x20]
	str r5, [sp, #0x24]
	bl ov45_022496AC
	cmp r0, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r6, [r0, #0x1c]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl ov45_02247B94
	mov r0, r4
	mov r1, r5
	add r2, r6, #0x34
	bl ov45_02248454
	mov r3, #1
	ldr r1, _0224BB48 ; =ov45_02256760
	mov r2, r5
	add r0, r4, #0x1c
	str r3, [r6, #0x30]
	bl ov45_02252F74
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0224BA48:
	bl ov45_02248238
	cmp r0, #0
	beq _0224BA6C
	mov r0, r4
	mov r1, r6
	mov r2, r5
	mov r3, sb
	stmia sp, {r7, r8}
	bl ov45_02248888
_0224BA6C:
	mov r0, r4
	mov r1, r5
	bl ov45_0224861C
	cmp r0, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r0, r4
	mov r1, r5
	bl ov45_02247E98
	movs r7, r0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r7, #8]
	cmp r0, #0
	beq _0224BAE0
	str r5, [sp, #0x14]
	str r6, [sp, #0x18]
	str sb, [sp, #0x1c]
	ldr r1, [r7, #0x2c]
	mov r0, #0
	str r1, [sp]
	stmib sp, {r0, r5}
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r7, #8]
	add r3, sp, #0x14
	mov r0, r4
	mov r1, #6
	bl ov45_02244D30
_0224BAE0:
	ldr r0, [r7, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x2c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	str r5, [sp, #0x10]
	ldr r1, [r7, #0x2c]
	mov r0, #0
	str r1, [sp]
	stmib sp, {r0, r5}
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r2, [r7, #0x20]
	add r3, sp, #0x10
	mov r0, r4
	mov r1, #0xc
	bl ov45_02244D30
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0224BB28: .word ov45_022565C0
_0224BB2C: .word ov45_022565D0
_0224BB30: .word ov45_02255EF4
_0224BB34: .word 0x000006D6
_0224BB38: .word ov45_0225671C
_0224BB3C: .word 0x000006DC
_0224BB40: .word ov45_02256750
_0224BB44: .word 0x000006EB
_0224BB48: .word ov45_02256760
	arm_func_end ov45_0224B8D0

	arm_func_start ov45_0224BB4C
ov45_0224BB4C: ; 0x0224BB4C
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	movs r7, r0
	mov r4, r1
	bne _0224BB74
	ldr r0, _0224BC78 ; =ov45_022565C0
	ldr r1, _0224BC7C ; =ov45_022565D0
	ldr r2, _0224BC80 ; =ov45_02255F04
	ldr r3, _0224BC84 ; =0x00000752
	bl __msl_assertion_failed
_0224BB74:
	ldr r1, [r4, #0x20]
	ldr r0, [r4, #0x24]
	ldr r4, [r4, #8]
	cmp r0, #1
	ldrgt r8, [r1, #4]
	ldr r5, [r1]
	ldrle r8, _0224BC88 ; =ov45_02256708
	mov r0, r4
	add r1, r7, #0x36c
	bl strcmp
	cmp r0, #0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r7
	mov r1, r4
	mov r2, r5
	bl ov45_02248A98
	mov r0, r7
	mov r1, r5
	bl ov45_0224861C
	cmp r0, #0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r7
	mov r1, r5
	bl ov45_02247E98
	movs r6, r0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _0224BC30
	mov r2, #0
	str r5, [sp, #0x14]
	str r4, [sp, #0x18]
	str r2, [sp, #0x1c]
	str r8, [sp, #0x20]
	str r2, [sp, #0x24]
	ldr r1, [r6, #0x2c]
	mov r0, #0x14
	stmia sp, {r1, r2, r5}
	str r0, [sp, #0xc]
	ldr r2, [r6, #0xc]
	add r3, sp, #0x14
	mov r0, r7
	mov r1, #7
	bl ov45_02244D30
_0224BC30:
	ldr r0, [r6, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	str r5, [sp, #0x10]
	ldr r1, [r6, #0x2c]
	mov r0, #0
	str r1, [sp]
	stmib sp, {r0, r5}
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r2, [r6, #0x20]
	add r3, sp, #0x10
	mov r0, r7
	mov r1, #0xc
	bl ov45_02244D30
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0224BC78: .word ov45_022565C0
_0224BC7C: .word ov45_022565D0
_0224BC80: .word ov45_02255F04
_0224BC84: .word 0x00000752
_0224BC88: .word ov45_02256708
	arm_func_end ov45_0224BB4C

	arm_func_start ov45_0224BC8C
ov45_0224BC8C: ; 0x0224BC8C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x34
	movs sb, r0
	mov r5, r1
	bne _0224BCB4
	ldr r0, _0224BE58 ; =ov45_022565C0
	ldr r1, _0224BE5C ; =ov45_022565D0
	ldr r2, _0224BE60 ; =ov45_02255F14
	ldr r3, _0224BE64 ; =0x00000794
	bl __msl_assertion_failed
_0224BCB4:
	ldr r0, [r5, #0x24]
	mov r1, #1
	cmp r0, #2
	cmpne r0, #3
	movne r1, #0
	cmp r1, #0
	bne _0224BCE4
	ldr r0, _0224BE68 ; =ov45_02256768
	ldr r1, _0224BE5C ; =ov45_022565D0
	ldr r2, _0224BE60 ; =ov45_02255F14
	ldr r3, _0224BE6C ; =0x0000079A
	bl __msl_assertion_failed
_0224BCE4:
	ldr r1, [r5, #0x24]
	cmp r1, #2
	cmpne r1, #3
	addne sp, sp, #0x34
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r5, #0x20]
	cmp r1, #3
	ldreq r8, [r0, #8]
	ldmia r0, {r4, r6}
	mov r0, sb
	mov r1, r6
	mov r2, r4
	ldr r5, [r5, #8]
	ldrne r8, _0224BE70 ; =ov45_02256708
	bl ov45_02248A98
	mov r0, sb
	mov r1, r4
	bl ov45_02247E98
	movs r7, r0
	addeq sp, sp, #0x34
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r0, r6
	add r1, sb, #0x36c
	bl strnicmp
	cmp r0, #0
	bne _0224BDA8
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0224BD94
	str r4, [sp, #0x28]
	str r5, [sp, #0x2c]
	str r8, [sp, #0x30]
	ldr r1, [r7, #0x2c]
	mov r0, #0
	str r1, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0xc
	str r0, [sp, #0xc]
	ldr r2, [r7, #4]
	add r3, sp, #0x28
	mov r0, sb
	mov r1, #5
	bl ov45_02244D30
_0224BD94:
	mov r0, sb
	mov r1, r4
	bl ov45_02247D84
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
_0224BDA8:
	mov r0, sb
	mov r1, r4
	bl ov45_0224861C
	cmp r0, #0
	addeq sp, sp, #0x34
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _0224BE10
	mov r0, #2
	str r0, [sp, #0x1c]
	str r4, [sp, #0x14]
	str r6, [sp, #0x18]
	str r8, [sp, #0x20]
	str r5, [sp, #0x24]
	ldr r1, [r7, #0x2c]
	mov r0, #0
	str r1, [sp]
	stmib sp, {r0, r4}
	mov r0, #0x14
	str r0, [sp, #0xc]
	ldr r2, [r7, #0xc]
	add r3, sp, #0x14
	mov r0, sb
	mov r1, #7
	bl ov45_02244D30
_0224BE10:
	ldr r0, [r7, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x34
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	str r4, [sp, #0x10]
	ldr r1, [r7, #0x2c]
	mov r0, #0
	str r1, [sp]
	stmib sp, {r0, r4}
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r2, [r7, #0x20]
	add r3, sp, #0x10
	mov r0, sb
	mov r1, #0xc
	bl ov45_02244D30
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0224BE58: .word ov45_022565C0
_0224BE5C: .word ov45_022565D0
_0224BE60: .word ov45_02255F14
_0224BE64: .word 0x00000794
_0224BE68: .word ov45_02256768
_0224BE6C: .word 0x0000079A
_0224BE70: .word ov45_02256708
	arm_func_end ov45_0224BC8C

	arm_func_start ov45_0224BE74
ov45_0224BE74: ; 0x0224BE74
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	movs r7, r1
	mov r8, r0
	mov r6, r2
	mov r5, r3
	bne _0224BEA4
	ldr r0, _0224BFF0 ; =ov45_022567A0
	ldr r1, _0224BFF4 ; =ov45_022565D0
	ldr r2, _0224BFF8 ; =ov45_02256324
	ldr r3, _0224BFFC ; =0x000007E6
	bl __msl_assertion_failed
_0224BEA4:
	ldrsb r0, [r7]
	cmp r0, #0
	bne _0224BEC4
	ldr r0, _0224C000 ; =ov45_022567B0
	ldr r1, _0224BFF4 ; =ov45_022565D0
	ldr r2, _0224BFF8 ; =ov45_02256324
	ldr r3, _0224BFFC ; =0x000007E6
	bl __msl_assertion_failed
_0224BEC4:
	cmp r6, #0
	bne _0224BEE0
	ldr r0, _0224C004 ; =ov45_022567C0
	ldr r1, _0224BFF4 ; =ov45_022565D0
	ldr r2, _0224BFF8 ; =ov45_02256324
	ldr r3, _0224C008 ; =0x000007E7
	bl __msl_assertion_failed
_0224BEE0:
	ldrsb r0, [r6]
	cmp r0, #0
	bne _0224BF00
	ldr r0, _0224C00C ; =ov45_022567D0
	ldr r1, _0224BFF4 ; =ov45_022565D0
	ldr r2, _0224BFF8 ; =ov45_02256324
	ldr r3, _0224C008 ; =0x000007E7
	bl __msl_assertion_failed
_0224BF00:
	cmp r5, #0
	bne _0224BF1C
	ldr r0, _0224C010 ; =ov45_022567E4
	ldr r1, _0224BFF4 ; =ov45_022565D0
	ldr r2, _0224BFF8 ; =ov45_02256324
	ldr r3, _0224C014 ; =0x000007E8
	bl __msl_assertion_failed
_0224BF1C:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl ov45_02248A98
	mov r0, r8
	mov r1, r6
	bl ov45_0224861C
	cmp r0, #0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r8
	mov r1, r6
	bl ov45_02247E98
	movs r4, r0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0224BFA8
	mov r0, #1
	mov r2, #0
	str r0, [sp, #0x1c]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	str r5, [sp, #0x20]
	str r2, [sp, #0x24]
	ldr r1, [r4, #0x2c]
	mov r0, #0x14
	stmia sp, {r1, r2, r6}
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	add r3, sp, #0x14
	mov r0, r8
	mov r1, #7
	bl ov45_02244D30
_0224BFA8:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	str r6, [sp, #0x10]
	ldr r1, [r4, #0x2c]
	mov r0, #0
	str r1, [sp]
	stmib sp, {r0, r6}
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x20]
	add r3, sp, #0x10
	mov r0, r8
	mov r1, #0xc
	bl ov45_02244D30
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0224BFF0: .word ov45_022567A0
_0224BFF4: .word ov45_022565D0
_0224BFF8: .word ov45_02256324
_0224BFFC: .word 0x000007E6
_0224C000: .word ov45_022567B0
_0224C004: .word ov45_022567C0
_0224C008: .word 0x000007E7
_0224C00C: .word ov45_022567D0
_0224C010: .word ov45_022567E4
_0224C014: .word 0x000007E8
	arm_func_end ov45_0224BE74

	arm_func_start ov45_0224C018
ov45_0224C018: ; 0x0224C018
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _0224C03C
	ldr r0, _0224C084 ; =ov45_022565C0
	ldr r1, _0224C088 ; =ov45_022565D0
	ldr r2, _0224C08C ; =ov45_02255F24
	ldr r3, _0224C090 ; =0x00000813
	bl __msl_assertion_failed
_0224C03C:
	ldr r0, [r4, #0x24]
	cmp r0, #1
	beq _0224C05C
	ldr r0, _0224C094 ; =ov45_0225671C
	ldr r1, _0224C088 ; =ov45_022565D0
	ldr r2, _0224C08C ; =ov45_02255F24
	ldr r3, _0224C098 ; =0x00000819
	bl __msl_assertion_failed
_0224C05C:
	ldr r0, [r4, #0x24]
	cmp r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #0x20]
	ldr r1, [r4, #8]
	ldr r3, [r0]
	ldr r2, _0224C09C ; =ov45_0224BE74
	mov r0, r5
	bl ov45_02248CE8
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224C084: .word ov45_022565C0
_0224C088: .word ov45_022565D0
_0224C08C: .word ov45_02255F24
_0224C090: .word 0x00000813
_0224C094: .word ov45_0225671C
_0224C098: .word 0x00000819
_0224C09C: .word ov45_0224BE74
	arm_func_end ov45_0224C018

	arm_func_start ov45_0224C0A0
ov45_0224C0A0: ; 0x0224C0A0
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x28
	movs r7, r1
	mov r8, r0
	mov r6, r2
	mov r5, r3
	bne _0224C0D0
	ldr r0, _0224C21C ; =ov45_022567A0
	ldr r1, _0224C220 ; =ov45_022565D0
	ldr r2, _0224C224 ; =ov45_02256340
	ldr r3, _0224C228 ; =0x00000828
	bl __msl_assertion_failed
_0224C0D0:
	ldrsb r0, [r7]
	cmp r0, #0
	bne _0224C0F0
	ldr r0, _0224C22C ; =ov45_022567B0
	ldr r1, _0224C220 ; =ov45_022565D0
	ldr r2, _0224C224 ; =ov45_02256340
	ldr r3, _0224C228 ; =0x00000828
	bl __msl_assertion_failed
_0224C0F0:
	cmp r6, #0
	bne _0224C10C
	ldr r0, _0224C230 ; =ov45_022567C0
	ldr r1, _0224C220 ; =ov45_022565D0
	ldr r2, _0224C224 ; =ov45_02256340
	ldr r3, _0224C234 ; =0x00000829
	bl __msl_assertion_failed
_0224C10C:
	ldrsb r0, [r6]
	cmp r0, #0
	bne _0224C12C
	ldr r0, _0224C238 ; =ov45_022567D0
	ldr r1, _0224C220 ; =ov45_022565D0
	ldr r2, _0224C224 ; =ov45_02256340
	ldr r3, _0224C234 ; =0x00000829
	bl __msl_assertion_failed
_0224C12C:
	cmp r5, #0
	bne _0224C148
	ldr r0, _0224C23C ; =ov45_022567E4
	ldr r1, _0224C220 ; =ov45_022565D0
	ldr r2, _0224C224 ; =ov45_02256340
	ldr r3, _0224C240 ; =0x0000082A
	bl __msl_assertion_failed
_0224C148:
	mov r0, r8
	mov r1, r7
	mov r2, r6
	bl ov45_02248A98
	mov r0, r8
	mov r1, r6
	bl ov45_0224861C
	cmp r0, #0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r8
	mov r1, r6
	bl ov45_02247E98
	movs r4, r0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0224C1D4
	mov r0, #3
	mov r2, #0
	str r0, [sp, #0x1c]
	str r6, [sp, #0x14]
	str r7, [sp, #0x18]
	str r5, [sp, #0x20]
	str r2, [sp, #0x24]
	ldr r1, [r4, #0x2c]
	mov r0, #0x14
	stmia sp, {r1, r2, r6}
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	add r3, sp, #0x14
	mov r0, r8
	mov r1, #7
	bl ov45_02244D30
_0224C1D4:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	str r6, [sp, #0x10]
	ldr r1, [r4, #0x2c]
	mov r0, #0
	str r1, [sp]
	stmib sp, {r0, r6}
	mov r0, #4
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x20]
	add r3, sp, #0x10
	mov r0, r8
	mov r1, #0xc
	bl ov45_02244D30
	add sp, sp, #0x28
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0224C21C: .word ov45_022567A0
_0224C220: .word ov45_022565D0
_0224C224: .word ov45_02256340
_0224C228: .word 0x00000828
_0224C22C: .word ov45_022567B0
_0224C230: .word ov45_022567C0
_0224C234: .word 0x00000829
_0224C238: .word ov45_022567D0
_0224C23C: .word ov45_022567E4
_0224C240: .word 0x0000082A
	arm_func_end ov45_0224C0A0

	arm_func_start ov45_0224C244
ov45_0224C244: ; 0x0224C244
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	ldr r1, [r4, #0x24]
	mov r5, r0
	cmp r1, #2
	beq _0224C270
	ldr r0, _0224C294 ; =ov45_022566F0
	ldr r1, _0224C298 ; =ov45_022565D0
	ldr r2, _0224C29C ; =ov45_02255F34
	ldr r3, _0224C2A0 ; =0x00000859
	bl __msl_assertion_failed
_0224C270:
	ldr r0, [r4, #0x24]
	cmp r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #0x20]
	ldr r2, _0224C2A4 ; =ov45_0224C0A0
	ldmia r0, {r1, r3}
	mov r0, r5
	bl ov45_02248CE8
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224C294: .word ov45_022566F0
_0224C298: .word ov45_022565D0
_0224C29C: .word ov45_02255F34
_0224C2A0: .word 0x00000859
_0224C2A4: .word ov45_0224C0A0
	arm_func_end ov45_0224C244

	arm_func_start ov45_0224C2A8
ov45_0224C2A8: ; 0x0224C2A8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x18
	movs r4, r0
	mov r5, r1
	bne _0224C2D0
	ldr r0, _0224C374 ; =ov45_022565C0
	ldr r1, _0224C378 ; =ov45_022565D0
	ldr r2, _0224C37C ; =ov45_02255F54
	ldr r3, _0224C380 ; =0x0000086A
	bl __msl_assertion_failed
_0224C2D0:
	ldr r0, [r5, #0x24]
	cmp r0, #2
	beq _0224C2F0
	ldr r0, _0224C384 ; =ov45_022566F0
	ldr r1, _0224C378 ; =ov45_022565D0
	ldr r2, _0224C37C ; =ov45_02255F54
	mov r3, #0x870
	bl __msl_assertion_failed
_0224C2F0:
	ldr r0, [r5, #0x24]
	cmp r0, #2
	addne sp, sp, #0x18
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r1, [r5, #0x20]
	mov r0, r4
	ldmia r1, {r5, r6}
	mov r1, r5
	mov r2, r6
	bl ov45_022486E0
	mov r0, r4
	mov r1, r5
	bl ov45_02247E98
	cmp r0, #0
	ldrne r1, [r0, #0x14]
	cmpne r1, #0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r4, r5, r6, pc}
	str r5, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r2, [r0, #0x2c]
	mov r1, #0
	str r2, [sp]
	stmib sp, {r1, r5}
	mov r1, #8
	str r1, [sp, #0xc]
	ldr r2, [r0, #0x14]
	add r3, sp, #0x10
	mov r0, r4
	mov r1, #9
	bl ov45_02244D30
	add sp, sp, #0x18
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0224C374: .word ov45_022565C0
_0224C378: .word ov45_022565D0
_0224C37C: .word ov45_02255F54
_0224C380: .word 0x0000086A
_0224C384: .word ov45_022566F0
	arm_func_end ov45_0224C2A8

	arm_func_start ov45_0224C388
ov45_0224C388: ; 0x0224C388
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x28
	mov r4, r1
	ldr r1, [r4, #0x24]
	mov sb, r0
	cmp r1, #2
	bge _0224C3B8
	ldr r0, _0224C57C ; =ov45_022567F4
	ldr r1, _0224C580 ; =ov45_022565D0
	ldr r2, _0224C584 ; =ov45_02255F44
	ldr r3, _0224C588 ; =0x00000893
	bl __msl_assertion_failed
_0224C3B8:
	ldr r0, [r4, #0x24]
	cmp r0, #2
	addlt sp, sp, #0x28
	ldmltia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r4, #0x20]
	mov r0, sb
	ldr r8, [r1]
	ldr r5, [r1, #4]
	mov r1, r8
	bl ov45_02248238
	cmp r0, #0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r4, #0x20]
	ldr r2, [r4, #0x24]
	mov r0, r5
	add r1, r1, #8
	sub r2, r2, #2
	bl ov45_0224AD24
	str r0, [sp, #4]
	cmp r0, #0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r0]
	ldr r7, [sp, #4]
	cmp r0, #0
	beq _0224C528
	ldr sl, _0224C58C ; =ov45_02256690
	ldr fp, _0224C580 ; =ov45_022565D0
	mov r4, #1
	mov r5, #2
	mov r6, #0
_0224C438:
	ldr r0, [r7]
	cmp r0, #0xe
	addls pc, pc, r0, lsl #2
	b _0224C508
_0224C448: ; jump table
	b _0224C508 ; case 0
	b _0224C51C ; case 1
	b _0224C51C ; case 2
	b _0224C51C ; case 3
	b _0224C51C ; case 4
	b _0224C51C ; case 5
	b _0224C484 ; case 6
	b _0224C51C ; case 7
	b _0224C51C ; case 8
	b _0224C51C ; case 9
	b _0224C4B8 ; case 10
	b _0224C4E0 ; case 11
	b _0224C51C ; case 12
	b _0224C51C ; case 13
	b _0224C51C ; case 14
_0224C484:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0224C4A4
	ldr r2, [r7, #8]
	mov r0, sb
	mov r1, r8
	bl ov45_02248454
	b _0224C51C
_0224C4A4:
	mov r0, sb
	mov r1, r8
	mov r2, r6
	bl ov45_02248454
	b _0224C51C
_0224C4B8:
	ldr r1, [r7, #8]
	cmp r1, #0
	beq _0224C51C
	ldr r2, [r7, #4]
	mov r0, sb
	str r2, [sp]
	mov r2, r8
	mov r3, r5
	bl ov45_02249194
	b _0224C51C
_0224C4E0:
	ldr r1, [r7, #8]
	cmp r1, #0
	beq _0224C51C
	ldr r2, [r7, #4]
	mov r0, sb
	str r2, [sp]
	mov r2, r8
	mov r3, r4
	bl ov45_02249194
	b _0224C51C
_0224C508:
	ldr r2, _0224C584 ; =ov45_02255F44
	ldr r3, _0224C590 ; =0x000008DC
	mov r0, sl
	mov r1, fp
	bl __msl_assertion_failed
_0224C51C:
	ldr r0, [r7, #0xc]!
	cmp r0, #0
	bne _0224C438
_0224C528:
	add r2, sp, #8
	mov r0, sb
	mov r1, r8
	bl ov45_02248288
	cmp r0, #0
	bne _0224C550
	ldr r0, [sp, #4]
	bl ov00_021EC3D8
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224C550:
	ldr r1, [sp, #4]
	add r0, sp, #8
	bl ov45_0224AFD8
	add r2, sp, #8
	mov r0, sb
	mov r1, r8
	bl ov45_02248374
	ldr r0, [sp, #4]
	bl ov00_021EC3D8
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0224C57C: .word ov45_022567F4
_0224C580: .word ov45_022565D0
_0224C584: .word ov45_02255F44
_0224C588: .word 0x00000893
_0224C58C: .word ov45_02256690
_0224C590: .word 0x000008DC
	arm_func_end ov45_0224C388

	arm_func_start ov45_0224C594
ov45_0224C594: ; 0x0224C594
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _0224C5B8
	ldr r0, _0224C5F8 ; =ov45_022565C0
	ldr r1, _0224C5FC ; =ov45_022565D0
	ldr r2, _0224C600 ; =ov45_02255F64
	ldr r3, _0224C604 ; =0x000008F1
	bl __msl_assertion_failed
_0224C5B8:
	ldr r0, [r4, #0x24]
	cmp r0, #1
	beq _0224C5D8
	ldr r0, _0224C608 ; =ov45_0225671C
	ldr r1, _0224C5FC ; =ov45_022565D0
	ldr r2, _0224C600 ; =ov45_02255F64
	ldr r3, _0224C60C ; =0x000008F7
	bl __msl_assertion_failed
_0224C5D8:
	ldr r0, [r4, #0x24]
	cmp r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, [r4, #0x20]
	mov r0, r5
	ldr r1, [r1]
	bl ov45_0224F69C
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224C5F8: .word ov45_022565C0
_0224C5FC: .word ov45_022565D0
_0224C600: .word ov45_02255F64
_0224C604: .word 0x000008F1
_0224C608: .word ov45_0225671C
_0224C60C: .word 0x000008F7
	arm_func_end ov45_0224C594

	arm_func_start ov45_0224C610
ov45_0224C610: ; 0x0224C610
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	movs r4, r0
	mov r5, r1
	bne _0224C638
	ldr r0, _0224C6C4 ; =ov45_022565C0
	ldr r1, _0224C6C8 ; =ov45_022565D0
	ldr r2, _0224C6CC ; =ov45_02255FB4
	ldr r3, _0224C6D0 ; =0x00000904
	bl __msl_assertion_failed
_0224C638:
	ldr r0, [r5, #0x24]
	cmp r0, #2
	beq _0224C658
	ldr r0, _0224C6D4 ; =ov45_022566F0
	ldr r1, _0224C6C8 ; =ov45_022565D0
	ldr r2, _0224C6CC ; =ov45_02255FB4
	ldr r3, _0224C6D8 ; =0x0000090A
	bl __msl_assertion_failed
_0224C658:
	ldr r0, [r5, #0x24]
	cmp r0, #2
	addne sp, sp, #0x18
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #0x804]
	ldr r1, [r5, #0x20]
	cmp r0, #0
	addeq sp, sp, #0x18
	ldr r2, [r5, #8]
	ldr r0, [r1, #4]
	ldmeqia sp!, {r3, r4, r5, pc}
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	ldr r1, [r4, #0x808]
	mov r0, #0
	str r1, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #8
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x804]
	add r3, sp, #0x10
	mov r0, r4
	mov r1, #3
	bl ov45_02244D30
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224C6C4: .word ov45_022565C0
_0224C6C8: .word ov45_022565D0
_0224C6CC: .word ov45_02255FB4
_0224C6D0: .word 0x00000904
_0224C6D4: .word ov45_022566F0
_0224C6D8: .word 0x0000090A
	arm_func_end ov45_0224C610

	arm_func_start ov45_0224C6DC
ov45_0224C6DC: ; 0x0224C6DC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	mov r4, r1
	ldr r1, [r4, #0x24]
	str r0, [sp, #8]
	cmp r1, #4
	mov r8, #0
	beq _0224C710
	ldr r0, _0224C9A8 ; =ov45_0225680C
	ldr r1, _0224C9AC ; =ov45_022565D0
	ldr r2, _0224C9B0 ; =ov45_02256088
	ldr r3, _0224C9B4 ; =0x0000092F
	bl __msl_assertion_failed
_0224C710:
	ldr r0, [r4, #0x24]
	cmp r0, #4
	addne sp, sp, #0x40
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r4, #0x20]
	add r2, sp, #0x10
	mov r0, #0
	ldr r7, [r1, #8]
	ldr r4, [r1, #0xc]
	mov r3, r2
	mov r1, r0
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3, {r0, r1}
	mov r3, #3
	mov r6, #1
	mov r5, #0xf
	ldr r0, [sp, #8]
	mov r1, #4
	str r6, [sp, #0x10]
	str r7, [sp, #0x14]
	str r5, [sp, #0x1c]
	str r7, [sp, #0x20]
	str r3, [sp, #0x28]
	str r7, [sp, #0x2c]
	str r3, [sp, #0x34]
	bl ov45_022496AC
	movs r6, r0
	addeq sp, sp, #0x40
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [r6]
	ldr r1, _0224C9B8 ; =ov45_02256824
	cmp r0, #1
	ldrne r8, [r6, #0x1c]
	mov r0, r4
	bl strtok
	movs sb, r0
	addeq sp, sp, #0x40
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _0224C9BC ; =0x00000957
	ldr fp, _0224C9AC ; =ov45_022565D0
	sub r0, r0, #6
	str r0, [sp, #0xc]
_0224C7C8:
	ldrsb r0, [sb]
	cmp r0, #0
	bne _0224C7E8
	ldr r0, _0224C9C0 ; =ov45_02256828
	ldr r2, _0224C9B0 ; =ov45_02256088
	ldr r3, [sp, #0xc]
	mov r1, fp
	bl __msl_assertion_failed
_0224C7E8:
	ldrsb r0, [sb]
	cmp r0, #0x40
	bne _0224C820
	ldrsb r0, [sb, #1]
	cmp r0, #0
	bne _0224C814
	ldr r0, _0224C9C4 ; =ov45_02256838
	ldr r2, _0224C9B0 ; =ov45_02256088
	ldr r3, _0224C9BC ; =0x00000957
	mov r1, fp
	bl __msl_assertion_failed
_0224C814:
	mov sl, #2
	add sb, sb, #1
	b _0224C85C
_0224C820:
	cmp r0, #0x2b
	bne _0224C858
	ldrsb r0, [sb, #1]
	cmp r0, #0
	bne _0224C84C
	ldr r3, _0224C9BC ; =0x00000957
	ldr r0, _0224C9C4 ; =ov45_02256838
	ldr r2, _0224C9B0 ; =ov45_02256088
	mov r1, fp
	add r3, r3, #6
	bl __msl_assertion_failed
_0224C84C:
	mov sl, #1
	add sb, sb, #1
	b _0224C85C
_0224C858:
	mov sl, #0
_0224C85C:
	ldr r0, [r6]
	cmp r0, #1
	beq _0224C95C
	ldr r1, [r8]
	ldr r0, [r8, #4]
	cmp r0, r1
	bne _0224C8F8
	add r0, r1, #0x64
	mov r1, r0, lsl #2
	ldr r0, [r8, #8]
	bl ov00_021EC3BC
	cmp r0, #0
	bne _0224C8AC
	ldr r0, _0224C9C8 ; =ov45_02256690
	ldr r1, _0224C9AC ; =ov45_022565D0
	ldr r2, _0224C9B0 ; =ov45_02256088
	ldr r3, _0224C9CC ; =0x0000096D
	bl __msl_assertion_failed
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224C8AC:
	str r0, [r8, #8]
	ldr r0, [r8, #0xc]
	ldr r1, [r8]
	add r1, r1, #0x64
	mov r1, r1, lsl #2
	bl ov00_021EC3BC
	cmp r0, #0
	bne _0224C8E8
	ldr r0, _0224C9C8 ; =ov45_02256690
	ldr r1, _0224C9AC ; =ov45_022565D0
	ldr r2, _0224C9B0 ; =ov45_02256088
	ldr r3, _0224C9D0 ; =0x00000974
	bl __msl_assertion_failed
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224C8E8:
	str r0, [r8, #0xc]
	ldr r0, [r8]
	add r0, r0, #0x64
	str r0, [r8]
_0224C8F8:
	mov r0, sb
	bl strlen
	mov r5, r0
	add r0, r5, #1
	bl ov00_021EC3A8
	movs r4, r0
	bne _0224C930
	ldr r0, _0224C9C8 ; =ov45_02256690
	ldr r1, _0224C9AC ; =ov45_022565D0
	ldr r2, _0224C9B0 ; =ov45_02256088
	ldr r3, _0224C9D4 ; =0x00000981
	bl __msl_assertion_failed
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224C930:
	add r2, r5, #1
	mov r1, sb
	bl memcpy
	ldmib r8, {r0, r1}
	str r4, [r1, r0, lsl #2]
	ldr r1, [r8, #0xc]
	ldr r0, [r8, #4]
	str sl, [r1, r0, lsl #2]
	ldr r0, [r8, #4]
	add r0, r0, #1
	str r0, [r8, #4]
_0224C95C:
	ldr r0, [r6]
	cmp r0, #1
	cmpne r0, #0xf
	bne _0224C98C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #8]
	mov r1, sb
	mov r3, sl
	mov r2, r7
	bl ov45_02248888
_0224C98C:
	ldr r1, _0224C9B8 ; =ov45_02256824
	mov r0, #0
	bl strtok
	movs sb, r0
	bne _0224C7C8
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0224C9A8: .word ov45_0225680C
_0224C9AC: .word ov45_022565D0
_0224C9B0: .word ov45_02256088
_0224C9B4: .word 0x0000092F
_0224C9B8: .word ov45_02256824
_0224C9BC: .word 0x00000957
_0224C9C0: .word ov45_02256828
_0224C9C4: .word ov45_02256838
_0224C9C8: .word ov45_02256690
_0224C9CC: .word 0x0000096D
_0224C9D0: .word 0x00000974
_0224C9D4: .word 0x00000981
	arm_func_end ov45_0224C6DC

	arm_func_start ov45_0224C9D8
ov45_0224C9D8: ; 0x0224C9D8
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x60
	movs r6, r0
	mov r4, r1
	bne _0224CA00
	ldr r0, _0224CB90 ; =ov45_022565C0
	ldr r1, _0224CB94 ; =ov45_022565D0
	ldr r2, _0224CB98 ; =ov45_022560D8
	ldr r3, _0224CB9C ; =0x0000099F
	bl __msl_assertion_failed
_0224CA00:
	ldr r0, [r4, #0x24]
	cmp r0, #3
	beq _0224CA20
	ldr r0, _0224CBA0 ; =ov45_02256848
	ldr r1, _0224CB94 ; =ov45_022565D0
	ldr r2, _0224CB98 ; =ov45_022560D8
	ldr r3, _0224CBA4 ; =0x000009A5
	bl __msl_assertion_failed
_0224CA20:
	ldr r0, [r4, #0x24]
	cmp r0, #3
	addne sp, sp, #0x60
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r0, [r4, #0x20]
	ldr r1, _0224CBA8 ; =ov45_02256860
	ldr r5, [r0, #4]
	mov r0, r5
	bl strcmp
	cmp r0, #0
	add r2, sp, #0x30
	mov r0, #0
	mov r3, r2
	mov r1, r0
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3, {r0, r1}
	moveq r5, #0
	mov r3, #3
	mov ip, #1
	mov r4, #0xf
	mov r0, r6
	mov r1, #4
	str ip, [sp, #0x30]
	str r5, [sp, #0x34]
	str r4, [sp, #0x3c]
	str r5, [sp, #0x40]
	str r3, [sp, #0x48]
	str r5, [sp, #0x4c]
	str r3, [sp, #0x54]
	bl ov45_022496AC
	movs r4, r0
	addeq sp, sp, #0x60
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r4]
	cmp r0, #1
	bne _0224CB04
	mov r1, #1
	mov r0, #0
	str r1, [sp, #0x24]
	str r0, [sp, #0x28]
	str r5, [sp, #0x2c]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0224CAEC
	mov r0, r6
	mov r1, r5
	bl ov45_02248558
_0224CAEC:
	add r2, sp, #0x24
	mov r0, r6
	mov r1, r4
	bl ov45_02249A0C
	add sp, sp, #0x60
	ldmia sp!, {r4, r5, r6, pc}
_0224CB04:
	cmp r0, #0xf
	bne _0224CB44
	ldr ip, [r4, #0x1c]
	add r2, sp, #0x14
	str r5, [sp, #0x14]
	ldr r1, [ip, #4]
	mov r0, r6
	str r1, [sp, #0x18]
	ldr r3, [ip, #8]
	mov r1, r4
	str r3, [sp, #0x1c]
	ldr r3, [ip, #0xc]
	str r3, [sp, #0x20]
	bl ov45_02249A0C
	add sp, sp, #0x60
	ldmia sp!, {r4, r5, r6, pc}
_0224CB44:
	cmp r0, #3
	addne sp, sp, #0x60
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r3, [r4, #0x1c]
	mov r0, #1
	str r5, [sp, #4]
	str r0, [sp]
	ldr r0, [r3, #4]
	add r2, sp, #0
	str r0, [sp, #8]
	ldr r1, [r3, #8]
	mov r0, r6
	str r1, [sp, #0xc]
	ldr r3, [r3, #0xc]
	mov r1, r4
	str r3, [sp, #0x10]
	bl ov45_02249A0C
	add sp, sp, #0x60
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0224CB90: .word ov45_022565C0
_0224CB94: .word ov45_022565D0
_0224CB98: .word ov45_022560D8
_0224CB9C: .word 0x0000099F
_0224CBA0: .word ov45_02256848
_0224CBA4: .word 0x000009A5
_0224CBA8: .word ov45_02256860
	arm_func_end ov45_0224C9D8

	arm_func_start ov45_0224CBAC
ov45_0224CBAC: ; 0x0224CBAC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x30
	mov r4, r1
	ldr r1, [r4, #0x24]
	mov r5, r0
	cmp r1, #3
	beq _0224CBDC
	ldr r0, _0224CCB8 ; =ov45_02256848
	ldr r1, _0224CCBC ; =ov45_022565D0
	ldr r2, _0224CCC0 ; =ov45_0225604C
	ldr r3, _0224CCC4 ; =0x00000A05
	bl __msl_assertion_failed
_0224CBDC:
	ldr r0, [r4, #0x24]
	cmp r0, #3
	addne sp, sp, #0x30
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r1, [r4, #0x20]
	mov r0, r5
	ldmib r1, {r4, r6}
	mov r1, r4
	mov r2, r6
	bl ov45_022486E0
	add r2, sp, #0x24
	mov ip, #0
	str ip, [r2, #4]
	mov r0, r5
	str ip, [r2]
	mov r3, #2
	mov r1, #1
	str ip, [r2, #8]
	str r3, [sp, #0x24]
	str r4, [sp, #0x28]
	bl ov45_022496AC
	movs r1, r0
	beq _0224CC5C
	mov r3, #1
	add r2, sp, #0x18
	mov r0, r5
	str r3, [sp, #0x18]
	str r4, [sp, #0x1c]
	str r6, [sp, #0x20]
	bl ov45_02249A0C
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, pc}
_0224CC5C:
	mov r0, r5
	mov r1, r4
	bl ov45_02247E98
	cmp r0, #0
	ldrne r1, [r0, #0x14]
	cmpne r1, #0
	addeq sp, sp, #0x30
	ldmeqia sp!, {r4, r5, r6, pc}
	str r4, [sp, #0x10]
	str r6, [sp, #0x14]
	ldr r2, [r0, #0x2c]
	mov r1, #0
	str r2, [sp]
	stmib sp, {r1, r4}
	mov r1, #8
	str r1, [sp, #0xc]
	ldr r2, [r0, #0x14]
	add r3, sp, #0x10
	mov r0, r5
	mov r1, #9
	bl ov45_02244D30
	add sp, sp, #0x30
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0224CCB8: .word ov45_02256848
_0224CCBC: .word ov45_022565D0
_0224CCC0: .word ov45_0225604C
_0224CCC4: .word 0x00000A05
	arm_func_end ov45_0224CBAC

	arm_func_start ov45_0224CCC8
ov45_0224CCC8: ; 0x0224CCC8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x30
	mov r4, r1
	ldr r1, [r4, #0x24]
	mov r5, r0
	cmp r1, #2
	bge _0224CCF8
	ldr r0, _0224CDCC ; =ov45_022567F4
	ldr r1, _0224CDD0 ; =ov45_022565D0
	ldr r2, _0224CDD4 ; =ov45_02256100
	ldr r3, _0224CDD8 ; =0x00000A3C
	bl __msl_assertion_failed
_0224CCF8:
	ldr r0, [r4, #0x24]
	cmp r0, #2
	addlt sp, sp, #0x30
	ldmltia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #0x20]
	add r2, sp, #0x24
	ldr r4, [r0, #4]
	mov ip, #0
	str ip, [r2, #4]
	mov r0, r5
	str ip, [r2]
	mov r3, #2
	mov r1, #1
	str ip, [r2, #8]
	str r3, [sp, #0x24]
	str r4, [sp, #0x28]
	bl ov45_022496AC
	movs r1, r0
	beq _0224CD6C
	ldr r3, _0224CDDC ; =ov45_02256708
	mov ip, #1
	add r2, sp, #0x18
	mov r0, r5
	str ip, [sp, #0x18]
	str r4, [sp, #0x1c]
	str r3, [sp, #0x20]
	bl ov45_02249A0C
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, pc}
_0224CD6C:
	mov r0, r5
	mov r1, r4
	bl ov45_02247E98
	cmp r0, #0
	ldrne r1, [r0, #0x14]
	cmpne r1, #0
	addeq sp, sp, #0x30
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, _0224CDDC ; =ov45_02256708
	str r4, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r2, [r0, #0x2c]
	mov r1, #0
	str r2, [sp]
	stmib sp, {r1, r4}
	mov r1, #8
	str r1, [sp, #0xc]
	ldr r2, [r0, #0x14]
	add r3, sp, #0x10
	mov r0, r5
	mov r1, #9
	bl ov45_02244D30
	add sp, sp, #0x30
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224CDCC: .word ov45_022567F4
_0224CDD0: .word ov45_022565D0
_0224CDD4: .word ov45_02256100
_0224CDD8: .word 0x00000A3C
_0224CDDC: .word ov45_02256708
	arm_func_end ov45_0224CCC8

	arm_func_start ov45_0224CDE0
ov45_0224CDE0: ; 0x0224CDE0
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x1c
	movs r4, r0
	mov r5, r1
	bne _0224CE08
	ldr r0, _0224CEEC ; =ov45_022565C0
	ldr r1, _0224CEF0 ; =ov45_022565D0
	ldr r2, _0224CEF4 ; =ov45_022561D0
	ldr r3, _0224CEF8 ; =0x00000A6D
	bl __msl_assertion_failed
_0224CE08:
	ldr r0, [r5, #0x24]
	cmp r0, #3
	beq _0224CE28
	ldr r0, _0224CEFC ; =ov45_02256848
	ldr r1, _0224CEF0 ; =ov45_022565D0
	ldr r2, _0224CEF4 ; =ov45_022561D0
	ldr r3, _0224CF00 ; =0x00000A73
	bl __msl_assertion_failed
_0224CE28:
	ldr r0, [r5, #0x24]
	cmp r0, #3
	addne sp, sp, #0x1c
	ldmneia sp!, {r3, r4, r5, r6, pc}
	ldr r0, [r5, #0x20]
	add r2, sp, #0x10
	ldmia r0, {r5, r6}
	mov r1, #0
	str r1, [r2, #4]
	str r1, [r2, #8]
	str r1, [r2]
	mov r3, #9
	mov r0, r4
	mov r1, #1
	str r3, [sp, #0x10]
	str r5, [sp, #0x14]
	str r6, [sp, #0x18]
	bl ov45_022496AC
	movs r1, r0
	beq _0224CE9C
	mov r3, #0
	add r2, sp, #4
	mov r0, r4
	str r3, [sp, #4]
	str r5, [sp, #8]
	str r6, [sp, #0xc]
	bl ov45_02249A0C
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, pc}
_0224CE9C:
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _0224CEBC
	ldr r0, _0224CF04 ; =ov45_02256864
	ldr r1, _0224CEF0 ; =ov45_022565D0
	ldr r2, _0224CEF4 ; =ov45_022561D0
	ldr r3, _0224CF08 ; =0x00000A93
	bl __msl_assertion_failed
_0224CEBC:
	ldr r0, [r4, #4]
	cmp r0, #0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	mov r3, #0
	mov r0, r4
	add r2, r4, #0x36c
	mov r1, #1
	str r3, [sp]
	bl ov45_02251B0C
	add sp, sp, #0x1c
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_0224CEEC: .word ov45_022565C0
_0224CEF0: .word ov45_022565D0
_0224CEF4: .word ov45_022561D0
_0224CEF8: .word 0x00000A6D
_0224CEFC: .word ov45_02256848
_0224CF00: .word 0x00000A73
_0224CF04: .word ov45_02256864
_0224CF08: .word 0x00000A93
	arm_func_end ov45_0224CDE0

	arm_func_start ov45_0224CF0C
ov45_0224CF0C: ; 0x0224CF0C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x68
	mov sb, r1
	ldr r1, [sb, #0x24]
	mov sl, r0
	cmp r1, #8
	beq _0224CF3C
	ldr r0, _0224D118 ; =ov45_0225687C
	ldr r1, _0224D11C ; =ov45_022565D0
	ldr r2, _0224D120 ; =ov45_02256140
	ldr r3, _0224D124 ; =0x00000AA6
	bl __msl_assertion_failed
_0224CF3C:
	ldr r0, [sb, #0x24]
	cmp r0, #8
	addne sp, sp, #0x68
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r4, [sb, #0x20]
	mov r0, sl
	ldr r6, [r4, #8]
	ldr r7, [r4, #0xc]
	ldr r5, [r4, #0x14]
	mov r2, r6
	mov r1, r5
	mov r3, r7
	ldr r4, [r4, #4]
	bl ov45_02249460
	add r2, sp, #0x44
	mov r0, #0
	mov r3, r2
	mov r1, r0
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	stmia r3!, {r0, r1}
	str r0, [r3]
	mov r1, #6
	mov r0, #0xa
	str r1, [sp, #0x44]
	mov r1, #0xb
	str r0, [sp, #0x50]
	str r1, [sp, #0x5c]
	mov r0, sl
	mov r1, #3
	str r5, [sp, #0x48]
	str r4, [sp, #0x4c]
	str r5, [sp, #0x54]
	str r4, [sp, #0x60]
	bl ov45_022496AC
	movs r8, r0
	addeq sp, sp, #0x68
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, [r8]
	cmp r0, #6
	bne _0224D044
	ldr r0, [sb, #0x20]
	mov r1, #0x40
	ldr r7, [r0, #0x18]
	mov r6, #0
	mov r0, r7
	bl strchr
	cmp r0, #0
	orrne r6, r6, #2
	mov r0, r7
	mov r1, #0x2b
	bl strchr
	cmp r0, #0
	orrne r6, r6, #1
	mov r3, #1
	add r2, sp, #0x34
	mov r0, sl
	mov r1, r8
	str r3, [sp, #0x34]
	str r4, [sp, #0x38]
	str r5, [sp, #0x3c]
	str r6, [sp, #0x40]
	bl ov45_02249A0C
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0224D044:
	cmp r0, #0xa
	bne _0224D0A4
	mov r0, #1
	str r5, [sp, #0x28]
	str r6, [sp, #0x2c]
	str r7, [sp, #0x30]
	str r0, [sp, #0x24]
	ldr r0, [r8, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r2, [r8, #0x20]
	mov r0, #0x10
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r8, #0x10]
	add r3, sp, #0x24
	mov r0, sl
	mov r1, #0x15
	bl ov45_02244D30
	mov r0, #0
	add sp, sp, #0x68
	str r0, [r8, #0x10]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0224D0A4:
	cmp r0, #0xb
	addne sp, sp, #0x68
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	ldr r0, [r8, #0x10]
	cmp r0, #0
	addeq sp, sp, #0x68
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r8, #8]
	mov r1, #0
	str r0, [sp, #0x14]
	str r5, [sp, #0x18]
	str r6, [sp, #0x1c]
	str r7, [sp, #0x20]
	ldr r2, [r8, #0x18]
	mov r0, #0x14
	str r2, [sp]
	ldr r2, [r8, #0x20]
	add r3, sp, #0x10
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r8, #0x10]
	mov r0, sl
	mov r1, #0x16
	bl ov45_02244D30
	add sp, sp, #0x68
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_0224D118: .word ov45_0225687C
_0224D11C: .word ov45_022565D0
_0224D120: .word ov45_02256140
_0224D124: .word 0x00000AA6
	arm_func_end ov45_0224CF0C

	arm_func_start ov45_0224D128
ov45_0224D128: ; 0x0224D128
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x3c
	mov r4, r1
	ldr r1, [r4, #0x24]
	mov r5, r0
	cmp r1, #3
	beq _0224D158
	ldr r0, _0224D230 ; =ov45_02256848
	ldr r1, _0224D234 ; =ov45_022565D0
	ldr r2, _0224D238 ; =ov45_02256158
	ldr r3, _0224D23C ; =0x00000B0D
	bl __msl_assertion_failed
_0224D158:
	ldr r0, [r4, #0x24]
	cmp r0, #3
	addne sp, sp, #0x3c
	ldmneia sp!, {r4, r5, pc}
	ldr r0, [r4, #0x20]
	add r2, sp, #0x24
	ldr r4, [r0, #4]
	mov lr, #0
	str lr, [r2, #4]
	str lr, [r2, #0x10]
	mov r0, r5
	str lr, [r2]
	mov ip, #0xa
	str lr, [r2, #0xc]
	mov r3, #0xb
	mov r1, #2
	str lr, [r2, #8]
	str lr, [r2, #0x14]
	str ip, [sp, #0x24]
	str r4, [sp, #0x28]
	str r3, [sp, #0x30]
	str r4, [sp, #0x34]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x3c
	ldmeqia sp!, {r4, r5, pc}
	ldr r0, [r1]
	cmp r0, #0xa
	bne _0224D1F4
	mov r3, #0
	add r2, sp, #0x14
	mov r0, r5
	str r3, [sp, #0x14]
	str r4, [sp, #0x18]
	str r3, [sp, #0x1c]
	str r3, [sp, #0x20]
	bl ov45_02249A0C
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, pc}
_0224D1F4:
	cmp r0, #0xb
	addne sp, sp, #0x3c
	ldmneia sp!, {r4, r5, pc}
	mov r3, #0
	mov ip, #1
	add r2, sp, #0
	mov r0, r5
	str ip, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	bl ov45_02249A0C
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0224D230: .word ov45_02256848
_0224D234: .word ov45_022565D0
_0224D238: .word ov45_02256158
_0224D23C: .word 0x00000B0D
	arm_func_end ov45_0224D128

	arm_func_start ov45_0224D240
ov45_0224D240: ; 0x0224D240
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r7, r0
	mov r4, r1
	bne _0224D264
	ldr r0, _0224D2F4 ; =ov45_02256894
	ldr r1, _0224D2F8 ; =ov45_022565D0
	ldr r2, _0224D2FC ; =ov45_02255E84
	ldr r3, _0224D300 ; =0x00000B48
	bl __msl_assertion_failed
_0224D264:
	cmp r4, #0
	bne _0224D280
	ldr r0, _0224D304 ; =ov45_0225689C
	ldr r1, _0224D2F8 ; =ov45_022565D0
	ldr r2, _0224D2FC ; =ov45_02255E84
	ldr r3, _0224D308 ; =0x00000B49
	bl __msl_assertion_failed
_0224D280:
	cmp r7, #0
	beq _0224D294
	ldrsb r0, [r7]
	cmp r0, #0x5c
	beq _0224D29C
_0224D294:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0224D29C:
	mov r6, #0
	b _0224D2A8
_0224D2A4:
	add r6, r6, #1
_0224D2A8:
	add r0, r7, r6
	ldrsb r0, [r0, #1]
	cmp r0, #0
	cmpne r0, #0x5c
	bne _0224D2A4
	add r0, r6, #1
	bl ov00_021EC3A8
	movs r5, r0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r2, r6
	add r1, r7, #1
	bl memcpy
	mov r0, #0
	strb r0, [r5, r6]
	add r1, r6, #1
	mov r0, r5
	str r1, [r4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224D2F4: .word ov45_02256894
_0224D2F8: .word ov45_022565D0
_0224D2FC: .word ov45_02255E84
_0224D300: .word 0x00000B48
_0224D304: .word ov45_0225689C
_0224D308: .word 0x00000B49
	arm_func_end ov45_0224D240

	arm_func_start ov45_0224D30C
ov45_0224D30C: ; 0x0224D30C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x3c
	mov r4, r1
	ldr r1, [r4, #0x24]
	str r0, [sp, #0x10]
	cmp r1, #4
	beq _0224D33C
	ldr r0, _0224D4A8 ; =ov45_0225680C
	ldr r1, _0224D4AC ; =ov45_022565D0
	ldr r2, _0224D4B0 ; =ov45_02256060
	ldr r3, _0224D4B4 ; =0x00000B76
	bl __msl_assertion_failed
_0224D33C:
	ldr r0, [r4, #0x24]
	cmp r0, #4
	addne sp, sp, #0x3c
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r4, #0x20]
	add r2, sp, #0x30
	ldr r0, [r1, #4]
	ldr r5, [r1, #8]
	ldr r7, [r1, #0xc]
	mov r4, #0
	str r0, [sp, #0x14]
	str r4, [r2, #4]
	ldr r0, [sp, #0x10]
	str r4, [r2]
	mov r3, #0xc
	mov r1, #1
	str r4, [r2, #8]
	str r3, [sp, #0x30]
	str r5, [sp, #0x34]
	bl ov45_022496AC
	movs r6, r0
	addeq sp, sp, #0x3c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr fp, [r6, #0x1c]
	ldr r8, [fp]
	mov r0, r8, lsl #2
	bl ov00_021EC3A8
	movs sb, r0
	addeq sp, sp, #0x3c
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r8, #0
	mov sl, r4
	ble _0224D404
	ldr r4, _0224D4B8 ; =ov45_02256708
	add r5, sp, #0x18
_0224D3C8:
	mov r0, r7
	mov r1, r5
	bl ov45_0224D240
	cmp r0, #0
	beq _0224D3EC
	str r0, [sb, sl, lsl #2]
	ldr r0, [sp, #0x18]
	add r7, r7, r0
	b _0224D3F8
_0224D3EC:
	mov r0, r4
	bl ov00_021FF3D4
	str r0, [sb, sl, lsl #2]
_0224D3F8:
	add sl, sl, #1
	cmp sl, r8
	blt _0224D3C8
_0224D404:
	mov r0, #1
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	str r8, [sp, #0x24]
	str r0, [sp, #0x20]
	ldr r0, [fp, #4]
	str sb, [sp, #0x2c]
	str r0, [sp, #0x28]
	ldr r0, [fp, #8]
	cmp r0, #0
	bne _0224D444
	ldr r0, [sp, #0x10]
	add r2, sp, #0x1c
	mov r1, r6
	bl ov45_02249A0C
	b _0224D478
_0224D444:
	ldr r0, [r6, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r2, [r6, #0x20]
	mov r0, #0x14
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r6, #0x10]
	ldr r0, [sp, #0x10]
	add r3, sp, #0x1c
	mov r1, #0x1d
	bl ov45_02244D30
_0224D478:
	cmp r8, #0
	mov r4, #0
	ble _0224D498
_0224D484:
	ldr r0, [sb, r4, lsl #2]
	bl ov00_021EC3D8
	add r4, r4, #1
	cmp r4, r8
	blt _0224D484
_0224D498:
	mov r0, sb
	bl ov00_021EC3D8
	add sp, sp, #0x3c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0224D4A8: .word ov45_0225680C
_0224D4AC: .word ov45_022565D0
_0224D4B0: .word ov45_02256060
_0224D4B4: .word 0x00000B76
_0224D4B8: .word ov45_02256708
	arm_func_end ov45_0224D30C

	arm_func_start ov45_0224D4BC
ov45_0224D4BC: ; 0x0224D4BC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	mov r5, r1
	ldr r1, [r5, #0x24]
	mov r4, r0
	cmp r1, #4
	beq _0224D4EC
	ldr r0, _0224D578 ; =ov45_0225680C
	ldr r1, _0224D57C ; =ov45_022565D0
	ldr r2, _0224D580 ; =ov45_02256188
	ldr r3, _0224D584 ; =0x00000BCC
	bl __msl_assertion_failed
_0224D4EC:
	ldr r0, [r5, #0x24]
	cmp r0, #4
	addne sp, sp, #0x20
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x20]
	add r2, sp, #0x14
	ldr lr, [r0, #8]
	mov ip, #0
	str ip, [r2, #4]
	mov r0, r4
	str ip, [r2]
	mov r3, #0xc
	mov r1, #1
	str ip, [r2, #8]
	str r3, [sp, #0x14]
	str lr, [sp, #0x18]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x20
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, [r1, #0x1c]
	mov ip, #0
	mov r0, #1
	str ip, [sp, #4]
	str r0, [sp]
	ldr r0, [r3]
	add r2, sp, #0
	str r0, [sp, #8]
	ldr r3, [r3, #4]
	mov r0, r4
	str r3, [sp, #0xc]
	str ip, [sp, #0x10]
	bl ov45_02249A0C
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224D578: .word ov45_0225680C
_0224D57C: .word ov45_022565D0
_0224D580: .word ov45_02256188
_0224D584: .word 0x00000BCC
	arm_func_end ov45_0224D4BC

	arm_func_start ov45_0224D588
ov45_0224D588: ; 0x0224D588
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x54
	mov r4, r1
	ldr r1, [r4, #0x24]
	str r0, [sp, #0x10]
	cmp r1, #5
	beq _0224D5B8
	ldr r0, _0224D90C ; =ov45_022568A0
	ldr r1, _0224D910 ; =ov45_022565D0
	ldr r2, _0224D914 ; =ov45_022560C4
	ldr r3, _0224D918 ; =0x00000BFC
	bl __msl_assertion_failed
_0224D5B8:
	ldr r0, [r4, #0x24]
	cmp r0, #5
	addne sp, sp, #0x54
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r3, [r4, #0x20]
	ldr r1, _0224D91C ; =ov45_022568B8
	ldr r5, [r3, #0xc]
	ldr r2, [r3, #8]
	mov r0, r5
	ldr fp, [r3, #4]
	str r2, [sp, #0x14]
	ldr r8, [r3, #0x10]
	bl strcmp
	cmp r0, #0
	bne _0224D6EC
	ldr r0, [sp, #0x10]
	mov r1, fp
	bl ov45_02247E98
	movs r7, r0
	ldrne r0, [r7, #0x28]
	cmpne r0, #0
	addeq sp, sp, #0x54
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add sl, sp, #0x38
	mov r0, #0
	str r0, [sl]
	str r0, [sl, #4]
	str r0, [sl, #8]
	str r0, [sl, #0xc]
	ldr r0, [sp, #0x14]
	str fp, [sp, #0x38]
	str r0, [sp, #0x3c]
	ldrsb r0, [r8]
	cmp r0, #0
	addeq sp, sp, #0x54
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r6, #0
	mov r5, r6
	mov r4, #0x10
_0224D654:
	ldr r1, _0224D920 ; =ov45_022568C0
	mov r0, r8
	bl strstr
	mov r8, r0
	b _0224D66C
_0224D668:
	add r8, r8, #1
_0224D66C:
	ldrsb r1, [r8]
	cmp r1, #0
	cmpne r1, #0x5c
	bne _0224D668
	cmp r1, #0
	addeq sp, sp, #0x54
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	strb r6, [r8], #1
	mov r1, r8
	b _0224D698
_0224D694:
	add r8, r8, #1
_0224D698:
	ldrsb sb, [r8]
	cmp sb, #0
	cmpne sb, #0x5c
	bne _0224D694
	strb r5, [r8]
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	ldr r1, [r7, #0x2c]
	ldr r0, [sp, #0x10]
	stmia sp, {r1, r5, fp}
	str r4, [sp, #0xc]
	ldr r2, [r7, #0x28]
	mov r1, #0x1c
	mov r3, sl
	bl ov45_02244D30
	strb sb, [r8]
	ldrsb r0, [r8]
	cmp r0, #0
	bne _0224D654
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224D6EC:
	add r2, sp, #0x48
	mov r4, #0
	str r4, [r2, #4]
	ldr r0, [sp, #0x10]
	str r4, [r2]
	mov r3, #0xd
	mov r1, #1
	str r4, [r2, #8]
	str r3, [sp, #0x48]
	str r5, [sp, #0x4c]
	bl ov45_022496AC
	str r0, [sp, #0x18]
	cmp r0, #0
	addeq sp, sp, #0x54
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r6, [r0, #0x1c]
	ldr r5, [r6]
	mov r0, r5, lsl #2
	bl ov00_021EC3A8
	movs r7, r0
	addeq sp, sp, #0x54
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r5, #0
	mov sb, r4
	ble _0224D77C
	add r4, sp, #0x1c
_0224D754:
	mov r0, r8
	mov r1, r4
	bl ov45_0224D240
	str r0, [r7, sb, lsl #2]
	cmp r0, #0
	ldrne r0, [sp, #0x1c]
	add sb, sb, #1
	addne r8, r8, r0
	cmp sb, r5
	blt _0224D754
_0224D77C:
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _0224D858
	add r1, sp, #0x1c
	mov r0, r8
	bl ov45_0224D240
	movs sb, r0
	beq _0224D854
_0224D79C:
	ldr r0, [sp, #0x1c]
	add r1, sp, #0x1c
	add r8, r8, r0
	mov r0, r8
	bl ov45_0224D240
	movs r4, r0
	beq _0224D834
	add r0, r5, #1
	mov sl, r0, lsl #2
	ldr r1, [sp, #0x1c]
	ldr r0, [r6, #4]
	add r8, r8, r1
	mov r1, sl
	bl ov00_021EC3BC
	cmp r0, #0
	beq _0224D820
	str r0, [r6, #4]
	mov r0, r7
	mov r1, sl
	bl ov00_021EC3BC
	cmp r0, #0
	beq _0224D80C
	ldr r1, [r6, #4]
	mov r7, r0
	str sb, [r1, r5, lsl #2]
	str r4, [r0, r5, lsl #2]
	add r5, r5, #1
	b _0224D840
_0224D80C:
	mov r0, sb
	bl ov00_021EC3D8
	mov r0, r4
	bl ov00_021EC3D8
	b _0224D840
_0224D820:
	mov r0, sb
	bl ov00_021EC3D8
	mov r0, r4
	bl ov00_021EC3D8
	b _0224D840
_0224D834:
	mov r0, sb
	bl ov00_021EC3D8
	b _0224D854
_0224D840:
	mov r0, r8
	add r1, sp, #0x1c
	bl ov45_0224D240
	movs sb, r0
	bne _0224D79C
_0224D854:
	str r5, [r6]
_0224D858:
	mov r0, #1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x14]
	str fp, [sp, #0x24]
	str r5, [sp, #0x2c]
	str r0, [sp, #0x28]
	ldr r0, [r6, #4]
	str r7, [sp, #0x34]
	str r0, [sp, #0x30]
	ldr r0, [r6, #8]
	cmp r0, #0
	bne _0224D89C
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x18]
	add r2, sp, #0x20
	bl ov45_02249A0C
	b _0224D8DC
_0224D89C:
	ldr r0, [sp, #0x18]
	mov r1, #0
	ldr r0, [r0, #0x18]
	add r3, sp, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x18]
	ldr r2, [r0, #0x20]
	mov r0, #0x18
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	mov r1, #0x1e
	ldr r2, [r0, #0x10]
	ldr r0, [sp, #0x10]
	bl ov45_02244D30
_0224D8DC:
	cmp r5, #0
	mov r4, #0
	ble _0224D8FC
_0224D8E8:
	ldr r0, [r7, r4, lsl #2]
	bl ov00_021EC3D8
	add r4, r4, #1
	cmp r4, r5
	blt _0224D8E8
_0224D8FC:
	mov r0, r7
	bl ov00_021EC3D8
	add sp, sp, #0x54
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0224D90C: .word ov45_022568A0
_0224D910: .word ov45_022565D0
_0224D914: .word ov45_022560C4
_0224D918: .word 0x00000BFC
_0224D91C: .word ov45_022568B8
_0224D920: .word ov45_022568C0
	arm_func_end ov45_0224D588

	arm_func_start ov45_0224D924
ov45_0224D924: ; 0x0224D924
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x24
	mov r4, r1
	ldr r1, [r4, #0x24]
	mov r5, r0
	cmp r1, #4
	beq _0224D954
	ldr r0, _0224D9E4 ; =ov45_0225680C
	ldr r1, _0224D9E8 ; =ov45_022565D0
	ldr r2, _0224D9EC ; =ov45_022561E8
	mov r3, #0xcb0
	bl __msl_assertion_failed
_0224D954:
	ldr r0, [r4, #0x24]
	cmp r0, #4
	addne sp, sp, #0x24
	ldmneia sp!, {r4, r5, pc}
	ldr r0, [r4, #0x20]
	add r2, sp, #0x18
	ldmib r0, {r4, lr}
	mov ip, #0
	str ip, [r2, #4]
	mov r0, r5
	str ip, [r2]
	mov r3, #0xd
	mov r1, #1
	str ip, [r2, #8]
	str r3, [sp, #0x18]
	str lr, [sp, #0x1c]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x24
	ldmeqia sp!, {r4, r5, pc}
	ldr r3, [r1, #0x1c]
	mov ip, #0
	mov r0, #1
	str r4, [sp, #4]
	str ip, [sp, #8]
	str r0, [sp]
	ldr r0, [r3]
	add r2, sp, #0
	str r0, [sp, #0xc]
	ldr r3, [r3, #4]
	mov r0, r5
	str r3, [sp, #0x10]
	str ip, [sp, #0x14]
	bl ov45_02249A0C
	add sp, sp, #0x24
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0224D9E4: .word ov45_0225680C
_0224D9E8: .word ov45_022565D0
_0224D9EC: .word ov45_022561E8
	arm_func_end ov45_0224D924

	arm_func_start ov45_0224D9F0
ov45_0224D9F0: ; 0x0224D9F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x58
	mov r4, r1
	ldr r1, [r4, #0x24]
	str r0, [sp, #0x10]
	cmp r1, #4
	beq _0224DA20
	ldr r0, _0224DE58 ; =ov45_0225680C
	ldr r1, _0224DE5C ; =ov45_022565D0
	ldr r2, _0224DE60 ; =ov45_02256200
	ldr r3, _0224DE64 ; =0x00000CE1
	bl __msl_assertion_failed
_0224DA20:
	ldr r0, [r4, #0x24]
	cmp r0, #4
	addne sp, sp, #0x58
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r2, [r4, #0x20]
	ldr r1, _0224DE68 ; =ov45_022568B8
	ldmib r2, {r0, r5}
	str r0, [sp, #0x18]
	mov r0, r5
	ldr sb, [r2, #0xc]
	bl strcmp
	cmp r0, #0
	bne _0224DB58
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x18]
	bl ov45_02247E98
	movs r8, r0
	ldrne r0, [r8, #0x28]
	cmpne r0, #0
	addeq sp, sp, #0x58
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r7, sp, #0x3c
	mov r1, #0
	str r1, [r7, #4]
	ldr r0, [sp, #0x18]
	str r1, [r7]
	str r1, [r7, #8]
	str r1, [r7, #0xc]
	str r1, [sp, #0x40]
	str r0, [sp, #0x3c]
	ldrsb r0, [sb]
	cmp r0, #0
	addeq sp, sp, #0x58
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr fp, _0224DE6C ; =ov45_022568C0
	mov r6, r1
	mov r5, r1
	mov r4, #0x10
_0224DAB8:
	mov r0, sb
	mov r1, fp
	bl strstr
	mov sb, r0
	b _0224DAD0
_0224DACC:
	add sb, sb, #1
_0224DAD0:
	ldrsb r1, [sb]
	cmp r1, #0
	cmpne r1, #0x5c
	bne _0224DACC
	cmp r1, #0
	addeq sp, sp, #0x58
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	strb r6, [sb], #1
	mov r1, sb
	b _0224DAFC
_0224DAF8:
	add sb, sb, #1
_0224DAFC:
	ldrsb sl, [sb]
	cmp sl, #0
	cmpne sl, #0x5c
	bne _0224DAF8
	strb r5, [sb]
	str r0, [sp, #0x44]
	str r1, [sp, #0x48]
	ldr r1, [r8, #0x2c]
	ldr r0, [sp, #0x10]
	stmia sp, {r1, r5}
	ldr r1, [sp, #0x18]
	mov r3, r7
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	ldr r2, [r8, #0x28]
	mov r1, #0x1c
	bl ov45_02244D30
	strb sl, [sb]
	ldrsb r0, [sb]
	cmp r0, #0
	bne _0224DAB8
	add sp, sp, #0x58
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224DB58:
	add r2, sp, #0x4c
	mov r4, #0
	str r4, [r2, #4]
	ldr r0, [sp, #0x10]
	str r4, [r2]
	mov r3, #0xe
	mov r1, #1
	str r4, [r2, #8]
	str r3, [sp, #0x4c]
	str r5, [sp, #0x50]
	bl ov45_022496AC
	str r0, [sp, #0x1c]
	cmp r0, #0
	addeq sp, sp, #0x58
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r4, [r0, #0x1c]
	ldr sl, [r4]
	cmp sl, #0
	beq _0224DCD4
	mov r0, sl, lsl #2
	bl ov00_021EC3A8
	movs r5, r0
	addeq sp, sp, #0x58
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sl, #0
	mov r7, #0
	ble _0224DBF0
	add r6, sp, #0x20
_0224DBC8:
	mov r0, sb
	mov r1, r6
	bl ov45_0224D240
	str r0, [r5, r7, lsl #2]
	cmp r0, #0
	ldrne r0, [sp, #0x20]
	add r7, r7, #1
	addne sb, sb, r0
	cmp r7, sl
	blt _0224DBC8
_0224DBF0:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0224DDF0
	add r1, sp, #0x20
	mov r0, sb
	bl ov45_0224D240
	movs r7, r0
	beq _0224DCCC
	add fp, sp, #0x20
_0224DC14:
	ldr r0, [sp, #0x20]
	mov r1, fp
	add sb, sb, r0
	mov r0, sb
	bl ov45_0224D240
	movs r6, r0
	beq _0224DCAC
	add r0, sl, #1
	mov r8, r0, lsl #2
	ldr r2, [sp, #0x20]
	ldr r0, [r4, #4]
	mov r1, r8
	add sb, sb, r2
	bl ov00_021EC3BC
	cmp r0, #0
	beq _0224DC98
	str r0, [r4, #4]
	mov r0, r5
	mov r1, r8
	bl ov00_021EC3BC
	cmp r0, #0
	beq _0224DC84
	ldr r1, [r4, #4]
	mov r5, r0
	str r7, [r1, sl, lsl #2]
	str r6, [r0, sl, lsl #2]
	add sl, sl, #1
	b _0224DCB8
_0224DC84:
	mov r0, r7
	bl ov00_021EC3D8
	mov r0, r6
	bl ov00_021EC3D8
	b _0224DCB8
_0224DC98:
	mov r0, r7
	bl ov00_021EC3D8
	mov r0, r6
	bl ov00_021EC3D8
	b _0224DCB8
_0224DCAC:
	mov r0, r7
	bl ov00_021EC3D8
	b _0224DCCC
_0224DCB8:
	mov r0, sb
	mov r1, fp
	bl ov45_0224D240
	movs r7, r0
	bne _0224DC14
_0224DCCC:
	str sl, [r4]
	b _0224DDF0
_0224DCD4:
	mov r6, #0
	mov r5, r6
	mov sl, r6
_0224DCE0:
	add r1, sp, #0x20
	mov r0, sb
	bl ov45_0224D240
	movs fp, r0
	beq _0224DDE8
	ldr r0, [sp, #0x20]
	add r1, sp, #0x20
	add sb, sb, r0
	mov r0, sb
	bl ov45_0224D240
	str r0, [sp, #0x14]
	cmp r0, #0
	bne _0224DD20
	mov r0, fp
	bl ov00_021EC3D8
	b _0224DDE8
_0224DD20:
	add r0, sl, #1
	mov r7, r0, lsl #2
	ldr r2, [sp, #0x20]
	mov r0, r6
	mov r1, r7
	add sb, sb, r2
	bl ov00_021EC3BC
	mov r1, r7
	mov r7, r0
	mov r0, r5
	bl ov00_021EC3BC
	mov r8, r0
	cmp r7, #0
	cmpne r8, #0
	bne _0224DDCC
	mov r0, fp
	bl ov00_021EC3D8
	ldr r0, [sp, #0x14]
	bl ov00_021EC3D8
	cmp sl, #0
	sub sl, sl, #1
	beq _0224DD94
_0224DD78:
	ldr r0, [r6, sl, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r5, sl, lsl #2]
	bl ov00_021EC3D8
	cmp sl, #0
	sub sl, sl, #1
	bne _0224DD78
_0224DD94:
	cmp r7, #0
	beq _0224DDA8
	mov r0, r7
	bl ov00_021EC3D8
	b _0224DDB0
_0224DDA8:
	mov r0, r6
	bl ov00_021EC3D8
_0224DDB0:
	cmp r8, #0
	beq _0224DDC4
	mov r0, r8
	bl ov00_021EC3D8
	b _0224DDCC
_0224DDC4:
	mov r0, r5
	bl ov00_021EC3D8
_0224DDCC:
	ldr r0, [sp, #0x14]
	str fp, [r7, sl, lsl #2]
	str r0, [r8, sl, lsl #2]
	mov r6, r7
	mov r5, r8
	add sl, sl, #1
	b _0224DCE0
_0224DDE8:
	str sl, [r4]
	str r6, [r4, #4]
_0224DDF0:
	mov r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x18]
	mov r1, #0
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str sl, [sp, #0x30]
	ldr r3, [r4, #4]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x1c]
	add r2, sp, #0x24
	str r3, [sp, #0x34]
	str r5, [sp, #0x38]
	bl ov45_02249A0C
	cmp sl, #0
	mov r4, #0
	ble _0224DE48
_0224DE34:
	ldr r0, [r5, r4, lsl #2]
	bl ov00_021EC3D8
	add r4, r4, #1
	cmp r4, sl
	blt _0224DE34
_0224DE48:
	mov r0, r5
	bl ov00_021EC3D8
	add sp, sp, #0x58
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0224DE58: .word ov45_0225680C
_0224DE5C: .word ov45_022565D0
_0224DE60: .word ov45_02256200
_0224DE64: .word 0x00000CE1
_0224DE68: .word ov45_022568B8
_0224DE6C: .word ov45_022568C0
	arm_func_end ov45_0224D9F0

	arm_func_start ov45_0224DE70
ov45_0224DE70: ; 0x0224DE70
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x80
	movs r4, r0
	mov r5, r1
	bne _0224DE98
	ldr r0, _0224DF38 ; =ov45_022565C0
	ldr r1, _0224DF3C ; =ov45_022565D0
	ldr r2, _0224DF40 ; =ov45_02256074
	ldr r3, _0224DF44 ; =0x00000DBD
	bl __msl_assertion_failed
_0224DE98:
	ldr r0, [r5, #0x24]
	cmp r0, #1
	bge _0224DEB8
	ldr r0, _0224DF48 ; =ov45_022568C4
	ldr r1, _0224DF3C ; =ov45_022565D0
	ldr r2, _0224DF40 ; =ov45_02256074
	ldr r3, _0224DF4C ; =0x00000DC3
	bl __msl_assertion_failed
_0224DEB8:
	ldr r0, [r5, #0x24]
	cmp r0, #1
	addlt sp, sp, #0x80
	ldmltia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #0x20]
	sub r0, r0, #1
	ldr r0, [r1, r0, lsl #2]
	mov r1, #0x40
	bl strchr
	cmp r0, #0
	ldrne r1, [r4, #0x10]
	cmpne r1, #0
	beq _0224DF28
	add r0, r0, #1
	bl ov00_021FFA44
	mov r1, r0
	ldr r3, [r4, #0x18]
	ldr ip, [r4, #0x10]
	add r2, sp, #0
	mov r0, r4
	blx ip
	add r0, r4, #0x2c
	add r1, sp, #0
	add r0, r0, #0x400
	mov r2, #0x80
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x4ab]
_0224DF28:
	mov r0, r4
	bl ov45_0224F9A0
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224DF38: .word ov45_022565C0
_0224DF3C: .word ov45_022565D0
_0224DF40: .word ov45_02256074
_0224DF44: .word 0x00000DBD
_0224DF48: .word ov45_022568C4
_0224DF4C: .word 0x00000DC3
	arm_func_end ov45_0224DE70

	arm_func_start ov45_0224DF50
ov45_0224DF50: ; 0x0224DF50
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0xc
	add r2, sp, #0
	mov r3, #0
	str r3, [r2]
	mov r1, #1
	str r3, [r2, #4]
	str r3, [r2, #8]
	str r3, [sp]
	bl ov45_022496AC
	cmp r0, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r3, r4, pc}
	ldr r4, [r0, #0x1c]
	cmp r4, #0
	bne _0224DFA4
	ldr r0, _0224DFB4 ; =ov45_022568DC
	ldr r1, _0224DFB8 ; =ov45_022565D0
	ldr r2, _0224DFBC ; =ov45_022561A0
	ldr r3, _0224DFC0 ; =0x00000DEF
	bl __msl_assertion_failed
_0224DFA4:
	mov r0, #1
	str r0, [r4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0224DFB4: .word ov45_022568DC
_0224DFB8: .word ov45_022565D0
_0224DFBC: .word ov45_022561A0
_0224DFC0: .word 0x00000DEF
	arm_func_end ov45_0224DF50

	arm_func_start ov45_0224DFC4
ov45_0224DFC4: ; 0x0224DFC4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	mov sb, r1
	ldr r1, [sb, #0x24]
	mov sl, r0
	cmp r1, #4
	beq _0224DFF4
	ldr r0, _0224E1F8 ; =ov45_0225680C
	ldr r1, _0224E1FC ; =ov45_022565D0
	ldr r2, _0224E200 ; =ov45_02255FFC
	ldr r3, _0224E204 ; =0x00000E01
	bl __msl_assertion_failed
_0224DFF4:
	ldr r0, [sb, #0x24]
	cmp r0, #4
	addne sp, sp, #0x34
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r2, sp, #0x28
	mov r3, #0
	str r3, [r2]
	mov r0, sl
	mov r1, #1
	str r3, [r2, #4]
	str r3, [r2, #8]
	str r3, [sp, #0x28]
	bl ov45_022496AC
	movs r7, r0
	ldrne r0, [r7, #0x10]
	cmpne r0, #0
	addeq sp, sp, #0x34
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r8, [r7, #0x1c]
	cmp r8, #0
	bne _0224E05C
	ldr r0, _0224E208 ; =ov45_022568DC
	ldr r1, _0224E1FC ; =ov45_022565D0
	ldr r2, _0224E200 ; =ov45_02255FFC
	ldr r3, _0224E20C ; =0x00000E15
	bl __msl_assertion_failed
_0224E05C:
	ldr r0, [sb, #0x20]
	ldr r0, [r0, #4]
	bl strlen
	mov r4, r0
	add r0, r4, #1
	bl ov00_021EC3A8
	movs r6, r0
	addeq sp, sp, #0x34
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [sb, #0x20]
	add r2, r4, #1
	ldr r1, [r1, #4]
	bl memcpy
	ldr r0, [sb, #0x20]
	ldr r0, [r0, #8]
	bl atoi
	ldr r1, [sb, #0x20]
	mov r5, r0
	ldr r0, [r1, #0xc]
	bl strlen
	mov fp, r0
	add r0, fp, #1
	bl ov00_021EC3A8
	movs r4, r0
	bne _0224E0D0
	mov r0, r6
	bl ov00_021EC3D8
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224E0D0:
	ldr r1, [sb, #0x20]
	add r2, fp, #1
	ldr r1, [r1, #0xc]
	bl memcpy
	ldr sb, [r8, #4]
	mov r0, #1
	str sb, [sp, #0x14]
	str r6, [sp, #0x18]
	str r4, [sp, #0x1c]
	str r5, [sp, #0x20]
	str r0, [sp, #0x10]
	ldr r0, [r7, #0x18]
	mov r1, #0
	str r0, [sp]
	ldr r2, [r7, #0x20]
	mov r0, #0x18
	str r2, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r7, #0x10]
	add r3, sp, #0x10
	mov r0, sl
	mov r1, #0xd
	bl ov45_02244D30
	ldr r1, [r8, #4]
	ldr r0, [r8, #8]
	add r1, r1, #1
	mov r1, r1, lsl #2
	bl ov00_021EC3BC
	cmp r0, #0
	bne _0224E164
	mov r0, r6
	bl ov00_021EC3D8
	mov r0, r4
	bl ov00_021EC3D8
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224E164:
	str r0, [r8, #8]
	str r6, [r0, sb, lsl #2]
	ldr r1, [r8, #4]
	ldr r0, [r8, #0xc]
	add r1, r1, #1
	mov r1, r1, lsl #2
	bl ov00_021EC3BC
	cmp r0, #0
	bne _0224E1A0
	mov r0, r6
	bl ov00_021EC3D8
	mov r0, r4
	bl ov00_021EC3D8
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224E1A0:
	str r0, [r8, #0xc]
	str r5, [r0, sb, lsl #2]
	ldr r1, [r8, #4]
	ldr r0, [r8, #0x10]
	add r1, r1, #1
	mov r1, r1, lsl #2
	bl ov00_021EC3BC
	cmp r0, #0
	bne _0224E1DC
	mov r0, r6
	bl ov00_021EC3D8
	mov r0, r4
	bl ov00_021EC3D8
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224E1DC:
	str r0, [r8, #0x10]
	str r4, [r0, sb, lsl #2]
	ldr r0, [r8, #4]
	add r0, r0, #1
	str r0, [r8, #4]
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_0224E1F8: .word ov45_0225680C
_0224E1FC: .word ov45_022565D0
_0224E200: .word ov45_02255FFC
_0224E204: .word 0x00000E01
_0224E208: .word ov45_022568DC
_0224E20C: .word 0x00000E15
	arm_func_end ov45_0224DFC4

	arm_func_start ov45_0224E210
ov45_0224E210: ; 0x0224E210
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x20
	add r2, sp, #0x14
	mov r3, #0
	str r3, [r2]
	mov r1, #1
	mov r4, r0
	str r3, [r2, #4]
	str r3, [r2, #8]
	str r3, [sp, #0x14]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x20
	ldmeqia sp!, {r4, pc}
	ldr ip, [r1, #0x1c]
	mov r0, #1
	str r0, [sp]
	ldr r0, [ip, #4]
	add r2, sp, #0
	str r0, [sp, #4]
	ldr r3, [ip, #8]
	mov r0, r4
	str r3, [sp, #8]
	ldr r3, [ip, #0xc]
	str r3, [sp, #0x10]
	ldr r3, [ip, #0x10]
	str r3, [sp, #0xc]
	bl ov45_02249A0C
	add sp, sp, #0x20
	ldmia sp!, {r4, pc}
	arm_func_end ov45_0224E210

	arm_func_start ov45_0224E288
ov45_0224E288: ; 0x0224E288
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x70
	mov r4, r1
	ldr r1, [r4, #0x24]
	mov r6, r0
	cmp r1, #3
	bge _0224E2B8
	ldr r0, _0224E3F8 ; =ov45_022568EC
	ldr r1, _0224E3FC ; =ov45_022565D0
	ldr r2, _0224E400 ; =ov45_022562D0
	ldr r3, _0224E404 ; =0x00000E93
	bl __msl_assertion_failed
_0224E2B8:
	ldr r0, [r4, #0x24]
	cmp r0, #3
	addlt sp, sp, #0x70
	ldmltia sp!, {r4, r5, r6, pc}
	ldr r3, [r4, #0x20]
	sub r2, r0, #3
	ldr r0, [r3, #8]
	add r1, r3, #0xc
	ldr r4, [r3, #4]
	bl ov45_0224AD24
	movs r5, r0
	addeq sp, sp, #0x70
	ldmeqia sp!, {r4, r5, r6, pc}
	add r3, sp, #0x50
	mov r0, #0
	mov r2, r3
	mov r1, r0
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2!, {r0, r1}
	stmia r2, {r0, r1}
	mov r0, r3
	mov r1, r5
	bl ov45_0224AFD8
	add r2, sp, #0x30
	mov r0, r6
	mov r1, r4
	bl ov45_02248288
	cmp r0, #0
	bne _0224E394
	add r2, sp, #0x50
	mov r0, r6
	mov r1, r4
	bl ov45_02248374
	mov r0, r6
	mov r1, r4
	bl ov45_02247E98
	cmp r0, #0
	ldrne r1, [r0, #0x18]
	cmpne r1, #0
	beq _0224E394
	add r1, sp, #0x50
	str r1, [sp, #0x14]
	str r4, [sp, #0x10]
	ldr r2, [r0, #0x2c]
	mov r1, #0
	str r2, [sp]
	stmib sp, {r1, r4}
	mov r1, #8
	str r1, [sp, #0xc]
	ldr r2, [r0, #0x18]
	add r3, sp, #0x10
	mov r0, r6
	mov r1, #0xa
	bl ov45_02244D30
_0224E394:
	add r2, sp, #0x24
	mov ip, #0
	str ip, [r2, #4]
	mov r0, r6
	str ip, [r2]
	mov r3, #5
	mov r1, #1
	str ip, [r2, #8]
	str r3, [sp, #0x24]
	str r4, [sp, #0x28]
	bl ov45_022496AC
	movs r1, r0
	beq _0224E3E8
	add r3, sp, #0x50
	mov ip, #1
	add r2, sp, #0x18
	mov r0, r6
	str ip, [sp, #0x18]
	str r4, [sp, #0x1c]
	str r3, [sp, #0x20]
	bl ov45_02249A0C
_0224E3E8:
	mov r0, r5
	bl ov00_021EC3D8
	add sp, sp, #0x70
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_0224E3F8: .word ov45_022568EC
_0224E3FC: .word ov45_022565D0
_0224E400: .word ov45_022562D0
_0224E404: .word 0x00000E93
	arm_func_end ov45_0224E288

	arm_func_start ov45_0224E408
ov45_0224E408: ; 0x0224E408
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x18
	movs r7, r0
	mov r6, r1
	bne _0224E430
	ldr r0, _0224E5BC ; =ov45_022565C0
	ldr r1, _0224E5C0 ; =ov45_022565D0
	ldr r2, _0224E5C4 ; =ov45_022561B8
	ldr r3, _0224E5C8 ; =0x00000ED5
	bl __msl_assertion_failed
_0224E430:
	ldr r0, [r6, #0x24]
	cmp r0, #6
	beq _0224E450
	ldr r0, _0224E5CC ; =ov45_02256904
	ldr r1, _0224E5C0 ; =ov45_022565D0
	ldr r2, _0224E5C4 ; =ov45_022561B8
	ldr r3, _0224E5D0 ; =0x00000EDB
	bl __msl_assertion_failed
_0224E450:
	ldr r0, [r6, #0x24]
	cmp r0, #6
	addne sp, sp, #0x18
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r6, #0x20]
	add r2, sp, #0
	ldr ip, [r0, #4]
	mov r5, #0
	str r5, [r2, #4]
	str r5, [r2, #0x10]
	mov r0, r7
	str r5, [r2]
	mov r4, #4
	str r5, [r2, #0xc]
	mov r3, #7
	mov r1, #2
	str r5, [r2, #8]
	str r5, [r2, #0x14]
	str r4, [sp]
	str ip, [sp, #4]
	str r3, [sp, #0xc]
	str ip, [sp, #0x10]
	bl ov45_022496AC
	movs r4, r0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r0, [r4]
	cmp r0, #4
	bne _0224E51C
	ldr r1, [r6, #0x20]
	ldr r6, [r4, #0x1c]
	ldr r0, [r1, #8]
	ldr r4, [r1, #0x14]
	ldr r5, [r1, #0xc]
	bl ov00_021FF3D4
	cmp r0, #0
	addeq sp, sp, #0x18
	str r0, [r6]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r4
	bl ov00_021FF3D4
	cmp r0, #0
	addeq sp, sp, #0x18
	str r0, [r6, #4]
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r0, r5
	bl ov00_021FF3D4
	add sp, sp, #0x18
	str r0, [r6, #8]
	cmp r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0224E51C:
	cmp r0, #7
	addne sp, sp, #0x18
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r5, [r4, #0x1c]
	cmp r5, #0
	bne _0224E548
	ldr r0, _0224E5D4 ; =ov45_022568DC
	ldr r1, _0224E5C0 ; =ov45_022565D0
	ldr r2, _0224E5C4 ; =ov45_022561B8
	ldr r3, _0224E5D8 ; =0x00000F1D
	bl __msl_assertion_failed
_0224E548:
	ldr r0, [r5]
	cmp r0, #0
	bne _0224E568
	ldr r0, _0224E5DC ; =ov45_0225691C
	ldr r1, _0224E5C0 ; =ov45_022565D0
	ldr r2, _0224E5C4 ; =ov45_022561B8
	ldr r3, _0224E5E0 ; =0x00000F1E
	bl __msl_assertion_failed
_0224E568:
	ldr r0, [r5]
	ldrsb r0, [r0]
	cmp r0, #0
	bne _0224E58C
	ldr r0, _0224E5E4 ; =ov45_02256934
	ldr r1, _0224E5C0 ; =ov45_022565D0
	ldr r2, _0224E5C4 ; =ov45_022561B8
	ldr r3, _0224E5E0 ; =0x00000F1E
	bl __msl_assertion_failed
_0224E58C:
	ldr r0, [r6, #0x20]
	ldr r2, [r5]
	ldr r3, [r0, #0xc]
	ldr r1, _0224E5E8 ; =ov45_02256950
	add r0, r7, #0x1c
	bl ov45_02252F74
	mov r0, r7
	mov r1, r4
	mov r2, #0
	bl ov45_02249A0C
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0224E5BC: .word ov45_022565C0
_0224E5C0: .word ov45_022565D0
_0224E5C4: .word ov45_022561B8
_0224E5C8: .word 0x00000ED5
_0224E5CC: .word ov45_02256904
_0224E5D0: .word 0x00000EDB
_0224E5D4: .word ov45_022568DC
_0224E5D8: .word 0x00000F1D
_0224E5DC: .word ov45_0225691C
_0224E5E0: .word 0x00000F1E
_0224E5E4: .word ov45_02256934
_0224E5E8: .word ov45_02256950
	arm_func_end ov45_0224E408

	arm_func_start ov45_0224E5EC
ov45_0224E5EC: ; 0x0224E5EC
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r6, r1
	ldr r1, [r6, #0x24]
	mov r7, r0
	cmp r1, #3
	beq _0224E61C
	ldr r0, _0224E720 ; =ov45_02256848
	ldr r1, _0224E724 ; =ov45_022565D0
	ldr r2, _0224E728 ; =ov45_022562EC
	ldr r3, _0224E72C ; =0x00000F34
	bl __msl_assertion_failed
_0224E61C:
	ldr r0, [r6, #0x24]
	cmp r0, #3
	addne sp, sp, #0xc
	ldmneia sp!, {r4, r5, r6, r7, pc}
	ldr r0, [r6, #0x20]
	add r2, sp, #0
	ldr r5, [r0, #4]
	mov r4, #0
	str r4, [r2, #4]
	mov r0, r7
	str r4, [r2]
	mov r3, #4
	mov r1, #1
	str r4, [r2, #8]
	str r3, [sp]
	str r5, [sp, #4]
	bl ov45_022496AC
	cmp r0, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	ldr r1, [r6, #0x20]
	ldr r4, [r0, #0x1c]
	ldr r0, [r1, #8]
	ldr r1, _0224E730 ; =ov45_02256824
	bl strtok
	cmp r0, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	ldr r5, _0224E730 ; =ov45_02256824
	mov r6, #0
_0224E694:
	ldrsb r1, [r0]
	cmp r1, #0x2d
	addeq r0, r0, #1
	ldrsb r1, [r0]
	cmp r1, #0x40
	cmpne r1, #0x2b
	addeq r0, r0, #1
	bl ov00_021FF3D4
	movs r7, r0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #0x10]
	add r1, r1, #1
	mov r1, r1, lsl #2
	bl ov00_021EC3BC
	cmp r0, #0
	bne _0224E6EC
	mov r0, r7
	bl ov00_021EC3D8
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
_0224E6EC:
	str r0, [r4, #0x10]
	ldr r1, [r4, #0xc]
	str r7, [r0, r1, lsl #2]
	ldr r1, [r4, #0xc]
	mov r0, r6
	add r2, r1, #1
	mov r1, r5
	str r2, [r4, #0xc]
	bl strtok
	cmp r0, #0
	bne _0224E694
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_0224E720: .word ov45_02256848
_0224E724: .word ov45_022565D0
_0224E728: .word ov45_022562EC
_0224E72C: .word 0x00000F34
_0224E730: .word ov45_02256824
	arm_func_end ov45_0224E5EC

	arm_func_start ov45_0224E734
ov45_0224E734: ; 0x0224E734
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x28
	mov r5, r1
	ldr r1, [r5, #0x24]
	mov r4, r0
	cmp r1, #3
	beq _0224E764
	ldr r0, _0224E80C ; =ov45_02256848
	ldr r1, _0224E810 ; =ov45_022565D0
	ldr r2, _0224E814 ; =ov45_02256218
	ldr r3, _0224E818 ; =0x00000F76
	bl __msl_assertion_failed
_0224E764:
	ldr r0, [r5, #0x24]
	cmp r0, #3
	addne sp, sp, #0x28
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x20]
	add r2, sp, #0x1c
	ldr r5, [r0, #4]
	mov ip, #0
	str ip, [r2, #4]
	mov r0, r4
	str ip, [r2]
	mov r3, #4
	mov r1, #1
	str ip, [r2, #8]
	str r3, [sp, #0x1c]
	str r5, [sp, #0x20]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x28
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr ip, [r1, #0x1c]
	add r2, sp, #0
	ldr r0, [ip]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	str r5, [sp, #4]
	str r0, [sp]
	ldr r0, [ip]
	str r0, [sp, #8]
	ldr r3, [ip, #4]
	mov r0, r4
	str r3, [sp, #0xc]
	ldr r3, [ip, #8]
	str r3, [sp, #0x10]
	ldr r3, [ip, #0xc]
	str r3, [sp, #0x14]
	ldr r3, [ip, #0x10]
	str r3, [sp, #0x18]
	bl ov45_02249A0C
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224E80C: .word ov45_02256848
_0224E810: .word ov45_022565D0
_0224E814: .word ov45_02256218
_0224E818: .word 0x00000F76
	arm_func_end ov45_0224E734

	arm_func_start ov45_0224E81C
ov45_0224E81C: ; 0x0224E81C
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0xc
	mov r4, r1
	ldr r1, [r4, #0x24]
	mov r5, r0
	cmp r1, #3
	bge _0224E84C
	ldr r0, _0224E94C ; =ov45_02256964
	ldr r1, _0224E950 ; =ov45_022565D0
	ldr r2, _0224E954 ; =ov45_022560EC
	ldr r3, _0224E958 ; =0x00000F9D
	bl __msl_assertion_failed
_0224E84C:
	ldr r0, [r4, #0x24]
	cmp r0, #3
	addlt sp, sp, #0xc
	ldmltia sp!, {r4, r5, r6, r7, pc}
	ldr r0, [r4, #0x20]
	add r2, sp, #0
	ldr r7, [r0, #4]
	ldr r4, [r0, #8]
	mov r6, #0
	str r6, [r2, #4]
	mov r0, r5
	str r6, [r2]
	mov r3, #8
	mov r1, #1
	str r6, [r2, #8]
	str r3, [sp]
	str r7, [sp, #4]
	bl ov45_022496AC
	cmp r0, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	ldr r5, [r0, #0x1c]
	cmp r5, #0
	bne _0224E8C0
	ldr r0, _0224E95C ; =ov45_022568DC
	ldr r1, _0224E950 ; =ov45_022565D0
	ldr r2, _0224E954 ; =ov45_022560EC
	ldr r3, _0224E960 ; =0x00000FAF
	bl __msl_assertion_failed
_0224E8C0:
	ldr r0, [r5]
	cmp r0, #0
	bge _0224E8E0
	ldr r0, _0224E964 ; =ov45_0225697C
	ldr r1, _0224E950 ; =ov45_022565D0
	ldr r2, _0224E954 ; =ov45_022560EC
	mov r3, #0xfb0
	bl __msl_assertion_failed
_0224E8E0:
	ldr r1, [r5]
	ldr r0, [r5, #4]
	add r1, r1, #1
	mov r1, r1, lsl #2
	bl ov00_021EC3BC
	cmp r0, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	str r0, [r5, #4]
	mov r0, r4
	bl strlen
	mov r7, r0
	add r0, r7, #1
	bl ov00_021EC3A8
	movs r6, r0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, pc}
	mov r1, r4
	add r2, r7, #1
	bl memcpy
	ldmia r5, {r0, r1}
	str r6, [r1, r0, lsl #2]
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, pc}
	.balign 4, 0
_0224E94C: .word ov45_02256964
_0224E950: .word ov45_022565D0
_0224E954: .word ov45_022560EC
_0224E958: .word 0x00000F9D
_0224E95C: .word ov45_022568DC
_0224E960: .word 0x00000FAF
_0224E964: .word ov45_0225697C
	arm_func_end ov45_0224E81C

	arm_func_start ov45_0224E968
ov45_0224E968: ; 0x0224E968
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x1c
	mov r5, r1
	ldr r1, [r5, #0x24]
	mov r4, r0
	cmp r1, #3
	beq _0224E998
	ldr r0, _0224EA1C ; =ov45_02256848
	ldr r1, _0224EA20 ; =ov45_022565D0
	ldr r2, _0224EA24 ; =ov45_0225627C
	ldr r3, _0224EA28 ; =0x00000FCF
	bl __msl_assertion_failed
_0224E998:
	ldr r0, [r5, #0x24]
	cmp r0, #3
	addne sp, sp, #0x1c
	ldmneia sp!, {r4, r5, pc}
	ldr r0, [r5, #0x20]
	add r2, sp, #0x10
	ldr r5, [r0, #4]
	mov ip, #0
	str ip, [r2, #4]
	mov r0, r4
	str ip, [r2]
	mov r3, #8
	mov r1, #1
	str ip, [r2, #8]
	str r3, [sp, #0x10]
	str r5, [sp, #0x14]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x1c
	ldmeqia sp!, {r4, r5, pc}
	ldr r3, [r1, #0x1c]
	mov r0, #1
	str r5, [sp, #4]
	str r0, [sp]
	ldr r0, [r3]
	add r2, sp, #0
	str r0, [sp, #8]
	ldr r3, [r3, #4]
	mov r0, r4
	str r3, [sp, #0xc]
	bl ov45_02249A0C
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0224EA1C: .word ov45_02256848
_0224EA20: .word ov45_022565D0
_0224EA24: .word ov45_0225627C
_0224EA28: .word 0x00000FCF
	arm_func_end ov45_0224E968

	arm_func_start ov45_0224EA2C
ov45_0224EA2C: ; 0x0224EA2C
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r0
	mov r5, r1
	bne _0224EA50
	ldr r0, _0224EADC ; =ov45_022565C0
	ldr r1, _0224EAE0 ; =ov45_022565D0
	ldr r2, _0224EAE4 ; =ov45_02256114
	ldr r3, _0224EAE8 ; =0x00000FEC
	bl __msl_assertion_failed
_0224EA50:
	ldr r0, [r5, #0x24]
	cmp r0, #2
	beq _0224EA70
	ldr r0, _0224EAEC ; =ov45_022566F0
	ldr r1, _0224EAE0 ; =ov45_022565D0
	ldr r2, _0224EAE4 ; =ov45_02256114
	ldr r3, _0224EAF0 ; =0x00000FF2
	bl __msl_assertion_failed
_0224EA70:
	ldr r0, [r5, #0x24]
	cmp r0, #2
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #0x20]
	add r0, r4, #0x36c
	ldr r5, [r1]
	mov r1, r5
	bl strcmp
	cmp r0, #0
	beq _0224EAB0
	mov r1, r5
	add r0, r4, #0x36c
	mov r2, #0x40
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x3ab]
_0224EAB0:
	mov r2, #0
	str r2, [r4, #4]
	mov r1, #1
	str r1, [r4]
	ldr ip, [r4, #0x14]
	cmp ip, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, [r4, #0x18]
	mov r0, r4
	blx ip
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224EADC: .word ov45_022565C0
_0224EAE0: .word ov45_022565D0
_0224EAE4: .word ov45_02256114
_0224EAE8: .word 0x00000FEC
_0224EAEC: .word ov45_022566F0
_0224EAF0: .word 0x00000FF2
	arm_func_end ov45_0224EA2C

	arm_func_start ov45_0224EAF4
ov45_0224EAF4: ; 0x0224EAF4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r6, r0
	mov r4, r1
	bne _0224EB18
	ldr r0, _0224EBF8 ; =ov45_022565C0
	ldr r1, _0224EBFC ; =ov45_022565D0
	ldr r2, _0224EC00 ; =ov45_02256170
	ldr r3, _0224EC04 ; =0x00001015
	bl __msl_assertion_failed
_0224EB18:
	ldr r0, [r4, #0x24]
	cmp r0, #3
	beq _0224EB38
	ldr r0, _0224EC08 ; =ov45_02256848
	ldr r1, _0224EBFC ; =ov45_022565D0
	ldr r2, _0224EC00 ; =ov45_02256170
	ldr r3, _0224EC0C ; =0x0000101B
	bl __msl_assertion_failed
_0224EB38:
	ldr r0, [r4, #0x24]
	cmp r0, #3
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r4, #0x20]
	ldmib r0, {r4, r5}
	mov r0, r4
	bl strlen
	mov r8, r0
	mov r0, r5
	bl strlen
	add r2, r6, #0x28
	mov r7, r0
	mov r0, r4
	mov r1, r8
	add r2, r2, #0x800
	bl ov45_0224966C
	add r2, r6, #0x28
	mov r0, r5
	mov r1, r7
	add r2, r2, #0x800
	bl ov45_0224966C
	add r2, r6, #0x42
	mov r0, r4
	mov r1, r8
	add r2, r2, #0x200
	bl ov45_02249554
	mov r0, r5
	mov r1, r7
	add r2, r6, #0x140
	bl ov45_02249554
	mov r0, #1
	str r0, [r6, #0x13c]
	ldr r0, [r6, #0x8a8]
	cmp r0, #0
	beq _0224EBD0
	mov r0, r6
	bl ov45_0224F9B8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224EBD0:
	ldr r0, [r6, #0x10]
	cmp r0, #0
	beq _0224EBEC
	ldr r1, _0224EC10 ; =ov45_02256990
	add r0, r6, #0x1c
	bl ov45_02252CB4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224EBEC:
	mov r0, r6
	bl ov45_0224F9A0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0224EBF8: .word ov45_022565C0
_0224EBFC: .word ov45_022565D0
_0224EC00: .word ov45_02256170
_0224EC04: .word 0x00001015
_0224EC08: .word ov45_02256848
_0224EC0C: .word 0x0000101B
_0224EC10: .word ov45_02256990
	arm_func_end ov45_0224EAF4

	arm_func_start ov45_0224EC14
ov45_0224EC14: ; 0x0224EC14
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0x14
	mov r5, r1
	ldr r1, [r5, #0x24]
	mov r4, r0
	cmp r1, #3
	beq _0224EC44
	ldr r0, _0224ECBC ; =ov45_02256848
	ldr r1, _0224ECC0 ; =ov45_022565D0
	ldr r2, _0224ECC4 ; =ov45_02256024
	ldr r3, _0224ECC8 ; =0x0000104E
	bl __msl_assertion_failed
_0224EC44:
	ldr r0, [r5, #0x24]
	cmp r0, #3
	addne sp, sp, #0x14
	ldmneia sp!, {r3, r4, r5, r6, pc}
	ldr r0, [r5, #0x20]
	ldr r0, [r0, #4]
	bl atoi
	ldr r1, [r5, #0x20]
	mov r5, r0
	ldr r6, [r1, #8]
	add r2, sp, #8
	mov ip, #0
	mov r0, r4
	str ip, [r2]
	mov r3, #0x10
	mov r1, #1
	str ip, [r2, #4]
	str ip, [r2, #8]
	str r3, [sp, #8]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x14
	ldmeqia sp!, {r3, r4, r5, r6, pc}
	add r2, sp, #0
	mov r0, r4
	str r5, [sp]
	str r6, [sp, #4]
	bl ov45_02249A0C
	add sp, sp, #0x14
	ldmia sp!, {r3, r4, r5, r6, pc}
	.balign 4, 0
_0224ECBC: .word ov45_02256848
_0224ECC0: .word ov45_022565D0
_0224ECC4: .word ov45_02256024
_0224ECC8: .word 0x0000104E
	arm_func_end ov45_0224EC14

	arm_func_start ov45_0224ECCC
ov45_0224ECCC: ; 0x0224ECCC
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _0224ECF0
	ldr r0, _0224ED64 ; =ov45_022565C0
	ldr r1, _0224ED68 ; =ov45_022565D0
	ldr r2, _0224ED6C ; =ov45_02256038
	ldr r3, _0224ED70 ; =0x00001069
	bl __msl_assertion_failed
_0224ECF0:
	ldr r0, [r4, #0x24]
	cmp r0, #3
	bge _0224ED10
	ldr r0, _0224ED74 ; =ov45_02256964
	ldr r1, _0224ED68 ; =ov45_022565D0
	ldr r2, _0224ED6C ; =ov45_02256038
	ldr r3, _0224ED78 ; =0x0000106F
	bl __msl_assertion_failed
_0224ED10:
	ldr r0, [r4, #0x24]
	cmp r0, #3
	ldmltia sp!, {r3, r4, r5, pc}
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #4]
	bl atoi
	str r0, [r5, #0x8ac]
	ldr r0, [r4, #0x20]
	ldr r0, [r0, #8]
	bl atoi
	str r0, [r5, #0x8b0]
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _0224ED58
	ldr r1, _0224ED7C ; =ov45_02256990
	add r0, r5, #0x1c
	bl ov45_02252CB4
	ldmia sp!, {r3, r4, r5, pc}
_0224ED58:
	mov r0, r5
	bl ov45_0224F9A0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224ED64: .word ov45_022565C0
_0224ED68: .word ov45_022565D0
_0224ED6C: .word ov45_02256038
_0224ED70: .word 0x00001069
_0224ED74: .word ov45_02256964
_0224ED78: .word 0x0000106F
_0224ED7C: .word ov45_02256990
	arm_func_end ov45_0224ECCC

	arm_func_start ov45_0224ED80
ov45_0224ED80: ; 0x0224ED80
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x44
	mov r4, r1
	ldr r1, [r4, #0x24]
	mov r5, r0
	cmp r1, #3
	beq _0224EDB0
	ldr r0, _0224EEAC ; =ov45_02256848
	ldr r1, _0224EEB0 ; =ov45_022565D0
	ldr r2, _0224EEB4 ; =ov45_022562B4
	ldr r3, _0224EEB8 ; =0x00001090
	bl __msl_assertion_failed
_0224EDB0:
	ldr r0, [r4, #0x24]
	cmp r0, #3
	addne sp, sp, #0x44
	ldmneia sp!, {r4, r5, pc}
	ldr r0, [r4, #0x20]
	add r2, sp, #0x2c
	ldr r4, [r0, #4]
	mov lr, #0
	str lr, [r2, #4]
	mov r3, #5
	mov r0, r5
	str lr, [r2]
	mov ip, #1
	mov r1, #2
	str lr, [r2, #8]
	str ip, [sp, #0x2c]
	str r4, [sp, #0x30]
	str r3, [sp, #0x38]
	str r4, [sp, #0x3c]
	bl ov45_022496AC
	movs r1, r0
	beq _0224EE68
	ldr r0, [r1]
	cmp r0, #1
	bne _0224EE3C
	mov ip, #0
	mov r3, #1
	add r2, sp, #0x20
	mov r0, r5
	str ip, [sp, #0x20]
	str r3, [sp, #0x24]
	str r4, [sp, #0x28]
	bl ov45_02249A0C
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, pc}
_0224EE3C:
	cmp r0, #5
	bne _0224EE68
	mov r3, #0
	add r2, sp, #0x14
	mov r0, r5
	str r3, [sp, #0x14]
	str r4, [sp, #0x18]
	str r3, [sp, #0x1c]
	bl ov45_02249A0C
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, pc}
_0224EE68:
	mov r0, r5
	mov r1, r4
	bl ov45_0224983C
	movs r1, r0
	addeq sp, sp, #0x44
	ldmeqia sp!, {r4, r5, pc}
	mov r3, #0
	add r2, sp, #0
	mov r0, r5
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	bl ov45_02249A0C
	add sp, sp, #0x44
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0224EEAC: .word ov45_02256848
_0224EEB0: .word ov45_022565D0
_0224EEB4: .word ov45_022562B4
_0224EEB8: .word 0x00001090
	arm_func_end ov45_0224ED80

	arm_func_start ov45_0224EEBC
ov45_0224EEBC: ; 0x0224EEBC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	mov r5, r1
	ldr r1, [r5, #0x24]
	mov r4, r0
	cmp r1, #3
	beq _0224EEEC
	ldr r0, _0224EF60 ; =ov45_02256848
	ldr r1, _0224EF64 ; =ov45_022565D0
	ldr r2, _0224EF68 ; =ov45_02256394
	ldr r3, _0224EF6C ; =0x000010DE
	bl __msl_assertion_failed
_0224EEEC:
	ldr r0, [r5, #0x24]
	cmp r0, #3
	addne sp, sp, #0x18
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x20]
	add r2, sp, #0xc
	ldr r5, [r0, #4]
	mov r3, #0
	str r3, [r2, #4]
	mov r0, r4
	str r3, [r2]
	mov r1, #1
	str r3, [r2, #8]
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, pc}
	mov ip, #0
	mov r3, #6
	add r2, sp, #0
	mov r0, r4
	str ip, [sp]
	str r3, [sp, #4]
	str r5, [sp, #8]
	bl ov45_02249A0C
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224EF60: .word ov45_02256848
_0224EF64: .word ov45_022565D0
_0224EF68: .word ov45_02256394
_0224EF6C: .word 0x000010DE
	arm_func_end ov45_0224EEBC

	arm_func_start ov45_0224EF70
ov45_0224EF70: ; 0x0224EF70
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	mov r5, r1
	ldr r1, [r5, #0x24]
	mov r4, r0
	cmp r1, #3
	beq _0224EFA0
	ldr r0, _0224F014 ; =ov45_02256848
	ldr r1, _0224F018 ; =ov45_022565D0
	ldr r2, _0224F01C ; =ov45_02256308
	ldr r3, _0224F020 ; =0x00001101
	bl __msl_assertion_failed
_0224EFA0:
	ldr r0, [r5, #0x24]
	cmp r0, #3
	addne sp, sp, #0x18
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x20]
	add r2, sp, #0xc
	ldr r5, [r0, #4]
	mov r3, #0
	str r3, [r2, #4]
	mov r0, r4
	str r3, [r2]
	mov r1, #1
	str r3, [r2, #8]
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, pc}
	mov ip, #0
	mov r3, #2
	add r2, sp, #0
	mov r0, r4
	str ip, [sp]
	str r3, [sp, #4]
	str r5, [sp, #8]
	bl ov45_02249A0C
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224F014: .word ov45_02256848
_0224F018: .word ov45_022565D0
_0224F01C: .word ov45_02256308
_0224F020: .word 0x00001101
	arm_func_end ov45_0224EF70

	arm_func_start ov45_0224F024
ov45_0224F024: ; 0x0224F024
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	mov r5, r1
	ldr r1, [r5, #0x24]
	mov r4, r0
	cmp r1, #3
	beq _0224F054
	ldr r0, _0224F0C8 ; =ov45_02256848
	ldr r1, _0224F0CC ; =ov45_022565D0
	ldr r2, _0224F0D0 ; =ov45_0225635C
	ldr r3, _0224F0D4 ; =0x00001124
	bl __msl_assertion_failed
_0224F054:
	ldr r0, [r5, #0x24]
	cmp r0, #3
	addne sp, sp, #0x18
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x20]
	add r2, sp, #0xc
	ldr r5, [r0, #4]
	mov r3, #0
	str r3, [r2, #4]
	mov r0, r4
	str r3, [r2]
	mov r1, #1
	str r3, [r2, #8]
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, pc}
	mov ip, #0
	mov r3, #3
	add r2, sp, #0
	mov r0, r4
	str ip, [sp]
	str r3, [sp, #4]
	str r5, [sp, #8]
	bl ov45_02249A0C
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224F0C8: .word ov45_02256848
_0224F0CC: .word ov45_022565D0
_0224F0D0: .word ov45_0225635C
_0224F0D4: .word 0x00001124
	arm_func_end ov45_0224F024

	arm_func_start ov45_0224F0D8
ov45_0224F0D8: ; 0x0224F0D8
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	mov r5, r1
	ldr r1, [r5, #0x24]
	mov r4, r0
	cmp r1, #3
	beq _0224F108
	ldr r0, _0224F17C ; =ov45_02256848
	ldr r1, _0224F180 ; =ov45_022565D0
	ldr r2, _0224F184 ; =ov45_02256378
	ldr r3, _0224F188 ; =0x00001147
	bl __msl_assertion_failed
_0224F108:
	ldr r0, [r5, #0x24]
	cmp r0, #3
	addne sp, sp, #0x18
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x20]
	add r2, sp, #0xc
	ldr r5, [r0, #4]
	mov r3, #0
	str r3, [r2, #4]
	mov r0, r4
	str r3, [r2]
	mov r1, #1
	str r3, [r2, #8]
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, pc}
	mov ip, #0
	mov r3, #4
	add r2, sp, #0
	mov r0, r4
	str ip, [sp]
	str r3, [sp, #4]
	str r5, [sp, #8]
	bl ov45_02249A0C
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224F17C: .word ov45_02256848
_0224F180: .word ov45_022565D0
_0224F184: .word ov45_02256378
_0224F188: .word 0x00001147
	arm_func_end ov45_0224F0D8

	arm_func_start ov45_0224F18C
ov45_0224F18C: ; 0x0224F18C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	mov r5, r1
	ldr r1, [r5, #0x24]
	mov r4, r0
	cmp r1, #3
	beq _0224F1BC
	ldr r0, _0224F230 ; =ov45_02256848
	ldr r1, _0224F234 ; =ov45_022565D0
	ldr r2, _0224F238 ; =ov45_02256298
	ldr r3, _0224F23C ; =0x0000116A
	bl __msl_assertion_failed
_0224F1BC:
	ldr r0, [r5, #0x24]
	cmp r0, #3
	addne sp, sp, #0x18
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x20]
	add r2, sp, #0xc
	ldr r5, [r0, #4]
	mov r3, #0
	str r3, [r2, #4]
	mov r0, r4
	str r3, [r2]
	mov r1, #1
	str r3, [r2, #8]
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, pc}
	mov ip, #0
	mov r3, #5
	add r2, sp, #0
	mov r0, r4
	str ip, [sp]
	str r3, [sp, #4]
	str r5, [sp, #8]
	bl ov45_02249A0C
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224F230: .word ov45_02256848
_0224F234: .word ov45_022565D0
_0224F238: .word ov45_02256298
_0224F23C: .word 0x0000116A
	arm_func_end ov45_0224F18C

	arm_func_start ov45_0224F240
ov45_0224F240: ; 0x0224F240
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x18
	mov r5, r1
	ldr r1, [r5, #0x24]
	mov r4, r0
	cmp r1, #3
	beq _0224F270
	ldr r0, _0224F2E4 ; =ov45_02256848
	ldr r1, _0224F2E8 ; =ov45_022565D0
	ldr r2, _0224F2EC ; =ov45_02256230
	ldr r3, _0224F2F0 ; =0x0000118D
	bl __msl_assertion_failed
_0224F270:
	ldr r0, [r5, #0x24]
	cmp r0, #3
	addne sp, sp, #0x18
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r0, [r5, #0x20]
	add r2, sp, #0xc
	ldr r5, [r0, #4]
	mov r3, #0
	str r3, [r2, #4]
	mov r0, r4
	str r3, [r2]
	mov r1, #1
	str r3, [r2, #8]
	str r1, [sp, #0xc]
	str r5, [sp, #0x10]
	bl ov45_022496AC
	movs r1, r0
	addeq sp, sp, #0x18
	ldmeqia sp!, {r3, r4, r5, pc}
	mov ip, #0
	mov r3, #8
	add r2, sp, #0
	mov r0, r4
	str ip, [sp]
	str r3, [sp, #4]
	str r5, [sp, #8]
	bl ov45_02249A0C
	add sp, sp, #0x18
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_0224F2E4: .word ov45_02256848
_0224F2E8: .word ov45_022565D0
_0224F2EC: .word ov45_02256230
_0224F2F0: .word 0x0000118D
	arm_func_end ov45_0224F240

	arm_func_start ov45_0224F2F4
ov45_0224F2F4: ; 0x0224F2F4
	bx lr
	arm_func_end ov45_0224F2F4

	arm_func_start ov45_0224F2F8
ov45_0224F2F8: ; 0x0224F2F8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	movs r4, r0
	bne _0224F31C
	ldr r0, _0224F34C ; =ov45_022565C0
	ldr r1, _0224F350 ; =ov45_022565D0
	ldr r2, _0224F354 ; =ov45_022563B0
	ldr r3, _0224F358 ; =0x000011B2
	bl __msl_assertion_failed
_0224F31C:
	ldr r0, [r4, #4]
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	mov r3, #0
	mov r0, r4
	add r2, r4, #0x36c
	mov r1, #2
	str r3, [sp]
	bl ov45_02251B0C
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0224F34C: .word ov45_022565C0
_0224F350: .word ov45_022565D0
_0224F354: .word ov45_022563B0
_0224F358: .word 0x000011B2
	arm_func_end ov45_0224F2F8

	arm_func_start ov45_0224F35C
ov45_0224F35C: ; 0x0224F35C
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _0224F37C
	ldr r0, _0224F3B0 ; =ov45_022565C0
	ldr r1, _0224F3B4 ; =ov45_022565D0
	ldr r2, _0224F3B8 ; =ov45_02256248
	ldr r3, _0224F3BC ; =0x000011C2
	bl __msl_assertion_failed
_0224F37C:
	ldr r0, [r4, #4]
	cmp r0, #0
	ldmeqia sp!, {r4, pc}
	mov r1, #0
	str r1, [r4, #4]
	ldr ip, [r4, #0x14]
	cmp ip, #0
	ldmeqia sp!, {r4, pc}
	ldr r3, [r4, #0x18]
	mov r0, r4
	mov r2, #2
	blx ip
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0224F3B0: .word ov45_022565C0
_0224F3B4: .word ov45_022565D0
_0224F3B8: .word ov45_02256248
_0224F3BC: .word 0x000011C2
	arm_func_end ov45_0224F35C

	arm_func_start ov45_0224F3C0
ov45_0224F3C0: ; 0x0224F3C0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	movs r4, r0
	bne _0224F3E4
	ldr r0, _0224F414 ; =ov45_022565C0
	ldr r1, _0224F418 ; =ov45_022565D0
	ldr r2, _0224F41C ; =ov45_02256260
	ldr r3, _0224F420 ; =0x000011DB
	bl __msl_assertion_failed
_0224F3E4:
	ldr r0, [r4, #4]
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	ldr r2, _0224F424 ; =ov45_02256708
	mov r3, #0
	mov r0, r4
	mov r1, #4
	str r3, [sp]
	bl ov45_02251B0C
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0224F414: .word ov45_022565C0
_0224F418: .word ov45_022565D0
_0224F41C: .word ov45_02256260
_0224F420: .word 0x000011DB
_0224F424: .word ov45_02256708
	arm_func_end ov45_0224F3C0

	arm_func_start ov45_0224F428
ov45_0224F428: ; 0x0224F428
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	movs r4, r0
	bne _0224F44C
	ldr r0, _0224F47C ; =ov45_022565C0
	ldr r1, _0224F480 ; =ov45_022565D0
	ldr r2, _0224F484 ; =ov45_022563D0
	ldr r3, _0224F488 ; =0x000011EB
	bl __msl_assertion_failed
_0224F44C:
	ldr r0, [r4, #4]
	cmp r0, #0
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	ldr r2, _0224F48C ; =ov45_02256708
	mov r3, #0
	mov r0, r4
	mov r1, #3
	str r3, [sp]
	bl ov45_02251B0C
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0224F47C: .word ov45_022565C0
_0224F480: .word ov45_022565D0
_0224F484: .word ov45_022563D0
_0224F488: .word 0x000011EB
_0224F48C: .word ov45_02256708
	arm_func_end ov45_0224F428

	arm_func_start ov45_0224F490
ov45_0224F490: ; 0x0224F490
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r4, r0
	mov r5, r1
	bne _0224F4B4
	ldr r0, _0224F5A4 ; =ov45_022565C0
	ldr r1, _0224F5A8 ; =ov45_022565D0
	ldr r2, _0224F5AC ; =ov45_022563F0
	mov r3, #0x1200
	bl __msl_assertion_failed
_0224F4B4:
	ldr r0, [r5, #0x24]
	cmp r0, #4
	beq _0224F4D4
	ldr r0, _0224F5B0 ; =ov45_0225680C
	ldr r1, _0224F5A8 ; =ov45_022565D0
	ldr r2, _0224F5AC ; =ov45_022563F0
	ldr r3, _0224F5B4 ; =0x00001206
	bl __msl_assertion_failed
_0224F4D4:
	ldr r0, [r5, #0x24]
	cmp r0, #4
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [r5, #0x20]
	ldr r0, [r0, #4]
	bl atoi
	ldr r2, [r5, #0x20]
	ldr r1, [r4, #4]
	ldr r5, [r2, #8]
	mov r7, r0
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r0, r7, lsl #2
	bl ov00_021EC3A8
	movs r8, r0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r1, _0224F5B8 ; =ov45_02256998
	mov r0, r5
	bl strtok
	mov sb, #0
	mov r6, sb
	ldr r5, _0224F5B8 ; =ov45_02256998
	b _0224F550
_0224F530:
	bl ov00_021FF3D4
	str r0, [r8, sb, lsl #2]
	cmp r0, #0
	beq _0224F560
	mov r0, r6
	mov r1, r5
	bl strtok
	add sb, sb, #1
_0224F550:
	cmp sb, r7
	bge _0224F560
	cmp r0, #0
	bne _0224F530
_0224F560:
	mov r0, r4
	mov r3, sb
	add r2, r4, #0x510
	mov r1, #5
	str r8, [sp]
	bl ov45_02251B0C
	cmp sb, #0
	mov r4, #0
	ble _0224F598
_0224F584:
	ldr r0, [r8, r4, lsl #2]
	bl ov00_021EC3D8
	add r4, r4, #1
	cmp r4, sb
	blt _0224F584
_0224F598:
	mov r0, r8
	bl ov00_021EC3D8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0224F5A4: .word ov45_022565C0
_0224F5A8: .word ov45_022565D0
_0224F5AC: .word ov45_022563F0
_0224F5B0: .word ov45_0225680C
_0224F5B4: .word 0x00001206
_0224F5B8: .word ov45_02256998
	arm_func_end ov45_0224F490

	arm_func_start ov45_0224F5BC
ov45_0224F5BC: ; 0x0224F5BC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r5, r1
	mov r6, r0
	bne _0224F5E0
	ldr r0, _0224F648 ; =ov45_02256B84
	ldr r1, _0224F64C ; =ov45_02256B94
	ldr r2, _0224F650 ; =ov45_02256B24
	mov r3, #0x4f
	bl __msl_assertion_failed
_0224F5E0:
	ldr r7, _0224F654 ; =ov45_02255DA0
	mov r4, #0
	ldr r0, [r7]
	cmp r0, #0
	ble _0224F640
	ldr r8, _0224F658 ; =ov45_02256410
_0224F5F8:
	ldr r0, [r5, #0x14]
	ldr r1, [r8, r4, lsl #3]
	bl strnicmp
	cmp r0, #0
	bne _0224F630
	ldr r0, _0224F65C ; =ov45_02256410 + 4
	ldr r2, [r0, r4, lsl #3]
	cmp r2, #0
	beq _0224F628
	mov r0, r6
	mov r1, r5
	blx r2
_0224F628:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_0224F630:
	ldr r0, [r7]
	add r4, r4, #1
	cmp r4, r0
	blt _0224F5F8
_0224F640:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0224F648: .word ov45_02256B84
_0224F64C: .word ov45_02256B94
_0224F650: .word ov45_02256B24
_0224F654: .word ov45_02255DA0
_0224F658: .word ov45_02256410
_0224F65C: .word ov45_02256410 + 4
	arm_func_end ov45_0224F5BC

	arm_func_start ov45_0224F660
ov45_0224F660: ; 0x0224F660
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r4, r1
	bl ov45_0224A630
	cmp r0, #0
	bne _0224F68C
	mov r0, r5
	mov r1, r4
	bl ov45_022474FC
	cmp r0, #0
	beq _0224F694
_0224F68C:
	mov r0, #1
	ldmia sp!, {r3, r4, r5, pc}
_0224F694:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end ov45_0224F660

	arm_func_start ov45_0224F69C
ov45_0224F69C: ; 0x0224F69C
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x14
	movs r4, r0
	mov r5, r1
	bne _0224F6C4
	ldr r0, _0224F764 ; =ov45_02256BA0
	ldr r1, _0224F768 ; =ov45_02256B94
	ldr r2, _0224F76C ; =ov45_02256A54
	mov r3, #0x73
	bl __msl_assertion_failed
_0224F6C4:
	ldr r0, [r4, #8]
	cmp r0, #0
	addne sp, sp, #0x14
	ldmneia sp!, {r4, r5, pc}
	mov r1, #0
	str r1, [r4]
	str r1, [r4, #4]
	mov ip, #1
	str ip, [r4, #8]
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0224F71C
	ldr ip, [r4, #0x14]
	cmp ip, #0
	addeq sp, sp, #0x14
	ldmeqia sp!, {r4, r5, pc}
	ldr r3, [r4, #0x18]
	mov r0, r4
	mov r2, r1
	blx ip
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
_0224F71C:
	ldr r0, [r4, #0x7fc]
	cmp r0, #0
	addeq sp, sp, #0x14
	ldmeqia sp!, {r4, r5, pc}
	str r5, [sp, #0x10]
	ldr r2, [r4, #0x808]
	mov r0, #4
	str r2, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x7fc]
	add r3, sp, #0x10
	mov r0, r4
	mov r1, ip
	bl ov45_02244D30
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, pc}
	.balign 4, 0
_0224F764: .word ov45_02256BA0
_0224F768: .word ov45_02256B94
_0224F76C: .word ov45_02256A54
	arm_func_end ov45_0224F69C

	arm_func_start ov45_0224F770
ov45_0224F770: ; 0x0224F770
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x14
	movs r6, r0
	mov r5, r1
	bne _0224F798
	ldr r0, _0224F850 ; =ov45_02256BA0
	ldr r1, _0224F854 ; =ov45_02256B94
	ldr r2, _0224F858 ; =ov45_022569A0
	mov r3, #0x9a
	bl __msl_assertion_failed
_0224F798:
	ldr r0, [r6, #0x20]
	cmp r0, #1
	bne _0224F834
	add r0, r6, #0x1c
	bl ov45_02252AA0
	add r0, r6, #0x1c
	bl ov45_02253B5C
	movs r4, r0
	beq _0224F81C
	mov sb, #0
	mov r8, #4
	add r7, sp, #0x10
_0224F7C8:
	ldr r0, [r6, #0x7f8]
	cmp r0, #0
	beq _0224F800
	ldr r1, [r4]
	mov r0, r6
	str r1, [sp, #0x10]
	ldr r2, [r6, #0x808]
	mov r1, sb
	stmia sp, {r2, sb}
	str sb, [sp, #8]
	str r8, [sp, #0xc]
	ldr r2, [r6, #0x7f8]
	mov r3, r7
	bl ov45_02244D30
_0224F800:
	mov r0, r6
	mov r1, r4
	bl ov45_0224F5BC
	add r0, r6, #0x1c
	bl ov45_02253B5C
	movs r4, r0
	bne _0224F7C8
_0224F81C:
	ldr r0, [r6, #0x20]
	cmp r0, #2
	bne _0224F834
	ldr r1, _0224F85C ; =ov45_02256BB0
	mov r0, r6
	bl ov45_0224F69C
_0224F834:
	mov r0, r6
	bl ov45_0224A578
	mov r0, r6
	mov r1, r5
	bl ov45_022471A0
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_0224F850: .word ov45_02256BA0
_0224F854: .word ov45_02256B94
_0224F858: .word ov45_022569A0
_0224F85C: .word ov45_02256BB0
	arm_func_end ov45_0224F770

	arm_func_start ov45_0224F860
ov45_0224F860: ; 0x0224F860
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	movs r4, r0
	bne _0224F884
	ldr r0, _0224F920 ; =ov45_02256BA0
	ldr r1, _0224F924 ; =ov45_02256B94
	ldr r2, _0224F928 ; =ov45_022569A8
	mov r3, #0xce
	bl __msl_assertion_failed
_0224F884:
	ldr r0, [r4, #0x8a8]
	cmp r0, #0
	bne _0224F8C4
	add r0, r4, #0x36c
	bl ov45_02251A8C
	movs r1, r0
	beq _0224F8BC
	mov r3, #0
	mov r0, r4
	add r2, r4, #0x36c
	str r3, [sp]
	bl ov45_02251B0C
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0224F8BC:
	add r2, r4, #0x36c
	b _0224F90C
_0224F8C4:
	cmp r0, #2
	ldreq r0, [r4, #0x4ac]
	cmpeq r0, #0
	bne _0224F908
	add r0, r4, #0x4f0
	bl ov45_02251A8C
	movs r1, r0
	beq _0224F900
	mov r3, #0
	mov r0, r4
	add r2, r4, #0x4f0
	str r3, [sp]
	bl ov45_02251B0C
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
_0224F900:
	add r2, r4, #0x4f0
	b _0224F90C
_0224F908:
	ldr r2, _0224F92C ; =ov45_02256BC0
_0224F90C:
	ldr r1, _0224F930 ; =ov45_02256BC4
	add r0, r4, #0x1c
	bl ov45_02252F74
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0224F920: .word ov45_02256BA0
_0224F924: .word ov45_02256B94
_0224F928: .word ov45_022569A8
_0224F92C: .word ov45_02256BC0
_0224F930: .word ov45_02256BC4
	arm_func_end ov45_0224F860

	arm_func_start ov45_0224F934
ov45_0224F934: ; 0x0224F934
	stmdb sp!, {r4, lr}
	sub sp, sp, #8
	movs r4, r0
	bne _0224F958
	ldr r0, _0224F98C ; =ov45_02256BA0
	ldr r1, _0224F990 ; =ov45_02256B94
	ldr r2, _0224F994 ; =ov45_022569B4
	mov r3, #0x104
	bl __msl_assertion_failed
_0224F958:
	add r0, r4, #0x374
	add r0, r0, #0x400
	add r2, r4, #0x2c
	ldr r1, _0224F998 ; =ov45_02256BCC
	ldr r3, _0224F99C ; =ov45_02256BE0
	str r0, [sp]
	add ip, r4, #0x3ac
	add r0, r4, #0x1c
	add r2, r2, #0x400
	str ip, [sp, #4]
	bl ov45_02252F74
	add sp, sp, #8
	ldmia sp!, {r4, pc}
	.balign 4, 0
_0224F98C: .word ov45_02256BA0
_0224F990: .word ov45_02256B94
_0224F994: .word ov45_022569B4
_0224F998: .word ov45_02256BCC
_0224F99C: .word ov45_02256BE0
	arm_func_end ov45_0224F934

	arm_func_start ov45_0224F9A0
ov45_0224F9A0: ; 0x0224F9A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl ov45_0224F934
	mov r0, r4
	bl ov45_0224F860
	ldmia sp!, {r4, pc}
	arm_func_end ov45_0224F9A0

	arm_func_start ov45_0224F9B8
ov45_0224F9B8: ; 0x0224F9B8
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x2c
	movs r4, r0
	bne _0224F9DC
	ldr r0, _0224FA9C ; =ov45_02256BA0
	ldr r1, _0224FAA0 ; =ov45_02256B94
	ldr r2, _0224FAA4 ; =ov45_022569CC
	mov r3, #0x118
	bl __msl_assertion_failed
_0224F9DC:
	ldr r0, [r4, #0x8a8]
	cmp r0, #3
	bne _0224FA04
	ldr r1, _0224FAA8 ; =ov45_02256BEC
	add r0, r4, #0x1c
	add r2, r4, #0x570
	add r3, r4, #0x670
	bl ov45_02252F74
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, pc}
_0224FA04:
	add r0, r4, #0x550
	bl strlen
	mov r1, r0
	add r2, sp, #8
	add r0, r4, #0x550
	bl ov00_021FF31C
	ldr r0, [r4, #0x8a8]
	cmp r0, #1
	bne _0224FA4C
	add r0, sp, #8
	str r0, [sp]
	ldr r1, _0224FAAC ; =ov45_02256C00
	ldr r2, [r4, #0x4ac]
	add r0, r4, #0x1c
	add r3, r4, #0x510
	bl ov45_02252F74
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, pc}
_0224FA4C:
	cmp r0, #2
	bne _0224FA80
	add r0, r4, #0x4f0
	str r0, [sp]
	add r0, r4, #0x4b0
	str r0, [sp, #4]
	ldr r2, [r4, #0x4ac]
	ldr r1, _0224FAB0 ; =ov45_02256C10
	add r3, sp, #8
	add r0, r4, #0x1c
	bl ov45_02252F74
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, pc}
_0224FA80:
	ldr r0, _0224FAB4 ; =ov45_02256C28
	ldr r1, _0224FAA0 ; =ov45_02256B94
	ldr r2, _0224FAA4 ; =ov45_022569CC
	ldr r3, _0224FAB8 ; =0x0000013E
	bl __msl_assertion_failed
	add sp, sp, #0x2c
	ldmia sp!, {r3, r4, pc}
	.balign 4, 0
_0224FA9C: .word ov45_02256BA0
_0224FAA0: .word ov45_02256B94
_0224FAA4: .word ov45_022569CC
_0224FAA8: .word ov45_02256BEC
_0224FAAC: .word ov45_02256C00
_0224FAB0: .word ov45_02256C10
_0224FAB4: .word ov45_02256C28
_0224FAB8: .word 0x0000013E
	arm_func_end ov45_0224F9B8

	arm_func_start ov45_0224FABC
ov45_0224FABC: ; 0x0224FABC
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	mov fp, r0
	movs r0, r1
	ldr r0, [sp, #0x38]
	str r1, [sp]
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	str r2, [sp, #4]
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x4c]
	mov sl, r3
	str r0, [sp, #0x4c]
	ldr r0, [sp, #0x50]
	ldr sb, [sp, #0x40]
	str r0, [sp, #0x50]
	ldr r0, _02250244 ; =ov45_02256C2C
	ldr r8, [sp, #0x44]
	ldr r7, [sp, #0x48]
	ldr r6, [sp, #0x54]
	ldr r5, [sp, #0x58]
	str r0, [sp, #8]
	bne _0224FB2C
	ldr r0, _02250248 ; =ov45_02256C30
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _02250254 ; =0x0000015B
	bl __msl_assertion_failed
_0224FB2C:
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	bne _0224FB4C
	ldr r0, _02250258 ; =ov45_02256C48
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	mov r3, #0x15c
	bl __msl_assertion_failed
_0224FB4C:
	ldr r0, [sp, #0x68]
	cmp r0, #0
	bne _0224FB6C
	ldr r0, _0225025C ; =ov45_02256C5C
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _02250260 ; =0x0000015D
	bl __msl_assertion_failed
_0224FB6C:
	cmp fp, #0
	bne _0224FBF4
	cmp sl, #0
	bne _0224FB90
	ldr r0, _02250264 ; =ov45_02256C74
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _02250268 ; =0x00000163
	bl __msl_assertion_failed
_0224FB90:
	ldrsb r0, [sl]
	cmp r0, #0
	bne _0224FBB0
	ldr r0, _0225026C ; =ov45_02256C84
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _02250268 ; =0x00000163
	bl __msl_assertion_failed
_0224FBB0:
	mov r0, sl
	bl strlen
	cmp r0, #0x40
	blo _0224FBD4
	ldr r0, _02250270 ; =ov45_02256C94
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _02250268 ; =0x00000163
	bl __msl_assertion_failed
_0224FBD4:
	cmp sl, #0
	ldrnesb r0, [sl]
	cmpne r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str sl, [sp, #8]
	b _0224FE48
_0224FBF4:
	cmp fp, #1
	bne _0224FCB0
	ldr r0, [sp, #0x38]
	cmp r0, #0
	bgt _0224FC1C
	ldr r0, _02250274 ; =ov45_02256CAC
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _02250278 ; =0x0000016A
	bl __msl_assertion_failed
_0224FC1C:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	addle sp, sp, #0xc
	movle r0, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r8, #0
	ldrnesb r0, [r8]
	cmpne r0, #0
	bne _0224FC54
	ldr r0, _0225027C ; =ov45_02256CBC
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _02250280 ; =0x0000016D
	bl __msl_assertion_failed
_0224FC54:
	cmp r8, #0
	ldrnesb r0, [r8]
	cmpne r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r7, #0
	ldrnesb r0, [r7]
	cmpne r0, #0
	bne _0224FC90
	ldr r0, _02250284 ; =ov45_02256CD8
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	mov r3, #0x170
	bl __msl_assertion_failed
_0224FC90:
	cmp r7, #0
	ldrnesb r0, [r7]
	cmpne r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str r8, [sp, #8]
	b _0224FE48
_0224FCB0:
	cmp fp, #2
	bne _0224FDB0
	ldr r0, [sp, #0x38]
	cmp r0, #0
	bge _0224FCD8
	ldr r0, _02250288 ; =ov45_02256CF0
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _0225028C ; =0x00000177
	bl __msl_assertion_failed
_0224FCD8:
	ldr r0, [sp, #0x38]
	cmp r0, #0
	addlt sp, sp, #0xc
	movlt r0, #0
	ldmltia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	ldrnesb r0, [r0]
	cmpne r0, #0
	bne _0224FD14
	ldr r0, _02250290 ; =ov45_02256D04
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _02250294 ; =0x0000017A
	bl __msl_assertion_failed
_0224FD14:
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	ldrnesb r0, [r0]
	cmpne r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp sb, #0
	ldrnesb r0, [sb]
	cmpne r0, #0
	bne _0224FD54
	ldr r0, _02250298 ; =ov45_02256D18
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _0225029C ; =0x0000017D
	bl __msl_assertion_failed
_0224FD54:
	cmp sb, #0
	ldrnesb r0, [sb]
	cmpne r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r7, #0
	ldrnesb r0, [r7]
	cmpne r0, #0
	bne _0224FD90
	ldr r0, _02250284 ; =ov45_02256CD8
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	mov r3, #0x180
	bl __msl_assertion_failed
_0224FD90:
	cmp r7, #0
	ldrnesb r0, [r7]
	cmpne r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str sb, [sp, #8]
	b _0224FE48
_0224FDB0:
	cmp fp, #3
	bne _0224FE48
	ldr r0, [sp, #0x4c]
	cmp r0, #0
	ldrnesb r0, [r0]
	cmpne r0, #0
	bne _0224FDE0
	ldr r0, _022502A0 ; =ov45_02256D38
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _022502A4 ; =0x00000187
	bl __msl_assertion_failed
_0224FDE0:
	ldr r0, [sp, #0x4c]
	cmp r0, #0
	ldrnesb r0, [r0]
	cmpne r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #0x50]
	cmp r0, #0
	ldrnesb r0, [r0]
	cmpne r0, #0
	bne _0224FE24
	ldr r0, _022502A8 ; =ov45_02256D54
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _022502AC ; =0x0000018A
	bl __msl_assertion_failed
_0224FE24:
	ldr r0, [sp, #0x50]
	cmp r0, #0
	ldrnesb r0, [r0]
	cmpne r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, _022502B0 ; =ov45_02256D7C
	str r0, [sp, #8]
_0224FE48:
	cmp fp, #0
	beq _0224FEC8
	cmp r6, #0
	ldrnesb r0, [r6]
	cmpne r0, #0
	bne _0224FE74
	ldr r0, _022502B4 ; =ov45_02256D84
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	ldr r3, _022502B8 ; =0x00000191
	bl __msl_assertion_failed
_0224FE74:
	cmp r6, #0
	ldrnesb r0, [r6]
	cmpne r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r5, #0
	ldrnesb r0, [r5]
	cmpne r0, #0
	bne _0224FEB0
	ldr r0, _022502BC ; =ov45_02256D9C
	ldr r1, _0225024C ; =ov45_02256B94
	ldr r2, _02250250 ; =ov45_02256A08
	mov r3, #0x194
	bl __msl_assertion_failed
_0224FEB0:
	cmp r5, #0
	ldrnesb r0, [r5]
	cmpne r0, #0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0224FEC8:
	bl ov00_021FF3CC
	ldr r0, _022502C0 ; =0x000008B4
	bl ov00_021EC3A8
	movs r4, r0
	addeq sp, sp, #0xc
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r1, #0
	ldr r2, _022502C0 ; =0x000008B4
	bl memset
	str fp, [r4, #0x8a8]
	cmp sl, #0
	beq _0224FF14
	mov r1, sl
	add r0, r4, #0x36c
	mov r2, #0x40
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x3ab]
_0224FF14:
	ldr r1, [sp, #0x30]
	cmp r1, #0
	beq _0224FF38
	add r0, r4, #0x2c
	add r0, r0, #0x400
	mov r2, #0x80
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x4ab]
_0224FF38:
	ldr r1, [sp, #0x34]
	cmp r1, #0
	beq _0224FF58
	add r0, r4, #0x3ac
	mov r2, #0x80
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x42b]
_0224FF58:
	ldr r0, [sp, #0x38]
	str r0, [r4, #0x4ac]
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _0224FF84
	mov r1, r0
	add r0, r4, #0x4b0
	mov r2, #0x40
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x4ef]
_0224FF84:
	cmp sb, #0
	beq _0224FFA4
	mov r1, sb
	add r0, r4, #0x4f0
	mov r2, #0x20
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x50f]
_0224FFA4:
	cmp r8, #0
	beq _0224FFC4
	mov r1, r8
	add r0, r4, #0x510
	mov r2, #0x40
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x54f]
_0224FFC4:
	cmp r7, #0
	beq _0224FFE4
	mov r1, r7
	add r0, r4, #0x550
	mov r2, #0x20
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x56f]
_0224FFE4:
	ldr r0, [sp, #0x4c]
	cmp r0, #0
	beq _02250008
	mov r1, r0
	add r0, r4, #0x570
	mov r2, #0x100
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x66f]
_02250008:
	ldr r0, [sp, #0x50]
	cmp r0, #0
	beq _0225002C
	mov r1, r0
	add r0, r4, #0x670
	mov r2, #0x100
	bl strncpy
	mov r0, #0
	strb r0, [r4, #0x76f]
_0225002C:
	add r0, r4, #0x374
	ldr r1, [sp]
	add r0, r0, #0x400
	mov r2, #0x80
	bl strncpy
	mov r7, #0
	add r1, r4, #0x3f8
	ldr sb, [sp, #0x5c]
	ldr r0, [sp, #4]
	strb r7, [r4, #0x7f3]
	str r0, [r4, #0x7f4]
	add r8, r1, #0x400
	ldmia sb!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	ldr r1, [sb]
	mov r0, #1
	str r1, [r8]
	str r0, [r4, #0x81c]
	str r0, [r4, #4]
	mov r0, r4
	str r7, [r4, #0x824]
	bl ov45_02247968
	cmp r0, #0
	mov r0, r4
	bne _022500A4
	bl ov00_021EC3D8
	bl ov00_021FF3D0
	add sp, sp, #0xc
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022500A4:
	bl ov45_02244B9C
	cmp r0, #0
	bne _022500D0
	mov r0, r4
	bl ov45_022479F0
	mov r0, r4
	bl ov00_021EC3D8
	bl ov00_021FF3D0
	add sp, sp, #0xc
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_022500D0:
	ldr r1, [sp, #8]
	add r0, r4, #0x1c
	bl ov45_02251EF0
	cmp r0, #0
	bne _0225010C
	mov r0, r4
	bl ov45_02244BCC
	mov r0, r4
	bl ov45_022479F0
	mov r0, r4
	bl ov00_021EC3D8
	bl ov00_021FF3D0
	add sp, sp, #0xc
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0225010C:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, r4, #0x1c
	bl ov45_02251F6C
	cmp r0, #0
	bne _02250154
	add r0, r4, #0x1c
	bl ov45_022522B4
	mov r0, r4
	bl ov45_02244BCC
	mov r0, r4
	bl ov45_022479F0
	mov r0, r4
	bl ov00_021EC3D8
	bl ov00_021FF3D0
	add sp, sp, #0xc
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_02250154:
	ldr r1, [sp, #0x60]
	ldr r0, [sp, #0x64]
	str r1, [r4, #0xc]
	str r0, [r4, #0x10]
	ldr r1, [sp, #0x68]
	ldr r0, [sp, #0x6c]
	str r1, [r4, #0x14]
	str r0, [r4, #0x18]
	cmp r6, #0
	ldrnesb r0, [r6]
	cmpne r0, #0
	cmpne r5, #0
	ldrnesb r0, [r5]
	cmpne r0, #0
	beq _022501C8
	add r0, r4, #0x28
	mov r1, r5
	add r0, r0, #0x800
	mov r2, #0x80
	bl strncpy
	mov r1, r7
	strb r1, [r4, #0x8a7]
	ldr r0, _022502C4 ; =ov45_0225699C
	ldr r1, _022502C8 ; =ov45_02256DB8
	ldr r2, [r0]
	mov r3, r6
	add r0, r4, #0x1c
	bl ov45_02252F74
	b _022501EC
_022501C8:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _022501E4
	ldr r1, _022502CC ; =ov45_02256DC8
	add r0, r4, #0x1c
	bl ov45_02252CB4
	b _022501EC
_022501E4:
	mov r0, r4
	bl ov45_0224F9A0
_022501EC:
	ldr r0, [sp, #0x70]
	cmp r0, #0
	beq _02250238
	mov r6, #0
	mov r5, #0xa
_02250200:
	mov r0, r4
	mov r1, r6
	bl ov45_0224F770
	mov r0, r5
	bl ov00_021FF3C0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02250200
	ldr r0, [r4]
	cmp r0, #0
	bne _02250238
	mov r0, r4
	bl ov45_022504E0
	mov r4, #0
_02250238:
	mov r0, r4
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02250244: .word ov45_02256C2C
_02250248: .word ov45_02256C30
_0225024C: .word ov45_02256B94
_02250250: .word ov45_02256A08
_02250254: .word 0x0000015B
_02250258: .word ov45_02256C48
_0225025C: .word ov45_02256C5C
_02250260: .word 0x0000015D
_02250264: .word ov45_02256C74
_02250268: .word 0x00000163
_0225026C: .word ov45_02256C84
_02250270: .word ov45_02256C94
_02250274: .word ov45_02256CAC
_02250278: .word 0x0000016A
_0225027C: .word ov45_02256CBC
_02250280: .word 0x0000016D
_02250284: .word ov45_02256CD8
_02250288: .word ov45_02256CF0
_0225028C: .word 0x00000177
_02250290: .word ov45_02256D04
_02250294: .word 0x0000017A
_02250298: .word ov45_02256D18
_0225029C: .word 0x0000017D
_022502A0: .word ov45_02256D38
_022502A4: .word 0x00000187
_022502A8: .word ov45_02256D54
_022502AC: .word 0x0000018A
_022502B0: .word ov45_02256D7C
_022502B4: .word ov45_02256D84
_022502B8: .word 0x00000191
_022502BC: .word ov45_02256D9C
_022502C0: .word 0x000008B4
_022502C4: .word ov45_0225699C
_022502C8: .word ov45_02256DB8
_022502CC: .word ov45_02256DC8
	arm_func_end ov45_0224FABC

	arm_func_start ov45_022502D0
ov45_022502D0: ; 0x022502D0
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #0x44
	mov ip, r0
	mov r0, #0
	stmia sp, {r0, r3}
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r0, [sp, #0x1c]
	ldr lr, [sp, #0x50]
	str r0, [sp, #0x20]
	str lr, [sp, #0x24]
	ldr r3, [sp, #0x54]
	mov r4, r1
	str r3, [sp, #0x28]
	ldr lr, [sp, #0x58]
	mov r3, r2
	str lr, [sp, #0x2c]
	ldr r2, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	str r2, [sp, #0x30]
	str r1, [sp, #0x34]
	ldr r2, [sp, #0x64]
	ldr r1, [sp, #0x68]
	str r2, [sp, #0x38]
	str r1, [sp, #0x3c]
	ldr lr, [sp, #0x6c]
	mov r1, ip
	mov r2, r4
	str lr, [sp, #0x40]
	bl ov45_0224FABC
	add sp, sp, #0x44
	ldmia sp!, {r3, r4, pc}
	arm_func_end ov45_022502D0

	arm_func_start ov45_0225035C
ov45_0225035C: ; 0x0225035C
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _02250380
	ldr r0, _02250410 ; =ov45_02256BA0
	ldr r1, _02250414 ; =ov45_02256B94
	ldr r2, _02250418 ; =ov45_02256A68
	ldr r3, _0225041C ; =0x00000385
	bl __msl_assertion_failed
_02250380:
	ldr r0, [r5]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	bne _022503BC
	mov r1, #0
	str r1, [r5, #4]
	ldr ip, [r5, #0x14]
	cmp ip, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r3, [r5, #0x18]
	mov r0, r5
	mov r2, #1
	blx ip
	ldmia sp!, {r3, r4, r5, pc}
_022503BC:
	mov r1, r4
	add r0, r5, #0x36c
	mov r2, #0x40
	bl strncpy
	mov r1, #0
	mov r0, r4
	strb r1, [r5, #0x3ab]
	bl ov45_02251A8C
	movs r1, r0
	beq _022503FC
	mov r3, #0
	mov r0, r5
	mov r2, r4
	str r3, [sp]
	bl ov45_02251B0C
	ldmia sp!, {r3, r4, r5, pc}
_022503FC:
	ldr r1, _02250420 ; =ov45_02256DD0
	mov r2, r4
	add r0, r5, #0x1c
	bl ov45_02252F74
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02250410: .word ov45_02256BA0
_02250414: .word ov45_02256B94
_02250418: .word ov45_02256A68
_0225041C: .word 0x00000385
_02250420: .word ov45_02256DD0
	arm_func_end ov45_0225035C

	arm_func_start ov45_02250424
ov45_02250424: ; 0x02250424
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bne _02250450
	ldr r0, _022504C8 ; =ov45_02256BA0
	ldr r1, _022504CC ; =ov45_02256B94
	ldr r2, _022504D0 ; =ov45_02256B3C
	ldr r3, _022504D4 ; =0x000003BD
	bl __msl_assertion_failed
_02250450:
	ldr r0, [r7]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #0
	bne _0225048C
	mov r1, #0
	str r1, [r7, #4]
	ldr ip, [r7, #0x14]
	cmp ip, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r3, [r7, #0x18]
	mov r0, r7
	mov r2, #1
	blx ip
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_0225048C:
	cmp r4, #0
	ldreq r4, _022504D8 ; =ov45_02256C2C
	ldr r1, _022504DC ; =ov45_02256DDC
	mov r2, r6
	mov r3, r5
	add r0, r7, #0x1c
	str r4, [sp]
	bl ov45_02252F74
	mov r1, r5
	add r0, r7, #0x510
	mov r2, #0x40
	bl strncpy
	mov r0, #0
	strb r0, [r7, #0x54f]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022504C8: .word ov45_02256BA0
_022504CC: .word ov45_02256B94
_022504D0: .word ov45_02256B3C
_022504D4: .word 0x000003BD
_022504D8: .word ov45_02256C2C
_022504DC: .word ov45_02256DDC
	arm_func_end ov45_02250424

	arm_func_start ov45_022504E0
ov45_022504E0: ; 0x022504E0
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02250500
	ldr r0, _02250578 ; =ov45_02256BA0
	ldr r1, _0225057C ; =ov45_02256B94
	ldr r2, _02250580 ; =ov45_022569E8
	ldr r3, _02250584 ; =0x000003EF
	bl __msl_assertion_failed
_02250500:
	mov r0, r4
	bl ov45_0224A6B4
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _02250530
	ldr r3, [r4, #0x7fc]
	cmp r3, #0
	beq _02250530
	ldr r2, [r4, #0x808]
	ldr r1, _02250588 ; =ov45_02256C2C
	mov r0, r4
	blx r3
_02250530:
	ldr r0, [r4]
	cmp r0, #0
	beq _02250550
	ldr r1, _0225058C ; =ov45_02256DF4
	add r0, r4, #0x1c
	bl ov45_02252CB4
	add r0, r4, #0x1c
	bl ov45_02252AA0
_02250550:
	mov r0, r4
	bl ov45_022479F0
	mov r0, r4
	bl ov45_02244BCC
	add r0, r4, #0x1c
	bl ov45_022522B4
	mov r0, r4
	bl ov00_021EC3D8
	bl ov00_021FF3D0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02250578: .word ov45_02256BA0
_0225057C: .word ov45_02256B94
_02250580: .word ov45_022569E8
_02250584: .word 0x000003EF
_02250588: .word ov45_02256C2C
_0225058C: .word ov45_02256DF4
	arm_func_end ov45_022504E0

	arm_func_start ov45_02250590
ov45_02250590: ; 0x02250590
	ldr ip, _0225059C ; =ov45_0224F770
	mov r1, #0
	bx ip
	.balign 4, 0
_0225059C: .word ov45_0224F770
	arm_func_end ov45_02250590

	arm_func_start ov45_022505A0
ov45_022505A0: ; 0x022505A0
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r4, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bne _022505CC
	ldr r0, _02250668 ; =ov45_02256BA0
	ldr r1, _0225066C ; =ov45_02256B94
	ldr r2, _02250670 ; =ov45_02256A18
	ldr r3, _02250674 ; =0x0000058E
	bl __msl_assertion_failed
_022505CC:
	cmp r4, #0
	ldrne r0, [r4]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r5, #0
	cmpeq r6, #0
	bne _022505FC
	ldr r0, _02250678 ; =ov45_02256E64
	ldr r1, _0225066C ; =ov45_02256B94
	ldr r2, _02250670 ; =ov45_02256A18
	ldr r3, _0225067C ; =0x00000591
	bl __msl_assertion_failed
_022505FC:
	cmp r7, #0
	ldreq r7, _02250680 ; =ov45_02256C2C
	ldr r1, _02250684 ; =ov45_02256E94
	mov r2, r7
	add r0, r4, #0x1c
	bl ov45_02252F74
	ldr r3, [sp, #0x18]
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl ov45_0224A7F0
	ldr r1, [sp, #0x1c]
	mov r6, r0
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r5, #0xa
_0225063C:
	mov r0, r4
	mov r1, r6
	bl ov45_0224F770
	mov r0, r5
	bl ov00_021FF3C0
	mov r0, r4
	mov r1, r6
	bl ov45_0224F660
	cmp r0, #0
	bne _0225063C
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02250668: .word ov45_02256BA0
_0225066C: .word ov45_02256B94
_02250670: .word ov45_02256A18
_02250674: .word 0x0000058E
_02250678: .word ov45_02256E64
_0225067C: .word 0x00000591
_02250680: .word ov45_02256C2C
_02250684: .word ov45_02256E94
	arm_func_end ov45_022505A0

	arm_func_start ov45_02250688
ov45_02250688: ; 0x02250688
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	movs r4, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bne _022506B8
	ldr r0, _022507AC ; =ov45_02256BA0
	ldr r1, _022507B0 ; =ov45_02256B94
	ldr r2, _022507B4 ; =ov45_02256A2C
	ldr r3, _022507B8 ; =0x000005B3
	bl __msl_assertion_failed
_022506B8:
	cmp r4, #0
	ldrne r0, [r4]
	cmpne r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r7, #0
	bne _022506E8
	ldr r0, _022507BC ; =ov45_02256E9C
	ldr r1, _022507B0 ; =ov45_02256B94
	ldr r2, _022507B4 ; =ov45_02256A2C
	ldr r3, _022507C0 ; =0x000005B6
	bl __msl_assertion_failed
_022506E8:
	ldrsb r0, [r7]
	cmp r0, #0
	bne _02250708
	ldr r0, _022507C4 ; =ov45_02256EAC
	ldr r1, _022507B0 ; =ov45_02256B94
	ldr r2, _022507B4 ; =ov45_02256A2C
	ldr r3, _022507C0 ; =0x000005B6
	bl __msl_assertion_failed
_02250708:
	cmp r5, #0
	bne _02250724
	ldr r0, _022507C8 ; =ov45_02256C48
	ldr r1, _022507B0 ; =ov45_02256B94
	ldr r2, _022507B4 ; =ov45_02256A2C
	ldr r3, _022507CC ; =0x000005B7
	bl __msl_assertion_failed
_02250724:
	cmp r6, #0
	ldreq r6, _022507D0 ; =ov45_02256C2C
	ldr r1, _022507D4 ; =ov45_02256EC0
	mov r2, r7
	mov r3, r6
	add r0, r4, #0x1c
	bl ov45_02252F74
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	mov r0, r4
	mov r1, r7
	stmia sp, {r5, r6}
	bl ov45_0224A874
	mov r6, r0
	mov r0, r4
	mov r1, r7
	bl ov45_02247A44
	ldr r0, [sp, #0x28]
	cmp r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r5, #0xa
_0225077C:
	mov r0, r4
	mov r1, r6
	bl ov45_0224F770
	mov r0, r5
	bl ov00_021FF3C0
	mov r0, r4
	mov r1, r6
	bl ov45_0224F660
	cmp r0, #0
	bne _0225077C
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022507AC: .word ov45_02256BA0
_022507B0: .word ov45_02256B94
_022507B4: .word ov45_02256A2C
_022507B8: .word 0x000005B3
_022507BC: .word ov45_02256E9C
_022507C0: .word 0x000005B6
_022507C4: .word ov45_02256EAC
_022507C8: .word ov45_02256C48
_022507CC: .word 0x000005B7
_022507D0: .word ov45_02256C2C
_022507D4: .word ov45_02256EC0
	arm_func_end ov45_02250688

	arm_func_start ov45_022507D8
ov45_022507D8: ; 0x022507D8
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	bne _02250800
	ldr r0, _02250878 ; =ov45_02256BA0
	ldr r1, _0225087C ; =ov45_02256B94
	ldr r2, _02250880 ; =ov45_02256A40
	ldr r3, _02250884 ; =0x000005DB
	bl __msl_assertion_failed
_02250800:
	cmp r6, #0
	ldrne r0, [r6]
	cmpne r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r5, #0
	bne _0225082C
	ldr r0, _02250888 ; =ov45_02256E9C
	ldr r1, _0225087C ; =ov45_02256B94
	ldr r2, _02250880 ; =ov45_02256A40
	ldr r3, _0225088C ; =0x000005DE
	bl __msl_assertion_failed
_0225082C:
	ldrsb r0, [r5]
	cmp r0, #0
	bne _0225084C
	ldr r0, _02250890 ; =ov45_02256EAC
	ldr r1, _0225087C ; =ov45_02256B94
	ldr r2, _02250880 ; =ov45_02256A40
	ldr r3, _0225088C ; =0x000005DE
	bl __msl_assertion_failed
_0225084C:
	cmp r4, #0
	ldreq r4, _02250894 ; =ov45_02256C2C
	ldr r1, _02250898 ; =ov45_02256ECC
	mov r2, r5
	mov r3, r4
	add r0, r6, #0x1c
	bl ov45_02252F74
	mov r0, r6
	mov r1, r5
	bl ov45_02247D84
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02250878: .word ov45_02256BA0
_0225087C: .word ov45_02256B94
_02250880: .word ov45_02256A40
_02250884: .word 0x000005DB
_02250888: .word ov45_02256E9C
_0225088C: .word 0x000005DE
_02250890: .word ov45_02256EAC
_02250894: .word ov45_02256C2C
_02250898: .word ov45_02256ECC
	arm_func_end ov45_022507D8

	arm_func_start ov45_0225089C
ov45_0225089C: ; 0x0225089C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x20
	movs r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bne _022508CC
	ldr r0, _02250A4C ; =ov45_02256BA0
	ldr r1, _02250A50 ; =ov45_02256B94
	ldr r2, _02250A54 ; =ov45_02256B6C
	ldr r3, _02250A58 ; =0x000005FC
	bl __msl_assertion_failed
_022508CC:
	cmp r7, #0
	ldrne r0, [r7]
	cmpne r0, #0
	addeq sp, sp, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	bne _022508FC
	ldr r0, _02250A5C ; =ov45_02256E9C
	ldr r1, _02250A50 ; =ov45_02256B94
	ldr r2, _02250A54 ; =ov45_02256B6C
	ldr r3, _02250A60 ; =0x000005FF
	bl __msl_assertion_failed
_022508FC:
	ldrsb r0, [r6]
	cmp r0, #0
	bne _0225091C
	ldr r0, _02250A64 ; =ov45_02256EAC
	ldr r1, _02250A50 ; =ov45_02256B94
	ldr r2, _02250A54 ; =ov45_02256B6C
	ldr r3, _02250A60 ; =0x000005FF
	bl __msl_assertion_failed
_0225091C:
	cmp r4, #4
	bls _02250938
	ldr r0, _02250A68 ; =ov45_02256ED8
	ldr r1, _02250A50 ; =ov45_02256B94
	ldr r2, _02250A54 ; =ov45_02256B6C
	mov r3, #0x600
	bl __msl_assertion_failed
_02250938:
	cmp r5, #0
	ldrnesb r0, [r5]
	cmpne r0, #0
	addeq sp, sp, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #0
	bne _0225096C
	ldr r1, _02250A6C ; =ov45_02256F50
	mov r2, r6
	mov r3, r5
	add r0, r7, #0x1c
	bl ov45_02252F74
	b _022509EC
_0225096C:
	cmp r4, #1
	bne _0225098C
	ldr r1, _02250A70 ; =ov45_02256F60
	mov r2, r6
	mov r3, r5
	add r0, r7, #0x1c
	bl ov45_02252F74
	b _022509EC
_0225098C:
	cmp r4, #2
	bne _022509AC
	ldr r1, _02250A74 ; =ov45_02256F78
	mov r2, r6
	mov r3, r5
	add r0, r7, #0x1c
	bl ov45_02252F74
	b _022509EC
_022509AC:
	cmp r4, #3
	bne _022509CC
	ldr r1, _02250A78 ; =ov45_02256F88
	mov r2, r6
	mov r3, r5
	add r0, r7, #0x1c
	bl ov45_02252F74
	b _022509EC
_022509CC:
	cmp r4, #4
	addne sp, sp, #0x20
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _02250A7C ; =ov45_02256F94
	mov r2, r6
	mov r3, r5
	add r0, r7, #0x1c
	bl ov45_02252F74
_022509EC:
	mov r0, r7
	mov r1, r6
	bl ov45_02247E98
	cmp r0, #0
	addeq sp, sp, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	add r1, r7, #0x36c
	str r1, [sp, #0x14]
	str r6, [sp, #0x10]
	str r5, [sp, #0x18]
	str r4, [sp, #0x1c]
	ldr r2, [r0, #0x2c]
	mov r1, #0
	str r2, [sp]
	stmib sp, {r1, r6}
	mov r1, #0x10
	str r1, [sp, #0xc]
	ldr r2, [r0]
	add r3, sp, #0x10
	mov r0, r7
	mov r1, #4
	bl ov45_02244D30
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02250A4C: .word ov45_02256BA0
_02250A50: .word ov45_02256B94
_02250A54: .word ov45_02256B6C
_02250A58: .word 0x000005FC
_02250A5C: .word ov45_02256E9C
_02250A60: .word 0x000005FF
_02250A64: .word ov45_02256EAC
_02250A68: .word ov45_02256ED8
_02250A6C: .word ov45_02256F50
_02250A70: .word ov45_02256F60
_02250A74: .word ov45_02256F78
_02250A78: .word ov45_02256F88
_02250A7C: .word ov45_02256F94
	arm_func_end ov45_0225089C

	arm_func_start ov45_02250A80
ov45_02250A80: ; 0x02250A80
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x40
	movs r6, r0
	mov r5, r1
	mov r4, r2
	bne _02250AAC
	ldr r0, _02250C50 ; =ov45_02256BA0
	ldr r1, _02250C54 ; =ov45_02256B94
	ldr r2, _02250C58 ; =ov45_02256ACC
	ldr r3, _02250C5C ; =0x0000067F
	bl __msl_assertion_failed
_02250AAC:
	cmp r6, #0
	ldrne r0, [r6]
	cmpne r0, #0
	addeq sp, sp, #0x40
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r5, #0
	bne _02250ADC
	ldr r0, _02250C60 ; =ov45_02256E9C
	ldr r1, _02250C54 ; =ov45_02256B94
	ldr r2, _02250C58 ; =ov45_02256ACC
	ldr r3, _02250C64 ; =0x00000682
	bl __msl_assertion_failed
_02250ADC:
	ldrsb r0, [r5]
	cmp r0, #0
	bne _02250AFC
	ldr r0, _02250C68 ; =ov45_02256EAC
	ldr r1, _02250C54 ; =ov45_02256B94
	ldr r2, _02250C58 ; =ov45_02256ACC
	ldr r3, _02250C64 ; =0x00000682
	bl __msl_assertion_failed
_02250AFC:
	cmp r4, #0
	bne _02250B18
	ldr r0, _02250C6C ; =ov45_02256FB4
	ldr r1, _02250C54 ; =ov45_02256B94
	ldr r2, _02250C58 ; =ov45_02256ACC
	ldr r3, _02250C70 ; =0x00000683
	bl __msl_assertion_failed
_02250B18:
	ldr r3, _02250C74 ; =ov45_02256FC4
	add ip, sp, #0
	mov r2, #8
_02250B24:
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	add r3, r3, #2
	strb r1, [ip]
	strb r0, [ip, #1]
	add ip, ip, #2
	subs r2, r2, #1
	bne _02250B24
	ldrb r0, [r3]
	strb r0, [ip]
	ldr r0, [r4]
	cmp r0, #0
	movne r0, #0x2b
	strneb r0, [sp]
	moveq r0, #0x2d
	streqb r0, [sp]
	ldr r0, [r4, #4]
	cmp r0, #0
	movne r0, #0x2b
	strneb r0, [sp, #2]
	moveq r0, #0x2d
	streqb r0, [sp, #2]
	ldr r0, [r4, #8]
	cmp r0, #0
	movne r0, #0x2b
	strneb r0, [sp, #4]
	moveq r0, #0x2d
	streqb r0, [sp, #4]
	ldr r0, [r4, #0xc]
	cmp r0, #0
	movne r0, #0x2b
	strneb r0, [sp, #6]
	moveq r0, #0x2d
	streqb r0, [sp, #6]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	movne r0, #0x2b
	strneb r0, [sp, #8]
	moveq r0, #0x2d
	streqb r0, [sp, #8]
	ldr r0, [r4, #0x14]
	cmp r0, #0
	movne r0, #0x2b
	strneb r0, [sp, #0xa]
	moveq r0, #0x2d
	streqb r0, [sp, #0xa]
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	movgt r0, #0x2b
	strgtb r0, [sp, #0xc]
	movle r0, #0x2d
	strleb r0, [sp, #0xc]
	ldr r0, [r4, #0x18]
	cmp r0, #0
	movne r0, #0x2b
	strneb r0, [sp, #0xe]
	moveq r0, #0x2d
	streqb r0, [sp, #0xe]
	ldr r4, [r4, #0x1c]
	cmp r4, #0
	ble _02250C34
	add r0, sp, #0
	bl strlen
	add r3, sp, #0
	ldr r1, _02250C78 ; =ov45_02256FD8
	mov r2, r4
	add r0, r3, r0
	bl sprintf
_02250C34:
	ldr r1, _02250C7C ; =ov45_02256FDC
	add r3, sp, #0
	mov r2, r5
	add r0, r6, #0x1c
	bl ov45_02252F74
	add sp, sp, #0x40
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02250C50: .word ov45_02256BA0
_02250C54: .word ov45_02256B94
_02250C58: .word ov45_02256ACC
_02250C5C: .word 0x0000067F
_02250C60: .word ov45_02256E9C
_02250C64: .word 0x00000682
_02250C68: .word ov45_02256EAC
_02250C6C: .word ov45_02256FB4
_02250C70: .word 0x00000683
_02250C74: .word ov45_02256FC4
_02250C78: .word ov45_02256FD8
_02250C7C: .word ov45_02256FDC
	arm_func_end ov45_02250A80

	arm_func_start ov45_02250C80
ov45_02250C80: ; 0x02250C80
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x3c
	movs r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bne _02250CB0
	ldr r0, _02250E44 ; =ov45_02256BA0
	ldr r1, _02250E48 ; =ov45_02256B94
	ldr r2, _02250E4C ; =ov45_02256AE0
	ldr r3, _02250E50 ; =0x000006C2
	bl __msl_assertion_failed
_02250CB0:
	cmp r8, #0
	ldrne r0, [r8]
	cmpne r0, #0
	addeq sp, sp, #0x3c
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	cmp r7, #0
	bne _02250CE0
	ldr r0, _02250E54 ; =ov45_02256E9C
	ldr r1, _02250E48 ; =ov45_02256B94
	ldr r2, _02250E4C ; =ov45_02256AE0
	ldr r3, _02250E58 ; =0x000006C5
	bl __msl_assertion_failed
_02250CE0:
	ldrsb r0, [r7]
	cmp r0, #0
	bne _02250D00
	ldr r0, _02250E5C ; =ov45_02256EAC
	ldr r1, _02250E48 ; =ov45_02256B94
	ldr r2, _02250E4C ; =ov45_02256AE0
	ldr r3, _02250E58 ; =0x000006C5
	bl __msl_assertion_failed
_02250D00:
	cmp r6, #0
	bne _02250D1C
	ldr r0, _02250E60 ; =ov45_02256FA0
	ldr r1, _02250E48 ; =ov45_02256B94
	ldr r2, _02250E4C ; =ov45_02256AE0
	ldr r3, _02250E64 ; =0x000006C6
	bl __msl_assertion_failed
_02250D1C:
	mov r0, r8
	mov r1, r7
	bl ov45_02248238
	cmp r0, #0
	beq _02250DD8
	add r2, sp, #0x1c
	mov r0, r8
	mov r1, r7
	bl ov45_02248288
	cmp r0, #0
	beq _02250DD8
	mov r0, r8
	bl ov45_0224A5E4
	add r1, sp, #0x1c
	mov r2, #1
	str r2, [sp, #0x10]
	str r1, [sp, #0x18]
	str r7, [sp, #0x14]
	mov r4, r0
	str r5, [sp]
	str r4, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	mov r5, #0xc
	add r3, sp, #0x10
	mov r0, r8
	mov r2, r6
	mov r1, #0x11
	str r5, [sp, #0xc]
	bl ov45_02244D30
	ldr r0, [sp, #0x58]
	cmp r0, #0
	addeq sp, sp, #0x3c
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r5, #0xa
_02250DA8:
	mov r0, r8
	mov r1, r4
	bl ov45_0224F770
	mov r0, r5
	bl ov00_021FF3C0
	mov r0, r8
	mov r1, r4
	bl ov45_0224F660
	cmp r0, #0
	bne _02250DA8
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_02250DD8:
	ldr r1, _02250E68 ; =ov45_02256FE8
	mov r2, r7
	add r0, r8, #0x1c
	bl ov45_02252F74
	mov r0, r8
	mov r1, r7
	mov r2, r6
	mov r3, r5
	bl ov45_0224A9F8
	ldr r1, [sp, #0x58]
	mov r5, r0
	cmp r1, #0
	addeq sp, sp, #0x3c
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, pc}
	mov r4, #0xa
_02250E14:
	mov r0, r8
	mov r1, r5
	bl ov45_0224F770
	mov r0, r4
	bl ov00_021FF3C0
	mov r0, r8
	mov r1, r5
	bl ov45_0224F660
	cmp r0, #0
	bne _02250E14
	add sp, sp, #0x3c
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02250E44: .word ov45_02256BA0
_02250E48: .word ov45_02256B94
_02250E4C: .word ov45_02256AE0
_02250E50: .word 0x000006C2
_02250E54: .word ov45_02256E9C
_02250E58: .word 0x000006C5
_02250E5C: .word ov45_02256EAC
_02250E60: .word ov45_02256FA0
_02250E64: .word 0x000006C6
_02250E68: .word ov45_02256FE8
	arm_func_end ov45_02250C80

	arm_func_start ov45_02250E6C
ov45_02250E6C: ; 0x02250E6C
	stmdb sp!, {r4, r5, r6, lr}
	movs r6, r0
	mov r5, r1
	mov r4, r2
	bne _02250E94
	ldr r0, _02250F30 ; =ov45_02256BA0
	ldr r1, _02250F34 ; =ov45_02256B94
	ldr r2, _02250F38 ; =ov45_02256AF4
	ldr r3, _02250F3C ; =0x0000074E
	bl __msl_assertion_failed
_02250E94:
	cmp r6, #0
	ldrne r0, [r6]
	cmpne r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	cmp r5, #0
	bne _02250EC0
	ldr r0, _02250F40 ; =ov45_02256E9C
	ldr r1, _02250F34 ; =ov45_02256B94
	ldr r2, _02250F38 ; =ov45_02256AF4
	ldr r3, _02250F44 ; =0x00000751
	bl __msl_assertion_failed
_02250EC0:
	ldrsb r0, [r5]
	cmp r0, #0
	bne _02250EE0
	ldr r0, _02250F48 ; =ov45_02256EAC
	ldr r1, _02250F34 ; =ov45_02256B94
	ldr r2, _02250F38 ; =ov45_02256AF4
	ldr r3, _02250F44 ; =0x00000751
	bl __msl_assertion_failed
_02250EE0:
	cmp r4, #0
	bge _02250EFC
	ldr r0, _02250F4C ; =ov45_02256FF0
	ldr r1, _02250F34 ; =ov45_02256B94
	ldr r2, _02250F38 ; =ov45_02256AF4
	ldr r3, _02250F50 ; =0x00000752
	bl __msl_assertion_failed
_02250EFC:
	cmp r4, #0
	beq _02250F1C
	ldr r1, _02250F54 ; =ov45_02256FFC
	mov r2, r5
	mov r3, r4
	add r0, r6, #0x1c
	bl ov45_02252F74
	ldmia sp!, {r4, r5, r6, pc}
_02250F1C:
	ldr r1, _02250F58 ; =ov45_0225700C
	mov r2, r5
	add r0, r6, #0x1c
	bl ov45_02252F74
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02250F30: .word ov45_02256BA0
_02250F34: .word ov45_02256B94
_02250F38: .word ov45_02256AF4
_02250F3C: .word 0x0000074E
_02250F40: .word ov45_02256E9C
_02250F44: .word 0x00000751
_02250F48: .word ov45_02256EAC
_02250F4C: .word ov45_02256FF0
_02250F50: .word 0x00000752
_02250F54: .word ov45_02256FFC
_02250F58: .word ov45_0225700C
	arm_func_end ov45_02250E6C

	arm_func_start ov45_02250F5C
ov45_02250F5C: ; 0x02250F5C
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _02250F80
	ldr r0, _02251008 ; =ov45_02256BA0
	ldr r1, _0225100C ; =ov45_02256B94
	ldr r2, _02251010 ; =ov45_02256B54
	ldr r3, _02251014 ; =0x000007D6
	bl __msl_assertion_failed
_02250F80:
	ldr r0, [r5]
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	bne _02250FAC
	ldr r0, _02251018 ; =ov45_02256E9C
	ldr r1, _0225100C ; =ov45_02256B94
	ldr r2, _02251010 ; =ov45_02256B54
	ldr r3, _0225101C ; =0x000007DA
	bl __msl_assertion_failed
_02250FAC:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _02250FCC
	ldr r0, _02251020 ; =ov45_02256EAC
	ldr r1, _0225100C ; =ov45_02256B94
	ldr r2, _02251010 ; =ov45_02256B54
	ldr r3, _0225101C ; =0x000007DA
	bl __msl_assertion_failed
_02250FCC:
	cmp r4, #0
	ldrnesb r0, [r4]
	cmpne r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl ov45_02248238
	cmp r0, #0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl ov45_022487BC
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02251008: .word ov45_02256BA0
_0225100C: .word ov45_02256B94
_02251010: .word ov45_02256B54
_02251014: .word 0x000007D6
_02251018: .word ov45_02256E9C
_0225101C: .word 0x000007DA
_02251020: .word ov45_02256EAC
	arm_func_end ov45_02250F5C

	arm_func_start ov45_02251024
ov45_02251024: ; 0x02251024
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _02251048
	ldr r0, _022510B8 ; =ov45_02256BA0
	ldr r1, _022510BC ; =ov45_02256B94
	ldr r2, _022510C0 ; =ov45_022569D8
	ldr r3, _022510C4 ; =0x000007F4
	bl __msl_assertion_failed
_02251048:
	ldr r0, [r5]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	bne _02251074
	ldr r0, _022510C8 ; =ov45_02256E9C
	ldr r1, _022510BC ; =ov45_02256B94
	ldr r2, _022510C0 ; =ov45_022569D8
	ldr r3, _022510CC ; =0x000007F8
	bl __msl_assertion_failed
_02251074:
	ldrsb r0, [r4]
	cmp r0, #0
	bne _02251094
	ldr r0, _022510D0 ; =ov45_02256EAC
	ldr r1, _022510BC ; =ov45_02256B94
	ldr r2, _022510C0 ; =ov45_022569D8
	ldr r3, _022510CC ; =0x000007F8
	bl __msl_assertion_failed
_02251094:
	cmp r4, #0
	ldrnesb r0, [r4]
	cmpne r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl ov45_02248238
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022510B8: .word ov45_02256BA0
_022510BC: .word ov45_02256B94
_022510C0: .word ov45_022569D8
_022510C4: .word 0x000007F4
_022510C8: .word ov45_02256E9C
_022510CC: .word 0x000007F8
_022510D0: .word ov45_02256EAC
	arm_func_end ov45_02251024

	arm_func_start ov45_022510D4
ov45_022510D4: ; 0x022510D4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0xc
	movs r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bne _02251104
	ldr r0, _022511D4 ; =ov45_02256BA0
	ldr r1, _022511D8 ; =ov45_02256B94
	ldr r2, _022511DC ; =ov45_02256A90
	ldr r3, _022511E0 ; =0x00000812
	bl __msl_assertion_failed
_02251104:
	cmp r7, #0
	bne _02251120
	ldr r0, _022511E4 ; =ov45_02256E9C
	ldr r1, _022511D8 ; =ov45_02256B94
	ldr r2, _022511DC ; =ov45_02256A90
	ldr r3, _022511E8 ; =0x00000816
	bl __msl_assertion_failed
_02251120:
	ldrsb r0, [r7]
	cmp r0, #0
	bne _02251140
	ldr r0, _022511EC ; =ov45_02256EAC
	ldr r1, _022511D8 ; =ov45_02256B94
	ldr r2, _022511DC ; =ov45_02256A90
	ldr r3, _022511E8 ; =0x00000816
	bl __msl_assertion_failed
_02251140:
	cmp r6, #0
	bge _0225115C
	ldr r0, _022511F0 ; =ov45_02257018
	ldr r1, _022511D8 ; =ov45_02256B94
	ldr r2, _022511DC ; =ov45_02256A90
	ldr r3, _022511F4 ; =0x00000817
	bl __msl_assertion_failed
_0225115C:
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bne _0225117C
	ldr r0, _022511F8 ; =ov45_02257028
	ldr r1, _022511D8 ; =ov45_02256B94
	ldr r2, _022511DC ; =ov45_02256A90
	ldr r3, _022511FC ; =0x00000827
	bl __msl_assertion_failed
_0225117C:
	ldr r4, [sp, #0x2c]
	ldr r0, [r4]
	cmp r0, #0
	bne _022511A0
	ldr r0, _02251200 ; =ov45_02257038
	ldr r1, _022511D8 ; =ov45_02256B94
	ldr r2, _022511DC ; =ov45_02256A90
	ldr r3, _02251204 ; =0x0000082C
	bl __msl_assertion_failed
_022511A0:
	ldr r0, [sp, #0x28]
	str r5, [sp]
	str r0, [sp, #4]
	ldr r1, [r4, #4]
	mov r0, r8
	str r1, [sp, #8]
	ldr r4, [r4]
	mov r2, r7
	mov r3, r6
	mov r1, #1
	blx r4
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_022511D4: .word ov45_02256BA0
_022511D8: .word ov45_02256B94
_022511DC: .word ov45_02256A90
_022511E0: .word 0x00000812
_022511E4: .word ov45_02256E9C
_022511E8: .word 0x00000816
_022511EC: .word ov45_02256EAC
_022511F0: .word ov45_02257018
_022511F4: .word 0x00000817
_022511F8: .word ov45_02257028
_022511FC: .word 0x00000827
_02251200: .word ov45_02257038
_02251204: .word 0x0000082C
	arm_func_end ov45_022510D4

	arm_func_start ov45_02251208
ov45_02251208: ; 0x02251208
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #8
	movs r4, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bne _02251238
	ldr r0, _0225132C ; =ov45_02256BA0
	ldr r1, _02251330 ; =ov45_02256B94
	ldr r2, _02251334 ; =ov45_022569F8
	ldr r3, _02251338 ; =0x00000847
	bl __msl_assertion_failed
_02251238:
	cmp r4, #0
	ldrne r0, [r4]
	cmpne r0, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	bne _02251268
	ldr r0, _0225133C ; =ov45_02256FA0
	ldr r1, _02251330 ; =ov45_02256B94
	ldr r2, _02251334 ; =ov45_022569F8
	ldr r3, _02251340 ; =0x0000084B
	bl __msl_assertion_failed
_02251268:
	cmp r7, #0
	ldreq r7, _02251344 ; =ov45_02256C2C
	ldrsb r0, [r7]
	cmp r0, #0
	beq _022512B4
	mov r0, r4
	mov r1, r7
	bl ov45_02248238
	cmp r0, #0
	beq _022512B4
	ldr r2, _02251348 ; =ov45_022510D4
	add r3, sp, #0
	mov r0, r4
	mov r1, r7
	str r6, [sp]
	str r5, [sp, #4]
	bl ov45_022480EC
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_022512B4:
	ldr r1, _0225134C ; =ov45_02257050
	mov r2, r7
	add r0, r4, #0x1c
	bl ov45_02252F74
	ldrsb r0, [r7]
	mov r2, r6
	mov r3, r5
	cmp r0, #0
	moveq r7, #0
	mov r0, r4
	mov r1, r7
	bl ov45_0224A978
	ldr r1, [sp, #0x20]
	mov r6, r0
	cmp r1, #0
	addeq sp, sp, #8
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	mov r5, #0xa
_022512FC:
	mov r0, r4
	mov r1, r6
	bl ov45_0224F770
	mov r0, r5
	bl ov00_021FF3C0
	mov r0, r4
	mov r1, r6
	bl ov45_0224F660
	cmp r0, #0
	bne _022512FC
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225132C: .word ov45_02256BA0
_02251330: .word ov45_02256B94
_02251334: .word ov45_022569F8
_02251338: .word 0x00000847
_0225133C: .word ov45_02256FA0
_02251340: .word 0x0000084B
_02251344: .word ov45_02256C2C
_02251348: .word ov45_022510D4
_0225134C: .word ov45_02257050
	arm_func_end ov45_02251208

	arm_func_start ov45_02251350
ov45_02251350: ; 0x02251350
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	movs r7, r0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	bne _0225137C
	ldr r0, _022514B8 ; =ov45_02256BA0
	ldr r1, _022514BC ; =ov45_02256B94
	ldr r2, _022514C0 ; =ov45_02256B0C
	ldr r3, _022514C4 ; =0x00000889
	bl __msl_assertion_failed
_0225137C:
	cmp r7, #0
	ldrne r0, [r7]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r6, #0
	bne _022513A8
	ldr r0, _022514C8 ; =ov45_0225705C
	ldr r1, _022514BC ; =ov45_02256B94
	ldr r2, _022514C0 ; =ov45_02256B0C
	ldr r3, _022514CC ; =0x0000088C
	bl __msl_assertion_failed
_022513A8:
	ldrsb r0, [r6]
	cmp r0, #0
	bne _022513C8
	ldr r0, _022514D0 ; =ov45_0225706C
	ldr r1, _022514BC ; =ov45_02256B94
	ldr r2, _022514C0 ; =ov45_02256B0C
	ldr r3, _022514CC ; =0x0000088C
	bl __msl_assertion_failed
_022513C8:
	mov r0, r6
	bl strlen
	cmp r0, #0x80
	blo _022513EC
	ldr r0, _022514D4 ; =ov45_0225707C
	ldr r1, _022514BC ; =ov45_02256B94
	ldr r2, _022514C0 ; =ov45_02256B0C
	ldr r3, _022514CC ; =0x0000088C
	bl __msl_assertion_failed
_022513EC:
	cmp r4, #4
	bls _02251408
	ldr r0, _022514D8 ; =ov45_02256ED8
	ldr r1, _022514BC ; =ov45_02256B94
	ldr r2, _022514C0 ; =ov45_02256B0C
	ldr r3, _022514DC ; =0x0000088D
	bl __msl_assertion_failed
_02251408:
	cmp r5, #0
	ldrnesb r0, [r5]
	cmpne r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	cmp r4, #0
	bne _02251438
	ldr r1, _022514E0 ; =ov45_02256F50
	mov r2, r6
	mov r3, r5
	add r0, r7, #0x1c
	bl ov45_02252F74
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02251438:
	cmp r4, #1
	bne _02251458
	ldr r1, _022514E4 ; =ov45_02256F60
	mov r2, r6
	mov r3, r5
	add r0, r7, #0x1c
	bl ov45_02252F74
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02251458:
	cmp r4, #2
	bne _02251478
	ldr r1, _022514E8 ; =ov45_02256F78
	mov r2, r6
	mov r3, r5
	add r0, r7, #0x1c
	bl ov45_02252F74
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02251478:
	cmp r4, #3
	bne _02251498
	ldr r1, _022514EC ; =ov45_02256F88
	mov r2, r6
	mov r3, r5
	add r0, r7, #0x1c
	bl ov45_02252F74
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02251498:
	cmp r4, #4
	ldmneia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r1, _022514F0 ; =ov45_02256F94
	mov r2, r6
	mov r3, r5
	add r0, r7, #0x1c
	bl ov45_02252F74
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022514B8: .word ov45_02256BA0
_022514BC: .word ov45_02256B94
_022514C0: .word ov45_02256B0C
_022514C4: .word 0x00000889
_022514C8: .word ov45_0225705C
_022514CC: .word 0x0000088C
_022514D0: .word ov45_0225706C
_022514D4: .word ov45_0225707C
_022514D8: .word ov45_02256ED8
_022514DC: .word 0x0000088D
_022514E0: .word ov45_02256F50
_022514E4: .word ov45_02256F60
_022514E8: .word ov45_02256F78
_022514EC: .word ov45_02256F88
_022514F0: .word ov45_02256F94
	arm_func_end ov45_02251350

	arm_func_start ov45_022514F4
ov45_022514F4: ; 0x022514F4
	stmdb sp!, {r4, lr}
	ldr r3, _02251544 ; =ov45_022577F4
	ldr r0, _02251548 ; =ov45_022577F0
	ldr r2, [r3]
	ldr r1, _0225154C ; =ov45_0225709C
	add r4, r2, #1
	str r4, [r3]
	bl sprintf
	ldr ip, _02251544 ; =ov45_022577F4
	ldr r3, _02251550 ; =0x10624DD3
	ldr lr, [ip]
	mov r2, #0x3e8
	mov r0, lr, lsr #0x1f
	smull r1, r4, r3, lr
	add r4, r0, r4, asr #6
	smull r0, r1, r2, r4
	sub r4, lr, r0
	ldr r0, _02251548 ; =ov45_022577F0
	str r4, [ip]
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02251544: .word ov45_022577F4
_02251548: .word ov45_022577F0
_0225154C: .word ov45_0225709C
_02251550: .word 0x10624DD3
	arm_func_end ov45_022514F4

	arm_func_start ov45_02251554
ov45_02251554: ; 0x02251554
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x200
	movs sl, r0
	mov r5, r1
	mov r4, r2
	mov sb, r3
	ldr r8, [sp, #0x228]
	ldr r7, [sp, #0x22c]
	bne _0225158C
	ldr r0, _02251630 ; =ov45_02256BA0
	ldr r1, _02251634 ; =ov45_02256B94
	ldr r2, _02251638 ; =ov45_02256AB8
	ldr r3, _0225163C ; =0x00000AD7
	bl __msl_assertion_failed
_0225158C:
	cmp sl, #0
	ldrne r0, [sl]
	cmpne r0, #0
	addeq sp, sp, #0x200
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	cmp r4, #0
	ldrnesb r0, [r4]
	cmpne r0, #0
	add r0, sp, #0
	bne _022515C4
	ldr r1, _02251640 ; =ov45_022570C4
	mov r2, r5
	bl sprintf
	b _022515D4
_022515C4:
	ldr r1, _02251644 ; =ov45_022570D4
	mov r2, r5
	mov r3, r4
	bl sprintf
_022515D4:
	cmp sb, #0
	mov r6, #0
	ble _0225161C
	ldr fp, _02251648 ; =ov45_02256C2C
	add r4, sp, #0
_022515E8:
	ldr r5, [r7, r6, lsl #2]
	mov r0, r4
	cmp r5, #0
	moveq r5, fp
	bl strlen
	ldr r2, [r8, r6, lsl #2]
	ldr r1, _0225164C ; =ov45_02257094
	mov r3, r5
	add r0, r4, r0
	bl sprintf
	add r6, r6, #1
	cmp r6, sb
	blt _022515E8
_0225161C:
	add r1, sp, #0
	add r0, sl, #0x1c
	bl ov45_02252CB4
	add sp, sp, #0x200
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02251630: .word ov45_02256BA0
_02251634: .word ov45_02256B94
_02251638: .word ov45_02256AB8
_0225163C: .word 0x00000AD7
_02251640: .word ov45_022570C4
_02251644: .word ov45_022570D4
_02251648: .word ov45_02256C2C
_0225164C: .word ov45_02257094
	arm_func_end ov45_02251554

	arm_func_start ov45_02251650
ov45_02251650: ; 0x02251650
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x210
	str r0, [sp, #4]
	cmp r0, #0
	mov r0, #0
	mov r5, r1
	str r2, [sp, #8]
	mov r4, r3
	ldr sl, [sp, #0x238]
	ldr sb, [sp, #0x23c]
	str r0, [sp, #0xc]
	bne _02251694
	ldr r0, _022518B4 ; =ov45_02256BA0
	ldr r1, _022518B8 ; =ov45_02256B94
	ldr r2, _022518BC ; =ov45_02256A7C
	ldr r3, _022518C0 ; =0x00000B19
	bl __msl_assertion_failed
_02251694:
	cmp r5, #0
	ldrnesb r0, [r5]
	cmpne r0, #0
	bne _022516B8
	ldr r0, _022518C4 ; =ov45_022570E4
	ldr r1, _022518B8 ; =ov45_02256B94
	ldr r2, _022518BC ; =ov45_02256A7C
	ldr r3, _022518C8 ; =0x00000B1B
	bl __msl_assertion_failed
_022516B8:
	cmp r4, #0
	ldrnesb r0, [r4]
	cmpne r0, #0
	bne _022516DC
	ldr r0, _022518CC ; =ov45_022570A4
	ldr r1, _022518B8 ; =ov45_02256B94
	ldr r2, _022518BC ; =ov45_02256A7C
	ldr r3, _022518D0 ; =0x00000B1C
	bl __msl_assertion_failed
_022516DC:
	cmp sl, #0
	beq _02251700
	cmp sb, #0
	bne _02251700
	ldr r0, _022518D4 ; =ov45_022570FC
	ldr r1, _022518B8 ; =ov45_02256B94
	ldr r2, _022518BC ; =ov45_02256A7C
	ldr r3, _022518D8 ; =0x00000B1D
	bl __msl_assertion_failed
_02251700:
	ldr r0, [sp, #8]
	cmp r0, #0
	ldrnesb r0, [r0]
	cmpne r0, #0
	add r0, sp, #0x10
	bne _0225172C
	ldr r1, _022518DC ; =ov45_0225710C
	mov r2, r5
	mov r3, r4
	bl sprintf
	b _02251740
_0225172C:
	ldr r1, _022518E0 ; =ov45_02257124
	ldr r3, [sp, #8]
	mov r2, r5
	str r4, [sp]
	bl sprintf
_02251740:
	add r0, sp, #0x10
	bl strlen
	mov r7, r0
	cmp sl, #0
	mov r5, #0
	ble _02251810
	mov r4, #0x2f
	add fp, sp, #0x10
_02251760:
	ldr r6, [sb, r5, lsl #2]
	cmp r6, #0
	ldrnesb r0, [r6]
	cmpne r0, #0
	beq _02251804
	ldr r1, _022518E4 ; =ov45_0225713C
	mov r0, r6
	bl strcmp
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
	beq _02251804
	mov r0, r6
	bl strlen
	mov r6, r0
	add r0, r7, r6
	add r0, r0, #1
	cmp r0, #0x200
	bge _02251804
	mov r0, #0x5c
	strb r0, [fp, r7]
	add r7, r7, #1
	add r8, fp, r7
	ldr r1, [sb, r5, lsl #2]
	mov r0, r8
	mov r2, r6
	bl memcpy
	add r2, r7, r6
	mov r1, r7
	cmp r7, r2
	bge _022517F8
_022517DC:
	ldrsb r0, [r8]
	add r1, r1, #1
	cmp r0, #0x5c
	streqb r4, [r8]
	add r8, r8, #1
	cmp r1, r2
	blt _022517DC
_022517F8:
	add r7, r7, r6
	mov r0, #0
	strb r0, [fp, r7]
_02251804:
	add r5, r5, #1
	cmp r5, sl
	blt _02251760
_02251810:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02251860
	add r5, r7, #4
	cmp r5, #0x200
	bge _02251860
	ldr r3, _022518E8 ; =ov45_02257140
	add r4, sp, #0x10
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	ldrb r0, [r3, #2]
	strb r2, [r4, r7]
	add r2, r4, r7
	strb r1, [r2, #1]
	strb r0, [r2, #2]
	ldrb r1, [r3, #3]
	ldrb r0, [r3, #4]
	mov r7, r5
	strb r1, [r2, #3]
	strb r0, [r2, #4]
_02251860:
	cmp sl, #0
	bne _02251898
	ldr r0, [sp, #8]
	cmp r0, #0
	ldrnesb r0, [r0]
	cmpne r0, #0
	bne _02251898
	ldr r0, _022518EC ; =ov45_02256BC0
	add r2, sp, #0x10
	ldrb r1, [r0]
	ldrb r0, [r0, #1]
	add r3, r2, r7
	strb r1, [r2, r7]
	strb r0, [r3, #1]
_02251898:
	ldr r0, [sp, #4]
	add r1, sp, #0x10
	add r0, r0, #0x1c
	bl ov45_02252CB4
	ldr r0, [sp, #0xc]
	add sp, sp, #0x210
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_022518B4: .word ov45_02256BA0
_022518B8: .word ov45_02256B94
_022518BC: .word ov45_02256A7C
_022518C0: .word 0x00000B19
_022518C4: .word ov45_022570E4
_022518C8: .word 0x00000B1B
_022518CC: .word ov45_022570A4
_022518D0: .word 0x00000B1C
_022518D4: .word ov45_022570FC
_022518D8: .word 0x00000B1D
_022518DC: .word ov45_0225710C
_022518E0: .word ov45_02257124
_022518E4: .word ov45_0225713C
_022518E8: .word ov45_02257140
_022518EC: .word ov45_02256BC0
	arm_func_end ov45_02251650

	arm_func_start ov45_022518F0
ov45_022518F0: ; 0x022518F0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0x10
	movs sb, r0
	mov r5, r1
	mov r8, r2
	mov r7, r3
	ldr r6, [sp, #0x30]
	bne _02251924
	ldr r0, _02251A68 ; =ov45_02256BA0
	ldr r1, _02251A6C ; =ov45_02256B94
	ldr r2, _02251A70 ; =ov45_02256AA4
	ldr r3, _02251A74 ; =0x00000B6F
	bl __msl_assertion_failed
_02251924:
	cmp sb, #0
	ldrne r0, [sb]
	cmpne r0, #0
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	cmp r7, #0
	bge _02251954
	ldr r0, _02251A78 ; =ov45_022570B8
	ldr r1, _02251A6C ; =ov45_02256B94
	ldr r2, _02251A70 ; =ov45_02256AA4
	ldr r3, _02251A7C ; =0x00000B72
	bl __msl_assertion_failed
_02251954:
	cmp r7, #0
	beq _02251978
	cmp r6, #0
	bne _02251978
	ldr r0, _02251A80 ; =ov45_022570FC
	ldr r1, _02251A6C ; =ov45_02256B94
	ldr r2, _02251A70 ; =ov45_02256AA4
	ldr r3, _02251A84 ; =0x00000B73
	bl __msl_assertion_failed
_02251978:
	bl ov45_022514F4
	mov r4, r0
	str r7, [sp]
	mov r0, sb
	mov r1, r5
	mov r2, r8
	mov r3, r4
	str r6, [sp, #4]
	bl ov45_02251650
	mov r5, r0
	cmp r8, #0
	ldrnesb r0, [r8]
	cmpne r0, #0
	bne _022519DC
	ldr r0, [sp, #0x34]
	str r5, [sp]
	str r0, [sp, #4]
	ldr r5, [sp, #0x38]
	mov r0, sb
	mov r1, r4
	mov r2, r7
	mov r3, r6
	str r5, [sp, #8]
	bl ov45_0224ABA0
	b _02251A20
_022519DC:
	ldr r1, _02251A88 ; =ov45_02256BC0
	mov r0, r8
	bl strcmp
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	ldr r0, [sp, #0x34]
	ldr r5, [sp, #0x38]
	str r0, [sp, #8]
	mov r0, sb
	mov r1, r4
	mov r2, r7
	mov r3, r6
	str r5, [sp, #0xc]
	bl ov45_0224AA2C
_02251A20:
	mov r5, r0
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r4, #0xa
_02251A38:
	mov r0, sb
	mov r1, r5
	bl ov45_0224F770
	mov r0, r4
	bl ov00_021FF3C0
	mov r0, sb
	mov r1, r5
	bl ov45_0224F660
	cmp r0, #0
	bne _02251A38
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_02251A68: .word ov45_02256BA0
_02251A6C: .word ov45_02256B94
_02251A70: .word ov45_02256AA4
_02251A74: .word 0x00000B6F
_02251A78: .word ov45_022570B8
_02251A7C: .word 0x00000B72
_02251A80: .word ov45_022570FC
_02251A84: .word 0x00000B73
_02251A88: .word ov45_02256BC0
	arm_func_end ov45_022518F0

	arm_func_start ov45_02251A8C
ov45_02251A8C: ; 0x02251A8C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	bl strlen
	cmp r0, #0x15
	movhs r0, #6
	ldmhsia sp!, {r3, r4, r5, pc}
	cmp r5, #0
	ldrnesb r0, [r5]
	cmpne r0, #0
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #0x40
	cmpne r0, #0x23
	cmpne r0, #0x2b
	cmpne r0, #0x3a
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r0, #0
	beq _02251B00
	ldr r4, _02251B08 ; =ov45_02256E04
_02251ADC:
	ldrsb r1, [r5], #1
	mov r0, r4
	bl strchr
	cmp r0, #0
	moveq r0, #2
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsb r0, [r5]
	cmp r0, #0
	bne _02251ADC
_02251B00:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02251B08: .word ov45_02256E04
	arm_func_end ov45_02251A8C

	arm_func_start ov45_02251B0C
ov45_02251B0C: ; 0x02251B0C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x20
	movs r4, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bne _02251B3C
	ldr r0, _02251BD0 ; =ov45_02256BA0
	ldr r1, _02251BD4 ; =ov45_02256B94
	ldr r2, _02251BD8 ; =ov45_022569C0
	ldr r3, _02251BDC ; =0x00000BC9
	bl __msl_assertion_failed
_02251B3C:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02251BA0
	add r3, sp, #0x10
	mov r2, #0
	str r2, [r3]
	str r2, [r3, #4]
	str r2, [r3, #8]
	ldr r0, [sp, #0x38]
	str r2, [r3, #0xc]
	str r0, [sp, #0x1c]
	str r7, [sp, #0x10]
	str r6, [sp, #0x14]
	str r5, [sp, #0x18]
	ldr r1, [r4, #0x18]
	mov r0, #0x10
	stmia sp, {r1, r2}
	str r2, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r4, #0xc]
	mov r0, r4
	mov r1, #0x19
	bl ov45_02244D30
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_02251BA0:
	mov r1, #0
	str r1, [r4, #4]
	ldr ip, [r4, #0x14]
	cmp ip, #0
	addeq sp, sp, #0x20
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldr r3, [r4, #0x18]
	mov r0, r4
	mov r2, #1
	blx ip
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02251BD0: .word ov45_02256BA0
_02251BD4: .word ov45_02256B94
_02251BD8: .word ov45_022569C0
_02251BDC: .word 0x00000BC9
	arm_func_end ov45_02251B0C

	arm_func_start ov45_02251BE0
ov45_02251BE0: ; 0x02251BE0
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02251C00
	ldr r0, _02251C34 ; =ov45_02257248
	ldr r1, _02251C38 ; =ov45_02257258
	ldr r2, _02251C3C ; =ov45_02257174
	mov r3, #0x5f
	bl __msl_assertion_failed
_02251C00:
	mov r0, #0
	mov r1, #0x2000
	str r0, [r4, #4]
	add r0, r1, #1
	str r1, [r4, #8]
	bl ov00_021EC3A8
	cmp r0, #0
	str r0, [r4]
	moveq r0, #0
	movne r1, #0
	strneb r1, [r0]
	movne r0, #1
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02251C34: .word ov45_02257248
_02251C38: .word ov45_02257258
_02251C3C: .word ov45_02257174
	arm_func_end ov45_02251BE0

	arm_func_start ov45_02251C40
ov45_02251C40: ; 0x02251C40
	ldr ip, _02251C4C ; =ov00_021EC3D8
	ldr r0, [r0]
	bx ip
	.balign 4, 0
_02251C4C: .word ov00_021EC3D8
	arm_func_end ov45_02251C40

	arm_func_start ov45_02251C50
ov45_02251C50: ; 0x02251C50
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _02251C74
	ldr r0, _02251D8C ; =ov45_02257268
	ldr r1, _02251D90 ; =ov45_02257258
	ldr r2, _02251D94 ; =ov45_022571E4
	mov r3, #0x78
	bl __msl_assertion_failed
_02251C74:
	ldr r0, [r5, #8]
	cmp r0, #0
	bge _02251C94
	ldr r0, _02251D98 ; =ov45_0225727C
	ldr r1, _02251D90 ; =ov45_02257258
	ldr r2, _02251D94 ; =ov45_022571E4
	mov r3, #0x78
	bl __msl_assertion_failed
_02251C94:
	ldr r0, [r5, #8]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _02251CBC
	ldr r0, _02251D9C ; =ov45_02257290
	ldr r1, _02251D90 ; =ov45_02257258
	ldr r2, _02251D94 ; =ov45_022571E4
	mov r3, #0x78
	bl __msl_assertion_failed
_02251CBC:
	ldr r0, [r5, #4]
	cmp r0, #0
	bge _02251CDC
	ldr r0, _02251DA0 ; =ov45_022572B4
	ldr r1, _02251D90 ; =ov45_02257258
	ldr r2, _02251D94 ; =ov45_022571E4
	mov r3, #0x78
	bl __msl_assertion_failed
_02251CDC:
	ldr r1, [r5, #4]
	ldr r0, [r5, #8]
	cmp r1, r0
	ble _02251D00
	ldr r0, _02251DA4 ; =ov45_022572CC
	ldr r1, _02251D90 ; =ov45_02257258
	ldr r2, _02251D94 ; =ov45_022571E4
	mov r3, #0x78
	bl __msl_assertion_failed
_02251D00:
	cmp r4, #0
	bge _02251D1C
	ldr r0, _02251DA8 ; =ov45_022572F0
	ldr r1, _02251D90 ; =ov45_02257258
	ldr r2, _02251D94 ; =ov45_022571E4
	mov r3, #0x79
	bl __msl_assertion_failed
_02251D1C:
	ldr r0, _02251DAC ; =0x00007FFF
	cmp r4, r0
	ble _02251D3C
	ldr r0, _02251DB0 ; =ov45_022572FC
	ldr r1, _02251D90 ; =ov45_02257258
	ldr r2, _02251D94 ; =ov45_022571E4
	mov r3, #0x7a
	bl __msl_assertion_failed
_02251D3C:
	ldr r1, [r5, #4]
	ldr r0, [r5, #8]
	add r1, r1, r4
	cmp r1, r0
	movle r0, #1
	ldmleia sp!, {r3, r4, r5, pc}
	add r2, r1, #0x2000
	mov r1, r2, lsr #0x1f
	rsb r0, r1, r2, lsl #19
	add r0, r1, r0, ror #19
	sub r4, r2, r0
	ldr r0, [r5]
	add r1, r4, #1
	bl ov00_021EC3BC
	cmp r0, #0
	moveq r0, #0
	strne r0, [r5]
	strne r4, [r5, #8]
	movne r0, #1
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02251D8C: .word ov45_02257268
_02251D90: .word ov45_02257258
_02251D94: .word ov45_022571E4
_02251D98: .word ov45_0225727C
_02251D9C: .word ov45_02257290
_02251DA0: .word ov45_022572B4
_02251DA4: .word ov45_022572CC
_02251DA8: .word ov45_022572F0
_02251DAC: .word 0x00007FFF
_02251DB0: .word ov45_022572FC
	arm_func_end ov45_02251C50

	arm_func_start ov45_02251DB4
ov45_02251DB4: ; 0x02251DB4
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mov r4, r1
	bne _02251DD8
	ldr r0, _02251ECC ; =ov45_02257268
	ldr r1, _02251ED0 ; =ov45_02257258
	ldr r2, _02251ED4 ; =ov45_022571F8
	mov r3, #0x97
	bl __msl_assertion_failed
_02251DD8:
	ldr r0, [r5, #8]
	cmp r0, #0
	bge _02251DF8
	ldr r0, _02251ED8 ; =ov45_0225727C
	ldr r1, _02251ED0 ; =ov45_02257258
	ldr r2, _02251ED4 ; =ov45_022571F8
	mov r3, #0x97
	bl __msl_assertion_failed
_02251DF8:
	ldr r0, [r5, #8]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _02251E20
	ldr r0, _02251EDC ; =ov45_02257290
	ldr r1, _02251ED0 ; =ov45_02257258
	ldr r2, _02251ED4 ; =ov45_022571F8
	mov r3, #0x97
	bl __msl_assertion_failed
_02251E20:
	ldr r0, [r5, #4]
	cmp r0, #0
	bge _02251E40
	ldr r0, _02251EE0 ; =ov45_022572B4
	ldr r1, _02251ED0 ; =ov45_02257258
	ldr r2, _02251ED4 ; =ov45_022571F8
	mov r3, #0x97
	bl __msl_assertion_failed
_02251E40:
	ldr r1, [r5, #4]
	ldr r0, [r5, #8]
	cmp r1, r0
	ble _02251E64
	ldr r0, _02251EE4 ; =ov45_022572CC
	ldr r1, _02251ED0 ; =ov45_02257258
	ldr r2, _02251ED4 ; =ov45_022571F8
	mov r3, #0x97
	bl __msl_assertion_failed
_02251E64:
	cmp r4, #0
	bge _02251E80
	ldr r0, _02251EE8 ; =ov45_022572F0
	ldr r1, _02251ED0 ; =ov45_02257258
	ldr r2, _02251ED4 ; =ov45_022571F8
	mov r3, #0x98
	bl __msl_assertion_failed
_02251E80:
	ldr r0, [r5, #4]
	cmp r4, r0
	ble _02251EA0
	ldr r0, _02251EEC ; =ov45_0225730C
	ldr r1, _02251ED0 ; =ov45_02257258
	ldr r2, _02251ED4 ; =ov45_022571F8
	mov r3, #0x99
	bl __msl_assertion_failed
_02251EA0:
	ldr r0, [r5, #4]
	sub r2, r0, r4
	str r2, [r5, #4]
	ldr r0, [r5]
	add r1, r0, r4
	bl memmove
	ldr r1, [r5]
	ldr r0, [r5, #4]
	mov r2, #0
	strb r2, [r1, r0]
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_02251ECC: .word ov45_02257268
_02251ED0: .word ov45_02257258
_02251ED4: .word ov45_022571F8
_02251ED8: .word ov45_0225727C
_02251EDC: .word ov45_02257290
_02251EE0: .word ov45_022572B4
_02251EE4: .word ov45_022572CC
_02251EE8: .word ov45_022572F0
_02251EEC: .word ov45_0225730C
	arm_func_end ov45_02251DB4

	arm_func_start ov45_02251EF0
ov45_02251EF0: ; 0x02251EF0
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02251F10
	ldr r0, _02251F60 ; =ov45_02257324
	ldr r1, _02251F64 ; =ov45_02257258
	ldr r2, _02251F68 ; =ov45_02257194
	mov r3, #0xb1
	bl __msl_assertion_failed
_02251F10:
	mov r0, r4
	mov r1, #0
	mov r2, #0x350
	bl memset
	mvn r1, #0
	add r0, r4, #0x108
	str r1, [r4]
	bl ov45_02251BE0
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	add r0, r4, #0x114
	bl ov45_02251BE0
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r4, pc}
	add r0, r4, #0x108
	bl ov45_02251C40
	mov r0, #0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02251F60: .word ov45_02257324
_02251F64: .word ov45_02257258
_02251F68: .word ov45_02257194
	arm_func_end ov45_02251EF0

	arm_func_start ov45_02251F6C
ov45_02251F6C: ; 0x02251F6C
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #8
	movs r6, r0
	mov r5, r1
	mov r4, r2
	bne _02251F98
	ldr r0, _02252268 ; =ov45_02257334
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd8
	bl __msl_assertion_failed
_02251F98:
	ldr r0, [r6, #4]
	cmp r0, #2
	bls _02251FB8
	ldr r0, _02252274 ; =ov45_02257344
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd8
	bl __msl_assertion_failed
_02251FB8:
	adds r0, r6, #0x108
	bne _02251FD4
	ldr r0, _02252278 ; =ov45_022573C4
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd8
	bl __msl_assertion_failed
_02251FD4:
	ldr r0, [r6, #0x110]
	cmp r0, #0
	bge _02251FF4
	ldr r0, _0225227C ; =ov45_022573E4
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd8
	bl __msl_assertion_failed
_02251FF4:
	ldr r0, [r6, #0x110]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _0225201C
	ldr r0, _02252280 ; =ov45_02257408
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd8
	bl __msl_assertion_failed
_0225201C:
	ldr r0, [r6, #0x10c]
	cmp r0, #0
	bge _0225203C
	ldr r0, _02252284 ; =ov45_02257438
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd8
	bl __msl_assertion_failed
_0225203C:
	ldr r1, [r6, #0x10c]
	ldr r0, [r6, #0x110]
	cmp r1, r0
	ble _02252060
	ldr r0, _02252288 ; =ov45_0225745C
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd8
	bl __msl_assertion_failed
_02252060:
	adds r0, r6, #0x114
	bne _0225207C
	ldr r0, _0225228C ; =ov45_0225749C
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd8
	bl __msl_assertion_failed
_0225207C:
	ldr r0, [r6, #0x11c]
	cmp r0, #0
	bge _0225209C
	ldr r0, _02252290 ; =ov45_022574BC
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd8
	bl __msl_assertion_failed
_0225209C:
	ldr r0, [r6, #0x11c]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _022520C4
	ldr r0, _02252294 ; =ov45_022574E0
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd8
	bl __msl_assertion_failed
_022520C4:
	ldr r0, [r6, #0x118]
	cmp r0, #0
	bge _022520E4
	ldr r0, _02252298 ; =ov45_02257514
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd8
	bl __msl_assertion_failed
_022520E4:
	ldr r1, [r6, #0x118]
	ldr r0, [r6, #0x11c]
	cmp r1, r0
	ble _02252108
	ldr r0, _0225229C ; =ov45_02257538
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd8
	bl __msl_assertion_failed
_02252108:
	cmp r5, #0
	bne _02252124
	ldr r0, _022522A0 ; =ov45_02257578
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xd9
	bl __msl_assertion_failed
_02252124:
	cmp r4, #0
	bge _02252140
	ldr r0, _022522A4 ; =ov45_02257590
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xda
	bl __msl_assertion_failed
_02252140:
	ldr r0, _022522A8 ; =0x0000FFFF
	cmp r4, r0
	ble _02252160
	ldr r0, _022522AC ; =ov45_0225759C
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xdb
	bl __msl_assertion_failed
_02252160:
	ldr r0, [r6, #4]
	cmp r0, #0
	beq _02252180
	ldr r0, _022522B0 ; =ov45_022575B0
	ldr r1, _0225226C ; =ov45_02257258
	ldr r2, _02252270 ; =ov45_022571D4
	mov r3, #0xdc
	bl __msl_assertion_failed
_02252180:
	mov r1, r5
	add r0, r6, #8
	mov r2, #0xff
	bl strncpy
	mov r1, #0
	mov r0, r5
	strb r1, [r6, #0x106]
	bl ov00_021FFA44
	mvn r1, #0
	cmp r0, r1
	bne _022521D0
	mov r0, r5
	bl SOC_GetHostByName
	cmp r0, #0
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	ldr r0, [r0, #0xc]
	ldr r0, [r0]
	ldr r0, [r0]
_022521D0:
	mov r1, r4, lsl #0x10
	mov r1, r1, lsr #0x10
	mov r3, r1, asr #8
	mov r1, r1, lsl #8
	add r4, sp, #0
	mov r2, #0
	str r2, [r4, #4]
	and r3, r3, #0xff
	and r1, r1, #0xff00
	orr r1, r3, r1
	str r2, [r4]
	mov r3, #2
	str r0, [sp, #4]
	strh r1, [sp, #2]
	mov r0, r3
	mov r1, #1
	strb r3, [sp, #1]
	bl ov00_021FF804
	mvn r1, #0
	cmp r0, r1
	str r0, [r6]
	addeq sp, sp, #8
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r1, r4
	mov r2, #8
	bl ov00_021FF8A0
	mvn r1, #0
	cmp r0, r1
	movne r0, #1
	addne sp, sp, #8
	strne r0, [r6, #4]
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r0, [r6]
	bl ov00_021FF818
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, pc}
	.balign 4, 0
_02252268: .word ov45_02257334
_0225226C: .word ov45_02257258
_02252270: .word ov45_022571D4
_02252274: .word ov45_02257344
_02252278: .word ov45_022573C4
_0225227C: .word ov45_022573E4
_02252280: .word ov45_02257408
_02252284: .word ov45_02257438
_02252288: .word ov45_0225745C
_0225228C: .word ov45_0225749C
_02252290: .word ov45_022574BC
_02252294: .word ov45_022574E0
_02252298: .word ov45_02257514
_0225229C: .word ov45_02257538
_022522A0: .word ov45_02257578
_022522A4: .word ov45_02257590
_022522A8: .word 0x0000FFFF
_022522AC: .word ov45_0225759C
_022522B0: .word ov45_022575B0
	arm_func_end ov45_02251F6C

	arm_func_start ov45_022522B4
ov45_022522B4: ; 0x022522B4
	stmdb sp!, {r3, r4, r5, lr}
	movs r4, r0
	bne _022522D4
	ldr r0, _022524F4 ; =ov45_02257334
	ldr r1, _022524F8 ; =ov45_02257258
	ldr r2, _022524FC ; =ov45_02257234
	ldr r3, _02252500 ; =0x0000011B
	bl __msl_assertion_failed
_022522D4:
	ldr r0, [r4, #4]
	cmp r0, #2
	bls _022522F4
	ldr r0, _02252504 ; =ov45_02257344
	ldr r1, _022524F8 ; =ov45_02257258
	ldr r2, _022524FC ; =ov45_02257234
	ldr r3, _02252500 ; =0x0000011B
	bl __msl_assertion_failed
_022522F4:
	adds r0, r4, #0x108
	bne _02252310
	ldr r0, _02252508 ; =ov45_022573C4
	ldr r1, _022524F8 ; =ov45_02257258
	ldr r2, _022524FC ; =ov45_02257234
	ldr r3, _02252500 ; =0x0000011B
	bl __msl_assertion_failed
_02252310:
	ldr r0, [r4, #0x110]
	cmp r0, #0
	bge _02252330
	ldr r0, _0225250C ; =ov45_022573E4
	ldr r1, _022524F8 ; =ov45_02257258
	ldr r2, _022524FC ; =ov45_02257234
	ldr r3, _02252500 ; =0x0000011B
	bl __msl_assertion_failed
_02252330:
	ldr r0, [r4, #0x110]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _02252358
	ldr r0, _02252510 ; =ov45_02257408
	ldr r1, _022524F8 ; =ov45_02257258
	ldr r2, _022524FC ; =ov45_02257234
	ldr r3, _02252500 ; =0x0000011B
	bl __msl_assertion_failed
_02252358:
	ldr r0, [r4, #0x10c]
	cmp r0, #0
	bge _02252378
	ldr r0, _02252514 ; =ov45_02257438
	ldr r1, _022524F8 ; =ov45_02257258
	ldr r2, _022524FC ; =ov45_02257234
	ldr r3, _02252500 ; =0x0000011B
	bl __msl_assertion_failed
_02252378:
	ldr r1, [r4, #0x10c]
	ldr r0, [r4, #0x110]
	cmp r1, r0
	ble _0225239C
	ldr r0, _02252518 ; =ov45_0225745C
	ldr r1, _022524F8 ; =ov45_02257258
	ldr r2, _022524FC ; =ov45_02257234
	ldr r3, _02252500 ; =0x0000011B
	bl __msl_assertion_failed
_0225239C:
	adds r0, r4, #0x114
	bne _022523B8
	ldr r0, _0225251C ; =ov45_0225749C
	ldr r1, _022524F8 ; =ov45_02257258
	ldr r2, _022524FC ; =ov45_02257234
	ldr r3, _02252500 ; =0x0000011B
	bl __msl_assertion_failed
_022523B8:
	ldr r0, [r4, #0x11c]
	cmp r0, #0
	bge _022523D8
	ldr r0, _02252520 ; =ov45_022574BC
	ldr r1, _022524F8 ; =ov45_02257258
	ldr r2, _022524FC ; =ov45_02257234
	ldr r3, _02252500 ; =0x0000011B
	bl __msl_assertion_failed
_022523D8:
	ldr r0, [r4, #0x11c]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _02252400
	ldr r0, _02252524 ; =ov45_022574E0
	ldr r1, _022524F8 ; =ov45_02257258
	ldr r2, _022524FC ; =ov45_02257234
	ldr r3, _02252500 ; =0x0000011B
	bl __msl_assertion_failed
_02252400:
	ldr r0, [r4, #0x118]
	cmp r0, #0
	bge _02252420
	ldr r0, _02252528 ; =ov45_02257514
	ldr r1, _022524F8 ; =ov45_02257258
	ldr r2, _022524FC ; =ov45_02257234
	ldr r3, _02252500 ; =0x0000011B
	bl __msl_assertion_failed
_02252420:
	ldr r1, [r4, #0x118]
	ldr r0, [r4, #0x11c]
	cmp r1, r0
	ble _02252444
	ldr r0, _0225252C ; =ov45_02257538
	ldr r1, _022524F8 ; =ov45_02257258
	ldr r2, _022524FC ; =ov45_02257234
	ldr r3, _02252500 ; =0x0000011B
	bl __msl_assertion_failed
_02252444:
	ldr r0, [r4]
	mvn r1, #0
	cmp r0, r1
	beq _02252464
	mov r1, #2
	bl ov00_021FF82C
	ldr r0, [r4]
	bl ov00_021FF818
_02252464:
	mov r1, #2
	add r0, r4, #0x108
	str r1, [r4, #4]
	bl ov45_02251C40
	add r0, r4, #0x114
	bl ov45_02251C40
	ldr r0, [r4, #0x328]
	bl ov00_021EC3D8
	ldr r0, [r4, #0x32c]
	bl ov00_021EC3D8
	ldr r0, [r4, #0x330]
	bl ov00_021EC3D8
	ldr r0, [r4, #0x334]
	bl ov00_021EC3D8
	ldr r0, [r4, #0x338]
	bl ov00_021EC3D8
	ldr r0, [r4, #0x33c]
	bl ov00_021EC3D8
	ldr r0, [r4, #0x340]
	bl ov00_021EC3D8
	ldr r0, [r4, #0x344]
	bl ov00_021EC3D8
	ldr r0, [r4, #0x34c]
	mov r5, #0
	cmp r0, #0
	ble _022524E8
_022524CC:
	ldr r0, [r4, #0x348]
	ldr r0, [r0, r5, lsl #2]
	bl ov00_021EC3D8
	ldr r0, [r4, #0x34c]
	add r5, r5, #1
	cmp r5, r0
	blt _022524CC
_022524E8:
	ldr r0, [r4, #0x348]
	bl ov00_021EC3D8
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022524F4: .word ov45_02257334
_022524F8: .word ov45_02257258
_022524FC: .word ov45_02257234
_02252500: .word 0x0000011B
_02252504: .word ov45_02257344
_02252508: .word ov45_022573C4
_0225250C: .word ov45_022573E4
_02252510: .word ov45_02257408
_02252514: .word ov45_02257438
_02252518: .word ov45_0225745C
_0225251C: .word ov45_0225749C
_02252520: .word ov45_022574BC
_02252524: .word ov45_022574E0
_02252528: .word ov45_02257514
_0225252C: .word ov45_02257538
	arm_func_end ov45_022522B4

	arm_func_start ov45_02252530
ov45_02252530: ; 0x02252530
	stmdb sp!, {r3, r4, r5, r6, lr}
	sub sp, sp, #0xc
	mov ip, #0
	mov r6, r1
	mov r5, r2
	mov r4, r3
	add r1, sp, #8
	add r2, sp, #4
	add r3, sp, #0
	str ip, [sp, #8]
	str ip, [sp, #4]
	str ip, [sp]
	bl ov00_021FF59C
	cmp r6, #0
	ldrne r0, [sp, #8]
	strne r0, [r6]
	cmp r5, #0
	ldrne r0, [sp, #4]
	strne r0, [r5]
	cmp r4, #0
	ldrne r0, [sp]
	strne r0, [r4]
	add sp, sp, #0xc
	ldmia sp!, {r3, r4, r5, r6, pc}
	arm_func_end ov45_02252530

	arm_func_start ov45_02252590
ov45_02252590: ; 0x02252590
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r6, r0
	bne _022525B0
	ldr r0, _022527C0 ; =ov45_02257334
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	mov r3, #0x154
	bl __msl_assertion_failed
_022525B0:
	ldr r0, [r6, #4]
	cmp r0, #2
	bls _022525D0
	ldr r0, _022527CC ; =ov45_02257344
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	mov r3, #0x154
	bl __msl_assertion_failed
_022525D0:
	adds r0, r6, #0x108
	bne _022525EC
	ldr r0, _022527D0 ; =ov45_022573C4
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	mov r3, #0x154
	bl __msl_assertion_failed
_022525EC:
	ldr r0, [r6, #0x110]
	cmp r0, #0
	bge _0225260C
	ldr r0, _022527D4 ; =ov45_022573E4
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	mov r3, #0x154
	bl __msl_assertion_failed
_0225260C:
	ldr r0, [r6, #0x110]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _02252634
	ldr r0, _022527D8 ; =ov45_02257408
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	mov r3, #0x154
	bl __msl_assertion_failed
_02252634:
	ldr r0, [r6, #0x10c]
	cmp r0, #0
	bge _02252654
	ldr r0, _022527DC ; =ov45_02257438
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	mov r3, #0x154
	bl __msl_assertion_failed
_02252654:
	ldr r1, [r6, #0x10c]
	ldr r0, [r6, #0x110]
	cmp r1, r0
	ble _02252678
	ldr r0, _022527E0 ; =ov45_0225745C
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	mov r3, #0x154
	bl __msl_assertion_failed
_02252678:
	adds r0, r6, #0x114
	bne _02252694
	ldr r0, _022527E4 ; =ov45_0225749C
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	mov r3, #0x154
	bl __msl_assertion_failed
_02252694:
	ldr r0, [r6, #0x11c]
	cmp r0, #0
	bge _022526B4
	ldr r0, _022527E8 ; =ov45_022574BC
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	mov r3, #0x154
	bl __msl_assertion_failed
_022526B4:
	ldr r0, [r6, #0x11c]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _022526DC
	ldr r0, _022527EC ; =ov45_022574E0
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	mov r3, #0x154
	bl __msl_assertion_failed
_022526DC:
	ldr r0, [r6, #0x118]
	cmp r0, #0
	bge _022526FC
	ldr r0, _022527F0 ; =ov45_02257514
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	mov r3, #0x154
	bl __msl_assertion_failed
_022526FC:
	ldr r1, [r6, #0x118]
	ldr r0, [r6, #0x11c]
	cmp r1, r0
	ble _02252720
	ldr r0, _022527F4 ; =ov45_02257538
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	mov r3, #0x154
	bl __msl_assertion_failed
_02252720:
	ldr r0, [r6, #4]
	cmp r0, #1
	beq _02252740
	ldr r0, _022527F8 ; =ov45_022575D8
	ldr r1, _022527C4 ; =ov45_02257258
	ldr r2, _022527C8 ; =ov45_0225720C
	ldr r3, _022527FC ; =0x00000155
	bl __msl_assertion_failed
_02252740:
	ldr r0, [r6, #0x118]
	cmp r0, #0
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	mov r8, #0
	mov sb, #0x400
	mov r5, r8
	add r4, sp, #0
	mvn r7, #0
_02252760:
	ldr r0, [r6]
	mov r1, r5
	mov r2, r4
	mov r3, r5
	bl ov45_02252530
	ldr r0, [sp]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	ldr r2, [r6, #0x118]
	ldr r0, [r6]
	cmp r2, #0x400
	ldr r1, [r6, #0x114]
	movge r2, sb
	mov r3, r8
	bl ov00_021FF970
	movs r1, r0
	cmpne r1, r7
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r0, r6, #0x114
	bl ov45_02251DB4
	ldr r0, [r6, #0x118]
	cmp r0, #0
	bgt _02252760
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.balign 4, 0
_022527C0: .word ov45_02257334
_022527C4: .word ov45_02257258
_022527C8: .word ov45_0225720C
_022527CC: .word ov45_02257344
_022527D0: .word ov45_022573C4
_022527D4: .word ov45_022573E4
_022527D8: .word ov45_02257408
_022527DC: .word ov45_02257438
_022527E0: .word ov45_0225745C
_022527E4: .word ov45_0225749C
_022527E8: .word ov45_022574BC
_022527EC: .word ov45_022574E0
_022527F0: .word ov45_02257514
_022527F4: .word ov45_02257538
_022527F8: .word ov45_022575D8
_022527FC: .word 0x00000155
	arm_func_end ov45_02252590

	arm_func_start ov45_02252800
ov45_02252800: ; 0x02252800
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	movs sl, r0
	bne _02252820
	ldr r0, _02252A5C ; =ov45_02257334
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A68 ; =0x0000017A
	bl __msl_assertion_failed
_02252820:
	ldr r0, [sl, #4]
	cmp r0, #2
	bls _02252840
	ldr r0, _02252A6C ; =ov45_02257344
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A68 ; =0x0000017A
	bl __msl_assertion_failed
_02252840:
	adds r0, sl, #0x108
	bne _0225285C
	ldr r0, _02252A70 ; =ov45_022573C4
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A68 ; =0x0000017A
	bl __msl_assertion_failed
_0225285C:
	ldr r0, [sl, #0x110]
	cmp r0, #0
	bge _0225287C
	ldr r0, _02252A74 ; =ov45_022573E4
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A68 ; =0x0000017A
	bl __msl_assertion_failed
_0225287C:
	ldr r0, [sl, #0x110]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _022528A4
	ldr r0, _02252A78 ; =ov45_02257408
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A68 ; =0x0000017A
	bl __msl_assertion_failed
_022528A4:
	ldr r0, [sl, #0x10c]
	cmp r0, #0
	bge _022528C4
	ldr r0, _02252A7C ; =ov45_02257438
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A68 ; =0x0000017A
	bl __msl_assertion_failed
_022528C4:
	ldr r1, [sl, #0x10c]
	ldr r0, [sl, #0x110]
	cmp r1, r0
	ble _022528E8
	ldr r0, _02252A80 ; =ov45_0225745C
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A68 ; =0x0000017A
	bl __msl_assertion_failed
_022528E8:
	adds r0, sl, #0x114
	bne _02252904
	ldr r0, _02252A84 ; =ov45_0225749C
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A68 ; =0x0000017A
	bl __msl_assertion_failed
_02252904:
	ldr r0, [sl, #0x11c]
	cmp r0, #0
	bge _02252924
	ldr r0, _02252A88 ; =ov45_022574BC
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A68 ; =0x0000017A
	bl __msl_assertion_failed
_02252924:
	ldr r0, [sl, #0x11c]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _0225294C
	ldr r0, _02252A8C ; =ov45_022574E0
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A68 ; =0x0000017A
	bl __msl_assertion_failed
_0225294C:
	ldr r0, [sl, #0x118]
	cmp r0, #0
	bge _0225296C
	ldr r0, _02252A90 ; =ov45_02257514
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A68 ; =0x0000017A
	bl __msl_assertion_failed
_0225296C:
	ldr r1, [sl, #0x118]
	ldr r0, [sl, #0x11c]
	cmp r1, r0
	ble _02252990
	ldr r0, _02252A94 ; =ov45_02257538
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A68 ; =0x0000017A
	bl __msl_assertion_failed
_02252990:
	ldr r0, [sl, #4]
	cmp r0, #1
	beq _022529B0
	ldr r0, _02252A98 ; =ov45_022575D8
	ldr r1, _02252A60 ; =ov45_02257258
	ldr r2, _02252A64 ; =ov45_02257220
	ldr r3, _02252A9C ; =0x0000017B
	bl __msl_assertion_failed
_022529B0:
	mov r7, #0x1000
	mov fp, r7
	mov r4, #0
	add r8, sp, #0
_022529C0:
	mov r2, #0
	ldr r0, [sl]
	mov r1, r8
	mov r3, r2
	bl ov45_02252530
	ldr r0, [sp]
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r1, r7
	add r0, sl, #0x108
	bl ov45_02251C50
	cmp r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r6, [sl, #0x108]
	ldr r5, [sl, #0x10c]
	ldr r0, [sl]
	mov r2, fp
	mov r3, #0
	add r1, r6, r5
	bl ov00_021FF92C
	mov sb, r0
	cmp sb, #0
	movle r0, #2
	strle r0, [sl, #4]
	ldmleia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sl, #0x120]
	cmp r0, #0
	beq _02252A40
	mov r1, sb
	add r0, r6, r5
	add r2, sl, #0x124
	bl ov45_022495DC
_02252A40:
	ldr r0, [sl, #0x10c]
	add r1, r0, sb
	str r1, [sl, #0x10c]
	ldr r0, [sl, #0x108]
	strb r4, [r0, r1]
	b _022529C0
	arm_func_end ov45_02252800

	arm_func_start ov45_02252A58
ov45_02252A58: ; 0x02252A58
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_02252A5C: .word ov45_02257334
_02252A60: .word ov45_02257258
_02252A64: .word ov45_02257220
_02252A68: .word 0x0000017A
_02252A6C: .word ov45_02257344
_02252A70: .word ov45_022573C4
_02252A74: .word ov45_022573E4
_02252A78: .word ov45_02257408
_02252A7C: .word ov45_02257438
_02252A80: .word ov45_0225745C
_02252A84: .word ov45_0225749C
_02252A88: .word ov45_022574BC
_02252A8C: .word ov45_022574E0
_02252A90: .word ov45_02257514
_02252A94: .word ov45_02257538
_02252A98: .word ov45_022575D8
_02252A9C: .word 0x0000017B
	arm_func_end ov45_02252A58

	arm_func_start ov45_02252AA0
ov45_02252AA0: ; 0x02252AA0
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02252AC0
	ldr r0, _02252C70 ; =ov45_02257334
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252C7C ; =0x000001BE
	bl __msl_assertion_failed
_02252AC0:
	ldr r0, [r4, #4]
	cmp r0, #2
	bls _02252AE0
	ldr r0, _02252C80 ; =ov45_02257344
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252C7C ; =0x000001BE
	bl __msl_assertion_failed
_02252AE0:
	adds r0, r4, #0x108
	bne _02252AFC
	ldr r0, _02252C84 ; =ov45_022573C4
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252C7C ; =0x000001BE
	bl __msl_assertion_failed
_02252AFC:
	ldr r0, [r4, #0x110]
	cmp r0, #0
	bge _02252B1C
	ldr r0, _02252C88 ; =ov45_022573E4
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252C7C ; =0x000001BE
	bl __msl_assertion_failed
_02252B1C:
	ldr r0, [r4, #0x110]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _02252B44
	ldr r0, _02252C8C ; =ov45_02257408
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252C7C ; =0x000001BE
	bl __msl_assertion_failed
_02252B44:
	ldr r0, [r4, #0x10c]
	cmp r0, #0
	bge _02252B64
	ldr r0, _02252C90 ; =ov45_02257438
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252C7C ; =0x000001BE
	bl __msl_assertion_failed
_02252B64:
	ldr r1, [r4, #0x10c]
	ldr r0, [r4, #0x110]
	cmp r1, r0
	ble _02252B88
	ldr r0, _02252C94 ; =ov45_0225745C
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252C7C ; =0x000001BE
	bl __msl_assertion_failed
_02252B88:
	adds r0, r4, #0x114
	bne _02252BA4
	ldr r0, _02252C98 ; =ov45_0225749C
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252C7C ; =0x000001BE
	bl __msl_assertion_failed
_02252BA4:
	ldr r0, [r4, #0x11c]
	cmp r0, #0
	bge _02252BC4
	ldr r0, _02252C9C ; =ov45_022574BC
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252C7C ; =0x000001BE
	bl __msl_assertion_failed
_02252BC4:
	ldr r0, [r4, #0x11c]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _02252BEC
	ldr r0, _02252CA0 ; =ov45_022574E0
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252C7C ; =0x000001BE
	bl __msl_assertion_failed
_02252BEC:
	ldr r0, [r4, #0x118]
	cmp r0, #0
	bge _02252C0C
	ldr r0, _02252CA4 ; =ov45_02257514
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252C7C ; =0x000001BE
	bl __msl_assertion_failed
_02252C0C:
	ldr r1, [r4, #0x118]
	ldr r0, [r4, #0x11c]
	cmp r1, r0
	ble _02252C30
	ldr r0, _02252CA8 ; =ov45_02257538
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252C7C ; =0x000001BE
	bl __msl_assertion_failed
_02252C30:
	ldr r0, [r4, #4]
	cmp r0, #1
	beq _02252C50
	ldr r0, _02252CAC ; =ov45_022575D8
	ldr r1, _02252C74 ; =ov45_02257258
	ldr r2, _02252C78 ; =ov45_022571B4
	ldr r3, _02252CB0 ; =0x000001BF
	bl __msl_assertion_failed
_02252C50:
	ldr r0, [r4, #4]
	cmp r0, #2
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ov45_02252590
	mov r0, r4
	bl ov45_02252800
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02252C70: .word ov45_02257334
_02252C74: .word ov45_02257258
_02252C78: .word ov45_022571B4
_02252C7C: .word 0x000001BE
_02252C80: .word ov45_02257344
_02252C84: .word ov45_022573C4
_02252C88: .word ov45_022573E4
_02252C8C: .word ov45_02257408
_02252C90: .word ov45_02257438
_02252C94: .word ov45_0225745C
_02252C98: .word ov45_0225749C
_02252C9C: .word ov45_022574BC
_02252CA0: .word ov45_022574E0
_02252CA4: .word ov45_02257514
_02252CA8: .word ov45_02257538
_02252CAC: .word ov45_022575D8
_02252CB0: .word 0x000001BF
	arm_func_end ov45_02252AA0

	arm_func_start ov45_02252CB4
ov45_02252CB4: ; 0x02252CB4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r8, r0
	mov r7, r1
	bne _02252CD8
	ldr r0, _02252F2C ; =ov45_02257334
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	mov r3, #0x1d8
	bl __msl_assertion_failed
_02252CD8:
	ldr r0, [r8, #4]
	cmp r0, #2
	bls _02252CF8
	ldr r0, _02252F38 ; =ov45_02257344
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	mov r3, #0x1d8
	bl __msl_assertion_failed
_02252CF8:
	adds r0, r8, #0x108
	bne _02252D14
	ldr r0, _02252F3C ; =ov45_022573C4
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	mov r3, #0x1d8
	bl __msl_assertion_failed
_02252D14:
	ldr r0, [r8, #0x110]
	cmp r0, #0
	bge _02252D34
	ldr r0, _02252F40 ; =ov45_022573E4
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	mov r3, #0x1d8
	bl __msl_assertion_failed
_02252D34:
	ldr r0, [r8, #0x110]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _02252D5C
	ldr r0, _02252F44 ; =ov45_02257408
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	mov r3, #0x1d8
	bl __msl_assertion_failed
_02252D5C:
	ldr r0, [r8, #0x10c]
	cmp r0, #0
	bge _02252D7C
	ldr r0, _02252F48 ; =ov45_02257438
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	mov r3, #0x1d8
	bl __msl_assertion_failed
_02252D7C:
	ldr r1, [r8, #0x10c]
	ldr r0, [r8, #0x110]
	cmp r1, r0
	ble _02252DA0
	ldr r0, _02252F4C ; =ov45_0225745C
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	mov r3, #0x1d8
	bl __msl_assertion_failed
_02252DA0:
	adds r0, r8, #0x114
	bne _02252DBC
	ldr r0, _02252F50 ; =ov45_0225749C
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	mov r3, #0x1d8
	bl __msl_assertion_failed
_02252DBC:
	ldr r0, [r8, #0x11c]
	cmp r0, #0
	bge _02252DDC
	ldr r0, _02252F54 ; =ov45_022574BC
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	mov r3, #0x1d8
	bl __msl_assertion_failed
_02252DDC:
	ldr r0, [r8, #0x11c]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _02252E04
	ldr r0, _02252F58 ; =ov45_022574E0
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	mov r3, #0x1d8
	bl __msl_assertion_failed
_02252E04:
	ldr r0, [r8, #0x118]
	cmp r0, #0
	bge _02252E24
	ldr r0, _02252F5C ; =ov45_02257514
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	mov r3, #0x1d8
	bl __msl_assertion_failed
_02252E24:
	ldr r1, [r8, #0x118]
	ldr r0, [r8, #0x11c]
	cmp r1, r0
	ble _02252E48
	ldr r0, _02252F60 ; =ov45_02257538
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	mov r3, #0x1d8
	bl __msl_assertion_failed
_02252E48:
	ldr r0, [r8, #4]
	cmp r0, #1
	beq _02252E68
	ldr r0, _02252F64 ; =ov45_022575D8
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	ldr r3, _02252F68 ; =0x000001D9
	bl __msl_assertion_failed
_02252E68:
	cmp r7, #0
	bne _02252E84
	ldr r0, _02252F6C ; =ov45_02257248
	ldr r1, _02252F30 ; =ov45_02257258
	ldr r2, _02252F34 ; =ov45_02257154
	ldr r3, _02252F70 ; =0x000001DA
	bl __msl_assertion_failed
_02252E84:
	ldr r0, [r8, #4]
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r7
	bl strlen
	mov r6, r0
	add r0, r8, #0x114
	add r1, r6, #2
	bl ov45_02251C50
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r5, [r8, #0x114]
	ldr r4, [r8, #0x118]
	mov r1, r7
	mov r2, r6
	add r0, r5, r4
	bl memcpy
	ldr r0, [r8, #0x118]
	mov r2, #0xd
	add r3, r0, r6
	add r0, r3, #1
	str r0, [r8, #0x118]
	ldr r0, [r8, #0x114]
	mov r1, #0xa
	strb r2, [r0, r3]
	ldr r2, [r8, #0x118]
	add r0, r2, #1
	str r0, [r8, #0x118]
	ldr r0, [r8, #0x114]
	strb r1, [r0, r2]
	ldr r0, [r8, #0x120]
	cmp r0, #0
	beq _02252F24
	add r2, r8, #0x26
	add r0, r5, r4
	add r1, r6, #2
	add r2, r2, #0x200
	bl ov45_022495DC
_02252F24:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02252F2C: .word ov45_02257334
_02252F30: .word ov45_02257258
_02252F34: .word ov45_02257154
_02252F38: .word ov45_02257344
_02252F3C: .word ov45_022573C4
_02252F40: .word ov45_022573E4
_02252F44: .word ov45_02257408
_02252F48: .word ov45_02257438
_02252F4C: .word ov45_0225745C
_02252F50: .word ov45_0225749C
_02252F54: .word ov45_022574BC
_02252F58: .word ov45_022574E0
_02252F5C: .word ov45_02257514
_02252F60: .word ov45_02257538
_02252F64: .word ov45_022575D8
_02252F68: .word 0x000001D9
_02252F6C: .word ov45_02257248
_02252F70: .word 0x000001DA
	arm_func_end ov45_02252CB4

	arm_func_start ov45_02252F74
ov45_02252F74: ; 0x02252F74
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02252F98
	ldr r0, _02253194 ; =ov45_02257334
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	ldr r3, _022531A0 ; =0x00000213
	bl __msl_assertion_failed
_02252F98:
	ldr r0, [r4, #4]
	cmp r0, #2
	bls _02252FB8
	ldr r0, _022531A4 ; =ov45_02257344
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	ldr r3, _022531A0 ; =0x00000213
	bl __msl_assertion_failed
_02252FB8:
	adds r0, r4, #0x108
	bne _02252FD4
	ldr r0, _022531A8 ; =ov45_022573C4
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	ldr r3, _022531A0 ; =0x00000213
	bl __msl_assertion_failed
_02252FD4:
	ldr r0, [r4, #0x110]
	cmp r0, #0
	bge _02252FF4
	ldr r0, _022531AC ; =ov45_022573E4
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	ldr r3, _022531A0 ; =0x00000213
	bl __msl_assertion_failed
_02252FF4:
	ldr r0, [r4, #0x110]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _0225301C
	ldr r0, _022531B0 ; =ov45_02257408
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	ldr r3, _022531A0 ; =0x00000213
	bl __msl_assertion_failed
_0225301C:
	ldr r0, [r4, #0x10c]
	cmp r0, #0
	bge _0225303C
	ldr r0, _022531B4 ; =ov45_02257438
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	ldr r3, _022531A0 ; =0x00000213
	bl __msl_assertion_failed
_0225303C:
	ldr r1, [r4, #0x10c]
	ldr r0, [r4, #0x110]
	cmp r1, r0
	ble _02253060
	ldr r0, _022531B8 ; =ov45_0225745C
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	ldr r3, _022531A0 ; =0x00000213
	bl __msl_assertion_failed
_02253060:
	adds r0, r4, #0x114
	bne _0225307C
	ldr r0, _022531BC ; =ov45_0225749C
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	ldr r3, _022531A0 ; =0x00000213
	bl __msl_assertion_failed
_0225307C:
	ldr r0, [r4, #0x11c]
	cmp r0, #0
	bge _0225309C
	ldr r0, _022531C0 ; =ov45_022574BC
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	ldr r3, _022531A0 ; =0x00000213
	bl __msl_assertion_failed
_0225309C:
	ldr r0, [r4, #0x11c]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _022530C4
	ldr r0, _022531C4 ; =ov45_022574E0
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	ldr r3, _022531A0 ; =0x00000213
	bl __msl_assertion_failed
_022530C4:
	ldr r0, [r4, #0x118]
	cmp r0, #0
	bge _022530E4
	ldr r0, _022531C8 ; =ov45_02257514
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	ldr r3, _022531A0 ; =0x00000213
	bl __msl_assertion_failed
_022530E4:
	ldr r1, [r4, #0x118]
	ldr r0, [r4, #0x11c]
	cmp r1, r0
	ble _02253108
	ldr r0, _022531CC ; =ov45_02257538
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	ldr r3, _022531A0 ; =0x00000213
	bl __msl_assertion_failed
_02253108:
	ldr r0, [r4, #4]
	cmp r0, #1
	beq _02253128
	ldr r0, _022531D0 ; =ov45_022575D8
	ldr r1, _02253198 ; =ov45_02257258
	ldr r2, _0225319C ; =ov45_022571A4
	mov r3, #0x214
	bl __msl_assertion_failed
_02253128:
	ldr r0, [r4, #4]
	cmp r0, #2
	moveq r0, #1
	ldmeqia sp!, {r4, lr}
	addeq sp, sp, #0x10
	bxeq lr
	add r0, sp, #0xc
	bic r2, r0, #3
	ldr r1, [sp, #0xc]
	ldr r0, _022531D4 ; =ov45_022577F8
	add r2, r2, #4
	bl vsprintf
	mvn r1, #0
	cmp r0, r1
	ldreq r0, _022531D4 ; =ov45_022577F8
	moveq r1, #0
	streqb r1, [r0, #0xfff]
	beq _0225317C
	ldr r1, _022531D4 ; =ov45_022577F8
	mov r2, #0
	strb r2, [r1, r0]
_0225317C:
	ldr r1, _022531D4 ; =ov45_022577F8
	mov r0, r4
	bl ov45_02252CB4
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.balign 4, 0
_02253194: .word ov45_02257334
_02253198: .word ov45_02257258
_0225319C: .word ov45_022571A4
_022531A0: .word 0x00000213
_022531A4: .word ov45_02257344
_022531A8: .word ov45_022573C4
_022531AC: .word ov45_022573E4
_022531B0: .word ov45_02257408
_022531B4: .word ov45_02257438
_022531B8: .word ov45_0225745C
_022531BC: .word ov45_0225749C
_022531C0: .word ov45_022574BC
_022531C4: .word ov45_022574E0
_022531C8: .word ov45_02257514
_022531CC: .word ov45_02257538
_022531D0: .word ov45_022575D8
_022531D4: .word ov45_022577F8
	arm_func_end ov45_02252F74

	arm_func_start ov45_022531D8
ov45_022531D8: ; 0x022531D8
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	movs sl, r0
	ldrnesb r0, [sl]
	mov r4, #0
	mov sb, r1
	mov r5, r4
	mov r6, r4
	mov r7, r4
	mov r8, r4
	cmpne r0, #0
	bne _02253220
	ldr r0, _02253364 ; =ov45_022575FC
	ldr r1, _02253368 ; =ov45_02257258
	ldr r2, _0225336C ; =ov45_02257148
	ldr r3, _02253370 ; =0x00000232
	bl __msl_assertion_failed
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02253220:
	ldrsb r0, [sl]
	mov r1, sl
	cmp r0, #0
	beq _0225329C
_02253230:
	ldrsb r0, [r1]
	cmp r0, #0x21
	addne r1, r1, #1
	addne r6, r6, #1
	bne _02253290
	ldrsb r0, [r1, #1]!
	mov r4, r1
	cmp r0, #0
	beq _02253290
_02253254:
	cmp r0, #0x40
	addne r1, r1, #1
	addne r7, r7, #1
	bne _02253284
	ldrsb r0, [r1, #1]!
	mov r5, r1
	cmp r0, #0
	beq _02253284
_02253274:
	ldrsb r0, [r1, #1]!
	add r8, r8, #1
	cmp r0, #0
	bne _02253274
_02253284:
	ldrsb r0, [r1]
	cmp r0, #0
	bne _02253254
_02253290:
	ldrsb r0, [r1]
	cmp r0, #0
	bne _02253230
_0225329C:
	cmp r6, #0
	beq _022532D4
	add r0, r6, #1
	bl ov00_021EC3A8
	str r0, [sb, #8]
	cmp r0, #0
	beq _022532DC
	mov r1, sl
	mov r2, r6
	bl memcpy
	ldr r0, [sb, #8]
	mov r1, #0
	strb r1, [r0, r6]
	b _022532DC
_022532D4:
	mov r0, #0
	str r0, [sb, #8]
_022532DC:
	cmp r7, #0
	beq _02253314
	add r0, r7, #1
	bl ov00_021EC3A8
	str r0, [sb, #0xc]
	cmp r0, #0
	beq _0225331C
	mov r1, r4
	mov r2, r7
	bl memcpy
	ldr r0, [sb, #0xc]
	mov r1, #0
	strb r1, [r0, r7]
	b _0225331C
_02253314:
	mov r0, #0
	str r0, [sb, #0xc]
_0225331C:
	cmp r8, #0
	beq _02253354
	add r0, r8, #1
	bl ov00_021EC3A8
	str r0, [sb, #0x10]
	cmp r0, #0
	beq _0225335C
	mov r1, r5
	mov r2, r8
	bl memcpy
	ldr r0, [sb, #0x10]
	mov r1, #0
	strb r1, [r0, r8]
	b _0225335C
_02253354:
	mov r0, #0
	str r0, [sb, #0x10]
_0225335C:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_02253364: .word ov45_022575FC
_02253368: .word ov45_02257258
_0225336C: .word ov45_02257148
_02253370: .word 0x00000232
	arm_func_end ov45_022531D8

	arm_func_start ov45_02253374
ov45_02253374: ; 0x02253374
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r1
	ldr r1, [r5, #0x24]
	mov r6, r0
	add r1, r1, #1
	ldr r0, [r5, #0x20]
	mov r1, r1, lsl #2
	bl ov00_021EC3BC
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	str r0, [r5, #0x20]
	mov r0, r6
	bl strlen
	add r0, r0, #1
	bl ov00_021EC3A8
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, pc}
	mov r1, r6
	bl strcpy
	ldr r2, [r5, #0x24]
	mov r0, #1
	add r1, r2, #1
	str r1, [r5, #0x24]
	ldr r1, [r5, #0x20]
	str r4, [r1, r2, lsl #2]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end ov45_02253374

	arm_func_start ov45_022533E4
ov45_022533E4: ; 0x022533E4
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	movs r6, r0
	mov r5, r1
	bne _02253408
	ldr r0, _02253508 ; =ov45_02257600
	ldr r1, _0225350C ; =ov45_02257258
	ldr r2, _02253510 ; =ov45_02257184
	ldr r3, _02253514 ; =0x000002A1
	bl __msl_assertion_failed
_02253408:
	cmp r5, #0
	bne _02253424
	ldr r0, _02253518 ; =ov45_02257610
	ldr r1, _0225350C ; =ov45_02257258
	ldr r2, _02253510 ; =ov45_02257184
	ldr r3, _0225351C ; =0x000002A2
	bl __msl_assertion_failed
_02253424:
	mov r0, r6
	bl strlen
	add r0, r0, #1
	bl ov00_021EC3A8
	movs r4, r0
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r1, r6
	bl strcpy
	ldrsb r0, [r4]
	cmp r0, #0x3a
	bne _02253464
	mov r0, #0
	strb r0, [r4]
	add r8, r4, #1
	b _0225347C
_02253464:
	ldr r1, _02253520 ; =ov45_02257620
	mov r0, r4
	bl strstr
	movs r8, r0
	movne r0, #0
	strneb r0, [r8], #2
_0225347C:
	ldr r1, _02253524 ; =ov45_02257624
	mov r0, r4
	bl strtok
	cmp r0, #0
	beq _022534CC
	ldr r6, _02253524 ; =ov45_02257624
	mov r7, #0
_02253498:
	mov r1, r5
	bl ov45_02253374
	cmp r0, #0
	bne _022534B8
	mov r0, r4
	bl ov00_021EC3D8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022534B8:
	mov r0, r7
	mov r1, r6
	bl strtok
	cmp r0, #0
	bne _02253498
_022534CC:
	cmp r8, #0
	beq _022534F8
	mov r0, r8
	mov r1, r5
	bl ov45_02253374
	cmp r0, #0
	bne _022534F8
	mov r0, r4
	bl ov00_021EC3D8
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_022534F8:
	mov r0, r4
	bl ov00_021EC3D8
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02253508: .word ov45_02257600
_0225350C: .word ov45_02257258
_02253510: .word ov45_02257184
_02253514: .word 0x000002A1
_02253518: .word ov45_02257610
_0225351C: .word 0x000002A2
_02253520: .word ov45_02257620
_02253524: .word ov45_02257624
	arm_func_end ov45_022533E4

	arm_func_start ov45_02253528
ov45_02253528: ; 0x02253528
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	movs sb, r1
	mov sl, r0
	ldrnesb r0, [sb]
	mov r5, #0
	mov r6, r5
	mov r7, r5
	mov r8, r5
	cmpne r0, #0
	bne _0225356C
	ldr r0, _0225395C ; =ov45_022575FC
	ldr r1, _02253960 ; =ov45_02257258
	ldr r2, _02253964 ; =ov45_022571C4
	mov r3, #0x2e4
	bl __msl_assertion_failed
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0225356C:
	mov r0, sb
	bl strlen
	mov r4, r0
	add r0, r4, #1
	bl ov00_021EC3A8
	str r0, [sl, #0x328]
	cmp r0, #0
	moveq r0, r5
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	mov r1, sb
	mov r2, r4
	bl memcpy
	ldr r0, [sl, #0x328]
	mov r1, r5
	strb r1, [r0, r4]
	b _022535B0
_022535AC:
	add sb, sb, #1
_022535B0:
	ldrsb r0, [sb]
	cmp r0, #0xa
	cmpne r0, #0xd
	beq _022535AC
	cmp r0, #0x3a
	bne _022535F8
	add sb, sb, #1
	str sb, [sl, #0x32c]
	ldrsb r0, [sb]
	cmp r0, #0
	beq _022535F8
	b _022535E8
_022535E0:
	add r5, r5, #1
	add sb, sb, #1
_022535E8:
	ldrsb r0, [sb]
	cmp r0, #0x20
	cmpne r0, #0
	bne _022535E0
_022535F8:
	cmp r0, #0x20
	bne _0225360C
_02253600:
	ldrsb r0, [sb, #1]!
	cmp r0, #0x20
	beq _02253600
_0225360C:
	cmp r0, #0
	beq _02253634
	str sb, [sl, #0x33c]
	b _02253624
_0225361C:
	add r6, r6, #1
	add sb, sb, #1
_02253624:
	ldrsb r0, [sb]
	cmp r0, #0x20
	cmpne r0, #0
	bne _0225361C
_02253634:
	cmp r0, #0x20
	bne _02253648
_0225363C:
	ldrsb r0, [sb, #1]!
	cmp r0, #0x20
	beq _0225363C
_02253648:
	cmp r0, #0x3a
	cmpne r0, #0
	beq _02253674
	str sb, [sl, #0x340]
	b _02253664
_0225365C:
	add r7, r7, #1
	add sb, sb, #1
_02253664:
	ldrsb r0, [sb]
	cmp r0, #0x20
	cmpne r0, #0
	bne _0225365C
_02253674:
	cmp r0, #0x20
	bne _02253688
_0225367C:
	ldrsb r0, [sb, #1]!
	cmp r0, #0x20
	beq _0225367C
_02253688:
	cmp r0, #0
	strne sb, [sl, #0x344]
	ldrnesb r0, [sb]
	cmpne r0, #0
	beq _022536AC
_0225369C:
	ldrsb r0, [sb, #1]!
	add r8, r8, #1
	cmp r0, #0
	bne _0225369C
_022536AC:
	cmp r5, #0
	beq _02253730
	ldr r4, [sl, #0x32c]
	add r0, r5, #1
	bl ov00_021EC3A8
	str r0, [sl, #0x32c]
	cmp r0, #0
	beq _022536E4
	mov r1, r4
	mov r2, r5
	bl memcpy
	ldr r0, [sl, #0x32c]
	mov r1, #0
	strb r1, [r0, r5]
_022536E4:
	ldr r0, [sl, #0x32c]
	add r1, sl, #0x328
	bl ov45_022531D8
	cmp r0, #0
	bne _02253744
	ldr r0, [sl, #0x328]
	cmp r0, #0
	beq _02253710
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x328]
_02253710:
	ldr r0, [sl, #0x32c]
	cmp r0, #0
	beq _02253728
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x32c]
_02253728:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02253730:
	mov r0, #0
	str r0, [sl, #0x32c]
	str r0, [sl, #0x330]
	str r0, [sl, #0x334]
	str r0, [sl, #0x338]
_02253744:
	cmp r7, #0
	beq _022537E0
	ldr r0, [sl, #0x340]
	add r1, sl, #0x328
	bl ov45_022533E4
	cmp r0, #0
	bne _02253888
	ldr r0, [sl, #0x328]
	cmp r0, #0
	beq _02253778
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x328]
_02253778:
	ldr r0, [sl, #0x32c]
	cmp r0, #0
	beq _02253790
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x32c]
_02253790:
	ldr r0, [sl, #0x330]
	cmp r0, #0
	beq _022537A8
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x330]
_022537A8:
	ldr r0, [sl, #0x334]
	cmp r0, #0
	beq _022537C0
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x334]
_022537C0:
	ldr r0, [sl, #0x338]
	cmp r0, #0
	beq _022537D8
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x338]
_022537D8:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_022537E0:
	cmp r8, #0
	beq _0225387C
	ldr r0, [sl, #0x344]
	add r1, sl, #0x328
	bl ov45_022533E4
	cmp r0, #0
	bne _02253888
	ldr r0, [sl, #0x328]
	cmp r0, #0
	beq _02253814
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x328]
_02253814:
	ldr r0, [sl, #0x32c]
	cmp r0, #0
	beq _0225382C
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x32c]
_0225382C:
	ldr r0, [sl, #0x330]
	cmp r0, #0
	beq _02253844
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x330]
_02253844:
	ldr r0, [sl, #0x334]
	cmp r0, #0
	beq _0225385C
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x334]
_0225385C:
	ldr r0, [sl, #0x338]
	cmp r0, #0
	beq _02253874
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x338]
_02253874:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_0225387C:
	mov r0, #0
	str r0, [sl, #0x348]
	str r0, [sl, #0x34c]
_02253888:
	cmp r8, #0
	beq _022538C4
	ldr r4, [sl, #0x344]
	add r0, r8, #1
	bl ov00_021EC3A8
	str r0, [sl, #0x344]
	cmp r0, #0
	beq _022538CC
	mov r1, r4
	mov r2, r8
	bl memcpy
	ldr r0, [sl, #0x344]
	mov r1, #0
	strb r1, [r0, r8]
	b _022538CC
_022538C4:
	mov r0, #0
	str r0, [sl, #0x344]
_022538CC:
	cmp r6, #0
	beq _02253908
	ldr r4, [sl, #0x33c]
	add r0, r6, #1
	bl ov00_021EC3A8
	str r0, [sl, #0x33c]
	cmp r0, #0
	beq _02253910
	mov r1, r4
	mov r2, r6
	bl memcpy
	ldr r0, [sl, #0x33c]
	mov r1, #0
	strb r1, [r0, r6]
	b _02253910
_02253908:
	mov r0, #0
	str r0, [sl, #0x33c]
_02253910:
	cmp r7, #0
	beq _0225394C
	ldr r4, [sl, #0x340]
	add r0, r7, #1
	bl ov00_021EC3A8
	str r0, [sl, #0x340]
	cmp r0, #0
	beq _02253954
	mov r1, r4
	mov r2, r7
	bl memcpy
	ldr r0, [sl, #0x340]
	mov r1, #0
	strb r1, [r0, r7]
	b _02253954
_0225394C:
	mov r0, #0
	str r0, [sl, #0x340]
_02253954:
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_0225395C: .word ov45_022575FC
_02253960: .word ov45_02257258
_02253964: .word ov45_022571C4
	arm_func_end ov45_02253528

	arm_func_start ov45_02253968
ov45_02253968: ; 0x02253968
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	mov sl, r0
	ldr r5, [sl, #0x108]
	ldrsb r0, [r5]
	cmp r0, #0
	beq _02253B54
	b _02253988
_02253984:
	add r5, r5, #1
_02253988:
	ldrsb r0, [r5]
	cmp r0, #0xd
	cmpne r0, #0xa
	beq _02253984
	cmp r0, #0
	beq _02253B54
	mov r6, r5
	mov r7, r5
	b _022539B8
_022539AC:
	cmp r0, #0x20
	movne r7, r6
	add r6, r6, #1
_022539B8:
	ldrsb r0, [r6]
	cmp r0, #0xa
	cmpne r0, #0xd
	cmpne r0, #0
	bne _022539AC
	cmp r0, #0
	beq _02253B54
	ldrsb r8, [r7, #1]
	mov r0, #0
	strb r0, [r7, #1]
	ldr r0, [sl, #0x328]
	cmp r0, #0
	beq _022539F8
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x328]
_022539F8:
	ldr r0, [sl, #0x32c]
	cmp r0, #0
	beq _02253A10
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x32c]
_02253A10:
	ldr r0, [sl, #0x330]
	cmp r0, #0
	beq _02253A28
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x330]
_02253A28:
	ldr r0, [sl, #0x334]
	cmp r0, #0
	beq _02253A40
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x334]
_02253A40:
	ldr r0, [sl, #0x338]
	cmp r0, #0
	beq _02253A58
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x338]
_02253A58:
	ldr r0, [sl, #0x33c]
	cmp r0, #0
	beq _02253A70
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x33c]
_02253A70:
	ldr r0, [sl, #0x340]
	cmp r0, #0
	beq _02253A88
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x340]
_02253A88:
	ldr r0, [sl, #0x344]
	cmp r0, #0
	beq _02253AA0
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x344]
_02253AA0:
	ldr r0, [sl, #0x34c]
	mov sb, #0
	cmp r0, #0
	ble _02253AE0
	mov r4, sb
_02253AB4:
	ldr r0, [sl, #0x348]
	ldr r0, [r0, sb, lsl #2]
	cmp r0, #0
	beq _02253AD0
	bl ov00_021EC3D8
	ldr r0, [sl, #0x348]
	str r4, [r0, sb, lsl #2]
_02253AD0:
	ldr r0, [sl, #0x34c]
	add sb, sb, #1
	cmp sb, r0
	blt _02253AB4
_02253AE0:
	ldr r0, [sl, #0x348]
	cmp r0, #0
	beq _02253AF8
	bl ov00_021EC3D8
	mov r0, #0
	str r0, [sl, #0x348]
_02253AF8:
	mov r1, #0
	add r0, sl, #0x328
	mov r2, #0x28
	str r1, [sl, #0x34c]
	bl memset
	mov r0, sl
	mov r1, r5
	bl ov45_02253528
	cmp r0, #0
	bne _02253B38
	add r0, sl, #0x328
	mov r1, #0
	mov r2, #0x28
	bl memset
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02253B38:
	strb r8, [r7, #1]
	ldr r1, [sl, #0x108]
	add r0, sl, #0x108
	sub r1, r6, r1
	bl ov45_02251DB4
	mov r0, #1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
_02253B54:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end ov45_02253968

	arm_func_start ov45_02253B5C
ov45_02253B5C: ; 0x02253B5C
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _02253B7C
	ldr r0, _02253D14 ; =ov45_02257334
	ldr r1, _02253D18 ; =ov45_02257258
	ldr r2, _02253D1C ; =ov45_02257164
	ldr r3, _02253D20 ; =0x000003E9
	bl __msl_assertion_failed
_02253B7C:
	ldr r0, [r4, #4]
	cmp r0, #2
	bls _02253B9C
	ldr r0, _02253D24 ; =ov45_02257344
	ldr r1, _02253D18 ; =ov45_02257258
	ldr r2, _02253D1C ; =ov45_02257164
	ldr r3, _02253D20 ; =0x000003E9
	bl __msl_assertion_failed
_02253B9C:
	adds r0, r4, #0x108
	bne _02253BB8
	ldr r0, _02253D28 ; =ov45_022573C4
	ldr r1, _02253D18 ; =ov45_02257258
	ldr r2, _02253D1C ; =ov45_02257164
	ldr r3, _02253D20 ; =0x000003E9
	bl __msl_assertion_failed
_02253BB8:
	ldr r0, [r4, #0x110]
	cmp r0, #0
	bge _02253BD8
	ldr r0, _02253D2C ; =ov45_022573E4
	ldr r1, _02253D18 ; =ov45_02257258
	ldr r2, _02253D1C ; =ov45_02257164
	ldr r3, _02253D20 ; =0x000003E9
	bl __msl_assertion_failed
_02253BD8:
	ldr r0, [r4, #0x110]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _02253C00
	ldr r0, _02253D30 ; =ov45_02257408
	ldr r1, _02253D18 ; =ov45_02257258
	ldr r2, _02253D1C ; =ov45_02257164
	ldr r3, _02253D20 ; =0x000003E9
	bl __msl_assertion_failed
_02253C00:
	ldr r0, [r4, #0x10c]
	cmp r0, #0
	bge _02253C20
	ldr r0, _02253D34 ; =ov45_02257438
	ldr r1, _02253D18 ; =ov45_02257258
	ldr r2, _02253D1C ; =ov45_02257164
	ldr r3, _02253D20 ; =0x000003E9
	bl __msl_assertion_failed
_02253C20:
	ldr r1, [r4, #0x10c]
	ldr r0, [r4, #0x110]
	cmp r1, r0
	ble _02253C44
	ldr r0, _02253D38 ; =ov45_0225745C
	ldr r1, _02253D18 ; =ov45_02257258
	ldr r2, _02253D1C ; =ov45_02257164
	ldr r3, _02253D20 ; =0x000003E9
	bl __msl_assertion_failed
_02253C44:
	adds r0, r4, #0x114
	bne _02253C60
	ldr r0, _02253D3C ; =ov45_0225749C
	ldr r1, _02253D18 ; =ov45_02257258
	ldr r2, _02253D1C ; =ov45_02257164
	ldr r3, _02253D20 ; =0x000003E9
	bl __msl_assertion_failed
_02253C60:
	ldr r0, [r4, #0x11c]
	cmp r0, #0
	bge _02253C80
	ldr r0, _02253D40 ; =ov45_022574BC
	ldr r1, _02253D18 ; =ov45_02257258
	ldr r2, _02253D1C ; =ov45_02257164
	ldr r3, _02253D20 ; =0x000003E9
	bl __msl_assertion_failed
_02253C80:
	ldr r0, [r4, #0x11c]
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #19
	adds r0, r1, r0, ror #19
	beq _02253CA8
	ldr r0, _02253D44 ; =ov45_022574E0
	ldr r1, _02253D18 ; =ov45_02257258
	ldr r2, _02253D1C ; =ov45_02257164
	ldr r3, _02253D20 ; =0x000003E9
	bl __msl_assertion_failed
_02253CA8:
	ldr r0, [r4, #0x118]
	cmp r0, #0
	bge _02253CC8
	ldr r0, _02253D48 ; =ov45_02257514
	ldr r1, _02253D18 ; =ov45_02257258
	ldr r2, _02253D1C ; =ov45_02257164
	ldr r3, _02253D20 ; =0x000003E9
	bl __msl_assertion_failed
_02253CC8:
	ldr r1, [r4, #0x118]
	ldr r0, [r4, #0x11c]
	cmp r1, r0
	ble _02253CEC
	ldr r0, _02253D4C ; =ov45_02257538
	ldr r1, _02253D18 ; =ov45_02257258
	ldr r2, _02253D1C ; =ov45_02257164
	ldr r3, _02253D20 ; =0x000003E9
	bl __msl_assertion_failed
_02253CEC:
	ldr r0, [r4, #0x10c]
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	mov r0, r4
	bl ov45_02253968
	cmp r0, #0
	addne r0, r4, #0x328
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.balign 4, 0
_02253D14: .word ov45_02257334
_02253D18: .word ov45_02257258
_02253D1C: .word ov45_02257164
_02253D20: .word 0x000003E9
_02253D24: .word ov45_02257344
_02253D28: .word ov45_022573C4
_02253D2C: .word ov45_022573E4
_02253D30: .word ov45_02257408
_02253D34: .word ov45_02257438
_02253D38: .word ov45_0225745C
_02253D3C: .word ov45_0225749C
_02253D40: .word ov45_022574BC
_02253D44: .word ov45_022574E0
_02253D48: .word ov45_02257514
_02253D4C: .word ov45_02257538
	arm_func_end ov45_02253B5C

	arm_func_start ov45_02253D50
ov45_02253D50: ; 0x02253D50
	ldr r1, _02253D84 ; =0xAAAAAAAB
	mov r3, #3
	umull r1, r2, r0, r1
	mov r2, r2, lsr #1
	umull r1, r2, r3, r2
	subs r2, r0, r1
	ldr r1, _02253D84 ; =0xAAAAAAAB
	movne r3, #1
	umull r1, r2, r0, r1
	moveq r3, #0
	add r0, r3, r2, lsr #1
	mov r0, r0, lsl #2
	bx lr
	.balign 4, 0
_02253D84: .word 0xAAAAAAAB
	arm_func_end ov45_02253D50

	arm_func_start ov45_02253D88
ov45_02253D88: ; 0x02253D88
	ldr r1, _02253D98 ; =ov45_022587F8
	orr r0, r0, r0, lsl #16
	str r0, [r1]
	bx lr
	.balign 4, 0
_02253D98: .word ov45_022587F8
	arm_func_end ov45_02253D88

	arm_func_start ov45_02253D9C
ov45_02253D9C: ; 0x02253D9C
	stmdb sp!, {r3, lr}
	ldr r1, _02253DD4 ; =ov45_0225762C
	ldr r0, _02253DD8 ; =ov45_022587F8
	ldr r3, [r1, #0x48]
	ldr r2, [r1, #0x44]
	ldr r0, [r0]
	ldr r1, [r1, #0x4c]
	mla r0, r2, r0, r3
	bl _u32_div_f
	ldr r0, _02253DD8 ; =ov45_022587F8
	mov r2, r1, asr #0x10
	str r1, [r0]
	and r0, r2, #0xff
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02253DD4: .word ov45_0225762C
_02253DD8: .word ov45_022587F8
	arm_func_end ov45_02253D9C

	arm_func_start ov45_02253DDC
ov45_02253DDC: ; 0x02253DDC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	ldr r4, _02253ECC ; =ov45_0225762C
	mov ip, #0
	str ip, [r4, #0xc]
	ldr r4, [sp, #0x18]
	mov r8, r0
	mov r7, r1
	mov r6, r2
	mov r5, r3
	bl strlen
	cmp r0, #0x20
	movhs r0, #0
	ldmhsia sp!, {r4, r5, r6, r7, r8, pc}
	mov r0, r7
	bl strlen
	cmp r0, #0x14
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	sub r0, r6, #5
	tst r0, #7
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	tst r5, #1
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	mov r2, #0
	mov r1, r2
_02253E48:
	mov r0, r4, lsr r1
	and r0, r0, #1
	cmp r0, #1
	add r1, r1, #1
	addeq r2, r2, #1
	cmp r1, #0x20
	blt _02253E48
	cmp r2, #1
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, _02253ED0 ; =ov45_0225763C
	mov r1, r8
	mov r2, #0x20
	bl strncpy
	ldr r3, _02253ED4 ; =ov45_0225765C
	mov r2, #0xa
_02253E88:
	ldrb r1, [r7]
	ldrb r0, [r7, #1]
	add r7, r7, #2
	subs r2, r2, #1
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	bne _02253E88
	ldr r1, _02253ECC ; =ov45_0225762C
	ldr r0, [sp, #0x1c]
	str r6, [r1, #0x44]
	str r5, [r1, #0x48]
	str r4, [r1, #0x4c]
	str r0, [r1, #0x50]
	mov r0, #1
	str r0, [r1, #0xc]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_02253ECC: .word ov45_0225762C
_02253ED0: .word ov45_0225763C
_02253ED4: .word ov45_0225765C
	arm_func_end ov45_02253DDC

	arm_func_start ov45_02253ED8
ov45_02253ED8: ; 0x02253ED8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x50
	ldr r4, _0225407C ; =ov45_02254DF4
	add r3, sp, #0
	mov r6, r0
	mov r5, r1
	mov r2, #8
_02253EF4:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	add r4, r4, #2
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	bne _02253EF4
	ldrb r0, [r4]
	cmp r5, #0x28
	addle sp, sp, #0x50
	strb r0, [r3]
	movle r0, #0
	ldmleia sp!, {r4, r5, r6, r7, r8, pc}
	sub r4, r5, #0x28
	mov r0, r4
	bl ov45_02253D50
	add r1, r0, #0x29
	mov r0, #7
	bl ov00_021EC2A8
	movs r7, r0
	addeq sp, sp, #0x50
	moveq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r8, _02254080 ; =ov45_0225765C
	mov r3, r7
	mov r2, #0xa
_02253F60:
	ldrb r1, [r8]
	ldrb r0, [r8, #1]
	add r8, r8, #2
	subs r2, r2, #1
	strb r1, [r3]
	strb r0, [r3, #1]
	add r3, r3, #2
	bne _02253F60
	mov r0, r6
	mov r2, r4
	add r1, r7, #0x14
	mov r3, #2
	bl ov00_021FFC18
	mov r0, r4
	bl ov45_02253D50
	add r1, r7, #0x14
	ldr r3, _02254080 ; =ov45_0225765C
	add r8, r1, r0
	mov r2, #0xa
_02253FAC:
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	add r3, r3, #2
	subs r2, r2, #1
	strb r1, [r8]
	strb r0, [r8, #1]
	add r8, r8, #2
	bne _02253FAC
	mov r0, r4
	bl ov45_02253D50
	mov r2, r0
	add r0, sp, #0x11
	mov r1, r7
	add r2, r2, #0x28
	bl MATH_CalcSHA1
	mov r1, r7
	mov r0, #7
	mov r2, #0
	bl ov00_021EC2EC
	mov r2, #0
	add r3, sp, #0x11
	mov r7, r2
	add r1, sp, #0x25
	add r8, sp, #0
_0225400C:
	ldrb ip, [r3], #1
	add r2, r2, #1
	add r0, r1, r7
	mov lr, ip, asr #4
	and ip, ip, #0xf
	ldrsb lr, [r8, lr]
	ldrsb ip, [r8, ip]
	cmp r2, #0x14
	strb lr, [r1, r7]
	strb ip, [r0, #1]
	add r7, r7, #2
	blt _0225400C
	sub r0, r5, #0x28
	mov r3, #0
	add r0, r6, r0
	mov r2, #0x28
	strb r3, [sp, #0x4d]
	bl strncmp
	cmp r0, #0
	addne sp, sp, #0x50
	movne r0, #0
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r1, _02254084 ; =ov45_0225762C
	mov r0, #1
	str r6, [r1, #0x68]
	str r4, [r1, #0x6c]
	add sp, sp, #0x50
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.balign 4, 0
_0225407C: .word ov45_02254DF4
_02254080: .word ov45_0225765C
_02254084: .word ov45_0225762C
	arm_func_end ov45_02253ED8

	arm_func_start ov45_02254088
ov45_02254088: ; 0x02254088
	bx lr
	arm_func_end ov45_02254088

	arm_func_start ov45_0225408C
ov45_0225408C: ; 0x0225408C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x48
	ldr r3, _022542DC ; =ov45_0225762C
	mvn r4, #0
	str r4, [r3, #8]
	ldr ip, [r3]
	mov r5, r0
	cmp ip, #1
	mov r4, r1
	addeq sp, sp, #0x48
	ldmeqia sp!, {r3, r4, r5, pc}
	cmp r2, #0
	bne _022542D0
	cmp ip, #5
	beq _022540D8
	cmp ip, #7
	beq _02254200
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
_022540D8:
	cmp r4, #0x20
	bne _022541EC
	ldr r0, [r3, #0x58]
	ldr r3, _022542E0 ; =ov45_02254E05
	add lr, sp, #0
	add r4, r0, #0x14
	mov r2, #8
_022540F4:
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	add r3, r3, #2
	strb r1, [lr]
	strb r0, [lr, #1]
	add lr, lr, #2
	subs r2, r2, #1
	bne _022540F4
	ldrb r0, [r3]
	ldr r3, _022542E4 ; =ov45_0225765C
	add ip, sp, #0x11
	strb r0, [lr]
	mov r2, #0xa
_02254128:
	ldrb r1, [r3]
	ldrb r0, [r3, #1]
	add r3, r3, #2
	strb r1, [ip]
	strb r0, [ip, #1]
	add ip, ip, #2
	subs r2, r2, #1
	bne _02254128
	add r0, sp, #0x25
	mov r1, r5
	mov r2, #0x20
	bl memcpy
	add r1, sp, #0x11
	mov r0, r4
	mov r2, #0x34
	bl MATH_CalcSHA1
	mov r0, #0
	ldr r2, _022542DC ; =ov45_0225762C
	mov r1, r0
	add lr, sp, #0
_02254178:
	ldrb ip, [r4, r0]
	ldr r3, [r2, #0x58]
	mov ip, ip, asr #4
	ldrsb ip, [lr, ip]
	strb ip, [r3, r1]
	ldrb ip, [r4, r0]
	ldr r3, [r2, #0x58]
	add r0, r0, #1
	and ip, ip, #0xf
	ldrsb ip, [lr, ip]
	add r3, r3, r1
	cmp r0, #0x14
	strb ip, [r3, #1]
	add r1, r1, #2
	blt _02254178
	ldr r0, _022542E8 ; =ov45_022576CC
	bl strlen
	ldr r1, _022542DC ; =ov45_0225762C
	mov r4, #0x26
	ldr r3, [r1, #0x58]
	mov r2, #0x29
	strb r4, [r3, -r0]
	ldr r1, [r1, #0x58]
	ldr r0, _022542EC ; =ov45_022576A0
	bl strncpy
	ldr r0, _022542DC ; =ov45_0225762C
	mov r1, #6
	str r1, [r0]
	b _022541F0
_022541EC:
	bl ov45_022545BC
_022541F0:
	mov r0, r5
	bl ov00_021EC3D8
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
_02254200:
	ldr r0, _022542F0 ; =ov45_022576D4
	bl strlen
	mov r2, r0
	ldr r1, _022542F0 ; =ov45_022576D4
	mov r0, r5
	bl strncmp
	cmp r0, #0
	bne _02254234
	mov r0, r5
	bl ov00_021EC3D8
	bl ov45_022545BC
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
_02254234:
	ldr r0, _022542DC ; =ov45_0225762C
	ldr r0, [r0, #0x60]
	cmp r0, #0
	beq _02254254
	bl ov00_021EC3D8
	ldr r0, _022542DC ; =ov45_0225762C
	mov r1, #0
	str r1, [r0, #0x60]
_02254254:
	mov r0, r5
	mov r1, r4
	bl ov45_02253ED8
	cmp r0, #0
	bne _0225427C
	mov r0, r5
	bl ov00_021EC3D8
	bl ov45_022545BC
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
_0225427C:
	ldr r0, _022542DC ; =ov45_0225762C
	ldr r2, [r0, #0x70]
	cmp r2, #0
	beq _022542B4
	mov r0, r5
	mov r1, r4
	blx r2
	cmp r0, #0
	bne _022542B4
	mov r0, r5
	bl ov00_021EC3D8
	bl ov45_022545BC
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
_022542B4:
	ldr r0, _022542DC ; =ov45_0225762C
	mov r1, #8
	str r5, [r0, #0x60]
	str r4, [r0, #0x64]
	str r1, [r0]
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
_022542D0:
	bl ov45_022545BC
	add sp, sp, #0x48
	ldmia sp!, {r3, r4, r5, pc}
	.balign 4, 0
_022542DC: .word ov45_0225762C
_022542E0: .word ov45_02254E05
_022542E4: .word ov45_0225765C
_022542E8: .word ov45_022576CC
_022542EC: .word ov45_022576A0
_022542F0: .word ov45_022576D4
	arm_func_end ov45_0225408C

	arm_func_start ov45_022542F4
ov45_022542F4: ; 0x022542F4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r4, [sp, #0x20]
	mov sb, r2
	add r7, r4, sb
	mov r4, r0
	mov sl, r1
	add r1, r7, #4
	mov r0, #7
	mov r8, r3
	mov r6, #0
	bl ov00_021EC2A8
	movs r5, r0
	moveq r0, #2
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	cmp sb, #0
	mov r2, r6
	ble _02254350
_02254338:
	ldrb r1, [sl, r2]
	add r0, r5, r2
	add r2, r2, #1
	strb r1, [r0, #4]
	cmp r2, sb
	blt _02254338
_02254350:
	ldr r3, [sp, #0x20]
	mov sl, #0
	cmp r3, #0
	ble _0225437C
	add r2, r5, sb
_02254364:
	ldrb r1, [r8, sl]
	add r0, r2, sl
	add sl, sl, #1
	strb r1, [r0, #4]
	cmp sl, r3
	blt _02254364
_0225437C:
	cmp r7, #0
	mov r1, #0
	ble _022543A0
_02254388:
	add r0, r5, r1
	ldrb r0, [r0, #4]
	add r1, r1, #1
	cmp r1, r7
	add r6, r6, r0
	blt _02254388
_022543A0:
	mov r0, r6
	bl ov45_02253D88
	cmp r7, #0
	mov r8, #0
	ble _022543D4
_022543B4:
	bl ov45_02253D9C
	add r2, r5, r8
	ldrb r1, [r2, #4]
	add r8, r8, #1
	cmp r8, r7
	eor r0, r1, r0
	strb r0, [r2, #4]
	blt _022543B4
_022543D4:
	ldr r1, _02254438 ; =ov45_0225762C
	mov r0, r5
	ldr r2, [r1, #0x50]
	mov r1, r4
	eor r6, r6, r2
	mov r2, r6, lsr #0x18
	strb r2, [r5]
	mov r2, r6, lsr #0x10
	strb r2, [r5, #1]
	mov r2, r6, lsr #8
	strb r2, [r5, #2]
	add r2, r7, #4
	mov r3, #2
	strb r6, [r5, #3]
	bl ov00_021FFC18
	mov r1, r5
	mov r0, #7
	mov r2, #0
	bl ov00_021EC2EC
	add r0, r7, #4
	bl ov45_02253D50
	mov r1, #0
	strb r1, [r4, r0]
	mov r0, r1
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.balign 4, 0
_02254438: .word ov45_0225762C
	arm_func_end ov45_022542F4

	arm_func_start ov45_0225443C
ov45_0225443C: ; 0x0225443C
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x28
	mov r5, #0
	add r4, sp, #8
	ldr r2, _022545A8 ; =ov45_0225762C
	sub r3, r5, #1
	strb r5, [r4]
	strb r5, [r4, #1]
	strb r5, [r4, #2]
	strb r5, [r4, #3]
	strb r5, [r4, #4]
	strb r5, [r4, #5]
	strb r5, [r4, #6]
	strb r5, [r4, #7]
	strb r5, [r4, #8]
	str r3, [r2, #8]
	str r5, [r2, #0x54]
	str r5, [r2, #0x58]
	str r5, [r2, #0x5c]
	str r5, [r2, #0x60]
	mov r4, r1
	str r5, [r2, #0x64]
	cmp r0, #0
	beq _022544B8
	cmp r0, #1
	beq _022544C8
	cmp r0, #2
	ldreq r1, _022545AC ; =ov45_02257728
	ldreq r0, _022545B0 ; =ov45_02257628
	streq r1, [r0]
	b _022544D4
_022544B8:
	ldr r1, _022545B4 ; =ov45_022576DC
	ldr r0, _022545B0 ; =ov45_02257628
	str r1, [r0]
	b _022544D4
_022544C8:
	ldr r1, _022545B8 ; =ov45_02257704
	ldr r0, _022545B0 ; =ov45_02257628
	str r1, [r0]
_022544D4:
	add r0, sp, #0x11
	mov r1, r4
	mov r2, #0x14
	bl strncpy
	mov r3, #0
	add r0, sp, #8
	add r1, r4, #0x14
	mov r2, #8
	strb r3, [sp, #0x25]
	bl strncpy
	mov r1, #0
	mov r2, #0x10
	bl strtoul
	mov r7, r0
	add r0, sp, #8
	add r1, r4, #0x1c
	mov r2, #8
	bl strncpy
	mov r1, #0
	mov r2, #0x10
	bl strtoul
	mov r6, r0
	add r0, sp, #8
	add r1, r4, #0x24
	mov r2, #8
	bl strncpy
	mov r1, #0
	mov r2, #0x10
	bl strtoul
	mov r5, r0
	add r0, sp, #8
	add r1, r4, #0x2c
	mov r2, #8
	bl strncpy
	mov r1, #0
	mov r2, #0x10
	bl strtoul
	str r5, [sp]
	str r0, [sp, #4]
	mov r2, r7
	mov r3, r6
	add r0, r4, #0x34
	add r1, sp, #0x11
	bl ov45_02253DDC
	mov r0, #0
	bl ov00_021FA0B4
	ldr r0, _022545A8 ; =ov45_0225762C
	mov r2, #3
	mov r1, #1
	str r2, [r0]
	str r1, [r0, #4]
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022545A8: .word ov45_0225762C
_022545AC: .word ov45_02257728
_022545B0: .word ov45_02257628
_022545B4: .word ov45_022576DC
_022545B8: .word ov45_02257704
	arm_func_end ov45_0225443C

	arm_func_start ov45_022545BC
ov45_022545BC: ; 0x022545BC
	stmdb sp!, {r3, lr}
	bl ov00_021EC230
	cmp r0, #0
	bne _022545D8
	ldr r1, _022545E8 ; =0xFFFEA048
	mov r0, #6
	bl ov00_021EC24C
_022545D8:
	ldr r0, _022545EC ; =ov45_0225762C
	mov r1, #1
	str r1, [r0]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022545E8: .word 0xFFFEA048
_022545EC: .word ov45_0225762C
	arm_func_end ov45_022545BC

	arm_func_start ov45_022545F0
ov45_022545F0: ; 0x022545F0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr r0, _022546EC ; =ov45_0225762C
	ldr r1, [r0]
	cmp r1, #8
	addls pc, pc, r1, lsl #2
	b _022546DC
_0225460C: ; jump table
	b _022546DC ; case 0
	b _02254630 ; case 1
	b _022546DC ; case 2
	b _022546DC ; case 3
	b _02254638 ; case 4
	b _02254678 ; case 5
	b _0225468C ; case 6
	b _022546CC ; case 7
	b _022546DC ; case 8
_02254630:
	bl ov45_022545BC
	b _022546DC
_02254638:
	ldr r2, _022546F0 ; =ov45_0225408C
	mov r1, #0
	str r2, [sp]
	str r1, [sp, #4]
	ldr r0, [r0, #0x54]
	ldr r3, _022546F4 ; =ov45_02254088
	mov r2, r1
	bl ov00_021FA488
	ldr r1, _022546EC ; =ov45_0225762C
	cmp r0, #0
	str r0, [r1, #8]
	movge r0, #5
	strge r0, [r1]
	bge _022546DC
	bl ov45_022545BC
	b _022546DC
_02254678:
	bl ov00_021FA118
	cmp r0, #0
	bne _022546DC
	bl ov45_022545BC
	b _022546DC
_0225468C:
	ldr r2, _022546F0 ; =ov45_0225408C
	mov r1, #0
	str r2, [sp]
	str r1, [sp, #4]
	ldr r0, [r0, #0x54]
	ldr r3, _022546F4 ; =ov45_02254088
	mov r2, r1
	bl ov00_021FA488
	ldr r1, _022546EC ; =ov45_0225762C
	cmp r0, #0
	str r0, [r1, #8]
	movge r0, #7
	strge r0, [r1]
	bge _022546DC
	bl ov45_022545BC
	b _022546DC
_022546CC:
	bl ov00_021FA118
	cmp r0, #0
	bne _022546DC
	bl ov45_022545BC
_022546DC:
	ldr r0, _022546EC ; =ov45_0225762C
	ldr r0, [r0]
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	.balign 4, 0
_022546EC: .word ov45_0225762C
_022546F0: .word ov45_0225408C
_022546F4: .word ov45_02254088
	arm_func_end ov45_022545F0

	arm_func_start ov45_022546F8
ov45_022546F8: ; 0x022546F8
	stmdb sp!, {r3, lr}
	ldr r0, _02254770 ; =ov45_0225762C
	ldr r1, [r0, #4]
	cmp r1, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, [r0, #0x54]
	cmp r1, #0
	beq _02254730
	mov r0, #7
	mov r2, #0
	bl ov00_021EC2EC
	ldr r0, _02254770 ; =ov45_0225762C
	mov r1, #0
	str r1, [r0, #0x54]
_02254730:
	ldr r0, _02254770 ; =ov45_0225762C
	ldr r0, [r0, #0x60]
	cmp r0, #0
	beq _02254754
	bl ov00_021EC3D8
	ldr r0, _02254770 ; =ov45_0225762C
	mov r1, #0
	str r1, [r0, #0x64]
	str r1, [r0, #0x60]
_02254754:
	bl ov00_021FA0D8
	ldr r0, _02254770 ; =ov45_0225762C
	mov r1, #2
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	ldmia sp!, {r3, pc}
	.balign 4, 0
_02254770: .word ov45_0225762C
	arm_func_end ov45_022546F8

	arm_func_start ov45_02254774
ov45_02254774: ; 0x02254774
	ldr r1, _02254788 ; =ov45_0225762C
	ldr r2, [r1, #0x6c]
	str r2, [r0]
	ldr r0, [r1, #0x68]
	bx lr
	.balign 4, 0
_02254788: .word ov45_0225762C
	arm_func_end ov45_02254774

	arm_func_start ov45_0225478C
ov45_0225478C: ; 0x0225478C
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x34
	ldr r4, _022549B4 ; =ov45_0225762C
	mov sl, r0
	ldr r0, [r4, #0xc]
	mov sb, r1
	cmp r0, #1
	str r2, [sp, #0x10]
	mov r8, r3
	addne sp, sp, #0x34
	movne r0, #3
	ldmneia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, [r4, #0x54]
	cmp r1, #0
	beq _022547E0
	mov r0, #7
	mov r2, #0
	bl ov00_021EC2EC
	mov r0, r4
	mov r1, #0
	str r1, [r0, #0x54]
_022547E0:
	add r0, r8, #0xc
	bl ov45_02253D50
	mov r7, r0
	ldr r0, _022549B8 ; =ov45_02257750
	bl strlen
	mov r6, r0
	ldr r0, _022549BC ; =ov45_022576CC
	bl strlen
	mov r5, r0
	ldr r2, _022549C0 ; =ov45_02257758
	add r0, sp, #0x24
	mov r1, #0x10
	mov r3, sb
	bl snprintf
	mov fp, r0
	ldr r0, _022549C4 ; =ov45_0225775C
	bl strlen
	str r0, [sp, #0x14]
	mov r0, sl
	bl strlen
	str r0, [sp, #0x18]
	ldr r0, _022549C8 ; =ov45_02257628
	ldr r0, [r0]
	bl strlen
	mov r4, r0
	ldr r0, _022549CC ; =ov45_0225763C
	bl strlen
	add r1, r4, r0
	ldr r0, [sp, #0x18]
	add r1, r0, r1
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	add r0, fp, r0
	add r0, r5, r0
	add r0, r0, #0x29
	add r0, r6, r0
	add r1, r7, r0
	mov r0, #7
	bl ov00_021EC2A8
	ldr r1, _022549B4 ; =ov45_0225762C
	cmp r0, #0
	str r0, [r1, #0x54]
	addeq sp, sp, #0x34
	moveq r0, #2
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	str sl, [sp]
	ldr r1, _022549D0 ; =ov45_02257780
	str sb, [sp, #4]
	str r1, [sp, #8]
	ldr r2, _022549D4 ; =ov45_022577AC
	ldr r1, _022549C8 ; =ov45_02257628
	str r2, [sp, #0xc]
	ldr r2, [r1]
	ldr r1, _022549D8 ; =ov45_02257764
	ldr r3, _022549CC ; =ov45_0225763C
	bl sprintf
	ldr r0, _022549B4 ; =ov45_0225762C
	ldr r4, [r0, #0x54]
	mov r0, r4
	bl strlen
	add r2, r4, r0
	ldr r1, _022549B4 ; =ov45_0225762C
	ldr r0, _022549B8 ; =ov45_02257750
	str r2, [r1, #0x5c]
	bl strlen
	ldr r4, _022549B4 ; =ov45_0225762C
	ldr r3, [sp, #0x10]
	ldr r5, [r4, #0x5c]
	add r1, sp, #0x1c
	sub r0, r5, r0
	sub r0, r0, #0x28
	str r0, [r4, #0x58]
	str sb, [sp, #0x1c]
	str r8, [sp, #0x20]
	str r8, [sp]
	ldr r0, [r4, #0x5c]
	mov r2, #8
	bl ov45_022542F4
	cmp r0, #2
	bne _0225494C
	mov r1, r4
	ldr r1, [r1, #0x54]
	mov r0, #7
	mov r2, #0
	bl ov00_021EC2EC
	mov r0, r4
	mov r1, #0
	str r1, [r0, #0x54]
	add sp, sp, #0x34
	mov r0, #2
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_0225494C:
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	beq _0225497C
	mov r0, r4
	ldr r1, _022549DC ; =ov45_022576A0
	ldr r0, [r0, #0x58]
	mov r2, #0x28
	bl memcpy
	mov r0, r4
	mov r1, #6
	str r1, [r0]
	b _0225499C
_0225497C:
	ldr r0, _022549BC ; =ov45_022576CC
	bl strlen
	mov r1, r4
	ldr r3, [r1, #0x58]
	mov r4, #0
	mov r2, #4
	strb r4, [r3, -r0]
	str r2, [r1]
_0225499C:
	ldr r2, [sp, #0x58]
	ldr r1, _022549B4 ; =ov45_0225762C
	mov r0, #0
	str r2, [r1, #0x70]
	add sp, sp, #0x34
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.balign 4, 0
_022549B4: .word ov45_0225762C
_022549B8: .word ov45_02257750
_022549BC: .word ov45_022576CC
_022549C0: .word ov45_02257758
_022549C4: .word ov45_0225775C
_022549C8: .word ov45_02257628
_022549CC: .word ov45_0225763C
_022549D0: .word ov45_02257780
_022549D4: .word ov45_022577AC
_022549D8: .word ov45_02257764
_022549DC: .word ov45_022576A0
	arm_func_end ov45_0225478C

	arm_func_start ov45_022549E0
ov45_022549E0: ; 0x022549E0
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	mov ip, #0
	str lr, [sp]
	str ip, [sp, #4]
	bl ov45_0225478C
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end ov45_022549E0

	arm_func_start ov45_02254A04
ov45_02254A04: ; 0x02254A04
	stmdb sp!, {r3, lr}
	sub sp, sp, #8
	ldr lr, [sp, #0x10]
	mov ip, #1
	str lr, [sp]
	str ip, [sp, #4]
	bl ov45_0225478C
	add sp, sp, #8
	ldmia sp!, {r3, pc}
	arm_func_end ov45_02254A04

	.rodata

_02254D04:
	.word ov45_02254F78
	.word ov45_02254F84
	.word ov45_02254F80
	.word ov45_02254F7C
	.word ov45_02254F74
	.word ov45_02254F90

ov45_02254D1C: ; 0x02254D1C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov45_02254D3C: ; 0x02254D3C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00

ov45_02254D5C: ; 0x02254D5C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00

ov45_02254D7C: ; 0x02254D7C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00

ov45_02254D9C: ; 0x02254D9C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00

ov45_02254DBC: ; 0x02254DBC
	.asciz "#GSP"
	.balign 4, 0

ov45_02254DC4: ; 0x02254DC4
	.word ov45_02255368
	.word ov45_02255370
	.word ov45_02255384
	.word ov45_02255388
	.word ov45_0225538C
	.word ov45_02255390
	.word ov45_02255394
	.word ov45_0225537C
	.word ov45_02255374
	.word ov45_02255378
	.word ov45_02255380
	.word ov45_0225536C

ov45_02254DF4: ; 0x02254DF4
	.asciz "0123456789abcdef"

ov45_02254E05: ; 0x02254E05
	.asciz "0123456789abcdef"

	.data

_02254F58:
	.byte 0x00, 0x00, 0x01, 0x00
	.word ov45_02255048
	.word ov45_02255024
	.word ov45_02255070
	.word ov45_02254FE4
	.word ov45_02254FC8
	.word ov45_02255004

ov45_02254F74:
	.asciz "N"
	.balign 4, 0

ov45_02254F78:
	.asciz "M"
	.balign 4, 0

ov45_02254F7C:
	.asciz "C"
	.balign 4, 0

ov45_02254F80:
	.asciz "F2"
	.balign 4, 0

ov45_02254F84:
	.asciz "F1"
	.balign 4, 0

ov45_02254F88: ; 0x02254F88
	.asciz "M%d_%u"
	.balign 4, 0

ov45_02254F90:
	.asciz "Invalid"
	.balign 4, 0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_02254FA0: ; 0x02254FA0
	.word ov45_02231460
	.word ov45_02236A70
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_02254FB0: ; 0x02254FB0
	.word ov45_02231448
	.word ov45_02236AB8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_02254FC0: ; 0x02254FC0
	.word ov45_02236A48
	.word ov45_02231C38

ov45_02254FC8:
	.asciz "/web/enc/lobby/getVIP.asp"
	.balign 4, 0

ov45_02254FE4:
	.asciz "/web/enc/lobby/getSchedule.asp"
	.balign 4, 0

ov45_02255004:
	.asciz "/web/enc/lobby/checkProfile.asp"
	.balign 4, 0
ov45_02255024:
	.asciz "/web/enc/lobby/getQuestionnaire.asp"
	.balign 4, 0

ov45_02255048:
	.asciz "/web/enc/lobby/submitQuestionnaire.asp"
	.balign 4, 0

ov45_02255070:
	.asciz "uLMOGEiiJogofchScpXb000244fd00006015100000005b440e7epokemondpds"
	.balign 4, 0

ov45_022550B0: ; 0x022550B0
	.asciz "*"
	.balign 4, 0

ov45_022550B4: ; 0x022550B4
	.asciz ""
	.balign 4, 0

ov45_022550B8: ; 0x022550B8
	.asciz "!"
	.balign 4, 0

ov45_022550BC: ; 0x022550BC
	.asciz "C%d_%u"
	.balign 4, 0

ov45_022550C4: ; 0x022550C4
	.asciz "b_lib_u_user"
	.balign 4, 0

ov45_022550D4: ; 0x022550D4
	.asciz "b_lib_u_system"
	.balign 4, 0

ov45_022550E4: ; 0x022550E4
	.asciz "b_lib_c_time"
	.balign 4, 0

ov45_022550F4: ; 0x022550F4
	.asciz "b_lib_c_lobby"
	.balign 4, 0

ov45_02255104: ; 0x02255104
	.asciz "tree::insert length error"
	.balign 4, 0

ov45_02255120: ; 0x02255120
	.asciz "basic_string::reserve length_error"
	.balign 4, 0

ov45_02255144: ; 0x02255144
	.asciz "basic_string: out_of_range"
	.balign 4, 0

ov45_02255160: ; 0x02255160
	.asciz "string compare: pos > len"
	.balign 4, 0

ov45_0225517C: ; 0x0225517C
	.asciz "basic_string: length_error"
	.balign 4, 0

ov45_02255198: ; 0x02255198
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_022551A0: ; 0x022551A0
	.byte 0x00, 0x00, 0x00, 0x00

ov45_022551A4: ; 0x022551A4
	.byte 0x00, 0x00, 0x00, 0x00

ov45_022551A8: ; 0x022551A8
	.byte 0x00, 0x00, 0x00, 0x00

ov45_022551AC: ; 0x022551AC
	.asciz "deque:: length error"
	.balign 4, 0

ov45_022551C4: ; 0x022551C4
	.asciz "cdeque length error"
	.balign 4, 0

ov45_022551D8: ; 0x022551D8
	.byte 0x00

ov45_022551D9: ; 0x022551D9
	.byte 0x00, 0x00, 0x00

ov45_022551DC: ; 0x022551DC
	.asciz "  "
	.balign 4, 0

ov45_022551E0: ; 0x022551E0
	.asciz " "
	.balign 4, 0

ov45_022551E4: ; 0x022551E4
	.asciz "B"
	.balign 4, 0

ov45_022551E8: ; 0x022551E8
	.asciz "S"
	.balign 4, 0

ov45_022551EC: ; 0x022551EC
	.asciz ""
	.balign 4, 0

ov45_022551F0: ; 0x022551F0
	.asciz "%x"
	.balign 4, 0

ov45_022551F4: ; 0x022551F4
	.asciz "A"
	.balign 4, 0

ov45_022551F8: ; 0x022551F8
	.asciz "_"
	.balign 4, 0

ov45_022551FC: ; 0x022551FC
	.asciz "%s"
	.balign 4, 0

ov45_02255200: ; 0x02255200
	.byte 0x01, 0x00, 0x00, 0x00
	.word ov45_0223E494, 0

ov45_0225520C: ; 0x0225520C
	.asciz "tree::insert length error"
	.balign 4, 0

ov45_02255228: ; 0x02255228
	.byte 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_02255238: ; 0x02255238
	.word ov45_0223FD88
	.word ov45_02241F80
	.word ov45_022412C4
	.word ov45_0223FD6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_02255250: ; 0x02255250
	.word ov45_02241FA4
	.word ov45_02241FA8
	.word ov45_022412C4
	.word ov45_0223FD6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_02255268: ; 0x02255268
	.word ov45_02241FCC
	.word ov45_02241FD0
	.word ov45_022412C4
	.word ov45_0223FD6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_02255280: ; 0x02255280
	.word ov45_02241FF4
	.word ov45_02241FF8
	.word ov45_022412C4
	.word ov45_0223FD6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_02255298: ; 0x02255298
	.word ov45_0224201C
	.word ov45_02242020
	.word ov45_022412C4
	.word ov45_0223FD6C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_022552B0: ; 0x022552B0
	.word ov45_02242044
	.word ov45_02242048
	.word ov45_022412C4
	.word ov45_0223FD6C

ov45_022552C0: ; 0x022552C0
	.asciz "SERVER"
	.balign 4, 0

ov45_022552C8: ; 0x022552C8
	.asciz "Excess Flood"
	.balign 4, 0

ov45_022552D8: ; 0x022552D8
	.asciz " :"
	.balign 4, 0

ov45_022552DC: ; 0x022552DC
	.asciz "normal"
	.balign 4, 0

ov45_022552E4: ; 0x022552E4
	.asciz "voice"
	.balign 4, 0

ov45_022552EC: ; 0x022552EC
	.asciz "ops"
	.balign 4, 0

ov45_022552F0: ; 0x022552F0
	.asciz "voice+ops"
	.balign 4, 0

ov45_022552FC: ; 0x022552FC
	.asciz "invalid"
	.balign 4, 0

ov45_02255304: ; 0x02255304
	.asciz ""
	.balign 4, 0

ov45_02255308: ; 0x02255308
	.asciz "DWCUser"
	.balign 4, 0

ov45_02255310: ; 0x02255310
	.asciz "DWCName"
	.balign 4, 0

ov45_02255318: ; 0x02255318
	.asciz "."
	.balign 4, 0

ov45_0225531C: ; 0x0225531C
	.asciz "peerchat.gs.nintendowifi.net"
	.balign 4, 0

ov45_0225533C: ; 0x0225533C
	.asciz "tree::insert length error"
	.balign 4, 0

ov45_02255358: ; 0x02255358
	.byte 0x01, 0x00, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00
	.word ov45_0224307C
	.byte 0x00, 0x00, 0x00, 0x00

ov45_02255368:
	.asciz "R"
	.balign 4, 0

ov45_0225536C:
	.asciz "T"
	.balign 4, 0

ov45_02255370:
	.asciz "D"
	.balign 4, 0

ov45_02255374:
	.asciz "D7"
	.balign 4, 0

ov45_02255378:
	.asciz "D8"
	.balign 4, 0

ov45_0225537C:
	.asciz "D6"
	.balign 4, 0

ov45_02255380:
	.asciz "D9"
	.balign 4, 0

ov45_02255384:
	.asciz "D1"
	.balign 4, 0

ov45_02255388:
	.asciz "D2"
	.balign 4, 0

ov45_0225538C:
	.asciz "D3"
	.balign 4, 0

ov45_02255390:
	.asciz "D4"
	.balign 4, 0

ov45_02255394:
	.asciz "D5"
	.balign 4, 0

ov45_02255398: ; 0x02255398
	.asciz "!"
	.balign 4, 0

ov45_0225539C: ; 0x0225539C
	.asciz "N_%d_%u"
	.balign 4, 0

ov45_022553A4: ; 0x022553A4
	.asciz "_"
	.balign 4, 0

ov45_022553A8: ; 0x022553A8
	.asciz ""
	.balign 4, 0

ov45_022553AC: ; 0x022553AC
	.asciz "tree::insert length error"
	.balign 4, 0

ov45_022553C8: ; 0x022553C8
	.asciz "ciAddCallback_"
	.balign 4, 0

ov45_022553D8: ; 0x022553D8
	.asciz "ciCallCallback"
	.balign 4, 0

ov45_022553E8: ; 0x022553E8
	.asciz "ciCallCallbacks"
	.balign 4, 0

ov45_022553F8: ; 0x022553F8
	.asciz "ciFreeCallbackData"
	.balign 4, 0

ov45_0225540C: ; 0x0225540C
	.asciz "ciCleanupCallbacks"
	.balign 4, 0

ov45_02255420: ; 0x02255420
	.asciz "ciGetCallbackIndexByID"
	.balign 4, 0

ov45_02255438: ; 0x02255438
	.asciz "ciCallbacksArrayElementFreeFn"
	.balign 4, 0

ov45_02255458: ; 0x02255458
	.asciz "data != NULL"
	.balign 4, 0

ov45_02255468: ; 0x02255468
	.asciz "chatCallbacks.c"
	.balign 4, 0

ov45_02255478: ; 0x02255478
	.asciz "data->type >= 0"
	.balign 4, 0

ov45_02255488: ; 0x02255488
	.asciz "data->type < CALLBACK_NUM"
	.balign 4, 0

ov45_022554A4: ; 0x022554A4
	.asciz "data->callback != NULL"
	.balign 4, 0

ov45_022554BC: ; 0x022554BC
	.asciz "data->callbackParams != NULL"
	.balign 4, 0

ov45_022554DC: ; 0x022554DC
	.asciz "data->ID >= 0"
	.balign 4, 0

ov45_022554EC: ; 0x022554EC
	.asciz "0"
	.balign 4, 0

ov45_022554F0: ; 0x022554F0
	.asciz "chat != NULL"
	.balign 4, 0

ov45_02255500: ; 0x02255500
	.asciz "type >= 0"
	.balign 4, 0

ov45_0225550C: ; 0x0225550C
	.asciz "type < CALLBACK_NUM"
	.balign 4, 0

ov45_02255520: ; 0x02255520
	.asciz "connection->callbackList != NULL"
	.balign 4, 0

ov45_02255544: ; 0x02255544
	.asciz "callback != NULL"
	.balign 4, 0

ov45_02255558: ; 0x02255558
	.asciz "callbackParams != NULL"
	.balign 4, 0

ov45_02255570: ; 0x02255570
	.asciz "callbackParamsSize > 0"
	.balign 4, 0

ov45_02255588: ; 0x02255588
	.asciz "ID >= 0"
	.balign 4, 0

ov45_02255590: ; 0x02255590
	.asciz "srcParams-> numChannels >= 0"
	.balign 4, 0

ov45_022555B0: ; 0x022555B0
	.asciz "srcParams->numUsers != NULL"
	.balign 4, 0

ov45_022555CC: ; 0x022555CC
	.asciz "srcParams-> numUsers >= 0"
	.balign 4, 0

ov45_022555E8: ; 0x022555E8
	.asciz "srcParams->modes != NULL"
	.balign 4, 0

ov45_02255604: ; 0x02255604
	.asciz "srcParams-> numBans >= 0"
	.balign 4, 0

ov45_02255620: ; 0x02255620
	.asciz "srcParams-> numSuggestedNicks >= 0"
	.balign 4, 0

ov45_02255644: ; 0x02255644
	.asciz "srcParams-> num >= 0"
	.balign 4, 0

ov45_0225565C: ; 0x0225565C
	.asciz "ciInChannel"
	.balign 4, 0

ov45_02255668: ; 0x02255668
	.asciz "ciHashString"
	.balign 4, 0

ov45_02255678: ; 0x02255678
	.asciz "ciChannelLeft"
	.balign 4, 0

ov45_02255688: ; 0x02255688
	.asciz "ciSetChannelMode"
	.balign 4, 0

ov45_0225569C: ; 0x0225569C
	.asciz "ciChannelEntered"
	.balign 4, 0

ov45_022556B0: ; 0x022556B0
	.asciz "ciGetChannelMode"
	.balign 4, 0

ov45_022556C4: ; 0x022556C4
	.asciz "ciUserChangedNick"
	.balign 4, 0

ov45_022556D8: ; 0x022556D8
	.asciz "ciUserChangedMode"
	.balign 4, 0

ov45_022556EC: ; 0x022556EC
	.asciz "ciUserLeftChannel"
	.balign 4, 0

ov45_02255700: ; 0x02255700
	.asciz "ciCleanupChannels"
	.balign 4, 0

ov45_02255714: ; 0x02255714
	.asciz "ciUserTableHashFn"
	.balign 4, 0

ov45_02255728: ; 0x02255728
	.asciz "ciSetChannelTopic"
	.balign 4, 0

ov45_0225573C: ; 0x0225573C
	.asciz "ciChannelEntering"
	.balign 4, 0

ov45_02255750: ; 0x02255750
	.asciz "ciUserEnumChannels"
	.balign 4, 0

ov45_02255764: ; 0x02255764
	.asciz "ciSetUserBasicInfo"
	.balign 4, 0

ov45_02255778: ; 0x02255778
	.asciz "ciChannelListUsers"
	.balign 4, 0

ov45_0225578C: ; 0x0225578C
	.asciz "ciUserChangeNickMap"
	.balign 4, 0

ov45_022557A0: ; 0x022557A0
	.asciz "ciIsEnteringChannel"
	.balign 4, 0

ov45_022557B4: ; 0x022557B4
	.asciz "ciUserTableCompareFn"
	.balign 4, 0

ov45_022557CC: ; 0x022557CC
	.asciz "ciSetChannelPassword"
	.balign 4, 0

ov45_022557E4: ; 0x022557E4
	.asciz "ciJoinCallbackCalled"
	.balign 4, 0

ov45_022557FC: ; 0x022557FC
	.asciz "ciChannelTableHashFn"
	.balign 4, 0

ov45_02255814: ; 0x02255814
	.asciz "ciGetChannelNumUsers"
	.balign 4, 0

ov45_0225582C: ; 0x0225582C
	.asciz "ciUserEnteredChannel"
	.balign 4, 0

ov45_02255844: ; 0x02255844
	.asciz "ciGetChannelCallbacks"
	.balign 4, 0

ov45_0225585C: ; 0x0225585C
	.asciz "ciChannelListUsersMap"
	.balign 4, 0

ov45_02255874: ; 0x02255874
	.asciz "ciSetUserBasicInfoMap"
	.balign 4, 0

ov45_0225588C: ; 0x0225588C
	.asciz "ciUserEnumChannelsMap"
	.balign 4, 0

ov45_022558A4: ; 0x022558A4
	.asciz "ciWasJoinCallbackCalled"
	.balign 4, 0

ov45_022558BC: ; 0x022558BC
	.asciz "ciChannelTableCompareFn"
	.balign 4, 0

ov45_022558D4: ; 0x022558D4
	.asciz "ciUserTableElementFreeFn"
	.balign 4, 0

ov45_022558F0: ; 0x022558F0
	.asciz "ciChannelTableElementFreeFn"
	.balign 4, 0

ov45_0225590C: ; 0x0225590C
	.asciz "str != NULL"
	.balign 4, 0

ov45_02255918: ; 0x02255918
	.asciz "chatChannel.c"
	.balign 4, 0

ov45_02255928: ; 0x02255928
	.asciz "str[0] != '\\0'"
	.balign 4, 0

ov45_02255938: ; 0x02255938
	.asciz "elem != NULL"
	.balign 4, 0

ov45_02255948: ; 0x02255948
	.asciz "numBuckets > 0"
	.balign 4, 0

ov45_02255958: ; 0x02255958
	.asciz "elem1 != NULL"
	.balign 4, 0

ov45_02255968: ; 0x02255968
	.asciz "elem2 != NULL"
	.balign 4, 0

ov45_02255978: ; 0x02255978
	.asciz "str1 != NULL"
	.balign 4, 0

ov45_02255988: ; 0x02255988
	.asciz "str2 != NULL"
	.balign 4, 0

ov45_02255998: ; 0x02255998
	.asciz "str1[0] != '\\0'"
	.balign 4, 0

ov45_022559A8: ; 0x022559A8
	.asciz "str2[0] != '\\0'"
	.balign 4, 0

ov45_022559B8: ; 0x022559B8
	.asciz "chat != NULL"
	.balign 4, 0

ov45_022559C8: ; 0x022559C8
	.asciz "chatChannel"
	.balign 4, 0

ov45_022559D4: ; 0x022559D4
	.asciz "channel != NULL"
	.balign 4, 0

ov45_022559E4: ; 0x022559E4
	.asciz "channel[0] != '\\0'"
	.balign 4, 0

ov45_022559F8: ; 0x022559F8
	.asciz "strlen(channel) < MAX_CHANNEL"
	.balign 4, 0

ov45_02255A18: ; 0x02255A18
	.asciz "callbacks != NULL"
	.balign 4, 0

ov45_02255A2C: ; 0x02255A2C
	.asciz ""
	.balign 4, 0

ov45_02255A30: ; 0x02255A30
	.asciz "clientData != NULL"
	.balign 4, 0

ov45_02255A44: ; 0x02255A44
	.asciz "user->name != NULL"
	.balign 4, 0

ov45_02255A58: ; 0x02255A58
	.asciz "user->name[0] != '\\0'"
	.balign 4, 0

ov45_02255A70: ; 0x02255A70
	.asciz "strlen(user->name) < MAX_NAME"
	.balign 4, 0

ov45_02255A90: ; 0x02255A90
	.asciz "data->numUsers >= 0"
	.balign 4, 0

ov45_02255AA4: ; 0x02255AA4
	.asciz "0"
	.balign 4, 0

ov45_02255AA8: ; 0x02255AA8
	.asciz "callback != NULL"
	.balign 4, 0

ov45_02255ABC: ; 0x02255ABC
	.asciz "name != NULL"
	.balign 4, 0

ov45_02255ACC: ; 0x02255ACC
	.asciz "name[0] != '\\0'"
	.balign 4, 0

ov45_02255ADC: ; 0x02255ADC
	.asciz "strlen(name) < MAX_NAME"
	.balign 4, 0

ov45_02255AF4: ; 0x02255AF4
	.asciz "(mode >= 0) && (mode <= 3)"
	.balign 4, 0

ov45_02255B10: ; 0x02255B10
	.asciz "TableLookup(chatChannel->users, &chatUser) != NULL"
	.balign 4, 0

ov45_02255B44: ; 0x02255B44
	.asciz "user != NULL"
	.balign 4, 0

ov45_02255B54: ; 0x02255B54
	.asciz "user[0] != '\\0'"
	.balign 4, 0

ov45_02255B64: ; 0x02255B64
	.asciz "strlen(user) < MAX_NAME"
	.balign 4, 0

ov45_02255B7C: ; 0x02255B7C
	.asciz "channel->users != NULL"
	.balign 4, 0

ov45_02255B94: ; 0x02255B94
	.asciz "data->user != NULL"
	.balign 4, 0

ov45_02255BA8: ; 0x02255BA8
	.asciz "data->user->name[0] != '\\0'"
	.balign 4, 0

ov45_02255BC4: ; 0x02255BC4
	.asciz "data->callback != NULL"
	.balign 4, 0

ov45_02255BDC: ; 0x02255BDC
	.asciz "data->newNick != NULL"
	.balign 4, 0

ov45_02255BF4: ; 0x02255BF4
	.asciz "data->newNick[0] != '\\0'"
	.balign 4, 0

ov45_02255C10: ; 0x02255C10
	.asciz "strlen(data->newNick) < MAX_NAME"
	.balign 4, 0

ov45_02255C34: ; 0x02255C34
	.asciz "data->oldNick != NULL"
	.balign 4, 0

ov45_02255C4C: ; 0x02255C4C
	.asciz "data->oldNick[0] != '\\0'"
	.balign 4, 0

ov45_02255C68: ; 0x02255C68
	.asciz "strlen(data->oldNick) < MAX_NAME"
	.balign 4, 0

ov45_02255C8C: ; 0x02255C8C
	.asciz "rcode != 0"
	.balign 4, 0

ov45_02255C98: ; 0x02255C98
	.asciz "oldNick != NULL"
	.balign 4, 0

ov45_02255CA8: ; 0x02255CA8
	.asciz "oldNick[0] != '\\0'"
	.balign 4, 0

ov45_02255CBC: ; 0x02255CBC
	.asciz "strlen(oldNick) < MAX_NAME"
	.balign 4, 0

ov45_02255CD8: ; 0x02255CD8
	.asciz "newNick != NULL"
	.balign 4, 0

ov45_02255CE8: ; 0x02255CE8
	.asciz "newNick[0] != '\\0'"
	.balign 4, 0

ov45_02255CFC: ; 0x02255CFC
	.asciz "strlen(newNick) < MAX_NAME"
	.balign 4, 0

ov45_02255D18: ; 0x02255D18
	.asciz "nick != NULL"
	.balign 4, 0

ov45_02255D28: ; 0x02255D28
	.asciz "nick[0] != '\\0'"
	.balign 4, 0

ov45_02255D38: ; 0x02255D38
	.asciz "strlen(nick) < MAX_NAME"
	.balign 4, 0

ov45_02255D50:
	.asciz "475"
	.balign 4, 0

ov45_02255D54:
	.asciz "302"
	.balign 4, 0

ov45_02255D58:
	.asciz "401"
	.balign 4, 0

ov45_02255D5C:
	.asciz "UTM"
	.balign 4, 0

ov45_02255D60:
	.asciz "366"
	.balign 4, 0

ov45_02255D64:
	.asciz "701"
	.balign 4, 0

ov45_02255D68:
	.asciz "433"
	.balign 4, 0

ov45_02255D6C:
	.asciz "707"
	.balign 4, 0

ov45_02255D70:
	.asciz "352"
	.balign 4, 0

ov45_02255D74:
	.asciz "711"
	.balign 4, 0

ov45_02255D78:
	.asciz "323"
	.balign 4, 0

ov45_02255D7C:
	.asciz "476"
	.balign 4, 0

ov45_02255D80:
	.asciz "324"
	.balign 4, 0

ov45_02255D84:
	.asciz "704"
	.balign 4, 0

ov45_02255D88:
	.asciz "474"
	.balign 4, 0

ov45_02255D8C:
	.asciz "705"
	.balign 4, 0

ov45_02255D90:
	.asciz "405"
	.balign 4, 0

ov45_02255D94:
	.asciz "702"
	.balign 4, 0

ov45_02255D98:
	.asciz "471"
	.balign 4, 0

ov45_02255D9C:
	.asciz "331"
	.balign 4, 0

ov45_02255DA0: ; 0x02255DA0
	.asciz "6"
	.balign 4, 0

ov45_02255DA4:
	.asciz "473"
	.balign 4, 0

ov45_02255DA8:
	.asciz "353"
	.balign 4, 0

ov45_02255DAC:
	.asciz "319"
	.balign 4, 0

ov45_02255DB0:
	.asciz "001"
	.balign 4, 0

ov45_02255DB4:
	.asciz "332"
	.balign 4, 0

ov45_02255DB8:
	.asciz "318"
	.balign 4, 0

ov45_02255DBC:
	.asciz "322"
	.balign 4, 0

ov45_02255DC0:
	.asciz "700"
	.balign 4, 0

ov45_02255DC4:
	.asciz "321"
	.balign 4, 0

ov45_02255DC8:
	.asciz "703"
	.balign 4, 0

ov45_02255DCC:
	.asciz "706"
	.balign 4, 0

ov45_02255DD0:
	.asciz "432"
	.balign 4, 0

ov45_02255DD4:
	.asciz "311"
	.balign 4, 0

ov45_02255DD8:
	.asciz "367"
	.balign 4, 0

ov45_02255DDC:
	.asciz "315"
	.balign 4, 0

ov45_02255DE0:
	.asciz "ATM"
	.balign 4, 0

ov45_02255DE4:
	.asciz "368"
	.balign 4, 0

ov45_02255DE8:
	.asciz "708"
	.balign 4, 0

ov45_02255DEC:
	.asciz "710"
	.balign 4, 0

ov45_02255DF0:
	.asciz "709"
	.balign 4, 0

ov45_02255DF4:
	.asciz "403"
	.balign 4, 0

ov45_02255DF8:
	.asciz "MODE"
	.balign 4, 0

ov45_02255E00:
	.asciz "KICK"
	.balign 4, 0

ov45_02255E08:
	.asciz "NICK"
	.balign 4, 0

ov45_02255E10:
	.asciz "PART"
	.balign 4, 0

ov45_02255E18:
	.asciz "QUIT"
	.balign 4, 0

ov45_02255E20:
	.asciz "JOIN"
	.balign 4, 0

ov45_02255E28:
	.asciz "KILL"
	.balign 4, 0

ov45_02255E30:
	.asciz "PING"
	.balign 4, 0

ov45_02255E38:
	.asciz "TOPIC"
	.balign 4, 0

ov45_02255E40:
	.asciz "ERROR"
	.balign 4, 0

ov45_02255E48:
	.asciz "INVITE"
	.balign 4, 0

ov45_02255E50:
	.asciz "NOTICE"
	.balign 4, 0

ov45_02255E58:
	.asciz "PRIVMSG"
	.balign 4, 0

ov45_02255E60: ; 0x02255E60
	.asciz "ciGetNextID"
	.balign 4, 0

ov45_02255E6C: ; 0x02255E6C
	.asciz "ciAddFilter"
	.balign 4, 0

ov45_02255E78: ; 0x02255E78
	.asciz "ciParseMode"
	.balign 4, 0

ov45_02255E84: ; 0x02255E84
	.asciz "ciParseValue"
	.balign 4, 0

ov45_02255E94: ; 0x02255E94
	.asciz "ciUTMHandler"
	.balign 4, 0

ov45_02255EA4: ; 0x02255EA4
	.asciz "ciATMHandler"
	.balign 4, 0

ov45_02255EB4: ; 0x02255EB4
	.asciz "ciFindFilter"
	.balign 4, 0

ov45_02255EC4: ; 0x02255EC4
	.asciz "ciFilterThink"
	.balign 4, 0

ov45_02255ED4: ; 0x02255ED4
	.asciz "ciPingHandler"
	.balign 4, 0

ov45_02255EE4: ; 0x02255EE4
	.asciz "ciNickHandler"
	.balign 4, 0

ov45_02255EF4: ; 0x02255EF4
	.asciz "ciJoinHandler"
	.balign 4, 0

ov45_02255F04: ; 0x02255F04
	.asciz "ciPartHandler"
	.balign 4, 0

ov45_02255F14: ; 0x02255F14
	.asciz "ciKickHandler"
	.balign 4, 0

ov45_02255F24: ; 0x02255F24
	.asciz "ciQuitHandler"
	.balign 4, 0

ov45_02255F34: ; 0x02255F34
	.asciz "ciKillHandler"
	.balign 4, 0

ov45_02255F44: ; 0x02255F44
	.asciz "ciModeHandler"
	.balign 4, 0

ov45_02255F54: ; 0x02255F54
	.asciz "ciTopicHandler"
	.balign 4, 0

ov45_02255F64: ; 0x02255F64
	.asciz "ciErrorHandler"
	.balign 4, 0

ov45_02255F74: ; 0x02255F74
	.asciz "ciRemoveFilter"
	.balign 4, 0

ov45_02255F84: ; 0x02255F84
	.asciz "ciFinishFilter"
	.balign 4, 0

ov45_02255F94: ; 0x02255F94
	.asciz "ciAddJOINFilter"
	.balign 4, 0

ov45_02255FA4: ; 0x02255FA4
	.asciz "ciNoticeHandler"
	.balign 4, 0

ov45_02255FB4: ; 0x02255FB4
	.asciz "ciInviteHandler"
	.balign 4, 0

ov45_02255FC4: ; 0x02255FC4
	.asciz "ciDestroyFilter"
	.balign 4, 0

ov45_02255FD4: ; 0x02255FD4
	.asciz "ciCleanupFilters"
	.balign 4, 0

ov45_02255FE8: ; 0x02255FE8
	.asciz "ciPrivmsgHandler"
	.balign 4, 0

ov45_02255FFC: ; 0x02255FFC
	.asciz "ciRplListHandler"
	.balign 4, 0

ov45_02256010: ; 0x02256010
	.asciz "ciFilterTimedout"
	.balign 4, 0

ov45_02256024: ; 0x02256024
	.asciz "ciRplCDKeyHandler"
	.balign 4, 0

ov45_02256038: ; 0x02256038
	.asciz "ciRplLoginHandler"
	.balign 4, 0

ov45_0225604C: ; 0x0225604C
	.asciz "ciRplTopicHandler"
	.balign 4, 0

ov45_02256060: ; 0x02256060
	.asciz "ciRplGetKeyHandler"
	.balign 4, 0

ov45_02256074: ; 0x02256074
	.asciz "ciRplUserIPHandler"
	.balign 4, 0

ov45_02256088: ; 0x02256088
	.asciz "ciNameReplyHandler"
	.balign 4, 0

ov45_0225609C: ; 0x0225609C
	.asciz "ciFindGetKeyFilter"
	.balign 4, 0

ov45_022560B0: ; 0x022560B0
	.asciz "ciCheckFiltersForID"
	.balign 4, 0

ov45_022560C4: ; 0x022560C4
	.asciz "ciRplGetCKeyHandler"
	.balign 4, 0

ov45_022560D8: ; 0x022560D8
	.asciz "ciEndOfNamesHandler"
	.balign 4, 0

ov45_022560EC: ; 0x022560EC
	.asciz "ciRplBanListHandler"
	.balign 4, 0

ov45_02256100: ; 0x02256100
	.asciz "ciRplNoTopicHandler"
	.balign 4, 0

ov45_02256114: ; 0x02256114
	.asciz "ciRplWelcomeHandler"
	.balign 4, 0

ov45_02256128: ; 0x02256128
	.asciz "ciApplyChangesToMode"
	.balign 4, 0

ov45_02256140: ; 0x02256140
	.asciz "ciRplWhoReplyHandler"
	.balign 4, 0

ov45_02256158: ; 0x02256158
	.asciz "ciRplEndOfWhoHandler"
	.balign 4, 0

ov45_02256170: ; 0x02256170
	.asciz "ciRplSecureKeyHandler"
	.balign 4, 0

ov45_02256188: ; 0x02256188
	.asciz "ciRplEndGetKeyHandler"
	.balign 4, 0

ov45_022561A0: ; 0x022561A0
	.asciz "ciRplListStartHandler"
	.balign 4, 0

ov45_022561B8: ; 0x022561B8
	.asciz "ciRplWhoisUserHandler"
	.balign 4, 0

ov45_022561D0: ; 0x022561D0
	.asciz "ciErrNickInUseHandler"
	.balign 4, 0

ov45_022561E8: ; 0x022561E8
	.asciz "ciRplEndGetCKeyHandler"
	.balign 4, 0

ov45_02256200: ; 0x02256200
	.asciz "ciRplGetChanKeyHandler"
	.balign 4, 0

ov45_02256218: ; 0x02256218
	.asciz "ciRplEndOfWhoisHandler"
	.balign 4, 0

ov45_02256230: ; 0x02256230
	.asciz "ciErrBadChanMaskHandler"
	.balign 4, 0

ov45_02256248: ; 0x02256248
	.asciz "ciErrLoginFailedHandler"
	.balign 4, 0

ov45_02256260: ; 0x02256260
	.asciz "ciErrNoUniqueNickHandler"
	.balign 4, 0

ov45_0225627C: ; 0x0225627C
	.asciz "ciRplEndOfBanListHandler"
	.balign 4, 0

ov45_02256298: ; 0x02256298
	.asciz "ciErrBadChannelKeyHandler"
	.balign 4, 0

ov45_022562B4: ; 0x022562B4
	.asciz "ciErrNoSuchChannelHandler"
	.balign 4, 0

ov45_022562D0: ; 0x022562D0
	.asciz "ciRplChannelModeIsHandler"
	.balign 4, 0

ov45_022562EC: ; 0x022562EC
	.asciz "ciRplWhoisChannelsHandler"
	.balign 4, 0

ov45_02256308: ; 0x02256308
	.asciz "ciErrChannelIsFullHandler"
	.balign 4, 0

ov45_02256324: ; 0x02256324
	.asciz "ciQuitEnumChannelsCallback"
	.balign 4, 0

ov45_02256340: ; 0x02256340
	.asciz "ciKillEnumChannelsCallback"
	.balign 4, 0

ov45_0225635C: ; 0x0225635C
	.asciz "ciErrInviteOnlyChanHandler"
	.balign 4, 0

ov45_02256378: ; 0x02256378
	.asciz "ciErrBannedFromChanHandler"
	.balign 4, 0

ov45_02256394: ; 0x02256394
	.asciz "ciErrTooManyChannelsHandler"
	.balign 4, 0

ov45_022563B0: ; 0x022563B0
	.asciz "ciErrErroneusNicknameHandler"
	.balign 4, 0

ov45_022563D0: ; 0x022563D0
	.asciz "ciErrUniqueNickExpiredHandler"
	.balign 4, 0

ov45_022563F0: ; 0x022563F0
	.asciz "ciErrRegisterNickFailedHandler"
	.balign 4, 0

ov45_02256410: ; 0x02256410
	.word ov45_02255E58, ov45_0224B0FC
	.word ov45_02255E50, ov45_0224B310
	.word ov45_02255D5C, ov45_0224B474
	.word ov45_02255DE0, ov45_0224B5E0
	.word ov45_02255E30, ov45_0224B748
	.word ov45_02255E08, ov45_0224B794
	.word ov45_02255E20, ov45_0224B8D0
	.word ov45_02255E10, ov45_0224BB4C
	.word ov45_02255E00, ov45_0224BC8C
	.word ov45_02255E18, ov45_0224C018
	.word ov45_02255E28, ov45_0224C244
	.word ov45_02255E38, ov45_0224C2A8
	.word ov45_02255DF8, ov45_0224C388
	.word ov45_02255E40, ov45_0224C594
	.word ov45_02255E48, ov45_0224C610
	.word ov45_02255DA8, ov45_0224C6DC
	.word ov45_02255D60, ov45_0224C9D8
	.word ov45_02255DB4, ov45_0224CBAC
	.word ov45_02255D9C, ov45_0224CCC8
	.word ov45_02255D70, ov45_0224CF0C
	.word ov45_02255D54, ov45_0224DE70
	.word ov45_02255DC4, ov45_0224DF50
	.word ov45_02255DBC, ov45_0224DFC4
	.word ov45_02255D78, ov45_0224E210
	.word ov45_02255D80, ov45_0224E288
	.word ov45_02255DD4, ov45_0224E408
	.word ov45_02255DAC, ov45_0224E5EC
	.word ov45_02255DB8, ov45_0224E734
	.word ov45_02255DD8, ov45_0224E81C
	.word ov45_02255DE4, ov45_0224E968
	.word ov45_02255DB0, ov45_0224EA2C
	.word ov45_02255DDC, ov45_0224D128
	.word ov45_02255DC0, ov45_0224D30C
	.word ov45_02255D64, ov45_0224D4BC
	.word ov45_02255D94, ov45_0224D588
	.word ov45_02255DC8, ov45_0224D924
	.word ov45_02255D84, ov45_0224D9F0
	.word ov45_02255D8C, ov45_0224EAF4
	.word ov45_02255DCC, ov45_0224EC14
	.word ov45_02255D6C, ov45_0224ECCC
	.word ov45_02255D68, ov45_0224CDE0
	.word ov45_02255DF4, ov45_0224ED80
	.word ov45_02255D90, ov45_0224EEBC
	.word ov45_02255D98, ov45_0224EF70
	.word ov45_02255DA4, ov45_0224F024
	.word ov45_02255D88, ov45_0224F0D8
	.word ov45_02255D50, ov45_0224F18C
	.word ov45_02255D7C, ov45_0224F240
	.word ov45_02255D58, ov45_0224F2F4
	.word ov45_02255DD0, ov45_0224F2F8
	.word ov45_02255DE8, ov45_0224F35C
	.word ov45_02255DF0, ov45_0224F3C0
	.word ov45_02255DEC, ov45_0224F428
	.word ov45_02255D74, ov45_0224F490

ov45_022565C0: ; 0x022565C0
	.asciz "chat != NULL"
	.balign 4, 0

ov45_022565D0: ; 0x022565D0
	.asciz "chatHandlers.c"
	.balign 4, 0

ov45_022565E0: ; 0x022565E0
	.asciz "numMatches > 0"
	.balign 4, 0

ov45_022565F0: ; 0x022565F0
	.asciz "matches"
	.balign 4, 0

ov45_022565F8: ; 0x022565F8
	.asciz "(matches[i].type >= 0) && (matches[i].type < NUM_TYPES)"
	.balign 4, 0

ov45_02256630: ; 0x02256630
	.asciz "channel"
	.balign 4, 0

ov45_02256638: ; 0x02256638
	.asciz "channel[0]"
	.balign 4, 0

ov45_02256644: ; 0x02256644
	.asciz "filter != NULL"
	.balign 4, 0

ov45_02256654: ; 0x02256654
	.asciz "filter"
	.balign 4, 0

ov45_0225665C: ; 0x0225665C
	.asciz "(filter->type >= 0) && (filter->type < NUM_TYPES)"
	.balign 4, 0

ov45_02256690: ; 0x02256690
	.asciz "0"
	.balign 4, 0

ov45_02256694: ; 0x02256694
	.asciz "Timed out"
	.balign 4, 0

ov45_022566A0: ; 0x022566A0
	.asciz "ID > 0"
	.balign 4, 0

ov45_022566A8: ; 0x022566A8
	.asciz "password != NULL"
	.balign 4, 0

ov45_022566BC: ; 0x022566BC
	.asciz "strlen(password) < MAX_PASSWORD"
	.balign 4, 0

ov45_022566DC: ; 0x022566DC
	.asciz "b_*"
	.balign 4, 0

ov45_022566E0: ; 0x022566E0
	.asciz "mode != NULL"
	.balign 4, 0

ov45_022566F0: ; 0x022566F0
	.asciz "message->numParams == 2"
	.balign 4, 0

ov45_02256708: ; 0x02256708
	.asciz ""
	.balign 4, 0

ov45_0225670C: ; 0x0225670C
	.asciz "ACTION"
	.balign 4, 0

ov45_02256714: ; 0x02256714
	.asciz "PONG %s"
	.balign 4, 0

ov45_0225671C: ; 0x0225671C
	.asciz "message->numParams == 1"
	.balign 4, 0

ov45_02256734: ; 0x02256734
	.asciz "strlen(newNick) < MAX_NICK"
	.balign 4, 0

ov45_02256750: ; 0x02256750
	.asciz "*nick != '\\0'"
	.balign 4, 0

ov45_02256760: ; 0x02256760
	.asciz "MODE %s"
	.balign 4, 0

ov45_02256768: ; 0x02256768
	.asciz "(message->numParams == 2) || (message->numParams == 3)"
	.balign 4, 0

ov45_022567A0: ; 0x022567A0
	.asciz "user != NULL"
	.balign 4, 0

ov45_022567B0: ; 0x022567B0
	.asciz "user[0] != '\\0'"
	.balign 4, 0

ov45_022567C0: ; 0x022567C0
	.asciz "channel != NULL"
	.balign 4, 0

ov45_022567D0: ; 0x022567D0
	.asciz "channel[0] != '\\0'"
	.balign 4, 0

ov45_022567E4: ; 0x022567E4
	.asciz "reason != NULL"
	.balign 4, 0

ov45_022567F4: ; 0x022567F4
	.asciz "message->numParams >= 2"
	.balign 4, 0

ov45_0225680C: ; 0x0225680C
	.asciz "message->numParams == 4"
	.balign 4, 0

ov45_02256824: ; 0x02256824
	.asciz " "
	.balign 4, 0

ov45_02256828: ; 0x02256828
	.asciz "nick[0] != '\\0'"
	.balign 4, 0

ov45_02256838: ; 0x02256838
	.asciz "nick[1] != '\\0'"
	.balign 4, 0

ov45_02256848: ; 0x02256848
	.asciz "message->numParams == 3"
	.balign 4, 0

ov45_02256860: ; 0x02256860
	.asciz "*"
	.balign 4, 0

ov45_02256864: ; 0x02256864
	.asciz "connection->connecting"
	.balign 4, 0

ov45_0225687C: ; 0x0225687C
	.asciz "message->numParams == 8"
	.balign 4, 0

ov45_02256894: ; 0x02256894
	.asciz "flags"
	.balign 4, 0

ov45_0225689C: ; 0x0225689C
	.asciz "len"
	.balign 4, 0

ov45_022568A0: ; 0x022568A0
	.asciz "message->numParams == 5"
	.balign 4, 0

ov45_022568B8: ; 0x022568B8
	.asciz "BCAST"
	.balign 4, 0

ov45_022568C0: ; 0x022568C0
	.asciz "b_"
	.balign 4, 0

ov45_022568C4: ; 0x022568C4
	.asciz "message->numParams >= 1"
	.balign 4, 0

ov45_022568DC: ; 0x022568DC
	.asciz "data != NULL"
	.balign 4, 0

ov45_022568EC: ; 0x022568EC
	.asciz "message->numParams >=3"
	.balign 4, 0

ov45_02256904: ; 0x02256904
	.asciz "message->numParams == 6"
	.balign 4, 0

ov45_0225691C: ; 0x0225691C
	.asciz "data->channel != NULL"
	.balign 4, 0

ov45_02256934: ; 0x02256934
	.asciz "data->channel[0] != '\\0'"
	.balign 4, 0

ov45_02256950: ; 0x02256950
	.asciz "MODE %s +b *!*@%s"
	.balign 4, 0

ov45_02256964: ; 0x02256964
	.asciz "message->numParams >= 3"
	.balign 4, 0

ov45_0225697C: ; 0x0225697C
	.asciz "data->numBans >= 0"
	.balign 4, 0

ov45_02256990: ; 0x02256990
	.asciz "USRIP"
	.balign 4, 0

ov45_02256998: ; 0x02256998
	.asciz "\\"
	.balign 4, 0

ov45_0225699C: ; 0x0225699C
	.asciz ""
	.balign 4, 0

ov45_022569A0: ; 0x022569A0
	.asciz "ciThink"
	.balign 4, 0

ov45_022569A8: ; 0x022569A8
	.asciz "ciSendNick"
	.balign 4, 0

ov45_022569B4: ; 0x022569B4
	.asciz "ciSendUser"
	.balign 4, 0

ov45_022569C0: ; 0x022569C0
	.asciz "ciNickError"
	.balign 4, 0

ov45_022569CC: ; 0x022569CC
	.asciz "ciSendLogin"
	.balign 4, 0

ov45_022569D8: ; 0x022569D8
	.asciz "chatInChannelA"
	.balign 4, 0

ov45_022569E8: ; 0x022569E8
	.asciz "chatDisconnect"
	.balign 4, 0

ov45_022569F8: ; 0x022569F8
	.asciz "chatEnumUsersA"
	.balign 4, 0

ov45_02256A08: ; 0x02256A08
	.asciz "chatConnectDoit"
	.balign 4, 0

ov45_02256A18: ; 0x02256A18
	.asciz "chatEnumChannelsA"
	.balign 4, 0

ov45_02256A2C: ; 0x02256A2C
	.asciz "chatEnterChannelA"
	.balign 4, 0

ov45_02256A40: ; 0x02256A40
	.asciz "chatLeaveChannelA"
	.balign 4, 0

ov45_02256A54: ; 0x02256A54
	.asciz "ciHandleDisconnect"
	.balign 4, 0

ov45_02256A68: ; 0x02256A68
	.asciz "chatRetryWithNickA"
	.balign 4, 0

ov45_02256A7C: ; 0x02256A7C
	.asciz "ciSendGetChannelKey"
	.balign 4, 0

ov45_02256A90: ; 0x02256A90
	.asciz "ciEnumUsersCallback"
	.balign 4, 0

ov45_02256AA4: ; 0x02256AA4
	.asciz "chatGetChannelKeysA"
	.balign 4, 0

ov45_02256AB8: ; 0x02256AB8
	.asciz "chatSetChannelKeysA"
	.balign 4, 0

ov45_02256ACC: ; 0x02256ACC
	.asciz "chatSetChannelModeA"
	.balign 4, 0

ov45_02256AE0: ; 0x02256AE0
	.asciz "chatGetChannelModeA"
	.balign 4, 0

ov45_02256AF4: ; 0x02256AF4
	.asciz "chatSetChannelLimitA"
	.balign 4, 0

ov45_02256B0C: ; 0x02256B0C
	.asciz "chatSendUserMessageA"
	.balign 4, 0

ov45_02256B24: ; 0x02256B24
	.asciz "ciProcessServerMessage"
	.balign 4, 0

ov45_02256B3C: ; 0x02256B3C
	.asciz "chatRegisterUniqueNickA"
	.balign 4, 0

ov45_02256B54: ; 0x02256B54
	.asciz "chatGetChannelNumUsersA"
	.balign 4, 0

ov45_02256B6C: ; 0x02256B6C
	.asciz "chatSendChannelMessageA"
	.balign 4, 0

ov45_02256B84: ; 0x02256B84
	.asciz "message != NULL"
	.balign 4, 0

ov45_02256B94: ; 0x02256B94
	.asciz "chatMain.c"
	.balign 4, 0

ov45_02256BA0: ; 0x02256BA0
	.asciz "chat != NULL"
	.balign 4, 0

ov45_02256BB0: ; 0x02256BB0
	.asciz "Disconnected"
	.balign 4, 0

ov45_02256BC0: ; 0x02256BC0
	.asciz "*"
	.balign 4, 0

ov45_02256BC4: ; 0x02256BC4
	.asciz "NICK %s"
	.balign 4, 0

ov45_02256BCC: ; 0x02256BCC
	.asciz "USER %s %s %s :%s"
	.balign 4, 0

ov45_02256BE0: ; 0x02256BE0
	.asciz "127.0.0.1"
	.balign 4, 0

ov45_02256BEC: ; 0x02256BEC
	.asciz "LOGINPREAUTH %s %s"
	.balign 4, 0

ov45_02256C00: ; 0x02256C00
	.asciz "LOGIN %d %s %s"
	.balign 4, 0

ov45_02256C10: ; 0x02256C10
	.asciz "LOGIN %d * %s :%s@%s"
	.balign 4, 0

ov45_02256C28: ; 0x02256C28
	.asciz "0"
	.balign 4, 0

ov45_02256C2C: ; 0x02256C2C
	.asciz ""
	.balign 4, 0

ov45_02256C30: ; 0x02256C30
	.asciz "serverAddress != NULL"
	.balign 4, 0

ov45_02256C48: ; 0x02256C48
	.asciz "callbacks != NULL"
	.balign 4, 0

ov45_02256C5C: ; 0x02256C5C
	.asciz "connectCallback != NULL"
	.balign 4, 0

ov45_02256C74: ; 0x02256C74
	.asciz "nick != NULL"
	.balign 4, 0

ov45_02256C84: ; 0x02256C84
	.asciz "nick[0] != '\\0'"
	.balign 4, 0

ov45_02256C94: ; 0x02256C94
	.asciz "strlen(nick) < MAX_NICK"
	.balign 4, 0

ov45_02256CAC: ; 0x02256CAC
	.asciz "namespaceID > 0"
	.balign 4, 0

ov45_02256CBC: ; 0x02256CBC
	.asciz "uniquenick && uniquenick[0]"
	.balign 4, 0

ov45_02256CD8: ; 0x02256CD8
	.asciz "password && password[0]"
	.balign 4, 0

ov45_02256CF0: ; 0x02256CF0
	.asciz "namespaceID >= 0"
	.balign 4, 0

ov45_02256D04: ; 0x02256D04
	.asciz "email && email[0]"
	.balign 4, 0

ov45_02256D18: ; 0x02256D18
	.asciz "profilenick && profilenick[0]"
	.balign 4, 0

ov45_02256D38: ; 0x02256D38
	.asciz "authtoken && authtoken[0]"
	.balign 4, 0

ov45_02256D54: ; 0x02256D54
	.asciz "partnerchallenge && partnerchallenge[0]"
	.balign 4, 0

ov45_02256D7C: ; 0x02256D7C
	.asciz "preauth"
	.balign 4, 0

ov45_02256D84: ; 0x02256D84
	.asciz "gamename && gamename[0]"
	.balign 4, 0

ov45_02256D9C: ; 0x02256D9C
	.asciz "secretKey && secretKey[0]"
	.balign 4, 0

ov45_02256DB8: ; 0x02256DB8
	.asciz "CRYPT des %d %s"
	.balign 4, 0

ov45_02256DC8: ; 0x02256DC8
	.asciz "USRIP"
	.balign 4, 0

ov45_02256DD0: ; 0x02256DD0
	.asciz "NICK :%s"
	.balign 4, 0

ov45_02256DDC: ; 0x02256DDC
	.asciz "REGISTERNICK %d %s %s"
	.balign 4, 0

ov45_02256DF4: ; 0x02256DF4
	.asciz "QUIT :Later!"
	.balign 4, 0

ov45_02256E04: ; 0x02256E04
	.asciz "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\"#$%&'()*+,-./:;<=>?@[]^_`{|}~"
	.balign 4, 0

ov45_02256E64: ; 0x02256E64
	.asciz "(callbackAll != NULL) || (callbackEach != NULL)"
	.balign 4, 0

ov45_02256E94: ; 0x02256E94
	.asciz "LIST %s"
	.balign 4, 0

ov45_02256E9C: ; 0x02256E9C
	.asciz "channel != NULL"
	.balign 4, 0

ov45_02256EAC: ; 0x02256EAC
	.asciz "channel[0] != '\\0'"
	.balign 4, 0

ov45_02256EC0: ; 0x02256EC0
	.asciz "JOIN %s %s"
	.balign 4, 0

ov45_02256ECC: ; 0x02256ECC
	.asciz "PART %s :%s"
	.balign 4, 0

ov45_02256ED8: ; 0x02256ED8
	.asciz "(type == CHAT_MESSAGE) || (type == CHAT_ACTION) || (type == CHAT_NOTICE) || (type == CHAT_UTM) || (type == CHAT_ATM)"
	.balign 4, 0

ov45_02256F50: ; 0x02256F50
	.asciz "PRIVMSG %s :%s"
	.balign 4, 0

ov45_02256F60: ; 0x02256F60
	.asciz "PRIVMSG %s :ACTION %s"
	.balign 4, 0

ov45_02256F78: ; 0x02256F78
	.asciz "NOTICE %s :%s"
	.balign 4, 0

ov45_02256F88: ; 0x02256F88
	.asciz "UTM %s :%s"
	.balign 4, 0

ov45_02256F94: ; 0x02256F94
	.asciz "ATM %s :%s"
	.balign 4, 0

ov45_02256FA0: ; 0x02256FA0
	.asciz "callback != NULL"
	.balign 4, 0

ov45_02256FB4: ; 0x02256FB4
	.asciz "mode != NULL"
	.balign 4, 0

ov45_02256FC4: ; 0x02256FC4
	.asciz "XiXpXsXmXnXtXlXe"
	.balign 4, 0

ov45_02256FD8: ; 0x02256FD8
	.asciz " %d"
	.balign 4, 0

ov45_02256FDC: ; 0x02256FDC
	.asciz "MODE %s %s"
	.balign 4, 0

ov45_02256FE8: ; 0x02256FE8
	.asciz "MODE %s"
	.balign 4, 0

ov45_02256FF0: ; 0x02256FF0
	.asciz "limit >= 0"
	.balign 4, 0

ov45_02256FFC: ; 0x02256FFC
	.asciz "MODE %s +l %d"
	.balign 4, 0

ov45_0225700C: ; 0x0225700C
	.asciz "MODE %s -l"
	.balign 4, 0

ov45_02257018: ; 0x02257018
	.asciz "numUsers >= 0"
	.balign 4, 0

ov45_02257028: ; 0x02257028
	.asciz "param != NULL"
	.balign 4, 0

ov45_02257038: ; 0x02257038
	.asciz "data->callback != NULL"
	.balign 4, 0

ov45_02257050: ; 0x02257050
	.asciz "NAMES %s"
	.balign 4, 0

ov45_0225705C: ; 0x0225705C
	.asciz "user != NULL"
	.balign 4, 0

ov45_0225706C: ; 0x0225706C
	.asciz "user[0] != '\\0'"
	.balign 4, 0

ov45_0225707C: ; 0x0225707C
	.asciz "strlen(user) < MAX_USER"
	.balign 4, 0

ov45_02257094: ; 0x02257094
	.asciz "\\%s\\%s"
	.balign 4, 0

ov45_0225709C: ; 0x0225709C
	.asciz "%03d"
	.balign 4, 0

ov45_022570A4: ; 0x022570A4
	.asciz "cookie && cookie[0]"
	.balign 4, 0

ov45_022570B8: ; 0x022570B8
	.asciz "num >= 0"
	.balign 4, 0

ov45_022570C4: ; 0x022570C4
	.asciz "SETCHANKEY %s :"
	.balign 4, 0

ov45_022570D4: ; 0x022570D4
	.asciz "SETCKEY %s %s :"
	.balign 4, 0

ov45_022570E4: ; 0x022570E4
	.asciz "channel && channel[0]"
	.balign 4, 0

ov45_022570FC: ; 0x022570FC
	.asciz "!num || keys"
	.balign 4, 0

ov45_0225710C: ; 0x0225710C
	.asciz "GETCHANKEY %s %s 0 :"
	.balign 4, 0

ov45_02257124: ; 0x02257124
	.asciz "GETCKEY %s %s %s 0 :"
	.balign 4, 0

ov45_0225713C: ; 0x0225713C
	.asciz "b_*"
	.balign 4, 0

ov45_02257140: ; 0x02257140
	.asciz "\\b_*"
	.balign 4, 0

ov45_02257148: ; 0x02257148
	.asciz "ciParseUser"
	.balign 4, 0

ov45_02257154: ; 0x02257154
	.asciz "ciSocketSend"
	.balign 4, 0

ov45_02257164: ; 0x02257164
	.asciz "ciSocketRecv"
	.balign 4, 0

ov45_02257174: ; 0x02257174
	.asciz "ciBufferInit"
	.balign 4, 0

ov45_02257184: ; 0x02257184
	.asciz "ciParseParam"
	.balign 4, 0

ov45_02257194: ; 0x02257194
	.asciz "ciSocketInit"
	.balign 4, 0

ov45_022571A4: ; 0x022571A4
	.asciz "ciSocketSendf"
	.balign 4, 0

ov45_022571B4: ; 0x022571B4
	.asciz "ciSocketThink"
	.balign 4, 0

ov45_022571C4: ; 0x022571C4
	.asciz "ciParseMessage"
	.balign 4, 0

ov45_022571D4: ; 0x022571D4
	.asciz "ciSocketConnect"
	.balign 4, 0

ov45_022571E4: ; 0x022571E4
	.asciz "ciBufferPreAppend"
	.balign 4, 0

ov45_022571F8: ; 0x022571F8
	.asciz "ciBufferClipFront"
	.balign 4, 0

ov45_0225720C: ; 0x0225720C
	.asciz "ciSocketThinkSend"
	.balign 4, 0

ov45_02257220: ; 0x02257220
	.asciz "ciSocketThinkRecv"
	.balign 4, 0

ov45_02257234: ; 0x02257234
	.asciz "ciSocketDisconnect"
	.balign 4, 0

ov45_02257248: ; 0x02257248
	.asciz "buffer != NULL"
	.balign 4, 0

ov45_02257258: ; 0x02257258
	.asciz "chatSocket.c"
	.balign 4, 0

ov45_02257268: ; 0x02257268
	.asciz "(buffer) != NULL"
	.balign 4, 0

ov45_0225727C: ; 0x0225727C
	.asciz "(buffer)->size >= 0"
	.balign 4, 0

ov45_02257290: ; 0x02257290
	.asciz "((buffer)->size % BUFFER_INC) == 0"
	.balign 4, 0

ov45_022572B4: ; 0x022572B4
	.asciz "(buffer)->length >= 0"
	.balign 4, 0

ov45_022572CC: ; 0x022572CC
	.asciz "(buffer)->length <= (buffer)->size"
	.balign 4, 0

ov45_022572F0: ; 0x022572F0
	.asciz "len >= 0"
	.balign 4, 0

ov45_022572FC: ; 0x022572FC
	.asciz "len <= SHRT_MAX"
	.balign 4, 0

ov45_0225730C: ; 0x0225730C
	.asciz "len <= buffer->length"
	.balign 4, 0

ov45_02257324: ; 0x02257324
	.asciz "sock != NULL"
	.balign 4, 0

ov45_02257334: ; 0x02257334
	.asciz "(sock) != NULL"
	.balign 4, 0

ov45_02257344: ; 0x02257344
	.asciz "((sock)->connectState == ciNotConnected) || ((sock)->connectState == ciConnected) || ((sock)->connectState == ciDisconnected)"
	.balign 4, 0

ov45_022573C4: ; 0x022573C4
	.asciz "(&(sock)->inputQueue) != NULL"
	.balign 4, 0

ov45_022573E4: ; 0x022573E4
	.asciz "(&(sock)->inputQueue)->size >= 0"
	.balign 4, 0

ov45_02257408: ; 0x02257408
	.asciz "((&(sock)->inputQueue)->size % BUFFER_INC) == 0"
	.balign 4, 0

ov45_02257438: ; 0x02257438
	.asciz "(&(sock)->inputQueue)->length >= 0"
	.balign 4, 0

ov45_0225745C: ; 0x0225745C
	.asciz "(&(sock)->inputQueue)->length <= (&(sock)->inputQueue)->size"
	.balign 4, 0

ov45_0225749C: ; 0x0225749C
	.asciz "(&(sock)->outputQueue) != NULL"
	.balign 4, 0

ov45_022574BC: ; 0x022574BC
	.asciz "(&(sock)->outputQueue)->size >= 0"
	.balign 4, 0

ov45_022574E0: ; 0x022574E0
	.asciz "((&(sock)->outputQueue)->size % BUFFER_INC) == 0"
	.balign 4, 0

ov45_02257514: ; 0x02257514
	.asciz "(&(sock)->outputQueue)->length >= 0"
	.balign 4, 0

ov45_02257538: ; 0x02257538
	.asciz "(&(sock)->outputQueue)->length <= (&(sock)->outputQueue)->size"
	.balign 4, 0

ov45_02257578: ; 0x02257578
	.asciz "serverAddress != NULL"
	.balign 4, 0

ov45_02257590: ; 0x02257590
	.asciz "port >= 0"
	.balign 4, 0

ov45_0225759C: ; 0x0225759C
	.asciz "port <= USHRT_MAX"
	.balign 4, 0

ov45_022575B0: ; 0x022575B0
	.asciz "sock->connectState == ciNotConnected"
	.balign 4, 0

ov45_022575D8: ; 0x022575D8
	.asciz "(sock)->connectState == ciConnected"
	.balign 4, 0

ov45_022575FC: ; 0x022575FC
	.asciz "0"
	.balign 4, 0

ov45_02257600: ; 0x02257600
	.asciz "pText != NULL"
	.balign 4, 0

ov45_02257610: ; 0x02257610
	.asciz "message != NULL"
	.balign 4, 0

ov45_02257620: ; 0x02257620
	.asciz " :"
	.balign 4, 0

ov45_02257624: ; 0x02257624
	.asciz " "
	.balign 4, 0

ov45_02257628: ; 0x02257628
	.byte 0x00, 0x00, 0x00, 0x00

ov45_0225762C: ; 0x0225762C
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_0225763C: ; 0x0225763C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_0225765C: ; 0x0225765C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_022576A0: ; 0x022576A0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov45_022576CC: ; 0x022576CC
	.asciz "&hash="
	.balign 4, 0

ov45_022576D4: ; 0x022576D4
	.asciz "error:"
	.balign 4, 0

ov45_022576DC: ; 0x022576DC
	.asciz "http://gamestats2.gs.nintendowifi.net/"
	.balign 4, 0

ov45_02257704: ; 0x02257704
	.asciz "http://sdkdev.gamespy.com/games/"
	.balign 4, 0

ov45_02257728: ; 0x02257728
	.asciz "http://ishikawa.servebeer.com/games/"
	.balign 4, 0

ov45_02257750: ; 0x02257750
	.asciz "&data="
	.balign 4, 0

ov45_02257758: ; 0x02257758
	.asciz "%d"
	.balign 4, 0

ov45_0225775C: ; 0x0225775C
	.asciz "?pid="
	.balign 4, 0

ov45_02257764: ; 0x02257764
	.asciz "%s%s%s?pid=%d&hash=%s&data="
	.balign 4, 0

ov45_02257780: ; 0x02257780
	.asciz "0000000000000000000000000000000000000000"
	.balign 4, 0

ov45_022577AC: ; 0x022577AC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_022577C4:
	.space 0x4

ov45_022577C8: ; 0x022577C8
	.space 0x4

ov45_022577CC: ; 0x022577CC
	.space 0x4

ov45_022577D0: ; 0x022577D0
	.space 0x4

ov45_022577D4: ; 0x022577D4
	.space 0x4

ov45_022577D8: ; 0x022577D8
	.space 0x4

ov45_022577DC: ; 0x022577DC
	.space 0x4

ov45_022577E0: ; 0x022577E0
	.space 0x4

ov45_022577E4: ; 0x022577E4
	.space 0x4

ov45_022577E8: ; 0x022577E8
	.space 0x8

ov45_022577F0: ; 0x022577F0
	.space 0x4

ov45_022577F4: ; 0x022577F4
	.space 0x4

ov45_022577F8: ; 0x022577F8
	.space 0x1000

ov45_022587F8: ; 0x022587F8
	.space 0x8
