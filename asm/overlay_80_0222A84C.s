	.include "asm/macros.inc"
	.include "overlay_80_0222A84C.inc"
	.include "global.inc"

    .text

	thumb_func_start ov80_0222A84C
ov80_0222A84C: ; 0x0222A84C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0xbc
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xbc
	bl MI_CpuFill8
	str r7, [r4]
	add r0, r4, #0
	add r1, r4, #0
	str r5, [r4, #0x34]
	add r0, #0x52
	strh r6, [r0]
	add r0, r4, #0
	add r0, #0x40
	add r1, #0x3c
	add r2, r6, #0
	add r3, r5, #0
	bl ov80_0222AA40
	mov r0, #8
	mov r1, #0x40
	add r2, r5, #0
	bl MessageFormat_New_Custom
	str r0, [r4, #0x44]
	mov r0, #1
	lsl r0, r0, #0xa
	add r1, r5, #0
	bl String_New
	str r0, [r4, #0x48]
	mov r0, #1
	lsl r0, r0, #0xa
	add r1, r5, #0
	bl String_New
	lsl r1, r6, #0x10
	mov r2, #0
	str r0, [r4, #0x4c]
	add r0, r4, #0
	lsr r1, r1, #0x10
	add r3, r2, #0
	bl ov80_0222AA3C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222A84C

	thumb_func_start ov80_0222A8B8
ov80_0222A8B8: ; 0x0222A8B8
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x51
	str r0, [sp]
	ldrsb r0, [r0, r1]
	cmp r0, #0
	bne _0222A8C8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222A8C8:
	ldr r0, [sp]
	add r0, #0x38
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222A90C
	ldr r5, [sp]
	mov r7, #0
	add r6, r5, #0
	add r6, #0x51
_0222A8DA:
	ldr r4, [r5, #4]
	cmp r4, #0
	beq _0222A8FC
	add r0, r4, #0
	bl ov80_0222AB98
	cmp r0, #0
	bne _0222A8FC
	ldr r0, [sp]
	add r1, r4, #0
	bl ov80_0222AA0C
	mov r0, #0
	str r0, [r5, #4]
	ldrsb r0, [r6, r0]
	sub r0, r0, #1
	strb r0, [r6]
_0222A8FC:
	add r7, r7, #1
	add r5, r5, #4
	cmp r7, #8
	blt _0222A8DA
	ldr r0, [sp]
	ldr r0, [r0]
	bl ov80_02239C54
_0222A90C:
	ldr r0, [sp]
	mov r1, #0x51
	ldrsb r0, [r0, r1]
	cmp r0, #0
	bne _0222A91A
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222A91A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222A8B8

	thumb_func_start ov80_0222A920
ov80_0222A920: ; 0x0222A920
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x51
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0222A930
	bl GF_AssertFail
_0222A930:
	ldr r0, [r4, #0x44]
	bl MessageFormat_Delete
	ldr r0, [r4, #0x48]
	bl String_Delete
	ldr r0, [r4, #0x4c]
	bl String_Delete
	ldr r0, [r4, #0x40]
	bl FreeToHeap
	ldr r0, [r4, #0x3c]
	bl DestroyMsgData
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov80_0222A920

	thumb_func_start ov80_0222A958
ov80_0222A958: ; 0x0222A958
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x34]
	add r6, r1, #0
	mov r1, #0x90
	add r7, r2, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x90
	add r4, r0, #0
	bl MI_CpuFill8
	ldr r2, _0222A9D0 ; =ov80_0223B9CC
	ldr r1, _0222A9D4 ; =ov80_0223BA04
	ldr r2, [r2]
	add r0, r4, #0
	bl ov80_0222AB40
	ldr r0, _0222A9D8 ; =0x0000FFFF
	str r5, [r4]
	cmp r6, r0
	beq _0222A990
	add r0, r5, #0
	add r0, #0x52
	ldrh r0, [r0]
	cmp r0, r6
	bne _0222A9A2
_0222A990:
	add r0, r4, #0
	ldr r1, [r5, #0x40]
	add r0, #0x84
	str r1, [r0]
	add r0, r4, #0
	ldr r1, [r5, #0x3c]
	add r0, #0x80
	str r1, [r0]
	b _0222A9B2
_0222A9A2:
	add r0, r4, #0
	add r1, r4, #0
	ldr r3, [r5, #0x34]
	add r0, #0x84
	add r1, #0x80
	add r2, r6, #0
	bl ov80_0222AA40
_0222A9B2:
	add r1, r4, #0
	add r1, #0x84
	ldr r1, [r1]
	add r0, r4, #0
	bl ov80_0222AB78
	add r0, r4, #0
	add r1, r7, #0
	bl ov80_0222AB14
	add r0, r5, #0
	add r1, r4, #0
	bl ov80_0222A9DC
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A9D0: .word ov80_0223B9CC
_0222A9D4: .word ov80_0223BA04
_0222A9D8: .word 0x0000FFFF
	thumb_func_end ov80_0222A958

	thumb_func_start ov80_0222A9DC
ov80_0222A9DC: ; 0x0222A9DC
	push {r4, lr}
	mov r3, #0
	add r4, r0, #0
_0222A9E2:
	ldr r2, [r4, #4]
	cmp r2, #0
	bne _0222A9FC
	lsl r2, r3, #2
	add r2, r0, r2
	str r1, [r2, #4]
	mov r1, #0x51
	ldrsb r1, [r0, r1]
	add r0, #0x51
	add r1, r1, #1
	strb r1, [r0]
	mov r0, #1
	pop {r4, pc}
_0222A9FC:
	add r3, r3, #1
	add r4, r4, #4
	cmp r3, #8
	blt _0222A9E2
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov80_0222A9DC

	thumb_func_start ov80_0222AA0C
ov80_0222AA0C: ; 0x0222AA0C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r1, [r5, #0x3c]
	cmp r0, r1
	beq _0222AA22
	bl DestroyMsgData
_0222AA22:
	add r0, r4, #0
	add r0, #0x84
	ldr r0, [r0]
	ldr r1, [r5, #0x40]
	cmp r0, r1
	beq _0222AA32
	bl FreeToHeap
_0222AA32:
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov80_0222AA0C

	thumb_func_start ov80_0222AA3C
ov80_0222AA3C: ; 0x0222AA3C
	bx lr
	.balign 4, 0
	thumb_func_end ov80_0222AA3C

	thumb_func_start ov80_0222AA40
ov80_0222AA40: ; 0x0222AA40
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r6, #0
	mov r1, #1
	add r7, r3, #0
	bl ov80_0222ACA0
	str r0, [sp]
	add r0, r6, #0
	mov r1, #2
	bl ov80_0222ACA0
	add r6, r0, #0
	ldr r1, [sp]
	mov r0, #0xb6
	add r2, r7, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [r5]
	mov r0, #1
	mov r1, #0x1b
	add r2, r6, #0
	add r3, r7, #0
	bl NewMsgDataFromNarc
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222AA40

	thumb_func_start ov80_0222AA7C
ov80_0222AA7C: ; 0x0222AA7C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x52
	ldrh r0, [r0]
	add r6, r1, #0
	mov r1, #2
	add r7, r2, #0
	bl ov80_0222ACA0
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #2
	bl ov80_0222ACA0
	add r2, r0, #0
	cmp r4, r2
	beq _0222AAD4
	mov r0, #1
	mov r1, #0x1b
	add r3, r7, #0
	bl NewMsgDataFromNarc
	add r4, r0, #0
	mov r1, #0
	add r2, r5, #0
_0222AAAE:
	ldr r0, [r2, #4]
	cmp r0, #0
	beq _0222AAC4
	add r3, r0, #0
	add r3, #0x80
	ldr r6, [r3]
	ldr r3, [r5, #0x3c]
	cmp r6, r3
	bne _0222AAC4
	add r0, #0x80
	str r4, [r0]
_0222AAC4:
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #8
	blt _0222AAAE
	ldr r0, [r5, #0x3c]
	bl DestroyMsgData
	str r4, [r5, #0x3c]
_0222AAD4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov80_0222AA7C

	thumb_func_start ov80_0222AAD8
ov80_0222AAD8: ; 0x0222AAD8
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #0x10
	bl AllocFromHeap
	add r4, #0x24
	add r3, r0, #0
	mov r2, #8
_0222AAEA:
	ldrh r1, [r4]
	add r4, r4, #2
	strh r1, [r3]
	add r3, r3, #2
	sub r2, r2, #1
	bne _0222AAEA
	pop {r4, pc}
	thumb_func_end ov80_0222AAD8

	thumb_func_start ov80_0222AAF8
ov80_0222AAF8: ; 0x0222AAF8
	push {r4, lr}
	add r4, r1, #0
	add r0, #0x24
	mov r3, #8
_0222AB00:
	ldrh r2, [r4]
	add r4, r4, #2
	strh r2, [r0]
	add r0, r0, #2
	sub r3, r3, #1
	bne _0222AB00
	add r0, r1, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov80_0222AAF8

	thumb_func_start ov80_0222AB14
ov80_0222AB14: ; 0x0222AB14
	push {r4, lr}
	add r4, r0, #0
	ldr r2, [r4, #0x1c]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r4, #0x1c]
	bl ov80_0222AC70
	ldr r1, [r4, #0x1c]
	add r0, r1, r0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end ov80_0222AB14

	thumb_func_start ov80_0222AB2C
ov80_0222AB2C: ; 0x0222AB2C
	add r0, #0x24
	lsl r1, r1, #1
	add r0, r0, r1
	bx lr
	thumb_func_end ov80_0222AB2C

	thumb_func_start ov80_0222AB34
ov80_0222AB34: ; 0x0222AB34
	ldr r3, _0222AB3C ; =sub_0209680C
	ldr r0, [r0]
	bx r3
	nop
_0222AB3C: .word sub_0209680C
	thumb_func_end ov80_0222AB34
    