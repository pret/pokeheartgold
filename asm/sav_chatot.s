	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202CE30
sub_0202CE30: ; 0x0202CE30
	mov r0, #0xfb
	lsl r0, r0, #2
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CE30

	thumb_func_start sub_0202CE38
sub_0202CE38: ; 0x0202CE38
	push {r4, lr}
	add r4, r0, #0
	mov r2, #0xfb
	mov r0, #0
	add r1, r4, #0
	lsl r2, r2, #2
	bl sub_020D47EC
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0202CE38

	thumb_func_start sub_0202CE50
sub_0202CE50: ; 0x0202CE50
	push {r4, lr}
	mov r1, #0xfb
	lsl r1, r1, #2
	bl AllocFromHeap
	add r4, r0, #0
	bl sub_0202CE38
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0202CE50

	thumb_func_start Sav2_Chatot_get
Sav2_Chatot_get: ; 0x0202CE64
	ldr r3, _0202CE6C ; =SavArray_get
	mov r1, #0x12
	bx r3
	nop
_0202CE6C: .word SavArray_get
	thumb_func_end Sav2_Chatot_get

	thumb_func_start sub_0202CE70
sub_0202CE70: ; 0x0202CE70
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_0202CE70

	thumb_func_start sub_0202CE74
sub_0202CE74: ; 0x0202CE74
	mov r1, #0
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CE74

	thumb_func_start sub_0202CE7C
sub_0202CE7C: ; 0x0202CE7C
	add r0, r0, #4
	bx lr
	thumb_func_end sub_0202CE7C

	thumb_func_start sub_0202CE80
sub_0202CE80: ; 0x0202CE80
	push {r4, r5, r6, r7}
	mov r5, #0
	mov r2, #0xfa
	add r4, r5, #0
	mov r6, #0xf
	lsl r2, r2, #2
_0202CE8C:
	ldrsb r7, [r1, r4]
	add r3, r0, r5
	and r7, r6
	lsl r7, r7, #0x18
	lsr r7, r7, #0x18
	sub r7, #8
	lsl r7, r7, #0x18
	asr r7, r7, #0x14
	strb r7, [r0, r5]
	ldrsb r7, [r1, r4]
	add r4, r4, #1
	add r5, r5, #2
	lsl r7, r7, #0x14
	lsr r7, r7, #0x18
	sub r7, #8
	lsl r7, r7, #0x18
	asr r7, r7, #0x14
	strb r7, [r3, #1]
	cmp r4, r2
	blt _0202CE8C
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end sub_0202CE80

	thumb_func_start sub_0202CEB8
sub_0202CEB8: ; 0x0202CEB8
	push {r4, r5, r6, r7}
	add r3, r0, #0
	add r2, r1, #0
	mov r0, #1
	mov r1, #0
	str r0, [r3]
	add r0, r1, #0
_0202CEC6:
	ldrsb r4, [r2, r0]
	add r6, r3, r1
	add r7, r2, r0
	asr r5, r4, #3
	lsr r5, r5, #0x1c
	add r5, r4, r5
	lsl r4, r5, #0x14
	asr r4, r4, #0x18
	add r4, #8
	strb r4, [r6, #4]
	mov r4, #4
	ldrsb r5, [r6, r4]
	mov r4, #1
	ldrsb r4, [r7, r4]
	add r0, r0, #2
	add r1, r1, #1
	asr r7, r4, #3
	lsr r7, r7, #0x1c
	add r7, r4, r7
	lsl r4, r7, #0x14
	asr r4, r4, #0x18
	add r4, #8
	lsl r4, r4, #0x18
	lsr r4, r4, #0x14
	orr r4, r5
	strb r4, [r6, #4]
	mov r4, #0x7d
	lsl r4, r4, #4
	cmp r0, r4
	blt _0202CEC6
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202CEB8

	thumb_func_start sub_0202CF08
sub_0202CF08: ; 0x0202CF08
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0xfb
	ldr r3, _0202CF18 ; =sub_020D48B4
	lsl r2, r2, #2
	bx r3
	nop
_0202CF18: .word sub_020D48B4
	thumb_func_end sub_0202CF08
