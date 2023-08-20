	.include "asm/macros.inc"
	.include "overlay_80_02231BF8.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_02231BF8
ov80_02231BF8: ; 0x02231BF8
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
	bl ov80_022324C4
	add r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096818
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02231BF8

	thumb_func_start ov80_02231C5C
ov80_02231C5C: ; 0x02231C5C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r4, #0
	bl ov80_02232824
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02231C5C

	thumb_func_start ov80_02231C78
ov80_02231C78: ; 0x02231C78
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_02232ABC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02231C78

	thumb_func_start ov80_02231C8C
ov80_02231C8C: ; 0x02231C8C
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
	mov r1, #0x30
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r6, #8]
	add r1, r7, #0
	str r0, [r4]
	add r0, r4, #0
	bl ov80_02231E4C
	ldr r0, _02231CD8 ; =ov80_02231E94
	ldr r1, _02231CDC ; =ov80_0223BE34
	str r0, [sp]
	ldr r0, [r5]
	add r2, r4, #0
	ldr r0, [r0]
	mov r3, #0
	bl sub_02096820
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02231CD8: .word ov80_02231E94
_02231CDC: .word ov80_0223BE34
	thumb_func_end ov80_02231C8C

	thumb_func_start ov80_02231CE0
ov80_02231CE0: ; 0x02231CE0
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
	mov r1, #0x30
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r6, #8]
	add r1, r7, #0
	str r0, [r4]
	add r0, r4, #0
	bl ov80_02231E4C
	ldr r0, _02231D2C ; =ov80_02231E94
	ldr r1, _02231D30 ; =ov80_0223BE24
	str r0, [sp]
	ldr r0, [r5]
	add r2, r4, #0
	ldr r0, [r0]
	mov r3, #0
	bl sub_02096820
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02231D2C: .word ov80_02231E94
_02231D30: .word ov80_0223BE24
	thumb_func_end ov80_02231CE0

	thumb_func_start ov80_02231D34
ov80_02231D34: ; 0x02231D34
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	ldr r5, [r4, #0xc]
	mov r1, #0
	ldr r0, [r5, #4]
	bl Party_GetMonByIndex
	add r2, r0, #0
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl Party_SafeCopyMonToSlot_ResetUnkSub
	ldr r0, [r5, #4]
	mov r1, #1
	bl Party_GetMonByIndex
	add r2, r0, #0
	ldr r0, [r4, #0x28]
	mov r1, #1
	bl Party_SafeCopyMonToSlot_ResetUnkSub
	ldrb r0, [r4, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02231D84
	ldr r0, [r5, #4]
	mov r1, #2
	bl Party_GetMonByIndex
	add r2, r0, #0
	ldr r0, [r4, #0x28]
	mov r1, #2
	bl Party_SafeCopyMonToSlot_ResetUnkSub
	b _02231DA8
_02231D84:
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl Party_GetMonByIndex
	add r2, r0, #0
	ldr r0, [r4, #0x28]
	mov r1, #2
	bl Party_SafeCopyMonToSlot_ResetUnkSub
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl Party_GetMonByIndex
	add r2, r0, #0
	ldr r0, [r4, #0x28]
	mov r1, #3
	bl Party_SafeCopyMonToSlot_ResetUnkSub
_02231DA8:
	ldr r0, [r5, #0x14]
	bl IsBattleResultWin
	str r0, [r4, #0x1c]
	add r0, r5, #0
	bl BattleSetup_Delete
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02231D34

	thumb_func_start ov80_02231DBC
ov80_02231DBC: ; 0x02231DBC
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
	bl ov80_02237B8C
	add r2, r0, #0
	str r2, [r4, #0xc]
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _02231DF4 ; =_020FA484
	ldr r0, [r0]
	bl sub_02096820
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02231DF4: .word _020FA484
	thumb_func_end ov80_02231DBC

	thumb_func_start ov80_02231DF8
ov80_02231DF8: ; 0x02231DF8
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
	mov r1, #0x30
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r6, #8]
	add r1, r7, #0
	str r0, [r4]
	add r0, r4, #0
	bl ov80_02231E4C
	ldr r0, _02231E44 ; =ov80_02231E94
	ldr r1, _02231E48 ; =ov80_0223BE44
	str r0, [sp]
	ldr r0, [r5]
	add r2, r4, #0
	ldr r0, [r0]
	mov r3, #0
	bl sub_02096820
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02231E44: .word ov80_02231E94
_02231E48: .word ov80_0223BE44
	thumb_func_end ov80_02231DF8

	thumb_func_start ov80_02231E4C
ov80_02231E4C: ; 0x02231E4C
	push {r4, r5, r6, r7}
	ldrb r2, [r1, #0x10]
	mov r6, #0
	strb r2, [r0, #4]
	ldr r2, [r1, #0x28]
	str r2, [r0, #0x18]
	ldr r2, [r1, #0x2c]
	str r2, [r0, #0x1c]
	ldr r2, _02231E90 ; =0x00000A1C
	str r1, [r0, #0x24]
	ldrh r2, [r1, r2]
	strh r2, [r0, #0x28]
	mov r2, #0xde
	lsl r2, r2, #2
	add r3, r2, #4
_02231E6A:
	mov r7, #0x37
	add r5, r1, r6
	lsl r7, r7, #4
	ldrb r7, [r5, r7]
	add r4, r0, r6
	add r6, r6, #1
	strb r7, [r4, #8]
	mov r7, #0xdd
	lsl r7, r7, #2
	ldrb r7, [r5, r7]
	cmp r6, #4
	strb r7, [r4, #0xc]
	ldrb r7, [r5, r2]
	strb r7, [r4, #0x10]
	ldrb r5, [r5, r3]
	strb r5, [r4, #0x14]
	blt _02231E6A
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_02231E90: .word 0x00000A1C
	thumb_func_end ov80_02231E4C

	thumb_func_start ov80_02231E94
ov80_02231E94: ; 0x02231E94
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x24]
	add r1, r4, #0
	bl ov80_02232AEC
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov80_02231E94

	thumb_func_start ov80_02231EA8
ov80_02231EA8: ; 0x02231EA8
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_02232F00
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02231EA8

	thumb_func_start ov80_02231EBC
ov80_02231EBC: ; 0x02231EBC
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_02232F08
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02231EBC

	thumb_func_start ov80_02231ED0
ov80_02231ED0: ; 0x02231ED0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r3, [r0, #0x1c]
	add r1, r0, #0
	add r2, r3, #1
	str r2, [r1, #0x1c]
	ldrb r1, [r3]
	add r3, r2, #1
	str r0, [sp, #0x10]
	str r1, [sp, #0x18]
	add r1, r0, #0
	str r3, [r1, #0x1c]
	ldrb r6, [r2]
	add r2, r3, #1
	str r2, [r1, #0x1c]
	ldrb r1, [r3]
	str r1, [sp, #0x14]
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096808
	add r7, r0, #0
	ldr r0, [sp, #0x18]
	cmp r0, #0x2c
	bls _02231F18
	b _0223228E
_02231F18:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02231F24: ; jump table
	.short _0223228E - _02231F24 - 2 ; case 0
	.short _0223228E - _02231F24 - 2 ; case 1
	.short _02231F7E - _02231F24 - 2 ; case 2
	.short _02231F82 - _02231F24 - 2 ; case 3
	.short _02231F90 - _02231F24 - 2 ; case 4
	.short _02231F96 - _02231F24 - 2 ; case 5
	.short _0223228E - _02231F24 - 2 ; case 6
	.short _02231FA4 - _02231F24 - 2 ; case 7
	.short _0223228E - _02231F24 - 2 ; case 8
	.short _02231FAC - _02231F24 - 2 ; case 9
	.short _02231FB6 - _02231F24 - 2 ; case 10
	.short _0223228E - _02231F24 - 2 ; case 11
	.short _0223228E - _02231F24 - 2 ; case 12
	.short _0223228E - _02231F24 - 2 ; case 13
	.short _02231FC0 - _02231F24 - 2 ; case 14
	.short _02231FCA - _02231F24 - 2 ; case 15
	.short _02231FDE - _02231F24 - 2 ; case 16
	.short _0223212A - _02231F24 - 2 ; case 17
	.short _02231FF4 - _02231F24 - 2 ; case 18
	.short _02232020 - _02231F24 - 2 ; case 19
	.short _0223202A - _02231F24 - 2 ; case 20
	.short _02232036 - _02231F24 - 2 ; case 21
	.short _0223203E - _02231F24 - 2 ; case 22
	.short _02232046 - _02231F24 - 2 ; case 23
	.short _02232050 - _02231F24 - 2 ; case 24
	.short _02232130 - _02231F24 - 2 ; case 25
	.short _0223205A - _02231F24 - 2 ; case 26
	.short _02232062 - _02231F24 - 2 ; case 27
	.short _02232076 - _02231F24 - 2 ; case 28
	.short _0223207E - _02231F24 - 2 ; case 29
	.short _02232086 - _02231F24 - 2 ; case 30
	.short _02232098 - _02231F24 - 2 ; case 31
	.short _022320A8 - _02231F24 - 2 ; case 32
	.short _022320AE - _02231F24 - 2 ; case 33
	.short _022320EC - _02231F24 - 2 ; case 34
	.short _02232120 - _02231F24 - 2 ; case 35
	.short _02232136 - _02231F24 - 2 ; case 36
	.short _0223214A - _02231F24 - 2 ; case 37
	.short _02232178 - _02231F24 - 2 ; case 38
	.short _02232182 - _02231F24 - 2 ; case 39
	.short _022321B2 - _02231F24 - 2 ; case 40
	.short _022321D4 - _02231F24 - 2 ; case 41
	.short _02232200 - _02231F24 - 2 ; case 42
	.short _02232208 - _02231F24 - 2 ; case 43
	.short _02232212 - _02231F24 - 2 ; case 44
_02231F7E:
	strb r6, [r4, #0x10]
	b _0223228E
_02231F82:
	lsl r0, r6, #1
	add r1, r4, r0
	mov r0, #0xe
	lsl r0, r0, #6
	ldrh r0, [r1, r0]
	strh r0, [r5]
	b _0223228E
_02231F90:
	ldrh r0, [r4, #0x14]
	strh r0, [r5]
	b _0223228E
_02231F96:
	ldrh r1, [r4, #0x14]
	ldr r0, _02232294 ; =0x0000270F
	cmp r1, r0
	bhs _0223201E
	add r0, r1, #1
	strh r0, [r4, #0x14]
	b _0223228E
_02231FA4:
	mov r0, #0
	bl OS_ResetSystem
	b _0223228E
_02231FAC:
	ldr r0, [r4, #8]
	bl sub_02030CD8
	strh r0, [r5]
	b _0223228E
_02231FB6:
	add r0, r4, #0
	mov r1, #2
	bl ov80_02232B58
	b _0223228E
_02231FC0:
	add r0, r4, #0
	bl ov80_02232E58
	strh r0, [r5]
	b _0223228E
_02231FCA:
	mov r0, #0x38
	mul r0, r6
	add r1, r4, r0
	mov r0, #0xa2
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	strh r0, [r5]
	b _0223228E
_02231FDE:
	mov r0, #0x38
	mul r0, r6
	add r1, r4, r0
	ldr r0, [sp, #0x14]
	lsl r0, r0, #1
	add r1, r1, r0
	mov r0, #0xa3
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	strh r0, [r5]
	b _0223228E
_02231FF4:
	ldr r0, [r7, #8]
	bl SaveArray_Party_Get
	add r7, r0, #0
	ldr r0, _02232298 ; =0x0000036A
	mov r5, #0
	add r6, r4, r0
_02232002:
	add r1, r4, r5
	add r1, #0x24
	ldrb r1, [r1]
	add r0, r7, #0
	bl Party_GetMonByIndex
	mov r1, #6
	add r2, r6, #0
	bl SetMonData
	add r5, r5, #1
	add r6, r6, #2
	cmp r5, #3
	blt _02232002
_0223201E:
	b _0223228E
_02232020:
	add r0, r4, #0
	bl ov80_02237ED8
	strh r0, [r5]
	b _0223228E
_0223202A:
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_02232E68
	strh r0, [r5]
	b _0223228E
_02232036:
	add r0, r4, #0
	bl ov80_02232E9C
	b _0223228E
_0223203E:
	add r0, r4, #0
	bl ov80_02232EE0
	b _0223228E
_02232046:
	add r0, r4, #0
	bl ov80_02232E64
	strh r0, [r5]
	b _0223228E
_02232050:
	mov r0, #0xa1
	lsl r0, r0, #4
	ldrb r0, [r4, r0]
	strh r0, [r5]
	b _0223228E
_0223205A:
	ldr r0, _0223229C ; =0x00000A11
	ldrb r0, [r4, r0]
	strh r0, [r5]
	b _0223228E
_02232062:
	add r0, r4, #0
	bl ov80_02233020
	strh r0, [r5]
	ldrb r1, [r4, #0x10]
	ldrh r2, [r5]
	ldr r0, [r4, #4]
	bl ov80_022331E8
	b _0223228E
_02232076:
	add r0, r4, #0
	bl ov80_02232F60
	b _0223228E
_0223207E:
	add r0, r4, #0
	bl sub_02096910
	b _0223228E
_02232086:
	ldr r0, _022322A0 ; =0x00000A1B
	ldrb r0, [r4, r0]
	cmp r0, #6
	blo _02232094
	sub r0, r0, #6
	strh r0, [r5]
	b _0223228E
_02232094:
	strh r0, [r5]
	b _0223228E
_02232098:
	ldr r0, _022322A0 ; =0x00000A1B
	mov r2, #0
	strb r2, [r4, r0]
	sub r1, r0, #2
	strb r2, [r4, r1]
	sub r0, r0, #3
	strb r2, [r4, r0]
	b _0223228E
_022320A8:
	ldr r0, _022322A4 ; =0x00000A18
	strb r6, [r4, r0]
	b _0223228E
_022320AE:
	ldr r0, _022322A0 ; =0x00000A1B
	mov r5, #0
	ldrb r0, [r4, r0]
	cmp r0, #6
	blo _022320C4
	bl sub_0203769C
	cmp r0, #0
	beq _022320CE
	mov r5, #1
	b _022320CE
_022320C4:
	bl sub_0203769C
	cmp r0, #0
	bne _022320CE
	mov r5, #1
_022320CE:
	cmp r5, #1
	bne _022320E2
	ldr r0, [r7, #8]
	bl sub_0203107C
	ldrb r1, [r4, #0x10]
	mov r2, #0x32
	bl ov80_02237FA4
	b _0223228E
_022320E2:
	ldr r0, _022322A8 ; =0x00000A1C
	ldrh r1, [r4, r0]
	sub r1, #0x32
	strh r1, [r4, r0]
	b _0223228E
_022320EC:
	mov r0, #0
	strh r0, [r5]
	ldrb r0, [r4, #0x10]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02232118
	ldr r0, _022322A0 ; =0x00000A1B
	ldrb r0, [r4, r0]
	cmp r0, #6
	blo _02232110
	bl sub_0203769C
	cmp r0, #0
	bne _02232118
	mov r0, #1
	strh r0, [r5]
	b _0223228E
_02232110:
	bl sub_0203769C
	cmp r0, #0
	bne _0223211A
_02232118:
	b _0223228E
_0223211A:
	mov r0, #1
	strh r0, [r5]
	b _0223228E
_02232120:
	ldrb r0, [r4, #0x10]
	bl ov80_02237D8C
	strh r0, [r5]
	b _0223228E
_0223212A:
	ldrb r0, [r4, #0x10]
	strh r0, [r5]
	b _0223228E
_02232130:
	ldrb r0, [r4, #0x12]
	strh r0, [r5]
	b _0223228E
_02232136:
	ldr r0, [sp, #0x10]
	ldr r0, [r0]
	bl ov80_0222AB34
	ldr r0, [r0]
	add r1, r4, #0
	mov r2, #3
	bl ov80_02237EFC
	b _0223228E
_0223214A:
	ldrb r1, [r4, #0x11]
	add r0, r4, #0
	add r0, #0x4c
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, #0x30]
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_0222A474
	ldrb r1, [r4, #0x11]
	mov r0, #0x57
	lsl r0, r0, #2
	add r1, r1, #7
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, #0x30]
	add r0, r4, r0
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_0222A474
	b _0223228E
_02232178:
	add r0, r4, #0
	bl ov80_02233648
	strh r0, [r5]
	b _0223228E
_02232182:
	ldr r0, [r7, #8]
	bl sub_02030E08
	mov r2, #0
	str r2, [sp]
	mov r1, #0xa
	add r3, r2, #0
	bl sub_02030E58
	strh r0, [r5]
	mov r1, #1
	add r0, sp, #0x20
	strb r1, [r0]
	ldr r0, [r7, #8]
	bl sub_02030E08
	add r1, sp, #0x20
	mov r2, #0
	str r1, [sp]
	mov r1, #0xa
	add r3, r2, #0
	bl sub_02030E18
	b _0223228E
_022321B2:
	mov r0, #0
	strh r0, [r5]
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _0223228E
	ldrh r0, [r4, #0x14]
	add r0, r0, #1
	cmp r0, #0x15
	bne _022321CA
	mov r0, #1
	strh r0, [r5]
	b _0223228E
_022321CA:
	cmp r0, #0x31
	bne _0223228E
	mov r0, #2
	strh r0, [r5]
	b _0223228E
_022321D4:
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	mov r3, #0xa2
	lsl r3, r3, #2
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
	b _0223228E
_02232200:
	add r0, r4, #0
	bl ov80_02237E30
	b _0223228E
_02232208:
	ldrb r0, [r4, #0x13]
	strh r0, [r5]
	mov r0, #1
	strb r0, [r4, #0x13]
	b _0223228E
_02232212:
	ldrb r5, [r4, #0x10]
	cmp r5, #3
	bne _0223228E
	cmp r6, #0
	ldr r0, [r7, #8]
	bne _0223226A
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r4, #0x10]
	bl sub_0205C1F0
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #0x1c]
	add r0, r6, #0
	bl sub_020310BC
	strh r0, [r4, #0x22]
	ldr r0, [r7, #8]
	bl sub_0203107C
	add r5, r0, #0
	ldrb r0, [r4, #0x10]
	bl sub_0205C1F0
	add r6, r0, #0
	ldrb r0, [r4, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r4, #0x20]
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02031108
	b _0223228E
_0223226A:
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r4, #0x10]
	bl sub_0205C1F0
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r4, #0x22]
	add r0, r6, #0
	add r1, r7, #0
	bl sub_02031108
_0223228E:
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02232294: .word 0x0000270F
_02232298: .word 0x0000036A
_0223229C: .word 0x00000A11
_022322A0: .word 0x00000A1B
_022322A4: .word 0x00000A18
_022322A8: .word 0x00000A1C
	thumb_func_end ov80_02231ED0

	thumb_func_start ov80_022322AC
ov80_022322AC: ; 0x022322AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	ldr r0, [r0, #0x1c]
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_022322AC

	thumb_func_start ov80_022322C8
ov80_022322C8: ; 0x022322C8
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
	bl ov80_02233280
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_022322C8

	thumb_func_start ov80_022322F8
ov80_022322F8: ; 0x022322F8
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _02232314 ; =ov80_02232318
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_02232314: .word ov80_02232318
	thumb_func_end ov80_022322F8

	thumb_func_start ov80_02232318
ov80_02232318: ; 0x02232318
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE9C
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	ldr r1, _02232344 ; =0x00000A1A
	ldrb r2, [r0, r1]
	cmp r2, #2
	blo _0223233E
	mov r2, #0
	strb r2, [r0, r1]
	mov r0, #1
	pop {r4, pc}
_0223233E:
	mov r0, #0
	pop {r4, pc}
	nop
_02232344: .word 0x00000A1A
	thumb_func_end ov80_02232318

	thumb_func_start ov80_02232348
ov80_02232348: ; 0x02232348
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _02232364 ; =ov80_02232368
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_02232364: .word ov80_02232368
	thumb_func_end ov80_02232348

	thumb_func_start ov80_02232368
ov80_02232368: ; 0x02232368
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE24
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	ldr r2, _0223239C ; =0x00000A1B
	ldrb r1, [r0, r2]
	cmp r1, #0
	bne _0223238C
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223238C:
	mov r3, #0
	sub r1, r2, #1
	strb r3, [r0, r1]
	ldrb r0, [r0, r2]
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0223239C: .word 0x00000A1B
	thumb_func_end ov80_02232368

	thumb_func_start ov80_022323A0
ov80_022323A0: ; 0x022323A0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r0, #0
	ldr r0, [r4]
	bl ov80_022332D0
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_022323A0

	thumb_func_start ov80_022323B8
ov80_022323B8: ; 0x022323B8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r0, #0
	ldr r0, [r4]
	bl ov80_022333F0
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_022323B8

	thumb_func_start ov80_022323D0
ov80_022323D0: ; 0x022323D0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r0, #0
	ldr r0, [r4]
	bl ov80_02233490
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_022323D0

	thumb_func_start ov80_022323E8
ov80_022323E8: ; 0x022323E8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl sub_0203107C
	add r5, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205C1F0
	add r7, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl sub_020310BC
	strh r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_022323E8

	thumb_func_start ov80_02232430
ov80_02232430: ; 0x02232430
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl sub_0203107C
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	add r2, r6, #0
	bl ov80_02237FA4
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_02232430

	thumb_func_start ov80_02232460
ov80_02232460: ; 0x02232460
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	lsl r1, r4, #0x18
	ldr r0, [r0, #8]
	lsr r1, r1, #0x18
	add r2, r6, #0
	bl ov80_022331E8
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_02232460

	thumb_func_start ov80_0223248C
ov80_0223248C: ; 0x0223248C
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
	bne _022324B0
	mov r0, #0
	pop {r3, r4, r5, pc}
_022324B0:
	lsl r1, r4, #4
	add r1, r4, r1
	add r2, #0x64
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r2, r1
	bl ov80_0222F44C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223248C
