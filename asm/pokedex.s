	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F6764:
	.byte 0x97, 0x00, 0xFB, 0x00
_020F6768:
	.byte 0x97, 0x00, 0xFB, 0x00, 0x81, 0x01, 0x82, 0x01
	.byte 0xE9, 0x01, 0xEA, 0x01, 0xEB, 0x01, 0xEC, 0x01, 0xED, 0x01, 0x00, 0x00

	.text

	thumb_func_start sub_020293E0
sub_020293E0: ; 0x020293E0
	mov r0, #0xd
	lsl r0, r0, #6
	bx lr
	.balign 4, 0
	thumb_func_end sub_020293E0

	thumb_func_start sub_020293E8
sub_020293E8: ; 0x020293E8
	push {r4, lr}
	mov r1, #0xd
	lsl r1, r1, #6
	bl AllocFromHeap
	add r4, r0, #0
	bl sub_02029D98
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_020293E8

	thumb_func_start sub_020293FC
sub_020293FC: ; 0x020293FC
	ldr r3, _02029404 ; =MI_CpuCopy8
	mov r2, #0xd
	lsl r2, r2, #6
	bx r3
	.balign 4, 0
_02029404: .word MI_CpuCopy8
	thumb_func_end sub_020293FC

; Was inlined in Diamond, not anymore
	thumb_func_start DexSpeciesIsInvalid
DexSpeciesIsInvalid: ; 0x02029408
	push {r3, lr}
	cmp r0, #0
	beq _02029414
	ldr r1, _02029420 ; =0x000001ED
	cmp r0, r1
	bls _0202941C
_02029414:
	bl GF_AssertFail
	mov r0, #1
	pop {r3, pc}
_0202941C:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02029420: .word 0x000001ED
	thumb_func_end DexSpeciesIsInvalid

	thumb_func_start sub_02029424
sub_02029424: ; 0x02029424
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	str r3, [sp]
	bne _02029462
	cmp r4, #2
	blo _02029438
	bl GF_AssertFail
_02029438:
	ldr r0, [sp]
	add r2, r5, #0
	sub r0, r0, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r3, r1, #0
	mov r0, #7
	and r3, r0
	mov r6, #1
	lsl r6, r3
	add r2, #0xc4
	asr r1, r1, #3
	ldrb r0, [r2, r1]
	mvn r6, r6
	and r0, r6
	strb r0, [r2, r1]
	add r0, r4, #0
	ldrb r6, [r2, r1]
	lsl r0, r3
	orr r0, r6
	strb r0, [r2, r1]
_02029462:
	cmp r4, #2
	blo _0202946A
	bl GF_AssertFail
_0202946A:
	ldr r0, [sp]
	add r5, #0x84
	sub r0, r0, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	mov r0, #7
	add r2, r3, #0
	and r2, r0
	lsl r0, r7, #6
	add r1, r5, r0
	asr r0, r3, #3
	mov r3, #1
	lsl r3, r2
	ldrb r5, [r1, r0]
	mvn r3, r3
	and r3, r5
	strb r3, [r1, r0]
	add r3, r4, #0
	ldrb r5, [r1, r0]
	lsl r3, r2
	add r2, r5, #0
	orr r2, r3
	strb r2, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02029424

	thumb_func_start sub_0202949C
sub_0202949C: ; 0x0202949C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #2
	bls _020294AE
	bl GF_AssertFail
_020294AE:
	cmp r4, #2
	bne _020294B4
	mov r4, #0
_020294B4:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_02029424
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202949C

	thumb_func_start sub_020294C4
sub_020294C4: ; 0x020294C4
	push {r3, lr}
	ldr r2, _0202954C ; =0x000001A6
	cmp r1, r2
	bhi _020294F8
	bhs _02029518
	cmp r1, #0xac
	bhi _020294D6
	beq _0202953E
	b _02029544
_020294D6:
	add r3, r2, #0
	sub r3, #9
	cmp r1, r3
	bhi _02029544
	add r3, r2, #0
	sub r3, #0xa
	cmp r1, r3
	blo _02029544
	add r3, r2, #0
	sub r3, #0xa
	cmp r1, r3
	beq _02029532
	add r3, r2, #0
	sub r3, #9
	cmp r1, r3
	beq _02029538
	b _02029544
_020294F8:
	add r3, r2, #0
	add r3, #0x41
	cmp r1, r3
	bhi _02029510
	add r3, r2, #0
	add r3, #0x41
	cmp r1, r3
	bhs _0202952C
	add r3, r2, #1
	cmp r1, r3
	beq _0202951E
	b _02029544
_02029510:
	add r2, #0x46
	cmp r1, r2
	beq _02029524
	b _02029544
_02029518:
	sub r2, #0x9e
	add r0, r0, r2
	pop {r3, pc}
_0202951E:
	sub r2, #0x9d
	add r0, r0, r2
	pop {r3, pc}
_02029524:
	mov r1, #0xcf
	lsl r1, r1, #2
	add r0, r0, r1
	pop {r3, pc}
_0202952C:
	ldr r1, _02029550 ; =0x0000033D
	add r0, r0, r1
	pop {r3, pc}
_02029532:
	sub r2, #0x9c
	add r0, r0, r2
	pop {r3, pc}
_02029538:
	sub r2, #0x9b
	add r0, r0, r2
	pop {r3, pc}
_0202953E:
	ldr r1, _02029554 ; =0x0000033E
	add r0, r0, r1
	pop {r3, pc}
_02029544:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_0202954C: .word 0x000001A6
_02029550: .word 0x0000033D
_02029554: .word 0x0000033E
	thumb_func_end sub_020294C4

	thumb_func_start sub_02029558
sub_02029558: ; 0x02029558
	mov r2, #0
	cmp r1, #0
	beq _02029562
	mov r1, #0x4a
	b _02029564
_02029562:
	mov r1, #0x43
_02029564:
	lsl r1, r1, #2
	add r3, r0, r1
	mov r1, #0
_0202956A:
	ldrb r0, [r3, r1]
	cmp r0, #0xff
	beq _02029578
	add r1, r1, #1
	add r2, r2, #1
	cmp r1, #0x1c
	blt _0202956A
_02029578:
	add r0, r2, #0
	bx lr
	thumb_func_end sub_02029558

	thumb_func_start sub_0202957C
sub_0202957C: ; 0x0202957C
	cmp r2, #0
	beq _02029584
	mov r2, #0x4a
	b _02029586
_02029584:
	mov r2, #0x43
_02029586:
	lsl r2, r2, #2
	add r3, r0, r2
	mov r2, #0
_0202958C:
	ldrb r0, [r3, r2]
	cmp r1, r0
	bne _02029596
	mov r0, #1
	bx lr
_02029596:
	add r2, r2, #1
	cmp r2, #0x1c
	blt _0202958C
	mov r0, #0
	bx lr
	thumb_func_end sub_0202957C

	thumb_func_start sub_020295A0
sub_020295A0: ; 0x020295A0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	beq _020295AE
	mov r0, #0x4a
	b _020295B0
_020295AE:
	mov r0, #0x43
_020295B0:
	lsl r0, r0, #2
	lsl r1, r4, #0x18
	add r6, r5, r0
	add r0, r5, #0
	lsr r1, r1, #0x18
	add r2, r7, #0
	bl sub_0202957C
	cmp r0, #0
	bne _020295D2
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02029558
	cmp r0, #0x1c
	bge _020295D2
	strb r4, [r6, r0]
_020295D2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020295A0

	thumb_func_start sub_020295D4
sub_020295D4: ; 0x020295D4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r1, _02029638 ; =0x000001A6
	add r5, r0, #0
	cmp r4, r1
	beq _020295F8
	add r0, r1, #1
	cmp r4, r0
	beq _020295F8
	add r0, r1, #0
	add r0, #0x46
	cmp r4, r0
	beq _020295F8
	add r1, #0x41
	cmp r4, r1
	beq _020295F8
	bl GF_AssertFail
_020295F8:
	lsl r1, r4, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	bne _0202960A
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202960A:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020294C4
	ldrb r1, [r0]
	mov r2, #1
	add r0, r1, #0
	tst r0, r2
	bne _0202961E
	mov r2, #0
_0202961E:
	mov r0, #2
	tst r0, r1
	beq _02029628
	mov r0, #1
	b _0202962A
_02029628:
	mov r0, #0
_0202962A:
	cmp r2, r0
	bne _02029632
	mov r0, #1
	pop {r3, r4, r5, pc}
_02029632:
	mov r0, #2
	pop {r3, r4, r5, pc}
	nop
_02029638: .word 0x000001A6
	thumb_func_end sub_020295D4

	thumb_func_start sub_0202963C
sub_0202963C: ; 0x0202963C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	ldr r1, _020296C4 ; =0x000001A6
	add r7, r0, #0
	add r5, r2, #0
	cmp r6, r1
	beq _02029662
	add r0, r1, #1
	cmp r6, r0
	beq _02029662
	add r0, r1, #0
	add r0, #0x46
	cmp r6, r0
	beq _02029662
	add r1, #0x41
	cmp r6, r1
	beq _02029662
	bl GF_AssertFail
_02029662:
	lsl r1, r6, #0x10
	add r0, r7, #0
	lsr r1, r1, #0x10
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	bne _02029674
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02029674:
	add r0, r7, #0
	add r1, r6, #0
	bl sub_020294C4
	add r4, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	bl sub_020295D4
	mov r6, #0
	cmp r0, #0
	bls _020296C0
	mov r1, #1
_0202968E:
	add r2, r6, #1
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	sub r2, r2, #1
	lsl r2, r2, #0x10
	lsr r3, r2, #0x10
	add r7, r3, #0
	mov r2, #7
	asr r3, r3, #3
	and r7, r2
	add r2, r1, #0
	ldrb r3, [r4, r3]
	lsl r2, r7
	tst r2, r3
	beq _020296B0
	add r2, r1, #0
	b _020296B2
_020296B0:
	mov r2, #0
_020296B2:
	cmp r2, r5
	bne _020296BA
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_020296BA:
	add r6, r6, #1
	cmp r6, r0
	blo _0202968E
_020296C0:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020296C4: .word 0x000001A6
	thumb_func_end sub_0202963C

	thumb_func_start sub_020296C8
sub_020296C8: ; 0x020296C8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldr r1, _0202978C ; =0x000001A6
	add r7, r0, #0
	add r6, r2, #0
	cmp r4, r1
	beq _020296EE
	add r0, r1, #1
	cmp r4, r0
	beq _020296EE
	add r0, r1, #0
	add r0, #0x46
	cmp r4, r0
	beq _020296EE
	add r1, #0x41
	cmp r4, r1
	beq _020296EE
	bl GF_AssertFail
_020296EE:
	lsl r2, r6, #0x18
	add r0, r7, #0
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl sub_0202963C
	cmp r0, #0
	bne _02029788
	add r0, r7, #0
	add r1, r4, #0
	bl sub_020294C4
	add r5, r0, #0
	add r0, r7, #0
	add r1, r4, #0
	bl sub_020295D4
	add r4, r0, #0
	cmp r4, #2
	bge _02029788
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	cmp r0, #2
	blo _02029728
	bl GF_AssertFail
_02029728:
	sub r0, r7, #1
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	add r2, r1, #0
	mov r0, #7
	and r2, r0
	asr r1, r1, #3
	mov r3, #1
	lsl r3, r2
	ldrb r0, [r5, r1]
	mvn r3, r3
	and r0, r3
	strb r0, [r5, r1]
	lsl r0, r6, #0x18
	lsr r6, r0, #0x18
	add r0, r6, #0
	ldrb r3, [r5, r1]
	lsl r0, r2
	orr r0, r3
	strb r0, [r5, r1]
	cmp r4, #0
	bne _02029788
	add r0, r4, #2
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r6, #2
	blo _02029762
	bl GF_AssertFail
_02029762:
	sub r0, r4, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	mov r0, #7
	add r1, r2, #0
	and r1, r0
	asr r0, r2, #3
	mov r2, #1
	lsl r2, r1
	ldrb r3, [r5, r0]
	mvn r2, r2
	and r2, r3
	strb r2, [r5, r0]
	add r2, r6, #0
	ldrb r3, [r5, r0]
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	strb r1, [r5, r0]
_02029788:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202978C: .word 0x000001A6
	thumb_func_end sub_020296C8

	thumb_func_start sub_02029790
sub_02029790: ; 0x02029790
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x67
	add r4, r1, #0
	lsl r0, r0, #2
	cmp r4, r0
	beq _020297AC
	add r0, r0, #1
	cmp r4, r0
	beq _020297AC
	cmp r4, #0xac
	beq _020297AC
	bl GF_AssertFail
_020297AC:
	lsl r1, r4, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	bne _020297BE
	mov r0, #0
	pop {r3, r4, r5, pc}
_020297BE:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020294C4
	mov r1, #0
	mov r3, #3
_020297CA:
	lsl r2, r1, #0x10
	lsr r5, r2, #0x10
	asr r2, r5, #2
	ldrb r4, [r0, r2]
	lsl r2, r5, #0x1e
	lsr r2, r2, #0x1d
	asr r4, r2
	add r2, r4, #0
	and r2, r3
	cmp r2, #3
	beq _020297E6
	add r1, r1, #1
	cmp r1, #3
	blt _020297CA
_020297E6:
	add r0, r1, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02029790

	thumb_func_start sub_020297EC
sub_020297EC: ; 0x020297EC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0x67
	add r5, r1, #0
	lsl r0, r0, #2
	add r4, r2, #0
	cmp r5, r0
	beq _0202980A
	add r0, r0, #1
	cmp r5, r0
	beq _0202980A
	cmp r5, #0xac
	beq _0202980A
	bl GF_AssertFail
_0202980A:
	lsl r1, r5, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	bne _0202981C
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202981C:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020294C4
	mov r1, #0
	mov r3, #3
_02029828:
	lsl r2, r1, #0x10
	lsr r6, r2, #0x10
	asr r2, r6, #2
	ldrb r5, [r0, r2]
	lsl r2, r6, #0x1e
	lsr r2, r2, #0x1d
	asr r5, r2
	add r2, r5, #0
	and r2, r3
	cmp r2, r4
	bne _02029842
	mov r0, #1
	pop {r4, r5, r6, pc}
_02029842:
	add r1, r1, #1
	cmp r1, #3
	blt _02029828
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020297EC

	thumb_func_start sub_0202984C
sub_0202984C: ; 0x0202984C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r0, #0x67
	add r5, r1, #0
	lsl r0, r0, #2
	add r6, r2, #0
	cmp r5, r0
	beq _0202986A
	add r0, r0, #1
	cmp r5, r0
	beq _0202986A
	cmp r5, #0xac
	beq _0202986A
	bl GF_AssertFail
_0202986A:
	lsl r2, r6, #0x18
	add r0, r7, #0
	add r1, r5, #0
	lsr r2, r2, #0x18
	bl sub_020297EC
	cmp r0, #0
	bne _020298C2
	add r0, r7, #0
	add r1, r5, #0
	bl sub_020294C4
	add r4, r0, #0
	add r0, r7, #0
	add r1, r5, #0
	bl sub_02029790
	add r5, r0, #0
	cmp r5, #3
	bge _020298C2
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	cmp r0, #4
	blo _0202989E
	bl GF_AssertFail
_0202989E:
	lsl r0, r5, #0x10
	lsr r2, r0, #0x10
	lsl r0, r2, #0x1e
	lsr r1, r0, #0x1d
	asr r0, r2, #2
	mov r2, #3
	lsl r2, r1
	ldrb r3, [r4, r0]
	mvn r2, r2
	and r2, r3
	strb r2, [r4, r0]
	lsl r2, r6, #0x18
	lsr r2, r2, #0x18
	ldrb r3, [r4, r0]
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	strb r1, [r4, r0]
_020298C2:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0202984C

	thumb_func_start sub_020298C4
sub_020298C4: ; 0x020298C4
	push {r3, r4}
	lsl r2, r2, #2
	add r2, #0x18
	mov r3, #0xf
	lsl r3, r2
	ldr r4, [r0, #0x3c]
	mvn r3, r3
	lsl r1, r2
	and r3, r4
	orr r1, r3
	str r1, [r0, #0x3c]
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_020298C4

	thumb_func_start sub_020298E0
sub_020298E0: ; 0x020298E0
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #4
	blo _020298F0
	bl GF_AssertFail
_020298F0:
	cmp r6, #0xf
	bls _020298F8
	bl GF_AssertFail
_020298F8:
	cmp r4, #2
	bhs _02029908
	add r0, r5, #4
	add r1, r6, #0
	add r2, r4, #0
	bl sub_020298C4
	pop {r4, r5, r6, pc}
_02029908:
	sub r2, r4, #2
	add r5, #0x44
	lsl r2, r2, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl sub_020298C4
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020298E0

	thumb_func_start sub_0202991C
sub_0202991C: ; 0x0202991C
	cmp r1, #2
	bhs _02029930
	ldr r2, [r0, #0x40]
	lsl r0, r1, #2
	add r0, #0x18
	add r1, r2, #0
	lsr r1, r0
	mov r0, #0xf
	and r0, r1
	bx lr
_02029930:
	add r0, #0x80
	ldr r2, [r0]
	sub r0, r1, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x16
	add r0, #0x18
	add r1, r2, #0
	lsr r1, r0
	mov r0, #0xf
	and r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202991C

	thumb_func_start sub_02029948
sub_02029948: ; 0x02029948
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0202994E:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0202991C
	cmp r0, #0xf
	beq _02029962
	add r4, r4, #1
	cmp r4, #4
	blt _0202994E
_02029962:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02029948

	thumb_func_start sub_02029968
sub_02029968: ; 0x02029968
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
_02029970:
	lsl r1, r4, #0x18
	add r0, r6, #0
	lsr r1, r1, #0x18
	bl sub_0202991C
	cmp r5, r0
	bne _02029982
	mov r0, #1
	pop {r4, r5, r6, pc}
_02029982:
	add r4, r4, #1
	cmp r4, #4
	blt _02029970
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02029968

	thumb_func_start sub_0202998C
sub_0202998C: ; 0x0202998C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r0, r2, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, _020299C8 ; =0x00000182
	cmp r6, r0
	bne _020299C6
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02029968
	cmp r0, #0
	bne _020299C6
	add r0, r5, #0
	bl sub_02029948
	add r2, r0, #0
	lsl r2, r2, #0x18
	add r0, r5, #0
	add r1, r4, #0
	lsr r2, r2, #0x18
	bl sub_020298E0
_020299C6:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020299C8: .word 0x00000182
	thumb_func_end sub_0202998C

	thumb_func_start sub_020299CC
sub_020299CC: ; 0x020299CC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #0
	mov r6, #0xf
_020299D4:
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl sub_020298E0
	add r4, r4, #1
	cmp r4, #4
	blt _020299D4
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020299CC

	thumb_func_start sub_020299E8
sub_020299E8: ; 0x020299E8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _02029A30 ; =0x000001DF
	add r5, r1, #0
	cmp r5, r0
	beq _020299F8
	bl GF_AssertFail
_020299F8:
	lsl r1, r5, #0x10
	add r0, r4, #0
	lsr r1, r1, #0x10
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	bne _02029A0A
	mov r0, #0
	pop {r3, r4, r5, pc}
_02029A0A:
	mov r2, #0xce
	lsl r2, r2, #2
	mov r0, #0
	ldr r5, [r4, r2]
	add r1, r0, #0
	mov r3, #7
_02029A16:
	lsl r2, r1, #1
	add r2, r1, r2
	add r4, r5, #0
	lsr r4, r2
	add r2, r4, #0
	and r2, r3
	cmp r2, #7
	beq _02029A2E
	add r1, r1, #1
	add r0, r0, #1
	cmp r1, #6
	blt _02029A16
_02029A2E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02029A30: .word 0x000001DF
	thumb_func_end sub_020299E8

	thumb_func_start sub_02029A34
sub_02029A34: ; 0x02029A34
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _02029A8C ; =0x000001DF
	add r5, r1, #0
	add r4, r2, #0
	cmp r5, r0
	beq _02029A46
	bl GF_AssertFail
_02029A46:
	lsl r1, r5, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #0
	bne _02029A58
	mov r0, #0
	pop {r4, r5, r6, pc}
_02029A58:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020299E8
	mov r1, #0
	cmp r0, #0
	bls _02029A88
	mov r2, #0xce
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	mov r5, #7
_02029A6E:
	lsl r3, r1, #1
	add r3, r1, r3
	add r6, r2, #0
	lsr r6, r3
	add r3, r6, #0
	and r3, r5
	cmp r3, r4
	bne _02029A82
	mov r0, #1
	pop {r4, r5, r6, pc}
_02029A82:
	add r1, r1, #1
	cmp r1, r0
	blo _02029A6E
_02029A88:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02029A8C: .word 0x000001DF
	thumb_func_end sub_02029A34

	thumb_func_start sub_02029A90
sub_02029A90: ; 0x02029A90
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _02029AEC ; =0x000001DF
	add r6, r1, #0
	add r4, r2, #0
	cmp r6, r0
	beq _02029AA2
	bl GF_AssertFail
_02029AA2:
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl sub_02029A34
	cmp r0, #0
	bne _02029AE8
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020299E8
	add r6, r0, #0
	cmp r6, #6
	bge _02029AE8
	cmp r4, #7
	blo _02029AC8
	bl GF_AssertFail
_02029AC8:
	lsl r0, r6, #1
	mov r1, #0xce
	lsl r1, r1, #2
	add r0, r6, r0
	mov r2, #7
	lsl r2, r0
	ldr r3, [r5, r1]
	mvn r2, r2
	and r2, r3
	str r2, [r5, r1]
	add r2, r4, #0
	ldr r3, [r5, r1]
	lsl r2, r0
	add r0, r3, #0
	orr r0, r2
	str r0, [r5, r1]
_02029AE8:
	pop {r4, r5, r6, pc}
	nop
_02029AEC: .word 0x000001DF
	thumb_func_end sub_02029A90

	thumb_func_start sub_02029AF0
sub_02029AF0: ; 0x02029AF0
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r2, r0, #0
	ldr r0, _02029BDC ; =0x000001A6
	cmp r4, r0
	bgt _02029B48
	bge _02029BB0
	cmp r4, #0xc9
	bgt _02029B18
	bge _02029B78
	cmp r4, #0xac
	beq _02029B8E
	pop {r4, r5, r6, pc}
_02029B18:
	add r1, r0, #0
	sub r1, #0x24
	cmp r4, r1
	bgt _02029B28
	sub r0, #0x24
	cmp r4, r0
	beq _02029BBA
	pop {r4, r5, r6, pc}
_02029B28:
	add r1, r0, #0
	sub r1, #9
	cmp r4, r1
	bgt _02029BD8
	add r1, r0, #0
	sub r1, #0xa
	cmp r4, r1
	blt _02029BD8
	add r1, r0, #0
	sub r1, #0xa
	cmp r4, r1
	beq _02029B84
	sub r0, #9
	cmp r4, r0
	beq _02029B84
	pop {r4, r5, r6, pc}
_02029B48:
	add r1, r0, #0
	add r1, #0x39
	cmp r4, r1
	bgt _02029B60
	add r1, r0, #0
	add r1, #0x39
	cmp r4, r1
	bge _02029BD0
	add r0, r0, #1
	cmp r4, r0
	beq _02029BB0
	pop {r4, r5, r6, pc}
_02029B60:
	add r1, r0, #0
	add r1, #0x41
	cmp r4, r1
	bgt _02029B70
	add r0, #0x41
	cmp r4, r0
	beq _02029BC6
	pop {r4, r5, r6, pc}
_02029B70:
	add r0, #0x46
	cmp r4, r0
	beq _02029BC6
	pop {r4, r5, r6, pc}
_02029B78:
	add r1, r2, #0
	add r0, r5, #0
	mov r2, #0
	bl sub_020295A0
	pop {r4, r5, r6, pc}
_02029B84:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202984C
	pop {r4, r5, r6, pc}
_02029B8E:
	cmp r2, #0
	bne _02029BA4
	add r0, r6, #0
	bl GetMonGender
	cmp r0, #0
	bne _02029BA0
	mov r2, #0
	b _02029BA6
_02029BA0:
	mov r2, #1
	b _02029BA6
_02029BA4:
	mov r2, #2
_02029BA6:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0202984C
	pop {r4, r5, r6, pc}
_02029BB0:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020296C8
	pop {r4, r5, r6, pc}
_02029BBA:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0202998C
	pop {r4, r5, r6, pc}
_02029BC6:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020296C8
	pop {r4, r5, r6, pc}
_02029BD0:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02029A90
_02029BD8:
	pop {r4, r5, r6, pc}
	nop
_02029BDC: .word 0x000001A6
	thumb_func_end sub_02029AF0

	thumb_func_start sub_02029BE0
sub_02029BE0: ; 0x02029BE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r2, #0
	add r4, r1, #0
	bl sub_02091278
	cmp r0, #6
	beq _02029C02
	mov r1, #0x51
	lsl r1, r1, #2
	add r3, r5, r1
	ldrb r2, [r3, r4]
	mov r1, #1
	lsl r1, r0
	add r0, r2, #0
	orr r0, r1
	strb r0, [r3, r4]
_02029C02:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02029BE0

	thumb_func_start sub_02029C04
sub_02029C04: ; 0x02029C04
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0x12
	add r4, r2, #0
	bl GetMonBaseStat
	cmp r0, #0xff
	bne _02029C26
	cmp r4, #0
	bne _02029C20
	mov r0, #2
	pop {r4, r5, r6, pc}
_02029C20:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02029C26:
	sub r0, r6, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	mov r1, #1
	mov r0, #7
	add r3, r2, #0
	and r3, r0
	add r0, r1, #0
	lsl r0, r3
	asr r3, r2, #3
	add r3, r5, r3
	add r3, #0x84
	ldrb r3, [r3]
	tst r0, r3
	bne _02029C46
	mov r1, #0
_02029C46:
	lsl r0, r1, #0x18
	lsr r1, r0, #0x18
	cmp r4, #1
	bne _02029C76
	add r4, r2, #0
	asr r2, r2, #3
	add r2, r5, r2
	mov r0, #7
	add r2, #0xc4
	mov r3, #1
	and r4, r0
	add r0, r3, #0
	ldrb r2, [r2]
	lsl r0, r4
	tst r0, r2
	bne _02029C68
	mov r3, #0
_02029C68:
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	cmp r0, r1
	bne _02029C78
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_02029C76:
	add r0, r1, #0
_02029C78:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02029C04

	thumb_func_start sub_02029C7C
sub_02029C7C: ; 0x02029C7C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldr r1, _02029CD8 ; =0x000001A6
	add r6, r0, #0
	add r4, r2, #0
	cmp r5, r1
	beq _02029CA2
	add r0, r1, #1
	cmp r5, r0
	beq _02029CA2
	add r0, r1, #0
	add r0, #0x46
	cmp r5, r0
	beq _02029CA2
	add r1, #0x41
	cmp r5, r1
	beq _02029CA2
	bl GF_AssertFail
_02029CA2:
	cmp r4, #2
	blt _02029CAA
	bl GF_AssertFail
_02029CAA:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020294C4
	add r1, r4, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	sub r1, r1, #1
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	mov r1, #1
	mov r2, #7
	and r2, r4
	add r3, r1, #0
	lsl r3, r2
	asr r2, r4, #3
	ldrb r0, [r0, r2]
	tst r0, r3
	bne _02029CD2
	mov r1, #0
_02029CD2:
	add r0, r1, #0
	pop {r4, r5, r6, pc}
	nop
_02029CD8: .word 0x000001A6
	thumb_func_end sub_02029C7C

	thumb_func_start sub_02029CDC
sub_02029CDC: ; 0x02029CDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02029D08 ; =0x000001DF
	add r4, r2, #0
	cmp r1, r0
	beq _02029CEC
	bl GF_AssertFail
_02029CEC:
	cmp r4, #6
	blt _02029CF4
	bl GF_AssertFail
_02029CF4:
	mov r0, #0xce
	lsl r0, r0, #2
	ldr r1, [r5, r0]
	lsl r0, r4, #1
	add r0, r4, r0
	lsr r1, r0
	mov r0, #7
	and r0, r1
	pop {r3, r4, r5, pc}
	nop
_02029D08: .word 0x000001DF
	thumb_func_end sub_02029CDC

	thumb_func_start sub_02029D0C
sub_02029D0C: ; 0x02029D0C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0x67
	add r5, r1, #0
	lsl r0, r0, #2
	add r4, r2, #0
	cmp r5, r0
	beq _02029D2A
	add r0, r0, #1
	cmp r5, r0
	beq _02029D2A
	cmp r5, #0xac
	beq _02029D2A
	bl GF_AssertFail
_02029D2A:
	cmp r4, #3
	blt _02029D32
	bl GF_AssertFail
_02029D32:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020294C4
	lsl r1, r4, #0x10
	lsr r2, r1, #0x10
	asr r1, r2, #2
	ldrb r1, [r0, r1]
	lsl r0, r2, #0x1e
	lsr r0, r0, #0x1d
	asr r1, r0
	mov r0, #3
	and r0, r1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02029D0C

	thumb_func_start sub_02029D50
sub_02029D50: ; 0x02029D50
	push {r4, r5}
	mov r3, #0
	ldr r5, _02029D70 ; =0x020F6768
	mov r4, #1
	add r1, r3, #0
_02029D5A:
	ldrh r2, [r5]
	cmp r0, r2
	bne _02029D62
	add r4, r1, #0
_02029D62:
	add r3, r3, #1
	add r5, r5, #2
	cmp r3, #9
	blt _02029D5A
	add r0, r4, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02029D70: .word 0x020F6768
	thumb_func_end sub_02029D50

	thumb_func_start sub_02029D74
sub_02029D74: ; 0x02029D74
	push {r4, r5}
	mov r3, #0
	ldr r5, _02029D94 ; =0x020F6764
	mov r4, #1
	add r1, r3, #0
_02029D7E:
	ldrh r2, [r5]
	cmp r0, r2
	bne _02029D86
	add r4, r1, #0
_02029D86:
	add r3, r3, #1
	add r5, r5, #2
	cmp r3, #2
	blt _02029D7E
	add r0, r4, #0
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02029D94: .word 0x020F6764
	thumb_func_end sub_02029D74

	thumb_func_start sub_02029D98
sub_02029D98: ; 0x02029D98
	push {r4, lr}
	mov r2, #0xd
	mov r1, #0
	lsl r2, r2, #6
	add r4, r0, #0
	bl memset
	ldr r0, _02029E04 ; =0xBEEFCAFE
	mov r1, #0
	str r0, [r4]
	ldr r0, _02029E08 ; =0x00000337
	mov r2, #0x1c
	strb r1, [r4, r0]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0xff
	bl memset
	mov r0, #0x4a
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0xff
	mov r2, #0x1c
	bl memset
	mov r0, #0xff
	add r1, r0, #0
	add r1, #9
	strb r0, [r4, r1]
	add r1, r0, #0
	add r1, #0xa
	strb r0, [r4, r1]
	add r1, r0, #0
	add r1, #0xb
	strb r0, [r4, r1]
	add r1, r0, #0
	add r1, #0xc
	strb r0, [r4, r1]
	mov r2, #0
	mov r1, #0xce
	mvn r2, r2
	lsl r1, r1, #2
	str r2, [r4, r1]
	add r2, r1, #4
	strb r0, [r4, r2]
	add r2, r1, #5
	strb r0, [r4, r2]
	add r1, r1, #6
	strb r0, [r4, r1]
	add r0, r4, #0
	bl sub_020299CC
	pop {r4, pc}
	.balign 4, 0
_02029E04: .word 0xBEEFCAFE
_02029E08: .word 0x00000337
	thumb_func_end sub_02029D98

	thumb_func_start sub_02029E0C
sub_02029E0C: ; 0x02029E0C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r1, [r6]
	ldr r0, _02029E40 ; =0xBEEFCAFE
	cmp r1, r0
	beq _02029E1C
	bl GF_AssertFail
_02029E1C:
	ldr r7, _02029E44 ; =0x000001ED
	mov r5, #0
	mov r4, #1
_02029E22:
	lsl r1, r4, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #1
	bne _02029E32
	add r5, r5, #1
_02029E32:
	add r4, r4, #1
	cmp r4, r7
	ble _02029E22
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02029E40: .word 0xBEEFCAFE
_02029E44: .word 0x000001ED
	thumb_func_end sub_02029E0C

	thumb_func_start sub_02029E48
sub_02029E48: ; 0x02029E48
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r1, [r6]
	ldr r0, _02029E7C ; =0xBEEFCAFE
	cmp r1, r0
	beq _02029E58
	bl GF_AssertFail
_02029E58:
	ldr r7, _02029E80 ; =0x000001ED
	mov r5, #0
	mov r4, #1
_02029E5E:
	lsl r1, r4, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #1
	bne _02029E6E
	add r5, r5, #1
_02029E6E:
	add r4, r4, #1
	cmp r4, r7
	ble _02029E5E
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02029E7C: .word 0xBEEFCAFE
_02029E80: .word 0x000001ED
	thumb_func_end sub_02029E48

	thumb_func_start sub_02029E84
sub_02029E84: ; 0x02029E84
	push {r4, lr}
	add r4, r0, #0
	bl Pokedex_GetNatDexFlag
	cmp r0, #0
	beq _02029E98
	add r0, r4, #0
	bl sub_02029E0C
	pop {r4, pc}
_02029E98:
	add r0, r4, #0
	bl sub_02029EA0
	pop {r4, pc}
	thumb_func_end sub_02029E84

	thumb_func_start sub_02029EA0
sub_02029EA0: ; 0x02029EA0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r1, [r7]
	ldr r0, _02029EEC ; =0xBEEFCAFE
	cmp r1, r0
	beq _02029EB0
	bl GF_AssertFail
_02029EB0:
	bl LoadSpeciesToJohtoDexNoLUT
	add r6, r0, #0
	mov r5, #0
	mov r4, #1
_02029EBA:
	add r0, r7, #0
	add r1, r4, #0
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #1
	bne _02029ED4
	lsl r0, r4, #1
	ldrh r0, [r6, r0]
	cmp r0, #0
	beq _02029ED4
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
_02029ED4:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, _02029EF0 ; =0x000001ED
	cmp r4, r0
	bls _02029EBA
	add r0, r6, #0
	bl FreeToHeap
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02029EEC: .word 0xBEEFCAFE
_02029EF0: .word 0x000001ED
	thumb_func_end sub_02029EA0

	thumb_func_start sub_02029EF4
sub_02029EF4: ; 0x02029EF4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r1, [r7]
	ldr r0, _02029F40 ; =0xBEEFCAFE
	cmp r1, r0
	beq _02029F04
	bl GF_AssertFail
_02029F04:
	bl LoadSpeciesToJohtoDexNoLUT
	add r6, r0, #0
	mov r5, #0
	mov r4, #1
_02029F0E:
	add r0, r7, #0
	add r1, r4, #0
	bl Pokedex_CheckMonSeenFlag
	cmp r0, #1
	bne _02029F28
	lsl r0, r4, #1
	ldrh r0, [r6, r0]
	cmp r0, #0
	beq _02029F28
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
_02029F28:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, _02029F44 ; =0x000001ED
	cmp r4, r0
	bls _02029F0E
	add r0, r6, #0
	bl FreeToHeap
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02029F40: .word 0xBEEFCAFE
_02029F44: .word 0x000001ED
	thumb_func_end sub_02029EF4

	thumb_func_start sub_02029F48
sub_02029F48: ; 0x02029F48
	push {r3, lr}
	bl sub_02029F74
	mov r1, #0x79
	lsl r1, r1, #2
	cmp r0, r1
	blo _02029F5A
	mov r0, #1
	pop {r3, pc}
_02029F5A:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02029F48

	thumb_func_start sub_02029F60
sub_02029F60: ; 0x02029F60
	push {r3, lr}
	bl sub_02029FAC
	cmp r0, #0xfe
	blo _02029F6E
	mov r0, #1
	pop {r3, pc}
_02029F6E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02029F60

	thumb_func_start sub_02029F74
sub_02029F74: ; 0x02029F74
	push {r3, r4, r5, r6, r7, lr}
	ldr r7, _02029FA8 ; =0x000001ED
	add r6, r0, #0
	mov r5, #0
	mov r4, #1
_02029F7E:
	lsl r1, r4, #0x10
	add r0, r6, #0
	lsr r1, r1, #0x10
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #1
	bne _02029F9E
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl sub_02029D50
	cmp r0, #1
	bne _02029F9E
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
_02029F9E:
	add r4, r4, #1
	cmp r4, r7
	ble _02029F7E
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02029FA8: .word 0x000001ED
	thumb_func_end sub_02029F74

	thumb_func_start sub_02029FAC
sub_02029FAC: ; 0x02029FAC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl LoadSpeciesToJohtoDexNoLUT
	add r6, r0, #0
	mov r5, #0
	mov r4, #1
_02029FBA:
	add r0, r7, #0
	add r1, r4, #0
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #1
	bne _02029FDE
	lsl r0, r4, #1
	ldrh r0, [r6, r0]
	cmp r0, #0
	beq _02029FDE
	add r0, r4, #0
	bl sub_02029D74
	cmp r0, #1
	bne _02029FDE
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
_02029FDE:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldr r0, _02029FF4 ; =0x000001ED
	cmp r4, r0
	bls _02029FBA
	add r0, r6, #0
	bl FreeToHeap
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02029FF4: .word 0x000001ED
	thumb_func_end sub_02029FAC

	thumb_func_start Pokedex_CheckMonCaughtFlag
Pokedex_CheckMonCaughtFlag: ; 0x02029FF8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A040 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A00A
	bl GF_AssertFail
_0202A00A:
	add r0, r4, #0
	bl DexSpeciesIsInvalid
	cmp r0, #0
	beq _0202A018
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202A018:
	sub r0, r4, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	mov r0, #1
	mov r1, #7
	and r1, r2
	add r3, r0, #0
	lsl r3, r1
	asr r1, r2, #3
	add r2, r5, r1
	ldrb r1, [r2, #4]
	tst r1, r3
	beq _0202A03A
	add r2, #0x44
	ldrb r1, [r2]
	tst r1, r3
	bne _0202A03C
_0202A03A:
	mov r0, #0
_0202A03C:
	pop {r3, r4, r5, pc}
	nop
_0202A040: .word 0xBEEFCAFE
	thumb_func_end Pokedex_CheckMonCaughtFlag

	thumb_func_start Pokedex_CheckMonSeenFlag
Pokedex_CheckMonSeenFlag: ; 0x0202A044
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A084 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A056
	bl GF_AssertFail
_0202A056:
	add r0, r4, #0
	bl DexSpeciesIsInvalid
	cmp r0, #0
	beq _0202A064
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202A064:
	sub r0, r4, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	mov r0, #1
	mov r1, #7
	and r1, r3
	add r2, r0, #0
	lsl r2, r1
	asr r1, r3, #3
	add r1, r5, r1
	add r1, #0x44
	ldrb r1, [r1]
	tst r1, r2
	bne _0202A082
	mov r0, #0
_0202A082:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202A084: .word 0xBEEFCAFE
	thumb_func_end Pokedex_CheckMonSeenFlag

	thumb_func_start Pokedex_GetSeenSpindaPersonality
Pokedex_GetSeenSpindaPersonality: ; 0x0202A088
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A0B0 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A09A
	bl GF_AssertFail
_0202A09A:
	cmp r4, #0
	bne _0202A0A6
	mov r0, #0x41
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	b _0202A0AA
_0202A0A6:
	bl GF_AssertFail
_0202A0AA:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_0202A0B0: .word 0xBEEFCAFE
	thumb_func_end Pokedex_GetSeenSpindaPersonality

	thumb_func_start sub_0202A0B4
sub_0202A0B4: ; 0x0202A0B4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A104 ; =0xBEEFCAFE
	add r6, r2, #0
	cmp r1, r0
	beq _0202A0C8
	bl GF_AssertFail
_0202A0C8:
	add r0, r4, #0
	bl DexSpeciesIsInvalid
	cmp r0, #0
	beq _0202A0D8
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_0202A0D8:
	sub r0, r4, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	add r3, r2, #0
	asr r2, r2, #3
	add r2, r5, r2
	mov r0, #7
	add r2, #0x44
	mov r1, #1
	and r3, r0
	ldrb r2, [r2]
	lsl r1, r3
	tst r1, r2
	beq _0202A100
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl sub_02029C04
	pop {r4, r5, r6, pc}
_0202A100:
	sub r0, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202A104: .word 0xBEEFCAFE
	thumb_func_end sub_0202A0B4

	thumb_func_start sub_0202A108
sub_0202A108: ; 0x0202A108
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A148 ; =0xBEEFCAFE
	add r6, r2, #0
	cmp r1, r0
	beq _0202A11C
	bl GF_AssertFail
_0202A11C:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02029558
	cmp r0, r4
	bgt _0202A12E
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
_0202A12E:
	cmp r6, #0
	beq _0202A13C
	mov r0, #0x4a
	add r1, r5, r4
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
_0202A13C:
	mov r0, #0x43
	add r1, r5, r4
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
	nop
_0202A148: .word 0xBEEFCAFE
	thumb_func_end sub_0202A108

	thumb_func_start sub_0202A14C
sub_0202A14C: ; 0x0202A14C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A168 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A15E
	bl GF_AssertFail
_0202A15E:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02029558
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202A168: .word 0xBEEFCAFE
	thumb_func_end sub_0202A14C

	thumb_func_start sub_0202A16C
sub_0202A16C: ; 0x0202A16C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A19C ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A17E
	bl GF_AssertFail
_0202A17E:
	ldr r1, _0202A1A0 ; =0x000001A6
	add r0, r5, #0
	bl sub_020295D4
	cmp r0, r4
	bgt _0202A190
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_0202A190:
	ldr r1, _0202A1A0 ; =0x000001A6
	add r0, r5, #0
	add r2, r4, #0
	bl sub_02029C7C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202A19C: .word 0xBEEFCAFE
_0202A1A0: .word 0x000001A6
	thumb_func_end sub_0202A16C

	thumb_func_start sub_0202A1A4
sub_0202A1A4: ; 0x0202A1A4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0202A1C0 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A1B4
	bl GF_AssertFail
_0202A1B4:
	ldr r1, _0202A1C4 ; =0x000001A6
	add r0, r4, #0
	bl sub_020295D4
	pop {r4, pc}
	nop
_0202A1C0: .word 0xBEEFCAFE
_0202A1C4: .word 0x000001A6
	thumb_func_end sub_0202A1A4

	thumb_func_start sub_0202A1C8
sub_0202A1C8: ; 0x0202A1C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A1F8 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A1DA
	bl GF_AssertFail
_0202A1DA:
	ldr r1, _0202A1FC ; =0x000001A7
	add r0, r5, #0
	bl sub_020295D4
	cmp r0, r4
	bgt _0202A1EC
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_0202A1EC:
	ldr r1, _0202A1FC ; =0x000001A7
	add r0, r5, #0
	add r2, r4, #0
	bl sub_02029C7C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202A1F8: .word 0xBEEFCAFE
_0202A1FC: .word 0x000001A7
	thumb_func_end sub_0202A1C8

	thumb_func_start sub_0202A200
sub_0202A200: ; 0x0202A200
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0202A21C ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A210
	bl GF_AssertFail
_0202A210:
	ldr r1, _0202A220 ; =0x000001A7
	add r0, r4, #0
	bl sub_020295D4
	pop {r4, pc}
	nop
_0202A21C: .word 0xBEEFCAFE
_0202A220: .word 0x000001A7
	thumb_func_end sub_0202A200

	thumb_func_start sub_0202A224
sub_0202A224: ; 0x0202A224
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A258 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A236
	bl GF_AssertFail
_0202A236:
	mov r1, #0x67
	add r0, r5, #0
	lsl r1, r1, #2
	bl sub_02029790
	cmp r0, r4
	bgt _0202A24A
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_0202A24A:
	mov r1, #0x67
	add r0, r5, #0
	lsl r1, r1, #2
	add r2, r4, #0
	bl sub_02029D0C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202A258: .word 0xBEEFCAFE
	thumb_func_end sub_0202A224

	thumb_func_start sub_0202A25C
sub_0202A25C: ; 0x0202A25C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0202A278 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A26C
	bl GF_AssertFail
_0202A26C:
	mov r1, #0x67
	add r0, r4, #0
	lsl r1, r1, #2
	bl sub_02029790
	pop {r4, pc}
	.balign 4, 0
_0202A278: .word 0xBEEFCAFE
	thumb_func_end sub_0202A25C

	thumb_func_start sub_0202A27C
sub_0202A27C: ; 0x0202A27C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A2AC ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A28E
	bl GF_AssertFail
_0202A28E:
	ldr r1, _0202A2B0 ; =0x0000019D
	add r0, r5, #0
	bl sub_02029790
	cmp r0, r4
	bgt _0202A2A0
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_0202A2A0:
	ldr r1, _0202A2B0 ; =0x0000019D
	add r0, r5, #0
	add r2, r4, #0
	bl sub_02029D0C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202A2AC: .word 0xBEEFCAFE
_0202A2B0: .word 0x0000019D
	thumb_func_end sub_0202A27C

	thumb_func_start sub_0202A2B4
sub_0202A2B4: ; 0x0202A2B4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0202A2D0 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A2C4
	bl GF_AssertFail
_0202A2C4:
	ldr r1, _0202A2D4 ; =0x0000019D
	add r0, r4, #0
	bl sub_02029790
	pop {r4, pc}
	nop
_0202A2D0: .word 0xBEEFCAFE
_0202A2D4: .word 0x0000019D
	thumb_func_end sub_0202A2B4

	thumb_func_start sub_0202A2D8
sub_0202A2D8: ; 0x0202A2D8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A308 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A2EA
	bl GF_AssertFail
_0202A2EA:
	add r0, r5, #0
	mov r1, #0xac
	bl sub_02029790
	cmp r0, r4
	bgt _0202A2FC
	mov r0, #0
	mvn r0, r0
	pop {r3, r4, r5, pc}
_0202A2FC:
	add r0, r5, #0
	mov r1, #0xac
	add r2, r4, #0
	bl sub_02029D0C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202A308: .word 0xBEEFCAFE
	thumb_func_end sub_0202A2D8

	thumb_func_start sub_0202A30C
sub_0202A30C: ; 0x0202A30C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0202A328 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A31C
	bl GF_AssertFail
_0202A31C:
	add r0, r4, #0
	mov r1, #0xac
	bl sub_02029790
	pop {r4, pc}
	nop
_0202A328: .word 0xBEEFCAFE
	thumb_func_end sub_0202A30C

	thumb_func_start sub_0202A32C
sub_0202A32C: ; 0x0202A32C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A34C ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A33E
	bl GF_AssertFail
_0202A33E:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_0202991C
	pop {r3, r4, r5, pc}
	nop
_0202A34C: .word 0xBEEFCAFE
	thumb_func_end sub_0202A32C

	thumb_func_start sub_0202A350
sub_0202A350: ; 0x0202A350
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0202A368 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A360
	bl GF_AssertFail
_0202A360:
	add r0, r4, #0
	bl sub_02029948
	pop {r4, pc}
	.balign 4, 0
_0202A368: .word 0xBEEFCAFE
	thumb_func_end sub_0202A350

	thumb_func_start sub_0202A36C
sub_0202A36C: ; 0x0202A36C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	str r1, [sp]
	add r0, r1, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r1, #0
	ldr r0, [sp]
	add r2, r1, #0
	bl GetMonData
	str r0, [sp, #4]
	ldr r0, [sp]
	bl GetMonGender
	add r6, r0, #0
	ldr r1, [r5]
	ldr r0, _0202A42C ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A3A2
	bl GF_AssertFail
_0202A3A2:
	add r0, r4, #0
	bl DexSpeciesIsInvalid
	cmp r0, #0
	bne _0202A426
	sub r0, r4, #1
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	mov r1, #1
	mov r0, #7
	add r2, r7, #0
	and r2, r0
	add r0, r1, #0
	asr r3, r7, #3
	lsl r0, r2
	add r2, r5, r3
	add r2, #0x44
	ldrb r2, [r2]
	tst r2, r0
	bne _0202A3E6
	ldr r1, _0202A430 ; =0x00000147
	cmp r4, r1
	bne _0202A3D6
	ldr r0, [sp, #4]
	sub r1, #0x43
	str r0, [r5, r1]
_0202A3D6:
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #0
	add r3, r4, #0
	bl sub_0202949C
	b _0202A408
_0202A3E6:
	add r2, r5, r3
	add r2, #0x84
	ldrb r2, [r2]
	tst r0, r2
	bne _0202A3F2
	mov r1, #0
_0202A3F2:
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	cmp r0, r6
	beq _0202A408
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #1
	add r3, r4, #0
	bl sub_0202949C
_0202A408:
	ldr r2, [sp]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02029AF0
	mov r1, #7
	add r5, #0x44
	asr r0, r7, #3
	ldrb r3, [r5, r0]
	mov r2, #1
	and r1, r7
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	strb r1, [r5, r0]
_0202A426:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202A42C: .word 0xBEEFCAFE
_0202A430: .word 0x00000147
	thumb_func_end sub_0202A36C

	thumb_func_start Pokedex_SetMonCaughtFlag
Pokedex_SetMonCaughtFlag: ; 0x0202A434
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r5, r0, #0
	add r0, r7, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r7, #0
	mov r1, #0xc
	mov r2, #0
	bl GetMonData
	mov r1, #0
	str r0, [sp, #4]
	add r0, r7, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [sp]
	add r0, r7, #0
	bl GetMonGender
	add r6, r0, #0
	ldr r1, [r5]
	ldr r0, _0202A534 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A476
	bl GF_AssertFail
_0202A476:
	add r0, r4, #0
	bl DexSpeciesIsInvalid
	cmp r0, #0
	bne _0202A530
	sub r0, r4, #1
	lsl r0, r0, #0x10
	lsr r3, r0, #0x10
	mov r2, #1
	mov r0, #7
	and r0, r3
	add r1, r2, #0
	lsl r1, r0
	asr r0, r3, #3
	add r3, r5, r0
	add r3, #0x44
	ldrb r3, [r3]
	tst r3, r1
	bne _0202A4B8
	ldr r1, _0202A538 ; =0x00000147
	cmp r4, r1
	bne _0202A4A8
	ldr r0, [sp]
	sub r1, #0x43
	str r0, [r5, r1]
_0202A4A8:
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #0
	add r3, r4, #0
	bl sub_0202949C
	b _0202A4DA
_0202A4B8:
	add r0, r5, r0
	add r0, #0x84
	ldrb r0, [r0]
	tst r0, r1
	bne _0202A4C4
	mov r2, #0
_0202A4C4:
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	cmp r0, r6
	beq _0202A4DA
	lsl r1, r6, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	mov r2, #1
	add r3, r4, #0
	bl sub_0202949C
_0202A4DA:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r7, #0
	bl sub_02029AF0
	cmp r4, #0xc9
	bne _0202A4F8
	add r0, r7, #0
	bl GetMonUnownLetter
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #1
	bl sub_020295A0
_0202A4F8:
	ldr r2, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02029BE0
	ldr r0, [sp, #4]
	cmp r0, #2
	beq _0202A50E
	add r0, r5, #0
	bl sub_0202A5DC
_0202A50E:
	sub r0, r4, #1
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r1, r5, #4
	asr r0, r6, #3
	mov r2, #7
	ldrb r4, [r1, r0]
	mov r3, #1
	and r2, r6
	lsl r3, r2
	add r2, r4, #0
	orr r2, r3
	add r5, #0x44
	strb r2, [r1, r0]
	ldrb r1, [r5, r0]
	orr r1, r3
	strb r1, [r5, r0]
_0202A530:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202A534: .word 0xBEEFCAFE
_0202A538: .word 0x00000147
	thumb_func_end Pokedex_SetMonCaughtFlag

	thumb_func_start sub_0202A53C
sub_0202A53C: ; 0x0202A53C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0202A554 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A54C
	bl GF_AssertFail
_0202A54C:
	ldr r0, _0202A558 ; =0x00000337
	mov r1, #1
	strb r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_0202A554: .word 0xBEEFCAFE
_0202A558: .word 0x00000337
	thumb_func_end sub_0202A53C

	thumb_func_start Pokedex_GetNatDexFlag
Pokedex_GetNatDexFlag: ; 0x0202A55C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0202A574 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A56C
	bl GF_AssertFail
_0202A56C:
	ldr r0, _0202A578 ; =0x00000337
	ldrb r0, [r4, r0]
	pop {r4, pc}
	nop
_0202A574: .word 0xBEEFCAFE
_0202A578: .word 0x00000337
	thumb_func_end Pokedex_GetNatDexFlag

	thumb_func_start sub_0202A57C
sub_0202A57C: ; 0x0202A57C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0202A598 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A58C
	bl GF_AssertFail
_0202A58C:
	mov r0, #0xcd
	mov r1, #1
	lsl r0, r0, #2
	strb r1, [r4, r0]
	pop {r4, pc}
	nop
_0202A598: .word 0xBEEFCAFE
	thumb_func_end sub_0202A57C

	thumb_func_start sub_0202A59C
sub_0202A59C: ; 0x0202A59C
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	cmp r6, #8
	bls _0202A5AC
	bl GF_AssertFail
_0202A5AC:
	ldr r1, [r5]
	ldr r0, _0202A5D8 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A5B8
	bl GF_AssertFail
_0202A5B8:
	add r0, r6, #0
	bl sub_02091278
	mov r2, #1
	add r3, r2, #0
	lsl r3, r0
	mov r0, #0x51
	add r1, r5, r4
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	tst r0, r3
	beq _0202A5D4
	add r0, r2, #0
	pop {r4, r5, r6, pc}
_0202A5D4:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202A5D8: .word 0xBEEFCAFE
	thumb_func_end sub_0202A59C

	thumb_func_start sub_0202A5DC
sub_0202A5DC: ; 0x0202A5DC
	ldr r1, _0202A5E4 ; =0x00000335
	mov r2, #1
	strb r2, [r0, r1]
	bx lr
	.balign 4, 0
_0202A5E4: .word 0x00000335
	thumb_func_end sub_0202A5DC

	thumb_func_start sub_0202A5E8
sub_0202A5E8: ; 0x0202A5E8
	ldr r1, _0202A5F0 ; =0x00000335
	ldrb r0, [r0, r1]
	bx lr
	nop
_0202A5F0: .word 0x00000335
	thumb_func_end sub_0202A5E8

	thumb_func_start sub_0202A5F4
sub_0202A5F4: ; 0x0202A5F4
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0202A60C ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A604
	bl GF_AssertFail
_0202A604:
	ldr r0, _0202A610 ; =0x00000336
	ldrb r0, [r4, r0]
	pop {r4, pc}
	nop
_0202A60C: .word 0xBEEFCAFE
_0202A610: .word 0x00000336
	thumb_func_end sub_0202A5F4

	thumb_func_start sub_0202A614
sub_0202A614: ; 0x0202A614
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _0202A62C ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A624
	bl GF_AssertFail
_0202A624:
	ldr r0, _0202A630 ; =0x00000336
	mov r1, #1
	strb r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_0202A62C: .word 0xBEEFCAFE
_0202A630: .word 0x00000336
	thumb_func_end sub_0202A614

	thumb_func_start Sav2_Pokedex_get
Sav2_Pokedex_get: ; 0x0202A634
	ldr r3, _0202A63C ; =SavArray_get
	mov r1, #6
	bx r3
	nop
_0202A63C: .word SavArray_get
	thumb_func_end Sav2_Pokedex_get

	thumb_func_start sub_0202A640
sub_0202A640: ; 0x0202A640
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	ldr r1, [r6]
	ldr r0, _0202A78C ; =0xBEEFCAFE
	add r4, r2, #0
	cmp r1, r0
	beq _0202A654
	bl GF_AssertFail
_0202A654:
	ldr r1, _0202A790 ; =0x000001A6
	cmp r5, r1
	bgt _0202A698
	bge _0202A6E0
	cmp r5, #0xc9
	bgt _0202A668
	bge _0202A6C8
	cmp r5, #0xac
	beq _0202A730
	b _0202A788
_0202A668:
	add r0, r1, #0
	sub r0, #0x24
	cmp r5, r0
	bgt _0202A678
	sub r1, #0x24
	cmp r5, r1
	beq _0202A744
	b _0202A788
_0202A678:
	add r0, r1, #0
	sub r0, #9
	cmp r5, r0
	bgt _0202A696
	add r0, r1, #0
	sub r0, #0xa
	cmp r5, r0
	blt _0202A788
	add r0, r1, #0
	sub r0, #0xa
	cmp r5, r0
	beq _0202A708
	sub r1, #9
	cmp r5, r1
	beq _0202A71C
_0202A696:
	b _0202A788
_0202A698:
	add r0, r1, #0
	add r0, #0x39
	cmp r5, r0
	bgt _0202A6B0
	add r0, r1, #0
	add r0, #0x39
	cmp r5, r0
	bge _0202A770
	add r0, r1, #1
	cmp r5, r0
	beq _0202A6F4
	b _0202A788
_0202A6B0:
	add r0, r1, #0
	add r0, #0x41
	cmp r5, r0
	bgt _0202A6C0
	add r1, #0x41
	cmp r5, r1
	beq _0202A758
	b _0202A788
_0202A6C0:
	add r1, #0x46
	cmp r5, r1
	beq _0202A758
	b _0202A788
_0202A6C8:
	add r0, r6, #0
	mov r1, #0
	bl sub_0202A14C
	cmp r4, r0
	bhs _0202A788
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #0
	bl sub_0202A108
	pop {r4, r5, r6, pc}
_0202A6E0:
	add r0, r6, #0
	bl sub_0202A1A4
	cmp r4, r0
	bhs _0202A788
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202A16C
	pop {r4, r5, r6, pc}
_0202A6F4:
	add r0, r6, #0
	bl sub_0202A200
	cmp r4, r0
	bhs _0202A788
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202A1C8
	pop {r4, r5, r6, pc}
_0202A708:
	add r0, r6, #0
	bl sub_0202A25C
	cmp r4, r0
	bhs _0202A788
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202A224
	pop {r4, r5, r6, pc}
_0202A71C:
	add r0, r6, #0
	bl sub_0202A2B4
	cmp r4, r0
	bhs _0202A788
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202A27C
	pop {r4, r5, r6, pc}
_0202A730:
	add r0, r6, #0
	bl sub_0202A30C
	cmp r4, r0
	bhs _0202A788
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202A2D8
	pop {r4, r5, r6, pc}
_0202A744:
	add r0, r6, #0
	bl sub_0202A350
	cmp r4, r0
	bhs _0202A788
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0202A32C
	pop {r4, r5, r6, pc}
_0202A758:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020295D4
	cmp r4, r0
	bge _0202A788
	add r0, r6, #0
	add r1, r5, #0
	add r2, r4, #0
	bl sub_02029C7C
	pop {r4, r5, r6, pc}
_0202A770:
	add r0, r6, #0
	add r1, #0x39
	bl sub_020299E8
	cmp r4, r0
	bge _0202A788
	ldr r1, _0202A794 ; =0x000001DF
	add r0, r6, #0
	add r2, r4, #0
	bl sub_02029CDC
	pop {r4, r5, r6, pc}
_0202A788:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202A78C: .word 0xBEEFCAFE
_0202A790: .word 0x000001A6
_0202A794: .word 0x000001DF
	thumb_func_end sub_0202A640

	thumb_func_start sub_0202A798
sub_0202A798: ; 0x0202A798
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, _0202A880 ; =0xBEEFCAFE
	cmp r1, r0
	beq _0202A7AA
	bl GF_AssertFail
_0202A7AA:
	ldr r1, _0202A884 ; =0x000001A6
	cmp r4, r1
	bgt _0202A7EE
	bge _0202A82C
	cmp r4, #0xc9
	bgt _0202A7BE
	bge _0202A822
	cmp r4, #0xac
	beq _0202A84C
	b _0202A87A
_0202A7BE:
	add r0, r1, #0
	sub r0, #0x24
	cmp r4, r0
	bgt _0202A7CE
	sub r1, #0x24
	cmp r4, r1
	beq _0202A854
	b _0202A87A
_0202A7CE:
	add r0, r1, #0
	sub r0, #9
	cmp r4, r0
	bgt _0202A87A
	add r0, r1, #0
	sub r0, #0xa
	cmp r4, r0
	blt _0202A87A
	add r0, r1, #0
	sub r0, #0xa
	cmp r4, r0
	beq _0202A83C
	sub r1, #9
	cmp r4, r1
	beq _0202A844
	b _0202A87A
_0202A7EE:
	add r0, r1, #0
	add r0, #0x39
	cmp r4, r0
	bgt _0202A806
	add r0, r1, #0
	add r0, #0x39
	cmp r4, r0
	bge _0202A870
	add r0, r1, #1
	cmp r4, r0
	beq _0202A834
	b _0202A87A
_0202A806:
	add r0, r1, #0
	add r0, #0x41
	cmp r4, r0
	bgt _0202A818
	add r0, r1, #0
	add r0, #0x41
	cmp r4, r0
	beq _0202A866
	b _0202A87A
_0202A818:
	add r0, r1, #0
	add r0, #0x46
	cmp r4, r0
	beq _0202A85C
	b _0202A87A
_0202A822:
	add r0, r5, #0
	mov r1, #0
	bl sub_0202A14C
	pop {r3, r4, r5, pc}
_0202A82C:
	add r0, r5, #0
	bl sub_0202A1A4
	pop {r3, r4, r5, pc}
_0202A834:
	add r0, r5, #0
	bl sub_0202A200
	pop {r3, r4, r5, pc}
_0202A83C:
	add r0, r5, #0
	bl sub_0202A25C
	pop {r3, r4, r5, pc}
_0202A844:
	add r0, r5, #0
	bl sub_0202A2B4
	pop {r3, r4, r5, pc}
_0202A84C:
	add r0, r5, #0
	bl sub_0202A30C
	pop {r3, r4, r5, pc}
_0202A854:
	add r0, r5, #0
	bl sub_0202A350
	pop {r3, r4, r5, pc}
_0202A85C:
	add r0, r5, #0
	add r1, #0x46
	bl sub_020295D4
	pop {r3, r4, r5, pc}
_0202A866:
	add r0, r5, #0
	add r1, #0x41
	bl sub_020295D4
	pop {r3, r4, r5, pc}
_0202A870:
	add r0, r5, #0
	add r1, #0x39
	bl sub_020299E8
	pop {r3, r4, r5, pc}
_0202A87A:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0202A880: .word 0xBEEFCAFE
_0202A884: .word 0x000001A6
	thumb_func_end sub_0202A798
