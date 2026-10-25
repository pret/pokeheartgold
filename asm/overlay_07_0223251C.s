	.include "macros.inc"
	.include "overlay_07.inc"
	.include "global.inc"

    .text
    .public ov07_0223251C
    .public ov07_02232540
    .public ov07_02232580
    .public ov07_022325BC
    .public ov07_022325F4
    .public ov07_02232608
    .public ov07_0223261C
    .public ov07_02232630
    .public ov07_02232644
    .public ov07_02232658
    .public ov07_02232670

	thumb_func_start ov07_02232730
ov07_02232730: ; 0x02232730
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r1, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #3
	bls _02232744
	b _022329AC
_02232744:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02232750: ; jump table
	.short _02232758 - _02232750 - 2 ; case 0
	.short _022327F6 - _02232750 - 2 ; case 1
	.short _02232886 - _02232750 - 2 ; case 2
	.short _02232916 - _02232750 - 2 ; case 3
_02232758:
	ldr r1, [r4]
	mov r0, #0x5f
	bl NARC_New
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	add r0, r4, #0
	add r6, r4, #0
	str r0, [sp, #0x14]
	add r0, #0xa0
	mov r5, #0
	add r6, #0x10
	str r0, [sp, #0x14]
_02232774:
	ldr r0, [sp, #0x14]
	add r1, r5, #0
	bl CapsuleGetSealI
	add r7, r0, #0
	beq _022327E0
	bl SealOnCapsuleGetID
	cmp r0, #0
	beq _022327E0
	cmp r0, #0x51
	bge _022327E0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl CapsuleMenu_GetSealParticleIndex
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	str r7, [r0, #0x38]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _022327AE
	bl GF_AssertFail
_022327AE:
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [sp, #0x10]
	mov r3, #0
	bl ov07_0221FEE4
	ldr r1, [r4, #0x10]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #0x14]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _022327DA
	bne _022327E0
	bl GF_AssertFail
	b _022327E0
_022327DA:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_022327E0:
	add r5, r5, #1
	cmp r5, #2
	blt _02232774
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	add r4, #0x90
	add r0, r0, #1
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_022327F6:
	add r0, r4, #0
	add r6, r4, #0
	str r0, [sp, #0x18]
	add r0, #0xa0
	mov r5, #2
	add r6, #0x10
	str r0, [sp, #0x18]
_02232804:
	ldr r0, [sp, #0x18]
	add r1, r5, #0
	bl CapsuleGetSealI
	add r7, r0, #0
	beq _02232870
	bl SealOnCapsuleGetID
	cmp r0, #0
	beq _02232870
	cmp r0, #0x51
	bge _02232870
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl CapsuleMenu_GetSealParticleIndex
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	str r7, [r0, #0x38]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _0223283E
	bl GF_AssertFail
_0223283E:
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [sp, #4]
	mov r3, #0
	bl ov07_0221FEE4
	ldr r1, [r4, #0x10]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #0x14]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0223286A
	bne _02232870
	bl GF_AssertFail
	b _02232870
_0223286A:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_02232870:
	add r5, r5, #1
	cmp r5, #4
	blt _02232804
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	add r4, #0x90
	add r0, r0, #1
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_02232886:
	add r0, r4, #0
	add r6, r4, #0
	str r0, [sp, #0x1c]
	add r0, #0xa0
	mov r5, #4
	add r6, #0x10
	str r0, [sp, #0x1c]
_02232894:
	ldr r0, [sp, #0x1c]
	add r1, r5, #0
	bl CapsuleGetSealI
	add r7, r0, #0
	beq _02232900
	bl SealOnCapsuleGetID
	cmp r0, #0
	beq _02232900
	cmp r0, #0x51
	bge _02232900
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl CapsuleMenu_GetSealParticleIndex
	str r0, [sp, #8]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	str r7, [r0, #0x38]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _022328CE
	bl GF_AssertFail
_022328CE:
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [sp, #8]
	mov r3, #0
	bl ov07_0221FEE4
	ldr r1, [r4, #0x10]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #0x14]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _022328FA
	bne _02232900
	bl GF_AssertFail
	b _02232900
_022328FA:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_02232900:
	add r5, r5, #1
	cmp r5, #6
	blt _02232894
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	add r4, #0x90
	add r0, r0, #1
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_02232916:
	add r0, r4, #0
	add r6, r4, #0
	str r0, [sp, #0x20]
	add r0, #0xa0
	mov r5, #6
	add r6, #0x10
	str r0, [sp, #0x20]
_02232924:
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	bl CapsuleGetSealI
	add r7, r0, #0
	beq _02232990
	bl SealOnCapsuleGetID
	cmp r0, #0
	beq _02232990
	cmp r0, #0x51
	bge _02232990
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl CapsuleMenu_GetSealParticleIndex
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	str r7, [r0, #0x38]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _0223295E
	bl GF_AssertFail
_0223295E:
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [sp, #0xc]
	mov r3, #0
	bl ov07_0221FEE4
	ldr r1, [r4, #0x10]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #0x14]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0223298A
	bne _02232990
	bl GF_AssertFail
	b _02232990
_0223298A:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_02232990:
	add r5, r5, #1
	cmp r5, #8
	blt _02232924
	add r0, r4, #0
	mov r1, #0xff
	add r0, #0x90
	add r4, #0x8c
	str r1, [r0]
	ldr r0, [r4]
	bl NARC_Delete
	ldr r0, [sp]
	bl SysTask_Destroy
_022329AC:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_02232730

	thumb_func_start ov07_022329B0
ov07_022329B0: ; 0x022329B0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	bne _022329E0
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	bl ov07_022325F4
	add r2, r0, #0
	mov r0, #1
	str r0, [r4, #0x10]
	ldr r0, [r4]
	mov r1, #0x5f
	mov r3, #0
	bl ov07_0221FEB0
	str r0, [r4, #0x14]
	mov r0, #0xff
	add r4, #0x90
	str r0, [r4]
	pop {r4, pc}
_022329E0:
	mov r1, #0
	add r0, r4, #0
	mov r2, #0xfa
	str r1, [r4, #0x10]
	add r0, #0x90
	str r1, [r0]
	ldr r0, _02232A00 ; =ov07_02232730
	add r1, r4, #0
	lsl r2, r2, #2
	bl SysTask_CreateOnMainQueue
	add r1, r4, #0
	bl ov07_02232730
	pop {r4, pc}
	nop
_02232A00: .word ov07_02232730
	thumb_func_end ov07_022329B0

	thumb_func_start ov07_02232A04
ov07_02232A04: ; 0x02232A04
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xff
	bne _02232A10
	mov r0, #1
	bx lr
_02232A10:
	mov r0, #0
	bx lr
	thumb_func_end ov07_02232A04

	thumb_func_start ov07_02232A14
ov07_02232A14: ; 0x02232A14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #1
	add r0, #0x88
	str r1, [r0]
	bl ov07_0221C69C
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02232AFC
	mov r2, #0xfa
	ldr r0, _02232A40 ; =ov07_02232A5C
	add r1, r5, #0
	lsl r2, r2, #2
	bl SysTask_CreateOnMainQueue
	add r5, #0x84
	str r0, [r5]
	pop {r3, r4, r5, pc}
	nop
_02232A40: .word ov07_02232A5C
	thumb_func_end ov07_02232A14

	thumb_func_start ov07_02232A44
ov07_02232A44: ; 0x02232A44
	ldr r3, _02232A4C ; =ov07_02232A14
	ldr r1, _02232A50 ; =ov07_02232C28
	bx r3
	nop
_02232A4C: .word ov07_02232A14
_02232A50: .word ov07_02232C28
	thumb_func_end ov07_02232A44

	thumb_func_start ov07_02232A54
ov07_02232A54: ; 0x02232A54
	add r0, #0x88
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_02232A54

	thumb_func_start ov07_02232A5C
ov07_02232A5C: ; 0x02232A5C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	str r0, [sp]
	ldr r0, [r6, #0x10]
	mov r7, #0
	cmp r0, #9
	ble _02232A6E
	bl GF_AssertFail
_02232A6E:
	ldr r0, [r6, #0x10]
	mov r4, #0
	cmp r0, #0
	ble _02232AA6
	add r5, r6, #0
_02232A78:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _02232A9C
	bl sub_020154B0
	cmp r0, #0
	bne _02232A9A
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	beq _02232A9A
	ldr r0, [r5, #0x14]
	bl ov07_0221FF2C
	mov r0, #0
	str r0, [r5, #0x14]
	str r0, [r5, #0x5c]
	b _02232A9C
_02232A9A:
	mov r7, #1
_02232A9C:
	ldr r0, [r6, #0x10]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _02232A78
_02232AA6:
	cmp r7, #0
	bne _02232AB6
	mov r0, #0
	add r6, #0x88
	str r0, [r6]
	ldr r0, [sp]
	bl SysTask_Destroy
_02232AB6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02232A5C

	thumb_func_start ov07_02232AB8
ov07_02232AB8: ; 0x02232AB8
	ldr r3, _02232ABC ; =Heap_Free
	bx r3
	.balign 4, 0
_02232ABC: .word Heap_Free
	thumb_func_end ov07_02232AB8

	thumb_func_start ov07_02232AC0
ov07_02232AC0: ; 0x02232AC0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02232AF4
	ldr r0, [r4, #0xc]
	mov r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x18]
	mov r1, #0
	add r3, r4, #0
	bl sub_02015494
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02015528
	add r0, r5, #0
	bl SysTask_Destroy
	add r0, r4, #0
	bl Heap_Free
	pop {r3, r4, r5, pc}
_02232AF4:
	sub r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02232AC0

	thumb_func_start ov07_02232AFC
ov07_02232AFC: ; 0x02232AFC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, #0x94
	ldr r0, [r0]
	add r7, r1, #0
	cmp r0, #0
	bne _02232B3A
	add r0, r6, #0
	add r0, #0x98
	ldr r0, [r0]
	bl ov07_02232608
	add r5, r0, #0
	mov r4, #0
	cmp r5, #0
	ble _02232B2E
_02232B1C:
	ldr r0, [r6, #0x14]
	add r1, r4, #0
	add r2, r7, #0
	add r3, r6, #0
	bl sub_02015494
	add r4, r4, #1
	cmp r4, r5
	blt _02232B1C
_02232B2E:
	mov r1, #1
	str r1, [r6, #0x5c]
	ldr r0, [r6, #0x14]
	bl sub_02015528
	pop {r3, r4, r5, r6, r7, pc}
_02232B3A:
	ldr r0, [r6, #0x10]
	mov r7, #0
	cmp r0, #0
	ble _02232BA0
	add r0, r6, #0
	str r0, [sp]
	add r0, #0x5c
	add r5, r6, #0
	str r0, [sp]
_02232B4C:
	ldr r0, [r6]
	mov r1, #0x1c
	bl Heap_Alloc
	add r4, r0, #0
	bne _02232B5C
	bl GF_AssertFail
_02232B5C:
	str r7, [r4]
	ldr r0, [r6, #4]
	str r0, [r4, #8]
	ldr r0, _02232BA4 ; =ov07_02232C64
	str r0, [r4, #0x18]
	mov r0, #0
	str r0, [r5, #0x5c]
	ldr r0, [sp]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x14]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x38]
	str r0, [r4, #0x14]
	cmp r0, #0
	bne _02232B7E
	bl GF_AssertFail
_02232B7E:
	ldr r0, [r4, #0x14]
	bl ov07_02234530
	str r0, [r4, #4]
	ldr r0, _02232BA8 ; =ov07_02232AC0
	ldr r2, _02232BAC ; =0x000003E9
	add r1, r4, #0
	bl SysTask_CreateOnMainQueue
	ldr r0, [sp]
	add r7, r7, #1
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [r6, #0x10]
	add r5, r5, #4
	cmp r7, r0
	blt _02232B4C
_02232BA0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232BA4: .word ov07_02232C64
_02232BA8: .word ov07_02232AC0
_02232BAC: .word 0x000003E9
	thumb_func_end ov07_02232AFC

	thumb_func_start ov07_02232BB0
ov07_02232BB0: ; 0x02232BB0
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r3, #1
	add r5, r0, #0
	add r4, r1, #0
	bl ov07_02231DE0
	cmp r5, #5
	bhi _02232C06
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02232BCE: ; jump table
	.short _02232BDA - _02232BCE - 2 ; case 0
	.short _02232BE2 - _02232BCE - 2 ; case 1
	.short _02232BEC - _02232BCE - 2 ; case 2
	.short _02232BF4 - _02232BCE - 2 ; case 3
	.short _02232BFE - _02232BCE - 2 ; case 4
	.short _02232C06 - _02232BCE - 2 ; case 5
_02232BDA:
	mov r5, #0
	add r0, r5, #0
	sub r0, #0x10
	b _02232C0E
_02232BE2:
	mov r5, #0xe
	mvn r5, r5
	add r0, r5, #0
	sub r0, #0xa
	b _02232C0E
_02232BEC:
	mov r5, #7
	mvn r5, r5
	sub r0, r5, #4
	b _02232C0E
_02232BF4:
	mov r5, #0xd
	mvn r5, r5
	add r0, r5, #0
	sub r0, #0xb
	b _02232C0E
_02232BFE:
	mov r5, #7
	mvn r5, r5
	sub r0, r5, #4
	b _02232C0E
_02232C06:
	mov r5, #0xf
	mvn r5, r5
	add r0, r5, #0
	sub r0, #0xd
_02232C0E:
	add r5, #0xa
	ldr r3, [r4]
	mov r1, #0xac
	add r2, r5, #0
	mul r2, r1
	sub r2, r3, r2
	str r2, [r4]
	add r0, #0x20
	ldr r2, [r4, #4]
	mul r1, r0
	sub r0, r2, r1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02232BB0

	thumb_func_start ov07_02232C28
ov07_02232C28: ; 0x02232C28
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_02015504
	ldr r0, [r0, #4]
	add r1, sp, #0
	bl ov07_02232BB0
	ldr r0, [r4, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r1, r0
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r4, #0x30]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02232C28

	thumb_func_start ov07_02232C64
ov07_02232C64: ; 0x02232C64
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_02015504
	add r4, r0, #0
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl ov07_02232BB0
	ldr r0, [r4, #0x14]
	bl SealOnCapsuleGetID
	bl CapsuleMenu_IsAlphabetSeal
	ldr r0, [r4, #0x14]
	bl SealOnCapsuleGetX
	add r6, r0, #0
	ldr r0, [r4, #0x14]
	bl SealOnCapsuleGetY
	sub r6, #0xbe
	lsl r1, r6, #0x10
	asr r3, r1, #0x10
	ldr r2, [sp]
	mov r1, #0xac
	add r4, r3, #0
	mul r4, r1
	add r3, r2, r4
	mov r4, #0x64
	sub r0, r4, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	ldr r2, [sp, #4]
	mul r1, r0
	add r0, r2, r1
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r3, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r5, #0x30]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov07_02232C64

	thumb_func_start ov07_02232CD8
ov07_02232CD8: ; 0x02232CD8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02015504
	mov r1, #2
	ldrsh r2, [r0, r1]
	mov r1, #0x64
	mov r3, #0xac
	sub r1, r1, r2
	lsl r1, r1, #0x10
	asr r2, r1, #0x10
	add r1, r2, #0
	mov r2, #0
	ldrsh r0, [r0, r2]
	mul r1, r3
	sub r0, #0x81
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add r2, r0, #0
	ldr r0, [r4, #0x20]
	mul r2, r3
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r2, r0
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	str r0, [r4, #0x30]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02232CD8

	thumb_func_start ov07_02232D20
ov07_02232D20: ; 0x02232D20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	mov r1, #0x24
	bl Heap_Alloc
	add r4, r0, #0
	bne _02232D34
	bl GF_AssertFail
_02232D34:
	ldmia r5!, {r0, r1}
	add r2, r4, #0
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	str r0, [r2]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02232D58
	ldr r0, _02232D7C ; =0x00000403
	bl ov07_0223261C
	str r0, [r4, #0x20]
	ldr r0, _02232D7C ; =0x00000403
	bl ov07_02232630
	b _02232D66
_02232D58:
	ldr r0, [r4, #4]
	bl ov07_0223261C
	str r0, [r4, #0x20]
	ldr r0, [r4, #4]
	bl ov07_02232630
_02232D66:
	str r0, [r4, #0x1c]
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x20]
	mov r1, #0x5f
	mov r3, #0
	bl ov07_0221FEB0
	str r0, [r4, #0x18]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02232D7C: .word 0x00000403
	thumb_func_end ov07_02232D20

	thumb_func_start ov07_02232D80
ov07_02232D80: ; 0x02232D80
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5, #0xc]
	cmp r1, #0xff
	bne _02232DDA
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _02232DB0
	ldr r0, [r5, #0x1c]
	mov r4, #0
	cmp r0, #0
	ble _02232DE4
	ldr r6, _02232DF0 ; =ov07_02232CD8
_02232D9A:
	ldr r0, [r5, #0x18]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_02015494
	ldr r0, [r5, #0x1c]
	add r4, r4, #1
	cmp r4, r0
	blt _02232D9A
	b _02232DE4
_02232DB0:
	ldr r0, [r5, #0x1c]
	mov r4, #0
	cmp r0, #0
	ble _02232DE4
	ldr r6, _02232DF0 ; =ov07_02232CD8
_02232DBA:
	ldr r0, [r5, #4]
	bl ov07_02232644
	cmp r4, r0
	beq _02232DD0
	ldr r0, [r5, #0x18]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_02015494
_02232DD0:
	ldr r0, [r5, #0x1c]
	add r4, r4, #1
	cmp r4, r0
	blt _02232DBA
	b _02232DE4
_02232DDA:
	ldr r0, [r5, #0x18]
	ldr r2, _02232DF0 ; =ov07_02232CD8
	add r3, r5, #0
	bl sub_02015494
_02232DE4:
	ldr r0, [r5, #0x18]
	mov r1, #1
	bl sub_02015528
	pop {r4, r5, r6, pc}
	nop
_02232DF0: .word ov07_02232CD8
	thumb_func_end ov07_02232D80

	thumb_func_start ov07_02232DF4
ov07_02232DF4: ; 0x02232DF4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	bl sub_020154B0
	cmp r0, #0
	bne _02232E0C
	ldr r0, [r4, #0x18]
	bl ov07_0221FF2C
	mov r0, #0
	pop {r4, pc}
_02232E0C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232DF4

	thumb_func_start ov07_02232E10
ov07_02232E10: ; 0x02232E10
	ldr r3, _02232E14 ; =Heap_Free
	bx r3
	.balign 4, 0
_02232E14: .word Heap_Free
	thumb_func_end ov07_02232E10

	thumb_func_start ov07_02232E18
ov07_02232E18: ; 0x02232E18
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232E2C
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #1
	bl ov07_02233EB8
_02232E2C:
	add r0, r4, #0
	mov r1, #2
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232E3C
	mov r0, #0
	pop {r4, pc}
_02232E3C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232E18

	thumb_func_start ov07_02232E40
ov07_02232E40: ; 0x02232E40
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232E54
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #3
	bl ov07_02233EB8
_02232E54:
	add r0, r4, #0
	mov r1, #4
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232E64
	mov r0, #0
	pop {r4, pc}
_02232E64:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232E40

	thumb_func_start ov07_02232E68
ov07_02232E68: ; 0x02232E68
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232E7C
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #5
	bl ov07_02233EB8
_02232E7C:
	add r0, r4, #0
	mov r1, #6
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232E8C
	mov r0, #0
	pop {r4, pc}
_02232E8C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232E68

	thumb_func_start ov07_02232E90
ov07_02232E90: ; 0x02232E90
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232EA4
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #7
	bl ov07_02233EB8
_02232EA4:
	add r0, r4, #0
	mov r1, #0xe
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232EB4
	mov r0, #0
	pop {r4, pc}
_02232EB4:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232E90

	thumb_func_start ov07_02232EB8
ov07_02232EB8: ; 0x02232EB8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232ECC
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #0xf
	bl ov07_02233EB8
_02232ECC:
	add r0, r4, #0
	mov r1, #0x12
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232EDC
	mov r0, #0
	pop {r4, pc}
_02232EDC:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232EB8

	thumb_func_start ov07_02232EE0
ov07_02232EE0: ; 0x02232EE0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232EF4
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #0x13
	bl ov07_02233EB8
_02232EF4:
	add r0, r4, #0
	mov r1, #0x1b
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232F04
	mov r0, #0
	pop {r4, pc}
_02232F04:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232EE0

	thumb_func_start ov07_02232F08
ov07_02232F08: ; 0x02232F08
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232F1C
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #0x15
	bl ov07_02233EB8
_02232F1C:
	add r0, r4, #0
	mov r1, #0x16
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232F2C
	mov r0, #0
	pop {r4, pc}
_02232F2C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232F08

	thumb_func_start ov07_02232F30
ov07_02232F30: ; 0x02232F30
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232F44
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #0x17
	bl ov07_02233EB8
_02232F44:
	add r0, r4, #0
	mov r1, #0x1b
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232F54
	mov r0, #0
	pop {r4, pc}
_02232F54:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232F30

	thumb_func_start UnkBallData_SetBallAnimation
UnkBallData_SetBallAnimation: ; 0x02232F58
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	thumb_func_end UnkBallData_SetBallAnimation

	thumb_func_start ov07_02232F60
ov07_02232F60: ; 0x02232F60
	push {r3, lr}
	ldr r1, [r0]
	lsl r2, r1, #2
	ldr r1, _02232F70 ; =ov07_022371B8
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_02232F70: .word ov07_022371B8
	thumb_func_end ov07_02232F60

	thumb_func_start ov07_02232F74
ov07_02232F74: ; 0x02232F74
	str r1, [r0, #0x14]
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov07_02232F74

	thumb_func_start ov07_02232F80
ov07_02232F80: ; 0x02232F80
	mov r0, #1
	bx lr
	thumb_func_end ov07_02232F80

	thumb_func_start ov07_02232F84
ov07_02232F84: ; 0x02232F84
	push {r4, lr}
	add r4, r0, #0
	bl ov07_022335B4
	cmp r0, #0
	bne _02232F98
	add r0, r4, #0
	mov r1, #2
	bl ov07_02232F74
_02232F98:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232F84

	thumb_func_start ov07_02232F9C
ov07_02232F9C: ; 0x02232F9C
	push {r3, lr}
	mov r1, #3
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_02232F9C

	thumb_func_start ov07_02232FA8
ov07_02232FA8: ; 0x02232FA8
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _02233078
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02232FC0: ; jump table
	.short _02232FC8 - _02232FC0 - 2 ; case 0
	.short _0223301E - _02232FC0 - 2 ; case 1
	.short _02233034 - _02232FC0 - 2 ; case 2
	.short _02233050 - _02232FC0 - 2 ; case 3
_02232FC8:
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl ManagedSprite_SetAnim
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	add r2, sp, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, sp, #0
	str r0, [sp, #8]
	mov r0, #0xff
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x30]
	add r2, #2
	bl ManagedSprite_GetPositionXY
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xb4
	add r1, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_0221FDFC
	add r1, r4, #0
	add r1, #0xd8
	str r0, [r1]
	add r0, sp, #0
	bl ov07_02232D20
	add r1, r4, #0
	add r1, #0xd0
	str r0, [r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233080
_0223301E:
	ldr r0, [r4, #0x30]
	bl ManagedSprite_GetAnimationFrame
	cmp r0, #2
	blt _02233080
	mov r0, #0
	str r0, [r4, #0x24]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233080
_02233034:
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232D80
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	bl ov07_0221FE08
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233080
_02233050:
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232DF4
	cmp r0, #0
	bne _02233080
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232E10
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233080
_02233078:
	add r0, r4, #0
	mov r1, #4
	bl ov07_02232F74
_02233080:
	mov r0, #1
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02232FA8

	thumb_func_start ov07_02233088
ov07_02233088: ; 0x02233088
	mov r0, #1
	bx lr
	thumb_func_end ov07_02233088

	thumb_func_start ov07_0223308C
ov07_0223308C: ; 0x0223308C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _022330CC
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x30]
	add r1, #0xb8
	add r2, #0xba
	bl ManagedSprite_GetPositionXY
	add r0, r4, #0
	mov r1, #0x3c
	add r0, #0xbc
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0xb4
	add r0, #0xbe
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0xa
	add r0, #0xc0
	str r1, [r0]
	add r0, r4, #0
	mov r1, #0xc
	add r0, #0xc8
	str r1, [r0]
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _022330DC
_022330CC:
	bl ov07_022335B4
	cmp r0, #0
	bne _022330DC
	add r0, r4, #0
	mov r1, #6
	bl ov07_02232F74
_022330DC:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_0223308C

	thumb_func_start ov07_022330E0
ov07_022330E0: ; 0x022330E0
	mov r0, #1
	bx lr
	thumb_func_end ov07_022330E0

	thumb_func_start ov07_022330E4
ov07_022330E4: ; 0x022330E4
	push {r3, lr}
	mov r1, #8
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022330E4

	thumb_func_start ov07_022330F0
ov07_022330F0: ; 0x022330F0
	push {r3, lr}
	mov r1, #9
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022330F0

	thumb_func_start ov07_022330FC
ov07_022330FC: ; 0x022330FC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0223310E
	cmp r0, #1
	beq _02233142
	b _02233184
_0223310E:
	ldr r0, [r4, #0x30]
	bl ManagedSprite_GetPaletteOverrideOffset
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r0, _022331A0 ; =0x0000037F
	mov r3, #1
	add r5, r3, #0
	str r0, [sp, #8]
	add r0, r4, #0
	lsl r5, r2
	add r0, #0xb0
	lsl r2, r5, #0x10
	ldr r0, [r0]
	mov r1, #4
	lsr r2, r2, #0x10
	sub r3, r3, #2
	bl PaletteData_BeginPaletteFade
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223319A
_02233142:
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl PaletteData_GetSelectedBuffersBitmask
	cmp r0, #0
	bne _0223319A
	ldr r0, [r4, #0x30]
	bl ManagedSprite_GetPaletteOverrideOffset
	add r2, r0, #0
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _022331A0 ; =0x0000037F
	mov r3, #1
	add r5, r3, #0
	str r0, [sp, #8]
	add r0, r4, #0
	lsl r5, r2
	add r0, #0xb0
	lsl r2, r5, #0x10
	ldr r0, [r0]
	mov r1, #4
	lsr r2, r2, #0x10
	sub r3, r3, #2
	bl PaletteData_BeginPaletteFade
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223319A
_02233184:
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl PaletteData_GetSelectedBuffersBitmask
	cmp r0, #0
	bne _0223319A
	add r0, r4, #0
	mov r1, #0xa
	bl ov07_02232F74
_0223319A:
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_022331A0: .word 0x0000037F
	thumb_func_end ov07_022330FC

	thumb_func_start ov07_022331A4
ov07_022331A4: ; 0x022331A4
	push {r3, lr}
	mov r1, #0xb
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022331A4

	thumb_func_start ov07_022331B0
ov07_022331B0: ; 0x022331B0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _022331C2
	cmp r0, #1
	beq _02233202
	b _0223321E
_022331C2:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #1
	blt _0223321E
	add r1, sp, #8
	ldr r0, [r4, #0x30]
	add r1, #2
	add r2, sp, #8
	bl ManagedSprite_GetPositionXY
	add r1, sp, #8
	mov r0, #0
	ldrsh r3, [r1, r0]
	mov r0, #2
	ldrsh r1, [r1, r0]
	add r0, r3, #0
	add r0, #0x20
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x48
	add r2, r1, #0
	bl ov07_02222268
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223321E
_02233202:
	add r0, r4, #0
	ldr r1, [r4, #0x30]
	add r0, #0x48
	bl ov07_022222F0
	cmp r0, #0
	bne _0223321E
	ldr r0, [r4, #8]
	mov r1, #0xd
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	bl ov07_02232F74
_0223321E:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov07_022331B0

	thumb_func_start ov07_02233224
ov07_02233224: ; 0x02233224
	mov r0, #1
	bx lr
	thumb_func_end ov07_02233224

	thumb_func_start ov07_02233228
ov07_02233228: ; 0x02233228
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02233238
	cmp r1, #1
	beq _0223324E
	b _022332AE
_02233238:
	ldr r0, [r5, #0x30]
	mov r1, #1
	bl ManagedSprite_SetAnim
	ldr r0, [r5, #0x30]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223324E:
	ldr r1, [r5, #0xc]
	mov r0, #6
	add r2, r1, #0
	mul r2, r0
	ldr r0, _022332B8 ; =ov07_0223730E
	ldr r1, _022332BC ; =ov07_02237310
	ldrsh r0, [r0, r2]
	ldrh r1, [r1, r2]
	str r0, [sp]
	ldr r0, [r5, #0x30]
	bl ManagedSprite_SetAnimationFrame
	ldr r0, [r5, #0xc]
	ldr r4, _022332C0 ; =ov07_02237200
	add r0, r0, #1
	str r0, [r5, #0xc]
	mov r6, #0
	mov r7, #0x75
_02233272:
	ldr r1, [r5, #0xc]
	ldr r0, [r4]
	cmp r1, r0
	bne _02233286
	ldr r0, [r4, #4]
	add r1, r7, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl Sound_PlayPannedEffect
_02233286:
	add r6, r6, #1
	add r4, #8
	cmp r6, #5
	blt _02233272
	ldr r0, [r5, #0xc]
	cmp r0, #0x14
	bgt _0223329A
	ldr r0, [sp]
	cmp r0, #0xff
	bne _022332A2
_0223329A:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _022332B4
_022332A2:
	ldr r0, [r5, #0x30]
	ldr r2, [sp]
	mov r1, #0
	bl ManagedSprite_OffsetPositionXY
	b _022332B4
_022332AE:
	mov r1, #0xe
	bl ov07_02232F74
_022332B4:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022332B8: .word ov07_0223730E
_022332BC: .word ov07_02237310
_022332C0: .word ov07_02237200
	thumb_func_end ov07_02233228

	thumb_func_start ov07_022332C4
ov07_022332C4: ; 0x022332C4
	mov r0, #1
	bx lr
	thumb_func_end ov07_022332C4

	thumb_func_start ov07_022332C8
ov07_022332C8: ; 0x022332C8
	push {r3, lr}
	ldr r1, [r0, #0xc]
	add r1, r1, #1
	str r1, [r0, #0xc]
	cmp r1, #0xe
	blt _022332E4
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	mov r1, #0
	str r1, [r0, #0xc]
	mov r1, #0x10
	bl ov07_02232F74
_022332E4:
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022332C8

	thumb_func_start ov07_022332E8
ov07_022332E8: ; 0x022332E8
	push {r3, lr}
	mov r1, #0x11
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022332E8

	thumb_func_start ov07_022332F4
ov07_022332F4: ; 0x022332F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02233304
	cmp r0, #1
	beq _02233314
	b _0223337C
_02233304:
	ldr r0, [r5, #0x18]
	cmp r0, #3
	blt _0223330E
	bl GF_AssertFail
_0223330E:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02233314:
	ldr r1, [r5, #0x18]
	mov r0, #0x18
	add r3, r1, #0
	mul r3, r0
	ldr r0, _02233380 ; =ov07_02237254
	ldr r1, [r5, #0xc]
	add r0, r0, r3
	lsl r2, r1, #1
	ldrsh r4, [r2, r0]
	add r0, r1, #1
	str r0, [r5, #0xc]
	cmp r0, #0xb
	bgt _02233332
	cmp r4, #0xff
	bne _02233352
_02233332:
	ldr r0, [r5, #8]
	mov r1, #0
	add r0, r0, #1
	str r0, [r5, #8]
	ldr r0, [r5, #0x18]
	add r0, r0, #1
	str r0, [r5, #0x18]
	ldr r0, [r5, #0x30]
	bl ManagedSprite_SetAffineZRotation
	add r0, r5, #0
	mov r1, #0x12
	bl ov07_02232F74
	mov r0, #1
	pop {r3, r4, r5, pc}
_02233352:
	cmp r0, #5
	bne _0223335E
	ldr r0, _02233384 ; =0x000005FD
	mov r1, #0x75
	bl Sound_PlayPannedEffect
_0223335E:
	ldr r0, [r5, #0x30]
	add r1, r4, #0
	mov r2, #0
	bl ManagedSprite_OffsetPositionXY
	ldr r0, _02233388 ; =0x0001FFFE
	mov r1, #0x5a
	mul r0, r4
	lsl r1, r1, #2
	bl _s32_div_f
	add r1, r0, #0
	ldr r0, [r5, #0x30]
	bl ManagedSprite_OffsetAffineZRotation
_0223337C:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02233380: .word ov07_02237254
_02233384: .word 0x000005FD
_02233388: .word 0x0001FFFE
	thumb_func_end ov07_022332F4

	thumb_func_start ov07_0223338C
ov07_0223338C: ; 0x0223338C
	mov r0, #1
	bx lr
	thumb_func_end ov07_0223338C

	thumb_func_start ov07_02233390
ov07_02233390: ; 0x02233390
	push {r3, lr}
	mov r1, #0x14
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_02233390

	thumb_func_start ov07_0223339C
ov07_0223339C: ; 0x0223339C
	push {r3, lr}
	mov r1, #0x1b
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_0223339C

	thumb_func_start ov07_022333A8
ov07_022333A8: ; 0x022333A8
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _0223347C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022333C0: ; jump table
	.short _022333C8 - _022333C0 - 2 ; case 0
	.short _022333FA - _022333C0 - 2 ; case 1
	.short _02233442 - _022333C0 - 2 ; case 2
	.short _02233454 - _022333C0 - 2 ; case 3
_022333C8:
	ldr r0, [r4, #0x30]
	bl ManagedSprite_GetPaletteOverrideOffset
	mov r1, #0
	mov r3, #1
	add r2, r0, #0
	add r5, r3, #0
	lsl r5, r2
	lsl r2, r5, #0x10
	str r1, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	str r1, [sp, #8]
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #4
	lsr r2, r2, #0x10
	sub r3, r3, #6
	bl PaletteData_BeginPaletteFade
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233492
_022333FA:
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl PaletteData_GetSelectedBuffersBitmask
	cmp r0, #0
	bne _02233492
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	add r1, r4, #0
	str r0, [sp, #0x10]
	add r1, #0x94
	ldr r1, [r1]
	str r1, [sp, #0x14]
	bl ov07_02232644
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	add r2, sp, #0xc
	ldr r0, [r4, #0x30]
	add r1, sp, #0xc
	add r2, #2
	bl ManagedSprite_GetPositionXY
	add r0, sp, #0xc
	bl ov07_02232D20
	add r1, r4, #0
	add r1, #0xd0
	str r0, [r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233492
_02233442:
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232D80
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233492
_02233454:
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232DF4
	cmp r0, #0
	bne _02233492
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232E10
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233492
_0223347C:
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl PaletteData_GetSelectedBuffersBitmask
	cmp r0, #0
	bne _02233492
	add r0, r4, #0
	mov r1, #0x16
	bl ov07_02232F74
_02233492:
	mov r0, #1
	add sp, #0x20
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022333A8

	thumb_func_start ov07_02233498
ov07_02233498: ; 0x02233498
	mov r0, #1
	bx lr
	thumb_func_end ov07_02233498

	thumb_func_start ov07_0223349C
ov07_0223349C: ; 0x0223349C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _022334AE
	cmp r1, #1
	beq _022334E0
	b _022334F4
_022334AE:
	ldr r0, [r4, #0x30]
	bl ManagedSprite_GetPaletteOverrideOffset
	add r2, r0, #0
	mov r0, #0xa
	str r0, [sp]
	mov r0, #0
	mov r3, #1
	add r5, r3, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	lsl r5, r2
	add r0, #0xb0
	lsl r2, r5, #0x10
	ldr r0, [r0]
	mov r1, #4
	lsr r2, r2, #0x10
	sub r3, r3, #6
	bl PaletteData_BeginPaletteFade
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022334FA
_022334E0:
	add r0, #0xb0
	ldr r0, [r0]
	bl PaletteData_GetSelectedBuffersBitmask
	cmp r0, #0
	bne _022334FA
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022334FA
_022334F4:
	mov r1, #0x18
	bl ov07_02232F74
_022334FA:
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_0223349C

	thumb_func_start ov07_02233500
ov07_02233500: ; 0x02233500
	push {r3, lr}
	mov r1, #0x19
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_02233500

	thumb_func_start ov07_0223350C
ov07_0223350C: ; 0x0223350C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0223351C
	cmp r1, #1
	beq _0223352A
	b _02233582
_0223351C:
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl ManagedSprite_SetOamMode
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223352A:
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _02233552
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x20
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x21
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x21
	strb r1, [r0]
	b _0223356E
_02233552:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x20
	strb r1, [r0]
	add r0, r4, #0
	mov r2, #0xf
	add r0, #0x21
	strb r2, [r0]
	ldr r0, [r4, #0x30]
	bl ManagedSprite_SetDrawFlag
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223356E:
	add r0, r4, #0
	add r0, #0x20
	add r4, #0x21
	ldrb r1, [r0]
	ldrb r0, [r4]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0223358C ; =0x04000052
	strh r1, [r0]
	b _02233588
_02233582:
	mov r1, #0x1a
	bl ov07_02232F74
_02233588:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0223358C: .word 0x04000052
	thumb_func_end ov07_0223350C

	thumb_func_start ov07_02233590
ov07_02233590: ; 0x02233590
	push {r3, lr}
	mov r1, #0x1b
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_02233590

	thumb_func_start ov07_0223359C
ov07_0223359C: ; 0x0223359C
	mov r0, #0
	bx lr
	thumb_func_end ov07_0223359C

	thumb_func_start ov07_022335A0
ov07_022335A0: ; 0x022335A0
	push {r3, lr}
	ldr r1, [r0, #0x14]
	lsl r2, r1, #2
	ldr r1, _022335B0 ; =ov07_0223729C
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_022335B0: .word ov07_0223729C
	thumb_func_end ov07_022335A0

	thumb_func_start ov07_022335B4
ov07_022335B4: ; 0x022335B4
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bls _022335C2
	b _022337C2
_022335C2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022335CE: ; jump table
	.short _022335D6 - _022335CE - 2 ; case 0
	.short _02233644 - _022335CE - 2 ; case 1
	.short _0223373E - _022335CE - 2 ; case 2
	.short _022337A2 - _022335CE - 2 ; case 3
_022335D6:
	mov r0, #0xba
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	mov r2, #0xb8
	str r0, [sp]
	mov r0, #0xbe
	ldrsh r0, [r4, r0]
	mov r3, #0xbc
	add r1, #0x6c
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0xc8
	ldr r0, [r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, #0x48
	bl ov07_02222338
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	add r0, #0xd4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232540
	cmp r0, #1
	bne _0223372C
	bl LCRandom
	mov r1, #0x14
	bl _s32_div_f
	add r1, #0xa
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xd
	bl ManagedSprite_OffsetAffineZRotation
	b _0223385E
_02233644:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232540
	cmp r0, #1
	bne _022336E2
	mov r1, #2
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xc
	bl ManagedSprite_OffsetAffineZRotation
	add r0, r4, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	add r0, #0xa
	cmp r2, r0
	ble _0223367E
	mov r1, #2
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xc
	bl ManagedSprite_OffsetAffineZRotation
_0223367E:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232580
	cmp r0, #1
	bne _022336E2
	add r0, r4, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	add r0, #0xa
	cmp r2, r0
	bne _022336E2
	ldr r0, [r4, #0x30]
	bl ManagedSprite_GetPaletteOverrideOffset
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	add r1, r4, #0
	lsl r3, r3, #0x14
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _02233864 ; =0x0000FFFF
	add r1, #0x94
	str r0, [sp, #0x14]
	ldr r0, _02233868 ; =0x000003EA
	lsr r3, r3, #0x10
	str r0, [sp, #0x18]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_02222F10
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
_022336E2:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #6
	blt _0223371A
	cmp r0, #8
	bgt _0223371A
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r2, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	ldr r1, [r0]
	cmp r1, r2
	ble _0223371A
	add r0, r2, #5
	cmp r1, r0
	blt _0223372C
_0223371A:
	add r0, r4, #0
	add r1, r4, #0
	ldr r2, [r4, #0x30]
	add r0, #0x48
	add r1, #0x6c
	bl ov07_022223CC
	cmp r0, #0
	beq _0223372E
_0223372C:
	b _0223385E
_0223372E:
	add r0, r4, #0
	mov r1, #0
	bl ov07_022344B4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223385E
_0223373E:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232580
	cmp r0, #1
	bne _02233772
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02233772
	bl ov07_02222EE8
	cmp r0, #1
	beq _0223385E
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	bl ov07_02222EF8
	mov r0, #1
	str r0, [r4, #0x28]
	add sp, #0x1c
	mov r0, #0
	pop {r3, r4, pc}
_02233772:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xf
	blt _02233786
	mov r0, #1
	str r0, [r4, #0x28]
	add sp, #0x1c
	mov r0, #0
	pop {r3, r4, pc}
_02233786:
	add r0, r4, #0
	add r0, #0xa0
	ldr r1, [r0]
	ldr r0, _0223386C ; =0x00000401
	cmp r1, r0
	bne _0223379A
	ldr r0, _02233870 ; =0x000007E8
	mov r1, #0x75
	bl Sound_PlayPannedEffect
_0223379A:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223385E
_022337A2:
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl ManagedSprite_SetAnim
	add r0, r4, #0
	mov r1, #1
	bl ov07_022344C0
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223385E
_022337C2:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #5
	bne _0223381C
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xc
	beq _02233818
	cmp r0, #0xd
	beq _02233818
	ldr r0, [r4, #0x30]
	bl ManagedSprite_GetPaletteOverrideOffset
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	add r1, r4, #0
	lsl r3, r3, #0x14
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _02233864 ; =0x0000FFFF
	add r1, #0x94
	str r0, [sp, #0x14]
	ldr r0, _02233868 ; =0x000003EA
	lsr r3, r3, #0x10
	str r0, [sp, #0x18]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_02222F10
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
_02233818:
	mov r0, #1
	str r0, [r4, #0x28]
_0223381C:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0xf
	ble _0223385E
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xc
	beq _02233858
	cmp r0, #0xd
	beq _02233858
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	bl ov07_02222EE8
	cmp r0, #1
	beq _0223385E
	add r4, #0xd4
	ldr r0, [r4]
	bl ov07_02222EF8
_02233858:
	add sp, #0x1c
	mov r0, #0
	pop {r3, r4, pc}
_0223385E:
	mov r0, #1
	add sp, #0x1c
	pop {r3, r4, pc}
	.balign 4, 0
_02233864: .word 0x0000FFFF
_02233868: .word 0x000003EA
_0223386C: .word 0x00000401
_02233870: .word 0x000007E8
	thumb_func_end ov07_022335B4

	thumb_func_start ov07_02233874
ov07_02233874: ; 0x02233874
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bls _02233882
	b _02233A6E
_02233882:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223388E: ; jump table
	.short _02233896 - _0223388E - 2 ; case 0
	.short _02233904 - _0223388E - 2 ; case 1
	.short _022339FE - _0223388E - 2 ; case 2
	.short _02233A4E - _0223388E - 2 ; case 3
_02233896:
	mov r0, #0xba
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	mov r2, #0xb8
	str r0, [sp]
	mov r0, #0xbe
	ldrsh r0, [r4, r0]
	mov r3, #0xbc
	add r1, #0x6c
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0xc8
	ldr r0, [r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, #0x48
	bl ov07_02222338
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	add r0, #0xd4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232540
	cmp r0, #1
	bne _022339EC
	bl LCRandom
	mov r1, #0x14
	bl _s32_div_f
	add r1, #0xa
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xd
	bl ManagedSprite_OffsetAffineZRotation
	b _02233AF6
_02233904:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232540
	cmp r0, #1
	bne _022339A2
	mov r1, #2
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xc
	bl ManagedSprite_OffsetAffineZRotation
	add r0, r4, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	add r0, #0xa
	cmp r2, r0
	ble _0223393E
	mov r1, #2
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xc
	bl ManagedSprite_OffsetAffineZRotation
_0223393E:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232580
	cmp r0, #1
	bne _022339A2
	add r0, r4, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	add r0, #0xa
	cmp r2, r0
	bne _022339A2
	ldr r0, [r4, #0x30]
	bl ManagedSprite_GetPaletteOverrideOffset
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	add r1, r4, #0
	lsl r3, r3, #0x14
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _02233AFC ; =0x0000FFFF
	add r1, #0x94
	str r0, [sp, #0x14]
	ldr r0, _02233B00 ; =0x000003EA
	lsr r3, r3, #0x10
	str r0, [sp, #0x18]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_02222F10
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
_022339A2:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #6
	blt _022339DA
	cmp r0, #8
	bgt _022339DA
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r2, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	ldr r1, [r0]
	cmp r1, r2
	ble _022339DA
	add r0, r2, #5
	cmp r1, r0
	blt _022339EC
_022339DA:
	add r0, r4, #0
	add r1, r4, #0
	ldr r2, [r4, #0x30]
	add r0, #0x48
	add r1, #0x6c
	bl ov07_022223CC
	cmp r0, #0
	beq _022339EE
_022339EC:
	b _02233AF6
_022339EE:
	add r0, r4, #0
	mov r1, #0
	bl ov07_022344B4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233AF6
_022339FE:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232580
	cmp r0, #1
	bne _02233A32
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02233A32
	bl ov07_02222EE8
	cmp r0, #1
	beq _02233AF6
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	bl ov07_02222EF8
	mov r0, #1
	str r0, [r4, #0x28]
	add sp, #0x1c
	mov r0, #0
	pop {r3, r4, pc}
_02233A32:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xf
	blt _02233A46
	mov r0, #1
	str r0, [r4, #0x28]
	add sp, #0x1c
	mov r0, #0
	pop {r3, r4, pc}
_02233A46:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233AF6
_02233A4E:
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl ManagedSprite_SetAnim
	add r0, r4, #0
	mov r1, #0
	bl ov07_022344C0
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233AF6
_02233A6E:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #5
	bne _02233AC2
	ldr r0, [r4, #0x30]
	mov r1, #2
	bl ManagedSprite_SetAnimationFrame
	ldr r0, [r4, #0x30]
	bl ManagedSprite_GetPaletteOverrideOffset
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	add r1, r4, #0
	lsl r3, r3, #0x14
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _02233AFC ; =0x0000FFFF
	add r1, #0x94
	str r0, [sp, #0x14]
	ldr r0, _02233B00 ; =0x000003EA
	lsr r3, r3, #0x10
	str r0, [sp, #0x18]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_02222F10
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
	mov r0, #1
	str r0, [r4, #0x28]
_02233AC2:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0xf
	ble _02233AF6
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	bl ov07_02222EE8
	cmp r0, #1
	beq _02233AF6
	add r4, #0xd4
	ldr r0, [r4]
	bl ov07_02222EF8
	add sp, #0x1c
	mov r0, #0
	pop {r3, r4, pc}
_02233AF6:
	mov r0, #1
	add sp, #0x1c
	pop {r3, r4, pc}
	.balign 4, 0
_02233AFC: .word 0x0000FFFF
_02233B00: .word 0x000003EA
	thumb_func_end ov07_02233874

	thumb_func_start ov07_02233B04
ov07_02233B04: ; 0x02233B04
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #7
	bls _02233B12
	b _02233C8A
_02233B12:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02233B1E: ; jump table
	.short _02233B2E - _02233B1E - 2 ; case 0
	.short _02233B6C - _02233B1E - 2 ; case 1
	.short _02233B9C - _02233B1E - 2 ; case 2
	.short _02233BD2 - _02233B1E - 2 ; case 3
	.short _02233BE2 - _02233B1E - 2 ; case 4
	.short _02233C10 - _02233B1E - 2 ; case 5
	.short _02233C3E - _02233B1E - 2 ; case 6
	.short _02233C6C - _02233B1E - 2 ; case 7
_02233B2E:
	mov r1, #0
	bl ov07_022344C0
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl ManagedSprite_SetAnim
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #2
	blt _02233B82
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233B6C:
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #2
	bge _02233B84
_02233B82:
	b _02233C90
_02233B84:
	ldr r0, [r4, #0x30]
	mov r1, #2
	bl ManagedSprite_SetAnimationFrame
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233B9C:
	add r0, #0xa0
	ldr r0, [r0]
	add r2, sp, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, sp, #0
	str r0, [sp, #8]
	mov r0, #0xff
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x30]
	add r2, #2
	bl ManagedSprite_GetPositionXY
	add r0, sp, #0
	bl ov07_02232D20
	add r1, r4, #0
	add r1, #0xd0
	str r0, [r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233BD2:
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232D80
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233BE2:
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #6
	blt _02233C90
	ldr r0, [r4, #0x30]
	mov r1, #2
	bl ManagedSprite_SetAnimationFrame
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233C10:
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #6
	blt _02233C90
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl ManagedSprite_SetAnimationFrame
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233C3E:
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #6
	blt _02233C90
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233C6C:
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232DF4
	cmp r0, #0
	bne _02233C90
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232E10
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233C8A:
	add sp, #0x14
	mov r0, #0
	pop {r3, r4, pc}
_02233C90:
	mov r0, #1
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02233B04

	thumb_func_start ov07_02233C98
ov07_02233C98: ; 0x02233C98
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02233CA8
	cmp r0, #1
	beq _02233CDC
	b _02233D0E
_02233CA8:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _02233CBE
	ldr r1, _02233D1C ; =0xFFFFE001
	add r0, r4, #0
	add r0, #0x34
	lsr r2, r1, #0x13
	mov r3, #0xa
	bl ov07_022223F0
	b _02233CCC
_02233CBE:
	add r0, r4, #0
	ldr r1, _02233D20 ; =0x00001FFF
	ldr r2, _02233D1C ; =0xFFFFE001
	add r0, #0x34
	mov r3, #0xa
	bl ov07_022223F0
_02233CCC:
	ldr r1, [r4, #0x10]
	mov r0, #1
	eor r0, r1
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233D16
_02233CDC:
	ldr r1, [r4, #0x34]
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl ManagedSprite_SetAffineZRotation
	add r0, r4, #0
	add r0, #0x34
	bl ov07_02222440
	cmp r0, #0
	bne _02233D16
	ldr r0, [r4, #0xc]
	cmp r0, #1
	blt _02233D02
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233D16
_02233D02:
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	sub r0, r0, #1
	str r0, [r4, #8]
	b _02233D16
_02233D0E:
	mov r0, #0
	add r4, #0xc4
	str r0, [r4]
	pop {r4, pc}
_02233D16:
	mov r0, #1
	pop {r4, pc}
	nop
_02233D1C: .word 0xFFFFE001
_02233D20: .word 0x00001FFF
	thumb_func_end ov07_02233C98

	thumb_func_start ov07_02233D24
ov07_02233D24: ; 0x02233D24
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0xff
	bne _02233D36
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_02233D36:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _02233D5A
	add r1, sp, #0
	add r1, #2
	add r2, sp, #0
	bl ManagedSprite_GetPositionXY
	add r1, sp, #0
	mov r0, #2
	ldrsh r2, [r1, r0]
	add r0, r4, #0
	add r0, #0xb8
	strh r2, [r0]
	mov r0, #0
	ldrsh r0, [r1, r0]
	add r4, #0xba
	strh r0, [r4]
_02233D5A:
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02233D24

	thumb_func_start ov07_02233D60
ov07_02233D60: ; 0x02233D60
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02233DB2
	add r0, r4, #0
	add r0, #0xdc
	ldr r0, [r0]
	cmp r0, #0
	ble _02233D8A
	add r0, r4, #0
	add r0, #0xdc
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0xdc
	str r1, [r0]
	ldr r0, [r4, #0x2c]
	bl SpriteSystem_DrawSprites
	pop {r4, pc}
_02233D8A:
	add r1, #0x98
	ldr r1, [r1]
	add r0, r4, #0
	lsl r2, r1, #2
	ldr r1, _02233DB4 ; =ov07_022371A0
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #0
	bne _02233DA0
	mov r0, #0
	str r0, [r4, #0x1c]
_02233DA0:
	ldr r0, [r4, #0x24]
	cmp r0, #1
	bne _02233DAC
	ldr r0, [r4, #0x30]
	bl ManagedSprite_TickFrame
_02233DAC:
	ldr r0, [r4, #0x2c]
	bl SpriteSystem_DrawSprites
_02233DB2:
	pop {r4, pc}
	.balign 4, 0
_02233DB4: .word ov07_022371A0
	thumb_func_end ov07_02233D60

	thumb_func_start ov07_02233DB8
ov07_02233DB8: ; 0x02233DB8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0xe0
	bl Heap_Alloc
	mov r1, #0
	mov r2, #0xe0
	add r4, r0, #0
	bl MI_CpuFill8
	cmp r4, #0
	bne _02233DD6
	bl GF_AssertFail
_02233DD6:
	add r3, r4, #0
	add r3, #0x90
	mov r2, #5
_02233DDC:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02233DDC
	mov r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0x10]
	str r0, [r4, #0xc]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4]
	str r0, [r4, #4]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl SpriteManager_New
	str r0, [r4, #0x2c]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xdc
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_022325BC
	str r0, [r4, #0x24]
	add r0, r4, #0
	mov r2, #0
	add r0, #0xc4
	str r2, [r0]
	add r0, r4, #0
	mov r1, #0x10
	add r0, #0x20
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x21
	strb r2, [r0]
	bl ov07_0221C69C
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r0, r0, #0x1f
	sub r0, r0, r1
	mov r2, #0x1f
	ror r0, r2
	add r0, r1, r0
	beq _02233E4A
	add r0, r4, #0
	mov r1, #1
	add r0, #0x22
	strb r1, [r0]
	b _02233E52
_02233E4A:
	add r0, r4, #0
	sub r2, #0x20
	add r0, #0x22
	strb r2, [r0]
_02233E52:
	add r0, r4, #0
	bl ov07_022342E4
	add r0, r4, #0
	bl ov07_0223441C
	add r0, r4, #0
	bl ov07_02233F30
	mov r0, #1
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x28]
	mov r2, #0xfa
	ldr r0, _02233E84 ; =ov07_02233D60
	add r1, r4, #0
	lsl r2, r2, #2
	bl SysTask_CreateOnMainQueue
	add r1, r4, #0
	add r1, #0xcc
	str r0, [r1]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02233E84: .word ov07_02233D60
	thumb_func_end ov07_02233DB8

	thumb_func_start ov07_02233E88
ov07_02233E88: ; 0x02233E88
	push {r4, lr}
	add r4, r0, #0
	bne _02233E92
	bl GF_AssertFail
_02233E92:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02233E9C
	mov r0, #1
	pop {r4, pc}
_02233E9C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov07_02233E88

	thumb_func_start ov07_02233EA0
ov07_02233EA0: ; 0x02233EA0
	push {r4, lr}
	add r4, r0, #0
	bne _02233EAA
	bl GF_AssertFail
_02233EAA:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _02233EB4
	mov r0, #1
	pop {r4, pc}
_02233EB4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov07_02233EA0

	thumb_func_start ov07_02233EB8
ov07_02233EB8: ; 0x02233EB8
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end ov07_02233EB8

	thumb_func_start ov07_02233EBC
ov07_02233EBC: ; 0x02233EBC
	ldr r0, [r0, #0x14]
	cmp r0, r1
	bne _02233EC6
	mov r0, #1
	bx lr
_02233EC6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov07_02233EBC

	thumb_func_start ov07_02233ECC
ov07_02233ECC: ; 0x02233ECC
	push {r4, lr}
	add r4, r0, #0
	bne _02233ED6
	bl GF_AssertFail
_02233ED6:
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r4, #0x2c]
	bl SpriteSystem_FreeResourcesAndManager
	ldr r0, [r4, #0x30]
	bl Sprite_DeleteAndFreeResources
	add r0, r4, #0
	add r0, #0xcc
	ldr r0, [r0]
	bl SysTask_Destroy
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02233ECC

	thumb_func_start ov07_02233EFC
ov07_02233EFC: ; 0x02233EFC
	add r2, r0, #0
	add r0, #0x98
	str r1, [r0]
	mov r0, #0
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	str r0, [r2, #0x10]
	mov r0, #1
	add r1, r2, #0
	str r0, [r2, #0x1c]
	ldr r0, [r2, #0x30]
	ldr r3, _02233F1C ; =ManagedSprite_GetPositionXY
	add r1, #0xb8
	add r2, #0xba
	bx r3
	nop
_02233F1C: .word ManagedSprite_GetPositionXY
	thumb_func_end ov07_02233EFC

	thumb_func_start ov07_02233F20
ov07_02233F20: ; 0x02233F20
	push {r4, lr}
	add r4, r0, #0
	bne _02233F2A
	bl GF_AssertFail
_02233F2A:
	add r4, #0x98
	ldr r0, [r4]
	pop {r4, pc}
	thumb_func_end ov07_02233F20

	thumb_func_start ov07_02233F30
ov07_02233F30: ; 0x02233F30
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x30]
	add r1, #0xb8
	add r2, #0xba
	bl ManagedSprite_GetPositionXY
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0x11
	bls _02233F4E
	b _0223419C
_02233F4E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02233F5A: ; jump table
	.short _02233F7E - _02233F5A - 2 ; case 0
	.short _02233F7E - _02233F5A - 2 ; case 1
	.short _02233F7E - _02233F5A - 2 ; case 2
	.short _02233F7E - _02233F5A - 2 ; case 3
	.short _02233F7E - _02233F5A - 2 ; case 4
	.short _02233F7E - _02233F5A - 2 ; case 5
	.short _02233F9C - _02233F5A - 2 ; case 6
	.short _02233FC2 - _02233F5A - 2 ; case 7
	.short _02233FF6 - _02233F5A - 2 ; case 8
	.short _0223401C - _02233F5A - 2 ; case 9
	.short _02234042 - _02233F5A - 2 ; case 10
	.short _02234068 - _02233F5A - 2 ; case 11
	.short _0223408E - _02233F5A - 2 ; case 12
	.short _022340BA - _02233F5A - 2 ; case 13
	.short _022340F2 - _02233F5A - 2 ; case 14
	.short _02234118 - _02233F5A - 2 ; case 15
	.short _02234144 - _02233F5A - 2 ; case 16
	.short _02234170 - _02233F5A - 2 ; case 17
_02233F7E:
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x30]
	add r1, #0xbc
	add r2, #0xbe
	bl ManagedSprite_GetPositionXY
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xc
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_02233F9C:
	mov r0, #0
	add r2, r4, #0
	add r3, r4, #0
	add r1, r0, #0
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x30
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_02233FC2:
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x30]
	add r1, #0xb8
	add r2, #0xba
	bl ManagedSprite_GetPositionXY
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #1
	mov r1, #4
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x30
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_02233FF6:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #1
	mov r1, #2
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x30
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_0223401C:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #0
	mov r1, #1
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x30
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_02234042:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #1
	mov r1, #3
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x30
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_02234068:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #1
	mov r1, #5
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x30
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_0223408E:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #0
	mov r1, #1
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x10
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x10
	strh r1, [r0]
	mov r0, #0xc
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_022340BA:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #0
	mov r1, #1
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x20
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbc
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbc
	sub r1, #0x14
	strh r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x26
	strh r1, [r0]
	mov r0, #0x10
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_022340F2:
	add r0, r4, #0
	mov r1, #0x80
	add r0, #0xbc
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0x40
	add r0, #0xbe
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0x20
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_02234118:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #0
	mov r1, #1
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x40
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #8
	strh r1, [r0]
	mov r0, #0x10
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_02234144:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #1
	mov r1, #3
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x40
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #8
	strh r1, [r0]
	mov r0, #0x10
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_02234170:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #1
	mov r1, #5
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x40
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #8
	strh r1, [r0]
	mov r0, #0x10
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_0223419C:
	mov r0, #0x14
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov07_02233F30

	thumb_func_start ov07_022341A4
ov07_022341A4: ; 0x022341A4
	push {r4, lr}
	add r0, #0x90
	ldr r0, [r0]
	add r3, r1, #0
	add r4, r2, #0
	cmp r0, #0x11
	bls _022341B4
	b _022342E0
_022341B4:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022341C0: ; jump table
	.short _022341E4 - _022341C0 - 2 ; case 0
	.short _022341FA - _022341C0 - 2 ; case 1
	.short _02234210 - _022341C0 - 2 ; case 2
	.short _0223423C - _022341C0 - 2 ; case 3
	.short _02234226 - _022341C0 - 2 ; case 4
	.short _02234252 - _022341C0 - 2 ; case 5
	.short _02234268 - _022341C0 - 2 ; case 6
	.short _02234272 - _022341C0 - 2 ; case 7
	.short _0223427C - _022341C0 - 2 ; case 8
	.short _02234286 - _022341C0 - 2 ; case 9
	.short _02234294 - _022341C0 - 2 ; case 10
	.short _022342A2 - _022341C0 - 2 ; case 11
	.short _022342B0 - _022341C0 - 2 ; case 12
	.short _022342BE - _022341C0 - 2 ; case 13
	.short _022342CC - _022341C0 - 2 ; case 14
	.short _022342D6 - _022341C0 - 2 ; case 15
	.short _022342D6 - _022341C0 - 2 ; case 16
	.short _022342D6 - _022341C0 - 2 ; case 17
_022341E4:
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	add r3, r4, #0
	bl ov07_02221F04
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, #0x28
	strh r0, [r4]
	pop {r4, pc}
_022341FA:
	add r2, r3, #0
	mov r0, #0
	mov r1, #1
	add r3, r4, #0
	bl ov07_02221F04
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, #0x26
	strh r0, [r4]
	pop {r4, pc}
_02234210:
	add r2, r3, #0
	mov r0, #1
	mov r1, #2
	add r3, r4, #0
	bl ov07_02221F04
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, #0x28
	strh r0, [r4]
	pop {r4, pc}
_02234226:
	add r2, r3, #0
	mov r0, #1
	mov r1, #4
	add r3, r4, #0
	bl ov07_02221F04
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, #0x28
	strh r0, [r4]
	pop {r4, pc}
_0223423C:
	add r2, r3, #0
	mov r0, #1
	mov r1, #3
	add r3, r4, #0
	bl ov07_02221F04
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, #0x26
	strh r0, [r4]
	pop {r4, pc}
_02234252:
	add r2, r3, #0
	mov r0, #1
	mov r1, #5
	add r3, r4, #0
	bl ov07_02221F04
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, #0x26
	strh r0, [r4]
	pop {r4, pc}
_02234268:
	mov r0, #0xa
	strh r0, [r3]
	mov r0, #0x64
	strh r0, [r4]
	pop {r4, pc}
_02234272:
	mov r0, #0xa
	strh r0, [r3]
	mov r0, #0x64
	strh r0, [r4]
	pop {r4, pc}
_0223427C:
	mov r0, #0xa
	strh r0, [r3]
	mov r0, #0x64
	strh r0, [r4]
	pop {r4, pc}
_02234286:
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	add r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_02234294:
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	add r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_022342A2:
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	add r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_022342B0:
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	add r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_022342BE:
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	add r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_022342CC:
	mov r0, #0xe6
	strh r0, [r3]
	mov r0, #0x20
	strh r0, [r4]
	pop {r4, pc}
_022342D6:
	mov r0, #0x1d
	mvn r0, r0
	strh r0, [r3]
	mov r0, #0xa0
	strh r0, [r4]
_022342E0:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_022341A4

	thumb_func_start ov07_022342E4
ov07_022342E4: ; 0x022342E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	mov r2, #0xa
	bl SpriteSystem_InitSprites
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _02234314
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	bl SpriteSystem_GetRenderer
	mov r2, #0x11
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
_02234314:
	mov r1, #0
	add r2, sp, #0x20
	mov r0, #0xa
_0223431A:
	add r1, r1, #1
	stmia r2!, {r0}
	cmp r1, #6
	blt _0223431A
	mov r0, #0
	str r0, [sp, #0x30]
	str r0, [sp, #0x34]
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	add r2, sp, #0x20
	bl SpriteSystem_InitManagerWithCapacities
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #0
	bl ov07_02232658
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #1
	bl ov07_02232658
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #2
	bl ov07_02232658
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #3
	bl ov07_02232658
	add r1, r5, #0
	add r1, #0x94
	str r0, [sp, #0x1c]
	ldr r1, [r1]
	mov r0, #8
	bl NARC_New
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x9c
	ldr r1, [r0]
	ldr r0, _02234418 ; =0x00001770
	add r2, r4, #0
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	add r3, r7, #0
	bl SpriteSystem_LoadCharResObjFromOpenNarc
	str r4, [sp]
	add r2, r5, #0
	str r6, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x9c
	ldr r1, [r0]
	ldr r0, _02234418 ; =0x00001770
	add r2, #0xac
	add r0, r1, r0
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r2, [r2]
	ldr r3, [r5, #0x2c]
	mov r1, #2
	bl SpriteSystem_LoadPaletteBufferFromOpenNarc
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x9c
	ldr r1, [r0]
	ldr r0, _02234418 ; =0x00001770
	ldr r3, [sp, #0x18]
	add r0, r1, r0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	add r2, r4, #0
	bl SpriteSystem_LoadCellResObjFromOpenNarc
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x9c
	ldr r1, [r0]
	ldr r0, _02234418 ; =0x00001770
	ldr r3, [sp, #0x1c]
	add r0, r1, r0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	add r2, r4, #0
	bl SpriteSystem_LoadAnimResObjFromOpenNarc
	add r0, r4, #0
	bl NARC_Delete
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02234418: .word 0x00001770
	thumb_func_end ov07_022342E4

	thumb_func_start ov07_0223441C
ov07_0223441C: ; 0x0223441C
	push {r3, r4, lr}
	sub sp, #0x34
	add r2, sp, #0
	add r1, sp, #0
	add r2, #2
	add r4, r0, #0
	bl ov07_022341A4
	mov r0, #0
	add r1, sp, #0
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	mov r1, #1
	str r1, [sp, #0x10]
	add r1, r4, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r1, #0xa4
	ldr r1, [r1]
	ldr r2, _02234498 ; =0x00001770
	str r1, [sp, #0x2c]
	str r0, [sp, #0x30]
	add r3, sp, #0
_0223444A:
	add r1, r4, #0
	add r1, #0x9c
	ldr r1, [r1]
	add r0, r0, #1
	add r1, r1, r2
	str r1, [r3, #0x14]
	add r3, r3, #4
	cmp r0, #6
	blt _0223444A
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r4, #0x2c]
	add r2, sp, #0
	bl SpriteSystem_NewSprite
	str r0, [r4, #0x30]
	mov r1, #1
	bl ManagedSprite_SetDrawFlag
	ldr r0, [r4, #0x30]
	mov r1, #2
	bl ManagedSprite_SetAffineOverwriteMode
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl ManagedSprite_SetAnimationFrame
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl ManagedSprite_SetAnim
	ldr r0, [r4, #0x30]
	bl ManagedSprite_TickFrame
	bl ov07_0221C69C
	add sp, #0x34
	pop {r3, r4, pc}
	.balign 4, 0
_02234498: .word 0x00001770
	thumb_func_end ov07_0223441C

	thumb_func_start ov07_0223449C
ov07_0223449C: ; 0x0223449C
	ldr r3, _022344A4 ; =ManagedSprite_SetDrawFlag
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344A4: .word ManagedSprite_SetDrawFlag
	thumb_func_end ov07_0223449C

	thumb_func_start ov07_022344A8
ov07_022344A8: ; 0x022344A8
	ldr r3, _022344B0 ; =ManagedSprite_SetPositionXY
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344B0: .word ManagedSprite_SetPositionXY
	thumb_func_end ov07_022344A8

	thumb_func_start ov07_022344B4
ov07_022344B4: ; 0x022344B4
	ldr r3, _022344BC ; =ManagedSprite_SetAffineZRotation
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344BC: .word ManagedSprite_SetAffineZRotation
	thumb_func_end ov07_022344B4

	thumb_func_start ov07_022344C0
ov07_022344C0: ; 0x022344C0
	str r1, [r0, #0x24]
	bx lr
	thumb_func_end ov07_022344C0

	thumb_func_start ov07_022344C4
ov07_022344C4: ; 0x022344C4
	ldr r3, _022344CC ; =ManagedSprite_SetDrawPriority
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344CC: .word ManagedSprite_SetDrawPriority
	thumb_func_end ov07_022344C4

	thumb_func_start ov07_022344D0
ov07_022344D0: ; 0x022344D0
	ldr r3, _022344D8 ; =ManagedSprite_SetPriority
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344D8: .word ManagedSprite_SetPriority
	thumb_func_end ov07_022344D0

	thumb_func_start ov07_022344DC
ov07_022344DC: ; 0x022344DC
	add r0, #0xdc
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_022344DC

    .rodata

.public ov07_0223717C
ov07_0223717C: ; 0x0223717C
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

.public ov07_02237188
ov07_02237188: ; 0x02237188
	.byte 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00

ov07_022371A0: ; 0x022371A0
	.word ov07_022335B4
	.word ov07_02233874
	.word ov07_02233C98
	.word ov07_022335A0
	.word ov07_02233D24
	.word ov07_02233B04

ov07_022371B8: ; 0x022371B8
	.word ov07_02232E18
	.word ov07_02232E40
	.word ov07_02232E68
	.word ov07_02232E90
	.word ov07_02232EB8
	.word ov07_02232EE0
	.word ov07_02232F08
	.word ov07_02232F30
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00

ov07_02237200: ; 0x02237200
	.byte 0x01, 0x00, 0x00, 0x00, 0xE6, 0x05, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0xE6, 0x05, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0xE7, 0x05, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0xE8, 0x05, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0xE9, 0x05, 0x00, 0x00

.public ov07_02237228
ov07_02237228: ; 0x02237228
	.byte 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00

ov07_02237254: ; 0x02237254
	.byte 0xFE, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFE, 0xFF
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00

ov07_0223729C: ; 0x0223729C
	.word ov07_02232F80
	.word ov07_02232F84
	.word ov07_02232F9C
	.word ov07_02232FA8
	.word ov07_02233088
	.word ov07_0223308C
	.word ov07_022330E0
	.word ov07_022330E4
	.word ov07_022330F0
	.word ov07_022330FC
	.word ov07_022331A4
	.word ov07_022331B0
	.word ov07_02233224
	.word ov07_02233228
	.word ov07_022332C4
	.word ov07_022332C8
	.word ov07_022332E8
	.word ov07_022332F4
	.word ov07_0223338C
	.word ov07_02233390
	.word ov07_0223339C
	.word ov07_022333A8
	.word ov07_02233498
	.word ov07_0223349C
	.word ov07_02233500
	.word ov07_0223350C
	.word ov07_02233590
	.word ov07_0223359C

ov07_0223730C:
	.byte 0x00, 0x00

ov07_0223730E: ; 0x0223730E
	.byte 0xF9, 0xFF

ov07_02237310: ; 0x02237310
	.byte 0x01, 0x00, 0x01, 0x00, 0xFB, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xFD, 0xFF, 0x00, 0x00, 0x01, 0x00
	.byte 0xFE, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFB, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0xFD, 0xFF, 0x00, 0x00, 0x01, 0x00, 0xFE, 0xFF, 0x00, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0xFE, 0xFF, 0x00, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00

.public ov07_0223738C
ov07_0223738C: ; 0x0223738C
	.byte 0x01, 0x00, 0x00, 0x00

ov07_02237390: ; 0x02237390
	.byte 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

.public ov07_0223746C
ov07_0223746C: ; 0x0223746C
	.byte 0x1B, 0x00, 0x00, 0x00

ov07_02237470: ; 0x02237470
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02237474: ; 0x02237474
	.byte 0x05, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x22, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x26, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x2E, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

.public ov07_022375BC
ov07_022375BC: ; 0x022375BC
	.byte 0x05, 0x01, 0x00, 0x00
	.byte 0x53, 0x00, 0x00, 0x00, 0x04, 0x01, 0x00, 0x00, 0x03, 0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00
	.byte 0x54, 0x00, 0x00, 0x00, 0x07, 0x01, 0x00, 0x00, 0x06, 0x01, 0x00, 0x00, 0x0B, 0x01, 0x00, 0x00
	.byte 0x55, 0x00, 0x00, 0x00, 0x0A, 0x01, 0x00, 0x00, 0x09, 0x01, 0x00, 0x00, 0x0E, 0x01, 0x00, 0x00
	.byte 0x56, 0x00, 0x00, 0x00, 0x0D, 0x01, 0x00, 0x00, 0x0C, 0x01, 0x00, 0x00, 0x11, 0x01, 0x00, 0x00
	.byte 0x57, 0x00, 0x00, 0x00, 0x10, 0x01, 0x00, 0x00, 0x0F, 0x01, 0x00, 0x00, 0x14, 0x01, 0x00, 0x00
	.byte 0x58, 0x00, 0x00, 0x00, 0x13, 0x01, 0x00, 0x00, 0x12, 0x01, 0x00, 0x00, 0x17, 0x01, 0x00, 0x00
	.byte 0x59, 0x00, 0x00, 0x00, 0x16, 0x01, 0x00, 0x00, 0x15, 0x01, 0x00, 0x00, 0x1A, 0x01, 0x00, 0x00
	.byte 0x5A, 0x00, 0x00, 0x00, 0x19, 0x01, 0x00, 0x00, 0x18, 0x01, 0x00, 0x00, 0x1D, 0x01, 0x00, 0x00
	.byte 0x5B, 0x00, 0x00, 0x00, 0x1C, 0x01, 0x00, 0x00, 0x1B, 0x01, 0x00, 0x00, 0x20, 0x01, 0x00, 0x00
	.byte 0x5C, 0x00, 0x00, 0x00, 0x1F, 0x01, 0x00, 0x00, 0x1E, 0x01, 0x00, 0x00, 0x23, 0x01, 0x00, 0x00
	.byte 0x5D, 0x00, 0x00, 0x00, 0x22, 0x01, 0x00, 0x00, 0x21, 0x01, 0x00, 0x00, 0x26, 0x01, 0x00, 0x00
	.byte 0x5E, 0x00, 0x00, 0x00, 0x25, 0x01, 0x00, 0x00, 0x24, 0x01, 0x00, 0x00, 0x29, 0x01, 0x00, 0x00
	.byte 0x5F, 0x00, 0x00, 0x00, 0x28, 0x01, 0x00, 0x00, 0x27, 0x01, 0x00, 0x00, 0x2C, 0x01, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x2B, 0x01, 0x00, 0x00, 0x2A, 0x01, 0x00, 0x00, 0x2F, 0x01, 0x00, 0x00
	.byte 0x61, 0x00, 0x00, 0x00, 0x2E, 0x01, 0x00, 0x00, 0x2D, 0x01, 0x00, 0x00, 0x32, 0x01, 0x00, 0x00
	.byte 0x62, 0x00, 0x00, 0x00, 0x31, 0x01, 0x00, 0x00, 0x30, 0x01, 0x00, 0x00, 0x35, 0x01, 0x00, 0x00
	.byte 0x63, 0x00, 0x00, 0x00, 0x34, 0x01, 0x00, 0x00, 0x33, 0x01, 0x00, 0x00, 0x38, 0x01, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x37, 0x01, 0x00, 0x00, 0x36, 0x01, 0x00, 0x00, 0x3B, 0x01, 0x00, 0x00
	.byte 0x65, 0x00, 0x00, 0x00, 0x3A, 0x01, 0x00, 0x00, 0x39, 0x01, 0x00, 0x00, 0x3E, 0x01, 0x00, 0x00
	.byte 0x66, 0x00, 0x00, 0x00, 0x3D, 0x01, 0x00, 0x00, 0x3C, 0x01, 0x00, 0x00, 0x41, 0x01, 0x00, 0x00
	.byte 0x67, 0x00, 0x00, 0x00, 0x40, 0x01, 0x00, 0x00, 0x3F, 0x01, 0x00, 0x00, 0x44, 0x01, 0x00, 0x00
	.byte 0x68, 0x00, 0x00, 0x00, 0x43, 0x01, 0x00, 0x00, 0x42, 0x01, 0x00, 0x00, 0x47, 0x01, 0x00, 0x00
	.byte 0x69, 0x00, 0x00, 0x00, 0x46, 0x01, 0x00, 0x00, 0x45, 0x01, 0x00, 0x00, 0x4A, 0x01, 0x00, 0x00
	.byte 0x6A, 0x00, 0x00, 0x00, 0x49, 0x01, 0x00, 0x00, 0x48, 0x01, 0x00, 0x00, 0x4D, 0x01, 0x00, 0x00
	.byte 0x6B, 0x00, 0x00, 0x00, 0x4C, 0x01, 0x00, 0x00, 0x4B, 0x01, 0x00, 0x00, 0x50, 0x01, 0x00, 0x00
	.byte 0x6C, 0x00, 0x00, 0x00, 0x4F, 0x01, 0x00, 0x00, 0x4E, 0x01, 0x00, 0x00, 0x53, 0x01, 0x00, 0x00
	.byte 0x6D, 0x00, 0x00, 0x00, 0x52, 0x01, 0x00, 0x00, 0x51, 0x01, 0x00, 0x00, 0x53, 0x01, 0x00, 0x00
	.byte 0x6D, 0x00, 0x00, 0x00, 0x52, 0x01, 0x00, 0x00, 0x51, 0x01, 0x00, 0x00
