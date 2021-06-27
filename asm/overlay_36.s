
	thumb_func_start ov36_021E5900
ov36_021E5900: ; 0x021E5900
	push {r3, lr}
	mov r2, #2
	mov r0, #3
	mov r1, #0x4b
	lsl r2, r2, #0x10
	bl FUN_0201A910
	bl FUN_020010C8
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov36_021E5900

	thumb_func_start ov36_021E5918
ov36_021E5918: ; 0x021E5918
	push {r3, lr}
	bl FUN_020072A4
	ldr r1, [r0, #8]
	mov r0, #0x4b
	bl ov36_021E5BC8
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov36_021E5918

	thumb_func_start ov36_021E592C
ov36_021E592C: ; 0x021E592C
	push {r3, lr}
	mov r0, #0x4b
	bl FUN_0201A9C4
	mov r0, #0
	ldr r1, _021E5944 ; =0x02106068
	mvn r0, r0
	bl FUN_02000EF4
	mov r0, #1
	pop {r3, pc}
	nop
_021E5944: .word 0x02106068
	thumb_func_end ov36_021E592C

	thumb_func_start ov36_021E5948
ov36_021E5948: ; 0x021E5948
	push {r3, lr}
	mov r2, #2
	mov r0, #3
	mov r1, #0x4b
	lsl r2, r2, #0x10
	bl FUN_0201A910
	bl FUN_020010C8
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov36_021E5948

	thumb_func_start ov36_021E5960
ov36_021E5960: ; 0x021E5960
	push {r4, lr}
	bl FUN_020072A4
	ldr r4, [r0, #8]
	mov r0, #0x4b
	add r1, r4, #0
	mov r2, #1
	bl ov36_021E5A38
	add r0, r4, #0
	bl FUN_02028EC0
	bl FUN_0201838C
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov36_021E5960

	thumb_func_start ov36_021E5980
ov36_021E5980: ; 0x021E5980
	push {r3, lr}
	mov r0, #0x4b
	bl FUN_0201A9C4
	mov r0, #0
	ldr r1, _021E5998 ; =0x020FA15C
	mvn r0, r0
	bl FUN_02000EF4
	mov r0, #1
	pop {r3, pc}
	nop
_021E5998: .word 0x020FA15C
	thumb_func_end ov36_021E5980

	thumb_func_start ov36_021E599C
ov36_021E599C: ; 0x021E599C
	push {r3, lr}
	mov r2, #2
	mov r0, #3
	mov r1, #0x4b
	lsl r2, r2, #0x10
	bl FUN_0201A910
	bl FUN_020010C8
	mov r0, #1
	pop {r3, pc}
	.align 2, 0
	thumb_func_end ov36_021E599C

	thumb_func_start ov36_021E59B4
ov36_021E59B4: ; 0x021E59B4
	push {r3, r4, r5, lr}
	bl FUN_020072A4
	ldr r4, [r0, #8]
	add r0, r4, #0
	bl FUN_02028D30
	add r5, r0, #0
	mov r0, #0x4b
	add r1, r4, #0
	bl ov36_021E5BB4
	add r0, r4, #0
	mov r1, #0
	bl FUN_0202ACF4
	add r0, r5, #0
	bl FUN_02028D74
	cmp r0, #0
	beq _021E59E8
	add r0, r5, #0
	bl FUN_02028DA4
	cmp r0, #0
	bne _021E5A0C
_021E59E8:
	add r0, r4, #0
	bl FUN_02028D3C
	bl FUN_02028E4C
	add r0, r4, #0
	bl FUN_0202A988
	bl FUN_0202A8A8
	add r0, r5, #0
	bl FUN_02028D48
	add r0, r4, #0
	bl FUN_02074904
	bl FUN_02071E2C
_021E5A0C:
	add r0, r4, #0
	bl FUN_02028EC0
	bl FUN_0201838C
	mov r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end ov36_021E59B4

	thumb_func_start ov36_021E5A1C
ov36_021E5A1C: ; 0x021E5A1C
	push {r3, lr}
	mov r0, #0x4b
	bl FUN_0201A9C4
	mov r0, #0
	ldr r1, _021E5A34 ; =0x020FA16C
	mvn r0, r0
	bl FUN_02000EF4
	mov r0, #1
	pop {r3, pc}
	nop
_021E5A34: .word 0x020FA16C
	thumb_func_end ov36_021E5A1C

	thumb_func_start ov36_021E5A38
ov36_021E5A38: ; 0x021E5A38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r1, #0
	add r0, r6, #0
	add r5, r2, #0
	bl FUN_02028D30
	bl FUN_02028D48
	add r0, r6, #0
	bl FUN_02028D3C
	bl FUN_02028DE8
	add r0, r6, #0
	bl FUN_0202A988
	bl FUN_0202A8A8
	add r0, r6, #0
	bl FUN_0202C854
	add r4, r0, #0
	bl FUN_0201FDB8
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl FUN_0202C7C0
	add r0, r6, #0
	bl FUN_020674BC
	add r0, r6, #0
	bl FUN_02028E9C
	add r7, r0, #0
	bl FUN_0201FDB8
	add r4, r0, #0
	cmp r5, #0
	beq _021E5A94
	add r0, r7, #0
	add r1, r4, #0
	bl FUN_02028F80
_021E5A94:
	add r0, r6, #0
	bl FUN_0202F57C
	add r1, r4, #0
	bl FUN_0202F5B8
	add r0, r7, #0
	bl FUN_02028F94
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl FUN_0205B418
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	bl FUN_02029040
	add r0, r6, #0
	bl FUN_0202A96C
	bl FUN_0202AE0C
	add r0, r6, #0
	bl FUN_020325EC
	bl FUN_02032728
	add r5, r0, #0
	mov r4, #0
_021E5AD4:
	bl FUN_0201FDB8
	add r4, r4, #1
	stmia r5!, {r0}
	cmp r4, #0xa
	blt _021E5AD4
	ldr r2, _021E5BAC ; =0x000001BD
	mov r0, #1
	mov r1, #0x1b
	mov r3, #3
	bl FUN_0200BAF8
	str r0, [sp, #0x1c]
	add r0, r6, #0
	bl FUN_0202B50C
	str r0, [sp, #0x14]
	mov r0, #3
	bl FUN_0206DD2C
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	mov r1, #0xb7
	mov r2, #1
	str r0, [sp, #0x10]
	str r3, [sp, #0xc]
	bl FUN_0206DE38
	add r0, r7, #0
	bl FUN_02028F94
	cmp r0, #0
	bne _021E5B36
	ldr r0, [sp, #0x1c]
	mov r1, #1
	bl FUN_0200BBA0
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x18]
	mov r1, #9
	mov r2, #1
	bl FUN_0202B2D4
	b _021E5B4E
_021E5B36:
	ldr r0, [sp, #0x1c]
	mov r1, #0
	bl FUN_0200BBA0
	str r0, [sp, #0x18]
	mov r2, #0
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x18]
	mov r1, #9
	str r2, [sp]
	bl FUN_0202B2D4
_021E5B4E:
	ldr r4, _021E5BB0 ; =0x021E5C34
	add r6, r0, #0
	mov r5, #0
	add r7, sp, #0x20
_021E5B56:
	add r0, r7, #0
	add r1, r4, #0
	bl FUN_0201585C
	lsl r2, r5, #0x18
	add r0, r6, #0
	add r1, r7, #0
	lsr r2, r2, #0x18
	bl FUN_0202B4F8
	add r5, r5, #1
	add r4, #8
	cmp r5, #2
	blt _021E5B56
	add r0, sp, #0x20
	bl FUN_0201581C
	add r0, r6, #0
	add r1, sp, #0x20
	mov r2, #2
	bl FUN_0202B4F8
	mov r1, #0
	ldr r0, [sp, #0x14]
	add r2, r1, #0
	add r3, r6, #0
	bl FUN_0202B554
	ldr r0, [sp, #0x10]
	bl FUN_0201AB0C
	ldr r0, [sp, #0x18]
	bl FUN_02026380
	add r0, r6, #0
	bl FUN_0201AB0C
	ldr r0, [sp, #0x1c]
	bl FUN_0200BB44
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5BAC: .word 0x000001BD
_021E5BB0: .word 0x021E5C34
	thumb_func_end ov36_021E5A38

	thumb_func_start ov36_021E5BB4
ov36_021E5BB4: ; 0x021E5BB4
	push {r3, lr}
	add r0, r1, #0
	bl FUN_020273B0
	cmp r0, #0
	bne _021E5BC6
	mov r0, #0
	bl FUN_020D3B84
_021E5BC6:
	pop {r3, pc}
	thumb_func_end ov36_021E5BB4

	thumb_func_start ov36_021E5BC8
ov36_021E5BC8: ; 0x021E5BC8
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	bl FUN_020274A8
	add r0, r4, #0
	bl FUN_0203E398
	add r0, r4, #0
	bl FUN_02028E9C
	ldr r1, _021E5BFC ; =0x00000BB8
	bl FUN_02029028
	add r0, r4, #0
	bl FUN_020503D0
	ldr r1, _021E5C00 ; =0x0000DB56
	bl FUN_02066B60
	add r0, r4, #0
	bl FUN_020503D0
	bl FUN_020665EC
	pop {r4, pc}
	.align 2, 0
_021E5BFC: .word 0x00000BB8
_021E5C00: .word 0x0000DB56
	thumb_func_end ov36_021E5BC8

	.rodata

_021E5C04:
	.byte 0x9D, 0x59, 0x1E, 0x02, 0xB5, 0x59, 0x1E, 0x02, 0x1D, 0x5A, 0x1E, 0x02
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x49, 0x59, 0x1E, 0x02, 0x61, 0x59, 0x1E, 0x02, 0x81, 0x59, 0x1E, 0x02
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x01, 0x59, 0x1E, 0x02, 0x19, 0x59, 0x1E, 0x02, 0x2D, 0x59, 0x1E, 0x02
	.byte 0xFF, 0xFF, 0xFF, 0xFF, 0x02, 0x04, 0x07, 0x08, 0x52, 0x00, 0x18, 0x00, 0x03, 0x01, 0x0A, 0xFF
	.byte 0x07, 0x00, 0x00, 0x00
