	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov120_0225F020
ov120_0225F020: ; 0x0225F020
	push {r4, lr}
	mov r1, #0x34
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x34
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov120_0225F020

	thumb_func_start ov120_0225F038
ov120_0225F038: ; 0x0225F038
	ldr r3, _0225F03C ; =FreeToHeap
	bx r3
	.balign 4, 0
_0225F03C: .word FreeToHeap
	thumb_func_end ov120_0225F038

	thumb_func_start ov120_0225F040
ov120_0225F040: ; 0x0225F040
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x30
	ldrb r0, [r0]
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r0, #0
	beq _0225F056
	bl GF_AssertFail
_0225F056:
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x24]
	add r0, r5, #0
	add r3, r7, #0
	bl ov01_021EFE34
	add r0, r5, #0
	ldr r1, [sp, #0x20]
	ldr r2, [sp, #0x28]
	add r0, #0x14
	add r3, r7, #0
	bl ov01_021EFE34
	ldr r0, [sp, #0x18]
	str r0, [r5, #0x28]
	add r0, sp, #0x2c
	ldrb r1, [r0]
	strh r4, [r5, #0x2c]
	add r0, r5, #0
	strh r6, [r5, #0x2e]
	add r0, #0x31
	strb r1, [r0]
	mov r0, #1
	add r5, #0x30
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov120_0225F040

	thumb_func_start ov120_0225F08C
ov120_0225F08C: ; 0x0225F08C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x30
	ldrb r1, [r1]
	cmp r1, #0
	bne _0225F0A2
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225F0A2:
	bl ov01_021EFE44
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x14
	bl ov01_021EFE44
	add r7, r5, #0
	ldr r1, [r4]
	orr r7, r0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r5, r0, #1
	mov r0, #0x2c
	ldr r1, [r4, #0x14]
	ldrsh r3, [r4, r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r6, r0, #1
	mov r0, #0x2e
	ldrsh r2, [r4, r0]
	add r0, r3, r5
	lsl r0, r0, #0x10
	sub r1, r2, r6
	asr r0, r0, #0x10
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x31
	ldrb r0, [r0]
	add r2, r2, r6
	sub r3, r3, r5
	str r0, [sp, #4]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	ldr r0, [r4, #0x28]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov01_021F0960
	add r0, r7, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov120_0225F08C

	thumb_func_start ov120_0225F0FC
ov120_0225F0FC: ; 0x0225F0FC
	push {r4, lr}
	mov r1, #0x45
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x45
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl memset
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov120_0225F0FC

	thumb_func_start ov120_0225F118
ov120_0225F118: ; 0x0225F118
	ldr r3, _0225F11C ; =FreeToHeap
	bx r3
	.balign 4, 0
_0225F11C: .word FreeToHeap
	thumb_func_end ov120_0225F118

	thumb_func_start ov120_0225F120
ov120_0225F120: ; 0x0225F120
	str r2, [r0]
	ldr r2, _0225F144 ; =0x0000010F
	strb r3, [r0, r2]
	sub r3, r2, #2
	strb r1, [r0, r3]
	mov r3, #0
	sub r1, r2, #3
	strb r3, [r0, r1]
	sub r1, r2, #1
	strb r3, [r0, r1]
	mov r3, #1
	add r1, r2, #1
	strb r3, [r0, r1]
	ldr r3, _0225F148 ; =ov120_0225F1E8
	add r0, r0, #4
	mov r1, #0x30
	bx r3
	nop
_0225F144: .word 0x0000010F
_0225F148: .word ov120_0225F1E8
	thumb_func_end ov120_0225F120

	thumb_func_start ov120_0225F14C
ov120_0225F14C: ; 0x0225F14C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	bne _0225F158
	bl GF_AssertFail
_0225F158:
	mov r1, #0x11
	lsl r1, r1, #4
	ldrb r0, [r4, r1]
	cmp r0, #0
	bne _0225F168
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_0225F168:
	sub r0, r1, #4
	ldrb r0, [r4, r0]
	cmp r0, #0x30
	bhs _0225F1CC
	sub r0, r1, #2
	ldrsb r0, [r4, r0]
	sub r2, r0, #1
	sub r0, r1, #2
	strb r2, [r4, r0]
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bgt _0225F1CC
	sub r0, r1, #3
	ldrb r2, [r4, r0]
	sub r0, r1, #2
	strb r2, [r4, r0]
	add r0, r4, #4
	bl ov120_0225F240
	lsr r3, r0, #0x1f
	lsl r1, r0, #0x1d
	lsr r0, r0, #3
	sub r1, r1, r3
	mov r2, #0x1d
	ror r1, r2
	add r1, r3, r1
	lsl r1, r1, #0x15
	asr r3, r1, #0x10
	lsl r0, r0, #0x15
	asr r1, r0, #0x10
	add r0, r3, #0
	add r0, #0x20
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add r2, #0xf2
	str r0, [sp]
	ldrb r0, [r4, r2]
	add r2, r1, #0
	add r2, #0x20
	str r0, [sp, #4]
	lsl r2, r2, #0x10
	ldr r0, [r4]
	asr r2, r2, #0x10
	bl ov01_021F0960
	mov r0, #0x43
	lsl r0, r0, #2
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
_0225F1CC:
	mov r0, #0x43
	lsl r0, r0, #2
	ldrb r1, [r4, r0]
	cmp r1, #0x30
	blo _0225F1E2
	mov r1, #0
	add r0, r0, #4
	strb r1, [r4, r0]
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_0225F1E2:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov120_0225F14C

	thumb_func_start ov120_0225F1E8
ov120_0225F1E8: ; 0x0225F1E8
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r5, r0, #0
	cmp r6, #0x80
	blo _0225F1F6
	bl GF_AssertFail
_0225F1F6:
	mov r0, #0
	cmp r6, #0
	bls _0225F208
	add r1, r5, #0
_0225F1FE:
	strh r0, [r1]
	add r0, r0, #1
	add r1, r1, #2
	cmp r0, r6
	blo _0225F1FE
_0225F208:
	mov r7, #0
	sub r0, r6, #1
	str r0, [sp]
	beq _0225F230
	add r4, r5, #0
_0225F212:
	bl LCRandom
	add r1, r6, #0
	bl _u32_div_f
	lsl r2, r1, #1
	ldrh r0, [r4]
	ldrh r1, [r5, r2]
	add r7, r7, #1
	strh r1, [r4]
	strh r0, [r5, r2]
	ldr r0, [sp]
	add r4, r4, #2
	cmp r7, r0
	blo _0225F212
_0225F230:
	mov r0, #1
	mov r1, #0
	lsl r0, r0, #8
	str r1, [r5, r0]
	add r0, r0, #4
	str r6, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov120_0225F1E8

	thumb_func_start ov120_0225F240
ov120_0225F240: ; 0x0225F240
	push {r3, r4}
	mov r2, #1
	lsl r2, r2, #8
	ldr r3, [r0, r2]
	add r1, r3, #1
	str r1, [r0, r2]
	lsl r1, r3, #1
	ldrh r3, [r0, r1]
	add r1, r2, #4
	ldr r4, [r0, r1]
	ldr r1, [r0, r2]
	cmp r1, r4
	bhi _0225F25C
	add r4, r1, #0
_0225F25C:
	mov r1, #1
	lsl r1, r1, #8
	str r4, [r0, r1]
	add r0, r3, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov120_0225F240

	thumb_func_start ov120_0225F268
ov120_0225F268: ; 0x0225F268
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0xcc
	add r6, r0, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xcc
	add r7, r0, #0
	bl memset
	mov r4, #0
	add r5, r7, #0
_0225F280:
	add r0, r6, #0
	bl ov120_0225F020
	str r0, [r5, #4]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x30
	blt _0225F280
	add r0, r7, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov120_0225F268

	thumb_func_start ov120_0225F294
ov120_0225F294: ; 0x0225F294
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bne _0225F29E
	bl GF_AssertFail
_0225F29E:
	mov r4, #0
	add r5, r6, #0
_0225F2A2:
	ldr r0, [r5, #4]
	bl ov120_0225F038
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x30
	blt _0225F2A2
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	thumb_func_end ov120_0225F294

	thumb_func_start ov120_0225F2B8
ov120_0225F2B8: ; 0x0225F2B8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bne _0225F2C8
	bl GF_AssertFail
_0225F2C8:
	str r7, [r5]
	add r0, sp, #8
	ldrb r1, [r0, #0x10]
	add r0, r5, #0
	add r0, #0xc9
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xc6
	strb r4, [r0]
	add r0, r5, #0
	add r0, #0xc7
	strb r6, [r0]
	add r0, r5, #0
	mov r1, #0
	add r0, #0xc4
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xc5
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xc8
	strb r4, [r0]
	add r0, r5, #0
	mov r1, #1
	add r0, #0xca
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xcb
	ldrb r0, [r0]
	mov r2, #1
	add r5, #0xcb
	bic r0, r2
	ldr r2, [sp, #0x1c]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	and r1, r2
	orr r0, r1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov120_0225F2B8

	thumb_func_start ov120_0225F318
ov120_0225F318: ; 0x0225F318
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	bne _0225F324
	bl GF_AssertFail
_0225F324:
	add r0, r5, #0
	add r0, #0xca
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225F334
	add sp, #0x28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225F334:
	add r0, r5, #0
	add r0, #0xc4
	ldrb r0, [r0]
	cmp r0, #0x18
	bhs _0225F436
	mov r1, #0xc8
	ldrsb r0, [r5, r1]
	sub r2, r0, #1
	add r0, r5, #0
	add r0, #0xc8
	strb r2, [r0]
	ldrsb r0, [r5, r1]
	cmp r0, #0
	bgt _0225F436
	add r0, r5, #0
	add r0, #0xc6
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0xc8
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xcb
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225F372
	add r0, r5, #0
	add r0, #0xc4
	ldrb r1, [r0]
	ldr r0, _0225F4D4 ; =ov120_0226032C
	b _0225F37A
_0225F372:
	add r0, r5, #0
	add r0, #0xc4
	ldrb r1, [r0]
	ldr r0, _0225F4D8 ; =ov120_022602FC
_0225F37A:
	ldrb r2, [r0, r1]
	ldr r0, [r5]
	mov r1, #0x1d
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x20
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0xc9
	ldrb r0, [r0]
	lsr r4, r2, #0x1f
	lsl r3, r2, #0x1d
	sub r3, r3, r4
	ror r3, r1
	add r1, r4, r3
	asr r3, r2, #2
	lsr r3, r3, #0x1d
	str r0, [sp, #0x14]
	lsl r0, r2, #2
	add r3, r2, r3
	asr r2, r3, #3
	add r3, r5, #0
	add r3, #0xc7
	add r0, r5, r0
	lsl r1, r1, #5
	lsl r2, r2, #5
	ldrb r3, [r3]
	ldr r0, [r0, #4]
	add r1, #0x10
	add r2, #0x10
	bl ov120_0225F040
	add r0, r5, #0
	add r0, #0xcb
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225F3D6
	add r0, r5, #0
	add r0, #0xc4
	ldrb r1, [r0]
	ldr r0, _0225F4D4 ; =ov120_0226032C
	b _0225F3DE
_0225F3D6:
	add r0, r5, #0
	add r0, #0xc4
	ldrb r1, [r0]
	ldr r0, _0225F4D8 ; =ov120_022602FC
_0225F3DE:
	ldrb r1, [r0, r1]
	mov r0, #0x2f
	sub r2, r0, r1
	ldr r0, [r5]
	lsr r4, r2, #0x1f
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r0, #0x20
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	lsl r3, r2, #0x1d
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0xc9
	ldrb r0, [r0]
	sub r3, r3, r4
	mov r1, #0x1d
	ror r3, r1
	add r1, r4, r3
	asr r3, r2, #2
	lsr r3, r3, #0x1d
	str r0, [sp, #0x14]
	lsl r0, r2, #2
	add r3, r2, r3
	asr r2, r3, #3
	add r3, r5, #0
	add r3, #0xc7
	add r0, r5, r0
	lsl r1, r1, #5
	lsl r2, r2, #5
	ldrb r3, [r3]
	ldr r0, [r0, #4]
	add r1, #0x10
	add r2, #0x10
	bl ov120_0225F040
	add r0, r5, #0
	add r0, #0xc4
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xc4
	strb r1, [r0]
_0225F436:
	add r0, r5, #0
	add r0, #0xc5
	ldrb r4, [r0]
	add r0, r5, #0
	add r0, #0xc4
	ldrb r0, [r0]
	cmp r4, r0
	bge _0225F4B0
	ldr r0, _0225F4D4 ; =ov120_0226032C
	add r7, r0, r4
	ldr r0, _0225F4D8 ; =ov120_022602FC
	add r6, r0, r4
	add r0, r5, #0
	str r0, [sp, #0x24]
	add r0, #0xc5
	str r0, [sp, #0x24]
_0225F456:
	add r0, r5, #0
	add r0, #0xcb
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225F46C
	ldrb r0, [r7]
	mov r1, #0x2f
	sub r1, r1, r0
	str r1, [sp, #0x18]
	b _0225F474
_0225F46C:
	ldrb r0, [r6]
	mov r1, #0x2f
	sub r1, r1, r0
	str r1, [sp, #0x18]
_0225F474:
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov120_0225F08C
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov120_0225F08C
	ldr r1, [sp, #0x20]
	orr r0, r1
	str r0, [sp, #0x1c]
	cmp r0, #1
	bne _0225F4A0
	ldr r0, [sp, #0x24]
	ldrb r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x24]
	strb r1, [r0]
_0225F4A0:
	add r0, r5, #0
	add r0, #0xc4
	ldrb r0, [r0]
	add r4, r4, #1
	add r7, r7, #1
	add r6, r6, #1
	cmp r4, r0
	blt _0225F456
_0225F4B0:
	add r0, r5, #0
	add r0, #0xc5
	ldrb r0, [r0]
	cmp r0, #0x18
	blo _0225F4CC
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _0225F4CC
	mov r0, #0
	add r5, #0xca
	strb r0, [r5]
	add sp, #0x28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225F4CC:
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225F4D4: .word ov120_0226032C
_0225F4D8: .word ov120_022602FC
	thumb_func_end ov120_0225F318

	thumb_func_start ov120_0225F4DC
ov120_0225F4DC: ; 0x0225F4DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	bne _0225F4E8
	bl GF_AssertFail
_0225F4E8:
	add r0, r5, #0
	add r0, #0xca
	ldrb r0, [r0]
	cmp r0, #0
	bne _0225F4F8
	add sp, #0x28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225F4F8:
	add r0, r5, #0
	add r0, #0xc4
	ldrb r0, [r0]
	cmp r0, #0x18
	bhs _0225F602
	mov r1, #0xc8
	ldrsb r0, [r5, r1]
	sub r2, r0, #1
	add r0, r5, #0
	add r0, #0xc8
	strb r2, [r0]
	ldrsb r0, [r5, r1]
	cmp r0, #0
	bgt _0225F602
	add r0, r5, #0
	add r0, #0xc6
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0xc8
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xcb
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225F538
	add r0, r5, #0
	add r0, #0xc4
	ldrb r1, [r0]
	ldr r0, _0225F6A4 ; =ov120_02260314
	ldrb r2, [r0, r1]
	b _0225F546
_0225F538:
	add r0, r5, #0
	add r0, #0xc4
	ldrb r1, [r0]
	ldr r0, _0225F6A4 ; =ov120_02260314
	ldrb r1, [r0, r1]
	mov r0, #0x2f
	sub r2, r0, r1
_0225F546:
	ldr r0, [r5]
	lsr r4, r2, #0x1f
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x20
	str r0, [sp, #0xc]
	lsl r3, r2, #0x1d
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0xc9
	ldrb r0, [r0]
	sub r3, r3, r4
	mov r1, #0x1d
	ror r3, r1
	add r1, r4, r3
	asr r3, r2, #2
	lsr r3, r3, #0x1d
	str r0, [sp, #0x14]
	lsl r0, r2, #2
	add r3, r2, r3
	asr r2, r3, #3
	add r3, r5, #0
	add r3, #0xc7
	add r0, r5, r0
	lsl r1, r1, #5
	lsl r2, r2, #5
	ldrb r3, [r3]
	ldr r0, [r0, #4]
	add r1, #0x10
	add r2, #0x10
	bl ov120_0225F040
	add r0, r5, #0
	add r0, #0xcb
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225F5A2
	add r0, r5, #0
	add r0, #0xc4
	ldrb r1, [r0]
	ldr r0, _0225F6A8 ; =ov120_022602E4
	ldrb r2, [r0, r1]
	b _0225F5B0
_0225F5A2:
	add r0, r5, #0
	add r0, #0xc4
	ldrb r1, [r0]
	ldr r0, _0225F6A8 ; =ov120_022602E4
	ldrb r1, [r0, r1]
	mov r0, #0x2f
	sub r2, r0, r1
_0225F5B0:
	ldr r0, [r5]
	lsr r4, r2, #0x1f
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x20
	str r0, [sp, #0xc]
	lsl r3, r2, #0x1d
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0xc9
	ldrb r0, [r0]
	sub r3, r3, r4
	mov r1, #0x1d
	ror r3, r1
	add r1, r4, r3
	asr r3, r2, #2
	lsr r3, r3, #0x1d
	str r0, [sp, #0x14]
	lsl r0, r2, #2
	add r3, r2, r3
	asr r2, r3, #3
	add r3, r5, #0
	add r3, #0xc7
	add r0, r5, r0
	lsl r1, r1, #5
	lsl r2, r2, #5
	ldrb r3, [r3]
	ldr r0, [r0, #4]
	add r1, #0x10
	add r2, #0x10
	bl ov120_0225F040
	add r0, r5, #0
	add r0, #0xc4
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xc4
	strb r1, [r0]
_0225F602:
	add r0, r5, #0
	add r0, #0xc5
	ldrb r7, [r0]
	add r0, r5, #0
	add r0, #0xc4
	ldrb r0, [r0]
	cmp r7, r0
	bge _0225F680
	ldr r0, _0225F6A4 ; =ov120_02260314
	add r6, r0, r7
	ldr r0, _0225F6A8 ; =ov120_022602E4
	add r4, r0, r7
	add r0, r5, #0
	str r0, [sp, #0x24]
	add r0, #0xc5
	str r0, [sp, #0x24]
_0225F622:
	add r0, r5, #0
	add r0, #0xcb
	ldrb r0, [r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _0225F636
	ldrb r1, [r4]
	ldrb r0, [r6]
	str r1, [sp, #0x18]
	b _0225F644
_0225F636:
	ldrb r1, [r6]
	ldrb r2, [r4]
	mov r0, #0x2f
	sub r0, r0, r1
	mov r1, #0x2f
	sub r1, r1, r2
	str r1, [sp, #0x18]
_0225F644:
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov120_0225F08C
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	bl ov120_0225F08C
	ldr r1, [sp, #0x20]
	orr r0, r1
	str r0, [sp, #0x1c]
	cmp r0, #1
	bne _0225F670
	ldr r0, [sp, #0x24]
	ldrb r0, [r0]
	add r1, r0, #1
	ldr r0, [sp, #0x24]
	strb r1, [r0]
_0225F670:
	add r0, r5, #0
	add r0, #0xc4
	ldrb r0, [r0]
	add r7, r7, #1
	add r6, r6, #1
	add r4, r4, #1
	cmp r7, r0
	blt _0225F622
_0225F680:
	add r0, r5, #0
	add r0, #0xc5
	ldrb r0, [r0]
	cmp r0, #0x18
	blo _0225F69C
	ldr r0, [sp, #0x1c]
	cmp r0, #1
	bne _0225F69C
	mov r0, #0
	add r5, #0xca
	strb r0, [r5]
	add sp, #0x28
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0225F69C:
	mov r0, #0
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0225F6A4: .word ov120_02260314
_0225F6A8: .word ov120_022602E4
	thumb_func_end ov120_0225F4DC

	thumb_func_start ov120_0225F6AC
ov120_0225F6AC: ; 0x0225F6AC
	strh r1, [r0]
	strh r1, [r0, #2]
	sub r1, r2, r1
	strh r1, [r0, #4]
	strh r3, [r0, #6]
	mov r1, #0
	strh r1, [r0, #8]
	bx lr
	thumb_func_end ov120_0225F6AC

	thumb_func_start ov120_0225F6BC
ov120_0225F6BC: ; 0x0225F6BC
	push {r4, lr}
	add r4, r0, #0
	ldrh r2, [r4, #8]
	mov r0, #2
	ldrsh r1, [r4, r0]
	asr r2, r2, #4
	lsl r3, r2, #2
	ldr r2, _0225F6F4 ; =FX_SinCosTable_
	mov r0, #4
	ldrsh r0, [r4, r0]
	ldrsh r2, [r2, r3]
	mul r2, r0
	asr r0, r2, #0xc
	add r0, r1, r0
	strh r0, [r4]
	mov r0, #6
	ldrsh r1, [r4, r0]
	ldr r0, _0225F6F8 ; =0x0000FFFF
	mul r0, r1
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	ldrh r1, [r4, #8]
	add r0, r1, r0
	strh r0, [r4, #8]
	pop {r4, pc}
	nop
_0225F6F4: .word FX_SinCosTable_
_0225F6F8: .word 0x0000FFFF
	thumb_func_end ov120_0225F6BC

	thumb_func_start ov120_0225F6FC
ov120_0225F6FC: ; 0x0225F6FC
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	thumb_func_end ov120_0225F6FC

	thumb_func_start ov120_0225F704
ov120_0225F704: ; 0x0225F704
	push {r3, lr}
	add r2, r0, #0
	add r0, r1, #0
	add r1, r2, #4
	ldr r2, [r2]
	blx r2
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov120_0225F704

	thumb_func_start ov120_0225F714
ov120_0225F714: ; 0x0225F714
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5]
	ldr r4, [r5, #0xc]
	cmp r0, #5
	bls _0225F726
	b _0225F892
_0225F726:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225F732: ; jump table
	.short _0225F73E - _0225F732 - 2 ; case 0
	.short _0225F7F8 - _0225F732 - 2 ; case 1
	.short _0225F810 - _0225F732 - 2 ; case 2
	.short _0225F81C - _0225F732 - 2 ; case 3
	.short _0225F826 - _0225F732 - 2 ; case 4
	.short _0225F842 - _0225F732 - 2 ; case 5
_0225F73E:
	mov r1, #0x67
	mov r0, #4
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x67
	str r0, [r5, #0xc]
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	ldr r4, [r5, #0xc]
	mov r0, #4
	mov r1, #1
	bl AllocWindows
	str r0, [r4]
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r5, #0x10]
	ldr r1, [r4]
	ldr r0, [r0, #8]
	mov r2, #3
	bl AddWindowParameterized
	mov r1, #0
	add r0, sp, #0x14
	strh r1, [r0]
	mov r0, #3
	add r1, sp, #0x14
	mov r2, #2
	mov r3, #0x1e
	bl BG_LoadPlttData
	ldr r0, [r4]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	bl ScheduleWindowCopyToVram
	add r0, r4, #0
	add r0, #0x10
	mov r1, #2
	mov r2, #1
	bl ov01_021F05C4
	mov r3, #6
	mov r0, #0
	lsl r3, r3, #6
	str r0, [sp]
	add r1, r4, r3
	add r2, r4, #0
	sub r3, #0x34
	ldr r0, [r5, #0x20]
	add r2, #0x10
	add r3, r4, r3
	bl ov120_0225F9D4
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	ldr r0, [r5, #0x10]
	ldr r1, _0225F8A4 ; =ov120_0225F8B0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x1c]
	str r0, [r4, #8]
	mov r0, #0x61
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov120_0225F6FC
	mov r0, #0x63
	lsl r0, r0, #2
	ldr r1, _0225F8A8 ; =ov120_0225F90C
	add r0, r4, r0
	bl ov120_0225F6FC
	mov r0, #0x65
	lsl r0, r0, #2
	ldr r1, _0225F8AC ; =ov120_0225F970
	add r0, r4, r0
	bl ov120_0225F6FC
	mov r0, #1
	str r0, [r5]
	b _0225F892
_0225F7F8:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	add r1, r0, #0
	sub r1, #0x11
	add r2, r1, #0
	add r3, r5, #4
	bl ov01_021EFCF8
	mov r0, #2
	str r0, [r5]
	b _0225F892
_0225F810:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0225F892
	mov r0, #3
	str r0, [r5]
	b _0225F892
_0225F81C:
	mov r0, #0
	str r0, [r4, #0xc]
	mov r0, #4
	str r0, [r5]
	b _0225F892
_0225F826:
	mov r0, #0x61
	lsl r0, r0, #2
	add r1, r4, r0
	ldr r0, [r4, #0xc]
	lsl r0, r0, #3
	add r0, r1, r0
	add r1, r4, #0
	bl ov120_0225F704
	cmp r0, #0
	beq _0225F892
	mov r0, #5
	str r0, [r5]
	b _0225F892
_0225F842:
	mov r0, #0
	bl sub_0200FC20
	ldr r1, [r5, #0x14]
	cmp r1, #0
	beq _0225F852
	mov r0, #1
	str r0, [r1]
_0225F852:
	ldr r0, [r4]
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, [r4]
	bl RemoveWindow
	ldr r0, [r4]
	mov r1, #1
	bl WindowArray_dtor
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl sub_02024758
	mov r1, #0x53
	add r0, r4, #0
	lsl r1, r1, #2
	add r0, #0x10
	add r1, r4, r1
	bl ov01_021F06EC
	add r4, #0x10
	add r0, r4, #0
	bl ov01_021F05F4
	add r0, r5, #0
	add r1, r6, #0
	bl ov01_021EFCDC
	add sp, #0x18
	pop {r4, r5, r6, pc}
_0225F892:
	ldr r0, [r5]
	cmp r0, #5
	beq _0225F89E
	ldr r0, [r4, #0x10]
	bl sub_0202457C
_0225F89E:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	nop
_0225F8A4: .word ov120_0225F8B0
_0225F8A8: .word ov120_0225F90C
_0225F8AC: .word ov120_0225F970
	thumb_func_end ov120_0225F714

	thumb_func_start ov120_0225F8B0
ov120_0225F8B0: ; 0x0225F8B0
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0225F8C6
	cmp r0, #1
	beq _0225F8DE
	cmp r0, #2
	beq _0225F8F6
	b _0225F904
_0225F8C6:
	mov r0, #4
	bl ov120_0225F0FC
	str r0, [r5, #4]
	ldr r2, [r5]
	mov r1, #0
	mov r3, #0xf
	bl ov120_0225F120
	mov r0, #1
	str r0, [r4]
	b _0225F908
_0225F8DE:
	ldr r0, [r5, #4]
	bl ov120_0225F14C
	add r6, r0, #0
	ldr r0, [r5]
	bl ScheduleWindowCopyToVram
	cmp r6, #0
	beq _0225F908
	mov r0, #2
	str r0, [r4]
	b _0225F908
_0225F8F6:
	ldr r0, [r5, #4]
	bl ov120_0225F118
	mov r0, #0
	str r0, [r4]
	mov r0, #1
	pop {r4, r5, r6, pc}
_0225F904:
	bl GF_AssertFail
_0225F908:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov120_0225F8B0

	thumb_func_start ov120_0225F90C
ov120_0225F90C: ; 0x0225F90C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _0225F922
	cmp r1, #1
	beq _0225F946
	cmp r1, #2
	beq _0225F954
	b _0225F964
_0225F922:
	ldr r0, [r0, #8]
	bl ov01_021FB514
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r1, #0x2a
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	str r0, [r4]
	b _0225F968
_0225F946:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225F968
	mov r0, #2
	str r0, [r4]
	b _0225F968
_0225F954:
	ldr r0, [r0, #8]
	bl ov01_021FB4F4
	mov r0, #0
	str r0, [r4]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_0225F964:
	bl GF_AssertFail
_0225F968:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov120_0225F90C

	thumb_func_start ov120_0225F970
ov120_0225F970: ; 0x0225F970
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _0225F986
	cmp r1, #1
	beq _0225F9AA
	cmp r1, #2
	beq _0225F9B8
	b _0225F9C8
_0225F986:
	ldr r0, [r0, #8]
	bl ov01_021FB514
	mov r0, #0x1c
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #4
	mov r1, #0x18
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl BeginNormalPaletteFade
	mov r0, #1
	str r0, [r4]
	b _0225F9CC
_0225F9AA:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _0225F9CC
	mov r0, #2
	str r0, [r4]
	b _0225F9CC
_0225F9B8:
	ldr r0, [r0, #8]
	bl ov01_021FB4F4
	mov r0, #0
	str r0, [r4]
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_0225F9C8:
	bl GF_AssertFail
_0225F9CC:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov120_0225F970

	thumb_func_start ov120_0225F9D4
ov120_0225F9D4: ; 0x0225F9D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x30]
	add r5, r1, #0
	add r4, r2, #0
	add r7, r3, #0
	cmp r0, #2
	bne _0225F9EA
	bl GF_AssertFail
_0225F9EA:
	ldr r0, [sp, #0x30]
	ldr r3, _0225FA48 ; =ov120_02260200
	lsl r6, r0, #4
	mov r0, #1
	str r0, [sp]
	ldr r0, _0225FA4C ; =ov120_022601F4
	ldr r3, [r3, r6]
	ldr r0, [r0, r6]
	add r1, r4, #0
	str r0, [sp, #4]
	ldr r0, _0225FA50 ; =ov120_022601FC
	add r2, r7, #0
	ldr r0, [r0, r6]
	str r0, [sp, #8]
	ldr r0, _0225FA54 ; =ov120_022601F8
	ldr r0, [r0, r6]
	str r0, [sp, #0xc]
	ldr r0, _0225FA58 ; =0x000927C0
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	bl ov01_021F0614
	mov r0, #0
	str r0, [sp]
	mov r2, #2
	mov r3, #6
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r7, #0
	lsl r2, r2, #0x12
	lsl r3, r3, #0x10
	bl ov01_021F0718
	str r0, [r5]
	mov r1, #1
	bl Set2dSpriteVisibleFlag
	ldr r0, [r5]
	mov r1, #0x10
	bl sub_02024ADC
	ldr r0, [r5]
	mov r1, #1
	bl sub_02024A04
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0225FA48: .word ov120_02260200
_0225FA4C: .word ov120_022601F4
_0225FA50: .word ov120_022601FC
_0225FA54: .word ov120_022601F8
_0225FA58: .word 0x000927C0
	thumb_func_end ov120_0225F9D4

	thumb_func_start ov120_0225FA5C
ov120_0225FA5C: ; 0x0225FA5C
	ldr r3, _0225FA64 ; =ov120_0225FA74
	mov r2, #1
	bx r3
	nop
_0225FA64: .word ov120_0225FA74
	thumb_func_end ov120_0225FA5C

	thumb_func_start ov120_0225FA68
ov120_0225FA68: ; 0x0225FA68
	ldr r3, _0225FA70 ; =ov120_0225FA74
	mov r2, #0
	bx r3
	nop
_0225FA70: .word ov120_0225FA74
	thumb_func_end ov120_0225FA68

	thumb_func_start ov120_0225FA74
ov120_0225FA74: ; 0x0225FA74
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	ldr r5, [r4, #0xc]
	cmp r0, #5
	bls _0225FA86
	b _0225FBA6
_0225FA86:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225FA92: ; jump table
	.short _0225FA9E - _0225FA92 - 2 ; case 0
	.short _0225FB10 - _0225FA92 - 2 ; case 1
	.short _0225FB32 - _0225FA92 - 2 ; case 2
	.short _0225FB40 - _0225FA92 - 2 ; case 3
	.short _0225FB5A - _0225FA92 - 2 ; case 4
	.short _0225FB74 - _0225FA92 - 2 ; case 5
_0225FA9E:
	mov r0, #4
	mov r1, #8
	bl AllocFromHeap
	str r0, [r4, #0xc]
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	ldr r5, [r4, #0xc]
	mov r0, #4
	mov r1, #1
	bl AllocWindows
	str r0, [r5]
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r4, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #8]
	mov r2, #3
	bl AddWindowParameterized
	mov r1, #0
	add r0, sp, #0x14
	strh r1, [r0]
	mov r0, #3
	add r1, sp, #0x14
	mov r2, #2
	mov r3, #0x1e
	bl BG_LoadPlttData
	ldr r0, [r5]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	bl ScheduleWindowCopyToVram
	mov r0, #4
	bl ov120_0225F268
	str r0, [r5, #4]
	mov r0, #1
	add sp, #0x18
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0225FB10:
	cmp r2, #0
	beq _0225FB18
	mov r1, #0x10
	b _0225FB1C
_0225FB18:
	mov r1, #0xf
	mvn r1, r1
_0225FB1C:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	add r2, r1, #0
	add r3, r4, #4
	bl ov01_021EFCF8
	mov r0, #2
	add sp, #0x18
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0225FB32:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0225FBA6
	mov r0, #3
	add sp, #0x18
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0225FB40:
	mov r0, #0xf
	str r0, [sp]
	str r2, [sp, #4]
	ldr r0, [r5, #4]
	ldr r3, [r5]
	mov r1, #0
	mov r2, #4
	bl ov120_0225F2B8
	mov r0, #4
	add sp, #0x18
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0225FB5A:
	ldr r0, [r5, #4]
	bl ov120_0225F318
	add r6, r0, #0
	ldr r0, [r5]
	bl ScheduleWindowCopyToVram
	cmp r6, #0
	beq _0225FBA6
	mov r0, #5
	add sp, #0x18
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0225FB74:
	mov r0, #0
	bl sub_0200FC20
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _0225FB84
	mov r0, #1
	str r0, [r1]
_0225FB84:
	ldr r0, [r5, #4]
	bl ov120_0225F294
	ldr r0, [r5]
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, [r5]
	bl RemoveWindow
	ldr r0, [r5]
	mov r1, #1
	bl WindowArray_dtor
	add r0, r4, #0
	add r1, r6, #0
	bl ov01_021EFCDC
_0225FBA6:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov120_0225FA74

	thumb_func_start ov120_0225FBAC
ov120_0225FBAC: ; 0x0225FBAC
	ldr r3, _0225FBB4 ; =ov120_0225FBC4
	mov r2, #1
	bx r3
	nop
_0225FBB4: .word ov120_0225FBC4
	thumb_func_end ov120_0225FBAC

	thumb_func_start ov120_0225FBB8
ov120_0225FBB8: ; 0x0225FBB8
	ldr r3, _0225FBC0 ; =ov120_0225FBC4
	mov r2, #0
	bx r3
	nop
_0225FBC0: .word ov120_0225FBC4
	thumb_func_end ov120_0225FBB8

	thumb_func_start ov120_0225FBC4
ov120_0225FBC4: ; 0x0225FBC4
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	ldr r5, [r4, #0xc]
	cmp r0, #5
	bls _0225FBD6
	b _0225FCF6
_0225FBD6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225FBE2: ; jump table
	.short _0225FBEE - _0225FBE2 - 2 ; case 0
	.short _0225FC60 - _0225FBE2 - 2 ; case 1
	.short _0225FC82 - _0225FBE2 - 2 ; case 2
	.short _0225FC90 - _0225FBE2 - 2 ; case 3
	.short _0225FCAA - _0225FBE2 - 2 ; case 4
	.short _0225FCC4 - _0225FBE2 - 2 ; case 5
_0225FBEE:
	mov r0, #4
	mov r1, #8
	bl AllocFromHeap
	str r0, [r4, #0xc]
	mov r1, #0
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	ldr r5, [r4, #0xc]
	mov r0, #4
	mov r1, #1
	bl AllocWindows
	str r0, [r5]
	mov r3, #0
	str r3, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r3, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r4, #0x10]
	ldr r1, [r5]
	ldr r0, [r0, #8]
	mov r2, #3
	bl AddWindowParameterized
	mov r1, #0
	add r0, sp, #0x14
	strh r1, [r0]
	mov r0, #3
	add r1, sp, #0x14
	mov r2, #2
	mov r3, #0x1e
	bl BG_LoadPlttData
	ldr r0, [r5]
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5]
	bl ScheduleWindowCopyToVram
	mov r0, #4
	bl ov120_0225F268
	str r0, [r5, #4]
	mov r0, #1
	add sp, #0x18
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0225FC60:
	cmp r2, #0
	beq _0225FC68
	mov r1, #0x10
	b _0225FC6C
_0225FC68:
	mov r1, #0xf
	mvn r1, r1
_0225FC6C:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	add r2, r1, #0
	add r3, r4, #4
	bl ov01_021EFCF8
	mov r0, #2
	add sp, #0x18
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0225FC82:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0225FCF6
	mov r0, #3
	add sp, #0x18
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0225FC90:
	mov r0, #0xf
	str r0, [sp]
	str r2, [sp, #4]
	ldr r0, [r5, #4]
	ldr r3, [r5]
	mov r1, #0
	mov r2, #4
	bl ov120_0225F2B8
	mov r0, #4
	add sp, #0x18
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0225FCAA:
	ldr r0, [r5, #4]
	bl ov120_0225F4DC
	add r6, r0, #0
	ldr r0, [r5]
	bl ScheduleWindowCopyToVram
	cmp r6, #0
	beq _0225FCF6
	mov r0, #5
	add sp, #0x18
	str r0, [r4]
	pop {r4, r5, r6, pc}
_0225FCC4:
	mov r0, #0
	bl sub_0200FC20
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _0225FCD4
	mov r0, #1
	str r0, [r1]
_0225FCD4:
	ldr r0, [r5, #4]
	bl ov120_0225F294
	ldr r0, [r5]
	bl ClearWindowTilemapAndCopyToVram
	ldr r0, [r5]
	bl RemoveWindow
	ldr r0, [r5]
	mov r1, #1
	bl WindowArray_dtor
	add r0, r4, #0
	add r1, r6, #0
	bl ov01_021EFCDC
_0225FCF6:
	add sp, #0x18
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov120_0225FBC4

	thumb_func_start ov120_0225FCFC
ov120_0225FCFC: ; 0x0225FCFC
	ldr r3, _0225FD04 ; =ov120_0225FF00
	mov r2, #1
	bx r3
	nop
_0225FD04: .word ov120_0225FF00
	thumb_func_end ov120_0225FCFC

	thumb_func_start ov120_0225FD08
ov120_0225FD08: ; 0x0225FD08
	ldr r3, _0225FD10 ; =ov120_0225FF00
	mov r2, #0
	bx r3
	nop
_0225FD10: .word ov120_0225FF00
	thumb_func_end ov120_0225FD08

	thumb_func_start ov120_0225FD14
ov120_0225FD14: ; 0x0225FD14
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r2, #0
	str r2, [sp]
	bl GfGfxLoader_LoadFromOpenNarc
	add r1, r5, #0
	add r4, r0, #0
	bl NNS_G2dGetUnpackedBGCharacterData
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov120_0225FD14

	thumb_func_start ov120_0225FD2C
ov120_0225FD2C: ; 0x0225FD2C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #4
	add r4, r3, #0
	str r0, [sp]
	add r0, r1, #0
	add r1, r2, #0
	mov r2, #0
	add r3, sp, #0xc
	bl GfGfxLoader_GetScrnDataFromOpenNarc
	ldr r2, [sp, #0xc]
	mov r3, #0
	lsl r1, r4, #0x18
	str r3, [sp]
	add r6, r0, #0
	ldrh r0, [r2]
	lsr r1, r1, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldrh r0, [r2, #2]
	add r2, #0xc
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #8]
	add r0, r5, #0
	bl LoadRectToBgTilemapRect
	ldr r1, [sp, #0xc]
	mov r2, #0
	ldrh r0, [r1]
	add r3, r2, #0
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp]
	ldrh r0, [r1, #2]
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	lsl r0, r0, #0x15
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	add r0, r5, #0
	str r2, [sp, #8]
	bl BgTilemapRectChangePalette
	add r0, r6, #0
	bl FreeToHeap
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ScheduleBgTilemapBufferTransfer
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov120_0225FD2C

	thumb_func_start ov120_0225FDA0
ov120_0225FDA0: ; 0x0225FDA0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	ldrh r2, [r4, #0x1e]
	ldr r1, [r4]
	cmp r2, #0
	beq _0225FDB8
	cmp r2, #1
	beq _0225FDD6
	cmp r2, #2
	beq _0225FDF4
	b _0225FE00
_0225FDB8:
	ldr r3, [r4, #0xc]
	mov r0, #0
	str r0, [sp]
	ldr r0, [r1, #0x10]
	ldr r2, [r3, #0x14]
	ldr r0, [r0, #8]
	ldr r3, [r3, #0x10]
	mov r1, #1
	bl BG_LoadCharTilesData
	ldrh r0, [r4, #0x1e]
	add sp, #4
	add r0, r0, #1
	strh r0, [r4, #0x1e]
	pop {r3, r4, pc}
_0225FDD6:
	ldr r3, [r4, #0x10]
	mov r0, #0
	str r0, [sp]
	ldr r0, [r1, #0x10]
	ldr r2, [r3, #0x14]
	ldr r0, [r0, #8]
	ldr r3, [r3, #0x10]
	mov r1, #3
	bl BG_LoadCharTilesData
	ldrh r0, [r4, #0x1e]
	add sp, #4
	add r0, r0, #1
	strh r0, [r4, #0x1e]
	pop {r3, r4, pc}
_0225FDF4:
	mov r1, #0
	str r1, [r4, #0x18]
	bl DestroySysTask
	add sp, #4
	pop {r3, r4, pc}
_0225FE00:
	bl GF_AssertFail
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov120_0225FDA0

	thumb_func_start ov120_0225FE08
ov120_0225FE08: ; 0x0225FE08
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r1, #0
	ldr r4, [r5]
	add r6, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bne _0225FE1C
	bl GF_AssertFail
_0225FE1C:
	ldrh r0, [r5, #0x1c]
	cmp r0, #0
	beq _0225FE2C
	cmp r0, #1
	beq _0225FE78
	cmp r0, #2
	beq _0225FEA4
	b _0225FEBE
_0225FE2C:
	mov r0, #0x20
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r2, #0
	ldr r0, [r4, #0x20]
	mov r1, #0xa0
	add r3, r2, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	add r2, r5, #0
	ldr r0, [r4, #0x20]
	mov r1, #0xa1
	add r2, #0xc
	mov r3, #4
	bl ov120_0225FD14
	str r0, [r5, #4]
	add r2, r5, #0
	ldr r0, [r4, #0x20]
	mov r1, #0xa4
	add r2, #0x10
	mov r3, #4
	bl ov120_0225FD14
	str r0, [r5, #8]
	mov r2, #0
	ldr r0, _0225FEC8 ; =ov120_0225FDA0
	strh r2, [r5, #0x1e]
	add r1, r5, #0
	bl sub_0200E33C
	str r0, [r5, #0x18]
	ldrh r0, [r5, #0x1c]
	add sp, #8
	add r0, r0, #1
	strh r0, [r5, #0x1c]
	pop {r4, r5, r6, pc}
_0225FE78:
	ldr r0, [r5, #0x18]
	cmp r0, #0
	bne _0225FEC2
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x20]
	ldr r0, [r0, #8]
	mov r2, #0xa2
	mov r3, #1
	bl ov120_0225FD2C
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x20]
	ldr r0, [r0, #8]
	mov r2, #0xa5
	mov r3, #3
	bl ov120_0225FD2C
	ldrh r0, [r5, #0x1c]
	add sp, #8
	add r0, r0, #1
	strh r0, [r5, #0x1c]
	pop {r4, r5, r6, pc}
_0225FEA4:
	ldr r0, [r5, #4]
	bl FreeToHeap
	ldr r0, [r5, #8]
	bl FreeToHeap
	mov r0, #0
	str r0, [r5, #0x14]
	add r0, r6, #0
	bl DestroySysTask
	add sp, #8
	pop {r4, r5, r6, pc}
_0225FEBE:
	bl GF_AssertFail
_0225FEC2:
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_0225FEC8: .word ov120_0225FDA0
	thumb_func_end ov120_0225FE08

	thumb_func_start ov120_0225FECC
ov120_0225FECC: ; 0x0225FECC
	push {r4, lr}
	add r4, r0, #0
	str r1, [r4]
	mov r0, #0
	strh r0, [r4, #0x1c]
	ldr r0, _0225FEE4 ; =ov120_0225FE08
	add r1, r4, #0
	mov r2, #1
	bl CreateSysTask
	str r0, [r4, #0x14]
	pop {r4, pc}
	.balign 4, 0
_0225FEE4: .word ov120_0225FE08
	thumb_func_end ov120_0225FECC

	thumb_func_start ov120_0225FEE8
ov120_0225FEE8: ; 0x0225FEE8
	push {r4, lr}
	add r4, r0, #0
	bne _0225FEF2
	bl GF_AssertFail
_0225FEF2:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0225FEFC
	mov r0, #1
	pop {r4, pc}
_0225FEFC:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov120_0225FEE8

	thumb_func_start ov120_0225FF00
ov120_0225FF00: ; 0x0225FF00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r4, r1, #0
	add r7, r0, #0
	ldr r0, [r4]
	add r6, r2, #0
	ldr r5, [r4, #0xc]
	cmp r0, #7
	bhi _0225FFDA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0225FF1E: ; jump table
	.short _0225FF2E - _0225FF1E - 2 ; case 0
	.short _0225FFCE - _0225FF1E - 2 ; case 1
	.short _02260078 - _0225FF1E - 2 ; case 2
	.short _0226008C - _0225FF1E - 2 ; case 3
	.short _022600C4 - _0225FF1E - 2 ; case 4
	.short _022600D4 - _0225FF1E - 2 ; case 5
	.short _022600E8 - _0225FF1E - 2 ; case 6
	.short _022600F8 - _0225FF1E - 2 ; case 7
_0225FF2E:
	mov r0, #4
	mov r1, #0x70
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x70
	str r0, [r4, #0xc]
	bl memset
	mov r0, #2
	mov r1, #1
	ldr r5, [r4, #0xc]
	bl GX_EngineAToggleLayers
	mov r0, #8
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02260188 ; =0xFFFFE0FF
	and r1, r0
	mov r0, #0x15
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #8]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	ldr r2, _0226018C ; =ov120_022601BC
	ldr r0, [r0, #8]
	mov r1, #1
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x10]
	mov r1, #1
	ldr r0, [r0, #8]
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x10]
	mov r1, #3
	ldr r0, [r0, #8]
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x10]
	ldr r2, _02260190 ; =ov120_022601D8
	ldr r0, [r0, #8]
	mov r1, #3
	mov r3, #0
	bl InitBgFromTemplate
	ldr r0, [r4, #0x10]
	mov r1, #3
	ldr r0, [r0, #8]
	bl BgClearTilemapBufferAndCommit
	mov r0, #2
	mov r1, #0
	bl SetBgPriority
	mov r0, #8
	mov r1, #0
	bl SetBgPriority
	mov r0, #0x15
	bl GX_EngineASetLayers
	add r0, r5, #0
	add r0, #0x50
	add r1, r4, #0
	bl ov120_0225FECC
	mov r0, #1
	str r0, [r4]
	b _0226011A
_0225FFCE:
	add r0, r5, #0
	add r0, #0x50
	bl ov120_0225FEE8
	cmp r0, #0
	bne _0225FFDC
_0225FFDA:
	b _0226011A
_0225FFDC:
	mov r0, #1
	mov r1, #0
	bl BG_SetMaskColor
	mov r0, #0x12
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0
	mov r2, #5
	add r0, #0xc
	lsl r2, r2, #0x12
	add r3, r1, #0
	bl ov01_021EFEC8
	mov r0, #0x1e
	str r0, [sp]
	add r0, r5, #0
	mov r2, #5
	mov r3, #2
	add r0, #0x24
	mov r1, #0
	lsl r2, r2, #0x12
	lsl r3, r3, #0xe
	bl ov01_021EFEC8
	add r0, r5, #0
	add r0, #0x3c
	mov r1, #0
	mov r2, #0x10
	mov r3, #0xf
	bl ov120_0225F6AC
	ldr r0, [r4, #0x10]
	ldr r3, [r5, #0xc]
	mov r1, #3
	ldr r0, [r0, #8]
	add r2, r1, #0
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r2, #0
	ldr r0, [r0, #8]
	mov r1, #3
	add r3, r2, #0
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	ldr r3, [r5, #0x24]
	ldr r0, [r0, #8]
	mov r1, #1
	mov r2, #3
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r2, #0
	ldr r0, [r0, #8]
	mov r1, #1
	add r3, r2, #0
	bl ScheduleSetBgPosText
	cmp r6, #0
	beq _02260060
	mov r1, #0x10
	b _02260064
_02260060:
	mov r1, #0xf
	mvn r1, r1
_02260064:
	mov r0, #2
	str r0, [sp]
	mov r0, #1
	add r2, r1, #0
	add r3, r4, #4
	bl ov01_021EFCF8
	mov r0, #2
	str r0, [r4]
	b _0226011A
_02260078:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0226011A
	add r0, r5, #0
	mov r1, #4
	bl ov01_021F12B4
	mov r0, #3
	str r0, [r4]
	b _0226011A
_0226008C:
	mov r0, #0xa
	str r0, [r5, #0x48]
	mov r0, #3
	lsl r0, r0, #0xc
	str r0, [sp]
	mov r0, #0x19
	lsl r0, r0, #4
	str r0, [sp, #4]
	ldr r0, _02260194 ; =0x04000010
	mov r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	mov r0, #4
	str r0, [sp, #0x10]
	ldr r3, _02260198 ; =0x00000D52
	add r0, r5, #0
	mov r2, #0xbf
	bl ov01_021F12E8
	add r0, r5, #0
	mov r1, #1
	add r0, #0x4d
	strb r1, [r0]
	mov r0, #8
	bl GX_EngineAToggleLayers
	mov r0, #4
	str r0, [r4]
_022600C4:
	ldr r1, [r5, #0x48]
	sub r0, r1, #1
	str r0, [r5, #0x48]
	cmp r1, #0
	bne _0226011A
	mov r0, #5
	str r0, [r4]
	b _0226011A
_022600D4:
	add r0, r5, #0
	mov r1, #1
	add r0, #0x4c
	strb r1, [r0]
	mov r0, #2
	bl GX_EngineAToggleLayers
	mov r0, #6
	str r0, [r4]
	b _0226011A
_022600E8:
	add r0, r5, #0
	add r0, #0x4e
	ldrb r0, [r0]
	cmp r0, #0
	beq _0226011A
	mov r0, #7
	str r0, [r4]
	b _0226011A
_022600F8:
	mov r0, #0
	bl sub_0200FC20
	ldr r1, [r4, #0x14]
	cmp r1, #0
	beq _02260108
	mov r0, #1
	str r0, [r1]
_02260108:
	add r0, r5, #0
	bl ov01_021F12D0
	add r0, r4, #0
	add r1, r7, #0
	bl ov01_021EFCDC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
_0226011A:
	add r0, r5, #0
	add r0, #0x4c
	ldrb r0, [r0]
	cmp r0, #0
	beq _02260142
	add r0, r5, #0
	add r0, #0xc
	bl ov01_021EFF28
	add r1, r5, #0
	add r1, #0x4e
	strb r0, [r1]
	ldr r0, [r4, #0x10]
	ldr r3, [r5, #0xc]
	ldr r0, [r0, #8]
	mov r1, #1
	mov r2, #3
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
_02260142:
	add r0, r5, #0
	add r0, #0x4d
	ldrb r0, [r0]
	cmp r0, #0
	beq _02260182
	add r0, r5, #0
	add r0, #0x24
	bl ov01_021EFF28
	add r1, r5, #0
	add r1, #0x4f
	strb r0, [r1]
	add r0, r5, #0
	add r0, #0x3c
	bl ov120_0225F6BC
	ldr r0, [r4, #0x10]
	ldr r3, [r5, #0x24]
	mov r1, #3
	ldr r0, [r0, #8]
	add r2, r1, #0
	asr r3, r3, #0xc
	bl ScheduleSetBgPosText
	ldr r0, [r4, #0x10]
	mov r3, #0x3c
	ldrsh r3, [r5, r3]
	ldr r0, [r0, #8]
	mov r1, #3
	mov r2, #0
	bl ScheduleSetBgPosText
_02260182:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02260188: .word 0xFFFFE0FF
_0226018C: .word ov120_022601BC
_02260190: .word ov120_022601D8
_02260194: .word 0x04000010
_02260198: .word 0x00000D52
	thumb_func_end ov120_0225FF00

	.rodata

_0226019C:
	.byte 0x00, 0x00, 0x06, 0x00
	.byte 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x75, 0x31, 0x4C, 0x4D
	.byte 0x47, 0x82, 0x7B, 0x9F, 0x9D, 0x81, 0x9B, 0x4A, 0x75, 0x31, 0xFF, 0xFF

ov120_022601BC: ; 0x022601BC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x02, 0x01
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov120_022601D8: ; 0x022601D8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x04, 0x02, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov120_022601F4: ; 0x022601F4
	.byte 0x0A, 0x00, 0x00, 0x00

ov120_022601F8: ; 0x022601F8
	.byte 0x0B, 0x00, 0x00, 0x00

ov120_022601FC: ; 0x022601FC
	.byte 0x0C, 0x00, 0x00, 0x00

ov120_02260200: ; 0x02260200
	.byte 0x01, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0x05, 0x00
	.byte 0x06, 0x00, 0x07, 0x01, 0x0F, 0x01, 0x17, 0x01, 0x1F, 0x01, 0x27, 0x00, 0x26, 0x00, 0x25, 0x00
	.byte 0x24, 0x00, 0x23, 0x00, 0x22, 0x00, 0x21, 0x01, 0x19, 0x01, 0x11, 0x00, 0x12, 0x00, 0x13, 0x00
	.byte 0x14, 0x00, 0x15, 0x00, 0x00, 0x00, 0x80, 0x06, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x82, 0x06, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x84, 0x06, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x86, 0x06, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x01, 0x00, 0x2E, 0x00, 0x02, 0x00, 0x2D, 0x00
	.byte 0x03, 0x00, 0x2C, 0x00, 0x04, 0x00, 0x2B, 0x00, 0x05, 0x00, 0x2A, 0x00, 0x06, 0x00, 0x29, 0x00
	.byte 0x07, 0x01, 0x28, 0x01, 0x0F, 0x01, 0x20, 0x01, 0x17, 0x01, 0x18, 0x01, 0x1F, 0x01, 0x10, 0x01
	.byte 0x27, 0x00, 0x08, 0x00, 0x26, 0x00, 0x09, 0x00, 0x25, 0x00, 0x0A, 0x00, 0x24, 0x00, 0x0B, 0x00
	.byte 0x23, 0x00, 0x0C, 0x00, 0x22, 0x00, 0x0D, 0x00, 0x21, 0x01, 0x0E, 0x01, 0x19, 0x01, 0x16, 0x01
	.byte 0x11, 0x00, 0x1E, 0x00, 0x12, 0x00, 0x1D, 0x00, 0x13, 0x00, 0x1C, 0x00, 0x14, 0x00, 0x1B, 0x00
	.byte 0x15, 0x00, 0x1A, 0x00

ov120_022602E4: ; 0x022602E4
	.byte 0x01, 0x08, 0x03, 0x0A, 0x11, 0x18, 0x05, 0x0C, 0x13, 0x1A, 0x21, 0x28
	.byte 0x07, 0x0E, 0x15, 0x1C, 0x23, 0x2A, 0x17, 0x1E, 0x25, 0x2C, 0x27, 0x2E

ov120_022602FC: ; 0x022602FC
	.byte 0x07, 0x06, 0x05, 0x04
	.byte 0x03, 0x02, 0x01, 0x00, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x17, 0x16, 0x15, 0x14
	.byte 0x13, 0x12, 0x11, 0x10

ov120_02260314: ; 0x02260314
	.byte 0x00, 0x02, 0x09, 0x10, 0x04, 0x0B, 0x12, 0x19, 0x20, 0x06, 0x0D, 0x14
	.byte 0x1B, 0x22, 0x29, 0x0F, 0x16, 0x1D, 0x24, 0x2B, 0x1F, 0x26, 0x2D, 0x2F

ov120_0226032C: ; 0x0226032C
	.byte 0x00, 0x01, 0x02, 0x03
	.byte 0x04, 0x05, 0x06, 0x07, 0x0F, 0x0E, 0x0D, 0x0C, 0x0B, 0x0A, 0x09, 0x08, 0x10, 0x11, 0x12, 0x13
	.byte 0x14, 0x15, 0x16, 0x17
	; 0x02260344
