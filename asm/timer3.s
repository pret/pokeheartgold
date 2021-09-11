	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D2210:
	.space 0xC

	.text

	thumb_func_start Init_Timer3
Init_Timer3: ; 0x02025404
	push {r3, lr}
	ldr r0, _0202542C ; =_021D2210
	mov r2, #0
	str r2, [r0, #4]
	str r2, [r0, #8]
	ldr r1, _02025430 ; =0x0400010E
	str r2, [r0]
	strh r2, [r1]
	sub r0, r1, #2
	strh r2, [r0]
	mov r0, #0xc1
	strh r0, [r1]
	ldr r1, _02025434 ; =sub_02025438
	mov r0, #0x40
	bl sub_020D1004
	mov r0, #0x40
	bl OS_EnableIrqMask
	pop {r3, pc}
	.balign 4, 0
_0202542C: .word _021D2210
_02025430: .word 0x0400010E
_02025434: .word sub_02025438
	thumb_func_end Init_Timer3

	thumb_func_start sub_02025438
sub_02025438: ; 0x02025438
	ldr r0, _02025470 ; =_021D2210
	mov r3, #0
	ldr r1, [r0, #4]
	ldr r2, [r0, #8]
	add r1, r1, #1
	adc r2, r3
	str r1, [r0, #4]
	str r2, [r0, #8]
	ldr r1, [r0]
	cmp r1, #0
	beq _0202545C
	ldr r2, _02025474 ; =0x0400010E
	strh r3, [r2]
	sub r1, r2, #2
	strh r3, [r1]
	mov r1, #0xc1
	strh r1, [r2]
	str r3, [r0]
_0202545C:
	ldr r3, _02025478 ; =OSi_IntrTable
	ldr r1, _0202547C ; =0x00003FF8
	mov r0, #0x40
	ldr r2, [r3, r1]
	orr r2, r0
	str r2, [r3, r1]
	ldr r3, _02025480 ; =sub_020D1004
	ldr r1, _02025484 ; =sub_02025438
	bx r3
	nop
_02025470: .word _021D2210
_02025474: .word 0x0400010E
_02025478: .word OSi_IntrTable
_0202547C: .word 0x00003FF8
_02025480: .word sub_020D1004
_02025484: .word sub_02025438
	thumb_func_end sub_02025438

	thumb_func_start sub_02025488
sub_02025488: ; 0x02025488
	push {r4, r5, lr}
	sub sp, #0xc
	bl OS_DisableInterrupts
	ldr r1, _020254EC ; =0x0400010C
	add r3, sp, #0
	ldrh r1, [r1]
	ldr r2, _020254F0 ; =0x0000FFFF
	strh r1, [r3]
	ldr r1, _020254F4 ; =_021D2210
	ldr r5, [r1, #4]
	ldr r4, [r1, #8]
	mov r1, #0
	mvn r1, r1
	and r1, r5
	str r1, [sp, #4]
	and r2, r4
	ldr r1, _020254F8 ; =0x04000214
	str r2, [sp, #8]
	ldr r2, [r1]
	mov r1, #0x40
	tst r2, r1
	beq _020254CC
	ldrh r2, [r3]
	lsl r1, r1, #9
	tst r1, r2
	bne _020254CC
	ldr r2, [sp, #4]
	mov r1, #0
	ldr r3, [sp, #8]
	add r2, r2, #1
	adc r3, r1
	str r2, [sp, #4]
	str r3, [sp, #8]
_020254CC:
	bl OS_RestoreInterrupts
	ldr r2, [sp, #4]
	ldr r1, [sp, #8]
	lsr r0, r2, #0x10
	lsl r1, r1, #0x10
	orr r1, r0
	add r0, sp, #0
	lsl r3, r2, #0x10
	ldrh r2, [r0]
	asr r0, r2, #0x1f
	orr r1, r0
	add r0, r3, #0
	orr r0, r2
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_020254EC: .word 0x0400010C
_020254F0: .word 0x0000FFFF
_020254F4: .word _021D2210
_020254F8: .word 0x04000214
	thumb_func_end sub_02025488

	thumb_func_start sub_020254FC
sub_020254FC: ; 0x020254FC
	ldr r3, _02025500 ; =sub_02025488
	bx r3
	.balign 4, 0
_02025500: .word sub_02025488
	thumb_func_end sub_020254FC

	thumb_func_start sub_02025504
sub_02025504: ; 0x02025504
	push {r3, lr}
	lsr r2, r0, #0x1a
	lsl r1, r1, #6
	orr r1, r2
	ldr r2, _02025518 ; =0x01FF6210
	lsl r0, r0, #6
	mov r3, #0
	bl _ll_udiv
	pop {r3, pc}
	.balign 4, 0
_02025518: .word 0x01FF6210
	thumb_func_end sub_02025504
