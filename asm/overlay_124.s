
	thumb_func_start ov124_02260C20
ov124_02260C20: ; 0x02260C20
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02260CF8 ; =0x0000007B
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #0
	add r1, r7, #0
	ldr r4, _02260CFC ; =0x0097B4B1
	bl FS_LoadOverlay
	ldr r0, _02260D00 ; =ov124_02260D68
	bl sub_0225F4A8
	cmp r0, #0
	bne _02260C40
	mov r1, #1
	b _02260C42
_02260C40:
	mov r1, #0
_02260C42:
	ldr r0, _02260D04 ; =0x00000301
	mul r0, r1
	add r4, r4, r0
	add r0, r6, #0
	bl sub_020072A4
	ldr r0, [r0, #8]
	str r0, [r5, #0xc]
	mov r0, #0
	str r0, [r5, #0x10]
	ldr r0, _02260D08 ; =ov124_02260D6C
	bl sub_0225F688
	cmp r0, #0
	bne _02260C64
	mov r1, #1
	b _02260C66
_02260C64:
	mov r1, #0
_02260C66:
	mov r0, #0x2f
	mul r0, r1
	add r4, r4, r0
	ldr r0, [r5, #0xc]
	bl sub_0203B9C4
	bl sub_0203B958
	str r0, [r5, #0x20]
	bl sub_0203AF9C
	str r0, [r5, #0x30]
	ldr r0, _02260D0C ; =ov124_02260D58
	bl sub_0225F520
	add r6, r0, #0
	ldr r1, _02260D10 ; =0x000003A1
	add r0, r5, #0
	mul r6, r1
	mov r1, #0xb
	bl sub_0203B610
	mov r0, #0xb
	bl sub_020787A8
	add r1, r5, #0
	add r1, #0x94
	str r0, [r1]
	mov r0, #0
	add r1, r7, #0
	bl FS_UnloadOverlay
	ldr r1, _02260D14 ; =0x00000989
	add r0, r4, r6
	bl sub_020F2BA4
	cmp r1, #0
	beq _02260CB8
	add r0, r5, #0
	bl ov124_02260D1C
_02260CB8:
	mov r0, #0xb
	bl sub_02092BB8
	add r1, r5, #0
	add r1, #0xa8
	str r0, [r1]
	mov r0, #0xb
	bl sub_0206A1D4
	mov r1, #0x42
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0xb
	add r1, r5, #0
	bl sub_02092D98
	mov r1, #0x45
	lsl r1, r1, #2
	str r0, [r5, r1]
	mov r0, #0
	add r1, #0x10
	str r0, [r5, r1]
	ldr r1, _02260D18 ; =0x00000FE9
	add r0, r4, r6
	bl sub_020F2BA4
	cmp r1, #0
	beq _02260CF6
	add r0, r5, #0
	bl ov124_02260D1C
_02260CF6:
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02260CF8: .word 0x0000007B
_02260CFC: .word 0x0097B4B1
_02260D00: .word ov124_02260D68
_02260D04: .word 0x00000301
_02260D08: .word ov124_02260D6C
_02260D0C: .word ov124_02260D58
_02260D10: .word 0x000003A1
_02260D14: .word 0x00000989
_02260D18: .word 0x00000FE9
	thumb_func_end ov124_02260C20

	thumb_func_start ov124_02260D1C
ov124_02260D1C: ; 0x02260D1C
	push {r4, r5, r6, lr}
	mov r5, #0
	add r6, r0, #0
	add r4, r5, #0
_02260D24:
	ldr r0, [r6, #0xc]
	bl sub_02028E9C
	add r1, r4, #0
	bl sub_02028F98
	cmp r0, #1
	bne _02260D36
	add r5, r5, #1
_02260D36:
	add r4, r4, #1
	cmp r4, #0x10
	blt _02260D24
	cmp r5, #0
	bne _02260D44
	ldr r1, _02260D54 ; =0x00004E20
	b _02260D4A
_02260D44:
	ldr r0, _02260D54 ; =0x00004E20
	add r1, r5, #0
	mul r1, r0
_02260D4A:
	mov r0, #3
	bl sub_0201AACC
	pop {r4, r5, r6, pc}
	nop
_02260D54: .word 0x00004E20
	thumb_func_end ov124_02260D1C

	thumb_func_start ov124_02260D58
ov124_02260D58: ; 0x02260D58
	ldr r3, _02260D64 ; =sub_0201AACC
	mov r1, #0xfa
	mov r0, #3
	lsl r1, r1, #2
	bx r3
	nop
_02260D64: .word sub_0201AACC
	thumb_func_end ov124_02260D58

	thumb_func_start ov124_02260D68
ov124_02260D68: ; 0x02260D68
	bx lr
	.align 2, 0
	thumb_func_end ov124_02260D68

	thumb_func_start ov124_02260D6C
ov124_02260D6C: ; 0x02260D6C
	bx lr
	.align 2, 0
	thumb_func_end ov124_02260D6C

