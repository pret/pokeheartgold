	.include "asm/macros.inc"
	.include "unk_02013FDC.inc"
	.include "global.inc"

	.rodata

	.global _020F5F44
_020F5F44:
	.word 0x147, 0x1EF
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

	.extern sub_02013FDC
	.extern sub_0201401C
	.extern sub_02014050
	.extern sub_020140E8
	.extern sub_02014128
	.extern sub_02014178
	.extern sub_02014298
	.extern sub_020142D4
	.extern sub_02014350

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
