	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D2194:
	.space 0x4

	.text

	thumb_func_start sub_0202055C
sub_0202055C: ; 0x0202055C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _020205A8 ; =_021D2194
	add r4, r1, #0
	ldr r0, [r0]
	cmp r0, #0
	beq _0202056E
	bl GF_AssertFail
_0202056E:
	add r0, r4, #0
	mov r1, #0xc
	bl AllocFromHeap
	ldr r1, _020205A8 ; =_021D2194
	cmp r0, #0
	str r0, [r1]
	bne _02020582
	bl GF_AssertFail
_02020582:
	add r0, r4, #0
	lsl r1, r5, #4
	bl AllocFromHeap
	ldr r1, _020205A8 ; =_021D2194
	ldr r2, [r1]
	str r0, [r2, #8]
	ldr r0, [r1]
	mov r2, #0
	str r5, [r0]
	ldr r0, [r1]
	str r2, [r0, #4]
	ldr r1, [r1]
	ldr r0, [r1, #8]
	ldr r1, [r1]
	bl NNS_GfdInitVramTransferManager
	pop {r3, r4, r5, pc}
	nop
_020205A8: .word _021D2194
	thumb_func_end sub_0202055C

	thumb_func_start sub_020205AC
sub_020205AC: ; 0x020205AC
	push {r3, lr}
	ldr r0, _020205D4 ; =_021D2194
	ldr r0, [r0]
	cmp r0, #0
	bne _020205BA
	bl GF_AssertFail
_020205BA:
	ldr r0, _020205D4 ; =_021D2194
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bl FreeToHeap
	ldr r0, _020205D4 ; =_021D2194
	ldr r0, [r0]
	bl FreeToHeap
	ldr r0, _020205D4 ; =_021D2194
	mov r1, #0
	str r1, [r0]
	pop {r3, pc}
	.balign 4, 0
_020205D4: .word _021D2194
	thumb_func_end sub_020205AC

	thumb_func_start sub_020205D8
sub_020205D8: ; 0x020205D8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02020618 ; =_021D2194
	add r4, r1, #0
	ldr r0, [r0]
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	bne _020205EE
	bl GF_AssertFail
_020205EE:
	ldr r1, _02020618 ; =_021D2194
	ldr r0, [r1]
	ldr r2, [r0, #4]
	add r2, r2, #1
	str r2, [r0, #4]
	ldr r0, [r1]
	ldr r1, [r0, #4]
	ldr r0, [r0]
	cmp r1, r0
	blo _0202060A
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202060A:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl NNS_GfdRegisterNewVramTransferTask
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02020618: .word _021D2194
	thumb_func_end sub_020205D8

	thumb_func_start sub_0202061C
sub_0202061C: ; 0x0202061C
	push {r3, lr}
	ldr r0, _02020634 ; =_021D2194
	ldr r0, [r0]
	cmp r0, #0
	beq _02020632
	bl NNS_GfdDoVramTransfer
	ldr r0, _02020634 ; =_021D2194
	mov r1, #0
	ldr r0, [r0]
	str r1, [r0, #4]
_02020632:
	pop {r3, pc}
	.balign 4, 0
_02020634: .word _021D2194
	thumb_func_end sub_0202061C

	thumb_func_start sub_02020638
sub_02020638: ; 0x02020638
	push {r3, lr}
	ldr r0, _02020650 ; =_021D2194
	ldr r0, [r0]
	cmp r0, #0
	bne _02020646
	bl GF_AssertFail
_02020646:
	ldr r0, _02020650 ; =_021D2194
	ldr r0, [r0]
	ldr r0, [r0, #4]
	pop {r3, pc}
	nop
_02020650: .word _021D2194
	thumb_func_end sub_02020638
