	.include "asm/macros.inc"
	.include "unk_02032844.inc"
	.include "global.inc"

	.data

_0210F8FC:
	.byte 0x44, 0x50, 0x00, 0x00

	.bss

_021D4124:
	.space 0x8

	.text

	thumb_func_start sub_02032844
sub_02032844: ; 0x02032844
	ldr r1, _02032850 ; =_021D4124
	ldr r2, [r1, #4]
	ldr r1, _02032854 ; =0x00001310
	str r0, [r2, r1]
	bx lr
	nop
_02032850: .word _021D4124
_02032854: .word 0x00001310
	thumb_func_end sub_02032844

	thumb_func_start sub_02032858
sub_02032858: ; 0x02032858
	ldr r1, _0203286C ; =_021D4124
	ldr r3, [r1, #4]
	ldr r1, _02032870 ; =0x00001310
	ldr r2, [r3, r1]
	sub r2, #9
	cmp r2, #1
	bls _0203286A
	add r1, #0x20
	str r0, [r3, r1]
_0203286A:
	bx lr
	.balign 4, 0
_0203286C: .word _021D4124
_02032870: .word 0x00001310
	thumb_func_end sub_02032858

	thumb_func_start sub_02032874
sub_02032874: ; 0x02032874
	push {r3, lr}
	mov r0, #3
	bl sub_02032844
	ldr r1, _0203289C ; =_021D4124
	ldr r0, _020328A0 ; =sub_020328A4
	ldr r1, [r1, #4]
	bl WM_SetParentParameter
	cmp r0, #2
	beq _02032898
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	mov r0, #0
	pop {r3, pc}
_02032898:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_0203289C: .word _021D4124
_020328A0: .word sub_020328A4
	thumb_func_end sub_02032874

	thumb_func_start sub_020328A4
sub_020328A4: ; 0x020328A4
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _020328B8
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r3, pc}
_020328B8:
	bl sub_020328C8
	cmp r0, #0
	bne _020328C6
	mov r0, #9
	bl sub_02032844
_020328C6:
	pop {r3, pc}
	thumb_func_end sub_020328A4

	thumb_func_start sub_020328C8
sub_020328C8: ; 0x020328C8
	push {r4, lr}
	ldr r0, _02032924 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032928 ; =0x00001310
	ldr r0, [r1, r0]
	sub r0, r0, #4
	cmp r0, #2
	bhi _020328DC
	mov r0, #1
	pop {r4, pc}
_020328DC:
	bl WMi_GetStatusAddress
	add r4, r0, #0
	mov r0, #0x66
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #4
	bl DC_InvalidateRange
	mov r0, #0x66
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r4, r0
	mov r1, #4
	bl DC_FlushRange
	ldr r0, _0203292C ; =sub_02032934
	bl WM_StartParent
	cmp r0, #2
	beq _02032910
	bl sub_02032858
	mov r0, #0
	pop {r4, pc}
_02032910:
	ldr r2, _02032924 ; =_021D4124
	ldr r1, _02032930 ; =0x0000132C
	ldr r0, [r2, #4]
	mov r3, #0
	strh r3, [r0, r1]
	ldr r2, [r2, #4]
	mov r0, #1
	add r1, r1, #2
	strh r0, [r2, r1]
	pop {r4, pc}
	.balign 4, 0
_02032924: .word _021D4124
_02032928: .word 0x00001310
_0203292C: .word sub_02032934
_02032930: .word 0x0000132C
	thumb_func_end sub_020328C8

	thumb_func_start sub_02032934
sub_02032934: ; 0x02032934
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r0, [r5, #0x10]
	mov r1, #1
	lsl r1, r0
	lsl r0, r1, #0x10
	lsr r4, r0, #0x10
	ldrh r0, [r5, #2]
	cmp r0, #0
	beq _02032954
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r4, r5, r6, pc}
_02032954:
	ldrh r0, [r5, #8]
	cmp r0, #7
	bgt _0203296C
	bge _02032986
	cmp r0, #2
	bgt _02032A24
	cmp r0, #0
	blt _02032A24
	beq _02032A16
	cmp r0, #2
	beq _02032978
	pop {r4, r5, r6, pc}
_0203296C:
	cmp r0, #9
	bgt _02032974
	beq _020329F8
	pop {r4, r5, r6, pc}
_02032974:
	cmp r0, #0x1a
	pop {r4, r5, r6, pc}
_02032978:
	ldr r0, _02032A28 ; =_021D4124
	ldr r2, [r0, #4]
	ldr r0, _02032A2C ; =0x00001345
	ldrb r1, [r2, r0]
	add r1, r1, #1
	strb r1, [r2, r0]
	pop {r4, r5, r6, pc}
_02032986:
	ldr r0, _02032A28 ; =_021D4124
	ldr r2, [r0, #4]
	ldr r0, _02032A30 ; =0x00001343
	ldrb r1, [r2, r0]
	cmp r1, #1
	beq _020329C4
	sub r0, r0, #1
	ldrb r0, [r2, r0]
	cmp r0, #1
	beq _020329C4
	bl sub_02033264
	ldr r1, _02032A28 ; =_021D4124
	ldr r2, [r1, #4]
	ldr r1, _02032A34 ; =0x00001334
	ldrb r1, [r2, r1]
	cmp r0, r1
	bge _020329C4
	bl sub_0203993C
	ldrb r1, [r5, #0x14]
	cmp r1, r0
	bne _020329C4
	add r1, r5, #0
	ldr r0, _02032A38 ; =_0210F8FC
	add r1, #0x15
	mov r2, #3
	bl memcmp
	cmp r0, #0
	beq _020329DC
_020329C4:
	ldrh r1, [r5, #0x10]
	mov r0, #0
	bl WM_Disconnect
	cmp r0, #2
	beq _02032A24
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r4, r5, r6, pc}
_020329DC:
	ldr r1, _02032A28 ; =_021D4124
	ldr r0, _02032A3C ; =0x0000132E
	ldr r3, [r1, #4]
	ldrh r2, [r3, r0]
	orr r2, r4
	strh r2, [r3, r0]
	ldr r1, [r1, #4]
	sub r0, r0, #6
	ldr r1, [r1, r0]
	cmp r1, #0
	beq _02032A24
	ldrh r0, [r5, #0x10]
	blx r1
	pop {r4, r5, r6, pc}
_020329F8:
	ldr r2, _02032A28 ; =_021D4124
	ldr r1, _02032A3C ; =0x0000132E
	ldr r0, [r2, #4]
	mvn r3, r4
	ldrh r6, [r0, r1]
	and r3, r6
	strh r3, [r0, r1]
	ldr r0, [r2, #4]
	sub r1, #0xa
	ldr r1, [r0, r1]
	cmp r1, #0
	beq _02032A24
	ldrh r0, [r5, #0x10]
	blx r1
	pop {r4, r5, r6, pc}
_02032A16:
	bl sub_02032A40
	cmp r0, #0
	bne _02032A24
	mov r0, #9
	bl sub_02032844
_02032A24:
	pop {r4, r5, r6, pc}
	nop
_02032A28: .word _021D4124
_02032A2C: .word 0x00001345
_02032A30: .word 0x00001343
_02032A34: .word 0x00001334
_02032A38: .word _0210F8FC
_02032A3C: .word 0x0000132E
	thumb_func_end sub_02032934

	thumb_func_start sub_02032A40
sub_02032A40: ; 0x02032A40
	push {r4, lr}
	sub sp, #8
	ldr r0, _02032A9C ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032AA0 ; =0x00001310
	ldr r0, [r1, r0]
	sub r0, r0, #4
	cmp r0, #2
	bhi _02032A58
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_02032A58:
	mov r0, #4
	bl sub_02032844
	ldr r0, _02032A9C ; =_021D4124
	ldr r2, _02032AA4 ; =0x00001304
	ldr r4, [r0, #4]
	ldr r3, _02032AA8 ; =0x00001020
	ldr r0, [r4, r2]
	add r2, r2, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	ldr r2, [r4, r2]
	add r1, r4, r3
	lsl r2, r2, #0x10
	sub r3, #0xe0
	ldr r0, _02032AAC ; =sub_02032AB0
	lsr r2, r2, #0x10
	add r3, r4, r3
	bl WM_StartMP
	cmp r0, #2
	beq _02032A94
	bl sub_02032858
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_02032A94:
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	nop
_02032A9C: .word _021D4124
_02032AA0: .word 0x00001310
_02032AA4: .word 0x00001304
_02032AA8: .word 0x00001020
_02032AAC: .word sub_02032AB0
	thumb_func_end sub_02032A40

	thumb_func_start sub_02032AB0
sub_02032AB0: ; 0x02032AB0
	push {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _02032AC6
	add r0, r1, #0
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r3, pc}
_02032AC6:
	ldrh r0, [r0, #4]
	sub r0, #0xa
	cmp r0, #3
	bhi _02032B00
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02032ADA: ; jump table
	.short _02032AE2 - _02032ADA - 2 ; case 0
	.short _02032B00 - _02032ADA - 2 ; case 1
	.short _02032B00 - _02032ADA - 2 ; case 2
	.short _02032B00 - _02032ADA - 2 ; case 3
_02032AE2:
	ldr r0, _02032B04 ; =_021D4124
	ldr r2, [r0, #4]
	ldr r0, _02032B08 ; =0x00001314
	ldr r1, [r2, r0]
	cmp r1, #2
	bne _02032AFA
	sub r0, r0, #4
	ldr r0, [r2, r0]
	cmp r0, #4
	beq _02032AFA
	cmp r0, #6
	beq _02032B00
_02032AFA:
	mov r0, #4
	bl sub_02032844
_02032B00:
	pop {r3, pc}
	nop
_02032B04: .word _021D4124
_02032B08: .word 0x00001314
	thumb_func_end sub_02032AB0

	thumb_func_start sub_02032B0C
sub_02032B0C: ; 0x02032B0C
	push {r3, lr}
	mov r0, #3
	bl sub_02032844
	ldr r0, _02032B2C ; =sub_02032B30
	bl WM_EndMP
	cmp r0, #2
	beq _02032B26
	bl sub_02032858
	mov r0, #0
	pop {r3, pc}
_02032B26:
	mov r0, #1
	pop {r3, pc}
	nop
_02032B2C: .word sub_02032B30
	thumb_func_end sub_02032B0C

	thumb_func_start sub_02032B30
sub_02032B30: ; 0x02032B30
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _02032B42
	bl sub_02032858
	bl sub_02033830
	pop {r3, pc}
_02032B42:
	bl sub_02032B50
	cmp r0, #0
	bne _02032B4E
	bl sub_02033830
_02032B4E:
	pop {r3, pc}
	thumb_func_end sub_02032B30

	thumb_func_start sub_02032B50
sub_02032B50: ; 0x02032B50
	push {r3, lr}
	ldr r0, _02032B68 ; =sub_02032B6C
	bl WM_EndParent
	cmp r0, #2
	beq _02032B64
	bl sub_02032858
	mov r0, #0
	pop {r3, pc}
_02032B64:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02032B68: .word sub_02032B6C
	thumb_func_end sub_02032B50

	thumb_func_start sub_02032B6C
sub_02032B6C: ; 0x02032B6C
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _02032B7A
	bl sub_02032858
	pop {r3, pc}
_02032B7A:
	mov r0, #1
	bl sub_02032844
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02032B6C

	thumb_func_start sub_02032B84
sub_02032B84: ; 0x02032B84
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	ldr r2, _02032C10 ; =_021D4124
	add r5, r0, #0
	add r4, r1, #0
	mov r3, #2
	ldr r0, [r2, #4]
	ldr r1, _02032C14 ; =0x00001308
	lsl r3, r3, #8
	str r3, [r0, r1]
	ldr r2, [r2, #4]
	mov r0, #0x40
	sub r1, r1, #4
	str r0, [r2, r1]
	mov r0, #2
	bl sub_02032844
	ldr r2, _02032C10 ; =_021D4124
	ldr r1, _02032C18 ; =0x00001256
	ldr r3, [r2, #4]
	mov r0, #1
	strh r0, [r3, r1]
	add r0, r1, #0
	ldrh r6, [r4, #4]
	ldr r3, [r2, #4]
	add r0, #0x96
	strh r6, [r3, r0]
	add r0, r1, #0
	ldrh r6, [r4, #2]
	ldr r3, [r2, #4]
	add r0, #0x94
	strh r6, [r3, r0]
	add r0, r1, #0
	ldrh r4, [r4]
	ldr r3, [r2, #4]
	add r0, #0x92
	strh r4, [r3, r0]
	add r0, r1, #0
	ldr r3, [r2, #4]
	add r0, #0xbe
	str r5, [r3, r0]
	add r3, r1, #0
	ldr r4, [r2, #4]
	mov r0, #0
	add r3, #0xaa
	str r0, [r4, r3]
	add r3, r1, #0
	ldr r4, [r2, #4]
	add r3, #0xb6
	strh r7, [r4, r3]
	add r3, r1, #0
	ldr r4, [r2, #4]
	add r3, #0x8e
	strh r0, [r4, r3]
	ldr r2, [r2, #4]
	add r1, #0xb8
	mov r0, #1
	strh r0, [r2, r1]
	bl sub_02032C84
	cmp r0, #0
	bne _02032C0A
	mov r0, #9
	bl sub_02032844
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02032C0A:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02032C10: .word _021D4124
_02032C14: .word 0x00001308
_02032C18: .word 0x00001256
	thumb_func_end sub_02032B84

	thumb_func_start sub_02032C1C
sub_02032C1C: ; 0x02032C1C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #2
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02032844
	ldr r1, _02032C80 ; =_021D4124
	mov r0, #0x13
	ldr r2, [r1, #4]
	lsl r0, r0, #8
	str r5, [r2, r0]
	add r2, r0, #0
	ldr r3, [r1, #4]
	add r2, #0xc
	strh r6, [r3, r2]
	add r3, r0, #0
	ldr r5, [r1, #4]
	mov r2, #0
	sub r3, #0x1c
	strh r2, [r5, r3]
	add r3, r0, #0
	ldr r5, [r1, #4]
	add r3, #0xe
	strh r2, [r5, r3]
	add r2, r0, #0
	ldrh r5, [r4, #4]
	ldr r3, [r1, #4]
	sub r2, #0x14
	strh r5, [r3, r2]
	add r2, r0, #0
	ldrh r5, [r4, #2]
	ldr r3, [r1, #4]
	sub r2, #0x16
	strh r5, [r3, r2]
	ldrh r2, [r4]
	ldr r1, [r1, #4]
	sub r0, #0x18
	strh r2, [r1, r0]
	bl sub_02032C84
	cmp r0, #0
	bne _02032C7C
	mov r0, #9
	bl sub_02032844
	mov r0, #0
	pop {r4, r5, r6, pc}
_02032C7C:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02032C80: .word _021D4124
	thumb_func_end sub_02032C1C

	thumb_func_start sub_02032C84
sub_02032C84: ; 0x02032C84
	push {r3, r4, r5, r6, r7, lr}
	bl WM_GetAllowedChannel
	add r5, r0, #0
	mov r0, #2
	lsl r0, r0, #0xe
	cmp r5, r0
	bne _02032CA4
	mov r0, #3
	bl sub_02032858
	mov r0, #1
	bl sub_02039AD8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02032CA4:
	cmp r5, #0
	bne _02032CB8
	mov r0, #0x16
	bl sub_02032858
	mov r0, #1
	bl sub_02039AD8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02032CB8:
	ldr r1, _02032D38 ; =_021D4124
	ldr r0, _02032D3C ; =0x0000130C
	ldr r3, [r1, #4]
	ldrh r2, [r3, r0]
	cmp r2, #0
	bne _02032CF8
	add r7, r0, #0
	mov r3, #1
	add r2, r3, #0
	sub r7, #0x28
	sub r0, #0x28
_02032CCE:
	ldr r4, [r1, #4]
	ldr r6, _02032D40 ; =0x000012E4
	ldrh r6, [r4, r6]
	add r6, r6, #1
	strh r6, [r4, r7]
	ldr r4, [r1, #4]
	ldrh r6, [r4, r0]
	cmp r6, #0x10
	bls _02032CE4
	ldr r6, _02032D40 ; =0x000012E4
	strh r3, [r4, r6]
_02032CE4:
	ldr r6, [r1, #4]
	ldr r4, _02032D40 ; =0x000012E4
	ldrh r4, [r6, r4]
	add r6, r2, #0
	sub r4, r4, #1
	lsl r6, r4
	add r4, r5, #0
	tst r4, r6
	bne _02032CFC
	b _02032CCE
_02032CF8:
	sub r0, #0x28
	strh r2, [r3, r0]
_02032CFC:
	bl WM_GetDispersionScanPeriod
	mov r1, #3
	bl _s32_div_f
	ldr r2, _02032D38 ; =_021D4124
	ldr r1, _02032D44 ; =0x000012E6
	ldr r3, [r2, #4]
	strh r0, [r3, r1]
	add r0, r1, #0
	ldr r3, [r2, #4]
	sub r0, #0xc6
	add r4, r3, r0
	sub r0, r1, #6
	str r4, [r3, r0]
	ldr r2, [r2, #4]
	sub r1, r1, #6
	ldr r0, _02032D48 ; =sub_02032D4C
	add r1, r2, r1
	bl WM_StartScan
	cmp r0, #2
	beq _02032D32
	bl sub_02032858
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02032D32:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02032D38: .word _021D4124
_02032D3C: .word 0x0000130C
_02032D40: .word 0x000012E4
_02032D44: .word 0x000012E6
_02032D48: .word sub_02032D4C
	thumb_func_end sub_02032C84

	thumb_func_start sub_02032D4C
sub_02032D4C: ; 0x02032D4C
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02032D62
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032D62:
	ldr r0, _02032E14 ; =_021D4124
	ldr r2, [r0, #4]
	ldr r0, _02032E18 ; =0x00001310
	ldr r1, [r2, r0]
	cmp r1, #2
	beq _02032D84
	mov r1, #0
	sub r0, r0, #2
	strh r1, [r2, r0]
	bl sub_02032E48
	cmp r0, #0
	bne _02032E10
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032D84:
	ldrh r1, [r4, #8]
	cmp r1, #3
	beq _02032E10
	cmp r1, #4
	beq _02032E02
	cmp r1, #5
	bne _02032E02
	sub r0, #0xf0
	add r0, r2, r0
	mov r1, #0xc0
	bl DC_InvalidateRange
	ldr r0, _02032E14 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032E1C ; =0x00001320
	ldr r2, [r1, r0]
	cmp r2, #0
	beq _02032DB8
	ldrh r0, [r4, #0x36]
	cmp r0, #8
	blo _02032DB8
	add r1, r4, #0
	add r1, #0x48
	ldrb r1, [r1, #4]
	ldr r0, [r4, #0x3c]
	blx r2
_02032DB8:
	ldrh r0, [r4, #0x36]
	cmp r0, #8
	blo _02032E02
	ldr r0, _02032E14 ; =_021D4124
	ldr r2, [r4, #0x3c]
	ldr r0, [r0, #4]
	ldr r1, [r0, #8]
	cmp r2, r1
	bne _02032E02
	add r4, #0x43
	ldrb r2, [r4]
	mov r1, #3
	and r1, r2
	cmp r1, #1
	bne _02032E02
	mov r1, #0x13
	lsl r1, r1, #8
	ldr r2, [r0, r1]
	cmp r2, #0
	beq _02032DE6
	sub r1, #0xe0
	add r0, r0, r1
	blx r2
_02032DE6:
	ldr r0, _02032E14 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032E20 ; =0x0000130E
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02032E02
	bl sub_02032E48
	cmp r0, #0
	bne _02032E10
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032E02:
	bl sub_02032C84
	cmp r0, #0
	bne _02032E10
	mov r0, #9
	bl sub_02032844
_02032E10:
	pop {r4, pc}
	nop
_02032E14: .word _021D4124
_02032E18: .word 0x00001310
_02032E1C: .word 0x00001320
_02032E20: .word 0x0000130E
	thumb_func_end sub_02032D4C

	thumb_func_start sub_02032E24
sub_02032E24: ; 0x02032E24
	push {r3, lr}
	ldr r0, _02032E40 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032E44 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #2
	beq _02032E36
	mov r0, #0
	pop {r3, pc}
_02032E36:
	mov r0, #3
	bl sub_02032844
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02032E40: .word _021D4124
_02032E44: .word 0x00001310
	thumb_func_end sub_02032E24

	thumb_func_start sub_02032E48
sub_02032E48: ; 0x02032E48
	push {r3, lr}
	ldr r0, _02032E60 ; =sub_02032E64
	bl WM_EndScan
	cmp r0, #2
	beq _02032E5C
	bl sub_02032858
	mov r0, #0
	pop {r3, pc}
_02032E5C:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02032E60: .word sub_02032E64
	thumb_func_end sub_02032E48

	thumb_func_start sub_02032E64
sub_02032E64: ; 0x02032E64
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _02032E72
	bl sub_02032858
	pop {r3, pc}
_02032E72:
	mov r0, #1
	bl sub_02032844
	ldr r0, _02032E94 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032E98 ; =0x0000130E
	ldrh r0, [r1, r0]
	cmp r0, #0
	beq _02032E92
	bl sub_02032E9C
	cmp r0, #0
	bne _02032E92
	mov r0, #9
	bl sub_02032844
_02032E92:
	pop {r3, pc}
	.balign 4, 0
_02032E94: .word _021D4124
_02032E98: .word 0x0000130E
	thumb_func_end sub_02032E64

	thumb_func_start sub_02032E9C
sub_02032E9C: ; 0x02032E9C
	push {lr}
	sub sp, #0x24
	ldr r0, _02032EF8 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032EFC ; =0x00001310
	ldr r0, [r1, r0]
	sub r0, r0, #4
	cmp r0, #2
	bhi _02032EB4
	add sp, #0x24
	mov r0, #1
	pop {pc}
_02032EB4:
	mov r0, #3
	bl sub_02032844
	add r1, sp, #4
	ldr r0, _02032F00 ; =_0210F8FC
	add r1, #1
	mov r2, #3
	bl MI_CpuCopy8
	bl sub_0203993C
	add r1, sp, #4
	strb r0, [r1]
	mov r0, #0
	str r0, [sp]
	ldr r1, _02032EF8 ; =_021D4124
	ldr r0, _02032F04 ; =sub_02032F0C
	ldr r2, [r1, #4]
	ldr r1, _02032F08 ; =0x00001220
	mov r3, #1
	add r1, r2, r1
	add r2, sp, #4
	bl WM_StartConnectEx
	cmp r0, #2
	beq _02032EF2
	bl sub_02032858
	add sp, #0x24
	mov r0, #0
	pop {pc}
_02032EF2:
	mov r0, #1
	add sp, #0x24
	pop {pc}
	.balign 4, 0
_02032EF8: .word _021D4124
_02032EFC: .word 0x00001310
_02032F00: .word _0210F8FC
_02032F04: .word sub_02032F0C
_02032F08: .word 0x00001220
	thumb_func_end sub_02032E9C

	thumb_func_start sub_02032F0C
sub_02032F0C: ; 0x02032F0C
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02032F58
	bl sub_02032858
	ldrh r0, [r4, #2]
	cmp r0, #0xc
	bne _02032F28
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032F28:
	cmp r0, #0xb
	bne _02032F34
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032F34:
	cmp r0, #1
	bne _02032F50
	bl sub_02039918
	cmp r0, #0
	beq _02032F48
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032F48:
	mov r0, #8
	bl sub_02032844
	pop {r4, pc}
_02032F50:
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032F58:
	ldrh r0, [r4, #8]
	cmp r0, #8
	beq _02032FBE
	cmp r0, #7
	bne _02032F9E
	ldr r0, _02032FC0 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02032FC4 ; =0x00001335
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _02032F7C
	mov r0, #0x14
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032F7C:
	mov r0, #4
	bl sub_02032844
	bl sub_02032FCC
	cmp r0, #0
	bne _02032F92
	mov r0, #3
	bl sub_02032844
	pop {r4, pc}
_02032F92:
	ldr r0, _02032FC0 ; =_021D4124
	ldrh r2, [r4, #0xa]
	ldr r1, [r0, #4]
	ldr r0, _02032FC8 ; =0x0000132C
	strh r2, [r1, r0]
	pop {r4, pc}
_02032F9E:
	cmp r0, #6
	beq _02032FBE
	cmp r0, #9
	bne _02032FB4
	mov r0, #0x14
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r4, pc}
_02032FB4:
	cmp r0, #0x1a
	beq _02032FBE
	mov r0, #9
	bl sub_02032844
_02032FBE:
	pop {r4, pc}
	.balign 4, 0
_02032FC0: .word _021D4124
_02032FC4: .word 0x00001335
_02032FC8: .word 0x0000132C
	thumb_func_end sub_02032F0C

	thumb_func_start sub_02032FCC
sub_02032FCC: ; 0x02032FCC
	push {r4, lr}
	sub sp, #8
	ldr r0, _0203300C ; =_021D4124
	ldr r2, _02033010 ; =0x00001304
	ldr r4, [r0, #4]
	ldr r3, _02033014 ; =0x00001020
	ldr r0, [r4, r2]
	add r1, r4, r3
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r2, r2, #4
	ldr r2, [r4, r2]
	sub r3, #0xe0
	lsl r2, r2, #0x10
	ldr r0, _02033018 ; =sub_0203301C
	lsr r2, r2, #0x10
	add r3, r4, r3
	bl WM_StartMP
	cmp r0, #2
	beq _02033006
	bl sub_02032858
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_02033006:
	mov r0, #1
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_0203300C: .word _021D4124
_02033010: .word 0x00001304
_02033014: .word 0x00001020
_02033018: .word sub_0203301C
	thumb_func_end sub_02032FCC

	thumb_func_start sub_0203301C
sub_0203301C: ; 0x0203301C
	push {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _0203303E
	cmp r1, #0xf
	beq _02033074
	cmp r1, #9
	beq _02033074
	cmp r1, #0xd
	beq _02033074
	add r0, r1, #0
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	pop {r3, pc}
_0203303E:
	ldrh r0, [r0, #4]
	sub r0, #0xa
	cmp r0, #3
	bhi _02033074
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02033052: ; jump table
	.short _0203305A - _02033052 - 2 ; case 0
	.short _02033074 - _02033052 - 2 ; case 1
	.short _02033074 - _02033052 - 2 ; case 2
	.short _02033074 - _02033052 - 2 ; case 3
_0203305A:
	ldr r0, _02033078 ; =_021D4124
	ldr r2, [r0, #4]
	ldr r0, _0203307C ; =0x00001314
	ldr r1, [r2, r0]
	cmp r1, #3
	bne _0203306E
	sub r0, r0, #4
	ldr r0, [r2, r0]
	cmp r0, #6
	beq _02033074
_0203306E:
	mov r0, #4
	bl sub_02032844
_02033074:
	pop {r3, pc}
	nop
_02033078: .word _021D4124
_0203307C: .word 0x00001314
	thumb_func_end sub_0203301C

	thumb_func_start sub_02033080
sub_02033080: ; 0x02033080
	push {r3, lr}
	mov r0, #3
	bl sub_02032844
	ldr r0, _020330A0 ; =sub_020330A4
	bl WM_EndMP
	cmp r0, #2
	beq _0203309A
	bl sub_02032858
	mov r0, #0
	pop {r3, pc}
_0203309A:
	mov r0, #1
	pop {r3, pc}
	nop
_020330A0: .word sub_020330A4
	thumb_func_end sub_02033080

	thumb_func_start sub_020330A4
sub_020330A4: ; 0x020330A4
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _020330B6
	bl sub_02032858
	bl sub_02033858
	pop {r3, pc}
_020330B6:
	bl sub_020330C8
	cmp r0, #0
	bne _020330C4
	mov r0, #9
	bl sub_02032844
_020330C4:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020330A4

	thumb_func_start sub_020330C8
sub_020330C8: ; 0x020330C8
	push {r3, lr}
	mov r0, #3
	bl sub_02032844
	ldr r0, _020330EC ; =sub_020330F0
	mov r1, #0
	bl WM_Disconnect
	cmp r0, #2
	beq _020330E8
	bl sub_02032858
	bl sub_02033830
	mov r0, #0
	pop {r3, pc}
_020330E8:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_020330EC: .word sub_020330F0
	thumb_func_end sub_020330C8

	thumb_func_start sub_020330F0
sub_020330F0: ; 0x020330F0
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _020330FE
	bl sub_02032858
	pop {r3, pc}
_020330FE:
	mov r0, #1
	bl sub_02032844
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020330F0

	thumb_func_start sub_02033108
sub_02033108: ; 0x02033108
	push {r3, lr}
	mov r0, #3
	bl sub_02032844
	ldr r0, _02033128 ; =sub_0203312C
	bl WM_Reset
	cmp r0, #2
	beq _02033122
	bl sub_02032858
	mov r0, #0
	pop {r3, pc}
_02033122:
	mov r0, #1
	pop {r3, pc}
	nop
_02033128: .word sub_0203312C
	thumb_func_end sub_02033108

	thumb_func_start sub_0203312C
sub_0203312C: ; 0x0203312C
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #2]
	cmp r0, #0
	beq _02033144
	mov r0, #9
	bl sub_02032844
	ldrh r0, [r4, #2]
	bl sub_02032858
	pop {r4, pc}
_02033144:
	mov r0, #1
	bl sub_02032844
	pop {r4, pc}
	thumb_func_end sub_0203312C

	thumb_func_start sub_0203314C
sub_0203314C: ; 0x0203314C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, _02033194 ; =_021D4124
	add r6, r1, #0
	add r4, r2, #0
	ldr r1, [r0, #4]
	mov r0, #0x3d
	lsl r0, r0, #6
	ldr r2, _02033198 ; =0x00001304
	add r0, r1, r0
	ldr r1, [r1, r2]
	add r7, r3, #0
	bl DC_FlushRange
	ldr r0, _0203319C ; =0x0000FFFF
	add r1, r7, #0
	str r0, [sp]
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, _020331A0 ; =sub_020331A4
	add r2, r5, #0
	add r3, r6, #0
	bl WM_SetMPDataToPortEx
	cmp r0, #2
	bne _0203318E
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0203318E:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02033194: .word _021D4124
_02033198: .word 0x00001304
_0203319C: .word 0x0000FFFF
_020331A0: .word sub_020331A4
	thumb_func_end sub_0203314C

	thumb_func_start sub_020331A4
sub_020331A4: ; 0x020331A4
	push {r3, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _020331B8
	cmp r1, #0xf
	beq _020331B8
	add r0, r1, #0
	bl sub_02032858
	pop {r3, pc}
_020331B8:
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _020331CA
	cmp r1, #0
	bne _020331C6
	mov r0, #1
	b _020331C8
_020331C6:
	mov r0, #0
_020331C8:
	blx r2
_020331CA:
	pop {r3, pc}
	thumb_func_end sub_020331A4

	thumb_func_start sub_020331CC
sub_020331CC: ; 0x020331CC
	push {r3, lr}
	add r2, r0, #0
	ldrh r0, [r2, #2]
	cmp r0, #0
	beq _020331DC
	bl sub_02032858
	pop {r3, pc}
_020331DC:
	ldr r0, _0203320C ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033210 ; =0x00001318
	ldr r3, [r1, r0]
	cmp r3, #0
	beq _02033208
	ldrh r0, [r2, #4]
	cmp r0, #0x19
	beq _02033208
	cmp r0, #0x15
	bne _020331FC
	ldrh r0, [r2, #0x12]
	ldr r1, [r2, #0xc]
	ldrh r2, [r2, #0x10]
	blx r3
	pop {r3, pc}
_020331FC:
	cmp r0, #9
	bne _02033208
	ldrh r0, [r2, #0x12]
	mov r1, #0
	add r2, r1, #0
	blx r3
_02033208:
	pop {r3, pc}
	nop
_0203320C: .word _021D4124
_02033210: .word 0x00001318
	thumb_func_end sub_020331CC

	thumb_func_start sub_02033214
sub_02033214: ; 0x02033214
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _02033224
	mov r0, #0xa
	bl sub_02032844
	pop {r3, pc}
_02033224:
	mov r0, #0
	add r1, r0, #0
	bl WVR_TerminateAsync
	mov r0, #0
	bl sub_02032844
	pop {r3, pc}
	thumb_func_end sub_02033214

	thumb_func_start sub_02033234
sub_02033234: ; 0x02033234
	ldr r1, _0203323C ; =_021D4124
	ldr r1, [r1, #4]
	str r0, [r1, #8]
	bx lr
	.balign 4, 0
_0203323C: .word _021D4124
	thumb_func_end sub_02033234

	thumb_func_start sub_02033240
sub_02033240: ; 0x02033240
	ldr r2, _0203324C ; =_021D4124
	ldr r3, [r2, #4]
	str r0, [r3]
	ldr r0, [r2, #4]
	strh r1, [r0, #4]
	bx lr
	.balign 4, 0
_0203324C: .word _021D4124
	thumb_func_end sub_02033240

	thumb_func_start sub_02033250
sub_02033250: ; 0x02033250
	ldr r0, _0203325C ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033260 ; =0x0000132E
	ldrh r0, [r1, r0]
	bx lr
	nop
_0203325C: .word _021D4124
_02033260: .word 0x0000132E
	thumb_func_end sub_02033250

	thumb_func_start sub_02033264
sub_02033264: ; 0x02033264
	push {r3, r4}
	ldr r0, _02033290 ; =_021D4124
	mov r2, #0
	ldr r1, [r0, #4]
	ldr r0, _02033294 ; =0x0000132E
	add r3, r2, #0
	ldrh r4, [r1, r0]
	mov r1, #1
_02033274:
	add r0, r4, #0
	tst r0, r1
	beq _0203327C
	add r2, r2, #1
_0203327C:
	lsl r0, r4, #0xf
	add r3, r3, #1
	lsr r4, r0, #0x10
	cmp r3, #0x10
	blt _02033274
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
	nop
_02033290: .word _021D4124
_02033294: .word 0x0000132E
	thumb_func_end sub_02033264

	thumb_func_start sub_02033298
sub_02033298: ; 0x02033298
	ldr r0, _020332A4 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _020332A8 ; =0x00001310
	ldr r0, [r1, r0]
	bx lr
	nop
_020332A4: .word _021D4124
_020332A8: .word 0x00001310
	thumb_func_end sub_02033298

	thumb_func_start sub_020332AC
sub_020332AC: ; 0x020332AC
	ldr r0, _020332B8 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _020332BC ; =0x00001330
	ldr r0, [r1, r0]
	bx lr
	nop
_020332B8: .word _021D4124
_020332BC: .word 0x00001330
	thumb_func_end sub_020332AC

	thumb_func_start sub_020332C0
sub_020332C0: ; 0x020332C0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r0, sp, #0
	bl OS_GetMacAddress
	ldr r0, _02033348 ; =0x027FFC3C
	ldr r3, [r0]
	add r0, sp, #0
	ldrh r2, [r0, #4]
	ldrh r1, [r0, #2]
	ldrh r0, [r0]
	add r0, r0, r3
	add r0, r1, r0
	add r1, r2, r0
	ldr r3, _0203334C ; =_021D4124
	ldr r2, _02033350 ; =0x00001338
	ldr r0, [r3, #4]
	str r1, [r0, r2]
	ldr r0, [r3, #4]
	ldr r1, _02033354 ; =0x00010DCD
	ldr r4, [r0, r2]
	add r5, r4, #0
	mul r5, r1
	ldr r1, _02033358 ; =0x00003039
	mov r4, #0
	add r1, r5, r1
	str r1, [r0, r2]
	ldr r1, [r3, #4]
	add r0, r2, #4
	strh r4, [r1, r0]
	ldr r1, [r3, #4]
	mov r4, #0x65
	add r0, r2, #6
	strh r4, [r1, r0]
	mov r0, #3
	bl sub_02032844
	mov r0, #1
	bl sub_0203335C
	cmp r0, #0x18
	bne _0203332C
	mov r0, #0x18
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	mov r0, #1
	bl sub_02039AD8
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_0203332C:
	cmp r0, #2
	beq _02033340
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02033340:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02033348: .word 0x027FFC3C
_0203334C: .word _021D4124
_02033350: .word 0x00001338
_02033354: .word 0x00010DCD
_02033358: .word 0x00003039
	thumb_func_end sub_020332C0

	thumb_func_start sub_0203335C
sub_0203335C: ; 0x0203335C
	push {r4, lr}
	add r4, r0, #0
	bl WM_GetAllowedChannel
	mov r1, #2
	lsl r1, r1, #0xe
	cmp r0, r1
	bne _02033382
	mov r0, #3
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	mov r0, #1
	bl sub_02039AD8
	mov r0, #3
	pop {r4, pc}
_02033382:
	cmp r0, #0
	bne _0203339C
	mov r0, #0x16
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	mov r0, #1
	bl sub_02039AD8
	mov r0, #0x18
	pop {r4, pc}
_0203339C:
	mov r2, #1
	sub r1, r4, #1
	lsl r2, r1
	add r1, r2, #0
	tst r1, r0
	bne _020333C4
	mov r2, #1
_020333AA:
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #0x10
	bls _020333B8
	mov r0, #0x18
	pop {r4, pc}
_020333B8:
	sub r1, r4, #1
	add r3, r2, #0
	lsl r3, r1
	add r1, r3, #0
	tst r1, r0
	beq _020333AA
_020333C4:
	ldr r0, _020333D4 ; =sub_020333D8
	add r1, r4, #0
	bl sub_02033454
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, pc}
	nop
_020333D4: .word sub_020333D8
	thumb_func_end sub_0203335C

	thumb_func_start sub_020333D8
sub_020333D8: ; 0x020333D8
	push {r3, r4, r5, lr}
	ldrh r1, [r0, #2]
	cmp r1, #0
	beq _020333F4
	add r0, r1, #0
	bl sub_02032858
	mov r0, #9
	bl sub_02032844
	mov r0, #1
	bl sub_02039AD8
	pop {r3, r4, r5, pc}
_020333F4:
	ldr r2, _0203344C ; =_021D4124
	ldrh r1, [r0, #8]
	ldrh r5, [r0, #0xa]
	ldr r0, [r2, #4]
	ldr r3, _02033450 ; =0x0000133E
	ldrh r4, [r0, r3]
	cmp r4, r5
	bls _02033414
	strh r5, [r0, r3]
	mov r4, #1
	sub r0, r1, #1
	lsl r4, r0
	ldr r2, [r2, #4]
	add r0, r3, #2
	strh r4, [r2, r0]
	b _02033428
_02033414:
	cmp r4, r5
	bne _02033428
	add r2, r3, #2
	ldrh r5, [r0, r2]
	mov r4, #1
	sub r2, r1, #1
	lsl r4, r2
	orr r4, r5
	add r2, r3, #2
	strh r4, [r0, r2]
_02033428:
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0203335C
	cmp r0, #0x18
	bne _0203343E
	mov r0, #7
	bl sub_02032844
	pop {r3, r4, r5, pc}
_0203343E:
	cmp r0, #2
	beq _02033448
	mov r0, #9
	bl sub_02032844
_02033448:
	pop {r3, r4, r5, pc}
	nop
_0203344C: .word _021D4124
_02033450: .word 0x0000133E
	thumb_func_end sub_020333D8

	thumb_func_start sub_02033454
sub_02033454: ; 0x02033454
	push {r3, lr}
	add r3, r1, #0
	mov r1, #0x1e
	str r1, [sp]
	mov r1, #3
	mov r2, #0x11
	bl WM_MeasureChannel
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02033454

	thumb_func_start sub_02033468
sub_02033468: ; 0x02033468
	push {r3, lr}
	mov r0, #1
	bl sub_02032844
	ldr r0, _0203348C ; =_021D4124
	ldr r1, [r0, #4]
	mov r0, #0x4d
	lsl r0, r0, #6
	ldrh r0, [r1, r0]
	bl sub_02033494
	ldr r2, _0203348C ; =_021D4124
	ldr r1, _02033490 ; =0x0000133C
	ldr r3, [r2, #4]
	strh r0, [r3, r1]
	ldr r0, [r2, #4]
	ldrh r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0203348C: .word _021D4124
_02033490: .word 0x0000133C
	thumb_func_end sub_02033468

	thumb_func_start sub_02033494
sub_02033494: ; 0x02033494
	push {r4, r5, r6, r7}
	add r4, r0, #0
	mov r0, #0
	add r3, r0, #0
	add r2, r0, #0
	mov r1, #1
_020334A0:
	add r5, r1, #0
	lsl r5, r2
	tst r5, r4
	beq _020334B4
	add r0, r2, #1
	add r3, r3, #1
	lsl r0, r0, #0x10
	lsl r3, r3, #0x10
	asr r0, r0, #0x10
	lsr r3, r3, #0x10
_020334B4:
	add r2, r2, #1
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	cmp r2, #0x10
	blt _020334A0
	cmp r3, #1
	bls _02033512
	ldr r5, _02033518 ; =_021D4124
	ldr r2, _0203351C ; =0x00001338
	ldr r0, [r5, #4]
	ldr r1, _02033520 ; =0x00010DCD
	ldr r6, [r0, r2]
	add r7, r6, #0
	mul r7, r1
	ldr r1, _02033524 ; =0x00003039
	add r1, r7, r1
	str r1, [r0, r2]
	ldr r0, [r5, #4]
	mov r1, #1
	ldr r0, [r0, r2]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mul r0, r3
	lsl r0, r0, #8
	lsr r2, r0, #0x10
	mov r3, #0
_020334E8:
	add r0, r4, #0
	tst r0, r1
	beq _02033502
	cmp r2, #0
	bne _020334FC
	add r0, r3, #1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	pop {r4, r5, r6, r7}
	bx lr
_020334FC:
	sub r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
_02033502:
	lsl r0, r4, #0xf
	lsr r4, r0, #0x10
	add r0, r3, #1
	lsl r0, r0, #0x10
	asr r3, r0, #0x10
	cmp r3, #0x10
	blt _020334E8
	mov r0, #0
_02033512:
	pop {r4, r5, r6, r7}
	bx lr
	nop
_02033518: .word _021D4124
_0203351C: .word 0x00001338
_02033520: .word 0x00010DCD
_02033524: .word 0x00003039
	thumb_func_end sub_02033494

	thumb_func_start sub_02033528
sub_02033528: ; 0x02033528
	push {r4, r5, r6, lr}
	lsl r2, r0, #0x1b
	lsr r3, r2, #0x1b
	beq _02033536
	mov r2, #0x20
	sub r2, r2, r3
	add r0, r0, r2
_02033536:
	ldr r3, _020335AC ; =_021D4124
	ldr r2, _020335B0 ; =0x00001308
	str r0, [r3, #4]
	mov r4, #0
	str r4, [r0, r2]
	ldr r5, [r3, #4]
	sub r0, r2, #4
	str r4, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x10
	str r4, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x24
	strh r4, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	mov r6, #1
	add r0, #0x26
	strh r6, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x28
	str r4, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #8
	str r4, [r5, r0]
	ldr r0, [r3, #4]
	mov r6, #8
	str r4, [r0]
	ldr r0, [r3, #4]
	strh r4, [r0, #4]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x14
	str r4, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x2c
	strb r6, [r5, r0]
	add r0, r2, #0
	ldr r5, [r3, #4]
	add r0, #0x2d
	strb r4, [r5, r0]
	ldr r0, [r3, #4]
	add r2, #0x3a
	strb r4, [r0, r2]
	add r0, r1, #0
	bl sub_020335D4
	cmp r0, #0
	bne _020335A6
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_020335A6:
	mov r0, #1
	pop {r4, r5, r6, pc}
	nop
_020335AC: .word _021D4124
_020335B0: .word 0x00001308
	thumb_func_end sub_02033528

	thumb_func_start sub_020335B4
sub_020335B4: ; 0x020335B4
	mov r0, #0x4e
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end sub_020335B4

	thumb_func_start sub_020335BC
sub_020335BC: ; 0x020335BC
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #8
	bne _020335D0
	mov r0, #9
	bl sub_02032844
	mov r0, #0x19
	bl sub_02032858
_020335D0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020335BC

	thumb_func_start sub_020335D4
sub_020335D4: ; 0x020335D4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #3
	bl sub_02032844
	cmp r4, #1
	bne _020335F2
	ldr r0, _02033618 ; =_021D4124
	ldr r1, _0203361C ; =sub_02033620
	ldr r0, [r0, #4]
	mov r2, #2
	add r0, #0x40
	bl WM_Initialize
	b _02033602
_020335F2:
	ldr r0, _02033618 ; =_021D4124
	ldr r1, _0203361C ; =sub_02033620
	ldr r0, [r0, #4]
	mov r2, #2
	add r0, #0x40
	mov r3, #0
	bl WM_InitializeForListening
_02033602:
	cmp r0, #2
	beq _02033614
	bl sub_02032858
	mov r0, #0xa
	bl sub_02032844
	mov r0, #0
	pop {r4, pc}
_02033614:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_02033618: .word _021D4124
_0203361C: .word sub_02033620
	thumb_func_end sub_020335D4

	thumb_func_start sub_02033620
sub_02033620: ; 0x02033620
	push {r3, lr}
	ldrh r0, [r0, #2]
	cmp r0, #0
	beq _0203363A
	bl sub_02032858
	mov r0, #0xa
	bl sub_02032844
	mov r0, #5
	bl sub_02039AD8
	pop {r3, pc}
_0203363A:
	ldr r0, _02033660 ; =sub_020335BC
	bl WM_SetIndCallback
	cmp r0, #0
	beq _02033656
	bl sub_02032858
	mov r0, #0xa
	bl sub_02032844
	mov r0, #5
	bl sub_02039AD8
	pop {r3, pc}
_02033656:
	mov r0, #1
	bl sub_02032844
	pop {r3, pc}
	nop
_02033660: .word sub_020335BC
	thumb_func_end sub_02033620

	thumb_func_start sub_02033664
sub_02033664: ; 0x02033664
	bx lr
	.balign 4, 0
	thumb_func_end sub_02033664

	thumb_func_start sub_02033668
sub_02033668: ; 0x02033668
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	bl sub_0203993C
	bl sub_020340C4
	cmp r0, #0
	beq _0203368C
	ldr r0, _0203372C ; =sub_02033664
	mov r2, #0x64
	ldr r1, _02033730 ; =0x0000FFFF
	mov r3, #5
	str r2, [sp]
	bl WM_SetLifeTime
_0203368C:
	ldr r1, _02033734 ; =_021D4124
	mov r0, #7
	ldr r2, [r1, #4]
	ldr r1, _02033738 ; =0x00001308
	lsl r0, r0, #6
	str r0, [r2, r1]
	ldr r0, _02033734 ; =_021D4124
	mov r3, #0xe0
	ldr r2, [r0, #4]
	sub r0, r1, #4
	str r3, [r2, r0]
	ldr r0, _02033734 ; =_021D4124
	add r1, #0xc
	ldr r0, [r0, #4]
	str r5, [r0, r1]
	mov r0, #3
	bl sub_02032844
	ldr r1, _02033734 ; =_021D4124
	cmp r5, #0
	ldr r0, [r1, #4]
	strh r6, [r0, #0xc]
	ldr r0, [r1, #4]
	strh r7, [r0, #0x32]
	add r0, sp, #8
	ldrh r2, [r0, #0x10]
	ldr r0, [r1, #4]
	strh r2, [r0, #0x18]
	beq _020336CC
	cmp r5, #4
	beq _020336E6
	b _020336F2
_020336CC:
	ldr r0, [r1, #4]
	mov r2, #0xc0
	strh r2, [r0, #0x34]
	cmp r4, #5
	blo _020336DE
	ldr r0, [r1, #4]
	mov r2, #0xc
	strh r2, [r0, #0x36]
	b _020336F2
_020336DE:
	ldr r0, [r1, #4]
	mov r2, #0x26
	strh r2, [r0, #0x36]
	b _020336F2
_020336E6:
	ldr r0, [r1, #4]
	mov r2, #0x64
	strh r2, [r0, #0x34]
	ldr r0, [r1, #4]
	mov r2, #0xc
	strh r2, [r0, #0x36]
_020336F2:
	ldr r1, _02033734 ; =_021D4124
	ldr r0, [r1, #4]
	strh r4, [r0, #0x10]
	ldr r2, [r1, #4]
	mov r0, #0
	strh r0, [r2, #0x16]
	ldr r2, [r1, #4]
	cmp r5, #2
	strh r0, [r2, #0x12]
	ldr r2, [sp, #0x1c]
	ldr r1, [r1, #4]
	strh r2, [r1, #0xe]
	bne _0203370E
	mov r0, #1
_0203370E:
	ldr r1, _02033734 ; =_021D4124
	cmp r5, #0
	ldr r1, [r1, #4]
	strh r0, [r1, #0x14]
	beq _02033720
	cmp r5, #2
	beq _02033720
	cmp r5, #4
	bne _02033726
_02033720:
	bl sub_02032874
	pop {r3, r4, r5, r6, r7, pc}
_02033726:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0203372C: .word sub_02033664
_02033730: .word 0x0000FFFF
_02033734: .word _021D4124
_02033738: .word 0x00001308
	thumb_func_end sub_02033668

	thumb_func_start sub_0203373C
sub_0203373C: ; 0x0203373C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0203993C
	bl sub_020340C4
	cmp r0, #0
	beq _0203375E
	ldr r0, _020337BC ; =sub_02033664
	mov r2, #0x64
	ldr r1, _020337C0 ; =0x0000FFFF
	mov r3, #5
	str r2, [sp]
	bl WM_SetLifeTime
_0203375E:
	ldr r2, _020337C4 ; =_021D4124
	mov r3, #2
	ldr r0, [r2, #4]
	ldr r1, _020337C8 ; =0x00001308
	lsl r3, r3, #8
	str r3, [r0, r1]
	sub r0, r1, #4
	ldr r3, [r2, #4]
	mov r6, #0x40
	str r6, [r3, r0]
	ldr r0, [r2, #4]
	add r1, #0xc
	str r5, [r0, r1]
	mov r0, #3
	bl sub_02032844
	cmp r5, #1
	beq _0203378A
	cmp r5, #3
	beq _0203378A
	cmp r5, #5
	bne _020337B4
_0203378A:
	ldr r1, _020337C4 ; =_021D4124
	add r0, r4, #0
	ldr r2, [r1, #4]
	ldr r1, _020337CC ; =0x00001220
	add r1, r2, r1
	mov r2, #0xc0
	bl MI_CpuCopy8
	ldr r0, _020337C4 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _020337CC ; =0x00001220
	add r0, r1, r0
	mov r1, #0xc0
	bl DC_FlushRange
	bl DC_WaitWriteBufferEmpty
	bl sub_02032E9C
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_020337B4:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_020337BC: .word sub_02033664
_020337C0: .word 0x0000FFFF
_020337C4: .word _021D4124
_020337C8: .word 0x00001308
_020337CC: .word 0x00001220
	thumb_func_end sub_0203373C

	thumb_func_start sub_020337D0
sub_020337D0: ; 0x020337D0
	push {r3, lr}
	ldr r2, _020337F4 ; =_021D4124
	ldr r3, [r2, #4]
	ldr r2, _020337F8 ; =0x00001318
	str r0, [r3, r2]
	lsl r0, r1, #0x10
	ldr r1, _020337FC ; =sub_020331CC
	lsr r0, r0, #0x10
	mov r2, #0
	bl WM_SetPortCallback
	cmp r0, #0
	beq _020337F2
	mov r0, #9
	bl sub_02032844
_020337F0:
	b _020337F0
_020337F2:
	pop {r3, pc}
	.balign 4, 0
_020337F4: .word _021D4124
_020337F8: .word 0x00001318
_020337FC: .word sub_020331CC
	thumb_func_end sub_020337D0

	thumb_func_start sub_02033800
sub_02033800: ; 0x02033800
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl sub_020338F4
	cmp r0, #0
	bne _02033820
	bl sub_02033250
	mov r1, #0xfe
	tst r0, r1
	bne _02033820
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02033820:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0203314C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02033800

	thumb_func_start sub_02033830
sub_02033830: ; 0x02033830
	push {r3, lr}
	ldr r0, _02033850 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033854 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #2
	bne _02033840
_0203383E:
	b _0203383E
_02033840:
	bl sub_02033108
	cmp r0, #0
	bne _0203384E
	mov r0, #0xa
	bl sub_02032844
_0203384E:
	pop {r3, pc}
	.balign 4, 0
_02033850: .word _021D4124
_02033854: .word 0x00001310
	thumb_func_end sub_02033830

	thumb_func_start sub_02033858
sub_02033858: ; 0x02033858
	push {r3, lr}
	ldr r0, _020338C4 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _020338C8 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #1
	beq _020338C2
	cmp r0, #6
	beq _0203387E
	cmp r0, #5
	beq _0203387E
	cmp r0, #4
	beq _0203387E
	mov r0, #3
	bl sub_02032844
	bl sub_02033830
	pop {r3, pc}
_0203387E:
	mov r0, #3
	bl sub_02032844
	ldr r0, _020338C4 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _020338CC ; =0x00001314
	ldr r0, [r1, r0]
	cmp r0, #5
	bhi _020338C2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0203389C: ; jump table
	.short _020338B6 - _0203389C - 2 ; case 0
	.short _020338A8 - _0203389C - 2 ; case 1
	.short _020338C2 - _0203389C - 2 ; case 2
	.short _020338C2 - _0203389C - 2 ; case 3
	.short _020338B6 - _0203389C - 2 ; case 4
	.short _020338A8 - _0203389C - 2 ; case 5
_020338A8:
	bl sub_02033080
	cmp r0, #0
	bne _020338C2
	bl sub_02033830
	pop {r3, pc}
_020338B6:
	bl sub_02032B0C
	cmp r0, #0
	bne _020338C2
	bl sub_02033830
_020338C2:
	pop {r3, pc}
	.balign 4, 0
_020338C4: .word _021D4124
_020338C8: .word 0x00001310
_020338CC: .word 0x00001314
	thumb_func_end sub_02033858

	thumb_func_start sub_020338D0
sub_020338D0: ; 0x020338D0
	push {r3, lr}
	mov r0, #3
	bl sub_02032844
	ldr r0, _020338F0 ; =sub_02033214
	bl WM_End
	cmp r0, #2
	beq _020338EC
	mov r0, #9
	bl sub_02032844
	mov r0, #0
	pop {r3, pc}
_020338EC:
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_020338F0: .word sub_02033214
	thumb_func_end sub_020338D0

	thumb_func_start sub_020338F4
sub_020338F4: ; 0x020338F4
	ldr r0, _02033900 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033904 ; =0x0000132C
	ldrh r0, [r1, r0]
	bx lr
	nop
_02033900: .word _021D4124
_02033904: .word 0x0000132C
	thumb_func_end sub_020338F4

	thumb_func_start sub_02033908
sub_02033908: ; 0x02033908
	ldr r1, _02033918 ; =_021D4124
	ldr r2, [r1, #4]
	cmp r2, #0
	beq _02033914
	ldr r1, _0203391C ; =0x00001334
	strb r0, [r2, r1]
_02033914:
	bx lr
	nop
_02033918: .word _021D4124
_0203391C: .word 0x00001334
	thumb_func_end sub_02033908

	thumb_func_start sub_02033920
sub_02033920: ; 0x02033920
	ldr r0, _02033934 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033938 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #1
	bne _02033930
	mov r0, #1
	bx lr
_02033930:
	mov r0, #0
	bx lr
	.balign 4, 0
_02033934: .word _021D4124
_02033938: .word 0x00001310
	thumb_func_end sub_02033920

	thumb_func_start sub_0203393C
sub_0203393C: ; 0x0203393C
	ldr r0, _02033950 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033954 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #3
	bne _0203394C
	mov r0, #1
	bx lr
_0203394C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02033950: .word _021D4124
_02033954: .word 0x00001310
	thumb_func_end sub_0203393C

	thumb_func_start sub_02033958
sub_02033958: ; 0x02033958
	ldr r0, _0203396C ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033970 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #9
	bne _02033968
	mov r0, #1
	bx lr
_02033968:
	mov r0, #0
	bx lr
	.balign 4, 0
_0203396C: .word _021D4124
_02033970: .word 0x00001310
	thumb_func_end sub_02033958

	thumb_func_start sub_02033974
sub_02033974: ; 0x02033974
	ldr r0, _02033988 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _0203398C ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #0xa
	bne _02033984
	mov r0, #1
	bx lr
_02033984:
	mov r0, #0
	bx lr
	.balign 4, 0
_02033988: .word _021D4124
_0203398C: .word 0x00001310
	thumb_func_end sub_02033974

	thumb_func_start sub_02033990
sub_02033990: ; 0x02033990
	ldr r0, _020339AC ; =_021D4124
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _020339A8
	ldr r0, _020339B0 ; =0x00001310
	ldr r0, [r1, r0]
	cmp r0, #2
	bne _020339A4
	mov r0, #1
	bx lr
_020339A4:
	mov r0, #0
	bx lr
_020339A8:
	mov r0, #0
	bx lr
	.balign 4, 0
_020339AC: .word _021D4124
_020339B0: .word 0x00001310
	thumb_func_end sub_02033990

	thumb_func_start sub_020339B4
sub_020339B4: ; 0x020339B4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	ldr r0, _020339E8 ; =_021D4124
	add r5, r1, #0
	ldr r1, [r0, #4]
	ldr r0, _020339EC ; =0x00001310
	add r4, r2, #0
	ldr r0, [r1, r0]
	cmp r0, #4
	bne _020339E2
	lsl r0, r3, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #1
	lsl r2, r5, #0x10
	str r0, [sp, #4]
	mov r0, #0
	add r1, r6, #0
	lsr r2, r2, #0x10
	add r3, r4, #0
	bl WM_SetGameInfo
_020339E2:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_020339E8: .word _021D4124
_020339EC: .word 0x00001310
	thumb_func_end sub_020339B4

	thumb_func_start sub_020339F0
sub_020339F0: ; 0x020339F0
	ldrh r0, [r0, #2]
	cmp r0, #0
	bne _02033A00
	ldr r0, _02033A04 ; =_021D4124
	mov r2, #1
	ldr r1, [r0, #4]
	ldr r0, _02033A08 ; =0x00001344
	strb r2, [r1, r0]
_02033A00:
	bx lr
	nop
_02033A04: .word _021D4124
_02033A08: .word 0x00001344
	thumb_func_end sub_020339F0

	thumb_func_start sub_02033A0C
sub_02033A0C: ; 0x02033A0C
	push {r4, lr}
	ldr r2, _02033A38 ; =_021D4124
	add r1, r0, #0
	ldr r3, [r2, #4]
	ldr r0, _02033A3C ; =0x00001344
	mov r4, #0
	strb r4, [r3, r0]
	ldr r2, [r2, #4]
	sub r0, #0x34
	ldr r0, [r2, r0]
	cmp r0, #4
	bne _02033A32
	ldr r0, _02033A40 ; =sub_020339F0
	bl WM_SetEntry
	cmp r0, #2
	bne _02033A32
	mov r0, #1
	pop {r4, pc}
_02033A32:
	mov r0, #0
	pop {r4, pc}
	nop
_02033A38: .word _021D4124
_02033A3C: .word 0x00001344
_02033A40: .word sub_020339F0
	thumb_func_end sub_02033A0C

	thumb_func_start sub_02033A44
sub_02033A44: ; 0x02033A44
	ldr r0, _02033A60 ; =_021D4124
	ldr r1, [r0, #4]
	cmp r1, #0
	beq _02033A5C
	ldr r0, _02033A64 ; =0x00001345
	ldrb r0, [r1, r0]
	cmp r0, #6
	blo _02033A58
	mov r0, #1
	bx lr
_02033A58:
	mov r0, #0
	bx lr
_02033A5C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02033A60: .word _021D4124
_02033A64: .word 0x00001345
	thumb_func_end sub_02033A44

	thumb_func_start sub_02033A68
sub_02033A68: ; 0x02033A68
	ldr r0, _02033A74 ; =_021D4124
	mov r2, #0
	ldr r1, [r0, #4]
	ldr r0, _02033A78 ; =0x00001345
	strb r2, [r1, r0]
	bx lr
	.balign 4, 0
_02033A74: .word _021D4124
_02033A78: .word 0x00001345
	thumb_func_end sub_02033A68

	thumb_func_start sub_02033A7C
sub_02033A7C: ; 0x02033A7C
	ldr r1, _02033A88 ; =_021D4124
	ldr r2, [r1, #4]
	ldr r1, _02033A8C ; =0x00001320
	str r0, [r2, r1]
	bx lr
	nop
_02033A88: .word _021D4124
_02033A8C: .word 0x00001320
	thumb_func_end sub_02033A7C

	thumb_func_start sub_02033A90
sub_02033A90: ; 0x02033A90
	ldr r1, _02033A9C ; =_021D4124
	ldr r2, [r1, #4]
	ldr r1, _02033AA0 ; =0x00001328
	str r0, [r2, r1]
	bx lr
	nop
_02033A9C: .word _021D4124
_02033AA0: .word 0x00001328
	thumb_func_end sub_02033A90

	thumb_func_start sub_02033AA4
sub_02033AA4: ; 0x02033AA4
	ldr r1, _02033AB0 ; =_021D4124
	ldr r2, [r1, #4]
	ldr r1, _02033AB4 ; =0x00001342
	strb r0, [r2, r1]
	bx lr
	nop
_02033AB0: .word _021D4124
_02033AB4: .word 0x00001342
	thumb_func_end sub_02033AA4

	thumb_func_start sub_02033AB8
sub_02033AB8: ; 0x02033AB8
	ldr r0, _02033AC4 ; =_021D4124
	ldr r1, [r0, #4]
	ldr r0, _02033AC8 ; =0x00001342
	ldrb r0, [r1, r0]
	bx lr
	nop
_02033AC4: .word _021D4124
_02033AC8: .word 0x00001342
	thumb_func_end sub_02033AB8

	thumb_func_start sub_02033ACC
sub_02033ACC: ; 0x02033ACC
	ldr r1, _02033AD8 ; =_021D4124
	ldr r2, [r1, #4]
	ldr r1, _02033ADC ; =0x00001343
	strb r0, [r2, r1]
	bx lr
	nop
_02033AD8: .word _021D4124
_02033ADC: .word 0x00001343
	thumb_func_end sub_02033ACC
