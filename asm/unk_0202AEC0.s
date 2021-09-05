	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202AEC0
sub_0202AEC0: ; 0x0202AEC0
	mov r0, #0x22
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202AEC0

	thumb_func_start sub_0202AEC8
sub_0202AEC8: ; 0x0202AEC8
	ldr r3, _0202AED0 ; =SavArray_get
	mov r1, #8
	bx r3
	nop
_0202AED0: .word SavArray_get
	thumb_func_end sub_0202AEC8

	thumb_func_start sub_0202AED4
sub_0202AED4: ; 0x0202AED4
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	ldr r6, _0202AEF4 ; =0x0000FFFF
	add r5, r0, #0
	add r7, r4, #0
_0202AEDE:
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0x88
	bl memset
	strh r6, [r5]
	add r4, r4, #1
	add r5, #0x88
	cmp r4, #0x10
	blt _0202AEDE
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202AEF4: .word 0x0000FFFF
	thumb_func_end sub_0202AED4

	thumb_func_start sub_0202AEF8
sub_0202AEF8: ; 0x0202AEF8
	mov r2, #0x88
	mul r2, r1
	add r0, r0, r2
	bx lr
	thumb_func_end sub_0202AEF8

	thumb_func_start sub_0202AF00
sub_0202AF00: ; 0x0202AF00
	add r0, r0, r1
	add r0, #0x68
	ldrb r0, [r0]
	bx lr
	thumb_func_end sub_0202AF00

	thumb_func_start sub_0202AF08
sub_0202AF08: ; 0x0202AF08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl StringNotEqual
	cmp r0, #0
	bne _0202AF22
	ldr r1, [r5, #0x10]
	ldr r0, [r4, #0x10]
	cmp r1, r0
	bne _0202AF22
	mov r0, #1
	pop {r3, r4, r5, pc}
_0202AF22:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202AF08

	thumb_func_start sub_0202AF28
sub_0202AF28: ; 0x0202AF28
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r1, [sp, #4]
	mov r1, #0x22
	str r0, [sp]
	add r0, r3, #0
	lsl r1, r1, #6
	str r2, [sp, #8]
	bl AllocFromHeap
	str r0, [sp, #0x10]
	bl sub_0202AED4
	mov r0, #0
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	cmp r0, #0
	ble _0202AF80
	ldr r7, [sp, #4]
	add r6, sp, #0x18
_0202AF50:
	mov r0, #0
	mvn r0, r0
	ldr r5, [sp]
	str r0, [r6]
	mov r4, #0
_0202AF5A:
	add r0, r5, #0
	add r1, r7, #0
	bl sub_0202AF08
	cmp r0, #0
	beq _0202AF68
	str r4, [r6]
_0202AF68:
	add r4, r4, #1
	add r5, #0x88
	cmp r4, #0x10
	blt _0202AF5A
	ldr r0, [sp, #0x14]
	add r6, r6, #4
	add r1, r0, #1
	ldr r0, [sp, #8]
	add r7, #0x88
	str r1, [sp, #0x14]
	cmp r1, r0
	blt _0202AF50
_0202AF80:
	ldr r0, [sp, #8]
	mov r4, #0
	str r4, [sp, #0xc]
	cmp r0, #0
	ble _0202AFC6
	ldr r5, [sp, #0x10]
	add r6, sp, #0x18
_0202AF8E:
	ldr r3, [sp, #4]
	add r7, r5, #0
	mov r2, #0x11
_0202AF94:
	ldmia r3!, {r0, r1}
	stmia r7!, {r0, r1}
	sub r2, r2, #1
	bne _0202AF94
	ldr r1, [r6]
	cmp r1, #0
	blt _0202AFAE
	add r2, r1, #0
	mov r0, #0x88
	mul r2, r0
	ldr r1, _0202B018 ; =0x0000FFFF
	ldr r0, [sp]
	strh r1, [r0, r2]
_0202AFAE:
	ldr r0, [sp, #4]
	add r5, #0x88
	add r0, #0x88
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	add r1, r0, #1
	ldr r0, [sp, #8]
	add r6, r6, #4
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _0202AF8E
_0202AFC6:
	mov r0, #0
	mov ip, r0
	mov r0, #0x88
	add r1, r4, #0
	mul r1, r0
	ldr r0, [sp, #0x10]
	ldr r3, [sp]
	add r5, r0, r1
_0202AFD6:
	ldrh r1, [r3]
	ldr r0, _0202B018 ; =0x0000FFFF
	cmp r1, r0
	beq _0202AFF4
	add r6, r3, #0
	add r7, r5, #0
	mov r2, #0x11
_0202AFE4:
	ldmia r6!, {r0, r1}
	stmia r7!, {r0, r1}
	sub r2, r2, #1
	bne _0202AFE4
	add r4, r4, #1
	add r5, #0x88
	cmp r4, #0x10
	bge _0202B000
_0202AFF4:
	mov r0, ip
	add r0, r0, #1
	add r3, #0x88
	mov ip, r0
	cmp r0, #0x10
	blt _0202AFD6
_0202B000:
	mov r2, #0x22
	ldr r0, [sp]
	ldr r1, [sp, #0x10]
	lsl r2, r2, #6
	bl memcpy
	ldr r0, [sp, #0x10]
	bl FreeToHeap
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_0202B018: .word 0x0000FFFF
	thumb_func_end sub_0202AF28

	thumb_func_start sub_0202B01C
sub_0202B01C: ; 0x0202B01C
	push {r3, r4, r5, r6}
	mov r3, #0
	add r4, r0, #0
_0202B022:
	ldr r2, [r4, #0x10]
	cmp r1, r2
	bne _0202B02E
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_0202B02E:
	add r3, r3, #1
	add r4, #0x88
	cmp r3, #0x10
	blt _0202B022
	mov r6, #0
	add r3, r6, #0
_0202B03A:
	add r4, r3, #0
	add r5, r0, #0
_0202B03E:
	ldr r2, [r5, #0x18]
	cmp r1, r2
	bne _0202B04A
	add r0, r6, #2
	pop {r3, r4, r5, r6}
	bx lr
_0202B04A:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x10
	blt _0202B03E
	add r6, r6, #1
	add r0, #0x88
	cmp r6, #0x10
	blt _0202B03A
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_0202B01C
