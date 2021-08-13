	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov13_0221BA00
ov13_0221BA00: ; 0x0221BA00
	push {r3, r4, r5, r6, r7, lr}
	mov r5, #0
	str r0, [sp]
	mov r4, #0x7f
	mov r6, #1
	add r7, r5, #0
_0221BA0C:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020C7F74
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020C7F8C
	add r0, r5, #0
	add r1, r7, #0
	bl sub_020C7FAC
	add r5, r5, #1
	cmp r5, #0x20
	blt _0221BA0C
	bl sub_02034D8C
	bl sub_020D33C0
	bl sub_020D365C
	bl sub_020D3A38
	add r5, r0, #0
	mov r0, #2
	bl ov00_021EC454
	mov r1, #1
	ldr r0, [sp]
	lsl r1, r1, #0x12
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #1
	mov r2, #0
	bl ov13_0222B430
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl sub_020D3A4C
	ldr r1, _0221BA6C ; =0x04000208
	ldrh r0, [r1]
	mov r0, #1
	strh r0, [r1]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221BA6C: .word 0x04000208
	thumb_func_end ov13_0221BA00
