	.include "asm/macros.inc"
	.include "overlay_80_02233688.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_02233688
ov80_02233688: ; 0x02233688
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	bl ov80_0222BE10
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	str r0, [sp, #0x14]
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	str r6, [sp]
	lsl r2, r4, #0x18
	ldr r1, [sp, #0x14]
	str r7, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r0, #8]
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #0x10]
	lsr r2, r2, #0x18
	bl ov80_022340E8
	add r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096818
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02233688

	thumb_func_start ov80_022336EC
ov80_022336EC: ; 0x022336EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r4, #0
	bl ov80_0223437C
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_022336EC

	thumb_func_start ov80_02233708
ov80_02233708: ; 0x02233708
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_02234520
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02233708

	thumb_func_start ov80_0223371C
ov80_0223371C: ; 0x0223371C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x48
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x48
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r6, #8]
	add r1, r7, #0
	str r0, [r4]
	add r0, r4, #0
	bl ov80_02233944
	ldr r0, _02233768 ; =ov80_02233A1C
	ldr r1, _0223376C ; =ov80_0223BE78
	str r0, [sp]
	ldr r0, [r5]
	add r2, r4, #0
	ldr r0, [r0]
	mov r3, #0
	bl sub_02096820
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02233768: .word ov80_02233A1C
_0223376C: .word ov80_0223BE78
	thumb_func_end ov80_0223371C

	thumb_func_start ov80_02233770
ov80_02233770: ; 0x02233770
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	add r6, r0, #0
	ldr r1, [r6, #0xc]
	mov r4, #0x6d
	str r1, [sp, #8]
	ldr r2, [sp, #8]
	ldr r3, [sp, #8]
	lsl r4, r4, #2
	ldr r1, [r1, #4]
	ldr r2, [r2, #0xc]
	ldr r3, [r3, r4]
	bl ov80_02234848
	strb r0, [r6, #0x1d]
	ldr r0, [sp, #8]
	ldr r0, [r0, #0x14]
	bl IsBattleResultWin
	str r0, [r6, #0x28]
	ldrb r0, [r6, #0x13]
	cmp r0, #0x1b
	bne _022337AC
	mov r1, #1
	mov r7, #3
	b _022337B0
_022337AC:
	mov r1, #0
	mov r7, #2
_022337B0:
	ldr r0, [sp, #8]
	lsl r5, r1, #2
	add r4, r0, #4
	mov r2, #0
	ldr r0, [r4, r5]
	ldr r1, [r6, #0x70]
	add r3, r2, #0
	bl ov80_02235364
	mov r2, #1
	ldr r0, [r4, r5]
	ldr r1, [r6, #0x70]
	add r3, r2, #0
	bl ov80_02235364
	ldrb r0, [r6, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _022337E6
	mov r2, #2
	ldr r0, [r4, r5]
	ldr r1, [r6, #0x70]
	add r3, r2, #0
	bl ov80_02235364
	b _02233804
_022337E6:
	ldr r0, [sp, #8]
	lsl r5, r7, #2
	add r4, r0, #4
	ldr r0, [r4, r5]
	ldr r1, [r6, #0x70]
	mov r2, #0
	mov r3, #2
	bl ov80_02235364
	ldr r0, [r4, r5]
	ldr r1, [r6, #0x70]
	mov r2, #1
	mov r3, #3
	bl ov80_02235364
_02233804:
	ldrb r0, [r6, #0x13]
	cmp r0, #0x11
	bne _02233858
	ldrb r0, [r6, #0x10]
	mov r1, #1
	bl BattleArcade_GetMonCount
	mov r5, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _02233858
_0223381A:
	ldr r0, [r6, #0x70]
	add r1, r5, #0
	bl Party_GetMonByIndex
	add r4, r0, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	sub r1, r7, #3
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0x10
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
	ldr r0, [sp, #4]
	add r5, r5, #1
	cmp r5, r0
	blt _0223381A
_02233858:
	ldr r0, [r6, #0x70]
	bl Party_GetCount
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _022338FA
	add r5, r6, #0
	add r7, sp, #0x14
_0223386E:
	ldr r0, [r6, #0x70]
	ldr r1, [sp]
	bl Party_GetMonByIndex
	add r1, r5, #0
	add r1, #0x94
	ldr r1, [r1]
	add r4, r0, #0
	str r1, [sp, #0x14]
	mov r1, #0xa4
	add r2, r7, #0
	bl SetMonData
	add r0, r4, #0
	mov r1, #0xa3
	add r2, r7, #0
	bl SetMonData
	add r0, r5, #0
	add r0, #0xa4
	ldr r0, [r0]
	mov r1, #0xa5
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r2, r7, #0
	bl SetMonData
	add r0, r5, #0
	add r0, #0xb4
	ldr r0, [r0]
	mov r1, #0xa6
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r2, r7, #0
	bl SetMonData
	add r0, r5, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #0xa7
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r2, r7, #0
	bl SetMonData
	add r0, r5, #0
	add r0, #0xd4
	ldr r0, [r0]
	mov r1, #0xa8
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r2, r7, #0
	bl SetMonData
	add r0, r5, #0
	add r0, #0xe4
	ldr r0, [r0]
	mov r1, #0xa9
	str r0, [sp, #0x14]
	add r0, r4, #0
	add r2, r7, #0
	bl SetMonData
	ldr r0, [sp]
	add r5, r5, #4
	add r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp]
	cmp r1, r0
	blt _0223386E
_022338FA:
	ldr r0, [sp, #8]
	bl BattleSetup_Delete
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02233770

	thumb_func_start ov80_02233908
ov80_02233908: ; 0x02233908
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r6, #0
	add r4, r0, #0
	bl ov80_02238150
	add r2, r0, #0
	str r2, [r4, #0xc]
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _02233940 ; =_020FA484
	ldr r0, [r0]
	bl sub_02096820
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02233940: .word _020FA484
	thumb_func_end ov80_02233908

	thumb_func_start ov80_02233944
ov80_02233944: ; 0x02233944
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r4, r0, #0
	ldrb r0, [r7, #0x10]
	strb r0, [r4, #4]
	add r0, r7, #0
	bl ov80_02238498
	strh r0, [r4, #0x1e]
	add r0, r7, #0
	add r0, #0x20
	str r0, [r4, #0x14]
	add r0, r7, #0
	add r0, #0x13
	str r0, [r4, #0x10]
	ldrb r0, [r7, #0x1d]
	mov r1, #0
	strb r0, [r4, #7]
	ldrh r0, [r7, #0x18]
	strh r0, [r4, #0x1c]
	ldr r0, _02233A18 ; =0x00000A78
	ldrh r0, [r7, r0]
	strh r0, [r4, #0x18]
	add r0, r7, #0
	add r0, #0x1c
	str r0, [r4, #0xc]
	ldr r0, [r7, #0x70]
	str r0, [r4, #0x30]
	ldr r0, [r7, #0x74]
	str r0, [r4, #0x34]
	str r7, [r4, #0x3c]
	add r0, r7, #0
	str r1, [r7, #0x14]
	add r0, #0x14
	str r0, [r4, #8]
	ldrb r0, [r7, #0x12]
	add r4, #0x42
	strb r0, [r4]
	strb r1, [r7, #0x12]
	strb r1, [r7, #0x1f]
	ldr r0, [r7, #0x70]
	bl Party_GetCount
	mov r6, #0
	str r0, [sp]
	cmp r0, #0
	ble _02233A16
	add r5, r7, #0
_022339A4:
	ldr r0, [r7, #0x70]
	add r1, r6, #0
	bl Party_GetMonByIndex
	mov r1, #0xa4
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0x94
	str r0, [r1]
	add r0, r4, #0
	mov r1, #0xa5
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0xa4
	str r0, [r1]
	add r0, r4, #0
	mov r1, #0xa6
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0xb4
	str r0, [r1]
	add r0, r4, #0
	mov r1, #0xa7
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0xc4
	str r0, [r1]
	add r0, r4, #0
	mov r1, #0xa8
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0xd4
	str r0, [r1]
	add r0, r4, #0
	mov r1, #0xa9
	mov r2, #0
	bl GetMonData
	add r1, r5, #0
	add r1, #0xe4
	str r0, [r1]
	ldr r0, [sp]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _022339A4
_02233A16:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02233A18: .word 0x00000A78
	thumb_func_end ov80_02233944

	thumb_func_start ov80_02233A1C
ov80_02233A1C: ; 0x02233A1C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x3c]
	add r1, r4, #0
	bl ov80_02234550
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov80_02233A1C

	thumb_func_start ov80_02233A30
ov80_02233A30: ; 0x02233A30
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_022347E4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02233A30

	thumb_func_start ov80_02233A44
ov80_02233A44: ; 0x02233A44
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_022347EC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02233A44

	thumb_func_start ov80_02233A58
ov80_02233A58: ; 0x02233A58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r7, r0, #0
	ldr r2, [r7, #0x1c]
	add r1, r2, #1
	str r1, [r7, #0x1c]
	ldrb r1, [r2]
	str r1, [sp, #0x20]
	bl ov80_0222BE10
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r7, #0
	bl ov80_0222BE10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x1c]
	add r0, r7, #0
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl sub_02096808
	str r0, [sp, #0x24]
	ldr r0, [r7]
	bl ov80_0222AB34
	ldr r1, [sp, #0x20]
	str r0, [sp, #0x28]
	cmp r1, #0x34
	bls _02233AA8
	b _02233F12
_02233AA8:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02233AB4: ; jump table
	.short _02233F12 - _02233AB4 - 2 ; case 0
	.short _02233F12 - _02233AB4 - 2 ; case 1
	.short _02233B1E - _02233AB4 - 2 ; case 2
	.short _02233B22 - _02233AB4 - 2 ; case 3
	.short _02233B2E - _02233AB4 - 2 ; case 4
	.short _02233B34 - _02233AB4 - 2 ; case 5
	.short _02233CB0 - _02233AB4 - 2 ; case 6
	.short _02233B42 - _02233AB4 - 2 ; case 7
	.short _02233F12 - _02233AB4 - 2 ; case 8
	.short _02233B4A - _02233AB4 - 2 ; case 9
	.short _02233B54 - _02233AB4 - 2 ; case 10
	.short _02233D62 - _02233AB4 - 2 ; case 11
	.short _02233B5E - _02233AB4 - 2 ; case 12
	.short _02233F12 - _02233AB4 - 2 ; case 13
	.short _02233B6A - _02233AB4 - 2 ; case 14
	.short _02233B74 - _02233AB4 - 2 ; case 15
	.short _02233B96 - _02233AB4 - 2 ; case 16
	.short _02233CC2 - _02233AB4 - 2 ; case 17
	.short _02233B9C - _02233AB4 - 2 ; case 18
	.short _02233BCA - _02233AB4 - 2 ; case 19
	.short _02233BD4 - _02233AB4 - 2 ; case 20
	.short _02233BE0 - _02233AB4 - 2 ; case 21
	.short _02233BE8 - _02233AB4 - 2 ; case 22
	.short _02233BF0 - _02233AB4 - 2 ; case 23
	.short _02233BFA - _02233AB4 - 2 ; case 24
	.short _02233C02 - _02233AB4 - 2 ; case 25
	.short _02233F12 - _02233AB4 - 2 ; case 26
	.short _02233F12 - _02233AB4 - 2 ; case 27
	.short _02233CB8 - _02233AB4 - 2 ; case 28
	.short _02233CC8 - _02233AB4 - 2 ; case 29
	.short _02233CCE - _02233AB4 - 2 ; case 30
	.short _02233CD4 - _02233AB4 - 2 ; case 31
	.short _02233D32 - _02233AB4 - 2 ; case 32
	.short _02233D3E - _02233AB4 - 2 ; case 33
	.short _02233D44 - _02233AB4 - 2 ; case 34
	.short _02233D4A - _02233AB4 - 2 ; case 35
	.short _02233D56 - _02233AB4 - 2 ; case 36
	.short _02233D6C - _02233AB4 - 2 ; case 37
	.short _02233D82 - _02233AB4 - 2 ; case 38
	.short _02233DD2 - _02233AB4 - 2 ; case 39
	.short _02233DE4 - _02233AB4 - 2 ; case 40
	.short _02233E16 - _02233AB4 - 2 ; case 41
	.short _02233E24 - _02233AB4 - 2 ; case 42
	.short _02233E32 - _02233AB4 - 2 ; case 43
	.short _02233E50 - _02233AB4 - 2 ; case 44
	.short _02233E92 - _02233AB4 - 2 ; case 45
	.short _02233E9C - _02233AB4 - 2 ; case 46
	.short _02233EA6 - _02233AB4 - 2 ; case 47
	.short _02233EAC - _02233AB4 - 2 ; case 48
	.short _02233ECE - _02233AB4 - 2 ; case 49
	.short _02233EFA - _02233AB4 - 2 ; case 50
	.short _02233F02 - _02233AB4 - 2 ; case 51
	.short _02233F0C - _02233AB4 - 2 ; case 52
_02233B1E:
	strb r6, [r4, #0x10]
	b _02233F12
_02233B22:
	lsl r0, r6, #1
	add r1, r4, r0
	ldr r0, _02233E3C ; =0x00000418
	ldrh r0, [r1, r0]
	strh r0, [r5]
	b _02233F12
_02233B2E:
	ldrh r0, [r4, #0x18]
	strh r0, [r5]
	b _02233F12
_02233B34:
	ldrh r1, [r4, #0x18]
	ldr r0, _02233E40 ; =0x0000270F
	cmp r1, r0
	bhs _02233BC8
	add r0, r1, #1
	strh r0, [r4, #0x18]
	b _02233F12
_02233B42:
	mov r0, #0
	bl OS_ResetSystem
	b _02233F12
_02233B4A:
	ldr r0, [r4, #8]
	bl sub_02030E98
	strh r0, [r5]
	b _02233F12
_02233B54:
	add r0, r4, #0
	mov r1, #2
	bl ov80_02234588
	b _02233F12
_02233B5E:
	ldrb r1, [r4, #0x13]
	add r0, r4, #0
	bl ov80_02238430
	strh r0, [r5]
	b _02233F12
_02233B6A:
	add r0, r4, #0
	bl ov80_02234764
	strh r0, [r5]
	b _02233F12
_02233B74:
	cmp r6, #0
	bne _02233B82
	ldr r0, [r4, #0x70]
	mov r1, #0
	bl Party_GetMonByIndex
	b _02233B8A
_02233B82:
	ldr r0, [r4, #0x74]
	mov r1, #0
	bl Party_GetMonByIndex
_02233B8A:
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r5]
	b _02233F12
_02233B96:
	ldrb r0, [r4, #0x13]
	strh r0, [r5]
	b _02233F12
_02233B9C:
	ldr r0, [sp, #0x24]
	ldr r0, [r0, #8]
	bl SaveArray_Party_Get
	add r7, r0, #0
	ldr r0, _02233E44 ; =0x00000412
	mov r5, #0
	add r6, r4, r0
_02233BAC:
	add r1, r4, r5
	add r1, #0x2c
	ldrb r1, [r1]
	add r0, r7, #0
	bl Party_GetMonByIndex
	mov r1, #6
	add r2, r6, #0
	bl SetMonData
	add r5, r5, #1
	add r6, r6, #2
	cmp r5, #3
	blt _02233BAC
_02233BC8:
	b _02233F12
_02233BCA:
	add r0, r4, #0
	bl ov80_02238498
	strh r0, [r5]
	b _02233F12
_02233BD4:
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_02234774
	strh r0, [r5]
	b _02233F12
_02233BE0:
	add r0, r4, #0
	bl ov80_022347B8
	b _02233F12
_02233BE8:
	add r0, r4, #0
	bl ov80_022347C4
	b _02233F12
_02233BF0:
	add r0, r4, #0
	bl ov80_02234770
	strh r0, [r5]
	b _02233F12
_02233BFA:
	ldr r0, _02233E48 ; =0x00000A74
	ldrb r0, [r4, r0]
	strh r0, [r5]
	b _02233F12
_02233C02:
	ldrb r0, [r4, #0x13]
	cmp r0, #0x1b
	bne _02233CAE
	ldrb r0, [r4, #0x10]
	mov r1, #1
	bl BattleArcade_GetMonCount
	str r0, [sp, #0x18]
	ldrb r0, [r4, #0x10]
	mov r1, #1
	bl BattleArcade_GetOpponentMonCount
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ble _02233CAE
_02233C24:
	ldr r0, [r4, #0x30]
	ldr r7, [r0]
	add r0, r7, #0
	bl sub_020248AC
	add r3, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x38
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #0x40]
	ldr r5, [r0]
	add r0, r5, #0
	bl sub_020248AC
	add r6, r0, #0
	add r3, sp, #0x2c
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	str r0, [r3]
	add r0, r7, #0
	bl sub_020247D4
	add r0, r5, #0
	add r1, sp, #0x38
	bl sub_020247D4
	ldr r0, [r4, #0x50]
	ldr r7, [r0]
	add r0, r7, #0
	bl sub_020248AC
	add r3, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x38
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [r4, #0x60]
	ldr r5, [r0]
	add r0, r5, #0
	bl sub_020248AC
	add r6, r0, #0
	add r3, sp, #0x2c
	ldmia r6!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r6]
	add r1, r2, #0
	str r0, [r3]
	add r0, r7, #0
	bl sub_020247D4
	add r0, r5, #0
	add r1, sp, #0x38
	bl sub_020247D4
	ldr r0, [sp, #0x10]
	add r4, r4, #4
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _02233C24
_02233CAE:
	b _02233F12
_02233CB0:
	add r0, r4, #0
	bl sub_02096910
	b _02233F12
_02233CB8:
	ldrb r0, [r4, #0x10]
	bl BattleArcade_MultiplayerCheck
	strh r0, [r5]
	b _02233F12
_02233CC2:
	ldrb r0, [r4, #0x10]
	strh r0, [r5]
	b _02233F12
_02233CC8:
	bl ov80_0222F210
	b _02233F12
_02233CCE:
	bl ov80_0222F278
	b _02233F12
_02233CD4:
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	add r2, r6, #0
	bl ov80_02234A74
	ldrb r0, [r4, #0x10]
	mov r1, #1
	bl BattleArcade_GetMonCount
	str r0, [sp, #0x14]
	ldrb r0, [r4, #0x10]
	mov r1, #1
	bl BattleArcade_GetOpponentMonCount
	add r7, r0, #0
	cmp r6, #0
	bne _02233D16
	ldr r0, [sp, #0x14]
	mov r5, #0
	cmp r0, #0
	ble _02233D14
	mov r6, #2
_02233D00:
	ldr r0, [r4, #0x30]
	add r1, r6, #0
	ldr r0, [r0]
	bl sub_02024A04
	ldr r0, [sp, #0x14]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r0
	blt _02233D00
_02233D14:
	b _02233F12
_02233D16:
	mov r5, #0
	cmp r7, #0
	ble _02233D30
	mov r6, #2
_02233D1E:
	ldr r0, [r4, #0x40]
	add r1, r6, #0
	ldr r0, [r0]
	bl sub_02024A04
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r7
	blt _02233D1E
_02233D30:
	b _02233F12
_02233D32:
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	add r2, r6, #0
	bl ov80_02234B24
	b _02233F12
_02233D3E:
	bl ov80_0222F33C
	b _02233F12
_02233D44:
	bl ov80_0222F3CC
	b _02233F12
_02233D4A:
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	add r2, r6, #0
	bl ov80_02234BEC
	b _02233F12
_02233D56:
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	add r2, r6, #0
	bl ov80_02234CB0
	b _02233F12
_02233D62:
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	bl ov80_02234968
	b _02233F12
_02233D6C:
	ldrb r0, [r4, #0x10]
	bl BattleArcade_MultiplayerCheck
	cmp r0, #1
	beq _02233D78
	b _02233F12
_02233D78:
	ldr r1, [sp, #0x28]
	add r0, r4, #0
	bl ov80_02234A38
	b _02233F12
_02233D82:
	ldrb r0, [r4, #0x13]
	bl ov80_022384BC
	cmp r0, #0
	bne _02233DAA
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	bl ov80_022347A8
	add r2, r0, #0
	lsl r2, r2, #1
	add r2, r4, r2
	ldr r0, [r7]
	add r2, #0x78
	ldrh r2, [r2]
	ldr r0, [r0, #0x44]
	add r1, r6, #0
	bl BufferFrontierOpponentName
	b _02233F12
_02233DAA:
	ldrb r0, [r4, #0x10]
	bl BattleArcade_MultiplayerCheck
	cmp r0, #0
	bne _02233DBE
	ldr r0, [sp, #0x24]
	ldr r0, [r0, #8]
	bl Save_PlayerData_GetProfileAddr
	b _02233DC4
_02233DBE:
	ldr r0, [sp, #0x1c]
	bl sub_02034818
_02233DC4:
	add r2, r0, #0
	ldr r0, [r7]
	add r1, r6, #0
	ldr r0, [r0, #0x44]
	bl BufferPlayersName
	b _02233F12
_02233DD2:
	ldr r1, _02233E4C ; =0x00000A7A
	ldr r0, [sp, #0x1c]
	add r2, r6, #0
	strb r0, [r4, r1]
	add r0, r7, #0
	add r1, r4, #0
	bl ov80_02233F1C
	b _02233F12
_02233DE4:
	ldrb r1, [r4, #0x11]
	add r0, r4, #0
	add r0, #0xf4
	lsl r1, r1, #1
	add r1, r4, r1
	add r1, #0x78
	ldrh r1, [r1]
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_0222A474
	ldrb r1, [r4, #0x11]
	mov r0, #0x81
	lsl r0, r0, #2
	add r1, r1, #7
	lsl r1, r1, #1
	add r1, r4, r1
	add r1, #0x78
	ldrh r1, [r1]
	add r0, r4, r0
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_0222A474
	b _02233F12
_02233E16:
	ldr r1, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	add r0, r4, #0
	add r2, r6, #0
	bl ov80_02234B7C
	b _02233F12
_02233E24:
	ldr r1, [sp, #0x28]
	ldr r3, [sp, #0x1c]
	add r0, r4, #0
	add r2, r6, #0
	bl ov80_02234BB4
	b _02233F12
_02233E32:
	ldr r1, [sp, #0x1c]
	add r0, r6, #0
	bl ov80_02234DC4
	b _02233F12
	.balign 4, 0
_02233E3C: .word 0x00000418
_02233E40: .word 0x0000270F
_02233E44: .word 0x00000412
_02233E48: .word 0x00000A74
_02233E4C: .word 0x00000A7A
_02233E50:
	cmp r6, #0
	bne _02233E68
	str r6, [sp]
	mov r2, #0
	str r2, [sp, #4]
	mov r1, #2
	add r3, r1, #0
	ldr r0, [r0, #4]
	add r3, #0xfe
	bl sub_02003E5C
	b _02233F12
_02233E68:
	ldr r0, [r7]
	ldr r1, [sp, #0x1c]
	ldr r0, [r0]
	bl ov80_02239938
	ldr r0, [r0, #4]
	bl ov42_02229248
	add r2, r0, #0
	lsl r2, r2, #0x14
	str r6, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x28]
	mov r1, #2
	ldr r0, [r0, #4]
	lsr r2, r2, #0x10
	mov r3, #0x10
	bl sub_02003E5C
	b _02233F12
_02233E92:
	add r0, r4, #0
	bl ov80_02235324
	strh r0, [r5]
	b _02233F12
_02233E9C:
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	b _02233F12
_02233EA6:
	ldrb r0, [r4, #0x1f]
	strh r0, [r5]
	b _02233F12
_02233EAC:
	mov r0, #0
	strh r0, [r5]
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _02233F12
	ldrh r0, [r4, #0x18]
	add r0, r0, #1
	cmp r0, #0x15
	bne _02233EC4
	mov r0, #1
	strh r0, [r5]
	b _02233F12
_02233EC4:
	cmp r0, #0x31
	bne _02233F12
	mov r0, #2
	strh r0, [r5]
	b _02233F12
_02233ECE:
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	mov r3, #0x33
	lsl r3, r3, #4
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp, #0xc]
	add r0, r4, r3
	sub r1, #0x1c
	sub r2, #0x14
	sub r3, #0x10
	add r1, r4, r1
	add r2, r4, r2
	add r3, r4, r3
	bl ov80_0222A52C
	b _02233F12
_02233EFA:
	add r0, r4, #0
	bl ov80_022383C0
	b _02233F12
_02233F02:
	ldrb r0, [r4, #0x1e]
	strh r0, [r5]
	mov r0, #1
	strb r0, [r4, #0x1e]
	b _02233F12
_02233F0C:
	ldr r0, _02233F18 ; =0x00000A7C
	mov r1, #0
	strb r1, [r4, r0]
_02233F12:
	mov r0, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02233F18: .word 0x00000A7C
	thumb_func_end ov80_02233A58

	thumb_func_start ov80_02233F1C
ov80_02233F1C: ; 0x02233F1C
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	add r5, r1, #0
	add r4, r2, #0
	bl ov80_0222AB34
	ldr r0, [r0, #0x10]
	mov r1, #0
	bl ov80_02239A60
	ldr r2, _02233F3C ; =ov80_02233F40
	add r1, r4, #0
	add r3, r5, #0
	bl sub_02015494
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02233F3C: .word ov80_02233F40
	thumb_func_end ov80_02233F1C

	thumb_func_start ov80_02233F40
ov80_02233F40: ; 0x02233F40
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	bl sub_02015504
	ldr r5, _02233FB4 ; =ov80_0223BE6C
	add r2, r0, #0
	ldmia r5!, {r0, r1}
	add r3, sp, #8
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	str r0, [r3]
	ldr r0, _02233FB8 ; =0x00000A7A
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _02233FB0
	add r0, r4, #0
	add r1, sp, #0
	bl sub_02015538
	add r1, sp, #0
	mov r0, #0
	ldrsh r2, [r1, r0]
	sub r0, r0, #1
	mul r0, r2
	strh r0, [r1]
	add r0, r4, #0
	ldrh r2, [r1]
	add r0, #0x50
	strh r2, [r0]
	add r0, r4, #0
	ldrh r2, [r1, #2]
	add r0, #0x52
	strh r2, [r0]
	add r0, r4, #0
	ldrh r1, [r1, #4]
	add r0, #0x54
	strh r1, [r0]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r1, r0
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0xc]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r4, #0x30]
_02233FB0:
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_02233FB4: .word ov80_0223BE6C
_02233FB8: .word 0x00000A7A
	thumb_func_end ov80_02233F40

	thumb_func_start ov80_02233FBC
ov80_02233FBC: ; 0x02233FBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	ldr r0, [r0, #0x28]
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02233FBC

	thumb_func_start ov80_02233FD8
ov80_02233FD8: ; 0x02233FD8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_02234E50
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02233FD8

	thumb_func_start ov80_02234008
ov80_02234008: ; 0x02234008
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _02234024 ; =ov80_02234028
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_02234024: .word ov80_02234028
	thumb_func_end ov80_02234008

	thumb_func_start ov80_02234028
ov80_02234028: ; 0x02234028
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE9C
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	ldr r1, _02234054 ; =0x00000A7C
	ldrb r2, [r0, r1]
	cmp r2, #2
	blo _0223404E
	mov r2, #0
	strb r2, [r0, r1]
	mov r0, #1
	pop {r4, pc}
_0223404E:
	mov r0, #0
	pop {r4, pc}
	nop
_02234054: .word 0x00000A7C
	thumb_func_end ov80_02234028

	thumb_func_start ov80_02234058
ov80_02234058: ; 0x02234058
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r1, [r5, #0x1c]
	add r0, r1, #1
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	ldrb r4, [r1]
	ldr r0, [r0]
	bl sub_02096810
	add r2, r0, #0
	bne _0223407C
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223407C:
	mov r1, #0x43
	lsl r1, r1, #2
	add r2, r2, r1
	lsl r1, r4, #4
	add r1, r4, r1
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r2, r1
	bl ov80_0222F44C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02234058

	thumb_func_start ov80_02234094
ov80_02234094: ; 0x02234094
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	ldrb r1, [r0, #0x13]
	bl ov80_02234E98
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov80_02234094

	thumb_func_start ov80_022340A8
ov80_022340A8: ; 0x022340A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	ldr r3, [sp, #4]
	add r1, r6, #0
	add r2, r7, #0
	str r4, [sp]
	bl ov80_02234D04
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_022340A8
