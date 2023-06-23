	.include "asm/macros.inc"
	.include "unk_02068DE0.inc"
	.include "global.inc"

	.rodata

sTrashCanData:
	.word 2
	.byte 1, 5, 0xFF, 0xFF
	.word 3
	.byte 0, 2, 6, 0xFF
	.word 3
	.byte 1, 3, 7, 0xFF
	.word 3
	.byte 2, 4, 8, 0xFF
	.word 2
	.byte 3, 9, 0xFF, 0xFF
	.word 3
	.byte 0, 6, 10, 0xFF
	.word 4
	.byte 1, 5, 7, 11
	.word 4
	.byte 2, 6, 8, 12
	.word 4
	.byte 3, 7, 9, 13
	.word 3
	.byte 4, 8, 14, 0xFF
	.word 2
	.byte 5, 11, 0xFF, 0xFF
	.word 3
	.byte 6, 10, 12, 0xFF
	.word 3
	.byte 7, 11, 13, 0xFF
	.word 3
	.byte 8, 12, 14, 0xFF
	.word 2
	.byte 9, 13, 0xFF, 0xFF

	.text

	thumb_func_start InitEcruteakGym
InitEcruteakGym: ; 0x02068DE0
	push {r4, lr}
	bl FieldSystem_GetSaveDataPtr
	bl Save_GetGymmickPtr
	add r4, r0, #0
	mov r1, #1
	bl SavGymmick_Init
	add r0, r4, #0
	mov r1, #1
	bl SavGymmick_AssertMagic_GetData
	mov r2, #0
	add r1, r2, #0
_02068DFE:
	strb r1, [r0, r2]
	add r2, r2, #1
	cmp r2, #4
	blt _02068DFE
	pop {r4, pc}
	thumb_func_end InitEcruteakGym

	thumb_func_start InitCianwoodGym
InitCianwoodGym: ; 0x02068E08
	push {r4, lr}
	bl FieldSystem_GetSaveDataPtr
	bl Save_GetGymmickPtr
	add r4, r0, #0
	mov r1, #2
	bl SavGymmick_Init
	add r0, r4, #0
	mov r1, #2
	bl SavGymmick_AssertMagic_GetData
	pop {r4, pc}
	thumb_func_end InitCianwoodGym

	thumb_func_start InitVermilionGym
InitVermilionGym: ; 0x02068E24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl FieldSystem_GetSaveDataPtr
	bl Save_GetGymmickPtr
	add r4, r0, #0
	mov r1, #3
	bl SavGymmick_Init
	add r0, r4, #0
	mov r1, #3
	bl SavGymmick_AssertMagic_GetData
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_PlayerData_GetProfileAddr
	mov r1, #0xa
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _02068E60
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	mov r0, #1
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	pop {r3, r4, r5, pc}
_02068E60:
	add r0, r5, #0
	bl PlaceVermilionGymSwitches
	mov r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end InitVermilionGym

	thumb_func_start PlaceVermilionGymSwitches
PlaceVermilionGymSwitches: ; 0x02068E70
	push {r3, r4, r5, r6, r7, lr}
	bl FieldSystem_GetSaveDataPtr
	bl Save_GetGymmickPtr
	mov r1, #3
	bl SavGymmick_AssertMagic_GetData
	add r5, r0, #0
	bl LCRandom
	mov r1, #0xf
	bl _s32_div_f
	strb r1, [r5]
	ldrb r0, [r5]
	ldr r7, _02068EAC ; =sTrashCanData
	lsl r4, r0, #3
	add r6, r7, r4
	bl LCRandom
	ldr r1, [r7, r4]
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	add r0, r6, r0
	ldrb r0, [r0, #4]
	strb r0, [r5, #1]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02068EAC: .word sTrashCanData
	thumb_func_end PlaceVermilionGymSwitches

	thumb_func_start InitVioletGym
InitVioletGym: ; 0x02068EB0
	push {r4, lr}
	bl FieldSystem_GetSaveDataPtr
	bl Save_GetGymmickPtr
	add r4, r0, #0
	mov r1, #4
	bl SavGymmick_Init
	add r0, r4, #0
	mov r1, #4
	bl SavGymmick_AssertMagic_GetData
	mov r1, #0
	str r1, [r0]
	pop {r4, pc}
	thumb_func_end InitVioletGym

	thumb_func_start InitAzaleaGym
InitAzaleaGym: ; 0x02068ED0
	push {r4, lr}
	bl FieldSystem_GetSaveDataPtr
	bl Save_GetGymmickPtr
	add r4, r0, #0
	mov r1, #5
	bl SavGymmick_Init
	add r0, r4, #0
	mov r1, #5
	bl SavGymmick_AssertMagic_GetData
	mov r2, #0
	strb r2, [r0]
	mov r1, #1
	strb r1, [r0, #1]
	mov r1, #2
	strb r1, [r0, #2]
	mov r1, #7
	strb r1, [r0, #3]
	str r2, [r0, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end InitAzaleaGym

	thumb_func_start InitBlackthornGym
InitBlackthornGym: ; 0x02068F00
	push {r4, lr}
	bl FieldSystem_GetSaveDataPtr
	bl Save_GetGymmickPtr
	add r4, r0, #0
	mov r1, #6
	bl SavGymmick_Init
	add r0, r4, #0
	mov r1, #6
	bl SavGymmick_AssertMagic_GetData
	mov r1, #0xd
	strh r1, [r0]
	mov r1, #0x4b
	strh r1, [r0, #6]
	mov r2, #0
	strb r2, [r0, #0xc]
	mov r1, #9
	strh r1, [r0, #2]
	mov r1, #0x3a
	strh r1, [r0, #8]
	mov r1, #1
	strb r1, [r0, #0xd]
	mov r1, #0xe
	strh r1, [r0, #4]
	mov r1, #0x20
	strh r1, [r0, #0xa]
	strb r2, [r0, #0xe]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end InitBlackthornGym

	thumb_func_start InitFuchsiaGym
InitFuchsiaGym: ; 0x02068F40
	push {r3, lr}
	bl FieldSystem_GetSaveDataPtr
	bl Save_GetGymmickPtr
	mov r1, #7
	bl SavGymmick_Init
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end InitFuchsiaGym

	thumb_func_start InitViridianGym
InitViridianGym: ; 0x02068F54
	push {r3, lr}
	bl FieldSystem_GetSaveDataPtr
	bl Save_GetGymmickPtr
	mov r1, #8
	bl SavGymmick_Init
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end InitViridianGym

	thumb_func_start Fsys_IsSavGymmickTypeEqualTo
Fsys_IsSavGymmickTypeEqualTo: ; 0x02068F68
	push {r4, lr}
	add r4, r1, #0
	bl FieldSystem_GetSaveDataPtr
	bl Save_GetGymmickPtr
	bl SavGymmick_GetType
	cmp r4, r0
	bne _02068F80
	mov r0, #1
	pop {r4, pc}
_02068F80:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end Fsys_IsSavGymmickTypeEqualTo
