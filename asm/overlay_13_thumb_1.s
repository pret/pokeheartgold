	.include "asm/macros.inc"
	.include "overlay_13_thumb_1.inc"
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
	bl NNS_SndPlayerSetPlayerVolume
	add r0, r5, #0
	add r1, r6, #0
	bl NNS_SndPlayerSetPlayableSeqCount
	add r0, r5, #0
	add r1, r7, #0
	bl NNS_SndPlayerSetAllocatableChannel
	add r5, r5, #1
	cmp r5, #0x20
	blt _0221BA0C
	bl sub_02034D8C
	bl OS_InitTick
	bl OS_InitAlarm
	bl OS_DisableInterrupts
	add r5, r0, #0
	mov r0, #2
	bl ov00_021EC454
	mov r1, #1
	ldr r0, [sp]
	lsl r1, r1, #0x12
	bl Heap_Alloc
	add r4, r0, #0
	mov r1, #1
	mov r2, #0
	bl ov13_0222B430
	add r0, r4, #0
	bl Heap_Free
	add r0, r5, #0
	bl OS_RestoreInterrupts
	ldr r1, _0221BA6C ; =0x04000208
	ldrh r0, [r1]
	mov r0, #1
	strh r0, [r1]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221BA6C: .word 0x04000208
	thumb_func_end ov13_0221BA00
