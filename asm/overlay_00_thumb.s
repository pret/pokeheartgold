	.include "asm/macros.inc"
	.include "overlay_00_thumb.inc"
	.include "global.inc"

	.text

	thumb_func_start ov00_021E5900
ov00_021E5900: ; 0x021E5900
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	ldr r0, _021E5AC4 ; =_0221A680
	add r5, r1, #0
	ldr r0, [r0]
	add r4, r2, #0
	str r3, [sp]
	cmp r0, #0
	beq _021E5918
	bl GF_AssertFail
_021E5918:
	ldr r1, _021E5AC8 ; =0x00001108
	add r0, r5, #0
	bl AllocFromHeap
	ldr r2, _021E5AC8 ; =0x00001108
	add r6, r0, #0
	mov r1, #0
	bl MI_CpuFill8
	add r2, r6, #0
	add r2, #0x1f
	mov r0, #0x1f
	bic r2, r0
	ldr r1, _021E5AC4 ; =_0221A680
	ldr r0, _021E5ACC ; =0x00000F7C
	str r2, [r1]
	str r6, [r2, r0]
	ldr r6, [r1]
	ldr r2, [sp, #4]
	sub r3, r0, #4
	str r2, [r6, r3]
	add r3, r0, #0
	ldr r6, [r1]
	mov r2, #0
	add r3, #0x28
	str r2, [r6, r3]
	add r3, r0, #0
	ldr r6, [r1]
	add r3, #0x2c
	str r2, [r6, r3]
	add r3, r0, #0
	ldr r6, [r1]
	add r3, #0x44
	str r2, [r6, r3]
	ldr r3, [r1]
	add r0, #0xf4
	str r2, [r3, r0]
	ldr r0, [r1]
	ldr r2, _021E5AD0 ; =0x00001084
	str r5, [r0, r2]
	add r0, r2, #4
	ldr r3, [r1]
	add r2, #8
	str r5, [r3, r0]
	ldr r0, [r1]
	ldr r1, _021E5AD4 ; =0x00003020
	str r4, [r0, r2]
	add r0, r5, #0
	add r1, r4, r1
	bl AllocFromHeap
	ldr r3, _021E5AC4 ; =_0221A680
	mov r1, #0xf9
	ldr r2, [r3]
	lsl r1, r1, #4
	str r0, [r2, r1]
	add r0, r1, #0
	ldr r5, [r3]
	mov r2, #0
	add r0, #8
	str r2, [r5, r0]
	ldr r0, [r3]
	ldr r0, [r0, r1]
	mov r1, #0x1f
	add r0, #0x1f
	bic r0, r1
	add r1, r4, #0
	bl NNS_FndCreateExpHeapEx
	ldr r4, _021E5AC4 ; =_0221A680
	mov r6, #0
	ldr r2, [r4]
	ldr r1, _021E5AD8 ; =0x00000F94
	sub r7, r6, #1
	str r0, [r2, r1]
	add r0, r1, #0
	ldr r2, [r4]
	add r0, #8
	str r6, [r2, r0]
	ldr r0, [r4]
	ldr r2, _021E5ADC ; =0x000010A4
	str r6, [r0, r2]
	add r0, r2, #0
	ldr r3, [r4]
	sub r0, #0x10
	str r7, [r3, r0]
	add r0, r2, #0
	ldr r3, [r4]
	sub r0, #0x38
	str r6, [r3, r0]
	add r3, r2, #0
	ldr r5, [r4]
	ldr r0, [sp]
	sub r3, #0x28
	str r0, [r5, r3]
	add r0, r2, #0
	ldr r3, [r4]
	sub r0, #0x24
	str r6, [r3, r0]
	add r0, r2, #0
	ldr r3, [r4]
	add r0, #0x34
	str r6, [r3, r0]
	add r0, r2, #0
	ldr r3, [r4]
	sub r0, #0xc
	str r7, [r3, r0]
	add r3, r2, #0
	ldr r5, [r4]
	mov r0, #1
	sub r3, #8
	str r0, [r5, r3]
	add r3, r2, #0
	ldr r5, [r4]
	add r3, #0x3a
	strb r6, [r5, r3]
	add r3, r2, #0
	ldr r5, [r4]
	add r3, #0x28
	str r6, [r5, r3]
	add r3, r2, #0
	ldr r5, [r4]
	add r3, #0x38
	strb r6, [r5, r3]
	add r3, r2, #0
	ldr r5, [r4]
	add r3, #0x39
	strb r6, [r5, r3]
	add r3, r2, #0
	ldr r5, [r4]
	add r3, #0x30
	strh r0, [r5, r3]
	add r3, r2, #0
	ldr r5, [r4]
	add r3, #0x2c
	str r0, [r5, r3]
	ldr r3, [r4]
	add r2, #0x32
	strh r0, [r3, r2]
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _021E5A66
	ldr r0, [r4]
	sub r1, #0x1c
	ldr r0, [r0, r1]
	bl sub_0202C6F4
	bl sub_0202C08C
	add r2, r4, #0
	mov r1, #0xf1
	ldr r3, [r2]
	lsl r1, r1, #4
	str r0, [r3, r1]
	ldr r0, [r2]
	add r1, #0x68
	ldr r0, [r0, r1]
	bl sub_0202C6F4
	add r1, r6, #0
	bl sub_0202C23C
	add r1, r4, #0
	ldr r2, [r1]
	mov r1, #1
	lsl r1, r1, #8
	str r0, [r2, r1]
_021E5A66:
	ldr r2, _021E5AC4 ; =_0221A680
	ldr r1, _021E5AE0 ; =0x000010E5
	ldr r0, [r2]
	mov r3, #1
	strb r3, [r0, r1]
	mov r0, #0
	ldr r3, [r2]
	sub r1, #0x81
	str r0, [r3, r1]
	ldr r1, _021E5AE4 ; =0x00001044
	add r4, r0, #0
_021E5A7C:
	ldr r3, [r2]
	add r3, r3, r0
	add r0, r0, #1
	strb r4, [r3, r1]
	cmp r0, #0x20
	blt _021E5A7C
	bl ov00_021E700C
	ldr r0, _021E5AC4 ; =_0221A680
	ldr r1, [r0]
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl DWC_CheckHasProfile
	cmp r0, #0
	bne _021E5AA4
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E5AA4:
	ldr r0, _021E5AC4 ; =_0221A680
	ldr r1, [r0]
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl DWC_CheckValidConsole
	cmp r0, #0
	beq _021E5ABC
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E5ABC:
	mov r0, #2
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5AC4: .word _0221A680
_021E5AC8: .word 0x00001108
_021E5ACC: .word 0x00000F7C
_021E5AD0: .word 0x00001084
_021E5AD4: .word 0x00003020
_021E5AD8: .word 0x00000F94
_021E5ADC: .word 0x000010A4
_021E5AE0: .word 0x000010E5
_021E5AE4: .word 0x00001044
	thumb_func_end ov00_021E5900

	thumb_func_start ov00_021E5AE8
ov00_021E5AE8: ; 0x021E5AE8
	push {r3, lr}
	ldr r0, _021E5B58 ; =_0221A680
	ldr r0, [r0]
	cmp r0, #0
	beq _021E5B52
	bl ov00_021E7300
	ldr r0, _021E5B58 ; =_0221A680
	ldr r2, [r0]
	ldr r0, _021E5B5C ; =0x00000F98
	ldr r1, [r2, r0]
	cmp r1, #0
	beq _021E5B20
	add r0, r0, #4
	ldr r0, [r2, r0]
	bl NNS_FndDestroyExpHeap
	ldr r0, _021E5B58 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E5B5C ; =0x00000F98
	ldr r0, [r1, r0]
	bl Heap_Free
	ldr r0, _021E5B58 ; =_0221A680
	mov r2, #0
	ldr r1, [r0]
	ldr r0, _021E5B5C ; =0x00000F98
	str r2, [r1, r0]
_021E5B20:
	ldr r0, _021E5B58 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E5B60 ; =0x00000F94
	ldr r0, [r1, r0]
	bl NNS_FndDestroyExpHeap
	ldr r0, _021E5B58 ; =_0221A680
	ldr r1, _021E5B64 ; =0x00001084
	ldr r2, [r0]
	ldr r0, [r2, r1]
	sub r1, #0xf4
	ldr r1, [r2, r1]
	bl Heap_FreeExplicit
	ldr r0, _021E5B58 ; =_0221A680
	ldr r1, _021E5B68 ; =0x00000F7C
	ldr r2, [r0]
	ldr r0, _021E5B64 ; =0x00001084
	ldr r1, [r2, r1]
	ldr r0, [r2, r0]
	bl Heap_FreeExplicit
	ldr r0, _021E5B58 ; =_0221A680
	mov r1, #0
	str r1, [r0]
_021E5B52:
	bl ov00_021EC210
	pop {r3, pc}
	.balign 4, 0
_021E5B58: .word _0221A680
_021E5B5C: .word 0x00000F98
_021E5B60: .word 0x00000F94
_021E5B64: .word 0x00001084
_021E5B68: .word 0x00000F7C
	thumb_func_end ov00_021E5AE8

	thumb_func_start ov00_021E5B6C
ov00_021E5B6C: ; 0x021E5B6C
	push {r3, lr}
	sub sp, #0x68
	ldr r0, _021E5C60 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E5C64 ; =0x00001070
	ldr r0, [r1, r0]
	cmp r0, #4
	bhi _021E5C56
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5B88: ; jump table
	.short _021E5B92 - _021E5B88 - 2 ; case 0
	.short _021E5BC8 - _021E5B88 - 2 ; case 1
	.short _021E5BF6 - _021E5B88 - 2 ; case 2
	.short _021E5C46 - _021E5B88 - 2 ; case 3
	.short _021E5C4C - _021E5B88 - 2 ; case 4
_021E5B92:
	ldr r0, _021E5C68 ; =ov00_021E65D4
	ldr r1, _021E5C6C ; =ov00_021E6638
	bl ov00_021EC294
	ldr r0, _021E5C60 ; =_0221A680
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _021E5C70 ; =0x00000F14
	mov r3, #0x14
	add r0, r1, r0
	mov r1, #2
	bl ov00_021EC3F0
	mov r0, #2
	bl ov00_021EC454
	bl ov00_021EC4A4
	ldr r1, _021E5C60 ; =_0221A680
	ldr r0, _021E5C64 ; =0x00001070
	ldr r2, [r1]
	mov r3, #1
	str r3, [r2, r0]
	ldr r1, [r1]
	mov r2, #0
	add r0, #0x20
	str r2, [r1, r0]
_021E5BC8:
	bl ov00_021EC5B4
	cmp r0, #0
	beq _021E5BF0
	bl ov00_021EC724
	cmp r0, #4
	bne _021E5BE4
	ldr r0, _021E5C60 ; =_0221A680
	mov r2, #2
	ldr r1, [r0]
	ldr r0, _021E5C64 ; =0x00001070
	str r2, [r1, r0]
	b _021E5BF6
_021E5BE4:
	ldr r0, _021E5C60 ; =_0221A680
	mov r2, #0xc
	ldr r1, [r0]
	ldr r0, _021E5C64 ; =0x00001070
	str r2, [r1, r0]
	b _021E5BF6
_021E5BF0:
	bl ov00_021EC60C
	b _021E5C56
_021E5BF6:
	bl ov00_021E6690
	cmp r0, #0
	bne _021E5C5A
	ldr r0, _021E5C60 ; =_0221A680
	mov r2, #0xf1
	ldr r1, [r0]
	ldr r0, _021E5C74 ; =_0221640C
	lsl r2, r2, #4
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	lsl r0, r0, #8
	ldr r0, [r1, r0]
	ldr r3, _021E5C78 ; =_02216400
	str r0, [sp, #0xc]
	mov r0, #0x20
	str r0, [sp, #0x10]
	add r0, #0xe4
	add r0, r1, r0
	ldr r1, [r1, r2]
	ldr r2, _021E5C7C ; =0x000029E7
	bl ov00_021ED730
	add r0, sp, #0x14
	bl OS_GetOwnerInfo
	mov r1, #0
	ldr r2, _021E5C80 ; =ov00_021E61A8
	add r0, sp, #0x18
	add r3, r1, #0
	bl ov00_021EDD6C
	ldr r0, _021E5C60 ; =_0221A680
	mov r2, #3
	ldr r1, [r0]
	ldr r0, _021E5C64 ; =0x00001070
	str r2, [r1, r0]
_021E5C46:
	bl ov00_021EDB1C
	b _021E5C56
_021E5C4C:
	bl ov00_021EDB1C
	add sp, #0x68
	mov r0, #0x1b
	pop {r3, pc}
_021E5C56:
	bl ov00_021E6690
_021E5C5A:
	add sp, #0x68
	pop {r3, pc}
	nop
_021E5C60: .word _0221A680
_021E5C64: .word 0x00001070
_021E5C68: .word ov00_021E65D4
_021E5C6C: .word ov00_021E6638
_021E5C70: .word 0x00000F14
_021E5C74: .word _0221640C
_021E5C78: .word _02216400
_021E5C7C: .word 0x000029E7
_021E5C80: .word ov00_021E61A8
	thumb_func_end ov00_021E5B6C

	thumb_func_start ov00_021E5C84
ov00_021E5C84: ; 0x021E5C84
	push {r3, r4}
	ldr r3, _021E5C98 ; =_0221A680
	ldr r2, _021E5C9C ; =0x00000FA4
	ldr r4, [r3]
	str r0, [r4, r2]
	ldr r3, [r3]
	add r0, r2, #4
	str r1, [r3, r0]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021E5C98: .word _0221A680
_021E5C9C: .word 0x00000FA4
	thumb_func_end ov00_021E5C84

	thumb_func_start ov00_021E5CA0
ov00_021E5CA0: ; 0x021E5CA0
	push {r3, r4}
	ldr r3, _021E5CB4 ; =_0221A680
	ldr r2, _021E5CB8 ; =0x00000FAC
	ldr r4, [r3]
	str r0, [r4, r2]
	ldr r3, [r3]
	add r0, r2, #4
	str r1, [r3, r0]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021E5CB4: .word _0221A680
_021E5CB8: .word 0x00000FAC
	thumb_func_end ov00_021E5CA0

	thumb_func_start ov00_021E5CBC
ov00_021E5CBC: ; 0x021E5CBC
	ldr r1, _021E5CC8 ; =_0221A680
	ldr r2, [r1]
	ldr r1, _021E5CCC ; =0x00000FBC
	str r0, [r2, r1]
	bx lr
	nop
_021E5CC8: .word _0221A680
_021E5CCC: .word 0x00000FBC
	thumb_func_end ov00_021E5CBC

	thumb_func_start ov00_021E5CD0
ov00_021E5CD0: ; 0x021E5CD0
	push {r3, r4}
	ldr r3, _021E5CE4 ; =_0221A680
	ldr r2, _021E5CE8 ; =0x00000FB4
	ldr r4, [r3]
	str r0, [r4, r2]
	ldr r3, [r3]
	add r0, r2, #4
	str r1, [r3, r0]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021E5CE4: .word _0221A680
_021E5CE8: .word 0x00000FB4
	thumb_func_end ov00_021E5CD0

	thumb_func_start ov00_021E5CEC
ov00_021E5CEC: ; 0x021E5CEC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, _021E5DFC ; =_0221A680
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	bne _021E5D04
	bl GF_AssertFail
_021E5D04:
	ldr r0, _021E5DFC ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E5E00 ; =0x00001070
	ldr r0, [r1, r0]
	cmp r0, #4
	beq _021E5D16
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E5D16:
	bl ov00_021E7300
	ldr r2, _021E5E04 ; =_0221602C
	add r1, sp, #8
	ldmia r2!, {r0, r2}
	str r0, [sp, #8]
	mov r0, #0xfa
	lsl r0, r0, #2
	str r2, [sp, #0xc]
	mul r0, r7
	str r0, [sp, #0xc]
	mov r0, #0
	mov r2, #8
	bl ov00_021F14D4
	cmp r0, #0
	beq _021E5D3C
	bl GF_AssertFail
_021E5D3C:
	ldr r1, _021E5E08 ; =_02216414
	mov r0, #0
	add r2, r5, #0
	bl ov00_021F13A4
	cmp r0, #0
	bne _021E5D4E
	bl GF_AssertFail
_021E5D4E:
	ldr r0, _021E5DFC ; =_0221A680
	mov r2, #0x80
	ldr r1, [r0]
	ldr r0, _021E5E0C ; =0x00000FC4
	add r0, r1, r0
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _021E5DFC ; =_0221A680
	ldr r2, _021E5E08 ; =_02216414
	ldr r1, [r0]
	ldr r0, _021E5E0C ; =0x00000FC4
	add r3, r5, #0
	add r0, r1, r0
	ldr r1, _021E5E10 ; =_02216034
	bl sprintf
	ldr r0, _021E5DFC ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E5E0C ; =0x00000FC4
	add r0, r1, r0
	bl strlen
	cmp r0, #0x80
	blo _021E5D84
	bl GF_AssertFail
_021E5D84:
	cmp r6, #0
	beq _021E5D98
	ldr r0, _021E5DFC ; =_0221A680
	ldr r2, _021E5E0C ; =0x00000FC4
	ldr r3, [r0]
	mov r0, #1
	add r1, r3, r2
	add r2, r3, r2
	bl ov00_021F13A4
_021E5D98:
	ldr r2, _021E5DFC ; =_0221A680
	ldr r1, _021E5E00 ; =0x00001070
	ldr r0, [r2]
	mov r3, #5
	str r3, [r0, r1]
	add r0, r1, #0
	ldr r3, [r2]
	add r0, #0xc
	str r4, [r3, r0]
	ldr r0, _021E5E14 ; =ov00_021E6424
	mov r3, #0
	str r0, [sp]
	str r3, [sp, #4]
	lsl r0, r4, #0x18
	ldr r2, [r2]
	sub r1, #0xac
	add r1, r2, r1
	ldr r2, _021E5E18 ; =ov00_021E63CC
	lsr r0, r0, #0x18
	bl ov00_021EDF1C
	ldr r0, _021E5DFC ; =_0221A680
	mov r2, #0
	ldr r1, [r0]
	ldr r0, _021E5E1C ; =0x00001074
	str r2, [r1, r0]
	ldr r0, _021E5E20 ; =ov00_021E6428
	bl ov00_021F989C
	ldr r0, _021E5E24 ; =ov00_021E6484
	bl ov00_021F98BC
	ldr r0, _021E5E28 ; =ov00_021E6554
	mov r1, #0
	bl ov00_021EE24C
	ldr r0, _021E5E2C ; =ov00_021E6240
	bl ov00_021F98DC
	ldr r2, _021E5DFC ; =_0221A680
	ldr r1, _021E5E30 ; =0x00001078
	ldr r0, [r2]
	mov r3, #0
	str r3, [r0, r1]
	ldr r2, [r2]
	mov r0, #1
	add r1, #0x6d
	strb r0, [r2, r1]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E5DFC: .word _0221A680
_021E5E00: .word 0x00001070
_021E5E04: .word _0221602C
_021E5E08: .word _02216414
_021E5E0C: .word 0x00000FC4
_021E5E10: .word _02216034
_021E5E14: .word ov00_021E6424
_021E5E18: .word ov00_021E63CC
_021E5E1C: .word 0x00001074
_021E5E20: .word ov00_021E6428
_021E5E24: .word ov00_021E6484
_021E5E28: .word ov00_021E6554
_021E5E2C: .word ov00_021E6240
_021E5E30: .word 0x00001078
	thumb_func_end ov00_021E5CEC

	thumb_func_start ov00_021E5E34
ov00_021E5E34: ; 0x021E5E34
	ldr r0, _021E5E4C ; =_0221A680
	ldr r2, [r0]
	ldr r0, _021E5E50 ; =0x00001070
	ldr r1, [r2, r0]
	cmp r1, #0xa
	bne _021E5E46
	mov r1, #0xb
	str r1, [r2, r0]
	bx lr
_021E5E46:
	mov r1, #9
	str r1, [r2, r0]
	bx lr
	.balign 4, 0
_021E5E4C: .word _0221A680
_021E5E50: .word 0x00001070
	thumb_func_end ov00_021E5E34

	thumb_func_start ov00_021E5E54
ov00_021E5E54: ; 0x021E5E54
	push {r4, lr}
	ldr r2, _021E5F70 ; =_0221A680
	ldr r1, _021E5F74 ; =0x00001070
	ldr r3, [r2]
	ldr r4, [r3, r1]
	cmp r4, #0x10
	bls _021E5E64
	b _021E5F68
_021E5E64:
	add r4, r4, r4
	add r4, pc
	ldrh r4, [r4, #6]
	lsl r4, r4, #0x10
	asr r4, r4, #0x10
	add pc, r4
_021E5E70: ; jump table
	.short _021E5F68 - _021E5E70 - 2 ; case 0
	.short _021E5F68 - _021E5E70 - 2 ; case 1
	.short _021E5F68 - _021E5E70 - 2 ; case 2
	.short _021E5F68 - _021E5E70 - 2 ; case 3
	.short _021E5F68 - _021E5E70 - 2 ; case 4
	.short _021E5E92 - _021E5E70 - 2 ; case 5
	.short _021E5EC4 - _021E5E70 - 2 ; case 6
	.short _021E5EDC - _021E5E70 - 2 ; case 7
	.short _021E5F68 - _021E5E70 - 2 ; case 8
	.short _021E5F18 - _021E5E70 - 2 ; case 9
	.short _021E5EC4 - _021E5E70 - 2 ; case 10
	.short _021E5F32 - _021E5E70 - 2 ; case 11
	.short _021E5F4C - _021E5E70 - 2 ; case 12
	.short _021E5F68 - _021E5E70 - 2 ; case 13
	.short _021E5F68 - _021E5E70 - 2 ; case 14
	.short _021E5F68 - _021E5E70 - 2 ; case 15
	.short _021E5F52 - _021E5E70 - 2 ; case 16
_021E5E92:
	cmp r0, #0
	beq _021E5E9A
	mov r0, #6
	str r0, [r3, r1]
_021E5E9A:
	ldr r0, _021E5F70 ; =_0221A680
	ldr r2, _021E5F78 ; =0x00001074
	ldr r0, [r0]
	ldr r1, [r0, r2]
	cmp r1, #2
	bne _021E5F68
	add r1, r2, #0
	add r1, #0x20
	ldr r1, [r0, r1]
	cmp r1, #0
	blt _021E5F68
	add r3, r0, r1
	add r1, r2, #0
	sub r1, #0x30
	ldrb r1, [r3, r1]
	cmp r1, #6
	beq _021E5F68
	mov r3, #0xa
	sub r1, r2, #4
	str r3, [r0, r1]
	b _021E5F68
_021E5EC4:
	add r0, r1, #4
	ldr r0, [r3, r0]
	cmp r0, #0
	bne _021E5ED2
	bl ov00_021F1284
	b _021E5F68
_021E5ED2:
	bl ov00_021EE278
	bl ov00_021E5E34
	b _021E5F68
_021E5EDC:
	bl sub_0203993C
	bl sub_02034084
	cmp r0, #0
	bne _021E5EF4
	ldr r0, _021E5F70 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E5F7C ; =0x00001084
	ldr r0, [r1, r0]
	bl ov00_021E69A8
_021E5EF4:
	ldr r0, _021E5F70 ; =_0221A680
	ldr r2, [r0]
	ldr r0, _021E5F80 ; =0x0000109C
	ldr r1, [r2, r0]
	cmp r1, #0
	beq _021E5F04
	mov r1, #1
	b _021E5F06
_021E5F04:
	mov r1, #0
_021E5F06:
	add r0, #0x38
	strh r1, [r2, r0]
	ldr r0, _021E5F70 ; =_0221A680
	mov r2, #8
	ldr r1, [r0]
	ldr r0, _021E5F74 ; =0x00001070
	str r2, [r1, r0]
	mov r0, #0x14
	pop {r4, pc}
_021E5F18:
	mov r0, #4
	str r0, [r3, r1]
	add r0, r1, #0
	ldr r3, [r2]
	mov r4, #0
	add r0, #8
	str r4, [r3, r0]
	ldr r0, [r2]
	sub r3, r4, #1
	add r1, #0x28
	str r3, [r0, r1]
	mov r0, #0x15
	pop {r4, pc}
_021E5F32:
	mov r0, #4
	str r0, [r3, r1]
	add r0, r1, #0
	ldr r3, [r2]
	mov r4, #0
	add r0, #8
	str r4, [r3, r0]
	ldr r0, [r2]
	sub r3, r4, #1
	add r1, #0x28
	str r3, [r0, r1]
	mov r0, #0x16
	pop {r4, pc}
_021E5F4C:
	bl ov00_021E6690
	pop {r4, pc}
_021E5F52:
	add r1, #0x20
	ldr r0, [r3, r1]
	cmp r0, #0
	bne _021E5F68
	bl ov00_021EE278
	ldr r0, _021E5F70 ; =_0221A680
	mov r2, #0x11
	ldr r1, [r0]
	ldr r0, _021E5F74 ; =0x00001070
	str r2, [r1, r0]
_021E5F68:
	bl ov00_021E6850
	pop {r4, pc}
	nop
_021E5F70: .word _0221A680
_021E5F74: .word 0x00001070
_021E5F78: .word 0x00001074
_021E5F7C: .word 0x00001084
_021E5F80: .word 0x0000109C
	thumb_func_end ov00_021E5E54

	thumb_func_start ov00_021E5F84
ov00_021E5F84: ; 0x021E5F84
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #1
	add r4, r1, #0
	lsl r0, r0, #8
	cmp r4, r0
	blt _021E5F96
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E5F96:
	bl ov00_021EE490
	cmp r0, #0
	bne _021E5FB8
	ldr r0, _021E601C ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E6020 ; =0x00000FA4
	ldr r3, [r1, r0]
	cmp r3, #0
	beq _021E5FB4
	lsl r2, r4, #0x10
	mov r0, #0
	add r1, r5, #0
	lsr r2, r2, #0x10
	blx r3
_021E5FB4:
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E5FB8:
	ldr r0, _021E601C ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E6024 ; =0x00001078
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _021E5FCC
	bl ov00_021E6790
	cmp r0, #0
	bne _021E5FD0
_021E5FCC:
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E5FD0:
	ldr r1, _021E601C ; =_0221A680
	ldr r0, _021E6028 ; =0x000010D4
	ldr r2, [r1]
	ldrh r3, [r2, r0]
	lsl r6, r3, #8
	mov r3, #1
	orr r3, r6
	str r3, [r2]
	add r3, r0, #0
	ldr r2, [r1]
	add r3, #8
	ldrb r3, [r2, r3]
	add r6, r3, #1
	add r3, r0, #0
	add r3, #8
	strb r6, [r2, r3]
	ldr r2, [r1]
	add r0, #8
	ldrb r0, [r2, r0]
	strb r0, [r2, #2]
	ldr r1, [r1]
	add r0, r5, #0
	add r1, r1, #4
	add r2, r4, #0
	bl MI_CpuCopy8
	ldr r2, _021E601C ; =_0221A680
	ldr r1, _021E6024 ; =0x00001078
	ldr r3, [r2]
	mov r0, #1
	str r0, [r3, r1]
	ldr r1, [r2]
	add r2, r4, #4
	bl ov00_021F9750
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_021E601C: .word _0221A680
_021E6020: .word 0x00000FA4
_021E6024: .word 0x00001078
_021E6028: .word 0x000010D4
	thumb_func_end ov00_021E5F84

	thumb_func_start ov00_021E602C
ov00_021E602C: ; 0x021E602C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #1
	add r4, r1, #0
	lsl r0, r0, #8
	cmp r4, r0
	blt _021E603E
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E603E:
	bl ov00_021EE490
	cmp r0, #0
	beq _021E604A
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E604A:
	ldr r0, _021E60D8 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E60DC ; =0x00001078
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _021E605E
	bl ov00_021E6790
	cmp r0, #0
	bne _021E6062
_021E605E:
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E6062:
	ldr r1, _021E60D8 ; =_0221A680
	ldr r0, _021E60E0 ; =0x000010D4
	ldr r2, [r1]
	ldrh r3, [r2, r0]
	lsl r6, r3, #8
	mov r3, #1
	orr r3, r6
	str r3, [r2]
	add r3, r0, #0
	ldr r2, [r1]
	add r3, #8
	ldrb r3, [r2, r3]
	add r6, r3, #1
	add r3, r0, #0
	add r3, #8
	strb r6, [r2, r3]
	ldr r2, [r1]
	add r0, #8
	ldrb r0, [r2, r0]
	strb r0, [r2, #2]
	ldr r1, [r1]
	add r0, r5, #0
	add r1, r1, #4
	add r2, r4, #0
	bl MI_CpuCopy8
	ldr r0, _021E60D8 ; =_0221A680
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _021E60DC ; =0x00001078
	str r2, [r1, r0]
	bl ov00_021EE4FC
	ldr r1, _021E60D8 ; =_0221A680
	add r2, r4, #4
	ldr r1, [r1]
	bl ov00_021F9750
	cmp r0, #0
	bne _021E60BE
	ldr r1, _021E60D8 ; =_0221A680
	mov r0, #0
	ldr r2, [r1]
	ldr r1, _021E60DC ; =0x00001078
	str r0, [r2, r1]
	pop {r4, r5, r6, pc}
_021E60BE:
	ldr r0, _021E60D8 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E60E4 ; =0x00000FA8
	ldr r3, [r1, r0]
	cmp r3, #0
	beq _021E60D4
	lsl r2, r4, #0x10
	mov r0, #0
	add r1, r5, #0
	lsr r2, r2, #0x10
	blx r3
_021E60D4:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E60D8: .word _0221A680
_021E60DC: .word 0x00001078
_021E60E0: .word 0x000010D4
_021E60E4: .word 0x00000FA8
	thumb_func_end ov00_021E602C

	thumb_func_start ov00_021E60E8
ov00_021E60E8: ; 0x021E60E8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #1
	add r4, r1, #0
	lsl r0, r0, #8
	cmp r4, r0
	blt _021E60FA
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E60FA:
	ldr r0, _021E6198 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E619C ; =0x00001078
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _021E610E
	bl ov00_021E6790
	cmp r0, #0
	bne _021E6112
_021E610E:
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E6112:
	ldr r1, _021E6198 ; =_0221A680
	ldr r0, _021E61A0 ; =0x000010D4
	ldr r2, [r1]
	ldrh r3, [r2, r0]
	lsl r6, r3, #8
	mov r3, #1
	orr r3, r6
	str r3, [r2]
	add r3, r0, #0
	ldr r2, [r1]
	add r3, #8
	ldrb r3, [r2, r3]
	add r6, r3, #1
	add r3, r0, #0
	add r3, #8
	strb r6, [r2, r3]
	ldr r2, [r1]
	add r0, #8
	ldrb r0, [r2, r0]
	strb r0, [r2, #2]
	ldr r1, [r1]
	add r0, r5, #0
	add r1, r1, #4
	add r2, r4, #0
	bl MI_CpuCopy8
	ldr r0, _021E6198 ; =_0221A680
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _021E619C ; =0x00001078
	str r2, [r1, r0]
	bl ov00_021EE4FC
	ldr r1, _021E6198 ; =_0221A680
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r1, [r1]
	add r0, r6, #0
	add r2, r4, #4
	bl ov00_021F9750
	cmp r6, r0
	beq _021E6174
	ldr r1, _021E6198 ; =_0221A680
	mov r0, #0
	ldr r2, [r1]
	ldr r1, _021E619C ; =0x00001078
	str r0, [r2, r1]
	pop {r4, r5, r6, pc}
_021E6174:
	ldr r0, _021E6198 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E61A4 ; =0x00000FA8
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021E6194
	bl ov00_021EE490
	lsl r2, r4, #0x10
	ldr r3, _021E6198 ; =_0221A680
	add r1, r5, #0
	ldr r4, [r3]
	ldr r3, _021E61A4 ; =0x00000FA8
	lsr r2, r2, #0x10
	ldr r3, [r4, r3]
	blx r3
_021E6194:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E6198: .word _0221A680
_021E619C: .word 0x00001078
_021E61A0: .word 0x000010D4
_021E61A4: .word 0x00000FA8
	thumb_func_end ov00_021E60E8

	thumb_func_start ov00_021E61A8
ov00_021E61A8: ; 0x021E61A8
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _021E6224 ; =_0221A680
	add r4, r2, #0
	ldr r1, [r0]
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl DWC_CheckDirtyFlag
	cmp r0, #0
	beq _021E61DA
	ldr r0, _021E6224 ; =_0221A680
	ldr r1, [r0]
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl DWC_ClearDirtyFlag
	ldr r0, _021E6224 ; =_0221A680
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _021E6228 ; =0x000010E6
	strb r2, [r1, r0]
_021E61DA:
	cmp r5, #0
	bne _021E6214
	ldr r0, _021E622C ; =ov00_021E629C
	str r4, [sp]
	str r0, [sp, #4]
	ldr r2, _021E6224 ; =_0221A680
	str r4, [sp, #8]
	ldr r3, [r2]
	mov r2, #0xf1
	lsl r2, r2, #4
	ldr r2, [r3, r2]
	ldr r1, _021E6230 ; =ov00_021E6274
	ldr r3, _021E6234 ; =ov00_021E6298
	mov r0, #0
	bl ov00_021EDE74
	cmp r0, #0
	bne _021E6208
	mov r0, #1
	bl sub_02039AD8
	add sp, #0xc
	pop {r4, r5, pc}
_021E6208:
	ldr r0, _021E6238 ; =ov00_021E62D4
	mov r1, #0
	bl ov00_021EFF04
	add sp, #0xc
	pop {r4, r5, pc}
_021E6214:
	ldr r0, _021E6224 ; =_0221A680
	mov r2, #0xc
	ldr r1, [r0]
	ldr r0, _021E623C ; =0x00001070
	str r2, [r1, r0]
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E6224: .word _0221A680
_021E6228: .word 0x000010E6
_021E622C: .word ov00_021E629C
_021E6230: .word ov00_021E6274
_021E6234: .word ov00_021E6298
_021E6238: .word ov00_021E62D4
_021E623C: .word 0x00001070
	thumb_func_end ov00_021E61A8

	thumb_func_start ov00_021E6240
ov00_021E6240: ; 0x021E6240
	push {r3, lr}
	ldr r0, _021E6268 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E626C ; =0x000010A8
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021E6266
	bl ov00_021EE278
	ldr r1, _021E6268 ; =_0221A680
	mov r3, #0
	ldr r2, [r1]
	ldr r0, _021E6270 ; =0x00001098
	mvn r3, r3
	str r3, [r2, r0]
	ldr r1, [r1]
	mov r2, #0x12
	sub r0, #0x28
	str r2, [r1, r0]
_021E6266:
	pop {r3, pc}
	.balign 4, 0
_021E6268: .word _0221A680
_021E626C: .word 0x000010A8
_021E6270: .word 0x00001098
	thumb_func_end ov00_021E6240

	thumb_func_start ov00_021E6274
ov00_021E6274: ; 0x021E6274
	cmp r0, #0
	bne _021E6284
	ldr r0, _021E6290 ; =_0221A680
	mov r2, #4
	ldr r1, [r0]
	ldr r0, _021E6294 ; =0x00001070
	str r2, [r1, r0]
	bx lr
_021E6284:
	ldr r0, _021E6290 ; =_0221A680
	mov r2, #0xc
	ldr r1, [r0]
	ldr r0, _021E6294 ; =0x00001070
	str r2, [r1, r0]
	bx lr
	.balign 4, 0
_021E6290: .word _0221A680
_021E6294: .word 0x00001070
	thumb_func_end ov00_021E6274

	thumb_func_start ov00_021E6298
ov00_021E6298: ; 0x021E6298
	bx lr
	.balign 4, 0
	thumb_func_end ov00_021E6298

	thumb_func_start ov00_021E629C
ov00_021E629C: ; 0x021E629C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _021E62CC ; =_0221A680
	add r4, r1, #0
	ldr r1, [r0]
	ldr r0, _021E62D0 ; =0x00000F78
	ldr r0, [r1, r0]
	bl sub_0202C6F4
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0202C5E4
	ldr r0, _021E62CC ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E62D0 ; =0x00000F78
	ldr r0, [r1, r0]
	bl Save_Frontier_GetStatic
	add r1, r5, #0
	add r2, r4, #0
	bl sub_02031214
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E62CC: .word _0221A680
_021E62D0: .word 0x00000F78
	thumb_func_end ov00_021E629C

	thumb_func_start ov00_021E62D4
ov00_021E62D4: ; 0x021E62D4
	bx lr
	.balign 4, 0
	thumb_func_end ov00_021E62D4

	thumb_func_start ov00_021E62D8
ov00_021E62D8: ; 0x021E62D8
	ldr r0, _021E62E8 ; =_0221A680
	ldr r3, _021E62EC ; =MI_CpuFill8
	ldr r1, [r0]
	ldr r0, _021E62F0 ; =0x000010AC
	mov r2, #0x20
	add r0, r1, r0
	mov r1, #0
	bx r3
	.balign 4, 0
_021E62E8: .word _0221A680
_021E62EC: .word MI_CpuFill8
_021E62F0: .word 0x000010AC
	thumb_func_end ov00_021E62D8

	thumb_func_start ov00_021E62F4
ov00_021E62F4: ; 0x021E62F4
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	add r4, r5, #0
_021E62FA:
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	add r1, r4, #0
	bl ov00_021F9988
	add r5, r5, #1
	cmp r5, #4
	blt _021E62FA
	bl ov00_021EE490
	cmp r0, #0
	bne _021E6356
	ldr r6, _021E6378 ; =_0221A680
	ldr r0, _021E637C ; =0x0000107C
	ldr r1, [r6]
	mov r5, #0
	ldr r0, [r1, r0]
	cmp r0, #0
	ble _021E6366
	ldr r7, _021E637C ; =0x0000107C
	mov r4, #1
_021E6324:
	bl ov00_021EE490
	cmp r5, r0
	beq _021E634A
	bl ov00_021EE4FC
	add r1, r4, #0
	lsl r1, r5
	tst r0, r1
	beq _021E634A
	lsl r0, r5, #0x18
	ldr r1, _021E6380 ; =0x00002710
	lsr r0, r0, #0x18
	bl ov00_021F9988
	cmp r0, #0
	bne _021E634A
	bl GF_AssertFail
_021E634A:
	ldr r0, [r6]
	add r5, r5, #1
	ldr r0, [r0, r7]
	cmp r5, r0
	blt _021E6324
	b _021E6366
_021E6356:
	ldr r1, _021E6380 ; =0x00002710
	mov r0, #0
	bl ov00_021F9988
	cmp r0, #0
	bne _021E6366
	bl GF_AssertFail
_021E6366:
	ldr r0, _021E6378 ; =_0221A680
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _021E6384 ; =0x000010A8
	str r2, [r1, r0]
	bl ov00_021E62D8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6378: .word _0221A680
_021E637C: .word 0x0000107C
_021E6380: .word 0x00002710
_021E6384: .word 0x000010A8
	thumb_func_end ov00_021E62F4

	thumb_func_start ov00_021E6388
ov00_021E6388: ; 0x021E6388
	push {r4, r5, r6, lr}
	ldr r4, _021E63C0 ; =_0221A680
	ldr r0, _021E63C4 ; =0x00001070
	ldr r1, [r4]
	mov r2, #7
	str r2, [r1, r0]
	ldr r1, [r4]
	add r0, #0xc
	ldr r0, [r1, r0]
	mov r5, #0
	cmp r0, #0
	ble _021E63BA
	ldr r6, _021E63C8 ; =0x0000107C
_021E63A2:
	bl ov00_021EE490
	cmp r5, r0
	beq _021E63B0
	add r0, r5, #0
	bl ov00_021E727C
_021E63B0:
	ldr r0, [r4]
	add r5, r5, #1
	ldr r0, [r0, r6]
	cmp r5, r0
	blt _021E63A2
_021E63BA:
	bl ov00_021E62F4
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E63C0: .word _0221A680
_021E63C4: .word 0x00001070
_021E63C8: .word 0x0000107C
	thumb_func_end ov00_021E6388

	thumb_func_start ov00_021E63CC
ov00_021E63CC: ; 0x021E63CC
	push {r4, lr}
	cmp r0, #0
	bne _021E63EA
	cmp r1, #0
	bne _021E63E4
	bl ov00_021EE490
	mov r1, #1
	sub r0, r1, r0
	bl ov00_021E6388
	b _021E63F4
_021E63E4:
	bl ov00_021E5E34
	b _021E63F4
_021E63EA:
	ldr r0, _021E6414 ; =_0221A680
	mov r2, #0xc
	ldr r1, [r0]
	ldr r0, _021E6418 ; =0x00001070
	str r2, [r1, r0]
_021E63F4:
	ldr r0, _021E6414 ; =_0221A680
	ldr r4, [r0]
	ldr r0, _021E641C ; =0x00000FB4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E6412
	bl ov00_021EE490
	ldr r3, _021E6414 ; =_0221A680
	ldr r2, _021E6420 ; =0x00000FB8
	ldr r3, [r3]
	ldr r1, [r4, r2]
	sub r2, r2, #4
	ldr r2, [r3, r2]
	blx r2
_021E6412:
	pop {r4, pc}
	.balign 4, 0
_021E6414: .word _0221A680
_021E6418: .word 0x00001070
_021E641C: .word 0x00000FB4
_021E6420: .word 0x00000FB8
	thumb_func_end ov00_021E63CC

	thumb_func_start ov00_021E6424
ov00_021E6424: ; 0x021E6424
	mov r0, #1
	bx lr
	thumb_func_end ov00_021E6424

	thumb_func_start ov00_021E6428
ov00_021E6428: ; 0x021E6428
	push {r3, r4}
	ldr r2, _021E6444 ; =_0221A680
	ldr r0, _021E6448 ; =0x00001078
	ldr r3, [r2]
	mov r4, #0
	str r4, [r3, r0]
	ldr r2, [r2]
	lsl r1, r1, #2
	add r1, r2, r1
	add r0, #0x34
	str r4, [r1, r0]
	pop {r3, r4}
	bx lr
	nop
_021E6444: .word _0221A680
_021E6448: .word 0x00001078
	thumb_func_end ov00_021E6428

	thumb_func_start ov00_021E644C
ov00_021E644C: ; 0x021E644C
	push {r4, lr}
	add r4, r0, #0
	bl sub_0203993C
	bl sub_02034084
	cmp r0, #0
	bne _021E647A
	mov r0, #1
	lsl r0, r0, #8
	tst r0, r4
	beq _021E6470
	ldr r0, _021E647C ; =_0221A680
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _021E6480 ; =0x000010D0
	str r2, [r1, r0]
	pop {r4, pc}
_021E6470:
	ldr r0, _021E647C ; =_0221A680
	mov r2, #0
	ldr r1, [r0]
	ldr r0, _021E6480 ; =0x000010D0
	str r2, [r1, r0]
_021E647A:
	pop {r4, pc}
	.balign 4, 0
_021E647C: .word _0221A680
_021E6480: .word 0x000010D0
	thumb_func_end ov00_021E644C

	thumb_func_start ov00_021E6484
ov00_021E6484: ; 0x021E6484
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r4, r1, #0
	ldrb r3, [r4, #1]
	ldrb r6, [r4]
	add r7, r2, #0
	lsl r3, r3, #8
	mov ip, r3
	ldrb r3, [r4, #3]
	lsl r5, r3, #0x18
	ldrb r3, [r4, #2]
	lsl r3, r3, #0x10
	orr r3, r5
	mov r5, ip
	orr r3, r5
	orr r3, r6
	str r3, [sp, #4]
	ldr r3, _021E6544 ; =_0221A680
	ldr r5, _021E6548 ; =0x000010A8
	ldr r6, [r3]
	mov r3, #1
	str r3, [r6, r5]
	ldr r3, [sp, #4]
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	cmp r3, #1
	bne _021E64D0
	ldr r0, [sp, #4]
	bl ov00_021E644C
	ldr r0, _021E6544 ; =_0221A680
	ldrb r2, [r4, #2]
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0x35
	strb r2, [r1, r0]
	b _021E64E2
_021E64D0:
	bl ov00_021E77A4
	cmp r0, #0
	bne _021E6540
	ldr r0, [sp, #4]
	bl ov00_021E644C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_021E64E2:
	sub r6, r7, #4
	mov r0, #0
	add r1, r6, #0
	mov r2, #4
	bl ov00_021E65D4
	add r5, r0, #0
	beq _021E6540
	add r0, r4, #4
	add r1, r5, #0
	add r2, r6, #0
	bl MI_CpuCopy8
	bl ov00_021EE490
	cmp r0, #0
	bne _021E651E
	ldr r0, _021E6544 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E654C ; =0x00000FA4
	ldr r3, [r1, r0]
	cmp r3, #0
	beq _021E6536
	add r2, r6, #0
	lsl r2, r2, #0x10
	ldr r0, [sp]
	add r1, r5, #0
	lsr r2, r2, #0x10
	blx r3
	b _021E6536
_021E651E:
	ldr r0, _021E6544 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E6550 ; =0x00000FA8
	ldr r3, [r1, r0]
	cmp r3, #0
	beq _021E6536
	add r2, r6, #0
	lsl r2, r2, #0x10
	ldr r0, [sp]
	add r1, r5, #0
	lsr r2, r2, #0x10
	blx r3
_021E6536:
	mov r0, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ov00_021E6638
_021E6540:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6544: .word _0221A680
_021E6548: .word 0x000010A8
_021E654C: .word 0x00000FA4
_021E6550: .word 0x00000FA8
	thumb_func_end ov00_021E6484

	thumb_func_start ov00_021E6554
ov00_021E6554: ; 0x021E6554
	push {r4, r5, r6, lr}
	ldr r5, _021E65C0 ; =_0221A680
	add r4, r3, #0
	ldr r3, [r5]
	ldr r2, _021E65C4 ; =0x00001078
	mov r1, #0
	str r1, [r3, r2]
	add r3, r2, #0
	ldr r6, [r5]
	add r3, #0x54
	str r1, [r6, r3]
	add r3, r2, #0
	add r3, #0x28
	ldr r6, [r5]
	cmp r0, #0
	str r1, [r6, r3]
	bne _021E65A8
	ldr r0, [r5]
	add r2, #0x6d
	ldrb r0, [r0, r2]
	cmp r0, #1
	bne _021E65A8
	bl ov00_021EE448
	cmp r0, #1
	bne _021E65A8
	add r0, r5, #0
	ldr r2, [r0]
	ldr r0, _021E65C8 ; =0x00001070
	ldr r1, [r2, r0]
	cmp r1, #6
	beq _021E6598
	mov r1, #0x10
	str r1, [r2, r0]
_021E6598:
	ldr r0, _021E65C0 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E65CC ; =0x00001090
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021E65A8
	bl ov00_021E6A4C
_021E65A8:
	ldr r0, _021E65C0 ; =_0221A680
	ldr r1, _021E65D0 ; =0x00000FAC
	ldr r3, [r0]
	ldr r2, [r3, r1]
	cmp r2, #0
	beq _021E65BC
	add r1, r1, #4
	ldr r1, [r3, r1]
	add r0, r4, #0
	blx r2
_021E65BC:
	pop {r4, r5, r6, pc}
	nop
_021E65C0: .word _0221A680
_021E65C4: .word 0x00001078
_021E65C8: .word 0x00001070
_021E65CC: .word 0x00001090
_021E65D0: .word 0x00000FAC
	thumb_func_end ov00_021E6554

	thumb_func_start ov00_021E65D4
ov00_021E65D4: ; 0x021E65D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	bl OS_DisableInterrupts
	add r7, r0, #0
	ldr r0, _021E662C ; =_0221A680
	add r2, r6, #0
	ldr r1, [r0]
	ldr r0, _021E6630 ; =0x00000F94
	ldr r0, [r1, r0]
	add r1, r5, #0
	bl NNS_FndAllocFromExpHeapEx
	add r4, r0, #0
	bne _021E660E
	ldr r0, _021E662C ; =_0221A680
	ldr r1, _021E6634 ; =0x00000F98
	ldr r0, [r0]
	ldr r2, [r0, r1]
	cmp r2, #0
	beq _021E660E
	add r1, r1, #4
	ldr r0, [r0, r1]
	add r1, r5, #0
	add r2, r6, #0
	bl NNS_FndAllocFromExpHeapEx
	add r4, r0, #0
_021E660E:
	cmp r4, #0
	bne _021E6622
	mov r0, #1
	bl sub_02039AD8
	add r0, r7, #0
	bl OS_RestoreInterrupts
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E6622:
	add r0, r7, #0
	bl OS_RestoreInterrupts
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E662C: .word _0221A680
_021E6630: .word 0x00000F94
_021E6634: .word 0x00000F98
	thumb_func_end ov00_021E65D4

	thumb_func_start ov00_021E6638
ov00_021E6638: ; 0x021E6638
	push {r3, r4, r5, lr}
	add r5, r1, #0
	beq _021E6682
	bl OS_DisableInterrupts
	add r4, r0, #0
	add r0, r5, #0
	bl NNS_FndGetGroupIDForMBlockExpHeap
	cmp r0, #0x10
	bne _021E666E
	ldr r0, _021E6684 ; =_0221A680
	ldr r2, [r0]
	ldr r0, _021E6688 ; =0x00000F98
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _021E6662
	mov r0, #1
	bl sub_02039AD8
	pop {r3, r4, r5, pc}
_021E6662:
	add r0, r0, #4
	ldr r0, [r2, r0]
	add r1, r5, #0
	bl NNS_FndFreeToExpHeap
	b _021E667C
_021E666E:
	ldr r0, _021E6684 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E668C ; =0x00000F94
	ldr r0, [r1, r0]
	add r1, r5, #0
	bl NNS_FndFreeToExpHeap
_021E667C:
	add r0, r4, #0
	bl OS_RestoreInterrupts
_021E6682:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6684: .word _0221A680
_021E6688: .word 0x00000F98
_021E668C: .word 0x00000F94
	thumb_func_end ov00_021E6638

	thumb_func_start ov00_021E6690
ov00_021E6690: ; 0x021E6690
	push {r3, r4, r5, lr}
	sub sp, #8
	add r0, sp, #4
	add r1, sp, #0
	mov r4, #0
	bl ov00_021EC11C
	add r5, r0, #0
	beq _021E6762
	ldr r4, [sp, #4]
	cmp r4, #0
	beq _021E66AE
	ldr r0, [sp]
	cmp r0, #1
	bne _021E66B0
_021E66AE:
	add r4, r5, #0
_021E66B0:
	ldr r0, [sp]
	cmp r0, #7
	bhi _021E6762
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E66C2: ; jump table
	.short _021E6762 - _021E66C2 - 2 ; case 0
	.short _021E66D2 - _021E66C2 - 2 ; case 1
	.short _021E66D8 - _021E66C2 - 2 ; case 2
	.short _021E66DE - _021E66C2 - 2 ; case 3
	.short _021E66DE - _021E66C2 - 2 ; case 4
	.short _021E66DE - _021E66C2 - 2 ; case 5
	.short _021E66DE - _021E66C2 - 2 ; case 6
	.short _021E6744 - _021E66C2 - 2 ; case 7
_021E66D2:
	bl ov00_021EC210
	b _021E6762
_021E66D8:
	bl ov00_021EC210
	b _021E6762
_021E66DE:
	ldr r0, _021E6784 ; =_0221A680
	ldr r1, [r0]
	cmp r1, #0
	beq _021E6734
	ldr r0, _021E6788 ; =0x00001070
	ldr r0, [r1, r0]
	cmp r0, #0x12
	bhi _021E6730
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E66FA: ; jump table
	.short _021E6724 - _021E66FA - 2 ; case 0
	.short _021E6724 - _021E66FA - 2 ; case 1
	.short _021E6724 - _021E66FA - 2 ; case 2
	.short _021E6720 - _021E66FA - 2 ; case 3
	.short _021E6720 - _021E66FA - 2 ; case 4
	.short _021E6720 - _021E66FA - 2 ; case 5
	.short _021E6720 - _021E66FA - 2 ; case 6
	.short _021E6720 - _021E66FA - 2 ; case 7
	.short _021E6720 - _021E66FA - 2 ; case 8
	.short _021E6720 - _021E66FA - 2 ; case 9
	.short _021E6730 - _021E66FA - 2 ; case 10
	.short _021E6730 - _021E66FA - 2 ; case 11
	.short _021E6720 - _021E66FA - 2 ; case 12
	.short _021E6730 - _021E66FA - 2 ; case 13
	.short _021E6730 - _021E66FA - 2 ; case 14
	.short _021E6730 - _021E66FA - 2 ; case 15
	.short _021E6720 - _021E66FA - 2 ; case 16
	.short _021E6720 - _021E66FA - 2 ; case 17
	.short _021E6720 - _021E66FA - 2 ; case 18
_021E6720:
	bl ov00_021ED9B4
_021E6724:
	bl sub_0203993C
	cmp r0, #0x21
	beq _021E6730
	bl ov00_021EC8D8
_021E6730:
	bl ov00_021EC210
_021E6734:
	ldr r0, _021E6784 ; =_0221A680
	ldr r2, [r0]
	cmp r2, #0
	beq _021E6762
	ldr r0, _021E6788 ; =0x00001070
	mov r1, #0xe
	str r1, [r2, r0]
	b _021E6762
_021E6744:
	ldr r1, _021E6784 ; =_0221A680
	ldr r3, [r1]
	cmp r3, #0
	beq _021E6762
	ldr r0, _021E6788 ; =0x00001070
	mov r2, #0xf
	str r2, [r3, r0]
	ldr r1, [r1]
	sub r0, #0xb0
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _021E6762
	ldr r0, [sp, #4]
	neg r0, r0
	blx r1
_021E6762:
	ldr r0, _021E6784 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E678C ; =0x000010DE
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _021E6770
	mov r4, #0x1a
_021E6770:
	cmp r5, #0
	beq _021E677E
	ldr r0, [sp, #4]
	ldr r1, [sp]
	add r2, r5, #0
	bl sub_02038F74
_021E677E:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6784: .word _0221A680
_021E6788: .word 0x00001070
_021E678C: .word 0x000010DE
	thumb_func_end ov00_021E6690

	thumb_func_start ov00_021E6790
ov00_021E6790: ; 0x021E6790
	push {r3, r4, r5, r6, r7, lr}
	ldr r6, _021E67D8 ; =_0221A680
	mov r5, #0
	ldr r1, [r6]
	ldr r0, _021E67DC ; =0x0000107C
	add r4, r5, #0
	ldr r0, [r1, r0]
	cmp r0, #0
	ble _021E67D4
	ldr r7, _021E67DC ; =0x0000107C
_021E67A4:
	bl ov00_021EE490
	cmp r4, r0
	beq _021E67CA
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl ov00_021EE530
	cmp r0, #0
	beq _021E67CA
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	mov r5, #1
	bl ov00_021F9580
	cmp r0, #0
	bne _021E67CA
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E67CA:
	ldr r0, [r6]
	add r4, r4, #1
	ldr r0, [r0, r7]
	cmp r4, r0
	blt _021E67A4
_021E67D4:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E67D8: .word _0221A680
_021E67DC: .word 0x0000107C
	thumb_func_end ov00_021E6790

	thumb_func_start ov00_021E67E0
ov00_021E67E0: ; 0x021E67E0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E6840 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E6844 ; =0x00001078
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _021E683A
	bl ov00_021E6790
	cmp r0, #0
	beq _021E683A
	bl ov00_021EE4FC
	ldr r1, _021E6848 ; =0x0000FFFE
	tst r0, r1
	beq _021E683A
	ldr r1, _021E6840 ; =_0221A680
	ldr r0, _021E6844 ; =0x00001078
	ldr r2, [r1]
	mov r3, #1
	str r3, [r2, r0]
	ldr r2, [r1]
	add r0, #0x5c
	ldrh r0, [r2, r0]
	lsl r1, r0, #8
	mov r0, #2
	orr r0, r1
	str r0, [r2]
	bl ov00_021EE4FC
	ldr r1, _021E6840 ; =_0221A680
	mov r2, #4
	ldr r1, [r1]
	bl ov00_021F9750
	ldr r0, _021E6840 ; =_0221A680
	mov r2, #0
	ldr r1, [r0]
	lsl r0, r4, #2
	add r1, r1, r0
	ldr r0, _021E684C ; =0x000010AC
	str r2, [r1, r0]
	mov r0, #1
	pop {r4, pc}
_021E683A:
	mov r0, #0
	pop {r4, pc}
	nop
_021E6840: .word _0221A680
_021E6844: .word 0x00001078
_021E6848: .word 0x0000FFFE
_021E684C: .word 0x000010AC
	thumb_func_end ov00_021E67E0

	thumb_func_start ov00_021E6850
ov00_021E6850: ; 0x021E6850
	push {r3, r4, r5, r6, r7, lr}
	bl ov00_021EDB1C
	bl ov00_021E6CE8
	ldr r0, _021E694C ; =_0221A680
	ldr r1, _021E6950 ; =0x00001090
	ldr r2, [r0]
	ldr r0, [r2, r1]
	cmp r0, #0
	beq _021E68D8
	add r0, r1, #0
	add r0, #0x44
	ldrh r0, [r2, r0]
	cmp r0, #1
	bne _021E6888
	add r0, r1, #0
	add r0, #0x40
	ldr r0, [r2, r0]
	cmp r0, #1
	bne _021E6888
	add r1, #0x46
	ldrh r0, [r2, r1]
	cmp r0, #1
	bne _021E6888
	bl ov00_021E7AE0
	b _021E688C
_021E6888:
	bl ov00_021E7ACC
_021E688C:
	bl ov00_021E765C
	ldr r0, _021E694C ; =_0221A680
	ldr r4, [r0]
	bl ov00_021EE4FC
	mov r1, #0x42
	lsl r1, r1, #6
	ldr r2, [r4, r1]
	cmp r2, r0
	beq _021E68D8
	add r0, r1, #0
	add r0, #0x5f
	ldrb r0, [r4, r0]
	cmp r0, #0
	bne _021E68D8
	add r1, #0x1c
	ldr r0, [r4, r1]
	cmp r0, #0
	beq _021E68D8
	bl ov00_021EE4FC
	add r4, r0, #0
	bl ov00_021EE490
	add r1, r0, #0
	add r0, r4, #0
	bl ov00_021E7AF4
	cmp r0, #0
	beq _021E68D8
	bl ov00_021EE4FC
	ldr r1, _021E694C ; =_0221A680
	ldr r2, [r1]
	mov r1, #0x42
	lsl r1, r1, #6
	str r0, [r2, r1]
_021E68D8:
	ldr r6, _021E694C ; =_0221A680
	ldr r1, _021E6954 ; =0x00001070
	ldr r0, [r6]
	ldr r2, [r0, r1]
	cmp r2, #0x12
	bne _021E68F0
	bl ov00_021E6690
	cmp r0, #0
	bne _021E694A
	mov r0, #0x17
	pop {r3, r4, r5, r6, r7, pc}
_021E68F0:
	cmp r2, #0x11
	bne _021E68F8
	mov r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_021E68F8:
	sub r2, r2, #7
	cmp r2, #1
	bhi _021E6946
	add r1, #0xc
	ldr r1, [r0, r1]
	mov r4, #0
	cmp r1, #0
	ble _021E6946
	ldr r7, _021E6958 ; =0x000010AC
	add r5, r4, #0
_021E690C:
	ldr r2, _021E6958 ; =0x000010AC
	add r1, r0, r5
	ldr r0, _021E6958 ; =0x000010AC
	ldr r2, [r1, r2]
	ldr r0, [r1, r0]
	add r2, r2, #1
	str r2, [r1, r7]
	cmp r0, #0x78
	blt _021E6938
	ldr r1, [r6]
	ldr r0, _021E695C ; =0x00001078
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _021E6938
	add r0, r4, #0
	bl ov00_021E67E0
	cmp r0, #0
	beq _021E6938
	bl ov00_021E62D8
	b _021E6946
_021E6938:
	ldr r0, [r6]
	ldr r1, _021E6960 ; =0x0000107C
	add r4, r4, #1
	ldr r1, [r0, r1]
	add r5, r5, #4
	cmp r4, r1
	blt _021E690C
_021E6946:
	bl ov00_021E6690
_021E694A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E694C: .word _0221A680
_021E6950: .word 0x00001090
_021E6954: .word 0x00001070
_021E6958: .word 0x000010AC
_021E695C: .word 0x00001078
_021E6960: .word 0x0000107C
	thumb_func_end ov00_021E6850

	thumb_func_start ov00_021E6964
ov00_021E6964: ; 0x021E6964
	push {r3, lr}
	ldr r0, _021E698C ; =_0221A680
	ldr r1, [r0]
	cmp r1, #0
	beq _021E6984
	ldr r0, _021E6990 ; =0x00001070
	ldr r0, [r1, r0]
	cmp r0, #7
	beq _021E697E
	cmp r0, #8
	beq _021E697E
	cmp r0, #0x10
	bne _021E6984
_021E697E:
	bl ov00_021EE490
	pop {r3, pc}
_021E6984:
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
	nop
_021E698C: .word _0221A680
_021E6990: .word 0x00001070
	thumb_func_end ov00_021E6964

	thumb_func_start ov00_021E6994
ov00_021E6994: ; 0x021E6994
	ldr r0, _021E69A0 ; =_0221A680
	mov r2, #0
	ldr r1, [r0]
	ldr r0, _021E69A4 ; =0x00001090
	str r2, [r1, r0]
	bx lr
	.balign 4, 0
_021E69A0: .word _0221A680
_021E69A4: .word 0x00001090
	thumb_func_end ov00_021E6994

	thumb_func_start ov00_021E69A8
ov00_021E69A8: ; 0x021E69A8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r4, #1
	bl sub_0203993C
	bl sub_02034084
	add r5, r0, #0
	beq _021E69DC
	bl sub_02037454
	sub r4, r0, #1
	cmp r4, #1
	bge _021E69C6
	mov r4, #1
_021E69C6:
	ldr r1, _021E6A3C ; =_0221A680
	ldr r6, _021E6A40 ; =0x000010D4
	ldr r0, [r1]
	mov r3, #1
	strh r3, [r0, r6]
	ldr r2, [r1]
	sub r0, r6, #4
	str r3, [r2, r0]
	ldr r0, [r1]
	add r1, r6, #2
	strh r3, [r0, r1]
_021E69DC:
	ldr r0, _021E6A3C ; =_0221A680
	ldr r2, [r0]
	ldr r0, _021E6A44 ; =0x00001090
	ldr r1, [r2, r0]
	cmp r1, #0
	bne _021E6A3A
	add r0, #0x14
	ldr r0, [r2, r0]
	cmp r0, #5
	bhi _021E6A18
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E69FC: ; jump table
	.short _021E6A18 - _021E69FC - 2 ; case 0
	.short _021E6A18 - _021E69FC - 2 ; case 1
	.short _021E6A08 - _021E69FC - 2 ; case 2
	.short _021E6A0C - _021E69FC - 2 ; case 3
	.short _021E6A10 - _021E69FC - 2 ; case 4
	.short _021E6A14 - _021E69FC - 2 ; case 5
_021E6A08:
	mov r1, #1
	b _021E6A22
_021E6A0C:
	mov r1, #2
	b _021E6A22
_021E6A10:
	mov r1, #3
	b _021E6A22
_021E6A14:
	mov r1, #4
	b _021E6A22
_021E6A18:
	cmp r5, #0
	bne _021E6A20
	mov r1, #4
	b _021E6A22
_021E6A20:
	mov r1, #3
_021E6A22:
	add r0, r7, #0
	add r2, r4, #0
	bl ov00_021E77F4
	ldr r0, _021E6A48 ; =ov00_021E6994
	bl ov00_021E7A1C
	ldr r0, _021E6A3C ; =_0221A680
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _021E6A44 ; =0x00001090
	str r2, [r1, r0]
_021E6A3A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6A3C: .word _0221A680
_021E6A40: .word 0x000010D4
_021E6A44: .word 0x00001090
_021E6A48: .word ov00_021E6994
	thumb_func_end ov00_021E69A8

	thumb_func_start ov00_021E6A4C
ov00_021E6A4C: ; 0x021E6A4C
	push {r3, lr}
	bl ov00_021E7A30
	ldr r1, _021E6A68 ; =_0221A680
	ldr r3, [r1]
	cmp r3, #0
	beq _021E6A66
	ldr r0, _021E6A6C ; =0x00001090
	mov r2, #0
	str r2, [r3, r0]
	ldr r1, [r1]
	sub r0, #0x10
	str r2, [r1, r0]
_021E6A66:
	pop {r3, pc}
	.balign 4, 0
_021E6A68: .word _0221A680
_021E6A6C: .word 0x00001090
	thumb_func_end ov00_021E6A4C

	thumb_func_start ov00_021E6A70
ov00_021E6A70: ; 0x021E6A70
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #0x64
	add r4, r0, #0
	bl _s32_div_f
	mov r1, #0xfa
	add r5, r0, #0
	add r0, r4, #0
	lsl r1, r1, #2
	bl _s32_div_f
	ldr r2, _021E6BC8 ; =0x00004E85
	cmp r4, r2
	bne _021E6A92
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E6A92:
	cmp r0, #0x17
	bne _021E6A9A
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E6A9A:
	add r1, r2, #7
	cmp r4, r1
	bne _021E6AA4
	mov r0, #2
	pop {r4, r5, r6, pc}
_021E6AA4:
	add r2, #9
	cmp r4, r2
	bne _021E6AAE
	mov r0, #3
	pop {r4, r5, r6, pc}
_021E6AAE:
	mov r1, #2
	lsl r1, r1, #8
	cmp r5, r1
	bne _021E6ABA
	mov r0, #4
	pop {r4, r5, r6, pc}
_021E6ABA:
	add r2, r1, #0
	sub r2, #0xc
	cmp r5, r2
	bne _021E6AC6
	mov r0, #5
	pop {r4, r5, r6, pc}
_021E6AC6:
	ldr r2, _021E6BCC ; =0x0000C79F
	cmp r4, r2
	bne _021E6AD0
	mov r0, #7
	pop {r4, r5, r6, pc}
_021E6AD0:
	sub r2, r1, #2
	cmp r5, r2
	bne _021E6ADA
	mov r0, #6
	pop {r4, r5, r6, pc}
_021E6ADA:
	sub r2, r1, #1
	cmp r5, r2
	bne _021E6AE4
	mov r0, #6
	pop {r4, r5, r6, pc}
_021E6AE4:
	add r1, r1, #1
	cmp r5, r1
	bne _021E6AEE
	mov r0, #6
	pop {r4, r5, r6, pc}
_021E6AEE:
	ldr r1, _021E6BD0 ; =0x0000CB20
	cmp r4, r1
	blt _021E6AFE
	add r1, r1, #3
	cmp r4, r1
	bgt _021E6AFE
	mov r0, #8
	pop {r4, r5, r6, pc}
_021E6AFE:
	ldr r1, _021E6BD4 ; =0x0000CB84
	cmp r4, r1
	blt _021E6B0E
	add r1, r1, #3
	cmp r4, r1
	bgt _021E6B0E
	mov r0, #8
	pop {r4, r5, r6, pc}
_021E6B0E:
	ldr r1, _021E6BD8 ; =0x0000CBE8
	cmp r4, r1
	blt _021E6B1E
	add r1, r1, #3
	cmp r4, r1
	bgt _021E6B1E
	mov r0, #8
	pop {r4, r5, r6, pc}
_021E6B1E:
	ldr r1, _021E6BDC ; =0x00013A2E
	cmp r4, r1
	bne _021E6B28
	mov r0, #9
	pop {r4, r5, r6, pc}
_021E6B28:
	cmp r0, #0x14
	bne _021E6B30
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E6B30:
	mov r1, #0x82
	lsl r1, r1, #2
	cmp r5, r1
	bne _021E6B3C
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E6B3C:
	add r2, r1, #1
	cmp r5, r2
	bne _021E6B46
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E6B46:
	add r2, r1, #2
	cmp r5, r2
	bne _021E6B50
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E6B50:
	add r2, r1, #3
	cmp r5, r2
	bne _021E6B5A
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E6B5A:
	add r2, r1, #0
	add r2, #0xa
	cmp r5, r2
	bne _021E6B66
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E6B66:
	add r2, r1, #0
	add r2, #0xb
	cmp r5, r2
	bne _021E6B72
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E6B72:
	add r1, #0xc
	cmp r5, r1
	bne _021E6B7C
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E6B7C:
	ldr r1, _021E6BE0 ; =0x00002710
	cmp r4, r1
	bge _021E6B86
	mov r0, #0xe
	pop {r4, r5, r6, pc}
_021E6B86:
	cmp r0, #0x1f
	bne _021E6B8E
	mov r0, #0xc
	pop {r4, r5, r6, pc}
_021E6B8E:
	cmp r6, #7
	bhi _021E6BB6
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E6B9E: ; jump table
	.short _021E6BAE - _021E6B9E - 2 ; case 0
	.short _021E6BAE - _021E6B9E - 2 ; case 1
	.short _021E6BAE - _021E6B9E - 2 ; case 2
	.short _021E6BB2 - _021E6B9E - 2 ; case 3
	.short _021E6BB2 - _021E6B9E - 2 ; case 4
	.short _021E6BB2 - _021E6B9E - 2 ; case 5
	.short _021E6BB2 - _021E6B9E - 2 ; case 6
	.short _021E6BBC - _021E6B9E - 2 ; case 7
_021E6BAE:
	mov r0, #0xb
	pop {r4, r5, r6, pc}
_021E6BB2:
	mov r0, #0xa
	pop {r4, r5, r6, pc}
_021E6BB6:
	bl GF_AssertFail
	b _021E6BC0
_021E6BBC:
	mov r0, #0xf
	pop {r4, r5, r6, pc}
_021E6BC0:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	nop
_021E6BC8: .word 0x00004E85
_021E6BCC: .word 0x0000C79F
_021E6BD0: .word 0x0000CB20
_021E6BD4: .word 0x0000CB84
_021E6BD8: .word 0x0000CBE8
_021E6BDC: .word 0x00013A2E
_021E6BE0: .word 0x00002710
	thumb_func_end ov00_021E6A70

	thumb_func_start ov00_021E6BE4
ov00_021E6BE4: ; 0x021E6BE4
	push {r3, lr}
	cmp r0, #0
	bne _021E6C44
	ldr r0, _021E6C60 ; =_0221A680
	ldr r2, _021E6C64 ; =0x00001070
	ldr r0, [r0]
	ldr r1, [r0, r2]
	cmp r1, #0x12
	bhi _021E6C5C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6C02: ; jump table
	.short _021E6C5C - _021E6C02 - 2 ; case 0
	.short _021E6C5C - _021E6C02 - 2 ; case 1
	.short _021E6C5C - _021E6C02 - 2 ; case 2
	.short _021E6C5C - _021E6C02 - 2 ; case 3
	.short _021E6C40 - _021E6C02 - 2 ; case 4
	.short _021E6C28 - _021E6C02 - 2 ; case 5
	.short _021E6C5C - _021E6C02 - 2 ; case 6
	.short _021E6C28 - _021E6C02 - 2 ; case 7
	.short _021E6C28 - _021E6C02 - 2 ; case 8
	.short _021E6C5C - _021E6C02 - 2 ; case 9
	.short _021E6C5C - _021E6C02 - 2 ; case 10
	.short _021E6C5C - _021E6C02 - 2 ; case 11
	.short _021E6C5C - _021E6C02 - 2 ; case 12
	.short _021E6C5C - _021E6C02 - 2 ; case 13
	.short _021E6C40 - _021E6C02 - 2 ; case 14
	.short _021E6C5C - _021E6C02 - 2 ; case 15
	.short _021E6C5C - _021E6C02 - 2 ; case 16
	.short _021E6C40 - _021E6C02 - 2 ; case 17
	.short _021E6C40 - _021E6C02 - 2 ; case 18
_021E6C28:
	add r2, #0x20
	ldr r0, [r0, r2]
	cmp r0, #0
	beq _021E6C34
	bl ov00_021E79CC
_021E6C34:
	ldr r0, _021E6C60 ; =_0221A680
	mov r2, #0x10
	ldr r1, [r0]
	ldr r0, _021E6C64 ; =0x00001070
	str r2, [r1, r0]
	b _021E6C5C
_021E6C40:
	mov r0, #1
	pop {r3, pc}
_021E6C44:
	ldr r0, _021E6C60 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E6C64 ; =0x00001070
	ldr r0, [r1, r0]
	cmp r0, #4
	beq _021E6C58
	cmp r0, #0x11
	beq _021E6C58
	cmp r0, #0x12
	bne _021E6C5C
_021E6C58:
	mov r0, #1
	pop {r3, pc}
_021E6C5C:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_021E6C60: .word _0221A680
_021E6C64: .word 0x00001070
	thumb_func_end ov00_021E6BE4

	thumb_func_start ov00_021E6C68
ov00_021E6C68: ; 0x021E6C68
	push {r3, lr}
	ldr r0, _021E6C9C ; =_0221A680
	ldr r2, [r0]
	ldr r0, _021E6CA0 ; =0x00001070
	ldr r0, [r2, r0]
	cmp r0, #0x11
	beq _021E6C7E
	cmp r0, #0x12
	beq _021E6C7E
	cmp r0, #4
	bne _021E6C96
_021E6C7E:
	ldr r0, _021E6CA0 ; =0x00001070
	mov r1, #4
	str r1, [r2, r0]
	sub r2, r1, #5
	ldr r1, _021E6C9C ; =_0221A680
	add r0, #0x28
	ldr r1, [r1]
	str r2, [r1, r0]
	bl ov00_021E7130
	mov r0, #1
	pop {r3, pc}
_021E6C96:
	mov r0, #0
	pop {r3, pc}
	nop
_021E6C9C: .word _0221A680
_021E6CA0: .word 0x00001070
	thumb_func_end ov00_021E6C68

	thumb_func_start ov00_021E6CA4
ov00_021E6CA4: ; 0x021E6CA4
	ldr r1, _021E6CB4 ; =_0221A680
	ldr r2, [r1]
	cmp r2, #0
	beq _021E6CB2
	mov r1, #0x3f
	lsl r1, r1, #6
	str r0, [r2, r1]
_021E6CB2:
	bx lr
	.balign 4, 0
_021E6CB4: .word _0221A680
	thumb_func_end ov00_021E6CA4

	thumb_func_start ov00_021E6CB8
ov00_021E6CB8: ; 0x021E6CB8
	push {r3, lr}
	bl ov00_021ED9B4
	bl ov00_021EC8D8
	bl ov00_021E6A4C
	bl ov00_021E5AE8
	pop {r3, pc}
	thumb_func_end ov00_021E6CB8

	thumb_func_start ov00_021E6CCC
ov00_021E6CCC: ; 0x021E6CCC
	push {r3, r4}
	ldr r3, _021E6CE0 ; =_0221A680
	ldr r2, _021E6CE4 ; =0x00001064
	ldr r4, [r3]
	str r0, [r4, r2]
	ldr r3, [r3]
	add r0, r2, #4
	str r1, [r3, r0]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021E6CE0: .word _0221A680
_021E6CE4: .word 0x00001064
	thumb_func_end ov00_021E6CCC

	thumb_func_start ov00_021E6CE8
ov00_021E6CE8: ; 0x021E6CE8
	push {r3, r4, r5, lr}
	ldr r0, _021E6D50 ; =_0221A680
	ldr r1, _021E6D54 ; =0x00001064
	ldr r0, [r0]
	ldr r2, [r0, r1]
	cmp r2, #0
	beq _021E6D4E
	add r1, #8
	ldr r2, [r0, r1]
	mov r1, #0x1f
	add r5, r2, #0
	and r5, r1
	mov r1, #0xc
	add r4, r5, #0
	mul r4, r1
	add r1, #0xf4
	ldr r0, [r0, r1]
	add r0, r0, r4
	bl DWC_IsBuddyFriendData
	cmp r0, #0
	beq _021E6D3E
	ldr r0, _021E6D50 ; =_0221A680
	ldr r3, _021E6D54 ; =0x00001064
	ldr r2, [r0]
	mov r0, #1
	lsl r0, r0, #8
	ldr r1, [r2, r3]
	ldr r0, [r2, r0]
	add r3, r3, #4
	ldr r2, [r2, r3]
	add r0, r0, r4
	add r3, r2, #0
	mul r3, r5
	add r1, r1, r3
	add r2, sp, #0
	bl ov00_021EFDCC
	ldr r1, _021E6D50 ; =_0221A680
	ldr r1, [r1]
	add r2, r1, r5
	ldr r1, _021E6D58 ; =0x00001044
	strb r0, [r2, r1]
_021E6D3E:
	ldr r0, _021E6D50 ; =_0221A680
	ldr r1, _021E6D5C ; =0x0000106C
	ldr r3, [r0]
	ldr r0, [r3, r1]
	add r2, r0, #1
	mov r0, #0x1f
	and r0, r2
	str r0, [r3, r1]
_021E6D4E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6D50: .word _0221A680
_021E6D54: .word 0x00001064
_021E6D58: .word 0x00001044
_021E6D5C: .word 0x0000106C
	thumb_func_end ov00_021E6CE8

	thumb_func_start ov00_021E6D60
ov00_021E6D60: ; 0x021E6D60
	ldr r3, _021E6D64 ; =ov00_021EFE78
	bx r3
	.balign 4, 0
_021E6D64: .word ov00_021EFE78
	thumb_func_end ov00_021E6D60

	thumb_func_start ov00_021E6D68
ov00_021E6D68: ; 0x021E6D68
	ldr r1, _021E6D74 ; =_0221A680
	ldr r1, [r1]
	add r1, r1, r0
	ldr r0, _021E6D78 ; =0x00001044
	ldrb r0, [r1, r0]
	bx lr
	.balign 4, 0
_021E6D74: .word _0221A680
_021E6D78: .word 0x00001044
	thumb_func_end ov00_021E6D68

	thumb_func_start ov00_021E6D7C
ov00_021E6D7C: ; 0x021E6D7C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	bl ov00_021E7314
	cmp r0, #0
	beq _021E6D92
	mov r0, #3
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021E6D92:
	ldr r1, _021E6E84 ; =_0221A680
	ldr r0, _021E6E88 ; =0x00001070
	ldr r2, [r1]
	ldr r3, [r2, r0]
	cmp r3, #4
	beq _021E6DC2
	add r3, r0, #0
	add r3, #0x5c
	ldr r3, [r2, r3]
	add r4, r3, #1
	add r3, r0, #0
	add r3, #0x5c
	str r4, [r2, r3]
	ldr r1, [r1]
	add r0, #0x5c
	ldr r0, [r1, r0]
	cmp r0, #0x78
	ble _021E6DBC
	mov r0, #2
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021E6DBC:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021E6DC2:
	bl ov00_021E7300
	ldr r2, _021E6E84 ; =_0221A680
	ldr r1, _021E6E8C ; =0x000010D8
	ldr r0, [r2]
	mov r3, #0
	str r3, [r0, r1]
	add r0, r1, #0
	ldr r3, [r2]
	mov r6, #1
	add r0, #0xd
	strb r6, [r3, r0]
	add r0, r1, #0
	ldr r3, [r2]
	sub r0, #0x44
	str r5, [r3, r0]
	sub r1, #0x5c
	ldr r0, [r2]
	cmp r7, #0
	str r4, [r0, r1]
	beq _021E6DEE
	mov r4, #2
_021E6DEE:
	ldr r0, _021E6E84 ; =_0221A680
	mov r2, #1
	ldr r1, [r0]
	ldr r0, _021E6E90 ; =0x000010A0
	cmp r5, #0
	str r2, [r1, r0]
	bge _021E6E12
	lsl r0, r4, #0x18
	mov r2, #0
	ldr r1, _021E6E94 ; =ov00_021E6ED8
	ldr r3, _021E6E98 ; =ov00_021E6FE0
	lsr r0, r0, #0x18
	str r2, [sp]
	bl ov00_021EDFBC
	mov r3, #1
	ldr r1, _021E6E84 ; =_0221A680
	b _021E6E24
_021E6E12:
	ldr r1, _021E6E9C ; =ov00_021E6FBC
	mov r2, #0
	ldr r3, _021E6E98 ; =ov00_021E6FE0
	add r0, r5, #0
	str r2, [sp]
	bl ov00_021EE054
	ldr r1, _021E6E84 ; =_0221A680
	mov r3, #2
_021E6E24:
	ldr r2, [r1]
	ldr r1, _021E6EA0 ; =0x00001074
	cmp r0, #0
	str r3, [r2, r1]
	ldr r0, _021E6EA4 ; =0x000010CC
	bne _021E6E4E
	ldr r1, _021E6E84 ; =_0221A680
	ldr r3, [r1]
	ldr r2, [r3, r0]
	add r2, r2, #1
	str r2, [r3, r0]
	ldr r1, [r1]
	ldr r0, [r1, r0]
	cmp r0, #0x78
	ble _021E6E48
	mov r0, #2
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021E6E48:
	mov r0, #1
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_021E6E4E:
	ldr r1, _021E6E84 ; =_0221A680
	mov r3, #0
	ldr r2, [r1]
	str r3, [r2, r0]
	ldr r1, [r1]
	mov r2, #5
	sub r0, #0x5c
	str r2, [r1, r0]
	ldr r0, _021E6EA8 ; =ov00_021E6428
	bl ov00_021F989C
	ldr r0, _021E6EAC ; =ov00_021E6484
	bl ov00_021F98BC
	ldr r0, _021E6EB0 ; =ov00_021E6554
	mov r1, #0
	bl ov00_021EE24C
	ldr r0, _021E6EB4 ; =ov00_021E6240
	bl ov00_021F98DC
	ldr r1, _021E6E84 ; =_0221A680
	mov r0, #0
	ldr r2, [r1]
	ldr r1, _021E6EB8 ; =0x00001078
	str r0, [r2, r1]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6E84: .word _0221A680
_021E6E88: .word 0x00001070
_021E6E8C: .word 0x000010D8
_021E6E90: .word 0x000010A0
_021E6E94: .word ov00_021E6ED8
_021E6E98: .word ov00_021E6FE0
_021E6E9C: .word ov00_021E6FBC
_021E6EA0: .word 0x00001074
_021E6EA4: .word 0x000010CC
_021E6EA8: .word ov00_021E6428
_021E6EAC: .word ov00_021E6484
_021E6EB0: .word ov00_021E6554
_021E6EB4: .word ov00_021E6240
_021E6EB8: .word 0x00001078
	thumb_func_end ov00_021E6D7C

	thumb_func_start ov00_021E6EBC
ov00_021E6EBC: ; 0x021E6EBC
	ldr r0, _021E6ED0 ; =_0221A680
	ldr r1, [r0]
	cmp r1, #0
	beq _021E6ECA
	ldr r0, _021E6ED4 ; =0x00001094
	ldr r0, [r1, r0]
	bx lr
_021E6ECA:
	mov r0, #0
	mvn r0, r0
	bx lr
	.balign 4, 0
_021E6ED0: .word _0221A680
_021E6ED4: .word 0x00001094
	thumb_func_end ov00_021E6EBC

	thumb_func_start ov00_021E6ED8
ov00_021E6ED8: ; 0x021E6ED8
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _021E6FA0 ; =_0221A680
	add r3, r0, #0
	add r0, r1, #0
	add r6, r2, #0
	mov r4, #0
	ldr r2, [r7]
	ldr r1, _021E6FA4 ; =0x000010A0
	ldr r5, [sp, #0x18]
	str r4, [r2, r1]
	cmp r3, #0
	bne _021E6F9E
	cmp r0, #0
	bne _021E6F92
	bl sub_0203993C
	bl sub_02034098
	cmp r0, #0
	beq _021E6F08
	sub r0, r4, #1
	cmp r5, r0
	bne _021E6F08
	mov r4, #1
_021E6F08:
	ldr r0, _021E6FA0 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E6FA8 ; =0x00000FBC
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _021E6F1E
	add r0, r5, #0
	blx r1
	cmp r0, #0
	bne _021E6F1E
	mov r4, #1
_021E6F1E:
	ldr r0, _021E6FA0 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E6FAC ; =0x000010E0
	ldrb r0, [r1, r0]
	cmp r0, #0
	bne _021E6F2E
	cmp r4, #0
	beq _021E6F66
_021E6F2E:
	bl ov00_021EE4FC
	ldr r1, _021E6FA0 ; =_0221A680
	ldr r2, [r1]
	ldr r1, _021E6FB0 ; =0x000010D8
	ldr r1, [r2, r1]
	mvn r1, r1
	and r0, r1
	str r0, [sp]
	bl ov00_021EE4FC
	add r4, r0, #0
	ldr r0, [sp]
	cmp r0, #0
	beq _021E6F66
	add r0, sp, #0
	bl ov00_021EE384
	ldr r0, [sp]
	eor r0, r4
	cmp r0, #1
	bne _021E6F9E
	ldr r0, _021E6FA0 ; =_0221A680
	mov r2, #6
	ldr r1, [r0]
	ldr r0, _021E6FB4 ; =0x00001070
	str r2, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_021E6F66:
	ldr r0, _021E6FA0 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E6FB8 ; =0x00001094
	str r5, [r1, r0]
	bl ov00_021EE4FC
	ldr r2, _021E6FA0 ; =_0221A680
	ldr r1, _021E6FB0 ; =0x000010D8
	ldr r3, [r2]
	str r0, [r3, r1]
	ldr r2, [r2]
	ldr r0, [r2, r1]
	cmp r0, #1
	bne _021E6F8A
	mov r0, #6
	sub r1, #0x68
	str r0, [r2, r1]
	pop {r3, r4, r5, r6, r7, pc}
_021E6F8A:
	add r0, r5, #0
	bl ov00_021E6388
	pop {r3, r4, r5, r6, r7, pc}
_021E6F92:
	cmp r6, #0
	bne _021E6F9E
	ldr r0, [r7]
	sub r2, r4, #1
	sub r1, #8
	str r2, [r0, r1]
_021E6F9E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6FA0: .word _0221A680
_021E6FA4: .word 0x000010A0
_021E6FA8: .word 0x00000FBC
_021E6FAC: .word 0x000010E0
_021E6FB0: .word 0x000010D8
_021E6FB4: .word 0x00001070
_021E6FB8: .word 0x00001094
	thumb_func_end ov00_021E6ED8

	thumb_func_start ov00_021E6FBC
ov00_021E6FBC: ; 0x021E6FBC
	push {r4, lr}
	ldr r2, _021E6FD8 ; =_0221A680
	mov r4, #0
	ldr r3, [r2]
	ldr r2, _021E6FDC ; =0x000010A0
	cmp r0, #0
	str r4, [r3, r2]
	bne _021E6FD6
	cmp r1, #0
	bne _021E6FD6
	ldr r0, [sp, #8]
	bl ov00_021E6388
_021E6FD6:
	pop {r4, pc}
	.balign 4, 0
_021E6FD8: .word _0221A680
_021E6FDC: .word 0x000010A0
	thumb_func_end ov00_021E6FBC

	thumb_func_start ov00_021E6FE0
ov00_021E6FE0: ; 0x021E6FE0
	push {r3, lr}
	ldr r2, _021E7004 ; =_0221A680
	ldr r1, _021E7008 ; =0x00001098
	ldr r3, [r2]
	str r0, [r3, r1]
	ldr r3, [r2]
	add r2, r1, #0
	sub r2, #0xe4
	ldr r2, [r3, r2]
	cmp r2, #0
	beq _021E7000
	sub r1, #0xe0
	lsl r0, r0, #0x10
	ldr r1, [r3, r1]
	lsr r0, r0, #0x10
	blx r2
_021E7000:
	pop {r3, pc}
	nop
_021E7004: .word _0221A680
_021E7008: .word 0x00001098
	thumb_func_end ov00_021E6FE0

	thumb_func_start ov00_021E700C
ov00_021E700C: ; 0x021E700C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r0, _021E7074 ; =_0221A680
	ldr r1, [r0]
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl DWC_CheckHasProfile
	cmp r0, #0
	bne _021E7034
	ldr r0, _021E7074 ; =_0221A680
	ldr r1, [r0]
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0xc
	bl DWC_CreateExchangeToken
	b _021E7044
_021E7034:
	ldr r0, _021E7074 ; =_0221A680
	ldr r1, [r0]
	mov r0, #0xf1
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	add r1, sp, #0
	bl DWC_CreateExchangeToken
_021E7044:
	mov r4, #0
	mov r7, #1
	ldr r6, _021E7074 ; =_0221A680
	add r5, r4, #0
	lsl r7, r7, #8
_021E704E:
	mov r0, #1
	ldr r1, [r6]
	lsl r0, r0, #8
	ldr r0, [r1, r0]
	add r0, r0, r5
	bl DWC_GetFriendDataType
	ldr r0, [r6]
	ldr r0, [r0, r7]
	add r0, r0, r5
	bl DWC_IsBuddyFriendData
	add r4, r4, #1
	add r5, #0xc
	cmp r4, #0x20
	blt _021E704E
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7074: .word _0221A680
	thumb_func_end ov00_021E700C

	thumb_func_start ov00_021E7078
ov00_021E7078: ; 0x021E7078
	ldr r3, _021E707C ; =ov00_021E7AA4
	bx r3
	.balign 4, 0
_021E707C: .word ov00_021E7AA4
	thumb_func_end ov00_021E7078

	thumb_func_start ov00_021E7080
ov00_021E7080: ; 0x021E7080
	ldr r0, _021E7094 ; =_0221A680
	ldr r1, [r0]
	cmp r1, #0
	beq _021E708E
	ldr r0, _021E7098 ; =0x0000109C
	ldr r0, [r1, r0]
	bx lr
_021E708E:
	mov r0, #0
	bx lr
	nop
_021E7094: .word _0221A680
_021E7098: .word 0x0000109C
	thumb_func_end ov00_021E7080

	thumb_func_start ov00_021E709C
ov00_021E709C: ; 0x021E709C
	ldr r0, _021E70B0 ; =_0221A680
	ldr r1, [r0]
	cmp r1, #0
	beq _021E70AA
	ldr r0, _021E70B4 ; =0x00001098
	ldr r0, [r1, r0]
	bx lr
_021E70AA:
	mov r0, #0
	bx lr
	nop
_021E70B0: .word _0221A680
_021E70B4: .word 0x00001098
	thumb_func_end ov00_021E709C

	thumb_func_start ov00_021E70B8
ov00_021E70B8: ; 0x021E70B8
	ldr r1, _021E70C4 ; =_0221A680
	ldr r2, [r1]
	ldr r1, _021E70C8 ; =0x0000109C
	str r0, [r2, r1]
	bx lr
	nop
_021E70C4: .word _0221A680
_021E70C8: .word 0x0000109C
	thumb_func_end ov00_021E70B8

	thumb_func_start ov00_021E70CC
ov00_021E70CC: ; 0x021E70CC
	ldr r1, _021E70D8 ; =_0221A680
	ldr r2, [r1]
	ldr r1, _021E70DC ; =0x000010D6
	strh r0, [r2, r1]
	bx lr
	nop
_021E70D8: .word _0221A680
_021E70DC: .word 0x000010D6
	thumb_func_end ov00_021E70CC

	thumb_func_start ov00_021E70E0
ov00_021E70E0: ; 0x021E70E0
	ldr r0, _021E70EC ; =_0221A680
	mov r2, #2
	ldr r1, [r0]
	ldr r0, _021E70F0 ; =0x000010E0
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_021E70EC: .word _0221A680
_021E70F0: .word 0x000010E0
	thumb_func_end ov00_021E70E0

	thumb_func_start ov00_021E70F4
ov00_021E70F4: ; 0x021E70F4
	push {r3, lr}
	ldr r0, _021E7124 ; =_0221A680
	ldr r2, [r0]
	ldr r0, _021E7128 ; =0x000010E0
	ldrb r1, [r2, r0]
	cmp r1, #0
	bne _021E710E
	mov r1, #1
	strb r1, [r2, r0]
	ldr r0, _021E712C ; =ov00_021E70E0
	mov r1, #0
	bl ov00_021F12F0
_021E710E:
	ldr r0, _021E7124 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E7128 ; =0x000010E0
	ldrb r0, [r1, r0]
	cmp r0, #2
	bne _021E711E
	mov r0, #1
	pop {r3, pc}
_021E711E:
	mov r0, #0
	pop {r3, pc}
	nop
_021E7124: .word _0221A680
_021E7128: .word 0x000010E0
_021E712C: .word ov00_021E70E0
	thumb_func_end ov00_021E70F4

	thumb_func_start ov00_021E7130
ov00_021E7130: ; 0x021E7130
	ldr r0, _021E713C ; =_0221A680
	mov r2, #0
	ldr r1, [r0]
	ldr r0, _021E7140 ; =0x000010E0
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_021E713C: .word _0221A680
_021E7140: .word 0x000010E0
	thumb_func_end ov00_021E7130

	thumb_func_start ov00_021E7144
ov00_021E7144: ; 0x021E7144
	ldr r3, _021E7148 ; =ov00_021EE448
	bx r3
	.balign 4, 0
_021E7148: .word ov00_021EE448
	thumb_func_end ov00_021E7144

	thumb_func_start ov00_021E714C
ov00_021E714C: ; 0x021E714C
	push {r4, lr}
	cmp r0, #0
	beq _021E71B4
	ldr r2, _021E7208 ; =_0221A680
	ldr r0, _021E720C ; =0x00001088
	ldr r3, [r2]
	mov r4, #0xb
	str r4, [r3, r0]
	ldr r2, [r2]
	sub r0, #0xf0
	ldr r0, [r2, r0]
	cmp r0, #0
	bne _021E7204
	add r0, r1, #0
	ldr r1, _021E7210 ; =0x0000F020
	bl AllocFromHeap
	ldr r2, _021E7208 ; =_0221A680
	ldr r1, _021E7214 ; =0x00000F98
	ldr r3, [r2]
	str r0, [r3, r1]
	ldr r0, [r2]
	mov r2, #0
	ldr r0, [r0, r1]
	mov r1, #0x1f
	add r0, #0x1f
	bic r0, r1
	mov r1, #0xf
	lsl r1, r1, #0xc
	bl NNS_FndCreateExpHeapEx
	ldr r2, _021E7208 ; =_0221A680
	ldr r1, _021E7218 ; =0x00000F9C
	ldr r3, [r2]
	str r0, [r3, r1]
	ldr r0, [r2]
	ldr r0, [r0, r1]
	mov r1, #0x10
	bl NNS_FndSetGroupIDForExpHeap
	ldr r0, _021E7208 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E7218 ; =0x00000F9C
	ldr r0, [r1, r0]
	bl NNS_FndGetTotalFreeSizeForExpHeap
	ldr r1, _021E7208 ; =_0221A680
	ldr r2, [r1]
	mov r1, #0xfa
	lsl r1, r1, #4
	str r0, [r2, r1]
	pop {r4, pc}
_021E71B4:
	ldr r2, _021E7208 ; =_0221A680
	ldr r0, _021E721C ; =0x00001084
	ldr r4, [r2]
	add r1, r0, #4
	ldr r3, [r4, r0]
	str r3, [r4, r1]
	add r1, r0, #0
	ldr r4, [r2]
	sub r1, #0xec
	ldr r1, [r4, r1]
	cmp r1, #0
	beq _021E7204
	sub r0, #0xe8
	ldr r0, [r4, r0]
	bl NNS_FndGetTotalFreeSizeForExpHeap
	mov r1, #0xfa
	lsl r1, r1, #4
	ldr r2, [r4, r1]
	cmp r2, r0
	beq _021E71E6
	mov r0, #1
	bl sub_02039AD8
	pop {r4, pc}
_021E71E6:
	sub r0, r1, #4
	ldr r0, [r4, r0]
	bl NNS_FndDestroyExpHeap
	ldr r0, _021E7208 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E7214 ; =0x00000F98
	ldr r0, [r1, r0]
	bl Heap_Free
	ldr r0, _021E7208 ; =_0221A680
	mov r2, #0
	ldr r1, [r0]
	ldr r0, _021E7214 ; =0x00000F98
	str r2, [r1, r0]
_021E7204:
	pop {r4, pc}
	nop
_021E7208: .word _0221A680
_021E720C: .word 0x00001088
_021E7210: .word 0x0000F020
_021E7214: .word 0x00000F98
_021E7218: .word 0x00000F9C
_021E721C: .word 0x00001084
	thumb_func_end ov00_021E714C

	thumb_func_start ov00_021E7220
ov00_021E7220: ; 0x021E7220
	ldr r1, _021E722C ; =_0221A680
	ldr r2, [r1]
	ldr r1, _021E7230 ; =0x000010E5
	strb r0, [r2, r1]
	bx lr
	nop
_021E722C: .word _0221A680
_021E7230: .word 0x000010E5
	thumb_func_end ov00_021E7220

	thumb_func_start ov00_021E7234
ov00_021E7234: ; 0x021E7234
	push {r4, lr}
	ldr r1, _021E7274 ; =_0221A680
	lsl r4, r0, #2
	ldr r3, [r1]
	mov r1, #0x3e
	add r2, r3, r4
	lsl r1, r1, #6
	ldr r1, [r2, r1]
	cmp r1, #0
	beq _021E7270
	add r2, r3, r0
	ldr r0, _021E7278 ; =0x000010E1
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _021E725A
	add r0, r1, #0
	bl Heap_Free
	b _021E7262
_021E725A:
	mov r0, #0
	add r2, r0, #0
	bl ov00_021E6638
_021E7262:
	ldr r0, _021E7274 ; =_0221A680
	mov r2, #0
	ldr r0, [r0]
	add r1, r0, r4
	mov r0, #0x3e
	lsl r0, r0, #6
	str r2, [r1, r0]
_021E7270:
	pop {r4, pc}
	nop
_021E7274: .word _0221A680
_021E7278: .word 0x000010E1
	thumb_func_end ov00_021E7234

	thumb_func_start ov00_021E727C
ov00_021E727C: ; 0x021E727C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov00_021E7234
	ldr r0, _021E72F4 ; =_0221A680
	lsl r4, r5, #2
	ldr r2, [r0]
	mov r0, #0x3e
	add r1, r2, r4
	lsl r0, r0, #6
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _021E72F0
	ldr r1, _021E72F8 ; =0x00001088
	ldr r0, [r2, r1]
	cmp r0, #0xb
	bne _021E72B4
	sub r1, #0x68
	bl AllocFromHeap
	ldr r2, _021E72F4 ; =_0221A680
	ldr r1, [r2]
	add r3, r1, r4
	mov r1, #0x3e
	lsl r1, r1, #6
	str r0, [r3, r1]
	mov r3, #1
	b _021E72CC
_021E72B4:
	mov r0, #0
	sub r1, #0x88
	mov r2, #0x20
	bl ov00_021E65D4
	ldr r2, _021E72F4 ; =_0221A680
	ldr r1, [r2]
	add r3, r1, r4
	mov r1, #0x3e
	lsl r1, r1, #6
	str r0, [r3, r1]
	mov r3, #0
_021E72CC:
	ldr r0, [r2]
	mov r2, #0x3e
	add r1, r0, r5
	ldr r0, _021E72FC ; =0x000010E1
	lsl r2, r2, #6
	strb r3, [r1, r0]
	ldr r1, _021E72F4 ; =_0221A680
	lsl r0, r5, #0x18
	ldr r1, [r1]
	mov r3, #0x1f
	add r1, r1, r4
	ldr r1, [r1, r2]
	lsr r0, r0, #0x18
	add r1, #0x1f
	bic r1, r3
	add r2, #0x80
	bl ov00_021F9850
_021E72F0:
	pop {r3, r4, r5, pc}
	nop
_021E72F4: .word _0221A680
_021E72F8: .word 0x00001088
_021E72FC: .word 0x000010E1
	thumb_func_end ov00_021E727C

	thumb_func_start ov00_021E7300
ov00_021E7300: ; 0x021E7300
	push {r4, lr}
	mov r4, #0
_021E7304:
	add r0, r4, #0
	bl ov00_021E7234
	add r4, r4, #1
	cmp r4, #4
	blt _021E7304
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov00_021E7300

	thumb_func_start ov00_021E7314
ov00_021E7314: ; 0x021E7314
	ldr r0, _021E7320 ; =_0221A680
	ldr r1, [r0]
	ldr r0, _021E7324 ; =0x000010E6
	ldrb r0, [r1, r0]
	bx lr
	nop
_021E7320: .word _0221A680
_021E7324: .word 0x000010E6
	thumb_func_end ov00_021E7314

	thumb_func_start ov00_021E7328
ov00_021E7328: ; 0x021E7328
	ldr r0, _021E7334 ; =_0221A680
	mov r2, #0
	ldr r1, [r0]
	ldr r0, _021E7338 ; =0x000010E6
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_021E7334: .word _0221A680
_021E7338: .word 0x000010E6
	thumb_func_end ov00_021E7328

	thumb_func_start ov00_021E733C
ov00_021E733C: ; 0x021E733C
	push {r3, r4, r5, lr}
	bl MIC_Init
	bl PM_Init
	mov r0, #1
	bl PM_SetAmp
	mov r0, #3
	bl PM_SetAmpGain
	ldr r0, _021E73CC ; =_0221A684
	mov r2, #0
	ldr r1, [r0, #4]
	ldr r3, _021E73D0 ; =0x00001A78
	add r5, r2, #0
	str r2, [r1, r3]
	add r1, r3, #0
	ldr r4, [r0, #4]
	add r1, #0xc
	str r2, [r4, r1]
	ldr r4, [r0, #4]
	add r1, r3, #4
	str r2, [r4, r1]
	add r1, r3, #0
	ldr r4, [r0, #4]
	add r1, #8
	str r2, [r4, r1]
	ldr r1, [r0, #4]
	add r3, #0x10
	str r2, [r1, r3]
	ldr r3, _021E73D4 ; =0x00001A8C
	add r1, r2, #0
_021E737E:
	ldr r4, [r0, #4]
	add r2, r2, #1
	add r4, r4, r5
	add r5, r5, #2
	strh r1, [r4, r3]
	cmp r2, #0x10
	blt _021E737E
	ldr r0, _021E73CC ; =_0221A684
	ldr r2, [r0, #4]
	ldr r0, _021E73D8 ; =0x00001AAC
	str r1, [r2, r0]
	mov r0, #1
	bl VCT_EnableVAD
	bl NNS_SndInit
	ldr r0, _021E73CC ; =_0221A684
	ldr r1, [r0, #4]
	ldr r0, _021E73DC ; =0x000019F8
	add r0, r1, r0
	bl NNS_SndStrmInit
	ldr r1, _021E73CC ; =_0221A684
	mov r0, #0
	ldr r2, [r1, #4]
	ldr r1, _021E73E0 ; =0x0000110C
	add r1, r2, r1
	mov r2, #0x22
	lsl r2, r2, #6
	bl MIi_CpuClearFast
	ldr r0, _021E73CC ; =_0221A684
	mov r1, #0
	str r1, [r0]
	mov r0, #1
	bl VCT_EnableEchoCancel
	pop {r3, r4, r5, pc}
	nop
_021E73CC: .word _0221A684
_021E73D0: .word 0x00001A78
_021E73D4: .word 0x00001A8C
_021E73D8: .word 0x00001AAC
_021E73DC: .word 0x000019F8
_021E73E0: .word 0x0000110C
	thumb_func_end ov00_021E733C

	thumb_func_start ov00_021E73E4
ov00_021E73E4: ; 0x021E73E4
	bx lr
	.balign 4, 0
	thumb_func_end ov00_021E73E4

	thumb_func_start ov00_021E73E8
ov00_021E73E8: ; 0x021E73E8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	ldr r7, [sp, #0x1c]
	cmp r0, #0
	bne _021E7410
	mov r7, #0
	cmp r5, #0
	bls _021E748A
_021E73FC:
	ldr r0, [r4]
	mov r1, #0
	add r2, r6, #0
	bl MI_CpuFill8
	add r7, r7, #1
	add r4, r4, #4
	cmp r7, r5
	blo _021E73FC
	pop {r3, r4, r5, r6, r7, pc}
_021E7410:
	ldr r0, _021E748C ; =_0221A684
	ldr r1, _021E7490 ; =0x00001A59
	ldr r0, [r0, #4]
	ldrb r2, [r0, r1]
	cmp r2, #0
	beq _021E7432
	add r1, r1, #3
	add r0, r0, r1
	ldr r1, _021E7494 ; =ov00_021E73E4
	mov r2, #0
	bl MIC_StartAutoSamplingAsync
	ldr r1, _021E748C ; =_0221A684
	mov r0, #0
	ldr r2, [r1, #4]
	ldr r1, _021E7490 ; =0x00001A59
	strb r0, [r2, r1]
_021E7432:
	bl MIC_GetLastSamplingAddress
	sub r0, r0, r7
	cmp r0, r6
	bhs _021E743E
	add r7, r7, r6
_021E743E:
	ldr r0, _021E7498 ; =0x027FFFA8
	ldrh r1, [r0]
	mov r0, #2
	lsl r0, r0, #0xe
	and r0, r1
	asr r0, r0, #0xf
	beq _021E7454
	ldr r0, _021E748C ; =_0221A684
	ldr r1, [r0, #4]
	ldr r0, _021E749C ; =0x0000110C
	add r7, r1, r0
_021E7454:
	ldr r0, _021E748C ; =_0221A684
	ldr r1, [r0, #4]
	ldr r0, _021E74A0 ; =0x000019F0
	ldr r0, [r1, r0]
	cmp r0, #0
	bne _021E7468
	add r0, r7, #0
	add r1, r6, #0
	bl VCT_SendAudio
_021E7468:
	mov r7, #0
	cmp r5, #0
	bls _021E7480
_021E746E:
	ldr r0, [r4]
	add r1, r6, #0
	mov r2, #0
	bl VCT_ReceiveAudio
	add r7, r7, #1
	add r4, r4, #4
	cmp r7, r5
	blo _021E746E
_021E7480:
	ldr r0, _021E748C ; =_0221A684
	mov r2, #2
	ldr r1, [r0, #4]
	ldr r0, _021E74A4 ; =0x00001A58
	strb r2, [r1, r0]
_021E748A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E748C: .word _0221A684
_021E7490: .word 0x00001A59
_021E7494: .word ov00_021E73E4
_021E7498: .word 0x027FFFA8
_021E749C: .word 0x0000110C
_021E74A0: .word 0x000019F0
_021E74A4: .word 0x00001A58
	thumb_func_end ov00_021E73E8

	thumb_func_start ov00_021E74A8
ov00_021E74A8: ; 0x021E74A8
	push {r4, lr}
	ldr r1, _021E74F4 ; =_0221A684
	ldr r2, [r1, #4]
	ldr r1, _021E74F8 ; =0x00001A54
	ldr r4, [r2, r1]
	cmp r4, #0
	bne _021E74CA
	bl VCT_CreateSession
	add r4, r0, #0
	bne _021E74C2
	mov r0, #0
	pop {r4, pc}
_021E74C2:
	mov r1, #0
	bl VCT_Request
	b _021E74D2
_021E74CA:
	add r0, r4, #0
	mov r1, #0
	bl VCT_Request
_021E74D2:
	cmp r0, #0
	beq _021E74E8
	add r0, r4, #0
	bl VCT_DeleteSession
	ldr r1, _021E74F4 ; =_0221A684
	mov r0, #0
	ldr r2, [r1, #4]
	ldr r1, _021E74F8 ; =0x00001A54
	str r0, [r2, r1]
	pop {r4, pc}
_021E74E8:
	ldr r0, _021E74F4 ; =_0221A684
	ldr r1, [r0, #4]
	ldr r0, _021E74F8 ; =0x00001A54
	str r4, [r1, r0]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021E74F4: .word _0221A684
_021E74F8: .word 0x00001A54
	thumb_func_end ov00_021E74A8

	thumb_func_start ov00_021E74FC
ov00_021E74FC: ; 0x021E74FC
	push {r3, lr}
	ldr r0, _021E753C ; =_0221A684
	ldr r1, [r0, #4]
	ldr r0, _021E7540 ; =0x00001A54
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021E7536
	ldr r1, [r0, #0xc]
	cmp r1, #4
	bne _021E7536
	mov r1, #0
	bl VCT_Response
	cmp r0, #0
	beq _021E751E
	mov r0, #0
	pop {r3, pc}
_021E751E:
	ldr r0, _021E753C ; =_0221A684
	ldr r1, [r0, #4]
	ldr r0, _021E7540 ; =0x00001A54
	ldr r0, [r1, r0]
	bl VCT_StartStreaming
	cmp r0, #0
	beq _021E7532
	mov r0, #1
	pop {r3, pc}
_021E7532:
	mov r0, #0
	pop {r3, pc}
_021E7536:
	mov r0, #0
	pop {r3, pc}
	nop
_021E753C: .word _0221A684
_021E7540: .word 0x00001A54
	thumb_func_end ov00_021E74FC

	thumb_func_start ov00_021E7544
ov00_021E7544: ; 0x021E7544
	push {r3, lr}
	cmp r1, #7
	beq _021E755C
	cmp r1, #9
	beq _021E7554
	cmp r1, #0xc
	beq _021E7564
	pop {r3, pc}
_021E7554:
	add r0, r2, #0
	bl ov00_021E7638
	pop {r3, pc}
_021E755C:
	add r0, r2, #0
	bl VCT_StartStreaming
	pop {r3, pc}
_021E7564:
	add r0, r2, #0
	bl ov00_021E7638
	pop {r3, pc}
	thumb_func_end ov00_021E7544

	thumb_func_start ov00_021E756C
ov00_021E756C: ; 0x021E756C
	push {r4, lr}
	add r4, r2, #0
	cmp r1, #0xc
	bhi _021E7624
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E7580: ; jump table
	.short _021E7624 - _021E7580 - 2 ; case 0
	.short _021E759A - _021E7580 - 2 ; case 1
	.short _021E7616 - _021E7580 - 2 ; case 2
	.short _021E761E - _021E7580 - 2 ; case 3
	.short _021E75DA - _021E7580 - 2 ; case 4
	.short _021E7624 - _021E7580 - 2 ; case 5
	.short _021E7624 - _021E7580 - 2 ; case 6
	.short _021E75EA - _021E7580 - 2 ; case 7
	.short _021E75BA - _021E7580 - 2 ; case 8
	.short _021E75CE - _021E7580 - 2 ; case 9
	.short _021E7624 - _021E7580 - 2 ; case 10
	.short _021E761E - _021E7580 - 2 ; case 11
	.short _021E761E - _021E7580 - 2 ; case 12
_021E759A:
	ldr r0, _021E7628 ; =_0221A684
	ldr r2, [r0, #4]
	ldr r0, _021E762C ; =0x00001A54
	ldr r1, [r2, r0]
	cmp r1, #0
	beq _021E75B6
	add r0, r4, #0
	mov r1, #3
	bl VCT_Response
	add r0, r4, #0
	bl VCT_DeleteSession
	pop {r4, pc}
_021E75B6:
	str r4, [r2, r0]
	pop {r4, pc}
_021E75BA:
	add r0, r4, #0
	mov r1, #0
	bl VCT_Response
	add r0, r4, #0
	bl ov00_021E7638
	bl ov00_021E6A4C
	pop {r4, pc}
_021E75CE:
	add r0, r4, #0
	bl ov00_021E7638
	bl ov00_021E6A4C
	pop {r4, pc}
_021E75DA:
	add r0, r4, #0
	mov r1, #4
	bl VCT_Response
	add r0, r4, #0
	bl ov00_021E7638
	pop {r4, pc}
_021E75EA:
	ldr r0, _021E7628 ; =_0221A684
	ldr r2, [r4]
	ldr r1, [r0, #4]
	ldr r0, _021E7630 ; =0x000019E8
	ldr r0, [r1, r0]
	cmp r2, r0
	beq _021E7600
	add r0, r4, #0
	bl ov00_021E7638
	pop {r4, pc}
_021E7600:
	add r0, r4, #0
	bl VCT_StartStreaming
	cmp r0, #0
	beq _021E7624
	ldr r0, _021E7628 ; =_0221A684
	mov r2, #2
	ldr r1, [r0, #4]
	ldr r0, _021E7634 ; =0x000019EC
	str r2, [r1, r0]
	pop {r4, pc}
_021E7616:
	add r0, r4, #0
	bl ov00_021E7638
	pop {r4, pc}
_021E761E:
	add r0, r4, #0
	bl ov00_021E7638
_021E7624:
	pop {r4, pc}
	nop
_021E7628: .word _0221A684
_021E762C: .word 0x00001A54
_021E7630: .word 0x000019E8
_021E7634: .word 0x000019EC
	thumb_func_end ov00_021E756C

	thumb_func_start ov00_021E7638
ov00_021E7638: ; 0x021E7638
	push {r4, lr}
	add r4, r0, #0
	bl VCT_StopStreaming
	add r0, r4, #0
	bl VCT_DeleteSession
	ldr r0, _021E7654 ; =_0221A684
	mov r2, #0
	ldr r1, [r0, #4]
	ldr r0, _021E7658 ; =0x00001A54
	str r2, [r1, r0]
	pop {r4, pc}
	nop
_021E7654: .word _0221A684
_021E7658: .word 0x00001A54
	thumb_func_end ov00_021E7638

	thumb_func_start ov00_021E765C
ov00_021E765C: ; 0x021E765C
	push {r4, r5, r6, lr}
	bl OS_GetTick
	add r4, r0, #0
	ldr r0, _021E778C ; =_0221A684
	add r5, r1, #0
	ldr r0, [r0, #8]
	sub r1, r4, r0
	mov r0, #0xfa
	lsl r0, r0, #8
	mul r0, r1
	ldr r1, _021E7790 ; =0x000082EA
	bl _u32_div_f
	ldr r1, _021E778C ; =_0221A684
	ldr r3, _021E7794 ; =0x0000411A
	ldr r2, [r1]
	sub r0, r0, r3
	add r2, r2, r0
	ldr r0, _021E7798 ; =0xFFFFD8F0
	str r2, [r1]
	cmp r2, r0
	bge _021E768E
	mov r0, #0
	str r0, [r1]
_021E768E:
	ldr r0, _021E778C ; =_0221A684
	str r4, [r0, #8]
	str r5, [r0, #0xc]
	bl VCT_Main
	ldr r4, _021E778C ; =_0221A684
	ldr r0, _021E7794 ; =0x0000411A
	ldr r1, [r4]
	cmp r1, r0
	blt _021E76B4
	add r6, r0, #0
	add r5, r0, #0
_021E76A6:
	bl VCT_Main
	ldr r0, [r4]
	sub r0, r0, r6
	str r0, [r4]
	cmp r0, r5
	bge _021E76A6
_021E76B4:
	ldr r0, _021E778C ; =_0221A684
	ldr r2, [r0, #4]
	mov r0, #0x6a
	lsl r0, r0, #6
	ldr r1, [r2, r0]
	cmp r1, #0
	beq _021E7708
	sub r0, r0, #4
	ldr r0, [r2, r0]
	cmp r0, #3
	bhi _021E76FC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E76D6: ; jump table
	.short _021E76DE - _021E76D6 - 2 ; case 0
	.short _021E76E6 - _021E76D6 - 2 ; case 1
	.short _021E76EE - _021E76D6 - 2 ; case 2
	.short _021E76F6 - _021E76D6 - 2 ; case 3
_021E76DE:
	mov r0, #3
	bl PM_SetAmpGain
	b _021E76FC
_021E76E6:
	mov r0, #2
	bl PM_SetAmpGain
	b _021E76FC
_021E76EE:
	mov r0, #1
	bl PM_SetAmpGain
	b _021E76FC
_021E76F6:
	mov r0, #0
	bl PM_SetAmpGain
_021E76FC:
	ldr r0, _021E778C ; =_0221A684
	mov r2, #0
	ldr r1, [r0, #4]
	mov r0, #0x6a
	lsl r0, r0, #6
	str r2, [r1, r0]
_021E7708:
	ldr r3, _021E778C ; =_0221A684
	ldr r2, _021E779C ; =0x000019E8
	ldr r0, [r3, #4]
	ldr r1, [r0, r2]
	cmp r1, #3
	beq _021E7788
	add r1, r2, #4
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _021E7724
	cmp r1, #1
	beq _021E7768
	cmp r1, #2
	pop {r4, r5, r6, pc}
_021E7724:
	bl ov00_021E6964
	cmp r0, #0
	bne _021E774A
	mov r0, #1
	bl ov00_021E74A8
	cmp r0, #0
	beq _021E7788
	ldr r1, _021E778C ; =_0221A684
	ldr r0, _021E77A0 ; =0x000019EC
	ldr r2, [r1, #4]
	mov r3, #1
	str r3, [r2, r0]
	ldr r1, [r1, #4]
	mov r2, #0x3c
	add r0, #0x6e
	strh r2, [r1, r0]
	pop {r4, r5, r6, pc}
_021E774A:
	bl ov00_021E6964
	cmp r0, #1
	bne _021E7788
	mov r0, #0
	bl ov00_021E74FC
	cmp r0, #0
	beq _021E7788
	ldr r0, _021E778C ; =_0221A684
	mov r2, #2
	ldr r1, [r0, #4]
	ldr r0, _021E77A0 ; =0x000019EC
	str r2, [r1, r0]
	pop {r4, r5, r6, pc}
_021E7768:
	add r1, r2, #0
	add r1, #0x72
	ldrh r1, [r0, r1]
	sub r4, r1, #1
	add r1, r2, #0
	add r1, #0x72
	strh r4, [r0, r1]
	add r0, r2, #0
	ldr r3, [r3, #4]
	add r0, #0x72
	ldrh r0, [r3, r0]
	cmp r0, #0
	bne _021E7788
	mov r1, #0
	add r0, r2, #4
	str r1, [r3, r0]
_021E7788:
	pop {r4, r5, r6, pc}
	nop
_021E778C: .word _0221A684
_021E7790: .word 0x000082EA
_021E7794: .word 0x0000411A
_021E7798: .word 0xFFFFD8F0
_021E779C: .word 0x000019E8
_021E77A0: .word 0x000019EC
	thumb_func_end ov00_021E765C

	thumb_func_start ov00_021E77A4
ov00_021E77A4: ; 0x021E77A4
	push {r3, lr}
	ldr r3, _021E77C8 ; =_0221A684
	ldr r3, [r3, #4]
	cmp r3, #0
	bne _021E77B2
	mov r0, #0
	pop {r3, pc}
_021E77B2:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl VCT_HandleData
	cmp r0, #0
	beq _021E77C2
	mov r0, #1
	pop {r3, pc}
_021E77C2:
	mov r0, #0
	pop {r3, pc}
	nop
_021E77C8: .word _0221A684
	thumb_func_end ov00_021E77A4

	thumb_func_start ov00_021E77CC
ov00_021E77CC: ; 0x021E77CC
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r4, #0x20
	add r5, r0, #0
	add r6, r1, #0
	add r0, r3, #0
	add r1, r4, #0
	bl AllocFromHeap
	str r0, [r5]
	mov r1, #0
	add r2, r4, #0
	bl MI_CpuFill8
	ldr r1, [r5]
	mov r0, #0x1f
	add r1, #0x1f
	bic r1, r0
	str r1, [r6]
	pop {r4, r5, r6, pc}
	thumb_func_end ov00_021E77CC

	thumb_func_start ov00_021E77F4
ov00_021E77F4: ; 0x021E77F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	add r6, r1, #0
	add r0, sp, #0x14
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	ldr r0, _021E797C ; =_0221A684
	add r4, r2, #0
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _021E7858
	str r1, [sp, #0x10]
	ldr r1, _021E7980 ; =_0221A688
	ldr r2, _021E7984 ; =0x00001AB0
	add r0, sp, #0x10
	add r3, r5, #0
	bl ov00_021E77CC
	ldr r0, _021E797C ; =_0221A684
	mov r2, #0x22
	ldr r3, [sp, #0x10]
	ldr r1, [r0, #4]
	lsl r2, r2, #6
	str r3, [r1, r2]
	ldr r1, [r0, #4]
	add r0, r2, #0
	add r0, #8
	add r2, r2, #4
	add r0, r1, r0
	add r1, r1, r2
	mov r2, #0x8f
	lsl r2, r2, #6
	mul r2, r4
	add r2, #0x20
	add r3, r5, #0
	bl ov00_021E77CC
	ldr r1, _021E797C ; =_0221A684
	ldr r0, _021E7988 ; =0x000019F4
	ldr r2, [r1, #4]
	str r5, [r2, r0]
	ldr r1, [r1, #4]
	mov r2, #0
	sub r0, #0x68
	str r2, [r1, r0]
	bl ov00_021E733C
_021E7858:
	ldr r3, _021E797C ; =_0221A684
	mov r5, #0x22
	ldr r0, [r3, #4]
	ldr r2, _021E798C ; =0x00001A5C
	mov r1, #3
	str r1, [r0, r2]
	ldr r1, [r3, #4]
	add r0, r2, #4
	str r1, [r1, r0]
	add r0, r2, #0
	ldr r1, [r3, #4]
	lsl r5, r5, #6
	add r0, #8
	str r5, [r1, r0]
	mov r5, #0x41
	add r0, r2, #0
	ldr r1, [r3, #4]
	lsl r5, r5, #6
	add r0, #0xc
	str r5, [r1, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	mov r1, #1
	add r0, #0x10
	str r1, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	mov r7, #0
	add r0, #0x14
	str r7, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x18
	str r7, [r5, r0]
	sub r0, r2, #3
	ldr r5, [r3, #4]
	sub r2, #0x64
	strb r1, [r5, r0]
	ldr r0, [r3, #4]
	add r0, r0, r2
	add r2, sp, #0x14
	bl NNS_SndStrmAllocChannel
	ldr r0, _021E797C ; =_0221A684
	ldr r1, [r0, #4]
	ldr r0, _021E7990 ; =0x000019F8
	add r0, r1, r0
	add r1, r7, #0
	bl NNS_SndStrmSetVolume
	ldr r0, _021E797C ; =_0221A684
	ldr r3, _021E7994 ; =0x0000088C
	ldr r2, [r0, #4]
	mov r0, #0x41
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, _021E7998 ; =ov00_021E73E8
	mov r1, #1
	str r0, [sp, #8]
	ldr r0, _021E7990 ; =0x000019F8
	str r2, [sp, #0xc]
	add r0, r2, r0
	add r2, r2, r3
	sub r3, #0xc
	bl NNS_SndStrmSetup
	ldr r1, _021E797C ; =_0221A684
	ldr r0, _021E799C ; =0x000019EC
	ldr r2, [r1, #4]
	add r3, r7, #0
	str r3, [r2, r0]
	ldr r1, [r1, #4]
	add r0, #0x68
	str r3, [r1, r0]
	bl sub_0203993C
	bl sub_02034084
	cmp r0, #0
	bne _021E7900
	mov r0, #1
	str r0, [sp, #0x20]
	b _021E7904
_021E7900:
	mov r0, #3
	str r0, [sp, #0x20]
_021E7904:
	ldr r1, _021E797C ; =_0221A684
	ldr r3, [sp, #0x20]
	ldr r2, [r1, #4]
	ldr r0, _021E79A0 ; =0x000019E8
	str r3, [r2, r0]
	ldr r1, [r1, #4]
	sub r0, #0x58
	add r0, r1, r0
	str r0, [sp, #0x18]
	str r4, [sp, #0x1c]
	bl ov00_021EE490
	add r1, sp, #0x10
	strb r0, [r1, #0x14]
	mov r0, #0
	ldrb r1, [r1, #0x14]
	mvn r0, r0
	cmp r1, r0
	bne _021E792E
	bl GF_AssertFail
_021E792E:
	ldr r0, _021E797C ; =_0221A684
	ldr r1, _021E79A0 ; =0x000019E8
	ldr r0, [r0, #4]
	ldr r1, [r0, r1]
	cmp r1, #3
	bne _021E7940
	ldr r1, _021E79A4 ; =ov00_021E7544
	str r1, [sp, #0x30]
	b _021E7944
_021E7940:
	ldr r1, _021E79A8 ; =ov00_021E756C
	str r1, [sp, #0x30]
_021E7944:
	mov r1, #0
	str r1, [sp, #0x34]
	ldr r1, _021E79AC ; =0x00000884
	ldr r0, [r0, r1]
	str r0, [sp, #0x28]
	mov r0, #0x8f
	lsl r0, r0, #6
	mul r0, r4
	add r0, #0x20
	str r0, [sp, #0x2c]
	add r0, sp, #0x18
	bl VCT_Init
	ldr r0, _021E797C ; =_0221A684
	mov r2, #0
	ldr r1, [r0, #4]
	ldr r0, _021E79B0 ; =0x000019F0
	str r2, [r1, r0]
	add r0, r6, #0
	bl VCT_SetCodec
	bl ov00_021E79B4
	mov r0, #1
	bl VCT_EnableEchoCancel
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E797C: .word _0221A684
_021E7980: .word _0221A688
_021E7984: .word 0x00001AB0
_021E7988: .word 0x000019F4
_021E798C: .word 0x00001A5C
_021E7990: .word 0x000019F8
_021E7994: .word 0x0000088C
_021E7998: .word ov00_021E73E8
_021E799C: .word 0x000019EC
_021E79A0: .word 0x000019E8
_021E79A4: .word ov00_021E7544
_021E79A8: .word ov00_021E756C
_021E79AC: .word 0x00000884
_021E79B0: .word 0x000019F0
	thumb_func_end ov00_021E77F4

	thumb_func_start ov00_021E79B4
ov00_021E79B4: ; 0x021E79B4
	ldr r0, _021E79C0 ; =_0221A684
	ldr r3, _021E79C4 ; =NNS_SndStrmStart
	ldr r1, [r0, #4]
	ldr r0, _021E79C8 ; =0x000019F8
	add r0, r1, r0
	bx r3
	.balign 4, 0
_021E79C0: .word _0221A684
_021E79C4: .word NNS_SndStrmStart
_021E79C8: .word 0x000019F8
	thumb_func_end ov00_021E79B4

	thumb_func_start ov00_021E79CC
ov00_021E79CC: ; 0x021E79CC
	push {r3, lr}
	ldr r0, _021E7A14 ; =_0221A684
	ldr r1, _021E7A18 ; =0x00001A54
	ldr r2, [r0, #4]
	ldr r0, [r2, r1]
	cmp r0, #0
	beq _021E79E2
	sub r1, #0x68
	ldr r1, [r2, r1]
	cmp r1, #0
	bne _021E79E8
_021E79E2:
	bl ov00_021E6A4C
	pop {r3, pc}
_021E79E8:
	cmp r1, #1
	bne _021E79FC
	mov r1, #2
	bl VCT_Request
	cmp r0, #0
	beq _021E79FC
	bl ov00_021E6A4C
	pop {r3, pc}
_021E79FC:
	ldr r0, _021E7A14 ; =_0221A684
	ldr r1, [r0, #4]
	ldr r0, _021E7A18 ; =0x00001A54
	ldr r0, [r1, r0]
	mov r1, #1
	bl VCT_Request
	cmp r0, #0
	beq _021E7A12
	bl ov00_021E6A4C
_021E7A12:
	pop {r3, pc}
	.balign 4, 0
_021E7A14: .word _0221A684
_021E7A18: .word 0x00001A54
	thumb_func_end ov00_021E79CC

	thumb_func_start ov00_021E7A1C
ov00_021E7A1C: ; 0x021E7A1C
	ldr r1, _021E7A28 ; =_0221A684
	ldr r2, [r1, #4]
	ldr r1, _021E7A2C ; =0x0000198C
	str r0, [r2, r1]
	bx lr
	nop
_021E7A28: .word _0221A684
_021E7A2C: .word 0x0000198C
	thumb_func_end ov00_021E7A1C

	thumb_func_start ov00_021E7A30
ov00_021E7A30: ; 0x021E7A30
	push {r4, lr}
	ldr r0, _021E7A90 ; =_0221A684
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _021E7A8C
	ldr r0, _021E7A94 ; =0x0000198C
	ldr r4, [r1, r0]
	bl MIC_StopAutoSampling
	ldr r0, _021E7A90 ; =_0221A684
	ldr r1, [r0, #4]
	ldr r0, _021E7A98 ; =0x000019F8
	add r0, r1, r0
	bl NNS_SndStrmStop
	ldr r0, _021E7A90 ; =_0221A684
	ldr r1, [r0, #4]
	ldr r0, _021E7A98 ; =0x000019F8
	add r0, r1, r0
	bl NNS_SndStrmFreeChannel
	bl VCT_Cleanup
	ldr r0, _021E7A90 ; =_0221A684
	ldr r1, _021E7A9C ; =0x00000888
	ldr r2, [r0, #4]
	ldr r0, _021E7AA0 ; =0x000019F4
	ldr r1, [r2, r1]
	ldr r0, [r2, r0]
	bl Heap_FreeExplicit
	ldr r0, _021E7A90 ; =_0221A684
	mov r1, #0x22
	ldr r2, [r0, #4]
	ldr r0, _021E7AA0 ; =0x000019F4
	lsl r1, r1, #6
	ldr r0, [r2, r0]
	ldr r1, [r2, r1]
	bl Heap_FreeExplicit
	mov r1, #0
	ldr r0, _021E7A90 ; =_0221A684
	cmp r4, #0
	str r1, [r0, #4]
	beq _021E7A8C
	blx r4
_021E7A8C:
	pop {r4, pc}
	nop
_021E7A90: .word _0221A684
_021E7A94: .word 0x0000198C
_021E7A98: .word 0x000019F8
_021E7A9C: .word 0x00000888
_021E7AA0: .word 0x000019F4
	thumb_func_end ov00_021E7A30

	thumb_func_start ov00_021E7AA4
ov00_021E7AA4: ; 0x021E7AA4
	push {r3, lr}
	sub sp, #0x10
	ldr r0, _021E7AC8 ; =_0221A684
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _021E7AC2
	add r0, sp, #0
	bl VCT_GetVADInfo
	ldr r0, [sp, #4]
	cmp r0, #2
	ble _021E7AC2
	ldr r0, [sp]
	add sp, #0x10
	pop {r3, pc}
_021E7AC2:
	mov r0, #0
	add sp, #0x10
	pop {r3, pc}
	.balign 4, 0
_021E7AC8: .word _0221A684
	thumb_func_end ov00_021E7AA4

	thumb_func_start ov00_021E7ACC
ov00_021E7ACC: ; 0x021E7ACC
	ldr r0, _021E7AD8 ; =_0221A684
	mov r2, #1
	ldr r1, [r0, #4]
	ldr r0, _021E7ADC ; =0x000019F0
	str r2, [r1, r0]
	bx lr
	.balign 4, 0
_021E7AD8: .word _0221A684
_021E7ADC: .word 0x000019F0
	thumb_func_end ov00_021E7ACC

	thumb_func_start ov00_021E7AE0
ov00_021E7AE0: ; 0x021E7AE0
	ldr r0, _021E7AEC ; =_0221A684
	mov r2, #0
	ldr r1, [r0, #4]
	ldr r0, _021E7AF0 ; =0x000019F0
	str r2, [r1, r0]
	bx lr
	.balign 4, 0
_021E7AEC: .word _0221A684
_021E7AF0: .word 0x000019F0
	thumb_func_end ov00_021E7AE0

	thumb_func_start ov00_021E7AF4
ov00_021E7AF4: ; 0x021E7AF4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _021E7B54 ; =_0221A684
	add r7, r1, #0
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _021E7B0A
	ldr r0, _021E7B58 ; =0x000019E8
	ldr r0, [r1, r0]
	cmp r0, #3
	beq _021E7B0E
_021E7B0A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E7B0E:
	mov r4, #0
	add r5, r4, #0
_021E7B12:
	cmp r4, r7
	beq _021E7B48
	mov r0, #1
	lsl r0, r4
	tst r0, r6
	beq _021E7B48
	ldr r0, _021E7B54 ; =_0221A684
	ldr r0, [r0, #4]
	add r1, r0, r5
	ldr r0, _021E7B5C ; =0x000019D8
	ldr r0, [r1, r0]
	cmp r0, #1
	beq _021E7B48
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl VCT_AddConferenceClient
	cmp r0, #0
	beq _021E7B3C
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021E7B3C:
	ldr r0, _021E7B54 ; =_0221A684
	mov r1, #1
	ldr r0, [r0, #4]
	add r2, r0, r5
	ldr r0, _021E7B5C ; =0x000019D8
	str r1, [r2, r0]
_021E7B48:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _021E7B12
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7B54: .word _0221A684
_021E7B58: .word 0x000019E8
_021E7B5C: .word 0x000019D8
	thumb_func_end ov00_021E7AF4

	.rodata

_0221602C:
	.byte 0x01, 0x02, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.balign 4, 0
_02216034:
	.asciz "%s = '%s'"
	.balign 4, 0

	.data

	.balign 4, 0
_02216400:
	.asciz "pokemondpds"
	.balign 4, 0
_0221640C:
	.asciz "1vTlwb"
	.balign 4, 0
_02216414:
	.asciz "ppw_lobby"
	.balign 4, 0

	.bss

_0221A680:
	.space 0x4

_0221A684:
	.space 0x4

_0221A688:
	.space 0xC
