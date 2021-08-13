	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020011DC
sub_020011DC: ; 0x020011DC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r3, #0
	mov r1, #0x38
	add r7, r2, #0
	str r3, [sp]
	bl AllocFromHeap
	add r4, r0, #0
	add r3, r5, #0
	add r2, r4, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp]
	bl sub_02015788
	str r0, [r4, #0x28]
	strh r6, [r4, #0x2c]
	add r1, r4, #0
	strh r7, [r4, #0x2e]
	mov r0, #0
	add r1, #0x30
	strb r0, [r1]
	add r1, r4, #0
	add r1, #0x31
	strb r0, [r1]
	add r1, r4, #0
	mov r2, #0xff
	add r1, #0x32
	strb r2, [r1]
	add r1, r4, #0
	add r1, #0x33
	strb r0, [r1]
	add r1, r4, #0
	ldr r0, [sp]
	add r1, #0x34
	strb r0, [r1]
	add r0, r4, #0
	ldrb r1, [r4, #0x17]
	add r0, #0x20
	ldrb r2, [r0]
	lsl r1, r1, #0x18
	mov r0, #0xf
	lsr r3, r1, #0x1c
	mov r1, #0xf
	bic r2, r0
	and r3, r1
	orr r3, r2
	add r2, r4, #0
	add r2, #0x20
	strb r3, [r2]
	add r2, r4, #0
	add r2, #0x20
	ldrb r2, [r2]
	mov r3, #0xf0
	bic r2, r3
	ldrb r3, [r4, #0x18]
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x1c
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x18
	orr r3, r2
	add r2, r4, #0
	add r2, #0x20
	strb r3, [r2]
	add r2, r4, #0
	add r2, #0x21
	ldrb r2, [r2]
	bic r2, r0
	ldrb r0, [r4, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	and r0, r1
	add r1, r2, #0
	orr r1, r0
	add r0, r4, #0
	add r0, #0x21
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x22
	ldrb r0, [r0]
	mov r1, #0x3f
	bic r0, r1
	ldrh r1, [r4, #0x1a]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1d
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0x3f
	and r1, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x22
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x24
	ldrb r0, [r0]
	mov r1, #0x7f
	bic r0, r1
	ldrh r1, [r4, #0x1a]
	lsl r1, r1, #0x11
	lsr r1, r1, #0x1a
	lsl r1, r1, #0x18
	lsr r2, r1, #0x18
	mov r1, #0x7f
	and r1, r2
	orr r1, r0
	add r0, r4, #0
	add r0, #0x24
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x24
	ldrb r1, [r0]
	mov r0, #0x80
	bic r1, r0
	add r0, r4, #0
	add r0, #0x24
	strb r1, [r0]
	ldrh r1, [r4, #0x10]
	ldrh r0, [r4, #0x12]
	cmp r1, r0
	bhs _020012E0
	strh r1, [r4, #0x12]
_020012E0:
	ldrb r2, [r4, #0x18]
	ldr r0, [r4, #0x28]
	lsl r1, r2, #0x1c
	lsr r1, r1, #0x1c
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	ldrb r1, [r4, #0x17]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1c
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	lsr r1, r1, #8
	lsr r2, r2, #0x10
	orr r1, r2
	orr r1, r3
	bl sub_020157D8
	ldrb r1, [r4, #0x18]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl sub_0201D978
	ldrh r1, [r4, #0x2c]
	ldrh r3, [r4, #0x12]
	add r0, r4, #0
	mov r2, #0
	bl sub_02001688
	add r0, r4, #0
	bl sub_02001720
	add r0, r4, #0
	mov r1, #1
	bl sub_02001AD8
	ldr r0, [r5, #0xc]
	bl sub_0201D578
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020011DC

	thumb_func_start sub_02001338
sub_02001338: ; 0x02001338
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r1, r4, #0
	ldr r6, _02001430 ; =0x021D110C
	mov r3, #0
	add r1, #0x33
	strb r3, [r1]
	ldr r1, [r6, #0x48]
	mov r2, #1
	add r5, r1, #0
	tst r5, r2
	beq _02001360
	ldrh r1, [r4, #0x2c]
	ldrh r0, [r4, #0x2e]
	ldr r2, [r4]
	add r0, r1, r0
	lsl r0, r0, #3
	add r0, r2, r0
	ldr r0, [r0, #4]
	pop {r4, r5, r6, pc}
_02001360:
	mov r5, #2
	tst r1, r5
	beq _0200136A
	sub r0, r5, #4
	pop {r4, r5, r6, pc}
_0200136A:
	ldr r5, [r6, #0x4c]
	mov r1, #0x40
	tst r1, r5
	beq _02001388
	add r1, r2, #0
	bl sub_02001A18
	cmp r0, #0
	bne _02001382
	mov r0, #1
	add r4, #0x33
	strb r0, [r4]
_02001382:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02001388:
	mov r1, #0x80
	add r3, r5, #0
	tst r3, r1
	beq _020013A8
	add r1, r2, #0
	add r3, r2, #0
	bl sub_02001A18
	cmp r0, #0
	bne _020013A2
	mov r0, #2
	add r4, #0x33
	strb r0, [r4]
_020013A2:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_020013A8:
	ldrh r0, [r4, #0x1a]
	lsl r0, r0, #0x17
	lsr r0, r0, #0x1e
	beq _020013B8
	cmp r0, #1
	beq _020013BE
	cmp r0, #2
	beq _020013D0
_020013B8:
	mov r0, #0
	add r1, r0, #0
	b _020013E0
_020013BE:
	mov r0, #0x20
	mov r1, #0x10
	and r0, r5
	and r1, r5
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	b _020013E0
_020013D0:
	lsl r0, r1, #2
	add r1, #0x80
	and r0, r5
	and r1, r5
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
_020013E0:
	cmp r0, #0
	beq _02001404
	ldrh r2, [r4, #0x12]
	add r0, r4, #0
	mov r1, #1
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02001A18
	cmp r0, #0
	bne _020013FE
	mov r0, #3
	add r4, #0x33
	strb r0, [r4]
_020013FE:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02001404:
	cmp r1, #0
	beq _02001428
	ldrh r2, [r4, #0x12]
	mov r1, #1
	add r0, r4, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	add r3, r1, #0
	bl sub_02001A18
	cmp r0, #0
	bne _02001422
	mov r0, #4
	add r4, #0x33
	strb r0, [r4]
_02001422:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02001428:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	nop
_02001430: .word 0x021D110C
	thumb_func_end sub_02001338

	thumb_func_start sub_02001434
sub_02001434: ; 0x02001434
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	beq _02001440
	ldrh r0, [r4, #0x2c]
	strh r0, [r1]
_02001440:
	cmp r2, #0
	beq _02001448
	ldrh r0, [r4, #0x2e]
	strh r0, [r2]
_02001448:
	ldr r0, [r4, #0x28]
	bl sub_020157B8
	add r0, r4, #0
	add r0, #0x34
	ldrb r0, [r0]
	add r1, r4, #0
	bl sub_0201AB80
	pop {r4, pc}
	thumb_func_end sub_02001434

	thumb_func_start sub_0200145C
sub_0200145C: ; 0x0200145C
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #0x18]
	ldr r0, [r4, #0xc]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl sub_0201D978
	ldrh r1, [r4, #0x2c]
	ldrh r3, [r4, #0x12]
	add r0, r4, #0
	mov r2, #0
	bl sub_02001688
	add r0, r4, #0
	bl sub_02001720
	ldr r0, [r4, #0xc]
	bl sub_0201D578
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0200145C

	thumb_func_start sub_02001488
sub_02001488: ; 0x02001488
	push {r3, r4, r5, r6}
	add r4, r0, #0
	add r4, #0x20
	ldrb r6, [r4]
	mov r4, #0xf
	mov r5, #0xf
	bic r6, r4
	and r1, r5
	orr r6, r1
	add r1, r0, #0
	add r1, #0x20
	strb r6, [r1]
	add r1, r0, #0
	add r1, #0x20
	lsl r2, r2, #0x1c
	ldrb r1, [r1]
	mov r6, #0xf0
	lsr r2, r2, #0x18
	bic r1, r6
	orr r2, r1
	add r1, r0, #0
	add r1, #0x20
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x21
	ldrb r2, [r1]
	add r1, r3, #0
	and r1, r5
	bic r2, r4
	orr r2, r1
	add r1, r0, #0
	add r1, #0x21
	strb r2, [r1]
	add r1, r0, #0
	add r1, #0x24
	ldrb r2, [r1]
	mov r1, #0x80
	add r0, #0x24
	orr r1, r2
	strb r1, [r0]
	pop {r3, r4, r5, r6}
	bx lr
	thumb_func_end sub_02001488

	thumb_func_start sub_020014DC
sub_020014DC: ; 0x020014DC
	ldrh r2, [r0, #0x2c]
	ldrh r0, [r0, #0x2e]
	add r0, r2, r0
	strh r0, [r1]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020014DC

	thumb_func_start sub_020014E8
sub_020014E8: ; 0x020014E8
	cmp r1, #0
	beq _020014F0
	ldrh r3, [r0, #0x2c]
	strh r3, [r1]
_020014F0:
	cmp r2, #0
	beq _020014F8
	ldrh r0, [r0, #0x2e]
	strh r0, [r2]
_020014F8:
	bx lr
	.balign 4, 0
	thumb_func_end sub_020014E8

	thumb_func_start sub_020014FC
sub_020014FC: ; 0x020014FC
	ldr r2, [r0]
	lsl r0, r1, #3
	add r0, r2, r0
	ldr r0, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020014FC

	thumb_func_start sub_02001508
sub_02001508: ; 0x02001508
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0x13
	bhi _020015CA
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0200151C: ; jump table
	.short _02001544 - _0200151C - 2 ; case 0
	.short _02001548 - _0200151C - 2 ; case 1
	.short _0200154C - _0200151C - 2 ; case 2
	.short _02001550 - _0200151C - 2 ; case 3
	.short _020015CA - _0200151C - 2 ; case 4
	.short _02001554 - _0200151C - 2 ; case 5
	.short _02001558 - _0200151C - 2 ; case 6
	.short _0200155C - _0200151C - 2 ; case 7
	.short _02001560 - _0200151C - 2 ; case 8
	.short _02001568 - _0200151C - 2 ; case 9
	.short _02001582 - _0200151C - 2 ; case 10
	.short _0200158A - _0200151C - 2 ; case 11
	.short _02001592 - _0200151C - 2 ; case 12
	.short _0200159A - _0200151C - 2 ; case 13
	.short _020015A2 - _0200151C - 2 ; case 14
	.short _020015AA - _0200151C - 2 ; case 15
	.short _020015B2 - _0200151C - 2 ; case 16
	.short _020015BA - _0200151C - 2 ; case 17
	.short _020015C2 - _0200151C - 2 ; case 18
	.short _020015C6 - _0200151C - 2 ; case 19
_02001544:
	ldr r0, [r4, #4]
	pop {r4, pc}
_02001548:
	ldr r0, [r4, #8]
	pop {r4, pc}
_0200154C:
	ldrh r0, [r4, #0x10]
	pop {r4, pc}
_02001550:
	ldrh r0, [r4, #0x12]
	pop {r4, pc}
_02001554:
	ldrb r0, [r4, #0x14]
	pop {r4, pc}
_02001558:
	ldrb r0, [r4, #0x15]
	pop {r4, pc}
_0200155C:
	ldrb r0, [r4, #0x16]
	pop {r4, pc}
_02001560:
	ldrb r0, [r4, #0x17]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	pop {r4, pc}
_02001568:
	ldrh r0, [r4, #0x1a]
	mov r1, #1
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1a
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02002FAC
	ldrh r1, [r4, #0x1a]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1c
	add r0, r1, r0
	pop {r4, pc}
_02001582:
	ldrb r0, [r4, #0x17]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	pop {r4, pc}
_0200158A:
	ldrb r0, [r4, #0x18]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	pop {r4, pc}
_02001592:
	ldrb r0, [r4, #0x18]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	pop {r4, pc}
_0200159A:
	ldrh r0, [r4, #0x1a]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	pop {r4, pc}
_020015A2:
	ldrh r0, [r4, #0x1a]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x1c
	pop {r4, pc}
_020015AA:
	ldrh r0, [r4, #0x1a]
	lsl r0, r0, #0x17
	lsr r0, r0, #0x1e
	pop {r4, pc}
_020015B2:
	ldrh r0, [r4, #0x1a]
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1a
	pop {r4, pc}
_020015BA:
	ldrh r0, [r4, #0x1a]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1f
	pop {r4, pc}
_020015C2:
	ldr r0, [r4, #0xc]
	pop {r4, pc}
_020015C6:
	ldr r0, [r4, #0x1c]
	pop {r4, pc}
_020015CA:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	thumb_func_end sub_02001508

	thumb_func_start sub_020015D0
sub_020015D0: ; 0x020015D0
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r6, r0, #0
	add r4, r2, #0
	cmp r5, #0
	beq _02001684
	add r0, #0x24
	ldrb r0, [r0]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	str r3, [sp]
	beq _02001640
	mov r0, #0xff
	str r0, [sp, #4]
	add r0, r6, #0
	add r0, #0x20
	ldrb r2, [r0]
	add r3, r4, #0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x1c
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	lsl r0, r2, #0x1c
	add r2, r6, #0
	add r2, #0x21
	ldrb r2, [r2]
	lsr r0, r0, #0x1c
	lsl r0, r0, #0x18
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1c
	lsl r2, r2, #0x18
	lsr r0, r0, #8
	lsr r2, r2, #0x10
	orr r0, r2
	orr r0, r1
	str r0, [sp, #8]
	add r0, r6, #0
	add r0, #0x22
	ldrb r0, [r0]
	add r2, r5, #0
	lsl r0, r0, #0x1a
	lsr r0, r0, #0x1a
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [r6, #0xc]
	add r6, #0x24
	ldrb r1, [r6]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x19
	bl sub_02020150
	add sp, #0x18
	pop {r4, r5, r6, pc}
_02001640:
	mov r0, #0xff
	str r0, [sp, #4]
	ldrb r1, [r6, #0x18]
	add r3, r4, #0
	lsl r0, r1, #0x1c
	lsr r0, r0, #0x1c
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	ldrb r0, [r6, #0x17]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x1c
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1c
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #8
	lsr r1, r1, #0x10
	orr r0, r1
	orr r0, r2
	str r0, [sp, #8]
	ldrh r0, [r6, #0x1a]
	add r2, r5, #0
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1d
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldrh r1, [r6, #0x1a]
	ldr r0, [r6, #0xc]
	lsl r1, r1, #0x11
	lsr r1, r1, #0x1a
	bl sub_02020150
_02001684:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020015D0

	thumb_func_start sub_02001688
sub_02001688: ; 0x02001688
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	str r3, [sp]
	ldrh r0, [r5, #0x1a]
	add r4, r1, #0
	mov r1, #1
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1a
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r6, r2, #0
	bl sub_02002FAC
	ldrh r1, [r5, #0x1a]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1c
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp]
	cmp r0, #0
	ble _0200171A
_020016BC:
	ldr r1, [r5]
	lsl r0, r4, #3
	str r0, [sp, #8]
	add r0, r1, r0
	ldr r1, [r0, #4]
	mov r0, #2
	mvn r0, r0
	cmp r1, r0
	beq _020016D4
	ldrb r0, [r5, #0x15]
	str r0, [sp, #4]
	b _020016D8
_020016D4:
	ldrb r0, [r5, #0x14]
	str r0, [sp, #4]
_020016D8:
	ldrb r0, [r5, #0x17]
	lsl r0, r0, #0x1c
	lsr r3, r0, #0x1c
	ldr r0, [sp, #0xc]
	add r2, r0, #0
	mul r2, r6
	add r0, r3, r2
	lsl r0, r0, #0x18
	ldr r3, [r5, #8]
	lsr r7, r0, #0x18
	cmp r3, #0
	beq _020016F6
	add r0, r5, #0
	add r2, r7, #0
	blx r3
_020016F6:
	ldr r2, [r5]
	ldr r1, [sp, #8]
	add r0, r5, #0
	ldr r1, [r2, r1]
	ldr r2, [sp, #4]
	add r3, r7, #0
	bl sub_020015D0
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, [sp, #0x10]
	add r6, r6, #1
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _020016BC
_0200171A:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02001688

	thumb_func_start sub_02001720
sub_02001720: ; 0x02001720
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r0, [r4, #0x1a]
	mov r1, #1
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1a
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02002FAC
	ldrh r1, [r4, #0x1a]
	ldrh r5, [r4, #0x2e]
	lsl r2, r1, #0x19
	lsr r2, r2, #0x1c
	add r0, r2, r0
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	ldrb r0, [r4, #0x17]
	mul r3, r5
	ldrb r2, [r4, #0x16]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	add r0, r0, r3
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	lsl r0, r1, #0x10
	lsr r0, r0, #0x1f
	cmp r0, #3
	bhi _02001776
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02001766: ; jump table
	.short _0200176E - _02001766 - 2 ; case 0
	.short _02001776 - _02001766 - 2 ; case 1
	.short _02001776 - _02001766 - 2 ; case 2
	.short _02001776 - _02001766 - 2 ; case 3
_0200176E:
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #0xc]
	bl sub_020157F0
_02001776:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02001720

	thumb_func_start sub_02001778
sub_02001778: ; 0x02001778
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	ldrh r0, [r4, #0x1a]
	add r5, r1, #0
	lsl r1, r0, #0x10
	lsr r1, r1, #0x1f
	cmp r1, #3
	bhi _020017DC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02001796: ; jump table
	.short _0200179E - _02001796 - 2 ; case 0
	.short _020017DC - _02001796 - 2 ; case 1
	.short _020017DC - _02001796 - 2 ; case 2
	.short _020017DC - _02001796 - 2 ; case 3
_0200179E:
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1a
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #1
	bl sub_02002FAC
	ldrh r1, [r4, #0x1a]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1c
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	mov r0, #7
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldrb r1, [r4, #0x18]
	ldr r0, [r4, #0xc]
	ldrb r2, [r4, #0x16]
	ldrb r4, [r4, #0x17]
	lsl r1, r1, #0x1c
	mul r3, r5
	lsl r4, r4, #0x1c
	lsr r4, r4, #0x1c
	add r3, r4, r3
	lsl r3, r3, #0x10
	lsr r1, r1, #0x1c
	lsr r3, r3, #0x10
	bl sub_0201DA74
_020017DC:
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02001778

	thumb_func_start sub_020017E0
sub_020017E0: ; 0x020017E0
	push {r4, r5, r6, r7}
	ldrh r4, [r0, #0x2e]
	ldrh r3, [r0, #0x2c]
	cmp r1, #0
	ldrh r2, [r0, #0x12]
	bne _02001872
	cmp r2, #1
	bne _020017F4
	mov r1, #0
	b _0200180C
_020017F4:
	lsr r7, r2, #0x1f
	lsl r6, r2, #0x1f
	sub r6, r6, r7
	mov r5, #0x1f
	ror r6, r5
	lsr r1, r2, #1
	add r5, r7, r6
	add r1, r1, r5
	sub r1, r2, r1
	sub r1, r1, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
_0200180C:
	cmp r3, #0
	bne _02001840
	cmp r4, #0
	beq _0200183A
	ldr r2, [r0]
	lsl r1, r3, #3
	mov r3, #2
	add r1, r2, r1
	mvn r3, r3
_0200181E:
	sub r2, r4, #1
	lsl r2, r2, #0x10
	lsr r4, r2, #0x10
	lsl r2, r4, #3
	add r2, r1, r2
	ldr r2, [r2, #4]
	cmp r2, r3
	beq _02001836
	strh r4, [r0, #0x2e]
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_02001836:
	cmp r4, #0
	bne _0200181E
_0200183A:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_02001840:
	cmp r4, r1
	bls _0200186A
	ldr r5, [r0]
	lsl r2, r3, #3
	add r2, r5, r2
	mov r5, #2
	mvn r5, r5
_0200184E:
	sub r4, r4, #1
	lsl r4, r4, #0x10
	lsr r4, r4, #0x10
	lsl r6, r4, #3
	add r6, r2, r6
	ldr r6, [r6, #4]
	cmp r6, r5
	beq _02001866
	strh r4, [r0, #0x2e]
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_02001866:
	cmp r4, r1
	bhi _0200184E
_0200186A:
	strh r1, [r0, #0x2e]
	sub r1, r3, #1
	strh r1, [r0, #0x2c]
	b _020018F8
_02001872:
	cmp r2, #1
	bne _0200187A
	mov r5, #0
	b _0200188E
_0200187A:
	lsr r7, r2, #0x1f
	lsl r6, r2, #0x1f
	sub r6, r6, r7
	mov r5, #0x1f
	ror r6, r5
	lsr r1, r2, #1
	add r5, r7, r6
	add r1, r1, r5
	lsl r1, r1, #0x10
	lsr r5, r1, #0x10
_0200188E:
	ldrh r1, [r0, #0x10]
	sub r1, r1, r2
	cmp r3, r1
	bne _020018C8
	sub r2, r2, #1
	cmp r4, r2
	bge _020018C2
	ldr r5, [r0]
	lsl r1, r3, #3
	add r1, r5, r1
	mov r5, #2
	mvn r5, r5
_020018A6:
	add r3, r4, #1
	lsl r3, r3, #0x10
	lsr r4, r3, #0x10
	lsl r3, r4, #3
	add r3, r1, r3
	ldr r3, [r3, #4]
	cmp r3, r5
	beq _020018BE
	strh r4, [r0, #0x2e]
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_020018BE:
	cmp r4, r2
	blt _020018A6
_020018C2:
	mov r0, #0
	pop {r4, r5, r6, r7}
	bx lr
_020018C8:
	cmp r4, r5
	bhs _020018F2
	ldr r2, [r0]
	lsl r1, r3, #3
	mov r6, #2
	add r1, r2, r1
	mvn r6, r6
_020018D6:
	add r2, r4, #1
	lsl r2, r2, #0x10
	lsr r4, r2, #0x10
	lsl r2, r4, #3
	add r2, r1, r2
	ldr r2, [r2, #4]
	cmp r2, r6
	beq _020018EE
	strh r4, [r0, #0x2e]
	mov r0, #1
	pop {r4, r5, r6, r7}
	bx lr
_020018EE:
	cmp r4, r5
	blo _020018D6
_020018F2:
	strh r5, [r0, #0x2e]
	add r1, r3, #1
	strh r1, [r0, #0x2c]
_020018F8:
	mov r0, #2
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020017E0

	thumb_func_start sub_02001900
sub_02001900: ; 0x02001900
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	ldrh r0, [r5, #0x12]
	add r4, r1, #0
	add r7, r2, #0
	cmp r4, r0
	blt _0200192C
	ldrb r1, [r5, #0x18]
	ldr r0, [r5, #0xc]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl sub_0201D978
	ldrh r1, [r5, #0x2c]
	ldrh r3, [r5, #0x12]
	add r0, r5, #0
	mov r2, #0
	bl sub_02001688
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0200192C:
	ldrh r0, [r5, #0x1a]
	mov r1, #1
	lsl r0, r0, #0x11
	lsr r0, r0, #0x1a
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02002FAC
	ldrh r1, [r5, #0x1a]
	lsl r1, r1, #0x19
	lsr r1, r1, #0x1c
	add r0, r1, r0
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	cmp r7, #0
	ldrb r0, [r5, #0x18]
	bne _020019BA
	lsl r0, r0, #0x1c
	lsr r7, r0, #0x1c
	add r2, r4, #0
	lsl r3, r7, #4
	mul r2, r6
	orr r3, r7
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r5, #0xc]
	mov r1, #1
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0201EC48
	ldrh r1, [r5, #0x2c]
	add r0, r5, #0
	mov r2, #0
	add r3, r4, #0
	bl sub_02001688
	ldrb r0, [r5, #0x17]
	lsl r0, r0, #0x1c
	lsr r2, r0, #0x1c
	ldrh r0, [r5, #0x12]
	add r1, r0, #0
	mul r1, r6
	add r0, r2, r1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r0, [r5, #0xc]
	bl sub_0201EE90
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0201EE94
	lsl r0, r0, #3
	lsl r1, r4, #0x13
	sub r0, r0, r6
	lsr r1, r1, #0x10
	lsl r0, r0, #0x10
	str r1, [sp]
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	ldrb r1, [r5, #0x18]
	ldr r0, [r5, #0xc]
	mov r2, #0
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	add r3, r6, #0
	bl sub_0201DA74
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_020019BA:
	lsl r0, r0, #0x1c
	lsr r3, r0, #0x1c
	add r2, r4, #0
	mul r2, r6
	lsl r6, r3, #4
	orr r3, r6
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	ldr r0, [r5, #0xc]
	mov r1, #0
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0201EC48
	ldrh r0, [r5, #0x12]
	ldrh r1, [r5, #0x2c]
	add r3, r4, #0
	sub r2, r0, r4
	add r1, r1, r2
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	bl sub_02001688
	ldr r0, [r5, #0xc]
	bl sub_0201EE90
	lsl r0, r0, #0x13
	lsr r0, r0, #0x10
	str r0, [sp]
	ldrb r0, [r5, #0x17]
	mov r2, #0
	add r3, r2, #0
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	str r0, [sp, #4]
	ldrb r1, [r5, #0x18]
	ldr r0, [r5, #0xc]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	bl sub_0201DA74
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02001900

	thumb_func_start sub_02001A18
sub_02001A18: ; 0x02001A18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp]
	str r2, [sp, #4]
	add r4, r0, #0
	str r3, [sp, #8]
	ldrh r0, [r4, #0x2e]
	mov r6, #0
	add r5, r6, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	add r7, r6, #0
	cmp r0, #0
	bls _02001A6A
_02001A34:
	ldr r1, [sp, #8]
	add r0, r4, #0
	bl sub_020017E0
	orr r5, r0
	cmp r0, #2
	bne _02001A5E
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldrh r1, [r4, #0x2c]
	ldrh r0, [r4, #0x2e]
	ldr r2, [r4]
	add r0, r1, r0
	lsl r0, r0, #3
	add r0, r2, r0
	ldr r1, [r0, #4]
	mov r0, #2
	mvn r0, r0
	cmp r1, r0
	beq _02001A34
_02001A5E:
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	ldr r0, [sp, #4]
	cmp r7, r0
	blo _02001A34
_02001A6A:
	ldr r0, [sp]
	cmp r0, #0
	beq _02001AD2
	cmp r5, #3
	bhi _02001A88
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02001A80: ; jump table
	.short _02001A88 - _02001A80 - 2 ; case 0
	.short _02001A8E - _02001A80 - 2 ; case 1
	.short _02001AAC - _02001A80 - 2 ; case 2
	.short _02001AAC - _02001A80 - 2 ; case 3
_02001A88:
	add sp, #0x10
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02001A8E:
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl sub_02001778
	add r0, r4, #0
	bl sub_02001720
	add r0, r4, #0
	mov r1, #0
	bl sub_02001AD8
	ldr r0, [r4, #0xc]
	bl sub_0201D578
	b _02001AD2
_02001AAC:
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl sub_02001778
	ldr r2, [sp, #8]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02001900
	add r0, r4, #0
	bl sub_02001720
	add r0, r4, #0
	mov r1, #0
	bl sub_02001AD8
	ldr r0, [r4, #0xc]
	bl sub_0201D578
_02001AD2:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02001A18

	thumb_func_start sub_02001AD8
sub_02001AD8: ; 0x02001AD8
	push {r3, r4, r5, lr}
	ldr r3, [r0, #4]
	add r2, r1, #0
	cmp r3, #0
	beq _02001AF2
	ldrh r5, [r0, #0x2c]
	ldrh r4, [r0, #0x2e]
	ldr r1, [r0]
	add r4, r5, r4
	lsl r4, r4, #3
	add r1, r1, r4
	ldr r1, [r1, #4]
	blx r3
_02001AF2:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02001AD8
