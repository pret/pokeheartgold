	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D41CC:
	.space 0xC

_021D41D8:
	.space 0x40

	.rodata

_020FC7CC:
	.byte 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x00, 0x00, 0x00

	.text

	thumb_func_start sub_02058AEC
sub_02058AEC: ; 0x02058AEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	add r6, r1, #0
	ldr r0, [sp, #0x24]
	mov r1, #0x3c
	str r2, [sp]
	str r3, [sp, #4]
	ldr r5, [r6, #0xc]
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r6, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208AD34
	add r0, r5, #0
	bl SavArray_IsNatDexEnabled
	str r0, [r4, #0x1c]
	add r0, r5, #0
	bl sub_02088288
	str r0, [r4, #0x2c]
	add r0, r5, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	ldr r0, [sp]
	str r0, [r4]
	mov r0, #1
	strb r0, [r4, #0x11]
	ldr r0, [sp, #4]
	strb r0, [r4, #0x14]
	ldr r0, [r4]
	bl GetPartyCount
	strb r0, [r4, #0x13]
	mov r0, #0
	strh r0, [r4, #0x18]
	ldr r0, [sp, #0x20]
	strb r0, [r4, #0x12]
	add r0, r5, #0
	bl Save_SpecialRibbons_get
	str r0, [r4, #0x20]
	mov r0, #0
	str r0, [r4, #0x30]
	add r0, r5, #0
	bl sub_0208828C
	str r0, [r4, #0x34]
	ldr r1, _02058B7C ; =_020FC7CC
	add r0, r4, #0
	bl sub_02089D40
	ldr r1, _02058B80 ; =_02103A1C
	add r0, r6, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	str r4, [r7]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02058B7C: .word _020FC7CC
_02058B80: .word _02103A1C
	thumb_func_end sub_02058AEC

	thumb_func_start sub_02058B84
sub_02058B84: ; 0x02058B84
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r5, #0x24]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x24]
	add r0, #0xa4
	ldr r0, [r0]
	str r0, [r4, #0x14]
	ldr r0, [r5, #0x24]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0x24]
	ldr r0, [r0, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	mov r0, #0x43
	ldr r1, [r5, #0x24]
	lsl r0, r0, #2
	add r0, r1, r0
	str r0, [r4, #0x20]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #2
	add r0, #0x24
	strb r1, [r0]
	ldr r0, [r5, #0x24]
	add r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	beq _02058C1E
	mov r1, #1
	bl sub_020290FC
	add r1, r4, #0
	add r1, #0x36
	ldrb r1, [r1]
	mov r2, #0xf
	lsl r0, r0, #0x18
	bic r1, r2
	lsr r2, r0, #0x18
	mov r0, #0xf
	and r0, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x36
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x36
	ldrb r0, [r0]
	mov r1, #0xf0
	bic r0, r1
	add r1, r4, #0
	add r1, #0x36
	ldrb r1, [r1]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x18
	b _02058C3E
_02058C1E:
	add r0, r4, #0
	add r0, #0x36
	ldrb r1, [r0]
	mov r0, #0xf
	bic r1, r0
	mov r0, #3
	orr r1, r0
	add r0, r4, #0
	add r0, #0x36
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x36
	ldrb r1, [r0]
	mov r0, #0xf0
	bic r1, r0
	mov r0, #0x30
_02058C3E:
	orr r1, r0
	add r0, r4, #0
	add r0, #0x36
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0x64
	add r0, #0x37
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x3c
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x26
	strb r1, [r0]
	mov r2, #0
_02058C5C:
	add r0, r5, r2
	add r0, #0x3d
	ldrb r1, [r0]
	add r0, r4, r2
	add r0, #0x30
	add r2, r2, #1
	strb r1, [r0]
	cmp r2, #6
	blt _02058C5C
	ldr r0, [r5, #0x24]
	ldr r1, _02058C7C ; =_0210159C
	add r2, r4, #0
	bl Fsys_LaunchApplication
	str r4, [r5, #4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02058C7C: .word _0210159C
	thumb_func_end sub_02058B84

	thumb_func_start sub_02058C80
sub_02058C80: ; 0x02058C80
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _02058C92
	mov r0, #0
	pop {r4, pc}
_02058C92:
	ldr r0, [r4, #4]
	add r1, r4, #0
	add r0, #0x30
	add r1, #0x3d
	mov r2, #6
	bl MI_CpuCopy8
	ldr r0, [r4, #4]
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #6
	beq _02058CB4
	cmp r0, #7
	bne _02058CBA
	mov r0, #0
	str r0, [r4, #0x38]
	b _02058CBE
_02058CB4:
	mov r0, #1
	str r0, [r4, #0x38]
	b _02058CBE
_02058CBA:
	mov r0, #2
	str r0, [r4, #0x38]
_02058CBE:
	ldr r0, [r4, #4]
	add r0, #0x26
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x3c
	strb r1, [r0]
	ldr r0, [r4, #4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #4]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end sub_02058C80

	thumb_func_start sub_02058CD8
sub_02058CD8: ; 0x02058CD8
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _02058CEA
	mov r0, #0
	pop {r4, pc}
_02058CEA:
	ldr r0, [r4]
	ldrb r1, [r0, #0x14]
	add r0, r4, #0
	add r0, #0x3c
	strb r1, [r0]
	ldr r0, [r4]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02058CD8

	thumb_func_start sub_02058D04
sub_02058D04: ; 0x02058D04
	push {r3, lr}
	ldr r0, [r0, #0x24]
	bl sub_020505C8
	cmp r0, #0
	beq _02058D1E
	mov r0, #1
	bl ov01_021E636C
	bl sub_02056E60
	mov r0, #1
	pop {r3, pc}
_02058D1E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02058D04

	thumb_func_start sub_02058D24
sub_02058D24: ; 0x02058D24
	push {r3, r4, r5, lr}
	bl sub_02037454
	add r5, r0, #0
	mov r4, #0
	cmp r5, #0
	ble _02058D46
_02058D32:
	add r0, r4, #0
	bl sub_02037B5C
	cmp r0, #0x5e
	bne _02058D40
	mov r0, #1
	pop {r3, r4, r5, pc}
_02058D40:
	add r4, r4, #1
	cmp r4, r5
	blt _02058D32
_02058D46:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02058D24

	thumb_func_start sub_02058D4C
sub_02058D4C: ; 0x02058D4C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	ldr r1, [r4, #0x34]
	cmp r1, #0x2c
	bls _02058D66
	b _02059472
_02058D66:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02058D72: ; jump table
	.short _02058DCC - _02058D72 - 2 ; case 0
	.short _02058DEE - _02058D72 - 2 ; case 1
	.short _02058E08 - _02058D72 - 2 ; case 2
	.short _02058E22 - _02058D72 - 2 ; case 3
	.short _02058E5E - _02058D72 - 2 ; case 4
	.short _02058EAE - _02058D72 - 2 ; case 5
	.short _02059472 - _02058D72 - 2 ; case 6
	.short _02058E9C - _02058D72 - 2 ; case 7
	.short _02058EC4 - _02058D72 - 2 ; case 8
	.short _02058EEA - _02058D72 - 2 ; case 9
	.short _02058EF6 - _02058D72 - 2 ; case 10
	.short _02058F22 - _02058D72 - 2 ; case 11
	.short _02058F40 - _02058D72 - 2 ; case 12
	.short _02058F54 - _02058D72 - 2 ; case 13
	.short _02058F60 - _02058D72 - 2 ; case 14
	.short _02058F82 - _02058D72 - 2 ; case 15
	.short _02058F98 - _02058D72 - 2 ; case 16
	.short _02058FC6 - _02058D72 - 2 ; case 17
	.short _02058FEC - _02058D72 - 2 ; case 18
	.short _02058FFE - _02058D72 - 2 ; case 19
	.short _02059042 - _02058D72 - 2 ; case 20
	.short _02059022 - _02058D72 - 2 ; case 21
	.short _0205905E - _02058D72 - 2 ; case 22
	.short _0205906E - _02058D72 - 2 ; case 23
	.short _0205908C - _02058D72 - 2 ; case 24
	.short _020590AA - _02058D72 - 2 ; case 25
	.short _020590BE - _02058D72 - 2 ; case 26
	.short _0205912A - _02058D72 - 2 ; case 27
	.short _02059162 - _02058D72 - 2 ; case 28
	.short _02059178 - _02058D72 - 2 ; case 29
	.short _020591C2 - _02058D72 - 2 ; case 30
	.short _020591FA - _02058D72 - 2 ; case 31
	.short _02059220 - _02058D72 - 2 ; case 32
	.short _02059340 - _02058D72 - 2 ; case 33
	.short _02059370 - _02058D72 - 2 ; case 34
	.short _02059388 - _02058D72 - 2 ; case 35
	.short _02059274 - _02058D72 - 2 ; case 36
	.short _020592B2 - _02058D72 - 2 ; case 37
	.short _020592CE - _02058D72 - 2 ; case 38
	.short _02059398 - _02058D72 - 2 ; case 39
	.short _02059472 - _02058D72 - 2 ; case 40
	.short _020593BC - _02058D72 - 2 ; case 41
	.short _020593FE - _02058D72 - 2 ; case 42
	.short _02059420 - _02058D72 - 2 ; case 43
	.short _02059452 - _02058D72 - 2 ; case 44
_02058DCC:
	add r0, r4, #0
	add r0, #0x43
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x43
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x43
	ldrb r0, [r0]
	cmp r0, #0
	bne _02058E94
	mov r0, #1
	str r0, [r4, #0x34]
	bl sub_02057E08
	b _02059472
_02058DEE:
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0xc]
	mov r1, #1
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	bl sub_02059478
	str r0, [r4, #0x30]
	mov r0, #2
	str r0, [r4, #0x34]
	b _02059472
_02058E08:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	beq _02058E94
	mov r0, #0x5d
	bl sub_02037AC0
	mov r0, #3
	str r0, [r4, #0x34]
	b _02059472
_02058E22:
	mov r0, #0x5d
	bl sub_02037B38
	cmp r0, #0
	beq _02058E42
	mov r0, #7
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x24]
	ldr r0, [r0, #0x3c]
	bl sub_0205F55C
	ldr r1, [r4, #0x50]
	ldr r2, [r4, #8]
	mov r0, #1
	blx r2
	b _02059472
_02058E42:
	ldr r0, _02059148 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #2
	tst r0, r1
	beq _02058E94
	mov r0, #4
	str r0, [r4, #0x34]
	mov r0, #0x5c
	bl sub_02037AC0
	mov r0, #5
	add r4, #0x43
	strb r0, [r4]
	b _02059472
_02058E5E:
	mov r0, #0x5d
	bl sub_02037B38
	cmp r0, #0
	beq _02058E7C
	mov r0, #7
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x24]
	ldr r0, [r0, #0x3c]
	bl sub_0205F55C
	ldr r1, [r4, #0x50]
	ldr r2, [r4, #8]
	mov r0, #1
	blx r2
_02058E7C:
	add r0, r4, #0
	add r0, #0x43
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x43
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x43
	ldrb r0, [r0]
	cmp r0, #0
	beq _02058E96
_02058E94:
	b _02059472
_02058E96:
	mov r0, #8
	str r0, [r4, #0x34]
	b _02059472
_02058E9C:
	add r0, r4, #0
	bl sub_02059650
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, pc}
_02058EAE:
	add r0, r4, #0
	bl sub_02059650
	add r0, r4, #0
	bl FreeToHeap
	bl sub_02057F70
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, pc}
_02058EC4:
	mov r0, #0x5d
	bl sub_02037B38
	cmp r0, #0
	beq _02058EDC
	mov r0, #5
	str r0, [r4, #0x34]
	ldr r1, [r4, #0x50]
	ldr r2, [r4, #8]
	mov r0, #1
	blx r2
	b _02059472
_02058EDC:
	ldr r1, [r4, #0x50]
	ldr r2, [r4, #8]
	mov r0, #0
	blx r2
	mov r0, #5
	str r0, [r4, #0x34]
	b _02059472
_02058EEA:
	mov r0, #0xa
	str r0, [r4, #0x34]
	mov r0, #5
	add r4, #0x44
	strb r0, [r4]
	b _02059472
_02058EF6:
	add r1, r4, #0
	add r1, #0x44
	ldrb r1, [r1]
	cmp r1, #0
	beq _02058F0E
	add r0, r4, #0
	add r0, #0x44
	ldrb r0, [r0]
	add r4, #0x44
	sub r0, r0, #1
	strb r0, [r4]
	b _02059472
_02058F0E:
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_IsMovementPaused
	cmp r0, #0
	beq _02058FB2
	mov r0, #0xb
	str r0, [r4, #0x34]
	b _02059472
_02058F22:
	bl sub_02057E08
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0xc]
	mov r1, #0xd
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	bl sub_02059478
	str r0, [r4, #0x30]
	mov r0, #0xc
	str r0, [r4, #0x34]
	b _02059472
_02058F40:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	beq _02058FB2
	mov r0, #0xd
	str r0, [r4, #0x34]
	b _02059472
_02058F54:
	mov r0, #0
	bl ov01_021E636C
	mov r0, #0xe
	str r0, [r4, #0x34]
	b _02059472
_02058F60:
	add r0, r4, #0
	add r0, #0x43
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x43
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x43
	ldrb r0, [r0]
	cmp r0, #0
	bne _02058FB2
	bl sub_02057E08
	mov r0, #0xf
	str r0, [r4, #0x34]
	b _02059472
_02058F82:
	add r0, r4, #0
	mov r1, #0
	bl sub_020594C8
	add r0, r4, #0
	mov r1, #0xb
	bl sub_02058B84
	mov r0, #0x10
	str r0, [r4, #0x34]
	b _02059472
_02058F98:
	ldr r1, [r4, #0x24]
	add r0, r4, #0
	bl sub_02058C80
	cmp r0, #0
	beq _02058FB2
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _02058FB4
	cmp r0, #1
	beq _02058FBA
	cmp r0, #2
	beq _02058FC0
_02058FB2:
	b _02059472
_02058FB4:
	mov r0, #0x14
	str r0, [r4, #0x34]
	b _02059472
_02058FBA:
	mov r0, #0x13
	str r0, [r4, #0x34]
	b _02059472
_02058FC0:
	mov r0, #0x11
	str r0, [r4, #0x34]
	b _02059472
_02058FC6:
	ldr r0, [r4, #0x24]
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	add r3, r4, #0
	add r3, #0x3c
	ldrb r3, [r3]
	ldr r1, [r4, #0x24]
	add r0, r4, #0
	bl sub_02058AEC
	mov r0, #0x12
	str r0, [r4, #0x34]
	b _02059472
_02058FEC:
	ldr r1, [r4, #0x24]
	add r0, r4, #0
	bl sub_02058CD8
	cmp r0, #0
	beq _020590C8
	mov r0, #0xf
	str r0, [r4, #0x34]
	b _02059472
_02058FFE:
	ldr r0, [r4, #0x24]
	bl sub_020505C0
	add r0, r4, #0
	add r0, #0x88
	ldrb r0, [r0]
	cmp r0, #3
	beq _0205901C
	add r0, r4, #0
	mov r1, #5
	add r0, #0x43
	strb r1, [r0]
	mov r0, #0x15
	str r0, [r4, #0x34]
	b _02059472
_0205901C:
	mov r0, #0x1a
	str r0, [r4, #0x34]
	b _02059472
_02059022:
	add r0, r4, #0
	add r0, #0x3d
	bl sub_0203996C
	add r0, r4, #0
	bl sub_02058D04
	cmp r0, #0
	beq _020590C8
	add r0, r4, #0
	mov r1, #5
	add r0, #0x43
	strb r1, [r0]
	mov r0, #0
	str r0, [r4, #0x34]
	b _02059472
_02059042:
	ldr r0, [r4, #0x24]
	bl sub_020505C0
	add r0, r4, #0
	add r0, #0x88
	ldrb r0, [r0]
	cmp r0, #3
	beq _02059058
	mov r0, #0x16
	str r0, [r4, #0x34]
	b _02059472
_02059058:
	mov r0, #0x1a
	str r0, [r4, #0x34]
	b _02059472
_0205905E:
	add r0, r4, #0
	bl sub_02058D04
	cmp r0, #0
	beq _020590C8
	mov r0, #8
	str r0, [r4, #0x34]
	b _02059472
_0205906E:
	add r0, r4, #0
	add r0, #0x44
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x44
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x44
	ldrb r0, [r0]
	cmp r0, #0
	bne _020590C8
	mov r0, #0x18
	str r0, [r4, #0x34]
	b _02059472
_0205908C:
	bl sub_02057E08
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0xc]
	mov r1, #0x13
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	bl sub_02059478
	str r0, [r4, #0x30]
	mov r0, #0x19
	str r0, [r4, #0x34]
	b _02059472
_020590AA:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	beq _020590C8
	mov r0, #0xd
	str r0, [r4, #0x34]
	b _02059472
_020590BE:
	add r0, r4, #0
	bl sub_02058D04
	cmp r0, #0
	bne _020590CA
_020590C8:
	b _02059472
_020590CA:
	bl sub_02058D24
	cmp r0, #0
	beq _020590D8
	mov r0, #5
	str r0, [r4, #0x34]
	b _02059472
_020590D8:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _020590E2
	mov r1, #1
	b _020590E4
_020590E2:
	mov r1, #0
_020590E4:
	add r0, r4, #0
	add r0, #0x82
	strb r1, [r0]
	add r1, r4, #0
	add r1, #0x82
	ldrb r1, [r1]
	add r0, r4, #0
	bl sub_020596A8
	mov r0, #0
	bl sub_02037AC0
	ldr r0, [r4, #0x28]
	ldr r2, [r4, #0x74]
	mov r1, #0
	bl BufferPlayersName
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0xc]
	mov r1, #0xe
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0xc]
	bl StringExpandPlaceholders
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	bl sub_02059478
	str r0, [r4, #0x30]
	mov r0, #0x1b
	str r0, [r4, #0x34]
	b _02059472
_0205912A:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	beq _0205922E
	bl sub_02058D24
	cmp r0, #0
	beq _0205914C
	mov r0, #5
	str r0, [r4, #0x34]
	b _02059472
	nop
_02059148: .word gSystem
_0205914C:
	mov r0, #0
	bl sub_02037B38
	cmp r0, #0
	beq _0205922E
	add r0, r4, #0
	bl sub_020596F0
	mov r0, #0x1c
	str r0, [r4, #0x34]
	b _02059472
_02059162:
	add r0, r4, #0
	bl sub_02059738
	cmp r0, #0
	beq _0205922E
	mov r0, #1
	bl sub_02037AC0
	mov r0, #0x1d
	str r0, [r4, #0x34]
	b _02059472
_02059178:
	mov r0, #1
	bl sub_02037B38
	cmp r0, #0
	beq _0205922E
	add r0, r4, #0
	bl sub_02059748
	add r1, r4, #0
	add r1, #0x83
	strb r0, [r1]
	add r0, r4, #0
	add r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	beq _020591BC
	add r0, r4, #0
	add r0, #0x83
	ldrb r0, [r0]
	cmp r0, #0
	beq _020591BC
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0xc]
	mov r1, #0x14
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	bl sub_02059478
	str r0, [r4, #0x30]
	mov r0, #0x1e
	str r0, [r4, #0x34]
	b _02059472
_020591BC:
	mov r0, #0x2a
	str r0, [r4, #0x34]
	b _02059472
_020591C2:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	beq _0205922E
	add r0, r4, #0
	mov r1, #0
	add r0, #0x89
	strb r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0xc]
	mov r1, #0x11
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	bl sub_02059478
	str r0, [r4, #0x30]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x84
	strb r1, [r0]
	mov r0, #0x1f
	str r0, [r4, #0x34]
	b _02059472
_020591FA:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	beq _0205922E
	add r0, r4, #0
	bl sub_020597A8
	add r1, r4, #0
	add r1, #0x84
	ldrb r1, [r1]
	add r0, r4, #0
	bl sub_02059820
	mov r0, #0x20
	str r0, [r4, #0x34]
	b _02059472
_02059220:
	add r0, r4, #0
	bl sub_02059A08
	cmp r0, #1
	beq _02059230
	cmp r0, #2
	beq _02059246
_0205922E:
	b _02059472
_02059230:
	add r0, r4, #0
	bl sub_02059AD8
	mov r0, #0x81
	ldrsb r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x84
	strb r1, [r0]
	mov r0, #0x24
	str r0, [r4, #0x34]
	b _02059472
_02059246:
	add r0, r4, #0
	bl sub_02059AD8
	add r0, r4, #0
	mov r1, #0xff
	add r0, #0x84
	strb r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0xc]
	mov r1, #0xf
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	bl sub_02059478
	str r0, [r4, #0x30]
	mov r0, #2
	bl sub_02037AC0
	mov r0, #0x27
	str r0, [r4, #0x34]
	b _02059472
_02059274:
	add r1, r4, #0
	add r1, #0x84
	ldrb r1, [r1]
	ldr r0, [r4, #0x50]
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r4, #0x28]
	mov r1, #1
	bl BufferBoxMonSpeciesName
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0xc]
	mov r1, #0x12
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0xc]
	bl StringExpandPlaceholders
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	bl sub_02059478
	str r0, [r4, #0x30]
	mov r0, #0x25
	str r0, [r4, #0x34]
	b _02059472
_020592B2:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	beq _02059348
	add r0, r4, #0
	mov r1, #0
	bl sub_0205993C
	mov r0, #0x26
	str r0, [r4, #0x34]
	b _02059472
_020592CE:
	add r0, r4, #0
	bl sub_02059A08
	cmp r0, #1
	beq _020592FC
	cmp r0, #2
	bne _02059348
	add r0, r4, #0
	bl sub_02059AD8
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0xc]
	mov r1, #0x11
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	bl sub_02059478
	str r0, [r4, #0x30]
	mov r0, #0x1f
	str r0, [r4, #0x34]
	b _02059472
_020592FC:
	mov r0, #0x81
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _02059334
	add r0, r4, #0
	bl sub_02059AD8
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0xc]
	mov r1, #0xe
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #0x10]
	ldr r2, [r4, #0xc]
	bl StringExpandPlaceholders
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	bl sub_02059478
	str r0, [r4, #0x30]
	mov r0, #2
	bl sub_02037AC0
	mov r0, #0x27
	str r0, [r4, #0x34]
	b _02059472
_02059334:
	mov r0, #0
	bl ov01_021E636C
	mov r0, #0x21
	str r0, [r4, #0x34]
	b _02059472
_02059340:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0205934A
_02059348:
	b _02059472
_0205934A:
	add r0, r4, #0
	mov r1, #0
	bl sub_020594C8
	mov r0, #1
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	add r3, r4, #0
	add r3, #0x84
	ldrb r3, [r3]
	ldr r1, [r4, #0x24]
	ldr r2, [r4, #0x50]
	add r0, r4, #0
	bl sub_02058AEC
	mov r0, #0x22
	str r0, [r4, #0x34]
	b _02059472
_02059370:
	ldr r1, [r4, #0x24]
	add r0, r4, #0
	bl sub_02058CD8
	cmp r0, #0
	beq _02059472
	ldr r0, [r4, #0x24]
	bl sub_020505C0
	mov r0, #0x23
	str r0, [r4, #0x34]
	b _02059472
_02059388:
	add r0, r4, #0
	bl sub_02058D04
	cmp r0, #0
	beq _02059472
	mov r0, #0x24
	str r0, [r4, #0x34]
	b _02059472
_02059398:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	beq _02059472
	mov r0, #2
	bl sub_02037B38
	cmp r0, #0
	beq _02059472
	add r0, r4, #0
	bl sub_0205975C
	mov r0, #0x29
	str r0, [r4, #0x34]
	b _02059472
_020593BC:
	add r0, r4, #0
	bl sub_02059798
	cmp r0, #0
	beq _02059472
	add r0, r4, #0
	add r0, #0x84
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _020593DC
	mov r0, #4
	bl sub_02037AC0
	mov r0, #0x2c
	str r0, [r4, #0x34]
	b _02059472
_020593DC:
	add r0, r4, #0
	add r0, #0x85
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _020593EC
	mov r0, #0x2a
	str r0, [r4, #0x34]
	b _02059472
_020593EC:
	add r0, r4, #0
	bl sub_020597D4
	mov r0, #0x5d
	bl sub_02037AC0
	mov r0, #2
	str r0, [r4, #0x34]
	b _02059472
_020593FE:
	ldr r0, [r4, #0x2c]
	ldr r2, [r4, #0xc]
	mov r1, #0xf
	bl ReadMsgDataIntoString
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	bl sub_02059478
	str r0, [r4, #0x30]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x43
	strb r1, [r0]
	mov r0, #0x2b
	str r0, [r4, #0x34]
	b _02059472
_02059420:
	ldr r0, [r4, #0x30]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	beq _02059472
	add r0, r4, #0
	add r0, #0x43
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x43
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x43
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _02059472
	mov r0, #4
	bl sub_02037AC0
	mov r0, #0x2c
	str r0, [r4, #0x34]
	b _02059472
_02059452:
	mov r0, #4
	bl sub_02037B38
	cmp r0, #0
	beq _02059472
	add r0, r4, #0
	add r0, #0x14
	mov r1, #0
	bl ClearFrameAndWindow2
	mov r0, #0
	ldr r2, [r4, #8]
	add r1, r0, #0
	blx r2
	mov r0, #5
	str r0, [r4, #0x34]
_02059472:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02058D4C

	thumb_func_start sub_02059478
sub_02059478: ; 0x02059478
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x14
	add r0, r4, #0
	add r6, r1, #0
	bl WindowIsInUse
	cmp r0, #0
	bne _020594AA
	ldr r0, [r5, #0x24]
	add r1, r4, #0
	ldr r0, [r0, #8]
	mov r2, #3
	bl sub_0205B514
	ldr r0, [r5, #0x24]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0205B564
	b _020594B0
_020594AA:
	add r0, r4, #0
	bl sub_0205B5A8
_020594B0:
	ldr r0, [r5, #0x24]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #1
	bl sub_0205B5B4
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02059478

	thumb_func_start sub_020594C8
sub_020594C8: ; 0x020594C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x14
	add r4, r1, #0
	bl WindowIsInUse
	cmp r0, #0
	beq _020594FE
	cmp r4, #0
	beq _020594EE
	add r0, r5, #0
	add r0, #0x14
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r5, #0
	add r0, #0x14
	bl ClearWindowTilemapAndCopyToVram
_020594EE:
	add r0, r5, #0
	add r0, #0x14
	bl RemoveWindow
	add r0, r5, #0
	add r0, #0x14
	bl InitWindow
_020594FE:
	add r0, r5, #0
	add r0, #0x54
	bl WindowIsInUse
	cmp r0, #0
	beq _0205951A
	add r0, r5, #0
	add r0, #0x54
	bl RemoveWindow
	add r0, r5, #0
	add r0, #0x54
	bl InitWindow
_0205951A:
	add r0, r5, #0
	add r0, #0x64
	bl WindowIsInUse
	cmp r0, #0
	beq _02059536
	add r0, r5, #0
	add r0, #0x64
	bl RemoveWindow
	add r5, #0x64
	add r0, r5, #0
	bl InitWindow
_02059536:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020594C8

	thumb_func_start sub_02059538
sub_02059538: ; 0x02059538
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r6, r1, #0
	cmp r0, #0
	beq _02059546
	b _0205964A
_02059546:
	mov r0, #0xb
	mov r1, #0x8c
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x8c
	bl MI_CpuFill8
	add r0, r4, #0
	mov r1, #5
	add r0, #0x43
	strb r1, [r0]
	str r5, [r4, #0x24]
	str r6, [r4, #8]
	mov r0, #0xb
	bl ScrStrBufs_new
	str r0, [r4, #0x28]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xe
	mov r3, #0xb
	bl NewMsgDataFromNarc
	str r0, [r4, #0x2c]
	mov r0, #0xc8
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0xc]
	mov r0, #0xc8
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x10]
	add r0, r4, #0
	add r0, #0x14
	bl InitWindow
	add r0, r4, #0
	add r0, #0x54
	bl InitWindow
	add r0, r4, #0
	add r0, #0x64
	bl InitWindow
	mov r0, #0xb
	bl ListMenuCursorNew
	str r0, [r4, #0x78]
	bl sub_0203993C
	add r1, r4, #0
	add r1, #0x88
	strb r0, [r1]
	mov r1, #0
	str r1, [r4, #0x4c]
	str r1, [r4, #0x48]
	add r0, r4, #0
	str r1, [r4, #0x50]
	add r0, #0x89
	strb r1, [r0]
	bl sub_0203769C
	add r1, r4, #0
	add r1, #0x86
	strh r0, [r1]
	add r0, r4, #0
	add r0, #0x86
	ldrh r1, [r0]
	mov r0, #1
	eor r0, r1
	bl sub_02034818
	str r0, [r4, #0x74]
	add r0, r4, #0
	add r0, #0x88
	ldrb r0, [r0]
	cmp r0, #3
	beq _020595F0
	cmp r0, #4
	beq _02059626
	b _0205962C
_020595F0:
	bl sub_02059B08
	add r6, r0, #0
	mov r0, #0xb
	add r1, r6, #0
	bl AllocFromHeapAtEnd
	str r0, [r4, #0x4c]
	mov r0, #0xb
	add r1, r6, #0
	bl AllocFromHeapAtEnd
	str r0, [r4, #0x48]
	mov r0, #0xb
	bl SavArray_Party_alloc
	mov r1, #3
	str r0, [r4, #0x50]
	bl InitPartyWithMaxSize
	add r0, r4, #0
	mov r1, #5
	add r0, #0x44
	strb r1, [r0]
	mov r0, #0x17
	str r0, [r4, #0x34]
	b _02059640
_02059626:
	mov r0, #9
	str r0, [r4, #0x34]
	b _02059640
_0205962C:
	ldr r0, [r4, #0x24]
	add r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	beq _0205963C
	mov r0, #9
	str r0, [r4, #0x34]
	b _02059640
_0205963C:
	mov r0, #0
	str r0, [r4, #0x34]
_02059640:
	ldr r1, _0205964C ; =sub_02058D4C
	add r0, r5, #0
	add r2, r4, #0
	bl FieldSys_CreateTask
_0205964A:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0205964C: .word sub_02058D4C
	thumb_func_end sub_02059538

	thumb_func_start sub_02059650
sub_02059650: ; 0x02059650
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x50]
	cmp r0, #0
	beq _0205965E
	bl FreeToHeap
_0205965E:
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	beq _02059668
	bl FreeToHeap
_02059668:
	ldr r0, [r4, #0x48]
	cmp r0, #0
	beq _02059672
	bl FreeToHeap
_02059672:
	ldr r0, [r4, #0x2c]
	bl DestroyMsgData
	ldr r0, [r4, #0x28]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0xc]
	bl String_dtor
	ldr r0, [r4, #0x10]
	bl String_dtor
	ldr r0, [r4, #0x78]
	bl DestroyListMenuCursorObj
	add r0, r4, #0
	mov r1, #1
	bl sub_020594C8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02059650

	thumb_func_start sub_0205969C
sub_0205969C: ; 0x0205969C
	ldr r3, _020596A4 ; =TaskManager_GetEnv
	ldr r0, [r0, #0x10]
	bx r3
	nop
_020596A4: .word TaskManager_GetEnv
	thumb_func_end sub_0205969C

	thumb_func_start sub_020596A8
sub_020596A8: ; 0x020596A8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7, #0x24]
	add r5, r1, #0
	ldr r0, [r0, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [sp]
	ldr r4, [r7, #0x4c]
	bl sub_02070D90
	add r6, r0, #0
	lsl r0, r6, #1
	add r0, r6, r0
	str r5, [r4, r0]
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _020596EC
	mov r5, #0
_020596CE:
	add r1, r7, r5
	add r1, #0x3d
	ldrb r1, [r1]
	ldr r0, [sp]
	sub r1, r1, #1
	bl GetPartyMonByIndex
	add r1, r4, #0
	add r2, r6, #0
	bl MI_CpuCopy8
	add r5, r5, #1
	add r4, r4, r6
	cmp r5, #3
	blt _020596CE
_020596EC:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020596A8

	thumb_func_start sub_020596F0
sub_020596F0: ; 0x020596F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x89
	ldrb r1, [r0]
	mov r0, #1
	tst r1, r0
	bne _02059734
	ldr r4, [r5, #0x4c]
	bl sub_02059B08
	add r2, r0, #0
	add r0, r5, #0
	add r0, #0x86
	ldrh r0, [r0]
	cmp r0, #0
	bne _0205971A
	mov r0, #0x6a
	add r1, r4, #0
	bl sub_02037088
	b _02059722
_0205971A:
	mov r0, #0x6a
	add r1, r4, #0
	bl sub_02036FD8
_02059722:
	cmp r0, #0
	beq _02059734
	add r1, r5, #0
	add r1, #0x89
	ldrb r2, [r1]
	mov r1, #1
	add r5, #0x89
	orr r1, r2
	strb r1, [r5]
_02059734:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020596F0

	thumb_func_start sub_02059738
sub_02059738: ; 0x02059738
	add r0, #0x89
	ldrb r0, [r0]
	cmp r0, #3
	bne _02059744
	mov r0, #1
	bx lr
_02059744:
	mov r0, #0
	bx lr
	thumb_func_end sub_02059738

	thumb_func_start sub_02059748
sub_02059748: ; 0x02059748
	push {r4, lr}
	add r4, r0, #0
	bl sub_02070D90
	lsl r1, r0, #1
	ldr r2, [r4, #0x48]
	add r0, r0, r1
	ldr r0, [r2, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02059748

	thumb_func_start sub_0205975C
sub_0205975C: ; 0x0205975C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x86
	ldrh r0, [r0]
	cmp r0, #0
	bne _02059776
	add r1, r4, #0
	mov r0, #0x6b
	add r1, #0x84
	mov r2, #1
	bl sub_02037108
	b _02059782
_02059776:
	add r1, r4, #0
	mov r0, #0x6b
	add r1, #0x84
	mov r2, #1
	bl sub_02037030
_02059782:
	cmp r0, #0
	beq _02059794
	add r1, r4, #0
	add r1, #0x89
	ldrb r2, [r1]
	mov r1, #1
	add r4, #0x89
	orr r1, r2
	strb r1, [r4]
_02059794:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205975C

	thumb_func_start sub_02059798
sub_02059798: ; 0x02059798
	add r0, #0x89
	ldrb r0, [r0]
	cmp r0, #3
	bne _020597A4
	mov r0, #1
	bx lr
_020597A4:
	mov r0, #0
	bx lr
	thumb_func_end sub_02059798

	thumb_func_start sub_020597A8
sub_020597A8: ; 0x020597A8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_02070D90
	add r6, r0, #0
	ldr r0, [r5, #0x50]
	mov r1, #3
	bl InitPartyWithMaxSize
	mov r4, #0
_020597BC:
	add r1, r4, #0
	ldr r2, [r5, #0x48]
	mul r1, r6
	ldr r0, [r5, #0x50]
	add r1, r2, r1
	bl AddMonToParty
	add r4, r4, #1
	cmp r4, #3
	blt _020597BC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020597A8

	thumb_func_start sub_020597D4
sub_020597D4: ; 0x020597D4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl sub_02070D90
	add r4, r0, #0
	add r0, r6, #0
	add r0, #0x84
	ldrb r0, [r0]
	ldr r2, [r6, #0x48]
	ldr r3, [r6, #0x4c]
	add r1, r0, #0
	mul r1, r4
	add r0, r2, r1
	add r1, r6, #0
	add r1, #0x85
	ldrb r1, [r1]
	add r2, r1, #0
	mul r2, r4
	add r1, r3, r2
	add r2, r4, #0
	bl MI_CpuCopy8
	ldr r0, [r6, #0x50]
	mov r1, #3
	bl InitPartyWithMaxSize
	mov r5, #0
_0205980A:
	add r1, r5, #0
	ldr r2, [r6, #0x4c]
	mul r1, r4
	ldr r0, [r6, #0x50]
	add r1, r2, r1
	bl AddMonToParty
	add r5, r5, #1
	cmp r5, #3
	blt _0205980A
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020597D4

	thumb_func_start sub_02059820
sub_02059820: ; 0x02059820
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	str r0, [sp, #0x20]
	add r0, #0x54
	str r1, [sp, #0x14]
	str r0, [sp, #0x20]
	bl WindowIsInUse
	cmp r0, #0
	bne _020598EC
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	mov r3, #4
	bl NewMsgDataFromNarc
	str r0, [sp, #0x18]
	bl sub_02070D90
	str r0, [sp, #0x1c]
	mov r0, #9
	str r0, [sp]
	mov r1, #0xa
	str r1, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	ldr r0, [r5, #0x24]
	ldr r1, [sp, #0x20]
	ldr r0, [r0, #8]
	mov r2, #3
	mov r3, #0x15
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	mov r1, #3
	ldr r0, [r0, #8]
	mov r2, #1
	mov r3, #0xb
	bl LoadUserFrameGfx1
	ldr r0, [sp, #0x20]
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r7, #0
	add r6, r7, #0
	add r4, r7, #0
_0205988E:
	ldr r0, [r5, #0x48]
	mov r1, #5
	add r0, r0, r6
	mov r2, #0
	bl GetMonData
	add r1, r0, #0
	ldr r0, [sp, #0x18]
	ldr r2, [r5, #0xc]
	bl ReadMsgDataIntoString
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	ldr r2, [r5, #0xc]
	mov r1, #0
	mov r3, #0x10
	bl AddTextPrinterParameterized
	ldr r0, [sp, #0x1c]
	add r7, r7, #1
	add r6, r6, r0
	add r4, #0x10
	cmp r7, #3
	blt _0205988E
	ldr r0, [r5, #0x2c]
	ldr r2, [r5, #0xc]
	mov r1, #0x15
	bl ReadMsgDataIntoString
	lsl r0, r7, #4
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	ldr r0, [sp, #0x20]
	ldr r2, [r5, #0xc]
	mov r3, #0x10
	bl AddTextPrinterParameterized
	ldr r0, [sp, #0x18]
	bl DestroyMsgData
_020598EC:
	mov r0, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x20]
	mov r2, #0
	ldrb r0, [r0, #8]
	mov r1, #0xf
	add r3, r2, #0
	lsl r0, r0, #0x13
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [sp, #0x20]
	bl FillWindowPixelRect
	ldr r3, [sp, #0x14]
	add r1, r5, #0
	ldr r0, [r5, #0x78]
	add r1, #0x54
	mov r2, #0
	lsl r3, r3, #4
	bl ListMenuUpdateCursorObj
	add r0, r5, #0
	add r0, #0x54
	mov r1, #0
	mov r2, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add r1, r5, #0
	ldr r0, [sp, #0x14]
	add r1, #0x81
	strb r0, [r1]
	add r0, r5, #0
	mov r1, #4
	add r0, #0x80
	strb r1, [r0]
	ldr r0, [sp, #0x20]
	str r0, [r5, #0x7c]
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02059820

	thumb_func_start sub_0205993C
sub_0205993C: ; 0x0205993C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r7, r5, #0
	add r7, #0x64
	add r0, r7, #0
	str r1, [sp, #0x14]
	bl WindowIsInUse
	cmp r0, #0
	bne _020599BE
	mov r0, #0xb
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	mov r0, #0xd
	str r0, [sp, #0xc]
	mov r0, #0x5a
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x24]
	add r1, r7, #0
	ldr r0, [r0, #8]
	mov r2, #3
	mov r3, #0x14
	bl AddWindowParameterized
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, [r5, #0x24]
	mov r1, #3
	ldr r0, [r0, #8]
	mov r2, #1
	mov r3, #0xb
	bl LoadUserFrameGfx1
	add r0, r7, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r6, #0
	add r4, r6, #0
_02059994:
	add r1, r6, #0
	ldr r0, [r5, #0x2c]
	ldr r2, [r5, #0xc]
	add r1, #0x16
	bl ReadMsgDataIntoString
	str r4, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r2, [r5, #0xc]
	add r0, r7, #0
	mov r1, #0
	mov r3, #0x10
	bl AddTextPrinterParameterized
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #3
	blt _02059994
_020599BE:
	add r0, r5, #0
	mov r1, #3
	add r0, #0x80
	strb r1, [r0]
	add r1, r5, #0
	ldr r0, [sp, #0x14]
	str r7, [r5, #0x7c]
	add r1, #0x81
	strb r0, [r1]
	mov r0, #0x10
	str r0, [sp]
	ldrb r0, [r7, #8]
	mov r2, #0
	mov r1, #0xf
	lsl r0, r0, #0x13
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	add r3, r2, #0
	bl FillWindowPixelRect
	ldr r3, [sp, #0x14]
	ldr r0, [r5, #0x78]
	ldr r1, [r5, #0x7c]
	mov r2, #0
	lsl r3, r3, #4
	bl ListMenuUpdateCursorObj
	ldr r0, [r5, #0x7c]
	mov r1, #0
	mov r2, #1
	mov r3, #0xb
	bl DrawFrameAndWindow1
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205993C

	thumb_func_start sub_02059A08
sub_02059A08: ; 0x02059A08
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _02059AD0 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _02059A32
	mov r0, #0x81
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _02059A28
	add r0, r4, #0
	add r0, #0x80
	ldrb r0, [r0]
	b _02059A28
_02059A28:
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x81
	strb r1, [r0]
	b _02059A94
_02059A32:
	mov r1, #0x80
	tst r1, r0
	beq _02059A56
	mov r0, #0x81
	ldrsb r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x80
	ldrb r0, [r0]
	sub r0, r0, #1
	cmp r1, r0
	bne _02059A4C
	mov r1, #0
	b _02059A4E
_02059A4C:
	add r1, r1, #1
_02059A4E:
	add r0, r4, #0
	add r0, #0x81
	strb r1, [r0]
	b _02059A94
_02059A56:
	mov r1, #1
	tst r1, r0
	beq _02059A7C
	ldr r0, _02059AD4 ; =0x000005DC
	bl PlaySE
	mov r0, #0x81
	ldrsb r1, [r4, r0]
	add r4, #0x80
	ldrb r0, [r4]
	sub r0, r0, #1
	cmp r1, r0
	bge _02059A76
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_02059A76:
	add sp, #8
	mov r0, #2
	pop {r4, pc}
_02059A7C:
	mov r1, #2
	tst r0, r1
	beq _02059A8E
	ldr r0, _02059AD4 ; =0x000005DC
	bl PlaySE
	add sp, #8
	mov r0, #2
	pop {r4, pc}
_02059A8E:
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_02059A94:
	ldr r0, _02059AD4 ; =0x000005DC
	bl PlaySE
	ldr r0, [r4, #0x7c]
	mov r1, #0x10
	str r1, [sp]
	ldrb r1, [r0, #8]
	mov r2, #0
	add r3, r2, #0
	lsl r1, r1, #0x13
	lsr r1, r1, #0x10
	str r1, [sp, #4]
	mov r1, #0xf
	bl FillWindowPixelRect
	mov r3, #0x81
	ldrsb r3, [r4, r3]
	ldr r0, [r4, #0x78]
	ldr r1, [r4, #0x7c]
	mov r2, #0
	lsl r3, r3, #4
	bl ListMenuUpdateCursorObj
	ldr r0, [r4, #0x7c]
	bl CopyWindowPixelsToVram_TextMode
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	nop
_02059AD0: .word gSystem
_02059AD4: .word 0x000005DC
	thumb_func_end sub_02059A08

	thumb_func_start sub_02059AD8
sub_02059AD8: ; 0x02059AD8
	ldr r3, _02059AE0 ; =sub_0200E5D4
	ldr r0, [r0, #0x7c]
	mov r1, #1
	bx r3
	.balign 4, 0
_02059AE0: .word sub_0200E5D4
	thumb_func_end sub_02059AD8

	thumb_func_start sub_02059AE4
sub_02059AE4: ; 0x02059AE4
	push {r4, lr}
	add r4, r0, #0
	add r0, r3, #0
	bl sub_0205969C
	add r1, r0, #0
	add r1, #0x86
	ldrh r1, [r1]
	cmp r1, r4
	beq _02059B06
	add r1, r0, #0
	add r1, #0x89
	ldrb r2, [r1]
	mov r1, #2
	add r0, #0x89
	orr r1, r2
	strb r1, [r0]
_02059B06:
	pop {r4, pc}
	thumb_func_end sub_02059AE4

	thumb_func_start sub_02059B08
sub_02059B08: ; 0x02059B08
	push {r3, lr}
	bl sub_02070D90
	lsl r1, r0, #1
	add r0, r0, r1
	add r0, r0, #4
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02059B08

	thumb_func_start sub_02059B18
sub_02059B18: ; 0x02059B18
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_0205969C
	add r1, r0, #0
	add r1, #0x86
	ldrh r1, [r1]
	cmp r1, r4
	beq _02059B30
	ldr r0, [r0, #0x48]
	pop {r4, pc}
_02059B30:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02059B18

	thumb_func_start sub_02059B34
sub_02059B34: ; 0x02059B34
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r3, #0
	add r4, r2, #0
	bl sub_0205969C
	add r1, r0, #0
	add r1, #0x86
	ldrh r1, [r1]
	cmp r1, r5
	beq _02059B60
	ldrb r2, [r4]
	add r1, r0, #0
	add r1, #0x85
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x89
	ldrb r2, [r1]
	mov r1, #2
	add r0, #0x89
	orr r1, r2
	strb r1, [r0]
_02059B60:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02059B34

	thumb_func_start sub_02059B64
sub_02059B64: ; 0x02059B64
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	mov r1, #0
	ldr r0, [r4, #0x24]
	add r2, r1, #0
	bl sub_020588DC
	ldr r1, [r4, #0x28]
	add r6, r0, #0
	cmp r1, #7
	bls _02059B8A
	b _02059D32
_02059B8A:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02059B96: ; jump table
	.short _02059BA6 - _02059B96 - 2 ; case 0
	.short _02059C6C - _02059B96 - 2 ; case 1
	.short _02059CBC - _02059B96 - 2 ; case 2
	.short _02059CCC - _02059B96 - 2 ; case 3
	.short _02059CE8 - _02059B96 - 2 ; case 4
	.short _02059CFA - _02059B96 - 2 ; case 5
	.short _02059D08 - _02059B96 - 2 ; case 6
	.short _02059D24 - _02059B96 - 2 ; case 7
_02059BA6:
	mov r0, #4
	bl ScrStrBufs_new
	str r0, [r4, #0x18]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xe
	mov r3, #4
	bl NewMsgDataFromNarc
	str r0, [r4, #0x1c]
	mov r0, #0xc8
	mov r1, #4
	bl String_ctor
	str r0, [r4]
	mov r0, #0xc8
	mov r1, #4
	bl String_ctor
	str r0, [r4, #4]
	ldrb r0, [r6]
	cmp r0, #0xc
	bhi _02059C0E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02059BE2: ; jump table
	.short _02059C0E - _02059BE2 - 2 ; case 0
	.short _02059C0E - _02059BE2 - 2 ; case 1
	.short _02059C0E - _02059BE2 - 2 ; case 2
	.short _02059C0E - _02059BE2 - 2 ; case 3
	.short _02059C0E - _02059BE2 - 2 ; case 4
	.short _02059C0E - _02059BE2 - 2 ; case 5
	.short _02059C0E - _02059BE2 - 2 ; case 6
	.short _02059BFC - _02059BE2 - 2 ; case 7
	.short _02059BFC - _02059BE2 - 2 ; case 8
	.short _02059C0E - _02059BE2 - 2 ; case 9
	.short _02059C02 - _02059BE2 - 2 ; case 10
	.short _02059C06 - _02059BE2 - 2 ; case 11
	.short _02059C0A - _02059BE2 - 2 ; case 12
_02059BFC:
	ldrb r0, [r6, #3]
	add r1, r0, #2
	b _02059C10
_02059C02:
	mov r1, #0x19
	b _02059C10
_02059C06:
	mov r1, #0x1a
	b _02059C10
_02059C0A:
	mov r1, #0x1b
	b _02059C10
_02059C0E:
	mov r1, #2
_02059C10:
	ldr r0, [r4, #0x1c]
	ldr r2, [r4]
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x24]
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl BufferPlayersName
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #4]
	ldr r2, [r4]
	bl StringExpandPlaceholders
	add r1, r4, #0
	ldr r0, [r5, #8]
	add r1, #8
	mov r2, #3
	bl sub_0205B514
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r0, #0
	add r0, r4, #0
	add r0, #8
	bl sub_0205B564
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r2, r0, #0
	add r0, r4, #0
	ldr r1, [r4, #4]
	add r0, #8
	mov r3, #1
	bl sub_0205B5B4
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	b _02059D36
_02059C6C:
	ldr r0, [r4, #0x20]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #0
	beq _02059D36
	ldr r0, _02059D3C ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02059D36
	ldr r0, [r4, #0x1c]
	bl DestroyMsgData
	ldr r0, [r4, #0x18]
	bl ScrStrBufs_delete
	ldr r0, [r4]
	bl String_dtor
	ldr r0, [r4, #4]
	bl String_dtor
	add r0, r4, #0
	add r0, #8
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #8
	bl RemoveWindow
	mov r0, #0
	bl ov01_021E636C
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	b _02059D36
_02059CBC:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _02059D36
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	b _02059D36
_02059CCC:
	add r1, r4, #0
	ldr r2, _02059D40 ; =0x0000066C
	add r1, #0x2c
	bl MI_CpuCopy8
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x2c
	bl sub_0203F7B0
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	b _02059D36
_02059CE8:
	add r0, r5, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _02059D36
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	b _02059D36
_02059CFA:
	add r0, r5, #0
	bl sub_020505C0
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	b _02059D36
_02059D08:
	add r0, r5, #0
	bl sub_020505C8
	cmp r0, #0
	bne _02059D36
	mov r0, #1
	bl ov01_021E636C
	bl sub_02056E60
	ldr r0, [r4, #0x28]
	add r0, r0, #1
	str r0, [r4, #0x28]
	b _02059D36
_02059D24:
	bl sub_02057F70
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02059D32:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02059D36:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02059D3C: .word gSystem
_02059D40: .word 0x0000066C
	thumb_func_end sub_02059B64

	thumb_func_start sub_02059D44
sub_02059D44: ; 0x02059D44
	push {r3, r4, r5, r6, r7, lr}
	str r0, [sp]
	bl sub_0203769C
	add r5, r0, #0
	bl sub_02057ADC
	add r7, r0, #0
	add r0, r5, #0
	bl sub_02057B14
	add r6, r0, #0
	mov r4, #0
	bl sub_02037454
	cmp r0, #0
	ble _02059DA6
_02059D66:
	cmp r4, r5
	beq _02059D9C
	add r0, r4, #0
	bl sub_02057A34
	cmp r7, r0
	bne _02059D9C
	add r0, r4, #0
	bl sub_02057A88
	cmp r6, r0
	bne _02059D9C
	ldr r1, _02059DA8 ; =0x000006A8
	mov r0, #0xb
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	str r4, [r2, #0x24]
	mov r0, #0
	str r0, [r2, #0x28]
	ldr r0, [sp]
	ldr r1, _02059DAC ; =sub_02059B64
	bl FieldSys_CreateTask
	bl sub_0203E2F4
	pop {r3, r4, r5, r6, r7, pc}
_02059D9C:
	add r4, r4, #1
	bl sub_02037454
	cmp r4, r0
	blt _02059D66
_02059DA6:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02059DA8: .word 0x000006A8
_02059DAC: .word sub_02059B64
	thumb_func_end sub_02059D44

	thumb_func_start sub_02059DB0
sub_02059DB0: ; 0x02059DB0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bne _02059DBA
	bl GF_AssertFail
_02059DBA:
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _02059DC8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02059DC8:
	mov r2, #0x2a
	mov r0, #3
	mov r1, #0x1f
	lsl r2, r2, #6
	bl CreateHeapAtEnd
	add r0, r4, #0
	bl sub_02059E1C
	add r5, r0, #0
	bne _02059DE4
	add r0, r4, #0
	add r0, #0x80
	ldr r5, [r0]
_02059DE4:
	add r0, r4, #0
	bl sub_02091574
	mov r0, #2
	bl sub_02038C1C
	ldr r1, _02059E00 ; =sub_02059E88
	add r0, r5, #0
	mov r2, #0x28
	bl sub_0205A034
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	nop
_02059E00: .word sub_02059E88
	thumb_func_end sub_02059DB0

	thumb_func_start sub_02059E04
sub_02059E04: ; 0x02059E04
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _02059E16
	ldr r1, _02059E18 ; =sub_0205A07C
	mov r2, #5
	bl sub_0205A034
_02059E16:
	pop {r3, pc}
	.balign 4, 0
_02059E18: .word sub_0205A07C
	thumb_func_end sub_02059E04

	thumb_func_start sub_02059E1C
sub_02059E1C: ; 0x02059E1C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	cmp r1, #0
	beq _02059E2E
	mov r0, #0
	pop {r4, r5, r6, pc}
_02059E2E:
	bl Fsys_GetSaveDataPtr
	add r6, r0, #0
	bl sub_02037F18
	mov r1, #0x19
	mov r0, #0x1f
	lsl r1, r1, #4
	bl AllocFromHeap
	mov r2, #0x19
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r4, #0x10]
	mov r0, #0x28
	str r0, [r4, #0x14]
	ldr r0, _02059E84 ; =sub_0205A03C
	add r1, r4, #0
	mov r2, #0xa
	bl CreateSysTask
	str r0, [r4, #0xc]
	str r5, [r4]
	str r6, [r4, #4]
	add r0, r6, #0
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r4, #8]
	add r0, r4, #0
	bl sub_0205ABBC
	mov r0, #0x15
	lsl r0, r0, #4
	add r0, r4, r0
	bl sub_0203778C
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02059E84: .word sub_0205A03C
	thumb_func_end sub_02059E1C

	thumb_func_start sub_02059E88
sub_02059E88: ; 0x02059E88
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_02035650
	cmp r0, #0
	beq _02059EB4
	add r0, sp, #0
	bl MailMsg_init_default
	add r0, sp, #0
	bl sub_0205AB88
	add r0, r4, #0
	add r1, sp, #0
	bl sub_0205AA6C
	ldr r1, _02059EB8 ; =sub_02059EBC
	add r0, r4, #0
	mov r2, #0x28
	bl sub_0205A034
_02059EB4:
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_02059EB8: .word sub_02059EBC
	thumb_func_end sub_02059E88

	thumb_func_start sub_02059EBC
sub_02059EBC: ; 0x02059EBC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037FCC
	cmp r0, #0
	beq _02059ED8
	ldr r0, _02059F24 ; =_021D41CC
	mov r2, #0
	str r2, [r0]
	ldr r1, _02059F28 ; =sub_02059F78
	add r0, r4, #0
	bl sub_0205A034
	pop {r4, pc}
_02059ED8:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _02059F22
	mov r0, #2
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	cmp r0, #1
	bne _02059F08
	ldr r0, [r4, #0x30]
	cmp r0, #5
	bne _02059EF6
	ldr r0, [r4, #0x18]
	bl sub_0203894C
	b _02059F18
_02059EF6:
	cmp r0, #6
	ldr r0, [r4, #0x18]
	bne _02059F02
	bl sub_0203898C
	b _02059F18
_02059F02:
	bl sub_02037F64
	b _02059F18
_02059F08:
	cmp r0, #2
	bne _02059F18
	mov r0, #0
	bl sub_0208F814
	ldr r0, [r4, #0x18]
	bl sub_02038918
_02059F18:
	ldr r1, _02059F2C ; =sub_0205A0B4
	add r0, r4, #0
	mov r2, #0xc
	bl sub_0205A034
_02059F22:
	pop {r4, pc}
	.balign 4, 0
_02059F24: .word _021D41CC
_02059F28: .word sub_02059F78
_02059F2C: .word sub_0205A0B4
	thumb_func_end sub_02059EBC

	thumb_func_start sub_02059F30
sub_02059F30: ; 0x02059F30
	push {r4, lr}
	add r4, r0, #0
	bl sub_02038070
	cmp r0, #1
	bne _02059F4C
	ldr r0, [r4]
	bl sub_02091574
	ldr r1, _02059F50 ; =sub_02059EBC
	add r0, r4, #0
	mov r2, #2
	bl sub_0205A034
_02059F4C:
	pop {r4, pc}
	nop
_02059F50: .word sub_02059EBC
	thumb_func_end sub_02059F30

	thumb_func_start sub_02059F54
sub_02059F54: ; 0x02059F54
	push {r3, r4, r5, lr}
	mov r5, #0
	mov r4, #1
_02059F5A:
	add r0, r4, #0
	bl sub_02034818
	cmp r0, #0
	beq _02059F66
	add r5, r5, #1
_02059F66:
	add r4, r4, #1
	cmp r4, #5
	blt _02059F5A
	cmp r5, #1
	blt _02059F74
	mov r0, #1
	pop {r3, r4, r5, pc}
_02059F74:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02059F54

	thumb_func_start sub_02059F78
sub_02059F78: ; 0x02059F78
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	ble _02059F88
	sub r0, r0, #1
	str r0, [r4, #0x14]
	pop {r3, r4, r5, pc}
_02059F88:
	ldr r0, _02059FEC ; =_021D41CC
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	bl sub_02035878
	add r5, r0, #0
	bl sub_020376F8
	cmp r0, #0
	beq _02059FC8
	bl sub_02059F54
	cmp r0, #1
	bne _02059FC8
	ldrb r0, [r5, #0x1c]
	cmp r0, #4
	beq _02059FC8
	bl sub_02034434
	mov r0, #1
	add r1, r0, #0
	bl sub_020398D4
	mov r0, #0xb
	bl sub_0205A904
	ldr r1, _02059FF0 ; =sub_02059FF8
	add r0, r4, #0
	mov r2, #0
	bl sub_0205A034
_02059FC8:
	bl sub_02037FCC
	cmp r0, #0
	bne _02059FEA
	bl sub_02037FF0
	add r0, r4, #0
	bl sub_0205ABBC
	mov r0, #0
	bl sub_0205A904
	ldr r1, _02059FF4 ; =sub_02059F30
	add r0, r4, #0
	mov r2, #2
	bl sub_0205A034
_02059FEA:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02059FEC: .word _021D41CC
_02059FF0: .word sub_02059FF8
_02059FF4: .word sub_02059F30
	thumb_func_end sub_02059F78

	thumb_func_start sub_02059FF8
sub_02059FF8: ; 0x02059FF8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02039918
	cmp r0, #0
	beq _0205A00C
	bl sub_020376F8
	cmp r0, #0
	beq _0205A02E
_0205A00C:
	bl sub_020376F8
	cmp r0, #0
	bne _0205A02E
	bl sub_02037FF0
	add r0, r4, #0
	bl sub_0205ABBC
	mov r0, #0
	bl sub_0205A904
	ldr r1, _0205A030 ; =sub_02059F30
	add r0, r4, #0
	mov r2, #2
	bl sub_0205A034
_0205A02E:
	pop {r4, pc}
	.balign 4, 0
_0205A030: .word sub_02059F30
	thumb_func_end sub_02059FF8

	thumb_func_start sub_0205A034
sub_0205A034: ; 0x0205A034
	str r1, [r0, #0x10]
	str r2, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205A034

	thumb_func_start sub_0205A03C
sub_0205A03C: ; 0x0205A03C
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	cmp r1, #0
	bne _0205A04A
	bl DestroySysTask
	pop {r3, r4, r5, r6, r7, pc}
_0205A04A:
	mov r7, #0x11
	ldr r5, _0205A078 ; =_021D41D8
	mov r6, #0
	add r4, r1, #0
	lsl r7, r7, #4
_0205A054:
	add r0, r6, #0
	bl sub_02035754
	mov r1, #0x11
	lsl r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r4, r7]
	add r6, r6, #1
	add r4, r4, #4
	stmia r5!, {r0}
	cmp r6, #0x10
	blt _0205A054
	ldr r0, [sp]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _0205A076
	blx r1
_0205A076:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205A078: .word _021D41D8
	thumb_func_end sub_0205A03C

	thumb_func_start sub_0205A07C
sub_0205A07C: ; 0x0205A07C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _0205A08C
	sub r0, r0, #1
	str r0, [r4, #0x14]
	pop {r4, pc}
_0205A08C:
	bl sub_02038094
	ldr r1, _0205A09C ; =sub_0205A0A0
	add r0, r4, #0
	mov r2, #0
	bl sub_0205A034
	pop {r4, pc}
	.balign 4, 0
_0205A09C: .word sub_0205A0A0
	thumb_func_end sub_0205A07C

	thumb_func_start sub_0205A0A0
sub_0205A0A0: ; 0x0205A0A0
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037474
	cmp r0, #0
	bne _0205A0B2
	add r0, r4, #0
	bl sub_0205A1D4
_0205A0B2:
	pop {r4, pc}
	thumb_func_end sub_0205A0A0

	thumb_func_start sub_0205A0B4
sub_0205A0B4: ; 0x0205A0B4
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037F94
	cmp r0, #1
	bne _0205A0D0
	bl sub_02034434
	ldr r1, _0205A108 ; =sub_0205A144
	add r0, r4, #0
	mov r2, #3
	bl sub_0205A034
	pop {r4, pc}
_0205A0D0:
	bl sub_020376F8
	cmp r0, #0
	beq _0205A0E8
	mov r2, #0
	str r2, [r4, #0x20]
	mov r0, #3
	str r0, [r4, #0x1c]
	ldr r1, _0205A10C ; =sub_02059F78
	add r0, r4, #0
	bl sub_0205A034
_0205A0E8:
	bl sub_02037F94
	cmp r0, #0
	beq _0205A106
	ldr r1, _0205A110 ; =sub_0205A114
	add r0, r4, #0
	mov r2, #2
	bl sub_0205A034
	mov r1, #0
	str r1, [r4, #0x24]
	mov r0, #2
	str r0, [r4, #0x1c]
	str r1, [r4, #0x20]
	str r1, [r4, #0x44]
_0205A106:
	pop {r4, pc}
	.balign 4, 0
_0205A108: .word sub_0205A144
_0205A10C: .word sub_02059F78
_0205A110: .word sub_0205A114
	thumb_func_end sub_0205A0B4

	thumb_func_start sub_0205A114
sub_0205A114: ; 0x0205A114
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl Fsys_TaskIsRunning
	cmp r0, #0
	bne _0205A13C
	bl sub_02037FF0
	add r0, r4, #0
	bl sub_0205ABBC
	mov r0, #0
	bl sub_0205A904
	ldr r1, _0205A140 ; =sub_02059F30
	add r0, r4, #0
	mov r2, #2
	bl sub_0205A034
_0205A13C:
	pop {r4, pc}
	nop
_0205A140: .word sub_02059F30
	thumb_func_end sub_0205A114

	thumb_func_start sub_0205A144
sub_0205A144: ; 0x0205A144
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037F94
	cmp r0, #1
	bne _0205A178
	bl sub_0203769C
	bl sub_02034818
	cmp r0, #0
	beq _0205A1A0
	mov r1, #0
	str r1, [r4, #0x20]
	mov r0, #1
	str r0, [r4, #0x1c]
	str r1, [r4, #0x44]
	add r1, r0, #0
	bl sub_020398D4
	ldr r1, _0205A1A4 ; =sub_0205A1AC
	add r0, r4, #0
	mov r2, #3
	bl sub_0205A034
	pop {r4, pc}
_0205A178:
	bl sub_02037F94
	cmp r0, #0
	bne _0205A1A0
	bl sub_02037FF0
	add r0, r4, #0
	bl sub_0205ABBC
	ldr r1, _0205A1A8 ; =sub_02059F30
	add r0, r4, #0
	mov r2, #2
	bl sub_0205A034
	mov r1, #0
	str r1, [r4, #0x24]
	mov r0, #2
	str r0, [r4, #0x1c]
	str r1, [r4, #0x20]
	str r1, [r4, #0x44]
_0205A1A0:
	pop {r4, pc}
	nop
_0205A1A4: .word sub_0205A1AC
_0205A1A8: .word sub_02059F30
	thumb_func_end sub_0205A144

	thumb_func_start sub_0205A1AC
sub_0205A1AC: ; 0x0205A1AC
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037F94
	cmp r0, #0
	bne _0205A1CC
	bl sub_02037FF0
	add r0, r4, #0
	bl sub_0205ABBC
	ldr r1, _0205A1D0 ; =sub_02059F30
	add r0, r4, #0
	mov r2, #2
	bl sub_0205A034
_0205A1CC:
	pop {r4, pc}
	nop
_0205A1D0: .word sub_02059F30
	thumb_func_end sub_0205A1AC

	thumb_func_start sub_0205A1D4
sub_0205A1D4: ; 0x0205A1D4
	push {r4, lr}
	add r4, r0, #0
	beq _0205A1EC
	ldr r0, [r4, #0xc]
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0x1f
	bl DestroyHeap
_0205A1EC:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205A1D4

	thumb_func_start sub_0205A1F0
sub_0205A1F0: ; 0x0205A1F0
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_0205A1F0

	thumb_func_start sub_0205A1F4
sub_0205A1F4: ; 0x0205A1F4
	lsl r1, r1, #2
	add r1, r0, r1
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bx lr
	thumb_func_end sub_0205A1F4

	thumb_func_start sub_0205A200
sub_0205A200: ; 0x0205A200
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r0, #0
	sub r0, r5, #1
	bl sub_02035798
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205ABB0
	cmp r6, #0
	bne _0205A21C
	mov r0, #5
	pop {r4, r5, r6, pc}
_0205A21C:
	sub r0, r5, #1
	lsl r0, r0, #2
	add r1, r4, r0
	mov r0, #0x11
	lsl r0, r0, #4
	ldr r1, [r1, r0]
	cmp r1, #0
	bne _0205A230
	mov r0, #5
	pop {r4, r5, r6, pc}
_0205A230:
	add r1, #0x50
	ldr r0, _0205A280 ; =_021D41CC
	add r1, #0x30
	str r1, [r0, #4]
	ldrb r0, [r1, #0x1c]
	cmp r0, #0xd
	bhi _0205A27A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205A24A: ; jump table
	.short _0205A266 - _0205A24A - 2 ; case 0
	.short _0205A26A - _0205A24A - 2 ; case 1
	.short _0205A26E - _0205A24A - 2 ; case 2
	.short _0205A272 - _0205A24A - 2 ; case 3
	.short _0205A276 - _0205A24A - 2 ; case 4
	.short _0205A276 - _0205A24A - 2 ; case 5
	.short _0205A276 - _0205A24A - 2 ; case 6
	.short _0205A276 - _0205A24A - 2 ; case 7
	.short _0205A276 - _0205A24A - 2 ; case 8
	.short _0205A27A - _0205A24A - 2 ; case 9
	.short _0205A27A - _0205A24A - 2 ; case 10
	.short _0205A276 - _0205A24A - 2 ; case 11
	.short _0205A27A - _0205A24A - 2 ; case 12
	.short _0205A272 - _0205A24A - 2 ; case 13
_0205A266:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0205A26A:
	mov r0, #2
	pop {r4, r5, r6, pc}
_0205A26E:
	mov r0, #3
	pop {r4, r5, r6, pc}
_0205A272:
	mov r0, #4
	pop {r4, r5, r6, pc}
_0205A276:
	mov r0, #5
	pop {r4, r5, r6, pc}
_0205A27A:
	mov r0, #5
	pop {r4, r5, r6, pc}
	nop
_0205A280: .word _021D41CC
	thumb_func_end sub_0205A200

	thumb_func_start sub_0205A284
sub_0205A284: ; 0x0205A284
	push {r3, r4}
	sub r1, r1, #1
	lsl r3, r1, #2
	add r4, r0, r3
	mov r3, #0x11
	lsl r3, r3, #4
	ldr r4, [r4, r3]
	cmp r4, #0
	bne _0205A29C
	mov r0, #5
	pop {r3, r4}
	bx lr
_0205A29C:
	add r4, #0x50
	ldr r3, _0205A354 ; =_021D41CC
	add r4, #0x30
	str r4, [r3, #4]
	ldrb r3, [r4, #0x1c]
	cmp r3, #0xd
	bhi _0205A34E
	add r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0205A2B6: ; jump table
	.short _0205A2F2 - _0205A2B6 - 2 ; case 0
	.short _0205A30E - _0205A2B6 - 2 ; case 1
	.short _0205A2D2 - _0205A2B6 - 2 ; case 2
	.short _0205A32A - _0205A2B6 - 2 ; case 3
	.short _0205A348 - _0205A2B6 - 2 ; case 4
	.short _0205A348 - _0205A2B6 - 2 ; case 5
	.short _0205A348 - _0205A2B6 - 2 ; case 6
	.short _0205A348 - _0205A2B6 - 2 ; case 7
	.short _0205A348 - _0205A2B6 - 2 ; case 8
	.short _0205A34E - _0205A2B6 - 2 ; case 9
	.short _0205A34E - _0205A2B6 - 2 ; case 10
	.short _0205A348 - _0205A2B6 - 2 ; case 11
	.short _0205A34E - _0205A2B6 - 2 ; case 12
	.short _0205A32A - _0205A2B6 - 2 ; case 13
_0205A2D2:
	cmp r2, #3
	beq _0205A2DC
	mov r0, #5
	pop {r3, r4}
	bx lr
_0205A2DC:
	mov r2, #5
	str r2, [r0, #0x30]
	str r1, [r0, #0x18]
	mov r2, #1
	str r2, [r0, #0x20]
	mov r1, #0
	str r1, [r0, #0x24]
	str r1, [r0, #0x1c]
	add r0, r2, #0
	pop {r3, r4}
	bx lr
_0205A2F2:
	cmp r2, #1
	beq _0205A2FC
	mov r0, #5
	pop {r3, r4}
	bx lr
_0205A2FC:
	str r1, [r0, #0x18]
	mov r2, #1
	str r2, [r0, #0x20]
	mov r1, #0
	str r1, [r0, #0x24]
	str r1, [r0, #0x1c]
	add r0, r2, #0
	pop {r3, r4}
	bx lr
_0205A30E:
	cmp r2, #2
	beq _0205A318
	mov r0, #5
	pop {r3, r4}
	bx lr
_0205A318:
	str r1, [r0, #0x18]
	mov r1, #2
	str r1, [r0, #0x20]
	mov r1, #0
	str r1, [r0, #0x24]
	str r1, [r0, #0x1c]
	mov r0, #1
	pop {r3, r4}
	bx lr
_0205A32A:
	cmp r2, #4
	beq _0205A334
	mov r0, #5
	pop {r3, r4}
	bx lr
_0205A334:
	mov r2, #6
	str r2, [r0, #0x30]
	str r1, [r0, #0x18]
	mov r2, #1
	str r2, [r0, #0x20]
	mov r1, #0
	str r1, [r0, #0x1c]
	add r0, r2, #0
	pop {r3, r4}
	bx lr
_0205A348:
	mov r0, #5
	pop {r3, r4}
	bx lr
_0205A34E:
	mov r0, #5
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0205A354: .word _021D41CC
	thumb_func_end sub_0205A284

	thumb_func_start sub_0205A358
sub_0205A358: ; 0x0205A358
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end sub_0205A358

	thumb_func_start sub_0205A35C
sub_0205A35C: ; 0x0205A35C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0205A36A
	mov r0, #7
	pop {r4, pc}
_0205A36A:
	bl sub_02037454
	cmp r0, #2
	bge _0205A376
	mov r0, #7
	pop {r4, pc}
_0205A376:
	bl sub_0203769C
	cmp r0, #0
	bne _0205A38A
	bl sub_02037FCC
	cmp r0, #1
	bne _0205A396
	ldr r0, [r4, #0x40]
	pop {r4, pc}
_0205A38A:
	bl sub_02037F94
	cmp r0, #1
	bne _0205A396
	ldr r0, [r4, #0x40]
	pop {r4, pc}
_0205A396:
	mov r0, #7
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205A35C

	thumb_func_start sub_0205A39C
sub_0205A39C: ; 0x0205A39C
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037FCC
	cmp r0, #1
	bne _0205A3AC
	ldr r0, [r4, #0x30]
	pop {r4, pc}
_0205A3AC:
	mov r0, #7
	pop {r4, pc}
	thumb_func_end sub_0205A39C

	thumb_func_start sub_0205A3B0
sub_0205A3B0: ; 0x0205A3B0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	add r0, sp, #0
	strb r4, [r0, #2]
	cmp r1, #0
	beq _0205A3C4
	cmp r1, #1
	beq _0205A3DC
	pop {r3, r4, r5, pc}
_0205A3C4:
	ldr r1, [r5, #0x44]
	cmp r1, #0
	bne _0205A404
	ldrb r0, [r0, #2]
	add r1, sp, #0
	add r1, #2
	str r0, [r5, #0x34]
	mov r0, #0x63
	mov r2, #1
	bl sub_02037030
	pop {r3, r4, r5, pc}
_0205A3DC:
	cmp r4, #0
	bne _0205A3F4
	ldr r1, [r5, #0x30]
	mov r2, #1
	strb r1, [r0, #1]
	add r1, sp, #0
	mov r0, #0x67
	add r1, #1
	bl sub_02037108
	str r4, [r5, #0x3c]
	pop {r3, r4, r5, pc}
_0205A3F4:
	mov r1, #7
	strb r1, [r0]
	mov r0, #0x67
	add r1, sp, #0
	mov r2, #1
	bl sub_02037108
	str r4, [r5, #0x3c]
_0205A404:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205A3B0

	thumb_func_start sub_0205A408
sub_0205A408: ; 0x0205A408
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205A408

	thumb_func_start sub_0205A40C
sub_0205A40C: ; 0x0205A40C
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205A40C

	thumb_func_start sub_0205A410
sub_0205A410: ; 0x0205A410
	push {r4, lr}
	add r4, r3, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, _0205A42C ; =sub_02059EBC
	mov r2, #2
	bl sub_0205A034
	add r4, #0x80
	ldr r0, [r4]
	bl sub_0205ABBC
	pop {r4, pc}
	.balign 4, 0
_0205A42C: .word sub_02059EBC
	thumb_func_end sub_0205A410

	thumb_func_start sub_0205A430
sub_0205A430: ; 0x0205A430
	add r3, #0x80
	ldr r1, [r3]
	ldr r0, [r1, #0x44]
	cmp r0, #0
	bne _0205A444
	ldrb r0, [r2]
	str r0, [r1, #0x30]
	ldrb r1, [r2]
	ldr r0, _0205A448 ; =_021D41CC
	str r1, [r0, #8]
_0205A444:
	bx lr
	nop
_0205A448: .word _021D41CC
	thumb_func_end sub_0205A430
