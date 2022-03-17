	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

	.public _020FC5CC
_020FC5CC:
	.word 0x00100001
	.byte 0x00, 0x40, 0x0C, 0x00
	.word 0x00100021
	.byte 0x00, 0x40, 0x0C, 0x00
	.word 0x00100003
	.byte 0x00, 0x40, 0x0C, 0x00
	.word 0x01110111
	.byte 0x00, 0x40, 0x0C, 0x00
	.word 0x01110111
	.byte 0x00, 0x00, 0x0A, 0x00
	.word 0x00100006
	.byte 0x00, 0x40, 0x0C, 0x00

	.text
	.public sub_02052F30
	.public sub_02052F94
	.public sub_02053018
	.public sub_0205316C
	.public sub_02053210
	.public sub_0205323C
	.public sub_02053284
	.public sub_02053324
	.public sub_02053350
	.public sub_0205337C
	.public sub_020533C0
	.public sub_02053414
	.public sub_0205348C
	.public sub_02053550
	.public sub_02053688
	.public sub_02053710
	.public sub_02053740
	.public sub_020537A8
	.public sub_0205380C
	.public sub_02053CCC
	.public sub_02053E5C

	thumb_func_start sub_02053F70
sub_02053F70: ; 0x02053F70
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	str r0, [sp]
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r7, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	add r6, r7, #0
	ldr r0, [r4]
	add r6, #8
	cmp r0, #6
	bhi _0205402C
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02053FA0: ; jump table
	.short _02053FAE - _02053FA0 - 2 ; case 0
	.short _02053FC4 - _02053FA0 - 2 ; case 1
	.short _02053FD2 - _02053FA0 - 2 ; case 2
	.short _02053FE2 - _02053FA0 - 2 ; case 3
	.short _02054002 - _02053FA0 - 2 ; case 4
	.short _02054016 - _02053FA0 - 2 ; case 5
	.short _02054022 - _02053FA0 - 2 ; case 6
_02053FAE:
	ldr r0, [sp]
	ldr r1, [r6]
	bl sub_020550E4
	add r0, r5, #0
	bl sub_020552E8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205402C
_02053FC4:
	add r0, r5, #0
	bl sub_0205525C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205402C
_02053FD2:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_020537A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205402C
_02053FE2:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _0205402C
	ldr r0, [sp]
	ldr r1, [r6]
	mov r2, #0
	bl sub_02055110
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205402C
_02054002:
	mov r1, #0
	ldr r0, [sp]
	str r1, [r7, #4]
	add r2, r7, #4
	bl ov01_021F35C4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205402C
_02054016:
	ldr r1, [r7, #4]
	cmp r1, #0
	beq _0205402C
	add r0, r0, #1
	str r0, [r4]
	b _0205402C
_02054022:
	add r0, r7, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205402C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02053F70

	thumb_func_start sub_02054030
sub_02054030: ; 0x02054030
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetDynamicWarp
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x1c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r7, #0
	add r1, r5, #0
	bl sub_02053350
	mov r0, #2
	str r0, [r4, #8]
	sub r0, r0, #3
	str r0, [r4, #0xc]
	mov r0, #8
	str r0, [r4, #0x10]
	mov r0, #0xe
	str r0, [r4, #0x14]
	mov r0, #0
	str r0, [r4, #0x18]
	add r0, r5, #0
	bl sub_02059DB0
	add r1, r5, #0
	add r1, #0x80
	str r0, [r1]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl sub_0205AC88
	add r1, r5, #0
	add r1, #0x84
	str r0, [r1]
	mov r0, #2
	str r0, [r5, #0x70]
	ldr r1, _020540A0 ; =sub_02053F70
	add r0, r6, #0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020540A0: .word sub_02053F70
	thumb_func_end sub_02054030

	thumb_func_start sub_020540A4
sub_020540A4: ; 0x020540A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #3
	bhi _02054124
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020540C8: ; jump table
	.short _020540D0 - _020540C8 - 2 ; case 0
	.short _020540EC - _020540C8 - 2 ; case 1
	.short _020540FC - _020540C8 - 2 ; case 2
	.short _0205411C - _020540C8 - 2 ; case 3
_020540D0:
	ldr r0, _02054128 ; =0x00000602
	bl PlaySE
	ldr r1, [r4, #4]
	add r0, r6, #0
	bl sub_020550E4
	add r0, r5, #0
	bl sub_020553B0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02054124
_020540EC:
	add r0, r5, #0
	add r1, r4, #4
	bl sub_020537A8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02054124
_020540FC:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _02054124
	ldr r1, [r4, #4]
	add r0, r6, #0
	mov r2, #0
	bl sub_02055110
	add r0, r5, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02054124
_0205411C:
	bl FreeToHeap
	mov r0, #1
	pop {r4, r5, r6, pc}
_02054124:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02054128: .word 0x00000602
	thumb_func_end sub_020540A4

	thumb_func_start sub_0205412C
sub_0205412C: ; 0x0205412C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl TaskManager_GetSys
	str r0, [sp]
	ldr r0, [r0, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetDynamicWarp
	ldr r1, [sp]
	bl sub_02053350
	ldr r0, [sp]
	mov r1, #3
	str r1, [r0, #0x70]
	mov r0, #0xb
	mov r1, #0x1c
	bl AllocFromHeapAtEnd
	add r2, r0, #0
	ldr r0, [sp, #0x30]
	str r4, [sp, #8]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x34]
	str r5, [sp, #4]
	str r0, [sp, #0x14]
	mov r0, #0
	str r6, [sp, #0xc]
	add r4, sp, #4
	str r0, [r2]
	ldmia r4!, {r0, r1}
	add r3, r2, #4
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r4]
	ldr r1, _0205418C ; =sub_020540A4
	str r0, [r3]
	add r0, r7, #0
	bl TaskManager_Call
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205418C: .word sub_020540A4
	thumb_func_end sub_0205412C

	thumb_func_start sub_02054190
sub_02054190: ; 0x02054190
	push {r4, lr}
	bl TaskManager_GetSys
	add r4, r0, #0
	ldr r0, [r4, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetDynamicWarp
	add r1, r0, #0
	mov r0, #0
	str r0, [r4, #0x70]
	ldr r0, [r4, #0x10]
	bl sub_02053710
	pop {r4, pc}
	thumb_func_end sub_02054190
