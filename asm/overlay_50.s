
	thumb_func_start ov50_021E5900
ov50_021E5900: ; 0x021E5900
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E5920
	bl FUN_020072A8
	cmp r0, #0
	beq _021E5920
	ldr r0, [r4]
	bl FUN_02007278
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021E5920:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov50_021E5900

	thumb_func_start ov50_021E5924
ov50_021E5924: ; 0x021E5924
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl FUN_020072A4
	mov r2, #1
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x5e
	lsl r2, r2, #0xc
	bl FUN_0201A910
	add r0, r4, #0
	mov r1, #0x14
	mov r2, #0x5e
	bl FUN_02007280
	mov r1, #0
	mov r2, #0x14
	add r4, r0, #0
	bl FUN_020D4994
	mov r0, #0x5e
	str r0, [r4]
	str r5, [r4, #0xc]
	str r5, [r4, #0x10]
	mov r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov50_021E5924

	thumb_func_start ov50_021E595C
ov50_021E595C: ; 0x021E595C
	push {r4, lr}
	add r4, r1, #0
	bl FUN_02007290
	ldr r1, [r4]
	cmp r1, #4
	bhi _021E59A0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E5976: ; jump table
	.short _021E5980 - _021E5976 - 2 ; case 0
	.short _021E5988 - _021E5976 - 2 ; case 1
	.short _021E5990 - _021E5976 - 2 ; case 2
	.short _021E5998 - _021E5976 - 2 ; case 3
	.short _021E59A0 - _021E5976 - 2 ; case 4
_021E5980:
	bl ov50_021E59CC
	str r0, [r4]
	b _021E59A4
_021E5988:
	bl ov50_021E59E4
	str r0, [r4]
	b _021E59A4
_021E5990:
	bl ov50_021E5A0C
	str r0, [r4]
	b _021E59A4
_021E5998:
	bl ov50_021E5A3C
	str r0, [r4]
	b _021E59A4
_021E59A0:
	mov r0, #1
	pop {r4, pc}
_021E59A4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov50_021E595C

	thumb_func_start ov50_021E59A8
ov50_021E59A8: ; 0x021E59A8
	push {r4, lr}
	add r4, r0, #0
	bl FUN_02007290
	mov r1, #0
	mov r2, #0x14
	bl FUN_020D4994
	add r0, r4, #0
	bl FUN_02007294
	bl FUN_02004B10
	mov r0, #0x5e
	bl FUN_0201A9C4
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov50_021E59A8

	thumb_func_start ov50_021E59CC
ov50_021E59CC: ; 0x021E59CC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E59E0 ; =_021E5A8C
	ldr r1, [r4, #0xc]
	ldr r2, [r4]
	bl FUN_0200724C
	str r0, [r4, #8]
	mov r0, #1
	pop {r4, pc}
	.align 2, 0
_021E59E0: .word _021E5A8C
	thumb_func_end ov50_021E59CC

	thumb_func_start ov50_021E59E4
ov50_021E59E4: ; 0x021E59E4
	push {r4, lr}
	add r4, r0, #0
	add r0, #8
	bl ov50_021E5900
	cmp r0, #0
	bne _021E59F6
	mov r0, #1
	pop {r4, pc}
_021E59F6:
	ldr r1, [r4, #0xc]
	ldr r0, _021E5A08 ; =0x00000674
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _021E5A04
	mov r0, #2
	pop {r4, pc}
_021E5A04:
	mov r0, #4
	pop {r4, pc}
	.align 2, 0
_021E5A08: .word 0x00000674
	thumb_func_end ov50_021E59E4

	thumb_func_start ov50_021E5A0C
ov50_021E5A0C: ; 0x021E5A0C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r5, _021E5A38 ; =0x021E5A9C
	add r3, sp, #0
	add r4, r0, #0
	add r2, r3, #0
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	mov r1, #0x67
	ldr r2, [r4, #0xc]
	lsl r1, r1, #4
	ldr r1, [r2, r1]
	ldr r2, [r4]
	bl FUN_0200724C
	str r0, [r4, #8]
	mov r0, #3
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_021E5A38: .word 0x021E5A9C
	thumb_func_end ov50_021E5A0C

	thumb_func_start ov50_021E5A3C
ov50_021E5A3C: ; 0x021E5A3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #8
	bl ov50_021E5900
	cmp r0, #0
	bne _021E5A4E
	mov r0, #3
	pop {r3, r4, r5, pc}
_021E5A4E:
	mov r0, #0x67
	ldr r1, [r5, #0xc]
	lsl r0, r0, #4
	ldr r0, [r1, r0]
	bl FUN_0202C9D8
	add r4, r0, #0
	bl FUN_0202C9E8
	ldr r2, [r5, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r2, #4]
	mov r3, #0x10
	lsr r0, r0, #0x1b
	bic r1, r3
	orr r0, r1
	strb r0, [r2, #4]
	add r0, r4, #0
	bl FUN_0202C9E4
	ldr r1, [r5, #0xc]
	mov r2, #6
	add r1, #0x68
	lsl r2, r2, #8
	bl FUN_020D4A50
	mov r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov50_021E5A3C

	.rodata

_021E5A8C:
	.byte 0xC1, 0x5A, 0x1E, 0x02
	.byte 0x91, 0x5D, 0x1E, 0x02, 0xC9, 0x5E, 0x1E, 0x02, 0x33, 0x00, 0x00, 0x00, 0xC1, 0x80, 0x1E, 0x02
	.byte 0x49, 0x82, 0x1E, 0x02, 0xAD, 0x82, 0x1E, 0x02, 0x34, 0x00, 0x00, 0x00
	; 0x021E5AAC
