	.include "asm/macros.inc"
	.include "overlay_80_022384D8.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_022384D8
ov80_022384D8: ; 0x022384D8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x65
	mov r1, #8
	bl Heap_Alloc
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl ov80_022384FC
	str r0, [r4, #4]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_022384D8

	thumb_func_start ov80_022384FC
ov80_022384FC: ; 0x022384FC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x65
	mov r1, #0xc
	bl Heap_Alloc
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	str r5, [r4, #4]
	mov r0, #0
	strh r0, [r4, #8]
	ldr r0, _02238528 ; =ov80_02238530
	ldr r2, _0223852C ; =0x0001368C
	add r1, r4, #0
	bl SysTask_CreateOnMainQueue
	str r0, [r4]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02238528: .word ov80_02238530
_0223852C: .word 0x0001368C
	thumb_func_end ov80_022384FC

	thumb_func_start ov80_02238530
ov80_02238530: ; 0x02238530
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r1, #0
	ldrh r0, [r4, #0xa]
	cmp r0, #2
	bhs _02238544
	add r0, r0, #1
	add sp, #0x14
	strh r0, [r4, #0xa]
	pop {r3, r4, pc}
_02238544:
	mov r0, #0
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	mov r0, #1
	eor r0, r1
	strh r0, [r4, #8]
	ldrh r1, [r4, #8]
	add r0, sp, #0xc
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl ov80_0223857C
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	mov r1, #3
	add r2, sp, #0xc
	mov r3, #0xe
	bl LoadRectToBgTilemapRect
	ldr r0, [r4, #4]
	mov r1, #3
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end ov80_02238530

	thumb_func_start ov80_0223857C
ov80_0223857C: ; 0x0223857C
	push {r4, r5, r6, r7}
	cmp r1, #0
	bne _02238586
	mov r6, #0xc
	b _02238588
_02238586:
	mov r6, #0xe
_02238588:
	mov r1, #0
	mov r3, #0x60
	add r4, r1, #0
_0223858E:
	lsl r5, r4, #1
	mov r2, #0
	add r5, r0, r5
_02238594:
	add r7, r6, r2
	add r7, r3, r7
	strh r7, [r5]
	add r2, r2, #1
	add r5, r5, #2
	cmp r2, #2
	blo _02238594
	add r1, r1, #1
	add r3, #0x10
	add r4, r4, #2
	cmp r1, #2
	blo _0223858E
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end ov80_0223857C

	thumb_func_start ov80_022385B0
ov80_022385B0: ; 0x022385B0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl ov80_022385C4
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_022385B0

	thumb_func_start ov80_022385C4
ov80_022385C4: ; 0x022385C4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl SysTask_Destroy
	add r0, r4, #0
	bl Heap_Free
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_022385C4

	thumb_func_start ov80_022385D8
ov80_022385D8: ; 0x022385D8
	cmp r0, #6
	bhi _0223860C
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022385E8: ; jump table
	.short _0223860C - _022385E8 - 2 ; case 0
	.short _0223860A - _022385E8 - 2 ; case 1
	.short _022385F6 - _022385E8 - 2 ; case 2
	.short _022385FA - _022385E8 - 2 ; case 3
	.short _022385FE - _022385E8 - 2 ; case 4
	.short _02238602 - _022385E8 - 2 ; case 5
	.short _02238606 - _022385E8 - 2 ; case 6
_022385F6:
	mov r0, #0x73
	bx lr
_022385FA:
	mov r0, #0x77
	bx lr
_022385FE:
	mov r0, #0x87
	bx lr
_02238602:
	mov r0, #0x7b
	bx lr
_02238606:
	mov r0, #0x8f
	bx lr
_0223860A:
	mov r0, #0x71
_0223860C:
	bx lr
	.balign 4, 0
	thumb_func_end ov80_022385D8

	thumb_func_start ov80_02238610
ov80_02238610: ; 0x02238610
	cmp r0, #6
	bhi _02238644
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02238620: ; jump table
	.short _02238644 - _02238620 - 2 ; case 0
	.short _02238642 - _02238620 - 2 ; case 1
	.short _0223862E - _02238620 - 2 ; case 2
	.short _02238632 - _02238620 - 2 ; case 3
	.short _02238636 - _02238620 - 2 ; case 4
	.short _0223863A - _02238620 - 2 ; case 5
	.short _0223863E - _02238620 - 2 ; case 6
_0223862E:
	mov r0, #0x66
	bx lr
_02238632:
	mov r0, #0x68
	bx lr
_02238636:
	mov r0, #0x6c
	bx lr
_0223863A:
	mov r0, #0x6a
	bx lr
_0223863E:
	mov r0, #0x6e
	bx lr
_02238642:
	mov r0, #0x64
_02238644:
	bx lr
	.balign 4, 0
	thumb_func_end ov80_02238610
