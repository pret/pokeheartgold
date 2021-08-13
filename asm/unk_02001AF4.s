	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02001AF4
sub_02001AF4: ; 0x02001AF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	str r3, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	add r6, r1, #0
	mov r1, #0x20
	add r7, r2, #0
	str r0, [sp, #4]
	bl AllocFromHeap
	add r4, r0, #0
	add r3, r5, #0
	ldmia r3!, {r0, r1}
	add r2, r4, #0
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r0, [sp, #4]
	bl sub_02015788
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x10]
	ldr r0, [sp]
	strb r0, [r4, #0x15]
	add r0, r4, #0
	bl sub_02001DE8
	strb r0, [r4, #0x16]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	mov r1, #0
	strb r0, [r4, #0x1c]
	strb r6, [r4, #0x17]
	strb r7, [r4, #0x18]
	ldrb r0, [r5, #8]
	bl sub_02002FAC
	add r6, r0, #0
	ldrb r0, [r5, #8]
	mov r1, #2
	bl sub_02002FAC
	add r0, r6, r0
	strb r0, [r4, #0x19]
	ldrb r0, [r5, #8]
	mov r1, #1
	bl sub_02002FAC
	add r6, r0, #0
	ldrb r0, [r5, #8]
	mov r1, #3
	bl sub_02002FAC
	add r0, r6, r0
	strb r0, [r4, #0x1a]
	add r0, r4, #0
	bl sub_02001E28
	add r0, r4, #0
	bl sub_02001EB4
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02001AF4

	thumb_func_start sub_02001B7C
sub_02001B7C: ; 0x02001B7C
	push {r4, lr}
	sub sp, #8
	add r4, sp, #0
	ldrb r4, [r4, #0x10]
	str r4, [sp]
	ldr r4, [sp, #0x14]
	str r4, [sp, #4]
	bl sub_02001AF4
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl sub_0201D578
	add r0, r4, #0
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_02001B7C

	thumb_func_start sub_02001B9C
sub_02001B9C: ; 0x02001B9C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldrb r0, [r5, #8]
	add r6, r1, #0
	add r4, r2, #0
	mov r1, #0
	bl sub_02002FAC
	add r1, r0, #0
	str r4, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r5, #0
	mov r2, #0
	add r3, r6, #0
	bl sub_02001B7C
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02001B9C

	thumb_func_start sub_02001BC4
sub_02001BC4: ; 0x02001BC4
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	beq _02001BD0
	ldrb r0, [r4, #0x15]
	strb r0, [r1]
_02001BD0:
	ldr r0, [r4, #0xc]
	bl sub_020157B8
	ldrb r0, [r4, #0x1c]
	add r1, r4, #0
	bl sub_0201AB80
	pop {r4, pc}
	thumb_func_end sub_02001BC4

	thumb_func_start sub_02001BE0
sub_02001BE0: ; 0x02001BE0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r1, #0
	ldr r2, _02001C8C ; =0x021D110C
	strb r1, [r4, #0x1b]
	ldr r2, [r2, #0x48]
	mov r5, #1
	add r3, r2, #0
	tst r3, r5
	beq _02001C06
	ldr r0, _02001C90 ; =0x000005DC
	bl sub_0200604C
	ldrb r0, [r4, #0x15]
	ldr r1, [r4]
	lsl r0, r0, #3
	add r0, r1, r0
	ldr r0, [r0, #4]
	pop {r3, r4, r5, pc}
_02001C06:
	ldr r3, [r4, #0x10]
	tst r3, r2
	beq _02001C16
	ldr r0, _02001C90 ; =0x000005DC
	bl sub_0200604C
	sub r0, r5, #3
	pop {r3, r4, r5, pc}
_02001C16:
	mov r3, #0x40
	tst r3, r2
	beq _02001C30
	ldr r2, _02001C90 ; =0x000005DC
	bl sub_02001C98
	cmp r0, #1
	bne _02001C2A
	add r0, r5, #0
	strb r0, [r4, #0x1b]
_02001C2A:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02001C30:
	mov r1, #0x80
	tst r1, r2
	beq _02001C4C
	ldr r2, _02001C90 ; =0x000005DC
	add r1, r5, #0
	bl sub_02001C98
	cmp r0, #1
	bne _02001C46
	mov r0, #2
	strb r0, [r4, #0x1b]
_02001C46:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02001C4C:
	mov r1, #0x20
	tst r1, r2
	beq _02001C68
	ldr r2, _02001C90 ; =0x000005DC
	mov r1, #2
	bl sub_02001C98
	cmp r0, #1
	bne _02001C62
	mov r0, #3
	strb r0, [r4, #0x1b]
_02001C62:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02001C68:
	mov r1, #0x10
	tst r2, r1
	beq _02001C84
	ldr r2, _02001C90 ; =0x000005DC
	mov r1, #3
	bl sub_02001C98
	cmp r0, #1
	bne _02001C7E
	mov r0, #4
	strb r0, [r4, #0x1b]
_02001C7E:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_02001C84:
	sub r1, #0x11
	add r0, r1, #0
	pop {r3, r4, r5, pc}
	nop
_02001C8C: .word 0x021D110C
_02001C90: .word 0x000005DC
	thumb_func_end sub_02001BE0

	thumb_func_start sub_02001C94
sub_02001C94: ; 0x02001C94
	ldrb r0, [r0, #0x15]
	bx lr
	thumb_func_end sub_02001C94

	thumb_func_start sub_02001C98
sub_02001C98: ; 0x02001C98
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r6, r2, #0
	ldrb r4, [r5, #0x15]
	bl sub_02001CF0
	cmp r0, #0
	bne _02001CB0
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02001CB0:
	ldrb r0, [r5, #8]
	mov r1, #6
	bl sub_02002FAC
	add r1, sp, #8
	add r7, r0, #0
	add r0, r5, #0
	add r1, #1
	add r2, sp, #8
	add r3, r4, #0
	bl sub_02001EE4
	mov r0, #8
	str r0, [sp]
	ldrb r0, [r5, #0x1a]
	add r3, sp, #8
	add r1, r7, #0
	str r0, [sp, #4]
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	ldr r0, [r5, #4]
	bl sub_0201DA74
	add r0, r5, #0
	bl sub_02001EB4
	add r0, r6, #0
	bl sub_0200604C
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02001C98

	thumb_func_start sub_02001CF0
sub_02001CF0: ; 0x02001CF0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	cmp r1, #0
	bne _02001D2E
	ldrb r6, [r5, #0xa]
	cmp r6, #1
	bhi _02001D02
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001D02:
	ldrb r4, [r5, #0x15]
	add r1, r6, #0
	add r0, r4, #0
	bl _s32_div_f
	cmp r1, #0
	bne _02001D26
	ldrb r0, [r5, #0xb]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	bne _02001D1C
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001D1C:
	sub r0, r6, #1
	add r0, r4, r0
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001D26:
	sub r0, r4, #1
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001D2E:
	cmp r1, #1
	bne _02001D66
	ldrb r1, [r5, #0xa]
	cmp r1, #1
	bhi _02001D3C
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001D3C:
	ldrb r6, [r5, #0x15]
	sub r4, r1, #1
	add r0, r6, #0
	bl _s32_div_f
	cmp r4, r1
	bne _02001D5E
	ldrb r0, [r5, #0xb]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	bne _02001D56
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001D56:
	sub r0, r6, r4
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001D5E:
	add r0, r6, #1
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001D66:
	cmp r1, #2
	bne _02001D9C
	ldrb r3, [r5, #9]
	cmp r3, #1
	bhi _02001D74
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001D74:
	ldrb r2, [r5, #0xa]
	ldrb r1, [r5, #0x15]
	cmp r1, r2
	bhs _02001D94
	ldrb r0, [r5, #0xb]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1e
	bne _02001D88
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001D88:
	sub r0, r3, #1
	mul r0, r2
	add r0, r1, r0
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001D94:
	sub r0, r1, r2
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001D9C:
	ldrb r2, [r5, #9]
	cmp r2, #1
	bhi _02001DA6
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001DA6:
	ldrb r1, [r5, #0xa]
	ldrb r0, [r5, #0x15]
	sub r2, r2, #1
	mul r2, r1
	cmp r0, r2
	blt _02001DC8
	ldrb r2, [r5, #0xb]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1e
	bne _02001DBE
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001DBE:
	bl _s32_div_f
	lsl r0, r1, #0x18
	asr r2, r0, #0x18
	b _02001DCE
_02001DC8:
	add r0, r0, r1
	lsl r0, r0, #0x18
	asr r2, r0, #0x18
_02001DCE:
	ldr r1, [r5]
	lsl r0, r2, #3
	add r0, r1, r0
	ldr r1, [r0, #4]
	mov r0, #2
	mvn r0, r0
	cmp r1, r0
	bne _02001DE2
	mov r0, #0
	pop {r4, r5, r6, pc}
_02001DE2:
	strb r2, [r5, #0x15]
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02001CF0

	thumb_func_start sub_02001DE8
sub_02001DE8: ; 0x02001DE8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r1, [r5, #9]
	ldrb r0, [r5, #0xa]
	mov r6, #0
	add r4, r6, #0
	mul r0, r1
	cmp r0, #0
	ble _02001E24
	add r7, r6, #0
_02001DFC:
	ldr r2, [r5]
	lsl r1, r4, #3
	ldr r1, [r2, r1]
	ldrb r0, [r5, #8]
	add r2, r7, #0
	bl sub_02002F30
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r6, r0
	bhs _02001E14
	add r6, r0, #0
_02001E14:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldrb r1, [r5, #9]
	ldrb r0, [r5, #0xa]
	mul r0, r1
	cmp r4, r0
	blt _02001DFC
_02001E24:
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02001DE8

	thumb_func_start sub_02001E28
sub_02001E28: ; 0x02001E28
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrb r0, [r5, #8]
	mov r1, #6
	bl sub_02002FAC
	add r1, r0, #0
	ldr r0, [r5, #4]
	bl sub_0201D978
	ldrb r0, [r5, #0x19]
	ldrb r1, [r5, #0x16]
	ldrb r7, [r5, #0x17]
	lsl r0, r0, #1
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	ldrb r0, [r5, #9]
	mov r6, #0
	cmp r0, #0
	bls _02001EB0
_02001E56:
	ldrb r2, [r5, #0xa]
	mov r4, #0
	cmp r2, #0
	bls _02001E9C
_02001E5E:
	ldrb r3, [r5, #0xb]
	mul r2, r6
	ldrb r0, [r5, #0x1a]
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x1c
	add r0, r0, r3
	ldrb r1, [r5, #0x18]
	mul r0, r4
	add r2, r4, r2
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r3, [r5]
	lsl r2, r2, #3
	ldr r2, [r3, r2]
	ldrb r1, [r5, #8]
	ldr r0, [r5, #4]
	add r3, r7, #0
	bl sub_020200A8
	add r0, r4, #1
	lsl r0, r0, #0x18
	ldrb r2, [r5, #0xa]
	lsr r4, r0, #0x18
	cmp r4, r2
	blo _02001E5E
_02001E9C:
	ldr r0, [sp, #0xc]
	add r0, r7, r0
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldrb r0, [r5, #9]
	cmp r6, r0
	blo _02001E56
_02001EB0:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02001E28

	thumb_func_start sub_02001EB4
sub_02001EB4: ; 0x02001EB4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrb r1, [r4, #0xb]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1e
	cmp r1, #1
	beq _02001EDE
	ldrb r3, [r4, #0x15]
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02001EE4
	add r3, sp, #0
	ldrb r2, [r3, #1]
	ldrb r3, [r3]
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #4]
	bl sub_020157F0
_02001EDE:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02001EB4

	thumb_func_start sub_02001EE4
sub_02001EE4: ; 0x02001EE4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r7, r3, #0
	ldrb r1, [r5, #0xa]
	add r0, r7, #0
	add r6, r2, #0
	bl _s32_div_f
	ldrb r2, [r5, #0x19]
	ldrb r1, [r5, #0x16]
	lsl r2, r2, #1
	add r1, r1, r2
	mul r1, r0
	strb r1, [r4]
	ldrb r1, [r5, #0xa]
	add r0, r7, #0
	bl _s32_div_f
	ldrb r2, [r5, #0xb]
	ldrb r3, [r5, #0x1a]
	ldrb r0, [r5, #0x18]
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1c
	add r2, r3, r2
	mul r2, r1
	add r0, r0, r2
	strb r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02001EE4

	thumb_func_start sub_02001F20
sub_02001F20: ; 0x02001F20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	ldr r5, [sp, #0x3c]
	str r2, [sp, #0xc]
	add r7, r0, #0
	str r1, [sp, #8]
	str r3, [sp, #0x10]
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xbf
	add r3, r5, #0
	bl sub_0200BAF8
	add r4, r0, #0
	mov r0, #2
	add r1, r5, #0
	bl sub_02014918
	add r1, r4, #0
	mov r2, #0x2a
	mov r3, #0
	add r6, r0, #0
	bl sub_02014960
	mov r3, #0x2b
	add r2, r3, #0
	add r0, r6, #0
	add r1, r4, #0
	sub r3, #0x2d
	bl sub_02014960
	add r0, r4, #0
	bl sub_0200BB44
	add r0, r5, #0
	mov r1, #1
	str r6, [sp, #0x14]
	bl sub_0201D39C
	add r1, r0, #0
	str r1, [sp, #0x18]
	mov r0, #0
	add r2, sp, #0x14
	strb r0, [r2, #8]
	mov r0, #1
	strb r0, [r2, #9]
	mov r0, #2
	strb r0, [r2, #0xa]
	ldrb r3, [r2, #0xb]
	mov r0, #0xf
	bic r3, r0
	strb r3, [r2, #0xb]
	ldrb r3, [r2, #0xb]
	mov r0, #0x30
	bic r3, r0
	strb r3, [r2, #0xb]
	ldrb r3, [r2, #0xb]
	mov r0, #0xc0
	bic r3, r0
	strb r3, [r2, #0xb]
	ldr r2, [sp, #8]
	add r0, r7, #0
	bl sub_0201D4F8
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #0x10]
	mov r1, #1
	bl sub_0200E580
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r3, sp, #0x28
	ldrb r3, [r3, #0x10]
	add r0, sp, #0x14
	mov r1, #8
	mov r2, #0
	bl sub_02001B7C
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02001F20

	thumb_func_start sub_02001FC8
sub_02001FC8: ; 0x02001FC8
	push {r4, lr}
	sub sp, #8
	mov r4, #0
	str r4, [sp]
	ldr r4, [sp, #0x10]
	str r4, [sp, #4]
	bl sub_02001F20
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_02001FC8

	thumb_func_start sub_02001FDC
sub_02001FDC: ; 0x02001FDC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02001BE0
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _02001FF8
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02001FFC
_02001FF8:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02001FDC

	thumb_func_start sub_02001FFC
sub_02001FFC: ; 0x02001FFC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	add r4, r1, #0
	mov r1, #0
	bl sub_0200E5D4
	ldr r0, [r5, #4]
	bl sub_0201D520
	ldr r1, [r5, #4]
	add r0, r4, #0
	bl sub_0201AB80
	ldr r0, [r5]
	bl sub_02014950
	add r0, r5, #0
	mov r1, #0
	bl sub_02001BC4
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02001FFC

	thumb_func_start StringCopy
StringCopy: ; 0x02002028
	ldrh r3, [r1]
	ldr r2, _02002044 ; =0x0000FFFF
	cmp r3, r2
	beq _0200203C
_02002030:
	add r1, r1, #2
	strh r3, [r0]
	ldrh r3, [r1]
	add r0, r0, #2
	cmp r3, r2
	bne _02002030
_0200203C:
	ldr r1, _02002044 ; =0x0000FFFF
	strh r1, [r0]
	bx lr
	nop
_02002044: .word 0x0000FFFF
	thumb_func_end StringCopy

	thumb_func_start StringCopyN
StringCopyN: ; 0x02002048
	push {r4, r5}
	mov r4, #0
	cmp r2, #0
	bls _02002060
	add r5, r0, #0
_02002052:
	ldrh r3, [r1]
	add r4, r4, #1
	add r1, r1, #2
	strh r3, [r5]
	add r5, r5, #2
	cmp r4, r2
	blo _02002052
_02002060:
	lsl r1, r2, #1
	add r0, r0, r1
	pop {r4, r5}
	bx lr
	thumb_func_end StringCopyN

	thumb_func_start StringLength
StringLength: ; 0x02002068
	ldrh r2, [r0]
	ldr r1, _02002080 ; =0x0000FFFF
	mov r3, #0
	cmp r2, r1
	beq _0200207C
_02002072:
	add r0, r0, #2
	ldrh r2, [r0]
	add r3, r3, #1
	cmp r2, r1
	bne _02002072
_0200207C:
	add r0, r3, #0
	bx lr
	.balign 4, 0
_02002080: .word 0x0000FFFF
	thumb_func_end StringLength

	thumb_func_start StringCompare
StringCompare: ; 0x02002084
	push {r3, r4}
	ldrh r4, [r0]
	ldrh r2, [r1]
	cmp r4, r2
	bne _020020A6
	ldr r2, _020020AC ; =0x0000FFFF
_02002090:
	cmp r4, r2
	bne _0200209A
	mov r0, #0
	pop {r3, r4}
	bx lr
_0200209A:
	add r0, r0, #2
	add r1, r1, #2
	ldrh r4, [r0]
	ldrh r3, [r1]
	cmp r4, r3
	beq _02002090
_020020A6:
	mov r0, #1
	pop {r3, r4}
	bx lr
	.balign 4, 0
_020020AC: .word 0x0000FFFF
	thumb_func_end StringCompare

	thumb_func_start StringCompareN
StringCompareN: ; 0x020020B0
	push {r3, r4, r5, r6}
	ldrh r6, [r1]
	ldrh r5, [r0]
	cmp r5, r6
	bne _020020E4
	ldr r3, _020020EC ; =0x0000FFFF
	add r4, r3, #0
_020020BE:
	cmp r2, #0
	bne _020020C8
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
_020020C8:
	cmp r5, r4
	bne _020020D6
	cmp r6, r3
	bne _020020D6
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
_020020D6:
	add r0, r0, #2
	add r1, r1, #2
	ldrh r6, [r1]
	ldrh r5, [r0]
	sub r2, r2, #1
	cmp r5, r6
	beq _020020BE
_020020E4:
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
	nop
_020020EC: .word 0x0000FFFF
	thumb_func_end StringCompareN

	thumb_func_start StringFill
StringFill: ; 0x020020F0
	push {r3, r4}
	mov r3, #0
	cmp r2, #0
	bls _02002104
	add r4, r0, #0
_020020FA:
	add r3, r3, #1
	strh r1, [r4]
	add r4, r4, #2
	cmp r3, r2
	blo _020020FA
_02002104:
	lsl r1, r3, #1
	add r0, r0, r1
	pop {r3, r4}
	bx lr
	thumb_func_end StringFill

	thumb_func_start StringFillEOS
StringFillEOS: ; 0x0200210C
	ldr r3, _02002114 ; =StringFill
	add r2, r1, #0
	ldr r1, _02002118 ; =0x0000FFFF
	bx r3
	.balign 4, 0
_02002114: .word StringFill
_02002118: .word 0x0000FFFF
	thumb_func_end StringFillEOS

	thumb_func_start PrintDecimalInteger
PrintDecimalInteger: ; 0x0200211C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	ldr r0, _02002194 ; =0x020F5690
	lsl r1, r3, #2
	ldr r4, [r0, r1]
	add r6, r2, #0
	cmp r4, #0
	beq _0200218C
_0200212E:
	add r0, r7, #0
	add r1, r4, #0
	bl _u32_div_f
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r0, r4, #0
	mul r0, r1
	sub r7, r7, r0
	cmp r6, #2
	bne _02002158
	cmp r1, #0xa
	blo _0200214C
	mov r0, #0xe2
	b _02002152
_0200214C:
	ldr r0, _02002198 ; =0x020F5674
	lsl r1, r1, #1
	ldrh r0, [r0, r1]
_02002152:
	strh r0, [r5]
	add r5, r5, #2
	b _02002180
_02002158:
	cmp r1, #0
	bne _02002160
	cmp r4, #1
	bne _02002176
_02002160:
	mov r6, #2
	cmp r1, #0xa
	blo _0200216A
	mov r0, #0xe2
	b _02002170
_0200216A:
	ldr r0, _02002198 ; =0x020F5674
	lsl r1, r1, #1
	ldrh r0, [r0, r1]
_02002170:
	strh r0, [r5]
	add r5, r5, #2
	b _02002180
_02002176:
	cmp r6, #1
	bne _02002180
	mov r0, #1
	strh r0, [r5]
	add r5, r5, #2
_02002180:
	add r0, r4, #0
	mov r1, #0xa
	bl _u32_div_f
	add r4, r0, #0
	bne _0200212E
_0200218C:
	ldr r0, _0200219C ; =0x0000FFFF
	strh r0, [r5]
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02002194: .word 0x020F5690
_02002198: .word 0x020F5674
_0200219C: .word 0x0000FFFF
	thumb_func_end PrintDecimalInteger

	thumb_func_start sub_020021A0
sub_020021A0: ; 0x020021A0
	push {r3, lr}
	ldr r1, _02002210 ; =0x021D110C
	ldr r2, [r1, #0x44]
	mov r1, #3
	tst r1, r2
	beq _020021C2
	ldrb r0, [r0]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	beq _020021C2
	ldr r1, _02002214 ; =0x02111884
	mov r0, #1
	ldrb r2, [r1, #3]
	bic r2, r0
	strb r2, [r1, #3]
	mov r0, #1
	pop {r3, pc}
_020021C2:
	ldr r1, _02002214 ; =0x02111884
	ldrb r0, [r1, #2]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	beq _0200220A
	ldr r0, _02002218 ; =0x021D114C
	ldrh r0, [r0, #0x26]
	cmp r0, #0
	bne _020021D8
	mov r0, #0
	pop {r3, pc}
_020021D8:
	ldrb r2, [r1, #3]
	lsl r0, r2, #0x1e
	lsr r0, r0, #0x1f
	beq _020021FE
	ldr r0, _0200221C ; =0x02111888
	bl sub_020252F4
	cmp r0, #0
	beq _020021FA
	ldr r1, _02002214 ; =0x02111884
	mov r0, #1
	ldrb r2, [r1, #3]
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strb r2, [r1, #3]
	pop {r3, pc}
_020021FA:
	mov r0, #0
	pop {r3, pc}
_020021FE:
	mov r0, #1
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strb r2, [r1, #3]
	pop {r3, pc}
_0200220A:
	mov r0, #0
	pop {r3, pc}
	nop
_02002210: .word 0x021D110C
_02002214: .word 0x02111884
_02002218: .word 0x021D114C
_0200221C: .word 0x02111888
	thumb_func_end sub_020021A0

	thumb_func_start sub_02002220
sub_02002220: ; 0x02002220
	push {r3, lr}
	ldr r0, _02002288 ; =0x021D110C
	ldr r1, [r0, #0x48]
	mov r0, #3
	tst r0, r1
	beq _0200223A
	ldr r1, _0200228C ; =0x02111884
	mov r0, #1
	ldrb r2, [r1, #3]
	bic r2, r0
	strb r2, [r1, #3]
	mov r0, #1
	pop {r3, pc}
_0200223A:
	ldr r1, _0200228C ; =0x02111884
	ldrb r0, [r1, #2]
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x1f
	beq _02002282
	ldr r0, _02002290 ; =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	bne _02002250
	mov r0, #0
	pop {r3, pc}
_02002250:
	ldrb r2, [r1, #3]
	lsl r0, r2, #0x1e
	lsr r0, r0, #0x1f
	beq _02002276
	ldr r0, _02002294 ; =0x02111888
	bl sub_02025320
	cmp r0, #0
	beq _02002272
	ldr r1, _0200228C ; =0x02111884
	mov r0, #1
	ldrb r2, [r1, #3]
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strb r2, [r1, #3]
	pop {r3, pc}
_02002272:
	mov r0, #0
	pop {r3, pc}
_02002276:
	mov r0, #1
	bic r2, r0
	mov r0, #1
	orr r2, r0
	strb r2, [r1, #3]
	pop {r3, pc}
_02002282:
	mov r0, #0
	pop {r3, pc}
	nop
_02002288: .word 0x021D110C
_0200228C: .word 0x02111884
_02002290: .word 0x021D114C
_02002294: .word 0x02111888
	thumb_func_end sub_02002220

	thumb_func_start sub_02002298
sub_02002298: ; 0x02002298
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x28
	ldrb r1, [r1]
	add r6, r4, #0
	add r6, #0x20
	cmp r1, #8
	bls _020022AE
	b _020027EA
_020022AE:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020022BA: ; jump table
	.short _020022CC - _020022BA - 2 ; case 0
	.short _0200269A - _020022BA - 2 ; case 1
	.short _020026B4 - _020022BA - 2 ; case 2
	.short _020026DE - _020022BA - 2 ; case 3
	.short _0200270E - _020022BA - 2 ; case 4
	.short _02002764 - _020022BA - 2 ; case 5
	.short _02002770 - _020022BA - 2 ; case 6
	.short _02002790 - _020022BA - 2 ; case 7
	.short _020027BA - _020022BA - 2 ; case 8
_020022CC:
	add r0, r6, #0
	bl sub_020021A0
	cmp r0, #0
	beq _020022F4
	add r0, r4, #0
	mov r1, #0
	add r0, #0x2a
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x29
	ldrb r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	beq _020022F4
	ldr r1, _020025B8 ; =0x02111884
	mov r0, #0x40
	ldrb r2, [r1, #2]
	orr r0, r2
	strb r0, [r1, #2]
_020022F4:
	add r0, r4, #0
	add r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200233E
	add r0, r4, #0
	add r0, #0x29
	ldrb r0, [r0]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	beq _0200233E
	add r0, r4, #0
	add r0, #0x2a
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x2a
	strb r1, [r0]
	ldr r0, _020025B8 ; =0x02111884
	ldrb r0, [r0, #2]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _02002338
	bl sub_02002220
	cmp r0, #0
	beq _02002338
	ldrb r1, [r6]
	mov r0, #0x10
	add r4, #0x2a
	orr r0, r1
	strb r0, [r6]
	mov r0, #0
	strb r0, [r4]
_02002338:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_0200233E:
	add r0, r4, #0
	add r0, #0x29
	ldrb r0, [r0]
	lsl r0, r0, #0x19
	lsr r1, r0, #0x19
	add r0, r4, #0
	add r0, #0x2a
	strb r1, [r0]
	ldr r0, [r4]
	ldrh r5, [r0]
	add r0, r0, #2
	str r0, [r4]
	mov r0, #0xf1
	lsl r0, r0, #8
	cmp r5, r0
	bne _02002362
	bl GF_AssertFail
_02002362:
	ldr r0, _020025BC ; =0x0000F0FD
	cmp r5, r0
	bgt _0200238C
	bge _020023C0
	ldr r1, _020025C0 ; =0x000025BD
	cmp r5, r1
	bgt _02002382
	sub r0, r1, #1
	cmp r5, r0
	blt _02002380
	bne _0200237A
	b _02002630
_0200237A:
	cmp r5, r1
	bne _02002380
	b _02002644
_02002380:
	b _02002658
_02002382:
	mov r0, #0xe
	lsl r0, r0, #0xc
	cmp r5, r0
	beq _020023A4
	b _02002658
_0200238C:
	ldr r0, _020025C4 ; =0x0000FFFE
	cmp r5, r0
	bgt _02002396
	beq _020023CC
	b _02002658
_02002396:
	add r0, r0, #1
	cmp r5, r0
	beq _0200239E
	b _02002658
_0200239E:
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_020023A4:
	ldrb r0, [r4, #0xa]
	mov r1, #1
	strh r0, [r4, #0xc]
	ldrb r0, [r4, #9]
	bl sub_02002FAC
	ldrh r1, [r4, #0x12]
	ldrh r2, [r4, #0xe]
	add sp, #0xc
	add r0, r1, r0
	add r0, r2, r0
	strh r0, [r4, #0xe]
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_020023C0:
	ldr r0, [r4]
	add sp, #0xc
	add r0, r0, #2
	str r0, [r4]
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_020023CC:
	ldr r0, [r4]
	sub r0, r0, #2
	str r0, [r4]
	bl sub_0201FB44
	lsl r0, r0, #0x10
	ldr r1, _020025C8 ; =0x0000FE06
	lsr r0, r0, #0x10
	cmp r0, r1
	bgt _0200240C
	blt _020023E4
	b _020025D0
_020023E4:
	mov r1, #2
	lsl r1, r1, #8
	sub r1, r0, r1
	cmp r1, #8
	bhi _02002416
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020023FA: ; jump table
	.short _02002470 - _020023FA - 2 ; case 0
	.short _020024F0 - _020023FA - 2 ; case 1
	.short _02002512 - _020023FA - 2 ; case 2
	.short _0200252A - _020023FA - 2 ; case 3
	.short _02002536 - _020023FA - 2 ; case 4
	.short _02002542 - _020023FA - 2 ; case 5
	.short _0200256E - _020023FA - 2 ; case 6
	.short _0200249C - _020023FA - 2 ; case 7
	.short _020024C6 - _020023FA - 2 ; case 8
_0200240C:
	mov r1, #0xff
	lsl r1, r1, #8
	cmp r0, r1
	bgt _02002418
	beq _02002422
_02002416:
	b _02002622
_02002418:
	add r1, r1, #1
	cmp r0, r1
	bne _02002420
	b _02002590
_02002420:
	b _02002622
_02002422:
	ldr r0, [r4]
	mov r1, #0
	bl sub_0201FB90
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0xff
	bne _02002452
	ldrb r0, [r4, #0x15]
	ldrb r2, [r4, #0x1b]
	sub r1, r0, #1
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	add r0, #0x64
	strb r0, [r4, #0x1b]
	cmp r2, #0x64
	blo _02002492
	cmp r2, #0x6b
	bhs _02002492
	sub r2, #0x64
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	b _0200245A
_02002452:
	cmp r0, #0x64
	blo _0200245A
	strb r0, [r4, #0x1b]
	b _02002622
_0200245A:
	lsl r1, r0, #1
	add r0, r1, #1
	strb r0, [r4, #0x15]
	add r0, r1, #2
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0x15]
	ldrb r1, [r4, #0x16]
	ldrb r2, [r4, #0x17]
	bl sub_0202036C
	b _02002622
_02002470:
	ldr r0, [r4]
	mov r1, #0
	bl sub_0201FB90
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	ldrh r1, [r4, #0xc]
	ldrh r2, [r4, #0xe]
	add r0, r4, #0
	bl sub_020204FC
	add r0, r4, #0
	add r0, #0x29
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bne _02002494
_02002492:
	b _02002622
_02002494:
	ldr r0, [r4, #4]
	bl sub_0201D578
	b _02002622
_0200249C:
	add r0, r4, #0
	mov r1, #7
	add r0, #0x28
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020027FC
	ldr r0, [r4]
	bl sub_0201FB1C
	str r0, [r4]
	mov r1, #0xe
	ldrh r2, [r0]
	lsl r1, r1, #0xc
	cmp r2, r1
	bne _020024C0
	add r0, r0, #2
	str r0, [r4]
_020024C0:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_020024C6:
	add r0, r4, #0
	mov r1, #8
	add r0, #0x28
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020027FC
	ldr r0, [r4]
	bl sub_0201FB1C
	str r0, [r4]
	mov r1, #0xe
	ldrh r2, [r0]
	lsl r1, r1, #0xc
	cmp r2, r1
	bne _020024EA
	add r0, r0, #2
	str r0, [r4]
_020024EA:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_020024F0:
	ldr r0, [r4]
	mov r1, #0
	bl sub_0201FB90
	add r1, r4, #0
	add r1, #0x2a
	strb r0, [r1]
	ldr r0, [r4]
	bl sub_0201FB1C
	str r0, [r4]
	mov r0, #6
	add r4, #0x28
	strb r0, [r4]
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002512:
	ldr r0, [r4]
	mov r1, #0
	bl sub_0201FB90
	strh r0, [r4, #0x2e]
	ldr r0, [r4]
	bl sub_0201FB1C
	str r0, [r4]
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_0200252A:
	ldr r0, [r4]
	mov r1, #0
	bl sub_0201FB90
	strh r0, [r4, #0xc]
	b _02002622
_02002536:
	ldr r0, [r4]
	mov r1, #0
	bl sub_0201FB90
	strh r0, [r4, #0xe]
	b _02002622
_02002542:
	ldr r0, [r4, #4]
	bl sub_0201EE90
	lsl r5, r0, #3
	ldrb r0, [r4, #9]
	ldrh r2, [r4, #0x10]
	ldr r1, [r4]
	bl sub_02002EFC
	cmp r0, r5
	bge _02002568
	sub r1, r5, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	ldrb r2, [r4, #0xa]
	asr r0, r0, #1
	add r0, r2, r0
	strh r0, [r4, #0xc]
	b _02002622
_02002568:
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	b _02002622
_0200256E:
	ldr r0, [r4, #4]
	bl sub_0201EE90
	lsl r5, r0, #3
	ldrb r0, [r4, #9]
	ldrh r2, [r4, #0x10]
	ldr r1, [r4]
	bl sub_02002EFC
	cmp r0, r5
	bge _0200258A
	sub r0, r5, r0
	strh r0, [r4, #0xc]
	b _02002622
_0200258A:
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	b _02002622
_02002590:
	ldr r0, [r4]
	mov r1, #0
	bl sub_0201FB90
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #0x64
	beq _020025A6
	cmp r0, #0xc8
	beq _020025AE
	b _02002622
_020025A6:
	mov r0, #0
	strh r0, [r4, #0x18]
	strb r0, [r4, #0x1a]
	b _02002622
_020025AE:
	ldr r0, _020025CC ; =0x0000FFFC
	strh r0, [r4, #0x18]
	mov r0, #0
	strb r0, [r4, #0x1a]
	b _02002622
	.balign 4, 0
_020025B8: .word 0x02111884
_020025BC: .word 0x0000F0FD
_020025C0: .word 0x000025BD
_020025C4: .word 0x0000FFFE
_020025C8: .word 0x0000FE06
_020025CC: .word 0x0000FFFC
_020025D0:
	ldr r0, [r4]
	mov r1, #0
	bl sub_0201FB90
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0xfe
	lsl r0, r0, #8
	cmp r1, r0
	beq _02002606
	add r0, r0, #1
	cmp r1, r0
	bne _02002622
	add r0, r4, #0
	mov r1, #2
	add r0, #0x28
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020027FC
	ldr r0, [r4]
	bl sub_0201FB1C
	str r0, [r4]
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002606:
	add r0, r4, #0
	mov r1, #3
	add r0, #0x28
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020027FC
	ldr r0, [r4]
	bl sub_0201FB1C
	str r0, [r4]
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002622:
	ldr r0, [r4]
	bl sub_0201FB1C
	str r0, [r4]
	add sp, #0xc
	mov r0, #2
	pop {r3, r4, r5, r6, pc}
_02002630:
	add r0, r4, #0
	mov r1, #2
	add r0, #0x28
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020027FC
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002644:
	add r0, r4, #0
	mov r1, #3
	add r0, #0x28
	strb r1, [r0]
	add r0, r4, #0
	bl sub_020027FC
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002658:
	ldrb r0, [r6]
	add r1, r5, #0
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	bl sub_02002E7C
	add r5, r0, #0
	ldrh r0, [r4, #0xc]
	add r2, r5, #0
	add r3, r5, #0
	str r0, [sp]
	ldrh r0, [r4, #0xe]
	add r2, #0x80
	add r3, #0x81
	str r0, [sp, #4]
	ldrh r0, [r4, #0x18]
	add r1, r5, #0
	str r0, [sp, #8]
	ldrb r2, [r2]
	ldrb r3, [r3]
	ldr r0, [r4, #4]
	bl sub_0201DACC
	add r5, #0x80
	ldrb r1, [r5]
	ldrh r0, [r4, #0x10]
	ldrh r2, [r4, #0xc]
	add sp, #0xc
	add r0, r1, r0
	add r0, r2, r0
	strh r0, [r4, #0xc]
	mov r0, #0
	pop {r3, r4, r5, r6, pc}
_0200269A:
	bl sub_02002B10
	cmp r0, #0
	beq _020026AE
	add r0, r4, #0
	bl sub_020029D8
	mov r0, #0
	add r4, #0x28
	strb r0, [r4]
_020026AE:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_020026B4:
	bl sub_02002AEC
	cmp r0, #0
	beq _020026D8
	add r0, r4, #0
	bl sub_020029D8
	ldrb r1, [r4, #0x16]
	ldr r0, [r4, #4]
	bl sub_0201D978
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	ldrb r0, [r4, #0xb]
	strh r0, [r4, #0xe]
	mov r0, #0
	add r4, #0x28
	strb r0, [r4]
_020026D8:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_020026DE:
	bl sub_02002AEC
	cmp r0, #0
	beq _02002708
	add r0, r4, #0
	bl sub_020029D8
	ldrb r0, [r4, #9]
	mov r1, #1
	bl sub_02002FAC
	ldrh r1, [r4, #0x12]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0x2b
	strb r1, [r0]
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	mov r0, #4
	add r4, #0x28
	strb r0, [r4]
_02002708:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_0200270E:
	add r0, #0x2b
	ldrb r2, [r0]
	cmp r2, #0
	beq _02002758
	cmp r2, #4
	ldrb r5, [r4, #0x16]
	bge _02002730
	lsl r3, r5, #4
	orr r3, r5
	lsl r3, r3, #0x18
	ldr r0, [r4, #4]
	mov r1, #0
	lsr r3, r3, #0x18
	bl sub_0201EC48
	mov r1, #0
	b _0200274A
_02002730:
	lsl r3, r5, #4
	orr r3, r5
	lsl r3, r3, #0x18
	ldr r0, [r4, #4]
	mov r1, #0
	mov r2, #4
	lsr r3, r3, #0x18
	bl sub_0201EC48
	add r0, r4, #0
	add r0, #0x2b
	ldrb r0, [r0]
	sub r1, r0, #4
_0200274A:
	add r0, r4, #0
	add r0, #0x2b
	strb r1, [r0]
	ldr r0, [r4, #4]
	bl sub_0201D578
	b _0200275E
_02002758:
	mov r0, #0
	add r4, #0x28
	strb r0, [r4]
_0200275E:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002764:
	mov r0, #0
	add r4, #0x28
	strb r0, [r4]
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002770:
	add r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _02002784
	add r0, r4, #0
	add r0, #0x2a
	ldrb r0, [r0]
	add r4, #0x2a
	sub r0, r0, #1
	b _02002788
_02002784:
	mov r0, #0
	add r4, #0x28
_02002788:
	add sp, #0xc
	strb r0, [r4]
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_02002790:
	bl sub_02002AEC
	cmp r0, #0
	beq _020027B4
	add r0, r4, #0
	bl sub_020029D8
	ldrb r1, [r4, #0x16]
	ldr r0, [r4, #4]
	bl sub_0201D978
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	ldrb r0, [r4, #0xb]
	strh r0, [r4, #0xe]
	mov r0, #0
	add r4, #0x28
	strb r0, [r4]
_020027B4:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_020027BA:
	bl sub_02002AEC
	cmp r0, #0
	beq _020027E4
	add r0, r4, #0
	bl sub_020029D8
	ldrb r0, [r4, #9]
	mov r1, #1
	bl sub_02002FAC
	ldrh r1, [r4, #0x12]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0x2b
	strb r1, [r0]
	ldrb r0, [r4, #0xa]
	strh r0, [r4, #0xc]
	mov r0, #4
	add r4, #0x28
	strb r0, [r4]
_020027E4:
	add sp, #0xc
	mov r0, #3
	pop {r3, r4, r5, r6, pc}
_020027EA:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02002298

	thumb_func_start sub_020027F0
sub_020027F0: ; 0x020027F0
	ldr r1, _020027F8 ; =0x02111884
	strh r0, [r1]
	bx lr
	nop
_020027F8: .word 0x02111884
	thumb_func_end sub_020027F0

	thumb_func_start sub_020027FC
sub_020027FC: ; 0x020027FC
	ldr r2, _02002830 ; =0x02111884
	add r1, r0, #0
	ldrb r2, [r2, #2]
	add r1, #0x20
	lsl r2, r2, #0x1d
	lsr r2, r2, #0x1f
	beq _02002814
	ldrb r3, [r1, #2]
	mov r2, #0xff
	bic r3, r2
	strb r3, [r1, #2]
	b _02002824
_02002814:
	ldrb r3, [r1, #1]
	mov r2, #0x60
	bic r3, r2
	strb r3, [r1, #1]
	ldrb r3, [r1, #1]
	mov r2, #0x1f
	bic r3, r2
	strb r3, [r1, #1]
_02002824:
	ldr r1, _02002830 ; =0x02111884
	ldr r3, _02002834 ; =sub_0200EB68
	ldr r0, [r0, #4]
	ldrh r1, [r1]
	bx r3
	nop
_02002830: .word 0x02111884
_02002834: .word sub_0200EB68
	thumb_func_end sub_020027FC

	thumb_func_start sub_02002838
sub_02002838: ; 0x02002838
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r5, r0, #0
	ldr r0, _020029D0 ; =0x02111884
	add r4, r5, #0
	ldrb r0, [r0, #2]
	add r4, #0x20
	lsl r1, r0, #0x1d
	lsr r1, r1, #0x1f
	bne _02002852
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	beq _02002854
_02002852:
	b _020029CC
_02002854:
	ldrb r0, [r4, #1]
	lsl r1, r0, #0x1b
	lsr r2, r1, #0x1b
	beq _02002872
	mov r1, #0x1f
	add r2, #0xff
	bic r0, r1
	lsl r1, r2, #0x18
	lsr r2, r1, #0x18
	mov r1, #0x1f
	and r1, r2
	orr r0, r1
	add sp, #0x30
	strb r0, [r4, #1]
	pop {r3, r4, r5, r6, r7, pc}
_02002872:
	ldr r0, [r5, #4]
	bl sub_0201EE8C
	str r0, [sp, #0x20]
	ldr r0, [r5, #4]
	bl sub_0201EE98
	str r0, [sp, #0x24]
	ldr r0, [r5, #4]
	bl sub_0201EE9C
	add r7, r0, #0
	ldr r0, [r5, #4]
	bl sub_0201EE90
	str r0, [sp, #0x28]
	ldr r0, [r5, #4]
	bl sub_0201EE94
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, _020029D0 ; =0x02111884
	add r7, r7, r1
	ldrh r6, [r0]
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	add r2, r6, #0
	add r0, r1, r0
	str r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x18]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	str r2, [sp, #0x2c]
	add r2, #0x12
	str r2, [sp, #0x2c]
	ldrb r2, [r4, #1]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x20]
	lsl r2, r2, #0x19
	lsr r3, r2, #0x1e
	ldr r2, _020029D4 ; =0x020F56BC
	ldr r0, [r0]
	ldrb r2, [r2, r3]
	lsl r3, r2, #2
	ldr r2, [sp, #0x2c]
	add r2, r2, r3
	ldr r3, [sp, #0x18]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl sub_0201C8C4
	ldr r0, [sp, #0x1c]
	add r2, r6, #0
	add r0, r0, #2
	str r0, [sp, #0x10]
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	add r2, #0x13
	mov ip, r2
	ldrb r2, [r4, #1]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x20]
	lsl r2, r2, #0x19
	lsr r3, r2, #0x1e
	ldr r2, _020029D4 ; =0x020F56BC
	ldr r0, [r0]
	ldrb r2, [r2, r3]
	mov r3, ip
	lsl r2, r2, #2
	add r2, r3, r2
	ldr r3, [sp, #0x10]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl sub_0201C8C4
	add r0, r7, #1
	str r0, [sp, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldrb r2, [r4, #1]
	add r7, r6, #0
	ldr r0, [r5, #4]
	lsl r2, r2, #0x19
	lsr r3, r2, #0x1e
	ldr r2, _020029D4 ; =0x020F56BC
	add r7, #0x14
	ldrb r2, [r2, r3]
	ldr r3, [sp, #0x18]
	ldr r0, [r0]
	lsl r2, r2, #2
	add r2, r7, r2
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r1, [sp, #0x20]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl sub_0201C8C4
	ldr r0, [sp, #0x14]
	add r6, #0x15
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldrb r2, [r4, #1]
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x20]
	lsl r2, r2, #0x19
	lsr r3, r2, #0x1e
	ldr r2, _020029D4 ; =0x020F56BC
	ldr r0, [r0]
	ldrb r2, [r2, r3]
	ldr r3, [sp, #0x10]
	lsl r2, r2, #2
	add r2, r6, r2
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl sub_0201C8C4
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x20]
	ldr r0, [r0]
	bl sub_0201BF7C
	ldrb r1, [r4, #1]
	mov r0, #0x1f
	bic r1, r0
	mov r0, #8
	orr r0, r1
	strb r0, [r4, #1]
	ldrb r2, [r4, #1]
	mov r1, #0x60
	add r0, r2, #0
	bic r0, r1
	lsl r1, r2, #0x19
	lsr r1, r1, #0x1e
	add r1, r1, #1
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x19
	orr r0, r1
	strb r0, [r4, #1]
_020029CC:
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020029D0: .word 0x02111884
_020029D4: .word 0x020F56BC
	thumb_func_end sub_02002838

	thumb_func_start sub_020029D8
sub_020029D8: ; 0x020029D8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	ldr r0, _02002A80 ; =0x02111884
	ldrb r0, [r0, #2]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	bne _02002A7C
	ldr r0, [r5, #4]
	bl sub_0201EE8C
	str r0, [sp, #0x10]
	ldr r0, [r5, #4]
	bl sub_0201EE98
	str r0, [sp, #0x14]
	ldr r0, [r5, #4]
	bl sub_0201EE9C
	add r6, r0, #0
	ldr r0, [r5, #4]
	bl sub_0201EE90
	str r0, [sp, #0x18]
	ldr r0, [r5, #4]
	bl sub_0201EE94
	sub r0, r0, #2
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	ldr r0, _02002A80 ; =0x02111884
	add r7, r6, r1
	ldrh r4, [r0]
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0x18]
	add r2, r4, #0
	add r6, r1, r0
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r5, #4]
	add r2, #0xa
	add r3, r6, #1
	lsl r2, r2, #0x10
	lsl r3, r3, #0x18
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl sub_0201C8C4
	lsl r0, r7, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	mov r0, #0x10
	str r0, [sp, #0xc]
	ldr r0, [r5, #4]
	add r4, #0xb
	add r3, r6, #2
	lsl r2, r4, #0x10
	lsl r3, r3, #0x18
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	lsr r2, r2, #0x10
	lsr r3, r3, #0x18
	bl sub_0201C8C4
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x10]
	ldr r0, [r0]
	bl sub_0201BF7C
_02002A7C:
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02002A80: .word 0x02111884
	thumb_func_end sub_020029D8

	thumb_func_start sub_02002A84
sub_02002A84: ; 0x02002A84
	push {r3, lr}
	bl sub_02002220
	cmp r0, #0
	beq _02002AA2
	ldr r0, _02002AA8 ; =0x000005DC
	bl sub_0200604C
	ldr r1, _02002AAC ; =0x02111884
	mov r0, #0x80
	ldrb r2, [r1, #2]
	orr r0, r2
	strb r0, [r1, #2]
	mov r0, #1
	pop {r3, pc}
_02002AA2:
	mov r0, #0
	pop {r3, pc}
	nop
_02002AA8: .word 0x000005DC
_02002AAC: .word 0x02111884
	thumb_func_end sub_02002A84

	thumb_func_start sub_02002AB0
sub_02002AB0: ; 0x02002AB0
	push {r4, lr}
	add r2, r0, #0
	add r2, #0x20
	ldrb r1, [r2, #2]
	add r4, r1, #0
	cmp r4, #0x64
	bne _02002AC2
	mov r0, #1
	pop {r4, pc}
_02002AC2:
	mov r3, #0xff
	bic r1, r3
	add r3, r4, #1
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	orr r1, r3
	strb r1, [r2, #2]
	ldr r1, _02002AE8 ; =0x02111884
	ldrb r1, [r1, #2]
	lsl r1, r1, #0x1a
	lsr r1, r1, #0x1f
	beq _02002AE4
	bl sub_02002A84
	pop {r4, pc}
_02002AE4:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02002AE8: .word 0x02111884
	thumb_func_end sub_02002AB0

	thumb_func_start sub_02002AEC
sub_02002AEC: ; 0x02002AEC
	push {r4, lr}
	ldr r1, _02002B0C ; =0x02111884
	add r4, r0, #0
	ldrb r1, [r1, #2]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	beq _02002B00
	bl sub_02002AB0
	pop {r4, pc}
_02002B00:
	bl sub_02002838
	add r0, r4, #0
	bl sub_02002A84
	pop {r4, pc}
	.balign 4, 0
_02002B0C: .word 0x02111884
	thumb_func_end sub_02002AEC

	thumb_func_start sub_02002B10
sub_02002B10: ; 0x02002B10
	push {r3, lr}
	ldr r1, _02002B30 ; =0x02111884
	ldrb r1, [r1, #2]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	beq _02002B26
	bl sub_02002AB0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
_02002B26:
	bl sub_02002A84
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
_02002B30: .word 0x02111884
	thumb_func_end sub_02002B10

	thumb_func_start sub_02002B34
sub_02002B34: ; 0x02002B34
	ldr r2, _02002B4C ; =0x02111884
	mov r1, #1
	ldrb r3, [r2, #2]
	lsl r0, r0, #0x18
	bic r3, r1
	lsr r1, r0, #0x18
	mov r0, #1
	and r0, r1
	orr r0, r3
	strb r0, [r2, #2]
	bx lr
	nop
_02002B4C: .word 0x02111884
	thumb_func_end sub_02002B34

	thumb_func_start sub_02002B50
sub_02002B50: ; 0x02002B50
	push {r3, r4}
	ldr r1, _02002B88 ; =0x02111884
	mov r3, #4
	ldrb r2, [r1, #2]
	mov r4, #1
	bic r2, r3
	add r3, r0, #0
	and r3, r4
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	lsl r3, r3, #0x1f
	lsr r3, r3, #0x1d
	orr r2, r3
	asr r0, r0, #1
	and r0, r4
	strb r2, [r1, #2]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r2, [r1, #2]
	mov r3, #0x20
	lsr r0, r0, #0x1a
	bic r2, r3
	orr r0, r2
	strb r0, [r1, #2]
	pop {r3, r4}
	bx lr
	nop
_02002B88: .word 0x02111884
	thumb_func_end sub_02002B50

	thumb_func_start sub_02002B8C
sub_02002B8C: ; 0x02002B8C
	ldr r2, _02002BA4 ; =0x02111884
	lsl r0, r0, #0x18
	ldrb r3, [r2, #2]
	lsr r0, r0, #0x18
	mov r1, #0x10
	lsl r0, r0, #0x1f
	bic r3, r1
	lsr r0, r0, #0x1b
	orr r0, r3
	strb r0, [r2, #2]
	bx lr
	nop
_02002BA4: .word 0x02111884
	thumb_func_end sub_02002B8C

	thumb_func_start sub_02002BA8
sub_02002BA8: ; 0x02002BA8
	ldr r2, _02002BC0 ; =0x02111884
	lsl r0, r0, #0x18
	ldrb r3, [r2, #2]
	lsr r0, r0, #0x18
	mov r1, #2
	lsl r0, r0, #0x1f
	bic r3, r1
	lsr r0, r0, #0x1e
	orr r0, r3
	strb r0, [r2, #2]
	bx lr
	nop
_02002BC0: .word 0x02111884
	thumb_func_end sub_02002BA8

	thumb_func_start sub_02002BC4
sub_02002BC4: ; 0x02002BC4
	ldr r0, _02002BD0 ; =0x02111884
	ldrb r0, [r0, #2]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1f
	bx lr
	nop
_02002BD0: .word 0x02111884
	thumb_func_end sub_02002BC4

	thumb_func_start sub_02002BD4
sub_02002BD4: ; 0x02002BD4
	ldr r1, _02002BE0 ; =0x02111884
	mov r0, #0x40
	ldrb r2, [r1, #2]
	bic r2, r0
	strb r2, [r1, #2]
	bx lr
	.balign 4, 0
_02002BE0: .word 0x02111884
	thumb_func_end sub_02002BD4

	thumb_func_start sub_02002BE4
sub_02002BE4: ; 0x02002BE4
	ldr r0, _02002BF0 ; =0x02111884
	ldrb r0, [r0, #2]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bx lr
	nop
_02002BF0: .word 0x02111884
	thumb_func_end sub_02002BE4

	thumb_func_start sub_02002BF4
sub_02002BF4: ; 0x02002BF4
	ldr r1, _02002C00 ; =0x02111884
	mov r0, #0x80
	ldrb r2, [r1, #2]
	bic r2, r0
	strb r2, [r1, #2]
	bx lr
	.balign 4, 0
_02002C00: .word 0x02111884
	thumb_func_end sub_02002BF4

	thumb_func_start sub_02002C04
sub_02002C04: ; 0x02002C04
	ldr r0, _02002C1C ; =0x02111884
	ldrb r1, [r0, #2]
	lsl r1, r1, #0x1b
	lsr r1, r1, #0x1f
	beq _02002C16
	ldrb r0, [r0, #3]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bx lr
_02002C16:
	mov r0, #0
	bx lr
	nop
_02002C1C: .word 0x02111884
	thumb_func_end sub_02002C04

	thumb_func_start sub_02002C20
sub_02002C20: ; 0x02002C20
	ldr r2, _02002C3C ; =0x02111884
	mov r1, #2
	ldrb r3, [r2, #3]
	orr r1, r3
	strb r1, [r2, #3]
	ldrb r1, [r0]
	strb r1, [r2, #4]
	ldrb r1, [r0, #1]
	strb r1, [r2, #5]
	ldrb r1, [r0, #2]
	strb r1, [r2, #6]
	ldrb r0, [r0, #3]
	strb r0, [r2, #7]
	bx lr
	.balign 4, 0
_02002C3C: .word 0x02111884
	thumb_func_end sub_02002C20

	thumb_func_start sub_02002C40
sub_02002C40: ; 0x02002C40
	ldr r1, _02002C5C ; =0x02111884
	mov r0, #2
	ldrb r2, [r1, #3]
	bic r2, r0
	strb r2, [r1, #3]
	mov r2, #0
	strb r2, [r1, #4]
	mov r0, #0xc0
	strb r0, [r1, #5]
	strb r2, [r1, #6]
	mov r0, #0xff
	strb r0, [r1, #7]
	bx lr
	nop
_02002C5C: .word 0x02111884
	thumb_func_end sub_02002C40

	thumb_func_start sub_02002C60
sub_02002C60: ; 0x02002C60
	push {r3, lr}
	cmp r0, #0
	bne _02002C7A
	mov r0, #1
	bl sub_02002B34
	mov r0, #3
	bl sub_02002B50
	mov r0, #1
	bl sub_02002B8C
	pop {r3, pc}
_02002C7A:
	mov r0, #1
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B34
	mov r0, #0
	bl sub_02002B8C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02002C60

	thumb_func_start sub_02002C90
sub_02002C90: ; 0x02002C90
	push {r3, lr}
	mov r0, #0
	bl sub_02002B34
	mov r0, #0
	bl sub_02002B50
	mov r0, #0
	bl sub_02002B8C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02002C90

	thumb_func_start sub_02002CA8
sub_02002CA8: ; 0x02002CA8
	push {r4, lr}
	ldr r0, _02002CE0 ; =0x02111890
	ldr r4, _02002CE4 ; =0x0211188C
	mov r1, #0
	str r0, [r4]
	add r2, r1, #0
	add r0, r1, #0
_02002CB6:
	ldr r3, [r4]
	add r3, r3, r2
	add r3, #0x84
	str r0, [r3]
	ldr r3, [r4]
	add r3, r3, r2
	add r3, #0x9c
	str r0, [r3]
	ldr r3, [r4]
	add r2, r2, #4
	add r3, r3, r1
	add r3, #0xb4
	add r1, r1, #1
	strb r0, [r3]
	cmp r1, #6
	blo _02002CB6
	ldr r0, _02002CE8 ; =0x020F56D8
	bl sub_0201FFE0
	pop {r4, pc}
	nop
_02002CE0: .word 0x02111890
_02002CE4: .word 0x0211188C
_02002CE8: .word 0x020F56D8
	thumb_func_end sub_02002CA8

	thumb_func_start sub_02002CEC
sub_02002CEC: ; 0x02002CEC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02002D34 ; =0x0211188C
	lsl r4, r5, #2
	ldr r0, [r0]
	add r2, r0, r4
	add r2, #0x9c
	ldr r2, [r2]
	cmp r2, #0
	bne _02002D28
	str r1, [sp]
	ldr r1, _02002D38 ; =0x020F56C0
	ldr r3, _02002D3C ; =0x020F56C2
	ldrh r1, [r1, r4]
	ldrh r3, [r3, r4]
	mov r0, #0x10
	mov r2, #1
	bl sub_02025E88
	ldr r2, _02002D34 ; =0x0211188C
	ldr r1, [r2]
	add r1, r1, r4
	add r1, #0x9c
	str r0, [r1]
	ldr r0, [r2]
	mov r1, #1
	add r0, r0, r5
	add r0, #0xb4
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_02002D28:
	add r0, #0xb4
	ldrsb r1, [r0, r5]
	add r1, r1, #1
	strb r1, [r0, r5]
	pop {r3, r4, r5, pc}
	nop
_02002D34: .word 0x0211188C
_02002D38: .word 0x020F56C0
_02002D3C: .word 0x020F56C2
	thumb_func_end sub_02002CEC

	thumb_func_start sub_02002D40
sub_02002D40: ; 0x02002D40
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #6
	blt _02002D4E
	bl GF_AssertFail
_02002D4E:
	ldr r0, _02002D78 ; =0x0211188C
	lsl r4, r4, #2
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02002D62
	bl GF_AssertFail
_02002D62:
	ldr r0, _02002D78 ; =0x0211188C
	mov r1, #0
	ldr r0, [r0]
	add r2, r5, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_02025ED8
	pop {r3, r4, r5, pc}
	nop
_02002D78: .word 0x0211188C
	thumb_func_end sub_02002D40

	thumb_func_start sub_02002D7C
sub_02002D7C: ; 0x02002D7C
	push {r4, lr}
	add r4, r0, #0
	cmp r4, #6
	blt _02002D88
	bl GF_AssertFail
_02002D88:
	ldr r0, _02002DB0 ; =0x0211188C
	lsl r4, r4, #2
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02002D9C
	bl GF_AssertFail
_02002D9C:
	ldr r0, _02002DB0 ; =0x0211188C
	mov r1, #1
	ldr r0, [r0]
	mov r2, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_02025ED8
	pop {r4, pc}
	.balign 4, 0
_02002DB0: .word 0x0211188C
	thumb_func_end sub_02002D7C

	thumb_func_start sub_02002DB4
sub_02002DB4: ; 0x02002DB4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	cmp r4, #6
	blt _02002DC0
	bl GF_AssertFail
_02002DC0:
	ldr r0, _02002E74 ; =0x0211188C
	ldr r0, [r0]
	add r1, r0, r4
	mov r0, #0xb4
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _02002DD2
	bl GF_AssertFail
_02002DD2:
	ldr r0, _02002E74 ; =0x0211188C
	ldr r1, [r0]
	add r1, #0xb4
	ldrsb r0, [r1, r4]
	cmp r0, #0
	ble _02002DE2
	sub r0, r0, #1
	strb r0, [r1, r4]
_02002DE2:
	ldr r0, _02002E74 ; =0x0211188C
	ldr r6, [r0]
	mov r0, #0xb4
	add r1, r6, r4
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _02002E70
	lsl r7, r4, #2
	add r0, r6, r7
	add r0, #0x84
	ldr r0, [r0]
	mov ip, r0
	cmp r0, #0
	beq _02002E50
	ldr r2, _02002E78 ; =0x020F56C0
	mov r1, #0
	ldrh r0, [r2, r7]
	add r3, r6, #0
_02002E06:
	cmp r1, r4
	beq _02002E26
	ldrh r5, [r2]
	cmp r5, r0
	bne _02002E26
	add r5, r3, #0
	add r5, #0x9c
	ldr r5, [r5]
	cmp r5, #0
	beq _02002E26
	lsl r0, r1, #2
	add r2, r6, r0
	add r2, #0x84
	mov r0, ip
	str r0, [r2]
	b _02002E30
_02002E26:
	add r1, r1, #1
	add r2, r2, #4
	add r3, r3, #4
	cmp r1, #6
	blo _02002E06
_02002E30:
	cmp r1, #6
	bne _02002E50
	ldr r0, _02002E74 ; =0x0211188C
	lsl r5, r4, #2
	ldr r0, [r0]
	add r0, r0, r5
	add r0, #0x84
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _02002E74 ; =0x0211188C
	mov r1, #0
	ldr r0, [r0]
	add r0, r0, r5
	add r0, #0x84
	str r1, [r0]
_02002E50:
	ldr r0, _02002E74 ; =0x0211188C
	ldr r0, [r0]
	add r0, r0, r7
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	beq _02002E70
	bl sub_02025EC0
	ldr r0, _02002E74 ; =0x0211188C
	mov r2, #0
	ldr r1, [r0]
	lsl r0, r4, #2
	add r0, r1, r0
	add r0, #0x9c
	str r2, [r0]
_02002E70:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02002E74: .word 0x0211188C
_02002E78: .word 0x020F56C0
	thumb_func_end sub_02002DB4

	thumb_func_start sub_02002E7C
sub_02002E7C: ; 0x02002E7C
	push {r3, lr}
	ldr r2, _02002E94 ; =0x0211188C
	lsl r0, r0, #2
	ldr r2, [r2]
	add r0, r2, r0
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_0202604C
	ldr r0, _02002E94 ; =0x0211188C
	ldr r0, [r0]
	pop {r3, pc}
	.balign 4, 0
_02002E94: .word 0x0211188C
	thumb_func_end sub_02002E7C

	thumb_func_start sub_02002E98
sub_02002E98: ; 0x02002E98
	push {r4, lr}
	add r3, r1, #0
	add r3, #0x20
	ldrb r2, [r3, #1]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1f
	bne _02002EC0
	ldrb r2, [r3]
	mov r4, #0xf
	lsl r0, r0, #0x18
	bic r2, r4
	lsr r4, r0, #0x18
	mov r0, #0xf
	and r0, r4
	orr r0, r2
	strb r0, [r3]
	ldrb r2, [r3, #1]
	mov r0, #0x80
	orr r0, r2
	strb r0, [r3, #1]
_02002EC0:
	add r0, r1, #0
	bl sub_02002298
	pop {r4, pc}
	thumb_func_end sub_02002E98

	thumb_func_start sub_02002EC8
sub_02002EC8: ; 0x02002EC8
	push {r4, r5, r6, lr}
	lsl r4, r0, #2
	ldr r0, _02002EF8 ; =0x0211188C
	add r5, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02002EE2
	bl GF_AssertFail
_02002EE2:
	ldr r0, _02002EF8 ; =0x0211188C
	add r1, r5, #0
	ldr r0, [r0]
	add r2, r6, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_020261CC
	pop {r4, r5, r6, pc}
	nop
_02002EF8: .word 0x0211188C
	thumb_func_end sub_02002EC8

	thumb_func_start sub_02002EFC
sub_02002EFC: ; 0x02002EFC
	push {r4, r5, r6, lr}
	lsl r4, r0, #2
	ldr r0, _02002F2C ; =0x0211188C
	add r5, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02002F16
	bl GF_AssertFail
_02002F16:
	ldr r0, _02002F2C ; =0x0211188C
	add r1, r5, #0
	ldr r0, [r0]
	add r2, r6, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_02026218
	pop {r4, r5, r6, pc}
	nop
_02002F2C: .word 0x0211188C
	thumb_func_end sub_02002EFC

	thumb_func_start sub_02002F30
sub_02002F30: ; 0x02002F30
	push {r4, r5, r6, lr}
	lsl r4, r0, #2
	ldr r0, _02002F64 ; =0x0211188C
	add r5, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02002F4A
	bl GF_AssertFail
_02002F4A:
	add r0, r5, #0
	bl sub_02026AA4
	add r1, r0, #0
	ldr r0, _02002F64 ; =0x0211188C
	add r2, r6, #0
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_020261CC
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02002F64: .word 0x0211188C
	thumb_func_end sub_02002F30

	thumb_func_start sub_02002F68
sub_02002F68: ; 0x02002F68
	push {r4, r5, r6, lr}
	lsl r4, r0, #2
	ldr r0, _02002FA8 ; =0x0211188C
	add r6, r1, #0
	ldr r0, [r0]
	add r5, r2, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02002F82
	bl GF_AssertFail
_02002F82:
	add r0, r5, #0
	bl sub_020263AC
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02026B88
	add r0, r5, #0
	bl sub_02026AA4
	add r1, r0, #0
	ldr r0, _02002FA8 ; =0x0211188C
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_02026270
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02002FA8: .word 0x0211188C
	thumb_func_end sub_02002F68

	thumb_func_start sub_02002FAC
sub_02002FAC: ; 0x02002FAC
	mov r2, #0
	cmp r1, #7
	bhi _0200300C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02002FBE: ; jump table
	.short _02002FCE - _02002FBE - 2 ; case 0
	.short _02002FD6 - _02002FBE - 2 ; case 1
	.short _02002FDE - _02002FBE - 2 ; case 2
	.short _02002FE6 - _02002FBE - 2 ; case 3
	.short _02002FEE - _02002FBE - 2 ; case 4
	.short _02002FF6 - _02002FBE - 2 ; case 5
	.short _02002FFE - _02002FBE - 2 ; case 6
	.short _02003006 - _02002FBE - 2 ; case 7
_02002FCE:
	lsl r1, r0, #3
	ldr r0, _02003010 ; =0x020F56D8
	ldrb r2, [r0, r1]
	b _0200300C
_02002FD6:
	lsl r1, r0, #3
	ldr r0, _02003014 ; =0x020F56D9
	ldrb r2, [r0, r1]
	b _0200300C
_02002FDE:
	lsl r1, r0, #3
	ldr r0, _02003018 ; =0x020F56DA
	ldrb r2, [r0, r1]
	b _0200300C
_02002FE6:
	lsl r1, r0, #3
	ldr r0, _0200301C ; =0x020F56DB
	ldrb r2, [r0, r1]
	b _0200300C
_02002FEE:
	lsl r1, r0, #3
	ldr r0, _02003020 ; =0x020F56DC
	ldrb r2, [r0, r1]
	b _0200300C
_02002FF6:
	lsl r1, r0, #3
	ldr r0, _02003024 ; =0x020F56DD
	ldrb r2, [r0, r1]
	b _0200300C
_02002FFE:
	lsl r1, r0, #3
	ldr r0, _02003028 ; =0x020F56DE
	ldrb r2, [r0, r1]
	b _0200300C
_02003006:
	lsl r1, r0, #3
	ldr r0, _0200302C ; =0x020F56DF
	ldrb r2, [r0, r1]
_0200300C:
	add r0, r2, #0
	bx lr
	.balign 4, 0
_02003010: .word 0x020F56D8
_02003014: .word 0x020F56D9
_02003018: .word 0x020F56DA
_0200301C: .word 0x020F56DB
_02003020: .word 0x020F56DC
_02003024: .word 0x020F56DD
_02003028: .word 0x020F56DE
_0200302C: .word 0x020F56DF
	thumb_func_end sub_02002FAC

	thumb_func_start sub_02003030
sub_02003030: ; 0x02003030
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x20
	str r0, [sp]
	add r3, r1, #0
	str r2, [sp, #4]
	mov r0, #0x10
	mov r1, #7
	add r2, r4, #0
	bl sub_02007938
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_02003030

	thumb_func_start sub_0200304C
sub_0200304C: ; 0x0200304C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x20
	str r0, [sp]
	add r3, r1, #0
	str r2, [sp, #4]
	mov r0, #0x10
	mov r1, #8
	add r2, r4, #0
	bl sub_02007938
	add sp, #8
	pop {r4, pc}
	thumb_func_end sub_0200304C

	thumb_func_start sub_02003068
sub_02003068: ; 0x02003068
	push {r4, r5, r6, lr}
	lsl r4, r0, #2
	ldr r0, _0200309C ; =0x0211188C
	add r5, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _02003082
	bl GF_AssertFail
_02003082:
	add r0, r5, #0
	bl sub_02026AA4
	add r1, r0, #0
	ldr r0, _0200309C ; =0x0211188C
	add r2, r6, #0
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_020262D4
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0200309C: .word 0x0211188C
	thumb_func_end sub_02003068

	thumb_func_start sub_020030A0
sub_020030A0: ; 0x020030A0
	push {r4, lr}
	add r4, r3, #0
	bl sub_02002F30
	cmp r0, r4
	bhs _020030B2
	sub r0, r4, r0
	lsr r0, r0, #1
	pop {r4, pc}
_020030B2:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020030A0

	thumb_func_start sub_020030B8
sub_020030B8: ; 0x020030B8
	push {r3, r4, r5, lr}
	lsl r4, r0, #2
	ldr r0, _020030E4 ; =0x0211188C
	add r5, r1, #0
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _020030D0
	bl GF_AssertFail
_020030D0:
	ldr r0, _020030E4 ; =0x0211188C
	add r1, r5, #0
	ldr r0, [r0]
	add r0, r0, r4
	add r0, #0x9c
	ldr r0, [r0]
	bl sub_0202633C
	pop {r3, r4, r5, pc}
	nop
_020030E4: .word 0x0211188C
	thumb_func_end sub_020030B8

	thumb_func_start sub_020030E8
sub_020030E8: ; 0x020030E8
	push {r4, lr}
	mov r1, #0x12
	lsl r1, r1, #4
	bl AllocFromHeap
	mov r2, #0x12
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl sub_020D4994
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020030E8

	thumb_func_start sub_02003104
sub_02003104: ; 0x02003104
	ldr r3, _02003108 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02003108: .word FreeToHeap
	thumb_func_end sub_02003104

	thumb_func_start sub_0200310C
sub_0200310C: ; 0x0200310C
	push {r3, r4}
	mov r4, #0x14
	mul r4, r1
	str r2, [r0, r4]
	add r1, r0, r4
	ldr r0, [sp, #8]
	str r3, [r1, #4]
	str r0, [r1, #8]
	pop {r3, r4}
	bx lr
	thumb_func_end sub_0200310C

	thumb_func_start sub_02003120
sub_02003120: ; 0x02003120
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	str r3, [sp, #4]
	add r0, r3, #0
	add r1, r4, #0
	bl AllocFromHeap
	add r7, r0, #0
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl AllocFromHeap
	add r3, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	str r4, [sp]
	bl sub_0200310C
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02003120

	thumb_func_start sub_02003150
sub_02003150: ; 0x02003150
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0x14
	add r5, r1, #0
	mul r5, r0
	ldr r0, [r4, r5]
	bl FreeToHeap
	add r0, r4, r5
	ldr r0, [r0, #4]
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02003150

	thumb_func_start sub_0200316C
sub_0200316C: ; 0x0200316C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, sp, #8
	ldrh r7, [r0, #0x10]
	add r6, r2, #0
	mov r0, #0x14
	mul r6, r0
	str r1, [sp]
	add r0, r1, #0
	ldr r1, [r5, r6]
	lsl r4, r3, #1
	add r1, r1, r4
	add r2, r7, #0
	bl sub_020D47B8
	add r1, r5, r6
	ldr r1, [r1, #4]
	ldr r0, [sp]
	add r1, r1, r4
	add r2, r7, #0
	bl sub_020D47B8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0200316C

	thumb_func_start sub_0200319C
sub_0200319C: ; 0x0200319C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r2, sp, #4
	ldr r4, [sp, #0x1c]
	bl sub_020079F4
	add r6, r0, #0
	bne _020031B6
	bl GF_AssertFail
_020031B6:
	cmp r4, #0
	bne _020031BE
	ldr r0, [sp, #4]
	ldr r4, [r0, #8]
_020031BE:
	add r0, sp, #8
	ldrh r0, [r0, #0x18]
	ldr r2, [sp, #0x18]
	mov r1, #0x14
	mul r1, r2
	add r1, r5, r1
	lsl r0, r0, #1
	ldr r1, [r1, #8]
	add r0, r4, r0
	cmp r0, r1
	bls _020031D8
	bl GF_AssertFail
_020031D8:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r1, [sp, #4]
	add r3, sp, #8
	ldr r2, [r1, #0xc]
	ldrh r1, [r3, #0x1c]
	ldrh r3, [r3, #0x18]
	add r0, r5, #0
	lsl r1, r1, #1
	add r1, r2, r1
	ldr r2, [sp, #0x18]
	bl sub_0200316C
	add r0, r6, #0
	bl FreeToHeap
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0200319C

	thumb_func_start sub_02003200
sub_02003200: ; 0x02003200
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x18]
	str r4, [sp]
	ldr r4, [sp, #0x1c]
	str r4, [sp, #4]
	add r4, sp, #8
	ldrh r4, [r4, #0x18]
	str r4, [sp, #8]
	mov r4, #0
	str r4, [sp, #0xc]
	bl sub_0200319C
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02003200

	thumb_func_start sub_02003220
sub_02003220: ; 0x02003220
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r2, sp, #4
	ldr r4, [sp, #0x1c]
	bl sub_02007C48
	add r6, r0, #0
	bne _0200323A
	bl GF_AssertFail
_0200323A:
	cmp r4, #0
	bne _02003242
	ldr r0, [sp, #4]
	ldr r4, [r0, #8]
_02003242:
	add r0, sp, #8
	ldrh r0, [r0, #0x18]
	ldr r2, [sp, #0x18]
	mov r1, #0x14
	mul r1, r2
	add r1, r5, r1
	lsl r0, r0, #1
	ldr r1, [r1, #8]
	add r0, r4, r0
	cmp r0, r1
	bls _0200325C
	bl GF_AssertFail
_0200325C:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r1, [sp, #4]
	add r3, sp, #8
	ldr r2, [r1, #0xc]
	ldrh r1, [r3, #0x1c]
	ldrh r3, [r3, #0x18]
	add r0, r5, #0
	lsl r1, r1, #1
	add r1, r2, r1
	ldr r2, [sp, #0x18]
	bl sub_0200316C
	add r0, r6, #0
	bl FreeToHeap
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02003220

	thumb_func_start sub_02003284
sub_02003284: ; 0x02003284
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [sp, #0x18]
	str r4, [sp]
	ldr r4, [sp, #0x1c]
	str r4, [sp, #4]
	add r4, sp, #8
	ldrh r4, [r4, #0x18]
	str r4, [sp, #8]
	mov r4, #0
	str r4, [sp, #0xc]
	bl sub_02003220
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02003284

	thumb_func_start sub_020032A4
sub_020032A4: ; 0x020032A4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	mov r1, #0x14
	add r6, r0, #0
	mul r1, r4
	add r5, r2, #0
	add r1, r6, r1
	add r7, r3, #0
	lsl r0, r5, #1
	ldr r1, [r1, #8]
	add r0, r7, r0
	cmp r0, r1
	bls _020032C2
	bl GF_AssertFail
_020032C2:
	cmp r4, #3
	bhi _020032FA
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020032D2: ; jump table
	.short _020032DA - _020032D2 - 2 ; case 0
	.short _020032E2 - _020032D2 - 2 ; case 1
	.short _020032EA - _020032D2 - 2 ; case 2
	.short _020032F2 - _020032D2 - 2 ; case 3
_020032DA:
	bl sub_02026E84
	add r1, r0, #0
	b _02003300
_020032E2:
	bl sub_02026E94
	add r1, r0, #0
	b _02003300
_020032EA:
	bl sub_02026EA4
	add r1, r0, #0
	b _02003300
_020032F2:
	bl sub_02026EAC
	add r1, r0, #0
	b _02003300
_020032FA:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
_02003300:
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	lsl r2, r5, #1
	str r0, [sp]
	add r1, r1, r2
	add r0, r6, #0
	add r2, r4, #0
	add r3, r5, #0
	bl sub_0200316C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020032A4

	thumb_func_start sub_02003318
sub_02003318: ; 0x02003318
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, sp, #0x10
	add r5, r0, #0
	add r0, r1, #0
	ldrh r1, [r4, #0x14]
	add r6, r3, #0
	str r1, [sp]
	ldrh r1, [r4, #0x10]
	lsl r4, r2, #1
	ldr r2, [sp]
	lsl r7, r1, #1
	mov r1, #0x14
	mul r6, r1
	mul r1, r0
	ldr r0, [r5, r1]
	str r1, [sp, #4]
	ldr r1, [r5, r6]
	add r0, r0, r4
	add r1, r1, r7
	bl sub_020D47B8
	ldr r0, [sp, #4]
	add r1, r5, r6
	ldr r0, [r5, r0]
	ldr r1, [r1, #4]
	ldr r2, [sp]
	add r0, r0, r4
	add r1, r1, r7
	bl sub_020D47B8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02003318

	thumb_func_start sub_0200335C
sub_0200335C: ; 0x0200335C
	mov r2, #0x14
	mul r2, r1
	ldr r0, [r0, r2]
	bx lr
	thumb_func_end sub_0200335C

	thumb_func_start sub_02003364
sub_02003364: ; 0x02003364
	mov r2, #0x14
	mul r2, r1
	add r0, r0, r2
	ldr r0, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02003364

	thumb_func_start sub_02003370
sub_02003370: ; 0x02003370
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r3, [sp, #8]
	add r5, r0, #0
	ldr r0, [sp, #0x38]
	mov r6, #0
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	add r7, r1, #0
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x40]
	add r4, r6, #0
	str r0, [sp, #0x40]
	add r0, sp, #0x28
	ldrh r0, [r0, #8]
	str r0, [sp, #0xc]
_02003392:
	add r0, r7, #0
	add r1, r4, #0
	bl sub_02003560
	cmp r0, #1
	bne _02003406
	mov r0, #0x46
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	add r1, r4, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x12
	bl sub_02003560
	cmp r0, #0
	bne _02003406
	mov r0, #0x14
	add r6, r4, #0
	mul r6, r0
	add r0, r4, #0
	add r1, r5, r6
	add r2, sp, #0x30
	bl sub_020035B4
	ldr r0, [sp, #0x3c]
	add r1, sp, #0x28
	str r0, [sp]
	ldr r0, [sp, #0x40]
	str r0, [sp, #4]
	add r0, r5, r6
	ldrh r1, [r1, #8]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0x38]
	add r0, #0xc
	bl sub_020035F0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02003574
	cmp r4, #4
	blo _020033F4
	mov r2, #1
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #8
	bl sub_020037FC
	b _020033FE
_020033F4:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x10
	bl sub_020037FC
_020033FE:
	ldr r1, [sp, #0xc]
	add r0, sp, #0x28
	strh r1, [r0, #8]
	mov r6, #1
_02003406:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0xe
	blo _02003392
	cmp r6, #1
	bne _02003460
	mov r0, #0x46
	lsl r0, r0, #2
	ldrh r2, [r5, r0]
	ldr r1, _0200346C ; =0xFFFF0003
	and r1, r2
	lsl r2, r2, #0x10
	lsr r2, r2, #0x12
	orr r2, r7
	lsl r2, r2, #0x12
	lsr r2, r2, #0x10
	orr r1, r2
	strh r1, [r5, r0]
	add r1, r0, #2
	ldrh r1, [r5, r1]
	lsl r1, r1, #0x11
	lsr r1, r1, #0x1f
	bne _02003460
	add r1, r0, #2
	ldrh r2, [r5, r1]
	mov r1, #1
	lsl r1, r1, #0xe
	orr r2, r1
	add r1, r0, #2
	strh r2, [r5, r1]
	ldrh r2, [r5, r0]
	mov r1, #3
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r5, r0]
	mov r2, #0
	add r0, r0, #4
	strb r2, [r5, r0]
	ldr r0, _02003470 ; =sub_020036B0
	add r1, r5, #0
	sub r2, r2, #2
	bl sub_0200E320
_02003460:
	add r0, r6, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	.balign 4, 0
_0200346C: .word 0xFFFF0003
_02003470: .word sub_020036B0
	thumb_func_end sub_02003370

	thumb_func_start sub_02003474
sub_02003474: ; 0x02003474
	push {r0, r1, r2, r3}
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r3, [sp, #8]
	add r5, r0, #0
	ldr r0, [sp, #0x38]
	mov r6, #0
	str r0, [sp, #0x38]
	ldr r0, [sp, #0x3c]
	add r7, r1, #0
	str r0, [sp, #0x3c]
	ldr r0, [sp, #0x40]
	add r4, r6, #0
	str r0, [sp, #0x40]
	add r0, sp, #0x28
	ldrh r0, [r0, #8]
	str r0, [sp, #0xc]
_02003496:
	add r0, r7, #0
	add r1, r4, #0
	bl sub_02003560
	cmp r0, #1
	bne _020034F6
	mov r0, #0x14
	add r6, r4, #0
	mul r6, r0
	add r0, r4, #0
	add r1, r5, r6
	add r2, sp, #0x30
	bl sub_020035B4
	ldr r0, [sp, #0x3c]
	add r1, sp, #0x28
	str r0, [sp]
	ldr r0, [sp, #0x40]
	str r0, [sp, #4]
	add r0, r5, r6
	ldrh r1, [r1, #8]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0x38]
	add r0, #0xc
	bl sub_020035F0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02003574
	cmp r4, #4
	blo _020034E4
	mov r2, #1
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #8
	bl sub_020037FC
	b _020034EE
_020034E4:
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0x10
	bl sub_020037FC
_020034EE:
	ldr r1, [sp, #0xc]
	add r0, sp, #0x28
	strh r1, [r0, #8]
	mov r6, #1
_020034F6:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0xe
	blo _02003496
	cmp r6, #1
	bne _0200354A
	mov r0, #0x46
	lsl r0, r0, #2
	ldrh r2, [r5, r0]
	ldr r1, _02003558 ; =0xFFFF0003
	and r2, r1
	lsl r1, r7, #0x12
	lsr r1, r1, #0x10
	orr r1, r2
	strh r1, [r5, r0]
	add r1, r0, #2
	ldrh r1, [r5, r1]
	lsl r1, r1, #0x11
	lsr r1, r1, #0x1f
	bne _0200354A
	add r1, r0, #2
	ldrh r2, [r5, r1]
	mov r1, #1
	lsl r1, r1, #0xe
	orr r2, r1
	add r1, r0, #2
	strh r2, [r5, r1]
	ldrh r2, [r5, r0]
	mov r1, #3
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r5, r0]
	mov r2, #0
	add r0, r0, #4
	strb r2, [r5, r0]
	ldr r0, _0200355C ; =sub_020036B0
	add r1, r5, #0
	sub r2, r2, #2
	bl sub_0200E320
_0200354A:
	add r0, r6, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_02003558: .word 0xFFFF0003
_0200355C: .word sub_020036B0
	thumb_func_end sub_02003474

	thumb_func_start sub_02003560
sub_02003560: ; 0x02003560
	mov r3, #1
	add r2, r3, #0
	lsl r2, r1
	tst r0, r2
	bne _0200356C
	mov r3, #0
_0200356C:
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	bx lr
	.balign 4, 0
	thumb_func_end sub_02003560

	thumb_func_start sub_02003574
sub_02003574: ; 0x02003574
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _020035AC ; =0x0000011A
	add r4, r1, #0
	ldrh r0, [r5, r0]
	lsl r0, r0, #0x12
	lsr r0, r0, #0x12
	bl sub_02003560
	cmp r0, #1
	beq _020035AA
	ldr r3, _020035AC ; =0x0000011A
	ldr r1, _020035B0 ; =0xFFFFC000
	ldrh r2, [r5, r3]
	add r0, r2, #0
	lsl r2, r2, #0x12
	lsr r6, r2, #0x12
	mov r2, #1
	lsl r2, r4
	orr r2, r6
	lsl r2, r2, #0x10
	and r0, r1
	lsr r2, r2, #0x10
	lsr r1, r1, #0x12
	and r1, r2
	orr r0, r1
	strh r0, [r5, r3]
_020035AA:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020035AC: .word 0x0000011A
_020035B0: .word 0xFFFFC000
	thumb_func_end sub_02003574

	thumb_func_start sub_020035B4
sub_020035B4: ; 0x020035B4
	push {r4, r5}
	cmp r0, #4
	ldr r0, [r1, #8]
	bge _020035C0
	lsl r0, r0, #0x13
	b _020035C4
_020035C0:
	lsr r0, r0, #9
	lsl r0, r0, #0x18
_020035C4:
	mov r4, #0
	lsr r0, r0, #0x18
	add r5, r4, #0
	cmp r0, #0
	bls _020035E4
	mov r3, #1
_020035D0:
	add r1, r3, #0
	lsl r1, r5
	add r1, r4, r1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	add r1, r5, #1
	lsl r1, r1, #0x18
	lsr r5, r1, #0x18
	cmp r5, r0
	blo _020035D0
_020035E4:
	ldrh r0, [r2]
	and r0, r4
	strh r0, [r2]
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020035B4

	thumb_func_start sub_020035F0
sub_020035F0: ; 0x020035F0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r3, #0
	cmp r2, #0
	bge _02003620
	add r0, r2, #0
	bl abs
	add r0, r0, #2
	ldrh r1, [r5, #6]
	mov r2, #0xf
	lsl r0, r0, #0x10
	bic r1, r2
	lsr r2, r0, #0x10
	mov r0, #0xf
	and r0, r2
	orr r0, r1
	strh r0, [r5, #6]
	ldrh r1, [r5, #2]
	mov r0, #0x3f
	bic r1, r0
	strh r1, [r5, #2]
	b _0200363E
_02003620:
	ldrh r1, [r5, #6]
	mov r0, #0xf
	bic r1, r0
	mov r0, #2
	orr r0, r1
	strh r0, [r5, #6]
	ldrh r0, [r5, #2]
	mov r1, #0x3f
	bic r0, r1
	lsl r1, r2, #0x10
	lsr r2, r1, #0x10
	mov r1, #0x3f
	and r1, r2
	orr r0, r1
	strh r0, [r5, #2]
_0200363E:
	strh r6, [r5]
	ldrh r1, [r5, #2]
	ldr r0, _020036A0 ; =0xFFFFF83F
	add r3, sp, #0
	and r1, r0
	lsl r0, r4, #0x1b
	lsr r0, r0, #0x15
	orr r0, r1
	strh r0, [r5, #2]
	ldrh r1, [r5, #2]
	ldr r0, _020036A4 ; =0xFFFF07FF
	add r2, r1, #0
	ldrb r1, [r3, #0x10]
	and r2, r0
	lsl r0, r1, #0x1b
	lsr r0, r0, #0x10
	orr r0, r2
	strh r0, [r5, #2]
	ldrh r0, [r5, #4]
	ldr r2, _020036A8 ; =0xFFFF8000
	ldrh r6, [r3, #0x14]
	lsr r3, r2, #0x11
	and r0, r2
	and r3, r6
	orr r0, r3
	strh r0, [r5, #4]
	ldrh r3, [r5, #6]
	ldr r0, _020036AC ; =0xFFFFFC0F
	and r0, r3
	ldrh r3, [r5, #2]
	lsl r3, r3, #0x1a
	lsr r3, r3, #0x1a
	lsl r3, r3, #0x1a
	lsr r3, r3, #0x16
	orr r0, r3
	strh r0, [r5, #6]
	cmp r4, r1
	ldrh r1, [r5, #4]
	bhs _02003694
	sub r0, r2, #1
	and r0, r1
	strh r0, [r5, #4]
	pop {r4, r5, r6, pc}
_02003694:
	mov r0, #2
	lsl r0, r0, #0xe
	orr r0, r1
	strh r0, [r5, #4]
	pop {r4, r5, r6, pc}
	nop
_020036A0: .word 0xFFFFF83F
_020036A4: .word 0xFFFF07FF
_020036A8: .word 0xFFFF8000
_020036AC: .word 0xFFFFFC0F
	thumb_func_end sub_020035F0

	thumb_func_start sub_020036B0
sub_020036B0: ; 0x020036B0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	mov r1, #0x47
	lsl r1, r1, #2
	ldrb r2, [r4, r1]
	add r5, r0, #0
	cmp r2, #1
	bne _020036F0
	mov r2, #0
	strb r2, [r4, r1]
	sub r2, r1, #2
	ldrh r3, [r4, r2]
	ldr r2, _02003740 ; =0xFFFFC000
	add r5, r3, #0
	and r5, r2
	sub r3, r1, #2
	strh r5, [r4, r3]
	sub r3, r1, #4
	ldrh r5, [r4, r3]
	ldr r3, _02003744 ; =0xFFFF0003
	sub r2, r2, #1
	and r5, r3
	sub r3, r1, #4
	strh r5, [r4, r3]
	sub r3, r1, #2
	ldrh r3, [r4, r3]
	sub r1, r1, #2
	and r2, r3
	strh r2, [r4, r1]
	bl sub_0200E390
	pop {r4, r5, r6, pc}
_020036F0:
	sub r0, r1, #4
	ldrh r2, [r4, r0]
	lsl r0, r2, #0x1e
	lsr r0, r0, #0x1e
	cmp r0, #1
	bne _0200373C
	sub r0, r1, #2
	ldrh r0, [r4, r0]
	ldr r3, _02003740 ; =0xFFFFC000
	lsl r2, r2, #0x10
	lsr r6, r2, #0x12
	lsr r2, r3, #0x12
	and r0, r3
	and r2, r6
	orr r2, r0
	sub r0, r1, #2
	strh r2, [r4, r0]
	add r0, r4, #0
	bl sub_02003760
	add r0, r4, #0
	bl sub_02003780
	mov r1, #0x46
	lsl r1, r1, #2
	ldrh r0, [r4, r1]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x12
	bne _0200373C
	add r0, r1, #2
	ldrh r2, [r4, r0]
	ldr r0, _02003748 ; =0xFFFFBFFF
	and r2, r0
	add r0, r1, #2
	strh r2, [r4, r0]
	add r0, r5, #0
	bl sub_0200E390
_0200373C:
	pop {r4, r5, r6, pc}
	nop
_02003740: .word 0xFFFFC000
_02003744: .word 0xFFFF0003
_02003748: .word 0xFFFFBFFF
	thumb_func_end sub_020036B0

	thumb_func_start sub_0200374C
sub_0200374C: ; 0x0200374C
	mov r1, #0x46
	lsl r1, r1, #2
	ldrh r2, [r0, r1]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x12
	beq _0200375E
	mov r2, #1
	add r1, r1, #4
	strb r2, [r0, r1]
_0200375E:
	bx lr
	thumb_func_end sub_0200374C

	thumb_func_start sub_02003760
sub_02003760: ; 0x02003760
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #0
	mov r6, #0x10
_02003768:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_020037A0
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _02003768
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02003760

	thumb_func_start sub_02003780
sub_02003780: ; 0x02003780
	push {r4, r5, r6, lr}
	mov r4, #4
	add r6, r4, #0
	add r5, r0, #0
	add r6, #0xfc
_0200378A:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_020037A0
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #0xe
	blo _0200378A
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02003780

	thumb_func_start sub_020037A0
sub_020037A0: ; 0x020037A0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x46
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	add r4, r1, #0
	add r6, r2, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x12
	bl sub_02003560
	cmp r0, #0
	beq _020037F4
	mov r0, #0x14
	mul r0, r4
	add r2, r5, r0
	ldrh r0, [r2, #0x12]
	ldrh r3, [r2, #0xe]
	lsl r1, r0, #0x16
	lsl r3, r3, #0x1a
	lsr r1, r1, #0x1a
	lsr r3, r3, #0x1a
	cmp r1, r3
	bhs _020037E4
	ldr r3, _020037F8 ; =0xFFFFFC0F
	and r3, r0
	add r0, r1, #1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x16
	orr r0, r3
	strh r0, [r2, #0x12]
	pop {r4, r5, r6, pc}
_020037E4:
	ldr r1, _020037F8 ; =0xFFFFFC0F
	and r0, r1
	strh r0, [r2, #0x12]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_020037FC
_020037F4:
	pop {r4, r5, r6, pc}
	nop
_020037F8: .word 0xFFFFFC0F
	thumb_func_end sub_020037A0

	thumb_func_start sub_020037FC
sub_020037FC: ; 0x020037FC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r1, [sp, #4]
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, #0x14
	mul r1, r0
	ldr r0, [sp]
	mov r6, #0
	add r5, r0, r1
	add r0, r5, #0
	str r0, [sp, #8]
	add r0, #0xc
	add r7, r2, #0
	add r4, r6, #0
	str r0, [sp, #8]
_0200381C:
	ldrh r0, [r5, #0xc]
	lsl r1, r6, #0x10
	lsr r1, r1, #0x10
	bl sub_02003560
	cmp r0, #0
	beq _0200383C
	ldr r0, [r5]
	lsl r1, r4, #1
	ldr r2, [r5, #4]
	add r0, r0, r1
	add r1, r2, r1
	ldr r2, [sp, #8]
	add r3, r7, #0
	bl sub_02003858
_0200383C:
	add r6, r6, #1
	add r4, r4, r7
	cmp r6, #0x10
	blo _0200381C
	ldr r1, [sp, #4]
	add r5, #0xc
	lsl r1, r1, #0x18
	ldr r0, [sp]
	lsr r1, r1, #0x18
	add r2, r5, #0
	bl sub_020038E4
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_020037FC

	thumb_func_start sub_02003858
sub_02003858: ; 0x02003858
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp, #4]
	mov r0, #0
	add r6, r1, #0
	mov ip, r0
	str r2, [sp]
	mov lr, r3
	add r0, r3, #0
	beq _020038E0
_0200386C:
	ldr r0, [sp, #4]
	mov r1, #0x1f
	ldrh r0, [r0]
	asr r2, r0, #5
	add r5, r2, #0
	and r5, r1
	ldr r1, [sp]
	asr r4, r0, #0xa
	ldrh r1, [r1, #4]
	lsl r1, r1, #0x11
	lsr r3, r1, #0x11
	ldr r1, [sp]
	ldrh r1, [r1, #2]
	lsl r1, r1, #0x15
	lsr r2, r1, #0x1b
	mov r1, #0x1f
	and r1, r4
	mov r4, #0x1f
	and r0, r4
	and r4, r3
	sub r4, r4, r0
	mul r4, r2
	asr r4, r4, #4
	add r0, r0, r4
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	asr r4, r3, #0xa
	mov r0, #0x1f
	and r0, r4
	sub r0, r0, r1
	mul r0, r2
	asr r0, r0, #4
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	asr r3, r3, #5
	mov r1, #0x1f
	and r1, r3
	sub r1, r1, r5
	mul r1, r2
	asr r1, r1, #4
	add r1, r5, r1
	lsl r1, r1, #0x18
	lsl r0, r0, #0xa
	lsr r1, r1, #0x13
	orr r0, r1
	orr r0, r7
	strh r0, [r6]
	ldr r0, [sp, #4]
	add r6, r6, #2
	add r0, r0, #2
	str r0, [sp, #4]
	mov r0, ip
	add r1, r0, #1
	mov r0, lr
	mov ip, r1
	cmp r1, r0
	blo _0200386C
_020038E0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02003858

	thumb_func_start sub_020038E4
sub_020038E4: ; 0x020038E4
	push {r4, r5}
	ldrh r4, [r2, #2]
	lsl r3, r4, #0x10
	lsl r4, r4, #0x15
	lsr r3, r3, #0x1b
	lsr r4, r4, #0x1b
	cmp r4, r3
	bne _0200391E
	mov r3, #0x46
	lsl r3, r3, #2
	ldrh r4, [r0, r3]
	mov r2, #1
	lsl r2, r1
	lsl r1, r4, #0x10
	lsr r5, r1, #0x12
	add r1, r5, #0
	tst r1, r2
	beq _0200397E
	eor r2, r5
	lsl r2, r2, #0x10
	ldr r1, _02003984 ; =0xFFFF0003
	lsr r2, r2, #0x10
	lsl r2, r2, #0x12
	and r1, r4
	lsr r2, r2, #0x10
	orr r1, r2
	strh r1, [r0, r3]
	pop {r4, r5}
	bx lr
_0200391E:
	ldrh r0, [r2, #4]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	bne _02003954
	lsl r0, r4, #0x10
	asr r1, r0, #0x10
	ldrh r0, [r2, #6]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	add r0, r1, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	cmp r4, r3
	ble _0200393E
	lsl r0, r3, #0x10
	asr r4, r0, #0x10
_0200393E:
	ldrh r1, [r2, #2]
	ldr r0, _02003988 ; =0xFFFFF83F
	and r1, r0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x15
	orr r0, r1
	strh r0, [r2, #2]
	pop {r4, r5}
	bx lr
_02003954:
	lsl r0, r4, #0x10
	asr r1, r0, #0x10
	ldrh r0, [r2, #6]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	cmp r4, r3
	bge _0200396C
	lsl r0, r3, #0x10
	asr r4, r0, #0x10
_0200396C:
	ldrh r1, [r2, #2]
	ldr r0, _02003988 ; =0xFFFFF83F
	and r1, r0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1b
	lsr r0, r0, #0x15
	orr r0, r1
	strh r0, [r2, #2]
_0200397E:
	pop {r4, r5}
	bx lr
	nop
_02003984: .word 0xFFFF0003
_02003988: .word 0xFFFFF83F
	thumb_func_end sub_020038E4

	thumb_func_start sub_0200398C
sub_0200398C: ; 0x0200398C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _02003B3C ; =0x0000011A
	ldrh r1, [r6, r0]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x1f
	bne _020039A8
	sub r0, r0, #2
	ldrh r0, [r6, r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	cmp r0, #1
	beq _020039A8
	b _02003B3A
_020039A8:
	mov r7, #2
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #0xc
_020039B0:
	ldr r0, _02003B3C ; =0x0000011A
	ldrh r1, [r6, r0]
	lsl r0, r1, #0x10
	lsr r0, r0, #0x1f
	bne _020039D0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _020039DC
	lsl r0, r1, #0x12
	lsl r1, r5, #0x10
	lsr r0, r0, #0x12
	lsr r1, r1, #0x10
	bl sub_02003560
	cmp r0, #0
	beq _020039DC
_020039D0:
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	bl DC_FlushRange
	cmp r5, #0xd
	bls _020039DE
_020039DC:
	b _02003B04
_020039DE:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020039EA: ; jump table
	.short _02003A06 - _020039EA - 2 ; case 0
	.short _02003A12 - _020039EA - 2 ; case 1
	.short _02003A1E - _020039EA - 2 ; case 2
	.short _02003A2A - _020039EA - 2 ; case 3
	.short _02003A36 - _020039EA - 2 ; case 4
	.short _02003A4A - _020039EA - 2 ; case 5
	.short _02003A5E - _020039EA - 2 ; case 6
	.short _02003A74 - _020039EA - 2 ; case 7
	.short _02003A8A - _020039EA - 2 ; case 8
	.short _02003A9E - _020039EA - 2 ; case 9
	.short _02003AB2 - _020039EA - 2 ; case 10
	.short _02003AC8 - _020039EA - 2 ; case 11
	.short _02003ADE - _020039EA - 2 ; case 12
	.short _02003AF2 - _020039EA - 2 ; case 13
_02003A06:
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl sub_020CFC6C
	b _02003B04
_02003A12:
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl sub_020CFCC0
	b _02003B04
_02003A1E:
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl sub_020CFD18
	b _02003B04
_02003A2A:
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl sub_020CFD70
	b _02003B04
_02003A36:
	bl sub_020D0524
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl sub_020D05C4
	bl sub_020D0634
	b _02003B04
_02003A4A:
	bl sub_020D0524
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	add r1, r7, #0
	bl sub_020D05C4
	bl sub_020D0634
	b _02003B04
_02003A5E:
	bl sub_020D0524
	mov r1, #1
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	lsl r1, r1, #0xe
	bl sub_020D05C4
	bl sub_020D0634
	b _02003B04
_02003A74:
	bl sub_020D0524
	mov r1, #6
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	lsl r1, r1, #0xc
	bl sub_020D05C4
	bl sub_020D0634
	b _02003B04
_02003A8A:
	bl sub_020D0774
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl sub_020D078C
	bl sub_020D07F0
	b _02003B04
_02003A9E:
	bl sub_020D0774
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	add r1, r7, #0
	bl sub_020D078C
	bl sub_020D07F0
	b _02003B04
_02003AB2:
	bl sub_020D0774
	mov r1, #1
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	lsl r1, r1, #0xe
	bl sub_020D078C
	bl sub_020D07F0
	b _02003B04
_02003AC8:
	bl sub_020D0774
	mov r1, #6
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	lsl r1, r1, #0xc
	bl sub_020D078C
	bl sub_020D07F0
	b _02003B04
_02003ADE:
	bl sub_020D067C
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl sub_020D06C4
	bl sub_020D0730
	b _02003B04
_02003AF2:
	bl sub_020D0830
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl sub_020D0848
	bl sub_020D08AC
_02003B04:
	add r5, r5, #1
	add r4, #0x14
	cmp r5, #0xe
	bge _02003B0E
	b _020039B0
_02003B0E:
	ldr r3, _02003B3C ; =0x0000011A
	ldr r1, _02003B40 ; =0xFFFFC000
	sub r2, r3, #2
	ldrh r2, [r6, r2]
	ldrh r0, [r6, r3]
	lsl r2, r2, #0x10
	and r0, r1
	lsr r2, r2, #0x12
	lsr r1, r1, #0x12
	and r1, r2
	orr r0, r1
	strh r0, [r6, r3]
	ldrh r0, [r6, r3]
	lsl r0, r0, #0x12
	lsr r0, r0, #0x12
	bne _02003B3A
	sub r0, r3, #2
	ldrh r1, [r6, r0]
	mov r0, #3
	bic r1, r0
	sub r0, r3, #2
	strh r1, [r6, r0]
_02003B3A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02003B3C: .word 0x0000011A
_02003B40: .word 0xFFFFC000
	thumb_func_end sub_0200398C

	thumb_func_start sub_02003B44
sub_02003B44: ; 0x02003B44
	mov r1, #0x46
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x12
	bx lr
	thumb_func_end sub_02003B44

	thumb_func_start sub_02003B50
sub_02003B50: ; 0x02003B50
	push {r3, r4}
	ldr r3, _02003B6C ; =0x0000011A
	lsl r1, r1, #0x10
	ldrh r4, [r0, r3]
	ldr r2, _02003B70 ; =0xFFFF7FFF
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1f
	and r2, r4
	lsr r1, r1, #0x10
	orr r1, r2
	strh r1, [r0, r3]
	pop {r3, r4}
	bx lr
	nop
_02003B6C: .word 0x0000011A
_02003B70: .word 0xFFFF7FFF
	thumb_func_end sub_02003B50

	thumb_func_start sub_02003B74
sub_02003B74: ; 0x02003B74
	push {r3, r4}
	mov r2, #0x46
	lsl r2, r2, #2
	ldrh r3, [r0, r2]
	mov r4, #3
	bic r3, r4
	mov r4, #1
	and r1, r4
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	mov r1, #3
	and r1, r4
	orr r1, r3
	strh r1, [r0, r2]
	ldrh r3, [r0, r2]
	ldr r1, _02003BA0 ; =0xFFFF0003
	and r3, r1
	ldr r1, _02003BA4 ; =0x0000FFFC
	orr r1, r3
	strh r1, [r0, r2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02003BA0: .word 0xFFFF0003
_02003BA4: .word 0x0000FFFC
	thumb_func_end sub_02003B74

	thumb_func_start sub_02003BA8
sub_02003BA8: ; 0x02003BA8
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #2
	add r4, r0, #0
	add r0, r6, #0
	lsl r1, r1, #8
	bl AllocFromHeap
	mov r2, #2
	mov r1, #0
	lsl r2, r2, #8
	add r5, r0, #0
	bl memset
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #8
	bl DC_FlushRange
	mov r2, #1
	add r0, r4, #0
	tst r0, r2
	beq _02003BE0
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #9
	bl sub_020CFC6C
_02003BE0:
	mov r2, #2
	add r0, r4, #0
	tst r0, r2
	beq _02003BF2
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #8
	bl sub_020CFCC0
_02003BF2:
	mov r2, #4
	add r0, r4, #0
	tst r0, r2
	beq _02003C04
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #7
	bl sub_020CFD18
_02003C04:
	mov r2, #8
	add r0, r4, #0
	tst r0, r2
	beq _02003C16
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #6
	bl sub_020CFD70
_02003C16:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0201AB80
	mov r1, #2
	add r0, r6, #0
	lsl r1, r1, #0xc
	bl AllocFromHeap
	mov r2, #2
	mov r1, #0
	lsl r2, r2, #0xc
	add r5, r0, #0
	bl memset
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl DC_FlushRange
	mov r0, #0x10
	tst r0, r4
	beq _02003C58
	bl sub_020D0524
	mov r2, #2
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #0xc
	bl sub_020D05C4
	bl sub_020D0634
_02003C58:
	mov r0, #0x20
	tst r0, r4
	beq _02003C72
	bl sub_020D0524
	mov r1, #2
	lsl r1, r1, #0xc
	add r0, r5, #0
	add r2, r1, #0
	bl sub_020D05C4
	bl sub_020D0634
_02003C72:
	mov r0, #0x40
	tst r0, r4
	beq _02003C8C
	bl sub_020D0524
	mov r1, #1
	lsl r1, r1, #0xe
	add r0, r5, #0
	lsr r2, r1, #1
	bl sub_020D05C4
	bl sub_020D0634
_02003C8C:
	mov r0, #0x80
	tst r0, r4
	beq _02003CA8
	bl sub_020D0524
	mov r1, #6
	mov r2, #2
	add r0, r5, #0
	lsl r1, r1, #0xc
	lsl r2, r2, #0xc
	bl sub_020D05C4
	bl sub_020D0634
_02003CA8:
	mov r0, #1
	lsl r0, r0, #8
	tst r0, r4
	beq _02003CC4
	bl sub_020D0774
	mov r2, #2
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #0xc
	bl sub_020D078C
	bl sub_020D07F0
_02003CC4:
	mov r0, #2
	lsl r0, r0, #8
	tst r0, r4
	beq _02003CE0
	bl sub_020D0774
	mov r1, #2
	lsl r1, r1, #0xc
	add r0, r5, #0
	add r2, r1, #0
	bl sub_020D078C
	bl sub_020D07F0
_02003CE0:
	mov r0, #1
	lsl r0, r0, #0xa
	tst r0, r4
	beq _02003CFC
	bl sub_020D0774
	mov r1, #1
	lsl r1, r1, #0xe
	add r0, r5, #0
	lsr r2, r1, #1
	bl sub_020D078C
	bl sub_020D07F0
_02003CFC:
	mov r0, #2
	lsl r0, r0, #0xa
	tst r0, r4
	beq _02003D1A
	bl sub_020D0774
	mov r1, #6
	mov r2, #2
	add r0, r5, #0
	lsl r1, r1, #0xc
	lsl r2, r2, #0xc
	bl sub_020D078C
	bl sub_020D07F0
_02003D1A:
	mov r0, #1
	lsl r0, r0, #0xc
	tst r0, r4
	beq _02003D36
	bl sub_020D067C
	mov r2, #2
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #0xc
	bl sub_020D06C4
	bl sub_020D0730
_02003D36:
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r4
	beq _02003D52
	bl sub_020D0830
	mov r2, #2
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #0xc
	bl sub_020D0848
	bl sub_020D08AC
_02003D52:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0201AB80
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02003BA8

	thumb_func_start sub_02003D5C
sub_02003D5C: ; 0x02003D5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	str r3, [sp]
	mov r0, #0x14
	add r4, r1, #0
	mul r4, r0
	add r0, sp, #0x10
	ldrh r0, [r0, #0x14]
	add r7, r2, #0
	ldr r5, [sp, #0x20]
	str r0, [sp, #4]
	lsl r1, r0, #1
	add r0, r6, r4
	ldr r0, [r0, #8]
	cmp r1, r0
	bls _02003D82
	bl GF_AssertFail
_02003D82:
	sub r0, r7, #1
	cmp r0, #1
	bhi _02003D9A
	ldr r2, [r6, r4]
	lsl r1, r5, #1
	add r1, r2, r1
	ldr r2, [sp, #4]
	ldr r0, [sp]
	sub r2, r2, r5
	lsl r2, r2, #1
	bl sub_020D4790
_02003D9A:
	cmp r7, #0
	beq _02003DA2
	cmp r7, #2
	bne _02003DB6
_02003DA2:
	add r1, r6, r4
	ldr r2, [r1, #4]
	lsl r1, r5, #1
	add r1, r2, r1
	ldr r2, [sp, #4]
	ldr r0, [sp]
	sub r2, r2, r5
	lsl r2, r2, #1
	bl sub_020D4790
_02003DB6:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02003D5C

	thumb_func_start sub_02003DBC
sub_02003DBC: ; 0x02003DBC
	push {r3, lr}
	cmp r2, #1
	bne _02003DCE
	mov r2, #0x14
	mul r2, r1
	ldr r1, [r0, r2]
	lsl r0, r3, #1
	ldrh r0, [r1, r0]
	pop {r3, pc}
_02003DCE:
	cmp r2, #0
	bne _02003DE0
	mov r2, #0x14
	mul r2, r1
	add r0, r0, r2
	ldr r1, [r0, #4]
	lsl r0, r3, #1
	ldrh r0, [r1, r0]
	pop {r3, pc}
_02003DE0:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02003DBC

	thumb_func_start sub_02003DE8
sub_02003DE8: ; 0x02003DE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	str r1, [sp, #4]
	add r7, r2, #0
	lsl r1, r0, #0x1b
	lsr r1, r1, #0x1b
	mov ip, r1
	lsl r1, r0, #0x16
	lsl r0, r0, #0x11
	lsr r1, r1, #0x1b
	lsr r0, r0, #0x1b
	mov r2, #0
	mov lr, r1
	str r0, [sp, #8]
	cmp r7, #0
	bls _02003E56
_02003E0E:
	ldr r0, [sp]
	lsl r6, r2, #1
	ldrh r4, [r0, r6]
	lsl r0, r4, #0x1b
	lsr r1, r0, #0x1b
	lsl r0, r4, #0x16
	lsl r4, r4, #0x11
	lsr r5, r4, #0x1b
	ldr r4, [sp, #8]
	lsr r0, r0, #0x1b
	sub r4, r4, r5
	mul r4, r3
	asr r4, r4, #4
	add r4, r5, r4
	lsl r5, r4, #0xa
	mov r4, ip
	sub r4, r4, r1
	mul r4, r3
	asr r4, r4, #4
	add r1, r1, r4
	mov r4, lr
	sub r4, r4, r0
	mul r4, r3
	asr r4, r4, #4
	add r0, r0, r4
	lsl r0, r0, #5
	orr r0, r1
	add r1, r5, #0
	orr r1, r0
	ldr r0, [sp, #4]
	strh r1, [r0, r6]
	add r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	cmp r2, r7
	blo _02003E0E
_02003E56:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02003DE8

	thumb_func_start sub_02003E5C
sub_02003E5C: ; 0x02003E5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r2, #0
	add r5, r0, #0
	mov r2, #0x14
	add r6, r1, #0
	mul r6, r2
	str r3, [sp, #4]
	ldr r1, [r5, r6]
	mov r0, #0
	add r4, r5, r6
	cmp r1, #0
	beq _02003E7E
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02003E7E
	mov r0, #1
_02003E7E:
	cmp r0, #0
	bne _02003E86
	bl GF_AssertFail
_02003E86:
	add r3, sp, #0x10
	ldrh r0, [r3, #0x14]
	add r2, r5, r6
	lsl r1, r7, #1
	str r0, [sp]
	ldr r0, [r4]
	ldr r2, [r2, #4]
	add r0, r0, r1
	add r1, r2, r1
	ldrb r3, [r3, #0x10]
	ldr r2, [sp, #4]
	bl sub_02003DE8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02003E5C

	thumb_func_start sub_02003EA4
sub_02003EA4: ; 0x02003EA4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r3, [sp, #8]
	add r6, r0, #0
	add r7, r1, #0
	ldr r0, [sp, #0x20]
	add r5, r2, #0
	mov r1, #0x14
	add r2, r7, #0
	str r0, [sp, #0x20]
	mul r2, r1
	mov r4, #0
	ldr r1, [r6, r2]
	add r0, r4, #0
	cmp r1, #0
	beq _02003ECE
	add r1, r6, r2
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _02003ECE
	mov r0, #1
_02003ECE:
	cmp r0, #0
	bne _02003ED6
	bl GF_AssertFail
_02003ED6:
	cmp r5, #0
	beq _02003F00
_02003EDA:
	mov r0, #1
	tst r0, r5
	beq _02003EF6
	ldr r0, [sp, #8]
	lsl r2, r4, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x20]
	add r1, r7, #0
	str r0, [sp, #4]
	add r0, r6, #0
	lsr r2, r2, #0x10
	mov r3, #0x10
	bl sub_02003E5C
_02003EF6:
	lsl r0, r5, #0xf
	lsr r5, r0, #0x10
	add r4, #0x10
	cmp r5, #0
	bne _02003EDA
_02003F00:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02003EA4

	thumb_func_start sub_02003F04
sub_02003F04: ; 0x02003F04
	push {r4, r5, r6, r7}
	mov r7, #0
	cmp r1, #0
	ble _02003F46
	mov r2, #0x97
_02003F0E:
	ldrh r6, [r0]
	mov r3, #0x1f
	add r7, r7, #1
	asr r4, r6, #0xa
	and r4, r3
	add r5, r4, #0
	mov r3, #0x1d
	mul r5, r3
	mov r3, #0x1f
	and r3, r6
	mov r4, #0x4c
	mul r4, r3
	asr r6, r6, #5
	mov r3, #0x1f
	and r3, r6
	add r6, r3, #0
	mul r6, r2
	add r3, r4, r6
	add r3, r5, r3
	asr r5, r3, #8
	lsl r4, r5, #0xa
	lsl r3, r5, #5
	orr r3, r4
	orr r3, r5
	strh r3, [r0]
	add r0, r0, #2
	cmp r7, r1
	blt _02003F0E
_02003F46:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02003F04

	thumb_func_start sub_02003F4C
sub_02003F4C: ; 0x02003F4C
	push {r3, r4, r5, r6, r7, lr}
	mov lr, r1
	mov ip, r2
	add r7, r3, #0
	mov r4, #0
	cmp r1, #0
	ble _02003FC4
	ldr r6, [sp, #0x18]
_02003F5C:
	ldrh r3, [r0]
	mov r1, #0x1f
	add r2, r3, #0
	asr r5, r3, #0xa
	and r2, r1
	and r5, r1
	mov r1, #0x1d
	mul r1, r5
	mov r5, #0x4c
	mul r5, r2
	asr r3, r3, #5
	mov r2, #0x1f
	and r3, r2
	mov r2, #0x97
	mul r2, r3
	add r2, r5, r2
	add r1, r1, r2
	asr r3, r1, #8
	mov r1, ip
	add r2, r1, #0
	mul r2, r3
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	asr r2, r1, #8
	add r1, r7, #0
	mul r1, r3
	mul r3, r6
	lsl r1, r1, #0x10
	lsl r3, r3, #0x10
	lsr r1, r1, #0x10
	lsr r3, r3, #0x10
	asr r1, r1, #8
	asr r3, r3, #8
	cmp r2, #0x1f
	ble _02003FA4
	mov r2, #0x1f
_02003FA4:
	cmp r1, #0x1f
	ble _02003FAA
	mov r1, #0x1f
_02003FAA:
	cmp r3, #0x1f
	ble _02003FB0
	mov r3, #0x1f
_02003FB0:
	lsl r3, r3, #0xa
	lsl r1, r1, #5
	orr r1, r3
	orr r1, r2
	strh r1, [r0]
	add r4, r4, #1
	mov r1, lr
	add r0, r0, #2
	cmp r4, r1
	blt _02003F5C
_02003FC4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02003F4C

	thumb_func_start sub_02003FC8
sub_02003FC8: ; 0x02003FC8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r2, sp, #4
	bl sub_020079F4
	add r4, r0, #0
	bne _02003FE0
	bl GF_AssertFail
_02003FE0:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _02003FEC
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0x1c]
_02003FEC:
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x24]
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x28]
	ldr r0, [r0, #0xc]
	mov r1, #0x10
	bl sub_02003F4C
	ldr r0, [sp, #0x1c]
	add r3, sp, #8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r1, [sp, #4]
	ldrh r3, [r3, #0x18]
	ldr r1, [r1, #0xc]
	ldr r2, [sp, #0x18]
	add r0, r5, #0
	bl sub_0200316C
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02003FC8

	thumb_func_start sub_02004020
sub_02004020: ; 0x02004020
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x28]
	str r1, [sp, #4]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	add r7, r2, #0
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	add r6, r3, #0
	str r0, [sp, #0x30]
	mov r0, #0
	str r0, [sp, #0xc]
_0200403C:
	ldr r0, [sp]
	mov r1, #0x1f
	ldrh r0, [r0]
	asr r2, r0, #5
	add r4, r0, #0
	add r5, r2, #0
	and r4, r1
	and r5, r1
	asr r1, r0, #0xa
	mov r0, #0x1f
	and r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	add r1, r7, #0
	sub r0, r0, r4
	mul r0, r6
	bl _s32_div_f
	add r4, r4, r0
	ldr r0, [sp, #0x2c]
	add r1, r7, #0
	sub r0, r0, r5
	mul r0, r6
	bl _s32_div_f
	add r5, r5, r0
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #8]
	sub r0, r1, r0
	mul r0, r6
	add r1, r7, #0
	bl _s32_div_f
	ldr r1, [sp, #8]
	add r0, r1, r0
	lsl r1, r0, #0xa
	lsl r0, r5, #5
	orr r0, r1
	add r1, r4, #0
	orr r1, r0
	ldr r0, [sp, #4]
	strh r1, [r0]
	ldr r0, [sp]
	add r0, r0, #2
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x10
	blt _0200403C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02004020

	thumb_func_start sub_020040AC
sub_020040AC: ; 0x020040AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, r2, #0
	mov r2, #0x46
	add r5, r0, #0
	ldr r0, [sp, #0x38]
	lsl r2, r2, #2
	str r1, [sp, #0xc]
	str r0, [sp, #0x38]
	ldrh r1, [r5, r2]
	mov r0, #3
	str r3, [sp, #0x10]
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strh r0, [r5, r2]
	add r0, r2, #2
	ldr r1, [sp, #0xc]
	ldrh r0, [r5, r0]
	ldr r3, _02004170 ; =0xFFFFC000
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	lsr r1, r3, #0x12
	and r0, r3
	and r1, r4
	orr r1, r0
	add r0, r2, #2
	strh r1, [r5, r0]
	add r0, sp, #0x28
	ldrh r2, [r0, #0x14]
	mov r1, #0x1f
	add r0, r2, #0
	and r0, r1
	str r0, [sp, #0x1c]
	asr r0, r2, #5
	and r0, r1
	str r0, [sp, #0x18]
	asr r0, r2, #0xa
	and r0, r1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x20]
_02004100:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0200415E
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x20]
	asr r1, r0
	mov r0, #1
	tst r1, r0
	beq _0200415E
	mov r6, #0
	strh r7, [r5, #0xc]
	lsl r0, r0, #9
	str r0, [r5, #8]
	add r4, r6, #0
_0200411C:
	add r1, r7, #0
	asr r1, r6
	mov r0, #1
	tst r0, r1
	beq _02004146
	ldr r0, [sp, #0x1c]
	lsl r1, r4, #1
	str r0, [sp]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x38]
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, [r5, #4]
	add r0, r0, r1
	add r1, r2, r1
	ldr r2, [sp, #0x10]
	bl sub_02004020
	b _02004156
_02004146:
	ldr r0, [r5]
	lsl r1, r4, #1
	ldr r2, [r5, #4]
	add r0, r0, r1
	add r1, r2, r1
	mov r2, #0x20
	bl sub_020D48B4
_02004156:
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #0x10
	blt _0200411C
_0200415E:
	ldr r0, [sp, #0x20]
	add r5, #0x14
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #0xe
	blt _02004100
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02004170: .word 0xFFFFC000
	thumb_func_end sub_020040AC

	thumb_func_start InitSoundData
InitSoundData: ; 0x02004174
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl sub_020043F8
	add r4, r0, #0
	bl sub_020C78D0
	add r0, r4, #0
	bl sub_02004858
	add r0, r4, #0
	bl sub_020048C8
	add r0, r4, #0
	ldr r1, _020041F8 ; =0x000BEAE0
	add r0, #0x98
	bl sub_020C9A0C
	add r1, r4, #0
	add r1, #0x94
	str r0, [r1]
	add r2, r4, #0
	add r2, #0x94
	ldr r1, _020041FC ; =0x0210E980
	ldr r2, [r2]
	add r0, r4, #0
	mov r3, #0
	bl sub_020C9300
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl sub_020CA848
	add r0, r4, #0
	add r0, #0x94
	bl sub_0200498C
	add r0, r4, #0
	bl sub_0200487C
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	bl sub_020C9CD8
	ldr r1, _02004200 ; =0x0211194C
	str r0, [r1, #8]
	bl sub_0200472C
	add r0, r4, #0
	bl sub_02004898
	ldr r0, _02004200 ; =0x0211194C
	mov r1, #0
	str r1, [r0, #4]
	ldr r0, _02004204 ; =0x000BEC3C
	str r5, [r4, r0]
	ldrh r0, [r6]
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1e
	bl sub_0200597C
	pop {r4, r5, r6, pc}
	nop
_020041F8: .word 0x000BEAE0
_020041FC: .word 0x0210E980
_02004200: .word 0x0211194C
_02004204: .word 0x000BEC3C
	thumb_func_end InitSoundData

	thumb_func_start DoSoundUpdateFrame
DoSoundUpdateFrame: ; 0x02004208
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	bl sub_020043F8
	add r4, r0, #0
	mov r0, #0x12
	bl sub_02004400
	mov r0, #0x20
	bl sub_02004400
	bl sub_020043CC
	cmp r0, #0
	bne _02004236
	ldr r0, _020042E4 ; =0x000BEBF0
	ldr r1, [r4, r0]
	cmp r1, #0
	ble _02004232
	sub r1, r1, #1
	str r1, [r4, r0]
_02004232:
	bl sub_02004300
_02004236:
	bl sub_020C79B4
	ldr r0, _020042E8 ; =0x021D110C
	ldr r1, [r0, #0x48]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _02004264
	ldr r6, _020042EC ; =0x000BEB94
	mov r5, #0
	add r7, sp, #8
_0200424C:
	add r0, r4, r6
	add r1, r5, #0
	add r2, r7, #0
	bl sub_020C83C0
	add r0, r5, #0
	add r1, sp, #0x24
	bl sub_020C7A94
	add r5, r5, #1
	cmp r5, #0x10
	blt _0200424C
_02004264:
	bl sub_02006C8C
	mov r6, #0
	add r5, r4, #0
	add r7, r4, #0
_0200426E:
	ldr r1, _020042F0 ; =0x000BEC74
	add r0, r4, r6
	ldrb r1, [r0, r1]
	cmp r1, #0
	beq _020042AA
	ldr r1, _020042F0 ; =0x000BEC74
	ldrb r1, [r0, r1]
	sub r2, r1, #1
	ldr r1, _020042F0 ; =0x000BEC74
	strb r2, [r0, r1]
	ldrb r0, [r0, r1]
	cmp r0, #0
	bne _020042AA
	add r0, r1, #0
	sub r0, #0xc
	ldr r0, [r5, r0]
	ldr r2, _020042F4 ; =0x000BEC58
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	add r0, r1, #0
	sub r1, r1, #4
	ldr r3, _020042F8 ; =0x000BEC60
	sub r0, #0x24
	ldrh r1, [r7, r1]
	ldr r0, [r5, r0]
	ldr r2, [r5, r2]
	ldr r3, [r5, r3]
	bl sub_020063A4
_020042AA:
	add r6, r6, #1
	add r5, r5, #4
	add r7, r7, #2
	cmp r6, #2
	blt _0200426E
	ldr r0, _020042FC ; =0x000BEC80
	ldr r0, [r4, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _020042DA
	bl sub_02004924
	cmp r0, #0
	bne _020042DA
	ldr r1, _020042FC ; =0x000BEC80
	mov r0, #1
	ldr r2, [r4, r1]
	add r3, r2, #0
	and r3, r0
	lsr r0, r2, #1
	add r0, r0, #1
	lsl r0, r0, #1
	orr r0, r3
	str r0, [r4, r1]
_020042DA:
	bl sub_020C7958
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020042E4: .word 0x000BEBF0
_020042E8: .word 0x021D110C
_020042EC: .word 0x000BEB94
_020042F0: .word 0x000BEC74
_020042F4: .word 0x000BEC58
_020042F8: .word 0x000BEC60
_020042FC: .word 0x000BEC80
	thumb_func_end DoSoundUpdateFrame

	thumb_func_start sub_02004300
sub_02004300: ; 0x02004300
	push {r4, lr}
	bl sub_020043F8
	add r4, r0, #0
	ldr r0, _020043A4 ; =0x0211194C
	ldr r0, [r0]
	cmp r0, #6
	bhi _020043A0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0200431C: ; jump table
	.short _020043A0 - _0200431C - 2 ; case 0
	.short _0200432A - _0200431C - 2 ; case 1
	.short _020043A0 - _0200431C - 2 ; case 2
	.short _02004332 - _0200431C - 2 ; case 3
	.short _02004342 - _0200431C - 2 ; case 4
	.short _02004352 - _0200431C - 2 ; case 5
	.short _02004374 - _0200431C - 2 ; case 6
_0200432A:
	mov r0, #2
	bl sub_020043B0
	pop {r4, pc}
_02004332:
	bl sub_02005F88
	cmp r0, #0
	bne _020043A0
	mov r0, #2
	bl sub_020043B0
	pop {r4, pc}
_02004342:
	bl sub_02005F88
	cmp r0, #0
	bne _020043A0
	mov r0, #2
	bl sub_020043B0
	pop {r4, pc}
_02004352:
	bl sub_02005F88
	cmp r0, #0
	bne _020043A0
	bl sub_020059B0
	cmp r0, #0
	bne _020043A0
	bl sub_020048F0
	ldr r0, _020043A8 ; =0x000BEBFE
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _020043A0
	bl sub_02005D48
	pop {r4, pc}
_02004374:
	bl sub_02005F88
	cmp r0, #0
	bne _020043A0
	bl sub_020059B0
	cmp r0, #0
	bne _020043A0
	bl sub_020048F0
	ldr r0, _020043A8 ; =0x000BEBFE
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _02004394
	bl sub_02005D48
_02004394:
	ldr r1, _020043AC ; =0x000BEBF8
	mov r0, #0x7f
	ldr r1, [r4, r1]
	mov r2, #0
	bl sub_02005F10
_020043A0:
	pop {r4, pc}
	nop
_020043A4: .word 0x0211194C
_020043A8: .word 0x000BEBFE
_020043AC: .word 0x000BEBF8
	thumb_func_end sub_02004300

	thumb_func_start sub_020043B0
sub_020043B0: ; 0x020043B0
	push {r4, lr}
	add r4, r0, #0
	bl sub_020043F8
	ldr r1, _020043C4 ; =0x000BEBEC
	mov r2, #0
	strh r2, [r0, r1]
	ldr r0, _020043C8 ; =0x0211194C
	str r4, [r0]
	pop {r4, pc}
	.balign 4, 0
_020043C4: .word 0x000BEBEC
_020043C8: .word 0x0211194C
	thumb_func_end sub_020043B0

	thumb_func_start sub_020043CC
sub_020043CC: ; 0x020043CC
	push {r4, lr}
	bl sub_020043F8
	add r4, r0, #0
	mov r0, #2
	bl sub_020054C0
	cmp r0, #0
	beq _020043E2
	mov r0, #1
	pop {r4, pc}
_020043E2:
	ldr r0, _020043F4 ; =0x000BEC02
	ldrh r0, [r4, r0]
	cmp r0, #0
	beq _020043EE
	mov r0, #1
	pop {r4, pc}
_020043EE:
	mov r0, #0
	pop {r4, pc}
	nop
_020043F4: .word 0x000BEC02
	thumb_func_end sub_020043CC

	thumb_func_start sub_020043F8
sub_020043F8: ; 0x020043F8
	ldr r0, _020043FC ; =0x02111958
	bx lr
	.balign 4, 0
_020043FC: .word 0x02111958
	thumb_func_end sub_020043F8

	thumb_func_start sub_02004400
sub_02004400: ; 0x02004400
	push {r4, lr}
	add r4, r0, #0
	bl sub_020043F8
	cmp r4, #0x3a
	bls _0200440E
	b _020045F2
_0200440E:
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0200441A: ; jump table
	.short _0200449C - _0200441A - 2 ; case 0
	.short _020044A2 - _0200441A - 2 ; case 1
	.short _020044A8 - _0200441A - 2 ; case 2
	.short _020044AE - _0200441A - 2 ; case 3
	.short _020044B4 - _0200441A - 2 ; case 4
	.short _02004490 - _0200441A - 2 ; case 5
	.short _02004496 - _0200441A - 2 ; case 6
	.short _020044BA - _0200441A - 2 ; case 7
	.short _020044C0 - _0200441A - 2 ; case 8
	.short _020044C6 - _0200441A - 2 ; case 9
	.short _020044CC - _0200441A - 2 ; case 10
	.short _020044D2 - _0200441A - 2 ; case 11
	.short _020044D8 - _0200441A - 2 ; case 12
	.short _020044DE - _0200441A - 2 ; case 13
	.short _020044E4 - _0200441A - 2 ; case 14
	.short _020044EA - _0200441A - 2 ; case 15
	.short _020044F0 - _0200441A - 2 ; case 16
	.short _020044F6 - _0200441A - 2 ; case 17
	.short _020044FC - _0200441A - 2 ; case 18
	.short _02004502 - _0200441A - 2 ; case 19
	.short _02004508 - _0200441A - 2 ; case 20
	.short _0200450E - _0200441A - 2 ; case 21
	.short _02004514 - _0200441A - 2 ; case 22
	.short _0200451A - _0200441A - 2 ; case 23
	.short _02004520 - _0200441A - 2 ; case 24
	.short _02004526 - _0200441A - 2 ; case 25
	.short _0200452C - _0200441A - 2 ; case 26
	.short _02004532 - _0200441A - 2 ; case 27
	.short _02004538 - _0200441A - 2 ; case 28
	.short _0200453E - _0200441A - 2 ; case 29
	.short _02004544 - _0200441A - 2 ; case 30
	.short _0200454A - _0200441A - 2 ; case 31
	.short _02004550 - _0200441A - 2 ; case 32
	.short _02004556 - _0200441A - 2 ; case 33
	.short _0200455C - _0200441A - 2 ; case 34
	.short _02004562 - _0200441A - 2 ; case 35
	.short _02004568 - _0200441A - 2 ; case 36
	.short _0200456E - _0200441A - 2 ; case 37
	.short _02004574 - _0200441A - 2 ; case 38
	.short _0200457A - _0200441A - 2 ; case 39
	.short _02004580 - _0200441A - 2 ; case 40
	.short _02004586 - _0200441A - 2 ; case 41
	.short _0200458C - _0200441A - 2 ; case 42
	.short _02004592 - _0200441A - 2 ; case 43
	.short _02004598 - _0200441A - 2 ; case 44
	.short _0200459E - _0200441A - 2 ; case 45
	.short _020045A4 - _0200441A - 2 ; case 46
	.short _020045AA - _0200441A - 2 ; case 47
	.short _020045B0 - _0200441A - 2 ; case 48
	.short _020045B6 - _0200441A - 2 ; case 49
	.short _020045BC - _0200441A - 2 ; case 50
	.short _020045C2 - _0200441A - 2 ; case 51
	.short _020045C8 - _0200441A - 2 ; case 52
	.short _020045CE - _0200441A - 2 ; case 53
	.short _020045D4 - _0200441A - 2 ; case 54
	.short _020045DA - _0200441A - 2 ; case 55
	.short _020045E0 - _0200441A - 2 ; case 56
	.short _020045E6 - _0200441A - 2 ; case 57
	.short _020045EC - _0200441A - 2 ; case 58
_02004490:
	ldr r1, _020045FC ; =0x000BEBEE
	add r0, r0, r1
	pop {r4, pc}
_02004496:
	ldr r1, _02004600 ; =0x000BEBEF
	add r0, r0, r1
	pop {r4, pc}
_0200449C:
	ldr r1, _02004604 ; =0x000BEB9C
	add r0, r0, r1
	pop {r4, pc}
_020044A2:
	ldr r1, _02004608 ; =0x000BEBA0
	add r0, r0, r1
	pop {r4, pc}
_020044A8:
	ldr r1, _0200460C ; =0x000BEBA4
	add r0, r0, r1
	pop {r4, pc}
_020044AE:
	ldr r1, _02004610 ; =0x000BEBC0
	add r0, r0, r1
	pop {r4, pc}
_020044B4:
	ldr r1, _02004614 ; =0x000BEBD0
	add r0, r0, r1
	pop {r4, pc}
_020044BA:
	ldr r1, _02004618 ; =0x000BEBF0
	add r0, r0, r1
	pop {r4, pc}
_020044C0:
	ldr r1, _0200461C ; =0x000BEBF4
	add r0, r0, r1
	pop {r4, pc}
_020044C6:
	ldr r1, _02004620 ; =0x000BEBF8
	add r0, r0, r1
	pop {r4, pc}
_020044CC:
	ldr r1, _02004624 ; =0x000BEBFC
	add r0, r0, r1
	pop {r4, pc}
_020044D2:
	ldr r1, _02004628 ; =0x000BEBFE
	add r0, r0, r1
	pop {r4, pc}
_020044D8:
	ldr r1, _0200462C ; =0x000BEC00
	add r0, r0, r1
	pop {r4, pc}
_020044DE:
	ldr r1, _02004630 ; =0x000BEC01
	add r0, r0, r1
	pop {r4, pc}
_020044E4:
	ldr r1, _02004634 ; =0x000BEC02
	add r0, r0, r1
	pop {r4, pc}
_020044EA:
	ldr r1, _02004638 ; =0x000BEC04
	add r0, r0, r1
	pop {r4, pc}
_020044F0:
	ldr r1, _0200463C ; =0x000BEC05
	add r0, r0, r1
	pop {r4, pc}
_020044F6:
	ldr r1, _02004640 ; =0x000BEC06
	add r0, r0, r1
	pop {r4, pc}
_020044FC:
	ldr r1, _02004644 ; =0x000BEC07
	add r0, r0, r1
	pop {r4, pc}
_02004502:
	ldr r1, _02004648 ; =0x000BEC08
	add r0, r0, r1
	pop {r4, pc}
_02004508:
	ldr r1, _0200464C ; =0x000BEC09
	add r0, r0, r1
	pop {r4, pc}
_0200450E:
	ldr r1, _02004650 ; =0x000BEC0A
	add r0, r0, r1
	pop {r4, pc}
_02004514:
	ldr r1, _02004654 ; =0x000BEC0B
	add r0, r0, r1
	pop {r4, pc}
_0200451A:
	ldr r1, _02004658 ; =0x000BEC0C
	add r0, r0, r1
	pop {r4, pc}
_02004520:
	ldr r1, _0200465C ; =0x000BEC10
	add r0, r0, r1
	pop {r4, pc}
_02004526:
	ldr r1, _02004660 ; =0x000BEC14
	add r0, r0, r1
	pop {r4, pc}
_0200452C:
	ldr r1, _02004664 ; =0x000BEC18
	add r0, r0, r1
	pop {r4, pc}
_02004532:
	ldr r1, _02004668 ; =0x000BEC1C
	add r0, r0, r1
	pop {r4, pc}
_02004538:
	ldr r1, _0200466C ; =0x000BEC20
	add r0, r0, r1
	pop {r4, pc}
_0200453E:
	ldr r1, _02004670 ; =0x000BEC24
	add r0, r0, r1
	pop {r4, pc}
_02004544:
	ldr r1, _02004674 ; =0x000BEC28
	add r0, r0, r1
	pop {r4, pc}
_0200454A:
	ldr r1, _02004678 ; =0x000BEC29
	add r0, r0, r1
	pop {r4, pc}
_02004550:
	ldr r1, _0200467C ; =0x000BEC2A
	add r0, r0, r1
	pop {r4, pc}
_02004556:
	ldr r1, _02004680 ; =0x000BEC2C
	add r0, r0, r1
	pop {r4, pc}
_0200455C:
	ldr r1, _02004684 ; =0x000BEC30
	add r0, r0, r1
	pop {r4, pc}
_02004562:
	ldr r1, _02004688 ; =0x000BEC38
	add r0, r0, r1
	pop {r4, pc}
_02004568:
	ldr r1, _0200468C ; =0x000BEC3C
	add r0, r0, r1
	pop {r4, pc}
_0200456E:
	ldr r1, _02004690 ; =0x000BEC40
	add r0, r0, r1
	pop {r4, pc}
_02004574:
	ldr r1, _02004694 ; =0x000BEC44
	add r0, r0, r1
	pop {r4, pc}
_0200457A:
	ldr r1, _02004698 ; =0x000BEC48
	add r0, r0, r1
	pop {r4, pc}
_02004580:
	ldr r1, _0200469C ; =0x000BEC4C
	add r0, r0, r1
	pop {r4, pc}
_02004586:
	ldr r1, _020046A0 ; =0x000BEC50
	add r0, r0, r1
	pop {r4, pc}
_0200458C:
	ldr r1, _020046A4 ; =0x000BEC58
	add r0, r0, r1
	pop {r4, pc}
_02004592:
	ldr r1, _020046A8 ; =0x000BEC60
	add r0, r0, r1
	pop {r4, pc}
_02004598:
	ldr r1, _020046AC ; =0x000BEC68
	add r0, r0, r1
	pop {r4, pc}
_0200459E:
	ldr r1, _020046B0 ; =0x000BEC70
	add r0, r0, r1
	pop {r4, pc}
_020045A4:
	ldr r1, _020046B4 ; =0x000BEC74
	add r0, r0, r1
	pop {r4, pc}
_020045AA:
	ldr r1, _020046B8 ; =0x000BEC54
	add r0, r0, r1
	pop {r4, pc}
_020045B0:
	ldr r1, _020046BC ; =0x000BEC5C
	add r0, r0, r1
	pop {r4, pc}
_020045B6:
	ldr r1, _020046C0 ; =0x000BEC64
	add r0, r0, r1
	pop {r4, pc}
_020045BC:
	ldr r1, _020046C4 ; =0x000BEC6C
	add r0, r0, r1
	pop {r4, pc}
_020045C2:
	ldr r1, _020046C8 ; =0x000BEC72
	add r0, r0, r1
	pop {r4, pc}
_020045C8:
	ldr r1, _020046CC ; =0x000BEC75
	add r0, r0, r1
	pop {r4, pc}
_020045CE:
	ldr r1, _020046D0 ; =0x000BEC76
	add r0, r0, r1
	pop {r4, pc}
_020045D4:
	ldr r1, _020046D4 ; =0x000BEC77
	add r0, r0, r1
	pop {r4, pc}
_020045DA:
	ldr r1, _020046D8 ; =0x000BEC78
	add r0, r0, r1
	pop {r4, pc}
_020045E0:
	ldr r1, _020046DC ; =0x000BEC79
	add r0, r0, r1
	pop {r4, pc}
_020045E6:
	ldr r1, _020046E0 ; =0x000BEC7A
	add r0, r0, r1
	pop {r4, pc}
_020045EC:
	ldr r1, _020046E4 ; =0x000BEC7C
	add r0, r0, r1
	pop {r4, pc}
_020045F2:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	nop
_020045FC: .word 0x000BEBEE
_02004600: .word 0x000BEBEF
_02004604: .word 0x000BEB9C
_02004608: .word 0x000BEBA0
_0200460C: .word 0x000BEBA4
_02004610: .word 0x000BEBC0
_02004614: .word 0x000BEBD0
_02004618: .word 0x000BEBF0
_0200461C: .word 0x000BEBF4
_02004620: .word 0x000BEBF8
_02004624: .word 0x000BEBFC
_02004628: .word 0x000BEBFE
_0200462C: .word 0x000BEC00
_02004630: .word 0x000BEC01
_02004634: .word 0x000BEC02
_02004638: .word 0x000BEC04
_0200463C: .word 0x000BEC05
_02004640: .word 0x000BEC06
_02004644: .word 0x000BEC07
_02004648: .word 0x000BEC08
_0200464C: .word 0x000BEC09
_02004650: .word 0x000BEC0A
_02004654: .word 0x000BEC0B
_02004658: .word 0x000BEC0C
_0200465C: .word 0x000BEC10
_02004660: .word 0x000BEC14
_02004664: .word 0x000BEC18
_02004668: .word 0x000BEC1C
_0200466C: .word 0x000BEC20
_02004670: .word 0x000BEC24
_02004674: .word 0x000BEC28
_02004678: .word 0x000BEC29
_0200467C: .word 0x000BEC2A
_02004680: .word 0x000BEC2C
_02004684: .word 0x000BEC30
_02004688: .word 0x000BEC38
_0200468C: .word 0x000BEC3C
_02004690: .word 0x000BEC40
_02004694: .word 0x000BEC44
_02004698: .word 0x000BEC48
_0200469C: .word 0x000BEC4C
_020046A0: .word 0x000BEC50
_020046A4: .word 0x000BEC58
_020046A8: .word 0x000BEC60
_020046AC: .word 0x000BEC68
_020046B0: .word 0x000BEC70
_020046B4: .word 0x000BEC74
_020046B8: .word 0x000BEC54
_020046BC: .word 0x000BEC5C
_020046C0: .word 0x000BEC64
_020046C4: .word 0x000BEC6C
_020046C8: .word 0x000BEC72
_020046CC: .word 0x000BEC75
_020046D0: .word 0x000BEC76
_020046D4: .word 0x000BEC77
_020046D8: .word 0x000BEC78
_020046DC: .word 0x000BEC79
_020046E0: .word 0x000BEC7A
_020046E4: .word 0x000BEC7C
	thumb_func_end sub_02004400

	thumb_func_start sub_020046E8
sub_020046E8: ; 0x020046E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020043F8
	add r0, #0x94
	ldr r0, [r0]
	bl sub_020C9BB8
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _02004706
	bl GF_AssertFail
_02004706:
	cmp r5, #0
	beq _0200470C
	str r4, [r5]
_0200470C:
	bl sub_0200472C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020046E8

	thumb_func_start sub_02004714
sub_02004714: ; 0x02004714
	push {r4, lr}
	add r4, r0, #0
	bl sub_020043F8
	add r0, #0x94
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_020C9C04
	bl sub_0200472C
	pop {r4, pc}
	thumb_func_end sub_02004714

	thumb_func_start sub_0200472C
sub_0200472C: ; 0x0200472C
	push {r3, lr}
	bl sub_020043F8
	add r0, #0x94
	ldr r0, [r0]
	bl sub_020C9CE8
	ldr r1, _02004740 ; =0x0211194C
	str r0, [r1, #8]
	pop {r3, pc}
	.balign 4, 0
_02004740: .word 0x0211194C
	thumb_func_end sub_0200472C

	thumb_func_start sub_02004744
sub_02004744: ; 0x02004744
	push {r4, lr}
	add r4, r0, #0
	bl sub_020043F8
	add r1, r0, #0
	add r1, #0x94
	ldr r1, [r1]
	add r0, r4, #0
	bl sub_020C9DAC
	add r4, r0, #0
	bl sub_0200472C
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004744

	thumb_func_start sub_02004764
sub_02004764: ; 0x02004764
	push {r4, lr}
	add r4, r0, #0
	bl sub_020043F8
	add r1, r0, #0
	add r1, #0x94
	ldr r1, [r1]
	add r0, r4, #0
	bl sub_020C9DC4
	add r4, r0, #0
	bl sub_0200472C
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004764

	thumb_func_start sub_02004784
sub_02004784: ; 0x02004784
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020043F8
	add r2, r0, #0
	add r2, #0x94
	ldr r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020C9E48
	add r4, r0, #0
	bl sub_0200472C
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02004784

	thumb_func_start sub_020047A8
sub_020047A8: ; 0x020047A8
	push {r4, lr}
	add r4, r0, #0
	bl sub_020043F8
	add r1, r0, #0
	add r1, #0x94
	ldr r1, [r1]
	add r0, r4, #0
	bl sub_020C9E1C
	add r4, r0, #0
	bl sub_0200472C
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020047A8

	thumb_func_start sub_020047C8
sub_020047C8: ; 0x020047C8
	push {r4, lr}
	add r4, r0, #0
	bl sub_020043F8
	add r1, r0, #0
	add r1, #0x94
	ldr r1, [r1]
	add r0, r4, #0
	bl sub_020C9DF0
	add r4, r0, #0
	bl sub_0200472C
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020047C8

	thumb_func_start sub_020047E8
sub_020047E8: ; 0x020047E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020043F8
	add r4, r0, #0
	cmp r5, #9
	blt _020047FC
	bl GF_AssertFail
	mov r5, #0
_020047FC:
	ldr r0, _02004808 ; =0x000BEB78
	add r1, r4, r0
	lsl r0, r5, #2
	add r0, r1, r0
	pop {r3, r4, r5, pc}
	nop
_02004808: .word 0x000BEB78
	thumb_func_end sub_020047E8

	thumb_func_start sub_0200480C
sub_0200480C: ; 0x0200480C
	push {r3, lr}
	cmp r0, #7
	bhi _0200484E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0200481E: ; jump table
	.short _02004832 - _0200481E - 2 ; case 0
	.short _0200482E - _0200481E - 2 ; case 1
	.short _02004836 - _0200481E - 2 ; case 2
	.short _0200483A - _0200481E - 2 ; case 3
	.short _0200483E - _0200481E - 2 ; case 4
	.short _02004842 - _0200481E - 2 ; case 5
	.short _02004846 - _0200481E - 2 ; case 6
	.short _0200484A - _0200481E - 2 ; case 7
_0200482E:
	mov r0, #0
	pop {r3, pc}
_02004832:
	mov r0, #1
	pop {r3, pc}
_02004836:
	mov r0, #2
	pop {r3, pc}
_0200483A:
	mov r0, #3
	pop {r3, pc}
_0200483E:
	mov r0, #4
	pop {r3, pc}
_02004842:
	mov r0, #5
	pop {r3, pc}
_02004846:
	mov r0, #6
	pop {r3, pc}
_0200484A:
	mov r0, #7
	pop {r3, pc}
_0200484E:
	bl GF_AssertFail
	mov r0, #3
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0200480C

	thumb_func_start sub_02004858
sub_02004858: ; 0x02004858
	push {r4, lr}
	ldr r2, _02004874 ; =0x000BEC88
	mov r1, #0
	add r4, r0, #0
	bl memset
	ldr r0, _02004878 ; =0x000BEC0C
	mov r1, #0
_02004868:
	add r1, r1, #1
	str r1, [r4, r0]
	add r4, r4, #4
	cmp r1, #7
	blt _02004868
	pop {r4, pc}
	.balign 4, 0
_02004874: .word 0x000BEC88
_02004878: .word 0x000BEC0C
	thumb_func_end sub_02004858

	thumb_func_start sub_0200487C
sub_0200487C: ; 0x0200487C
	push {r3, r4, r5, lr}
	ldr r1, _02004894 ; =0x000BEB78
	mov r4, #0
	add r5, r0, r1
_02004884:
	add r0, r5, #0
	bl sub_020C81C4
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #9
	blt _02004884
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02004894: .word 0x000BEB78
	thumb_func_end sub_0200487C

	thumb_func_start sub_02004898
sub_02004898: ; 0x02004898
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020048BC ; =0x000BEC0C
	add r0, r4, r0
	bl sub_020046E8
	mov r0, #0
	bl sub_02004744
	ldr r0, _020048C0 ; =0x000002BD
	bl sub_020047C8
	ldr r0, _020048C4 ; =0x000BEC10
	add r0, r4, r0
	bl sub_020046E8
	pop {r4, pc}
	nop
_020048BC: .word 0x000BEC0C
_020048C0: .word 0x000002BD
_020048C4: .word 0x000BEC10
	thumb_func_end sub_02004898

	thumb_func_start sub_020048C8
sub_020048C8: ; 0x020048C8
	push {r4, lr}
	add r4, r0, #0
	bl sub_020DA830
	mov r0, #1
	bl sub_020DB358
	mov r0, #2
	bl sub_020DB39C
	ldr r1, _020048EC ; =0x000BEC80
	mov r0, #1
	ldr r2, [r4, r1]
	bic r2, r0
	mov r0, #1
	orr r0, r2
	str r0, [r4, r1]
	pop {r4, pc}
	.balign 4, 0
_020048EC: .word 0x000BEC80
	thumb_func_end sub_020048C8

	thumb_func_start sub_020048F0
sub_020048F0: ; 0x020048F0
	push {r3, lr}
	mov r0, #7
	mov r1, #0
	bl sub_020C8068
	mov r0, #7
	bl sub_020047E8
	bl sub_020C81D0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020048F0

	thumb_func_start sub_02004908
sub_02004908: ; 0x02004908
	push {r3, lr}
	mov r0, #1
	mov r1, #0
	bl sub_020C8068
	mov r0, #0
	bl sub_020047E8
	bl sub_020C81D0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02004908

	thumb_func_start sub_02004920
sub_02004920: ; 0x02004920
	bx lr
	.balign 4, 0
	thumb_func_end sub_02004920

	thumb_func_start sub_02004924
sub_02004924: ; 0x02004924
	push {r3, lr}
	bl sub_020043F8
	ldr r1, _0200493C ; =0x000BEC80
	ldr r0, [r0, r1]
	lsr r0, r0, #1
	cmp r0, #0x5a
	bls _02004938
	mov r0, #1
	pop {r3, pc}
_02004938:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0200493C: .word 0x000BEC80
	thumb_func_end sub_02004924

	thumb_func_start sub_02004940
sub_02004940: ; 0x02004940
	push {r3, lr}
	bl sub_020043F8
	ldr r2, _02004954 ; =0x000BEC80
	mov r1, #1
	ldr r3, [r0, r2]
	and r1, r3
	str r1, [r0, r2]
	pop {r3, pc}
	nop
_02004954: .word 0x000BEC80
	thumb_func_end sub_02004940

	thumb_func_start sub_02004958
sub_02004958: ; 0x02004958
	push {r4, lr}
	add r4, r0, #0
	bl sub_020043F8
	ldr r1, _02004968 ; =0x000BEC84
	str r4, [r0, r1]
	pop {r4, pc}
	nop
_02004968: .word 0x000BEC84
	thumb_func_end sub_02004958

	thumb_func_start sub_0200496C
sub_0200496C: ; 0x0200496C
	push {r3, lr}
	bl sub_020043F8
	ldr r1, _0200497C ; =0x000BEC84
	ldr r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	.balign 4, 0
_0200497C: .word 0x000BEC84
	thumb_func_end sub_0200496C

	thumb_func_start sub_02004980
sub_02004980: ; 0x02004980
	push {r3, lr}
	bl sub_02004908
	bl sub_020048F0
	pop {r3, pc}
	thumb_func_end sub_02004980

	thumb_func_start sub_0200498C
sub_0200498C: ; 0x0200498C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _020049C0 ; =0x021D05E4
	bl sub_020C81C4
	ldr r1, _020049C4 ; =0x0000A7FE
	mov r0, #9
	bl sub_020C7FAC
	mov r0, #9
	mov r1, #1
	bl sub_020C7F8C
	ldr r1, [r4]
	ldr r2, _020049C8 ; =0x00002EE0
	mov r0, #9
	bl sub_020C7FC4
	cmp r0, #1
	beq _020049B8
	bl GF_AssertFail
_020049B8:
	ldr r0, _020049CC ; =0x021D05E0
	mov r1, #0
	str r1, [r0]
	pop {r4, pc}
	.balign 4, 0
_020049C0: .word 0x021D05E4
_020049C4: .word 0x0000A7FE
_020049C8: .word 0x00002EE0
_020049CC: .word 0x021D05E0
	thumb_func_end sub_0200498C

	thumb_func_start sub_020049D0
sub_020049D0: ; 0x020049D0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl sub_02004980
	add r0, r4, #0
	bl sub_020C9644
	add r2, r0, #0
	str r4, [sp]
	ldrh r2, [r2]
	ldr r0, _02004A00 ; =0x021D05E4
	mov r1, #9
	mov r3, #0x41
	bl sub_020CA8E4
	cmp r0, #1
	beq _020049F6
	mov r4, #0
_020049F6:
	ldr r1, _02004A04 ; =0x021D05E0
	str r4, [r1]
	add sp, #4
	pop {r3, r4, pc}
	nop
_02004A00: .word 0x021D05E4
_02004A04: .word 0x021D05E0
	thumb_func_end sub_020049D0

	thumb_func_start sub_02004A08
sub_02004A08: ; 0x02004A08
	push {r3, lr}
	add r1, r0, #0
	mov r0, #9
	bl sub_020C8068
	ldr r0, _02004A1C ; =0x021D05E0
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	nop
_02004A1C: .word 0x021D05E0
	thumb_func_end sub_02004A08

	thumb_func_start sub_02004A20
sub_02004A20: ; 0x02004A20
	ldr r0, _02004A28 ; =0x021D05E0
	ldr r0, [r0]
	bx lr
	nop
_02004A28: .word 0x021D05E0
	thumb_func_end sub_02004A20

	thumb_func_start sub_02004A2C
sub_02004A2C: ; 0x02004A2C
	ldr r3, _02004A34 ; =sub_020C816C
	add r1, r0, #0
	mov r0, #9
	bx r3
	.balign 4, 0
_02004A34: .word sub_020C816C
	thumb_func_end sub_02004A2C

	thumb_func_start sub_02004A38
sub_02004A38: ; 0x02004A38
	ldr r3, _02004A40 ; =sub_020C81F0
	mov r0, #9
	bx r3
	nop
_02004A40: .word sub_020C81F0
	thumb_func_end sub_02004A38

	thumb_func_start sub_02004A44
sub_02004A44: ; 0x02004A44
	push {r4, lr}
	add r4, r0, #0
	mov r0, #5
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004A44

	thumb_func_start sub_02004A54
sub_02004A54: ; 0x02004A54
	push {r3, lr}
	mov r0, #5
	bl sub_02004400
	ldrb r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02004A54

	thumb_func_start sub_02004A60
sub_02004A60: ; 0x02004A60
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0xa
	bl sub_02004400
	add r4, r0, #0
	ldr r0, _02004A8C ; =0x000004C1
	cmp r5, r0
	bls _02004A82
	add r0, r5, #0
	bl sub_02004AB8
	add r0, r5, #0
	bl sub_02005C98
	strh r0, [r4]
	b _02004A84
_02004A82:
	strh r5, [r4]
_02004A84:
	mov r0, #0
	bl sub_02004A9C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02004A8C: .word 0x000004C1
	thumb_func_end sub_02004A60

	thumb_func_start sub_02004A90
sub_02004A90: ; 0x02004A90
	push {r3, lr}
	mov r0, #0xa
	bl sub_02004400
	ldrh r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02004A90

	thumb_func_start sub_02004A9C
sub_02004A9C: ; 0x02004A9C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0xb
	bl sub_02004400
	strh r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004A9C

	thumb_func_start sub_02004AAC
sub_02004AAC: ; 0x02004AAC
	push {r3, lr}
	mov r0, #0xb
	bl sub_02004400
	ldrh r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02004AAC

	thumb_func_start sub_02004AB8
sub_02004AB8: ; 0x02004AB8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x3a
	bl sub_02004400
	strh r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004AB8

	thumb_func_start sub_02004AC8
sub_02004AC8: ; 0x02004AC8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x20
	bl sub_02004400
	strh r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02004AC8

	thumb_func_start sub_02004AD8
sub_02004AD8: ; 0x02004AD8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x15
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0x16
	bl sub_02004400
	cmp r5, #0x33
	bhs _02004AF6
	strb r5, [r4]
	mov r1, #0
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_02004AF6:
	strb r5, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02004AD8

	thumb_func_start sub_02004AFC
sub_02004AFC: ; 0x02004AFC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x15
	bl sub_02004400
	mov r0, #0x16
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	thumb_func_end sub_02004AFC

	thumb_func_start sub_02004B10
sub_02004B10: ; 0x02004B10
	push {r4, lr}
	mov r0, #0x16
	bl sub_02004400
	add r4, r0, #0
	bl sub_02005318
	mov r0, #0
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end sub_02004B10

	thumb_func_start sub_02004B24
sub_02004B24: ; 0x02004B24
	push {r4, lr}
	cmp r0, #0x4b
	bls _02004B2C
	b _02004E42
_02004B2C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02004B38: ; jump table
	.short _02004E42 - _02004B38 - 2 ; case 0
	.short _02004BD0 - _02004B38 - 2 ; case 1
	.short _02004C76 - _02004B38 - 2 ; case 2
	.short _02004C94 - _02004B38 - 2 ; case 3
	.short _02004C9E - _02004B38 - 2 ; case 4
	.short _02004CA8 - _02004B38 - 2 ; case 5
	.short _02004CBC - _02004B38 - 2 ; case 6
	.short _02004D32 - _02004B38 - 2 ; case 7
	.short _02004CC6 - _02004B38 - 2 ; case 8
	.short _02004BD0 - _02004B38 - 2 ; case 9
	.short _02004BD0 - _02004B38 - 2 ; case 10
	.short _02004CB2 - _02004B38 - 2 ; case 11
	.short _02004CD0 - _02004B38 - 2 ; case 12
	.short _02004C76 - _02004B38 - 2 ; case 13
	.short _02004C6C - _02004B38 - 2 ; case 14
	.short _02004CEA - _02004B38 - 2 ; case 15
	.short _02004CDA - _02004B38 - 2 ; case 16
	.short _02004BD0 - _02004B38 - 2 ; case 17
	.short _02004E42 - _02004B38 - 2 ; case 18
	.short _02004BDA - _02004B38 - 2 ; case 19
	.short _02004BD0 - _02004B38 - 2 ; case 20
	.short _02004C80 - _02004B38 - 2 ; case 21
	.short _02004C9E - _02004B38 - 2 ; case 22
	.short _02004BD0 - _02004B38 - 2 ; case 23
	.short _02004CF4 - _02004B38 - 2 ; case 24
	.short _02004D04 - _02004B38 - 2 ; case 25
	.short _02004E42 - _02004B38 - 2 ; case 26
	.short _02004E42 - _02004B38 - 2 ; case 27
	.short _02004E42 - _02004B38 - 2 ; case 28
	.short _02004E42 - _02004B38 - 2 ; case 29
	.short _02004E42 - _02004B38 - 2 ; case 30
	.short _02004E42 - _02004B38 - 2 ; case 31
	.short _02004E42 - _02004B38 - 2 ; case 32
	.short _02004E42 - _02004B38 - 2 ; case 33
	.short _02004E42 - _02004B38 - 2 ; case 34
	.short _02004E42 - _02004B38 - 2 ; case 35
	.short _02004E42 - _02004B38 - 2 ; case 36
	.short _02004E42 - _02004B38 - 2 ; case 37
	.short _02004E42 - _02004B38 - 2 ; case 38
	.short _02004E42 - _02004B38 - 2 ; case 39
	.short _02004E42 - _02004B38 - 2 ; case 40
	.short _02004E42 - _02004B38 - 2 ; case 41
	.short _02004E42 - _02004B38 - 2 ; case 42
	.short _02004E42 - _02004B38 - 2 ; case 43
	.short _02004E42 - _02004B38 - 2 ; case 44
	.short _02004E42 - _02004B38 - 2 ; case 45
	.short _02004E42 - _02004B38 - 2 ; case 46
	.short _02004E42 - _02004B38 - 2 ; case 47
	.short _02004E42 - _02004B38 - 2 ; case 48
	.short _02004E42 - _02004B38 - 2 ; case 49
	.short _02004E42 - _02004B38 - 2 ; case 50
	.short _02004D14 - _02004B38 - 2 ; case 51
	.short _02004D28 - _02004B38 - 2 ; case 52
	.short _02004D32 - _02004B38 - 2 ; case 53
	.short _02004D3C - _02004B38 - 2 ; case 54
	.short _02004D46 - _02004B38 - 2 ; case 55
	.short _02004D56 - _02004B38 - 2 ; case 56
	.short _02004D60 - _02004B38 - 2 ; case 57
	.short _02004D6A - _02004B38 - 2 ; case 58
	.short _02004D74 - _02004B38 - 2 ; case 59
	.short _02004D7E - _02004B38 - 2 ; case 60
	.short _02004D88 - _02004B38 - 2 ; case 61
	.short _02004D92 - _02004B38 - 2 ; case 62
	.short _02004D9C - _02004B38 - 2 ; case 63
	.short _02004D1E - _02004B38 - 2 ; case 64
	.short _02004D46 - _02004B38 - 2 ; case 65
	.short _02004DA6 - _02004B38 - 2 ; case 66
	.short _02004D28 - _02004B38 - 2 ; case 67
	.short _02004DC6 - _02004B38 - 2 ; case 68
	.short _02004DB6 - _02004B38 - 2 ; case 69
	.short _02004DDA - _02004B38 - 2 ; case 70
	.short _02004DEA - _02004B38 - 2 ; case 71
	.short _02004DFA - _02004B38 - 2 ; case 72
	.short _02004E0E - _02004B38 - 2 ; case 73
	.short _02004E22 - _02004B38 - 2 ; case 74
	.short _02004E32 - _02004B38 - 2 ; case 75
_02004BD0:
	mov r0, #1
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004BDA:
	mov r0, #1
	bl sub_02004744
	add r4, r0, #0
	ldr r0, _02004E4C ; =0x0000058F
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E50 ; =0x00000591
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E54 ; =0x00000593
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E58 ; =0x0000058E
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E5C ; =0x00000594
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E60 ; =0x00000596
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E64 ; =0x0000064F
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E68 ; =0x00000582
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E6C ; =0x00000722
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E70 ; =0x00000583
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E74 ; =0x00000584
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E78 ; =0x00000585
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E7C ; =0x00000587
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E80 ; =0x0000063D
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E84 ; =0x00000642
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E88 ; =0x0000058A
	mov r1, #1
	bl sub_02004784
	ldr r0, _02004E8C ; =0x00000581
	mov r1, #1
	bl sub_02004784
	b _02004E48
_02004C6C:
	mov r0, #0xe
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004C76:
	mov r0, #2
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004C80:
	mov r0, #3
	lsl r0, r0, #8
	bl sub_020047C8
	mov r0, #3
	lsl r0, r0, #8
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004C94:
	mov r0, #0xd
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004C9E:
	mov r0, #1
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004CA8:
	mov r0, #2
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004CB2:
	mov r0, #1
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004CBC:
	mov r0, #0xb
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004CC6:
	mov r0, #1
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004CD0:
	mov r0, #0xe
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004CDA:
	mov r0, #1
	bl sub_02004744
	mov r0, #8
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004CEA:
	mov r0, #1
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004CF4:
	ldr r0, _02004E90 ; =0x00000302
	bl sub_020047C8
	ldr r0, _02004E90 ; =0x00000302
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004D04:
	ldr r0, _02004E94 ; =0x00000303
	bl sub_020047C8
	ldr r0, _02004E94 ; =0x00000303
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004D14:
	mov r0, #3
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004D1E:
	mov r0, #6
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004D28:
	mov r0, #5
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004D32:
	mov r0, #9
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004D3C:
	mov r0, #0xa
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004D46:
	ldr r0, _02004E98 ; =0x000002F5
	bl sub_020047C8
	ldr r0, _02004E98 ; =0x000002F5
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004D56:
	mov r0, #0xc
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004D60:
	mov r0, #7
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004D6A:
	mov r0, #8
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004D74:
	mov r0, #0xf
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004D7E:
	mov r0, #3
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004D88:
	mov r0, #5
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004D92:
	mov r0, #0xf
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004D9C:
	mov r0, #4
	bl sub_02004744
	add r4, r0, #0
	b _02004E48
_02004DA6:
	ldr r0, _02004E9C ; =0x000002FF
	bl sub_020047C8
	ldr r0, _02004E9C ; =0x000002FF
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004DB6:
	ldr r0, _02004EA0 ; =0x00000301
	bl sub_020047C8
	ldr r0, _02004EA0 ; =0x00000301
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004DC6:
	mov r0, #0xbf
	lsl r0, r0, #2
	bl sub_020047C8
	mov r0, #0xbf
	lsl r0, r0, #2
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004DDA:
	ldr r0, _02004EA4 ; =0x00000305
	bl sub_020047C8
	ldr r0, _02004EA4 ; =0x00000305
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004DEA:
	ldr r0, _02004EA8 ; =0x00000306
	bl sub_020047C8
	ldr r0, _02004EA8 ; =0x00000306
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004DFA:
	mov r0, #0xc1
	lsl r0, r0, #2
	bl sub_020047C8
	mov r0, #0xc1
	lsl r0, r0, #2
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004E0E:
	mov r0, #0xc2
	lsl r0, r0, #2
	bl sub_020047C8
	mov r0, #0xc2
	lsl r0, r0, #2
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004E22:
	ldr r0, _02004EAC ; =0x00000307
	bl sub_020047C8
	ldr r0, _02004EAC ; =0x00000307
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004E32:
	ldr r0, _02004EB0 ; =0x00000309
	bl sub_020047C8
	ldr r0, _02004EB0 ; =0x00000309
	bl sub_020047A8
	add r4, r0, #0
	b _02004E48
_02004E42:
	bl GF_AssertFail
	mov r4, #0
_02004E48:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_02004E4C: .word 0x0000058F
_02004E50: .word 0x00000591
_02004E54: .word 0x00000593
_02004E58: .word 0x0000058E
_02004E5C: .word 0x00000594
_02004E60: .word 0x00000596
_02004E64: .word 0x0000064F
_02004E68: .word 0x00000582
_02004E6C: .word 0x00000722
_02004E70: .word 0x00000583
_02004E74: .word 0x00000584
_02004E78: .word 0x00000585
_02004E7C: .word 0x00000587
_02004E80: .word 0x0000063D
_02004E84: .word 0x00000642
_02004E88: .word 0x0000058A
_02004E8C: .word 0x00000581
_02004E90: .word 0x00000302
_02004E94: .word 0x00000303
_02004E98: .word 0x000002F5
_02004E9C: .word 0x000002FF
_02004EA0: .word 0x00000301
_02004EA4: .word 0x00000305
_02004EA8: .word 0x00000306
_02004EAC: .word 0x00000307
_02004EB0: .word 0x00000309
	thumb_func_end sub_02004B24

	thumb_func_start sub_02004EB4
sub_02004EB4: ; 0x02004EB4
	ldr r3, _02004EC0 ; =sub_02004EC4
	add r1, r0, #0
	mov r0, #4
	mov r2, #1
	bx r3
	nop
_02004EC0: .word sub_02004EC4
	thumb_func_end sub_02004EB4

	thumb_func_start sub_02004EC4
sub_02004EC4: ; 0x02004EC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x15
	add r5, r1, #0
	add r6, r2, #0
	bl sub_02004400
	str r0, [sp]
	mov r0, #0x16
	bl sub_02004400
	str r0, [sp, #4]
	mov r0, #0xe
	bl sub_02004400
	add r7, r0, #0
	cmp r4, #0x33
	bhs _02004EF8
	ldr r0, [sp]
	ldrb r0, [r0]
	cmp r0, r4
	bne _02004F06
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02004EF8:
	ldr r0, [sp, #4]
	ldrb r0, [r0]
	cmp r0, r4
	bne _02004F06
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02004F06:
	add r0, r4, #0
	bl sub_02004AD8
	cmp r4, #0x4a
	bls _02004F12
	b _02005054
_02004F12:
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02004F1E: ; jump table
	.short _02005054 - _02004F1E - 2 ; case 0
	.short _02005006 - _02004F1E - 2 ; case 1
	.short _0200502A - _02004F1E - 2 ; case 2
	.short _0200503C - _02004F1E - 2 ; case 3
	.short _02004FB4 - _02004F1E - 2 ; case 4
	.short _02004FC8 - _02004F1E - 2 ; case 5
	.short _02004FDC - _02004F1E - 2 ; case 6
	.short _02004FE6 - _02004F1E - 2 ; case 7
	.short _0200503C - _02004F1E - 2 ; case 8
	.short _0200503C - _02004F1E - 2 ; case 9
	.short _0200503C - _02004F1E - 2 ; case 10
	.short _02004FD2 - _02004F1E - 2 ; case 11
	.short _0200503C - _02004F1E - 2 ; case 12
	.short _0200503C - _02004F1E - 2 ; case 13
	.short _02005018 - _02004F1E - 2 ; case 14
	.short _0200503C - _02004F1E - 2 ; case 15
	.short _0200503C - _02004F1E - 2 ; case 16
	.short _0200503C - _02004F1E - 2 ; case 17
	.short _0200503C - _02004F1E - 2 ; case 18
	.short _0200503C - _02004F1E - 2 ; case 19
	.short _0200503C - _02004F1E - 2 ; case 20
	.short _0200503C - _02004F1E - 2 ; case 21
	.short _02005048 - _02004F1E - 2 ; case 22
	.short _0200503C - _02004F1E - 2 ; case 23
	.short _0200503C - _02004F1E - 2 ; case 24
	.short _0200503C - _02004F1E - 2 ; case 25
	.short _02005054 - _02004F1E - 2 ; case 26
	.short _02005054 - _02004F1E - 2 ; case 27
	.short _02005054 - _02004F1E - 2 ; case 28
	.short _02005054 - _02004F1E - 2 ; case 29
	.short _02005054 - _02004F1E - 2 ; case 30
	.short _02005054 - _02004F1E - 2 ; case 31
	.short _02005054 - _02004F1E - 2 ; case 32
	.short _02005054 - _02004F1E - 2 ; case 33
	.short _02005054 - _02004F1E - 2 ; case 34
	.short _02005054 - _02004F1E - 2 ; case 35
	.short _02005054 - _02004F1E - 2 ; case 36
	.short _02005054 - _02004F1E - 2 ; case 37
	.short _02005054 - _02004F1E - 2 ; case 38
	.short _02005054 - _02004F1E - 2 ; case 39
	.short _02005054 - _02004F1E - 2 ; case 40
	.short _02005054 - _02004F1E - 2 ; case 41
	.short _02005054 - _02004F1E - 2 ; case 42
	.short _02005054 - _02004F1E - 2 ; case 43
	.short _02005054 - _02004F1E - 2 ; case 44
	.short _02005054 - _02004F1E - 2 ; case 45
	.short _02005054 - _02004F1E - 2 ; case 46
	.short _02005054 - _02004F1E - 2 ; case 47
	.short _02005054 - _02004F1E - 2 ; case 48
	.short _02005054 - _02004F1E - 2 ; case 49
	.short _02005054 - _02004F1E - 2 ; case 50
	.short _02004FF0 - _02004F1E - 2 ; case 51
	.short _02004FF0 - _02004F1E - 2 ; case 52
	.short _02004FF0 - _02004F1E - 2 ; case 53
	.short _02004FF0 - _02004F1E - 2 ; case 54
	.short _02004FF0 - _02004F1E - 2 ; case 55
	.short _02004FF0 - _02004F1E - 2 ; case 56
	.short _02004FF0 - _02004F1E - 2 ; case 57
	.short _02004FF0 - _02004F1E - 2 ; case 58
	.short _02004FF0 - _02004F1E - 2 ; case 59
	.short _02004FF0 - _02004F1E - 2 ; case 60
	.short _02004FF0 - _02004F1E - 2 ; case 61
	.short _02004FF0 - _02004F1E - 2 ; case 62
	.short _02004FF0 - _02004F1E - 2 ; case 63
	.short _02004FF0 - _02004F1E - 2 ; case 64
	.short _02004FF0 - _02004F1E - 2 ; case 65
	.short _02004FF0 - _02004F1E - 2 ; case 66
	.short _02004FF0 - _02004F1E - 2 ; case 67
	.short _02004FF8 - _02004F1E - 2 ; case 68
	.short _02004FF0 - _02004F1E - 2 ; case 69
	.short _02004FF0 - _02004F1E - 2 ; case 70
	.short _02004FF0 - _02004F1E - 2 ; case 71
	.short _02004FF0 - _02004F1E - 2 ; case 72
	.short _0200503C - _02004F1E - 2 ; case 73
	.short _02004FF0 - _02004F1E - 2 ; case 74
_02004FB4:
	mov r0, #0
	bl sub_02005AF8
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0200508C
	mov r0, #0
	strh r0, [r7]
	b _0200505A
_02004FC8:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02005228
	b _0200505A
_02004FD2:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02005260
	b _0200505A
_02004FDC:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02005280
	b _0200505A
_02004FE6:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020052A4
	b _0200505A
_02004FF0:
	add r0, r4, #0
	bl sub_020052C8
	b _0200505A
_02004FF8:
	add r0, r4, #0
	bl sub_020052C8
	add r0, r5, #0
	bl sub_02005D48
	b _0200505A
_02005006:
	mov r0, #1
	bl sub_02005AF8
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_02005018:
	mov r0, #2
	bl sub_02005AF8
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_0200502A:
	mov r0, #0
	bl sub_02005AF8
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_0200503C:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_02005048:
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_020052E4
	b _0200505A
_02005054:
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0200505A:
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02004EC4

	thumb_func_start sub_02005060
sub_02005060: ; 0x02005060
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl sub_02004400
	ldr r0, [r0]
	bl sub_02004714
	mov r0, #0x19
	bl sub_02004400
	bl sub_020046E8
	add r0, r4, #0
	bl sub_02004B24
	mov r0, #0x1a
	bl sub_02004400
	bl sub_020046E8
	pop {r4, pc}
	thumb_func_end sub_02005060

	thumb_func_start sub_0200508C
sub_0200508C: ; 0x0200508C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0xc
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x18
	bl sub_02004400
	mov r0, #0x20
	bl sub_02004400
	mov r0, #0
	bl sub_020047E8
	bl sub_020054F0
	add r7, r0, #0
	lsl r0, r7, #0x10
	lsr r4, r0, #0x10
	ldr r0, _02005144 ; =0x000004C1
	cmp r7, r0
	ble _020050C2
	add r0, r4, #0
	bl sub_02005C98
	add r4, r0, #0
_020050C2:
	ldrb r0, [r6]
	cmp r0, #0
	bne _020050D6
	cmp r4, r5
	bne _020050D6
	bl sub_02004AAC
	ldr r1, _02005148 ; =0x000003F5
	cmp r0, r1
	bne _02005142
_020050D6:
	mov r0, #1
	bl sub_020059E0
	ldr r0, _0200514C ; =0x021D05E8
	ldr r1, [r0, #0xc]
	cmp r1, #0
	beq _020050EA
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _020050F4
_020050EA:
	bl sub_02005FD8
	ldr r0, _0200514C ; =0x021D05E8
	mov r1, #1
	str r1, [r0, #4]
_020050F4:
	cmp r4, r5
	beq _02005104
	mov r0, #1
	mov r1, #0
	bl sub_020053A8
	bl sub_02005FA0
_02005104:
	ldrb r0, [r6]
	cmp r0, #1
	bne _0200513C
	mov r0, #2
	bl sub_02005328
	bl sub_02004714
	mov r0, #4
	bl sub_02004B24
	mov r0, #0x1a
	bl sub_02004400
	bl sub_020046E8
	cmp r4, r5
	beq _02005130
	mov r0, #1
	mov r1, #0
	bl sub_020053A8
_02005130:
	lsl r1, r7, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl sub_02005150
	pop {r3, r4, r5, r6, r7, pc}
_0200513C:
	add r0, r5, #0
	bl sub_02005D48
_02005142:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02005144: .word 0x000004C1
_02005148: .word 0x000003F5
_0200514C: .word 0x021D05E8
	thumb_func_end sub_0200508C

	thumb_func_start sub_02005150
sub_02005150: ; 0x02005150
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x20
	bl sub_02004400
	add r4, r0, #0
	ldrh r0, [r4]
	bl sub_02005504
	mov r1, #0xaf
	lsl r1, r1, #2
	cmp r0, r1
	bne _02005178
	add r0, r5, #0
	mov r1, #4
	bl sub_02004784
	bl GF_AssertFail
	b _02005180
_02005178:
	ldrh r0, [r4]
	mov r1, #6
	bl sub_02004784
_02005180:
	mov r0, #0x1b
	bl sub_02004400
	bl sub_020046E8
	mov r0, #1
	mov r1, #0
	bl sub_020053A8
	mov r0, #0x7f
	mov r1, #0x28
	mov r2, #0
	bl sub_02005F10
	mov r0, #0
	bl sub_020059E0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005150

	thumb_func_start sub_020051A4
sub_020051A4: ; 0x020051A4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x13
	add r5, r1, #0
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x20
	bl sub_02004400
	add r4, r0, #0
	ldrb r0, [r6]
	cmp r0, #1
	beq _020051C4
	cmp r5, #0
	bne _02005224
_020051C4:
	mov r0, #1
	bl sub_02005328
	bl sub_02004714
	mov r0, #0
	bl sub_02004AFC
	ldrh r0, [r4]
	mov r1, #2
	bl sub_02004784
	mov r0, #0x19
	bl sub_02004400
	bl sub_020046E8
	mov r0, #4
	bl sub_02004B24
	mov r0, #0x1a
	bl sub_02004400
	bl sub_020046E8
	ldrh r0, [r4]
	bl sub_02005504
	mov r1, #0xaf
	lsl r1, r1, #2
	cmp r0, r1
	bne _02005212
	add r0, r7, #0
	mov r1, #4
	bl sub_02004784
	bl GF_AssertFail
	b _0200521A
_02005212:
	ldrh r0, [r4]
	mov r1, #4
	bl sub_02004784
_0200521A:
	mov r0, #0x1b
	bl sub_02004400
	bl sub_020046E8
_02005224:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020051A4

	thumb_func_start sub_02005228
sub_02005228: ; 0x02005228
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl sub_02004400
	bl sub_02005B20
	mov r0, #2
	bl sub_02005328
	bl sub_02004714
	mov r0, #5
	bl sub_02004B24
	mov r0, #0x1a
	bl sub_02004400
	bl sub_020046E8
	mov r0, #1
	bl sub_020059E0
	add r0, r4, #0
	bl sub_02005D48
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005228

	thumb_func_start sub_02005260
sub_02005260: ; 0x02005260
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl sub_02004400
	bl sub_02005FA0
	bl sub_020053F0
	mov r0, #4
	bl sub_02005060
	add r0, r4, #0
	bl sub_02005D48
	pop {r4, pc}
	thumb_func_end sub_02005260

	thumb_func_start sub_02005280
sub_02005280: ; 0x02005280
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl sub_02004400
	bl sub_02005FA0
	mov r0, #6
	bl sub_02005060
	mov r0, #1
	bl sub_020059E0
	add r0, r4, #0
	bl sub_02005D48
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005280

	thumb_func_start sub_020052A4
sub_020052A4: ; 0x020052A4
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x18
	bl sub_02004400
	bl sub_02005FA0
	mov r0, #7
	bl sub_02005060
	mov r0, #1
	bl sub_020059E0
	add r0, r4, #0
	bl sub_02005D48
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020052A4

	thumb_func_start sub_020052C8
sub_020052C8: ; 0x020052C8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02005318
	add r0, r4, #0
	bl sub_02004B24
	mov r0, #0x1c
	bl sub_02004400
	bl sub_020046E8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020052C8

	thumb_func_start sub_020052E4
sub_020052E4: ; 0x020052E4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x18
	add r4, r1, #0
	bl sub_02004400
	bl sub_02005FA0
	add r0, r5, #0
	bl sub_02005060
	add r0, r4, #0
	bl sub_02005D48
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020052E4

	thumb_func_start sub_02005304
sub_02005304: ; 0x02005304
	push {r4, lr}
	add r4, r0, #0
	bl sub_020043F8
	bl sub_02005B20
	add r0, r4, #0
	bl sub_02005D48
	pop {r4, pc}
	thumb_func_end sub_02005304

	thumb_func_start sub_02005318
sub_02005318: ; 0x02005318
	push {r3, lr}
	mov r0, #4
	bl sub_02005328
	bl sub_02004714
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005318

	thumb_func_start sub_02005328
sub_02005328: ; 0x02005328
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl sub_020043F8
	cmp r4, #7
	blt _02005342
	bl GF_AssertFail
	mov r0, #0x1b
	bl sub_02004400
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
_02005342:
	cmp r4, #6
	bhi _020053A4
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02005352: ; jump table
	.short _02005360 - _02005352 - 2 ; case 0
	.short _0200536A - _02005352 - 2 ; case 1
	.short _02005374 - _02005352 - 2 ; case 2
	.short _0200537E - _02005352 - 2 ; case 3
	.short _02005388 - _02005352 - 2 ; case 4
	.short _02005392 - _02005352 - 2 ; case 5
	.short _0200539C - _02005352 - 2 ; case 6
_02005360:
	mov r0, #0x17
	bl sub_02004400
	add r5, r0, #0
	b _020053A4
_0200536A:
	mov r0, #0x18
	bl sub_02004400
	add r5, r0, #0
	b _020053A4
_02005374:
	mov r0, #0x19
	bl sub_02004400
	add r5, r0, #0
	b _020053A4
_0200537E:
	mov r0, #0x1a
	bl sub_02004400
	add r5, r0, #0
	b _020053A4
_02005388:
	mov r0, #0x1b
	bl sub_02004400
	add r5, r0, #0
	b _020053A4
_02005392:
	mov r0, #0x1c
	bl sub_02004400
	add r5, r0, #0
	b _020053A4
_0200539C:
	mov r0, #0x1d
	bl sub_02004400
	add r5, r0, #0
_020053A4:
	ldr r0, [r5]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005328

	thumb_func_start sub_020053A8
sub_020053A8: ; 0x020053A8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	cmp r0, #1
	bne _020053BC
	mov r0, #0xc
	bl sub_02004400
	add r6, r0, #0
	mov r4, #0
	b _020053CA
_020053BC:
	cmp r0, #7
	bne _020053EE
	mov r0, #0xd
	bl sub_02004400
	add r6, r0, #0
	mov r4, #7
_020053CA:
	cmp r5, #0
	bne _020053E0
	add r0, r4, #0
	bl sub_020047E8
	bl sub_020054F0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_02004A60
_020053E0:
	add r0, r4, #0
	bl sub_020047E8
	add r1, r5, #0
	bl sub_020C815C
	strb r5, [r6]
_020053EE:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020053A8

	thumb_func_start sub_020053F0
sub_020053F0: ; 0x020053F0
	push {r4, lr}
	mov r0, #0xc
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0xd
	bl sub_02004400
	mov r1, #0
	strb r1, [r4]
	strb r1, [r0]
	pop {r4, pc}
	thumb_func_end sub_020053F0

	thumb_func_start sub_02005408
sub_02005408: ; 0x02005408
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r4, r2, #0
	add r6, r0, #0
	bl sub_020047E8
	add r1, r5, #0
	add r2, r4, #0
	bl sub_020C8230
	cmp r6, #0
	bne _02005428
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_02004958
_02005428:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005408

	thumb_func_start sub_0200542C
sub_0200542C: ; 0x0200542C
	push {r4, lr}
	add r4, r1, #0
	bpl _02005434
	mov r4, #0
_02005434:
	cmp r4, #0x7f
	ble _0200543A
	mov r4, #0x7f
_0200543A:
	bl sub_020047E8
	add r1, r4, #0
	bl sub_020C821C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0200542C

	thumb_func_start sub_02005448
sub_02005448: ; 0x02005448
	push {r4, lr}
	add r4, r0, #0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_020054D4
	bl sub_0200480C
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02005464
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005448

	thumb_func_start sub_02005464
sub_02005464: ; 0x02005464
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl sub_020C9644
	cmp r5, #1
	beq _02005474
	cmp r5, #8
	bne _02005478
_02005474:
	mov r4, #0x7f
	b _0200547E
_02005478:
	cmp r0, #0
	beq _02005496
	ldrb r4, [r0, #2]
_0200547E:
	bl sub_020378CC
	cmp r0, #1
	bne _02005496
	add r0, r4, #0
	mov r1, #5
	bl _s32_div_f
	add r1, r0, #0
	add r0, r5, #0
	bl sub_0200542C
_02005496:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005464

	thumb_func_start sub_02005498
sub_02005498: ; 0x02005498
	push {r3, lr}
	bl sub_020C9644
	cmp r0, #0
	bne _020054A6
	mov r0, #0
	pop {r3, pc}
_020054A6:
	ldrb r0, [r0, #2]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005498

	thumb_func_start sub_020054AC
sub_020054AC: ; 0x020054AC
	push {r4, lr}
	add r4, r1, #0
	bl sub_020054D4
	bl sub_0200480C
	add r1, r4, #0
	bl sub_0200542C
	pop {r4, pc}
	thumb_func_end sub_020054AC

	thumb_func_start sub_020054C0
sub_020054C0: ; 0x020054C0
	push {r4, lr}
	add r4, r0, #0
	bpl _020054CA
	bl GF_AssertFail
_020054CA:
	add r0, r4, #0
	bl sub_020C81F0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020054C0

	thumb_func_start sub_020054D4
sub_020054D4: ; 0x020054D4
	push {r3, lr}
	cmp r0, #0
	bne _020054DE
	mov r0, #0xff
	pop {r3, pc}
_020054DE:
	bl sub_020C9644
	cmp r0, #0
	bne _020054EA
	mov r0, #0xff
	pop {r3, pc}
_020054EA:
	ldrb r0, [r0, #5]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020054D4

	thumb_func_start sub_020054F0
sub_020054F0: ; 0x020054F0
	ldr r3, _020054F4 ; =sub_020C834C
	bx r3
	.balign 4, 0
_020054F4: .word sub_020C834C
	thumb_func_end sub_020054F0

	thumb_func_start sub_020054F8
sub_020054F8: ; 0x020054F8
	push {r3, lr}
	bl sub_02005504
	bl sub_020C9724
	pop {r3, pc}
	thumb_func_end sub_020054F8

	thumb_func_start sub_02005504
sub_02005504: ; 0x02005504
	push {r3, lr}
	bl sub_020C9644
	cmp r0, #0
	bne _02005512
	mov r0, #0
	pop {r3, pc}
_02005512:
	ldrh r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005504

	thumb_func_start sub_02005518
sub_02005518: ; 0x02005518
	ldr r3, _0200551C ; =sub_02004924
	bx r3
	.balign 4, 0
_0200551C: .word sub_02004924
	thumb_func_end sub_02005518

	thumb_func_start sub_02005520
sub_02005520: ; 0x02005520
	push {r4, lr}
	add r4, r0, #0
	bl sub_020DA9CC
	add r3, r0, #0
	ldr r0, _02005548 ; =0x021D05E8
	mov r1, #1
	strb r1, [r0]
	ldr r2, _0200554C ; =0x021D05F8
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4]
	str r0, [r2]
	add r0, r3, #0
	pop {r4, pc}
	nop
_02005548: .word 0x021D05E8
_0200554C: .word 0x021D05F8
	thumb_func_end sub_02005520

	thumb_func_start sub_02005550
sub_02005550: ; 0x02005550
	push {r3, lr}
	bl sub_020043F8
	ldr r0, _02005564 ; =0x021D05E8
	mov r1, #0
	strb r1, [r0]
	bl sub_020DAA60
	pop {r3, pc}
	nop
_02005564: .word 0x021D05E8
	thumb_func_end sub_02005550

	thumb_func_start sub_02005568
sub_02005568: ; 0x02005568
	push {r3, lr}
	ldr r0, _02005580 ; =0x021D05E8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200557E
	bl sub_020DAA60
	cmp r0, #0
	beq _0200557E
	bl GF_AssertFail
_0200557E:
	pop {r3, pc}
	.balign 4, 0
_02005580: .word 0x021D05E8
	thumb_func_end sub_02005568

	thumb_func_start sub_02005584
sub_02005584: ; 0x02005584
	push {r3, lr}
	ldr r0, _020055A4 ; =0x021D05E8
	ldrb r0, [r0]
	cmp r0, #0
	beq _0200559C
	ldr r0, _020055A8 ; =0x021D05F8
	bl sub_020DA9CC
	cmp r0, #0
	beq _0200559C
	bl GF_AssertFail
_0200559C:
	bl sub_02004940
	pop {r3, pc}
	nop
_020055A4: .word 0x021D05E8
_020055A8: .word 0x021D05F8
	thumb_func_end sub_02005584

	thumb_func_start sub_020055AC
sub_020055AC: ; 0x020055AC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_020043F8
	mov r0, #0x10
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r4, r0, #0
	cmp r5, #0xe
	beq _020055D0
	cmp r5, #0xf
	beq _020055D0
	bl GF_AssertFail
_020055D0:
	cmp r5, #0xe
	bne _020055DE
	ldrb r0, [r6]
	cmp r0, #0
	bne _020055DE
	bl GF_AssertFail
_020055DE:
	cmp r5, #0xf
	bne _020055EC
	ldrb r0, [r4]
	cmp r0, #0
	bne _020055EC
	bl GF_AssertFail
_020055EC:
	cmp r5, #0xe
	bne _020055F8
	mov r0, #0
	bl sub_02004400
	pop {r4, r5, r6, pc}
_020055F8:
	mov r0, #1
	bl sub_02004400
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020055AC

	thumb_func_start sub_02005600
sub_02005600: ; 0x02005600
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_020043F8
	mov r0, #0x10
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r4, r0, #0
	cmp r5, #0xe
	beq _02005624
	cmp r5, #0xf
	beq _02005624
	bl GF_AssertFail
_02005624:
	cmp r5, #0xe
	bne _02005652
	ldrb r0, [r6]
	cmp r0, #0
	bne _0200564C
	mov r0, #0
	bl sub_02004400
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020C7C90
	str r0, [r4]
	cmp r0, #0
	bne _02005646
	mov r0, #0
	pop {r4, r5, r6, pc}
_02005646:
	mov r0, #1
	strb r0, [r6]
	b _0200567A
_0200564C:
	bl GF_AssertFail
	b _0200567A
_02005652:
	ldrb r0, [r4]
	cmp r0, #0
	bne _02005676
	mov r0, #1
	bl sub_02004400
	add r6, r0, #0
	add r0, r5, #0
	bl sub_020C7C90
	str r0, [r6]
	cmp r0, #0
	bne _02005670
	mov r0, #0
	pop {r4, r5, r6, pc}
_02005670:
	mov r0, #1
	strb r0, [r4]
	b _0200567A
_02005676:
	bl GF_AssertFail
_0200567A:
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005600

	thumb_func_start sub_02005680
sub_02005680: ; 0x02005680
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_020043F8
	mov r0, #0x10
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r4, r0, #0
	cmp r5, #0xe
	beq _020056A6
	cmp r5, #0xf
	beq _020056A6
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_020056A6:
	cmp r5, #0xe
	bne _020056C8
	ldrb r0, [r6]
	cmp r0, #1
	bne _020056C2
	add r0, r5, #0
	bl sub_020055AC
	ldr r0, [r0]
	bl sub_020C7CD4
	mov r0, #0
	strb r0, [r6]
	pop {r4, r5, r6, pc}
_020056C2:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_020056C8:
	ldrb r0, [r4]
	cmp r0, #1
	bne _020056E0
	add r0, r5, #0
	bl sub_020055AC
	ldr r0, [r0]
	bl sub_020C7CD4
	mov r0, #0
	strb r0, [r4]
	pop {r4, r5, r6, pc}
_020056E0:
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005680

	thumb_func_start sub_020056E8
sub_020056E8: ; 0x020056E8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r3, r0, #0
	ldr r0, [r3, #0x10]
	add r4, r1, #0
	str r0, [sp]
	ldr r0, [r3, #0x14]
	str r0, [sp, #4]
	ldr r0, [r3, #0x18]
	str r0, [sp, #8]
	ldr r0, [r3, #0x1c]
	str r0, [sp, #0xc]
	ldr r0, [r3, #0x20]
	str r0, [sp, #0x10]
	ldr r0, [r3, #0x24]
	str r0, [sp, #0x14]
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldr r2, [r3, #8]
	ldr r0, [r0]
	ldr r3, [r3, #0xc]
	bl sub_020C7CEC
	add r5, r0, #0
	bne _02005720
	add r0, r4, #0
	bl sub_02005680
_02005720:
	add r0, r5, #0
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020056E8

	thumb_func_start sub_02005728
sub_02005728: ; 0x02005728
	push {r3, lr}
	bl sub_020055AC
	ldr r0, [r0]
	bl sub_020C7E0C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005728

	thumb_func_start sub_02005738
sub_02005738: ; 0x02005738
	push {r3, lr}
	bl sub_020055AC
	ldr r0, [r0]
	bl sub_020C7F18
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005738

	thumb_func_start sub_02005748
sub_02005748: ; 0x02005748
	push {r4, lr}
	add r4, r1, #0
	cmp r4, #0x7f
	bls _02005752
	mov r4, #0x7f
_02005752:
	bl sub_020055AC
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_020C7EF4
	pop {r4, pc}
	thumb_func_end sub_02005748

	thumb_func_start sub_02005760
sub_02005760: ; 0x02005760
	push {r4, lr}
	add r4, r1, #0
	bl sub_020055AC
	ldr r0, [r0]
	add r1, r4, #0
	bl sub_020C7E70
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005760

	thumb_func_start sub_02005774
sub_02005774: ; 0x02005774
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	bl sub_020378CC
	cmp r0, #1
	bne _0200579C
	add r0, r4, #0
	bl sub_020055AC
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #5
	bl _s32_div_f
	add r1, r0, #0
	ldr r0, [r4]
	bl sub_020C7E48
	pop {r3, r4, r5, pc}
_0200579C:
	add r0, r4, #0
	bl sub_020055AC
	ldr r0, [r0]
	add r1, r5, #0
	bl sub_020C7E48
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005774

	thumb_func_start sub_020057AC
sub_020057AC: ; 0x020057AC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r6, r0, #0
	str r1, [sp]
	str r2, [sp, #4]
	add r5, r3, #0
	bl sub_020043F8
	mov r0, #0x22
	bl sub_02004400
	add r4, r0, #0
	cmp r5, #0xe
	beq _020057D0
	cmp r5, #0xf
	beq _020057D0
	bl GF_AssertFail
_020057D0:
	add r0, r6, #0
	bl sub_020C9788
	add r7, r0, #0
	bne _020057E4
	bl GF_AssertFail
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020057E4:
	ldr r0, [r7]
	lsl r0, r0, #8
	lsr r0, r0, #8
	bl sub_020C98B4
	add r6, r0, #0
	bne _020057FC
	bl GF_AssertFail
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020057FC:
	cmp r5, #0xe
	bne _0200584A
	ldr r0, [sp, #0x48]
	add r1, r6, #0
	bl AllocFromHeap
	str r0, [r4]
	cmp r0, #0
	bne _02005818
	bl GF_AssertFail
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02005818:
	mov r1, #0
	add r2, r6, #0
	bl memset
	ldr r0, [r7]
	ldr r1, [r4]
	lsl r0, r0, #8
	lsr r0, r0, #8
	add r2, r6, #0
	mov r3, #0
	bl sub_020C98DC
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	bne _02005842
	bl GF_AssertFail
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02005842:
	ldr r0, [r4]
	add r1, r6, #0
	bl sub_02005898
_0200584A:
	add r0, r5, #0
	bl sub_020055AC
	mov r1, #0
	str r1, [sp, #0xc]
	str r0, [sp, #8]
	ldr r0, [r4]
	str r0, [sp, #0x10]
	ldr r0, _02005894 ; =0x00003443
	str r1, [sp, #0x14]
	str r0, [sp, #0x20]
	ldr r0, [sp]
	str r1, [sp, #0x18]
	str r0, [sp, #0x24]
	mov r0, #6
	lsl r0, r0, #0xc
	str r0, [sp, #0x28]
	ldr r0, [sp, #4]
	add r1, r5, #0
	str r0, [sp, #0x2c]
	add r0, sp, #8
	str r6, [sp, #0x1c]
	bl sub_020056E8
	add r4, r0, #0
	ldr r1, [sp]
	add r0, r5, #0
	bl sub_02005774
	mov r0, #0xf
	bl sub_02004400
	mov r1, #1
	strb r1, [r0]
	add r0, r4, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02005894: .word 0x00003443
	thumb_func_end sub_020057AC

	thumb_func_start sub_02005898
sub_02005898: ; 0x02005898
	push {r3, r4, r5, r6}
	mov r5, #0
	lsr r6, r1, #1
	beq _020058B2
	sub r2, r1, #1
_020058A2:
	sub r3, r2, r5
	ldrb r4, [r0, r5]
	ldrb r1, [r0, r3]
	strb r1, [r0, r5]
	add r5, r5, #1
	strb r4, [r0, r3]
	cmp r5, r6
	blo _020058A2
_020058B2:
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02005898

	thumb_func_start sub_020058B8
sub_020058B8: ; 0x020058B8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_020043F8
	mov r0, #0xf
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0x22
	bl sub_02004400
	add r6, r0, #0
	cmp r5, #0xe
	beq _020058DC
	cmp r5, #0xf
	beq _020058DC
	bl GF_AssertFail
_020058DC:
	add r0, r5, #0
	bl sub_02005728
	ldrb r0, [r4]
	cmp r0, #1
	bne _020058F2
	mov r0, #0
	strb r0, [r4]
	ldr r0, [r6]
	bl FreeToHeap
_020058F2:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020058B8

	thumb_func_start sub_020058F4
sub_020058F4: ; 0x020058F4
	push {r4, lr}
	bl sub_020C906C
	add r4, r0, #0
	cmp r4, #1
	bne _02005904
	bl sub_02005908
_02005904:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_020058F4

	thumb_func_start sub_02005908
sub_02005908: ; 0x02005908
	ldr r3, _0200590C ; =sub_020C907C
	bx r3
	.balign 4, 0
_0200590C: .word sub_020C907C
	thumb_func_end sub_02005908

	thumb_func_start sub_02005910
sub_02005910: ; 0x02005910
	ldr r3, _02005914 ; =sub_020C9014
	bx r3
	.balign 4, 0
_02005914: .word sub_020C9014
	thumb_func_end sub_02005910

	thumb_func_start sub_02005918
sub_02005918: ; 0x02005918
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_020047E8
	add r1, r5, #0
	add r2, r4, #0
	bl sub_020C827C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005918

	thumb_func_start sub_0200592C
sub_0200592C: ; 0x0200592C
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_020054D4
	bl sub_0200480C
	add r1, r5, #0
	add r2, r4, #0
	bl sub_02005918
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200592C

	thumb_func_start sub_02005944
sub_02005944: ; 0x02005944
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_0200480C
	add r1, r5, #0
	add r2, r4, #0
	bl sub_02005918
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005944

	thumb_func_start sub_02005958
sub_02005958: ; 0x02005958
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_020047E8
	add r1, r5, #0
	add r2, r4, #0
	bl sub_020C829C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005958

	thumb_func_start sub_0200596C
sub_0200596C: ; 0x0200596C
	push {r4, lr}
	add r4, r1, #0
	bl sub_020047E8
	add r1, r4, #0
	bl sub_020C82DC
	pop {r4, pc}
	thumb_func_end sub_0200596C

	thumb_func_start sub_0200597C
sub_0200597C: ; 0x0200597C
	push {r4, lr}
	add r4, r0, #0
	bl sub_020C7994
	ldr r0, _0200598C ; =0x021D05E8
	str r4, [r0, #8]
	pop {r4, pc}
	nop
_0200598C: .word 0x021D05E8
	thumb_func_end sub_0200597C

	thumb_func_start sub_02005990
sub_02005990: ; 0x02005990
	push {r4, lr}
	add r4, r0, #0
	mov r0, #7
	bl sub_02004400
	str r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005990

	thumb_func_start sub_020059A0
sub_020059A0: ; 0x020059A0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #8
	bl sub_02004400
	str r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020059A0

	thumb_func_start sub_020059B0
sub_020059B0: ; 0x020059B0
	push {r3, lr}
	mov r0, #8
	bl sub_02004400
	ldrh r1, [r0]
	cmp r1, #0
	bne _020059C6
	mov r1, #0
	strh r1, [r0]
	add r0, r1, #0
	pop {r3, pc}
_020059C6:
	sub r1, r1, #1
	strh r1, [r0]
	ldrh r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020059B0

	thumb_func_start sub_020059D0
sub_020059D0: ; 0x020059D0
	ldr r3, _020059D4 ; =sub_020C7988
	bx r3
	.balign 4, 0
_020059D4: .word sub_020C7988
	thumb_func_end sub_020059D0

	thumb_func_start sub_020059D8
sub_020059D8: ; 0x020059D8
	ldr r0, _020059DC ; =0x021D0620
	bx lr
	.balign 4, 0
_020059DC: .word 0x021D0620
	thumb_func_end sub_020059D8

	thumb_func_start sub_020059E0
sub_020059E0: ; 0x020059E0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x13
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020059E0

	thumb_func_start sub_020059F0
sub_020059F0: ; 0x020059F0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	str r3, [sp]
	ldr r0, [sp, #0x18]
	add r1, r6, #0
	str r0, [sp, #4]
	mov r0, #4
	add r2, r5, #0
	add r3, r4, #0
	bl sub_02005A10
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020059F0

	thumb_func_start sub_02005A10
sub_02005A10: ; 0x02005A10
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x16
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	bl sub_02004400
	add r4, r0, #0
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	ldr r3, [sp, #8]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [sp, #0x24]
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_02005AB0
	mov r0, #0
	strb r0, [r4]
	mov r0, #5
	bl sub_020043B0
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02005A10

	thumb_func_start sub_02005A4C
sub_02005A4C: ; 0x02005A4C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	str r3, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	add r5, r1, #0
	add r4, r2, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	add r1, r6, #0
	str r0, [sp, #8]
	mov r0, #4
	add r2, r5, #0
	add r3, r4, #0
	bl sub_02005A74
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005A4C

	thumb_func_start sub_02005A74
sub_02005A74: ; 0x02005A74
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #9
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	bl sub_02004400
	add r4, r0, #0
	add r0, sp, #0x10
	ldrb r0, [r0, #0x14]
	ldr r3, [sp, #8]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [sp, #0x28]
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_02005AB0
	ldr r0, [sp, #0x20]
	str r0, [r4]
	mov r0, #6
	bl sub_020043B0
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02005A74

	thumb_func_start sub_02005AB0
sub_02005AB0: ; 0x02005AB0
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	mov r0, #2
	add r5, r1, #0
	add r7, r3, #0
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0
	add r1, r6, #0
	bl sub_02005F50
	mov r0, #0
	bl sub_02004A60
	add r0, r5, #0
	bl sub_02004A9C
	add r0, r7, #0
	bl sub_020059A0
	add r0, r5, #0
	bl sub_020054F8
	str r0, [r4]
	add r0, sp, #8
	ldrb r0, [r0, #0x10]
	bl sub_020059E0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02005AB0

	thumb_func_start sub_02005AEC
sub_02005AEC: ; 0x02005AEC
	ldr r3, _02005AF4 ; =sub_020C7FAC
	add r1, r0, #0
	mov r0, #7
	bx r3
	.balign 4, 0
_02005AF4: .word sub_020C7FAC
	thumb_func_end sub_02005AEC

	thumb_func_start sub_02005AF8
sub_02005AF8: ; 0x02005AF8
	push {r3, lr}
	cmp r0, #0
	bne _02005B0C
	ldr r0, _02005B18 ; =0x0000A7FE
	bl sub_02005AEC
	mov r0, #0
	bl sub_02005910
	b _02005B12
_02005B0C:
	ldr r0, _02005B1C ; =0x00003FFF
	bl sub_02005AEC
_02005B12:
	bl sub_020058F4
	pop {r3, pc}
	.balign 4, 0
_02005B18: .word 0x0000A7FE
_02005B1C: .word 0x00003FFF
	thumb_func_end sub_02005AF8

	thumb_func_start sub_02005B20
sub_02005B20: ; 0x02005B20
	push {r3, lr}
	bl sub_02005F88
	cmp r0, #0
	bne _02005B4A
	mov r0, #0
	bl sub_020047E8
	bl sub_020054F0
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	beq _02005B4A
	bl sub_02005FD8
	mov r0, #1
	add r1, r0, #0
	bl sub_020053A8
	pop {r3, pc}
_02005B4A:
	bl sub_02005FA0
	pop {r3, pc}
	thumb_func_end sub_02005B20

	thumb_func_start sub_02005B50
sub_02005B50: ; 0x02005B50
	ldr r3, _02005B54 ; =sub_020C7F74
	bx r3
	.balign 4, 0
_02005B54: .word sub_020C7F74
	thumb_func_end sub_02005B50

	thumb_func_start sub_02005B58
sub_02005B58: ; 0x02005B58
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x35
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005B58

	thumb_func_start sub_02005B68
sub_02005B68: ; 0x02005B68
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x36
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005B68

	thumb_func_start sub_02005B78
sub_02005B78: ; 0x02005B78
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bne _02005B86
	bl GF_AssertFail
_02005B86:
	cmp r4, #0xf
	bls _02005B8E
	bl GF_AssertFail
_02005B8E:
	add r0, r5, #0
	bl sub_020054D4
	bl sub_0200480C
	bl sub_020047E8
	add r1, r4, #0
	add r2, r6, #0
	bl sub_020C8374
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005B78

	thumb_func_start sub_02005BA8
sub_02005BA8: ; 0x02005BA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x37
	bl sub_02004400
	add r4, r0, #0
	ldrb r1, [r4]
	add r0, r5, #0
	lsl r2, r1, #2
	ldr r1, _02005BE0 ; =0x020F5711
	ldrb r1, [r1, r2]
	bl sub_020054AC
	ldrb r2, [r4]
	ldr r1, _02005BE4 ; =0x0000FFFF
	mov r0, #4
	lsl r3, r2, #2
	ldr r2, _02005BE8 ; =0x020F5710
	ldrb r2, [r2, r3]
	bl sub_02005918
	ldrb r0, [r4, #1]
	cmp r0, #8
	blo _02005BDC
	mov r0, #0
	strb r0, [r4, #1]
_02005BDC:
	pop {r3, r4, r5, pc}
	nop
_02005BE0: .word 0x020F5711
_02005BE4: .word 0x0000FFFF
_02005BE8: .word 0x020F5710
	thumb_func_end sub_02005BA8

	thumb_func_start sub_02005BEC
sub_02005BEC: ; 0x02005BEC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x38
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005BEC

	thumb_func_start sub_02005BFC
sub_02005BFC: ; 0x02005BFC
	push {r3, lr}
	mov r0, #0x38
	bl sub_02004400
	ldrb r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02005BFC

	thumb_func_start sub_02005C08
sub_02005C08: ; 0x02005C08
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x39
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02005C08

	thumb_func_start sub_02005C18
sub_02005C18: ; 0x02005C18
	push {r3, lr}
	mov r0, #0x39
	bl sub_02004400
	ldrb r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02005C18

	thumb_func_start sub_02005C24
sub_02005C24: ; 0x02005C24
	push {r3, r4, r5, lr}
	bl sub_02005C18
	cmp r0, #0
	bne _02005C36
	mov r0, #1
	bl sub_02005C08
	b _02005C3C
_02005C36:
	mov r0, #0
	bl sub_02005C08
_02005C3C:
	bl sub_02004AAC
	cmp r0, #0
	bne _02005C6A
	bl sub_02004A90
	add r4, r0, #0
	bl sub_0200496C
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02005C6C
	cmp r4, r0
	beq _02005C60
	add r0, r4, #0
	bl sub_02005D48
_02005C60:
	mov r0, #0
	add r1, r5, #0
	add r2, r0, #0
	bl sub_02005408
_02005C6A:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005C24

	thumb_func_start sub_02005C6C
sub_02005C6C: ; 0x02005C6C
	push {r3, r4}
	ldr r2, _02005C90 ; =0x020F5730
	mov r4, #0
_02005C72:
	lsl r3, r4, #2
	ldrh r1, [r2, r3]
	cmp r0, r1
	bne _02005C82
	ldr r0, _02005C94 ; =0x020F5732
	ldrh r0, [r0, r3]
	pop {r3, r4}
	bx lr
_02005C82:
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #0x88
	blo _02005C72
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02005C90: .word 0x020F5730
_02005C94: .word 0x020F5732
	thumb_func_end sub_02005C6C

	thumb_func_start sub_02005C98
sub_02005C98: ; 0x02005C98
	push {r3, r4}
	ldr r2, _02005CBC ; =0x020F5730
	mov r4, #0
_02005C9E:
	lsl r3, r4, #2
	add r1, r2, r3
	ldrh r1, [r1, #2]
	cmp r0, r1
	bne _02005CAE
	ldrh r0, [r2, r3]
	pop {r3, r4}
	bx lr
_02005CAE:
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	cmp r4, #0x88
	blo _02005C9E
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02005CBC: .word 0x020F5730
	thumb_func_end sub_02005C98

	thumb_func_start sub_02005CC0
sub_02005CC0: ; 0x02005CC0
	push {r3, lr}
	mov r0, #0
	bl sub_020047E8
	ldr r2, _02005CF0 ; =0x0000A7FE
	mov r1, #0xf
	bl sub_020C82BC
	mov r0, #7
	bl sub_020047E8
	ldr r2, _02005CF0 ; =0x0000A7FE
	mov r1, #0xf
	bl sub_020C82BC
	mov r0, #2
	bl sub_020047E8
	ldr r2, _02005CF0 ; =0x0000A7FE
	mov r1, #0xf
	bl sub_020C82BC
	pop {r3, pc}
	nop
_02005CF0: .word 0x0000A7FE
	thumb_func_end sub_02005CC0

	thumb_func_start sub_02005CF4
sub_02005CF4: ; 0x02005CF4
	ldr r1, _02005CFC ; =0x021D05E8
	str r0, [r1, #0xc]
	bx lr
	nop
_02005CFC: .word 0x021D05E8
	thumb_func_end sub_02005CF4

	thumb_func_start sub_02005D00
sub_02005D00: ; 0x02005D00
	ldr r0, _02005D0C ; =0x021D05E8
	mov r1, #0
	str r1, [r0, #0xc]
	str r1, [r0, #4]
	bx lr
	nop
_02005D0C: .word 0x021D05E8
	thumb_func_end sub_02005D00

	thumb_func_start sub_02005D10
sub_02005D10: ; 0x02005D10
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	bl sub_020054D4
	bl sub_0200480C
	str r5, [sp]
	mov r1, #1
	str r1, [sp, #4]
	sub r1, r1, #2
	add r2, r1, #0
	add r3, r1, #0
	add r4, r0, #0
	bl sub_02006C14
	add r6, r0, #0
	bne _02005D3A
	add r0, r5, #0
	bl sub_02004920
_02005D3A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02005DA0
	add r0, r6, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02005D10

	thumb_func_start sub_02005D48
sub_02005D48: ; 0x02005D48
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl sub_020054D4
	add r5, r0, #0
	bl sub_0200480C
	add r6, r0, #0
	cmp r5, #7
	bne _02005D6A
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_02005DC4
	add r5, r0, #0
	b _02005D84
_02005D6A:
	cmp r5, #1
	bne _02005D7C
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl sub_02005DF4
	add r5, r0, #0
	b _02005D84
_02005D7C:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_02005D84:
	mov r0, #0
	bl sub_020059E0
	cmp r5, #0
	bne _02005D94
	add r0, r4, #0
	bl sub_02004920
_02005D94:
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02005DA0
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02005D48

	thumb_func_start sub_02005DA0
sub_02005DA0: ; 0x02005DA0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02004A60
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02005464
	mov r0, #1
	bl sub_020043B0
	cmp r4, #0
	bne _02005DC2
	mov r0, #0x80
	bl sub_02004958
_02005DC2:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005DA0

	thumb_func_start sub_02005DC4
sub_02005DC4: ; 0x02005DC4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #3
	add r4, r2, #0
	bl sub_02005328
	bl sub_02004714
	add r0, r5, #0
	bl sub_02004764
	str r5, [sp]
	mov r1, #1
	str r1, [sp, #4]
	sub r1, r1, #2
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02006C14
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02005DC4

	thumb_func_start sub_02005DF4
sub_02005DF4: ; 0x02005DF4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x13
	add r6, r2, #0
	bl sub_02004400
	mov r0, #0x20
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0
	bl sub_020047E8
	bl sub_020054F0
	bl sub_02005504
	add r1, r0, #0
	add r0, r5, #0
	bl sub_020051A4
	mov r0, #0
	bl sub_02004A08
	ldrh r0, [r4]
	bl sub_02005504
	add r2, r0, #0
	str r5, [sp]
	mov r1, #1
	str r1, [sp, #4]
	sub r1, r1, #2
	add r0, r6, #0
	add r3, r1, #0
	bl sub_02006C14
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02005DF4

	thumb_func_start sub_02005E44
sub_02005E44: ; 0x02005E44
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x15
	bl sub_02004400
	ldrb r0, [r0]
	cmp r0, #4
	beq _02005E60
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02005E60:
	add r0, r4, #0
	bl sub_020054D4
	cmp r0, #7
	beq _02005E74
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, pc}
_02005E74:
	add r0, r4, #0
	mov r1, #1
	bl sub_02004784
	str r4, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #7
	add r1, r0, #0
	sub r1, #8
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02006C14
	add r5, r0, #0
	bne _02005E9A
	add r0, r4, #0
	bl sub_02004920
_02005E9A:
	mov r0, #0
	bl sub_02004A08
	add r0, r4, #0
	bl sub_02004A60
	mov r0, #1
	bl sub_020043B0
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02005E44

	thumb_func_start sub_02005EB4
sub_02005EB4: ; 0x02005EB4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_020C80C4
	add r0, r5, #0
	bl sub_02005C6C
	cmp r5, r0
	beq _02005ECE
	add r1, r4, #0
	bl sub_020C80C4
_02005ECE:
	add r0, r5, #0
	bl sub_020054D4
	cmp r0, #0xff
	beq _02005EE4
	bl sub_0200480C
	bl sub_020047E8
	bl sub_020C81D0
_02005EE4:
	bl sub_02005EEC
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02005EB4

	thumb_func_start sub_02005EEC
sub_02005EEC: ; 0x02005EEC
	push {r3, lr}
	mov r0, #0
	bl sub_02004A08
	mov r0, #0
	bl sub_02004A60
	mov r0, #0
	bl sub_02004A9C
	mov r0, #0
	bl sub_02004AB8
	mov r0, #0
	bl sub_020043B0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02005EEC

	thumb_func_start sub_02005F10
sub_02005F10: ; 0x02005F10
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	bl sub_02004A90
	bl sub_020054D4
	cmp r0, #0xff
	beq _02005F4C
	bl sub_0200480C
	add r7, r0, #0
	cmp r4, #0
	bne _02005F36
	mov r1, #0
	add r2, r1, #0
	bl sub_02005408
_02005F36:
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl sub_02005408
	add r0, r5, #0
	bl sub_02005990
	mov r0, #3
	bl sub_020043B0
_02005F4C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02005F10

	thumb_func_start sub_02005F50
sub_02005F50: ; 0x02005F50
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02004A90
	bl sub_020054D4
	add r6, r0, #0
	cmp r6, #0xff
	beq _02005F86
	bl sub_02005F88
	cmp r0, #0
	bne _02005F80
	add r0, r6, #0
	bl sub_0200480C
	add r1, r5, #0
	add r2, r4, #0
	bl sub_02005408
	add r0, r4, #0
	bl sub_02005990
_02005F80:
	mov r0, #4
	bl sub_020043B0
_02005F86:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02005F50

	thumb_func_start sub_02005F88
sub_02005F88: ; 0x02005F88
	push {r3, lr}
	mov r0, #7
	bl sub_02004400
	ldrh r0, [r0]
	pop {r3, pc}
	thumb_func_end sub_02005F88

	thumb_func_start sub_02005F94
sub_02005F94: ; 0x02005F94
	push {r3, lr}
	bl sub_020054D4
	bl sub_020054C0
	pop {r3, pc}
	thumb_func_end sub_02005F94

	thumb_func_start sub_02005FA0
sub_02005FA0: ; 0x02005FA0
	push {r3, r4, r5, lr}
	mov r0, #0x10
	bl sub_02004400
	add r5, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0
	bl sub_020C811C
	ldrb r0, [r5]
	cmp r0, #1
	bne _02005FC4
	mov r0, #0xe
	bl sub_02005728
_02005FC4:
	ldrb r0, [r4]
	cmp r0, #1
	bne _02005FD0
	mov r0, #0xf
	bl sub_02005728
_02005FD0:
	mov r0, #0
	bl sub_020043B0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02005FA0

	thumb_func_start sub_02005FD8
sub_02005FD8: ; 0x02005FD8
	push {r3, r4, r5, r6, r7, lr}
	mov r0, #0x10
	bl sub_02004400
	add r7, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r6, r0, #0
	mov r0, #7
	bl sub_020047E8
	mov r1, #0
	bl sub_020C8058
	bl sub_02005EEC
	mov r5, #0
	add r4, r5, #0
_02005FFE:
	add r0, r5, #3
	add r1, r4, #0
	bl sub_0200615C
	add r5, r5, #1
	cmp r5, #4
	blt _02005FFE
	mov r0, #0
	bl sub_02006300
	ldrb r0, [r7]
	cmp r0, #1
	bne _0200601E
	mov r0, #0xe
	bl sub_02005728
_0200601E:
	ldrb r0, [r6]
	cmp r0, #1
	bne _0200602A
	mov r0, #0xf
	bl sub_02005728
_0200602A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02005FD8

	thumb_func_start sub_0200602C
sub_0200602C: ; 0x0200602C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0200604C
	add r6, r0, #0
	ldr r1, _02006048 ; =0x0000FFFF
	add r0, r5, #0
	add r2, r4, #0
	bl sub_020061B4
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_02006048: .word 0x0000FFFF
	thumb_func_end sub_0200602C

	thumb_func_start sub_0200604C
sub_0200604C: ; 0x0200604C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl sub_020054D4
	bl sub_0200480C
	mov r1, #0
	mvn r1, r1
	add r2, r1, #0
	add r3, r1, #0
	str r4, [sp]
	bl sub_020060BC
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_0200604C

	thumb_func_start sub_0200606C
sub_0200606C: ; 0x0200606C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl sub_0200480C
	mov r2, #0
	mvn r2, r2
	add r1, r4, #0
	add r3, r2, #0
	str r5, [sp]
	bl sub_020060BC
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0200606C

	thumb_func_start sub_02006088
sub_02006088: ; 0x02006088
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0x20
	bl sub_02004400
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020054D4
	bl sub_0200480C
	add r6, r0, #0
	ldrh r0, [r4]
	bl sub_02005504
	mov r1, #0
	mvn r1, r1
	add r2, r0, #0
	add r0, r6, #0
	add r3, r1, #0
	str r5, [sp]
	bl sub_020060BC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_02006088

	thumb_func_start sub_020060BC
sub_020060BC: ; 0x020060BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	ldr r5, [sp, #0x20]
	bl sub_02005BFC
	cmp r0, #1
	bne _020060E0
	ldr r0, _02006114 ; =0x000005DC
	sub r0, r5, r0
	cmp r0, #1
	bhi _020060E0
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020060E0:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r3, [sp, #8]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_02006C14
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02005464
	cmp r4, #0
	bne _0200610C
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl sub_02004920
_0200610C:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02006114: .word 0x000005DC
	thumb_func_end sub_020060BC

	thumb_func_start sub_02006118
sub_02006118: ; 0x02006118
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0200604C
	add r6, r0, #0
	beq _0200612E
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020054AC
_0200612E:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02006118

	thumb_func_start sub_02006134
sub_02006134: ; 0x02006134
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0200604C
	add r6, r0, #0
	beq _0200614C
	ldr r1, _02006150 ; =0x0000FFFF
	add r0, r5, #0
	add r2, r4, #0
	bl sub_0200592C
_0200614C:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02006150: .word 0x0000FFFF
	thumb_func_end sub_02006134

	thumb_func_start sub_02006154
sub_02006154: ; 0x02006154
	ldr r3, _02006158 ; =sub_020C80C4
	bx r3
	.balign 4, 0
_02006158: .word sub_020C80C4
	thumb_func_end sub_02006154

	thumb_func_start sub_0200615C
sub_0200615C: ; 0x0200615C
	push {r4, lr}
	add r4, r1, #0
	bl sub_020047E8
	add r1, r4, #0
	bl sub_020C8058
	pop {r4, pc}
	thumb_func_end sub_0200615C

	thumb_func_start sub_0200616C
sub_0200616C: ; 0x0200616C
	push {r3, r4, r5, lr}
	mov r5, #0
	add r4, r5, #0
_02006172:
	add r0, r5, #3
	add r1, r4, #0
	bl sub_0200615C
	add r5, r5, #1
	cmp r5, #4
	blt _02006172
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0200616C

	thumb_func_start sub_02006184
sub_02006184: ; 0x02006184
	push {r3, lr}
	bl sub_020054D4
	bl sub_020054C0
	pop {r3, pc}
	thumb_func_end sub_02006184

	thumb_func_start sub_02006190
sub_02006190: ; 0x02006190
	ldr r3, _02006194 ; =sub_020054C0
	bx r3
	.balign 4, 0
_02006194: .word sub_020054C0
	thumb_func_end sub_02006190

	thumb_func_start sub_02006198
sub_02006198: ; 0x02006198
	push {r4, lr}
	mov r4, #0
_0200619C:
	add r0, r4, #3
	bl sub_020054C0
	cmp r0, #1
	bne _020061AA
	mov r0, #1
	pop {r4, pc}
_020061AA:
	add r4, r4, #1
	cmp r4, #4
	blt _0200619C
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02006198

	thumb_func_start sub_020061B4
sub_020061B4: ; 0x020061B4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_020054D4
	bl sub_0200480C
	bl sub_020047E8
	add r1, r5, #0
	add r2, r4, #0
	bl sub_020C829C
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020061B4

	thumb_func_start sub_020061D0
sub_020061D0: ; 0x020061D0
	push {r4, lr}
	add r4, r1, #0
	bl sub_0200480C
	bl sub_020047E8
	ldr r1, _020061E8 ; =0x0000FFFF
	add r2, r4, #0
	bl sub_020C829C
	pop {r4, pc}
	nop
_020061E8: .word 0x0000FFFF
	thumb_func_end sub_020061D0

	thumb_func_start sub_020061EC
sub_020061EC: ; 0x020061EC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #3
	bl sub_0200480C
	ldr r7, _02006214 ; =0x0000FFFF
	add r4, r0, #0
	mov r5, #0
_020061FC:
	add r0, r4, r5
	bl sub_020047E8
	add r1, r7, #0
	add r2, r6, #0
	bl sub_020C829C
	add r5, r5, #1
	cmp r5, #4
	blt _020061FC
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02006214: .word 0x0000FFFF
	thumb_func_end sub_020061EC

	thumb_func_start sub_02006218
sub_02006218: ; 0x02006218
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x12
	str r1, [sp, #8]
	bl sub_02004400
	add r7, r0, #0
	mov r0, #0x24
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x35
	bl sub_02004400
	add r4, r0, #0
	ldr r1, [sp, #8]
	add r0, r5, #0
	bl sub_02006A0C
	cmp r0, #1
	bne _02006246
	ldr r5, _020062D8 ; =0x000001EE
_02006246:
	ldr r0, _020062D8 ; =0x000001EE
	cmp r5, r0
	beq _02006258
	add r0, r0, #1
	cmp r5, r0
	bhi _02006256
	cmp r5, #0
	bne _02006258
_02006256:
	mov r5, #1
_02006258:
	ldr r0, _020062DC ; =0x000001B9
	cmp r5, r0
	bne _0200627A
	mov r1, #0
	ldr r0, [r6]
	mov r2, #0x7f
	add r3, r1, #0
	bl sub_02006D04
	cmp r0, #1
	bne _0200627A
	mov r0, #0
	bl sub_02006E3C
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0200627A:
	ldrb r0, [r7]
	cmp r0, #0
	bne _020062AC
	ldrb r0, [r4]
	cmp r0, #0
	bne _0200628C
	mov r0, #0
	bl sub_02006300
_0200628C:
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #1
	sub r1, r0, #2
	add r2, r5, #0
	add r3, r1, #0
	bl sub_02006C14
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_02005464
	b _020062CC
_020062AC:
	mov r0, #2
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #8
	add r1, r0, #0
	sub r1, #9
	add r2, r5, #0
	add r3, r1, #0
	bl sub_02006C14
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #8
	bl sub_02005464
_020062CC:
	mov r0, #0
	bl sub_02006E3C
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020062D8: .word 0x000001EE
_020062DC: .word 0x000001B9
	thumb_func_end sub_02006218

	thumb_func_start sub_020062E0
sub_020062E0: ; 0x020062E0
	push {lr}
	sub sp, #0xc
	add r3, r0, #0
	mov r0, #0xb
	str r0, [sp]
	str r1, [sp, #4]
	add r1, r3, #0
	mov r0, #0
	str r2, [sp, #8]
	add r2, r0, #0
	mov r3, #0x7f
	bl sub_02006920
	mov r0, #1
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_020062E0

	thumb_func_start sub_02006300
sub_02006300: ; 0x02006300
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x10
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0xf
	bl sub_02004400
	mov r0, #1
	bl sub_020047E8
	add r1, r5, #0
	bl sub_020C8058
	mov r0, #8
	bl sub_020047E8
	add r1, r5, #0
	bl sub_020C8058
	ldrb r0, [r6]
	cmp r0, #1
	bne _02006344
	mov r0, #0xe
	bl sub_020058B8
	mov r0, #0xe
	bl sub_02005680
_02006344:
	ldrb r0, [r4]
	cmp r0, #1
	bne _02006356
	mov r0, #0xf
	bl sub_020058B8
	mov r0, #0xf
	bl sub_02005680
_02006356:
	bl sub_02006DB8
	bl sub_02006A30
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02006300

	thumb_func_start sub_02006360
sub_02006360: ; 0x02006360
	push {r3, r4, r5, lr}
	mov r0, #0x10
	bl sub_02004400
	add r5, r0, #0
	mov r0, #0x11
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0xf
	bl sub_02004400
	mov r0, #0x2e
	bl sub_02004400
	ldrb r0, [r5]
	cmp r0, #1
	bne _0200638C
	mov r0, #0xe
	bl sub_02005738
	pop {r3, r4, r5, pc}
_0200638C:
	ldrb r0, [r4]
	cmp r0, #1
	bne _0200639A
	mov r0, #0xf
	bl sub_02005738
	pop {r3, r4, r5, pc}
_0200639A:
	mov r0, #0
	bl sub_020054C0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02006360

	thumb_func_start sub_020063A4
sub_020063A4: ; 0x020063A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp, #4]
	ldr r0, [sp, #0x38]
	add r4, r1, #0
	str r0, [sp, #0x38]
	mov r0, #0x10
	add r6, r2, #0
	add r7, r3, #0
	ldr r5, [sp, #0x3c]
	bl sub_02004400
	str r0, [sp, #0x14]
	mov r0, #0x11
	bl sub_02004400
	str r0, [sp, #0x10]
	mov r0, #0x12
	bl sub_02004400
	str r0, [sp, #0xc]
	mov r0, #0x1e
	bl sub_02004400
	str r0, [sp, #8]
	mov r0, #0x24
	bl sub_02004400
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006A0C
	cmp r0, #1
	bne _020063EA
	ldr r4, _02006740 ; =0x000001EE
_020063EA:
	ldr r0, _02006740 ; =0x000001EE
	cmp r4, r0
	beq _020063FC
	add r0, r0, #1
	cmp r4, r0
	bhi _020063FA
	cmp r4, #0
	bne _020063FC
_020063FA:
	mov r4, #1
_020063FC:
	lsr r0, r6, #0x1f
	add r0, r6, r0
	asr r0, r0, #1
	str r0, [sp, #0x1c]
	add r0, #0x40
	str r0, [sp, #0x1c]
	add r0, r7, #0
	str r0, [sp, #0x18]
	sub r0, #0x1e
	str r0, [sp, #0x18]
	cmp r0, #0
	bgt _02006418
	mov r0, #1
	str r0, [sp, #0x18]
_02006418:
	ldr r0, [sp, #0xc]
	mov r1, #0
	strb r1, [r0]
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r0, #1
	bne _02006432
	mov r0, #0xe
	bl sub_020058B8
	mov r0, #0xe
	bl sub_02005680
_02006432:
	ldr r0, [sp, #0x10]
	ldrb r0, [r0]
	cmp r0, #1
	bne _02006446
	mov r0, #0xf
	bl sub_020058B8
	mov r0, #0xf
	bl sub_02005680
_02006446:
	ldr r0, _02006744 ; =0x000001B9
	cmp r4, r0
	bne _020064DA
	ldr r1, [sp, #4]
	cmp r1, #0xc
	bhi _020064D4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0200645E: ; jump table
	.short _02006478 - _0200645E - 2 ; case 0
	.short _02006478 - _0200645E - 2 ; case 1
	.short _02006478 - _0200645E - 2 ; case 2
	.short _020064D4 - _0200645E - 2 ; case 3
	.short _020064D4 - _0200645E - 2 ; case 4
	.short _02006478 - _0200645E - 2 ; case 5
	.short _020064D4 - _0200645E - 2 ; case 6
	.short _020064D4 - _0200645E - 2 ; case 7
	.short _020064D4 - _0200645E - 2 ; case 8
	.short _020064D4 - _0200645E - 2 ; case 9
	.short _020064D4 - _0200645E - 2 ; case 10
	.short _02006478 - _0200645E - 2 ; case 11
	.short _02006478 - _0200645E - 2 ; case 12
_02006478:
	add r1, r5, #0
	bl sub_02006218
	ldr r0, [sp, #8]
	ldrb r0, [r0]
	cmp r0, #0
	bne _0200649C
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	b _020064CE
_0200649C:
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	cmp r0, #1
	bne _020064BA
	ldr r1, [sp, #0x1c]
	mov r0, #0xe
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02005748
	mov r0, #0xe
	add r1, r7, #0
	bl sub_02005774
	b _020064CE
_020064BA:
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
_020064CE:
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020064D4:
	mov r0, #1
	bl sub_02006E3C
_020064DA:
	ldr r0, [sp, #4]
	cmp r0, #0xe
	bls _020064E2
	b _02006814
_020064E2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020064EE: ; jump table
	.short _0200650C - _020064EE - 2 ; case 0
	.short _0200652A - _020064EE - 2 ; case 1
	.short _02006550 - _020064EE - 2 ; case 2
	.short _02006596 - _020064EE - 2 ; case 3
	.short _020065E4 - _020064EE - 2 ; case 4
	.short _02006636 - _020064EE - 2 ; case 5
	.short _02006660 - _020064EE - 2 ; case 6
	.short _020066A8 - _020064EE - 2 ; case 7
	.short _020066DA - _020064EE - 2 ; case 8
	.short _0200670A - _020064EE - 2 ; case 9
	.short _0200674C - _020064EE - 2 ; case 10
	.short _0200677E - _020064EE - 2 ; case 11
	.short _020067A8 - _020064EE - 2 ; case 12
	.short _020067DA - _020064EE - 2 ; case 13
	.short _0200680C - _020064EE - 2 ; case 14
_0200650C:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	b _02006814
_0200652A:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x14
	bl sub_02006838
	b _02006814
_02006550:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	mov r2, #0x40
	bl sub_02005918
	add r0, r4, #0
	mov r1, #0x14
	add r2, r5, #0
	bl sub_02006AC0
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #8
	add r2, r6, #0
	bl sub_02005958
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	mov r1, #8
	bl sub_02006820
	b _02006814
_02006596:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x1e
	bl sub_02006838
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	mov r2, #0xc0
	bl sub_02005918
	add r0, r4, #0
	mov r1, #0x10
	add r2, r5, #0
	bl sub_02006AC0
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #8
	add r2, r6, #0
	bl sub_02005958
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	mov r1, #8
	bl sub_02006820
	b _02006814
_020065E4:
	mov r0, #0xe
	bl sub_02005600
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	mov r3, #0xe
	bl sub_020057AC
	ldr r1, [sp, #0x1c]
	mov r0, #0xe
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02005748
	ldr r1, [sp, #0x38]
	mov r0, #0xf
	bl sub_02006838
	mov r1, #0x86
	mov r0, #0xe
	lsl r1, r1, #8
	bl sub_02005760
	ldr r0, [sp, #0x38]
	mov r1, #0x3f
	str r0, [sp]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	add r0, r4, #0
	mvn r1, r1
	bl sub_02006AF4
	mov r1, #0x86
	mov r0, #0xf
	lsl r1, r1, #8
	bl sub_02005760
	b _02006814
_02006636:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	mov r0, #1
	add r2, r0, #0
	ldr r1, _02006748 ; =0x0000FFFF
	sub r2, #0xe1
	bl sub_02005918
	b _02006814
_02006660:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	mov r2, #0x2c
	bl sub_02005918
	mov r1, #0x3f
	add r0, r4, #0
	mvn r1, r1
	add r2, r5, #0
	bl sub_02006AC0
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #8
	add r2, r6, #0
	bl sub_02005958
	ldr r2, [sp, #0x18]
	add r0, r4, #0
	mov r1, #8
	bl sub_02006820
	b _02006814
_020066A8:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0xb
	bl sub_02006838
	mov r0, #1
	add r2, r0, #0
	ldr r1, _02006748 ; =0x0000FFFF
	sub r2, #0x81
	bl sub_02005918
	b _02006814
_020066DA:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x3c
	bl sub_02006838
	ldr r1, _02006748 ; =0x0000FFFF
	mov r0, #1
	mov r2, #0x3c
	bl sub_02005918
	b _02006814
_0200670A:
	mov r0, #0xe
	bl sub_02005600
	ldr r0, [sp, #0x38]
	ldr r2, [sp, #0x1c]
	str r0, [sp]
	add r0, r4, #0
	add r1, r7, #0
	mov r3, #0xe
	bl sub_020057AC
	ldr r1, [sp, #0x1c]
	mov r0, #0xe
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02005748
	ldr r1, [sp, #0x38]
	mov r0, #0xd
	bl sub_02006838
	mov r1, #0x1a
	mov r0, #0xe
	lsl r1, r1, #0xa
	bl sub_02005760
	b _02006814
	.balign 4, 0
_02006740: .word 0x000001EE
_02006744: .word 0x000001B9
_02006748: .word 0x0000FFFF
_0200674C:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _0200681C ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x64
	bl sub_02006838
	mov r0, #1
	add r2, r0, #0
	ldr r1, _0200681C ; =0x0000FFFF
	sub r2, #0x2d
	bl sub_02005918
	b _02006814
_0200677E:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _0200681C ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	mov r0, #1
	add r2, r0, #0
	ldr r1, _0200681C ; =0x0000FFFF
	sub r2, #0x61
	bl sub_02005918
	b _02006814
_020067A8:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	ldr r1, _0200681C ; =0x0000FFFF
	mov r0, #1
	add r2, r6, #0
	bl sub_02005958
	add r0, r4, #0
	mov r1, #1
	add r2, r7, #0
	bl sub_02006820
	ldr r1, [sp, #0x38]
	mov r0, #0x14
	bl sub_02006838
	mov r0, #1
	add r2, r0, #0
	ldr r1, _0200681C ; =0x0000FFFF
	sub r2, #0x61
	bl sub_02005918
	b _02006814
_020067DA:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
	add r0, r4, #0
	mov r1, #1
	mov r2, #0x7f
	bl sub_02006820
	add r0, r4, #0
	mov r1, #0x14
	add r2, r5, #0
	bl sub_02006AC0
	ldr r1, _0200681C ; =0x0000FFFF
	mov r0, #8
	add r2, r6, #0
	bl sub_02005958
	mov r0, #8
	add r1, r7, #0
	mov r2, #0
	bl sub_02005408
	b _02006814
_0200680C:
	add r0, r4, #0
	add r1, r5, #0
	bl sub_02006218
_02006814:
	mov r0, #1
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0200681C: .word 0x0000FFFF
	thumb_func_end sub_020063A4

	thumb_func_start sub_02006820
sub_02006820: ; 0x02006820
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r1, r2, #0
	bl sub_0200542C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02005464
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02006820

	thumb_func_start sub_02006838
sub_02006838: ; 0x02006838
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x23
	bl sub_02004400
	add r6, r0, #0
	bl sub_020068F8
	add r0, r4, #0
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	bne _0200685C
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_0200685C:
	mov r2, #0
	strb r2, [r4]
	strb r2, [r4, #1]
	strb r2, [r4, #2]
	strb r2, [r4, #3]
	strb r2, [r4, #4]
	strb r2, [r4, #5]
	strb r2, [r4, #6]
	strb r2, [r4, #7]
	ldr r0, _02006880 ; =sub_02006884
	add r1, r4, #0
	str r5, [r4]
	bl sub_0200E320
	str r0, [r4, #4]
	str r0, [r6]
	pop {r4, r5, r6, pc}
	nop
_02006880: .word sub_02006884
	thumb_func_end sub_02006838

	thumb_func_start sub_02006884
sub_02006884: ; 0x02006884
	push {r4, r5, r6, lr}
	mov r0, #0x10
	add r5, r1, #0
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x11
	bl sub_02004400
	ldr r2, [r5]
	add r4, r0, #0
	cmp r2, #0xa
	bne _020068B0
	mov r0, #1
	mov r1, #0
	bl sub_02005408
	ldr r2, [r5]
	mov r0, #8
	mov r1, #0
	bl sub_02005408
_020068B0:
	ldr r0, [r5]
	sub r0, r0, #1
	str r0, [r5]
	bl sub_02006360
	cmp r0, #0
	bne _020068C2
	mov r0, #0
	str r0, [r5]
_020068C2:
	ldr r0, [r5]
	cmp r0, #0
	bgt _020068F6
	mov r0, #0
	bl sub_02006300
	ldrb r0, [r6]
	cmp r0, #1
	bne _020068E0
	mov r0, #0xe
	bl sub_020058B8
	mov r0, #0xe
	bl sub_02005680
_020068E0:
	ldrb r0, [r4]
	cmp r0, #1
	bne _020068F2
	mov r0, #0xf
	bl sub_020058B8
	mov r0, #0xf
	bl sub_02005680
_020068F2:
	bl sub_020068F8
_020068F6:
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02006884

	thumb_func_start sub_020068F8
sub_020068F8: ; 0x020068F8
	push {r3, r4, r5, lr}
	mov r0, #0x23
	bl sub_02004400
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0200691A
	bl sub_0201F988
	add r5, r0, #0
	ldr r0, [r4]
	bl sub_0200E390
	add r0, r5, #0
	bl FreeToHeap
_0200691A:
	mov r0, #0
	str r0, [r4]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020068F8

	thumb_func_start sub_02006920
sub_02006920: ; 0x02006920
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r0, #0
	mov r0, #6
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0x35
	bl sub_02004400
	str r0, [sp, #0xc]
	ldrb r0, [r4]
	cmp r0, #0
	bne _02006974
	mov r0, #0x29
	bl sub_02004400
	str r0, [sp, #0x24]
	mov r0, #0x2d
	bl sub_02004400
	str r0, [sp, #0x20]
	mov r0, #0x2a
	bl sub_02004400
	str r0, [sp, #0x1c]
	mov r0, #0x2b
	bl sub_02004400
	str r0, [sp, #0x18]
	mov r0, #0x2c
	bl sub_02004400
	str r0, [sp, #0x14]
	mov r0, #0x2e
	bl sub_02004400
	str r0, [sp, #0x10]
	b _020069A4
_02006974:
	mov r0, #0x2f
	bl sub_02004400
	str r0, [sp, #0x24]
	mov r0, #0x33
	bl sub_02004400
	str r0, [sp, #0x20]
	mov r0, #0x30
	bl sub_02004400
	str r0, [sp, #0x1c]
	mov r0, #0x31
	bl sub_02004400
	str r0, [sp, #0x18]
	mov r0, #0x32
	bl sub_02004400
	str r0, [sp, #0x14]
	mov r0, #0x34
	bl sub_02004400
	str r0, [sp, #0x10]
_020069A4:
	ldr r0, [sp, #0xc]
	ldrb r0, [r0]
	cmp r0, #1
	bne _020069B4
	ldrb r1, [r4]
	mov r0, #1
	eor r0, r1
	strb r0, [r4]
_020069B4:
	add r1, sp, #0x30
	ldrb r1, [r1, #0x18]
	add r0, r5, #0
	bl sub_02006A0C
	cmp r0, #1
	bne _020069C4
	ldr r5, _02006A08 ; =0x000001EE
_020069C4:
	cmp r5, #0
	beq _02006A04
	add r1, sp, #0x30
	ldrb r0, [r1, #0x14]
	cmp r0, #0
	bne _020069E8
	ldr r0, [sp, #0x40]
	ldr r3, [sp, #8]
	str r0, [sp]
	ldrb r0, [r1, #0x18]
	add r1, r5, #0
	add r2, r7, #0
	str r0, [sp, #4]
	add r0, r6, #0
	bl sub_020063A4
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
_020069E8:
	ldr r1, [sp, #0x24]
	ldr r2, [sp, #8]
	str r6, [r1]
	ldr r1, [sp, #0x20]
	strh r5, [r1]
	ldr r1, [sp, #0x1c]
	str r7, [r1]
	ldr r1, [sp, #0x18]
	str r2, [r1]
	ldr r2, [sp, #0x40]
	ldr r1, [sp, #0x14]
	str r2, [r1]
	ldr r1, [sp, #0x10]
	strb r0, [r1]
_02006A04:
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02006A08: .word 0x000001EE
	thumb_func_end sub_02006920

	thumb_func_start sub_02006A0C
sub_02006A0C: ; 0x02006A0C
	mov r2, #0x7b
	lsl r2, r2, #2
	cmp r0, r2
	bne _02006A1C
	cmp r1, #1
	bne _02006A1C
	mov r0, #1
	bx lr
_02006A1C:
	ldr r1, _02006A2C ; =0x000001EE
	cmp r0, r1
	bne _02006A26
	mov r0, #1
	bx lr
_02006A26:
	mov r0, #0
	bx lr
	nop
_02006A2C: .word 0x000001EE
	thumb_func_end sub_02006A0C

	thumb_func_start sub_02006A30
sub_02006A30: ; 0x02006A30
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	mov r0, #0x29
	bl sub_02004400
	add r5, r0, #0
	mov r0, #0x2d
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0x2a
	bl sub_02004400
	add r6, r0, #0
	mov r0, #0x2b
	bl sub_02004400
	add r7, r0, #0
	mov r0, #0x2c
	bl sub_02004400
	str r0, [sp]
	mov r0, #0x2e
	bl sub_02004400
	str r0, [sp, #4]
	mov r0, #0x2f
	bl sub_02004400
	str r0, [sp, #8]
	mov r0, #0x33
	bl sub_02004400
	str r0, [sp, #0xc]
	mov r0, #0x30
	bl sub_02004400
	str r0, [sp, #0x10]
	mov r0, #0x31
	bl sub_02004400
	str r0, [sp, #0x14]
	mov r0, #0x32
	bl sub_02004400
	str r0, [sp, #0x18]
	mov r0, #0x34
	bl sub_02004400
	mov r1, #0
	str r1, [r5]
	strh r1, [r4]
	str r1, [r6]
	ldr r2, [sp]
	str r1, [r7]
	str r1, [r2]
	ldr r2, [sp, #4]
	strb r1, [r2]
	ldr r2, [sp, #8]
	str r1, [r2]
	ldr r2, [sp, #0xc]
	strh r1, [r2]
	ldr r2, [sp, #0x10]
	str r1, [r2]
	ldr r2, [sp, #0x14]
	str r1, [r2]
	ldr r2, [sp, #0x18]
	str r1, [r2]
	strb r1, [r0]
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02006A30

	thumb_func_start sub_02006AC0
sub_02006AC0: ; 0x02006AC0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x12
	add r4, r1, #0
	add r6, r2, #0
	bl sub_02004400
	mov r1, #1
	strb r1, [r0]
	add r0, r1, #0
	bl sub_02006E3C
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02006218
	add r5, r0, #0
	ldr r1, _02006AF0 ; =0x0000FFFF
	mov r0, #8
	add r2, r4, #0
	bl sub_02005918
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02006AF0: .word 0x0000FFFF
	thumb_func_end sub_02006AC0

	thumb_func_start sub_02006AF4
sub_02006AF4: ; 0x02006AF4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	mov r0, #0x12
	add r4, r2, #0
	add r6, r3, #0
	bl sub_02004400
	mov r1, #1
	strb r1, [r0]
	mov r0, #0xf
	bl sub_02005600
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	str r0, [sp]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #0xf
	bl sub_020057AC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02006AF4

	thumb_func_start sub_02006B24
sub_02006B24: ; 0x02006B24
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	bl sub_020054F8
	add r0, r4, #0
	bl sub_02006C04
	bl sub_02004A90
	bl sub_020054D4
	cmp r0, #0xff
	beq _02006B48
	mov r1, #1
	bl sub_020053A8
	b _02006B4E
_02006B48:
	mov r0, #1
	bl sub_02004A2C
_02006B4E:
	mov r0, #0x1d
	bl sub_02004400
	bl sub_020046E8
	add r0, r4, #0
	mov r1, #3
	bl sub_02004784
	str r4, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #2
	sub r1, r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02006C14
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #2
	bl sub_02005464
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02006B24

	thumb_func_start sub_02006B84
sub_02006B84: ; 0x02006B84
	push {r4, lr}
	mov r0, #0xe
	bl sub_02004400
	add r4, r0, #0
	mov r0, #2
	bl sub_020054C0
	cmp r0, #0
	beq _02006B9C
	mov r0, #1
	pop {r4, pc}
_02006B9C:
	ldrh r0, [r4]
	cmp r0, #0
	beq _02006BAA
	sub r0, r0, #1
	strh r0, [r4]
	mov r0, #1
	pop {r4, pc}
_02006BAA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02006B84

	thumb_func_start sub_02006BB0
sub_02006BB0: ; 0x02006BB0
	push {r4, lr}
	add r4, r0, #0
	mov r0, #2
	bl sub_020047E8
	add r1, r4, #0
	bl sub_020C8058
	mov r0, #6
	bl sub_02005328
	bl sub_02004714
	pop {r4, pc}
	thumb_func_end sub_02006BB0

	thumb_func_start sub_02006BCC
sub_02006BCC: ; 0x02006BCC
	push {r3, lr}
	mov r0, #0xe
	bl sub_02004400
	bl sub_02006B84
	cmp r0, #1
	bne _02006BE0
	mov r0, #1
	pop {r3, pc}
_02006BE0:
	mov r0, #0
	bl sub_02006BB0
	bl sub_02004A90
	bl sub_020054D4
	cmp r0, #0xff
	beq _02006BF8
	mov r1, #0
	bl sub_020053A8
_02006BF8:
	mov r0, #0
	bl sub_02004A2C
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02006BCC

	thumb_func_start sub_02006C04
sub_02006C04: ; 0x02006C04
	push {r3, lr}
	mov r0, #0xe
	bl sub_02004400
	mov r1, #0xf
	strh r1, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02006C04

	thumb_func_start sub_02006C14
sub_02006C14: ; 0x02006C14
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp, #4]
	add r0, sp, #0x10
	ldrh r6, [r0, #0x10]
	ldrb r0, [r0, #0x14]
	add r5, r1, #0
	add r7, r2, #0
	str r3, [sp, #8]
	cmp r0, #1
	bne _02006C6A
	bl sub_02005C18
	cmp r0, #1
	bne _02006C6A
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	bl sub_02005C6C
	add r1, sp, #0x10
	ldrh r1, [r1, #0x10]
	add r4, r0, #0
	cmp r1, r4
	beq _02006C6A
	add r6, r4, #0
	ldr r7, _02006C88 ; =0x000002BD
	bl sub_02004AB8
	add r0, r4, #0
	bl sub_020054D4
	mov r1, #0
	mvn r1, r1
	cmp r5, r1
	beq _02006C5E
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
_02006C5E:
	cmp r0, #7
	bne _02006C6A
	add r0, r4, #0
	mov r1, #1
	bl sub_02004784
_02006C6A:
	ldr r0, [sp, #4]
	bl sub_020047E8
	ldr r3, [sp, #8]
	add r1, r5, #0
	add r2, r7, #0
	str r6, [sp]
	bl sub_020CA8E4
	add r4, r0, #0
	bl sub_02005CC0
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02006C88: .word 0x000002BD
	thumb_func_end sub_02006C14

	thumb_func_start sub_02006C8C
sub_02006C8C: ; 0x02006C8C
	push {r4, lr}
	mov r0, #0x10
	bl sub_02004400
	add r4, r0, #0
	mov r0, #0x1e
	bl sub_02004400
	ldrb r0, [r0]
	cmp r0, #1
	bne _02006CC2
	ldrb r0, [r4]
	cmp r0, #1
	bne _02006CBA
	mov r0, #0xe
	bl sub_02005738
	cmp r0, #0
	bne _02006CC2
	bl sub_02006DB8
	mov r0, #1
	pop {r4, pc}
_02006CBA:
	bl sub_02006DB8
	mov r0, #1
	pop {r4, pc}
_02006CC2:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02006C8C

	thumb_func_start sub_02006CC8
sub_02006CC8: ; 0x02006CC8
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0x1f
	bl sub_02004400
	add r5, r0, #0
	mov r0, #0x36
	bl sub_02004400
	add r4, r0, #0
	add r0, r6, #0
	bl sub_0202CE70
	cmp r0, #0
	bne _02006CEA
	mov r0, #0
	pop {r4, r5, r6, pc}
_02006CEA:
	ldrb r0, [r4]
	cmp r0, #1
	bne _02006CF4
	mov r0, #0
	pop {r4, r5, r6, pc}
_02006CF4:
	ldrb r0, [r5]
	cmp r0, #1
	beq _02006CFE
	mov r0, #1
	pop {r4, r5, r6, pc}
_02006CFE:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02006CC8

	thumb_func_start sub_02006D04
sub_02006D04: ; 0x02006D04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	add r6, r0, #0
	add r5, r2, #0
	add r7, r3, #0
	bl sub_020059D8
	str r0, [sp]
	mov r0, #0x1e
	bl sub_02004400
	str r0, [sp, #4]
	add r0, r6, #0
	bl sub_02006CC8
	cmp r0, #0
	bne _02006D2C
	add sp, #0x30
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02006D2C:
	mov r0, #0
	bl sub_02006300
	bl sub_02006DB8
	mov r0, #0xe
	bl sub_02005600
	bl sub_0201FD44
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x13
	sub r1, r1, r2
	mov r0, #0x13
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r6, #0
	bl sub_0202CE7C
	add r1, r0, #0
	ldr r0, [sp]
	bl sub_0202CE80
	mov r0, #0xe
	bl sub_020055AC
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	bl sub_020059D8
	str r0, [sp, #0x10]
	mov r0, #0
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	mov r0, #0x7d
	lsl r0, r0, #4
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	mov r0, #2
	lsl r0, r0, #0xe
	add r0, r4, r0
	str r0, [sp, #0x28]
	lsr r0, r7, #0x1f
	add r0, r7, r0
	asr r0, r0, #1
	add r0, #0x40
	str r0, [sp, #0x2c]
	add r0, sp, #8
	mov r1, #0xe
	str r5, [sp, #0x24]
	bl sub_020056E8
	add r4, r0, #0
	mov r0, #0xe
	add r1, r5, #0
	bl sub_02005774
	ldr r0, [sp, #4]
	mov r1, #1
	strb r1, [r0]
	mov r0, #0
	bl sub_02006E3C
	add r0, r4, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02006D04

	thumb_func_start sub_02006DB8
sub_02006DB8: ; 0x02006DB8
	push {r3, r4, r5, lr}
	mov r0, #0x10
	bl sub_02004400
	add r5, r0, #0
	mov r0, #0x1e
	bl sub_02004400
	add r4, r0, #0
	ldrb r0, [r5]
	cmp r0, #1
	bne _02006DDC
	mov r0, #0xe
	bl sub_020058B8
	mov r0, #0xe
	bl sub_02005680
_02006DDC:
	mov r0, #0
	strb r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02006DB8

	thumb_func_start sub_02006DE4
sub_02006DE4: ; 0x02006DE4
	push {lr}
	sub sp, #0x1c
	mov r0, #2
	str r0, [sp]
	bl sub_020059D8
	mov r1, #0x7d
	str r0, [sp, #4]
	lsl r1, r1, #4
	mov r0, #0x1f
	str r1, [sp, #8]
	tst r0, r1
	beq _02006E04
	mov r0, #0x1f
	bic r1, r0
	str r1, [sp, #8]
_02006E04:
	ldr r0, _02006E1C ; =0x00004174
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0x18]
	add r0, sp, #0
	bl sub_02005520
	add sp, #0x1c
	pop {pc}
	nop
_02006E1C: .word 0x00004174
	thumb_func_end sub_02006DE4

	thumb_func_start sub_02006E20
sub_02006E20: ; 0x02006E20
	ldr r3, _02006E24 ; =sub_02005550
	bx r3
	.balign 4, 0
_02006E24: .word sub_02005550
	thumb_func_end sub_02006E20

	thumb_func_start sub_02006E28
sub_02006E28: ; 0x02006E28
	push {r4, lr}
	add r4, r0, #0
	bl sub_020059D8
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0202CEB8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02006E28

	thumb_func_start sub_02006E3C
sub_02006E3C: ; 0x02006E3C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1f
	bl sub_02004400
	strb r4, [r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02006E3C

	thumb_func_start sub_02006E4C
sub_02006E4C: ; 0x02006E4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x24
	add r7, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_02004400
	cmp r5, #0
	bne _02006E70
	ldr r0, [r0]
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02006D04
	b _02006E7C
_02006E70:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02006D04
_02006E7C:
	cmp r0, #0
	bne _02006E98
	mov r0, #1
	bl sub_02006E3C
	mov r0, #0xb
	str r0, [sp]
	mov r0, #0
	ldr r1, _02006E9C ; =0x000001B9
	add r2, r6, #0
	add r3, r4, #0
	str r0, [sp, #4]
	bl sub_020063A4
_02006E98:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02006E9C: .word 0x000001B9
	thumb_func_end sub_02006E4C

	thumb_func_start sub_02006EA0
sub_02006EA0: ; 0x02006EA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0x24
	add r7, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl sub_02004400
	cmp r5, #0
	bne _02006EC4
	ldr r0, [r0]
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02006D04
	b _02006ED0
_02006EC4:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl sub_02006D04
_02006ED0:
	cmp r0, #0
	bne _02006EF4
	mov r0, #1
	bl sub_02006E3C
	mov r0, #0xb
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	ldr r1, _02006EF8 ; =0x000001B9
	add r2, r6, #0
	str r0, [sp, #4]
	mov r0, #0
	add r3, r4, #0
	str r0, [sp, #8]
	bl sub_02006920
	mov r0, #1
_02006EF4:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02006EF8: .word 0x000001B9
	thumb_func_end sub_02006EA0

	thumb_func_start sub_02006EFC
sub_02006EFC: ; 0x02006EFC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0202CE70
	cmp r0, #0
	bne _02006F0C
	mov r0, #0
	pop {r4, pc}
_02006F0C:
	add r0, r4, #0
	bl sub_0202CE7C
	mov r1, #0xf
	ldrsb r0, [r0, r1]
	sub r1, #0x2d
	cmp r0, r1
	bge _02006F20
	mov r0, #1
	pop {r4, pc}
_02006F20:
	cmp r0, #0x1e
	blt _02006F2C
	cmp r0, #0x80
	bge _02006F2C
	mov r0, #2
	pop {r4, pc}
_02006F2C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_02006EFC

	thumb_func_start sub_02006F30
sub_02006F30: ; 0x02006F30
	cmp r0, #0xb
	bgt _02006F4A
	bge _02006F4E
	cmp r0, #5
	bgt _02006F52
	cmp r0, #0
	blt _02006F52
	beq _02006F4E
	cmp r0, #1
	beq _02006F4E
	cmp r0, #5
	beq _02006F4E
	b _02006F52
_02006F4A:
	cmp r0, #0xc
	bne _02006F52
_02006F4E:
	mov r0, #1
	bx lr
_02006F52:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end sub_02006F30

	.data

_0210E980:
	.asciz "data/sound/gs_sound_data.sdat"
	.balign 4, 0
