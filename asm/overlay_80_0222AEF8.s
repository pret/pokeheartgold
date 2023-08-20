	.include "asm/macros.inc"
	.include "overlay_80_0222AEF8.inc"
	.include "global.inc"

    .text

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
	bl Save_PlayerData_GetProfileAddr
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
	bl SaveArray_Party_Get
	mov r1, #0x26
	lsl r1, r1, #4
	ldrb r1, [r5, r1]
	bl Party_GetMonByIndex
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
	bl Save_PlayerData_GetProfileAddr
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
	bl Party_GetMonByIndex
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
	bl Party_GetMonByIndex
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
	bl Party_AddMon
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
	bl BattleArcade_GetMonCount
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
	bl Party_GetMonByIndex
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
	bl BattleArcade_GetMonCount
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
	bl Party_AddMon
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
   