	.include "asm/macros.inc"
#include <nitro/fs/overlay.h>
	.include "global.inc"

	.text

	arm_func_start qsort
qsort: ; 0x020E7F5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov sb, r1
	cmp sb, #2
	mov sl, r0
	mov r8, r2
	mov r7, r3
	addlo sp, sp, #0x10
	ldmloia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sb, lsr #1
	add fp, r0, #1
	sub r0, fp, #1
	mla r0, r8, r0, sl
	sub r2, sb, #1
	str r0, [sp, #0xc]
	mla r0, r8, r2, sl
	str r0, [sp, #8]
	mul r0, fp, r8
	mvn r1, #0
	str r0, [sp, #4]
	mul r0, r8, r1
	str r0, [sp]
_020E7FB4:
	cmp fp, #1
	bls _020E7FDC
	ldr r0, [sp, #4]
	sub fp, fp, #1
	sub r0, r0, r8
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	sub r0, r0, r8
	str r0, [sp, #0xc]
	b _020E8024
_020E7FDC:
	mov r2, r8
	ldr r4, [sp, #8]
	ldr r3, [sp, #0xc]
	cmp r8, #0
	beq _020E8008
_020E7FF0:
	ldrsb r0, [r4]
	ldrsb r1, [r3]
	subs r2, r2, #1
	strb r0, [r3], #1
	strb r1, [r4], #1
	bne _020E7FF0
_020E8008:
	sub sb, sb, #1
	cmp sb, #1
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #8]
	sub r0, r0, r8
	str r0, [sp, #8]
_020E8024:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	mov r4, fp
	add r0, r1, r0
	cmp sb, fp, lsl #1
	add r5, sl, r0
	blo _020E7FB4
_020E8040:
	mov r4, r4, lsl #1
	sub r0, r4, #1
	mov r6, r5
	mla r5, r8, r0, sl
	cmp sb, r4
	bls _020E8070
	mov r0, r5
	add r1, r5, r8
	blx r7
	cmp r0, #0
	addlt r4, r4, #1
	addlt r5, r5, r8
_020E8070:
	mov r0, r6
	mov r1, r5
	blx r7
	cmp r0, #0
	bge _020E7FB4
	mov r2, r8
	mov r3, r5
	cmp r8, #0
	beq _020E80AC
_020E8094:
	ldrsb r1, [r6]
	ldrsb r0, [r3]
	subs r2, r2, #1
	strb r0, [r6], #1
	strb r1, [r3], #1
	bne _020E8094
_020E80AC:
	cmp sb, r4, lsl #1
	bhs _020E8040
	b _020E7FB4
_020E80B8: ; 0x020E80B8
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end qsort

	exception qsort, 0x0165, 0x0070FF00
