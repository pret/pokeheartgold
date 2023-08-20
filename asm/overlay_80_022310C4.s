	.include "asm/macros.inc"
	.include "overlay_80_022310C4.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_022310C4
ov80_022310C4: ; 0x022310C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	str r0, [sp, #4]
	ldr r1, _022313A0 ; =0x00000D98
	mov r0, #0xb
	add r6, r2, #0
	str r3, [sp, #8]
	bl AllocFromHeap
	ldr r1, _022313A4 ; =ov80_0223DD44
	ldr r2, _022313A0 ; =0x00000D98
	str r0, [r1]
	mov r1, #0
	bl MI_CpuFill8
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r4, [r0]
	ldr r0, [sp, #4]
	bl sub_02030B04
	ldr r1, _022313A8 ; =0x000006F8
	str r0, [r4, r1]
	ldr r0, [sp, #4]
	add r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0xb
	ldr r1, _022313A4 ; =ov80_0223DD44
	str r0, [r4]
	ldr r4, [r1]
	bl SaveArray_Party_Alloc
	mov r1, #0x99
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xb
	bl AllocMonZeroed
	ldr r1, _022313AC ; =0x00000D8C
	str r0, [r4, r1]
	ldr r0, _022313A8 ; =0x000006F8
	ldr r4, [r4, r0]
	ldr r0, [sp, #4]
	bl sub_02030C5C
	str r0, [sp, #0xc]
	cmp r5, #0
	bne _022311E0
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r0, [r0]
	strb r6, [r0, #4]
	ldrb r0, [r0, #4]
	bl ov80_0223787C
	add r6, r0, #0
	ldr r0, _022313A4 ; =ov80_0223DD44
	mov r1, #0
	ldr r0, [r0]
	strb r1, [r0, #5]
	add r0, r4, #0
	bl sub_02030AF8
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r1, [r0]
	ldrb r2, [r1, #4]
	cmp r2, #3
	bne _02231158
	ldr r0, _022313B0 ; =0x000006FC
	ldr r0, [r1, r0]
	bl Save_VarsFlags_Get
	bl Save_VarsFlags_GetVar4052
	b _02231164
_02231158:
	ldr r0, [sp, #0xc]
	mov r3, #0
	mov r1, #5
	str r3, [sp]
	bl sub_02030CA0
_02231164:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bne _022311A6
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r1, [r0]
	ldr r0, _022313B0 ; =0x000006FC
	ldr r0, [r1, r0]
	bl sub_0203107C
	add r4, r0, #0
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_0205C0CC
	add r5, r0, #0
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_0205C0CC
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020310BC
	ldr r1, _022313A4 ; =ov80_0223DD44
	ldr r1, [r1]
	strh r0, [r1, #8]
	b _022311CA
_022311A6:
	ldr r5, _022313A4 ; =ov80_0223DD44
	mov r4, #0
	ldr r0, [r5]
	ldr r7, _022313B0 ; =0x000006FC
	strh r4, [r0, #8]
_022311B0:
	ldr r1, [r5]
	lsl r2, r4, #0x18
	ldr r0, [r1, r7]
	ldrb r1, [r1, #4]
	lsr r2, r2, #0x18
	mov r3, #0
	bl ov80_02231930
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x12
	blo _022311B0
_022311CA:
	ldr r0, _022313A4 ; =ov80_0223DD44
	mov r1, #0x26
	ldr r3, [r0]
	ldr r0, [sp, #8]
	lsl r1, r1, #4
	strb r0, [r3, r1]
	add r0, sp, #0x20
	ldrb r2, [r0, #0x10]
	add r0, r1, #1
	strb r2, [r3, r0]
	b _022312CA
_022311E0:
	ldr r0, _022313A4 ; =ov80_0223DD44
	mov r1, #0
	ldr r5, [r0]
	str r1, [sp]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl sub_02030B88
	strb r0, [r5, #4]
	ldrb r0, [r5, #4]
	bl ov80_0223787C
	mov r2, #0
	add r6, r0, #0
	ldr r0, _022313A4 ; =ov80_0223DD44
	str r2, [sp]
	ldr r5, [r0]
	add r0, r4, #0
	mov r1, #1
	add r3, r2, #0
	bl sub_02030B88
	strb r0, [r5, #5]
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r1, [r0]
	ldr r0, _022313B0 ; =0x000006FC
	ldr r0, [r1, r0]
	bl sub_0203107C
	add r7, r0, #0
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_0205C0CC
	str r0, [sp, #0x10]
	ldrb r0, [r5, #4]
	bl sub_0205C0CC
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #0x10]
	add r0, r7, #0
	bl sub_020310BC
	ldr r1, _022313A4 ; =ov80_0223DD44
	mov r5, #0
	ldr r1, [r1]
	cmp r6, #0
	strh r0, [r1, #8]
	ble _02231272
	add r7, r5, #0
_0223124C:
	lsl r2, r5, #0x18
	add r0, r4, #0
	mov r1, #3
	lsr r2, r2, #0x18
	add r3, r7, #0
	str r7, [sp]
	bl sub_02030B88
	ldr r1, _022313A4 ; =ov80_0223DD44
	ldr r1, [r1]
	add r2, r1, r5
	mov r1, #0x26
	lsl r1, r1, #4
	strb r0, [r2, r1]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, r6
	blt _0223124C
_02231272:
	mov r5, #0
	add r7, r5, #0
_02231276:
	lsl r2, r5, #0x18
	add r0, r4, #0
	mov r1, #2
	lsr r2, r2, #0x18
	add r3, r7, #0
	str r7, [sp]
	bl sub_02030B88
	ldr r1, _022313A4 ; =ov80_0223DD44
	ldr r2, [r1]
	lsl r1, r5, #1
	add r1, r2, r1
	strh r0, [r1, #0x18]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x14
	blo _02231276
	mov r5, #0
_0223129C:
	ldr r0, _022313A4 ; =ov80_0223DD44
	lsl r2, r5, #0x18
	ldr r7, [r0]
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #4
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030B88
	lsl r1, r5, #1
	lsl r0, r0, #0x18
	add r2, r7, r1
	mov r1, #0x9a
	lsr r0, r0, #0x18
	lsl r1, r1, #2
	strh r0, [r2, r1]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x14
	blo _0223129C
_022312CA:
	mov r5, #0
	cmp r6, #0
	ble _02231304
	ldr r7, _022313A4 ; =ov80_0223DD44
_022312D2:
	ldr r4, [r7]
	ldr r0, _022313B0 ; =0x000006FC
	ldr r0, [r4, r0]
	bl SaveArray_Party_Get
	mov r1, #0x26
	add r2, r4, r5
	lsl r1, r1, #4
	ldrb r1, [r2, r1]
	bl Party_GetMonByIndex
	ldr r4, [r7]
	mov r1, #6
	mov r2, #0
	bl GetMonData
	lsl r1, r5, #1
	add r2, r4, r1
	ldr r1, _022313B4 ; =0x00000728
	strh r0, [r2, r1]
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, r6
	blt _022312D2
_02231304:
	ldr r0, _022313A4 ; =ov80_0223DD44
	mov r1, #0xa
	ldr r4, [r0]
	mov r0, #0
	str r0, [r4, #0x10]
	ldrh r0, [r4, #8]
	bl _s32_div_f
	strh r0, [r4, #0xa]
	ldrb r0, [r4, #4]
	cmp r0, #2
	bne _0223133E
	ldr r4, _022313A4 ; =ov80_0223DD44
	ldr r6, _022313B8 ; =0x00000716
	mov r5, #0
	mov r7, #9
_02231324:
	ldr r1, [r4]
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	add r1, r1, r6
	add r2, r7, #0
	bl sub_02030BF4
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, #0x12
	blo _02231324
	b _0223137E
_0223133E:
	ldr r5, _022313A4 ; =ov80_0223DD44
	mov r4, #0
	add r7, sp, #0x14
_02231344:
	ldr r1, [r5]
	str r7, [sp]
	ldrb r1, [r1, #4]
	lsl r2, r4, #0x18
	add r3, sp, #0x14
	ldr r0, [sp, #4]
	lsr r2, r2, #0x18
	add r3, #2
	bl ov80_022318D0
	add r2, r0, #0
	lsl r0, r4, #0x18
	lsl r2, r2, #0x18
	ldr r1, [r5]
	ldr r3, _022313BC ; =0x00000704
	lsr r0, r0, #0x18
	add r6, r1, r3
	ldrb r3, [r1, #4]
	lsr r2, r2, #0x18
	lsl r1, r3, #3
	add r1, r3, r1
	add r1, r6, r1
	bl sub_02030BF4
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x12
	blo _02231344
_0223137E:
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl ov80_0223792C
	cmp r0, #1
	bne _02231398
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r1, [r0]
	ldr r0, _022313B0 ; =0x000006FC
	ldr r0, [r1, r0]
	bl ov80_0222A840
_02231398:
	ldr r0, _022313A4 ; =ov80_0223DD44
	ldr r0, [r0]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022313A0: .word 0x00000D98
_022313A4: .word ov80_0223DD44
_022313A8: .word 0x000006F8
_022313AC: .word 0x00000D8C
_022313B0: .word 0x000006FC
_022313B4: .word 0x00000728
_022313B8: .word 0x00000716
_022313BC: .word 0x00000704
	thumb_func_end ov80_022310C4

	thumb_func_start ov80_022313C0
ov80_022313C0: ; 0x022313C0
	ldr r3, _022313C4 ; =ov80_022313C8
	bx r3
	.balign 4, 0
_022313C4: .word ov80_022313C8
	thumb_func_end ov80_022313C0

	thumb_func_start ov80_022313C8
ov80_022313C8: ; 0x022313C8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldrb r2, [r5, #4]
	mov r4, #0
	mov r6, #1
	cmp r2, #0
	beq _022313DA
	mov r6, #2
_022313DA:
	ldr r1, _02231490 ; =0x000006F5
	lsl r3, r2, #3
	ldrb r0, [r5, r1]
	add r1, #0xf
	add r1, r5, r1
	add r2, r2, r3
	add r1, r1, r2
	bl sub_02030BD0
	add r7, r0, #0
	add r0, r5, #0
	bl ov80_02231A14
	strb r0, [r5, #7]
	add r0, r5, #0
	add r0, #0x18
	str r0, [sp]
	ldr r0, _02231490 ; =0x000006F5
	ldrb r3, [r5, #5]
	ldrb r0, [r5, r0]
	add r1, r6, #0
	add r2, r7, #0
	bl ov80_022372D8
	ldrb r0, [r5, #5]
	add r1, r6, #0
	add r3, r7, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x18
	str r0, [sp, #4]
	ldrb r0, [r5, #4]
	ldrh r2, [r5, #0xa]
	bl ov80_02237334
	ldrb r0, [r5, #5]
	add r6, r5, #0
	add r6, #0x18
	lsl r0, r0, #0x19
	lsr r0, r0, #0x17
	ldrh r1, [r6, r0]
	str r0, [sp, #0xc]
	ldr r0, _02231494 ; =0x0000FECD
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	cmp r0, #1
	bhi _02231444
	add r0, r5, #0
	bl ov80_0223793C
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
_02231444:
	ldr r0, [sp, #0xc]
	ldrh r1, [r6, r0]
	ldr r0, _02231498 ; =0x00000133
	cmp r1, r0
	bne _02231450
	mov r4, #1
_02231450:
	mov r0, #0x4d
	lsl r0, r0, #2
	cmp r1, r0
	bne _0223145A
	mov r4, #2
_0223145A:
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl Party_GetMonByIndex
	mov r1, #5
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0x9a
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldr r1, _0223149C ; =0x000006F4
	ldrb r3, [r5, #5]
	ldrb r1, [r5, r1]
	mov r0, #1
	add r2, r7, #0
	bl ov80_02237448
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02231490: .word 0x000006F5
_02231494: .word 0x0000FECD
_02231498: .word 0x00000133
_0223149C: .word 0x000006F4
	thumb_func_end ov80_022313C8

	thumb_func_start ov80_022314A0
ov80_022314A0: ; 0x022314A0
	push {r4, lr}
	add r4, r0, #0
	beq _022314D0
	mov r0, #0x99
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022314B4
	bl FreeToHeap
_022314B4:
	ldr r0, _022314D4 ; =0x00000D8C
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _022314C0
	bl FreeToHeap
_022314C0:
	ldr r2, _022314D8 ; =0x00000D98
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
_022314D0:
	pop {r4, pc}
	nop
_022314D4: .word 0x00000D8C
_022314D8: .word 0x00000D98
	thumb_func_end ov80_022314A0

	thumb_func_start ov80_022314DC
ov80_022314DC: ; 0x022314DC
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #0
	bl ov80_02231518
	ldr r1, _02231510 ; =0x000006F2
	strh r0, [r4, r1]
	ldrh r2, [r4, r1]
	add r0, r1, #3
	strb r2, [r4, r0]
	ldrh r0, [r4, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov80_02237920
	ldr r1, _02231514 ; =0x000006F4
	strb r0, [r4, r1]
	add r0, r1, #1
	ldrb r0, [r4, r0]
	cmp r0, #0x11
	blo _0223150E
	mov r2, #0x11
	add r0, r1, #1
	strb r2, [r4, r0]
_0223150E:
	pop {r4, pc}
	.balign 4, 0
_02231510: .word 0x000006F2
_02231514: .word 0x000006F4
	thumb_func_end ov80_022314DC

	thumb_func_start ov80_02231518
ov80_02231518: ; 0x02231518
	ldrh r0, [r0, #6]
	bx lr
	thumb_func_end ov80_02231518

	thumb_func_start ov80_0223151C
ov80_0223151C: ; 0x0223151C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldrb r6, [r5, #4]
	add r4, r1, #0
	cmp r6, #3
	beq _0223156E
	add r0, r6, #0
	bl sub_0205C0F4
	add r7, r0, #0
	ldrb r0, [r5, #4]
	bl sub_0205C11C
	str r0, [sp, #0x10]
	ldrb r0, [r5, #4]
	bl sub_0205C0F4
	bl sub_0205C268
	str r0, [sp, #0x14]
	add r0, r6, #0
	bl sub_0205C144
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	add r0, sp, #0x1c
	str r0, [sp, #8]
	add r0, sp, #0x18
	str r0, [sp, #0xc]
	ldr r0, _02231578 ; =0x000006FC
	ldr r2, [sp, #0x10]
	ldr r0, [r5, r0]
	ldr r3, [sp, #0x14]
	add r1, r7, #0
	bl sub_020313C4
	add sp, #0x20
	strh r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0223156E:
	mov r0, #0
	strh r0, [r4]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02231578: .word 0x000006FC
	thumb_func_end ov80_0223151C

	thumb_func_start ov80_0223157C
ov80_0223157C: ; 0x0223157C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, _022317B4 ; =0x000006FC
	add r4, r1, #0
	ldr r0, [r5, r0]
	bl sub_02030C5C
	str r0, [sp, #4]
	ldr r0, _022317B4 ; =0x000006FC
	ldr r0, [r5, r0]
	bl sub_0203107C
	str r0, [sp, #0xc]
	ldrb r1, [r5, #4]
	add r0, sp, #0x14
	strb r1, [r0, #8]
	mov r1, #0
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r0, _022317B8 ; =0x000006F8
	add r2, r1, #0
	ldr r0, [r5, r0]
	add r3, r1, #0
	bl sub_02030B30
	ldr r0, _022317B8 ; =0x000006F8
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02030B1C
	ldr r0, _022317B4 ; =0x000006FC
	ldr r0, [r5, r0]
	bl SaveArray_Party_Get
	mov r1, #0x26
	lsl r1, r1, #4
	ldrb r1, [r5, r1]
	bl Party_GetMonByIndex
	mov r1, #5
	mov r2, #0
	str r0, [sp, #8]
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldrb r0, [r5, #4]
	bl sub_0205C11C
	add r7, r0, #0
	ldrb r0, [r5, #4]
	bl sub_0205C11C
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	bl sub_020310BC
	add r7, r0, #0
	mov r2, #0
	ldrb r1, [r5, #5]
	add r0, sp, #0x14
	add r3, r2, #0
	strb r1, [r0, #8]
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r0, _022317B8 ; =0x000006F8
	mov r1, #1
	ldr r0, [r5, r0]
	bl sub_02030B30
	ldrb r0, [r5, #4]
	bl sub_0205C0CC
	str r0, [sp, #0x10]
	ldrb r0, [r5, #4]
	bl sub_0205C0CC
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #0x10]
	bl sub_02031108
	cmp r4, #2
	beq _022316C8
	ldrb r4, [r5, #4]
	cmp r4, #3
	beq _02231658
	add r0, r4, #0
	bl sub_0205C0F4
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C0F4
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	bl sub_02031108
	b _0223169A
_02231658:
	cmp r7, r6
	beq _0223167C
	add r0, r4, #0
	bl sub_0205C0F4
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C0F4
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	bl sub_02031108
	b _0223169A
_0223167C:
	add r0, r4, #0
	bl sub_0205C0F4
	add r6, r0, #0
	add r0, r4, #0
	bl sub_0205C0F4
	bl sub_0205C268
	add r2, r0, #0
	ldrh r3, [r5, #8]
	ldr r0, [sp, #0xc]
	add r1, r6, #0
	bl sub_0203126C
_0223169A:
	ldrb r1, [r5, #6]
	add r0, sp, #0x14
	mov r3, #0
	strb r1, [r0, #8]
	add r0, sp, #0x1c
	str r0, [sp]
	ldrb r2, [r5, #4]
	ldr r0, [sp, #4]
	mov r1, #5
	bl sub_02030C6C
	ldrb r0, [r5, #4]
	cmp r0, #3
	bne _022316C8
	mov r0, #0x6a
	bl sub_0205C268
	add r2, r0, #0
	ldrb r3, [r5, #6]
	ldr r0, [sp, #0xc]
	mov r1, #0x6a
	bl sub_02031108
_022316C8:
	mov r4, #0
	add r6, sp, #0x14
	add r7, sp, #0x14
_022316CE:
	lsl r0, r4, #1
	add r0, r5, r0
	ldrh r0, [r0, #0x18]
	lsl r2, r4, #0x18
	mov r1, #2
	strh r0, [r7]
	ldr r0, _022317B8 ; =0x000006F8
	str r6, [sp]
	ldr r0, [r5, r0]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030B30
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x14
	blo _022316CE
	mov r4, #0
	add r6, sp, #0x1c
	add r7, sp, #0x14
_022316F8:
	mov r0, #0x26
	add r1, r5, r4
	lsl r0, r0, #4
	ldrb r0, [r1, r0]
	lsl r2, r4, #0x18
	mov r1, #3
	strb r0, [r7, #8]
	ldr r0, _022317B8 ; =0x000006F8
	str r6, [sp]
	ldr r0, [r5, r0]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030B30
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #2
	blo _022316F8
	ldr r0, _022317BC ; =0x00000704
	mov r4, #0
	add r6, r5, r0
	add r7, sp, #0x14
_02231726:
	ldrb r2, [r5, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r6, r1
	bl sub_02030BD0
	strb r0, [r7, #8]
	ldr r0, _022317B4 ; =0x000006FC
	lsl r2, r4, #0x18
	ldrb r1, [r5, #4]
	ldrb r3, [r7, #8]
	ldr r0, [r5, r0]
	lsr r2, r2, #0x18
	bl ov80_02231930
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x12
	blo _02231726
	mov r4, #0
	add r6, sp, #0x14
	add r7, sp, #0x14
_02231758:
	lsl r0, r4, #1
	add r1, r5, r0
	mov r0, #0x9a
	lsl r0, r0, #2
	ldrh r0, [r1, r0]
	lsl r2, r4, #0x18
	mov r1, #4
	strh r0, [r7]
	ldr r0, _022317B8 ; =0x000006F8
	str r6, [sp]
	ldr r0, [r5, r0]
	lsr r2, r2, #0x18
	mov r3, #0
	bl sub_02030B30
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	cmp r4, #0x14
	blo _02231758
	ldrb r0, [r5, #4]
	bl sub_0205C11C
	add r4, r0, #0
	ldrb r0, [r5, #4]
	bl sub_0205C11C
	bl sub_0205C268
	add r5, r0, #0
	ldr r0, [sp, #8]
	mov r1, #5
	mov r2, #0
	bl GetMonData
	add r3, r0, #0
	lsl r3, r3, #0x10
	ldr r0, [sp, #0xc]
	add r1, r4, #0
	add r2, r5, #0
	lsr r3, r3, #0x10
	bl sub_02031108
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022317B4: .word 0x000006FC
_022317B8: .word 0x000006F8
_022317BC: .word 0x00000704
	thumb_func_end ov80_0223157C

	thumb_func_start ov80_022317C0
ov80_022317C0: ; 0x022317C0
	ldrb r1, [r0, #5]
	add r1, r1, #1
	strb r1, [r0, #5]
	ldrb r0, [r0, #5]
	bx lr
	.balign 4, 0
	thumb_func_end ov80_022317C0

	thumb_func_start ov80_022317CC
ov80_022317CC: ; 0x022317CC
	ldrb r0, [r0, #5]
	bx lr
	thumb_func_end ov80_022317CC

	thumb_func_start ov80_022317D0
ov80_022317D0: ; 0x022317D0
	push {r3, lr}
	sub sp, #0x30
	add r2, r0, #0
	ldrb r3, [r2, #5]
	add r0, sp, #0
	lsl r3, r3, #1
	add r1, r1, r3
	lsl r1, r1, #0x18
	lsr r1, r1, #0x17
	add r1, r2, r1
	ldrh r1, [r1, #0x18]
	mov r2, #0xb
	mov r3, #0xcc
	bl ov80_02229F04
	bl FreeToHeap
	add r0, sp, #0
	ldrh r0, [r0, #4]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl ov80_0222A30C
	add sp, #0x30
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov80_022317D0

	thumb_func_start ov80_02231804
ov80_02231804: ; 0x02231804
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #4]
	ldr r0, _02231824 ; =0x00000704
	add r2, r4, r0
	lsl r0, r1, #3
	add r0, r1, r0
	add r0, r2, r0
	bl sub_02030C34
	add r0, r4, #0
	mov r1, #1
	bl ov80_0223157C
	pop {r4, pc}
	nop
_02231824: .word 0x00000704
	thumb_func_end ov80_02231804

	thumb_func_start ov80_02231828
ov80_02231828: ; 0x02231828
	mov r1, #1
	strb r1, [r0, #6]
	ldrh r1, [r0, #0xa]
	cmp r1, #0x12
	bhs _02231836
	add r1, r1, #1
	strh r1, [r0, #0xa]
_02231836:
	ldr r3, _02231840 ; =ov80_0223157C
	mov r1, #0
	strb r1, [r0, #5]
	bx r3
	nop
_02231840: .word ov80_0223157C
	thumb_func_end ov80_02231828

	thumb_func_start ov80_02231844
ov80_02231844: ; 0x02231844
	push {r3, lr}
	cmp r1, #7
	bhi _02231886
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02231856: ; jump table
	.short _02231866 - _02231856 - 2 ; case 0
	.short _0223186C - _02231856 - 2 ; case 1
	.short _02231872 - _02231856 - 2 ; case 2
	.short _02231878 - _02231856 - 2 ; case 3
	.short _02231886 - _02231856 - 2 ; case 4
	.short _02231886 - _02231856 - 2 ; case 5
	.short _02231886 - _02231856 - 2 ; case 6
	.short _02231882 - _02231856 - 2 ; case 7
_02231866:
	bl ov80_0222AF10
	pop {r3, pc}
_0223186C:
	bl ov80_0222AF54
	pop {r3, pc}
_02231872:
	bl ov80_0222AFB8
	pop {r3, pc}
_02231878:
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	bl ov80_0222B024
	pop {r3, pc}
_02231882:
	bl ov80_0222B070
_02231886:
	pop {r3, pc}
	thumb_func_end ov80_02231844

	thumb_func_start ov80_02231888
ov80_02231888: ; 0x02231888
	ldrb r3, [r0, #4]
	ldrh r2, [r0, #0xa]
	cmp r3, #1
	bhi _0223189E
	cmp r2, #0x12
	blo _02231898
	mov r1, #0xc
	b _022318AA
_02231898:
	ldr r1, _022318C8 ; =ov80_0223BDFC
	ldrb r1, [r1, r2]
	b _022318AA
_0223189E:
	cmp r2, #0x12
	blo _022318A6
	mov r1, #0x17
	b _022318AA
_022318A6:
	ldr r1, _022318CC ; =ov80_0223BE10
	ldrb r1, [r1, r2]
_022318AA:
	cmp r3, #0
	bne _022318BC
	ldrh r0, [r0, #8]
	cmp r0, #0x32
	beq _022318B8
	cmp r0, #0xaa
	bne _022318C2
_022318B8:
	mov r1, #0x14
	b _022318C2
_022318BC:
	cmp r3, #2
	bne _022318C2
	mov r1, #0xc
_022318C2:
	add r0, r1, #0
	bx lr
	nop
_022318C8: .word ov80_0223BDFC
_022318CC: .word ov80_0223BE10
	thumb_func_end ov80_02231888

	thumb_func_start ov80_022318D0
ov80_022318D0: ; 0x022318D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r1, #0
	add r5, r2, #0
	add r6, r3, #0
	ldr r4, [sp, #0x20]
	bl sub_0203107C
	str r0, [sp]
	add r0, r7, #0
	add r1, r5, #0
	bl sub_0205C0A0
	str r0, [sp, #4]
	add r0, r7, #0
	add r1, r5, #0
	bl sub_0205C0A0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_020310BC
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	mov r0, #0xf
	and r0, r1
	strh r0, [r6]
	asr r0, r1, #4
	strh r0, [r4]
	lsr r2, r5, #0x1f
	lsl r1, r5, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	bne _02231928
	add sp, #8
	ldrh r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
_02231928:
	ldrh r0, [r4]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_022318D0

	thumb_func_start ov80_02231930
ov80_02231930: ; 0x02231930
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r3, #0
	add r3, sp, #0xc
	str r3, [sp]
	add r3, sp, #0xc
	add r3, #2
	str r0, [sp, #4]
	add r6, r1, #0
	add r5, r2, #0
	bl ov80_022318D0
	add r0, sp, #0xc
	ldrh r1, [r0]
	ldrh r0, [r0, #2]
	lsr r3, r5, #0x1f
	lsl r1, r1, #4
	orr r0, r1
	lsl r2, r5, #0x1f
	lsl r0, r0, #0x18
	sub r2, r2, r3
	mov r1, #0x1f
	ror r2, r1
	add r1, r3, r2
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bne _0223196C
	mov r2, #0xf0
	b _0223196E
_0223196C:
	mov r2, #0xf
_0223196E:
	and r0, r2
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	lsl r0, r1, #2
	add r1, r7, #0
	lsl r1, r0
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	orr r4, r0
	ldr r0, [sp, #4]
	bl sub_0203107C
	add r7, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0205C0A0
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0205C0A0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #8]
	add r0, r7, #0
	add r3, r4, #0
	bl sub_02031108
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_02231930

	thumb_func_start ov80_022319B0
ov80_022319B0: ; 0x022319B0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrb r0, [r5, #4]
	cmp r0, #2
	beq _022319FE
	ldr r0, _02231A00 ; =0x00000704
	mov r4, #0
	add r6, r5, r0
_022319C0:
	ldrb r2, [r5, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r6, r1
	bl sub_02030BD0
	cmp r0, #0xa
	blo _022319DA
	add r4, r4, #1
	cmp r4, #0x11
	blt _022319C0
_022319DA:
	cmp r4, #0x11
	bne _022319FE
	ldr r0, _02231A00 ; =0x00000704
	mov r4, #0
	add r6, r5, r0
	mov r7, #9
_022319E6:
	ldrb r2, [r5, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r6, r1
	add r2, r7, #0
	bl sub_02030BF4
	add r4, r4, #1
	cmp r4, #0x11
	blt _022319E6
_022319FE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02231A00: .word 0x00000704
	thumb_func_end ov80_022319B0

	thumb_func_start ov80_02231A04
ov80_02231A04: ; 0x02231A04
	push {r4, lr}
	add r4, r0, #0
	bl ov80_022379C8
	bl ov80_02237A40
	str r0, [r4, #0xc]
	pop {r4, pc}
	thumb_func_end ov80_02231A04

	thumb_func_start ov80_02231A14
ov80_02231A14: ; 0x02231A14
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r1, _02231BE0 ; =0x000006F5
	ldrb r2, [r6, #4]
	ldrb r0, [r6, r1]
	add r1, #0xf
	add r3, r6, r1
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r3, r1
	bl sub_02030BD0
	add r4, r0, #0
	add r0, r6, #0
	bl ov80_022379C8
	str r0, [sp, #4]
	ldrb r0, [r6, #4]
	cmp r0, #2
	bne _02231A48
	ldr r0, [sp, #4]
	add sp, #0xc
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, r7, pc}
_02231A48:
	ldr r0, [sp, #4]
	cmp r0, #0
	ble _02231A60
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02231A6E
_02231A60:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02231A6E:
	ldr r5, [r6, #0xc]
	bl _ffix
	lsl r1, r5, #1
	add r1, r5, r1
	sub r0, r0, r1
	str r0, [sp, #8]
	add r0, r5, #0
	bl _fflt
	ldr r1, _02231BE4 ; =0x45800000
	bl _fdiv
	bl _f2d
	add r3, r1, #0
	add r2, r0, #0
	ldr r1, _02231BE8 ; =0x40140000
	mov r0, #0
	bl _dmul
	bl _d2f
	add r5, r0, #0
	ldr r0, [sp, #4]
	bl _fflt
	add r1, r5, #0
	bl _fdiv
	bl _f2d
	ldr r3, _02231BEC ; =0x3FF00000
	mov r2, #0
	bl _dls
	bhs _02231AC2
	add r0, r4, #0
	bl _fflt
	str r0, [sp]
	b _02231B00
_02231AC2:
	ldr r0, [sp, #4]
	mul r0, r4
	cmp r0, #0
	ble _02231ADC
	lsl r0, r0, #0xc
	bl _fflt
	add r1, r0, #0
	mov r0, #0x3f
	lsl r0, r0, #0x18
	bl _fadd
	b _02231AEA
_02231ADC:
	lsl r0, r0, #0xc
	bl _fflt
	mov r1, #0x3f
	lsl r1, r1, #0x18
	bl _fsub
_02231AEA:
	bl _ffix
	bl _fflt
	ldr r1, _02231BE4 ; =0x45800000
	bl _fdiv
	add r1, r5, #0
	bl _fdiv
	str r0, [sp]
_02231B00:
	ldr r0, _02231BF0 ; =0x00000704
	mov r5, #0
	add r4, r5, #0
	add r7, r6, r0
_02231B08:
	ldr r0, _02231BE0 ; =0x000006F5
	ldrb r0, [r6, r0]
	cmp r4, r0
	bne _02231B26
	add r0, r5, #0
	bl _f2d
	ldr r3, _02231BEC ; =0x3FF00000
	mov r2, #0
	bl _dadd
	bl _d2f
	add r5, r0, #0
	b _02231B4E
_02231B26:
	ldrb r2, [r6, #4]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	lsl r1, r2, #3
	add r1, r2, r1
	add r1, r7, r1
	bl sub_02030BD0
	cmp r0, #0
	beq _02231B4E
	add r0, r5, #0
	bl _f2d
	ldr r3, _02231BEC ; =0x3FF00000
	mov r2, #0
	bl _dadd
	bl _d2f
	add r5, r0, #0
_02231B4E:
	add r4, r4, #1
	cmp r4, #0x12
	blt _02231B08
	add r0, r5, #0
	bl _f2d
	add r2, r0, #0
	mov r0, #0
	add r3, r1, #0
	add r1, r0, #0
	bl _dneq
	beq _02231B7C
	add r0, r5, #0
	bl _f2d
	ldr r3, _02231BEC ; =0x3FF00000
	mov r2, #0
	bl _dsub
	bl _d2f
	add r5, r0, #0
_02231B7C:
	add r0, r5, #0
	bl _f2d
	ldr r3, _02231BF4 ; =0x3FE00000
	mov r2, #0
	bl _dmul
	bl _d2f
	add r4, r0, #0
	ldr r0, [sp, #8]
	bl _fflt
	ldr r1, _02231BE4 ; =0x45800000
	bl _fdiv
	ldr r1, [sp]
	bl _fadd
	add r1, r0, #0
	add r0, r4, #0
	bl _fadd
	add r5, r0, #0
	bl _ffix
	add r4, r0, #0
	add r0, r5, #0
	bl _ffix
	bl _fflt
	add r1, r0, #0
	add r0, r5, #0
	bl _fneq
	beq _02231BC8
	add r4, r4, #1
_02231BC8:
	ldr r0, [sp, #4]
	cmp r4, r0
	ble _02231BD0
	add r4, r0, #0
_02231BD0:
	cmp r4, #0x64
	ble _02231BD6
	mov r4, #0x64
_02231BD6:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02231BE0: .word 0x000006F5
_02231BE4: .word 0x45800000
_02231BE8: .word 0x40140000
_02231BEC: .word 0x3FF00000
_02231BF0: .word 0x00000704
_02231BF4: .word 0x3FE00000
	thumb_func_end ov80_02231A14

    .bss

ov80_0223DD44: ; 0x0223DD44
	.space 0x4
