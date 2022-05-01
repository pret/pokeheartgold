	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F6450:
	.word sub_02026D88
	.word sub_02026DA4

	.text

	thumb_func_start sub_02026C44
sub_02026C44: ; 0x02026C44
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	str r3, [sp]
	cmp r7, #0
	bne _02026C56
	bl GF_AssertFail
_02026C56:
	ldr r0, [sp, #0x18]
	mov r1, #0x14
	bl AllocFromHeap
	add r4, r0, #0
	beq _02026C9C
	str r5, [r4]
	str r7, [r4, #4]
	ldr r0, [sp]
	str r6, [r4, #8]
	str r0, [r4, #0xc]
	ldr r0, [sp, #0x18]
	lsl r1, r7, #2
	bl AllocFromHeap
	str r0, [r4, #0x10]
	cmp r0, #0
	beq _02026C94
	mov r6, #0
	cmp r7, #0
	bls _02026C9C
	add r5, r6, #0
_02026C82:
	ldr r0, [r4, #0x10]
	add r0, r0, r5
	bl sub_02026CA0
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r7
	blo _02026C82
	b _02026C9C
_02026C94:
	add r0, r4, #0
	bl FreeToHeap
	mov r4, #0
_02026C9C:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02026C44

	thumb_func_start sub_02026CA0
sub_02026CA0: ; 0x02026CA0
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strh r1, [r0, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02026CA0

	thumb_func_start sub_02026CAC
sub_02026CAC: ; 0x02026CAC
	push {r4, lr}
	add r4, r0, #0
	bne _02026CB6
	bl GF_AssertFail
_02026CB6:
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_02026CAC

	thumb_func_start sub_02026CC4
sub_02026CC4: ; 0x02026CC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	bl System_GetTouchHeld
	str r0, [sp, #4]
	cmp r0, #0
	beq _02026D28
	bl System_GetTouchNew
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	mov r6, #0
	cmp r0, #0
	bls _02026D46
	add r4, r6, #0
_02026CE8:
	ldr r0, [r5, #0x10]
	add r0, r0, r4
	ldrb r0, [r0, #1]
	cmp r0, #0
	ldr r0, [r5]
	beq _02026D02
	add r0, r0, r4
	bl sub_020252F4
	ldr r1, [r5, #0x10]
	add r1, r1, r4
	strb r0, [r1, #1]
	b _02026D1C
_02026D02:
	add r0, r0, r4
	bl sub_02025320
	ldr r1, [r5, #0x10]
	add r1, r1, r4
	strb r0, [r1, #1]
	ldr r0, [r5, #0x10]
	add r0, r0, r4
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _02026D1C
	mov r0, #1
	str r0, [sp]
_02026D1C:
	ldr r0, [r5, #4]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blo _02026CE8
	b _02026D46
_02026D28:
	ldr r0, [r5, #4]
	mov r3, #0
	str r3, [sp, #8]
	cmp r0, #0
	bls _02026D46
	add r2, r3, #0
	add r1, r3, #0
_02026D36:
	ldr r0, [r5, #0x10]
	add r3, r3, #1
	add r0, r0, r2
	strb r1, [r0, #1]
	ldr r0, [r5, #4]
	add r2, r2, #4
	cmp r3, r0
	blo _02026D36
_02026D46:
	mov r4, #0
	cmp r0, #0
	bls _02026D7C
	add r7, r4, #0
_02026D4E:
	ldr r3, [r5, #0x10]
	ldr r1, [sp, #4]
	add r0, r3, r7
	ldrb r3, [r3, r7]
	ldr r2, [sp, #8]
	lsl r6, r3, #2
	ldr r3, _02026D84 ; =_020F6450
	ldr r3, [r3, r6]
	blx r3
	add r1, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r1, r0
	beq _02026D72
	ldr r2, [r5, #0xc]
	ldr r3, [r5, #8]
	add r0, r4, #0
	blx r3
_02026D72:
	ldr r0, [r5, #4]
	add r4, r4, #1
	add r7, r7, #4
	cmp r4, r0
	blo _02026D4E
_02026D7C:
	ldr r0, [sp]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02026D84: .word _020F6450
	thumb_func_end sub_02026CC4

	thumb_func_start sub_02026D88
sub_02026D88: ; 0x02026D88
	push {r3, lr}
	ldrb r1, [r0, #1]
	cmp r1, #0
	beq _02026D9E
	cmp r2, #0
	beq _02026D9E
	mov r1, #1
	bl sub_02026DD8
	mov r0, #0
	pop {r3, pc}
_02026D9E:
	mov r0, #0
	mvn r0, r0
	pop {r3, pc}
	thumb_func_end sub_02026D88

	thumb_func_start sub_02026DA4
sub_02026DA4: ; 0x02026DA4
	push {r3, lr}
	ldrb r2, [r0, #1]
	cmp r2, #0
	beq _02026DBC
	ldrh r2, [r0, #2]
	ldr r1, _02026DD4 ; =0x0000FFFF
	cmp r2, r1
	bhs _02026DB8
	add r1, r2, #1
	strh r1, [r0, #2]
_02026DB8:
	mov r0, #2
	pop {r3, pc}
_02026DBC:
	cmp r1, #0
	beq _02026DCA
	mov r1, #0
	bl sub_02026DD8
	mov r0, #3
	pop {r3, pc}
_02026DCA:
	mov r1, #0
	bl sub_02026DD8
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
_02026DD4: .word 0x0000FFFF
	thumb_func_end sub_02026DA4

	thumb_func_start sub_02026DD8
sub_02026DD8: ; 0x02026DD8
	strb r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bx lr
	thumb_func_end sub_02026DD8
