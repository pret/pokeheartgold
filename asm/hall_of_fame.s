	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_0202E0DC
sub_0202E0DC: ; 0x0202E0DC
	ldr r0, _0202E0E0 ; =0x00002AB0
	bx lr
	.balign 4, 0
_0202E0E0: .word 0x00002AB0
	thumb_func_end sub_0202E0DC

	thumb_func_start sub_0202E0E4
sub_0202E0E4: ; 0x0202E0E4
	ldr r3, _0202E0F0 ; =MIi_CpuClear32
	add r1, r0, #0
	mov r0, #0
	ldr r2, _0202E0F4 ; =0x00002AB0
	bx r3
	nop
_0202E0F0: .word MIi_CpuClear32
_0202E0F4: .word 0x00002AB0
	thumb_func_end sub_0202E0E4

	thumb_func_start sub_0202E0F8
sub_0202E0F8: ; 0x0202E0F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	cmp r0, #0
	bne _0202E10A
	bl GF_AssertFail
_0202E10A:
	ldr r1, _0202E288 ; =0x00002AA8
	ldr r0, [sp]
	ldr r0, [r0, r1]
	cmp r0, #0x1e
	blo _0202E118
	bl GF_AssertFail
_0202E118:
	ldr r1, _0202E28C ; =0x00002AAC
	ldr r0, [sp]
	ldr r2, [r0, r1]
	ldr r0, _0202E290 ; =0x0000270F
	cmp r2, r0
	blo _0202E126
	b _0202E284
_0202E126:
	ldr r0, [sp]
	sub r1, r1, #4
	ldr r1, [r0, r1]
	mov r0, #0x5b
	lsl r0, r0, #2
	add r2, r1, #0
	mul r2, r0
	ldr r0, [sp]
	add r0, r0, r2
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	bl GetPartyCount
	str r0, [sp, #0x10]
	mov r0, #0xb
	mov r1, #0
	bl String_ctor
	mov r2, #0x5a
	add r6, r0, #0
	ldr r1, [sp, #0x14]
	mov r0, #0
	lsl r2, r2, #2
	bl sub_020D4790
	ldr r0, [sp, #0x10]
	mov r7, #0
	cmp r0, #0
	ble _0202E236
	ldr r5, [sp, #0x14]
_0202E162:
	ldr r0, [sp, #4]
	add r1, r7, #0
	bl GetPartyMonByIndex
	add r4, r0, #0
	bl sub_0206DD40
	str r0, [sp, #0xc]
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0202E226
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	strh r0, [r5]
	add r0, r4, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	strb r0, [r5, #2]
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	mov r1, #0
	strb r0, [r5, #3]
	add r0, r4, #0
	add r2, r1, #0
	bl GetMonData
	str r0, [r5, #4]
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	str r0, [r5, #8]
	add r0, r4, #0
	mov r1, #0x36
	mov r2, #0
	bl GetMonData
	strh r0, [r5, #0x32]
	add r0, r4, #0
	mov r1, #0x37
	mov r2, #0
	bl GetMonData
	strh r0, [r5, #0x34]
	add r0, r4, #0
	mov r1, #0x38
	mov r2, #0
	bl GetMonData
	strh r0, [r5, #0x36]
	add r0, r4, #0
	mov r1, #0x39
	mov r2, #0
	bl GetMonData
	strh r0, [r5, #0x38]
	cmp r6, #0
	beq _0202E21E
	add r0, r4, #0
	mov r1, #0x77
	add r2, r6, #0
	bl GetMonData
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0xc
	mov r2, #0xb
	bl CopyStringToU16Array
	add r0, r4, #0
	mov r1, #0x91
	add r2, r6, #0
	bl GetMonData
	add r1, r5, #0
	add r0, r6, #0
	add r1, #0x22
	mov r2, #8
	bl CopyStringToU16Array
	b _0202E224
_0202E21E:
	ldr r0, _0202E294 ; =0x0000FFFF
	strh r0, [r5, #0xc]
	strh r0, [r5, #0x22]
_0202E224:
	add r5, #0x3c
_0202E226:
	ldr r1, [sp, #0xc]
	add r0, r4, #0
	bl sub_0206DD8C
	ldr r0, [sp, #0x10]
	add r7, r7, #1
	cmp r7, r0
	blt _0202E162
_0202E236:
	ldr r0, [sp, #8]
	mov r1, #0x5a
	ldr r2, [r0]
	ldr r0, [sp, #0x14]
	lsl r1, r1, #2
	strh r2, [r0, r1]
	ldr r0, [sp, #8]
	add r2, r1, #2
	ldr r3, [r0, #4]
	ldr r0, [sp, #0x14]
	add r1, r1, #3
	strb r3, [r0, r2]
	ldr r0, [sp, #8]
	ldr r2, [r0, #8]
	ldr r0, [sp, #0x14]
	strb r2, [r0, r1]
	ldr r1, _0202E288 ; =0x00002AA8
	ldr r0, [sp]
	ldr r0, [r0, r1]
	add r2, r0, #1
	ldr r0, [sp]
	str r2, [r0, r1]
	ldr r0, [r0, r1]
	cmp r0, #0x1e
	blo _0202E26E
	ldr r0, [sp]
	mov r2, #0
	str r2, [r0, r1]
_0202E26E:
	ldr r1, _0202E28C ; =0x00002AAC
	ldr r0, [sp]
	ldr r0, [r0, r1]
	add r2, r0, #1
	ldr r0, [sp]
	cmp r6, #0
	str r2, [r0, r1]
	beq _0202E284
	add r0, r6, #0
	bl String_dtor
_0202E284:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202E288: .word 0x00002AA8
_0202E28C: .word 0x00002AAC
_0202E290: .word 0x0000270F
_0202E294: .word 0x0000FFFF
	thumb_func_end sub_0202E0F8

	thumb_func_start sub_0202E298
sub_0202E298: ; 0x0202E298
	push {r4, lr}
	add r4, r0, #0
	bne _0202E2A2
	bl GF_AssertFail
_0202E2A2:
	ldr r0, _0202E2BC ; =0x00002AA8
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	blo _0202E2AE
	bl GF_AssertFail
_0202E2AE:
	ldr r0, _0202E2C0 ; =0x00002AAC
	ldr r0, [r4, r0]
	cmp r0, #0x1e
	blo _0202E2B8
	mov r0, #0x1e
_0202E2B8:
	pop {r4, pc}
	nop
_0202E2BC: .word 0x00002AA8
_0202E2C0: .word 0x00002AAC
	thumb_func_end sub_0202E298

	thumb_func_start sub_0202E2C4
sub_0202E2C4: ; 0x0202E2C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _0202E2D2
	bl GF_AssertFail
_0202E2D2:
	ldr r0, _0202E2F0 ; =0x00002AA8
	ldr r0, [r5, r0]
	cmp r0, #0x1e
	blo _0202E2DE
	bl GF_AssertFail
_0202E2DE:
	cmp r4, #0x1e
	blt _0202E2E6
	bl GF_AssertFail
_0202E2E6:
	ldr r0, _0202E2F4 ; =0x00002AAC
	ldr r0, [r5, r0]
	sub r0, r0, r4
	pop {r3, r4, r5, pc}
	nop
_0202E2F0: .word 0x00002AA8
_0202E2F4: .word 0x00002AAC
	thumb_func_end sub_0202E2C4

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
