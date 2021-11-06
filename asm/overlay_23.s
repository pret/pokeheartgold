#include "constants/pokemon.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov23_022598C0
ov23_022598C0: ; 0x022598C0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x104
	add r6, r1, #0
	add r5, r0, #0
	cmp r6, #0xd
	blo _022598D0
	bl GF_AssertFail
_022598D0:
	add r0, r5, #0
	mov r1, #0x14
	bl AllocFromHeap
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x14
	mov r0, #0
_022598E0:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _022598E0
	mov r2, #0
	str r2, [sp]
	mov r0, #0x70
	add r1, r6, #0
	add r3, r5, #0
	bl GfGfxLoader_LoadFromNarc
	str r0, [r4]
	str r5, [r4, #0x10]
	str r6, [r4, #0xc]
	add r0, r5, #0
	bl AllocMonZeroed
	str r0, [r4, #4]
	add r0, r5, #0
	bl PlayerProfile_new
	str r0, [r4, #8]
	bl PlayerProfile_init
	add r6, #0xd
	add r0, r5, #0
	add r1, r6, #0
	bl ov23_02259C1C
	add r5, r0, #0
	add r1, sp, #4
	mov r2, #0x80
	bl CopyStringToU16Array
	add r0, r5, #0
	bl String_dtor
	ldr r0, [r4, #8]
	add r1, sp, #4
	bl Sav2_Profile_PlayerName_set
	ldr r1, [r4]
	ldr r0, [r4, #8]
	ldr r1, [r1, #0x40]
	bl PlayerProfile_SetTrainerGender
	add r0, r4, #0
	add sp, #0x104
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov23_022598C0

	thumb_func_start ov23_02259944
ov23_02259944: ; 0x02259944
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	ldr r0, [r4, #4]
	bl FreeToHeap
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov23_02259944

	thumb_func_start ov23_02259964
ov23_02259964: ; 0x02259964
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r0, #0
	str r2, [sp, #0xc]
	mov r0, #0xb
	add r5, r1, #0
	str r3, [sp, #0x10]
	bl AllocMonZeroed
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x70
	add r1, r5, #0
	mov r2, #0
	mov r3, #0xb
	bl GfGfxLoader_LoadFromNarc
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	add r1, r4, #0
	str r0, [sp]
	mov r0, #7
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	add r3, r5, #0
	bl ov23_02259C40
	ldr r0, [r7, #0xc]
	add r1, r6, #0
	bl sub_0202ECC0
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r6, #0
	add r7, r0, #0
	bl AddMonToParty
	cmp r5, #7
	bne _02259A14
	add r0, r7, #0
	bl GetPartyCount
	add r1, r0, #0
	add r0, r7, #0
	sub r1, r1, #1
	bl GetPartyMonByIndex
	add r5, #0xd
	str r0, [sp, #0x14]
	mov r0, #0xb
	add r1, r5, #0
	bl ov23_02259C1C
	add r5, r0, #0
	ldr r0, [r4, #0x3c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ItemToMailId
	add r1, r0, #0
	ldr r0, [r4, #0x20]
	add r3, r5, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r2, [r4, #0x40]
	add r0, r6, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl CreateKenyaMail
	add r7, r0, #0
	ldr r0, [sp, #0x14]
	mov r1, #0xaa
	add r2, r7, #0
	bl SetMonData
	add r0, r5, #0
	bl String_dtor
	add r0, r7, #0
	bl FreeToHeap
_02259A14:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov23_02259964

	thumb_func_start ov23_02259A24
ov23_02259A24: ; 0x02259A24
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r0, #0xb
	bl AllocMonZeroed
	add r5, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r0, #0x70
	mov r1, #7
	mov r2, #0
	mov r3, #0xb
	bl GfGfxLoader_LoadFromNarc
	add r4, r0, #0
	mov r0, #0x65
	str r0, [sp]
	mov r3, #7
	str r3, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x14
	bl ov23_02259C40
	mov r0, #0xb
	mov r1, #0x14
	bl ov23_02259C1C
	add r6, r0, #0
	ldr r0, [r4, #0x3c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ItemToMailId
	add r1, r0, #0
	ldr r0, [r4, #0x20]
	add r3, r6, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r2, [r4, #0x40]
	add r0, r5, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	bl CreateKenyaMail
	add r7, r0, #0
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	add r0, r7, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov23_02259A24

	thumb_func_start ov23_02259AA0
ov23_02259AA0: ; 0x02259AA0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r0, [r0, #0xc]
	add r4, r2, #0
	add r5, r1, #0
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	str r0, [sp, #4]
	bl GetPartyMonByIndex
	add r1, r5, #0
	str r0, [sp]
	bl MonIsInGameTradePoke
	cmp r0, #0
	bne _02259AC8
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02259AC8:
	ldr r0, [sp]
	mov r1, #MON_DATA_CAPSULE
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	beq _02259ADE
	add sp, #8
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_02259ADE:
	ldr r0, [sp, #4]
	mov r6, #0
	bl GetPartyCount
	add r7, r0, #0
	add r5, r6, #0
	cmp r7, #0
	ble _02259B28
_02259AEE:
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #3
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #1
	beq _02259B22
	add r0, r4, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02259B22
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02259B22
	add r6, r6, #1
_02259B22:
	add r5, r5, #1
	cmp r5, r7
	blt _02259AEE
_02259B28:
	cmp r6, #2
	bge _02259B32
	add sp, #8
	mov r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_02259B32:
	ldr r0, [sp]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	beq _02259B48
	add sp, #8
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_02259B48:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov23_02259AA0

	thumb_func_start ov23_02259B50
ov23_02259B50: ; 0x02259B50
	ldr r0, [r0]
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov23_02259B50

	thumb_func_start ov23_02259B58
ov23_02259B58: ; 0x02259B58
	ldr r0, [r0]
	ldr r0, [r0, #0x4c]
	bx lr
	.balign 4, 0
	thumb_func_end ov23_02259B58

	thumb_func_start ov23_02259B60
ov23_02259B60: ; 0x02259B60
	ldr r0, [r0]
	ldr r0, [r0, #0x50]
	bx lr
	.balign 4, 0
	thumb_func_end ov23_02259B60

	thumb_func_start ov23_02259B68
ov23_02259B68: ; 0x02259B68
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r6, r1, #0
	add r4, r2, #0
	bl SavArray_PlayerParty_get
	ldr r2, [r6, #4]
	add r1, r4, #0
	bl sub_02074740
	ldr r0, [r5, #0xc]
	ldr r1, [r6, #4]
	bl sub_0202ECC0
	pop {r4, r5, r6, pc}
	thumb_func_end ov23_02259B68

	thumb_func_start ov23_02259B88
ov23_02259B88: ; 0x02259B88
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r0, [r6, #0xc]
	add r7, r2, #0
	add r5, r1, #0
	add r4, r3, #0
	bl SavArray_PlayerParty_get
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r1, #0xa1
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, [r6, #0x20]
	ldr r0, [r0]
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #0x10]
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	ldr r1, [r5]
	ldr r3, [r5, #0xc]
	bl ov23_02259C40
	ldr r1, [sp, #0x20]
	add r0, r7, #0
	bl CopyPokemonToPokemon
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x24]
	bl CopyPokemonToPokemon
	ldr r0, [sp, #0x20]
	bl Mon_GetBoxMon
	str r0, [r4]
	ldr r0, [sp, #0x24]
	bl Mon_GetBoxMon
	str r0, [r4, #4]
	ldr r0, [r5, #8]
	str r0, [r4, #8]
	mov r0, #1
	str r0, [r4, #0x10]
	ldr r0, [r6, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0x14]
	add r0, r6, #0
	bl sub_020555E0
	cmp r0, #1
	bhi _02259C06
	mov r0, #0
	add sp, #0xc
	str r0, [r4, #0xc]
	pop {r4, r5, r6, r7, pc}
_02259C06:
	cmp r0, #2
	bne _02259C12
	mov r0, #1
	add sp, #0xc
	str r0, [r4, #0xc]
	pop {r4, r5, r6, r7, pc}
_02259C12:
	mov r0, #2
	str r0, [r4, #0xc]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov23_02259B88

	thumb_func_start ov23_02259C1C
ov23_02259C1C: ; 0x02259C1C
	push {r3, r4, r5, lr}
	add r3, r0, #0
	add r4, r1, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xc8
	bl NewMsgDataFromNarc
	add r5, r0, #0
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	bl DestroyMsgData
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov23_02259C1C

	thumb_func_start ov23_02259C40
ov23_02259C40: ; 0x02259C40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r3, #0
	mov r3, #1
	add r4, r1, #0
	str r3, [sp]
	ldr r1, [r4, #0x38]
	add r5, r0, #0
	str r1, [sp, #4]
	str r3, [sp, #8]
	ldr r1, [r4, #0x20]
	mov r3, #0x20
	str r1, [sp, #0xc]
	ldr r1, [r4]
	bl CreateMon
	ldr r7, [sp, #0x38]
	add r1, r6, #0
	add r0, r7, #0
	bl ov23_02259C1C
	str r0, [sp, #0x10]
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	mov r1, #0x77
	bl SetMonData
	ldr r0, [sp, #0x10]
	bl String_dtor
	mov r1, #1
	add r0, sp, #0x14
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #0x4d
	add r2, sp, #0x14
	bl SetMonData
	add r0, r5, #0
	mov r1, #0x46
	add r2, r4, #4
	bl SetMonData
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #0x47
	add r2, #8
	bl SetMonData
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #0x48
	add r2, #0xc
	bl SetMonData
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #0x49
	add r2, #0x10
	bl SetMonData
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #0x4a
	add r2, #0x14
	bl SetMonData
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #0x4b
	add r2, #0x18
	bl SetMonData
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #0x13
	add r2, #0x24
	bl SetMonData
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #0x14
	add r2, #0x28
	bl SetMonData
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #0x15
	add r2, #0x2c
	bl SetMonData
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #0x16
	add r2, #0x30
	bl SetMonData
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #0x17
	add r2, #0x34
	bl SetMonData
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #6
	add r2, #0x3c
	bl SetMonData
	add r6, #0xd
	add r0, r7, #0
	add r1, r6, #0
	bl ov23_02259C1C
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0x91
	add r2, r6, #0
	bl SetMonData
	add r0, r6, #0
	bl String_dtor
	add r2, r4, #0
	add r0, r5, #0
	mov r1, #0x9d
	add r2, #0x40
	bl SetMonData
	add r4, #0x48
	add r0, r5, #0
	mov r1, #0xc
	add r2, r4, #0
	bl SetMonData
	ldr r0, [sp, #0x30]
	bl MapHeader_GetMapSec
	add r3, r0, #0
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x34]
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0
	bl sub_0208F260
	add r0, r5, #0
	bl CalcMonLevelAndStats
	add r0, r5, #0
	bl MonIsShiny
	cmp r0, #0
	beq _02259D78
	bl GF_AssertFail
_02259D78:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov23_02259C40
