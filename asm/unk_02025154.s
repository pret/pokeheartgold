	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02025154
sub_02025154: ; 0x02025154
	push {r4, r5, r6, r7}
	ldrb r3, [r0]
	mov r4, #0
	cmp r3, #0xff
	beq _02025196
_0202515E:
	ldrb r7, [r0, #2]
	ldrb r3, [r0, #3]
	ldrb r5, [r0]
	sub r6, r1, r7
	sub r3, r3, r7
	cmp r6, r3
	bhs _02025170
	mov r6, #1
	b _02025172
_02025170:
	mov r6, #0
_02025172:
	ldrb r7, [r0, #1]
	sub r3, r2, r5
	sub r5, r7, r5
	cmp r3, r5
	bhs _02025180
	mov r3, #1
	b _02025182
_02025180:
	mov r3, #0
_02025182:
	tst r3, r6
	beq _0202518C
	add r0, r4, #0
	pop {r4, r5, r6, r7}
	bx lr
_0202518C:
	add r0, r0, #4
	ldrb r3, [r0]
	add r4, r4, #1
	cmp r3, #0xff
	bne _0202515E
_02025196:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02025154

	thumb_func_start sub_020251A0
sub_020251A0: ; 0x020251A0
	push {r3, r4}
	ldrb r3, [r0, #1]
	sub r4, r3, r1
	ldrb r1, [r0, #2]
	sub r3, r1, r2
	ldrb r2, [r0, #3]
	add r1, r4, #0
	add r0, r3, #0
	mul r1, r4
	mul r0, r3
	add r1, r1, r0
	add r0, r2, #0
	mul r0, r2
	cmp r1, r0
	bhs _020251C4
	mov r0, #1
	pop {r3, r4}
	bx lr
_020251C4:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020251A0

	thumb_func_start sub_020251CC
sub_020251CC: ; 0x020251CC
	push {r4, r5}
	ldrb r5, [r0, #2]
	ldrb r3, [r0]
	sub r4, r1, r5
	ldrb r1, [r0, #3]
	sub r1, r1, r5
	cmp r4, r1
	bhs _020251E0
	mov r4, #1
	b _020251E2
_020251E0:
	mov r4, #0
_020251E2:
	ldrb r0, [r0, #1]
	sub r1, r2, r3
	sub r0, r0, r3
	cmp r1, r0
	bhs _020251F0
	mov r0, #1
	b _020251F2
_020251F0:
	mov r0, #0
_020251F2:
	tst r0, r4
	beq _020251FC
	mov r0, #1
	pop {r4, r5}
	bx lr
_020251FC:
	mov r0, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020251CC

	thumb_func_start sub_02025204
sub_02025204: ; 0x02025204
	push {r3, lr}
	ldr r2, _02025220 ; =gSystem + 0x40
	ldrh r1, [r2, #0x26]
	cmp r1, #0
	beq _02025218
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl sub_02025154
	pop {r3, pc}
_02025218:
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
	nop
_02025220: .word gSystem + 0x40
	thumb_func_end sub_02025204

	thumb_func_start sub_02025224
sub_02025224: ; 0x02025224
	push {r3, lr}
	ldr r2, _02025240 ; =gSystem + 0x40
	ldrh r1, [r2, #0x24]
	cmp r1, #0
	beq _02025238
	ldrh r1, [r2, #0x20]
	ldrh r2, [r2, #0x22]
	bl sub_02025154
	pop {r3, pc}
_02025238:
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
	nop
_02025240: .word gSystem + 0x40
	thumb_func_end sub_02025224

	thumb_func_start sub_02025244
sub_02025244: ; 0x02025244
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02025298 ; =gSystem + 0x40
	add r5, r0, #0
	ldrh r0, [r7, #0x26]
	cmp r0, #0
	beq _02025290
	ldrb r0, [r5]
	mov r6, #0
	cmp r0, #0xff
	beq _02025290
	add r4, r5, #0
_0202525A:
	ldrb r0, [r5]
	cmp r0, #0xfe
	bne _02025272
	ldrh r1, [r7, #0x20]
	ldrh r2, [r7, #0x22]
	add r0, r4, #0
	bl sub_020251A0
	cmp r0, #0
	beq _02025284
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02025272:
	ldrh r1, [r7, #0x20]
	ldrh r2, [r7, #0x22]
	add r0, r4, #0
	bl sub_020251CC
	cmp r0, #0
	beq _02025284
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_02025284:
	add r5, r5, #4
	ldrb r0, [r5]
	add r4, r4, #4
	add r6, r6, #1
	cmp r0, #0xff
	bne _0202525A
_02025290:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02025298: .word gSystem + 0x40
	thumb_func_end sub_02025244

	thumb_func_start sub_0202529C
sub_0202529C: ; 0x0202529C
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _020252F0 ; =gSystem + 0x40
	add r5, r0, #0
	ldrh r0, [r7, #0x24]
	cmp r0, #0
	beq _020252E8
	ldrb r0, [r5]
	mov r6, #0
	cmp r0, #0xff
	beq _020252E8
	add r4, r5, #0
_020252B2:
	ldrb r0, [r5]
	cmp r0, #0xfe
	bne _020252CA
	ldrh r1, [r7, #0x20]
	ldrh r2, [r7, #0x22]
	add r0, r4, #0
	bl sub_020251A0
	cmp r0, #0
	beq _020252DC
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_020252CA:
	ldrh r1, [r7, #0x20]
	ldrh r2, [r7, #0x22]
	add r0, r4, #0
	bl sub_020251CC
	cmp r0, #0
	beq _020252DC
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
_020252DC:
	add r5, r5, #4
	ldrb r0, [r5]
	add r4, r4, #4
	add r6, r6, #1
	cmp r0, #0xff
	bne _020252B2
_020252E8:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020252F0: .word gSystem + 0x40
	thumb_func_end sub_0202529C

	thumb_func_start sub_020252F4
sub_020252F4: ; 0x020252F4
	push {r3, lr}
	ldr r2, _0202531C ; =gSystem + 0x40
	ldrh r1, [r2, #0x26]
	cmp r1, #0
	beq _02025316
	ldrb r1, [r0]
	cmp r1, #0xfe
	ldrh r1, [r2, #0x20]
	bne _0202530E
	ldrh r2, [r2, #0x22]
	bl sub_020251A0
	pop {r3, pc}
_0202530E:
	ldrh r2, [r2, #0x22]
	bl sub_020251CC
	pop {r3, pc}
_02025316:
	mov r0, #0
	pop {r3, pc}
	nop
_0202531C: .word gSystem + 0x40
	thumb_func_end sub_020252F4

	thumb_func_start sub_02025320
sub_02025320: ; 0x02025320
	push {r3, lr}
	ldr r2, _02025348 ; =gSystem + 0x40
	ldrh r1, [r2, #0x24]
	cmp r1, #0
	beq _02025342
	ldrb r1, [r0]
	cmp r1, #0xfe
	ldrh r1, [r2, #0x20]
	bne _0202533A
	ldrh r2, [r2, #0x22]
	bl sub_020251A0
	pop {r3, pc}
_0202533A:
	ldrh r2, [r2, #0x22]
	bl sub_020251CC
	pop {r3, pc}
_02025342:
	mov r0, #0
	pop {r3, pc}
	nop
_02025348: .word gSystem + 0x40
	thumb_func_end sub_02025320

	thumb_func_start System_GetTouchHeld
System_GetTouchHeld: ; 0x0202534C
	ldr r0, _02025354 ; =gSystem + 0x40
	ldrh r0, [r0, #0x26]
	bx lr
	nop
_02025354: .word gSystem + 0x40
	thumb_func_end System_GetTouchHeld

	thumb_func_start System_GetTouchNew
System_GetTouchNew: ; 0x02025358
	ldr r0, _02025360 ; =gSystem + 0x40
	ldrh r0, [r0, #0x24]
	bx lr
	nop
_02025360: .word gSystem + 0x40
	thumb_func_end System_GetTouchNew

	thumb_func_start sub_02025364
sub_02025364: ; 0x02025364
	ldr r2, _0202537C ; =gSystem + 0x40
	ldrh r3, [r2, #0x26]
	cmp r3, #0
	beq _02025378
	ldrh r3, [r2, #0x20]
	str r3, [r0]
	ldrh r0, [r2, #0x22]
	str r0, [r1]
	mov r0, #1
	bx lr
_02025378:
	mov r0, #0
	bx lr
	.balign 4, 0
_0202537C: .word gSystem + 0x40
	thumb_func_end sub_02025364

	thumb_func_start sub_02025380
sub_02025380: ; 0x02025380
	ldr r2, _02025398 ; =gSystem + 0x40
	ldrh r3, [r2, #0x24]
	cmp r3, #0
	beq _02025394
	ldrh r3, [r2, #0x20]
	str r3, [r0]
	ldrh r0, [r2, #0x22]
	str r0, [r1]
	mov r0, #1
	bx lr
_02025394:
	mov r0, #0
	bx lr
	.balign 4, 0
_02025398: .word gSystem + 0x40
	thumb_func_end sub_02025380

	thumb_func_start sub_0202539C
sub_0202539C: ; 0x0202539C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	ldrb r0, [r5]
	add r6, r1, #0
	add r7, r2, #0
	cmp r0, #0xff
	beq _020253EA
	add r4, r5, #0
_020253B0:
	ldrb r0, [r5]
	cmp r0, #0xfe
	bne _020253C8
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_020251A0
	cmp r0, #0
	beq _020253DA
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
_020253C8:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_020251CC
	cmp r0, #0
	beq _020253DA
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
_020253DA:
	ldr r0, [sp]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp]
	ldrb r0, [r5]
	add r4, r4, #4
	cmp r0, #0xff
	bne _020253B0
_020253EA:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202539C

	thumb_func_start sub_020253F0
sub_020253F0: ; 0x020253F0
	push {r3, lr}
	ldrb r3, [r0]
	cmp r3, #0xfe
	bne _020253FE
	bl sub_020251A0
	pop {r3, pc}
_020253FE:
	bl sub_020251CC
	pop {r3, pc}
	thumb_func_end sub_020253F0
