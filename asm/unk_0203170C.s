	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0203170C
sub_0203170C: ; 0x0203170C
	mov r0, #0x40
	bx lr
	thumb_func_end sub_0203170C

	thumb_func_start sub_02031710
sub_02031710: ; 0x02031710
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x40
	bl MI_CpuFill8
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x33
	bl memset
	mov r0, #1
	str r0, [r4, #0x34]
	mov r0, #0x1f
	bl SaveSubstruct_UpdateCRC
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02031710

	thumb_func_start sub_02031734
sub_02031734: ; 0x02031734
	push {r3, lr}
	mov r1, #0x1f
	bl SavArray_get
	bl sub_02031710
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02031734

	thumb_func_start sub_02031744
sub_02031744: ; 0x02031744
	push {r3, lr}
	mov r1, #0x1f
	bl SavArray_get
	mov r1, #0
	ldrsb r0, [r0, r1]
	cmp r0, #0
	beq _02031756
	mov r1, #1
_02031756:
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02031744

	thumb_func_start sub_0203175C
sub_0203175C: ; 0x0203175C
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x1f
	bl SavArray_get
	add r1, r4, #0
	bl strcpy
	mov r0, #0x1f
	bl SaveSubstruct_UpdateCRC
	pop {r4, pc}
	thumb_func_end sub_0203175C

	thumb_func_start sub_02031774
sub_02031774: ; 0x02031774
	ldr r3, _0203177C ; =SavArray_get
	mov r1, #0x1f
	bx r3
	nop
_0203177C: .word SavArray_get
	thumb_func_end sub_02031774

	thumb_func_start sub_02031780
sub_02031780: ; 0x02031780
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0x1f
	add r4, r2, #0
	bl SavArray_get
	cmp r5, #3
	bhi _020317B2
	add r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0203179C: ; jump table
	.short _020317A4 - _0203179C - 2 ; case 0
	.short _020317A8 - _0203179C - 2 ; case 1
	.short _020317AC - _0203179C - 2 ; case 2
	.short _020317B0 - _0203179C - 2 ; case 3
_020317A4:
	str r4, [r0, #0x34]
	b _020317B2
_020317A8:
	strh r4, [r0, #0x38]
	b _020317B2
_020317AC:
	strh r4, [r0, #0x3a]
	b _020317B2
_020317B0:
	str r4, [r0, #0x3c]
_020317B2:
	mov r0, #0x1f
	bl SaveSubstruct_UpdateCRC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02031780

	thumb_func_start sub_020317BC
sub_020317BC: ; 0x020317BC
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x1f
	bl SavArray_get
	cmp r4, #3
	bhi _020317EE
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020317D6: ; jump table
	.short _020317DE - _020317D6 - 2 ; case 0
	.short _020317E2 - _020317D6 - 2 ; case 1
	.short _020317E6 - _020317D6 - 2 ; case 2
	.short _020317EA - _020317D6 - 2 ; case 3
_020317DE:
	ldr r0, [r0, #0x34]
	pop {r4, pc}
_020317E2:
	ldrh r0, [r0, #0x38]
	pop {r4, pc}
_020317E6:
	ldrh r0, [r0, #0x3a]
	pop {r4, pc}
_020317EA:
	ldr r0, [r0, #0x3c]
	pop {r4, pc}
_020317EE:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020317BC

	thumb_func_start sub_020317F4
sub_020317F4: ; 0x020317F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0202CA44
	add r6, r0, #0
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r7, r0, #0
	add r0, r5, #0
	bl sub_02031774
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x64
	bl MI_CpuFill8
	mov r0, #GAME_VERSION
	strb r0, [r4]
	mov r0, #2
	strb r0, [r4, #1]
	add r0, r6, #0
	bl sub_0202CA8C
	strb r0, [r4, #2]
	add r0, r6, #0
	bl sub_0202CA90
	strb r0, [r4, #3]
	add r0, r7, #0
	bl PlayerProfile_GetTrainerID
	str r0, [r4, #4]
	add r0, r7, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	add r0, r4, #0
	add r0, #8
	bl CopyU16StringArray
	mov r0, #0
	str r0, [r4, #0x18]
	add r0, r4, #0
	ldr r1, [sp]
	add r0, #0x24
	bl strcpy
	add r0, r5, #0
	mov r1, #0
	bl sub_020317BC
	str r0, [r4, #0x5c]
	mov r0, #0x1f
	bl SaveSubstruct_UpdateCRC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020317F4

	thumb_func_start sub_0203186C
sub_0203186C: ; 0x0203186C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl sub_020317F4
	bl LCRandom
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _s32_div_f
	add r0, r5, #0
	add r4, r1, #0
	add r0, #0x60
	strh r4, [r0]
	ldr r0, _02031898 ; =0x0000FFFF
	add r5, #0x62
	strh r0, [r5]
	mov r0, #0x1f
	bl SaveSubstruct_UpdateCRC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02031898: .word 0x0000FFFF
	thumb_func_end sub_0203186C

	thumb_func_start sub_0203189C
sub_0203189C: ; 0x0203189C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	mov r1, #0x1f
	bl SavArray_get
	add r4, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020317F4
	add r0, r5, #0
	ldrh r1, [r4, #0x38]
	add r0, #0x60
	add r5, #0x62
	strh r1, [r0]
	ldrh r0, [r4, #0x3a]
	strh r0, [r5]
	mov r0, #0x1f
	bl SaveSubstruct_UpdateCRC
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0203189C
