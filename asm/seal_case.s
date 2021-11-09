	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start Sav2_SealCase_sizeof
Sav2_SealCase_sizeof: ; 0x0202CBC0
	mov r0, #0x17
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end Sav2_SealCase_sizeof

	thumb_func_start Sav2_SealCase_init
Sav2_SealCase_init: ; 0x0202CBC8
	push {r4, lr}
	add r4, r0, #0
	bl Sav2_SealCase_sizeof
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	pop {r4, pc}
	thumb_func_end Sav2_SealCase_init

	thumb_func_start CopyCapsule
CopyCapsule: ; 0x0202CBDC
	ldr r3, _0202CBE4 ; =MI_CpuCopy8
	mov r2, #0x18
	bx r3
	nop
_0202CBE4: .word MI_CpuCopy8
	thumb_func_end CopyCapsule

	thumb_func_start Sav2_SealCase_get
Sav2_SealCase_get: ; 0x0202CBE8
	ldr r3, _0202CBF0 ; =SavArray_get
	mov r1, #0x11
	bx r3
	nop
_0202CBF0: .word SavArray_get
	thumb_func_end Sav2_SealCase_get

	thumb_func_start SealCase_GetCapsuleI
SealCase_GetCapsuleI: ; 0x0202CBF4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xc
	blt _0202CC02
	bl GF_AssertFail
_0202CC02:
	mov r0, #0x18
	mul r0, r4
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end SealCase_GetCapsuleI

	thumb_func_start SealCase_CopyCapsuleI
SealCase_CopyCapsuleI: ; 0x0202CC0C
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	cmp r6, #0xc
	blt _0202CC1C
	bl GF_AssertFail
_0202CC1C:
	add r0, r5, #0
	add r1, r6, #0
	bl SealCase_GetCapsuleI
	add r1, r0, #0
	add r0, r4, #0
	bl CopyCapsule
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end SealCase_CopyCapsuleI

	thumb_func_start CapsuleGetSealI
CapsuleGetSealI: ; 0x0202CC30
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blt _0202CC3E
	bl GF_AssertFail
_0202CC3E:
	lsl r0, r4, #1
	add r0, r4, r0
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end CapsuleGetSealI

	thumb_func_start SealOnCapsuleGetID
SealOnCapsuleGetID: ; 0x0202CC48
	ldrb r0, [r0]
	bx lr
	thumb_func_end SealOnCapsuleGetID

	thumb_func_start SealOnCapsuleGetX
SealOnCapsuleGetX: ; 0x0202CC4C
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end SealOnCapsuleGetX

	thumb_func_start SealOnCapsuleGetY
SealOnCapsuleGetY: ; 0x0202CC50
	ldrb r0, [r0, #2]
	bx lr
	thumb_func_end SealOnCapsuleGetY

	thumb_func_start SealCase_inventory_get
SealCase_inventory_get: ; 0x0202CC54
	mov r1, #0x12
	lsl r1, r1, #4
	add r0, r0, r1
	bx lr
	thumb_func_end SealCase_inventory_get

	thumb_func_start SealCaseInventory_GetSealQuantity
SealCaseInventory_GetSealQuantity: ; 0x0202CC5C
	ldrb r0, [r0, r1]
	bx lr
	thumb_func_end SealCaseInventory_GetSealQuantity

	thumb_func_start SealIsOnCapsule
SealIsOnCapsule: ; 0x0202CC60
	mov r3, #0
	add r2, r1, #1
_0202CC64:
	ldrb r1, [r0]
	cmp r2, r1
	bne _0202CC6E
	mov r0, #1
	bx lr
_0202CC6E:
	add r3, r3, #1
	add r0, r0, #3
	cmp r3, #8
	blt _0202CC64
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end SealIsOnCapsule

	thumb_func_start SealCase_CountSealOccurrenceInUse
SealCase_CountSealOccurrenceInUse: ; 0x0202CC7C
	push {r4, r5, r6, r7}
	mov r6, #0
	add r4, r6, #0
	add r2, r1, #1
	add r3, r6, #0
_0202CC86:
	add r5, r3, #0
	add r7, r0, #0
_0202CC8A:
	ldrb r1, [r7]
	cmp r2, r1
	bne _0202CC92
	add r6, r6, #1
_0202CC92:
	add r5, r5, #1
	add r7, r7, #3
	cmp r5, #8
	blt _0202CC8A
	add r4, r4, #1
	add r0, #0x18
	cmp r4, #0xc
	blt _0202CC86
	add r0, r6, #0
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end SealCase_CountSealOccurrenceInUse

	thumb_func_start SealCaseInventory_SetSealQuantity
SealCaseInventory_SetSealQuantity: ; 0x0202CCA8
	strb r2, [r0, r1]
	bx lr
	thumb_func_end SealCaseInventory_SetSealQuantity

	thumb_func_start GiveOrTakeSeal
GiveOrTakeSeal: ; 0x0202CCAC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	sub r1, r5, #1
	add r6, r0, #0
	add r4, r2, #0
	bl SealCase_CountSealOccurrenceInUse
	mov r1, #0x12
	lsl r1, r1, #4
	add r2, r6, r1
	sub r1, r5, #1
	ldrb r3, [r2, r1]
	add r0, r0, r3
	cmp r4, #0
	bge _0202CCD6
	add r0, r4, r3
	bmi _0202CCD2
	strb r0, [r2, r1]
	b _0202CCE6
_0202CCD2:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CCD6:
	add r0, r0, r4
	cmp r0, #0x63
	bgt _0202CCE2
	add r0, r3, r4
	strb r0, [r2, r1]
	b _0202CCE6
_0202CCE2:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CCE6:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end GiveOrTakeSeal

	thumb_func_start GiveOrTakeSeal_NoConsiderCapsules
GiveOrTakeSeal_NoConsiderCapsules: ; 0x0202CCEC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	sub r1, r5, #1
	add r6, r0, #0
	add r4, r2, #0
	bl SealCase_CountSealOccurrenceInUse
	cmp r4, #0
	bge _0202CD14
	mov r0, #0x12
	lsl r0, r0, #4
	add r2, r6, r0
	sub r1, r5, #1
	ldrb r0, [r2, r1]
	add r0, r4, r0
	bmi _0202CD10
	strb r0, [r2, r1]
	b _0202CD38
_0202CD10:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CD14:
	add r0, r0, r4
	cmp r0, #0x63
	bgt _0202CD34
	mov r0, #0x12
	lsl r0, r0, #4
	add r2, r6, r0
	sub r1, r5, #1
	ldrb r0, [r2, r1]
	add r0, r0, r4
	strb r0, [r2, r1]
	ldrb r0, [r2, r1]
	cmp r0, #0x63
	blo _0202CD38
	mov r0, #0x63
	strb r0, [r2, r1]
	b _0202CD38
_0202CD34:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CD38:
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end GiveOrTakeSeal_NoConsiderCapsules

	thumb_func_start SealCase_CheckSealQuantity
SealCase_CheckSealQuantity: ; 0x0202CD3C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	sub r1, r5, #1
	add r6, r0, #0
	add r4, r2, #0
	bl SealCase_CountSealOccurrenceInUse
	sub r1, r5, #1
	add r2, r6, r1
	mov r1, #0x12
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	add r0, r0, r1
	cmp r4, #0
	bge _0202CD66
	add r0, r4, r1
	bmi _0202CD62
	mov r0, #1
	pop {r4, r5, r6, pc}
_0202CD62:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202CD66:
	add r0, r0, r4
	cmp r0, #0x63
	bgt _0202CD70
	mov r0, #1
	pop {r4, r5, r6, pc}
_0202CD70:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end SealCase_CheckSealQuantity

	thumb_func_start SealCase_GetTotalSeals
SealCase_GetTotalSeals: ; 0x0202CD74
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r5, #0
	mov r4, #1
_0202CD7C:
	add r0, r6, #0
	add r1, r4, #0
	bl SealCase_CountSealOccurrenceAnywhere
	cmp r0, #0
	beq _0202CD8A
	add r5, r5, #1
_0202CD8A:
	add r4, r4, #1
	cmp r4, #0x51
	blt _0202CD7C
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end SealCase_GetTotalSeals

	thumb_func_start SealCase_CountSealOccurrenceAnywhere
SealCase_CountSealOccurrenceAnywhere: ; 0x0202CD94
	push {r3, r4, r5, lr}
	add r5, r1, #0
	sub r1, r5, #1
	add r4, r0, #0
	bl SealCase_CountSealOccurrenceInUse
	sub r1, r5, #1
	add r2, r4, r1
	mov r1, #0x12
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	add r0, r0, r1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end SealCase_CountSealOccurrenceAnywhere
