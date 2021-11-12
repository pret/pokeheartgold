	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202E2F8
sub_0202E2F8: ; 0x0202E2F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202E306
	bl GF_AssertFail
_0202E306:
	ldr r0, _0202E340 ; =0x00002AA8
	ldr r0, [r5, r0]
	cmp r0, #0x1e
	blo _0202E312
	bl GF_AssertFail
_0202E312:
	cmp r4, #0x1e
	blt _0202E31A
	bl GF_AssertFail
_0202E31A:
	ldr r0, _0202E340 ; =0x00002AA8
	ldr r0, [r5, r0]
	sub r0, r0, #1
	sub r2, r0, r4
	bpl _0202E326
	add r2, #0x1e
_0202E326:
	mov r1, #0x5b
	lsl r1, r1, #2
	mul r1, r2
	mov r0, #0
	add r2, r5, r1
_0202E330:
	ldrh r1, [r2]
	cmp r1, #0
	beq _0202E33E
	add r0, r0, #1
	add r2, #0x3c
	cmp r0, #6
	blo _0202E330
_0202E33E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202E340: .word 0x00002AA8
	thumb_func_end sub_0202E2F8

	thumb_func_start sub_0202E344
sub_0202E344: ; 0x0202E344
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	cmp r5, #0
	bne _0202E356
	bl GF_AssertFail
_0202E356:
	ldr r0, _0202E3C0 ; =0x00002AA8
	ldr r0, [r5, r0]
	cmp r0, #0x1e
	blo _0202E362
	bl GF_AssertFail
_0202E362:
	cmp r6, #0x1e
	blt _0202E36A
	bl GF_AssertFail
_0202E36A:
	ldr r0, _0202E3C0 ; =0x00002AA8
	ldr r0, [r5, r0]
	sub r0, r0, #1
	sub r1, r0, r6
	bpl _0202E376
	add r1, #0x1e
_0202E376:
	mov r0, #0x5b
	lsl r0, r0, #2
	mul r0, r1
	add r1, r5, r0
	mov r0, #0x3c
	mul r0, r7
	add r5, r1, r0
	ldrh r0, [r1, r0]
	add r1, r5, #0
	add r1, #0xc
	strh r0, [r4, #0x10]
	ldrb r0, [r5, #2]
	strb r0, [r4, #0x12]
	ldr r0, [r5, #4]
	str r0, [r4, #8]
	ldr r0, [r5, #8]
	str r0, [r4, #0xc]
	ldrb r0, [r5, #3]
	strb r0, [r4, #0x13]
	ldr r0, [r4]
	bl CopyU16ArrayToString
	add r1, r5, #0
	ldr r0, [r4, #4]
	add r1, #0x22
	bl CopyU16ArrayToString
	mov r1, #0
_0202E3AE:
	ldrh r0, [r5, #0x32]
	add r1, r1, #1
	add r5, r5, #2
	strh r0, [r4, #0x14]
	add r4, r4, #2
	cmp r1, #4
	blt _0202E3AE
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202E3C0: .word 0x00002AA8
	thumb_func_end sub_0202E344

	thumb_func_start sub_0202E3C4
sub_0202E3C4: ; 0x0202E3C4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	cmp r5, #0
	bne _0202E3D4
	bl GF_AssertFail
_0202E3D4:
	ldr r0, _0202E418 ; =0x00002AA8
	ldr r0, [r5, r0]
	cmp r0, #0x1e
	blo _0202E3E0
	bl GF_AssertFail
_0202E3E0:
	cmp r6, #0x1e
	blt _0202E3E8
	bl GF_AssertFail
_0202E3E8:
	ldr r0, _0202E418 ; =0x00002AA8
	ldr r0, [r5, r0]
	sub r0, r0, #1
	sub r2, r0, r6
	bpl _0202E3F4
	add r2, #0x1e
_0202E3F4:
	mov r0, #0x5b
	lsl r0, r0, #2
	add r1, r2, #0
	mul r1, r0
	add r2, r5, r1
	sub r1, r0, #4
	ldrh r1, [r2, r1]
	str r1, [r4]
	sub r1, r0, #2
	ldrb r1, [r2, r1]
	sub r0, r0, #1
	str r1, [r4, #4]
	ldrb r0, [r2, r0]
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0xc]
	pop {r4, r5, r6, pc}
	nop
_0202E418: .word 0x00002AA8
	thumb_func_end sub_0202E3C4
