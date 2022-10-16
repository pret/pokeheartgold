	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov26_022599D0
ov26_022599D0: ; 0x022599D0
	ldr r3, _022599D4 ; =sub_0205FC94
	bx r3
	.balign 4, 0
_022599D4: .word sub_0205FC94
	thumb_func_end ov26_022599D0

	thumb_func_start ov26_022599D8
ov26_022599D8: ; 0x022599D8
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	beq _02259A20
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	cmp r0, #0
	bne _022599EE
	mov r4, #0xe
	b _02259A00
_022599EE:
	cmp r0, #1
	bne _022599F6
	mov r4, #0xf
	b _02259A00
_022599F6:
	cmp r0, #2
	bne _022599FE
	mov r4, #0x10
	b _02259A00
_022599FE:
	mov r4, #0x11
_02259A00:
	add r0, r6, #0
	add r1, r5, #0
	mov r2, #1
	bl ov26_02259A24
	cmp r0, #0
	beq _02259A16
	lsl r1, r4, #0x10
	lsr r1, r1, #0x10
	bl ov26_022599D0
_02259A16:
	lsl r1, r4, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl ov26_022599D0
_02259A20:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov26_022599D8

	thumb_func_start ov26_02259A24
ov26_02259A24: ; 0x02259A24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	str r0, [sp]
	str r2, [sp, #4]
	bl Field_GetNumObjectEvents
	add r7, r0, #0
	add r0, r4, #0
	bl MapObject_GetScript
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	bl ScriptNumToTrainerNum
	str r0, [sp, #8]
	bl TrainerNumIsDouble
	cmp r0, #0
	bne _02259A54
	add sp, #0x10
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02259A54:
	mov r4, #0
	cmp r7, #0
	bls _02259AC6
_02259A5A:
	ldr r0, [sp]
	add r1, r4, #0
	ldr r0, [r0, #0x3c]
	bl GetMapObjectByID
	add r5, r0, #0
	beq _02259AC0
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _02259A76
	bl MapObject_GetMovement
	cmp r0, #0x31
	beq _02259AC0
_02259A76:
	add r0, r5, #0
	bl MapObject_GetType
	cmp r0, #8
	bhi _02259AC0
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02259A8C: ; jump table
	.short _02259AC0 - _02259A8C - 2 ; case 0
	.short _02259A9E - _02259A8C - 2 ; case 1
	.short _02259A9E - _02259A8C - 2 ; case 2
	.short _02259AC0 - _02259A8C - 2 ; case 3
	.short _02259A9E - _02259A8C - 2 ; case 4
	.short _02259A9E - _02259A8C - 2 ; case 5
	.short _02259A9E - _02259A8C - 2 ; case 6
	.short _02259A9E - _02259A8C - 2 ; case 7
	.short _02259A9E - _02259A8C - 2 ; case 8
_02259A9E:
	add r0, r5, #0
	bl MapObject_GetScript
	add r6, r0, #0
	lsl r0, r6, #0x10
	lsr r0, r0, #0x10
	bl ScriptNumToTrainerNum
	ldr r1, [sp, #0xc]
	cmp r1, r6
	beq _02259AC0
	ldr r1, [sp, #8]
	cmp r1, r0
	bne _02259AC0
	add sp, #0x10
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_02259AC0:
	add r4, r4, #1
	cmp r4, r7
	blo _02259A5A
_02259AC6:
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov26_02259A24
