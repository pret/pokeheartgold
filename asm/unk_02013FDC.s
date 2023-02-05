	.include "asm/macros.inc"
	.include "unk_02013FDC.inc"
	.include "global.inc"

	.rodata

_020F5F44:
	.byte 0x47, 0x01, 0x00, 0x00, 0xEF, 0x01, 0x00, 0x00
_020F5F4C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
_020F5F5C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00
_020F5F6C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
_020F5FCC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

	.text

	thumb_func_start sub_02013FDC
sub_02013FDC: ; 0x02013FDC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r6, [sp, #0x20]
	str r1, [sp, #4]
	add r5, r2, #0
	add r4, r3, #0
	str r0, [sp, #0x24]
	mov r7, #0
_02013FF0:
	ldr r1, [r4]
	ldr r0, [sp, #4]
	ldr r2, [r5]
	add r0, r0, r1
	ldr r1, [sp]
	add r1, r1, r2
	add r2, r6, #0
	bl memcpy
	ldr r1, [r5]
	ldr r0, [sp, #0x24]
	add r7, r7, #1
	add r0, r1, r0
	str r0, [r5]
	ldr r0, [r4]
	add r0, r0, r6
	str r0, [r4]
	cmp r7, #8
	blt _02013FF0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02013FDC

	thumb_func_start sub_0201401C
sub_0201401C: ; 0x0201401C
	push {r4, r5, r6, lr}
	add r5, r3, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	add r4, r0, #0
	bne _0201402C
	bl GF_AssertFail
_0201402C:
	add r0, r4, #0
	add r1, r5, #0
	bl NNS_G2dGetUnpackedCharacterData
	add r6, r0, #0
	cmp r5, #0
	bne _0201403E
	bl GF_AssertFail
_0201403E:
	cmp r6, #0
	bne _02014046
	bl GF_AssertFail
_02014046:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0201401C

	thumb_func_start sub_02014050
sub_02014050: ; 0x02014050
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	ldr r4, [sp, #0x40]
	str r0, [sp, #8]
	add r6, r0, r2
	ldrh r0, [r4, #2]
	str r1, [sp, #0xc]
	add r5, r3, #0
	cmp r0, r6
	bge _02014068
	bl GF_AssertFail
_02014068:
	ldr r0, [sp, #0xc]
	ldrh r1, [r4]
	add r0, r0, r5
	str r0, [sp, #0x14]
	cmp r1, r0
	bge _02014078
	bl GF_AssertFail
_02014078:
	ldr r0, [r4, #0x14]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0x1c]
	ldrh r0, [r4, #2]
	lsl r7, r0, #2
	ldr r0, [sp, #0xc]
	add r1, r0, #0
	mul r1, r7
	ldr r0, [sp, #8]
	str r1, [sp, #0x18]
	lsl r1, r0, #2
	ldr r0, [sp, #0x18]
	str r1, [sp, #0x10]
	add r0, r1, r0
	str r0, [sp, #0x28]
	mov r0, #0
	str r0, [sp, #0x24]
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x14]
	cmp r1, r0
	bge _020140E2
_020140A4:
	ldr r4, [sp, #8]
	add r0, r4, #0
	cmp r0, r6
	bge _020140D0
	ldr r0, [sp, #0x18]
	lsl r1, r0, #3
	ldr r0, [sp, #0x10]
	add r5, r0, r1
_020140B4:
	str r5, [sp, #0x28]
	mov r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x1c]
	add r2, sp, #0x28
	add r3, sp, #0x24
	str r7, [sp, #4]
	bl sub_02013FDC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _020140B4
_020140D0:
	ldr r0, [sp, #0x18]
	add r0, r0, r7
	str r0, [sp, #0x18]
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	ldr r0, [sp, #0x14]
	str r1, [sp, #0xc]
	cmp r1, r0
	blt _020140A4
_020140E2:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02014050

	thumb_func_start sub_020140E8
sub_020140E8: ; 0x020140E8
	push {r4, r5}
	sub sp, #8
	ldr r2, _02014120 ; =_020F5F44
	add r1, sp, #0
	ldr r3, [r2]
	ldr r2, [r2, #4]
	str r3, [sp]
	str r2, [sp, #4]
	ldr r2, _02014124 ; =0x000001EF
	mov r5, #0
	add r3, r2, #0
_020140FE:
	ldr r4, [r1]
	cmp r4, r3
	beq _02014118
	cmp r4, r0
	bne _02014110
	add sp, #8
	mov r0, #1
	pop {r4, r5}
	bx lr
_02014110:
	add r5, r5, #1
	add r1, r1, #4
	cmp r5, r2
	blt _020140FE
_02014118:
	mov r0, #0
	add sp, #8
	pop {r4, r5}
	bx lr
	.balign 4, 0
_02014120: .word _020F5F44
_02014124: .word 0x000001EF
	thumb_func_end sub_020140E8

	thumb_func_start sub_02014128
sub_02014128: ; 0x02014128
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r3, #0
	mov r3, #0
	str r3, [sp, #8]
	add r3, sp, #8
	add r5, r0, #0
	bl sub_0201401C
	ldr r0, [sp, #8]
	add r1, r5, #0
	ldr r0, [r0, #0x14]
	bl sub_02009D28
	ldr r0, [sp, #0x34]
	bl sub_020140E8
	ldr r1, [sp, #0x30]
	cmp r1, #2
	bne _02014160
	cmp r0, #1
	bne _02014160
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x28]
	ldr r0, [r0, #0x14]
	ldr r2, [sp, #0x2c]
	bl sub_02009B60
_02014160:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x18]
	str r0, [sp]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x1c]
	str r0, [sp, #4]
	ldr r3, [sp, #0x20]
	add r0, r4, #0
	bl sub_02014050
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end sub_02014128

	thumb_func_start sub_02014178
sub_02014178: ; 0x02014178
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, r1, #0
	add r5, r2, #0
	ldr r2, [sp, #0x3c]
	ldr r1, [sp, #0x40]
	add r6, r0, #0
	mul r1, r2
	add r0, r5, #0
	lsl r1, r1, #5
	str r3, [sp, #0x20]
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [sp, #0x38]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	ldr r0, [sp, #0x3c]
	add r1, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x40]
	add r2, r5, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x44]
	str r4, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x48]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x4c]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x50]
	str r0, [sp, #0x1c]
	add r0, r6, #0
	bl sub_02014128
	add r0, r4, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02014178

	thumb_func_start sub_020141C4
sub_020141C4: ; 0x020141C4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r3, [sp, #8]
	ldr r3, [sp, #0x48]
	add r4, r0, #0
	str r3, [sp, #0x48]
	mov r3, #0
	str r3, [sp, #0x2c]
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [sp, #0x20]
	cmp r0, #0
	bne _020141E2
	bl GF_AssertFail
_020141E2:
	ldr r0, [sp, #0x20]
	add r1, sp, #0x2c
	bl NNS_G2dGetUnpackedCharacterData
	cmp r0, #0
	bne _020141F2
	bl GF_AssertFail
_020141F2:
	ldr r1, [sp, #0x4c]
	ldr r0, [sp, #8]
	add r6, r0, r1
	ldr r0, [sp, #0x2c]
	ldrh r0, [r0, #2]
	cmp r0, r6
	bge _02014204
	bl GF_AssertFail
_02014204:
	ldr r1, [sp, #0x50]
	ldr r0, [sp, #0x48]
	add r0, r0, r1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x2c]
	ldrh r1, [r0]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	bge _0201421A
	bl GF_AssertFail
_0201421A:
	ldr r0, [sp, #0x2c]
	add r1, r4, #0
	ldr r0, [r0, #0x14]
	str r0, [sp, #0x1c]
	bl sub_02009D28
	ldr r0, [sp, #0x54]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x2c]
	ldrh r0, [r0, #2]
	lsl r7, r0, #2
	ldr r0, [sp, #0x48]
	add r1, r0, #0
	mul r1, r7
	ldr r0, [sp, #8]
	str r1, [sp, #0x14]
	lsl r1, r0, #2
	ldr r0, [sp, #0x14]
	str r1, [sp, #0xc]
	add r0, r1, r0
	str r0, [sp, #0x28]
	mov r0, #0
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x48]
	ldr r0, [sp, #0x10]
	cmp r1, r0
	bge _0201428E
_02014250:
	ldr r4, [sp, #8]
	add r0, r4, #0
	cmp r0, r6
	bge _0201427C
	ldr r0, [sp, #0x14]
	lsl r1, r0, #3
	ldr r0, [sp, #0xc]
	add r5, r0, r1
_02014260:
	str r5, [sp, #0x28]
	mov r0, #4
	str r0, [sp]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	add r2, sp, #0x28
	add r3, sp, #0x24
	str r7, [sp, #4]
	bl sub_02013FDC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _02014260
_0201427C:
	ldr r0, [sp, #0x14]
	add r0, r0, r7
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x48]
	add r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #0x48]
	cmp r1, r0
	blt _02014250
_0201428E:
	ldr r0, [sp, #0x20]
	bl FreeToHeap
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020141C4

	thumb_func_start sub_02014298
sub_02014298: ; 0x02014298
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	add r5, r2, #0
	ldr r2, [sp, #0x2c]
	ldr r1, [sp, #0x30]
	add r6, r0, #0
	mul r1, r2
	add r0, r5, #0
	lsl r1, r1, #5
	str r3, [sp, #0x10]
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	add r1, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	add r2, r5, #0
	str r0, [sp, #8]
	add r0, r6, #0
	str r4, [sp, #0xc]
	bl sub_020141C4
	add r0, r4, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02014298

	thumb_func_start sub_020142D4
sub_020142D4: ; 0x020142D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp]
	ldr r0, [sp, #0x44]
	ldr r1, [sp, #0x38]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x48]
	str r2, [sp, #4]
	str r0, [sp, #0x14]
	add r0, r2, #0
	add r7, r0, r1
	ldr r1, [sp, #0x3c]
	add r0, r3, #0
	add r0, r0, r1
	add r1, r3, #0
	str r3, [sp, #8]
	ldr r5, [sp, #0x40]
	str r0, [sp, #0x10]
	cmp r1, r0
	bge _0201434C
	add r0, r3, #0
	lsl r0, r0, #5
	str r0, [sp, #0xc]
	add r0, r2, #0
	lsl r0, r0, #5
	str r0, [sp, #0x1c]
_02014308:
	ldr r6, [sp, #4]
	add r0, r6, #0
	cmp r0, r7
	bge _0201433A
	ldr r1, [sp]
	ldr r0, [sp, #0xc]
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp, #0x1c]
	add r4, r0, r2
_0201431C:
	ldr r1, [r5]
	ldr r0, [sp, #0x14]
	mov r2, #0x20
	add r0, r0, r1
	ldr r1, [sp, #0x18]
	add r1, r1, r4
	bl memcpy
	ldr r0, [r5]
	add r6, r6, #1
	add r0, #0x20
	str r0, [r5]
	add r4, #0x20
	cmp r6, r7
	blt _0201431C
_0201433A:
	ldr r0, [sp, #0xc]
	add r0, #0x20
	str r0, [sp, #0xc]
	ldr r0, [sp, #8]
	add r1, r0, #1
	ldr r0, [sp, #0x10]
	str r1, [sp, #8]
	cmp r1, r0
	blt _02014308
_0201434C:
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020142D4

	thumb_func_start sub_02014350
sub_02014350: ; 0x02014350
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r2, #0
	ldr r2, [r4, #8]
	str r2, [sp]
	ldr r2, [r4, #0xc]
	str r2, [sp, #4]
	ldr r2, [sp, #0x20]
	str r3, [sp, #8]
	str r2, [sp, #0xc]
	ldr r2, [sp, #0x24]
	str r2, [sp, #0x10]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	bl sub_020142D4
	add sp, #0x14
	pop {r3, r4, pc}
	thumb_func_end sub_02014350

	thumb_func_start sub_02014374
sub_02014374: ; 0x02014374
	push {r4, r5, r6, r7, lr}
	sub sp, #0x7c
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x9c]
	mov ip, r3
	add r5, r2, #0
	ldr r6, [sp, #0x94]
	ldr r7, [sp, #0x98]
	ldr r3, _020143DC ; =_020F5F6C
	str r1, [sp, #0x10]
	str r0, [sp, #0x9c]
	add r2, sp, #0x1c
	mov r4, #0xc
_0201438E:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r4, r4, #1
	bne _0201438E
	mov r0, #0
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x90]
	ldr r1, [sp, #0x10]
	str r0, [sp]
	str r6, [sp, #4]
	ldr r0, [sp, #0xc]
	add r2, r5, #0
	mov r3, ip
	str r7, [sp, #8]
	bl sub_02014298
	str r0, [sp, #0x14]
	mov r4, #0
	add r5, sp, #0x1c
_020143B4:
	ldr r0, [sp, #0x14]
	add r1, r7, #0
	str r0, [sp]
	ldr r0, [sp, #0x9c]
	add r2, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r3, sp, #0x18
	bl sub_02014350
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blt _020143B4
	ldr r0, [sp, #0x14]
	bl FreeToHeap
	add sp, #0x7c
	pop {r4, r5, r6, r7, pc}
	nop
_020143DC: .word _020F5F6C
	thumb_func_end sub_02014374

	thumb_func_start sub_020143E0
sub_020143E0: ; 0x020143E0
	push {r4, lr}
	sub sp, #0x10
	ldr r4, [r3, #4]
	str r4, [sp]
	ldr r4, [r3, #8]
	str r4, [sp, #4]
	ldr r4, [r3, #0xc]
	str r4, [sp, #8]
	ldr r4, [sp, #0x18]
	str r4, [sp, #0xc]
	ldr r3, [r3]
	bl sub_02014374
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020143E0

	thumb_func_start sub_02014400
sub_02014400: ; 0x02014400
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	ldr r4, _02014428 ; =_020F5F4C
	add r5, r3, #0
	add r3, sp, #4
	add r7, r0, #0
	mov ip, r1
	add r6, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r7, #0
	mov r1, ip
	add r3, r6, #0
	str r5, [sp]
	bl sub_020143E0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02014428: .word _020F5F4C
	thumb_func_end sub_02014400

	thumb_func_start sub_0201442C
sub_0201442C: ; 0x0201442C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	mov r1, #0x32
	add r7, r2, #0
	add r5, r0, #0
	add r0, r7, #0
	lsl r1, r1, #6
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	add r3, r4, #0
	bl sub_02014400
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0201442C

	thumb_func_start sub_02014450
sub_02014450: ; 0x02014450
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	add r0, r7, #0
	mov r1, #0x20
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl AllocAndReadWholeNarcMemberByIdPair
	add r1, sp, #0
	add r5, r0, #0
	bl NNS_G2dGetUnpackedPaletteData
	cmp r0, #1
	beq _0201447C
	bl GF_AssertFail
_0201447C:
	ldr r0, [sp]
	add r1, r4, #0
	ldr r0, [r0, #0xc]
	mov r2, #0x20
	bl MIi_CpuCopy16
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02014450

	thumb_func_start sub_02014494
sub_02014494: ; 0x02014494
	push {r4, r5, r6, r7, lr}
	sub sp, #0x8c
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0xac]
	mov ip, r3
	add r5, r2, #0
	ldr r6, [sp, #0xa4]
	ldr r7, [sp, #0xa8]
	ldr r3, _0201450C ; =_020F5FCC
	str r1, [sp, #0x20]
	str r0, [sp, #0xac]
	add r2, sp, #0x2c
	mov r4, #0xc
_020144AE:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r4, r4, #1
	bne _020144AE
	mov r0, #0
	str r0, [sp, #0x28]
	ldr r0, [sp, #0xa0]
	ldr r1, [sp, #0x20]
	str r0, [sp]
	str r6, [sp, #4]
	ldr r0, [sp, #0xb0]
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0xb4]
	add r2, r5, #0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xb8]
	mov r3, ip
	str r0, [sp, #0x14]
	ldr r0, [sp, #0xbc]
	str r0, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	bl sub_02014178
	str r0, [sp, #0x24]
	mov r4, #0
	add r5, sp, #0x2c
_020144E4:
	ldr r0, [sp, #0x24]
	add r1, r7, #0
	str r0, [sp]
	ldr r0, [sp, #0xac]
	add r2, r5, #0
	str r0, [sp, #4]
	add r0, r6, #0
	add r3, sp, #0x28
	bl sub_02014350
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #6
	blt _020144E4
	ldr r0, [sp, #0x24]
	bl FreeToHeap
	add sp, #0x8c
	pop {r4, r5, r6, r7, pc}
	nop
_0201450C: .word _020F5FCC
	thumb_func_end sub_02014494

	thumb_func_start sub_02014510
sub_02014510: ; 0x02014510
	push {r4, lr}
	sub sp, #0x20
	ldr r4, [r3, #4]
	str r4, [sp]
	ldr r4, [r3, #8]
	str r4, [sp, #4]
	ldr r4, [r3, #0xc]
	str r4, [sp, #8]
	ldr r4, [sp, #0x28]
	str r4, [sp, #0xc]
	ldr r4, [sp, #0x2c]
	str r4, [sp, #0x10]
	ldr r4, [sp, #0x30]
	str r4, [sp, #0x14]
	ldr r4, [sp, #0x34]
	str r4, [sp, #0x18]
	ldr r4, [sp, #0x38]
	str r4, [sp, #0x1c]
	ldr r3, [r3]
	bl sub_02014494
	add sp, #0x20
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02014510

	thumb_func_start sub_02014540
sub_02014540: ; 0x02014540
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r4, _02014578 ; =_020F5F5C
	add r5, r3, #0
	add r3, sp, #0x14
	add r7, r0, #0
	mov ip, r1
	add r6, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [sp, #0x38]
	str r5, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	mov r1, ip
	str r0, [sp, #8]
	ldr r0, [sp, #0x40]
	add r3, r6, #0
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x44]
	str r0, [sp, #0x10]
	add r0, r7, #0
	bl sub_02014510
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02014578: .word _020F5F5C
	thumb_func_end sub_02014540

	thumb_func_start sub_0201457C
sub_0201457C: ; 0x0201457C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r1, [sp, #0x10]
	mov r1, #0x32
	add r5, r2, #0
	add r7, r0, #0
	add r0, r5, #0
	lsl r1, r1, #6
	add r4, r3, #0
	bl AllocFromHeap
	add r6, r0, #0
	ldr r0, [sp, #0x28]
	str r4, [sp]
	str r0, [sp, #4]
	ldr r0, [sp, #0x2c]
	ldr r1, [sp, #0x10]
	str r0, [sp, #8]
	ldr r0, [sp, #0x30]
	add r2, r5, #0
	str r0, [sp, #0xc]
	add r0, r7, #0
	add r3, r6, #0
	bl sub_02014540
	add r0, r6, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_0201457C

	thumb_func_start sub_020145B4
sub_020145B4: ; 0x020145B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	str r0, [sp, #8]
	ldr r0, [sp, #0x48]
	lsl r7, r1, #2
	str r0, [sp, #0x20]
	add r0, r3, #0
	add r1, r0, #0
	mul r1, r7
	str r1, [sp, #0x1c]
	add r0, r2, #0
	lsl r1, r0, #2
	ldr r0, [sp, #0x1c]
	str r1, [sp, #0x14]
	add r0, r1, r0
	str r0, [sp, #0x28]
	mov r0, #0
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x44]
	add r0, r3, #0
	add r0, r0, r1
	add r1, r3, #0
	str r2, [sp, #0xc]
	str r3, [sp, #0x10]
	str r0, [sp, #0x18]
	cmp r1, r0
	bge _0201462E
	ldr r1, [sp, #0x40]
	add r0, r2, #0
	add r6, r0, r1
_020145F0:
	ldr r4, [sp, #0xc]
	add r0, r4, #0
	cmp r0, r6
	bge _0201461C
	ldr r0, [sp, #0x1c]
	lsl r1, r0, #3
	ldr r0, [sp, #0x14]
	add r5, r0, r1
_02014600:
	str r5, [sp, #0x28]
	mov r0, #4
	str r0, [sp]
	ldr r0, [sp, #8]
	ldr r1, [sp, #0x20]
	add r2, sp, #0x28
	add r3, sp, #0x24
	str r7, [sp, #4]
	bl sub_02013FDC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r6
	blt _02014600
_0201461C:
	ldr r0, [sp, #0x1c]
	add r0, r0, r7
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x10]
	add r1, r0, #1
	ldr r0, [sp, #0x18]
	str r1, [sp, #0x10]
	cmp r1, r0
	blt _020145F0
_0201462E:
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020145B4
