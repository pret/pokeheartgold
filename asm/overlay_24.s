	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov24_022598C0
ov24_022598C0: ; 0x022598C0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #3
	mov r1, #0xc0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc0
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #3
	str r0, [r4]
	ldr r0, [r5, #0xc]
	str r0, [r4, #4]
	mov r0, #0x14
	strh r0, [r4, #0x18]
	ldr r0, [r4]
	bl AllocMonZeroed
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	bl Sav2_Pokedex_get
	bl Pokedex_GetNatDexFlag
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r4, #0x17]
	mov r2, #2
	lsr r0, r0, #0x1e
	bic r1, r2
	orr r0, r1
	strb r0, [r4, #0x17]
	add r0, r4, #0
	strb r6, [r4, #0x16]
	bl ov24_02259BB4
	add r0, r4, #0
	bl ov24_02259CC0
	add r0, r4, #0
	bl ov24_02259DF0
	add r0, r5, #0
	bl sub_02055418
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov24_022598C0

	thumb_func_start ov24_02259928
ov24_02259928: ; 0x02259928
	push {r4, lr}
	add r4, r0, #0
	bl ov24_02259C10
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov24_02259928

	thumb_func_start ov24_02259940
ov24_02259940: ; 0x02259940
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	mov r2, #5
	add r1, #0xac
	add r5, r4, #0
	strb r2, [r1]
	ldr r1, [r4, #0x10]
	add r5, #0xac
	bl ov24_02259E60
	strh r0, [r5, #2]
	ldr r0, [r4, #0x10]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r5, #6]
	mov r1, #0
_02259966:
	add r0, r4, r1
	add r0, #0xb8
	strb r1, [r0]
	add r1, r1, #1
	cmp r1, #6
	blt _02259966
	mov r6, #0
_02259974:
	add r0, r4, r6
	add r0, #0xb8
	ldrb r0, [r0]
	mov r1, #0xc
	add r2, r6, #1
	mul r1, r0
	mov ip, r0
	add r0, r4, r1
	add r0, #0x72
	add r3, r6, #0
	ldrh r5, [r0]
	cmp r2, #6
	bge _022599AE
	mov r7, #0xc
_02259990:
	add r0, r4, r2
	add r0, #0xb8
	ldrb r0, [r0]
	add r1, r0, #0
	mul r1, r7
	add r0, r4, r1
	add r0, #0x72
	ldrh r0, [r0]
	cmp r0, r5
	blt _022599A8
	add r3, r2, #0
	add r5, r0, #0
_022599A8:
	add r2, r2, #1
	cmp r2, #6
	blt _02259990
_022599AE:
	add r0, r4, r3
	add r0, #0xb8
	ldrb r1, [r0]
	add r0, r4, r6
	add r0, #0xb8
	strb r1, [r0]
	add r1, r4, r3
	add r1, #0xb8
	mov r0, ip
	add r6, r6, #1
	strb r0, [r1]
	cmp r6, #5
	blt _02259974
	ldrb r1, [r4, #0x17]
	mov r0, #0xfc
	mov r2, #0
	bic r1, r0
	mov r0, #0xc
	orr r0, r1
	strb r0, [r4, #0x17]
_022599D6:
	add r0, r4, r2
	add r0, #0xb8
	ldrb r0, [r0]
	cmp r0, #5
	bne _022599F4
	ldrb r1, [r4, #0x17]
	mov r0, #0xfc
	bic r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x18
	orr r0, r1
	strb r0, [r4, #0x17]
	b _022599FA
_022599F4:
	add r2, r2, #1
	cmp r2, #3
	blt _022599D6
_022599FA:
	ldrb r0, [r4, #0x17]
	lsl r1, r0, #0x18
	lsr r1, r1, #0x1a
	beq _02259A0C
	cmp r1, #1
	beq _02259A34
	cmp r1, #2
	beq _02259A3A
	b _02259A40
_02259A0C:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _02259A22
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	b _02259A24
_02259A22:
	mov r0, #0
_02259A24:
	cmp r0, #6
	bhs _02259A2E
	add r0, #0x50
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
_02259A2E:
	add r0, #0x65
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
_02259A34:
	mov r0, #0xe5
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
_02259A3A:
	mov r0, #0x9e
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
_02259A40:
	ldr r0, _02259A48 ; =0x00000127
	strh r0, [r4, #0x1a]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259A48: .word 0x00000127
	thumb_func_end ov24_02259940

	thumb_func_start ov24_02259A4C
ov24_02259A4C: ; 0x02259A4C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r2, #0
	add r2, r0, r3
	add r2, #0xb8
	ldrb r4, [r2]
	add r6, r1, #0
	add r1, r0, #0
	mov r2, #0xc
	add r1, #0x70
	mul r2, r4
	add r4, r1, r2
	ldrb r1, [r0, #0x17]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1a
	cmp r3, r1
	bne _02259A80
	ldr r0, [r0, #4]
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl BufferPlayersName
	b _02259AB4
_02259A80:
	ldrb r1, [r4]
	add r0, r6, #0
	add r1, #0x4e
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	add r0, r5, #0
	mov r1, #0
	add r2, r6, #0
	str r3, [sp, #4]
	bl BufferString
	add r0, r6, #0
	bl String_dtor
	ldrb r2, [r4]
	add r0, r5, #0
	mov r1, #2
	lsl r3, r2, #1
	ldr r2, _02259AD8 ; =_02259F28
	ldrh r2, [r2, r3]
	bl BufferTrainerClassName
_02259AB4:
	ldrh r2, [r4, #6]
	add r0, r5, #0
	mov r1, #1
	bl BufferSpeciesName
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r1, #3
	ldrh r2, [r4, #2]
	add r0, r5, #0
	add r3, r1, #0
	bl BufferIntegerAsString
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02259AD8: .word _02259F28
	thumb_func_end ov24_02259A4C

	thumb_func_start ov24_02259ADC
ov24_02259ADC: ; 0x02259ADC
	mov r3, #0
_02259ADE:
	add r2, r0, #0
	add r2, #0x70
	ldrb r2, [r2]
	cmp r1, r2
	bne _02259AEC
	mov r0, #1
	bx lr
_02259AEC:
	add r3, r3, #1
	add r0, #0xc
	cmp r3, #5
	blt _02259ADE
	mov r0, #0
	bx lr
	thumb_func_end ov24_02259ADC

	thumb_func_start ov24_02259AF8
ov24_02259AF8: ; 0x02259AF8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5, #0x17]
	add r4, r1, #0
	add r6, r2, #0
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02259B10
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02259B10:
	ldr r1, [r5]
	mov r0, #0xc
	bl String_ctor
	add r7, r0, #0
	ldr r0, [r5, #0x10]
	mov r1, #0x77
	add r2, r7, #0
	bl GetMonData
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	str r3, [sp, #4]
	bl BufferString
	add r0, r7, #0
	bl String_dtor
	ldrb r0, [r5, #0x15]
	cmp r0, #6
	blo _02259B48
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02259B48:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov24_02259AF8

	thumb_func_start ov24_02259B50
ov24_02259B50: ; 0x02259B50
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	bl LCRandom
	mov r1, #0x64
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r3, r0, #0x10
	mov r1, #0
	add r2, r5, #0
_02259B70:
	add r0, r2, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r3, r0
	bge _02259B82
	add r1, r1, #1
	add r2, #8
	cmp r1, #0xa
	blt _02259B70
_02259B82:
	lsl r7, r1, #3
	add r1, r5, r7
	ldrh r0, [r1, #0x20]
	add r5, #0x22
	add r1, #0x23
	str r0, [r6]
	ldrb r1, [r1]
	ldrb r0, [r5, r7]
	sub r0, r1, r0
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	ldrb r0, [r5, r7]
	add r0, r0, r1
	strh r0, [r6, #4]
	mov r0, #0
	strh r0, [r6, #6]
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov24_02259B50

	thumb_func_start ov24_02259BB4
ov24_02259BB4: ; 0x02259BB4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl SavArray_Party_alloc
	str r0, [r5, #8]
	ldr r0, [r5, #4]
	bl SavArray_PlayerParty_get
	str r0, [r5, #0xc]
	ldr r1, [r5, #8]
	bl sub_020748B8
	ldr r0, [r5, #0xc]
	bl GetPartyCount
	strb r0, [r5, #0x15]
	ldr r0, [r5, #4]
	bl sub_0205BD64
	strb r0, [r5, #0x14]
	ldrb r0, [r5, #0x15]
	mov r4, #0
	sub r0, r0, #1
	cmp r0, #0
	ble _02259C0C
	mov r7, #1
	add r6, r4, #0
_02259BEC:
	ldrb r0, [r5, #0x14]
	cmp r4, r0
	ldr r0, [r5, #0xc]
	bge _02259BFC
	add r1, r6, #0
	bl RemoveMonFromParty
	b _02259C02
_02259BFC:
	add r1, r7, #0
	bl RemoveMonFromParty
_02259C02:
	ldrb r0, [r5, #0x15]
	add r4, r4, #1
	sub r0, r0, #1
	cmp r4, r0
	blt _02259BEC
_02259C0C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov24_02259BB4

	thumb_func_start ov24_02259C10
ov24_02259C10: ; 0x02259C10
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4]
	bl AllocMonZeroed
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl GetPartyMonByIndex
	add r1, r5, #0
	bl CopyPokemonToPokemon
	ldr r0, [r4, #0xc]
	add r1, sp, #0
	mov r2, #0
	bl sub_02074670
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	bl sub_020748B8
	ldrb r1, [r4, #0x14]
	ldr r0, [r4, #0xc]
	add r2, r5, #0
	bl sub_02074740
	ldrb r2, [r4, #0x14]
	ldr r0, [r4, #0xc]
	add r1, sp, #0
	bl sub_020746BC
	add r0, r5, #0
	bl FreeToHeap
	ldr r0, [r4, #8]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #8]
	ldrb r0, [r4, #0x17]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _02259C92
	ldrb r0, [r4, #0x15]
	cmp r0, #6
	blo _02259C8A
	ldr r0, [r4, #4]
	bl GetStoragePCPointer
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	bl Mon_GetBoxMon
	add r1, r0, #0
	add r0, r5, #0
	bl PCStorage_PlaceMonInFirstEmptySlotInAnyBox
	add sp, #8
	pop {r3, r4, r5, pc}
_02259C8A:
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	bl AddMonToParty
_02259C92:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov24_02259C10

	thumb_func_start ov24_02259C98
ov24_02259C98: ; 0x02259C98
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _02259CB8
_02259CA0:
	add r3, r0, #0
	add r3, #0x70
	ldrb r3, [r3]
	cmp r1, r3
	bne _02259CB0
	mov r0, #1
	pop {r3, r4}
	bx lr
_02259CB0:
	add r4, r4, #1
	add r0, #0xc
	cmp r4, r2
	blt _02259CA0
_02259CB8:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov24_02259C98

	thumb_func_start ov24_02259CC0
ov24_02259CC0: ; 0x02259CC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	add r5, r0, #0
	add r0, sp, #0x10
	bl FS_InitFile
	ldr r1, _02259DEC ; =_02259F40
	add r0, sp, #0x10
	bl FS_OpenFile
	cmp r0, #0
	bne _02259CE0
	bl GF_AssertFail
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
_02259CE0:
	ldr r1, [sp, #0x38]
	ldr r0, [sp, #0x34]
	sub r4, r1, r0
	ldr r0, [r5]
	add r1, r4, #0
	bl AllocFromHeapAtEnd
	str r0, [sp, #0xc]
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	ldr r1, [sp, #0xc]
	add r0, sp, #0x10
	add r2, r4, #0
	bl FS_ReadFile
	mov r2, #0
	add r3, r5, #0
	mov r1, #0xff
_02259D0A:
	add r0, r3, #0
	add r0, #0x70
	add r2, r2, #1
	add r3, #0xc
	strb r1, [r0]
	cmp r2, #5
	blt _02259D0A
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	str r0, [sp, #4]
	add r0, #0x74
	add r7, r5, #0
	str r0, [sp, #4]
_02259D26:
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	ldr r2, [sp]
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	lsl r2, r2, #0x18
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl ov24_02259C98
	cmp r0, #0
	bne _02259D26
	add r0, r7, #0
	add r0, #0x70
	strb r4, [r0]
	add r0, r7, #0
	add r0, #0x70
	ldrb r0, [r0]
	mov r4, #0
	add r2, r4, #0
	lsl r1, r0, #6
	ldr r0, [sp, #0xc]
	add r0, r0, r1
	str r0, [sp, #8]
	add r3, r0, #0
_02259D60:
	ldrb r0, [r3]
	cmp r0, #0
	beq _02259D6E
	ldrb r0, [r5, #0x17]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _02259D7E
_02259D6E:
	ldrb r1, [r3, #1]
	cmp r1, #7
	bhs _02259D7A
	ldrb r0, [r5, #0x16]
	cmp r0, r1
	bne _02259D7E
_02259D7A:
	strb r2, [r6, r4]
	add r4, r4, #1
_02259D7E:
	add r2, r2, #1
	add r3, #8
	cmp r2, #8
	blt _02259D60
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	ldrb r0, [r6, r1]
	mov r2, #8
	lsl r1, r0, #3
	ldr r0, [sp, #8]
	add r0, r0, r1
	ldr r1, [sp, #4]
	bl MI_CpuCopy8
	add r0, r7, #0
	add r0, #0x7a
	ldrh r4, [r0]
	bl LCRandom
	lsl r1, r4, #1
	bl _s32_div_f
	sub r0, r1, r4
	lsl r0, r0, #0x10
	asr r1, r0, #0x10
	add r0, r7, #0
	add r0, #0x78
	ldrh r0, [r0]
	add r1, r1, r0
	add r0, r7, #0
	add r0, #0x72
	strh r1, [r0]
	ldr r0, [sp, #4]
	add r7, #0xc
	add r0, #0xc
	str r0, [sp, #4]
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #5
	blt _02259D26
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [sp, #0xc]
	bl FreeToHeap
	add r0, sp, #0x10
	bl FS_CloseFile
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02259DEC: .word _02259F40
	thumb_func_end ov24_02259CC0

	thumb_func_start ov24_02259DF0
ov24_02259DF0: ; 0x02259DF0
	push {r4, r5, r6, lr}
	sub sp, #0x48
	add r5, r0, #0
	add r0, sp, #0
	bl FS_InitFile
	ldr r1, _02259E5C ; =_02259F60
	add r0, sp, #0
	bl FS_OpenFile
	cmp r0, #0
	bne _02259E10
	bl GF_AssertFail
	add sp, #0x48
	pop {r4, r5, r6, pc}
_02259E10:
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x24]
	sub r6, r1, r0
	ldr r0, [r5]
	add r1, r6, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, sp, #0
	add r1, r4, #0
	add r2, r6, #0
	bl FS_ReadFile
	ldrb r0, [r5, #0x17]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _02259E38
	ldrb r0, [r5, #0x16]
	lsr r1, r0, #1
	b _02259E3A
_02259E38:
	mov r1, #0
_02259E3A:
	mov r0, #0xa
	mul r0, r1
	lsl r0, r0, #3
	add r5, #0x20
	add r0, r4, r0
	add r1, r5, #0
	mov r2, #0x50
	bl MI_CpuCopy8
	add r0, r4, #0
	bl FreeToHeap
	add r0, sp, #0
	bl FS_CloseFile
	add sp, #0x48
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02259E5C: .word _02259F60
	thumb_func_end ov24_02259DF0

	thumb_func_start ov24_02259E60
ov24_02259E60: ; 0x02259E60
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0x17]
	mov r7, #0
	add r6, r1, #0
	lsl r0, r0, #0x1f
	add r5, r7, #0
	lsr r0, r0, #0x1f
	bne _02259E76
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
_02259E76:
	add r0, r6, #0
	mov r1, #5
	add r2, r7, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	add r1, r7, #0
	add r3, r4, #0
_02259E88:
	ldrh r0, [r3, #0x20]
	cmp r2, r0
	bne _02259EA4
	add r0, r4, #0
	lsl r1, r1, #3
	add r0, #0x20
	add r5, r0, r1
	add r0, r4, r1
	add r0, #0x25
	ldrb r0, [r0]
	add r0, r7, r0
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	b _02259EAC
_02259EA4:
	add r1, r1, #1
	add r3, #8
	cmp r1, #0xa
	blt _02259E88
_02259EAC:
	cmp r5, #0
	bne _02259EB8
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02259EB8:
	add r0, r6, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	mov r1, #0x64
	mul r1, r0
	add r0, r1, #0
	ldrb r1, [r5, #3]
	bl _u32_div_f
	add r0, r7, r0
	lsl r0, r0, #0x10
	mov r4, #0
	lsr r7, r0, #0x10
	add r5, r4, #0
_02259ED8:
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0x46
	mov r2, #0
	bl GetMonData
	add r0, r4, r0
	lsl r0, r0, #0x10
	add r5, r5, #1
	lsr r4, r0, #0x10
	cmp r5, #6
	blt _02259ED8
	mov r0, #0x64
	mul r0, r4
	mov r1, #0xba
	bl _s32_div_f
	add r0, r7, r0
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r6, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	mov r0, #0x64
	mul r0, r4
	bl _u32_div_f
	add r0, r7, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov24_02259E60

	.rodata

_02259F28:
	.byte 0x06, 0x00, 0x06, 0x00, 0x19, 0x00, 0x14, 0x00
	.byte 0x06, 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x02, 0x00, 0x3C, 0x00

	.data

	.balign 4, 0
_02259F40:
	.asciz "data/mushi/mushi_trainer.bin"
	.balign 4, 0
_02259F60:
	.asciz "data/mushi/mushi_encount.bin"
	.balign 4, 0
	; 0x02259F80
