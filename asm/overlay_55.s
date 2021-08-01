	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov55_021E5900
ov55_021E5900: ; 0x021E5900
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _021E5920
	bl OverlayManager_run
	cmp r0, #0
	beq _021E5920
	ldr r0, [r4]
	bl OverlayManager_delete
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_021E5920:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov55_021E5900

	thumb_func_start ov55_021E5924
ov55_021E5924: ; 0x021E5924
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_020072A4
	mov r2, #1
	add r5, r0, #0
	mov r0, #3
	mov r1, #0x28
	lsl r2, r2, #0xc
	bl sub_0201A910
	add r0, r4, #0
	mov r1, #0x1c
	mov r2, #0x28
	bl sub_02007280
	mov r1, #0
	mov r2, #0x1c
	add r4, r0, #0
	bl sub_020D4994
	mov r1, #0x28
	str r1, [r4]
	ldr r0, [r5, #0x14]
	bl ov55_021E5B08
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x10]
	bl sub_02028EA8
	ldr r1, [r4, #0x10]
	str r0, [r1, #4]
	ldrh r0, [r5]
	cmp r0, #1
	bne _021E5970
	ldrb r1, [r5, #0xf]
	ldr r0, [r4, #0x10]
	strb r1, [r0, #0x13]
_021E5970:
	ldr r1, [r4, #0x10]
	ldrb r0, [r1, #0x13]
	cmp r0, #0xc
	blo _021E597C
	mov r0, #0
	strb r0, [r1, #0x13]
_021E597C:
	ldrh r1, [r5]
	ldr r0, [r4, #0x10]
	strh r1, [r0]
	ldr r1, [r5, #0x1c]
	ldr r0, [r4, #0x10]
	str r1, [r0, #8]
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov55_021E5924

	thumb_func_start ov55_021E598C
ov55_021E598C: ; 0x021E598C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r6, r1, #0
	bl sub_02007290
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020072A4
	add r5, r0, #0
	ldr r0, [r6]
	cmp r0, #4
	bls _021E59AA
	b _021E5AD4
_021E59AA:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E59B6: ; jump table
	.short _021E59C0 - _021E59B6 - 2 ; case 0
	.short _021E59D8 - _021E59B6 - 2 ; case 1
	.short _021E5A04 - _021E59B6 - 2 ; case 2
	.short _021E5A40 - _021E59B6 - 2 ; case 3
	.short _021E5AA2 - _021E59B6 - 2 ; case 4
_021E59C0:
	ldrh r1, [r5]
	ldr r0, [r4, #0x10]
	strh r1, [r0]
	ldr r0, _021E5ADC ; =_021E5BF4
	ldr r1, [r4, #0x10]
	ldr r2, [r4]
	bl OverlayManager_new
	str r0, [r4, #0xc]
	mov r0, #1
	str r0, [r6]
	b _021E5AD4
_021E59D8:
	add r0, r4, #0
	add r0, #0xc
	bl ov55_021E5900
	cmp r0, #0
	beq _021E5AD4
	ldr r0, [r4, #0x10]
	ldrh r1, [r0]
	cmp r1, #3
	beq _021E59F8
	ldr r0, _021E5AE0 ; =0x0000FFFF
	cmp r1, r0
	bne _021E59FE
	mov r0, #2
	str r0, [r6]
	b _021E5AD4
_021E59F8:
	mov r0, #2
	str r0, [r6]
	b _021E5AD4
_021E59FE:
	mov r0, #3
	str r0, [r6]
	b _021E5AD4
_021E5A04:
	ldrh r0, [r5]
	cmp r0, #1
	bne _021E5A3A
	ldr r1, [r4, #0x10]
	ldrh r0, [r1]
	cmp r0, #3
	bne _021E5A36
	ldr r0, [r5, #0x14]
	bl ov55_021E5BC4
	ldr r0, [r5, #0x10]
	bl sub_0202CF54
	mov r1, #2
	bl sub_0202D1C0
	ldr r0, [r5, #0x10]
	bl sub_0202CF54
	mov r1, #0x2e
	bl sub_0202D0FC
	mov r0, #1
	str r0, [r5, #4]
	b _021E5A3A
_021E5A36:
	mov r0, #0
	str r0, [r5, #4]
_021E5A3A:
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021E5A40:
	ldr r0, [r4]
	mov r1, #0
	str r0, [sp]
	ldr r2, [r5, #0x10]
	ldr r3, [r5, #0x1c]
	mov r0, #2
	bl sub_02090C94
	str r0, [r4, #8]
	ldr r0, [r4, #0x10]
	add r1, r0, #0
	ldrb r0, [r0, #2]
	add r1, #0x1e
	lsl r0, r0, #3
	add r0, r1, r0
	bl sub_02015920
	cmp r0, #0
	beq _021E5A7C
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	add r2, r1, #0
	ldrb r1, [r1, #2]
	add r2, #0x1e
	add r0, #0x14
	lsl r1, r1, #3
	add r1, r2, r1
	bl sub_02015A24
	b _021E5A86
_021E5A7C:
	add r0, r4, #0
	add r0, #0x14
	mov r1, #3
	bl sub_02015834
_021E5A86:
	add r1, r4, #0
	ldr r0, [r4, #8]
	add r1, #0x14
	bl sub_02090D20
	ldr r0, _021E5AE4 ; =0x021E5C04
	ldr r1, [r4, #8]
	ldr r2, [r4]
	bl OverlayManager_new
	str r0, [r4, #0xc]
	mov r0, #4
	str r0, [r6]
	b _021E5AD4
_021E5AA2:
	add r0, r4, #0
	add r0, #0xc
	bl ov55_021E5900
	cmp r0, #0
	beq _021E5AD4
	ldr r0, [r4, #8]
	bl sub_02090D48
	cmp r0, #0
	bne _021E5ACA
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #8]
	add r2, r1, #0
	ldrb r1, [r1, #2]
	add r2, #0x1e
	lsl r1, r1, #3
	add r1, r2, r1
	bl sub_02090D60
_021E5ACA:
	ldr r0, [r4, #8]
	bl sub_02090D0C
	mov r0, #0
	str r0, [r6]
_021E5AD4:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021E5ADC: .word _021E5BF4
_021E5AE0: .word 0x0000FFFF
_021E5AE4: .word 0x021E5C04
	thumb_func_end ov55_021E598C

	thumb_func_start ov55_021E5AE8
ov55_021E5AE8: ; 0x021E5AE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_02007290
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl ov55_021E5BAC
	add r0, r5, #0
	bl sub_02007294
	ldr r0, [r4]
	bl sub_0201A9C4
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov55_021E5AE8

	thumb_func_start ov55_021E5B08
ov55_021E5B08: ; 0x021E5B08
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x38
	bl sub_0201AA8C
	mov r1, #0
	mov r2, #0x38
	add r6, r0, #0
	bl sub_020D4994
	mov r0, #0
	strh r0, [r6]
	add r0, r4, #0
	bl sub_0202B3E4
	str r0, [r6, #0xc]
	mov r0, #8
	add r1, r5, #0
	bl sub_02026354
	str r0, [r6, #0x14]
	add r0, r4, #0
	bl sub_0202B3E8
	add r1, r0, #0
	ldr r0, [r6, #0x14]
	bl sub_020269A0
	add r0, r4, #0
	bl sub_0202B3F0
	strb r0, [r6, #0x13]
	add r0, r4, #0
	bl sub_0202B3FC
	strb r0, [r6, #0x11]
	add r0, r4, #0
	bl sub_0202B400
	strb r0, [r6, #0x12]
	mov r5, #0
	mov r7, #2
_021E5B60:
	add r0, r4, #0
	bl sub_0202B4E4
	lsl r1, r5, #0x18
	add r3, r0, #0
	add r0, r4, #0
	lsr r1, r1, #0x18
	add r2, r7, #0
	bl sub_0202B404
	lsl r1, r5, #1
	add r1, r6, r1
	strh r0, [r1, #0x18]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _021E5B60
	add r7, r6, #0
	mov r5, #0
	add r7, #0x1e
_021E5B8A:
	lsl r1, r5, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl sub_0202B4E8
	add r1, r0, #0
	lsl r0, r5, #3
	add r0, r7, r0
	bl sub_02015A24
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _021E5B8A
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov55_021E5B08

	thumb_func_start ov55_021E5BAC
ov55_021E5BAC: ; 0x021E5BAC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #0
	beq _021E5BBA
	bl sub_02026380
_021E5BBA:
	add r0, r4, #0
	bl sub_0201AB0C
	pop {r4, pc}
	.align 2, 0
	thumb_func_end ov55_021E5BAC

	thumb_func_start ov55_021E5BC4
ov55_021E5BC4: ; 0x021E5BC4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r4, r7, #0
	add r6, r0, #0
	mov r5, #0
	add r4, #0x1e
_021E5BD0:
	lsl r1, r5, #3
	lsl r2, r5, #0x18
	add r0, r6, #0
	add r1, r4, r1
	lsr r2, r2, #0x18
	bl sub_0202B4F8
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #3
	blo _021E5BD0
	ldrb r1, [r7, #0x13]
	add r0, r6, #0
	bl sub_0202B3F4
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end ov55_021E5BC4

	.rodata

_021E5BF4:
	.byte 0x21, 0x5C, 0x1E, 0x02, 0x9D, 0x5C, 0x1E, 0x02, 0xB5, 0x5C, 0x1E, 0x02
	.byte 0x38, 0x00, 0x00, 0x00, 0x41, 0x77, 0x1E, 0x02, 0xB9, 0x77, 0x1E, 0x02, 0x69, 0x78, 0x1E, 0x02
	.byte 0x66, 0x00, 0x00, 0x00
	; 0x021E5C14
