	.include "asm/macros.inc"
	.include "overlay_80_02229EE0.inc"
	.include "global.inc"

	.text

	thumb_func_start ov80_02229EE0
ov80_02229EE0: ; 0x02229EE0
	push {r4, lr}
	add r4, r0, #0
	add r3, r1, #0
	add r0, r2, #0
	add r1, r4, #0
	add r2, r3, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02229EE0

	thumb_func_start ov80_02229EF4
ov80_02229EF4: ; 0x02229EF4
	add r3, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r3, _02229F00 ; =ReadWholeNarcMemberByIdPair
	bx r3
	nop
_02229F00: .word ReadWholeNarcMemberByIdPair
	thumb_func_end ov80_02229EF4

	thumb_func_start ov80_02229F04
ov80_02229F04: ; 0x02229F04
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	mov r1, #0x1b
	str r3, [sp]
	mov r0, #1
	add r2, r1, #0
	add r3, r6, #0
	bl NewMsgDataFromNarc
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x30
	bl MI_CpuFill8
	lsl r0, r4, #0x10
	ldr r2, [sp]
	lsr r0, r0, #0x10
	add r1, r6, #0
	bl ov80_02229EE0
	add r6, r0, #0
	ldr r0, _02229F68 ; =0x0000FFFF
	str r4, [r5]
	strh r0, [r5, #0x18]
	lsl r0, r4, #1
	add r0, r4, r0
	strh r0, [r5, #0x1a]
	ldrh r0, [r6]
	add r1, r4, #0
	strh r0, [r5, #4]
	add r0, r7, #0
	bl NewString_ReadMsgData
	add r5, #8
	add r4, r0, #0
	add r1, r5, #0
	mov r2, #8
	bl CopyStringToU16Array
	add r0, r4, #0
	bl String_Delete
	add r0, r7, #0
	bl DestroyMsgData
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02229F68: .word 0x0000FFFF
	thumb_func_end ov80_02229F04

	thumb_func_start ov80_02229F6C
ov80_02229F6C: ; 0x02229F6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r1, [sp]
	add r7, r2, #0
	mov r1, #0
	mov r2, #0x38
	add r4, r0, #0
	add r6, r3, #0
	ldr r5, [sp, #0x34]
	bl MI_CpuFill8
	ldr r1, [sp]
	ldr r2, [sp, #0x40]
	add r0, sp, #8
	bl ov80_02229EF4
	ldrh r1, [r4]
	add r3, sp, #8
	ldr r0, _0222A118 ; =0xFFFFF800
	add r2, r1, #0
	and r2, r0
	ldrh r1, [r3]
	lsr r0, r0, #0x15
	and r0, r1
	orr r0, r2
	strh r0, [r4]
	ldrh r1, [r4]
	ldr r0, _0222A11C ; =0xFFFF07FF
	and r0, r1
	ldrh r1, [r3, #0xe]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x10
	orr r0, r1
	strh r0, [r4]
	ldr r0, [sp, #0x38]
	cmp r0, #0
	beq _02229FCC
	cmp r5, #4
	blo _02229FC2
	mov r0, #3
	and r0, r5
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_02229FC2:
	ldr r0, _0222A120 ; =_0223B620
	lsl r1, r5, #1
	ldrh r0, [r0, r1]
	strh r0, [r4, #2]
	b _02229FD0
_02229FCC:
	ldrh r0, [r3, #0xc]
	strh r0, [r4, #2]
_02229FD0:
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	add r1, sp, #8
	add r2, r4, #0
	add r5, r0, #0
_02229FDC:
	ldrh r3, [r1, #2]
	strh r3, [r2, #4]
	ldrh r3, [r1, #2]
	cmp r3, #0xda
	bne _02229FE8
	str r5, [sp, #4]
_02229FE8:
	add r0, r0, #1
	add r1, r1, #2
	add r2, r2, #2
	cmp r0, #4
	blt _02229FDC
	str r7, [r4, #0xc]
	cmp r6, #0
	bne _0222A026
_02229FF8:
	bl LCRandom
	add r5, r0, #0
	bl LCRandom
	lsl r0, r0, #0x10
	add r6, r5, #0
	orr r6, r0
	add r0, r6, #0
	bl GetNatureFromPersonality
	add r1, sp, #8
	ldrb r1, [r1, #0xb]
	cmp r1, r0
	bne _02229FF8
	add r0, r7, #0
	add r1, r6, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #1
	beq _02229FF8
	str r6, [r4, #0x10]
	b _0222A028
_0222A026:
	str r6, [r4, #0x10]
_0222A028:
	add r0, sp, #0x20
	ldrb r1, [r0, #0x10]
	ldr r2, [r4, #0x14]
	mov r0, #0x1f
	bic r2, r0
	mov r0, #0x1f
	and r0, r1
	orr r2, r0
	ldr r0, _0222A124 ; =0xFFFFFC1F
	mov r7, #0
	and r2, r0
	lsl r0, r1, #0x1b
	lsr r1, r0, #0x16
	orr r2, r1
	ldr r1, _0222A128 ; =0xFFFF83FF
	add r5, r7, #0
	and r2, r1
	lsr r1, r0, #0x11
	orr r2, r1
	ldr r1, _0222A12C ; =0xFFF07FFF
	and r2, r1
	lsr r1, r0, #0xc
	orr r2, r1
	ldr r1, _0222A130 ; =0xFE0FFFFF
	and r2, r1
	lsr r1, r0, #7
	orr r2, r1
	ldr r1, _0222A134 ; =0xC1FFFFFF
	lsr r0, r0, #2
	and r1, r2
	orr r0, r1
	str r0, [r4, #0x14]
_0222A068:
	add r0, r5, #0
	bl MaskOfFlagNo
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	tst r0, r1
	beq _0222A078
	add r7, r7, #1
_0222A078:
	add r5, r5, #1
	cmp r5, #6
	blt _0222A068
	ldr r0, _0222A138 ; =0x000001FE
	add r1, r7, #0
	bl _s32_div_f
	cmp r0, #0xff
	ble _0222A08C
	mov r0, #0xff
_0222A08C:
	lsl r0, r0, #0x18
	mov r5, #0
	lsr r7, r0, #0x18
_0222A092:
	add r0, r5, #0
	bl MaskOfFlagNo
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	tst r0, r1
	beq _0222A0A4
	add r0, r4, r5
	strb r7, [r0, #0x18]
_0222A0A4:
	add r5, r5, #1
	cmp r5, #6
	blt _0222A092
	mov r0, #0
	strb r0, [r4, #0x1e]
	ldr r0, _0222A13C ; =gGameLanguage
	mov r1, #0x19
	ldrb r0, [r0]
	strb r0, [r4, #0x1f]
	ldrh r0, [r4]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	bl GetMonBaseStat
	cmp r0, #0
	beq _0222A0E8
	ldr r2, [r4, #0x10]
	mov r1, #1
	tst r1, r2
	beq _0222A0D4
	add r1, r4, #0
	add r1, #0x20
	strb r0, [r1]
	b _0222A0FA
_0222A0D4:
	ldrh r0, [r4]
	mov r1, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	bl GetMonBaseStat
	add r1, r4, #0
	add r1, #0x20
	strb r0, [r1]
	b _0222A0FA
_0222A0E8:
	ldrh r0, [r4]
	mov r1, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	bl GetMonBaseStat
	add r1, r4, #0
	add r1, #0x20
	strb r0, [r1]
_0222A0FA:
	add r1, r4, #0
	ldr r0, [sp, #4]
	add r1, #0x21
	strb r0, [r1]
	ldrh r0, [r4]
	add r4, #0x22
	ldr r1, [sp, #0x3c]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	add r2, r4, #0
	bl GetSpeciesNameIntoArray
	add r0, r6, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A118: .word 0xFFFFF800
_0222A11C: .word 0xFFFF07FF
_0222A120: .word _0223B620
_0222A124: .word 0xFFFFFC1F
_0222A128: .word 0xFFFF83FF
_0222A12C: .word 0xFFF07FFF
_0222A130: .word 0xFE0FFFFF
_0222A134: .word 0xC1FFFFFF
_0222A138: .word 0x000001FE
_0222A13C: .word gGameLanguage
	thumb_func_end ov80_02229F6C

	thumb_func_start ov80_0222A140
ov80_0222A140: ; 0x0222A140
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r4, r2, #0
	bl ZeroMonData
	cmp r4, #0x78
	bne _0222A158
	mov r4, #0x32
	b _0222A15E
_0222A158:
	cmp r4, #0x79
	bne _0222A15E
	mov r4, #0x64
_0222A15E:
	ldr r1, [r6, #0x14]
	ldr r0, _0222A308 ; =0x3FFFFFFF
	add r2, r4, #0
	and r0, r1
	str r0, [sp, #0x1c]
	mov r0, #1
	str r0, [sp]
	ldr r0, [r6, #0x10]
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrh r1, [r6]
	ldr r3, [sp, #0x1c]
	add r0, r5, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x15
	bl CreateMon
	add r0, r5, #0
	mov r1, #0xaf
	add r2, sp, #0x1c
	bl SetMonData
	add r0, r5, #0
	bl CalcMonLevelAndStats
	ldrh r0, [r6]
	add r2, sp, #0x14
	add r2, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x1b
	add r0, sp, #0x14
	strb r1, [r0, #1]
	add r0, r5, #0
	mov r1, #0x70
	bl SetMonData
	add r0, r5, #0
	mov r1, #6
	add r2, r6, #2
	bl SetMonData
	mov r4, #0
	str r6, [sp, #0x10]
	add r7, r4, #0
_0222A1BC:
	ldr r0, [sp, #0x10]
	add r2, sp, #0x14
	ldrh r1, [r0, #4]
	add r0, sp, #0x14
	add r2, #2
	strh r1, [r0, #2]
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x36
	bl SetMonData
	ldrb r0, [r6, #0x1e]
	add r2, sp, #0x14
	add r2, #1
	add r1, r0, #0
	asr r1, r7
	mov r0, #3
	and r1, r0
	add r0, sp, #0x14
	strb r1, [r0, #1]
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x3e
	bl SetMonData
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x42
	mov r2, #0
	bl GetMonData
	add r1, sp, #0x14
	strb r0, [r1]
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x3a
	add r2, sp, #0x14
	bl SetMonData
	ldr r0, [sp, #0x10]
	add r4, r4, #1
	add r0, r0, #2
	add r7, r7, #2
	str r0, [sp, #0x10]
	cmp r4, #4
	blt _0222A1BC
	ldr r0, [r6, #0xc]
	mov r1, #7
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r2, sp, #0x18
	bl SetMonData
	add r2, sp, #0x14
	ldrb r1, [r6, #0x18]
	add r0, sp, #0x14
	add r2, #1
	strb r1, [r0, #1]
	add r0, r5, #0
	mov r1, #0xd
	bl SetMonData
	add r2, sp, #0x14
	ldrb r1, [r6, #0x19]
	add r0, sp, #0x14
	add r2, #1
	strb r1, [r0, #1]
	add r0, r5, #0
	mov r1, #0xe
	bl SetMonData
	add r2, sp, #0x14
	ldrb r1, [r6, #0x1a]
	add r0, sp, #0x14
	add r2, #1
	strb r1, [r0, #1]
	add r0, r5, #0
	mov r1, #0xf
	bl SetMonData
	add r2, sp, #0x14
	ldrb r1, [r6, #0x1b]
	add r0, sp, #0x14
	add r2, #1
	strb r1, [r0, #1]
	add r0, r5, #0
	mov r1, #0x10
	bl SetMonData
	add r2, sp, #0x14
	ldrb r1, [r6, #0x1c]
	add r0, sp, #0x14
	add r2, #1
	strb r1, [r0, #1]
	add r0, r5, #0
	mov r1, #0x11
	bl SetMonData
	add r2, sp, #0x14
	ldrb r1, [r6, #0x1d]
	add r0, sp, #0x14
	add r2, #1
	strb r1, [r0, #1]
	add r0, r5, #0
	mov r1, #0x12
	bl SetMonData
	add r2, r6, #0
	add r0, r5, #0
	mov r1, #0xa
	add r2, #0x20
	bl SetMonData
	add r2, r6, #0
	add r0, r5, #0
	mov r1, #9
	add r2, #0x21
	bl SetMonData
	ldr r0, [r6, #0x14]
	lsl r0, r0, #1
	lsr r0, r0, #0x1f
	beq _0222A2E4
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	mov r3, #4
	bl NewMsgDataFromNarc
	ldrh r1, [r6]
	add r4, r0, #0
	lsl r1, r1, #0x15
	lsr r1, r1, #0x15
	bl NewString_ReadMsgData
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x77
	add r2, r7, #0
	bl SetMonData
	add r0, r7, #0
	bl String_Delete
	add r0, r4, #0
	bl DestroyMsgData
	b _0222A2F0
_0222A2E4:
	add r2, r6, #0
	add r0, r5, #0
	mov r1, #0x75
	add r2, #0x22
	bl SetMonData
_0222A2F0:
	add r6, #0x1f
	add r0, r5, #0
	mov r1, #0xc
	add r2, r6, #0
	bl SetMonData
	add r0, r5, #0
	bl CalcMonLevelAndStats
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222A308: .word 0x3FFFFFFF
	thumb_func_end ov80_0222A140

	thumb_func_start ov80_0222A30C
ov80_0222A30C: ; 0x0222A30C
	ldr r3, _0222A32C ; =ov80_0223B628
	mov r2, #0
_0222A310:
	ldrh r1, [r3]
	cmp r0, r1
	bne _0222A31E
	ldr r0, _0222A330 ; =ov80_0223B62A
	lsl r1, r2, #2
	ldrh r0, [r0, r1]
	bx lr
_0222A31E:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #0x3f
	blo _0222A310
	mov r0, #3
	bx lr
	nop
_0222A32C: .word ov80_0223B628
_0222A330: .word ov80_0223B62A
	thumb_func_end ov80_0222A30C

	thumb_func_start ov80_0222A334
ov80_0222A334: ; 0x0222A334
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	bl Save_PlayerData_GetProfileAddr
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	add r0, r5, #0
	bl Save_PlayerData_GetProfileAddr
	mov r3, #0
	add r1, r0, #0
	str r3, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #4
	bl sub_0207217C
	ldr r0, _0222A3B8 ; =0x00000113
	bl MapHeader_GetMapSec
	add r3, r0, #0
	mov r0, #0xb
	str r0, [sp]
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #0
	bl MonSetTrainerMemo
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xc1
	mov r3, #0xb
	bl NewMsgDataFromNarc
	mov r1, #0
	add r5, r0, #0
	bl NewString_ReadMsgData
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0x91
	add r2, r6, #0
	bl SetMonData
	add r0, r4, #0
	mov r1, #7
	add r2, sp, #8
	bl SetMonData
	add r0, r6, #0
	bl String_Delete
	add r0, r5, #0
	bl DestroyMsgData
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_0222A3B8: .word 0x00000113
	thumb_func_end ov80_0222A334

	thumb_func_start ov80_0222A3BC
ov80_0222A3BC: ; 0x0222A3BC
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r1, r4, #0
	bl ov80_0222A334
	add r0, r5, #0
	add r1, r4, #0
	bl Party_AddMon
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222A3BC

	thumb_func_start ov80_0222A3D4
ov80_0222A3D4: ; 0x0222A3D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020249A8
	cmp r4, r0
	beq _0222A3FC
	add r0, r5, #0
	mov r1, #0
	bl sub_020249D4
	add r0, r5, #0
	add r1, r4, #0
	bl Set2dSpriteAnimSeqNo
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl sub_020249B0
_0222A3FC:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222A3D4

	thumb_func_start ov80_0222A400
ov80_0222A400: ; 0x0222A400
	push {r4, r5, lr}
	sub sp, #0xc
	lsl r1, r1, #0xc
	add r4, r2, #0
	str r1, [sp]
	lsl r1, r4, #0xc
	str r1, [sp, #4]
	mov r1, #0
	add r5, r0, #0
	str r1, [sp, #8]
	cmp r3, #1
	bne _0222A42E
	bl sub_020249F8
	cmp r0, #0
	bne _0222A428
	sub r0, r4, #3
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	b _0222A42E
_0222A428:
	add r0, r4, #1
	lsl r0, r0, #0xc
	str r0, [sp, #4]
_0222A42E:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_020247D4
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222A400

	thumb_func_start ov80_0222A43C
ov80_0222A43C: ; 0x0222A43C
	push {r3, lr}
	mov r2, #0x30
	bl sub_020880B0
	cmp r0, #4
	bhi _0222A46E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222A454: ; jump table
	.short _0222A46E - _0222A454 - 2 ; case 0
	.short _0222A46A - _0222A454 - 2 ; case 1
	.short _0222A466 - _0222A454 - 2 ; case 2
	.short _0222A462 - _0222A454 - 2 ; case 3
	.short _0222A45E - _0222A454 - 2 ; case 4
_0222A45E:
	mov r0, #1
	pop {r3, pc}
_0222A462:
	mov r0, #2
	pop {r3, pc}
_0222A466:
	mov r0, #3
	pop {r3, pc}
_0222A46A:
	mov r0, #4
	pop {r3, pc}
_0222A46E:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222A43C

	thumb_func_start ov80_0222A474
ov80_0222A474: ; 0x0222A474
	push {r3, lr}
	bl ov80_02229F04
	bl FreeToHeap
	pop {r3, pc}
	thumb_func_end ov80_0222A474

	thumb_func_start ov80_0222A480
ov80_0222A480: ; 0x0222A480
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	lsl r0, r3, #2
	ldr r1, [r4]
	add r0, r5, r0
	str r1, [r0, #0x18]
	mov r0, #0x34
	add r6, r3, #0
	mul r6, r0
	add r0, r5, r6
	ldrh r1, [r4, #4]
	add r0, #0x29
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x3c
	add r1, r4, #0
	add r0, r0, r6
	add r1, #8
	bl CopyU16StringArray
	add r0, r5, r6
	ldrh r1, [r4, #0x20]
	add r0, #0x4c
	strh r1, [r0]
	add r0, r5, r6
	ldrh r1, [r4, #0x22]
	add r0, #0x4e
	strh r1, [r0]
	add r0, r5, r6
	ldrh r1, [r4, #0x24]
	add r0, #0x50
	strh r1, [r0]
	add r0, r5, r6
	ldrh r1, [r4, #0x26]
	add r0, #0x52
	strh r1, [r0]
	add r0, r5, r6
	ldrh r1, [r4, #0x28]
	add r0, #0x54
	strh r1, [r0]
	add r0, r5, r6
	ldrh r1, [r4, #0x2a]
	add r0, #0x56
	strh r1, [r0]
	add r0, r5, r6
	ldrh r1, [r4, #0x2c]
	add r0, #0x58
	strh r1, [r0]
	add r0, r5, r6
	ldrh r1, [r4, #0x2e]
	add r0, #0x5a
	strh r1, [r0]
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222A480

	thumb_func_start ov80_0222A4EC
ov80_0222A4EC: ; 0x0222A4EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r0, #0
	str r1, [sp, #0x14]
	add r5, r2, #0
	add r4, r3, #0
	bl LCRandom
	add r6, r0, #0
	bl LCRandom
	lsl r0, r0, #0x10
	add r2, r6, #0
	orr r2, r0
	lsl r0, r5, #0x18
	str r4, [sp]
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x34]
	ldr r3, [sp, #0x30]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	bl ov80_02229F6C
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222A4EC

	thumb_func_start ov80_0222A52C
ov80_0222A52C: ; 0x0222A52C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x30]
	add r7, r1, #0
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x34]
	str r2, [sp, #0x10]
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x38]
	str r3, [sp, #0x14]
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	mov r4, #0
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ble _0222A5A0
	ldr r5, [sp, #0x30]
	add r6, r3, #0
_0222A554:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0222A55E
	mov r0, #0
	b _0222A560
_0222A55E:
	ldrb r0, [r0, r4]
_0222A560:
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0222A56E
	mov r0, #0
	b _0222A570
_0222A56E:
	ldr r0, [r6]
_0222A570:
	str r0, [sp]
	ldr r0, [sp, #0x38]
	add r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #8]
	ldrh r1, [r7]
	ldr r0, [sp, #0xc]
	bl ov80_0222A4EC
	ldr r1, [sp, #0x30]
	cmp r1, #0
	beq _0222A58C
	str r0, [r5]
_0222A58C:
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	add r0, #0x38
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	add r6, r6, #4
	add r7, r7, #2
	add r5, r5, #4
	cmp r4, r0
	blt _0222A554
_0222A5A0:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222A52C

	thumb_func_start ov80_0222A5A4
ov80_0222A5A4: ; 0x0222A5A4
	cmp r0, #0x64
	bhs _0222A5AC
	mov r0, #3
	bx lr
_0222A5AC:
	cmp r0, #0x78
	bhs _0222A5B4
	mov r0, #6
	bx lr
_0222A5B4:
	cmp r0, #0x8c
	bhs _0222A5BC
	mov r0, #9
	bx lr
_0222A5BC:
	cmp r0, #0xa0
	bhs _0222A5C4
	mov r0, #0xc
	bx lr
_0222A5C4:
	cmp r0, #0xb4
	bhs _0222A5CC
	mov r0, #0xf
	bx lr
_0222A5CC:
	cmp r0, #0xc8
	bhs _0222A5D4
	mov r0, #0x12
	bx lr
_0222A5D4:
	cmp r0, #0xdc
	bhs _0222A5DC
	mov r0, #0x15
	bx lr
_0222A5DC:
	mov r0, #0x1f
	bx lr
	thumb_func_end ov80_0222A5A4

	thumb_func_start ov80_0222A5E0
ov80_0222A5E0: ; 0x0222A5E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	str r0, [sp]
	ldr r0, [sp, #0x90]
	add r7, r3, #0
	str r1, [sp, #4]
	str r2, [sp, #8]
	str r0, [sp, #0x90]
	cmp r0, #6
	ble _0222A5F8
	bl GF_AssertFail
_0222A5F8:
	ldr r0, [sp, #0x90]
	mov r4, #0
	str r4, [sp, #0x14]
	cmp r0, #0
	beq _0222A6A6
	add r0, sp, #0x1c
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x94]
	str r0, [sp, #0xc]
_0222A60A:
	bl LCRandom
	ldr r1, [sp]
	ldrh r1, [r1, #2]
	bl _s32_div_f
	ldr r0, [sp]
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #4]
	mov r2, #0xcd
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x18]
	bl ov80_02229EF4
	mov r0, #0
	cmp r4, #0
	ble _0222A64E
	ldr r2, [sp, #0x10]
	ldr r3, [sp, #0x10]
	ldrh r2, [r2]
	ldrh r3, [r3, #0xc]
	add r1, sp, #0x1c
_0222A63A:
	ldrh r5, [r1]
	cmp r5, r2
	beq _0222A64E
	ldrh r5, [r1, #0xc]
	cmp r5, r3
	beq _0222A64E
	add r0, r0, #1
	add r1, #0x10
	cmp r0, r4
	blt _0222A63A
_0222A64E:
	cmp r0, r4
	bne _0222A6A0
	ldr r0, [sp, #0x14]
	cmp r0, #0x32
	bge _0222A68C
	mov r3, #0
	cmp r7, #0
	ble _0222A680
	ldr r2, [sp, #0x10]
	ldr r5, [sp, #0x10]
	ldrh r2, [r2]
	ldrh r6, [r5, #0xc]
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
_0222A66A:
	ldrh r5, [r0]
	cmp r2, r5
	beq _0222A680
	ldrh r5, [r1]
	cmp r6, r5
	beq _0222A680
	add r3, r3, #1
	add r0, r0, #2
	add r1, r1, #2
	cmp r3, r7
	blt _0222A66A
_0222A680:
	cmp r3, r7
	beq _0222A68C
	ldr r0, [sp, #0x14]
	add r0, r0, #1
	str r0, [sp, #0x14]
	b _0222A6A0
_0222A68C:
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	strh r1, [r0]
	ldr r0, [sp, #0x10]
	add r0, #0x10
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	add r0, r0, #2
	str r0, [sp, #0xc]
_0222A6A0:
	ldr r0, [sp, #0x90]
	cmp r4, r0
	bne _0222A60A
_0222A6A6:
	ldr r0, [sp, #0x14]
	cmp r0, #0x32
	blt _0222A6B2
	add sp, #0x7c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0222A6B2:
	mov r0, #0
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222A5E0

	thumb_func_start ov80_0222A6B8
ov80_0222A6B8: ; 0x0222A6B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x74
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x8c]
	str r2, [sp, #0x14]
	str r3, [sp, #0x18]
	str r0, [sp, #0x8c]
	add r0, sp, #0x44
	mov r2, #0xb
	mov r3, #0xcc
	add r5, r1, #0
	bl ov80_02229F04
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x10]
	mov r4, #0
	cmp r0, #0
	ble _0222A6EE
_0222A6DC:
	add r0, r5, #0
	bl ov80_0222A5A4
	ldr r1, [sp, #0x8c]
	strb r0, [r1, r4]
	ldr r0, [sp, #0x10]
	add r4, r4, #1
	cmp r4, r0
	blt _0222A6DC
_0222A6EE:
	add r0, sp, #0x78
	ldrb r0, [r0, #0x1c]
	add r1, sp, #0x2c
	cmp r0, #0
	bne _0222A710
	ldr r0, [sp, #0x10]
	add r2, sp, #0x24
	str r0, [sp]
	ldr r0, [sp, #0x18]
	mov r3, #0
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	bl ov80_0222A5E0
	b _0222A7A6
_0222A710:
	ldr r0, [sp, #0x10]
	add r2, sp, #0x24
	lsr r0, r0, #1
	str r0, [sp, #0x1c]
	str r0, [sp]
	ldr r0, [sp, #0x18]
	mov r3, #0
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	bl ov80_0222A5E0
	ldr r0, [sp, #0x1c]
	mov r7, #0
	cmp r0, #0
	ble _0222A75C
	ldr r6, [sp, #0x18]
	add r4, sp, #0x2c
	add r5, sp, #0x24
_0222A738:
	ldrh r1, [r6]
	add r0, sp, #0x34
	mov r2, #0xcd
	bl ov80_02229EF4
	add r0, sp, #0x24
	ldrh r0, [r0, #0x10]
	add r7, r7, #1
	add r6, r6, #2
	strh r0, [r4]
	add r0, sp, #0x24
	ldrh r0, [r0, #0x1c]
	add r4, r4, #2
	strh r0, [r5]
	ldr r0, [sp, #0x1c]
	add r5, r5, #2
	cmp r7, r0
	blt _0222A738
_0222A75C:
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	ldr r1, [sp, #0x14]
	add r0, sp, #0x44
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_02229F04
	ldr r1, [sp, #0x10]
	str r0, [sp, #0x20]
	lsr r6, r1, #1
	ldr r1, [sp, #0x18]
	lsl r2, r6, #1
	add r1, r1, r2
	str r6, [sp]
	str r1, [sp, #4]
	mov r1, #0xb
	str r1, [sp, #8]
	add r1, sp, #0x2c
	add r2, sp, #0x24
	add r3, r6, #0
	bl ov80_0222A5E0
	mov r5, #0
	cmp r6, #0
	ble _0222A7A6
	ldr r0, [sp, #0x8c]
	add r4, r0, r6
_0222A796:
	ldr r0, [sp, #0x14]
	bl ov80_0222A5A4
	strb r0, [r4]
	add r5, r5, #1
	add r4, r4, #1
	cmp r5, r6
	blt _0222A796
_0222A7A6:
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r2, [sp, #0x8c]
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x88]
	mov r3, #0
	bl ov80_0222A52C
	add sp, #0x74
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222A6B8

	thumb_func_start ov80_0222A7CC
ov80_0222A7CC: ; 0x0222A7CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02034818
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl BufferPlayersName
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222A7CC

	thumb_func_start ov80_0222A7EC
ov80_0222A7EC: ; 0x0222A7EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl PlayerProfile_GetTrainerGender
	add r4, r0, #0
	add r0, r5, #0
	bl PlayerProfile_GetVersion
	cmp r0, #0
	bgt _0222A804
	beq _0222A822
	b _0222A816
_0222A804:
	cmp r0, #0xc
	bgt _0222A816
	cmp r0, #7
	blt _0222A816
	beq _0222A816
	cmp r0, #8
	beq _0222A816
	cmp r0, #0xc
	beq _0222A82E
_0222A816:
	cmp r4, #0
	bne _0222A81E
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222A81E:
	mov r0, #0x61
	pop {r3, r4, r5, pc}
_0222A822:
	cmp r4, #0
	bne _0222A82A
	mov r0, #0xee
	pop {r3, r4, r5, pc}
_0222A82A:
	mov r0, #0xef
	pop {r3, r4, r5, pc}
_0222A82E:
	cmp r4, #0
	bne _0222A836
	ldr r0, _0222A83C ; =0x00000127
	pop {r3, r4, r5, pc}
_0222A836:
	mov r0, #0x4a
	lsl r0, r0, #2
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222A83C: .word 0x00000127
	thumb_func_end ov80_0222A7EC

	thumb_func_start ov80_0222A840
ov80_0222A840: ; 0x0222A840
	push {r3, lr}
	bl sub_0202CA44
	bl sub_02039F68
	pop {r3, pc}
	thumb_func_end ov80_0222A840

    .rodata

_0223B620: ; 0x0223B620
	.byte 0xD5, 0x00, 0x9D, 0x00, 0xEA, 0x00, 0xD9, 0x00

ov80_0223B628: ; 0x0223B628
	.byte 0x5A, 0x00

ov80_0223B62A: ; 0x0223B62A
	.byte 0x8D, 0x00, 0x5B, 0x00, 0x8E, 0x00
	.byte 0x5C, 0x00, 0x8F, 0x00, 0x5D, 0x00, 0x90, 0x00, 0x5E, 0x00, 0x91, 0x00, 0x02, 0x00, 0x04, 0x00
	.byte 0x03, 0x00, 0x06, 0x00, 0x3C, 0x00, 0x03, 0x00, 0x3D, 0x00, 0x08, 0x00, 0x20, 0x00, 0x3E, 0x00
	.byte 0x21, 0x00, 0x3F, 0x00, 0x04, 0x00, 0x34, 0x00, 0x05, 0x00, 0x35, 0x00, 0x2C, 0x00, 0x01, 0x00
	.byte 0x2D, 0x00, 0x02, 0x00, 0x14, 0x00, 0x0F, 0x00, 0x15, 0x00, 0x10, 0x00, 0x51, 0x00, 0x3B, 0x00
	.byte 0x1A, 0x00, 0x3C, 0x00, 0x10, 0x00, 0x09, 0x00, 0x11, 0x00, 0x0C, 0x00, 0x53, 0x00, 0x17, 0x00
	.byte 0x54, 0x00, 0x16, 0x00, 0x47, 0x00, 0x29, 0x00, 0x12, 0x00, 0x2A, 0x00, 0x0C, 0x00, 0x26, 0x00
	.byte 0x0D, 0x00, 0x27, 0x00, 0x0E, 0x00, 0x33, 0x00, 0x0A, 0x00, 0x07, 0x00, 0x1B, 0x00, 0x11, 0x00
	.byte 0x23, 0x00, 0x25, 0x00, 0x31, 0x00, 0x46, 0x00, 0x32, 0x00, 0x46, 0x00, 0x27, 0x00, 0x0B, 0x00
	.byte 0x28, 0x00, 0x0E, 0x00, 0x18, 0x00, 0x0B, 0x00, 0x19, 0x00, 0x0E, 0x00, 0x35, 0x00, 0x44, 0x00
	.byte 0x36, 0x00, 0x45, 0x00, 0x1D, 0x00, 0x0B, 0x00, 0x06, 0x00, 0x05, 0x00, 0x1C, 0x00, 0x01, 0x00
	.byte 0x13, 0x00, 0x2D, 0x00, 0x0B, 0x00, 0x36, 0x00, 0x2E, 0x00, 0x38, 0x00, 0x09, 0x00, 0x14, 0x00
	.byte 0x30, 0x00, 0x32, 0x00, 0x34, 0x00, 0x0A, 0x00, 0x25, 0x00, 0x13, 0x00, 0x39, 0x00, 0x1F, 0x00
	.byte 0x4E, 0x00, 0x1D, 0x00, 0x22, 0x00, 0x24, 0x00, 0x3B, 0x00, 0x28, 0x00, 0x3A, 0x00, 0x2B, 0x00
	.byte 0x26, 0x00, 0x22, 0x00, 0x33, 0x00, 0x3E, 0x00, 0x1E, 0x00, 0x0E, 0x00, 0x50, 0x00, 0x37, 0x00
	.byte 0x24, 0x00, 0x0D, 0x00, 0x07, 0x00, 0x0C, 0x00, 0x55, 0x00, 0x23, 0x00, 0x0F, 0x00, 0x2C, 0x00
	.byte 0x16, 0x00, 0x47, 0x00
    