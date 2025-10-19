	.include "asm/macros.inc"
	.include "unk_020192D0.inc"
	.include "global.inc"

    .text

	thumb_func_start sub_02019BA4
sub_02019BA4: ; 0x02019BA4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r0, [sp, #0x20]
	mov r1, #0x20
	add r6, r2, #0
	add r7, r3, #0
	bl Heap_Alloc
	str r5, [r0]
	str r4, [r0, #4]
	str r6, [r0, #0x18]
	str r7, [r0, #0x1c]
	mov r2, #0
	ldr r1, [sp, #0x18]
	strb r2, [r0, #0xc]
	str r1, [r0, #8]
	add r1, sp, #8
	ldrb r1, [r1, #0x14]
	strb r1, [r0, #0xd]
	mov r1, #0xff
	strb r1, [r0, #0xe]
	strb r1, [r0, #0xf]
	sub r1, r2, #1
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02019BA4

	thumb_func_start sub_02019BDC
sub_02019BDC: ; 0x02019BDC
	ldr r3, _02019BE0 ; =Heap_Free
	bx r3
	.balign 4, 0
_02019BE0: .word Heap_Free
	thumb_func_end sub_02019BDC

	thumb_func_start sub_02019BE4
sub_02019BE4: ; 0x02019BE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
	sub r7, r4, #1
_02019BF0:
	ldr r2, [r5]
	lsl r1, r4, #2
	ldrb r0, [r2, r1]
	cmp r0, #0xff
	beq _02019C1A
	add r0, r2, r1
	bl TouchscreenHitbox_TouchNewIsIn
	cmp r0, #1
	bne _02019C12
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02019E4C
	cmp r0, r7
	bne _02019D0E
	mov r6, #1
_02019C12:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	b _02019BF0
_02019C1A:
	cmp r6, #0
	beq _02019C26
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02019C26:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _02019C4C
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _02019C4C
	ldr r0, _02019D14 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xf3
	tst r1, r0
	beq _02019C46
	add r0, r5, #0
	bl sub_02019E98
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02019C46:
	add sp, #0x10
	sub r0, #0xf4
	pop {r3, r4, r5, r6, r7, pc}
_02019C4C:
	ldr r0, _02019D14 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x48]
	tst r1, r0
	beq _02019C72
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #0
	str r0, [sp, #0xc]
	b _02019CE0
_02019C72:
	mov r1, #0x80
	tst r1, r0
	beq _02019C96
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #1
	str r0, [sp, #0xc]
	b _02019CE0
_02019C96:
	mov r1, #0x20
	tst r1, r0
	beq _02019CBA
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #2
	str r0, [sp, #0xc]
	b _02019CE0
_02019CBA:
	mov r1, #0x10
	tst r0, r1
	beq _02019CDE
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #3
	str r0, [sp, #0xc]
	b _02019CE0
_02019CDE:
	mov r2, #0xff
_02019CE0:
	cmp r2, #0xff
	beq _02019CF0
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl sub_02019EB8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02019CF0:
	ldr r0, _02019D14 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02019D00
	add sp, #0x10
	ldrb r0, [r5, #0xd]
	pop {r3, r4, r5, r6, r7, pc}
_02019D00:
	mov r0, #2
	tst r1, r0
	beq _02019D0C
	add sp, #0x10
	sub r0, r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_02019D0C:
	sub r0, r0, #3
_02019D0E:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02019D14: .word gSystem
	thumb_func_end sub_02019BE4

	thumb_func_start sub_02019D18
sub_02019D18: ; 0x02019D18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r4, #0
	add r5, r0, #0
	add r6, r4, #0
	sub r7, r4, #1
_02019D24:
	ldr r2, [r5]
	lsl r1, r4, #2
	ldrb r0, [r2, r1]
	cmp r0, #0xff
	beq _02019D4E
	add r0, r2, r1
	bl TouchscreenHitbox_TouchNewIsIn
	cmp r0, #1
	bne _02019D46
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02019E4C
	cmp r0, r7
	bne _02019E42
	mov r6, #1
_02019D46:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	b _02019D24
_02019D4E:
	cmp r6, #0
	beq _02019D5A
	mov r0, #0
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02019D5A:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _02019D80
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _02019D80
	ldr r0, _02019E48 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #0xf3
	tst r1, r0
	beq _02019D7A
	add r0, r5, #0
	bl sub_02019E98
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02019D7A:
	add sp, #0x10
	sub r0, #0xf4
	pop {r3, r4, r5, r6, r7, pc}
_02019D80:
	ldr r0, _02019E48 ; =gSystem
	mov r1, #0x40
	ldr r0, [r0, #0x4c]
	tst r1, r0
	beq _02019DA6
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #0
	str r0, [sp, #0xc]
	b _02019E14
_02019DA6:
	mov r1, #0x80
	tst r1, r0
	beq _02019DCA
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #1
	str r0, [sp, #0xc]
	b _02019E14
_02019DCA:
	mov r1, #0x20
	tst r1, r0
	beq _02019DEE
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #2
	str r0, [sp, #0xc]
	b _02019E14
_02019DEE:
	mov r1, #0x10
	tst r0, r1
	beq _02019E12
	mov r1, #0
	str r1, [sp]
	ldrb r0, [r5, #0xd]
	add r2, r1, #0
	add r3, r1, #0
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	bl sub_02020A24
	add r2, r0, #0
	mov r0, #3
	str r0, [sp, #0xc]
	b _02019E14
_02019E12:
	mov r2, #0xff
_02019E14:
	cmp r2, #0xff
	beq _02019E24
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl sub_02019EB8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_02019E24:
	ldr r0, _02019E48 ; =gSystem
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	beq _02019E34
	add sp, #0x10
	ldrb r0, [r5, #0xd]
	pop {r3, r4, r5, r6, r7, pc}
_02019E34:
	mov r0, #2
	tst r1, r0
	beq _02019E40
	add sp, #0x10
	sub r0, r0, #4
	pop {r3, r4, r5, r6, r7, pc}
_02019E40:
	sub r0, r0, #3
_02019E42:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02019E48: .word gSystem
	thumb_func_end sub_02019D18

	thumb_func_start sub_02019E4C
sub_02019E4C: ; 0x02019E4C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x10
	add r4, r1, #0
	bl sub_0201A06C
	cmp r0, #1
	bne _02019E90
	strb r4, [r5, #0xd]
	mov r0, #0xff
	strb r0, [r5, #0xe]
	strb r0, [r5, #0xf]
	ldr r0, [r5, #8]
	cmp r0, #1
	bne _02019E80
	ldrb r0, [r5, #0xc]
	cmp r0, #1
	bne _02019E80
	mov r0, #0
	str r0, [r5, #8]
	ldr r3, [r5, #0x18]
	ldrb r1, [r5, #0xd]
	ldrb r2, [r5, #0xe]
	ldr r0, [r5, #0x1c]
	ldr r3, [r3, #4]
	blx r3
_02019E80:
	ldr r3, [r5, #0x18]
	ldrb r1, [r5, #0xd]
	ldrb r2, [r5, #0xe]
	ldr r0, [r5, #0x1c]
	ldr r3, [r3, #0xc]
	blx r3
	add r0, r4, #0
	pop {r3, r4, r5, pc}
_02019E90:
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02019E4C

	thumb_func_start sub_02019E98
sub_02019E98: ; 0x02019E98
	push {r3, lr}
	add r3, r0, #0
	mov r0, #1
	str r0, [r3, #8]
	mov r0, #0xff
	strb r0, [r3, #0xe]
	strb r0, [r3, #0xf]
	ldr r0, [r3, #0x1c]
	ldrb r1, [r3, #0xd]
	ldrb r2, [r3, #0xe]
	ldr r3, [r3, #0x18]
	ldr r3, [r3]
	blx r3
	mov r0, #3
	mvn r0, r0
	pop {r3, pc}
	thumb_func_end sub_02019E98

	thumb_func_start sub_02019EB8
sub_02019EB8: ; 0x02019EB8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0x80
	add r1, r4, #0
	tst r1, r0
	beq _02019EDA
	ldrb r1, [r5, #0xf]
	cmp r1, #0xff
	beq _02019ED4
	add r4, r1, #0
	b _02019EDA
_02019ED4:
	eor r0, r4
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_02019EDA:
	mov r0, #1
	str r0, [sp, #0xc]
	mov r7, #0
_02019EE0:
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1b
	sub r1, r1, r2
	mov r0, #0x1b
	ror r1, r0
	add r1, r2, r1
	mov r0, #1
	lsl r0, r1
	lsr r1, r4, #5
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #0x10]
	tst r0, r1
	bne _02019F2A
	str r7, [sp, #0xc]
	str r7, [sp]
	str r4, [sp, #4]
	str r6, [sp, #8]
	ldr r0, [r5, #4]
	add r1, r7, #0
	add r2, r7, #0
	add r3, r7, #0
	bl sub_02020A24
	mov r1, #0x7f
	and r0, r1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, r4
	beq _02019F22
	ldrb r0, [r5, #0xd]
	cmp r1, r0
	bne _02019F26
_02019F22:
	ldrb r4, [r5, #0xd]
	b _02019F2A
_02019F26:
	add r4, r1, #0
	b _02019EE0
_02019F2A:
	ldrb r0, [r5, #0xd]
	cmp r0, r4
	beq _02019F6A
	ldr r1, [r5, #4]
	lsl r0, r4, #3
	add r0, r1, r0
	add r1, r6, #0
	bl sub_0201A020
	cmp r0, #1
	bne _02019F4C
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _02019F4C
	ldrb r0, [r5, #0xd]
	strb r0, [r5, #0xf]
	b _02019F50
_02019F4C:
	mov r0, #0xff
	strb r0, [r5, #0xf]
_02019F50:
	ldrb r0, [r5, #0xd]
	strb r0, [r5, #0xe]
	strb r4, [r5, #0xd]
	ldr r3, [r5, #0x18]
	ldrb r1, [r5, #0xd]
	ldrb r2, [r5, #0xe]
	ldr r0, [r5, #0x1c]
	ldr r3, [r3, #8]
	blx r3
	mov r0, #2
	add sp, #0x10
	mvn r0, r0
	pop {r3, r4, r5, r6, r7, pc}
_02019F6A:
	mov r0, #0
	mvn r0, r0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02019EB8

	thumb_func_start sub_02019F74
sub_02019F74: ; 0x02019F74
	ldrb r0, [r0, #0xd]
	bx lr
	thumb_func_end sub_02019F74

	thumb_func_start sub_02019F78
sub_02019F78: ; 0x02019F78
	ldrb r0, [r0, #0xf]
	bx lr
	thumb_func_end sub_02019F78

	thumb_func_start sub_02019F7C
sub_02019F7C: ; 0x02019F7C
	strb r1, [r0, #0xd]
	mov r1, #0xff
	strb r1, [r0, #0xe]
	strb r1, [r0, #0xf]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02019F7C

	thumb_func_start sub_02019F88
sub_02019F88: ; 0x02019F88
	strb r1, [r0, #0xd]
	strb r2, [r0, #0xe]
	strb r3, [r0, #0xf]
	bx lr
	thumb_func_end sub_02019F88

	thumb_func_start sub_02019F90
sub_02019F90: ; 0x02019F90
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_02019F90

	thumb_func_start sub_02019F94
sub_02019F94: ; 0x02019F94
	push {r3, lr}
	add r3, r0, #0
	str r1, [r3, #8]
	cmp r1, #1
	bne _02019FB4
	mov r0, #0xff
	strb r0, [r3, #0xe]
	strb r0, [r3, #0xf]
	ldr r0, [r3, #0x1c]
	ldrb r1, [r3, #0xd]
	ldr r3, [r3, #0x18]
	mov r2, #0
	ldr r3, [r3]
	mvn r2, r2
	blx r3
	pop {r3, pc}
_02019FB4:
	ldr r0, [r3, #0x1c]
	ldrb r1, [r3, #0xd]
	ldr r3, [r3, #0x18]
	mov r2, #0
	ldr r3, [r3, #4]
	mvn r2, r2
	blx r3
	pop {r3, pc}
	thumb_func_end sub_02019F94

	thumb_func_start sub_02019FC4
sub_02019FC4: ; 0x02019FC4
	mov r1, #0
	mvn r1, r1
	str r1, [r0, #0x10]
	str r1, [r0, #0x14]
	bx lr
	.balign 4, 0
	thumb_func_end sub_02019FC4

	thumb_func_start sub_02019FD0
sub_02019FD0: ; 0x02019FD0
	push {r4, r5}
	mov r4, #1
	lsr r2, r1, #5
	mov r3, #0x1f
	and r1, r3
	add r5, r4, #0
	lsl r5, r1
	add r0, #0x10
	lsl r2, r2, #2
	ldr r4, [r0, r2]
	add r1, r5, #0
	tst r1, r4
	beq _02019FF4
	sub r3, #0x20
	add r1, r5, #0
	eor r1, r3
	and r1, r4
	str r1, [r0, r2]
_02019FF4:
	pop {r4, r5}
	bx lr
	thumb_func_end sub_02019FD0

	thumb_func_start sub_02019FF8
sub_02019FF8: ; 0x02019FF8
	push {r3, r4}
	mov r3, #0x1f
	lsr r2, r1, #5
	mov r4, #1
	and r1, r3
	lsl r4, r1
	add r0, #0x10
	lsl r2, r2, #2
	ldr r1, [r0, r2]
	add r3, r4, #0
	tst r3, r1
	bne _0201A014
	eor r1, r4
	str r1, [r0, r2]
_0201A014:
	pop {r3, r4}
	bx lr
	thumb_func_end sub_02019FF8

	thumb_func_start sub_0201A018
sub_0201A018: ; 0x0201A018
	ldr r2, [r0, #4]
	lsl r0, r1, #3
	add r0, r2, r0
	bx lr
	thumb_func_end sub_0201A018

	thumb_func_start sub_0201A020
sub_0201A020: ; 0x0201A020
	cmp r1, #3
	bhi _0201A068
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0201A030: ; jump table
	.short _0201A038 - _0201A030 - 2 ; case 0
	.short _0201A044 - _0201A030 - 2 ; case 1
	.short _0201A050 - _0201A030 - 2 ; case 2
	.short _0201A05C - _0201A030 - 2 ; case 3
_0201A038:
	ldrb r1, [r0, #5]
	mov r0, #0x80
	tst r0, r1
	beq _0201A068
	mov r0, #1
	bx lr
_0201A044:
	ldrb r1, [r0, #4]
	mov r0, #0x80
	tst r0, r1
	beq _0201A068
	mov r0, #1
	bx lr
_0201A050:
	ldrb r1, [r0, #7]
	mov r0, #0x80
	tst r0, r1
	beq _0201A068
	mov r0, #1
	bx lr
_0201A05C:
	ldrb r1, [r0, #6]
	mov r0, #0x80
	tst r0, r1
	beq _0201A068
	mov r0, #1
	bx lr
_0201A068:
	mov r0, #0
	bx lr
	thumb_func_end sub_0201A020

	thumb_func_start sub_0201A06C
sub_0201A06C: ; 0x0201A06C
	push {r3, r4}
	mov r3, #0x1f
	mov r2, #1
	and r3, r1
	lsr r1, r1, #5
	add r4, r2, #0
	lsl r1, r1, #2
	lsl r4, r3
	ldr r0, [r0, r1]
	tst r0, r4
	bne _0201A084
	mov r2, #0
_0201A084:
	add r0, r2, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0201A06C
