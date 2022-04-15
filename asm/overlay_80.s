	.include "asm/macros.inc"
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
	bl String_dtor
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
	bl String_dtor
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
	bl Sav2_PlayerData_GetProfileAddr
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	str r0, [sp, #8]
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
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
	bl String_dtor
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
	bl AddMonToParty
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

	thumb_func_start ov80_0222A84C
ov80_0222A84C: ; 0x0222A84C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0xbc
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xbc
	bl MI_CpuFill8
	str r7, [r4]
	add r0, r4, #0
	add r1, r4, #0
	str r5, [r4, #0x34]
	add r0, #0x52
	strh r6, [r0]
	add r0, r4, #0
	add r0, #0x40
	add r1, #0x3c
	add r2, r6, #0
	add r3, r5, #0
	bl ov80_0222AA40
	mov r0, #8
	mov r1, #0x40
	add r2, r5, #0
	bl ScrStrBufs_new_custom
	str r0, [r4, #0x44]
	mov r0, #1
	lsl r0, r0, #0xa
	add r1, r5, #0
	bl String_ctor
	str r0, [r4, #0x48]
	mov r0, #1
	lsl r0, r0, #0xa
	add r1, r5, #0
	bl String_ctor
	lsl r1, r6, #0x10
	mov r2, #0
	str r0, [r4, #0x4c]
	add r0, r4, #0
	lsr r1, r1, #0x10
	add r3, r2, #0
	bl ov80_0222AA3C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222A84C

	thumb_func_start ov80_0222A8B8
ov80_0222A8B8: ; 0x0222A8B8
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x51
	str r0, [sp]
	ldrsb r0, [r0, r1]
	cmp r0, #0
	bne _0222A8C8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222A8C8:
	ldr r0, [sp]
	add r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222A90C
	ldr r5, [sp]
	mov r7, #0
	add r6, r5, #0
	add r6, #0x51
_0222A8DA:
	ldr r4, [r5, #4]
	cmp r4, #0
	beq _0222A8FC
	add r0, r4, #0
	bl ov80_0222AB98
	cmp r0, #0
	bne _0222A8FC
	ldr r0, [sp]
	add r1, r4, #0
	bl ov80_0222AA0C
	mov r0, #0
	str r0, [r5, #4]
	ldrsb r0, [r6, r0]
	sub r0, r0, #1
	strb r0, [r6]
_0222A8FC:
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, #8
	blt _0222A8DA
	ldr r0, [sp]
	ldr r0, [r0]
	bl ov80_02239C54
_0222A90C:
	ldr r0, [sp]
	mov r1, #0x51
	ldrsb r0, [r0, r1]
	cmp r0, #0
	bne _0222A91A
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222A91A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222A8B8

	thumb_func_start ov80_0222A920
ov80_0222A920: ; 0x0222A920
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x51
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0222A930
	bl GF_AssertFail
_0222A930:
	ldr r0, [r4, #0x44]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x48]
	bl String_dtor
	ldr r0, [r4, #0x4c]
	bl String_dtor
	ldr r0, [r4, #0x40]
	bl FreeToHeap
	ldr r0, [r4, #0x3c]
	bl DestroyMsgData
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222A920

	thumb_func_start ov80_0222A958
ov80_0222A958: ; 0x0222A958
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x34]
	add r6, r1, #0
	mov r1, #0x90
	add r7, r2, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x90
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r2, _0222A9D0 ; =ov80_0223B9CC
	ldr r1, _0222A9D4 ; =ov80_0223BA04
	ldr r2, [r2]
	add r0, r4, #0
	bl ov80_0222AB40
	ldr r0, _0222A9D8 ; =0x0000FFFF
	str r5, [r4]
	cmp r6, r0
	beq _0222A990
	add r0, r5, #0
	add r0, #0x52
	ldrh r0, [r0]
	cmp r0, r6
	bne _0222A9A2
_0222A990:
	add r0, r4, #0
	ldr r1, [r5, #0x40]
	add r0, #0x84
	str r1, [r0]
	add r0, r4, #0
	ldr r1, [r5, #0x3c]
	add r0, #0x80
	str r1, [r0]
	b _0222A9B2
_0222A9A2:
	add r0, r4, #0
	add r1, r4, #0
	ldr r3, [r5, #0x34]
	add r0, #0x84
	add r1, #0x80
	add r2, r6, #0
	bl ov80_0222AA40
_0222A9B2:
	add r1, r4, #0
	add r1, #0x84
	ldr r1, [r1]
	add r0, r4, #0
	bl ov80_0222AB78
	add r0, r4, #0
	add r1, r7, #0
	bl ov80_0222AB14
	add r0, r5, #0
	add r1, r4, #0
	bl ov80_0222A9DC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A9D0: .word ov80_0223B9CC
_0222A9D4: .word ov80_0223BA04
_0222A9D8: .word 0x0000FFFF
	thumb_func_end ov80_0222A958

	thumb_func_start ov80_0222A9DC
ov80_0222A9DC: ; 0x0222A9DC
	push {r4, lr}
	mov r3, #0
	add r4, r0, #0
_0222A9E2:
	ldr r2, [r4, #4]
	cmp r2, #0
	bne _0222A9FC
	lsl r2, r3, #2
	add r2, r0, r2
	str r1, [r2, #4]
	mov r1, #0x51
	ldrsb r1, [r0, r1]
	add r0, #0x51
	add r1, r1, #1
	strb r1, [r0]
	mov r0, #1
	pop {r4, pc}
_0222A9FC:
	add r3, r3, #1
	add r4, r4, #4
	cmp r3, #8
	blt _0222A9E2
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222A9DC

	thumb_func_start ov80_0222AA0C
ov80_0222AA0C: ; 0x0222AA0C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r5, #0x3c]
	cmp r0, r1
	beq _0222AA22
	bl DestroyMsgData
_0222AA22:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r1, [r5, #0x40]
	cmp r0, r1
	beq _0222AA32
	bl FreeToHeap
_0222AA32:
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222AA0C

	thumb_func_start ov80_0222AA3C
ov80_0222AA3C: ; 0x0222AA3C
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AA3C

	thumb_func_start ov80_0222AA40
ov80_0222AA40: ; 0x0222AA40
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	mov r1, #1
	add r7, r3, #0
	bl ov80_0222ACA0
	str r0, [sp]
	add r0, r6, #0
	mov r1, #2
	bl ov80_0222ACA0
	add r6, r0, #0
	ldr r1, [sp]
	mov r0, #0xb6
	add r2, r7, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [r5]
	mov r0, #1
	mov r1, #0x1b
	add r2, r6, #0
	add r3, r7, #0
	bl NewMsgDataFromNarc
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222AA40

	thumb_func_start ov80_0222AA7C
ov80_0222AA7C: ; 0x0222AA7C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x52
	ldrh r0, [r0]
	add r6, r1, #0
	mov r1, #2
	add r7, r2, #0
	bl ov80_0222ACA0
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #2
	bl ov80_0222ACA0
	add r2, r0, #0
	cmp r4, r2
	beq _0222AAD4
	mov r0, #1
	mov r1, #0x1b
	add r3, r7, #0
	bl NewMsgDataFromNarc
	add r4, r0, #0
	mov r1, #0
	add r2, r5, #0
_0222AAAE:
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _0222AAC4
	add r3, r0, #0
	add r3, #0x80
	ldr r6, [r3]
	ldr r3, [r5, #0x3c]
	cmp r6, r3
	bne _0222AAC4
	add r0, #0x80
	str r4, [r0]
_0222AAC4:
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #8
	blt _0222AAAE
	ldr r0, [r5, #0x3c]
	bl DestroyMsgData
	str r4, [r5, #0x3c]
_0222AAD4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222AA7C

	thumb_func_start ov80_0222AAD8
ov80_0222AAD8: ; 0x0222AAD8
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #0x10
	bl AllocFromHeap
	add r4, #0x24
	add r3, r0, #0
	mov r2, #8
_0222AAEA:
	ldrh r1, [r4]
	add r4, r4, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _0222AAEA
	pop {r4, pc}
	thumb_func_end ov80_0222AAD8

	thumb_func_start ov80_0222AAF8
ov80_0222AAF8: ; 0x0222AAF8
	push {r4, lr}
	add r4, r1, #0
	add r0, #0x24
	mov r3, #8
_0222AB00:
	ldrh r2, [r4]
	add r4, r4, #2
	strh r2, [r0]
	add r0, r0, #2
	sub r3, r3, #1
	bne _0222AB00
	add r0, r1, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov80_0222AAF8

	thumb_func_start ov80_0222AB14
ov80_0222AB14: ; 0x0222AB14
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #0x1c]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r4, #0x1c]
	bl ov80_0222AC70
	ldr r1, [r4, #0x1c]
	add r0, r1, r0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov80_0222AB14

	thumb_func_start ov80_0222AB2C
ov80_0222AB2C: ; 0x0222AB2C
	add r0, #0x24
	lsl r1, r1, #1
	add r0, r0, r1
	bx lr
	thumb_func_end ov80_0222AB2C

	thumb_func_start ov80_0222AB34
ov80_0222AB34: ; 0x0222AB34
	ldr r3, _0222AB3C ; =sub_0209680C
	ldr r0, [r0]
	bx r3
	nop
_0222AB3C: .word sub_0209680C
	thumb_func_end ov80_0222AB34

	thumb_func_start ov80_0222AB40
ov80_0222AB40: ; 0x0222AB40
	push {r3, r4}
	mov r4, #0
	strb r4, [r0, #0x19]
	str r4, [r0, #0x1c]
	add r3, r0, #0
	strb r4, [r0, #0x18]
	add r3, #0x88
	str r4, [r3]
	str r1, [r0, #0x70]
	str r2, [r0, #0x74]
	add r2, r0, #0
	add r3, r4, #0
_0222AB58:
	add r1, r2, #0
	add r1, #0x78
	add r4, r4, #1
	add r2, r2, #2
	strh r3, [r1]
	cmp r4, #4
	blo _0222AB58
	mov r1, #0
_0222AB68:
	add r3, r3, #1
	str r1, [r0, #0x20]
	add r0, r0, #4
	cmp r3, #0x14
	blo _0222AB68
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AB40

	thumb_func_start ov80_0222AB78
ov80_0222AB78: ; 0x0222AB78
	str r1, [r0, #0x1c]
	mov r1, #1
	strb r1, [r0, #0x19]
	add r0, r1, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AB78

	thumb_func_start ov80_0222AB84
ov80_0222AB84: ; 0x0222AB84
	mov r2, #2
	strb r2, [r0, #0x19]
	add r0, #0x88
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AB84

	thumb_func_start ov80_0222AB90
ov80_0222AB90: ; 0x0222AB90
	mov r1, #0
	strb r1, [r0, #0x19]
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ov80_0222AB90

	thumb_func_start ov80_0222AB98
ov80_0222AB98: ; 0x0222AB98
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #0x19]
	cmp r1, #0
	beq _0222ABAC
	cmp r1, #1
	beq _0222ABD2
	cmp r1, #2
	beq _0222ABB0
	b _0222AC04
_0222ABAC:
	mov r0, #0
	pop {r4, pc}
_0222ABB0:
	add r1, r4, #0
	add r1, #0x88
	ldr r1, [r1]
	cmp r1, #0
	beq _0222ABCE
	blx r1
	cmp r0, #1
	bne _0222ABCA
	mov r0, #1
	strb r0, [r4, #0x19]
	mov r0, #0
	add r4, #0x88
	str r0, [r4]
_0222ABCA:
	mov r0, #1
	pop {r4, pc}
_0222ABCE:
	mov r0, #1
	strb r0, [r4, #0x19]
_0222ABD2:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	bne _0222ABDE
	mov r0, #0
	strb r0, [r4, #0x19]
	pop {r4, pc}
_0222ABDE:
	add r0, r4, #0
	bl ov80_0222AC58
	add r1, r0, #0
	ldr r0, [r4, #0x74]
	cmp r1, r0
	blo _0222ABF6
	bl GF_AssertFail
	mov r0, #0
	strb r0, [r4, #0x19]
	pop {r4, pc}
_0222ABF6:
	ldr r2, [r4, #0x70]
	lsl r1, r1, #2
	ldr r1, [r2, r1]
	add r0, r4, #0
	blx r1
	cmp r0, #1
	bne _0222ABD2
_0222AC04:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov80_0222AB98

	thumb_func_start ov80_0222AC08
ov80_0222AC08: ; 0x0222AC08
	ldrb r3, [r0, #0x18]
	add r2, r3, #1
	cmp r2, #0x14
	blt _0222AC14
	mov r0, #1
	bx lr
_0222AC14:
	lsl r2, r3, #2
	add r2, r0, r2
	str r1, [r2, #0x20]
	ldrb r1, [r0, #0x18]
	add r1, r1, #1
	strb r1, [r0, #0x18]
	mov r0, #0
	bx lr
	thumb_func_end ov80_0222AC08

	thumb_func_start ov80_0222AC24
ov80_0222AC24: ; 0x0222AC24
	ldrb r1, [r0, #0x18]
	cmp r1, #0
	bne _0222AC2E
	mov r0, #0
	bx lr
_0222AC2E:
	sub r1, r1, #1
	strb r1, [r0, #0x18]
	ldrb r1, [r0, #0x18]
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end ov80_0222AC24

	thumb_func_start ov80_0222AC3C
ov80_0222AC3C: ; 0x0222AC3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5, #0x1c]
	bl ov80_0222AC08
	str r4, [r5, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222AC3C

	thumb_func_start ov80_0222AC4C
ov80_0222AC4C: ; 0x0222AC4C
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC24
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov80_0222AC4C

	thumb_func_start ov80_0222AC58
ov80_0222AC58: ; 0x0222AC58
	ldr r1, [r0, #0x1c]
	add r3, r1, #1
	str r3, [r0, #0x1c]
	ldrb r2, [r1]
	add r1, r3, #1
	str r1, [r0, #0x1c]
	ldrb r0, [r3]
	lsl r0, r0, #8
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end ov80_0222AC58

	thumb_func_start ov80_0222AC70
ov80_0222AC70: ; 0x0222AC70
	push {r4, r5}
	ldr r1, [r0, #0x1c]
	add r2, r1, #1
	str r2, [r0, #0x1c]
	ldrb r3, [r1]
	add r1, r2, #1
	add r5, r1, #1
	str r1, [r0, #0x1c]
	ldrb r2, [r2]
	add r4, r5, #1
	str r5, [r0, #0x1c]
	ldrb r1, [r1]
	str r4, [r0, #0x1c]
	ldrb r0, [r5]
	mov r4, #0
	add r0, r4, r0
	lsl r0, r0, #8
	add r0, r0, r1
	lsl r0, r0, #8
	add r0, r0, r2
	lsl r0, r0, #8
	add r0, r0, r3
	pop {r4, r5}
	bx lr
	thumb_func_end ov80_0222AC70

	thumb_func_start ov80_0222ACA0
ov80_0222ACA0: ; 0x0222ACA0
	push {r3, lr}
	cmp r1, #0xd
	bhi _0222AD5A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222ACB2: ; jump table
	.short _0222ACCE - _0222ACB2 - 2 ; case 0
	.short _0222ACD8 - _0222ACB2 - 2 ; case 1
	.short _0222ACE2 - _0222ACB2 - 2 ; case 2
	.short _0222ACEC - _0222ACB2 - 2 ; case 3
	.short _0222ACF6 - _0222ACB2 - 2 ; case 4
	.short _0222AD00 - _0222ACB2 - 2 ; case 5
	.short _0222AD0A - _0222ACB2 - 2 ; case 6
	.short _0222AD14 - _0222ACB2 - 2 ; case 7
	.short _0222AD1E - _0222ACB2 - 2 ; case 8
	.short _0222AD28 - _0222ACB2 - 2 ; case 9
	.short _0222AD32 - _0222ACB2 - 2 ; case 10
	.short _0222AD3C - _0222ACB2 - 2 ; case 11
	.short _0222AD46 - _0222ACB2 - 2 ; case 12
	.short _0222AD50 - _0222ACB2 - 2 ; case 13
_0222ACCE:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD64 ; =ov80_0223B724
	ldr r0, [r0, r1]
	pop {r3, pc}
_0222ACD8:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD68 ; =ov80_0223B730
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222ACE2:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD6C ; =ov80_0223B732
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222ACEC:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD70 ; =ov80_0223B734
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222ACF6:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD74 ; =ov80_0223B736
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD00:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD78 ; =ov80_0223B738
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD0A:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD7C ; =ov80_0223B73A
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD14:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD80 ; =ov80_0223B73C
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD1E:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD84 ; =ov80_0223B73E
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD28:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD88 ; =ov80_0223B740
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD32:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD8C ; =ov80_0223B742
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD3C:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD90 ; =ov80_0223B744
	ldrh r0, [r0, r1]
	pop {r3, pc}
_0222AD46:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD94 ; =ov80_0223B746
	ldrb r0, [r0, r1]
	pop {r3, pc}
_0222AD50:
	mov r1, #0x28
	mul r1, r0
	ldr r0, _0222AD98 ; =ov80_0223B747
	ldrb r0, [r0, r1]
	pop {r3, pc}
_0222AD5A:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	nop
_0222AD64: .word ov80_0223B724
_0222AD68: .word ov80_0223B730
_0222AD6C: .word ov80_0223B732
_0222AD70: .word ov80_0223B734
_0222AD74: .word ov80_0223B736
_0222AD78: .word ov80_0223B738
_0222AD7C: .word ov80_0223B73A
_0222AD80: .word ov80_0223B73C
_0222AD84: .word ov80_0223B73E
_0222AD88: .word ov80_0223B740
_0222AD8C: .word ov80_0223B742
_0222AD90: .word ov80_0223B744
_0222AD94: .word ov80_0223B746
_0222AD98: .word ov80_0223B747
	thumb_func_end ov80_0222ACA0

	thumb_func_start ov80_0222AD9C
ov80_0222AD9C: ; 0x0222AD9C
	push {r3, lr}
	mov r3, #0x28
	mul r3, r2
	ldr r2, _0222ADB0 ; =ov80_0223B728
	ldr r2, [r2, r3]
	cmp r2, #0
	beq _0222ADAC
	blx r2
_0222ADAC:
	pop {r3, pc}
	nop
_0222ADB0: .word ov80_0223B728
	thumb_func_end ov80_0222AD9C

	thumb_func_start ov80_0222ADB4
ov80_0222ADB4: ; 0x0222ADB4
	push {r3, lr}
	mov r3, #0x28
	mul r3, r2
	ldr r2, _0222ADC8 ; =ov80_0223B72C
	ldr r2, [r2, r3]
	cmp r2, #0
	beq _0222ADC4
	blx r2
_0222ADC4:
	pop {r3, pc}
	nop
_0222ADC8: .word ov80_0223B72C
	thumb_func_end ov80_0222ADB4

	thumb_func_start ov80_0222ADCC
ov80_0222ADCC: ; 0x0222ADCC
	push {r4, lr}
	add r4, r1, #0
	mov r0, #0x65
	mov r1, #0x20
	bl AllocFromHeap
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov80_0222ADCC

	thumb_func_start ov80_0222ADDC
ov80_0222ADDC: ; 0x0222ADDC
	ldr r3, _0222ADE4 ; =FreeToHeap
	ldr r0, [r1]
	bx r3
	nop
_0222ADE4: .word FreeToHeap
	thumb_func_end ov80_0222ADDC

	thumb_func_start ov80_0222ADE8
ov80_0222ADE8: ; 0x0222ADE8
	push {r4, lr}
	add r2, r0, #0
	add r4, r1, #0
	ldr r0, [r2]
	ldr r1, [r2, #4]
	bl ov80_02239D74
	str r0, [r4]
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #2
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222ADE8

	thumb_func_start ov80_0222AE1C
ov80_0222AE1C: ; 0x0222AE1C
	ldr r3, _0222AE24 ; =ov80_02239DB8
	ldr r0, [r1]
	bx r3
	nop
_0222AE24: .word ov80_02239DB8
	thumb_func_end ov80_0222AE1C

	thumb_func_start ov80_0222AE28
ov80_0222AE28: ; 0x0222AE28
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AE28

	thumb_func_start ov80_0222AE2C
ov80_0222AE2C: ; 0x0222AE2C
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AE2C

	thumb_func_start ov80_0222AE30
ov80_0222AE30: ; 0x0222AE30
	push {r3, lr}
	mov r0, #0
	mov r1, #1
	bl SetBgPriority
	mov r0, #2
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	add r1, r0, #0
	bl SetBgPriority
	mov r3, #0x14
	ldr r0, _0222AE64 ; =0x04000050
	mov r1, #1
	mov r2, #0x3c
	str r3, [sp]
	bl G2x_SetBlendAlpha_
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	pop {r3, pc}
	nop
_0222AE64: .word 0x04000050
	thumb_func_end ov80_0222AE30

	thumb_func_start ov80_0222AE68
ov80_0222AE68: ; 0x0222AE68
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AE68

	thumb_func_start ov80_0222AE6C
ov80_0222AE6C: ; 0x0222AE6C
	push {r3, lr}
	mov r0, #2
	mov r1, #3
	bl SetBgPriority
	mov r0, #3
	mov r1, #2
	bl SetBgPriority
	pop {r3, pc}
	thumb_func_end ov80_0222AE6C

	thumb_func_start ov80_0222AE80
ov80_0222AE80: ; 0x0222AE80
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AE80

	thumb_func_start ov80_0222AE84
ov80_0222AE84: ; 0x0222AE84
	push {r3, lr}
	ldr r0, _0222AE98 ; =0x04000050
	mov r3, #0x14
	mov r1, #1
	mov r2, #0x3c
	str r3, [sp]
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	nop
_0222AE98: .word 0x04000050
	thumb_func_end ov80_0222AE84

	thumb_func_start ov80_0222AE9C
ov80_0222AE9C: ; 0x0222AE9C
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AE9C

	thumb_func_start ov80_0222AEA0
ov80_0222AEA0: ; 0x0222AEA0
	push {r4, lr}
	ldr r0, [r0]
	add r4, r1, #0
	bl ov80_022384D8
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222AEA0

	thumb_func_start ov80_0222AEB0
ov80_0222AEB0: ; 0x0222AEB0
	ldr r3, _0222AEB8 ; =ov80_022385B0
	ldr r0, [r1]
	bx r3
	nop
_0222AEB8: .word ov80_022385B0
	thumb_func_end ov80_0222AEB0

	thumb_func_start ov80_0222AEBC
ov80_0222AEBC: ; 0x0222AEBC
	push {r3, lr}
	mov r0, #1
	mov r1, #0
	bl SetBgPriority
	mov r0, #0
	mov r1, #2
	bl SetBgPriority
	mov r0, #2
	add r1, r0, #0
	bl SetBgPriority
	mov r0, #3
	add r1, r0, #0
	bl SetBgPriority
	mov r3, #0x14
	ldr r0, _0222AEF0 ; =0x04000050
	mov r1, #1
	mov r2, #0x3c
	str r3, [sp]
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	nop
_0222AEF0: .word 0x04000050
	thumb_func_end ov80_0222AEBC

	thumb_func_start ov80_0222AEF4
ov80_0222AEF4: ; 0x0222AEF4
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AEF4

	thumb_func_start ov80_0222AEF8
ov80_0222AEF8: ; 0x0222AEF8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xd9
	lsl r0, r0, #4
	ldrb r1, [r3, r0]
	add r1, r1, #1
	strb r1, [r3, r0]
	bl sub_0203769C
	cmp r4, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222AEF8

	thumb_func_start ov80_0222AF10
ov80_0222AF10: ; 0x0222AF10
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222AF34 ; =0x000006FC
	ldr r0, [r4, r0]
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, _0222AF38 ; =0x0000072C
	mov r0, #0x22
	add r1, r4, r1
	mov r2, #0x2c
	bl sub_02037030
	cmp r0, #1
	bne _0222AF30
	mov r0, #1
	pop {r4, pc}
_0222AF30:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222AF34: .word 0x000006FC
_0222AF38: .word 0x0000072C
	thumb_func_end ov80_0222AF10

	thumb_func_start ov80_0222AF3C
ov80_0222AF3C: ; 0x0222AF3C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xd9
	lsl r0, r0, #4
	ldrb r1, [r3, r0]
	add r1, r1, #1
	strb r1, [r3, r0]
	bl sub_0203769C
	cmp r4, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222AF3C

	thumb_func_start ov80_0222AF54
ov80_0222AF54: ; 0x0222AF54
	push {r4, lr}
	ldr r1, _0222AF80 ; =0x0000072C
	mov r3, #0
	add r1, r0, r1
	add r4, r1, #0
_0222AF5E:
	ldrh r2, [r0, #0x18]
	add r3, r3, #1
	add r0, r0, #2
	strh r2, [r4]
	add r4, r4, #2
	cmp r3, #0x14
	blt _0222AF5E
	mov r0, #0x23
	mov r2, #0x2c
	bl sub_02037030
	cmp r0, #1
	bne _0222AF7C
	mov r0, #1
	pop {r4, pc}
_0222AF7C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222AF80: .word 0x0000072C
	thumb_func_end ov80_0222AF54

	thumb_func_start ov80_0222AF84
ov80_0222AF84: ; 0x0222AF84
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0xd9
	add r4, r3, #0
	lsl r0, r0, #4
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222AFB6
	bl sub_0203769C
	cmp r0, #0
	beq _0222AFB6
	mov r1, #0
_0222AFA8:
	ldrh r0, [r5]
	add r1, r1, #1
	add r5, r5, #2
	strh r0, [r4, #0x18]
	add r4, r4, #2
	cmp r1, #0x14
	blt _0222AFA8
_0222AFB6:
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222AF84

	thumb_func_start ov80_0222AFB8
ov80_0222AFB8: ; 0x0222AFB8
	push {r3, r4, r5, lr}
	ldr r1, _0222AFE8 ; =0x0000072C
	mov r2, #0x9a
	add r1, r0, r1
	mov r4, #0
	add r5, r1, #0
	lsl r2, r2, #2
_0222AFC6:
	ldrh r3, [r0, r2]
	add r4, r4, #1
	add r0, r0, #2
	strh r3, [r5]
	add r5, r5, #2
	cmp r4, #0x14
	blt _0222AFC6
	mov r0, #0x24
	mov r2, #0x2c
	bl sub_02037030
	cmp r0, #1
	bne _0222AFE4
	mov r0, #1
	pop {r3, r4, r5, pc}
_0222AFE4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222AFE8: .word 0x0000072C
	thumb_func_end ov80_0222AFB8

	thumb_func_start ov80_0222AFEC
ov80_0222AFEC: ; 0x0222AFEC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0xd9
	add r4, r3, #0
	lsl r0, r0, #4
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222B022
	bl sub_0203769C
	cmp r0, #0
	beq _0222B022
	mov r0, #0x9a
	mov r2, #0
	lsl r0, r0, #2
_0222B014:
	ldrh r1, [r5]
	add r2, r2, #1
	add r5, r5, #2
	strh r1, [r4, r0]
	add r4, r4, #2
	cmp r2, #0x14
	blt _0222B014
_0222B022:
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222AFEC

	thumb_func_start ov80_0222B024
ov80_0222B024: ; 0x0222B024
	push {r3, lr}
	ldr r2, _0222B044 ; =0x0000072C
	add r3, r0, #0
	strh r1, [r3, r2]
	add r1, r3, r2
	mov r0, #0x25
	mov r2, #0x2c
	bl sub_02037030
	cmp r0, #1
	bne _0222B03E
	mov r0, #1
	pop {r3, pc}
_0222B03E:
	mov r0, #0
	pop {r3, pc}
	nop
_0222B044: .word 0x0000072C
	thumb_func_end ov80_0222B024

	thumb_func_start ov80_0222B048
ov80_0222B048: ; 0x0222B048
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0xd9
	add r4, r3, #0
	lsl r0, r0, #4
	ldrb r1, [r4, r0]
	add r6, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r5, r0
	beq _0222B068
	ldrh r1, [r6]
	ldr r0, _0222B06C ; =0x00000D88
	strb r1, [r4, r0]
_0222B068:
	pop {r4, r5, r6, pc}
	nop
_0222B06C: .word 0x00000D88
	thumb_func_end ov80_0222B048

	thumb_func_start ov80_0222B070
ov80_0222B070: ; 0x0222B070
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl SizeOfStructPokemon
	add r4, r0, #0
	ldr r0, _0222B0B0 ; =0x000006FC
	ldr r0, [r5, r0]
	bl SavArray_PlayerParty_get
	mov r1, #0x26
	lsl r1, r1, #4
	ldrb r1, [r5, r1]
	bl GetPartyMonByIndex
	ldr r1, _0222B0B4 ; =0x00000784
	add r2, r4, #0
	add r1, r5, r1
	bl MI_CpuCopy8
	ldr r1, _0222B0B4 ; =0x00000784
	mov r2, #2
	mov r0, #0x26
	add r1, r5, r1
	lsl r2, r2, #8
	bl sub_02036FD8
	cmp r0, #1
	bne _0222B0AC
	mov r0, #1
	pop {r3, r4, r5, pc}
_0222B0AC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222B0B0: .word 0x000006FC
_0222B0B4: .word 0x00000784
	thumb_func_end ov80_0222B070

	thumb_func_start ov80_0222B0B8
ov80_0222B0B8: ; 0x0222B0B8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0xd9
	add r4, r3, #0
	lsl r0, r0, #4
	ldrb r1, [r4, r0]
	add r6, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r5, r0
	beq _0222B0E2
	bl SizeOfStructPokemon
	ldr r1, _0222B0E4 ; =0x00000D8C
	add r2, r0, #0
	ldr r1, [r4, r1]
	add r0, r6, #0
	bl MI_CpuCopy8
_0222B0E2:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222B0E4: .word 0x00000D8C
	thumb_func_end ov80_0222B0B8

	thumb_func_start ov80_0222B0E8
ov80_0222B0E8: ; 0x0222B0E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #2
	lsl r0, r0, #8
	add r4, r1, #0
	cmp r2, r0
	ble _0222B0FA
	bl GF_AssertFail
_0222B0FA:
	ldr r0, _0222B104 ; =0x00000984
	add r1, r4, r0
	lsl r0, r5, #9
	add r0, r1, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222B104: .word 0x00000984
	thumb_func_end ov80_0222B0E8

	thumb_func_start ov80_0222B108
ov80_0222B108: ; 0x0222B108
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0222B13C ; =0x00000504
	add r4, r5, r0
	sub r0, #0xc
	ldr r0, [r5, r0]
	bl Sav2_PlayerData_GetProfileAddr
	ldrh r0, [r5, #8]
	add r1, r4, #0
	mov r2, #0x3c
	strh r0, [r4, #2]
	ldrh r0, [r5, #0xc]
	strh r0, [r4, #4]
	ldrh r0, [r5, #0xe]
	strh r0, [r4, #6]
	mov r0, #0x16
	bl sub_02037030
	cmp r0, #1
	bne _0222B136
	mov r0, #1
	pop {r3, r4, r5, pc}
_0222B136:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222B13C: .word 0x00000504
	thumb_func_end ov80_0222B108

	thumb_func_start ov80_0222B140
ov80_0222B140: ; 0x0222B140
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _0222B170 ; =0x00000702
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222B16C
	ldrh r1, [r5, #2]
	mov r0, #0x16
	lsl r0, r0, #6
	strh r1, [r4, r0]
	ldrh r2, [r5, #4]
	add r1, r0, #2
	sub r0, r0, #2
	strh r2, [r4, r1]
	ldrh r1, [r5, #6]
	strh r1, [r4, r0]
_0222B16C:
	pop {r4, r5, r6, pc}
	nop
_0222B170: .word 0x00000702
	thumb_func_end ov80_0222B140

	thumb_func_start ov80_0222B174
ov80_0222B174: ; 0x0222B174
	push {r4, lr}
	ldr r1, _0222B1A0 ; =0x00000504
	mov r3, #0
	add r1, r0, r1
	add r4, r1, #0
_0222B17E:
	ldrh r2, [r0, #0x18]
	add r3, r3, #1
	add r0, r0, #2
	strh r2, [r4]
	add r4, r4, #2
	cmp r3, #0xe
	blt _0222B17E
	mov r0, #0x17
	mov r2, #0x3c
	bl sub_02037030
	cmp r0, #1
	bne _0222B19C
	mov r0, #1
	pop {r4, pc}
_0222B19C:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222B1A0: .word 0x00000504
	thumb_func_end ov80_0222B174

	thumb_func_start ov80_0222B1A4
ov80_0222B1A4: ; 0x0222B1A4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _0222B1D8 ; =0x00000702
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222B1D4
	bl sub_0203769C
	cmp r0, #0
	beq _0222B1D4
	mov r1, #0
_0222B1C6:
	ldrh r0, [r5]
	add r1, r1, #1
	add r5, r5, #2
	strh r0, [r4, #0x18]
	add r4, r4, #2
	cmp r1, #0xe
	blt _0222B1C6
_0222B1D4:
	pop {r4, r5, r6, pc}
	nop
_0222B1D8: .word 0x00000702
	thumb_func_end ov80_0222B1A4

	thumb_func_start ov80_0222B1DC
ov80_0222B1DC: ; 0x0222B1DC
	push {r4, r5, r6, lr}
	ldr r1, _0222B240 ; =0x00000504
	ldr r2, _0222B244 ; =0x00000584
	add r1, r0, r1
	mov r4, #0
	add r5, r0, #0
	add r6, r1, #0
_0222B1EA:
	ldrh r3, [r5, r2]
	add r4, r4, #1
	add r5, r5, #2
	strh r3, [r6]
	add r6, r6, #2
	cmp r4, #6
	blt _0222B1EA
	mov r2, #0x59
	mov r5, #0
	add r4, r1, #0
	lsl r2, r2, #4
_0222B200:
	add r3, r0, r5
	ldrb r3, [r3, r2]
	add r5, r5, #1
	strh r3, [r4, #0xc]
	add r4, r4, #2
	cmp r5, #6
	blt _0222B200
	ldr r4, _0222B248 ; =0x00000598
	add r2, r1, #0
	mov r3, #0
	add r2, #0x18
	add r5, r4, #0
_0222B218:
	ldr r6, [r0, r4]
	add r3, r3, #1
	strh r6, [r2]
	ldr r6, [r0, r5]
	add r0, r0, #4
	lsr r6, r6, #0x10
	strh r6, [r2, #0xc]
	add r2, r2, #2
	cmp r3, #6
	blt _0222B218
	mov r0, #0x18
	mov r2, #0x3c
	bl sub_02037030
	cmp r0, #1
	bne _0222B23C
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222B23C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222B240: .word 0x00000504
_0222B244: .word 0x00000584
_0222B248: .word 0x00000598
	thumb_func_end ov80_0222B1DC

	thumb_func_start ov80_0222B24C
ov80_0222B24C: ; 0x0222B24C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0222B2C0 ; =0x00000702
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222B2BE
	bl sub_0203769C
	cmp r0, #0
	beq _0222B2BE
	mov r0, #0x95
	mov r2, #0
	add r3, r5, #0
	add r6, r4, #0
	lsl r0, r0, #2
_0222B276:
	ldrh r1, [r3]
	add r2, r2, #1
	add r3, r3, #2
	strh r1, [r6, r0]
	add r6, r6, #2
	cmp r2, #6
	blt _0222B276
	mov r0, #0x26
	mov r6, #0
	add r3, r5, #0
	lsl r0, r0, #4
_0222B28C:
	ldrh r2, [r3, #0xc]
	add r1, r4, r6
	add r6, r6, #1
	add r3, r3, #2
	strb r2, [r1, r0]
	cmp r6, #6
	blt _0222B28C
	mov r2, #0x9a
	lsl r2, r2, #2
	mov r1, #0
	add r5, #0x18
	add r3, r2, #0
	add r6, r2, #0
_0222B2A6:
	ldrh r0, [r5]
	add r1, r1, #1
	str r0, [r4, r2]
	ldrh r7, [r5, #0xc]
	ldr r0, [r4, r3]
	add r5, r5, #2
	lsl r7, r7, #0x10
	orr r0, r7
	str r0, [r4, r6]
	add r4, r4, #4
	cmp r1, #6
	blt _0222B2A6
_0222B2BE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B2C0: .word 0x00000702
	thumb_func_end ov80_0222B24C

	thumb_func_start ov80_0222B2C4
ov80_0222B2C4: ; 0x0222B2C4
	push {r4, r5, r6, lr}
	ldr r1, _0222B328 ; =0x00000504
	ldr r2, _0222B32C ; =0x000003D2
	add r1, r0, r1
	mov r4, #0
	add r5, r0, #0
	add r6, r1, #0
_0222B2D2:
	ldrh r3, [r5, r2]
	add r4, r4, #1
	add r5, r5, #2
	strh r3, [r6]
	add r6, r6, #2
	cmp r4, #4
	blt _0222B2D2
	ldr r2, _0222B330 ; =0x000003DA
	mov r5, #0
	add r4, r1, #0
_0222B2E6:
	add r3, r0, r5
	ldrb r3, [r3, r2]
	add r5, r5, #1
	strh r3, [r4, #8]
	add r4, r4, #2
	cmp r5, #4
	blt _0222B2E6
	mov r4, #0x3e
	add r2, r1, #0
	lsl r4, r4, #4
	mov r3, #0
	add r2, #0x10
	add r5, r4, #0
_0222B300:
	ldr r6, [r0, r4]
	add r3, r3, #1
	strh r6, [r2]
	ldr r6, [r0, r5]
	add r0, r0, #4
	lsr r6, r6, #0x10
	strh r6, [r2, #8]
	add r2, r2, #2
	cmp r3, #4
	blt _0222B300
	mov r0, #0x19
	mov r2, #0x3c
	bl sub_02037030
	cmp r0, #1
	bne _0222B324
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222B324:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222B328: .word 0x00000504
_0222B32C: .word 0x000003D2
_0222B330: .word 0x000003DA
	thumb_func_end ov80_0222B2C4

	thumb_func_start ov80_0222B334
ov80_0222B334: ; 0x0222B334
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0222B3A4 ; =0x00000702
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222B3A2
	bl sub_0203769C
	cmp r0, #0
	beq _0222B3A2
	ldr r0, _0222B3A8 ; =0x000003D2
	mov r2, #0
	add r3, r5, #0
	add r6, r4, #0
_0222B35C:
	ldrh r1, [r3]
	add r2, r2, #1
	add r3, r3, #2
	strh r1, [r6, r0]
	add r6, r6, #2
	cmp r2, #4
	blt _0222B35C
	ldr r0, _0222B3AC ; =0x000003DA
	mov r6, #0
	add r3, r5, #0
_0222B370:
	ldrh r2, [r3, #8]
	add r1, r4, r6
	add r6, r6, #1
	add r3, r3, #2
	strb r2, [r1, r0]
	cmp r6, #4
	blt _0222B370
	mov r2, #0x3e
	lsl r2, r2, #4
	mov r1, #0
	add r5, #0x10
	add r3, r2, #0
	add r6, r2, #0
_0222B38A:
	ldrh r0, [r5]
	add r1, r1, #1
	str r0, [r4, r2]
	ldrh r7, [r5, #8]
	ldr r0, [r4, r3]
	add r5, r5, #2
	lsl r7, r7, #0x10
	orr r0, r7
	str r0, [r4, r6]
	add r4, r4, #4
	cmp r1, #4
	blt _0222B38A
_0222B3A2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B3A4: .word 0x00000702
_0222B3A8: .word 0x000003D2
_0222B3AC: .word 0x000003DA
	thumb_func_end ov80_0222B334

	thumb_func_start ov80_0222B3B0
ov80_0222B3B0: ; 0x0222B3B0
	push {r3, lr}
	ldr r2, _0222B3D0 ; =0x00000504
	add r3, r0, #0
	strh r1, [r3, r2]
	add r1, r3, r2
	mov r0, #0x1a
	mov r2, #0x3c
	bl sub_02037030
	cmp r0, #1
	bne _0222B3CA
	mov r0, #1
	pop {r3, pc}
_0222B3CA:
	mov r0, #0
	pop {r3, pc}
	nop
_0222B3D0: .word 0x00000504
	thumb_func_end ov80_0222B3B0

	thumb_func_start ov80_0222B3D4
ov80_0222B3D4: ; 0x0222B3D4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222B3F4 ; =0x00000702
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r6, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r5, r0
	beq _0222B3F2
	ldrh r1, [r6]
	ldr r0, _0222B3F8 ; =0x0000057C
	strb r1, [r4, r0]
_0222B3F2:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222B3F4: .word 0x00000702
_0222B3F8: .word 0x0000057C
	thumb_func_end ov80_0222B3D4

	thumb_func_start ov80_0222B3FC
ov80_0222B3FC: ; 0x0222B3FC
	push {r3, lr}
	ldr r2, _0222B41C ; =0x00000504
	add r3, r0, #0
	strh r1, [r3, r2]
	add r1, r3, r2
	mov r0, #0x1b
	mov r2, #0x3c
	bl sub_02037030
	cmp r0, #1
	bne _0222B416
	mov r0, #1
	pop {r3, pc}
_0222B416:
	mov r0, #0
	pop {r3, pc}
	nop
_0222B41C: .word 0x00000504
	thumb_func_end ov80_0222B3FC

	thumb_func_start ov80_0222B420
ov80_0222B420: ; 0x0222B420
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222B440 ; =0x00000702
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r6, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r5, r0
	beq _0222B43E
	ldrh r1, [r6]
	ldr r0, _0222B444 ; =0x0000057D
	strb r1, [r4, r0]
_0222B43E:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222B440: .word 0x00000702
_0222B444: .word 0x0000057D
	thumb_func_end ov80_0222B420

	thumb_func_start ov80_0222B448
ov80_0222B448: ; 0x0222B448
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _0222B520 ; =0x00000504
	add r0, r5, r0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldrb r0, [r5, #4]
	bl ov80_02236DD4
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	cmp r4, #0
	ble _0222B49A
	add r7, sp, #0x10
	add r6, sp, #0x14
_0222B46C:
	ldr r0, _0222B524 ; =0x000004D4
	ldr r1, [sp, #8]
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	str r0, [sp, #0xc]
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	strb r0, [r7]
	mov r1, #0
	ldr r0, [sp, #0xc]
	add r2, r1, #0
	bl GetMonData
	stmia r6!, {r0}
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, r4
	blt _0222B46C
_0222B49A:
	mov r3, #0
	cmp r4, #0
	ble _0222B4B2
	ldr r2, [sp]
	ldr r0, _0222B528 ; =0x000004E8
_0222B4A4:
	ldrh r1, [r5, r0]
	add r3, r3, #1
	add r5, r5, #2
	strh r1, [r2]
	add r2, r2, #2
	cmp r3, r4
	blt _0222B4A4
_0222B4B2:
	ldr r0, [sp, #4]
	add r0, r0, r4
	str r0, [sp, #4]
	mov r0, #0
	cmp r4, #0
	ble _0222B4D6
	ldr r1, [sp, #4]
	add r3, sp, #0x10
	lsl r2, r1, #1
	ldr r1, [sp]
	add r2, r1, r2
_0222B4C8:
	ldrb r1, [r3]
	add r0, r0, #1
	add r3, r3, #1
	strh r1, [r2]
	add r2, r2, #2
	cmp r0, r4
	blt _0222B4C8
_0222B4D6:
	ldr r0, [sp, #4]
	mov r3, #0
	add r0, r0, r4
	cmp r4, #0
	ble _0222B506
	ldr r5, [sp]
	lsl r6, r4, #1
	ldr r2, [sp]
	lsl r0, r0, #1
	add r5, r5, r6
	add r2, r2, r0
	add r1, sp, #0x14
	add r0, r5, r0
_0222B4F0:
	ldr r5, [r1]
	add r3, r3, #1
	strh r5, [r2]
	ldr r5, [r1]
	add r1, r1, #4
	lsr r5, r5, #0x10
	strh r5, [r0]
	add r2, r2, #2
	add r0, r0, #2
	cmp r3, r4
	blt _0222B4F0
_0222B506:
	ldr r1, [sp]
	mov r0, #0x1c
	mov r2, #0x3c
	bl sub_02037030
	cmp r0, #1
	bne _0222B51A
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0222B51A:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B520: .word 0x00000504
_0222B524: .word 0x000004D4
_0222B528: .word 0x000004E8
	thumb_func_end ov80_0222B448

	thumb_func_start ov80_0222B52C
ov80_0222B52C: ; 0x0222B52C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0222B5BC ; =0x00000702
	add r4, r3, #0
	ldrb r1, [r4, r0]
	str r2, [sp]
	mov r7, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r5, r0
	beq _0222B5B8
	ldrb r0, [r4, #4]
	bl ov80_02236DD4
	add r3, r7, #0
	cmp r0, #0
	ble _0222B566
	ldr r5, [sp]
	ldr r1, _0222B5C0 ; =0x00000584
	add r6, r4, #0
_0222B558:
	ldrh r2, [r5]
	add r3, r3, #1
	add r5, r5, #2
	strh r2, [r6, r1]
	add r6, r6, #2
	cmp r3, r0
	blt _0222B558
_0222B566:
	add r7, r7, r0
	mov r6, #0
	cmp r0, #0
	ble _0222B586
	ldr r1, [sp]
	lsl r2, r7, #1
	add r5, r1, r2
	mov r1, #0x59
	lsl r1, r1, #4
_0222B578:
	ldrh r3, [r5]
	add r2, r4, r6
	add r6, r6, #1
	strb r3, [r2, r1]
	add r5, r5, #2
	cmp r6, r0
	blt _0222B578
_0222B586:
	add r2, r7, r0
	mov r1, #0
	cmp r0, #0
	ble _0222B5B8
	ldr r3, [sp]
	lsl r2, r2, #1
	lsl r6, r0, #1
	add r5, r3, r2
	add r3, r3, r6
	add r6, r3, r2
	ldr r2, _0222B5C4 ; =0x00000598
_0222B59C:
	ldrh r7, [r5]
	ldr r3, _0222B5C4 ; =0x00000598
	add r1, r1, #1
	str r7, [r4, r3]
	ldrh r7, [r6]
	ldr r3, [r4, r3]
	add r5, r5, #2
	lsl r7, r7, #0x10
	orr r3, r7
	str r3, [r4, r2]
	add r4, r4, #4
	add r6, r6, #2
	cmp r1, r0
	blt _0222B59C
_0222B5B8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222B5BC: .word 0x00000702
_0222B5C0: .word 0x00000584
_0222B5C4: .word 0x00000598
	thumb_func_end ov80_0222B52C

	thumb_func_start ov80_0222B5C8
ov80_0222B5C8: ; 0x0222B5C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	bl sub_02030E08
	ldrh r1, [r5, #0x14]
	ldr r0, _0222B620 ; =0x000003C2
	strh r1, [r5, r0]
	ldrh r1, [r5, #0x16]
	add r0, r0, #2
	strh r1, [r5, r0]
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r4, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	ldr r1, _0222B624 ; =0x000003D6
	mov r2, #0x28
	strh r0, [r5, r1]
	sub r1, #0x16
	mov r0, #0x2a
	add r1, r5, r1
	bl sub_02037030
	cmp r0, #1
	bne _0222B61A
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222B61A:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_0222B620: .word 0x000003C2
_0222B624: .word 0x000003D6
	thumb_func_end ov80_0222B5C8

	thumb_func_start ov80_0222B628
ov80_0222B628: ; 0x0222B628
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _0222B654 ; =0x00000A1A
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222B652
	ldrh r1, [r5, #2]
	ldr r0, _0222B658 ; =0x00000A16
	strh r1, [r4, r0]
	ldrh r2, [r5, #4]
	sub r1, r0, #4
	add r0, r0, #6
	strh r2, [r4, r1]
	ldrh r1, [r5, #0x16]
	strh r1, [r4, r0]
_0222B652:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222B654: .word 0x00000A1A
_0222B658: .word 0x00000A16
	thumb_func_end ov80_0222B628

	thumb_func_start ov80_0222B65C
ov80_0222B65C: ; 0x0222B65C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xf
	mov r2, #0
	add r3, r4, #0
	lsl r0, r0, #6
_0222B668:
	ldrh r1, [r3, #0x30]
	add r2, r2, #1
	strh r1, [r3, r0]
	add r3, r3, #2
	cmp r2, #0xe
	blt _0222B668
	mov r1, #0xf
	lsl r1, r1, #6
	mov r0, #0x2b
	add r1, r4, r1
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _0222B68A
	mov r0, #1
	pop {r4, pc}
_0222B68A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222B65C

	thumb_func_start ov80_0222B690
ov80_0222B690: ; 0x0222B690
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _0222B6C4 ; =0x00000A1A
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222B6C0
	bl sub_0203769C
	cmp r0, #0
	beq _0222B6C0
	mov r1, #0
_0222B6B2:
	ldrh r0, [r5]
	add r1, r1, #1
	add r5, r5, #2
	strh r0, [r4, #0x30]
	add r4, r4, #2
	cmp r1, #0xe
	blt _0222B6B2
_0222B6C0:
	pop {r4, r5, r6, pc}
	nop
_0222B6C4: .word 0x00000A1A
	thumb_func_end ov80_0222B690

	thumb_func_start ov80_0222B6C8
ov80_0222B6C8: ; 0x0222B6C8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222B734 ; =0x00000A18
	ldrb r1, [r4, r0]
	mov r0, #0xf
	lsl r0, r0, #6
	strh r1, [r4, r0]
	bl sub_0203769C
	cmp r0, #0
	ldr r1, _0222B738 ; =0x00000A1B
	bne _0222B700
	ldrb r0, [r4, r1]
	cmp r0, #0
	bne _0222B6EE
	sub r0, r1, #3
	ldrb r0, [r4, r0]
	strb r0, [r4, r1]
	b _0222B712
_0222B6EE:
	sub r0, r0, #6
	cmp r0, #4
	bne _0222B712
	sub r0, r1, #3
	ldrb r0, [r4, r0]
	cmp r0, #4
	beq _0222B712
	strb r0, [r4, r1]
	b _0222B712
_0222B700:
	ldrb r0, [r4, r1]
	cmp r0, #4
	bne _0222B712
	sub r0, r1, #3
	ldrb r0, [r4, r0]
	cmp r0, #4
	beq _0222B712
	add r0, r0, #6
	strb r0, [r4, r1]
_0222B712:
	ldr r0, _0222B738 ; =0x00000A1B
	ldr r1, _0222B73C ; =0x000003C2
	ldrb r0, [r4, r0]
	mov r2, #0x28
	strh r0, [r4, r1]
	sub r1, r1, #2
	mov r0, #0x2c
	add r1, r4, r1
	bl sub_02037030
	cmp r0, #1
	bne _0222B72E
	mov r0, #1
	pop {r4, pc}
_0222B72E:
	mov r0, #0
	pop {r4, pc}
	nop
_0222B734: .word 0x00000A18
_0222B738: .word 0x00000A1B
_0222B73C: .word 0x000003C2
	thumb_func_end ov80_0222B6C8

	thumb_func_start ov80_0222B740
ov80_0222B740: ; 0x0222B740
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _0222B7D4 ; =0x00000A1A
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222B7D2
	ldrh r1, [r5]
	ldr r0, _0222B7D8 ; =0x00000A19
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r0, #0
	bne _0222B7A4
	ldr r1, _0222B7DC ; =0x00000A1B
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0222B78A
	cmp r0, #4
	bne _0222B7D2
	sub r0, r1, #2
	ldrb r0, [r4, r0]
	cmp r0, #4
	beq _0222B7D2
	add r2, r0, #6
	sub r0, r1, #3
	strb r2, [r4, r0]
	sub r0, r1, #2
	ldrb r0, [r4, r0]
	add r0, r0, #6
	strb r0, [r4, r1]
	pop {r4, r5, r6, pc}
_0222B78A:
	sub r0, r1, #2
	ldrb r0, [r4, r0]
	add r0, r0, #6
	strb r0, [r4, r1]
	sub r0, r1, #2
	ldrb r0, [r4, r0]
	cmp r0, #4
	beq _0222B7D2
	add r0, r1, #5
	ldr r2, _0222B7E0 ; =0x0000EEDD
	ldr r0, [r4, r0]
	strh r2, [r0]
	pop {r4, r5, r6, pc}
_0222B7A4:
	ldrh r1, [r5, #2]
	ldr r0, _0222B7DC ; =0x00000A1B
	strb r1, [r4, r0]
	ldrb r1, [r4, r0]
	cmp r1, #4
	beq _0222B7B8
	add r0, r0, #5
	ldr r1, _0222B7E0 ; =0x0000EEDD
	ldr r0, [r4, r0]
	strh r1, [r0]
_0222B7B8:
	ldr r1, _0222B7D8 ; =0x00000A19
	ldrb r0, [r4, r1]
	cmp r0, #4
	bne _0222B7D2
	sub r0, r1, #1
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _0222B7D2
	cmp r0, #4
	beq _0222B7D2
	add r2, r0, #6
	add r0, r1, #2
	strb r2, [r4, r0]
_0222B7D2:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222B7D4: .word 0x00000A1A
_0222B7D8: .word 0x00000A19
_0222B7DC: .word 0x00000A1B
_0222B7E0: .word 0x0000EEDD
	thumb_func_end ov80_0222B740

	thumb_func_start ov80_0222B7E4
ov80_0222B7E4: ; 0x0222B7E4
	push {r3, r4, r5, r6, r7, lr}
	add r3, r0, #0
	mov r0, #0x9b
	mov r1, #0xf
	mov r4, #0
	add r5, r3, #0
	lsl r0, r0, #2
	lsl r1, r1, #6
_0222B7F4:
	ldrh r2, [r5, r0]
	add r4, r4, #1
	strh r2, [r5, r1]
	add r5, r5, #2
	cmp r4, #4
	blt _0222B7F4
	mov r0, #0x9d
	mov r1, #0xf2
	mov r5, #0
	add r4, r3, #0
	lsl r0, r0, #2
	lsl r1, r1, #2
_0222B80C:
	add r2, r3, r5
	ldrb r2, [r2, r0]
	add r5, r5, #1
	strh r2, [r4, r1]
	add r4, r4, #2
	cmp r5, #4
	blt _0222B80C
	mov r7, #0xf
	lsl r7, r7, #6
	add r1, r3, #0
	mov r5, #0x9e
	add r6, r7, #0
	mov r2, #0
	add r0, r3, #0
	add r1, #0x10
	lsl r5, r5, #2
	add r6, #8
_0222B82E:
	mov r4, #0x9e
	lsl r4, r4, #2
	ldr r4, [r0, r4]
	add r2, r2, #1
	strh r4, [r1, r7]
	ldr r4, [r0, r5]
	add r0, r0, #4
	lsr r4, r4, #0x10
	strh r4, [r1, r6]
	add r1, r1, #2
	cmp r2, #4
	blt _0222B82E
	mov r1, #0xf
	lsl r1, r1, #6
	mov r0, #0x2d
	add r1, r3, r1
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _0222B85C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222B85C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222B7E4

	thumb_func_start ov80_0222B860
ov80_0222B860: ; 0x0222B860
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0222B8D4 ; =0x00000A1A
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222B8D2
	bl sub_0203769C
	cmp r0, #0
	beq _0222B8D2
	mov r0, #0x9b
	mov r2, #0
	add r3, r5, #0
	add r6, r4, #0
	lsl r0, r0, #2
_0222B88A:
	ldrh r1, [r3]
	add r2, r2, #1
	add r3, r3, #2
	strh r1, [r6, r0]
	add r6, r6, #2
	cmp r2, #4
	blt _0222B88A
	mov r0, #0x9d
	mov r6, #0
	add r3, r5, #0
	lsl r0, r0, #2
_0222B8A0:
	ldrh r2, [r3, #8]
	add r1, r4, r6
	add r6, r6, #1
	add r3, r3, #2
	strb r2, [r1, r0]
	cmp r6, #4
	blt _0222B8A0
	mov r2, #0x9e
	lsl r2, r2, #2
	mov r1, #0
	add r5, #0x10
	add r3, r2, #0
	add r6, r2, #0
_0222B8BA:
	ldrh r0, [r5]
	add r1, r1, #1
	str r0, [r4, r2]
	ldrh r7, [r5, #8]
	ldr r0, [r4, r3]
	add r5, r5, #2
	lsl r7, r7, #0x10
	orr r0, r7
	str r0, [r4, r6]
	add r4, r4, #4
	cmp r1, #4
	blt _0222B8BA
_0222B8D2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B8D4: .word 0x00000A1A
	thumb_func_end ov80_0222B860

	thumb_func_start ov80_0222B8D8
ov80_0222B8D8: ; 0x0222B8D8
	push {r3, lr}
	mov r2, #0xf
	add r3, r0, #0
	lsl r2, r2, #6
	strh r1, [r3, r2]
	add r1, r3, r2
	mov r0, #0x2e
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _0222B8F4
	mov r0, #1
	pop {r3, pc}
_0222B8F4:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222B8D8

	thumb_func_start ov80_0222B8F8
ov80_0222B8F8: ; 0x0222B8F8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222B91C ; =0x00000A1A
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r6, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r5, r0
	beq _0222B918
	ldrh r1, [r6]
	mov r0, #0xa1
	lsl r0, r0, #4
	strb r1, [r4, r0]
_0222B918:
	pop {r4, r5, r6, pc}
	nop
_0222B91C: .word 0x00000A1A
	thumb_func_end ov80_0222B8F8

	thumb_func_start ov80_0222B920
ov80_0222B920: ; 0x0222B920
	push {r3, lr}
	mov r2, #0xf
	add r3, r0, #0
	lsl r2, r2, #6
	strh r1, [r3, r2]
	add r1, r3, r2
	mov r0, #0x2f
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _0222B93C
	mov r0, #1
	pop {r3, pc}
_0222B93C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222B920

	thumb_func_start ov80_0222B940
ov80_0222B940: ; 0x0222B940
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222B960 ; =0x00000A1A
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r6, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r5, r0
	beq _0222B95E
	ldrh r1, [r6]
	ldr r0, _0222B964 ; =0x00000A11
	strb r1, [r4, r0]
_0222B95E:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222B960: .word 0x00000A1A
_0222B964: .word 0x00000A11
	thumb_func_end ov80_0222B940

	thumb_func_start ov80_0222B968
ov80_0222B968: ; 0x0222B968
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	ldrb r0, [r7, #0x10]
	mov r1, #0
	bl ov80_02237B24
	str r0, [sp]
	bl SizeOfStructPokemon
	add r6, r0, #0
	ldr r0, [sp]
	mov r4, #0
	cmp r0, #0
	ble _0222B9AC
	mov r0, #0x41
	lsl r0, r0, #4
	add r0, r7, r0
	add r5, r4, #0
	str r0, [sp, #4]
_0222B990:
	ldr r0, [r7, #0x28]
	add r1, r4, #0
	bl GetPartyMonByIndex
	ldr r1, [sp, #4]
	add r2, r6, #0
	add r1, r1, r5
	bl MI_CpuCopy8
	ldr r0, [sp]
	add r4, r4, #1
	add r5, r5, r6
	cmp r4, r0
	blt _0222B990
_0222B9AC:
	mov r1, #0x41
	lsl r1, r1, #4
	mov r2, #2
	mov r0, #0x30
	add r1, r7, r1
	lsl r2, r2, #8
	bl sub_02036FD8
	cmp r0, #1
	bne _0222B9C6
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222B9C6:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222B968

	thumb_func_start ov80_0222B9CC
ov80_0222B9CC: ; 0x0222B9CC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _0222BA58 ; =0x00000A1A
	add r4, r0, #0
	add r0, r3, #0
	ldrb r0, [r0, r1]
	str r2, [sp]
	str r3, [sp, #4]
	add r2, r0, #1
	add r0, r3, #0
	strb r2, [r0, r1]
	bl sub_0203769C
	cmp r4, r0
	beq _0222BA54
	ldr r0, [sp, #4]
	mov r1, #0
	ldrb r0, [r0, #0x10]
	bl ov80_02237B24
	str r0, [sp, #8]
	bl SizeOfStructPokemon
	add r5, r0, #0
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	ldr r0, [sp, #8]
	mov r7, #0
	cmp r0, #0
	ble _0222BA2E
	add r4, r7, #0
_0222BA0E:
	ldr r0, [sp]
	add r1, r6, #0
	add r0, r0, r4
	add r2, r5, #0
	bl MI_CpuCopy8
	ldr r0, [sp, #4]
	add r1, r6, #0
	ldr r0, [r0, #0x28]
	bl AddMonToParty
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r4, r4, r5
	cmp r7, r0
	blt _0222BA0E
_0222BA2E:
	add r0, r6, #0
	bl FreeToHeap
	bl sub_0203769C
	cmp r0, #0
	beq _0222BA54
	ldr r0, [sp, #4]
	mov r1, #0
	ldr r0, [r0, #0x28]
	mov r2, #2
	bl Party_SwapSlots
	ldr r0, [sp, #4]
	mov r1, #1
	ldr r0, [r0, #0x28]
	mov r2, #3
	bl Party_SwapSlots
_0222BA54:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222BA58: .word 0x00000A1A
	thumb_func_end ov80_0222B9CC

	thumb_func_start ov80_0222BA5C
ov80_0222BA5C: ; 0x0222BA5C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #2
	lsl r0, r0, #8
	add r4, r1, #0
	cmp r2, r0
	ble _0222BA6E
	bl GF_AssertFail
_0222BA6E:
	mov r0, #0x61
	lsl r0, r0, #4
	add r1, r4, r0
	lsl r0, r5, #9
	add r0, r1, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BA5C

	thumb_func_start ov80_0222BA7C
ov80_0222BA7C: ; 0x0222BA7C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl sub_02030FA0
	ldrh r0, [r4, #0x18]
	ldr r1, _0222BAAC ; =0x00000426
	strh r0, [r4, r1]
	add r0, r1, #2
	ldrh r2, [r4, #0x1a]
	sub r1, r1, #2
	add r1, r4, r1
	strh r2, [r4, r0]
	mov r0, #0x41
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _0222BAA6
	mov r0, #1
	pop {r4, pc}
_0222BAA6:
	mov r0, #0
	pop {r4, pc}
	nop
_0222BAAC: .word 0x00000426
	thumb_func_end ov80_0222BA7C

	thumb_func_start ov80_0222BAB0
ov80_0222BAB0: ; 0x0222BAB0
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _0222BAD8 ; =0x00000A7C
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222BAD4
	ldrh r1, [r5, #2]
	ldr r0, _0222BADC ; =0x00000A78
	strh r1, [r4, r0]
	ldrh r1, [r5, #4]
	sub r0, r0, #2
	strh r1, [r4, r0]
_0222BAD4:
	pop {r4, r5, r6, pc}
	nop
_0222BAD8: .word 0x00000A7C
_0222BADC: .word 0x00000A78
	thumb_func_end ov80_0222BAB0

	thumb_func_start ov80_0222BAE0
ov80_0222BAE0: ; 0x0222BAE0
	push {r4, lr}
	add r1, r0, #0
	ldr r2, _0222BB14 ; =0x00000424
	mov r3, #0
	add r4, r1, #0
_0222BAEA:
	add r0, r4, #0
	add r0, #0x78
	ldrh r0, [r0]
	add r3, r3, #1
	strh r0, [r4, r2]
	add r4, r4, #2
	cmp r3, #0xe
	blt _0222BAEA
	ldr r2, _0222BB14 ; =0x00000424
	mov r0, #0x42
	add r1, r1, r2
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _0222BB0E
	mov r0, #1
	pop {r4, pc}
_0222BB0E:
	mov r0, #0
	pop {r4, pc}
	nop
_0222BB14: .word 0x00000424
	thumb_func_end ov80_0222BAE0

	thumb_func_start ov80_0222BB18
ov80_0222BB18: ; 0x0222BB18
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _0222BB50 ; =0x00000A7C
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222BB4C
	bl sub_0203769C
	cmp r0, #0
	beq _0222BB4C
	mov r2, #0
_0222BB3A:
	ldrh r1, [r5]
	add r0, r4, #0
	add r0, #0x78
	add r2, r2, #1
	strh r1, [r0]
	add r5, r5, #2
	add r4, r4, #2
	cmp r2, #0xe
	blt _0222BB3A
_0222BB4C:
	pop {r4, r5, r6, pc}
	nop
_0222BB50: .word 0x00000A7C
	thumb_func_end ov80_0222BB18

	thumb_func_start ov80_0222BB54
ov80_0222BB54: ; 0x0222BB54
	push {r3, r4, r5, r6, r7, lr}
	add r3, r0, #0
	mov r0, #0xc5
	ldr r1, _0222BBC8 ; =0x00000424
	mov r4, #0
	add r5, r3, #0
	lsl r0, r0, #2
_0222BB62:
	ldrh r2, [r5, r0]
	add r4, r4, #1
	strh r2, [r5, r1]
	add r5, r5, #2
	cmp r4, #4
	blt _0222BB62
	mov r0, #0xc7
	ldr r1, _0222BBCC ; =0x0000042C
	mov r5, #0
	add r4, r3, #0
	lsl r0, r0, #2
_0222BB78:
	add r2, r3, r5
	ldrb r2, [r2, r0]
	add r5, r5, #1
	strh r2, [r4, r1]
	add r4, r4, #2
	cmp r5, #4
	blt _0222BB78
	ldr r7, _0222BBC8 ; =0x00000424
	add r1, r3, #0
	mov r5, #0x32
	add r6, r7, #0
	mov r2, #0
	add r0, r3, #0
	add r1, #0x10
	lsl r5, r5, #4
	add r6, #8
_0222BB98:
	mov r4, #0x32
	lsl r4, r4, #4
	ldr r4, [r0, r4]
	add r2, r2, #1
	strh r4, [r1, r7]
	ldr r4, [r0, r5]
	add r0, r0, #4
	lsr r4, r4, #0x10
	strh r4, [r1, r6]
	add r1, r1, #2
	cmp r2, #4
	blt _0222BB98
	ldr r1, _0222BBC8 ; =0x00000424
	mov r0, #0x43
	add r1, r3, r1
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _0222BBC4
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222BBC4:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222BBC8: .word 0x00000424
_0222BBCC: .word 0x0000042C
	thumb_func_end ov80_0222BB54

	thumb_func_start ov80_0222BBD0
ov80_0222BBD0: ; 0x0222BBD0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0222BC44 ; =0x00000A7C
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r5, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r6, r0
	beq _0222BC42
	bl sub_0203769C
	cmp r0, #0
	beq _0222BC42
	mov r0, #0xc5
	mov r2, #0
	add r3, r5, #0
	add r6, r4, #0
	lsl r0, r0, #2
_0222BBFA:
	ldrh r1, [r3]
	add r2, r2, #1
	add r3, r3, #2
	strh r1, [r6, r0]
	add r6, r6, #2
	cmp r2, #4
	blt _0222BBFA
	mov r0, #0xc7
	mov r6, #0
	add r3, r5, #0
	lsl r0, r0, #2
_0222BC10:
	ldrh r2, [r3, #8]
	add r1, r4, r6
	add r6, r6, #1
	add r3, r3, #2
	strb r2, [r1, r0]
	cmp r6, #4
	blt _0222BC10
	mov r2, #0x32
	lsl r2, r2, #4
	mov r1, #0
	add r5, #0x10
	add r3, r2, #0
	add r6, r2, #0
_0222BC2A:
	ldrh r0, [r5]
	add r1, r1, #1
	str r0, [r4, r2]
	ldrh r7, [r5, #8]
	ldr r0, [r4, r3]
	add r5, r5, #2
	lsl r7, r7, #0x10
	orr r0, r7
	str r0, [r4, r6]
	add r4, r4, #4
	cmp r1, #4
	blt _0222BC2A
_0222BC42:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222BC44: .word 0x00000A7C
	thumb_func_end ov80_0222BBD0

	thumb_func_start ov80_0222BC48
ov80_0222BC48: ; 0x0222BC48
	push {r3, lr}
	ldr r2, _0222BC68 ; =0x00000424
	add r3, r0, #0
	strh r1, [r3, r2]
	add r1, r3, r2
	mov r0, #0x44
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _0222BC62
	mov r0, #1
	pop {r3, pc}
_0222BC62:
	mov r0, #0
	pop {r3, pc}
	nop
_0222BC68: .word 0x00000424
	thumb_func_end ov80_0222BC48

	thumb_func_start ov80_0222BC6C
ov80_0222BC6C: ; 0x0222BC6C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222BC8C ; =0x00000A7C
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r6, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r5, r0
	beq _0222BC8A
	ldrh r1, [r6]
	ldr r0, _0222BC90 ; =0x00000A74
	strb r1, [r4, r0]
_0222BC8A:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222BC8C: .word 0x00000A7C
_0222BC90: .word 0x00000A74
	thumb_func_end ov80_0222BC6C

	thumb_func_start ov80_0222BC94
ov80_0222BC94: ; 0x0222BC94
	push {r3, lr}
	ldr r2, _0222BCB4 ; =0x00000424
	add r3, r0, #0
	strh r1, [r3, r2]
	add r1, r3, r2
	mov r0, #0x45
	mov r2, #0x28
	bl sub_02037030
	cmp r0, #1
	bne _0222BCAE
	mov r0, #1
	pop {r3, pc}
_0222BCAE:
	mov r0, #0
	pop {r3, pc}
	nop
_0222BCB4: .word 0x00000424
	thumb_func_end ov80_0222BC94

	thumb_func_start ov80_0222BCB8
ov80_0222BCB8: ; 0x0222BCB8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0222BCD8 ; =0x00000A7C
	add r4, r3, #0
	ldrb r1, [r4, r0]
	add r6, r2, #0
	add r1, r1, #1
	strb r1, [r4, r0]
	bl sub_0203769C
	cmp r5, r0
	beq _0222BCD6
	ldrh r1, [r6]
	ldr r0, _0222BCDC ; =0x00000A75
	strb r1, [r4, r0]
_0222BCD6:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222BCD8: .word 0x00000A7C
_0222BCDC: .word 0x00000A75
	thumb_func_end ov80_0222BCB8

	thumb_func_start ov80_0222BCE0
ov80_0222BCE0: ; 0x0222BCE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	ldrb r0, [r7, #0x10]
	mov r1, #0
	bl ov80_022380E8
	str r0, [sp]
	bl SizeOfStructPokemon
	add r6, r0, #0
	ldr r0, [sp]
	mov r4, #0
	cmp r0, #0
	ble _0222BD22
	ldr r0, _0222BD40 ; =0x00000474
	add r5, r4, #0
	add r0, r7, r0
	str r0, [sp, #4]
_0222BD06:
	ldr r0, [r7, #0x70]
	add r1, r4, #0
	bl GetPartyMonByIndex
	ldr r1, [sp, #4]
	add r2, r6, #0
	add r1, r1, r5
	bl MI_CpuCopy8
	ldr r0, [sp]
	add r4, r4, #1
	add r5, r5, r6
	cmp r4, r0
	blt _0222BD06
_0222BD22:
	ldr r1, _0222BD40 ; =0x00000474
	mov r2, #2
	mov r0, #0x46
	add r1, r7, r1
	lsl r2, r2, #8
	bl sub_02036FD8
	cmp r0, #1
	bne _0222BD3A
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222BD3A:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222BD40: .word 0x00000474
	thumb_func_end ov80_0222BCE0

	thumb_func_start ov80_0222BD44
ov80_0222BD44: ; 0x0222BD44
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, _0222BDD0 ; =0x00000A7C
	add r4, r0, #0
	add r0, r3, #0
	ldrb r0, [r0, r1]
	str r2, [sp]
	str r3, [sp, #4]
	add r2, r0, #1
	add r0, r3, #0
	strb r2, [r0, r1]
	bl sub_0203769C
	cmp r4, r0
	beq _0222BDCC
	ldr r0, [sp, #4]
	mov r1, #0
	ldrb r0, [r0, #0x10]
	bl ov80_022380E8
	str r0, [sp, #8]
	bl SizeOfStructPokemon
	add r5, r0, #0
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	ldr r0, [sp, #8]
	mov r7, #0
	cmp r0, #0
	ble _0222BDA6
	add r4, r7, #0
_0222BD86:
	ldr r0, [sp]
	add r1, r6, #0
	add r0, r0, r4
	add r2, r5, #0
	bl MI_CpuCopy8
	ldr r0, [sp, #4]
	add r1, r6, #0
	ldr r0, [r0, #0x70]
	bl AddMonToParty
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r4, r4, r5
	cmp r7, r0
	blt _0222BD86
_0222BDA6:
	add r0, r6, #0
	bl FreeToHeap
	bl sub_0203769C
	cmp r0, #0
	beq _0222BDCC
	ldr r0, [sp, #4]
	mov r1, #0
	ldr r0, [r0, #0x70]
	mov r2, #2
	bl Party_SwapSlots
	ldr r0, [sp, #4]
	mov r1, #1
	ldr r0, [r0, #0x70]
	mov r2, #3
	bl Party_SwapSlots
_0222BDCC:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222BDD0: .word 0x00000A7C
	thumb_func_end ov80_0222BD44

	thumb_func_start ov80_0222BDD4
ov80_0222BDD4: ; 0x0222BDD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #2
	lsl r0, r0, #8
	add r4, r1, #0
	cmp r2, r0
	ble _0222BDE6
	bl GF_AssertFail
_0222BDE6:
	ldr r0, _0222BDF0 ; =0x00000674
	add r1, r4, r0
	lsl r0, r5, #9
	add r0, r1, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222BDF0: .word 0x00000674
	thumb_func_end ov80_0222BDD4

	thumb_func_start ov80_0222BDF4
ov80_0222BDF4: ; 0x0222BDF4
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r0, #0
	add r0, r4, #0
	bl ov80_0222BE24
	add r4, r0, #0
	bne _0222BE0C
	bl GF_AssertFail
_0222BE0C:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov80_0222BDF4

	thumb_func_start ov80_0222BE10
ov80_0222BE10: ; 0x0222BE10
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r0, #0
	add r0, r4, #0
	bl ov80_0222BE9C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BE10

	thumb_func_start ov80_0222BE24
ov80_0222BE24: ; 0x0222BE24
	push {r3, lr}
	mov r3, #2
	lsl r3, r3, #0xe
	cmp r1, r3
	bhs _0222BE32
	mov r0, #0
	pop {r3, pc}
_0222BE32:
	add r2, r3, #0
	add r2, #8
	cmp r1, r2
	bhs _0222BE44
	sub r1, r1, r3
	add r0, #8
	lsl r1, r1, #1
	add r0, r0, r1
	pop {r3, pc}
_0222BE44:
	add r2, r3, #0
	add r2, #0x10
	cmp r1, r2
	bhs _0222BE58
	add r3, #8
	ldr r0, [r0]
	sub r1, r1, r3
	bl ov80_0222AB2C
	pop {r3, pc}
_0222BE58:
	add r2, r3, #0
	add r2, #0x14
	cmp r1, r2
	bhs _0222BE6C
	add r3, #0x10
	sub r1, r1, r3
	add r0, #0x78
	lsl r1, r1, #1
	add r0, r0, r1
	pop {r3, pc}
_0222BE6C:
	ldr r0, _0222BE94 ; =0x0000FD13
	cmp r1, r0
	bne _0222BE76
	mov r0, #0
	pop {r3, pc}
_0222BE76:
	ldr r0, _0222BE98 ; =0x0000EEEE
	cmp r1, r0
	bne _0222BE80
	mov r0, #0
	pop {r3, pc}
_0222BE80:
	add r0, r0, #1
	cmp r1, r0
	bne _0222BE8A
	mov r0, #0
	pop {r3, pc}
_0222BE8A:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	nop
_0222BE94: .word 0x0000FD13
_0222BE98: .word 0x0000EEEE
	thumb_func_end ov80_0222BE24

	thumb_func_start ov80_0222BE9C
ov80_0222BE9C: ; 0x0222BE9C
	push {r4, lr}
	add r4, r1, #0
	bl ov80_0222BE24
	cmp r0, #0
	beq _0222BEAA
	ldrh r4, [r0]
_0222BEAA:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BE9C

	thumb_func_start ov80_0222BEB0
ov80_0222BEB0: ; 0x0222BEB0
	mov r0, #0
	bx lr
	thumb_func_end ov80_0222BEB0

	thumb_func_start ov80_0222BEB4
ov80_0222BEB4: ; 0x0222BEB4
	push {r3, lr}
	bl ov80_0222AB90
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BEB4

	thumb_func_start ov80_0222BEC0
ov80_0222BEC0: ; 0x0222BEC0
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AB90
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209684C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222BEC0

	thumb_func_start ov80_0222BED4
ov80_0222BED4: ; 0x0222BED4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222BE10
	add r1, r0, #0
	ldr r0, [r4]
	ldr r2, _0222BEF4 ; =0x0000FFFF
	bl sub_02096854
	ldr r1, _0222BEF8 ; =ov80_0222BEFC
	add r0, r5, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222BEF4: .word 0x0000FFFF
_0222BEF8: .word ov80_0222BEFC
	thumb_func_end ov80_0222BED4

	thumb_func_start ov80_0222BEFC
ov80_0222BEFC: ; 0x0222BEFC
	mov r0, #1
	bx lr
	thumb_func_end ov80_0222BEFC

	thumb_func_start ov80_0222BF00
ov80_0222BF00: ; 0x0222BF00
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r2, r0, #0
	ldr r0, [r4]
	add r1, r6, #0
	bl sub_02096854
	add r0, r5, #0
	bl ov80_0222AB90
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BF00

	thumb_func_start ov80_0222BF28
ov80_0222BF28: ; 0x0222BF28
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov80_0222BE24
	strh r4, [r0]
	add r0, r5, #0
	add r0, #0x78
	strh r6, [r0]
	ldr r1, _0222BF58 ; =ov80_0222BF5C
	add r0, r5, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0222BF58: .word ov80_0222BF5C
	thumb_func_end ov80_0222BF28

	thumb_func_start ov80_0222BF5C
ov80_0222BF5C: ; 0x0222BF5C
	push {r3, lr}
	add r1, r0, #0
	add r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE24
	ldrh r1, [r0]
	sub r1, r1, #1
	strh r1, [r0]
	ldrh r0, [r0]
	cmp r0, #0
	bne _0222BF78
	mov r0, #1
	pop {r3, pc}
_0222BF78:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222BF5C

	thumb_func_start ov80_0222BF7C
ov80_0222BF7C: ; 0x0222BF7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BF7C

	thumb_func_start ov80_0222BF94
ov80_0222BF94: ; 0x0222BF94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	ldrh r0, [r0]
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222BF94

	thumb_func_start ov80_0222BFAC
ov80_0222BFAC: ; 0x0222BFAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	ldrh r1, [r4]
	add r0, r1, r0
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BFAC

	thumb_func_start ov80_0222BFC8
ov80_0222BFC8: ; 0x0222BFC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	ldrh r1, [r4]
	sub r0, r1, r0
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222BFC8

	thumb_func_start ov80_0222BFE4
ov80_0222BFE4: ; 0x0222BFE4
	cmp r0, r1
	bhs _0222BFEC
	mov r0, #0
	bx lr
_0222BFEC:
	cmp r0, r1
	bne _0222BFF4
	mov r0, #1
	bx lr
_0222BFF4:
	mov r0, #2
	bx lr
	thumb_func_end ov80_0222BFE4

	thumb_func_start ov80_0222BFF8
ov80_0222BFF8: ; 0x0222BFF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r1, r0, #0
	add r0, r4, #0
	bl ov80_0222BFE4
	add r5, #0x8c
	strb r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222BFF8

	thumb_func_start ov80_0222C018
ov80_0222C018: ; 0x0222C018
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r1, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r1]
	bl ov80_0222BFE4
	add r5, #0x8c
	strb r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C018

	thumb_func_start ov80_0222C03C
ov80_0222C03C: ; 0x0222C03C
	str r1, [r0, #0x1c]
	bx lr
	thumb_func_end ov80_0222C03C

	thumb_func_start ov80_0222C040
ov80_0222C040: ; 0x0222C040
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC70
	add r2, r0, #0
	ldr r1, [r4, #0x1c]
	add r0, r4, #0
	add r1, r1, r2
	bl ov80_0222C03C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222C040

	thumb_func_start ov80_0222C058
ov80_0222C058: ; 0x0222C058
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222AC70
	add r1, r0, #0
	lsl r0, r4, #1
	add r4, r4, r0
	add r0, r5, #0
	add r0, #0x8c
	ldr r3, _0222C08C ; =ov80_0223B9D8
	ldrb r2, [r0]
	add r0, r3, r4
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _0222C088
	ldr r2, [r5, #0x1c]
	add r0, r5, #0
	add r1, r2, r1
	bl ov80_0222C03C
_0222C088:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222C08C: .word ov80_0223B9D8
	thumb_func_end ov80_0222C058

	thumb_func_start ov80_0222C090
ov80_0222C090: ; 0x0222C090
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC70
	add r2, r0, #0
	ldr r1, [r4, #0x1c]
	add r0, r4, #0
	add r1, r1, r2
	bl ov80_0222AC3C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222C090

	thumb_func_start ov80_0222C0A8
ov80_0222C0A8: ; 0x0222C0A8
	push {r3, lr}
	bl ov80_0222AC4C
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C0A8

	thumb_func_start ov80_0222C0B4
ov80_0222C0B4: ; 0x0222C0B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222AC70
	add r1, r0, #0
	lsl r0, r4, #1
	add r4, r4, r0
	add r0, r5, #0
	add r0, #0x8c
	ldr r3, _0222C0E8 ; =ov80_0223B9D8
	ldrb r2, [r0]
	add r0, r3, r4
	ldrb r0, [r2, r0]
	cmp r0, #1
	bne _0222C0E4
	ldr r2, [r5, #0x1c]
	add r0, r5, #0
	add r1, r2, r1
	bl ov80_0222AC3C
_0222C0E4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222C0E8: .word ov80_0223B9D8
	thumb_func_end ov80_0222C0B4

	thumb_func_start ov80_0222C0EC
ov80_0222C0EC: ; 0x0222C0EC
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bl ov80_0222AC58
	add r2, r0, #0
	mov r3, #0
	add r0, sp, #4
	strb r3, [r0]
	strb r3, [r0, #1]
	mov r1, #1
	strb r1, [r0, #2]
	strb r3, [r0, #3]
	add r0, sp, #4
	str r0, [sp]
	ldr r0, [r4]
	add r4, #0x80
	ldr r1, [r4]
	bl ov80_0222E268
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C0EC

	thumb_func_start ov80_0222C11C
ov80_0222C11C: ; 0x0222C11C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov80_0222AC58
	mov r3, #0
	add r1, r4, #0
	str r3, [sp]
	add r1, #0x80
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov80_0222E268
	ldr r1, _0222C148 ; =ov80_0222C17C
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	nop
_0222C148: .word ov80_0222C17C
	thumb_func_end ov80_0222C11C

	thumb_func_start ov80_0222C14C
ov80_0222C14C: ; 0x0222C14C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov80_0222AC58
	add r2, r0, #0
	mov r0, #0
	add r1, r4, #0
	str r0, [sp]
	add r1, #0x80
	ldr r0, [r4]
	ldr r1, [r1]
	mov r3, #1
	bl ov80_0222E268
	ldr r1, _0222C178 ; =ov80_0222C17C
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_0222C178: .word ov80_0222C17C
	thumb_func_end ov80_0222C14C

	thumb_func_start ov80_0222C17C
ov80_0222C17C: ; 0x0222C17C
	push {r3, lr}
	ldr r0, [r0]
	add r0, #0x50
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222C196
	mov r0, #0
	bl sub_02002B8C
	mov r0, #1
	pop {r3, pc}
_0222C196:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C17C

	thumb_func_start ov80_0222C19C
ov80_0222C19C: ; 0x0222C19C
	push {r3, lr}
	ldr r0, [r0]
	bl ov80_0222E38C
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222C19C

	thumb_func_start ov80_0222C1A8
ov80_0222C1A8: ; 0x0222C1A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ov80_0222AC58
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	str r4, [sp]
	add r3, r0, #0
	str r6, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0
	add r1, r7, #0
	add r2, r7, #0
	bl BeginNormalPaletteFade
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222C1A8

	thumb_func_start ov80_0222C1F0
ov80_0222C1F0: ; 0x0222C1F0
	push {r3, lr}
	ldr r1, _0222C1FC ; =ov80_0222C200
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222C1FC: .word ov80_0222C200
	thumb_func_end ov80_0222C1F0

	thumb_func_start ov80_0222C200
ov80_0222C200: ; 0x0222C200
	push {r3, lr}
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0222C20E
	mov r0, #1
	pop {r3, pc}
_0222C20E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C200

	thumb_func_start ov80_0222C214
ov80_0222C214: ; 0x0222C214
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5, #0x1c]
	ldr r4, [r5]
	add r2, r1, #1
	str r2, [r5, #0x1c]
	ldrb r1, [r1]
	add r3, r2, #1
	str r1, [sp, #0x14]
	str r3, [r5, #0x1c]
	ldrb r1, [r2]
	add r2, r3, #1
	str r1, [sp, #0x10]
	str r2, [r5, #0x1c]
	ldrb r7, [r3]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222AC58
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov80_0222BE24
	str r6, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x44]
	add r3, r7, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl ov80_0222E558
	str r0, [r4, #0x60]
	ldr r0, [sp, #0x18]
	add r5, #0x78
	strh r0, [r5]
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C214

	thumb_func_start ov80_0222C270
ov80_0222C270: ; 0x0222C270
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5, #0x1c]
	ldr r4, [r5]
	add r2, r1, #1
	str r2, [r5, #0x1c]
	ldrb r1, [r1]
	add r3, r2, #1
	str r1, [sp, #0x14]
	str r3, [r5, #0x1c]
	ldrb r1, [r2]
	add r2, r3, #1
	str r1, [sp, #0x10]
	str r2, [r5, #0x1c]
	ldrb r7, [r3]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222AC58
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov80_0222BE24
	str r6, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x44]
	add r3, r7, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl ov80_0222E558
	str r0, [r4, #0x60]
	ldr r0, [sp, #0x18]
	add r5, #0x78
	strh r0, [r5]
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C270

	thumb_func_start ov80_0222C2D0
ov80_0222C2D0: ; 0x0222C2D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r3, r0, #0
	ldr r0, [r4, #0x60]
	add r1, r6, #0
	mov r2, #0xff
	bl ov80_0222E5A8
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C2D0

	thumb_func_start ov80_0222C2F4
ov80_0222C2F4: ; 0x0222C2F4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r3, r0, #0
	ldr r0, [r4, #0x60]
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_0222E5A8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C2F4

	thumb_func_start ov80_0222C320
ov80_0222C320: ; 0x0222C320
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x60]
	bl ov80_0222E5B0
	ldr r1, _0222C338 ; =ov80_0222C33C
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0222C338: .word ov80_0222C33C
	thumb_func_end ov80_0222C320

	thumb_func_start ov80_0222C33C
ov80_0222C33C: ; 0x0222C33C
	push {r4, lr}
	add r1, r0, #0
	add r1, #0x78
	ldrh r1, [r1]
	ldr r4, [r0]
	bl ov80_0222BE24
	ldr r1, [r4, #0x60]
	cmp r1, #0
	beq _0222C354
	mov r0, #0
	pop {r4, pc}
_0222C354:
	ldrh r1, [r0]
	ldr r0, _0222C364 ; =0x0000EEEE
	cmp r1, r0
	beq _0222C360
	mov r0, #1
	pop {r4, pc}
_0222C360:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222C364: .word 0x0000EEEE
	thumb_func_end ov80_0222C33C

	thumb_func_start ov80_0222C368
ov80_0222C368: ; 0x0222C368
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5, #0x1c]
	ldr r4, [r5]
	add r2, r1, #1
	str r2, [r5, #0x1c]
	ldrb r1, [r1]
	add r3, r2, #1
	str r1, [sp, #0x14]
	str r3, [r5, #0x1c]
	ldrb r1, [r2]
	add r2, r3, #1
	str r1, [sp, #0x10]
	str r2, [r5, #0x1c]
	ldrb r7, [r3]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222AC58
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov80_0222BE24
	str r6, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x44]
	add r3, r7, #0
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl ov80_0222E920
	str r0, [r4, #0x60]
	ldr r0, [sp, #0x18]
	add r5, #0x78
	strh r0, [r5]
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C368

	thumb_func_start ov80_0222C3C4
ov80_0222C3C4: ; 0x0222C3C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r1, [r5, #0x1c]
	ldr r4, [r5]
	add r2, r1, #1
	str r2, [r5, #0x1c]
	ldrb r1, [r1]
	add r3, r2, #1
	str r1, [sp, #0x14]
	str r3, [r5, #0x1c]
	ldrb r1, [r2]
	add r2, r3, #1
	str r1, [sp, #0x10]
	str r2, [r5, #0x1c]
	ldrb r7, [r3]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222AC58
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl ov80_0222BE24
	str r6, [sp]
	str r0, [sp, #4]
	ldr r0, [r4, #0x44]
	add r3, r7, #0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	str r0, [sp, #0xc]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	bl ov80_0222E920
	str r0, [r4, #0x60]
	ldr r0, [sp, #0x18]
	add r5, #0x78
	strh r0, [r5]
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C3C4

	thumb_func_start ov80_0222C424
ov80_0222C424: ; 0x0222C424
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r3, r0, #0
	ldr r0, [r4, #0x60]
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_0222E940
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C424

	thumb_func_start ov80_0222C450
ov80_0222C450: ; 0x0222C450
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0x60]
	bl ov80_0222E948
	ldr r1, _0222C468 ; =ov80_0222C33C
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0222C468: .word ov80_0222C33C
	thumb_func_end ov80_0222C450

	thumb_func_start ov80_0222C46C
ov80_0222C46C: ; 0x0222C46C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #0x60]
	bl ov80_0222EEAC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C46C

	thumb_func_start ov80_0222C47C
ov80_0222C47C: ; 0x0222C47C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r4, [r5]
	add r0, r4, #0
	bl ov80_0222AB34
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	ldr r1, [r5, #0x1c]
	add r7, r0, #0
	add r0, r1, #1
	str r0, [r5, #0x1c]
	ldrb r0, [r1]
	ldr r1, _0222C4C4 ; =ov80_0223B9D0
	ldr r2, _0222C4C8 ; =0x000003D9
	str r0, [sp]
	ldr r0, [r4, #0x34]
	mov r3, #0xc
	str r0, [sp, #4]
	ldr r0, [r6]
	bl CreateYesNoMenu
	str r0, [r4, #0x74]
	add r0, r5, #0
	add r0, #0x78
	strh r7, [r0]
	ldr r1, _0222C4CC ; =ov80_0222C4D0
	add r0, r5, #0
	bl ov80_0222AB84
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C4C4: .word ov80_0223B9D0
_0222C4C8: .word 0x000003D9
_0222C4CC: .word ov80_0222C4D0
	thumb_func_end ov80_0222C47C

	thumb_func_start ov80_0222C4D0
ov80_0222C4D0: ; 0x0222C4D0
	push {r4, r5, r6, lr}
	add r1, r0, #0
	add r1, #0x78
	ldrh r1, [r1]
	ldr r4, [r0]
	bl ov80_0222BE24
	add r5, r0, #0
	ldr r0, [r4, #0x74]
	ldr r1, [r4, #0x34]
	bl Handle2dMenuInput_DeleteOnFinish
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	bne _0222C516
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222C512
	ldr r0, _0222C528 ; =0x000005DC
	bl PlaySE
	ldr r0, [r4, #0x74]
	bl Get2dMenuSelection
	add r6, r0, #0
	ldr r0, [r4, #0x74]
	ldr r1, [r4, #0x34]
	bl Clear2dMenuWindowAndDelete
	b _0222C516
_0222C512:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0222C516:
	cmp r6, #0
	bne _0222C51E
	mov r0, #0
	b _0222C520
_0222C51E:
	mov r0, #1
_0222C520:
	strh r0, [r5]
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_0222C528: .word 0x000005DC
	thumb_func_end ov80_0222C4D0

	thumb_func_start ov80_0222C52C
ov80_0222C52C: ; 0x0222C52C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	ldr r0, [sp]
	bl ov80_0222AC70
	ldr r1, [sp]
	ldr r1, [r1, #0x1c]
	str r1, [sp, #4]
	add r1, r1, r0
	ldr r0, [sp]
	str r1, [r0, #0x1c]
_0222C550:
	ldr r0, [sp]
	bl ov80_0222BE10
	add r1, sp, #0xc
	strh r0, [r1]
	ldrh r2, [r1]
	ldr r0, _0222C5E4 ; =0x0000FD13
	cmp r2, r0
	beq _0222C5D8
	ldr r0, [sp]
	ldr r3, [r0, #0x1c]
	add r2, r3, #1
	str r2, [r0, #0x1c]
	ldrb r0, [r3]
	strb r0, [r1, #2]
	ldrh r1, [r1]
	ldr r0, _0222C5E8 ; =0x0000EEEE
	cmp r1, r0
	bne _0222C596
	ldr r0, [sp, #8]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Sav2_PlayerData_GetProfileAddr
	bl ov80_0222A7EC
	add r1, sp, #0xc
	strh r0, [r1]
	add r0, r4, #0
	add r1, sp, #0xc
	bl ov80_0223947C
	b _0222C550
_0222C596:
	add r0, r0, #1
	cmp r1, r0
	bne _0222C5CE
	bl sub_02037474
	cmp r0, #1
	bne _0222C550
	bl sub_02037454
	add r6, r0, #0
	mov r5, #0
	cmp r6, #0
	ble _0222C550
	add r7, sp, #0xc
_0222C5B2:
	add r0, r5, #0
	bl sub_02034818
	bl ov80_0222A7EC
	strh r0, [r7]
	add r0, r4, #0
	add r1, sp, #0xc
	bl ov80_0223947C
	add r5, r5, #1
	cmp r5, r6
	blt _0222C5B2
	b _0222C550
_0222C5CE:
	add r0, r4, #0
	add r1, sp, #0xc
	bl ov80_0223947C
	b _0222C550
_0222C5D8:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	str r1, [r0, #0x1c]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C5E4: .word 0x0000FD13
_0222C5E8: .word 0x0000EEEE
	thumb_func_end ov80_0222C52C

	thumb_func_start ov80_0222C5EC
ov80_0222C5EC: ; 0x0222C5EC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r1, r0, #0
	add r0, r5, #0
	bl ov80_022394D8
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C5EC

	thumb_func_start ov80_0222C60C
ov80_0222C60C: ; 0x0222C60C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldr r0, [r5]
	str r0, [sp, #8]
	ldr r0, [r0]
	bl sub_0209680C
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov80_0222AC70
	ldr r1, [r5, #0x1c]
	add r4, r5, #0
	add r0, r1, r0
	str r1, [sp]
	str r0, [r5, #0x1c]
	add r4, #0x1c
	add r6, sp, #0xc
_0222C632:
	mov r7, #0
	add r0, r5, #0
	mvn r7, r7
	bl ov80_0222BE10
	strh r0, [r6, #4]
	ldrh r1, [r6, #4]
	ldr r0, _0222C6DC ; =0x0000FD13
	cmp r1, r0
	beq _0222C6D0
	add r0, r5, #0
	bl ov80_0222BE10
	strh r0, [r6]
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	add r0, r0, #1
	str r0, [r4]
	ldrb r0, [r1]
	strb r0, [r6, #0xa]
	add r0, r5, #0
	bl ov80_0222AC58
	sub r0, #8
	strh r0, [r6, #6]
	add r0, r5, #0
	bl ov80_0222AC58
	sub r0, #0x10
	strh r0, [r6, #8]
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	add r0, r0, #1
	str r0, [r4]
	ldrb r0, [r1]
	strb r0, [r6, #0xb]
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	add r0, r0, #1
	str r0, [r4]
	ldrb r0, [r1]
	strb r0, [r6, #0xc]
	mov r0, #0
	strh r0, [r6, #2]
	ldrh r1, [r6]
	ldr r0, _0222C6E0 ; =0x0000EEEE
	cmp r1, r0
	bne _0222C6AA
	ldr r0, [sp, #8]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Sav2_PlayerData_GetProfileAddr
	bl ov80_0222A7EC
	strh r0, [r6]
	mov r7, #0x1f
	b _0222C6C4
_0222C6AA:
	add r0, r0, #1
	cmp r1, r0
	bne _0222C6C4
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	add r0, r0, #1
	str r0, [r4]
	ldrb r0, [r1]
	bl sub_02034818
	bl ov80_0222A7EC
	strh r0, [r6]
_0222C6C4:
	ldr r0, [sp, #4]
	add r1, sp, #0xc
	add r2, r7, #0
	bl ov80_02239510
	b _0222C632
_0222C6D0:
	ldr r0, [sp]
	str r0, [r5, #0x1c]
	mov r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0222C6DC: .word 0x0000FD13
_0222C6E0: .word 0x0000EEEE
	thumb_func_end ov80_0222C60C

	thumb_func_start ov80_0222C6E4
ov80_0222C6E4: ; 0x0222C6E4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r1, r0, #0
	ldr r0, [r5, #0x14]
	bl ov42_02228110
	add r1, r0, #0
	add r0, r5, #0
	bl ov80_02239590
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C6E4

	thumb_func_start ov80_0222C70C
ov80_0222C70C: ; 0x0222C70C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	ldr r2, [r5, #0x1c]
	add r1, r0, #0
	add r0, r2, #1
	str r0, [r5, #0x1c]
	ldrb r5, [r2]
	mov r2, #0
	add r0, r4, #0
	str r2, [sp]
	add r3, sp, #0
	bl ov80_022395E8
	ldr r0, [sp]
	cmp r0, #0
	bne _0222C740
	bl GF_AssertFail
_0222C740:
	ldr r0, [sp]
	add r1, r5, #0
	bl ov42_02229200
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C70C

	thumb_func_start ov80_0222C74C
ov80_0222C74C: ; 0x0222C74C
	mov r0, #0
	bx lr
	thumb_func_end ov80_0222C74C

	thumb_func_start ov80_0222C750
ov80_0222C750: ; 0x0222C750
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4]
	bl sub_0209680C
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222AC70
	add r6, r0, #0
	ldr r0, [r4]
	add r1, r7, #0
	bl ov80_02239938
	str r0, [sp, #8]
	cmp r0, #0
	bne _0222C782
	bl GF_AssertFail
_0222C782:
	add r0, r4, #0
	add r0, #0x59
	str r0, [sp]
	ldr r0, [r4, #0x34]
	ldr r3, [sp, #0xc]
	str r0, [sp, #4]
	ldr r2, [r5, #0x1c]
	ldr r1, [sp, #8]
	ldr r3, [r3, #0x30]
	add r0, r7, #0
	add r2, r2, r6
	bl ov80_0222C7B0
	add r0, r4, #0
	add r0, #0x59
	ldrb r0, [r0]
	add r4, #0x59
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C750

	thumb_func_start ov80_0222C7B0
ov80_0222C7B0: ; 0x0222C7B0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	ldr r0, [sp, #0x1c]
	mov r1, #0x18
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x18
	bl MI_CpuFill8
	str r5, [r4, #0x14]
	ldr r0, [sp]
	str r7, [r4, #0xc]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x18]
	strh r6, [r4, #4]
	str r0, [r4, #8]
	ldr r0, [r5, #0x38]
	cmp r0, #0
	beq _0222C7E4
	bl GF_AssertFail
_0222C7E4:
	ldr r0, _0222C7F4 ; =ov80_0222EEC8
	ldr r2, _0222C7F8 ; =0x0000EAC4
	add r1, r4, #0
	bl CreateSysTask
	str r0, [r5, #0x38]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C7F4: .word ov80_0222EEC8
_0222C7F8: .word 0x0000EAC4
	thumb_func_end ov80_0222C7B0

	thumb_func_start ov80_0222C7FC
ov80_0222C7FC: ; 0x0222C7FC
	push {r3, lr}
	ldr r1, _0222C808 ; =ov80_0222C80C
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222C808: .word ov80_0222C80C
	thumb_func_end ov80_0222C7FC

	thumb_func_start ov80_0222C80C
ov80_0222C80C: ; 0x0222C80C
	ldr r0, [r0]
	add r0, #0x59
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222C81A
	mov r0, #1
	bx lr
_0222C81A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222C80C

	thumb_func_start ov80_0222C820
ov80_0222C820: ; 0x0222C820
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	ldr r4, [r6]
	ldr r0, [r4]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r6, #0
	bl ov80_0222AC70
	ldr r1, [r6, #0x1c]
	add r0, r1, r0
	str r0, [r6, #0x1c]
	str r1, [sp, #4]
	ldr r1, [r4, #0x34]
	mov r0, #0xb8
	bl NARC_ctor
	add r7, r0, #0
_0222C848:
	add r0, r6, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, _0222C880 ; =0x0000FD13
	cmp r4, r0
	beq _0222C86E
	str r4, [sp]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	ldr r3, [r5, #4]
	add r2, r7, #0
	bl ov80_02239AF8
	add r0, r5, #0
	add r1, r4, #0
	bl ov80_0223962C
	b _0222C848
_0222C86E:
	add r0, r7, #0
	bl NARC_dtor
	ldr r0, [sp, #4]
	str r0, [r6, #0x1c]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222C880: .word 0x0000FD13
	thumb_func_end ov80_0222C820

	thumb_func_start ov80_0222C884
ov80_0222C884: ; 0x0222C884
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r5, r0, #0
	ldr r0, [r4, #0x38]
	add r1, r5, #0
	bl ov80_02239B7C
	add r0, r4, #0
	add r1, r5, #0
	bl ov80_0223965C
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C884

	thumb_func_start ov80_0222C8B0
ov80_0222C8B0: ; 0x0222C8B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC70
	ldr r1, [r5, #0x1c]
	add r4, r5, #0
	add r0, r1, r0
	str r1, [sp]
	str r0, [r5, #0x1c]
	add r4, #0x1c
_0222C8D2:
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	ldr r0, _0222C948 ; =0x0000FD13
	cmp r7, r0
	beq _0222C93E
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0x14]
	ldr r0, [r4]
	ldr r1, [r5, #0x1c]
	add r2, r0, #1
	str r2, [r4]
	ldrb r0, [r1]
	str r0, [sp, #8]
	add r0, r2, #1
	ldr r1, [r5, #0x1c]
	add r2, r7, #0
	str r0, [r4]
	ldrb r0, [r1]
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	add r0, r6, #0
	bl ov80_0223968C
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	add r7, r0, #0
	bl sub_0200DDB8
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	bl sub_0200DCE8
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	add r0, r6, #0
	bl ov80_02239708
	b _0222C8D2
_0222C93E:
	ldr r0, [sp]
	str r0, [r5, #0x1c]
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C948: .word 0x0000FD13
	thumb_func_end ov80_0222C8B0

	thumb_func_start ov80_0222C94C
ov80_0222C94C: ; 0x0222C94C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r1, r0, #0
	add r0, r5, #0
	bl ov80_022396D8
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C94C

	thumb_func_start ov80_0222C96C
ov80_0222C96C: ; 0x0222C96C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	ldr r2, [r5, #0x1c]
	add r1, r0, #0
	add r0, r2, #1
	str r0, [r5, #0x1c]
	add r0, r4, #0
	ldrb r5, [r2]
	bl ov80_02239700
	add r4, r0, #0
	bne _0222C998
	bl GF_AssertFail
_0222C998:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0200DCE8
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C96C

	thumb_func_start ov80_0222C9A4
ov80_0222C9A4: ; 0x0222C9A4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r1, r0, #0
	add r0, r5, #0
	bl ov80_02239700
	add r4, r0, #0
	bne _0222C9C8
	bl GF_AssertFail
_0222C9C8:
	ldr r0, [r4]
	mov r1, #1
	bl sub_0200E0B8
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222C9A4

	thumb_func_start ov80_0222C9D4
ov80_0222C9D4: ; 0x0222C9D4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r5, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_02239700
	add r4, r0, #0
	bne _0222CA02
	bl GF_AssertFail
_0222CA02:
	cmp r5, #0
	ldr r0, [r4]
	bne _0222CA10
	mov r1, #0
	bl sub_0200E0F4
	b _0222CA16
_0222CA10:
	mov r1, #1
	bl sub_0200E0F4
_0222CA16:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222C9D4

	thumb_func_start ov80_0222CA1C
ov80_0222CA1C: ; 0x0222CA1C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl ov80_0222BE10
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r6, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r1, r5, #0
	add r4, r0, #0
	bl ov80_02239700
	add r1, r6, #0
	bl sub_0200DC4C
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov80_02239708
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CA1C

	thumb_func_start ov80_0222CA54
ov80_0222CA54: ; 0x0222CA54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r1, r4, #0
	mov r2, #0
	bl ov80_02239708
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CA54

	thumb_func_start ov80_0222CA74
ov80_0222CA74: ; 0x0222CA74
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222BE10
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _0222CA90 ; =ov80_0222CA94
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0222CA90: .word ov80_0222CA94
	thumb_func_end ov80_0222CA74

	thumb_func_start ov80_0222CA94
ov80_0222CA94: ; 0x0222CA94
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r1, r5, #0
	add r1, #0x78
	ldrh r1, [r1]
	add r4, r0, #0
	bl ov80_02239700
	add r5, #0x78
	add r6, r0, #0
	ldrh r1, [r5]
	add r0, r4, #0
	bl ov80_02239734
	cmp r0, #0
	beq _0222CAC6
	add r0, r6, #0
	bl sub_0200DCA0
	cmp r0, #0
	bne _0222CACA
_0222CAC6:
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222CACA:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CA94

	thumb_func_start ov80_0222CAD0
ov80_0222CAD0: ; 0x0222CAD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r4, r2, #0
	ldr r7, [r6]
	cmp r4, #7
	ble _0222CAE2
	bl GF_AssertFail
_0222CAE2:
	ldr r0, [r7, #0x34]
	lsl r1, r4, #1
	bl AllocFromHeap
	str r0, [sp, #8]
	add r0, r6, #0
	bl ov80_0222BE10
	ldr r5, [sp, #8]
	str r0, [sp, #4]
	mov r4, #0
_0222CAF8:
	add r0, r6, #0
	bl ov80_0222BE10
	strh r0, [r5]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #3
	blt _0222CAF8
	mov r0, #3
	str r0, [sp]
	ldr r0, [r7]
	ldr r1, [sp, #4]
	ldr r3, [sp, #8]
	mov r2, #1
	bl ov80_02239BF0
	ldr r0, [sp, #8]
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CAD0

	thumb_func_start ov80_0222CB24
ov80_0222CB24: ; 0x0222CB24
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ov80_0222BE10
	mov r2, #0
	str r2, [sp]
	add r1, r0, #0
	ldr r0, [r4]
	add r3, r2, #0
	ldr r0, [r0]
	bl ov80_02239BF0
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov80_0222CB24

	thumb_func_start ov80_0222CB44
ov80_0222CB44: ; 0x0222CB44
	push {r3, lr}
	mov r1, #1
	mov r2, #3
	bl ov80_0222CAD0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CB44

	thumb_func_start ov80_0222CB54
ov80_0222CB54: ; 0x0222CB54
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #4]
	mov r1, #0
	str r0, [sp]
	mov r0, #0xb
	add r2, r1, #0
	mov r3, #8
	str r1, [sp, #4]
	bl sub_020830D8
	add r2, r0, #0
	ldr r0, _0222CB8C ; =ov80_0222CB94
	ldr r1, _0222CB90 ; =_02102610
	str r0, [sp]
	ldr r0, [r4]
	mov r3, #0
	ldr r0, [r0]
	bl sub_02096820
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0222CB8C: .word ov80_0222CB94
_0222CB90: .word _02102610
	thumb_func_end ov80_0222CB54

	thumb_func_start ov80_0222CB94
ov80_0222CB94: ; 0x0222CB94
	ldr r3, _0222CB98 ; =sub_0208311C
	bx r3
	.balign 4, 0
_0222CB98: .word sub_0208311C
	thumb_func_end ov80_0222CB94

	thumb_func_start ov80_0222CB9C
ov80_0222CB9C: ; 0x0222CB9C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	mov r1, #0xb
	add r2, sp, #0
	bl sub_0202FBF0
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222CB9C

	thumb_func_start ov80_0222CBB4
ov80_0222CBB4: ; 0x0222CBB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r4, [r5]
	bl ov80_0222AC58
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp]
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r7, r0, #0
	ldr r0, _0222CC18 ; =0x0000270F
	cmp r6, r0
	bls _0222CBE2
	add r6, r0, #0
_0222CBE2:
	add r0, r4, #0
	mov r1, #0
	add r0, #0xb0
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xb2
	strh r1, [r0]
	ldr r0, [sp, #4]
	ldr r1, [sp]
	bl ov80_0222CC70
	add r1, r4, #0
	add r1, #0xb4
	strh r0, [r1]
	add r0, r4, #0
	add r0, #0xb6
	strh r6, [r0]
	add r4, #0xb8
	ldr r1, _0222CC1C ; =ov80_0222CC20
	add r0, r5, #0
	str r7, [r4]
	bl ov80_0222AB84
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222CC18: .word 0x0000270F
_0222CC1C: .word ov80_0222CC20
	thumb_func_end ov80_0222CBB4

	thumb_func_start ov80_0222CC20
ov80_0222CC20: ; 0x0222CC20
	push {r4, lr}
	sub sp, #8
	ldr r4, [r0]
	ldr r0, [r4]
	bl sub_02096808
	add r1, r4, #0
	add r1, #0xb0
	str r1, [sp]
	add r1, r4, #0
	add r1, #0xb2
	str r1, [sp, #4]
	add r1, r4, #0
	add r2, r4, #0
	add r1, #0xb4
	add r2, #0xb6
	ldrh r1, [r1]
	ldrh r2, [r2]
	ldr r0, [r0, #8]
	mov r3, #0
	bl sub_0202FE14
	sub r1, r0, #2
	cmp r1, #1
	bhi _0222CC68
	cmp r0, #2
	bne _0222CC5A
	mov r1, #1
	b _0222CC5C
_0222CC5A:
	mov r1, #0
_0222CC5C:
	add r4, #0xb8
	ldr r0, [r4]
	add sp, #8
	strh r1, [r0]
	mov r0, #1
	pop {r4, pc}
_0222CC68:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CC20

	thumb_func_start ov80_0222CC70
ov80_0222CC70: ; 0x0222CC70
	push {r4, lr}
	mov r4, #0xf
	cmp r0, #6
	bhi _0222CCB0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CC84: ; jump table
	.short _0222CD90 - _0222CC84 - 2 ; case 0
	.short _0222CC92 - _0222CC84 - 2 ; case 1
	.short _0222CCC0 - _0222CC84 - 2 ; case 2
	.short _0222CCEA - _0222CC84 - 2 ; case 3
	.short _0222CD14 - _0222CC84 - 2 ; case 4
	.short _0222CD3E - _0222CC84 - 2 ; case 5
	.short _0222CD68 - _0222CC84 - 2 ; case 6
_0222CC92:
	cmp r1, #6
	bhi _0222CCBA
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CCA2: ; jump table
	.short _0222CCB0 - _0222CCA2 - 2 ; case 0
	.short _0222CCB2 - _0222CCA2 - 2 ; case 1
	.short _0222CCB6 - _0222CCA2 - 2 ; case 2
	.short _0222CCB6 - _0222CCA2 - 2 ; case 3
	.short _0222CCB8 - _0222CCA2 - 2 ; case 4
	.short _0222CCB8 - _0222CCA2 - 2 ; case 5
	.short _0222CCB6 - _0222CCA2 - 2 ; case 6
_0222CCB0:
	b _0222CD90
_0222CCB2:
	mov r4, #0x10
	b _0222CD90
_0222CCB6:
	mov r4, #0x11
_0222CCB8:
	b _0222CD90
_0222CCBA:
	bl GF_AssertFail
	b _0222CD90
_0222CCC0:
	cmp r1, #3
	bhi _0222CCE4
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CCD0: ; jump table
	.short _0222CCD8 - _0222CCD0 - 2 ; case 0
	.short _0222CCDC - _0222CCD0 - 2 ; case 1
	.short _0222CCE0 - _0222CCD0 - 2 ; case 2
	.short _0222CCE0 - _0222CCD0 - 2 ; case 3
_0222CCD8:
	mov r4, #0x12
	b _0222CD90
_0222CCDC:
	mov r4, #0x13
	b _0222CD90
_0222CCE0:
	mov r4, #0x14
	b _0222CD90
_0222CCE4:
	bl GF_AssertFail
	b _0222CD90
_0222CCEA:
	cmp r1, #3
	bhi _0222CD0E
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CCFA: ; jump table
	.short _0222CD02 - _0222CCFA - 2 ; case 0
	.short _0222CD06 - _0222CCFA - 2 ; case 1
	.short _0222CD0A - _0222CCFA - 2 ; case 2
	.short _0222CD0A - _0222CCFA - 2 ; case 3
_0222CD02:
	mov r4, #0x15
	b _0222CD90
_0222CD06:
	mov r4, #0x16
	b _0222CD90
_0222CD0A:
	mov r4, #0x17
	b _0222CD90
_0222CD0E:
	bl GF_AssertFail
	b _0222CD90
_0222CD14:
	cmp r1, #3
	bhi _0222CD38
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CD24: ; jump table
	.short _0222CD2C - _0222CD24 - 2 ; case 0
	.short _0222CD30 - _0222CD24 - 2 ; case 1
	.short _0222CD34 - _0222CD24 - 2 ; case 2
	.short _0222CD34 - _0222CD24 - 2 ; case 3
_0222CD2C:
	mov r4, #0x1b
	b _0222CD90
_0222CD30:
	mov r4, #0x1c
	b _0222CD90
_0222CD34:
	mov r4, #0x1d
	b _0222CD90
_0222CD38:
	bl GF_AssertFail
	b _0222CD90
_0222CD3E:
	cmp r1, #3
	bhi _0222CD62
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CD4E: ; jump table
	.short _0222CD56 - _0222CD4E - 2 ; case 0
	.short _0222CD5A - _0222CD4E - 2 ; case 1
	.short _0222CD5E - _0222CD4E - 2 ; case 2
	.short _0222CD5E - _0222CD4E - 2 ; case 3
_0222CD56:
	mov r4, #0x18
	b _0222CD90
_0222CD5A:
	mov r4, #0x19
	b _0222CD90
_0222CD5E:
	mov r4, #0x1a
	b _0222CD90
_0222CD62:
	bl GF_AssertFail
	b _0222CD90
_0222CD68:
	cmp r1, #3
	bhi _0222CD8C
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CD78: ; jump table
	.short _0222CD80 - _0222CD78 - 2 ; case 0
	.short _0222CD84 - _0222CD78 - 2 ; case 1
	.short _0222CD88 - _0222CD78 - 2 ; case 2
	.short _0222CD88 - _0222CD78 - 2 ; case 3
_0222CD80:
	mov r4, #0x1e
	b _0222CD90
_0222CD84:
	mov r4, #0x1f
	b _0222CD90
_0222CD88:
	mov r4, #0x20
	b _0222CD90
_0222CD8C:
	bl GF_AssertFail
_0222CD90:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov80_0222CC70

	thumb_func_start ov80_0222CD94
ov80_0222CD94: ; 0x0222CD94
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	mov r1, #0x75
	add r4, r0, #0
	mov r0, #0xb
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x75
	mov r1, #0
	lsl r2, r2, #2
	add r6, r0, #0
	bl MI_CpuFill8
	mov r0, #0
	str r0, [sp]
	ldr r0, [r4, #8]
	mov r1, #0xb
	add r2, sp, #4
	add r3, r6, #0
	bl sub_0202FC90
	ldr r1, _0222CDEC ; =0x0000045D
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
	mov r0, #0
	str r0, [sp]
	ldr r0, [r5]
	ldr r1, _0222CDF0 ; =_020FA484
	ldr r0, [r0]
	add r2, r6, #0
	mov r3, #1
	bl sub_02096820
	mov r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222CDEC: .word 0x0000045D
_0222CDF0: .word _020FA484
	thumb_func_end ov80_0222CD94

	thumb_func_start ov80_0222CDF4
ov80_0222CDF4: ; 0x0222CDF4
	push {r3, lr}
	bl sub_0202FC24
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CDF4

	thumb_func_start ov80_0222CE00
ov80_0222CE00: ; 0x0222CE00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [r4, #8]
	mov r1, #0xb
	add r2, sp, #0
	mov r3, #0
	bl sub_0202FD28
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222CE00

	thumb_func_start ov80_0222CE28
ov80_0222CE28: ; 0x0222CE28
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BDF4
	ldr r0, [r5, #8]
	bl SaveGameNormal
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CE28

	thumb_func_start ov80_0222CE48
ov80_0222CE48: ; 0x0222CE48
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r4, [r5]
	ldr r0, [r4]
	bl sub_02096808
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	mov r0, #4
	bl sub_0201A728
	ldr r0, [r4, #0x34]
	bl sub_0201A748
	ldr r0, [r6, #8]
	mov r1, #2
	bl Save_PrepareForAsyncWrite
	ldr r1, _0222CE7C ; =ov80_0222CE80
	add r0, r5, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222CE7C: .word ov80_0222CE80
	thumb_func_end ov80_0222CE48

	thumb_func_start ov80_0222CE80
ov80_0222CE80: ; 0x0222CE80
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Save_WriteFileAsync
	cmp r0, #2
	bne _0222CEA2
	bl sub_0201A774
	mov r0, #4
	bl sub_0201A738
	mov r0, #1
	pop {r3, pc}
_0222CEA2:
	cmp r0, #3
	bne _0222CEB4
	bl sub_0201A774
	mov r0, #4
	bl sub_0201A738
	mov r0, #1
	pop {r3, pc}
_0222CEB4:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222CE80

	thumb_func_start ov80_0222CEB8
ov80_0222CEB8: ; 0x0222CEB8
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Save_WipeExtraChunks
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222CEB8

	thumb_func_start ov80_0222CECC
ov80_0222CECC: ; 0x0222CECC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [r4, #8]
	bl Save_CheckExtraChunksExist
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CECC

	thumb_func_start ov80_0222CEF0
ov80_0222CEF0: ; 0x0222CEF0
	push {r4, lr}
	ldr r4, [r0]
	ldr r1, _0222CF04 ; =0x000003E2
	add r0, r4, #0
	add r0, #0x64
	bl sub_0200F0AC
	str r0, [r4, #0x7c]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222CF04: .word 0x000003E2
	thumb_func_end ov80_0222CEF0

	thumb_func_start ov80_0222CF08
ov80_0222CF08: ; 0x0222CF08
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0, #0x7c]
	bl sub_0200F450
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CF08

	thumb_func_start ov80_0222CF18
ov80_0222CF18: ; 0x0222CF18
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222BE10
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x44]
	bl BufferItemName
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222CF18

	thumb_func_start ov80_0222CF38
ov80_0222CF38: ; 0x0222CF38
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222BE10
	add r6, r0, #0
	bl ov80_0222CF6C
	add r3, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x44]
	add r2, r6, #0
	bl BufferIntegerAsString
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222CF38

	thumb_func_start ov80_0222CF6C
ov80_0222CF6C: ; 0x0222CF6C
	push {r4, lr}
	mov r1, #0xa
	add r4, r0, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0222CF7E
	mov r0, #1
	pop {r4, pc}
_0222CF7E:
	add r0, r4, #0
	mov r1, #0x64
	bl _u32_div_f
	cmp r0, #0
	bne _0222CF8E
	mov r0, #2
	pop {r4, pc}
_0222CF8E:
	mov r1, #0xfa
	add r0, r4, #0
	lsl r1, r1, #2
	bl _u32_div_f
	cmp r0, #0
	bne _0222CFA0
	mov r0, #3
	pop {r4, pc}
_0222CFA0:
	ldr r1, _0222CFF4 ; =0x00002710
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0222CFB0
	mov r0, #4
	pop {r4, pc}
_0222CFB0:
	ldr r1, _0222CFF8 ; =0x000186A0
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0222CFC0
	mov r0, #5
	pop {r4, pc}
_0222CFC0:
	ldr r1, _0222CFFC ; =0x000F4240
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0222CFD0
	mov r0, #6
	pop {r4, pc}
_0222CFD0:
	ldr r1, _0222D000 ; =0x00989680
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0222CFE0
	mov r0, #7
	pop {r4, pc}
_0222CFE0:
	ldr r1, _0222D004 ; =0x05F5E100
	add r0, r4, #0
	bl _u32_div_f
	cmp r0, #0
	bne _0222CFF0
	mov r0, #8
	pop {r4, pc}
_0222CFF0:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0222CFF4: .word 0x00002710
_0222CFF8: .word 0x000186A0
_0222CFFC: .word 0x000F4240
_0222D000: .word 0x00989680
_0222D004: .word 0x05F5E100
	thumb_func_end ov80_0222CF6C

	thumb_func_start ov80_0222D008
ov80_0222D008: ; 0x0222D008
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldr r0, [r0, #8]
	ldrb r4, [r2]
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x44]
	bl BufferPlayersName
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D008

	thumb_func_start ov80_0222D034
ov80_0222D034: ; 0x0222D034
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r1, [r5, #0x1c]
	add r0, r1, #1
	str r0, [r5, #0x1c]
	ldrb r4, [r1]
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02034818
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x44]
	bl BufferPlayersName
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222D034

	thumb_func_start ov80_0222D064
ov80_0222D064: ; 0x0222D064
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222BE10
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x44]
	bl BufferMoveName
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222D064

	thumb_func_start ov80_0222D084
ov80_0222D084: ; 0x0222D084
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r6, [r2]
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	ldr r1, [r5, #0x1c]
	str r0, [sp, #8]
	add r0, r1, #1
	str r0, [r5, #0x1c]
	ldrb r4, [r1]
	add r0, r7, #0
	mov r1, #0xb
	bl ov80_0222D0D4
	add r7, r0, #0
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r0, [r5]
	ldr r3, [sp, #8]
	ldr r0, [r0, #0x44]
	add r1, r6, #0
	add r2, r7, #0
	bl BufferString
	add r0, r7, #0
	bl String_dtor
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D084

	thumb_func_start ov80_0222D0D4
ov80_0222D0D4: ; 0x0222D0D4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r3, r1, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xed
	bl NewMsgDataFromNarc
	add r5, r0, #0
	add r1, r4, #0
	bl NewString_ReadMsgData
	add r4, r0, #0
	add r0, r5, #0
	bl DestroyMsgData
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222D0D4

	thumb_func_start ov80_0222D0F8
ov80_0222D0F8: ; 0x0222D0F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0x1c]
	add r1, r2, #1
	str r1, [r5, #0x1c]
	ldrb r4, [r2]
	bl ov80_0222BE10
	add r2, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0, #0x44]
	bl BufferTypeName
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222D0F8

	thumb_func_start ov80_0222D118
ov80_0222D118: ; 0x0222D118
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	ldr r1, [r4, #0x1c]
	add r2, r0, #0
	add r0, r1, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	ldrb r1, [r1]
	ldr r0, [r0, #0x44]
	ldr r2, [r2, #8]
	bl BufferRivalsName
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222D118

	thumb_func_start ov80_0222D13C
ov80_0222D13C: ; 0x0222D13C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [r4, #8]
	bl Save_FrontierData_get
	mov r1, #0
	add r2, r1, #0
	bl FrontierData_BattlePointAction
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D13C

	thumb_func_start ov80_0222D168
ov80_0222D168: ; 0x0222D168
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r5, r0, #0
	ldr r0, [r4, #8]
	bl Sav2_GameStats_get
	mov r1, #0x45
	add r2, r5, #0
	bl GameStats_Add
	ldr r0, [r4, #8]
	bl Save_FrontierData_get
	add r1, r5, #0
	mov r2, #5
	bl FrontierData_BattlePointAction
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D168

	thumb_func_start ov80_0222D1A0
ov80_0222D1A0: ; 0x0222D1A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r5, r0, #0
	ldr r0, [r4, #8]
	bl Sav2_GameStats_get
	mov r1, #0x46
	add r2, r5, #0
	bl GameStats_Add
	ldr r0, [r4, #8]
	bl Save_FrontierData_get
	add r1, r5, #0
	mov r2, #6
	bl FrontierData_BattlePointAction
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D1A0

	thumb_func_start ov80_0222D1D8
ov80_0222D1D8: ; 0x0222D1D8
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222BE10
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037AC0
	ldr r1, _0222D1FC ; =ov80_0222D200
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0222D1FC: .word ov80_0222D200
	thumb_func_end ov80_0222D1D8

	thumb_func_start ov80_0222D200
ov80_0222D200: ; 0x0222D200
	push {r4, lr}
	add r4, r0, #0
	bl sub_02037454
	cmp r0, #2
	bge _0222D210
	mov r0, #1
	pop {r4, pc}
_0222D210:
	add r4, #0x78
	ldrh r0, [r4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037B38
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D200

	thumb_func_start ov80_0222D220
ov80_0222D220: ; 0x0222D220
	push {r3, lr}
	bl sub_02037BEC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D220

	thumb_func_start ov80_0222D22C
ov80_0222D22C: ; 0x0222D22C
	push {r4, lr}
	add r4, r0, #0
	bl sub_02058284
	ldr r1, _0222D240 ; =ov80_0222D244
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0222D240: .word ov80_0222D244
	thumb_func_end ov80_0222D22C

	thumb_func_start ov80_0222D244
ov80_0222D244: ; 0x0222D244
	push {r3, lr}
	bl sub_02037D78
	cmp r0, #1
	beq _0222D25A
	bl sub_02035650
	cmp r0, #1
	beq _0222D25A
	mov r0, #1
	pop {r3, pc}
_0222D25A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D244

	thumb_func_start ov80_0222D260
ov80_0222D260: ; 0x0222D260
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov80_0222BDF4
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r4, r0, #0
	bl LCRandom
	add r1, r4, #0
	bl _s32_div_f
	strh r1, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D260

	thumb_func_start ov80_0222D284
ov80_0222D284: ; 0x0222D284
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl SavArray_PlayerParty_get
	bl HealParty
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222D284

	thumb_func_start ov80_0222D29C
ov80_0222D29C: ; 0x0222D29C
	push {r3, lr}
	ldr r1, _0222D2A8 ; =ov80_0222D2AC
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222D2A8: .word ov80_0222D2AC
	thumb_func_end ov80_0222D29C

	thumb_func_start ov80_0222D2AC
ov80_0222D2AC: ; 0x0222D2AC
	push {r3, lr}
	ldr r0, _0222D2C8 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222D2C0
	bl System_GetTouchNew
	cmp r0, #0
	beq _0222D2C4
_0222D2C0:
	mov r0, #1
	pop {r3, pc}
_0222D2C4:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0222D2C8: .word gSystem
	thumb_func_end ov80_0222D2AC

	thumb_func_start ov80_0222D2CC
ov80_0222D2CC: ; 0x0222D2CC
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222BE10
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _0222D2E8 ; =ov80_0222D2EC
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0222D2E8: .word ov80_0222D2EC
	thumb_func_end ov80_0222D2CC

	thumb_func_start ov80_0222D2EC
ov80_0222D2EC: ; 0x0222D2EC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0222D324 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	bne _0222D302
	bl System_GetTouchNew
	cmp r0, #0
	beq _0222D306
_0222D302:
	mov r0, #1
	pop {r4, pc}
_0222D306:
	add r0, r4, #0
	add r0, #0x78
	ldrh r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x78
	add r4, #0x78
	strh r1, [r0]
	ldrh r0, [r4]
	cmp r0, #0
	bne _0222D320
	mov r0, #1
	pop {r4, pc}
_0222D320:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0222D324: .word gSystem
	thumb_func_end ov80_0222D2EC

	thumb_func_start ov80_0222D328
ov80_0222D328: ; 0x0222D328
	push {r3, lr}
	bl ov80_0222BDF4
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D328

	thumb_func_start ov80_0222D334
ov80_0222D334: ; 0x0222D334
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl SavArray_Flags_get
	add r1, r6, #0
	bl GetVarAddr
	strh r4, [r0]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222D334

	thumb_func_start ov80_0222D360
ov80_0222D360: ; 0x0222D360
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl SavArray_Flags_get
	add r1, r6, #0
	bl GetVarAddr
	ldrh r0, [r0]
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0222D360

	thumb_func_start ov80_0222D390
ov80_0222D390: ; 0x0222D390
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222D3A2
	cmp r0, #1
	beq _0222D3BE
	b _0222D3F0
_0222D3A2:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	add r3, r4, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D3FE
_0222D3BE:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0222D3FE
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	mov r0, #0xc
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0
	mov r1, #0x20
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D3FE
_0222D3F0:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0222D3FE
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_0222D3FE:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov80_0222D390

	thumb_func_start ov80_0222D404
ov80_0222D404: ; 0x0222D404
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #3
	bhi _0222D4CC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222D41C: ; jump table
	.short _0222D424 - _0222D41C - 2 ; case 0
	.short _0222D440 - _0222D41C - 2 ; case 1
	.short _0222D49A - _0222D41C - 2 ; case 2
	.short _0222D4B2 - _0222D41C - 2 ; case 3
_0222D424:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	add r3, r4, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D51A
_0222D440:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0222D51A
	mov r0, #0xb
	mov r1, #1
	bl AllocWindows
	str r0, [r4, #0x28]
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	ldr r0, [r0]
	mov r2, #1
	bl AddWindowParameterized
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r2, #2
	ldr r0, [r0, #4]
	add r3, r1, #0
	bl sub_02003D5C
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x28]
	bl ScheduleWindowCopyToVram
	mov r0, #0xb
	bl ov80_0223AF30
	str r0, [r4, #0x2c]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
_0222D49A:
	mov r0, #0xf
	str r0, [sp]
	mov r1, #1
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x28]
	add r2, r1, #0
	bl ov80_0223AF80
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D51A
_0222D4B2:
	ldr r0, [r4, #0x2c]
	bl ov80_0223AFC4
	add r5, r0, #0
	ldr r0, [r4, #0x28]
	bl ScheduleWindowCopyToVram
	cmp r5, #0
	beq _0222D51A
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D51A
_0222D4CC:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0222D51A
	ldr r0, [r4, #0x2c]
	bl ov80_0223AF60
	ldr r0, [r4, #0x28]
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, [r4, #0x28]
	bl RemoveWindow
	ldr r0, [r4, #0x28]
	mov r1, #1
	bl WindowArray_dtor
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xb
	bl BG_ClearCharDataRange
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0]
	bl BgClearTilemapBufferAndCommit
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, pc}
_0222D51A:
	mov r0, #1
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov80_0222D404

	thumb_func_start ov80_0222D520
ov80_0222D520: ; 0x0222D520
	push {r4, r5, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #3
	bhi _0222D5E8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222D538: ; jump table
	.short _0222D540 - _0222D538 - 2 ; case 0
	.short _0222D55C - _0222D538 - 2 ; case 1
	.short _0222D5B6 - _0222D538 - 2 ; case 2
	.short _0222D5CE - _0222D538 - 2 ; case 3
_0222D540:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	add r3, r4, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D636
_0222D55C:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0222D636
	mov r0, #0xb
	mov r1, #1
	bl AllocWindows
	str r0, [r4, #0x28]
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	ldr r0, [r0]
	mov r2, #1
	bl AddWindowParameterized
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r2, #2
	ldr r0, [r0, #4]
	add r3, r1, #0
	bl sub_02003D5C
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4, #0x28]
	bl ScheduleWindowCopyToVram
	mov r0, #0xb
	bl ov80_0223AF30
	str r0, [r4, #0x2c]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
_0222D5B6:
	mov r0, #0xf
	str r0, [sp]
	mov r1, #1
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x28]
	add r2, r1, #0
	bl ov80_0223AF80
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D636
_0222D5CE:
	ldr r0, [r4, #0x2c]
	bl ov80_0223B1D4
	add r5, r0, #0
	ldr r0, [r4, #0x28]
	bl ScheduleWindowCopyToVram
	cmp r5, #0
	beq _0222D636
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222D636
_0222D5E8:
	bl IsPaletteFadeFinished
	cmp r0, #1
	bne _0222D636
	ldr r0, [r4, #0x2c]
	bl ov80_0223AF60
	ldr r0, [r4, #0x28]
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, [r4, #0x28]
	bl RemoveWindow
	ldr r0, [r4, #0x28]
	mov r1, #1
	bl WindowArray_dtor
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0x20
	mov r2, #0
	mov r3, #0xb
	bl BG_ClearCharDataRange
	ldr r0, [r4]
	mov r1, #1
	ldr r0, [r0]
	bl BgClearTilemapBufferAndCommit
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, pc}
_0222D636:
	mov r0, #1
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov80_0222D520

	thumb_func_start ov80_0222D63C
ov80_0222D63C: ; 0x0222D63C
	lsl r1, r1, #0x10
	orr r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222D63C

	thumb_func_start ov80_0222D644
ov80_0222D644: ; 0x0222D644
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r4, r1, #0
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #2
	ldr r0, [r0]
	ldr r7, [r4, #0x24]
	bl GetBgHOffset
	str r0, [sp, #0x20]
	ldr r0, [r4]
	mov r1, #2
	ldr r0, [r0]
	bl GetBgHOffset
	str r0, [sp, #0x1c]
	ldr r0, [r4]
	mov r1, #3
	ldr r0, [r0]
	bl GetBgHOffset
	str r0, [sp, #0x18]
	ldr r0, [r4]
	mov r1, #3
	ldr r0, [r0]
	bl GetBgHOffset
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x10]
	cmp r0, #1
	beq _0222D686
	b _0222D7F6
_0222D686:
	mov r0, #6
	lsl r0, r0, #8
	ldr r0, [r7, r0]
	bl ov80_0223B60C
	str r0, [sp, #0x24]
	mov r0, #0
	str r0, [sp, #0x28]
	add r4, r7, #0
_0222D698:
	mov r0, #0
	strh r0, [r4, #8]
	strh r0, [r4, #0xa]
	ldrsh r6, [r4, r0]
	mov r0, #2
	ldrsh r0, [r4, r0]
	cmp r6, r0
	blt _0222D6AA
	b _0222D7CE
_0222D6AA:
	ldr r0, [sp, #0x24]
	lsl r1, r6, #5
	add r5, r0, r1
_0222D6B0:
	mov r2, #1
	mov r0, #0
	lsl r2, r2, #0xc
	str r0, [sp]
	add r0, sp, #0x2c
	mov r1, #0
	add r3, r2, #0
	bl MTX22_2DAffine
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x20]
	add r0, r0, r1
	mov r1, #0xa
	ldrsh r2, [r4, r1]
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0x10
	add r1, r1, r2
	ldr r2, _0222D964 ; =0x00000604
	lsl r1, r1, #0x10
	ldr r2, [r7, r2]
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	cmp r2, #2
	bne _0222D704
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsr r2, r1, #0x1f
	lsl r3, r1, #0x18
	lsl r0, r0, #0x10
	sub r3, r3, r2
	mov r1, #0x18
	ror r3, r1
	add r1, r2, r3
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	b _0222D730
_0222D704:
	cmp r2, #1
	bne _0222D730
	cmp r0, #0
	bge _0222D716
	mov r2, #1
	lsl r2, r2, #8
	add r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D716:
	cmp r1, #0
	bge _0222D720
	neg r1, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
_0222D720:
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D730:
	str r0, [sp]
	mov r2, #0
	str r1, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0x2c
	add r3, r2, #0
	bl G2x_SetBGyAffine_
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x18]
	add r0, r0, r1
	mov r1, #0xa
	ldrsh r2, [r4, r1]
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0x10
	add r1, r1, r2
	ldr r2, _0222D964 ; =0x00000604
	lsl r1, r1, #0x10
	ldr r2, [r7, r2]
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	cmp r2, #2
	bne _0222D782
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsr r2, r1, #0x1f
	lsl r3, r1, #0x18
	lsl r0, r0, #0x10
	sub r3, r3, r2
	mov r1, #0x18
	ror r3, r1
	add r1, r2, r3
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	b _0222D7AE
_0222D782:
	cmp r2, #1
	bne _0222D7AE
	cmp r0, #0
	bge _0222D794
	mov r2, #1
	lsl r2, r2, #8
	add r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D794:
	cmp r1, #0
	bge _0222D79E
	neg r1, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
_0222D79E:
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D7AE:
	str r0, [sp]
	add r0, r5, #0
	mov r2, #0
	str r1, [sp, #4]
	add r0, #0x10
	add r1, sp, #0x2c
	add r3, r2, #0
	bl G2x_SetBGyAffine_
	mov r0, #2
	ldrsh r0, [r4, r0]
	add r6, r6, #1
	add r5, #0x20
	cmp r6, r0
	bge _0222D7CE
	b _0222D6B0
_0222D7CE:
	ldr r0, [sp, #0x28]
	add r4, #0x10
	add r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #0x60
	bge _0222D7DC
	b _0222D698
_0222D7DC:
	mov r0, #6
	lsl r0, r0, #8
	ldr r0, [r7, r0]
	bl ov80_0223B5E8
	add r0, r7, #0
	bl FreeToHeap
	ldr r0, [sp, #8]
	bl DestroySysTask
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
_0222D7F6:
	mov r0, #6
	lsl r0, r0, #8
	ldr r0, [r7, r0]
	bl ov80_0223B60C
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0xc]
	add r4, r7, #0
_0222D808:
	mov r0, #8
	ldrsh r1, [r4, r0]
	mov r0, #4
	ldrsh r0, [r4, r0]
	add r0, r1, r0
	strh r0, [r4, #8]
	mov r0, #0xa
	ldrsh r1, [r4, r0]
	mov r0, #6
	ldrsh r0, [r4, r0]
	add r0, r1, r0
	strh r0, [r4, #0xa]
	mov r0, #0
	ldrsh r6, [r4, r0]
	mov r0, #2
	ldrsh r0, [r4, r0]
	cmp r6, r0
	blt _0222D82E
	b _0222D952
_0222D82E:
	ldr r0, [sp, #0x10]
	lsl r1, r6, #5
	add r5, r0, r1
_0222D834:
	mov r2, #1
	mov r0, #0
	lsl r2, r2, #0xc
	str r0, [sp]
	add r0, sp, #0x2c
	mov r1, #0
	add r3, r2, #0
	bl MTX22_2DAffine
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x20]
	add r0, r0, r1
	mov r1, #0xa
	ldrsh r2, [r4, r1]
	ldr r1, [sp, #0x1c]
	lsl r0, r0, #0x10
	add r1, r1, r2
	ldr r2, _0222D964 ; =0x00000604
	lsl r1, r1, #0x10
	ldr r2, [r7, r2]
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	cmp r2, #2
	bne _0222D888
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsr r2, r1, #0x1f
	lsl r3, r1, #0x18
	lsl r0, r0, #0x10
	sub r3, r3, r2
	mov r1, #0x18
	ror r3, r1
	add r1, r2, r3
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	b _0222D8B4
_0222D888:
	cmp r2, #1
	bne _0222D8B4
	cmp r0, #0
	bge _0222D89A
	mov r2, #1
	lsl r2, r2, #8
	add r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D89A:
	cmp r1, #0
	bge _0222D8A4
	neg r1, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
_0222D8A4:
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D8B4:
	str r0, [sp]
	mov r2, #0
	str r1, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0x2c
	add r3, r2, #0
	bl G2x_SetBGyAffine_
	mov r0, #8
	ldrsh r1, [r4, r0]
	ldr r0, [sp, #0x18]
	add r0, r0, r1
	mov r1, #0xa
	ldrsh r2, [r4, r1]
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0x10
	add r1, r1, r2
	ldr r2, _0222D964 ; =0x00000604
	lsl r1, r1, #0x10
	ldr r2, [r7, r2]
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	cmp r2, #2
	bne _0222D906
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsr r2, r1, #0x1f
	lsl r3, r1, #0x18
	lsl r0, r0, #0x10
	sub r3, r3, r2
	mov r1, #0x18
	ror r3, r1
	add r1, r2, r3
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	b _0222D932
_0222D906:
	cmp r2, #1
	bne _0222D932
	cmp r0, #0
	bge _0222D918
	mov r2, #1
	lsl r2, r2, #8
	add r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D918:
	cmp r1, #0
	bge _0222D922
	neg r1, r1
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
_0222D922:
	lsr r2, r0, #0x1f
	lsl r3, r0, #0x18
	sub r3, r3, r2
	mov r0, #0x18
	ror r3, r0
	add r0, r2, r3
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
_0222D932:
	str r0, [sp]
	add r0, r5, #0
	mov r2, #0
	str r1, [sp, #4]
	add r0, #0x10
	add r1, sp, #0x2c
	add r3, r2, #0
	bl G2x_SetBGyAffine_
	mov r0, #2
	ldrsh r0, [r4, r0]
	add r6, r6, #1
	add r5, #0x20
	cmp r6, r0
	bge _0222D952
	b _0222D834
_0222D952:
	ldr r0, [sp, #0xc]
	add r4, #0x10
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x60
	bge _0222D960
	b _0222D808
_0222D960:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222D964: .word 0x00000604
	thumb_func_end ov80_0222D644

	thumb_func_start ov80_0222D968
ov80_0222D968: ; 0x0222D968
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0222D97E
	cmp r0, #1
	beq _0222D99A
	cmp r0, #2
	beq _0222DA54
	b _0222DA8E
_0222D97E:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	add r3, r5, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222DA94
_0222D99A:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	beq _0222DA94
	add r0, sp, #4
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r5, #0x10]
	ldr r1, _0222DA9C ; =0x00000608
	mov r0, #0x65
	bl AllocFromHeap
	ldr r1, _0222DAA0 ; =0x00000604
	str r0, [r5, #0x24]
	mov r2, #1
	str r2, [r0, r1]
	ldr r0, _0222DAA4 ; =0x04000020
	add r1, sp, #4
	mov r2, #0x65
	bl ov80_0223B544
	mov r7, #0
	mov r1, #6
	ldr r2, [r5, #0x24]
	lsl r1, r1, #8
	str r0, [r2, r1]
	add r6, r7, #0
	add r4, r7, #0
_0222D9D6:
	ldr r0, [r5, #0x24]
	strh r6, [r0, r4]
	ldr r1, [r5, #0x24]
	add r0, r1, r4
	ldrsh r1, [r1, r4]
	add r1, r1, #2
	strh r1, [r0, #2]
	mov r0, #0x31
	sub r2, r0, r7
	lsr r1, r2, #0x1f
	lsl r3, r2, #0x1d
	sub r3, r3, r1
	mov r0, #0x1d
	ror r3, r0
	add r0, r1, r3
	ldr r1, [r5, #0x24]
	add r1, r1, r4
	strh r0, [r1, #4]
	asr r0, r2, #1
	lsr r0, r0, #0x1e
	add r0, r2, r0
	asr r1, r0, #2
	ldr r0, [r5, #0x24]
	add r0, r0, r4
	strh r1, [r0, #6]
	ldr r0, [r5, #0x24]
	add r1, r0, r4
	mov r0, #0
	strh r0, [r1, #8]
	ldr r0, [r5, #0x24]
	add r1, r0, r4
	mov r0, #0
	strh r0, [r1, #0xa]
	add r1, r0, #0
	bl ov80_0222D63C
	ldr r1, [r5, #0x24]
	add r7, r7, #1
	add r1, r1, r4
	str r0, [r1, #0xc]
	add r6, r6, #2
	add r4, #0x10
	cmp r7, #0x60
	blt _0222D9D6
	mov r0, #1
	str r0, [sp]
	mov r0, #0x28
	add r1, r0, #0
	sub r1, #0x38
	mov r2, #0
	mov r3, #0x1e
	bl sub_0200B484
	mov r2, #1
	ldr r0, _0222DAA8 ; =ov80_0222D644
	add r1, r5, #0
	lsl r2, r2, #0xc
	bl CreateSysTask
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222DA94
_0222DA54:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	beq _0222DA94
	mov r0, #1
	str r0, [r5, #0x10]
	mov r0, #3
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r5]
	mov r2, #0
	ldr r0, [r0]
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5]
	mov r1, #3
	ldr r0, [r0]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222DA94
_0222DA8E:
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0222DA94:
	mov r0, #1
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0222DA9C: .word 0x00000608
_0222DAA0: .word 0x00000604
_0222DAA4: .word 0x04000020
_0222DAA8: .word ov80_0222D644
	thumb_func_end ov80_0222D968

	thumb_func_start ov80_0222DAAC
ov80_0222DAAC: ; 0x0222DAAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0222DAC2
	cmp r0, #1
	beq _0222DADE
	cmp r0, #2
	beq _0222DBBC
	b _0222DBF6
_0222DAC2:
	mov r1, #0x10
	mov r0, #2
	add r2, r1, #0
	add r3, r5, #0
	str r0, [sp]
	mov r0, #1
	sub r2, #0x20
	add r3, #0xc
	bl ov80_0223AC24
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222DBFC
_0222DADE:
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _0222DAE6
	b _0222DBFC
_0222DAE6:
	add r0, sp, #4
	mov r1, #0
	mov r2, #0x20
	bl MI_CpuFill8
	mov r0, #0
	str r0, [r5, #0x10]
	ldr r1, _0222DC04 ; =0x00000608
	mov r0, #0x65
	bl AllocFromHeap
	ldr r1, _0222DC08 ; =0x00000604
	str r0, [r5, #0x24]
	mov r2, #2
	str r2, [r0, r1]
	ldr r0, _0222DC0C ; =0x04000020
	add r1, sp, #4
	mov r2, #0x65
	bl ov80_0223B544
	mov r6, #0
	mov r1, #6
	ldr r2, [r5, #0x24]
	lsl r1, r1, #8
	str r0, [r2, r1]
	add r7, r6, #0
	add r4, r6, #0
_0222DB1C:
	ldr r0, [r5, #0x24]
	lsr r2, r6, #0x1f
	strh r7, [r0, r4]
	ldr r1, [r5, #0x24]
	add r0, r1, r4
	ldrsh r1, [r1, r4]
	add r1, r1, #2
	strh r1, [r0, #2]
	mov r0, #0x30
	sub r1, r0, r6
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	asr r0, r0, #3
	add r1, r0, #1
	ldr r0, [r5, #0x24]
	add r0, r0, r4
	strh r1, [r0, #4]
	lsl r1, r6, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	beq _0222DB5A
	ldr r0, [r5, #0x24]
	mov r1, #4
	add r0, r0, r4
	ldrsh r2, [r0, r1]
	sub r1, r1, #5
	mul r1, r2
	strh r1, [r0, #4]
_0222DB5A:
	cmp r6, #0x30
	bge _0222DB66
	ldr r0, [r5, #0x24]
	add r0, r0, r4
	strh r6, [r0, #6]
	b _0222DB70
_0222DB66:
	mov r0, #0x60
	sub r1, r0, r6
	ldr r0, [r5, #0x24]
	add r0, r0, r4
	strh r1, [r0, #6]
_0222DB70:
	ldr r0, [r5, #0x24]
	add r1, r0, r4
	mov r0, #0
	strh r0, [r1, #8]
	ldr r0, [r5, #0x24]
	add r1, r0, r4
	mov r0, #0
	strh r0, [r1, #0xa]
	add r1, r0, #0
	bl ov80_0222D63C
	ldr r1, [r5, #0x24]
	add r6, r6, #1
	add r1, r1, r4
	str r0, [r1, #0xc]
	add r7, r7, #2
	add r4, #0x10
	cmp r6, #0x60
	blt _0222DB1C
	mov r0, #1
	str r0, [sp]
	mov r0, #0x28
	add r1, r0, #0
	sub r1, #0x38
	mov r2, #0
	mov r3, #0x1c
	bl sub_0200B484
	mov r2, #1
	ldr r0, _0222DC10 ; =ov80_0222D644
	add r1, r5, #0
	lsl r2, r2, #0xc
	bl CreateSysTask
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222DBFC
_0222DBBC:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	beq _0222DBFC
	mov r0, #1
	str r0, [r5, #0x10]
	mov r0, #3
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r5]
	mov r2, #0
	ldr r0, [r0]
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5]
	mov r1, #3
	ldr r0, [r0]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r5, #4]
	add r0, r0, #1
	str r0, [r5, #4]
	b _0222DBFC
_0222DBF6:
	add sp, #0x24
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0222DBFC:
	mov r0, #1
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0222DC04: .word 0x00000608
_0222DC08: .word 0x00000604
_0222DC0C: .word 0x04000020
_0222DC10: .word ov80_0222D644
	thumb_func_end ov80_0222DAAC

	thumb_func_start ov80_0222DC14
ov80_0222DC14: ; 0x0222DC14
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222DC26
	cmp r0, #1
	beq _0222DC38
	b _0222DC62
_0222DC26:
	add r0, r4, #0
	add r0, #0x18
	mov r1, #0x65
	bl ov80_0223B424
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222DC62
_0222DC38:
	mov r0, #0x12
	lsl r0, r0, #0xc
	str r0, [sp]
	mov r0, #0x19
	lsl r0, r0, #4
	str r0, [sp, #4]
	ldr r0, _0222DC68 ; =0x0400001C
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #4
	str r0, [sp, #0x10]
	add r0, r4, #0
	ldr r3, _0222DC6C ; =0x000002AA
	add r0, #0x18
	mov r2, #0xbf
	bl ov80_0223B440
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
_0222DC62:
	mov r0, #1
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
_0222DC68: .word 0x0400001C
_0222DC6C: .word 0x000002AA
	thumb_func_end ov80_0222DC14

	thumb_func_start ov80_0222DC70
ov80_0222DC70: ; 0x0222DC70
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r0, r5, #0
	bl ov80_0222BE10
	add r1, r5, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _0222DCE8 ; =0x0000045D
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
	mov r0, #0xb
	mov r1, #0x30
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	str r0, [r4, #0x14]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r5, #0
	add r0, #0x78
	ldrh r0, [r0]
	str r0, [r4, #8]
	ldr r0, [r5]
	bl ov80_0222AB34
	str r0, [r4]
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0]
	bl sub_02096818
	ldr r1, _0222DCEC ; =ov80_0222DCF0
	add r0, r5, #0
	bl ov80_0222AB84
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r4]
	mov r2, #2
	ldr r0, [r0, #4]
	add r3, r1, #0
	bl sub_02003D5C
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222DCE8: .word 0x0000045D
_0222DCEC: .word ov80_0222DCF0
	thumb_func_end ov80_0222DC70

	thumb_func_start ov80_0222DCF0
ov80_0222DCF0: ; 0x0222DCF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	ldr r1, [r4, #8]
	lsl r2, r1, #2
	ldr r1, _0222DD38 ; =ov80_0223B9EC
	ldr r1, [r1, r2]
	blx r1
	add r6, r0, #0
	bne _0222DD2C
	mov r0, #0
	add r1, r0, #0
	bl sub_0200FBF4
	mov r0, #1
	mov r1, #0
	bl sub_0200FBF4
	ldr r0, [r5]
	ldr r1, [r4, #0x14]
	ldr r0, [r0]
	bl sub_02096818
	add r0, r4, #0
	bl FreeToHeap
_0222DD2C:
	cmp r6, #0
	bne _0222DD34
	mov r0, #1
	pop {r4, r5, r6, pc}
_0222DD34:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222DD38: .word ov80_0223B9EC
	thumb_func_end ov80_0222DCF0

	thumb_func_start ov80_0222DD3C
ov80_0222DD3C: ; 0x0222DD3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _0222DD60
	mov r0, #0
	b _0222DD62
_0222DD60:
	mov r0, #0x61
_0222DD62:
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222DD3C

	thumb_func_start ov80_0222DD68
ov80_0222DD68: ; 0x0222DD68
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r3, r0, #0
	ldr r0, [r4, #0x10]
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_022399A4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222DD68

	thumb_func_start ov80_0222DD9C
ov80_0222DD9C: ; 0x0222DD9C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r1, r0, #0
	ldr r0, [r5, #0x10]
	bl ov80_02239A1C
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222DD9C

	thumb_func_start ov80_0222DDBC
ov80_0222DDBC: ; 0x0222DDBC
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5, #0x10]
	add r1, r6, #0
	bl ov80_02239A60
	mov r2, #0
	add r1, r4, #0
	add r3, r2, #0
	bl sub_02015494
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222DDBC

	thumb_func_start ov80_0222DDF0
ov80_0222DDF0: ; 0x0222DDF0
	push {r3, lr}
	ldr r1, _0222DDFC ; =ov80_0222DE00
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222DDFC: .word ov80_0222DE00
	thumb_func_end ov80_0222DDF0

	thumb_func_start ov80_0222DE00
ov80_0222DE00: ; 0x0222DE00
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_0209680C
	ldr r0, [r0, #0x10]
	bl ov80_02239A74
	cmp r0, #1
	bne _0222DE18
	mov r0, #1
	pop {r3, pc}
_0222DE18:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_0222DE00

	thumb_func_start ov80_0222DE1C
ov80_0222DE1C: ; 0x0222DE1C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r5, r0, #0
	add r0, #0xa4
	ldr r0, [r0]
	add r5, #0xa4
	cmp r0, #0
	beq _0222DE3E
	bl GF_AssertFail
	ldr r0, [r5]
	bl DestroySysTask
_0222DE3E:
	add r0, r4, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	str r0, [sp]
	add r0, r4, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	strh r6, [r5, #4]
	ldr r0, [sp]
	strh r7, [r5, #6]
	strb r0, [r5, #9]
	ldr r0, _0222DE84 ; =ov80_0222F4F0
	ldr r2, _0222DE88 ; =0x00011170
	add r1, r5, #0
	strb r4, [r5, #0xa]
	bl CreateSysTask
	str r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DE84: .word ov80_0222F4F0
_0222DE88: .word 0x00011170
	thumb_func_end ov80_0222DE1C

	thumb_func_start ov80_0222DE8C
ov80_0222DE8C: ; 0x0222DE8C
	push {r3, lr}
	ldr r1, _0222DE98 ; =ov80_0222DE9C
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222DE98: .word ov80_0222DE9C
	thumb_func_end ov80_0222DE8C

	thumb_func_start ov80_0222DE9C
ov80_0222DE9C: ; 0x0222DE9C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_0209680C
	add r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	bne _0222DEB2
	mov r0, #1
	pop {r3, pc}
_0222DEB2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222DE9C

	thumb_func_start ov80_0222DEB8
ov80_0222DEB8: ; 0x0222DEB8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, r0, #0
	add r0, #0xb0
	ldr r0, [r0]
	add r4, #0xb0
	cmp r0, #0
	beq _0222DEDA
	bl GF_AssertFail
	ldr r0, [r4]
	bl DestroySysTask
_0222DEDA:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	add r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #4]
	add r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #5]
	add r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #6]
	add r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #7]
	add r0, r5, #0
	bl ov80_0222BE10
	strh r0, [r4, #8]
	add r0, r5, #0
	bl ov80_0222BE10
	strb r0, [r4, #0xa]
	mov r2, #0x4b
	ldr r0, _0222DF28 ; =ov80_0222F53C
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222DF28: .word ov80_0222F53C
	thumb_func_end ov80_0222DEB8

	thumb_func_start ov80_0222DF2C
ov80_0222DF2C: ; 0x0222DF2C
	push {r3, lr}
	ldr r1, _0222DF38 ; =ov80_0222DF3C
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0222DF38: .word ov80_0222DF3C
	thumb_func_end ov80_0222DF2C

	thumb_func_start ov80_0222DF3C
ov80_0222DF3C: ; 0x0222DF3C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_0209680C
	add r0, #0xb0
	ldr r0, [r0]
	cmp r0, #0
	bne _0222DF52
	mov r0, #1
	pop {r3, pc}
_0222DF52:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222DF3C

	thumb_func_start ov80_0222DF58
ov80_0222DF58: ; 0x0222DF58
	push {r3, lr}
	bl ov80_0222AC58
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222DF58

	thumb_func_start ov80_0222DF64
ov80_0222DF64: ; 0x0222DF64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp, #0x18]
	add r0, r5, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl ov80_0222AC58
	add r0, r5, #0
	bl ov80_0222AC58
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl SavArray_PlayerParty_get
	ldr r1, [sp, #0x18]
	bl GetPartyMonByIndex
	str r4, [sp]
	add r1, r0, #0
	str r6, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	str r2, [sp, #0xc]
	mov r0, #8
	str r0, [sp, #0x10]
	str r2, [sp, #0x14]
	ldr r3, [sp, #0x1c]
	add r0, r7, #0
	mov r2, #0xb
	bl ov80_0222F030
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222DF64

	thumb_func_start ov80_0222DFD4
ov80_0222DFD4: ; 0x0222DFD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r1, r0, #0
	add r0, r4, #0
	bl ov80_0222F1D0
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222DFD4

	thumb_func_start ov80_0222DFF4
ov80_0222DFF4: ; 0x0222DFF4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r1, sp, #0x10
	add r6, r0, #0
	add r0, r4, #0
	add r1, #2
	add r2, sp, #0x10
	bl ov80_022398E4
	ldr r0, [r4, #4]
	add r1, sp, #0x10
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x78
	str r0, [sp, #4]
	mov r0, #2
	ldrsh r0, [r1, r0]
	str r0, [sp, #8]
	mov r0, #0
	ldrsh r0, [r1, r0]
	str r0, [sp, #0xc]
	ldr r1, [r4]
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x38]
	add r0, r6, #0
	bl ov80_0223A00C
	ldr r1, _0222E054 ; =0x0000047B
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
	ldr r1, _0222E058 ; =ov80_0222E05C
	add r0, r5, #0
	bl ov80_0222AB84
	mov r0, #1
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0222E054: .word 0x0000047B
_0222E058: .word ov80_0222E05C
	thumb_func_end ov80_0222DFF4

	thumb_func_start ov80_0222E05C
ov80_0222E05C: ; 0x0222E05C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0209680C
	add r4, #0x78
	ldrh r0, [r4]
	cmp r0, #1
	bne _0222E074
	mov r0, #1
	pop {r4, pc}
_0222E074:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222E05C

	thumb_func_start ov80_0222E078
ov80_0222E078: ; 0x0222E078
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Sav2_GameStats_get
	add r1, r4, #0
	bl GameStats_Inc
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E078

	thumb_func_start ov80_0222E09C
ov80_0222E09C: ; 0x0222E09C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Sav2_GameStats_get
	add r1, r4, #0
	add r2, r6, #0
	bl GameStats_Add
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_0222E09C

	thumb_func_start ov80_0222E0C8
ov80_0222E0C8: ; 0x0222E0C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl Sav2_GameStats_get
	add r1, r4, #0
	bl GameStats_AddSpecial
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E0C8

	thumb_func_start ov80_0222E0EC
ov80_0222E0EC: ; 0x0222E0EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl sub_0205C298
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E0EC

	thumb_func_start ov80_0222E10C
ov80_0222E10C: ; 0x0222E10C
	push {r4, lr}
	bl ov80_0222BDF4
	add r4, r0, #0
	bl sub_020304B4
	strh r0, [r4]
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E10C

	thumb_func_start ov80_0222E120
ov80_0222E120: ; 0x0222E120
	push {r4, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl sub_0202C6F4
	add r4, r0, #0
	bl ov00_021E6EBC
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0202C4B0
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E120

	thumb_func_start ov80_0222E144
ov80_0222E144: ; 0x0222E144
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl sub_020270C4
	add r0, r4, #0
	bl ov80_0222BE10
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222E144

	thumb_func_start ov80_0222E160
ov80_0222E160: ; 0x0222E160
	push {r3, lr}
	bl ov80_0222BE10
	bl sub_020378E4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E160

	thumb_func_start ov80_0222E170
ov80_0222E170: ; 0x0222E170
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222BE10
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037AC0
	ldr r1, _0222E194 ; =ov80_0222E198
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0222E194: .word ov80_0222E198
	thumb_func_end ov80_0222E170

	thumb_func_start ov80_0222E198
ov80_0222E198: ; 0x0222E198
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_02037454
	cmp r0, #2
	bge _0222E1A8
	mov r4, #1
	b _0222E1B8
_0222E1A8:
	add r0, r5, #0
	add r0, #0x78
	ldrh r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02037B38
	add r4, r0, #0
_0222E1B8:
	cmp r4, #0
	bne _0222E210
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r6, r0, #0
	beq _0222E210
	add r0, #0x6f
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222E210
	add r0, r6, #0
	add r0, #0x74
	ldrh r1, [r0]
	cmp r1, #1
	beq _0222E1E0
	ldr r0, _0222E214 ; =0x0000FFFE
	cmp r1, r0
	bne _0222E1EA
_0222E1E0:
	ldr r0, [r5]
	mov r4, #1
	add r0, #0x39
	strb r4, [r0]
	b _0222E210
_0222E1EA:
	cmp r1, #0
	bne _0222E210
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02034818
	bl PlayerProfile_GetVersion
	cmp r0, #0xc
	bne _0222E210
	add r0, r6, #0
	mov r1, #0
	add r0, #0x6f
	strb r1, [r0]
	add r0, r6, #0
	bl sub_02096BF8
_0222E210:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222E214: .word 0x0000FFFE
	thumb_func_end ov80_0222E198

	thumb_func_start ov80_0222E218
ov80_0222E218: ; 0x0222E218
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222BDF4
	ldr r1, [r4]
	add r1, #0x39
	ldrb r1, [r1]
	strh r1, [r0]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov80_0222E218

	thumb_func_start ov80_0222E22C
ov80_0222E22C: ; 0x0222E22C
	ldr r0, [r0]
	mov r1, #0
	add r0, #0x39
	strb r1, [r0]
	mov r0, #1
	bx lr
	thumb_func_end ov80_0222E22C

	thumb_func_start ov80_0222E238
ov80_0222E238: ; 0x0222E238
	push {r3, lr}
	ldr r2, [r0, #0x1c]
	ldr r3, [r0]
	add r1, r2, #1
	str r1, [r0, #0x1c]
	ldrb r1, [r2]
	ldr r0, [r3, #0x60]
	bl ov80_0222F5D0
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E238

	thumb_func_start ov80_0222E250
ov80_0222E250: ; 0x0222E250
	push {r3, lr}
	ldr r2, [r0, #0x1c]
	ldr r3, [r0]
	add r1, r2, #1
	str r1, [r0, #0x1c]
	ldrb r1, [r2]
	ldr r0, [r3, #0x60]
	bl ov80_0222F5EC
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E250

	thumb_func_start ov80_0222E268
ov80_0222E268: ; 0x0222E268
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #4]
	ldr r4, [sp, #0x20]
	bl ov80_0222E2B8
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_0222E328
	cmp r4, #0
	bne _0222E2A2
	add r0, r5, #0
	bl ov80_0222AB34
	ldr r0, [r0, #8]
	bl sub_02096808
	ldr r0, [r0, #4]
	bl Options_GetTextFrameDelay
	add r2, r0, #0
	mov r0, #0
	mov r1, #1
	b _0222E2A8
_0222E2A2:
	ldrb r2, [r4]
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
_0222E2A8:
	str r0, [sp]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov80_0222E344
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E268

	thumb_func_start ov80_0222E2B8
ov80_0222E2B8: ; 0x0222E2B8
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	bl ov80_0222AB34
	add r1, r4, #0
	add r1, #0x5a
	ldrb r1, [r1]
	cmp r1, #0
	bne _0222E310
	mov r1, #0x13
	str r1, [sp]
	mov r1, #0x1b
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	mov r1, #0xd
	str r1, [sp, #0xc]
	ldr r1, _0222E320 ; =0x0000036D
	mov r2, #1
	str r1, [sp, #0x10]
	add r1, r4, #0
	ldr r0, [r0]
	add r1, #0x64
	mov r3, #2
	bl AddWindowParameterized
	add r0, r4, #0
	add r0, #0x64
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r4, #0
	ldr r2, _0222E324 ; =0x000003E2
	add r0, #0x64
	mov r1, #0
	mov r3, #0xb
	bl DrawFrameAndWindow2
	mov r0, #1
	add r4, #0x5a
	add sp, #0x14
	strb r0, [r4]
	pop {r3, r4, pc}
_0222E310:
	add r4, #0x64
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0222E320: .word 0x0000036D
_0222E324: .word 0x000003E2
	thumb_func_end ov80_0222E2B8

	thumb_func_start ov80_0222E328
ov80_0222E328: ; 0x0222E328
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	ldr r2, [r4, #0x4c]
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x44]
	ldr r1, [r4, #0x48]
	ldr r2, [r4, #0x4c]
	bl StringExpandPlaceholders
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E328

	thumb_func_start ov80_0222E344
ov80_0222E344: ; 0x0222E344
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r0, r3, #0
	add r6, r1, #0
	add r4, r2, #0
	bl TextFlags_SetCanABSpeedUpPrint
	ldr r0, [sp, #0x20]
	bl sub_02002B50
	cmp r4, #0
	beq _0222E362
	cmp r4, #0xff
	bne _0222E36A
_0222E362:
	mov r0, #0
	bl sub_02002B8C
	b _0222E370
_0222E36A:
	mov r0, #1
	bl sub_02002B8C
_0222E370:
	mov r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	str r3, [sp, #8]
	add r0, r5, #0
	ldr r2, [r5, #0x48]
	add r0, #0x64
	add r1, r6, #0
	bl AddTextPrinterParameterized
	add r5, #0x50
	strb r0, [r5]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov80_0222E344

	thumb_func_start ov80_0222E38C
ov80_0222E38C: ; 0x0222E38C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x5a
	ldrb r0, [r0]
	cmp r0, #1
	beq _0222E39C
	bl GF_AssertFail
_0222E39C:
	add r0, r4, #0
	add r0, #0x64
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0x64
	bl RemoveWindow
	mov r0, #0
	add r4, #0x5a
	strb r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E38C

	thumb_func_start ov80_0222E3B8
ov80_0222E3B8: ; 0x0222E3B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov80_0222E2B8
	add r3, sp, #8
	ldrh r0, [r3, #0x14]
	add r1, r6, #0
	add r2, r7, #0
	str r0, [sp]
	ldrh r3, [r3, #0x10]
	ldr r0, [r5, #0x48]
	bl ov80_0222E400
	add r0, sp, #8
	ldrb r3, [r0, #0x18]
	cmp r3, #0xff
	beq _0222E3F0
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	bl ov80_0222E344
	pop {r3, r4, r5, r6, r7, pc}
_0222E3F0:
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	str r2, [sp]
	bl ov80_0222E344
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E3B8

	thumb_func_start ov80_0222E400
ov80_0222E400: ; 0x0222E400
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r0, sp, #0
	add r7, r3, #0
	bl MailMsg_init
	add r0, sp, #0
	add r1, r4, #0
	add r2, r6, #0
	bl MailMsg_SetMsgBankAndNum
	add r0, sp, #0
	mov r1, #0
	add r2, r7, #0
	bl MailMsg_SetFieldI
	add r2, sp, #0x10
	ldrh r2, [r2, #0x10]
	add r0, sp, #0
	mov r1, #1
	bl MailMsg_SetFieldI
	add r0, sp, #0
	mov r1, #0x20
	bl MailMsg_GetExpandedString
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl StringCopy
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E400

	thumb_func_start ov80_0222E450
ov80_0222E450: ; 0x0222E450
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	ldr r1, [sp, #0x28]
	add r7, r0, #0
	add r4, r2, #0
	add r5, r3, #0
	cmp r1, #0
	bne _0222E47E
	ldr r3, [r7, #0x34]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xbf
	bl NewMsgDataFromNarc
	add r1, r6, #0
	add r1, #0x8c
	str r0, [r1]
	add r0, r6, #0
	add r0, #0x97
	ldrb r1, [r0]
	mov r0, #2
	orr r1, r0
	b _0222E48E
_0222E47E:
	add r0, r6, #0
	add r0, #0x8c
	str r1, [r0]
	add r0, r6, #0
	add r0, #0x97
	ldrb r1, [r0]
	mov r0, #2
	bic r1, r0
_0222E48E:
	add r0, r6, #0
	add r0, #0x97
	strb r1, [r0]
	add r0, r6, #0
	ldr r1, [sp, #0x24]
	add r0, #0x90
	str r1, [r0]
	add r0, r6, #0
	ldr r1, [sp, #0x20]
	str r7, [r6]
	add r0, #0xa0
	str r1, [r0]
	add r1, r6, #0
	add r1, #0xa0
	ldr r1, [r1]
	mov r0, #0
	strh r0, [r1]
	add r1, r6, #0
	add r1, #0x97
	ldrb r3, [r1]
	mov r1, #1
	bic r3, r1
	add r1, sp, #8
	ldrb r2, [r1, #0x14]
	mov r1, #1
	and r1, r2
	add r2, r3, #0
	orr r2, r1
	add r1, r6, #0
	add r1, #0x97
	strb r2, [r1]
	add r1, sp, #8
	add r2, r6, #0
	ldrb r1, [r1, #0x10]
	add r2, #0x96
	mov r3, #3
	strb r1, [r2]
	add r2, r6, #0
	add r2, #0x98
	strb r4, [r2]
	add r2, r6, #0
	add r2, #0x99
	strb r5, [r2]
	add r2, r6, #0
	add r2, #0x9b
	strb r0, [r2]
	add r2, r7, #0
	add r2, #0x64
	str r2, [r6, #0x18]
	add r2, r6, #0
	add r2, #0x94
	strb r3, [r2]
	mov r2, #0xb5
	lsl r2, r2, #2
	strh r1, [r6, r2]
	add r3, r6, #0
	add r2, r0, #0
_0222E500:
	add r1, r3, #0
	add r1, #0xb4
	str r2, [r1]
	add r1, r3, #0
	add r1, #0xb8
	add r0, r0, #1
	add r3, #8
	str r2, [r1]
	cmp r0, #0x1c
	blt _0222E500
	add r0, r6, #0
	add r1, r6, #0
	mov r5, #0
	mov r4, #0xff
_0222E51C:
	mov r3, #0x6f
	lsl r3, r3, #2
	str r5, [r0, r3]
	add r3, r3, #4
	str r5, [r0, r3]
	mov r3, #0xa7
	lsl r3, r3, #2
	strh r4, [r1, r3]
	add r2, r2, #1
	add r0, #8
	add r1, r1, #2
	cmp r2, #0x1c
	blt _0222E51C
	add r4, r6, #0
_0222E538:
	ldr r1, [r7, #0x34]
	mov r0, #0x50
	bl String_ctor
	str r0, [r4, #0x1c]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #0x1c
	blt _0222E538
	add r6, #0xa0
	ldr r1, _0222E554 ; =0x0000EEEE
	ldr r0, [r6]
	strh r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E554: .word 0x0000EEEE
	thumb_func_end ov80_0222E450

	thumb_func_start ov80_0222E558
ov80_0222E558: ; 0x0222E558
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	str r2, [sp, #0x14]
	add r7, r1, #0
	mov r1, #0xb6
	ldr r0, [r5, #0x34]
	lsl r1, r1, #2
	add r4, r3, #0
	bl AllocFromHeap
	add r6, r0, #0
	bne _0222E578
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0222E578:
	mov r2, #0xb6
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	str r4, [sp]
	add r0, sp, #0x20
	ldrb r0, [r0, #0x10]
	add r1, r6, #0
	add r2, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	str r0, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, r5, #0
	bl ov80_0222E450
	add r0, r6, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222E558

	thumb_func_start ov80_0222E5A8
ov80_0222E5A8: ; 0x0222E5A8
	push {r3, lr}
	bl ov80_0222E690
	pop {r3, pc}
	thumb_func_end ov80_0222E5A8

	thumb_func_start ov80_0222E5B0
ov80_0222E5B0: ; 0x0222E5B0
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222E714
	mov r1, #7
	tst r1, r0
	bne _0222E5CE
	lsr r0, r0, #3
	b _0222E5D2
_0222E5CE:
	lsr r0, r0, #3
	add r0, r0, #1
_0222E5D2:
	add r1, r5, #0
	add r1, #0x97
	ldrb r1, [r1]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1f
	beq _0222E5EC
	add r1, r5, #0
	add r1, #0x98
	ldrb r1, [r1]
	sub r2, r1, r0
	add r1, r5, #0
	add r1, #0x98
	strb r2, [r1]
_0222E5EC:
	add r1, r5, #0
	add r1, #0x97
	ldrb r1, [r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1f
	beq _0222E60E
	add r1, r5, #0
	add r1, #0x99
	ldrb r2, [r1]
	add r1, r5, #0
	add r1, #0x9b
	ldrb r1, [r1]
	lsl r1, r1, #1
	sub r2, r2, r1
	add r1, r5, #0
	add r1, #0x99
	strb r2, [r1]
_0222E60E:
	add r1, r5, #0
	add r1, #0x99
	ldrb r1, [r1]
	lsl r0, r0, #0x18
	add r3, r5, #0
	str r1, [sp]
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r1, r5, #0
	mov r2, #1
	lsl r0, r0, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	add r3, #0x98
	ldrb r3, [r3]
	ldr r0, [r4]
	add r1, #8
	bl AddWindowParameterized
	add r0, r5, #0
	ldr r2, _0222E688 ; =0x000003D9
	add r0, #8
	mov r1, #1
	mov r3, #0xc
	bl DrawFrameAndWindow1
	add r0, r5, #0
	bl ov80_0222E754
	ldr r2, [r5]
	add r1, r5, #0
	add r1, #0x96
	ldr r2, [r2, #0x34]
	add r0, r5, #0
	lsl r2, r2, #0x18
	ldrb r1, [r1]
	add r0, #0xa4
	lsr r2, r2, #0x18
	bl Create2dMenu
	add r1, r5, #0
	add r1, #0xb0
	str r0, [r1]
	add r0, r5, #0
	bl ov80_0222E8FC
	ldr r0, _0222E68C ; =ov80_0222E7C8
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r5, #4]
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_0222E688: .word 0x000003D9
_0222E68C: .word ov80_0222E7C8
	thumb_func_end ov80_0222E5B0

	thumb_func_start ov80_0222E690
ov80_0222E690: ; 0x0222E690
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	ldr r1, [r5]
	mov r0, #0x50
	ldr r1, [r1, #0x34]
	add r6, r2, #0
	add r7, r3, #0
	bl String_ctor
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp]
	add r2, r4, #0
	bl ReadMsgDataIntoString
	add r1, r5, #0
	add r1, #0x9b
	ldrb r1, [r1]
	add r0, r5, #0
	add r0, #0x90
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r0, [r0]
	ldr r1, [r1, #0x1c]
	add r2, r4, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	add r0, #0x9b
	ldrb r1, [r0]
	lsl r0, r1, #2
	add r0, r5, r0
	lsl r1, r1, #3
	add r1, r5, r1
	ldr r0, [r0, #0x1c]
	add r1, #0xb4
	str r0, [r1]
	add r0, r4, #0
	bl String_dtor
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	lsl r0, r0, #1
	add r1, r5, r0
	mov r0, #0xa7
	lsl r0, r0, #2
	strh r6, [r1, r0]
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	lsl r0, r0, #3
	add r0, r5, r0
	add r0, #0xb8
	str r7, [r0]
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r5, #0x9b
	add r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E690

	thumb_func_start ov80_0222E714
ov80_0222E714: ; 0x0222E714
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0x9b
	ldrb r0, [r0]
	mov r6, #0
	add r4, r6, #0
	cmp r0, #0
	ble _0222E74C
	add r5, r7, #0
_0222E726:
	add r0, r5, #0
	add r0, #0xb4
	ldr r1, [r0]
	cmp r1, #0
	beq _0222E74C
	mov r0, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	cmp r6, r0
	bhs _0222E73E
	add r6, r0, #0
_0222E73E:
	add r0, r7, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r4, r4, #1
	add r5, #8
	cmp r4, r0
	blt _0222E726
_0222E74C:
	add r6, #0xc
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E714

	thumb_func_start ov80_0222E754
ov80_0222E754: ; 0x0222E754
	add r2, r0, #0
	add r1, r0, #0
	add r2, #0xb4
	add r1, #0xa4
	str r2, [r1]
	add r2, r0, #0
	add r1, r0, #0
	add r2, #8
	add r1, #0xa8
	str r2, [r1]
	add r1, r0, #0
	mov r2, #0
	add r1, #0xac
	strb r2, [r1]
	add r1, r0, #0
	mov r2, #1
	add r1, #0xad
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x9b
	ldrb r2, [r1]
	add r1, r0, #0
	add r1, #0xae
	strb r2, [r1]
	add r2, r0, #0
	add r2, #0xaf
	ldrb r3, [r2]
	mov r2, #0xf
	add r1, r0, #0
	bic r3, r2
	add r2, r0, #0
	add r2, #0xaf
	strb r3, [r2]
	add r2, r0, #0
	add r2, #0xaf
	ldrb r3, [r2]
	mov r2, #0x30
	add r1, #0xaf
	bic r3, r2
	add r2, r0, #0
	add r2, #0xaf
	strb r3, [r2]
	add r0, #0x9b
	ldrb r0, [r0]
	ldrb r2, [r1]
	cmp r0, #4
	blo _0222E7BE
	mov r0, #0xc0
	bic r2, r0
	mov r0, #0x40
	orr r0, r2
	strb r0, [r1]
	bx lr
_0222E7BE:
	mov r0, #0xc0
	bic r2, r0
	strb r2, [r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222E754

	thumb_func_start ov80_0222E7C8
ov80_0222E7C8: ; 0x0222E7C8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r0, r5, #0
	add r0, #0x94
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222E7E4
	add r0, r5, #0
	add r0, #0x94
	ldrb r0, [r0]
	add r5, #0x94
	sub r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, pc}
_0222E7E4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0222E87E
	add r0, r5, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl Handle2dMenuInput
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0222E814
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222E814
	add r0, r5, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl Get2dMenuSelection
	add r4, r0, #0
_0222E814:
	ldr r0, _0222E880 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x4c]
	tst r1, r0
	bne _0222E830
	mov r1, #0x80
	tst r1, r0
	bne _0222E830
	mov r1, #0x20
	tst r1, r0
	bne _0222E830
	mov r1, #0x10
	tst r0, r1
	beq _0222E836
_0222E830:
	add r0, r5, #0
	bl ov80_0222E8FC
_0222E836:
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldr r1, _0222E884 ; =0x0000EEDD
	ldrh r2, [r0]
	cmp r2, r1
	bne _0222E84C
	add r0, r5, #0
	bl ov80_0222E88C
	pop {r3, r4, r5, pc}
_0222E84C:
	mov r1, #1
	mvn r1, r1
	cmp r4, r1
	beq _0222E85C
	add r1, r1, #1
	cmp r4, r1
	beq _0222E87E
	b _0222E876
_0222E85C:
	add r1, r5, #0
	add r1, #0x97
	ldrb r1, [r1]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _0222E87E
	ldr r1, _0222E888 ; =0x0000FFFE
	strh r1, [r0]
	add r0, r5, #0
	bl ov80_0222E88C
	pop {r3, r4, r5, pc}
_0222E876:
	strh r4, [r0]
	add r0, r5, #0
	bl ov80_0222E88C
_0222E87E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222E880: .word gSystem
_0222E884: .word 0x0000EEDD
_0222E888: .word 0x0000FFFE
	thumb_func_end ov80_0222E7C8

	thumb_func_start ov80_0222E88C
ov80_0222E88C: ; 0x0222E88C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _0222E8F8 ; =0x000005DC
	ldr r7, [r6]
	bl PlaySE
	add r0, r6, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #0
	bl Delete2dMenu
	add r0, r6, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200E5D4
	add r0, r6, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl RemoveWindow
	mov r4, #0
	add r5, r6, #0
_0222E8BE:
	ldr r0, [r5, #0x1c]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x1c
	blt _0222E8BE
	add r0, r6, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222E8E4
	add r0, r6, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl DestroyMsgData
_0222E8E4:
	ldr r0, [r6, #4]
	bl DestroySysTask
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #0
	str r0, [r7, #0x60]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E8F8: .word 0x000005DC
	thumb_func_end ov80_0222E88C

	thumb_func_start ov80_0222E8FC
ov80_0222E8FC: ; 0x0222E8FC
	push {r4, lr}
	add r4, r0, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl Get2dMenuSelection
	lsl r0, r0, #1
	add r1, r4, r0
	mov r0, #0xa7
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	cmp r1, #0xff
	beq _0222E91E
	add r0, r4, #0
	mov r2, #0
	bl ov80_0222EE14
_0222E91E:
	pop {r4, pc}
	thumb_func_end ov80_0222E8FC

	thumb_func_start ov80_0222E920
ov80_0222E920: ; 0x0222E920
	push {r4, lr}
	sub sp, #0x10
	add r4, sp, #8
	ldrb r4, [r4, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x1c]
	str r4, [sp, #4]
	ldr r4, [sp, #0x20]
	str r4, [sp, #8]
	ldr r4, [sp, #0x24]
	str r4, [sp, #0xc]
	bl ov80_0222E558
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222E920

	thumb_func_start ov80_0222E940
ov80_0222E940: ; 0x0222E940
	push {r3, lr}
	bl ov80_0222EA74
	pop {r3, pc}
	thumb_func_end ov80_0222E940

	thumb_func_start ov80_0222E948
ov80_0222E948: ; 0x0222E948
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	bl ov80_0222AB34
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222EB14
	mov r1, #7
	tst r1, r0
	bne _0222E966
	lsr r1, r0, #3
	b _0222E96A
_0222E966:
	lsr r0, r0, #3
	add r1, r0, #1
_0222E96A:
	add r0, r5, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	beq _0222E984
	add r0, r5, #0
	add r0, #0x98
	ldrb r0, [r0]
	sub r2, r0, r1
	add r0, r5, #0
	add r0, #0x98
	strb r2, [r0]
_0222E984:
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	cmp r0, #8
	bls _0222E9D4
	add r0, r5, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	beq _0222E9A8
	add r0, r5, #0
	add r0, #0x99
	ldrb r2, [r0]
	add r0, r5, #0
	add r0, #0x99
	sub r2, #0x10
	strb r2, [r0]
_0222E9A8:
	add r0, r5, #0
	add r0, #0x99
	ldrb r0, [r0]
	add r3, r5, #0
	mov r2, #1
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	mov r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	add r3, #0x98
	add r1, r5, #0
	ldrb r3, [r3]
	ldr r0, [r4]
	add r1, #8
	bl AddWindowParameterized
	b _0222EA22
_0222E9D4:
	add r2, r5, #0
	add r2, #0x97
	ldrb r2, [r2]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1f
	beq _0222E9F0
	add r2, r5, #0
	add r2, #0x99
	ldrb r2, [r2]
	lsl r0, r0, #1
	sub r2, r2, r0
	add r0, r5, #0
	add r0, #0x99
	strb r2, [r0]
_0222E9F0:
	add r0, r5, #0
	add r0, #0x99
	ldrb r0, [r0]
	add r3, r5, #0
	mov r2, #1
	str r0, [sp]
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r1, r5, #0
	add r3, #0x98
	lsl r0, r0, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	ldrb r3, [r3]
	ldr r0, [r4]
	add r1, #8
	bl AddWindowParameterized
_0222EA22:
	add r0, r5, #0
	ldr r2, _0222EA6C ; =0x000003D9
	add r0, #8
	mov r1, #1
	mov r3, #0xc
	bl DrawFrameAndWindow1
	add r0, r5, #0
	bl ov80_0222EB54
	ldr r3, [r5]
	add r2, r5, #0
	add r2, #0x96
	ldr r3, [r3, #0x34]
	mov r0, #0x65
	lsl r0, r0, #2
	lsl r3, r3, #0x18
	ldrb r2, [r2]
	add r0, r5, r0
	mov r1, #0
	lsr r3, r3, #0x18
	bl ListMenuInit
	mov r1, #0x6d
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	bl ov80_0222EE7C
	ldr r0, _0222EA70 ; =ov80_0222EC90
	add r1, r5, #0
	mov r2, #0
	bl CreateSysTask
	str r0, [r5, #4]
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
_0222EA6C: .word 0x000003D9
_0222EA70: .word ov80_0222EC90
	thumb_func_end ov80_0222E948

	thumb_func_start ov80_0222EA74
ov80_0222EA74: ; 0x0222EA74
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	ldr r1, [r5]
	mov r0, #0x50
	ldr r1, [r1, #0x34]
	add r7, r2, #0
	add r4, r3, #0
	bl String_ctor
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp]
	add r2, r6, #0
	bl ReadMsgDataIntoString
	add r1, r5, #0
	add r1, #0x9b
	ldrb r1, [r1]
	add r0, r5, #0
	add r0, #0x90
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r0, [r0]
	ldr r1, [r1, #0x1c]
	add r2, r6, #0
	bl StringExpandPlaceholders
	add r0, r5, #0
	add r0, #0x9b
	ldrb r1, [r0]
	lsl r0, r1, #2
	add r0, r5, r0
	lsl r1, r1, #3
	add r2, r5, r1
	mov r1, #0x6f
	ldr r0, [r0, #0x1c]
	lsl r1, r1, #2
	str r0, [r2, r1]
	add r0, r6, #0
	bl String_dtor
	cmp r4, #0xfa
	bne _0222EAE6
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	mov r2, #2
	mvn r2, r2
	lsl r0, r0, #3
	add r1, r5, r0
	mov r0, #7
	lsl r0, r0, #6
	str r2, [r1, r0]
	b _0222EAF6
_0222EAE6:
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	lsl r0, r0, #3
	add r1, r5, r0
	mov r0, #7
	lsl r0, r0, #6
	str r4, [r1, r0]
_0222EAF6:
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	lsl r0, r0, #1
	add r1, r5, r0
	mov r0, #0xa7
	lsl r0, r0, #2
	strh r7, [r1, r0]
	add r0, r5, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r5, #0x9b
	add r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222EA74

	thumb_func_start ov80_0222EB14
ov80_0222EB14: ; 0x0222EB14
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r0, #0x9b
	ldrb r0, [r0]
	mov r6, #0
	add r4, r6, #0
	cmp r0, #0
	ble _0222EB4C
	add r5, r7, #0
_0222EB26:
	mov r0, #0x6f
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	cmp r1, #0
	beq _0222EB4C
	mov r0, #0
	add r2, r0, #0
	bl FontID_String_GetWidth
	cmp r6, r0
	bhs _0222EB3E
	add r6, r0, #0
_0222EB3E:
	add r0, r7, #0
	add r0, #0x9b
	ldrb r0, [r0]
	add r4, r4, #1
	add r5, #8
	cmp r4, r0
	blt _0222EB26
_0222EB4C:
	add r6, #0xc
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222EB14

	thumb_func_start ov80_0222EB54
ov80_0222EB54: ; 0x0222EB54
	push {r4, r5}
	mov r3, #0x6f
	lsl r3, r3, #2
	add r1, r3, #0
	add r2, r0, r3
	sub r1, #0x28
	str r2, [r0, r1]
	add r1, r3, #0
	ldr r2, _0222EC4C ; =ov80_0222EC84
	sub r1, #0x24
	str r2, [r0, r1]
	add r1, r3, #0
	ldr r2, _0222EC50 ; =ov80_0222EC60
	sub r1, #0x20
	str r2, [r0, r1]
	add r2, r0, #0
	add r1, r3, #0
	add r2, #8
	sub r1, #0x1c
	str r2, [r0, r1]
	add r1, r0, #0
	add r1, #0x9b
	ldrb r2, [r1]
	add r1, r3, #0
	sub r1, #0x18
	strh r2, [r0, r1]
	add r1, r3, #0
	mov r2, #8
	sub r1, #0x16
	strh r2, [r0, r1]
	add r1, r3, #0
	mov r2, #1
	sub r1, #0x14
	strb r2, [r0, r1]
	add r1, r3, #0
	mov r4, #0xc
	sub r1, #0x13
	strb r4, [r0, r1]
	add r1, r3, #0
	mov r4, #2
	sub r1, #0x12
	strb r4, [r0, r1]
	add r1, r3, #0
	sub r1, #0x11
	ldrb r4, [r0, r1]
	mov r1, #0xf
	bic r4, r1
	orr r4, r2
	add r2, r3, #0
	sub r2, #0x11
	strb r4, [r0, r2]
	add r2, r3, #0
	sub r2, #0x11
	ldrb r5, [r0, r2]
	mov r2, #0xf0
	mov r4, #0x10
	bic r5, r2
	orr r5, r4
	add r4, r3, #0
	sub r4, #0x11
	strb r5, [r0, r4]
	add r4, r3, #0
	sub r4, #0x10
	ldrb r4, [r0, r4]
	bic r4, r1
	mov r1, #0xf
	orr r4, r1
	add r1, r3, #0
	sub r1, #0x10
	strb r4, [r0, r1]
	add r1, r3, #0
	sub r1, #0x10
	ldrb r4, [r0, r1]
	mov r1, #0x20
	bic r4, r2
	add r2, r4, #0
	orr r2, r1
	add r1, r3, #0
	sub r1, #0x10
	strb r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	mov r1, #7
	bic r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	mov r1, #0x78
	bic r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _0222EC54 ; =0xFFFFFE7F
	and r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _0222EC58 ; =0xFFFF81FF
	and r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	add r1, r3, #0
	sub r1, #0xe
	ldrh r2, [r0, r1]
	ldr r1, _0222EC5C ; =0xFFFF7FFF
	and r2, r1
	add r1, r3, #0
	sub r1, #0xe
	strh r2, [r0, r1]
	sub r3, #0xc
	str r0, [r0, r3]
	pop {r4, r5}
	bx lr
	.balign 4, 0
_0222EC4C: .word ov80_0222EC84
_0222EC50: .word ov80_0222EC60
_0222EC54: .word 0xFFFFFE7F
_0222EC58: .word 0xFFFF81FF
_0222EC5C: .word 0xFFFF7FFF
	thumb_func_end ov80_0222EB54

	thumb_func_start ov80_0222EC60
ov80_0222EC60: ; 0x0222EC60
	push {r3, lr}
	mov r2, #2
	mvn r2, r2
	cmp r1, r2
	bne _0222EC76
	mov r1, #3
	mov r2, #0xf
	mov r3, #4
	bl ListMenuOverrideSetColors
	pop {r3, pc}
_0222EC76:
	mov r1, #1
	mov r2, #0xf
	mov r3, #2
	bl ListMenuOverrideSetColors
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222EC60

	thumb_func_start ov80_0222EC84
ov80_0222EC84: ; 0x0222EC84
	ldr r3, _0222EC8C ; =ListMenuGetTemplateField
	mov r1, #0x13
	bx r3
	nop
_0222EC8C: .word ListMenuGetTemplateField
	thumb_func_end ov80_0222EC84

	thumb_func_start ov80_0222EC90
ov80_0222EC90: ; 0x0222EC90
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r0, r5, #0
	add r0, #0x94
	ldrb r0, [r0]
	cmp r0, #0
	beq _0222ECAC
	add r0, r5, #0
	add r0, #0x94
	ldrb r0, [r0]
	add r5, #0x94
	sub r0, r0, #1
	strb r0, [r5]
	pop {r4, r5, r6, pc}
_0222ECAC:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0222ED8C
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenu_ProcessInput
	add r4, r0, #0
	mov r0, #0x6d
	mov r1, #0xb5
	lsl r0, r0, #2
	lsl r1, r1, #2
	ldrh r6, [r5, r1]
	ldr r0, [r5, r0]
	add r1, r5, r1
	bl ListMenuGetCurrentItemArrayId
	mov r0, #0xb5
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r6, r0
	beq _0222ECE2
	ldr r0, _0222ED90 ; =0x000005DC
	bl PlaySE
_0222ECE2:
	ldr r0, _0222ED94 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x4c]
	tst r1, r0
	bne _0222ECFE
	mov r1, #0x80
	tst r1, r0
	bne _0222ECFE
	mov r1, #0x20
	tst r1, r0
	bne _0222ECFE
	mov r1, #0x10
	tst r0, r1
	beq _0222ED04
_0222ECFE:
	add r0, r5, #0
	bl ov80_0222EE7C
_0222ED04:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _0222ED26
	bl System_GetTouchNew
	cmp r0, #1
	bne _0222ED26
	mov r1, #0xb5
	mov r0, #0x6d
	lsl r1, r1, #2
	lsl r0, r0, #2
	ldrh r1, [r5, r1]
	ldr r0, [r5, r0]
	bl ListMenuGetValueByArrayId
	add r4, r0, #0
_0222ED26:
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	ldrh r1, [r0]
	ldr r0, _0222ED98 ; =0x0000EEDD
	cmp r1, r0
	bne _0222ED3E
	add r0, r5, #0
	mov r1, #0
	bl ov80_0222EDA0
	pop {r4, r5, r6, pc}
_0222ED3E:
	mov r0, #1
	mvn r0, r0
	cmp r4, r0
	beq _0222ED4E
	add r0, r0, #1
	cmp r4, r0
	beq _0222ED8C
	b _0222ED76
_0222ED4E:
	add r0, r5, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222ED8C
	ldr r0, _0222ED90 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	add r0, #0xa0
	ldr r1, _0222ED9C ; =0x0000FFFE
	ldr r0, [r0]
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #1
	bl ov80_0222EDA0
	pop {r4, r5, r6, pc}
_0222ED76:
	ldr r0, _0222ED90 ; =0x000005DC
	bl PlaySE
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #1
	strh r4, [r0]
	add r0, r5, #0
	bl ov80_0222EDA0
_0222ED8C:
	pop {r4, r5, r6, pc}
	nop
_0222ED90: .word 0x000005DC
_0222ED94: .word gSystem
_0222ED98: .word 0x0000EEDD
_0222ED9C: .word 0x0000FFFE
	thumb_func_end ov80_0222EC90

	thumb_func_start ov80_0222EDA0
ov80_0222EDA0: ; 0x0222EDA0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r7, [r6]
	cmp r1, #1
	bne _0222EDB0
	ldr r0, _0222EE10 ; =0x000005DC
	bl PlaySE
_0222EDB0:
	mov r0, #0x6d
	lsl r0, r0, #2
	mov r1, #0
	ldr r0, [r6, r0]
	add r2, r1, #0
	bl DestroyListMenu
	mov r0, #0x1a
	lsl r0, r0, #4
	ldr r0, [r6, r0]
	mov r1, #0
	bl sub_0200E5D4
	add r0, r6, #0
	add r0, #8
	bl RemoveWindow
	mov r4, #0
	add r5, r6, #0
_0222EDD6:
	ldr r0, [r5, #0x1c]
	bl String_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x1c
	blt _0222EDD6
	add r0, r6, #0
	add r0, #0x97
	ldrb r0, [r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0222EDFC
	add r0, r6, #0
	add r0, #0x8c
	ldr r0, [r0]
	bl DestroyMsgData
_0222EDFC:
	ldr r0, [r6, #4]
	bl DestroySysTask
	add r0, r6, #0
	bl FreeToHeap
	mov r0, #0
	str r0, [r7, #0x60]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EE10: .word 0x000005DC
	thumb_func_end ov80_0222EDA0

	thumb_func_start ov80_0222EE14
ov80_0222EE14: ; 0x0222EE14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	str r1, [sp, #0xc]
	ldr r1, [r5]
	mov r0, #0x50
	ldr r1, [r1, #0x34]
	add r7, r2, #0
	bl String_ctor
	ldr r1, [r5]
	add r4, r0, #0
	ldr r1, [r1, #0x34]
	mov r0, #0x50
	bl String_ctor
	add r6, r0, #0
	ldr r0, [r5, #0x18]
	mov r1, #0xf
	bl FillWindowPixelBuffer
	add r0, r5, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [sp, #0xc]
	add r2, r4, #0
	bl ReadMsgDataIntoString
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	mov r3, #0
	str r3, [sp]
	str r7, [sp, #4]
	str r3, [sp, #8]
	ldr r0, [r5, #0x18]
	mov r1, #1
	add r2, r6, #0
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222EE14

	thumb_func_start ov80_0222EE7C
ov80_0222EE7C: ; 0x0222EE7C
	push {r4, lr}
	mov r1, #0x6d
	add r4, r0, #0
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #6
	add r1, r4, r1
	bl ListMenuGetCurrentItemArrayId
	ldr r0, _0222EEA8 ; =0x000001BA
	ldrh r1, [r4, r0]
	add r0, #0xe2
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, r0]
	cmp r1, #0xff
	beq _0222EEA6
	add r0, r4, #0
	mov r2, #0
	bl ov80_0222EE14
_0222EEA6:
	pop {r4, pc}
	.balign 4, 0
_0222EEA8: .word 0x000001BA
	thumb_func_end ov80_0222EE7C

	thumb_func_start ov80_0222EEAC
ov80_0222EEAC: ; 0x0222EEAC
	push {r3, lr}
	cmp r0, #0
	beq _0222EEC2
	add r1, r0, #0
	add r1, #0xa0
	ldr r2, _0222EEC4 ; =0x0000FFFE
	ldr r1, [r1]
	strh r2, [r1]
	mov r1, #0
	bl ov80_0222EDA0
_0222EEC2:
	pop {r3, pc}
	.balign 4, 0
_0222EEC4: .word 0x0000FFFE
	thumb_func_end ov80_0222EEAC

	thumb_func_start ov80_0222EEC8
ov80_0222EEC8: ; 0x0222EEC8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	ldrh r4, [r0]
	ldrh r6, [r0, #2]
	ldrb r0, [r5]
	cmp r0, #0
	beq _0222EEE8
	cmp r0, #1
	beq _0222EEF6
	cmp r0, #2
	beq _0222EF9A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222EEE8:
	ldr r0, _0222EFC8 ; =0x0000FD13
	cmp r4, r0
	bne _0222EEF6
	mov r0, #2
	add sp, #8
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222EEF6:
	ldr r0, [r5, #0x14]
	mov r1, #5
	ldr r0, [r0]
	bl ov42_02228188
	cmp r0, #0
	bne _0222EFC2
	cmp r4, #0x20
	blo _0222EF2E
	cmp r4, #0x26
	bhi _0222EF2E
	mov r0, #2
	ldrsh r1, [r5, r0]
	sub r4, #0x20
	add r1, r1, #1
	strh r1, [r5, #2]
	ldrsh r1, [r5, r0]
	ldr r0, _0222EFCC ; =ov80_0223BD44
	ldrb r0, [r0, r4]
	cmp r1, r0
	blt _0222EFC2
	mov r0, #0
	strh r0, [r5, #2]
	ldr r0, [r5, #0xc]
	add sp, #8
	add r0, r0, #4
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_0222EF2E:
	cmp r4, #0x27
	blo _0222EF66
	cmp r4, #0x29
	bhs _0222EF66
	cmp r4, #0x27
	beq _0222EF40
	cmp r4, #0x28
	beq _0222EF4C
	b _0222EF58
_0222EF40:
	ldr r0, [r5, #0x14]
	mov r1, #1
	ldr r0, [r0, #4]
	bl ov42_02229200
	b _0222EF5C
_0222EF4C:
	ldr r0, [r5, #0x14]
	mov r1, #0
	ldr r0, [r0, #4]
	bl ov42_02229200
	b _0222EF5C
_0222EF58:
	bl GF_AssertFail
_0222EF5C:
	ldr r0, [r5, #0xc]
	add sp, #8
	add r0, r0, #4
	str r0, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
_0222EF66:
	ldr r1, [r5, #0x14]
	ldrh r2, [r5, #4]
	ldr r1, [r1]
	add r0, sp, #0
	add r3, r4, #0
	bl ov80_0222EFD0
	ldr r0, [r5, #0x10]
	add r1, sp, #0
	bl ov42_022299C0
	ldrb r0, [r5, #1]
	add r0, r0, #1
	strb r0, [r5, #1]
	ldrb r0, [r5, #1]
	cmp r0, r6
	blt _0222EF92
	mov r0, #0
	strb r0, [r5, #1]
	ldr r0, [r5, #0xc]
	add r0, r0, #4
	str r0, [r5, #0xc]
_0222EF92:
	mov r0, #0
	add sp, #8
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222EF9A:
	ldr r0, [r5, #0x14]
	mov r1, #5
	ldr r0, [r0]
	bl ov42_02228188
	cmp r0, #0
	bne _0222EFC2
	ldr r1, [r5, #8]
	ldrb r0, [r1]
	sub r0, r0, #1
	strb r0, [r1]
	ldr r0, [r5, #0x14]
	mov r1, #0
	str r1, [r0, #0x38]
	add r0, r5, #0
	bl FreeToHeap
	add r0, r7, #0
	bl DestroySysTask
_0222EFC2:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222EFC8: .word 0x0000FD13
_0222EFCC: .word ov80_0223BD44
	thumb_func_end ov80_0222EEC8

	thumb_func_start ov80_0222EFD0
ov80_0222EFD0: ; 0x0222EFD0
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	strb r2, [r4, #7]
	ldr r0, _0222F028 ; =ov80_0223DC22
	lsl r2, r3, #2
	ldrh r0, [r0, r2]
	strb r0, [r4, #6]
	ldr r0, _0222F02C ; =_0223DC20
	ldrh r0, [r0, r2]
	strh r0, [r4, #4]
	cmp r0, #2
	beq _0222EFF2
	cmp r0, #3
	beq _0222EFF2
	cmp r0, #6
	bne _0222F00C
_0222EFF2:
	add r0, r1, #0
	bl ov42_022282E8
	add r1, sp, #0
	strh r0, [r1, #4]
	lsr r0, r0, #0x10
	strh r0, [r1, #6]
	ldrh r0, [r1, #4]
	add sp, #8
	strh r0, [r4]
	ldrh r0, [r1, #6]
	strh r0, [r4, #2]
	pop {r4, pc}
_0222F00C:
	add r0, r1, #0
	bl ov42_022282DC
	add r1, sp, #0
	strh r0, [r1]
	lsr r0, r0, #0x10
	strh r0, [r1, #2]
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r1, #2]
	strh r0, [r4, #2]
	add sp, #8
	pop {r4, pc}
	nop
_0222F028: .word ov80_0223DC22
_0222F02C: .word _0223DC20
	thumb_func_end ov80_0222EFD0

	thumb_func_start ov80_0222F030
ov80_0222F030: ; 0x0222F030
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	add r5, r0, #0
	ldr r0, [r5, #4]
	str r1, [sp, #0x20]
	str r0, [sp, #0x2c]
	ldr r7, [r5, #0x34]
	ldr r6, [r5, #0x38]
	mov r0, #8
	add r1, r2, #0
	str r2, [sp, #0x24]
	add r4, r3, #0
	bl NARC_ctor
	str r0, [sp, #0x30]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [sp, #0x30]
	add r0, r7, #0
	add r1, r6, #0
	mov r3, #0x70
	str r4, [sp, #8]
	bl sub_0200D504
	ldr r0, [sp, #0x30]
	mov r1, #2
	str r0, [sp]
	mov r0, #0x6f
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	add r2, r7, #0
	add r3, r6, #0
	str r4, [sp, #0x14]
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	ldr r2, [sp, #0x30]
	add r0, r7, #0
	add r1, r6, #0
	mov r3, #0x71
	str r4, [sp, #4]
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r2, [sp, #0x30]
	add r0, r7, #0
	add r1, r6, #0
	mov r3, #0x72
	str r4, [sp, #4]
	bl sub_0200D71C
	ldr r0, [sp, #0x30]
	bl NARC_dtor
	add r0, sp, #0x38
	mov r1, #0
	mov r2, #0x34
	bl MI_CpuFill8
	ldr r0, [sp, #0x90]
	add r1, sp, #0x38
	strh r0, [r1]
	ldr r0, [sp, #0x94]
	strh r0, [r1, #2]
	mov r0, #0
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	ldr r1, [sp, #0x98]
	str r0, [sp, #0x44]
	str r1, [sp, #0x40]
	mov r1, #1
	str r1, [sp, #0x48]
	ldr r1, [sp, #0x9c]
	str r0, [sp, #0x68]
	str r1, [sp, #0x64]
	add r1, sp, #0x38
_0222F0DA:
	add r0, r0, #1
	str r4, [r1, #0x14]
	add r1, r1, #4
	cmp r0, #6
	blt _0222F0DA
	add r0, r7, #0
	add r1, r6, #0
	add r2, sp, #0x38
	bl sub_0200D734
	add r6, r0, #0
	bl sub_0200DC18
	mov r1, #0x32
	ldr r0, [sp, #0x24]
	lsl r1, r1, #6
	bl AllocFromHeap
	str r0, [sp, #0x28]
	mov r1, #0
	ldr r0, [sp, #0x20]
	add r2, r1, #0
	bl GetMonData
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x20]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	ldr r1, [sp, #0x20]
	add r0, sp, #0x6c
	mov r2, #2
	bl GetPokemonSpriteCharAndPlttNarcIds
	mov r3, #0
	str r3, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	add r1, sp, #0x38
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x34]
	ldr r2, [sp, #0x24]
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	mov r0, #2
	str r0, [sp, #0x18]
	str r7, [sp, #0x1c]
	ldrh r0, [r1, #0x34]
	ldrh r1, [r1, #0x36]
	bl sub_02014494
	ldr r0, [r6]
	bl sub_02024B1C
	add r7, r0, #0
	ldr r0, [sp, #0x28]
	mov r1, #4
	bl DC_FlushRange
	mov r2, #0x32
	ldr r0, [sp, #0x28]
	ldr r1, [r7, #4]
	lsl r2, r2, #6
	bl GX_LoadOBJ
	ldr r0, [r6]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	lsl r7, r0, #4
	mov r0, #2
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r2, sp, #0x38
	ldrh r1, [r2, #0x34]
	ldrh r2, [r2, #0x38]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0x24]
	bl PaletteData_LoadNarc
	ldr r0, [sp, #0xa0]
	cmp r0, #0
	ble _0222F1AE
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x80
	ldrh r0, [r0, #0x24]
	lsl r2, r7, #0x10
	mov r1, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	lsr r2, r2, #0x10
	mov r3, #0x10
	bl sub_02003E5C
_0222F1AE:
	ldr r0, [sp, #0x28]
	bl FreeToHeap
	ldr r0, _0222F1CC ; =0x0000C350
	add r5, #0x80
	sub r0, r4, r0
	lsl r4, r0, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	beq _0222F1C6
	bl GF_AssertFail
_0222F1C6:
	str r6, [r5, r4]
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F1CC: .word 0x0000C350
	thumb_func_end ov80_0222F030

	thumb_func_start ov80_0222F1D0
ov80_0222F1D0: ; 0x0222F1D0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _0222F20C ; =0x0000C350
	add r6, r1, #0
	add r4, r5, #0
	sub r0, r6, r0
	add r4, #0x80
	lsl r7, r0, #2
	ldr r0, [r4, r7]
	bl sub_0200D9DC
	mov r0, #0
	str r0, [r4, r7]
	ldr r0, [r5, #0x38]
	add r1, r6, #0
	bl sub_0200D958
	ldr r0, [r5, #0x38]
	add r1, r6, #0
	bl sub_0200D968
	ldr r0, [r5, #0x38]
	add r1, r6, #0
	bl sub_0200D978
	ldr r0, [r5, #0x38]
	add r1, r6, #0
	bl sub_0200D988
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F20C: .word 0x0000C350
	thumb_func_end ov80_0222F1D0

	thumb_func_start ov80_0222F210
ov80_0222F210: ; 0x0222F210
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	bl sub_02074490
	mov r1, #0x14
	str r1, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #3
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	mov r0, #0x7d
	lsl r0, r0, #4
	str r0, [sp, #0x14]
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x38]
	mov r1, #2
	bl sub_0200D644
	bl sub_02074498
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	mov r2, #0x14
	bl sub_0200D6D4
	bl sub_020744A4
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x7d
	lsl r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	mov r2, #0x14
	bl sub_0200D704
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F210

	thumb_func_start ov80_0222F278
ov80_0222F278: ; 0x0222F278
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0x7d
	ldr r0, [r4, #0x38]
	lsl r1, r1, #4
	bl sub_0200D978
	mov r1, #0x7d
	ldr r0, [r4, #0x38]
	lsl r1, r1, #4
	bl sub_0200D988
	mov r1, #0x7d
	ldr r0, [r4, #0x38]
	lsl r1, r1, #4
	bl sub_0200D968
	pop {r4, pc}
	thumb_func_end ov80_0222F278

	thumb_func_start ov80_0222F29C
ov80_0222F29C: ; 0x0222F29C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r4, r2, #0
	add r5, r0, #0
	add r7, r1, #0
	str r3, [sp, #0xc]
	cmp r4, #8
	blt _0222F2B0
	bl GF_AssertFail
_0222F2B0:
	add r0, r7, #0
	bl Pokemon_GetIconNaix
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x7d
	lsl r0, r0, #4
	add r0, r4, r0
	str r0, [sp, #8]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	mov r2, #0x14
	bl sub_0200E188
	ldr r6, _0222F320 ; =ov80_0223BD80
	add r3, sp, #0x10
	mov r2, #6
_0222F2D8:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222F2D8
	ldr r0, [r6]
	add r1, sp, #0x10
	str r0, [r3]
	ldr r0, [sp, #0x24]
	add r2, sp, #0x10
	add r0, r0, r4
	str r0, [sp, #0x24]
	ldr r0, [sp, #0xc]
	strh r0, [r1]
	ldr r0, [sp, #0x58]
	strh r0, [r1, #2]
	mov r0, #0xc8
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_0200D734
	add r4, r0, #0
	add r0, r7, #0
	bl Pokemon_GetIconPalette
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_02024AA8
	add r0, r4, #0
	bl sub_0200DC18
	add r0, r4, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_0222F320: .word ov80_0223BD80
	thumb_func_end ov80_0222F29C

	thumb_func_start ov80_0222F324
ov80_0222F324: ; 0x0222F324
	push {r4, lr}
	add r4, r1, #0
	mov r1, #0x7d
	lsl r1, r1, #4
	ldr r0, [r0, #0x38]
	add r1, r2, r1
	bl sub_0200D958
	add r0, r4, #0
	bl sub_0200D9DC
	pop {r4, pc}
	thumb_func_end ov80_0222F324

	thumb_func_start ov80_0222F33C
ov80_0222F33C: ; 0x0222F33C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	mov r0, #0x15
	mov r1, #0x65
	bl NARC_ctor
	add r4, r0, #0
	bl sub_0207CAA0
	str r4, [sp]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0222F3C4 ; =0x000007D1
	mov r1, #2
	str r0, [sp, #0x14]
	ldr r0, [r5, #4]
	ldr r2, [r5, #0x34]
	ldr r3, [r5, #0x38]
	bl sub_0200D68C
	bl sub_0207CAA4
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222F3C4 ; =0x000007D1
	add r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_0200D6EC
	bl sub_0207CAA8
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, _0222F3C4 ; =0x000007D1
	add r2, r4, #0
	str r0, [sp, #4]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_0200D71C
	bl sub_0207CA9C
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0222F3C8 ; =0x000007D9
	mov r2, #0x15
	str r0, [sp, #8]
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_0200E188
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222F3C4: .word 0x000007D1
_0222F3C8: .word 0x000007D9
	thumb_func_end ov80_0222F33C

	thumb_func_start ov80_0222F3CC
ov80_0222F3CC: ; 0x0222F3CC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x38]
	ldr r1, _0222F3F4 ; =0x000007D9
	bl sub_0200D958
	ldr r0, [r4, #0x38]
	ldr r1, _0222F3F8 ; =0x000007D1
	bl sub_0200D978
	ldr r0, [r4, #0x38]
	ldr r1, _0222F3F8 ; =0x000007D1
	bl sub_0200D988
	ldr r0, [r4, #0x38]
	ldr r1, _0222F3F8 ; =0x000007D1
	bl sub_0200D968
	pop {r4, pc}
	nop
_0222F3F4: .word 0x000007D9
_0222F3F8: .word 0x000007D1
	thumb_func_end ov80_0222F3CC

	thumb_func_start ov80_0222F3FC
ov80_0222F3FC: ; 0x0222F3FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	ldr r5, _0222F43C ; =ov80_0223BD4C
	add r6, r2, #0
	add r3, r0, #0
	add r7, r1, #0
	add r4, sp, #0
	mov r2, #6
_0222F40C:
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _0222F40C
	ldr r0, [r5]
	add r2, sp, #0
	str r0, [r4]
	add r0, sp, #0
	strh r7, [r0]
	strh r6, [r0, #2]
	mov r0, #0x4b
	lsl r0, r0, #2
	str r0, [sp, #8]
	ldr r0, [r3, #0x34]
	ldr r1, [r3, #0x38]
	bl sub_0200D734
	add r4, r0, #0
	bl sub_0200DC18
	add r0, r4, #0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0222F43C: .word ov80_0223BD4C
	thumb_func_end ov80_0222F3FC

	thumb_func_start ov80_0222F440
ov80_0222F440: ; 0x0222F440
	ldr r3, _0222F448 ; =sub_0200D9DC
	add r0, r1, #0
	bx r3
	nop
_0222F448: .word sub_0200D9DC
	thumb_func_end ov80_0222F440

	thumb_func_start ov80_0222F44C
ov80_0222F44C: ; 0x0222F44C
	ldr r3, _0222F454 ; =ov80_0222F458
	mov r2, #0xb5
	lsl r2, r2, #2
	bx r3
	.balign 4, 0
_0222F454: .word ov80_0222F458
	thumb_func_end ov80_0222F44C

	thumb_func_start ov80_0222F458
ov80_0222F458: ; 0x0222F458
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	bl sub_02096808
	ldrh r2, [r4]
	ldr r1, _0222F4C8 ; =0x0000FFFF
	cmp r2, r1
	bne _0222F498
	mov r0, #1
	mov r1, #0x1b
	add r2, r6, #0
	mov r3, #0x20
	bl NewMsgDataFromNarc
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r4, #2]
	ldr r0, [r5]
	add r1, r6, #0
	mov r3, #1
	bl ov80_0222E268
	add r0, r6, #0
	bl DestroyMsgData
	b _0222F4BC
_0222F498:
	ldr r0, [r0, #8]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	add r1, r0, #0
	ldrh r0, [r4, #4]
	str r0, [sp]
	mov r0, #6
	ldrsh r0, [r4, r0]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldrh r2, [r4]
	ldrh r3, [r4, #2]
	ldr r0, [r5]
	bl ov80_0222E3B8
_0222F4BC:
	ldr r1, _0222F4CC ; =ov80_0222F4D0
	add r0, r5, #0
	bl ov80_0222AB84
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222F4C8: .word 0x0000FFFF
_0222F4CC: .word ov80_0222F4D0
	thumb_func_end ov80_0222F458

	thumb_func_start ov80_0222F4D0
ov80_0222F4D0: ; 0x0222F4D0
	push {r3, lr}
	ldr r0, [r0]
	add r0, #0x50
	ldrb r0, [r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _0222F4EA
	mov r0, #0
	bl sub_02002B8C
	mov r0, #1
	pop {r3, pc}
_0222F4EA:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F4D0

	thumb_func_start ov80_0222F4F0
ov80_0222F4F0: ; 0x0222F4F0
	push {r4, lr}
	add r4, r1, #0
	mov r1, #8
	ldrsb r2, [r4, r1]
	add r2, r2, #1
	strb r2, [r4, #8]
	ldrsb r2, [r4, r1]
	mov r1, #9
	ldrsb r1, [r4, r1]
	cmp r2, r1
	ble _0222F538
	mov r1, #0
	strb r1, [r4, #8]
	mov r1, #0xa
	ldrsb r2, [r4, r1]
	sub r2, r2, #1
	strb r2, [r4, #0xa]
	ldrsb r1, [r4, r1]
	cmp r1, #0
	bge _0222F528
	bl DestroySysTask
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	pop {r4, pc}
_0222F528:
	mov r0, #4
	ldrsh r0, [r4, r0]
	neg r0, r0
	strh r0, [r4, #4]
	mov r0, #6
	ldrsh r0, [r4, r0]
	neg r0, r0
	strh r0, [r4, #6]
_0222F538:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F4F0

	thumb_func_start ov80_0222F53C
ov80_0222F53C: ; 0x0222F53C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #8
	add r7, r0, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bgt _0222F5C2
	mov r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _0222F5A6
	ldr r2, _0222F5C8 ; =0x04000048
	mov r1, #0x3f
	ldrh r3, [r2]
	mov r0, #0xf
	mov r5, #0x20
	bic r3, r1
	orr r0, r3
	orr r0, r5
	strh r0, [r2]
	ldrh r3, [r2, #2]
	mov r0, #0x1f
	bic r3, r1
	orr r0, r3
	orr r0, r5
	strh r0, [r2, #2]
	ldrb r3, [r4, #4]
	ldrb r1, [r4, #7]
	ldrb r0, [r4, #5]
	lsl r6, r3, #8
	mov r3, #0xff
	lsl r3, r3, #8
	and r6, r3
	ldrb r3, [r4, #6]
	orr r6, r3
	add r3, r2, #0
	sub r3, #8
	strh r6, [r3]
	lsl r3, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	and r0, r3
	orr r1, r0
	sub r0, r2, #4
	strh r1, [r0]
	lsl r2, r5, #0x15
	ldr r1, [r2]
	ldr r0, _0222F5CC ; =0xFFFF1FFF
	and r1, r0
	lsl r0, r5, #8
	orr r0, r1
	str r0, [r2]
	b _0222F5B0
_0222F5A6:
	lsl r2, r1, #0x17
	ldr r1, [r2]
	ldr r0, _0222F5CC ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
_0222F5B0:
	add r0, r7, #0
	bl DestroySysTask
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	pop {r3, r4, r5, r6, r7, pc}
_0222F5C2:
	sub r0, r0, #1
	strh r0, [r4, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F5C8: .word 0x04000048
_0222F5CC: .word 0xFFFF1FFF
	thumb_func_end ov80_0222F53C

	thumb_func_start ov80_0222F5D0
ov80_0222F5D0: ; 0x0222F5D0
	add r2, r0, #0
	add r2, #0x97
	ldrb r3, [r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #0x40
	lsl r1, r1, #0x1f
	bic r3, r2
	lsr r1, r1, #0x19
	orr r1, r3
	add r0, #0x97
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222F5D0

	thumb_func_start ov80_0222F5EC
ov80_0222F5EC: ; 0x0222F5EC
	add r2, r0, #0
	add r2, #0x97
	ldrb r3, [r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #0x80
	lsl r1, r1, #0x1f
	bic r3, r2
	lsr r1, r1, #0x18
	orr r1, r3
	add r0, #0x97
	strb r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222F5EC

	thumb_func_start ov80_0222F608
ov80_0222F608: ; 0x0222F608
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	lsl r2, r4, #0x18
	lsl r3, r6, #0x18
	ldr r0, [r0, #8]
	add r1, r7, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov80_0222FD08
	add r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096818
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222F608

	thumb_func_start ov80_0222F648
ov80_0222F648: ; 0x0222F648
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r4, #0
	bl ov80_0222FEEC
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222F648

	thumb_func_start ov80_0222F664
ov80_0222F664: ; 0x0222F664
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_02230424
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F664

	thumb_func_start ov80_0222F678
ov80_0222F678: ; 0x0222F678
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096808
	add r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096810
	add r5, r0, #0
	mov r0, #0xb
	mov r1, #0x24
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x24
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r7, #8]
	mov r3, #0
	str r0, [r4]
	ldrb r0, [r5, #4]
	add r2, r4, #0
	strb r0, [r4, #4]
	ldrb r0, [r5, #5]
	strb r0, [r4, #5]
	ldr r0, _0222F6D4 ; =0x000004D4
	strb r3, [r4, #6]
	ldr r1, [r5, r0]
	add r0, r0, #4
	str r1, [r4, #8]
	ldr r0, [r5, r0]
	ldr r1, _0222F6D8 ; =ov80_0223BDB4
	str r0, [r4, #0xc]
	ldr r0, _0222F6DC ; =ov80_0222F7CC
	str r5, [r4, #0x1c]
	str r0, [sp]
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096820
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F6D4: .word 0x000004D4
_0222F6D8: .word ov80_0223BDB4
_0222F6DC: .word ov80_0222F7CC
	thumb_func_end ov80_0222F678

	thumb_func_start ov80_0222F6E0
ov80_0222F6E0: ; 0x0222F6E0
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	ldr r0, _0222F704 ; =0x000004FC
	ldr r5, [r4, r0]
	ldr r0, [r5, #0x14]
	bl IsBattleResultWin
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl sub_02051BF8
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0222F704: .word 0x000004FC
	thumb_func_end ov80_0222F6E0

	thumb_func_start ov80_0222F708
ov80_0222F708: ; 0x0222F708
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
	bl ov80_02236F24
	add r2, r0, #0
	ldr r0, _0222F744 ; =0x000004FC
	mov r3, #0
	str r2, [r4, r0]
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _0222F748 ; =_020FA484
	ldr r0, [r0]
	bl sub_02096820
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0222F744: .word 0x000004FC
_0222F748: .word _020FA484
	thumb_func_end ov80_0222F708

	thumb_func_start ov80_0222F74C
ov80_0222F74C: ; 0x0222F74C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096808
	add r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096810
	add r5, r0, #0
	mov r2, #0
	ldr r0, _0222F7BC ; =0x000004DC
	add r3, r5, #0
	add r1, r2, #0
_0222F76C:
	add r2, r2, #1
	strh r1, [r3, r0]
	add r3, r3, #2
	cmp r2, #6
	blt _0222F76C
	mov r0, #0xb
	mov r1, #0x24
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x24
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r0, [r7, #8]
	add r2, r4, #0
	str r0, [r4]
	ldrb r0, [r5, #4]
	mov r3, #0
	strb r0, [r4, #4]
	ldrb r0, [r5, #5]
	strb r0, [r4, #5]
	mov r0, #1
	strb r0, [r4, #6]
	ldr r0, _0222F7C0 ; =0x000004D4
	ldr r1, [r5, r0]
	add r0, r0, #4
	str r1, [r4, #8]
	ldr r0, [r5, r0]
	ldr r1, _0222F7C4 ; =ov80_0223BDC4
	str r0, [r4, #0xc]
	ldr r0, _0222F7C8 ; =ov80_0222F7CC
	str r5, [r4, #0x1c]
	str r0, [sp]
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096820
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F7BC: .word 0x000004DC
_0222F7C0: .word 0x000004D4
_0222F7C4: .word ov80_0223BDC4
_0222F7C8: .word ov80_0222F7CC
	thumb_func_end ov80_0222F74C

	thumb_func_start ov80_0222F7CC
ov80_0222F7CC: ; 0x0222F7CC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	add r1, r4, #0
	bl ov80_02230460
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov80_0222F7CC

	thumb_func_start ov80_0222F7E0
ov80_0222F7E0: ; 0x0222F7E0
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_022307F0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F7E0

	thumb_func_start ov80_0222F7F4
ov80_0222F7F4: ; 0x0222F7F4
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_022308C4
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F7F4

	thumb_func_start ov80_0222F808
ov80_0222F808: ; 0x0222F808
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_022309F8
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F808

	thumb_func_start ov80_0222F81C
ov80_0222F81C: ; 0x0222F81C
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_02230A60
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222F81C

	thumb_func_start ov80_0222F830
ov80_0222F830: ; 0x0222F830
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	add r6, r0, #0
	ldr r2, [r6, #0x1c]
	add r1, r2, #1
	str r1, [r6, #0x1c]
	ldrb r7, [r2]
	add r2, r1, #1
	str r2, [r6, #0x1c]
	ldrb r5, [r1]
	add r1, r2, #1
	str r1, [r6, #0x1c]
	ldrb r1, [r2]
	str r1, [sp, #0x1c]
	bl ov80_0222BDF4
	str r0, [sp, #0x18]
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	ldr r0, [r6]
	bl ov80_0222AB34
	str r0, [sp, #0x20]
	cmp r7, #0x29
	bhi _0222F8F2
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222F874: ; jump table
	.short _0222F8C8 - _0222F874 - 2 ; case 0
	.short _0222F8CC - _0222F874 - 2 ; case 1
	.short _0222F8D0 - _0222F874 - 2 ; case 2
	.short _0222F8D4 - _0222F874 - 2 ; case 3
	.short _0222F8E2 - _0222F874 - 2 ; case 4
	.short _0222F8EA - _0222F874 - 2 ; case 5
	.short _0222FBE6 - _0222F874 - 2 ; case 6
	.short _0222F8FA - _0222F874 - 2 ; case 7
	.short _0222FBE6 - _0222F874 - 2 ; case 8
	.short _0222F902 - _0222F874 - 2 ; case 9
	.short _0222F910 - _0222F874 - 2 ; case 10
	.short _0222FBE6 - _0222F874 - 2 ; case 11
	.short _0222FBE6 - _0222F874 - 2 ; case 12
	.short _0222FBE6 - _0222F874 - 2 ; case 13
	.short _0222F91A - _0222F874 - 2 ; case 14
	.short _0222F926 - _0222F874 - 2 ; case 15
	.short _0222F93C - _0222F874 - 2 ; case 16
	.short _0222F954 - _0222F874 - 2 ; case 17
	.short _0222F98C - _0222F874 - 2 ; case 18
	.short _0222FA4C - _0222F874 - 2 ; case 19
	.short _0222FA58 - _0222F874 - 2 ; case 20
	.short _0222FA66 - _0222F874 - 2 ; case 21
	.short _0222FA6E - _0222F874 - 2 ; case 22
	.short _0222FA76 - _0222F874 - 2 ; case 23
	.short _0222FA82 - _0222F874 - 2 ; case 24
	.short _0222FBE6 - _0222F874 - 2 ; case 25
	.short _0222FA8C - _0222F874 - 2 ; case 26
	.short _0222FA96 - _0222F874 - 2 ; case 27
	.short _0222FA9E - _0222F874 - 2 ; case 28
	.short _0222FAAA - _0222F874 - 2 ; case 29
	.short _0222FAB2 - _0222F874 - 2 ; case 30
	.short _0222FAD6 - _0222F874 - 2 ; case 31
	.short _0222FAEE - _0222F874 - 2 ; case 32
	.short _0222FB06 - _0222F874 - 2 ; case 33
	.short _0222FB34 - _0222F874 - 2 ; case 34
	.short _0222FB64 - _0222F874 - 2 ; case 35
	.short _0222FB70 - _0222F874 - 2 ; case 36
	.short _0222FB78 - _0222F874 - 2 ; case 37
	.short _0222FBA0 - _0222F874 - 2 ; case 38
	.short _0222FBA8 - _0222F874 - 2 ; case 39
	.short _0222FBD4 - _0222F874 - 2 ; case 40
	.short _0222FBDC - _0222F874 - 2 ; case 41
_0222F8C8:
	strb r5, [r4, #7]
	b _0222FBE6
_0222F8CC:
	strb r5, [r4, #5]
	b _0222FBE6
_0222F8D0:
	strb r5, [r4, #4]
	b _0222FBE6
_0222F8D4:
	lsl r0, r5, #1
	add r1, r4, r0
	ldr r0, _0222FBEC ; =0x000004DC
	ldrh r1, [r1, r0]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222F8E2:
	ldrh r1, [r4, #0xc]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222F8EA:
	ldrh r1, [r4, #0xc]
	ldr r0, _0222FBF0 ; =0x0000270F
	cmp r1, r0
	blo _0222F8F4
_0222F8F2:
	b _0222FBE6
_0222F8F4:
	add r0, r1, #1
	strh r0, [r4, #0xc]
	b _0222FBE6
_0222F8FA:
	mov r0, #0
	bl OS_ResetSystem
	b _0222FBE6
_0222F902:
	ldr r0, _0222FBF4 ; =0x000004F4
	ldr r0, [r4, r0]
	bl sub_0203095C
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222F910:
	add r0, r4, #0
	mov r1, #2
	bl ov80_0223049C
	b _0222FBE6
_0222F91A:
	add r0, r4, #0
	bl ov80_02230784
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222F926:
	mov r0, #0x38
	mul r0, r5
	add r1, r4, r0
	mov r0, #0x3f
	lsl r0, r0, #4
	ldrh r0, [r1, r0]
	lsl r0, r0, #0x15
	lsr r1, r0, #0x15
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222F93C:
	mov r0, #0x38
	mul r0, r5
	add r1, r4, r0
	ldr r0, [sp, #0x1c]
	lsl r0, r0, #1
	add r1, r1, r0
	mov r0, #0xfd
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222F954:
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	add r0, r4, #0
	bl ov80_02237120
	add r2, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #4
	add r1, r4, r0
	mov r0, #0x38
	mul r0, r5
	add r0, r1, r0
	add r1, r6, #0
	bl ov80_0222A140
	add r0, r6, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	add r0, r6, #0
	bl FreeToHeap
	b _0222FBE6
_0222F98C:
	ldrb r0, [r4, #4]
	mov r1, #1
	bl ov80_02236DF8
	mov r1, #0
	str r0, [sp, #0x14]
	add r2, sp, #0x24
	add r0, r1, #0
_0222F99C:
	add r1, r1, #1
	stmia r2!, {r0}
	cmp r1, #0x12
	blt _0222F99C
	mov r0, #0xb
	bl AllocMonZeroed
	add r5, r0, #0
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	cmp r0, #0
	ble _0222FA12
	mov r0, #0x3f
	lsl r0, r0, #4
	add r6, r4, r0
_0222F9BC:
	add r0, r4, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl ov80_0222A140
	add r0, r5, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	cmp r7, r0
	bne _0222F9E8
	mov r0, #0xff
_0222F9E8:
	lsl r1, r7, #2
	add r2, sp, #0x24
	ldr r2, [r2, r1]
	add r3, r2, #1
	add r2, sp, #0x24
	str r3, [r2, r1]
	cmp r0, #0xff
	beq _0222FA04
	lsl r0, r0, #2
	add r1, r2, #0
	ldr r1, [r1, r0]
	add r2, r1, #1
	add r1, sp, #0x24
	str r2, [r1, r0]
_0222FA04:
	ldr r0, [sp, #0x10]
	add r6, #0x38
	add r1, r0, #1
	ldr r0, [sp, #0x14]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _0222F9BC
_0222FA12:
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #0
	add r4, sp, #0x24
	add r5, r0, #0
	add r3, r4, #0
_0222FA20:
	lsl r1, r0, #2
	ldr r2, [r3, r1]
	ldr r1, [r4]
	cmp r2, r1
	bge _0222FA2C
	add r0, r5, #0
_0222FA2C:
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #0x12
	blt _0222FA20
	lsl r2, r0, #2
	add r1, sp, #0x24
	ldr r1, [r1, r2]
	cmp r1, #1
	bgt _0222FA46
	ldr r0, [sp, #0x18]
	mov r1, #0xff
	strh r1, [r0]
	b _0222FBE6
_0222FA46:
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FA4C:
	add r0, r4, #0
	bl ov80_022372B4
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FA58:
	add r0, r4, #0
	add r1, r5, #0
	bl ov80_02230794
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FA66:
	add r0, r4, #0
	bl ov80_022307C8
	b _0222FBE6
_0222FA6E:
	add r0, r4, #0
	bl ov80_022307D4
	b _0222FBE6
_0222FA76:
	add r0, r4, #0
	bl ov80_02230790
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FA82:
	ldr r0, _0222FBF8 ; =0x0000057C
	ldrb r1, [r4, r0]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222FA8C:
	ldr r0, _0222FBFC ; =0x0000057D
	ldrb r1, [r4, r0]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222FA96:
	add r0, r4, #0
	bl sub_02096910
	b _0222FBE6
_0222FA9E:
	ldrb r0, [r4, #4]
	bl ov80_02237254
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FAAA:
	ldrb r1, [r4, #4]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	b _0222FBE6
_0222FAB2:
	mov r0, #0x1a
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r1, #3
	ldr r0, [sp, #0x20]
	str r5, [sp, #8]
	ldr r0, [r0]
	add r2, r1, #0
	mov r3, #0xa
	bl BgTilemapRectChangePalette
	ldr r0, [sp, #0x20]
	mov r1, #3
	ldr r0, [r0]
	bl ScheduleBgTilemapBufferTransfer
	b _0222FBE6
_0222FAD6:
	ldr r0, [r6]
	bl ov80_0222AB34
	add r1, r0, #0
	ldr r0, _0222FC00 ; =ov80_0222FC08
	mov r2, #5
	bl CreateSysTask
	mov r1, #5
	lsl r1, r1, #8
	str r0, [r4, r1]
	b _0222FBE6
_0222FAEE:
	mov r0, #5
	lsl r0, r0, #8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0222FBE6
	bl DestroySysTask
	mov r0, #5
	mov r1, #0
	lsl r0, r0, #8
	str r1, [r4, r0]
	b _0222FBE6
_0222FB06:
	ldrb r1, [r4, #6]
	add r0, r4, #0
	add r0, #0x34
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, #0x18]
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_0222A474
	ldrb r1, [r4, #6]
	mov r0, #0x51
	lsl r0, r0, #2
	add r1, r1, #7
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, #0x18]
	add r0, r4, r0
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_0222A474
	b _0222FBE6
_0222FB34:
	ldrb r0, [r4, #4]
	bl ov80_02236DD4
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _0222FBE6
_0222FB42:
	ldr r0, _0222FC04 ; =0x000004D4
	add r1, r5, #0
	ldr r0, [r4, r0]
	bl GetPartyMonByIndex
	bl Mon_GetBoxMon
	add r2, r0, #0
	ldr r0, [r6]
	add r1, r5, #0
	ldr r0, [r0, #0x44]
	bl BufferBoxMonSpeciesName
	add r5, r5, #1
	cmp r5, r7
	blt _0222FB42
	b _0222FBE6
_0222FB64:
	add r0, r4, #0
	bl ov80_02230B4C
	ldr r1, [sp, #0x18]
	strh r0, [r1]
	b _0222FBE6
_0222FB70:
	add r0, r4, #0
	bl ov80_02230AE4
	b _0222FBE6
_0222FB78:
	ldr r0, [sp, #0x18]
	mov r1, #0
	strh r1, [r0]
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _0222FBE6
	ldrh r0, [r4, #0xc]
	add r0, r0, #1
	cmp r0, #0x15
	bne _0222FB94
	ldr r0, [sp, #0x18]
	mov r1, #1
	strh r1, [r0]
	b _0222FBE6
_0222FB94:
	cmp r0, #0x31
	bne _0222FBE6
	ldr r0, [sp, #0x18]
	mov r1, #2
	strh r1, [r0]
	b _0222FBE6
_0222FBA0:
	add r0, r4, #0
	bl ov80_022371B0
	b _0222FBE6
_0222FBA8:
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	mov r3, #0x3f
	lsl r3, r3, #4
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp, #0xc]
	add r0, r4, r3
	sub r1, #0x1e
	sub r2, #0x16
	sub r3, #0x10
	add r1, r4, r1
	add r2, r4, r2
	add r3, r4, r3
	bl ov80_0222A52C
	b _0222FBE6
_0222FBD4:
	add r0, r4, #0
	bl ov80_02237130
	b _0222FBE6
_0222FBDC:
	ldrb r1, [r4, #0xb]
	ldr r0, [sp, #0x18]
	strh r1, [r0]
	mov r0, #1
	strb r0, [r4, #0xb]
_0222FBE6:
	mov r0, #0
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FBEC: .word 0x000004DC
_0222FBF0: .word 0x0000270F
_0222FBF4: .word 0x000004F4
_0222FBF8: .word 0x0000057C
_0222FBFC: .word 0x0000057D
_0222FC00: .word ov80_0222FC08
_0222FC04: .word 0x000004D4
	thumb_func_end ov80_0222F830

	thumb_func_start ov80_0222FC08
ov80_0222FC08: ; 0x0222FC08
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4]
	mov r1, #2
	bl Bg_GetYpos
	cmp r0, #0xff
	ldr r0, [r4]
	blt _0222FC26
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	pop {r4, pc}
_0222FC26:
	mov r1, #2
	mov r2, #4
	mov r3, #1
	bl ScheduleSetBgPosText
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222FC08

	thumb_func_start ov80_0222FC34
ov80_0222FC34: ; 0x0222FC34
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	ldr r0, [r0, #0x14]
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222FC34

	thumb_func_start ov80_0222FC50
ov80_0222FC50: ; 0x0222FC50
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
	bl ov80_02230AF8
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0222FC50

	thumb_func_start ov80_0222FC80
ov80_0222FC80: ; 0x0222FC80
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _0222FC9C ; =ov80_0222FCA0
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0222FC9C: .word ov80_0222FCA0
	thumb_func_end ov80_0222FC80

	thumb_func_start ov80_0222FCA0
ov80_0222FCA0: ; 0x0222FCA0
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE9C
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	ldr r1, _0222FCCC ; =0x00000702
	ldrb r2, [r0, r1]
	cmp r2, #2
	blo _0222FCC6
	mov r2, #0
	strb r2, [r0, r1]
	mov r0, #1
	pop {r4, pc}
_0222FCC6:
	mov r0, #0
	pop {r4, pc}
	nop
_0222FCCC: .word 0x00000702
	thumb_func_end ov80_0222FCA0

	thumb_func_start ov80_0222FCD0
ov80_0222FCD0: ; 0x0222FCD0
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
	bne _0222FCF4
	mov r0, #0
	pop {r3, r4, r5, pc}
_0222FCF4:
	lsl r1, r4, #4
	add r1, r4, r1
	add r2, #0x4c
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r2, r1
	bl ov80_0222F44C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0222FCD0

	thumb_func_start ov80_0222FD08
ov80_0222FD08: ; 0x0222FD08
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r4, r0, #0
	ldr r1, _0222FED4 ; =0x00000708
	mov r0, #0xb
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	ldr r1, _0222FED8 ; =_0223DD40
	ldr r2, _0222FED4 ; =0x00000708
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r5, [r0]
	add r0, r4, #0
	bl sub_0203094C
	ldr r1, _0222FEDC ; =0x000004F4
	str r0, [r5, r1]
	add r0, r1, #4
	str r4, [r5, r0]
	mov r0, #0xb
	ldr r1, _0222FED8 ; =_0223DD40
	str r0, [r5]
	ldr r5, [r1]
	bl SavArray_Party_alloc
	ldr r1, _0222FEE0 ; =0x000004D4
	str r0, [r5, r1]
	mov r0, #0xb
	bl SavArray_Party_alloc
	ldr r1, _0222FEE4 ; =0x000004D8
	str r0, [r5, r1]
	add r1, #0x1c
	add r0, r4, #0
	ldr r5, [r5, r1]
	bl sub_02030AE8
	add r4, r0, #0
	cmp r6, #0
	bne _0222FE1A
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r1, [r0]
	strb r7, [r1, #4]
	ldr r0, [sp]
	strb r0, [r1, #5]
	mov r0, #0
	strb r0, [r1, #6]
	add r0, r5, #0
	bl sub_02030940
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r2, [r0]
	ldrb r3, [r2, #4]
	cmp r3, #3
	bne _0222FD8E
	ldr r0, _0222FEE8 ; =0x000004F8
	ldr r0, [r2, r0]
	bl SavArray_Flags_get
	bl ScriptState_GetVar4052
	b _0222FDA2
_0222FD8E:
	ldrb r2, [r2, #5]
	add r0, r4, #0
	mov r1, #0xa
	lsl r2, r2, #2
	add r2, r3, r2
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030AD4
_0222FDA2:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _0222FE0A
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r5, [r0]
	ldr r0, _0222FEE8 ; =0x000004F8
	ldr r0, [r5, r0]
	bl sub_0203107C
	add r4, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205BFF0
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205BFF0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	strh r0, [r5, #0xc]
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r4, [r0]
	ldr r0, _0222FEE8 ; =0x000004F8
	ldr r0, [r4, r0]
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	bl sub_0205C048
	add r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C048
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl sub_020310BC
	b _0222FE12
_0222FE0A:
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r4, [r0]
	mov r0, #0
	strh r0, [r4, #0xc]
_0222FE12:
	strh r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0x10]
	b _0222FEA8
_0222FE1A:
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl sub_02030A24
	ldr r1, _0222FED8 ; =_0223DD40
	ldr r4, [r1]
	mov r1, #0
	strb r0, [r4, #4]
	add r0, r5, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02030A24
	mov r2, #0
	strb r0, [r4, #5]
	add r0, r5, #0
	mov r1, #2
	add r3, r2, #0
	bl sub_02030A24
	strb r0, [r4, #6]
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r5, [r0]
	ldr r0, _0222FEE8 ; =0x000004F8
	ldr r0, [r5, r0]
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205BFF0
	add r7, r0, #0
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	bl sub_0205BFF0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl sub_020310BC
	strh r0, [r5, #0xc]
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r4, [r0]
	ldr r0, _0222FEE8 ; =0x000004F8
	ldr r0, [r4, r0]
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	bl sub_0205C048
	add r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C048
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl sub_020310BC
	strh r0, [r4, #8]
_0222FEA8:
	ldr r0, _0222FED8 ; =_0223DD40
	mov r1, #7
	ldr r4, [r0]
	ldrh r0, [r4, #0xc]
	bl _s32_div_f
	strh r0, [r4, #0xe]
	ldrb r0, [r4, #4]
	bl ov80_02237254
	cmp r0, #1
	bne _0222FECC
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r1, [r0]
	ldr r0, _0222FEE8 ; =0x000004F8
	ldr r0, [r1, r0]
	bl ov80_0222A840
_0222FECC:
	ldr r0, _0222FED8 ; =_0223DD40
	ldr r0, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FED4: .word 0x00000708
_0222FED8: .word _0223DD40
_0222FEDC: .word 0x000004F4
_0222FEE0: .word 0x000004D4
_0222FEE4: .word 0x000004D8
_0222FEE8: .word 0x000004F8
	thumb_func_end ov80_0222FD08

	thumb_func_start ov80_0222FEEC
ov80_0222FEEC: ; 0x0222FEEC
	push {r3, lr}
	cmp r1, #0
	bne _0222FEF8
	bl ov80_0222FF00
	pop {r3, pc}
_0222FEF8:
	bl ov80_02230270
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0222FEEC

	thumb_func_start ov80_0222FF00
ov80_0222FF00: ; 0x0222FF00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1fc
	sub sp, #0xd8
	add r4, r0, #0
	bl ov80_022372B4
	add r1, r0, #0
	add r2, r4, #0
	ldrb r0, [r4, #4]
	add r2, #0x18
	mov r3, #0xe
	bl ov80_02236BE4
	add r0, r4, #0
	bl ov80_022372B4
	mov r3, #0x26
	lsl r3, r3, #4
	add r1, r4, r3
	str r1, [sp]
	add r1, r3, #0
	add r2, r3, #0
	add r1, #8
	add r1, r4, r1
	str r1, [sp, #4]
	ldrh r1, [r4, #8]
	sub r2, #0xc
	add r3, #0x20
	str r1, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	ldrb r1, [r4, #5]
	add r2, r4, r2
	add r3, r4, r3
	bl ov80_02236E24
	add r0, r4, #0
	mov r1, #4
	mov r2, #0
	bl ov80_022300D4
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl ov80_022300D4
	mov r0, #6
	str r0, [sp, #0x18]
	mov r0, #0
	mov ip, r0
	add r3, r4, #0
	add r5, sp, #0x34
_0222FF6A:
	mov r0, #0xa
	lsl r0, r0, #6
	add r2, r3, r0
	add r7, r5, #0
	mov r6, #7
_0222FF74:
	ldmia r2!, {r0, r1}
	stmia r7!, {r0, r1}
	sub r6, r6, #1
	bne _0222FF74
	mov r0, ip
	add r0, r0, #1
	add r3, #0x38
	add r5, #0x38
	mov ip, r0
	cmp r0, #6
	blt _0222FF6A
	ldrb r0, [r4, #4]
	bl ov80_02237254
	cmp r0, #1
	bne _02230038
	mov r0, #0xa
	lsl r0, r0, #6
	ldr r7, _022300C4 ; =0x00000282
	mov r5, #0
	add r0, r4, r0
	add r1, sp, #0x28
	add r2, r4, #0
	add r3, sp, #0x1c
_0222FFA4:
	ldrh r6, [r0]
	add r5, r5, #1
	add r0, #0x38
	lsl r6, r6, #0x15
	lsr r6, r6, #0x15
	strh r6, [r1]
	ldrh r6, [r2, r7]
	add r1, r1, #2
	add r2, #0x38
	strh r6, [r3]
	add r3, r3, #2
	cmp r5, #6
	blt _0222FFA4
	add r0, r4, #0
	bl ov80_022372B4
	mov r3, #0x59
	lsl r3, r3, #4
	add r1, r4, r3
	str r1, [sp]
	add r1, r3, #0
	add r1, #8
	add r1, r4, r1
	str r1, [sp, #4]
	add r1, r3, #0
	add r2, r3, #0
	sub r1, #0x10
	ldrh r1, [r4, r1]
	sub r2, #0xc
	add r3, #0x20
	str r1, [sp, #8]
	add r1, sp, #0x28
	str r1, [sp, #0xc]
	add r1, sp, #0x1c
	str r1, [sp, #0x10]
	ldrb r1, [r4, #5]
	add r2, r4, r2
	add r3, r4, r3
	bl ov80_02236E24
	add r0, r4, #0
	mov r1, #4
	mov r2, #1
	bl ov80_022300D4
	add r0, r4, #0
	mov r1, #5
	mov r2, #1
	bl ov80_022300D4
	mov r0, #0xc
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x14]
	add r5, r4, #0
	add r6, sp, #0x34
_02230014:
	mov r0, #0x5b
	lsl r0, r0, #4
	add r3, r5, r0
	mov r0, #0x15
	lsl r0, r0, #4
	add r2, r6, r0
	mov r7, #7
_02230022:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r7, r7, #1
	bne _02230022
	ldr r0, [sp, #0x14]
	add r5, #0x38
	add r0, r0, #1
	add r6, #0x38
	str r0, [sp, #0x14]
	cmp r0, #6
	blt _02230014
_02230038:
	ldrb r0, [r4, #4]
	mov r1, #1
	bl ov80_02236DF8
	ldr r2, _022300C8 ; =0x000003D2
	add r3, sp, #0x34
	add r1, r4, r2
	str r1, [sp]
	add r1, r2, #0
	add r1, #0x1e
	add r1, r4, r1
	str r1, [sp, #4]
	add r1, r2, #0
	add r1, #8
	add r1, r4, r1
	add r2, #0xe
	str r1, [sp, #8]
	add r1, r4, r2
	str r1, [sp, #0xc]
	ldr r1, [sp, #0x18]
	str r1, [sp, #0x10]
	ldrb r1, [r4, #6]
	ldrb r2, [r4, #5]
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, #0x18]
	bl ov80_02236E90
	mov r0, #0xa
	lsl r0, r0, #6
	mov r7, #0
	add r6, r4, r0
_02230078:
	mov r0, #0xb
	bl AllocMonZeroed
	add r5, r0, #0
	add r0, r4, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl ov80_0222A140
	ldr r0, _022300CC ; =0x000004F8
	ldr r1, _022300D0 ; =0x000004D4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r5, #0
	bl ov80_0222A3BC
	add r0, r5, #0
	bl FreeToHeap
	add r7, r7, #1
	add r6, #0x38
	cmp r7, #6
	blt _02230078
	ldr r6, _022300D0 ; =0x000004D4
	mov r5, #0
_022300B0:
	ldr r0, [r4, r6]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r5, r5, #1
	cmp r5, #6
	blt _022300B0
	add sp, #0x1fc
	add sp, #0xd8
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022300C4: .word 0x00000282
_022300C8: .word 0x000003D2
_022300CC: .word 0x000004F8
_022300D0: .word 0x000004D4
	thumb_func_end ov80_0222FF00

	thumb_func_start ov80_022300D4
ov80_022300D4: ; 0x022300D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xdc
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl LCRandom
	mov r1, #6
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r2, r0, #0x10
	cmp r6, #0
	bne _022301B0
	mov r0, #0x95
	lsl r0, r0, #2
	add r1, r4, r0
	lsl r3, r5, #1
	str r1, [sp, #0x5c]
	ldrh r1, [r1, r3]
	str r3, [sp, #0x20]
	add r6, sp, #0xa4
	str r1, [sp, #0x1c]
	add r1, r0, #0
	add r1, #0xc
	add r1, r4, r1
	str r1, [sp, #0x24]
	ldrb r1, [r1, r5]
	mov r7, #7
	str r1, [sp, #0x18]
	add r1, r0, #0
	add r1, #0x14
	add r1, r4, r1
	str r1, [sp, #0x28]
	lsl r1, r5, #2
	ldr r3, [sp, #0x28]
	str r1, [sp, #0x2c]
	ldr r1, [r3, r1]
	add r0, #0x2c
	str r1, [sp, #0x14]
	add r1, r4, r0
	mov r0, #0x38
	mul r0, r5
	add r0, r1, r0
	str r0, [sp, #0x10]
	str r0, [sp, #0x30]
_02230130:
	ldr r3, [sp, #0x30]
	sub r7, r7, #1
	ldmia r3!, {r0, r1}
	str r3, [sp, #0x30]
	stmia r6!, {r0, r1}
	bne _02230130
	mov r0, #0x95
	lsl r0, r0, #2
	add r1, r4, r0
	str r1, [sp, #0x34]
	ldr r3, [sp, #0x34]
	lsl r1, r2, #1
	ldrh r6, [r3, r1]
	str r1, [sp, #0x38]
	ldr r3, [sp, #0x20]
	ldr r1, [sp, #0x5c]
	strh r6, [r1, r3]
	add r1, r0, #0
	add r1, #0xc
	add r1, r4, r1
	ldrb r3, [r1, r2]
	str r1, [sp, #0x3c]
	ldr r1, [sp, #0x24]
	strb r3, [r1, r5]
	add r1, r0, #0
	add r1, #0x14
	add r7, r4, r1
	lsl r1, r2, #2
	str r1, [sp, #0x60]
	ldr r5, [r7, r1]
	ldr r3, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	add r0, #0x2c
	str r5, [r3, r1]
	add r1, r4, r0
	mov r0, #0x38
	mul r0, r2
	add r6, r1, r0
	add r5, r6, #0
	mov r4, #7
_02230180:
	ldr r3, [sp, #0x10]
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	str r3, [sp, #0x10]
	sub r4, r4, #1
	bne _02230180
	ldr r3, [sp, #0x1c]
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x38]
	strh r3, [r1, r0]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x3c]
	add r3, sp, #0xa4
	strb r1, [r0, r2]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x60]
	mov r2, #7
	str r1, [r7, r0]
_022301A4:
	ldmia r3!, {r0, r1}
	stmia r6!, {r0, r1}
	sub r2, r2, #1
	bne _022301A4
	add sp, #0xdc
	pop {r4, r5, r6, r7, pc}
_022301B0:
	ldr r0, _0223026C ; =0x00000584
	lsl r3, r5, #1
	add r1, r4, r0
	str r1, [sp, #0x64]
	ldrh r1, [r1, r3]
	str r3, [sp, #0x40]
	add r6, sp, #0x6c
	str r1, [sp, #8]
	add r1, r0, #0
	add r1, #0xc
	add r1, r4, r1
	str r1, [sp, #0x44]
	ldrb r1, [r1, r5]
	mov r7, #7
	str r1, [sp, #4]
	add r1, r0, #0
	add r1, #0x14
	add r1, r4, r1
	str r1, [sp, #0x48]
	lsl r1, r5, #2
	ldr r3, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, [r3, r1]
	add r0, #0x2c
	str r1, [sp]
	add r1, r4, r0
	mov r0, #0x38
	mul r0, r5
	add r0, r1, r0
	str r0, [sp, #0xc]
	str r0, [sp, #0x50]
_022301EE:
	ldr r3, [sp, #0x50]
	sub r7, r7, #1
	ldmia r3!, {r0, r1}
	str r3, [sp, #0x50]
	stmia r6!, {r0, r1}
	bne _022301EE
	ldr r3, _0223026C ; =0x00000584
	add r0, r4, r3
	str r0, [sp, #0x54]
	ldr r1, [sp, #0x54]
	lsl r0, r2, #1
	ldrh r6, [r1, r0]
	str r0, [sp, #0x58]
	ldr r1, [sp, #0x40]
	ldr r0, [sp, #0x64]
	strh r6, [r0, r1]
	add r0, r3, #0
	add r0, #0xc
	add r0, r4, r0
	ldrb r1, [r0, r2]
	mov ip, r0
	ldr r0, [sp, #0x44]
	strb r1, [r0, r5]
	add r0, r3, #0
	add r0, #0x14
	add r7, r4, r0
	lsl r0, r2, #2
	str r0, [sp, #0x68]
	ldr r5, [r7, r0]
	ldr r1, [sp, #0x48]
	ldr r0, [sp, #0x4c]
	add r3, #0x2c
	str r5, [r1, r0]
	mov r0, #0x38
	add r1, r4, r3
	mul r0, r2
	add r5, r1, r0
	add r6, r5, #0
	mov r4, #7
_0223023C:
	ldr r3, [sp, #0xc]
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	str r3, [sp, #0xc]
	sub r4, r4, #1
	bne _0223023C
	ldr r3, [sp, #8]
	ldr r1, [sp, #0x54]
	ldr r0, [sp, #0x58]
	strh r3, [r1, r0]
	ldr r1, [sp, #4]
	mov r0, ip
	strb r1, [r0, r2]
	ldr r1, [sp]
	ldr r0, [sp, #0x68]
	add r3, sp, #0x6c
	str r1, [r7, r0]
	mov r2, #7
_02230260:
	ldmia r3!, {r0, r1}
	stmia r5!, {r0, r1}
	sub r2, r2, #1
	bne _02230260
	add sp, #0xdc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223026C: .word 0x00000584
	thumb_func_end ov80_022300D4

	thumb_func_start ov80_02230270
ov80_02230270: ; 0x02230270
	push {r4, r5, r6, r7, lr}
	sub sp, #0x19c
	add r5, r0, #0
	ldrb r0, [r5, #4]
	bl ov80_02236DD4
	ldr r7, _0223040C ; =0x000004F4
	mov r4, #0
	add r6, r5, #0
_02230282:
	lsl r2, r4, #0x18
	ldr r0, [r5, r7]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	strh r0, [r6, #0x18]
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, #0xe
	blt _02230282
	add r0, sp, #0x28
	mov r4, #0
	add r6, sp, #0x40
	str r0, [sp, #0x14]
	add r7, sp, #0x20
	str r5, [sp, #0x10]
_022302A6:
	ldr r0, _0223040C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #4
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	strh r0, [r6]
	ldr r0, _0223040C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #6
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	ldr r1, [sp, #0x14]
	lsl r2, r4, #0x18
	str r0, [r1]
	ldr r0, _0223040C ; =0x000004F4
	mov r1, #5
	ldr r0, [r5, r0]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	strb r0, [r7]
	ldrh r2, [r6]
	ldr r1, [sp, #0x10]
	ldr r0, _02230410 ; =0x000004E8
	add r4, r4, #1
	strh r2, [r1, r0]
	ldr r0, [sp, #0x14]
	add r6, r6, #2
	add r0, r0, #4
	str r0, [sp, #0x14]
	add r0, r1, #0
	add r0, r0, #2
	add r7, r7, #1
	str r0, [sp, #0x10]
	cmp r4, #4
	blt _022302A6
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	add r0, sp, #0x4c
	add r1, sp, #0x40
	add r2, sp, #0x20
	add r3, sp, #0x28
	bl ov80_0222A52C
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	mov r7, #0
	add r4, sp, #0x4c
_02230324:
	add r0, r5, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r0, _02230414 ; =0x000004F8
	ldr r1, _02230418 ; =0x000004D4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov80_0222A3BC
	add r7, r7, #1
	add r4, #0x38
	cmp r7, #4
	blt _02230324
	add r0, r6, #0
	bl FreeToHeap
	add r0, sp, #0x28
	mov r4, #0
	add r6, sp, #0x40
	str r0, [sp, #0x1c]
	add r7, sp, #0x20
	str r5, [sp, #0x18]
_0223035C:
	ldr r0, _0223040C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #7
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	strh r0, [r6]
	ldr r0, _0223040C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #9
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	ldr r1, [sp, #0x1c]
	lsl r2, r4, #0x18
	str r0, [r1]
	ldr r0, _0223040C ; =0x000004F4
	mov r1, #8
	ldr r0, [r5, r0]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030A24
	strb r0, [r7]
	ldrh r2, [r6]
	ldr r1, [sp, #0x18]
	ldr r0, _0223041C ; =0x000003D2
	add r4, r4, #1
	strh r2, [r1, r0]
	ldr r0, [sp, #0x1c]
	add r6, r6, #2
	add r0, r0, #4
	str r0, [sp, #0x1c]
	add r0, r1, #0
	add r0, r0, #2
	add r7, r7, #1
	str r0, [sp, #0x18]
	cmp r4, #4
	blt _0223035C
	mov r0, #0
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	add r0, sp, #0x4c
	add r1, sp, #0x40
	add r2, sp, #0x20
	add r3, sp, #0x28
	bl ov80_0222A52C
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	mov r7, #0
	add r4, sp, #0x4c
_022303DA:
	add r0, r5, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r0, _02230414 ; =0x000004F8
	ldr r1, _02230420 ; =0x000004D8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov80_0222A3BC
	add r7, r7, #1
	add r4, #0x38
	cmp r7, #4
	blt _022303DA
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x19c
	pop {r4, r5, r6, r7, pc}
	nop
_0223040C: .word 0x000004F4
_02230410: .word 0x000004E8
_02230414: .word 0x000004F8
_02230418: .word 0x000004D4
_0223041C: .word 0x000003D2
_02230420: .word 0x000004D8
	thumb_func_end ov80_02230270

	thumb_func_start ov80_02230424
ov80_02230424: ; 0x02230424
	push {r4, lr}
	add r4, r0, #0
	beq _02230452
	ldr r0, _02230454 ; =0x000004D4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02230436
	bl FreeToHeap
_02230436:
	ldr r0, _02230458 ; =0x000004D8
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _02230442
	bl FreeToHeap
_02230442:
	ldr r2, _0223045C ; =0x00000708
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
_02230452:
	pop {r4, pc}
	.balign 4, 0
_02230454: .word 0x000004D4
_02230458: .word 0x000004D8
_0223045C: .word 0x00000708
	thumb_func_end ov80_02230424

	thumb_func_start ov80_02230460
ov80_02230460: ; 0x02230460
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02230480 ; =0x000004DC
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_0223046A:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl ov80_02230484
	strh r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #6
	blt _0223046A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02230480: .word 0x000004DC
	thumb_func_end ov80_02230460

	thumb_func_start ov80_02230484
ov80_02230484: ; 0x02230484
	push {r3, lr}
	cmp r1, #6
	blo _02230492
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_02230492:
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #0x10]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02230484

	thumb_func_start ov80_0223049C
ov80_0223049C: ; 0x0223049C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, _02230768 ; =0x000004F8
	add r6, r1, #0
	ldr r0, [r5, r0]
	bl sub_02030AE8
	str r0, [sp]
	ldr r0, _02230768 ; =0x000004F8
	ldr r0, [r5, r0]
	bl sub_0203107C
	add r4, r0, #0
	ldrb r0, [r5, #4]
	bl ov80_02236DD4
	ldrb r0, [r5, #4]
	mov r1, #1
	bl ov80_02236DF8
	ldrb r1, [r5, #5]
	add r0, sp, #4
	add r3, sp, #0xc
	strb r1, [r0, #8]
	ldr r0, _0223076C ; =0x000004F4
	mov r1, #0
	ldr r0, [r5, r0]
	add r2, r1, #0
	bl sub_02030978
	ldrb r1, [r5, #4]
	add r0, sp, #4
	mov r2, #0
	strb r1, [r0, #8]
	ldr r0, _0223076C ; =0x000004F4
	mov r1, #1
	ldr r0, [r5, r0]
	add r3, sp, #0xc
	bl sub_02030978
	ldr r0, _0223076C ; =0x000004F4
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02030964
	ldrb r1, [r5, #6]
	add r0, sp, #4
	mov r2, #0
	strb r1, [r0, #8]
	ldr r0, _0223076C ; =0x000004F4
	mov r1, #2
	ldr r0, [r5, r0]
	add r3, sp, #0xc
	bl sub_02030978
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C048
	add r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C048
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02031108
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205BFF0
	add r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205BFF0
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #0xc]
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02031108
	cmp r6, #2
	beq _02230648
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C01C
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C01C
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C01C
	add r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C01C
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #0xc]
	add r0, r4, #0
	add r1, r7, #0
	bl sub_0203126C
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C01C
	add r7, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C01C
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020310BC
	ldrh r1, [r5, #0xc]
	cmp r1, r6
	bne _022305E2
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C074
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C074
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0203126C
	b _02230608
_022305E2:
	cmp r6, r0
	bhs _02230608
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C074
	add r6, r0, #0
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	bl sub_0205C074
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02031108
_02230608:
	ldrb r1, [r5, #0xa]
	add r0, sp, #4
	strb r1, [r0, #8]
	ldrb r2, [r5, #5]
	ldrb r3, [r5, #4]
	ldr r0, [sp]
	lsl r2, r2, #2
	add r2, r3, r2
	lsl r2, r2, #0x18
	mov r1, #0xa
	lsr r2, r2, #0x18
	add r3, sp, #0xc
	bl sub_02030AA4
	ldrb r0, [r5, #4]
	cmp r0, #3
	bne _02230648
	ldrb r0, [r5, #5]
	cmp r0, #0
	bne _02230634
	mov r6, #0x66
	b _02230636
_02230634:
	mov r6, #0x68
_02230636:
	add r0, r6, #0
	bl sub_0205C268
	add r2, r0, #0
	ldrb r3, [r5, #0xa]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02031108
_02230648:
	ldr r7, _0223076C ; =0x000004F4
	mov r4, #0
	add r6, sp, #4
_0223064E:
	lsl r0, r4, #1
	add r0, r5, r0
	ldrh r0, [r0, #0x18]
	lsl r2, r4, #0x18
	mov r1, #3
	strh r0, [r6]
	ldr r0, [r5, r7]
	lsr r2, r2, #0x18
	add r3, sp, #4
	bl sub_02030978
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0xe
	blo _0223064E
	ldr r0, _02230770 ; =0x000004D4
	ldr r0, [r5, r0]
	bl GetPartyCount
	add r7, r0, #0
	ldr r4, _02230774 ; =0x00000000
	beq _022306E8
_0223067C:
	ldr r0, _02230770 ; =0x000004D4
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	lsl r0, r4, #1
	add r1, r5, r0
	ldr r0, _02230778 ; =0x000004E8
	lsl r2, r4, #0x18
	ldrh r1, [r1, r0]
	add r0, sp, #4
	lsr r2, r2, #0x18
	strh r1, [r0]
	ldr r0, _0223076C ; =0x000004F4
	mov r1, #4
	ldr r0, [r5, r0]
	add r3, sp, #4
	bl sub_02030978
	add r0, r6, #0
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	add r1, sp, #4
	strb r0, [r1, #8]
	ldr r0, _0223076C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #5
	lsr r2, r2, #0x18
	add r3, sp, #0xc
	bl sub_02030978
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [sp, #0x10]
	ldr r0, _0223076C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #6
	lsr r2, r2, #0x18
	add r3, sp, #0x10
	bl sub_02030978
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r7
	blo _0223067C
_022306E8:
	ldr r0, _0223077C ; =0x000004D8
	ldr r0, [r5, r0]
	bl GetPartyCount
	add r7, r0, #0
	ldr r4, _02230774 ; =0x00000000
	beq _02230762
_022306F6:
	ldr r0, _0223077C ; =0x000004D8
	add r1, r4, #0
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r6, r0, #0
	lsl r0, r4, #1
	add r1, r5, r0
	ldr r0, _02230780 ; =0x000003D2
	lsl r2, r4, #0x18
	ldrh r1, [r1, r0]
	add r0, sp, #4
	lsr r2, r2, #0x18
	strh r1, [r0]
	ldr r0, _0223076C ; =0x000004F4
	mov r1, #7
	ldr r0, [r5, r0]
	add r3, sp, #4
	bl sub_02030978
	add r0, r6, #0
	mov r1, #0x47
	mov r2, #0
	bl GetMonData
	add r1, sp, #4
	strb r0, [r1, #8]
	ldr r0, _0223076C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #8
	lsr r2, r2, #0x18
	add r3, sp, #0xc
	bl sub_02030978
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [sp, #0x10]
	ldr r0, _0223076C ; =0x000004F4
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #9
	lsr r2, r2, #0x18
	add r3, sp, #0x10
	bl sub_02030978
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r7
	blo _022306F6
_02230762:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230768: .word 0x000004F8
_0223076C: .word 0x000004F4
_02230770: .word 0x000004D4
_02230774: .word 0x00000000
_02230778: .word 0x000004E8
_0223077C: .word 0x000004D8
_02230780: .word 0x000003D2
	thumb_func_end ov80_0223049C

	thumb_func_start ov80_02230784
ov80_02230784: ; 0x02230784
	ldrb r1, [r0, #6]
	add r1, r1, #1
	strb r1, [r0, #6]
	ldrb r0, [r0, #6]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02230784

	thumb_func_start ov80_02230790
ov80_02230790: ; 0x02230790
	ldrb r0, [r0, #6]
	bx lr
	thumb_func_end ov80_02230790

	thumb_func_start ov80_02230794
ov80_02230794: ; 0x02230794
	push {r4, lr}
	sub sp, #0x30
	add r2, r0, #0
	ldrb r4, [r2, #6]
	mov r3, #7
	mul r3, r1
	add r1, r4, r3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x17
	add r1, r2, r1
	ldrh r1, [r1, #0x18]
	add r0, sp, #0
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	add r0, sp, #0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov80_0222A30C
	add sp, #0x30
	pop {r4, pc}
	thumb_func_end ov80_02230794

	thumb_func_start ov80_022307C8
ov80_022307C8: ; 0x022307C8
	ldr r3, _022307D0 ; =ov80_0223049C
	mov r1, #1
	bx r3
	nop
_022307D0: .word ov80_0223049C
	thumb_func_end ov80_022307C8

	thumb_func_start ov80_022307D4
ov80_022307D4: ; 0x022307D4
	mov r1, #1
	strb r1, [r0, #0xa]
	ldrh r1, [r0, #0xe]
	cmp r1, #8
	bhs _022307E2
	add r1, r1, #1
	strh r1, [r0, #0xe]
_022307E2:
	ldr r3, _022307EC ; =ov80_0223049C
	mov r1, #0
	strb r1, [r0, #6]
	bx r3
	nop
_022307EC: .word ov80_0223049C
	thumb_func_end ov80_022307D4

	thumb_func_start ov80_022307F0
ov80_022307F0: ; 0x022307F0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldrb r0, [r5, #4]
	bl ov80_02236DD4
	str r0, [sp, #4]
	ldrb r0, [r5, #4]
	mov r1, #1
	bl ov80_02236DF8
	str r0, [sp]
	ldr r0, _022308B0 ; =0x000004D4
	ldr r0, [r5, r0]
	bl SavArray_Party_init
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	ldr r0, [sp, #4]
	mov r7, #0
	cmp r0, #0
	ble _0223086E
	mov r0, #0xa
	lsl r0, r0, #6
	add r0, r5, r0
	add r4, r5, #0
	str r0, [sp, #8]
_0223082A:
	add r0, r5, #0
	bl ov80_02237120
	add r2, r0, #0
	ldr r0, _022308B4 ; =0x000004DC
	mov r1, #0x38
	ldrh r0, [r4, r0]
	mul r1, r0
	ldr r0, [sp, #8]
	add r0, r0, r1
	add r1, r6, #0
	bl ov80_0222A140
	ldr r0, _022308B8 ; =0x000004F8
	ldr r1, _022308B0 ; =0x000004D4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov80_0222A3BC
	ldr r0, _022308B4 ; =0x000004DC
	add r7, r7, #1
	ldrh r0, [r4, r0]
	lsl r0, r0, #1
	add r1, r5, r0
	mov r0, #0x95
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	ldr r0, _022308BC ; =0x000004E8
	strh r1, [r4, r0]
	ldr r0, [sp, #4]
	add r4, r4, #2
	cmp r7, r0
	blt _0223082A
_0223086E:
	ldr r0, [sp]
	mov r7, #0
	cmp r0, #0
	ble _022308A4
	mov r0, #0x3f
	lsl r0, r0, #4
	add r4, r5, r0
_0223087C:
	add r0, r5, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r0, _022308B8 ; =0x000004F8
	ldr r1, _022308C0 ; =0x000004D8
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov80_0222A3BC
	ldr r0, [sp]
	add r7, r7, #1
	add r4, #0x38
	cmp r7, r0
	blt _0223087C
_022308A4:
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022308B0: .word 0x000004D4
_022308B4: .word 0x000004DC
_022308B8: .word 0x000004F8
_022308BC: .word 0x000004E8
_022308C0: .word 0x000004D8
	thumb_func_end ov80_022307F0

	thumb_func_start ov80_022308C4
ov80_022308C4: ; 0x022308C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	mov r1, #0
	add r5, r0, #0
	add r2, sp, #0x3c
	add r3, sp, #0x2c
	add r0, r1, #0
_022308D2:
	add r1, r1, #1
	strh r0, [r2]
	strh r0, [r3]
	add r2, r2, #2
	add r3, r3, #2
	cmp r1, #8
	blt _022308D2
	ldrb r0, [r5, #4]
	mov r1, #1
	bl ov80_02236DF8
	str r0, [sp, #0x1c]
	ldr r0, _022309EC ; =0x000004D4
	ldr r0, [r5, r0]
	bl GetPartyCount
	mov r7, #0
	str r0, [sp, #0x20]
	cmp r0, #0
	ble _0223092C
	add r6, sp, #0x3c
	add r4, sp, #0x2c
_022308FE:
	ldr r0, _022309EC ; =0x000004D4
	add r1, r7, #0
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	str r0, [sp, #0x24]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r6]
	ldr r0, [sp, #0x24]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r4]
	ldr r0, [sp, #0x20]
	add r7, r7, #1
	add r6, r6, #2
	add r4, r4, #2
	cmp r7, r0
	blt _022308FE
_0223092C:
	ldr r0, _022309F0 ; =0x000004D8
	ldr r0, [r5, r0]
	bl GetPartyCount
	mov r7, #0
	str r0, [sp, #0x14]
	cmp r0, #0
	ble _0223098A
	ldr r0, [sp, #0x20]
	str r5, [sp, #0x18]
	lsl r1, r0, #1
	add r0, sp, #0x3c
	add r6, r0, r1
	add r0, sp, #0x2c
	add r4, r0, r1
_0223094A:
	ldr r0, _022309F0 ; =0x000004D8
	add r1, r7, #0
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	str r0, [sp, #0x28]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r6]
	ldr r0, [sp, #0x28]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r4]
	ldr r1, [sp, #0x18]
	ldr r0, _022309F4 ; =0x000003D2
	add r7, r7, #1
	ldrh r2, [r1, r0]
	mov r0, #0x95
	lsl r0, r0, #2
	strh r2, [r1, r0]
	add r0, r1, #0
	add r0, r0, #2
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x14]
	add r6, r6, #2
	add r4, r4, #2
	cmp r7, r0
	blt _0223094A
_0223098A:
	ldrb r0, [r5, #6]
	ldrb r1, [r5, #5]
	lsl r0, r0, #1
	add r0, r5, r0
	ldrh r0, [r0, #0x18]
	bl ov80_02236C2C
	ldr r1, _022309F4 ; =0x000003D2
	ldr r3, [sp, #0x20]
	add r2, r5, r1
	str r2, [sp]
	mov r2, #0xb
	str r2, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0
	ldr r2, [sp, #0x14]
	add r1, #8
	str r0, [sp, #0xc]
	add r0, r5, r1
	str r0, [sp, #0x10]
	add r2, r3, r2
	ldr r3, [sp, #0x1c]
	add r0, sp, #0x3c
	add r1, sp, #0x2c
	bl ov80_02236C9C
	mov r2, #0x3e
	lsl r2, r2, #4
	add r0, r5, r2
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	add r1, r2, #0
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	add r0, r2, #0
	add r0, #0x10
	sub r1, #0xe
	sub r2, r2, #6
	add r0, r5, r0
	add r1, r5, r1
	add r2, r5, r2
	mov r3, #0
	bl ov80_0222A52C
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022309EC: .word 0x000004D4
_022309F0: .word 0x000004D8
_022309F4: .word 0x000003D2
	thumb_func_end ov80_022308C4

	thumb_func_start ov80_022309F8
ov80_022309F8: ; 0x022309F8
	push {r4, lr}
	ldr r1, _02230A50 ; =0x000004DC
	add r4, r0, #0
	ldrh r0, [r4, r1]
	cmp r0, #0xff
	beq _02230A4C
	sub r0, r1, #4
	add r1, r1, #2
	ldrh r1, [r4, r1]
	ldr r0, [r4, r0]
	bl GetPartyMonByIndex
	ldr r1, _02230A54 ; =0x000004D4
	add r2, r0, #0
	ldr r0, [r4, r1]
	add r1, #8
	ldrh r1, [r4, r1]
	bl Party_SafeCopyMonToSlot_ResetUnkSub
	ldr r1, _02230A58 ; =0x000004DE
	ldrh r0, [r4, r1]
	lsl r0, r0, #1
	add r2, r4, r0
	mov r0, #0x95
	lsl r0, r0, #2
	ldrh r2, [r2, r0]
	sub r0, r1, #2
	ldrh r0, [r4, r0]
	add r1, #0xa
	lsl r0, r0, #1
	add r0, r4, r0
	strh r2, [r0, r1]
	add r0, r4, #0
	bl ov80_02230AE4
	ldr r0, _02230A5C ; =0x000004F8
	ldr r0, [r4, r0]
	bl Sav2_GameStats_get
	mov r1, #0x41
	bl GameStats_Inc
_02230A4C:
	pop {r4, pc}
	nop
_02230A50: .word 0x000004DC
_02230A54: .word 0x000004D4
_02230A58: .word 0x000004DE
_02230A5C: .word 0x000004F8
	thumb_func_end ov80_022309F8

	thumb_func_start ov80_02230A60
ov80_02230A60: ; 0x02230A60
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldrb r0, [r4, #4]
	bl ov80_02236DD4
	ldrb r0, [r4, #4]
	mov r1, #1
	bl ov80_02236DF8
	add r6, r0, #0
	ldr r0, _02230ADC ; =0x000004D8
	ldr r0, [r4, r0]
	bl SavArray_Party_init
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	mov r0, #0
	str r0, [sp]
	cmp r6, #0
	ble _02230ABC
	mov r0, #0x3f
	lsl r0, r0, #4
	add r5, r4, r0
_02230A92:
	add r0, r4, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl ov80_0222A140
	ldr r0, _02230AE0 ; =0x000004F8
	ldr r1, _02230ADC ; =0x000004D8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r2, r7, #0
	bl ov80_0222A3BC
	ldr r0, [sp]
	add r5, #0x38
	add r0, r0, #1
	str r0, [sp]
	cmp r0, r6
	blt _02230A92
_02230ABC:
	add r0, r7, #0
	bl FreeToHeap
	mov r5, #0
	cmp r6, #0
	ble _02230AD8
	ldr r7, _02230ADC ; =0x000004D8
_02230ACA:
	ldr r0, [r4, r7]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r5, r5, #1
	cmp r5, r6
	blt _02230ACA
_02230AD8:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230ADC: .word 0x000004D8
_02230AE0: .word 0x000004F8
	thumb_func_end ov80_02230A60

	thumb_func_start ov80_02230AE4
ov80_02230AE4: ; 0x02230AE4
	ldrh r2, [r0, #8]
	ldr r1, _02230AF4 ; =0x0000270F
	cmp r2, r1
	bhs _02230AF0
	add r1, r2, #1
	strh r1, [r0, #8]
_02230AF0:
	bx lr
	nop
_02230AF4: .word 0x0000270F
	thumb_func_end ov80_02230AE4

	thumb_func_start ov80_02230AF8
ov80_02230AF8: ; 0x02230AF8
	push {r3, lr}
	cmp r1, #6
	bhi _02230B48
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02230B0A: ; jump table
	.short _02230B18 - _02230B0A - 2 ; case 0
	.short _02230B1E - _02230B0A - 2 ; case 1
	.short _02230B24 - _02230B0A - 2 ; case 2
	.short _02230B2A - _02230B0A - 2 ; case 3
	.short _02230B30 - _02230B0A - 2 ; case 4
	.short _02230B3A - _02230B0A - 2 ; case 5
	.short _02230B44 - _02230B0A - 2 ; case 6
_02230B18:
	bl ov80_0222B108
	pop {r3, pc}
_02230B1E:
	bl ov80_0222B174
	pop {r3, pc}
_02230B24:
	bl ov80_0222B1DC
	pop {r3, pc}
_02230B2A:
	bl ov80_0222B2C4
	pop {r3, pc}
_02230B30:
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	bl ov80_0222B3B0
	pop {r3, pc}
_02230B3A:
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	bl ov80_0222B3FC
	pop {r3, pc}
_02230B44:
	bl ov80_0222B448
_02230B48:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02230AF8

	thumb_func_start ov80_02230B4C
ov80_02230B4C: ; 0x02230B4C
	ldrb r3, [r0, #4]
	ldrh r2, [r0, #0xe]
	cmp r3, #1
	bhi _02230B62
	cmp r2, #8
	blo _02230B5C
	mov r1, #9
	b _02230B6E
_02230B5C:
	ldr r1, _02230B84 ; =ov80_0223BDD4
	ldrb r1, [r1, r2]
	b _02230B6E
_02230B62:
	cmp r2, #8
	blo _02230B6A
	mov r1, #0x15
	b _02230B6E
_02230B6A:
	ldr r1, _02230B88 ; =ov80_0223BDE0
	ldrb r1, [r1, r2]
_02230B6E:
	cmp r3, #0
	bne _02230B7E
	ldrh r0, [r0, #0xc]
	cmp r0, #0x15
	beq _02230B7C
	cmp r0, #0x31
	bne _02230B7E
_02230B7C:
	mov r1, #0x14
_02230B7E:
	add r0, r1, #0
	bx lr
	nop
_02230B84: .word ov80_0223BDD4
_02230B88: .word ov80_0223BDE0
	thumb_func_end ov80_02230B4C

	thumb_func_start ov80_02230B8C
ov80_02230B8C: ; 0x02230B8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ov80_0222BE10
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov80_0222BE10
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	lsl r1, r7, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	lsl r2, r4, #0x18
	lsl r3, r6, #0x18
	ldr r0, [r0, #8]
	ldr r1, [sp, #4]
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl ov80_022310C4
	add r1, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096818
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02230B8C

	thumb_func_start ov80_02230BE0
ov80_02230BE0: ; 0x02230BE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r4, #0
	bl ov80_022313C0
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02230BE0

	thumb_func_start ov80_02230BFC
ov80_02230BFC: ; 0x02230BFC
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_022314A0
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02230BFC

	thumb_func_start ov80_02230C10
ov80_02230C10: ; 0x02230C10
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096808
	add r7, r0, #0
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0x20
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x20
	add r5, r0, #0
	bl MI_CpuFill8
	ldr r0, [r7, #8]
	ldr r1, _02230CD0 ; =0x00000704
	str r0, [r5]
	ldrb r0, [r4, #4]
	add r3, r4, r1
	sub r1, #0xf
	strb r0, [r5, #4]
	str r4, [r5, #0x10]
	ldrb r2, [r4, #4]
	lsl r0, r2, #3
	add r0, r2, r0
	add r0, r3, r0
	str r0, [r5, #8]
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	str r0, [r5, #0xc]
	ldrh r0, [r4, #8]
	strh r0, [r5, #0x18]
	ldrb r0, [r4, r1]
	strb r0, [r5, #5]
	ldr r0, _02230CD4 ; =0x00000D84
	add r0, r4, r0
	str r0, [r5, #0x14]
	ldr r0, [r5, #0xc]
	bl SavArray_Party_init
	ldr r0, [r7, #8]
	bl SavArray_PlayerParty_get
	mov r1, #0x26
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	add r7, r0, #0
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, [r5, #0xc]
	bl AddMonToParty
	ldrb r0, [r5, #4]
	cmp r0, #1
	bne _02230CA4
	ldr r1, _02230CD8 ; =0x00000261
	add r0, r7, #0
	ldrb r1, [r4, r1]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, [r5, #0xc]
	bl AddMonToParty
	b _02230CB8
_02230CA4:
	add r0, #0xfe
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02230CB8
	ldr r1, _02230CDC ; =0x00000D8C
	ldr r0, [r5, #0xc]
	ldr r1, [r4, r1]
	bl AddMonToParty
_02230CB8:
	ldr r0, _02230CE0 ; =ov80_02230D5C
	ldr r1, _02230CE4 ; =ov80_0223BDEC
	str r0, [sp]
	ldr r0, [r6]
	add r2, r5, #0
	ldr r0, [r0]
	mov r3, #0
	bl sub_02096820
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230CD0: .word 0x00000704
_02230CD4: .word 0x00000D84
_02230CD8: .word 0x00000261
_02230CDC: .word 0x00000D8C
_02230CE0: .word ov80_02230D5C
_02230CE4: .word ov80_0223BDEC
	thumb_func_end ov80_02230C10

	thumb_func_start ov80_02230CE8
ov80_02230CE8: ; 0x02230CE8
	push {r3, r4, r5, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	mov r0, #7
	lsl r0, r0, #8
	ldr r5, [r4, r0]
	ldr r0, [r5, #0x14]
	bl IsBattleResultWin
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl sub_02051BF8
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02230CE8

	thumb_func_start ov80_02230D0C
ov80_02230D0C: ; 0x02230D0C
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
	bl ov80_022375D0
	add r6, r0, #0
	mov r0, #7
	lsl r0, r0, #8
	str r6, [r4, r0]
	ldr r1, _02230D54 ; =0x0000045D
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _02230D58 ; =_020FA484
	ldr r0, [r0]
	add r2, r6, #0
	bl sub_02096820
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02230D54: .word 0x0000045D
_02230D58: .word _020FA484
	thumb_func_end ov80_02230D0C

	thumb_func_start ov80_02230D5C
ov80_02230D5C: ; 0x02230D5C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	add r1, r4, #0
	bl ov80_022314DC
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov80_02230D5C

	thumb_func_start ov80_02230D70
ov80_02230D70: ; 0x02230D70
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r1, [r4, #0x1c]
	add r2, r1, #1
	str r2, [r4, #0x1c]
	ldrb r7, [r1]
	add r1, r2, #1
	str r1, [r4, #0x1c]
	ldrb r6, [r2]
	add r1, r1, #1
	str r1, [r4, #0x1c]
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	cmp r7, #0x26
	bls _02230DA8
	b _02230FB6
_02230DA8:
	add r1, r7, r7
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02230DB4: ; jump table
	.short _02230FB6 - _02230DB4 - 2 ; case 0
	.short _02230FB6 - _02230DB4 - 2 ; case 1
	.short _02230E02 - _02230DB4 - 2 ; case 2
	.short _02230E06 - _02230DB4 - 2 ; case 3
	.short _02230E0E - _02230DB4 - 2 ; case 4
	.short _02230E14 - _02230DB4 - 2 ; case 5
	.short _02230FB6 - _02230DB4 - 2 ; case 6
	.short _02230E22 - _02230DB4 - 2 ; case 7
	.short _02230FB6 - _02230DB4 - 2 ; case 8
	.short _02230E2A - _02230DB4 - 2 ; case 9
	.short _02230E36 - _02230DB4 - 2 ; case 10
	.short _02230FB6 - _02230DB4 - 2 ; case 11
	.short _02230FB6 - _02230DB4 - 2 ; case 12
	.short _02230FB6 - _02230DB4 - 2 ; case 13
	.short _02230E3E - _02230DB4 - 2 ; case 14
	.short _02230F6C - _02230DB4 - 2 ; case 15
	.short _02230FB6 - _02230DB4 - 2 ; case 16
	.short _02230F00 - _02230DB4 - 2 ; case 17
	.short _02230FB6 - _02230DB4 - 2 ; case 18
	.short _02230E46 - _02230DB4 - 2 ; case 19
	.short _02230E58 - _02230DB4 - 2 ; case 20
	.short _02230E62 - _02230DB4 - 2 ; case 21
	.short _02230E68 - _02230DB4 - 2 ; case 22
	.short _02230E6E - _02230DB4 - 2 ; case 23
	.short _02230E76 - _02230DB4 - 2 ; case 24
	.short _02230FB6 - _02230DB4 - 2 ; case 25
	.short _02230FB6 - _02230DB4 - 2 ; case 26
	.short _02230E7E - _02230DB4 - 2 ; case 27
	.short _02230EBA - _02230DB4 - 2 ; case 28
	.short _02230EF0 - _02230DB4 - 2 ; case 29
	.short _02230EF6 - _02230DB4 - 2 ; case 30
	.short _02230F06 - _02230DB4 - 2 ; case 31
	.short _02230F1E - _02230DB4 - 2 ; case 32
	.short _02230F4C - _02230DB4 - 2 ; case 33
	.short _02230F64 - _02230DB4 - 2 ; case 34
	.short _02230F8A - _02230DB4 - 2 ; case 35
	.short _02230F90 - _02230DB4 - 2 ; case 36
	.short _02230F96 - _02230DB4 - 2 ; case 37
	.short _02230FB6 - _02230DB4 - 2 ; case 38
_02230E02:
	strb r6, [r4, #4]
	b _02230FB6
_02230E06:
	ldr r0, _02230FBC ; =0x000006F2
	ldrh r0, [r4, r0]
	strh r0, [r5]
	b _02230FB6
_02230E0E:
	ldrh r0, [r4, #8]
	strh r0, [r5]
	b _02230FB6
_02230E14:
	ldrh r1, [r4, #8]
	ldr r0, _02230FC0 ; =0x0000270F
	cmp r1, r0
	bhs _02230EB8
	add r0, r1, #1
	strh r0, [r4, #8]
	b _02230FB6
_02230E22:
	mov r0, #0
	bl OS_ResetSystem
	b _02230FB6
_02230E2A:
	ldr r0, _02230FC4 ; =0x000006F8
	ldr r0, [r4, r0]
	bl sub_02030B14
	strh r0, [r5]
	b _02230FB6
_02230E36:
	mov r1, #2
	bl ov80_0223157C
	b _02230FB6
_02230E3E:
	bl ov80_022317C0
	strh r0, [r5]
	b _02230FB6
_02230E46:
	ldrb r0, [r4, #4]
	cmp r0, #2
	bne _02230E52
	mov r0, #0xa
	strh r0, [r5]
	b _02230FB6
_02230E52:
	ldrh r0, [r4, #0xa]
	strh r0, [r5]
	b _02230FB6
_02230E58:
	add r1, r6, #0
	bl ov80_022317D0
	strh r0, [r5]
	b _02230FB6
_02230E62:
	bl ov80_02231804
	b _02230FB6
_02230E68:
	bl ov80_02231828
	b _02230FB6
_02230E6E:
	bl ov80_022317CC
	strh r0, [r5]
	b _02230FB6
_02230E76:
	ldr r0, _02230FC8 ; =0x00000D88
	ldrb r0, [r4, r0]
	strh r0, [r5]
	b _02230FB6
_02230E7E:
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl SavArray_PlayerParty_get
	str r0, [sp]
	ldrb r0, [r4, #4]
	bl ov80_0223787C
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _02230EB8
	ldr r0, _02230FCC ; =0x00000728
	add r6, r4, r0
_02230E9A:
	mov r1, #0x26
	add r2, r4, r5
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	ldr r0, [sp]
	bl GetPartyMonByIndex
	mov r1, #6
	add r2, r6, #0
	bl SetMonData
	add r5, r5, #1
	add r6, r6, #2
	cmp r5, r7
	blt _02230E9A
_02230EB8:
	b _02230FB6
_02230EBA:
	ldr r1, _02230FD0 ; =0x000006F5
	ldrb r2, [r4, #4]
	ldrb r0, [r4, r1]
	add r1, #0xf
	add r3, r4, r1
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r3, r1
	bl sub_02030BD0
	add r2, r0, #0
	cmp r2, #0xa
	bhs _02230FB6
	ldr r1, _02230FD0 ; =0x000006F5
	ldrb r3, [r4, #4]
	ldrb r0, [r4, r1]
	add r1, #0xf
	add r5, r4, r1
	lsl r1, r3, #3
	add r2, r2, #1
	add r1, r3, r1
	lsl r2, r2, #0x18
	add r1, r5, r1
	lsr r2, r2, #0x18
	bl sub_02030BF4
	b _02230FB6
_02230EF0:
	bl sub_02096910
	b _02230FB6
_02230EF6:
	ldrb r0, [r4, #4]
	bl ov80_0223792C
	strh r0, [r5]
	b _02230FB6
_02230F00:
	ldrb r0, [r4, #4]
	strh r0, [r5]
	b _02230FB6
_02230F06:
	cmp r6, #0
	bne _02230F14
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	b _02230FB6
_02230F14:
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	b _02230FB6
_02230F1E:
	ldrb r1, [r4, #5]
	add r0, #0x40
	mov r2, #0xb
	lsl r1, r1, #2
	add r1, r4, r1
	ldrh r1, [r1, #0x18]
	mov r3, #0xcc
	bl ov80_0222A474
	ldrb r1, [r4, #5]
	mov r0, #0x15
	lsl r0, r0, #4
	lsl r1, r1, #1
	add r1, r1, #1
	lsl r1, r1, #1
	add r1, r4, r1
	ldrh r1, [r1, #0x18]
	add r0, r4, r0
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_0222A474
	b _02230FB6
_02230F4C:
	ldr r1, _02230FD0 ; =0x000006F5
	ldrb r2, [r4, #4]
	ldrb r0, [r4, r1]
	add r1, #0xf
	add r3, r4, r1
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r3, r1
	bl sub_02030BD0
	strh r0, [r5]
	b _02230FB6
_02230F64:
	bl ov80_02231888
	strh r0, [r5]
	b _02230FB6
_02230F6C:
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	bl SavArray_PlayerParty_get
	mov r1, #0x26
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r5]
	b _02230FB6
_02230F8A:
	bl ov80_022319B0
	b _02230FB6
_02230F90:
	bl ov80_02231A04
	b _02230FB6
_02230F96:
	mov r0, #0
	strh r0, [r5]
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _02230FB6
	ldrh r0, [r4, #8]
	add r0, r0, #1
	cmp r0, #0x32
	bne _02230FAE
	mov r0, #1
	strh r0, [r5]
	b _02230FB6
_02230FAE:
	cmp r0, #0xaa
	bne _02230FB6
	mov r0, #2
	strh r0, [r5]
_02230FB6:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02230FBC: .word 0x000006F2
_02230FC0: .word 0x0000270F
_02230FC4: .word 0x000006F8
_02230FC8: .word 0x00000D88
_02230FCC: .word 0x00000728
_02230FD0: .word 0x000006F5
	thumb_func_end ov80_02230D70

	thumb_func_start ov80_02230FD4
ov80_02230FD4: ; 0x02230FD4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	ldr r0, [r0, #0x14]
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02230FD4

	thumb_func_start ov80_02230FF0
ov80_02230FF0: ; 0x02230FF0
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
	bl ov80_02231844
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02230FF0

	thumb_func_start ov80_02231020
ov80_02231020: ; 0x02231020
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _0223103C ; =ov80_02231040
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0223103C: .word ov80_02231040
	thumb_func_end ov80_02231020

	thumb_func_start ov80_02231040
ov80_02231040: ; 0x02231040
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x78
	ldrh r1, [r1]
	bl ov80_0222BE9C
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	mov r1, #0xd9
	lsl r1, r1, #4
	ldrb r2, [r0, r1]
	cmp r2, #2
	blo _02231068
	mov r2, #0
	strb r2, [r0, r1]
	mov r0, #1
	pop {r4, pc}
_02231068:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_02231040

	thumb_func_start ov80_0223106C
ov80_0223106C: ; 0x0223106C
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
	bne _02231090
	mov r0, #0
	pop {r3, r4, r5, pc}
_02231090:
	lsl r1, r4, #4
	add r1, r4, r1
	add r2, #0x58
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r2, r1
	bl ov80_0222F44C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223106C

	thumb_func_start ov80_022310A4
ov80_022310A4: ; 0x022310A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r4, #0
	bl ov80_0223151C
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_022310A4

	thumb_func_start ov80_022310C0
ov80_022310C0: ; 0x022310C0
	mov r0, #0
	bx lr
	thumb_func_end ov80_022310C0

	thumb_func_start ov80_022310C4
ov80_022310C4: ; 0x022310C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	str r0, [sp, #4]
	ldr r1, _022313A0 ; =0x00000D98
	mov r0, #0xb
	add r6, r2, #0
	str r3, [sp, #8]
	bl AllocFromHeap
	ldr r1, _022313A4 ; =ov80_0223DD44
	ldr r2, _022313A0 ; =0x00000D98
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r4, [r0]
	ldr r0, [sp, #4]
	bl sub_02030B04
	ldr r1, _022313A8 ; =0x000006F8
	str r0, [r4, r1]
	ldr r0, [sp, #4]
	add r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0xb
	ldr r1, _022313A4 ; =ov80_0223DD44
	str r0, [r4]
	ldr r4, [r1]
	bl SavArray_Party_alloc
	mov r1, #0x99
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xb
	bl AllocMonZeroed
	ldr r1, _022313AC ; =0x00000D8C
	str r0, [r4, r1]
	ldr r0, _022313A8 ; =0x000006F8
	ldr r4, [r4, r0]
	ldr r0, [sp, #4]
	bl sub_02030C5C
	str r0, [sp, #0xc]
	cmp r5, #0
	bne _022311E0
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r0, [r0]
	strb r6, [r0, #4]
	ldrb r0, [r0, #4]
	bl ov80_0223787C
	add r6, r0, #0
	ldr r0, _022313A4 ; =ov80_0223DD44
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #5]
	add r0, r4, #0
	bl sub_02030AF8
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r1, [r0]
	ldrb r2, [r1, #4]
	cmp r2, #3
	bne _02231158
	ldr r0, _022313B0 ; =0x000006FC
	ldr r0, [r1, r0]
	bl SavArray_Flags_get
	bl ScriptState_GetVar4052
	b _02231164
_02231158:
	ldr r0, [sp, #0xc]
	mov r3, #0
	mov r1, #5
	str r3, [sp]
	bl sub_02030CA0
_02231164:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _022311A6
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r1, [r0]
	ldr r0, _022313B0 ; =0x000006FC
	ldr r0, [r1, r0]
	bl sub_0203107C
	add r4, r0, #0
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_0205C0CC
	add r5, r0, #0
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_0205C0CC
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020310BC
	ldr r1, _022313A4 ; =ov80_0223DD44
	ldr r1, [r1]
	strh r0, [r1, #8]
	b _022311CA
_022311A6:
	ldr r5, _022313A4 ; =ov80_0223DD44
	mov r4, #0
	ldr r0, [r5]
	ldr r7, _022313B0 ; =0x000006FC
	strh r4, [r0, #8]
_022311B0:
	ldr r1, [r5]
	lsl r2, r4, #0x18
	ldr r0, [r1, r7]
	ldrb r1, [r1, #4]
	lsr r2, r2, #0x18
	mov r3, #0
	bl ov80_02231930
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x12
	blo _022311B0
_022311CA:
	ldr r0, _022313A4 ; =ov80_0223DD44
	mov r1, #0x26
	ldr r3, [r0]
	ldr r0, [sp, #8]
	lsl r1, r1, #4
	strb r0, [r3, r1]
	add r0, sp, #0x20
	ldrb r2, [r0, #0x10]
	add r0, r1, #1
	strb r2, [r3, r0]
	b _022312CA
_022311E0:
	ldr r0, _022313A4 ; =ov80_0223DD44
	mov r1, #0
	ldr r5, [r0]
	str r1, [sp]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02030B88
	strb r0, [r5, #4]
	ldrb r0, [r5, #4]
	bl ov80_0223787C
	mov r2, #0
	add r6, r0, #0
	ldr r0, _022313A4 ; =ov80_0223DD44
	str r2, [sp]
	ldr r5, [r0]
	add r0, r4, #0
	mov r1, #1
	add r3, r2, #0
	bl sub_02030B88
	strb r0, [r5, #5]
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r1, [r0]
	ldr r0, _022313B0 ; =0x000006FC
	ldr r0, [r1, r0]
	bl sub_0203107C
	add r7, r0, #0
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_0205C0CC
	str r0, [sp, #0x10]
	ldrb r0, [r5, #4]
	bl sub_0205C0CC
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	bl sub_020310BC
	ldr r1, _022313A4 ; =ov80_0223DD44
	mov r5, #0
	ldr r1, [r1]
	cmp r6, #0
	strh r0, [r1, #8]
	ble _02231272
	add r7, r5, #0
_0223124C:
	lsl r2, r5, #0x18
	add r0, r4, #0
	mov r1, #3
	lsr r2, r2, #0x18
	add r3, r7, #0
	str r7, [sp]
	bl sub_02030B88
	ldr r1, _022313A4 ; =ov80_0223DD44
	ldr r1, [r1]
	add r2, r1, r5
	mov r1, #0x26
	lsl r1, r1, #4
	strb r0, [r2, r1]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, r6
	blt _0223124C
_02231272:
	mov r5, #0
	add r7, r5, #0
_02231276:
	lsl r2, r5, #0x18
	add r0, r4, #0
	mov r1, #2
	lsr r2, r2, #0x18
	add r3, r7, #0
	str r7, [sp]
	bl sub_02030B88
	ldr r1, _022313A4 ; =ov80_0223DD44
	ldr r2, [r1]
	lsl r1, r5, #1
	add r1, r2, r1
	strh r0, [r1, #0x18]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x14
	blo _02231276
	mov r5, #0
_0223129C:
	ldr r0, _022313A4 ; =ov80_0223DD44
	lsl r2, r5, #0x18
	ldr r7, [r0]
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #4
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030B88
	lsl r1, r5, #1
	lsl r0, r0, #0x18
	add r2, r7, r1
	mov r1, #0x9a
	lsr r0, r0, #0x18
	lsl r1, r1, #2
	strh r0, [r2, r1]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x14
	blo _0223129C
_022312CA:
	mov r5, #0
	cmp r6, #0
	ble _02231304
	ldr r7, _022313A4 ; =ov80_0223DD44
_022312D2:
	ldr r4, [r7]
	ldr r0, _022313B0 ; =0x000006FC
	ldr r0, [r4, r0]
	bl SavArray_PlayerParty_get
	mov r1, #0x26
	add r2, r4, r5
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	bl GetPartyMonByIndex
	ldr r4, [r7]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r1, r5, #1
	add r2, r4, r1
	ldr r1, _022313B4 ; =0x00000728
	strh r0, [r2, r1]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, r6
	blt _022312D2
_02231304:
	ldr r0, _022313A4 ; =ov80_0223DD44
	mov r1, #0xa
	ldr r4, [r0]
	mov r0, #0
	str r0, [r4, #0x10]
	ldrh r0, [r4, #8]
	bl _s32_div_f
	strh r0, [r4, #0xa]
	ldrb r0, [r4, #4]
	cmp r0, #2
	bne _0223133E
	ldr r4, _022313A4 ; =ov80_0223DD44
	ldr r6, _022313B8 ; =0x00000716
	mov r5, #0
	mov r7, #9
_02231324:
	ldr r1, [r4]
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	add r1, r1, r6
	add r2, r7, #0
	bl sub_02030BF4
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x12
	blo _02231324
	b _0223137E
_0223133E:
	ldr r5, _022313A4 ; =ov80_0223DD44
	mov r4, #0
	add r7, sp, #0x14
_02231344:
	ldr r1, [r5]
	str r7, [sp]
	ldrb r1, [r1, #4]
	lsl r2, r4, #0x18
	add r3, sp, #0x14
	ldr r0, [sp, #4]
	lsr r2, r2, #0x18
	add r3, #2
	bl ov80_022318D0
	add r2, r0, #0
	lsl r0, r4, #0x18
	lsl r2, r2, #0x18
	ldr r1, [r5]
	ldr r3, _022313BC ; =0x00000704
	lsr r0, r0, #0x18
	add r6, r1, r3
	ldrb r3, [r1, #4]
	lsr r2, r2, #0x18
	lsl r1, r3, #3
	add r1, r3, r1
	add r1, r6, r1
	bl sub_02030BF4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x12
	blo _02231344
_0223137E:
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl ov80_0223792C
	cmp r0, #1
	bne _02231398
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r1, [r0]
	ldr r0, _022313B0 ; =0x000006FC
	ldr r0, [r1, r0]
	bl ov80_0222A840
_02231398:
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r0, [r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022313A0: .word 0x00000D98
_022313A4: .word ov80_0223DD44
_022313A8: .word 0x000006F8
_022313AC: .word 0x00000D8C
_022313B0: .word 0x000006FC
_022313B4: .word 0x00000728
_022313B8: .word 0x00000716
_022313BC: .word 0x00000704
	thumb_func_end ov80_022310C4

	thumb_func_start ov80_022313C0
ov80_022313C0: ; 0x022313C0
	ldr r3, _022313C4 ; =ov80_022313C8
	bx r3
	.balign 4, 0
_022313C4: .word ov80_022313C8
	thumb_func_end ov80_022313C0

	thumb_func_start ov80_022313C8
ov80_022313C8: ; 0x022313C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrb r2, [r5, #4]
	mov r4, #0
	mov r6, #1
	cmp r2, #0
	beq _022313DA
	mov r6, #2
_022313DA:
	ldr r1, _02231490 ; =0x000006F5
	lsl r3, r2, #3
	ldrb r0, [r5, r1]
	add r1, #0xf
	add r1, r5, r1
	add r2, r2, r3
	add r1, r1, r2
	bl sub_02030BD0
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_02231A14
	strb r0, [r5, #7]
	add r0, r5, #0
	add r0, #0x18
	str r0, [sp]
	ldr r0, _02231490 ; =0x000006F5
	ldrb r3, [r5, #5]
	ldrb r0, [r5, r0]
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_022372D8
	ldrb r0, [r5, #5]
	add r1, r6, #0
	add r3, r7, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x18
	str r0, [sp, #4]
	ldrb r0, [r5, #4]
	ldrh r2, [r5, #0xa]
	bl ov80_02237334
	ldrb r0, [r5, #5]
	add r6, r5, #0
	add r6, #0x18
	lsl r0, r0, #0x19
	lsr r0, r0, #0x17
	ldrh r1, [r6, r0]
	str r0, [sp, #0xc]
	ldr r0, _02231494 ; =0x0000FECD
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _02231444
	add r0, r5, #0
	bl ov80_0223793C
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_02231444:
	ldr r0, [sp, #0xc]
	ldrh r1, [r6, r0]
	ldr r0, _02231498 ; =0x00000133
	cmp r1, r0
	bne _02231450
	mov r4, #1
_02231450:
	mov r0, #0x4d
	lsl r0, r0, #2
	cmp r1, r0
	bne _0223145A
	mov r4, #2
_0223145A:
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0x9a
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r1, _0223149C ; =0x000006F4
	ldrb r3, [r5, #5]
	ldrb r1, [r5, r1]
	mov r0, #1
	add r2, r7, #0
	bl ov80_02237448
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02231490: .word 0x000006F5
_02231494: .word 0x0000FECD
_02231498: .word 0x00000133
_0223149C: .word 0x000006F4
	thumb_func_end ov80_022313C8

	thumb_func_start ov80_022314A0
ov80_022314A0: ; 0x022314A0
	push {r4, lr}
	add r4, r0, #0
	beq _022314D0
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022314B4
	bl FreeToHeap
_022314B4:
	ldr r0, _022314D4 ; =0x00000D8C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022314C0
	bl FreeToHeap
_022314C0:
	ldr r2, _022314D8 ; =0x00000D98
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
_022314D0:
	pop {r4, pc}
	nop
_022314D4: .word 0x00000D8C
_022314D8: .word 0x00000D98
	thumb_func_end ov80_022314A0

	thumb_func_start ov80_022314DC
ov80_022314DC: ; 0x022314DC
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #0
	bl ov80_02231518
	ldr r1, _02231510 ; =0x000006F2
	strh r0, [r4, r1]
	ldrh r2, [r4, r1]
	add r0, r1, #3
	strb r2, [r4, r0]
	ldrh r0, [r4, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov80_02237920
	ldr r1, _02231514 ; =0x000006F4
	strb r0, [r4, r1]
	add r0, r1, #1
	ldrb r0, [r4, r0]
	cmp r0, #0x11
	blo _0223150E
	mov r2, #0x11
	add r0, r1, #1
	strb r2, [r4, r0]
_0223150E:
	pop {r4, pc}
	.balign 4, 0
_02231510: .word 0x000006F2
_02231514: .word 0x000006F4
	thumb_func_end ov80_022314DC

	thumb_func_start ov80_02231518
ov80_02231518: ; 0x02231518
	ldrh r0, [r0, #6]
	bx lr
	thumb_func_end ov80_02231518

	thumb_func_start ov80_0223151C
ov80_0223151C: ; 0x0223151C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldrb r6, [r5, #4]
	add r4, r1, #0
	cmp r6, #3
	beq _0223156E
	add r0, r6, #0
	bl sub_0205C0F4
	add r7, r0, #0
	ldrb r0, [r5, #4]
	bl sub_0205C11C
	str r0, [sp, #0x10]
	ldrb r0, [r5, #4]
	bl sub_0205C0F4
	bl sub_0205C268
	str r0, [sp, #0x14]
	add r0, r6, #0
	bl sub_0205C144
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	add r0, sp, #0x1c
	str r0, [sp, #8]
	add r0, sp, #0x18
	str r0, [sp, #0xc]
	ldr r0, _02231578 ; =0x000006FC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x14]
	add r1, r7, #0
	bl sub_020313C4
	add sp, #0x20
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0223156E:
	mov r0, #0
	strh r0, [r4]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02231578: .word 0x000006FC
	thumb_func_end ov80_0223151C

	thumb_func_start ov80_0223157C
ov80_0223157C: ; 0x0223157C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, _022317B4 ; =0x000006FC
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_02030C5C
	str r0, [sp, #4]
	ldr r0, _022317B4 ; =0x000006FC
	ldr r0, [r5, r0]
	bl sub_0203107C
	str r0, [sp, #0xc]
	ldrb r1, [r5, #4]
	add r0, sp, #0x14
	strb r1, [r0, #8]
	mov r1, #0
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r0, _022317B8 ; =0x000006F8
	add r2, r1, #0
	ldr r0, [r5, r0]
	add r3, r1, #0
	bl sub_02030B30
	ldr r0, _022317B8 ; =0x000006F8
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02030B1C
	ldr r0, _022317B4 ; =0x000006FC
	ldr r0, [r5, r0]
	bl SavArray_PlayerParty_get
	mov r1, #0x26
	lsl r1, r1, #4
	ldrb r1, [r5, r1]
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	str r0, [sp, #8]
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldrb r0, [r5, #4]
	bl sub_0205C11C
	add r7, r0, #0
	ldrb r0, [r5, #4]
	bl sub_0205C11C
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	bl sub_020310BC
	add r7, r0, #0
	mov r2, #0
	ldrb r1, [r5, #5]
	add r0, sp, #0x14
	add r3, r2, #0
	strb r1, [r0, #8]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r0, _022317B8 ; =0x000006F8
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02030B30
	ldrb r0, [r5, #4]
	bl sub_0205C0CC
	str r0, [sp, #0x10]
	ldrb r0, [r5, #4]
	bl sub_0205C0CC
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl sub_02031108
	cmp r4, #2
	beq _022316C8
	ldrb r4, [r5, #4]
	cmp r4, #3
	beq _02231658
	add r0, r4, #0
	bl sub_0205C0F4
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C0F4
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	bl sub_02031108
	b _0223169A
_02231658:
	cmp r7, r6
	beq _0223167C
	add r0, r4, #0
	bl sub_0205C0F4
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C0F4
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	bl sub_02031108
	b _0223169A
_0223167C:
	add r0, r4, #0
	bl sub_0205C0F4
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C0F4
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	bl sub_0203126C
_0223169A:
	ldrb r1, [r5, #6]
	add r0, sp, #0x14
	mov r3, #0
	strb r1, [r0, #8]
	add r0, sp, #0x1c
	str r0, [sp]
	ldrb r2, [r5, #4]
	ldr r0, [sp, #4]
	mov r1, #5
	bl sub_02030C6C
	ldrb r0, [r5, #4]
	cmp r0, #3
	bne _022316C8
	mov r0, #0x6a
	bl sub_0205C268
	add r2, r0, #0
	ldrb r3, [r5, #6]
	ldr r0, [sp, #0xc]
	mov r1, #0x6a
	bl sub_02031108
_022316C8:
	mov r4, #0
	add r6, sp, #0x14
	add r7, sp, #0x14
_022316CE:
	lsl r0, r4, #1
	add r0, r5, r0
	ldrh r0, [r0, #0x18]
	lsl r2, r4, #0x18
	mov r1, #2
	strh r0, [r7]
	ldr r0, _022317B8 ; =0x000006F8
	str r6, [sp]
	ldr r0, [r5, r0]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030B30
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x14
	blo _022316CE
	mov r4, #0
	add r6, sp, #0x1c
	add r7, sp, #0x14
_022316F8:
	mov r0, #0x26
	add r1, r5, r4
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	lsl r2, r4, #0x18
	mov r1, #3
	strb r0, [r7, #8]
	ldr r0, _022317B8 ; =0x000006F8
	str r6, [sp]
	ldr r0, [r5, r0]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030B30
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #2
	blo _022316F8
	ldr r0, _022317BC ; =0x00000704
	mov r4, #0
	add r6, r5, r0
	add r7, sp, #0x14
_02231726:
	ldrb r2, [r5, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r6, r1
	bl sub_02030BD0
	strb r0, [r7, #8]
	ldr r0, _022317B4 ; =0x000006FC
	lsl r2, r4, #0x18
	ldrb r1, [r5, #4]
	ldrb r3, [r7, #8]
	ldr r0, [r5, r0]
	lsr r2, r2, #0x18
	bl ov80_02231930
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x12
	blo _02231726
	mov r4, #0
	add r6, sp, #0x14
	add r7, sp, #0x14
_02231758:
	lsl r0, r4, #1
	add r1, r5, r0
	mov r0, #0x9a
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	lsl r2, r4, #0x18
	mov r1, #4
	strh r0, [r7]
	ldr r0, _022317B8 ; =0x000006F8
	str r6, [sp]
	ldr r0, [r5, r0]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030B30
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x14
	blo _02231758
	ldrb r0, [r5, #4]
	bl sub_0205C11C
	add r4, r0, #0
	ldrb r0, [r5, #4]
	bl sub_0205C11C
	bl sub_0205C268
	add r5, r0, #0
	ldr r0, [sp, #8]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r3, r0, #0
	lsl r3, r3, #0x10
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	add r2, r5, #0
	lsr r3, r3, #0x10
	bl sub_02031108
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022317B4: .word 0x000006FC
_022317B8: .word 0x000006F8
_022317BC: .word 0x00000704
	thumb_func_end ov80_0223157C

	thumb_func_start ov80_022317C0
ov80_022317C0: ; 0x022317C0
	ldrb r1, [r0, #5]
	add r1, r1, #1
	strb r1, [r0, #5]
	ldrb r0, [r0, #5]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_022317C0

	thumb_func_start ov80_022317CC
ov80_022317CC: ; 0x022317CC
	ldrb r0, [r0, #5]
	bx lr
	thumb_func_end ov80_022317CC

	thumb_func_start ov80_022317D0
ov80_022317D0: ; 0x022317D0
	push {r3, lr}
	sub sp, #0x30
	add r2, r0, #0
	ldrb r3, [r2, #5]
	add r0, sp, #0
	lsl r3, r3, #1
	add r1, r1, r3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x17
	add r1, r2, r1
	ldrh r1, [r1, #0x18]
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	add r0, sp, #0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov80_0222A30C
	add sp, #0x30
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_022317D0

	thumb_func_start ov80_02231804
ov80_02231804: ; 0x02231804
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #4]
	ldr r0, _02231824 ; =0x00000704
	add r2, r4, r0
	lsl r0, r1, #3
	add r0, r1, r0
	add r0, r2, r0
	bl sub_02030C34
	add r0, r4, #0
	mov r1, #1
	bl ov80_0223157C
	pop {r4, pc}
	nop
_02231824: .word 0x00000704
	thumb_func_end ov80_02231804

	thumb_func_start ov80_02231828
ov80_02231828: ; 0x02231828
	mov r1, #1
	strb r1, [r0, #6]
	ldrh r1, [r0, #0xa]
	cmp r1, #0x12
	bhs _02231836
	add r1, r1, #1
	strh r1, [r0, #0xa]
_02231836:
	ldr r3, _02231840 ; =ov80_0223157C
	mov r1, #0
	strb r1, [r0, #5]
	bx r3
	nop
_02231840: .word ov80_0223157C
	thumb_func_end ov80_02231828

	thumb_func_start ov80_02231844
ov80_02231844: ; 0x02231844
	push {r3, lr}
	cmp r1, #7
	bhi _02231886
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02231856: ; jump table
	.short _02231866 - _02231856 - 2 ; case 0
	.short _0223186C - _02231856 - 2 ; case 1
	.short _02231872 - _02231856 - 2 ; case 2
	.short _02231878 - _02231856 - 2 ; case 3
	.short _02231886 - _02231856 - 2 ; case 4
	.short _02231886 - _02231856 - 2 ; case 5
	.short _02231886 - _02231856 - 2 ; case 6
	.short _02231882 - _02231856 - 2 ; case 7
_02231866:
	bl ov80_0222AF10
	pop {r3, pc}
_0223186C:
	bl ov80_0222AF54
	pop {r3, pc}
_02231872:
	bl ov80_0222AFB8
	pop {r3, pc}
_02231878:
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	bl ov80_0222B024
	pop {r3, pc}
_02231882:
	bl ov80_0222B070
_02231886:
	pop {r3, pc}
	thumb_func_end ov80_02231844

	thumb_func_start ov80_02231888
ov80_02231888: ; 0x02231888
	ldrb r3, [r0, #4]
	ldrh r2, [r0, #0xa]
	cmp r3, #1
	bhi _0223189E
	cmp r2, #0x12
	blo _02231898
	mov r1, #0xc
	b _022318AA
_02231898:
	ldr r1, _022318C8 ; =ov80_0223BDFC
	ldrb r1, [r1, r2]
	b _022318AA
_0223189E:
	cmp r2, #0x12
	blo _022318A6
	mov r1, #0x17
	b _022318AA
_022318A6:
	ldr r1, _022318CC ; =ov80_0223BE10
	ldrb r1, [r1, r2]
_022318AA:
	cmp r3, #0
	bne _022318BC
	ldrh r0, [r0, #8]
	cmp r0, #0x32
	beq _022318B8
	cmp r0, #0xaa
	bne _022318C2
_022318B8:
	mov r1, #0x14
	b _022318C2
_022318BC:
	cmp r3, #2
	bne _022318C2
	mov r1, #0xc
_022318C2:
	add r0, r1, #0
	bx lr
	nop
_022318C8: .word ov80_0223BDFC
_022318CC: .word ov80_0223BE10
	thumb_func_end ov80_02231888

	thumb_func_start ov80_022318D0
ov80_022318D0: ; 0x022318D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r5, r2, #0
	add r6, r3, #0
	ldr r4, [sp, #0x20]
	bl sub_0203107C
	str r0, [sp]
	add r0, r7, #0
	add r1, r5, #0
	bl sub_0205C0A0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	bl sub_0205C0A0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_020310BC
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0xf
	and r0, r1
	strh r0, [r6]
	asr r0, r1, #4
	strh r0, [r4]
	lsr r2, r5, #0x1f
	lsl r1, r5, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	bne _02231928
	add sp, #8
	ldrh r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02231928:
	ldrh r0, [r4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_022318D0

	thumb_func_start ov80_02231930
ov80_02231930: ; 0x02231930
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r3, #0
	add r3, sp, #0xc
	str r3, [sp]
	add r3, sp, #0xc
	add r3, #2
	str r0, [sp, #4]
	add r6, r1, #0
	add r5, r2, #0
	bl ov80_022318D0
	add r0, sp, #0xc
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	lsr r3, r5, #0x1f
	lsl r1, r1, #4
	orr r0, r1
	lsl r2, r5, #0x1f
	lsl r0, r0, #0x18
	sub r2, r2, r3
	mov r1, #0x1f
	ror r2, r1
	add r1, r3, r2
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bne _0223196C
	mov r2, #0xf0
	b _0223196E
_0223196C:
	mov r2, #0xf
_0223196E:
	and r0, r2
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	lsl r0, r1, #2
	add r1, r7, #0
	lsl r1, r0
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	orr r4, r0
	ldr r0, [sp, #4]
	bl sub_0203107C
	add r7, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0205C0A0
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0205C0A0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #8]
	add r0, r7, #0
	add r3, r4, #0
	bl sub_02031108
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02231930

	thumb_func_start ov80_022319B0
ov80_022319B0: ; 0x022319B0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #4]
	cmp r0, #2
	beq _022319FE
	ldr r0, _02231A00 ; =0x00000704
	mov r4, #0
	add r6, r5, r0
_022319C0:
	ldrb r2, [r5, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r6, r1
	bl sub_02030BD0
	cmp r0, #0xa
	blo _022319DA
	add r4, r4, #1
	cmp r4, #0x11
	blt _022319C0
_022319DA:
	cmp r4, #0x11
	bne _022319FE
	ldr r0, _02231A00 ; =0x00000704
	mov r4, #0
	add r6, r5, r0
	mov r7, #9
_022319E6:
	ldrb r2, [r5, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r6, r1
	add r2, r7, #0
	bl sub_02030BF4
	add r4, r4, #1
	cmp r4, #0x11
	blt _022319E6
_022319FE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02231A00: .word 0x00000704
	thumb_func_end ov80_022319B0

	thumb_func_start ov80_02231A04
ov80_02231A04: ; 0x02231A04
	push {r4, lr}
	add r4, r0, #0
	bl ov80_022379C8
	bl ov80_02237A40
	str r0, [r4, #0xc]
	pop {r4, pc}
	thumb_func_end ov80_02231A04

	thumb_func_start ov80_02231A14
ov80_02231A14: ; 0x02231A14
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r1, _02231BE0 ; =0x000006F5
	ldrb r2, [r6, #4]
	ldrb r0, [r6, r1]
	add r1, #0xf
	add r3, r6, r1
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r3, r1
	bl sub_02030BD0
	add r4, r0, #0
	add r0, r6, #0
	bl ov80_022379C8
	str r0, [sp, #4]
	ldrb r0, [r6, #4]
	cmp r0, #2
	bne _02231A48
	ldr r0, [sp, #4]
	add sp, #0xc
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, r7, pc}
_02231A48:
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _02231A60
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02231A6E
_02231A60:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02231A6E:
	ldr r5, [r6, #0xc]
	bl _ffix
	lsl r1, r5, #1
	add r1, r5, r1
	sub r0, r0, r1
	str r0, [sp, #8]
	add r0, r5, #0
	bl _fflt
	ldr r1, _02231BE4 ; =0x45800000
	bl _fdiv
	bl _f2d
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _02231BE8 ; =0x40140000
	mov r0, #0
	bl _dmul
	bl _d2f
	add r5, r0, #0
	ldr r0, [sp, #4]
	bl _fflt
	add r1, r5, #0
	bl _fdiv
	bl _f2d
	ldr r3, _02231BEC ; =0x3FF00000
	mov r2, #0
	bl _dls
	bhs _02231AC2
	add r0, r4, #0
	bl _fflt
	str r0, [sp]
	b _02231B00
_02231AC2:
	ldr r0, [sp, #4]
	mul r0, r4
	cmp r0, #0
	ble _02231ADC
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02231AEA
_02231ADC:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02231AEA:
	bl _ffix
	bl _fflt
	ldr r1, _02231BE4 ; =0x45800000
	bl _fdiv
	add r1, r5, #0
	bl _fdiv
	str r0, [sp]
_02231B00:
	ldr r0, _02231BF0 ; =0x00000704
	mov r5, #0
	add r4, r5, #0
	add r7, r6, r0
_02231B08:
	ldr r0, _02231BE0 ; =0x000006F5
	ldrb r0, [r6, r0]
	cmp r4, r0
	bne _02231B26
	add r0, r5, #0
	bl _f2d
	ldr r3, _02231BEC ; =0x3FF00000
	mov r2, #0
	bl _dadd
	bl _d2f
	add r5, r0, #0
	b _02231B4E
_02231B26:
	ldrb r2, [r6, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r7, r1
	bl sub_02030BD0
	cmp r0, #0
	beq _02231B4E
	add r0, r5, #0
	bl _f2d
	ldr r3, _02231BEC ; =0x3FF00000
	mov r2, #0
	bl _dadd
	bl _d2f
	add r5, r0, #0
_02231B4E:
	add r4, r4, #1
	cmp r4, #0x12
	blt _02231B08
	add r0, r5, #0
	bl _f2d
	add r2, r0, #0
	mov r0, #0
	add r3, r1, #0
	add r1, r0, #0
	bl _dneq
	beq _02231B7C
	add r0, r5, #0
	bl _f2d
	ldr r3, _02231BEC ; =0x3FF00000
	mov r2, #0
	bl _dsub
	bl _d2f
	add r5, r0, #0
_02231B7C:
	add r0, r5, #0
	bl _f2d
	ldr r3, _02231BF4 ; =0x3FE00000
	mov r2, #0
	bl _dmul
	bl _d2f
	add r4, r0, #0
	ldr r0, [sp, #8]
	bl _fflt
	ldr r1, _02231BE4 ; =0x45800000
	bl _fdiv
	ldr r1, [sp]
	bl _fadd
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	add r5, r0, #0
	bl _ffix
	add r4, r0, #0
	add r0, r5, #0
	bl _ffix
	bl _fflt
	add r1, r0, #0
	add r0, r5, #0
	bl _fneq
	beq _02231BC8
	add r4, r4, #1
_02231BC8:
	ldr r0, [sp, #4]
	cmp r4, r0
	ble _02231BD0
	add r4, r0, #0
_02231BD0:
	cmp r4, #0x64
	ble _02231BD6
	mov r4, #0x64
_02231BD6:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02231BE0: .word 0x000006F5
_02231BE4: .word 0x45800000
_02231BE8: .word 0x40140000
_02231BEC: .word 0x3FF00000
_02231BF0: .word 0x00000704
_02231BF4: .word 0x3FE00000
	thumb_func_end ov80_02231A14

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
	bl GetPartyMonByIndex
	add r2, r0, #0
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl Party_SafeCopyMonToSlot_ResetUnkSub
	ldr r0, [r5, #4]
	mov r1, #1
	bl GetPartyMonByIndex
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
	bl GetPartyMonByIndex
	add r2, r0, #0
	ldr r0, [r4, #0x28]
	mov r1, #2
	bl Party_SafeCopyMonToSlot_ResetUnkSub
	b _02231DA8
_02231D84:
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl GetPartyMonByIndex
	add r2, r0, #0
	ldr r0, [r4, #0x28]
	mov r1, #2
	bl Party_SafeCopyMonToSlot_ResetUnkSub
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl GetPartyMonByIndex
	add r2, r0, #0
	ldr r0, [r4, #0x28]
	mov r1, #3
	bl Party_SafeCopyMonToSlot_ResetUnkSub
_02231DA8:
	ldr r0, [r5, #0x14]
	bl IsBattleResultWin
	str r0, [r4, #0x1c]
	add r0, r5, #0
	bl sub_02051BF8
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
	bl SavArray_PlayerParty_get
	add r7, r0, #0
	ldr r0, _02232298 ; =0x0000036A
	mov r5, #0
	add r6, r4, r0
_02232002:
	add r1, r4, r5
	add r1, #0x24
	ldrb r1, [r1]
	add r0, r7, #0
	bl GetPartyMonByIndex
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

	thumb_func_start ov80_022324C4
ov80_022324C4: ; 0x022324C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r1, #0
	add r5, r0, #0
	ldr r1, _02232818 ; =0x00000A28
	mov r0, #0xb
	add r6, r2, #0
	str r3, [sp, #4]
	bl AllocFromHeap
	ldr r1, _0223281C ; =ov80_0223DD48
	ldr r2, _02232818 ; =0x00000A28
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r4, [r0]
	add r0, r5, #0
	bl sub_02030CC8
	str r0, [r4, #8]
	ldr r1, _0223281C ; =ov80_0223DD48
	str r5, [r4, #4]
	mov r0, #0xb
	str r0, [r4]
	ldr r4, [r1]
	bl SavArray_Party_alloc
	str r0, [r4, #0x28]
	mov r0, #0xb
	bl SavArray_Party_alloc
	str r0, [r4, #0x2c]
	mov r0, #0xa2
	ldr r1, [sp, #0x38]
	lsl r0, r0, #4
	str r1, [r4, r0]
	add r0, r5, #0
	ldr r4, [r4, #8]
	bl sub_02030E08
	add r5, r0, #0
	cmp r7, #0
	beq _02232520
	b _022326BA
_02232520:
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r1, [r0]
	mov r0, #0
	strb r6, [r1, #0x10]
	strb r0, [r1, #0x11]
	add r0, r4, #0
	bl sub_02030CBC
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r2, [r0, #0x10]
	cmp r2, #3
	bne _02232546
	ldr r0, [r0, #4]
	bl SavArray_Flags_get
	bl ScriptState_GetVar4052
	b _02232552
_02232546:
	mov r3, #0
	add r0, r5, #0
	mov r1, #9
	str r3, [sp]
	bl sub_02030E58
_02232552:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _02232592
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0203107C
	add r5, r0, #0
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C1A0
	add r4, r0, #0
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C1A0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020310BC
	ldr r1, _0223281C ; =ov80_0223DD48
	ldr r1, [r1]
	strh r0, [r1, #0x14]
	b _02232630
_02232592:
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r4, [r0]
	mov r0, #0
	strh r0, [r4, #0x14]
	ldr r0, [r4, #4]
	bl sub_0203107C
	add r5, r0, #0
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C1F0
	add r7, r0, #0
	ldrb r0, [r4, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	mov r3, #0
	bl sub_02031108
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0203107C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205C218
	add r5, r0, #0
	add r0, r6, #0
	bl sub_0205C218
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	mov r3, #0
	bl sub_02031108
	ldr r4, _0223281C ; =ov80_0223DD48
	mov r5, #0
_022325F2:
	ldr r0, [r4]
	ldr r0, [r0, #4]
	bl sub_0203107C
	add r6, r0, #0
	ldr r0, [r4]
	lsl r1, r5, #0x18
	ldrb r0, [r0, #0x10]
	lsr r1, r1, #0x18
	bl sub_0205C174
	add r7, r0, #0
	ldr r0, [r4]
	lsl r1, r5, #0x18
	ldrb r0, [r0, #0x10]
	lsr r1, r1, #0x18
	bl sub_0205C174
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	mov r3, #1
	bl sub_02031108
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _022325F2
_02232630:
	ldr r0, _0223281C ; =ov80_0223DD48
	mov r1, #7
	ldr r5, [r0]
	ldrh r0, [r5, #0x14]
	bl _s32_div_f
	strh r0, [r5, #0x16]
	mov r0, #0
	str r0, [r5, #0x18]
	add r1, r5, #0
	ldr r0, [sp, #4]
	add r1, #0x24
	strb r0, [r1]
	add r1, sp, #0x20
	add r0, r5, #0
	ldrh r2, [r1, #0x10]
	add r0, #0x25
	strb r2, [r0]
	add r0, r5, #0
	ldrh r1, [r1, #0x14]
	add r0, #0x26
	strb r1, [r0]
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0203107C
	add r4, r0, #0
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C1F0
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	strh r0, [r5, #0x20]
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl sub_0203107C
	add r4, r0, #0
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C1F0
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0xa
	bl sub_02031228
	b _0223273E
_022326BA:
	ldr r0, _0223281C ; =ov80_0223DD48
	mov r1, #0
	ldr r5, [r0]
	str r1, [sp]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02030D84
	strb r0, [r5, #0x10]
	mov r2, #0
	str r2, [sp]
	add r0, r4, #0
	mov r1, #1
	add r3, r2, #0
	bl sub_02030D84
	strb r0, [r5, #0x11]
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r6, [r0]
	ldr r0, [r6, #4]
	bl sub_0203107C
	add r7, r0, #0
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C1A0
	str r0, [sp, #0xc]
	ldrb r0, [r5, #0x10]
	bl sub_0205C1A0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #0xc]
	add r0, r7, #0
	bl sub_020310BC
	strh r0, [r6, #0x14]
	ldrh r0, [r6, #0x14]
	mov r1, #7
	bl _s32_div_f
	mov r5, #0
	strh r0, [r6, #0x16]
	ldr r7, _0223281C ; =ov80_0223DD48
	add r6, r5, #0
_0223271C:
	lsl r2, r5, #0x18
	add r0, r4, #0
	mov r1, #7
	lsr r2, r2, #0x18
	add r3, r6, #0
	str r6, [sp]
	bl sub_02030D84
	ldr r1, [r7]
	add r1, r1, r5
	add r1, #0x24
	strb r0, [r1]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _0223271C
_0223273E:
	ldr r6, _0223281C ; =ov80_0223DD48
	ldr r7, _02232820 ; =0x0000036A
	mov r4, #0
_02232744:
	ldr r5, [r6]
	ldr r0, [r5, #4]
	bl SavArray_PlayerParty_get
	add r1, r5, r4
	add r1, #0x24
	ldrb r1, [r1]
	bl GetPartyMonByIndex
	ldr r5, [r6]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r1, r4, #1
	add r1, r5, r1
	strh r0, [r1, r7]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #3
	blo _02232744
	ldr r0, [r5, #4]
	bl SavArray_PlayerParty_get
	str r0, [sp, #8]
	ldr r0, _0223281C ; =ov80_0223DD48
	mov r1, #0
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl ov80_02237B24
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _022327F8
	ldr r6, _0223281C ; =ov80_0223DD48
_0223278E:
	ldr r1, [r6]
	ldr r0, [sp, #8]
	add r1, r1, r5
	add r1, #0x24
	ldrb r1, [r1]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #0x28]
	bl AddMonToParty
	ldr r0, [r6]
	add r1, r5, #0
	ldr r0, [r0, #0x28]
	bl GetPartyMonByIndex
	mov r1, #0
	str r1, [sp, #0x14]
	add r4, r0, #0
	mov r1, #6
	add r2, sp, #0x14
	bl SetMonData
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r0, #0x32
	bls _022327EE
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x32
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0x10
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
_022327EE:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, r7
	blt _0223278E
_022327F8:
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02232810
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov80_0222A840
_02232810:
	ldr r0, _0223281C ; =ov80_0223DD48
	ldr r0, [r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02232818: .word 0x00000A28
_0223281C: .word ov80_0223DD48
_02232820: .word 0x0000036A
	thumb_func_end ov80_022324C4

	thumb_func_start ov80_02232824
ov80_02232824: ; 0x02232824
	push {r3, lr}
	cmp r1, #0
	bne _02232830
	bl ov80_02232838
	pop {r3, pc}
_02232830:
	bl ov80_02232908
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02232824

	thumb_func_start ov80_02232838
ov80_02232838: ; 0x02232838
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	ldr r0, [r7, #0x28]
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r6, #0
	str r0, [sp, #0x10]
	cmp r0, #0
	ble _022328A0
	add r5, r7, #0
_02232852:
	ldr r0, [r7, #0x28]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0x3a
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	mov r1, #0xe5
	lsl r1, r1, #2
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0x3b
	mov r2, #0
	bl GetMonData
	ldr r1, _02232900 ; =0x00000396
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0x3c
	bl GetMonData
	mov r1, #0xe6
	lsl r1, r1, #2
	strh r0, [r5, r1]
	add r0, r4, #0
	mov r1, #0x3d
	mov r2, #0
	bl GetMonData
	ldr r1, _02232904 ; =0x0000039A
	add r6, r6, #1
	strh r0, [r5, r1]
	ldr r0, [sp, #0x10]
	add r5, #8
	cmp r6, r0
	blt _02232852
_022328A0:
	add r0, r7, #0
	bl ov80_02237ED8
	add r1, r0, #0
	add r2, r7, #0
	ldrb r0, [r7, #0x10]
	add r2, #0x30
	mov r3, #0xe
	bl ov80_02237ADC
	ldrb r0, [r7, #0x10]
	mov r1, #1
	ldrb r4, [r7, #0x11]
	bl ov80_02237B58
	add r5, r0, #0
	ldrb r0, [r7, #0x10]
	bl ov80_02237D8C
	mov r3, #0xa2
	lsl r3, r3, #2
	add r1, r7, r3
	str r1, [sp]
	add r1, r3, #0
	sub r1, #0x14
	add r1, r7, r1
	str r1, [sp, #4]
	add r1, r3, #0
	sub r1, #0x10
	add r1, r7, r1
	lsl r0, r0, #0x18
	add r2, r4, #7
	str r1, [sp, #8]
	lsr r0, r0, #0x18
	lsl r1, r4, #1
	lsl r2, r2, #1
	str r0, [sp, #0xc]
	add r1, r7, r1
	add r2, r7, r2
	sub r3, #0x1c
	ldrh r1, [r1, #0x30]
	ldrh r2, [r2, #0x30]
	add r0, r5, #0
	add r3, r7, r3
	bl ov80_0222A6B8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02232900: .word 0x00000396
_02232904: .word 0x0000039A
	thumb_func_end ov80_02232838

	thumb_func_start ov80_02232908
ov80_02232908: ; 0x02232908
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18c
	add r5, r0, #0
	bl ov80_022329B4
	mov r4, #0
	add r6, r5, #0
	add r7, r4, #0
_02232918:
	str r7, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #6
	lsr r2, r2, #0x18
	add r3, r7, #0
	bl sub_02030D84
	strh r0, [r6, #0x30]
	add r4, r4, #1
	add r6, r6, #2
	cmp r4, #0xe
	blt _02232918
	mov r6, #0
	add r4, sp, #0x30
	add r7, r5, #0
_02232938:
	mov r0, #0
	str r0, [sp]
	lsl r2, r6, #0x18
	ldr r0, [r5, #8]
	mov r1, #8
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030D84
	strh r0, [r4]
	ldrh r1, [r4]
	mov r0, #0x9b
	lsl r0, r0, #2
	strh r1, [r7, r0]
	add r6, r6, #1
	add r4, r4, #2
	add r7, r7, #2
	cmp r6, #4
	blt _02232938
	add r0, sp, #0x18
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	add r0, sp, #0x3c
	add r1, sp, #0x30
	add r2, sp, #0x10
	mov r3, #0
	bl ov80_0222A52C
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	mov r7, #0
	add r4, sp, #0x3c
_02232986:
	add r0, r5, #0
	bl ov80_02237D88
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r1, [r5, #0x2c]
	add r0, r5, #0
	add r2, r6, #0
	bl ov80_02237E18
	add r7, r7, #1
	add r4, #0x38
	cmp r7, #4
	blt _02232986
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x18c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02232908

	thumb_func_start ov80_022329B4
ov80_022329B4: ; 0x022329B4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r4, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _02232AB6
	add r7, sp, #8
_022329CE:
	ldr r0, [r5, #0x28]
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #2
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030D84
	add r2, sp, #8
	strh r0, [r7, #2]
	add r0, r6, #0
	mov r1, #0xa3
	add r2, #2
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030D84
	strb r0, [r7]
	add r0, r6, #0
	mov r1, #0x3a
	add r2, sp, #8
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #1
	bl sub_02030D84
	strb r0, [r7]
	add r0, r6, #0
	mov r1, #0x3b
	add r2, sp, #8
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #2
	bl sub_02030D84
	strb r0, [r7]
	add r0, r6, #0
	mov r1, #0x3c
	add r2, sp, #8
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	mov r1, #3
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	lsr r2, r2, #0x18
	add r3, r1, #0
	bl sub_02030D84
	strb r0, [r7]
	add r0, r6, #0
	mov r1, #0x3d
	add r2, sp, #8
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #4
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030D84
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0xa0
	add r2, sp, #0xc
	bl SetMonData
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #5
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030D84
	add r2, sp, #8
	strh r0, [r7, #2]
	add r0, r6, #0
	mov r1, #6
	add r2, #2
	bl SetMonData
	ldr r0, [sp, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _022329CE
_02232AB6:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_022329B4

	thumb_func_start ov80_02232ABC
ov80_02232ABC: ; 0x02232ABC
	push {r4, lr}
	add r4, r0, #0
	beq _02232AE6
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _02232ACC
	bl FreeToHeap
_02232ACC:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _02232AD6
	bl FreeToHeap
_02232AD6:
	ldr r2, _02232AE8 ; =0x00000A28
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
_02232AE6:
	pop {r4, pc}
	.balign 4, 0
_02232AE8: .word 0x00000A28
	thumb_func_end ov80_02232ABC

	thumb_func_start ov80_02232AEC
ov80_02232AEC: ; 0x02232AEC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	mov r4, #0
	add r5, r7, #0
_02232AF6:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl ov80_02232B44
	mov r1, #0xe
	lsl r1, r1, #6
	strh r0, [r5, r1]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #6
	blt _02232AF6
	mov r3, #0
	sub r0, r1, #4
_02232B12:
	add r2, r6, r3
	ldrb r5, [r2, #8]
	mov r4, #0x37
	add r1, r7, r3
	lsl r4, r4, #4
	strb r5, [r1, r4]
	ldrb r5, [r2, #0xc]
	add r4, r4, #4
	add r3, r3, #1
	strb r5, [r1, r4]
	mov r4, #0xde
	lsl r4, r4, #2
	ldrb r5, [r2, #0x10]
	cmp r3, #4
	strb r5, [r1, r4]
	ldrb r2, [r2, #0x14]
	strb r2, [r1, r0]
	blt _02232B12
	ldrh r1, [r6, #0x28]
	ldr r0, _02232B40 ; =0x00000A1C
	strh r1, [r7, r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232B40: .word 0x00000A1C
	thumb_func_end ov80_02232AEC

	thumb_func_start ov80_02232B44
ov80_02232B44: ; 0x02232B44
	push {r3, lr}
	cmp r1, #6
	blo _02232B52
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_02232B52:
	ldrh r0, [r0, #0x20]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02232B44

	thumb_func_start ov80_02232B58
ov80_02232B58: ; 0x02232B58
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r6, r1, #0
	bl sub_02030E08
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r4, r0, #0
	ldrb r0, [r5, #0x10]
	mov r1, #1
	bl ov80_02237B58
	ldrb r1, [r5, #0x10]
	add r0, sp, #0x10
	strb r1, [r0, #8]
	mov r1, #0
	add r0, sp, #0x18
	str r0, [sp]
	ldr r0, [r5, #8]
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02030CF4
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_02030CE0
	mov r2, #0
	ldrb r1, [r5, #0x11]
	add r0, sp, #0x10
	add r3, r2, #0
	strb r1, [r0, #8]
	add r0, sp, #0x18
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_02030CF4
	ldrb r0, [r5, #0x10]
	bl sub_0205C1A0
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1A0
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #0x14]
	add r0, r4, #0
	add r1, r7, #0
	bl sub_02031108
	cmp r6, #2
	beq _02232CCA
	ldrb r0, [r5, #0x10]
	bl sub_0205C1C8
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1C8
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1C8
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1C8
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #0x14]
	add r0, r4, #0
	add r1, r7, #0
	bl sub_0203126C
	ldrb r0, [r5, #0x10]
	bl sub_0205C1C8
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1C8
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020310BC
	str r0, [sp, #0xc]
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020310BC
	add r7, r0, #0
	ldrh r0, [r5, #0x14]
	cmp r0, r6
	bne _02232C6E
	ldrb r0, [r5, #0x10]
	bl sub_0205C240
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C240
	bl sub_0205C268
	lsl r3, r7, #0x10
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	lsr r3, r3, #0x10
	bl sub_0203126C
	b _02232C94
_02232C6E:
	ldr r0, [sp, #0xc]
	cmp r6, r0
	bhs _02232C94
	ldrb r0, [r5, #0x10]
	bl sub_0205C240
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C240
	bl sub_0205C268
	lsl r3, r7, #0x10
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	lsr r3, r3, #0x10
	bl sub_02031108
_02232C94:
	add r0, r5, #0
	add r0, #0x27
	ldrb r1, [r0]
	add r0, sp, #0x10
	mov r3, #0
	strb r1, [r0, #8]
	add r0, sp, #0x18
	str r0, [sp]
	ldrb r2, [r5, #0x10]
	ldr r0, [sp, #4]
	mov r1, #9
	bl sub_02030E18
	ldrb r0, [r5, #0x10]
	cmp r0, #3
	bne _02232CCA
	mov r0, #0x6c
	bl sub_0205C268
	add r3, r5, #0
	add r3, #0x27
	add r2, r0, #0
	ldrb r3, [r3]
	add r0, r4, #0
	mov r1, #0x6c
	bl sub_02031108
_02232CCA:
	mov r4, #0
	add r6, sp, #0x10
	add r7, sp, #0x10
_02232CD0:
	lsl r0, r4, #1
	add r0, r5, r0
	ldrh r0, [r0, #0x30]
	lsl r2, r4, #0x18
	mov r1, #6
	strh r0, [r7]
	str r6, [sp]
	ldr r0, [r5, #8]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0xe
	blo _02232CD0
	mov r4, #0
	add r6, sp, #0x18
	add r7, sp, #0x10
_02232CF8:
	add r0, r5, r4
	add r0, #0x24
	ldrb r0, [r0]
	lsl r2, r4, #0x18
	mov r1, #7
	strb r0, [r7, #8]
	str r6, [sp]
	ldr r0, [r5, #8]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #3
	blo _02232CF8
	ldr r0, [r5, #0x28]
	bl GetPartyCount
	mov r4, #0
	str r0, [sp, #8]
	cmp r0, #0
	bls _02232E10
	add r7, sp, #0x10
_02232D2A:
	ldr r0, [r5, #0x28]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xa3
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	strh r0, [r7]
	add r0, sp, #0x10
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #2
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r6, #0
	mov r1, #0x3a
	mov r2, #0
	bl GetMonData
	strb r0, [r7, #8]
	add r0, sp, #0x18
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r6, #0
	mov r1, #0x3b
	mov r2, #0
	bl GetMonData
	strb r0, [r7, #8]
	add r0, sp, #0x18
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #1
	bl sub_02030CF4
	add r0, r6, #0
	mov r1, #0x3c
	mov r2, #0
	bl GetMonData
	strb r0, [r7, #8]
	add r0, sp, #0x18
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #3
	lsr r2, r2, #0x18
	mov r3, #2
	bl sub_02030CF4
	add r0, r6, #0
	mov r1, #0x3d
	mov r2, #0
	bl GetMonData
	strb r0, [r7, #8]
	add r0, sp, #0x18
	str r0, [sp]
	mov r1, #3
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	lsr r2, r2, #0x18
	add r3, r1, #0
	bl sub_02030CF4
	add r0, r6, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x1c]
	add r0, sp, #0x1c
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #4
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r6, #0
	mov r1, #6
	mov r2, #0
	bl GetMonData
	strh r0, [r7]
	add r0, sp, #0x10
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #5
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [sp, #8]
	cmp r4, r0
	blo _02232D2A
_02232E10:
	ldr r0, [r5, #0x2c]
	bl GetPartyCount
	add r6, r0, #0
	ldr r4, _02232E54 ; =0x00000000
	beq _02232E4E
	add r7, sp, #0x10
_02232E1E:
	ldr r0, [r5, #0x2c]
	add r1, r4, #0
	bl GetPartyMonByIndex
	lsl r0, r4, #1
	add r1, r5, r0
	mov r0, #0x9b
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	add r0, sp, #0x10
	lsl r2, r4, #0x18
	strh r1, [r0]
	str r7, [sp]
	ldr r0, [r5, #8]
	mov r1, #8
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030CF4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r6
	blo _02232E1E
_02232E4E:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02232E54: .word 0x00000000
	thumb_func_end ov80_02232B58

	thumb_func_start ov80_02232E58
ov80_02232E58: ; 0x02232E58
	ldrb r1, [r0, #0x11]
	add r1, r1, #1
	strb r1, [r0, #0x11]
	ldrb r0, [r0, #0x11]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02232E58

	thumb_func_start ov80_02232E64
ov80_02232E64: ; 0x02232E64
	ldrb r0, [r0, #0x11]
	bx lr
	thumb_func_end ov80_02232E64

	thumb_func_start ov80_02232E68
ov80_02232E68: ; 0x02232E68
	push {r4, lr}
	sub sp, #0x30
	add r2, r0, #0
	ldrb r4, [r2, #0x11]
	mov r3, #7
	mul r3, r1
	add r1, r4, r3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x17
	add r1, r2, r1
	ldrh r1, [r1, #0x30]
	add r0, sp, #0
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	add r0, sp, #0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov80_0222A30C
	add sp, #0x30
	pop {r4, pc}
	thumb_func_end ov80_02232E68

	thumb_func_start ov80_02232E9C
ov80_02232E9C: ; 0x02232E9C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r4, #0
_02232EA2:
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r6, r0, #0
	lsl r1, r4, #0x18
	ldrb r0, [r5, #0x10]
	lsr r1, r1, #0x18
	bl sub_0205C174
	add r7, r0, #0
	lsl r1, r4, #0x18
	ldrb r0, [r5, #0x10]
	lsr r1, r1, #0x18
	bl sub_0205C174
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	mov r3, #1
	bl sub_02031108
	add r4, r4, #1
	cmp r4, #3
	blt _02232EA2
	add r0, r5, #0
	mov r1, #1
	bl ov80_02232B58
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02232E9C

	thumb_func_start ov80_02232EE0
ov80_02232EE0: ; 0x02232EE0
	add r1, r0, #0
	mov r2, #1
	add r1, #0x27
	strb r2, [r1]
	ldrh r1, [r0, #0x16]
	cmp r1, #8
	bhs _02232EF2
	add r1, r1, #1
	strh r1, [r0, #0x16]
_02232EF2:
	ldr r3, _02232EFC ; =ov80_02232B58
	mov r1, #0
	strb r1, [r0, #0x11]
	bx r3
	nop
_02232EFC: .word ov80_02232B58
	thumb_func_end ov80_02232EE0

	thumb_func_start ov80_02232F00
ov80_02232F00: ; 0x02232F00
	ldr r3, _02232F04 ; =ov80_02237E30
	bx r3
	.balign 4, 0
_02232F04: .word ov80_02237E30
	thumb_func_end ov80_02232F00

	thumb_func_start ov80_02232F08
ov80_02232F08: ; 0x02232F08
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	mov r1, #1
	ldrb r4, [r5, #0x11]
	bl ov80_02237B58
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl ov80_02237D8C
	mov r3, #0xa2
	lsl r3, r3, #2
	add r1, r5, r3
	str r1, [sp]
	add r1, r3, #0
	sub r1, #0x14
	add r1, r5, r1
	str r1, [sp, #4]
	add r1, r3, #0
	sub r1, #0x10
	add r1, r5, r1
	lsl r0, r0, #0x18
	add r2, r4, #7
	str r1, [sp, #8]
	lsr r0, r0, #0x18
	lsl r1, r4, #1
	lsl r2, r2, #1
	str r0, [sp, #0xc]
	add r1, r5, r1
	add r2, r5, r2
	sub r3, #0x1c
	ldrh r1, [r1, #0x30]
	ldrh r2, [r2, #0x30]
	add r0, r6, #0
	add r3, r5, r3
	bl ov80_0222A6B8
	add r0, r5, #0
	bl ov80_02237E30
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_02232F08

	thumb_func_start ov80_02232F60
ov80_02232F60: ; 0x02232F60
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	bl sub_0203769C
	cmp r0, #0
	bne _02232F74
	mov r0, #0
	str r0, [sp]
	b _02232F78
_02232F74:
	mov r0, #2
	str r0, [sp]
_02232F78:
	ldrb r0, [r6, #0x10]
	mov r1, #0
	bl ov80_02237B24
	add r5, r0, #0
	ldr r0, [r6, #0x28]
	bl GetPartyCount
	ldr r4, [sp]
	add r0, r4, #0
	add r0, r5, r0
	add r1, r4, #0
	str r0, [sp, #4]
	cmp r1, r0
	bge _02232FEA
_02232F96:
	ldr r0, [r6, #0x28]
	add r1, r4, #0
	bl GetPartyMonByIndex
	ldr r1, [sp]
	mov r2, #0
	sub r1, r4, r1
	lsl r1, r1, #3
	add r5, r6, r1
	mov r1, #0x3a
	add r7, r0, #0
	bl GetMonData
	mov r1, #0xe5
	lsl r1, r1, #2
	strh r0, [r5, r1]
	add r0, r7, #0
	mov r1, #0x3b
	mov r2, #0
	bl GetMonData
	ldr r1, _02233018 ; =0x00000396
	mov r2, #0
	strh r0, [r5, r1]
	add r0, r7, #0
	mov r1, #0x3c
	bl GetMonData
	mov r1, #0xe6
	lsl r1, r1, #2
	strh r0, [r5, r1]
	add r0, r7, #0
	mov r1, #0x3d
	mov r2, #0
	bl GetMonData
	ldr r1, _0223301C ; =0x0000039A
	add r4, r4, #1
	strh r0, [r5, r1]
	ldr r0, [sp, #4]
	cmp r4, r0
	blt _02232F96
_02232FEA:
	ldr r0, [r6, #0x28]
	bl ov80_02237D9C
	mov r0, #0x37
	lsl r0, r0, #4
	mov r7, #0
	add r2, r0, #0
	add r3, r0, #0
	add r4, r7, #0
	add r1, r0, #4
	add r2, #8
	add r3, #0xc
_02233002:
	add r5, r6, r7
	strb r4, [r5, r0]
	strb r4, [r5, r1]
	strb r4, [r5, r2]
	add r7, r7, #1
	strb r4, [r5, r3]
	cmp r7, #4
	blt _02233002
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02233018: .word 0x00000396
_0223301C: .word 0x0000039A
	thumb_func_end ov80_02232F60

	thumb_func_start ov80_02233020
ov80_02233020: ; 0x02233020
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #0x10]
	add r1, sp, #0x18
	add r4, r0, #0
_0223302E:
	add r0, r0, #1
	strb r4, [r1]
	add r1, r1, #1
	cmp r0, #0x14
	blt _0223302E
	strb r4, [r6, #0x12]
	bl sub_0203769C
	cmp r0, #0
	bne _02233048
	mov r0, #0
	str r0, [sp]
	b _0223304C
_02233048:
	mov r0, #2
	str r0, [sp]
_0223304C:
	ldrb r0, [r6, #0x10]
	mov r1, #0
	bl ov80_02237B24
	str r0, [sp, #8]
	ldrb r0, [r6, #0x10]
	mov r1, #1
	bl ov80_02237B58
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r0, [sp]
	add r0, r1, r0
	ldr r1, [sp]
	str r0, [sp, #0xc]
	cmp r1, r0
	bge _02233122
	add r7, sp, #0x18
_02233070:
	ldr r0, [r6, #0x28]
	ldr r1, [sp]
	bl GetPartyMonByIndex
	mov r1, #0xac
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02233116
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x14]
	add r0, r5, #0
	mov r1, #0xa4
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _022330E2
	ldrb r1, [r7]
	add r1, r1, #1
	strb r1, [r7]
	ldr r1, [sp, #0x14]
	cmp r1, r0
	bne _022330B6
	ldrb r0, [r7, #1]
	add r0, r0, #1
	strb r0, [r7, #1]
	b _022330CC
_022330B6:
	lsr r1, r0, #1
	ldr r0, [sp, #0x14]
	cmp r0, r1
	blo _022330C6
	ldrb r0, [r7, #2]
	add r0, r0, #1
	strb r0, [r7, #2]
	b _022330CC
_022330C6:
	ldrb r0, [r7, #3]
	add r0, r0, #1
	strb r0, [r7, #3]
_022330CC:
	add r0, r5, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022330E6
	ldrb r0, [r7, #4]
	add r0, r0, #1
	strb r0, [r7, #4]
	b _022330E6
_022330E2:
	mov r0, #1
	strb r0, [r6, #0x12]
_022330E6:
	add r0, r5, #0
	mov r1, #0x3a
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x3b
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x3c
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
	add r0, r5, #0
	mov r1, #0x3d
	mov r2, #0
	bl GetMonData
	add r4, r4, r0
_02233116:
	ldr r0, [sp]
	add r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp]
	cmp r1, r0
	blt _02233070
_02233122:
	ldr r1, [sp, #4]
	mov r0, #0
	cmp r1, #0
	ble _02233146
	mov r2, #0xdd
	add r3, sp, #0x18
	lsl r2, r2, #2
_02233130:
	add r1, r6, r0
	ldrb r1, [r1, r2]
	cmp r1, #1
	bne _0223313E
	ldrb r1, [r3, #8]
	add r1, r1, #1
	strb r1, [r3, #8]
_0223313E:
	ldr r1, [sp, #4]
	add r0, r0, #1
	cmp r0, r1
	blt _02233130
_02233146:
	ldr r0, [sp, #8]
	mov r3, #0
	add r7, r3, #0
	cmp r0, #0
	ble _0223316E
	mov r0, #0xe5
	lsl r0, r0, #2
_02233154:
	mov r2, #0
	add r5, r6, #0
_02233158:
	ldrh r1, [r5, r0]
	add r2, r2, #1
	add r5, r5, #2
	add r3, r3, r1
	cmp r2, #4
	blt _02233158
	ldr r1, [sp, #8]
	add r7, r7, #1
	add r6, #8
	cmp r7, r1
	blt _02233154
_0223316E:
	sub r0, r3, r4
	cmp r0, #5
	bgt _0223317E
	add r0, sp, #0x18
	ldrb r1, [r0, #5]
	add r1, r1, #1
	strb r1, [r0, #5]
	b _02233198
_0223317E:
	cmp r0, #0xa
	bgt _0223318C
	add r0, sp, #0x18
	ldrb r1, [r0, #6]
	add r1, r1, #1
	strb r1, [r0, #6]
	b _02233198
_0223318C:
	cmp r0, #0xf
	bgt _02233198
	add r0, sp, #0x18
	ldrb r1, [r0, #7]
	add r1, r1, #1
	strb r1, [r0, #7]
_02233198:
	add r1, sp, #0x18
	ldrb r2, [r1]
	lsl r0, r2, #1
	add r2, r2, r0
	ldr r0, [sp, #0x10]
	add r3, r0, r2
	ldrb r2, [r1, #1]
	lsl r0, r2, #1
	add r0, r2, r0
	add r2, r3, r0
	ldrb r0, [r1, #2]
	lsl r0, r0, #1
	add r2, r2, r0
	ldrb r0, [r1, #3]
	add r2, r2, r0
	ldrb r0, [r1, #4]
	add r2, r2, r0
	ldrb r0, [r1, #5]
	lsl r0, r0, #3
	add r3, r2, r0
	ldrb r2, [r1, #6]
	mov r0, #6
	mul r0, r2
	add r2, r3, r0
	ldrb r0, [r1, #7]
	ldrb r1, [r1, #8]
	lsl r0, r0, #2
	add r2, r2, r0
	mov r0, #7
	mul r0, r1
	add r0, r2, r0
	str r0, [sp, #0x10]
	cmp r0, #0
	bgt _022331E0
	mov r0, #1
	str r0, [sp, #0x10]
_022331E0:
	ldr r0, [sp, #0x10]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02233020

	thumb_func_start ov80_022331E8
ov80_022331E8: ; 0x022331E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	add r4, r2, #0
	bl sub_0203107C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205C1F0
	str r0, [sp]
	add r0, r5, #0
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp]
	add r0, r7, #0
	bl sub_020310BC
	add r1, r0, r4
	ldr r0, _0223327C ; =0x0000270F
	cmp r1, r0
	ble _02233244
	add r0, r6, #0
	bl sub_0203107C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205C1F0
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #4]
	ldr r3, _0223327C ; =0x0000270F
	add r0, r7, #0
	bl sub_02031108
	b _0223326A
_02233244:
	add r0, r6, #0
	bl sub_0203107C
	add r7, r0, #0
	add r0, r5, #0
	bl sub_0205C1F0
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #8]
	add r0, r7, #0
	add r3, r4, #0
	bl sub_02031228
_0223326A:
	add r0, r6, #0
	bl Sav2_GameStats_get
	mov r1, #0x42
	add r2, r4, #0
	bl GameStats_Add
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223327C: .word 0x0000270F
	thumb_func_end ov80_022331E8

	thumb_func_start ov80_02233280
ov80_02233280: ; 0x02233280
	push {r3, lr}
	cmp r1, #6
	bhi _022332CC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02233292: ; jump table
	.short _022332A0 - _02233292 - 2 ; case 0
	.short _022332A6 - _02233292 - 2 ; case 1
	.short _022332AC - _02233292 - 2 ; case 2
	.short _022332B2 - _02233292 - 2 ; case 3
	.short _022332B8 - _02233292 - 2 ; case 4
	.short _022332C0 - _02233292 - 2 ; case 5
	.short _022332C8 - _02233292 - 2 ; case 6
_022332A0:
	bl ov80_0222B5C8
	pop {r3, pc}
_022332A6:
	bl ov80_0222B65C
	pop {r3, pc}
_022332AC:
	bl ov80_0222B6C8
	pop {r3, pc}
_022332B2:
	bl ov80_0222B7E4
	pop {r3, pc}
_022332B8:
	add r1, r2, #0
	bl ov80_0222B8D8
	pop {r3, pc}
_022332C0:
	add r1, r2, #0
	bl ov80_0222B920
	pop {r3, pc}
_022332C8:
	bl ov80_0222B968
_022332CC:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02233280

	thumb_func_start ov80_022332D0
ov80_022332D0: ; 0x022332D0
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r6, r1, #0
	bl ov80_0222AB34
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	beq _022332EC
	bl GF_AssertFail
_022332EC:
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	beq _022332FA
	bl GF_AssertFail
_022332FA:
	ldrb r0, [r6, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02233342
	mov r0, #0xb
	mov r1, #1
	bl AllocWindows
	add r1, r5, #0
	add r1, #0xa8
	str r0, [r1]
	mov r2, #1
	add r1, r5, #0
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, _022333C8 ; =0x00000253
	add r1, #0xa8
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r1]
	add r3, r2, #0
	bl AddWindowParameterized
	add r1, r5, #0
	add r1, #0xa8
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov80_022333D0
	b _022333BA
_02233342:
	mov r0, #0xb
	mov r1, #1
	bl AllocWindows
	add r1, r5, #0
	add r1, #0xa8
	str r0, [r1]
	mov r0, #0xb
	mov r1, #1
	bl AllocWindows
	add r1, r5, #0
	add r1, #0xac
	str r0, [r1]
	mov r2, #1
	add r1, r5, #0
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, _022333C8 ; =0x00000253
	add r1, #0xa8
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r1]
	add r3, r2, #0
	bl AddWindowParameterized
	mov r2, #1
	add r1, r5, #0
	str r2, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	ldr r0, _022333CC ; =0x0000022B
	add r1, #0xac
	str r0, [sp, #0x10]
	ldr r0, [r4]
	ldr r1, [r1]
	mov r3, #0x15
	bl AddWindowParameterized
	add r1, r5, #0
	add r1, #0xa8
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov80_022333D0
	add r1, r5, #0
	add r1, #0xac
	ldr r0, [r4]
	ldr r1, [r1]
	bl ov80_022333D0
_022333BA:
	add r0, r5, #0
	add r1, r6, #0
	bl ov80_02233490
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_022333C8: .word 0x00000253
_022333CC: .word 0x0000022B
	thumb_func_end ov80_022332D0

	thumb_func_start ov80_022333D0
ov80_022333D0: ; 0x022333D0
	push {r4, lr}
	add r4, r1, #0
	ldr r2, _022333EC ; =0x000003D9
	add r0, r4, #0
	mov r1, #1
	mov r3, #0xc
	bl DrawFrameAndWindow1
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	pop {r4, pc}
	nop
_022333EC: .word 0x000003D9
	thumb_func_end ov80_022333D0

	thumb_func_start ov80_022333F0
ov80_022333F0: ; 0x022333F0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrb r0, [r1, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _02233424
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _0223340C
	bl GF_AssertFail
_0223340C:
	add r0, r5, #0
	add r0, #0xa8
	ldr r4, [r0]
	mov r1, #0
	add r0, r4, #0
	bl sub_0200E5D4
	add r0, r4, #0
	mov r1, #1
	bl WindowArray_dtor
	b _02233480
_02233424:
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _02233432
	bl GF_AssertFail
_02233432:
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	bne _02233440
	bl GF_AssertFail
_02233440:
	bl sub_0203769C
	cmp r0, #0
	bne _02233454
	add r0, r5, #0
	add r0, #0xa8
	ldr r4, [r0]
	add r0, r5, #0
	add r0, #0xac
	b _0223345E
_02233454:
	add r0, r5, #0
	add r0, #0xac
	ldr r4, [r0]
	add r0, r5, #0
	add r0, #0xa8
_0223345E:
	ldr r6, [r0]
	add r0, r4, #0
	mov r1, #0
	bl sub_0200E5D4
	add r0, r4, #0
	mov r1, #1
	bl WindowArray_dtor
	add r0, r6, #0
	mov r1, #0
	bl sub_0200E5D4
	add r0, r6, #0
	mov r1, #1
	bl WindowArray_dtor
_02233480:
	add r0, r5, #0
	mov r1, #0
	add r0, #0xa8
	str r1, [r0]
	add r5, #0xac
	str r1, [r5]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_022333F0

	thumb_func_start ov80_02233490
ov80_02233490: ; 0x02233490
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	ldrb r0, [r5, #0x10]
	bl ov80_02237D8C
	cmp r0, #0
	bne _022334EA
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _022334AE
	bl GF_AssertFail
_022334AE:
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl sub_020310BC
	add r6, r0, #0
	ldr r0, [r5, #4]
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	add r0, r4, #0
	add r4, #0xa8
	ldr r1, [r4]
	add r3, r6, #0
	bl ov80_02233594
	pop {r3, r4, r5, r6, r7, pc}
_022334EA:
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _022334F8
	bl GF_AssertFail
_022334F8:
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	cmp r0, #0
	bne _02233506
	bl GF_AssertFail
_02233506:
	bl sub_0203769C
	cmp r0, #0
	bne _0223353A
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl sub_020310BC
	add r6, r0, #0
	ldr r0, _02233590 ; =0x00000A1C
	ldrh r5, [r5, r0]
	b _02233564
_0223353A:
	ldr r0, _02233590 ; =0x00000A1C
	ldrh r6, [r5, r0]
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	str r0, [sp]
	ldrb r0, [r5, #0x10]
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp]
	add r0, r7, #0
	bl sub_020310BC
	add r5, r0, #0
_02233564:
	mov r0, #0
	bl sub_02034818
	add r1, r4, #0
	add r1, #0xa8
	add r2, r0, #0
	ldr r1, [r1]
	add r0, r4, #0
	add r3, r6, #0
	bl ov80_02233594
	mov r0, #1
	bl sub_02034818
	add r2, r0, #0
	add r0, r4, #0
	add r4, #0xac
	ldr r1, [r4]
	add r3, r5, #0
	bl ov80_02233594
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02233590: .word 0x00000A1C
	thumb_func_end ov80_02233490

	thumb_func_start ov80_02233594
ov80_02233594: ; 0x02233594
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	str r3, [sp, #0x14]
	str r1, [sp, #0xc]
	ldr r1, [r5, #0x34]
	mov r0, #0x14
	str r2, [sp, #0x10]
	bl String_ctor
	add r4, r0, #0
	ldr r1, [r5, #0x34]
	mov r0, #0x14
	bl String_ctor
	add r6, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x1f
	mov r3, #0xb
	bl NewMsgDataFromNarc
	add r7, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x44]
	ldr r2, [sp, #0x14]
	mov r1, #0
	mov r3, #4
	bl BufferIntegerAsString
	add r0, r7, #0
	mov r1, #2
	add r2, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x44]
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	mov r3, #0x10
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r1, #0
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	add r2, r6, #0
	bl AddTextPrinterParameterized
	ldr r0, [r5, #0x44]
	ldr r2, [sp, #0x10]
	mov r1, #0
	bl BufferPlayersName
	add r0, r7, #0
	mov r1, #0
	add r2, r4, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x44]
	add r1, r6, #0
	add r2, r4, #0
	bl StringExpandPlaceholders
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	ldr r0, [sp, #0xc]
	add r2, r6, #0
	add r3, r1, #0
	str r1, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl String_dtor
	add r0, r6, #0
	bl String_dtor
	add r0, r7, #0
	bl DestroyMsgData
	ldr r0, [sp, #0xc]
	bl CopyWindowToVram
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02233594

	thumb_func_start ov80_02233648
ov80_02233648: ; 0x02233648
	ldrb r3, [r0, #0x10]
	ldrh r2, [r0, #0x16]
	cmp r3, #1
	bhi _0223365E
	cmp r2, #8
	blo _02233658
	mov r1, #7
	b _0223366A
_02233658:
	ldr r1, _02233680 ; =ov80_0223BE54
	ldrb r1, [r1, r2]
	b _0223366A
_0223365E:
	cmp r2, #8
	blo _02233666
	mov r1, #0x12
	b _0223366A
_02233666:
	ldr r1, _02233684 ; =ov80_0223BE60
	ldrb r1, [r1, r2]
_0223366A:
	cmp r3, #0
	bne _0223367A
	ldrh r0, [r0, #0x14]
	cmp r0, #0x15
	beq _02233678
	cmp r0, #0x31
	bne _0223367A
_02233678:
	mov r1, #0x14
_0223367A:
	add r0, r1, #0
	bx lr
	nop
_02233680: .word ov80_0223BE54
_02233684: .word ov80_0223BE60
	thumb_func_end ov80_02233648

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
	bl ov80_022380E8
	mov r5, #0
	str r0, [sp, #4]
	cmp r0, #0
	ble _02233858
_0223381A:
	ldr r0, [r6, #0x70]
	add r1, r5, #0
	bl GetPartyMonByIndex
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
	bl GetPartyCount
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
	bl GetPartyMonByIndex
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
	bl sub_02051BF8
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
	bl GetPartyCount
	mov r6, #0
	str r0, [sp]
	cmp r0, #0
	ble _02233A16
	add r5, r7, #0
_022339A4:
	ldr r0, [r7, #0x70]
	add r1, r6, #0
	bl GetPartyMonByIndex
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
	bl GetPartyMonByIndex
	b _02233B8A
_02233B82:
	ldr r0, [r4, #0x74]
	mov r1, #0
	bl GetPartyMonByIndex
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
	bl SavArray_PlayerParty_get
	add r7, r0, #0
	ldr r0, _02233E44 ; =0x00000412
	mov r5, #0
	add r6, r4, r0
_02233BAC:
	add r1, r4, r5
	add r1, #0x2c
	ldrb r1, [r1]
	add r0, r7, #0
	bl GetPartyMonByIndex
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
	bl ov80_022380E8
	str r0, [sp, #0x18]
	ldrb r0, [r4, #0x10]
	mov r1, #1
	bl ov80_0223811C
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
	bl ov80_02238374
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
	bl ov80_022380E8
	str r0, [sp, #0x14]
	ldrb r0, [r4, #0x10]
	mov r1, #1
	bl ov80_0223811C
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
	bl ov80_02238374
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
	bl ov80_02238374
	cmp r0, #0
	bne _02233DBE
	ldr r0, [sp, #0x24]
	ldr r0, [r0, #8]
	bl Sav2_PlayerData_GetProfileAddr
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

	thumb_func_start ov80_022340E8
ov80_022340E8: ; 0x022340E8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r1, #0
	add r4, r0, #0
	str r2, [sp, #4]
	ldr r1, _02234370 ; =0x00000A88
	mov r0, #0xb
	str r3, [sp, #8]
	bl AllocFromHeap
	ldr r1, _02234374 ; =ov80_0223DD4C
	ldr r2, _02234370 ; =0x00000A88
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _02234374 ; =ov80_0223DD4C
	ldr r5, [r0]
	add r0, r4, #0
	bl sub_02030E88
	str r0, [r5, #8]
	ldr r1, _02234374 ; =ov80_0223DD4C
	str r4, [r5, #4]
	mov r0, #0xb
	str r0, [r5]
	ldr r5, [r1]
	bl SavArray_Party_alloc
	str r0, [r5, #0x70]
	mov r0, #0xb
	bl SavArray_Party_alloc
	str r0, [r5, #0x74]
	mov r0, #0x2a
	ldr r1, [sp, #0x38]
	lsl r0, r0, #6
	str r1, [r5, r0]
	mov r0, #0x20
	strb r0, [r5, #0x13]
	add r0, r4, #0
	ldr r6, [r5, #8]
	bl sub_02030FA0
	add r4, r0, #0
	cmp r7, #0
	bne _022341EC
	ldr r0, _02234374 ; =ov80_0223DD4C
	mov r1, #0
	ldr r2, [r0]
	ldr r0, [sp, #4]
	strb r0, [r2, #0x10]
	strb r1, [r2, #0x11]
	mov r0, #3
	strb r0, [r2, #0x1c]
	add r0, r6, #0
	strb r1, [r2, #0x12]
	bl sub_02030E7C
	ldr r0, _02234374 ; =ov80_0223DD4C
	ldr r0, [r0]
	ldrb r2, [r0, #0x10]
	cmp r2, #3
	bne _02234174
	ldr r0, [r0, #4]
	bl SavArray_Flags_get
	bl ScriptState_GetVar4052
	b _02234180
_02234174:
	mov r3, #0
	add r0, r4, #0
	mov r1, #8
	str r3, [sp]
	bl sub_02030FE4
_02234180:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _022341B8
	ldr r0, _02234374 ; =ov80_0223DD4C
	ldr r5, [r0]
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r4, r0, #0
	ldr r0, _02234374 ; =ov80_0223DD4C
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C2C0
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C2C0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	strh r0, [r5, #0x18]
	b _022341C0
_022341B8:
	ldr r0, _02234374 ; =ov80_0223DD4C
	mov r1, #0
	ldr r0, [r0]
	strh r1, [r0, #0x18]
_022341C0:
	ldr r0, _02234374 ; =ov80_0223DD4C
	mov r1, #7
	ldr r4, [r0]
	ldrh r0, [r4, #0x18]
	bl _s32_div_f
	strh r0, [r4, #0x1a]
	mov r0, #0
	str r0, [r4, #0x24]
	add r1, r4, #0
	ldr r0, [sp, #8]
	add r1, #0x2c
	strb r0, [r1]
	add r0, r4, #0
	add r1, sp, #0x20
	ldrh r2, [r1, #0x10]
	add r0, #0x2d
	add r4, #0x2e
	strb r2, [r0]
	ldrh r0, [r1, #0x14]
	strb r0, [r4]
	b _02234294
_022341EC:
	mov r1, #0
	add r0, r6, #0
	add r2, r1, #0
	add r3, r1, #0
	str r1, [sp]
	bl sub_02030F34
	ldr r1, _02234374 ; =ov80_0223DD4C
	mov r2, #0
	ldr r1, [r1]
	add r3, r2, #0
	strb r0, [r1, #0x10]
	add r0, r6, #0
	mov r1, #2
	str r2, [sp]
	bl sub_02030F34
	ldr r1, _02234374 ; =ov80_0223DD4C
	mov r2, #0
	ldr r4, [r1]
	mov r1, #3
	strb r0, [r4, #0x11]
	str r2, [sp]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02030F34
	strb r0, [r4, #0x1c]
	mov r2, #0
	str r2, [sp]
	add r0, r6, #0
	mov r1, #1
	add r3, r2, #0
	bl sub_02030F34
	strb r0, [r4, #0x12]
	ldr r0, _02234374 ; =ov80_0223DD4C
	ldr r5, [r0]
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r7, r0, #0
	ldr r0, _02234374 ; =ov80_0223DD4C
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl sub_0205C2C0
	str r0, [sp, #0x10]
	ldrb r0, [r4, #0x10]
	bl sub_0205C2C0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	bl sub_020310BC
	strh r0, [r5, #0x18]
	ldrh r0, [r5, #0x18]
	mov r1, #7
	bl _s32_div_f
	mov r4, #0
	strh r0, [r5, #0x1a]
	add r7, r4, #0
_02234270:
	ldr r0, _02234374 ; =ov80_0223DD4C
	lsl r2, r4, #0x18
	ldr r5, [r0]
	add r0, r6, #0
	mov r1, #6
	lsr r2, r2, #0x18
	add r3, r7, #0
	str r7, [sp]
	bl sub_02030F34
	add r1, r5, r4
	add r1, #0x2c
	strb r0, [r1]
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #3
	blo _02234270
_02234294:
	ldr r6, _02234374 ; =ov80_0223DD4C
	ldr r7, _02234378 ; =0x00000412
	mov r5, #0
_0223429A:
	ldr r4, [r6]
	ldr r0, [r4, #4]
	bl SavArray_PlayerParty_get
	add r1, r4, r5
	add r1, #0x2c
	ldrb r1, [r1]
	bl GetPartyMonByIndex
	ldr r4, [r6]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r1, r5, #1
	add r1, r4, r1
	strh r0, [r1, r7]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _0223429A
	ldr r0, [r4, #4]
	bl SavArray_PlayerParty_get
	str r0, [sp, #0xc]
	ldr r0, _02234374 ; =ov80_0223DD4C
	mov r1, #0
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl ov80_022380E8
	add r7, r0, #0
	mov r5, #0
	cmp r7, #0
	ble _0223434E
	ldr r6, _02234374 ; =ov80_0223DD4C
_022342E4:
	ldr r1, [r6]
	ldr r0, [sp, #0xc]
	add r1, r1, r5
	add r1, #0x2c
	ldrb r1, [r1]
	bl GetPartyMonByIndex
	add r1, r0, #0
	ldr r0, [r6]
	ldr r0, [r0, #0x70]
	bl AddMonToParty
	ldr r0, [r6]
	add r1, r5, #0
	ldr r0, [r0, #0x70]
	bl GetPartyMonByIndex
	mov r1, #0
	str r1, [sp, #0x18]
	add r4, r0, #0
	mov r1, #6
	add r2, sp, #0x18
	bl SetMonData
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r0, #0x32
	bls _02234344
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x32
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0x14
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
_02234344:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, r7
	blt _022342E4
_0223434E:
	ldr r0, _02234374 ; =ov80_0223DD4C
	ldr r0, [r0]
	ldrb r0, [r0, #0x10]
	bl ov80_02238374
	cmp r0, #1
	bne _02234366
	ldr r0, _02234374 ; =ov80_0223DD4C
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bl ov80_0222A840
_02234366:
	ldr r0, _02234374 ; =ov80_0223DD4C
	ldr r0, [r0]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02234370: .word 0x00000A88
_02234374: .word ov80_0223DD4C
_02234378: .word 0x00000412
	thumb_func_end ov80_022340E8

	thumb_func_start ov80_0223437C
ov80_0223437C: ; 0x0223437C
	push {r3, lr}
	cmp r1, #0
	bne _02234388
	bl ov80_02234390
	pop {r3, pc}
_02234388:
	bl ov80_02234424
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0223437C

	thumb_func_start ov80_02234390
ov80_02234390: ; 0x02234390
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl ov80_02238498
	add r1, r0, #0
	add r2, r5, #0
	ldrb r0, [r5, #0x10]
	add r2, #0x78
	mov r3, #0xe
	bl ov80_022380A0
	ldrb r0, [r5, #0x10]
	mov r1, #1
	ldrb r4, [r5, #0x11]
	bl ov80_0223811C
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl ov80_02238374
	mov r3, #0x33
	lsl r3, r3, #4
	add r1, r5, r3
	str r1, [sp]
	add r1, r3, #0
	sub r1, #0x14
	add r1, r5, r1
	str r1, [sp, #4]
	add r1, r3, #0
	sub r1, #0x10
	add r1, r5, r1
	add r2, r4, #7
	str r1, [sp, #8]
	lsl r0, r0, #0x18
	lsl r1, r4, #1
	lsl r2, r2, #1
	lsr r0, r0, #0x18
	add r1, r5, r1
	add r2, r5, r2
	str r0, [sp, #0xc]
	add r1, #0x78
	add r2, #0x78
	sub r3, #0x1c
	ldrh r1, [r1]
	ldrh r2, [r2]
	add r0, r6, #0
	add r3, r5, r3
	bl ov80_0222A6B8
	add r0, r5, #0
	bl ov80_02238498
	ldr r3, _0223441C ; =ov80_0223BE98
	mov r2, #0
_022343FE:
	ldrb r1, [r3]
	cmp r0, r1
	blt _02234410
	ldr r0, _02234420 ; =ov80_0223BE98 + 1
	lsl r1, r2, #1
	ldrb r0, [r0, r1]
	add sp, #0x10
	strb r0, [r5, #0x1c]
	pop {r4, r5, r6, pc}
_02234410:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #3
	blo _022343FE
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0223441C: .word ov80_0223BE98
_02234420: .word ov80_0223BE98 + 1
	thumb_func_end ov80_02234390

	thumb_func_start ov80_02234424
ov80_02234424: ; 0x02234424
	push {r4, r5, r6, r7, lr}
	sub sp, #0x18c
	add r5, r0, #0
	bl ov80_022344D4
	mov r4, #0
	add r6, r5, #0
	add r7, r4, #0
_02234434:
	str r7, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #5
	lsr r2, r2, #0x18
	add r3, r7, #0
	bl sub_02030F34
	add r1, r6, #0
	add r1, #0x78
	add r4, r4, #1
	add r6, r6, #2
	strh r0, [r1]
	cmp r4, #0xe
	blt _02234434
	mov r6, #0
	add r4, sp, #0x30
	add r7, r5, #0
_02234458:
	mov r0, #0
	str r0, [sp]
	lsl r2, r6, #0x18
	ldr r0, [r5, #8]
	mov r1, #7
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030F34
	strh r0, [r4]
	ldrh r1, [r4]
	mov r0, #0xc5
	lsl r0, r0, #2
	strh r1, [r7, r0]
	add r6, r6, #1
	add r4, r4, #2
	add r7, r7, #2
	cmp r6, #4
	blt _02234458
	add r0, sp, #0x18
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	add r0, sp, #0x3c
	add r1, sp, #0x30
	add r2, sp, #0x10
	mov r3, #0
	bl ov80_0222A52C
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	mov r7, #0
	add r4, sp, #0x3c
_022344A6:
	add r0, r5, #0
	bl ov80_02238370
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r1, [r5, #0x74]
	add r0, r5, #0
	add r2, r6, #0
	bl ov80_022383A8
	add r7, r7, #1
	add r4, #0x38
	cmp r7, #4
	blt _022344A6
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x18c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02234424

	thumb_func_start ov80_022344D4
ov80_022344D4: ; 0x022344D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0x70]
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	mov r4, #0
	cmp r7, #0
	ble _0223451A
_022344EA:
	ldr r0, [r5, #0x70]
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #4
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030F34
	add r1, sp, #4
	strh r0, [r1]
	add r0, r6, #0
	mov r1, #6
	add r2, sp, #4
	bl SetMonData
	add r4, r4, #1
	cmp r4, r7
	blt _022344EA
_0223451A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_022344D4

	thumb_func_start ov80_02234520
ov80_02234520: ; 0x02234520
	push {r4, lr}
	add r4, r0, #0
	beq _0223454A
	ldr r0, [r4, #0x70]
	cmp r0, #0
	beq _02234530
	bl FreeToHeap
_02234530:
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _0223453A
	bl FreeToHeap
_0223453A:
	ldr r2, _0223454C ; =0x00000A88
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
_0223454A:
	pop {r4, pc}
	.balign 4, 0
_0223454C: .word 0x00000A88
	thumb_func_end ov80_02234520

	thumb_func_start ov80_02234550
ov80_02234550: ; 0x02234550
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02234570 ; =0x00000418
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
_0223455A:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl ov80_02234574
	strh r0, [r5, r7]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #6
	blt _0223455A
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02234570: .word 0x00000418
	thumb_func_end ov80_02234550

	thumb_func_start ov80_02234574
ov80_02234574: ; 0x02234574
	push {r3, lr}
	cmp r1, #6
	blo _02234582
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_02234582:
	ldrh r0, [r0, #0x38]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02234574

	thumb_func_start ov80_02234588
ov80_02234588: ; 0x02234588
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	bl sub_02030FA0
	str r0, [sp, #4]
	ldrb r0, [r5, #0x10]
	mov r1, #1
	bl ov80_0223811C
	ldrb r1, [r5, #0x10]
	add r0, sp, #8
	strb r1, [r0, #8]
	mov r1, #0
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [r5, #8]
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02030EB4
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_02030EA0
	mov r2, #0
	ldrb r1, [r5, #0x11]
	add r0, sp, #8
	add r3, r2, #0
	strb r1, [r0, #8]
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r1, #2
	bl sub_02030EB4
	mov r2, #0
	ldrb r1, [r5, #0x1c]
	add r0, sp, #8
	add r3, r2, #0
	strb r1, [r0, #8]
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r1, #3
	bl sub_02030EB4
	mov r2, #0
	ldrb r1, [r5, #0x12]
	add r0, sp, #8
	add r3, r2, #0
	strb r1, [r0, #8]
	add r0, sp, #0x10
	str r0, [sp]
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_02030EB4
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C2C0
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C2C0
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #0x18]
	add r0, r6, #0
	add r1, r7, #0
	bl sub_02031108
	cmp r4, #2
	beq _0223468E
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r4, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C2E8
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl sub_0205C2E8
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #0x18]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0203126C
	add r0, r5, #0
	add r0, #0x2f
	ldrb r1, [r0]
	add r0, sp, #8
	mov r3, #0
	strb r1, [r0, #8]
	add r0, sp, #0x10
	str r0, [sp]
	ldrb r2, [r5, #0x10]
	ldr r0, [sp, #4]
	mov r1, #8
	bl sub_02030FB0
	ldrb r0, [r5, #0x10]
	cmp r0, #3
	bne _0223468E
	ldr r0, [r5, #4]
	bl sub_0203107C
	add r4, r0, #0
	mov r0, #0x6e
	bl sub_0205C268
	add r3, r5, #0
	add r3, #0x2f
	add r2, r0, #0
	ldrb r3, [r3]
	add r0, r4, #0
	mov r1, #0x6e
	bl sub_02031108
_0223468E:
	mov r4, #0
	add r6, sp, #8
	add r7, sp, #8
_02234694:
	lsl r0, r4, #1
	add r0, r5, r0
	add r0, #0x78
	ldrh r0, [r0]
	lsl r2, r4, #0x18
	mov r1, #5
	strh r0, [r7]
	str r6, [sp]
	ldr r0, [r5, #8]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030EB4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0xe
	blo _02234694
	mov r4, #0
	add r6, sp, #0x10
	add r7, sp, #8
_022346BE:
	add r0, r5, r4
	add r0, #0x2c
	ldrb r0, [r0]
	lsl r2, r4, #0x18
	mov r1, #6
	strb r0, [r7, #8]
	str r6, [sp]
	ldr r0, [r5, #8]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030EB4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #3
	blo _022346BE
	ldr r0, [r5, #0x70]
	bl GetPartyCount
	add r6, r0, #0
	ldr r4, _02234760 ; =0x00000000
	beq _0223471C
	add r7, sp, #8
_022346EE:
	ldr r0, [r5, #0x70]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r1, sp, #8
	strh r0, [r1]
	str r7, [sp]
	lsl r2, r4, #0x18
	ldr r0, [r5, #8]
	mov r1, #4
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030EB4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r6
	blo _022346EE
_0223471C:
	ldr r0, [r5, #0x74]
	bl GetPartyCount
	add r6, r0, #0
	ldr r4, _02234760 ; =0x00000000
	beq _0223475A
	add r7, sp, #8
_0223472A:
	ldr r0, [r5, #0x74]
	add r1, r4, #0
	bl GetPartyMonByIndex
	lsl r0, r4, #1
	add r1, r5, r0
	mov r0, #0xc5
	lsl r0, r0, #2
	ldrh r1, [r1, r0]
	add r0, sp, #8
	lsl r2, r4, #0x18
	strh r1, [r0]
	str r7, [sp]
	ldr r0, [r5, #8]
	mov r1, #7
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030EB4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, r6
	blo _0223472A
_0223475A:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02234760: .word 0x00000000
	thumb_func_end ov80_02234588

	thumb_func_start ov80_02234764
ov80_02234764: ; 0x02234764
	ldrb r1, [r0, #0x11]
	add r1, r1, #1
	strb r1, [r0, #0x11]
	ldrb r0, [r0, #0x11]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02234764

	thumb_func_start ov80_02234770
ov80_02234770: ; 0x02234770
	ldrb r0, [r0, #0x11]
	bx lr
	thumb_func_end ov80_02234770

	thumb_func_start ov80_02234774
ov80_02234774: ; 0x02234774
	push {r4, lr}
	sub sp, #0x30
	add r4, r0, #0
	bl ov80_022347A8
	lsl r1, r0, #0x18
	lsr r1, r1, #0x17
	add r1, r4, r1
	add r1, #0x78
	ldrh r1, [r1]
	add r0, sp, #0
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	add r0, sp, #0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov80_0222A30C
	add sp, #0x30
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02234774

	thumb_func_start ov80_022347A8
ov80_022347A8: ; 0x022347A8
	ldrb r2, [r0, #0x11]
	mov r0, #7
	mul r0, r1
	add r0, r2, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	.balign 4, 0
	thumb_func_end ov80_022347A8

	thumb_func_start ov80_022347B8
ov80_022347B8: ; 0x022347B8
	ldr r3, _022347C0 ; =ov80_02234588
	mov r1, #1
	bx r3
	nop
_022347C0: .word ov80_02234588
	thumb_func_end ov80_022347B8

	thumb_func_start ov80_022347C4
ov80_022347C4: ; 0x022347C4
	add r1, r0, #0
	mov r2, #1
	add r1, #0x2f
	strb r2, [r1]
	ldrh r1, [r0, #0x1a]
	cmp r1, #8
	bhs _022347D6
	add r1, r1, #1
	strh r1, [r0, #0x1a]
_022347D6:
	ldr r3, _022347E0 ; =ov80_02234588
	mov r1, #0
	strb r1, [r0, #0x11]
	bx r3
	nop
_022347E0: .word ov80_02234588
	thumb_func_end ov80_022347C4

	thumb_func_start ov80_022347E4
ov80_022347E4: ; 0x022347E4
	ldr r3, _022347E8 ; =ov80_022383C0
	bx r3
	.balign 4, 0
_022347E8: .word ov80_022383C0
	thumb_func_end ov80_022347E4

	thumb_func_start ov80_022347EC
ov80_022347EC: ; 0x022347EC
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	mov r1, #1
	ldrb r4, [r5, #0x11]
	bl ov80_0223811C
	add r6, r0, #0
	ldrb r0, [r5, #0x10]
	bl ov80_02238374
	mov r3, #0x33
	lsl r3, r3, #4
	add r1, r5, r3
	str r1, [sp]
	add r1, r3, #0
	sub r1, #0x14
	add r1, r5, r1
	str r1, [sp, #4]
	add r1, r3, #0
	sub r1, #0x10
	add r1, r5, r1
	add r2, r4, #7
	str r1, [sp, #8]
	lsl r0, r0, #0x18
	lsl r1, r4, #1
	lsl r2, r2, #1
	lsr r0, r0, #0x18
	add r1, r5, r1
	add r2, r5, r2
	str r0, [sp, #0xc]
	add r1, #0x78
	add r2, #0x78
	sub r3, #0x1c
	ldrh r1, [r1]
	ldrh r2, [r2]
	add r0, r6, #0
	add r3, r5, r3
	bl ov80_0222A6B8
	add r0, r5, #0
	bl ov80_022383C0
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_022347EC

	thumb_func_start ov80_02234848
ov80_02234848: ; 0x02234848
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldrb r0, [r6, #0x10]
	mov r4, #0
	add r7, r1, #0
	str r2, [sp]
	add r1, r4, #0
	add r5, r3, #0
	bl ov80_022380E8
	add r3, r0, #0
	ldr r2, [sp]
	add r0, r6, #0
	add r1, r7, #0
	bl ov80_02234894
	ldr r2, _0223488C ; =ov80_0223BE9E
	add r4, r4, r0
	mov r1, #0
_0223486E:
	ldrb r0, [r2]
	cmp r5, r0
	bge _0223487E
	ldr r0, _02234890 ; =ov80_0223BE9F
	lsl r1, r1, #1
	ldrb r0, [r0, r1]
	add r4, r4, r0
	b _02234886
_0223487E:
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, #5
	blt _0223486E
_02234886:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223488C: .word ov80_0223BE9E
_02234890: .word ov80_0223BE9F
	thumb_func_end ov80_02234848

	thumb_func_start ov80_02234894
ov80_02234894: ; 0x02234894
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r3, [sp, #0xc]
	str r0, [sp]
	mov r4, #0
	ldr r0, [sp, #0xc]
	str r1, [sp, #4]
	str r2, [sp, #8]
	add r5, r4, #0
	add r6, r4, #0
	cmp r0, #0
	ble _022348F2
_022348AC:
	ldr r0, [sp, #4]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0xac
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _022348EA
	add r0, r7, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _022348D6
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_022348D6:
	add r0, r7, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _022348EA
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_022348EA:
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	cmp r6, r0
	blt _022348AC
_022348F2:
	ldr r0, [sp]
	ldrb r0, [r0, #0x10]
	bl ov80_02238374
	cmp r0, #1
	bne _0223494C
	ldr r0, [sp, #0xc]
	mov r6, #0
	cmp r0, #0
	ble _0223494C
_02234906:
	ldr r0, [sp, #8]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0xac
	mov r2, #0
	add r7, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02234944
	add r0, r7, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02234930
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02234930:
	add r0, r7, #0
	mov r1, #0xa0
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	beq _02234944
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_02234944:
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	cmp r6, r0
	blt _02234906
_0223494C:
	ldr r0, _02234960 ; =ov80_0223BE90
	ldrb r1, [r0, r5]
	mov r0, #0
	add r1, r0, r1
	ldr r0, _02234964 ; =ov80_0223BE88
	ldrb r0, [r0, r4]
	add r0, r1, r0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02234960: .word ov80_0223BE90
_02234964: .word ov80_0223BE88
	thumb_func_end ov80_02234894

	thumb_func_start ov80_02234968
ov80_02234968: ; 0x02234968
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldrb r0, [r5, #0x13]
	add r4, r1, #0
	cmp r0, #0x20
	beq _02234A1E
	mov r0, #0xb7
	mov r1, #0x65
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, #0x65
	str r1, [sp, #0xc]
	ldrb r2, [r5, #0x13]
	mov r1, #6
	add r6, r0, #0
	add r3, r2, #0
	mul r3, r1
	ldr r1, _02234A2C ; =ov80_0223BF5A
	ldr r2, [r4]
	ldrh r1, [r1, r3]
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldrb r2, [r5, #0x13]
	mov r1, #6
	add r0, r6, #0
	add r3, r2, #0
	mul r3, r1
	ldr r1, _02234A30 ; =ov80_0223BF5C
	ldr r2, [r4]
	ldrh r1, [r1, r3]
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldrb r2, [r5, #0x13]
	mov r1, #6
	add r0, r6, #0
	add r3, r2, #0
	mul r3, r1
	ldr r1, _02234A34 ; =ov80_0223BF5E
	add r2, sp, #0x10
	ldrh r1, [r1, r3]
	mov r3, #0x65
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	ldr r1, [sp, #0x10]
	add r5, r0, #0
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #8]
	bl DC_FlushRange
	bl GX_BeginLoadBGExtPltt
	ldr r0, [sp, #0x10]
	mov r1, #1
	lsl r1, r1, #0xe
	ldr r0, [r0, #0xc]
	lsr r2, r1, #1
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #4
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r4]
	mov r1, #2
	bl ScheduleBgTilemapBufferTransfer
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
_02234A1E:
	mov r0, #4
	mov r1, #0
	bl GX_EngineAToggleLayers
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_02234A2C: .word ov80_0223BF5A
_02234A30: .word ov80_0223BF5C
_02234A34: .word ov80_0223BF5E
	thumb_func_end ov80_02234968

	thumb_func_start ov80_02234A38
ov80_02234A38: ; 0x02234A38
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r1, #0
	mov r0, #0xb7
	mov r1, #0x65
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, #0x65
	str r1, [sp, #0xc]
	ldr r2, [r5]
	mov r1, #0x39
	mov r3, #3
	add r4, r0, #0
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	ldr r0, [r5]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02234A38

	thumb_func_start ov80_02234A74
ov80_02234A74: ; 0x02234A74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp, #4]
	ldrb r0, [r0, #0x10]
	str r1, [sp, #8]
	mov r1, #1
	add r4, r2, #0
	bl ov80_022380E8
	add r7, r0, #0
	ldr r0, [sp, #4]
	mov r1, #1
	ldrb r0, [r0, #0x10]
	bl ov80_0223811C
	str r0, [sp, #0xc]
	cmp r4, #0
	bne _02234AD8
	mov r4, #0
	cmp r7, #0
	ble _02234B18
	ldr r5, _02234B1C ; =ov80_0223BEB8
	ldr r6, [sp, #4]
_02234AA2:
	ldr r0, [sp, #4]
	add r1, r4, #0
	ldr r0, [r0, #0x70]
	bl GetPartyMonByIndex
	add r1, r0, #0
	mov r0, #2
	ldrsh r0, [r5, r0]
	mov r3, #0
	add r2, r4, #0
	str r0, [sp]
	ldrsh r3, [r5, r3]
	ldr r0, [sp, #8]
	bl ov80_0222F29C
	str r0, [r6, #0x30]
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	add r4, r4, #1
	add r5, r5, #4
	add r6, r6, #4
	cmp r4, r7
	blt _02234AA2
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02234AD8:
	mov r6, #0
	cmp r0, #0
	ble _02234B18
	ldr r4, _02234B20 ; =ov80_0223BEC8
	ldr r5, [sp, #4]
_02234AE2:
	ldr r0, [sp, #4]
	add r1, r6, #0
	ldr r0, [r0, #0x74]
	bl GetPartyMonByIndex
	add r1, r0, #0
	mov r0, #2
	ldrsh r0, [r4, r0]
	mov r3, #0
	add r2, r7, #0
	str r0, [sp]
	ldrsh r3, [r4, r3]
	ldr r0, [sp, #8]
	bl ov80_0222F29C
	str r0, [r5, #0x40]
	ldr r0, [r0]
	mov r1, #0
	bl Set2dSpriteAnimActiveFlag
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	add r4, r4, #4
	add r7, r7, #1
	add r5, r5, #4
	cmp r6, r0
	blt _02234AE2
_02234B18:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02234B1C: .word ov80_0223BEB8
_02234B20: .word ov80_0223BEC8
	thumb_func_end ov80_02234A74

	thumb_func_start ov80_02234B24
ov80_02234B24: ; 0x02234B24
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	add r7, r1, #0
	mov r1, #1
	add r6, r2, #0
	bl ov80_022380E8
	add r4, r0, #0
	ldrb r0, [r5, #0x10]
	mov r1, #1
	bl ov80_0223811C
	str r0, [sp]
	cmp r6, #0
	bne _02234B5E
	mov r6, #0
	cmp r4, #0
	ble _02234B7A
_02234B4A:
	ldr r1, [r5, #0x30]
	add r0, r7, #0
	add r2, r6, #0
	bl ov80_0222F324
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r4
	blt _02234B4A
	pop {r3, r4, r5, r6, r7, pc}
_02234B5E:
	mov r6, #0
	cmp r0, #0
	ble _02234B7A
_02234B64:
	ldr r1, [r5, #0x40]
	add r0, r7, #0
	add r2, r4, #0
	bl ov80_0222F324
	ldr r0, [sp]
	add r6, r6, #1
	add r4, r4, #1
	add r5, r5, #4
	cmp r6, r0
	blt _02234B64
_02234B7A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02234B24

	thumb_func_start ov80_02234B7C
ov80_02234B7C: ; 0x02234B7C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	mov r1, #1
	add r6, r2, #0
	add r4, r3, #0
	bl ov80_022380E8
	cmp r4, r0
	bge _02234BB2
	cmp r6, #1
	bne _02234BA4
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x30]
	mov r1, #1
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
	pop {r4, r5, r6, pc}
_02234BA4:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x30]
	mov r1, #0
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
_02234BB2:
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_02234B7C

	thumb_func_start ov80_02234BB4
ov80_02234BB4: ; 0x02234BB4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	mov r1, #1
	add r6, r2, #0
	add r4, r3, #0
	bl ov80_0223811C
	cmp r4, r0
	bge _02234BEA
	cmp r6, #1
	bne _02234BDC
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x40]
	mov r1, #1
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
	pop {r4, r5, r6, pc}
_02234BDC:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x40]
	mov r1, #0
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
_02234BEA:
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_02234BB4

	thumb_func_start ov80_02234BEC
ov80_02234BEC: ; 0x02234BEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldrb r0, [r7, #0x10]
	str r1, [sp]
	mov r1, #1
	add r4, r2, #0
	bl ov80_022380E8
	str r0, [sp, #8]
	ldrb r0, [r7, #0x10]
	mov r1, #1
	bl ov80_0223811C
	str r0, [sp, #4]
	cmp r4, #0
	bne _02234C5C
	ldr r0, [sp, #8]
	mov r6, #0
	cmp r0, #0
	ble _02234CA4
	ldr r4, _02234CA8 ; =ov80_0223BEB8
	add r5, r7, #0
_02234C1A:
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [sp]
	add r1, #8
	add r2, r2, #4
	bl ov80_0222F3FC
	str r0, [r5, #0x50]
	ldr r0, [r7, #0x70]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02234C4C
	ldr r0, [r5, #0x50]
	mov r1, #0
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
_02234C4C:
	ldr r0, [sp, #8]
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, r0
	blt _02234C1A
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02234C5C:
	mov r6, #0
	cmp r0, #0
	ble _02234CA4
	ldr r4, _02234CAC ; =ov80_0223BEC8
	add r5, r7, #0
_02234C66:
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [sp]
	add r1, #8
	add r2, r2, #4
	bl ov80_0222F3FC
	str r0, [r5, #0x60]
	ldr r0, [r7, #0x74]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02234C98
	ldr r0, [r5, #0x60]
	mov r1, #0
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
_02234C98:
	ldr r0, [sp, #4]
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, r0
	blt _02234C66
_02234CA4:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02234CA8: .word ov80_0223BEB8
_02234CAC: .word ov80_0223BEC8
	thumb_func_end ov80_02234BEC

	thumb_func_start ov80_02234CB0
ov80_02234CB0: ; 0x02234CB0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	add r4, r1, #0
	mov r1, #1
	add r6, r2, #0
	bl ov80_022380E8
	str r0, [sp]
	ldrb r0, [r5, #0x10]
	mov r1, #1
	bl ov80_0223811C
	add r7, r0, #0
	cmp r6, #0
	bne _02234CEC
	ldr r0, [sp]
	mov r6, #0
	cmp r0, #0
	ble _02234D02
_02234CD8:
	ldr r1, [r5, #0x50]
	add r0, r4, #0
	bl ov80_0222F440
	ldr r0, [sp]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _02234CD8
	pop {r3, r4, r5, r6, r7, pc}
_02234CEC:
	mov r6, #0
	cmp r7, #0
	ble _02234D02
_02234CF2:
	ldr r1, [r5, #0x60]
	add r0, r4, #0
	bl ov80_0222F440
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r7
	blt _02234CF2
_02234D02:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02234CB0

	thumb_func_start ov80_02234D04
ov80_02234D04: ; 0x02234D04
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	mov r1, #1
	add r6, r2, #0
	add r4, r3, #0
	bl ov80_022380E8
	add r7, r0, #0
	ldrb r0, [r5, #0x10]
	mov r1, #1
	bl ov80_0223811C
	cmp r6, #0
	bne _02234D72
	cmp r4, r7
	bge _02234DC0
	ldr r0, [r5, #0x70]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	cmp r1, #1
	bne _02234D62
	cmp r0, #0
	bne _02234D52
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x50]
	mov r1, #0
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, r6, r7, pc}
_02234D52:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x50]
	mov r1, #1
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, r6, r7, pc}
_02234D62:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x50]
	mov r1, #0
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, r6, r7, pc}
_02234D72:
	cmp r4, r0
	bge _02234DC0
	ldr r0, [r5, #0x74]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	cmp r1, #1
	bne _02234DB2
	cmp r0, #0
	bne _02234DA2
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x60]
	mov r1, #0
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, r6, r7, pc}
_02234DA2:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x60]
	mov r1, #1
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
	pop {r3, r4, r5, r6, r7, pc}
_02234DB2:
	lsl r0, r4, #2
	add r0, r5, r0
	ldr r0, [r0, #0x60]
	mov r1, #0
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
_02234DC0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02234D04

	thumb_func_start ov80_02234DC4
ov80_02234DC4: ; 0x02234DC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	cmp r1, #0
	bne _02234DD6
	mov r5, #0x1e
	mov r6, #0xa2
	lsl r5, r5, #4
	b _02234DDC
_02234DD6:
	mov r6, #0xa1
	add r5, r6, #0
	add r5, #0x7f
_02234DDC:
	mov r1, #2
	mov r0, #0x65
	lsl r1, r1, #0xc
	bl AllocFromHeap
	mov r2, #2
	mov r1, #0
	lsl r2, r2, #0xc
	add r4, r0, #0
	bl memset
	mov r0, #0xb7
	mov r1, #0x65
	bl NARC_ctor
	add r1, r6, #0
	add r2, sp, #8
	mov r3, #0x65
	str r0, [sp, #4]
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #8]
	mov r2, #1
	ldr r0, [r0, #0xc]
	add r1, r4, #0
	lsl r2, r2, #0xc
	add r3, r7, #0
	bl sub_02003DE8
	mov r1, #2
	add r0, r4, #0
	lsl r1, r1, #0xc
	bl DC_FlushRange
	bl GX_BeginLoadBGExtPltt
	mov r1, #6
	add r0, r4, #0
	lsl r1, r1, #0xc
	add r2, r5, #0
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	ldr r0, [sp, #4]
	bl NARC_dtor
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_02234DC4

	thumb_func_start ov80_02234E50
ov80_02234E50: ; 0x02234E50
	push {r3, lr}
	cmp r1, #5
	bhi _02234E94
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02234E62: ; jump table
	.short _02234E6E - _02234E62 - 2 ; case 0
	.short _02234E74 - _02234E62 - 2 ; case 1
	.short _02234E7A - _02234E62 - 2 ; case 2
	.short _02234E80 - _02234E62 - 2 ; case 3
	.short _02234E88 - _02234E62 - 2 ; case 4
	.short _02234E90 - _02234E62 - 2 ; case 5
_02234E6E:
	bl ov80_0222BA7C
	pop {r3, pc}
_02234E74:
	bl ov80_0222BAE0
	pop {r3, pc}
_02234E7A:
	bl ov80_0222BB54
	pop {r3, pc}
_02234E80:
	add r1, r2, #0
	bl ov80_0222BC48
	pop {r3, pc}
_02234E88:
	add r1, r2, #0
	bl ov80_0222BC94
	pop {r3, pc}
_02234E90:
	bl ov80_0222BCE0
_02234E94:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02234E50

	thumb_func_start ov80_02234E98
ov80_02234E98: ; 0x02234E98
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	cmp r6, #9
	bhs _02234EAE
	ldrb r0, [r5, #0x10]
	mov r1, #1
	ldr r4, [r5, #0x74]
	bl ov80_0223811C
	b _02234EB8
_02234EAE:
	ldrb r0, [r5, #0x10]
	mov r1, #1
	ldr r4, [r5, #0x70]
	bl ov80_022380E8
_02234EB8:
	ldr r3, _02234EC8 ; =ov80_0223DCB8
	add r1, r4, #0
	lsl r4, r6, #2
	add r2, r0, #0
	ldr r3, [r3, r4]
	add r0, r5, #0
	blx r3
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02234EC8: .word ov80_0223DCB8
	thumb_func_end ov80_02234E98

	thumb_func_start ov80_02234ECC
ov80_02234ECC: ; 0x02234ECC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r2, #0
	mov r5, #0
	str r1, [sp]
	cmp r7, #0
	ble _02234F1C
_02234EDA:
	ldr r0, [sp]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0xa4
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	add r4, r0, #0
	bl _dfltu
	add r2, r0, #0
	add r3, r1, #0
	ldr r0, _02234F20 ; =0x33333333
	ldr r1, _02234F24 ; =0x3FF33333
	bl _dmul
	bl _dfixu
	str r0, [sp, #4]
	sub r0, r0, r4
	str r0, [sp, #4]
	sub r0, r4, r0
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0xa3
	add r2, sp, #4
	bl SetMonData
	add r5, r5, #1
	cmp r5, r7
	blt _02234EDA
_02234F1C:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02234F20: .word 0x33333333
_02234F24: .word 0x3FF33333
	thumb_func_end ov80_02234ECC

	thumb_func_start ov80_02234F28
ov80_02234F28: ; 0x02234F28
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r2, [sp, #8]
	str r0, [sp]
	mov r5, #0
	ldr r0, [sp, #8]
	str r1, [sp, #4]
	str r5, [sp, #0xc]
	cmp r0, #0
	ble _02234F98
_02234F3C:
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	cmp r6, #3
	beq _02234F7A
	cmp r7, #3
	beq _02234F7A
	cmp r6, #8
	beq _02234F7A
	cmp r7, #8
	beq _02234F7A
	cmp r0, #0x11
	bne _02234F82
_02234F7A:
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	b _02234F90
_02234F82:
	mov r0, #8
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0xa0
	add r2, sp, #0x10
	bl SetMonData
_02234F90:
	ldr r0, [sp, #8]
	add r5, r5, #1
	cmp r5, r0
	blt _02234F3C
_02234F98:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #8]
	cmp r1, r0
	blt _02234FA6
	ldr r0, [sp]
	mov r1, #1
	strb r1, [r0, #0x1f]
_02234FA6:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02234F28

	thumb_func_start ov80_02234FAC
ov80_02234FAC: ; 0x02234FAC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r2, [sp, #8]
	str r0, [sp]
	mov r6, #0
	ldr r0, [sp, #8]
	add r5, r6, #0
	str r1, [sp, #4]
	cmp r0, #0
	ble _02235012
_02234FC0:
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	cmp r7, #4
	beq _02234FF8
	ldr r1, [sp, #0xc]
	cmp r1, #4
	beq _02234FF8
	cmp r0, #7
	bne _02234FFC
_02234FF8:
	add r6, r6, #1
	b _0223500A
_02234FFC:
	mov r0, #0x40
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0xa0
	add r2, sp, #0x10
	bl SetMonData
_0223500A:
	ldr r0, [sp, #8]
	add r5, r5, #1
	cmp r5, r0
	blt _02234FC0
_02235012:
	ldr r0, [sp, #8]
	cmp r6, r0
	blt _0223501E
	ldr r0, [sp]
	mov r1, #1
	strb r1, [r0, #0x1f]
_0223501E:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02234FAC

	thumb_func_start ov80_02235024
ov80_02235024: ; 0x02235024
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r2, [sp, #8]
	str r0, [sp]
	mov r6, #0
	ldr r0, [sp, #8]
	add r5, r6, #0
	str r1, [sp, #4]
	cmp r0, #0
	ble _0223508A
_02235038:
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	cmp r7, #0xa
	beq _02235070
	ldr r1, [sp, #0xc]
	cmp r1, #0xa
	beq _02235070
	cmp r0, #0x29
	bne _02235074
_02235070:
	add r6, r6, #1
	b _02235082
_02235074:
	mov r0, #0x10
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0xa0
	add r2, sp, #0x10
	bl SetMonData
_02235082:
	ldr r0, [sp, #8]
	add r5, r5, #1
	cmp r5, r0
	blt _02235038
_0223508A:
	ldr r0, [sp, #8]
	cmp r6, r0
	blt _02235096
	ldr r0, [sp]
	mov r1, #1
	strb r1, [r0, #0x1f]
_02235096:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02235024

	thumb_func_start ov80_0223509C
ov80_0223509C: ; 0x0223509C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldrh r0, [r0, #0x20]
	add r5, r2, #0
	str r1, [sp, #4]
	add r1, r5, #0
	mov r6, #0
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	add r7, r6, #0
	cmp r5, #0
	ble _0223510A
_022350BA:
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xa
	mov r2, #0
	str r0, [sp, #8]
	bl GetMonData
	cmp r0, #0xf
	beq _022350D4
	cmp r0, #0x48
	bne _022350E4
_022350D4:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r6, r6, #1
	cmp r4, r5
	blo _02235104
	mov r4, #0
	b _02235104
_022350E4:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	add r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	mov r1, #0xa0
	add r2, sp, #0xc
	bl SetMonData
	b _0223510A
_02235104:
	add r7, r7, #1
	cmp r7, r5
	blt _022350BA
_0223510A:
	cmp r6, r5
	blt _02235114
	ldr r0, [sp]
	mov r1, #1
	strb r1, [r0, #0x1f]
_02235114:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223509C

	thumb_func_start ov80_02235118
ov80_02235118: ; 0x02235118
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	ldrh r0, [r0, #0x20]
	add r6, r2, #0
	str r1, [sp, #4]
	add r1, r6, #0
	mov r7, #0
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r5, r0, #0x18
	add r0, r7, #0
	str r0, [sp, #8]
	cmp r6, #0
	ble _0223519C
_02235138:
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	mov r1, #0xb1
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0xb2
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x10]
	add r0, r4, #0
	mov r1, #0xa
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #0xc]
	cmp r1, #0xf
	beq _02235172
	ldr r1, [sp, #0x10]
	cmp r1, #0xf
	beq _02235172
	cmp r0, #0x28
	bne _02235182
_02235172:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	add r7, r7, #1
	cmp r5, r6
	blo _02235192
	mov r5, #0
	b _02235192
_02235182:
	mov r0, #0x20
	str r0, [sp, #0x14]
	add r0, r4, #0
	mov r1, #0xa0
	add r2, sp, #0x14
	bl SetMonData
	b _0223519C
_02235192:
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	cmp r0, r6
	blt _02235138
_0223519C:
	cmp r7, r6
	blt _022351A6
	ldr r0, [sp]
	mov r1, #1
	strb r1, [r0, #0x1f]
_022351A6:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02235118

	thumb_func_start ov80_022351AC
ov80_022351AC: ; 0x022351AC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	add r5, r2, #0
	bl ov80_02238498
	cmp r0, #3
	bhs _022351C4
	ldr r0, _02235204 ; =ov80_0223DCA0
	mov r1, #8
	ldr r4, [r0]
	b _022351D6
_022351C4:
	cmp r0, #6
	bhs _022351D0
	ldr r0, _02235204 ; =ov80_0223DCA0
	mov r1, #0x14
	ldr r4, [r0, #4]
	b _022351D6
_022351D0:
	ldr r0, _02235204 ; =ov80_0223DCA0
	mov r1, #0xa
	ldr r4, [r0, #8]
_022351D6:
	ldrh r0, [r7, #0x20]
	bl _s32_div_f
	lsl r0, r1, #1
	ldrh r1, [r4, r0]
	add r0, sp, #0
	mov r4, #0
	strh r1, [r0]
	cmp r5, #0
	ble _02235202
	mov r7, #6
_022351EC:
	add r0, r6, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r1, r7, #0
	add r2, sp, #0
	bl SetMonData
	add r4, r4, #1
	cmp r4, r5
	blt _022351EC
_02235202:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02235204: .word ov80_0223DCA0
	thumb_func_end ov80_022351AC

	thumb_func_start ov80_02235208
ov80_02235208: ; 0x02235208
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	add r5, r2, #0
	bl ov80_02238498
	cmp r0, #3
	bhs _02235220
	ldr r0, _02235260 ; =ov80_0223DCA0
	mov r1, #0xb
	ldr r4, [r0, #0xc]
	b _02235232
_02235220:
	cmp r0, #6
	bhs _0223522C
	ldr r0, _02235260 ; =ov80_0223DCA0
	mov r1, #0xd
	ldr r4, [r0, #0x10]
	b _02235232
_0223522C:
	ldr r0, _02235260 ; =ov80_0223DCA0
	mov r1, #0xb
	ldr r4, [r0, #0x14]
_02235232:
	ldrh r0, [r7, #0x20]
	bl _s32_div_f
	lsl r0, r1, #1
	ldrh r1, [r4, r0]
	add r0, sp, #0
	mov r4, #0
	strh r1, [r0]
	cmp r5, #0
	ble _0223525E
	mov r7, #6
_02235248:
	add r0, r6, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	add r1, r7, #0
	add r2, sp, #0
	bl SetMonData
	add r4, r4, #1
	cmp r4, r5
	blt _02235248
_0223525E:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02235260: .word ov80_0223DCA0
	thumb_func_end ov80_02235208

	thumb_func_start ov80_02235264
ov80_02235264: ; 0x02235264
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r2, #0
	mov r4, #0
	str r1, [sp]
	cmp r7, #0
	ble _022352B8
_02235272:
	ldr r0, [sp]
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xa1
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	add r6, r0, #3
	cmp r6, #0x64
	bls _02235290
	bl GF_AssertFail
	mov r6, #0x64
_02235290:
	add r0, r5, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r1, r6, #0
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #8
	add r2, sp, #4
	bl SetMonData
	add r0, r5, #0
	bl CalcMonLevelAndStats
	add r4, r4, #1
	cmp r4, r7
	blt _02235272
_022352B8:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02235264

	thumb_func_start ov80_022352BC
ov80_022352BC: ; 0x022352BC
	ldr r1, _022352C4 ; =0x000003E9
	str r1, [r0, #0x14]
	bx lr
	nop
_022352C4: .word 0x000003E9
	thumb_func_end ov80_022352BC

	thumb_func_start ov80_022352C8
ov80_022352C8: ; 0x022352C8
	mov r1, #1
	str r1, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_022352C8

	thumb_func_start ov80_022352D0
ov80_022352D0: ; 0x022352D0
	mov r1, #7
	str r1, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_022352D0

	thumb_func_start ov80_022352D8
ov80_022352D8: ; 0x022352D8
	mov r1, #4
	str r1, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_022352D8

	thumb_func_start ov80_022352E0
ov80_022352E0: ; 0x022352E0
	mov r1, #9
	str r1, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_022352E0

	thumb_func_start ov80_022352E8
ov80_022352E8: ; 0x022352E8
	ldr r1, _022352F0 ; =0x000003EA
	str r1, [r0, #0x14]
	bx lr
	nop
_022352F0: .word 0x000003EA
	thumb_func_end ov80_022352E8

	thumb_func_start ov80_022352F4
ov80_022352F4: ; 0x022352F4
	ldrb r1, [r0, #0x1c]
	cmp r1, #7
	bhs _022352FE
	add r1, r1, #1
	strb r1, [r0, #0x1c]
_022352FE:
	bx lr
	thumb_func_end ov80_022352F4

	thumb_func_start ov80_02235300
ov80_02235300: ; 0x02235300
	ldrb r1, [r0, #0x1c]
	cmp r1, #0
	beq _0223530A
	sub r1, r1, #1
	strb r1, [r0, #0x1c]
_0223530A:
	bx lr
	thumb_func_end ov80_02235300

	thumb_func_start ov80_0223530C
ov80_0223530C: ; 0x0223530C
	mov r1, #1
	strb r1, [r0, #0x12]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0223530C

	thumb_func_start ov80_02235314
ov80_02235314: ; 0x02235314
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02235314

	thumb_func_start ov80_02235318
ov80_02235318: ; 0x02235318
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02235318

	thumb_func_start ov80_0223531C
ov80_0223531C: ; 0x0223531C
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0223531C

	thumb_func_start ov80_02235320
ov80_02235320: ; 0x02235320
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02235320

	thumb_func_start ov80_02235324
ov80_02235324: ; 0x02235324
	ldrb r3, [r0, #0x10]
	ldrh r2, [r0, #0x1a]
	cmp r3, #1
	bhi _0223533A
	cmp r2, #8
	blo _02235334
	mov r1, #6
	b _02235346
_02235334:
	ldr r1, _0223535C ; =ov80_0223C01C
	ldrb r1, [r1, r2]
	b _02235346
_0223533A:
	cmp r2, #8
	blo _02235342
	mov r1, #0x11
	b _02235346
_02235342:
	ldr r1, _02235360 ; =ov80_0223C028
	ldrb r1, [r1, r2]
_02235346:
	cmp r3, #0
	bne _02235356
	ldrh r0, [r0, #0x18]
	cmp r0, #0x15
	beq _02235354
	cmp r0, #0x31
	bne _02235356
_02235354:
	mov r1, #0x14
_02235356:
	add r0, r1, #0
	bx lr
	nop
_0223535C: .word ov80_0223C01C
_02235360: .word ov80_0223C028
	thumb_func_end ov80_02235324

	thumb_func_start ov80_02235364
ov80_02235364: ; 0x02235364
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r1, r2, #0
	add r4, r3, #0
	bl GetPartyMonByIndex
	mov r1, #6
	mov r2, #0
	bl GetMonData
	add r1, sp, #0
	strh r0, [r1]
	add r0, r5, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #6
	add r2, sp, #0
	bl SetMonData
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02235364

	thumb_func_start ov80_02235390
ov80_02235390: ; 0x02235390
	push {r3, lr}
	bl ov80_0222BE10
	bl PlaySE
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02235390

	thumb_func_start ov80_022353A0
ov80_022353A0: ; 0x022353A0
	push {r3, lr}
	bl ov80_0222BE10
	mov r1, #0
	bl StopSE
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_022353A0

	thumb_func_start ov80_022353B0
ov80_022353B0: ; 0x022353B0
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222BE10
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _022353CC ; =ov80_022353D0
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_022353CC: .word ov80_022353D0
	thumb_func_end ov80_022353B0

	thumb_func_start ov80_022353D0
ov80_022353D0: ; 0x022353D0
	push {r3, lr}
	add r0, #0x78
	ldrh r0, [r0]
	bl IsSEPlaying
	cmp r0, #0
	bne _022353E2
	mov r0, #1
	pop {r3, pc}
_022353E2:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_022353D0

	thumb_func_start ov80_022353E8
ov80_022353E8: ; 0x022353E8
	push {r3, lr}
	bl ov80_0222AC58
	bl PlayFanfare
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_022353E8

	thumb_func_start ov80_022353F8
ov80_022353F8: ; 0x022353F8
	push {r3, lr}
	ldr r1, _02235404 ; =ov80_02235408
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02235404: .word ov80_02235408
	thumb_func_end ov80_022353F8

	thumb_func_start ov80_02235408
ov80_02235408: ; 0x02235408
	push {r3, lr}
	bl IsFanfarePlaying
	cmp r0, #0
	bne _02235416
	mov r0, #1
	pop {r3, pc}
_02235416:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02235408

	thumb_func_start ov80_0223541C
ov80_0223541C: ; 0x0223541C
	push {r4, lr}
	bl ov80_0222AC58
	add r4, r0, #0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_02004AC8
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl PlayBGM
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0223541C

	thumb_func_start ov80_02235438
ov80_02235438: ; 0x02235438
	push {r3, lr}
	bl ov80_0222AC58
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov80_02235438

	thumb_func_start ov80_0223544C
ov80_0223544C: ; 0x0223544C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl sub_02096808
	add r5, r0, #0
	add r0, r7, #0
	bl ov80_0222AC58
	add r6, r0, #0
	add r0, r7, #0
	bl ov80_0222BE10
	str r0, [sp]
	add r0, r7, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl sub_02096810
	cmp r6, #0x3b
	bgt _022354CC
	add r1, r6, #0
	sub r1, #0x21
	bmi _022354C6
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02235490: ; jump table
	.short _022354FC - _02235490 - 2 ; case 0
	.short _02235504 - _02235490 - 2 ; case 1
	.short _0223550C - _02235490 - 2 ; case 2
	.short _02235514 - _02235490 - 2 ; case 3
	.short _0223553E - _02235490 - 2 ; case 4
	.short _02235546 - _02235490 - 2 ; case 5
	.short _0223554E - _02235490 - 2 ; case 6
	.short _02235524 - _02235490 - 2 ; case 7
	.short _0223552C - _02235490 - 2 ; case 8
	.short _0223557A - _02235490 - 2 ; case 9
	.short _0223551C - _02235490 - 2 ; case 10
	.short _02235536 - _02235490 - 2 ; case 11
	.short _0223557A - _02235490 - 2 ; case 12
	.short _022354D8 - _02235490 - 2 ; case 13
	.short _0223557A - _02235490 - 2 ; case 14
	.short _0223557A - _02235490 - 2 ; case 15
	.short _0223557A - _02235490 - 2 ; case 16
	.short _0223557A - _02235490 - 2 ; case 17
	.short _0223557A - _02235490 - 2 ; case 18
	.short _0223557A - _02235490 - 2 ; case 19
	.short _0223557A - _02235490 - 2 ; case 20
	.short _0223557A - _02235490 - 2 ; case 21
	.short _022354EE - _02235490 - 2 ; case 22
	.short _0223557A - _02235490 - 2 ; case 23
	.short _0223557A - _02235490 - 2 ; case 24
	.short _02235554 - _02235490 - 2 ; case 25
	.short _02235562 - _02235490 - 2 ; case 26
_022354C6:
	cmp r6, #2
	beq _022354D2
	b _0223557A
_022354CC:
	cmp r6, #0x64
	beq _0223556A
	b _0223557A
_022354D2:
	bl sub_0204A68C
	b _0223557E
_022354D8:
	bl sub_0204B068
	strh r0, [r4]
	ldr r0, [r5, #8]
	bl Sav2_GameStats_get
	ldrh r2, [r4]
	mov r1, #0x45
	bl GameStats_Add
	b _0223557E
_022354EE:
	ldr r1, [sp]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov80_0223558C
	strh r0, [r4]
	b _0223557E
_022354FC:
	bl sub_0204AC78
	strh r0, [r4]
	b _0223557E
_02235504:
	bl ov80_022358C4
	strh r0, [r4]
	b _0223557E
_0223550C:
	bl sub_0204AC7C
	strh r0, [r4]
	b _0223557E
_02235514:
	bl ov80_022358E8
	strh r0, [r4]
	b _0223557E
_0223551C:
	bl sub_0204B05C
	strh r0, [r4]
	b _0223557E
_02235524:
	ldr r1, [r5, #8]
	bl ov80_022357B4
	b _0223557E
_0223552C:
	ldr r1, [sp]
	bl ov80_02235898
	strh r0, [r4]
	b _0223557E
_02235536:
	ldr r1, [sp]
	bl ov80_022358B0
	b _0223557E
_0223553E:
	ldr r1, [r5, #8]
	bl sub_0204AD04
	b _0223557E
_02235546:
	ldr r1, [r5, #8]
	bl sub_0204AE20
	b _0223557E
_0223554E:
	bl sub_0204AF2C
	b _0223557E
_02235554:
	ldr r1, _02235584 ; =0x00000884
	mov r2, #0x46
	add r0, r0, r1
	mov r1, #0
	bl MI_CpuFill8
	b _0223557E
_02235562:
	ldr r1, _02235588 ; =0x000008D6
	mov r2, #1
	strb r2, [r0, r1]
	b _0223557E
_0223556A:
	cmp r0, #0
	bne _02235574
	mov r0, #1
	strh r0, [r4]
	b _0223557E
_02235574:
	mov r0, #0
	strh r0, [r4]
	b _0223557E
_0223557A:
	bl GF_AssertFail
_0223557E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02235584: .word 0x00000884
_02235588: .word 0x000008D6
	thumb_func_end ov80_0223544C

	thumb_func_start ov80_0223558C
ov80_0223558C: ; 0x0223558C
	cmp r1, #2
	bne _02235598
	ldrb r0, [r0, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1d
	bx lr
_02235598:
	cmp r1, #1
	bne _022355BE
	ldrb r1, [r0, #0xf]
	cmp r1, #2
	bne _022355B0
	ldrb r0, [r0, #0x10]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1d
	lsl r1, r0, #1
	ldr r0, _022355CC ; =ov80_0223C034
	ldrh r0, [r0, r1]
	bx lr
_022355B0:
	ldrb r0, [r0, #0x12]
	cmp r0, #0
	beq _022355BA
	mov r0, #0x61
	bx lr
_022355BA:
	mov r0, #0
	bx lr
_022355BE:
	ldrb r0, [r0, #0x11]
	cmp r0, #0
	beq _022355C8
	mov r0, #0x61
	bx lr
_022355C8:
	mov r0, #0
	bx lr
	.balign 4, 0
_022355CC: .word ov80_0223C034
	thumb_func_end ov80_0223558C

	thumb_func_start ov80_022355D0
ov80_022355D0: ; 0x022355D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r1, [r5, #0x1c]
	add r0, r1, #1
	str r0, [r5, #0x1c]
	ldr r0, [r5]
	ldrb r6, [r1]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	bne _022355F4
	mov r0, #0
	pop {r4, r5, r6, pc}
_022355F4:
	ldrb r0, [r4, #0xf]
	bl ov80_02236B18
	lsl r1, r6, #4
	add r1, r6, r1
	add r2, r0, #0
	add r4, #0x90
	lsl r1, r1, #4
	add r0, r5, #0
	add r1, r4, r1
	bl ov80_0222F458
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_022355D0

	thumb_func_start ov80_02235610
ov80_02235610: ; 0x02235610
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl sub_0204AA2C
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02235610

	thumb_func_start ov80_02235624
ov80_02235624: ; 0x02235624
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
	bl ov80_0223690C
	add r6, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #4
	str r6, [r4, r0]
	ldr r1, _0223566C ; =0x0000045D
	mov r0, #5
	mov r2, #1
	bl sub_02004EC4
	mov r3, #0
	str r3, [sp]
	ldr r0, [r5]
	ldr r1, _02235670 ; =_020FA484
	ldr r0, [r0]
	add r2, r6, #0
	bl sub_02096820
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0223566C: .word 0x0000045D
_02235670: .word _020FA484
	thumb_func_end ov80_02235624

	thumb_func_start ov80_02235674
ov80_02235674: ; 0x02235674
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r6, r0, #0
	mov r0, #0x8d
	lsl r0, r0, #4
	ldr r5, [r4, r0]
	ldr r0, [r5, #0x14]
	bl IsBattleResultWin
	ldr r1, _022356A8 ; =0x000008CC
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	strh r0, [r6]
	add r0, r5, #0
	bl sub_02051BF8
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022356A8: .word 0x000008CC
	thumb_func_end ov80_02235674

	thumb_func_start ov80_022356AC
ov80_022356AC: ; 0x022356AC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	add r0, r4, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r4, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r4, #0
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	cmp r6, #2
	bne _022356E6
	add r1, r7, #0
	bl ov80_02236ABC
	b _022356EA
_022356E6:
	bl GF_AssertFail
_022356EA:
	bl sub_0203769C
	ldr r1, _0223570C ; =0x0000083E
	add r1, r4, r1
	bl sub_02037C0C
	cmp r0, #1
	bne _02235700
	mov r0, #1
	strh r0, [r5]
	b _02235708
_02235700:
	mov r0, #0
	strh r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02235708:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223570C: .word 0x0000083E
	thumb_func_end ov80_022356AC

	thumb_func_start ov80_02235710
ov80_02235710: ; 0x02235710
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222AC58
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222AC58
	add r1, r5, #0
	add r1, #0x78
	strh r4, [r1]
	add r1, r5, #0
	add r1, #0x7a
	strh r0, [r1]
	ldr r1, _02235738 ; =ov80_0223573C
	add r0, r5, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02235738: .word ov80_0223573C
	thumb_func_end ov80_02235710

	thumb_func_start ov80_0223573C
ov80_0223573C: ; 0x0223573C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x7a
	ldrh r0, [r0]
	str r0, [sp]
	add r0, r5, #0
	add r5, #0x78
	ldrh r3, [r5]
	ldr r2, [r4, #8]
	bl ov80_02235774
	cmp r0, #1
	bne _02235770
	mov r0, #1
	pop {r3, r4, r5, pc}
_02235770:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223573C

	thumb_func_start ov80_02235774
ov80_02235774: ; 0x02235774
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r6, r1, #0
	add r5, r3, #0
	bl sub_0203769C
	mov r1, #1
	sub r0, r1, r0
	bl sub_02037C44
	add r7, r0, #0
	bne _02235790
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02235790:
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	add r0, r4, #0
	bl ov80_0222BE24
	add r4, r0, #0
	cmp r5, #2
	bne _022357AC
	add r0, r6, #0
	add r1, r7, #0
	bl ov80_02236AD8
	strh r0, [r4]
	b _022357B0
_022357AC:
	bl GF_AssertFail
_022357B0:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02235774

	thumb_func_start ov80_022357B4
ov80_022357B4: ; 0x022357B4
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldrb r2, [r4, #0xf]
	cmp r2, #6
	bhi _02235870
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_022357CC: ; jump table
	.short _02235870 - _022357CC - 2 ; case 0
	.short _02235870 - _022357CC - 2 ; case 1
	.short _022357F0 - _022357CC - 2 ; case 2
	.short _022357F0 - _022357CC - 2 ; case 3
	.short _022357DA - _022357CC - 2 ; case 4
	.short _022357DA - _022357CC - 2 ; case 5
	.short _022357F0 - _022357CC - 2 ; case 6
_022357DA:
	ldrb r2, [r4, #0xc]
	add r0, r1, #0
	add r1, r4, #0
	sub r2, r2, #1
	lsl r2, r2, #0x18
	add r1, #0x78
	lsr r2, r2, #0x18
	bl ov80_02236698
	add sp, #0x18
	pop {r4, r5, r6, pc}
_022357F0:
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	ldr r1, [r4, #4]
	str r1, [sp, #0xc]
	ldrb r2, [r4, #0xc]
	add r1, r4, #0
	ldrb r3, [r4, #0xe]
	sub r2, r2, #1
	lsl r2, r2, #2
	add r2, r4, r2
	ldrh r2, [r2, #0x3e]
	add r1, #0x78
	bl ov80_02236450
	ldrb r3, [r4, #0xe]
	mov r0, #0
	cmp r3, #0
	ble _02235842
	add r1, r4, #0
	add r1, #0xa8
	add r2, sp, #0x14
	add r5, r4, #0
	add r6, sp, #0x10
_02235822:
	ldrh r3, [r1]
	add r0, r0, #1
	add r1, #0x38
	lsl r3, r3, #0x15
	lsr r3, r3, #0x15
	strh r3, [r2]
	add r3, r5, #0
	add r3, #0xaa
	ldrh r3, [r3]
	add r2, r2, #2
	add r5, #0x38
	strh r3, [r6]
	ldrb r3, [r4, #0xe]
	add r6, r6, #2
	cmp r0, r3
	blt _02235822
_02235842:
	add r0, sp, #0x14
	str r0, [sp]
	add r0, sp, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	mov r1, #0x62
	str r0, [sp, #0xc]
	ldrb r2, [r4, #0xc]
	lsl r1, r1, #2
	add r0, r4, #0
	sub r2, r2, #1
	lsl r2, r2, #1
	add r2, r2, #1
	lsl r2, r2, #1
	add r2, r4, r2
	ldrh r2, [r2, #0x3e]
	add r1, r4, r1
	bl ov80_02236450
	add sp, #0x18
	pop {r4, r5, r6, pc}
_02235870:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	add r1, r4, #0
	str r0, [sp, #0xc]
	ldrb r2, [r4, #0xc]
	ldrb r3, [r4, #0xe]
	add r0, r4, #0
	sub r2, r2, #1
	lsl r2, r2, #1
	add r2, r4, r2
	ldrh r2, [r2, #0x3e]
	add r1, #0x78
	bl ov80_02236450
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_022357B4

	thumb_func_start ov80_02235898
ov80_02235898: ; 0x02235898
	lsl r2, r1, #4
	add r1, r1, r2
	lsl r1, r1, #4
	add r0, r0, r1
	add r0, #0x7c
	ldrh r0, [r0]
	ldr r3, _022358AC ; =ov80_0222A30C
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx r3
	.balign 4, 0
_022358AC: .word ov80_0222A30C
	thumb_func_end ov80_02235898

	thumb_func_start ov80_022358B0
ov80_022358B0: ; 0x022358B0
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1e
	ldrb r3, [r0, #0x10]
	mov r2, #6
	lsr r1, r1, #0x1d
	bic r3, r2
	orr r1, r3
	strb r1, [r0, #0x10]
	bx lr
	thumb_func_end ov80_022358B0

	thumb_func_start ov80_022358C4
ov80_022358C4: ; 0x022358C4
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xd]
	add r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xf]
	cmp r0, #6
	beq _022358DC
	ldr r0, [r4, #8]
	bl sub_020674A4
	str r0, [r4, #8]
_022358DC:
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0xc]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_022358C4

	thumb_func_start ov80_022358E8
ov80_022358E8: ; 0x022358E8
	ldrb r1, [r0, #0xd]
	ldrh r0, [r0, #0x1a]
	add r1, r0, r1
	ldr r0, _022358FC ; =0x0000FFFF
	cmp r1, r0
	bhi _022358F8
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
_022358F8:
	bx lr
	nop
_022358FC: .word 0x0000FFFF
	thumb_func_end ov80_022358E8

	thumb_func_start ov80_02235900
ov80_02235900: ; 0x02235900
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096808
	ldr r0, [r0, #8]
	bl ov80_02235FC8
	add r1, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096818
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_02235900

	thumb_func_start ov80_02235920
ov80_02235920: ; 0x02235920
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl ov80_02235FEC
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02235920

	thumb_func_start ov80_02235934
ov80_02235934: ; 0x02235934
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222BE10
	str r0, [sp]
	add r0, r5, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	ldr r3, [sp]
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_02235FF8
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02235934

	thumb_func_start ov80_02235970
ov80_02235970: ; 0x02235970
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _0223598C ; =ov80_02235990
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_0223598C: .word ov80_02235990
	thumb_func_end ov80_02235970

	thumb_func_start ov80_02235990
ov80_02235990: ; 0x02235990
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r0, #0
	add r1, #0x6f
	ldrb r1, [r1]
	cmp r1, #2
	blo _022359AE
	mov r1, #0
	add r0, #0x6f
	strb r1, [r0]
	mov r0, #1
	pop {r3, pc}
_022359AE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02235990

	thumb_func_start ov80_022359B4
ov80_022359B4: ; 0x022359B4
	push {r4, lr}
	add r4, r0, #0
	bl ov80_0222AC58
	add r1, r4, #0
	add r1, #0x78
	strh r0, [r1]
	ldr r1, _022359D0 ; =ov80_022359D4
	add r0, r4, #0
	bl ov80_0222AB84
	mov r0, #1
	pop {r4, pc}
	nop
_022359D0: .word ov80_022359D4
	thumb_func_end ov80_022359B4

	thumb_func_start ov80_022359D4
ov80_022359D4: ; 0x022359D4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_02096810
	add r1, r0, #0
	add r1, #0x6f
	ldrb r1, [r1]
	cmp r1, #2
	blo _022359F4
	mov r1, #0
	add r0, #0x6f
	strb r1, [r0]
	mov r0, #1
	pop {r4, pc}
_022359F4:
	bl sub_0203769C
	mov r1, #1
	eor r0, r1
	bl sub_02037B5C
	cmp r0, #0xaf
	bne _02235A0E
	ldr r1, [r4]
	mov r0, #1
	add r1, #0x39
	strb r0, [r1]
	pop {r4, pc}
_02235A0E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_022359D4

	thumb_func_start ov80_02235A14
ov80_02235A14: ; 0x02235A14
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r6, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r0, #0x6e
	ldrb r0, [r0]
	cmp r6, r0
	bne _02235A3A
	mov r0, #1
	b _02235A3C
_02235A3A:
	mov r0, #0
_02235A3C:
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_02235A14

	thumb_func_start ov80_02235A44
ov80_02235A44: ; 0x02235A44
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov80_0222BE10
	add r0, r5, #0
	bl ov80_0222BE10
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	ldr r1, [r0, #0x24]
	add r0, r4, #0
	add r0, #0x98
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xb0
	str r6, [r0]
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0]
	add r2, r7, #0
	bl ov80_02236040
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02235A44

	thumb_func_start ov80_02235A8C
ov80_02235A8C: ; 0x02235A8C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	add r0, r5, #0
	bl ov80_0222BDF4
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r5, r0, #0
	add r0, #0xa8
	ldr r1, [r0]
	add r0, r1, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #7
	bne _02235ACC
	mov r0, #0xff
	mov r2, #0
	strh r0, [r4]
	add r1, r2, #0
_02235ABE:
	add r0, r5, r2
	add r0, #0xa1
	add r2, r2, #1
	strb r1, [r0]
	cmp r2, #2
	blt _02235ABE
	b _02235AF2
_02235ACC:
	cmp r0, #6
	bne _02235AF2
	add r1, #0x30
	ldrb r0, [r1]
	strh r0, [r4]
	ldrh r0, [r4]
	sub r0, r0, #1
	strh r0, [r4]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r0, #0x31
	ldrb r0, [r0]
	strh r0, [r6]
	ldrh r0, [r6]
	cmp r0, #0
	beq _02235AF2
	sub r0, r0, #1
	strh r0, [r6]
_02235AF2:
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl FreeToHeap
	mov r0, #0
	add r5, #0xa8
	str r0, [r5]
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_02235A8C

	thumb_func_start ov80_02235B04
ov80_02235B04: ; 0x02235B04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r0, #0x59
	ldrb r0, [r0]
	strh r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02235B04

	thumb_func_start ov80_02235B20
ov80_02235B20: ; 0x02235B20
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r1, [r7, #0x1c]
	add r2, r1, #1
	str r2, [r7, #0x1c]
	ldrb r1, [r1]
	str r1, [sp]
	add r1, r2, #1
	str r1, [r7, #0x1c]
	ldrb r6, [r2]
	add r1, r1, #1
	str r1, [r7, #0x1c]
	bl ov80_0222BDF4
	add r5, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl sub_02096810
	add r4, r0, #0
	ldr r0, [r7]
	ldr r0, [r0]
	bl sub_02096808
	add r7, r0, #0
	ldr r0, [sp]
	cmp r0, #0xd
	bhi _02235BD0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02235B64: ; jump table
	.short _02235B80 - _02235B64 - 2 ; case 0
	.short _02235B88 - _02235B64 - 2 ; case 1
	.short _02235B90 - _02235B64 - 2 ; case 2
	.short _02235C44 - _02235B64 - 2 ; case 3
	.short _02235C60 - _02235B64 - 2 ; case 4
	.short _02235C88 - _02235B64 - 2 ; case 5
	.short _02235C94 - _02235B64 - 2 ; case 6
	.short _02235CA6 - _02235B64 - 2 ; case 7
	.short _02235CAC - _02235B64 - 2 ; case 8
	.short _02235CB4 - _02235B64 - 2 ; case 9
	.short _02235CBC - _02235B64 - 2 ; case 10
	.short _02235CC4 - _02235B64 - 2 ; case 11
	.short _02235D3E - _02235B64 - 2 ; case 12
	.short _02235E6C - _02235B64 - 2 ; case 13
_02235B80:
	add r0, r4, #0
	bl sub_02096910
	b _02235E80
_02235B88:
	add r4, #0x86
	ldrh r0, [r4]
	strh r0, [r5]
	b _02235E80
_02235B90:
	cmp r6, #1
	bne _02235BDA
	mov r0, #0
	strh r0, [r5]
	add r0, r4, #0
	add r0, #0x76
	ldrh r1, [r0]
	add r0, r4, #0
	add r0, #0x86
	ldrh r0, [r0]
	cmp r1, r0
	beq _02235BB2
	add r0, r4, #0
	add r0, #0x88
	ldrh r0, [r0]
	cmp r1, r0
	bne _02235BB8
_02235BB2:
	ldrh r0, [r5]
	add r0, r0, #1
	strh r0, [r5]
_02235BB8:
	add r0, r4, #0
	add r0, #0x78
	ldrh r1, [r0]
	add r0, r4, #0
	add r0, #0x86
	ldrh r0, [r0]
	cmp r1, r0
	beq _02235BD2
	add r4, #0x88
	ldrh r0, [r4]
	cmp r1, r0
	beq _02235BD2
_02235BD0:
	b _02235E80
_02235BD2:
	ldrh r0, [r5]
	add r0, r0, #2
	strh r0, [r5]
	b _02235E80
_02235BDA:
	cmp r6, #5
	bne _02235BF8
	add r0, r4, #0
	add r0, #0x76
	add r4, #0x86
	ldrh r1, [r0]
	ldrh r0, [r4]
	cmp r1, r0
	bne _02235BF2
	mov r0, #0
	strh r0, [r5]
	b _02235E80
_02235BF2:
	mov r0, #1
	strh r0, [r5]
	b _02235E80
_02235BF8:
	cmp r6, #4
	beq _02235C00
	cmp r6, #6
	bne _02235CF6
_02235C00:
	mov r0, #0
	strh r0, [r5]
	add r0, r4, #0
	add r0, #0x76
	ldrh r1, [r0]
	add r0, r4, #0
	add r0, #0x86
	ldrh r0, [r0]
	cmp r1, r0
	beq _02235C1E
	add r0, r4, #0
	add r0, #0x88
	ldrh r0, [r0]
	cmp r1, r0
	bne _02235C24
_02235C1E:
	ldrh r0, [r5]
	add r0, r0, #1
	strh r0, [r5]
_02235C24:
	add r0, r4, #0
	add r0, #0x78
	ldrh r1, [r0]
	add r0, r4, #0
	add r0, #0x86
	ldrh r0, [r0]
	cmp r1, r0
	beq _02235C3C
	add r4, #0x88
	ldrh r0, [r4]
	cmp r1, r0
	bne _02235CF6
_02235C3C:
	ldrh r0, [r5]
	add r0, r0, #2
	strh r0, [r5]
	b _02235E80
_02235C44:
	ldr r0, [r7, #8]
	bl sub_0203107C
	add r4, r0, #0
	mov r0, #0x6a
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x6a
	bl sub_020310BC
	strh r0, [r5]
	b _02235E80
_02235C60:
	ldr r0, [r7, #8]
	bl sub_0203107C
	add r4, r0, #0
	mov r0, #3
	bl sub_0205C11C
	add r6, r0, #0
	mov r0, #3
	bl sub_0205C11C
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl sub_020310BC
	strh r0, [r5]
	b _02235E80
_02235C88:
	lsl r0, r6, #1
	add r0, r4, r0
	add r0, #0x76
	ldrh r0, [r0]
	strh r0, [r5]
	b _02235E80
_02235C94:
	ldr r0, [r7, #8]
	bl sub_02030C5C
	add r1, r0, #0
	ldr r0, [r7, #8]
	mov r2, #3
	bl sub_0204F878
	b _02235E80
_02235CA6:
	add r4, #0xa0
	strb r6, [r4]
	b _02235E80
_02235CAC:
	add r4, #0x74
	ldrh r0, [r4]
	strh r0, [r5]
	b _02235E80
_02235CB4:
	add r4, #0xa0
	ldrb r0, [r4]
	strh r0, [r5]
	b _02235E80
_02235CBC:
	add r4, #0x71
	ldrb r0, [r4]
	strh r0, [r5]
	b _02235E80
_02235CC4:
	mov r0, #1
	strh r0, [r5]
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	bl ov80_022385D8
	add r6, r0, #0
	ldr r0, [r4]
	bl sub_0203107C
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl sub_020310BC
	add r1, r4, #0
	add r1, #0x72
	ldrh r1, [r1]
	cmp r0, r1
	bne _02235CF8
_02235CF6:
	b _02235E80
_02235CF8:
	ldr r0, [r4]
	bl sub_0203107C
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	mov r3, #0
	bl sub_02031108
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	bl ov80_02238610
	add r6, r0, #0
	ldr r0, [r4]
	bl sub_0203107C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl sub_02031108
	mov r0, #0
	strh r0, [r5]
	b _02235E80
_02235D3E:
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	bl ov80_02238610
	add r6, r0, #0
	ldr r0, [r4]
	bl sub_0203107C
	add r7, r0, #0
	add r0, r6, #0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl sub_020310BC
	strh r0, [r5]
	ldrh r0, [r5]
	cmp r0, #0
	bne _02235E50
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	bl ov80_022385D8
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_0203107C
	add r6, r0, #0
	add r0, r5, #0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	mov r3, #0
	bl sub_02031108
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #1
	bne _02235DA8
	ldr r0, [r4]
	bl Save_FrontierData_get
	mov r1, #6
	mov r2, #2
	bl sub_0202D57C
_02235DA8:
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #4
	bne _02235DE6
	ldr r0, [r4]
	bl sub_0203107C
	add r5, r0, #0
	mov r0, #0x88
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0x88
	mov r3, #0
	bl sub_02031108
	ldr r0, [r4]
	bl sub_0203107C
	add r5, r0, #0
	mov r0, #0x89
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	mov r1, #0x89
	mov r3, #0
	bl sub_02031108
_02235DE6:
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #2
	bne _02235E1A
	ldr r0, [r4]
	bl sub_0203107C
	add r5, r0, #0
	mov r0, #0
	mov r1, #3
	bl sub_0205C048
	add r6, r0, #0
	mov r0, #0
	mov r1, #3
	bl sub_0205C048
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #0
	bl sub_02031108
_02235E1A:
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #3
	bne _02235E80
	ldr r0, [r4]
	bl sub_0203107C
	add r5, r0, #0
	mov r0, #1
	mov r1, #3
	bl sub_0205C048
	add r4, r0, #0
	mov r0, #1
	mov r1, #3
	bl sub_0205C048
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	mov r3, #0
	bl sub_02031108
	b _02235E80
_02235E50:
	ldr r0, [r4]
	bl sub_0203107C
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r3, #0
	bl sub_02031108
	b _02235E80
_02235E6C:
	mov r2, #0
	add r1, r2, #0
_02235E70:
	add r0, r4, r2
	add r0, #0xa1
	add r2, r2, #1
	strb r1, [r0]
	cmp r2, #2
	blt _02235E70
	add r4, #0x9f
	strb r1, [r4]
_02235E80:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02235B20

	thumb_func_start ov80_02235E84
ov80_02235E84: ; 0x02235E84
	push {r4, r5, r6, r7, lr}
	sub sp, #0xb4
	add r5, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096808
	add r7, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	add r6, r0, #0
	add r4, r6, #0
	add r3, sp, #0
	mov r2, #0x16
_02235EA4:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02235EA4
	ldr r0, [r4]
	str r0, [r3]
	add r0, r6, #0
	bl ov80_02235FEC
	ldr r0, [r7, #8]
	mov r1, #0
	mov r2, #6
	bl sub_0204A824
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	ldr r0, [r0]
	bl sub_02096818
	ldrb r0, [r4, #0xf]
	cmp r0, #6
	bne _02235ED8
	ldr r0, [r7, #8]
	bl ov80_0222A840
_02235ED8:
	ldrb r0, [r4, #0xe]
	mov r2, #0
	cmp r0, #0
	ble _02235F10
	add r3, sp, #0
	add r5, r3, #0
	add r6, r4, #0
_02235EE6:
	add r0, r3, #0
	add r0, #0x6a
	ldrb r1, [r0]
	add r0, r4, r2
	add r0, #0x2a
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x76
	ldrh r0, [r0]
	add r2, r2, #1
	add r3, r3, #1
	strh r0, [r6, #0x2e]
	add r0, r5, #0
	add r0, #0x7e
	ldrh r0, [r0]
	add r5, r5, #2
	strh r0, [r6, #0x36]
	ldrb r0, [r4, #0xe]
	add r6, r6, #2
	cmp r2, r0
	blt _02235EE6
_02235F10:
	add r0, sp, #0x80
	ldrh r1, [r0, #6]
	strh r1, [r4, #0x16]
	ldrh r0, [r0, #8]
	mov r1, #0xe0
	strh r0, [r4, #0x18]
	add r0, sp, #0x40
	ldrb r2, [r0, #0x18]
	strb r2, [r4, #0x12]
	ldrb r0, [r4, #0x10]
	bic r0, r1
	add r1, r2, #5
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x18
	orr r0, r1
	strb r0, [r4, #0x10]
	bl sub_0203769C
	cmp r0, #0
	bne _02235F44
	ldr r1, [r7, #8]
	add r0, r4, #0
	bl sub_0204ABC8
_02235F44:
	ldr r0, [r7, #8]
	bl SavArray_PlayerParty_get
	bl HealParty
	add r0, r4, #0
	bl sub_02096910
	ldr r1, _02235F60 ; =0x000008D4
	mov r0, #0
	strb r0, [r4, r1]
	add sp, #0xb4
	pop {r4, r5, r6, r7, pc}
	nop
_02235F60: .word 0x000008D4
	thumb_func_end ov80_02235E84

	thumb_func_start ov80_02235F64
ov80_02235F64: ; 0x02235F64
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0222BDF4
	add r4, r0, #0
	ldr r0, [r5]
	ldr r0, [r0]
	bl sub_02096810
	bl sub_02096998
	strh r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02235F64

	thumb_func_start ov80_02235F80
ov80_02235F80: ; 0x02235F80
	push {r3, lr}
	ldr r1, _02235F8C ; =ov80_02235F90
	bl ov80_0222AB84
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02235F8C: .word ov80_02235F90
	thumb_func_end ov80_02235F80

	thumb_func_start ov80_02235F90
ov80_02235F90: ; 0x02235F90
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	ldr r1, _02235FB0 ; =0x000008D4
	ldrb r2, [r0, r1]
	cmp r2, #2
	bhs _02235FA6
	mov r0, #0
	pop {r3, pc}
_02235FA6:
	mov r2, #0
	strb r2, [r0, r1]
	mov r0, #1
	pop {r3, pc}
	nop
_02235FB0: .word 0x000008D4
	thumb_func_end ov80_02235F90

	thumb_func_start ov80_02235FB4
ov80_02235FB4: ; 0x02235FB4
	push {r3, lr}
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_02096810
	bl sub_0204AA2C
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02235FB4

	thumb_func_start ov80_02235FC8
ov80_02235FC8: ; 0x02235FC8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #0xb4
	bl AllocFromHeap
	ldr r1, _02235FE8 ; =ov80_0223DD50
	mov r2, #0xb4
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _02235FE8 ; =ov80_0223DD50
	ldr r0, [r0]
	str r4, [r0]
	pop {r4, pc}
	.balign 4, 0
_02235FE8: .word ov80_0223DD50
	thumb_func_end ov80_02235FC8

	thumb_func_start ov80_02235FEC
ov80_02235FEC: ; 0x02235FEC
	push {r3, lr}
	cmp r0, #0
	beq _02235FF6
	bl FreeToHeap
_02235FF6:
	pop {r3, pc}
	thumb_func_end ov80_02235FEC

	thumb_func_start ov80_02235FF8
ov80_02235FF8: ; 0x02235FF8
	push {r3, lr}
	cmp r1, #5
	bhi _0223603C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223600A: ; jump table
	.short _02236016 - _0223600A - 2 ; case 0
	.short _0223601C - _0223600A - 2 ; case 1
	.short _02236024 - _0223600A - 2 ; case 2
	.short _0223603C - _0223600A - 2 ; case 3
	.short _0223602E - _0223600A - 2 ; case 4
	.short _02236036 - _0223600A - 2 ; case 5
_02236016:
	bl sub_02096A34
	pop {r3, pc}
_0223601C:
	add r1, r2, #0
	bl sub_02096AAC
	pop {r3, pc}
_02236024:
	add r1, r2, #0
	add r2, r3, #0
	bl sub_02096AF4
	pop {r3, pc}
_0223602E:
	add r1, r2, #0
	bl sub_02096BF8
	pop {r3, pc}
_02236036:
	add r1, r2, #0
	bl sub_02096C40
_0223603C:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02235FF8

	thumb_func_start ov80_02236040
ov80_02236040: ; 0x02236040
	push {r3, lr}
	add r3, r1, #0
	add r3, #0x98
	ldr r3, [r3]
	cmp r2, #4
	bhi _02236088
	add r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_02236058: ; jump table
	.short _02236062 - _02236058 - 2 ; case 0
	.short _0223606C - _02236058 - 2 ; case 1
	.short _02236076 - _02236058 - 2 ; case 2
	.short _02236080 - _02236058 - 2 ; case 3
	.short _02236088 - _02236058 - 2 ; case 4
_02236062:
	add r2, r3, #0
	mov r3, #0xb
	bl ov80_0223608C
	pop {r3, pc}
_0223606C:
	add r2, r3, #0
	mov r3, #0xb
	bl ov80_022362B8
	pop {r3, pc}
_02236076:
	add r2, r3, #0
	mov r3, #0xb
	bl ov80_02236330
	pop {r3, pc}
_02236080:
	add r2, r3, #0
	mov r3, #0xb
	bl ov80_0223641C
_02236088:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02236040

	thumb_func_start ov80_0223608C
ov80_0223608C: ; 0x0223608C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0x44
	add r4, r2, #0
	bl AllocFromHeap
	add r1, r5, #0
	add r1, #0xa8
	str r0, [r1]
	add r1, r5, #0
	add r1, #0xa8
	ldr r1, [r1]
	mov r0, #0
	mov r2, #0x44
	bl MIi_CpuClearFast
	ldr r0, [r5]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	add r1, #0xa8
	ldr r1, [r1]
	str r0, [r1]
	ldr r0, [r5]
	bl Sav2_Bag_get
	add r1, r5, #0
	add r1, #0xa8
	ldr r1, [r1]
	str r0, [r1, #4]
	ldr r0, [r5]
	bl Sav2_Mailbox_get
	add r1, r5, #0
	add r1, #0xa8
	ldr r1, [r1]
	str r0, [r1, #8]
	ldr r0, [r5]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r5, #0
	add r1, #0xa8
	ldr r1, [r1]
	str r0, [r1, #0xc]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #1
	bne _0223610E
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x11
	add r0, #0x24
	strb r1, [r0]
	b _02236148
_0223610E:
	cmp r0, #5
	bne _02236120
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x16
	add r0, #0x24
	strb r1, [r0]
	b _02236148
_02236120:
	cmp r0, #4
	bne _02236132
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x17
	add r0, #0x24
	strb r1, [r0]
	b _02236148
_02236132:
	cmp r0, #6
	bne _02236144
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x17
	add r0, #0x24
	strb r1, [r0]
	b _02236148
_02236144:
	bl GF_AssertFail
_02236148:
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	str r4, [r0, #0x1c]
	add r0, r5, #0
	add r0, #0x9f
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r0, #0x26
	strb r1, [r0]
	mov r1, #0
_02236162:
	add r2, r5, #0
	add r0, r5, r1
	add r2, #0xa8
	add r0, #0xa1
	ldr r2, [r2]
	ldrb r0, [r0]
	add r2, r2, r1
	add r2, #0x30
	strb r0, [r2]
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #2
	blo _02236162
	add r0, r5, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #1
	bne _022361C6
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf
	add r0, #0x36
	bic r2, r1
	mov r1, #2
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf0
	add r0, #0x36
	bic r2, r1
	mov r1, #0x20
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x64
	add r0, #0x37
	strb r1, [r0]
	b _02236290
_022361C6:
	cmp r0, #5
	bne _02236208
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf
	add r0, #0x36
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf0
	add r0, #0x36
	bic r2, r1
	mov r1, #0x10
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x1e
	add r0, #0x37
	strb r1, [r0]
	b _02236290
_02236208:
	cmp r0, #4
	bne _0223624A
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf
	add r0, #0x36
	bic r2, r1
	mov r1, #2
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf0
	add r0, #0x36
	bic r2, r1
	mov r1, #0x20
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x64
	add r0, #0x37
	strb r1, [r0]
	b _02236290
_0223624A:
	cmp r0, #6
	bne _0223628C
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf
	add r0, #0x36
	bic r2, r1
	mov r1, #2
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x36
	ldrb r2, [r1]
	mov r1, #0xf0
	add r0, #0x36
	bic r2, r1
	mov r1, #0x20
	orr r1, r2
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r1, #0x64
	add r0, #0x37
	strb r1, [r0]
	b _02236290
_0223628C:
	bl GF_AssertFail
_02236290:
	mov r0, #0x43
	lsl r0, r0, #2
	add r1, r4, r0
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	mov r3, #0
	str r1, [r0, #0x20]
	str r3, [sp]
	add r5, #0xa8
	ldr r1, _022362B4 ; =_0210159C
	ldr r2, [r5]
	add r0, r6, #0
	bl sub_02096820
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_022362B4: .word _0210159C
	thumb_func_end ov80_0223608C

	thumb_func_start ov80_022362B8
ov80_022362B8: ; 0x022362B8
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r1, r0, #0
	add r1, #0x26
	ldrb r1, [r1]
	cmp r1, #6
	beq _022362E0
	cmp r1, #7
	bne _022362F0
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #4
	strh r1, [r0]
	add r4, #0x9d
	strb r1, [r4]
	pop {r4, pc}
_022362E0:
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #4
	strh r1, [r0]
	add r4, #0x9d
	strb r1, [r4]
	pop {r4, pc}
_022362F0:
	add r1, r4, #0
	add r0, #0x30
	add r1, #0xa1
	mov r2, #2
	bl MI_CpuCopy8
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	add r0, #0x26
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x9f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xa8
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0
	add r0, #0xa8
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #2
	strh r1, [r0]
	add r4, #0x9d
	strb r1, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_022362B8

	thumb_func_start ov80_02236330
ov80_02236330: ; 0x02236330
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r0, r3, #0
	mov r1, #0x3c
	bl AllocFromHeapAtEnd
	add r1, r4, #0
	add r1, #0xac
	str r0, [r1]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #0
	mov r2, #0x3c
	bl MI_CpuFill8
	ldr r0, [r4]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #4]
	ldr r0, [r4]
	bl SavArray_PlayerParty_get
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	str r0, [r1]
	ldr r0, [r4]
	bl SavArray_IsNatDexEnabled
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #0x1c]
	ldr r0, [r4]
	bl sub_02088288
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #0x2c]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #1
	strb r1, [r0, #0x11]
	add r0, r4, #0
	add r0, #0x9f
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	strb r1, [r0, #0x14]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r0, [r0]
	bl GetPartyCount
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	strb r0, [r1, #0x13]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	mov r1, #0
	strh r1, [r0, #0x18]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	strb r1, [r0, #0x12]
	ldr r0, [r4]
	bl Save_SpecialRibbons_get
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #0x20]
	ldr r0, [r4]
	bl sub_0208828C
	add r1, r4, #0
	add r1, #0xac
	ldr r1, [r1]
	str r0, [r1, #0x34]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, _02236414 ; =ov80_0223C040
	bl sub_02089D40
	ldr r0, [r4]
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0208AD34
	mov r3, #0
	str r3, [sp]
	add r4, #0xac
	ldr r1, _02236418 ; =_02103A1C
	ldr r2, [r4]
	add r0, r5, #0
	bl sub_02096820
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02236414: .word ov80_0223C040
_02236418: .word _02103A1C
	thumb_func_end ov80_02236330

	thumb_func_start ov80_0223641C
ov80_0223641C: ; 0x0223641C
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	ldrb r1, [r0, #0x14]
	add r0, r4, #0
	add r0, #0x9f
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0
	add r0, #0xac
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	add r4, #0x9d
	strh r1, [r0]
	strb r1, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223641C

	thumb_func_start ov80_02236450
ov80_02236450: ; 0x02236450
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldrb r0, [r5, #0xf]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov80_02236B04
	add r3, r0, #0
	ldr r2, [sp, #0x3c]
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_02229F04
	str r0, [sp, #0x14]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x30]
	add r4, #0x30
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	ldr r1, [sp, #0x14]
	str r0, [sp, #8]
	ldr r0, [sp, #0x38]
	add r2, r6, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x3c]
	add r3, r4, #0
	str r0, [sp, #0x10]
	add r0, r5, #0
	bl ov80_022364A4
	add r4, r0, #0
	ldr r0, [sp, #0x14]
	bl FreeToHeap
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02236450

	thumb_func_start ov80_022364A4
ov80_022364A4: ; 0x022364A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	add r7, r0, #0
	ldr r0, [sp, #0x9c]
	str r2, [sp, #0x18]
	str r0, [sp, #0x9c]
	ldr r0, [sp, #0xa0]
	str r1, [sp, #0x14]
	str r0, [sp, #0xa0]
	ldr r0, [sp, #0xa4]
	str r3, [sp, #0x1c]
	str r0, [sp, #0xa4]
	ldr r0, [sp, #0xa8]
	str r0, [sp, #0xa8]
	mov r0, #0
	str r0, [sp, #0x2c]
	add r0, sp, #0x88
	ldrb r0, [r0, #0x10]
	cmp r0, #4
	bls _022364D0
	bl GF_AssertFail
_022364D0:
	add r0, sp, #0x88
	ldrb r6, [r0, #0x10]
	mov r4, #0
	str r4, [sp, #0x30]
	cmp r6, #0
	bne _022364DE
	b _022365EE
_022364DE:
	add r0, sp, #0x74
	str r0, [sp, #0x24]
_022364E2:
	add r0, r7, #0
	bl sub_0204B510
	ldr r1, [sp, #0x14]
	ldrh r1, [r1, #2]
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r1, r0, #0x17
	ldr r0, [sp, #0x14]
	add r0, r0, r1
	ldrh r0, [r0, #4]
	str r0, [sp, #0x34]
	ldrb r0, [r7, #0xf]
	bl ov80_02236AF0
	add r2, r0, #0
	ldr r1, [sp, #0x34]
	add r0, sp, #0x44
	bl ov80_02229EF4
	mov r0, #0
	str r0, [sp, #0x40]
	cmp r4, #0
	ble _0223653C
	add r5, sp, #0x74
_02236516:
	ldrb r0, [r7, #0xf]
	bl ov80_02236AF0
	add r2, r0, #0
	ldr r1, [r5]
	add r0, sp, #0x54
	bl ov80_02229EF4
	add r0, sp, #0x44
	ldrh r1, [r0, #0x10]
	ldrh r0, [r0]
	cmp r1, r0
	beq _0223653C
	ldr r0, [sp, #0x40]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #0x40]
	cmp r0, r4
	blt _02236516
_0223653C:
	ldr r0, [sp, #0x40]
	cmp r0, r4
	bne _022365E8
	ldr r0, [sp, #0x9c]
	cmp r0, #0
	beq _02236566
	mov r0, #0
	cmp r6, #0
	ble _02236562
	add r1, sp, #0x44
	ldrh r3, [r1]
	ldr r2, [sp, #0x9c]
_02236554:
	ldrh r1, [r2]
	cmp r3, r1
	beq _02236562
	add r0, r0, #1
	add r2, r2, #2
	cmp r0, r6
	blt _02236554
_02236562:
	cmp r0, r6
	bne _022365E8
_02236566:
	ldr r0, [sp, #0x30]
	cmp r0, #0x32
	bge _022365DE
	mov r0, #0
	str r0, [sp, #0x20]
	cmp r4, #0
	ble _022365A0
	add r5, sp, #0x74
_02236576:
	ldrb r0, [r7, #0xf]
	bl ov80_02236AF0
	add r2, r0, #0
	ldr r1, [r5]
	add r0, sp, #0x54
	bl ov80_02229EF4
	add r0, sp, #0x44
	ldrh r1, [r0, #0x1c]
	cmp r1, #0
	beq _02236594
	ldrh r0, [r0, #0xc]
	cmp r1, r0
	beq _022365A0
_02236594:
	ldr r0, [sp, #0x20]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, r4
	blt _02236576
_022365A0:
	ldr r0, [sp, #0x20]
	cmp r0, r4
	beq _022365AE
	ldr r0, [sp, #0x30]
	add r0, r0, #1
	str r0, [sp, #0x30]
	b _022365E8
_022365AE:
	ldr r0, [sp, #0xa0]
	cmp r0, #0
	beq _022365DE
	mov r0, #0
	cmp r6, #0
	ble _022365D2
	add r1, sp, #0x44
	ldrh r3, [r1, #0xc]
	ldr r2, [sp, #0xa0]
_022365C0:
	ldrh r1, [r2]
	cmp r3, r1
	bne _022365CA
	cmp r1, #0
	bne _022365D2
_022365CA:
	add r0, r0, #1
	add r2, r2, #2
	cmp r0, r6
	blt _022365C0
_022365D2:
	cmp r0, r6
	beq _022365DE
	ldr r0, [sp, #0x30]
	add r0, r0, #1
	str r0, [sp, #0x30]
	b _022365E8
_022365DE:
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x24]
	add r4, r4, #1
	stmia r0!, {r1}
	str r0, [sp, #0x24]
_022365E8:
	cmp r4, r6
	beq _022365EE
	b _022364E2
_022365EE:
	ldr r0, [sp, #0x18]
	bl sub_0204B4D4
	str r0, [sp, #0x3c]
	add r0, r7, #0
	bl sub_0204B510
	add r5, r0, #0
	add r0, r7, #0
	bl sub_0204B510
	lsl r0, r0, #0x10
	orr r0, r5
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x30]
	cmp r0, #0x32
	blt _02236614
	mov r0, #1
	str r0, [sp, #0x2c]
_02236614:
	mov r5, #0
	cmp r4, #0
	ble _0223665C
	add r0, sp, #0x74
	str r0, [sp, #0x28]
	add r6, sp, #0x64
_02236620:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	ldr r2, [sp, #0x28]
	str r0, [sp, #4]
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0xa8]
	ldr r3, [sp, #0x38]
	str r0, [sp, #0x10]
	ldr r2, [r2]
	add r0, r7, #0
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	bl ov80_02236734
	stmia r6!, {r0}
	ldr r0, [sp, #0x28]
	add r5, r5, #1
	add r0, r0, #4
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x1c]
	add r0, #0x38
	str r0, [sp, #0x1c]
	cmp r5, r4
	blt _02236620
_0223665C:
	ldr r0, [sp, #0xa4]
	cmp r0, #0
	bne _02236668
	ldr r0, [sp, #0x2c]
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
_02236668:
	ldr r1, [sp, #0x38]
	ldr r2, [sp, #0xa4]
	str r1, [r0]
	mov r3, #0
	add r0, sp, #0x74
	add r1, sp, #0x64
_02236674:
	ldr r5, [r0]
	ldr r4, [sp, #0xa4]
	add r3, r3, #1
	strh r5, [r4, #4]
	ldr r4, [r1]
	add r0, r0, #4
	str r4, [r2, #8]
	ldr r4, [sp, #0xa4]
	add r1, r1, #4
	add r4, r4, #2
	add r2, r2, #4
	str r4, [sp, #0xa4]
	cmp r3, #2
	blt _02236674
	ldr r0, [sp, #0x2c]
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_022364A4

	thumb_func_start ov80_02236698
ov80_02236698: ; 0x02236698
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	mov r2, #0x11
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #4
	bl MI_CpuFill8
	add r0, r6, #0
	bl sub_0202D928
	add r6, r0, #0
	bl sub_0202D7B0
	cmp r0, #0
	bne _022366C6
	add r0, r5, #0
	add r1, r4, #0
	bl ov80_022366D4
	pop {r4, r5, r6, pc}
_022366C6:
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_0202D804
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_02236698

	thumb_func_start ov80_022366D4
ov80_022366D4: ; 0x022366D4
	push {r3, r4, r5, r6, r7, lr}
	mov r2, #0x11
	add r4, r1, #0
	mov r1, #0
	lsl r2, r2, #4
	add r5, r0, #0
	bl MI_CpuFill8
	mov r0, #6
	mul r0, r4
	ldr r1, _02236728 ; =ov80_0223C050
	str r0, [sp]
	add r6, r1, r0
	ldr r1, _0223672C ; =ov80_0223C07C
	mov r2, #0x30
	add r0, r4, #0
	mul r0, r2
	add r0, r1, r0
	add r1, r5, #0
	ldr r7, _02236730 ; =ov80_0223C0AC
	bl MI_CpuCopy8
	ldr r1, _02236728 ; =ov80_0223C050
	ldr r0, [sp]
	mov r4, #0
	ldrh r0, [r1, r0]
	strh r0, [r5, #6]
	add r5, #0x30
_0223670C:
	add r0, r6, r4
	ldrb r1, [r0, #2]
	mov r0, #0x38
	mov r2, #0x38
	mul r0, r1
	add r0, r7, r0
	add r1, r5, #0
	bl MI_CpuCopy8
	add r4, r4, #1
	add r5, #0x38
	cmp r4, #4
	blt _0223670C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02236728: .word ov80_0223C050
_0223672C: .word ov80_0223C07C
_02236730: .word ov80_0223C0AC
	thumb_func_end ov80_022366D4

	thumb_func_start ov80_02236734
ov80_02236734: ; 0x02236734
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r4, r0, #0
	add r6, r2, #0
	add r0, r5, #0
	mov r1, #0
	mov r2, #0x38
	str r3, [sp]
	bl MI_CpuFill8
	ldrb r0, [r4, #0xf]
	bl ov80_02236AF0
	add r2, r0, #0
	add r0, sp, #8
	add r1, r6, #0
	bl ov80_02229EF4
	add r2, sp, #8
	ldrh r0, [r5]
	ldr r1, _022368E4 ; =0xFFFFF800
	ldrh r3, [r2]
	and r0, r1
	lsr r1, r1, #0x15
	and r1, r3
	orr r0, r1
	strh r0, [r5]
	ldrh r1, [r5]
	ldr r0, _022368E8 ; =0xFFFF07FF
	and r1, r0
	ldrh r0, [r2, #0xe]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x10
	orr r0, r1
	strh r0, [r5]
	ldr r0, [sp, #0x3c]
	cmp r0, #0
	beq _0223678E
	add r0, sp, #0x20
	ldrb r0, [r0, #0x18]
	lsl r1, r0, #1
	ldr r0, _022368EC ; =ov80_0223C048
	ldrh r0, [r0, r1]
	b _02236790
_0223678E:
	ldrh r0, [r2, #0xc]
_02236790:
	strh r0, [r5, #2]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	add r1, sp, #8
	add r2, r5, #0
	add r3, r0, #0
_0223679E:
	ldrh r6, [r1, #2]
	strh r6, [r2, #4]
	ldrh r6, [r1, #2]
	cmp r6, #0xda
	bne _022367AA
	str r3, [sp, #4]
_022367AA:
	add r0, r0, #1
	add r1, r1, #2
	add r2, r2, #2
	cmp r0, #4
	blt _0223679E
	ldr r0, [sp]
	ldr r7, [sp, #0x30]
	str r0, [r5, #0xc]
	cmp r7, #0
	bne _022367F0
_022367BE:
	add r0, r4, #0
	bl sub_0204B510
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0204B510
	lsl r0, r0, #0x10
	add r7, r6, #0
	orr r7, r0
	add r0, r7, #0
	bl GetNatureFromPersonality
	add r1, sp, #8
	ldrb r1, [r1, #0xb]
	cmp r1, r0
	bne _022367BE
	ldr r0, [sp]
	add r1, r7, #0
	bl CalcShininessByOtIdAndPersonality
	cmp r0, #1
	beq _022367BE
	str r7, [r5, #0x10]
	b _022367F2
_022367F0:
	str r7, [r5, #0x10]
_022367F2:
	add r0, sp, #0x20
	ldrb r1, [r0, #0x14]
	ldr r2, [r5, #0x14]
	mov r0, #0x1f
	bic r2, r0
	mov r0, #0x1f
	and r0, r1
	orr r2, r0
	ldr r0, _022368F0 ; =0xFFFFFC1F
	mov r6, #0
	and r2, r0
	lsl r0, r1, #0x1b
	lsr r1, r0, #0x16
	orr r2, r1
	ldr r1, _022368F4 ; =0xFFFF83FF
	add r4, r6, #0
	and r2, r1
	lsr r1, r0, #0x11
	orr r2, r1
	ldr r1, _022368F8 ; =0xFFF07FFF
	and r2, r1
	lsr r1, r0, #0xc
	orr r2, r1
	ldr r1, _022368FC ; =0xFE0FFFFF
	and r2, r1
	lsr r1, r0, #7
	orr r2, r1
	ldr r1, _02236900 ; =0xC1FFFFFF
	lsr r0, r0, #2
	and r1, r2
	orr r0, r1
	str r0, [r5, #0x14]
_02236832:
	add r0, r4, #0
	bl MaskOfFlagNo
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	tst r0, r1
	beq _02236842
	add r6, r6, #1
_02236842:
	add r4, r4, #1
	cmp r4, #6
	blt _02236832
	ldr r0, _02236904 ; =0x000001FE
	add r1, r6, #0
	bl _s32_div_f
	cmp r0, #0xff
	ble _02236856
	mov r0, #0xff
_02236856:
	lsl r0, r0, #0x18
	mov r4, #0
	lsr r6, r0, #0x18
_0223685C:
	add r0, r4, #0
	bl MaskOfFlagNo
	add r1, sp, #8
	ldrb r1, [r1, #0xa]
	tst r0, r1
	beq _0223686E
	add r0, r5, r4
	strb r6, [r0, #0x18]
_0223686E:
	add r4, r4, #1
	cmp r4, #6
	blt _0223685C
	mov r0, #0
	strb r0, [r5, #0x1e]
	ldr r0, _02236908 ; =gGameLanguage
	mov r1, #0x19
	ldrb r0, [r0]
	strb r0, [r5, #0x1f]
	ldrh r0, [r5]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	bl GetMonBaseStat
	cmp r0, #0
	beq _022368B2
	ldr r2, [r5, #0x10]
	mov r1, #1
	tst r1, r2
	beq _0223689E
	add r1, r5, #0
	add r1, #0x20
	strb r0, [r1]
	b _022368C4
_0223689E:
	ldrh r0, [r5]
	mov r1, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	bl GetMonBaseStat
	add r1, r5, #0
	add r1, #0x20
	strb r0, [r1]
	b _022368C4
_022368B2:
	ldrh r0, [r5]
	mov r1, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	bl GetMonBaseStat
	add r1, r5, #0
	add r1, #0x20
	strb r0, [r1]
_022368C4:
	add r1, r5, #0
	ldr r0, [sp, #4]
	add r1, #0x21
	strb r0, [r1]
	ldrh r0, [r5]
	add r5, #0x22
	ldr r1, [sp, #0x40]
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	add r2, r5, #0
	bl GetSpeciesNameIntoArray
	add r0, r7, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022368E4: .word 0xFFFFF800
_022368E8: .word 0xFFFF07FF
_022368EC: .word ov80_0223C048
_022368F0: .word 0xFFFFFC1F
_022368F4: .word 0xFFFF83FF
_022368F8: .word 0xFFF07FFF
_022368FC: .word 0xFE0FFFFF
_02236900: .word 0xC1FFFFFF
_02236904: .word 0x000001FE
_02236908: .word gGameLanguage
	thumb_func_end ov80_02236734

	thumb_func_start ov80_0223690C
ov80_0223690C: ; 0x0223690C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrb r0, [r5, #0xf]
	add r4, r1, #0
	bl ov80_02236A88
	add r1, r0, #0
	ldr r0, [r5, #4]
	bl BattleStruct_new
	add r7, r0, #0
	ldr r0, [r4, #8]
	bl SavArray_PlayerParty_get
	str r0, [sp, #8]
	ldr r0, [r4, #0xc]
	mov r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x1c]
	str r0, [sp, #4]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0x18]
	add r0, r7, #0
	bl sub_02051D18
	mov r0, #0x53
	mov r1, #0x12
	lsl r0, r0, #2
	str r1, [r7, r0]
	add r0, r0, #4
	str r1, [r7, r0]
	ldr r0, [r5, #4]
	bl AllocMonZeroed
	add r4, r0, #0
	ldrb r1, [r5, #0xe]
	ldr r0, [r7, #4]
	bl InitPartyWithMaxSize
	ldrb r0, [r5, #0xe]
	mov r6, #0
	cmp r0, #0
	ble _022369B8
_02236964:
	add r1, r5, r6
	add r1, #0x2a
	ldrb r1, [r1]
	ldr r0, [sp, #8]
	bl GetPartyMonByIndex
	add r1, r4, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	cmp r0, #0x32
	bls _022369A6
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	mov r1, #0x32
	bl GetMonExpBySpeciesAndLevel
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #8
	add r2, sp, #0xc
	bl SetMonData
	add r0, r4, #0
	bl CalcMonLevelAndStats
_022369A6:
	add r0, r7, #0
	add r1, r4, #0
	mov r2, #0
	bl sub_02051C9C
	ldrb r0, [r5, #0xe]
	add r6, r6, #1
	cmp r6, r0
	blt _02236964
_022369B8:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r7, #0
	bl sub_02052580
	ldr r0, [r5, #4]
	add r1, r5, #0
	str r0, [sp]
	ldrb r2, [r5, #0xe]
	add r0, r7, #0
	add r1, #0x78
	mov r3, #1
	bl ov80_02236A34
	mov r2, #0
	add r1, r7, #0
	mov r0, #7
_022369DC:
	add r2, r2, #1
	str r0, [r1, #0x34]
	add r1, #0x34
	cmp r2, #4
	blt _022369DC
	ldrb r0, [r5, #0xf]
	cmp r0, #2
	beq _022369F6
	cmp r0, #3
	beq _02236A18
	cmp r0, #6
	beq _02236A18
	b _02236A2C
_022369F6:
	ldr r0, [r5, #4]
	mov r1, #0xa6
	str r0, [sp]
	ldrb r2, [r5, #0x10]
	lsl r1, r1, #2
	add r1, r5, r1
	lsl r2, r2, #0x18
	lsr r3, r2, #0x1d
	lsl r2, r3, #4
	add r2, r3, r2
	lsl r2, r2, #4
	add r1, r1, r2
	ldrb r2, [r5, #0xe]
	add r0, r7, #0
	mov r3, #2
	bl ov80_02236A34
_02236A18:
	ldr r0, [r5, #4]
	mov r1, #0x62
	str r0, [sp]
	ldrb r2, [r5, #0xe]
	lsl r1, r1, #2
	add r0, r7, #0
	add r1, r5, r1
	mov r3, #3
	bl ov80_02236A34
_02236A2C:
	add r0, r7, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0223690C

	thumb_func_start ov80_02236A34
ov80_02236A34: ; 0x02236A34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x28]
	str r0, [sp, #4]
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	str r4, [sp]
	bl ov80_0222A480
	ldr r0, [sp, #0x28]
	bl AllocMonZeroed
	add r4, r0, #0
	mov r6, #0
	cmp r7, #0
	ble _02236A7E
	ldr r0, [sp, #8]
	add r5, #0x30
	lsl r1, r0, #2
	ldr r0, [sp, #4]
	add r0, r0, r1
	str r0, [sp, #0xc]
_02236A62:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x78
	bl ov80_0222A140
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	ldr r0, [r0, #4]
	bl AddMonToParty
	add r6, r6, #1
	add r5, #0x38
	cmp r6, r7
	blt _02236A62
_02236A7E:
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02236A34

	thumb_func_start ov80_02236A88
ov80_02236A88: ; 0x02236A88
	cmp r0, #6
	bhi _02236AB6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02236A98: ; jump table
	.short _02236AA6 - _02236A98 - 2 ; case 0
	.short _02236AAA - _02236A98 - 2 ; case 1
	.short _02236AAE - _02236A98 - 2 ; case 2
	.short _02236AB2 - _02236A98 - 2 ; case 3
	.short _02236AA6 - _02236A98 - 2 ; case 4
	.short _02236AB6 - _02236A98 - 2 ; case 5
	.short _02236AB2 - _02236A98 - 2 ; case 6
_02236AA6:
	mov r0, #0x81
	bx lr
_02236AAA:
	mov r0, #0x83
	bx lr
_02236AAE:
	mov r0, #0xcb
	bx lr
_02236AB2:
	mov r0, #0x8f
	bx lr
_02236AB6:
	mov r0, #0x81
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02236A88

	thumb_func_start ov80_02236ABC
ov80_02236ABC: ; 0x02236ABC
	ldrb r3, [r0, #0x10]
	mov r2, #8
	bic r3, r2
	lsl r2, r1, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1c
	orr r2, r3
	strb r2, [r0, #0x10]
	ldr r2, _02236AD4 ; =0x0000083E
	strh r1, [r0, r2]
	bx lr
	.balign 4, 0
_02236AD4: .word 0x0000083E
	thumb_func_end ov80_02236ABC

	thumb_func_start ov80_02236AD8
ov80_02236AD8: ; 0x02236AD8
	ldrb r0, [r0, #0x10]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1f
	bne _02236AE6
	ldrh r0, [r1]
	cmp r0, #0
	beq _02236AEA
_02236AE6:
	mov r0, #1
	bx lr
_02236AEA:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02236AD8

	thumb_func_start ov80_02236AF0
ov80_02236AF0: ; 0x02236AF0
	push {r3, lr}
	bl ov80_02236B30
	cmp r0, #0
	bne _02236AFE
	mov r0, #0x81
	pop {r3, pc}
_02236AFE:
	mov r0, #0xcd
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02236AF0

	thumb_func_start ov80_02236B04
ov80_02236B04: ; 0x02236B04
	push {r3, lr}
	bl ov80_02236B30
	cmp r0, #0
	bne _02236B12
	mov r0, #0x80
	pop {r3, pc}
_02236B12:
	mov r0, #0xcc
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02236B04

	thumb_func_start ov80_02236B18
ov80_02236B18: ; 0x02236B18
	push {r3, lr}
	bl ov80_02236B30
	cmp r0, #0
	bne _02236B26
	ldr r0, _02236B2C ; =0x000002D3
	pop {r3, pc}
_02236B26:
	mov r0, #0xb5
	lsl r0, r0, #2
	pop {r3, pc}
	.balign 4, 0
_02236B2C: .word 0x000002D3
	thumb_func_end ov80_02236B18

	thumb_func_start ov80_02236B30
ov80_02236B30: ; 0x02236B30
	push {r3, r4, r5, lr}
	cmp r0, #3
	beq _02236B3A
	cmp r0, #6
	bne _02236B74
_02236B3A:
	mov r0, #0
	bl sub_02034818
	add r5, r0, #0
	bne _02236B48
	bl GF_AssertFail
_02236B48:
	mov r0, #1
	bl sub_02034818
	add r4, r0, #0
	bne _02236B56
	bl GF_AssertFail
_02236B56:
	add r0, r5, #0
	bl PlayerProfile_GetVersion
	add r5, r0, #0
	add r0, r4, #0
	bl PlayerProfile_GetVersion
	cmp r5, #0
	beq _02236B6C
	cmp r0, #0
	bne _02236B70
_02236B6C:
	mov r0, #0
	pop {r3, r4, r5, pc}
_02236B70:
	mov r0, #1
	pop {r3, r4, r5, pc}
_02236B74:
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02236B30

	thumb_func_start ov80_02236B78
ov80_02236B78: ; 0x02236B78
	push {r3, r4, r5, lr}
	cmp r1, #8
	blo _02236B80
	mov r1, #7
_02236B80:
	cmp r0, #0
	bne _02236B9C
	mov r0, #7
	add r3, r2, #1
	mul r0, r1
	add r0, r3, r0
	cmp r0, #0x15
	bne _02236B94
	ldr r0, _02236BCC ; =0x00000135
	pop {r3, r4, r5, pc}
_02236B94:
	cmp r0, #0x31
	bne _02236B9C
	ldr r0, _02236BD0 ; =0x00000136
	pop {r3, r4, r5, pc}
_02236B9C:
	cmp r2, #6
	beq _02236BA4
	cmp r2, #0xd
	bne _02236BB2
_02236BA4:
	ldr r0, _02236BD4 ; =ov80_0223C47C
	lsl r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02236BD8 ; =ov80_0223C47E
	ldrh r0, [r0, r1]
	sub r5, r0, r4
	b _02236BBE
_02236BB2:
	ldr r0, _02236BDC ; =ov80_0223C478
	lsl r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02236BE0 ; =ov80_0223C47A
	ldrh r0, [r0, r1]
	sub r5, r0, r4
_02236BBE:
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	add r0, r4, r1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02236BCC: .word 0x00000135
_02236BD0: .word 0x00000136
_02236BD4: .word ov80_0223C47C
_02236BD8: .word ov80_0223C47E
_02236BDC: .word ov80_0223C478
_02236BE0: .word ov80_0223C47A
	thumb_func_end ov80_02236B78

	thumb_func_start ov80_02236BE4
ov80_02236BE4: ; 0x02236BE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r2, #0
	str r0, [sp]
	str r1, [sp, #4]
	add r7, r3, #0
	mov r4, #0
	add r5, r6, #0
_02236BF4:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r4, #0
	bl ov80_02236B78
	mov r1, #0
	strh r0, [r5]
	cmp r4, #0
	ble _02236C1A
	lsl r0, r4, #1
	ldrh r3, [r6, r0]
	add r2, r6, #0
_02236C0C:
	ldrh r0, [r2]
	cmp r0, r3
	beq _02236C1A
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, r4
	blt _02236C0C
_02236C1A:
	cmp r1, r4
	bne _02236C22
	add r5, r5, #2
	add r4, r4, #1
_02236C22:
	cmp r4, r7
	blt _02236BF4
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02236BE4

	thumb_func_start ov80_02236C2C
ov80_02236C2C: ; 0x02236C2C
	push {r4, lr}
	cmp r1, #0
	bne _02236C38
	ldr r2, _02236C6C ; =ov80_0223C508
	ldr r1, _02236C70 ; =ov80_0223DD38
	b _02236C3C
_02236C38:
	ldr r2, _02236C74 ; =ov80_0223C558
	ldr r1, _02236C70 ; =ov80_0223DD38
_02236C3C:
	mov r4, #0xa
	str r2, [r1]
	mov r2, #0
	cmp r4, #0
	ble _02236C58
	ldr r1, _02236C70 ; =ov80_0223DD38
	ldr r3, [r1]
_02236C4A:
	ldrh r1, [r3]
	cmp r0, r1
	blt _02236C58
	add r2, r2, #1
	add r3, #8
	cmp r2, r4
	blt _02236C4A
_02236C58:
	cmp r2, r4
	blt _02236C62
	bl GF_AssertFail
	sub r2, r4, #1
_02236C62:
	ldr r0, _02236C70 ; =ov80_0223DD38
	ldr r1, [r0]
	lsl r0, r2, #3
	add r0, r1, r0
	pop {r4, pc}
	.balign 4, 0
_02236C6C: .word ov80_0223C508
_02236C70: .word ov80_0223DD38
_02236C74: .word ov80_0223C558
	thumb_func_end ov80_02236C2C

	thumb_func_start ov80_02236C78
ov80_02236C78: ; 0x02236C78
	cmp r0, #8
	blt _02236C7E
	mov r0, #7
_02236C7E:
	cmp r1, #0
	bne _02236C8A
	ldr r1, _02236C94 ; =ov80_0223C508
	lsl r0, r0, #3
	add r0, r1, r0
	bx lr
_02236C8A:
	ldr r1, _02236C98 ; =ov80_0223C4B8
	lsl r0, r0, #3
	add r0, r1, r0
	bx lr
	nop
_02236C94: .word ov80_0223C508
_02236C98: .word ov80_0223C4B8
	thumb_func_end ov80_02236C78

	thumb_func_start ov80_02236C9C
ov80_02236C9C: ; 0x02236C9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	str r0, [sp]
	ldr r0, [sp, #0xa0]
	str r1, [sp, #4]
	str r0, [sp, #0xa0]
	ldr r0, [sp, #0xa8]
	add r7, r2, #0
	str r0, [sp, #0xa8]
	add r0, r3, #0
	str r3, [sp, #8]
	cmp r0, #6
	ble _02236CBA
	bl GF_AssertFail
_02236CBA:
	ldr r0, [sp, #0xa0]
	mov r4, #0
	ldrh r1, [r0, #4]
	ldrh r0, [r0, #2]
	sub r0, r1, r0
	add r1, sp, #0x88
	ldrh r5, [r1, #0x1c]
	str r0, [sp, #0x1c]
	add r0, r4, #0
	cmp r5, #0
	beq _02236CE8
	ldr r3, _02236DD0 ; =ov80_0223C464
	mov r0, #5
	add r2, r4, #0
_02236CD6:
	ldr r1, [r3]
	cmp r5, r1
	bgt _02236CE0
	add r0, r2, #0
	b _02236CE8
_02236CE0:
	add r2, r2, #1
	add r3, r3, #4
	cmp r2, #5
	blo _02236CD6
_02236CE8:
	ldr r1, [sp, #8]
	cmp r1, #0
	beq _02236DC8
	add r1, sp, #0x24
	str r1, [sp, #0x14]
	ldr r1, [sp, #0x98]
	str r1, [sp, #0x10]
	ldr r1, [sp, #8]
	sub r0, r1, r0
	str r0, [sp, #0xc]
_02236CFC:
	ldr r0, [sp, #0xc]
	cmp r4, r0
	blt _02236D30
	ldr r0, [sp, #0xa0]
	ldrb r0, [r0, #7]
	cmp r0, #1
	bne _02236D30
	ldr r0, [sp, #0xa0]
	ldrh r1, [r0, #0xc]
	ldrh r0, [r0, #0xa]
	sub r0, r1, r0
	str r0, [sp, #0x1c]
	bl LCRandom
	ldr r1, [sp, #0x1c]
	add r1, r1, #1
	bl _s32_div_f
	ldr r0, [sp, #0xa0]
	ldrh r0, [r0, #0xc]
	sub r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xa0]
	ldrb r0, [r0, #0xe]
	str r0, [sp, #0x20]
	b _02236D4A
_02236D30:
	bl LCRandom
	ldr r1, [sp, #0x1c]
	add r1, r1, #1
	bl _s32_div_f
	ldr r0, [sp, #0xa0]
	ldrh r0, [r0, #4]
	sub r0, r0, r1
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xa0]
	ldrb r0, [r0, #6]
	str r0, [sp, #0x20]
_02236D4A:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	mov r2, #0xcd
	bl ov80_02229EF4
	mov r2, #0
	cmp r4, #0
	ble _02236D78
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x14]
	ldrh r1, [r1]
	ldrh r3, [r3, #0xc]
	add r0, sp, #0x24
_02236D64:
	ldrh r5, [r0]
	cmp r5, r1
	beq _02236D78
	ldrh r5, [r0, #0xc]
	cmp r5, r3
	beq _02236D78
	add r2, r2, #1
	add r0, #0x10
	cmp r2, r4
	blt _02236D64
_02236D78:
	cmp r2, r4
	bne _02236DC2
	mov r3, #0
	cmp r7, #0
	ble _02236DA4
	ldr r2, [sp, #0x14]
	ldr r5, [sp, #0x14]
	ldrh r2, [r2]
	ldrh r6, [r5, #0xc]
	ldr r0, [sp]
	ldr r1, [sp, #4]
_02236D8E:
	ldrh r5, [r0]
	cmp r2, r5
	beq _02236DA4
	ldrh r5, [r1]
	cmp r6, r5
	beq _02236DA4
	add r3, r3, #1
	add r0, r0, #2
	add r1, r1, #2
	cmp r3, r7
	blt _02236D8E
_02236DA4:
	cmp r3, r7
	bne _02236DC2
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x10]
	strh r1, [r0]
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0xa8]
	strb r1, [r0, r4]
	ldr r0, [sp, #0x14]
	add r4, r4, #1
	add r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	add r0, r0, #2
	str r0, [sp, #0x10]
_02236DC2:
	ldr r0, [sp, #8]
	cmp r4, r0
	bne _02236CFC
_02236DC8:
	mov r0, #0
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	nop
_02236DD0: .word ov80_0223C464
	thumb_func_end ov80_02236C9C

	thumb_func_start ov80_02236DD4
ov80_02236DD4: ; 0x02236DD4
	cmp r0, #3
	bhi _02236DF4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02236DE4: ; jump table
	.short _02236DEC - _02236DE4 - 2 ; case 0
	.short _02236DEC - _02236DE4 - 2 ; case 1
	.short _02236DF0 - _02236DE4 - 2 ; case 2
	.short _02236DF0 - _02236DE4 - 2 ; case 3
_02236DEC:
	mov r0, #3
	bx lr
_02236DF0:
	mov r0, #2
	bx lr
_02236DF4:
	mov r0, #0
	bx lr
	thumb_func_end ov80_02236DD4

	thumb_func_start ov80_02236DF8
ov80_02236DF8: ; 0x02236DF8
	cmp r0, #3
	bhi _02236E20
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02236E08: ; jump table
	.short _02236E10 - _02236E08 - 2 ; case 0
	.short _02236E10 - _02236E08 - 2 ; case 1
	.short _02236E14 - _02236E08 - 2 ; case 2
	.short _02236E14 - _02236E08 - 2 ; case 3
_02236E10:
	mov r0, #3
	bx lr
_02236E14:
	cmp r1, #0
	bne _02236E1C
	mov r0, #2
	bx lr
_02236E1C:
	mov r0, #4
	bx lr
_02236E20:
	mov r0, #0
	bx lr
	thumb_func_end ov80_02236DF8

	thumb_func_start ov80_02236E24
ov80_02236E24: ; 0x02236E24
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r2, #0
	add r4, r3, #0
	bl ov80_02236C78
	ldr r1, [sp, #0x2c]
	str r5, [sp]
	cmp r1, #0
	bne _02236E56
	mov r1, #0xb
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x18]
	mov r3, #6
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x10]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	bl ov80_02236C9C
	b _02236E70
_02236E56:
	mov r2, #0xb
	str r2, [sp, #4]
	str r0, [sp, #8]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x18]
	mov r2, #6
	add r3, r2, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x10]
	add r0, r1, #0
	bl ov80_02236C9C
_02236E70:
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x20]
	str r0, [sp]
	mov r0, #6
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r1, r5, #0
	mov r3, #0
	bl ov80_0222A52C
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov80_02236E24

	thumb_func_start ov80_02236E90
ov80_02236E90: ; 0x02236E90
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xa8]
	add r7, r3, #0
	str r0, [sp, #0xa8]
	add r0, r1, #0
	add r1, r2, #0
	bl ov80_02236C2C
	str r0, [sp, #0x18]
	mov r0, #0
	mov ip, r0
	ldr r0, [sp, #0xa8]
	cmp r0, #0
	ble _02236EE4
	add r4, sp, #0x34
	add r5, sp, #0x1c
_02236EB4:
	add r6, r7, #0
	add r3, sp, #0x4c
	mov r2, #7
_02236EBA:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02236EBA
	add r0, sp, #0x1c
	ldrh r0, [r0, #0x30]
	add r7, #0x38
	lsl r0, r0, #0x15
	lsr r0, r0, #0x15
	strh r0, [r4]
	add r0, sp, #0x1c
	ldrh r0, [r0, #0x32]
	add r4, r4, #2
	strh r0, [r5]
	mov r0, ip
	add r1, r0, #1
	ldr r0, [sp, #0xa8]
	add r5, r5, #2
	mov ip, r1
	cmp r1, r0
	blt _02236EB4
_02236EE4:
	ldr r0, [sp, #0x98]
	ldr r2, [sp, #0xa8]
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	add r1, sp, #0x1c
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0xa0]
	str r0, [sp, #0x10]
	ldr r3, [sp, #0x14]
	add r0, sp, #0x34
	bl ov80_02236C9C
	ldr r0, [sp, #0xa4]
	ldr r1, [sp, #0x98]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0xa0]
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x9c]
	mov r3, #0
	bl ov80_0222A52C
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_02236E90

	thumb_func_start ov80_02236F24
ov80_02236F24: ; 0x02236F24
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r5, r0, #0
	ldrb r0, [r5, #4]
	add r6, r1, #0
	bl ov80_02236DD4
	str r0, [sp, #0x10]
	ldrb r0, [r5, #4]
	mov r1, #0
	bl ov80_02236DF8
	str r0, [sp, #0xc]
	ldr r0, _022370EC ; =0x000004D4
	ldr r0, [r5, r0]
	bl HealParty
	ldr r0, _022370F0 ; =0x000004D8
	ldr r0, [r5, r0]
	bl HealParty
	ldrb r0, [r5, #4]
	bl ov80_022370F4
	add r1, r0, #0
	mov r0, #0xb
	bl BattleStruct_new
	ldr r1, [r6, #0xc]
	add r4, r0, #0
	str r1, [sp]
	ldr r1, [r6, #0x1c]
	str r1, [sp, #4]
	ldr r2, [r6, #8]
	ldr r3, [r6, #0x18]
	mov r1, #0
	bl sub_02051D18
	mov r0, #0x53
	mov r1, #0x13
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x10]
	bl InitPartyWithMaxSize
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	mov r6, #0
	cmp r0, #0
	ble _02236FB6
_02236F94:
	ldr r0, _022370EC ; =0x000004D4
	add r1, r6, #0
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r1, r7, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #0
	bl sub_02051C9C
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	cmp r6, r0
	blt _02236F94
_02236FB6:
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	bl sub_02052580
	ldrb r1, [r5, #6]
	add r0, sp, #0x14
	mov r2, #0xb
	lsl r1, r1, #1
	add r1, r5, r1
	ldrh r1, [r1, #0x18]
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, sp, #0x14
	mov r3, #1
	bl ov80_0222A480
	ldrb r0, [r5, #4]
	mov r1, #0
	bl ov80_02236DF8
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl InitPartyWithMaxSize
	mov r7, #0
	add r6, r4, #0
_02236FFC:
	add r0, r5, #0
	bl ov80_02237264
	str r0, [r6, #0x34]
	add r7, r7, #1
	add r6, #0x34
	cmp r7, #4
	blt _02236FFC
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	ldr r0, [sp, #0xc]
	mov r6, #0
	cmp r0, #0
	ble _0223703E
_0223701C:
	ldr r0, _022370F0 ; =0x000004D8
	add r1, r6, #0
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r1, r7, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #1
	bl sub_02051C9C
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	cmp r6, r0
	blt _0223701C
_0223703E:
	add r0, r7, #0
	bl FreeToHeap
	ldrb r0, [r5, #4]
	cmp r0, #2
	beq _0223704E
	cmp r0, #3
	bne _022370E4
_0223704E:
	add r0, r4, #0
	bl sub_02052580
	bl sub_0203769C
	mov r1, #1
	sub r0, r1, r0
	bl sub_02034818
	mov r1, #1
	lsl r1, r1, #8
	ldr r1, [r4, r1]
	bl PlayerProfile_copy
	ldrb r1, [r5, #6]
	add r0, sp, #0x14
	mov r2, #0xb
	add r1, r1, #7
	lsl r1, r1, #1
	add r1, r5, r1
	ldrh r1, [r1, #0x18]
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, sp, #0x14
	mov r3, #3
	bl ov80_0222A480
	ldrb r0, [r5, #4]
	mov r1, #0
	bl ov80_02236DF8
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	bl InitPartyWithMaxSize
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _022370DE
	add r6, r0, #0
_022370B6:
	ldr r0, _022370F0 ; =0x000004D8
	add r1, r6, #0
	ldr r0, [r5, r0]
	bl GetPartyMonByIndex
	add r1, r7, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #3
	bl sub_02051C9C
	ldr r0, [sp, #8]
	add r6, r6, #1
	add r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	cmp r1, r0
	blt _022370B6
_022370DE:
	add r0, r7, #0
	bl FreeToHeap
_022370E4:
	add r0, r4, #0
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	nop
_022370EC: .word 0x000004D4
_022370F0: .word 0x000004D8
	thumb_func_end ov80_02236F24

	thumb_func_start ov80_022370F4
ov80_022370F4: ; 0x022370F4
	cmp r0, #3
	bhi _0223711C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237104: ; jump table
	.short _0223710C - _02237104 - 2 ; case 0
	.short _02237110 - _02237104 - 2 ; case 1
	.short _02237114 - _02237104 - 2 ; case 2
	.short _02237118 - _02237104 - 2 ; case 3
_0223710C:
	mov r0, #0x81
	bx lr
_02237110:
	mov r0, #0x83
	bx lr
_02237114:
	mov r0, #0x8f
	bx lr
_02237118:
	mov r0, #0x8f
	bx lr
_0223711C:
	mov r0, #0x81
	bx lr
	thumb_func_end ov80_022370F4

	thumb_func_start ov80_02237120
ov80_02237120: ; 0x02237120
	ldrb r0, [r0, #5]
	cmp r0, #0
	bne _0223712A
	mov r0, #0x32
	bx lr
_0223712A:
	mov r0, #0x64
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02237120

	thumb_func_start ov80_02237130
ov80_02237130: ; 0x02237130
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #6
	mov r3, #0xa
	lsl r3, r3, #6
	str r0, [sp, #4]
	mov r0, #0xb
	str r0, [sp, #8]
	mov r0, #0xcd
	add r1, r3, #0
	add r2, r3, #0
	str r0, [sp, #0xc]
	add r0, r5, r3
	sub r1, #0x2c
	sub r2, #0x20
	sub r3, #0x18
	add r1, r5, r1
	add r2, r5, r2
	add r3, r5, r3
	bl ov80_0222A52C
	ldr r0, _022371A8 ; =0x000004D4
	ldr r0, [r5, r0]
	bl SavArray_Party_init
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	mov r0, #0xa
	lsl r0, r0, #6
	mov r7, #0
	add r4, r5, r0
_02237178:
	add r0, r5, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r0, _022371AC ; =0x000004F8
	ldr r1, _022371A8 ; =0x000004D4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r6, #0
	bl ov80_0222A3BC
	add r7, r7, #1
	add r4, #0x38
	cmp r7, #6
	blt _02237178
	add r0, r6, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022371A8: .word 0x000004D4
_022371AC: .word 0x000004F8
	thumb_func_end ov80_02237130

	thumb_func_start ov80_022371B0
ov80_022371B0: ; 0x022371B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x84
	add r5, r0, #0
	ldr r0, _02237248 ; =0x000004D4
	ldr r0, [r5, r0]
	bl GetPartyCount
	add r4, r0, #0
	cmp r4, #2
	ble _022371D4
	ldr r6, _02237248 ; =0x000004D4
_022371C6:
	ldr r0, [r5, r6]
	sub r1, r4, #1
	bl RemoveMonFromParty
	sub r4, r4, #1
	cmp r4, #2
	bgt _022371C6
_022371D4:
	ldr r3, _0223724C ; =0x00000584
	mov r0, #0
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #0xb
	add r2, r3, #0
	str r0, [sp, #8]
	mov r0, #0xcd
	add r1, r5, r3
	add r2, #0xc
	add r3, #0x14
	str r0, [sp, #0xc]
	add r0, sp, #0x14
	add r2, r5, r2
	add r3, r5, r3
	bl ov80_0222A52C
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #0x10]
	add r6, sp, #0x14
	add r4, r5, #0
_02237208:
	add r0, r5, #0
	bl ov80_02237120
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl ov80_0222A140
	ldr r0, _02237250 ; =0x000004F8
	ldr r1, _02237248 ; =0x000004D4
	ldr r0, [r5, r0]
	ldr r1, [r5, r1]
	add r2, r7, #0
	bl ov80_0222A3BC
	ldr r0, _0223724C ; =0x00000584
	add r6, #0x38
	ldrh r1, [r4, r0]
	sub r0, #0x98
	strh r1, [r4, r0]
	ldr r0, [sp, #0x10]
	add r4, r4, #2
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #2
	blt _02237208
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x84
	pop {r4, r5, r6, r7, pc}
	nop
_02237248: .word 0x000004D4
_0223724C: .word 0x00000584
_02237250: .word 0x000004F8
	thumb_func_end ov80_022371B0

	thumb_func_start ov80_02237254
ov80_02237254: ; 0x02237254
	cmp r0, #2
	beq _0223725C
	cmp r0, #3
	bne _02237260
_0223725C:
	mov r0, #1
	bx lr
_02237260:
	mov r0, #0
	bx lr
	thumb_func_end ov80_02237254

	thumb_func_start ov80_02237264
ov80_02237264: ; 0x02237264
	push {r3, lr}
	ldrb r1, [r0, #4]
	cmp r1, #0
	bne _02237284
	ldrb r1, [r0, #6]
	lsl r1, r1, #1
	add r1, r0, r1
	ldrh r2, [r1, #0x18]
	ldr r1, _022372B0 ; =0x0000FECB
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #1
	bhi _02237284
	mov r0, #7
	pop {r3, pc}
_02237284:
	bl ov80_022372B4
	add r0, r0, #1
	mov r1, #7
	cmp r0, #4
	bhi _022372AC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223729C: ; jump table
	.short _022372AC - _0223729C - 2 ; case 0
	.short _022372A6 - _0223729C - 2 ; case 1
	.short _022372A6 - _0223729C - 2 ; case 2
	.short _022372AA - _0223729C - 2 ; case 3
	.short _022372AA - _0223729C - 2 ; case 4
_022372A6:
	mov r1, #0
	b _022372AC
_022372AA:
	mov r1, #1
_022372AC:
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
_022372B0: .word 0x0000FECB
	thumb_func_end ov80_02237264

	thumb_func_start ov80_022372B4
ov80_022372B4: ; 0x022372B4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #4]
	ldrh r4, [r5, #0xe]
	bl ov80_02237254
	cmp r0, #1
	bne _022372D0
	ldr r0, _022372D4 ; =0x0000057E
	ldrh r1, [r5, r0]
	ldrh r0, [r5, #0xe]
	cmp r1, r0
	bls _022372D0
	add r4, r1, #0
_022372D0:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022372D4: .word 0x0000057E
	thumb_func_end ov80_022372B4

	thumb_func_start ov80_022372D8
ov80_022372D8: ; 0x022372D8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r3, #0
	add r0, r2, #0
	str r1, [sp]
	mov r4, #0
	bl ov80_022379C0
	lsl r1, r5, #0x19
	lsl r0, r0, #0x18
	ldr r2, [sp, #0x18]
	lsr r1, r1, #0x17
	add r5, r2, r1
	ldr r1, _0223732C ; =ov80_0223C698
	lsr r0, r0, #0x14
	add r7, r1, r0
	ldr r1, _02237330 ; =ov80_0223C608
	lsl r0, r6, #3
	add r6, r1, r0
_022372FE:
	bl LCRandom
	mov r1, #0xc
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	cmp r0, #8
	bhs _02237316
	lsl r0, r0, #1
	ldrh r0, [r7, r0]
	b _0223731E
_02237316:
	lsl r0, r0, #1
	add r0, r6, r0
	sub r0, #0x10
	ldrh r0, [r0]
_0223731E:
	strh r0, [r5]
	ldr r0, [sp]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, r0
	blt _022372FE
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223732C: .word ov80_0223C698
_02237330: .word ov80_0223C608
	thumb_func_end ov80_022372D8

	thumb_func_start ov80_02237334
ov80_02237334: ; 0x02237334
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, [sp, #0x34]
	str r1, [sp]
	str r0, [sp, #0x34]
	mov r0, #0
	str r0, [sp, #0x10]
	add r0, sp, #0x20
	ldrb r4, [r0, #0x10]
	add r6, r2, #0
	lsl r0, r4, #0x19
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r3, #0
	bl ov80_022379C0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	cmp r5, #0
	bne _0223738E
	mov r0, #0xa
	add r1, r4, #1
	mul r0, r6
	add r0, r1, r0
	cmp r0, #0x32
	bne _0223737A
	ldr r0, [sp, #8]
	ldr r2, _0223743C ; =0x00000133
	lsl r1, r0, #1
	ldr r0, [sp, #0x34]
	add sp, #0x1c
	strh r2, [r0, r1]
	pop {r4, r5, r6, r7, pc}
_0223737A:
	cmp r0, #0xaa
	bne _0223738E
	ldr r0, [sp, #8]
	mov r2, #0x4d
	lsl r1, r0, #1
	ldr r0, [sp, #0x34]
	lsl r2, r2, #2
	strh r2, [r0, r1]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_0223738E:
	ldr r0, [sp, #8]
	lsl r1, r0, #1
	ldr r0, [sp, #0x34]
	add r0, r0, r1
	str r0, [sp, #0xc]
_02237398:
	bl LCRandom
	mov r1, #0x4b
	lsl r1, r1, #2
	bl _u32_div_f
	lsl r0, r1, #0x10
	lsr r4, r0, #0x10
	ldr r1, [sp, #8]
	ldr r0, [sp, #0x10]
	str r4, [sp, #0x14]
	add r5, r1, r0
	lsl r0, r5, #1
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	lsl r1, r0, #4
	ldr r0, _02237440 ; =ov80_0223C698
	add r7, r0, r1
_022373BC:
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x18]
	ldrh r6, [r1, r0]
	ldr r0, _02237444 ; =ov80_0223C738
	lsl r1, r4, #1
	ldrh r0, [r0, r1]
	cmp r6, r0
	bne _022373F6
	mov r1, #0
	cmp r5, #0
	ble _022373E2
	ldr r2, [sp, #0x34]
_022373D4:
	ldrh r0, [r2]
	cmp r4, r0
	beq _022373E2
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, r5
	blt _022373D4
_022373E2:
	cmp r1, r5
	bne _022373F6
	ldr r0, [sp, #0xc]
	strh r4, [r0]
	add r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	b _0223742E
_022373F6:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #0x4b
	lsl r0, r0, #2
	cmp r4, r0
	blo _02237406
	mov r4, #0
_02237406:
	ldr r0, [sp, #0x14]
	cmp r4, r0
	bne _022373BC
_0223740C:
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x1d
	sub r2, r2, r1
	mov r0, #0x1d
	ror r2, r0
	add r0, r1, r2
	lsl r0, r0, #0x10
	lsr r0, r0, #0xf
	ldrh r2, [r7, r0]
	cmp r6, r2
	beq _0223740C
	ldr r1, [sp, #0x34]
	ldr r0, [sp, #0x18]
	strh r2, [r1, r0]
	b _022373BC
_0223742E:
	add r1, r0, #0
	ldr r0, [sp]
	cmp r1, r0
	blt _02237398
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223743C: .word 0x00000133
_02237440: .word ov80_0223C698
_02237444: .word ov80_0223C738
	thumb_func_end ov80_02237334

	thumb_func_start ov80_02237448
ov80_02237448: ; 0x02237448
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [sp, #0x28]
	mov r7, #0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x30]
	ldr r6, [sp, #0x2c]
	str r0, [sp, #0x30]
	lsl r0, r3, #0x19
	lsr r4, r0, #0x18
	add r0, r2, #0
	str r7, [sp, #0xc]
	bl ov80_022379C0
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _022374CE
	ldr r3, _022375B8 ; =ov80_0223C990
	add r2, r7, #0
_02237476:
	lsl r0, r2, #1
	ldrh r1, [r3, r0]
	ldr r0, [sp, #0x28]
	cmp r0, r1
	bne _02237484
	add r5, r2, #0
	b _02237490
_02237484:
	add r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	ldr r0, _022375BC ; =0x000001DD
	cmp r2, r0
	blo _02237476
_02237490:
	ldr r0, _022375BC ; =0x000001DD
	cmp r2, r0
	bne _0223749A
	add r5, r0, #0
	sub r5, #0x65
_0223749A:
	ldr r0, _022375C0 ; =ov80_0223C5A8
	mov r1, #0
_0223749E:
	lsl r2, r1, #2
	add r2, r0, r2
	ldrh r2, [r2, #2]
	cmp r5, r2
	blo _022374B2
	add r1, r1, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #4
	blo _0223749E
_022374B2:
	cmp r1, #4
	bne _022374B8
	mov r1, #3
_022374B8:
	ldr r0, [sp, #0x30]
	cmp r0, #2
	bne _022374C4
	ldr r0, _022375C4 ; =ov80_0223C5B4
	str r0, [sp, #0x10]
	b _022374D6
_022374C4:
	ldr r2, _022375C0 ; =ov80_0223C5A8
	lsl r0, r1, #2
	add r0, r2, r0
	str r0, [sp, #0x10]
	b _022374D6
_022374CE:
	ldr r1, _022375C8 ; =ov80_0223C5E0
	lsl r0, r2, #2
	add r0, r1, r0
	str r0, [sp, #0x10]
_022374D6:
	ldr r0, [sp, #0x10]
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	sub r0, r1, r0
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	ldr r0, [sp, #0x10]
	ldrh r0, [r0]
	add r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	sub r0, r0, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	str r2, [sp, #8]
	ldr r0, [sp]
	cmp r0, #0
	ble _022375B4
	sub r0, r4, #2
	lsl r0, r0, #1
	mov ip, r0
	lsl r0, r4, #1
	add r5, r6, r0
_02237510:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _02237532
	mov r0, #0
	cmp r4, #0
	ble _02237542
	add r1, r2, #1
_0223751E:
	lsl r3, r0, #1
	ldrh r3, [r6, r3]
	cmp r1, r3
	beq _02237542
	add r0, r0, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, r4
	blt _0223751E
	b _02237542
_02237532:
	mov r1, ip
	ldrh r1, [r6, r1]
	add r0, r2, #1
	cmp r0, r1
	bne _02237540
	mov r0, #0
	b _02237542
_02237540:
	add r0, r4, #0
_02237542:
	cmp r0, r4
	bne _0223758A
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _02237562
	ldr r0, _022375B8 ; =ov80_0223C990
	lsl r1, r2, #1
	ldrh r1, [r0, r1]
	ldr r0, [sp, #0x28]
	cmp r0, r1
	beq _0223758A
	lsl r0, r7, #1
	add r1, r2, #1
	strh r1, [r5, r0]
	add r7, r7, #1
	b _0223758A
_02237562:
	ldr r1, _022375CC ; =ov80_0223CD4A
	lsl r0, r2, #2
	add r3, r1, r0
	ldrh r1, [r1, r0]
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _02237576
	ldrh r1, [r3, #2]
	cmp r0, r1
	bne _0223758A
_02237576:
	ldr r0, _022375B8 ; =ov80_0223C990
	lsl r1, r2, #1
	ldrh r1, [r0, r1]
	ldr r0, [sp, #0x28]
	cmp r0, r1
	beq _0223758A
	lsl r0, r7, #1
	add r1, r2, #1
	strh r1, [r5, r0]
	add r7, r7, #1
_0223758A:
	ldr r1, [sp, #0x10]
	add r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	ldrh r1, [r1, #2]
	add r0, r2, #1
	cmp r0, r1
	blt _022375A4
	ldr r0, [sp, #0x10]
	ldrh r0, [r0]
	sub r0, r0, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_022375A4:
	ldr r0, [sp, #8]
	cmp r2, r0
	bne _022375AE
	mov r0, #1
	str r0, [sp, #0xc]
_022375AE:
	ldr r0, [sp]
	cmp r7, r0
	blt _02237510
_022375B4:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022375B8: .word ov80_0223C990
_022375BC: .word 0x000001DD
_022375C0: .word ov80_0223C5A8
_022375C4: .word ov80_0223C5B4
_022375C8: .word ov80_0223C5E0
_022375CC: .word ov80_0223CD4A
	thumb_func_end ov80_02237448

	thumb_func_start ov80_022375D0
ov80_022375D0: ; 0x022375D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	add r5, r0, #0
	ldrb r0, [r5, #5]
	add r6, r1, #0
	lsl r0, r0, #0x19
	lsr r7, r0, #0x18
	ldrb r0, [r5, #4]
	bl ov80_0223787C
	str r0, [sp, #0x18]
	ldrb r0, [r5, #4]
	bl ov80_02237888
	str r0, [sp, #0x10]
	ldr r0, _02237818 ; =0x000006FC
	ldr r0, [r5, r0]
	bl SavArray_PlayerParty_get
	str r0, [sp, #0x1c]
	bl HealParty
	ldrb r0, [r5, #4]
	bl ov80_02237850
	add r1, r0, #0
	mov r0, #0xb
	bl BattleStruct_new
	ldr r1, [r6, #0xc]
	add r4, r0, #0
	str r1, [sp]
	ldr r1, [r6, #0x1c]
	str r1, [sp, #4]
	ldr r2, [r6, #8]
	ldr r3, [r6, #0x18]
	mov r1, #0
	bl sub_02051D18
	mov r0, #0x53
	mov r1, #0x16
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x18]
	bl InitPartyWithMaxSize
	mov r0, #0xb
	bl AllocMonZeroed
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	mov r6, #0
	cmp r0, #0
	ble _02237668
_02237642:
	mov r1, #0x26
	add r2, r5, r6
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	ldr r0, [sp, #0x1c]
	bl GetPartyMonByIndex
	ldr r1, [sp, #0x20]
	bl CopyPokemonToPokemon
	ldr r1, [sp, #0x20]
	add r0, r4, #0
	mov r2, #0
	bl sub_02051C9C
	ldr r0, [sp, #0x18]
	add r6, r6, #1
	cmp r6, r0
	blt _02237642
_02237668:
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	add r0, r4, #0
	bl sub_02052580
	lsl r0, r7, #1
	str r0, [sp, #0x28]
	add r6, r5, #0
	ldr r1, [sp, #0x28]
	add r6, #0x18
	ldrh r1, [r6, r1]
	add r0, sp, #0x34
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	add r1, sp, #0x34
	mov r3, #1
	bl ov80_0222A480
	ldr r0, [r4, #8]
	ldr r1, [sp, #0x10]
	bl InitPartyWithMaxSize
	ldr r1, _0223781C ; =0x000006F5
	ldrb r2, [r5, #4]
	ldrb r0, [r5, r1]
	add r1, #0xf
	add r3, r5, r1
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r3, r1
	bl sub_02030BD0
	str r0, [sp, #0x24]
	ldrb r0, [r5, #4]
	cmp r0, #2
	bne _022376C6
	mov r0, #9
	str r0, [sp, #0x24]
_022376C6:
	ldr r2, [sp, #0x24]
	add r0, r5, #0
	add r1, r7, #0
	bl ov80_02237980
	mov r2, #0
	add r1, r4, #0
_022376D4:
	add r2, r2, #1
	str r0, [r1, #0x34]
	add r1, #0x34
	cmp r2, #4
	blt _022376D4
	mov r0, #0x38
	mul r0, r7
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	mov r3, #0x29
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	mov r0, #0xce
	str r0, [sp, #8]
	ldr r2, [sp, #0x28]
	lsl r3, r3, #4
	add r1, r5, r3
	ldr r0, [sp, #0x14]
	ldrh r2, [r6, r2]
	sub r3, #0x28
	add r0, r1, r0
	add r6, r5, r3
	lsl r3, r7, #1
	ldr r1, [sp, #0x24]
	add r3, r6, r3
	bl ov80_02237894
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _0223776E
	mov r0, #0x29
	lsl r0, r0, #4
	add r0, r5, r0
	str r0, [sp, #0x2c]
	mov r0, #0x38
	mul r0, r7
	str r0, [sp, #0x30]
_0223772C:
	add r0, r5, #0
	add r1, r7, #0
	bl ov80_02237820
	cmp r0, #0
	bne _0223772C
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	bl ov80_022378F8
	add r2, r0, #0
	lsl r2, r2, #0x18
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	lsr r2, r2, #0x18
	add r0, r1, r0
	add r1, r6, #0
	bl ov80_0222A140
	add r0, r6, #0
	bl UpdateMonAbility
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #1
	bl sub_02051C9C
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _0223772C
_0223776E:
	add r0, r6, #0
	bl FreeToHeap
	ldrb r0, [r5, #4]
	cmp r0, #2
	beq _0223777E
	cmp r0, #3
	bne _02237810
_0223777E:
	add r0, r4, #0
	bl sub_02052580
	bl sub_0203769C
	mov r1, #1
	sub r0, r1, r0
	bl sub_02034818
	mov r1, #1
	lsl r1, r1, #8
	ldr r1, [r4, r1]
	bl PlayerProfile_copy
	add r1, r7, #1
	lsl r1, r1, #1
	add r1, r5, r1
	ldrh r1, [r1, #0x18]
	add r0, sp, #0x34
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0x10]
	add r0, r4, #0
	add r1, sp, #0x34
	mov r3, #3
	bl ov80_0222A480
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #0x10]
	bl InitPartyWithMaxSize
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
_022377D0:
	add r0, r5, #0
	add r1, r7, #0
	bl ov80_02237820
	cmp r0, #0
	bne _022377D0
	ldr r1, [sp, #0x24]
	add r0, r5, #0
	bl ov80_022378F8
	add r2, r0, #0
	mov r0, #0x29
	lsl r0, r0, #4
	add r1, r5, r0
	ldr r0, [sp, #0x14]
	lsl r2, r2, #0x18
	add r0, r1, r0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl ov80_0222A140
	add r0, r6, #0
	bl UpdateMonAbility
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #3
	bl sub_02051C9C
	add r0, r6, #0
	bl FreeToHeap
_02237810:
	add r0, r4, #0
	add sp, #0x64
	pop {r4, r5, r6, r7, pc}
	nop
_02237818: .word 0x000006FC
_0223781C: .word 0x000006F5
	thumb_func_end ov80_022375D0

	thumb_func_start ov80_02237820
ov80_02237820: ; 0x02237820
	push {r4, lr}
	mov r2, #0x38
	mul r2, r1
	mov r1, #0x2a
	lsl r1, r1, #4
	add r1, r0, r1
	ldr r4, [r1, r2]
	ldr r3, _0223784C ; =0x0003D0A9
	cmp r4, r3
	bls _02237838
	sub r3, r4, r3
	b _0223783A
_02237838:
	add r3, r4, r3
_0223783A:
	str r3, [r1, r2]
	add r3, r0, r2
	mov r0, #0xa7
	lsl r0, r0, #2
	ldr r0, [r3, r0]
	ldr r1, [r1, r2]
	bl CalcShininessByOtIdAndPersonality
	pop {r4, pc}
	.balign 4, 0
_0223784C: .word 0x0003D0A9
	thumb_func_end ov80_02237820

	thumb_func_start ov80_02237850
ov80_02237850: ; 0x02237850
	cmp r0, #3
	bhi _02237878
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237860: ; jump table
	.short _02237868 - _02237860 - 2 ; case 0
	.short _0223786C - _02237860 - 2 ; case 1
	.short _02237870 - _02237860 - 2 ; case 2
	.short _02237874 - _02237860 - 2 ; case 3
_02237868:
	mov r0, #0x81
	bx lr
_0223786C:
	mov r0, #0x83
	bx lr
_02237870:
	mov r0, #0x8f
	bx lr
_02237874:
	mov r0, #0x8f
	bx lr
_02237878:
	mov r0, #0x81
	bx lr
	thumb_func_end ov80_02237850

	thumb_func_start ov80_0223787C
ov80_0223787C: ; 0x0223787C
	cmp r0, #1
	bne _02237884
	mov r0, #2
	bx lr
_02237884:
	mov r0, #1
	bx lr
	thumb_func_end ov80_0223787C

	thumb_func_start ov80_02237888
ov80_02237888: ; 0x02237888
	cmp r0, #1
	bne _02237890
	mov r0, #2
	bx lr
_02237890:
	mov r0, #1
	bx lr
	thumb_func_end ov80_02237888

	thumb_func_start ov80_02237894
ov80_02237894: ; 0x02237894
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r0, #0
	ldr r0, [sp, #0x2c]
	add r5, r3, #0
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	ldr r7, [sp, #0x28]
	str r0, [sp, #0x30]
	ldr r0, _022378F4 ; =0x00000133
	cmp r2, r0
	bne _022378B0
	mov r0, #0x1f
	b _022378C0
_022378B0:
	add r0, r0, #1
	cmp r2, r0
	bne _022378BA
	mov r0, #0x1f
	b _022378C0
_022378BA:
	add r0, r1, #0
	bl ov80_0223796C
_022378C0:
	mov r4, #0
	cmp r7, #0
	ble _022378EE
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
_022378CC:
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	ldr r3, [sp, #0xc]
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	add r2, r4, #0
	str r0, [sp, #8]
	ldrh r1, [r5]
	add r0, r6, #0
	bl ov80_0222A4EC
	add r4, r4, #1
	add r5, r5, #2
	add r6, #0x38
	cmp r4, r7
	blt _022378CC
_022378EE:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022378F4: .word 0x00000133
	thumb_func_end ov80_02237894

	thumb_func_start ov80_022378F8
ov80_022378F8: ; 0x022378F8
	push {r3, lr}
	ldrb r1, [r0, #5]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x17
	add r1, r0, r1
	ldrh r2, [r1, #0x18]
	ldr r1, _0223791C ; =0x0000FECD
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #1
	bhi _02237916
	bl ov80_022379C8
	pop {r3, pc}
_02237916:
	ldrb r0, [r0, #7]
	pop {r3, pc}
	nop
_0223791C: .word 0x0000FECD
	thumb_func_end ov80_022378F8

	thumb_func_start ov80_02237920
ov80_02237920: ; 0x02237920
	ldr r1, _02237928 ; =ov80_0223D4C0
	ldrb r0, [r1, r0]
	bx lr
	nop
_02237928: .word ov80_0223D4C0
	thumb_func_end ov80_02237920

	thumb_func_start ov80_0223792C
ov80_0223792C: ; 0x0223792C
	cmp r0, #2
	beq _02237934
	cmp r0, #3
	bne _02237938
_02237934:
	mov r0, #1
	bx lr
_02237938:
	mov r0, #0
	bx lr
	thumb_func_end ov80_0223792C

	thumb_func_start ov80_0223793C
ov80_0223793C: ; 0x0223793C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _02237968 ; =0x000006FC
	ldr r0, [r4, r0]
	bl SavArray_PlayerParty_get
	mov r1, #0x26
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	bl GetPartyMonByIndex
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r4, pc}
	nop
_02237968: .word 0x000006FC
	thumb_func_end ov80_0223793C

	thumb_func_start ov80_0223796C
ov80_0223796C: ; 0x0223796C
	push {r3, lr}
	bl ov80_022379C0
	lsl r1, r0, #2
	ldr r0, _0223797C ; =ov80_0223C5B8
	ldrb r0, [r0, r1]
	pop {r3, pc}
	nop
_0223797C: .word ov80_0223C5B8
	thumb_func_end ov80_0223796C

	thumb_func_start ov80_02237980
ov80_02237980: ; 0x02237980
	add r2, r2, #1
	cmp r2, #8
	blt _0223798A
	mov r2, #7
	b _02237994
_0223798A:
	cmp r2, #4
	blt _02237992
	mov r2, #1
	b _02237994
_02237992:
	mov r2, #0
_02237994:
	ldrb r3, [r0, #4]
	cmp r3, #0
	bne _022379B0
	lsl r1, r1, #0x19
	lsr r1, r1, #0x17
	add r0, r0, r1
	ldrh r1, [r0, #0x18]
	ldr r0, _022379BC ; =0x0000FECD
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _022379B0
	mov r2, #7
_022379B0:
	cmp r3, #2
	bne _022379B6
	mov r2, #7
_022379B6:
	add r0, r2, #0
	bx lr
	nop
_022379BC: .word 0x0000FECD
	thumb_func_end ov80_02237980

	thumb_func_start ov80_022379C0
ov80_022379C0: ; 0x022379C0
	cmp r0, #0xa
	blo _022379C6
	mov r0, #9
_022379C6:
	bx lr
	thumb_func_end ov80_022379C0

	thumb_func_start ov80_022379C8
ov80_022379C8: ; 0x022379C8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02237A34 ; =0x000006FC
	ldr r0, [r5, r0]
	bl SavArray_PlayerParty_get
	mov r1, #0x26
	lsl r1, r1, #4
	ldrb r1, [r5, r1]
	add r6, r0, #0
	bl GetPartyMonByIndex
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldrb r0, [r5, #4]
	bl ov80_0223787C
	cmp r0, #2
	bne _02237A16
	ldr r1, _02237A38 ; =0x00000261
	add r0, r6, #0
	ldrb r1, [r5, r1]
	bl GetPartyMonByIndex
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r4, r0
	bhi _02237A12
	add r4, r0, #0
_02237A12:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_02237A16:
	ldrb r0, [r5, #4]
	bl ov80_0223792C
	cmp r0, #1
	bne _02237A2E
	ldr r0, _02237A3C ; =0x00000D84
	ldrh r0, [r5, r0]
	cmp r4, r0
	bhi _02237A2A
	add r4, r0, #0
_02237A2A:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_02237A2E:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02237A34: .word 0x000006FC
_02237A38: .word 0x00000261
_02237A3C: .word 0x00000D84
	thumb_func_end ov80_022379C8

	thumb_func_start ov80_02237A40
ov80_02237A40: ; 0x02237A40
	push {r3, lr}
	cmp r0, #0
	beq _02237A58
	lsl r0, r0, #0xc
	bl _ffltu
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02237A66
_02237A58:
	lsl r0, r0, #0xc
	bl _ffltu
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02237A66:
	bl _ffix
	bl FX_Sqrt
	pop {r3, pc}
	thumb_func_end ov80_02237A40

	thumb_func_start ov80_02237A70
ov80_02237A70: ; 0x02237A70
	push {r3, r4, r5, lr}
	cmp r0, #0
	bne _02237A8E
	mov r0, #7
	add r3, r2, #1
	mul r0, r1
	add r0, r3, r0
	cmp r0, #0x15
	bne _02237A86
	ldr r0, _02237AC4 ; =0x00000139
	pop {r3, r4, r5, pc}
_02237A86:
	cmp r0, #0x31
	bne _02237A8E
	ldr r0, _02237AC8 ; =0x0000013A
	pop {r3, r4, r5, pc}
_02237A8E:
	cmp r1, #8
	blo _02237A94
	mov r1, #7
_02237A94:
	cmp r2, #6
	beq _02237A9C
	cmp r2, #0xd
	bne _02237AAA
_02237A9C:
	ldr r0, _02237ACC ; =ov80_0223D4D8
	lsl r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02237AD0 ; =ov80_0223D4DA
	ldrh r0, [r0, r1]
	sub r5, r0, r4
	b _02237AB6
_02237AAA:
	ldr r0, _02237AD4 ; =ov80_0223D4D4
	lsl r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02237AD8 ; =ov80_0223D4D6
	ldrh r0, [r0, r1]
	sub r5, r0, r4
_02237AB6:
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	add r0, r4, r1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02237AC4: .word 0x00000139
_02237AC8: .word 0x0000013A
_02237ACC: .word ov80_0223D4D8
_02237AD0: .word ov80_0223D4DA
_02237AD4: .word ov80_0223D4D4
_02237AD8: .word ov80_0223D4D6
	thumb_func_end ov80_02237A70

	thumb_func_start ov80_02237ADC
ov80_02237ADC: ; 0x02237ADC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r2, #0
	str r0, [sp]
	str r1, [sp, #4]
	add r7, r3, #0
	mov r4, #0
	add r5, r6, #0
_02237AEC:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r4, #0
	bl ov80_02237A70
	mov r1, #0
	strh r0, [r5]
	cmp r4, #0
	ble _02237B12
	lsl r0, r4, #1
	ldrh r3, [r6, r0]
	add r2, r6, #0
_02237B04:
	ldrh r0, [r2]
	cmp r0, r3
	beq _02237B12
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, r4
	blt _02237B04
_02237B12:
	cmp r1, r4
	bne _02237B1A
	add r5, r5, #2
	add r4, r4, #1
_02237B1A:
	cmp r4, r7
	blt _02237AEC
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02237ADC

	thumb_func_start ov80_02237B24
ov80_02237B24: ; 0x02237B24
	push {r3, lr}
	cmp r0, #3
	bhi _02237B4E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237B36: ; jump table
	.short _02237B3E - _02237B36 - 2 ; case 0
	.short _02237B3E - _02237B36 - 2 ; case 1
	.short _02237B42 - _02237B36 - 2 ; case 2
	.short _02237B42 - _02237B36 - 2 ; case 3
_02237B3E:
	mov r0, #3
	pop {r3, pc}
_02237B42:
	cmp r1, #0
	bne _02237B4A
	mov r0, #2
	pop {r3, pc}
_02237B4A:
	mov r0, #4
	pop {r3, pc}
_02237B4E:
	bl GF_AssertFail
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02237B24

	thumb_func_start ov80_02237B58
ov80_02237B58: ; 0x02237B58
	push {r3, lr}
	cmp r0, #3
	bhi _02237B82
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237B6A: ; jump table
	.short _02237B72 - _02237B6A - 2 ; case 0
	.short _02237B72 - _02237B6A - 2 ; case 1
	.short _02237B76 - _02237B6A - 2 ; case 2
	.short _02237B76 - _02237B6A - 2 ; case 3
_02237B72:
	mov r0, #3
	pop {r3, pc}
_02237B76:
	cmp r1, #0
	bne _02237B7E
	mov r0, #2
	pop {r3, pc}
_02237B7E:
	mov r0, #4
	pop {r3, pc}
_02237B82:
	bl GF_AssertFail
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02237B58

	thumb_func_start ov80_02237B8C
ov80_02237B8C: ; 0x02237B8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	add r6, r1, #0
	mov r1, #0
	bl ov80_02237B24
	str r0, [sp, #0x10]
	ldrb r0, [r5, #0x10]
	mov r1, #0
	bl ov80_02237B58
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x2c]
	bl HealParty
	ldrb r0, [r5, #0x10]
	bl ov80_02237D5C
	add r1, r0, #0
	mov r0, #0xb
	bl BattleStruct_new
	ldr r1, [r6, #0xc]
	add r4, r0, #0
	str r1, [sp]
	ldr r1, [r6, #0x1c]
	str r1, [sp, #4]
	ldr r2, [r6, #8]
	ldr r3, [r6, #0x18]
	mov r1, #0
	bl sub_02051D18
	mov r0, #0x53
	mov r1, #0x15
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r0, #4
	str r1, [r4, r0]
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x10]
	bl InitPartyWithMaxSize
	bl sub_0203769C
	cmp r0, #0
	bne _02237BF0
	mov r6, #0
	b _02237BF2
_02237BF0:
	mov r6, #2
_02237BF2:
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _02237C2A
_02237C04:
	ldr r0, [r5, #0x28]
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r1, r7, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #0
	bl sub_02051C9C
	ldr r0, [sp, #0x14]
	add r6, r6, #1
	add r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0x14]
	cmp r1, r0
	blt _02237C04
_02237C2A:
	add r0, r7, #0
	bl FreeToHeap
	add r0, r4, #0
	bl sub_02052580
	ldrb r1, [r5, #0x11]
	add r0, sp, #0x18
	mov r2, #0xb
	lsl r1, r1, #1
	add r1, r5, r1
	ldrh r1, [r1, #0x30]
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, sp, #0x18
	mov r3, #1
	bl ov80_0222A480
	ldrb r0, [r5, #0x10]
	mov r1, #0
	bl ov80_02237B58
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl InitPartyWithMaxSize
	mov r7, #0
	add r6, r4, #0
_02237C70:
	add r0, r5, #0
	bl ov80_02237E88
	str r0, [r6, #0x34]
	add r7, r7, #1
	add r6, #0x34
	cmp r7, #4
	blt _02237C70
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	ldr r0, [sp, #0xc]
	mov r6, #0
	cmp r0, #0
	ble _02237CB0
_02237C90:
	ldr r0, [r5, #0x2c]
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r1, r7, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #1
	bl sub_02051C9C
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	cmp r6, r0
	blt _02237C90
_02237CB0:
	add r0, r7, #0
	bl FreeToHeap
	ldrb r0, [r5, #0x10]
	cmp r0, #2
	beq _02237CC0
	cmp r0, #3
	bne _02237D54
_02237CC0:
	add r0, r4, #0
	bl sub_02052580
	bl sub_0203769C
	mov r1, #1
	sub r0, r1, r0
	bl sub_02034818
	mov r1, #1
	lsl r1, r1, #8
	ldr r1, [r4, r1]
	bl PlayerProfile_copy
	ldrb r1, [r5, #0x11]
	add r0, sp, #0x18
	mov r2, #0xb
	add r1, r1, #7
	lsl r1, r1, #1
	add r1, r5, r1
	ldrh r1, [r1, #0x30]
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, sp, #0x18
	mov r3, #3
	bl ov80_0222A480
	ldrb r0, [r5, #0x10]
	mov r1, #0
	bl ov80_02237B58
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	bl InitPartyWithMaxSize
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _02237D4E
	add r6, r0, #0
_02237D28:
	ldr r0, [r5, #0x2c]
	add r1, r6, #0
	bl GetPartyMonByIndex
	add r1, r7, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r7, #0
	mov r2, #3
	bl sub_02051C9C
	ldr r0, [sp, #8]
	add r6, r6, #1
	add r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	cmp r1, r0
	blt _02237D28
_02237D4E:
	add r0, r7, #0
	bl FreeToHeap
_02237D54:
	add r0, r4, #0
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02237B8C

	thumb_func_start ov80_02237D5C
ov80_02237D5C: ; 0x02237D5C
	cmp r0, #3
	bhi _02237D84
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237D6C: ; jump table
	.short _02237D74 - _02237D6C - 2 ; case 0
	.short _02237D78 - _02237D6C - 2 ; case 1
	.short _02237D7C - _02237D6C - 2 ; case 2
	.short _02237D80 - _02237D6C - 2 ; case 3
_02237D74:
	mov r0, #0x81
	bx lr
_02237D78:
	mov r0, #0x83
	bx lr
_02237D7C:
	mov r0, #0x8f
	bx lr
_02237D80:
	mov r0, #0x8f
	bx lr
_02237D84:
	mov r0, #0x81
	bx lr
	thumb_func_end ov80_02237D5C

	thumb_func_start ov80_02237D88
ov80_02237D88: ; 0x02237D88
	mov r0, #0x32
	bx lr
	thumb_func_end ov80_02237D88

	thumb_func_start ov80_02237D8C
ov80_02237D8C: ; 0x02237D8C
	cmp r0, #2
	beq _02237D94
	cmp r0, #3
	bne _02237D98
_02237D94:
	mov r0, #1
	bx lr
_02237D98:
	mov r0, #0
	bx lr
	thumb_func_end ov80_02237D8C

	thumb_func_start ov80_02237D9C
ov80_02237D9C: ; 0x02237D9C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl GetPartyCount
	add r6, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _02237DF2
_02237DAC:
	add r0, r7, #0
	add r1, r4, #0
	bl GetPartyMonByIndex
	mov r1, #0xac
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	cmp r0, #0
	beq _02237DEC
	add r0, r5, #0
	mov r1, #0xa3
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _02237DDE
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0xa3
	add r2, sp, #0
	bl SetMonData
_02237DDE:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0xa0
	add r2, sp, #0
	bl SetMonData
_02237DEC:
	add r4, r4, #1
	cmp r4, r6
	blt _02237DAC
_02237DF2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02237D9C

	thumb_func_start ov80_02237DF4
ov80_02237DF4: ; 0x02237DF4
	push {r4, lr}
	sub sp, #8
	ldr r0, [r0, #4]
	add r4, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	mov r3, #0
	add r1, r0, #0
	str r3, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #4
	bl sub_0207217C
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02237DF4

	thumb_func_start ov80_02237E18
ov80_02237E18: ; 0x02237E18
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r1, r4, #0
	bl ov80_02237DF4
	add r0, r5, #0
	add r1, r4, #0
	bl AddMonToParty
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02237E18

	thumb_func_start ov80_02237E30
ov80_02237E30: ; 0x02237E30
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x2c]
	bl SavArray_Party_init
	ldrb r0, [r5, #0x10]
	mov r1, #1
	bl ov80_02237B58
	str r0, [sp]
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	ldr r0, [sp]
	mov r7, #0
	cmp r0, #0
	ble _02237E7E
	mov r0, #0xa2
	lsl r0, r0, #2
	add r4, r5, r0
_02237E5A:
	add r0, r5, #0
	bl ov80_02237D88
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov80_0222A140
	ldr r1, [r5, #0x2c]
	add r0, r5, #0
	add r2, r6, #0
	bl ov80_02237E18
	ldr r0, [sp]
	add r7, r7, #1
	add r4, #0x38
	cmp r7, r0
	blt _02237E5A
_02237E7E:
	add r0, r6, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02237E30

	thumb_func_start ov80_02237E88
ov80_02237E88: ; 0x02237E88
	push {r3, lr}
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	bne _02237EA8
	ldrb r1, [r0, #0x11]
	lsl r1, r1, #1
	add r1, r0, r1
	ldrh r2, [r1, #0x30]
	ldr r1, _02237ED4 ; =0x0000FEC7
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #1
	bhi _02237EA8
	mov r0, #7
	pop {r3, pc}
_02237EA8:
	bl ov80_02237ED8
	add r0, r0, #1
	mov r1, #7
	cmp r0, #4
	bhi _02237ED0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02237EC0: ; jump table
	.short _02237ED0 - _02237EC0 - 2 ; case 0
	.short _02237ECA - _02237EC0 - 2 ; case 1
	.short _02237ECA - _02237EC0 - 2 ; case 2
	.short _02237ECE - _02237EC0 - 2 ; case 3
	.short _02237ECE - _02237EC0 - 2 ; case 4
_02237ECA:
	mov r1, #0
	b _02237ED0
_02237ECE:
	mov r1, #1
_02237ED0:
	add r0, r1, #0
	pop {r3, pc}
	.balign 4, 0
_02237ED4: .word 0x0000FEC7
	thumb_func_end ov80_02237E88

	thumb_func_start ov80_02237ED8
ov80_02237ED8: ; 0x02237ED8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	ldrh r4, [r5, #0x16]
	bl ov80_02237D8C
	cmp r0, #1
	bne _02237EF4
	ldr r0, _02237EF8 ; =0x00000A12
	ldrh r1, [r5, r0]
	ldrh r0, [r5, #0x16]
	cmp r1, r0
	bls _02237EF4
	add r4, r1, #0
_02237EF4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02237EF8: .word 0x00000A12
	thumb_func_end ov80_02237ED8

	thumb_func_start ov80_02237EFC
ov80_02237EFC: ; 0x02237EFC
	push {r3, r4, r5, lr}
	sub sp, #0x48
	add r5, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	bl ov80_02237ED8
	add r1, r0, #0
	add r0, sp, #0xc
	bl ov80_02237F3C
	mov r0, #6
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #3
	lsl r1, r4, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, sp, #0xc
	mov r3, #0xb
	bl LoadRectToBgTilemapRect
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x48
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02237EFC

	thumb_func_start ov80_02237F3C
ov80_02237F3C: ; 0x02237F3C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	add r0, r1, #0
	bl ov80_02237F9C
	mov r3, #0
	add r4, sp, #4
	mov r1, #4
_02237F4E:
	strb r3, [r4]
	sub r2, r1, r3
	strb r2, [r4, #5]
	add r3, r3, #1
	add r4, r4, #1
	cmp r3, #5
	blo _02237F4E
	mov r1, #0x60
	mov r7, #0
	mul r1, r0
	mov r5, #1
	add r1, #0x10
	add r2, r7, #0
	lsl r5, r5, #0xa
_02237F6A:
	ldr r4, [sp]
	lsl r6, r2, #1
	mov r0, #0
	add r3, sp, #4
	add r4, r4, r6
_02237F74:
	ldrb r6, [r3]
	add r6, r6, r1
	strh r6, [r4]
	cmp r0, #5
	blo _02237F84
	ldrh r6, [r4]
	orr r6, r5
	strh r6, [r4]
_02237F84:
	add r0, r0, #1
	add r3, r3, #1
	add r4, r4, #2
	cmp r0, #0xa
	blo _02237F74
	add r7, r7, #1
	add r1, #0x20
	add r2, #0xa
	cmp r7, #3
	blo _02237F6A
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_02237F3C

	thumb_func_start ov80_02237F9C
ov80_02237F9C: ; 0x02237F9C
	cmp r0, #8
	blo _02237FA2
	mov r0, #7
_02237FA2:
	bx lr
	thumb_func_end ov80_02237F9C

	thumb_func_start ov80_02237FA4
ov80_02237FA4: ; 0x02237FA4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r6, r2, #0
	bl sub_0205C1F0
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205C1F0
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r3, r6, #0
	bl sub_02031248
	add r0, r4, #0
	bl sub_0205C218
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205C218
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl sub_020310BC
	add r1, r0, r6
	ldr r0, _02238030 ; =0x0000270F
	cmp r1, r0
	ble _0223800E
	add r0, r4, #0
	bl sub_0205C218
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C218
	bl sub_0205C268
	add r2, r0, #0
	ldr r3, _02238030 ; =0x0000270F
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02031108
	pop {r3, r4, r5, r6, r7, pc}
_0223800E:
	add r0, r4, #0
	bl sub_0205C218
	add r7, r0, #0
	add r0, r4, #0
	bl sub_0205C218
	bl sub_0205C268
	add r2, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r3, r6, #0
	bl sub_02031228
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238030: .word 0x0000270F
	thumb_func_end ov80_02237FA4

	thumb_func_start ov80_02238034
ov80_02238034: ; 0x02238034
	push {r3, r4, r5, lr}
	cmp r0, #0
	bne _02238054
	mov r0, #7
	add r3, r2, #1
	mul r0, r1
	add r0, r3, r0
	cmp r0, #0x15
	bne _0223804A
	ldr r0, _0223808C ; =0x00000137
	pop {r3, r4, r5, pc}
_0223804A:
	cmp r0, #0x31
	bne _02238054
	mov r0, #0x4e
	lsl r0, r0, #2
	pop {r3, r4, r5, pc}
_02238054:
	cmp r1, #8
	blo _0223805A
	mov r1, #7
_0223805A:
	cmp r2, #6
	beq _02238062
	cmp r2, #0xd
	bne _02238070
_02238062:
	ldr r0, _02238090 ; =ov80_0223D518
	lsl r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _02238094 ; =ov80_0223D51A
	ldrh r0, [r0, r1]
	sub r5, r0, r4
	b _0223807C
_02238070:
	ldr r0, _02238098 ; =ov80_0223D514
	lsl r1, r1, #3
	ldrh r4, [r0, r1]
	ldr r0, _0223809C ; =ov80_0223D516
	ldrh r0, [r0, r1]
	sub r5, r0, r4
_0223807C:
	bl LCRandom
	add r1, r5, #0
	bl _s32_div_f
	add r0, r4, r1
	pop {r3, r4, r5, pc}
	nop
_0223808C: .word 0x00000137
_02238090: .word ov80_0223D518
_02238094: .word ov80_0223D51A
_02238098: .word ov80_0223D514
_0223809C: .word ov80_0223D516
	thumb_func_end ov80_02238034

	thumb_func_start ov80_022380A0
ov80_022380A0: ; 0x022380A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r2, #0
	str r0, [sp]
	str r1, [sp, #4]
	add r7, r3, #0
	mov r4, #0
	add r5, r6, #0
_022380B0:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r4, #0
	bl ov80_02238034
	mov r1, #0
	strh r0, [r5]
	cmp r4, #0
	ble _022380D6
	lsl r0, r4, #1
	ldrh r3, [r6, r0]
	add r2, r6, #0
_022380C8:
	ldrh r0, [r2]
	cmp r0, r3
	beq _022380D6
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, r4
	blt _022380C8
_022380D6:
	cmp r1, r4
	bne _022380DE
	add r5, r5, #2
	add r4, r4, #1
_022380DE:
	cmp r4, r7
	blt _022380B0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_022380A0

	thumb_func_start ov80_022380E8
ov80_022380E8: ; 0x022380E8
	push {r3, lr}
	cmp r0, #3
	bhi _02238112
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022380FA: ; jump table
	.short _02238102 - _022380FA - 2 ; case 0
	.short _02238102 - _022380FA - 2 ; case 1
	.short _02238106 - _022380FA - 2 ; case 2
	.short _02238106 - _022380FA - 2 ; case 3
_02238102:
	mov r0, #3
	pop {r3, pc}
_02238106:
	cmp r1, #0
	bne _0223810E
	mov r0, #2
	pop {r3, pc}
_0223810E:
	mov r0, #4
	pop {r3, pc}
_02238112:
	bl GF_AssertFail
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_022380E8

	thumb_func_start ov80_0223811C
ov80_0223811C: ; 0x0223811C
	push {r3, lr}
	cmp r0, #3
	bhi _02238146
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223812E: ; jump table
	.short _02238136 - _0223812E - 2 ; case 0
	.short _02238136 - _0223812E - 2 ; case 1
	.short _0223813A - _0223812E - 2 ; case 2
	.short _0223813A - _0223812E - 2 ; case 3
_02238136:
	mov r0, #3
	pop {r3, pc}
_0223813A:
	cmp r1, #0
	bne _02238142
	mov r0, #2
	pop {r3, pc}
_02238142:
	mov r0, #4
	pop {r3, pc}
_02238146:
	bl GF_AssertFail
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0223811C

	thumb_func_start ov80_02238150
ov80_02238150: ; 0x02238150
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	add r7, r0, #0
	ldrb r0, [r7, #0x10]
	add r5, r1, #0
	mov r1, #0
	bl ov80_022380E8
	str r0, [sp, #0x10]
	ldrb r0, [r7, #0x10]
	mov r1, #0
	bl ov80_0223811C
	str r0, [sp, #0xc]
	ldrb r0, [r7, #0x10]
	bl ov80_02238344
	add r1, r0, #0
	mov r0, #0xb
	bl BattleStruct_new
	ldr r1, [r5, #0xc]
	add r4, r0, #0
	str r1, [sp]
	ldr r1, [r5, #0x1c]
	str r1, [sp, #4]
	ldr r2, [r5, #8]
	ldr r3, [r5, #0x18]
	mov r1, #0
	bl sub_02051D18
	mov r1, #0x53
	lsl r1, r1, #2
	mov r2, #0x14
	str r2, [r4, r1]
	add r0, r1, #4
	str r2, [r4, r0]
	ldr r0, [r7, #0x14]
	add r1, #0x28
	str r0, [r4, r1]
	ldr r0, [r7, #0x74]
	ldr r1, [r7, #0x70]
	str r0, [sp, #0x14]
	ldrb r0, [r7, #0x13]
	str r1, [sp, #0x18]
	cmp r0, #0x1b
	bne _022381B4
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x18]
	str r1, [sp, #0x14]
_022381B4:
	ldr r0, [r4, #4]
	ldr r1, [sp, #0x10]
	bl InitPartyWithMaxSize
	bl sub_0203769C
	cmp r0, #0
	bne _022381C8
	mov r5, #0
	b _022381CA
_022381C8:
	mov r5, #2
_022381CA:
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	cmp r0, #0
	ble _02238202
_022381DC:
	ldr r0, [sp, #0x18]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r1, r6, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #0
	bl sub_02051C9C
	ldr r0, [sp, #0x1c]
	add r5, r5, #1
	add r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0x1c]
	cmp r1, r0
	blt _022381DC
_02238202:
	add r0, r6, #0
	bl FreeToHeap
	add r0, r4, #0
	bl sub_02052580
	ldrb r1, [r7, #0x11]
	add r0, sp, #0x20
	mov r2, #0xb
	lsl r1, r1, #1
	add r1, r7, r1
	add r1, #0x78
	ldrh r1, [r1]
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, sp, #0x20
	mov r3, #1
	bl ov80_0222A480
	ldrb r0, [r7, #0x10]
	mov r1, #0
	bl ov80_0223811C
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl InitPartyWithMaxSize
	mov r6, #0
	add r5, r4, #0
_0223824A:
	add r0, r7, #0
	bl ov80_02238444
	str r0, [r5, #0x34]
	add r6, r6, #1
	add r5, #0x34
	cmp r6, #4
	blt _0223824A
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	ldr r0, [sp, #0xc]
	mov r5, #0
	cmp r0, #0
	ble _0223828A
_0223826A:
	ldr r0, [sp, #0x14]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r1, r6, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #1
	bl sub_02051C9C
	ldr r0, [sp, #0xc]
	add r5, r5, #1
	cmp r5, r0
	blt _0223826A
_0223828A:
	add r0, r6, #0
	bl FreeToHeap
	ldrb r0, [r7, #0x10]
	cmp r0, #2
	beq _0223829A
	cmp r0, #3
	bne _02238330
_0223829A:
	add r0, r4, #0
	bl sub_02052580
	bl sub_0203769C
	mov r1, #1
	sub r0, r1, r0
	bl sub_02034818
	mov r1, #1
	lsl r1, r1, #8
	ldr r1, [r4, r1]
	bl PlayerProfile_copy
	ldrb r1, [r7, #0x11]
	add r0, sp, #0x20
	mov r2, #0xb
	add r1, r1, #7
	lsl r1, r1, #1
	add r1, r7, r1
	add r1, #0x78
	ldrh r1, [r1]
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	mov r0, #0xb
	str r0, [sp]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, sp, #0x20
	mov r3, #3
	bl ov80_0222A480
	ldrb r0, [r7, #0x10]
	mov r1, #0
	bl ov80_0223811C
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	bl InitPartyWithMaxSize
	mov r0, #0xb
	bl AllocMonZeroed
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	ble _0223832A
	add r5, r0, #0
_02238304:
	ldr r0, [sp, #0x14]
	add r1, r5, #0
	bl GetPartyMonByIndex
	add r1, r6, #0
	bl CopyPokemonToPokemon
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #3
	bl sub_02051C9C
	ldr r0, [sp, #8]
	add r5, r5, #1
	add r1, r0, #1
	ldr r0, [sp, #0xc]
	str r1, [sp, #8]
	cmp r1, r0
	blt _02238304
_0223832A:
	add r0, r6, #0
	bl FreeToHeap
_02238330:
	ldr r0, [r7, #0x70]
	bl HealParty
	ldr r0, [r7, #0x74]
	bl HealParty
	add r0, r4, #0
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02238150

	thumb_func_start ov80_02238344
ov80_02238344: ; 0x02238344
	cmp r0, #3
	bhi _0223836C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02238354: ; jump table
	.short _0223835C - _02238354 - 2 ; case 0
	.short _02238360 - _02238354 - 2 ; case 1
	.short _02238364 - _02238354 - 2 ; case 2
	.short _02238368 - _02238354 - 2 ; case 3
_0223835C:
	mov r0, #0x81
	bx lr
_02238360:
	mov r0, #0x83
	bx lr
_02238364:
	mov r0, #0x8f
	bx lr
_02238368:
	mov r0, #0x8f
	bx lr
_0223836C:
	mov r0, #0x81
	bx lr
	thumb_func_end ov80_02238344

	thumb_func_start ov80_02238370
ov80_02238370: ; 0x02238370
	mov r0, #0x32
	bx lr
	thumb_func_end ov80_02238370

	thumb_func_start ov80_02238374
ov80_02238374: ; 0x02238374
	cmp r0, #2
	beq _0223837C
	cmp r0, #3
	bne _02238380
_0223837C:
	mov r0, #1
	bx lr
_02238380:
	mov r0, #0
	bx lr
	thumb_func_end ov80_02238374

	thumb_func_start ov80_02238384
ov80_02238384: ; 0x02238384
	push {r4, lr}
	sub sp, #8
	ldr r0, [r0, #4]
	add r4, r1, #0
	bl Sav2_PlayerData_GetProfileAddr
	mov r3, #0
	add r1, r0, #0
	str r3, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #4
	bl sub_0207217C
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02238384

	thumb_func_start ov80_022383A8
ov80_022383A8: ; 0x022383A8
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r5, r1, #0
	add r1, r4, #0
	bl ov80_02238384
	add r0, r5, #0
	add r1, r4, #0
	bl AddMonToParty
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_022383A8

	thumb_func_start ov80_022383C0
ov80_022383C0: ; 0x022383C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0x74]
	bl SavArray_Party_init
	ldrb r0, [r5, #0x10]
	mov r1, #1
	bl ov80_0223811C
	str r0, [sp]
	mov r0, #0xb
	bl AllocMonZeroed
	add r7, r0, #0
	ldr r0, [sp]
	mov r6, #0
	cmp r0, #0
	ble _02238424
	mov r0, #0x33
	lsl r0, r0, #4
	add r4, r5, r0
_022383EC:
	add r0, r5, #0
	bl ov80_02238370
	add r2, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl ov80_0222A140
	ldr r1, [r5, #0x74]
	add r0, r5, #0
	add r2, r7, #0
	bl ov80_022383A8
	ldr r0, [r5, #0x74]
	add r1, r6, #0
	bl GetPartyMonByIndex
	mov r1, #0
	str r1, [sp, #4]
	mov r1, #6
	add r2, sp, #4
	bl SetMonData
	ldr r0, [sp]
	add r6, r6, #1
	add r4, #0x38
	cmp r6, r0
	blt _022383EC
_02238424:
	add r0, r7, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_022383C0

	thumb_func_start ov80_02238430
ov80_02238430: ; 0x02238430
	push {r4, lr}
	add r4, r1, #0
	bl ov80_02238498
	cmp r4, #0x1c
	bne _02238440
	mov r0, #1
	pop {r4, pc}
_02238440:
	mov r0, #3
	pop {r4, pc}
	thumb_func_end ov80_02238430

	thumb_func_start ov80_02238444
ov80_02238444: ; 0x02238444
	push {r3, lr}
	ldrb r1, [r0, #0x10]
	cmp r1, #0
	bne _02238466
	ldrb r1, [r0, #0x11]
	lsl r1, r1, #1
	add r1, r0, r1
	add r1, #0x78
	ldrh r2, [r1]
	ldr r1, _02238494 ; =0x0000FEC9
	add r1, r2, r1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	cmp r1, #1
	bhi _02238466
	mov r0, #7
	pop {r3, pc}
_02238466:
	bl ov80_02238498
	add r0, r0, #1
	mov r1, #7
	cmp r0, #4
	bhi _0223848E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223847E: ; jump table
	.short _0223848E - _0223847E - 2 ; case 0
	.short _02238488 - _0223847E - 2 ; case 1
	.short _02238488 - _0223847E - 2 ; case 2
	.short _0223848C - _0223847E - 2 ; case 3
	.short _0223848C - _0223847E - 2 ; case 4
_02238488:
	mov r1, #0
	b _0223848E
_0223848C:
	mov r1, #1
_0223848E:
	add r0, r1, #0
	pop {r3, pc}
	nop
_02238494: .word 0x0000FEC9
	thumb_func_end ov80_02238444

	thumb_func_start ov80_02238498
ov80_02238498: ; 0x02238498
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r0, [r5, #0x10]
	ldrh r4, [r5, #0x1a]
	bl ov80_02238374
	cmp r0, #1
	bne _022384B4
	ldr r0, _022384B8 ; =0x00000A76
	ldrh r1, [r5, r0]
	ldrh r0, [r5, #0x1a]
	cmp r1, r0
	bls _022384B4
	add r4, r1, #0
_022384B4:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022384B8: .word 0x00000A76
	thumb_func_end ov80_02238498

	thumb_func_start ov80_022384BC
ov80_022384BC: ; 0x022384BC
	cmp r0, #9
	bhs _022384C4
	mov r0, #0
	bx lr
_022384C4:
	cmp r0, #0x12
	bhs _022384CC
	mov r0, #1
	bx lr
_022384CC:
	cmp r0, #0x1b
	bhs _022384D4
	mov r0, #2
	bx lr
_022384D4:
	mov r0, #3
	bx lr
	thumb_func_end ov80_022384BC

	thumb_func_start ov80_022384D8
ov80_022384D8: ; 0x022384D8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x65
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl ov80_022384FC
	str r0, [r4, #4]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_022384D8

	thumb_func_start ov80_022384FC
ov80_022384FC: ; 0x022384FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x65
	mov r1, #0xc
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	str r5, [r4, #4]
	mov r0, #0
	strh r0, [r4, #8]
	ldr r0, _02238528 ; =ov80_02238530
	ldr r2, _0223852C ; =0x0001368C
	add r1, r4, #0
	bl CreateSysTask
	str r0, [r4]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02238528: .word ov80_02238530
_0223852C: .word 0x0001368C
	thumb_func_end ov80_022384FC

	thumb_func_start ov80_02238530
ov80_02238530: ; 0x02238530
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r1, #0
	ldrh r0, [r4, #0xa]
	cmp r0, #2
	bhs _02238544
	add r0, r0, #1
	add sp, #0x14
	strh r0, [r4, #0xa]
	pop {r3, r4, pc}
_02238544:
	mov r0, #0
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	mov r0, #1
	eor r0, r1
	strh r0, [r4, #8]
	ldrh r1, [r4, #8]
	add r0, sp, #0xc
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov80_0223857C
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	mov r1, #3
	add r2, sp, #0xc
	mov r3, #0xe
	bl LoadRectToBgTilemapRect
	ldr r0, [r4, #4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov80_02238530

	thumb_func_start ov80_0223857C
ov80_0223857C: ; 0x0223857C
	push {r4, r5, r6, r7}
	cmp r1, #0
	bne _02238586
	mov r6, #0xc
	b _02238588
_02238586:
	mov r6, #0xe
_02238588:
	mov r1, #0
	mov r3, #0x60
	add r4, r1, #0
_0223858E:
	lsl r5, r4, #1
	mov r2, #0
	add r5, r0, r5
_02238594:
	add r7, r6, r2
	add r7, r3, r7
	strh r7, [r5]
	add r2, r2, #1
	add r5, r5, #2
	cmp r2, #2
	blo _02238594
	add r1, r1, #1
	add r3, #0x10
	add r4, r4, #2
	cmp r1, #2
	blo _0223858E
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov80_0223857C

	thumb_func_start ov80_022385B0
ov80_022385B0: ; 0x022385B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl ov80_022385C4
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_022385B0

	thumb_func_start ov80_022385C4
ov80_022385C4: ; 0x022385C4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_022385C4

	thumb_func_start ov80_022385D8
ov80_022385D8: ; 0x022385D8
	cmp r0, #6
	bhi _0223860C
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022385E8: ; jump table
	.short _0223860C - _022385E8 - 2 ; case 0
	.short _0223860A - _022385E8 - 2 ; case 1
	.short _022385F6 - _022385E8 - 2 ; case 2
	.short _022385FA - _022385E8 - 2 ; case 3
	.short _022385FE - _022385E8 - 2 ; case 4
	.short _02238602 - _022385E8 - 2 ; case 5
	.short _02238606 - _022385E8 - 2 ; case 6
_022385F6:
	mov r0, #0x73
	bx lr
_022385FA:
	mov r0, #0x77
	bx lr
_022385FE:
	mov r0, #0x87
	bx lr
_02238602:
	mov r0, #0x7b
	bx lr
_02238606:
	mov r0, #0x8f
	bx lr
_0223860A:
	mov r0, #0x71
_0223860C:
	bx lr
	.balign 4, 0
	thumb_func_end ov80_022385D8

	thumb_func_start ov80_02238610
ov80_02238610: ; 0x02238610
	cmp r0, #6
	bhi _02238644
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02238620: ; jump table
	.short _02238644 - _02238620 - 2 ; case 0
	.short _02238642 - _02238620 - 2 ; case 1
	.short _0223862E - _02238620 - 2 ; case 2
	.short _02238632 - _02238620 - 2 ; case 3
	.short _02238636 - _02238620 - 2 ; case 4
	.short _0223863A - _02238620 - 2 ; case 5
	.short _0223863E - _02238620 - 2 ; case 6
_0223862E:
	mov r0, #0x66
	bx lr
_02238632:
	mov r0, #0x68
	bx lr
_02238636:
	mov r0, #0x6c
	bx lr
_0223863A:
	mov r0, #0x6a
	bx lr
_0223863E:
	mov r0, #0x6e
	bx lr
_02238642:
	mov r0, #0x64
_02238644:
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02238610

	thumb_func_start ov80_02238648
ov80_02238648: ; 0x02238648
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl sub_02096808
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl Sav2_PlayerData_GetProfileAddr
	add r7, r0, #0
	mov r0, #0
	add r4, #0x20
	add r1, r0, #0
	ldrb r5, [r4]
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r1, #1
	lsl r1, r1, #0x1a
	ldr r0, [r1]
	ldr r2, _02238828 ; =0xFFFFE0FF
	and r0, r2
	str r0, [r1]
	ldr r0, _0223882C ; =0x04001000
	ldr r3, [r0]
	and r2, r3
	str r2, [r0]
	ldr r3, [r1]
	ldr r2, _02238830 ; =0xFFFF1FFF
	and r3, r2
	str r3, [r1]
	ldr r3, [r0]
	add r1, #0x50
	and r2, r3
	str r2, [r0]
	mov r2, #0
	strh r2, [r1]
	add r0, #0x50
	strh r2, [r0]
	ldr r2, _02238834 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	mov r2, #9
	mov r0, #3
	mov r1, #0x65
	lsl r2, r2, #0x10
	bl CreateHeap
	mov r0, #0x65
	mov r1, #0xc4
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc4
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	str r6, [r4, #8]
	add r0, #0xc1
	ldr r1, _02238838 ; =0x0000FFFF
	strb r5, [r0]
	mov r2, #0
	add r3, r4, #0
_022386D4:
	add r0, r3, #0
	add r0, #0x70
	add r2, r2, #1
	add r3, r3, #2
	strh r1, [r0]
	cmp r2, #8
	blt _022386D4
	mov r0, #0x65
	bl ov80_022392DC
	str r0, [r4, #0xc]
	mov r0, #0x65
	bl sub_020030E8
	str r0, [r4, #4]
	mov r1, #1
	bl sub_02003B50
	mov r2, #2
	ldr r0, [r4, #4]
	mov r1, #0
	lsl r2, r2, #8
	mov r3, #0x65
	bl PaletteData_AllocBuffers
	mov r1, #1
	ldr r0, [r4, #4]
	lsl r2, r1, #9
	mov r3, #0x65
	bl PaletteData_AllocBuffers
	mov r2, #7
	ldr r0, [r4, #4]
	mov r1, #2
	lsl r2, r2, #6
	mov r3, #0x65
	bl PaletteData_AllocBuffers
	mov r2, #2
	ldr r0, [r4, #4]
	mov r1, #3
	lsl r2, r2, #8
	mov r3, #0x65
	bl PaletteData_AllocBuffers
	mov r0, #0x65
	bl BgConfig_Alloc
	str r0, [r4]
	mov r0, #0x40
	mov r1, #0x65
	bl GF_CreateVramTransferManager
	mov r0, #4
	mov r1, #8
	bl SetKeyRepeatTimers
	ldr r0, [r4]
	add r1, r5, #0
	bl ov80_02238CD8
	add r0, r4, #0
	bl ov80_02238F10
	add r0, r4, #0
	bl ov80_02238FA0
	bl sub_020210BC
	mov r0, #4
	bl sub_02021148
	add r0, r4, #0
	bl ov80_02239384
	mov r0, #0x65
	bl ov80_02239960
	str r0, [r4, #0x10]
	add r0, r4, #0
	add r1, r5, #0
	add r2, r7, #0
	bl ov80_02239004
	ldr r0, _0223883C ; =ov80_02238AB0
	ldr r2, _02238840 ; =0x0000EA60
	add r1, r4, #0
	bl CreateSysTask
	add r1, r4, #0
	add r1, #0x94
	str r0, [r1]
	ldr r0, _02238844 ; =ov80_02238ABC
	ldr r2, _02238848 ; =0x0000EE48
	add r1, r4, #0
	bl CreateSysTask
	add r1, r4, #0
	add r1, #0x98
	str r0, [r1]
	ldr r0, _0223884C ; =ov80_02238AC8
	ldr r2, _02238850 ; =0x00013880
	add r1, r4, #0
	bl CreateSysTask
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	bl GX_BothDispOn
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	add r0, r5, #0
	mov r1, #3
	bl ov80_0222ACA0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02004AC8
	add r0, r5, #0
	mov r1, #3
	bl ov80_0222ACA0
	add r1, r0, #0
	lsl r1, r1, #0x10
	mov r0, #0
	lsr r1, r1, #0x10
	bl sub_02055198
	mov r0, #1
	bl sub_02002B50
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B8C
	ldr r0, _02238854 ; =ov80_02238A7C
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	ldr r0, _02238858 ; =ov80_02238AAC
	add r1, r4, #0
	mov r2, #0xa
	bl sub_0200E33C
	add r1, r4, #0
	add r1, #0xa0
	str r0, [r1]
	add r2, r4, #0
	add r2, #0xc1
	add r1, r4, #0
	ldrb r2, [r2]
	add r0, r4, #0
	add r1, #0x90
	bl ov80_0222AD9C
	bl sub_0203A880
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238828: .word 0xFFFFE0FF
_0223882C: .word 0x04001000
_02238830: .word 0xFFFF1FFF
_02238834: .word 0x04000304
_02238838: .word 0x0000FFFF
_0223883C: .word ov80_02238AB0
_02238840: .word 0x0000EA60
_02238844: .word ov80_02238ABC
_02238848: .word 0x0000EE48
_0223884C: .word ov80_02238AC8
_02238850: .word 0x00013880
_02238854: .word ov80_02238A7C
_02238858: .word ov80_02238AAC
	thumb_func_end ov80_02238648

	thumb_func_start ov80_0223885C
ov80_0223885C: ; 0x0223885C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl sub_02096808
	add r2, r4, #0
	add r2, #0xc1
	add r1, r4, #0
	ldrb r2, [r2]
	add r0, r4, #0
	add r1, #0x90
	bl ov80_0222ADB4
	add r0, r4, #0
	bl ov80_0223927C
	mov r0, #1
	mov r1, #0
	bl GX_EngineAToggleLayers
	mov r0, #2
	mov r1, #0
	bl GX_EngineAToggleLayers
	ldr r0, [r4]
	mov r1, #1
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #2
	bl FreeBgTilemapBuffer
	ldr r0, [r4]
	mov r1, #3
	bl FreeBgTilemapBuffer
	mov r0, #4
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r4]
	mov r1, #4
	bl FreeBgTilemapBuffer
	add r0, r4, #0
	bl ov80_022393E8
	ldr r0, [r4, #0x10]
	bl ov80_02239980
	bl GF_DestroyVramTransferManager
	ldr r0, [r4, #4]
	mov r1, #0
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #4]
	mov r1, #1
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #4]
	mov r1, #2
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #4]
	mov r1, #3
	bl PaletteData_FreeBuffers
	ldr r0, [r4, #4]
	bl sub_02003104
	ldr r0, [r4]
	bl FreeToHeap
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl DestroySysTask
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	bl DestroySysTask
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	bl DestroySysTask
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	bl DestroySysTask
	ldr r0, [r4, #0xc]
	bl ov80_0223937C
	bl sub_02021238
	add r0, r4, #0
	bl FreeToHeap
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _022389A4 ; =0xFFFF1FFF
	and r1, r0
	str r1, [r2]
	ldr r2, _022389A8 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	bl HBlankInterruptDisable
	mov r0, #0x65
	bl DestroyHeap
	mov r0, #0
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	bl sub_0203A914
	mov r1, #5
	mov r2, #2
	ldr r0, _022389AC ; =0x00007FFF
	lsl r1, r1, #0x18
	lsl r2, r2, #8
	bl MIi_CpuClear16
	mov r2, #2
	ldr r0, _022389AC ; =0x00007FFF
	ldr r1, _022389B0 ; =0x05000200
	lsl r2, r2, #8
	bl MIi_CpuClear16
	mov r2, #2
	ldr r0, _022389AC ; =0x00007FFF
	ldr r1, _022389B4 ; =0x05000400
	lsl r2, r2, #8
	bl MIi_CpuClear16
	mov r2, #2
	ldr r0, _022389AC ; =0x00007FFF
	ldr r1, _022389B8 ; =0x05000600
	lsl r2, r2, #8
	bl MIi_CpuClear16
	ldr r0, _022389BC ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, _022389C0 ; =0x04001050
	strh r1, [r0]
	pop {r4, pc}
	nop
_022389A4: .word 0xFFFF1FFF
_022389A8: .word 0x04001000
_022389AC: .word 0x00007FFF
_022389B0: .word 0x05000200
_022389B4: .word 0x05000400
_022389B8: .word 0x05000600
_022389BC: .word 0x04000050
_022389C0: .word 0x04001050
	thumb_func_end ov80_0223885C

	thumb_func_start ov80_022389C4
ov80_022389C4: ; 0x022389C4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r5, #0
	mov r7, #6
_022389CC:
	ldr r0, [r6, #8]
	add r1, r5, #0
	bl sub_0209686C
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02238A0A
	add r1, r7, #0
	bl ov42_02228188
	strb r0, [r4, #0x12]
	ldr r0, [r4]
	mov r1, #5
	bl ov42_02228188
	strh r0, [r4, #0xa]
	ldr r0, [r4]
	mov r1, #0
	bl ov42_02228188
	strh r0, [r4, #0xe]
	ldr r0, [r4]
	mov r1, #1
	bl ov42_02228188
	strh r0, [r4, #0x10]
	ldr r0, [r4, #4]
	bl ov42_022291F4
	strb r0, [r4, #0x13]
_02238A0A:
	add r5, r5, #1
	cmp r5, #0x20
	blt _022389CC
	add r0, r6, #0
	bl ov80_02239740
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_022389C4

	thumb_func_start ov80_02238A18
ov80_02238A18: ; 0x02238A18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl sub_02096864
	ldr r7, _02238A78 ; =0x0000FFFF
	add r4, r0, #0
	mov r6, #0
_02238A2A:
	ldrh r1, [r4]
	cmp r1, r7
	beq _02238A3A
	ldrb r2, [r4, #2]
	ldr r0, [r5, #0x20]
	mov r3, #0x65
	bl ov42_02228FE0
_02238A3A:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #0x18
	blt _02238A2A
	ldr r7, _02238A78 ; =0x0000FFFF
	mov r4, #0
	add r6, sp, #0
_02238A48:
	ldr r0, [r5, #8]
	add r1, r4, #0
	bl sub_0209686C
	ldrh r1, [r0, #0xc]
	cmp r1, r7
	beq _02238A66
	add r1, r6, #0
	bl ov80_02239900
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, #0
	bl ov80_02239510
_02238A66:
	add r4, r4, #1
	cmp r4, #0x20
	blt _02238A48
	add r0, r5, #0
	bl ov80_02239828
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238A78: .word 0x0000FFFF
	thumb_func_end ov80_02238A18

	thumb_func_start ov80_02238A7C
ov80_02238A7C: ; 0x02238A7C
	push {r4, lr}
	add r4, r0, #0
	bl GF_RunVramTransferTasks
	bl sub_0200D034
	ldr r0, [r4, #4]
	bl sub_0200398C
	ldr r0, [r4]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _02238AA4 ; =0x027E0000
	ldr r1, _02238AA8 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_02238AA4: .word 0x027E0000
_02238AA8: .word 0x00003FF8
	thumb_func_end ov80_02238A7C

	thumb_func_start ov80_02238AAC
ov80_02238AAC: ; 0x02238AAC
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02238AAC

	thumb_func_start ov80_02238AB0
ov80_02238AB0: ; 0x02238AB0
	ldr r3, _02238AB8 ; =ov42_0222807C
	ldr r0, [r1, #0x14]
	bx r3
	nop
_02238AB8: .word ov42_0222807C
	thumb_func_end ov80_02238AB0

	thumb_func_start ov80_02238ABC
ov80_02238ABC: ; 0x02238ABC
	ldr r3, _02238AC4 ; =ov80_02238C78
	add r0, r1, #0
	bx r3
	nop
_02238AC4: .word ov80_02238C78
	thumb_func_end ov80_02238ABC

	thumb_func_start ov80_02238AC8
ov80_02238AC8: ; 0x02238AC8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	ldr r0, [r7, #8]
	mov r1, #0x1f
	bl sub_0209686C
	ldr r1, [r0]
	cmp r1, #0
	beq _02238AE2
	add r0, r7, #0
	add r0, #0x1c
	bl ov42_02229358
_02238AE2:
	add r0, r7, #0
	bl ov80_02238B28
	ldr r0, [r7, #0x20]
	bl ov42_022290DC
	ldr r4, [r7, #0x6c]
	mov r6, #0
	add r5, r7, #0
_02238AF4:
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	beq _02238B04
	mov r1, #1
	tst r1, r4
	beq _02238B04
	bl sub_0200DC18
_02238B04:
	add r6, r6, #1
	lsr r4, r4, #1
	add r5, r5, #4
	cmp r6, #8
	blt _02238AF4
	ldr r0, [r7, #0x38]
	bl sub_0200D020
	bl sub_0200D03C
	bl ov80_02239A38
	mov r0, #1
	mov r1, #0
	bl sub_02026E50
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02238AC8

	thumb_func_start ov80_02238B28
ov80_02238B28: ; 0x02238B28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl sub_02096808
	add r4, r0, #0
	add r0, #0x20
	ldrb r0, [r0]
	mov r1, #0xc
	bl ov80_0222ACA0
	cmp r0, #0
	beq _02238B46
	cmp r0, #1
	beq _02238B74
_02238B46:
	ldr r0, [r5, #0x24]
	cmp r0, #0
	beq _02238B54
	add r1, r5, #0
	add r1, #0x1c
	bl ov42_02229420
_02238B54:
	ldr r0, [r5, #0x28]
	cmp r0, #0
	beq _02238B7A
	add r4, #0x20
	ldrb r0, [r4]
	mov r1, #0xd
	bl ov80_0222ACA0
	cmp r0, #1
	bne _02238B7A
	ldr r0, [r5, #0x28]
	add r5, #0x1c
	add r1, r5, #0
	bl ov42_02229420
	pop {r3, r4, r5, pc}
_02238B74:
	add r0, r5, #0
	bl ov80_02238B7C
_02238B7A:
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02238B28

	thumb_func_start ov80_02238B7C
ov80_02238B7C: ; 0x02238B7C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl sub_02096808
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x1c
	bl ov42_022293A8
	mov r1, #0xaa
	ldrsh r1, [r5, r1]
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	add r0, r5, #0
	add r0, #0x1c
	bl ov42_022293B0
	mov r1, #0xa8
	ldrsh r1, [r5, r1]
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	cmp r4, #0
	ble _02238BC6
	lsl r0, r4, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #4]
	b _02238BD6
_02238BC6:
	lsl r0, r4, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #4]
_02238BD6:
	cmp r6, #0
	ble _02238BEE
	lsl r0, r6, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp]
	b _02238BFE
_02238BEE:
	lsl r0, r6, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp]
_02238BFE:
	ldr r0, [r5, #0x34]
	bl sub_0200CF6C
	str r0, [sp, #8]
	ldr r0, [sp]
	bl _ffix
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	bl _ffix
	add r2, r0, #0
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl G2dRenderer_SetMainSurfaceCoords
	ldr r0, [r5]
	mov r1, #3
	mov r2, #0
	add r3, r6, #0
	bl ScheduleSetBgPosText
	mov r1, #3
	ldr r0, [r5]
	add r2, r1, #0
	add r3, r4, #0
	bl ScheduleSetBgPosText
	add r0, r7, #0
	add r0, #0x20
	ldrb r0, [r0]
	mov r1, #9
	bl ov80_0222ACA0
	ldr r1, _02238C74 ; =0x0000FFFF
	cmp r0, r1
	beq _02238C6E
	add r7, #0x20
	ldrb r0, [r7]
	mov r1, #0xd
	bl ov80_0222ACA0
	cmp r0, #1
	bne _02238C6E
	ldr r0, [r5]
	mov r1, #2
	mov r2, #0
	add r3, r6, #0
	bl ScheduleSetBgPosText
	ldr r0, [r5]
	mov r1, #2
	mov r2, #3
	add r3, r4, #0
	bl ScheduleSetBgPosText
_02238C6E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02238C74: .word 0x0000FFFF
	thumb_func_end ov80_02238B7C

	thumb_func_start ov80_02238C78
ov80_02238C78: ; 0x02238C78
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #0x30]
	add r1, sp, #0
	bl ov42_02229A08
	cmp r0, #1
	bne _02238CA0
	add r4, sp, #0
_02238C8C:
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	bl ov42_02228068
	ldr r0, [r5, #0x30]
	add r1, r4, #0
	bl ov42_02229A08
	cmp r0, #1
	beq _02238C8C
_02238CA0:
	ldr r0, [r5, #0x2c]
	add r1, sp, #8
	bl ov42_02229AC8
	cmp r0, #1
	bne _02238CD4
	add r6, sp, #0
	add r4, sp, #8
_02238CB0:
	ldr r0, [r5, #0x18]
	ldr r1, [r5, #0x14]
	add r2, r4, #0
	add r3, r6, #0
	bl ov42_02228C80
	cmp r0, #1
	bne _02238CC8
	ldr r0, [r5, #0x14]
	add r1, r6, #0
	bl ov42_02228068
_02238CC8:
	ldr r0, [r5, #0x2c]
	add r1, r4, #0
	bl ov42_02229AC8
	cmp r0, #1
	beq _02238CB0
_02238CD4:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov80_02238C78

	thumb_func_start ov80_02238CD8
ov80_02238CD8: ; 0x02238CD8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0xa8
	add r7, r1, #0
	add r5, r0, #0
	add r0, r7, #0
	mov r1, #0
	bl ov80_0222ACA0
	add r4, r0, #0
	bl GX_DisableEngineALayers
	ldr r6, _02238EF8 ; =ov80_0223D5D8
	add r3, sp, #0x2c
	mov r2, #5
_02238CF4:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02238CF4
	add r0, sp, #0x2c
	bl GX_SetBanks
	mov r1, #6
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x18
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x62
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	mov r1, #0x19
	mov r2, #1
	mov r0, #0
	lsl r1, r1, #0x16
	lsl r2, r2, #0x12
	bl MIi_CpuClear32
	mov r1, #0x66
	mov r2, #2
	mov r0, #0
	lsl r1, r1, #0x14
	lsl r2, r2, #0x10
	bl MIi_CpuClear32
	ldr r6, _02238EFC ; =ov80_0223D560
	add r3, sp, #0x1c
	add r2, r3, #0
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	str r4, [sp, #0x20]
	bl SetBothScreensModesAndDisable
	ldr r6, _02238F00 ; =ov80_0223D600
	add r3, sp, #0x54
	mov r2, #0xa
_02238D56:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02238D56
	ldr r0, [r6]
	cmp r4, #0
	str r0, [r3]
	bne _02238D74
	mov r2, #0
	add r1, sp, #0x74
	strb r2, [r1, #0xd]
	add r0, sp, #0x94
	strb r2, [r0, #9]
	strb r2, [r1, #0x10]
	strb r2, [r0, #0xc]
_02238D74:
	add r0, r7, #0
	mov r1, #4
	bl ov80_0222ACA0
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, sp, #0x94
	strb r6, [r0, #8]
	add r0, r7, #0
	mov r1, #9
	bl ov80_0222ACA0
	ldr r1, _02238F04 ; =0x0000FFFF
	cmp r0, r1
	beq _02238D96
	add r0, sp, #0x74
	strb r6, [r0, #0xc]
_02238D96:
	cmp r4, #0
	add r2, sp, #0x54
	bne _02238E20
	add r0, r5, #0
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #1
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #2
	add r2, sp, #0x70
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #2
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #3
	add r2, sp, #0x8c
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	mov r1, #3
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	b _02238EA2
_02238E20:
	add r0, r5, #0
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #1
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #1
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r1, #2
	add r0, r5, #0
	add r2, sp, #0x70
	add r3, r1, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #2
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #3
	add r2, sp, #0x8c
	mov r3, #2
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	mov r1, #3
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
_02238EA2:
	ldr r1, _02238F08 ; =0x04000008
	mov r0, #3
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #1
	strh r2, [r1]
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r4, _02238F0C ; =ov80_0223D59C
	add r3, sp, #0
	ldmia r4!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	mov r1, #4
	str r0, [r3]
	add r0, r5, #0
	mov r3, #0
	bl InitBgFromTemplate
	add r0, r5, #0
	mov r1, #4
	bl BgClearTilemapBufferAndCommit
	mov r2, #0
	add r0, r5, #0
	mov r1, #4
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	mov r1, #4
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add sp, #0xa8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02238EF8: .word ov80_0223D5D8
_02238EFC: .word ov80_0223D560
_02238F00: .word ov80_0223D600
_02238F04: .word 0x0000FFFF
_02238F08: .word 0x04000008
_02238F0C: .word ov80_0223D59C
	thumb_func_end ov80_02238CD8

	thumb_func_start ov80_02238F10
ov80_02238F10: ; 0x02238F10
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xe0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	mov r1, #0x10
	mov r2, #7
	mov r3, #0x65
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0xd0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	mov r1, #0x10
	mov r2, #8
	mov r3, #0x65
	bl PaletteData_LoadNarc
	ldr r0, [r4, #8]
	bl sub_02096808
	ldr r0, [r0, #4]
	bl Options_GetFrame
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0x65
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02238F98 ; =0x000003E2
	mov r1, #1
	mov r3, #0xb
	bl LoadUserFrameGfx2
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #0xb0
	mov r3, #0x20
	bl sub_020032A4
	mov r0, #0
	str r0, [sp]
	mov r0, #0x65
	str r0, [sp, #4]
	ldr r0, [r4]
	ldr r2, _02238F9C ; =0x000003D9
	mov r1, #1
	mov r3, #0xc
	bl LoadUserFrameGfx1
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #0xc0
	mov r3, #0x20
	bl sub_020032A4
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_02238F98: .word 0x000003E2
_02238F9C: .word 0x000003D9
	thumb_func_end ov80_02238F10

	thumb_func_start ov80_02238FA0
ov80_02238FA0: ; 0x02238FA0
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #0xb7
	mov r1, #0x65
	bl NARC_ctor
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	mov r1, #0x65
	str r1, [sp, #0xc]
	ldr r2, [r5]
	mov r1, #0x81
	mov r3, #4
	add r4, r0, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r4, #0
	mov r1, #0x82
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #1
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	mov r1, #0xb7
	mov r2, #0xbe
	mov r3, #0x65
	bl PaletteData_LoadNarc
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x10
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02238FA0

	thumb_func_start ov80_02239004
ov80_02239004: ; 0x02239004
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x20
	mov r1, #0x65
	add r6, r2, #0
	bl ov42_02228010
	str r0, [r5, #0x14]
	mov r0, #0x10
	add r1, r0, #0
	mov r2, #0x65
	bl ov42_02227EE0
	str r0, [r5, #0x18]
	add r0, r5, #0
	add r0, #0x1c
	bl ov42_02229394
	ldr r0, [r5, #0x38]
	bl sub_0200E2B0
	add r7, r0, #0
	add r0, r6, #0
	bl ov80_0222A7EC
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x65
	str r0, [sp, #8]
	ldr r1, [r5, #4]
	add r0, r7, #0
	mov r2, #0x20
	bl ov42_02228F24
	ldr r3, _02239270 ; =ov80_0223D554
	str r0, [r5, #0x20]
	add r2, sp, #0x20
	mov r1, #0xb
_0223905A:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0223905A
	add r0, r4, #0
	mov r1, #5
	bl ov80_0222ACA0
	add r1, sp, #0x18
	strb r0, [r1, #0x10]
	add r0, r4, #0
	mov r1, #6
	bl ov80_0222ACA0
	add r1, sp, #0x18
	strb r0, [r1, #0x11]
	add r0, r4, #0
	mov r1, #0xc
	bl ov80_0222ACA0
	add r6, r0, #0
	bne _0223909C
	ldr r0, [r5, #0x34]
	bl sub_0200CF6C
	ldr r1, [r5]
	add r2, sp, #0x20
	mov r3, #0x65
	bl ov42_022293B8
	str r0, [r5, #0x24]
_0223909C:
	add r0, r4, #0
	mov r1, #9
	bl ov80_0222ACA0
	ldr r1, _02239274 ; =0x0000FFFF
	cmp r0, r1
	beq _022390DA
	add r0, r4, #0
	mov r1, #9
	bl ov80_0222ACA0
	add r1, sp, #0x18
	strb r0, [r1, #0x11]
	mov r0, #2
	strb r0, [r1, #9]
	mov r2, #1
	mov r0, #8
	strb r2, [r1, #0xb]
	strb r0, [r1, #0xc]
	strb r2, [r1, #0xe]
	cmp r6, #0
	bne _022390DA
	ldr r0, [r5, #0x34]
	bl sub_0200CF6C
	ldr r1, [r5]
	add r2, sp, #0x20
	mov r3, #0x65
	bl ov42_022293B8
	str r0, [r5, #0x28]
_022390DA:
	mov r0, #0x80
	mov r1, #0x65
	bl ov42_02229A40
	str r0, [r5, #0x2c]
	mov r0, #0x80
	mov r1, #0x65
	bl ov42_02229974
	str r0, [r5, #0x30]
	ldr r0, [r5, #0x18]
	ldr r1, _02239278 ; =ov80_0223D654
	bl ov42_02227F48
	add r0, r4, #0
	mov r1, #0
	bl ov80_0222ACA0
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #5
	bl ov80_0222ACA0
	mov r1, #0x65
	str r0, [sp, #0x10]
	bl NARC_ctor
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #7
	bl ov80_0222ACA0
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r3, #3
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	cmp r7, #0
	bne _0223915A
	add r0, r4, #0
	mov r1, #8
	bl ov80_0222ACA0
	add r2, r0, #0
	mov r1, #0
	mov r0, #0x16
	str r1, [sp]
	lsl r0, r0, #4
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x10]
	mov r3, #0x65
	bl PaletteData_LoadNarc
	b _02239198
_0223915A:
	add r0, r4, #0
	mov r1, #8
	bl ov80_0222ACA0
	add r1, r0, #0
	add r0, r6, #0
	add r2, sp, #0x1c
	mov r3, #0x65
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0x14]
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #8]
	bl DC_FlushRange
	bl GX_BeginLoadBGExtPltt
	ldr r0, [sp, #0x1c]
	mov r1, #6
	mov r2, #2
	ldr r0, [r0, #0xc]
	lsl r1, r1, #0xc
	lsl r2, r2, #0xc
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	ldr r0, [sp, #0x14]
	bl FreeToHeap
_02239198:
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	mov r2, #2
	add r3, r1, #0
	bl sub_02003D5C
	add r0, r4, #0
	mov r1, #6
	bl ov80_0222ACA0
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r3, #3
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r4, #0
	mov r1, #9
	bl ov80_0222ACA0
	ldr r1, _02239274 ; =0x0000FFFF
	cmp r0, r1
	beq _0223925E
	add r0, r4, #0
	mov r1, #0xa
	bl ov80_0222ACA0
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r3, #2
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	add r0, r4, #0
	mov r1, #9
	bl ov80_0222ACA0
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldr r2, [r5]
	add r0, r6, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	cmp r7, #0
	beq _0223925E
	add r0, r4, #0
	mov r1, #0xb
	bl ov80_0222ACA0
	add r1, r0, #0
	add r0, r6, #0
	add r2, sp, #0x18
	mov r3, #0x65
	bl GfGfxLoader_GetPlttDataFromOpenNarc
	ldr r1, [sp, #0x18]
	add r4, r0, #0
	ldr r0, [r1, #0xc]
	ldr r1, [r1, #8]
	bl DC_FlushRange
	bl GX_BeginLoadBGExtPltt
	ldr r0, [sp, #0x18]
	mov r1, #1
	lsl r1, r1, #0xe
	ldr r0, [r0, #0xc]
	lsr r2, r1, #1
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	add r0, r4, #0
	bl FreeToHeap
_0223925E:
	ldr r0, [r5]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add r0, r6, #0
	bl NARC_dtor
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02239270: .word ov80_0223D554
_02239274: .word 0x0000FFFF
_02239278: .word ov80_0223D654
	thumb_func_end ov80_02239004

	thumb_func_start ov80_0223927C
ov80_0223927C: ; 0x0223927C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6, #8]
	bl sub_02096868
	add r5, r0, #0
	mov r4, #0
_0223928A:
	ldr r0, [r5]
	cmp r0, #0
	beq _0223929E
	bl ov42_02228100
	ldr r0, [r5, #0x38]
	cmp r0, #0
	beq _0223929E
	bl GF_AssertFail
_0223929E:
	add r4, r4, #1
	add r5, #0x3c
	cmp r4, #0x20
	blt _0223928A
	ldr r0, [r6, #0x14]
	bl ov42_02228050
	ldr r0, [r6, #0x18]
	bl ov42_02227F28
	ldr r0, [r6, #0x20]
	bl ov42_02228F94
	ldr r0, [r6, #0x24]
	cmp r0, #0
	beq _022392C2
	bl ov42_0222940C
_022392C2:
	ldr r0, [r6, #0x28]
	cmp r0, #0
	beq _022392CC
	bl ov42_0222940C
_022392CC:
	ldr r0, [r6, #0x2c]
	bl ov42_02229A78
	ldr r0, [r6, #0x30]
	bl ov42_022299AC
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0223927C

	thumb_func_start ov80_022392DC
ov80_022392DC: ; 0x022392DC
	push {r3, lr}
	sub sp, #8
	mov r2, #1
	ldr r1, _022392F4 ; =ov80_022392F8
	str r2, [sp]
	str r1, [sp, #4]
	mov r1, #0
	add r3, r1, #0
	bl GF_3DVramMan_Create
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
_022392F4: .word ov80_022392F8
	thumb_func_end ov80_022392DC

	thumb_func_start ov80_022392F8
ov80_022392F8: ; 0x022392F8
	push {r3, lr}
	mov r0, #1
	add r1, r0, #0
	bl GX_EngineAToggleLayers
	ldr r0, _02239364 ; =0x04000008
	mov r1, #3
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	add r0, #0x58
	ldrh r2, [r0]
	ldr r1, _02239368 ; =0xFFFFCFFD
	and r2, r1
	strh r2, [r0]
	add r2, r1, #2
	ldrh r3, [r0]
	add r1, r1, #2
	and r3, r2
	mov r2, #0x10
	orr r2, r3
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _0223936C ; =0x0000CFFB
	and r3, r2
	strh r3, [r0]
	ldrh r3, [r0]
	sub r2, #0x1c
	and r3, r1
	mov r1, #8
	orr r1, r3
	strh r1, [r0]
	ldrh r1, [r0]
	and r1, r2
	strh r1, [r0]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl G3X_SetFog
	mov r0, #0
	ldr r2, _02239370 ; =0x00007FFF
	add r1, r0, #0
	mov r3, #0x3f
	str r0, [sp]
	bl G3X_SetClearColor
	ldr r1, _02239374 ; =0xBFFF0000
	ldr r0, _02239378 ; =0x04000580
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_02239364: .word 0x04000008
_02239368: .word 0xFFFFCFFD
_0223936C: .word 0x0000CFFB
_02239370: .word 0x00007FFF
_02239374: .word 0xBFFF0000
_02239378: .word 0x04000580
	thumb_func_end ov80_022392F8

	thumb_func_start ov80_0223937C
ov80_0223937C: ; 0x0223937C
	ldr r3, _02239380 ; =GF_3DVramMan_Delete
	bx r3
	.balign 4, 0
_02239380: .word GF_3DVramMan_Delete
	thumb_func_end ov80_0223937C

	thumb_func_start ov80_02239384
ov80_02239384: ; 0x02239384
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x65
	bl sub_0200CF18
	ldr r1, _022393D8 ; =ov80_0223D5B8
	ldr r2, _022393DC ; =ov80_0223D570
	mov r3, #0x20
	str r0, [r4, #0x34]
	bl sub_0200CF70
	ldr r1, _022393E0 ; =0x00200010
	mov r0, #1
	bl sub_02009FE8
	mov r0, #1
	bl sub_0200A080
	ldr r0, [r4, #0x34]
	bl sub_0200CF38
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	mov r2, #0x80
	bl sub_0200CFF4
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x38]
	ldr r2, _022393E4 ; =ov80_0223D584
	bl sub_0200D3F8
	ldr r0, [r4, #0x34]
	bl sub_0200CF6C
	mov r2, #2
	mov r1, #0
	lsl r2, r2, #0x14
	bl G2dRenderer_SetSubSurfaceCoords
	pop {r4, pc}
	nop
_022393D8: .word ov80_0223D5B8
_022393DC: .word ov80_0223D570
_022393E0: .word 0x00200010
_022393E4: .word ov80_0223D584
	thumb_func_end ov80_02239384

	thumb_func_start ov80_022393E8
ov80_022393E8: ; 0x022393E8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r6, #0
	add r4, r5, #0
_022393F0:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _022393FA
	bl ov80_02239BE8
_022393FA:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #8
	blt _022393F0
	ldr r7, _02239474 ; =0x0000FFFF
	mov r6, #0
	add r4, r5, #0
_02239408:
	add r0, r4, #0
	add r0, #0x70
	ldrh r1, [r0]
	cmp r1, r7
	beq _02239418
	ldr r0, [r5, #0x38]
	bl ov80_02239B7C
_02239418:
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, #8
	blt _02239408
	ldr r7, _02239478 ; =0x0000C350
	mov r4, #0
	add r6, r5, #0
_02239426:
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	cmp r0, #0
	beq _0223945A
	bl sub_0200D9DC
	ldr r1, _02239478 ; =0x0000C350
	ldr r0, [r5, #0x38]
	add r1, r4, r1
	bl sub_0200D958
	ldr r1, _02239478 ; =0x0000C350
	ldr r0, [r5, #0x38]
	add r1, r4, r1
	bl sub_0200D968
	ldr r1, _02239478 ; =0x0000C350
	ldr r0, [r5, #0x38]
	add r1, r4, r1
	bl sub_0200D978
	ldr r0, [r5, #0x38]
	add r1, r4, r7
	bl sub_0200D988
_0223945A:
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #4
	blt _02239426
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_0200D998
	ldr r0, [r5, #0x34]
	bl sub_0200D108
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239474: .word 0x0000FFFF
_02239478: .word 0x0000C350
	thumb_func_end ov80_022393E8

	thumb_func_start ov80_0223947C
ov80_0223947C: ; 0x0223947C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #8]
	add r5, r1, #0
	bl sub_02096864
	add r7, r0, #0
	ldrh r3, [r5]
	mov r1, #0
	add r2, r7, #0
_02239490:
	ldrh r0, [r2]
	cmp r3, r0
	beq _022394D2
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #0x18
	blt _02239490
	ldr r0, _022394D4 ; =0x0000FFFF
	mov r4, #0
	add r2, r7, #0
_022394A4:
	ldrh r1, [r2]
	cmp r1, r0
	beq _022394B2
	add r4, r4, #1
	add r2, r2, #4
	cmp r4, #0x18
	blt _022394A4
_022394B2:
	cmp r4, #0x18
	bne _022394BA
	bl GF_AssertFail
_022394BA:
	ldrh r0, [r5]
	lsl r2, r4, #2
	add r1, r7, r2
	strh r0, [r7, r2]
	ldrh r0, [r5, #2]
	mov r3, #0x65
	strh r0, [r1, #2]
	ldrh r1, [r5]
	ldrb r2, [r5, #2]
	ldr r0, [r6, #0x20]
	bl ov42_02228FE0
_022394D2:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022394D4: .word 0x0000FFFF
	thumb_func_end ov80_0223947C

	thumb_func_start ov80_022394D8
ov80_022394D8: ; 0x022394D8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #8]
	add r5, r1, #0
	bl sub_02096864
	add r7, r0, #0
	mov r4, #0
	add r1, r7, #0
_022394EA:
	ldrh r0, [r1]
	cmp r5, r0
	bne _02239500
	ldr r0, [r6, #0x20]
	add r1, r5, #0
	bl ov42_02229004
	ldr r1, _0223950C ; =0x0000FFFF
	lsl r0, r4, #2
	strh r1, [r7, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02239500:
	add r4, r4, #1
	add r1, r1, #4
	cmp r4, #0x18
	blt _022394EA
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223950C: .word 0x0000FFFF
	thumb_func_end ov80_022394D8

	thumb_func_start ov80_02239510
ov80_02239510: ; 0x02239510
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r6, r0, #0
	ldr r0, [r6, #8]
	add r5, r1, #0
	add r4, r2, #0
	bl sub_02096868
	mov r1, #0
	mvn r1, r1
	cmp r4, r1
	bne _02239540
	mov r4, #0
_0223952A:
	ldr r1, [r0]
	cmp r1, #0
	beq _02239538
	add r4, r4, #1
	add r0, #0x3c
	cmp r4, #0x20
	blt _0223952A
_02239538:
	cmp r4, #0x20
	bne _02239540
	bl GF_AssertFail
_02239540:
	mov r0, #6
	ldrsh r0, [r5, r0]
	add r1, sp, #8
	strh r0, [r1]
	mov r0, #8
	ldrsh r0, [r5, r0]
	strh r0, [r1, #2]
	ldrh r0, [r5, #4]
	strh r0, [r1, #4]
	ldrh r0, [r5, #2]
	strh r0, [r1, #6]
	ldrb r0, [r5, #0xa]
	strh r0, [r1, #8]
	ldrh r0, [r5]
	strh r0, [r1, #0xa]
	ldr r0, [r6, #0x14]
	add r1, sp, #8
	bl ov42_022280B8
	str r0, [sp, #4]
	ldr r0, [r6, #0x20]
	ldr r1, [sp, #4]
	mov r2, #0
	mov r3, #0x65
	bl ov42_0222903C
	ldrb r1, [r5, #0xb]
	add r7, r0, #0
	bl ov42_02229200
	str r5, [sp]
	ldr r0, [r6, #8]
	ldr r2, [sp, #4]
	add r1, r4, #0
	add r3, r7, #0
	bl ov80_02239914
	ldr r0, [sp, #4]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_02239510

	thumb_func_start ov80_02239590
ov80_02239590: ; 0x02239590
	push {r3, r4, r5, lr}
	ldr r0, [r0, #8]
	add r5, r1, #0
	bl sub_02096868
	add r4, r0, #0
	mov r1, #0
	add r2, r4, #0
_022395A0:
	ldr r0, [r2]
	cmp r0, r5
	bne _022395D8
	mov r0, #0x3c
	add r5, r1, #0
	mul r5, r0
	ldr r0, [r4, r5]
	bl ov42_02228100
	add r0, r4, r5
	ldr r0, [r0, #4]
	bl ov42_022290C4
	add r0, r4, r5
	ldr r0, [r0, #0x38]
	cmp r0, #0
	beq _022395C6
	bl GF_AssertFail
_022395C6:
	add r0, r4, r5
	mov r1, #0
	mov r2, #0x3c
	bl MI_CpuFill8
	ldr r1, _022395E4 ; =0x0000FFFF
	add r0, r4, r5
	strh r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
_022395D8:
	add r1, r1, #1
	add r2, #0x3c
	cmp r1, #0x20
	blt _022395A0
	pop {r3, r4, r5, pc}
	nop
_022395E4: .word 0x0000FFFF
	thumb_func_end ov80_02239590

	thumb_func_start ov80_022395E8
ov80_022395E8: ; 0x022395E8
	push {r4, r5, r6, lr}
	ldr r0, [r0, #8]
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_02096868
	mov r1, #0
	add r3, r0, #0
_022395FA:
	ldrh r2, [r3, #0xc]
	cmp r5, r2
	bne _0223961C
	cmp r4, #0
	beq _0223960C
	mov r2, #0x3c
	mul r2, r1
	ldr r2, [r0, r2]
	str r2, [r4]
_0223960C:
	cmp r6, #0
	beq _02239628
	mov r2, #0x3c
	mul r2, r1
	add r0, r0, r2
	ldr r0, [r0, #4]
	str r0, [r6]
	pop {r4, r5, r6, pc}
_0223961C:
	add r1, r1, #1
	add r3, #0x3c
	cmp r1, #0x20
	blt _022395FA
	bl GF_AssertFail
_02239628:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_022395E8

	thumb_func_start ov80_0223962C
ov80_0223962C: ; 0x0223962C
	push {r3, r4, r5, lr}
	ldr r3, _02239658 ; =0x0000FFFF
	mov r4, #0
	add r5, r0, #0
_02239634:
	add r2, r5, #0
	add r2, #0x70
	ldrh r2, [r2]
	cmp r2, r3
	bne _02239648
	lsl r2, r4, #1
	add r0, r0, r2
	add r0, #0x70
	strh r1, [r0]
	pop {r3, r4, r5, pc}
_02239648:
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #8
	blt _02239634
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
	nop
_02239658: .word 0x0000FFFF
	thumb_func_end ov80_0223962C

	thumb_func_start ov80_0223965C
ov80_0223965C: ; 0x0223965C
	push {r3, r4}
	mov r3, #0
	add r4, r0, #0
_02239662:
	add r2, r4, #0
	add r2, #0x70
	ldrh r2, [r2]
	cmp r1, r2
	bne _0223967A
	lsl r1, r3, #1
	add r0, r0, r1
	ldr r2, _02239688 ; =0x0000FFFF
	add r0, #0x70
	strh r2, [r0]
	pop {r3, r4}
	bx lr
_0223967A:
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, #8
	blt _02239662
	pop {r3, r4}
	bx lr
	nop
_02239688: .word 0x0000FFFF
	thumb_func_end ov80_0223965C

	thumb_func_start ov80_0223968C
ov80_0223968C: ; 0x0223968C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #8
	blo _0223969E
	bl GF_AssertFail
_0223969E:
	add r7, r5, #0
	lsl r0, r4, #2
	add r7, #0x3c
	str r0, [sp]
	ldr r0, [r7, r0]
	cmp r0, #0
	beq _022396B0
	bl GF_AssertFail
_022396B0:
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	add r2, r6, #0
	bl ov80_02239BB8
	ldr r1, [sp]
	str r0, [sp, #4]
	str r0, [r7, r1]
	lsl r0, r4, #1
	add r0, r5, r0
	add r0, #0x5c
	strh r6, [r0]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov80_02239708
	ldr r0, [sp, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223968C

	thumb_func_start ov80_022396D8
ov80_022396D8: ; 0x022396D8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #8
	blo _022396E6
	bl GF_AssertFail
_022396E6:
	lsl r4, r4, #2
	add r5, #0x3c
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _022396F4
	bl GF_AssertFail
_022396F4:
	ldr r0, [r5, r4]
	bl ov80_02239BE8
	mov r0, #0
	str r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_022396D8

	thumb_func_start ov80_02239700
ov80_02239700: ; 0x02239700
	lsl r1, r1, #2
	add r0, r0, r1
	ldr r0, [r0, #0x3c]
	bx lr
	thumb_func_end ov80_02239700

	thumb_func_start ov80_02239708
ov80_02239708: ; 0x02239708
	push {r3, r4}
	cmp r2, #1
	bne _0223971E
	mov r2, #1
	ldr r3, [r0, #0x6c]
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	str r1, [r0, #0x6c]
	pop {r3, r4}
	bx lr
_0223971E:
	mov r2, #1
	add r3, r2, #0
	lsl r3, r1
	sub r1, r2, #2
	ldr r4, [r0, #0x6c]
	eor r1, r3
	and r1, r4
	str r1, [r0, #0x6c]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02239708

	thumb_func_start ov80_02239734
ov80_02239734: ; 0x02239734
	ldr r0, [r0, #0x6c]
	add r2, r0, #0
	lsr r2, r1
	mov r0, #1
	and r0, r2
	bx lr
	thumb_func_end ov80_02239734

	thumb_func_start ov80_02239740
ov80_02239740: ; 0x02239740
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [r0, #8]
	bl sub_02096878
	ldr r4, [sp]
	add r6, r0, #0
	ldr r0, _02239814 ; =0x0000FFFF
	add r4, #0x3c
	mov r3, #0
_02239756:
	lsl r2, r3, #1
	add r1, r4, r2
	ldrh r1, [r1, #0x34]
	cmp r1, r0
	beq _02239764
	strh r1, [r6, r2]
	add r3, r3, #1
_02239764:
	add r3, r3, #1
	cmp r3, #8
	blt _02239756
	add r0, r6, #0
	str r0, [sp, #8]
	add r0, #0x12
	str r0, [sp, #8]
	add r0, r6, #0
	add r5, r6, #0
	str r0, [sp, #4]
	add r0, #0x10
	mov r7, #0
	add r5, #0x16
	str r4, [sp, #0xc]
	str r0, [sp, #4]
_02239782:
	ldr r0, [r4]
	cmp r0, #0
	beq _022397F0
	bl sub_0200DC64
	strb r0, [r6, #0x15]
	ldr r0, [r4]
	bl sub_0200DCD4
	ldrh r2, [r5]
	ldr r1, _02239818 ; =0xFFFFE000
	and r1, r2
	ldr r2, _0223981C ; =0x00001FFF
	and r0, r2
	orr r0, r1
	strh r0, [r5]
	lsl r1, r7, #0x10
	ldr r0, [sp]
	lsr r1, r1, #0x10
	bl ov80_02239734
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	ldrh r2, [r5]
	ldr r1, _02239820 ; =0xFFFFDFFF
	lsr r0, r0, #0x12
	and r1, r2
	orr r0, r1
	strh r0, [r5]
	ldr r0, [r4]
	bl sub_0200DCFC
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	ldrh r2, [r5]
	ldr r1, _02239824 ; =0xFFFFBFFF
	lsr r0, r0, #0x11
	and r1, r2
	orr r0, r1
	strh r0, [r5]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #4]
	ldrh r0, [r0, #0x20]
	ldr r2, [sp, #8]
	strb r0, [r6, #0x14]
	ldr r0, [r4]
	bl sub_0200DE44
	mov r0, #2
	ldrh r1, [r5]
	lsl r0, r0, #0xe
	orr r0, r1
	strh r0, [r5]
_022397F0:
	ldr r0, [sp, #0xc]
	add r7, r7, #1
	add r0, r0, #2
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r4, r4, #4
	add r0, #8
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	add r6, #8
	add r0, #8
	add r5, #8
	str r0, [sp, #4]
	cmp r7, #8
	blt _02239782
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02239814: .word 0x0000FFFF
_02239818: .word 0xFFFFE000
_0223981C: .word 0x00001FFF
_02239820: .word 0xFFFFDFFF
_02239824: .word 0xFFFFBFFF
	thumb_func_end ov80_02239740

	thumb_func_start ov80_02239828
ov80_02239828: ; 0x02239828
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	ldr r0, [r7, #8]
	bl sub_02096878
	add r5, r0, #0
	mov r0, #0xb8
	mov r1, #0x65
	bl NARC_ctor
	str r0, [sp, #4]
	mov r6, #0
	add r4, r5, #0
_02239844:
	ldrh r1, [r4]
	ldr r0, _022398E0 ; =0x0000FFFF
	cmp r1, r0
	beq _02239862
	str r1, [sp]
	ldr r0, [r7, #0x34]
	ldr r1, [r7, #0x38]
	ldr r2, [sp, #4]
	ldr r3, [r7, #4]
	bl ov80_02239AF8
	ldrh r1, [r4]
	add r0, r7, #0
	bl ov80_0223962C
_02239862:
	add r6, r6, #1
	add r4, r4, #2
	cmp r6, #8
	blt _02239844
	add r4, r5, #0
	mov r6, #0
	add r4, #0x16
_02239870:
	ldrh r0, [r4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _022398C4
	ldrb r2, [r5, #0x14]
	lsl r1, r6, #0x10
	add r0, r7, #0
	lsr r1, r1, #0x10
	bl ov80_0223968C
	mov r1, #0x10
	mov r2, #0x12
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	str r0, [sp, #8]
	bl sub_0200DDB8
	ldrh r1, [r4]
	ldr r0, [sp, #8]
	lsl r1, r1, #0x11
	lsr r1, r1, #0x1f
	bl sub_0200DCE8
	ldrh r2, [r4]
	lsl r1, r6, #0x10
	add r0, r7, #0
	lsl r2, r2, #0x12
	lsr r1, r1, #0x10
	lsr r2, r2, #0x1f
	bl ov80_02239708
	ldrb r1, [r5, #0x15]
	ldr r0, [sp, #8]
	bl sub_0200DC4C
	ldrh r1, [r4]
	ldr r0, [sp, #8]
	lsl r1, r1, #0x13
	lsr r1, r1, #0x13
	bl sub_0200DCC0
_022398C4:
	add r6, r6, #1
	add r4, #8
	add r5, #8
	cmp r6, #8
	blt _02239870
	ldr r0, [sp, #4]
	bl NARC_dtor
	ldr r0, [r7, #8]
	bl sub_02096884
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_022398E0: .word 0x0000FFFF
	thumb_func_end ov80_02239828

	thumb_func_start ov80_022398E4
ov80_022398E4: ; 0x022398E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, #0x1c
	add r6, r1, #0
	add r4, r2, #0
	bl ov42_022293A8
	add r5, #0x1c
	strh r0, [r4]
	add r0, r5, #0
	bl ov42_022293B0
	strh r0, [r6]
	pop {r4, r5, r6, pc}
	thumb_func_end ov80_022398E4

	thumb_func_start ov80_02239900
ov80_02239900: ; 0x02239900
	add r0, #8
	mov r3, #0xf
_02239904:
	ldrh r2, [r0]
	add r0, r0, #2
	strh r2, [r1]
	add r1, r1, #2
	sub r3, r3, #1
	bne _02239904
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02239900

	thumb_func_start ov80_02239914
ov80_02239914: ; 0x02239914
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	bl sub_0209686C
	str r5, [r0]
	str r4, [r0, #4]
	ldr r3, [sp, #0x10]
	add r0, #8
	mov r2, #0xf
_02239928:
	ldrh r1, [r3]
	add r3, r3, #2
	strh r1, [r0]
	add r0, r0, #2
	sub r2, r2, #1
	bne _02239928
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02239914

	thumb_func_start ov80_02239938
ov80_02239938: ; 0x02239938
	push {r4, lr}
	add r4, r1, #0
	bl sub_02096868
	mov r2, #0
_02239942:
	ldr r1, [r0]
	cmp r1, #0
	beq _0223994E
	ldrh r1, [r0, #0xc]
	cmp r1, r4
	beq _0223995C
_0223994E:
	add r2, r2, #1
	add r0, #0x3c
	cmp r2, #0x20
	blt _02239942
	bl GF_AssertFail
	mov r0, #0
_0223995C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02239938

	thumb_func_start ov80_02239960
ov80_02239960: ; 0x02239960
	push {r3, r4, r5, lr}
	mov r1, #0x24
	add r5, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x24
	bl MI_CpuFill8
	strh r5, [r4, #0x20]
	bl sub_02014DA0
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_02239960

	thumb_func_start ov80_02239980
ov80_02239980: ; 0x02239980
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_02239988:
	ldr r0, [r5]
	cmp r0, #0
	beq _02239992
	bl ov80_02239A98
_02239992:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _02239988
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_02239980

	thumb_func_start ov80_022399A4
ov80_022399A4: ; 0x022399A4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	lsl r6, r1, #2
	ldr r0, [r5, r6]
	add r7, r2, #0
	str r3, [sp, #8]
	cmp r0, #0
	beq _022399BA
	bl GF_AssertFail
_022399BA:
	ldrh r0, [r5, #0x20]
	mov r1, #0x12
	lsl r1, r1, #0xa
	bl AllocFromHeap
	add r2, r0, #0
	mov r0, #1
	str r0, [sp]
	ldrh r0, [r5, #0x20]
	mov r3, #0x12
	ldr r1, _02239A14 ; =ov80_02239AD4
	str r0, [sp, #4]
	ldr r0, _02239A18 ; =ov80_02239AB0
	lsl r3, r3, #0xa
	bl sub_02014DB4
	add r4, r0, #0
	bl sub_02015524
	add r2, r0, #0
	mov r0, #1
	mov r1, #0xe1
	lsl r0, r0, #0xc
	lsl r1, r1, #0xe
	bl GF_Camera_SetClipBounds
	ldr r1, [sp, #8]
	add r0, r4, #0
	bl sub_02015528
	ldrh r2, [r5, #0x20]
	mov r0, #0xbc
	add r1, r7, #0
	bl sub_02015264
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0xa
	mov r3, #1
	bl sub_0201526C
	str r4, [r5, r6]
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02239A14: .word ov80_02239AD4
_02239A18: .word ov80_02239AB0
	thumb_func_end ov80_022399A4

	thumb_func_start ov80_02239A1C
ov80_02239A1C: ; 0x02239A1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	lsl r4, r1, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _02239A2C
	bl GF_AssertFail
_02239A2C:
	ldr r0, [r5, r4]
	bl ov80_02239A98
	mov r0, #0
	str r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02239A1C

	thumb_func_start ov80_02239A38
ov80_02239A38: ; 0x02239A38
	push {r3, lr}
	bl sub_02026E48
	bl sub_02015420
	cmp r0, #0
	bne _02239A4A
	mov r0, #0
	pop {r3, pc}
_02239A4A:
	bl sub_0201543C
	cmp r0, #0
	ble _02239A56
	bl sub_02026E48
_02239A56:
	bl sub_02015460
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_02239A38

	thumb_func_start ov80_02239A60
ov80_02239A60: ; 0x02239A60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	lsl r4, r1, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _02239A70
	bl GF_AssertFail
_02239A70:
	ldr r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02239A60

	thumb_func_start ov80_02239A74
ov80_02239A74: ; 0x02239A74
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_02239A7A:
	ldr r0, [r5]
	cmp r0, #0
	beq _02239A8C
	bl sub_020154B0
	cmp r0, #0
	ble _02239A8C
	mov r0, #0
	pop {r3, r4, r5, pc}
_02239A8C:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #8
	blt _02239A7A
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02239A74

	thumb_func_start ov80_02239A98
ov80_02239A98: ; 0x02239A98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020154D0
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02014EBC
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_02239A98

	thumb_func_start ov80_02239AB0
ov80_02239AB0: ; 0x02239AB0
	push {r4, lr}
	ldr r3, _02239AD0 ; =NNS_GfdDefaultFuncAllocTexVram
	mov r2, #0
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bne _02239AC2
	bl GF_AssertFail
_02239AC2:
	add r0, r4, #0
	bl sub_02015354
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_02239AD0: .word NNS_GfdDefaultFuncAllocTexVram
	thumb_func_end ov80_02239AB0

	thumb_func_start ov80_02239AD4
ov80_02239AD4: ; 0x02239AD4
	push {r4, lr}
	ldr r3, _02239AF4 ; =NNS_GfdDefaultFuncAllocPlttVram
	mov r2, #1
	ldr r3, [r3]
	blx r3
	add r4, r0, #0
	bne _02239AE6
	bl GF_AssertFail
_02239AE6:
	add r0, r4, #0
	bl sub_02015394
	lsl r0, r4, #0x10
	lsr r0, r0, #0xd
	pop {r4, pc}
	nop
_02239AF4: .word NNS_GfdDefaultFuncAllocPlttVram
	thumb_func_end ov80_02239AD4

	thumb_func_start ov80_02239AF8
ov80_02239AF8: ; 0x02239AF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r0, #0
	add r0, sp, #0x20
	ldrh r0, [r0, #0x10]
	add r7, r1, #0
	add r5, r2, #0
	str r3, [sp, #0x18]
	cmp r0, #4
	blo _02239B10
	bl GF_AssertFail
_02239B10:
	add r1, sp, #0x20
	ldrh r2, [r1, #0x10]
	mov r1, #0x34
	ldr r0, _02239B78 ; =ov80_0223DA54
	mul r1, r2
	add r4, r0, r1
	ldr r3, [r4, #0x14]
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	str r3, [sp, #8]
	add r0, r6, #0
	add r1, r7, #0
	add r2, r5, #0
	bl sub_0200D504
	ldr r1, [r4, #0x18]
	mov r0, #0
	str r5, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	mov r1, #2
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0200D68C
	ldr r3, [r4, #0x1c]
	mov r0, #1
	str r0, [sp]
	str r3, [sp, #4]
	add r0, r6, #0
	add r1, r7, #0
	add r2, r5, #0
	bl sub_0200D6EC
	ldr r3, [r4, #0x20]
	mov r0, #1
	str r0, [sp]
	add r0, r6, #0
	add r1, r7, #0
	add r2, r5, #0
	str r3, [sp, #4]
	bl sub_0200D71C
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_02239B78: .word ov80_0223DA54
	thumb_func_end ov80_02239AF8

	thumb_func_start ov80_02239B7C
ov80_02239B7C: ; 0x02239B7C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #4
	blo _02239B8A
	bl GF_AssertFail
_02239B8A:
	mov r0, #0x34
	ldr r1, _02239BB4 ; =ov80_0223DA54
	mul r0, r4
	add r4, r1, r0
	ldr r1, [r4, #0x14]
	add r0, r5, #0
	bl sub_0200D958
	ldr r1, [r4, #0x18]
	add r0, r5, #0
	bl sub_0200D968
	ldr r1, [r4, #0x1c]
	add r0, r5, #0
	bl sub_0200D978
	ldr r1, [r4, #0x20]
	add r0, r5, #0
	bl sub_0200D988
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02239BB4: .word ov80_0223DA54
	thumb_func_end ov80_02239B7C

	thumb_func_start ov80_02239BB8
ov80_02239BB8: ; 0x02239BB8
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #4
	blo _02239BC8
	bl GF_AssertFail
_02239BC8:
	mov r2, #0x34
	ldr r3, _02239BE4 ; =ov80_0223DA54
	mul r2, r4
	add r0, r5, #0
	add r1, r6, #0
	add r2, r3, r2
	bl sub_0200D734
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_0200DC0C
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02239BE4: .word ov80_0223DA54
	thumb_func_end ov80_02239BB8

	thumb_func_start ov80_02239BE8
ov80_02239BE8: ; 0x02239BE8
	ldr r3, _02239BEC ; =sub_0200D9DC
	bx r3
	.balign 4, 0
_02239BEC: .word sub_0200D9DC
	thumb_func_end ov80_02239BE8

	thumb_func_start ov80_02239BF0
ov80_02239BF0: ; 0x02239BF0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r3, #0
	ldr r6, [sp, #0x18]
	bl ov80_02239938
	add r4, r0, #0
	add r0, #0x26
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0x26
	mov r2, #0
	strb r7, [r0]
	cmp r6, #0
	ble _02239C24
	add r0, r2, #0
_02239C16:
	ldrsh r1, [r5, r0]
	add r2, r2, #1
	add r5, r5, #2
	strh r1, [r4, #0x28]
	add r4, r4, #2
	cmp r2, r6
	blt _02239C16
_02239C24:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02239BF0

	thumb_func_start ov80_02239C28
ov80_02239C28: ; 0x02239C28
	push {r4, lr}
	add r4, r1, #0
	add r2, r4, #0
	add r2, #0x26
	ldrb r2, [r2]
	lsl r3, r2, #2
	ldr r2, _02239C50 ; =ov80_0223DB24
	ldr r2, [r2, r3]
	cmp r2, #0
	beq _02239C4E
	blx r2
	cmp r0, #1
	bne _02239C4E
	add r4, #0x26
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
_02239C4E:
	pop {r4, pc}
	.balign 4, 0
_02239C50: .word ov80_0223DB24
	thumb_func_end ov80_02239C28

	thumb_func_start ov80_02239C54
ov80_02239C54: ; 0x02239C54
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl sub_02096868
	add r4, r0, #0
	mov r5, #0
_02239C60:
	ldr r0, [r4]
	cmp r0, #0
	beq _02239C74
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _02239C74
	add r0, r6, #0
	add r1, r4, #0
	bl ov80_02239C28
_02239C74:
	add r5, r5, #1
	add r4, #0x3c
	cmp r5, #0x20
	blt _02239C60
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_02239C54

	thumb_func_start ov80_02239C80
ov80_02239C80: ; 0x02239C80
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r1, #0
	add r4, r6, #0
	add r4, #0x26
	bl sub_0209680C
	add r5, r0, #0
	mov r0, #6
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02239CA2
	sub r0, r0, #1
	strh r0, [r4, #6]
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_02239CA2:
	ldrb r0, [r4, #1]
	cmp r0, #3
	bhi _02239D64
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02239CB4: ; jump table
	.short _02239CBC - _02239CB4 - 2 ; case 0
	.short _02239D22 - _02239CB4 - 2 ; case 1
	.short _02239D22 - _02239CB4 - 2 ; case 2
	.short _02239D22 - _02239CB4 - 2 ; case 3
_02239CBC:
	mov r0, #2
	ldrsh r1, [r4, r0]
	cmp r1, #3
	bhi _02239D0C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02239CD0: ; jump table
	.short _02239CD8 - _02239CD0 - 2 ; case 0
	.short _02239CD8 - _02239CD0 - 2 ; case 1
	.short _02239CF0 - _02239CD0 - 2 ; case 2
	.short _02239CF0 - _02239CD0 - 2 ; case 3
_02239CD8:
	mov r1, #4
	ldrsh r1, [r4, r1]
	cmp r1, #0
	bne _02239CE8
	strh r0, [r4, #8]
	mov r0, #3
	strh r0, [r4, #0xa]
	b _02239D16
_02239CE8:
	mov r1, #3
	strh r1, [r4, #8]
	strh r0, [r4, #0xa]
	b _02239D16
_02239CF0:
	mov r0, #4
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bne _02239D02
	mov r0, #0
	strh r0, [r4, #8]
	mov r0, #1
	strh r0, [r4, #0xa]
	b _02239D16
_02239D02:
	mov r0, #1
	strh r0, [r4, #8]
	mov r0, #0
	strh r0, [r4, #0xa]
	b _02239D16
_02239D0C:
	bl GF_AssertFail
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02239D16:
	mov r0, #2
	ldrsh r0, [r4, r0]
	strh r0, [r4, #0xc]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
_02239D22:
	ldrb r3, [r4, #1]
	ldr r1, [r6]
	ldrh r2, [r6, #0xc]
	add r3, r3, #2
	lsl r3, r3, #1
	add r6, r4, r3
	mov r3, #2
	ldrsh r3, [r6, r3]
	add r0, sp, #0
	bl ov80_0222EFD0
	ldr r0, [r5, #0x30]
	add r1, sp, #0
	bl ov42_022299C0
	ldrb r1, [r4, #1]
	mov r0, #2
	ldrsh r2, [r4, r0]
	add r1, r1, #2
	lsl r1, r1, #1
	add r1, r4, r1
	ldrsh r0, [r1, r0]
	cmp r2, r0
	bne _02239D5A
	mov r0, #0x2d
	strh r0, [r4, #6]
	mov r0, #1
	b _02239D6A
_02239D5A:
	mov r0, #0x1e
	strh r0, [r4, #6]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	b _02239D6A
_02239D64:
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_02239D6A:
	strb r0, [r4, #1]
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_02239C80

	thumb_func_start ov80_02239D74
ov80_02239D74: ; 0x02239D74
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x65
	mov r1, #0xc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl ov80_02239DD0
	str r0, [r4]
	add r0, r6, #0
	bl ov80_02239F48
	str r0, [r4, #4]
	mov r0, #9
	str r0, [sp]
	ldr r0, _02239DB4 ; =0x04000050
	mov r1, #4
	mov r2, #0x1f
	mov r3, #8
	bl G2x_SetBlendAlpha_
	add r0, r4, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02239DB4: .word 0x04000050
	thumb_func_end ov80_02239D74

	thumb_func_start ov80_02239DB8
ov80_02239DB8: ; 0x02239DB8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl ov80_02239EC4
	ldr r0, [r4, #4]
	bl ov80_02239F94
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov80_02239DB8

	thumb_func_start ov80_02239DD0
ov80_02239DD0: ; 0x02239DD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r1, _02239EAC ; =0x0002200C
	add r4, r0, #0
	mov r0, #0x65
	bl AllocFromHeap
	ldr r2, _02239EAC ; =0x0002200C
	str r0, [sp, #8]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, [sp, #8]
	mov r1, #0x65
	str r4, [r0, #4]
	mov r0, #0xb7
	bl NARC_ctor
	ldr r5, [sp, #8]
	ldr r4, _02239EB0 ; =ov80_0223DB2C
	str r0, [sp, #4]
	mov r6, #0
	add r5, #8
_02239DFE:
	mov r0, #0x65
	str r0, [sp]
	ldrh r1, [r4]
	ldr r0, [sp, #4]
	mov r2, #1
	add r3, sp, #0x10
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	add r7, r0, #0
	ldr r0, [sp, #0x10]
	mov r2, #1
	add r0, #0xc
	add r1, r5, #0
	lsl r2, r2, #0xc
	bl MIi_CpuCopy32
	add r0, r7, #0
	bl FreeToHeap
	mov r0, #1
	lsl r0, r0, #0xc
	add r6, r6, #1
	add r4, r4, #2
	add r5, r5, r0
	cmp r6, #2
	blt _02239DFE
	ldr r0, [sp, #4]
	bl NARC_dtor
	mov r0, #0xb7
	mov r1, #0x65
	bl NARC_ctor
	mov r1, #0x65
	str r1, [sp]
	mov r1, #0xe
	mov r2, #1
	add r3, sp, #0xc
	add r4, r0, #0
	bl GfGfxLoader_GetCharDataFromOpenNarc
	ldr r3, [sp, #0xc]
	add r5, r0, #0
	ldr r2, _02239EB4 ; =0x00002008
	ldr r1, [sp, #8]
	ldr r0, [r3, #0x14]
	add r1, r1, r2
	ldr r2, [r3, #0x10]
	bl MIi_CpuCopy32
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #0x65
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xf
	mov r2, #1
	add r3, sp, #0xc
	bl GfGfxLoader_GetCharDataFromOpenNarc
	ldr r3, [sp, #0xc]
	add r5, r0, #0
	ldr r2, _02239EB8 ; =0x00012008
	ldr r1, [sp, #8]
	ldr r0, [r3, #0x14]
	add r1, r1, r2
	ldr r2, [r3, #0x10]
	bl MIi_CpuCopy32
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	bl NARC_dtor
	ldr r0, _02239EBC ; =ov80_02239ED8
	ldr r1, [sp, #8]
	ldr r2, _02239EC0 ; =0x0001368C
	bl CreateSysTask
	ldr r1, [sp, #8]
	str r0, [r1]
	add r0, r1, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02239EAC: .word 0x0002200C
_02239EB0: .word ov80_0223DB2C
_02239EB4: .word 0x00002008
_02239EB8: .word 0x00012008
_02239EBC: .word ov80_02239ED8
_02239EC0: .word 0x0001368C
	thumb_func_end ov80_02239DD0

	thumb_func_start ov80_02239EC4
ov80_02239EC4: ; 0x02239EC4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02239EC4

	thumb_func_start ov80_02239ED8
ov80_02239ED8: ; 0x02239ED8
	push {r3, r4, lr}
	sub sp, #4
	ldr r3, _02239F3C ; =0x00022008
	add r4, r1, #0
	ldrb r0, [r4, r3]
	cmp r0, #0xc
	bhs _02239EEE
	add r0, r0, #1
	add sp, #4
	strb r0, [r4, r3]
	pop {r3, r4, pc}
_02239EEE:
	mov r0, #0
	strb r0, [r4, r3]
	str r0, [sp]
	add r3, r3, #1
	ldrb r3, [r4, r3]
	ldr r2, _02239F40 ; =0x00002008
	ldr r0, [r4, #4]
	add r2, r4, r2
	lsl r3, r3, #0x10
	add r2, r2, r3
	mov r3, #1
	mov r1, #3
	lsl r3, r3, #0x10
	bl BG_LoadCharTilesData
	ldr r2, _02239F44 ; =0x00022009
	add r3, r4, #0
	ldrb r2, [r4, r2]
	add r3, #8
	ldr r0, [r4, #4]
	lsl r2, r2, #0xc
	add r2, r3, r2
	mov r3, #1
	mov r1, #3
	lsl r3, r3, #0xc
	bl BG_LoadScreenTilemapData
	ldr r0, [r4, #4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	ldr r1, _02239F44 ; =0x00022009
	mov r0, #1
	ldrb r2, [r4, r1]
	eor r0, r2
	strb r0, [r4, r1]
	add sp, #4
	pop {r3, r4, pc}
	nop
_02239F3C: .word 0x00022008
_02239F40: .word 0x00002008
_02239F44: .word 0x00022009
	thumb_func_end ov80_02239ED8

	thumb_func_start ov80_02239F48
ov80_02239F48: ; 0x02239F48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x65
	mov r1, #0x6c
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x6c
	bl MI_CpuFill8
	add r0, r4, #0
	str r5, [r4, #4]
	mov r1, #2
	add r0, #0x68
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #0
	bl PaletteData_GetUnfadedBuf
	add r1, r4, #0
	add r0, #0xa0
	add r1, #8
	mov r2, #0x60
	bl MIi_CpuCopy16
	ldr r0, _02239F8C ; =ov80_02239FA8
	ldr r2, _02239F90 ; =0x0001368D
	add r1, r4, #0
	bl CreateSysTask
	str r0, [r4]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02239F8C: .word ov80_02239FA8
_02239F90: .word 0x0001368D
	thumb_func_end ov80_02239F48

	thumb_func_start ov80_02239F94
ov80_02239F94: ; 0x02239F94
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02239F94

	thumb_func_start ov80_02239FA8
ov80_02239FA8: ; 0x02239FA8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	add r0, r4, #0
	add r0, #0x69
	ldrb r0, [r0]
	cmp r0, #8
	bhs _02239FC8
	add r0, r4, #0
	add r0, #0x69
	ldrb r0, [r0]
	add r4, #0x69
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02239FC8:
	add r0, r4, #0
	mov r2, #0
	add r0, #0x69
	strb r2, [r0]
	mov r0, #0x20
	str r0, [sp]
	add r1, #0x68
	ldrb r1, [r1]
	add r3, r4, #0
	ldr r0, [r4, #4]
	add r3, #8
	lsl r1, r1, #5
	add r1, r3, r1
	mov r3, #0x60
	bl PaletteData_LoadPalette
	add r0, r4, #0
	add r0, #0x68
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x68
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x68
	ldrb r0, [r0]
	cmp r0, #3
	blo _0223A006
	mov r0, #0
	add r4, #0x68
	strb r0, [r4]
_0223A006:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov80_02239FA8

	thumb_func_start ov80_0223A00C
ov80_0223A00C: ; 0x0223A00C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r7, r2, #0
	mov r1, #0x5a
	mov r2, #0xfa
	str r3, [sp]
	ldr r0, _0223A0B4 ; =ov80_0223A144
	lsl r1, r1, #2
	lsl r2, r2, #2
	mov r3, #0x65
	bl sub_02007200
	bl sub_0201F988
	add r4, r0, #0
	str r5, [r4, #0x10]
	ldr r0, [sp]
	str r7, [r4, #0x14]
	str r0, [r4, #0x18]
	ldr r0, [sp, #0x18]
	add r1, sp, #8
	str r0, [r4, #0x1c]
	ldr r0, [sp, #0x1c]
	str r0, [r4, #0x20]
	mov r0, #0x18
	ldrsh r0, [r1, r0]
	strh r0, [r4, #0x28]
	mov r0, #0x1c
	ldrsh r0, [r1, r0]
	mov r1, #0x65
	strh r0, [r4, #0x2a]
	mov r0, #0x6d
	bl NARC_ctor
	str r0, [r4, #0x24]
	ldr r1, [r4, #0x20]
	cmp r1, #0
	beq _0223A05E
	mov r0, #0
	strh r0, [r1]
_0223A05E:
	add r0, r4, #0
	sub r1, r6, #1
	add r0, #0x2c
	strb r1, [r0]
	mov r0, #1
	bl BgGetCharPtr
	mov r2, #2
	add r1, r0, #0
	mov r0, #0
	lsl r2, r2, #0xe
	bl MIi_CpuClear32
	mov r2, #0
	add r0, r5, #0
	mov r1, #1
	add r3, r2, #0
	bl ScheduleSetBgPosText
	add r0, r5, #0
	mov r1, #1
	mov r2, #3
	mov r3, #0
	bl ScheduleSetBgPosText
	add r1, r4, #0
	add r1, #0x2c
	ldrb r2, [r1]
	mov r1, #0xc
	ldr r3, _0223A0B8 ; =ov80_0223DB98
	mul r1, r2
	add r0, r4, #0
	add r1, r3, r1
	bl ov80_0223A938
	ldr r0, _0223A0BC ; =ov80_0223A0EC
	add r1, r4, #0
	mov r2, #1
	bl sub_0200E374
	str r0, [r4, #0x34]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A0B4: .word ov80_0223A144
_0223A0B8: .word ov80_0223DB98
_0223A0BC: .word ov80_0223A0EC
	thumb_func_end ov80_0223A00C

	thumb_func_start ov80_0223A0C0
ov80_0223A0C0: ; 0x0223A0C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl DestroySysTask
	ldr r0, [r5, #0x34]
	bl DestroySysTask
	ldr r0, [r5, #0x24]
	bl NARC_dtor
	ldr r1, [r5, #0xc]
	mov r0, #0x65
	bl FreeToHeapExplicit
	add r0, r4, #0
	bl sub_02007234
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223A0C0

	thumb_func_start ov80_0223A0EC
ov80_0223A0EC: ; 0x0223A0EC
	push {r3, r4, r5, r6}
	add r0, r1, #0
	ldr r1, _0223A13C ; =0x00000151
	sub r2, r1, #2
	ldrb r3, [r0, r2]
	sub r2, r1, #3
	ldrb r2, [r0, r2]
	ldrb r4, [r0, r1]
	lsl r3, r3, #8
	lsl r5, r2, #8
	add r6, r5, #0
	sub r5, r1, #1
	mov r2, #0xff
	lsl r2, r2, #8
	and r3, r2
	ldrb r5, [r0, r5]
	and r6, r2
	orr r3, r4
	orr r5, r6
	ldr r6, _0223A140 ; =0x04000040
	strh r5, [r6]
	strh r3, [r6, #4]
	add r3, r1, #4
	ldrb r5, [r0, r3]
	add r3, r1, #2
	ldrb r4, [r0, r3]
	add r3, r1, #1
	ldrb r3, [r0, r3]
	add r1, r1, #3
	ldrb r0, [r0, r1]
	lsl r3, r3, #8
	and r3, r2
	orr r0, r3
	strh r0, [r6, #2]
	lsl r0, r4, #8
	and r0, r2
	orr r0, r5
	strh r0, [r6, #6]
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_0223A13C: .word 0x00000151
_0223A140: .word 0x04000040
	thumb_func_end ov80_0223A0EC

	thumb_func_start ov80_0223A144
ov80_0223A144: ; 0x0223A144
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r3, r4, #0
	add r3, #0x2c
	ldrb r6, [r3]
	mov r3, #0xc
	ldr r2, _0223A170 ; =ov80_0223DB98
	mul r3, r6
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #0x65
	add r2, r2, r3
	bl ov80_0223A174
	cmp r0, #1
	bne _0223A16C
	add r0, r4, #0
	add r1, r5, #0
	bl ov80_0223A0C0
_0223A16C:
	pop {r4, r5, r6, pc}
	nop
_0223A170: .word ov80_0223DB98
	thumb_func_end ov80_0223A144

	thumb_func_start ov80_0223A174
ov80_0223A174: ; 0x0223A174
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r4, r0, #0
	add r6, r1, #0
	ldr r1, [r4]
	add r7, r2, #0
	ldr r5, [r4, #0xc]
	cmp r1, #0x12
	bls _0223A188
	b _0223A620
_0223A188:
	add r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	add pc, r2
_0223A194: ; jump table
	.short _0223A1BA - _0223A194 - 2 ; case 0
	.short _0223A410 - _0223A194 - 2 ; case 1
	.short _0223A42E - _0223A194 - 2 ; case 2
	.short _0223A43E - _0223A194 - 2 ; case 3
	.short _0223A458 - _0223A194 - 2 ; case 4
	.short _0223A468 - _0223A194 - 2 ; case 5
	.short _0223A476 - _0223A194 - 2 ; case 6
	.short _0223A48A - _0223A194 - 2 ; case 7
	.short _0223A4A6 - _0223A194 - 2 ; case 8
	.short _0223A4AC - _0223A194 - 2 ; case 9
	.short _0223A4C4 - _0223A194 - 2 ; case 10
	.short _0223A4D0 - _0223A194 - 2 ; case 11
	.short _0223A4F4 - _0223A194 - 2 ; case 12
	.short _0223A57A - _0223A194 - 2 ; case 13
	.short _0223A594 - _0223A194 - 2 ; case 14
	.short _0223A5A8 - _0223A194 - 2 ; case 15
	.short _0223A5B8 - _0223A194 - 2 ; case 16
	.short _0223A5D8 - _0223A194 - 2 ; case 17
	.short _0223A5E8 - _0223A194 - 2 ; case 18
_0223A1BA:
	add r0, r6, #0
	mov r1, #0x94
	bl AllocFromHeap
	str r0, [r4, #0xc]
	mov r1, #0
	mov r2, #0x94
	bl memset
	ldr r5, [r4, #0xc]
	ldr r0, [r4, #0x24]
	mov r1, #2
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0223A50C ; =0x000007D4
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x18]
	bl sub_0200D68C
	mov r3, #0x59
	add r1, r0, #0
	lsl r3, r3, #2
	mov r2, #1
	lsl r2, r1
	ldr r0, [r4, r3]
	mov r1, #0x65
	orr r0, r2
	str r0, [r4, r3]
	mov r0, #4
	bl sub_02013534
	str r0, [r4, #0x30]
	ldr r2, _0223A510 ; =0x000002D9
	mov r0, #1
	mov r1, #0x1b
	add r3, r6, #0
	bl NewMsgDataFromNarc
	ldr r1, [r7]
	str r0, [sp, #0x20]
	bl NewString_ReadMsgData
	str r0, [sp, #0x24]
	ldr r0, _0223A514 ; =0x00010200
	add r1, r5, #0
	str r0, [sp]
	mov r3, #0
	ldr r0, _0223A50C ; =0x000007D4
	str r3, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x28
	ldrsh r0, [r4, r0]
	ldr r2, [sp, #0x24]
	add r1, #0x7c
	add r0, #0x74
	str r0, [sp, #0xc]
	mov r0, #0x2a
	ldrsh r0, [r4, r0]
	add r0, #0x58
	str r0, [sp, #0x10]
	str r3, [sp, #0x14]
	str r3, [sp, #0x18]
	add r0, r4, #0
	bl ov80_0223A62C
	ldr r0, [r5, #0x7c]
	mov r1, #0
	bl sub_020137C0
	ldr r0, [sp, #0x24]
	bl String_dtor
	ldr r0, [sp, #0x20]
	bl DestroyMsgData
	ldr r0, [r4, #0x24]
	mov r1, #2
	str r0, [sp]
	ldrb r0, [r7, #4]
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0223A518 ; =0x000007D2
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x18]
	bl sub_0200D68C
	mov r3, #0x16
	lsl r3, r3, #4
	str r0, [r4, r3]
	add r0, r3, #4
	ldr r2, [r4, r3]
	mov r1, #1
	ldr r0, [r4, r0]
	lsl r1, r2
	orr r1, r0
	add r0, r3, #4
	str r1, [r4, r0]
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r0, _0223A51C ; =0x000007DA
	str r0, [sp, #8]
	ldrb r3, [r7, #5]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0223A518 ; =0x000007D2
	str r0, [sp, #4]
	ldrb r3, [r7, #6]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0223A518 ; =0x000007D2
	str r0, [sp, #4]
	ldrb r3, [r7, #7]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl sub_0200D71C
	mov r0, #0xe
	str r0, [sp]
	mov r0, #0
	mov r2, #0x16
	str r0, [sp, #4]
	lsl r2, r2, #4
	ldr r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	lsl r2, r2, #0x14
	mov r1, #2
	lsr r2, r2, #0x10
	mov r3, #0x10
	bl sub_02003E5C
	ldr r0, [r4, #0x24]
	mov r1, #2
	str r0, [sp]
	mov r0, #0x3b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0223A520 ; =0x000007D3
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x14]
	ldr r3, [r4, #0x18]
	bl sub_0200D68C
	add r3, r0, #0
	mov r7, #0x59
	mov r0, #1
	lsl r7, r7, #2
	add r1, r0, #0
	lsl r1, r3
	ldr r2, [r4, r7]
	mov r3, #0xcc
	orr r1, r2
	str r1, [r4, r7]
	mov r1, #0
	str r1, [sp]
	str r0, [sp, #4]
	ldr r0, _0223A524 ; =0x000007DB
	str r0, [sp, #8]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl sub_0200D504
	mov r0, #0
	str r0, [sp]
	ldr r0, _0223A520 ; =0x000007D3
	mov r3, #0xcd
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	ldr r0, _0223A520 ; =0x000007D3
	mov r3, #0xce
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, [r4, #0x24]
	bl sub_0200D71C
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	ldr r2, _0223A528 ; =ov80_0223DB30
	bl sub_0200D734
	add r1, r5, #0
	add r1, #0x90
	str r0, [r1]
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_0200DC0C
	mov r0, #0x2a
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0223A3AA
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	str r0, [sp, #0x1c]
	b _0223A3BA
_0223A3AA:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
	str r0, [sp, #0x1c]
_0223A3BA:
	mov r0, #0x28
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _0223A3D4
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _0223A3E2
_0223A3D4:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_0223A3E2:
	bl _ffix
	add r7, r0, #0
	ldr r0, [sp, #0x1c]
	bl _ffix
	add r5, #0x14
	add r1, r5, #0
	mov r2, #0x12
	mov r5, #0x52
	add r3, r0, #0
	lsl r2, r2, #0xe
	lsl r5, r5, #0xc
	str r6, [sp]
	add r0, r4, #0
	add r2, r7, r2
	add r3, r3, r5
	bl ov80_0223A78C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A410:
	mov r0, #3
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0
	ldr r3, _0223A52C ; =0x00007FFF
	str r6, [sp, #8]
	add r1, r0, #0
	add r2, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A42E:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223A4FC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A43E:
	mov r0, #3
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, _0223A52C ; =0x00007FFF
	str r6, [sp, #8]
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A458:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223A4FC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A468:
	mov r1, #0
	bl ov80_0223AA80
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A476:
	mov r0, #0x53
	lsl r0, r0, #2
	ldrb r0, [r4, r0]
	cmp r0, #1
	bne _0223A4FC
	add r0, r1, #1
	str r0, [r4]
	mov r0, #0xa
	str r0, [r5, #0x78]
	b _0223A620
_0223A48A:
	ldr r0, [r5, #0x78]
	sub r0, r0, #1
	str r0, [r5, #0x78]
	bpl _0223A4FC
	add r5, #0x14
	add r0, r5, #0
	bl ov80_0223A834
	cmp r0, #1
	bne _0223A4FC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A4A6:
	add r0, r1, #1
	str r0, [r4]
	b _0223A620
_0223A4AC:
	mov r2, #0x56
	lsl r2, r2, #2
	add r1, r5, #0
	add r2, r4, r2
	bl ov80_0223AB94
	cmp r0, #1
	bne _0223A4FC
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A4C4:
	mov r0, #0xa
	str r0, [r5, #0x78]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A4D0:
	ldr r0, [r5, #0x78]
	sub r0, r0, #1
	str r0, [r5, #0x78]
	bpl _0223A4FC
	mov r0, #3
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r1, #0
	ldr r3, _0223A52C ; =0x00007FFF
	str r6, [sp, #8]
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A4F4:
	bl IsPaletteFadeFinished
	cmp r0, #0
	bne _0223A4FE
_0223A4FC:
	b _0223A620
_0223A4FE:
	mov r0, #0
	mov r2, #0x59
	str r0, [sp]
	lsl r2, r2, #2
	ldr r3, [r4, r2]
	ldr r2, _0223A530 ; =0x00003FFF
	b _0223A534
	.balign 4, 0
_0223A50C: .word 0x000007D4
_0223A510: .word 0x000002D9
_0223A514: .word 0x00010200
_0223A518: .word 0x000007D2
_0223A51C: .word 0x000007DA
_0223A520: .word 0x000007D3
_0223A524: .word 0x000007DB
_0223A528: .word ov80_0223DB30
_0223A52C: .word 0x00007FFF
_0223A530: .word 0x00003FFF
_0223A534:
	ldr r0, [r4, #0x1c]
	eor r2, r3
	lsl r2, r2, #0x10
	mov r1, #2
	lsr r2, r2, #0x10
	mov r3, #0xe
	bl sub_02003EA4
	mov r0, #0
	str r0, [sp]
	mov r2, #0x16
	str r0, [sp, #4]
	lsl r2, r2, #4
	ldr r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	lsl r2, r2, #0x14
	mov r1, #2
	lsr r2, r2, #0x10
	mov r3, #0x10
	bl sub_02003E5C
	mov r0, #0xd
	mvn r0, r0
	mov r1, #0x2c
	mov r2, #1
	bl SetBlendBrightness
	ldr r0, [r5, #0x7c]
	mov r1, #1
	bl sub_020137C0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A57A:
	mov r0, #3
	mov r1, #1
	str r0, [sp]
	str r1, [sp, #4]
	ldr r3, _0223A628 ; =0x00007FFF
	str r6, [sp, #8]
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A594:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223A620
	mov r0, #0x1a
	str r0, [r5, #0x78]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A5A8:
	ldr r0, [r5, #0x78]
	sub r0, r0, #1
	str r0, [r5, #0x78]
	bpl _0223A620
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A5B8:
	mov r0, #0xf
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x65
	mov r1, #0
	str r0, [sp, #8]
	ldr r3, _0223A628 ; =0x00007FFF
	mov r0, #3
	add r2, r1, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A5D8:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0223A620
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223A620
_0223A5E8:
	ldr r1, _0223A628 ; =0x00007FFF
	mov r0, #1
	bl sub_0200FBF4
	ldr r1, [r4, #0x20]
	cmp r1, #0
	beq _0223A5FA
	mov r0, #1
	strh r0, [r1]
_0223A5FA:
	add r0, r5, #0
	add r0, #0x7c
	bl ov80_0223A748
	ldr r0, [r4, #0x30]
	bl sub_020135AC
	add r0, r5, #0
	add r0, #0x90
	ldr r0, [r0]
	bl sub_0200D9DC
	add r5, #0x14
	add r0, r5, #0
	bl ov80_0223A81C
	add sp, #0x28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0223A620:
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223A628: .word 0x00007FFF
	thumb_func_end ov80_0223A174

	thumb_func_start ov80_0223A62C
ov80_0223A62C: ; 0x0223A62C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	add r5, r1, #0
	add r7, r0, #0
	ldr r0, [r5]
	str r2, [sp, #0x18]
	str r3, [sp, #0x1c]
	ldr r6, [sp, #0x9c]
	ldr r4, [sp, #0xa8]
	cmp r0, #0
	beq _0223A646
	bl GF_AssertFail
_0223A646:
	ldr r0, [r7, #0x10]
	cmp r4, #0
	str r0, [sp, #0x24]
	ldr r0, [r7, #0x18]
	str r0, [sp, #0x20]
	bne _0223A660
	ldr r0, [sp, #0x18]
	ldr r1, [sp, #0x1c]
	add r2, sp, #0x2c
	add r3, sp, #0x28
	bl ov80_0223A75C
	b _0223A668
_0223A660:
	ldrh r0, [r4, #0x12]
	str r0, [sp, #0x2c]
	ldrh r0, [r4, #0x10]
	str r0, [sp, #0x28]
_0223A668:
	cmp r4, #0
	bne _0223A6A6
	add r0, sp, #0x3c
	bl InitWindow
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [sp, #0x28]
	ldr r0, [sp, #0x24]
	lsl r2, r2, #0x18
	add r1, sp, #0x3c
	lsr r2, r2, #0x18
	mov r3, #2
	bl AddTextWindowTopLeftCorner
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r2, [sp, #0x18]
	add r0, sp, #0x3c
	str r3, [sp, #0x14]
	bl AddTextPrinterParameterized3
	b _0223A6B2
_0223A6A6:
	add r3, r4, #0
	add r2, sp, #0x3c
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
_0223A6B2:
	add r0, sp, #0x3c
	mov r1, #1
	mov r2, #0x65
	bl sub_02013688
	mov r1, #1
	add r2, r1, #0
	add r3, sp, #0x30
	bl sub_02021AC8
	ldr r0, [sp, #0xa4]
	cmp r0, #1
	bne _0223A6D6
	ldr r1, [sp, #0x2c]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	sub r6, r6, r0
_0223A6D6:
	ldr r0, [r7, #0x30]
	str r0, [sp, #0x4c]
	add r0, sp, #0x3c
	str r0, [sp, #0x50]
	ldr r0, [sp, #0x20]
	bl sub_0200E2B0
	str r0, [sp, #0x54]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x98]
	bl sub_0200D934
	mov r1, #0
	str r0, [sp, #0x58]
	ldr r0, [sp, #0x34]
	str r1, [sp, #0x5c]
	str r0, [sp, #0x60]
	ldr r0, [sp, #0xa0]
	str r6, [sp, #0x64]
	sub r0, #8
	str r0, [sp, #0x68]
	mov r0, #0xb
	str r0, [sp, #0x70]
	mov r0, #1
	str r0, [sp, #0x74]
	mov r0, #0x65
	str r0, [sp, #0x78]
	add r0, sp, #0x4c
	str r1, [sp, #0x6c]
	bl sub_020135D8
	ldr r1, [sp, #0x94]
	add r7, r0, #0
	bl sub_020138E0
	ldr r2, [sp, #0xa0]
	add r0, r7, #0
	add r1, r6, #0
	sub r2, #8
	bl sub_020136B4
	cmp r4, #0
	bne _0223A732
	add r0, sp, #0x3c
	bl RemoveWindow
_0223A732:
	str r7, [r5]
	add r3, sp, #0x30
	ldmia r3!, {r0, r1}
	add r2, r5, #4
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #0x2c]
	strh r0, [r5, #0x10]
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223A62C

	thumb_func_start ov80_0223A748
ov80_0223A748: ; 0x0223A748
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl sub_02013660
	add r0, r4, #4
	bl sub_02021B5C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223A748

	thumb_func_start ov80_0223A75C
ov80_0223A75C: ; 0x0223A75C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r6, r2, #0
	add r0, r1, #0
	add r1, r4, #0
	mov r2, #0
	add r7, r3, #0
	bl FontID_String_GetWidth
	add r4, r0, #0
	asr r1, r4, #2
	lsr r1, r1, #0x1d
	add r1, r4, r1
	asr r5, r1, #3
	mov r1, #8
	bl FX_ModS32
	cmp r0, #0
	beq _0223A784
	add r5, r5, #1
_0223A784:
	str r4, [r6]
	str r5, [r7]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0223A75C

	thumb_func_start ov80_0223A78C
ov80_0223A78C: ; 0x0223A78C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r6, r3, #0
	mov ip, r2
	ldr r3, _0223A818 ; =ov80_0223DB64
	add r7, r0, #0
	add r4, r1, #0
	add r2, sp, #0
	mov r5, #6
_0223A79E:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r5, r5, #1
	bne _0223A79E
	ldr r0, [r3]
	add r5, r4, #0
	str r0, [r2]
	mov r0, ip
	asr r1, r0, #0xc
	add r0, sp, #0
	strh r1, [r0]
	asr r1, r6, #0xc
	strh r1, [r0, #2]
	mov r6, #0
	strh r6, [r4]
	strh r6, [r4, #2]
	add r5, #0x14
_0223A7C0:
	ldr r0, [r7, #0x14]
	ldr r1, [r7, #0x18]
	add r2, sp, #0
	bl sub_0200D734
	mov r1, #0
	str r0, [r4, #4]
	bl sub_0200DCE8
	cmp r6, #3
	beq _0223A7FA
	ldr r0, [r4, #4]
	mov r1, #2
	ldr r0, [r0]
	bl sub_0202487C
	ldr r0, [r4, #4]
	mov r1, #1
	ldr r0, [r0]
	bl Set2dSpriteAnimSeqNo
	mov r1, #2
	lsl r1, r1, #0xc
	add r0, r5, #0
	lsr r2, r1, #1
	mov r3, #6
	bl ov80_0223A8C4
	b _0223A808
_0223A7FA:
	mov r1, #1
	lsl r1, r1, #0xc
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #6
	bl ov80_0223A8C4
_0223A808:
	add r6, r6, #1
	add r4, r4, #4
	add r5, #0x14
	cmp r6, #4
	blt _0223A7C0
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_0223A818: .word ov80_0223DB64
	thumb_func_end ov80_0223A78C

	thumb_func_start ov80_0223A81C
ov80_0223A81C: ; 0x0223A81C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0223A822:
	ldr r0, [r5, #4]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0223A822
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0223A81C

	thumb_func_start ov80_0223A834
ov80_0223A834: ; 0x0223A834
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r0, #0
	mov r0, #1
	mov r1, #2
	str r0, [sp]
	ldrsh r0, [r7, r1]
	cmp r0, #4
	bge _0223A862
	mov r0, #0
	str r0, [sp]
	ldrsh r0, [r7, r0]
	sub r0, r0, #1
	strh r0, [r7]
	ldr r0, [sp]
	ldrsh r0, [r7, r0]
	cmp r0, #0
	bgt _0223A862
	mov r0, #3
	strh r0, [r7]
	ldrsh r0, [r7, r1]
	add r0, r0, #1
	strh r0, [r7, #2]
_0223A862:
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	ldrsh r0, [r7, r0]
	cmp r0, #0
	ble _0223A8BE
	add r6, r7, #0
	add r6, #0x14
	add r4, r7, #0
	add r5, r7, #0
_0223A876:
	add r0, r6, #0
	bl ov80_0223A8D4
	ldr r1, [r4, #0x14]
	str r0, [sp, #8]
	add r0, sp, #0xc
	add r2, r1, #0
	add r3, r1, #0
	bl ov80_0223A91C
	ldr r0, [r5, #4]
	add r1, sp, #0xc
	ldr r0, [r0]
	bl sub_020247F4
	ldr r0, [r5, #4]
	mov r1, #1
	ldr r0, [r0]
	bl Set2dSpriteVisibleFlag
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _0223A8A8
	mov r0, #0
	str r0, [sp]
_0223A8A8:
	ldr r0, [sp, #4]
	add r6, #0x14
	add r0, r0, #1
	str r0, [sp, #4]
	mov r0, #2
	ldrsh r1, [r7, r0]
	ldr r0, [sp, #4]
	add r4, #0x14
	add r5, r5, #4
	cmp r0, r1
	blt _0223A876
_0223A8BE:
	ldr r0, [sp]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223A834

	thumb_func_start ov80_0223A8C4
ov80_0223A8C4: ; 0x0223A8C4
	str r1, [r0]
	str r1, [r0, #4]
	sub r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov80_0223A8C4

	thumb_func_start ov80_0223A8D4
ov80_0223A8D4: ; 0x0223A8D4
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #0xc]
	ldr r0, [r4, #8]
	lsl r2, r2, #0xc
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	ldr r1, [r4, #0x10]
	lsl r1, r1, #0xc
	bl FX_Div
	ldr r1, [r4, #4]
	add r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r0, r0, #1
	cmp r0, r1
	bgt _0223A914
	str r0, [r4, #0xc]
	mov r0, #0
	pop {r4, pc}
_0223A914:
	str r1, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223A8D4

	thumb_func_start ov80_0223A91C
ov80_0223A91C: ; 0x0223A91C
	push {r4}
	sub sp, #0xc
	str r2, [sp, #4]
	str r3, [sp, #8]
	add r2, sp, #0
	add r4, r0, #0
	str r1, [sp]
	ldmia r2!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	add sp, #0xc
	pop {r4}
	bx lr
	thumb_func_end ov80_0223A91C

	thumb_func_start ov80_0223A938
ov80_0223A938: ; 0x0223A938
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r3, #1
	lsl r3, r3, #0x1a
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r3]
	ldr r0, _0223AA3C ; =0xFFFF1FFF
	add r2, r3, #0
	and r1, r0
	mov r0, #6
	lsl r0, r0, #0xc
	orr r0, r1
	str r0, [r3]
	add r2, #0x48
	ldrh r6, [r2]
	mov r0, #0x3f
	mov r1, #0x1f
	bic r6, r0
	orr r1, r6
	mov r7, #0x20
	orr r1, r7
	strh r1, [r2]
	ldrh r6, [r2]
	ldr r1, _0223AA40 ; =0xFFFFC0FF
	and r1, r6
	mov r6, #0x1f
	lsl r6, r6, #8
	orr r6, r1
	lsl r1, r7, #8
	orr r1, r6
	strh r1, [r2]
	add r1, r3, #0
	add r1, #0x4a
	ldrh r2, [r1]
	bic r2, r0
	mov r0, #0x1d
	orr r0, r2
	orr r0, r7
	strh r0, [r1]
	add r1, r3, #0
	mov r0, #0
	add r1, #0x40
	strh r0, [r1]
	add r1, r3, #0
	add r1, #0x44
	strh r0, [r1]
	add r1, r3, #0
	add r1, #0x42
	strh r0, [r1]
	add r3, #0x46
	strh r0, [r3]
	str r0, [sp]
	str r7, [sp, #4]
	mov r0, #0xc0
	str r0, [sp, #8]
	ldrb r2, [r4, #8]
	ldr r0, [r5, #0x1c]
	mov r1, #0x6d
	mov r3, #0x65
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldrb r1, [r4, #9]
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x10]
	mov r3, #1
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x65
	str r0, [sp, #0xc]
	ldrb r1, [r4, #0xa]
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x10]
	mov r3, #1
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add r0, r7, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0xc
	str r0, [sp, #8]
	mov r2, #0
	ldr r0, [r5, #0x10]
	mov r1, #1
	add r3, r2, #0
	bl BgTilemapRectChangePalette
	ldr r0, [r5, #0x10]
	mov r1, #1
	bl ScheduleBgTilemapBufferTransfer
	ldrb r1, [r4, #8]
	mov r0, #0x6d
	add r2, sp, #0x10
	mov r3, #0x65
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	ldr r0, [sp, #0x10]
	add r1, r5, #0
	add r2, r7, #0
	ldr r0, [r0, #0xc]
	add r1, #0x40
	add r2, #0xe0
	bl MIi_CpuCopy16
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, _0223AA44 ; =ov80_0223AA4C
	ldr r2, _0223AA48 ; =0x0000044C
	add r1, r5, #0
	bl CreateSysTask
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r5, r1]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0223AA3C: .word 0xFFFF1FFF
_0223AA40: .word 0xFFFFC0FF
_0223AA44: .word ov80_0223AA4C
_0223AA48: .word 0x0000044C
	thumb_func_end ov80_0223A938

	thumb_func_start ov80_0223AA4C
ov80_0223AA4C: ; 0x0223AA4C
	push {r3, lr}
	ldr r0, [r1, #0x38]
	add r0, r0, #1
	str r0, [r1, #0x38]
	bmi _0223AA7E
	mov r2, #0
	str r2, [r1, #0x38]
	ldr r0, [r1, #0x3c]
	add r0, r0, #1
	str r0, [r1, #0x3c]
	cmp r0, #8
	blt _0223AA66
	str r2, [r1, #0x3c]
_0223AA66:
	mov r0, #0x20
	str r0, [sp]
	add r2, r1, #0
	ldr r0, [r1, #0x1c]
	ldr r1, [r1, #0x3c]
	add r2, #0x40
	lsl r1, r1, #5
	add r1, r2, r1
	mov r2, #0
	mov r3, #0xc0
	bl PaletteData_LoadPalette
_0223AA7E:
	pop {r3, pc}
	thumb_func_end ov80_0223AA4C

	thumb_func_start ov80_0223AA80
ov80_0223AA80: ; 0x0223AA80
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0x51
	lsl r1, r1, #2
	add r4, r0, r1
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	cmp r5, #0
	bne _0223AAAE
	mov r0, #5
	lsl r0, r0, #0xc
	str r0, [r4]
	str r0, [r4, #4]
	mov r2, #0xfa
	ldr r0, _0223AAC8 ; =ov80_0223AAD0
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	pop {r3, r4, r5, pc}
_0223AAAE:
	mov r0, #0x2e
	lsl r0, r0, #8
	str r0, [r4]
	mov r0, #0x72
	lsl r0, r0, #8
	str r0, [r4, #4]
	mov r2, #0xfa
	ldr r0, _0223AACC ; =ov80_0223AB34
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223AAC8: .word ov80_0223AAD0
_0223AACC: .word ov80_0223AB34
	thumb_func_end ov80_0223AA80

	thumb_func_start ov80_0223AAD0
ov80_0223AAD0: ; 0x0223AAD0
	push {r3, lr}
	ldrb r2, [r1, #9]
	cmp r2, #0
	bne _0223AB28
	mov r0, #2
	ldr r2, [r1]
	lsl r0, r0, #0xa
	sub r2, r2, r0
	str r2, [r1]
	ldr r2, [r1, #4]
	add r0, r2, r0
	str r0, [r1, #4]
	mov r0, #0x2e
	ldr r2, [r1]
	lsl r0, r0, #8
	cmp r2, r0
	bgt _0223AB00
	str r0, [r1]
	mov r0, #0x72
	lsl r0, r0, #8
	str r0, [r1, #4]
	ldrb r0, [r1, #9]
	add r0, r0, #1
	strb r0, [r1, #9]
_0223AB00:
	mov r0, #0
	strb r0, [r1, #0xa]
	ldr r2, [r1]
	asr r2, r2, #8
	strb r2, [r1, #0xb]
	mov r2, #0xff
	strb r2, [r1, #0xc]
	ldr r2, [r1, #4]
	asr r2, r2, #8
	strb r2, [r1, #0xd]
	mov r2, #1
	strb r2, [r1, #0xe]
	ldr r2, [r1]
	asr r2, r2, #8
	strb r2, [r1, #0xf]
	strb r0, [r1, #0x10]
	ldr r0, [r1, #4]
	asr r0, r0, #8
	strb r0, [r1, #0x11]
	pop {r3, pc}
_0223AB28:
	mov r2, #1
	strb r2, [r1, #8]
	bl DestroySysTask
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0223AAD0

	thumb_func_start ov80_0223AB34
ov80_0223AB34: ; 0x0223AB34
	push {r3, lr}
	ldrb r2, [r1, #9]
	cmp r2, #0
	bne _0223AB88
	mov r0, #2
	ldr r2, [r1]
	lsl r0, r0, #0xa
	add r2, r2, r0
	str r2, [r1]
	ldr r2, [r1, #4]
	sub r0, r2, r0
	str r0, [r1, #4]
	mov r0, #5
	ldr r2, [r1]
	lsl r0, r0, #0xc
	cmp r2, r0
	blt _0223AB60
	str r0, [r1]
	str r0, [r1, #4]
	ldrb r0, [r1, #9]
	add r0, r0, #1
	strb r0, [r1, #9]
_0223AB60:
	mov r0, #0
	strb r0, [r1, #0xa]
	ldr r2, [r1]
	asr r2, r2, #8
	strb r2, [r1, #0xb]
	mov r2, #0xff
	strb r2, [r1, #0xc]
	ldr r2, [r1, #4]
	asr r2, r2, #8
	strb r2, [r1, #0xd]
	mov r2, #1
	strb r2, [r1, #0xe]
	ldr r2, [r1]
	asr r2, r2, #8
	strb r2, [r1, #0xf]
	strb r0, [r1, #0x10]
	ldr r0, [r1, #4]
	asr r0, r0, #8
	strb r0, [r1, #0x11]
	pop {r3, pc}
_0223AB88:
	mov r2, #1
	strb r2, [r1, #8]
	bl DestroySysTask
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0223AB34

	thumb_func_start ov80_0223AB94
ov80_0223AB94: ; 0x0223AB94
	push {r3, r4, r5, lr}
	add r4, r2, #0
	add r3, r0, #0
	ldr r0, [r4, #4]
	add r5, r1, #0
	cmp r0, #0
	beq _0223ABA8
	cmp r0, #1
	beq _0223ABE4
	b _0223AC1C
_0223ABA8:
	mov r1, #0x28
	ldrsh r2, [r3, r1]
	add r1, #0xd8
	add r0, r5, #0
	add r1, r2, r1
	mov r2, #0x2a
	ldrsh r2, [r3, r2]
	add r0, #0x90
	lsl r1, r1, #0x10
	add r2, #0x50
	lsl r2, r2, #0x10
	mov r3, #2
	ldr r0, [r0]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	lsl r3, r3, #0x14
	bl sub_0200DDF4
	add r5, #0x90
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #1
	lsl r0, r0, #0x10
	str r0, [r4]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _0223AC20
_0223ABE4:
	mov r0, #0xf
	ldr r1, [r4]
	lsl r0, r0, #8
	sub r1, r1, r0
	mov r0, #0xd
	lsl r0, r0, #0xc
	str r1, [r4]
	cmp r1, r0
	bgt _0223ABFE
	str r0, [r4]
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
_0223ABFE:
	mov r2, #0x2a
	ldrsh r2, [r3, r2]
	ldr r1, [r4]
	add r5, #0x90
	add r2, #0x50
	lsl r1, r1, #8
	lsl r2, r2, #0x10
	mov r3, #2
	ldr r0, [r5]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	lsl r3, r3, #0x14
	bl sub_0200DDF4
	b _0223AC20
_0223AC1C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_0223AC20:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223AB94

	thumb_func_start ov80_0223AC24
ov80_0223AC24: ; 0x0223AC24
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r1, #0
	mov r0, #0xb
	mov r1, #0x4c
	str r2, [sp]
	add r5, r3, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x4c
	add r4, r0, #0
	bl memset
	ldr r0, _0223AC64 ; =ov80_0223AC68
	add r1, r4, #0
	mov r2, #5
	bl CreateSysTask
	str r5, [r4, #0x48]
	cmp r5, #0
	beq _0223AC54
	mov r0, #0
	str r0, [r5]
_0223AC54:
	str r6, [r4, #0xc]
	ldr r0, [sp]
	str r7, [r4, #0x10]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x18]
	str r0, [r4, #4]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223AC64: .word ov80_0223AC68
	thumb_func_end ov80_0223AC24

	thumb_func_start ov80_0223AC68
ov80_0223AC68: ; 0x0223AC68
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	ldr r1, [r4]
	cmp r1, #5
	bhi _0223AD4E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0223AC80: ; jump table
	.short _0223AC8C - _0223AC80 - 2 ; case 0
	.short _0223ACC4 - _0223AC80 - 2 ; case 1
	.short _0223ACDE - _0223AC80 - 2 ; case 2
	.short _0223ACF2 - _0223AC80 - 2 ; case 3
	.short _0223AD0C - _0223AC80 - 2 ; case 4
	.short _0223AD30 - _0223AC80 - 2 ; case 5
_0223AC8C:
	ldr r0, [r4, #0xc]
	cmp r0, #1
	bne _0223ACA6
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	ldr r2, [r4, #0x14]
	add r0, #0x30
	mov r1, #0
	mov r3, #2
	bl ov80_0223AD7C
	b _0223ACBC
_0223ACA6:
	cmp r0, #2
	bne _0223ACBC
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	ldr r2, [r4, #0x14]
	add r0, #0x30
	mov r1, #0
	mov r3, #1
	bl ov80_0223AD7C
_0223ACBC:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223AD4E
_0223ACC4:
	mov r0, #3
	str r0, [sp]
	add r0, r4, #0
	ldr r2, [r4, #0x10]
	ldr r3, [r4, #0xc]
	add r0, #0x18
	mov r1, #0
	bl ov80_0223AD7C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223AD4E
_0223ACDE:
	add r0, r4, #0
	add r0, #0x18
	bl ov80_0223AD88
	cmp r0, #0
	beq _0223AD4E
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223AD4E
_0223ACF2:
	mov r0, #3
	str r0, [sp]
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	ldr r3, [r4, #0xc]
	add r0, #0x18
	mov r2, #0
	bl ov80_0223AD7C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0223AD4E
_0223AD0C:
	add r0, r4, #0
	add r0, #0x18
	bl ov80_0223AD88
	cmp r0, #0
	beq _0223AD4E
	ldr r0, [r4, #8]
	add r1, r0, #1
	str r1, [r4, #8]
	ldr r0, [r4, #4]
	cmp r1, r0
	bne _0223AD2A
	mov r0, #5
	str r0, [r4]
	b _0223AD4E
_0223AD2A:
	mov r0, #1
	str r0, [r4]
	b _0223AD4E
_0223AD30:
	mov r1, #0
	str r1, [r4]
	str r1, [r4, #8]
	ldr r2, [r4, #0x48]
	cmp r2, #0
	beq _0223AD40
	mov r1, #1
	str r1, [r2]
_0223AD40:
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, pc}
_0223AD4E:
	add r4, #0x30
	add r0, r4, #0
	bl ov80_0223AD88
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223AC68

	thumb_func_start ov80_0223AD5C
ov80_0223AD5C: ; 0x0223AD5C
	push {r3, lr}
	cmp r0, #1
	bne _0223AD6A
	ldr r0, _0223AD74 ; =0x0400006C
	bl GXx_SetMasterBrightness_
	pop {r3, pc}
_0223AD6A:
	ldr r0, _0223AD78 ; =0x0400106C
	bl GXx_SetMasterBrightness_
	pop {r3, pc}
	nop
_0223AD74: .word 0x0400006C
_0223AD78: .word 0x0400106C
	thumb_func_end ov80_0223AD5C

	thumb_func_start ov80_0223AD7C
ov80_0223AD7C: ; 0x0223AD7C
	push {r3, lr}
	str r3, [r0, #0x14]
	ldr r3, [sp, #8]
	bl ov80_0223ADB8
	pop {r3, pc}
	thumb_func_end ov80_0223AD7C

	thumb_func_start ov80_0223AD88
ov80_0223AD88: ; 0x0223AD88
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov80_0223ADC8
	add r4, r0, #0
	ldr r0, _0223ADA0 ; =ov80_0223ADA4
	add r1, r5, #0
	mov r2, #0xa
	bl sub_0200E374
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223ADA0: .word ov80_0223ADA4
	thumb_func_end ov80_0223AD88

	thumb_func_start ov80_0223ADA4
ov80_0223ADA4: ; 0x0223ADA4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r1, #0x14]
	ldr r1, [r1]
	bl ov80_0223AD5C
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	thumb_func_end ov80_0223ADA4

	thumb_func_start ov80_0223ADB8
ov80_0223ADB8: ; 0x0223ADB8
	str r1, [r0]
	str r1, [r0, #4]
	sub r1, r2, r1
	str r1, [r0, #8]
	str r3, [r0, #0x10]
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	thumb_func_end ov80_0223ADB8

	thumb_func_start ov80_0223ADC8
ov80_0223ADC8: ; 0x0223ADC8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	ldr r0, [r4, #0xc]
	mul r0, r1
	ldr r1, [r4, #0x10]
	bl _s32_div_f
	ldr r1, [r4, #4]
	add r0, r0, r1
	str r0, [r4]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r0, r0, #1
	cmp r0, r1
	bgt _0223ADEE
	str r0, [r4, #0xc]
	mov r0, #0
	pop {r4, pc}
_0223ADEE:
	str r1, [r4, #0xc]
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov80_0223ADC8

	thumb_func_start ov80_0223ADF4
ov80_0223ADF4: ; 0x0223ADF4
	push {r4, lr}
	mov r1, #0x30
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x30
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223ADF4

	thumb_func_start ov80_0223AE0C
ov80_0223AE0C: ; 0x0223AE0C
	ldr r3, _0223AE10 ; =FreeToHeap
	bx r3
	.balign 4, 0
_0223AE10: .word FreeToHeap
	thumb_func_end ov80_0223AE0C

	thumb_func_start ov80_0223AE14
ov80_0223AE14: ; 0x0223AE14
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x2e
	ldrb r0, [r0]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	beq _0223AE2A
	bl GF_AssertFail
_0223AE2A:
	ldr r3, [sp, #0x1c]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ov80_0223ADB8
	add r0, r5, #0
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, #0x14
	add r1, r7, #0
	bl ov80_0223ADB8
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [r5, #0x28]
	add r0, r5, #0
	add r0, #0x2c
	strb r1, [r0]
	add r0, r5, #0
	ldr r1, [sp, #0x28]
	add r0, #0x2d
	strb r1, [r0]
	add r0, sp, #0x2c
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x2f
	strb r1, [r0]
	mov r0, #1
	add r5, #0x2e
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0223AE14

	thumb_func_start ov80_0223AE6C
ov80_0223AE6C: ; 0x0223AE6C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #0
	bne _0223AE82
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_0223AE82:
	bl ov80_0223ADC8
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x14
	bl ov80_0223ADC8
	add r0, r5, #0
	add r0, #0x2c
	ldrb r0, [r0]
	ldr r2, [r5]
	ldr r6, [r5, #0x14]
	lsr r1, r0, #1
	sub r1, r2, r1
	lsl r1, r1, #0x10
	asr r3, r1, #0x10
	add r1, r5, #0
	add r1, #0x2d
	ldrb r2, [r1]
	add r0, r3, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	lsr r1, r2, #1
	str r0, [sp]
	add r0, r5, #0
	sub r1, r6, r1
	add r0, #0x2f
	lsl r1, r1, #0x10
	ldrb r0, [r0]
	asr r1, r1, #0x10
	add r2, r1, r2
	str r0, [sp, #4]
	lsl r2, r2, #0x10
	ldr r0, [r5, #0x28]
	asr r2, r2, #0x10
	bl ov80_0223AED4
	add r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0223AE6C

	thumb_func_start ov80_0223AED4
ov80_0223AED4: ; 0x0223AED4
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r5, [sp, #0x18]
	add r4, r1, #0
	cmp r5, #0
	ble _0223AF2C
	cmp r2, #0
	ble _0223AF2C
	cmp r3, r5
	beq _0223AF2C
	cmp r4, r2
	beq _0223AF2C
	cmp r3, #0
	bge _0223AEF2
	mov r3, #0
_0223AEF2:
	mov r1, #1
	lsl r1, r1, #8
	cmp r5, r1
	ble _0223AEFC
	add r5, r1, #0
_0223AEFC:
	cmp r4, #0
	bge _0223AF02
	mov r4, #0
_0223AF02:
	mov r1, #1
	lsl r1, r1, #8
	cmp r2, r1
	ble _0223AF0C
	add r2, r1, #0
_0223AF0C:
	sub r1, r5, r3
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	str r1, [sp]
	sub r1, r2, r4
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	str r1, [sp, #4]
	lsl r2, r3, #0x10
	add r1, sp, #8
	lsl r3, r4, #0x10
	ldrb r1, [r1, #0x14]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl FillWindowPixelRect
_0223AF2C:
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov80_0223AED4

	thumb_func_start ov80_0223AF30
ov80_0223AF30: ; 0x0223AF30
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x19
	lsl r1, r1, #4
	add r6, r0, #0
	bl AllocFromHeap
	mov r2, #0x19
	mov r1, #0
	lsl r2, r2, #4
	add r7, r0, #0
	bl memset
	mov r4, #0
	add r5, r7, #0
_0223AF4C:
	add r0, r6, #0
	bl ov80_0223ADF4
	str r0, [r5, #4]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x60
	blt _0223AF4C
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov80_0223AF30

	thumb_func_start ov80_0223AF60
ov80_0223AF60: ; 0x0223AF60
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_0223AF68:
	ldr r0, [r5, #4]
	bl ov80_0223AE0C
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x60
	blt _0223AF68
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov80_0223AF60

	thumb_func_start ov80_0223AF80
ov80_0223AF80: ; 0x0223AF80
	push {r3, r4}
	str r3, [r0]
	ldr r3, _0223AFC0 ; =0xFFFFFFF8
	add r3, sp
	ldrb r4, [r3, #0x10]
	mov r3, #0x63
	lsl r3, r3, #2
	strb r4, [r0, r3]
	sub r4, r3, #3
	strb r1, [r0, r4]
	sub r1, r3, #2
	strb r2, [r0, r1]
	add r2, r3, #0
	mov r1, #0
	sub r2, #8
	strb r1, [r0, r2]
	sub r2, r3, #7
	strb r1, [r0, r2]
	sub r2, r3, #6
	strb r1, [r0, r2]
	sub r2, r3, #5
	strb r1, [r0, r2]
	sub r2, r3, #4
	strb r1, [r0, r2]
	sub r2, r3, #1
	strb r1, [r0, r2]
	mov r2, #1
	add r1, r3, #1
	strb r2, [r0, r1]
	pop {r3, r4}
	bx lr
	nop
_0223AFC0: .word 0xFFFFFFF8
	thumb_func_end ov80_0223AF80

	thumb_func_start ov80_0223AFC4
ov80_0223AFC4: ; 0x0223AFC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _0223B1C8 ; =0x0000018D
	ldrb r1, [r5, r0]
	cmp r1, #0
	bne _0223AFD8
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0223AFD8:
	add r1, r0, #0
	sub r1, #9
	ldrb r1, [r5, r1]
	cmp r1, #0x60
	bhs _0223AFF2
	sub r1, r0, #2
	ldrsb r1, [r5, r1]
	sub r2, r1, #1
	sub r1, r0, #2
	strb r2, [r5, r1]
	ldrsb r1, [r5, r1]
	cmp r1, #0
	ble _0223AFF4
_0223AFF2:
	b _0223B16E
_0223AFF4:
	sub r1, r0, #3
	ldrb r2, [r5, r1]
	sub r1, r0, #2
	ldr r3, _0223B1CC ; =ov80_0223DBEC
	strb r2, [r5, r1]
	sub r1, r0, #6
	ldrb r1, [r5, r1]
	lsl r4, r1, #4
	add r1, r0, #0
	sub r1, #8
	ldrb r2, [r5, r1]
	add r1, r3, r4
	sub r3, r0, #7
	ldrb r3, [r5, r3]
	sub r4, r0, #4
	ldrb r1, [r2, r1]
	lsl r3, r3, #4
	add r3, #8
	str r3, [sp]
	ldrb r4, [r5, r4]
	lsl r1, r1, #5
	add r2, r1, #0
	str r4, [sp, #4]
	ldr r4, [r5]
	add r2, #0x20
	str r4, [sp, #8]
	mov r4, #0x20
	str r4, [sp, #0xc]
	mov r4, #0x10
	str r4, [sp, #0x10]
	sub r4, r0, #1
	ldrb r4, [r5, r4]
	sub r0, #9
	str r4, [sp, #0x14]
	ldrb r0, [r5, r0]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r0, _0223B1D0 ; =0x00000187
	mov r1, #1
	ldrb r2, [r5, r0]
	ldr r3, _0223B1CC ; =ov80_0223DBEC
	eor r1, r2
	lsl r4, r1, #4
	sub r1, r0, #2
	ldrb r2, [r5, r1]
	add r1, r3, r4
	sub r3, r0, #1
	ldrb r4, [r5, r3]
	mov r3, #5
	ldrb r1, [r2, r1]
	sub r3, r3, r4
	lsl r3, r3, #4
	add r3, #8
	str r3, [sp]
	add r4, r0, #2
	ldrb r4, [r5, r4]
	lsl r1, r1, #5
	add r2, r1, #0
	str r4, [sp, #4]
	ldr r4, [r5]
	add r2, #0x20
	str r4, [sp, #8]
	mov r4, #0x20
	str r4, [sp, #0xc]
	mov r4, #0x10
	str r4, [sp, #0x10]
	add r4, r0, #5
	ldrb r4, [r5, r4]
	sub r0, r0, #3
	str r4, [sp, #0x14]
	ldrb r0, [r5, r0]
	add r0, r0, #1
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r0, _0223B1D0 ; =0x00000187
	ldr r3, _0223B1CC ; =ov80_0223DBEC
	ldrb r1, [r5, r0]
	lsl r4, r1, #4
	sub r1, r0, #2
	ldrb r2, [r5, r1]
	add r1, r3, r4
	ldrb r1, [r2, r1]
	sub r2, r0, #1
	ldrb r2, [r5, r2]
	lsl r1, r1, #5
	add r2, r2, #6
	lsl r3, r2, #4
	add r3, #8
	str r3, [sp]
	add r2, r0, #2
	ldrb r2, [r5, r2]
	str r2, [sp, #4]
	ldr r2, [r5]
	str r2, [sp, #8]
	mov r2, #0x20
	str r2, [sp, #0xc]
	mov r2, #0x10
	str r2, [sp, #0x10]
	add r2, r0, #5
	ldrb r2, [r5, r2]
	sub r0, r0, #3
	str r2, [sp, #0x14]
	ldrb r0, [r5, r0]
	add r2, r1, #0
	add r2, #0x20
	add r0, r0, #2
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r0, _0223B1D0 ; =0x00000187
	mov r1, #1
	ldrb r2, [r5, r0]
	ldr r3, _0223B1CC ; =ov80_0223DBEC
	eor r1, r2
	lsl r4, r1, #4
	sub r1, r0, #2
	ldrb r2, [r5, r1]
	add r1, r3, r4
	ldrb r1, [r2, r1]
	sub r2, r0, #1
	ldrb r3, [r5, r2]
	mov r2, #0xb
	lsl r1, r1, #5
	sub r2, r2, r3
	lsl r3, r2, #4
	add r3, #8
	str r3, [sp]
	add r2, r0, #2
	ldrb r2, [r5, r2]
	str r2, [sp, #4]
	ldr r2, [r5]
	str r2, [sp, #8]
	mov r2, #0x20
	str r2, [sp, #0xc]
	mov r2, #0x10
	str r2, [sp, #0x10]
	add r2, r0, #5
	ldrb r2, [r5, r2]
	sub r0, r0, #3
	str r2, [sp, #0x14]
	ldrb r0, [r5, r0]
	add r2, r1, #0
	add r2, #0x20
	add r0, r0, #3
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	mov r1, #0x61
	lsl r1, r1, #2
	ldrb r0, [r5, r1]
	add r0, r0, #4
	strb r0, [r5, r1]
	add r0, r1, #1
	ldrb r0, [r5, r0]
	add r2, r0, #1
	add r0, r1, #1
	strb r2, [r5, r0]
	ldrb r0, [r5, r0]
	lsr r3, r0, #0x1f
	lsl r2, r0, #0x1d
	sub r2, r2, r3
	mov r0, #0x1d
	ror r2, r0
	add r0, r3, r2
	bne _0223B16E
	add r0, r1, #3
	ldrb r2, [r5, r0]
	mov r0, #1
	eor r2, r0
	add r0, r1, #3
	strb r2, [r5, r0]
	add r0, r1, #2
	ldrb r0, [r5, r0]
	add r2, r0, #1
	add r0, r1, #2
	strb r2, [r5, r0]
	mov r2, #0
	add r0, r1, #1
	strb r2, [r5, r0]
_0223B16E:
	mov r0, #0x62
	lsl r0, r0, #2
	ldrb r4, [r5, r0]
	sub r0, r0, #4
	ldrb r0, [r5, r0]
	cmp r4, r0
	bge _0223B1A4
	lsl r0, r4, #2
	mov r7, #0x62
	add r6, r5, r0
	lsl r7, r7, #2
_0223B184:
	ldr r0, [r6, #4]
	bl ov80_0223AE6C
	str r0, [sp, #0x18]
	cmp r0, #1
	bne _0223B196
	ldrb r0, [r5, r7]
	add r0, r0, #1
	strb r0, [r5, r7]
_0223B196:
	mov r0, #0x61
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, r0
	blt _0223B184
_0223B1A4:
	mov r1, #0x62
	lsl r1, r1, #2
	ldrb r0, [r5, r1]
	cmp r0, #0x60
	blo _0223B1C0
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0223B1C0
	mov r2, #0
	add r0, r1, #5
	strb r2, [r5, r0]
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0223B1C0:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	nop
_0223B1C8: .word 0x0000018D
_0223B1CC: .word ov80_0223DBEC
_0223B1D0: .word 0x00000187
	thumb_func_end ov80_0223AFC4

	thumb_func_start ov80_0223B1D4
ov80_0223B1D4: ; 0x0223B1D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _0223B3DC ; =0x0000018D
	ldrb r1, [r5, r0]
	cmp r1, #0
	bne _0223B1E8
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0223B1E8:
	add r1, r0, #0
	sub r1, #9
	ldrb r1, [r5, r1]
	cmp r1, #0x60
	bhs _0223B202
	sub r1, r0, #2
	ldrsb r1, [r5, r1]
	sub r2, r1, #1
	sub r1, r0, #2
	strb r2, [r5, r1]
	ldrsb r1, [r5, r1]
	cmp r1, #0
	ble _0223B204
_0223B202:
	b _0223B384
_0223B204:
	sub r1, r0, #3
	ldrb r2, [r5, r1]
	sub r1, r0, #2
	ldr r4, _0223B3E0 ; =ov80_0223DBE0
	strb r2, [r5, r1]
	sub r2, r0, #6
	ldrb r3, [r5, r2]
	mov r2, #6
	add r1, r0, #0
	mul r2, r3
	sub r3, r0, #7
	ldrb r3, [r5, r3]
	add r2, r4, r2
	sub r1, #8
	ldrb r2, [r3, r2]
	ldrb r1, [r5, r1]
	lsl r3, r2, #5
	add r2, r3, #0
	add r2, #0x20
	str r2, [sp]
	sub r2, r0, #4
	ldrb r2, [r5, r2]
	lsl r1, r1, #4
	add r1, #8
	str r2, [sp, #4]
	ldr r2, [r5]
	str r2, [sp, #8]
	mov r2, #0x10
	str r2, [sp, #0xc]
	mov r2, #0x20
	str r2, [sp, #0x10]
	sub r2, r0, #1
	ldrb r2, [r5, r2]
	sub r0, #9
	str r2, [sp, #0x14]
	ldrb r0, [r5, r0]
	add r2, r1, #0
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r2, _0223B3E4 ; =0x00000185
	mov r0, #7
	ldrb r1, [r5, r2]
	sub r0, r0, r1
	lsl r1, r0, #4
	add r0, r2, #2
	ldrb r3, [r5, r0]
	mov r0, #1
	add r1, #8
	eor r3, r0
	mov r0, #6
	mul r0, r3
	add r3, r2, #1
	ldrb r3, [r5, r3]
	add r0, r4, r0
	ldrb r0, [r3, r0]
	lsl r3, r0, #5
	add r0, r3, #0
	add r0, #0x20
	str r0, [sp]
	add r0, r2, #4
	ldrb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x20
	str r0, [sp, #0x10]
	add r0, r2, #7
	ldrb r0, [r5, r0]
	str r0, [sp, #0x14]
	sub r0, r2, #1
	ldrb r0, [r5, r0]
	add r2, r1, #0
	add r0, r0, #1
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r2, _0223B3E4 ; =0x00000185
	ldrb r0, [r5, r2]
	add r0, #8
	lsl r1, r0, #4
	add r0, r2, #2
	ldrb r3, [r5, r0]
	mov r0, #6
	add r1, #8
	mul r0, r3
	add r3, r2, #1
	ldrb r3, [r5, r3]
	add r0, r4, r0
	ldrb r0, [r3, r0]
	lsl r3, r0, #5
	add r0, r3, #0
	add r0, #0x20
	str r0, [sp]
	add r0, r2, #4
	ldrb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x20
	str r0, [sp, #0x10]
	add r0, r2, #7
	ldrb r0, [r5, r0]
	str r0, [sp, #0x14]
	sub r0, r2, #1
	ldrb r0, [r5, r0]
	add r2, r1, #0
	add r0, r0, #2
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	ldr r2, _0223B3E4 ; =0x00000185
	mov r0, #0xf
	ldrb r1, [r5, r2]
	sub r0, r0, r1
	lsl r1, r0, #4
	add r0, r2, #2
	ldrb r3, [r5, r0]
	mov r0, #1
	add r1, #8
	eor r3, r0
	mov r0, #6
	mul r0, r3
	add r3, r2, #1
	ldrb r3, [r5, r3]
	add r0, r4, r0
	ldrb r0, [r3, r0]
	lsl r3, r0, #5
	add r0, r3, #0
	add r0, #0x20
	str r0, [sp]
	add r0, r2, #4
	ldrb r0, [r5, r0]
	str r0, [sp, #4]
	ldr r0, [r5]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	mov r0, #0x20
	str r0, [sp, #0x10]
	add r0, r2, #7
	ldrb r0, [r5, r0]
	str r0, [sp, #0x14]
	sub r0, r2, #1
	ldrb r0, [r5, r0]
	add r2, r1, #0
	add r0, r0, #3
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov80_0223AE14
	mov r0, #0x61
	lsl r0, r0, #2
	ldrb r1, [r5, r0]
	add r1, r1, #4
	strb r1, [r5, r0]
	add r1, r0, #2
	ldrb r1, [r5, r1]
	add r2, r1, #1
	add r1, r0, #2
	strb r2, [r5, r1]
	add r0, r0, #2
	ldrb r0, [r5, r0]
	mov r1, #6
	bl _s32_div_f
	cmp r1, #0
	bne _0223B384
	ldr r1, _0223B3E8 ; =0x00000187
	mov r0, #1
	ldrb r2, [r5, r1]
	eor r0, r2
	strb r0, [r5, r1]
	sub r0, r1, #2
	ldrb r0, [r5, r0]
	add r2, r0, #1
	sub r0, r1, #2
	strb r2, [r5, r0]
	mov r2, #0
	sub r0, r1, #1
	strb r2, [r5, r0]
_0223B384:
	mov r0, #0x62
	lsl r0, r0, #2
	ldrb r4, [r5, r0]
	sub r0, r0, #4
	ldrb r0, [r5, r0]
	cmp r4, r0
	bge _0223B3BA
	lsl r0, r4, #2
	mov r7, #0x62
	add r6, r5, r0
	lsl r7, r7, #2
_0223B39A:
	ldr r0, [r6, #4]
	bl ov80_0223AE6C
	str r0, [sp, #0x18]
	cmp r0, #1
	bne _0223B3AC
	ldrb r0, [r5, r7]
	add r0, r0, #1
	strb r0, [r5, r7]
_0223B3AC:
	mov r0, #0x61
	lsl r0, r0, #2
	ldrb r0, [r5, r0]
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, r0
	blt _0223B39A
_0223B3BA:
	mov r1, #0x62
	lsl r1, r1, #2
	ldrb r0, [r5, r1]
	cmp r0, #0x60
	blo _0223B3D6
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _0223B3D6
	mov r2, #0
	add r0, r1, #5
	strb r2, [r5, r0]
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0223B3D6:
	mov r0, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0223B3DC: .word 0x0000018D
_0223B3E0: .word ov80_0223DBE0
_0223B3E4: .word 0x00000185
_0223B3E8: .word 0x00000187
	thumb_func_end ov80_0223B1D4

	thumb_func_start ov80_0223B3EC
ov80_0223B3EC: ; 0x0223B3EC
	ldr r3, _0223B3F8 ; =sub_0200E33C
	mov r2, #1
	add r1, r0, #0
	ldr r0, _0223B3FC ; =ov80_0223B400
	lsl r2, r2, #0xa
	bx r3
	.balign 4, 0
_0223B3F8: .word sub_0200E33C
_0223B3FC: .word ov80_0223B400
	thumb_func_end ov80_0223B3EC

	thumb_func_start ov80_0223B400
ov80_0223B400: ; 0x0223B400
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #8]
	cmp r0, #2
	blo _0223B414
	ldr r0, [r4]
	bl sub_02014C08
	mov r0, #0
	str r0, [r4, #8]
_0223B414:
	ldr r0, [r4]
	bl sub_02014C40
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B400

	thumb_func_start ov80_0223B424
ov80_0223B424: ; 0x0223B424
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl sub_02014AD8
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #8]
	add r0, r4, #0
	bl ov80_0223B3EC
	str r0, [r4, #4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B424

	thumb_func_start ov80_0223B440
ov80_0223B440: ; 0x0223B440
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r4, [sp, #0x20]
	add r5, sp, #0x10
	str r4, [sp]
	mov r4, #0x14
	ldrsh r4, [r5, r4]
	str r4, [sp, #4]
	ldr r4, [sp, #0x28]
	str r4, [sp, #8]
	ldr r4, [sp, #0x2c]
	str r4, [sp, #0xc]
	ldr r4, [sp, #0x30]
	str r4, [sp, #0x10]
	ldr r0, [r0]
	bl sub_02014B08
	add sp, #0x14
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B440

	thumb_func_start ov80_0223B468
ov80_0223B468: ; 0x0223B468
	push {r3, lr}
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _0223B47C
	mov r0, #1
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x18]
	ldr r1, [r1, #0x10]
	blx r1
	pop {r3, pc}
_0223B47C:
	bl sub_02014AA0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B468

	thumb_func_start ov80_0223B484
ov80_0223B484: ; 0x0223B484
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0223B49E
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0223B49E
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x14]
	blx r1
	mov r0, #0
	str r0, [r4, #0xc]
_0223B49E:
	pop {r4, pc}
	thumb_func_end ov80_0223B484

	thumb_func_start ov80_0223B4A0
ov80_0223B4A0: ; 0x0223B4A0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r5, #0
	bne _0223B4B2
	bl GF_AssertFail
_0223B4B2:
	mov r0, #1
	str r0, [r5, #8]
	mov r2, #0
	str r2, [r5, #0xc]
	str r4, [r5, #0x18]
	str r6, [r5, #0x10]
	ldr r0, gApp_MainMenu_SelectOption_MigrateFromAgb ; =ov80_0223B468
	str r7, [r5, #0x14]
	add r1, r5, #0
	bl sub_0200E374
	str r0, [r5, #4]
	ldr r0, _0223B4DC ; =ov80_0223B484
	add r1, r5, #0
	mov r2, #0
	bl sub_0200E33C
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
gApp_MainMenu_SelectOption_MigrateFromAgb: .word ov80_0223B468
_0223B4DC: .word ov80_0223B484
	thumb_func_end ov80_0223B4A0

	thumb_func_start ov80_0223B4E0
ov80_0223B4E0: ; 0x0223B4E0
	push {r4, lr}
	add r4, r0, #0
	bne _0223B4EA
	bl GF_AssertFail
_0223B4EA:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0223B4F4
	bl DestroySysTask
_0223B4F4:
	ldr r0, [r4]
	cmp r0, #0
	beq _0223B4FE
	bl DestroySysTask
_0223B4FE:
	bl sub_02014AA0
	pop {r4, pc}
	thumb_func_end ov80_0223B4E0

	thumb_func_start ov80_0223B504
ov80_0223B504: ; 0x0223B504
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_02014A60
	add r5, r0, #0
	bl sub_02014AA0
	ldr r1, _0223B524 ; =0x00003020
	add r0, r5, #0
	ldr r1, [r4, r1]
	mov r2, #0x20
	mov r3, #1
	bl sub_02014AB0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0223B524: .word 0x00003020
	thumb_func_end ov80_0223B504

	thumb_func_start ov80_0223B528
ov80_0223B528: ; 0x0223B528
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_02014A8C
	add r0, r4, #0
	bl ov80_0223B504
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B528

	thumb_func_start ov80_0223B53C
ov80_0223B53C: ; 0x0223B53C
	ldr r3, _0223B540 ; =ov80_0223B504
	bx r3
	.balign 4, 0
_0223B540: .word ov80_0223B504
	thumb_func_end ov80_0223B53C

	thumb_func_start ov80_0223B544
ov80_0223B544: ; 0x0223B544
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r5, r2, #0
	add r4, r0, #0
	ldr r1, _0223B5D4 ; =0x00003024
	add r0, r5, #0
	bl AllocFromHeap
	ldr r2, _0223B5D4 ; =0x00003024
	str r0, [sp]
	mov r1, #0
	bl memset
	ldr r0, [sp]
	cmp r0, #0
	bne _0223B568
	bl GF_AssertFail
_0223B568:
	ldr r1, [sp]
	ldr r3, _0223B5D8 ; =0x00001820
	ldr r2, [sp]
	add r0, r5, #0
	add r1, #0x20
	add r2, r2, r3
	bl sub_02014A08
	ldr r1, [sp]
	cmp r0, #0
	str r0, [r1, #0x1c]
	bne _0223B584
	bl GF_AssertFail
_0223B584:
	ldr r0, [sp]
	ldr r1, _0223B5DC ; =0x00003020
	mov r5, #0
	str r4, [r0, r1]
	add r6, r0, #0
_0223B58E:
	add r3, r6, #0
	add r4, r7, #0
	add r3, #0x20
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, _0223B5D8 ; =0x00001820
	add r3, r7, #0
	add r4, r6, r0
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r3!, {r0, r1}
	add r5, r5, #1
	add r6, r2, #0
	stmia r4!, {r0, r1}
	cmp r5, #0xc0
	blt _0223B58E
	ldr r0, [sp]
	ldr r2, _0223B5E0 ; =ov80_0223B528
	ldr r3, _0223B5E4 ; =ov80_0223B53C
	add r1, r0, #0
	bl ov80_0223B4A0
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223B5D4: .word 0x00003024
_0223B5D8: .word 0x00001820
_0223B5DC: .word 0x00003020
_0223B5E0: .word ov80_0223B528
_0223B5E4: .word ov80_0223B53C
	thumb_func_end ov80_0223B544

	thumb_func_start ov80_0223B5E8
ov80_0223B5E8: ; 0x0223B5E8
	push {r4, lr}
	add r4, r0, #0
	bne _0223B5F2
	bl GF_AssertFail
_0223B5F2:
	add r0, r4, #0
	bl ov80_0223B4E0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _0223B602
	bl sub_02014A38
_0223B602:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B5E8

	thumb_func_start ov80_0223B60C
ov80_0223B60C: ; 0x0223B60C
	push {r4, lr}
	add r4, r0, #0
	bne _0223B616
	bl GF_AssertFail
_0223B616:
	ldr r0, [r4, #0x1c]
	bl sub_02014A4C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0223B60C

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

ov80_0223B724: ; 0x0223B724
	.byte 0x00, 0x00, 0x00, 0x00

ov80_0223B728: ; 0x0223B728
	.word ov80_0222ADCC

ov80_0223B72C: ; 0x0223B72C
	.word ov80_0222ADDC

ov80_0223B730: ; 0x0223B730
	.byte 0x04, 0x00

ov80_0223B732: ; 0x0223B732
	.byte 0x23, 0x00

ov80_0223B734: ; 0x0223B734
	.byte 0x2E, 0x04

ov80_0223B736: ; 0x0223B736
	.byte 0x03, 0x00

ov80_0223B738: ; 0x0223B738
	.byte 0xB7, 0x00

ov80_0223B73A: ; 0x0223B73A
	.byte 0x01, 0x00

ov80_0223B73C: ; 0x0223B73C
	.byte 0x00, 0x00

ov80_0223B73E: ; 0x0223B73E
	.byte 0x94, 0x00

ov80_0223B740: ; 0x0223B740
	.byte 0x03, 0x00

ov80_0223B742: ; 0x0223B742
	.byte 0x00, 0x00

ov80_0223B744: ; 0x0223B744
	.byte 0x94, 0x00

ov80_0223B746: ; 0x0223B746
	.byte 0x00

ov80_0223B747: ; 0x0223B747
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x23, 0x00, 0x2E, 0x04, 0x03, 0x00
	.byte 0xB7, 0x00, 0x02, 0x00, 0x00, 0x00, 0x94, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x24, 0x00, 0x2E, 0x04, 0x03, 0x00, 0xB7, 0x00, 0x01, 0x00, 0x00, 0x00, 0x94, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.word ov80_0222AE6C
	.word ov80_0222AE80
	.byte 0x01, 0x00, 0xC3, 0x00, 0x77, 0x04, 0x04, 0x00
	.byte 0xB7, 0x00, 0x02, 0x00, 0x00, 0x00, 0x94, 0x00, 0x03, 0x00, 0x00, 0x00, 0x94, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.word ov80_0222AE84
	.word ov80_0222AE9C
	.byte 0x01, 0x00, 0xC3, 0x00, 0x77, 0x04, 0x01, 0x00, 0xB7, 0x00, 0x01, 0x00, 0x00, 0x00, 0x94, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x60, 0x00, 0x2E, 0x04, 0x04, 0x00
	.byte 0xB7, 0x00, 0x36, 0x00, 0x31, 0x00, 0xA0, 0x00, 0x37, 0x00, 0x31, 0x00, 0xA0, 0x00, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x60, 0x00, 0x2E, 0x04, 0x04, 0x00, 0xB7, 0x00, 0x33, 0x00, 0x31, 0x00, 0xA0, 0x00
	.byte 0x34, 0x00, 0x31, 0x00, 0xA0, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x61, 0x00, 0x2E, 0x04, 0x01, 0x00
	.byte 0xB7, 0x00, 0x35, 0x00, 0x31, 0x00, 0xA0, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x62, 0x00, 0x2E, 0x04, 0x01, 0x00, 0xB7, 0x00, 0x32, 0x00, 0x31, 0x00, 0xA0, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0xB9, 0x01, 0x78, 0x04, 0x01, 0x00
	.byte 0xB7, 0x00, 0x11, 0x00, 0x10, 0x00, 0x97, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.word ov80_0222ADE8
	.word ov80_0222AE1C
	.byte 0x03, 0x00, 0xB9, 0x01, 0x78, 0x04, 0x04, 0x00, 0xB7, 0x00, 0x14, 0x00, 0x0E, 0x00, 0x96, 0x00
	.byte 0x16, 0x00, 0x13, 0x00, 0x98, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x7A, 0x04, 0x04, 0x00
	.byte 0xB7, 0x00, 0x1A, 0x00, 0x19, 0x00, 0x9A, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.word ov80_0222AEBC
	.word ov80_0222AEF4
	.byte 0x00, 0x00, 0x20, 0x00, 0x7A, 0x04, 0x01, 0x00, 0xB7, 0x00, 0x1E, 0x00, 0x1D, 0x00, 0x9F, 0x00
	.byte 0x21, 0x00, 0x1D, 0x00, 0x9F, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x7A, 0x04, 0x01, 0x00
	.byte 0xB7, 0x00, 0x1C, 0x00, 0x1B, 0x00, 0x9B, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.word ov80_0222AEA0
	.word ov80_0222AEB0
	.byte 0x0A, 0x00, 0x12, 0x00, 0x2E, 0x04, 0x01, 0x00, 0xB7, 0x00, 0x84, 0x00, 0x83, 0x00, 0xBF, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.word ov80_0222AE28
	.word ov80_0222AE2C
	.byte 0x02, 0x00, 0xAA, 0x01, 0x79, 0x04, 0x01, 0x00
	.byte 0xB7, 0x00, 0x3B, 0x00, 0x3C, 0x00, 0xA2, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.word ov80_0222AE30
	.word ov80_0222AE68
	.byte 0x02, 0x00, 0xAA, 0x01, 0x79, 0x04, 0x04, 0x00, 0xB7, 0x00, 0x38, 0x00, 0x3A, 0x00, 0xA1, 0x00
	.byte 0x3D, 0x00, 0x5D, 0x00, 0xBC, 0x00, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00

ov80_0223B9CC: ; 0x0223B9CC
	.byte 0xD0, 0x00, 0x00, 0x00

ov80_0223B9D0: ; 0x0223B9D0
	.byte 0x01, 0x19, 0x0D, 0x06, 0x04, 0x0E, 0x55, 0x03

ov80_0223B9D8: ; 0x0223B9D8
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x01, 0x01, 0x00, 0x00, 0x01, 0x01, 0x01, 0x00, 0x01, 0x00, 0x00

ov80_0223B9EC: ; 0x0223B9EC
	.word ov80_0222D390
	.word ov80_0222D404
	.word ov80_0222D520
	.word ov80_0222D968
	.word ov80_0222DAAC
	.word ov80_0222DC14

ov80_0223BA04: ; 0x0223BA04
	.word ov80_0222BEB0
	.word ov80_0222BEB4
	.word ov80_0222BEC0
	.word ov80_0222BED4
	.word ov80_0222BF00
	.word ov80_0222BF28
	.word ov80_0222BF7C
	.word ov80_0222BF94
	.word ov80_0222BFAC
	.word ov80_0222BFC8
	.word ov80_0222C040
	.word ov80_0222C058
	.word ov80_0222C090
	.word ov80_0222C0A8
	.word ov80_0222C0B4
	.word ov80_0222C0EC
	.word ov80_0222C11C
	.word ov80_0222C14C
	.word ov80_0222C19C
	.word ov80_0222C1A8
	.word ov80_0222C1F0
	.word ov80_0222C214
	.word ov80_0222C270
	.word ov80_0222C2D0
	.word ov80_0222C2F4
	.word ov80_0222C320
	.word ov80_0222C368
	.word ov80_0222C3C4
	.word ov80_0222C424
	.word ov80_0222C450
	.word ov80_0222C46C
	.word ov80_0222C47C
	.word ov80_0222BFF8
	.word ov80_0222C018
	.word ov80_0222C52C
	.word ov80_0222C5EC
	.word ov80_0222C60C
	.word ov80_0222C6E4
	.word ov80_0222C70C
	.word ov80_0222C74C
	.word ov80_0222C750
	.word ov80_0222C7FC
	.word ov80_0222C820
	.word ov80_0222C884
	.word ov80_0222C8B0
	.word ov80_0222C94C
	.word ov80_0222C96C
	.word ov80_0222C9A4
	.word ov80_0222C9D4
	.word ov80_0222CA1C
	.word ov80_0222CA54
	.word ov80_0222CA74
	.word ov80_0222CB54
	.word ov80_0222D1D8
	.word ov80_0222D220
	.word ov80_0222D22C
	.word ov80_0222D260
	.word ov80_0222D284
	.word ov80_0222D29C
	.word ov80_0222D2CC
	.word ov80_0222D328
	.word ov80_0222D334
	.word ov80_0222D360
	.word ov80_0222DC70
	.word ov80_0222DD3C
	.word ov80_0222DD68
	.word ov80_0222DD9C
	.word ov80_0222DDBC
	.word ov80_0222DDF0
	.word ov80_0222DF64
	.word ov80_0222DFD4
	.word ov80_0222DFF4
	.word ov80_0222E078
	.word ov80_0222E09C
	.word ov80_0222E0C8
	.word ov80_0222E0EC
	.word ov80_0222DE1C
	.word ov80_0222DE8C
	.word ov80_0222DEB8
	.word ov80_0222DF2C
	.word ov80_022323A0
	.word ov80_022323B8
	.word ov80_022323D0
	.word ov80_0222CB24
	.word ov80_0222CB44
	.word ov80_02235390
	.word ov80_022353A0
	.word ov80_022353B0
	.word ov80_022353E8
	.word ov80_022353F8
	.word ov80_0223541C
	.word ov80_02235438
	.word ov80_0222F608
	.word ov80_0222F648
	.word ov80_0222F664
	.word ov80_0222F678
	.word ov80_0222F6E0
	.word ov80_0222F708
	.word ov80_0222F74C
	.word ov80_0222F7E0
	.word ov80_0222F7F4
	.word ov80_0222F808
	.word ov80_0222F81C
	.word ov80_0222F830
	.word ov80_0222FC34
	.word ov80_0222FC50
	.word ov80_0222FC80
	.word ov80_0222FCD0
	.word ov80_0222CB9C
	.word ov80_0222CBB4
	.word ov80_0222CD94
	.word ov80_0222CDF4
	.word ov80_0222CE00
	.word ov80_0222E10C
	.word ov80_0222CE28
	.word ov80_0222CE48
	.word ov80_0222CEB8
	.word ov80_0222CECC
	.word ov80_022310A4
	.word ov80_0222CEF0
	.word ov80_0222CF08
	.word ov80_0222CF18
	.word ov80_0222CF38
	.word ov80_0222D008
	.word ov80_0222D034
	.word ov80_0222D064
	.word ov80_0222D084
	.word ov80_0222D0F8
	.word ov80_0222D118
	.word ov80_0222D13C
	.word ov80_0222D168
	.word ov80_0222D1A0
	.word ov80_0223544C
	.word ov80_022355D0
	.word ov80_02235610
	.word ov80_02235624
	.word ov80_02235674
	.word ov80_022356AC
	.word ov80_02235710
	.word ov80_02230B8C
	.word ov80_02230BE0
	.word ov80_02230BFC
	.word ov80_02230C10
	.word ov80_02230CE8
	.word ov80_02230D0C
	.word ov80_02230D70
	.word ov80_02230FD4
	.word ov80_02230FF0
	.word ov80_02231020
	.word ov80_0223106C
	.word ov80_0222DF58
	.word ov80_02231BF8
	.word ov80_02231C5C
	.word ov80_02231C78
	.word ov80_02231C8C
	.word ov80_02231D34
	.word ov80_02231DBC
	.word ov80_02231DF8
	.word ov80_02231EA8
	.word ov80_02231EBC
	.word ov80_02231ED0
	.word ov80_022322AC
	.word ov80_022322C8
	.word ov80_022322F8
	.word ov80_02231CE0
	.word ov80_02232348
	.word ov80_022323E8
	.word ov80_02232430
	.word ov80_02232460
	.word ov80_0223248C
	.word ov80_02235900
	.word ov80_02235920
	.word ov80_02235934
	.word ov80_02235970
	.word ov80_02235A14
	.word ov80_02235A44
	.word ov80_02235A8C
	.word ov80_02235B04
	.word ov80_02235B20
	.word ov80_02235E84
	.word ov80_02235F64
	.word ov80_02235F80
	.word ov80_02235FB4
	.word ov80_0222E120
	.word ov80_02233688
	.word ov80_022336EC
	.word ov80_02233708
	.word ov80_02233770
	.word ov80_02233908
	.word ov80_02233A30
	.word ov80_02233A44
	.word ov80_02233A58
	.word ov80_02233FBC
	.word ov80_02233FD8
	.word ov80_02234008
	.word ov80_0223371C
	.word ov80_02234058
	.word ov80_02234094
	.word ov80_022340A8
	.word ov80_022310C0
	.word ov80_0222E144
	.word ov80_0222E160
	.word ov80_022359B4
	.word ov80_0222E170
	.word ov80_0222E218
	.word ov80_0222E22C
	.word ov80_0222E238
	.word ov80_0222E250

ov80_0223BD44: ; 0x0223BD44
	.byte 0x01, 0x02, 0x04, 0x08, 0x0F, 0x10, 0x20, 0x00

ov80_0223BD4C: ; 0x0223BD4C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xD9, 0x07, 0x00, 0x00, 0xD1, 0x07, 0x00, 0x00, 0xD1, 0x07, 0x00, 0x00, 0xD1, 0x07, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223BD80: ; 0x0223BD80
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00
	.byte 0xD0, 0x07, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov80_0223BDB4: ; 0x0223BDB4
	.word ov81_0223DD60
	.word ov81_0223DEA8
	.word ov81_0223E234
	.word FS_OVERLAY_ID(OVY_81)

ov80_0223BDC4: ; 0x0223BDC4
	.word ov81_0223DD60
	.word ov81_0223DEA8
	.word ov81_0223E234
	.word FS_OVERLAY_ID(OVY_81)

ov80_0223BDD4: ; 0x0223BDD4
	.byte 0x00, 0x05, 0x05, 0x05, 0x05, 0x07, 0x07, 0x08, 0x09, 0x00, 0x00, 0x00

ov80_0223BDE0: ; 0x0223BDE0
	.byte 0x00, 0x0A, 0x0B, 0x0C, 0x0D, 0x10, 0x11, 0x13, 0x15, 0x00, 0x00, 0x00

ov80_0223BDEC: ; 0x0223BDEC
	.word ov82_0223DD60
	.word ov82_0223DE20
	.word ov82_0223DF74
	.word FS_OVERLAY_ID(OVY_82)

ov80_0223BDFC: ; 0x0223BDFC
	.byte 0x00, 0x01, 0x01, 0x01
	.byte 0x02, 0x02, 0x02, 0x03, 0x03, 0x03, 0x04, 0x04, 0x06, 0x06, 0x08, 0x08, 0x0A, 0x0A, 0x0C, 0x00

ov80_0223BE10: ; 0x0223BE10
	.byte 0x00, 0x06, 0x06, 0x06, 0x08, 0x08, 0x08, 0x0A, 0x0A, 0x0A, 0x0C, 0x0C, 0x0E, 0x0F, 0x11, 0x11
	.byte 0x14, 0x14, 0x17, 0x00

ov80_0223BE24: ; 0x0223BE24
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x53, 0x00, 0x00, 0x00

ov80_0223BE34: ; 0x0223BE34
	.word ov83_0223DD60
	.word ov83_0223DE60
	.word ov83_0223DFBC
	.word FS_OVERLAY_ID(OVY_83)

ov80_0223BE44: ; 0x0223BE44
	.word ov83_02242FE8
	.word ov83_02243108
	.word ov83_02243268
	.word FS_OVERLAY_ID(OVY_83)

ov80_0223BE54: ; 0x0223BE54
	.byte 0x00, 0x03, 0x03, 0x04, 0x04, 0x05, 0x05, 0x07, 0x07, 0x00, 0x00, 0x00

ov80_0223BE60: ; 0x0223BE60
	.byte 0x00, 0x08, 0x09, 0x0B, 0x0C, 0x0E, 0x0F, 0x12, 0x12, 0x00, 0x00, 0x00

ov80_0223BE6C: ; 0x0223BE6C
	.byte 0x00, 0xF0, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223BE78: ; 0x0223BE78
	.word ov84_0223DD60
	.word ov84_0223DEB8
	.word ov84_0223DFF0
	.word FS_OVERLAY_ID(OVY_84)

ov80_0223BE88: ; 0x0223BE88
	.byte 0x06, 0x04, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223BE90: ; 0x0223BE90
	.byte 0x08, 0x06, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223BE98: ; 0x0223BE98
	.byte 0x07, 0x05, 0x04, 0x04, 0x00, 0x03

ov80_0223BE9E: ; 0x0223BE9E
	.byte 0x03

ov80_0223BE9F: ; 0x0223BE9F
	.byte 0x0A
	.byte 0x05, 0x06, 0x07, 0x04, 0x09, 0x02, 0x0A, 0x00

ov80_0223BEA8:
	.byte 0x95, 0x00, 0x96, 0x00, 0x97, 0x00, 0x98, 0x00
	.byte 0x99, 0x00, 0x9C, 0x00, 0x9E, 0x00, 0x9D, 0x00

ov80_0223BEB8: ; 0x0223BEB8
	.byte 0x21, 0x00, 0x14, 0x00, 0x27, 0x00, 0x2B, 0x00
	.byte 0x2B, 0x00, 0x42, 0x00, 0x2E, 0x00, 0x59, 0x00

ov80_0223BEC8: ; 0x0223BEC8
	.byte 0xDE, 0x00, 0x14, 0x00, 0xD8, 0x00, 0x2B, 0x00
	.byte 0xD5, 0x00, 0x42, 0x00, 0xD2, 0x00, 0x59, 0x00

ov80_0223BED8:
	.byte 0x9C, 0x00, 0x9E, 0x00, 0x9D, 0x00, 0xC9, 0x00
	.byte 0xCA, 0x00, 0xCB, 0x00, 0xCC, 0x00, 0xCD, 0x00, 0xCE, 0x00, 0xCF, 0x00

ov80_0223BEEC:
	.byte 0xDD, 0x00, 0xD9, 0x00
	.byte 0xD5, 0x00, 0x15, 0x01, 0x28, 0x01, 0xE6, 0x00, 0x13, 0x01, 0xEA, 0x00, 0x16, 0x01, 0x17, 0x01
	.byte 0x19, 0x01

ov80_0223BF02:
	.byte 0xE6, 0x00, 0x13, 0x01, 0xEA, 0x00, 0xE8, 0x00, 0x09, 0x01, 0x14, 0x01, 0x0C, 0x01
	.byte 0x0E, 0x01, 0xDC, 0x00, 0x29, 0x01, 0x1F, 0x01

ov80_0223BF18:
	.byte 0xD6, 0x00, 0x0F, 0x01, 0x0A, 0x01, 0x0B, 0x01
	.byte 0xFD, 0x00, 0xE8, 0x00, 0x09, 0x01, 0x14, 0x01, 0x0C, 0x01, 0x0E, 0x01, 0x16, 0x01, 0x17, 0x01
	.byte 0x19, 0x01

ov80_0223BF32:
	.byte 0xB8, 0x00, 0xB9, 0x00, 0xBA, 0x00, 0xBB, 0x00, 0xBC, 0x00, 0xBD, 0x00, 0xBE, 0x00
	.byte 0xBF, 0x00, 0xC0, 0x00, 0xC1, 0x00, 0xC2, 0x00, 0xC3, 0x00, 0xC4, 0x00, 0xC5, 0x00, 0xC6, 0x00
	.byte 0xC7, 0x00, 0xC8, 0x00, 0x9C, 0x00, 0x9E, 0x00, 0x9D, 0x00

ov80_0223BF5A: ; 0x0223BF5A
	.byte 0x5D, 0x00

ov80_0223BF5C: ; 0x0223BF5C
	.byte 0x3E, 0x00

ov80_0223BF5E: ; 0x0223BF5E
	.byte 0xA3, 0x00
	.byte 0x5E, 0x00, 0x40, 0x00, 0xA4, 0x00, 0x5F, 0x00, 0x42, 0x00, 0xA5, 0x00, 0x60, 0x00, 0x44, 0x00
	.byte 0xA6, 0x00, 0x61, 0x00, 0x46, 0x00, 0xA7, 0x00, 0x62, 0x00, 0x48, 0x00, 0xA8, 0x00, 0x63, 0x00
	.byte 0x4A, 0x00, 0xA9, 0x00, 0x64, 0x00, 0x4C, 0x00, 0xAA, 0x00, 0x65, 0x00, 0x4E, 0x00, 0xAB, 0x00
	.byte 0x5D, 0x00, 0x3D, 0x00, 0xA3, 0x00, 0x5E, 0x00, 0x3F, 0x00, 0xA4, 0x00, 0x5F, 0x00, 0x41, 0x00
	.byte 0xA5, 0x00, 0x60, 0x00, 0x43, 0x00, 0xA6, 0x00, 0x61, 0x00, 0x45, 0x00, 0xA7, 0x00, 0x62, 0x00
	.byte 0x47, 0x00, 0xA8, 0x00, 0x63, 0x00, 0x49, 0x00, 0xA9, 0x00, 0x64, 0x00, 0x4B, 0x00, 0xAA, 0x00
	.byte 0x65, 0x00, 0x4D, 0x00, 0xAB, 0x00, 0x66, 0x00, 0x4F, 0x00, 0xAC, 0x00, 0x67, 0x00, 0x50, 0x00
	.byte 0xAD, 0x00, 0x68, 0x00, 0x51, 0x00, 0xAE, 0x00, 0x69, 0x00, 0x52, 0x00, 0xAF, 0x00, 0x6A, 0x00
	.byte 0x53, 0x00, 0xB0, 0x00, 0x6B, 0x00, 0x54, 0x00, 0xB1, 0x00, 0x6D, 0x00, 0x56, 0x00, 0xB3, 0x00
	.byte 0x6E, 0x00, 0x57, 0x00, 0xB4, 0x00, 0x6F, 0x00, 0x58, 0x00, 0xB5, 0x00, 0x6C, 0x00, 0x55, 0x00
	.byte 0xB2, 0x00, 0x71, 0x00, 0x5A, 0x00, 0xB7, 0x00, 0x70, 0x00, 0x59, 0x00, 0xB6, 0x00, 0x72, 0x00
	.byte 0x5B, 0x00, 0xB8, 0x00, 0x73, 0x00, 0x5C, 0x00, 0xB9, 0x00, 0x00, 0x00

ov80_0223C01C: ; 0x0223C01C
	.byte 0x00, 0x02, 0x02, 0x02
	.byte 0x02, 0x04, 0x04, 0x05, 0x06, 0x00, 0x00, 0x00

ov80_0223C028: ; 0x0223C028
	.byte 0x00, 0x07, 0x08, 0x09, 0x0A, 0x0D, 0x0E, 0x10
	.byte 0x11, 0x00, 0x00, 0x00

ov80_0223C034: ; 0x0223C034
	.byte 0x8D, 0x00, 0x91, 0x00, 0x8E, 0x00, 0x8F, 0x00, 0x90, 0x00, 0x00, 0x00

ov80_0223C040: ; 0x0223C040
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x00, 0x00, 0x00

ov80_0223C048: ; 0x0223C048
	.byte 0xD5, 0x00, 0x9D, 0x00, 0xEA, 0x00, 0xD9, 0x00

ov80_0223C050: ; 0x0223C050
	.byte 0x04, 0x00, 0x00, 0x01, 0x02, 0x03, 0x14, 0x00, 0x02, 0x03, 0x04, 0x05, 0x09, 0x00, 0x04, 0x06
	.byte 0x06, 0x07, 0x0A, 0x00, 0x06, 0x07, 0x08, 0x09, 0x23, 0x00, 0x08, 0x09, 0x0A, 0x0B, 0x0D, 0x00
	.byte 0x0B, 0x0C, 0x0D, 0x0E, 0x11, 0x00, 0x0D, 0x0E, 0x0F, 0x10, 0x00, 0x00

ov80_0223C07C: ; 0x0223C07C
	.byte 0x78, 0x56, 0x34, 0x12
	.byte 0x00, 0x00, 0x00, 0x00, 0x71, 0x00, 0x90, 0x00, 0xF1, 0x00, 0xA2, 0x00, 0xA3, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223C0AC: ; 0x0223C0AC
	.byte 0x01, 0x00, 0xEA, 0x00
	.byte 0x16, 0x00, 0x4B, 0x00, 0xEB, 0x00, 0x4C, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x86, 0x00
	.byte 0x68, 0x00, 0x5F, 0x00, 0x71, 0x00, 0x7E, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x04, 0x00, 0xFD, 0x00, 0x34, 0x00, 0x53, 0x00, 0x35, 0x00, 0x7E, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x83, 0x00, 0x79, 0x00, 0x5C, 0x00, 0x63, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x07, 0x00, 0xF3, 0x00
	.byte 0x37, 0x00, 0x39, 0x00, 0x60, 0x01, 0x38, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x6D, 0x00
	.byte 0x7C, 0x00, 0x5D, 0x00, 0x92, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x7B, 0x00, 0xDD, 0x00, 0x3E, 0x01, 0xD3, 0x00, 0x68, 0x00, 0x3A, 0x01
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x6A, 0x00, 0x79, 0x00, 0x9A, 0x00, 0x55, 0x00, 0x60, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x6B, 0x01, 0xF6, 0x00
	.byte 0x2D, 0x01, 0x60, 0x01, 0x02, 0x01, 0xBD, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x70, 0x00
	.byte 0x8F, 0x00, 0x67, 0x00, 0x9A, 0x00, 0x68, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x51, 0x00, 0x99, 0x00, 0x5F, 0x01, 0x30, 0x00, 0x3F, 0x01, 0x73, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x64, 0x00, 0x55, 0x00, 0x9C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x2C, 0x01, 0xD9, 0x00
	.byte 0x2F, 0x00, 0x39, 0x01, 0xCC, 0x00, 0x03, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x59, 0x00
	.byte 0x7E, 0x00, 0x64, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x28, 0x01, 0xE8, 0x00, 0xFC, 0x00, 0x45, 0x00, 0xC5, 0x00, 0x12, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x8F, 0x00, 0x60, 0x00, 0x7F, 0x00, 0x68, 0x00, 0x70, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xA7, 0x00, 0xC9, 0x00
	.byte 0x44, 0x01, 0x65, 0x00, 0xA9, 0x00, 0xB8, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x55, 0x00
	.byte 0x79, 0x00, 0x8F, 0x00, 0x9C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x1B, 0x00, 0xED, 0x00, 0x5B, 0x00, 0x3D, 0x01, 0xC9, 0x00, 0x1C, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x66, 0x00, 0xA1, 0x00, 0x7A, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x14, 0x01, 0xCB, 0x00
	.byte 0x13, 0x00, 0x62, 0x00, 0x1B, 0x01, 0x74, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x6A, 0x00
	.byte 0x81, 0x00, 0x92, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x66, 0x00, 0x97, 0x00, 0x5D, 0x00, 0xF6, 0x00, 0x49, 0x00, 0x71, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x70, 0x00, 0x8F, 0x00, 0x70, 0x00, 0x8F, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x4A, 0x00, 0xE6, 0x00
	.byte 0xDE, 0x00, 0x5E, 0x01, 0x46, 0x00, 0xB6, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x55, 0x00
	.byte 0x68, 0x00, 0x75, 0x00, 0x87, 0x00, 0x77, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xC8, 0x00, 0xD5, 0x00, 0xDC, 0x00, 0xF7, 0x00, 0x6D, 0x00, 0x56, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x91, 0x00, 0x57, 0x00, 0x8F, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x73, 0x01, 0x9D, 0x00
	.byte 0xE1, 0x00, 0x1D, 0x00, 0x18, 0x01, 0xB8, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x70, 0x00
	.byte 0x75, 0x00, 0x8A, 0x00, 0x55, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xE4, 0x00, 0xF9, 0x00, 0xF2, 0x00, 0x34, 0x00, 0x2E, 0x00, 0xB6, 0x00
	.byte 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98, 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20
	.byte 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x78, 0x00, 0x9C, 0x00, 0x84, 0x00, 0x9C, 0x00, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x31, 0x01, 0x9E, 0x00
	.byte 0xE8, 0x00, 0x3D, 0x01, 0x4E, 0x01, 0x6A, 0x00, 0x78, 0x56, 0x34, 0x12, 0x32, 0x54, 0x76, 0x98
	.byte 0xFF, 0xFF, 0xFF, 0x3F, 0x20, 0x20, 0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xFF, 0x64, 0x00
	.byte 0x7A, 0x00, 0x9A, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF

ov80_0223C464: ; 0x0223C464
	.byte 0x06, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
	.byte 0x1B, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00

ov80_0223C478: ; 0x0223C478
	.byte 0x00, 0x00

ov80_0223C47A: ; 0x0223C47A
	.byte 0x63, 0x00

ov80_0223C47C: ; 0x0223C47C
	.byte 0x64, 0x00

ov80_0223C47E: ; 0x0223C47E
	.byte 0x77, 0x00
	.byte 0x50, 0x00, 0x77, 0x00, 0x78, 0x00, 0x8B, 0x00, 0x64, 0x00, 0x8B, 0x00, 0x8C, 0x00, 0x9F, 0x00
	.byte 0x78, 0x00, 0x9F, 0x00, 0xA0, 0x00, 0xB3, 0x00, 0x8C, 0x00, 0xB3, 0x00, 0xB4, 0x00, 0xC7, 0x00
	.byte 0xA0, 0x00, 0xC7, 0x00, 0xC8, 0x00, 0xDB, 0x00, 0xB4, 0x00, 0xDB, 0x00, 0xDC, 0x00, 0xEF, 0x00
	.byte 0xC8, 0x00, 0x2B, 0x01, 0xC8, 0x00, 0x2B, 0x01

ov80_0223C4B8: ; 0x0223C4B8
	.byte 0x64, 0x00, 0x5F, 0x01, 0xE6, 0x01, 0x00, 0x01
	.byte 0x78, 0x00, 0xE7, 0x01, 0x6E, 0x02, 0x04, 0x01, 0x8C, 0x00, 0x6F, 0x02, 0xF6, 0x02, 0x08, 0x01
	.byte 0xA0, 0x00, 0xF7, 0x02, 0x7E, 0x03, 0x0C, 0x01, 0xB4, 0x00, 0x6F, 0x02, 0xB6, 0x03, 0x10, 0x01
	.byte 0xC8, 0x00, 0x6F, 0x02, 0xB6, 0x03, 0x14, 0x01, 0xDC, 0x00, 0x6F, 0x02, 0xB6, 0x03, 0x18, 0x01
	.byte 0x2C, 0x01, 0x5F, 0x01, 0xB6, 0x03, 0x1F, 0x00, 0x36, 0x01, 0x5F, 0x01, 0xE6, 0x01, 0x0C, 0x00
	.byte 0x37, 0x01, 0xF7, 0x02, 0xB6, 0x03, 0x1F, 0x00

ov80_0223C508: ; 0x0223C508
	.byte 0x64, 0x00, 0x01, 0x00, 0x96, 0x00, 0x00, 0x01
	.byte 0x78, 0x00, 0x97, 0x00, 0xFA, 0x00, 0x04, 0x01, 0x8C, 0x00, 0xFB, 0x00, 0x5E, 0x01, 0x08, 0x01
	.byte 0xA0, 0x00, 0x5F, 0x01, 0xE6, 0x01, 0x0C, 0x01, 0xB4, 0x00, 0xE7, 0x01, 0x6E, 0x02, 0x10, 0x01
	.byte 0xC8, 0x00, 0x6F, 0x02, 0xF6, 0x02, 0x14, 0x01, 0xDC, 0x00, 0xF7, 0x02, 0x7E, 0x03, 0x18, 0x01
	.byte 0x2C, 0x01, 0x5F, 0x01, 0xB6, 0x03, 0x1F, 0x00, 0x36, 0x01, 0x5F, 0x01, 0xE6, 0x01, 0x0C, 0x00
	.byte 0x37, 0x01, 0xF7, 0x02, 0xB6, 0x03, 0x1F, 0x00

ov80_0223C558: ; 0x0223C558
	.byte 0x64, 0x00, 0x5F, 0x01, 0xE6, 0x01, 0x00, 0x01
	.byte 0x78, 0x00, 0xE7, 0x01, 0x6E, 0x02, 0x04, 0x01, 0x8C, 0x00, 0x6F, 0x02, 0xF6, 0x02, 0x08, 0x01
	.byte 0xA0, 0x00, 0xF7, 0x02, 0x7E, 0x03, 0x0C, 0x01, 0xB4, 0x00, 0x5F, 0x01, 0xB6, 0x03, 0x10, 0x01
	.byte 0xC8, 0x00, 0x5F, 0x01, 0xB6, 0x03, 0x14, 0x01, 0xDC, 0x00, 0x5F, 0x01, 0xB6, 0x03, 0x18, 0x01
	.byte 0x2C, 0x01, 0x5F, 0x01, 0xB6, 0x03, 0x1F, 0x00, 0x36, 0x01, 0x5F, 0x01, 0xE6, 0x01, 0x0C, 0x00
	.byte 0x37, 0x01, 0xF7, 0x02, 0xB6, 0x03, 0x1F, 0x00

ov80_0223C5A8: ; 0x0223C5A8
	.byte 0x01, 0x00, 0x9A, 0x00, 0x9B, 0x00, 0x0E, 0x01
	.byte 0x0F, 0x01, 0x77, 0x01

ov80_0223C5B4: ; 0x0223C5B4
	.byte 0x78, 0x01, 0xDD, 0x01, 0x00

ov80_0223C5B8: ; 0x0223C5B9
	.byte 0x08, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00
	.byte 0x00, 0x0C, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00
	.byte 0x00, 0x14, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00

ov80_0223C5E0: ; 0x0223C5E0
	.byte 0x01, 0x00, 0x9A, 0x00, 0x01, 0x00, 0x9A, 0x00, 0x01, 0x00, 0x0E, 0x01, 0x01, 0x00, 0x0E, 0x01
	.byte 0x01, 0x00, 0x0E, 0x01, 0x9B, 0x00, 0x77, 0x01, 0x9B, 0x00, 0x77, 0x01, 0x9B, 0x00, 0x77, 0x01
	.byte 0x0F, 0x01, 0xDD, 0x01, 0x0F, 0x01, 0xDD, 0x01

ov80_0223C608: ; 0x0223C608
	.byte 0x14, 0x00, 0x15, 0x00, 0x02, 0x00, 0x03, 0x00
	.byte 0x1B, 0x00, 0x1B, 0x00, 0x26, 0x00, 0x26, 0x00, 0x2C, 0x00, 0x2D, 0x00, 0x2E, 0x00, 0x0B, 0x00
	.byte 0x16, 0x00, 0x16, 0x00, 0x3B, 0x00, 0x3B, 0x00, 0x07, 0x00, 0x07, 0x00, 0x04, 0x00, 0x05, 0x00
	.byte 0x35, 0x00, 0x35, 0x00, 0x36, 0x00, 0x36, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x1C, 0x00, 0x1C, 0x00, 0x4E, 0x00, 0x4E, 0x00, 0x09, 0x00, 0x09, 0x00, 0x30, 0x00, 0x30, 0x00
	.byte 0x45, 0x00, 0x45, 0x00, 0x45, 0x00, 0x45, 0x00, 0x31, 0x00, 0x31, 0x00, 0x32, 0x00, 0x32, 0x00
	.byte 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x09, 0x00, 0x09, 0x00, 0x30, 0x00, 0x30, 0x00
	.byte 0x31, 0x00, 0x31, 0x00, 0x32, 0x00, 0x32, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x1D, 0x00
	.byte 0x39, 0x00, 0x39, 0x00, 0x34, 0x00, 0x34, 0x00, 0x54, 0x00, 0x53, 0x00, 0x0C, 0x00, 0x0D, 0x00
	.byte 0x55, 0x00, 0x3A, 0x00, 0x51, 0x00, 0x1A, 0x00

ov80_0223C698: ; 0x0223C698
	.byte 0x02, 0x00, 0x03, 0x00, 0x14, 0x00, 0x15, 0x00
	.byte 0x25, 0x00, 0x24, 0x00, 0x16, 0x00, 0x1C, 0x00, 0x02, 0x00, 0x03, 0x00, 0x51, 0x00, 0x1A, 0x00
	.byte 0x13, 0x00, 0x50, 0x00, 0x16, 0x00, 0x1C, 0x00, 0x20, 0x00, 0x21, 0x00, 0x14, 0x00, 0x15, 0x00
	.byte 0x25, 0x00, 0x24, 0x00, 0x3A, 0x00, 0x55, 0x00, 0x20, 0x00, 0x21, 0x00, 0x51, 0x00, 0x1A, 0x00
	.byte 0x13, 0x00, 0x50, 0x00, 0x3A, 0x00, 0x55, 0x00, 0x04, 0x00, 0x05, 0x00, 0x47, 0x00, 0x12, 0x00
	.byte 0x22, 0x00, 0x23, 0x00, 0x25, 0x00, 0x24, 0x00, 0x04, 0x00, 0x05, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x22, 0x00, 0x23, 0x00, 0x39, 0x00, 0x34, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x47, 0x00, 0x12, 0x00
	.byte 0x14, 0x00, 0x15, 0x00, 0x13, 0x00, 0x50, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x14, 0x00, 0x15, 0x00, 0x39, 0x00, 0x34, 0x00, 0x18, 0x00, 0x19, 0x00, 0x47, 0x00, 0x12, 0x00
	.byte 0x27, 0x00, 0x28, 0x00, 0x33, 0x00, 0x1B, 0x00, 0x18, 0x00, 0x19, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x27, 0x00, 0x28, 0x00, 0x33, 0x00, 0x1B, 0x00

ov80_0223C738: ; 0x0223C738
	.byte 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x3C, 0x00, 0x3C, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3D, 0x00, 0x3D, 0x00
	.byte 0x20, 0x00, 0x20, 0x00, 0x20, 0x00, 0x21, 0x00, 0x21, 0x00, 0x21, 0x00, 0x04, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x2C, 0x00, 0x2C, 0x00, 0x2C, 0x00, 0x2D, 0x00
	.byte 0x2D, 0x00, 0x2D, 0x00, 0x34, 0x00, 0x34, 0x00, 0x34, 0x00, 0x55, 0x00, 0x55, 0x00, 0x55, 0x00
	.byte 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x15, 0x00, 0x15, 0x00, 0x15, 0x00, 0x51, 0x00, 0x51, 0x00
	.byte 0x51, 0x00, 0x1A, 0x00, 0x1A, 0x00, 0x1A, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x1C, 0x00
	.byte 0x1C, 0x00, 0x1C, 0x00, 0x16, 0x00, 0x16, 0x00, 0x16, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x30, 0x00
	.byte 0x30, 0x00, 0x25, 0x00, 0x25, 0x00, 0x50, 0x00, 0x50, 0x00, 0x50, 0x00, 0x24, 0x00, 0x24, 0x00
	.byte 0x24, 0x00, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x34, 0x00, 0x34, 0x00, 0x45, 0x00, 0x45, 0x00
	.byte 0x45, 0x00, 0x2E, 0x00, 0x2E, 0x00, 0x09, 0x00, 0x09, 0x00, 0x55, 0x00, 0x55, 0x00, 0x55, 0x00
	.byte 0x13, 0x00, 0x13, 0x00, 0x3B, 0x00, 0x3B, 0x00, 0x47, 0x00, 0x47, 0x00, 0x47, 0x00, 0x12, 0x00
	.byte 0x12, 0x00, 0x12, 0x00, 0x53, 0x00, 0x53, 0x00, 0x53, 0x00, 0x54, 0x00, 0x54, 0x00, 0x54, 0x00
	.byte 0x0C, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0A, 0x00, 0x0A, 0x00
	.byte 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x1B, 0x00, 0x1B, 0x00
	.byte 0x1B, 0x00, 0x23, 0x00, 0x23, 0x00, 0x23, 0x00, 0x31, 0x00, 0x31, 0x00, 0x31, 0x00, 0x32, 0x00
	.byte 0x32, 0x00, 0x32, 0x00, 0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00
	.byte 0x22, 0x00, 0x22, 0x00, 0x39, 0x00, 0x39, 0x00, 0x4E, 0x00, 0x4E, 0x00, 0x3A, 0x00, 0x3A, 0x00
	.byte 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 0x19, 0x00, 0x19, 0x00, 0x19, 0x00, 0x27, 0x00, 0x27, 0x00
	.byte 0x27, 0x00, 0x28, 0x00, 0x28, 0x00, 0x28, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x1D, 0x00
	.byte 0x35, 0x00, 0x35, 0x00, 0x36, 0x00, 0x36, 0x00, 0x02, 0x00, 0x02, 0x00, 0x03, 0x00, 0x03, 0x00
	.byte 0x3C, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3D, 0x00, 0x20, 0x00, 0x20, 0x00, 0x21, 0x00, 0x21, 0x00
	.byte 0x06, 0x00, 0x06, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x16, 0x00, 0x16, 0x00, 0x55, 0x00, 0x55, 0x00
	.byte 0x13, 0x00, 0x13, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x30, 0x00, 0x30, 0x00, 0x25, 0x00, 0x25, 0x00
	.byte 0x34, 0x00, 0x34, 0x00, 0x45, 0x00, 0x45, 0x00, 0x2E, 0x00, 0x2E, 0x00, 0x09, 0x00, 0x09, 0x00
	.byte 0x26, 0x00, 0x26, 0x00, 0x33, 0x00, 0x33, 0x00, 0x04, 0x00, 0x04, 0x00, 0x05, 0x00, 0x05, 0x00
	.byte 0x34, 0x00, 0x34, 0x00, 0x55, 0x00, 0x55, 0x00, 0x14, 0x00, 0x14, 0x00, 0x15, 0x00, 0x15, 0x00
	.byte 0x47, 0x00, 0x47, 0x00, 0x12, 0x00, 0x12, 0x00, 0x10, 0x00, 0x10, 0x00, 0x11, 0x00, 0x11, 0x00
	.byte 0x18, 0x00, 0x18, 0x00, 0x19, 0x00, 0x19, 0x00, 0x35, 0x00, 0x35, 0x00, 0x36, 0x00, 0x36, 0x00
	.byte 0x27, 0x00, 0x27, 0x00, 0x28, 0x00, 0x28, 0x00, 0x1D, 0x00, 0x1D, 0x00, 0x0E, 0x00, 0x0E, 0x00
	.byte 0x0A, 0x00, 0x0A, 0x00, 0x1B, 0x00, 0x1B, 0x00, 0x23, 0x00, 0x23, 0x00, 0x31, 0x00, 0x31, 0x00
	.byte 0x32, 0x00, 0x32, 0x00, 0x51, 0x00, 0x51, 0x00, 0x1A, 0x00, 0x1A, 0x00, 0x53, 0x00, 0x53, 0x00
	.byte 0x54, 0x00, 0x54, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x33, 0x00, 0x33, 0x00
	.byte 0x55, 0x00, 0x55, 0x00, 0x13, 0x00, 0x13, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x2E, 0x00, 0x2E, 0x00
	.byte 0x09, 0x00, 0x09, 0x00, 0x30, 0x00, 0x30, 0x00, 0x34, 0x00, 0x34, 0x00, 0x25, 0x00, 0x25, 0x00
	.byte 0x39, 0x00, 0x39, 0x00, 0x4E, 0x00, 0x4E, 0x00, 0x22, 0x00, 0x22, 0x00, 0x3B, 0x00, 0x3B, 0x00
	.byte 0x3A, 0x00, 0x3A, 0x00, 0x26, 0x00, 0x26, 0x00, 0x33, 0x00, 0x33, 0x00, 0x45, 0x00, 0x45, 0x00
	.byte 0x50, 0x00, 0x50, 0x00, 0x24, 0x00, 0x24, 0x00, 0x07, 0x00, 0x07, 0x00, 0x55, 0x00, 0x55, 0x00

ov80_0223C990: ; 0x0223C990
	.byte 0x01, 0x00, 0x04, 0x00, 0x07, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x10, 0x00
	.byte 0x13, 0x00, 0x15, 0x00, 0x17, 0x00, 0x19, 0x00, 0x1B, 0x00, 0x1D, 0x00, 0x20, 0x00, 0x23, 0x00
	.byte 0x25, 0x00, 0x27, 0x00, 0x29, 0x00, 0x2B, 0x00, 0x2E, 0x00, 0x30, 0x00, 0x32, 0x00, 0x34, 0x00
	.byte 0x36, 0x00, 0x38, 0x00, 0x3C, 0x00, 0x3F, 0x00, 0x42, 0x00, 0x45, 0x00, 0x48, 0x00, 0x4A, 0x00
	.byte 0x4F, 0x00, 0x51, 0x00, 0x54, 0x00, 0x56, 0x00, 0x58, 0x00, 0x5A, 0x00, 0x5C, 0x00, 0x60, 0x00
	.byte 0x62, 0x00, 0x64, 0x00, 0x66, 0x00, 0x68, 0x00, 0x74, 0x00, 0x76, 0x00, 0x81, 0x00, 0x84, 0x00
	.byte 0x85, 0x00, 0x93, 0x00, 0x98, 0x00, 0x9B, 0x00, 0x9E, 0x00, 0xA1, 0x00, 0xA3, 0x00, 0xA5, 0x00
	.byte 0xA7, 0x00, 0xAA, 0x00, 0xAC, 0x00, 0xAD, 0x00, 0xAE, 0x00, 0xAF, 0x00, 0xB1, 0x00, 0xB3, 0x00
	.byte 0xB7, 0x00, 0xBB, 0x00, 0xBF, 0x00, 0xC2, 0x00, 0xC9, 0x00, 0xCC, 0x00, 0xD1, 0x00, 0xD8, 0x00
	.byte 0xDA, 0x00, 0xDC, 0x00, 0xDF, 0x00, 0xE1, 0x00, 0xE4, 0x00, 0xE7, 0x00, 0xEB, 0x00, 0xEC, 0x00
	.byte 0xEE, 0x00, 0xF6, 0x00, 0xFC, 0x00, 0xFF, 0x00, 0x02, 0x01, 0x05, 0x01, 0x07, 0x01, 0x09, 0x01
	.byte 0x0A, 0x01, 0x0C, 0x01, 0x0E, 0x01, 0x11, 0x01, 0x14, 0x01, 0x16, 0x01, 0x18, 0x01, 0x19, 0x01
	.byte 0x1B, 0x01, 0x1D, 0x01, 0x1F, 0x01, 0x22, 0x01, 0x24, 0x01, 0x25, 0x01, 0x28, 0x01, 0x2A, 0x01
	.byte 0x2C, 0x01, 0x30, 0x01, 0x33, 0x01, 0x35, 0x01, 0x3C, 0x01, 0x3E, 0x01, 0x42, 0x01, 0x45, 0x01
	.byte 0x48, 0x01, 0x4B, 0x01, 0x4D, 0x01, 0x53, 0x01, 0x55, 0x01, 0x57, 0x01, 0x5D, 0x01, 0x61, 0x01
	.byte 0x63, 0x01, 0x68, 0x01, 0x69, 0x01, 0x6B, 0x01, 0x72, 0x01, 0x73, 0x01, 0x76, 0x01, 0x83, 0x01
	.byte 0x86, 0x01, 0x89, 0x01, 0x8C, 0x01, 0x8F, 0x01, 0x91, 0x01, 0x93, 0x01, 0x96, 0x01, 0x9C, 0x01
	.byte 0x9F, 0x01, 0xA2, 0x01, 0xA4, 0x01, 0xA6, 0x01, 0xAF, 0x01, 0xB1, 0x01, 0xB2, 0x01, 0xB4, 0x01
	.byte 0xB6, 0x01, 0xB7, 0x01, 0xB8, 0x01, 0xBB, 0x01, 0xBF, 0x01, 0xC1, 0x01, 0xC3, 0x01, 0xC5, 0x01
	.byte 0xC8, 0x01, 0xCB, 0x01, 0x02, 0x00, 0x05, 0x00, 0x08, 0x00, 0x0C, 0x00, 0x0F, 0x00, 0x11, 0x00
	.byte 0x14, 0x00, 0x18, 0x00, 0x1E, 0x00, 0x21, 0x00, 0x28, 0x00, 0x2C, 0x00, 0x2F, 0x00, 0x33, 0x00
	.byte 0x3A, 0x00, 0x3D, 0x00, 0x40, 0x00, 0x43, 0x00, 0x46, 0x00, 0x4B, 0x00, 0x4D, 0x00, 0x53, 0x00
	.byte 0x5D, 0x00, 0x5F, 0x00, 0x69, 0x00, 0x6C, 0x00, 0x6D, 0x00, 0x6F, 0x00, 0x72, 0x00, 0x78, 0x00
	.byte 0x89, 0x00, 0x8A, 0x00, 0x8C, 0x00, 0x94, 0x00, 0x99, 0x00, 0x9C, 0x00, 0x9F, 0x00, 0xA2, 0x00
	.byte 0xA6, 0x00, 0xA8, 0x00, 0xB0, 0x00, 0xB4, 0x00, 0xB8, 0x00, 0xB9, 0x00, 0xBC, 0x00, 0xBE, 0x00
	.byte 0xC0, 0x00, 0xC1, 0x00, 0xC3, 0x00, 0xC6, 0x00, 0xC8, 0x00, 0xCA, 0x00, 0xCE, 0x00, 0xCF, 0x00
	.byte 0xD3, 0x00, 0xD7, 0x00, 0xDB, 0x00, 0xDE, 0x00, 0xEF, 0x00, 0xF0, 0x00, 0xF7, 0x00, 0xFD, 0x00
	.byte 0x00, 0x01, 0x03, 0x01, 0x06, 0x01, 0x08, 0x01, 0x0B, 0x01, 0x0D, 0x01, 0x0F, 0x01, 0x12, 0x01
	.byte 0x15, 0x01, 0x17, 0x01, 0x1C, 0x01, 0x26, 0x01, 0x2B, 0x01, 0x2D, 0x01, 0x2E, 0x01, 0x2F, 0x01
	.byte 0x31, 0x01, 0x34, 0x01, 0x37, 0x01, 0x38, 0x01, 0x39, 0x01, 0x3A, 0x01, 0x3B, 0x01, 0x40, 0x01
	.byte 0x47, 0x01, 0x49, 0x01, 0x59, 0x01, 0x5B, 0x01, 0x5F, 0x01, 0x66, 0x01, 0x6C, 0x01, 0x6E, 0x01
	.byte 0x74, 0x01, 0x77, 0x01, 0x84, 0x01, 0x87, 0x01, 0x8A, 0x01, 0x8D, 0x01, 0x90, 0x01, 0x92, 0x01
	.byte 0x94, 0x01, 0x98, 0x01, 0x9A, 0x01, 0x9D, 0x01, 0x9E, 0x01, 0xA1, 0x01, 0xA9, 0x01, 0xAB, 0x01
	.byte 0xB9, 0x01, 0xBC, 0x01, 0xBE, 0x01, 0xCA, 0x01, 0x9D, 0x01, 0x9D, 0x01, 0x1A, 0x00, 0x1C, 0x00
	.byte 0x1F, 0x00, 0x22, 0x00, 0x24, 0x00, 0x2A, 0x00, 0x2D, 0x00, 0x31, 0x00, 0x35, 0x00, 0x39, 0x00
	.byte 0x41, 0x00, 0x47, 0x00, 0x4C, 0x00, 0x50, 0x00, 0x52, 0x00, 0x55, 0x00, 0x57, 0x00, 0x61, 0x00
	.byte 0x63, 0x00, 0x65, 0x00, 0x6A, 0x00, 0x6B, 0x00, 0x6E, 0x00, 0x70, 0x00, 0x71, 0x00, 0x73, 0x00
	.byte 0x75, 0x00, 0x77, 0x00, 0x7A, 0x00, 0x7C, 0x00, 0x7D, 0x00, 0x7E, 0x00, 0x80, 0x00, 0x8B, 0x00
	.byte 0x8D, 0x00, 0xA4, 0x00, 0xAB, 0x00, 0xB2, 0x00, 0xB6, 0x00, 0xBD, 0x00, 0xC7, 0x00, 0xCB, 0x00
	.byte 0xCD, 0x00, 0xD2, 0x00, 0xDD, 0x00, 0xE0, 0x00, 0xE2, 0x00, 0xE3, 0x00, 0xEA, 0x00, 0xED, 0x00
	.byte 0xF1, 0x00, 0x10, 0x01, 0x13, 0x01, 0x1E, 0x01, 0x20, 0x01, 0x23, 0x01, 0x27, 0x01, 0x29, 0x01
	.byte 0x36, 0x01, 0x3D, 0x01, 0x3F, 0x01, 0x43, 0x01, 0x44, 0x01, 0x46, 0x01, 0x4C, 0x01, 0x4E, 0x01
	.byte 0x4F, 0x01, 0x50, 0x01, 0x51, 0x01, 0x52, 0x01, 0x54, 0x01, 0x56, 0x01, 0x5A, 0x01, 0x5C, 0x01
	.byte 0x60, 0x01, 0x62, 0x01, 0x64, 0x01, 0x65, 0x01, 0x67, 0x01, 0x6A, 0x01, 0x6F, 0x01, 0x70, 0x01
	.byte 0x71, 0x01, 0x8E, 0x01, 0x99, 0x01, 0x9B, 0x01, 0xA0, 0x01, 0xA3, 0x01, 0xA5, 0x01, 0xA7, 0x01
	.byte 0xA8, 0x01, 0xAA, 0x01, 0xAC, 0x01, 0xAD, 0x01, 0xB0, 0x01, 0xB3, 0x01, 0xBA, 0x01, 0xC6, 0x01
	.byte 0xC7, 0x01, 0xC9, 0x01, 0xCC, 0x01, 0xDE, 0x01, 0xDF, 0x01, 0x12, 0x00, 0x16, 0x00, 0x09, 0x00
	.byte 0x26, 0x00, 0x37, 0x00, 0x3B, 0x00, 0x3E, 0x00, 0x44, 0x00, 0x49, 0x00, 0x4E, 0x00, 0x59, 0x00
	.byte 0x5B, 0x00, 0x5E, 0x00, 0x67, 0x00, 0x79, 0x00, 0x7B, 0x00, 0x7F, 0x00, 0x82, 0x00, 0x83, 0x00
	.byte 0x86, 0x00, 0x87, 0x00, 0x88, 0x00, 0x8E, 0x00, 0x8F, 0x00, 0x90, 0x00, 0x91, 0x00, 0x92, 0x00
	.byte 0x95, 0x00, 0x9A, 0x00, 0x9D, 0x00, 0xA0, 0x00, 0xA9, 0x00, 0xB5, 0x00, 0xBA, 0x00, 0xC4, 0x00
	.byte 0xC5, 0x00, 0xD0, 0x00, 0xD4, 0x00, 0xD5, 0x00, 0xD6, 0x00, 0xD9, 0x00, 0xE5, 0x00, 0xE6, 0x00
	.byte 0xE8, 0x00, 0xE9, 0x00, 0xF2, 0x00, 0xF3, 0x00, 0xF4, 0x00, 0xF5, 0x00, 0xF8, 0x00, 0xFE, 0x00
	.byte 0x01, 0x01, 0x04, 0x01, 0x1A, 0x01, 0x21, 0x01, 0x32, 0x01, 0x41, 0x01, 0x4A, 0x01, 0x58, 0x01
	.byte 0x5E, 0x01, 0x6D, 0x01, 0xE8, 0x01, 0x75, 0x01, 0x78, 0x01, 0x79, 0x01, 0x7A, 0x01, 0x7B, 0x01
	.byte 0x7C, 0x01, 0x7D, 0x01, 0x85, 0x01, 0x88, 0x01, 0x8B, 0x01, 0x95, 0x01, 0x97, 0x01, 0xAE, 0x01
	.byte 0xB5, 0x01, 0xBD, 0x01, 0xC0, 0x01, 0xC2, 0x01, 0xC4, 0x01, 0xCD, 0x01, 0xCE, 0x01, 0xCF, 0x01
	.byte 0xD0, 0x01, 0xD1, 0x01, 0xD2, 0x01, 0xD3, 0x01, 0xD4, 0x01, 0xD5, 0x01, 0xD6, 0x01, 0xD7, 0x01
	.byte 0xD8, 0x01, 0xD9, 0x01, 0xDA, 0x01, 0xDB, 0x01, 0xDC, 0x01, 0xDD, 0x01, 0xE0, 0x01, 0xE1, 0x01
	.byte 0xE2, 0x01, 0xE5, 0x01, 0x03, 0x00, 0x06, 0x00, 0xE6, 0x01

ov80_0223CD4A: ; 0x0223CD4A
	.byte 0x0C, 0x00, 0x03, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x06, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x03, 0x00, 0x03, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x04, 0x00, 0x04, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x06, 0x00, 0x0C, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x01, 0x00
	.byte 0x01, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0C, 0x00
	.byte 0x03, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x05, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x0D, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x03, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x07, 0x00, 0x03, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x04, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00
	.byte 0x10, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00, 0x03, 0x00, 0x0B, 0x00
	.byte 0x0D, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0E, 0x00, 0x02, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0C, 0x00
	.byte 0x02, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x06, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0F, 0x00
	.byte 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0F, 0x00, 0x02, 0x00, 0x11, 0x00, 0x0A, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x05, 0x00
	.byte 0x04, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x11, 0x00
	.byte 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00
	.byte 0x06, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x02, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x06, 0x00, 0x0B, 0x00, 0x0C, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x04, 0x00, 0x06, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00
	.byte 0x05, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x03, 0x00, 0x03, 0x00, 0x0B, 0x00
	.byte 0x11, 0x00, 0x0A, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x04, 0x00, 0x04, 0x00, 0x0C, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x04, 0x00
	.byte 0x0E, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x10, 0x00
	.byte 0x10, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x06, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x03, 0x00, 0x11, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x05, 0x00, 0x05, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x04, 0x00, 0x01, 0x00, 0x01, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x03, 0x00, 0x06, 0x00, 0x03, 0x00, 0x01, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0C, 0x00
	.byte 0x0F, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x06, 0x00
	.byte 0x02, 0x00, 0x06, 0x00, 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00
	.byte 0x03, 0x00, 0x06, 0x00, 0x0C, 0x00, 0x04, 0x00, 0x04, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x05, 0x00
	.byte 0x04, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x07, 0x00, 0x03, 0x00, 0x05, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x03, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00
	.byte 0x0B, 0x00, 0x05, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x10, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x0C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x06, 0x00
	.byte 0x02, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x11, 0x00, 0x02, 0x00, 0x07, 0x00, 0x07, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x11, 0x00
	.byte 0x0F, 0x00, 0x0A, 0x00, 0x05, 0x00, 0x0B, 0x00, 0x05, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x05, 0x00, 0x04, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0B, 0x00
	.byte 0x04, 0x00, 0x11, 0x00, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x11, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x02, 0x00, 0x06, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x11, 0x00, 0x07, 0x00, 0x08, 0x00, 0x08, 0x00, 0x08, 0x00, 0x05, 0x00, 0x01, 0x00
	.byte 0x0E, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x06, 0x00, 0x06, 0x00, 0x06, 0x00
	.byte 0x06, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x10, 0x00, 0x05, 0x00, 0x0C, 0x00, 0x05, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x10, 0x00, 0x08, 0x00
	.byte 0x0E, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x06, 0x00, 0x06, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0x08, 0x00, 0x06, 0x00, 0x0C, 0x00, 0x06, 0x00, 0x02, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x07, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x10, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x06, 0x00, 0x04, 0x00, 0x06, 0x00
	.byte 0x08, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x04, 0x00, 0x04, 0x00, 0x03, 0x00, 0x04, 0x00, 0x03, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x06, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0C, 0x00
	.byte 0x03, 0x00, 0x05, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x0D, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x0B, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x03, 0x00, 0x03, 0x00, 0x04, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x0E, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0A, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x0B, 0x00, 0x05, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x0B, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x02, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0C, 0x00
	.byte 0x02, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x06, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0F, 0x00, 0x04, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x08, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0B, 0x00
	.byte 0x0C, 0x00, 0x0C, 0x00, 0x11, 0x00, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x0B, 0x00, 0x11, 0x00, 0x0A, 0x00, 0x04, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0E, 0x00
	.byte 0x0E, 0x00, 0x0C, 0x00, 0x11, 0x00, 0x10, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x05, 0x00, 0x0E, 0x00, 0x05, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x0B, 0x00
	.byte 0x11, 0x00, 0x05, 0x00, 0x0C, 0x00, 0x05, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00
	.byte 0x07, 0x00, 0x07, 0x00, 0x07, 0x00, 0x0C, 0x00, 0x02, 0x00, 0x11, 0x00, 0x11, 0x00, 0x0F, 0x00
	.byte 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x08, 0x00, 0x06, 0x00, 0x02, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x11, 0x00, 0x07, 0x00, 0x11, 0x00, 0x03, 0x00, 0x01, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0C, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x07, 0x00, 0x0D, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x01, 0x00, 0x01, 0x00, 0x01, 0x00, 0x0B, 0x00
	.byte 0x03, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x03, 0x00, 0x03, 0x00, 0x0B, 0x00, 0x0F, 0x00, 0x07, 0x00
	.byte 0x03, 0x00, 0x0C, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00
	.byte 0x06, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x0F, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x05, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x00
	.byte 0x02, 0x00, 0x0D, 0x00, 0x02, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x10, 0x00, 0x02, 0x00, 0x0C, 0x00
	.byte 0x0C, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x02, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x11, 0x00, 0x11, 0x00, 0x08, 0x00
	.byte 0x04, 0x00, 0x06, 0x00, 0x08, 0x00, 0x06, 0x00, 0x05, 0x00, 0x06, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x11, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x10, 0x00, 0x04, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x05, 0x00, 0x11, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0B, 0x00
	.byte 0x04, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x05, 0x00, 0x0B, 0x00
	.byte 0x0B, 0x00, 0x04, 0x00, 0x10, 0x00, 0x04, 0x00, 0x0E, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x0F, 0x00
	.byte 0x0B, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x10, 0x00, 0x02, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x08, 0x00, 0x08, 0x00, 0x10, 0x00, 0x0E, 0x00, 0x10, 0x00
	.byte 0x0E, 0x00, 0x0C, 0x00, 0x04, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0B, 0x00, 0x08, 0x00, 0x0D, 0x00
	.byte 0x0D, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x11, 0x00, 0x02, 0x00, 0x08, 0x00, 0x0E, 0x00, 0x10, 0x00
	.byte 0x04, 0x00, 0x01, 0x00, 0x08, 0x00, 0x04, 0x00, 0x04, 0x00, 0x03, 0x00, 0x11, 0x00, 0x11, 0x00
	.byte 0x0F, 0x00, 0x0D, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x05, 0x00, 0x0C, 0x00
	.byte 0x0C, 0x00, 0x0D, 0x00, 0x0D, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x02, 0x00, 0x06, 0x00
	.byte 0x02, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0F, 0x00, 0x0F, 0x00, 0x04, 0x00, 0x02, 0x00, 0x0F, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x01, 0x00, 0x05, 0x00, 0x08, 0x00, 0x07, 0x00
	.byte 0x07, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0E, 0x00, 0x0A, 0x00
	.byte 0x08, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223D4C0: ; 0x0223D4C0
	.byte 0x00, 0x0A, 0x0B, 0x0D, 0x0C, 0x0F, 0x01, 0x03, 0x04, 0x02, 0x0E, 0x06, 0x05, 0x07, 0x10, 0x11
	.byte 0x08, 0xFE, 0xFE, 0x09

ov80_0223D4D4: ; 0x0223D4D4
	.byte 0x00, 0x00

ov80_0223D4D6: ; 0x0223D4D6
	.byte 0x63, 0x00

ov80_0223D4D8: ; 0x0223D4D8
	.byte 0x64, 0x00

ov80_0223D4DA: ; 0x0223D4DA
	.byte 0x77, 0x00, 0x50, 0x00, 0x77, 0x00
	.byte 0x78, 0x00, 0x8B, 0x00, 0x64, 0x00, 0x8B, 0x00, 0x8C, 0x00, 0x9F, 0x00, 0x78, 0x00, 0x9F, 0x00
	.byte 0xA0, 0x00, 0xB3, 0x00, 0x8C, 0x00, 0xB3, 0x00, 0xB4, 0x00, 0xC7, 0x00, 0xA0, 0x00, 0xC7, 0x00
	.byte 0xC8, 0x00, 0xDB, 0x00, 0xB4, 0x00, 0xDB, 0x00, 0xDC, 0x00, 0xEF, 0x00, 0xC8, 0x00, 0x2B, 0x01
	.byte 0xC8, 0x00, 0x2B, 0x01

ov80_0223D514: ; 0x0223D514
	.byte 0x00, 0x00

ov80_0223D516: ; 0x0223D516
	.byte 0x63, 0x00

ov80_0223D518: ; 0x0223D518
	.byte 0x64, 0x00

ov80_0223D51A: ; 0x0223D51A
	.byte 0x77, 0x00, 0x50, 0x00, 0x77, 0x00
	.byte 0x78, 0x00, 0x8B, 0x00, 0x64, 0x00, 0x8B, 0x00, 0x8C, 0x00, 0x9F, 0x00, 0x78, 0x00, 0x9F, 0x00
	.byte 0xA0, 0x00, 0xB3, 0x00, 0x8C, 0x00, 0xB3, 0x00, 0xB4, 0x00, 0xC7, 0x00, 0xA0, 0x00, 0xC7, 0x00
	.byte 0xC8, 0x00, 0xDB, 0x00, 0xB4, 0x00, 0xDB, 0x00, 0xDC, 0x00, 0xEF, 0x00, 0xC8, 0x00, 0x2B, 0x01
	.byte 0xC8, 0x00, 0x2B, 0x01

ov80_0223D554: ; 0x0223D554
	.byte 0x00, 0x03, 0x00, 0x05, 0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00

ov80_0223D560: ; 0x0223D560
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov80_0223D570: ; 0x0223D570
	.byte 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x20, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov80_0223D584: ; 0x0223D584
	.byte 0x60, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00

ov80_0223D59C: ; 0x0223D59C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x0F, 0x00
	.byte 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223D5B8: ; 0x0223D5B8
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov80_0223D5D8: ; 0x0223D5D8
	.byte 0x06, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov80_0223D600: ; 0x0223D600
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x01, 0x08
	.byte 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x01, 0x05, 0x0C, 0x01, 0x03, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov80_0223D654: ; 0x0223D654
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov80_0223DA54: ; 0x0223DA54
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00
	.byte 0x23, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00
	.byte 0x3C, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x1A, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00
	.byte 0x1C, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov80_0223DB24: ; 0x0223DB24
	.byte 0x00, 0x00, 0x00, 0x00
	.word ov80_02239C80

ov80_0223DB2C: ; 0x0223DB2C
	.byte 0x14, 0x00, 0x15, 0x00

ov80_0223DB30: ; 0x0223DB30
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xDA, 0x07, 0x00, 0x00, 0xD2, 0x07, 0x00, 0x00, 0xD2, 0x07, 0x00, 0x00
	.byte 0xD2, 0x07, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov80_0223DB64: ; 0x0223DB64
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xDB, 0x07, 0x00, 0x00, 0xD3, 0x07, 0x00, 0x00
	.byte 0xD3, 0x07, 0x00, 0x00, 0xD3, 0x07, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov80_0223DB98: ; 0x0223DB98
	.byte 0xC3, 0x02, 0x00, 0x00, 0xBA, 0xB9, 0xBB, 0xBC
	.byte 0xCA, 0xC9, 0xCB, 0x00, 0xC5, 0x02, 0x00, 0x00, 0xAE, 0xAD, 0xAF, 0xB0, 0xC1, 0xC0, 0xC2, 0x00
	.byte 0xC5, 0x02, 0x00, 0x00, 0xAE, 0xAD, 0xAF, 0xB0, 0xC1, 0xC0, 0xC2, 0x00, 0xC7, 0x02, 0x00, 0x00
	.byte 0xAA, 0xA9, 0xAB, 0xAC, 0xBE, 0xBD, 0xBF, 0x00, 0xC4, 0x02, 0x00, 0x00, 0xB6, 0xB5, 0xB7, 0xB8
	.byte 0xC7, 0xC6, 0xC8, 0x00, 0xC6, 0x02, 0x00, 0x00, 0xB2, 0xB1, 0xB3, 0xB4, 0xC4, 0xC3, 0xC5, 0x00

ov80_0223DBE0: ; 0x0223DBE0
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x05, 0x04, 0x03, 0x02, 0x01, 0x00

ov80_0223DBEC: ; 0x0223DBEC
	.byte 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x05, 0x06, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x06, 0x05, 0x04
	.byte 0x03, 0x02, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.data

_0223DC20: ; 0x0223DC20
	.byte 0x00, 0x00

ov80_0223DC22: ; 0x0223DC22
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x01, 0x00, 0x02, 0x00, 0x02, 0x00, 0x02, 0x00, 0x03, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x06, 0x00, 0x01, 0x00, 0x06, 0x00, 0x02, 0x00, 0x06, 0x00, 0x03, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x07, 0x00, 0x02, 0x00, 0x07, 0x00, 0x03, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x01, 0x00, 0x0A, 0x00, 0x02, 0x00, 0x0A, 0x00, 0x03, 0x00
	.byte 0x0B, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x01, 0x00, 0x0B, 0x00, 0x02, 0x00, 0x0B, 0x00, 0x03, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x08, 0x00, 0x02, 0x00, 0x08, 0x00, 0x03, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x09, 0x00, 0x01, 0x00, 0x09, 0x00, 0x02, 0x00, 0x09, 0x00, 0x03, 0x00

ov80_0223DCA0: ; 0x0223DCA0
	.word ov80_0223BEA8
	.word ov80_0223BF32
	.word ov80_0223BED8
	.word ov80_0223BEEC
	.word ov80_0223BF18
	.word ov80_0223BF02

ov80_0223DCB8: ; 0x0223DCB8
	.word ov80_02234ECC
	.word ov80_02234F28
	.word ov80_02234FAC
	.word ov80_02235024
	.word ov80_0223509C
	.word ov80_02235118
	.word ov80_022351AC
	.word ov80_02235208
	.word ov80_02235264
	.word ov80_02234ECC
	.word ov80_02234F28
	.word ov80_02234FAC
	.word ov80_02235024
	.word ov80_0223509C
	.word ov80_02235118
	.word ov80_022351AC
	.word ov80_02235208
	.word ov80_02235264
	.word ov80_022352BC
	.word ov80_022352C8
	.word ov80_022352D0
	.word ov80_022352D8
	.word ov80_022352E0
	.word ov80_022352E8
	.word ov80_022352F4
	.word ov80_02235300
	.word ov80_0223530C
	.word ov80_02235314
	.word ov80_02235318
	.word ov80_0223531C
	.word ov80_02235320
	.word ov80_02235318

ov80_0223DD38: ; 0x0223DD38
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

	.bss

_0223DD40:
	.space 0x4

ov80_0223DD44: ; 0x0223DD44
	.space 0x4

ov80_0223DD48: ; 0x0223DD48
	.space 0x4

ov80_0223DD4C: ; 0x0223DD4C
	.space 0x4

ov80_0223DD50: ; 0x0223DD50
	.space 0x10
