	.include "asm/macros.inc"
	.include "unk_020551B8.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020551B8
sub_020551B8: ; 0x020551B8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _020551D6
	cmp r0, #1
	beq _020551FC
	b _02055212
_020551D6:
	ldr r0, [r4, #8]
	bl ov01_021EFB64
	ldr r0, [r4, #8]
	add r1, r5, #0
	add r2, r4, #4
	bl ov01_021EFC94
	ldr r1, [r4, #0xc]
	mov r0, #5
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	mov r2, #1
	bl sub_02004EC4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02055212
_020551FC:
	ldr r0, [r4, #4]
	cmp r0, #1
	bne _02055212
	ldr r0, [r4, #8]
	bl ov01_021EFC04
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_02055212:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020551B8

	thumb_func_start sub_02055218
sub_02055218: ; 0x02055218
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0x10
	add r4, r2, #0
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r5, [r2, #8]
	ldr r1, _02055240 ; =sub_020551B8
	add r0, r6, #0
	str r4, [r2, #0xc]
	bl TaskManager_Call
	pop {r4, r5, r6, pc}
	nop
_02055240: .word sub_020551B8
	thumb_func_end sub_02055218
