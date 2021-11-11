	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02074670
sub_02074670: ; 0x02074670
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bpl _0207467E
	bl GF_AssertFail
_0207467E:
	ldr r0, [r5, #4]
	cmp r6, r0
	blt _02074688
	bl GF_AssertFail
_02074688:
	ldr r0, [r5]
	cmp r6, r0
	blt _02074692
	bl GF_AssertFail
_02074692:
	lsl r0, r6, #2
	add r0, r6, r0
	mov r1, #0x59
	add r0, r5, r0
	lsl r1, r1, #4
	ldrb r2, [r0, r1]
	strb r2, [r4]
	add r2, r1, #1
	ldrb r2, [r0, r2]
	strb r2, [r4, #1]
	add r2, r1, #2
	ldrb r2, [r0, r2]
	strb r2, [r4, #2]
	add r2, r1, #3
	ldrb r2, [r0, r2]
	add r1, r1, #4
	strb r2, [r4, #3]
	ldrb r0, [r0, r1]
	strb r0, [r4, #4]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02074670

	thumb_func_start sub_020746BC
sub_020746BC: ; 0x020746BC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bpl _020746CA
	bl GF_AssertFail
_020746CA:
	ldr r0, [r5, #4]
	cmp r6, r0
	blt _020746D4
	bl GF_AssertFail
_020746D4:
	ldr r0, [r5]
	cmp r6, r0
	blt _020746DE
	bl GF_AssertFail
_020746DE:
	lsl r0, r6, #2
	add r0, r6, r0
	mov r1, #0x59
	ldrb r2, [r4]
	add r0, r5, r0
	lsl r1, r1, #4
	strb r2, [r0, r1]
	ldrb r3, [r4, #1]
	add r2, r1, #1
	strb r3, [r0, r2]
	ldrb r3, [r4, #2]
	add r2, r1, #2
	strb r3, [r0, r2]
	add r2, r1, #3
	ldrb r3, [r4, #3]
	add r1, r1, #4
	strb r3, [r0, r2]
	ldrb r2, [r4, #4]
	strb r2, [r0, r1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020746BC

	thumb_func_start sub_02074708
sub_02074708: ; 0x02074708
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bpl _02074714
	bl GF_AssertFail
_02074714:
	ldr r0, [r5, #4]
	cmp r4, r0
	blt _0207471E
	bl GF_AssertFail
_0207471E:
	ldr r0, [r5]
	cmp r4, r0
	blt _02074728
	bl GF_AssertFail
_02074728:
	mov r0, #0x59
	lsl r0, r0, #4
	add r1, r5, r0
	lsl r0, r4, #2
	add r0, r4, r0
	add r0, r1, r0
	mov r1, #0
	mov r2, #5
	bl MI_CpuFill8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02074708

	thumb_func_start sub_02074740
sub_02074740: ; 0x02074740
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
		add r6, r2, #0
	cmp r4, #0
	bge _02074752
	bl GF_AssertFail
_02074752:
	ldr r0, [r5, #4]
	cmp r4, r0
	blt _0207475C
	bl GF_AssertFail
_0207475C:
	ldr r0, [r5]
	cmp r4, r0
	blt _02074766
	bl GF_AssertFail
_02074766:
	add r1, r5, #0
	mov r0, #0xec
	add r1, #8
	mul r0, r4
	add r7, r1, r0
	add r0, r7, #0
	mov r1, #0xac
	mov r2, #0
	bl GetMonData
	str r0, [sp, #4]
	add r0, r6, #0
	mov r1, #0xac
	mov r2, #0
	bl GetMonData
	ldr r1, [sp, #4]
	mov r2, #0x1d
	sub r0, r1, r0
	str r0, [sp]
_0207478E:
	ldmia r6!, {r0, r1}
	stmia r7!, {r0, r1}
	sub r2, r2, #1
	bne _0207478E
	ldr r0, [r6]
	mov r2, #5
	str r0, [r7]
	mov r0, #0x59
	lsl r0, r0, #4
	add r1, r5, r0
	lsl r0, r4, #2
	add r0, r4, r0
	add r0, r1, r0
	mov r1, #0
	bl MI_CpuFill8
	ldr r1, [r5, #4]
	ldr r0, [sp]
	add r0, r1, r0
	str r0, [r5, #4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02074740

	thumb_func_start sub_020747BC
sub_020747BC: ; 0x020747BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r4, r0, #0
	add r6, r2, #0
	cmp r5, #0
	bge _020747CE
	bl GF_AssertFail
_020747CE:
	ldr r0, [r4, #4]
	cmp r5, r0
	blt _020747D8
	bl GF_AssertFail
_020747D8:
	ldr r0, [r4]
	cmp r5, r0
	blt _020747E2
	bl GF_AssertFail
_020747E2:
	cmp r6, #0
	bge _020747EA
	bl GF_AssertFail
_020747EA:
	ldr r0, [r4, #4]
	cmp r6, r0
	blt _020747F4
	bl GF_AssertFail
_020747F4:
	ldr r0, [r4]
	cmp r6, r0
	blt _020747FE
	bl GF_AssertFail
_020747FE:
	mov r0, #0
	mov r1, #0xec
	bl AllocFromHeap
	mov ip, r0
	add r1, r4, #0
	mov r0, #0xec
	add r1, #8
	mul r0, r5
	add r2, r1, r0
	str r2, [sp]
	mov r3, ip
	mov r7, #0x1d
_02074818:
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r7, r7, #1
	bne _02074818
	ldr r0, [r2]
	add r1, r4, #0
	str r0, [r3]
	mov r0, #0xec
	add r1, #8
	mul r0, r6
	add r7, r1, r0
	mov r0, #0x1d
	add r3, r7, #0
	str r0, [sp, #4]
_02074834:
	ldr r2, [sp]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp, #4]
	str r2, [sp]
	sub r0, r0, #1
	str r0, [sp, #4]
	bne _02074834
	ldr r1, [r3]
	add r0, r2, #0
	str r1, [r0]
	mov r2, ip
	mov r3, #0x1d
_0207484E:
	ldmia r2!, {r0, r1}
	stmia r7!, {r0, r1}
	sub r3, r3, #1
	bne _0207484E
	ldr r0, [r2]
	str r0, [r7]
	mov r0, ip
	bl FreeToHeap
	mov r0, #0x59
	lsl r0, r0, #4
	add r3, r4, r0
	lsl r0, r5, #2
	add r2, r5, r0
	ldrb r0, [r3, r2]
	add r5, sp, #8
	add r4, r3, r2
	strb r0, [r5]
	ldrb r0, [r4, #1]
	strb r0, [r5, #1]
	ldrb r0, [r4, #2]
	strb r0, [r5, #2]
	ldrb r0, [r4, #3]
	strb r0, [r5, #3]
	ldrb r0, [r4, #4]
	strb r0, [r5, #4]
	lsl r0, r6, #2
	add r0, r6, r0
	ldrb r6, [r3, r0]
	add r1, r3, r0
	strb r6, [r3, r2]
	ldrb r2, [r1, #1]
	strb r2, [r4, #1]
	ldrb r2, [r1, #2]
	strb r2, [r4, #2]
	ldrb r2, [r1, #3]
	strb r2, [r4, #3]
	ldrb r2, [r1, #4]
	strb r2, [r4, #4]
	ldrb r2, [r5]
	strb r2, [r3, r0]
	ldrb r0, [r5, #1]
	strb r0, [r1, #1]
	ldrb r0, [r5, #2]
	strb r0, [r1, #2]
	ldrb r0, [r5, #3]
	strb r0, [r1, #3]
	ldrb r0, [r5, #4]
	strb r0, [r1, #4]
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020747BC

	thumb_func_start sub_020748B8
sub_020748B8: ; 0x020748B8
	push {r3, r4}
	add r4, r0, #0
	add r3, r1, #0
	mov r2, #0xb6
_020748C0:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _020748C0
	pop {r3, r4}
	bx lr
	thumb_func_end sub_020748B8

	thumb_func_start sub_020748CC
sub_020748CC: ; 0x020748CC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6, #4]
	add r7, r1, #0
	mov r4, #0
	cmp r0, #0
	ble _020748F6
	add r5, r6, #0
	add r5, #8
_020748DE:
	add r0, r5, #0
	mov r1, #0xae
	mov r2, #0
	bl GetMonData
	cmp r7, r0
	beq _020748F6
	ldr r0, [r6, #4]
	add r4, r4, #1
	add r5, #0xec
	cmp r4, r0
	blt _020748DE
_020748F6:
	ldr r0, [r6, #4]
	cmp r4, r0
	beq _02074900
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02074900:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020748CC

	thumb_func_start SavArray_PlayerParty_get
SavArray_PlayerParty_get: ; 0x02074904
	ldr r3, _0207490C ; =SavArray_get
	mov r1, #2
	bx r3
	nop
_0207490C: .word SavArray_get
	thumb_func_end SavArray_PlayerParty_get
