	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov07_0221BE20
ov07_0221BE20: ; 0x0221BE20
	add r1, r0, #0
	add r1, #0x8d
	ldrb r1, [r1]
	cmp r1, #0
	bne _0221BE32
	ldr r1, _0221BE40 ; =ov07_0221BE44
	add r0, #0xbc
	str r1, [r0]
	bx lr
_0221BE32:
	add r1, r0, #0
	add r1, #0x8d
	ldrb r1, [r1]
	add r0, #0x8d
	sub r1, r1, #1
	strb r1, [r0]
	bx lr
	.balign 4, 0
_0221BE40: .word ov07_0221BE44
	thumb_func_end ov07_0221BE20

	thumb_func_start ov07_0221BE44
ov07_0221BE44: ; 0x0221BE44
	push {r4, lr}
	add r4, r0, #0
_0221BE48:
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	bl ov07_0221F8B0
	add r1, r0, #0
	add r0, r4, #0
	blx r1
	add r0, r4, #0
	add r0, #0x8d
	ldrb r0, [r0]
	cmp r0, #0
	bne _0221BE66
	ldr r0, [r4, #0x10]
	cmp r0, #1
	beq _0221BE48
_0221BE66:
	pop {r4, pc}
	thumb_func_end ov07_0221BE44

	thumb_func_start ov07_0221BE68
ov07_0221BE68: ; 0x0221BE68
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	cmp r0, #1
	beq _0221BE78
	cmp r0, #2
	beq _0221BE86
	b _0221BE94
_0221BE78:
	add r0, r1, #0
	add r0, #0x8e
	ldrh r0, [r0]
	add r1, #0x8e
	add r0, r0, #1
	strh r0, [r1]
	b _0221BE98
_0221BE86:
	add r0, r1, #0
	add r0, #0x90
	ldrh r0, [r0]
	add r1, #0x90
	add r0, r0, #1
	strh r0, [r1]
	b _0221BE98
_0221BE94:
	bl GF_AssertFail
_0221BE98:
	ldr r2, [sp, #0x10]
	add r0, r5, #0
	add r1, r4, #0
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221BE68

	thumb_func_start ov07_0221BEA4
ov07_0221BEA4: ; 0x0221BEA4
	push {r4, lr}
	add r4, r2, #0
	cmp r0, #1
	beq _0221BEB2
	cmp r0, #2
	beq _0221BEC0
	b _0221BECE
_0221BEB2:
	add r0, r1, #0
	add r0, #0x8e
	ldrh r0, [r0]
	add r1, #0x8e
	sub r0, r0, #1
	strh r0, [r1]
	b _0221BED2
_0221BEC0:
	add r0, r1, #0
	add r0, #0x90
	ldrh r0, [r0]
	add r1, #0x90
	sub r0, r0, #1
	strh r0, [r1]
	b _0221BED2
_0221BECE:
	bl GF_AssertFail
_0221BED2:
	add r0, r4, #0
	bl DestroySysTask
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0221BEA4

	thumb_func_start ov07_0221BEDC
ov07_0221BEDC: ; 0x0221BEDC
	push {r3, r4, r5, lr}
	mov r1, #0x72
	lsl r1, r1, #2
	add r5, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _0221BEF8
	cmp r4, #0
	bne _0221BEF4
	bl GF_AssertFail
_0221BEF4:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221BEF8:
	mov r2, #0x72
	mov r1, #0
	lsl r2, r2, #2
	bl memset
	mov r1, #0x47
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #8]
	ldr r0, [r4]
	lsl r1, r1, #2
	bl AllocFromHeap
	add r1, r4, #0
	add r1, #0xc0
	str r0, [r1]
	mov r0, #7
	add r1, r5, #0
	bl NARC_ctor
	mov r1, #0x1b
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #8
	add r1, r5, #0
	bl NARC_ctor
	mov r1, #0x6d
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x16
	add r1, r5, #0
	bl NARC_ctor
	mov r1, #0x6e
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x17
	add r1, r5, #0
	bl NARC_ctor
	mov r1, #0x6f
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x18
	add r1, r5, #0
	bl NARC_ctor
	mov r1, #7
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0x19
	add r1, r5, #0
	bl NARC_ctor
	mov r2, #0x71
	lsl r2, r2, #2
	str r0, [r4, r2]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	cmp r0, #0
	bne _0221BF80
	bne _0221BF7C
	bl GF_AssertFail
_0221BF7C:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221BF80:
	mov r1, #0
	sub r2, #0xa8
	bl memset
	mov r1, #0
	str r1, [r4, #0xc]
	str r1, [r4, #0x18]
	add r2, r4, #0
	add r3, r1, #0
_0221BF92:
	add r0, r2, #0
	add r0, #0xcc
	add r1, r1, #1
	add r2, r2, #4
	str r3, [r0]
	cmp r1, #4
	blt _0221BF92
	mov r0, #0x59
	add r2, r4, #0
	mov r1, #0
	lsl r0, r0, #2
_0221BFA8:
	add r3, r3, #1
	str r1, [r2, r0]
	add r2, r2, #4
	cmp r3, #5
	blt _0221BFA8
	mov r0, #0x5e
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r0, #1
	str r0, [r4, #0xc]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221BEDC

	thumb_func_start ov07_0221BFC0
ov07_0221BFC0: ; 0x0221BFC0
	push {r4, lr}
	add r4, r0, #0
	bne _0221BFCA
	bl GF_AssertFail
_0221BFCA:
	ldr r0, [r4, #8]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0221BFC0

	thumb_func_start ov07_0221BFD0
ov07_0221BFD0: ; 0x0221BFD0
	push {r4, lr}
	add r4, r0, #0
	bne _0221BFDA
	bl GF_AssertFail
_0221BFDA:
	ldr r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0221BFD0

	thumb_func_start ov07_0221BFE0
ov07_0221BFE0: ; 0x0221BFE0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl ov07_0221C3DC
	cmp r0, #0
	bne _0221BFF0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221BFF0:
	mov r6, #0x1b
	mov r4, #0
	add r5, r7, #0
	lsl r6, r6, #4
_0221BFF8:
	ldr r0, [r5, r6]
	bl NARC_dtor
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _0221BFF8
	add r0, r7, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl FreeToHeap
	add r0, r7, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0221BFE0

	thumb_func_start ov07_0221C01C
ov07_0221C01C: ; 0x0221C01C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x6c
	add r4, r0, #0
	add r5, r1, #0
	str r2, [sp]
	str r3, [sp, #4]
	bl ov07_0221C69C
	add r0, r4, #0
	bl ov07_0221C3DC
	cmp r0, #0
	bne _0221C03C
	add sp, #0x6c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0221C03C:
	mov r3, #0
	mov r2, #1
	add r1, r3, #0
_0221C042:
	add r0, r4, r3
	add r0, #0x6c
	strb r2, [r0]
	add r0, r4, r3
	add r0, #0x7c
	add r3, r3, #1
	strb r1, [r0]
	cmp r3, #0x10
	blt _0221C042
	add r3, r4, #0
	mov r0, #0
_0221C058:
	add r2, r3, #0
	add r2, #0x94
	add r1, r1, #1
	add r3, r3, #4
	str r0, [r2]
	cmp r1, #0xa
	blt _0221C058
	add r3, r4, #0
	mov r2, #0
_0221C06A:
	str r2, [r3, #0x30]
	add r1, r3, #0
	str r2, [r3, #0x28]
	add r1, #0x2c
	strb r2, [r1]
	add r1, r3, #0
	add r1, #0x2d
	add r0, r0, #1
	add r3, #0xc
	strb r2, [r1]
	cmp r0, #3
	blt _0221C06A
	add r0, r4, #0
	add r0, #0xc0
	ldrb r1, [r5]
	ldr r0, [r0]
	mov r3, #1
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldrb r1, [r5, #1]
	ldr r0, [r0]
	strb r1, [r0, #1]
	add r0, r4, #0
	add r0, #0xc0
	ldrh r1, [r5, #2]
	ldr r0, [r0]
	strh r1, [r0, #2]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r5, #4]
	ldr r0, [r0]
	str r1, [r0, #4]
	add r0, r4, #0
	add r0, #0xc0
	ldrh r1, [r5, #8]
	ldr r0, [r0]
	strh r1, [r0, #8]
	add r0, r4, #0
	add r0, #0xc0
	ldrh r1, [r5, #0xc]
	ldr r0, [r0]
	strh r1, [r0, #0xa]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r5, #0x10]
	ldr r0, [r0]
	str r1, [r0, #0xc]
	add r0, r4, #0
	add r0, #0xc0
	ldrh r1, [r5, #0xa]
	ldr r0, [r0]
	strh r1, [r0, #0x10]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r5, #0x54]
	ldr r0, [r0]
	strh r1, [r0, #0x12]
	add r0, r4, #0
	add r0, #0xc0
	ldrh r1, [r5, #0x14]
	ldr r0, [r0]
	strh r1, [r0, #0x14]
	add r0, r4, #0
	add r0, #0xc0
	ldrh r1, [r5, #0x16]
	ldr r0, [r0]
	strh r1, [r0, #0x16]
	add r0, r4, #0
	add r0, #0xc0
	ldr r2, [r0]
	mov r0, #0x46
	lsl r0, r0, #2
	ldr r1, [r2, r0]
	bic r1, r3
	ldrh r3, [r5, #0xe]
	lsl r3, r3, #0x1e
	lsr r6, r3, #0x1f
	mov r3, #1
	and r3, r6
	orr r1, r3
	str r1, [r2, r0]
	add r1, r4, #0
	add r1, #0xc0
	ldr r2, [r1]
	mov r3, #2
	ldr r1, [r2, r0]
	bic r1, r3
	ldrh r3, [r5, #0xe]
	lsl r3, r3, #0x1d
	lsr r3, r3, #0x1f
	lsl r3, r3, #0x1f
	lsr r3, r3, #0x1e
	orr r1, r3
	str r1, [r2, r0]
	add r1, r4, #0
	add r1, #0xc0
	ldr r2, [r1]
	mov r3, #4
	ldr r1, [r2, r0]
	bic r1, r3
	ldrh r3, [r5, #0xe]
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x1f
	lsl r3, r3, #0x1f
	lsr r3, r3, #0x1d
	orr r1, r3
	str r1, [r2, r0]
	ldr r0, [sp, #4]
	ldr r1, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, #0xac
	str r1, [r0]
	ldr r0, [sp, #4]
	ldr r0, [r0]
	cmp r0, #0
	bne _0221C15C
	bl GF_AssertFail
_0221C15C:
	ldr r0, [sp, #4]
	mov r2, #0
	ldr r1, [r0, #4]
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [sp, #4]
	add r7, r2, #0
	ldr r1, [r0, #8]
	add r0, r4, #0
	add r0, #0xc8
	str r1, [r0]
	ldr r0, [sp, #4]
	ldr r1, [r0, #0x30]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, #0xd4
	str r1, [r0]
	ldr r0, [sp, #4]
	add r1, r2, #0
	add r3, r0, #0
	mov ip, r3
_0221C18A:
	add r5, r4, #0
	add r5, #0xc0
	ldr r5, [r5]
	ldr r3, [r0, #0xc]
	add r5, r5, r1
	add r5, #0xb0
	str r3, [r5]
	ldr r3, [sp, #4]
	add r5, r4, #0
	add r5, #0xc0
	add r6, r3, r2
	ldr r5, [r5]
	ldrb r3, [r6, #0x1c]
	add r5, r5, r2
	add r5, #0xc0
	strb r3, [r5]
	add r5, r4, #0
	add r5, #0xc0
	ldr r5, [r5]
	ldr r3, [r0, #0x20]
	add r5, r5, r1
	add r5, #0xc4
	str r3, [r5]
	add r5, r4, #0
	add r5, #0xc0
	mov r3, ip
	ldr r5, [r5]
	ldrh r3, [r3, #0x34]
	add r5, r5, r7
	add r5, #0xd8
	strh r3, [r5]
	add r5, r4, #0
	add r3, r6, #0
	add r5, #0xc0
	add r3, #0x3c
	ldr r5, [r5]
	ldrb r3, [r3]
	add r5, r5, r2
	add r5, #0xe0
	strb r3, [r5]
	add r3, r6, #0
	add r5, r4, #0
	add r5, #0xc0
	add r3, #0x40
	ldr r5, [r5]
	ldrb r3, [r3]
	add r5, r5, r2
	add r5, #0xe4
	strb r3, [r5]
	add r5, r4, #0
	add r5, #0xc0
	add r6, #0x44
	ldr r5, [r5]
	ldrb r3, [r6]
	add r5, r5, r2
	add r5, #0xe8
	strb r3, [r5]
	add r5, r4, #0
	add r5, #0xc0
	ldr r5, [r5]
	ldr r3, [r0, #0x48]
	add r5, r5, r1
	add r5, #0xec
	str r3, [r5]
	add r5, r4, #0
	add r5, #0xc0
	ldr r5, [r5]
	ldr r3, [r0, #0x58]
	add r5, r5, r1
	add r5, #0xfc
	str r3, [r5]
	mov r3, ip
	add r3, r3, #2
	add r2, r2, #1
	add r0, r0, #4
	add r1, r1, #4
	add r7, r7, #2
	mov ip, r3
	cmp r2, #4
	blt _0221C18A
	ldr r5, [sp, #4]
	mov r2, #0x19
	lsl r2, r2, #4
	add r5, #0x6c
	add r3, r4, r2
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [sp, #4]
	add r0, #0x84
	ldr r3, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	add r0, r2, #0
	sub r0, #0x84
	str r3, [r1, r0]
	ldr r0, [sp, #4]
	add r0, #0x8c
	ldr r3, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	add r0, r2, #0
	sub r0, #0x7c
	str r3, [r1, r0]
	ldr r0, [sp, #4]
	add r0, #0x88
	ldr r3, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	add r0, r2, #0
	sub r0, #0x80
	str r3, [r1, r0]
	ldr r0, [sp]
	sub r2, #0x6e
	cmp r0, r2
	bne _0221C2AA
	ldr r5, _0221C37C ; =ov07_02234C64
	add r3, sp, #8
	mov r2, #0xc
_0221C284:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0221C284
	ldr r0, [r5]
	str r0, [r3]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #0x12]
	cmp r0, #0x18
	blo _0221C2A2
	mov r0, #0xa1
	str r0, [sp]
	b _0221C2AA
_0221C2A2:
	lsl r1, r0, #2
	add r0, sp, #8
	ldr r0, [r0, r1]
	str r0, [sp]
_0221C2AA:
	ldr r0, [sp]
	cmp r0, #0
	beq _0221C2B6
	ldr r1, _0221C380 ; =0x000001D3
	cmp r0, r1
	ble _0221C2BA
_0221C2B6:
	mov r0, #1
	str r0, [sp]
_0221C2BA:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x68]
	str r0, [r4, #4]
	ldr r1, [sp]
	ldr r2, [r4]
	bl AllocAndReadWholeNarcMemberByIdPair
	str r0, [r4, #0x14]
	cmp r0, #0
	bne _0221C2DA
	bne _0221C2D4
	bl GF_AssertFail
_0221C2D4:
	add sp, #0x6c
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0221C2DA:
	str r0, [r4, #0x18]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #0
	bl GetBgPriority
	mov r1, #0x6b
	lsl r1, r1, #2
	strb r0, [r4, r1]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #1
	bl GetBgPriority
	ldr r1, _0221C384 ; =0x000001AD
	strb r0, [r4, r1]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #2
	bl GetBgPriority
	ldr r1, _0221C388 ; =0x000001AE
	strb r0, [r4, r1]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #3
	bl GetBgPriority
	ldr r1, _0221C38C ; =0x000001AF
	mov r2, #0
	strb r0, [r4, r1]
	add r1, r4, #0
	add r5, r2, #0
_0221C324:
	add r0, r1, #0
	add r0, #0xdc
	add r2, r2, #1
	add r1, r1, #4
	str r5, [r0]
	cmp r2, #0xa
	blt _0221C324
	mov r0, #0x4f
	lsl r0, r0, #2
	add r1, r0, #0
	add r2, r4, #0
	mov r3, #0
	add r1, #0x14
_0221C33E:
	str r3, [r2, r0]
	str r3, [r2, r1]
	add r5, r5, #1
	add r2, r2, #4
	cmp r5, #5
	blt _0221C33E
	mov r0, #6
	add r1, r4, #0
	mov r2, #0
	lsl r0, r0, #6
_0221C352:
	add r3, r3, #1
	str r2, [r1, r0]
	add r1, r1, #4
	cmp r3, #4
	blt _0221C352
	add r0, r4, #0
	ldr r1, _0221C390 ; =ov07_0221BE44
	add r0, #0xbc
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x8d
	mov r1, #0xff
	strb r2, [r0]
	add r0, r1, #0
	add r0, #0xa9
	str r1, [r4, r0]
	mov r0, #1
	str r0, [r4, #0x10]
	add sp, #0x6c
	pop {r4, r5, r6, r7, pc}
	nop
_0221C37C: .word ov07_02234C64
_0221C380: .word 0x000001D3
_0221C384: .word 0x000001AD
_0221C388: .word 0x000001AE
_0221C38C: .word 0x000001AF
_0221C390: .word ov07_0221BE44
	thumb_func_end ov07_0221C01C

	thumb_func_start ov07_0221C394
ov07_0221C394: ; 0x0221C394
	push {r4, lr}
	add r4, r0, #0
	bl ov07_0221C3DC
	cmp r0, #0
	bne _0221C3A4
	mov r0, #0
	pop {r4, pc}
_0221C3A4:
	add r0, r4, #0
	add r4, #0xbc
	ldr r1, [r4]
	blx r1
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_0221C394

	thumb_func_start ov07_0221C3B0
ov07_0221C3B0: ; 0x0221C3B0
	ldr r0, [r0, #0x10]
	cmp r0, #1
	bne _0221C3BA
	mov r0, #1
	bx lr
_0221C3BA:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221C3B0

	thumb_func_start ov07_0221C3C0
ov07_0221C3C0: ; 0x0221C3C0
	push {r3, lr}
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0221C3D2
	bne _0221C3CE
	bl GF_AssertFail
_0221C3CE:
	mov r0, #0
	pop {r3, pc}
_0221C3D2:
	bl FreeToHeap
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_0221C3C0

	thumb_func_start ov07_0221C3DC
ov07_0221C3DC: ; 0x0221C3DC
	cmp r0, #0
	bne _0221C3E4
	mov r0, #0
	bx lr
_0221C3E4:
	ldr r0, [r0, #0xc]
	cmp r0, #1
	bne _0221C3EE
	mov r0, #1
	bx lr
_0221C3EE:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221C3DC

	thumb_func_start ov07_0221C3F4
ov07_0221C3F4: ; 0x0221C3F4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	str r3, [sp]
	mov r0, #1
	add r1, r6, #0
	add r2, r5, #0
	add r3, r4, #0
	bl ov07_0221BE68
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov07_0221C3F4

	thumb_func_start ov07_0221C410
ov07_0221C410: ; 0x0221C410
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _0221C428 ; =0x0000044C
	add r4, r1, #0
	add r3, r2, #0
	str r0, [sp]
	mov r0, #1
	add r1, r5, #0
	add r2, r4, #0
	bl ov07_0221BE68
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221C428: .word 0x0000044C
	thumb_func_end ov07_0221C410

	thumb_func_start ov07_0221C42C
ov07_0221C42C: ; 0x0221C42C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r6, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	str r3, [sp]
	mov r0, #2
	add r1, r6, #0
	add r2, r5, #0
	add r3, r4, #0
	bl ov07_0221BE68
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov07_0221C42C

	thumb_func_start ov07_0221C448
ov07_0221C448: ; 0x0221C448
	add r3, r0, #0
	add r2, r1, #0
	add r1, r3, #0
	ldr r3, _0221C454 ; =ov07_0221BEA4
	mov r0, #1
	bx r3
	.balign 4, 0
_0221C454: .word ov07_0221BEA4
	thumb_func_end ov07_0221C448

	thumb_func_start ov07_0221C458
ov07_0221C458: ; 0x0221C458
	add r3, r0, #0
	add r2, r1, #0
	add r1, r3, #0
	ldr r3, _0221C464 ; =ov07_0221BEA4
	mov r0, #2
	bx r3
	.balign 4, 0
_0221C464: .word ov07_0221BEA4
	thumb_func_end ov07_0221C458

	thumb_func_start ov07_0221C468
ov07_0221C468: ; 0x0221C468
	add r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #0x14]
	bx lr
	thumb_func_end ov07_0221C468

	thumb_func_start ov07_0221C470
ov07_0221C470: ; 0x0221C470
	add r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #0x16]
	bx lr
	thumb_func_end ov07_0221C470

	thumb_func_start ov07_0221C478
ov07_0221C478: ; 0x0221C478
	add r0, #0xc0
	ldr r1, [r0]
	ldr r0, [r1, #0x18]
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r0, [r0, #0x1c]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221C478

	thumb_func_start ov07_0221C488
ov07_0221C488: ; 0x0221C488
	add r0, #0xc0
	ldr r2, [r0]
	lsl r0, r1, #2
	add r0, r2, r0
	ldr r0, [r0, #0x1c]
	bx lr
	thumb_func_end ov07_0221C488

	thumb_func_start ov07_0221C494
ov07_0221C494: ; 0x0221C494
	add r0, #0xc0
	ldr r2, [r0]
	lsl r0, r1, #2
	add r0, r2, r0
	ldr r0, [r0, #0x5c]
	bx lr
	thumb_func_end ov07_0221C494

	thumb_func_start ov07_0221C4A0
ov07_0221C4A0: ; 0x0221C4A0
	add r0, #0xc4
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221C4A0

	thumb_func_start ov07_0221C4A8
ov07_0221C4A8: ; 0x0221C4A8
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	cmp r5, #0xa
	blt _0221C4B6
	bl GF_AssertFail
_0221C4B6:
	lsl r0, r5, #2
	add r0, r4, r0
	add r0, #0x94
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221C4A8

	thumb_func_start ov07_0221C4C0
ov07_0221C4C0: ; 0x0221C4C0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0xa
	blt _0221C4CE
	bl GF_AssertFail
_0221C4CE:
	cmp r5, #0
	bne _0221C4D6
	bl GF_AssertFail
_0221C4D6:
	add r5, #0xdc
	lsl r4, r4, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _0221C4E4
	bl GF_AssertFail
_0221C4E4:
	ldr r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221C4C0

	thumb_func_start ov07_0221C4E8
ov07_0221C4E8: ; 0x0221C4E8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #5
	blt _0221C4F6
	bl GF_AssertFail
_0221C4F6:
	cmp r5, #0
	bne _0221C4FE
	bl GF_AssertFail
_0221C4FE:
	mov r0, #0x4f
	lsl r0, r0, #2
	add r5, r5, r0
	lsl r4, r4, #2
	ldr r0, [r5, r4]
	cmp r0, #0
	bne _0221C510
	bl GF_AssertFail
_0221C510:
	ldr r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221C4E8

	thumb_func_start ov07_0221C514
ov07_0221C514: ; 0x0221C514
	push {r4, lr}
	add r4, r0, #0
	bne _0221C51E
	bl GF_AssertFail
_0221C51E:
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0221C514

	thumb_func_start ov07_0221C528
ov07_0221C528: ; 0x0221C528
	add r0, #0xcc
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221C528

	thumb_func_start ov07_0221C530
ov07_0221C530: ; 0x0221C530
	add r0, #0xc0
	ldr r0, [r0]
	add r0, #0xac
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221C530

	thumb_func_start ov07_0221C53C
ov07_0221C53C: ; 0x0221C53C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x3c
	bl AllocFromHeap
	add r4, r0, #0
	bne _0221C554
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221C554:
	mov r1, #0
	mov r2, #0x3c
	bl memset
	add r0, r5, #0
	add r0, #0x90
	ldrh r0, [r0]
	add r5, #0x90
	add r0, r0, #1
	strh r0, [r5]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221C53C

	thumb_func_start ov07_0221C56C
ov07_0221C56C: ; 0x0221C56C
	ldr r3, _0221C578 ; =CreateSysTask
	str r0, [r1, #0x38]
	ldr r0, _0221C57C ; =ov07_0221C584
	ldr r2, _0221C580 ; =0x0000044C
	bx r3
	nop
_0221C578: .word CreateSysTask
_0221C57C: .word ov07_0221C584
_0221C580: .word 0x0000044C
	thumb_func_end ov07_0221C56C

	thumb_func_start ov07_0221C584
ov07_0221C584: ; 0x0221C584
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4]
	add r5, r0, #0
	add r0, r4, #0
	lsl r2, r1, #2
	ldr r1, _0221C5C0 ; =ov07_02234C08
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #0
	bne _0221C5BE
	ldr r0, [r4, #0x38]
	add r1, r0, #0
	add r1, #0x90
	ldrh r1, [r1]
	cmp r1, #0
	beq _0221C5B2
	add r1, r0, #0
	add r1, #0x90
	ldrh r1, [r1]
	add r0, #0x90
	sub r1, r1, #1
	strh r1, [r0]
_0221C5B2:
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_0221C5BE:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221C5C0: .word ov07_02234C08
	thumb_func_end ov07_0221C584

	thumb_func_start ov07_0221C5C4
ov07_0221C5C4: ; 0x0221C5C4
	mov r0, #0
	bx lr
	thumb_func_end ov07_0221C5C4

	thumb_func_start ov07_0221C5C8
ov07_0221C5C8: ; 0x0221C5C8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r1, [r5, #4]
	add r0, r1, #1
	strb r0, [r5, #4]
	ldrb r0, [r5, #3]
	cmp r1, r0
	bhs _0221C5DC
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221C5DC:
	mov r0, #0
	strb r0, [r5, #4]
	ldr r2, [r5, #0x14]
	ldr r1, [r5, #0x10]
	mov r4, #1
	add r1, r2, r1
	str r1, [r5, #0x14]
	ldr r1, [r5, #0x10]
	cmp r1, #0
	bne _0221C5F4
	add r4, r0, #0
	b _0221C60C
_0221C5F4:
	ldr r2, [r5, #0xc]
	ldr r1, [r5, #8]
	cmp r1, r2
	ldr r1, [r5, #0x14]
	bge _0221C606
	cmp r1, r2
	blt _0221C60C
	add r4, r0, #0
	b _0221C60C
_0221C606:
	cmp r1, r2
	bgt _0221C60C
	add r4, r0, #0
_0221C60C:
	ldr r0, [r5, #0x14]
	bl sub_020061EC
	ldrh r0, [r5, #0x1a]
	bl IsSEPlaying
	cmp r0, #0
	bne _0221C61E
	mov r4, #0
_0221C61E:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0221C5C8

	thumb_func_start ov07_0221C624
ov07_0221C624: ; 0x0221C624
	ldr r3, _0221C628 ; =ov07_0221C5C8
	bx r3
	.balign 4, 0
_0221C628: .word ov07_0221C5C8
	thumb_func_end ov07_0221C624

	thumb_func_start ov07_0221C62C
ov07_0221C62C: ; 0x0221C62C
	ldr r3, _0221C630 ; =ov07_0221C5C8
	bx r3
	.balign 4, 0
_0221C630: .word ov07_0221C5C8
	thumb_func_end ov07_0221C62C

	thumb_func_start ov07_0221C634
ov07_0221C634: ; 0x0221C634
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrb r1, [r5, #4]
	add r0, r1, #1
	strb r0, [r5, #4]
	ldrb r0, [r5, #3]
	cmp r1, r0
	bhs _0221C648
	mov r0, #1
	pop {r3, r4, r5, pc}
_0221C648:
	mov r0, #0
	strb r0, [r5, #4]
	ldrb r0, [r5, #0x18]
	mov r4, #1
	sub r0, r0, #1
	strb r0, [r5, #0x18]
	ldrh r0, [r5, #0x1a]
	bl PlaySE
	ldrh r0, [r5, #0x1a]
	ldr r1, _0221C670 ; =0x0000FFFF
	ldr r2, [r5, #0x14]
	bl sub_020061B4
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	bne _0221C66C
	mov r4, #0
_0221C66C:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221C670: .word 0x0000FFFF
	thumb_func_end ov07_0221C634

	thumb_func_start ov07_0221C674
ov07_0221C674: ; 0x0221C674
	push {r4, lr}
	add r4, r0, #0
	ldrb r2, [r4, #3]
	mov r0, #1
	sub r1, r2, #1
	strb r1, [r4, #3]
	cmp r2, #0
	bne _0221C696
	ldrh r0, [r4, #0x1a]
	bl PlaySE
	ldrh r0, [r4, #0x1a]
	ldr r1, _0221C698 ; =0x0000FFFF
	ldr r2, [r4, #0x14]
	bl sub_020061B4
	mov r0, #0
_0221C696:
	pop {r4, pc}
	.balign 4, 0
_0221C698: .word 0x0000FFFF
	thumb_func_end ov07_0221C674

	thumb_func_start ov07_0221C69C
ov07_0221C69C: ; 0x0221C69C
	push {r3, lr}
	ldr r0, _0221C6B0 ; =0x04000050
	mov r3, #8
	mov r1, #0
	mov r2, #0x3f
	str r3, [sp]
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	nop
_0221C6B0: .word 0x04000050
	thumb_func_end ov07_0221C69C

	thumb_func_start ov07_0221C6B4
ov07_0221C6B4: ; 0x0221C6B4
	push {r3, r4}
	add r2, r0, #0
	mov r1, #1
	add r2, #0x8d
	strb r1, [r2]
	ldr r3, _0221C6E8 ; =gSystem
	lsl r2, r1, #9
	ldr r4, [r3, #0x44]
	tst r2, r4
	beq _0221C6E4
	add r2, r1, #0
	add r2, #0xff
	tst r2, r4
	beq _0221C6E4
	ldr r2, [r3, #0x48]
	lsl r1, r1, #0xa
	tst r1, r2
	beq _0221C6E4
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	mov r1, #0
	add r0, #0x8d
	strb r1, [r0]
_0221C6E4:
	pop {r3, r4}
	bx lr
	.balign 4, 0
_0221C6E8: .word gSystem
	thumb_func_end ov07_0221C6B4

	thumb_func_start ov07_0221C6EC
ov07_0221C6EC: ; 0x0221C6EC
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	add r1, r0, #0
	add r1, #0x8d
	strb r2, [r1]
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r1, _0221C708 ; =ov07_0221BE20
	add r0, #0xbc
	str r1, [r0]
	bx lr
	.balign 4, 0
_0221C708: .word ov07_0221BE20
	thumb_func_end ov07_0221C6EC

	thumb_func_start ov07_0221C70C
ov07_0221C70C: ; 0x0221C70C
	add r1, r0, #0
	add r1, #0x8e
	ldrh r1, [r1]
	cmp r1, #0
	bne _0221C724
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	mov r1, #0
	add r0, #0x8d
	strb r1, [r0]
	bx lr
_0221C724:
	mov r1, #1
	add r0, #0x8d
	strb r1, [r0]
	bx lr
	thumb_func_end ov07_0221C70C

	thumb_func_start ov07_0221C72C
ov07_0221C72C: ; 0x0221C72C
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r3, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	cmp r3, #0xa
	bhs _0221C74A
	lsl r1, r3, #2
	add r0, r0, r1
	add r0, #0x94
	str r2, [r0]
_0221C74A:
	bx lr
	thumb_func_end ov07_0221C72C

	thumb_func_start ov07_0221C74C
ov07_0221C74C: ; 0x0221C74C
	ldr r1, [r0, #0x18]
	mov r3, #0
	add r1, r1, #4
	str r1, [r0, #0x18]
	add r2, r3, #0
_0221C756:
	add r1, r0, #0
	add r1, #0x94
	add r3, r3, #1
	add r0, r0, #4
	str r2, [r1]
	cmp r3, #0xa
	blt _0221C756
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221C74C

	thumb_func_start ov07_0221C768
ov07_0221C768: ; 0x0221C768
	cmp r1, #5
	bhi _0221C7B4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0221C778: ; jump table
	.short _0221C784 - _0221C778 - 2 ; case 0
	.short _0221C78C - _0221C778 - 2 ; case 1
	.short _0221C794 - _0221C778 - 2 ; case 2
	.short _0221C79C - _0221C778 - 2 ; case 3
	.short _0221C7A4 - _0221C778 - 2 ; case 4
	.short _0221C7AC - _0221C778 - 2 ; case 5
_0221C784:
	add r0, #0xc0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bx lr
_0221C78C:
	add r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #8]
	bx lr
_0221C794:
	add r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #0xa]
	bx lr
_0221C79C:
	add r0, #0xc0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bx lr
_0221C7A4:
	add r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #0x10]
	bx lr
_0221C7AC:
	add r0, #0xc0
	ldr r0, [r0]
	ldrh r0, [r0, #0x12]
	bx lr
_0221C7B4:
	mov r0, #0
	bx lr
	thumb_func_end ov07_0221C768

	thumb_func_start ov07_0221C7B8
ov07_0221C7B8: ; 0x0221C7B8
	push {r3, r4, r5, r6, r7, lr}
	add r3, r0, #0
	mov r0, #0
	str r2, [sp]
	add r6, r0, #0
	add r5, r1, #0
	mov ip, r0
	add r7, r1, #0
_0221C7C8:
	add r2, r3, #0
	add r2, #0xc0
	ldr r2, [r2]
	add r2, r2, r6
	add r2, #0xb0
	ldr r2, [r2]
	str r2, [r5, #8]
	add r2, r3, #0
	add r2, #0xc0
	ldr r2, [r2]
	add r2, r2, r6
	add r2, #0xc4
	ldr r2, [r2]
	str r2, [r5, #0x18]
	add r2, r3, #0
	add r2, #0xc0
	ldr r4, [r2]
	mov r2, ip
	add r2, r4, r2
	add r2, #0xd8
	ldrh r2, [r2]
	strh r2, [r7, #0x28]
	add r2, r3, #0
	add r2, #0xc0
	ldr r2, [r2]
	add r7, r7, #2
	add r2, r2, r0
	add r2, #0xe0
	ldrb r4, [r2]
	add r2, r1, r0
	add r2, #0x30
	strb r4, [r2]
	add r2, r3, #0
	add r2, #0xc0
	ldr r2, [r2]
	add r2, r2, r0
	add r2, #0xe4
	ldrb r4, [r2]
	add r2, r1, r0
	add r2, #0x34
	strb r4, [r2]
	add r2, r3, #0
	add r2, #0xc0
	ldr r2, [r2]
	add r2, r2, r0
	add r2, #0xe8
	ldrb r4, [r2]
	add r2, r1, r0
	add r2, #0x38
	strb r4, [r2]
	add r2, r3, #0
	add r2, #0xc0
	ldr r2, [r2]
	add r2, r2, r6
	add r2, #0xec
	ldr r2, [r2]
	add r6, r6, #4
	str r2, [r5, #0x3c]
	add r2, r3, #0
	add r2, #0xc0
	ldr r2, [r2]
	add r5, r5, #4
	add r2, r2, r0
	add r2, #0xc0
	ldrb r4, [r2]
	add r2, r1, r0
	add r2, #0x4c
	strb r4, [r2]
	mov r2, ip
	add r2, r2, #2
	add r0, r0, #1
	mov ip, r2
	cmp r0, #4
	blt _0221C7C8
	ldr r0, [sp]
	cmp r0, #3
	bhi _0221C8C6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221C86E: ; jump table
	.short _0221C876 - _0221C86E - 2 ; case 0
	.short _0221C88A - _0221C86E - 2 ; case 1
	.short _0221C89E - _0221C86E - 2 ; case 2
	.short _0221C8B2 - _0221C86E - 2 ; case 3
_0221C876:
	add r0, r3, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r3, #0xc0
	ldrh r0, [r0, #0x14]
	str r0, [r1]
	ldr r0, [r3]
	ldrh r0, [r0, #0x16]
	str r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0221C88A:
	add r0, r3, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r3, #0xc0
	ldrh r0, [r0, #0x14]
	str r0, [r1]
	ldr r0, [r3]
	ldrh r0, [r0, #0x14]
	str r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0221C89E:
	add r0, r3, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r3, #0xc0
	ldrh r0, [r0, #0x14]
	str r0, [r1]
	ldr r0, [r3]
	ldrh r0, [r0, #0x14]
	str r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0221C8B2:
	add r0, r3, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r3, #0xc0
	ldrh r0, [r0, #0x14]
	str r0, [r1]
	ldr r0, [r3]
	ldrh r0, [r0, #0x14]
	str r0, [r1, #4]
	pop {r3, r4, r5, r6, r7, pc}
_0221C8C6:
	bl GF_AssertFail
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221C7B8

	thumb_func_start ov07_0221C8CC
ov07_0221C8CC: ; 0x0221C8CC
	push {r3, r4, r5, lr}
	sub sp, #0x50
	add r5, r0, #0
	ldr r1, [r5, #0x18]
	add r1, r1, #4
	str r1, [r5, #0x18]
	ldr r4, [r1]
	add r1, r1, #4
	str r1, [r5, #0x18]
	add r1, sp, #0
	add r2, r4, #0
	bl ov07_0221C7B8
	cmp r4, #2
	add r0, sp, #0
	bne _0221C8F6
	ldr r1, [r5]
	bl ov07_02234A20
	add sp, #0x50
	pop {r3, r4, r5, pc}
_0221C8F6:
	cmp r4, #3
	bne _0221C904
	ldr r1, [r5]
	bl ov07_0223475C
	add sp, #0x50
	pop {r3, r4, r5, pc}
_0221C904:
	ldr r1, [r5]
	bl ov07_0223474C
	add sp, #0x50
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0221C8CC

	thumb_func_start ov07_0221C910
ov07_0221C910: ; 0x0221C910
	push {r4, lr}
	sub sp, #0x50
	add r4, r0, #0
	ldr r1, [r4, #0x18]
	add r1, r1, #4
	str r1, [r4, #0x18]
	ldr r2, [r1]
	add r1, r1, #4
	str r1, [r4, #0x18]
	add r1, sp, #0
	bl ov07_0221C7B8
	ldr r1, [r4]
	add r0, sp, #0
	bl ov07_0223494C
	add sp, #0x50
	pop {r4, pc}
	thumb_func_end ov07_0221C910

	thumb_func_start ov07_0221C934
ov07_0221C934: ; 0x0221C934
	ldr r1, [r0, #0x18]
	mov r2, #0
	add r1, r1, #4
	str r1, [r0, #0x18]
	add r3, r0, #0
_0221C93E:
	ldr r1, [r3, #0x30]
	cmp r1, #1
	beq _0221C96A
	mov r1, #0xc
	mul r1, r2
	mov r2, #1
	add r1, r0, r1
	str r2, [r1, #0x30]
	add r2, r1, #0
	mov r3, #0
	add r2, #0x2c
	strb r3, [r2]
	ldr r2, [r0, #0x18]
	ldr r3, [r2]
	add r2, r1, #0
	add r2, #0x2d
	strb r3, [r2]
	ldr r2, [r0, #0x18]
	add r2, r2, #4
	str r2, [r0, #0x18]
	str r2, [r1, #0x28]
	bx lr
_0221C96A:
	add r2, r2, #1
	add r3, #0xc
	cmp r2, #3
	blt _0221C93E
	bx lr
	thumb_func_end ov07_0221C934

	thumb_func_start ov07_0221C974
ov07_0221C974: ; 0x0221C974
	push {r3, r4}
	ldr r1, [r0, #0x18]
	add r3, r0, #0
	add r1, r1, #4
	add r3, #0x18
	str r1, [r0, #0x18]
	mov r2, #2
_0221C982:
	ldr r1, [r3, #0x30]
	cmp r1, #0
	beq _0221C9B6
	add r4, r2, #0
	mov r1, #0xc
	add r2, r0, #0
	mul r4, r1
	add r2, #0x2c
	ldrb r1, [r2, r4]
	add r1, r1, #1
	strb r1, [r2, r4]
	ldrb r3, [r2, r4]
	add r2, r0, r4
	add r1, r2, #0
	add r1, #0x2d
	ldrb r1, [r1]
	cmp r3, r1
	bne _0221C9AE
	mov r0, #0
	str r0, [r2, #0x30]
	pop {r3, r4}
	bx lr
_0221C9AE:
	ldr r1, [r2, #0x28]
	str r1, [r0, #0x18]
	pop {r3, r4}
	bx lr
_0221C9B6:
	sub r3, #0xc
	sub r2, r2, #1
	bpl _0221C982
	pop {r3, r4}
	bx lr
	thumb_func_end ov07_0221C974

	thumb_func_start ov07_0221C9C0
ov07_0221C9C0: ; 0x0221C9C0
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0221CBAC ; =0x0000017E
	add r5, r0, #0
	ldrb r0, [r5, r1]
	mov r6, #0
	cmp r0, #1
	bhs _0221C9DE
	add r0, r5, #0
	mov r2, #1
	add r0, #0x8d
	strb r2, [r0]
	ldrb r0, [r5, r1]
	add r0, r0, #1
	strb r0, [r5, r1]
	pop {r3, r4, r5, r6, r7, pc}
_0221C9DE:
	add r7, r6, #0
	add r4, r6, #0
_0221C9E2:
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, r0, r4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0221C9F6
	bl sub_020154B0
	add r6, r6, r0
_0221C9F6:
	add r7, r7, #1
	add r4, r4, #4
	cmp r7, #0x10
	blt _0221C9E2
	cmp r6, #0
	bne _0221CA16
	add r0, r5, #0
	add r0, #0x8e
	ldrh r0, [r0]
	cmp r0, #0
	bne _0221CA16
	add r0, r5, #0
	add r0, #0x90
	ldrh r0, [r0]
	cmp r0, #0
	beq _0221CA26
_0221CA16:
	add r0, r5, #0
	mov r1, #1
	add r0, #0x8d
	strb r1, [r0]
	ldr r0, _0221CBB0 ; =0x0000017D
	mov r1, #0
	strb r1, [r5, r0]
	pop {r3, r4, r5, r6, r7, pc}
_0221CA26:
	bl GF_IsAnySEPlaying
	cmp r0, #0
	beq _0221CA50
	ldr r0, _0221CBB0 ; =0x0000017D
	ldrb r1, [r5, r0]
	add r1, r1, #1
	strb r1, [r5, r0]
	ldrb r1, [r5, r0]
	cmp r1, #0x5a
	bls _0221CA48
	mov r1, #0
	strb r1, [r5, r0]
	add r0, r5, #0
	add r0, #0x8d
	strb r1, [r0]
	b _0221CA50
_0221CA48:
	mov r0, #1
	add r5, #0x8d
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0221CA50:
	ldr r0, _0221CBB0 ; =0x0000017D
	mov r1, #0
	strb r1, [r5, r0]
	add r0, r0, #1
	strb r1, [r5, r0]
	add r0, r5, #0
	add r2, r1, #0
_0221CA5E:
	add r1, r1, #1
	str r2, [r0, #0x1c]
	add r0, r0, #4
	cmp r1, #3
	blt _0221CA5E
	add r1, r5, #0
	mov r4, #0
_0221CA6C:
	add r0, r1, #0
	str r4, [r1, #0x28]
	add r0, #0x2c
	strb r4, [r0]
	add r0, r1, #0
	add r0, #0x2d
	strb r4, [r0]
	str r4, [r1, #0x30]
	add r2, r2, #1
	add r1, #0xc
	cmp r2, #3
	blt _0221CA6C
	add r7, r5, #0
	mov r6, #0
_0221CA88:
	add r0, r7, #0
	add r0, #0xcc
	ldr r1, [r0]
	cmp r1, #0
	beq _0221CAA0
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200D998
_0221CAA0:
	add r0, r7, #0
	add r0, #0xcc
	add r4, r4, #1
	add r7, r7, #4
	str r6, [r0]
	cmp r4, #4
	blt _0221CA88
_0221CAAE:
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221D55C
	add r6, r6, #1
	cmp r6, #5
	blt _0221CAAE
	mov r6, #0
	add r4, r6, #0
	add r7, r6, #0
_0221CAC2:
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, r0, r4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0221CADE
	bl ov07_0221FF2C
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, r0, r4
	str r7, [r0, #0x1c]
_0221CADE:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #0x10
	blt _0221CAC2
	mov r0, #6
	lsl r0, r0, #6
	add r0, r5, r0
	mov r1, #5
	bl ov07_0221DD14
	bl ov12_0223C340
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221FAEC
	add r4, r0, #0
	add r0, r5, #0
	bl ov07_0221BFD0
	add r3, r0, #0
	lsl r0, r4, #0x18
	mov r1, #1
	lsr r0, r0, #0x18
	lsl r1, r1, #0xe
	mov r2, #0
	bl BG_ClearCharDataRange
	add r0, r5, #0
	bl ov07_0221C4A0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221FAEC
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	mov r0, #2
	mov r1, #1
	bl ToggleBgLayer
	mov r1, #0x6b
	lsl r1, r1, #2
	ldrb r1, [r5, r1]
	mov r0, #0
	bl SetBgPriority
	ldr r1, _0221CBB4 ; =0x000001AD
	mov r0, #1
	ldrb r1, [r5, r1]
	bl SetBgPriority
	ldr r1, _0221CBB8 ; =0x000001AE
	mov r0, #2
	ldrb r1, [r5, r1]
	bl SetBgPriority
	ldr r1, _0221CBBC ; =0x000001AF
	mov r0, #3
	ldrb r1, [r5, r1]
	bl SetBgPriority
	add r0, r5, #0
	add r0, #0xc4
	mov r2, #0
	ldr r0, [r0]
	mov r1, #2
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	add r0, #0xc4
	mov r2, #0
	ldr r0, [r0]
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	add r0, #0xc4
	mov r1, #3
	ldr r0, [r0]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r0, #0
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221CBAC: .word 0x0000017E
_0221CBB0: .word 0x0000017D
_0221CBB4: .word 0x000001AD
_0221CBB8: .word 0x000001AE
_0221CBBC: .word 0x000001AF
	thumb_func_end ov07_0221C9C0

	thumb_func_start ov07_0221CBC0
ov07_0221CBC0: ; 0x0221CBC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r4, [r0]
	add r1, r0, #4
	str r1, [r5, #0x18]
	ldr r0, [r1]
	str r0, [sp]
	add r0, r1, #4
	str r0, [r5, #0x18]
	ldr r7, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	str r4, [r0, #0x18]
	add r0, r5, r4
	add r0, #0x7c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221CC1E
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r6, r4, #2
	add r0, r0, r6
	ldr r0, [r0, #0x1c]
	add r1, sp, #4
	bl sub_020154D4
	mov r0, #0
	ldr r1, [sp, #8]
	mvn r0, r0
	mul r0, r1
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r1, sp, #4
	add r0, r0, r6
	ldr r0, [r0, #0x1c]
	bl sub_020154E4
_0221CC1E:
	add r0, r5, #0
	add r0, #0xc0
	add r1, r5, r4
	add r1, #0x6c
	ldr r0, [r0]
	lsl r6, r4, #2
	add r0, r0, r6
	ldrb r1, [r1]
	ldr r0, [r0, #0x1c]
	bl sub_02015528
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r1, [sp]
	add r0, r0, r6
	ldr r0, [r0, #0x1c]
	add r2, r7, #0
	add r3, r5, #0
	bl ov07_0221FF18
	add r5, #0xc0
	ldr r1, [r5]
	str r0, [r1, #0x5c]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0221CBC0

	thumb_func_start ov07_0221CC54
ov07_0221CC54: ; 0x0221CC54
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r4, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r7, [r0]
	add r1, r0, #4
	str r1, [r5, #0x18]
	ldr r0, [r1]
	add r1, r1, #4
	str r1, [r5, #0x18]
	str r0, [sp, #4]
	ldr r0, [r1]
	str r0, [sp]
	add r0, r1, #4
	str r0, [r5, #0x18]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	str r4, [r0, #0x18]
	add r0, r5, r4
	add r0, #0x7c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221CCBA
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r6, r4, #2
	add r0, r0, r6
	ldr r0, [r0, #0x1c]
	add r1, sp, #8
	bl sub_020154D4
	mov r0, #0
	ldr r1, [sp, #0xc]
	mvn r0, r0
	mul r0, r1
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r1, sp, #8
	add r0, r0, r6
	ldr r0, [r0, #0x1c]
	bl sub_020154E4
_0221CCBA:
	add r0, r5, #0
	add r0, #0xc0
	add r1, r5, r4
	add r1, #0x6c
	ldr r0, [r0]
	lsl r6, r4, #2
	add r0, r0, r6
	ldrb r1, [r1]
	ldr r0, [r0, #0x1c]
	bl sub_02015528
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r1, [sp, #4]
	add r0, r0, r6
	ldr r0, [r0, #0x1c]
	ldr r2, [sp]
	add r3, r5, #0
	bl ov07_0221FF18
	add r5, #0xc0
	ldr r2, [r5]
	lsl r1, r7, #2
	add r1, r2, r1
	str r0, [r1, #0x5c]
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0221CC54

	thumb_func_start ov07_0221CCF4
ov07_0221CCF4: ; 0x0221CCF4
	push {r4, r5, r6, lr}
	sub sp, #0x90
	ldr r5, _0221CD48 ; =ov07_02234CC8
	add r4, r0, #0
	add r3, sp, #0
	mov r2, #0x12
_0221CD00:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0221CD00
	add r0, r4, #0
	bl ov07_0221C468
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221C470
	add r6, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov07_02231924
	mov r1, #0x18
	add r3, r5, #0
	mul r3, r1
	add r2, sp, #0
	lsl r1, r0, #2
	add r0, r2, r3
	ldr r4, [r1, r0]
	cmp r4, #0xff
	bne _0221CD40
	bl GF_AssertFail
_0221CD40:
	sub r0, r4, #1
	add sp, #0x90
	pop {r4, r5, r6, pc}
	nop
_0221CD48: .word ov07_02234CC8
	thumb_func_end ov07_0221CCF4

	thumb_func_start ov07_0221CD4C
ov07_0221CD4C: ; 0x0221CD4C
	push {r4, r5, r6, lr}
	sub sp, #0x90
	ldr r5, _0221CDA0 ; =ov07_02234D58
	add r4, r0, #0
	add r3, sp, #0
	mov r2, #0x12
_0221CD58:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0221CD58
	add r0, r4, #0
	bl ov07_0221C468
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221C470
	add r6, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov07_02231924
	mov r1, #0x18
	add r3, r5, #0
	mul r3, r1
	add r2, sp, #0
	lsl r1, r0, #2
	add r0, r2, r3
	ldr r4, [r1, r0]
	cmp r4, #0xff
	bne _0221CD98
	bl GF_AssertFail
_0221CD98:
	add r0, r4, #0
	add sp, #0x90
	pop {r4, r5, r6, pc}
	nop
_0221CDA0: .word ov07_02234D58
	thumb_func_end ov07_0221CD4C

	thumb_func_start ov07_0221CDA4
ov07_0221CDA4: ; 0x0221CDA4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r0, #0
	ldr r1, [r5, #0x18]
	add r0, #0x18
	add r1, r1, #4
	str r1, [r5, #0x18]
	ldr r4, [r1]
	add r1, r1, #4
	str r1, [r5, #0x18]
	mov r1, #0
	add r2, sp, #0x10
_0221CDBC:
	ldr r3, [r5, #0x18]
	add r1, r1, #1
	ldr r3, [r3]
	str r3, [r2]
	ldr r3, [r0]
	add r2, r2, #4
	add r3, r3, #4
	str r3, [r0]
	cmp r1, #6
	blt _0221CDBC
	ldr r1, [r5, #0x18]
	ldr r1, [r1]
	str r1, [sp]
	ldr r1, [r0]
	add r1, r1, #4
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	str r4, [r0, #0x18]
	add r0, r5, r4
	add r0, #0x7c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221CE1A
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r6, r4, #2
	add r0, r0, r6
	ldr r0, [r0, #0x1c]
	add r1, sp, #4
	bl sub_020154D4
	mov r0, #0
	ldr r1, [sp, #8]
	mvn r0, r0
	mul r0, r1
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r1, sp, #4
	add r0, r0, r6
	ldr r0, [r0, #0x1c]
	bl sub_020154E4
_0221CE1A:
	add r0, r5, #0
	bl ov07_0221CCF4
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	add r1, r5, r4
	add r1, #0x6c
	ldr r0, [r0]
	lsl r6, r4, #2
	add r0, r0, r6
	ldrb r1, [r1]
	ldr r0, [r0, #0x1c]
	bl sub_02015528
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r2, r7, #2
	add r0, r0, r6
	add r1, sp, #0x10
	ldr r1, [r1, r2]
	ldr r0, [r0, #0x1c]
	ldr r2, [sp]
	add r3, r5, #0
	bl ov07_0221FF18
	add r5, #0xc0
	ldr r1, [r5]
	str r0, [r1, #0x5c]
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0221CDA4

	thumb_func_start ov07_0221CE5C
ov07_0221CE5C: ; 0x0221CE5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r1, [r5, #0x18]
	add r0, #0x18
	add r1, r1, #4
	str r1, [r5, #0x18]
	ldr r4, [r1]
	add r1, r1, #4
	str r1, [r5, #0x18]
	mov r1, #0
	add r2, sp, #0x10
_0221CE74:
	ldr r3, [r5, #0x18]
	add r1, r1, #1
	ldr r3, [r3]
	str r3, [r2]
	ldr r3, [r0]
	add r2, r2, #4
	add r3, r3, #4
	str r3, [r0]
	cmp r1, #4
	blt _0221CE74
	ldr r1, [r5, #0x18]
	ldr r1, [r1]
	str r1, [sp]
	ldr r1, [r0]
	add r1, r1, #4
	str r1, [r0]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	str r4, [r0, #0x18]
	add r0, r5, r4
	add r0, #0x7c
	ldrb r0, [r0]
	cmp r0, #0
	beq _0221CED2
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r6, r4, #2
	add r0, r0, r6
	ldr r0, [r0, #0x1c]
	add r1, sp, #4
	bl sub_020154D4
	mov r0, #0
	ldr r1, [sp, #8]
	mvn r0, r0
	mul r0, r1
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r1, sp, #4
	add r0, r0, r6
	ldr r0, [r0, #0x1c]
	bl sub_020154E4
_0221CED2:
	add r0, r5, #0
	bl ov07_0221CD4C
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	add r1, r5, r4
	add r1, #0x6c
	ldr r0, [r0]
	lsl r6, r4, #2
	add r0, r0, r6
	ldrb r1, [r1]
	ldr r0, [r0, #0x1c]
	bl sub_02015528
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r2, r7, #2
	add r0, r0, r6
	add r1, sp, #0x10
	ldr r1, [r1, r2]
	ldr r0, [r0, #0x1c]
	ldr r2, [sp]
	add r3, r5, #0
	bl ov07_0221FF18
	add r5, #0xc0
	ldr r1, [r5]
	str r0, [r1, #0x5c]
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0221CE5C

	thumb_func_start ov07_0221CF14
ov07_0221CF14: ; 0x0221CF14
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	add r5, r0, #0
	add r7, r6, #0
	add r4, r6, #0
_0221CF1E:
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, r0, r4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0221CF32
	bl sub_020154B0
	add r6, r6, r0
_0221CF32:
	add r7, r7, #1
	add r4, r4, #4
	cmp r7, #0x10
	blt _0221CF1E
	cmp r6, #0
	bne _0221CF4C
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	mov r0, #0
	add r5, #0x8d
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0221CF4C:
	mov r0, #1
	add r5, #0x8d
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221CF14

	thumb_func_start ov07_0221CF54
ov07_0221CF54: ; 0x0221CF54
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r4, r1, #2
	add r0, r0, r4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0221CF78
	bl GF_AssertFail
_0221CF78:
	ldr r0, [r5, #0x18]
	mov r2, #0
	ldr r1, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r5]
	bl ov07_0221FE88
	add r1, r5, #0
	add r1, #0xc0
	ldr r1, [r1]
	add r1, r1, r4
	str r0, [r1, #0x1c]
	add r0, r5, #0
	mov r1, #2
	add r0, #0x8d
	strb r1, [r0]
	ldr r0, _0221CFA4 ; =ov07_0221BE20
	add r5, #0xbc
	str r0, [r5]
	pop {r3, r4, r5, pc}
	nop
_0221CFA4: .word ov07_0221BE20
	thumb_func_end ov07_0221CF54

	thumb_func_start ov07_0221CFA8
ov07_0221CFA8: ; 0x0221CFA8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	add r0, r0, #4
	add r0, r0, #4
	str r0, [r5, #0x18]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r4, r1, #2
	add r0, r0, r4
	ldr r0, [r0, #0x1c]
	cmp r0, #0
	beq _0221CFCE
	bl GF_AssertFail
_0221CFCE:
	ldr r0, [r5, #0x18]
	mov r1, #0x60
	ldr r2, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r5]
	mov r3, #0
	bl ov07_0221FEB0
	add r1, r5, #0
	add r1, #0xc0
	ldr r1, [r1]
	add r1, r1, r4
	str r0, [r1, #0x1c]
	add r0, r5, #0
	mov r1, #2
	add r0, #0x8d
	strb r1, [r0]
	ldr r0, _0221CFFC ; =ov07_0221BE20
	add r5, #0xbc
	str r0, [r5]
	pop {r3, r4, r5, pc}
	nop
_0221CFFC: .word ov07_0221BE20
	thumb_func_end ov07_0221CFA8

	thumb_func_start ov07_0221D000
ov07_0221D000: ; 0x0221D000
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r4, r1, #2
	add r0, r0, r4
	ldr r0, [r0, #0x1c]
	bl ov07_0221FF2C
	add r5, #0xc0
	ldr r0, [r5]
	mov r1, #0
	add r0, r0, r4
	str r1, [r0, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221D000

	thumb_func_start ov07_0221D02C
ov07_0221D02C: ; 0x0221D02C
	ldr r1, [r0, #0x18]
	mov r3, #0
	add r1, r1, #4
	str r1, [r0, #0x18]
	add r2, r0, #0
_0221D036:
	ldr r1, [r2, #0x1c]
	cmp r1, #0
	bne _0221D052
	ldr r1, [r0, #0x18]
	add r2, r1, #4
	lsl r1, r3, #2
	add r1, r0, r1
	str r2, [r1, #0x1c]
	ldr r2, [r0, #0x18]
	ldr r1, [r2]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r0, #0x18]
	bx lr
_0221D052:
	add r3, r3, #1
	add r2, r2, #4
	cmp r3, #3
	blt _0221D036
	bx lr
	thumb_func_end ov07_0221D02C

	thumb_func_start ov07_0221D05C
ov07_0221D05C: ; 0x0221D05C
	ldr r1, [r0, #0x18]
	add r3, r0, #0
	add r1, r1, #4
	str r1, [r0, #0x18]
	mov r2, #2
	add r3, #8
_0221D068:
	ldr r1, [r3, #0x1c]
	cmp r1, #0
	beq _0221D07E
	add r3, r0, #0
	add r3, #0x1c
	lsl r2, r2, #2
	ldr r1, [r3, r2]
	str r1, [r0, #0x18]
	mov r0, #0
	str r0, [r3, r2]
	bx lr
_0221D07E:
	sub r3, r3, #4
	sub r2, r2, #1
	bpl _0221D068
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221D05C

	thumb_func_start ov07_0221D088
ov07_0221D088: ; 0x0221D088
	push {r3, r4}
	ldr r2, [r0, #0x18]
	add r1, r0, #0
	add r2, r2, #4
	str r2, [r0, #0x18]
	ldr r4, [r2]
	add r2, r2, #4
	str r2, [r0, #0x18]
	ldr r3, [r2]
	add r2, r2, #4
	str r2, [r0, #0x18]
	lsl r2, r4, #2
	add r2, r0, r2
	add r2, #0x94
	ldr r2, [r2]
	add r1, #0x18
	cmp r3, r2
	bne _0221D0B6
	ldr r1, [r0, #0x18]
	ldr r1, [r1]
	str r1, [r0, #0x18]
	pop {r3, r4}
	bx lr
_0221D0B6:
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	pop {r3, r4}
	bx lr
	thumb_func_end ov07_0221D088

	thumb_func_start ov07_0221D0C0
ov07_0221D0C0: ; 0x0221D0C0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	add r0, r0, #4
	str r0, [r4, #0x18]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl ov07_0221F8C4
	cmp r0, #0
	ldr r0, [r4, #0x18]
	beq _0221D0E0
	ldr r0, [r0]
	str r0, [r4, #0x18]
	pop {r4, pc}
_0221D0E0:
	add r0, r0, #4
	str r0, [r4, #0x18]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0221D0C0

	thumb_func_start ov07_0221D0E8
ov07_0221D0E8: ; 0x0221D0E8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	add r1, r0, #4
	str r1, [r4, #0x18]
	ldr r0, [r1]
	add r1, r1, #4
	str r1, [r4, #0x18]
	bl ov07_02223038
	add r7, r0, #0
	ldr r0, [r4, #0x18]
	add r2, r4, #0
	ldr r5, [r0]
	add r0, r0, #4
	add r2, #0x18
	mov r3, #0
	str r0, [r4, #0x18]
	cmp r5, #0
	bls _0221D12A
	add r6, r4, #0
_0221D112:
	ldr r0, [r4, #0x18]
	add r3, r3, #1
	ldr r1, [r0]
	add r0, r6, #0
	add r0, #0x94
	str r1, [r0]
	ldr r0, [r2]
	add r6, r6, #4
	add r0, r0, #4
	str r0, [r2]
	cmp r3, r5
	blo _0221D112
_0221D12A:
	cmp r3, #0xa
	bge _0221D142
	lsl r0, r3, #2
	add r2, r4, r0
	mov r1, #0
_0221D134:
	add r0, r2, #0
	add r0, #0x94
	add r3, r3, #1
	add r2, r2, #4
	str r1, [r0]
	cmp r3, #0xa
	blt _0221D134
_0221D142:
	add r0, r4, #0
	blx r7
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221D0E8

	thumb_func_start ov07_0221D148
ov07_0221D148: ; 0x0221D148
	ldr r2, [r0, #0x18]
	add r1, r0, #0
	add r2, r2, #4
	str r2, [r0, #0x18]
	add r2, r0, #0
	add r2, #0xc0
	ldr r2, [r2]
	add r1, #0x18
	ldrh r3, [r2, #0x10]
	mov r2, #1
	tst r2, r3
	beq _0221D166
	ldr r2, [r1]
	add r2, r2, #4
	str r2, [r1]
_0221D166:
	ldr r2, [r0, #0x18]
	ldr r1, [r2]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r0, #0x18]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221D148

	thumb_func_start ov07_0221D174
ov07_0221D174: ; 0x0221D174
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x18]
	add r1, r1, #4
	str r1, [r4, #0x18]
	ldr r2, [r1]
	add r1, r1, #4
	str r1, [r4, #0x18]
	cmp r2, #0
	bne _0221D196
	add r1, r4, #0
	add r1, #0xc0
	ldr r1, [r1]
	ldrh r1, [r1, #0x14]
	bl ov07_0223192C
	b _0221D1A2
_0221D196:
	add r1, r4, #0
	add r1, #0xc0
	ldr r1, [r1]
	ldrh r1, [r1, #0x16]
	bl ov07_0223192C
_0221D1A2:
	cmp r0, #4
	bne _0221D1AC
	ldr r0, [r4, #0x18]
	add r0, r0, #4
	str r0, [r4, #0x18]
_0221D1AC:
	ldr r1, [r4, #0x18]
	ldr r0, [r1]
	lsl r0, r0, #2
	add r0, r1, r0
	str r0, [r4, #0x18]
	pop {r4, pc}
	thumb_func_end ov07_0221D174

	thumb_func_start ov07_0221D1B8
ov07_0221D1B8: ; 0x0221D1B8
	push {r4, r5}
	sub sp, #0x10
	ldr r5, _0221D210 ; =ov07_02234B98
	add r2, sp, #0
	add r4, r0, #0
	add r3, r2, #0
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r1, [r4, #0x18]
	add r0, r4, #0
	add r1, r1, #4
	str r1, [r4, #0x18]
	add r1, r4, #0
	add r1, #0xc0
	ldr r1, [r1]
	add r0, #0x18
	ldr r1, [r1, #0xc]
	cmp r1, #0
	beq _0221D1FE
	ldr r2, [r0]
	add r2, r2, #4
	str r2, [r0]
	mov r2, #0
_0221D1EA:
	ldr r5, [r3]
	tst r5, r1
	bne _0221D1FE
	ldr r5, [r0]
	add r2, r2, #1
	add r5, r5, #4
	add r3, r3, #4
	str r5, [r0]
	cmp r2, #4
	blo _0221D1EA
_0221D1FE:
	ldr r1, [r4, #0x18]
	ldr r0, [r1]
	lsl r0, r0, #2
	add r0, r1, r0
	str r0, [r4, #0x18]
	add sp, #0x10
	pop {r4, r5}
	bx lr
	nop
_0221D210: .word ov07_02234B98
	thumb_func_end ov07_0221D1B8

	thumb_func_start ov07_0221D214
ov07_0221D214: ; 0x0221D214
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x18]
	add r1, r1, #4
	str r1, [r4, #0x18]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221D232
	ldr r1, [r4, #0x18]
	ldr r0, [r1]
	lsl r0, r0, #2
	add r0, r1, r0
	str r0, [r4, #0x18]
	pop {r4, pc}
_0221D232:
	ldr r0, [r4, #0x18]
	add r0, r0, #4
	str r0, [r4, #0x18]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0221D214

	thumb_func_start ov07_0221D23C
ov07_0221D23C: ; 0x0221D23C
	ldr r2, [r0, #0x18]
	add r1, r0, #0
	add r2, r2, #4
	str r2, [r0, #0x18]
	add r2, r0, #0
	add r2, #0xc0
	ldr r3, [r2]
	mov r2, #0x46
	lsl r2, r2, #2
	ldr r2, [r3, r2]
	add r1, #0x18
	lsl r2, r2, #0x1e
	asr r2, r2, #0x1f
	beq _0221D266
	ldr r0, [r0, #0x18]
	ldr r2, [r1]
	ldr r0, [r0]
	lsl r0, r0, #2
	add r0, r2, r0
	str r0, [r1]
	bx lr
_0221D266:
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221D23C

	thumb_func_start ov07_0221D270
ov07_0221D270: ; 0x0221D270
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5, #0x18]
	add r1, r1, #4
	str r1, [r5, #0x18]
	add r1, r5, #0
	add r1, #0xc0
	ldr r1, [r1]
	ldrh r1, [r1, #0x14]
	bl ov07_0223192C
	add r1, r5, #0
	add r1, #0xc0
	ldr r1, [r1]
	add r4, r0, #0
	ldrh r1, [r1, #0x16]
	add r0, r5, #0
	bl ov07_0223192C
	cmp r4, r0
	bne _0221D2A6
	ldr r1, [r5, #0x18]
	ldr r0, [r1]
	lsl r0, r0, #2
	add r0, r1, r0
	str r0, [r5, #0x18]
	pop {r3, r4, r5, pc}
_0221D2A6:
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0221D270

	thumb_func_start ov07_0221D2B0
ov07_0221D2B0: ; 0x0221D2B0
	ldr r2, [r0, #0x18]
	add r1, r0, #0
	add r2, r2, #4
	str r2, [r0, #0x18]
	ldr r3, [r2]
	add r2, r2, #4
	str r2, [r0, #0x18]
	add r2, r0, #0
	add r2, #0xc0
	ldr r2, [r2]
	add r1, #0x18
	ldrh r2, [r2, #0x10]
	cmp r3, r2
	bne _0221D2DA
	ldr r0, [r0, #0x18]
	ldr r2, [r1]
	ldr r0, [r0]
	lsl r0, r0, #2
	add r0, r2, r0
	str r0, [r1]
	bx lr
_0221D2DA:
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221D2B0

	thumb_func_start ov07_0221D2E4
ov07_0221D2E4: ; 0x0221D2E4
	ldr r1, [r0, #0x18]
	add r2, r1, #4
	str r2, [r0, #0x18]
	ldr r1, [r2]
	lsl r1, r1, #2
	add r1, r2, r1
	str r1, [r0, #0x18]
	bx lr
	thumb_func_end ov07_0221D2E4

	thumb_func_start ov07_0221D2F4
ov07_0221D2F4: ; 0x0221D2F4
	push {r3, lr}
	cmp r1, #0
	beq _0221D314
	mov r1, #1
	str r1, [sp]
	ldr r0, [r0, #4]
	mov r1, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r2, #0
	mov r3, #0x3c
	bl sub_0200B484
	pop {r3, pc}
_0221D314:
	mov r1, #1
	str r1, [sp]
	ldr r0, [r0, #4]
	mov r1, #0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r2, #0x10
	mov r3, #0x3c
	bl sub_0200B484
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_0221D2F4

	thumb_func_start ov07_0221D330
ov07_0221D330: ; 0x0221D330
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0200B594
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	beq _0221D370
	ldr r0, [r4, #4]
	lsl r0, r0, #0x17
	lsr r0, r0, #0x1f
	beq _0221D35E
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	bl ov07_0221C69C
	pop {r3, r4, r5, pc}
_0221D35E:
	add r0, r4, #0
	mov r1, #0
	bl ov07_0221D2F4
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r0, #8
	orr r0, r1
	str r0, [r4, #4]
_0221D370:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0221D330

	thumb_func_start ov07_0221D374
ov07_0221D374: ; 0x0221D374
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	str r5, [r4]
	ldr r0, [r5, #0x18]
	mov r1, #0xff
	add r2, r0, #4
	str r2, [r5, #0x18]
	ldr r0, [r4, #4]
	bic r0, r1
	ldr r1, [r2]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	orr r0, r1
	str r0, [r4, #4]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	bl sub_0200B528
	add r0, r4, #0
	mov r1, #1
	bl ov07_0221D2F4
	ldr r0, _0221D3C4 ; =ov07_0221D330
	ldr r2, _0221D3C8 ; =0x00001001
	add r1, r4, #0
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221D3C4: .word ov07_0221D330
_0221D3C8: .word 0x00001001
	thumb_func_end ov07_0221D374

	thumb_func_start ov07_0221D3CC
ov07_0221D3CC: ; 0x0221D3CC
	push {r4, r5, r6, lr}
	add r4, r0, #0
	cmp r1, #7
	bhi _0221D4AA
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0221D3E0: ; jump table
	.short _0221D3F0 - _0221D3E0 - 2 ; case 0
	.short _0221D3F8 - _0221D3E0 - 2 ; case 1
	.short _0221D400 - _0221D3E0 - 2 ; case 2
	.short _0221D40E - _0221D3E0 - 2 ; case 3
	.short _0221D41C - _0221D3E0 - 2 ; case 4
	.short _0221D442 - _0221D3E0 - 2 ; case 5
	.short _0221D468 - _0221D3E0 - 2 ; case 6
	.short _0221D48A - _0221D3E0 - 2 ; case 7
_0221D3F0:
	add r4, #0xc0
	ldr r0, [r4]
	ldrh r6, [r0, #0x14]
	b _0221D4AA
_0221D3F8:
	add r4, #0xc0
	ldr r0, [r4]
	ldrh r6, [r0, #0x16]
	b _0221D4AA
_0221D400:
	add r4, #0xc0
	ldr r1, [r4]
	ldrh r1, [r1, #0x14]
	bl ov07_0223197C
	add r6, r0, #0
	b _0221D4AA
_0221D40E:
	add r4, #0xc0
	ldr r1, [r4]
	ldrh r1, [r1, #0x16]
	bl ov07_0223197C
	add r6, r0, #0
	b _0221D4AA
_0221D41C:
	mov r6, #0xff
	mov r5, #0
_0221D420:
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #0
	beq _0221D430
	cmp r0, #2
	bne _0221D434
_0221D430:
	add r6, r5, #0
	b _0221D43A
_0221D434:
	add r5, r5, #1
	cmp r5, #4
	blt _0221D420
_0221D43A:
	cmp r6, #0xff
	bne _0221D4AA
	mov r6, #0
	b _0221D4AA
_0221D442:
	mov r6, #0xff
	mov r5, #0
_0221D446:
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #1
	beq _0221D456
	cmp r0, #3
	bne _0221D45A
_0221D456:
	add r6, r5, #0
	b _0221D460
_0221D45A:
	add r5, r5, #1
	cmp r5, #4
	blt _0221D446
_0221D460:
	cmp r6, #0xff
	bne _0221D4AA
	mov r6, #0
	b _0221D4AA
_0221D468:
	mov r6, #0xff
	mov r5, #0
_0221D46C:
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #4
	bne _0221D47C
	add r6, r5, #0
	b _0221D482
_0221D47C:
	add r5, r5, #1
	cmp r5, #4
	blt _0221D46C
_0221D482:
	cmp r6, #0xff
	bne _0221D4AA
	mov r6, #0
	b _0221D4AA
_0221D48A:
	mov r6, #0xff
	mov r5, #0
_0221D48E:
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #5
	bne _0221D49E
	add r6, r5, #0
	b _0221D4A4
_0221D49E:
	add r5, r5, #1
	cmp r5, #4
	blt _0221D48E
_0221D4A4:
	cmp r6, #0xff
	bne _0221D4AA
	mov r6, #0
_0221D4AA:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_0221D3CC

	thumb_func_start ov07_0221D4B0
ov07_0221D4B0: ; 0x0221D4B0
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _0221D4CC
	ldrb r0, [r5, #4]
	add r0, r0, #1
	strb r0, [r5, #4]
	ldrb r1, [r5, #4]
	ldrb r0, [r5, #5]
	cmp r1, r0
	bne _0221D4FA
	mov r0, #0
	strb r0, [r5, #4]
_0221D4CC:
	ldr r0, [r5, #8]
	mov r1, #0
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	ldr r0, [r5, #8]
	mov r1, #0x29
	bl sub_02008A78
	sub r0, r4, r0
	lsl r0, r0, #0x10
	asr r2, r0, #0x10
	ldr r0, [r5]
	add r1, r6, #0
	bl sub_0200DDB8
_0221D4FA:
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221D4B0

	thumb_func_start ov07_0221D4FC
ov07_0221D4FC: ; 0x0221D4FC
	push {r4, r5, r6, lr}
	add r5, r1, #0
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _0221D518
	ldrb r0, [r5, #4]
	add r0, r0, #1
	strb r0, [r5, #4]
	ldrb r1, [r5, #4]
	ldrb r0, [r5, #5]
	cmp r1, r0
	bne _0221D55A
	mov r0, #0
	strb r0, [r5, #4]
_0221D518:
	ldr r0, [r5, #8]
	mov r1, #0
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	ldr r0, [r5, #8]
	mov r1, #0x29
	bl sub_02008A78
	sub r0, r4, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	sub r6, #0x28
	ldr r0, [r5]
	mov r1, #2
	mov r2, #0
	neg r3, r6
	bl BgSetPosTextAndCommit
	sub r4, #0x28
	ldr r0, [r5]
	mov r1, #2
	mov r2, #3
	neg r3, r4
	bl BgSetPosTextAndCommit
_0221D55A:
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221D4FC

	thumb_func_start ov07_0221D55C
ov07_0221D55C: ; 0x0221D55C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	cmp r1, #4
	bne _0221D588
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _0221D5A6
	ldr r0, [r0, #0xc]
	bl DestroySysTask
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl FreeToHeap
	mov r0, #0x5e
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r3, r4, r5, pc}
_0221D588:
	mov r0, #0x59
	lsl r0, r0, #2
	lsl r5, r1, #2
	add r4, r4, r0
	ldr r0, [r4, r5]
	cmp r0, #0
	beq _0221D5A6
	ldr r0, [r0, #0xc]
	bl DestroySysTask
	ldr r0, [r4, r5]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, r5]
_0221D5A6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221D55C

	thumb_func_start ov07_0221D5A8
ov07_0221D5A8: ; 0x0221D5A8
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221D5A8

	thumb_func_start ov07_0221D5AC
ov07_0221D5AC: ; 0x0221D5AC
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221D5AC

	thumb_func_start ov07_0221D5B0
ov07_0221D5B0: ; 0x0221D5B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r1, [r5, #0x18]
	add r2, r1, #4
	str r2, [r5, #0x18]
	ldr r1, [r2]
	add r2, r2, #4
	str r2, [r5, #0x18]
	ldr r4, [r2]
	add r2, r2, #4
	str r2, [r5, #0x18]
	bl ov07_0221D3CC
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsl r0, r6, #2
	add r0, r1, r0
	add r0, #0xb0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	ldr r7, [r1]
	str r0, [sp, #0x14]
	ldr r0, [r1, #8]
	str r0, [sp, #0x10]
	mov r0, #2
	bl BgGetCharPtr
	mov r2, #0x19
	mov r1, #0
	lsl r2, r2, #8
	bl MI_CpuFill8
	mov r0, #2
	mov r1, #0
	bl ToggleBgLayer
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xc4
	mov r3, #0x32
	ldr r0, [r0]
	mov r1, #2
	add r2, r7, #0
	lsl r3, r3, #6
	bl BG_LoadCharTilesData
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #0x80
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	ldr r3, [r5]
	bl PaletteData_LoadNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0x1b
	add r2, r5, #0
	str r0, [sp, #0xc]
	lsl r1, r1, #4
	add r2, #0xc4
	ldr r0, [r5, r1]
	ldr r2, [r2]
	sub r1, #0xa4
	mov r3, #2
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	cmp r4, #1
	bne _0221D696
	ldr r0, [r5]
	mov r1, #0x10
	bl AllocFromHeap
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r5, r1]
	add r0, r5, #0
	add r0, #0xc4
	ldr r2, [r0]
	ldr r0, [r5, r1]
	add r1, r6, #0
	str r2, [r0]
	add r0, r5, #0
	bl ov07_0221FA48
	mov r1, #0x5e
	lsl r1, r1, #2
	ldr r2, [r5, r1]
	str r0, [r2, #8]
	ldr r0, [r5, r1]
	mov r2, #0
	strb r2, [r0, #4]
	ldr r0, [r5, r1]
	strb r2, [r0, #5]
	ldr r0, _0221D710 ; =ov07_0221D4FC
	ldr r1, [r5, r1]
	ldr r2, _0221D714 ; =0x00001001
	bl CreateSysTask
	mov r1, #0x5e
	lsl r1, r1, #2
	ldr r1, [r5, r1]
	str r0, [r1, #0xc]
_0221D696:
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FA48
	mov r1, #0
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FA48
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FA48
	mov r1, #0x29
	bl sub_02008A78
	sub r0, r4, r0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	add r0, r5, #0
	add r0, #0xc4
	sub r7, #0x28
	ldr r0, [r0]
	mov r1, #2
	mov r2, #0
	neg r3, r7
	bl BgSetPosTextAndCommit
	add r0, r5, #0
	add r0, #0xc4
	sub r4, #0x28
	ldr r0, [r0]
	mov r1, #2
	mov r2, #3
	neg r3, r4
	bl BgSetPosTextAndCommit
	mov r0, #2
	mov r1, #1
	bl ToggleBgLayer
	add r0, r5, #0
	bl ov07_0221FAE8
	add r1, r0, #0
	lsl r1, r1, #0x18
	mov r0, #2
	lsr r1, r1, #0x18
	bl SetBgPriority
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221D710: .word ov07_0221D4FC
_0221D714: .word 0x00001001
	thumb_func_end ov07_0221D5B0

	thumb_func_start ov07_0221D718
ov07_0221D718: ; 0x0221D718
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	add r0, r0, #4
	add r0, r0, #4
	str r0, [r4, #0x18]
	mov r0, #2
	bl BgGetCharPtr
	mov r2, #0x19
	mov r1, #0
	lsl r2, r2, #8
	bl MI_CpuFill8
	add r0, r4, #0
	mov r1, #4
	bl ov07_0221D55C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0221D718

	thumb_func_start ov07_0221D740
ov07_0221D740: ; 0x0221D740
	push {r4, lr}
	sub sp, #0x18
	ldr r3, _0221D7B4 ; =ov07_02234BF0
	add r2, sp, #0
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #0x18]
	add r0, r0, #4
	str r0, [r4, #0x18]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200CF38
	mov r1, #0x4e
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r1, [r4, r1]
	add r0, #0xac
	ldr r0, [r0]
	mov r2, #5
	bl sub_0200CFF4
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200CF6C
	mov r2, #0x11
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x4e
	add r0, #0xac
	lsl r1, r1, #2
	ldr r0, [r0]
	ldr r1, [r4, r1]
	add r2, sp, #0
	bl sub_0200D3F8
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_0221D7B4: .word ov07_02234BF0
	thumb_func_end ov07_0221D740

	thumb_func_start ov07_0221D7B8
ov07_0221D7B8: ; 0x0221D7B8
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	ldr r1, _0221D870 ; =0x00004E21
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r2, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r4, r2, r1
	ldrh r3, [r0, #0x14]
	lsr r2, r1, #2
	add r0, #0xac
	mul r2, r3
	add r4, r4, r2
	mov r2, #0
	str r2, [sp]
	mov r2, #1
	str r2, [sp, #4]
	mov r2, #0x6d
	str r4, [sp, #8]
	lsr r1, r1, #6
	lsl r2, r2, #2
	ldr r0, [r0]
	ldr r1, [r5, r1]
	ldr r2, [r5, r2]
	mov r3, #0x4c
	bl sub_0200D504
	mov r0, #0x6d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r2, r5, #0
	str r0, [sp]
	mov r3, #0x4b
	str r3, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r5, #0
	str r4, [sp, #0x14]
	add r2, #0xc0
	ldr r2, [r2]
	add r0, #0xc8
	add r2, #0xac
	add r3, #0xed
	ldr r0, [r0]
	ldr r2, [r2]
	ldr r3, [r5, r3]
	mov r1, #2
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r2, #0x4e
	str r4, [sp, #4]
	add r0, #0xc0
	ldr r0, [r0]
	lsl r2, r2, #2
	add r0, #0xac
	ldr r1, [r5, r2]
	add r2, #0x7c
	ldr r0, [r0]
	ldr r2, [r5, r2]
	mov r3, #0x4d
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	mov r2, #0x4e
	str r4, [sp, #4]
	add r0, #0xc0
	ldr r0, [r0]
	lsl r2, r2, #2
	add r0, #0xac
	ldr r1, [r5, r2]
	add r2, #0x7c
	ldr r0, [r0]
	ldr r2, [r5, r2]
	mov r3, #0x4e
	bl sub_0200D71C
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221D870: .word 0x00004E21
	thumb_func_end ov07_0221D7B8

	thumb_func_start ov07_0221D874
ov07_0221D874: ; 0x0221D874
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x70
	add r4, r0, #0
	ldr r1, [r4, #0x18]
	ldr r6, _0221DA68 ; =0x00004E21
	add r2, r1, #4
	str r2, [r4, #0x18]
	ldr r1, [r2]
	add r2, r2, #4
	str r2, [r4, #0x18]
	mov ip, r1
	ldr r1, [r2]
	add r2, r2, #4
	str r2, [r4, #0x18]
	str r1, [sp, #0x10]
	ldr r1, [r2]
	add r2, r2, #4
	str r2, [r4, #0x18]
	str r1, [sp, #0xc]
	ldr r1, [r2]
	add r2, r2, #4
	str r2, [r4, #0x18]
	add r2, r4, #0
	add r2, #0xc0
	ldr r2, [r2]
	add r1, r1, r6
	ldrh r3, [r2, #0x14]
	lsr r2, r6, #2
	mul r2, r3
	add r2, r1, r2
	str r2, [sp, #0x58]
	add r2, r4, #0
	add r2, #0xc0
	ldr r2, [r2]
	ldrh r3, [r2, #0x14]
	lsr r2, r6, #2
	mul r2, r3
	add r2, r1, r2
	str r2, [sp, #0x5c]
	add r2, r4, #0
	add r2, #0xc0
	ldr r2, [r2]
	ldrh r3, [r2, #0x14]
	lsr r2, r6, #2
	mul r2, r3
	add r2, r1, r2
	str r2, [sp, #0x60]
	add r2, r4, #0
	add r2, #0xc0
	ldr r2, [r2]
	lsr r3, r6, #2
	ldrh r2, [r2, #0x14]
	mul r3, r2
	add r1, r1, r3
	str r1, [sp, #0x64]
	mov r1, #0
	str r1, [sp, #0x68]
	str r1, [sp, #0x6c]
	mov r1, ip
	bl ov07_0221D3CC
	str r0, [sp, #0x1c]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	ldr r0, [sp, #0x1c]
	lsl r0, r0, #2
	add r0, r1, r0
	add r0, #0xb0
	ldr r1, [r0]
	ldr r0, [r1, #4]
	str r0, [sp, #0x18]
	ldr r0, [r1, #8]
	str r0, [sp, #0x14]
	ldr r0, [r1]
	ldr r1, [sp, #0x1c]
	str r0, [sp, #0x20]
	add r0, r4, #0
	bl ov07_0221FA48
	add r6, r0, #0
	beq _0221D93C
	mov r1, #0
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	add r0, r6, #0
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	add r0, r6, #0
	mov r1, #0x29
	bl sub_02008A78
	sub r0, r5, r0
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
_0221D93C:
	add r0, sp, #0x24
	strh r7, [r0]
	strh r5, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	mov r0, #0x64
	str r0, [sp, #0x2c]
	mov r0, #1
	str r1, [sp, #0x30]
	str r0, [sp, #0x34]
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	add r2, sp, #0x58
	add r3, sp, #0x24
_0221D95A:
	ldr r0, [r2]
	add r1, r1, #1
	str r0, [r3, #0x14]
	add r2, r2, #4
	add r3, r3, #4
	cmp r1, #6
	blt _0221D95A
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	mov r1, #0x4e
	add r0, #0xac
	lsl r1, r1, #2
	ldr r0, [r0]
	ldr r1, [r4, r1]
	add r2, sp, #0x24
	bl sub_0200D734
	add r7, r0, #0
	cmp r6, #0
	bne _0221D98C
	mov r1, #0
	bl sub_0200DCE8
	b _0221D9A0
_0221D98C:
	add r0, r6, #0
	mov r1, #6
	bl sub_02008A78
	cmp r0, #1
	bne _0221D9A0
	add r0, r7, #0
	mov r1, #0
	bl sub_0200DCE8
_0221D9A0:
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	bl ov07_0221FA48
	cmp r0, #0
	beq _0221D9C2
	ldr r0, [r7]
	bl sub_02024B1C
	add r1, r0, #0
	mov r3, #0x32
	ldr r1, [r1, #4]
	ldr r2, [sp, #0x20]
	mov r0, #0x13
	lsl r3, r3, #6
	bl GF_CreateNewVramTransferTask
_0221D9C2:
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	bl ov07_0221FA48
	cmp r0, #0
	beq _0221D9F8
	ldr r0, [r7]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	mov r1, #2
	str r1, [sp]
	mov r1, #0x20
	lsl r0, r0, #0x14
	str r1, [sp, #4]
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0xc8
	ldr r0, [r0]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x14]
	ldr r3, [r4]
	bl PaletteData_LoadNarc
_0221D9F8:
	ldr r0, [sp, #0xc]
	lsl r5, r0, #2
	mov r0, #0x4f
	lsl r0, r0, #2
	add r6, r4, r0
	ldr r0, [r6, r5]
	cmp r0, #0
	beq _0221DA0C
	bl GF_AssertFail
_0221DA0C:
	mov r0, #0x15
	str r7, [r6, r5]
	mov r2, #1
	add r1, r4, r5
	lsl r0, r0, #4
	str r2, [r1, r0]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _0221DA62
	ldr r1, [sp, #0x1c]
	add r0, r4, #0
	bl ov07_0221FA48
	cmp r0, #0
	beq _0221DA62
	mov r0, #0x59
	lsl r0, r0, #2
	add r6, r4, r0
	ldr r0, [r4]
	mov r1, #0x10
	bl AllocFromHeap
	str r0, [r6, r5]
	ldr r0, [r6, r5]
	ldr r1, [sp, #0x1c]
	str r7, [r0]
	add r0, r4, #0
	bl ov07_0221FA48
	ldr r1, [r6, r5]
	ldr r2, _0221DA6C ; =0x00001001
	str r0, [r1, #8]
	ldr r0, [r6, r5]
	mov r1, #0
	strb r1, [r0, #4]
	ldr r0, [r6, r5]
	strb r1, [r0, #5]
	ldr r0, _0221DA70 ; =ov07_0221D4B0
	ldr r1, [r6, r5]
	bl CreateSysTask
	ldr r1, [r6, r5]
	str r0, [r1, #0xc]
_0221DA62:
	add sp, #0x70
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221DA68: .word 0x00004E21
_0221DA6C: .word 0x00001001
_0221DA70: .word ov07_0221D4B0
	thumb_func_end ov07_0221D874

	thumb_func_start ov07_0221DA74
ov07_0221DA74: ; 0x0221DA74
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	add r0, r0, #4
	str r0, [r4, #0x18]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _0221DA96
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200D998
_0221DA96:
	mov r0, #0x4e
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	pop {r4, pc}
	thumb_func_end ov07_0221DA74

	thumb_func_start ov07_0221DAA0
ov07_0221DAA0: ; 0x0221DAA0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	mov r0, #0x4f
	lsl r0, r0, #2
	lsl r4, r1, #2
	add r6, r5, r0
	ldr r0, [r6, r4]
	cmp r0, #0
	beq _0221DAC2
	bl sub_0200D9DC
_0221DAC2:
	mov r0, #0x15
	mov r2, #0
	add r1, r5, r4
	lsl r0, r0, #4
	str r2, [r1, r0]
	str r2, [r6, r4]
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221DAA0

	thumb_func_start ov07_0221DAD0
ov07_0221DAD0: ; 0x0221DAD0
	push {r3, lr}
	ldr r2, [r1, #0xc]
	cmp r2, #0
	bne _0221DADE
	bl DestroySysTask
	pop {r3, pc}
_0221DADE:
	mov r0, #0x4e
	ldr r2, [r1]
	lsl r0, r0, #2
	ldr r0, [r2, r0]
	cmp r0, #0
	beq _0221DAF0
	ldr r0, [r1, #4]
	bl sub_0200D020
_0221DAF0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_0221DAD0

	thumb_func_start ov07_0221DAF4
ov07_0221DAF4: ; 0x0221DAF4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	add r6, r5, #0
	add r1, r0, #4
	str r1, [r5, #0x18]
	ldr r0, [r1]
	add r6, #0x54
	str r0, [sp]
	add r0, r1, #4
	str r0, [r5, #0x18]
	ldr r2, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	add r0, r5, #0
	lsl r4, r2, #4
	str r0, [sp, #8]
	add r0, #0x4c
	lsl r1, r1, #2
	str r0, [sp, #8]
	str r5, [r0, r4]
	mov r0, #0x4e
	lsl r0, r0, #2
	ldr r3, [r5, r0]
	add r2, r5, r4
	str r3, [r2, #0x50]
	add r1, r5, r1
	add r0, r0, #4
	ldr r0, [r1, r0]
	mov r1, #0
	str r0, [r6, r4]
	mov r0, #1
	str r0, [r2, #0x58]
	ldr r0, [r6, r4]
	bl sub_0200DCE8
	add r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	beq _0221DB50
	b _0221DC9E
_0221DB50:
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_02231924
	str r0, [sp, #4]
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_02231924
	add r7, r0, #0
	ldr r1, [sp]
	add r0, r5, #0
	bl ov07_0221D3CC
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0221FA48
	cmp r0, #0
	beq _0221DB8C
	mov r1, #6
	bl sub_02008A78
	b _0221DB8E
_0221DB8C:
	mov r0, #0
_0221DB8E:
	cmp r0, #1
	ldr r0, [r6, r4]
	bne _0221DB9C
	mov r1, #0
	bl sub_0200DCE8
	b _0221DBA2
_0221DB9C:
	mov r1, #1
	bl sub_0200DCE8
_0221DBA2:
	ldr r0, [sp]
	cmp r0, #3
	bhi _0221DC90
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221DBB4: ; jump table
	.short _0221DBBC - _0221DBB4 - 2 ; case 0
	.short _0221DC0A - _0221DBB4 - 2 ; case 1
	.short _0221DBE2 - _0221DBB4 - 2 ; case 2
	.short _0221DC4E - _0221DBB4 - 2 ; case 3
_0221DBBC:
	ldr r0, [sp, #4]
	sub r0, r0, #3
	cmp r0, #1
	bhi _0221DBCE
	ldr r0, [r6, r4]
	mov r1, #1
	bl sub_0200DD68
	b _0221DC90
_0221DBCE:
	add r5, #0x54
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5, r4]
	mov r1, #0xff
	bl sub_0200DD68
	b _0221DC90
_0221DBE2:
	ldr r0, [sp, #4]
	cmp r0, #5
	beq _0221DBEC
	cmp r0, #2
	bne _0221DBF6
_0221DBEC:
	ldr r0, [r6, r4]
	mov r1, #1
	bl sub_0200DD68
	b _0221DC90
_0221DBF6:
	add r5, #0x54
	ldr r0, [r5, r4]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5, r4]
	mov r1, #0xff
	bl sub_0200DD68
	b _0221DC90
_0221DC0A:
	cmp r7, #5
	bhi _0221DC90
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221DC1A: ; jump table
	.short _0221DC90 - _0221DC1A - 2 ; case 0
	.short _0221DC90 - _0221DC1A - 2 ; case 1
	.short _0221DC26 - _0221DC1A - 2 ; case 2
	.short _0221DC30 - _0221DC1A - 2 ; case 3
	.short _0221DC3A - _0221DC1A - 2 ; case 4
	.short _0221DC44 - _0221DC1A - 2 ; case 5
_0221DC26:
	ldr r0, [r6, r4]
	mov r1, #0xff
	bl sub_0200DD68
	b _0221DC90
_0221DC30:
	ldr r0, [r6, r4]
	mov r1, #1
	bl sub_0200DD68
	b _0221DC90
_0221DC3A:
	ldr r0, [r6, r4]
	mov r1, #1
	bl sub_0200DD68
	b _0221DC90
_0221DC44:
	ldr r0, [r6, r4]
	mov r1, #0xff
	bl sub_0200DD68
	b _0221DC90
_0221DC4E:
	cmp r7, #5
	bhi _0221DC90
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221DC5E: ; jump table
	.short _0221DC90 - _0221DC5E - 2 ; case 0
	.short _0221DC90 - _0221DC5E - 2 ; case 1
	.short _0221DC6A - _0221DC5E - 2 ; case 2
	.short _0221DC74 - _0221DC5E - 2 ; case 3
	.short _0221DC7E - _0221DC5E - 2 ; case 4
	.short _0221DC88 - _0221DC5E - 2 ; case 5
_0221DC6A:
	ldr r0, [r6, r4]
	mov r1, #1
	bl sub_0200DD68
	b _0221DC90
_0221DC74:
	ldr r0, [r6, r4]
	mov r1, #0xff
	bl sub_0200DD68
	b _0221DC90
_0221DC7E:
	ldr r0, [r6, r4]
	mov r1, #0xff
	bl sub_0200DD68
	b _0221DC90
_0221DC88:
	ldr r0, [r6, r4]
	mov r1, #1
	bl sub_0200DD68
_0221DC90:
	ldr r1, [sp, #8]
	mov r2, #1
	ldr r0, _0221DCA4 ; =ov07_0221DAD0
	add r1, r1, r4
	lsl r2, r2, #0xc
	bl CreateSysTask
_0221DC9E:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0221DCA4: .word ov07_0221DAD0
	thumb_func_end ov07_0221DAF4

	thumb_func_start ov07_0221DCA8
ov07_0221DCA8: ; 0x0221DCA8
	ldr r1, [r0, #0x18]
	mov r2, #0
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r3, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	lsl r1, r3, #4
	add r0, r0, r1
	str r2, [r0, #0x58]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221DCA8

	thumb_func_start ov07_0221DCC0
ov07_0221DCC0: ; 0x0221DCC0
	ldr r1, [r0, #0x18]
	ldr r3, _0221DCD0 ; =ov07_0221D55C
	add r2, r1, #4
	str r2, [r0, #0x18]
	ldr r1, [r2]
	add r2, r2, #4
	str r2, [r0, #0x18]
	bx r3
	.balign 4, 0
_0221DCD0: .word ov07_0221D55C
	thumb_func_end ov07_0221DCC0

	thumb_func_start ov07_0221DCD4
ov07_0221DCD4: ; 0x0221DCD4
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r3, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	add r0, r0, r3
	add r0, #0x6c
	strb r2, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221DCD4

	thumb_func_start ov07_0221DCF0
ov07_0221DCF0: ; 0x0221DCF0
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r3, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	add r0, r0, r3
	add r0, #0x7c
	strb r2, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221DCF0

	thumb_func_start ov07_0221DD0C
ov07_0221DD0C: ; 0x0221DD0C
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221DD0C

	thumb_func_start ov07_0221DD10
ov07_0221DD10: ; 0x0221DD10
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221DD10

	thumb_func_start ov07_0221DD14
ov07_0221DD14: ; 0x0221DD14
	push {r4, r5}
	mov r4, #0
	mov r2, #1
_0221DD1A:
	ldr r5, [r0]
	cmp r5, #0
	beq _0221DD2C
	cmp r1, #5
	beq _0221DD2A
	ldr r3, [r5, #0x1c]
	cmp r1, r3
	bne _0221DD2C
_0221DD2A:
	str r2, [r5, #0x18]
_0221DD2C:
	add r4, r4, #1
	add r0, r0, #4
	cmp r4, #4
	blt _0221DD1A
	pop {r4, r5}
	bx lr
	thumb_func_end ov07_0221DD14

	thumb_func_start ov07_0221DD38
ov07_0221DD38: ; 0x0221DD38
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r6, r2, #0
	mov r4, #0
_0221DD42:
	lsl r0, r4, #2
	ldr r0, [r5, r0]
	cmp r0, #0
	beq _0221DD54
	ldr r0, [r0, #0x1c]
	cmp r6, r0
	bne _0221DD54
	bl GF_AssertFail
_0221DD54:
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	cmp r4, #4
	blo _0221DD42
	mov r2, #0
_0221DD60:
	lsl r1, r2, #2
	ldr r0, [r5, r1]
	cmp r0, #0
	bne _0221DD70
	str r7, [r5, r1]
	ldr r0, [r5, r1]
	str r6, [r0, #0x1c]
	pop {r3, r4, r5, r6, r7, pc}
_0221DD70:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _0221DD60
	ldr r0, _0221DD88 ; =_02237840
	cmp r0, #0
	beq _0221DD84
	bl GF_AssertFail
_0221DD84:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221DD88: .word _02237840
	thumb_func_end ov07_0221DD38

	thumb_func_start ov07_0221DD8C
ov07_0221DD8C: ; 0x0221DD8C
	push {r3, r4}
	mov r4, #0
_0221DD90:
	lsl r2, r4, #2
	ldr r3, [r0, r2]
	ldr r2, [r3, #0x1c]
	cmp r1, r2
	bne _0221DDA0
	add r0, r3, #0
	pop {r3, r4}
	bx lr
_0221DDA0:
	add r2, r4, #1
	lsl r2, r2, #0x18
	lsr r4, r2, #0x18
	cmp r4, #4
	blo _0221DD90
	mov r0, #0
	pop {r3, r4}
	bx lr
	thumb_func_end ov07_0221DD8C

	thumb_func_start ov07_0221DDB0
ov07_0221DDB0: ; 0x0221DDB0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r1, #0xc0
	ldr r1, [r1]
	add r5, r0, #0
	ldrh r1, [r1, #0x14]
	add r0, r4, #0
	add r6, r2, #0
	bl ov07_0223192C
	add r7, r0, #0
	add r0, r4, #0
	add r4, #0xc0
	ldr r1, [r4]
	ldrh r1, [r1, #0x16]
	bl ov07_0223192C
	lsl r1, r6, #2
	add r1, r5, r1
	ldr r1, [r1, #0x1c]
	cmp r1, #2
	bne _0221DDF4
	cmp r7, r0
	bne _0221DDEC
	cmp r0, #3
	beq _0221DDE8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221DDE8:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221DDEC:
	cmp r0, #3
	bne _0221DE00
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221DDF4:
	cmp r1, #0
	beq _0221DE00
	cmp r0, #3
	bne _0221DE00
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0221DE00:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221DDB0

	thumb_func_start ov07_0221DE04
ov07_0221DE04: ; 0x0221DE04
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	add r5, r1, #0
	add r0, r3, #0
	mov r1, #0
	add r4, r2, #0
	str r3, [sp, #0x10]
	bl ov07_0221FB7C
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	add r2, r5, #0
	str r0, [sp, #0xc]
	add r2, #0xc4
	ldr r2, [r2]
	mov r0, #7
	add r3, r4, #0
	bl GfGfxLoader_LoadCharData
	ldr r0, [sp, #0x10]
	mov r1, #1
	bl ov07_0221FB7C
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x90
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	ldr r3, [r5]
	mov r1, #7
	bl PaletteData_LoadNarc
	add r0, r5, #0
	add r0, #0xc4
	lsl r1, r4, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	mov r6, #2
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221DE78
	mov r6, #4
	b _0221DE88
_0221DE78:
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #7
	bl ov07_0221DDB0
	cmp r0, #1
	bne _0221DE88
	mov r6, #3
_0221DE88:
	ldr r0, [sp, #0x10]
	add r1, r6, #0
	bl ov07_0221FB7C
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	add r5, #0xc4
	str r0, [sp, #0xc]
	ldr r2, [r5]
	mov r0, #7
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnData
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221DE04

	thumb_func_start ov07_0221DEB0
ov07_0221DEB0: ; 0x0221DEB0
	lsl r0, r0, #0x10
	and r0, r1
	cmp r1, r0
	bne _0221DEBC
	mov r0, #1
	bx lr
_0221DEBC:
	mov r0, #0
	bx lr
	thumb_func_end ov07_0221DEB0

	thumb_func_start ov07_0221DEC0
ov07_0221DEC0: ; 0x0221DEC0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r3, _0221DF14 ; =ov07_02234BA8
	add r2, sp, #0
	add r5, r0, #0
	add r4, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r7, _0221DF18 ; =ov07_02234C40
	mov r6, #0
_0221DEDC:
	ldr r0, [r5, #0x18]
	ldr r1, [r4]
	bl ov07_0221DEB0
	cmp r0, #0
	beq _0221DF06
	ldr r0, [r4]
	mov r1, #0
	lsr r2, r0, #0x10
	cmp r2, #2
	blt _0221DEFE
_0221DEF2:
	lsr r0, r2, #0x1f
	add r0, r2, r0
	asr r2, r0, #1
	add r1, r1, #1
	cmp r2, #2
	bge _0221DEF2
_0221DEFE:
	lsl r1, r1, #2
	ldr r1, [r7, r1]
	add r0, r5, #0
	blx r1
_0221DF06:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #6
	blo _0221DEDC
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221DF14: .word ov07_02234BA8
_0221DF18: .word ov07_02234C40
	thumb_func_end ov07_0221DEC0

	thumb_func_start ov07_0221DF1C
ov07_0221DF1C: ; 0x0221DF1C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x4c
	bl AllocFromHeap
	add r4, r0, #0
	bne _0221DF34
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221DF34:
	mov r1, #0
	mov r2, #0x4c
	bl memset
	mov r0, #0
	str r0, [r4]
	strb r0, [r4, #5]
	strb r0, [r4, #0xf]
	strb r0, [r4, #0xe]
	str r5, [r4, #0x48]
	strb r0, [r4, #9]
	mov r0, #0x1f
	strb r0, [r4, #0xa]
	mov r0, #0x1d
	strb r0, [r4, #0xb]
	mov r0, #2
	strb r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	cmp r0, #1
	bne _0221DF72
	mov r0, #0
	strb r0, [r4, #9]
	mov r0, #0x1f
	strb r0, [r4, #0xa]
	mov r0, #0xf
	strb r0, [r4, #0xb]
	mov r0, #7
	strb r0, [r4, #0xc]
_0221DF72:
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	cmp r0, #2
	bne _0221DF8E
	mov r0, #7
	strb r0, [r4, #9]
	mov r0, #0xf
	strb r0, [r4, #0xa]
	mov r0, #0x1d
	strb r0, [r4, #0xb]
	mov r0, #2
	strb r0, [r4, #0xc]
_0221DF8E:
	mov r1, #0
	add r2, r5, #0
	add r3, r4, #0
_0221DF94:
	add r0, r2, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, r1, #1
	str r0, [r3, #0x1c]
	add r2, r2, #4
	add r3, r3, #4
	cmp r1, #0xa
	blt _0221DF94
	mov r0, #0x5f
	mov r1, #1
	lsl r0, r0, #2
	strb r1, [r5, r0]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0221DF1C

	thumb_func_start ov07_0221DFB4
ov07_0221DFB4: ; 0x0221DFB4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldrb r0, [r5, #5]
	cmp r0, #0
	beq _0221DFC8
	cmp r0, #1
	beq _0221E006
	cmp r0, #2
	beq _0221E058
	b _0221E0A2
_0221DFC8:
	ldr r0, [r5, #0x48]
	mov r1, #2
	bl ov07_0221EB98
	ldr r0, [r5, #0x48]
	mov r1, #2
	bl ov07_0221FB04
	add r4, r0, #0
	ldr r0, [r5, #0x48]
	mov r1, #1
	bl ov07_0221FB04
	lsl r1, r4, #0x18
	mov r0, #3
	lsr r1, r1, #0x18
	bl SetBgPriority
	lsl r1, r4, #0x18
	mov r0, #2
	lsr r1, r1, #0x18
	bl SetBgPriority
	mov r0, #2
	mov r1, #1
	bl ToggleBgLayer
	ldrb r0, [r5, #5]
	add r0, r0, #1
	strb r0, [r5, #5]
	b _0221E0A6
_0221E006:
	ldr r0, [r5, #0x48]
	mov r1, #3
	add r0, #0xc4
	ldr r0, [r0]
	mov r2, #2
	add r3, r1, #0
	bl SetBgControlParam
	ldr r0, [r5, #0x48]
	bl ov07_0221BFC0
	cmp r0, #1
	beq _0221E030
	ldr r0, [r5, #0x48]
	mov r2, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #3
	add r3, r2, #0
	bl SetBgControlParam
_0221E030:
	ldr r1, [r5, #0x48]
	ldr r3, [r5, #0x10]
	add r0, r5, #0
	mov r2, #3
	bl ov07_0221DE04
	ldrb r0, [r5, #9]
	mov r1, #4
	mov r2, #8
	str r0, [sp]
	ldrb r3, [r5, #0xa]
	ldr r0, _0221E0AC ; =0x04000050
	bl G2x_SetBlendAlpha_
	add r0, r5, #0
	bl ov07_0221DEC0
	ldrb r0, [r5, #5]
	add r0, r0, #1
	strb r0, [r5, #5]
_0221E058:
	ldrb r1, [r5, #9]
	ldrb r0, [r5, #0xb]
	mov r2, #0
	cmp r1, r0
	bhs _0221E068
	add r0, r1, #2
	strb r0, [r5, #9]
	b _0221E06A
_0221E068:
	add r2, r2, #1
_0221E06A:
	ldrb r1, [r5, #0xa]
	ldrb r0, [r5, #0xc]
	cmp r1, r0
	bls _0221E078
	sub r0, r1, #2
	strb r0, [r5, #0xa]
	b _0221E07A
_0221E078:
	add r2, r2, #1
_0221E07A:
	cmp r2, #2
	bne _0221E08C
	ldrb r0, [r5, #0xb]
	strb r0, [r5, #9]
	ldrb r0, [r5, #0xc]
	strb r0, [r5, #0xa]
	ldrb r0, [r5, #5]
	add r0, r0, #1
	strb r0, [r5, #5]
_0221E08C:
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #0xa]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0221E0B0 ; =0x04000052
	strh r1, [r0]
	ldrb r0, [r5, #5]
	cmp r0, #2
	beq _0221E0A6
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221E0A2:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221E0A6:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_0221E0AC: .word 0x04000050
_0221E0B0: .word 0x04000052
	thumb_func_end ov07_0221DFB4

	thumb_func_start ov07_0221E0B4
ov07_0221E0B4: ; 0x0221E0B4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r1, #0
	ldrb r0, [r4, #5]
	cmp r0, #4
	bls _0221E0C2
	b _0221E26C
_0221E0C2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221E0CE: ; jump table
	.short _0221E0D8 - _0221E0CE - 2 ; case 0
	.short _0221E0E6 - _0221E0CE - 2 ; case 1
	.short _0221E12A - _0221E0CE - 2 ; case 2
	.short _0221E170 - _0221E0CE - 2 ; case 3
	.short _0221E250 - _0221E0CE - 2 ; case 4
_0221E0D8:
	mov r0, #2
	mov r1, #1
	bl ToggleBgLayer
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
_0221E0E6:
	ldr r0, [r4, #0x48]
	mov r1, #2
	bl ov07_0221FB04
	add r5, r0, #0
	ldr r0, [r4, #0x48]
	mov r1, #1
	bl ov07_0221FB04
	lsl r1, r5, #0x18
	add r6, r0, #0
	mov r0, #3
	lsr r1, r1, #0x18
	bl SetBgPriority
	lsl r1, r6, #0x18
	mov r0, #2
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldrb r0, [r4, #0xa]
	mov r1, #4
	mov r2, #8
	str r0, [sp]
	ldrb r3, [r4, #9]
	ldr r0, _0221E278 ; =0x04000050
	bl G2x_SetBlendAlpha_
	add r0, r4, #0
	bl ov07_0221DEC0
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
_0221E12A:
	ldrb r1, [r4, #9]
	ldrb r0, [r4, #0xb]
	mov r2, #0
	cmp r1, r0
	bhs _0221E13A
	add r0, r1, #2
	strb r0, [r4, #9]
	b _0221E13C
_0221E13A:
	add r2, r2, #1
_0221E13C:
	ldrb r1, [r4, #0xa]
	ldrb r0, [r4, #0xc]
	cmp r1, r0
	bls _0221E14A
	sub r0, r1, #2
	strb r0, [r4, #0xa]
	b _0221E14C
_0221E14A:
	add r2, r2, #1
_0221E14C:
	cmp r2, #2
	bne _0221E162
	ldrb r0, [r4, #0xb]
	add r0, r0, #2
	strb r0, [r4, #9]
	ldrb r0, [r4, #0xc]
	sub r0, r0, #2
	strb r0, [r4, #0xa]
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
_0221E162:
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0221E27C ; =0x04000052
	strh r1, [r0]
	b _0221E272
_0221E170:
	add r0, r4, #0
	bl ov07_0221E664
	ldr r0, [r4, #0x48]
	mov r2, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x48]
	mov r1, #3
	add r0, #0xc4
	ldr r0, [r0]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x48]
	mov r1, #3
	add r0, #0xc4
	ldr r0, [r0]
	mov r2, #2
	mov r3, #4
	bl SetBgControlParam
	ldr r0, [r4, #0x48]
	bl ov07_0221BFC0
	cmp r0, #0
	bne _0221E1D0
	ldr r0, [r4, #0x48]
	mov r1, #3
	add r0, #0xc4
	ldr r0, [r0]
	mov r2, #0
	mov r3, #1
	bl SetBgControlParam
	ldr r0, [r4, #0x48]
	mov r1, #3
	bl ov07_0221FB30
	ldr r0, [r4, #0x48]
	bl ov07_0221FB58
	b _0221E224
_0221E1D0:
	ldr r2, [r4, #0x48]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r2]
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r2, r1]
	add r1, r1, #4
	ldr r1, [r2, r1]
	add r2, #0xc4
	ldr r2, [r2]
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r2, #0x69
	lsl r2, r2, #2
	add r1, r2, #0
	ldr r3, [r4, #0x48]
	mov r0, #0
	str r0, [sp]
	ldr r0, [r3, r2]
	sub r1, #0x14
	lsl r0, r0, #5
	str r0, [sp, #4]
	sub r0, r2, #4
	ldr r0, [r3, r0]
	sub r2, #0xc
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r3, #0
	add r0, #0xc8
	ldr r0, [r0]
	ldr r1, [r3, r1]
	ldr r2, [r3, r2]
	ldr r3, [r3]
	bl PaletteData_LoadNarc
_0221E224:
	ldr r2, [r4, #0x48]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r2]
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r2, r1]
	add r1, #0xc
	ldr r1, [r2, r1]
	add r2, #0xc4
	ldr r2, [r2]
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
	b _0221E272
_0221E250:
	bl ov12_0223C340
	mov r0, #2
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r4, #0x48]
	mov r1, #2
	bl ov07_0221EC7C
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
	b _0221E272
_0221E26C:
	add sp, #0x10
	mov r0, #0
	pop {r4, r5, r6, pc}
_0221E272:
	mov r0, #1
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221E278: .word 0x04000050
_0221E27C: .word 0x04000052
	thumb_func_end ov07_0221E0B4

	thumb_func_start ov07_0221E280
ov07_0221E280: ; 0x0221E280
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _0221E292
	cmp r0, #1
	beq _0221E316
	b _0221E39A
_0221E292:
	ldrb r0, [r4, #0xd]
	ldr r2, [r4, #0x48]
	cmp r0, #0
	bne _0221E2D4
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	mov r3, #0x6a
	str r1, [sp, #8]
	add r0, r2, #0
	lsl r3, r3, #2
	ldr r2, [r2, r3]
	mov r3, #0xe
	add r0, #0xc8
	lsl r2, r2, #0x10
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	mov r1, #1
	lsr r2, r2, #0x10
	bl sub_02003474
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4, #0x48]
	mov r2, #2
	add r0, #0xc8
	ldr r0, [r0]
	lsl r2, r2, #8
	mov r3, #0x10
	bl sub_02003EA4
	b _0221E310
_0221E2D4:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0221E3B4 ; =0x0000FFFF
	mov r3, #0x6a
	str r0, [sp, #8]
	add r0, r2, #0
	lsl r3, r3, #2
	ldr r2, [r2, r3]
	mov r3, #0xe
	add r0, #0xc8
	lsl r2, r2, #0x10
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	mov r1, #1
	lsr r2, r2, #0x10
	bl sub_02003474
	ldr r0, _0221E3B4 ; =0x0000FFFF
	mov r2, #2
	str r0, [sp]
	ldr r0, [r4, #0x48]
	mov r1, #0
	add r0, #0xc8
	ldr r0, [r0]
	lsl r2, r2, #8
	mov r3, #0x10
	bl sub_02003EA4
_0221E310:
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
_0221E316:
	ldr r0, [r4, #0x48]
	add r0, #0xc8
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	bne _0221E3AE
	ldr r0, [r4, #0x48]
	mov r2, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #3
	add r3, r2, #0
	bl SetBgControlParam
	ldr r1, [r4, #0x48]
	ldr r3, [r4, #0x10]
	add r0, r4, #0
	mov r2, #3
	bl ov07_0221DE04
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	bne _0221E364
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r4, #0x48]
	mov r3, #0xe
	add r0, #0xc8
	mov r1, #1
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	lsl r2, r1, #9
	bl sub_02003474
	b _0221E382
_0221E364:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _0221E3B4 ; =0x0000FFFF
	mov r3, #0xe
	str r0, [sp, #8]
	ldr r0, [r4, #0x48]
	mov r1, #1
	add r0, #0xc8
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	lsl r2, r1, #9
	bl sub_02003474
_0221E382:
	add r0, r4, #0
	bl ov07_0221DEC0
	mov r0, #0x5f
	ldr r1, [r4, #0x48]
	mov r2, #2
	lsl r0, r0, #2
	strb r2, [r1, r0]
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
	b _0221E3AE
_0221E39A:
	ldr r0, [r4, #0x48]
	add r0, #0xc8
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	bne _0221E3AE
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_0221E3AE:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0221E3B4: .word 0x0000FFFF
	thumb_func_end ov07_0221E280

	thumb_func_start ov07_0221E3B8
ov07_0221E3B8: ; 0x0221E3B8
	push {r4, lr}
	sub sp, #0x10
	add r4, r1, #0
	ldrb r0, [r4, #5]
	cmp r0, #3
	bls _0221E3C6
	b _0221E5B0
_0221E3C6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221E3D2: ; jump table
	.short _0221E3DA - _0221E3D2 - 2 ; case 0
	.short _0221E3E6 - _0221E3D2 - 2 ; case 1
	.short _0221E468 - _0221E3D2 - 2 ; case 2
	.short _0221E536 - _0221E3D2 - 2 ; case 3
_0221E3DA:
	add r0, r4, #0
	bl ov07_0221DEC0
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
_0221E3E6:
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	bne _0221E426
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	str r1, [sp, #8]
	ldr r0, [r4, #0x48]
	mov r3, #0xf
	add r0, #0xc8
	mov r1, #1
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	lsl r2, r1, #9
	bl sub_02003474
	ldr r3, [r4, #0x48]
	mov r1, #0
	mov r2, #0x6a
	add r0, r3, #0
	str r1, [sp]
	lsl r2, r2, #2
	ldr r2, [r3, r2]
	add r0, #0xc8
	lsl r2, r2, #0x10
	ldr r0, [r0]
	lsr r2, r2, #0x10
	mov r3, #0x10
	bl sub_02003EA4
	b _0221E462
_0221E426:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0221E5DC ; =0x0000FFFF
	mov r3, #0xf
	str r0, [sp, #8]
	ldr r0, [r4, #0x48]
	mov r1, #1
	add r0, #0xc8
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	lsl r2, r1, #9
	bl sub_02003474
	mov r2, #0x6a
	ldr r3, [r4, #0x48]
	ldr r0, _0221E5DC ; =0x0000FFFF
	lsl r2, r2, #2
	str r0, [sp]
	add r0, r3, #0
	ldr r2, [r3, r2]
	add r0, #0xc8
	lsl r2, r2, #0x10
	ldr r0, [r0]
	mov r1, #0
	lsr r2, r2, #0x10
	mov r3, #0x10
	bl sub_02003EA4
_0221E462:
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
_0221E468:
	ldr r0, [r4, #0x48]
	add r0, #0xc8
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	beq _0221E478
	b _0221E5D4
_0221E478:
	add r0, r4, #0
	bl ov07_0221E664
	mov r0, #3
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r4, #0x48]
	bl ov07_0221BFC0
	cmp r0, #0
	bne _0221E4B0
	ldr r0, [r4, #0x48]
	mov r1, #3
	add r0, #0xc4
	ldr r0, [r0]
	mov r2, #0
	mov r3, #1
	bl SetBgControlParam
	ldr r0, [r4, #0x48]
	mov r1, #3
	bl ov07_0221FB30
	ldr r0, [r4, #0x48]
	bl ov07_0221FB58
	b _0221E504
_0221E4B0:
	ldr r2, [r4, #0x48]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r2]
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r2, r1]
	add r1, r1, #4
	ldr r1, [r2, r1]
	add r2, #0xc4
	ldr r2, [r2]
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	mov r2, #0x69
	lsl r2, r2, #2
	add r1, r2, #0
	ldr r3, [r4, #0x48]
	mov r0, #0
	str r0, [sp]
	ldr r0, [r3, r2]
	sub r1, #0x14
	lsl r0, r0, #5
	str r0, [sp, #4]
	sub r0, r2, #4
	ldr r0, [r3, r0]
	sub r2, #0xc
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r3, #0
	add r0, #0xc8
	ldr r0, [r0]
	ldr r1, [r3, r1]
	ldr r2, [r3, r2]
	ldr r3, [r3]
	bl PaletteData_LoadNarc
_0221E504:
	ldr r2, [r4, #0x48]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r2]
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r2, r1]
	add r1, #0xc
	ldr r1, [r2, r1]
	add r2, #0xc4
	ldr r2, [r2]
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #3
	mov r1, #1
	bl ToggleBgLayer
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
_0221E536:
	ldr r0, [r4, #0x48]
	mov r2, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #3
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x48]
	mov r1, #3
	add r0, #0xc4
	ldr r0, [r0]
	add r2, r1, #0
	mov r3, #0
	bl BgSetPosTextAndCommit
	ldrb r0, [r4, #0xd]
	ldr r2, [r4, #0x48]
	cmp r0, #0
	bne _0221E584
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov r3, #0x6a
	str r0, [sp, #8]
	add r0, r2, #0
	lsl r3, r3, #2
	ldr r2, [r2, r3]
	mov r3, #0xf
	add r0, #0xc8
	lsl r2, r2, #0x10
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	mov r1, #1
	lsr r2, r2, #0x10
	bl sub_02003474
	b _0221E5AA
_0221E584:
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _0221E5DC ; =0x0000FFFF
	mov r3, #0x6a
	str r0, [sp, #8]
	add r0, r2, #0
	lsl r3, r3, #2
	ldr r2, [r2, r3]
	mov r3, #0xf
	add r0, #0xc8
	lsl r2, r2, #0x10
	ldrsb r3, [r4, r3]
	ldr r0, [r0]
	mov r1, #1
	lsr r2, r2, #0x10
	bl sub_02003474
_0221E5AA:
	ldrb r0, [r4, #5]
	add r0, r0, #1
	strb r0, [r4, #5]
_0221E5B0:
	ldr r0, [r4, #0x48]
	add r0, #0xc8
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	bne _0221E5D4
	mov r0, #0x5f
	ldr r1, [r4, #0x48]
	mov r2, #2
	lsl r0, r0, #2
	strb r2, [r1, r0]
	ldrb r0, [r4, #5]
	add sp, #0x10
	add r0, r0, #1
	strb r0, [r4, #5]
	mov r0, #0
	pop {r4, pc}
_0221E5D4:
	mov r0, #1
	add sp, #0x10
	pop {r4, pc}
	nop
_0221E5DC: .word 0x0000FFFF
	thumb_func_end ov07_0221E3B8

	thumb_func_start ov07_0221E5E0
ov07_0221E5E0: ; 0x0221E5E0
	push {r3, lr}
	add r0, r1, #0
	bl ov07_0221DEC0
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov07_0221E5E0

	thumb_func_start ov07_0221E5EC
ov07_0221E5EC: ; 0x0221E5EC
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	bl ov07_0221DEC0
	add r0, r4, #0
	bl ov07_0221E664
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov07_0221E5EC

	thumb_func_start ov07_0221E600
ov07_0221E600: ; 0x0221E600
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x18]
	cmp r0, #1
	bne _0221E61A
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
_0221E61A:
	mov r3, #4
	mov r1, #8
	ldrsh r2, [r4, r3]
	ldrsh r0, [r4, r1]
	add r0, r2, r0
	strh r0, [r4, #4]
	mov r0, #6
	ldrsh r2, [r4, r0]
	mov r0, #0xa
	ldrsh r0, [r4, r0]
	add r0, r2, r0
	strh r0, [r4, #6]
	ldrsh r0, [r4, r1]
	cmp r0, #0
	beq _0221E648
	ldr r1, [r4, #0xc]
	ldrsh r3, [r4, r3]
	lsl r1, r1, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x18
	mov r2, #0
	bl BgSetPosTextAndCommit
_0221E648:
	mov r0, #0xa
	ldrsh r0, [r4, r0]
	cmp r0, #0
	beq _0221E662
	ldr r1, [r4, #0xc]
	mov r3, #6
	lsl r1, r1, #0x18
	ldrsh r3, [r4, r3]
	ldr r0, [r4]
	lsr r1, r1, #0x18
	mov r2, #3
	bl BgSetPosTextAndCommit
_0221E662:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221E600

	thumb_func_start ov07_0221E664
ov07_0221E664: ; 0x0221E664
	push {r4, lr}
	add r4, r0, #0
	bne _0221E66E
	bl GF_AssertFail
_0221E66E:
	ldr r0, [r4, #0x48]
	cmp r0, #0
	bne _0221E678
	bl GF_AssertFail
_0221E678:
	add r0, r4, #0
	add r0, #0x44
	ldrh r1, [r0]
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0221E696
	mov r0, #6
	ldr r1, [r4, #0x48]
	lsl r0, r0, #6
	add r0, r1, r0
	mov r1, #1
	bl ov07_0221DD14
	pop {r4, pc}
_0221E696:
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0221E6AE
	mov r0, #6
	ldr r1, [r4, #0x48]
	lsl r0, r0, #6
	add r0, r1, r0
	mov r1, #2
	bl ov07_0221DD14
	pop {r4, pc}
_0221E6AE:
	lsl r0, r1, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0221E6C4
	mov r0, #6
	ldr r1, [r4, #0x48]
	lsl r0, r0, #6
	add r0, r1, r0
	mov r1, #3
	bl ov07_0221DD14
_0221E6C4:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0221E664

	thumb_func_start ov07_0221E6C8
ov07_0221E6C8: ; 0x0221E6C8
	mov r1, #0x6a
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	thumb_func_end ov07_0221E6C8

	thumb_func_start ov07_0221E6D0
ov07_0221E6D0: ; 0x0221E6D0
	mov r0, #0
	bx lr
	thumb_func_end ov07_0221E6D0

	thumb_func_start ov07_0221E6D4
ov07_0221E6D4: ; 0x0221E6D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x48]
	mov r1, #0x28
	ldr r0, [r0]
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [r5, #0x48]
	mov r2, #6
	add r0, #0xc4
	ldr r0, [r0]
	str r0, [r4]
	ldr r0, [r5, #0x48]
	add r0, #0x9c
	ldr r0, [r0]
	strh r0, [r4, #4]
	ldr r0, [r5, #0x48]
	add r0, #0xa0
	ldr r0, [r0]
	strh r0, [r4, #6]
	ldr r0, [r5, #0x48]
	add r0, #0x94
	ldr r0, [r0]
	strh r0, [r4, #8]
	ldr r0, [r5, #0x48]
	add r0, #0x98
	ldr r0, [r0]
	strh r0, [r4, #0xa]
	mov r0, #3
	str r0, [r4, #0xc]
	str r0, [r4, #0x10]
	ldr r1, [r5, #0x48]
	add r0, r5, #0
	bl ov07_0221DDB0
	cmp r0, #1
	bne _0221E748
	mov r0, #8
	ldrsh r1, [r4, r0]
	sub r0, #9
	mul r0, r1
	strh r0, [r4, #8]
	mov r0, #0xa
	ldrsh r1, [r4, r0]
	sub r0, #0xb
	mul r0, r1
	strh r0, [r4, #0xa]
	mov r0, #4
	ldrsh r1, [r4, r0]
	sub r0, r0, #5
	mul r0, r1
	strh r0, [r4, #4]
	mov r0, #6
	ldrsh r1, [r4, r0]
	sub r0, r0, #7
	mul r0, r1
	strh r0, [r4, #6]
_0221E748:
	mov r2, #1
	str r2, [r4, #0x14]
	mov r0, #0
	str r0, [r4, #0x18]
	mov r0, #6
	ldr r1, [r5, #0x48]
	lsl r0, r0, #6
	add r0, r1, r0
	add r1, r4, #0
	bl ov07_0221DD38
	add r0, r5, #0
	add r0, #0x44
	ldrh r1, [r0]
	mov r0, #1
	add r5, #0x44
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strh r0, [r5]
	ldr r0, _0221E780 ; =ov07_0221E600
	ldr r2, _0221E784 ; =0x00001001
	add r1, r4, #0
	bl CreateSysTask
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_0221E780: .word ov07_0221E600
_0221E784: .word 0x00001001
	thumb_func_end ov07_0221E6D4

	thumb_func_start ov07_0221E788
ov07_0221E788: ; 0x0221E788
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, [r0, #0x48]
	str r0, [sp]
	ldr r0, [r4]
	mov r1, #0x28
	bl AllocFromHeap
	add r6, r0, #0
	ldr r0, [r4]
	mov r1, #0xc4
	bl AllocFromHeap
	str r0, [r6, #0x20]
	mov r0, #6
	lsl r0, r0, #6
	add r0, r4, r0
	add r1, r6, #0
	mov r2, #2
	bl ov07_0221DD38
	ldr r0, [sp]
	mov r1, #2
	add r0, #0x44
	ldrh r0, [r0]
	add r2, r0, #0
	ldr r0, [sp]
	orr r2, r1
	add r0, #0x44
	strh r2, [r0]
	mov r0, #0
	str r0, [r6, #0x18]
	add r0, r4, #0
	bl ov07_0221FAF8
	bl ov07_02222D90
	add r5, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl ov07_02222D88
	add r1, r0, #0
	ldr r2, [r4]
	add r0, r5, #0
	bl ov07_02222BE4
	mov r4, #0
	ldr r1, [r6, #0x20]
	ldr r7, _0221E860 ; =ov07_02234C20
	add r1, #0xc0
	str r0, [r1]
	str r4, [sp, #4]
	add r5, r4, #0
_0221E7F4:
	ldr r0, [r6, #0x20]
	strh r4, [r0, r5]
	ldr r0, [r6, #0x20]
	add r1, r0, r5
	ldrsh r0, [r0, r5]
	add r0, #8
	strh r0, [r1, #2]
	mov r0, #0
	ldrsh r1, [r7, r0]
	ldr r0, [r6, #0x20]
	add r0, r0, r5
	strh r1, [r0, #4]
	ldr r0, [r6, #0x20]
	add r1, r0, r5
	mov r0, #0
	strh r0, [r1, #6]
	add r1, r0, #0
	bl ov07_02222D88
	ldr r1, [r6, #0x20]
	mov r2, #6
	add r1, r1, r5
	str r0, [r1, #8]
	ldr r0, [sp]
	add r1, r0, #0
	ldr r1, [r1, #0x48]
	bl ov07_0221DDB0
	cmp r0, #1
	bne _0221E83E
	ldr r0, [r6, #0x20]
	mov r1, #4
	add r0, r0, r5
	ldrsh r2, [r0, r1]
	sub r1, r1, #5
	mul r1, r2
	strh r1, [r0, #4]
_0221E83E:
	ldr r0, [sp, #4]
	add r4, #8
	add r0, r0, #1
	add r5, #0xc
	add r7, r7, #2
	str r0, [sp, #4]
	cmp r0, #0x10
	blt _0221E7F4
	mov r2, #1
	ldr r0, _0221E864 ; =ov07_0221E87C
	add r1, r6, #0
	lsl r2, r2, #0xc
	bl CreateSysTask
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221E860: .word ov07_02234C20
_0221E864: .word ov07_0221E87C
	thumb_func_end ov07_0221E788

	thumb_func_start ov07_0221E868
ov07_0221E868: ; 0x0221E868
	add r1, r0, #0
	add r1, #0x44
	ldrh r2, [r1]
	mov r1, #2
	add r0, #0x44
	orr r1, r2
	strh r1, [r0]
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221E868

	thumb_func_start ov07_0221E87C
ov07_0221E87C: ; 0x0221E87C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #0x18]
	ldr r4, [r5, #0x20]
	cmp r0, #1
	bne _0221E8AA
	add r4, #0xc0
	ldr r0, [r4]
	bl ov07_02222C60
	ldr r0, [r5, #0x20]
	bl FreeToHeap
	add r0, r5, #0
	bl FreeToHeap
	add r0, r6, #0
	bl DestroySysTask
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0221E8AA:
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	bl ov07_02222C84
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
_0221E8BA:
	mov r0, #6
	ldrsh r1, [r4, r0]
	mov r0, #4
	ldrsh r0, [r4, r0]
	add r0, r1, r0
	strh r0, [r4, #6]
	mov r0, #0
	ldrsh r6, [r4, r0]
	mov r0, #2
	ldrsh r0, [r4, r0]
	cmp r6, r0
	bge _0221E902
	ldr r0, [sp]
	lsl r1, r6, #2
	add r5, r0, r1
	mov r7, #2
_0221E8DA:
	ldr r1, [r4, #8]
	mov r2, #6
	lsl r0, r1, #0x10
	asr r1, r1, #0x10
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	lsl r1, r1, #0x10
	ldrsh r2, [r4, r2]
	asr r0, r0, #0x10
	lsr r1, r1, #0x10
	add r0, r0, r2
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl ov07_02222D88
	stmia r5!, {r0}
	ldrsh r0, [r4, r7]
	add r6, r6, #1
	cmp r6, r0
	blt _0221E8DA
_0221E902:
	ldr r0, [sp, #4]
	add r4, #0xc
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #0x10
	blt _0221E8BA
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0221E87C

	thumb_func_start ov07_0221E914
ov07_0221E914: ; 0x0221E914
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r6, r1, #0
	add r5, r0, #0
	ldr r0, [r6, #0x18]
	ldr r4, [r6, #0x24]
	cmp r0, #1
	bne _0221E93A
	add r0, r4, #0
	bl FreeToHeap
	add r0, r6, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
	add sp, #0x10
	pop {r4, r5, r6, pc}
_0221E93A:
	ldr r1, _0221E9CC ; =0x0000018B
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _0221E94A
	cmp r0, #1
	beq _0221E958
	add sp, #0x10
	pop {r4, r5, r6, pc}
_0221E94A:
	mov r2, #0xff
	add r0, r2, #0
	add r0, #0x8b
	strb r2, [r4, r0]
	ldrb r0, [r4, r1]
	add r0, r0, #1
	strb r0, [r4, r1]
_0221E958:
	mov r2, #0x63
	lsl r2, r2, #2
	ldrb r1, [r4, r2]
	sub r0, r2, #2
	ldrb r0, [r4, r0]
	lsl r3, r1, #1
	add r3, r4, r3
	add r3, #0x88
	ldrh r3, [r3]
	sub r3, r3, #2
	cmp r0, r3
	bge _0221E97E
	sub r0, r2, #2
	ldrb r0, [r4, r0]
	add sp, #0x10
	add r1, r0, #1
	sub r0, r2, #2
	strb r1, [r4, r0]
	pop {r4, r5, r6, pc}
_0221E97E:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r2, #0x90
	str r2, [sp, #8]
	add r0, r4, r1
	ldrb r0, [r0, #8]
	add r2, #0xf9
	mov r1, #9
	lsl r0, r0, #0x14
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	ldrb r2, [r4, r2]
	ldr r0, [r4, #4]
	ldr r3, [r4]
	bl PaletteData_LoadFromNarc
	ldr r1, _0221E9D0 ; =0x0000018A
	mov r0, #0
	strb r0, [r4, r1]
	add r2, r1, #2
	ldrb r3, [r4, r2]
	sub r2, r1, #2
	ldrb r2, [r4, r2]
	sub r2, r2, #1
	cmp r3, r2
	blt _0221E9BE
	add r1, r1, #2
	add sp, #0x10
	strb r0, [r4, r1]
	pop {r4, r5, r6, pc}
_0221E9BE:
	add r0, r1, #2
	ldrb r0, [r4, r0]
	add r2, r0, #1
	add r0, r1, #2
	strb r2, [r4, r0]
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0221E9CC: .word 0x0000018B
_0221E9D0: .word 0x0000018A
	thumb_func_end ov07_0221E914

	thumb_func_start ov07_0221E9D4
ov07_0221E9D4: ; 0x0221E9D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r6, [r5, #0x48]
	mov r1, #0x28
	ldr r0, [r6]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x28
	add r4, r0, #0
	bl MI_CpuFill8
	mov r1, #0x19
	ldr r0, [r6]
	lsl r1, r1, #4
	bl AllocFromHeap
	mov r2, #0x19
	mov r1, #0
	lsl r2, r2, #4
	str r0, [r4, #0x24]
	bl MI_CpuFill8
	add r0, r5, #0
	add r0, #0x44
	ldrh r1, [r0]
	mov r0, #4
	mov r2, #3
	orr r1, r0
	add r0, r5, #0
	add r0, #0x44
	strh r1, [r0]
	mov r0, #0
	str r0, [r4, #0x18]
	ldr r1, [r6]
	ldr r0, [r4, #0x24]
	str r1, [r0]
	add r0, r6, #0
	add r0, #0xc8
	ldr r1, [r0]
	ldr r0, [r4, #0x24]
	str r1, [r0, #4]
	mov r0, #6
	lsl r0, r0, #6
	add r0, r6, r0
	add r1, r4, #0
	bl ov07_0221DD38
	ldr r0, [r5, #0x10]
	cmp r0, #0x34
	bhi _0221EA8E
	bhs _0221EAB0
	cmp r0, #0x1d
	bhi _0221EA88
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0221EA4C: ; jump table
	.short _0221EAA0 - _0221EA4C - 2 ; case 0
	.short _0221EAA0 - _0221EA4C - 2 ; case 1
	.short _0221EAD4 - _0221EA4C - 2 ; case 2
	.short _0221EAA0 - _0221EA4C - 2 ; case 3
	.short _0221EAA4 - _0221EA4C - 2 ; case 4
	.short _0221EAA0 - _0221EA4C - 2 ; case 5
	.short _0221EAE0 - _0221EA4C - 2 ; case 6
	.short _0221EAC8 - _0221EA4C - 2 ; case 7
	.short _0221EAE0 - _0221EA4C - 2 ; case 8
	.short _0221EAE0 - _0221EA4C - 2 ; case 9
	.short _0221EAE0 - _0221EA4C - 2 ; case 10
	.short _0221EAD8 - _0221EA4C - 2 ; case 11
	.short _0221EAE0 - _0221EA4C - 2 ; case 12
	.short _0221EAE0 - _0221EA4C - 2 ; case 13
	.short _0221EACC - _0221EA4C - 2 ; case 14
	.short _0221EAE0 - _0221EA4C - 2 ; case 15
	.short _0221EAE0 - _0221EA4C - 2 ; case 16
	.short _0221EAD0 - _0221EA4C - 2 ; case 17
	.short _0221EAE0 - _0221EA4C - 2 ; case 18
	.short _0221EAA8 - _0221EA4C - 2 ; case 19
	.short _0221EAE0 - _0221EA4C - 2 ; case 20
	.short _0221EAE0 - _0221EA4C - 2 ; case 21
	.short _0221EAB4 - _0221EA4C - 2 ; case 22
	.short _0221EAE0 - _0221EA4C - 2 ; case 23
	.short _0221EAE0 - _0221EA4C - 2 ; case 24
	.short _0221EAE0 - _0221EA4C - 2 ; case 25
	.short _0221EAE0 - _0221EA4C - 2 ; case 26
	.short _0221EAE0 - _0221EA4C - 2 ; case 27
	.short _0221EABC - _0221EA4C - 2 ; case 28
	.short _0221EAC0 - _0221EA4C - 2 ; case 29
_0221EA88:
	cmp r0, #0x2c
	beq _0221EADC
	b _0221EAE0
_0221EA8E:
	cmp r0, #0x39
	bhi _0221EA9A
	bhs _0221EAC4
	cmp r0, #0x35
	beq _0221EAAC
	b _0221EAE0
_0221EA9A:
	cmp r0, #0x3a
	beq _0221EAB8
	b _0221EAE0
_0221EAA0:
	mov r5, #0
	b _0221EAEC
_0221EAA4:
	mov r5, #2
	b _0221EAEC
_0221EAA8:
	mov r5, #4
	b _0221EAEC
_0221EAAC:
	mov r5, #6
	b _0221EAEC
_0221EAB0:
	mov r5, #8
	b _0221EAEC
_0221EAB4:
	mov r5, #0xa
	b _0221EAEC
_0221EAB8:
	mov r5, #0xc
	b _0221EAEC
_0221EABC:
	mov r5, #0xe
	b _0221EAEC
_0221EAC0:
	mov r5, #0x10
	b _0221EAEC
_0221EAC4:
	mov r5, #0x1a
	b _0221EAEC
_0221EAC8:
	mov r5, #0x1c
	b _0221EAEC
_0221EACC:
	mov r5, #0x14
	b _0221EAEC
_0221EAD0:
	mov r5, #0x12
	b _0221EAEC
_0221EAD4:
	mov r5, #0x16
	b _0221EAEC
_0221EAD8:
	mov r5, #0x18
	b _0221EAEC
_0221EADC:
	mov r5, #0x1e
	b _0221EAEC
_0221EAE0:
	ldr r0, _0221EB70 ; =ov07_02237870
	cmp r0, #0
	beq _0221EAEA
	bl GF_AssertFail
_0221EAEA:
	mov r5, #0
_0221EAEC:
	mov r0, #1
	str r0, [sp]
	ldr r3, [r6]
	mov r0, #9
	add r1, r5, #0
	mov r2, #0
	bl GfGfxLoader_LoadFromNarc
	add r7, r0, #0
	bne _0221EB04
	bl GF_AssertFail
_0221EB04:
	ldr r1, [r4, #0x24]
	ldr r0, _0221EB74 ; =0x00000189
	add r2, r5, #1
	strb r2, [r1, r0]
	ldrb r3, [r7]
	mov r1, #0
	add r0, r7, #0
	cmp r3, #0xff
	beq _0221EB2A
_0221EB16:
	ldr r2, [r4, #0x24]
	add r0, r0, #1
	add r2, r2, r1
	strb r3, [r2, #8]
	add r1, r1, #1
	lsl r1, r1, #0x10
	ldrb r3, [r0]
	lsr r1, r1, #0x10
	cmp r3, #0xff
	bne _0221EB16
_0221EB2A:
	mov r0, #0x62
	ldr r2, [r4, #0x24]
	lsl r0, r0, #2
	strb r1, [r2, r0]
	add r0, r7, #0
	add r0, #0x80
	ldrh r5, [r0]
	add r3, r7, #0
	ldr r0, _0221EB78 ; =0x0000FF98
	mov r6, #0
	add r3, #0x80
	cmp r5, r0
	beq _0221EB5C
_0221EB44:
	ldr r2, [r4, #0x24]
	lsl r1, r6, #1
	add r1, r2, r1
	add r1, #0x88
	strh r5, [r1]
	add r3, r3, #2
	add r1, r6, #1
	lsl r1, r1, #0x10
	ldrh r5, [r3]
	lsr r6, r1, #0x10
	cmp r5, r0
	bne _0221EB44
_0221EB5C:
	add r0, r7, #0
	bl FreeToHeap
	ldr r0, _0221EB7C ; =ov07_0221E914
	ldr r2, _0221EB80 ; =0x00001001
	add r1, r4, #0
	bl CreateSysTask
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221EB70: .word ov07_02237870
_0221EB74: .word 0x00000189
_0221EB78: .word 0x0000FF98
_0221EB7C: .word ov07_0221E914
_0221EB80: .word 0x00001001
	thumb_func_end ov07_0221E9D4

	thumb_func_start ov07_0221EB84
ov07_0221EB84: ; 0x0221EB84
	add r1, r0, #0
	add r1, #0x44
	ldrh r2, [r1]
	mov r1, #4
	add r0, #0x44
	orr r1, r2
	strh r1, [r0]
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221EB84

	thumb_func_start ov07_0221EB98
ov07_0221EB98: ; 0x0221EB98
	ldr r3, _0221EBA0 ; =ov07_0221EBA4
	mov r2, #1
	bx r3
	nop
_0221EBA0: .word ov07_0221EBA4
	thumb_func_end ov07_0221EB98

	thumb_func_start ov07_0221EBA4
ov07_0221EBA4: ; 0x0221EBA4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r1, #2
	add r5, r0, #0
	add r6, r2, #0
	bl ov07_0221FB04
	add r1, r0, #0
	lsl r0, r4, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	bl ToggleBgLayer
	add r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221EBEA
	add r0, r5, #0
	add r0, #0xc4
	lsl r1, r4, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	mov r2, #2
	mov r3, #4
	bl SetBgControlParam
	b _0221EC10
_0221EBEA:
	add r0, r5, #0
	add r0, #0xc4
	lsl r1, r4, #0x18
	lsl r3, r6, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	mov r2, #0
	lsr r3, r3, #0x18
	bl SetBgControlParam
	add r0, r5, #0
	add r0, #0xc4
	lsl r1, r4, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	mov r2, #2
	mov r3, #4
	bl SetBgControlParam
_0221EC10:
	add r0, r5, #0
	add r0, #0xc4
	lsl r1, r4, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221EC4E
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0x19
	add r2, r5, #0
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, r1, #4
	add r2, #0xc4
	ldr r1, [r5, r1]
	ldr r2, [r2]
	add r3, r4, #0
	bl GfGfxLoader_LoadCharData
	b _0221EC56
_0221EC4E:
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_0221FB30
_0221EC56:
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #0x19
	lsl r1, r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r5, r1]
	add r1, #0xc
	ldr r1, [r5, r1]
	add r5, #0xc4
	ldr r2, [r5]
	add r3, r4, #0
	bl GfGfxLoader_LoadScrnData
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221EBA4

	thumb_func_start ov07_0221EC7C
ov07_0221EC7C: ; 0x0221EC7C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #1
	add r5, r0, #0
	bl ov07_0221FB04
	add r1, r0, #0
	lsl r0, r4, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	add r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221ECB4
	add r0, r5, #0
	add r0, #0xc4
	lsl r1, r4, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	mov r2, #2
	mov r3, #3
	bl SetBgControlParam
	b _0221ECD8
_0221ECB4:
	add r0, r5, #0
	add r0, #0xc4
	lsl r1, r4, #0x18
	mov r2, #0
	ldr r0, [r0]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl SetBgControlParam
	add r0, r5, #0
	add r0, #0xc4
	lsl r1, r4, #0x18
	ldr r0, [r0]
	lsr r1, r1, #0x18
	mov r2, #2
	mov r3, #3
	bl SetBgControlParam
_0221ECD8:
	add r5, #0xc4
	lsl r1, r4, #0x18
	ldr r0, [r5]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0221EC7C

	thumb_func_start ov07_0221ECE8
ov07_0221ECE8: ; 0x0221ECE8
	add r1, r0, #0
	add r1, #0x44
	ldrh r2, [r1]
	mov r1, #1
	add r0, #0x44
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0]
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221ECE8

	thumb_func_start ov07_0221ED00
ov07_0221ED00: ; 0x0221ED00
	push {r3, lr}
	ldr r1, [r0, #0x48]
	mov r0, #6
	lsl r0, r0, #6
	add r0, r1, r0
	mov r1, #5
	bl ov07_0221DD14
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov07_0221ED00

	thumb_func_start ov07_0221ED14
ov07_0221ED14: ; 0x0221ED14
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r2, [r4, #0x14]
	add r5, r0, #0
	lsl r3, r2, #2
	ldr r2, _0221ED40 ; =ov07_02234BC0
	ldr r2, [r2, r3]
	blx r2
	cmp r0, #0
	bne _0221ED3E
	mov r0, #0x5f
	ldr r1, [r4, #0x48]
	mov r2, #0
	lsl r0, r0, #2
	strb r2, [r1, r0]
	add r0, r4, #0
	bl FreeToHeap
	add r0, r5, #0
	bl DestroySysTask
_0221ED3E:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221ED40: .word ov07_02234BC0
	thumb_func_end ov07_0221ED14

	thumb_func_start ov07_0221ED44
ov07_0221ED44: ; 0x0221ED44
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov07_0221DF1C
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	strb r0, [r4, #0xd]
	ldr r0, [r5, #0x18]
	ldr r2, _0221ED88 ; =0x0000044C
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	str r0, [r4, #0x14]
	ldr r0, _0221ED8C ; =0xFFFF0000
	and r0, r1
	lsr r0, r0, #0x10
	str r0, [r4, #0x18]
	ldr r0, _0221ED90 ; =ov07_0221ED14
	add r1, r4, #0
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221ED88: .word 0x0000044C
_0221ED8C: .word 0xFFFF0000
_0221ED90: .word ov07_0221ED14
	thumb_func_end ov07_0221ED44

	thumb_func_start ov07_0221ED94
ov07_0221ED94: ; 0x0221ED94
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov07_0221DF1C
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	strb r0, [r4, #0xd]
	ldr r0, [r5, #0x18]
	ldr r2, _0221EE64 ; =0xFFFF0000
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x18]
	add r1, r0, #4
	str r1, [r5, #0x18]
	ldr r0, [r1]
	add r1, r1, #4
	str r1, [r5, #0x18]
	lsl r1, r0, #0x10
	lsr r1, r1, #0x10
	and r0, r2
	str r1, [r4, #0x14]
	lsr r0, r0, #0x10
	str r0, [r4, #0x18]
	ldr r0, [r5, #0x18]
	ldr r1, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	add r0, r1, #0
	and r0, r2
	lsr r0, r0, #0x10
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	asr r1, r1, #0x10
	asr r0, r0, #0x10
	cmp r1, #6
	bhi _0221EE4C
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0221EDF2: ; jump table
	.short _0221EE4C - _0221EDF2 - 2 ; case 0
	.short _0221EE00 - _0221EDF2 - 2 ; case 1
	.short _0221EE0A - _0221EDF2 - 2 ; case 2
	.short _0221EE14 - _0221EDF2 - 2 ; case 3
	.short _0221EE1E - _0221EDF2 - 2 ; case 4
	.short _0221EE28 - _0221EDF2 - 2 ; case 5
	.short _0221EE3A - _0221EDF2 - 2 ; case 6
_0221EE00:
	mov r1, #0xe
	ldrsb r1, [r4, r1]
	add r0, r1, r0
	strb r0, [r4, #0xe]
	b _0221EE56
_0221EE0A:
	mov r1, #0xe
	ldrsb r1, [r4, r1]
	sub r0, r1, r0
	strb r0, [r4, #0xe]
	b _0221EE56
_0221EE14:
	mov r1, #0xf
	ldrsb r1, [r4, r1]
	add r0, r1, r0
	strb r0, [r4, #0xf]
	b _0221EE56
_0221EE1E:
	mov r1, #0xf
	ldrsb r1, [r4, r1]
	sub r0, r1, r0
	strb r0, [r4, #0xf]
	b _0221EE56
_0221EE28:
	mov r1, #0xe
	ldrsb r1, [r4, r1]
	add r1, r1, r0
	strb r1, [r4, #0xe]
	mov r1, #0xf
	ldrsb r1, [r4, r1]
	add r0, r1, r0
	strb r0, [r4, #0xf]
	b _0221EE56
_0221EE3A:
	mov r1, #0xe
	ldrsb r1, [r4, r1]
	sub r1, r1, r0
	strb r1, [r4, #0xe]
	mov r1, #0xf
	ldrsb r1, [r4, r1]
	sub r0, r1, r0
	strb r0, [r4, #0xf]
	b _0221EE56
_0221EE4C:
	ldr r0, _0221EE68 ; =ov07_0223789C
	cmp r0, #0
	beq _0221EE56
	bl GF_AssertFail
_0221EE56:
	ldr r0, _0221EE6C ; =ov07_0221ED14
	ldr r2, _0221EE70 ; =0x0000044C
	add r1, r4, #0
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	nop
_0221EE64: .word 0xFFFF0000
_0221EE68: .word ov07_0223789C
_0221EE6C: .word ov07_0221ED14
_0221EE70: .word 0x0000044C
	thumb_func_end ov07_0221ED94

	thumb_func_start ov07_0221EE74
ov07_0221EE74: ; 0x0221EE74
	push {r3, r4, r5, lr}
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r5, [r1]
	add r2, r1, #4
	str r2, [r0, #0x18]
	ldr r1, [r2]
	lsl r1, r1, #0x10
	asr r4, r1, #0x10
	add r1, r2, #4
	str r1, [r0, #0x18]
	mov r1, #6
	lsl r1, r1, #6
	add r0, r0, r1
	mov r1, #1
	bl ov07_0221DD8C
	cmp r5, #3
	bhi _0221EEBE
	add r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0221EEA8: ; jump table
	.short _0221EEB0 - _0221EEA8 - 2 ; case 0
	.short _0221EEB4 - _0221EEA8 - 2 ; case 1
	.short _0221EEB8 - _0221EEA8 - 2 ; case 2
	.short _0221EEBC - _0221EEA8 - 2 ; case 3
_0221EEB0:
	strh r4, [r0, #8]
	pop {r3, r4, r5, pc}
_0221EEB4:
	strh r4, [r0, #0xa]
	pop {r3, r4, r5, pc}
_0221EEB8:
	strh r4, [r0, #4]
	pop {r3, r4, r5, pc}
_0221EEBC:
	strh r4, [r0, #4]
_0221EEBE:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221EE74

	thumb_func_start ov07_0221EEC0
ov07_0221EEC0: ; 0x0221EEC0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov07_0221DF1C
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	strb r0, [r4, #0xd]
	ldr r0, [r5, #0x18]
	ldr r2, _0221EF08 ; =0x0000044C
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x18]
	add r1, r0, #4
	str r1, [r5, #0x18]
	ldr r0, [r1]
	add r1, r1, #4
	str r1, [r5, #0x18]
	lsl r1, r0, #0x10
	lsr r1, r1, #0x10
	add r1, r1, #3
	str r1, [r4, #0x14]
	ldr r1, _0221EF0C ; =0xFFFF0000
	and r0, r1
	lsr r0, r0, #0x10
	str r0, [r4, #0x18]
	ldr r0, _0221EF10 ; =ov07_0221ED14
	add r1, r4, #0
	bl CreateSysTask
	pop {r3, r4, r5, pc}
	nop
_0221EF08: .word 0x0000044C
_0221EF0C: .word 0xFFFF0000
_0221EF10: .word ov07_0221ED14
	thumb_func_end ov07_0221EEC0

	thumb_func_start ov07_0221EF14
ov07_0221EF14: ; 0x0221EF14
	mov r1, #0x5f
	lsl r1, r1, #2
	ldrb r1, [r0, r1]
	cmp r1, #2
	bne _0221EF2C
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	mov r1, #0
	add r0, #0x8d
	strb r1, [r0]
	bx lr
_0221EF2C:
	mov r1, #1
	add r0, #0x8d
	strb r1, [r0]
	bx lr
	thumb_func_end ov07_0221EF14

	thumb_func_start ov07_0221EF34
ov07_0221EF34: ; 0x0221EF34
	mov r1, #0x5f
	lsl r1, r1, #2
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _0221EF4C
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	mov r1, #0
	add r0, #0x8d
	strb r1, [r0]
	bx lr
_0221EF4C:
	mov r1, #1
	add r0, #0x8d
	strb r1, [r0]
	bx lr
	thumb_func_end ov07_0221EF34

	thumb_func_start ov07_0221EF54
ov07_0221EF54: ; 0x0221EF54
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	bl ov07_0221DF1C
	add r7, r0, #0
	ldr r0, [r5, #0x18]
	mov r1, #0
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r4, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	mov r0, #3
	bl ToggleBgLayer
	add r0, r5, #0
	add r0, #0xc4
	mov r2, #0
	ldr r0, [r0]
	mov r1, #3
	add r3, r2, #0
	bl SetBgControlParam
	add r0, r4, #0
	mov r1, #0
	bl ov07_0221FB7C
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	add r2, r5, #0
	str r0, [sp, #0xc]
	add r2, #0xc4
	ldr r2, [r2]
	mov r0, #7
	mov r3, #3
	bl GfGfxLoader_LoadCharData
	add r0, r4, #0
	mov r1, #1
	bl ov07_0221FB7C
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x90
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	ldr r3, [r5]
	mov r1, #7
	bl PaletteData_LoadNarc
	add r0, r5, #0
	add r0, #0xc4
	ldr r0, [r0]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	add r0, r7, #0
	add r1, r5, #0
	mov r2, #7
	mov r6, #2
	bl ov07_0221DDB0
	cmp r0, #1
	bne _0221EFEC
	mov r6, #3
_0221EFEC:
	add r0, r4, #0
	add r1, r6, #0
	bl ov07_0221FB7C
	add r1, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	add r5, #0xc4
	str r0, [sp, #0xc]
	ldr r2, [r5]
	mov r0, #7
	mov r3, #3
	bl GfGfxLoader_LoadScrnData
	mov r0, #3
	mov r1, #1
	bl ToggleBgLayer
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0221EF54

	thumb_func_start ov07_0221F024
ov07_0221F024: ; 0x0221F024
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov07_0221DF1C
	add r4, r0, #0
	ldr r0, [r5, #0x18]
	add r1, r0, #4
	str r1, [r5, #0x18]
	ldr r0, [r1]
	str r0, [sp]
	add r0, r1, #4
	str r0, [r5, #0x18]
	ldr r7, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r6, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	add r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221F056
	str r6, [r4, #0x10]
	b _0221F06E
_0221F056:
	add r0, r5, #0
	add r5, #0xc0
	ldr r1, [r5]
	ldrh r1, [r1, #0x16]
	bl ov07_0223192C
	cmp r0, #3
	bne _0221F06A
	str r7, [r4, #0x10]
	b _0221F06E
_0221F06A:
	ldr r0, [sp]
	str r0, [r4, #0x10]
_0221F06E:
	ldr r0, _0221F07C ; =ov07_0221ED14
	ldr r2, _0221F080 ; =0x0000044C
	add r1, r4, #0
	bl CreateSysTask
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221F07C: .word ov07_0221ED14
_0221F080: .word 0x0000044C
	thumb_func_end ov07_0221F024

	thumb_func_start ov07_0221F084
ov07_0221F084: ; 0x0221F084
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221F084

	thumb_func_start ov07_0221F088
ov07_0221F088: ; 0x0221F088
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221F088

	thumb_func_start ov07_0221F08C
ov07_0221F08C: ; 0x0221F08C
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221F08C

	thumb_func_start ov07_0221F090
ov07_0221F090: ; 0x0221F090
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221F090

	thumb_func_start ov07_0221F094
ov07_0221F094: ; 0x0221F094
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221F094

	thumb_func_start ov07_0221F098
ov07_0221F098: ; 0x0221F098
	ldr r1, [r0, #0x18]
	ldr r3, _0221F0AC ; =PlaySE
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	bx r3
	.balign 4, 0
_0221F0AC: .word PlaySE
	thumb_func_end ov07_0221F098

	thumb_func_start ov07_0221F0B0
ov07_0221F0B0: ; 0x0221F0B0
	ldr r1, [r0, #0x18]
	ldr r3, _0221F0C8 ; =StopSE
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	mov r1, #0
	bx r3
	nop
_0221F0C8: .word StopSE
	thumb_func_end ov07_0221F0B0

	thumb_func_start ov07_0221F0CC
ov07_0221F0CC: ; 0x0221F0CC
	push {r3, r4, r5, lr}
	ldr r1, [r0, #0x18]
	add r2, r1, #4
	str r2, [r0, #0x18]
	ldr r1, [r2]
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	add r1, r2, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	lsl r1, r2, #0x18
	asr r1, r1, #0x18
	bl ov07_0221F8C8
	add r5, r0, #0
	add r0, r4, #0
	bl PlaySE
	ldr r1, _0221F100 ; =0x0000FFFF
	add r0, r4, #0
	add r2, r5, #0
	bl sub_020061B4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221F100: .word 0x0000FFFF
	thumb_func_end ov07_0221F0CC

	thumb_func_start ov07_0221F104
ov07_0221F104: ; 0x0221F104
	push {r3, lr}
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	lsl r1, r2, #0x18
	asr r1, r1, #0x18
	bl ov07_0221F8C8
	bl sub_020061EC
	pop {r3, pc}
	thumb_func_end ov07_0221F104

	thumb_func_start ov07_0221F120
ov07_0221F120: ; 0x0221F120
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov07_0221C53C
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl memset
	mov r0, #1
	strb r0, [r4]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #0x1a]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	str r0, [r4, #8]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strb r0, [r4, #3]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r4, #8]
	add r0, r5, #0
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r0, r5, #0
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x10]
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsl r2, r2, #0x18
	asr r0, r0, #0x18
	asr r1, r1, #0x18
	asr r2, r2, #0x18
	bl ov07_0221F980
	str r0, [r4, #0x10]
	ldrh r0, [r4, #0x1a]
	bl PlaySE
	ldrh r0, [r4, #0x1a]
	ldr r1, _0221F1BC ; =0x0000FFFF
	ldr r2, [r4, #8]
	bl sub_020061B4
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_0221C56C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221F1BC: .word 0x0000FFFF
	thumb_func_end ov07_0221F120

	thumb_func_start ov07_0221F1C0
ov07_0221F1C0: ; 0x0221F1C0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov07_0221C53C
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl memset
	mov r0, #2
	strb r0, [r4]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #0x1a]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [r4, #8]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strb r0, [r4, #3]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldrh r0, [r4, #0x1a]
	bl PlaySE
	ldrh r0, [r4, #0x1a]
	ldr r1, _0221F234 ; =0x0000FFFF
	ldr r2, [r4, #8]
	bl sub_020061B4
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_0221C56C
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0221F234: .word 0x0000FFFF
	thumb_func_end ov07_0221F1C0

	thumb_func_start ov07_0221F238
ov07_0221F238: ; 0x0221F238
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov07_0221C53C
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl memset
	mov r0, #1
	strb r0, [r4]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #0x1a]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [r4, #8]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strb r0, [r4, #3]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r4, #8]
	add r0, r5, #0
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r0, r5, #0
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r0, r5, #0
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #0x10]
	ldrh r0, [r4, #0x1a]
	bl PlaySE
	ldrh r0, [r4, #0x1a]
	ldr r1, _0221F2D8 ; =0x0000FFFF
	ldr r2, [r4, #8]
	bl sub_020061B4
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_0221C56C
	pop {r3, r4, r5, pc}
	nop
_0221F2D8: .word 0x0000FFFF
	thumb_func_end ov07_0221F238

	thumb_func_start ov07_0221F2DC
ov07_0221F2DC: ; 0x0221F2DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov07_0221C53C
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl memset
	mov r0, #4
	strb r0, [r4]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #0x1a]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [r4, #0x14]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strb r0, [r4, #3]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strb r0, [r4, #0x18]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldrb r0, [r4, #3]
	strb r0, [r4, #4]
	ldr r1, [r4, #0x14]
	add r0, r5, #0
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #0x14]
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_0221C56C
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221F2DC

	thumb_func_start ov07_0221F340
ov07_0221F340: ; 0x0221F340
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov07_0221C53C
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl memset
	mov r0, #5
	strb r0, [r4]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strh r0, [r4, #0x1a]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [r4, #0x14]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r0, [r0]
	strb r0, [r4, #3]
	ldr r0, [r5, #0x18]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r4, #0x14]
	add r0, r5, #0
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
	bl ov07_0221F8C8
	str r0, [r4, #0x14]
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_0221C56C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0221F340

	thumb_func_start ov07_0221F398
ov07_0221F398: ; 0x0221F398
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221F398

	thumb_func_start ov07_0221F39C
ov07_0221F39C: ; 0x0221F39C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x90
	ldrh r0, [r0]
	cmp r0, #0
	beq _0221F3B8
	add r0, r4, #0
	mov r1, #1
	add r0, #0x8d
	strb r1, [r0]
	ldr r0, _0221F3F0 ; =0x0000017D
	mov r1, #0
	strb r1, [r4, r0]
	pop {r4, pc}
_0221F3B8:
	bl GF_IsAnySEPlaying
	cmp r0, #0
	beq _0221F3DC
	ldr r0, _0221F3F0 ; =0x0000017D
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	ldrb r1, [r4, r0]
	cmp r1, #0x5a
	bls _0221F3D4
	mov r1, #0
	strb r1, [r4, r0]
	pop {r4, pc}
_0221F3D4:
	mov r0, #1
	add r4, #0x8d
	strb r0, [r4]
	pop {r4, pc}
_0221F3DC:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x8d
	strb r1, [r0]
	ldr r0, _0221F3F0 ; =0x0000017D
	strb r1, [r4, r0]
	ldr r0, [r4, #0x18]
	add r0, r0, #4
	str r0, [r4, #0x18]
	pop {r4, pc}
	.balign 4, 0
_0221F3F0: .word 0x0000017D
	thumb_func_end ov07_0221F39C

	thumb_func_start ov07_0221F3F4
ov07_0221F3F4: ; 0x0221F3F4
	push {r3, lr}
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r3, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	add r1, r1, #4
	str r1, [r0, #0x18]
	lsl r0, r2, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	lsl r3, r3, #0x10
	ldr r0, _0221F420 ; =0x04001050
	mov r1, #1
	mov r2, #2
	lsr r3, r3, #0x10
	bl G2x_SetBlendAlpha_
	pop {r3, pc}
	nop
_0221F420: .word 0x04001050
	thumb_func_end ov07_0221F3F4

	thumb_func_start ov07_0221F424
ov07_0221F424: ; 0x0221F424
	ldr r3, _0221F428 ; =ov07_0221C69C
	bx r3
	.balign 4, 0
_0221F428: .word ov07_0221C69C
	thumb_func_end ov07_0221F424

	thumb_func_start ov07_0221F42C
ov07_0221F42C: ; 0x0221F42C
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221F42C

	thumb_func_start ov07_0221F430
ov07_0221F430: ; 0x0221F430
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	add r6, r5, #0
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r1, [r0]
	add r0, r0, #4
	str r0, [r5, #0x18]
	ldr r7, [r0]
	add r0, r0, #4
	lsl r4, r1, #2
	add r6, #0xcc
	str r0, [r5, #0x18]
	ldr r0, [r6, r4]
	cmp r0, #0
	beq _0221F458
	bl GF_AssertFail
_0221F458:
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200CF38
	str r0, [r6, r4]
	ldr r0, [r6, r4]
	cmp r0, #0
	bne _0221F472
	bl GF_AssertFail
_0221F472:
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r1, [r6, r4]
	add r0, #0xac
	ldr r0, [r0]
	add r2, r7, #0
	bl sub_0200CFF4
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200CF6C
	mov r2, #0x11
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
	add r0, r5, #0
	mov r1, #0
	add r2, sp, #0
	add r0, #0x18
_0221F4A4:
	ldr r3, [r5, #0x18]
	add r1, r1, #1
	ldr r3, [r3]
	str r3, [r2]
	ldr r3, [r0]
	add r2, r2, #4
	add r3, r3, #4
	str r3, [r0]
	cmp r1, #6
	blt _0221F4A4
	add r5, #0xc0
	ldr r0, [r5]
	ldr r1, [r6, r4]
	add r0, #0xac
	ldr r0, [r0]
	add r2, sp, #0
	bl sub_0200D3F8
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221F430

	thumb_func_start ov07_0221F4CC
ov07_0221F4CC: ; 0x0221F4CC
	push {r3, r4, lr}
	sub sp, #0xc
	add r2, r0, #0
	ldr r0, [r2, #0x18]
	mov r4, #0x6e
	add r0, r0, #4
	str r0, [r2, #0x18]
	ldr r1, [r0]
	add r0, r0, #4
	str r0, [r2, #0x18]
	ldr r3, [r0]
	add r0, r0, #4
	str r0, [r2, #0x18]
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _0221F510 ; =0x00001388
	lsl r1, r1, #2
	add r0, r3, r0
	str r0, [sp, #8]
	add r0, r2, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r1, r2, r1
	add r0, #0xac
	add r1, #0xcc
	lsl r4, r4, #2
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2, r4]
	bl sub_0200D504
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_0221F510: .word 0x00001388
	thumb_func_end ov07_0221F4CC

	thumb_func_start ov07_0221F514
ov07_0221F514: ; 0x0221F514
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	add r0, r0, #4
	str r0, [r4, #0x18]
	ldr r3, [r0]
	add r0, r0, #4
	str r0, [r4, #0x18]
	ldr r1, [r0]
	add r2, r0, #4
	str r2, [r4, #0x18]
	ldr r0, [r2]
	add r2, r2, #4
	str r2, [r4, #0x18]
	mov r2, #0x6f
	lsl r2, r2, #2
	ldr r2, [r4, r2]
	lsl r3, r3, #2
	str r2, [sp]
	str r1, [sp, #4]
	mov r2, #0
	str r2, [sp, #8]
	mov r2, #1
	str r2, [sp, #0xc]
	str r0, [sp, #0x10]
	ldr r0, _0221F570 ; =0x00001388
	add r2, r4, #0
	add r0, r1, r0
	str r0, [sp, #0x14]
	add r2, #0xc0
	ldr r2, [r2]
	add r0, r4, #0
	add r3, r4, r3
	add r0, #0xc8
	add r2, #0xac
	add r3, #0xcc
	ldr r0, [r0]
	ldr r2, [r2]
	ldr r3, [r3]
	mov r1, #2
	bl sub_0200D68C
	add sp, #0x18
	pop {r4, pc}
	nop
_0221F570: .word 0x00001388
	thumb_func_end ov07_0221F514

	thumb_func_start ov07_0221F574
ov07_0221F574: ; 0x0221F574
	push {r4, lr}
	sub sp, #8
	add r2, r0, #0
	ldr r0, [r2, #0x18]
	mov r4, #7
	add r0, r0, #4
	str r0, [r2, #0x18]
	ldr r1, [r0]
	add r0, r0, #4
	str r0, [r2, #0x18]
	ldr r3, [r0]
	add r0, r0, #4
	str r0, [r2, #0x18]
	mov r0, #1
	str r0, [sp]
	ldr r0, _0221F5B8 ; =0x00001388
	lsl r1, r1, #2
	add r0, r3, r0
	str r0, [sp, #4]
	add r0, r2, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r1, r2, r1
	add r0, #0xac
	add r1, #0xcc
	lsl r4, r4, #6
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2, r4]
	bl sub_0200D6EC
	add sp, #8
	pop {r4, pc}
	nop
_0221F5B8: .word 0x00001388
	thumb_func_end ov07_0221F574

	thumb_func_start ov07_0221F5BC
ov07_0221F5BC: ; 0x0221F5BC
	push {r4, lr}
	sub sp, #8
	add r2, r0, #0
	ldr r0, [r2, #0x18]
	mov r4, #0x71
	add r0, r0, #4
	str r0, [r2, #0x18]
	ldr r1, [r0]
	add r0, r0, #4
	str r0, [r2, #0x18]
	ldr r3, [r0]
	add r0, r0, #4
	str r0, [r2, #0x18]
	mov r0, #1
	str r0, [sp]
	ldr r0, _0221F600 ; =0x00001388
	lsl r1, r1, #2
	add r0, r3, r0
	str r0, [sp, #4]
	add r0, r2, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r1, r2, r1
	add r0, #0xac
	add r1, #0xcc
	lsl r4, r4, #2
	ldr r0, [r0]
	ldr r1, [r1]
	ldr r2, [r2, r4]
	bl sub_0200D71C
	add sp, #8
	pop {r4, pc}
	nop
_0221F600: .word 0x00001388
	thumb_func_end ov07_0221F5BC

	thumb_func_start ov07_0221F604
ov07_0221F604: ; 0x0221F604
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r4, r0, #0
	ldr r1, [r4, #0x18]
	add r1, r1, #4
	str r1, [r4, #0x18]
	ldr r5, [r1]
	add r2, r1, #4
	str r2, [r4, #0x18]
	ldr r1, [r2]
	str r1, [sp]
	add r1, r2, #4
	str r1, [r4, #0x18]
	bl ov07_0221C470
	add r6, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #0
	bl ov07_02221F80
	add r1, sp, #0xc
	strh r0, [r1]
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #1
	bl ov07_02221F80
	add r2, sp, #0xc
	strh r0, [r2, #2]
	mov r1, #0
	strh r1, [r2, #4]
	strh r1, [r2, #6]
	mov r0, #0x64
	str r0, [sp, #0x14]
	mov r0, #1
	str r0, [sp, #0x1c]
	str r0, [sp, #0x38]
	add r0, r4, #0
	ldr r3, _0221F70C ; =0x00001388
	str r1, [sp, #0x18]
	str r1, [sp, #0x3c]
	add r2, sp, #0xc
	add r0, #0x18
_0221F65C:
	ldr r6, [r4, #0x18]
	add r1, r1, #1
	ldr r6, [r6]
	add r6, r6, r3
	str r6, [r2, #0x14]
	ldr r6, [r0]
	add r2, r2, #4
	add r6, r6, #4
	str r6, [r0]
	cmp r1, #6
	blt _0221F65C
	mov r0, #0x41
	lsl r0, r0, #2
	add r3, sp, #0xc
	add r2, r4, r0
	mov r6, #6
_0221F67C:
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	sub r6, r6, #1
	bne _0221F67C
	ldr r0, [r3]
	lsl r7, r5, #2
	str r0, [r2]
	add r0, r4, #0
	str r0, [sp, #8]
	add r0, #0xcc
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	ldr r1, [sp, #8]
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r1, r7]
	add r2, sp, #0xc
	bl sub_0200D734
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	add r2, r4, #0
	ldr r3, [r0]
	add r0, r0, #4
	add r2, #0x18
	mov r6, #0
	str r0, [r4, #0x18]
	cmp r3, #0
	ble _0221F6D4
	add r5, r4, #0
_0221F6BC:
	ldr r0, [r4, #0x18]
	add r6, r6, #1
	ldr r1, [r0]
	add r0, r5, #0
	add r0, #0x94
	str r1, [r0]
	ldr r0, [r2]
	add r5, r5, #4
	add r0, r0, #4
	str r0, [r2]
	cmp r6, r3
	blt _0221F6BC
_0221F6D4:
	cmp r6, #0xa
	bge _0221F6EC
	lsl r0, r6, #2
	add r2, r4, r0
	mov r1, #0
_0221F6DE:
	add r0, r2, #0
	add r0, #0x94
	add r6, r6, #1
	add r2, r2, #4
	str r1, [r0]
	cmp r6, #0xa
	blt _0221F6DE
_0221F6EC:
	ldr r0, [sp]
	bl ov07_0222304C
	add r5, r0, #0
	add r0, r4, #0
	add r4, #0xc0
	ldr r1, [r4]
	ldr r2, [sp, #8]
	add r1, #0xac
	ldr r1, [r1]
	ldr r2, [r2, r7]
	ldr r3, [sp, #4]
	blx r5
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0221F70C: .word 0x00001388
	thumb_func_end ov07_0221F604

	thumb_func_start ov07_0221F710
ov07_0221F710: ; 0x0221F710
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	ldr r1, [r5, #0x18]
	add r1, r1, #4
	str r1, [r5, #0x18]
	ldr r4, [r1]
	add r1, r1, #4
	str r1, [r5, #0x18]
	ldr r7, [r1]
	add r1, r1, #4
	str r1, [r5, #0x18]
	bl ov07_0221C470
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	bl ov07_02221F80
	add r1, sp, #0
	strh r0, [r1]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov07_02221F80
	add r2, sp, #0
	strh r0, [r2, #2]
	mov r1, #0
	strh r1, [r2, #4]
	strh r1, [r2, #6]
	mov r0, #0x64
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0x10]
	str r0, [sp, #0x2c]
	add r0, r5, #0
	ldr r3, _0221F7C0 ; =0x00001388
	str r1, [sp, #0xc]
	str r1, [sp, #0x30]
	add r2, sp, #0
	add r0, #0x18
_0221F766:
	ldr r6, [r5, #0x18]
	add r1, r1, #1
	ldr r6, [r6]
	add r6, r6, r3
	str r6, [r2, #0x14]
	ldr r6, [r0]
	add r2, r2, #4
	add r6, r6, #4
	str r6, [r0]
	cmp r1, #6
	blt _0221F766
	mov r0, #0x41
	lsl r0, r0, #2
	add r6, sp, #0
	add r3, r5, r0
	mov r2, #6
_0221F786:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0221F786
	ldr r0, [r6]
	lsl r1, r4, #2
	str r0, [r3]
	add r0, r5, #0
	add r0, #0xc0
	ldr r0, [r0]
	add r1, r5, r1
	add r0, #0xac
	add r1, #0xcc
	ldr r0, [r0]
	ldr r1, [r1]
	add r2, sp, #0
	bl sub_0200D734
	add r5, #0xdc
	lsl r4, r7, #2
	add r6, r0, #0
	ldr r0, [r5, r4]
	cmp r0, #0
	beq _0221F7BA
	bl GF_AssertFail
_0221F7BA:
	str r6, [r5, r4]
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0221F7C0: .word 0x00001388
	thumb_func_end ov07_0221F710

	thumb_func_start ov07_0221F7C4
ov07_0221F7C4: ; 0x0221F7C4
	push {r3, r4, r5, lr}
	ldr r1, [r0, #0x18]
	add r5, r0, #0
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r2, [r1]
	add r1, r1, #4
	add r5, #0xcc
	lsl r4, r2, #2
	str r1, [r0, #0x18]
	ldr r1, [r5, r4]
	cmp r1, #0
	beq _0221F7EA
	add r0, #0xc0
	ldr r0, [r0]
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200D998
_0221F7EA:
	mov r0, #0
	str r0, [r5, r4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221F7C4

	thumb_func_start ov07_0221F7F0
ov07_0221F7F0: ; 0x0221F7F0
	ldr r1, [r0, #0x18]
	add r1, r1, #4
	str r1, [r0, #0x18]
	ldr r3, [r1]
	add r2, r1, #4
	str r2, [r0, #0x18]
	ldr r1, [r2]
	add r2, r2, #4
	str r2, [r0, #0x18]
	lsl r2, r3, #2
	add r2, r0, r2
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r3, _0221F810 ; =sub_0200DCE8
	ldr r0, [r2, r0]
	bx r3
	.balign 4, 0
_0221F810: .word sub_0200DCE8
	thumb_func_end ov07_0221F7F0

	thumb_func_start ov07_0221F814
ov07_0221F814: ; 0x0221F814
	ldr r3, _0221F818 ; =GF_AssertFail
	bx r3
	.balign 4, 0
_0221F818: .word GF_AssertFail
	thumb_func_end ov07_0221F814

	thumb_func_start ov07_0221F81C
ov07_0221F81C: ; 0x0221F81C
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r1, [r5, #0x18]
	add r1, r1, #4
	str r1, [r5, #0x18]
	ldr r4, [r1]
	add r1, r1, #4
	str r1, [r5, #0x18]
	ldr r1, [r1]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	lsl r1, r1, #0x18
	asr r1, r1, #0x18
	bl ov07_0221F8C8
	ldr r1, [r5, #0x18]
	add r2, r1, #4
	str r2, [r5, #0x18]
	ldr r1, [r2]
	add r2, r2, #4
	str r2, [r5, #0x18]
	add r2, r5, #0
	add r2, #0xc0
	ldr r6, [r2]
	ldrh r3, [r6, #0x14]
	str r0, [sp]
	lsl r2, r3, #1
	mov r0, #0x46
	add r2, r6, r2
	add r3, r6, r3
	lsl r0, r0, #2
	str r1, [sp, #4]
	ldr r1, [r6, r0]
	add r2, #0xd8
	lsl r1, r1, #0x1f
	asr r1, r1, #0x1f
	str r1, [sp, #8]
	ldr r1, [r5]
	add r3, #0xe8
	str r1, [sp, #0xc]
	sub r0, #0xc
	ldrh r2, [r2]
	ldrb r3, [r3]
	ldr r0, [r6, r0]
	add r1, r4, #0
	bl sub_02071FDC
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221F81C

	thumb_func_start ov07_0221F880
ov07_0221F880: ; 0x0221F880
	push {r4, lr}
	add r4, r0, #0
	bl IsCryFinished
	cmp r0, #0
	bne _0221F8A4
	ldr r0, [r4, #0x18]
	add r1, r0, #4
	str r1, [r4, #0x18]
	ldr r0, [r1]
	add r1, r1, #4
	str r1, [r4, #0x18]
	mov r1, #0
	add r4, #0x8d
	strb r1, [r4]
	bl sub_02006300
	pop {r4, pc}
_0221F8A4:
	mov r0, #1
	add r4, #0x8d
	strb r0, [r4]
	pop {r4, pc}
	thumb_func_end ov07_0221F880

	thumb_func_start ov07_0221F8AC
ov07_0221F8AC: ; 0x0221F8AC
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221F8AC

	thumb_func_start ov07_0221F8B0
ov07_0221F8B0: ; 0x0221F8B0
	cmp r0, #0x58
	bls _0221F8B8
	mov r0, #0
	bx lr
_0221F8B8:
	lsl r1, r0, #2
	ldr r0, _0221F8C0 ; =ov07_02234DE8
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_0221F8C0: .word ov07_02234DE8
	thumb_func_end ov07_0221F8B0

	thumb_func_start ov07_0221F8C4
ov07_0221F8C4: ; 0x0221F8C4
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end ov07_0221F8C4

	thumb_func_start ov07_0221F8C8
ov07_0221F8C8: ; 0x0221F8C8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov07_0221C468
	add r7, r0, #0
	add r0, r5, #0
	bl ov07_0221C470
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl ov07_0223192C
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0223192C
	add r0, r5, #0
	add r1, r7, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _0221F904
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0223192C
	cmp r0, #4
	beq _0221F96A
_0221F904:
	add r0, r5, #0
	add r1, r7, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _0221F924
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _0221F924
	mov r0, #0
	mvn r0, r0
	mul r4, r0
	b _0221F96A
_0221F924:
	add r0, r5, #0
	add r1, r7, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _0221F948
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _0221F948
	cmp r4, #0
	ble _0221F96A
	mov r0, #0
	mvn r0, r0
	mul r4, r0
	b _0221F96A
_0221F948:
	add r0, r5, #0
	add r1, r7, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _0221F96A
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _0221F96A
	cmp r4, #0
	bge _0221F96A
	mov r0, #0
	mvn r0, r0
	mul r4, r0
_0221F96A:
	add r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0221F97A
	mov r0, #0
	mvn r0, r0
	mul r4, r0
_0221F97A:
	lsl r0, r4, #0x18
	asr r0, r0, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221F8C8

	thumb_func_start ov07_0221F980
ov07_0221F980: ; 0x0221F980
	push {r3, lr}
	cmp r0, r1
	bge _0221F992
	add r0, r2, #0
	bl abs
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	pop {r3, pc}
_0221F992:
	cmp r0, r1
	ble _0221F9A4
	add r0, r2, #0
	bl abs
	neg r0, r0
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	pop {r3, pc}
_0221F9A4:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov07_0221F980

	thumb_func_start ov07_0221F9A8
ov07_0221F9A8: ; 0x0221F9A8
	push {r3, r4, r5, lr}
	ldr r4, [r0, #0x18]
	add r3, r0, #0
	add r4, r4, #4
	str r4, [r0, #0x18]
	ldr r5, [r4]
	add r4, r4, #4
	add r3, #0x18
	str r4, [r0, #0x18]
	cmp r5, r2
	beq _0221F9CA
	cmp r5, r2
	beq _0221F9C6
	bl GF_AssertFail
_0221F9C6:
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221F9CA:
	mov r4, #0
	cmp r2, #0
	ble _0221F9E4
_0221F9D0:
	ldr r5, [r0, #0x18]
	add r4, r4, #1
	ldr r5, [r5]
	str r5, [r1]
	ldr r5, [r3]
	add r1, r1, #4
	add r5, r5, #4
	str r5, [r3]
	cmp r4, r2
	blt _0221F9D0
_0221F9E4:
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221F9A8

	thumb_func_start ov07_0221F9E8
ov07_0221F9E8: ; 0x0221F9E8
	push {r3, r4}
	add r4, r0, #0
	mov r0, #0x41
	lsl r0, r0, #2
	add r3, r1, r0
	mov r2, #6
_0221F9F4:
	ldmia r3!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r2, r2, #1
	bne _0221F9F4
	ldr r0, [r3]
	str r0, [r4]
	pop {r3, r4}
	bx lr
	thumb_func_end ov07_0221F9E8

	thumb_func_start ov07_0221FA04
ov07_0221FA04: ; 0x0221FA04
	add r0, #0xc0
	ldr r0, [r0]
	add r0, r0, r1
	add r0, #0xc0
	ldrb r0, [r0]
	bx lr
	thumb_func_end ov07_0221FA04

	thumb_func_start ov07_0221FA10
ov07_0221FA10: ; 0x0221FA10
	add r0, #0xc0
	ldr r0, [r0]
	add r0, r0, r1
	add r0, #0xe0
	ldrb r0, [r0]
	bx lr
	thumb_func_end ov07_0221FA10

	thumb_func_start ov07_0221FA1C
ov07_0221FA1C: ; 0x0221FA1C
	add r0, #0xc0
	ldr r2, [r0]
	lsl r0, r1, #1
	add r0, r2, r0
	add r0, #0xd8
	ldrh r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221FA1C

	thumb_func_start ov07_0221FA2C
ov07_0221FA2C: ; 0x0221FA2C
	add r0, #0xc0
	ldr r0, [r0]
	add r0, r0, r1
	add r0, #0xe8
	ldrb r0, [r0]
	bx lr
	thumb_func_end ov07_0221FA2C

	thumb_func_start ov07_0221FA38
ov07_0221FA38: ; 0x0221FA38
	add r0, #0xc0
	ldr r2, [r0]
	lsl r0, r1, #2
	add r0, r2, r0
	add r0, #0xec
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221FA38

	thumb_func_start ov07_0221FA48
ov07_0221FA48: ; 0x0221FA48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r4, r1, #2
	add r0, r0, r4
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0
	bne _0221FA60
	mov r0, #0
	pop {r3, r4, r5, pc}
_0221FA60:
	bl sub_020094BC
	cmp r0, #0
	beq _0221FA74
	add r5, #0xc0
	ldr r0, [r5]
	add r0, r0, r4
	add r0, #0xc4
	ldr r0, [r0]
	pop {r3, r4, r5, pc}
_0221FA74:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0221FA48

	thumb_func_start ov07_0221FA78
ov07_0221FA78: ; 0x0221FA78
	add r0, #0xc8
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221FA78

	thumb_func_start ov07_0221FA80
ov07_0221FA80: ; 0x0221FA80
	add r0, #0xc0
	ldr r2, [r0]
	lsl r0, r1, #2
	add r0, r2, r0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end ov07_0221FA80

	thumb_func_start ov07_0221FA90
ov07_0221FA90: ; 0x0221FA90
	add r0, #0xc0
	ldr r2, [r0]
	lsl r0, r1, #2
	add r0, r2, r0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end ov07_0221FA90

	thumb_func_start ov07_0221FAA0
ov07_0221FAA0: ; 0x0221FAA0
	add r0, #0xc0
	ldr r2, [r0]
	lsl r0, r1, #2
	add r0, r2, r0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end ov07_0221FAA0

	thumb_func_start ov07_0221FAB0
ov07_0221FAB0: ; 0x0221FAB0
	add r0, #0xc0
	ldr r0, [r0]
	add r0, #0xd4
	ldr r1, [r0]
	mov r0, #2
	tst r0, r1
	beq _0221FAC2
	mov r0, #1
	bx lr
_0221FAC2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221FAB0

	thumb_func_start ov07_0221FAC8
ov07_0221FAC8: ; 0x0221FAC8
	add r0, #0xc0
	ldr r2, [r0]
	lsl r0, r1, #2
	add r0, r2, r0
	add r0, #0xfc
	ldr r1, [r0]
	ldr r0, _0221FAE4 ; =0x200400C0
	tst r0, r1
	beq _0221FADE
	mov r0, #1
	bx lr
_0221FADE:
	mov r0, #0
	bx lr
	nop
_0221FAE4: .word 0x200400C0
	thumb_func_end ov07_0221FAC8

	thumb_func_start ov07_0221FAE8
ov07_0221FAE8: ; 0x0221FAE8
	mov r0, #1
	bx lr
	thumb_func_end ov07_0221FAE8

	thumb_func_start ov07_0221FAEC
ov07_0221FAEC: ; 0x0221FAEC
	ldr r0, _0221FAF4 ; =ov07_02234B8C
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_0221FAF4: .word ov07_02234B8C
	thumb_func_end ov07_0221FAEC

	thumb_func_start ov07_0221FAF8
ov07_0221FAF8: ; 0x0221FAF8
	ldr r0, _0221FB00 ; =_02234B80
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_0221FB00: .word _02234B80
	thumb_func_end ov07_0221FAF8

	thumb_func_start ov07_0221FB04
ov07_0221FB04: ; 0x0221FB04
	push {r3, lr}
	cmp r1, #3
	bhi _0221FB2E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0221FB16: ; jump table
	.short _0221FB1E - _0221FB16 - 2 ; case 0
	.short _0221FB22 - _0221FB16 - 2 ; case 1
	.short _0221FB26 - _0221FB16 - 2 ; case 2
	.short _0221FB2A - _0221FB16 - 2 ; case 3
_0221FB1E:
	mov r0, #0
	pop {r3, pc}
_0221FB22:
	mov r0, #1
	pop {r3, pc}
_0221FB26:
	mov r0, #3
	pop {r3, pc}
_0221FB2A:
	bl ov07_0221FAE8
_0221FB2E:
	pop {r3, pc}
	thumb_func_end ov07_0221FB04

	thumb_func_start ov07_0221FB30
ov07_0221FB30: ; 0x0221FB30
	push {r3, lr}
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, r2, #0
	add r2, #0xc0
	ldr r3, [r2]
	mov r2, #0x11
	add r0, #0xc4
	lsl r2, r2, #4
	lsl r1, r1, #0x18
	ldr r2, [r3, r2]
	mov r3, #1
	ldr r0, [r0]
	lsr r1, r1, #0x18
	lsl r3, r3, #0x10
	bl BG_LoadCharTilesData
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_0221FB30

	thumb_func_start ov07_0221FB58
ov07_0221FB58: ; 0x0221FB58
	push {r3, lr}
	mov r2, #2
	add r1, r0, #0
	lsl r2, r2, #8
	str r2, [sp]
	add r1, #0xc0
	add r0, #0xc8
	ldr r1, [r1]
	sub r2, #0xec
	ldr r1, [r1, r2]
	mov r2, #0
	ldr r0, [r0]
	add r3, r2, #0
	bl PaletteData_LoadPalette
	pop {r3, pc}
	thumb_func_end ov07_0221FB58

	thumb_func_start ov07_0221FB78
ov07_0221FB78: ; 0x0221FB78
	mov r0, #0
	bx lr
	thumb_func_end ov07_0221FB78

	thumb_func_start ov07_0221FB7C
ov07_0221FB7C: ; 0x0221FB7C
	mov r2, #0x14
	mul r2, r0
	ldr r0, _0221FB8C ; =ov07_02234F48
	lsl r1, r1, #2
	add r0, r0, r2
	ldr r0, [r1, r0]
	bx lr
	nop
_0221FB8C: .word ov07_02234F48
	thumb_func_end ov07_0221FB7C

	thumb_func_start ov07_0221FB90
ov07_0221FB90: ; 0x0221FB90
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x98
	ldr r3, _0221FDF0 ; =ov07_02234BD8
	add r5, r2, #0
	add r2, sp, #0x80
	add r7, r0, #0
	str r1, [sp, #0x18]
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [sp, #0x18]
	mov r1, #0x58
	bl AllocFromHeap
	add r4, r0, #0
	ldr r0, [sp, #0x18]
	str r0, [r4]
	str r5, [r4, #4]
	add r0, r7, #0
	bl ov12_0223A8E4
	str r0, [r4, #8]
	add r0, r7, #0
	bl ov12_0223A8EC
	str r0, [r4, #0xc]
	add r0, r7, #0
	bl ov12_0223A938
	str r0, [r4, #0x10]
	mov r6, #0
	add r5, r4, #0
_0221FBD6:
	mov r0, #0
	str r0, [r5, #0x24]
	add r0, r7, #0
	add r1, r6, #0
	bl ov12_0223BB88
	str r0, [r5, #0x34]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #4
	blt _0221FBD6
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0x44
	bl ov12_0223C1C4
	add r1, r4, #0
	add r0, r7, #0
	add r1, #0x48
	bl ov12_0223C1F4
	ldr r1, [sp, #0x18]
	mov r0, #8
	bl NARC_ctor
	add r6, r0, #0
	mov r7, #0
	str r4, [sp, #0x1c]
_0221FC0E:
	ldr r0, [r4, #4]
	cmp r7, r0
	beq _0221FC18
	cmp r0, #0xff
	bne _0221FC82
_0221FC18:
	ldr r1, [sp, #0x1c]
	ldr r1, [r1, #0x48]
	cmp r1, #0
	beq _0221FC82
	ldr r1, _0221FDF4 ; =0x0000D903
	mov r3, #0x4c
	add r2, r7, r1
	ldr r1, _0221FDF8 ; =0x00001388
	mul r1, r0
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	add r5, r2, r1
	str r0, [sp, #4]
	str r5, [sp, #8]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, r6, #0
	bl sub_0200D504
	str r6, [sp]
	mov r0, #0x4b
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r5, [sp, #0x14]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #8]
	ldr r3, [r4, #0xc]
	mov r1, #2
	bl sub_0200D68C
	mov r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, r6, #0
	mov r3, #0x4d
	bl sub_0200D6EC
	mov r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, r6, #0
	mov r3, #0x4e
	bl sub_0200D71C
_0221FC82:
	ldr r0, [sp, #0x1c]
	add r7, r7, #1
	add r0, r0, #4
	str r0, [sp, #0x1c]
	cmp r7, #4
	blt _0221FC0E
	add r0, r6, #0
	bl NARC_dtor
	mov r0, #0
	str r0, [sp, #0x2c]
	add r7, r4, #0
_0221FC9A:
	ldr r1, [r4, #4]
	ldr r0, [sp, #0x2c]
	cmp r0, r1
	beq _0221FCA8
	cmp r1, #0xff
	beq _0221FCA8
	b _0221FDDC
_0221FCA8:
	ldr r2, _0221FDF4 ; =0x0000D903
	ldr r0, [sp, #0x2c]
	add r3, r1, #0
	add r0, r0, r2
	ldr r2, _0221FDF8 ; =0x00001388
	mul r3, r2
	add r1, r0, r3
	str r1, [r7, #0x14]
	ldr r1, [r4, #4]
	add r3, r1, #0
	mul r3, r2
	add r1, r0, r3
	str r1, [sp, #0x68]
	ldr r1, [r4, #4]
	add r3, r1, #0
	mul r3, r2
	add r1, r0, r3
	str r1, [sp, #0x6c]
	ldr r1, [r4, #4]
	add r3, r1, #0
	mul r3, r2
	add r1, r0, r3
	str r1, [sp, #0x70]
	ldr r1, [r4, #4]
	mul r2, r1
	mov r1, #0
	add r0, r0, r2
	str r0, [sp, #0x74]
	str r1, [sp, #0x78]
	str r1, [sp, #0x7c]
	ldr r2, [r7, #0x34]
	ldr r5, [r7, #0x48]
	ldr r0, [r2, #4]
	cmp r5, #0
	str r0, [sp, #0x28]
	ldr r0, [r2, #8]
	str r0, [sp, #0x24]
	ldr r0, [r2]
	str r0, [sp, #0x20]
	beq _0221FDDC
	add r0, r5, #0
	bl sub_02008A78
	str r0, [sp, #0x30]
	add r0, r5, #0
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	add r0, r5, #0
	mov r1, #0x29
	bl sub_02008A78
	sub r2, r6, r0
	ldr r0, [sp, #0x30]
	add r1, sp, #0x34
	strh r0, [r1]
	strh r2, [r1, #2]
	mov r0, #0
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	ldr r1, [sp, #0x2c]
	add r3, sp, #0x34
	add r1, r4, r1
	add r1, #0x44
	ldrb r1, [r1]
	lsl r2, r1, #2
	add r1, sp, #0x80
	ldr r1, [r1, r2]
	str r0, [sp, #0x40]
	str r1, [sp, #0x3c]
	mov r1, #1
	str r1, [sp, #0x44]
	str r1, [sp, #0x60]
	str r0, [sp, #0x64]
	add r2, sp, #0x68
_0221FD42:
	ldr r1, [r2]
	add r0, r0, #1
	str r1, [r3, #0x14]
	add r2, r2, #4
	add r3, r3, #4
	cmp r0, #6
	blt _0221FD42
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, sp, #0x34
	bl sub_0200D734
	add r6, r0, #0
	bl sub_0200DC18
	str r6, [r7, #0x24]
	cmp r5, #0
	bne _0221FD70
	add r0, r6, #0
	mov r1, #0
	bl sub_0200DCE8
	b _0221FD98
_0221FD70:
	add r0, r5, #0
	bl sub_020094BC
	cmp r0, #0
	bne _0221FD84
	add r0, r6, #0
	mov r1, #0
	bl sub_0200DCE8
	b _0221FD98
_0221FD84:
	add r0, r5, #0
	mov r1, #6
	bl sub_02008A78
	cmp r0, #1
	bne _0221FD98
	add r0, r6, #0
	mov r1, #0
	bl sub_0200DCE8
_0221FD98:
	cmp r5, #0
	beq _0221FDB2
	ldr r0, [r6]
	bl sub_02024B1C
	add r1, r0, #0
	mov r3, #0x32
	ldr r1, [r1, #4]
	ldr r2, [sp, #0x20]
	mov r0, #0x13
	lsl r3, r3, #6
	bl GF_CreateNewVramTransferTask
_0221FDB2:
	cmp r5, #0
	beq _0221FDDC
	ldr r0, [r6]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	mov r1, #2
	str r1, [sp]
	mov r1, #0x20
	lsl r0, r0, #0x14
	str r1, [sp, #4]
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x24]
	ldr r3, [r4]
	bl PaletteData_LoadNarc
_0221FDDC:
	ldr r0, [sp, #0x2c]
	add r7, r7, #4
	add r0, r0, #1
	str r0, [sp, #0x2c]
	cmp r0, #4
	bge _0221FDEA
	b _0221FC9A
_0221FDEA:
	add r0, r4, #0
	add sp, #0x98
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0221FDF0: .word ov07_02234BD8
_0221FDF4: .word 0x0000D903
_0221FDF8: .word 0x00001388
	thumb_func_end ov07_0221FB90

	thumb_func_start ov07_0221FDFC
ov07_0221FDFC: ; 0x0221FDFC
	ldr r3, _0221FE04 ; =ov07_0221FB90
	mov r2, #0xff
	bx r3
	nop
_0221FE04: .word ov07_0221FB90
	thumb_func_end ov07_0221FDFC

	thumb_func_start ov07_0221FE08
ov07_0221FE08: ; 0x0221FE08
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r6, #0
	add r4, r5, #0
_0221FE10:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _0221FE2C
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x14]
	bl sub_0200D958
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x14]
	bl sub_0200D968
	ldr r0, [r4, #0x24]
	bl sub_0200D9DC
_0221FE2C:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _0221FE10
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221FE08

	thumb_func_start ov07_0221FE3C
ov07_0221FE3C: ; 0x0221FE3C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r6, #0
	add r4, r5, #0
_0221FE44:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _0221FE60
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x14]
	bl sub_0200D958
	ldr r0, [r5, #0xc]
	ldr r1, [r4, #0x14]
	bl sub_0200D968
	ldr r0, [r4, #0x24]
	bl sub_0200D9DC
_0221FE60:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _0221FE44
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0221FE3C

	thumb_func_start ov07_0221FE70
ov07_0221FE70: ; 0x0221FE70
	push {r4, lr}
	add r4, r0, #0
	bne _0221FE7A
	bl GF_AssertFail
_0221FE7A:
	ldr r0, [r4, #4]
	add r0, r4, r0
	add r0, #0x44
	ldrb r0, [r0]
	pop {r4, pc}
	thumb_func_end ov07_0221FE70

	thumb_func_start ov07_0221FE84
ov07_0221FE84: ; 0x0221FE84
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221FE84

	thumb_func_start ov07_0221FE88
ov07_0221FE88: ; 0x0221FE88
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl ov06_0221BA40
	add r4, r0, #0
	mov r0, #0x1d
	add r1, r6, #0
	add r2, r5, #0
	bl sub_02015264
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0xa
	add r3, r7, #0
	bl sub_0201526C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221FE88

	thumb_func_start ov07_0221FEB0
ov07_0221FEB0: ; 0x0221FEB0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	bl ov06_0221BA40
	add r4, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	add r2, r5, #0
	bl sub_02015264
	add r1, r0, #0
	ldr r3, [sp]
	add r0, r4, #0
	mov r2, #0xa
	bl sub_0201526C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0221FEB0

	thumb_func_start ov07_0221FEDC
ov07_0221FEDC: ; 0x0221FEDC
	ldr r3, _0221FEE0 ; =NARC_AllocAndReadWholeMember
	bx r3
	.balign 4, 0
_0221FEE0: .word NARC_AllocAndReadWholeMember
	thumb_func_end ov07_0221FEDC

	thumb_func_start ov07_0221FEE4
ov07_0221FEE4: ; 0x0221FEE4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r7, r2, #0
	str r3, [sp]
	bl ov06_0221BA88
	add r4, r0, #0
	bne _0221FEFC
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0221FEFC:
	add r0, r6, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov07_0221FEDC
	add r1, r0, #0
	ldr r3, [sp]
	add r0, r4, #0
	mov r2, #0xa
	bl sub_0201526C
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0221FEE4

	thumb_func_start ov07_0221FF18
ov07_0221FF18: ; 0x0221FF18
	push {r4, lr}
	lsl r4, r2, #2
	ldr r2, _0221FF28 ; =ov07_022353E4
	ldr r2, [r2, r4]
	bl sub_02015494
	pop {r4, pc}
	nop
_0221FF28: .word ov07_022353E4
	thumb_func_end ov07_0221FF18

	thumb_func_start ov07_0221FF2C
ov07_0221FF2C: ; 0x0221FF2C
	ldr r3, _0221FF30 ; =ov06_0221BAD8
	bx r3
	.balign 4, 0
_0221FF30: .word ov06_0221BAD8
	thumb_func_end ov07_0221FF2C

	thumb_func_start ov07_0221FF34
ov07_0221FF34: ; 0x0221FF34
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r7, r2, #0
	mov r4, #1
	bl ov07_02231924
	add r5, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl ov07_02231924
	cmp r5, #5
	bhi _0221FF70
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0221FF5A: ; jump table
	.short _0221FF70 - _0221FF5A - 2 ; case 0
	.short _0221FF66 - _0221FF5A - 2 ; case 1
	.short _0221FF70 - _0221FF5A - 2 ; case 2
	.short _0221FF6A - _0221FF5A - 2 ; case 3
	.short _0221FF70 - _0221FF5A - 2 ; case 4
	.short _0221FF6E - _0221FF5A - 2 ; case 5
_0221FF66:
	sub r4, r4, #2
	b _0221FF70
_0221FF6A:
	sub r4, r4, #2
	b _0221FF70
_0221FF6E:
	sub r4, r4, #2
_0221FF70:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0221FF34

	thumb_func_start ov07_0221FF74
ov07_0221FF74: ; 0x0221FF74
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0221FF74

	thumb_func_start ov07_0221FF78
ov07_0221FF78: ; 0x0221FF78
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	add r5, r0, #0
	bl sub_02015504
	add r4, r0, #0
	bl ov07_0221C468
	add r0, r4, #0
	bl ov07_0221C470
	add r0, r4, #0
	bl ov07_0221C478
	add r6, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl ov07_0223192C
	cmp r0, #3
	bne _0221FFAE
	add r0, r4, #0
	mov r1, #1
	add r2, sp, #0x28
	bl ov07_02231B90
	b _0221FFE6
_0221FFAE:
	add r0, r4, #0
	mov r1, #1
	bl ov07_02231924
	str r0, [sp]
	bl ov07_022319E0
	str r0, [sp, #4]
	add r0, r6, #0
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r4, r0, #0
	ldr r0, [sp, #4]
	add r1, sp, #0x28
	add r2, r4, #0
	add r3, r7, #0
	bl ov07_02231AD0
	ldr r0, [sp]
	add r1, sp, #0x1c
	add r2, r4, #0
	add r3, r7, #0
	bl ov07_02231AD0
_0221FFE6:
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x28]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x2c]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x30]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r5, #0x30]
	mov r0, #1
	add r1, sp, #0x10
	bl ov07_02231DE8
	add r0, r6, #0
	bl sub_02015524
	add r4, r0, #0
	add r0, sp, #8
	add r1, r4, #0
	bl GF_Camera_GetAngle
	add r0, sp, #8
	add r1, r4, #0
	bl GF_Camera_SetAngle
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0221FF78

	thumb_func_start ov07_02220030
ov07_02220030: ; 0x02220030
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	bl sub_02015504
	add r4, r0, #0
	bl ov07_0221C470
	add r6, r0, #0
	add r0, r4, #0
	bl ov07_0221C478
	add r7, r0, #0
	add r0, r4, #0
	mov r1, #0
	add r2, sp, #0xc
	bl ov07_02231B90
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0xc]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x10]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0x14]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r5, #0x30]
	add r0, r6, #0
	add r1, sp, #0
	bl ov07_02231DE8
	add r0, r7, #0
	add r1, sp, #0
	bl sub_020154E4
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02220030

	thumb_func_start ov07_0222008C
ov07_0222008C: ; 0x0222008C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_02015504
	add r5, r0, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r5, #0
	add r2, sp, #0
	bl ov07_02231B90
	ldr r0, [r4, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r1, r0
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r4, #0x30]
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0222008C

	thumb_func_start ov07_022200D0
ov07_022200D0: ; 0x022200D0
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_02015504
	add r5, r0, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	add r2, sp, #0
	bl ov07_02231B90
	ldr r0, [r4, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r1, r0
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r4, #0x30]
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_022200D0

	thumb_func_start ov07_02220114
ov07_02220114: ; 0x02220114
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_02015504
	add r4, r0, #0
	bl ov07_0221C468
	add r6, r0, #0
	add r0, r4, #0
	bl ov07_0221C470
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #0
	bl ov07_02231B90
	ldr r0, [r5, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r5, #0x30]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02220114

	thumb_func_start ov07_02220160
ov07_02220160: ; 0x02220160
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_02015504
	add r6, r0, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r6, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	beq _0222018C
	mov r4, #1
	b _0222018E
_0222018C:
	mov r4, #0
_0222018E:
	add r0, r6, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r4, #0
	add r1, sp, #0
	add r3, r7, #0
	bl ov07_02231AD0
	ldr r0, [r5, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r5, #0x30]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_02220160

	thumb_func_start ov07_022201C8
ov07_022201C8: ; 0x022201C8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_02015504
	add r6, r0, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r6, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	beq _022201F4
	mov r4, #1
	b _022201F6
_022201F4:
	mov r4, #0
_022201F6:
	add r0, r6, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r4, #0
	add r1, sp, #0
	add r3, r7, #0
	bl ov07_02231AD0
	ldr r0, [r5, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r5, #0x30]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_022201C8

	thumb_func_start ov07_02220230
ov07_02220230: ; 0x02220230
	push {r4, r5, r6, r7, lr}
	sub sp, #0x9c
	add r5, r0, #0
	add r1, sp, #0
	mov r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	strh r0, [r1, #8]
	strh r0, [r1, #0xa]
	ldr r3, _022202D0 ; =ov07_02235440
	add r2, sp, #0x54
	mov r1, #0x24
_0222024C:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _0222024C
	ldr r3, _022202D4 ; =ov07_02235488
	add r2, sp, #0xc
	mov r1, #0x24
_0222025E:
	ldrh r0, [r3]
	add r3, r3, #2
	strh r0, [r2]
	add r2, r2, #2
	sub r1, r1, #1
	bne _0222025E
	bl sub_02015504
	add r4, r0, #0
	bl ov07_0221C468
	add r6, r0, #0
	add r0, r4, #0
	bl ov07_0221C470
	add r7, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov07_02231924
	add r6, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl ov07_02231924
	lsl r2, r0, #1
	mov r0, #0xc
	add r1, r6, #0
	mul r1, r0
	add r0, sp, #0x54
	add r0, r0, r1
	ldrsh r4, [r2, r0]
	mov r3, #0xac
	add r0, r4, #0
	ldr r4, [r5, #0x20]
	mul r0, r3
	ldr r4, [r4]
	ldr r4, [r4, #4]
	add r0, r0, r4
	str r0, [r5, #0x28]
	add r0, sp, #0xc
	add r0, r0, r1
	ldrsh r0, [r2, r0]
	add r1, r0, #0
	ldr r0, [r5, #0x20]
	mul r1, r3
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	str r0, [r5, #0x30]
	add sp, #0x9c
	pop {r4, r5, r6, r7, pc}
	nop
_022202D0: .word ov07_02235440
_022202D4: .word ov07_02235488
	thumb_func_end ov07_02220230

	thumb_func_start ov07_022202D8
ov07_022202D8: ; 0x022202D8
	push {r3, r4}
	add r3, r2, #0
	add r3, #8
	cmp r0, #7
	bhi _02220368
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022202EE: ; jump table
	.short _02220368 - _022202EE - 2 ; case 0
	.short _022202FE - _022202EE - 2 ; case 1
	.short _02220308 - _022202EE - 2 ; case 2
	.short _02220312 - _022202EE - 2 ; case 3
	.short _0222031C - _022202EE - 2 ; case 4
	.short _0222032E - _022202EE - 2 ; case 5
	.short _02220340 - _022202EE - 2 ; case 6
	.short _02220352 - _022202EE - 2 ; case 7
_022202FE:
	ldr r0, [r2]
	mul r1, r0
	str r1, [r2]
	pop {r3, r4}
	bx lr
_02220308:
	ldr r0, [r2, #4]
	mul r1, r0
	str r1, [r2, #4]
	pop {r3, r4}
	bx lr
_02220312:
	ldr r0, [r3]
	mul r1, r0
	str r1, [r3]
	pop {r3, r4}
	bx lr
_0222031C:
	ldr r0, [r2]
	add r3, r0, #0
	mul r3, r1
	str r3, [r2]
	ldr r0, [r2, #4]
	mul r1, r0
	str r1, [r2, #4]
	pop {r3, r4}
	bx lr
_0222032E:
	ldr r0, [r2]
	add r4, r0, #0
	mul r4, r1
	str r4, [r2]
	ldr r0, [r3]
	mul r1, r0
	str r1, [r3]
	pop {r3, r4}
	bx lr
_02220340:
	ldr r0, [r2, #4]
	add r4, r0, #0
	mul r4, r1
	str r4, [r2, #4]
	ldr r0, [r3]
	mul r1, r0
	str r1, [r3]
	pop {r3, r4}
	bx lr
_02220352:
	ldr r0, [r2]
	add r4, r0, #0
	mul r4, r1
	str r4, [r2]
	ldr r0, [r2, #4]
	add r4, r0, #0
	mul r4, r1
	str r4, [r2, #4]
	ldr r0, [r3]
	mul r1, r0
	str r1, [r3]
_02220368:
	pop {r3, r4}
	bx lr
	thumb_func_end ov07_022202D8

	thumb_func_start ov07_0222036C
ov07_0222036C: ; 0x0222036C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r2, #0
	add r5, r1, #0
	add r1, r3, #0
	add r7, sp, #0x10
	mov r2, #0
	str r2, [r7]
	ldr r3, [sp, #0x30]
	str r2, [r7, #4]
	ldr r4, [sp, #0x38]
	str r2, [r7, #8]
	cmp r3, #5
	bhi _02220416
	add r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_02220394: ; jump table
	.short _02220416 - _02220394 - 2 ; case 0
	.short _022203A0 - _02220394 - 2 ; case 1
	.short _022203C6 - _02220394 - 2 ; case 2
	.short _022203DA - _02220394 - 2 ; case 3
	.short _022203E2 - _02220394 - 2 ; case 4
	.short _022203EC - _02220394 - 2 ; case 5
_022203A0:
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02015720
	add r1, sp, #0x20
	mov r0, #0x14
	ldrsb r0, [r1, r0]
	ldr r1, [sp, #0x10]
	add r2, r1, #0
	mul r2, r0
	ldr r1, [sp, #0x14]
	str r2, [sp, #0x10]
	add r2, r1, #0
	mul r2, r0
	ldr r1, [sp, #0x18]
	str r2, [sp, #0x14]
	mul r0, r1
	str r0, [sp, #0x18]
	b _02220416
_022203C6:
	str r2, [sp, #0x10]
	add r1, sp, #0x20
	mov r0, #0x14
	ldrsb r1, [r1, r0]
	mov r0, #0x32
	lsl r0, r0, #6
	mul r0, r1
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	b _02220416
_022203DA:
	add r2, r7, #0
	bl ov07_02231B90
	b _02220416
_022203E2:
	add r1, r6, #0
	add r2, r7, #0
	bl ov07_02231B90
	b _02220416
_022203EC:
	add r1, sp, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	mov r2, #4
	bl ov07_0221F9A8
	ldr r0, [sp]
	add r2, sp, #0x20
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	mov r1, #0x14
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r0, [sp, #0x18]
	ldrsb r1, [r2, r1]
	ldr r0, [sp, #0xc]
	add r2, r7, #0
	bl ov07_022202D8
_02220416:
	ldr r1, [sp, #0x10]
	ldr r0, [r4]
	sub r0, r1, r0
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	ldr r0, [r4, #4]
	sub r0, r1, r0
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, [r4, #8]
	sub r0, r1, r0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, sp, #0x10
	bl sub_02015708
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0222036C

	thumb_func_start ov07_0222043C
ov07_0222043C: ; 0x0222043C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r6, r2, #0
	add r5, r1, #0
	add r1, r3, #0
	add r7, sp, #0x10
	mov r2, #0
	str r2, [r7]
	ldr r3, [sp, #0x30]
	str r2, [r7, #4]
	ldr r4, [sp, #0x38]
	str r2, [r7, #8]
	cmp r3, #5
	bhi _022204E6
	add r3, r3, r3
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_02220464: ; jump table
	.short _022204E6 - _02220464 - 2 ; case 0
	.short _02220470 - _02220464 - 2 ; case 1
	.short _02220496 - _02220464 - 2 ; case 2
	.short _022204AA - _02220464 - 2 ; case 3
	.short _022204B2 - _02220464 - 2 ; case 4
	.short _022204BC - _02220464 - 2 ; case 5
_02220470:
	add r0, r5, #0
	add r1, r7, #0
	bl sub_02015640
	add r1, sp, #0x20
	mov r0, #0x14
	ldrsb r0, [r1, r0]
	ldr r1, [sp, #0x10]
	add r2, r1, #0
	mul r2, r0
	ldr r1, [sp, #0x14]
	str r2, [sp, #0x10]
	add r2, r1, #0
	mul r2, r0
	ldr r1, [sp, #0x18]
	str r2, [sp, #0x14]
	mul r0, r1
	str r0, [sp, #0x18]
	b _022204E6
_02220496:
	str r2, [sp, #0x10]
	add r1, sp, #0x20
	mov r0, #0x14
	ldrsb r1, [r1, r0]
	mov r0, #0x32
	lsl r0, r0, #6
	mul r0, r1
	str r0, [sp, #0x14]
	str r2, [sp, #0x18]
	b _022204E6
_022204AA:
	add r2, r7, #0
	bl ov07_02231B90
	b _022204E6
_022204B2:
	add r1, r6, #0
	add r2, r7, #0
	bl ov07_02231B90
	b _022204E6
_022204BC:
	add r1, sp, #0
	str r2, [r1]
	str r2, [r1, #4]
	str r2, [r1, #8]
	str r2, [r1, #0xc]
	mov r2, #4
	bl ov07_0221F9A8
	ldr r0, [sp]
	add r2, sp, #0x20
	str r0, [sp, #0x10]
	ldr r0, [sp, #4]
	mov r1, #0x14
	str r0, [sp, #0x14]
	ldr r0, [sp, #8]
	str r0, [sp, #0x18]
	ldrsb r1, [r2, r1]
	ldr r0, [sp, #0xc]
	add r2, r7, #0
	bl ov07_022202D8
_022204E6:
	ldr r1, [sp, #0x10]
	ldr r0, [r4]
	sub r0, r1, r0
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	ldr r0, [r4, #4]
	sub r0, r1, r0
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, [r4, #8]
	sub r0, r1, r0
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r1, sp, #0x10
	bl sub_02015628
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0222043C

	thumb_func_start ov07_0222050C
ov07_0222050C: ; 0x0222050C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x94
	add r6, r0, #0
	add r7, r2, #0
	add r4, r1, #0
	str r3, [sp, #0xc]
	bl ov07_0221C478
	add r0, r6, #0
	add r1, r7, #0
	bl ov07_02231924
	str r0, [sp, #0x10]
	ldr r1, [sp, #0xc]
	add r0, r6, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r6, #0
	add r1, sp, #0x7c
	mov r2, #3
	bl ov07_0221F9A8
	add r0, r6, #0
	add r1, sp, #0x70
	mov r2, #3
	bl ov07_0221F9A8
	add r0, r6, #0
	add r1, sp, #0x58
	mov r2, #3
	bl ov07_0221F9A8
	add r0, r6, #0
	add r1, sp, #0x64
	mov r2, #3
	bl ov07_0221F9A8
	add r0, r6, #0
	add r1, sp, #0x40
	mov r2, #3
	bl ov07_0221F9A8
	add r0, r6, #0
	add r1, sp, #0x34
	mov r2, #3
	bl ov07_0221F9A8
	add r0, r6, #0
	add r1, sp, #0x4c
	mov r2, #3
	bl ov07_0221F9A8
	ldr r0, [sp, #0x10]
	cmp r0, #5
	bhi _02220594
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02220588: ; jump table
	.short _02220594 - _02220588 - 2 ; case 0
	.short _022205A4 - _02220588 - 2 ; case 1
	.short _022205BA - _02220588 - 2 ; case 2
	.short _022205EE - _02220588 - 2 ; case 3
	.short _02220638 - _02220588 - 2 ; case 4
	.short _0222066C - _02220588 - 2 ; case 5
_02220594:
	ldr r1, [sp, #0x7c]
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x80]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x84]
	strh r1, [r0, #4]
	b _022206B4
_022205A4:
	ldr r0, [sp, #0x7c]
	neg r1, r0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x80]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0x84]
	neg r1, r1
	strh r1, [r0, #4]
	b _022206B4
_022205BA:
	cmp r5, #3
	add r0, sp, #0x14
	bne _022205CE
	ldr r1, [sp, #0x70]
	strh r1, [r0]
	ldr r1, [sp, #0x74]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x78]
	strh r1, [r0, #4]
	b _022206B4
_022205CE:
	cmp r5, #5
	bne _022205E0
	ldr r1, [sp, #0x58]
	strh r1, [r0]
	ldr r1, [sp, #0x5c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x60]
	strh r1, [r0, #4]
	b _022206B4
_022205E0:
	ldr r1, [sp, #0x64]
	strh r1, [r0]
	ldr r1, [sp, #0x68]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x6c]
	strh r1, [r0, #4]
	b _022206B4
_022205EE:
	cmp r5, #2
	bne _02220608
	ldr r0, [sp, #0x70]
	neg r1, r0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x74]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0x78]
	neg r1, r1
	strh r1, [r0, #4]
	b _022206B4
_02220608:
	cmp r5, #5
	bne _02220622
	ldr r0, [sp, #0x64]
	neg r1, r0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x68]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0x6c]
	neg r1, r1
	strh r1, [r0, #4]
	b _022206B4
_02220622:
	ldr r0, [sp, #0x40]
	neg r1, r0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x44]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0x48]
	neg r1, r1
	strh r1, [r0, #4]
	b _022206B4
_02220638:
	cmp r5, #3
	add r0, sp, #0x14
	bne _0222064C
	ldr r1, [sp, #0x40]
	strh r1, [r0]
	ldr r1, [sp, #0x44]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x48]
	strh r1, [r0, #4]
	b _022206B4
_0222064C:
	cmp r5, #5
	bne _0222065E
	ldr r1, [sp, #0x34]
	strh r1, [r0]
	ldr r1, [sp, #0x38]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x3c]
	strh r1, [r0, #4]
	b _022206B4
_0222065E:
	ldr r1, [sp, #0x4c]
	strh r1, [r0]
	ldr r1, [sp, #0x50]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x54]
	strh r1, [r0, #4]
	b _022206B4
_0222066C:
	cmp r5, #3
	bne _02220686
	ldr r0, [sp, #0x4c]
	neg r1, r0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x50]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0x54]
	neg r1, r1
	strh r1, [r0, #4]
	b _022206B4
_02220686:
	cmp r5, #2
	bne _022206A0
	ldr r0, [sp, #0x58]
	neg r1, r0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x5c]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0x60]
	neg r1, r1
	strh r1, [r0, #4]
	b _022206B4
_022206A0:
	ldr r0, [sp, #0x34]
	neg r1, r0
	add r0, sp, #0x14
	strh r1, [r0]
	ldr r1, [sp, #0x38]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0x3c]
	neg r1, r1
	strh r1, [r0, #4]
_022206B4:
	ldr r2, [sp, #0xc]
	add r0, r6, #0
	add r1, r7, #0
	bl ov07_0221FF34
	add r5, r0, #0
	add r1, sp, #0x28
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r6, #0
	mov r2, #3
	bl ov07_0221F9A8
	add r0, r6, #0
	add r1, r7, #0
	add r2, sp, #0x1c
	bl ov07_02231B90
	ldr r0, [sp, #0x28]
	cmp r0, #0
	bne _02220720
	ldr r0, [sp, #0x2c]
	cmp r0, #0
	bne _02220720
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _02220720
	add r3, sp, #0x1c
	ldmia r3!, {r0, r1}
	add r2, sp, #0x88
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	ldr r1, [r4, #0x20]
	ldr r0, [sp, #0x1c]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	add r0, r0, r1
	str r0, [r4, #0x28]
	ldr r1, [r4, #0x20]
	ldr r0, [sp, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r0, r0, r1
	str r0, [r4, #0x2c]
	ldr r1, [r4, #0x20]
	ldr r0, [sp, #0x24]
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	add r0, r0, r1
	str r0, [r4, #0x30]
	b _02220774
_02220720:
	ldr r2, [sp, #0x28]
	ldr r1, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	str r2, [sp, #0x88]
	str r1, [sp, #0x8c]
	str r0, [sp, #0x90]
	cmp r2, #0
	bne _0222073A
	mov r0, #0x32
	lsl r0, r0, #6
	cmp r1, r0
	bne _0222073A
	mov r5, #1
_0222073A:
	ldr r1, [sp, #0x88]
	add r0, r1, #0
	ldr r1, [sp, #0x8c]
	mul r0, r5
	add r2, r1, #0
	mul r2, r5
	ldr r1, [sp, #0x24]
	str r2, [sp, #0x8c]
	add r2, r1, #0
	mul r2, r5
	str r0, [sp, #0x88]
	str r2, [sp, #0x90]
	ldr r1, [r4, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #4]
	add r0, r0, r1
	str r0, [r4, #0x28]
	ldr r1, [r4, #0x20]
	ldr r0, [sp, #0x8c]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r0, r0, r1
	str r0, [r4, #0x2c]
	ldr r1, [r4, #0x20]
	ldr r0, [sp, #0x90]
	ldr r1, [r1]
	ldr r1, [r1, #0xc]
	add r0, r0, r1
	str r0, [r4, #0x30]
_02220774:
	ldr r0, [sp, #0xa8]
	cmp r0, #0
	beq _022207B2
	cmp r0, #1
	beq _02220784
	cmp r0, #2
	beq _0222079C
	b _022207B2
_02220784:
	ldr r0, [sp, #0xac]
	ldr r3, [sp, #0xc]
	str r0, [sp]
	str r5, [sp, #4]
	add r0, sp, #0x88
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov07_0222036C
	b _022207B2
_0222079C:
	ldr r0, [sp, #0xac]
	ldr r3, [sp, #0xc]
	str r0, [sp]
	str r5, [sp, #4]
	add r0, sp, #0x88
	str r0, [sp, #8]
	add r0, r6, #0
	add r1, r4, #0
	add r2, r7, #0
	bl ov07_0222043C
_022207B2:
	add r1, sp, #0x14
	ldrh r2, [r1]
	add r0, r4, #0
	add r0, #0x50
	strh r2, [r0]
	add r0, r4, #0
	ldrh r2, [r1, #2]
	add r0, #0x52
	add r4, #0x54
	strh r2, [r0]
	ldrh r0, [r1, #4]
	strh r0, [r4]
	add sp, #0x94
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0222050C

	thumb_func_start ov07_022207D0
ov07_022207D0: ; 0x022207D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	bl sub_02015504
	add r6, r0, #0
	bl ov07_0221C468
	str r0, [sp, #8]
	add r0, r6, #0
	bl ov07_0221C470
	add r3, r0, #0
	str r5, [sp]
	ldr r2, [sp, #8]
	add r0, r6, #0
	add r1, r7, #0
	str r4, [sp, #4]
	bl ov07_0222050C
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_022207D0

	thumb_func_start ov07_02220800
ov07_02220800: ; 0x02220800
	ldr r3, _02220808 ; =ov07_022207D0
	mov r1, #0
	add r2, r1, #0
	bx r3
	.balign 4, 0
_02220808: .word ov07_022207D0
	thumb_func_end ov07_02220800

	thumb_func_start ov07_0222080C
ov07_0222080C: ; 0x0222080C
	ldr r3, _02220814 ; =ov07_022207D0
	mov r1, #1
	add r2, r1, #0
	bx r3
	.balign 4, 0
_02220814: .word ov07_022207D0
	thumb_func_end ov07_0222080C

	thumb_func_start ov07_02220818
ov07_02220818: ; 0x02220818
	ldr r3, _02220820 ; =ov07_022207D0
	mov r1, #1
	mov r2, #2
	bx r3
	.balign 4, 0
_02220820: .word ov07_022207D0
	thumb_func_end ov07_02220818

	thumb_func_start ov07_02220824
ov07_02220824: ; 0x02220824
	ldr r3, _0222082C ; =ov07_022207D0
	mov r1, #1
	mov r2, #3
	bx r3
	.balign 4, 0
_0222082C: .word ov07_022207D0
	thumb_func_end ov07_02220824

	thumb_func_start ov07_02220830
ov07_02220830: ; 0x02220830
	ldr r3, _02220838 ; =ov07_022207D0
	mov r1, #1
	mov r2, #4
	bx r3
	.balign 4, 0
_02220838: .word ov07_022207D0
	thumb_func_end ov07_02220830

	thumb_func_start ov07_0222083C
ov07_0222083C: ; 0x0222083C
	ldr r3, _02220844 ; =ov07_022207D0
	mov r1, #1
	mov r2, #5
	bx r3
	.balign 4, 0
_02220844: .word ov07_022207D0
	thumb_func_end ov07_0222083C

	thumb_func_start ov07_02220848
ov07_02220848: ; 0x02220848
	ldr r3, _02220850 ; =ov07_022207D0
	mov r1, #2
	mov r2, #1
	bx r3
	.balign 4, 0
_02220850: .word ov07_022207D0
	thumb_func_end ov07_02220848

	thumb_func_start ov07_02220854
ov07_02220854: ; 0x02220854
	ldr r3, _0222085C ; =ov07_022207D0
	mov r1, #2
	add r2, r1, #0
	bx r3
	.balign 4, 0
_0222085C: .word ov07_022207D0
	thumb_func_end ov07_02220854

	thumb_func_start ov07_02220860
ov07_02220860: ; 0x02220860
	ldr r3, _02220868 ; =ov07_022207D0
	mov r1, #2
	mov r2, #3
	bx r3
	.balign 4, 0
_02220868: .word ov07_022207D0
	thumb_func_end ov07_02220860

	thumb_func_start ov07_0222086C
ov07_0222086C: ; 0x0222086C
	ldr r3, _02220874 ; =ov07_022207D0
	mov r1, #2
	mov r2, #4
	bx r3
	.balign 4, 0
_02220874: .word ov07_022207D0
	thumb_func_end ov07_0222086C

	thumb_func_start ov07_02220878
ov07_02220878: ; 0x02220878
	ldr r3, _02220880 ; =ov07_022207D0
	mov r1, #2
	mov r2, #5
	bx r3
	.balign 4, 0
_02220880: .word ov07_022207D0
	thumb_func_end ov07_02220878

	thumb_func_start ov07_02220884
ov07_02220884: ; 0x02220884
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	bl sub_02015504
	add r4, r0, #0
	bl ov07_0221C468
	add r6, r0, #0
	add r0, r4, #0
	bl ov07_0221C470
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r4, #0
	add r1, r5, #0
	add r3, r6, #0
	bl ov07_0222050C
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02220884

	thumb_func_start ov07_022208B4
ov07_022208B4: ; 0x022208B4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldr r2, [r4, #0x14]
	add r5, r0, #0
	cmp r2, #0
	beq _022208C4
	bl ov07_02220978
_022208C4:
	ldr r0, [r4, #0x18]
	cmp r0, #0
	beq _022208D2
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02220CAC
_022208D2:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _022208E0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_0222150C
_022208E0:
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02221540
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _022208F6
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02221550
_022208F6:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022208B4

	thumb_func_start ov07_022208F8
ov07_022208F8: ; 0x022208F8
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [r1]
	add r6, r2, #0
	add r0, r4, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r4, #0
	bl ov07_0223192C
	cmp r0, #3
	beq _02220920
	mov r5, #1
	b _02220922
_02220920:
	mov r5, #0
_02220922:
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231AD0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_022208F8

	thumb_func_start ov07_02220938
ov07_02220938: ; 0x02220938
	push {r3, r4, r5, r6, r7, lr}
	ldr r4, [r1]
	add r6, r2, #0
	add r0, r4, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r4, #0
	bl ov07_0223192C
	cmp r0, #3
	beq _02220960
	mov r5, #1
	b _02220962
_02220960:
	mov r5, #0
_02220962:
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231AD0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_02220938

	thumb_func_start ov07_02220978
ov07_02220978: ; 0x02220978
	push {r3, r4, r5, r6, lr}
	sub sp, #0xbc
	add r4, r1, #0
	ldr r2, [r4, #0x14]
	add r5, r0, #0
	cmp r2, #0x64
	bgt _022209E0
	blt _0222098A
	b _02220B54
_0222098A:
	cmp r2, #0x22
	bhi _022209E6
	add r3, r2, r2
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_0222099A: ; jump table
	.short _02220C5E - _0222099A - 2 ; case 0
	.short _022209E8 - _0222099A - 2 ; case 1
	.short _022209F4 - _0222099A - 2 ; case 2
	.short _02220AF0 - _0222099A - 2 ; case 3
	.short _02220B2C - _0222099A - 2 ; case 4
	.short _02220B40 - _0222099A - 2 ; case 5
	.short _02220A00 - _0222099A - 2 ; case 6
	.short _02220A0C - _0222099A - 2 ; case 7
	.short _02220AD8 - _0222099A - 2 ; case 8
	.short _02220AE4 - _0222099A - 2 ; case 9
	.short _02220A18 - _0222099A - 2 ; case 10
	.short _02220A24 - _0222099A - 2 ; case 11
	.short _02220B80 - _0222099A - 2 ; case 12
	.short _02220B90 - _0222099A - 2 ; case 13
	.short _02220A30 - _0222099A - 2 ; case 14
	.short _02220A3C - _0222099A - 2 ; case 15
	.short _02220A48 - _0222099A - 2 ; case 16
	.short _02220A54 - _0222099A - 2 ; case 17
	.short _02220A60 - _0222099A - 2 ; case 18
	.short _02220A6C - _0222099A - 2 ; case 19
	.short _02220A78 - _0222099A - 2 ; case 20
	.short _02220A84 - _0222099A - 2 ; case 21
	.short _02220A90 - _0222099A - 2 ; case 22
	.short _02220A9C - _0222099A - 2 ; case 23
	.short _02220AA8 - _0222099A - 2 ; case 24
	.short _02220AB4 - _0222099A - 2 ; case 25
	.short _02220AC0 - _0222099A - 2 ; case 26
	.short _02220ACC - _0222099A - 2 ; case 27
	.short _02220BA0 - _0222099A - 2 ; case 28
	.short _02220C5E - _0222099A - 2 ; case 29
	.short _02220BF0 - _0222099A - 2 ; case 30
	.short _02220BC6 - _0222099A - 2 ; case 31
	.short _02220C28 - _0222099A - 2 ; case 32
	.short _02220BAC - _0222099A - 2 ; case 33
	.short _02220BBA - _0222099A - 2 ; case 34
_022209E0:
	cmp r2, #0x65
	bne _022209E6
	b _02220B6A
_022209E6:
	b _02220C5E
_022209E8:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231B90
	b _02220C5E
_022209F4:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231B90
	b _02220C5E
_02220A00:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231BC0
	b _02220C5E
_02220A0C:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231BC0
	b _02220C5E
_02220A18:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231BF0
	b _02220C5E
_02220A24:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231BF0
	b _02220C5E
_02220A30:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231C20
	b _02220C5E
_02220A3C:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231C20
	b _02220C5E
_02220A48:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231C50
	b _02220C5E
_02220A54:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231C50
	b _02220C5E
_02220A60:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231C80
	b _02220C5E
_02220A6C:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231C80
	b _02220C5E
_02220A78:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231CB0
	b _02220C5E
_02220A84:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231CB0
	b _02220C5E
_02220A90:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231CE0
	b _02220C5E
_02220A9C:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231CE0
	b _02220C5E
_02220AA8:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231D10
	b _02220C5E
_02220AB4:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231D10
	b _02220C5E
_02220AC0:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231D40
	b _02220C5E
_02220ACC:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231D40
	b _02220C5E
_02220AD8:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231DA0
	b _02220C5E
_02220AE4:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231DA0
	b _02220C5E
_02220AF0:
	ldr r0, [r4]
	add r1, sp, #0xa0
	mov r2, #4
	bl ov07_0221F9A8
	add r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #0xa4]
	str r0, [sp, #0xb0]
	ldr r0, [sp, #0xa8]
	str r0, [sp, #0xb4]
	ldr r0, [sp, #0xac]
	str r0, [sp, #0xb8]
	ldr r0, [sp, #0xa0]
	cmp r0, #1
	bne _02220B18
	mov r0, #1
	strb r0, [r4, #8]
_02220B18:
	mov r0, #8
	ldrsb r1, [r4, r0]
	ldr r2, [sp, #0xb0]
	mul r1, r2
	str r1, [sp, #0xb0]
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #0xb4]
	mul r0, r1
	str r0, [sp, #0xb4]
	b _02220C5E
_02220B2C:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231B90
	add r0, r4, #0
	add r1, sp, #0xb0
	bl ov07_02221734
	b _02220C5E
_02220B40:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231B90
	add r0, r4, #0
	add r1, sp, #0xb0
	bl ov07_02221734
	b _02220C5E
_02220B54:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231B90
	ldr r1, [r4, #0x24]
	add r0, r4, #0
	add r2, sp, #0xb0
	bl ov07_022216A8
	b _02220C5E
_02220B6A:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0xb0
	bl ov07_02231B90
	ldr r1, [r4, #0x28]
	add r0, r4, #0
	add r2, sp, #0xb0
	bl ov07_022216A8
	b _02220C5E
_02220B80:
	add r2, sp, #0xb0
	bl ov07_02220938
	add r0, r4, #0
	add r1, sp, #0xb0
	bl ov07_02221734
	b _02220C5E
_02220B90:
	add r2, sp, #0xb0
	bl ov07_022208F8
	add r0, r4, #0
	add r1, sp, #0xb0
	bl ov07_02221734
	b _02220C5E
_02220BA0:
	ldr r0, _02220C94 ; =0x00002CE0
	str r0, [sp, #0xb0]
	mov r0, #0
	str r0, [sp, #0xb4]
	str r0, [sp, #0xb8]
	b _02220C5E
_02220BAC:
	ldr r0, _02220C98 ; =0xFFFFEC78
	str r0, [sp, #0xb0]
	ldr r0, _02220C9C ; =0xFFFFE890
	str r0, [sp, #0xb4]
	mov r0, #0
	str r0, [sp, #0xb8]
	b _02220C5E
_02220BBA:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0xb0
	bl ov07_02231B90
	b _02220C5E
_02220BC6:
	ldr r6, _02220CA0 ; =ov07_022354E0
	add r3, sp, #0x70
	mov r2, #6
_02220BCC:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02220BCC
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	bl ov07_02231924
	lsl r1, r0, #3
	add r0, sp, #0x70
	ldr r0, [r0, r1]
	str r0, [sp, #0xb0]
	add r0, sp, #0x74
	ldr r0, [r0, r1]
	str r0, [sp, #0xb4]
	mov r0, #0
	str r0, [sp, #0xb8]
	b _02220C5E
_02220BF0:
	ldr r6, _02220CA4 ; =ov07_02235578
	add r3, sp, #0x38
	mov r2, #7
_02220BF6:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02220BF6
	ldr r0, [r4]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220C0C
	mov r0, #6
	b _02220C14
_02220C0C:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	bl ov07_02231924
_02220C14:
	lsl r1, r0, #3
	add r0, sp, #0x38
	ldr r0, [r0, r1]
	str r0, [sp, #0xb0]
	add r0, sp, #0x3c
	ldr r0, [r0, r1]
	str r0, [sp, #0xb4]
	mov r0, #0
	str r0, [sp, #0xb8]
	b _02220C5E
_02220C28:
	ldr r6, _02220CA8 ; =ov07_02235540
	add r3, sp, #0
	mov r2, #7
_02220C2E:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02220C2E
	ldr r0, [r4]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220C44
	mov r0, #6
	b _02220C4C
_02220C44:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	bl ov07_02231924
_02220C4C:
	lsl r1, r0, #3
	add r0, sp, #0
	ldr r0, [r0, r1]
	str r0, [sp, #0xb0]
	add r0, sp, #4
	ldr r0, [r0, r1]
	str r0, [sp, #0xb4]
	mov r0, #0
	str r0, [sp, #0xb8]
_02220C5E:
	add r2, sp, #0xb0
	ldmia r2!, {r0, r1}
	add r4, #0x2c
	stmia r4!, {r0, r1}
	ldr r0, [r2]
	str r0, [r4]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0xb0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0xb4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #0xb8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r5, #0x30]
	add sp, #0xbc
	pop {r3, r4, r5, r6, pc}
	nop
_02220C94: .word 0x00002CE0
_02220C98: .word 0xFFFFEC78
_02220C9C: .word 0xFFFFE890
_02220CA0: .word ov07_022354E0
_02220CA4: .word ov07_02235578
_02220CA8: .word ov07_02235540
	thumb_func_end ov07_02220978

	thumb_func_start ov07_02220CAC
ov07_02220CAC: ; 0x02220CAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x148
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, [r1]
	ldr r1, [r1, #0x24]
	bl ov07_02231924
	str r0, [sp, #0x18]
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x28]
	bl ov07_02231924
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x18]
	cmp r0, #0x1a
	bls _02220CD6
	b _022214D0
_02220CD6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02220CE2: ; jump table
	.short _02220D18 - _02220CE2 - 2 ; case 0
	.short _02220D24 - _02220CE2 - 2 ; case 1
	.short _02220D24 - _02220CE2 - 2 ; case 2
	.short _0222143A - _02220CE2 - 2 ; case 3
	.short _02220D8C - _02220CE2 - 2 ; case 4
	.short _02220E46 - _02220CE2 - 2 ; case 5
	.short _02221178 - _02220CE2 - 2 ; case 6
	.short _02221178 - _02220CE2 - 2 ; case 7
	.short _02220F00 - _02220CE2 - 2 ; case 8
	.short _02220F00 - _02220CE2 - 2 ; case 9
	.short _02220F68 - _02220CE2 - 2 ; case 10
	.short _02220F68 - _02220CE2 - 2 ; case 11
	.short _02220FB6 - _02220CE2 - 2 ; case 12
	.short _02220FB6 - _02220CE2 - 2 ; case 13
	.short _02220FFE - _02220CE2 - 2 ; case 14
	.short _02220FFE - _02220CE2 - 2 ; case 15
	.short _02221046 - _02220CE2 - 2 ; case 16
	.short _02221046 - _02220CE2 - 2 ; case 17
	.short _022210E8 - _02220CE2 - 2 ; case 18
	.short _022210E8 - _02220CE2 - 2 ; case 19
	.short _02221130 - _02220CE2 - 2 ; case 20
	.short _02221130 - _02220CE2 - 2 ; case 21
	.short _0222144E - _02220CE2 - 2 ; case 22
	.short _022214D0 - _02220CE2 - 2 ; case 23
	.short _022214A2 - _02220CE2 - 2 ; case 24
	.short _0222145E - _02220CE2 - 2 ; case 25
	.short _02221470 - _02220CE2 - 2 ; case 26
_02220D18:
	mov r1, #0
	add r0, sp, #0x20
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	b _022214D0
_02220D24:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220D5E
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x10]
	cmp r0, #2
	add r0, sp, #0x20
	bne _02220D4C
	ldr r1, _02221080 ; =0xFFFFF2F8
	strh r1, [r0]
	mov r1, #0x73
	lsl r1, r1, #4
	strh r1, [r0, #2]
	mov r1, #0x2e
	lsl r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02220D4C:
	mov r1, #0x92
	lsl r1, r1, #4
	strh r1, [r0]
	ldr r1, _02221084 ; =0xFFFFFA60
	strh r1, [r0, #2]
	mov r1, #0x2e
	lsl r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02220D5E:
	ldr r0, [sp, #0x14]
	mov r1, #0xc
	mul r1, r0
	ldr r2, [sp, #0x18]
	mov r0, #0x48
	mul r0, r2
	ldr r2, _02221088 ; =ov07_02235CE0
	add r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _0222108C ; =ov07_02235CE4
	add r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221090 ; =ov07_02235CE8
	add r0, r3, r0
	ldr r1, [r1, r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220D8C:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220DC8
	ldr r0, [sp, #0x14]
	mov r1, #0xc
	mul r1, r0
	ldr r2, [sp, #0x18]
	mov r0, #0x48
	mul r0, r2
	ldr r2, _02221088 ; =ov07_02235CE0
	add r2, r2, r0
	ldr r2, [r1, r2]
	neg r3, r2
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _0222108C ; =ov07_02235CE4
	add r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221090 ; =ov07_02235CE8
	add r0, r3, r0
	ldr r1, [r1, r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220DC8:
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x24]
	bl ov07_0223192C
	add r4, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x28]
	bl ov07_0223192C
	cmp r4, r0
	bne _02220E14
	ldr r0, [sp, #0x14]
	mov r1, #0xc
	mul r1, r0
	ldr r2, [sp, #0x18]
	mov r0, #0x48
	mul r0, r2
	ldr r2, _02221088 ; =ov07_02235CE0
	add r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _0222108C ; =ov07_02235CE4
	add r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221090 ; =ov07_02235CE8
	add r0, r3, r0
	ldr r1, [r1, r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220E14:
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x24]
	bl ov07_0223192C
	cmp r0, #3
	add r0, sp, #0x20
	bne _02220E38
	mov r1, #0x3b
	lsl r1, r1, #6
	strh r1, [r0]
	mov r1, #0x21
	lsl r1, r1, #6
	strh r1, [r0, #2]
	ldr r1, _02221094 ; =0x000005FC
	strh r1, [r0, #4]
	b _022214D0
_02220E38:
	ldr r1, _02221098 ; =0xFFFFEF7C
	strh r1, [r0]
	ldr r1, _0222109C ; =0xFFFFF558
	strh r1, [r0, #2]
	ldr r1, _02221094 ; =0x000005FC
	strh r1, [r0, #4]
	b _022214D0
_02220E46:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220E82
	ldr r0, [sp, #0x14]
	mov r1, #0xc
	mul r1, r0
	ldr r2, [sp, #0x18]
	mov r0, #0x48
	mul r0, r2
	ldr r2, _02221088 ; =ov07_02235CE0
	add r2, r2, r0
	ldr r2, [r1, r2]
	neg r3, r2
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _0222108C ; =ov07_02235CE4
	add r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221090 ; =ov07_02235CE8
	add r0, r3, r0
	ldr r1, [r1, r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220E82:
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x24]
	bl ov07_0223192C
	add r4, r0, #0
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x28]
	bl ov07_0223192C
	cmp r4, r0
	bne _02220ECE
	ldr r0, [sp, #0x14]
	mov r1, #0xc
	mul r1, r0
	ldr r2, [sp, #0x18]
	mov r0, #0x48
	mul r0, r2
	ldr r2, _02221088 ; =ov07_02235CE0
	add r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _0222108C ; =ov07_02235CE4
	add r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221090 ; =ov07_02235CE8
	add r0, r3, r0
	ldr r1, [r1, r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220ECE:
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x24]
	bl ov07_0223192C
	cmp r0, #3
	add r0, sp, #0x20
	bne _02220EF2
	mov r1, #0x3b
	lsl r1, r1, #6
	strh r1, [r0]
	mov r1, #0x21
	lsl r1, r1, #6
	strh r1, [r0, #2]
	ldr r1, _02221094 ; =0x000005FC
	strh r1, [r0, #4]
	b _022214D0
_02220EF2:
	ldr r1, _02221098 ; =0xFFFFEF7C
	strh r1, [r0]
	ldr r1, _0222109C ; =0xFFFFF558
	strh r1, [r0, #2]
	ldr r1, _02221094 ; =0x000005FC
	strh r1, [r0, #4]
	b _022214D0
_02220F00:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220F3A
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x10]
	cmp r0, #2
	add r0, sp, #0x20
	bne _02220F28
	ldr r1, _022210A0 ; =0xFFFFF6E0
	strh r1, [r0]
	mov r1, #0x5a
	lsl r1, r1, #4
	strh r1, [r0, #2]
	mov r1, #0x2e
	lsl r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02220F28:
	mov r1, #0x92
	lsl r1, r1, #4
	strh r1, [r0]
	ldr r1, _02221084 ; =0xFFFFFA60
	strh r1, [r0, #2]
	mov r1, #0x2e
	lsl r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02220F3A:
	ldr r0, [sp, #0x14]
	mov r1, #0xc
	mul r1, r0
	ldr r2, [sp, #0x18]
	mov r0, #0x48
	mul r0, r2
	ldr r2, _022210A4 ; =ov07_02235620
	add r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _022210A8 ; =ov07_02235624
	add r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _022210AC ; =ov07_02235628
	add r0, r3, r0
	ldr r1, [r1, r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220F68:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220F88
	ldr r1, _022210A0 ; =0xFFFFF6E0
	add r0, sp, #0x20
	strh r1, [r0]
	mov r1, #0x5a
	lsl r1, r1, #4
	strh r1, [r0, #2]
	mov r1, #0x2e
	lsl r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02220F88:
	ldr r0, [sp, #0x14]
	mov r1, #0xc
	mul r1, r0
	ldr r2, [sp, #0x18]
	mov r0, #0x48
	mul r0, r2
	ldr r2, _022210B0 ; =ov07_022357D0
	add r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _022210A8 ; =ov07_02235624
	add r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _022210AC ; =ov07_02235628
	add r0, r3, r0
	ldr r1, [r1, r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	strh r0, [r2, #4]
	b _022214D0
_02220FB6:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02220FD6
	ldr r1, _022210B4 ; =0xFFFFF488
	add r0, sp, #0x20
	strh r1, [r0]
	mov r1, #0x5a
	lsl r1, r1, #4
	strh r1, [r0, #2]
	mov r1, #0x2e
	lsl r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02220FD6:
	ldr r0, [sp, #0x14]
	mov r1, #0xc
	mul r1, r0
	ldr r2, [sp, #0x18]
	mov r0, #0x48
	mul r0, r2
	ldr r2, _022210B8 ; =ov07_02235B30
	add r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _022210BC ; =ov07_02235B34
	add r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _022210C0 ; =ov07_02235B38
	add r0, r3, r0
	ldr r0, [r1, r0]
	strh r0, [r2, #4]
	b _022214D0
_02220FFE:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0222101E
	ldr r1, _022210A0 ; =0xFFFFF6E0
	add r0, sp, #0x20
	strh r1, [r0]
	mov r1, #0x5a
	lsl r1, r1, #4
	strh r1, [r0, #2]
	mov r1, #0x2e
	lsl r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_0222101E:
	ldr r0, [sp, #0x14]
	mov r1, #0xc
	mul r1, r0
	ldr r2, [sp, #0x18]
	mov r0, #0x48
	mul r0, r2
	ldr r2, _022210C4 ; =ov07_02235E90
	add r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _022210C8 ; =ov07_02235E94
	add r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _022210CC ; =ov07_02235E98
	add r0, r3, r0
	ldr r0, [r1, r0]
	strh r0, [r2, #4]
	b _022214D0
_02221046:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221066
	ldr r1, _022210A0 ; =0xFFFFF6E0
	add r0, sp, #0x20
	strh r1, [r0]
	mov r1, #0x5a
	lsl r1, r1, #4
	strh r1, [r0, #2]
	mov r1, #0x2e
	lsl r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02221066:
	ldr r0, [sp, #0x14]
	mov r1, #0xc
	mul r1, r0
	ldr r2, [sp, #0x18]
	mov r0, #0x48
	mul r0, r2
	ldr r2, _022210D0 ; =ov07_02235980
	add r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _022210D4 ; =ov07_02235984
	b _022210D8
	.balign 4, 0
_02221080: .word 0xFFFFF2F8
_02221084: .word 0xFFFFFA60
_02221088: .word ov07_02235CE0
_0222108C: .word ov07_02235CE4
_02221090: .word ov07_02235CE8
_02221094: .word 0x000005FC
_02221098: .word 0xFFFFEF7C
_0222109C: .word 0xFFFFF558
_022210A0: .word 0xFFFFF6E0
_022210A4: .word ov07_02235620
_022210A8: .word ov07_02235624
_022210AC: .word ov07_02235628
_022210B0: .word ov07_022357D0
_022210B4: .word 0xFFFFF488
_022210B8: .word ov07_02235B30
_022210BC: .word ov07_02235B34
_022210C0: .word ov07_02235B38
_022210C4: .word ov07_02235E90
_022210C8: .word ov07_02235E94
_022210CC: .word ov07_02235E98
_022210D0: .word ov07_02235980
_022210D4: .word ov07_02235984
_022210D8:
	add r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _022213F8 ; =ov07_02235988
	add r0, r3, r0
	ldr r0, [r1, r0]
	strh r0, [r2, #4]
	b _022214D0
_022210E8:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221108
	ldr r1, _022213FC ; =0xFFFFF6E0
	add r0, sp, #0x20
	strh r1, [r0]
	mov r1, #0x5a
	lsl r1, r1, #4
	strh r1, [r0, #2]
	mov r1, #0x2e
	lsl r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02221108:
	ldr r0, [sp, #0x14]
	mov r1, #0xc
	mul r1, r0
	ldr r2, [sp, #0x18]
	mov r0, #0x48
	mul r0, r2
	ldr r2, _02221400 ; =ov07_02236040
	add r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _02221404 ; =ov07_02236044
	add r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221408 ; =ov07_02236048
	add r0, r3, r0
	ldr r0, [r1, r0]
	strh r0, [r2, #4]
	b _022214D0
_02221130:
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221150
	ldr r1, _0222140C ; =0xFFFFEF10
	add r0, sp, #0x20
	strh r1, [r0]
	mov r1, #0x5a
	lsl r1, r1, #4
	strh r1, [r0, #2]
	mov r1, #0x2e
	lsl r1, r1, #4
	strh r1, [r0, #4]
	b _022214D0
_02221150:
	ldr r0, [sp, #0x14]
	mov r1, #0xc
	mul r1, r0
	ldr r2, [sp, #0x18]
	mov r0, #0x48
	mul r0, r2
	ldr r2, _02221410 ; =ov07_022361F0
	add r2, r2, r0
	ldr r3, [r1, r2]
	add r2, sp, #0x20
	strh r3, [r2]
	ldr r3, _02221414 ; =ov07_022361F4
	add r3, r3, r0
	ldr r3, [r1, r3]
	strh r3, [r2, #2]
	ldr r3, _02221418 ; =ov07_022361F8
	add r0, r3, r0
	ldr r0, [r1, r0]
	strh r0, [r2, #4]
	b _022214D0
_02221178:
	ldr r4, _0222141C ; =ov07_022355B0
	add r3, sp, #0xd8
	mov r2, #0xe
_0222117E:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222117E
	ldr r3, _02221420 ; =ov07_022354D0
	add r2, sp, #0x58
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	add r1, sp, #0xc8
	mov r0, #0
	str r1, [sp, #0xc]
	add r1, sp, #0xb8
	mov ip, r0
	str r1, [sp, #0x1c]
	add r0, sp, #0xd8
	add r7, sp, #0xa8
	add r6, sp, #0x98
	add r5, sp, #0x88
	add r1, sp, #0x78
	add r2, sp, #0x68
_022211AA:
	ldr r4, [r0]
	ldr r3, [sp, #0xc]
	str r4, [r3]
	ldr r4, [r0, #0x10]
	ldr r3, [sp, #0x1c]
	str r4, [r3]
	ldr r3, [r0, #0x20]
	stmia r7!, {r3}
	ldr r3, [r0, #0x30]
	stmia r6!, {r3}
	ldr r3, [r0, #0x40]
	stmia r5!, {r3}
	ldr r3, [r0, #0x50]
	stmia r1!, {r3}
	ldr r3, [r0, #0x60]
	add r0, r0, #4
	stmia r2!, {r3}
	ldr r3, [sp, #0xc]
	add r3, r3, #4
	str r3, [sp, #0xc]
	ldr r3, [sp, #0x1c]
	add r3, r3, #4
	str r3, [sp, #0x1c]
	mov r3, ip
	add r3, r3, #1
	mov ip, r3
	cmp r3, #4
	blt _022211AA
	ldr r0, [sp, #4]
	ldr r0, [r0]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221226
	mov r0, #0
	str r0, [sp, #8]
	add r0, sp, #0x58
	str r0, [sp, #0x10]
	add r7, sp, #0xc8
	add r6, sp, #0xb8
	add r0, sp, #0xa8
	add r1, sp, #0x98
	add r2, sp, #0x88
	add r3, sp, #0x78
	add r4, sp, #0x68
_02221204:
	ldr r5, [sp, #0x10]
	ldr r5, [r5]
	stmia r7!, {r5}
	stmia r6!, {r5}
	stmia r0!, {r5}
	stmia r1!, {r5}
	stmia r2!, {r5}
	stmia r3!, {r5}
	stmia r4!, {r5}
	ldr r5, [sp, #0x10]
	add r5, r5, #4
	str r5, [sp, #0x10]
	ldr r5, [sp, #8]
	add r5, r5, #1
	str r5, [sp, #8]
	cmp r5, #4
	blt _02221204
_02221226:
	ldr r0, [sp, #0x18]
	cmp r0, #5
	bhi _02221244
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02221238: ; jump table
	.short _02221244 - _02221238 - 2 ; case 0
	.short _02221254 - _02221238 - 2 ; case 1
	.short _02221280 - _02221238 - 2 ; case 2
	.short _022212B8 - _02221238 - 2 ; case 3
	.short _02221346 - _02221238 - 2 ; case 4
	.short _0222137E - _02221238 - 2 ; case 5
_02221244:
	ldr r1, [sp, #0xc8]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0xcc]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xd0]
	strh r1, [r0, #4]
	b _022214D0
_02221254:
	ldr r0, [sp, #0xd4]
	cmp r0, #1
	bne _0222126A
	ldr r1, [sp, #0xc8]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0xcc]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xd0]
	strh r1, [r0, #4]
	b _022214D0
_0222126A:
	ldr r0, [sp, #0xc8]
	neg r1, r0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0xcc]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0xd0]
	neg r1, r1
	strh r1, [r0, #4]
	b _022214D0
_02221280:
	ldr r0, [sp, #0x14]
	cmp r0, #3
	bne _02221296
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0xbc]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xc0]
	strh r1, [r0, #4]
	b _022214D0
_02221296:
	cmp r0, #5
	add r0, sp, #0x20
	bne _022212AA
	ldr r1, [sp, #0x98]
	strh r1, [r0]
	ldr r1, [sp, #0x9c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xa0]
	strh r1, [r0, #4]
	b _022214D0
_022212AA:
	ldr r1, [sp, #0xa8]
	strh r1, [r0]
	ldr r1, [sp, #0xac]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xb0]
	strh r1, [r0, #4]
	b _022214D0
_022212B8:
	ldr r0, [sp, #0x14]
	cmp r0, #2
	bne _022212EA
	ldr r0, [sp, #0xc4]
	cmp r0, #1
	bne _022212D4
	ldr r1, [sp, #0xb8]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0xbc]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xc0]
	strh r1, [r0, #4]
	b _022214D0
_022212D4:
	ldr r0, [sp, #0xb8]
	neg r1, r0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0xbc]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0xc0]
	neg r1, r1
	strh r1, [r0, #4]
	b _022214D0
_022212EA:
	cmp r0, #5
	bne _0222131A
	ldr r0, [sp, #0xb4]
	cmp r0, #1
	bne _0222130A
	ldr r0, [sp, #0x88]
	neg r1, r0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x8c]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0x90]
	neg r1, r1
	strh r1, [r0, #4]
	b _022214D0
_0222130A:
	ldr r1, [sp, #0x88]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x8c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x90]
	strh r1, [r0, #4]
	b _022214D0
_0222131A:
	ldr r0, [sp, #0x84]
	cmp r0, #1
	bne _02221330
	ldr r1, [sp, #0x78]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x7c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x80]
	strh r1, [r0, #4]
	b _022214D0
_02221330:
	ldr r0, [sp, #0x78]
	neg r1, r0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x7c]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0x80]
	neg r1, r1
	strh r1, [r0, #4]
	b _022214D0
_02221346:
	ldr r0, [sp, #0x14]
	cmp r0, #3
	bne _0222135C
	ldr r1, [sp, #0x78]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x7c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x80]
	strh r1, [r0, #4]
	b _022214D0
_0222135C:
	cmp r0, #5
	add r0, sp, #0x20
	bne _02221370
	ldr r1, [sp, #0x68]
	strh r1, [r0]
	ldr r1, [sp, #0x6c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x70]
	strh r1, [r0, #4]
	b _022214D0
_02221370:
	ldr r1, [sp, #0x88]
	strh r1, [r0]
	ldr r1, [sp, #0x8c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x90]
	strh r1, [r0, #4]
	b _022214D0
_0222137E:
	ldr r0, [sp, #0x14]
	cmp r0, #3
	bne _022213B0
	ldr r0, [sp, #0xc4]
	cmp r0, #1
	bne _0222139A
	ldr r1, [sp, #0x88]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x8c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x90]
	strh r1, [r0, #4]
	b _022214D0
_0222139A:
	ldr r0, [sp, #0x88]
	neg r1, r0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x8c]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0x90]
	neg r1, r1
	strh r1, [r0, #4]
	b _022214D0
_022213B0:
	cmp r0, #2
	bne _022213E0
	ldr r0, [sp, #0xc4]
	cmp r0, #1
	bne _022213CA
	ldr r1, [sp, #0x98]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x9c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0xa0]
	strh r1, [r0, #4]
	b _022214D0
_022213CA:
	ldr r0, [sp, #0x98]
	neg r1, r0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x9c]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0xa0]
	neg r1, r1
	strh r1, [r0, #4]
	b _022214D0
_022213E0:
	ldr r0, [sp, #0xc4]
	cmp r0, #1
	bne _02221424
	ldr r1, [sp, #0x68]
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x6c]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x70]
	strh r1, [r0, #4]
	b _022214D0
	nop
_022213F8: .word ov07_02235988
_022213FC: .word 0xFFFFF6E0
_02221400: .word ov07_02236040
_02221404: .word ov07_02236044
_02221408: .word ov07_02236048
_0222140C: .word 0xFFFFEF10
_02221410: .word ov07_022361F0
_02221414: .word ov07_022361F4
_02221418: .word ov07_022361F8
_0222141C: .word ov07_022355B0
_02221420: .word ov07_022354D0
_02221424:
	ldr r0, [sp, #0x68]
	neg r1, r0
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, [sp, #0x6c]
	neg r1, r1
	strh r1, [r0, #2]
	ldr r1, [sp, #0x70]
	neg r1, r1
	strh r1, [r0, #4]
	b _022214D0
_0222143A:
	ldr r1, _022214F0 ; =0xFFFFFCE0
	add r0, sp, #0x20
	strh r1, [r0]
	mov r1, #0x4b
	lsl r1, r1, #4
	strh r1, [r0, #2]
	mov r1, #0x7d
	lsl r1, r1, #2
	strh r1, [r0, #4]
	b _022214D0
_0222144E:
	ldr r1, _022214F4 ; =0xFFFFF2AE
	add r0, sp, #0x20
	strh r1, [r0]
	ldr r1, _022214F8 ; =0xFFFFF5AC
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	b _022214D0
_0222145E:
	ldr r1, _022214FC ; =0xFFFFF290
	add r0, sp, #0x20
	strh r1, [r0]
	mov r1, #0x7a
	lsl r1, r1, #4
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	b _022214D0
_02221470:
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x24]
	bl ov07_0223192C
	cmp r0, #3
	add r0, sp, #0x20
	bne _02221494
	mov r1, #0x3b
	lsl r1, r1, #6
	strh r1, [r0]
	mov r1, #0x21
	lsl r1, r1, #6
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	b _022214D0
_02221494:
	ldr r1, _02221500 ; =0xFFFFE890
	strh r1, [r0]
	ldr r1, _02221504 ; =0xFFFFF768
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
	b _022214D0
_022214A2:
	ldr r4, _02221508 ; =ov07_02235510
	add r3, sp, #0x28
	mov r2, #6
_022214A8:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _022214A8
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r1, [r1, #0x24]
	bl ov07_02231924
	lsl r2, r0, #3
	add r0, sp, #0x28
	ldr r1, [r0, r2]
	add r0, sp, #0x20
	strh r1, [r0]
	add r1, sp, #0x2c
	ldr r1, [r1, r2]
	strh r1, [r0, #2]
	mov r1, #0
	strh r1, [r0, #4]
_022214D0:
	add r1, sp, #0x20
	ldr r0, [sp]
	ldrh r2, [r1]
	add r0, #0x50
	strh r2, [r0]
	ldr r0, [sp]
	ldrh r2, [r1, #2]
	add r0, #0x52
	strh r2, [r0]
	ldr r0, [sp]
	ldrh r1, [r1, #4]
	add r0, #0x54
	str r0, [sp]
	strh r1, [r0]
	add sp, #0x148
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022214F0: .word 0xFFFFFCE0
_022214F4: .word 0xFFFFF2AE
_022214F8: .word 0xFFFFF5AC
_022214FC: .word 0xFFFFF290
_02221500: .word 0xFFFFE890
_02221504: .word 0xFFFFF768
_02221508: .word ov07_02235510
	thumb_func_end ov07_02220CAC

	thumb_func_start ov07_0222150C
ov07_0222150C: ; 0x0222150C
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	bl ov07_02221CB4
	add r6, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _0222153C
_0222151E:
	add r0, r4, #0
	bl ov07_02221C8C
	ldr r1, [r5, #0x1c]
	and r1, r0
	cmp r0, r1
	bne _02221536
	add r0, r4, #0
	add r1, r7, #0
	add r2, r5, #0
	bl ov07_02221C74
_02221536:
	add r4, r4, #1
	cmp r4, r6
	blt _0222151E
_0222153C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0222150C

	thumb_func_start ov07_02221540
ov07_02221540: ; 0x02221540
	add r3, r0, #0
	add r2, r1, #0
	add r1, r3, #0
	ldr r3, _0222154C ; =ov07_02221EEC
	ldr r0, [r2, #0x20]
	bx r3
	.balign 4, 0
_0222154C: .word ov07_02221EEC
	thumb_func_end ov07_02221540

	thumb_func_start ov07_02221550
ov07_02221550: ; 0x02221550
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	bl ov07_02231924
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	bl ov07_02231924
	ldr r1, [r4, #0xc]
	cmp r1, #3
	bhi _02221598
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02221578: ; jump table
	.short _02221598 - _02221578 - 2 ; case 0
	.short _02221580 - _02221578 - 2 ; case 1
	.short _0222158E - _02221578 - 2 ; case 2
	.short _02221598 - _02221578 - 2 ; case 3
_02221580:
	cmp r0, #0
	bne _0222158A
	mov r5, #1
	lsl r5, r5, #8
	b _02221598
_0222158A:
	ldr r5, _022215AC ; =0xFFFFEC00
	b _02221598
_0222158E:
	cmp r0, #0
	bne _02221596
	mov r5, #0
	b _02221598
_02221596:
	ldr r5, _022215B0 ; =0xFFFFEB00
_02221598:
	ldr r0, [r4, #4]
	bl sub_02015530
	ldr r0, [r6, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r5, r0
	str r0, [r6, #0x30]
	pop {r4, r5, r6, pc}
	nop
_022215AC: .word 0xFFFFEC00
_022215B0: .word 0xFFFFEB00
	thumb_func_end ov07_02221550

	thumb_func_start ov07_022215B4
ov07_022215B4: ; 0x022215B4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl sub_02015504
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0x38
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	add r0, r5, #0
	bl ov07_0221C478
	str r0, [r4, #4]
	add r1, r4, #0
	ldr r0, [r4]
	add r1, #0xc
	mov r2, #6
	bl ov07_0221F9A8
	ldr r0, [r4, #0x10]
	cmp r0, #4
	bhi _022215FC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022215F2: ; jump table
	.short _022215FC - _022215F2 - 2 ; case 0
	.short _0222160E - _022215F2 - 2 ; case 1
	.short _02221620 - _022215F2 - 2 ; case 2
	.short _02221632 - _022215F2 - 2 ; case 3
	.short _02221644 - _022215F2 - 2 ; case 4
_022215FC:
	ldr r0, [r4]
	bl ov07_0221C468
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bl ov07_0221C470
	str r0, [r4, #0x28]
	b _02221654
_0222160E:
	ldr r0, [r4]
	bl ov07_0221C470
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bl ov07_0221C468
	str r0, [r4, #0x28]
	b _02221654
_02221620:
	ldr r0, [r4]
	bl ov07_0221C468
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bl ov07_0221C470
	str r0, [r4, #0x28]
	b _02221654
_02221632:
	ldr r0, [r4]
	bl ov07_0221C470
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bl ov07_0221C468
	str r0, [r4, #0x28]
	b _02221654
_02221644:
	ldr r0, [r4]
	bl ov07_0221C468
	str r0, [r4, #0x24]
	ldr r0, [r4]
	bl ov07_0221C470
	str r0, [r4, #0x28]
_02221654:
	add r0, r6, #0
	add r1, r4, #0
	bl ov07_022208B4
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_022215B4

	thumb_func_start ov07_02221664
ov07_02221664: ; 0x02221664
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, [r6]
	ldr r1, [r6, #0x24]
	mov r4, #1
	bl ov07_02231924
	add r5, r0, #0
	ldr r0, [r6]
	ldr r1, [r6, #0x28]
	bl ov07_02231924
	cmp r5, #5
	bhi _022216A2
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222168C: ; jump table
	.short _022216A2 - _0222168C - 2 ; case 0
	.short _02221698 - _0222168C - 2 ; case 1
	.short _022216A2 - _0222168C - 2 ; case 2
	.short _0222169C - _0222168C - 2 ; case 3
	.short _022216A2 - _0222168C - 2 ; case 4
	.short _022216A0 - _0222168C - 2 ; case 5
_02221698:
	sub r4, r4, #2
	b _022216A2
_0222169C:
	sub r4, r4, #2
	b _022216A2
_022216A0:
	sub r4, r4, #2
_022216A2:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02221664

	thumb_func_start ov07_022216A8
ov07_022216A8: ; 0x022216A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r5, r0, #0
	add r0, sp, #0x20
	mov r4, #0
	str r4, [r0]
	str r4, [r0, #4]
	add r6, r1, #0
	add r7, r2, #0
	str r4, [r0, #8]
_022216BC:
	ldr r0, [r5]
	add r1, r6, #0
	bl ov07_02231924
	cmp r4, r0
	ldr r0, [r5]
	bne _022216D4
	add r1, sp, #0x10
	mov r2, #4
	bl ov07_0221F9A8
	b _022216DC
_022216D4:
	add r1, sp, #0
	mov r2, #4
	bl ov07_0221F9A8
_022216DC:
	add r4, r4, #1
	cmp r4, #6
	blt _022216BC
	add r0, r5, #0
	bl ov07_02221664
	strb r0, [r5, #8]
	ldr r0, [sp, #0x14]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _02221700
	mov r0, #1
	strb r0, [r5, #8]
_02221700:
	mov r1, #8
	ldrsb r0, [r5, r1]
	ldr r2, [sp, #0x20]
	ldr r3, [sp, #0x24]
	mul r0, r2
	str r0, [sp, #0x20]
	ldrsb r2, [r5, r1]
	mul r2, r3
	str r2, [sp, #0x24]
	ldrsb r1, [r5, r1]
	ldr r2, [sp, #0x28]
	mul r1, r2
	str r1, [sp, #0x28]
	ldr r1, [r7]
	add r0, r1, r0
	str r0, [r7]
	ldr r1, [r7, #4]
	ldr r0, [sp, #0x24]
	add r0, r1, r0
	str r0, [r7, #4]
	ldr r1, [r7, #8]
	ldr r0, [sp, #0x28]
	add r0, r1, r0
	str r0, [r7, #8]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_022216A8

	thumb_func_start ov07_02221734
ov07_02221734: ; 0x02221734
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r4, r1, #0
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	ldr r0, [r5]
	add r1, sp, #0xc
	mov r2, #4
	bl ov07_0221F9A8
	add r0, r5, #0
	bl ov07_02221664
	strb r0, [r5, #8]
	ldr r0, [sp, #0x10]
	str r0, [sp]
	ldr r0, [sp, #0x14]
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	str r0, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _0222176E
	mov r0, #1
	strb r0, [r5, #8]
_0222176E:
	mov r1, #8
	ldrsb r0, [r5, r1]
	ldr r2, [sp]
	ldr r3, [sp, #4]
	mul r0, r2
	str r0, [sp]
	ldrsb r2, [r5, r1]
	mul r2, r3
	str r2, [sp, #4]
	ldrsb r1, [r5, r1]
	ldr r2, [sp, #8]
	mul r1, r2
	str r1, [sp, #8]
	ldr r1, [r4]
	add r0, r1, r0
	str r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [sp, #4]
	add r0, r1, r0
	str r0, [r4, #4]
	ldr r1, [r4, #8]
	ldr r0, [sp, #8]
	add r0, r1, r0
	str r0, [r4, #8]
	add sp, #0x1c
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02221734

	thumb_func_start ov07_022217A4
ov07_022217A4: ; 0x022217A4
	ldr r3, _022217AC ; =ov07_0221F9A8
	ldr r0, [r0]
	mov r2, #5
	bx r3
	.balign 4, 0
_022217AC: .word ov07_0221F9A8
	thumb_func_end ov07_022217A4

	thumb_func_start ov07_022217B0
ov07_022217B0: ; 0x022217B0
	mov r0, #1
	bx lr
	thumb_func_end ov07_022217B0

	thumb_func_start ov07_022217B4
ov07_022217B4: ; 0x022217B4
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r4, r1, #0
	add r1, sp, #0
	mov r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	add r0, r4, #0
	add r1, sp, #8
	bl ov07_022217A4
	add r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _022217E0
	mov r0, #1
	strb r0, [r4, #8]
_022217E0:
	ldr r0, [sp, #8]
	cmp r0, #3
	bgt _022217FE
	cmp r0, #0
	blt _0222186A
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022217F6: ; jump table
	.short _02221802 - _022217F6 - 2 ; case 0
	.short _0222182E - _022217F6 - 2 ; case 1
	.short _0222186A - _022217F6 - 2 ; case 2
	.short _0222186A - _022217F6 - 2 ; case 3
_022217FE:
	cmp r0, #0xff
	b _0222186A
_02221802:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0201560C
	add r2, sp, #0
	mov r0, #0
	mov r1, #8
	ldrsh r3, [r2, r0]
	ldrsb r0, [r4, r1]
	mul r0, r3
	strh r0, [r2]
	mov r0, #2
	ldrsh r3, [r2, r0]
	ldrsb r0, [r4, r1]
	mul r0, r3
	strh r0, [r2, #2]
	mov r0, #4
	ldrsh r3, [r2, r0]
	ldrsb r0, [r4, r1]
	mul r0, r3
	strh r0, [r2, #4]
	b _0222186A
_0222182E:
	ldr r0, [sp, #0x10]
	add r2, sp, #0
	strh r0, [r2]
	ldr r0, [sp, #0x14]
	mov r1, #8
	strh r0, [r2, #2]
	ldr r0, [sp, #0x18]
	strh r0, [r2, #4]
	mov r0, #0
	ldrsh r3, [r2, r0]
	ldrsb r0, [r4, r1]
	mul r0, r3
	strh r0, [r2]
	mov r0, #2
	ldrsh r3, [r2, r0]
	ldrsb r0, [r4, r1]
	mul r0, r3
	strh r0, [r2, #2]
	mov r0, #4
	ldrsh r3, [r2, r0]
	ldrsb r0, [r4, r1]
	add r1, sp, #0
	mul r0, r3
	strh r0, [r2, #4]
	add r0, r5, #0
	bl sub_0201560C
	add sp, #0x1c
	mov r0, #1
	pop {r4, r5, pc}
_0222186A:
	add r1, sp, #0
	mov r0, #0
	ldrsh r2, [r1, r0]
	ldr r0, [r4, #0x2c]
	sub r0, r2, r0
	strh r0, [r1]
	mov r0, #2
	ldrsh r2, [r1, r0]
	ldr r0, [r4, #0x30]
	sub r0, r2, r0
	strh r0, [r1, #2]
	mov r0, #4
	ldrsh r2, [r1, r0]
	ldr r0, [r4, #0x34]
	sub r0, r2, r0
	strh r0, [r1, #4]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0201560C
	mov r0, #1
	add sp, #0x1c
	pop {r4, r5, pc}
	thumb_func_end ov07_022217B4

	thumb_func_start ov07_02221898
ov07_02221898: ; 0x02221898
	mov r0, #1
	bx lr
	thumb_func_end ov07_02221898

	thumb_func_start ov07_0222189C
ov07_0222189C: ; 0x0222189C
	mov r0, #1
	bx lr
	thumb_func_end ov07_0222189C

	thumb_func_start ov07_022218A0
ov07_022218A0: ; 0x022218A0
	push {r4, r5, r6, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r4, r1, #0
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r4, #0
	add r1, sp, #0xc
	bl ov07_022217A4
	add r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _022218CC
	mov r0, #1
	strb r0, [r4, #8]
_022218CC:
	ldr r0, [sp, #0xc]
	cmp r0, #3
	bgt _022218EA
	cmp r0, #0
	blt _0222194A
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022218E2: ; jump table
	.short _022218EE - _022218E2 - 2 ; case 0
	.short _02221912 - _022218E2 - 2 ; case 1
	.short _02221934 - _022218E2 - 2 ; case 2
	.short _02221940 - _022218E2 - 2 ; case 3
_022218EA:
	cmp r0, #0xff
	b _0222194A
_022218EE:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02015640
	mov r0, #8
	ldrsb r1, [r4, r0]
	ldr r2, [sp]
	mul r1, r2
	str r1, [sp]
	ldrsb r1, [r4, r0]
	ldr r2, [sp, #4]
	mul r1, r2
	str r1, [sp, #4]
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #8]
	mul r0, r1
	str r0, [sp, #8]
	b _0222194A
_02221912:
	ldr r2, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r2, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #8
	ldrsb r6, [r4, r3]
	mul r6, r2
	str r6, [sp]
	ldrsb r2, [r4, r3]
	mul r2, r1
	str r2, [sp, #4]
	ldrsb r1, [r4, r3]
	mul r1, r0
	str r1, [sp, #8]
	b _0222194A
_02221934:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0
	bl ov07_02231B90
	b _0222194A
_02221940:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0
	bl ov07_02231B90
_0222194A:
	ldr r1, [sp]
	ldr r0, [r4, #0x2c]
	sub r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x30]
	sub r0, r1, r0
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02015628
	mov r0, #1
	add sp, #0x20
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_022218A0

	thumb_func_start ov07_02221968
ov07_02221968: ; 0x02221968
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0
	add r0, sp, #0
	strh r1, [r0]
	add r0, r4, #0
	add r1, sp, #4
	bl ov07_022217A4
	add r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _02221990
	mov r0, #1
	strb r0, [r4, #8]
_02221990:
	ldr r0, [sp, #4]
	cmp r0, #3
	bgt _022219AE
	cmp r0, #0
	blt _022219DC
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022219A6: ; jump table
	.short _022219B2 - _022219A6 - 2 ; case 0
	.short _022219CA - _022219A6 - 2 ; case 1
	.short _022219DC - _022219A6 - 2 ; case 2
	.short _022219DC - _022219A6 - 2 ; case 3
_022219AE:
	cmp r0, #0xff
	b _022219DC
_022219B2:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0201568C
	add r1, sp, #0
	mov r0, #0
	ldrsh r2, [r1, r0]
	mov r0, #8
	ldrsb r0, [r4, r0]
	mul r0, r2
	strh r0, [r1]
	b _022219DC
_022219CA:
	ldr r0, [sp, #0xc]
	add r1, sp, #0
	strh r0, [r1]
	mov r0, #0
	ldrsh r2, [r1, r0]
	mov r0, #8
	ldrsb r0, [r4, r0]
	mul r0, r2
	strh r0, [r1]
_022219DC:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02015674
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02221968

	thumb_func_start ov07_022219EC
ov07_022219EC: ; 0x022219EC
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0
	add r0, sp, #0
	strh r1, [r0]
	add r0, r4, #0
	add r1, sp, #4
	bl ov07_022217A4
	add r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _02221A14
	mov r0, #1
	strb r0, [r4, #8]
_02221A14:
	ldr r0, [sp, #4]
	cmp r0, #3
	bgt _02221A32
	cmp r0, #0
	blt _02221A5C
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02221A2A: ; jump table
	.short _02221A36 - _02221A2A - 2 ; case 0
	.short _02221A4C - _02221A2A - 2 ; case 1
	.short _02221A5C - _02221A2A - 2 ; case 2
	.short _02221A5C - _02221A2A - 2 ; case 3
_02221A32:
	cmp r0, #0xff
	b _02221A5C
_02221A36:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_020156BC
	add r1, sp, #0
	mov r0, #8
	ldrh r2, [r1]
	ldrsb r0, [r4, r0]
	mul r0, r2
	strh r0, [r1]
	b _02221A5C
_02221A4C:
	ldr r0, [sp, #0xc]
	add r1, sp, #0
	strh r0, [r1]
	mov r0, #8
	ldrh r2, [r1]
	ldrsb r0, [r4, r0]
	mul r0, r2
	strh r0, [r1]
_02221A5C:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_020156A8
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_022219EC

	thumb_func_start ov07_02221A6C
ov07_02221A6C: ; 0x02221A6C
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0
	add r0, sp, #0
	strh r1, [r0]
	add r0, r4, #0
	add r1, sp, #4
	bl ov07_022217A4
	add r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _02221A94
	mov r0, #1
	strb r0, [r4, #8]
_02221A94:
	ldr r1, [sp, #4]
	cmp r1, #3
	bgt _02221AB2
	cmp r1, #0
	blt _02221AC6
	add r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02221AAA: ; jump table
	.short _02221AB6 - _02221AAA - 2 ; case 0
	.short _02221AC0 - _02221AAA - 2 ; case 1
	.short _02221AC6 - _02221AAA - 2 ; case 2
	.short _02221AC6 - _02221AAA - 2 ; case 3
_02221AB2:
	cmp r1, #0xff
	b _02221AC6
_02221AB6:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_020156EC
	b _02221AC6
_02221AC0:
	ldr r1, [sp, #0xc]
	add r0, sp, #0
	strh r1, [r0]
_02221AC6:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_020156D8
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02221A6C

	thumb_func_start ov07_02221AD4
ov07_02221AD4: ; 0x02221AD4
	mov r0, #1
	bx lr
	thumb_func_end ov07_02221AD4

	thumb_func_start ov07_02221AD8
ov07_02221AD8: ; 0x02221AD8
	mov r0, #1
	bx lr
	thumb_func_end ov07_02221AD8

	thumb_func_start ov07_02221ADC
ov07_02221ADC: ; 0x02221ADC
	mov r0, #1
	bx lr
	thumb_func_end ov07_02221ADC

	thumb_func_start ov07_02221AE0
ov07_02221AE0: ; 0x02221AE0
	mov r0, #1
	bx lr
	thumb_func_end ov07_02221AE0

	thumb_func_start ov07_02221AE4
ov07_02221AE4: ; 0x02221AE4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r7, r0, #0
	add r4, r1, #0
	add r1, sp, #0
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	add r0, r4, #0
	add r1, sp, #0xc
	bl ov07_022217A4
	add r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _02221B10
	mov r0, #1
	strb r0, [r4, #8]
_02221B10:
	ldr r0, [sp, #0xc]
	cmp r0, #4
	bgt _02221B30
	cmp r0, #0
	blt _02221BCA
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02221B26: ; jump table
	.short _02221B34 - _02221B26 - 2 ; case 0
	.short _02221B58 - _02221B26 - 2 ; case 1
	.short _02221BB4 - _02221B26 - 2 ; case 2
	.short _02221BC0 - _02221B26 - 2 ; case 3
	.short _02221B7A - _02221B26 - 2 ; case 4
_02221B30:
	cmp r0, #0xff
	b _02221BCA
_02221B34:
	add r0, r7, #0
	add r1, sp, #0
	bl sub_02015720
	mov r0, #8
	ldrsb r1, [r4, r0]
	ldr r2, [sp]
	mul r1, r2
	str r1, [sp]
	ldrsb r1, [r4, r0]
	ldr r2, [sp, #4]
	mul r1, r2
	str r1, [sp, #4]
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #8]
	mul r0, r1
	str r0, [sp, #8]
	b _02221BCA
_02221B58:
	ldr r2, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	str r2, [sp]
	str r1, [sp, #4]
	str r0, [sp, #8]
	mov r3, #8
	ldrsb r5, [r4, r3]
	mul r5, r2
	str r5, [sp]
	ldrsb r2, [r4, r3]
	mul r2, r1
	str r2, [sp, #4]
	ldrsb r1, [r4, r3]
	mul r1, r0
	str r1, [sp, #8]
	b _02221BCA
_02221B7A:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0
	bl ov07_02231B90
	ldr r1, [sp]
	ldr r5, [sp, #0x14]
	add r0, r1, #0
	ldr r6, [sp, #0x18]
	mul r0, r5
	add r1, r6, #0
	bl _s32_div_f
	ldr r1, [sp, #4]
	str r0, [sp]
	add r0, r1, #0
	mul r0, r5
	add r1, r6, #0
	bl _s32_div_f
	ldr r1, [sp, #8]
	str r0, [sp, #4]
	add r0, r1, #0
	mul r0, r5
	add r1, r6, #0
	bl _s32_div_f
	str r0, [sp, #8]
	b _02221BCA
_02221BB4:
	ldr r0, [r4]
	ldr r1, [r4, #0x24]
	add r2, sp, #0
	bl ov07_02231B90
	b _02221BCA
_02221BC0:
	ldr r0, [r4]
	ldr r1, [r4, #0x28]
	add r2, sp, #0
	bl ov07_02231B90
_02221BCA:
	ldr r1, [sp]
	ldr r0, [r4, #0x2c]
	sub r0, r1, r0
	str r0, [sp]
	ldr r1, [sp, #4]
	ldr r0, [r4, #0x30]
	sub r0, r1, r0
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r0, [r4, #0x34]
	sub r0, r1, r0
	str r0, [sp, #8]
	add r0, r7, #0
	add r1, sp, #0
	bl sub_02015708
	mov r0, #1
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02221AE4

	thumb_func_start ov07_02221BF0
ov07_02221BF0: ; 0x02221BF0
	push {r3, r4, r5, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #0
	add r0, sp, #0
	strh r1, [r0]
	add r0, r4, #0
	add r1, sp, #4
	bl ov07_022217A4
	add r0, r4, #0
	bl ov07_02221664
	strb r0, [r4, #8]
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _02221C18
	mov r0, #1
	strb r0, [r4, #8]
_02221C18:
	ldr r0, [sp, #4]
	cmp r0, #3
	bgt _02221C36
	cmp r0, #0
	blt _02221C64
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02221C2E: ; jump table
	.short _02221C3A - _02221C2E - 2 ; case 0
	.short _02221C52 - _02221C2E - 2 ; case 1
	.short _02221C64 - _02221C2E - 2 ; case 2
	.short _02221C64 - _02221C2E - 2 ; case 3
_02221C36:
	cmp r0, #0xff
	b _02221C64
_02221C3A:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0201576C
	add r1, sp, #0
	mov r0, #0
	ldrsh r2, [r1, r0]
	mov r0, #8
	ldrsb r0, [r4, r0]
	mul r0, r2
	strh r0, [r1]
	b _02221C64
_02221C52:
	ldr r0, [sp, #0xc]
	add r1, sp, #0
	strh r0, [r1]
	mov r0, #0
	ldrsh r2, [r1, r0]
	mov r0, #8
	ldrsb r0, [r4, r0]
	mul r0, r2
	strh r0, [r1]
_02221C64:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_02015754
	mov r0, #1
	add sp, #0x18
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02221BF0

	thumb_func_start ov07_02221C74
ov07_02221C74: ; 0x02221C74
	push {r3, lr}
	add r3, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	ldr r2, _02221C88 ; =ov07_022363A0
	lsl r3, r3, #2
	ldr r2, [r2, r3]
	blx r2
	pop {r3, pc}
	nop
_02221C88: .word ov07_022363A0
	thumb_func_end ov07_02221C74

	thumb_func_start ov07_02221C8C
ov07_02221C8C: ; 0x02221C8C
	push {r3, r4, r5}
	sub sp, #0x3c
	ldr r4, _02221CB0 ; =ov07_022363D8
	add r5, r0, #0
	add r3, sp, #0
	mov r2, #7
_02221C98:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02221C98
	ldr r0, [r4]
	lsl r1, r5, #2
	str r0, [r3]
	add r0, sp, #0
	ldr r0, [r0, r1]
	add sp, #0x3c
	pop {r3, r4, r5}
	bx lr
	.balign 4, 0
_02221CB0: .word ov07_022363D8
	thumb_func_end ov07_02221C8C

	thumb_func_start ov07_02221CB4
ov07_02221CB4: ; 0x02221CB4
	push {r4, r5, r6, lr}
	mov r4, #0
	ldr r6, _02221CDC ; =0x0000FEFE
	add r5, r4, #0
_02221CBC:
	add r0, r4, #0
	bl ov07_02221C8C
	add r4, r4, #1
	cmp r0, r6
	beq _02221CCE
	add r5, r5, #1
	cmp r5, #0xff
	blt _02221CBC
_02221CCE:
	cmp r5, #0xff
	blt _02221CD6
	mov r0, #0
	pop {r4, r5, r6, pc}
_02221CD6:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	nop
_02221CDC: .word 0x0000FEFE
	thumb_func_end ov07_02221CB4

	thumb_func_start ov07_02221CE0
ov07_02221CE0: ; 0x02221CE0
	ldr r3, _02221CE8 ; =ov07_0221F9A8
	ldr r0, [r0]
	mov r2, #4
	bx r3
	.balign 4, 0
_02221CE8: .word ov07_0221F9A8
	thumb_func_end ov07_02221CE0

	thumb_func_start ov07_02221CEC
ov07_02221CEC: ; 0x02221CEC
	push {r3, lr}
	sub sp, #8
	add r2, sp, #0
	mov r0, #0
	strh r0, [r2]
	strh r0, [r2, #2]
	strh r0, [r2, #4]
	strh r0, [r2, #6]
	ldr r0, [r1, #4]
	bl sub_02015524
	add r1, r0, #0
	add r0, sp, #0
	bl GF_Camera_SetAngle
	mov r0, #1
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov07_02221CEC

	thumb_func_start ov07_02221D10
ov07_02221D10: ; 0x02221D10
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	ldr r1, _02221D48 ; =ov07_02236414
	add r0, sp, #0
	ldrh r2, [r1, #0x20]
	strh r2, [r0]
	ldrh r2, [r1, #0x22]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x24]
	ldrh r1, [r1, #0x26]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldr r0, [r4, #4]
	bl sub_02015524
	add r5, r0, #0
	ldr r0, [r4, #4]
	mov r1, #1
	bl sub_02015528
	add r0, sp, #0
	add r1, r5, #0
	bl GF_Camera_SetAngle
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02221D48: .word ov07_02236414
	thumb_func_end ov07_02221D10

	thumb_func_start ov07_02221D4C
ov07_02221D4C: ; 0x02221D4C
	push {r4, lr}
	sub sp, #0x18
	add r4, r1, #0
	add r1, sp, #0
	mov r0, #0
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	add r0, r4, #0
	add r1, sp, #8
	bl ov07_02221CE0
	ldr r1, [sp, #0xc]
	add r0, sp, #0
	strh r1, [r0]
	ldr r1, [sp, #0x10]
	strh r1, [r0, #2]
	ldr r1, [sp, #0x14]
	strh r1, [r0, #4]
	ldr r0, [r4, #4]
	bl sub_02015524
	add r1, r0, #0
	add r0, sp, #0
	bl GF_Camera_SetAngle
	mov r0, #1
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov07_02221D4C

	thumb_func_start ov07_02221D88
ov07_02221D88: ; 0x02221D88
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	ldr r1, _02221DC0 ; =ov07_02236414
	add r0, sp, #0
	ldrh r2, [r1, #0x18]
	strh r2, [r0]
	ldrh r2, [r1, #0x1a]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x1c]
	ldrh r1, [r1, #0x1e]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldr r0, [r4, #4]
	bl sub_02015524
	add r5, r0, #0
	ldr r0, [r4, #4]
	mov r1, #1
	bl sub_02015528
	add r0, sp, #0
	add r1, r5, #0
	bl GF_Camera_SetAngle
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02221DC0: .word ov07_02236414
	thumb_func_end ov07_02221D88

	thumb_func_start ov07_02221DC4
ov07_02221DC4: ; 0x02221DC4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	ldr r1, _02221E20 ; =ov07_02236414
	add r0, sp, #0
	ldrh r2, [r1, #0x10]
	strh r2, [r0, #8]
	ldrh r2, [r1, #0x12]
	strh r2, [r0, #0xa]
	ldrh r2, [r1, #0x14]
	strh r2, [r0, #0xc]
	ldrh r2, [r1, #0x16]
	strh r2, [r0, #0xe]
	ldrh r2, [r1, #0x28]
	strh r2, [r0]
	ldrh r2, [r1, #0x2a]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0x2c]
	strh r2, [r0, #4]
	ldrh r1, [r1, #0x2e]
	strh r1, [r0, #6]
	ldr r0, [r4, #4]
	bl sub_02015524
	add r5, r0, #0
	ldr r0, [r4, #4]
	mov r1, #1
	bl sub_02015528
	ldr r0, [r4]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221E12
	add r0, sp, #8
	add r1, r5, #0
	bl GF_Camera_SetAngle
	b _02221E1A
_02221E12:
	add r0, sp, #0
	add r1, r5, #0
	bl GF_Camera_SetAngle
_02221E1A:
	mov r0, #1
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02221E20: .word ov07_02236414
	thumb_func_end ov07_02221DC4

	thumb_func_start ov07_02221E24
ov07_02221E24: ; 0x02221E24
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	ldr r1, _02221E5C ; =ov07_02236414
	add r0, sp, #0
	ldrh r2, [r1]
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r2, [r1, #4]
	ldrh r1, [r1, #6]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldr r0, [r4, #4]
	bl sub_02015524
	add r5, r0, #0
	ldr r0, [r4, #4]
	mov r1, #1
	bl sub_02015528
	add r0, sp, #0
	add r1, r5, #0
	bl GF_Camera_SetAngle
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02221E5C: .word ov07_02236414
	thumb_func_end ov07_02221E24

	thumb_func_start ov07_02221E60
ov07_02221E60: ; 0x02221E60
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	ldr r1, _02221E98 ; =ov07_02236414
	add r0, sp, #0
	ldrh r2, [r1, #8]
	strh r2, [r0]
	ldrh r2, [r1, #0xa]
	strh r2, [r0, #2]
	ldrh r2, [r1, #0xc]
	ldrh r1, [r1, #0xe]
	strh r2, [r0, #4]
	strh r1, [r0, #6]
	ldr r0, [r4, #4]
	bl sub_02015524
	add r5, r0, #0
	ldr r0, [r4, #4]
	mov r1, #1
	bl sub_02015528
	add r0, sp, #0
	add r1, r5, #0
	bl GF_Camera_SetAngle
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02221E98: .word ov07_02236414
	thumb_func_end ov07_02221E60

	thumb_func_start ov07_02221E9C
ov07_02221E9C: ; 0x02221E9C
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r0, [r5, #4]
	bl sub_02015524
	add r4, r0, #0
	ldr r0, [r5]
	ldr r1, [r5, #0x24]
	add r2, sp, #0
	bl ov07_02231D70
	add r0, sp, #0
	add r1, r4, #0
	bl sub_0202365C
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02221E9C

	thumb_func_start ov07_02221EC4
ov07_02221EC4: ; 0x02221EC4
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	ldr r0, [r5, #4]
	bl sub_02015524
	add r4, r0, #0
	ldr r0, [r5]
	ldr r1, [r5, #0x28]
	add r2, sp, #0
	bl ov07_02231D70
	add r0, sp, #0
	add r1, r4, #0
	bl sub_0202365C
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02221EC4

	thumb_func_start ov07_02221EEC
ov07_02221EEC: ; 0x02221EEC
	push {r3, lr}
	add r3, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	ldr r2, _02221F00 ; =ov07_02236444
	lsl r3, r3, #2
	ldr r2, [r2, r3]
	blx r2
	pop {r3, pc}
	nop
_02221F00: .word ov07_02236444
	thumb_func_end ov07_02221EEC

	thumb_func_start ov07_02221F04
ov07_02221F04: ; 0x02221F04
	push {r3, r4, r5, r6}
	cmp r2, #0
	beq _02221F1A
	mov r4, #0x18
	add r6, r0, #0
	mul r6, r4
	ldr r4, _02221F30 ; =ov07_02236468
	lsl r5, r1, #2
	add r4, r4, r6
	ldrsh r4, [r5, r4]
	strh r4, [r2]
_02221F1A:
	cmp r3, #0
	beq _02221F2C
	mov r2, #0x18
	mul r2, r0
	ldr r0, _02221F34 ; =ov07_0223646A
	lsl r1, r1, #2
	add r0, r0, r2
	ldrsh r0, [r1, r0]
	strh r0, [r3]
_02221F2C:
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_02221F30: .word ov07_02236468
_02221F34: .word ov07_0223646A
	thumb_func_end ov07_02221F04

	thumb_func_start ov07_02221F38
ov07_02221F38: ; 0x02221F38
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221F58
	mov r0, #0
	add r1, r5, #2
	add r2, r4, #0
	add r3, r6, #0
	bl ov07_02221F04
	pop {r3, r4, r5, r6, r7, pc}
_02221F58:
	add r0, r7, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02221F70
	mov r0, #1
	sub r1, r5, #2
	add r2, r4, #0
	add r3, r6, #0
	bl ov07_02221F04
	pop {r3, r4, r5, r6, r7, pc}
_02221F70:
	mov r0, #0
	add r1, r5, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ov07_02221F04
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_02221F38

	thumb_func_start ov07_02221F80
ov07_02221F80: ; 0x02221F80
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r2, #0
	bl ov07_02231924
	add r4, r0, #0
	add r0, r7, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02221F9A
	mov r5, #1
	b _02221F9C
_02221F9A:
	mov r5, #0
_02221F9C:
	add r0, r7, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02221FA8
	add r4, r4, #2
_02221FA8:
	cmp r6, #3
	bhi _02221FE0
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02221FB8: ; jump table
	.short _02221FC0 - _02221FB8 - 2 ; case 0
	.short _02221FD0 - _02221FB8 - 2 ; case 1
	.short _02221FC0 - _02221FB8 - 2 ; case 2
	.short _02221FD0 - _02221FB8 - 2 ; case 3
_02221FC0:
	mov r0, #0x18
	add r2, r5, #0
	mul r2, r0
	ldr r0, _02221FE8 ; =ov07_02236468
	lsl r1, r4, #2
	add r0, r0, r2
	ldrsh r0, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02221FD0:
	mov r0, #0x18
	add r2, r5, #0
	mul r2, r0
	ldr r0, _02221FEC ; =ov07_0223646A
	lsl r1, r4, #2
	add r0, r0, r2
	ldrsh r0, [r1, r0]
	pop {r3, r4, r5, r6, r7, pc}
_02221FE0:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02221FE8: .word ov07_02236468
_02221FEC: .word ov07_0223646A
	thumb_func_end ov07_02221F80

	thumb_func_start ov07_02221FF0
ov07_02221FF0: ; 0x02221FF0
	push {r3, lr}
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	pop {r3, pc}
	thumb_func_end ov07_02221FF0

	thumb_func_start ov07_02222004
ov07_02222004: ; 0x02222004
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r5, #1
	bl ov07_0223192C
	add r4, r0, #0
	add r0, r6, #0
	bl ov07_0221BFC0
	cmp r0, #0
	beq _02222022
	cmp r4, #3
	bne _02222028
	sub r5, r5, #2
	b _02222028
_02222022:
	cmp r4, #4
	bne _02222028
	sub r5, r5, #2
_02222028:
	add r0, r5, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_02222004

	thumb_func_start ov07_0222202C
ov07_0222202C: ; 0x0222202C
	push {r4, lr}
	mov r4, #1
	bl ov07_0223192C
	cmp r0, #4
	bne _0222203A
	sub r4, r4, #2
_0222203A:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0222202C

	thumb_func_start ov07_02222040
ov07_02222040: ; 0x02222040
	ldr r3, _02222048 ; =FX_Div
	sub r0, r1, r0
	lsl r1, r2, #0xc
	bx r3
	.balign 4, 0
_02222048: .word FX_Div
	thumb_func_end ov07_02222040

	thumb_func_start ov07_0222204C
ov07_0222204C: ; 0x0222204C
	push {r3, lr}
	sub r0, r1, r0
	add r1, r2, #0
	bl FX_Div
	add r1, sp, #0
	str r0, [sp]
	bl FX_Modf
	cmp r0, #0
	beq _0222206C
	mov r0, #1
	ldr r1, [sp]
	lsl r0, r0, #0xc
	add r0, r1, r0
	str r0, [sp]
_0222206C:
	ldr r0, [sp]
	cmp r0, #0
	bge _02222074
	neg r0, r0
_02222074:
	str r0, [sp]
	asr r0, r0, #0xc
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_0222204C

	thumb_func_start ov07_0222207C
ov07_0222207C: ; 0x0222207C
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	mov r1, #0
	ldrsh r1, [r4, r1]
	add r1, r2, r1
	mov r2, #2
	ldrsh r2, [r4, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	pop {r4, pc}
	thumb_func_end ov07_0222207C

	thumb_func_start ov07_0222209C
ov07_0222209C: ; 0x0222209C
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	add r1, sp, #4
	add r2, sp, #0
	bl ov07_02222644
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r4, #0
	bl sub_0200E024
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_0222209C

	thumb_func_start ov07_022220B8
ov07_022220B8: ; 0x022220B8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	add r6, r3, #0
	ldrsh r3, [r5, r1]
	add r0, r4, #0
	add r2, r2, r3
	bl sub_020087A4
	mov r2, #2
	ldrsh r2, [r5, r2]
	add r0, r4, #0
	mov r1, #1
	add r2, r6, r2
	bl sub_020087A4
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_022220B8

	thumb_func_start ov07_022220DC
ov07_022220DC: ; 0x022220DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r2, #0
	add r4, r1, #0
	ldrsh r2, [r5, r2]
	add r0, r4, #0
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #2
	ldrsh r2, [r5, r2]
	add r0, r4, #0
	mov r1, #0xd
	bl sub_020087A4
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022220DC

	thumb_func_start ov07_022220FC
ov07_022220FC: ; 0x022220FC
	push {r3, r4, r5, lr}
	add r4, r3, #0
	add r5, r0, #0
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x14]
	str r3, [r5, #4]
	str r1, [r5, #8]
	str r0, [r5, #0xc]
	ldr r0, [sp, #0x18]
	str r4, [r5, #0x10]
	str r0, [r5, #0x14]
	sub r0, r2, r1
	add r1, r3, #0
	bl _s32_div_f
	str r0, [r5, #0x18]
	add r0, sp, #0
	ldrh r0, [r0, #0x10]
	ldr r1, [sp, #0x1c]
	sub r0, r0, r4
	bl _s32_div_f
	str r0, [r5, #0x1c]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022220FC

	thumb_func_start ov07_0222212C
ov07_0222212C: ; 0x0222212C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	str r3, [sp]
	cmp r5, #0
	bne _0222213E
	bl GF_AssertFail
_0222213E:
	cmp r4, r7
	bls _0222214A
	add r0, sp, #8
	ldrh r1, [r0, #0x1c]
	neg r1, r1
	strh r1, [r0, #0x1c]
_0222214A:
	add r1, sp, #8
	mov r0, #0x1c
	ldrsh r6, [r1, r0]
	lsl r0, r4, #0xc
	lsl r1, r7, #0xc
	lsl r2, r6, #0xc
	bl ov07_0222204C
	str r0, [r5, #4]
	ldr r0, [sp, #0x1c]
	str r4, [r5, #8]
	str r0, [r5, #0xc]
	ldr r0, [sp]
	str r0, [r5, #0x10]
	ldr r0, [sp, #0x20]
	str r0, [r5, #0x14]
	str r6, [r5, #0x18]
	add r0, sp, #8
	ldrh r1, [r0, #0x10]
	ldr r0, [sp]
	sub r0, r1, r0
	ldr r1, [r5, #4]
	bl _s32_div_f
	str r0, [r5, #0x1c]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0222212C

	thumb_func_start ov07_02222180
ov07_02222180: ; 0x02222180
	push {r4, lr}
	add r4, r0, #0
	bne _0222218A
	bl GF_AssertFail
_0222218A:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222220E
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x18]
	add r0, r1, r0
	str r0, [r4, #8]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #0x1c]
	add r0, r1, r0
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [r4, #8]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [r4, #0x10]
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	ldr r2, [r4, #0xc]
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _02222214 ; =FX_SinCosTable_
	asr r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	asr r0, r1, #0xc
	strh r0, [r4]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x14]
	asr r0, r0, #4
	lsl r0, r0, #1
	add r0, r0, #1
	lsl r1, r0, #1
	ldr r0, _02222214 ; =FX_SinCosTable_
	asr r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	asr r0, r1, #0xc
	strh r0, [r4, #2]
	mov r0, #1
	pop {r4, pc}
_0222220E:
	mov r0, #0
	pop {r4, pc}
	nop
_02222214: .word FX_SinCosTable_
	thumb_func_end ov07_02222180

	thumb_func_start ov07_02222218
ov07_02222218: ; 0x02222218
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov07_02222180
	cmp r0, #0
	beq _0222223A
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ov07_0222207C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222223A:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_02222218

	thumb_func_start ov07_02222240
ov07_02222240: ; 0x02222240
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov07_02222180
	cmp r0, #0
	beq _02222262
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ov07_022220B8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02222262:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_02222240

	thumb_func_start ov07_02222268
ov07_02222268: ; 0x02222268
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r3, #0
	str r2, [sp]
	cmp r5, #0
	bne _0222227C
	bl GF_AssertFail
_0222227C:
	strh r4, [r5]
	strh r6, [r5, #2]
	add r0, sp, #0x10
	ldrh r7, [r0, #0x14]
	lsl r0, r4, #0xc
	str r0, [sp, #4]
	str r7, [r5, #4]
	ldr r1, [sp]
	add r2, r7, #0
	lsl r1, r1, #0xc
	bl ov07_02222040
	str r0, [r5, #8]
	lsl r4, r6, #0xc
	add r2, sp, #0x10
	mov r1, #0x10
	ldrsh r1, [r2, r1]
	add r0, r4, #0
	add r2, r7, #0
	lsl r1, r1, #0xc
	bl ov07_02222040
	str r0, [r5, #0xc]
	ldr r0, [sp, #4]
	str r0, [r5, #0x10]
	str r4, [r5, #0x14]
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02222268

	thumb_func_start ov07_022222B4
ov07_022222B4: ; 0x022222B4
	push {r4, lr}
	add r4, r0, #0
	bne _022222BE
	bl GF_AssertFail
_022222BE:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022222EA
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #8]
	add r0, r1, r0
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0xc]
	add r0, r1, r0
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	asr r0, r0, #0xc
	strh r0, [r4]
	ldr r0, [r4, #0x14]
	asr r0, r0, #0xc
	strh r0, [r4, #2]
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	mov r0, #1
	pop {r4, pc}
_022222EA:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_022222B4

	thumb_func_start ov07_022222F0
ov07_022222F0: ; 0x022222F0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov07_022222B4
	cmp r0, #0
	beq _0222230E
	mov r2, #0
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov07_0222207C
	mov r0, #1
	pop {r3, r4, r5, pc}
_0222230E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_022222F0

	thumb_func_start ov07_02222314
ov07_02222314: ; 0x02222314
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov07_022222B4
	cmp r0, #0
	beq _02222332
	mov r2, #0
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov07_022220B8
	mov r0, #1
	pop {r3, r4, r5, pc}
_02222332:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02222314

	thumb_func_start ov07_02222338
ov07_02222338: ; 0x02222338
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r5, r1, #0
	add r4, sp, #0x10
	mov r1, #0x14
	ldrsh r1, [r4, r1]
	str r1, [sp]
	ldrh r1, [r4, #0x18]
	str r1, [sp, #4]
	add r1, r2, #0
	add r2, r3, #0
	mov r3, #0x10
	ldrsh r3, [r4, r3]
	bl ov07_02222268
	mov r1, #0
	strh r1, [r5]
	ldr r0, _0222237C ; =0x0000BFFF
	strh r1, [r5, #2]
	str r0, [sp]
	ldr r0, [sp, #0x2c]
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	ldrh r0, [r0, #0x18]
	ldr r3, _02222380 ; =0x00003FFF
	add r2, r1, #0
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl ov07_022220FC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_0222237C: .word 0x0000BFFF
_02222380: .word 0x00003FFF
	thumb_func_end ov07_02222338

	thumb_func_start ov07_02222384
ov07_02222384: ; 0x02222384
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02222392
	bl GF_AssertFail
_02222392:
	cmp r4, #0
	bne _0222239A
	bl GF_AssertFail
_0222239A:
	add r0, r5, #0
	bl ov07_022222B4
	add r6, r0, #0
	add r0, r4, #0
	bl ov07_02222180
	mov r2, #0
	ldrsh r3, [r5, r2]
	ldrsh r1, [r4, r2]
	add r1, r3, r1
	strh r1, [r5]
	mov r1, #2
	ldrsh r3, [r5, r1]
	ldrsh r1, [r4, r1]
	add r1, r3, r1
	strh r1, [r5, #2]
	cmp r6, r0
	bne _022223C8
	cmp r6, #0
	bne _022223C8
	add r0, r2, #0
	pop {r4, r5, r6, pc}
_022223C8:
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_02222384

	thumb_func_start ov07_022223CC
ov07_022223CC: ; 0x022223CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl ov07_02222384
	cmp r0, #0
	beq _022223EA
	mov r2, #0
	add r0, r5, #0
	add r1, r4, #0
	add r3, r2, #0
	bl ov07_0222207C
	mov r0, #1
	pop {r3, r4, r5, pc}
_022223EA:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_022223CC

	thumb_func_start ov07_022223F0
ov07_022223F0: ; 0x022223F0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	cmp r5, #0
	bne _02222402
	bl GF_AssertFail
_02222402:
	str r6, [r5]
	lsl r0, r6, #0xc
	lsl r1, r7, #0xc
	add r2, r4, #0
	str r4, [r5, #4]
	bl ov07_02222040
	asr r0, r0, #0xc
	str r0, [r5, #8]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_022223F0

	thumb_func_start ov07_02222418
ov07_02222418: ; 0x02222418
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	cmp r5, #0
	bne _0222242A
	bl GF_AssertFail
_0222242A:
	str r6, [r5]
	lsl r6, r6, #0xc
	add r0, r6, #0
	lsl r1, r7, #0xc
	add r2, r4, #0
	str r4, [r5, #4]
	bl ov07_02222040
	str r0, [r5, #8]
	str r6, [r5, #0xc]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02222418

	thumb_func_start ov07_02222440
ov07_02222440: ; 0x02222440
	push {r4, lr}
	add r4, r0, #0
	bne _0222244A
	bl GF_AssertFail
_0222244A:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02222462
	ldr r1, [r4]
	ldr r0, [r4, #8]
	add r0, r1, r0
	str r0, [r4]
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	mov r0, #1
	pop {r4, pc}
_02222462:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02222440

	thumb_func_start ov07_02222468
ov07_02222468: ; 0x02222468
	push {r4, lr}
	add r4, r0, #0
	bne _02222472
	bl GF_AssertFail
_02222472:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222248E
	ldr r1, [r4, #0xc]
	ldr r0, [r4, #8]
	add r0, r1, r0
	str r0, [r4, #0xc]
	asr r0, r0, #0xc
	str r0, [r4]
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	mov r0, #1
	pop {r4, pc}
_0222248E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02222468

	thumb_func_start ov07_02222494
ov07_02222494: ; 0x02222494
	push {r3, r4, r5, lr}
	ldr r4, [sp, #0x10]
	add r5, r0, #0
	str r4, [r5, #4]
	str r1, [r5, #8]
	sub r0, r2, r1
	add r1, r4, #0
	str r3, [r5, #0xc]
	bl _u32_div_f
	str r0, [r5, #0x10]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02222494

	thumb_func_start ov07_022224AC
ov07_022224AC: ; 0x022224AC
	push {r4, lr}
	add r4, r0, #0
	bne _022224B6
	bl GF_AssertFail
_022224B6:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _022224FE
	ldr r1, [r4, #8]
	ldr r0, [r4, #0x10]
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	sub r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	ldr r2, [r4, #0xc]
	asr r0, r0, #4
	lsl r0, r0, #1
	add r0, r0, #1
	lsl r1, r0, #1
	ldr r0, _02222504 ; =FX_SinCosTable_
	asr r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	asr r0, r1, #0xc
	str r0, [r4]
	mov r0, #1
	pop {r4, pc}
_022224FE:
	mov r0, #0
	pop {r4, pc}
	nop
_02222504: .word FX_SinCosTable_
	thumb_func_end ov07_022224AC

	thumb_func_start ov07_02222508
ov07_02222508: ; 0x02222508
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r4, #0
	bne _0222251A
	bl GF_AssertFail
_0222251A:
	ldr r0, [sp, #0x18]
	add r1, r6, #0
	str r0, [r4, #4]
	lsl r0, r5, #8
	bl _s32_div_f
	add r5, r0, #0
	lsl r0, r7, #8
	add r1, r6, #0
	bl _s32_div_f
	add r1, r0, #0
	ldr r2, [sp, #0x18]
	lsl r0, r5, #0xc
	lsl r1, r1, #0xc
	bl ov07_02222040
	str r0, [r4, #8]
	lsl r0, r5, #0x10
	asr r0, r0, #0x10
	strh r0, [r4]
	strh r0, [r4, #2]
	mov r0, #0
	ldrsh r0, [r4, r0]
	lsl r0, r0, #0xc
	str r0, [r4, #0x10]
	mov r0, #2
	ldrsh r0, [r4, r0]
	lsl r0, r0, #0xc
	str r0, [r4, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02222508

	thumb_func_start ov07_02222558
ov07_02222558: ; 0x02222558
	push {r4, lr}
	add r4, r0, #0
	bne _02222562
	bl GF_AssertFail
_02222562:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222258C
	sub r0, r0, #1
	str r0, [r4, #4]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #8]
	add r0, r1, r0
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #8]
	add r0, r1, r0
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	asr r0, r0, #0xc
	strh r0, [r4]
	ldr r0, [r4, #0x14]
	asr r0, r0, #0xc
	strh r0, [r4, #2]
	mov r0, #1
	pop {r4, pc}
_0222258C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov07_02222558

	thumb_func_start ov07_02222590
ov07_02222590: ; 0x02222590
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	cmp r5, #0
	bne _022225A2
	bl GF_AssertFail
_022225A2:
	ldr r0, [sp, #0x20]
	add r1, sp, #8
	str r0, [r5, #4]
	mov r0, #0x14
	ldrsh r4, [r1, r0]
	lsl r0, r6, #8
	add r1, r4, #0
	bl _s32_div_f
	add r6, r0, #0
	lsl r0, r7, #8
	add r1, r4, #0
	bl _s32_div_f
	add r1, r0, #0
	ldr r2, [sp, #0x20]
	lsl r0, r6, #0xc
	lsl r1, r1, #0xc
	bl ov07_02222040
	str r0, [r5, #8]
	ldr r0, [sp]
	add r1, r4, #0
	lsl r0, r0, #8
	bl _s32_div_f
	add r7, r0, #0
	add r1, sp, #8
	mov r0, #0x10
	ldrsh r0, [r1, r0]
	add r1, r4, #0
	lsl r0, r0, #8
	bl _s32_div_f
	add r1, r0, #0
	ldr r2, [sp, #0x20]
	lsl r0, r7, #0xc
	lsl r1, r1, #0xc
	bl ov07_02222040
	str r0, [r5, #0xc]
	strh r6, [r5]
	strh r7, [r5, #2]
	mov r0, #0
	ldrsh r0, [r5, r0]
	lsl r0, r0, #0xc
	str r0, [r5, #0x10]
	mov r0, #2
	ldrsh r0, [r5, r0]
	lsl r0, r0, #0xc
	str r0, [r5, #0x14]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_02222590

	thumb_func_start ov07_0222260C
ov07_0222260C: ; 0x0222260C
	push {r4, lr}
	add r4, r0, #0
	bne _02222616
	bl GF_AssertFail
_02222616:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02222640
	sub r0, r0, #1
	str r0, [r4, #4]
	ldr r1, [r4, #0x10]
	ldr r0, [r4, #8]
	add r0, r1, r0
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	ldr r0, [r4, #0xc]
	add r0, r1, r0
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	asr r0, r0, #0xc
	strh r0, [r4]
	ldr r0, [r4, #0x14]
	asr r0, r0, #0xc
	strh r0, [r4, #2]
	mov r0, #1
	pop {r4, pc}
_02222640:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov07_0222260C

	thumb_func_start ov07_02222644
ov07_02222644: ; 0x02222644
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0
	ldrsh r0, [r5, r0]
	add r4, r1, #0
	add r6, r2, #0
	bl _fflt
	ldr r1, _02222670 ; =0x43800000
	bl _fdiv
	str r0, [r4]
	mov r0, #2
	ldrsh r0, [r5, r0]
	bl _fflt
	ldr r1, _02222670 ; =0x43800000
	bl _fdiv
	str r0, [r6]
	pop {r4, r5, r6, pc}
	nop
_02222670: .word 0x43800000
	thumb_func_end ov07_02222644

	thumb_func_start ov07_02222674
ov07_02222674: ; 0x02222674
	push {r3, r4, lr}
	sub sp, #4
	lsl r1, r1, #1
	mov r0, #0x50
	sub r0, r0, r1
	lsl r4, r0, #0xc
	asr r1, r4, #0x1f
	add r0, r4, #0
	asr r3, r2, #0x1f
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r0, r0, r2
	adc r1, r3
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	lsl r1, r2, #9
	bl FX_Div
	sub r0, r4, r0
	add r1, sp, #0
	bl FX_Modf
	cmp r0, #0
	beq _022226B2
	mov r1, #2
	lsl r1, r1, #0xa
	add r0, r0, r1
_022226B2:
	ldr r1, [sp]
	add r0, r1, r0
	asr r1, r0, #0xc
	lsr r0, r1, #0x1f
	add r0, r1, r0
	lsl r0, r0, #0xf
	asr r0, r0, #0x10
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02222674

	thumb_func_start ov07_022226C4
ov07_022226C4: ; 0x022226C4
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	add r2, r3, #0
	bl ov07_02222674
	add r2, r0, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _022226EE
	mov r0, #0
	mvn r0, r0
	mul r0, r2
	lsl r0, r0, #0x10
	asr r2, r0, #0x10
	sub r0, r4, r6
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
_022226EE:
	add r0, r5, #0
	mov r1, #1
	add r2, r4, r2
	bl sub_020087A4
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_022226C4

	thumb_func_start ov07_022226FC
ov07_022226FC: ; 0x022226FC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r2, #0
	add r5, r1, #0
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	add r2, r3, #0
	bl ov07_02222674
	add r4, r0, #0
	ldr r0, [sp, #0x18]
	cmp r0, #1
	bne _02222726
	mov r0, #0
	mvn r0, r0
	mul r0, r4
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	sub r0, r5, r7
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
_02222726:
	add r1, sp, #0
	add r0, r6, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r2, sp, #0
	mov r1, #2
	ldrsh r1, [r2, r1]
	add r2, r5, r4
	lsl r2, r2, #0x10
	add r0, r6, #0
	asr r2, r2, #0x10
	bl sub_0200DDB8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_022226FC

	thumb_func_start ov07_02222748
ov07_02222748: ; 0x02222748
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov07_02222558
	cmp r0, #0
	beq _02222762
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_0222209C
	mov r0, #1
	pop {r3, r4, r5, pc}
_02222762:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02222748

	thumb_func_start ov07_02222768
ov07_02222768: ; 0x02222768
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov07_02222558
	cmp r0, #0
	beq _02222782
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_022220DC
	mov r0, #1
	pop {r3, r4, r5, pc}
_02222782:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02222768

	thumb_func_start ov07_02222788
ov07_02222788: ; 0x02222788
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov07_0222260C
	cmp r0, #0
	beq _022227A2
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_022220DC
	mov r0, #1
	pop {r3, r4, r5, pc}
_022227A2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02222788

	thumb_func_start ov07_022227A8
ov07_022227A8: ; 0x022227A8
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	add r4, r2, #0
	add r7, r3, #0
	cmp r5, #0
	bne _022227BA
	bl GF_AssertFail
_022227BA:
	str r7, [r5, #4]
	ldr r0, [sp, #0x18]
	str r7, [r5, #8]
	str r0, [r5, #0xc]
	mov r1, #0
	str r1, [r5, #0x10]
	str r6, [r5, #0x14]
	str r4, [r5, #0x18]
	neg r0, r6
	str r0, [r5, #0x1c]
	neg r0, r4
	str r0, [r5, #0x20]
	strh r1, [r5]
	strh r1, [r5, #2]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_022227A8

	thumb_func_start ov07_022227D8
ov07_022227D8: ; 0x022227D8
	push {r4, lr}
	add r4, r0, #0
	bne _022227E2
	bl GF_AssertFail
_022227E2:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02222836
	ldr r0, [r4, #4]
	add r1, r0, #1
	str r1, [r4, #4]
	ldr r0, [r4, #8]
	cmp r1, r0
	blt _02222832
	mov r2, #0
	str r2, [r4, #4]
	ldrsh r0, [r4, r2]
	ldr r1, [r4, #0x1c]
	str r0, [r4, #0x1c]
	cmp r1, #0
	bne _02222806
	strh r2, [r4]
	b _0222280A
_02222806:
	neg r0, r1
	strh r0, [r4]
_0222280A:
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x20]
	str r0, [r4, #0x20]
	cmp r1, #0
	bne _0222281A
	mov r0, #0
	b _0222281C
_0222281A:
	neg r0, r1
_0222281C:
	strh r0, [r4, #2]
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	cmp r0, #4
	blt _02222832
	mov r0, #0
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	sub r0, r0, #1
	str r0, [r4, #0xc]
_02222832:
	mov r0, #1
	pop {r4, pc}
_02222836:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_022227D8

	thumb_func_start ov07_0222283C
ov07_0222283C: ; 0x0222283C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov07_022227D8
	cmp r0, #0
	beq _0222285E
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	add r3, r6, #0
	bl ov07_022220B8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0222285E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0222283C

	thumb_func_start ov07_02222864
ov07_02222864: ; 0x02222864
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	str r1, [sp]
	strh r3, [r7]
	add r0, sp, #8
	mov r1, #0x10
	ldrsh r1, [r0, r1]
	mov r6, #0
	strh r1, [r7, #2]
	add r1, r7, #0
	add r1, #0x94
	str r2, [r1]
	add r1, r7, #0
	ldrh r2, [r0, #0x14]
	add r1, #0xa8
	strh r2, [r1]
	add r1, r7, #0
	add r1, #0xaa
	strh r6, [r1]
	ldrb r1, [r0, #0x18]
	add r2, r7, #0
	add r2, #0xac
	mov ip, r1
	strb r1, [r2]
	add r1, r7, #0
	add r1, #0xad
	strb r6, [r1]
	ldrb r1, [r0, #0x1c]
	add r0, r7, #0
	add r0, #0xae
	strb r1, [r0]
	mov r0, ip
	cmp r0, #0
	ble _022228C6
	add r5, r7, #0
_022228AA:
	ldr r4, [sp]
	add r3, r5, #4
	mov r2, #4
_022228B0:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _022228B0
	ldr r0, [r4]
	add r6, r6, #1
	str r0, [r3]
	mov r0, ip
	add r5, #0x24
	cmp r6, r0
	blt _022228AA
_022228C6:
	add r0, r7, #0
	ldr r1, [sp, #0x28]
	add r0, #0x98
	str r1, [r0]
	add r0, r7, #0
	ldr r1, [sp, #0x2c]
	add r0, #0x9c
	str r1, [r0]
	add r0, r7, #0
	ldr r1, [sp, #0x30]
	add r0, #0xa0
	str r1, [r0]
	add r0, r7, #0
	ldr r1, [sp, #0x34]
	add r0, #0xa4
	str r1, [r0]
	add r0, r7, #0
	add r0, #0xac
	ldrb r0, [r0]
	mov r5, #0
	cmp r0, #0
	ble _02222910
	add r4, r7, #0
	add r6, r5, #0
_022228F6:
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	add r1, r6, #0
	bl sub_0200DCE8
	add r0, r7, #0
	add r0, #0xac
	ldrb r0, [r0]
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, r0
	blt _022228F6
_02222910:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_02222864

	thumb_func_start ov07_02222914
ov07_02222914: ; 0x02222914
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	mov r0, #0
	add r2, sp, #0x10
	mov r1, #1
_02222920:
	add r0, r0, #1
	stmia r2!, {r1}
	cmp r0, #4
	blt _02222920
	add r0, r5, #0
	add r0, #0xa8
	ldrh r2, [r0]
	add r0, r5, #0
	add r0, #0xaa
	ldrh r0, [r0]
	cmp r2, r0
	bhi _02222960
	add r0, r5, #0
	add r0, #0xad
	ldrb r0, [r0]
	lsl r0, r0, #2
	add r0, r5, r0
	add r0, #0x98
	ldr r0, [r0]
	bl sub_0200DCE8
	add r0, r5, #0
	add r0, #0xad
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xad
	strb r1, [r0]
	add r0, r5, #0
	mov r1, #0
	add r0, #0xaa
	strh r1, [r0]
_02222960:
	add r0, r5, #0
	add r0, #0xad
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0xac
	ldrb r0, [r0]
	cmp r1, r0
	bhs _0222297E
	add r0, r5, #0
	add r0, #0xaa
	ldrh r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0xaa
	strh r1, [r0]
_0222297E:
	mov r0, #0
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xad
	ldrb r0, [r0]
	cmp r0, #0
	ble _02222A1E
	add r0, sp, #0x10
	add r7, r5, #4
	str r0, [sp, #4]
	add r6, r5, #0
	add r4, r5, #0
_02222996:
	add r1, r5, #0
	add r1, #0x94
	ldr r1, [r1]
	add r0, r7, #0
	blx r1
	ldr r1, [sp, #4]
	cmp r0, #0
	str r0, [r1]
	beq _022229F4
	add r0, r5, #0
	add r0, #0xae
	ldrb r0, [r0]
	cmp r0, #0
	bne _022229DA
	mov r1, #0
	mov r2, #4
	ldrsh r1, [r5, r1]
	ldrsh r2, [r6, r2]
	add r0, r4, #0
	add r0, #0x98
	add r1, r1, r2
	mov r2, #2
	ldrsh r3, [r5, r2]
	mov r2, #6
	ldrsh r2, [r6, r2]
	lsl r1, r1, #0x10
	ldr r0, [r0]
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	b _02222A00
_022229DA:
	add r0, r7, #0
	add r1, sp, #0xc
	add r2, sp, #8
	bl ov07_02222644
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	bl sub_0200E024
	b _02222A00
_022229F4:
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	mov r1, #0
	bl sub_0200DCE8
_02222A00:
	ldr r0, [sp, #4]
	add r7, #0x24
	add r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp]
	add r6, #0x24
	add r0, r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r0, #0xad
	ldrb r1, [r0]
	ldr r0, [sp]
	add r4, r4, #4
	cmp r0, r1
	blt _02222996
_02222A1E:
	add r5, #0xac
	ldrb r2, [r5]
	mov r3, #0
	cmp r2, #0
	ble _02222A3E
	add r1, sp, #0x10
_02222A2A:
	ldr r0, [r1]
	cmp r0, #1
	bne _02222A36
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02222A36:
	add r3, r3, #1
	add r1, r1, #4
	cmp r3, r2
	blt _02222A2A
_02222A3E:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02222914

	thumb_func_start ov07_02222A44
ov07_02222A44: ; 0x02222A44
	push {r3, r4, r5, lr}
	sub sp, #0x10
	ldr r3, _02222A74 ; =0x0000FFFF
	add r4, r1, #0
	mov r1, #2
	str r3, [sp]
	lsl r1, r1, #0x10
	str r1, [sp, #4]
	ldr r1, _02222A78 ; =0xFFFF8000
	add r5, r0, #0
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	mov r1, #0
	add r2, r3, #0
	add r3, r1, #0
	bl ov07_022220FC
	ldr r0, [r5, #4]
	add r1, r0, #0
	mul r1, r4
	str r1, [r5, #4]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02222A74: .word 0x0000FFFF
_02222A78: .word 0xFFFF8000
	thumb_func_end ov07_02222A44

	thumb_func_start ov07_02222A7C
ov07_02222A7C: ; 0x02222A7C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_022222B4
	cmp r0, #0
	bne _02222A98
	mov r0, #1
	str r0, [r4, #0x24]
	add r0, r5, #0
	bl DestroySysTask
	pop {r3, r4, r5, pc}
_02222A98:
	mov r0, #0
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _02222AA2
	strh r0, [r4]
_02222AA2:
	mov r0, #2
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _02222AAE
	mov r0, #0
	strh r0, [r4, #2]
_02222AAE:
	mov r0, #0
	ldrsh r1, [r4, r0]
	mov r0, #2
	ldrsh r0, [r4, r0]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02222AC0 ; =0x04000052
	strh r1, [r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02222AC0: .word 0x04000052
	thumb_func_end ov07_02222A7C

	thumb_func_start ov07_02222AC4
ov07_02222AC4: ; 0x02222AC4
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, sp, #8
	mov r5, #0x10
	ldrsh r5, [r6, r5]
	add r4, r0, #0
	str r5, [sp]
	ldr r5, [sp, #0x1c]
	lsl r5, r5, #0x10
	lsr r5, r5, #0x10
	str r5, [sp, #4]
	bl ov07_02222268
	mov r2, #0
	ldr r0, _02222AF0 ; =ov07_02222A7C
	add r1, r4, #0
	str r2, [r4, #0x24]
	bl CreateSysTask
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02222AF0: .word ov07_02222A7C
	thumb_func_end ov07_02222AC4

	thumb_func_start ov07_02222AF4
ov07_02222AF4: ; 0x02222AF4
	ldr r0, [r0, #0x24]
	bx lr
	thumb_func_end ov07_02222AF4

	thumb_func_start ov07_02222AF8
ov07_02222AF8: ; 0x02222AF8
	push {r3, lr}
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _02222B0C
	mov r0, #1
	str r0, [r1, #0xc]
	ldr r0, [r1, #0x18]
	ldr r1, [r1, #0x10]
	blx r1
	pop {r3, pc}
_02222B0C:
	bl sub_02014AA0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_02222AF8

	thumb_func_start ov07_02222B14
ov07_02222B14: ; 0x02222B14
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02222B2E
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02222B2E
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #0x14]
	blx r1
	mov r0, #0
	str r0, [r4, #0xc]
_02222B2E:
	pop {r4, pc}
	thumb_func_end ov07_02222B14

	thumb_func_start ov07_02222B30
ov07_02222B30: ; 0x02222B30
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	cmp r5, #0
	bne _02222B42
	bl GF_AssertFail
_02222B42:
	mov r0, #1
	str r0, [r5, #8]
	mov r2, #0
	str r2, [r5, #0xc]
	str r4, [r5, #0x18]
	str r6, [r5, #0x10]
	ldr r0, _02222B68 ; =ov07_02222AF8
	str r7, [r5, #0x14]
	add r1, r5, #0
	bl sub_0200E374
	str r0, [r5, #4]
	ldr r0, _02222B6C ; =ov07_02222B14
	add r1, r5, #0
	mov r2, #0
	bl sub_0200E33C
	str r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02222B68: .word ov07_02222AF8
_02222B6C: .word ov07_02222B14
	thumb_func_end ov07_02222B30

	thumb_func_start ov07_02222B70
ov07_02222B70: ; 0x02222B70
	push {r4, lr}
	add r4, r0, #0
	bne _02222B7A
	bl GF_AssertFail
_02222B7A:
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _02222B84
	bl DestroySysTask
_02222B84:
	ldr r0, [r4]
	cmp r0, #0
	beq _02222B8E
	bl DestroySysTask
_02222B8E:
	bl sub_02014AA0
	pop {r4, pc}
	thumb_func_end ov07_02222B70

	thumb_func_start ov07_02222B94
ov07_02222B94: ; 0x02222B94
	push {r4, lr}
	add r4, r0, #0
	bne _02222B9E
	bl GF_AssertFail
_02222B9E:
	mov r0, #0
	str r0, [r4, #8]
	pop {r4, pc}
	thumb_func_end ov07_02222B94

	thumb_func_start ov07_02222BA4
ov07_02222BA4: ; 0x02222BA4
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_02014A60
	add r5, r0, #0
	bl sub_02014AA0
	mov r1, #0x62
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	add r0, r5, #0
	mov r2, #4
	mov r3, #1
	bl sub_02014AB0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02222BA4

	thumb_func_start ov07_02222BC8
ov07_02222BC8: ; 0x02222BC8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_02014A8C
	add r0, r4, #0
	bl ov07_02222BA4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02222BC8

	thumb_func_start ov07_02222BDC
ov07_02222BDC: ; 0x02222BDC
	ldr r3, _02222BE0 ; =ov07_02222BA4
	bx r3
	.balign 4, 0
_02222BE0: .word ov07_02222BA4
	thumb_func_end ov07_02222BDC

	thumb_func_start ov07_02222BE4
ov07_02222BE4: ; 0x02222BE4
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r2, #0
	add r5, r0, #0
	ldr r1, _02222C54 ; =0x00000624
	add r0, r7, #0
	bl AllocFromHeap
	ldr r2, _02222C54 ; =0x00000624
	mov r1, #0
	add r4, r0, #0
	bl memset
	cmp r4, #0
	bne _02222C06
	bl GF_AssertFail
_02222C06:
	mov r2, #0x32
	add r1, r4, #0
	lsl r2, r2, #4
	add r0, r7, #0
	add r1, #0x20
	add r2, r4, r2
	bl sub_02014A08
	str r0, [r4, #0x1c]
	cmp r0, #0
	bne _02222C20
	bl GF_AssertFail
_02222C20:
	mov r0, #0x62
	lsl r0, r0, #4
	add r1, r4, #0
	mov r2, #3
	str r5, [r4, r0]
	add r0, r6, #0
	add r1, #0x20
	lsl r2, r2, #8
	bl MIi_CpuClear32
	mov r2, #0x32
	lsl r2, r2, #4
	add r1, r4, r2
	add r0, r6, #0
	sub r2, #0x20
	bl MIi_CpuClear32
	ldr r2, _02222C58 ; =ov07_02222BC8
	ldr r3, _02222C5C ; =ov07_02222BDC
	add r0, r4, #0
	add r1, r4, #0
	bl ov07_02222B30
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222C54: .word 0x00000624
_02222C58: .word ov07_02222BC8
_02222C5C: .word ov07_02222BDC
	thumb_func_end ov07_02222BE4

	thumb_func_start ov07_02222C60
ov07_02222C60: ; 0x02222C60
	push {r4, lr}
	add r4, r0, #0
	bne _02222C6A
	bl GF_AssertFail
_02222C6A:
	add r0, r4, #0
	bl ov07_02222B70
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02222C7A
	bl sub_02014A38
_02222C7A:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02222C60

	thumb_func_start ov07_02222C84
ov07_02222C84: ; 0x02222C84
	push {r4, lr}
	add r4, r0, #0
	bne _02222C8E
	bl GF_AssertFail
_02222C8E:
	ldr r0, [r4, #0x1c]
	bl sub_02014A4C
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02222C84

	thumb_func_start ov07_02222C98
ov07_02222C98: ; 0x02222C98
	push {r4, lr}
	add r4, r0, #0
	bne _02222CA2
	bl GF_AssertFail
_02222CA2:
	add r0, r4, #0
	bl ov07_02222B94
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02222C98

	thumb_func_start ov07_02222CAC
ov07_02222CAC: ; 0x02222CAC
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_02014C08
	ldr r0, [r4, #0x1c]
	bl sub_02014C40
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02222CAC

	thumb_func_start ov07_02222CC0
ov07_02222CC0: ; 0x02222CC0
	ldr r3, _02222CC8 ; =sub_02014C40
	ldr r0, [r0, #0x1c]
	bx r3
	nop
_02222CC8: .word sub_02014C40
	thumb_func_end ov07_02222CC0

	thumb_func_start ov07_02222CCC
ov07_02222CCC: ; 0x02222CCC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r7, r0, #0
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x40]
	mov r1, #0x20
	str r2, [sp, #0x18]
	add r5, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _02222CE8
	bl GF_AssertFail
_02222CE8:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x20
	bl memset
	ldr r0, [sp, #0x34]
	bl ov07_02222D90
	add r6, r0, #0
	ldr r0, [sp, #0x40]
	bl sub_02014AD8
	str r0, [r4, #0x1c]
	str r5, [sp]
	add r1, sp, #0x20
	mov r0, #0x10
	ldrsh r0, [r1, r0]
	add r1, r7, #0
	str r0, [sp, #4]
	ldr r0, [sp, #0x3c]
	str r6, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x38]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x1c]
	ldr r2, [sp, #0x14]
	ldr r3, [sp, #0x18]
	bl sub_02014B08
	ldr r2, _02222D34 ; =ov07_02222CAC
	ldr r3, _02222D38 ; =ov07_02222CC0
	add r0, r4, #0
	add r1, r4, #0
	bl ov07_02222B30
	add r0, r4, #0
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02222D34: .word ov07_02222CAC
_02222D38: .word ov07_02222CC0
	thumb_func_end ov07_02222CCC

	thumb_func_start ov07_02222D3C
ov07_02222D3C: ; 0x02222D3C
	push {r4, lr}
	add r4, r0, #0
	bne _02222D46
	bl GF_AssertFail
_02222D46:
	add r0, r4, #0
	bl ov07_02222B70
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02222D56
	bl sub_02014BD8
_02222D56:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02222D3C

	thumb_func_start ov07_02222D60
ov07_02222D60: ; 0x02222D60
	push {r4, lr}
	add r4, r0, #0
	bne _02222D6A
	bl GF_AssertFail
_02222D6A:
	ldr r0, [r4, #0x1c]
	bl sub_02014BF8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02222D60

	thumb_func_start ov07_02222D74
ov07_02222D74: ; 0x02222D74
	push {r4, lr}
	add r4, r0, #0
	bne _02222D7E
	bl GF_AssertFail
_02222D7E:
	add r0, r4, #0
	bl ov07_02222B94
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02222D74

	thumb_func_start ov07_02222D88
ov07_02222D88: ; 0x02222D88
	lsl r1, r1, #0x10
	orr r0, r1
	bx lr
	.balign 4, 0
	thumb_func_end ov07_02222D88

	thumb_func_start ov07_02222D90
ov07_02222D90: ; 0x02222D90
	cmp r0, #3
	bhi _02222DB6
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02222DA0: ; jump table
	.short _02222DA8 - _02222DA0 - 2 ; case 0
	.short _02222DAC - _02222DA0 - 2 ; case 1
	.short _02222DB0 - _02222DA0 - 2 ; case 2
	.short _02222DB4 - _02222DA0 - 2 ; case 3
_02222DA8:
	ldr r0, _02222DB8 ; =0x04000010
	bx lr
_02222DAC:
	ldr r0, _02222DBC ; =0x04000014
	bx lr
_02222DB0:
	ldr r0, _02222DC0 ; =0x04000018
	bx lr
_02222DB4:
	ldr r0, _02222DC4 ; =0x0400001C
_02222DB6:
	bx lr
	.balign 4, 0
_02222DB8: .word 0x04000010
_02222DBC: .word 0x04000014
_02222DC0: .word 0x04000018
_02222DC4: .word 0x0400001C
	thumb_func_end ov07_02222D90

	thumb_func_start ov07_02222DC8
ov07_02222DC8: ; 0x02222DC8
	add r2, r0, r2
	lsr r0, r2, #0x1f
	add r0, r2, r0
	asr r2, r0, #1
	ldr r0, [sp]
	add r1, r1, r3
	strh r2, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r1, r0, #1
	ldr r0, [sp, #4]
	strh r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_02222DC8

	thumb_func_start ov07_02222DE4
ov07_02222DE4: ; 0x02222DE4
	push {r3, lr}
	sub r1, r1, r3
	neg r1, r1
	sub r0, r0, r2
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	asr r1, r1, #0x10
	add r2, r1, #0
	asr r0, r0, #0x10
	mul r2, r1
	add r1, r0, #0
	mul r1, r0
	add r0, r2, r1
	lsl r0, r0, #0xc
	bl FX_Sqrt
	ldr r1, [sp, #8]
	str r0, [r1]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_02222DE4

	thumb_func_start ov07_02222E0C
ov07_02222E0C: ; 0x02222E0C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	sub r0, r1, r3
	neg r0, r0
	lsl r0, r0, #0x10
	sub r1, r6, r2
	asr r4, r0, #0x10
	lsl r1, r1, #0x10
	ldr r5, [sp, #0x10]
	lsl r0, r4, #0xc
	asr r1, r1, #4
	bl FX_Atan2Idx
	strh r0, [r5]
	ldrh r1, [r5]
	cmp r1, #0
	beq _02222E3C
	cmp r4, #0
	bge _02222E3C
	ldr r0, _02222E40 ; =0x00007FFF
	sub r1, r1, r0
	ldr r0, _02222E44 ; =0x0000FFFF
	mul r0, r1
	strh r0, [r5]
_02222E3C:
	pop {r4, r5, r6, pc}
	nop
_02222E40: .word 0x00007FFF
_02222E44: .word 0x0000FFFF
	thumb_func_end ov07_02222E0C

	thumb_func_start ov07_02222E48
ov07_02222E48: ; 0x02222E48
	cmp r2, #0
	ldr r3, [r0]
	bge _02222E60
	add r2, r3, r2
	cmp r2, r1
	ble _02222E5A
	str r2, [r0]
	mov r0, #0
	bx lr
_02222E5A:
	str r1, [r0]
	mov r0, #1
	bx lr
_02222E60:
	add r2, r3, r2
	cmp r2, r1
	bge _02222E6C
	str r2, [r0]
	mov r0, #0
	bx lr
_02222E6C:
	str r1, [r0]
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end ov07_02222E48

	thumb_func_start ov07_02222E74
ov07_02222E74: ; 0x02222E74
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02222EE4
	mov r0, #0x17
	ldrsb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, #0x17]
	ldrsb r1, [r4, r0]
	mov r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r1, r0
	blt _02222EE4
	mov r0, #0
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0x14]
	str r0, [sp]
	ldrh r0, [r4, #0x10]
	str r0, [sp, #4]
	ldrh r2, [r4, #0xc]
	ldrh r3, [r4, #0xe]
	ldr r0, [r4, #0x18]
	ldr r1, [r4, #8]
	bl sub_02003E5C
	ldrb r3, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	cmp r1, r3
	bne _02222EBA
	mov r0, #0
	add sp, #8
	str r0, [r4]
	pop {r4, pc}
_02222EBA:
	mov r0, #0x15
	ldrsb r2, [r4, r0]
	add r1, r1, r2
	lsl r0, r1, #0x18
	asr r0, r0, #0x18
	cmp r2, #0
	ble _02222ED8
	cmp r0, r3
	ble _02222ED2
	add sp, #8
	strb r3, [r4, #0x14]
	pop {r4, pc}
_02222ED2:
	add sp, #8
	strb r1, [r4, #0x14]
	pop {r4, pc}
_02222ED8:
	cmp r0, r3
	bge _02222EE2
	add sp, #8
	strb r3, [r4, #0x14]
	pop {r4, pc}
_02222EE2:
	strb r1, [r4, #0x14]
_02222EE4:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_02222E74

	thumb_func_start ov07_02222EE8
ov07_02222EE8: ; 0x02222EE8
	push {r4, lr}
	add r4, r0, #0
	bne _02222EF2
	bl GF_AssertFail
_02222EF2:
	ldr r0, [r4]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02222EE8

	thumb_func_start ov07_02222EF8
ov07_02222EF8: ; 0x02222EF8
	push {r4, lr}
	add r4, r0, #0
	bne _02222F02
	bl GF_AssertFail
_02222F02:
	ldr r0, [r4, #4]
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov07_02222EF8

	thumb_func_start ov07_02222F10
ov07_02222F10: ; 0x02222F10
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, r1, #0
	mov r1, #0x1c
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _02222F28
	bl GF_AssertFail
_02222F28:
	str r5, [r4, #0x18]
	str r6, [r4, #8]
	strh r7, [r4, #0xc]
	add r1, sp, #8
	ldrh r0, [r1, #0x10]
	strh r0, [r4, #0xe]
	ldrh r0, [r1, #0x24]
	strh r0, [r4, #0x10]
	ldrb r2, [r1, #0x1c]
	add r0, sp, #0x28
	ldrb r0, [r0]
	strb r2, [r4, #0x12]
	strb r0, [r4, #0x13]
	strb r2, [r4, #0x14]
	mov r0, #0x14
	ldrsb r0, [r1, r0]
	strb r0, [r4, #0x16]
	strb r0, [r4, #0x17]
	ldrb r2, [r4, #0x12]
	ldrb r0, [r4, #0x13]
	cmp r2, r0
	bhs _02222F5A
	mov r0, #0x18
	ldrsb r0, [r1, r0]
	b _02222F60
_02222F5A:
	mov r0, #0x18
	ldrsb r0, [r1, r0]
	neg r0, r0
_02222F60:
	strb r0, [r4, #0x15]
	mov r0, #1
	str r0, [r4]
	ldr r0, _02222F78 ; =ov07_02222E74
	ldr r2, [sp, #0x30]
	add r1, r4, #0
	bl CreateSysTask
	str r0, [r4, #4]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02222F78: .word ov07_02222E74
	thumb_func_end ov07_02222F10

	thumb_func_start ov07_02222F7C
ov07_02222F7C: ; 0x02222F7C
	push {r4, r5, r6, r7}
	mov r7, #0
	cmp r1, #0
	ble _02222FBE
	mov r2, #0x97
_02222F86:
	ldrh r6, [r0]
	mov r3, #0x1f
	add r7, r7, #1
	asr r4, r6, #0xa
	and r4, r3
	add r5, r4, #0
	mov r3, #0x1d
	mul r5, r3
	mov r3, #0x1f
	and r3, r6
	mov r4, #0x4c
	mul r4, r3
	asr r6, r6, #5
	mov r3, #0x1f
	and r3, r6
	add r6, r3, #0
	mul r6, r2
	add r3, r4, r6
	add r3, r5, r3
	asr r5, r3, #8
	lsl r4, r5, #0xa
	lsl r3, r5, #5
	orr r3, r4
	orr r3, r5
	strh r3, [r0]
	add r0, r0, #2
	cmp r7, r1
	blt _02222F86
_02222FBE:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end ov07_02222F7C

	thumb_func_start ov07_02222FC4
ov07_02222FC4: ; 0x02222FC4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov07_0221FA78
	mov r1, #0
	bl PaletteData_GetFadedBuf
	add r4, r0, #0
	add r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02222FE8
	add r0, r4, #0
	mov r1, #0x30
	bl ov07_02222F7C
	pop {r3, r4, r5, pc}
_02222FE8:
	add r0, r4, #0
	mov r1, #0x80
	bl ov07_02222F7C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02222FC4

	thumb_func_start ov07_02222FF4
ov07_02222FF4: ; 0x02222FF4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	bl ov07_0221FA78
	add r4, r0, #0
	add r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02223020
	mov r1, #0
	str r1, [sp]
	mov r0, #0x60
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl PaletteData_CopyPalette
	add sp, #8
	pop {r3, r4, r5, pc}
_02223020:
	mov r1, #0
	mov r0, #1
	str r1, [sp]
	lsl r0, r0, #8
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	add r3, r1, #0
	bl PaletteData_CopyPalette
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02222FF4

	thumb_func_start ov07_02223038
ov07_02223038: ; 0x02223038
	cmp r0, #0x54
	blo _02223040
	mov r0, #0
	bx lr
_02223040:
	lsl r1, r0, #2
	ldr r0, _02223048 ; =ov07_02236520
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02223048: .word ov07_02236520
	thumb_func_end ov07_02223038

	thumb_func_start ov07_0222304C
ov07_0222304C: ; 0x0222304C
	cmp r0, #0x21
	blo _02223054
	mov r0, #0
	bx lr
_02223054:
	lsl r1, r0, #2
	ldr r0, _0222305C ; =ov07_0223649C
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_0222305C: .word ov07_0223649C
	thumb_func_end ov07_0222304C

	thumb_func_start ov07_02223060
ov07_02223060: ; 0x02223060
	bx lr
	.balign 4, 0
	thumb_func_end ov07_02223060

	thumb_func_start ov07_02223064
ov07_02223064: ; 0x02223064
	push {r4, lr}
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02223076
	cmp r0, #1
	beq _0222307C
	pop {r4, pc}
_02223076:
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_0222307C:
	ldr r0, [r4, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov07_02223064

	thumb_func_start ov07_0222308C
ov07_0222308C: ; 0x0222308C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r2, r0, #0
	mov r0, #0
	strb r0, [r2]
	mov r3, #1
	ldr r1, _022230B0 ; =ov07_02223064
	add r0, r4, #0
	lsl r3, r3, #0xc
	str r4, [r2, #4]
	bl ov07_0221C3F4
	pop {r4, pc}
	nop
_022230B0: .word ov07_02223064
	thumb_func_end ov07_0222308C

	thumb_func_start ov07_022230B4
ov07_022230B4: ; 0x022230B4
	push {r4, lr}
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _022230C6
	cmp r0, #1
	beq _022230CC
	pop {r4, pc}
_022230C6:
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_022230CC:
	ldr r0, [r4, #4]
	add r1, r2, #0
	bl ov07_0221C458
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov07_022230B4

	thumb_func_start ov07_022230DC
ov07_022230DC: ; 0x022230DC
	push {r4, lr}
	add r4, r0, #0
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r2, r0, #0
	mov r0, #0
	strb r0, [r2]
	mov r3, #1
	ldr r1, _02223100 ; =ov07_022230B4
	add r0, r4, #0
	lsl r3, r3, #0xc
	str r4, [r2, #4]
	bl ov07_0221C42C
	pop {r4, pc}
	nop
_02223100: .word ov07_022230B4
	thumb_func_end ov07_022230DC

	thumb_func_start ov07_02223104
ov07_02223104: ; 0x02223104
	push {r4, lr}
	add r4, r1, #0
	ldrb r1, [r4]
	cmp r1, #0
	beq _02223114
	cmp r1, #1
	beq _0222311A
	pop {r4, pc}
_02223114:
	add r0, r1, #1
	strb r0, [r4]
	pop {r4, pc}
_0222311A:
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02223104

	thumb_func_start ov07_02223128
ov07_02223128: ; 0x02223128
	push {r4, lr}
	add r4, r0, #0
	mov r0, #5
	mov r1, #8
	bl AllocFromHeap
	add r1, r0, #0
	mov r0, #0
	strb r0, [r1]
	mov r2, #1
	ldr r0, _02223148 ; =ov07_02223104
	lsl r2, r2, #0xc
	str r4, [r1, #4]
	bl CreateSysTask
	pop {r4, pc}
	.balign 4, 0
_02223148: .word ov07_02223104
	thumb_func_end ov07_02223128

	thumb_func_start ov07_0222314C
ov07_0222314C: ; 0x0222314C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0222315E
	cmp r0, #1
	beq _022231A4
	pop {r4, r5, r6, pc}
_0222315E:
	ldr r0, [r5, #0x14]
	ldr r0, [r0]
	bl sub_0200DC0C
	ldr r0, [r5, #0x18]
	ldr r0, [r0]
	bl sub_0200DC0C
	ldr r0, [r5, #0x1c]
	ldr r0, [r0]
	bl sub_0200DC0C
	ldr r0, [r5, #0x14]
	mov r1, #1
	ldr r0, [r0]
	mov r2, #0
	bl sub_0200DEA0
	ldr r0, [r5, #0x18]
	mov r1, #0
	ldr r0, [r0]
	mvn r1, r1
	mov r2, #0
	bl sub_0200DEA0
	ldr r0, [r5, #0x1c]
	mov r1, #1
	ldr r0, [r0]
	add r2, r1, #0
	bl sub_0200DEA0
	ldr r0, [r5, #0xc]
	bl sub_0200D020
	pop {r4, r5, r6, pc}
_022231A4:
	ldr r0, [r5, #0x10]
	ldr r4, [r5, #4]
	bl sub_0200D9DC
	add r0, r5, #0
	bl FreeToHeap
	add r0, r4, #0
	add r1, r6, #0
	bl ov07_0221C448
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0222314C

	thumb_func_start ov07_022231BC
ov07_022231BC: ; 0x022231BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r6, r1, #0
	mov r1, #0x73
	str r0, [sp]
	mov r0, #5
	lsl r1, r1, #2
	add r7, r2, #0
	add r5, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _022231DA
	bl GF_AssertFail
_022231DA:
	mov r0, #0
	strb r0, [r4]
	str r6, [r4, #8]
	str r7, [r4, #0xc]
	ldr r0, [sp]
	str r5, [r4, #0x10]
	str r0, [r4, #4]
	ldr r1, [sp]
	add r0, sp, #4
	bl ov07_0221F9E8
	str r5, [r4, #0x14]
	mov r6, #1
	add r5, r4, #4
	add r7, sp, #4
_022231F8:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0xc]
	add r2, r7, #0
	bl sub_0200D734
	str r0, [r5, #0x14]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _022231F8
	mov r3, #1
	ldr r0, [sp]
	ldr r1, _02223220 ; =ov07_0222314C
	add r2, r4, #0
	lsl r3, r3, #0xc
	bl ov07_0221C3F4
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223220: .word ov07_0222314C
	thumb_func_end ov07_022231BC

	thumb_func_start ov07_02223224
ov07_02223224: ; 0x02223224
	push {r4, lr}
	mov r1, #0xc
	add r2, r1, #0
	add r2, #0xf4
	add r4, r0, #0
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	add r0, r4, #0
	add r2, #0xf3
	bl sub_020087A4
	pop {r4, pc}
	thumb_func_end ov07_02223224

	thumb_func_start ov07_02223240
ov07_02223240: ; 0x02223240
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r2, r0, #0
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _02223252
	cmp r0, #1
	beq _02223274
	b _0222333E
_02223252:
	mov r0, #0x26
	ldrsh r0, [r5, r0]
	mov r1, #0x20
	mov r2, #0x22
	str r0, [sp]
	mov r3, #0x24
	add r0, r5, #0
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	add r0, #0x7c
	bl ov07_022227A8
	ldrb r0, [r5, #4]
	add r0, r0, #1
	strb r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02223274:
	add r0, r5, #0
	add r0, #0x7c
	bl ov07_022227D8
	cmp r0, #0
	bne _02223288
	ldrb r0, [r5, #4]
	add r0, r0, #1
	strb r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_02223288:
	ldr r2, [r5, #0x28]
	mov r1, #1
	lsl r1, r1, #8
	add r0, r2, #0
	and r0, r1
	cmp r0, r1
	bne _022232D4
	ldr r0, [r5]
	mov r6, #0
	cmp r0, #0
	ble _02223322
	add r4, r5, #0
	mov r7, #0x32
_022232A2:
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _022232C8
	mov r2, #0x7c
	mov r3, #0x30
	ldrsh r2, [r5, r2]
	ldrsh r3, [r4, r3]
	mov r1, #0
	add r2, r2, r3
	bl sub_020087A4
	mov r2, #0x7e
	ldrsh r3, [r5, r2]
	ldrsh r2, [r4, r7]
	ldr r0, [r4, #0x34]
	mov r1, #1
	add r2, r3, r2
	bl sub_020087A4
_022232C8:
	ldr r0, [r5]
	add r6, r6, #1
	add r4, #0x14
	cmp r6, r0
	blt _022232A2
	b _02223322
_022232D4:
	lsl r0, r1, #1
	and r2, r0
	cmp r2, r0
	bne _02223322
	ldr r0, [r5]
	mov r6, #0
	cmp r0, #0
	ble _0222331C
	add r4, r5, #0
	mov r7, #0x32
_022232E8:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _02223312
	mov r1, #0x7c
	mov r2, #0x30
	ldrsh r1, [r5, r1]
	ldrsh r2, [r4, r2]
	add r1, r1, r2
	mov r2, #0x7e
	ldrsh r3, [r5, r2]
	ldrsh r2, [r4, r7]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r0, [r4, #0x38]
	bl sub_0200DC18
_02223312:
	ldr r0, [r5]
	add r6, r6, #1
	add r4, #0x14
	cmp r6, r0
	blt _022232E8
_0222331C:
	ldr r0, [r5, #0x10]
	bl sub_0200D020
_02223322:
	mov r0, #1
	ldr r1, [r5, #0x28]
	lsl r0, r0, #0xa
	and r1, r0
	cmp r1, r0
	bne _0222334C
	mov r3, #0x7c
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x18]
	mov r1, #3
	mov r2, #0
	bl BgSetPosTextAndCommit
	pop {r3, r4, r5, r6, r7, pc}
_0222333E:
	ldr r0, [r5, #8]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r5, #0
	bl FreeToHeap
_0222334C:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_02223240

	thumb_func_start ov07_02223350
ov07_02223350: ; 0x02223350
	push {r3, r4, r5, lr}
	mov r1, #0xa0
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #4
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	strh r0, [r4, #0x20]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0x22]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	strh r0, [r4, #0x24]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #0x26]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	mov r2, #1
	lsl r2, r2, #8
	str r0, [r4, #0x28]
	add r1, r0, #0
	and r0, r2
	cmp r0, r2
	bne _022233B0
	add r2, r4, #0
	add r0, r5, #0
	add r2, #0x2c
	add r3, r4, #0
	bl ov07_02232020
	b _022233C6
_022233B0:
	lsl r0, r2, #1
	add r3, r1, #0
	and r3, r0
	cmp r3, r0
	bne _022233C6
	add r2, r4, #0
	add r0, r5, #0
	add r2, #0x2c
	add r3, r4, #0
	bl ov07_022323FC
_022233C6:
	ldr r0, [r4, #8]
	ldr r1, _022233D4 ; =ov07_02223240
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_022233D4: .word ov07_02223240
	thumb_func_end ov07_02223350

	thumb_func_start ov07_022233D8
ov07_022233D8: ; 0x022233D8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0x1c]
	cmp r0, #3
	bhi _022234A2
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022233F0: ; jump table
	.short _022233F8 - _022233F0 - 2 ; case 0
	.short _02223416 - _022233F0 - 2 ; case 1
	.short _02223458 - _022233F0 - 2 ; case 2
	.short _02223464 - _022233F0 - 2 ; case 3
_022233F8:
	ldrh r0, [r4, #0x18]
	mov r1, #4
	mov r2, #0x39
	str r0, [sp]
	ldrh r3, [r4, #0x16]
	ldr r0, _02223544 ; =0x04000050
	bl G2x_SetBlendAlpha_
	mov r0, #2
	mov r1, #1
	bl ToggleBgLayer
	ldrb r0, [r4, #0x1c]
	add r0, r0, #1
	strb r0, [r4, #0x1c]
_02223416:
	ldrh r1, [r4, #8]
	ldrh r2, [r4, #0x16]
	mov r0, #0
	sub r1, r1, #2
	cmp r2, r1
	bge _02223428
	add r1, r2, #2
	strh r1, [r4, #0x16]
	b _0222342A
_02223428:
	add r0, r0, #1
_0222342A:
	ldrh r1, [r4, #0x18]
	cmp r1, #9
	bls _02223436
	sub r1, r1, #2
	strh r1, [r4, #0x18]
	b _02223438
_02223436:
	add r0, r0, #1
_02223438:
	cmp r0, #2
	bne _0222344A
	ldrh r0, [r4, #8]
	strh r0, [r4, #0x16]
	mov r0, #7
	strh r0, [r4, #0x18]
	ldrb r0, [r4, #0x1c]
	add r0, r0, #1
	strb r0, [r4, #0x1c]
_0222344A:
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x16]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02223548 ; =0x04000052
	strh r1, [r0]
	b _022234BA
_02223458:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _022234BA
	add r0, r0, #1
	strb r0, [r4, #0x1c]
	b _022234BA
_02223464:
	ldrh r0, [r4, #0x16]
	mov r1, #0
	cmp r0, #2
	bls _02223472
	sub r0, r0, #2
	strh r0, [r4, #0x16]
	b _02223474
_02223472:
	add r1, r1, #1
_02223474:
	ldrh r0, [r4, #0x18]
	cmp r0, #0x1d
	bhs _02223480
	add r0, r0, #2
	strh r0, [r4, #0x18]
	b _02223482
_02223480:
	add r1, r1, #1
_02223482:
	cmp r1, #2
	bne _02223494
	mov r0, #0
	strh r0, [r4, #0x16]
	mov r0, #0x1f
	strh r0, [r4, #0x18]
	ldrb r0, [r4, #0x1c]
	add r0, r0, #1
	strb r0, [r4, #0x1c]
_02223494:
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x16]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02223548 ; =0x04000052
	strh r1, [r0]
	b _022234BA
_022234A2:
	mov r0, #2
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r4, #0x20]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
_022234BA:
	mov r1, #0x10
	ldrsh r3, [r4, r1]
	cmp r3, #0
	ble _022234CC
	mov r0, #0xc
	ldrsh r2, [r4, r0]
	lsl r0, r1, #5
	cmp r2, r0
	bge _022234DA
_022234CC:
	cmp r3, #0
	bge _022234DE
	mov r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, _0222354C ; =0xFFFFFE64
	cmp r1, r0
	bgt _022234DE
_022234DA:
	mov r0, #1
	str r0, [r4, #4]
_022234DE:
	mov r0, #0xa
	ldrsh r1, [r4, r0]
	mov r0, #0xe
	ldrsh r0, [r4, r0]
	add r0, r1, r0
	strh r0, [r4, #0xa]
	mov r0, #0xc
	ldrsh r2, [r4, r0]
	mov r0, #0x10
	ldrsh r1, [r4, r0]
	add r1, r2, r1
	strh r1, [r4, #0xc]
	ldrh r2, [r4, #0x12]
	ldrh r1, [r4, #0x14]
	cmp r2, r1
	bhs _02223522
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _02223508
	add r0, r0, #1
	b _0222350A
_02223508:
	mov r0, #0
_0222350A:
	strh r0, [r4, #0x10]
	mov r0, #0xe
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _02223518
	add r0, r0, #1
	b _0222351A
_02223518:
	mov r0, #0
_0222351A:
	strh r0, [r4, #0xe]
	mov r0, #0
	strh r0, [r4, #0x14]
	b _02223526
_02223522:
	add r0, r1, #1
	strh r0, [r4, #0x14]
_02223526:
	mov r3, #0xa
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	mov r1, #2
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r3, #0xc
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	mov r1, #2
	mov r2, #3
	bl BgSetPosTextAndCommit
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02223544: .word 0x04000050
_02223548: .word 0x04000052
_0222354C: .word 0xFFFFFE64
	thumb_func_end ov07_022233D8

	thumb_func_start ov07_02223550
ov07_02223550: ; 0x02223550
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r1, #0xb8
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x1c
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0xa]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	strh r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #0xe]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	strh r0, [r4, #0x10]
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	str r0, [r4]
	add r0, r5, #0
	mov r1, #6
	bl ov07_0221C4A8
	strh r0, [r4, #8]
	add r0, r5, #0
	mov r1, #7
	bl ov07_0221C4A8
	strh r0, [r4, #0x12]
	mov r0, #0
	strh r0, [r4, #0x14]
	ldr r0, [r4]
	cmp r0, #0
	beq _022235FC
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _022235FC
	mov r0, #0xa
	ldrsh r1, [r4, r0]
	sub r0, #0xb
	mul r0, r1
	strh r0, [r4, #0xa]
	mov r1, #0xc
	add r0, r1, #0
	ldrsh r2, [r4, r1]
	sub r0, #0xd
	mul r0, r2
	strh r0, [r4, #0xc]
	mov r0, #0xe
	ldrsh r2, [r4, r0]
	sub r0, #0xf
	mul r0, r2
	strh r0, [r4, #0xe]
	mov r0, #0x10
	ldrsh r2, [r4, r0]
	sub r0, #0x11
	mul r0, r2
	strh r0, [r4, #0x10]
	ldrsh r0, [r4, r1]
	sub r0, #0x54
	strh r0, [r4, #0xc]
	b _02223604
_022235FC:
	mov r0, #0xc
	ldrsh r0, [r4, r0]
	add r0, #0x54
	strh r0, [r4, #0xc]
_02223604:
	mov r1, #0
	strh r1, [r4, #0x16]
	mov r0, #0x1f
	strh r0, [r4, #0x18]
	mov r0, #2
	str r1, [r4, #4]
	bl ToggleBgLayer
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	mov r1, #0
	add r7, r0, #0
	bl ov07_0221FB7C
	add r6, r0, #0
	add r0, r5, #0
	bl ov07_0221BFD0
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x30]
	mov r0, #7
	add r1, r6, #0
	mov r3, #2
	bl GfGfxLoader_LoadCharData
	add r0, r7, #0
	mov r1, #1
	bl ov07_0221FB7C
	add r6, r0, #0
	add r0, r5, #0
	bl ov07_0221BFD0
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x90
	str r0, [sp, #8]
	ldr r0, [r4, #0x34]
	mov r1, #7
	add r2, r6, #0
	bl PaletteData_LoadNarc
	ldr r0, [r4, #0x30]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	mov r6, #2
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02223684
	mov r6, #4
	b _02223698
_02223684:
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _02223698
	mov r6, #3
_02223698:
	add r0, r7, #0
	add r1, r6, #0
	bl ov07_0221FB7C
	add r6, r0, #0
	add r0, r5, #0
	bl ov07_0221BFD0
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x30]
	mov r0, #7
	add r1, r6, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r3, #0xa
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	mov r1, #2
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r3, #0xc
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	mov r1, #2
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x20]
	ldr r1, _022236EC ; =ov07_022233D8
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022236EC: .word ov07_022233D8
	thumb_func_end ov07_02223550

	thumb_func_start ov07_022236F0
ov07_022236F0: ; 0x022236F0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0x1c]
	cmp r0, #3
	bhi _022237B6
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02223708: ; jump table
	.short _02223710 - _02223708 - 2 ; case 0
	.short _0222372E - _02223708 - 2 ; case 1
	.short _0222376C - _02223708 - 2 ; case 2
	.short _02223778 - _02223708 - 2 ; case 3
_02223710:
	ldrh r0, [r4, #0x18]
	mov r1, #4
	mov r2, #0x39
	str r0, [sp]
	ldrh r3, [r4, #0x16]
	ldr r0, _02223858 ; =0x04000050
	bl G2x_SetBlendAlpha_
	mov r0, #2
	mov r1, #1
	bl ToggleBgLayer
	ldrb r0, [r4, #0x1c]
	add r0, r0, #1
	strb r0, [r4, #0x1c]
_0222372E:
	ldrh r0, [r4, #0x16]
	mov r1, #0
	cmp r0, #0x10
	bhs _0222373C
	add r0, r0, #2
	strh r0, [r4, #0x16]
	b _0222373E
_0222373C:
	add r1, r1, #1
_0222373E:
	ldrh r0, [r4, #0x18]
	cmp r0, #4
	bls _0222374A
	sub r0, r0, #2
	strh r0, [r4, #0x18]
	b _0222374C
_0222374A:
	add r1, r1, #1
_0222374C:
	cmp r1, #2
	bne _0222375E
	mov r0, #0x10
	strh r0, [r4, #0x16]
	mov r0, #4
	strh r0, [r4, #0x18]
	ldrb r0, [r4, #0x1c]
	add r0, r0, #1
	strb r0, [r4, #0x1c]
_0222375E:
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x16]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0222385C ; =0x04000052
	strh r1, [r0]
	b _022237CE
_0222376C:
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _022237CE
	add r0, r0, #1
	strb r0, [r4, #0x1c]
	b _022237CE
_02223778:
	ldrh r0, [r4, #0x16]
	mov r1, #0
	cmp r0, #2
	bls _02223786
	sub r0, r0, #2
	strh r0, [r4, #0x16]
	b _02223788
_02223786:
	add r1, r1, #1
_02223788:
	ldrh r0, [r4, #0x18]
	cmp r0, #0x10
	bhs _02223794
	add r0, r0, #2
	strh r0, [r4, #0x18]
	b _02223796
_02223794:
	add r1, r1, #1
_02223796:
	cmp r1, #2
	bne _022237A8
	mov r0, #0
	strh r0, [r4, #0x16]
	mov r0, #0x1f
	strh r0, [r4, #0x18]
	ldrb r0, [r4, #0x1c]
	add r0, r0, #1
	strb r0, [r4, #0x1c]
_022237A8:
	ldrh r0, [r4, #0x18]
	ldrh r1, [r4, #0x16]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0222385C ; =0x04000052
	strh r1, [r0]
	b _022237CE
_022237B6:
	mov r0, #2
	mov r1, #0
	bl ToggleBgLayer
	ldr r0, [r4, #0x20]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
_022237CE:
	mov r1, #0x10
	ldrsh r3, [r4, r1]
	cmp r3, #0
	ble _022237E0
	mov r0, #0xc
	ldrsh r2, [r4, r0]
	lsl r0, r1, #5
	cmp r2, r0
	bge _022237EE
_022237E0:
	cmp r3, #0
	bge _022237F2
	mov r0, #0xc
	ldrsh r1, [r4, r0]
	ldr r0, _02223860 ; =0xFFFFFE64
	cmp r1, r0
	bgt _022237F2
_022237EE:
	mov r0, #1
	str r0, [r4, #4]
_022237F2:
	mov r0, #0xa
	ldrsh r1, [r4, r0]
	mov r0, #0xe
	ldrsh r0, [r4, r0]
	add r0, r1, r0
	strh r0, [r4, #0xa]
	mov r0, #0xc
	ldrsh r2, [r4, r0]
	mov r0, #0x10
	ldrsh r1, [r4, r0]
	add r1, r2, r1
	strh r1, [r4, #0xc]
	ldrh r2, [r4, #0x12]
	ldrh r1, [r4, #0x14]
	cmp r2, r1
	bhs _02223836
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _0222381C
	add r0, r0, #1
	b _0222381E
_0222381C:
	mov r0, #0
_0222381E:
	strh r0, [r4, #0x10]
	mov r0, #0xe
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _0222382C
	add r0, r0, #1
	b _0222382E
_0222382C:
	mov r0, #0
_0222382E:
	strh r0, [r4, #0xe]
	mov r0, #0
	strh r0, [r4, #0x14]
	b _0222383A
_02223836:
	add r0, r1, #1
	strh r0, [r4, #0x14]
_0222383A:
	mov r3, #0xa
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	mov r1, #2
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r3, #0xc
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	mov r1, #2
	mov r2, #3
	bl BgSetPosTextAndCommit
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02223858: .word 0x04000050
_0222385C: .word 0x04000052
_02223860: .word 0xFFFFFE64
	thumb_func_end ov07_022236F0

	thumb_func_start ov07_02223864
ov07_02223864: ; 0x02223864
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r1, #0xb8
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x1c
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0xa]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	strh r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #0xe]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	strh r0, [r4, #0x10]
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	str r0, [r4]
	add r0, r5, #0
	mov r1, #6
	bl ov07_0221C4A8
	strh r0, [r4, #8]
	add r0, r5, #0
	mov r1, #7
	bl ov07_0221C4A8
	strh r0, [r4, #0x12]
	mov r0, #0
	strh r0, [r4, #0x14]
	ldr r0, [r4]
	cmp r0, #0
	beq _02223910
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _02223910
	mov r0, #0xa
	ldrsh r1, [r4, r0]
	sub r0, #0xb
	mul r0, r1
	strh r0, [r4, #0xa]
	mov r1, #0xc
	add r0, r1, #0
	ldrsh r2, [r4, r1]
	sub r0, #0xd
	mul r0, r2
	strh r0, [r4, #0xc]
	mov r0, #0xe
	ldrsh r2, [r4, r0]
	sub r0, #0xf
	mul r0, r2
	strh r0, [r4, #0xe]
	mov r0, #0x10
	ldrsh r2, [r4, r0]
	sub r0, #0x11
	mul r0, r2
	strh r0, [r4, #0x10]
	ldrsh r0, [r4, r1]
	sub r0, #0x54
	strh r0, [r4, #0xc]
	b _02223918
_02223910:
	mov r0, #0xc
	ldrsh r0, [r4, r0]
	add r0, #0x54
	strh r0, [r4, #0xc]
_02223918:
	add r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0222392C
	mov r0, #0xe
	ldrsh r1, [r4, r0]
	sub r0, #0xf
	mul r0, r1
	strh r0, [r4, #0xe]
_0222392C:
	mov r0, #4
	strh r0, [r4, #0x16]
	mov r0, #0x10
	strh r0, [r4, #0x18]
	mov r1, #0
	strh r1, [r4, #0x16]
	strh r0, [r4, #0x18]
	mov r0, #2
	str r1, [r4, #4]
	bl ToggleBgLayer
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	mov r1, #0
	add r7, r0, #0
	bl ov07_0221FB7C
	add r6, r0, #0
	add r0, r5, #0
	bl ov07_0221BFD0
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x30]
	mov r0, #7
	add r1, r6, #0
	mov r3, #2
	bl GfGfxLoader_LoadCharData
	add r0, r7, #0
	mov r1, #1
	bl ov07_0221FB7C
	add r6, r0, #0
	add r0, r5, #0
	bl ov07_0221BFD0
	add r3, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x90
	str r0, [sp, #8]
	ldr r0, [r4, #0x34]
	mov r1, #7
	add r2, r6, #0
	bl PaletteData_LoadNarc
	ldr r0, [r4, #0x30]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	mov r6, #2
	bl ov07_0221BFC0
	cmp r0, #1
	bne _022239B2
	mov r6, #4
	b _022239C6
_022239B2:
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _022239C6
	mov r6, #3
_022239C6:
	add r0, r7, #0
	add r1, r6, #0
	bl ov07_0221FB7C
	add r6, r0, #0
	add r0, r5, #0
	bl ov07_0221BFD0
	mov r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	mov r1, #1
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r4, #0x30]
	mov r0, #7
	add r1, r6, #0
	mov r3, #2
	bl GfGfxLoader_LoadScrnData
	mov r3, #0xa
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	mov r1, #2
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r3, #0xc
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x30]
	mov r1, #2
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x20]
	ldr r1, _02223A18 ; =ov07_022236F0
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02223A18: .word ov07_022236F0
	thumb_func_end ov07_02223864

	thumb_func_start ov07_02223A1C
ov07_02223A1C: ; 0x02223A1C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02223A32
	cmp r0, #1
	beq _02223A32
	cmp r0, #2
	beq _02223A64
	pop {r3, r4, r5, pc}
_02223A32:
	add r0, r4, #0
	add r0, #0xc
	bl ov07_02222440
	cmp r0, #1
	bne _02223A4E
	ldr r2, [r4, #0xc]
	ldr r0, [r4, #8]
	lsl r2, r2, #0x10
	mov r1, #9
	lsr r2, r2, #0x10
	bl sub_020087A4
	pop {r3, r4, r5, pc}
_02223A4E:
	add r0, r4, #0
	ldr r1, [r4, #0xc]
	ldr r2, [r4, #0x20]
	ldr r3, [r4, #0x24]
	add r0, #0xc
	bl ov07_022223F0
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02223A64:
	ldr r0, [r4, #8]
	mov r1, #0xa
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #8]
	mov r1, #0xb
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #8]
	mov r1, #9
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02223A1C

	thumb_func_start ov07_02223A94
ov07_02223A94: ; 0x02223A94
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0x2c
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4]
	str r5, [r4, #4]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #0x24]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #0x20]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	add r7, r0, #0
	beq _02223ACE
	cmp r7, #2
	bne _02223AD8
_02223ACE:
	ldr r0, [r4, #4]
	bl ov07_0221C470
	str r0, [sp]
	b _02223AE0
_02223AD8:
	ldr r0, [r4, #4]
	bl ov07_0221C468
	str r0, [sp]
_02223AE0:
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	add r2, r0, #0
	add r0, r4, #0
	ldr r1, [r4, #0x20]
	ldr r3, [r4, #0x24]
	add r0, #0xc
	bl ov07_022223F0
	ldr r1, [sp]
	add r0, r5, #0
	bl ov07_02222004
	add r6, r0, #0
	ldr r0, [r4, #0x14]
	add r1, r0, #0
	mul r1, r6
	str r1, [r4, #0x14]
	cmp r7, #2
	bne _02223B12
	mov r0, #0
	mvn r0, r0
	mul r6, r0
_02223B12:
	ldr r0, [r4, #4]
	ldr r1, [sp]
	bl ov07_0221FA48
	str r0, [r4, #8]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	cmp r0, #1
	bne _02223B3C
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	strh r0, [r4, #0x28]
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	b _02223B44
_02223B3C:
	mov r0, #0x28
	add r1, r6, #0
	mul r1, r0
	strh r1, [r4, #0x28]
_02223B44:
	strh r0, [r4, #0x2a]
	mov r2, #0x28
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	mov r1, #0xa
	bl sub_020087A4
	mov r2, #0x2a
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	mov r1, #0xb
	bl sub_020087A4
	ldr r0, [r4, #4]
	ldr r1, _02223B6C ; =ov07_02223A1C
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223B6C: .word ov07_02223A1C
	thumb_func_end ov07_02223A94

	thumb_func_start ov07_02223B70
ov07_02223B70: ; 0x02223B70
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x2c
	mov r2, #0x2e
	add r5, r0, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x28]
	add r0, r4, #4
	bl ov07_02222240
	cmp r0, #0
	bne _02223BBC
	mov r2, #0x2c
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x2e
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x28]
	mov r1, #1
	sub r2, #8
	bl sub_020087A4
	ldr r0, [r4, #0x28]
	mov r1, #9
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_02223BBC:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02223B70

	thumb_func_start ov07_02223BC0
ov07_02223BC0: ; 0x02223BC0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0x30
	bl AllocFromHeap
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	str r5, [r4]
	bl ov07_0221C4A8
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	add r2, r0, #0
	add r0, r4, #4
	add r1, r6, #0
	bl ov07_02222A44
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	cmp r0, #8
	bgt _02223C0A
	cmp r0, #2
	blt _02223C7C
	beq _02223C10
	cmp r0, #4
	beq _02223C2C
	cmp r0, #8
	beq _02223C50
	b _02223C7C
_02223C0A:
	cmp r0, #0x10
	beq _02223C62
	b _02223C7C
_02223C10:
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x28]
	mov r0, #0
	ldr r1, [r4, #0x10]
	mvn r0, r0
	mul r0, r1
	str r0, [r4, #0x10]
	b _02223C80
_02223C2C:
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0223197C
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x28]
	mov r0, #0
	ldr r1, [r4, #0x10]
	mvn r0, r0
	mul r0, r1
	str r0, [r4, #0x10]
	b _02223C80
_02223C50:
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x28]
	b _02223C80
_02223C62:
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0223197C
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x28]
	b _02223C80
_02223C7C:
	bl GF_AssertFail
_02223C80:
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0x2e]
	mov r0, #0x2e
	ldrsh r0, [r4, r0]
	ldr r1, _02223CA8 ; =ov07_02223B70
	add r2, r4, #0
	add r0, #8
	strh r0, [r4, #0x2e]
	ldr r0, [r4]
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02223CA8: .word ov07_02223B70
	thumb_func_end ov07_02223BC0

	thumb_func_start ov07_02223CAC
ov07_02223CAC: ; 0x02223CAC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	add r4, r1, #0
	mov r1, #1
	add r6, r2, #0
	bl sub_0200DCE8
	ldr r0, [r5, #0x14]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0200DDB8
	mov r0, #0
	str r0, [r5, #0x40]
	mov r0, #4
	mov r1, #0xa
	add r5, #0x18
	str r0, [sp]
	add r0, r5, #0
	add r2, r1, #0
	mov r3, #0xe
	bl ov07_02222508
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02223CAC

	thumb_func_start ov07_02223CE4
ov07_02223CE4: ; 0x02223CE4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r1, [r4, #0x14]
	add r0, #0x18
	bl ov07_02222748
	cmp r0, #0
	bne _02223D20
	ldr r0, [r4, #0x40]
	cmp r0, #0
	beq _02223D0A
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_0200DCE8
	add sp, #4
	mov r0, #1
	pop {r3, r4, pc}
_02223D0A:
	mov r0, #1
	str r0, [r4, #0x40]
	mov r0, #2
	add r4, #0x18
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #0xa
	mov r3, #0xc
	bl ov07_02222508
_02223D20:
	mov r0, #0
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02223CE4

	thumb_func_start ov07_02223D28
ov07_02223D28: ; 0x02223D28
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r1, [r4, #0x48]
	mov r5, #0
	cmp r1, #4
	bhi _02223DC0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02223D40: ; jump table
	.short _02223D4A - _02223D40 - 2 ; case 0
	.short _02223D70 - _02223D40 - 2 ; case 1
	.short _02223D80 - _02223D40 - 2 ; case 2
	.short _02223DAE - _02223D40 - 2 ; case 3
	.short _02223DBE - _02223D40 - 2 ; case 4
_02223D4A:
	mov r1, #0x4c
	ldrsh r3, [r4, r1]
	ldr r2, [r4, #0x3c]
	mov r1, #0x18
	mul r1, r2
	mov r2, #0x4e
	ldrsh r2, [r4, r2]
	add r1, r3, r1
	lsl r1, r1, #0x10
	sub r2, #0x10
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_02223CAC
	ldr r0, [r4, #0x48]
	add r0, r0, #1
	str r0, [r4, #0x48]
	b _02223DC0
_02223D70:
	bl ov07_02223CE4
	cmp r0, #0
	beq _02223DC0
	ldr r0, [r4, #0x48]
	add r0, r0, #1
	str r0, [r4, #0x48]
	b _02223DC0
_02223D80:
	ldr r1, [r4, #0x44]
	sub r1, r1, #1
	str r1, [r4, #0x44]
	bpl _02223DC0
	ldr r1, [r4, #0x48]
	add r1, r1, #1
	str r1, [r4, #0x48]
	mov r1, #0x4c
	ldrsh r3, [r4, r1]
	ldr r2, [r4, #0x3c]
	mov r1, #0x18
	mul r1, r2
	mov r2, #0x4e
	ldrsh r2, [r4, r2]
	sub r1, r3, r1
	lsl r1, r1, #0x10
	sub r2, #0x18
	lsl r2, r2, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_02223CAC
	b _02223DC0
_02223DAE:
	bl ov07_02223CE4
	cmp r0, #0
	beq _02223DC0
	ldr r0, [r4, #0x48]
	add r0, r0, #1
	str r0, [r4, #0x48]
	b _02223DC0
_02223DBE:
	mov r5, #1
_02223DC0:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02223D28

	thumb_func_start ov07_02223DC4
ov07_02223DC4: ; 0x02223DC4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _02223DD6
	cmp r0, #1
	beq _02223DE8
	b _02223DFE
_02223DD6:
	add r0, r4, #0
	bl ov07_02223D28
	cmp r0, #0
	beq _02223DFE
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _02223DFE
_02223DE8:
	ldr r0, [r4, #0x14]
	bl sub_0200D9DC
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
_02223DFE:
	ldr r0, [r4, #8]
	bl sub_0200D020
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02223DC4

	thumb_func_start ov07_02223E08
ov07_02223E08: ; 0x02223E08
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	mov r1, #0x50
	add r5, r0, #0
	str r2, [sp]
	add r6, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4]
	ldr r0, [sp]
	str r7, [r4, #4]
	str r0, [r4, #8]
	str r6, [r4, #0x14]
	add r0, r6, #0
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [r4, #0x14]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #4
	str r0, [r4, #0x44]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	str r0, [r4, #0x3c]
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	mov r1, #0
	add r5, r0, #0
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0x4c
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #1
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0x4e
	strh r0, [r1]
	ldr r0, [r4]
	ldr r1, _02223E90 ; =ov07_02223DC4
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02223E90: .word ov07_02223DC4
	thumb_func_end ov07_02223E08

	thumb_func_start ov07_02223E94
ov07_02223E94: ; 0x02223E94
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	bl sub_02003B44
	cmp r0, #0
	bne _02223EB2
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
_02223EB2:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02223E94

	thumb_func_start ov07_02223EB4
ov07_02223EB4: ; 0x02223EB4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r1, #8
	add r5, r0, #0
	bl ov07_022324D8
	add r6, r0, #0
	str r5, [r6]
	add r0, r5, #0
	bl ov07_0221FA78
	str r0, [r6, #4]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	cmp r0, #0
	beq _02223EE2
	cmp r0, #1
	beq _02223EEE
	cmp r0, #2
	beq _02223EF4
	b _02223EFA
_02223EE2:
	add r0, r5, #0
	bl ov07_0221E6C8
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	b _02223EFE
_02223EEE:
	mov r4, #1
	lsl r4, r4, #8
	b _02223EFE
_02223EF4:
	mov r4, #2
	lsl r4, r4, #8
	b _02223EFE
_02223EFA:
	bl GF_AssertFail
_02223EFE:
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [sp, #0x10]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	ldr r1, [sp, #0xc]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	ldr r1, [sp, #0x10]
	lsl r3, r7, #0x18
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	str r1, [sp, #4]
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r6, #4]
	mov r1, #1
	add r2, r4, #0
	asr r3, r3, #0x18
	bl sub_02003370
	ldr r0, [r6]
	ldr r1, _02223F58 ; =ov07_02223E94
	add r2, r6, #0
	bl ov07_0221C410
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02223F58: .word ov07_02223E94
	thumb_func_end ov07_02223EB4

	thumb_func_start ov07_02223F5C
ov07_02223F5C: ; 0x02223F5C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #5
	bhi _02224004
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02223F74: ; jump table
	.short _02223F80 - _02223F74 - 2 ; case 0
	.short _02223F98 - _02223F74 - 2 ; case 1
	.short _02223FAA - _02223F74 - 2 ; case 2
	.short _02223FBC - _02223F74 - 2 ; case 3
	.short _02223FD4 - _02223F74 - 2 ; case 4
	.short _02223FF6 - _02223F74 - 2 ; case 5
_02223F80:
	ldr r0, [r4, #0x14]
	mov r1, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r2, [r4, #0x18]
	ldr r3, [r4, #0x10]
	bl sub_020090B4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_02223F98:
	ldr r0, [r4, #4]
	bl sub_02009138
	cmp r0, #0
	bne _02224004
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_02223FAA:
	ldr r1, [r4, #0x1c]
	cmp r1, #0
	bne _02223FB6
	add r0, r0, #1
	str r0, [r4, #8]
	b _02223FBC
_02223FB6:
	sub r0, r1, #1
	str r0, [r4, #0x1c]
	pop {r3, r4, r5, pc}
_02223FBC:
	ldr r0, [r4, #0x14]
	mov r2, #0
	str r0, [sp]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x18]
	ldr r3, [r4, #0x10]
	bl sub_020090B4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_02223FD4:
	ldr r0, [r4, #4]
	bl sub_02009138
	cmp r0, #0
	bne _02224004
	ldr r0, [r4, #0xc]
	sub r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0
	bgt _02223FF0
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_02223FF0:
	mov r0, #0
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
_02223FF6:
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
_02224004:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02223F5C

	thumb_func_start ov07_02224008
ov07_02224008: ; 0x02224008
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x20
	add r4, r0, #0
	bl ov07_022324D8
	add r6, r0, #0
	str r4, [r6]
	mov r1, #0
	add r0, r4, #0
	str r1, [r6, #4]
	bl ov07_0221C4A8
	ldr r2, _022241D0 ; =0x00000802
	cmp r0, r2
	bgt _02224042
	bge _022240C8
	cmp r0, #8
	bgt _0222403C
	cmp r0, #2
	blt _0222403A
	beq _0222405A
	cmp r0, #4
	beq _0222406C
	cmp r0, #8
	beq _02224092
_0222403A:
	b _02224180
_0222403C:
	cmp r0, #0x10
	beq _022240A4
	b _02224180
_02224042:
	add r1, r2, #6
	cmp r0, r1
	bgt _02224052
	bge _02224124
	add r1, r2, #2
	cmp r0, r1
	beq _022240F8
	b _02224180
_02224052:
	add r2, #0xe
	cmp r0, r2
	beq _02224154
	b _02224180
_0222405A:
	add r0, r4, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_0222406C:
	add r0, r4, #0
	bl ov07_0221FAB0
	cmp r0, #1
	beq _02224078
	b _02224184
_02224078:
	ldr r0, [r6]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_0223197C
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_02224092:
	add r0, r4, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_022240A4:
	add r0, r4, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02224184
	ldr r0, [r6]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_0223197C
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_022240C8:
	mov r7, #0xff
	mov r5, #0
_022240CC:
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #0
	beq _022240DC
	cmp r0, #2
	bne _022240E0
_022240DC:
	add r7, r5, #0
	b _022240E6
_022240E0:
	add r5, r5, #1
	cmp r5, #4
	blt _022240CC
_022240E6:
	cmp r7, #0xff
	bne _022240EC
	mov r7, #0
_022240EC:
	ldr r0, [r6]
	add r1, r7, #0
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_022240F8:
	mov r7, #0xff
	mov r5, #0
_022240FC:
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #4
	bne _0222410C
	add r7, r5, #0
	b _02224112
_0222410C:
	add r5, r5, #1
	cmp r5, #4
	blt _022240FC
_02224112:
	cmp r7, #0xff
	bne _02224118
	mov r7, #0
_02224118:
	ldr r0, [r6]
	add r1, r7, #0
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_02224124:
	mov r7, #0xff
	mov r5, #0
_02224128:
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #1
	beq _02224138
	cmp r0, #3
	bne _0222413C
_02224138:
	add r7, r5, #0
	b _02224142
_0222413C:
	add r5, r5, #1
	cmp r5, #4
	blt _02224128
_02224142:
	cmp r7, #0xff
	bne _02224148
	mov r7, #0
_02224148:
	ldr r0, [r6]
	add r1, r7, #0
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_02224154:
	mov r7, #0xff
	mov r5, #0
_02224158:
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_0221FA04
	cmp r0, #5
	bne _02224168
	add r7, r5, #0
	b _0222416E
_02224168:
	add r5, r5, #1
	cmp r5, #4
	blt _02224158
_0222416E:
	cmp r7, #0xff
	bne _02224174
	mov r7, #0
_02224174:
	ldr r0, [r6]
	add r1, r7, #0
	bl ov07_0221FA48
	str r0, [r6, #4]
	b _02224184
_02224180:
	bl GF_AssertFail
_02224184:
	ldr r0, [r6, #4]
	cmp r0, #0
	bne _02224192
	add r0, r6, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_02224192:
	add r0, r4, #0
	mov r1, #1
	bl ov07_0221C4A8
	str r0, [r6, #0x10]
	add r0, r4, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [r6, #0xc]
	add r0, r4, #0
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [r6, #0x14]
	add r0, r4, #0
	mov r1, #4
	bl ov07_0221C4A8
	str r0, [r6, #0x18]
	add r0, r4, #0
	mov r1, #5
	bl ov07_0221C4A8
	str r0, [r6, #0x1c]
	ldr r0, [r6]
	ldr r1, _022241D4 ; =ov07_02223F5C
	add r2, r6, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022241D0: .word 0x00000802
_022241D4: .word ov07_02223F5C
	thumb_func_end ov07_02224008

	thumb_func_start ov07_022241D8
ov07_022241D8: ; 0x022241D8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #4
	bls _022241E8
	b _0222433C
_022241E8:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022241F4: ; jump table
	.short _022241FE - _022241F4 - 2 ; case 0
	.short _0222424C - _022241F4 - 2 ; case 1
	.short _0222429E - _022241F4 - 2 ; case 2
	.short _022242C8 - _022241F4 - 2 ; case 3
	.short _0222432A - _022241F4 - 2 ; case 4
_022241FE:
	ldr r0, [r4, #0x4c]
	asr r0, r0, #0x10
	str r0, [sp]
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x40]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r0, #0x14
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222508
	add r0, r4, #0
	add r0, #0x14
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x50]
	cmp r0, #1
	bne _0222423A
	ldr r1, [sp, #8]
	mov r0, #0
	bl _fsub
	str r0, [sp, #8]
_0222423A:
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	bl sub_0200E024
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0222433C
_0222424C:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222558
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x14
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x50]
	cmp r0, #1
	bne _02224272
	ldr r1, [sp, #8]
	mov r0, #0
	bl _fsub
	str r0, [sp, #8]
_02224272:
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	bl sub_0200E024
	cmp r5, #0
	beq _02224296
	mov r0, #0
	str r0, [sp]
	mov r1, #0xc
	mov r2, #0xe
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r3, [r4, #0x28]
	bl ov07_022226FC
	b _0222433C
_02224296:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0222433C
_0222429E:
	ldr r0, [r4, #0x4c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	ldr r3, [r4, #0x3c]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r0, #0x14
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222508
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0222433C
_022242C8:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222558
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x14
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x50]
	cmp r0, #1
	bne _022242EE
	ldr r1, [sp, #8]
	mov r0, #0
	bl _fsub
	str r0, [sp, #8]
_022242EE:
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	bl sub_0200E024
	cmp r5, #0
	beq _02224312
	mov r0, #0
	str r0, [sp]
	mov r1, #0xc
	mov r2, #0xe
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r3, [r4, #0x28]
	bl ov07_022226FC
	b _0222433C
_02224312:
	ldr r0, [r4, #0x48]
	sub r0, r0, #1
	str r0, [r4, #0x48]
	cmp r0, #0
	bgt _02224324
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0222433C
_02224324:
	mov r0, #0
	str r0, [r4, #8]
	b _0222433C
_0222432A:
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add sp, #0xc
	pop {r4, r5, pc}
_0222433C:
	ldr r0, [r4, #4]
	bl sub_0200D020
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_022241D8

	thumb_func_start ov07_02224348
ov07_02224348: ; 0x02224348
	push {r4, r5, r6, lr}
	mov r1, #0x54
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4]
	add r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	cmp r0, #0
	bne _0222438A
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	add r6, r0, #0
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
	b _022243A8
_0222438A:
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	add r6, r0, #0
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
_022243A8:
	strh r0, [r4, #0xe]
	add r0, r6, #0
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0xc]
	add r0, r6, #0
	mov r1, #0x29
	bl sub_02008A78
	mov r1, #0xc
	ldrsh r1, [r4, r1]
	sub r0, r1, r0
	strh r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	str r0, [r4, #0x38]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #0x3c]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #0x40]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	str r0, [r4, #0x44]
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	str r0, [r4, #0x48]
	add r0, r5, #0
	mov r1, #6
	bl ov07_0221C4A8
	str r0, [r4, #0x4c]
	add r0, r5, #0
	mov r1, #7
	bl ov07_0221C4A8
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221C4E8
	str r0, [r4, #0x10]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #0x10]
	mov r1, #2
	bl sub_0200DF98
	ldr r1, [r4, #0x38]
	mov r2, #0x10
	ldr r0, [r4]
	sub r2, r2, r1
	bl ov07_02231E08
	ldr r0, [r4]
	ldr r1, _02224468 ; =ov07_022241D8
	add r2, r4, #0
	bl ov07_0221C410
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	cmp r0, #0
	beq _02224456
	mov r1, #1
	b _02224458
_02224456:
	mov r1, #0
_02224458:
	ldr r0, [r4]
	bl ov07_0221FB78
	cmp r0, #1
	bne _02224466
	mov r0, #1
	str r0, [r4, #0x50]
_02224466:
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02224468: .word ov07_022241D8
	thumb_func_end ov07_02224348

	thumb_func_start ov07_0222446C
ov07_0222446C: ; 0x0222446C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #5
	bls _0222447C
	b _022245B8
_0222447C:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02224488: ; jump table
	.short _02224494 - _02224488 - 2 ; case 0
	.short _022244D8 - _02224488 - 2 ; case 1
	.short _02224508 - _02224488 - 2 ; case 2
	.short _0222451C - _02224488 - 2 ; case 3
	.short _02224562 - _02224488 - 2 ; case 4
	.short _022245A4 - _02224488 - 2 ; case 5
_02224494:
	ldr r0, [r4, #0x40]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x44]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #0x4c]
	asr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r1, [r4, #0x34]
	ldr r2, [r4, #0x38]
	ldr r3, [r4, #0x3c]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r0, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222590
	add r0, r4, #0
	ldr r1, [r4, #0xc]
	add r0, #0x10
	bl ov07_02222768
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_022244D8:
	add r0, r4, #0
	ldr r1, [r4, #0xc]
	add r0, #0x10
	bl ov07_02222788
	cmp r0, #0
	beq _022244FE
	mov r0, #0
	str r0, [sp]
	mov r1, #8
	mov r2, #0xa
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	bl ov07_022226C4
	add sp, #0xc
	pop {r4, r5, pc}
_022244FE:
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_02224508:
	ldr r1, [r4, #0x50]
	cmp r1, #0
	bne _02224514
	add r0, r0, #1
	str r0, [r4, #4]
	b _0222451C
_02224514:
	sub r0, r1, #1
	add sp, #0xc
	str r0, [r4, #0x50]
	pop {r4, r5, pc}
_0222451C:
	ldr r0, [r4, #0x3c]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x44]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #0x4c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x40]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r0, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222590
	add r0, r4, #0
	ldr r1, [r4, #0xc]
	add r0, #0x10
	bl ov07_02222788
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_02224562:
	add r0, r4, #0
	ldr r1, [r4, #0xc]
	add r0, #0x10
	bl ov07_02222788
	cmp r0, #0
	beq _02224588
	mov r0, #0
	str r0, [sp]
	mov r1, #8
	mov r2, #0xa
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	bl ov07_022226C4
	add sp, #0xc
	pop {r4, r5, pc}
_02224588:
	ldr r0, [r4, #0x48]
	sub r0, r0, #1
	str r0, [r4, #0x48]
	cmp r0, #0
	bgt _0222459C
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_0222459C:
	mov r0, #0
	add sp, #0xc
	str r0, [r4, #4]
	pop {r4, r5, pc}
_022245A4:
	ldr r0, [r4, #0xc]
	bl ov07_02223224
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
_022245B8:
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_0222446C

	thumb_func_start ov07_022245BC
ov07_022245BC: ; 0x022245BC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x54
	add r5, r0, #0
	mov r1, #0x54
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	str r5, [r4]
	bl ov07_0221C4A8
	ldr r2, _022247C0 ; =0x00000802
	cmp r0, r2
	bgt _02224600
	bge _0222466C
	mov r2, #0x42
	lsl r2, r2, #2
	cmp r0, r2
	bgt _022245F8
	sub r1, r2, #6
	cmp r0, r1
	blt _022245F6
	beq _02224618
	sub r1, r2, #4
	cmp r0, r1
	beq _02224618
	cmp r0, r2
	beq _02224642
_022245F6:
	b _02224722
_022245F8:
	add r2, #8
	cmp r0, r2
	beq _02224642
	b _02224722
_02224600:
	add r1, r2, #6
	cmp r0, r1
	bgt _02224610
	bge _022246C8
	add r1, r2, #2
	cmp r0, r1
	beq _0222469C
	b _02224722
_02224610:
	add r2, #0xe
	cmp r0, r2
	beq _022246F8
	b _02224722
_02224618:
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
	strh r0, [r4, #0xa]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r1, r0, #0
	ldr r0, [r4]
	add r2, sp, #4
	add r3, sp, #0
	bl ov07_02232020
	ldr r0, [sp, #0xc]
	str r0, [r4, #0xc]
	b _02224722
_02224642:
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
	strh r0, [r4, #0xa]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r1, r0, #0
	ldr r0, [r4]
	add r2, sp, #4
	add r3, sp, #0
	bl ov07_02232020
	ldr r0, [sp, #0xc]
	str r0, [r4, #0xc]
	b _02224722
_0222466C:
	mov r7, #0xff
	mov r6, #0
_02224670:
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FA04
	cmp r0, #0
	beq _02224680
	cmp r0, #2
	bne _02224684
_02224680:
	add r7, r6, #0
	b _0222468A
_02224684:
	add r6, r6, #1
	cmp r6, #4
	blt _02224670
_0222468A:
	cmp r7, #0xff
	bne _02224690
	mov r7, #0
_02224690:
	ldr r0, [r4]
	add r1, r7, #0
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	b _02224722
_0222469C:
	mov r7, #0xff
	mov r6, #0
_022246A0:
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FA04
	cmp r0, #4
	bne _022246B0
	add r7, r6, #0
	b _022246B6
_022246B0:
	add r6, r6, #1
	cmp r6, #4
	blt _022246A0
_022246B6:
	cmp r7, #0xff
	bne _022246BC
	mov r7, #0
_022246BC:
	ldr r0, [r4]
	add r1, r7, #0
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	b _02224722
_022246C8:
	mov r7, #0xff
	mov r6, #0
_022246CC:
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FA04
	cmp r0, #1
	beq _022246DC
	cmp r0, #3
	bne _022246E0
_022246DC:
	add r7, r6, #0
	b _022246E6
_022246E0:
	add r6, r6, #1
	cmp r6, #4
	blt _022246CC
_022246E6:
	cmp r7, #0xff
	bne _022246EC
	mov r7, #0
_022246EC:
	ldr r0, [r4]
	add r1, r7, #0
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	b _02224722
_022246F8:
	mov r7, #0xff
	mov r6, #0
_022246FC:
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FA04
	cmp r0, #5
	bne _0222470C
	add r7, r6, #0
	b _02224712
_0222470C:
	add r6, r6, #1
	cmp r6, #4
	blt _022246FC
_02224712:
	cmp r7, #0xff
	bne _02224718
	mov r7, #0
_02224718:
	ldr r0, [r4]
	add r1, r7, #0
	bl ov07_0221FA48
	str r0, [r4, #0xc]
_02224722:
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _02224732
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
_02224732:
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #8]
	ldr r0, [r4, #0xc]
	mov r1, #0x29
	bl sub_02008A78
	strh r0, [r4, #0xa]
	mov r0, #0xa
	ldrsh r0, [r4, r0]
	mov r1, #1
	add r0, #0x10
	strh r0, [r4, #0xa]
	add r0, r5, #0
	bl ov07_0221C4A8
	str r0, [r4, #0x34]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #0x38]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #0x3c]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	str r0, [r4, #0x40]
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	str r0, [r4, #0x44]
	add r0, r5, #0
	mov r1, #6
	bl ov07_0221C4A8
	str r0, [r4, #0x48]
	add r0, r5, #0
	mov r1, #7
	bl ov07_0221C4A8
	str r0, [r4, #0x4c]
	add r0, r5, #0
	mov r1, #6
	bl ov07_0221C4A8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [r4, #0x48]
	add r0, r5, #0
	mov r1, #6
	bl ov07_0221C4A8
	asr r0, r0, #0x10
	str r0, [r4, #0x50]
	ldr r0, [r4]
	ldr r1, _022247C4 ; =ov07_0222446C
	add r2, r4, #0
	bl ov07_0221C410
	add r1, r4, #0
	bl ov07_0222446C
	add sp, #0x54
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022247C0: .word 0x00000802
_022247C4: .word ov07_0222446C
	thumb_func_end ov07_022245BC

	thumb_func_start ov07_022247C8
ov07_022247C8: ; 0x022247C8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	add r0, #8
	bl ov07_02222AF4
	cmp r0, #0
	beq _022247EA
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	pop {r3, r4, r5, pc}
_022247EA:
	ldr r0, [r4, #4]
	bl sub_0200D020
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_022247C8

	thumb_func_start ov07_022247F4
ov07_022247F4: ; 0x022247F4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r1, #0x30
	add r7, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r7, [r4]
	add r0, r7, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	add r0, r7, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r6, r0, #0
	mov r5, #0
_02224818:
	mov r0, #1
	lsl r0, r5
	tst r0, r6
	beq _0222482E
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C4E8
	mov r1, #1
	bl sub_0200E0FC
_0222482E:
	add r5, r5, #1
	cmp r5, #4
	blt _02224818
	add r0, r7, #0
	mov r1, #1
	bl ov07_0221C4A8
	add r5, r0, #0
	add r0, r7, #0
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [sp, #8]
	ldr r0, [r4]
	ldr r2, [sp, #8]
	add r1, r5, #0
	bl ov07_02231E08
	add r0, r7, #0
	mov r1, #2
	bl ov07_0221C4A8
	add r6, r0, #0
	add r0, r7, #0
	mov r1, #4
	bl ov07_0221C4A8
	str r0, [sp, #0xc]
	add r0, r7, #0
	mov r1, #5
	bl ov07_0221C4A8
	ldr r1, [sp, #0xc]
	ldr r3, [sp, #8]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	str r1, [sp]
	str r0, [sp, #4]
	add r0, r4, #0
	lsl r1, r5, #0x10
	lsl r2, r6, #0x10
	lsl r3, r3, #0x10
	add r0, #8
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222AC4
	ldr r0, [r4]
	ldr r1, _0222489C ; =ov07_022247C8
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222489C: .word ov07_022247C8
	thumb_func_end ov07_022247F4

	thumb_func_start ov07_022248A0
ov07_022248A0: ; 0x022248A0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	mov r1, #1
	bl ov07_0221C4A8
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r1, r0, #0
	add r0, r6, #0
	add r2, sp, #4
	add r3, sp, #0
	bl ov07_02232020
	ldr r0, [sp]
	mov r4, #0
	cmp r0, #0
	ble _022248EE
	mov r7, #6
_022248CC:
	ldr r1, [sp, #0x14]
	add r0, r6, #0
	bl ov07_0221FAC8
	cmp r0, #1
	bne _022248DC
	cmp r5, #0
	beq _022248E6
_022248DC:
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	add r2, r5, #0
	bl sub_020087A4
_022248E6:
	ldr r0, [sp]
	add r4, r4, #1
	cmp r4, r0
	blt _022248CC
_022248EE:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_022248A0

	thumb_func_start ov07_022248F4
ov07_022248F4: ; 0x022248F4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r4, #8]
	cmp r1, r0
	blt _02224942
	ldr r0, [r4]
	cmp r0, #0
	ldr r0, [r4, #0x14]
	bne _02224922
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4, #0x3c]
	add r1, r5, #0
	bl ov07_0221C448
	pop {r3, r4, r5, pc}
_02224922:
	mov r1, #6
	bl sub_02008A78
	add r3, r0, #0
	mov r2, #1
	ldr r0, [r4, #0x14]
	mov r1, #6
	eor r2, r3
	bl sub_020087A4
	ldr r0, [r4]
	sub r0, r0, #1
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_02224942:
	add r0, r1, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022248F4

	thumb_func_start ov07_02224948
ov07_02224948: ; 0x02224948
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0x40
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	str r5, [r4, #0x3c]
	bl ov07_0221C4A8
	lsl r0, r0, #1
	str r0, [r4]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	add r1, r4, #0
	str r0, [r4, #8]
	add r0, r5, #0
	add r1, #0x20
	bl ov07_02231FE4
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0221FA48
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x3c]
	ldr r1, _02224994 ; =ov07_022248F4
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_02224994: .word ov07_022248F4
	thumb_func_end ov07_02224948

	thumb_func_start ov07_02224998
ov07_02224998: ; 0x02224998
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	beq _022249B0
	cmp r0, #1
	beq _022249E4
	b _02224A0E
_022249B0:
	mov r0, #0x16
	ldrsh r3, [r4, r0]
	mov r0, #0x14
	ldrsh r1, [r4, r0]
	mov r2, #0xc
	str r3, [sp]
	ldr r0, [r4, #8]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	ldrsh r2, [r4, r2]
	add r0, r4, #0
	add r0, #0x40
	add r2, r1, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov07_02222268
	add r0, r4, #0
	add r0, #0x24
	ldrb r0, [r0]
	add r4, #0x24
	add sp, #8
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_022249E4:
	add r0, r4, #0
	add r0, #0x40
	bl ov07_022222B4
	cmp r0, #0
	bne _022249FE
	add r0, r4, #0
	add r0, #0x24
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x24
	strb r1, [r0]
_022249FE:
	mov r2, #0x40
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl sub_020087A4
	add sp, #8
	pop {r4, pc}
_02224A0E:
	ldr r0, [r4, #0x64]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_02224998

	thumb_func_start ov07_02224A20
ov07_02224A20: ; 0x02224A20
	push {r4, r5, r6, lr}
	mov r1, #0x68
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4, #0x64]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	mov r6, #0xff
	add r1, r6, #0
	add r1, #9
	cmp r0, r1
	bgt _02224A6C
	add r1, r6, #3
	cmp r0, r1
	blt _02224AC2
	beq _02224A76
	add r1, r6, #5
	cmp r0, r1
	beq _02224A80
	add r1, r6, #0
	add r1, #9
	cmp r0, r1
	beq _02224A9C
	b _02224AC2
_02224A6C:
	add r1, r6, #0
	add r1, #0x11
	cmp r0, r1
	beq _02224AA6
	b _02224AC2
_02224A76:
	add r0, r5, #0
	bl ov07_0221C468
	add r6, r0, #0
	b _02224AC6
_02224A80:
	add r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02224AC6
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	add r6, r0, #0
	b _02224AC6
_02224A9C:
	add r0, r5, #0
	bl ov07_0221C470
	add r6, r0, #0
	b _02224AC6
_02224AA6:
	add r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02224AC6
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	add r6, r0, #0
	b _02224AC6
_02224AC2:
	bl GF_AssertFail
_02224AC6:
	cmp r6, #0xff
	bne _02224AD2
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
_02224AD2:
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x24
	bl ov07_02231FE4
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FA48
	add r1, r4, #0
	add r1, #0x14
	str r0, [r4, #0x18]
	bl ov07_02231FA0
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_02222004
	cmp r0, #0
	bgt _02224B04
	mov r0, #0xc
	ldrsh r1, [r4, r0]
	sub r0, #0xd
	mul r0, r1
	strh r0, [r4, #0xc]
_02224B04:
	ldr r0, [r4, #0x64]
	ldr r1, _02224B10 ; =ov07_02224998
	add r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02224B10: .word ov07_02224998
	thumb_func_end ov07_02224A20

	thumb_func_start ov07_02224B14
ov07_02224B14: ; 0x02224B14
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _02224B2C
	cmp r0, #1
	beq _02224B6E
	b _02224B98
_02224B2C:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _02224B3C
	mov r0, #0xff
	add r4, #0x20
	add sp, #8
	strb r0, [r4]
	pop {r4, pc}
_02224B3C:
	mov r0, #0x12
	ldrsh r3, [r4, r0]
	mov r0, #0x10
	ldrsh r1, [r4, r0]
	mov r2, #0x64
	str r3, [sp]
	ldr r0, [r4, #8]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	ldrsh r2, [r4, r2]
	add r0, r4, #0
	add r0, #0x3c
	add r2, r1, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov07_02222268
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x20
	strb r1, [r0]
_02224B6E:
	add r0, r4, #0
	add r0, #0x3c
	bl ov07_022222B4
	cmp r0, #0
	bne _02224B88
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x20
	strb r1, [r0]
_02224B88:
	mov r2, #0x3c
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_020087A4
	add sp, #8
	pop {r4, pc}
_02224B98:
	ldr r0, [r4, #0x60]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02224B14

	thumb_func_start ov07_02224BAC
ov07_02224BAC: ; 0x02224BAC
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x68
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4, #0x60]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	add r1, r4, #0
	add r1, #0x64
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	add r1, r4, #0
	add r7, r0, #0
	add r0, r5, #0
	add r1, #0x20
	bl ov07_02231FE4
	mov r6, #0xff
	add r0, r6, #0
	add r0, #9
	cmp r7, r0
	bgt _02224C08
	add r0, r6, #3
	cmp r7, r0
	blt _02224C5E
	beq _02224C12
	add r0, r6, #5
	cmp r7, r0
	beq _02224C1C
	add r0, r6, #0
	add r0, #9
	cmp r7, r0
	beq _02224C38
	b _02224C5E
_02224C08:
	add r0, r6, #0
	add r0, #0x11
	cmp r7, r0
	beq _02224C42
	b _02224C5E
_02224C12:
	add r0, r5, #0
	bl ov07_0221C468
	add r6, r0, #0
	b _02224C62
_02224C1C:
	add r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02224C62
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	add r6, r0, #0
	b _02224C62
_02224C38:
	add r0, r5, #0
	bl ov07_0221C470
	add r6, r0, #0
	b _02224C62
_02224C42:
	add r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02224C62
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	add r6, r0, #0
	b _02224C62
_02224C5E:
	bl GF_AssertFail
_02224C62:
	cmp r6, #0xff
	bne _02224C6E
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_02224C6E:
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FA48
	add r1, r4, #0
	add r1, #0x10
	str r0, [r4, #0x14]
	bl ov07_02231FA0
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_02222004
	cmp r0, #0
	bgt _02224C9C
	mov r0, #0x64
	ldrsh r1, [r4, r0]
	sub r0, #0x65
	add r2, r1, #0
	mul r2, r0
	add r0, r4, #0
	add r0, #0x64
	strh r2, [r0]
_02224C9C:
	add r0, r5, #0
	bl ov07_0221BFC0
	ldr r0, [r4, #0x60]
	ldr r1, _02224CB4 ; =ov07_02224B14
	add r2, r4, #0
	bl ov07_0221C410
	add r1, r4, #0
	bl ov07_02224B14
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02224CB4: .word ov07_02224B14
	thumb_func_end ov07_02224BAC

	thumb_func_start ov07_02224CB8
ov07_02224CB8: ; 0x02224CB8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bls _02224CC8
	b _02224E46
_02224CC8:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02224CD4: ; jump table
	.short _02224CDC - _02224CD4 - 2 ; case 0
	.short _02224D3E - _02224CD4 - 2 ; case 1
	.short _02224D88 - _02224CD4 - 2 ; case 2
	.short _02224DD6 - _02224CD4 - 2 ; case 3
_02224CDC:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	bne _02224D34
	add r0, r4, #0
	add r0, #0x38
	bl ov07_022227D8
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0xd
	bl sub_020087A4
	mov r2, #0x38
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_02008C2C
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02224D34:
	ldrb r0, [r4]
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02224D3E:
	ldrb r0, [r4, #9]
	add r0, r0, #1
	strb r0, [r4, #9]
	ldrb r1, [r4, #9]
	ldrb r0, [r4, #0xa]
	cmp r1, r0
	bhi _02224D4E
	b _02224E54
_02224D4E:
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ov07_0221C4A8
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl ov07_0221C4A8
	add r6, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [sp]
	add r0, r4, #0
	lsl r1, r5, #0x10
	lsl r3, r6, #0x10
	add r0, #0x14
	asr r1, r1, #0x10
	mov r2, #0x64
	asr r3, r3, #0x10
	bl ov07_02222508
	ldrb r0, [r4]
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02224D88:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	bne _02224DCC
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02224DCC:
	ldrb r0, [r4]
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02224DD6:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	ldr r0, [r4, #0x10]
	bne _02224E1A
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02224E1A:
	mov r1, #0xc
	add r2, r1, #0
	add r2, #0xf4
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #0x10]
	add r2, #0xf3
	bl sub_020087A4
	mov r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_020087A4
	ldrb r0, [r4]
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02224E46:
	ldr r0, [r4, #0xc]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_02224E54:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov07_02224CB8

	thumb_func_start ov07_02224E58
ov07_02224E58: ; 0x02224E58
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0x5c
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4, #8]
	strb r0, [r4]
	str r5, [r4, #0xc]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	mov r0, #0
	strb r0, [r4, #9]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	strb r0, [r4, #0xa]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #2]
	ldr r0, [r4, #0xc]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FAA0
	str r0, [r4, #4]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x64
	lsl r3, r6, #0x10
	add r0, #0x14
	add r2, r1, #0
	asr r3, r3, #0x10
	bl ov07_02222508
	mov r0, #0xa
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0
	add r0, #0x38
	mov r1, #2
	add r3, r2, #0
	bl ov07_022227A8
	ldr r0, [r4, #0xc]
	ldr r1, _02224EF0 ; =ov07_02224CB8
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02224EF0: .word ov07_02224CB8
	thumb_func_end ov07_02224E58

	thumb_func_start ov07_02224EF4
ov07_02224EF4: ; 0x02224EF4
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bls _02224F04
	b _02225084
_02224F04:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02224F10: ; jump table
	.short _02224F18 - _02224F10 - 2 ; case 0
	.short _02224F7A - _02224F10 - 2 ; case 1
	.short _02224FC6 - _02224F10 - 2 ; case 2
	.short _02225014 - _02224F10 - 2 ; case 3
_02224F18:
	add r0, r4, #0
	add r0, #0x20
	bl ov07_0222260C
	cmp r0, #1
	bne _02224F70
	add r0, r4, #0
	add r0, #0x44
	bl ov07_022227D8
	mov r2, #0x20
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x22
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #0xd
	bl sub_020087A4
	mov r2, #0x44
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_02008C2C
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x34]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_02224F70:
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02224F7A:
	ldrb r0, [r4, #9]
	add r0, r0, #1
	strb r0, [r4, #9]
	ldrb r1, [r4, #9]
	ldrb r0, [r4, #0xa]
	cmp r1, r0
	bhi _02224F8A
	b _02225092
_02224F8A:
	ldr r3, [r4, #0x10]
	ldr r2, [r4, #0xc]
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	asr r1, r2, #0x10
	mov r0, #0x64
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	asr r3, r3, #0x10
	str r0, [sp, #8]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r0, #0x20
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222590
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02224FC6:
	add r0, r4, #0
	add r0, #0x20
	bl ov07_0222260C
	cmp r0, #1
	bne _0222500A
	mov r2, #0x20
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x22
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x34]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_0222500A:
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02225014:
	add r0, r4, #0
	add r0, #0x20
	bl ov07_0222260C
	cmp r0, #1
	ldr r0, [r4, #0x1c]
	bne _02225058
	mov r2, #0x20
	ldrsh r2, [r4, r2]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x22
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x34]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_02225058:
	mov r1, #0xc
	add r2, r1, #0
	add r2, #0xf4
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #0x1c]
	add r2, #0xf3
	bl sub_020087A4
	mov r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #1
	bl sub_020087A4
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02225084:
	ldr r0, [r4, #0x18]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_02225092:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02224EF4

	thumb_func_start ov07_02225098
ov07_02225098: ; 0x02225098
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0x68
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4, #8]
	strb r0, [r4]
	str r5, [r4, #0x18]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0x18]
	bl ov07_0221FA48
	str r0, [r4, #0x1c]
	mov r0, #0
	strb r0, [r4, #9]
	add r0, r5, #0
	mov r1, #6
	bl ov07_0221C4A8
	strb r0, [r4, #0xa]
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x18]
	mov r1, #4
	bl ov07_0221C4A8
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x18]
	mov r1, #5
	bl ov07_0221C4A8
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x18]
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	add r3, r4, #2
	bl ov07_02221F38
	ldr r0, [r4, #0x18]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0x18]
	bl ov07_0221FAA0
	str r0, [r4, #4]
	mov r1, #2
	ldrsh r1, [r4, r1]
	add r0, r1, r0
	strh r0, [r4, #2]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	asr r0, r0, #0x10
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x10]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	asr r0, r0, #0x10
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r6, [sp]
	mov r1, #0x64
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	ldr r1, [sp, #0x10]
	ldr r3, [sp, #0xc]
	add r0, #0x20
	add r2, r7, #0
	bl ov07_02222590
	mov r0, #0xa
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0
	add r0, #0x44
	mov r1, #2
	add r3, r2, #0
	bl ov07_022227A8
	ldr r0, [r4, #0x18]
	ldr r1, _02225198 ; =ov07_02224EF4
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02225198: .word ov07_02224EF4
	thumb_func_end ov07_02225098

	thumb_func_start ov07_0222519C
ov07_0222519C: ; 0x0222519C
	push {r3, r4, r5, lr}
	mov r2, #1
	lsl r2, r2, #0x1a
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r2]
	ldr r0, _022251C8 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	ldr r0, [r4, #8]
	mov r1, #2
	bl ov07_0221EC7C
	ldr r0, [r4, #8]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	nop
_022251C8: .word 0xFFFF1FFF
	thumb_func_end ov07_0222519C

	thumb_func_start ov07_022251CC
ov07_022251CC: ; 0x022251CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0x28
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r0, r5, #0
	add r1, r4, #4
	bl ov07_02231FE4
	ldr r0, [r4, #8]
	mov r1, #2
	bl ov07_0221EB98
	ldr r0, [r4, #8]
	mov r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x24]
	mov r1, #2
	bl sub_0200E0FC
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl sub_0200DF98
	ldr r1, _0222524C ; =0x3F99999A
	ldr r0, [r4, #0x24]
	add r2, r1, #0
	bl sub_0200E024
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02225250 ; =0xFFFF1FFF
	and r2, r1
	lsr r1, r0, #0xb
	orr r1, r2
	str r1, [r0]
	add r0, #0x4a
	ldrh r2, [r0]
	mov r1, #0x3f
	bic r2, r1
	mov r1, #0x1b
	orr r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _02225254 ; =0xFFFFC0FF
	and r2, r1
	mov r1, #7
	lsl r1, r1, #8
	orr r1, r2
	strh r1, [r0]
	ldr r0, [r4, #8]
	ldr r1, _02225258 ; =ov07_0222519C
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_0222524C: .word 0x3F99999A
_02225250: .word 0xFFFF1FFF
_02225254: .word 0xFFFFC0FF
_02225258: .word ov07_0222519C
	thumb_func_end ov07_022251CC

	thumb_func_start ov07_0222525C
ov07_0222525C: ; 0x0222525C
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _02225274
	cmp r0, #1
	beq _022252B0
	b _022252E6
_02225274:
	mov r0, #0x12
	ldrsh r3, [r4, r0]
	mov r0, #0x10
	ldrsh r1, [r4, r0]
	mov r0, #0x66
	ldrsh r0, [r4, r0]
	mov r2, #0x64
	add r0, r3, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #8]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	ldrsh r2, [r4, r2]
	add r0, r4, #0
	add r0, #0x3c
	add r2, r1, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl ov07_02222268
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x20
	strb r1, [r0]
_022252B0:
	add r0, r4, #0
	add r0, #0x3c
	bl ov07_022222B4
	cmp r0, #0
	bne _022252CA
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x20
	strb r1, [r0]
_022252CA:
	mov r2, #0x3c
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x3e
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl sub_020087A4
	add sp, #8
	pop {r4, pc}
_022252E6:
	ldr r0, [r4, #0x60]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_0222525C

	thumb_func_start ov07_022252F8
ov07_022252F8: ; 0x022252F8
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x68
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4, #0x60]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #8]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	add r1, r4, #0
	add r1, #0x64
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	add r1, r4, #0
	add r1, #0x66
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	add r1, r4, #0
	add r7, r0, #0
	add r0, r5, #0
	add r1, #0x20
	bl ov07_02231FE4
	mov r6, #0xff
	add r0, r6, #0
	add r0, #9
	cmp r7, r0
	bgt _02225362
	add r0, r6, #3
	cmp r7, r0
	blt _022253B8
	beq _0222536C
	add r0, r6, #5
	cmp r7, r0
	beq _02225376
	add r0, r6, #0
	add r0, #9
	cmp r7, r0
	beq _02225392
	b _022253B8
_02225362:
	add r0, r6, #0
	add r0, #0x11
	cmp r7, r0
	beq _0222539C
	b _022253B8
_0222536C:
	add r0, r5, #0
	bl ov07_0221C468
	add r6, r0, #0
	b _022253BC
_02225376:
	add r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _022253BC
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	add r6, r0, #0
	b _022253BC
_02225392:
	add r0, r5, #0
	bl ov07_0221C470
	add r6, r0, #0
	b _022253BC
_0222539C:
	add r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _022253BC
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	add r6, r0, #0
	b _022253BC
_022253B8:
	bl GF_AssertFail
_022253BC:
	cmp r6, #0xff
	bne _022253C8
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_022253C8:
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x14]
	cmp r0, #0
	bne _022253DE
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_022253DE:
	add r1, r4, #0
	add r1, #0x10
	bl ov07_02231FA0
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_02222004
	cmp r0, #0
	bgt _02225412
	mov r0, #0x64
	ldrsh r1, [r4, r0]
	sub r0, #0x65
	add r2, r1, #0
	mul r2, r0
	add r0, r4, #0
	add r0, #0x64
	strh r2, [r0]
	mov r0, #0x66
	ldrsh r1, [r4, r0]
	sub r0, #0x67
	add r2, r1, #0
	mul r2, r0
	add r0, r4, #0
	add r0, #0x66
	strh r2, [r0]
_02225412:
	add r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _0222542C
	mov r0, #0x66
	ldrsh r1, [r4, r0]
	sub r0, #0x67
	add r2, r1, #0
	mul r2, r0
	add r0, r4, #0
	add r0, #0x66
	strh r2, [r0]
_0222542C:
	ldr r0, [r4, #0x60]
	ldr r1, _02225440 ; =ov07_0222525C
	add r2, r4, #0
	bl ov07_0221C410
	add r1, r4, #0
	bl ov07_0222525C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02225440: .word ov07_0222525C
	thumb_func_end ov07_022252F8

	thumb_func_start ov07_02225444
ov07_02225444: ; 0x02225444
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x20
	mov r2, #0x22
	add r5, r0, #0
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x24]
	add r0, #0x30
	bl ov07_02222240
	cmp r0, #0
	bne _02225488
	mov r2, #0x20
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x22
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	mov r1, #1
	sub r2, #8
	bl sub_020087A4
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_02225488:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02225444

	thumb_func_start ov07_0222548C
ov07_0222548C: ; 0x0222548C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r1, #0x54
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r2, r4, #0
	add r1, r0, #0
	add r0, r5, #0
	add r2, #0x1c
	add r3, sp, #0
	bl ov07_02232020
	mov r0, #0x22
	ldrsh r0, [r4, r0]
	mov r1, #1
	add r0, #8
	strh r0, [r4, #0x22]
	add r0, r5, #0
	bl ov07_0221C4A8
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0x30
	add r1, r6, #0
	bl ov07_02222A44
	ldr r1, [r4, #0x3c]
	add r2, r4, #0
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [r4, #0x3c]
	ldr r1, [r4, #0x44]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [r4, #0x44]
	ldr r0, [r4, #4]
	ldr r1, _02225500 ; =ov07_02225444
	bl ov07_0221C410
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02225500: .word ov07_02225444
	thumb_func_end ov07_0222548C

	thumb_func_start ov07_02225504
ov07_02225504: ; 0x02225504
	push {r4, lr}
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0222553C
	add r0, r4, #0
	add r0, #0x30
	bl ov07_022222B4
	cmp r0, #0
	bne _02225522
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02225522:
	mov r2, #0x30
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x32
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	mov r1, #1
	bl sub_020087A4
	pop {r4, pc}
_0222553C:
	ldr r0, [r4, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov07_02225504

	thumb_func_start ov07_0222554C
ov07_0222554C: ; 0x0222554C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r1, #0x5c
	add r6, r0, #0
	bl ov07_022324D8
	add r5, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl ov07_02231FE4
	add r0, r6, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #1
	bl ov07_0221C4A8
	add r7, r0, #0
	cmp r4, #8
	bgt _0222558A
	cmp r4, #2
	blt _022255C8
	beq _02225590
	cmp r4, #4
	beq _0222559A
	cmp r4, #8
	beq _022255AC
	b _022255C8
_0222558A:
	cmp r4, #0x10
	beq _022255B6
	b _022255C8
_02225590:
	add r0, r6, #0
	bl ov07_0221C468
	str r0, [sp, #8]
	b _022255CC
_0222559A:
	add r0, r6, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0223197C
	str r0, [sp, #8]
	b _022255CC
_022255AC:
	add r0, r6, #0
	bl ov07_0221C470
	str r0, [sp, #8]
	b _022255CC
_022255B6:
	add r0, r6, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0223197C
	str r0, [sp, #8]
	b _022255CC
_022255C8:
	bl GF_AssertFail
_022255CC:
	add r2, r5, #0
	ldr r1, [sp, #8]
	add r0, r6, #0
	add r2, #0x54
	bl ov07_02231A50
	add r2, r5, #0
	add r0, r6, #0
	add r1, r4, #0
	add r2, #0x1c
	add r3, sp, #0xc
	bl ov07_02232020
	add r0, r5, #0
	mov r1, #0
	add r0, #0x58
	strh r1, [r0]
	add r0, r5, #0
	add r0, #0x5a
	strh r1, [r0]
	ldr r0, [r5, #4]
	ldr r1, [sp, #8]
	bl ov07_0223192C
	cmp r0, #3
	bne _02225606
	mov r1, #0x4f
	mvn r1, r1
	b _0222560A
_02225606:
	mov r1, #0x15
	lsl r1, r1, #4
_0222560A:
	add r0, r5, #0
	add r0, #0x58
	strh r1, [r0]
	mov r0, #0x22
	ldrsh r3, [r5, r0]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r3, [sp]
	str r0, [sp, #4]
	mov r1, #0x20
	mov r2, #0x58
	add r0, r5, #0
	ldrsh r1, [r5, r1]
	ldrsh r2, [r5, r2]
	add r0, #0x30
	bl ov07_02222268
	ldr r0, [r5, #4]
	ldr r1, _0222563C ; =ov07_02225504
	add r2, r5, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222563C: .word ov07_02225504
	thumb_func_end ov07_0222554C

	thumb_func_start ov07_02225640
ov07_02225640: ; 0x02225640
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r1, #0x5c
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	add r7, r0, #0
	cmp r6, #8
	bgt _02225688
	cmp r6, #2
	blt _022256C6
	beq _0222568E
	cmp r6, #4
	beq _02225698
	cmp r6, #8
	beq _022256AA
	b _022256C6
_02225688:
	cmp r6, #0x10
	beq _022256B4
	b _022256C6
_0222568E:
	add r0, r5, #0
	bl ov07_0221C468
	str r0, [sp, #8]
	b _022256CA
_02225698:
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	str r0, [sp, #8]
	b _022256CA
_022256AA:
	add r0, r5, #0
	bl ov07_0221C470
	str r0, [sp, #8]
	b _022256CA
_022256B4:
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	str r0, [sp, #8]
	b _022256CA
_022256C6:
	bl GF_AssertFail
_022256CA:
	add r2, r4, #0
	ldr r1, [sp, #8]
	add r0, r5, #0
	add r2, #0x54
	bl ov07_02231A50
	add r2, r4, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, #0x1c
	add r3, sp, #0x10
	bl ov07_02232020
	add r0, r4, #0
	mov r1, #0
	add r0, #0x58
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x5a
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldr r1, [sp, #8]
	bl ov07_0223192C
	cmp r0, #3
	bne _02225704
	mov r1, #0x4f
	mvn r1, r1
	b _02225708
_02225704:
	mov r1, #0x15
	lsl r1, r1, #4
_02225708:
	add r0, r4, #0
	add r0, #0x58
	strh r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _02225732
	mov r0, #0x22
	ldrsh r3, [r4, r0]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r3, [sp]
	str r0, [sp, #4]
	mov r1, #0x20
	mov r2, #0x58
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	add r0, #0x30
	bl ov07_02222268
	b _02225756
_02225732:
	ldr r1, [sp, #8]
	add r0, r5, #0
	mov r2, #0
	bl ov07_02221F80
	add r2, r0, #0
	mov r0, #0x22
	ldrsh r3, [r4, r0]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	str r3, [sp]
	str r0, [sp, #4]
	mov r1, #0x58
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	add r0, #0x30
	bl ov07_02222268
_02225756:
	ldr r0, [r4, #4]
	ldr r1, _02225764 ; =ov07_02225504
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02225764: .word ov07_02225504
	thumb_func_end ov07_02225640

	thumb_func_start ov07_02225768
ov07_02225768: ; 0x02225768
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	mov r1, #0
	add r5, r0, #0
	bl ov07_0221C4A8
	add r4, r0, #0
	cmp r4, #8
	bgt _0222578A
	cmp r4, #2
	blt _022257C8
	beq _02225790
	cmp r4, #4
	beq _0222579A
	cmp r4, #8
	beq _022257AC
	b _022257C8
_0222578A:
	cmp r4, #0x10
	beq _022257B6
	b _022257C8
_02225790:
	add r0, r5, #0
	bl ov07_0221C468
	add r6, r0, #0
	b _022257CC
_0222579A:
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	add r6, r0, #0
	b _022257CC
_022257AC:
	add r0, r5, #0
	bl ov07_0221C470
	add r6, r0, #0
	b _022257CC
_022257B6:
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	add r6, r0, #0
	b _022257CC
_022257C8:
	bl GF_AssertFail
_022257CC:
	add r0, r5, #0
	add r1, r6, #0
	add r2, sp, #0
	bl ov07_02231A50
	add r0, r5, #0
	add r1, r4, #0
	add r2, sp, #8
	add r3, sp, #4
	bl ov07_02232020
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FAA0
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	mov r1, #0
	add r2, sp, #0
	ldrsh r2, [r2, r1]
	ldr r0, [sp, #0x10]
	bl sub_020087A4
	add r3, sp, #0
	mov r2, #2
	ldrsh r2, [r3, r2]
	ldr r0, [sp, #0x10]
	mov r1, #1
	add r2, r2, r4
	bl sub_020087A4
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02225768

	thumb_func_start ov07_02225810
ov07_02225810: ; 0x02225810
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x30]
	bl ov07_02222EE8
	cmp r0, #0
	bne _02225834
	ldr r0, [r4, #0x30]
	bl ov07_02222EF8
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_02225834:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02225810

	thumb_func_start ov07_02225838
ov07_02225838: ; 0x02225838
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	mov r1, #0x34
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [sp, #0x1c]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [sp, #0x20]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	str r0, [sp, #0x24]
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	add r2, r4, #0
	str r0, [sp, #0x28]
	add r0, r5, #0
	add r1, r7, #0
	add r2, #0x1c
	add r3, sp, #0x2c
	bl ov07_022323FC
	ldr r0, [r4, #0x28]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	add r7, r0, #0
	add r0, r5, #0
	bl ov07_0221BFD0
	add r1, r0, #0
	mov r0, #0x10
	str r0, [sp]
	lsl r0, r6, #0x18
	asr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x1c]
	lsl r3, r7, #0x14
	lsl r0, r0, #0x18
	asr r0, r0, #0x18
	str r0, [sp, #8]
	ldr r0, [sp, #0x20]
	mov r2, #2
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x24]
	lsr r3, r3, #0x10
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x28]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
	ldr r0, _022258FC ; =0x0000044C
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x18]
	bl ov07_02222F10
	str r0, [r4, #0x30]
	ldr r0, [r4, #4]
	ldr r1, _02225900 ; =ov07_02225810
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_022258FC: .word 0x0000044C
_02225900: .word ov07_02225810
	thumb_func_end ov07_02225838

	thumb_func_start ov07_02225904
ov07_02225904: ; 0x02225904
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _02225978
	ldr r0, [r4, #0x4c]
	add r1, r0, #1
	str r1, [r4, #0x4c]
	ldr r0, [r4, #0x44]
	cmp r1, r0
	blt _0222598C
	mov r1, #0
	str r1, [r4, #0x4c]
	ldr r0, [r4, #0x48]
	cmp r0, #0
	ldr r0, [r4, #0x54]
	bne _0222593C
	cmp r0, #0
	bge _0222592E
	str r1, [r4, #0x54]
_0222592E:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _02225950
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02225950
_0222593C:
	cmp r0, #0x50
	ble _02225944
	mov r0, #0x50
	str r0, [r4, #0x54]
_02225944:
	ldr r0, [r4, #0x54]
	cmp r0, #0x50
	bne _02225950
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02225950:
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x54]
	mov r1, #0x12
	bl sub_020087A4
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	mov r1, #1
	bl sub_020087A4
	mov r0, #0x42
	ldrsh r1, [r4, r0]
	ldr r2, [r4, #0x50]
	sub r1, r2, r1
	str r1, [r4, #0x50]
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x54]
	add r0, r1, r0
	str r0, [r4, #0x54]
	pop {r3, r4, r5, pc}
_02225978:
	ldr r0, [r4, #0x24]
	bl ov07_02223224
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_0222598C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02225904

	thumb_func_start ov07_02225990
ov07_02225990: ; 0x02225990
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r1, #0x58
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r6, r0, #0
	add r2, r4, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, #0x1c
	add r3, sp, #4
	bl ov07_02232020
	cmp r6, #8
	bgt _022259D2
	cmp r6, #2
	blt _02225A10
	beq _022259D8
	cmp r6, #4
	beq _022259E2
	cmp r6, #8
	beq _022259F4
	b _02225A10
_022259D2:
	cmp r6, #0x10
	beq _022259FE
	b _02225A10
_022259D8:
	add r0, r5, #0
	bl ov07_0221C468
	add r7, r0, #0
	b _02225A14
_022259E2:
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	add r7, r0, #0
	b _02225A14
_022259F4:
	add r0, r5, #0
	bl ov07_0221C470
	add r7, r0, #0
	b _02225A14
_022259FE:
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	add r7, r0, #0
	b _02225A14
_02225A10:
	bl GF_AssertFail
_02225A14:
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	str r0, [r4, #0x48]
	cmp r0, #0
	ldr r0, [r4, #0x24]
	bne _02225A68
	mov r1, #1
	bl sub_02008A78
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x24]
	mov r1, #0x12
	bl sub_02008A78
	mov r1, #0x50
	sub r0, r1, r0
	str r0, [r4, #0x54]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	add r1, r4, #0
	add r1, #0x40
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	add r1, r4, #0
	add r1, #0x42
	strh r0, [r1]
	mov r0, #0x42
	ldrsh r1, [r4, r0]
	sub r0, #0x43
	add r2, r1, #0
	mul r2, r0
	add r0, r4, #0
	add r0, #0x42
	strh r2, [r0]
	b _02225A96
_02225A68:
	mov r1, #1
	bl sub_02008A78
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x24]
	mov r1, #0x12
	bl sub_02008A78
	str r0, [r4, #0x54]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	add r1, r4, #0
	add r1, #0x40
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	add r1, r4, #0
	add r1, #0x42
	strh r0, [r1]
_02225A96:
	mov r0, #0
	str r0, [r4, #0x30]
	str r0, [r4, #0x34]
	mov r0, #0x50
	str r0, [r4, #0x38]
	add r0, r5, #0
	add r1, r7, #0
	bl ov07_0221FAA0
	mov r1, #0x50
	sub r0, r1, r0
	str r0, [r4, #0x3c]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	str r0, [r4, #0x44]
	mov r0, #0
	str r0, [r4, #0x4c]
	ldr r0, [r4, #0x3c]
	str r0, [sp]
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x34]
	ldr r3, [r4, #0x38]
	bl sub_0200908C
	ldr r0, [r4, #4]
	ldr r1, _02225ADC ; =ov07_02225904
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02225ADC: .word ov07_02225904
	thumb_func_end ov07_02225990

	thumb_func_start ov07_02225AE0
ov07_02225AE0: ; 0x02225AE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	cmp r1, #8
	bgt _02225AFA
	cmp r1, #2
	blt _02225B30
	beq _02225B00
	cmp r1, #4
	beq _02225B08
	cmp r1, #8
	beq _02225B18
	b _02225B30
_02225AFA:
	cmp r1, #0x10
	beq _02225B20
	b _02225B30
_02225B00:
	bl ov07_0221C468
	add r4, r0, #0
	b _02225B34
_02225B08:
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	add r4, r0, #0
	b _02225B34
_02225B18:
	bl ov07_0221C470
	add r4, r0, #0
	b _02225B34
_02225B20:
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223197C
	add r4, r0, #0
	b _02225B34
_02225B30:
	bl GF_AssertFail
_02225B34:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02225AE0

	thumb_func_start ov07_02225B38
ov07_02225B38: ; 0x02225B38
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02225B4A
	cmp r0, #1
	beq _02225B90
	pop {r3, r4, r5, pc}
_02225B4A:
	ldr r0, [r4, #0x24]
	add r1, r0, #1
	str r1, [r4, #0x24]
	ldr r0, [r4, #0x20]
	cmp r1, r0
	blt _02225BC2
	mov r0, #0
	str r0, [r4, #0x24]
	mov r0, #0x1c
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x44]
	add r2, r1, r0
	str r2, [r4, #0x44]
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_020087A4
	mov r0, #0x1c
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x3c]
	sub r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r0, [r4, #0x40]
	cmp r1, r0
	ble _02225B84
	str r0, [r4, #0x3c]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02225B84:
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x3c]
	mov r1, #0x12
	bl sub_020087A4
	pop {r3, r4, r5, pc}
_02225B90:
	ldr r0, [r4, #0x30]
	mov r1, #0xe
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x48]
	mov r1, #1
	bl sub_020087A4
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x40]
	mov r1, #0x12
	bl sub_020087A4
	ldr r0, [r4, #0x30]
	bl ov07_02223224
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_02225BC2:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02225B38

	thumb_func_start ov07_02225BC4
ov07_02225BC4: ; 0x02225BC4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02225BD6
	cmp r0, #1
	beq _02225C1A
	pop {r3, r4, r5, pc}
_02225BD6:
	ldr r0, [r4, #0x24]
	add r1, r0, #1
	str r1, [r4, #0x24]
	ldr r0, [r4, #0x20]
	cmp r1, r0
	blt _02225C4C
	mov r0, #0
	str r0, [r4, #0x24]
	mov r0, #0x1c
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x44]
	add r2, r1, r0
	str r2, [r4, #0x44]
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_020087A4
	mov r0, #0x1c
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x3c]
	sub r0, r1, r0
	str r0, [r4, #0x3c]
	bpl _02225C0E
	mov r0, #0
	str r0, [r4, #0x3c]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02225C0E:
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x3c]
	mov r1, #0x12
	bl sub_020087A4
	pop {r3, r4, r5, pc}
_02225C1A:
	ldr r0, [r4, #0x30]
	mov r1, #0xe
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x48]
	mov r1, #1
	bl sub_020087A4
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x40]
	mov r1, #0x12
	bl sub_020087A4
	ldr r0, [r4, #0x30]
	bl ov07_02223224
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_02225C4C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02225BC4

	thumb_func_start ov07_02225C50
ov07_02225C50: ; 0x02225C50
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02225C62
	cmp r0, #1
	beq _02225CA4
	pop {r3, r4, r5, pc}
_02225C62:
	ldr r0, [r4, #0x24]
	add r1, r0, #1
	str r1, [r4, #0x24]
	ldr r0, [r4, #0x20]
	cmp r1, r0
	blt _02225CC2
	mov r0, #0
	str r0, [r4, #0x24]
	mov r1, #0x1c
	ldrsh r2, [r4, r1]
	ldr r3, [r4, #0x3c]
	sub r2, r3, r2
	str r2, [r4, #0x3c]
	ldrsh r1, [r4, r1]
	ldr r2, [r4, #0x40]
	add r1, r2, r1
	str r1, [r4, #0x40]
	ldr r1, [r4, #0x3c]
	cmp r1, #0
	bge _02225C92
	str r0, [r4, #0x3c]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02225C92:
	ldr r0, [r4, #0x40]
	mov r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x3c]
	mov r3, #0x50
	bl sub_0200908C
	pop {r3, r4, r5, pc}
_02225CA4:
	ldr r0, [r4, #0x30]
	mov r1, #0xe
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #0x30]
	bl ov07_02223224
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_02225CC2:
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02225C50

	thumb_func_start ov07_02225CC4
ov07_02225CC4: ; 0x02225CC4
	push {r4, r5, r6, lr}
	sub sp, #8
	mov r1, #0x50
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #0x1c]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	str r0, [r4, #0x20]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r6, r0, #0
	add r2, r4, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, #0x28
	add r3, sp, #4
	bl ov07_02232020
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_02225AE0
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	cmp r0, #0
	beq _02225D46
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FAA0
	mov r3, #0x50
	sub r0, r3, r0
	str r0, [r4, #0x3c]
	mov r1, #0
	str r1, [r4, #0x40]
	str r1, [sp]
	ldr r0, [r4, #0x30]
	ldr r2, [r4, #0x3c]
	bl sub_0200908C
	ldr r0, [r4, #4]
	ldr r1, _02225DB8 ; =ov07_02225C50
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r4, r5, r6, pc}
_02225D46:
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_02008A78
	str r0, [r4, #0x44]
	str r0, [r4, #0x48]
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FAA0
	mov r3, #0x50
	sub r0, r3, r0
	str r0, [r4, #0x3c]
	str r0, [r4, #0x40]
	mov r0, #0x1c
	ldrsh r0, [r4, r0]
	cmp r0, #0
	ble _02225D86
	ldr r0, [r4, #0x3c]
	mov r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x30]
	add r2, r1, #0
	bl sub_0200908C
	ldr r0, [r4, #4]
	ldr r1, _02225DBC ; =ov07_02225BC4
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r4, r5, r6, pc}
_02225D86:
	mov r0, #0
	str r0, [r4, #0x3c]
	ldr r1, [r4, #0x44]
	ldr r0, [r4, #0x40]
	add r2, r1, r0
	str r2, [r4, #0x44]
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_020087A4
	ldr r0, [r4, #0x3c]
	mov r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x30]
	add r2, r1, #0
	mov r3, #0x50
	bl sub_0200908C
	ldr r0, [r4, #4]
	ldr r1, _02225DC0 ; =ov07_02225B38
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02225DB8: .word ov07_02225C50
_02225DBC: .word ov07_02225BC4
_02225DC0: .word ov07_02225B38
	thumb_func_end ov07_02225CC4

	thumb_func_start ov07_02225DC4
ov07_02225DC4: ; 0x02225DC4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02225DD8
	cmp r0, #1
	beq _02225DF8
	b _02225E88
_02225DD8:
	ldr r0, [r4, #0x10]
	str r0, [sp]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r3, [r4, #0xc]
	add r0, #0xd4
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_022227A8
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02225DF8:
	add r0, r4, #0
	add r0, #0xd4
	bl ov07_022227D8
	cmp r0, #0
	bne _02225E4C
	ldrb r1, [r4, #1]
	ldr r0, [r4, #0x18]
	cmp r1, r0
	ldrb r0, [r4]
	blt _02225E12
	add r0, r0, #1
	b _02225E14
_02225E12:
	sub r0, r0, #1
_02225E14:
	strb r0, [r4]
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _02225E2C
	ldr r1, [r4, #0x1c]
	mov r2, #0
	lsl r1, r1, #0x18
	ldr r0, [r4, #0x28]
	lsr r1, r1, #0x18
	add r3, r2, #0
	bl BgSetPosTextAndCommit
_02225E2C:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	beq _02225E42
	ldr r1, [r4, #0x1c]
	ldr r0, [r4, #0x28]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
_02225E42:
	ldrb r0, [r4, #1]
	add sp, #4
	add r0, r0, #1
	strb r0, [r4, #1]
	pop {r3, r4, pc}
_02225E4C:
	mov r3, #0xd4
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _02225E68
	mov r0, #1
	str r0, [r4, #0x20]
	ldr r1, [r4, #0x1c]
	ldrsh r3, [r4, r3]
	lsl r1, r1, #0x18
	ldr r0, [r4, #0x28]
	lsr r1, r1, #0x18
	mov r2, #0
	bl BgSetPosTextAndCommit
_02225E68:
	mov r3, #0xd6
	ldrsh r0, [r4, r3]
	cmp r0, #0
	beq _02225E96
	mov r0, #1
	str r0, [r4, #0x24]
	ldr r1, [r4, #0x1c]
	ldrsh r3, [r4, r3]
	lsl r1, r1, #0x18
	ldr r0, [r4, #0x28]
	lsr r1, r1, #0x18
	mov r2, #3
	bl BgSetPosTextAndCommit
	add sp, #4
	pop {r3, r4, pc}
_02225E88:
	ldr r0, [r4, #0x2c]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_02225E96:
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02225DC4

	thumb_func_start ov07_02225E9C
ov07_02225E9C: ; 0x02225E9C
	push {r3, r4, r5, lr}
	mov r1, #0xf8
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	str r5, [r4, #0x2c]
	add r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x2c]
	bl ov07_0221C4A0
	str r0, [r4, #0x28]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #4]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	str r0, [r4, #8]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #0x10]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	str r0, [r4, #0x18]
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	cmp r0, #0
	bne _02225F02
	mov r0, #3
	b _02225F04
_02225F02:
	mov r0, #2
_02225F04:
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x2c]
	ldr r1, _02225F14 ; =ov07_02225DC4
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_02225F14: .word ov07_02225DC4
	thumb_func_end ov07_02225E9C

	thumb_func_start ov07_02225F18
ov07_02225F18: ; 0x02225F18
	push {r4, lr}
	add r4, r1, #0
	add r2, r0, #0
	ldr r0, [r4, #0x2c]
	ldr r3, [r4, #0x24]
	cmp r3, r0
	beq _02225F2C
	ldr r1, [r4, #0x28]
	cmp r1, r0
	bne _02225F3C
_02225F2C:
	ldr r0, [r4, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
_02225F3C:
	mov r1, #0x20
	ldrsh r2, [r4, r1]
	cmp r2, #0
	bge _02225F5E
	add r2, r3, r2
	cmp r2, #0
	ble _02225F56
	str r2, [r4, #0x24]
	ldrsh r0, [r4, r1]
	ldr r2, [r4, #0x28]
	add r0, r2, r0
	str r0, [r4, #0x28]
	b _02225F76
_02225F56:
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x2c]
	str r0, [r4, #0x28]
	b _02225F76
_02225F5E:
	add r2, r3, r2
	cmp r2, #0xf
	bge _02225F70
	str r2, [r4, #0x24]
	ldrsh r0, [r4, r1]
	ldr r2, [r4, #0x28]
	add r0, r2, r0
	str r0, [r4, #0x28]
	b _02225F76
_02225F70:
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x2c]
	str r0, [r4, #0x28]
_02225F76:
	ldr r0, [r4, #0x1c]
	bl sub_0200DC18
	ldr r0, [r4, #0x28]
	ldr r1, [r4, #0x24]
	lsl r0, r0, #4
	orr r1, r0
	ldr r0, _02225F90 ; =0x0400004D
	strb r1, [r0]
	ldr r0, [r4, #0xc]
	bl sub_0200D020
	pop {r4, pc}
	.balign 4, 0
_02225F90: .word 0x0400004D
	thumb_func_end ov07_02225F18

	thumb_func_start ov07_02225F94
ov07_02225F94: ; 0x02225F94
	push {r3, r4, r5, lr}
	mov r1, #0x30
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0x20]
	ldr r0, [r4, #4]
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #0x24]
	ldr r0, [r4, #4]
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #0x28]
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov07_0221C4A8
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221C4E8
	mov r1, #1
	str r0, [r4, #0x1c]
	bl sub_0200DCE8
	mov r0, #0x20
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _02225FEA
	mov r0, #0
	b _02225FEC
_02225FEA:
	mov r0, #0xf
_02225FEC:
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x1c]
	mov r1, #1
	bl sub_0200E0E8
	ldr r0, [r4, #4]
	ldr r1, _02226008 ; =ov07_02225F18
	add r2, r4, #0
	bl ov07_0221C410
	add r1, r4, #0
	bl ov07_02225F18
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02226008: .word ov07_02225F18
	thumb_func_end ov07_02225F94

	thumb_func_start ov07_0222600C
ov07_0222600C: ; 0x0222600C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	mov r1, #0
	bl ov07_0221C4A8
	str r0, [r4]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	strh r0, [r4, #0xe]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #4]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	strh r0, [r4, #6]
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	str r0, [r4, #8]
	add r0, r5, #0
	mov r1, #6
	bl ov07_0221C4A8
	str r0, [r4, #0x10]
	add r0, r5, #0
	mov r1, #8
	bl ov07_0221C4A8
	str r0, [r4, #0x30]
	add r0, r5, #0
	mov r1, #7
	bl ov07_0221C4A8
	ldr r2, _022260D8 ; =0xFFFF0000
	mov r1, #0
	and r2, r0
	lsl r0, r0, #0x10
	str r1, [r4, #0x1c]
	lsr r2, r2, #0x10
	str r2, [r4, #0x20]
	lsr r0, r0, #0x10
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bne _02226082
	str r1, [r4, #0x20]
_02226082:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _0222608C
	mov r0, #0xff
	str r0, [r4, #0x24]
_0222608C:
	ldr r1, [r4]
	add r0, r5, #0
	bl ov07_0221C494
	str r0, [r4, #0x38]
	add r0, r5, #0
	bl ov07_0221C478
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _022260B6
	add r0, r5, #0
	bl ov07_0221C468
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl ov07_0221C470
	str r0, [r4, #0x18]
	b _022260CA
_022260B6:
	cmp r0, #1
	bne _022260CA
	add r0, r5, #0
	bl ov07_0221C470
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl ov07_0221C468
	str r0, [r4, #0x18]
_022260CA:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _022260D4
	bl GF_AssertFail
_022260D4:
	pop {r3, r4, r5, pc}
	nop
_022260D8: .word 0xFFFF0000
	thumb_func_end ov07_0222600C

	thumb_func_start ov07_022260DC
ov07_022260DC: ; 0x022260DC
	ldr r0, [r0, #8]
	mov r1, #0
	cmp r0, #0
	beq _022260EE
_022260E4:
	ldrh r2, [r0, #0x26]
	ldrh r3, [r0, #0x24]
	ldr r0, [r0]
	cmp r0, #0
	bne _022260E4
_022260EE:
	cmp r2, r3
	beq _022260F4
	mov r1, #1
_022260F4:
	add r0, r1, #0
	bx lr
	thumb_func_end ov07_022260DC

	thumb_func_start ov07_022260F8
ov07_022260F8: ; 0x022260F8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #0x38]
	bl ov07_022260DC
	add r4, r0, #0
	mov r0, #4
	ldrsh r0, [r5, r0]
	ldr r1, [r5, #0x28]
	cmp r1, r0
	bge _02226116
	add r0, r1, #1
	str r0, [r5, #0x28]
	pop {r4, r5, r6, pc}
_02226116:
	add r0, r5, #0
	add r0, #0xa8
	bl ov07_022222B4
	cmp r0, #0
	bne _0222613E
	cmp r4, #0
	bne _0222613E
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_020154C4
	ldr r0, [r5, #0x40]
	add r1, r6, #0
	bl ov07_0221C448
	add r0, r5, #0
	bl ov07_02232508
	pop {r4, r5, r6, pc}
_0222613E:
	ldr r1, [r5, #0x1c]
	ldr r0, [r5, #0x20]
	cmp r0, r1
	bgt _0222614C
	ldr r0, [r5, #0x24]
	cmp r0, r1
	bge _02226152
_0222614C:
	ldr r0, [r5, #0x24]
	cmp r0, #0xff
	bne _022261B0
_02226152:
	mov r0, #0xa8
	ldrsh r2, [r5, r0]
	ldr r1, [r5, #0x38]
	mov r3, #0xac
	add r0, r2, #0
	ldr r2, [r1, #0x20]
	mul r0, r3
	ldr r2, [r2]
	ldr r2, [r2, #4]
	add r0, r0, r2
	str r0, [r1, #0x28]
	mov r0, #0xaa
	ldrsh r4, [r5, r0]
	ldr r2, [r5, #0x38]
	add r1, r4, #0
	mul r1, r3
	ldr r3, [r2, #0x20]
	ldr r3, [r3]
	ldr r3, [r3, #8]
	add r1, r1, r3
	str r1, [r2, #0x2c]
	ldr r1, [r5, #0x30]
	cmp r1, #0
	beq _022261B0
	mov r1, #6
	ldrsh r1, [r5, r1]
	add r0, #0xbe
	bl _s32_div_f
	ldr r1, [r5, #0x2c]
	add r0, r1, r0
	str r0, [r5, #0x2c]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl GF_SinDeg
	mov r1, #0xaa
	ldrsh r2, [r5, r1]
	mov r1, #0xac
	mul r1, r2
	add r2, r1, r0
	ldr r1, [r5, #0x38]
	ldr r0, [r1, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r2, r0
	str r0, [r1, #0x2c]
_022261B0:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_022260F8

	thumb_func_start ov07_022261B4
ov07_022261B4: ; 0x022261B4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	mov r1, #0x41
	lsl r1, r1, #2
	add r6, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x3c
	bl ov07_02231FE4
	add r0, r6, #0
	add r1, r4, #0
	bl ov07_0222600C
	add r0, r6, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_02222004
	add r5, r0, #0
	ldr r1, [r4, #0x14]
	add r0, r6, #0
	add r2, sp, #0x18
	bl ov07_02231B90
	ldr r1, [r4, #0x18]
	add r0, r6, #0
	add r2, sp, #0xc
	bl ov07_02231B90
	ldr r0, [sp, #0x18]
	mov r1, #0xac
	bl _s32_div_f
	add r6, r0, #0
	ldr r0, [sp, #0xc]
	mov r1, #0xac
	bl _s32_div_f
	add r7, r0, #0
	ldr r0, [sp, #0x1c]
	mov r1, #0xac
	bl _s32_div_f
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	mov r1, #0xac
	bl _s32_div_f
	mov r1, #0xe
	ldrsh r1, [r4, r1]
	add r2, r1, #0
	mul r2, r5
	add r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	ldrh r0, [r4, #6]
	lsl r1, r6, #0x10
	mov r2, #0xc
	str r0, [sp, #4]
	ldrsh r2, [r4, r2]
	add r0, r4, #0
	add r0, #0xa8
	add r3, r2, #0
	mul r3, r5
	add r2, r7, r3
	ldr r3, [sp, #8]
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222268
	cmp r5, #0
	ldr r2, _022262D8 ; =0x00005C71
	ble _0222626C
	ldr r1, _022262DC ; =0x00000E38
	add r0, r4, #0
	add r0, #0xf0
	mul r1, r5
	mul r2, r5
	mov r3, #0xa
	bl ov07_022223F0
	b _0222627C
_0222626C:
	ldr r1, _022262E0 ; =0x00003FFF
	add r0, r4, #0
	add r0, #0xf0
	mul r1, r5
	mul r2, r5
	mov r3, #0xa
	bl ov07_022223F0
_0222627C:
	ldr r0, [r4, #0x20]
	mov r5, #0
	cmp r0, #0
	ble _02226296
	add r6, r4, #0
	add r6, #0xa8
_02226288:
	add r0, r6, #0
	bl ov07_022222B4
	ldr r0, [r4, #0x20]
	add r5, r5, #1
	cmp r5, r0
	blt _02226288
_02226296:
	ldr r0, [r4, #0x24]
	cmp r0, #0xff
	beq _022262A0
	add r0, r0, #1
	str r0, [r4, #0x1c]
_022262A0:
	mov r0, #0xa8
	ldrsh r3, [r4, r0]
	ldr r1, [r4, #0x38]
	mov r2, #0xac
	add r0, r3, #0
	ldr r3, [r1, #0x20]
	mul r0, r2
	ldr r3, [r3]
	ldr r3, [r3, #4]
	add r0, r0, r3
	str r0, [r1, #0x28]
	mov r1, #0xaa
	ldrsh r1, [r4, r1]
	ldr r0, [r4, #0x38]
	mul r2, r1
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r0, [r4, #0x40]
	ldr r1, _022262E4 ; =ov07_022260F8
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_022262D8: .word 0x00005C71
_022262DC: .word 0x00000E38
_022262E0: .word 0x00003FFF
_022262E4: .word ov07_022260F8
	thumb_func_end ov07_022261B4

	thumb_func_start ov07_022262E8
ov07_022262E8: ; 0x022262E8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	mov r1, #0x41
	lsl r1, r1, #2
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x3c
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	str r0, [r4]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	str r0, [r4, #0x10]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #6]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	strh r0, [r4, #4]
	mov r0, #0
	str r0, [r4, #0x28]
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	ldr r2, _02226474 ; =0xFFFF0000
	mov r1, #0
	and r2, r0
	lsl r0, r0, #0x10
	str r1, [r4, #0x1c]
	lsr r2, r2, #0x10
	str r2, [r4, #0x20]
	lsr r0, r0, #0x10
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x20]
	cmp r0, #0
	bne _0222635A
	str r1, [r4, #0x20]
_0222635A:
	ldr r0, [r4, #0x24]
	cmp r0, #0
	bne _02226364
	mov r0, #0xff
	str r0, [r4, #0x24]
_02226364:
	ldr r1, [r4]
	add r0, r5, #0
	bl ov07_0221C494
	str r0, [r4, #0x38]
	add r0, r5, #0
	bl ov07_0221C478
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0222638C
	add r0, r5, #0
	bl ov07_0221C468
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl ov07_0221C468
	b _0222639A
_0222638C:
	add r0, r5, #0
	bl ov07_0221C470
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl ov07_0221C470
_0222639A:
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _022263A6
	bl GF_AssertFail
_022263A6:
	ldr r1, [r4, #0x14]
	add r0, r5, #0
	add r2, sp, #0x14
	bl ov07_02231B90
	ldr r1, [r4, #0x18]
	add r0, r5, #0
	add r2, sp, #8
	bl ov07_02231B90
	cmp r6, #0
	bne _022263CA
	add r0, sp, #0x14
	bl ov07_02231DD0
	ldr r0, [sp, #8]
	str r0, [sp, #0x14]
	b _022263D4
_022263CA:
	add r0, sp, #8
	bl ov07_02231DD0
	ldr r0, [sp, #0x14]
	str r0, [sp, #8]
_022263D4:
	ldr r0, [sp, #0x14]
	mov r1, #0xac
	bl _s32_div_f
	add r5, r0, #0
	ldr r0, [sp, #8]
	mov r1, #0xac
	bl _s32_div_f
	add r6, r0, #0
	ldr r0, [sp, #0x18]
	mov r1, #0xac
	bl _s32_div_f
	add r7, r0, #0
	ldr r0, [sp, #0xc]
	mov r1, #0xac
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	ldrh r0, [r4, #6]
	lsl r1, r5, #0x10
	lsl r2, r6, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	lsl r3, r7, #0x10
	add r0, #0xa8
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222268
	ldr r0, [r4, #0x20]
	mov r5, #0
	cmp r0, #0
	ble _02226432
	add r6, r4, #0
	add r6, #0xa8
_02226424:
	add r0, r6, #0
	bl ov07_022222B4
	ldr r0, [r4, #0x20]
	add r5, r5, #1
	cmp r5, r0
	blt _02226424
_02226432:
	ldr r0, [r4, #0x24]
	cmp r0, #0xff
	beq _0222643C
	add r0, r0, #1
	str r0, [r4, #0x1c]
_0222643C:
	mov r0, #0xa8
	ldrsh r3, [r4, r0]
	ldr r1, [r4, #0x38]
	mov r2, #0xac
	add r0, r3, #0
	ldr r3, [r1, #0x20]
	mul r0, r2
	ldr r3, [r3]
	ldr r3, [r3, #4]
	add r0, r0, r3
	str r0, [r1, #0x28]
	mov r1, #0xaa
	ldrsh r1, [r4, r1]
	ldr r0, [r4, #0x38]
	mul r2, r1
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r0, [r4, #0x40]
	ldr r1, _02226478 ; =ov07_022260F8
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02226474: .word 0xFFFF0000
_02226478: .word ov07_022260F8
	thumb_func_end ov07_022262E8

	thumb_func_start ov07_0222647C
ov07_0222647C: ; 0x0222647C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #0x38]
	bl ov07_022260DC
	add r4, r0, #0
	add r0, r5, #0
	add r1, r5, #0
	add r0, #0xa8
	add r1, #0xcc
	bl ov07_02222384
	cmp r0, #0
	bne _022264B6
	cmp r4, #0
	bne _022264B6
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_020154C4
	ldr r0, [r5, #0x40]
	add r1, r6, #0
	bl ov07_0221C448
	add r0, r5, #0
	bl ov07_02232508
	pop {r4, r5, r6, pc}
_022264B6:
	mov r1, #0xa8
	ldrsh r1, [r5, r1]
	ldr r0, [r5, #0x38]
	mov r2, #0xac
	add r3, r1, #0
	ldr r1, [r0, #0x20]
	mul r3, r2
	ldr r1, [r1]
	ldr r1, [r1, #4]
	add r1, r3, r1
	str r1, [r0, #0x28]
	mov r1, #0xaa
	ldrsh r1, [r5, r1]
	ldr r0, [r5, #0x38]
	mul r2, r1
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r1, r2, r1
	str r1, [r0, #0x2c]
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0222647C

	thumb_func_start ov07_022264E0
ov07_022264E0: ; 0x022264E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	mov r1, #0x41
	lsl r1, r1, #2
	add r6, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x3c
	bl ov07_02231FE4
	add r0, r6, #0
	add r1, r4, #0
	bl ov07_0222600C
	add r0, r6, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_02222004
	add r5, r0, #0
	ldr r1, [r4, #0x14]
	add r0, r6, #0
	add r2, sp, #0x20
	bl ov07_02231B90
	ldr r1, [r4, #0x18]
	add r0, r6, #0
	add r2, sp, #0x14
	bl ov07_02231B90
	ldr r0, [sp, #0x20]
	mov r1, #0xac
	bl _s32_div_f
	add r6, r0, #0
	ldr r0, [sp, #0x14]
	mov r1, #0xac
	bl _s32_div_f
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x24]
	mov r1, #0xac
	bl _s32_div_f
	add r7, r0, #0
	ldr r0, [sp, #0x18]
	mov r1, #0xac
	bl _s32_div_f
	lsl r1, r7, #0x10
	asr r1, r1, #0x10
	str r1, [sp]
	mov r1, #0xe
	ldrsh r1, [r4, r1]
	mov r3, #0xc
	add r2, r1, #0
	mul r2, r5
	add r0, r0, r2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	ldrh r0, [r4, #6]
	lsl r2, r6, #0x10
	add r1, r4, #0
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	add r1, #0xcc
	lsl r0, r0, #0xc
	neg r0, r0
	str r0, [sp, #0xc]
	ldrsh r6, [r4, r3]
	add r0, r4, #0
	add r0, #0xa8
	add r3, r6, #0
	ldr r6, [sp, #0x10]
	mul r3, r5
	add r3, r6, r3
	lsl r3, r3, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222338
	cmp r5, #0
	ldr r2, _02226618 ; =0x00005C71
	ble _022265A6
	ldr r1, _0222661C ; =0x00000E38
	add r0, r4, #0
	add r0, #0xf0
	mul r1, r5
	mul r2, r5
	mov r3, #0xa
	bl ov07_022223F0
	b _022265B6
_022265A6:
	ldr r1, _02226620 ; =0x00003FFF
	add r0, r4, #0
	add r0, #0xf0
	mul r1, r5
	mul r2, r5
	mov r3, #0xa
	bl ov07_022223F0
_022265B6:
	ldr r0, [r4, #0x20]
	mov r5, #0
	cmp r0, #0
	ble _022265D6
	add r6, r4, #0
	add r7, r4, #0
	add r6, #0xa8
	add r7, #0xcc
_022265C6:
	add r0, r6, #0
	add r1, r7, #0
	bl ov07_02222384
	ldr r0, [r4, #0x20]
	add r5, r5, #1
	cmp r5, r0
	blt _022265C6
_022265D6:
	ldr r0, [r4, #0x24]
	cmp r0, #0xff
	beq _022265E0
	add r0, r0, #1
	str r0, [r4, #0x1c]
_022265E0:
	mov r0, #0xa8
	ldrsh r3, [r4, r0]
	ldr r1, [r4, #0x38]
	mov r2, #0xac
	add r0, r3, #0
	ldr r3, [r1, #0x20]
	mul r0, r2
	ldr r3, [r3]
	ldr r3, [r3, #4]
	add r0, r0, r3
	str r0, [r1, #0x28]
	mov r1, #0xaa
	ldrsh r1, [r4, r1]
	ldr r0, [r4, #0x38]
	mul r2, r1
	ldr r1, [r0, #0x20]
	ldr r1, [r1]
	ldr r1, [r1, #8]
	add r1, r2, r1
	str r1, [r0, #0x2c]
	ldr r0, [r4, #0x40]
	ldr r1, _02226624 ; =ov07_0222647C
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	nop
_02226618: .word 0x00005C71
_0222661C: .word 0x00000E38
_02226620: .word 0x00003FFF
_02226624: .word ov07_0222647C
	thumb_func_end ov07_022264E0

	thumb_func_start ov07_02226628
ov07_02226628: ; 0x02226628
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	ldr r0, [r5, #0x38]
	bl ov07_022260DC
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x58
	bl ov07_02222180
	cmp r0, #0
	bne _0222665E
	cmp r4, #0
	bne _0222665E
	ldr r0, [r5, #0x34]
	ldr r1, [r5, #0x38]
	bl sub_020154C4
	ldr r0, [r5, #0x40]
	add r1, r6, #0
	bl ov07_0221C448
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
_0222665E:
	add r0, r5, #0
	add r0, #0x8c
	ldr r2, [r0]
	mov r0, #0x5a
	ldrsh r0, [r5, r0]
	mov r3, #0xac
	add r1, r0, #0
	mul r1, r3
	add r1, r2, r1
	add r2, r5, #0
	add r2, #0x88
	ldr r4, [r2]
	mov r2, #0x58
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #0x38]
	mul r3, r2
	ldr r2, [r0, #0x20]
	add r3, r4, r3
	ldr r2, [r2]
	ldr r2, [r2, #4]
	add r2, r3, r2
	str r2, [r0, #0x28]
	ldr r2, [r5, #0x38]
	ldr r0, [r2, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r2, #0x2c]
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_02226628

	thumb_func_start ov07_02226698
ov07_02226698: ; 0x02226698
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r1, #0x94
	add r4, r0, #0
	bl ov07_022324D8
	add r5, r0, #0
	add r1, r5, #0
	add r0, r4, #0
	add r1, #0x3c
	bl ov07_02231FE4
	add r0, r4, #0
	mov r1, #0
	bl ov07_0221C4A8
	str r0, [r5]
	add r0, r4, #0
	mov r1, #1
	bl ov07_0221C4A8
	str r0, [r5, #4]
	add r0, r4, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [r5, #0xc]
	add r0, r4, #0
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [r5, #8]
	add r0, r4, #0
	mov r1, #4
	bl ov07_0221C4A8
	str r0, [r5, #0x10]
	add r0, r4, #0
	mov r1, #5
	bl ov07_0221C4A8
	str r0, [r5, #0x14]
	add r0, r4, #0
	mov r1, #6
	bl ov07_0221C4A8
	str r0, [r5, #0x18]
	add r0, r4, #0
	mov r1, #7
	bl ov07_0221C4A8
	str r0, [r5, #0x1c]
	add r0, r4, #0
	mov r1, #8
	bl ov07_0221C4A8
	str r0, [r5, #0x20]
	cmp r0, #0
	bne _02226716
	add r0, r4, #0
	bl ov07_0221C468
	b _0222671C
_02226716:
	add r0, r4, #0
	bl ov07_0221C470
_0222671C:
	str r0, [r5, #0x24]
	add r2, r5, #0
	ldr r1, [r5, #0x24]
	add r0, r4, #0
	add r2, #0x88
	bl ov07_02231B90
	ldr r1, [r5]
	add r0, r4, #0
	bl ov07_0221C494
	str r0, [r5, #0x38]
	add r0, r4, #0
	mov r1, #9
	bl ov07_0221C4A8
	add r1, r0, #0
	add r0, r4, #0
	bl ov07_0221C488
	str r0, [r5, #0x34]
	ldr r1, [r5, #4]
	ldr r0, _022267FC ; =0x0000FFFF
	mul r0, r1
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	add r4, r0, #0
	ldr r1, [r5, #0xc]
	ldr r0, _022267FC ; =0x0000FFFF
	mul r0, r1
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	add r6, r0, #0
	ldr r1, [r5, #8]
	ldr r0, _022267FC ; =0x0000FFFF
	mul r0, r1
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	add r7, r0, #0
	ldr r1, [r5, #0x10]
	ldr r0, _022267FC ; =0x0000FFFF
	mul r0, r1
	mov r1, #0x5a
	lsl r1, r1, #2
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r5, #0x14]
	lsl r1, r4, #0x10
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	ldr r0, [r5, #0x18]
	lsl r2, r6, #0x10
	lsl r0, r0, #0xc
	str r0, [sp, #8]
	ldr r0, [r5, #0x1c]
	lsl r3, r7, #0x10
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r0, #0x58
	lsr r1, r1, #0x10
	lsr r2, r2, #0x10
	lsr r3, r3, #0x10
	bl ov07_022220FC
	add r0, r5, #0
	add r0, #0x58
	bl ov07_02222180
	add r0, r5, #0
	add r0, #0x8c
	ldr r2, [r0]
	mov r0, #0x5a
	ldrsh r0, [r5, r0]
	mov r3, #0x58
	mov r4, #0xac
	add r1, r0, #0
	add r0, r5, #0
	mul r1, r4
	ldrsh r3, [r5, r3]
	add r0, #0x88
	add r2, r2, r1
	ldr r1, [r5, #0x38]
	ldr r0, [r0]
	mul r4, r3
	add r3, r0, r4
	ldr r0, [r1, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r3, r0
	str r0, [r1, #0x28]
	ldr r1, [r5, #0x38]
	ldr r0, [r1, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r2, r0
	str r0, [r1, #0x2c]
	ldr r0, [r5, #0x40]
	ldr r1, _02226800 ; =ov07_02226628
	add r2, r5, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022267FC: .word 0x0000FFFF
_02226800: .word ov07_02226628
	thumb_func_end ov07_02226698

	thumb_func_start ov07_02226804
ov07_02226804: ; 0x02226804
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_0200DCA0
	cmp r0, #0
	ldr r0, [r4, #0x1c]
	bne _0222682A
	bl sub_0200D9DC
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
_0222682A:
	bl sub_0200DC18
	ldr r0, [r4, #0x10]
	bl sub_0200D020
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02226804

	thumb_func_start ov07_02226838
ov07_02226838: ; 0x02226838
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x20
	add r5, r0, #0
	add r4, r3, #0
	bl ov07_022324D8
	add r7, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #0
	str r4, [r7, #0x1c]
	bl ov07_0221C4A8
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	lsl r0, r0, #0x10
	asr r2, r0, #0x10
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0200DED0
	ldr r0, [r7, #4]
	ldr r1, _0222687C ; =ov07_02226804
	add r2, r7, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222687C: .word ov07_02226804
	thumb_func_end ov07_02226838

	thumb_func_start ov07_02226880
ov07_02226880: ; 0x02226880
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02226892
	cmp r0, #1
	beq _02226910
	b _022269A8
_02226892:
	ldr r1, [r4, #0x34]
	ldr r0, _022269CC ; =ov07_02236670
	lsl r2, r1, #1
	ldrsh r6, [r0, r2]
	add r0, r1, #1
	str r0, [r4, #0x34]
	cmp r6, #0xff
	beq _022268E2
	cmp r6, #0
	bne _022268D6
	ldr r0, [r4, #0x1c]
	bl sub_0200DD48
	add r5, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FAE8
	cmp r5, r0
	ldr r0, [r4, #4]
	bne _022268CA
	mov r1, #2
	bl ov07_0221FB04
	add r1, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_0200DD54
	b _022268D6
_022268CA:
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_0200DD54
_022268D6:
	ldr r0, [r4, #0x1c]
	add r1, r6, #0
	mov r2, #0
	bl sub_0200DED0
	b _022269BE
_022268E2:
	ldr r0, [r4, #0x1c]
	mov r1, #2
	bl sub_0200DF98
	add r0, r4, #0
	ldr r2, _022269D0 ; =0x00000E38
	add r0, #0x20
	mov r1, #0
	mov r3, #4
	bl ov07_022223F0
	mov r1, #7
	ldr r0, [r4, #0x1c]
	mvn r1, r1
	mov r2, #0x10
	bl sub_0200E0CC
	mov r0, #0
	str r0, [r4, #0x34]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _022269BE
_02226910:
	add r0, r4, #0
	add r0, #0x20
	bl ov07_02222440
	cmp r0, #1
	bne _0222692A
	ldr r1, [r4, #0x20]
	ldr r0, [r4, #0x1c]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_0200E074
	b _022269BE
_0222692A:
	ldr r0, [r4, #0x34]
	cmp r0, #5
	ble _02226938
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _022269BE
_02226938:
	add r0, r0, #1
	str r0, [r4, #0x34]
	cmp r0, #5
	bhi _022269BE
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222694C: ; jump table
	.short _022269BE - _0222694C - 2 ; case 0
	.short _02226958 - _0222694C - 2 ; case 1
	.short _02226968 - _0222694C - 2 ; case 2
	.short _02226978 - _0222694C - 2 ; case 3
	.short _02226988 - _0222694C - 2 ; case 4
	.short _02226998 - _0222694C - 2 ; case 5
_02226958:
	add r0, r4, #0
	ldr r1, _022269D0 ; =0x00000E38
	ldr r2, _022269D4 ; =0xFFFFF1C8
	add r0, #0x20
	mov r3, #4
	bl ov07_022223F0
	b _022269BE
_02226968:
	add r0, r4, #0
	ldr r1, _022269D4 ; =0xFFFFF1C8
	ldr r2, _022269D0 ; =0x00000E38
	add r0, #0x20
	mov r3, #4
	bl ov07_022223F0
	b _022269BE
_02226978:
	add r0, r4, #0
	ldr r1, _022269D0 ; =0x00000E38
	ldr r2, _022269D4 ; =0xFFFFF1C8
	add r0, #0x20
	mov r3, #4
	bl ov07_022223F0
	b _022269BE
_02226988:
	add r0, r4, #0
	ldr r1, _022269D4 ; =0xFFFFF1C8
	ldr r2, _022269D0 ; =0x00000E38
	add r0, #0x20
	mov r3, #4
	bl ov07_022223F0
	b _022269BE
_02226998:
	add r0, r4, #0
	ldr r1, _022269D0 ; =0x00000E38
	add r0, #0x20
	mov r2, #0
	mov r3, #2
	bl ov07_022223F0
	b _022269BE
_022269A8:
	ldr r0, [r4, #0x1c]
	bl sub_0200D9DC
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
_022269BE:
	ldr r0, [r4, #0x1c]
	bl sub_0200DC18
	ldr r0, [r4, #0x10]
	bl sub_0200D020
	pop {r4, r5, r6, pc}
	.balign 4, 0
_022269CC: .word ov07_02236670
_022269D0: .word 0x00000E38
_022269D4: .word 0xFFFFF1C8
	thumb_func_end ov07_02226880

	thumb_func_start ov07_022269D8
ov07_022269D8: ; 0x022269D8
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x38
	add r5, r0, #0
	add r6, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	str r6, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x34]
	add r0, r5, #0
	bl ov07_0221C470
	add r7, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl ov07_02221F80
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #1
	bl ov07_02221F80
	add r2, r0, #0
	ldr r0, [r4, #0x1c]
	add r1, r6, #0
	bl sub_0200DDB8
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	ldr r0, [r4, #0x1c]
	bne _02226A38
	mov r1, #1
	bl sub_0200DC4C
	b _02226A3E
_02226A38:
	mov r1, #0
	bl sub_0200DC4C
_02226A3E:
	ldr r0, [r4, #4]
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_0200DD54
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0xc
	bl sub_0200DED0
	ldr r0, [r4, #4]
	ldr r1, _02226A64 ; =ov07_02226880
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02226A64: .word ov07_02226880
	thumb_func_end ov07_022269D8

	thumb_func_start ov07_02226A68
ov07_02226A68: ; 0x02226A68
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_0200DCA0
	cmp r0, #0
	ldr r0, [r4, #0x1c]
	bne _02226A8E
	bl sub_0200D9DC
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
_02226A8E:
	bl sub_0200DC18
	ldr r0, [r4, #0x10]
	bl sub_0200D020
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02226A68

	thumb_func_start ov07_02226A9C
ov07_02226A9C: ; 0x02226A9C
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x38
	add r5, r0, #0
	add r6, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	add r0, r5, #0
	str r6, [r4, #0x1c]
	bl ov07_0221C470
	add r7, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #0
	bl ov07_02221F80
	add r6, r0, #0
	add r0, r5, #0
	add r1, r7, #0
	mov r2, #1
	bl ov07_02221F80
	add r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02226AE4
	mov r6, #0x48
	mov r2, #0x20
	mov r5, #0
	b _02226AFA
_02226AE4:
	ldr r0, [r4, #4]
	add r1, r7, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _02226AF6
	mov r2, #0x7e
	mov r5, #1
	b _02226AFA
_02226AF6:
	mov r2, #0x20
	mov r5, #0
_02226AFA:
	ldr r0, [r4, #0x1c]
	add r1, r6, #0
	bl sub_0200DDB8
	ldr r0, [r4, #0x1c]
	add r1, r5, #0
	bl sub_0200DC4C
	ldr r0, [r4, #4]
	mov r1, #2
	bl ov07_0221FB04
	add r1, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_0200DD54
	ldr r0, [r4, #4]
	ldr r1, _02226B28 ; =ov07_02226A68
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02226B28: .word ov07_02226A68
	thumb_func_end ov07_02226A9C

	thumb_func_start ov07_02226B2C
ov07_02226B2C: ; 0x02226B2C
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bhi _02226C1E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02226B46: ; jump table
	.short _02226B4E - _02226B46 - 2 ; case 0
	.short _02226B74 - _02226B46 - 2 ; case 1
	.short _02226B8C - _02226B46 - 2 ; case 2
	.short _02226BC8 - _02226B46 - 2 ; case 3
_02226B4E:
	mov r0, #0xa0
	str r0, [sp]
	mov r3, #0x70
	mov r0, #1
	str r3, [sp, #4]
	mov r2, #0x15
	str r2, [sp, #8]
	lsl r0, r0, #0x12
	str r0, [sp, #0xc]
	add r0, r4, #0
	add r0, #0x24
	add r1, #0x48
	sub r2, #0x33
	bl ov07_02222338
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02226C36
_02226B74:
	add r0, r4, #0
	ldr r2, [r4, #0x1c]
	add r0, #0x24
	add r1, #0x48
	bl ov07_022223CC
	cmp r0, #0
	bne _02226C36
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02226C36
_02226B8C:
	ldr r0, [r4, #0x1c]
	bl sub_0200DCA0
	cmp r0, #0
	bne _02226C36
	ldr r0, [r4, #0x1c]
	mov r1, #1
	bl sub_0200E0FC
	add r0, r4, #0
	add r2, r4, #0
	mov r1, #0x10
	add r0, #0x20
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x21
	strb r1, [r0]
	add r1, r4, #0
	add r1, #0x20
	add r2, #0x21
	ldrb r1, [r1]
	ldrb r2, [r2]
	ldr r0, [r4, #4]
	bl ov07_02231E08
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02226C36
_02226BC8:
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _02226BE0
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x20
	strb r1, [r0]
_02226BE0:
	add r0, r4, #0
	add r0, #0x21
	ldrb r0, [r0]
	cmp r0, #0x10
	bhs _02226BF8
	add r0, r4, #0
	add r0, #0x21
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x21
	strb r1, [r0]
_02226BF8:
	add r0, r4, #0
	add r0, #0x20
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x21
	ldrb r0, [r0]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02226C48 ; =0x04000052
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	bne _02226C36
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02226C36
_02226C1E:
	ldr r0, [r4, #0x1c]
	bl sub_0200D9DC
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, pc}
_02226C36:
	ldr r0, [r4, #0x1c]
	bl sub_0200DC18
	ldr r0, [r4, #0x10]
	bl sub_0200D020
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_02226C48: .word 0x04000052
	thumb_func_end ov07_02226B2C

	thumb_func_start ov07_02226C4C
ov07_02226C4C: ; 0x02226C4C
	push {r4, r5, r6, lr}
	mov r1, #0x6c
	add r6, r0, #0
	add r5, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl ov07_02231FE4
	mov r1, #0x1d
	str r5, [r4, #0x1c]
	add r0, r5, #0
	mvn r1, r1
	mov r2, #0xa0
	bl sub_0200DDB8
	ldr r0, [r4, #4]
	mov r1, #2
	bl ov07_0221FB04
	add r1, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_0200DD54
	ldr r0, [r4, #4]
	ldr r1, _02226C8C ; =ov07_02226B2C
	add r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02226C8C: .word ov07_02226B2C
	thumb_func_end ov07_02226C4C

	thumb_func_start ov07_02226C90
ov07_02226C90: ; 0x02226C90
	push {r4, lr}
	mov r1, #0
	add r4, r0, #0
	bl ov07_0221C4A8
	cmp r0, #0
	beq _02226CA6
	add r0, r4, #0
	bl ov07_02222FC4
	pop {r4, pc}
_02226CA6:
	add r0, r4, #0
	bl ov07_02222FF4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02226C90

	thumb_func_start ov07_02226CB0
ov07_02226CB0: ; 0x02226CB0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0x18
	bls _02226CBE
	b _02226EB2
_02226CBE:
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02226CCA: ; jump table
	.short _02226CFC - _02226CCA - 2 ; case 0
	.short _02226EB2 - _02226CCA - 2 ; case 1
	.short _02226EB2 - _02226CCA - 2 ; case 2
	.short _02226EB2 - _02226CCA - 2 ; case 3
	.short _02226EB2 - _02226CCA - 2 ; case 4
	.short _02226DA8 - _02226CCA - 2 ; case 5
	.short _02226DA8 - _02226CCA - 2 ; case 6
	.short _02226DD2 - _02226CCA - 2 ; case 7
	.short _02226EB2 - _02226CCA - 2 ; case 8
	.short _02226EB2 - _02226CCA - 2 ; case 9
	.short _02226DEC - _02226CCA - 2 ; case 10
	.short _02226DEC - _02226CCA - 2 ; case 11
	.short _02226E16 - _02226CCA - 2 ; case 12
	.short _02226EB2 - _02226CCA - 2 ; case 13
	.short _02226EB2 - _02226CCA - 2 ; case 14
	.short _02226E2E - _02226CCA - 2 ; case 15
	.short _02226E2E - _02226CCA - 2 ; case 16
	.short _02226E58 - _02226CCA - 2 ; case 17
	.short _02226EB2 - _02226CCA - 2 ; case 18
	.short _02226EB2 - _02226CCA - 2 ; case 19
	.short _02226EB2 - _02226CCA - 2 ; case 20
	.short _02226EB2 - _02226CCA - 2 ; case 21
	.short _02226E70 - _02226CCA - 2 ; case 22
	.short _02226E70 - _02226CCA - 2 ; case 23
	.short _02226E9A - _02226CCA - 2 ; case 24
_02226CFC:
	ldr r0, [r4, #0x34]
	ldr r1, _02226EF8 ; =0xFFFF1FFF
	cmp r0, #0
	bne _02226D56
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	add r5, r0, #0
	and r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	str r1, [r0]
	add r5, #0x48
	ldrh r3, [r5]
	mov r2, #0x3f
	mov r1, #0xf
	bic r3, r2
	orr r1, r3
	mov r3, #0x20
	orr r1, r3
	strh r1, [r5]
	add r5, r0, #0
	add r5, #0x4a
	ldrh r6, [r5]
	mov r1, #0x1f
	bic r6, r2
	orr r1, r6
	orr r1, r3
	strh r1, [r5]
	add r1, r0, #0
	mov r2, #0x80
	add r1, #0x40
	strh r2, [r1]
	ldr r1, _02226EFC ; =0x0000A0C0
	add r0, #0x44
	strh r1, [r0]
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	add r1, #0x23
	add sp, #4
	str r1, [r4, #0x3c]
	pop {r3, r4, r5, r6, pc}
_02226D56:
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	add r5, r0, #0
	and r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	str r1, [r0]
	add r5, #0x48
	ldrh r3, [r5]
	mov r2, #0x3f
	mov r1, #0xf
	bic r3, r2
	orr r1, r3
	mov r3, #0x20
	orr r1, r3
	strh r1, [r5]
	add r5, r0, #0
	add r5, #0x4a
	ldrh r6, [r5]
	mov r1, #0x1f
	bic r6, r2
	orr r1, r6
	orr r1, r3
	strh r1, [r5]
	add r1, r0, #0
	lsl r2, r3, #0xa
	add r1, #0x40
	strh r2, [r1]
	ldr r1, _02226F00 ; =0x000056C0
	add r0, #0x44
	strh r1, [r0]
	bl LCRandom
	mov r1, #5
	bl _s32_div_f
	add r1, #0x23
	add sp, #4
	str r1, [r4, #0x3c]
	pop {r3, r4, r5, r6, pc}
_02226DA8:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	beq _02226DD8
	ldr r0, [r4, #0x38]
	cmp r0, #0
	bne _02226DD8
	add r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #4
	bl sub_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226DD2:
	ldr r0, [r4, #0x38]
	cmp r0, #1
	bne _02226DDA
_02226DD8:
	b _02226EF4
_02226DDA:
	add r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #4
	bl sub_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226DEC:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	beq _02226EF4
	ldr r0, [r4, #0x38]
	cmp r0, #1
	bne _02226EF4
	add r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #4
	bl sub_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226E16:
	ldr r0, [r4, #0x38]
	cmp r0, #2
	beq _02226EF4
	add r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #4
	bl sub_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226E2E:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	beq _02226EF4
	ldr r0, [r4, #0x38]
	cmp r0, #2
	bne _02226EF4
	add r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #4
	bl sub_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226E58:
	ldr r0, [r4, #0x38]
	cmp r0, #3
	beq _02226EF4
	add r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #4
	bl sub_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226E70:
	bl LCRandom
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	beq _02226EF4
	ldr r0, [r4, #0x38]
	cmp r0, #3
	bne _02226EF4
	add r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #8
	bl sub_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226E9A:
	ldr r0, [r4, #0x38]
	cmp r0, #4
	beq _02226EF4
	add r0, r0, #1
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #8
	bl sub_0200DED0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02226EB2:
	ldr r1, [r4, #0x3c]
	cmp r0, r1
	ble _02226EF4
	ldr r0, [r4, #0x38]
	cmp r0, #0x14
	ldr r0, [r4, #0x1c]
	bge _02226EEE
	mov r1, #0
	mov r2, #4
	bl sub_0200DED0
	add r1, sp, #0
	ldr r0, [r4, #0x1c]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r0, sp, #0
	mov r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x82
	ble _02226EE4
	ldr r0, [r4, #0x1c]
	bl sub_0200DCE8
_02226EE4:
	ldr r0, [r4, #0x38]
	add sp, #4
	add r0, r0, #1
	str r0, [r4, #0x38]
	pop {r3, r4, r5, r6, pc}
_02226EEE:
	mov r1, #0
	bl sub_0200DCE8
_02226EF4:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02226EF8: .word 0xFFFF1FFF
_02226EFC: .word 0x0000A0C0
_02226F00: .word 0x000056C0
	thumb_func_end ov07_02226CB0

	thumb_func_start ov07_02226F04
ov07_02226F04: ; 0x02226F04
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _02226F16
	add r0, r4, #0
	bl ov07_02226CB0
_02226F16:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	ldrb r1, [r4]
	ldr r0, [r4, #0x24]
	cmp r1, r0
	blt _02226F6E
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02226F7C ; =0xFFFF1FFF
	and r1, r2
	add r2, r0, #0
	str r1, [r0]
	add r2, #0x48
	ldrh r3, [r2]
	mov r1, #0x3f
	bic r3, r1
	strh r3, [r2]
	add r2, r0, #0
	add r2, #0x4a
	ldrh r3, [r2]
	bic r3, r1
	strh r3, [r2]
	add r2, r0, #0
	mov r1, #0
	add r2, #0x40
	strh r1, [r2]
	add r0, #0x44
	strh r1, [r0]
	ldr r0, [r4, #0x1c]
	bl sub_0200DCE8
	ldr r0, [r4, #0xc]
	bl sub_0200D020
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
_02226F6E:
	ldr r0, [r4, #0x1c]
	bl sub_0200DC18
	ldr r0, [r4, #0xc]
	bl sub_0200D020
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02226F7C: .word 0xFFFF1FFF
	thumb_func_end ov07_02226F04

	thumb_func_start ov07_02226F80
ov07_02226F80: ; 0x02226F80
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x40
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #0x20]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	str r0, [r4, #0x24]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #0x28]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #0x2c]
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	str r0, [r4, #0x30]
	add r0, r5, #0
	mov r1, #6
	bl ov07_0221C4A8
	str r0, [r4, #0x34]
	ldr r0, [r4, #4]
	ldr r1, [r4, #0x20]
	bl ov07_0221C4E8
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x28]
	cmp r1, #0xff
	beq _02226FF2
	add r0, r5, #0
	bl ov07_0221FB04
	add r1, r0, #0
	ldr r0, [r4, #0x1c]
	bl sub_0200DD54
_02226FF2:
	ldr r1, [r4, #0x2c]
	cmp r1, #0xff
	beq _02226FFE
	ldr r0, [r4, #0x1c]
	bl sub_0200DD68
_02226FFE:
	add r0, r5, #0
	bl ov07_0221FAB0
	cmp r0, #1
	beq _02227030
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	cmp r0, #2
	beq _02227020
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	cmp r0, #3
	bne _02227030
_02227020:
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_02227030:
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	add r7, r0, #0
	add r0, r5, #0
	bl ov07_0221C468
	add r6, r0, #0
	add r0, r5, #0
	bl ov07_0221C470
	str r0, [sp]
	ldr r0, [r4, #0x2c]
	cmp r0, #0xff
	beq _0222707E
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_02231924
	add r6, r0, #0
	ldr r1, [sp]
	add r0, r5, #0
	bl ov07_02231924
	cmp r7, #3
	bhi _0222707E
	add r1, r7, r7
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02227072: ; jump table
	.short _0222707A - _02227072 - 2 ; case 0
	.short _02227104 - _02227072 - 2 ; case 1
	.short _022270C0 - _02227072 - 2 ; case 2
	.short _02227148 - _02227072 - 2 ; case 3
_0222707A:
	cmp r6, #5
	bls _02227080
_0222707E:
	b _0222718A
_02227080:
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222708C: ; jump table
	.short _0222718A - _0222708C - 2 ; case 0
	.short _0222718A - _0222708C - 2 ; case 1
	.short _02227098 - _0222708C - 2 ; case 2
	.short _022270A2 - _0222708C - 2 ; case 3
	.short _022270AC - _0222708C - 2 ; case 4
	.short _022270B6 - _0222708C - 2 ; case 5
_02227098:
	ldr r0, [r4, #0x1c]
	mov r1, #0x14
	bl sub_0200DD68
	b _0222718A
_022270A2:
	ldr r0, [r4, #0x1c]
	mov r1, #0xa
	bl sub_0200DD68
	b _0222718A
_022270AC:
	ldr r0, [r4, #0x1c]
	mov r1, #0xa
	bl sub_0200DD68
	b _0222718A
_022270B6:
	ldr r0, [r4, #0x1c]
	mov r1, #0x14
	bl sub_0200DD68
	b _0222718A
_022270C0:
	cmp r6, #5
	bhi _0222718A
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022270D0: ; jump table
	.short _0222718A - _022270D0 - 2 ; case 0
	.short _0222718A - _022270D0 - 2 ; case 1
	.short _022270DC - _022270D0 - 2 ; case 2
	.short _022270E6 - _022270D0 - 2 ; case 3
	.short _022270F0 - _022270D0 - 2 ; case 4
	.short _022270FA - _022270D0 - 2 ; case 5
_022270DC:
	ldr r0, [r4, #0x1c]
	mov r1, #0xa
	bl sub_0200DD68
	b _0222718A
_022270E6:
	ldr r0, [r4, #0x1c]
	mov r1, #0x14
	bl sub_0200DD68
	b _0222718A
_022270F0:
	ldr r0, [r4, #0x1c]
	mov r1, #0x14
	bl sub_0200DD68
	b _0222718A
_022270FA:
	ldr r0, [r4, #0x1c]
	mov r1, #0xa
	bl sub_0200DD68
	b _0222718A
_02227104:
	cmp r0, #5
	bhi _0222718A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02227114: ; jump table
	.short _0222718A - _02227114 - 2 ; case 0
	.short _0222718A - _02227114 - 2 ; case 1
	.short _02227120 - _02227114 - 2 ; case 2
	.short _0222712A - _02227114 - 2 ; case 3
	.short _02227134 - _02227114 - 2 ; case 4
	.short _0222713E - _02227114 - 2 ; case 5
_02227120:
	ldr r0, [r4, #0x1c]
	mov r1, #0x14
	bl sub_0200DD68
	b _0222718A
_0222712A:
	ldr r0, [r4, #0x1c]
	mov r1, #0xa
	bl sub_0200DD68
	b _0222718A
_02227134:
	ldr r0, [r4, #0x1c]
	mov r1, #0xa
	bl sub_0200DD68
	b _0222718A
_0222713E:
	ldr r0, [r4, #0x1c]
	mov r1, #0x14
	bl sub_0200DD68
	b _0222718A
_02227148:
	cmp r0, #5
	bhi _0222718A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02227158: ; jump table
	.short _0222718A - _02227158 - 2 ; case 0
	.short _0222718A - _02227158 - 2 ; case 1
	.short _02227164 - _02227158 - 2 ; case 2
	.short _0222716E - _02227158 - 2 ; case 3
	.short _02227178 - _02227158 - 2 ; case 4
	.short _02227182 - _02227158 - 2 ; case 5
_02227164:
	ldr r0, [r4, #0x1c]
	mov r1, #0xa
	bl sub_0200DD68
	b _0222718A
_0222716E:
	ldr r0, [r4, #0x1c]
	mov r1, #0x14
	bl sub_0200DD68
	b _0222718A
_02227178:
	ldr r0, [r4, #0x1c]
	mov r1, #0x14
	bl sub_0200DD68
	b _0222718A
_02227182:
	ldr r0, [r4, #0x1c]
	mov r1, #0xa
	bl sub_0200DD68
_0222718A:
	ldr r0, [r4, #4]
	ldr r1, _02227198 ; =ov07_02226F04
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02227198: .word ov07_02226F04
	thumb_func_end ov07_02226F80

	thumb_func_start ov07_0222719C
ov07_0222719C: ; 0x0222719C
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r2, r0, #0
	ldr r0, [r6, #0x2c]
	cmp r0, #0
	bne _022271B8
	ldr r0, [r6, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
_022271B8:
	sub r0, r0, #1
	str r0, [r6, #0x2c]
	mov r4, #0
	add r5, r6, #0
_022271C0:
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _022271CA
	bl sub_0200DC18
_022271CA:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _022271C0
	ldr r0, [r6, #0xc]
	bl sub_0200D020
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_0222719C

	thumb_func_start ov07_022271DC
ov07_022271DC: ; 0x022271DC
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x34
	add r4, r0, #0
	bl ov07_022324D8
	add r7, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl ov07_02231FE4
	add r0, r4, #0
	mov r1, #0
	bl ov07_0221C4A8
	cmp r0, #0
	bne _02227200
	mov r0, #3
	b _02227208
_02227200:
	add r0, r4, #0
	mov r1, #0
	bl ov07_0221C4A8
_02227208:
	ldr r5, _02227240 ; =ov07_022378B0
	str r0, [r7, #0x2c]
	mov r6, #0
	add r4, r7, #0
_02227210:
	ldr r0, [r7, #4]
	add r1, r6, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x1c]
	cmp r0, #0
	beq _02227224
	ldr r1, [r5]
	bl sub_0200DD68
_02227224:
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #4
	blt _02227210
	ldr r0, [r7, #4]
	ldr r1, _02227244 ; =ov07_0222719C
	add r2, r7, #0
	bl ov07_0221C410
	add r1, r7, #0
	bl ov07_0222719C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02227240: .word ov07_022378B0
_02227244: .word ov07_0222719C
	thumb_func_end ov07_022271DC

	thumb_func_start ov07_02227248
ov07_02227248: ; 0x02227248
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r1, #0
	add r4, r0, #0
	ldrb r0, [r5, #8]
	cmp r0, #0
	beq _0222725C
	cmp r0, #1
	beq _022272A4
	b _022272BC
_0222725C:
	mov r0, #0
	str r0, [r5]
	ldr r0, [r5, #0xc]
	mov r1, #2
	bl ov07_0221FAF8
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl ov07_02222D88
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl ov07_0221BFD0
	mov r1, #0xc8
	str r1, [sp]
	mov r3, #2
	str r4, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r1, #0
	mov r1, #0xa0
	add r2, r1, #0
	add r2, #0xb5
	lsl r3, r3, #0x10
	bl ov07_02222CCC
	str r0, [r5, #0x24]
	ldrb r0, [r5, #8]
	add sp, #0x14
	add r0, r0, #1
	strb r0, [r5, #8]
	pop {r3, r4, r5, r6, pc}
_022272A4:
	ldr r0, [r5]
	add r1, r0, #1
	str r1, [r5]
	ldr r0, [r5, #4]
	cmp r1, r0
	blt _022272CA
	ldr r0, [r5, #0x24]
	bl ov07_02222D3C
	ldrb r0, [r5, #8]
	add r0, r0, #1
	strb r0, [r5, #8]
_022272BC:
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	bl ov07_0221C448
	add r0, r5, #0
	bl FreeToHeap
_022272CA:
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02227248

	thumb_func_start ov07_022272D0
ov07_022272D0: ; 0x022272D0
	push {r3, r4, r5, lr}
	mov r1, #0x28
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r1, r4, #0
	add r0, r5, #0
	add r1, #8
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #4]
	ldr r0, [r4, #0xc]
	ldr r1, _022272FC ; =ov07_02227248
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022272FC: .word ov07_02227248
	thumb_func_end ov07_022272D0

	thumb_func_start ov07_02227300
ov07_02227300: ; 0x02227300
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r4, r1, #0
	str r0, [sp, #0xc]
	ldrb r0, [r4]
	cmp r0, #3
	bls _02227310
	b _02227482
_02227310:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222731C: ; jump table
	.short _02227324 - _0222731C - 2 ; case 0
	.short _022273D6 - _0222731C - 2 ; case 1
	.short _022273F4 - _0222731C - 2 ; case 2
	.short _0222744E - _0222731C - 2 ; case 3
_02227324:
	ldrb r0, [r4, #4]
	mov r7, #0
	add r1, r7, #0
	add r0, r0, #1
	strb r0, [r4, #4]
	ldr r0, [r4, #8]
	bl ov07_0221C4A8
	cmp r0, #0
	ble _0222739A
	ldr r6, _022274F0 ; =ov07_022366D2
	add r5, r4, #0
_0222733C:
	add r1, sp, #0x10
	ldr r0, [r5, #0x14]
	add r1, #2
	add r2, sp, #0x10
	bl sub_0200DE44
	ldrb r1, [r4, #4]
	ldrb r0, [r6]
	cmp r1, r0
	blo _02227380
	add r0, r4, r7
	ldrb r1, [r0, #1]
	add r1, r1, #1
	strb r1, [r0, #1]
	ldrb r2, [r0, #1]
	ldrb r1, [r6, #1]
	cmp r2, r1
	blo _02227388
	mov r1, #0
	strb r1, [r0, #1]
	ldr r0, [r5, #0x14]
	bl sub_0200DCFC
	cmp r0, #1
	ldr r0, [r5, #0x14]
	bne _02227378
	mov r1, #0
	bl sub_0200DCE8
	b _02227388
_02227378:
	mov r1, #1
	bl sub_0200DCE8
	b _02227388
_02227380:
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl sub_0200DCE8
_02227388:
	ldr r0, [r4, #8]
	mov r1, #0
	add r5, r5, #4
	add r6, r6, #2
	add r7, r7, #1
	bl ov07_0221C4A8
	cmp r7, r0
	blt _0222733C
_0222739A:
	ldrb r0, [r4, #4]
	cmp r0, #0x2d
	blo _02227438
	mov r5, #0
	ldr r0, [r4, #8]
	add r1, r5, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _022273CA
	add r6, r4, #0
	mov r7, #1
_022273B2:
	ldr r0, [r6, #0x14]
	add r1, r7, #0
	bl sub_0200DCE8
	ldr r0, [r4, #8]
	mov r1, #0
	add r6, r6, #4
	add r5, r5, #1
	bl ov07_0221C4A8
	cmp r5, r0
	blt _022273B2
_022273CA:
	mov r0, #0
	strb r0, [r4, #4]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _022274BC
_022273D6:
	mov r1, #0x64
	str r1, [sp]
	str r1, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x20
	mov r2, #0x3c
	add r3, r1, #0
	bl ov07_02222590
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _022274BC
_022273F4:
	add r0, r4, #0
	add r0, #0x20
	bl ov07_0222260C
	cmp r0, #1
	bne _0222743A
	mov r5, #0
	ldr r0, [r4, #8]
	add r1, r5, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _022274BC
	add r7, r4, #0
	add r6, r4, #0
	add r7, #0x20
_02227414:
	add r0, r7, #0
	add r1, sp, #0x18
	add r2, sp, #0x14
	bl ov07_02222644
	ldr r0, [r6, #0x14]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x14]
	bl sub_0200E024
	ldr r0, [r4, #8]
	mov r1, #0
	add r6, r6, #4
	add r5, r5, #1
	bl ov07_0221C4A8
	cmp r5, r0
	blt _02227414
_02227438:
	b _022274BC
_0222743A:
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	ldrb r0, [r4, #4]
	cmp r0, #0x2d
	blo _022274BC
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _022274BC
_0222744E:
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _02227458
	sub r0, r0, #1
	strb r0, [r4, #5]
_02227458:
	ldrb r0, [r4, #6]
	cmp r0, #0xf
	bhs _02227462
	add r0, r0, #1
	strb r0, [r4, #6]
_02227462:
	ldrb r0, [r4, #5]
	cmp r0, #0
	bne _02227474
	ldrb r0, [r4, #6]
	cmp r0, #0xf
	bne _02227474
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02227474:
	ldrb r0, [r4, #6]
	ldrb r1, [r4, #5]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _022274F4 ; =0x04000052
	strh r1, [r0]
	b _022274BC
_02227482:
	mov r5, #0
	ldr r0, [r4, #8]
	add r1, r5, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _022274AA
	add r6, r4, #0
	add r7, r5, #0
_02227494:
	ldr r0, [r6, #0x14]
	bl sub_0200D9DC
	ldr r0, [r4, #8]
	add r1, r7, #0
	add r6, r6, #4
	add r5, r5, #1
	bl ov07_0221C4A8
	cmp r5, r0
	blt _02227494
_022274AA:
	ldr r0, [r4, #8]
	ldr r1, [sp, #0xc]
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_022274BC:
	mov r5, #0
	ldr r0, [r4, #8]
	add r1, r5, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _022274E6
	add r6, r4, #0
	add r7, r5, #0
_022274CE:
	ldr r0, [r6, #0x14]
	ldr r0, [r0]
	bl sub_0200DC0C
	ldr r0, [r4, #8]
	add r1, r7, #0
	add r6, r6, #4
	add r5, r5, #1
	bl ov07_0221C4A8
	cmp r5, r0
	blt _022274CE
_022274E6:
	ldr r0, [r4, #0x10]
	bl sub_0200D020
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_022274F0: .word ov07_022366D2
_022274F4: .word 0x04000052
	thumb_func_end ov07_02227300

	thumb_func_start ov07_022274F8
ov07_022274F8: ; 0x022274F8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	str r0, [sp]
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov07_0221BFD0
	mov r1, #0x44
	bl AllocFromHeap
	add r4, r0, #0
	bne _02227516
	bl GF_AssertFail
_02227516:
	mov r0, #0
	strb r0, [r4, #4]
	strb r0, [r4]
	str r5, [r4, #0xc]
	ldr r0, [sp]
	str r6, [r4, #0x10]
	str r0, [r4, #8]
	ldr r1, [sp]
	add r0, sp, #8
	bl ov07_0221F9E8
	mov r1, #0
	mvn r1, r1
	ldr r0, [r4, #8]
	add r2, r1, #0
	bl ov07_02231E08
	mov r0, #0xf
	strb r0, [r4, #5]
	mov r0, #0
	strb r0, [r4, #6]
	ldrb r0, [r4, #6]
	ldrb r1, [r4, #5]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02227628 ; =0x04000052
	strh r1, [r0]
	ldr r0, [sp]
	str r7, [r4, #0x14]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [sp]
	bl ov07_0223192C
	cmp r0, #3
	bne _02227572
	ldr r0, [sp]
	bl ov07_0221BFC0
	add r1, r0, #0
	mov r0, #0
	add r2, sp, #4
	bl ov07_02231A20
	b _02227582
_02227572:
	ldr r0, [sp]
	bl ov07_0221BFC0
	add r1, r0, #0
	mov r0, #1
	add r2, sp, #4
	bl ov07_02231A20
_02227582:
	ldr r0, [r4, #8]
	mov r1, #0
	mov r6, #1
	bl ov07_0221C4A8
	cmp r0, #1
	ble _022275BC
	add r5, r4, #4
	add r7, sp, #4
_02227594:
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r2, sp, #8
	bl sub_0200D734
	str r0, [r5, #0x14]
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r7, r1]
	ldrsh r2, [r7, r2]
	bl sub_0200DDB8
	ldr r0, [r4, #8]
	mov r1, #0
	add r5, r5, #4
	add r6, r6, #1
	bl ov07_0221C4A8
	cmp r6, r0
	blt _02227594
_022275BC:
	add r3, sp, #4
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r0, [r4, #0x14]
	bl sub_0200DDB8
	mov r6, #0
	ldr r0, [r4, #8]
	add r1, r6, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _02227616
	add r5, r4, #0
	add r7, r6, #0
_022275DE:
	add r1, r4, r6
	mov r0, #0
	strb r0, [r1, #1]
	ldr r0, [r5, #0x14]
	mov r1, #2
	bl sub_0200DF98
	mov r2, #0x20
	sub r2, r2, r7
	lsl r2, r2, #0x10
	ldr r0, [r5, #0x14]
	mov r1, #0
	asr r2, r2, #0x10
	bl sub_0200DED0
	ldr r0, [r5, #0x14]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #8]
	mov r1, #0
	add r5, r5, #4
	add r7, r7, #4
	add r6, r6, #1
	bl ov07_0221C4A8
	cmp r6, r0
	blt _022275DE
_02227616:
	mov r3, #1
	ldr r0, [sp]
	ldr r1, _0222762C ; =ov07_02227300
	add r2, r4, #0
	lsl r3, r3, #0xc
	bl ov07_0221C3F4
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02227628: .word 0x04000052
_0222762C: .word ov07_02227300
	thumb_func_end ov07_022274F8

	thumb_func_start ov07_02227630
ov07_02227630: ; 0x02227630
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #5
	bls _02227640
	b _02227810
_02227640:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222764C: ; jump table
	.short _02227658 - _0222764C - 2 ; case 0
	.short _022276BA - _0222764C - 2 ; case 1
	.short _022276D4 - _0222764C - 2 ; case 2
	.short _022276F8 - _0222764C - 2 ; case 3
	.short _02227752 - _0222764C - 2 ; case 4
	.short _022277A0 - _0222764C - 2 ; case 5
_02227658:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	bne _022276B0
	add r0, r4, #0
	add r0, #0x38
	bl ov07_022227D8
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0xd
	bl sub_020087A4
	mov r2, #0x38
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_02008C2C
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_022276B0:
	ldrb r0, [r4]
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022276BA:
	mov r0, #0x1f
	str r0, [sp]
	mov r1, #0
	ldr r0, [r4, #0x10]
	mov r2, #0xa
	add r3, r1, #0
	bl sub_020090B4
	ldrb r0, [r4]
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022276D4:
	ldr r0, [r4, #0x10]
	bl sub_02009138
	cmp r0, #0
	bne _02227702
	mov r0, #0x1f
	str r0, [sp]
	mov r2, #0
	ldr r0, [r4, #0x10]
	mov r1, #0xa
	add r3, r2, #0
	bl sub_020090B4
	ldrb r0, [r4]
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022276F8:
	ldr r0, [r4, #0x10]
	bl sub_02009138
	cmp r0, #0
	beq _02227704
_02227702:
	b _0222781E
_02227704:
	ldrb r0, [r4, #8]
	add r0, r0, #1
	strb r0, [r4, #8]
	ldrb r0, [r4, #8]
	cmp r0, #3
	blo _0222774A
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ov07_0221C4A8
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl ov07_0221C4A8
	add r6, r0, #0
	ldr r0, [r4, #0xc]
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [sp]
	add r0, r4, #0
	lsl r1, r5, #0x10
	lsl r3, r6, #0x10
	add r0, #0x14
	asr r1, r1, #0x10
	mov r2, #0x64
	asr r3, r3, #0x10
	bl ov07_02222508
	ldrb r0, [r4]
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0222774A:
	mov r0, #1
	add sp, #4
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02227752:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	bne _02227796
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_02227796:
	ldrb r0, [r4]
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_022277A0:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	ldr r0, [r4, #0x10]
	bne _022277E4
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x28]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_022277E4:
	mov r1, #0xc
	add r2, r1, #0
	add r2, #0xf4
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #0x10]
	add r2, #0xf3
	bl sub_020087A4
	mov r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_020087A4
	ldrb r0, [r4]
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02227810:
	ldr r0, [r4, #0xc]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_0222781E:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02227630

	thumb_func_start ov07_02227824
ov07_02227824: ; 0x02227824
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0x5c
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4, #8]
	strb r0, [r4]
	str r5, [r4, #0xc]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #2]
	ldr r0, [r4, #0xc]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FAA0
	str r0, [r4, #4]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0x64
	lsl r3, r6, #0x10
	add r0, #0x14
	add r2, r1, #0
	asr r3, r3, #0x10
	bl ov07_02222508
	mov r0, #0xa
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0
	add r0, #0x38
	mov r1, #2
	add r3, r2, #0
	bl ov07_022227A8
	ldr r0, [r4, #0xc]
	ldr r1, _022278AC ; =ov07_02227630
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_022278AC: .word ov07_02227630
	thumb_func_end ov07_02227824

	thumb_func_start ov07_022278B0
ov07_022278B0: ; 0x022278B0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #4
	bls _022278C0
	b _02227AD8
_022278C0:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022278CC: ; jump table
	.short _022278D6 - _022278CC - 2 ; case 0
	.short _0222793C - _022278CC - 2 ; case 1
	.short _022279A0 - _022278CC - 2 ; case 2
	.short _02227A04 - _022278CC - 2 ; case 3
	.short _02227A68 - _022278CC - 2 ; case 4
_022278D6:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_0222260C
	cmp r0, #1
	bne _0222791A
	mov r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_0222791A:
	mov r1, #0x96
	str r1, [sp]
	mov r0, #0x64
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #0x32
	add r0, #0x10
	add r3, r2, #0
	bl ov07_02222590
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_0222793C:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_0222260C
	cmp r0, #1
	bne _02227980
	mov r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_02227980:
	mov r2, #0x64
	str r2, [sp]
	str r2, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x10
	mov r1, #0x32
	mov r3, #0x96
	bl ov07_02222590
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_022279A0:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_0222260C
	cmp r0, #1
	bne _022279E4
	mov r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_022279E4:
	mov r2, #0x96
	mov r1, #0x64
	str r2, [sp]
	str r1, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x10
	add r3, r1, #0
	bl ov07_02222590
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02227A04:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_0222260C
	cmp r0, #1
	bne _02227A48
	mov r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_02227A48:
	mov r2, #0x64
	str r2, [sp]
	str r2, [sp, #4]
	mov r0, #5
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0x96
	add r0, #0x10
	add r3, r1, #0
	bl ov07_02222590
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02227A68:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_0222260C
	cmp r0, #1
	ldr r0, [r4, #0xc]
	bne _02227AAC
	mov r2, #0x10
	ldrsh r2, [r4, r2]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #2
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #4]
	ldr r2, [r4, #0x24]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #0xc
	pop {r3, r4, pc}
_02227AAC:
	mov r1, #0xc
	add r2, r1, #0
	add r2, #0xf4
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #0xc]
	add r2, #0xf3
	bl sub_020087A4
	mov r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_020087A4
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02227AD8:
	ldr r0, [r4, #8]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov07_022278B0

	thumb_func_start ov07_02227AEC
ov07_02227AEC: ; 0x02227AEC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0x58
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4]
	str r5, [r4, #8]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #2]
	ldr r0, [r4, #8]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FAA0
	str r0, [r4, #4]
	mov r0, #0x32
	str r0, [sp]
	mov r1, #0x64
	str r1, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x10
	mov r2, #0x96
	add r3, r1, #0
	bl ov07_02222590
	ldr r0, [r4, #8]
	ldr r1, _02227B54 ; =ov07_022278B0
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02227B54: .word ov07_022278B0
	thumb_func_end ov07_02227AEC

	thumb_func_start ov07_02227B58
ov07_02227B58: ; 0x02227B58
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r1, #0
	add r2, r0, #0
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _02227B72
	cmp r0, #1
	beq _02227C58
	cmp r0, #2
	bne _02227B70
	b _02227CBA
_02227B70:
	b _02227CEE
_02227B72:
	ldrb r3, [r5]
	mov r0, #0x1f
	lsr r2, r3, #0x1f
	lsl r1, r3, #0x1f
	sub r1, r1, r2
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #1
	add r1, r3, #1
	str r0, [sp, #0xc]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	str r0, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r0, #6
	mul r0, r1
	ldr r1, _02227D0C ; =ov07_02236736
	ldrsh r2, [r1, r0]
	ldr r1, [sp, #8]
	sub r7, r2, r1
	mov r1, #0xa
	ldrsh r3, [r5, r1]
	ldr r1, _02227D10 ; =ov07_02236734
	ldrsh r6, [r1, r0]
	mov r1, #8
	ldrsh r2, [r5, r1]
	ldr r1, _02227D14 ; =ov07_02236732
	ldrsh r4, [r1, r0]
	lsl r0, r7, #0x10
	str r3, [sp]
	add r1, r2, r4
	lsr r0, r0, #0x10
	add r2, r2, r6
	str r0, [sp, #4]
	add r0, r5, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	add r0, #0x28
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_02222268
	mov r0, #0xa
	ldrsh r3, [r5, r0]
	mov r0, #8
	ldrsh r2, [r5, r0]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	sub r1, r2, r4
	str r3, [sp]
	sub r2, r2, r6
	str r0, [sp, #4]
	add r0, r5, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	add r0, #0x4c
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_02222268
	ldr r0, [sp, #0xc]
	add r1, r0, #1
	mov r0, #6
	mul r0, r1
	ldr r1, _02227D0C ; =ov07_02236736
	ldrsh r2, [r1, r0]
	ldr r1, [sp, #8]
	sub r7, r2, r1
	mov r1, #0xa
	ldrsh r3, [r5, r1]
	ldr r1, _02227D10 ; =ov07_02236734
	ldrsh r6, [r1, r0]
	mov r1, #8
	ldrsh r2, [r5, r1]
	ldr r1, _02227D14 ; =ov07_02236732
	ldrsh r4, [r1, r0]
	lsl r0, r7, #0x10
	str r3, [sp]
	add r1, r2, r4
	lsr r0, r0, #0x10
	add r2, r2, r6
	str r0, [sp, #4]
	add r0, r5, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	add r0, #0x70
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_02222268
	mov r0, #0xa
	ldrsh r3, [r5, r0]
	mov r0, #8
	ldrsh r2, [r5, r0]
	lsl r0, r7, #0x10
	lsr r0, r0, #0x10
	sub r1, r2, r4
	str r3, [sp]
	sub r2, r2, r6
	str r0, [sp, #4]
	add r0, r5, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	add r0, #0x94
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_02222268
	ldrb r0, [r5]
	add r0, r0, #1
	strb r0, [r5]
	ldrb r0, [r5, #1]
	add r0, r0, #1
	strb r0, [r5, #1]
_02227C58:
	mov r0, #0
	add r7, r5, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	add r7, #0x28
	add r6, r5, #0
	add r4, r5, #0
_02227C66:
	add r0, r7, #0
	bl ov07_022222B4
	cmp r0, #0
	bne _02227C7C
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	b _02227C8A
_02227C7C:
	mov r1, #0x28
	mov r2, #0x2a
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r4, #0x18]
	bl sub_0200DDB8
_02227C8A:
	ldr r0, [r4, #0x18]
	bl sub_0200DC18
	ldr r0, [sp, #0x14]
	add r7, #0x24
	add r0, r0, #1
	add r6, #0x24
	add r4, r4, #4
	str r0, [sp, #0x14]
	cmp r0, #4
	blt _02227C66
	ldr r0, [sp, #0x10]
	cmp r0, #4
	bne _02227D00
	ldrb r0, [r5]
	cmp r0, #9
	bne _02227CB4
	ldrb r0, [r5, #1]
	add r0, r0, #1
	strb r0, [r5, #1]
	b _02227D00
_02227CB4:
	mov r0, #0
	strb r0, [r5, #1]
	b _02227D00
_02227CBA:
	ldrb r0, [r5, #4]
	cmp r0, #0
	beq _02227CC4
	sub r0, r0, #1
	strb r0, [r5, #4]
_02227CC4:
	ldrb r0, [r5, #5]
	cmp r0, #0xf
	bhs _02227CCE
	add r0, r0, #1
	strb r0, [r5, #5]
_02227CCE:
	ldrb r0, [r5, #4]
	cmp r0, #0
	bne _02227CE0
	ldrb r0, [r5, #5]
	cmp r0, #0xf
	bne _02227CE0
	ldrb r0, [r5, #1]
	add r0, r0, #1
	strb r0, [r5, #1]
_02227CE0:
	ldrb r0, [r5, #5]
	ldrb r1, [r5, #4]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02227D18 ; =0x04000052
	strh r1, [r0]
	b _02227D00
_02227CEE:
	ldr r0, [r5, #0xc]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r5, #0
	bl FreeToHeap
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
_02227D00:
	ldr r0, [r5, #0x14]
	bl sub_0200D020
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02227D0C: .word ov07_02236736
_02227D10: .word ov07_02236734
_02227D14: .word ov07_02236732
_02227D18: .word 0x04000052
	thumb_func_end ov07_02227B58

	thumb_func_start ov07_02227D1C
ov07_02227D1C: ; 0x02227D1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	str r0, [sp, #0x18]
	bl ov07_0221BFD0
	mov r1, #0xb8
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4, #1]
	strb r0, [r4]
	ldr r0, [sp, #0x18]
	str r0, [r4, #0xc]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #8]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0xa]
	ldr r0, [r4, #0x10]
	mov r1, #0x29
	bl sub_02008A78
	mov r1, #0xa
	ldrsh r1, [r4, r1]
	sub r0, r1, r0
	strh r0, [r4, #0xa]
	ldr r0, [r4, #0xc]
	bl ov07_0221C514
	str r0, [r4, #0x14]
	mov r0, #8
	strb r0, [r4, #4]
	mov r1, #6
	strb r1, [r4, #5]
	sub r1, r1, #7
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl ov07_02231E08
	ldrb r0, [r4, #5]
	ldrb r1, [r4, #4]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02227F9C ; =0x04000052
	strh r1, [r0]
	ldr r0, [r4, #0xc]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FA80
	str r0, [sp, #0x20]
	ldr r0, [r4, #0xc]
	bl ov07_0221FAE8
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221FA90
	str r0, [sp, #0x1c]
	mov r6, #0
	add r5, r4, #0
_02227DBA:
	ldr r0, [r4, #0xc]
	add r1, r6, #0
	bl ov07_0221C4E8
	mov r1, #1
	str r0, [r5, #0x18]
	bl sub_0200E0FC
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #4
	blt _02227DBA
	ldr r0, [r4, #0xc]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0223192C
	cmp r0, #3
	ldr r0, [r4, #0x18]
	bne _02227EAA
	mov r1, #0xa
	bl sub_0200DD68
	ldr r0, [r4, #0x1c]
	mov r1, #0xa
	bl sub_0200DD68
	ldr r0, [r4, #0x20]
	mov r1, #0x14
	bl sub_0200DD68
	ldr r0, [r4, #0x24]
	mov r1, #0x14
	bl sub_0200DD68
	ldr r0, [r4, #0x18]
	add r1, r7, #0
	bl sub_0200DD54
	ldr r0, [r4, #0x1c]
	add r1, r7, #0
	bl sub_0200DD54
	ldr r0, [r4, #0x20]
	add r1, r7, #0
	bl sub_0200DD54
	ldr r0, [r4, #0x24]
	add r1, r7, #0
	bl sub_0200DD54
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	add r6, r0, #0
	ldr r0, [sp, #0x18]
	bl ov07_0221BFD0
	add r3, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	lsl r0, r5, #0x14
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	add r0, r6, #0
	bl sub_02003FC8
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	add r6, r0, #0
	ldr r0, [sp, #0x18]
	bl ov07_0221BFD0
	add r3, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	lsl r0, r5, #0x14
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xc4
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	add r0, r6, #0
	bl sub_02003FC8
	b _02227F8C
_02227EAA:
	mov r1, #0x14
	bl sub_0200DD68
	ldr r0, [r4, #0x1c]
	mov r1, #0x14
	bl sub_0200DD68
	ldr r0, [r4, #0x20]
	mov r1, #0xa
	bl sub_0200DD68
	ldr r0, [r4, #0x24]
	mov r1, #0xa
	bl sub_0200DD68
	ldr r0, [r4, #0x18]
	add r1, r7, #1
	bl sub_0200DD54
	ldr r0, [r4, #0x1c]
	add r1, r7, #1
	bl sub_0200DD54
	ldr r0, [r4, #0x20]
	add r1, r7, #1
	bl sub_0200DD54
	ldr r0, [r4, #0x24]
	add r1, r7, #1
	bl sub_0200DD54
	ldr r0, [r4, #0x18]
	add r1, r7, #0
	bl sub_0200DD54
	ldr r0, [r4, #0x1c]
	add r1, r7, #0
	bl sub_0200DD54
	ldr r0, [r4, #0x20]
	add r1, r7, #0
	bl sub_0200DD54
	ldr r0, [r4, #0x24]
	add r1, r7, #0
	bl sub_0200DD54
	ldr r0, [r4, #0x18]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	add r6, r0, #0
	ldr r0, [sp, #0x18]
	bl ov07_0221BFD0
	add r3, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	lsl r0, r5, #0x14
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xc4
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	add r0, r6, #0
	bl sub_02003FC8
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	add r6, r0, #0
	ldr r0, [sp, #0x18]
	bl ov07_0221BFD0
	add r3, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	lsl r0, r5, #0x14
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0x80
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	ldr r2, [sp, #0x20]
	add r0, r6, #0
	bl sub_02003FC8
_02227F8C:
	ldr r0, [r4, #0xc]
	ldr r1, _02227FA0 ; =ov07_02227B58
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02227F9C: .word 0x04000052
_02227FA0: .word ov07_02227B58
	thumb_func_end ov07_02227D1C

	thumb_func_start ov07_02227FA4
ov07_02227FA4: ; 0x02227FA4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02227FB6
	cmp r0, #1
	beq _02228010
	b _02228050
_02227FB6:
	ldrb r1, [r4, #2]
	ldr r5, _02228060 ; =ov07_022366CD
	mov r2, #0x64
	lsl r0, r1, #1
	add r3, r1, r0
	ldr r0, _02228064 ; =ov07_022366CE
	ldr r1, _02228068 ; =ov07_022366CC
	ldrb r0, [r0, r3]
	ldrb r1, [r1, r3]
	ldrb r3, [r5, r3]
	str r0, [sp]
	add r0, r4, #0
	add r0, #0xc
	bl ov07_02222508
	ldrb r0, [r4, #2]
	cmp r0, #0
	ldr r0, _0222806C ; =0x00007FFF
	bne _02227FEC
	str r0, [sp]
	mov r1, #0
	ldr r0, [r4, #8]
	mov r2, #6
	add r3, r1, #0
	bl sub_020090B4
	b _02227FFA
_02227FEC:
	str r0, [sp]
	mov r2, #0
	ldr r0, [r4, #8]
	mov r1, #6
	add r3, r2, #0
	bl sub_020090B4
_02227FFA:
	ldrb r1, [r4, #2]
	mov r0, #1
	eor r0, r1
	strb r0, [r4, #2]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02228010:
	add r0, r4, #0
	add r0, #0xc
	bl ov07_02222558
	cmp r0, #0
	bne _02228038
	ldr r0, [r4, #8]
	bl sub_02009138
	cmp r0, #0
	bne _02228038
	ldrb r0, [r4, #1]
	cmp r0, #4
	ldrb r0, [r4]
	bhs _02228034
	sub r0, r0, #1
	strb r0, [r4]
	b _02228038
_02228034:
	add r0, r0, #1
	strb r0, [r4]
_02228038:
	mov r1, #0xc
	ldrsh r2, [r4, r1]
	ldr r0, [r4, #8]
	bl sub_020087A4
	mov r2, #0xe
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	mov r1, #0xd
	bl sub_020087A4
	pop {r3, r4, r5, pc}
_02228050:
	ldr r0, [r4, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02228060: .word ov07_022366CD
_02228064: .word ov07_022366CE
_02228068: .word ov07_022366CC
_0222806C: .word 0x00007FFF
	thumb_func_end ov07_02227FA4

	thumb_func_start ov07_02228070
ov07_02228070: ; 0x02228070
	push {r3, r4, r5, lr}
	mov r1, #0x30
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #2]
	strb r0, [r4, #1]
	str r5, [r4, #4]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	ldr r1, _022280A4 ; =ov07_02227FA4
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_022280A4: .word ov07_02227FA4
	thumb_func_end ov07_02228070

	thumb_func_start ov07_022280A8
ov07_022280A8: ; 0x022280A8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _022280BC
	cmp r0, #1
	beq _022280F6
	b _0222814E
_022280BC:
	ldrb r1, [r4, #1]
	ldr r2, _02228160 ; =ov07_02236714
	ldr r5, _02228164 ; =ov07_02236715
	lsl r0, r1, #2
	add r3, r1, r0
	ldr r0, _02228168 ; =ov07_02236716
	ldr r1, _0222816C ; =ov07_02236713
	ldrb r0, [r0, r3]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	str r0, [sp]
	mov r0, #0x64
	str r0, [sp, #4]
	ldr r0, _02228170 ; =ov07_02236717
	ldrb r0, [r0, r3]
	ldrb r3, [r5, r3]
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x10
	bl ov07_02222590
	ldrb r0, [r4, #1]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, pc}
_022280F6:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_0222260C
	cmp r0, #0
	bne _02228114
	ldrb r0, [r4, #1]
	cmp r0, #3
	ldrb r0, [r4]
	bhs _02228110
	sub r0, r0, #1
	strb r0, [r4]
	b _02228114
_02228110:
	add r0, r0, #1
	strb r0, [r4]
_02228114:
	mov r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #2
	mov r1, #4
	ldrsh r0, [r4, r0]
	ldrsh r1, [r4, r1]
	ldr r2, [r4, #0x24]
	bl ov07_02222674
	mov r2, #2
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	add sp, #0xc
	pop {r4, r5, pc}
_0222814E:
	ldr r0, [r4, #8]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02228160: .word ov07_02236714
_02228164: .word ov07_02236715
_02228168: .word ov07_02236716
_0222816C: .word ov07_02236713
_02228170: .word ov07_02236717
	thumb_func_end ov07_022280A8

	thumb_func_start ov07_02228174
ov07_02228174: ; 0x02228174
	push {r3, r4, r5, lr}
	mov r1, #0x34
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	str r5, [r4, #8]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #2]
	ldr r0, [r4, #8]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FAA0
	strh r0, [r4, #4]
	ldr r0, [r4, #8]
	ldr r1, _022281BC ; =ov07_022280A8
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	.balign 4, 0
_022281BC: .word ov07_022280A8
	thumb_func_end ov07_02228174

	thumb_func_start ov07_022281C0
ov07_022281C0: ; 0x022281C0
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #5
	bls _022281D0
	b _02228330
_022281D0:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022281DC: ; jump table
	.short _022281E8 - _022281DC - 2 ; case 0
	.short _02228222 - _022281DC - 2 ; case 1
	.short _02228264 - _022281DC - 2 ; case 2
	.short _0222828E - _022281DC - 2 ; case 3
	.short _022282B0 - _022281DC - 2 ; case 4
	.short _022282EE - _022281DC - 2 ; case 5
_022281E8:
	ldrb r1, [r4, #1]
	ldr r2, _02228370 ; =ov07_022366EC
	ldr r5, _02228374 ; =ov07_022366ED
	lsl r0, r1, #2
	add r3, r1, r0
	ldr r0, _02228378 ; =ov07_022366EE
	ldr r1, _0222837C ; =ov07_022366EB
	ldrb r0, [r0, r3]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	str r0, [sp]
	mov r0, #0x64
	str r0, [sp, #4]
	ldr r0, _02228380 ; =ov07_022366EF
	ldrb r0, [r0, r3]
	ldrb r3, [r5, r3]
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x10
	bl ov07_02222590
	ldrb r0, [r4, #1]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, pc}
_02228222:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_0222260C
	cmp r0, #0
	bne _02228234
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02228234:
	mov r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #0
	str r0, [sp]
	mov r1, #2
	mov r2, #6
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	bl ov07_022226C4
	add sp, #0xc
	pop {r4, r5, pc}
_02228264:
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_02008A78
	mov r1, #0
	add r3, r0, #0
	lsl r3, r3, #0x10
	str r1, [sp]
	mov r0, #5
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x10
	add r2, r1, #0
	asr r3, r3, #0x10
	bl ov07_02222268
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, pc}
_0222828E:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_022222B4
	cmp r0, #0
	bne _022282A0
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_022282A0:
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_020087A4
	add sp, #0xc
	pop {r4, r5, pc}
_022282B0:
	ldrb r1, [r4, #1]
	ldr r2, _02228370 ; =ov07_022366EC
	ldr r5, _02228374 ; =ov07_022366ED
	lsl r0, r1, #2
	add r3, r1, r0
	ldr r0, _02228378 ; =ov07_022366EE
	ldr r1, _0222837C ; =ov07_022366EB
	ldrb r0, [r0, r3]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	str r0, [sp]
	mov r0, #0x64
	str r0, [sp, #4]
	ldr r0, _02228380 ; =ov07_022366EF
	ldrb r0, [r0, r3]
	ldrb r3, [r5, r3]
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x10
	bl ov07_02222590
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #2]
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, pc}
_022282EE:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_0222260C
	cmp r0, #0
	bne _02228300
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02228300:
	mov r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #1
	str r0, [sp]
	mov r1, #2
	mov r2, #6
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	bl ov07_022226C4
	add sp, #0xc
	pop {r4, r5, pc}
_02228330:
	mov r2, #4
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_020087A4
	ldr r0, [r4, #0xc]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r4, #0xc]
	add r2, #0xf4
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #0xc]
	add r2, #0xf3
	bl sub_020087A4
	ldr r0, [r4, #8]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_02228370: .word ov07_022366EC
_02228374: .word ov07_022366ED
_02228378: .word ov07_022366EE
_0222837C: .word ov07_022366EB
_02228380: .word ov07_022366EF
	thumb_func_end ov07_022281C0

	thumb_func_start ov07_02228384
ov07_02228384: ; 0x02228384
	push {r3, r4, r5, lr}
	mov r1, #0x34
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	str r5, [r4, #8]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #2]
	mov r0, #2
	ldrsh r0, [r4, r0]
	strh r0, [r4, #4]
	ldr r0, [r4, #8]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FAA0
	strh r0, [r4, #6]
	ldr r0, [r4, #8]
	ldr r1, _022283D4 ; =ov07_022281C0
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_022283D4: .word ov07_022281C0
	thumb_func_end ov07_02228384

	thumb_func_start ov07_022283D8
ov07_022283D8: ; 0x022283D8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #4
	bhi _022284C2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022283F2: ; jump table
	.short _022283FC - _022283F2 - 2 ; case 0
	.short _02228436 - _022283F2 - 2 ; case 1
	.short _02228454 - _022283F2 - 2 ; case 2
	.short _0222846A - _022283F2 - 2 ; case 3
	.short _022284A4 - _022283F2 - 2 ; case 4
_022283FC:
	ldr r0, [r4, #8]
	bl ov07_0221E6C8
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, _022284D4 ; =0x00007FFF
	mov r1, #1
	str r0, [sp, #8]
	lsl r2, r2, #0x10
	ldr r0, [r4, #4]
	lsr r2, r2, #0x10
	sub r3, r1, #3
	bl sub_02003370
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4, #0x10]
	mov r2, #0x10
	add r3, r1, #0
	bl sub_020090B4
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02228436:
	ldr r0, [r4, #4]
	bl sub_02003B44
	cmp r0, #0
	bne _022284D0
	ldr r0, [r4, #0x10]
	bl sub_02009138
	cmp r0, #0
	bne _022284D0
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_02228454:
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #5
	bls _022284D0
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_0222846A:
	ldr r0, [r4, #8]
	bl ov07_0221E6C8
	add r2, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _022284D4 ; =0x00007FFF
	mov r1, #1
	str r0, [sp, #8]
	lsl r2, r2, #0x10
	ldr r0, [r4, #4]
	lsr r2, r2, #0x10
	sub r3, r1, #3
	bl sub_02003370
	mov r2, #0
	str r2, [sp]
	ldr r0, [r4, #0x10]
	mov r1, #0x10
	add r3, r2, #0
	bl sub_020090B4
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_022284A4:
	ldr r0, [r4, #4]
	bl sub_02003B44
	cmp r0, #0
	bne _022284D0
	ldr r0, [r4, #0x10]
	bl sub_02009138
	cmp r0, #0
	bne _022284D0
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_022284C2:
	ldr r0, [r4, #8]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_022284D0:
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
_022284D4: .word 0x00007FFF
	thumb_func_end ov07_022283D8

	thumb_func_start ov07_022284D8
ov07_022284D8: ; 0x022284D8
	push {r3, r4, r5, lr}
	mov r1, #0x14
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4, #8]
	add r0, r5, #0
	bl ov07_0221FA78
	str r0, [r4, #4]
	ldr r0, [r4, #8]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	ldr r1, _0222850C ; =ov07_022283D8
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_0222850C: .word ov07_022283D8
	thumb_func_end ov07_022284D8

	thumb_func_start ov07_02228510
ov07_02228510: ; 0x02228510
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02228524
	cmp r0, #1
	beq _02228590
	b _02228604
_02228524:
	ldrb r1, [r4, #1]
	ldr r2, _02228618 ; =ov07_022366F6
	ldr r5, _0222861C ; =ov07_022366F7
	lsl r0, r1, #2
	add r3, r1, r0
	ldr r0, _02228620 ; =ov07_022366F8
	ldr r1, _02228624 ; =ov07_022366F5
	ldrb r0, [r0, r3]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	str r0, [sp]
	mov r0, #0x64
	str r0, [sp, #4]
	ldr r0, _02228628 ; =ov07_022366F9
	ldrb r0, [r0, r3]
	ldrb r3, [r5, r3]
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x10
	bl ov07_02222590
	ldrb r1, [r4, #1]
	ldr r6, _0222862C ; =ov07_022366D8
	lsl r0, r1, #1
	add r5, r1, r0
	mov r0, #4
	ldrsh r3, [r4, r0]
	ldr r0, _02228630 ; =ov07_022366D9
	mov r1, #0
	ldrb r0, [r0, r5]
	add r2, r1, #0
	add r0, r3, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	ldr r0, _02228634 ; =ov07_022366DA
	ldrb r0, [r0, r5]
	ldrb r5, [r6, r5]
	str r0, [sp, #4]
	add r3, r3, r5
	add r0, r4, #0
	lsl r3, r3, #0x10
	add r0, #0x34
	asr r3, r3, #0x10
	bl ov07_02222268
	ldrb r0, [r4, #1]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_02228590:
	add r0, r4, #0
	add r0, #0x10
	mov r5, #0
	bl ov07_0222260C
	cmp r0, #0
	bne _022285A0
	add r5, r5, #1
_022285A0:
	add r0, r4, #0
	add r0, #0x34
	bl ov07_022222B4
	cmp r0, #0
	bne _022285AE
	add r5, r5, #1
_022285AE:
	cmp r5, #2
	blt _022285D4
	ldrb r0, [r4, #1]
	cmp r0, #3
	blo _022285D0
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	mov r0, #0
	strb r0, [r4, #1]
	ldrb r0, [r4, #2]
	cmp r0, #3
	blo _022285D4
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _022285D4
_022285D0:
	mov r0, #0
	strb r0, [r4]
_022285D4:
	mov r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #0
	str r0, [sp]
	mov r1, #0x36
	mov r2, #6
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	bl ov07_022226C4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_02228604:
	ldr r0, [r4, #8]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	nop
_02228618: .word ov07_022366F6
_0222861C: .word ov07_022366F7
_02228620: .word ov07_022366F8
_02228624: .word ov07_022366F5
_02228628: .word ov07_022366F9
_0222862C: .word ov07_022366D8
_02228630: .word ov07_022366D9
_02228634: .word ov07_022366DA
	thumb_func_end ov07_02228510

	thumb_func_start ov07_02228638
ov07_02228638: ; 0x02228638
	push {r3, r4, r5, lr}
	mov r1, #0x58
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	str r5, [r4, #8]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #4]
	ldr r0, [r4, #8]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FAA0
	strh r0, [r4, #6]
	ldr r0, [r4, #8]
	ldr r1, _02228680 ; =ov07_02228510
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02228680: .word ov07_02228510
	thumb_func_end ov07_02228638

	thumb_func_start ov07_02228684
ov07_02228684: ; 0x02228684
	push {r4, lr}
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0222869A
	cmp r0, #1
	beq _022286B2
	cmp r0, #2
	beq _022286D2
	b _02228714
_0222869A:
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #0xa
	blo _02228730
	mov r0, #0
	strb r0, [r4, #1]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02228730
_022286B2:
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4, #0x10]
	mov r1, #2
	bl sub_0200E0FC
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02228730
_022286D2:
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #0xa
	blo _02228730
	ldr r0, _02228744 ; =0x0400004A
	mov r1, #0x3f
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #0x1f
	orr r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _02228748 ; =0xFFFFC0FF
	lsl r1, r1, #8
	and r2, r3
	orr r1, r2
	strh r1, [r0]
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0
	strb r0, [r4, #1]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02228730
_02228714:
	mov r3, #1
	lsl r3, r3, #0x1a
	ldr r1, [r3]
	ldr r0, _0222874C ; =0xFFFF1FFF
	and r0, r1
	str r0, [r3]
	ldr r0, [r4, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
_02228730:
	ldr r0, [r4, #0xc]
	bl sub_0200DC18
	ldr r0, [r4, #0x10]
	bl sub_0200DC18
	ldr r0, [r4, #8]
	bl sub_0200D020
	pop {r4, pc}
	.balign 4, 0
_02228744: .word 0x0400004A
_02228748: .word 0xFFFFC0FF
_0222874C: .word 0xFFFF1FFF
	thumb_func_end ov07_02228684

	thumb_func_start ov07_02228750
ov07_02228750: ; 0x02228750
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	mov r1, #0x14
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4, #4]
	add r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0xc]
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x10]
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _02228828 ; =0xFFFF1FFF
	and r2, r1
	lsr r1, r0, #0xb
	orr r1, r2
	str r1, [r0]
	add r0, #0x4a
	ldrh r2, [r0]
	mov r1, #0x3f
	bic r2, r1
	mov r1, #0x1f
	orr r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _0222882C ; =0xFFFFC0FF
	and r2, r1
	mov r1, #0x12
	lsl r1, r1, #8
	orr r1, r2
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA80
	add r7, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA90
	str r0, [sp, #0x18]
	ldr r0, [r4, #0xc]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA78
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl ov07_0221BFD0
	add r3, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r1, #0x20
	lsl r0, r6, #0x14
	str r1, [sp, #4]
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r1, #0xe0
	str r1, [sp, #0xc]
	str r1, [sp, #0x10]
	str r1, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	add r2, r7, #0
	bl sub_02003FC8
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #4]
	ldr r1, _02228830 ; =ov07_02228684
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228828: .word 0xFFFF1FFF
_0222882C: .word 0xFFFFC0FF
_02228830: .word ov07_02228684
	thumb_func_end ov07_02228750

	thumb_func_start ov07_02228834
ov07_02228834: ; 0x02228834
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bls _02228844
	b _02228A26
_02228844:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02228850: ; jump table
	.short _02228858 - _02228850 - 2 ; case 0
	.short _0222886A - _02228850 - 2 ; case 1
	.short _02228982 - _02228850 - 2 ; case 2
	.short _022289BA - _02228850 - 2 ; case 3
_02228858:
	ldr r0, [r4, #0xc]
	mov r1, #0xe
	mov r2, #1
	bl sub_020087A4
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02228A42
_0222886A:
	mov r0, #0
	add r6, r4, #0
	ldr r7, _02228A4C ; =ov07_022366C8
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	add r5, r4, #0
	add r6, #0x20
_02228878:
	ldrb r0, [r5, #0x18]
	cmp r0, #0
	beq _02228884
	cmp r0, #1
	beq _022288B2
	b _02228900
_02228884:
	ldrb r0, [r5, #0x19]
	add r0, r0, #1
	strb r0, [r5, #0x19]
	ldrb r1, [r5, #0x19]
	ldrb r0, [r7]
	cmp r1, r0
	blo _02228906
	mov r0, #5
	str r0, [sp]
	mov r0, #0x64
	str r0, [sp, #4]
	mov r0, #5
	mov r1, #0x64
	str r0, [sp, #8]
	add r0, r6, #0
	mov r2, #5
	add r3, r1, #0
	bl ov07_02222590
	ldrb r0, [r5, #0x18]
	add r0, r0, #1
	strb r0, [r5, #0x18]
	b _02228906
_022288B2:
	add r0, r6, #0
	bl ov07_0222260C
	cmp r0, #0
	bne _022288C4
	ldrb r0, [r5, #0x18]
	add r0, r0, #1
	strb r0, [r5, #0x18]
	b _02228906
_022288C4:
	add r0, r6, #0
	add r1, sp, #0x28
	add r2, sp, #0x24
	bl ov07_02222644
	mov r0, #8
	ldrsb r0, [r4, r0]
	bl _fflt
	add r1, r0, #0
	ldr r0, [sp, #0x28]
	bl _fmul
	add r1, r0, #0
	ldr r0, [r5, #0x1c]
	ldr r2, [sp, #0x24]
	bl sub_0200E024
	mov r0, #0
	str r0, [sp]
	mov r1, #2
	ldr r2, [r4, #4]
	ldrsh r1, [r4, r1]
	lsl r2, r2, #0x10
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x34]
	asr r2, r2, #0x10
	bl ov07_022226FC
	b _02228906
_02228900:
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
_02228906:
	ldr r0, [r5, #0x1c]
	bl sub_0200DC18
	ldr r0, [sp, #0x14]
	add r5, #0x2c
	add r0, r0, #1
	add r7, r7, #1
	add r6, #0x2c
	str r0, [sp, #0x14]
	cmp r0, #3
	blt _02228878
	ldr r0, [sp, #0x10]
	cmp r0, #3
	bge _02228924
	b _02228A42
_02228924:
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #3
	bhs _0222897A
	mov r6, #0
	add r5, r4, #0
	add r7, r6, #0
_02228936:
	add r1, sp, #0x18
	ldr r0, [r5, #0x1c]
	add r1, #2
	add r2, sp, #0x18
	bl sub_0200DE44
	add r2, sp, #0x18
	mov r1, #2
	ldrsh r1, [r2, r1]
	mov r2, #2
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x1c]
	bl sub_0200DDB8
	mov r0, #8
	ldrsb r0, [r4, r0]
	bl _fflt
	add r1, r0, #0
	mov r2, #0xfe
	ldr r0, [r5, #0x1c]
	lsl r2, r2, #0x16
	bl sub_0200E024
	strb r7, [r5, #0x18]
	strb r7, [r5, #0x19]
	add r6, r6, #1
	add r5, #0x2c
	cmp r6, #3
	blt _02228936
	ldrb r0, [r4]
	sub r0, r0, #1
	strb r0, [r4]
	b _02228A42
_0222897A:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02228A42
_02228982:
	add r5, r4, #0
	mov r7, #0
	add r6, r4, #0
	add r5, #0x20
_0222898A:
	ldr r0, [r6, #0x1c]
	mov r1, #0
	bl sub_0200E0FC
	mov r0, #0x64
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #5
	mov r1, #5
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #0x64
	add r3, r1, #0
	bl ov07_02222590
	add r7, r7, #1
	add r6, #0x2c
	add r5, #0x2c
	cmp r7, #3
	blt _0222898A
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02228A42
_022289BA:
	mov r7, #0
	add r6, r4, #0
	str r7, [sp, #0xc]
	add r6, #0x20
	add r5, r4, #0
_022289C4:
	add r0, r6, #0
	bl ov07_0222260C
	cmp r0, #0
	bne _022289D2
	add r7, r7, #1
	b _02228A0C
_022289D2:
	add r0, r6, #0
	add r1, sp, #0x20
	add r2, sp, #0x1c
	bl ov07_02222644
	mov r0, #8
	ldrsb r0, [r4, r0]
	bl _fflt
	add r1, r0, #0
	ldr r0, [sp, #0x20]
	bl _fmul
	add r1, r0, #0
	ldr r0, [r5, #0x1c]
	ldr r2, [sp, #0x1c]
	bl sub_0200E024
	mov r0, #0
	str r0, [sp]
	mov r1, #2
	ldr r2, [r4, #4]
	ldrsh r1, [r4, r1]
	lsl r2, r2, #0x10
	ldr r0, [r5, #0x1c]
	ldr r3, [r5, #0x34]
	asr r2, r2, #0x10
	bl ov07_022226FC
_02228A0C:
	ldr r0, [sp, #0xc]
	add r6, #0x2c
	add r0, r0, #1
	add r5, #0x2c
	str r0, [sp, #0xc]
	cmp r0, #3
	blt _022289C4
	cmp r7, #3
	blt _02228A42
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02228A42
_02228A26:
	ldr r0, [r4, #0xc]
	mov r1, #0xe
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
_02228A42:
	ldr r0, [r4, #0x14]
	bl sub_0200D020
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02228A4C: .word ov07_022366C8
	thumb_func_end ov07_02228834

	thumb_func_start ov07_02228A50
ov07_02228A50: ; 0x02228A50
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x9c
	str r0, [sp]
	bl ov07_022324D8
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	ldr r0, [sp]
	str r0, [r4, #0x10]
	bl ov07_0221C514
	str r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #2]
	ldr r0, [r4, #0xc]
	mov r1, #0x29
	bl sub_02008A78
	mov r1, #2
	ldrsh r1, [r4, r1]
	sub r0, r1, r0
	strh r0, [r4, #2]
	ldr r0, [r4, #0x10]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	bl ov07_0221FAA0
	mov r1, #0
	str r0, [r4, #4]
	mvn r1, r1
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	bl ov07_02231E08
	mov r6, #0
	ldr r1, _02228B2C ; =0x0000060C
	ldr r0, _02228B30 ; =0x04000052
	add r5, r4, #0
	strh r1, [r0]
	add r7, r6, #0
_02228ABC:
	strb r7, [r5, #0x18]
	strb r7, [r5, #0x19]
	ldr r0, [r4, #0x10]
	add r1, r6, #0
	bl ov07_0221C4E8
	str r0, [r5, #0x1c]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r5, #0x1c]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r5, #0x1c]
	add r1, r6, #1
	bl sub_0200DD68
	add r6, r6, #1
	add r5, #0x2c
	cmp r6, #3
	blt _02228ABC
	ldr r0, [sp]
	mov r1, #0
	bl ov07_0221FB78
	cmp r0, #1
	bne _02228AFA
	mov r0, #0
	mvn r0, r0
	b _02228AFC
_02228AFA:
	mov r0, #1
_02228AFC:
	strb r0, [r4, #8]
	mov r6, #0
	add r5, r4, #0
	mov r7, #8
_02228B04:
	ldrsb r0, [r4, r7]
	bl _fflt
	add r1, r0, #0
	mov r2, #0xfe
	ldr r0, [r5, #0x1c]
	lsl r2, r2, #0x16
	bl sub_0200E024
	add r6, r6, #1
	add r5, #0x2c
	cmp r6, #3
	blt _02228B04
	ldr r0, [r4, #0x10]
	ldr r1, _02228B34 ; =ov07_02228834
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228B2C: .word 0x0000060C
_02228B30: .word 0x04000052
_02228B34: .word ov07_02228834
	thumb_func_end ov07_02228A50

	thumb_func_start ov07_02228B38
ov07_02228B38: ; 0x02228B38
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bls _02228B48
	b _02228C72
_02228B48:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02228B54: ; jump table
	.short _02228B5C - _02228B54 - 2 ; case 0
	.short _02228B8E - _02228B54 - 2 ; case 1
	.short _02228BA2 - _02228B54 - 2 ; case 2
	.short _02228BFE - _02228B54 - 2 ; case 3
_02228B5C:
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl ov07_0221E6C8
	add r2, r0, #0
	mov r1, #0
	lsl r2, r2, #0x10
	str r1, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r1, #1
	add r0, r5, #0
	lsr r2, r2, #0x10
	add r3, r1, #0
	bl sub_02003370
	ldrb r0, [r4]
	add sp, #0xc
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, r5, r6, r7, pc}
_02228B8E:
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	bl sub_02003B44
	cmp r0, #0
	bne _02228C80
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02228BA2:
	mov r0, #5
	str r0, [sp]
	ldrb r1, [r4, #1]
	add r0, r4, #0
	add r0, #0xb4
	lsl r2, r1, #1
	ldr r1, _02228C84 ; =ov07_02236722
	ldrsh r1, [r1, r2]
	mov r2, #0
	add r3, r2, #0
	bl ov07_022227A8
	ldrb r0, [r4, #2]
	cmp r0, #0
	ldr r0, [r4, #0xc]
	bne _02228BD4
	bl ov07_0221FA78
	mov r1, #0
	mov r2, #0xff
	mov r3, #0xa
	str r1, [sp]
	bl sub_02003EA4
	b _02228BE6
_02228BD4:
	bl ov07_0221FA78
	ldr r1, _02228C88 ; =0x00007FFF
	mov r2, #0xff
	str r1, [sp]
	mov r1, #0
	mov r3, #0xa
	bl sub_02003EA4
_02228BE6:
	mov r0, #3
	strb r0, [r4, #3]
	ldrb r1, [r4, #2]
	mov r0, #1
	eor r0, r1
	strb r0, [r4, #2]
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02228BFE:
	add r0, r4, #0
	add r0, #0xb4
	bl ov07_022227D8
	cmp r0, #0
	bne _02228C1C
	ldrb r0, [r4, #1]
	cmp r0, #8
	ldrb r0, [r4]
	blo _02228C18
	add r0, r0, #1
	strb r0, [r4]
	b _02228C1C
_02228C18:
	sub r0, r0, #1
	strb r0, [r4]
_02228C1C:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _02228C3E
	sub r0, r0, #1
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	cmp r0, #0
	bne _02228C3E
	ldr r0, [r4, #0xc]
	bl ov07_0221FA78
	mov r1, #0
	mov r2, #0xff
	add r3, r1, #0
	str r1, [sp]
	bl sub_02003EA4
_02228C3E:
	mov r6, #0
	add r5, r4, #0
	mov r7, #0x14
_02228C44:
	ldr r0, [r5, #0x1c]
	cmp r0, #0
	beq _02228C58
	mov r2, #0xb4
	ldrsh r3, [r4, r2]
	ldrsh r2, [r5, r7]
	mov r1, #0
	add r2, r3, r2
	bl sub_020087A4
_02228C58:
	add r6, r6, #1
	add r5, #0x14
	cmp r6, #4
	blt _02228C44
	mov r3, #0xb4
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #8]
	mov r1, #3
	mov r2, #0
	bl BgSetPosTextAndCommit
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02228C72:
	ldr r0, [r4, #0xc]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_02228C80:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02228C84: .word ov07_02236722
_02228C88: .word 0x00007FFF
	thumb_func_end ov07_02228B38

	thumb_func_start ov07_02228C8C
ov07_02228C8C: ; 0x02228C8C
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0xd8
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	str r5, [r4, #0xc]
	add r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	bl ov07_0221C4A0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	bl ov07_0221FAB0
	cmp r0, #1
	bne _02228CBE
	mov r1, #0x40
	b _02228CC0
_02228CBE:
	mov r1, #0xa
_02228CC0:
	add r2, r4, #0
	add r0, r5, #0
	add r2, #0x14
	add r3, r4, #4
	bl ov07_02232020
	ldr r0, [r4, #4]
	mov r6, #0
	cmp r0, #0
	ble _02228CF6
	add r5, r4, #0
	add r7, r6, #0
_02228CD8:
	ldr r0, [r5, #0x1c]
	add r1, r7, #0
	bl sub_02008A78
	strh r0, [r5, #0x14]
	ldr r0, [r5, #0x1c]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r5, #0x16]
	ldr r0, [r4, #4]
	add r6, r6, #1
	add r5, #0x14
	cmp r6, r0
	blt _02228CD8
_02228CF6:
	ldr r0, [r4, #0xc]
	ldr r1, _02228D04 ; =ov07_02228B38
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228D04: .word ov07_02228B38
	thumb_func_end ov07_02228C8C

	thumb_func_start ov07_02228D08
ov07_02228D08: ; 0x02228D08
	push {r4, lr}
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _02228D52
	add r0, r4, #0
	add r0, #0x40
	bl ov07_022222B4
	cmp r0, #0
	bne _02228D26
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02228D26:
	add r0, r4, #0
	add r0, #0x1c
	bl ov07_022227D8
	add r0, r4, #0
	add r0, #0x64
	bl ov07_02222AF4
	mov r1, #0x40
	mov r2, #0x42
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	bl sub_0200DDB8
	ldr r0, [r4, #0x18]
	bl sub_0200DC18
	ldr r0, [r4, #0x10]
	bl sub_0200D020
	pop {r4, pc}
_02228D52:
	ldr r0, [r4, #0xc]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02228D08

	thumb_func_start ov07_02228D64
ov07_02228D64: ; 0x02228D64
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r1, #0x8c
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #1]
	str r5, [r4, #0xc]
	add r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	bl ov07_0221C4A0
	str r0, [r4, #8]
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x18]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ldr r0, [r4, #0xc]
	bne _02228DA8
	bl ov07_0221C470
	b _02228DAC
_02228DA8:
	bl ov07_0221C468
_02228DAC:
	add r6, r0, #0
	ldr r0, [r4, #0xc]
	add r1, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x14]
	add r1, r4, #4
	bl ov07_02231FA0
	ldr r0, [r4, #0x14]
	mov r1, #0x29
	bl sub_02008A78
	mov r1, #6
	ldrsh r1, [r4, r1]
	sub r0, r1, r0
	strh r0, [r4, #6]
	ldr r0, [r4, #0xc]
	add r1, r6, #0
	bl ov07_02222004
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	add r1, r6, #0
	bl ov07_0222202C
	add r6, r0, #0
	mov r0, #6
	ldrsh r3, [r4, r0]
	mov r0, #4
	ldrsh r1, [r4, r0]
	mov r2, #0x14
	add r0, r6, #0
	mul r0, r2
	add r0, r3, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	str r2, [sp, #4]
	sub r2, #0x28
	mul r2, r7
	add r2, r1, r2
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x40
	asr r2, r2, #0x10
	bl ov07_02222268
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221FAF8
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221FAF8
	mov r5, #1
	add r3, r5, #0
	lsl r3, r6
	add r1, r0, #0
	add r6, r3, #0
	mov r2, #0x20
	add r3, r5, #0
	orr r6, r2
	lsl r3, r1
	add r1, r6, #0
	orr r1, r3
	sub r2, #0x21
	ldr r0, [r4, #0xc]
	orr r1, r5
	add r3, r2, #0
	bl ov07_02231E44
	mov r1, #0x1f
	mov r2, #0
	str r1, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x64
	add r3, r2, #0
	bl ov07_02222AC4
	ldr r0, [r4, #0x18]
	add r1, r5, #0
	bl sub_0200E0FC
	ldr r0, [r4, #0xc]
	ldr r1, _02228E6C ; =ov07_02228D08
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02228E6C: .word ov07_02228D08
	thumb_func_end ov07_02228D64

	thumb_func_start ov07_02228E70
ov07_02228E70: ; 0x02228E70
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02228E82
	cmp r0, #1
	beq _02228EC2
	b _02228EF2
_02228E82:
	ldrb r0, [r4, #1]
	cmp r0, #0
	ldrb r0, [r4, #2]
	bne _02228E94
	lsl r3, r0, #3
	ldr r0, _02228F0C ; =ov07_0223674C
	ldr r2, [r0, r3]
	neg r1, r2
	b _02228E9C
_02228E94:
	lsl r3, r0, #3
	ldr r0, _02228F0C ; =ov07_0223674C
	ldr r1, [r0, r3]
	neg r2, r1
_02228E9C:
	ldr r5, _02228F10 ; =ov07_02236750
	add r0, r4, #0
	ldr r3, [r5, r3]
	add r0, #0x5c
	bl ov07_022223F0
	ldrb r0, [r4, #1]
	cmp r0, #1
	bne _02228EB4
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
_02228EB4:
	ldrb r1, [r4, #1]
	mov r0, #1
	eor r0, r1
	strb r0, [r4, #1]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_02228EC2:
	add r0, r4, #0
	add r0, #0x5c
	bl ov07_02222440
	cmp r0, #1
	bne _02228EDE
	ldr r2, [r4, #0x5c]
	ldr r0, [r4, #0x28]
	lsl r2, r2, #0x10
	mov r1, #9
	lsr r2, r2, #0x10
	bl sub_020087A4
	pop {r3, r4, r5, pc}
_02228EDE:
	ldrb r0, [r4, #2]
	cmp r0, #5
	ldrb r0, [r4]
	blo _02228EEC
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02228EEC:
	sub r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02228EF2:
	ldr r0, [r4, #0x28]
	mov r1, #9
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02228F0C: .word ov07_0223674C
_02228F10: .word ov07_02236750
	thumb_func_end ov07_02228E70

	thumb_func_start ov07_02228F14
ov07_02228F14: ; 0x02228F14
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02228F28
	cmp r0, #1
	beq _02228F4C
	b _02228F76
_02228F28:
	mov r0, #0x22
	ldrsh r0, [r4, r0]
	mov r1, #0x1c
	mov r2, #0x1e
	str r0, [sp]
	mov r3, #0x20
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, #0x38
	bl ov07_022227A8
	ldrb r0, [r4]
	add sp, #8
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02228F4C:
	ldr r0, [r4, #0x2c]
	add r1, sp, #4
	bl ov07_02231FA0
	add r0, r4, #0
	add r3, sp, #4
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldr r3, [r4, #0x2c]
	add r0, #0x38
	bl ov07_0222283C
	cmp r0, #0
	bne _02228F84
	ldrb r0, [r4]
	add sp, #8
	add r0, r0, #1
	strb r0, [r4]
	pop {r4, pc}
_02228F76:
	ldr r0, [r4, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_02228F84:
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_02228F14

	thumb_func_start ov07_02228F88
ov07_02228F88: ; 0x02228F88
	push {r4, r5, r6, lr}
	mov r1, #0x70
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	ldr r0, [r4, #4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0x28]
	ldr r0, [r4, #4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x28]
	mov r1, #0xb
	mov r2, #0x64
	bl sub_020087A4
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0x1c]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4A8
	strh r0, [r4, #0x1e]
	add r0, r5, #0
	mov r1, #3
	bl ov07_0221C4A8
	strh r0, [r4, #0x20]
	add r0, r5, #0
	mov r1, #4
	bl ov07_0221C4A8
	strh r0, [r4, #0x22]
	add r0, r5, #0
	mov r1, #5
	bl ov07_0221C4A8
	str r0, [r4, #0x24]
	cmp r6, #0
	ldr r0, [r4, #4]
	bne _02229012
	ldr r1, _0222901C ; =ov07_02228E70
	add r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
_02229012:
	ldr r1, _02229020 ; =ov07_02228F14
	add r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222901C: .word ov07_02228E70
_02229020: .word ov07_02228F14
	thumb_func_end ov07_02228F88

	thumb_func_start ov07_02229024
ov07_02229024: ; 0x02229024
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r2, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _02229036
	cmp r0, #1
	beq _02229058
	b _022290AC
_02229036:
	ldr r2, [r5, #0x48]
	mov r0, #0xa
	add r1, r2, #2
	str r0, [sp]
	add r0, r5, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	add r0, #0x4c
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	mov r3, #0
	bl ov07_022227A8
	ldrb r0, [r5]
	add r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_02229058:
	add r0, r5, #0
	add r0, #0x4c
	bl ov07_022227D8
	cmp r0, #0
	bne _0222906C
	ldrb r0, [r5]
	add r0, r0, #1
	strb r0, [r5]
	pop {r3, r4, r5, r6, r7, pc}
_0222906C:
	mov r6, #0
	add r4, r5, #0
	mov r7, #0x28
_02229072:
	ldr r0, [r4, #0x38]
	cmp r0, #0
	beq _02229086
	mov r2, #0x4c
	ldrsh r3, [r5, r2]
	ldrsh r2, [r4, r7]
	mov r1, #0
	add r2, r3, r2
	bl sub_020087A4
_02229086:
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _02229072
	mov r3, #0x4c
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x14]
	mov r1, #3
	mov r2, #0
	bl BgSetPosTextAndCommit
	mov r3, #0x4e
	mov r1, #3
	ldrsh r3, [r5, r3]
	ldr r0, [r5, #0x14]
	add r2, r1, #0
	bl BgSetPosTextAndCommit
	pop {r3, r4, r5, r6, r7, pc}
_022290AC:
	ldr r0, [r5, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02229024

	thumb_func_start ov07_022290BC
ov07_022290BC: ; 0x022290BC
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x70
	add r4, r0, #0
	bl ov07_022324D8
	add r7, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl ov07_02231FE4
	ldr r0, [r7, #4]
	mov r1, #1
	bl ov07_0221C768
	cmp r0, #0x46
	bgt _022290EC
	bge _0222910E
	cmp r0, #0x1e
	bgt _022290E6
	beq _0222911A
	b _02229120
_022290E6:
	cmp r0, #0x32
	beq _02229114
	b _02229120
_022290EC:
	cmp r0, #0x6e
	bgt _022290F8
	bge _02229102
	cmp r0, #0x5a
	beq _02229108
	b _02229120
_022290F8:
	cmp r0, #0x96
	bne _02229120
	mov r0, #6
	str r0, [r7, #0x48]
	b _02229124
_02229102:
	mov r0, #5
	str r0, [r7, #0x48]
	b _02229124
_02229108:
	mov r0, #4
	str r0, [r7, #0x48]
	b _02229124
_0222910E:
	mov r0, #3
	str r0, [r7, #0x48]
	b _02229124
_02229114:
	mov r0, #2
	str r0, [r7, #0x48]
	b _02229124
_0222911A:
	mov r0, #1
	str r0, [r7, #0x48]
	b _02229124
_02229120:
	mov r0, #0
	str r0, [r7, #0x48]
_02229124:
	add r5, r7, #0
	mov r6, #0
	add r4, r7, #0
	add r5, #0x28
_0222912C:
	ldr r0, [r7, #4]
	add r1, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x38]
	cmp r0, #0
	beq _02229140
	add r1, r5, #0
	bl ov07_02231FA0
_02229140:
	add r6, r6, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r6, #4
	blt _0222912C
	ldr r0, [r7, #4]
	ldr r1, _02229158 ; =ov07_02229024
	add r2, r7, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02229158: .word ov07_02229024
	thumb_func_end ov07_022290BC

	thumb_func_start ov07_0222915C
ov07_0222915C: ; 0x0222915C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _02229170
	cmp r0, #1
	beq _0222919E
	b _0222920C
_02229170:
	mov r0, #0xa
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0
	add r0, #0x40
	mov r1, #0x14
	add r3, r2, #0
	bl ov07_022227A8
	mov r0, #0xa
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0
	add r0, #0x64
	mov r1, #2
	add r3, r2, #0
	bl ov07_022227A8
	ldrb r0, [r4]
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, pc}
_0222919E:
	add r0, r4, #0
	add r0, #0x40
	bl ov07_022227D8
	cmp r0, #0
	bne _022291B2
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02229202
_022291B2:
	mov r1, #0x2c
	ldrsh r2, [r4, r1]
	mov r1, #0x40
	ldrsh r1, [r4, r1]
	ldr r0, [r4, #0x38]
	add r1, r2, r1
	mov r2, #0x2e
	ldrsh r3, [r4, r2]
	mov r2, #0x42
	ldrsh r2, [r4, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r1, #0x40
	ldrsh r2, [r4, r1]
	mov r1, #0x2c
	ldrsh r1, [r4, r1]
	ldr r0, [r4, #0x3c]
	sub r1, r2, r1
	mov r2, #0x2e
	ldrsh r3, [r4, r2]
	mov r2, #0x42
	ldrsh r2, [r4, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r0, [r4, #0x38]
	bl sub_0200DC18
	ldr r0, [r4, #0x3c]
	bl sub_0200DC18
_02229202:
	ldr r0, [r4, #0xc]
	bl sub_0200D020
	add sp, #4
	pop {r3, r4, pc}
_0222920C:
	ldr r0, [r4, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0222915C

	thumb_func_start ov07_02229220
ov07_02229220: ; 0x02229220
	push {r3, r4, r5, lr}
	mov r1, #0x88
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x38]
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0x30]
	ldr r0, [r4, #4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0x34]
	add r1, r4, #0
	ldr r0, [r4, #0x30]
	add r1, #0x28
	bl ov07_02231FA0
	add r1, r4, #0
	ldr r0, [r4, #0x34]
	add r1, #0x2c
	bl ov07_02231FA0
	ldr r0, [r4, #4]
	ldr r1, _02229288 ; =ov07_0222915C
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02229288: .word ov07_0222915C
	thumb_func_end ov07_02229220

	thumb_func_start ov07_0222928C
ov07_0222928C: ; 0x0222928C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	ldr r2, [r4, #0x38]
	add r0, #0x8c
	add r1, #0xb0
	bl ov07_022223CC
	cmp r0, #0
	bne _022292B8
	ldr r0, [r4, #0x38]
	bl sub_0200D9DC
	ldr r0, [r4, #0x14]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl ov07_02232508
	pop {r3, r4, r5, pc}
_022292B8:
	add r0, r4, #0
	add r0, #0xd4
	bl ov07_02222440
	cmp r0, #1
	bne _022292D4
	add r1, r4, #0
	add r1, #0xd4
	ldr r1, [r1]
	ldr r0, [r4, #0x38]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_0200E074
_022292D4:
	ldr r0, [r4, #0x38]
	bl sub_0200DC18
	ldr r0, [r4, #0x20]
	bl sub_0200D020
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0222928C

	thumb_func_start ov07_022292E4
ov07_022292E4: ; 0x022292E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	mov r1, #0xe8
	add r6, r0, #0
	add r7, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x10
	bl ov07_02231FE4
	add r0, r6, #0
	mov r1, #0
	bl ov07_0221C4A8
	strh r0, [r4, #0xc]
	add r0, r6, #0
	mov r1, #1
	bl ov07_0221C4A8
	strh r0, [r4, #0xe]
	add r0, r6, #0
	mov r1, #2
	bl ov07_0221C4A8
	str r0, [r4, #4]
	add r0, r6, #0
	mov r1, #3
	bl ov07_0221C4A8
	str r0, [r4, #8]
	add r0, r6, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_02222004
	add r5, r0, #0
	add r0, r7, #0
	mov r1, #2
	str r7, [r4, #0x38]
	bl sub_0200DF98
	add r0, r6, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x44]
	add r0, r6, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x58]
	add r1, r4, #0
	ldr r0, [r4, #0x44]
	add r1, #0x40
	bl ov07_02231FA0
	add r1, r4, #0
	ldr r0, [r4, #0x58]
	add r1, #0x54
	bl ov07_02231FA0
	mov r0, #0x42
	ldrsh r0, [r4, r0]
	mov r3, #0x54
	str r0, [sp]
	mov r0, #0x56
	ldrsh r2, [r4, r0]
	mov r0, #0xe
	ldrsh r0, [r4, r0]
	add r1, r0, #0
	mul r1, r5
	add r0, r2, r1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #4]
	add r1, r4, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r4, #8]
	mov r2, #0x40
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	ldrsh r3, [r4, r3]
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	mov ip, r3
	mov r3, #0xc
	ldrsh r3, [r4, r3]
	add r0, #0x8c
	add r1, #0xb0
	add r7, r3, #0
	mul r7, r5
	mov r3, ip
	add r3, r3, r7
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	bl ov07_02222338
	add r0, r6, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0221FA04
	cmp r0, #4
	bne _022293EC
	add r0, r6, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0221FA04
	cmp r0, #2
	bne _022293EC
	mov r0, #0
	mvn r0, r0
	mul r5, r0
_022293EC:
	add r0, r6, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0221FA04
	cmp r0, #5
	bne _02229416
	add r0, r6, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0221FA04
	cmp r0, #3
	bne _02229416
	mov r0, #0
	mvn r0, r0
	mul r5, r0
_02229416:
	cmp r5, #0
	ldr r2, _02229470 ; =0x00005C71
	ble _0222942E
	ldr r1, _02229474 ; =0x00000E38
	add r0, r4, #0
	add r0, #0xd4
	mul r1, r5
	mul r2, r5
	mov r3, #0xa
	bl ov07_022223F0
	b _0222943E
_0222942E:
	ldr r1, _02229478 ; =0x00003FFF
	add r0, r4, #0
	add r0, #0xd4
	mul r1, r5
	mul r2, r5
	mov r3, #0xa
	bl ov07_022223F0
_0222943E:
	add r1, r4, #0
	add r1, #0xd4
	ldr r1, [r1]
	ldr r0, [r4, #0x38]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_0200E074
	add r0, r4, #0
	add r1, r4, #0
	ldr r2, [r4, #0x38]
	add r0, #0x8c
	add r1, #0xb0
	bl ov07_022223CC
	ldr r0, [r4, #0x38]
	bl sub_0200DC18
	ldr r0, [r4, #0x14]
	ldr r1, _0222947C ; =ov07_0222928C
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02229470: .word 0x00005C71
_02229474: .word 0x00000E38
_02229478: .word 0x00003FFF
_0222947C: .word ov07_0222928C
	thumb_func_end ov07_022292E4

	thumb_func_start ov07_02229480
ov07_02229480: ; 0x02229480
	push {r4, r5, lr}
	sub sp, #0x1c
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0x18]
	cmp r0, #3
	bls _02229490
	b _022295FC
_02229490:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222949C: ; jump table
	.short _022294A4 - _0222949C - 2 ; case 0
	.short _022294D4 - _0222949C - 2 ; case 1
	.short _02229574 - _0222949C - 2 ; case 2
	.short _02229586 - _0222949C - 2 ; case 3
_022294A4:
	mov r0, #0x12
	ldrsh r2, [r4, r0]
	mov r0, #0x96
	mov r3, #0x3c
	str r0, [sp]
	mov r1, #0x64
	str r1, [sp, #4]
	mov r0, #0xc
	mul r1, r2
	mul r3, r2
	lsl r2, r3, #0x10
	str r0, [sp, #8]
	add r0, r4, #0
	lsl r1, r1, #0x10
	add r0, #0x9c
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	mov r3, #5
	bl ov07_02222590
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	b _0222961A
_022294D4:
	add r0, r4, #0
	add r0, #0x9c
	bl ov07_0222260C
	cmp r0, #0
	bne _02229512
	mov r0, #0x12
	ldrsh r2, [r4, r0]
	mov r0, #0xa
	mov r1, #0x3c
	str r0, [sp]
	mov r0, #0x64
	str r0, [sp, #4]
	mov r0, #0xc
	mul r1, r2
	str r0, [sp, #8]
	add r0, r4, #0
	lsl r1, r1, #0x10
	mov r3, #0x96
	add r5, r2, #0
	mul r5, r3
	lsl r2, r5, #0x10
	add r0, #0x9c
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_02222590
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	b _0222961A
_02229512:
	add r0, r4, #0
	add r0, #0x9c
	add r1, sp, #0x18
	add r2, sp, #0x14
	bl ov07_02222644
	ldr r0, [r4, #0x40]
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x14]
	bl sub_0200E024
	mov r0, #0x16
	add r2, r4, #0
	add r2, #0xb0
	ldrsh r0, [r4, r0]
	ldr r2, [r2]
	mov r1, #0x10
	bl ov07_02222674
	mov r2, #0x16
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	mov r1, #0x14
	ldrsh r1, [r4, r1]
	add r2, r2, r3
	lsl r2, r2, #0x10
	ldr r0, [r4, #0x40]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldrb r1, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	cmp r1, r0
	bhs _0222955A
	add r0, r1, #1
	strb r0, [r4, #0xc]
_0222955A:
	ldrb r1, [r4, #0xd]
	ldrb r0, [r4, #0x11]
	cmp r1, r0
	bls _02229566
	sub r0, r1, #1
	strb r0, [r4, #0xd]
_02229566:
	ldrb r0, [r4, #0xd]
	ldrb r1, [r4, #0xc]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0222962C ; =0x04000052
	strh r1, [r0]
	b _0222961A
_02229574:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	cmp r0, #4
	blt _0222961A
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	b _0222961A
_02229586:
	add r0, r4, #0
	add r0, #0x9c
	bl ov07_0222260C
	cmp r0, #0
	bne _0222959A
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	b _0222961A
_0222959A:
	add r0, r4, #0
	add r0, #0x9c
	add r1, sp, #0x10
	add r2, sp, #0xc
	bl ov07_02222644
	ldr r0, [r4, #0x40]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl sub_0200E024
	mov r0, #0x16
	add r2, r4, #0
	add r2, #0xb0
	ldrsh r0, [r4, r0]
	ldr r2, [r2]
	mov r1, #0x10
	bl ov07_02222674
	mov r2, #0x16
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	mov r1, #0x14
	ldrsh r1, [r4, r1]
	add r2, r2, r3
	lsl r2, r2, #0x10
	ldr r0, [r4, #0x40]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldrb r1, [r4, #0xc]
	ldrb r0, [r4, #0xe]
	cmp r1, r0
	bls _022295E2
	sub r0, r1, #1
	strb r0, [r4, #0xc]
_022295E2:
	ldrb r1, [r4, #0xd]
	ldrb r0, [r4, #0xf]
	cmp r1, r0
	bhs _022295EE
	add r0, r1, #1
	strb r0, [r4, #0xd]
_022295EE:
	ldrb r0, [r4, #0xd]
	ldrb r1, [r4, #0xc]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0222962C ; =0x04000052
	strh r1, [r0]
	b _0222961A
_022295FC:
	ldr r0, [r4, #0x44]
	bl sub_0200D9DC
	ldr r0, [r4, #0x48]
	bl sub_0200D9DC
	ldr r0, [r4, #0x1c]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl ov07_02232508
	add sp, #0x1c
	pop {r4, r5, pc}
_0222961A:
	ldr r0, [r4, #0x40]
	bl sub_0200DC18
	ldr r0, [r4, #0x28]
	bl sub_0200D020
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_0222962C: .word 0x04000052
	thumb_func_end ov07_02229480

	thumb_func_start ov07_02229630
ov07_02229630: ; 0x02229630
	push {r4, r5, lr}
	sub sp, #0x14
	mov r1, #0xd4
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x18
	bl ov07_02231FE4
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4C0
	str r0, [r4, #0x44]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4C0
	mov r1, #0
	str r0, [r4, #0x48]
	mvn r1, r1
	ldr r0, [r4, #0x1c]
	add r2, r1, #0
	bl ov07_02231E08
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	mov r1, #0
	strb r1, [r4, #0xc]
	mov r0, #0x1f
	strb r0, [r4, #0xd]
	strb r1, [r4, #0xe]
	strb r0, [r4, #0xf]
	strb r0, [r4, #0x10]
	mov r0, #4
	strb r0, [r4, #0x11]
	add r0, r5, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _022296C0
	ldr r0, [r4, #0x44]
	mov r1, #0
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x48]
	bl sub_0200DCE8
	ldr r0, [r4, #0x40]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0xb3
	strh r0, [r4, #0x14]
	mov r0, #0x78
	strh r0, [r4, #0x16]
	add r0, r5, #0
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r4, #0x40]
	add r1, r1, #1
	bl sub_0200DD54
	mov r0, #0
	mvn r0, r0
	strh r0, [r4, #0x12]
	b _02229720
_022296C0:
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _022296F0
	ldr r0, [r4, #0x48]
	mov r1, #0
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x44]
	bl sub_0200DCE8
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl sub_0200DC4C
	mov r0, #0x90
	strh r0, [r4, #0x14]
	mov r0, #0x40
	strh r0, [r4, #0x16]
	b _0222971C
_022296F0:
	ldr r0, [r4, #0x44]
	mov r1, #0
	str r0, [r4, #0x40]
	ldr r0, [r4, #0x48]
	bl sub_0200DCE8
	ldr r0, [r4, #0x40]
	mov r1, #0
	bl sub_0200DC4C
	mov r0, #0x4c
	strh r0, [r4, #0x14]
	mov r0, #0x78
	strh r0, [r4, #0x16]
	add r0, r5, #0
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r4, #0x40]
	add r1, r1, #1
	bl sub_0200DD54
_0222971C:
	mov r0, #1
	strh r0, [r4, #0x12]
_02229720:
	mov r1, #0x14
	mov r2, #0x16
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x40]
	bl sub_0200DDB8
	ldr r0, [r4, #0x40]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl sub_0200E0FC
	mov r0, #0x12
	ldrsh r0, [r4, r0]
	mov r3, #0x64
	add r1, r0, #0
	mov r0, #5
	str r0, [sp]
	mul r1, r3
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x9c
	add r2, r1, #0
	bl ov07_02222590
	add r0, r4, #0
	add r0, #0x9c
	bl ov07_0222260C
	add r0, r4, #0
	add r0, #0x9c
	add r1, sp, #0x10
	add r2, sp, #0xc
	bl ov07_02222644
	ldr r0, [r4, #0x40]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl sub_0200E024
	mov r0, #0x16
	add r2, r4, #0
	add r2, #0xb0
	ldrsh r0, [r4, r0]
	ldr r2, [r2]
	mov r1, #0x10
	bl ov07_02222674
	mov r2, #0x16
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	mov r1, #0x14
	ldrsh r1, [r4, r1]
	add r2, r2, r3
	lsl r2, r2, #0x10
	ldr r0, [r4, #0x40]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r0, [r4, #0x1c]
	ldr r1, _022297B4 ; =ov07_02229480
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x14
	pop {r4, r5, pc}
	nop
_022297B4: .word ov07_02229480
	thumb_func_end ov07_02229630

	thumb_func_start ov07_022297B8
ov07_022297B8: ; 0x022297B8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r4, r1, #0
	str r0, [sp, #0x10]
	ldrb r0, [r4]
	cmp r0, #8
	bls _022297C8
	b _02229B1C
_022297C8:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022297D4: ; jump table
	.short _022297E6 - _022297D4 - 2 ; case 0
	.short _0222981E - _022297D4 - 2 ; case 1
	.short _02229878 - _022297D4 - 2 ; case 2
	.short _02229892 - _022297D4 - 2 ; case 3
	.short _022298C6 - _022297D4 - 2 ; case 4
	.short _0222994A - _022297D4 - 2 ; case 5
	.short _022299DC - _022297D4 - 2 ; case 6
	.short _02229A7A - _022297D4 - 2 ; case 7
	.short _02229AC2 - _022297D4 - 2 ; case 8
_022297E6:
	ldrb r1, [r4, #0xc]
	ldr r2, _02229B00 ; =ov07_02236705
	ldr r5, _02229B04 ; =ov07_02236706
	lsl r0, r1, #2
	add r3, r1, r0
	ldr r0, _02229B08 ; =ov07_02236707
	ldr r1, _02229B0C ; =ov07_02236704
	ldrb r0, [r0, r3]
	ldrb r1, [r1, r3]
	ldrb r2, [r2, r3]
	str r0, [sp]
	mov r0, #0x64
	str r0, [sp, #4]
	ldr r0, _02229B10 ; =ov07_02236708
	ldrb r0, [r0, r3]
	ldrb r3, [r5, r3]
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0xcc
	bl ov07_02222590
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02229B56
_0222981E:
	add r0, r4, #0
	add r0, #0xcc
	bl ov07_0222260C
	cmp r0, #1
	bne _02229864
	mov r2, #0xcc
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #0xc
	bl sub_020087A4
	mov r2, #0xce
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #0xd
	bl sub_020087A4
	mov r0, #0x20
	add r2, r4, #0
	add r2, #0xe0
	ldrsh r0, [r4, r0]
	ldr r1, [r4, #0x24]
	ldr r2, [r2]
	bl ov07_02222674
	mov r2, #0x20
	add r3, r0, #0
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x1c]
	mov r1, #1
	add r2, r2, r3
	bl sub_020087A4
	b _02229B56
_02229864:
	ldrb r0, [r4, #0xc]
	cmp r0, #3
	ldrb r0, [r4]
	blo _02229872
	add r0, r0, #1
	strb r0, [r4]
	b _02229B56
_02229872:
	sub r0, r0, #1
	strb r0, [r4]
	b _02229B56
_02229878:
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #1
	blo _02229956
	mov r0, #0
	strb r0, [r4, #1]
	strb r0, [r4, #0xc]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02229B56
_02229892:
	add r1, sp, #0x2c
	ldr r0, [r4, #0x30]
	add r1, #2
	add r2, sp, #0x2c
	bl sub_0200DE44
	add r1, sp, #0x14
	mov r0, #0x18
	ldrsh r0, [r1, r0]
	cmp r0, #0x68
	bgt _022298BE
	ldr r0, [r4, #0x30]
	mov r1, #0
	mov r2, #2
	bl sub_0200DED0
	ldr r0, [r4, #0x7c]
	mov r1, #0
	mov r2, #2
	bl sub_0200DED0
	b _02229B56
_022298BE:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02229B56
_022298C6:
	add r1, sp, #0x28
	ldr r0, [r4, #0x30]
	add r1, #2
	add r2, sp, #0x28
	bl sub_0200DE44
	add r1, sp, #0x14
	mov r0, #0x14
	ldrsh r0, [r1, r0]
	cmp r0, #0x68
	bgt _022298F2
	ldr r0, [r4, #0x30]
	mov r1, #0
	mov r2, #2
	bl sub_0200DED0
	ldr r0, [r4, #0x7c]
	mov r1, #0
	mov r2, #2
	bl sub_0200DED0
	b _022298FE
_022298F2:
	ldr r0, _02229B14 ; =0x04000052
	mov r1, #0x10
	strh r1, [r0]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_022298FE:
	ldrb r0, [r4, #1]
	mov r1, #0x10
	add r2, r1, #0
	add r0, r0, #1
	strb r0, [r4, #1]
	add r0, r4, #4
	bl ov07_02222E48
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	add r0, #8
	sub r2, #0x10
	bl ov07_02222E48
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02229B14 ; =0x04000052
	strh r1, [r0]
	ldrb r0, [r4, #1]
	cmp r0, #0xa
	bne _02229938
	ldr r0, [r4, #0x30]
	mov r1, #0
	mov r2, #0x10
	bl sub_0200DED0
_02229938:
	ldrb r0, [r4, #1]
	cmp r0, #0xc
	bne _02229956
	ldr r0, [r4, #0x7c]
	mov r1, #0
	mov r2, #0x10
	bl sub_0200DED0
	b _02229B56
_0222994A:
	ldrb r0, [r4, #1]
	add r0, r0, #1
	strb r0, [r4, #1]
	ldrb r0, [r4, #1]
	cmp r0, #1
	bhs _02229958
_02229956:
	b _02229B56
_02229958:
	mov r0, #0
	strb r0, [r4, #1]
	add r1, sp, #0x24
	ldr r0, [r4, #0x30]
	add r1, #2
	add r2, sp, #0x24
	bl sub_0200DE44
	add r1, sp, #0x20
	ldr r0, [r4, #0x7c]
	add r1, #2
	add r2, sp, #0x20
	bl sub_0200DE44
	add r0, r4, #0
	add r0, #0xc8
	str r0, [sp]
	add r0, r4, #0
	add r0, #0xca
	str r0, [sp, #4]
	add r3, sp, #0x14
	mov r0, #0x12
	mov r1, #0x10
	mov r2, #0xe
	mov r5, #0xc
	ldrsh r0, [r3, r0]
	ldrsh r1, [r3, r1]
	ldrsh r2, [r3, r2]
	ldrsh r3, [r3, r5]
	bl ov07_02222DC8
	add r0, r4, #0
	add r0, #0x2c
	str r0, [sp]
	mov r3, #0xca
	add r2, sp, #0x14
	mov r0, #0x12
	mov r1, #0x10
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	mov r2, #0xc8
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	bl ov07_02222DE4
	add r0, r4, #0
	add r0, #0x28
	str r0, [sp]
	mov r3, #0xca
	add r2, sp, #0x14
	mov r0, #0x12
	mov r1, #0x10
	ldrsh r0, [r2, r0]
	ldrsh r1, [r2, r1]
	mov r2, #0xc8
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	bl ov07_02222E0C
	mov r0, #0xa
	lsl r0, r0, #0xe
	str r0, [r4, #0x2c]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02229B56
_022299DC:
	ldr r3, _02229B18 ; =ov07_022366E1
	add r2, sp, #0x30
	mov r1, #0xa
_022299E2:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _022299E2
	add r1, sp, #0x1c
	ldr r0, [r4, #0x30]
	add r1, #2
	add r2, sp, #0x1c
	bl sub_0200DE44
	add r1, sp, #0x18
	ldr r0, [r4, #0x7c]
	add r1, #2
	add r2, sp, #0x18
	bl sub_0200DE44
	add r3, sp, #0x14
	mov r0, #8
	ldrsh r0, [r3, r0]
	mov r2, #0xa
	str r0, [sp]
	mov r0, #4
	ldrsh r0, [r3, r0]
	str r0, [sp, #4]
	str r2, [sp, #8]
	ldrb r1, [r4, #0xc]
	ldr r0, [r4, #0x2c]
	lsl r5, r1, #1
	add r1, sp, #0x30
	ldrsb r1, [r1, r5]
	mov r5, #6
	mul r1, r0
	str r1, [sp, #0xc]
	ldrsh r2, [r3, r2]
	add r0, r4, #0
	add r1, r4, #0
	ldrsh r3, [r3, r5]
	add r0, #0x34
	add r1, #0x58
	bl ov07_02222338
	add r3, sp, #0x14
	mov r0, #4
	ldrsh r0, [r3, r0]
	mov r5, #0xa
	str r0, [sp]
	mov r0, #8
	ldrsh r0, [r3, r0]
	str r0, [sp, #4]
	str r5, [sp, #8]
	ldrb r1, [r4, #0xc]
	ldr r0, [r4, #0x2c]
	lsl r2, r1, #1
	add r1, sp, #0x30
	add r1, #1
	ldrsb r1, [r1, r2]
	mov r2, #6
	mul r1, r0
	str r1, [sp, #0xc]
	ldrsh r2, [r3, r2]
	add r0, r4, #0
	add r1, r4, #0
	ldrsh r3, [r3, r5]
	add r0, #0x80
	add r1, #0xa4
	bl ov07_02222338
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02229B56
_02229A7A:
	add r0, r4, #0
	ldr r2, [r4, #0x30]
	add r0, #0x34
	add r1, #0x58
	mov r5, #0
	bl ov07_022223CC
	cmp r0, #0
	bne _02229A92
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_02229A92:
	add r0, r4, #0
	add r1, r4, #0
	ldr r2, [r4, #0x7c]
	add r0, #0x80
	add r1, #0xa4
	bl ov07_022223CC
	cmp r0, #0
	bne _02229AAA
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
_02229AAA:
	cmp r5, #2
	bne _02229B56
	ldrb r0, [r4, #0xc]
	cmp r0, #5
	ldrb r0, [r4]
	bne _02229ABC
	add r0, r0, #1
	strb r0, [r4]
	b _02229B56
_02229ABC:
	sub r0, r0, #1
	strb r0, [r4]
	b _02229B56
_02229AC2:
	mov r5, #0
	add r0, r4, #4
	add r1, r5, #0
	sub r2, r5, #2
	bl ov07_02222E48
	cmp r0, #1
	bne _02229AD4
	add r5, r5, #1
_02229AD4:
	add r0, r4, #0
	add r0, #8
	mov r1, #0x10
	mov r2, #2
	bl ov07_02222E48
	cmp r0, #1
	bne _02229AE6
	add r5, r5, #1
_02229AE6:
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02229B14 ; =0x04000052
	cmp r5, #2
	strh r1, [r0]
	bne _02229B56
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _02229B56
	nop
_02229B00: .word ov07_02236705
_02229B04: .word ov07_02236706
_02229B08: .word ov07_02236707
_02229B0C: .word ov07_02236704
_02229B10: .word ov07_02236708
_02229B14: .word 0x04000052
_02229B18: .word ov07_022366E1
_02229B1C:
	mov r6, #0
	ldr r0, [r4, #0x10]
	add r1, r6, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _02229B44
	add r5, r4, #0
	add r7, r6, #0
_02229B2E:
	ldr r0, [r5, #0x30]
	bl sub_0200D9DC
	ldr r0, [r4, #0x10]
	add r1, r7, #0
	add r5, #0x4c
	add r6, r6, #1
	bl ov07_0221C4A8
	cmp r6, r0
	blt _02229B2E
_02229B44:
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #0x10]
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
_02229B56:
	mov r6, #0
	ldr r0, [r4, #0x10]
	add r1, r6, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _02229BC2
	add r5, r4, #0
	add r7, sp, #0x14
_02229B68:
	add r1, sp, #0x14
	ldr r0, [r5, #0x30]
	add r1, #2
	add r2, sp, #0x14
	bl sub_0200DE44
	mov r0, #0
	ldrsh r0, [r7, r0]
	cmp r0, #0x50
	bge _02229B8C
	ldr r0, [r4, #0x10]
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r5, #0x30]
	bl sub_0200DD54
	b _02229BB2
_02229B8C:
	mov r0, #2
	ldrsh r0, [r7, r0]
	cmp r0, #0x80
	ldr r0, [r4, #0x10]
	ble _02229BA4
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r5, #0x30]
	bl sub_0200DD54
	b _02229BB2
_02229BA4:
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r5, #0x30]
	add r1, r1, #1
	bl sub_0200DD54
_02229BB2:
	ldr r0, [r4, #0x10]
	mov r1, #0
	add r5, #0x4c
	add r6, r6, #1
	bl ov07_0221C4A8
	cmp r6, r0
	blt _02229B68
_02229BC2:
	ldrb r0, [r4]
	cmp r0, #4
	blo _02229BF6
	mov r5, #0
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _02229BF0
	add r6, r4, #0
	add r7, r5, #0
_02229BDA:
	ldr r0, [r6, #0x30]
	bl sub_0200DC18
	ldr r0, [r4, #0x10]
	add r1, r7, #0
	add r6, #0x4c
	add r5, r5, #1
	bl ov07_0221C4A8
	cmp r5, r0
	blt _02229BDA
_02229BF0:
	ldr r0, [r4, #0x18]
	bl sub_0200D020
_02229BF6:
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_022297B8

	thumb_func_start ov07_02229BFC
ov07_02229BFC: ; 0x02229BFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r1, #0
	mov r1, #0xf0
	str r0, [sp]
	add r6, r2, #0
	add r7, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	mov r1, #0
	strb r1, [r4]
	ldr r0, [sp]
	strb r1, [r4, #1]
	str r0, [r4, #0x10]
	str r6, [r4, #0x18]
	str r5, [r4, #0x14]
	str r1, [r4, #4]
	mov r0, #0x10
	str r0, [r4, #8]
	ldr r0, [r4, #0x10]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	bl ov07_0221FA48
	str r0, [r4, #0x1c]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	bl ov07_0221FAA0
	str r0, [r4, #0x24]
	ldr r0, [sp]
	mov r1, #2
	bl ov07_0221FAF8
	add r5, r0, #0
	ldr r0, [sp]
	mov r1, #1
	bl ov07_0221FAF8
	mov r2, #1
	add r1, r2, #0
	add r3, r0, #0
	lsl r1, r5
	add r5, r2, #0
	lsl r5, r3
	orr r1, r5
	orr r1, r2
	sub r2, r2, #2
	ldr r0, [r4, #0x10]
	add r3, r2, #0
	bl ov07_02231E44
	ldr r0, [r4, #8]
	ldr r1, [r4, #4]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02229D38 ; =0x04000052
	strh r1, [r0]
	ldr r1, [sp]
	add r0, sp, #4
	bl ov07_0221F9E8
	str r7, [r4, #0x30]
	ldr r0, [r4, #0x10]
	mov r1, #0
	mov r6, #1
	bl ov07_0221C4A8
	cmp r0, #1
	ble _02229CBE
	add r5, r4, #0
	add r5, #0x4c
	add r7, sp, #4
_02229CA2:
	ldr r0, [r4, #0x14]
	ldr r1, [r4, #0x18]
	add r2, r7, #0
	bl sub_0200D734
	str r0, [r5, #0x30]
	ldr r0, [r4, #0x10]
	mov r1, #0
	add r5, #0x4c
	add r6, r6, #1
	bl ov07_0221C4A8
	cmp r6, r0
	blt _02229CA2
_02229CBE:
	mov r6, #0
	ldr r0, [r4, #0x10]
	add r1, r6, #0
	bl ov07_0221C4A8
	cmp r0, #0
	ble _02229CF8
	add r5, r4, #0
	mov r7, #1
_02229CD0:
	ldr r0, [r5, #0x30]
	add r1, r7, #0
	bl sub_0200E0FC
	ldr r0, [r4, #0x10]
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r5, #0x30]
	add r1, r1, #1
	bl sub_0200DD54
	ldr r0, [r4, #0x10]
	mov r1, #0
	add r5, #0x4c
	add r6, r6, #1
	bl ov07_0221C4A8
	cmp r6, r0
	blt _02229CD0
_02229CF8:
	ldr r0, [sp]
	bl ov07_0221BFC0
	cmp r0, #1
	ldr r0, [r4, #0x30]
	bne _02229D18
	mov r1, #0xa0
	mov r2, #0x36
	bl sub_0200DDB8
	ldr r0, [r4, #0x7c]
	mov r1, #0x50
	mov r2, #0x27
	bl sub_0200DDB8
	b _02229D2A
_02229D18:
	mov r1, #0x64
	mov r2, #0x36
	bl sub_0200DDB8
	ldr r0, [r4, #0x7c]
	mov r1, #0xb4
	mov r2, #0x27
	bl sub_0200DDB8
_02229D2A:
	ldr r0, [r4, #0x10]
	ldr r1, _02229D3C ; =ov07_022297B8
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02229D38: .word 0x04000052
_02229D3C: .word ov07_022297B8
	thumb_func_end ov07_02229BFC

	thumb_func_start ov07_02229D40
ov07_02229D40: ; 0x02229D40
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r7, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _02229D52
	cmp r0, #1
	beq _02229DC6
	b _02229DFA
_02229D52:
	ldrb r0, [r5, #6]
	cmp r0, #0xf
	bhs _02229D5C
	add r0, r0, #1
	strb r0, [r5, #6]
_02229D5C:
	ldrb r0, [r5, #7]
	cmp r0, #0
	beq _02229D66
	sub r0, r0, #1
	strb r0, [r5, #7]
_02229D66:
	ldrb r0, [r5, #7]
	ldrb r1, [r5, #6]
	mov r6, #0
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02229E48 ; =0x04000052
	strh r1, [r0]
	ldrb r0, [r5, #4]
	add r0, r0, #1
	strb r0, [r5, #4]
	ldrb r0, [r5, #5]
	cmp r0, #0
	ble _02229DB8
	ldr r4, _02229E4C ; =ov07_02236778
	add r7, r5, #0
_02229D84:
	add r1, sp, #0
	ldr r0, [r7, #0x14]
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	ldrb r1, [r5, #4]
	ldrb r0, [r4]
	cmp r1, r0
	blo _02229DAC
	add r0, r5, r6
	ldrb r1, [r0, #1]
	add r1, r1, #1
	strb r1, [r0, #1]
	ldrb r2, [r0, #1]
	ldrb r1, [r4, #1]
	cmp r2, r1
	blo _02229DAC
	mov r1, #0
	strb r1, [r0, #1]
_02229DAC:
	ldrb r0, [r5, #5]
	add r6, r6, #1
	add r7, r7, #4
	add r4, r4, #2
	cmp r6, r0
	blt _02229D84
_02229DB8:
	ldrb r0, [r5, #4]
	cmp r0, #0x2d
	blo _02229E24
	ldrb r0, [r5]
	add r0, r0, #1
	strb r0, [r5]
	b _02229E24
_02229DC6:
	ldrb r0, [r5, #6]
	cmp r0, #0
	beq _02229DD0
	sub r0, r0, #1
	strb r0, [r5, #6]
_02229DD0:
	ldrb r0, [r5, #7]
	cmp r0, #0xf
	bhs _02229DDA
	add r0, r0, #1
	strb r0, [r5, #7]
_02229DDA:
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _02229DEC
	ldrb r0, [r5, #7]
	cmp r0, #0xf
	bne _02229DEC
	ldrb r0, [r5]
	add r0, r0, #1
	strb r0, [r5]
_02229DEC:
	ldrb r0, [r5, #7]
	ldrb r1, [r5, #6]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02229E48 ; =0x04000052
	strh r1, [r0]
	b _02229E24
_02229DFA:
	ldrb r0, [r5, #5]
	mov r6, #0
	cmp r0, #0
	ble _02229E14
	add r4, r5, #0
_02229E04:
	ldr r0, [r4, #0x14]
	bl sub_0200D9DC
	ldrb r0, [r5, #5]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _02229E04
_02229E14:
	ldr r0, [r5, #8]
	add r1, r7, #0
	bl ov07_0221C448
	add r0, r5, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_02229E24:
	ldrb r0, [r5, #5]
	mov r6, #0
	cmp r0, #0
	ble _02229E40
	add r4, r5, #0
_02229E2E:
	ldr r0, [r4, #0x14]
	ldr r0, [r0]
	bl sub_0200DC0C
	ldrb r0, [r5, #5]
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, r0
	blt _02229E2E
_02229E40:
	ldr r0, [r5, #0x10]
	bl sub_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02229E48: .word 0x04000052
_02229E4C: .word ov07_02236778
	thumb_func_end ov07_02229D40

	thumb_func_start ov07_02229E50
ov07_02229E50: ; 0x02229E50
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r7, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	str r3, [sp]
	bl ov07_0221BFD0
	mov r1, #0x44
	bl AllocFromHeap
	add r4, r0, #0
	bne _02229E6E
	bl GF_AssertFail
_02229E6E:
	mov r0, #0
	strb r0, [r4, #4]
	strb r0, [r4]
	str r5, [r4, #0xc]
	str r6, [r4, #0x10]
	add r0, sp, #4
	add r1, r7, #0
	str r7, [r4, #8]
	bl ov07_0221F9E8
	mov r1, #0
	mvn r1, r1
	ldr r0, [r4, #8]
	add r2, r1, #0
	bl ov07_02231E08
	ldr r0, [r4, #8]
	mov r1, #0
	bl ov07_0221C4A8
	strb r0, [r4, #5]
	mov r0, #0
	strb r0, [r4, #6]
	mov r0, #0xf
	strb r0, [r4, #7]
	ldrb r0, [r4, #7]
	ldrb r1, [r4, #6]
	mov r6, #1
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _02229FB4 ; =0x04000052
	strh r1, [r0]
	ldr r0, [sp]
	str r0, [r4, #0x14]
	ldrb r0, [r4, #5]
	cmp r0, #1
	ble _02229ED0
	add r5, r4, #4
_02229EBA:
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	add r2, sp, #4
	bl sub_0200D734
	str r0, [r5, #0x14]
	ldrb r0, [r4, #5]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _02229EBA
_02229ED0:
	add r0, r7, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r7, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _02229F24
	add r0, r7, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r7, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _02229F10
	add r0, r7, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r7, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _02229F10
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_0200DC4C
	b _02229F18
_02229F10:
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl sub_0200DC4C
_02229F18:
	ldr r0, [r4, #0x14]
	mov r1, #0x80
	mov r2, #0x50
	bl sub_0200DDB8
	b _02229F64
_02229F24:
	add r0, r7, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r7, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _02229F52
	add r0, r7, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r7, #0
	bl ov07_0223192C
	cmp r0, #4
	bne _02229F52
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl sub_0200DC4C
	b _02229F5A
_02229F52:
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_0200DC4C
_02229F5A:
	ldr r0, [r4, #0x14]
	mov r1, #0x80
	mov r2, #0x50
	bl sub_0200DDB8
_02229F64:
	ldrb r0, [r4, #5]
	mov r6, #0
	cmp r0, #0
	ble _02229FA4
	add r5, r4, #0
_02229F6E:
	add r1, r4, r6
	mov r0, #0
	strb r0, [r1, #1]
	ldr r0, [r5, #0x14]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r5, #0x14]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #8]
	bl ov07_0221BFC0
	cmp r0, #1
	bne _02229F9A
	mov r2, #0xfe
	ldr r0, [r5, #0x14]
	ldr r1, _02229FB8 ; =0xBF800000
	lsl r2, r2, #0x16
	bl sub_0200E024
_02229F9A:
	ldrb r0, [r4, #5]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _02229F6E
_02229FA4:
	ldr r1, _02229FBC ; =ov07_02229D40
	ldr r3, _02229FC0 ; =0x0000044C
	add r0, r7, #0
	add r2, r4, #0
	bl ov07_0221C3F4
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02229FB4: .word 0x04000052
_02229FB8: .word 0xBF800000
_02229FBC: .word ov07_02229D40
_02229FC0: .word 0x0000044C
	thumb_func_end ov07_02229E50

	thumb_func_start ov07_02229FC4
ov07_02229FC4: ; 0x02229FC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r7, r0, #0
	ldrb r0, [r4]
	mov r6, #0
	cmp r0, #3
	bls _02229FD6
	b _0222A17C
_02229FD6:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02229FE2: ; jump table
	.short _02229FEA - _02229FE2 - 2 ; case 0
	.short _0222A01E - _02229FE2 - 2 ; case 1
	.short _0222A0F6 - _02229FE2 - 2 ; case 2
	.short _0222A142 - _02229FE2 - 2 ; case 3
_02229FEA:
	ldrb r0, [r4, #9]
	cmp r0, #0xf
	bhs _02229FF4
	add r0, r0, #1
	strb r0, [r4, #9]
_02229FF4:
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	beq _02229FFE
	sub r0, r0, #1
	strb r0, [r4, #0xa]
_02229FFE:
	ldrb r0, [r4, #9]
	cmp r0, #0xf
	bne _0222A010
	ldrb r0, [r4, #0xa]
	cmp r0, #0
	bne _0222A010
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_0222A010:
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0222A1D8 ; =0x04000052
	strh r1, [r0]
	b _0222A1A8
_0222A01E:
	ldr r0, [r4, #0x30]
	cmp r0, #3
	bhi _0222A084
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222A030: ; jump table
	.short _0222A038 - _0222A030 - 2 ; case 0
	.short _0222A052 - _0222A030 - 2 ; case 1
	.short _0222A06C - _0222A030 - 2 ; case 2
	.short _0222A06C - _0222A030 - 2 ; case 3
_0222A038:
	ldr r0, [r4, #0x18]
	mov r1, #1
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x24]
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x34]
	bl sub_0200DCE8
	ldr r0, [r4, #0x38]
	mov r1, #1
	bl sub_0200DCE8
	b _0222A084
_0222A052:
	ldr r0, [r4, #0x1c]
	mov r1, #1
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x20]
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x34]
	bl sub_0200DCE8
	ldr r0, [r4, #0x38]
	mov r1, #1
	bl sub_0200DCE8
	b _0222A084
_0222A06C:
	ldr r0, [r4, #0x28]
	mov r1, #1
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x2c]
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x34]
	bl sub_0200DCE8
	ldr r0, [r4, #0x38]
	mov r1, #1
	bl sub_0200DCE8
_0222A084:
	add r1, sp, #8
	ldr r0, [r4, #0x34]
	add r1, #2
	add r2, sp, #8
	bl sub_0200DE44
	ldr r1, [r4, #0x30]
	ldr r0, _0222A1DC ; =ov07_022367B0
	lsl r2, r1, #3
	ldrsh r0, [r0, r2]
	ldr r5, _0222A1E0 ; =ov07_022367AE
	add r3, sp, #8
	str r0, [sp]
	ldr r0, _0222A1E4 ; =ov07_02236774
	ldrsh r2, [r5, r2]
	ldrb r0, [r0, r1]
	mov r1, #2
	mov r5, #0
	str r0, [sp, #4]
	ldrsh r1, [r3, r1]
	add r0, r4, #0
	ldrsh r3, [r3, r5]
	add r0, #0x3c
	bl ov07_02222268
	add r1, sp, #8
	ldr r0, [r4, #0x38]
	add r1, #2
	add r2, sp, #8
	bl sub_0200DE44
	ldr r1, [r4, #0x30]
	ldr r0, _0222A1E8 ; =ov07_022367B4
	lsl r2, r1, #3
	ldrsh r0, [r0, r2]
	ldr r5, _0222A1EC ; =ov07_022367B2
	add r3, sp, #8
	str r0, [sp]
	ldr r0, _0222A1E4 ; =ov07_02236774
	ldrsh r2, [r5, r2]
	ldrb r0, [r0, r1]
	mov r1, #2
	mov r5, #0
	str r0, [sp, #4]
	ldrsh r1, [r3, r1]
	add r0, r4, #0
	ldrsh r3, [r3, r5]
	add r0, #0x60
	bl ov07_02222268
	ldr r0, [r4, #0x30]
	add r0, r0, #1
	str r0, [r4, #0x30]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0222A1A8
_0222A0F6:
	add r0, r4, #0
	ldr r1, [r4, #0x34]
	add r0, #0x3c
	add r5, r6, #0
	bl ov07_022222F0
	cmp r0, #0
	bne _0222A108
	add r5, r5, #1
_0222A108:
	add r0, r4, #0
	ldr r1, [r4, #0x38]
	add r0, #0x60
	bl ov07_022222F0
	cmp r0, #0
	bne _0222A118
	add r5, r5, #1
_0222A118:
	cmp r5, #2
	blt _0222A1A8
	ldr r0, [r4, #0x30]
	cmp r0, #3
	bgt _0222A13A
	ldr r0, [r4, #0x34]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x38]
	mov r1, #0
	bl sub_0200DCE8
	ldrb r0, [r4]
	sub r0, r0, #1
	strb r0, [r4]
	b _0222A1A8
_0222A13A:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0222A1A8
_0222A142:
	ldrb r0, [r4, #9]
	cmp r0, #0
	beq _0222A14C
	sub r0, r0, #1
	strb r0, [r4, #9]
_0222A14C:
	ldrb r0, [r4, #0xa]
	cmp r0, #0xf
	bhs _0222A156
	add r0, r0, #1
	strb r0, [r4, #0xa]
_0222A156:
	ldrb r1, [r4, #0xa]
	cmp r1, #7
	blo _0222A15E
	mov r6, #1
_0222A15E:
	ldrb r0, [r4, #9]
	cmp r0, #0
	bne _0222A16E
	cmp r1, #0xf
	bne _0222A16E
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_0222A16E:
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0222A1D8 ; =0x04000052
	strh r1, [r0]
	b _0222A1A8
_0222A17C:
	ldrb r0, [r4, #8]
	mov r6, #0
	cmp r0, #0
	ble _0222A196
	add r5, r4, #0
_0222A186:
	ldr r0, [r5, #0x18]
	bl sub_0200D9DC
	ldrb r0, [r4, #8]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _0222A186
_0222A196:
	ldr r0, [r4, #0xc]
	add r1, r7, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0222A1A8:
	ldrb r0, [r4]
	cmp r0, #3
	bhs _0222A1CE
	cmp r6, #0
	bne _0222A1CE
	ldrb r0, [r4, #8]
	mov r6, #0
	cmp r0, #0
	ble _0222A1CE
	add r5, r4, #0
_0222A1BC:
	ldr r0, [r5, #0x18]
	ldr r0, [r0]
	bl sub_0200DC0C
	ldrb r0, [r4, #8]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _0222A1BC
_0222A1CE:
	ldr r0, [r4, #0x14]
	bl sub_0200D020
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A1D8: .word 0x04000052
_0222A1DC: .word ov07_022367B0
_0222A1E0: .word ov07_022367AE
_0222A1E4: .word ov07_02236774
_0222A1E8: .word ov07_022367B4
_0222A1EC: .word ov07_022367B2
	thumb_func_end ov07_02229FC4

	thumb_func_start ov07_0222A1F0
ov07_0222A1F0: ; 0x0222A1F0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	str r0, [sp]
	add r5, r1, #0
	add r6, r2, #0
	add r7, r3, #0
	bl ov07_0221BFD0
	mov r1, #0x84
	bl AllocFromHeap
	add r4, r0, #0
	bne _0222A20E
	bl GF_AssertFail
_0222A20E:
	mov r0, #0
	strb r0, [r4, #7]
	strb r0, [r4]
	str r5, [r4, #0x10]
	str r6, [r4, #0x14]
	str r0, [r4, #0x30]
	ldr r0, [sp]
	ldr r1, [sp]
	str r0, [r4, #0xc]
	add r0, sp, #4
	bl ov07_0221F9E8
	mov r1, #0
	mvn r1, r1
	ldr r0, [r4, #0xc]
	add r2, r1, #0
	bl ov07_02231E08
	mov r1, #0
	strb r1, [r4, #9]
	mov r0, #0xf
	strb r0, [r4, #0xa]
	ldrb r0, [r4, #0xa]
	ldrb r2, [r4, #9]
	lsl r0, r0, #8
	orr r2, r0
	ldr r0, _0222A318 ; =0x04000052
	strh r2, [r0]
	ldr r0, [r4, #0xc]
	bl ov07_0221C4A8
	strb r0, [r4, #8]
	str r7, [r4, #0x18]
	ldrb r0, [r4, #8]
	mov r6, #1
	cmp r0, #1
	ble _0222A272
	add r5, r4, #4
	add r7, sp, #4
_0222A25C:
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	add r2, r7, #0
	bl sub_0200D734
	str r0, [r5, #0x18]
	ldrb r0, [r4, #8]
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, r0
	blt _0222A25C
_0222A272:
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r4, #0x20]
	mov r1, #1
	bl sub_0200DC4C
	ldr r0, [r4, #0x24]
	mov r1, #1
	bl sub_0200DC4C
	ldr r0, [r4, #0x28]
	mov r1, #2
	bl sub_0200DC4C
	ldr r0, [r4, #0x2c]
	mov r1, #3
	bl sub_0200DC4C
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl sub_0200E0C0
	ldr r0, [r4, #0x24]
	mov r1, #1
	bl sub_0200E0C0
	ldrb r0, [r4, #8]
	mov r7, #0
	cmp r0, #0
	ble _0222A2E8
	ldr r6, _0222A31C ; =ov07_02236796
	add r5, r4, #0
_0222A2BE:
	ldr r0, [r5, #0x18]
	mov r1, #1
	bl sub_0200DC78
	mov r1, #0
	mov r2, #2
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r5, #0x18]
	bl sub_0200DDB8
	ldr r0, [r5, #0x18]
	mov r1, #1
	bl sub_0200E0FC
	ldrb r0, [r4, #8]
	add r7, r7, #1
	add r5, r5, #4
	add r6, r6, #4
	cmp r7, r0
	blt _0222A2BE
_0222A2E8:
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x2c]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [sp]
	ldr r1, _0222A320 ; =ov07_02229FC4
	ldr r3, _0222A324 ; =0x0000044C
	add r2, r4, #0
	bl ov07_0221C3F4
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222A318: .word 0x04000052
_0222A31C: .word ov07_02236796
_0222A320: .word ov07_02229FC4
_0222A324: .word 0x0000044C
	thumb_func_end ov07_0222A1F0

	thumb_func_start ov07_0222A328
ov07_0222A328: ; 0x0222A328
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0xc]
	cmp r0, #7
	bls _0222A338
	b _0222A490
_0222A338:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222A344: ; jump table
	.short _0222A354 - _0222A344 - 2 ; case 0
	.short _0222A368 - _0222A344 - 2 ; case 1
	.short _0222A38A - _0222A344 - 2 ; case 2
	.short _0222A3B8 - _0222A344 - 2 ; case 3
	.short _0222A3E6 - _0222A344 - 2 ; case 4
	.short _0222A404 - _0222A344 - 2 ; case 5
	.short _0222A42C - _0222A344 - 2 ; case 6
	.short _0222A474 - _0222A344 - 2 ; case 7
_0222A354:
	ldrb r0, [r4, #0xe]
	sub r0, r0, #1
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #0xe]
	cmp r0, #0xa
	bhi _0222A374
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A368:
	ldrb r0, [r4, #0xd]
	add r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	cmp r0, #3
	bhs _0222A376
_0222A374:
	b _0222A49E
_0222A376:
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A38A:
	ldrb r0, [r4, #0xd]
	add r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	cmp r0, #3
	bhi _0222A3AC
	ldr r0, [r4, #0x38]
	ldr r1, _0222A4A8 ; =0x3DCCCCCD
	bl _fadd
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x38]
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	bl sub_0200E024
	b _0222A49E
_0222A3AC:
	mov r0, #0
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A3B8:
	ldrb r0, [r4, #0xd]
	add r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	cmp r0, #3
	bhi _0222A3DA
	ldr r0, [r4, #0x38]
	ldr r1, _0222A4A8 ; =0x3DCCCCCD
	bl _fsub
	str r0, [r4, #0x38]
	ldr r1, [r4, #0x38]
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	bl sub_0200E024
	b _0222A49E
_0222A3DA:
	mov r0, #0
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A3E6:
	ldrb r0, [r4, #0xe]
	sub r0, r0, #1
	strb r0, [r4, #0xe]
	ldrb r0, [r4, #0xe]
	cmp r0, #0xa
	bhi _0222A49E
	ldr r0, [r4, #0x3c]
	mov r1, #1
	str r1, [r0]
	mov r0, #0
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A404:
	ldrb r0, [r4, #0xd]
	add r0, r0, #1
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	cmp r0, #0x1e
	bls _0222A41C
	mov r0, #0
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A41C:
	ldr r0, [r4, #0x3c]
	ldr r0, [r0]
	cmp r0, #2
	bne _0222A49E
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A42C:
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	add r5, r1, #0
	add r2, sp, #8
	ldr r0, [r4, #0x10]
	add r1, sp, #8
	add r2, #2
	add r5, #0xa
	bl sub_0200DE44
	ldrb r0, [r4, #0xf]
	add r3, sp, #8
	mov r1, #0
	lsl r2, r0, #2
	ldr r0, _0222A4AC ; =ov07_02236780
	ldrsh r0, [r0, r2]
	str r0, [sp]
	lsl r0, r5, #0x10
	ldr r5, _0222A4B0 ; =ov07_0223677E
	lsr r0, r0, #0x10
	str r0, [sp, #4]
	ldrsh r2, [r5, r2]
	add r0, r4, #0
	mov r5, #2
	ldrsh r1, [r3, r1]
	ldrsh r3, [r3, r5]
	add r0, #0x14
	bl ov07_02222268
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
	b _0222A49E
_0222A474:
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	add r0, #0x14
	bl ov07_022222F0
	cmp r0, #0
	bne _0222A49E
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_0200DCE8
	ldrb r0, [r4, #0xc]
	add r0, r0, #1
	strb r0, [r4, #0xc]
_0222A490:
	ldr r0, [r4, #0x3c]
	mov r1, #3
	str r1, [r0]
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
_0222A49E:
	ldr r0, [r4, #0x10]
	bl sub_0200DC18
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0222A4A8: .word 0x3DCCCCCD
_0222A4AC: .word ov07_02236780
_0222A4B0: .word ov07_0223677E
	thumb_func_end ov07_0222A328

	thumb_func_start ov07_0222A4B4
ov07_0222A4B4: ; 0x0222A4B4
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #3
	bhi _0222A570
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222A4CC: ; jump table
	.short _0222A4D4 - _0222A4CC - 2 ; case 0
	.short _0222A500 - _0222A4CC - 2 ; case 1
	.short _0222A522 - _0222A4CC - 2 ; case 2
	.short _0222A54E - _0222A4CC - 2 ; case 3
_0222A4D4:
	ldrb r6, [r4, #2]
	mov r3, #1
	mov r2, #0
	cmp r6, #0
	ble _0222A4F4
	ldr r0, _0222A588 ; =0x00000514
	add r5, r4, #0
_0222A4E2:
	ldr r1, [r5, r0]
	cmp r1, #1
	beq _0222A4EC
	mov r3, #0
	b _0222A4F4
_0222A4EC:
	add r2, r2, #1
	add r5, r5, #4
	cmp r2, r6
	blt _0222A4E2
_0222A4F4:
	cmp r3, #1
	bne _0222A580
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0222A580
_0222A500:
	ldrb r0, [r4, #2]
	mov r5, #0
	cmp r0, #0
	ble _0222A51A
	ldr r0, _0222A588 ; =0x00000514
	add r3, r4, #0
	mov r2, #2
_0222A50E:
	str r2, [r3, r0]
	ldrb r1, [r4, #2]
	add r5, r5, #1
	add r3, r3, #4
	cmp r5, r1
	blt _0222A50E
_0222A51A:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0222A580
_0222A522:
	ldrb r5, [r4, #2]
	mov r2, #1
	mov r6, #0
	cmp r5, #0
	ble _0222A542
	ldr r0, _0222A588 ; =0x00000514
	add r3, r4, #0
_0222A530:
	ldr r1, [r3, r0]
	cmp r1, #3
	beq _0222A53A
	mov r2, #0
	b _0222A542
_0222A53A:
	add r6, r6, #1
	add r3, r3, #4
	cmp r6, r5
	blt _0222A530
_0222A542:
	cmp r2, #1
	bne _0222A580
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0222A580
_0222A54E:
	ldrb r0, [r4, #2]
	mov r6, #0
	cmp r0, #0
	ble _0222A568
	add r5, r4, #0
_0222A558:
	ldr r0, [r5, #0x24]
	bl sub_0200D9DC
	ldrb r0, [r4, #2]
	add r6, r6, #1
	add r5, #0x40
	cmp r6, r0
	blt _0222A558
_0222A568:
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0222A580
_0222A570:
	ldr r0, [r4, #8]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
_0222A580:
	ldr r0, [r4, #0x10]
	bl sub_0200D020
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222A588: .word 0x00000514
	thumb_func_end ov07_0222A4B4

	thumb_func_start ov07_0222A58C
ov07_0222A58C: ; 0x0222A58C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	str r0, [sp]
	add r4, r1, #0
	add r5, r2, #0
	add r7, r3, #0
	bl ov07_0221BFD0
	ldr r1, _0222A6F4 ; =0x00000564
	bl AllocFromHeap
	add r6, r0, #0
	bne _0222A5AA
	bl GF_AssertFail
_0222A5AA:
	mov r0, #0
	strb r0, [r6, #1]
	strb r0, [r6]
	str r4, [r6, #0xc]
	ldr r0, [sp]
	str r5, [r6, #0x10]
	str r0, [r6, #8]
	ldr r1, [sp]
	add r0, sp, #0x1c
	bl ov07_0221F9E8
	mov r1, #0
	mvn r1, r1
	ldr r0, [r6, #8]
	add r2, r1, #0
	bl ov07_02231E08
	ldr r0, [r6, #8]
	mov r1, #0
	bl ov07_0221C4A8
	strb r0, [r6, #2]
	mov r0, #0xc
	strb r0, [r6, #2]
	str r7, [r6, #0x24]
	mov r4, #0
	ldrb r0, [r6, #2]
	str r4, [sp, #4]
	cmp r0, #0
	ble _0222A6E2
	ldr r0, _0222A6F8 ; =0x00000514
	add r5, r6, #0
	add r0, r6, r0
	str r0, [sp, #0x10]
	add r0, r6, #0
	str r0, [sp, #0xc]
	add r0, #0x14
	str r0, [sp, #0xc]
_0222A5F6:
	cmp r4, #0
	beq _0222A606
	ldr r0, [r6, #0xc]
	ldr r1, [r6, #0x10]
	add r2, sp, #0x1c
	bl sub_0200D734
	str r0, [r5, #0x24]
_0222A606:
	add r1, r5, #0
	ldr r7, [r5, #0x24]
	add r1, #0x20
	mov r0, #0
	strb r0, [r1]
	add r1, r5, #0
	add r1, #0x21
	strb r0, [r1]
	bl LCRandom
	mov r1, #0xa
	bl _s32_div_f
	add r1, #0xa
	add r0, r5, #0
	add r1, r4, r1
	add r0, #0x22
	strb r1, [r0]
	bl LCRandom
	mov r1, #6
	bl _s32_div_f
	add r0, r5, #0
	add r0, #0x23
	strb r1, [r0]
	mov r0, #0xfe
	lsl r0, r0, #0x16
	str r0, [r5, #0x4c]
	ldr r0, [r6, #8]
	ldr r1, _0222A6FC ; =ov07_022367CE
	str r0, [r5, #0x14]
	ldr r0, [r6, #0xc]
	str r0, [r5, #0x18]
	ldr r0, [r6, #0x10]
	str r0, [r5, #0x1c]
	ldr r0, [sp, #0x10]
	str r0, [r5, #0x50]
	ldr r0, [sp, #4]
	lsl r0, r0, #3
	str r0, [sp, #0x18]
	add r0, r1, r0
	str r0, [sp, #8]
	bl LCRandom
	ldr r2, [sp, #8]
	mov r1, #6
	ldrsh r1, [r2, r1]
	bl _s32_div_f
	ldr r2, [sp, #8]
	mov r0, #2
	ldrsh r0, [r2, r0]
	add r0, r0, r1
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0x14]
	bl LCRandom
	ldr r2, [sp, #8]
	mov r1, #4
	ldrsh r1, [r2, r1]
	bl _s32_div_f
	ldr r2, _0222A6FC ; =ov07_022367CE
	ldr r0, [sp, #0x18]
	ldrsh r0, [r2, r0]
	add r0, r0, r1
	lsl r0, r0, #0x10
	asr r2, r0, #0x10
	ldr r1, [sp, #0x14]
	add r0, r7, #0
	bl sub_0200DDB8
	add r0, r7, #0
	mov r1, #2
	bl sub_0200DF98
	ldr r1, [r5, #0x4c]
	add r0, r7, #0
	add r2, r1, #0
	bl sub_0200E024
	add r0, r7, #0
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [sp]
	ldr r1, _0222A700 ; =ov07_0222A328
	ldr r2, [sp, #0xc]
	ldr r3, _0222A704 ; =0x0000044B
	bl ov07_0221C3F4
	ldr r0, [sp, #4]
	mov r1, #6
	add r0, r0, #1
	bl _s32_div_f
	ldr r0, [sp, #0x10]
	add r4, r4, #1
	add r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [sp, #0xc]
	str r1, [sp, #4]
	add r0, #0x40
	str r0, [sp, #0xc]
	ldrb r0, [r6, #2]
	add r5, #0x40
	cmp r4, r0
	blt _0222A5F6
_0222A6E2:
	ldr r0, [sp]
	ldr r1, _0222A708 ; =ov07_0222A4B4
	ldr r3, _0222A70C ; =0x0000044D
	add r2, r6, #0
	bl ov07_0221C3F4
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222A6F4: .word 0x00000564
_0222A6F8: .word 0x00000514
_0222A6FC: .word ov07_022367CE
_0222A700: .word ov07_0222A328
_0222A704: .word 0x0000044B
_0222A708: .word ov07_0222A4B4
_0222A70C: .word 0x0000044D
	thumb_func_end ov07_0222A58C

	thumb_func_start ov07_0222A710
ov07_0222A710: ; 0x0222A710
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #4]
	cmp r0, #3
	bhi _0222A7F6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222A72A: ; jump table
	.short _0222A732 - _0222A72A - 2 ; case 0
	.short _0222A750 - _0222A72A - 2 ; case 1
	.short _0222A7A2 - _0222A72A - 2 ; case 2
	.short _0222A7CC - _0222A72A - 2 ; case 3
_0222A732:
	ldr r0, [r4, #8]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0222A81C
_0222A750:
	add r0, r4, #0
	add r0, #0x2c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222A81C
	mov r0, #0
	str r0, [r4]
	ldr r0, [r4, #8]
	mov r1, #1
	bl ov07_0221FAF8
	add r5, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl ov07_02222D88
	add r6, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221BFD0
	mov r1, #0xc8
	str r1, [sp]
	mov r3, #3
	str r5, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r1, #0
	mov r1, #0xa0
	add r2, r1, #0
	add r2, #0xcc
	lsl r3, r3, #0xe
	bl ov07_02222CCC
	str r0, [r4, #0x28]
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0222A81C
_0222A7A2:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	cmp r0, #0x78
	blt _0222A81C
	ldr r0, [r4, #0x28]
	bl ov07_02222D3C
	mov r1, #2
	mov r2, #0x10
	str r1, [sp]
	add r0, r4, #0
	str r2, [sp, #4]
	add r0, #0x2c
	add r3, r2, #0
	bl ov07_02222AC4
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0222A81C
_0222A7CC:
	add r0, r4, #0
	add r0, #0x2c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222A81C
	ldr r0, [r4, #8]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #8]
	bl ov07_0221FA48
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	ldrb r0, [r4, #4]
	add r0, r0, #1
	strb r0, [r4, #4]
	b _0222A81C
_0222A7F6:
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _0222A834 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	ldr r0, [r4, #8]
	mov r1, #2
	bl ov07_0221EC7C
	ldr r0, [r4, #8]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
_0222A81C:
	ldr r0, [r4, #0x24]
	bl sub_0200DC18
	ldr r0, [r4, #0x20]
	bl sub_0200DC18
	ldr r0, [r4, #0x10]
	bl sub_0200D020
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	nop
_0222A834: .word 0xFFFF1FFF
	thumb_func_end ov07_0222A710

	thumb_func_start ov07_0222A838
ov07_0222A838: ; 0x0222A838
	push {r3, r4, r5, lr}
	sub sp, #8
	mov r1, #0x54
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #4
	bl ov07_02231FE4
	ldr r0, [r4, #8]
	mov r1, #0
	bl ov07_0221C4E8
	mov r1, #2
	str r0, [r4, #0x20]
	bl sub_0200E0FC
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r2, [r0]
	ldr r1, _0222A8CC ; =0xFFFF1FFF
	and r2, r1
	lsr r1, r0, #0xb
	orr r1, r2
	str r1, [r0]
	add r0, #0x4a
	ldrh r2, [r0]
	mov r1, #0x3f
	bic r2, r1
	mov r1, #0x1b
	orr r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	ldr r1, _0222A8D0 ; =0xFFFFC0FF
	and r2, r1
	mov r1, #0x17
	lsl r1, r1, #8
	orr r1, r2
	strh r1, [r0]
	ldr r0, [r4, #8]
	mov r1, #1
	bl ov07_0221C4E8
	mov r1, #1
	str r0, [r4, #0x24]
	bl sub_0200E0FC
	mov r1, #0x10
	str r1, [sp]
	add r0, r4, #0
	mov r2, #2
	str r1, [sp, #4]
	add r0, #0x2c
	add r3, r2, #0
	bl ov07_02222AC4
	ldr r0, [r4, #8]
	mov r1, #2
	bl ov07_0221EB98
	mov r0, #2
	mov r1, #1
	bl ToggleBgLayer
	ldr r0, [r4, #8]
	ldr r1, _0222A8D4 ; =ov07_0222A710
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0222A8CC: .word 0xFFFF1FFF
_0222A8D0: .word 0xFFFFC0FF
_0222A8D4: .word ov07_0222A710
	thumb_func_end ov07_0222A838

	thumb_func_start ov07_0222A8D8
ov07_0222A8D8: ; 0x0222A8D8
	push {r4, lr}
	add r4, r0, #0
	bl sub_0200DCFC
	cmp r0, #1
	bne _0222A8EA
	add r0, r4, #0
	bl sub_0200DC18
_0222A8EA:
	pop {r4, pc}
	thumb_func_end ov07_0222A8D8

	thumb_func_start ov07_0222A8EC
ov07_0222A8EC: ; 0x0222A8EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r1, [sp, #4]
	str r0, [sp]
	ldr r0, [sp, #4]
	mov r1, #0x1c
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bgt _0222A910
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x30]
	bl ov07_0222A8D8
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x34]
	bl ov07_0222A8D8
	b _0222A916
_0222A910:
	sub r1, r0, #1
	ldr r0, [sp, #4]
	strh r1, [r0, #0x1c]
_0222A916:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x28]
	bl ov07_0222A8D8
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x2c]
	bl ov07_0222A8D8
	ldr r4, [sp, #4]
	mov r6, #0
	add r7, r6, #0
	add r5, r4, #0
_0222A92E:
	mov r0, #0x1e
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #0x1e]
	mov r0, #0x1e
	ldrsh r0, [r4, r0]
	cmp r0, #0x28
	blt _0222A948
	ldr r0, [r5, #0x28]
	mov r1, #0
	bl sub_0200DCE8
	add r6, r6, #1
_0222A948:
	add r7, r7, #1
	add r4, r4, #2
	add r5, r5, #4
	cmp r7, #4
	blt _0222A92E
	cmp r6, #4
	bne _0222A97C
	ldr r4, [sp, #4]
	mov r5, #0
_0222A95A:
	ldr r0, [r4, #0x28]
	bl sub_0200D9DC
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #4
	blt _0222A95A
	ldr r0, [sp, #4]
	ldr r1, [sp]
	ldr r0, [r0, #4]
	bl ov07_0221C448
	ldr r0, [sp, #4]
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222A97C:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x10]
	bl sub_0200D020
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222A8EC

	thumb_func_start ov07_0222A988
ov07_0222A988: ; 0x0222A988
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	mov r1, #0x38
	add r5, r0, #0
	add r4, r3, #0
	bl ov07_022324D8
	add r6, r0, #0
	mov r0, #0xa
	strh r0, [r6, #0x1c]
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_02231FE4
	ldr r1, [r6, #4]
	add r0, sp, #0
	bl ov07_0221F9E8
	str r4, [r6, #0x28]
	mov r0, #0
	strh r0, [r6, #0x1e]
	mov r7, #1
	add r4, r6, #2
	add r5, r6, #4
_0222A9B8:
	mov r0, #0
	strh r0, [r4, #0x1e]
	ldr r0, [r6, #8]
	ldr r1, [r6, #0x10]
	add r2, sp, #0
	bl sub_0200D734
	str r0, [r5, #0x28]
	add r7, r7, #1
	add r4, r4, #2
	add r5, r5, #4
	cmp r7, #4
	blt _0222A9B8
	ldr r0, [r6, #0x28]
	mov r1, #1
	bl sub_0200E0C0
	ldr r0, [r6, #0x2c]
	mov r1, #1
	bl sub_0200E0C0
	mov r1, #0x1f
	ldr r0, [r6, #0x28]
	mvn r1, r1
	mov r2, #0
	bl sub_0200DED0
	mov r1, #0x1f
	ldr r0, [r6, #0x2c]
	mvn r1, r1
	mov r2, #0x20
	bl sub_0200DED0
	ldr r0, [r6, #0x30]
	mov r1, #0x20
	mov r2, #0
	bl sub_0200DED0
	mov r1, #0x20
	ldr r0, [r6, #0x34]
	add r2, r1, #0
	bl sub_0200DED0
	ldr r0, [r6, #4]
	ldr r1, _0222AA1C ; =ov07_0222A8EC
	add r2, r6, #0
	bl ov07_0221C410
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222AA1C: .word ov07_0222A8EC
	thumb_func_end ov07_0222A988

	thumb_func_start ov07_0222AA20
ov07_0222AA20: ; 0x0222AA20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r5, r1, #0
	mov r4, #0
	str r0, [sp, #0x1c]
	str r4, [sp, #0x20]
	add r6, r5, #0
	add r7, r5, #0
_0222AA30:
	mov r0, #0x22
	ldrsh r0, [r6, r0]
	add r0, r0, #1
	strh r0, [r6, #0x22]
	mov r0, #0x22
	ldrsh r0, [r6, r0]
	cmp r0, #0x14
	blt _0222AA82
	ldr r0, [r7, #0x2c]
	bl ov07_0222A8D8
	mov r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x6e
	bne _0222AA82
	mov r1, #0
	mvn r1, r1
	ldr r0, [r5, #4]
	add r2, r1, #0
	bl ov07_02231E08
	ldr r0, [r5, #0x2c]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r5, #0x30]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r5, #0x34]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r5, #0x38]
	mov r1, #1
	bl sub_0200E0FC
	mov r0, #0xf
	str r0, [r5, #0x54]
	mov r0, #0
	str r0, [r5, #0x58]
_0222AA82:
	add r4, r4, #1
	add r6, r6, #2
	add r7, r7, #4
	cmp r4, #4
	blt _0222AA30
	mov r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x32
	bne _0222AAC6
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	add r1, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _0222ACA0 ; =0x0000FFFF
	str r0, [sp, #0x14]
	ldr r0, _0222ACA4 ; =0x000003EA
	str r0, [sp, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	lsl r3, r3, #0x14
	lsr r3, r3, #0x10
	bl ov07_02222F10
	str r0, [r5, #0x3c]
_0222AAC6:
	mov r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x3c
	bne _0222AB00
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	add r1, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, _0222ACA0 ; =0x0000FFFF
	str r0, [sp, #0x14]
	ldr r0, _0222ACA4 ; =0x000003EA
	str r0, [sp, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	lsl r3, r3, #0x14
	lsr r3, r3, #0x10
	bl ov07_02222F10
	str r0, [r5, #0x40]
_0222AB00:
	mov r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x46
	bne _0222AB3A
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	add r1, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _0222ACA0 ; =0x0000FFFF
	str r0, [sp, #0x14]
	ldr r0, _0222ACA4 ; =0x000003EA
	str r0, [sp, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	lsl r3, r3, #0x14
	lsr r3, r3, #0x10
	bl ov07_02222F10
	str r0, [r5, #0x44]
_0222AB3A:
	mov r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x50
	bne _0222AB74
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	add r1, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, _0222ACA0 ; =0x0000FFFF
	str r0, [sp, #0x14]
	ldr r0, _0222ACA4 ; =0x000003EA
	str r0, [sp, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	lsl r3, r3, #0x14
	lsr r3, r3, #0x10
	bl ov07_02222F10
	str r0, [r5, #0x48]
_0222AB74:
	mov r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x5a
	bne _0222ABAE
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	add r1, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _0222ACA0 ; =0x0000FFFF
	str r0, [sp, #0x14]
	ldr r0, _0222ACA4 ; =0x000003EA
	str r0, [sp, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	lsl r3, r3, #0x14
	lsr r3, r3, #0x10
	bl ov07_02222F10
	str r0, [r5, #0x4c]
_0222ABAE:
	mov r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x64
	bne _0222ABE8
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	add r1, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	mov r0, #0xe
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, _0222ACA0 ; =0x0000FFFF
	str r0, [sp, #0x14]
	ldr r0, _0222ACA4 ; =0x000003EA
	str r0, [sp, #0x18]
	ldr r3, [r5, #0x1c]
	ldr r0, [r5, #0x18]
	lsl r3, r3, #0x14
	lsr r3, r3, #0x10
	bl ov07_02222F10
	str r0, [r5, #0x50]
_0222ABE8:
	mov r1, #0x22
	ldrsh r0, [r5, r1]
	cmp r0, #0x6e
	bne _0222AC22
	sub r1, #0x23
	ldr r0, [r5, #4]
	add r2, r1, #0
	bl ov07_02231E08
	ldr r0, [r5, #0x2c]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r5, #0x30]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r5, #0x34]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r5, #0x38]
	mov r1, #1
	bl sub_0200E0FC
	mov r0, #0xf
	str r0, [r5, #0x54]
	mov r0, #0
	str r0, [r5, #0x58]
_0222AC22:
	mov r0, #0x22
	ldrsh r0, [r5, r0]
	cmp r0, #0x6e
	blt _0222AC5A
	ldr r0, [r5, #0x54]
	cmp r0, #0
	ble _0222AC34
	sub r0, r0, #1
	str r0, [r5, #0x54]
_0222AC34:
	ldr r0, [r5, #0x58]
	cmp r0, #0xf
	bge _0222AC3E
	add r0, r0, #1
	str r0, [r5, #0x58]
_0222AC3E:
	ldr r0, [r5, #0x58]
	ldr r1, [r5, #0x54]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0222ACA8 ; =0x04000052
	strh r1, [r0]
	ldr r0, [r5, #0x54]
	cmp r0, #0
	bne _0222AC5A
	ldr r0, [r5, #0x58]
	cmp r0, #0xf
	bne _0222AC5A
	mov r0, #4
	str r0, [sp, #0x20]
_0222AC5A:
	ldr r0, [sp, #0x20]
	cmp r0, #4
	bne _0222AC96
	mov r6, #0
	add r4, r5, #0
_0222AC64:
	ldr r0, [r4, #0x2c]
	bl sub_0200D9DC
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _0222AC64
	mov r6, #0
	add r4, r5, #0
_0222AC76:
	ldr r0, [r4, #0x3c]
	bl ov07_02222EF8
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #6
	blt _0222AC76
	ldr r0, [r5, #4]
	ldr r1, [sp, #0x1c]
	bl ov07_0221C448
	add r0, r5, #0
	bl FreeToHeap
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_0222AC96:
	ldr r0, [r5, #0x10]
	bl sub_0200D020
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222ACA0: .word 0x0000FFFF
_0222ACA4: .word 0x000003EA
_0222ACA8: .word 0x04000052
	thumb_func_end ov07_0222AA20

	thumb_func_start ov07_0222ACAC
ov07_0222ACAC: ; 0x0222ACAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	mov r1, #0x5c
	str r0, [sp]
	add r5, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	mov r0, #0xa
	strh r0, [r4, #0x20]
	ldr r0, [sp]
	add r1, r4, #0
	bl ov07_02231FE4
	ldr r1, [r4, #4]
	add r0, sp, #0xc
	bl ov07_0221F9E8
	str r5, [r4, #0x2c]
	mov r0, #0
	strh r0, [r4, #0x22]
	mov r0, #1
	str r0, [sp, #8]
	mov r7, #5
	add r6, r4, #2
	add r5, r4, #4
_0222ACE0:
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x1e
	sub r2, r2, r1
	mov r0, #0x1e
	ror r2, r0
	add r0, r1, r2
	add r0, r7, r0
	strh r0, [r6, #0x22]
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	add r2, sp, #0xc
	bl sub_0200D734
	str r0, [r5, #0x2c]
	ldr r0, [sp, #8]
	add r7, r7, #5
	add r0, r0, #1
	add r6, r6, #2
	add r5, r5, #4
	str r0, [sp, #8]
	cmp r0, #4
	blt _0222ACE0
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_0200E0C0
	ldr r0, [r4, #0x34]
	mov r1, #1
	bl sub_0200E0C0
	ldr r0, [sp]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [sp]
	bl ov07_0221FA48
	mov r1, #0
	add r5, r0, #0
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	add r0, r5, #0
	mov r1, #1
	bl sub_02008A78
	add r0, r5, #0
	mov r1, #0x29
	bl sub_02008A78
	ldr r0, [sp]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [sp]
	bl ov07_0223192C
	cmp r0, #3
	bne _0222AD62
	mov r7, #0x8c
	b _0222AD64
_0222AD62:
	mov r7, #0x54
_0222AD64:
	mov r6, #0
	add r5, r4, #0
_0222AD68:
	ldr r0, [r5, #0x2c]
	ldr r1, [sp, #4]
	add r2, r7, #0
	bl sub_0200DDB8
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #4
	blt _0222AD68
	ldr r0, [sp]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [sp]
	bl ov07_0223192C
	cmp r0, #3
	ldr r0, [r4, #0x2c]
	bne _0222ADAE
	mov r1, #0xa
	bl sub_0200DD68
	ldr r0, [r4, #0x34]
	mov r1, #0xa
	bl sub_0200DD68
	ldr r0, [r4, #0x30]
	mov r1, #0x12
	bl sub_0200DD68
	ldr r0, [r4, #0x38]
	mov r1, #0x12
	bl sub_0200DD68
	b _0222ADCC
_0222ADAE:
	mov r1, #0x12
	bl sub_0200DD68
	ldr r0, [r4, #0x34]
	mov r1, #0x12
	bl sub_0200DD68
	ldr r0, [r4, #0x30]
	mov r1, #0xa
	bl sub_0200DD68
	ldr r0, [r4, #0x38]
	mov r1, #0xa
	bl sub_0200DD68
_0222ADCC:
	mov r1, #0x1f
	ldr r0, [r4, #0x2c]
	mvn r1, r1
	mov r2, #0
	bl sub_0200DED0
	mov r1, #0x27
	ldr r0, [r4, #0x38]
	mvn r1, r1
	mov r2, #4
	bl sub_0200DED0
	ldr r0, [r4, #0x34]
	mov r1, #0x20
	mov r2, #0
	bl sub_0200DED0
	ldr r0, [r4, #0x30]
	mov r1, #0x28
	mov r2, #4
	bl sub_0200DED0
	ldr r0, [r4, #0x2c]
	bl sub_0200DD30
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	ldr r1, _0222AE10 ; =ov07_0222AA20
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222AE10: .word ov07_0222AA20
	thumb_func_end ov07_0222ACAC

	thumb_func_start ov07_0222AE14
ov07_0222AE14: ; 0x0222AE14
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0222AE9A
	add r0, r4, #0
	add r0, #0x60
	bl ov07_0222260C
	cmp r0, #0
	bne _0222AE58
	ldr r0, [r4, #0x28]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x3c]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x3c]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl ov07_02232508
	add sp, #0xc
	pop {r4, r5, pc}
_0222AE58:
	add r0, r4, #0
	add r0, #0x60
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x28]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	bl sub_0200E024
	mov r0, #0
	str r0, [sp]
	mov r1, #0x58
	mov r2, #0x5a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x28]
	ldr r3, [r4, #0x74]
	bl ov07_022226FC
	ldr r0, [r4, #0x28]
	bl sub_0200DC18
	ldr r0, [r4, #0x3c]
	bl sub_0200DC18
	ldr r0, [r4, #0x50]
	bl sub_0200DC18
	ldr r0, [r4, #0xc]
	bl sub_0200D020
_0222AE9A:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0222AE14

	thumb_func_start ov07_0222AEA0
ov07_0222AEA0: ; 0x0222AEA0
	push {r4, r5, lr}
	sub sp, #0xc
	mov r1, #0x84
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	ldr r0, [r4, #4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	mov r1, #1
	str r0, [r4, #0x24]
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0x58
	strh r0, [r1]
	mov r0, #0x58
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0x5c
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FAA0
	add r1, r4, #0
	add r1, #0x5a
	strh r0, [r1]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x28]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x3c]
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221C4E8
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x28]
	mov r1, #2
	bl sub_0200DF98
	add r0, r5, #0
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r4, #0x28]
	bl sub_0200DD54
	add r0, r5, #0
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r4, #0x3c]
	bl sub_0200DD54
	add r0, r5, #0
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r4, #0x50]
	bl sub_0200DD54
	ldr r0, [r4, #4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA04
	sub r0, r0, #3
	cmp r0, #1
	ldr r0, [r4, #0x28]
	bhi _0222AF6E
	mov r1, #0x1e
	bl sub_0200DD68
	ldr r0, [r4, #0x3c]
	mov r1, #0x32
	bl sub_0200DD68
	ldr r0, [r4, #0x50]
	mov r1, #0x46
	bl sub_0200DD68
	b _0222AF84
_0222AF6E:
	mov r1, #0x3c
	bl sub_0200DD68
	ldr r0, [r4, #0x3c]
	mov r1, #0x46
	bl sub_0200DD68
	ldr r0, [r4, #0x50]
	mov r1, #0x32
	bl sub_0200DD68
_0222AF84:
	mov r2, #0x14
	mov r1, #0x64
	str r2, [sp]
	str r1, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x60
	add r3, r1, #0
	bl ov07_02222590
	ldr r0, [r4, #4]
	ldr r1, _0222AFA8 ; =ov07_0222AE14
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0222AFA8: .word ov07_0222AE14
	thumb_func_end ov07_0222AEA0

	thumb_func_start ov07_0222AFAC
ov07_0222AFAC: ; 0x0222AFAC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r2, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0222AFC0
	cmp r0, #1
	beq _0222B0BE
	b _0222B10C
_0222AFC0:
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #0
	bne _0222B03A
	mov r0, #0x22
	ldrsh r3, [r4, r0]
	mov r0, #0x20
	ldrsh r1, [r4, r0]
	mov r0, #3
	add r2, r1, #0
	str r3, [sp]
	add r2, #0x30
	str r0, [sp, #4]
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x34
	asr r2, r2, #0x10
	bl ov07_02222268
	mov r0, #0x22
	ldrsh r1, [r4, r0]
	mov r0, #0xa4
	ldrsh r0, [r4, r0]
	add r2, r1, r0
	mov r0, #0x20
	ldrsh r1, [r4, r0]
	lsl r0, r2, #0x10
	asr r3, r0, #0x10
	add r2, r1, #0
	add r2, #0x30
	lsl r2, r2, #0x10
	str r3, [sp]
	mov r0, #6
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x58
	asr r2, r2, #0x10
	bl ov07_02222268
	mov r0, #0x22
	ldrsh r1, [r4, r0]
	mov r0, #0xa4
	ldrsh r0, [r4, r0]
	add r2, r1, r0
	mov r0, #0x20
	ldrsh r1, [r4, r0]
	lsl r0, r2, #0x10
	asr r3, r0, #0x10
	add r2, r1, #0
	add r2, #0x30
	lsl r2, r2, #0x10
	str r3, [sp]
	mov r0, #8
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x7c
	asr r2, r2, #0x10
	bl ov07_02222268
	b _0222B0A8
_0222B03A:
	mov r0, #0x22
	ldrsh r3, [r4, r0]
	mov r0, #0x20
	ldrsh r2, [r4, r0]
	mov r0, #3
	add r1, r2, #0
	str r3, [sp]
	add r1, #0x30
	str r0, [sp, #4]
	add r0, r4, #0
	lsl r1, r1, #0x10
	add r0, #0x34
	asr r1, r1, #0x10
	bl ov07_02222268
	mov r0, #0x22
	ldrsh r1, [r4, r0]
	mov r0, #0xa4
	ldrsh r0, [r4, r0]
	add r1, r1, r0
	mov r0, #0x20
	ldrsh r2, [r4, r0]
	lsl r0, r1, #0x10
	asr r3, r0, #0x10
	add r1, r2, #0
	add r1, #0x30
	lsl r1, r1, #0x10
	str r3, [sp]
	mov r0, #6
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x58
	asr r1, r1, #0x10
	bl ov07_02222268
	mov r0, #0x22
	ldrsh r1, [r4, r0]
	mov r0, #0xa4
	ldrsh r0, [r4, r0]
	add r1, r1, r0
	mov r0, #0x20
	ldrsh r2, [r4, r0]
	lsl r0, r1, #0x10
	asr r3, r0, #0x10
	add r1, r2, #0
	add r1, #0x30
	lsl r1, r1, #0x10
	str r3, [sp]
	mov r0, #9
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x7c
	asr r1, r1, #0x10
	bl ov07_02222268
_0222B0A8:
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xa0
	strb r1, [r0]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0222B11E
_0222B0BE:
	add r0, r4, #0
	ldr r1, [r4, #0x28]
	add r0, #0x58
	mov r5, #0
	bl ov07_022222F0
	cmp r0, #0
	bne _0222B0D0
	add r5, r5, #1
_0222B0D0:
	add r0, r4, #0
	ldr r1, [r4, #0x24]
	add r0, #0x34
	bl ov07_02222314
	cmp r0, #0
	bne _0222B0E0
	add r5, r5, #1
_0222B0E0:
	add r0, r4, #0
	ldr r1, [r4, #0x30]
	add r0, #0x7c
	bl ov07_022222F0
	cmp r0, #0
	bne _0222B0F0
	add r5, r5, #1
_0222B0F0:
	cmp r5, #3
	blt _0222B11E
	add r0, r4, #0
	add r0, #0xa0
	ldrb r0, [r0]
	cmp r0, #1
	ldrb r0, [r4]
	bne _0222B106
	sub r0, r0, #1
	strb r0, [r4]
	b _0222B11E
_0222B106:
	add r0, r0, #1
	strb r0, [r4]
	b _0222B11E
_0222B10C:
	ldr r0, [r4, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl ov07_02232508
	add sp, #8
	pop {r3, r4, r5, pc}
_0222B11E:
	ldr r0, [r4, #0x28]
	bl sub_0200DC18
	ldr r0, [r4, #0xc]
	bl sub_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0222AFAC

	thumb_func_start ov07_0222B130
ov07_0222B130: ; 0x0222B130
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	mov r1, #0xa8
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	add r0, r4, #0
	mov r1, #0
	add r0, #0xa1
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #8
	add r0, #0xa2
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0xa3
	strb r1, [r0]
	sub r1, #9
	ldr r0, [r4, #4]
	add r2, r1, #0
	bl ov07_02231E08
	add r0, r4, #0
	add r0, #0xa2
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0xa3
	ldrb r0, [r0]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0222B2A0 ; =0x04000052
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0x24]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0x20]
	ldr r0, [r4, #0x24]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0x22]
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x28]
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x30]
	ldr r0, [r4, #0x24]
	mov r1, #0x29
	bl sub_02008A78
	neg r1, r0
	add r0, r4, #0
	add r0, #0xa4
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA80
	add r7, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA90
	str r0, [sp, #0x18]
	ldr r0, [r4, #4]
	ldr r5, [r4, #0x28]
	bl ov07_0221FAE8
	add r1, r0, #0
	add r0, r5, #0
	add r1, r1, #1
	bl sub_0200DD54
	ldr r0, [r5]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA78
	str r0, [sp, #0x1c]
	ldr r0, [r4, #4]
	bl ov07_0221BFD0
	add r3, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	lsl r0, r6, #0x14
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xc4
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	add r2, r7, #0
	bl sub_02003FC8
	add r0, r5, #0
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #4]
	ldr r5, [r4, #0x30]
	bl ov07_0221FAE8
	add r1, r0, #0
	add r0, r5, #0
	add r1, r1, #1
	bl sub_0200DD54
	ldr r0, [r5]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA78
	str r0, [sp, #0x20]
	ldr r0, [r4, #4]
	bl ov07_0221BFD0
	add r3, r0, #0
	mov r0, #2
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	lsl r0, r6, #0x14
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0xc4
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x18]
	add r2, r7, #0
	bl sub_02003FC8
	add r0, r5, #0
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #4]
	ldr r1, _0222B2A4 ; =ov07_0222AFAC
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_0222B2A0: .word 0x04000052
_0222B2A4: .word ov07_0222AFAC
	thumb_func_end ov07_0222B130

	thumb_func_start ov07_0222B2A8
ov07_0222B2A8: ; 0x0222B2A8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r6, #0
	str r0, [sp]
	str r1, [sp, #4]
	add r7, r6, #0
	add r4, r1, #0
	add r5, r1, #0
_0222B2B8:
	mov r0, #0x1e
	ldrsh r0, [r4, r0]
	add r0, r0, #1
	strh r0, [r4, #0x1e]
	mov r0, #0x1e
	ldrsh r0, [r4, r0]
	cmp r0, #0x20
	blt _0222B2E0
	ldr r0, [r5, #0x30]
	bl ov07_0222A8D8
	mov r0, #0x1e
	ldrsh r0, [r4, r0]
	cmp r0, #0xa0
	blt _0222B2E0
	ldr r0, [r5, #0x30]
	mov r1, #0
	bl sub_0200DCE8
	add r6, r6, #1
_0222B2E0:
	add r7, r7, #1
	add r4, r4, #2
	add r5, r5, #4
	cmp r7, #8
	blt _0222B2B8
	cmp r6, #8
	bne _0222B314
	ldr r4, [sp, #4]
	mov r5, #0
_0222B2F2:
	ldr r0, [r4, #0x30]
	bl sub_0200D9DC
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #8
	blt _0222B2F2
	ldr r0, [sp, #4]
	ldr r1, [sp]
	ldr r0, [r0, #4]
	bl ov07_0221C448
	ldr r0, [sp, #4]
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222B314:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x10]
	bl sub_0200D020
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222B2A8

	thumb_func_start ov07_0222B320
ov07_0222B320: ; 0x0222B320
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x58
	mov r1, #0x74
	add r6, r0, #0
	add r5, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	mov r0, #0xa
	strh r0, [r4, #0x1c]
	add r0, r6, #0
	add r1, r4, #0
	bl ov07_02231FE4
	ldr r1, [r4, #4]
	add r0, sp, #0x24
	bl ov07_0221F9E8
	str r5, [r4, #0x30]
	mov r6, #1
	add r5, r4, #4
	mov r7, #0x1f
_0222B34C:
	ldr r0, [r4, #8]
	ldr r1, [r4, #0x10]
	add r2, sp, #0x24
	bl sub_0200D734
	str r0, [r5, #0x30]
	lsr r1, r6, #0x1f
	lsl r0, r6, #0x1f
	sub r0, r0, r1
	ror r0, r7
	add r0, r1, r0
	beq _0222B36C
	ldr r0, [r5, #0x30]
	mov r1, #1
	bl sub_0200E0C0
_0222B36C:
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #8
	blt _0222B34C
	ldr r0, [r4, #4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	mov r1, #0
	add r5, r0, #0
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	add r0, r5, #0
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	ldr r0, [r4, #4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	mov r1, #0
	str r0, [sp, #0x1c]
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, [sp, #0x1c]
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x50
	add r1, r7, #0
	add r2, r6, #0
	add r3, r5, #0
	bl ov07_02222268
	mov r7, #0
	ldr r0, [r4, #4]
	add r6, r7, #0
	str r7, [sp, #0x14]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0223192C
	cmp r0, #4
	bne _0222B3F0
	mov r0, #1
	str r0, [sp, #0x14]
_0222B3F0:
	add r0, r4, #0
	str r0, [sp, #0x20]
	add r0, #0x50
	add r5, r4, #0
	str r0, [sp, #0x20]
_0222B3FA:
	ldr r0, [sp, #0x20]
	bl ov07_022222B4
	str r0, [sp, #0x18]
	lsr r2, r7, #0x1f
	lsl r1, r7, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	beq _0222B432
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0222B42E
	cmp r6, #8
	bge _0222B432
	mov r1, #0x50
	mov r2, #0x52
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x30]
	bl sub_0200DDB8
	add r5, r5, #4
	add r6, r6, #1
	b _0222B432
_0222B42E:
	mov r0, #0
	str r0, [sp, #0x14]
_0222B432:
	ldr r0, [sp, #0x18]
	add r7, r7, #1
	cmp r0, #1
	beq _0222B3FA
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov07_0221FB04
	str r0, [sp, #0x10]
	ldr r0, [r4, #4]
	mov r1, #2
	bl ov07_0221FB04
	add r7, r0, #0
	mov r6, #0
	str r4, [sp, #0xc]
	add r5, r4, #0
_0222B454:
	mov r0, #8
	sub r0, r0, r6
	str r0, [sp, #8]
	lsl r1, r0, #2
	ldr r0, [sp, #0xc]
	strh r1, [r0, #0x1e]
	ldr r0, [r4, #4]
	bl ov07_0221BFC0
	cmp r0, #0
	bne _0222B4B0
	ldr r0, [r4, #4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0223192C
	cmp r0, #3
	bne _0222B492
	cmp r6, #4
	ldr r0, [r5, #0x30]
	bge _0222B48A
	add r1, r7, #0
	bl sub_0200DD54
	b _0222B4A6
_0222B48A:
	ldr r1, [sp, #0x10]
	bl sub_0200DD54
	b _0222B4A6
_0222B492:
	cmp r6, #4
	ldr r0, [r5, #0x30]
	blt _0222B4A0
	add r1, r7, #0
	bl sub_0200DD54
	b _0222B4A6
_0222B4A0:
	ldr r1, [sp, #0x10]
	bl sub_0200DD54
_0222B4A6:
	ldr r0, [r5, #0x30]
	ldr r1, [sp, #8]
	bl sub_0200DD68
	b _0222B4C0
_0222B4B0:
	ldr r0, [r5, #0x30]
	add r1, r6, #0
	bl sub_0200DD68
	ldr r0, [r5, #0x30]
	add r1, r7, #0
	bl sub_0200DD54
_0222B4C0:
	ldr r0, [sp, #0xc]
	add r6, r6, #1
	add r0, r0, #2
	add r5, r5, #4
	str r0, [sp, #0xc]
	cmp r6, #8
	blt _0222B454
	ldr r0, [r4, #4]
	ldr r1, _0222B4DC ; =ov07_0222B2A8
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x58
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222B4DC: .word ov07_0222B2A8
	thumb_func_end ov07_0222B320

	thumb_func_start ov07_0222B4E0
ov07_0222B4E0: ; 0x0222B4E0
	push {r4, r5, lr}
	sub sp, #0x1c
	add r5, r1, #0
	add r4, r0, #0
	ldrb r0, [r5]
	cmp r0, #0
	beq _0222B4F6
	cmp r0, #1
	beq _0222B584
	cmp r0, #2
	b _0222B5E2
_0222B4F6:
	ldr r0, [r5, #0x28]
	cmp r0, #0xe
	ble _0222B54C
	ldr r0, [r5, #0x30]
	ldr r1, _0222B628 ; =0x3E4CCCCD
	bl _fsub
	str r0, [r5, #0x30]
	ldr r0, [r5, #0x2c]
	ldr r1, _0222B628 ; =0x3E4CCCCD
	bl _fadd
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x30]
	bl _f2d
	ldr r2, _0222B62C ; =0x9999999A
	ldr r3, _0222B630 ; =0x3FC99999
	bl _dleq
	bhi _0222B530
	ldrb r0, [r5]
	mov r1, #0
	add r0, r0, #1
	strb r0, [r5]
	ldr r0, [r5, #0x1c]
	bl sub_0200DCE8
	b _0222B60A
_0222B530:
	mov r0, #0x36
	ldrsb r0, [r5, r0]
	bl _fflt
	add r1, r0, #0
	ldr r0, [r5, #0x2c]
	bl _fmul
	add r1, r0, #0
	ldr r0, [r5, #0x1c]
	ldr r2, [r5, #0x30]
	bl sub_0200E024
	b _0222B60A
_0222B54C:
	add r0, r5, #0
	add r0, #0x34
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0x34
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x35
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0x35
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0x34
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x35
	ldrb r0, [r0]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0222B634 ; =0x04000052
	strh r1, [r0]
	ldr r0, [r5, #0x28]
	add r0, r0, #1
	str r0, [r5, #0x28]
	b _0222B60A
_0222B584:
	ldr r0, [r5, #0x3c]
	bl ov07_02222EE8
	cmp r0, #0
	bne _0222B60A
	ldr r0, [r5, #0x38]
	bl ov07_02222EF8
	ldr r0, [r5, #0x3c]
	bl ov07_02222EF8
	ldr r0, [r5, #0x24]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	add r4, r0, #0
	ldr r0, [r5, #4]
	bl ov07_0221BFD0
	add r1, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r2, #0
	lsl r3, r4, #0x14
	str r2, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	mov r0, #0xf
	str r0, [sp, #0xc]
	str r2, [sp, #0x10]
	ldr r0, _0222B638 ; =0x0000FFFF
	mov r2, #2
	str r0, [sp, #0x14]
	ldr r0, _0222B63C ; =0x0000044C
	lsr r3, r3, #0x10
	str r0, [sp, #0x18]
	ldr r0, [r5, #0x18]
	bl ov07_02222F10
	str r0, [r5, #0x3c]
	ldrb r0, [r5]
	add r0, r0, #1
	strb r0, [r5]
	b _0222B60A
_0222B5E2:
	ldr r0, [r5, #0x3c]
	bl ov07_02222EE8
	cmp r0, #0
	bne _0222B60A
	ldr r0, [r5, #0x20]
	bl sub_0200DC18
	ldr r0, [r5, #0x3c]
	bl ov07_02222EF8
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl ov07_0221C448
	add r0, r5, #0
	bl FreeToHeap
	add sp, #0x1c
	pop {r4, r5, pc}
_0222B60A:
	ldr r0, [r5, #0x1c]
	bl sub_0200DC18
	ldr r0, [r5, #0x20]
	bl sub_0200DC18
	ldr r0, [r5, #0x24]
	bl sub_0200DC18
	ldr r0, [r5, #0xc]
	bl sub_0200D020
	add sp, #0x1c
	pop {r4, r5, pc}
	nop
_0222B628: .word 0x3E4CCCCD
_0222B62C: .word 0x9999999A
_0222B630: .word 0x3FC99999
_0222B634: .word 0x04000052
_0222B638: .word 0x0000FFFF
_0222B63C: .word 0x0000044C
	thumb_func_end ov07_0222B4E0

	thumb_func_start ov07_0222B640
ov07_0222B640: ; 0x0222B640
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	mov r1, #0x40
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	ldr r0, [r4, #4]
	mov r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	mov r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x20]
	ldr r0, [r4, #4]
	mov r1, #2
	bl ov07_0221C4E8
	str r0, [r4, #0x24]
	mov r6, #0
	str r6, [r4, #0x28]
	add r0, r5, #0
	sub r6, #0x20
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_02222004
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	mul r0, r6
	add r6, r0, #0
	mov r0, #0xfe
	lsl r0, r0, #0x16
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221FB78
	cmp r0, #1
	bne _0222B6AA
	mov r1, #0
	mvn r1, r1
	b _0222B6AC
_0222B6AA:
	mov r1, #1
_0222B6AC:
	add r0, r4, #0
	add r0, #0x36
	strb r1, [r0]
	add r1, sp, #0x24
	ldr r0, [r4, #0x20]
	add r1, #2
	add r2, sp, #0x24
	bl sub_0200DE44
	add r2, sp, #0x24
	mov r1, #2
	ldrsh r1, [r2, r1]
	mov r3, #0
	ldrsh r2, [r2, r3]
	add r1, r1, r6
	lsl r1, r1, #0x10
	ldr r0, [r4, #0x1c]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	ldr r0, [r4, #0x1c]
	mov r1, #2
	bl sub_0200DF98
	mov r0, #0x36
	ldrsb r0, [r4, r0]
	bl _fflt
	add r1, r0, #0
	ldr r0, [r4, #0x2c]
	bl _fmul
	add r1, r0, #0
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x30]
	bl sub_0200E024
	ldr r0, [r4, #0x1c]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	add r6, r0, #0
	add r0, r5, #0
	bl ov07_0221BFD0
	add r1, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r2, #0
	lsl r3, r6, #0x14
	str r2, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	ldr r0, _0222B888 ; =0x0000FFFF
	mov r2, #2
	str r0, [sp, #0x14]
	ldr r0, _0222B88C ; =0x0000044C
	lsr r3, r3, #0x10
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x18]
	bl ov07_02222F10
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x24]
	ldr r0, [r0]
	bl sub_02024B34
	mov r1, #1
	bl sub_02022808
	add r6, r0, #0
	add r0, r5, #0
	bl ov07_0221BFD0
	add r1, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r2, #0
	lsl r3, r6, #0x14
	str r2, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	mov r0, #0xf
	str r0, [sp, #0x10]
	ldr r0, _0222B888 ; =0x0000FFFF
	mov r2, #2
	str r0, [sp, #0x14]
	ldr r0, _0222B88C ; =0x0000044C
	lsr r3, r3, #0x10
	str r0, [sp, #0x18]
	ldr r0, [r4, #0x18]
	bl ov07_02222F10
	str r0, [r4, #0x3c]
	ldr r0, [r4, #4]
	bl ov07_0221C468
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl ov07_02231924
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	ldr r0, [r4, #4]
	bl ov07_0221BFC0
	add r1, r0, #0
	add r0, r5, #0
	add r2, sp, #0x2c
	bl ov07_02231A20
	add r2, sp, #0x28
	ldr r0, [r4, #0x1c]
	add r1, sp, #0x28
	add r2, #2
	bl sub_0200DE44
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _0222B7C8
	ldr r0, [r4, #0x1c]
	mov r1, #1
	mov r5, #0
	bl sub_0200DD54
	ldr r0, [r4, #0x1c]
	add r1, r5, #0
	bl sub_0200DD68
	b _0222B7DA
_0222B7C8:
	ldr r0, [r4, #0x1c]
	mov r1, #2
	bl sub_0200DD54
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_0200DD68
	mov r5, #2
_0222B7DA:
	ldr r0, [r4, #4]
	bl ov07_0221C470
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl ov07_0221FA1C
	add r7, r0, #0
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl ov07_0221FA10
	str r0, [sp, #0x1c]
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl ov07_0221FA2C
	str r0, [sp, #0x20]
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl ov07_0221FA38
	ldr r1, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	str r0, [sp]
	lsl r0, r7, #0x10
	lsl r1, r1, #0x18
	lsl r2, r5, #0x18
	lsl r3, r3, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_020708D8
	add r2, r0, #0
	add r5, sp, #0x24
	mov r3, #0xa
	ldrsh r3, [r5, r3]
	mov r1, #4
	ldrsh r1, [r5, r1]
	add r2, r3, r2
	lsl r2, r2, #0x10
	ldr r0, [r4, #0x1c]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r0, [r4, #0x1c]
	mov r1, #1
	bl sub_0200DCE8
	add r0, r4, #0
	mov r1, #0
	add r0, #0x34
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0xf
	add r0, #0x35
	strb r1, [r0]
	sub r1, #0x10
	ldr r0, [r4, #4]
	add r2, r1, #0
	bl ov07_02231E08
	add r0, r4, #0
	add r0, #0x34
	ldrb r1, [r0]
	add r0, r4, #0
	add r0, #0x35
	ldrb r0, [r0]
	add r2, r4, #0
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0222B890 ; =0x04000052
	strh r1, [r0]
	ldr r0, [r4, #4]
	ldr r1, _0222B894 ; =ov07_0222B4E0
	bl ov07_0221C410
	add r1, r4, #0
	bl ov07_0222B4E0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222B888: .word 0x0000FFFF
_0222B88C: .word 0x0000044C
_0222B890: .word 0x04000052
_0222B894: .word ov07_0222B4E0
	thumb_func_end ov07_0222B640

	thumb_func_start ov07_0222B898
ov07_0222B898: ; 0x0222B898
	push {r3, r4, r5, lr}
	sub sp, #0x58
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	beq _0222B8AC
	cmp r0, #1
	beq _0222B8F2
	b _0222B96C
_0222B8AC:
	ldr r0, [r4, #0x68]
	mov r1, #0x20
	lsl r0, r0, #2
	add r2, r4, r0
	ldr r0, [r2, #0x78]
	lsl r0, r0, #0x10
	asr r3, r0, #0x10
	str r3, [sp]
	mov r0, #0xf
	str r0, [sp, #4]
	ldr r2, [r2, #0x6c]
	add r0, r4, #0
	lsl r2, r2, #0x10
	ldrsh r1, [r4, r1]
	add r0, #0x30
	asr r2, r2, #0x10
	bl ov07_02222268
	ldr r2, [r4, #0x68]
	ldr r0, [r4, #0x24]
	lsl r2, r2, #2
	add r2, r4, r2
	add r2, #0x84
	ldr r2, [r2]
	mov r1, #2
	bl sub_020087A4
	ldr r0, [r4, #0x24]
	mov r1, #0x2c
	mov r2, #1
	bl sub_020087A4
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
_0222B8F2:
	add r0, r4, #0
	add r0, #0x30
	bl ov07_022222B4
	cmp r0, #0
	bne _0222B950
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	cmp r0, #2
	ble _0222B910
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0222B946
_0222B910:
	ldr r0, [r4, #0x58]
	cmp r0, #0
	bne _0222B942
	ldr r0, [r4, #4]
	add r1, sp, #8
	mov r2, #3
	bl ov07_0221C7B8
	ldr r0, [r4, #0x68]
	cmp r0, #2
	ldr r0, [r4, #4]
	bne _0222B936
	bl ov07_0221BFD0
	add r1, r0, #0
	add r0, sp, #8
	bl ov07_0223494C
	b _0222B942
_0222B936:
	bl ov07_0221BFD0
	add r1, r0, #0
	add r0, sp, #8
	bl ov07_0223475C
_0222B942:
	mov r0, #0
	strb r0, [r4]
_0222B946:
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0x20]
_0222B950:
	mov r2, #0x30
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x32
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x24]
	mov r1, #1
	bl sub_020087A4
	add sp, #0x58
	pop {r3, r4, r5, pc}
_0222B96C:
	ldr r0, [r4, #0x24]
	mov r1, #0x2c
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x58
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222B898

	thumb_func_start ov07_0222B988
ov07_0222B988: ; 0x0222B988
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	mov r1, #0x90
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02231FE4
	ldr r0, [r4, #4]
	bl ov07_0221C468
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221C468
	add r1, r0, #0
	add r2, r4, #0
	ldr r0, [r4, #4]
	add r2, #0x5c
	bl ov07_02231A50
	ldr r0, [r4, #4]
	bl ov07_0221C470
	add r1, r0, #0
	add r2, r4, #0
	ldr r0, [r4, #4]
	add r2, #0x60
	bl ov07_02231A50
	ldr r0, [r4, #4]
	add r1, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _0222B9DA
	mov r1, #1
	b _0222B9DE
_0222B9DA:
	mov r1, #0
	mvn r1, r1
_0222B9DE:
	add r0, r4, #0
	add r0, #0x54
	strh r1, [r0]
	ldr r0, [r4, #4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0223192C
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0223192C
	cmp r6, r0
	bne _0222BA0A
	mov r0, #1
	b _0222BA0C
_0222BA0A:
	mov r0, #0
_0222BA0C:
	str r0, [r4, #0x58]
	mov r1, #0
	add r0, r5, #0
	str r1, [r4, #0x68]
	bl ov07_0221C4A8
	add r2, r4, #0
	add r1, r0, #0
	add r0, r5, #0
	add r2, #0x1c
	add r3, sp, #0
	bl ov07_02232020
	ldr r0, [r4, #0x24]
	mov r1, #1
	bl sub_02008A78
	mov r1, #0x5e
	ldrsh r2, [r4, r1]
	mov r3, #0x54
	sub r0, r0, r2
	ldrsh r2, [r4, r3]
	cmp r2, #0
	ble _0222BA7E
	add r2, r3, #0
	add r2, #0xfb
	str r2, [r4, #0x6c]
	sub r3, #0xa4
	str r3, [r4, #0x70]
	mov r2, #0x5c
	ldrsh r2, [r4, r2]
	str r2, [r4, #0x74]
	ldrsh r2, [r4, r1]
	add r2, r2, r0
	str r2, [r4, #0x78]
	mov r2, #0x62
	ldrsh r2, [r4, r2]
	add r2, r2, r0
	str r2, [r4, #0x7c]
	ldrsh r1, [r4, r1]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0x80
	str r1, [r0]
	add r0, r4, #0
	mov r1, #0xa
	add r0, #0x84
	str r1, [r0]
	add r0, r4, #0
	ldr r1, _0222BAD4 ; =0xFFFFFD76
	add r0, #0x88
	str r1, [r0]
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl sub_02008A78
	b _0222BABE
_0222BA7E:
	add r2, r3, #0
	sub r2, #0xa4
	str r2, [r4, #0x6c]
	add r3, #0xfb
	str r3, [r4, #0x70]
	mov r2, #0x5c
	ldrsh r2, [r4, r2]
	str r2, [r4, #0x74]
	ldrsh r2, [r4, r1]
	add r2, r2, r0
	str r2, [r4, #0x78]
	mov r2, #0x62
	ldrsh r2, [r4, r2]
	add r2, r2, r0
	str r2, [r4, #0x7c]
	ldrsh r1, [r4, r1]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0x80
	str r1, [r0]
	add r0, r4, #0
	ldr r1, _0222BAD4 ; =0xFFFFFD76
	add r0, #0x84
	str r1, [r0]
	add r0, r4, #0
	mov r1, #0xa
	add r0, #0x88
	str r1, [r0]
	ldr r0, [r4, #0x24]
	mov r1, #2
	bl sub_02008A78
_0222BABE:
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	ldr r0, [r4, #4]
	ldr r1, _0222BAD8 ; =ov07_0222B898
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0222BAD4: .word 0xFFFFFD76
_0222BAD8: .word ov07_0222B898
	thumb_func_end ov07_0222B988

	thumb_func_start ov07_0222BADC
ov07_0222BADC: ; 0x0222BADC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r2, #0
	ldr r2, [sp, #0x10]
	str r2, [sp]
	mov r2, #0x50
	sub r2, r2, r3
	add r3, r4, #0
	bl sub_0200908C
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_0222BADC

	thumb_func_start ov07_0222BAF4
ov07_0222BAF4: ; 0x0222BAF4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	add r2, r0, #0
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #3
	bls _0222BB08
	b _0222BC2A
_0222BB08:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222BB14: ; jump table
	.short _0222BB1C - _0222BB14 - 2 ; case 0
	.short _0222BB78 - _0222BB14 - 2 ; case 1
	.short _0222BBBA - _0222BB14 - 2 ; case 2
	.short _0222BC10 - _0222BB14 - 2 ; case 3
_0222BB1C:
	ldr r2, [r4, #0x10]
	add r2, #0x4f
	str r2, [r4, #0x10]
	cmp r2, #0x50
	blt _0222BB44
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	add sp, #4
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x20
	strb r1, [r0]
	ldr r1, [r4, #0x14]
	mov r0, #1
	eor r0, r1
	str r0, [r4, #0x14]
	mov r0, #0
	str r0, [r4, #0x10]
	pop {r3, r4, r5, r6, pc}
_0222BB44:
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _0222BB60
	mov r0, #2
	str r0, [sp]
	ldr r3, [r4]
	ldr r0, [r4, #0x1c]
	add r3, r3, #2
	mov r1, #0
	lsl r3, r3, #1
	bl ov07_0222BADC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0222BB60:
	mov r0, #2
	str r0, [sp]
	ldr r3, [r4]
	mov r1, #0x50
	add r3, r3, #2
	ldr r0, [r4, #0x1c]
	sub r1, r1, r2
	lsl r3, r3, #1
	bl ov07_0222BADC
	add sp, #4
	pop {r3, r4, r5, r6, pc}
_0222BB78:
	ldr r0, [r4, #4]
	mov r3, #0xff
	sub r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #0xc]
	lsl r3, r3, #8
	add r2, r0, #1
	str r2, [r4, #0xc]
	ldr r6, [r4, #8]
	ldr r1, [r4, #4]
	lsl r0, r6, #8
	add r5, r0, #0
	add r6, #0x50
	lsl r0, r6, #0x18
	and r5, r3
	lsr r0, r0, #0x18
	lsl r1, r1, #8
	orr r5, r0
	ldr r0, _0222BC74 ; =0x04000040
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	strh r5, [r0]
	orr r1, r3
	strh r1, [r0, #4]
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	add r4, #0x20
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0222BBBA:
	ldr r0, [r4, #4]
	mov r3, #0xff
	sub r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #0xc]
	lsl r3, r3, #8
	add r2, r0, #1
	str r2, [r4, #0xc]
	ldr r6, [r4, #8]
	ldr r1, [r4, #4]
	lsl r0, r6, #8
	add r5, r0, #0
	add r6, #0x50
	lsl r0, r6, #0x18
	and r5, r3
	lsr r0, r0, #0x18
	lsl r1, r1, #8
	orr r5, r0
	ldr r0, _0222BC74 ; =0x04000040
	and r3, r1
	lsl r1, r2, #0x18
	lsr r1, r1, #0x18
	strh r5, [r0]
	orr r1, r3
	strh r1, [r0, #4]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	cmp r0, #0x26
	ble _0222BC06
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	add r4, #0x20
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0222BC06:
	mov r0, #0
	add r4, #0x20
	add sp, #4
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0222BC10:
	ldr r0, [r4, #0x1c]
	mov r1, #0xe
	mov r2, #0
	bl sub_020087A4
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	add r4, #0x20
	add sp, #4
	add r0, r0, #1
	strb r0, [r4]
	pop {r3, r4, r5, r6, pc}
_0222BC2A:
	mov r0, #1
	lsl r0, r0, #0x1a
	ldr r3, [r0]
	ldr r1, _0222BC78 ; =0xFFFF1FFF
	and r1, r3
	add r3, r0, #0
	str r1, [r0]
	add r3, #0x48
	ldrh r5, [r3]
	mov r1, #0x3f
	bic r5, r1
	strh r5, [r3]
	add r3, r0, #0
	add r3, #0x4a
	ldrh r5, [r3]
	bic r5, r1
	add r1, r0, #0
	strh r5, [r3]
	mov r3, #0
	add r1, #0x40
	strh r3, [r1]
	add r0, #0x44
	strh r3, [r0]
	ldr r0, [r4, #0x24]
	add r1, r2, #0
	bl ov07_0221C448
	ldr r0, [r4, #0x1c]
	ldr r2, [r4, #0x18]
	mov r1, #0x17
	bl sub_020087A4
	add r0, r4, #0
	bl FreeToHeap
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222BC74: .word 0x04000040
_0222BC78: .word 0xFFFF1FFF
	thumb_func_end ov07_0222BAF4

	thumb_func_start ov07_0222BC7C
ov07_0222BC7C: ; 0x0222BC7C
	push {r4, r5, r6, lr}
	mov r1, #0x50
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r1, r4, #0
	add r0, r5, #0
	add r1, #0x20
	bl ov07_02231FE4
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0221FA48
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [r4]
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_02231924
	cmp r0, #3
	beq _0222BCBC
	cmp r0, #4
	bne _0222BCD0
_0222BCBC:
	add r0, r5, #0
	bl ov07_0221FAE8
	add r1, r0, #0
	sub r1, r1, #1
	lsl r1, r1, #0x18
	mov r0, #2
	lsr r1, r1, #0x18
	bl SetBgPriority
_0222BCD0:
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, [r4, #0x1c]
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	ldr r0, [r4, #0x1c]
	mov r1, #0x29
	bl sub_02008A78
	sub r0, r5, r0
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	ldr r0, [r4, #0x1c]
	mov r1, #0x17
	bl sub_02008A78
	str r0, [r4, #0x18]
	ldr r0, [r4, #0x1c]
	mov r1, #0x17
	mov r2, #8
	bl sub_020087A4
	sub r6, #0x28
	str r6, [r4, #8]
	add r5, #0x28
	mov r6, #1
	lsl r6, r6, #0x1a
	add r3, r6, #0
	str r5, [r4, #4]
	mov r1, #0
	str r1, [r4, #0x10]
	ldr r0, [r4, #4]
	add r3, #0x48
	str r0, [r4, #0xc]
	str r1, [r4, #0x14]
	ldr r1, [r6]
	ldr r0, _0222BD88 ; =0xFFFF1FFF
	and r1, r0
	lsr r0, r6, #0xd
	orr r0, r1
	str r0, [r6]
	ldrh r2, [r3]
	mov r1, #0x3f
	mov r0, #0x1f
	bic r2, r1
	orr r0, r2
	mov r2, #0x20
	orr r0, r2
	strh r0, [r3]
	add r3, r6, #0
	add r3, #0x4a
	ldrh r5, [r3]
	mov r0, #0x1b
	bic r5, r1
	orr r0, r5
	orr r0, r2
	strh r0, [r3]
	ldr r2, [r4, #8]
	mov r0, #0xff
	lsl r1, r2, #8
	add r2, #0x50
	lsl r0, r0, #8
	lsl r2, r2, #0x18
	and r1, r0
	lsr r2, r2, #0x18
	orr r2, r1
	add r1, r6, #0
	ldr r5, [r4, #0xc]
	ldr r3, [r4, #4]
	add r1, #0x40
	strh r2, [r1]
	lsl r1, r3, #8
	and r1, r0
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	orr r0, r1
	add r6, #0x44
	strh r0, [r6]
	ldr r0, [r4, #0x24]
	ldr r1, _0222BD8C ; =ov07_0222BAF4
	add r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	nop
_0222BD88: .word 0xFFFF1FFF
_0222BD8C: .word ov07_0222BAF4
	thumb_func_end ov07_0222BC7C

	thumb_func_start ov07_0222BD90
ov07_0222BD90: ; 0x0222BD90
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	mov r1, #0xe8
	mov r2, #0xea
	add r5, r0, #0
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #8]
	add r0, #0xc
	bl ov07_02222240
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x38
	bl ov07_02222914
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	bl sub_0200D020
	mov r1, #0
	add r2, sp, #0
_0222BDC4:
	ldr r0, [r2]
	cmp r0, #1
	beq _0222BDFA
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #3
	blt _0222BDC4
	mov r2, #0xe8
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0xea
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	mov r1, #1
	sub r2, #8
	bl sub_020087A4
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_0222BDFA:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0222BD90

	thumb_func_start ov07_0222BE00
ov07_0222BE00: ; 0x0222BE00
	push {r4, r5, r6, r7, lr}
	sub sp, #0x44
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0xf0
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	add r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	mov r1, #0
	str r0, [r4, #8]
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0xe8
	strh r0, [r1]
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0xea
	strh r0, [r1]
	ldr r0, [r4, #8]
	mov r1, #0x29
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0xec
	strh r0, [r1]
	mov r0, #0xea
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xea
	add r1, #8
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xc
	mov r1, #1
	mov r2, #8
	bl ov07_02222A44
	add r0, sp, #0x20
	mov r1, #1
	mov r2, #0xa
	bl ov07_02222A44
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	ldr r1, [r4, #0x18]
	mov r6, #0
	add r2, r1, #0
	mul r2, r0
	str r2, [r4, #0x18]
	ldr r1, [sp, #0x2c]
	add r5, r4, #0
	mul r0, r1
	str r0, [sp, #0x2c]
	mov r7, #0x64
_0222BE98:
	ldr r0, [r4]
	add r1, r6, #0
	bl ov07_0221C4E8
	str r0, [r5, #0x30]
	add r1, r7, #0
	bl sub_0200DD68
	ldr r0, [r5, #0x30]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [r5, #0x30]
	mov r1, #1
	bl sub_0200E0FC
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #2
	blt _0222BE98
	mov r0, #0xea
	ldrsh r1, [r4, r0]
	mov r0, #0xec
	ldrsh r0, [r4, r0]
	mov r3, #0xe8
	ldr r2, _0222BF10 ; =ov07_02222180
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r1, #0
	str r1, [sp, #0xc]
	ldr r0, [r4, #0x30]
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x34]
	str r0, [sp, #0x14]
	str r1, [sp, #0x18]
	str r1, [sp, #0x1c]
	add r0, r4, #0
	ldrsh r3, [r4, r3]
	add r0, #0x38
	add r1, sp, #0x20
	bl ov07_02222864
	mov r1, #0
	mvn r1, r1
	ldr r0, [r4]
	add r2, r1, #0
	bl ov07_02231E08
	ldr r0, [r4]
	ldr r1, _0222BF14 ; =ov07_0222BD90
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x44
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222BF10: .word ov07_02222180
_0222BF14: .word ov07_0222BD90
	thumb_func_end ov07_0222BE00

	thumb_func_start ov07_0222BF18
ov07_0222BF18: ; 0x0222BF18
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #6
	bls _0222BF28
	b _0222C06E
_0222BF28:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222BF34: ; jump table
	.short _0222BF42 - _0222BF34 - 2 ; case 0
	.short _0222BF84 - _0222BF34 - 2 ; case 1
	.short _0222BFBA - _0222BF34 - 2 ; case 2
	.short _0222BFD2 - _0222BF34 - 2 ; case 3
	.short _0222C002 - _0222BF34 - 2 ; case 4
	.short _0222C01A - _0222BF34 - 2 ; case 5
	.short _0222C03E - _0222BF34 - 2 ; case 6
_0222BF42:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_022222B4
	cmp r0, #0
	beq _0222BF64
	mov r2, #0x48
	mov r3, #0x4a
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0xc]
	add r0, #0x10
	bl ov07_022220B8
	add sp, #8
	pop {r3, r4, r5, pc}
_0222BF64:
	mov r2, #0
	str r2, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x10
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	add r0, #0x10
	add r3, r2, #0
	bl ov07_02222268
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0222BF84:
	add r0, r4, #0
	add r0, #0x34
	bl ov07_02222440
	cmp r0, #0
	beq _0222BF9E
	ldr r0, [r4, #0xc]
	ldr r2, [r4, #0x34]
	mov r1, #9
	bl sub_020087A4
	add sp, #8
	pop {r3, r4, r5, pc}
_0222BF9E:
	add r0, r4, #0
	ldr r1, [r4, #0x34]
	add r0, #0x34
	mov r2, #0
	mov r3, #4
	bl ov07_022223F0
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #2
	strh r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0222BFBA:
	mov r0, #8
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #8]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _0222C06E
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0222BFD2:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_022222B4
	cmp r0, #0
	beq _0222BFF4
	mov r2, #0x48
	mov r3, #0x4a
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0xc]
	add r0, #0x10
	bl ov07_022220B8
	add sp, #8
	pop {r3, r4, r5, pc}
_0222BFF4:
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0x20
	strh r0, [r4, #8]
	pop {r3, r4, r5, pc}
_0222C002:
	mov r0, #8
	ldrsh r1, [r4, r0]
	sub r1, r1, #1
	strh r1, [r4, #8]
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _0222C06E
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0222C01A:
	add r0, r4, #0
	add r0, #0x34
	bl ov07_02222440
	cmp r0, #0
	beq _0222C034
	ldr r0, [r4, #0xc]
	ldr r2, [r4, #0x34]
	mov r1, #9
	bl sub_020087A4
	add sp, #8
	pop {r3, r4, r5, pc}
_0222C034:
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_0222C03E:
	mov r2, #0x48
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x4a
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_020087A4
	ldr r0, [r4, #0xc]
	mov r1, #9
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_0222C06E:
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0222BF18

	thumb_func_start ov07_0222C074
ov07_0222C074: ; 0x0222C074
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0xf0
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	mov r0, #0
	str r0, [r4, #4]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	mov r1, #0
	str r0, [r4, #0xc]
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0x48
	strh r0, [r1]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0x4a
	strh r0, [r1]
	mov r1, #0
	add r0, r4, #0
	str r1, [sp]
	mov r2, #3
	str r2, [sp, #4]
	add r0, #0x10
	sub r2, #0x23
	add r3, r1, #0
	bl ov07_02222268
	add r0, r4, #0
	ldr r2, _0222C184 ; =0x00000E38
	add r0, #0x34
	mov r1, #0
	mov r3, #8
	bl ov07_022223F0
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	ldr r1, [r4, #0x18]
	add r2, r1, #0
	mul r2, r0
	str r2, [r4, #0x18]
	ldr r1, [r4, #0x3c]
	mul r0, r1
	str r0, [r4, #0x3c]
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	add r7, r0, #0
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223192C
	add r6, r0, #0
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223192C
	cmp r6, #3
	bne _0222C142
	cmp r0, #3
	bne _0222C142
	mov r1, #0xa
	add r2, r1, #0
	ldr r0, [r4, #0xc]
	sub r2, #0x32
	bl sub_020087A4
	ldr r0, [r4, #0xc]
	mov r1, #0xb
	mov r2, #0x28
	bl sub_020087A4
	b _0222C176
_0222C142:
	cmp r6, #4
	bne _0222C160
	cmp r0, #4
	bne _0222C160
	ldr r0, [r4, #0xc]
	mov r1, #0xa
	mov r2, #0x28
	bl sub_020087A4
	ldr r0, [r4, #0xc]
	mov r1, #0xb
	mov r2, #0x28
	bl sub_020087A4
	b _0222C176
_0222C160:
	mov r2, #0x28
	ldr r0, [r4, #0xc]
	mov r1, #0xa
	mul r2, r7
	bl sub_020087A4
	ldr r0, [r4, #0xc]
	mov r1, #0xb
	mov r2, #0x28
	bl sub_020087A4
_0222C176:
	ldr r0, [r4]
	ldr r1, _0222C188 ; =ov07_0222BF18
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C184: .word 0x00000E38
_0222C188: .word ov07_0222BF18
	thumb_func_end ov07_0222C074

	thumb_func_start ov07_0222C18C
ov07_0222C18C: ; 0x0222C18C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r2, r3, #0
	ldr r4, [sp, #0x10]
	bl sub_0200D734
	str r0, [r5]
	add r6, r4, #4
	add r3, r5, #4
	mov r2, #4
_0222C1A4:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _0222C1A4
	ldr r0, [r6]
	add r2, r5, #0
	str r0, [r3]
	add r3, r4, #0
	add r3, #0x28
	ldmia r3!, {r0, r1}
	add r2, #0x28
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #0x3c
	ldrsh r0, [r4, r0]
	strh r0, [r5, #0x3c]
	mov r0, #0x3e
	ldrsh r0, [r4, r0]
	strh r0, [r5, #0x3e]
	mov r0, #0x40
	ldrsh r1, [r4, r0]
	add r0, r5, #0
	add r0, #0x40
	strh r1, [r0]
	ldr r0, [r4, #0x44]
	mov r1, #0
	str r0, [r5, #0x44]
	str r1, [r5, #0x48]
	ldr r0, [r5]
	bl sub_0200DCE8
	ldr r0, [r5]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DD54
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_0222C18C

	thumb_func_start ov07_0222C1FC
ov07_0222C1FC: ; 0x0222C1FC
	ldr r3, _0222C204 ; =sub_0200D9DC
	ldr r0, [r0]
	bx r3
	nop
_0222C204: .word sub_0200D9DC
	thumb_func_end ov07_0222C1FC

	thumb_func_start ov07_0222C208
ov07_0222C208: ; 0x0222C208
	ldr r3, _0222C210 ; =sub_0200DCE8
	ldr r0, [r0]
	bx r3
	nop
_0222C210: .word sub_0200DCE8
	thumb_func_end ov07_0222C208

	thumb_func_start ov07_0222C214
ov07_0222C214: ; 0x0222C214
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #0
	bne _0222C226
	add sp, #0x10
	mov r0, #1
	pop {r4, pc}
_0222C226:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	beq _0222C236
	cmp r0, #1
	beq _0222C236
	cmp r0, #2
	beq _0222C2B8
	b _0222C2BE
_0222C236:
	add r0, r4, #4
	bl ov07_02222180
	cmp r0, #0
	beq _0222C276
	add r0, r4, #0
	add r0, #0x28
	bl ov07_022224AC
	mov r0, #0x3c
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0x28]
	add r0, r1, r0
	str r0, [r4, #0x1c]
	mov r1, #0x3e
	ldrsh r2, [r4, r1]
	mov r1, #4
	ldrsh r1, [r4, r1]
	ldr r0, [r4]
	add r1, r2, r1
	mov r2, #0x40
	ldrsh r3, [r4, r2]
	mov r2, #6
	ldrsh r2, [r4, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	b _0222C2BE
_0222C276:
	ldr r0, [r4, #0x44]
	cmp r0, #1
	bge _0222C2B0
	cmp r0, #0
	bne _0222C29E
	ldr r1, [r4, #0xc]
	ldr r2, _0222C2C4 ; =0x00007FFF
	lsl r1, r1, #0x10
	str r2, [sp]
	ldr r0, [r4, #0x10]
	lsr r1, r1, #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	add r3, r1, #0
	str r0, [sp, #8]
	ldr r0, _0222C2C8 ; =0x0000071C
	str r0, [sp, #0xc]
	add r0, r4, #4
	bl ov07_0222212C
_0222C29E:
	ldr r0, [r4, #8]
	ldr r2, _0222C2CC ; =0x0000FFFF
	str r0, [sp]
	add r0, r4, #0
	ldr r3, _0222C2D0 ; =0xFFFFF000
	add r0, #0x28
	mov r1, #0
	bl ov07_02222494
_0222C2B0:
	ldr r0, [r4, #0x44]
	add r0, r0, #1
	str r0, [r4, #0x44]
	b _0222C2BE
_0222C2B8:
	add sp, #0x10
	mov r0, #0
	pop {r4, pc}
_0222C2BE:
	mov r0, #1
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_0222C2C4: .word 0x00007FFF
_0222C2C8: .word 0x0000071C
_0222C2CC: .word 0x0000FFFF
_0222C2D0: .word 0xFFFFF000
	thumb_func_end ov07_0222C214

	thumb_func_start ov07_0222C2D4
ov07_0222C2D4: ; 0x0222C2D4
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r0, #0
	add r0, r4, #0
	add r0, #0xf0
	ldr r0, [r0]
	cmp r0, #6
	bhi _0222C348
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222C2F0: ; jump table
	.short _0222C2FE - _0222C2F0 - 2 ; case 0
	.short _0222C316 - _0222C2F0 - 2 ; case 1
	.short _0222C362 - _0222C2F0 - 2 ; case 2
	.short _0222C378 - _0222C2F0 - 2 ; case 3
	.short _0222C418 - _0222C2F0 - 2 ; case 4
	.short _0222C442 - _0222C2F0 - 2 ; case 5
	.short _0222C482 - _0222C2F0 - 2 ; case 6
_0222C2FE:
	add r0, r4, #0
	add r0, #0xc
	bl ov07_0222C214
	add r0, r4, #0
	add r0, #0xf0
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xf0
	str r1, [r0]
	b _0222C4AC
_0222C316:
	add r0, r4, #0
	add r0, #0xfc
	ldr r1, [r0]
	add r0, r4, #0
	add r1, #0xa
	add r0, #0xfc
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0xa
	bl _s32_div_f
	mov r1, #0x1f
	sub r1, r1, r0
	lsl r1, r1, #8
	orr r1, r0
	ldr r0, _0222C4B4 ; =0x04000052
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xfc
	ldr r1, [r0]
	ldr r0, _0222C4B8 ; =0x00000136
	cmp r1, r0
	bge _0222C34A
_0222C348:
	b _0222C4AC
_0222C34A:
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_0200E0FC
	add r0, r4, #0
	add r0, #0xf0
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xf0
	str r1, [r0]
	b _0222C4AC
_0222C362:
	ldr r1, _0222C4BC ; =0x0000FFFF
	ldr r0, _0222C4B4 ; =0x04000052
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xf0
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xf0
	str r1, [r0]
	b _0222C4AC
_0222C378:
	add r0, r4, #0
	add r0, #0xf4
	ldr r0, [r0]
	cmp r0, #0
	bgt _0222C3BC
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	mov r2, #0x4c
	add r3, r0, #0
	mul r3, r2
	add r0, r4, r3
	mov r1, #1
	add r0, #0xa0
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	mul r2, r0
	add r0, r4, r2
	ldr r0, [r0, #0x58]
	bl sub_0200DCE8
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xf8
	str r1, [r0]
	add r0, r4, #0
	mov r1, #8
	add r0, #0xf4
	str r1, [r0]
_0222C3BC:
	add r0, r4, #0
	add r0, #0xf8
	ldr r0, [r0]
	cmp r0, #2
	bge _0222C3D4
	add r0, r4, #0
	add r0, #0xf4
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0xf4
	str r1, [r0]
_0222C3D4:
	add r0, r4, #0
	add r0, #0xc
	bl ov07_0222C214
	add r5, r4, #0
	add r6, r0, #0
	mov r7, #0
	add r5, #0x58
_0222C3E4:
	add r0, r5, #0
	bl ov07_0222C214
	str r0, [sp]
	cmp r0, #0
	bne _0222C3F8
	add r0, r5, #0
	mov r1, #0
	bl ov07_0222C208
_0222C3F8:
	ldr r0, [sp]
	add r7, r7, #1
	orr r6, r0
	add r5, #0x4c
	cmp r7, #2
	blt _0222C3E4
	cmp r6, #0
	bne _0222C4AC
	add r0, r4, #0
	add r0, #0xf0
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xf0
	str r1, [r0]
	b _0222C4AC
_0222C418:
	ldr r0, [r4, #0xc]
	bl sub_0200DC18
	ldr r0, [r4, #0xc]
	ldr r0, [r0]
	bl sub_02024B68
	cmp r0, #0
	bne _0222C4AC
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_0200E0FC
	add r0, r4, #0
	add r0, #0xf0
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xf0
	str r1, [r0]
	b _0222C4AC
_0222C442:
	add r0, r4, #0
	add r0, #0xfc
	ldr r1, [r0]
	add r0, r4, #0
	sub r1, #0xa
	add r0, #0xfc
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	mov r1, #0xa
	bl _s32_div_f
	mov r1, #0x1f
	sub r1, r1, r0
	lsl r1, r1, #8
	orr r1, r0
	ldr r0, _0222C4B4 ; =0x04000052
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xfc
	ldr r0, [r0]
	cmp r0, #0
	bgt _0222C4AC
	add r0, r4, #0
	add r0, #0xf0
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xf0
	str r1, [r0]
	b _0222C4AC
_0222C482:
	add r5, r4, #0
	mov r6, #0
	add r5, #0x58
_0222C488:
	add r0, r5, #0
	bl ov07_0222C1FC
	add r6, r6, #1
	add r5, #0x4c
	cmp r6, #2
	blt _0222C488
	ldr r0, [r4, #0xc]
	bl sub_0200D9DC
	ldr r0, [r4]
	add r1, r7, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_0222C4AC:
	ldr r0, [r4, #8]
	bl sub_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C4B4: .word 0x04000052
_0222C4B8: .word 0x00000136
_0222C4BC: .word 0x0000FFFF
	thumb_func_end ov07_0222C2D4

	thumb_func_start ov07_0222C4C0
ov07_0222C4C0: ; 0x0222C4C0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp, #0x10]
	bl ov07_0221BFD0
	mov r1, #1
	lsl r1, r1, #8
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	str r7, [r4, #8]
	mov r1, #8
	add r0, #0xf4
	str r1, [r0]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xf8
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xf0
	str r1, [r0]
	add r0, r5, #0
	bl ov07_0221C468
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_02222004
	ldr r1, [sp, #0x10]
	lsl r0, r0, #0x11
	str r1, [r4, #0xc]
	mov r1, #0
	str r1, [r4, #0x50]
	ldr r2, _0222C5F8 ; =0x0000BFFF
	neg r0, r0
	str r2, [sp]
	str r0, [sp, #4]
	ldr r1, _0222C5FC ; =0xFFFF8000
	ldr r0, _0222C600 ; =0x0000071C
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	add r0, r4, #0
	lsr r1, r1, #0x12
	add r0, #0x10
	add r3, r1, #0
	bl ov07_0222212C
	ldr r0, [r4, #0x14]
	ldr r2, _0222C604 ; =0x0000FFFF
	str r0, [sp]
	add r0, r4, #0
	ldr r3, _0222C608 ; =0xFFFFF000
	add r0, #0x34
	mov r1, #0
	bl ov07_02222494
	add r0, r4, #0
	ldr r1, [r4, #0x28]
	add r0, #0x48
	strh r1, [r0]
	mov r0, #1
	str r0, [r4, #0x54]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	bl ov07_02221F80
	add r1, r4, #0
	add r1, #0x4a
	strh r0, [r1]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov07_02221F80
	add r1, r4, #0
	add r1, #0x4c
	strh r0, [r1]
	mov r1, #0x4a
	mov r2, #0x4c
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	bl sub_0200DDB8
	ldr r0, [r4, #0xc]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_0200DD54
	ldr r1, [r4]
	add r0, sp, #0x14
	bl ov07_0221F9E8
	mov r0, #0x4a
	ldrsh r0, [r4, r0]
	add r1, sp, #0x14
	add r5, r4, #0
	strh r0, [r1]
	mov r0, #0x4c
	ldrsh r0, [r4, r0]
	add r7, r4, #0
	mov r6, #0
	strh r0, [r1, #2]
	add r5, #0x58
	add r7, #0xc
_0222C5A6:
	str r7, [sp]
	ldr r1, [r4, #4]
	ldr r2, [r4, #8]
	add r0, r5, #0
	add r3, sp, #0x14
	bl ov07_0222C18C
	add r6, r6, #1
	add r5, #0x4c
	cmp r6, #2
	blt _0222C5A6
	add r0, r4, #0
	mov r1, #0
	add r0, #0xfc
	str r1, [r0]
	ldr r0, [r4]
	mov r2, #0x1f
	bl ov07_02231E08
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_0200E0FC
	mov r6, #0
	add r5, r4, #0
	mov r7, #1
_0222C5DA:
	ldr r0, [r5, #0x58]
	add r1, r7, #0
	bl sub_0200E0FC
	add r6, r6, #1
	add r5, #0x4c
	cmp r6, #2
	blt _0222C5DA
	ldr r0, [r4]
	ldr r1, _0222C60C ; =ov07_0222C2D4
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222C5F8: .word 0x0000BFFF
_0222C5FC: .word 0xFFFF8000
_0222C600: .word 0x0000071C
_0222C604: .word 0x0000FFFF
_0222C608: .word 0xFFFFF000
_0222C60C: .word ov07_0222C2D4
	thumb_func_end ov07_0222C4C0

	thumb_func_start ov07_0222C610
ov07_0222C610: ; 0x0222C610
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r2, #0x60
	ldrsh r3, [r4, r2]
	mov r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x5c]
	mov r1, #0
	add r2, r3, r2
	bl sub_020087A4
	mov r2, #0x62
	ldrsh r3, [r4, r2]
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x5c]
	mov r1, #1
	add r2, r3, r2
	bl sub_020087A4
	mov r1, #0x60
	ldrsh r2, [r4, r1]
	mov r1, #0x10
	ldrsh r1, [r4, r1]
	ldr r0, [r4, #0x58]
	add r1, r2, r1
	mov r2, #0x62
	ldrsh r3, [r4, r2]
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r3, r3, r2
	mov r2, #0x66
	ldrsh r2, [r4, r2]
	sub r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	add r0, r4, #0
	add r0, #0x34
	add r1, sp, #4
	add r2, sp, #0
	bl ov07_02222644
	mov r0, #0x64
	ldrsh r0, [r4, r0]
	bl _fflt
	add r1, r0, #0
	ldr r0, _0222C6A4 ; =0x3DCCCCCD
	bl _fmul
	add r1, r0, #0
	ldr r0, [sp, #4]
	bl _fadd
	add r1, r0, #0
	str r1, [sp, #4]
	ldr r0, [r4, #0x58]
	ldr r2, [sp]
	bl sub_0200E024
	mov r0, #0x64
	ldrsh r1, [r4, r0]
	sub r0, #0x65
	add r4, #0x64
	mul r0, r1
	strh r0, [r4]
	add sp, #8
	pop {r4, pc}
	nop
_0222C6A4: .word 0x3DCCCCCD
	thumb_func_end ov07_0222C610

	thumb_func_start ov07_0222C6A8
ov07_0222C6A8: ; 0x0222C6A8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r2, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0222C6C0
	cmp r0, #1
	beq _0222C6FA
	cmp r0, #2
	beq _0222C762
	b _0222C774
_0222C6C0:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_022227D8
	add r0, r4, #0
	add r0, #0x34
	bl ov07_0222260C
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0222C610
	cmp r5, #0
	bne _0222C774
	mov r2, #0xa
	str r2, [sp]
	str r2, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x34
	mov r1, #0xc
	mov r3, #0xf
	bl ov07_02222590
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0222C774
_0222C6FA:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_022227D8
	add r0, r4, #0
	add r0, #0x34
	bl ov07_0222260C
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0222C610
	cmp r5, #0
	bne _0222C774
	mov r2, #0x60
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x5c]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x62
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x5c]
	mov r1, #1
	bl sub_020087A4
	ldr r0, [r4, #0x58]
	mov r1, #0
	bl sub_0200E0FC
	mov r2, #0x62
	ldrsh r3, [r4, r2]
	mov r2, #0x66
	ldrsh r2, [r4, r2]
	mov r1, #0x60
	ldrsh r1, [r4, r1]
	sub r2, r3, r2
	lsl r2, r2, #0x10
	ldr r0, [r4, #0x58]
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r1, #0xfe
	lsl r1, r1, #0x16
	ldr r0, [r4, #0x58]
	add r2, r1, #0
	bl sub_0200E024
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0222C774
_0222C762:
	ldr r0, [r4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, pc}
_0222C774:
	ldr r0, [r4, #4]
	bl sub_0200D020
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0222C6A8

	thumb_func_start ov07_0222C780
ov07_0222C780: ; 0x0222C780
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0x68
	bl AllocFromHeap
	add r4, r0, #0
	str r5, [r4]
	add r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0xc]
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	mov r1, #0
	str r0, [r4, #0x5c]
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0x60
	strh r0, [r1]
	ldr r0, [r4, #0x5c]
	mov r1, #1
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0x62
	strh r0, [r1]
	ldr r0, [r4, #0x5c]
	mov r1, #0x29
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0x66
	strh r0, [r1]
	mov r0, #6
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x10
	mov r1, #2
	mov r2, #0
	mov r3, #1
	bl ov07_022227A8
	ldr r0, [r4]
	mov r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x58]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #0x58]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r4, #0x58]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x58]
	mov r1, #1
	bl sub_0200DD54
	mov r0, #0xf
	str r0, [sp]
	mov r1, #0xa
	str r1, [sp, #4]
	mov r0, #7
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x34
	mov r2, #0xc
	add r3, r1, #0
	bl ov07_02222590
	add r0, r4, #0
	mov r1, #1
	add r0, #0x64
	strh r1, [r0]
	ldr r0, [r4]
	mov r1, #0x1c
	mov r2, #0xf
	bl ov07_02231E08
	ldr r0, [r4]
	ldr r1, _0222C84C ; =ov07_0222C6A8
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0222C84C: .word ov07_0222C6A8
	thumb_func_end ov07_0222C780

	thumb_func_start ov07_0222C850
ov07_0222C850: ; 0x0222C850
	mov r2, #0x12
	ldrsh r2, [r0, r2]
	mov r3, #0x10
	ldrsh r0, [r0, r3]
	neg r2, r2
	lsl r2, r2, #0x10
	neg r0, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	orr r0, r2
	mov r2, #3
	ldr r3, _0222C86C ; =MIi_CpuClear32
	lsl r2, r2, #8
	bx r3
	.balign 4, 0
_0222C86C: .word MIi_CpuClear32
	thumb_func_end ov07_0222C850

	thumb_func_start ov07_0222C870
ov07_0222C870: ; 0x0222C870
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	bl ov07_02222D60
	str r0, [sp, #0xc]
	ldr r1, [sp, #0xc]
	add r0, r5, #0
	bl ov07_0222C850
	add r0, r5, #0
	add r0, #0x1c
	bl ov07_022222B4
	str r0, [sp, #8]
	mov r0, #0x14
	ldrsh r4, [r5, r0]
	mov r0, #0x16
	ldrsh r0, [r5, r0]
	cmp r4, r0
	bgt _0222C910
	ldr r1, [sp, #0xc]
	lsl r2, r4, #2
	add r1, r1, r2
	str r1, [sp]
_0222C8A4:
	ldr r1, [sp]
	sub r0, r0, r4
	ldr r2, [r1]
	lsl r1, r2, #0x10
	asr r1, r1, #0x10
	str r1, [sp, #4]
	lsr r1, r2, #0x10
	lsl r1, r1, #0x10
	asr r7, r1, #0x10
	mov r1, #0x1e
	ldrsh r1, [r5, r1]
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	sub r0, r7, r0
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	mov r0, #0x1c
	ldrsh r1, [r5, r0]
	mov r0, #0x14
	ldrsh r0, [r5, r0]
	add r0, #0x28
	sub r0, r0, r4
	mul r0, r1
	mov r1, #0x64
	bl _s32_div_f
	ldr r1, [sp, #4]
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	sub r6, r4, #1
	bpl _0222C8EC
	add r6, #0xc0
_0222C8EC:
	ldr r0, [sp, #4]
	lsl r1, r7, #0x10
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	bl ov07_02222D88
	ldr r1, [sp, #0xc]
	lsl r2, r6, #2
	str r0, [r1, r2]
	ldr r0, [sp]
	add r4, r4, #1
	add r0, r0, #4
	str r0, [sp]
	mov r0, #0x16
	ldrsh r0, [r5, r0]
	cmp r4, r0
	ble _0222C8A4
_0222C910:
	ldr r0, [sp, #8]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0222C870

	thumb_func_start ov07_0222C918
ov07_0222C918: ; 0x0222C918
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #4
	bhi _0222C980
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222C932: ; jump table
	.short _0222C93C - _0222C932 - 2 ; case 0
	.short _0222C96E - _0222C932 - 2 ; case 1
	.short _0222C996 - _0222C932 - 2 ; case 2
	.short _0222C9E6 - _0222C932 - 2 ; case 3
	.short _0222CA06 - _0222C932 - 2 ; case 4
_0222C93C:
	add r0, r4, #0
	bl ov07_0222C870
	cmp r0, #0
	bne _0222C980
	ldr r0, [r4, #4]
	mov r1, #0x1f
	add r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4]
	mov r2, #0
	bl ov07_02231E74
	mov r1, #0x1f
	mov r2, #0
	str r1, [sp]
	mov r0, #0x10
	add r4, #0x40
	str r0, [sp, #4]
	add r0, r4, #0
	add r3, r2, #0
	bl ov07_02222AC4
	add sp, #8
	pop {r4, r5, r6, pc}
_0222C96E:
	add r0, r4, #0
	bl ov07_0222C870
	add r0, r4, #0
	add r0, #0x40
	bl ov07_02222AF4
	cmp r0, #0
	bne _0222C982
_0222C980:
	b _0222CA88
_0222C982:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #0x18]
	bl ov07_02222D74
	mov r0, #0
	add sp, #8
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
_0222C996:
	ldr r0, [r4]
	bl ov07_0221C4A0
	mov r3, #0x10
	ldrsh r3, [r4, r3]
	mov r1, #2
	mov r2, #0
	neg r3, r3
	bl BgSetPosTextAndCommit
	ldr r0, [r4]
	bl ov07_0221C4A0
	mov r3, #0x12
	ldrsh r3, [r4, r3]
	mov r1, #2
	mov r2, #3
	neg r3, r3
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	cmp r0, #8
	ble _0222CA88
	mov r1, #0
	str r1, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0x1f
	add r0, #0x40
	add r3, r2, #0
	bl ov07_02222AC4
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
_0222C9E6:
	add r0, r4, #0
	add r0, #0x40
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222CA88
	ldr r0, [r4, #0xc]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
_0222CA06:
	ldr r0, [r4, #0x18]
	bl ov07_02222D3C
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAEC
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FB04
	add r1, r0, #0
	lsl r0, r5, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r0, [r4]
	bl ov07_0221FAE8
	add r1, r0, #0
	lsl r1, r1, #0x18
	mov r0, #0
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAEC
	add r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221BFD0
	add r3, r0, #0
	lsl r0, r5, #0x18
	mov r1, #1
	lsr r0, r0, #0x18
	lsl r1, r1, #0xe
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r0, [r4]
	bl ov07_0221C4A0
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAEC
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4]
	add r1, r6, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_0222CA88:
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0222C918

	thumb_func_start ov07_0222CA8C
ov07_0222CA8C: ; 0x0222CA8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0x68
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x68
	add r4, r0, #0
	bl memset
	ldr r1, _0222CBF4 ; =ov07_0222C918
	str r5, [r4]
	add r0, r5, #0
	add r2, r4, #0
	bl ov07_0221C410
	str r0, [sp, #0x14]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0xc]
	mov r1, #0x29
	bl sub_02008A78
	mov r1, #0x12
	ldrsh r2, [r4, r1]
	sub r0, r2, r0
	strh r0, [r4, #0x12]
	mov r0, #0x10
	ldrsh r0, [r4, r0]
	mov r2, #1
	sub r0, #0x28
	strh r0, [r4, #0x10]
	ldrsh r0, [r4, r1]
	mov r1, #6
	sub r0, #0x28
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0xc]
	bl sub_020087A4
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	add r6, r0, #0
	mov r0, #0x12
	ldrsh r1, [r4, r0]
	sub r1, #8
	strh r1, [r4, #0x14]
	ldrsh r0, [r4, r0]
	add r0, #0x58
	strh r0, [r4, #0x16]
	mov r0, #0x14
	ldrsh r0, [r4, r0]
	cmp r0, #0
	bge _0222CB28
	mov r0, #0
	strh r0, [r4, #0x14]
_0222CB28:
	mov r0, #0x16
	ldrsh r0, [r4, r0]
	cmp r0, #0xbf
	ble _0222CB34
	mov r0, #0xbf
	strh r0, [r4, #0x16]
_0222CB34:
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221FAF8
	add r7, r0, #0
	ldr r0, [sp, #0x14]
	bl sub_0201F98C
	str r0, [sp, #0x18]
	ldrh r0, [r4, #0x10]
	ldrh r1, [r4, #0x12]
	bl ov07_02222D88
	str r0, [sp, #0x1c]
	add r0, r5, #0
	bl ov07_0221BFD0
	mov r1, #0x50
	str r1, [sp]
	ldr r1, [sp, #0x18]
	str r7, [sp, #4]
	add r1, r1, #1
	str r1, [sp, #8]
	ldr r1, [sp, #0x1c]
	ldr r2, _0222CBF8 ; =0x0000038E
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	mov r0, #0x14
	mov r1, #0x16
	ldrsh r0, [r4, r0]
	ldrsh r1, [r4, r1]
	lsl r3, r6, #0xf
	lsl r0, r0, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl ov07_02222CCC
	str r0, [r4, #0x18]
	mov r0, #0x28
	str r0, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x1c
	mov r2, #0x50
	add r3, r1, #0
	bl ov07_02222268
	ldr r0, [r4, #0x24]
	add r1, r0, #0
	mul r1, r6
	str r1, [r4, #0x24]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	sub r0, r0, #3
	cmp r0, #1
	bhi _0222CBE6
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAEC
	add r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAE8
	add r1, r0, #0
	lsl r0, r5, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r0, [r4]
	bl ov07_0221FAE8
	add r1, r0, #0
	add r1, r1, #1
	lsl r1, r1, #0x18
	mov r0, #0
	lsr r1, r1, #0x18
	bl SetBgPriority
_0222CBE6:
	ldr r0, [sp, #0x14]
	add r1, r4, #0
	bl ov07_0222C918
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222CBF4: .word ov07_0222C918
_0222CBF8: .word 0x0000038E
	thumb_func_end ov07_0222CA8C

	thumb_func_start ov07_0222CBFC
ov07_0222CBFC: ; 0x0222CBFC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r2, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _0222CCAC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CC16: ; jump table
	.short _0222CC1E - _0222CC16 - 2 ; case 0
	.short _0222CC44 - _0222CC16 - 2 ; case 1
	.short _0222CC56 - _0222CC16 - 2 ; case 2
	.short _0222CC9A - _0222CC16 - 2 ; case 3
_0222CC1E:
	add r0, r4, #0
	add r0, #0x38
	bl ov07_02222468
	ldr r2, [r4, #0x38]
	mov r1, #0x1f
	sub r1, r1, r2
	lsl r1, r1, #8
	orr r2, r1
	ldr r1, _0222CCB8 ; =0x04000052
	cmp r0, #0
	strh r2, [r1]
	bne _0222CCAC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #0xc]
	b _0222CCAC
_0222CC44:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #0x20
	ble _0222CCAC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0222CCAC
_0222CC56:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222558
	add r5, r0, #0
	add r0, r4, #0
	add r0, #0x14
	add r1, sp, #4
	add r2, sp, #0
	bl ov07_02222644
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	bne _0222CC7C
	ldr r1, [sp, #4]
	mov r0, #0
	bl _fsub
	str r0, [sp, #4]
_0222CC7C:
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl sub_0200E024
	cmp r5, #0
	bne _0222CCAC
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0222CCAC
_0222CC9A:
	ldr r0, [r4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, pc}
_0222CCAC:
	ldr r0, [r4, #4]
	bl sub_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0222CCB8: .word 0x04000052
	thumb_func_end ov07_0222CBFC

	thumb_func_start ov07_0222CCBC
ov07_0222CCBC: ; 0x0222CCBC
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r2, r0, #0
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0222CCD8
	cmp r0, #1
	beq _0222CD60
	cmp r0, #2
	bne _0222CCD4
	b _0222CDFE
_0222CCD4:
	add sp, #0xc
	pop {r4, r5, pc}
_0222CCD8:
	add r0, r5, #0
	add r0, #0x14
	bl ov07_022227D8
	mov r2, #0x38
	mov r3, #0x3a
	add r0, r5, #0
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r1, [r5, #8]
	add r0, #0x14
	bl ov07_022220B8
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _0222CD12
	mov r3, #0x3a
	ldrsh r4, [r5, r3]
	ldr r3, [r5, #0x3c]
	mov r2, #0x38
	sub r3, r4, r3
	add r0, r5, #0
	lsl r3, r3, #0x10
	ldrsh r2, [r5, r2]
	ldr r1, [r5, #0xc]
	add r0, #0x14
	asr r3, r3, #0x10
	bl ov07_0222207C
_0222CD12:
	ldr r0, [r5, #8]
	bl sub_02009138
	cmp r0, #0
	bne _0222CE0C
	mov r2, #0
	str r2, [sp]
	ldr r0, [r5, #8]
	mov r1, #0x10
	add r3, r2, #0
	bl sub_020090B4
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _0222CD56
	ldr r0, [r5, #0xc]
	bl ov07_02221FF0
	mov r1, #1
	add r4, r1, #0
	lsl r4, r0
	ldr r0, [r5]
	bl ov07_0221FA78
	mov r1, #0x10
	str r1, [sp]
	mov r3, #0
	lsl r2, r4, #0x10
	str r3, [sp, #4]
	mov r1, #4
	lsr r2, r2, #0x10
	str r3, [sp, #8]
	bl sub_02003370
_0222CD56:
	ldr r0, [r5, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r5, #4]
	pop {r4, r5, pc}
_0222CD60:
	add r0, r5, #0
	add r0, #0x14
	bl ov07_022227D8
	mov r2, #0x38
	mov r3, #0x3a
	add r0, r5, #0
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r1, [r5, #8]
	add r0, #0x14
	bl ov07_022220B8
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _0222CD9A
	mov r3, #0x3a
	ldrsh r4, [r5, r3]
	ldr r3, [r5, #0x3c]
	mov r2, #0x38
	sub r3, r4, r3
	add r0, r5, #0
	lsl r3, r3, #0x10
	ldrsh r2, [r5, r2]
	ldr r1, [r5, #0xc]
	add r0, #0x14
	asr r3, r3, #0x10
	bl ov07_0222207C
_0222CD9A:
	ldr r0, [r5, #8]
	bl sub_02009138
	cmp r0, #0
	bne _0222CE0C
	mov r2, #0x38
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #8]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x3a
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #8]
	mov r1, #1
	bl sub_020087A4
	ldr r0, [r5, #0x10]
	cmp r0, #1
	bne _0222CDF4
	ldr r0, [r5]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r5]
	bl ov07_0221FAC8
	cmp r0, #0
	bne _0222CDDE
	ldr r0, [r5, #8]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
_0222CDDE:
	mov r2, #0x3a
	ldrsh r3, [r5, r2]
	ldr r2, [r5, #0x3c]
	mov r1, #0x38
	sub r2, r3, r2
	lsl r2, r2, #0x10
	ldrsh r1, [r5, r1]
	ldr r0, [r5, #0xc]
	asr r2, r2, #0x10
	bl sub_0200DDB8
_0222CDF4:
	ldr r0, [r5, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r5, #4]
	pop {r4, r5, pc}
_0222CDFE:
	ldr r0, [r5]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r5, #0
	bl FreeToHeap
_0222CE0C:
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_0222CCBC

	thumb_func_start ov07_0222CE10
ov07_0222CE10: ; 0x0222CE10
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0x50
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x50
	bl memset
	str r5, [r4]
	add r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	add r0, r5, #0
	bl ov07_0221BFC0
	str r0, [r4, #0x4c]
	ldr r0, [r4]
	mov r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x10]
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0xa
	add r0, #0x14
	mov r1, #0xe
	add r3, r2, #0
	bl ov07_02222508
	add r0, r4, #0
	add r0, #0x38
	mov r1, #0
	mov r2, #0x10
	mov r3, #8
	bl ov07_02222418
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4]
	mov r1, #0
	mov r2, #0x1f
	bl ov07_02231E08
	ldr r0, [r4, #0x10]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r4, #0x4c]
	cmp r0, #1
	ldr r0, [r4, #0x10]
	bne _0222CE90
	ldr r1, _0222CEB4 ; =0xBFB33333
	ldr r2, _0222CEB8 ; =0x3FB33333
	bl sub_0200E024
	b _0222CE98
_0222CE90:
	ldr r1, _0222CEB8 ; =0x3FB33333
	add r2, r1, #0
	bl sub_0200E024
_0222CE98:
	ldr r0, [r4, #0x10]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [r4]
	ldr r1, _0222CEBC ; =ov07_0222CBFC
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222CEB4: .word 0xBFB33333
_0222CEB8: .word 0x3FB33333
_0222CEBC: .word ov07_0222CBFC
	thumb_func_end ov07_0222CE10

	thumb_func_start ov07_0222CEC0
ov07_0222CEC0: ; 0x0222CEC0
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl ov07_0221BFD0
	mov r1, #0x40
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x40
	bl memset
	str r5, [r4]
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #8]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0x38]
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0x3a]
	ldr r0, [r4, #8]
	mov r1, #0x29
	bl sub_02008A78
	str r0, [r4, #0x3c]
	mov r1, #4
	add r0, r4, #0
	str r1, [sp]
	add r0, #0x14
	mov r2, #0
	mov r3, #1
	bl ov07_022227A8
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	mov r1, #0x14
	ldrsh r1, [r4, r1]
	mov r2, #0x10
	add r0, r1, r0
	mov r1, #0
	strh r0, [r4, #0x14]
	str r1, [sp]
	ldr r0, [r4, #8]
	add r3, r1, #0
	bl sub_020090B4
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0xc]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	add r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	cmp r5, #2
	bne _0222CF6C
	cmp r0, #4
	beq _0222CF74
_0222CF6C:
	cmp r5, #5
	bne _0222CFBA
	cmp r0, #3
	bne _0222CFBA
_0222CF74:
	ldr r0, [r4, #0xc]
	bl ov07_02221FF0
	mov r1, #1
	add r5, r1, #0
	lsl r5, r0
	ldr r0, [r4]
	bl ov07_0221FA78
	mov r3, #0
	lsl r2, r5, #0x10
	str r3, [sp]
	mov r1, #0x10
	str r1, [sp, #4]
	mov r1, #4
	lsr r2, r2, #0x10
	str r3, [sp, #8]
	bl sub_02003370
	mov r0, #1
	str r0, [r4, #0x10]
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAC8
	cmp r0, #0
	bne _0222CFBA
	ldr r0, [r4, #8]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
_0222CFBA:
	ldr r0, [r4]
	ldr r1, _0222CFC8 ; =ov07_0222CCBC
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_0222CFC8: .word ov07_0222CCBC
	thumb_func_end ov07_0222CEC0

	thumb_func_start ov07_0222CFCC
ov07_0222CFCC: ; 0x0222CFCC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r5, #0
	cmp r0, #3
	bhi _0222D048
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222CFE6: ; jump table
	.short _0222CFEE - _0222CFE6 - 2 ; case 0
	.short _0222D006 - _0222CFE6 - 2 ; case 1
	.short _0222D02C - _0222CFE6 - 2 ; case 2
	.short _0222D046 - _0222CFE6 - 2 ; case 3
_0222CFEE:
	add r0, r4, #0
	add r0, #0x1c
	bl ov07_02222AF4
	cmp r0, #1
	bne _0222D048
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0x20
	str r0, [r4, #0x44]
	b _0222D048
_0222D006:
	ldr r0, [r4, #0x44]
	sub r0, r0, #1
	str r0, [r4, #0x44]
	bpl _0222D048
	ldr r0, [r4, #8]
	mov r1, #8
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0x18
	add r4, #0x1c
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r5, #0
	add r3, r1, #0
	bl ov07_02222AC4
	b _0222D048
_0222D02C:
	add r0, r4, #0
	add r0, #0x1c
	bl ov07_02222AF4
	cmp r0, #1
	bne _0222D048
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	ldr r0, [r4, #0x14]
	bl ov07_02222D3C
	b _0222D048
_0222D046:
	mov r5, #1
_0222D048:
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0222CFCC

	thumb_func_start ov07_0222D050
ov07_0222D050: ; 0x0222D050
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222D066
	cmp r0, #1
	beq _0222D09A
	cmp r0, #2
	beq _0222D0AC
	pop {r4, r5, r6, pc}
_0222D066:
	add r0, r4, #0
	bl ov07_0222CFCC
	ldr r0, [r4, #0x48]
	bl sub_0200DCFC
	cmp r0, #1
	bne _0222D092
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAC8
	cmp r0, #0
	bne _0222D092
	ldr r0, [r4, #0x10]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
_0222D092:
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
_0222D09A:
	add r0, r4, #0
	bl ov07_0222CFCC
	cmp r0, #0
	beq _0222D144
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
_0222D0AC:
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAEC
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FB04
	add r1, r0, #0
	lsl r0, r5, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r0, [r4]
	bl ov07_0221FAE8
	add r1, r0, #0
	lsl r1, r1, #0x18
	mov r0, #0
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAC8
	cmp r0, #0
	bne _0222D0FA
	ldr r0, [r4, #0x10]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
_0222D0FA:
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAEC
	add r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221BFD0
	add r3, r0, #0
	lsl r0, r5, #0x18
	mov r1, #1
	lsr r0, r0, #0x18
	lsl r1, r1, #0xe
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r0, [r4]
	bl ov07_0221C4A0
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAEC
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4]
	add r1, r6, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_0222D144:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_0222D050

	thumb_func_start ov07_0222D148
ov07_0222D148: ; 0x0222D148
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp, #0x14]
	mov r1, #0x4c
	bl ov07_022324D8
	add r4, r0, #0
	ldr r0, [sp, #0x14]
	str r0, [r4]
	bl ov07_0221FA78
	str r0, [r4, #0x18]
	ldr r0, [r4]
	mov r1, #0
	mov r2, #0x10
	bl ov07_02231E74
	mov r2, #8
	str r2, [sp]
	mov r0, #0x18
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x1c
	mov r1, #0
	mov r3, #0x10
	bl ov07_02222AC4
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	mov r1, #0
	str r0, [r4, #0x10]
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	ldr r0, [r4, #0x10]
	mov r1, #0x29
	bl sub_02008A78
	sub r0, r5, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	sub r0, #0x28
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	ldr r0, [r4]
	mov r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x48]
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	cmp r0, #5
	beq _0222D1D8
	cmp r0, #2
	bne _0222D1EA
_0222D1D8:
	ldr r0, [r4, #0x48]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4, #0x48]
	mov r1, #2
	bl sub_0200DD54
	b _0222D224
_0222D1EA:
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAEC
	add r6, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAE8
	add r1, r0, #0
	lsl r0, r6, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r0, [r4]
	bl ov07_0221FAE8
	add r1, r0, #0
	add r1, r1, #1
	lsl r1, r1, #0x18
	mov r0, #0
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r0, [r4, #0x48]
	mov r1, #0
	bl sub_0200DCE8
_0222D224:
	add r0, r5, #0
	add r0, #0x50
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	str r5, [sp, #0x18]
	cmp r5, #0
	bge _0222D234
	mov r5, #0
_0222D234:
	cmp r6, #0xbf
	ble _0222D23A
	mov r6, #0xbf
_0222D23A:
	ldr r0, [sp, #0x14]
	mov r1, #1
	bl ov07_0221FAF8
	ldr r1, [sp, #0x18]
	sub r7, #0x28
	str r0, [sp, #0x1c]
	lsl r0, r7, #0x10
	asr r0, r0, #0x10
	neg r0, r0
	neg r1, r1
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	bl ov07_02222D88
	add r7, r0, #0
	ldr r0, [sp, #0x14]
	bl ov07_0221BFD0
	mov r1, #0x64
	str r1, [sp]
	ldr r1, [sp, #0x1c]
	mov r3, #5
	str r1, [sp, #4]
	mov r1, #0
	str r1, [sp, #8]
	str r7, [sp, #0xc]
	str r0, [sp, #0x10]
	lsl r0, r5, #0x18
	lsl r1, r6, #0x18
	ldr r2, _0222D2A8 ; =0x0000038E
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	lsl r3, r3, #0xc
	bl ov07_02222CCC
	mov r2, #1
	str r0, [r4, #0x14]
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4, #0x18]
	lsl r2, r2, #8
	mov r3, #8
	bl sub_02003EA4
	ldr r0, [r4]
	ldr r1, _0222D2AC ; =ov07_0222D050
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D2A8: .word 0x0000038E
_0222D2AC: .word ov07_0222D050
	thumb_func_end ov07_0222D148

	thumb_func_start ov07_0222D2B0
ov07_0222D2B0: ; 0x0222D2B0
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #3
	bhi _0222D3B2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222D2CA: ; jump table
	.short _0222D2D2 - _0222D2CA - 2 ; case 0
	.short _0222D322 - _0222D2CA - 2 ; case 1
	.short _0222D360 - _0222D2CA - 2 ; case 2
	.short _0222D39A - _0222D2CA - 2 ; case 3
_0222D2D2:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	bne _0222D304
	add r0, r4, #0
	add r0, #0x14
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x54]
	bl _fflt
	add r1, r0, #0
	ldr r0, [sp, #8]
	bl _fmul
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	ldr r2, [sp, #4]
	bl sub_0200E024
	b _0222D3B2
_0222D304:
	ldr r0, [r4, #0xc]
	mov r1, #0xa
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #5
	str r0, [r4, #0x4c]
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x14
	add r2, r1, #0
	mov r3, #1
	bl ov07_02222508
	b _0222D3B2
_0222D322:
	add r0, r4, #0
	add r0, #0x38
	bl ov07_02222440
	ldr r1, [r4, #0x38]
	add r5, r0, #0
	lsl r1, r1, #0x10
	ldr r0, [r4, #0x10]
	lsr r1, r1, #0x10
	bl sub_0200E074
	cmp r5, #0
	bne _0222D3B2
	ldr r0, [r4, #0x4c]
	cmp r0, #0
	ble _0222D358
	sub r0, r0, #1
	str r0, [r4, #0x4c]
	add r0, r4, #0
	ldr r1, [r4, #0x38]
	ldr r2, [r4, #0x50]
	add r0, #0x38
	mov r3, #4
	str r1, [r4, #0x50]
	bl ov07_022223F0
	b _0222D3B2
_0222D358:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D3B2
_0222D360:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222558
	cmp r0, #1
	bne _0222D392
	add r0, r4, #0
	add r0, #0x14
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x54]
	bl _fflt
	add r1, r0, #0
	ldr r0, [sp, #8]
	bl _fmul
	add r1, r0, #0
	ldr r0, [r4, #0x10]
	ldr r2, [sp, #4]
	bl sub_0200E024
	b _0222D3B2
_0222D392:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D3B2
_0222D39A:
	ldr r0, [r4, #0x10]
	bl sub_0200D9DC
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, pc}
_0222D3B2:
	ldr r0, [r4, #8]
	bl sub_0200D020
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_0222D2B0

	thumb_func_start ov07_0222D3BC
ov07_0222D3BC: ; 0x0222D3BC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r6, r1, #0
	mov r1, #0x58
	add r5, r0, #0
	add r7, r2, #0
	str r3, [sp, #4]
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4]
	str r6, [r4, #4]
	str r7, [r4, #8]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	add r7, r0, #0
	ldr r0, [r4]
	mov r1, #0
	bl ov07_0221FB78
	cmp r0, #1
	bne _0222D3FC
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #0x54]
	neg r6, r7
	b _0222D402
_0222D3FC:
	mov r0, #1
	str r0, [r4, #0x54]
	add r6, r7, #0
_0222D402:
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl ov07_02221F80
	str r0, [sp, #8]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #1
	bl ov07_02221F80
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	mov r1, #2
	str r0, [r4, #0x10]
	bl sub_0200DF98
	mov r1, #0xfe
	lsl r1, r1, #0x16
	ldr r0, [r4, #0x10]
	add r2, r1, #0
	bl sub_0200E024
	ldr r0, [r4, #0x10]
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	bl sub_0200DDB8
	mov r1, #0x28
	mul r1, r7
	lsl r1, r1, #0x10
	ldr r0, [r4, #0x10]
	asr r1, r1, #0x10
	mov r2, #0
	bl sub_0200DED0
	ldr r0, [r4, #0x10]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200DD54
	mov r1, #0xb
	mvn r1, r1
	mul r1, r6
	lsl r1, r1, #0x10
	ldr r0, [r4, #0x10]
	asr r1, r1, #0x10
	mov r2, #0xc
	bl sub_0200E0CC
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	bl ov07_0223192C
	cmp r0, #4
	ldr r0, [r4, #0x10]
	bne _0222D494
	mov r1, #1
	bl sub_0200DC4C
	b _0222D49A
_0222D494:
	mov r1, #0
	bl sub_0200DC4C
_0222D49A:
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	mov r2, #0xa
	add r0, #0x14
	mov r1, #1
	add r3, r2, #0
	bl ov07_02222508
	cmp r6, #0
	blt _0222D4C2
	add r0, r4, #0
	ldr r1, _0222D4E4 ; =0x0000FF48
	ldr r2, _0222D4E8 ; =0x0000E38D
	add r0, #0x38
	mov r3, #4
	bl ov07_022223F0
	ldr r0, _0222D4E4 ; =0x0000FF48
	b _0222D4D2
_0222D4C2:
	add r0, r4, #0
	ldr r2, _0222D4EC ; =0x00001C71
	add r0, #0x38
	mov r1, #0
	mov r3, #4
	bl ov07_022223F0
	mov r0, #0
_0222D4D2:
	str r0, [r4, #0x50]
	ldr r0, [r4]
	ldr r1, _0222D4F0 ; =ov07_0222D2B0
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222D4E4: .word 0x0000FF48
_0222D4E8: .word 0x0000E38D
_0222D4EC: .word 0x00001C71
_0222D4F0: .word ov07_0222D2B0
	thumb_func_end ov07_0222D3BC

	thumb_func_start ov07_0222D4F4
ov07_0222D4F4: ; 0x0222D4F4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	str r1, [r5]
	add r6, r3, #0
	mov r3, #8
	mov r1, #0xa
	add r4, r2, #0
	add r0, r5, #4
	add r2, r1, #0
	str r3, [sp]
	bl ov07_02222508
	mov r0, #3
	str r0, [r5, #0x2c]
	mov r0, #8
	str r0, [r5, #0x30]
	mov r0, #0xa
	str r0, [r5, #0x34]
	ldr r0, [sp, #0x18]
	add r1, r4, #0
	str r0, [r5, #0x28]
	ldr r0, [r5]
	add r2, r6, #0
	bl sub_0200DDB8
	ldr r0, [r5]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0200DDB8
	ldr r0, [r5]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r5]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r5]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [sp, #0x18]
	cmp r0, #0
	beq _0222D55C
	mov r2, #0xfe
	ldr r0, [r5]
	ldr r1, _0222D568 ; =0xBF800000
	lsl r2, r2, #0x16
	bl sub_0200E024
_0222D55C:
	ldr r0, [r5]
	mov r1, #0
	bl sub_0200DCE8
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_0222D568: .word 0xBF800000
	thumb_func_end ov07_0222D4F4

	thumb_func_start ov07_0222D56C
ov07_0222D56C: ; 0x0222D56C
	ldr r3, _0222D574 ; =sub_0200D9DC
	ldr r0, [r0]
	bx r3
	nop
_0222D574: .word sub_0200D9DC
	thumb_func_end ov07_0222D56C

	thumb_func_start ov07_0222D578
ov07_0222D578: ; 0x0222D578
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4]
	mov r1, #1
	bl sub_0200DC78
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0222D578

	thumb_func_start ov07_0222D590
ov07_0222D590: ; 0x0222D590
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, r4, #4
	bl ov07_02222558
	cmp r0, #1
	bne _0222D5D4
	add r0, r4, #4
	add r1, sp, #8
	add r2, sp, #4
	bl ov07_02222644
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _0222D5C6
	ldr r1, [sp, #8]
	mov r0, #0
	bl _fsub
	add r1, r0, #0
	mov r2, #0xfe
	ldr r0, [r4]
	lsl r2, r2, #0x16
	bl sub_0200E024
	b _0222D606
_0222D5C6:
	mov r2, #0xfe
	ldr r0, [r4]
	ldr r1, [sp, #8]
	lsl r2, r2, #0x16
	bl sub_0200E024
	b _0222D606
_0222D5D4:
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _0222D600
	sub r0, r0, #1
	str r0, [r4, #0x2c]
	mov r0, #8
	str r0, [sp]
	ldr r1, [r4, #0x30]
	ldr r3, [r4, #0x34]
	lsl r1, r1, #0x10
	lsl r3, r3, #0x10
	add r0, r4, #4
	asr r1, r1, #0x10
	mov r2, #0xa
	asr r3, r3, #0x10
	bl ov07_02222508
	ldr r1, [r4, #0x30]
	ldr r0, [r4, #0x34]
	str r0, [r4, #0x30]
	str r1, [r4, #0x34]
	b _0222D606
_0222D600:
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, pc}
_0222D606:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov07_0222D590

	thumb_func_start ov07_0222D60C
ov07_0222D60C: ; 0x0222D60C
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #3
	bhi _0222D6D8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222D624: ; jump table
	.short _0222D62C - _0222D624 - 2 ; case 0
	.short _0222D65E - _0222D624 - 2 ; case 1
	.short _0222D67C - _0222D624 - 2 ; case 2
	.short _0222D69C - _0222D624 - 2 ; case 3
_0222D62C:
	ldr r0, [r4, #0x10]
	cmp r0, #4
	blt _0222D656
	mov r0, #0
	str r0, [r4, #0x10]
	ldr r1, [r4, #0x14]
	add r2, r4, #0
	mov r0, #0x38
	add r2, #0x44
	mul r0, r1
	add r0, r2, r0
	bl ov07_0222D578
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
	cmp r0, #4
	blt _0222D656
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
_0222D656:
	ldr r0, [r4, #0x10]
	add r0, r0, #1
	str r0, [r4, #0x10]
	b _0222D6D8
_0222D65E:
	mov r1, #0x1c
	mov r2, #0x1e
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x18]
	add r0, #0x20
	bl ov07_0222283C
	cmp r0, #0
	bne _0222D6D8
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D6D8
_0222D67C:
	add r6, r4, #0
	mov r5, #0
	add r6, #0x44
_0222D682:
	add r0, r6, #0
	bl ov07_0222D590
	add r5, r5, #1
	add r6, #0x38
	cmp r5, #4
	blt _0222D682
	cmp r0, #0
	bne _0222D6D8
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D6D8
_0222D69C:
	mov r2, #0x1c
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x1e
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl sub_020087A4
	add r5, r4, #0
	mov r6, #0
	add r5, #0x44
_0222D6BA:
	add r0, r5, #0
	bl ov07_0222D56C
	add r6, r6, #1
	add r5, #0x38
	cmp r6, #4
	blt _0222D6BA
	ldr r0, [r4]
	add r1, r7, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_0222D6D8:
	ldr r0, [r4, #8]
	bl sub_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222D60C

	thumb_func_start ov07_0222D6E0
ov07_0222D6E0: ; 0x0222D6E0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r1, [sp, #4]
	mov r1, #0x4a
	lsl r1, r1, #2
	add r4, r0, #0
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	bl ov07_022324D8
	add r7, r0, #0
	ldr r0, [sp, #4]
	str r4, [r7]
	str r0, [r7, #4]
	ldr r0, [sp, #8]
	str r0, [r7, #8]
	add r0, r4, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r7]
	bl ov07_0221FA48
	str r0, [r7, #0x18]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r7, #0x1c]
	ldr r0, [r7, #0x18]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r7, #0x1e]
	add r0, r7, #0
	mov r3, #1
	add r0, #0x20
	mov r1, #4
	mov r2, #0
	str r3, [sp]
	bl ov07_022227A8
	mov r0, #0x1e
	ldrsh r4, [r7, r0]
	ldr r1, [r7]
	add r0, sp, #0x14
	add r4, #0x10
	mov r5, #0
	bl ov07_0221F9E8
	add r0, r5, #0
	add r6, r7, #0
	str r0, [sp, #0x10]
	add r6, #0x44
_0222D74A:
	ldr r0, [sp, #0x10]
	cmp r0, #0
	bne _0222D764
	str r5, [sp]
	mov r2, #0x1c
	lsl r3, r4, #0x10
	ldrsh r2, [r7, r2]
	ldr r1, [sp, #0xc]
	add r0, r6, #0
	asr r3, r3, #0x10
	bl ov07_0222D4F4
	b _0222D780
_0222D764:
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	add r2, sp, #0x14
	bl sub_0200D734
	lsl r3, r4, #0x10
	add r1, r0, #0
	str r5, [sp]
	mov r2, #0x1c
	ldrsh r2, [r7, r2]
	add r0, r6, #0
	asr r3, r3, #0x10
	bl ov07_0222D4F4
_0222D780:
	mov r0, #1
	eor r5, r0
	ldr r0, [sp, #0x10]
	sub r4, #0xa
	add r0, r0, #1
	add r6, #0x38
	str r0, [sp, #0x10]
	cmp r0, #4
	blt _0222D74A
	ldr r0, [r7]
	ldr r1, _0222D7A0 ; =ov07_0222D60C
	add r2, r7, #0
	bl ov07_0221C410
	add sp, #0x48
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222D7A0: .word ov07_0222D60C
	thumb_func_end ov07_0222D6E0

	thumb_func_start ov07_0222D7A4
ov07_0222D7A4: ; 0x0222D7A4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #6
	bls _0222D7B4
	b _0222D966
_0222D7B4:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222D7C0: ; jump table
	.short _0222D7CE - _0222D7C0 - 2 ; case 0
	.short _0222D810 - _0222D7C0 - 2 ; case 1
	.short _0222D870 - _0222D7C0 - 2 ; case 2
	.short _0222D8B0 - _0222D7C0 - 2 ; case 3
	.short _0222D8D0 - _0222D7C0 - 2 ; case 4
	.short _0222D90E - _0222D7C0 - 2 ; case 5
	.short _0222D94E - _0222D7C0 - 2 ; case 6
_0222D7CE:
	add r0, r4, #0
	add r0, #0x18
	bl ov07_022222B4
	cmp r0, #0
	beq _0222D7F0
	mov r2, #0x14
	mov r3, #0x16
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0x10]
	add r0, #0x18
	bl ov07_022220B8
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0222D7F0:
	mov r2, #0
	str r2, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r1, #0x18
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	add r0, #0x18
	add r3, r2, #0
	bl ov07_02222268
	ldr r0, [r4, #0xc]
	add sp, #0x10
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_0222D810:
	add r0, r4, #0
	add r0, #0x18
	bl ov07_022222B4
	cmp r0, #0
	beq _0222D832
	mov r2, #0x14
	mov r3, #0x16
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0x10]
	add r0, #0x18
	bl ov07_022220B8
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0222D832:
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_020087A4
	mov r1, #0
	str r1, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r2, [r4, #0x3c]
	add r0, r4, #0
	lsl r2, r2, #5
	neg r2, r2
	lsl r2, r2, #0x10
	add r0, #0x18
	asr r2, r2, #0x10
	add r3, r1, #0
	bl ov07_02222268
	ldr r0, [r4, #0xc]
	add sp, #0x10
	add r0, r0, #1
	str r0, [r4, #0xc]
	pop {r3, r4, r5, pc}
_0222D870:
	add r0, r4, #0
	ldr r2, [r4, #0x48]
	add r0, #0x4c
	add r1, #0x70
	bl ov07_022223CC
	cmp r0, #0
	bne _0222D966
	mov r0, #0x46
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	mov r2, #0x44
	str r0, [sp]
	mov r0, #0x16
	ldrsh r0, [r4, r0]
	mov r3, #0x14
	add r1, #0x70
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	ldr r0, _0222D970 ; =0xFFFE0000
	str r0, [sp, #0xc]
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, #0x4c
	bl ov07_02222338
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D966
_0222D8B0:
	add r0, r4, #0
	ldr r2, [r4, #0x48]
	add r0, #0x4c
	add r1, #0x70
	bl ov07_022223CC
	cmp r0, #0
	bne _0222D966
	ldr r0, [r4, #0x48]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D966
_0222D8D0:
	add r0, r4, #0
	add r0, #0x18
	bl ov07_022222B4
	cmp r0, #0
	beq _0222D8F0
	mov r2, #0x14
	mov r3, #0x16
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0x10]
	add r0, #0x18
	bl ov07_022220B8
	b _0222D966
_0222D8F0:
	mov r2, #0
	str r2, [sp]
	mov r0, #4
	str r0, [sp, #4]
	mov r1, #0x18
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	add r0, #0x18
	add r3, r2, #0
	bl ov07_02222268
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D966
_0222D90E:
	add r0, r4, #0
	add r0, #0x18
	bl ov07_022222B4
	cmp r0, #0
	beq _0222D92E
	mov r2, #0x14
	mov r3, #0x16
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0x10]
	add r0, #0x18
	bl ov07_022220B8
	b _0222D966
_0222D92E:
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_020087A4
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222D966
_0222D94E:
	ldr r0, [r4, #0x48]
	bl sub_0200D9DC
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x10
	pop {r3, r4, r5, pc}
_0222D966:
	ldr r0, [r4, #8]
	bl sub_0200D020
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222D970: .word 0xFFFE0000
	thumb_func_end ov07_0222D7A4

	thumb_func_start ov07_0222D974
ov07_0222D974: ; 0x0222D974
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r1, #0
	mov r1, #0x94
	add r5, r0, #0
	str r2, [sp, #0x10]
	add r6, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4]
	ldr r0, [sp, #0x10]
	str r7, [r4, #4]
	str r0, [r4, #8]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	str r0, [r4, #0x3c]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0x16]
	mov r1, #0
	str r1, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r2, [r4, #0x3c]
	add r0, r4, #0
	lsl r2, r2, #4
	neg r2, r2
	lsl r2, r2, #0x10
	add r0, #0x18
	asr r2, r2, #0x10
	add r3, r1, #0
	bl ov07_02222268
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	mov r1, #0
	str r0, [r4, #0x40]
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0x44
	strh r0, [r1]
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0x46
	strh r0, [r1]
	add r0, r6, #0
	mov r1, #1
	str r6, [r4, #0x48]
	bl sub_0200DC78
	ldr r0, [r4, #0x48]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x48]
	mov r1, #1
	bl sub_0200DD54
	mov r0, #0x16
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	mov r2, #0x14
	str r0, [sp]
	mov r0, #0x46
	ldrsh r0, [r4, r0]
	mov r3, #0x44
	add r1, #0x70
	str r0, [sp, #4]
	mov r0, #0xa
	str r0, [sp, #8]
	mov r0, #2
	lsl r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, #0x4c
	bl ov07_02222338
	ldr r0, [r4]
	ldr r1, _0222DA5C ; =ov07_0222D7A4
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0222DA5C: .word ov07_0222D7A4
	thumb_func_end ov07_0222D974

	thumb_func_start ov07_0222DA60
ov07_0222DA60: ; 0x0222DA60
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	add r2, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _0222DB0A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222DA7A: ; jump table
	.short _0222DA82 - _0222DA7A - 2 ; case 0
	.short _0222DAAE - _0222DA7A - 2 ; case 1
	.short _0222DAD2 - _0222DA7A - 2 ; case 2
	.short _0222DAF8 - _0222DA7A - 2 ; case 3
_0222DA82:
	mov r2, #0x1a
	ldrsh r3, [r4, r2]
	mov r2, #0x68
	ldrsh r2, [r4, r2]
	mov r1, #0x18
	ldrsh r1, [r4, r1]
	sub r2, r3, r2
	add r0, r4, #0
	lsl r2, r2, #0x10
	ldr r3, [r4, #0x14]
	add r0, #0x1c
	asr r2, r2, #0x10
	bl ov07_02222218
	cmp r0, #0
	bne _0222DB0A
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0x10
	str r0, [r4, #0xc]
	b _0222DB0A
_0222DAAE:
	ldr r0, [r4, #0xc]
	sub r0, r0, #1
	str r0, [r4, #0xc]
	bpl _0222DB0A
	ldr r0, [r4, #8]
	mov r2, #0x10
	add r0, r0, #1
	str r0, [r4, #8]
	mov r1, #0
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x40
	add r3, r2, #0
	bl ov07_02222AC4
	b _0222DB0A
_0222DAD2:
	add r0, r4, #0
	add r0, #0x40
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222DB0A
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4, #0x10]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0222DB0A
_0222DAF8:
	ldr r0, [r4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r4, pc}
_0222DB0A:
	ldr r0, [r4, #4]
	bl sub_0200D020
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_0222DA60

	thumb_func_start ov07_0222DB14
ov07_0222DB14: ; 0x0222DB14
	push {r4, r5, r6, lr}
	sub sp, #8
	mov r1, #0x6c
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4]
	add r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	add r6, r0, #0
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0x18]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0x1a]
	ldr r0, [r4, #0x10]
	mov r1, #0x29
	bl sub_02008A78
	add r1, r4, #0
	add r1, #0x68
	strh r0, [r1]
	mov r0, #0x1a
	ldrsh r0, [r4, r0]
	mov r1, #0
	add r0, #8
	strh r0, [r4, #0x1a]
	ldr r0, [r4]
	bl ov07_0221C4E8
	str r0, [r4, #0x14]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #0x10]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
	add r0, r4, #0
	add r0, #0x1c
	mov r1, #2
	mov r2, #0x10
	bl ov07_02222A44
	ldr r0, [r4]
	mov r1, #0x10
	mov r2, #0
	bl ov07_02231E08
	mov r1, #0x10
	str r1, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	add r0, r4, #0
	mov r2, #0
	add r0, #0x40
	add r3, r2, #0
	bl ov07_02222AC4
	ldr r0, [r4, #0x28]
	add r2, r4, #0
	add r1, r0, #0
	mul r1, r6
	str r1, [r4, #0x28]
	ldr r0, [r4]
	ldr r1, _0222DBD4 ; =ov07_0222DA60
	bl ov07_0221C410
	ldr r0, [r4, #4]
	bl sub_0200D020
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222DBD4: .word ov07_0222DA60
	thumb_func_end ov07_0222DB14

	thumb_func_start ov07_0222DBD8
ov07_0222DBD8: ; 0x0222DBD8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x38]
	mov r4, #0
	cmp r0, #0
	beq _0222DBEE
	cmp r0, #1
	beq _0222DC22
	cmp r0, #2
	beq _0222DC4E
	b _0222DC50
_0222DBEE:
	add r0, r5, #0
	add r0, #0x14
	bl ov07_02222558
	cmp r0, #0
	beq _0222DC08
	mov r2, #0x16
	ldrsh r2, [r5, r2]
	ldr r0, [r5, #0x10]
	mov r1, #0xd
	bl sub_020087A4
	b _0222DC50
_0222DC08:
	ldr r0, [r5, #0x38]
	mov r2, #0xa
	add r0, r0, #1
	str r0, [r5, #0x38]
	mov r0, #0xc
	add r5, #0x14
	str r0, [sp]
	add r0, r5, #0
	mov r1, #0xf
	add r3, r2, #0
	bl ov07_02222508
	b _0222DC50
_0222DC22:
	add r0, r5, #0
	add r0, #0x14
	bl ov07_02222558
	cmp r0, #0
	ldr r0, [r5, #0x10]
	beq _0222DC3C
	mov r2, #0x16
	ldrsh r2, [r5, r2]
	mov r1, #0xd
	bl sub_020087A4
	b _0222DC50
_0222DC3C:
	mov r1, #0xd
	add r2, r1, #0
	add r2, #0xf3
	bl sub_020087A4
	ldr r0, [r5, #0x38]
	add r0, r0, #1
	str r0, [r5, #0x38]
	b _0222DC50
_0222DC4E:
	mov r4, #1
_0222DC50:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222DBD8

	thumb_func_start ov07_0222DC54
ov07_0222DC54: ; 0x0222DC54
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0x40]
	mov r4, #0
	cmp r0, #0
	beq _0222DC6C
	cmp r0, #1
	beq _0222DCB2
	cmp r0, #2
	beq _0222DCCE
	b _0222DCD0
_0222DC6C:
	add r0, r5, #0
	ldr r1, [r5, #0x3c]
	add r0, #0x44
	bl ov07_02222748
	add r0, r5, #0
	add r0, #0x68
	bl ov07_022222B4
	cmp r0, #0
	beq _0222DC96
	mov r2, #0xb4
	mov r3, #0xb6
	add r0, r5, #0
	ldrsh r2, [r5, r2]
	ldrsh r3, [r5, r3]
	ldr r1, [r5, #0x3c]
	add r0, #0x68
	bl ov07_0222207C
	b _0222DCD0
_0222DC96:
	ldr r0, [r5, #0x40]
	mov r1, #0x10
	add r0, r0, #1
	str r0, [r5, #0x40]
	str r1, [sp]
	mov r0, #8
	add r5, #0x8c
	str r0, [sp, #4]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0xe
	bl ov07_02222AC4
	b _0222DCD0
_0222DCB2:
	add r0, r5, #0
	add r0, #0x8c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222DCD0
	ldr r0, [r5, #0x3c]
	add r1, r4, #0
	bl sub_0200DCE8
	ldr r0, [r5, #0x40]
	add r0, r0, #1
	str r0, [r5, #0x40]
	b _0222DCD0
_0222DCCE:
	mov r4, #1
_0222DCD0:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0222DC54

	thumb_func_start ov07_0222DCD8
ov07_0222DCD8: ; 0x0222DCD8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #0
	beq _0222DCEA
	cmp r0, #1
	beq _0222DD02
	b _0222DD18
_0222DCEA:
	add r0, r4, #0
	bl ov07_0222DBD8
	add r0, r4, #0
	bl ov07_0222DC54
	cmp r0, #0
	beq _0222DD18
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222DD18
_0222DD02:
	ldr r0, [r4, #0x3c]
	bl sub_0200D9DC
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
_0222DD18:
	ldr r0, [r4, #8]
	bl sub_0200D020
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222DCD8

	thumb_func_start ov07_0222DD20
ov07_0222DD20: ; 0x0222DD20
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r1, #0
	mov r1, #0xb8
	add r6, r0, #0
	add r7, r2, #0
	str r3, [sp, #8]
	bl ov07_022324D8
	add r4, r0, #0
	str r6, [r4]
	str r5, [r4, #4]
	str r7, [r4, #8]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02222004
	str r0, [sp, #0xc]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0222202C
	add r5, r0, #0
	add r0, r6, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	mov r1, #0
	str r0, [r4, #0x10]
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	mov r0, #0xc
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xa
	add r0, #0x14
	add r2, r1, #0
	mov r3, #0xf
	bl ov07_02222508
	ldr r0, [sp, #8]
	mov r1, #1
	str r0, [r4, #0x3c]
	bl sub_0200DC78
	ldr r0, [r4, #0x3c]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r4, #0x3c]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #0x3c]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x3c]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [sp, #0xc]
	lsl r0, r0, #5
	add r1, r7, r0
	add r0, r4, #0
	add r0, #0xb4
	strh r1, [r0]
	add r0, r4, #0
	add r0, #0xb6
	strh r6, [r0]
	cmp r5, #0
	bge _0222DDD6
	mov r1, #7
	b _0222DDD8
_0222DDD6:
	mov r1, #0x17
_0222DDD8:
	mvn r1, r1
	add r0, r1, #0
	mul r0, r5
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	mov r1, #0
	mov r0, #0x20
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x68
	add r2, r1, #0
	add r3, r1, #0
	bl ov07_02222268
	mov r0, #0x20
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x44
	mov r1, #5
	mov r2, #0xa
	mov r3, #0xc
	bl ov07_02222508
	mov r0, #0x1a
	str r0, [sp]
	ldr r0, _0222DE28 ; =0x04000050
	mov r1, #0
	mov r2, #0x3f
	mov r3, #0x1f
	bl G2x_SetBlendAlpha_
	ldr r0, [r4]
	ldr r1, _0222DE2C ; =ov07_0222DCD8
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222DE28: .word 0x04000050
_0222DE2C: .word ov07_0222DCD8
	thumb_func_end ov07_0222DD20

	thumb_func_start ov07_0222DE30
ov07_0222DE30: ; 0x0222DE30
	push {r3, lr}
	sub sp, #8
	ldr r1, [r0, #0x68]
	cmp r1, #5
	bhi _0222DEE4
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222DE46: ; jump table
	.short _0222DE52 - _0222DE46 - 2 ; case 0
	.short _0222DE68 - _0222DE46 - 2 ; case 1
	.short _0222DE82 - _0222DE46 - 2 ; case 2
	.short _0222DE9C - _0222DE46 - 2 ; case 3
	.short _0222DEB6 - _0222DE46 - 2 ; case 4
	.short _0222DECC - _0222DE46 - 2 ; case 5
_0222DE52:
	mov r2, #0x28
	str r2, [sp]
	mov r1, #8
	str r1, [sp, #4]
	mov r1, #0
	add r0, #0x18
	add r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222DE68:
	mov r1, #0x4f
	mvn r1, r1
	str r1, [sp]
	mov r1, #8
	str r1, [sp, #4]
	mov r1, #0
	add r0, #0x18
	add r2, r1, #0
	add r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222DE82:
	mov r1, #0x50
	str r1, [sp]
	mov r1, #8
	str r1, [sp, #4]
	mov r1, #0
	add r2, r1, #0
	add r0, #0x18
	sub r2, #0x50
	add r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222DE9C:
	mov r1, #0x4f
	mvn r1, r1
	str r1, [sp]
	mov r1, #8
	str r1, [sp, #4]
	mov r1, #0
	add r0, #0x18
	add r2, r1, #0
	add r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222DEB6:
	mov r2, #0x50
	str r2, [sp]
	mov r1, #8
	str r1, [sp, #4]
	mov r1, #0
	add r0, #0x18
	add r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222DECC:
	mov r2, #0x27
	mvn r2, r2
	str r2, [sp]
	mov r1, #8
	str r1, [sp, #4]
	mov r1, #0
	add r0, #0x18
	add r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222DEE4:
	bl GF_AssertFail
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov07_0222DE30

	thumb_func_start ov07_0222DEEC
ov07_0222DEEC: ; 0x0222DEEC
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bls _0222DEFC
	b _0222E010
_0222DEFC:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222DF08: ; jump table
	.short _0222DF12 - _0222DF08 - 2 ; case 0
	.short _0222DF2E - _0222DF08 - 2 ; case 1
	.short _0222DFB0 - _0222DF08 - 2 ; case 2
	.short _0222DFE6 - _0222DF08 - 2 ; case 3
	.short _0222DFF8 - _0222DF08 - 2 ; case 4
_0222DF12:
	ldr r0, [r4, #0x6c]
	add r0, r0, #1
	str r0, [r4, #0x6c]
	cmp r0, #4
	ble _0222E010
	add r0, r4, #0
	bl ov07_0222DE30
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x6c]
	b _0222E010
_0222DF2E:
	add r0, r4, #0
	add r0, #0x18
	bl ov07_022222B4
	cmp r0, #0
	beq _0222DF4E
	mov r2, #0x64
	mov r3, #0x66
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0x14]
	add r0, #0x18
	bl ov07_0222207C
	b _0222E010
_0222DF4E:
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	cmp r0, #6
	bge _0222DF7E
	mov r0, #0
	str r0, [r4, #0xc]
	mov r0, #0x64
	ldrsh r1, [r4, r0]
	mov r0, #0x18
	ldrsh r0, [r4, r0]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0x64
	strh r1, [r0]
	mov r0, #0x66
	ldrsh r1, [r4, r0]
	mov r0, #0x1a
	ldrsh r0, [r4, r0]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0x66
	strh r1, [r0]
	b _0222E010
_0222DF7E:
	ldr r0, [r4, #0xc]
	mov r1, #1
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4, #0x14]
	bl sub_0200E0FC
	mov r1, #0x10
	add r0, r4, #0
	mov r2, #0
	str r1, [sp]
	add r0, #0x3c
	add r3, r2, #0
	str r1, [sp, #4]
	bl ov07_02222AC4
	ldr r0, _0222E01C ; =0x00007FFF
	mov r1, #0
	str r0, [sp]
	ldr r0, [r4, #0x10]
	mov r2, #0xa
	add r3, r1, #0
	bl sub_020090B4
	b _0222E010
_0222DFB0:
	add r0, r4, #0
	add r0, #0x3c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222DFC4
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_0200DCE8
_0222DFC4:
	ldr r0, [r4, #0x10]
	bl sub_02009138
	cmp r0, #0
	bne _0222E010
	ldr r0, [r4, #0xc]
	mov r2, #0
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, _0222E01C ; =0x00007FFF
	mov r1, #0xa
	str r0, [sp]
	ldr r0, [r4, #0x10]
	add r3, r2, #0
	bl sub_020090B4
	b _0222E010
_0222DFE6:
	ldr r0, [r4, #0x10]
	bl sub_02009138
	cmp r0, #0
	bne _0222E010
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222E010
_0222DFF8:
	ldr r0, [r4, #0x14]
	bl sub_0200D9DC
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, pc}
_0222E010:
	ldr r0, [r4, #8]
	bl sub_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_0222E01C: .word 0x00007FFF
	thumb_func_end ov07_0222DEEC

	thumb_func_start ov07_0222E020
ov07_0222E020: ; 0x0222E020
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	mov r1, #0x70
	add r5, r0, #0
	str r2, [sp]
	add r6, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4]
	ldr r0, [sp]
	str r7, [r4, #4]
	str r0, [r4, #8]
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	str r6, [r4, #0x14]
	add r0, r6, #0
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl sub_0200DD54
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x64
	add r2, #0x66
	bl sub_0200DE44
	ldr r0, [r4]
	ldr r1, _0222E078 ; =ov07_0222DEEC
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222E078: .word ov07_0222DEEC
	thumb_func_end ov07_0222E020

	thumb_func_start ov07_0222E07C
ov07_0222E07C: ; 0x0222E07C
	push {r3, lr}
	sub sp, #8
	ldr r1, [r0, #0x50]
	cmp r1, #3
	bhi _0222E0FE
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222E092: ; jump table
	.short _0222E09A - _0222E092 - 2 ; case 0
	.short _0222E0B0 - _0222E092 - 2 ; case 1
	.short _0222E0CA - _0222E092 - 2 ; case 2
	.short _0222E0E4 - _0222E092 - 2 ; case 3
_0222E09A:
	mov r2, #0x50
	str r2, [sp]
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0
	add r0, #0x28
	add r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222E0B0:
	mov r1, #0x4f
	mvn r1, r1
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0
	add r0, #0x28
	add r2, r1, #0
	add r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222E0CA:
	mov r1, #0x50
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0
	add r2, r1, #0
	add r0, #0x28
	sub r2, #0x50
	add r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222E0E4:
	mov r1, #0x27
	mvn r1, r1
	str r1, [sp]
	mov r1, #4
	str r1, [sp, #4]
	mov r1, #0
	add r0, #0x28
	mov r2, #0x28
	add r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222E0FE:
	bl GF_AssertFail
	add sp, #8
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_0222E07C

	thumb_func_start ov07_0222E108
ov07_0222E108: ; 0x0222E108
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #6
	bhi _0222E212
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222E122: ; jump table
	.short _0222E130 - _0222E122 - 2 ; case 0
	.short _0222E14C - _0222E122 - 2 ; case 1
	.short _0222E1B8 - _0222E122 - 2 ; case 2
	.short _0222E214 - _0222E122 - 2 ; case 3
	.short _0222E276 - _0222E122 - 2 ; case 4
	.short _0222E296 - _0222E122 - 2 ; case 5
	.short _0222E2C4 - _0222E122 - 2 ; case 6
_0222E130:
	ldr r0, [r4, #0x54]
	add r0, r0, #1
	str r0, [r4, #0x54]
	cmp r0, #1
	ble _0222E212
	add r0, r4, #0
	bl ov07_0222E07C
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #0
	str r0, [r4, #0x54]
	b _0222E2DC
_0222E14C:
	add r0, r4, #0
	add r0, #0x28
	bl ov07_022222B4
	cmp r0, #0
	beq _0222E16C
	mov r2, #0x4c
	mov r3, #0x4e
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #0x24]
	add r0, #0x28
	bl ov07_0222207C
	b _0222E2DC
_0222E16C:
	ldr r0, [r4, #0x50]
	add r0, r0, #1
	str r0, [r4, #0x50]
	cmp r0, #4
	bge _0222E19C
	mov r0, #0
	str r0, [r4, #0xc]
	mov r0, #0x4c
	ldrsh r1, [r4, r0]
	mov r0, #0x28
	ldrsh r0, [r4, r0]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0x4c
	strh r1, [r0]
	mov r0, #0x4e
	ldrsh r1, [r4, r0]
	mov r0, #0x2a
	ldrsh r0, [r4, r0]
	add r1, r1, r0
	add r0, r4, #0
	add r0, #0x4e
	strh r1, [r0]
	b _0222E2DC
_0222E19C:
	ldr r0, [r4, #0xc]
	mov r1, #1
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #8
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x24]
	bl sub_0200DC4C
	ldr r0, [r4, #0x24]
	mov r1, #1
	bl sub_0200DC78
	b _0222E2DC
_0222E1B8:
	ldr r0, [r4, #0x54]
	sub r0, r0, #1
	str r0, [r4, #0x54]
	bpl _0222E212
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	bl ov07_0221FA78
	add r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221E6C8
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0222E2E8 ; =0x0000FFFF
	mov r1, #1
	lsl r2, r2, #0x10
	add r3, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	lsr r2, r2, #0x10
	sub r3, #9
	bl sub_02003370
	ldr r7, _0222E2E8 ; =0x0000FFFF
	mov r6, #0
	add r5, r4, #0
_0222E1F8:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _0222E20A
	mov r1, #0xe
	mov r2, #0x10
	mov r3, #0
	str r7, [sp]
	bl sub_020090B4
_0222E20A:
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #4
	blt _0222E1F8
_0222E212:
	b _0222E2DC
_0222E214:
	ldr r0, [r4]
	bl ov07_0221FA78
	bl sub_02003B44
	cmp r0, #0
	bne _0222E2DC
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	bl ov07_0221FA78
	add r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221E6C8
	add r2, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _0222E2E8 ; =0x0000FFFF
	mov r1, #1
	lsl r2, r2, #0x10
	add r3, r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	lsr r2, r2, #0x10
	sub r3, #9
	bl sub_02003370
	ldr r7, _0222E2E8 ; =0x0000FFFF
	mov r6, #0
	add r5, r4, #0
_0222E25A:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _0222E26C
	mov r2, #0
	mov r1, #2
	add r3, r2, #0
	str r7, [sp]
	bl sub_020090B4
_0222E26C:
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #4
	blt _0222E25A
	b _0222E2DC
_0222E276:
	ldr r0, [r4]
	bl ov07_0221FA78
	bl sub_02003B44
	cmp r0, #0
	bne _0222E2DC
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #4
	str r0, [r4, #0x54]
	str r0, [r4, #0x50]
	mov r0, #0
	str r0, [r4, #0x58]
	b _0222E2DC
_0222E296:
	ldr r0, [r4, #0x54]
	sub r0, r0, #1
	str r0, [r4, #0x54]
	bpl _0222E2DC
	mov r0, #4
	str r0, [r4, #0x54]
	ldr r0, [r4, #0x50]
	sub r0, r0, #1
	str r0, [r4, #0x50]
	bpl _0222E2B2
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222E2DC
_0222E2B2:
	ldr r0, [r4, #0x24]
	ldr r1, [r4, #0x58]
	bl sub_0200DCE8
	ldr r1, [r4, #0x58]
	mov r0, #1
	eor r0, r1
	str r0, [r4, #0x58]
	b _0222E2DC
_0222E2C4:
	ldr r0, [r4, #0x24]
	bl sub_0200D9DC
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_0222E2DC:
	ldr r0, [r4, #8]
	bl sub_0200D020
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0222E2E8: .word 0x0000FFFF
	thumb_func_end ov07_0222E108

	thumb_func_start ov07_0222E2EC
ov07_0222E2EC: ; 0x0222E2EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r1, #0
	mov r1, #0x5c
	add r4, r0, #0
	str r2, [sp, #4]
	add r7, r3, #0
	bl ov07_022324D8
	add r6, r0, #0
	str r4, [r6]
	ldr r0, [sp, #4]
	str r5, [r6, #4]
	str r0, [r6, #8]
	add r0, r4, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	str r0, [r6, #0x10]
	mov r4, #0
	add r5, r6, #0
_0222E31C:
	ldr r0, [r6]
	add r1, r4, #0
	bl ov07_0221FA48
	str r0, [r5, #0x14]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blt _0222E31C
	str r7, [r6, #0x24]
	add r0, r7, #0
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r6, #0x24]
	mov r1, #1
	bl sub_0200DD54
	add r1, r6, #0
	add r2, r6, #0
	ldr r0, [r6, #0x24]
	add r1, #0x4c
	add r2, #0x4e
	bl sub_0200DE44
	mov r1, #0x4c
	ldrsh r2, [r6, r1]
	add r0, r6, #0
	add r0, #0x4c
	sub r2, #0x28
	strh r2, [r0]
	mov r2, #0x4e
	ldrsh r3, [r6, r2]
	add r0, r6, #0
	add r0, #0x4e
	sub r3, #0x28
	strh r3, [r0]
	ldrsh r1, [r6, r1]
	ldrsh r2, [r6, r2]
	ldr r0, [r6, #0x24]
	bl sub_0200DDB8
	ldr r0, [r6, #0x24]
	mov r1, #1
	bl sub_0200E0FC
	mov r0, #0xf
	mvn r0, r0
	str r0, [r6, #0x54]
	mov r0, #0x1a
	str r0, [sp]
	ldr r0, _0222E39C ; =0x04000050
	mov r1, #0
	mov r2, #0x3f
	mov r3, #0x1f
	bl G2x_SetBlendAlpha_
	ldr r0, [r6]
	ldr r1, _0222E3A0 ; =ov07_0222E108
	add r2, r6, #0
	bl ov07_0221C410
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222E39C: .word 0x04000050
_0222E3A0: .word ov07_0222E108
	thumb_func_end ov07_0222E2EC

	thumb_func_start ov07_0222E3A4
ov07_0222E3A4: ; 0x0222E3A4
	push {r3, r4, r5, lr}
	ldr r2, _0222E3E4 ; =0x00000AAA
	add r4, r0, #0
	add r5, r1, #0
	add r0, #0x10
	mov r1, #0
	mov r3, #3
	bl ov07_02222418
	cmp r5, #0
	beq _0222E3D0
	mov r0, #0
	ldr r1, [r4, #0x18]
	mvn r0, r0
	mul r0, r1
	str r0, [r4, #0x18]
	ldr r0, [r4, #8]
	mov r1, #0xa
	mov r2, #0x10
	bl sub_020087A4
	b _0222E3DC
_0222E3D0:
	mov r1, #0xa
	add r2, r1, #0
	ldr r0, [r4, #8]
	sub r2, #0x1a
	bl sub_020087A4
_0222E3DC:
	mov r0, #0
	str r0, [r4, #0x4c]
	str r0, [r4, #0x50]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222E3E4: .word 0x00000AAA
	thumb_func_end ov07_0222E3A4

	thumb_func_start ov07_0222E3E8
ov07_0222E3E8: ; 0x0222E3E8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, [r4, #0x4c]
	mov r5, #0
	cmp r0, #3
	bhi _0222E4F2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222E402: ; jump table
	.short _0222E40A - _0222E402 - 2 ; case 0
	.short _0222E44A - _0222E402 - 2 ; case 1
	.short _0222E4A6 - _0222E402 - 2 ; case 2
	.short _0222E4F0 - _0222E402 - 2 ; case 3
_0222E40A:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_02222468
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x10]
	mov r1, #9
	bl sub_020087A4
	ldr r0, [r4, #0x50]
	sub r0, r0, #1
	str r0, [r4, #0x50]
	bpl _0222E4F2
	ldr r0, [r4, #0x4c]
	add r0, r0, #1
	str r0, [r4, #0x4c]
	mov r0, #0xe
	ldrsh r3, [r4, r0]
	mov r0, #0xc
	ldrsh r1, [r4, r0]
	add r0, r3, #2
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	mov r0, #2
	add r4, #0x24
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	bl ov07_02222268
	b _0222E4F2
_0222E44A:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_02222468
	cmp r0, #0
	beq _0222E460
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x10]
	mov r1, #9
	bl sub_020087A4
_0222E460:
	add r0, r4, #0
	ldr r1, [r4, #8]
	add r0, #0x24
	bl ov07_02222314
	cmp r0, #0
	bne _0222E4F2
	ldr r0, [r4, #0x4c]
	mov r2, #0
	add r0, r0, #1
	str r0, [r4, #0x4c]
	ldr r1, [r4, #0x10]
	add r0, r4, #0
	lsl r1, r1, #0x10
	add r0, #0x10
	asr r1, r1, #0x10
	mov r3, #3
	bl ov07_02222418
	mov r0, #0xe
	ldrsh r3, [r4, r0]
	mov r0, #0xc
	ldrsh r1, [r4, r0]
	mov r0, #2
	add r4, #0x24
	str r3, [sp]
	add r3, r3, #2
	lsl r3, r3, #0x10
	str r0, [sp, #4]
	add r0, r4, #0
	add r2, r1, #0
	asr r3, r3, #0x10
	bl ov07_02222268
	b _0222E4F2
_0222E4A6:
	add r0, r4, #0
	ldr r1, [r4, #8]
	add r0, #0x24
	bl ov07_02222314
	add r0, r4, #0
	add r0, #0x10
	bl ov07_02222468
	cmp r0, #0
	ldr r0, [r4, #8]
	beq _0222E4C8
	ldr r2, [r4, #0x10]
	mov r1, #9
	bl sub_020087A4
	b _0222E4F2
_0222E4C8:
	mov r2, #0xc
	ldrsh r2, [r4, r2]
	add r1, r5, #0
	bl sub_020087A4
	mov r2, #0xe
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_020087A4
	ldr r0, [r4, #8]
	mov r1, #9
	add r2, r5, #0
	bl sub_020087A4
	ldr r0, [r4, #0x4c]
	add r0, r0, #1
	str r0, [r4, #0x4c]
	b _0222E4F2
_0222E4F0:
	mov r5, #1
_0222E4F2:
	add r0, r5, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222E3E8

	thumb_func_start ov07_0222E4F8
ov07_0222E4F8: ; 0x0222E4F8
	push {r4, lr}
	add r4, r1, #0
	add r2, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0222E50A
	cmp r0, #1
	beq _0222E53C
	pop {r4, pc}
_0222E50A:
	add r0, r4, #0
	bl ov07_0222E3E8
	cmp r0, #0
	beq _0222E54A
	ldr r0, [r4, #0x48]
	add r0, r0, #1
	str r0, [r4, #0x48]
	cmp r0, #4
	bge _0222E534
	ldr r1, [r4, #0x54]
	mov r0, #1
	eor r1, r0
	add r0, r4, #0
	str r1, [r4, #0x54]
	bl ov07_0222E3A4
	add r0, r4, #0
	bl ov07_0222E3E8
	pop {r4, pc}
_0222E534:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222E53C:
	ldr r0, [r4, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_0222E54A:
	pop {r4, pc}
	thumb_func_end ov07_0222E4F8

	thumb_func_start ov07_0222E54C
ov07_0222E54C: ; 0x0222E54C
	push {r4, r5, r6, lr}
	mov r1, #0x58
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4, #4]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_02222004
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4A8
	cmp r0, #0
	bne _0222E598
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #8]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0xc]
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02008A78
	b _0222E5B8
_0222E598:
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #8]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0xc]
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02008A78
_0222E5B8:
	strh r0, [r4, #0xe]
	ldr r0, [r4, #8]
	mov r1, #0xb
	mov r2, #0x32
	bl sub_020087A4
	cmp r6, #1
	bne _0222E5CC
	mov r0, #0
	b _0222E5CE
_0222E5CC:
	mov r0, #1
_0222E5CE:
	str r0, [r4, #0x54]
	ldr r1, [r4, #0x54]
	add r0, r4, #0
	bl ov07_0222E3A4
	ldr r0, [r4, #4]
	ldr r1, _0222E5E4 ; =ov07_0222E4F8
	add r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0222E5E4: .word ov07_0222E4F8
	thumb_func_end ov07_0222E54C

	thumb_func_start ov07_0222E5E8
ov07_0222E5E8: ; 0x0222E5E8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x38]
	mov r5, #0
	cmp r0, #3
	bhi _0222E6A4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222E600: ; jump table
	.short _0222E608 - _0222E600 - 2 ; case 0
	.short _0222E638 - _0222E600 - 2 ; case 1
	.short _0222E65A - _0222E600 - 2 ; case 2
	.short _0222E68A - _0222E600 - 2 ; case 3
_0222E608:
	add r0, r4, #0
	ldr r1, [r4, #0xc]
	add r0, #0x10
	bl ov07_02222768
	cmp r0, #0
	beq _0222E630
	add r0, r5, #0
	str r0, [sp]
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_022226C4
	b _0222E6A4
_0222E630:
	ldr r0, [r4, #0x38]
	add r0, r0, #1
	str r0, [r4, #0x38]
	b _0222E6A4
_0222E638:
	ldr r0, [r4, #0x34]
	sub r0, r0, #1
	str r0, [r4, #0x34]
	bpl _0222E6A4
	ldr r0, [r4, #0x38]
	mov r2, #0xa
	add r0, r0, #1
	str r0, [r4, #0x38]
	mov r0, #8
	add r4, #0x10
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xf
	add r3, r2, #0
	bl ov07_02222508
	b _0222E6A4
_0222E65A:
	add r0, r4, #0
	ldr r1, [r4, #0xc]
	add r0, #0x10
	bl ov07_02222768
	cmp r0, #0
	beq _0222E682
	add r0, r5, #0
	str r0, [sp]
	ldr r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r4, #0xc]
	ldr r3, [r4, #0x24]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_022226C4
	b _0222E6A4
_0222E682:
	ldr r0, [r4, #0x38]
	add r0, r0, #1
	str r0, [r4, #0x38]
	b _0222E6A4
_0222E68A:
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r4, #0xc]
	add r2, #0xf4
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #0xc]
	add r2, #0xf3
	bl sub_020087A4
	mov r5, #1
_0222E6A4:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222E5E8

	thumb_func_start ov07_0222E6A8
ov07_0222E6A8: ; 0x0222E6A8
	push {r4, lr}
	add r4, r1, #0
	add r2, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0222E6BE
	cmp r0, #1
	beq _0222E6D4
	cmp r0, #2
	beq _0222E6E4
	pop {r4, pc}
_0222E6BE:
	add r0, r4, #0
	bl ov07_0222E5E8
	cmp r0, #0
	beq _0222E6F2
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0x10
	str r0, [r4, #8]
	pop {r4, pc}
_0222E6D4:
	ldr r0, [r4, #8]
	sub r0, r0, #1
	str r0, [r4, #8]
	bpl _0222E6F2
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, pc}
_0222E6E4:
	ldr r0, [r4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_0222E6F2:
	pop {r4, pc}
	thumb_func_end ov07_0222E6A8

	thumb_func_start ov07_0222E6F4
ov07_0222E6F4: ; 0x0222E6F4
	push {r3, r4, r5, lr}
	mov r1, #0x44
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xa
	add r0, #0x10
	add r2, r1, #0
	mov r3, #0xf
	bl ov07_02222508
	mov r0, #4
	str r0, [r4, #0x34]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
	str r0, [r4, #0x40]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_02008A78
	str r0, [r4, #0x3c]
	ldr r0, [r4]
	ldr r1, _0222E750 ; =ov07_0222E6A8
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_0222E750: .word ov07_0222E6A8
	thumb_func_end ov07_0222E6F4

	thumb_func_start ov07_0222E754
ov07_0222E754: ; 0x0222E754
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r0, [r5, #0x74]
	mov r1, #0x64
	bl _s32_div_f
	add r4, r0, #0
	ldr r0, [r5, #0x78]
	mov r1, #0x64
	bl _s32_div_f
	add r6, r0, #0
	ldr r0, [r5, #0x70]
	mov r1, #0x64
	bl _s32_div_f
	str r0, [sp]
	add r0, r5, #0
	lsl r1, r4, #0x10
	lsl r3, r6, #0x10
	add r0, #0x18
	asr r1, r1, #0x10
	mov r2, #0xa
	asr r3, r3, #0x10
	bl ov07_02222508
	ldr r0, [r5]
	mov r1, #0x10
	mov r2, #0
	bl ov07_02231E08
	ldr r0, [r5, #0x70]
	mov r1, #0x64
	bl _s32_div_f
	mov r1, #6
	str r1, [sp]
	lsl r0, r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x3c
	mov r1, #0x10
	mov r2, #0xa
	mov r3, #0
	bl ov07_02222AC4
	mov r0, #0
	str r0, [r5, #0x64]
	str r0, [r5, #0x68]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0222E754

	thumb_func_start ov07_0222E7BC
ov07_0222E7BC: ; 0x0222E7BC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x64]
	mov r5, #0
	cmp r0, #3
	bhi _0222E890
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222E7D4: ; jump table
	.short _0222E7DC - _0222E7D4 - 2 ; case 0
	.short _0222E822 - _0222E7D4 - 2 ; case 1
	.short _0222E878 - _0222E7D4 - 2 ; case 2
	.short _0222E88E - _0222E7D4 - 2 ; case 3
_0222E7DC:
	add r0, r4, #0
	ldr r1, [r4, #0x14]
	add r0, #0x18
	bl ov07_02222748
	cmp r0, #0
	bne _0222E890
	ldr r0, [r4, #0x78]
	mov r1, #0x64
	bl _s32_div_f
	add r6, r0, #0
	ldr r0, [r4, #0x74]
	mov r1, #0x64
	bl _s32_div_f
	add r7, r0, #0
	ldr r0, [r4, #0x70]
	mov r1, #0x64
	bl _s32_div_f
	str r0, [sp]
	add r0, r4, #0
	lsl r1, r6, #0x10
	lsl r3, r7, #0x10
	add r0, #0x18
	asr r1, r1, #0x10
	mov r2, #0xa
	asr r3, r3, #0x10
	bl ov07_02222508
	ldr r0, [r4, #0x64]
	add r0, r0, #1
	str r0, [r4, #0x64]
	b _0222E890
_0222E822:
	add r0, r4, #0
	ldr r1, [r4, #0x14]
	add r0, #0x18
	bl ov07_02222748
	cmp r0, #0
	bne _0222E890
	ldr r0, [r4, #0x68]
	add r0, r0, #1
	str r0, [r4, #0x68]
	cmp r0, #2
	bge _0222E870
	add r0, r5, #0
	str r0, [r4, #0x64]
	ldr r0, [r4, #0x74]
	mov r1, #0x64
	bl _s32_div_f
	add r6, r0, #0
	ldr r0, [r4, #0x78]
	mov r1, #0x64
	bl _s32_div_f
	add r7, r0, #0
	ldr r0, [r4, #0x70]
	mov r1, #0x64
	bl _s32_div_f
	lsl r1, r6, #0x10
	lsl r3, r7, #0x10
	add r4, #0x18
	str r0, [sp]
	add r0, r4, #0
	asr r1, r1, #0x10
	mov r2, #0xa
	asr r3, r3, #0x10
	bl ov07_02222508
	b _0222E890
_0222E870:
	ldr r0, [r4, #0x64]
	add r0, r0, #1
	str r0, [r4, #0x64]
	b _0222E890
_0222E878:
	add r0, r4, #0
	add r0, #0x3c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222E890
	ldr r0, [r4, #0x64]
	mov r5, #1
	add r0, r0, #1
	str r0, [r4, #0x64]
	b _0222E890
_0222E88E:
	mov r5, #1
_0222E890:
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222E7BC

	thumb_func_start ov07_0222E894
ov07_0222E894: ; 0x0222E894
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r1, [r5, #0x7c]
	mov r4, #0
	cmp r1, #0
	beq _0222E8AA
	cmp r1, #1
	beq _0222E8BC
	cmp r1, #2
	beq _0222E906
	b _0222E908
_0222E8AA:
	bl ov07_0222E754
	add r0, r5, #0
	bl ov07_0222E7BC
	ldr r0, [r5, #0x7c]
	add r0, r0, #1
	str r0, [r5, #0x7c]
	b _0222E908
_0222E8BC:
	bl ov07_0222E7BC
	cmp r0, #0
	beq _0222E908
	ldr r0, [r5, #0x6c]
	sub r0, r0, #1
	str r0, [r5, #0x6c]
	bmi _0222E8FC
	ldr r0, [r5, #0x70]
	mov r1, #3
	bl _s32_div_f
	ldr r1, [r5, #0x70]
	sub r0, r1, r0
	str r0, [r5, #0x70]
	ldr r0, [r5, #0x74]
	mov r1, #3
	bl _s32_div_f
	ldr r1, [r5, #0x74]
	sub r0, r1, r0
	str r0, [r5, #0x74]
	ldr r0, [r5, #0x78]
	mov r1, #3
	bl _s32_div_f
	ldr r1, [r5, #0x78]
	sub r0, r1, r0
	str r0, [r5, #0x78]
	add r0, r4, #0
	str r0, [r5, #0x7c]
	b _0222E908
_0222E8FC:
	ldr r0, [r5, #0x7c]
	mov r4, #1
	add r0, r0, #1
	str r0, [r5, #0x7c]
	b _0222E908
_0222E906:
	mov r4, #1
_0222E908:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222E894

	thumb_func_start ov07_0222E90C
ov07_0222E90C: ; 0x0222E90C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bls _0222E91C
	b _0222EA3C
_0222E91C:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222E928: ; jump table
	.short _0222E932 - _0222E928 - 2 ; case 0
	.short _0222E978 - _0222E928 - 2 ; case 1
	.short _0222E9D8 - _0222E928 - 2 ; case 2
	.short _0222EA08 - _0222E928 - 2 ; case 3
	.short _0222EA24 - _0222E928 - 2 ; case 4
_0222E932:
	add r0, r4, #0
	bl ov07_0222E894
	cmp r0, #0
	beq _0222EA3C
	ldr r0, [r4, #0xc]
	mov r1, #0
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #0x1e
	str r0, [r4, #0x10]
	ldr r0, [r4, #0x14]
	bl sub_0200DC4C
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl sub_0200DC78
	mov r1, #0xfe
	lsl r1, r1, #0x16
	ldr r0, [r4, #0x14]
	add r2, r1, #0
	bl sub_0200E024
	mov r1, #0
	mov r2, #0x10
	str r1, [sp]
	mov r0, #4
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x3c
	add r3, r2, #0
	bl ov07_02222AC4
	b _0222EA3C
_0222E978:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _0222E996
	mov r0, #1
	str r0, [sp]
	mov r0, #8
	mov r1, #0x10
	mov r2, #0
	mov r3, #0xd
	bl sub_0200B484
	mov r0, #0
	mvn r0, r0
	str r0, [r4, #0x10]
	b _0222E99C
_0222E996:
	ble _0222E99C
	sub r0, r0, #1
	str r0, [r4, #0x10]
_0222E99C:
	mov r0, #0
	ldr r1, [r4, #0x10]
	mvn r0, r0
	cmp r1, r0
	bne _0222E9C6
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	beq _0222E9C6
	mov r0, #1
	str r0, [sp]
	mov r0, #8
	mov r1, #0
	mov r2, #0x10
	mov r3, #0xd
	bl sub_0200B484
	mov r0, #1
	mvn r0, r0
	str r0, [r4, #0x10]
_0222E9C6:
	ldr r0, [r4, #0x14]
	bl sub_0200DCA0
	cmp r0, #0
	bne _0222EA3C
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222EA3C
_0222E9D8:
	mov r0, #1
	bl sub_0200B5C0
	cmp r0, #0
	beq _0222EA3C
	ldr r0, [r4, #0xc]
	mov r1, #0x10
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	mov r2, #0
	bl ov07_02231E08
	mov r1, #0x10
	mov r2, #0
	str r1, [sp]
	mov r0, #8
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x3c
	add r3, r2, #0
	bl ov07_02222AC4
	b _0222EA3C
_0222EA08:
	add r0, r4, #0
	add r0, #0x3c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222EA3C
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222EA3C
_0222EA24:
	ldr r0, [r4, #0x14]
	bl sub_0200D9DC
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, pc}
_0222EA3C:
	ldr r0, [r4, #8]
	bl sub_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0222E90C

	thumb_func_start ov07_0222EA48
ov07_0222EA48: ; 0x0222EA48
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	mov r1, #0x80
	add r6, r0, #0
	str r2, [sp]
	add r5, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r6, [r4]
	ldr r0, [sp]
	str r7, [r4, #4]
	str r0, [r4, #8]
	str r5, [r4, #0x14]
	add r0, r5, #0
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [r4, #0x14]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #0x14]
	mov r1, #4
	bl sub_0200DCC0
	mov r0, #3
	str r0, [r4, #0x6c]
	mov r0, #0x19
	lsl r0, r0, #4
	str r0, [r4, #0x70]
	ldr r0, _0222EAAC ; =0x000005DC
	ldr r1, _0222EAB0 ; =ov07_0222E90C
	str r0, [r4, #0x74]
	mov r0, #0xfa
	lsl r0, r0, #2
	str r0, [r4, #0x78]
	ldr r0, [r4]
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222EAAC: .word 0x000005DC
_0222EAB0: .word ov07_0222E90C
	thumb_func_end ov07_0222EA48

	thumb_func_start ov07_0222EAB4
ov07_0222EAB4: ; 0x0222EAB4
	push {r3, lr}
	sub sp, #8
	ldr r1, [r0, #0x34]
	cmp r1, #3
	bhi _0222EAFC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0222EACA: ; jump table
	.short _0222EAD2 - _0222EACA - 2 ; case 0
	.short _0222EAEA - _0222EACA - 2 ; case 1
	.short _0222EAD2 - _0222EACA - 2 ; case 2
	.short _0222EAEA - _0222EACA - 2 ; case 3
_0222EAD2:
	mov r1, #0x20
	str r1, [sp]
	mov r1, #6
	str r1, [sp, #4]
	mov r1, #0
	add r0, #0x10
	add r2, r1, #0
	add r3, r1, #0
	bl ov07_02222268
	add sp, #8
	pop {r3, pc}
_0222EAEA:
	mov r1, #0
	str r1, [sp]
	mov r2, #6
	str r2, [sp, #4]
	add r0, #0x10
	add r2, r1, #0
	mov r3, #0x20
	bl ov07_02222268
_0222EAFC:
	add sp, #8
	pop {r3, pc}
	thumb_func_end ov07_0222EAB4

	thumb_func_start ov07_0222EB00
ov07_0222EB00: ; 0x0222EB00
	push {r4, lr}
	add r4, r1, #0
	add r2, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _0222EB16
	cmp r0, #1
	beq _0222EB24
	cmp r0, #2
	beq _0222EB5C
	pop {r4, pc}
_0222EB16:
	add r0, r4, #0
	bl ov07_0222EAB4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222EB24:
	add r0, r4, #0
	add r0, #0x10
	bl ov07_022222B4
	cmp r0, #0
	beq _0222EB44
	mov r2, #0xc
	mov r3, #0xe
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	ldr r1, [r4, #8]
	add r0, #0x10
	bl ov07_022220B8
	pop {r4, pc}
_0222EB44:
	ldr r0, [r4, #0x34]
	add r0, r0, #1
	str r0, [r4, #0x34]
	cmp r0, #4
	bge _0222EB54
	mov r0, #0
	str r0, [r4]
	pop {r4, pc}
_0222EB54:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222EB5C:
	ldr r0, [r4, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov07_0222EB00

	thumb_func_start ov07_0222EB6C
ov07_0222EB6C: ; 0x0222EB6C
	push {r3, r4, r5, lr}
	mov r1, #0x38
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4, #4]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #8]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0xc]
	ldr r0, [r4, #8]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0xe]
	mov r0, #0
	str r0, [r4, #0x34]
	ldr r0, [r4, #4]
	ldr r1, _0222EBAC ; =ov07_0222EB00
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0222EBAC: .word ov07_0222EB00
	thumb_func_end ov07_0222EB6C

	thumb_func_start ov07_0222EBB0
ov07_0222EBB0: ; 0x0222EBB0
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	add r2, r0, #0
	ldr r0, [r4]
	cmp r0, #6
	bhi _0222EC12
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222EBCA: ; jump table
	.short _0222EBD8 - _0222EBCA - 2 ; case 0
	.short _0222EBF6 - _0222EBCA - 2 ; case 1
	.short _0222EC6E - _0222EBCA - 2 ; case 2
	.short _0222ECB2 - _0222EBCA - 2 ; case 3
	.short _0222ECF0 - _0222EBCA - 2 ; case 4
	.short _0222ED38 - _0222EBCA - 2 ; case 5
	.short _0222ED68 - _0222EBCA - 2 ; case 6
_0222EBD8:
	add r0, r4, #0
	add r0, #0x14
	mov r1, #1
	mov r2, #0x40
	bl ov07_02222A44
	ldr r1, [r4, #0x20]
	ldr r0, [r4, #8]
	add sp, #8
	mul r0, r1
	str r0, [r4, #0x20]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222EBF6:
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	mov r1, #0x10
	add r0, r4, #0
	add r2, #8
	lsl r2, r2, #0x10
	ldrsh r1, [r4, r1]
	ldr r3, [r4, #0xc]
	add r0, #0x14
	asr r2, r2, #0x10
	bl ov07_02222240
	cmp r0, #0
	beq _0222EC14
_0222EC12:
	b _0222ED76
_0222EC14:
	mov r2, #0x10
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x12
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_020087A4
	mov r0, #0x10
	ldrsh r1, [r4, r0]
	mov r3, #0
	mov r0, #2
	add r2, r1, #0
	str r3, [sp]
	add r2, #0x20
	str r0, [sp, #4]
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x14
	asr r2, r2, #0x10
	bl ov07_02222268
	ldr r1, [r4, #0x1c]
	ldr r0, [r4, #8]
	mul r0, r1
	str r0, [r4, #0x1c]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	add r0, r4, #0
	add r0, #0x14
	bl ov07_022222B4
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_020087A4
	add sp, #8
	pop {r4, pc}
_0222EC6E:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_022222B4
	cmp r0, #0
	beq _0222EC8A
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0xc]
	mov r1, #0
	bl sub_020087A4
	add sp, #8
	pop {r4, pc}
_0222EC8A:
	mov r0, #0x3c
	ldrsh r1, [r4, r0]
	mov r3, #0
	mov r0, #2
	str r3, [sp]
	str r0, [sp, #4]
	ldr r2, [r4, #8]
	add r0, r4, #0
	lsl r2, r2, #5
	add r2, r1, r2
	lsl r2, r2, #0x10
	add r0, #0x40
	asr r2, r2, #0x10
	bl ov07_02222268
	ldr r0, [r4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222ECB2:
	add r0, r4, #0
	add r0, #0x40
	bl ov07_022222B4
	cmp r0, #0
	beq _0222ECCE
	mov r2, #0x40
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x38]
	mov r1, #0
	bl sub_020087A4
	add sp, #8
	pop {r4, pc}
_0222ECCE:
	mov r3, #0
	str r3, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r1, #0x14
	mov r2, #0x10
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	add r0, #0x14
	bl ov07_02222268
	ldr r0, [r4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222ECF0:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_022222B4
	cmp r0, #0
	ldr r0, [r4, #0xc]
	beq _0222ED0C
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	mov r1, #0
	bl sub_020087A4
	add sp, #8
	pop {r4, pc}
_0222ED0C:
	mov r2, #0x10
	ldrsh r2, [r4, r2]
	mov r1, #0
	bl sub_020087A4
	mov r3, #0
	str r3, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r1, #0x40
	mov r2, #0x3c
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	add r0, #0x40
	bl ov07_02222268
	ldr r0, [r4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222ED38:
	add r0, r4, #0
	add r0, #0x40
	bl ov07_022222B4
	cmp r0, #0
	ldr r0, [r4, #0x38]
	beq _0222ED54
	mov r2, #0x40
	ldrsh r2, [r4, r2]
	mov r1, #0
	bl sub_020087A4
	add sp, #8
	pop {r4, pc}
_0222ED54:
	mov r2, #0x3c
	ldrsh r2, [r4, r2]
	mov r1, #0
	bl sub_020087A4
	ldr r0, [r4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4]
	pop {r4, pc}
_0222ED68:
	ldr r0, [r4, #4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_0222ED76:
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0222EBB0

	thumb_func_start ov07_0222ED7C
ov07_0222ED7C: ; 0x0222ED7C
	push {r3, r4, r5, lr}
	mov r1, #0x64
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4, #4]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_02222004
	str r0, [r4, #8]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0xc]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0x12]
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4, #4]
	bl ov07_0221FA48
	str r0, [r4, #0x38]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0x3c]
	ldr r0, [r4, #0x38]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0x3e]
	ldr r0, [r4, #4]
	ldr r1, _0222EDEC ; =ov07_0222EBB0
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_0222EDEC: .word ov07_0222EBB0
	thumb_func_end ov07_0222ED7C

	thumb_func_start ov07_0222EDF0
ov07_0222EDF0: ; 0x0222EDF0
	push {lr}
	sub sp, #0xc
	mov r1, #0
	str r1, [r0, #0x40]
	mov r1, #8
	str r1, [sp]
	mov r1, #0xa
	str r1, [sp, #4]
	mov r2, #2
	str r2, [sp, #8]
	add r0, #0x1c
	mov r2, #9
	add r3, r1, #0
	bl ov07_02222590
	add sp, #0xc
	pop {pc}
	.balign 4, 0
	thumb_func_end ov07_0222EDF0

	thumb_func_start ov07_0222EE14
ov07_0222EE14: ; 0x0222EE14
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #0x40]
	mov r5, #0
	cmp r0, #3
	bhi _0222EF06
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222EE2E: ; jump table
	.short _0222EE36 - _0222EE2E - 2 ; case 0
	.short _0222EE7C - _0222EE2E - 2 ; case 1
	.short _0222EEBE - _0222EE2E - 2 ; case 2
	.short _0222EF04 - _0222EE2E - 2 ; case 3
_0222EE36:
	add r0, r4, #0
	ldr r1, [r4, #0x18]
	add r0, #0x1c
	bl ov07_02222788
	cmp r0, #0
	beq _0222EE5A
	add r0, r5, #0
	str r0, [sp]
	mov r1, #0x44
	mov r2, #0x46
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	ldr r3, [r4, #0x30]
	bl ov07_022226C4
	b _0222EF06
_0222EE5A:
	ldr r0, [r4, #0x40]
	mov r1, #9
	add r0, r0, #1
	str r0, [r4, #0x40]
	mov r0, #0xf
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	mov r0, #2
	add r4, #0x1c
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #0xb
	mov r3, #8
	bl ov07_02222590
	b _0222EF06
_0222EE7C:
	add r0, r4, #0
	ldr r1, [r4, #0x18]
	add r0, #0x1c
	bl ov07_02222788
	cmp r0, #0
	beq _0222EEA0
	add r0, r5, #0
	str r0, [sp]
	mov r1, #0x44
	mov r2, #0x46
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	ldr r3, [r4, #0x30]
	bl ov07_022226C4
	b _0222EF06
_0222EEA0:
	ldr r0, [r4, #0x40]
	mov r2, #0xa
	add r0, r0, #1
	str r0, [r4, #0x40]
	str r2, [sp]
	str r2, [sp, #4]
	mov r0, #2
	add r4, #0x1c
	str r0, [sp, #8]
	add r0, r4, #0
	mov r1, #0xb
	mov r3, #0xf
	bl ov07_02222590
	b _0222EF06
_0222EEBE:
	add r0, r4, #0
	ldr r1, [r4, #0x18]
	add r0, #0x1c
	bl ov07_02222788
	cmp r0, #0
	beq _0222EEE2
	add r0, r5, #0
	str r0, [sp]
	mov r1, #0x44
	mov r2, #0x46
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x18]
	ldr r3, [r4, #0x30]
	bl ov07_022226C4
	b _0222EF06
_0222EEE2:
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r4, #0x18]
	add r2, #0xf4
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #0x18]
	add r2, #0xf3
	bl sub_020087A4
	ldr r0, [r4, #0x40]
	mov r5, #1
	add r0, r0, #1
	str r0, [r4, #0x40]
	b _0222EF06
_0222EF04:
	mov r5, #1
_0222EF06:
	add r0, r5, #0
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_0222EE14

	thumb_func_start ov07_0222EF0C
ov07_0222EF0C: ; 0x0222EF0C
	push {r3, r4, r5, lr}
	add r4, r2, #0
	mov r2, #0
	str r2, [r1]
	add r5, r0, #0
	mov r1, #0x64
	bl sub_0200DD68
	add r0, r5, #0
	mov r1, #1
	bl sub_0200DD54
	add r0, r5, #0
	mov r1, #1
	bl sub_0200DCE8
	add r0, r5, #0
	mov r1, #1
	bl sub_0200DC78
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0200DC8C
	add r0, r5, #0
	mov r1, #0
	bl sub_0200DC4C
	add r0, r5, #0
	mov r1, #0
	bl sub_0200DCC0
	mov r1, #0x37
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl sub_0200DC34
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222EF0C

	thumb_func_start ov07_0222EF58
ov07_0222EF58: ; 0x0222EF58
	push {r3, r4, r5, lr}
	add r5, r1, #0
	ldr r1, [r5]
	mov r4, #0
	cmp r1, #0
	beq _0222EF6A
	cmp r1, #1
	beq _0222EF7C
	b _0222EF80
_0222EF6A:
	bl sub_0200DCA0
	cmp r0, #0
	bne _0222EF82
	ldr r0, [r5]
	mov r4, #1
	add r0, r0, #1
	str r0, [r5]
	b _0222EF82
_0222EF7C:
	mov r4, #1
	b _0222EF82
_0222EF80:
	mov r4, #1
_0222EF82:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0222EF58

	thumb_func_start ov07_0222EF88
ov07_0222EF88: ; 0x0222EF88
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r0, #0
	ldr r0, [r6, #0xc]
	cmp r0, #5
	bls _0222EF96
	b _0222F0A8
_0222EF96:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222EFA2: ; jump table
	.short _0222EFAE - _0222EFA2 - 2 ; case 0
	.short _0222EFD2 - _0222EFA2 - 2 ; case 1
	.short _0222F00A - _0222EFA2 - 2 ; case 2
	.short _0222F03A - _0222EFA2 - 2 ; case 3
	.short _0222F060 - _0222EFA2 - 2 ; case 4
	.short _0222F086 - _0222EFA2 - 2 ; case 5
_0222EFAE:
	add r0, r6, #0
	bl ov07_0222EDF0
	ldr r0, [r6, #0x10]
	add r1, r6, #0
	lsl r2, r0, #2
	add r0, r6, r2
	add r1, #0x60
	add r1, r1, r2
	mov r2, #2
	ldr r0, [r0, #0x48]
	lsl r2, r2, #0xc
	bl ov07_0222EF0C
	ldr r0, [r6, #0xc]
	add r0, r0, #1
	str r0, [r6, #0xc]
	b _0222F0A8
_0222EFD2:
	add r0, r6, #0
	bl ov07_0222EE14
	add r4, r0, #0
	ldr r0, [r6, #0x10]
	add r1, r6, #0
	lsl r2, r0, #2
	add r0, r6, r2
	add r1, #0x60
	ldr r0, [r0, #0x48]
	add r1, r1, r2
	bl ov07_0222EF58
	cmp r4, r0
	bne _0222F0A8
	cmp r4, #1
	bne _0222F0A8
	ldr r0, [r6, #0x10]
	mov r1, #1
	lsl r0, r0, #2
	add r0, r6, r0
	ldr r0, [r0, #0x48]
	bl sub_0200DC4C
	ldr r0, [r6, #0xc]
	add r0, r0, #1
	str r0, [r6, #0xc]
	b _0222F0A8
_0222F00A:
	ldr r0, [r6, #0x10]
	add r2, r6, #0
	add r2, #0x78
	lsl r1, r0, #2
	ldr r0, [r2, r1]
	sub r0, r0, #1
	str r0, [r2, r1]
	ldr r1, [r6, #0x10]
	lsl r0, r1, #2
	add r0, r6, r0
	ldr r0, [r0, #0x78]
	cmp r0, #0
	bge _0222F0A8
	add r0, r1, #1
	str r0, [r6, #0x10]
	cmp r0, #6
	bge _0222F032
	mov r0, #0
	str r0, [r6, #0xc]
	b _0222F0A8
_0222F032:
	ldr r0, [r6, #0xc]
	add r0, r0, #1
	str r0, [r6, #0xc]
	b _0222F0A8
_0222F03A:
	add r4, r6, #0
	mov r7, #0
	add r4, #0x60
	add r5, r6, #0
_0222F042:
	mov r2, #2
	ldr r0, [r5, #0x48]
	add r1, r4, #0
	lsl r2, r2, #0xc
	bl ov07_0222EF0C
	add r7, r7, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #6
	blt _0222F042
	ldr r0, [r6, #0xc]
	add r0, r0, #1
	str r0, [r6, #0xc]
	b _0222F0A8
_0222F060:
	add r4, r6, #0
	mov r7, #0
	add r4, #0x60
	add r5, r6, #0
_0222F068:
	ldr r0, [r5, #0x48]
	add r1, r4, #0
	bl ov07_0222EF58
	add r7, r7, #1
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #6
	blt _0222F068
	cmp r0, #1
	bne _0222F0A8
	ldr r0, [r6, #0xc]
	add r0, r0, #1
	str r0, [r6, #0xc]
	b _0222F0A8
_0222F086:
	mov r5, #0
	add r4, r6, #0
_0222F08A:
	ldr r0, [r4, #0x48]
	bl sub_0200D9DC
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #6
	blt _0222F08A
	ldr r0, [r6]
	add r1, r7, #0
	bl ov07_0221C448
	add r0, r6, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_0222F0A8:
	ldr r0, [r6, #8]
	bl sub_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222EF88

	thumb_func_start ov07_0222F0B0
ov07_0222F0B0: ; 0x0222F0B0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x50
	str r1, [sp]
	mov r1, #0x90
	add r4, r0, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl ov07_022324D8
	ldr r1, [sp]
	str r4, [r0]
	str r1, [r0, #4]
	ldr r1, [sp, #4]
	str r0, [sp, #0x14]
	str r1, [r0, #8]
	ldr r0, [r0]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	bl ov07_0221FA48
	ldr r1, [sp, #0x14]
	str r0, [r1, #0x18]
	mov r1, #0
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	ldr r0, [sp, #0x14]
	mov r1, #1
	ldr r0, [r0, #0x18]
	bl sub_02008A78
	ldr r1, [sp, #0x14]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add r1, #0x44
	str r0, [sp, #0xc]
	strh r0, [r1]
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [sp, #0x14]
	ldr r0, [r0]
	bl ov07_0221FAA0
	ldr r1, [sp, #0x14]
	add r1, #0x46
	strh r0, [r1]
	ldr r1, [sp, #0x14]
	add r0, sp, #0x1c
	ldr r1, [r1]
	bl ov07_0221F9E8
	ldr r5, [sp, #0x14]
	mov r4, #0
_0222F128:
	cmp r4, #0
	bne _0222F130
	ldr r0, [sp, #8]
	b _0222F13A
_0222F130:
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, sp, #0x1c
	bl sub_0200D734
_0222F13A:
	str r0, [r5, #0x48]
	ldr r0, [r5, #0x48]
	mov r1, #0
	bl sub_0200DCE8
	lsr r0, r4, #0x1f
	add r0, r4, r0
	asr r1, r0, #1
	ldr r0, _0222F200 ; =0x00001555
	mov r2, #3
	mul r0, r1
	asr r0, r0, #4
	lsl r0, r0, #2
	ldr r1, _0222F204 ; =FX_SinCosTable_
	str r0, [sp, #0x18]
	add r1, r1, r0
	mov r0, #2
	ldrsh r0, [r1, r0]
	lsl r2, r2, #0x10
	mov r3, #0
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	lsl r2, r2, #0xa
	add r2, r0, r2
	ldr r0, _0222F208 ; =0x00000000
	adc r1, r0
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	lsl r0, r1, #4
	asr r6, r0, #0x10
	mov r2, #3
	ldr r1, _0222F204 ; =FX_SinCosTable_
	ldr r0, [sp, #0x18]
	lsl r2, r2, #0x10
	ldrsh r0, [r1, r0]
	mov r3, #0
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	lsl r2, r2, #0xa
	add r0, r0, r2
	ldr r2, _0222F208 ; =0x00000000
	adc r1, r2
	lsl r1, r1, #0x14
	lsr r0, r0, #0xc
	orr r0, r1
	lsl r0, r0, #4
	asr r0, r0, #0x10
	str r0, [sp, #0x10]
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1f
	sub r1, r1, r2
	mov r0, #0x1f
	ror r1, r0
	add r0, r2, r1
	bne _0222F1C2
	add r0, r7, r6
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, [r5, #0x48]
	mov r1, #1
	bl sub_0200E0C0
	b _0222F1C8
_0222F1C2:
	sub r0, r7, r6
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
_0222F1C8:
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x10]
	sub r0, r1, r0
	lsl r0, r0, #0x10
	asr r2, r0, #0x10
	ldr r0, [r5, #0x48]
	add r1, r6, #0
	bl sub_0200DDB8
	cmp r4, #2
	bge _0222F1E2
	mov r0, #8
	b _0222F1E4
_0222F1E2:
	mov r0, #0
_0222F1E4:
	add r4, r4, #1
	str r0, [r5, #0x78]
	add r5, r5, #4
	cmp r4, #6
	blt _0222F128
	ldr r0, [sp, #0x14]
	ldr r1, _0222F20C ; =ov07_0222EF88
	ldr r0, [r0]
	ldr r2, [sp, #0x14]
	bl ov07_0221C410
	add sp, #0x50
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F200: .word 0x00001555
_0222F204: .word FX_SinCosTable_
_0222F208: .word 0x00000000
_0222F20C: .word ov07_0222EF88
	thumb_func_end ov07_0222F0B0

	thumb_func_start ov07_0222F210
ov07_0222F210: ; 0x0222F210
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #5
	bhi _0222F250
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222F22A: ; jump table
	.short _0222F236 - _0222F22A - 2 ; case 0
	.short _0222F246 - _0222F22A - 2 ; case 1
	.short _0222F2A6 - _0222F22A - 2 ; case 2
	.short _0222F302 - _0222F22A - 2 ; case 3
	.short _0222F332 - _0222F22A - 2 ; case 4
	.short _0222F356 - _0222F22A - 2 ; case 5
_0222F236:
	ldr r0, [r4, #0x5c]
	mov r1, #1
	bl sub_0200DC78
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222F36E
_0222F246:
	ldr r0, [r4, #0x5c]
	bl sub_0200DCA0
	cmp r0, #0
	beq _0222F252
_0222F250:
	b _0222F36E
_0222F252:
	ldr r0, [r4, #0x5c]
	mov r1, #0
	bl sub_0200DC78
	ldr r0, [r4, #0xc]
	mov r1, #0xa
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #8
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x14
	add r2, r1, #0
	mov r3, #0
	bl ov07_02222508
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_02008A78
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008A78
	add r3, r0, #0
	mov r0, #0x8a
	ldrsh r0, [r4, r0]
	lsl r1, r5, #0x10
	lsl r3, r3, #0x10
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r2, #0x88
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	add r0, #0x38
	asr r1, r1, #0x10
	asr r3, r3, #0x10
	bl ov07_02222268
	b _0222F36E
_0222F2A6:
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	add r0, #0x38
	bl ov07_02222314
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	add r0, #0x14
	bl ov07_02222768
	cmp r0, #0
	bne _0222F36E
	ldr r0, [r4, #0x10]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r4, #0x10]
	add r2, #0xf4
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #0x10]
	add r2, #0xf3
	bl sub_020087A4
	ldr r0, [r4, #0x5c]
	mov r1, #1
	bl sub_0200DC4C
	mov r1, #1
	ldr r0, [r4, #0x5c]
	lsl r1, r1, #0xc
	bl sub_0200DC8C
	ldr r0, [r4, #0x5c]
	mov r1, #1
	bl sub_0200DC78
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222F36E
_0222F302:
	ldr r0, [r4, #0x5c]
	bl sub_0200DCA0
	cmp r0, #0
	bne _0222F36E
	ldr r0, [r4, #0x5c]
	mov r1, #0
	bl sub_0200DC78
	ldr r0, [r4, #0xc]
	mov r1, #0
	add r0, r0, #1
	str r0, [r4, #0xc]
	str r1, [sp]
	mov r0, #8
	str r0, [sp, #4]
	mov r3, #0x8a
	add r0, r4, #0
	ldrsh r3, [r4, r3]
	add r0, #0x60
	add r2, r1, #0
	bl ov07_02222268
	b _0222F36E
_0222F332:
	add r0, r4, #0
	add r0, #0x60
	bl ov07_022222B4
	cmp r0, #0
	beq _0222F34E
	mov r1, #0x88
	mov r2, #0x62
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x5c]
	bl sub_0200DDB8
	b _0222F36E
_0222F34E:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222F36E
_0222F356:
	ldr r0, [r4, #0x5c]
	bl sub_0200D9DC
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, pc}
_0222F36E:
	ldr r0, [r4, #8]
	bl sub_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_0222F210

	thumb_func_start ov07_0222F378
ov07_0222F378: ; 0x0222F378
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	mov r1, #0x8c
	add r5, r0, #0
	str r2, [sp]
	add r6, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4]
	ldr r0, [sp]
	str r7, [r4, #4]
	str r0, [r4, #8]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	mov r1, #6
	mov r2, #0
	str r0, [r4, #0x10]
	bl sub_020087A4
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #0
	bl ov07_02221F80
	add r1, r4, #0
	add r1, #0x88
	strh r0, [r1]
	add r0, r5, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r5, #0
	mov r2, #1
	bl ov07_02221F80
	add r1, r4, #0
	add r1, #0x8a
	strh r0, [r1]
	str r6, [r4, #0x5c]
	add r0, r6, #0
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x5c]
	mov r1, #1
	bl sub_0200DD54
	mov r1, #0x88
	mov r2, #0x8a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x5c]
	bl sub_0200DDB8
	ldr r0, [r4]
	ldr r1, _0222F404 ; =ov07_0222F210
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222F404: .word ov07_0222F210
	thumb_func_end ov07_0222F378

	thumb_func_start ov07_0222F408
ov07_0222F408: ; 0x0222F408
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	add r0, r1, #0
	bl ov07_02221FF0
	mov r1, #1
	add r2, r1, #0
	lsl r2, r0
	mov r0, #0
	lsl r2, r2, #0x10
	add r4, #0xc4
	str r0, [sp]
	ldr r0, [r4]
	mov r1, #2
	lsr r2, r2, #0x10
	mov r3, #8
	bl sub_02003EA4
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov07_0222F408

	thumb_func_start ov07_0222F434
ov07_0222F434: ; 0x0222F434
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	mov r1, #0xa
	mov r0, #0x14
	str r0, [sp]
	str r1, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x28
	add r2, r1, #0
	add r3, r1, #0
	bl ov07_02222590
	mov r0, #4
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xa
	add r0, #0x4c
	add r2, r1, #0
	mov r3, #1
	bl ov07_02222508
	add r0, r4, #0
	mov r1, #0
	add r0, #0x94
	str r1, [r0]
	add r0, r4, #0
	mov r1, #6
	add r0, #0x98
	str r1, [r0]
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	add r1, r0, #0
	lsl r2, r1, #1
	ldr r1, _0222F4D0 ; =ov07_02236800
	ldr r0, [r4, #0x20]
	ldrh r1, [r1, r2]
	bl sub_0200DCE8
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl sub_0200DCE8
	add r0, r4, #0
	add r0, #0x28
	add r1, sp, #0x10
	add r2, sp, #0xc
	bl ov07_02222644
	add r0, r4, #0
	add r0, #0xc8
	ldr r0, [r0]
	cmp r0, #1
	bne _0222F4B8
	ldr r1, [sp, #0x10]
	mov r0, #0
	bl _fsub
	str r0, [sp, #0x10]
_0222F4B8:
	ldr r0, [r4, #0x18]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl sub_0200E024
	ldr r1, [r4, #0x18]
	add r0, r4, #0
	bl ov07_0222F408
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_0222F4D0: .word ov07_02236800
	thumb_func_end ov07_0222F434

	thumb_func_start ov07_0222F4D4
ov07_0222F4D4: ; 0x0222F4D4
	push {r4, r5, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r4, #0
	cmp r0, #0
	beq _0222F4F0
	cmp r0, #1
	beq _0222F578
	cmp r0, #2
	bne _0222F4EE
	b _0222F5F8
_0222F4EE:
	b _0222F5FA
_0222F4F0:
	add r0, r5, #0
	add r0, #0x28
	bl ov07_0222260C
	add r0, r5, #0
	add r0, #0x28
	add r1, sp, #0x10
	add r2, sp, #0xc
	bl ov07_02222644
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	cmp r0, #1
	bne _0222F518
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	bl _fsub
	str r0, [sp, #0x10]
_0222F518:
	ldr r0, [r5, #0x18]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl sub_0200E024
	mov r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x14]
	ldr r2, [r5, #0x10]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r5, #0x18]
	ldr r3, [r5, #0x3c]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_022226FC
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0x98
	str r1, [r0]
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	cmp r0, #0
	bge _0222F5FA
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r3, #0x14
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0x94
	str r1, [r0]
	str r3, [sp]
	mov r1, #0xa
	str r1, [sp, #4]
	mov r0, #4
	add r5, #0x28
	str r0, [sp, #8]
	add r0, r5, #0
	mov r2, #1
	bl ov07_02222590
	b _0222F5FA
_0222F578:
	add r0, r5, #0
	add r0, #0x28
	bl ov07_0222260C
	add r0, r5, #0
	add r0, #0x4c
	bl ov07_02222558
	cmp r0, #0
	beq _0222F5D6
	mov r0, #0x4c
	ldrsh r0, [r5, r0]
	add r1, sp, #0x10
	add r2, sp, #0xc
	strh r0, [r5, #0x28]
	add r0, r5, #0
	add r0, #0x28
	bl ov07_02222644
	add r0, r5, #0
	add r0, #0xc8
	ldr r0, [r0]
	cmp r0, #1
	bne _0222F5B2
	ldr r1, [sp, #0x10]
	add r0, r4, #0
	bl _fsub
	str r0, [sp, #0x10]
_0222F5B2:
	ldr r0, [r5, #0x18]
	ldr r1, [sp, #0x10]
	ldr r2, [sp, #0xc]
	bl sub_0200E024
	mov r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x14]
	ldr r2, [r5, #0x10]
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	ldr r0, [r5, #0x18]
	ldr r3, [r5, #0x3c]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl ov07_022226FC
	b _0222F5FA
_0222F5D6:
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r5, #0
	add r0, #0x94
	str r1, [r0]
	ldr r0, [r5, #0x20]
	add r1, r4, #0
	bl sub_0200DCE8
	ldr r0, [r5, #0x18]
	add r1, r4, #0
	bl sub_0200DCE8
	mov r4, #1
	b _0222F5FA
_0222F5F8:
	mov r4, #1
_0222F5FA:
	add r0, r4, #0
	add sp, #0x14
	pop {r4, r5, pc}
	thumb_func_end ov07_0222F4D4

	thumb_func_start ov07_0222F600
ov07_0222F600: ; 0x0222F600
	push {r4, lr}
	sub sp, #0x18
	add r4, r0, #0
	add r1, sp, #0xc
	ldr r0, [r4, #0x1c]
	add r1, #2
	add r2, sp, #0xc
	bl sub_0200DE44
	add r1, sp, #0xc
	mov r0, #0
	ldrsh r3, [r1, r0]
	mov r0, #2
	ldrsh r1, [r1, r0]
	mov r0, #8
	str r3, [sp]
	sub r3, #0x40
	str r0, [sp, #4]
	add r0, r4, #0
	lsl r3, r3, #0x10
	add r0, #0x70
	add r2, r1, #0
	asr r3, r3, #0x10
	bl ov07_02222268
	mov r2, #0xa
	str r2, [sp]
	str r2, [sp, #4]
	mov r0, #8
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0x28
	mov r1, #2
	mov r3, #0x14
	bl ov07_02222590
	add r0, r4, #0
	add r0, #0x28
	add r1, sp, #0x14
	add r2, sp, #0x10
	bl ov07_02222644
	add r0, r4, #0
	add r0, #0xcc
	ldr r0, [r0]
	cmp r0, #1
	bne _0222F668
	ldr r1, [sp, #0x14]
	mov r0, #0
	bl _fsub
	str r0, [sp, #0x14]
_0222F668:
	ldr r0, [r4, #0x1c]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x10]
	bl sub_0200E024
	add r0, r4, #0
	ldr r1, [r4, #0x1c]
	add r0, #0x70
	bl ov07_022222F0
	add r0, r4, #0
	mov r1, #0
	add r0, #0x94
	str r1, [r0]
	add r0, r4, #0
	mov r1, #6
	add r0, #0x98
	str r1, [r0]
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	add r1, r0, #0
	lsl r2, r1, #1
	ldr r1, _0222F6BC ; =ov07_02236800
	ldr r0, [r4, #0x24]
	ldrh r1, [r1, r2]
	bl sub_0200DCE8
	ldr r0, [r4, #0x1c]
	mov r1, #1
	bl sub_0200DCE8
	ldr r1, [r4, #0x1c]
	add r0, r4, #0
	bl ov07_0222F408
	add sp, #0x18
	pop {r4, pc}
	.balign 4, 0
_0222F6BC: .word ov07_02236800
	thumb_func_end ov07_0222F600

	thumb_func_start ov07_0222F6C0
ov07_0222F6C0: ; 0x0222F6C0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, #0x94
	ldr r0, [r0]
	mov r4, #0
	cmp r0, #0
	beq _0222F6DA
	cmp r0, #1
	beq _0222F70A
	cmp r0, #2
	beq _0222F75C
	b _0222F75E
_0222F6DA:
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r5, #0
	add r0, #0x98
	str r1, [r0]
	add r0, r5, #0
	ldr r1, [r5, #0x1c]
	add r0, #0x70
	bl ov07_022222F0
	add r0, r5, #0
	add r0, #0x98
	ldr r0, [r0]
	cmp r0, #0
	bge _0222F75E
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	add r5, #0x94
	add r0, r0, #1
	str r0, [r5]
	b _0222F75E
_0222F70A:
	add r0, r5, #0
	ldr r1, [r5, #0x1c]
	add r0, #0x70
	bl ov07_022222F0
	add r0, r5, #0
	add r0, #0x28
	bl ov07_0222260C
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x28
	add r1, sp, #4
	add r2, sp, #0
	bl ov07_02222644
	add r0, r5, #0
	add r0, #0xcc
	ldr r0, [r0]
	cmp r0, #1
	bne _0222F73E
	ldr r1, [sp, #4]
	add r0, r4, #0
	bl _fsub
	str r0, [sp, #4]
_0222F73E:
	ldr r0, [r5, #0x1c]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	bl sub_0200E024
	cmp r6, #0
	bne _0222F75E
	add r0, r5, #0
	add r0, #0x94
	ldr r0, [r0]
	add r5, #0x94
	add r0, r0, #1
	str r0, [r5]
	mov r4, #1
	b _0222F75E
_0222F75C:
	mov r4, #1
_0222F75E:
	add r0, r4, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_0222F6C0

	thumb_func_start ov07_0222F764
ov07_0222F764: ; 0x0222F764
	push {r4, lr}
	sub sp, #8
	add r4, r1, #0
	add r2, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #6
	bhi _0222F83E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222F77E: ; jump table
	.short _0222F78C - _0222F77E - 2 ; case 0
	.short _0222F7B0 - _0222F77E - 2 ; case 1
	.short _0222F7CA - _0222F77E - 2 ; case 2
	.short _0222F7E0 - _0222F77E - 2 ; case 3
	.short _0222F7F6 - _0222F77E - 2 ; case 4
	.short _0222F81C - _0222F77E - 2 ; case 5
	.short _0222F830 - _0222F77E - 2 ; case 6
_0222F78C:
	ldr r0, [r4]
	mov r1, #0
	mov r2, #0x10
	bl ov07_02231E08
	mov r2, #8
	str r2, [sp]
	add r0, r4, #0
	str r2, [sp, #4]
	add r0, #0x9c
	mov r1, #0
	mov r3, #0x10
	bl ov07_02222AC4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0222F83E
_0222F7B0:
	add r0, r4, #0
	add r0, #0x9c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222F83E
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	bl ov07_0222F434
	b _0222F83E
_0222F7CA:
	add r0, r4, #0
	bl ov07_0222F4D4
	cmp r0, #0
	beq _0222F83E
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #2
	str r0, [r4, #0xc]
	b _0222F83E
_0222F7E0:
	ldr r0, [r4, #0xc]
	sub r0, r0, #1
	str r0, [r4, #0xc]
	bpl _0222F83E
	add r0, r4, #0
	bl ov07_0222F600
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0222F83E
_0222F7F6:
	add r0, r4, #0
	bl ov07_0222F6C0
	cmp r0, #0
	beq _0222F83E
	ldr r0, [r4, #8]
	mov r1, #8
	add r0, r0, #1
	str r0, [r4, #8]
	mov r0, #0x10
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x9c
	mov r2, #0
	add r3, r1, #0
	str r1, [sp, #4]
	bl ov07_02222AC4
	b _0222F83E
_0222F81C:
	add r0, r4, #0
	add r0, #0x9c
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222F83E
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0222F83E
_0222F830:
	ldr r0, [r4]
	add r1, r2, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
_0222F83E:
	ldr r0, [r4, #4]
	bl sub_0200D020
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov07_0222F764

	thumb_func_start ov07_0222F848
ov07_0222F848: ; 0x0222F848
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r1, #0xd0
	add r6, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r6, [r4]
	add r0, r6, #0
	bl ov07_0221C514
	str r0, [r4, #4]
	ldr r0, [r4]
	bl ov07_0221FA78
	add r1, r4, #0
	add r1, #0xc4
	str r0, [r1]
	add r0, r6, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	mov r1, #0
	add r7, r0, #0
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	add r0, r7, #0
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	add r0, r7, #0
	mov r1, #0x29
	bl sub_02008A78
	sub r0, r5, r0
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	add r0, r6, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	mov r1, #0
	str r0, [sp, #4]
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r7, r0, #0x10
	ldr r0, [sp, #4]
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, [sp, #4]
	mov r1, #0x29
	bl sub_02008A78
	sub r0, r6, r0
	lsl r0, r0, #0x10
	str r5, [r4, #0x14]
	asr r6, r0, #0x10
	ldr r0, [r4]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
	str r0, [r4, #0x10]
	ldr r0, [r4]
	mov r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x18]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [r4, #0x18]
	ldr r1, [sp]
	add r2, r5, #0
	bl sub_0200DDB8
	ldr r0, [r4, #0x18]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #0x18]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x1c]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x1c]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [r4, #0x1c]
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0200DDB8
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x1c]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #0x1c]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x28
	bl sub_0200E0CC
	ldr r0, [r4]
	mov r1, #0
	bl ov07_0221FB78
	add r1, r4, #0
	add r1, #0xc8
	str r0, [r1]
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FB78
	add r1, r4, #0
	add r1, #0xcc
	str r0, [r1]
	ldr r0, [r4]
	mov r1, #2
	bl ov07_0221C4E8
	str r0, [r4, #0x20]
	ldr r0, [r4]
	mov r1, #3
	bl ov07_0221C4E8
	str r0, [r4, #0x24]
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x24]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4]
	ldr r1, _0222F9B4 ; =ov07_0222F764
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222F9B4: .word ov07_0222F764
	thumb_func_end ov07_0222F848

	thumb_func_start ov07_0222F9B8
ov07_0222F9B8: ; 0x0222F9B8
	push {r4, lr}
	sub sp, #0x20
	mov r2, #0xa
	add r4, r0, #0
	add r0, #0xf8
	mov r1, #0x19
	add r3, r2, #0
	str r2, [sp]
	bl ov07_02222508
	mov r0, #0x3a
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	mov r3, #0x38
	str r0, [sp]
	mov r0, #9
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x44]
	ldr r2, _0222FA04 ; =ov07_02222558
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x40]
	add r1, #0xf8
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x3c]
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	add r0, r4, #0
	ldrsh r3, [r4, r3]
	add r0, #0x48
	bl ov07_02222864
	add sp, #0x20
	pop {r4, pc}
	.balign 4, 0
_0222FA04: .word ov07_02222558
	thumb_func_end ov07_0222F9B8

	thumb_func_start ov07_0222FA08
ov07_0222FA08: ; 0x0222FA08
	push {r4, lr}
	sub sp, #0x20
	add r4, r0, #0
	mov r0, #6
	str r0, [sp]
	add r0, r4, #0
	mov r1, #0xa
	add r0, #0xf8
	add r2, r1, #0
	mov r3, #0x19
	bl ov07_02222508
	mov r0, #0x3a
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	mov r3, #0x38
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r0, #3
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x3c]
	ldr r2, _0222FA60 ; =ov07_02222558
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x40]
	add r1, #0xf8
	str r0, [sp, #0x14]
	ldr r0, [r4, #0x44]
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	add r0, r4, #0
	ldrsh r3, [r4, r3]
	add r0, #0x48
	bl ov07_02222864
	ldr r0, [r4, #0x3c]
	mov r1, #1
	bl sub_0200DCE8
	add sp, #0x20
	pop {r4, pc}
	.balign 4, 0
_0222FA60: .word ov07_02222558
	thumb_func_end ov07_0222FA08

	thumb_func_start ov07_0222FA64
ov07_0222FA64: ; 0x0222FA64
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bhi _0222FB1C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222FA7C: ; jump table
	.short _0222FA86 - _0222FA7C - 2 ; case 0
	.short _0222FA94 - _0222FA7C - 2 ; case 1
	.short _0222FAC2 - _0222FA7C - 2 ; case 2
	.short _0222FAE6 - _0222FA7C - 2 ; case 3
	.short _0222FAFA - _0222FA7C - 2 ; case 4
_0222FA86:
	add r0, r4, #0
	bl ov07_0222F9B8
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222FB1C
_0222FA94:
	add r0, r4, #0
	add r0, #0x48
	bl ov07_02222914
	cmp r0, #0
	bne _0222FB1C
	ldr r0, [r4, #0x3c]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4, #0xc]
	mov r1, #4
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #6
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x14
	mov r2, #0
	mov r3, #1
	bl ov07_022227A8
	b _0222FB1C
_0222FAC2:
	mov r1, #0x38
	mov r2, #0x3a
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x10]
	add r0, #0x14
	bl ov07_0222283C
	cmp r0, #0
	bne _0222FB1C
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	add r0, r4, #0
	bl ov07_0222FA08
	b _0222FB1C
_0222FAE6:
	add r0, r4, #0
	add r0, #0x48
	bl ov07_02222914
	cmp r0, #0
	bne _0222FB1C
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222FB1C
_0222FAFA:
	mov r6, #0
	add r5, r4, #0
_0222FAFE:
	ldr r0, [r5, #0x3c]
	bl sub_0200D9DC
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _0222FAFE
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r7, #0
	bl ov07_0221C448
	pop {r3, r4, r5, r6, r7, pc}
_0222FB1C:
	ldr r0, [r4, #8]
	bl sub_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222FA64

	thumb_func_start ov07_0222FB24
ov07_0222FB24: ; 0x0222FB24
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r6, r1, #0
	mov r1, #0x47
	lsl r1, r1, #2
	add r5, r0, #0
	str r2, [sp]
	add r7, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4]
	ldr r0, [sp]
	str r6, [r4, #4]
	str r0, [r4, #8]
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0x38]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0x3a]
	ldr r0, [r4, #0x10]
	mov r1, #0x29
	bl sub_02008A78
	mov r1, #0x3a
	ldrsh r1, [r4, r1]
	sub r0, r1, r0
	strh r0, [r4, #0x3a]
	add r0, sp, #4
	add r1, r5, #0
	bl ov07_0221F9E8
	mov r6, #0
	add r5, r4, #0
_0222FB80:
	cmp r6, #0
	bne _0222FB90
	add r0, r7, #0
	mov r1, #1
	str r7, [r5, #0x3c]
	bl sub_0200DC4C
	b _0222FBA2
_0222FB90:
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	add r2, sp, #4
	bl sub_0200D734
	mov r1, #1
	str r0, [r5, #0x3c]
	bl sub_0200E0FC
_0222FBA2:
	ldr r0, [r5, #0x3c]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r5, #0x3c]
	mov r1, #1
	bl sub_0200DD54
	mov r1, #0x38
	mov r2, #0x3a
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x3c]
	bl sub_0200DDB8
	ldr r0, [r5, #0x3c]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5, #0x3c]
	mov r1, #2
	bl sub_0200DF98
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #3
	blt _0222FB80
	ldr r0, [r4]
	ldr r1, _0222FBE8 ; =ov07_0222FA64
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FBE8: .word ov07_0222FA64
	thumb_func_end ov07_0222FB24

	thumb_func_start ov07_0222FBEC
ov07_0222FBEC: ; 0x0222FBEC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r7, #0
	add r6, r5, #0
	str r1, [sp, #0x10]
	add r6, #0x30
	add r4, r7, #0
_0222FBFC:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x32
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x30
	mov r1, #0
	str r0, [sp, #0xc]
	ldr r2, _0222FC3C ; =0x00007FFF
	add r0, r6, #0
	add r3, r1, #0
	bl ov07_022220FC
	ldr r0, [r5, #0x38]
	add r7, r7, #1
	add r0, r0, r4
	str r0, [r5, #0x38]
	ldr r1, [r5, #0x48]
	ldr r0, [sp, #0x10]
	add r6, #0x24
	mul r0, r1
	str r0, [r5, #0x48]
	ldr r0, _0222FC40 ; =0x00002AAA
	add r5, #0x24
	add r4, r4, r0
	cmp r7, #6
	blt _0222FBFC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0222FC3C: .word 0x00007FFF
_0222FC40: .word 0x00002AAA
	thumb_func_end ov07_0222FBEC

	thumb_func_start ov07_0222FC44
ov07_0222FC44: ; 0x0222FC44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	mov r0, #0
	str r0, [sp, #4]
	add r0, r6, #0
	str r0, [sp]
	add r0, #0x30
	str r0, [sp]
	add r5, r6, #0
	add r4, r6, #0
_0222FC5A:
	ldr r0, [sp]
	bl ov07_02222180
	ldr r1, [r5, #0x38]
	mov r2, #0xa
	lsl r0, r1, #2
	add r0, r1, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _0222FD00 ; =FX_SinCosTable_
	ldr r3, [r6, #0x14]
	ldrsh r0, [r0, r1]
	lsl r2, r2, #0xc
	mul r2, r3
	asr r1, r0, #0x1f
	asr r3, r2, #0x1f
	bl _ll_mul
	add r3, r1, #0
	mov r1, #0x13
	lsl r1, r1, #4
	mov r2, #0x30
	add r7, r0, #0
	ldrsh r1, [r6, r1]
	ldrsh r2, [r5, r2]
	ldr r0, [r4, #0x18]
	add r1, r1, r2
	ldr r2, _0222FD04 ; =0x00000132
	lsl r1, r1, #0x10
	ldrsh r2, [r6, r2]
	asr r1, r1, #0x10
	mov ip, r2
	mov r2, #2
	lsl r2, r2, #0xa
	add r7, r7, r2
	ldr r2, _0222FD08 ; =0x00000000
	adc r3, r2
	lsl r2, r3, #0x14
	lsr r3, r7, #0xc
	orr r3, r2
	lsl r2, r3, #4
	asr r2, r2, #0x10
	mov r3, ip
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r1, [r5, #0x38]
	ldr r0, _0222FD0C ; =0x00003FFF
	cmp r1, r0
	blt _0222FCD6
	ldr r0, _0222FD10 ; =0x0000BF49
	cmp r1, r0
	bgt _0222FCD6
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl sub_0200DD54
	b _0222FCE6
_0222FCD6:
	ldr r0, [r6]
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r4, #0x18]
	add r1, r1, #1
	bl sub_0200DD54
_0222FCE6:
	ldr r0, [sp]
	add r5, #0x24
	add r0, #0x24
	str r0, [sp]
	ldr r0, [sp, #4]
	add r4, r4, #4
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #6
	blt _0222FC5A
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0222FD00: .word FX_SinCosTable_
_0222FD04: .word 0x00000132
_0222FD08: .word 0x00000000
_0222FD0C: .word 0x00003FFF
_0222FD10: .word 0x0000BF49
	thumb_func_end ov07_0222FC44

	thumb_func_start ov07_0222FD14
ov07_0222FD14: ; 0x0222FD14
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bhi _0222FDFA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0222FD2E: ; jump table
	.short _0222FD38 - _0222FD2E - 2 ; case 0
	.short _0222FD6E - _0222FD2E - 2 ; case 1
	.short _0222FD8E - _0222FD2E - 2 ; case 2
	.short _0222FDBA - _0222FD2E - 2 ; case 3
	.short _0222FDD6 - _0222FD2E - 2 ; case 4
_0222FD38:
	ldr r0, [r4]
	mov r1, #1
	mov r2, #0xf
	bl ov07_02231E08
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, #0xfe
	add r0, r4, r0
	mov r1, #1
	mov r2, #0x10
	mov r3, #0xf
	bl ov07_02222AC4
	ldr r1, [r4, #0x14]
	add r0, r4, #0
	bl ov07_0222FBEC
	add r0, r4, #0
	bl ov07_0222FC44
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222FDFA
_0222FD6E:
	add r0, r4, #0
	bl ov07_0222FC44
	mov r0, #0x42
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222FDFA
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #0x1c
	str r0, [r4, #0x10]
	b _0222FDFA
_0222FD8E:
	add r0, r4, #0
	bl ov07_0222FC44
	ldr r0, [r4, #0x10]
	sub r0, r0, #1
	str r0, [r4, #0x10]
	bpl _0222FDFA
	ldr r0, [r4, #0xc]
	mov r1, #0x10
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #0xf
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, #0xfe
	add r0, r4, r0
	mov r2, #1
	mov r3, #0
	bl ov07_02222AC4
	b _0222FDFA
_0222FDBA:
	add r0, r4, #0
	bl ov07_0222FC44
	mov r0, #0x42
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov07_02222AF4
	cmp r0, #0
	beq _0222FDFA
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0222FDFA
_0222FDD6:
	mov r6, #0
	add r5, r4, #0
_0222FDDA:
	ldr r0, [r5, #0x18]
	bl sub_0200D9DC
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #6
	blt _0222FDDA
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r7, #0
	bl ov07_0221C448
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0222FDFA:
	ldr r0, [r4, #8]
	bl sub_0200D020
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0222FD14

	thumb_func_start ov07_0222FE04
ov07_0222FE04: ; 0x0222FE04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r1, #0
	mov r1, #0x4d
	lsl r1, r1, #2
	add r4, r0, #0
	str r2, [sp]
	add r7, r3, #0
	bl ov07_022324D8
	add r6, r0, #0
	str r4, [r6]
	ldr r0, [sp]
	str r5, [r6, #4]
	str r0, [r6, #8]
	add r0, r4, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	mov r1, #0
	add r5, r0, #0
	bl sub_02008A78
	mov r1, #0x13
	lsl r1, r1, #4
	strh r0, [r6, r1]
	add r0, r5, #0
	mov r1, #1
	bl sub_02008A78
	ldr r1, _0222FEA8 ; =0x00000132
	strh r0, [r6, r1]
	add r0, sp, #4
	add r1, r4, #0
	bl ov07_0221F9E8
	mov r4, #0
	add r5, r6, #0
_0222FE56:
	cmp r4, #0
	bne _0222FE5E
	str r7, [r5, #0x18]
	b _0222FE6A
_0222FE5E:
	ldr r0, [r6, #4]
	ldr r1, [r6, #8]
	add r2, sp, #4
	bl sub_0200D734
	str r0, [r5, #0x18]
_0222FE6A:
	ldr r0, [r5, #0x18]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r5, #0x18]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r5, #0x18]
	mov r1, #1
	bl sub_0200DC78
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _0222FE56
	ldr r0, [r6]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_02222004
	str r0, [r6, #0x14]
	ldr r0, [r6]
	ldr r1, _0222FEAC ; =ov07_0222FD14
	add r2, r6, #0
	bl ov07_0221C410
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FEA8: .word 0x00000132
_0222FEAC: .word ov07_0222FD14
	thumb_func_end ov07_0222FE04

	thumb_func_start ov07_0222FEB0
ov07_0222FEB0: ; 0x0222FEB0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, r1, #0
	add r1, sp, #8
	add r5, r2, #0
	add r1, #2
	add r2, sp, #8
	add r6, r0, #0
	add r4, r3, #0
	bl sub_0200DE44
	add r0, sp, #8
	mov r1, #0
	ldrsh r3, [r0, r1]
	mov r1, #2
	ldrsh r2, [r0, r1]
	lsl r0, r4, #7
	neg r0, r0
	add r0, r3, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	lsl r1, r2, #0x10
	lsl r4, r5, #8
	add r2, r2, r4
	str r0, [sp]
	mov r0, #0x3b
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	str r0, [sp, #4]
	add r0, r7, #0
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222268
	add r0, r6, #0
	mov r1, #1
	bl sub_0200DCE8
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0222FEB0

	thumb_func_start ov07_0222FF04
ov07_0222FF04: ; 0x0222FF04
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	add r0, r1, #0
	add r1, r4, #0
	bl ov07_022222F0
	cmp r0, #0
	beq _0222FFBE
	add r1, sp, #8
	add r0, r4, #0
	add r1, #2
	add r2, sp, #8
	bl sub_0200DE44
	add r1, sp, #8
	mov r0, #2
	ldrsh r0, [r1, r0]
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [sp]
	ldr r0, [sp]
	mov r2, #0xe
	mul r1, r0
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _0222FFC4 ; =FX_SinCosTable_
	lsl r2, r2, #0xc
	ldrsh r0, [r0, r1]
	mov r3, #0
	asr r7, r0, #0x1f
	add r1, r7, #0
	str r0, [sp, #4]
	bl _ll_mul
	add r3, r0, #0
	add r5, r1, #0
	add r6, sp, #8
	mov r2, #0
	ldrsh r2, [r6, r2]
	mov r6, #2
	lsl r6, r6, #0xa
	add r0, r4, #0
	add r6, r3, r6
	ldr r3, _0222FFC8 ; =0x00000000
	ldr r1, [sp]
	adc r5, r3
	lsl r3, r5, #0x14
	lsr r5, r6, #0xc
	orr r5, r3
	lsl r3, r5, #4
	asr r3, r3, #0x10
	add r2, r2, r3
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	mov r2, #0xae
	ldr r0, [sp, #4]
	add r1, r7, #0
	lsl r2, r2, #2
	mov r3, #0
	bl _ll_mul
	mov r2, #2
	mov r3, #0
	lsl r2, r2, #0xa
	add r2, r0, r2
	adc r1, r3
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	neg r0, r1
	bl _fflt
	ldr r1, _0222FFCC ; =0x45800000
	bl _fdiv
	add r1, r0, #0
	mov r0, #0xfe
	lsl r0, r0, #0x16
	bl _fadd
	add r1, r0, #0
	add r0, r4, #0
	add r2, r1, #0
	bl sub_0200E024
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0222FFBE:
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0222FFC4: .word FX_SinCosTable_
_0222FFC8: .word 0x00000000
_0222FFCC: .word 0x45800000
	thumb_func_end ov07_0222FF04

	thumb_func_start ov07_0222FFD0
ov07_0222FFD0: ; 0x0222FFD0
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x9d
	add r7, r0, #0
	lsl r1, r1, #2
	ldr r0, [r7, r1]
	cmp r0, #0xf
	bge _02230018
	sub r0, r1, #4
	ldr r0, [r7, r0]
	add r2, r0, #1
	sub r0, r1, #4
	str r2, [r7, r0]
	ldr r0, [r7, r0]
	cmp r0, #6
	ble _02230018
	mov r2, #0
	sub r0, r1, #4
	str r2, [r7, r0]
	ldr r1, [r7, r1]
	add r3, r7, #0
	lsl r0, r1, #2
	mov r2, #0x24
	add r0, r7, r0
	add r3, #0x54
	mul r2, r1
	add r1, r3, r2
	ldr r0, [r0, #0x18]
	ldr r2, [r7, #0x10]
	ldr r3, [r7, #0x14]
	bl ov07_0222FEB0
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r1, [r7, r0]
	add r1, r1, #1
	str r1, [r7, r0]
_02230018:
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	mov r4, #0
	cmp r0, #0
	ble _02230044
	add r6, r7, #0
	add r6, #0x54
	add r5, r7, #0
_0223002A:
	ldr r0, [r5, #0x18]
	add r1, r6, #0
	bl ov07_0222FF04
	str r0, [sp]
	mov r0, #0x9d
	lsl r0, r0, #2
	ldr r0, [r7, r0]
	add r4, r4, #1
	add r6, #0x24
	add r5, r5, #4
	cmp r4, r0
	blt _0223002A
_02230044:
	cmp r0, #0xf
	blt _02230052
	ldr r0, [sp]
	cmp r0, #1
	bne _02230052
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02230052:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_0222FFD0

	thumb_func_start ov07_02230058
ov07_02230058: ; 0x02230058
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r7, r0, #0
	add r0, r6, #0
	bl ov07_0222FFD0
	cmp r0, #0
	beq _0223008A
	mov r4, #0
	add r5, r6, #0
_0223006C:
	ldr r0, [r5, #0x18]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xf
	blt _0223006C
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [r6]
	add r1, r7, #0
	bl ov07_0221C448
	pop {r3, r4, r5, r6, r7, pc}
_0223008A:
	ldr r0, [r6, #8]
	bl sub_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_02230058

	thumb_func_start ov07_02230094
ov07_02230094: ; 0x02230094
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x40
	add r5, r1, #0
	mov r1, #0x9e
	lsl r1, r1, #2
	add r4, r0, #0
	str r2, [sp]
	add r7, r3, #0
	bl ov07_022324D8
	add r6, r0, #0
	str r4, [r6]
	ldr r0, [sp]
	str r5, [r6, #4]
	str r0, [r6, #8]
	add r0, r4, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	mov r1, #0
	add r5, r0, #0
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	add r0, sp, #0xc
	add r1, r4, #0
	bl ov07_0221F9E8
	mov r4, #0
	add r5, r6, #0
_022300E8:
	cmp r4, #0
	bne _022300F0
	str r7, [r5, #0x18]
	b _022300FC
_022300F0:
	ldr r0, [r6, #4]
	ldr r1, [r6, #8]
	add r2, sp, #0xc
	bl sub_0200D734
	str r0, [r5, #0x18]
_022300FC:
	ldr r0, [r5, #0x18]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r5, #0x18]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [r5, #0x18]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r5, #0x18]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5, #0x18]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	bl sub_0200DDB8
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	ldr r0, [r5, #0x18]
	bl sub_0200DC4C
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xf
	blt _022300E8
	ldr r0, [r6]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_02222004
	str r0, [r6, #0x10]
	ldr r0, [r6]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_0222202C
	str r0, [r6, #0x14]
	ldr r0, [r6]
	ldr r1, _0223016C ; =ov07_02230058
	add r2, r6, #0
	bl ov07_0221C410
	add sp, #0x40
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223016C: .word ov07_02230058
	thumb_func_end ov07_02230094

	thumb_func_start ov07_02230170
ov07_02230170: ; 0x02230170
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	beq _02230180
	cmp r1, #1
	beq _02230194
	cmp r1, #2
	beq _022301A8
	bx lr
_02230180:
	ldr r1, _022301BC ; =0x00007FFF
	str r1, [r0, #0x18]
	mov r1, #5
	str r1, [r0, #0x24]
	mov r1, #1
	lsl r1, r1, #0x10
	str r1, [r0, #0x1c]
	mov r1, #0x10
	str r1, [r0, #0x28]
	bx lr
_02230194:
	ldr r1, _022301BC ; =0x00007FFF
	str r1, [r0, #0x18]
	mov r1, #4
	mvn r1, r1
	str r1, [r0, #0x24]
	ldr r1, _022301C0 ; =0xFFFF0000
	str r1, [r0, #0x1c]
	mov r1, #0x10
	str r1, [r0, #0x28]
	bx lr
_022301A8:
	ldr r1, _022301BC ; =0x00007FFF
	str r1, [r0, #0x18]
	mov r1, #0xa
	str r1, [r0, #0x24]
	lsl r1, r1, #0xd
	str r1, [r0, #0x1c]
	mov r1, #0x10
	str r1, [r0, #0x28]
	bx lr
	nop
_022301BC: .word 0x00007FFF
_022301C0: .word 0xFFFF0000
	thumb_func_end ov07_02230170

	thumb_func_start ov07_022301C4
ov07_022301C4: ; 0x022301C4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	ldr r0, [r5, #4]
	bl ov07_02222C84
	str r0, [sp, #8]
	ldr r0, [r5, #0x10]
	str r0, [sp]
	str r0, [sp, #4]
	sub r0, #8
	str r0, [sp, #4]
	ldr r0, [sp]
	add r0, #0x58
	str r0, [sp]
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _022301EC
	mov r0, #0
	str r0, [sp, #4]
_022301EC:
	ldr r0, [sp]
	cmp r0, #0xc0
	ble _022301F6
	mov r0, #0xc0
	str r0, [sp]
_022301F6:
	mov r0, #0
	ldr r1, [r5, #0x20]
	mvn r0, r0
	mul r0, r1
	ldr r4, [sp, #4]
	str r0, [r5, #0x20]
	ldr r0, [sp]
	add r1, r4, #0
	cmp r1, r0
	bge _02230296
_0223020A:
	mov r0, #2
	tst r0, r4
	ldr r1, [r5, #0x1c]
	beq _0223021A
	ldr r0, [r5, #0x20]
	lsl r0, r0, #0xc
	add r2, r1, r0
	b _02230220
_0223021A:
	ldr r0, [r5, #0x20]
	lsl r0, r0, #0xc
	sub r2, r1, r0
_02230220:
	ldr r1, [sp, #4]
	ldr r0, [r5, #0x18]
	sub r3, r4, r1
	ldr r1, _0223029C ; =0x00000199
	mul r1, r3
	add r0, r0, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	asr r0, r0, #4
	lsl r1, r0, #2
	ldr r0, _022302A0 ; =FX_SinCosTable_
	asr r3, r2, #0x1f
	ldrsh r0, [r0, r1]
	asr r1, r0, #0x1f
	bl _ll_mul
	mov r2, #2
	lsl r2, r2, #0xa
	add r2, r0, r2
	ldr r0, _022302A4 ; =0x00000000
	adc r1, r0
	lsl r0, r1, #0x14
	lsr r1, r2, #0xc
	orr r1, r0
	lsl r0, r1, #4
	asr r7, r0, #0x10
	ldr r0, [r5, #0x14]
	ldr r1, [r5, #0x24]
	sub r0, r4, r0
	mul r0, r1
	mov r1, #0xa
	bl _s32_div_f
	add r0, r7, r0
	lsl r0, r0, #0x10
	ldr r1, [r5, #0x30]
	asr r7, r0, #0x10
	lsl r0, r1, #0x10
	lsr r1, r1, #0x10
	lsl r1, r1, #0x10
	asr r0, r0, #0x10
	asr r1, r1, #0x10
	sub r6, r4, #1
	bpl _0223027A
	add r6, #0xc0
_0223027A:
	add r0, r0, r7
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	bl ov07_02222D88
	ldr r1, [sp, #8]
	lsl r2, r6, #2
	str r0, [r1, r2]
	ldr r0, [sp]
	add r4, r4, #1
	cmp r4, r0
	blt _0223020A
_02230296:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0223029C: .word 0x00000199
_022302A0: .word FX_SinCosTable_
_022302A4: .word 0x00000000
	thumb_func_end ov07_022301C4

	thumb_func_start ov07_022302A8
ov07_022302A8: ; 0x022302A8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r6, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _022302BE
	cmp r0, #1
	beq _022302D2
	cmp r0, #2
	beq _022302FC
	pop {r4, r5, r6, pc}
_022302BE:
	add r0, r4, #0
	bl ov07_02230170
	add r0, r4, #0
	bl ov07_022301C4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
_022302D2:
	ldr r0, [r4, #0x28]
	sub r0, r0, #1
	str r0, [r4, #0x28]
	add r0, r4, #0
	bl ov07_022301C4
	ldr r0, [r4, #0x28]
	cmp r0, #0
	bge _022303A0
	ldr r0, [r4, #0x2c]
	add r0, r0, #1
	str r0, [r4, #0x2c]
	cmp r0, #3
	bge _022302F4
	mov r0, #0
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
_022302F4:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
_022302FC:
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAC8
	cmp r0, #0
	bne _02230318
	ldr r0, [r4, #0xc]
	mov r1, #6
	mov r2, #0
	bl sub_020087A4
_02230318:
	ldr r0, [r4, #4]
	bl ov07_02222C98
	ldr r0, [r4, #4]
	bl ov07_02222C60
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAEC
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FB04
	add r1, r0, #0
	lsl r0, r5, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r0, [r4]
	bl ov07_0221FAE8
	add r1, r0, #0
	lsl r1, r1, #0x18
	mov r0, #0
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAEC
	add r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221BFD0
	add r3, r0, #0
	lsl r0, r5, #0x18
	mov r1, #1
	lsr r0, r0, #0x18
	lsl r1, r1, #0xe
	mov r2, #0
	bl BG_ClearCharDataRange
	ldr r0, [r4]
	bl ov07_0221C4A0
	add r5, r0, #0
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAEC
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r6, #0
	bl ov07_0221C448
_022303A0:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_022302A8

	thumb_func_start ov07_022303A4
ov07_022303A4: ; 0x022303A4
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x34
	add r7, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r7, [r4]
	add r0, r7, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	mov r1, #0
	str r0, [r4, #0xc]
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r6, r0, #0x10
	ldr r0, [r4, #0xc]
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	ldr r0, [r4, #0xc]
	mov r1, #0x29
	bl sub_02008A78
	sub r0, r5, r0
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAC8
	cmp r0, #0
	bne _02230402
	ldr r0, [r4, #0xc]
	mov r1, #6
	mov r2, #1
	bl sub_020087A4
_02230402:
	sub r6, #0x28
	lsl r0, r6, #0x10
	str r5, [r4, #0x14]
	sub r5, #0x28
	asr r0, r0, #0x10
	neg r0, r0
	neg r1, r5
	lsl r0, r0, #0x10
	lsl r1, r1, #0x10
	str r5, [r4, #0x10]
	lsr r0, r0, #0x10
	lsr r1, r1, #0x10
	bl ov07_02222D88
	str r0, [r4, #0x30]
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAF8
	bl ov07_02222D90
	add r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221BFD0
	add r2, r0, #0
	ldr r1, [r4, #0x30]
	add r0, r5, #0
	bl ov07_02222BE4
	str r0, [r4, #4]
	mov r0, #1
	str r0, [r4, #0x20]
	add r0, r7, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_02231924
	sub r0, r0, #3
	cmp r0, #1
	bhi _0223048A
	ldr r0, [r4]
	mov r1, #1
	bl ov07_0221FAEC
	add r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAE8
	add r1, r0, #0
	lsl r0, r5, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	ldr r0, [r4]
	bl ov07_0221FAE8
	add r1, r0, #0
	add r1, r1, #1
	lsl r1, r1, #0x18
	mov r0, #0
	lsr r1, r1, #0x18
	bl SetBgPriority
_0223048A:
	ldr r0, [r4]
	ldr r1, _02230498 ; =ov07_022302A8
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230498: .word ov07_022302A8
	thumb_func_end ov07_022303A4

	thumb_func_start ov07_0223049C
ov07_0223049C: ; 0x0223049C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #5
	bls _022304AC
	b _022305F0
_022304AC:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022304B8: ; jump table
	.short _022304C4 - _022304B8 - 2 ; case 0
	.short _0223050A - _022304B8 - 2 ; case 1
	.short _02230544 - _022304B8 - 2 ; case 2
	.short _0223057E - _022304B8 - 2 ; case 3
	.short _022305CA - _022304B8 - 2 ; case 4
	.short _022305E2 - _022304B8 - 2 ; case 5
_022304C4:
	mov r2, #0
	str r2, [sp]
	mov r0, #8
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xc
	mov r1, #0x7f
	add r3, r2, #0
	bl ov07_02222268
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _022305F4 ; =0xFFFF1FFF
	and r1, r0
	lsr r0, r2, #0xd
	orr r0, r1
	str r0, [r2]
	mov r1, #0
	ldr r0, [r4]
	add r2, r1, #0
	bl ov07_02231EC0
	ldr r1, _022305F8 ; =0x04000040
	mov r0, #0xff
	strh r0, [r1]
	mov r0, #0xbf
	strh r0, [r1, #4]
	mov r0, #7
	str r0, [r4, #8]
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_0223050A:
	ldr r0, [r4, #8]
	sub r0, r0, #1
	str r0, [r4, #8]
	bpl _022305F0
	ldr r0, [r4]
	bl ov07_0221FA78
	add r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221E6C8
	add r2, r0, #0
	mov r3, #0
	lsl r2, r2, #0x10
	str r3, [sp]
	mov r0, #0x10
	str r0, [sp, #4]
	ldr r0, _022305FC ; =0x0000FFFF
	mov r1, #1
	str r0, [sp, #8]
	add r0, r5, #0
	lsr r2, r2, #0x10
	bl sub_02003370
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_02230544:
	add r0, r4, #0
	add r0, #0xc
	bl ov07_022222B4
	cmp r0, #0
	beq _02230574
	mov r0, #0xc
	ldrsh r2, [r4, r0]
	mov r0, #0x7f
	add sp, #0xc
	sub r0, r0, r2
	lsl r1, r0, #8
	mov r0, #0xff
	lsl r0, r0, #8
	add r2, #0x80
	and r1, r0
	lsl r0, r2, #0x18
	lsr r0, r0, #0x18
	orr r0, r1
	ldr r1, _022305F8 ; =0x04000040
	strh r0, [r1]
	mov r0, #0xbf
	strh r0, [r1, #4]
	pop {r4, r5, pc}
_02230574:
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_0223057E:
	ldr r0, [r4]
	bl ov07_0221FA78
	bl sub_02003B44
	cmp r0, #0
	bne _022305F0
	ldr r0, [r4, #4]
	mov r2, #1
	add r0, r0, #1
	str r0, [r4, #4]
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _022305F4 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	ldr r0, [r4]
	bl ov07_0221FA78
	add r5, r0, #0
	ldr r0, [r4]
	bl ov07_0221E6C8
	add r2, r0, #0
	mov r0, #0x10
	str r0, [sp]
	mov r3, #0
	lsl r2, r2, #0x10
	ldr r0, _022305FC ; =0x0000FFFF
	str r3, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #1
	lsr r2, r2, #0x10
	bl sub_02003370
	add sp, #0xc
	pop {r4, r5, pc}
_022305CA:
	ldr r0, [r4]
	bl ov07_0221FA78
	bl sub_02003B44
	cmp r0, #0
	bne _022305F0
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_022305E2:
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
_022305F0:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_022305F4: .word 0xFFFF1FFF
_022305F8: .word 0x04000040
_022305FC: .word 0x0000FFFF
	thumb_func_end ov07_0223049C

	thumb_func_start ov07_02230600
ov07_02230600: ; 0x02230600
	push {r4, lr}
	mov r1, #0x34
	add r4, r0, #0
	bl ov07_022324D8
	add r2, r0, #0
	ldr r1, _02230618 ; =ov07_0223049C
	add r0, r4, #0
	str r4, [r2]
	bl ov07_0221C410
	pop {r4, pc}
	.balign 4, 0
_02230618: .word ov07_0223049C
	thumb_func_end ov07_02230600

	thumb_func_start ov07_0223061C
ov07_0223061C: ; 0x0223061C
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bhi _022306CC
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230636: ; jump table
	.short _02230640 - _02230636 - 2 ; case 0
	.short _02230666 - _02230636 - 2 ; case 1
	.short _0223067A - _02230636 - 2 ; case 2
	.short _022306A0 - _02230636 - 2 ; case 3
	.short _022306B4 - _02230636 - 2 ; case 4
_02230640:
	ldr r0, [r4]
	mov r1, #0
	mov r2, #0x10
	bl ov07_02231E08
	mov r1, #0
	mov r2, #0x10
	str r1, [sp]
	mov r0, #8
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x14
	add r3, r2, #0
	bl ov07_02222AC4
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _022306CC
_02230666:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222AF4
	cmp r0, #0
	beq _022306CC
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _022306CC
_0223067A:
	ldr r0, [r4, #0x10]
	bl sub_0200DCA0
	cmp r0, #0
	bne _022306CC
	ldr r0, [r4, #0xc]
	mov r2, #0
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r1, #0x10
	str r1, [sp]
	mov r0, #8
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x14
	add r3, r2, #0
	bl ov07_02222AC4
	b _022306CC
_022306A0:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222AF4
	cmp r0, #0
	beq _022306CC
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _022306CC
_022306B4:
	ldr r0, [r4, #0x10]
	bl sub_0200D9DC
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, pc}
_022306CC:
	ldr r0, [r4, #8]
	bl sub_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0223061C

	thumb_func_start ov07_022306D8
ov07_022306D8: ; 0x022306D8
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	mov r1, #0x3c
	add r6, r0, #0
	str r2, [sp]
	add r5, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r6, [r4]
	ldr r0, [sp]
	str r7, [r4, #4]
	str r0, [r4, #8]
	str r5, [r4, #0x10]
	add r0, r5, #0
	mov r1, #1
	bl sub_0200DC78
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4]
	ldr r1, _02230710 ; =ov07_0223061C
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02230710: .word ov07_0223061C
	thumb_func_end ov07_022306D8

	thumb_func_start ov07_02230714
ov07_02230714: ; 0x02230714
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #4
	bhi _022307D8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223072E: ; jump table
	.short _02230738 - _0223072E - 2 ; case 0
	.short _022307A2 - _0223072E - 2 ; case 1
	.short _022307E4 - _0223072E - 2 ; case 2
	.short _02230850 - _0223072E - 2 ; case 3
	.short _022308A2 - _0223072E - 2 ; case 4
_02230738:
	ldr r0, [r4, #0x68]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x6c]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #0x74]
	asr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r1, [r4, #0x5c]
	ldr r2, [r4, #0x60]
	ldr r3, [r4, #0x64]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r0, #0x14
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222590
	mov r1, #0xa
	mov r2, #8
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x10]
	add r0, #0x38
	bl ov07_0222283C
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	add r0, #0x14
	bl ov07_02222788
	mov r0, #0
	str r0, [sp]
	mov r1, #8
	mov r2, #0xc
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r3, [r4, #0x28]
	bl ov07_022226C4
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_022307A2:
	mov r1, #0xa
	mov r2, #8
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x10]
	add r0, #0x38
	bl ov07_0222283C
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	add r0, #0x14
	bl ov07_02222788
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r1, #8
	mov r2, #0xc
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r3, [r4, #0x28]
	bl ov07_022226C4
	cmp r5, #0
	beq _022307DA
_022307D8:
	b _022308E0
_022307DA:
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_022307E4:
	ldr r0, [r4, #0x64]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	ldr r0, [r4, #0x6c]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #4]
	ldr r0, [r4, #0x74]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r1, [r4, #0x60]
	ldr r2, [r4, #0x5c]
	ldr r3, [r4, #0x68]
	add r0, r4, #0
	lsl r1, r1, #0x10
	lsl r2, r2, #0x10
	lsl r3, r3, #0x10
	add r0, #0x14
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222590
	mov r1, #0xa
	mov r2, #8
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x10]
	add r0, #0x38
	bl ov07_0222283C
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	add r0, #0x14
	bl ov07_02222788
	mov r0, #0
	str r0, [sp]
	mov r1, #8
	mov r2, #0xc
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r3, [r4, #0x28]
	bl ov07_022226C4
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_02230850:
	mov r1, #0xa
	mov r2, #8
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x10]
	add r0, #0x38
	bl ov07_0222283C
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	add r0, #0x14
	bl ov07_02222788
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r1, #8
	mov r2, #0xc
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	ldr r3, [r4, #0x28]
	bl ov07_022226C4
	cmp r5, #0
	bne _022308E0
	ldr r0, [r4, #0x70]
	sub r0, r0, #1
	str r0, [r4, #0x70]
	cmp r0, #0
	bgt _0223089A
	ldr r0, [r4, #4]
	add sp, #0xc
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, pc}
_0223089A:
	mov r0, #0
	add sp, #0xc
	str r0, [r4, #4]
	pop {r4, r5, pc}
_022308A2:
	mov r2, #0xa
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_020087A4
	mov r2, #8
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_020087A4
	mov r1, #0xc
	add r2, r1, #0
	ldr r0, [r4, #0x10]
	add r2, #0xf4
	bl sub_020087A4
	mov r1, #0xd
	add r2, r1, #0
	ldr r0, [r4, #0x10]
	add r2, #0xf3
	bl sub_020087A4
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
_022308E0:
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_02230714

	thumb_func_start ov07_022308E4
ov07_022308E4: ; 0x022308E4
	push {r3, r4, r5, lr}
	mov r1, #0x78
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4]
	add r0, r5, #0
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FAA0
	strh r0, [r4, #0xc]
	ldr r0, [r4]
	bl ov07_0221C470
	add r1, r0, #0
	ldr r0, [r4]
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #8]
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0xa]
	mov r1, #0xa
	str r1, [r4, #0x5c]
	mov r0, #7
	str r0, [r4, #0x60]
	str r1, [r4, #0x64]
	mov r0, #0x1e
	str r0, [r4, #0x68]
	str r1, [r4, #0x6c]
	mov r3, #1
	ldr r0, _02230958 ; =0x00040003
	str r3, [r4, #0x70]
	str r0, [r4, #0x74]
	mov r1, #2
	add r0, r4, #0
	str r1, [sp]
	add r0, #0x38
	mov r2, #0
	bl ov07_022227A8
	ldr r0, [r4]
	ldr r1, _0223095C ; =ov07_02230714
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, pc}
	nop
_02230958: .word 0x00040003
_0223095C: .word ov07_02230714
	thumb_func_end ov07_022308E4

	thumb_func_start ov07_02230960
ov07_02230960: ; 0x02230960
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	ldr r1, [r4, #0x2c]
	add r0, #8
	bl ov07_022222F0
	cmp r0, #0
	bne _0223098A
	ldr r0, [r4, #0x2c]
	bl sub_0200D9DC
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	pop {r3, r4, r5, pc}
_0223098A:
	ldr r0, [r4, #4]
	bl sub_0200D020
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02230960

	thumb_func_start ov07_02230994
ov07_02230994: ; 0x02230994
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r1, #0x30
	add r5, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r5, [r4]
	add r0, r5, #0
	bl ov07_0221C528
	str r0, [r4, #4]
	add r0, r5, #0
	bl ov07_0221C468
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0223192C
	cmp r0, #3
	bne _022309D8
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4C0
	str r0, [r4, #0x2c]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4C0
	bl sub_0200D9DC
	b _022309EE
_022309D8:
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4C0
	str r0, [r4, #0x2c]
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221C4C0
	bl sub_0200D9DC
_022309EE:
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_02222004
	add r7, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0222202C
	str r0, [sp, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #0
	bl ov07_02221F80
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r1, r6, #0
	mov r2, #1
	bl ov07_02221F80
	ldr r1, [sp, #0x10]
	lsl r2, r7, #6
	add r6, r1, r2
	ldr r1, [sp, #0xc]
	lsl r1, r1, #4
	neg r1, r1
	add r5, r0, r1
	str r1, [sp, #8]
	lsl r1, r6, #0x10
	lsl r2, r5, #0x10
	ldr r0, [r4, #0x2c]
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	bl sub_0200DDB8
	ldr r0, [sp, #8]
	mov r2, #0x30
	add r0, r5, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	mul r2, r7
	str r0, [sp]
	mov r0, #6
	add r2, r6, r2
	str r0, [sp, #4]
	add r0, r4, #0
	lsl r1, r6, #0x10
	lsl r2, r2, #0x10
	lsl r3, r5, #0x10
	add r0, #8
	asr r1, r1, #0x10
	asr r2, r2, #0x10
	asr r3, r3, #0x10
	bl ov07_02222268
	ldr r0, [r4]
	ldr r1, _02230A6C ; =ov07_02230960
	add r2, r4, #0
	bl ov07_0221C410
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02230A6C: .word ov07_02230960
	thumb_func_end ov07_02230994

	thumb_func_start ov07_02230A70
ov07_02230A70: ; 0x02230A70
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #5
	bls _02230A80
	b _02230B9C
_02230A80:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230A8C: ; jump table
	.short _02230A98 - _02230A8C - 2 ; case 0
	.short _02230AB2 - _02230A8C - 2 ; case 1
	.short _02230B00 - _02230A8C - 2 ; case 2
	.short _02230B1C - _02230A8C - 2 ; case 3
	.short _02230B5E - _02230A8C - 2 ; case 4
	.short _02230B76 - _02230A8C - 2 ; case 5
_02230A98:
	mov r1, #4
	add r0, r4, #0
	str r1, [sp]
	add r0, #0x40
	mov r2, #0
	mov r3, #1
	bl ov07_022227A8
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
_02230AB2:
	mov r1, #0x18
	mov r2, #0x1a
	add r0, r4, #0
	ldrsh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r3, [r4, #0x14]
	add r0, #0x40
	bl ov07_0222283C
	cmp r0, #0
	bne _02230B9C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0x1a
	ldrsh r3, [r4, r0]
	mov r0, #0x18
	ldrsh r1, [r4, r0]
	ldr r2, [r4, #0x10]
	sub r0, #0x1f
	mul r0, r2
	add r0, r3, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	add r0, r4, #0
	ldr r4, [r4, #0xc]
	mov r2, #0x28
	mul r2, r4
	add r2, r1, r2
	lsl r2, r2, #0x10
	add r0, #0x1c
	asr r2, r2, #0x10
	bl ov07_02222268
	add sp, #8
	pop {r4, r5, r6, pc}
_02230B00:
	add r0, r4, #0
	ldr r1, [r4, #0x14]
	add r0, #0x1c
	bl ov07_02222314
	cmp r0, #0
	bne _02230B9C
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #8
	str r0, [r4, #8]
	pop {r4, r5, r6, pc}
_02230B1C:
	ldr r0, [r4, #8]
	sub r0, r0, #1
	str r0, [r4, #8]
	bpl _02230B9C
	ldr r0, [r4, #4]
	mov r5, #0x28
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0x1a
	ldrsh r3, [r4, r0]
	mov r0, #0x18
	ldrsh r2, [r4, r0]
	mov r0, #4
	str r3, [sp]
	str r0, [sp, #4]
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	add r6, r1, #0
	mul r6, r5
	add r1, r2, r6
	lsl r1, r1, #0x10
	ldr r4, [r4, #0x10]
	sub r5, #0x2f
	mul r5, r4
	add r3, r3, r5
	lsl r3, r3, #0x10
	add r0, #0x1c
	asr r1, r1, #0x10
	asr r3, r3, #0x10
	bl ov07_02222268
	add sp, #8
	pop {r4, r5, r6, pc}
_02230B5E:
	add r0, r4, #0
	ldr r1, [r4, #0x14]
	add r0, #0x1c
	bl ov07_02222314
	cmp r0, #0
	bne _02230B9C
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r4, r5, r6, pc}
_02230B76:
	mov r2, #0x18
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x14]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x1a
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl sub_020087A4
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
_02230B9C:
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_02230A70

	thumb_func_start ov07_02230BA0
ov07_02230BA0: ; 0x02230BA0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r1, #0x64
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	str r5, [r4]
	bl ov07_0221C468
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x14]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0x18]
	ldr r0, [r4, #0x14]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0x1a]
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_02222004
	str r0, [r4, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0222202C
	str r0, [r4, #0x10]
	ldr r0, [r4]
	ldr r1, _02230BF4 ; =ov07_02230A70
	add r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	nop
_02230BF4: .word ov07_02230A70
	thumb_func_end ov07_02230BA0

	thumb_func_start ov07_02230BF8
ov07_02230BF8: ; 0x02230BF8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #4
	bls _02230C08
	b _02230D18
_02230C08:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230C14: ; jump table
	.short _02230C1E - _02230C14 - 2 ; case 0
	.short _02230C54 - _02230C14 - 2 ; case 1
	.short _02230C7C - _02230C14 - 2 ; case 2
	.short _02230CDA - _02230C14 - 2 ; case 3
	.short _02230CF2 - _02230C14 - 2 ; case 4
_02230C1E:
	mov r0, #0x16
	ldrsh r3, [r4, r0]
	mov r0, #0x14
	ldrsh r1, [r4, r0]
	ldr r0, [r4, #0xc]
	mov r5, #4
	lsl r0, r0, #4
	add r0, r3, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	str r5, [sp, #4]
	ldr r2, [r4, #8]
	sub r5, #0x2c
	mul r5, r2
	add r2, r1, r5
	add r0, r4, #0
	lsl r2, r2, #0x10
	add r0, #0x18
	asr r2, r2, #0x10
	bl ov07_02222268
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_02230C54:
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	add r0, #0x18
	bl ov07_02222314
	cmp r0, #0
	bne _02230D18
	ldr r0, [r4, #4]
	mov r1, #4
	add r0, r0, #1
	str r0, [r4, #4]
	add r4, #0x3c
	add r0, r4, #0
	mov r2, #0
	mov r3, #1
	str r1, [sp]
	bl ov07_022227A8
	add sp, #8
	pop {r3, r4, r5, pc}
_02230C7C:
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r5, r0, #0x10
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008A78
	lsl r0, r0, #0x10
	asr r2, r0, #0x10
	add r0, r4, #0
	ldr r3, [r4, #0x10]
	add r0, #0x3c
	add r1, r5, #0
	bl ov07_0222283C
	cmp r0, #0
	bne _02230D18
	ldr r0, [r4, #4]
	mov r5, #4
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0x16
	ldrsh r3, [r4, r0]
	mov r0, #0x14
	ldrsh r2, [r4, r0]
	add r0, r4, #0
	add r0, #0x18
	str r3, [sp]
	str r5, [sp, #4]
	ldr r1, [r4, #8]
	ldr r4, [r4, #0xc]
	sub r5, #0x2c
	mul r5, r1
	lsl r4, r4, #4
	add r1, r2, r5
	add r3, r3, r4
	lsl r1, r1, #0x10
	lsl r3, r3, #0x10
	asr r1, r1, #0x10
	asr r3, r3, #0x10
	bl ov07_02222268
	add sp, #8
	pop {r3, r4, r5, pc}
_02230CDA:
	add r0, r4, #0
	ldr r1, [r4, #0x10]
	add r0, #0x18
	bl ov07_02222314
	cmp r0, #0
	bne _02230D18
	ldr r0, [r4, #4]
	add sp, #8
	add r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
_02230CF2:
	mov r2, #0x14
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #0
	bl sub_020087A4
	mov r2, #0x16
	ldrsh r2, [r4, r2]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_020087A4
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
_02230D18:
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02230BF8

	thumb_func_start ov07_02230D1C
ov07_02230D1C: ; 0x02230D1C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r1, #0x60
	bl ov07_022324D8
	add r4, r0, #0
	add r0, r5, #0
	str r5, [r4]
	bl ov07_0221C470
	add r6, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0221FA48
	str r0, [r4, #0x10]
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4, #0x14]
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #0x16]
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_02222004
	str r0, [r4, #8]
	add r0, r5, #0
	add r1, r6, #0
	bl ov07_0222202C
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldr r1, _02230D70 ; =ov07_02230BF8
	add r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	nop
_02230D70: .word ov07_02230BF8
	thumb_func_end ov07_02230D1C

	thumb_func_start ov07_02230D74
ov07_02230D74: ; 0x02230D74
	push {r4, r5, r6, r7, lr}
	sub sp, #0x3c
	add r7, r1, #0
	add r4, r0, #0
	mov r1, #0xac
	add r6, r2, #0
	str r3, [sp]
	bl ov07_022324D8
	str r4, [r0]
	str r0, [sp, #4]
	str r6, [r0, #0xc]
	add r0, r4, #0
	bl ov07_0221C468
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02222004
	ldr r1, [sp, #4]
	str r0, [r1, #0x10]
	ldr r1, [r1]
	add r0, sp, #8
	bl ov07_0221F9E8
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #0
	bl ov07_02221F80
	add r1, sp, #8
	strh r0, [r1]
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov07_02221F80
	add r1, sp, #8
	ldr r5, [sp, #4]
	strh r0, [r1, #2]
	mov r4, #0
_02230DC8:
	cmp r4, #0
	add r2, sp, #8
	bne _02230DE2
	ldr r0, [sp]
	mov r1, #0
	str r0, [r5, #0x14]
	ldrsh r1, [r2, r1]
	add r3, r2, #0
	mov r2, #2
	ldrsh r2, [r3, r2]
	bl sub_0200DDB8
	b _02230DEC
_02230DE2:
	add r0, r7, #0
	add r1, r6, #0
	bl sub_0200D734
	str r0, [r5, #0x14]
_02230DEC:
	ldr r0, [r5, #0x14]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r5, #0x14]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r5, #0x14]
	mov r1, #1
	bl sub_0200DD54
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _02230DC8
	ldr r0, [sp, #4]
	ldr r1, _02230E1C ; =ov07_02230E20
	ldr r0, [r0]
	ldr r2, [sp, #4]
	bl ov07_0221C410
	add sp, #0x3c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02230E1C: .word ov07_02230E20
	thumb_func_end ov07_02230D74

	thumb_func_start ov07_02230E20
ov07_02230E20: ; 0x02230E20
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #4
	bhi _02230F04
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02230E38: ; jump table
	.short _02230E42 - _02230E38 - 2 ; case 0
	.short _02230E6A - _02230E38 - 2 ; case 1
	.short _02230E8A - _02230E38 - 2 ; case 2
	.short _02230EBC - _02230E38 - 2 ; case 3
	.short _02230EE2 - _02230E38 - 2 ; case 4
_02230E42:
	add r2, r4, #0
	ldr r0, [r4, #0x14]
	ldr r3, [r4, #0x10]
	add r1, #0x1c
	add r2, #0x64
	bl ov07_02230F0C
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x1c
	add r2, #0x64
	bl ov07_02230F6C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #8
	str r0, [r4, #8]
	b _02230F04
_02230E6A:
	ldr r0, [r4, #8]
	add r2, r4, #0
	sub r0, r0, #1
	str r0, [r4, #8]
	ldr r0, [r4, #0x14]
	add r1, #0x1c
	add r2, #0x64
	bl ov07_02230F6C
	ldr r0, [r4, #8]
	cmp r0, #0
	bge _02230F04
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02230F04
_02230E8A:
	add r2, r4, #0
	ldr r0, [r4, #0x18]
	ldr r3, [r4, #0x10]
	add r1, #0x40
	add r2, #0x88
	bl ov07_02230F0C
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x18]
	add r1, #0x40
	add r2, #0x88
	bl ov07_02230F6C
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x1c
	add r2, #0x64
	bl ov07_02230F6C
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02230F04
_02230EBC:
	add r2, r4, #0
	ldr r0, [r4, #0x14]
	add r1, #0x1c
	add r2, #0x64
	bl ov07_02230F6C
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x18]
	add r1, #0x40
	add r2, #0x88
	bl ov07_02230F6C
	cmp r0, #0
	beq _02230F04
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _02230F04
_02230EE2:
	mov r6, #0
	add r5, r4, #0
_02230EE6:
	ldr r0, [r5, #0x14]
	bl sub_0200D9DC
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #2
	blt _02230EE6
	ldr r0, [r4]
	add r1, r7, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_02230F04:
	ldr r0, [r4, #0xc]
	bl sub_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02230E20

	thumb_func_start ov07_02230F0C
ov07_02230F0C: ; 0x02230F0C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r1, #0
	add r5, r0, #0
	mov r1, #2
	add r7, r2, #0
	add r4, r3, #0
	bl sub_0200DF98
	add r0, r5, #0
	mov r1, #1
	bl sub_0200DCE8
	add r1, sp, #8
	add r0, r5, #0
	add r1, #2
	add r2, sp, #8
	bl sub_0200DE44
	add r1, sp, #8
	mov r0, #0
	ldrsh r3, [r1, r0]
	mov r0, #2
	ldrsh r1, [r1, r0]
	add r0, r3, #0
	sub r0, #0x20
	lsl r0, r0, #0x10
	lsl r2, r4, #4
	asr r0, r0, #0x10
	add r2, r1, r2
	str r0, [sp]
	mov r0, #0x20
	lsl r2, r2, #0x10
	str r0, [sp, #4]
	add r0, r6, #0
	asr r2, r2, #0x10
	bl ov07_02222268
	mov r0, #0x20
	mov r2, #0xa
	str r0, [sp]
	add r0, r7, #0
	mov r1, #2
	add r3, r2, #0
	bl ov07_02222508
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_02230F0C

	thumb_func_start ov07_02230F6C
ov07_02230F6C: ; 0x02230F6C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	add r4, r2, #0
	add r1, r5, #0
	bl ov07_022222F0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02222748
	cmp r0, #0
	beq _02230F8A
	mov r0, #0
	pop {r3, r4, r5, pc}
_02230F8A:
	add r0, r5, #0
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02230F6C

	thumb_func_start ov07_02230F98
ov07_02230F98: ; 0x02230F98
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x3c
	add r6, r0, #0
	add r7, r2, #0
	add r5, r3, #0
	bl ov07_022324D8
	add r4, r0, #0
	str r6, [r4]
	str r7, [r4, #0xc]
	str r5, [r4, #0x10]
	add r0, r5, #0
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #0x10]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [r4, #0x10]
	bl sub_0200DD30
	str r0, [r4, #8]
	ldr r0, [r4]
	ldr r1, _02230FE4 ; =ov07_02230FE8
	add r2, r4, #0
	bl ov07_0221C410
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02230FE4: .word ov07_02230FE8
	thumb_func_end ov07_02230F98

	thumb_func_start ov07_02230FE8
ov07_02230FE8: ; 0x02230FE8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #4
	bhi _022310D4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02231002: ; jump table
	.short _0223100C - _02231002 - 2 ; case 0
	.short _0223103C - _02231002 - 2 ; case 1
	.short _02231062 - _02231002 - 2 ; case 2
	.short _022310A0 - _02231002 - 2 ; case 3
	.short _022310BC - _02231002 - 2 ; case 4
_0223100C:
	mov r0, #4
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x14
	mov r1, #0
	mov r2, #0x10
	mov r3, #0x14
	bl ov07_02222AC4
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4]
	mov r1, #0
	mov r2, #0x14
	bl ov07_02231E08
	ldr r0, [r4, #4]
	add r0, r0, #1
	str r0, [r4, #4]
	b _022310D4
_0223103C:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222AF4
	cmp r0, #0
	beq _022310D4
	ldr r0, [r4, #4]
	mov r1, #1
	add r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl sub_0200DC78
	mov r1, #1
	ldr r0, [r4, #0x10]
	lsl r1, r1, #0xc
	bl sub_0200DC8C
	b _022310D4
_02231062:
	ldr r0, [r4, #0x10]
	bl sub_0200DCD4
	mov r1, #3
	bl _s32_div_f
	ldr r2, [r4, #8]
	ldr r0, [r4, #0x10]
	add r1, r2, r1
	bl sub_0200DD24
	ldr r0, [r4, #0x10]
	bl sub_0200DCA0
	cmp r0, #0
	bne _022310D4
	ldr r0, [r4, #4]
	mov r1, #0x10
	add r0, r0, #1
	str r0, [r4, #4]
	mov r0, #0x14
	str r0, [sp]
	mov r0, #8
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x14
	mov r2, #0
	mov r3, #4
	bl ov07_02222AC4
	b _022310D4
_022310A0:
	add r0, r4, #0
	add r0, #0x14
	bl ov07_02222AF4
	cmp r0, #0
	beq _022310D4
	ldr r0, [r4, #4]
	mov r1, #0
	add r0, r0, #1
	str r0, [r4, #4]
	ldr r0, [r4, #0x10]
	bl sub_0200DCE8
	b _022310D4
_022310BC:
	ldr r0, [r4, #0x10]
	bl sub_0200D9DC
	ldr r0, [r4]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, pc}
_022310D4:
	ldr r0, [r4, #0xc]
	bl sub_0200D020
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02230FE8

	thumb_func_start ov07_022310E0
ov07_022310E0: ; 0x022310E0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x4c
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r1, #0x54
	add r5, r0, #0
	str r3, [sp, #0xc]
	bl ov07_022324D8
	ldr r1, [sp, #8]
	str r5, [r0]
	str r0, [sp, #0x14]
	str r1, [r0, #8]
	ldr r0, [r0]
	bl ov07_0221C468
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02222004
	ldr r1, [sp, #0x14]
	str r0, [sp, #0x10]
	ldr r1, [r1]
	add r0, sp, #0x18
	bl ov07_0221F9E8
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #0
	bl ov07_02221F80
	add r1, sp, #0x18
	strh r0, [r1]
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov07_02221F80
	ldr r7, [sp, #0x14]
	ldr r6, [sp, #0x14]
	ldr r5, [sp, #0x14]
	add r1, sp, #0x18
	add r7, #0x3c
	add r6, #0x24
	strh r0, [r1, #2]
	mov r4, #5
	add r5, #0x14
	add r7, #0x14
	add r6, #0x14
_02231144:
	cmp r4, #5
	add r2, sp, #0x18
	bne _0223115E
	ldr r0, [sp, #0xc]
	mov r1, #0
	str r0, [r5, #0xc]
	ldrsh r1, [r2, r1]
	add r3, r2, #0
	mov r2, #2
	ldrsh r2, [r3, r2]
	bl sub_0200DDB8
	b _02231168
_0223115E:
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	bl sub_0200D734
	str r0, [r5, #0xc]
_02231168:
	ldr r0, [r5, #0xc]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r5, #0xc]
	mov r1, #1
	bl sub_0200DD54
	ldr r0, [r5, #0xc]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [sp, #0x10]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [r5, #0xc]
	add r2, r7, #0
	add r3, r4, #0
	bl ov07_022311B0
	sub r5, r5, #4
	sub r7, r7, #4
	sub r6, r6, #4
	sub r4, r4, #1
	bpl _02231144
	ldr r0, [sp, #0x14]
	ldr r1, _022311AC ; =ov07_02231234
	ldr r0, [r0]
	ldr r2, [sp, #0x14]
	bl ov07_0221C410
	add sp, #0x4c
	pop {r4, r5, r6, r7, pc}
	nop
_022311AC: .word ov07_02231234
	thumb_func_end ov07_022310E0

	thumb_func_start ov07_022311B0
ov07_022311B0: ; 0x022311B0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r3, #0
	add r6, r1, #0
	lsr r1, r4, #0x1f
	add r1, r4, r1
	asr r1, r1, #1
	add r5, r0, #0
	add r7, r2, #0
	bl sub_0200DC4C
	lsl r0, r4, #1
	str r0, [r7]
	mov r0, #0x10
	add r1, sp, #0
	str r0, [r6]
	add r0, r5, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	mov r1, #2
	add r6, r1, #0
	add r2, sp, #0
	sub r6, #0xe
	mul r6, r4
	ldr r0, [sp, #0x18]
	ldrsh r3, [r2, r1]
	add r6, #0x28
	add r4, r0, #0
	mul r4, r6
	add r0, r3, r4
	mov r3, #0
	strh r0, [r2, #2]
	ldrsh r0, [r2, r3]
	add r0, #0x28
	strh r0, [r2]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r3]
	add r0, r5, #0
	bl sub_0200DDB8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_022311B0

	thumb_func_start ov07_02231204
ov07_02231204: ; 0x02231204
	push {r3, lr}
	ldr r3, [r2]
	cmp r3, #0
	ble _0223121A
	sub r1, r3, #1
	str r1, [r2]
	bne _02231230
	mov r1, #1
	bl sub_0200DCE8
	b _02231230
_0223121A:
	ldr r2, [r1]
	cmp r2, #0
	ble _02231226
	sub r0, r2, #1
	str r0, [r1]
	b _02231230
_02231226:
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #1
	pop {r3, pc}
_02231230:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov07_02231204

	thumb_func_start ov07_02231234
ov07_02231234: ; 0x02231234
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r1, #4]
	str r1, [sp]
	cmp r0, #0
	beq _02231246
	cmp r0, #1
	beq _02231278
	b _0223129C
_02231246:
	add r6, r1, #0
	add r4, r1, #0
	mov r7, #0
	add r6, #0x3c
	add r4, #0x24
	add r5, r1, #0
_02231252:
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	add r2, r6, #0
	bl ov07_02231204
	add r7, r7, #1
	add r6, r6, #4
	add r4, r4, #4
	add r5, r5, #4
	cmp r7, #6
	blt _02231252
	cmp r0, #0
	beq _0223129C
	ldr r0, [sp]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	b _0223129C
_02231278:
	mov r5, #0
	add r4, r1, #0
_0223127C:
	ldr r0, [r4, #0xc]
	bl sub_0200D9DC
	add r5, r5, #1
	add r4, r4, #4
	cmp r5, #6
	blt _0223127C
	ldr r0, [sp]
	add r1, r6, #0
	ldr r0, [r0]
	bl ov07_0221C448
	ldr r0, [sp]
	bl FreeToHeap
	pop {r3, r4, r5, r6, r7, pc}
_0223129C:
	ldr r0, [sp]
	ldr r0, [r0, #8]
	bl sub_0200D020
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_02231234

	thumb_func_start ov07_022312A8
ov07_022312A8: ; 0x022312A8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r7, #0
	add r6, r5, #0
	str r1, [sp, #0x10]
	add r6, #0x30
	add r4, r7, #0
_022312B8:
	mov r0, #0
	str r0, [sp]
	mov r0, #0x32
	lsl r0, r0, #0xc
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #0x30
	mov r1, #0
	str r0, [sp, #0xc]
	ldr r2, _022312F8 ; =0x00007FFF
	add r0, r6, #0
	add r3, r1, #0
	bl ov07_022220FC
	ldr r0, [r5, #0x38]
	add r7, r7, #1
	add r0, r0, r4
	str r0, [r5, #0x38]
	ldr r1, [r5, #0x48]
	ldr r0, [sp, #0x10]
	add r6, #0x24
	mul r0, r1
	str r0, [r5, #0x48]
	ldr r0, _022312FC ; =0x00002AAA
	add r5, #0x24
	add r4, r4, r0
	cmp r7, #6
	blt _022312B8
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_022312F8: .word 0x00007FFF
_022312FC: .word 0x00002AAA
	thumb_func_end ov07_022312A8

	thumb_func_start ov07_02231300
ov07_02231300: ; 0x02231300
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0
	add r7, r6, #0
	str r0, [sp]
	add r7, #0x30
	add r4, r6, #0
	add r5, r6, #0
_02231310:
	add r0, r7, #0
	bl ov07_02222180
	mov r1, #0x13
	lsl r1, r1, #4
	mov r2, #0x30
	ldrsh r1, [r6, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r5, #0x18]
	add r1, r1, r2
	ldr r2, _0223136C ; =0x00000132
	lsl r1, r1, #0x10
	ldrsh r2, [r6, r2]
	asr r1, r1, #0x10
	bl sub_0200DDB8
	ldr r1, [r4, #0x38]
	ldr r0, _02231370 ; =0x00003FFF
	cmp r1, r0
	blt _02231348
	ldr r0, _02231374 ; =0x0000BF49
	cmp r1, r0
	bgt _02231348
	ldr r0, [r5, #0x18]
	mov r1, #1
	bl sub_0200DD54
	b _02231358
_02231348:
	ldr r0, [r6]
	bl ov07_0221FAE8
	add r1, r0, #0
	ldr r0, [r5, #0x18]
	add r1, r1, #1
	bl sub_0200DD54
_02231358:
	ldr r0, [sp]
	add r7, #0x24
	add r0, r0, #1
	add r4, #0x24
	add r5, r5, #4
	str r0, [sp]
	cmp r0, #6
	blt _02231310
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0223136C: .word 0x00000132
_02231370: .word 0x00003FFF
_02231374: .word 0x0000BF49
	thumb_func_end ov07_02231300

	thumb_func_start ov07_02231378
ov07_02231378: ; 0x02231378
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r1, #0
	add r7, r0, #0
	ldr r0, [r4, #0xc]
	cmp r0, #4
	bhi _0223145E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02231392: ; jump table
	.short _0223139C - _02231392 - 2 ; case 0
	.short _022313D2 - _02231392 - 2 ; case 1
	.short _022313F2 - _02231392 - 2 ; case 2
	.short _0223141E - _02231392 - 2 ; case 3
	.short _0223143A - _02231392 - 2 ; case 4
_0223139C:
	ldr r0, [r4]
	mov r1, #1
	mov r2, #0xf
	bl ov07_02231E08
	mov r0, #0
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, #0xfe
	add r0, r4, r0
	mov r1, #1
	mov r2, #0x10
	mov r3, #0xf
	bl ov07_02222AC4
	ldr r1, [r4, #0x14]
	add r0, r4, #0
	bl ov07_022312A8
	add r0, r4, #0
	bl ov07_02231300
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0223145E
_022313D2:
	add r0, r4, #0
	bl ov07_02231300
	mov r0, #0x42
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov07_02222AF4
	cmp r0, #0
	beq _0223145E
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #0x1c
	str r0, [r4, #0x10]
	b _0223145E
_022313F2:
	add r0, r4, #0
	bl ov07_02231300
	ldr r0, [r4, #0x10]
	sub r0, r0, #1
	str r0, [r4, #0x10]
	bpl _0223145E
	ldr r0, [r4, #0xc]
	mov r1, #0x10
	add r0, r0, #1
	str r0, [r4, #0xc]
	mov r0, #0xf
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, #0xfe
	add r0, r4, r0
	mov r2, #1
	mov r3, #0
	bl ov07_02222AC4
	b _0223145E
_0223141E:
	add r0, r4, #0
	bl ov07_02231300
	mov r0, #0x42
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov07_02222AF4
	cmp r0, #0
	beq _0223145E
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _0223145E
_0223143A:
	mov r6, #0
	add r5, r4, #0
_0223143E:
	ldr r0, [r5, #0x18]
	bl sub_0200D9DC
	add r6, r6, #1
	add r5, r5, #4
	cmp r6, #6
	blt _0223143E
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r4]
	add r1, r7, #0
	bl ov07_0221C448
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
_0223145E:
	ldr r0, [r4, #8]
	bl sub_0200D020
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231378

	thumb_func_start ov07_02231468
ov07_02231468: ; 0x02231468
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r1, #0
	mov r1, #0x4d
	lsl r1, r1, #2
	add r4, r0, #0
	str r2, [sp]
	add r7, r3, #0
	bl ov07_022324D8
	add r6, r0, #0
	str r4, [r6]
	ldr r0, [sp]
	str r5, [r6, #4]
	str r0, [r6, #8]
	add r0, r4, #0
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_0221FA48
	mov r1, #0
	add r5, r0, #0
	bl sub_02008A78
	mov r1, #0x13
	lsl r1, r1, #4
	strh r0, [r6, r1]
	add r0, r5, #0
	mov r1, #1
	bl sub_02008A78
	ldr r1, _0223150C ; =0x00000132
	strh r0, [r6, r1]
	add r0, sp, #4
	add r1, r4, #0
	bl ov07_0221F9E8
	mov r4, #0
	add r5, r6, #0
_022314BA:
	cmp r4, #0
	bne _022314C2
	str r7, [r5, #0x18]
	b _022314CE
_022314C2:
	ldr r0, [r6, #4]
	ldr r1, [r6, #8]
	add r2, sp, #4
	bl sub_0200D734
	str r0, [r5, #0x18]
_022314CE:
	ldr r0, [r5, #0x18]
	mov r1, #0x64
	bl sub_0200DD68
	ldr r0, [r5, #0x18]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r5, #0x18]
	mov r1, #1
	bl sub_0200DC78
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #6
	blt _022314BA
	ldr r0, [r6]
	bl ov07_0221C468
	add r1, r0, #0
	ldr r0, [r6]
	bl ov07_02222004
	str r0, [r6, #0x14]
	ldr r0, [r6]
	ldr r1, _02231510 ; =ov07_02231378
	add r2, r6, #0
	bl ov07_0221C410
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0223150C: .word 0x00000132
_02231510: .word ov07_02231378
	thumb_func_end ov07_02231468

	thumb_func_start ov07_02231514
ov07_02231514: ; 0x02231514
	strh r1, [r0, #0xc]
	strh r2, [r0, #0xe]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_02231514

	thumb_func_start ov07_0223151C
ov07_0223151C: ; 0x0223151C
	strh r1, [r0, #0x14]
	strh r2, [r0, #0x16]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_0223151C

	thumb_func_start ov07_02231524
ov07_02231524: ; 0x02231524
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x1c]
	add r4, r1, #0
	bl ov07_0221BFD0
	add r6, r0, #0
	ldr r0, [r5, #0x1c]
	mov r1, #3
	bl ov07_0221FB04
	add r1, r0, #0
	lsl r0, r4, #0x18
	lsl r1, r1, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl SetBgPriority
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r1, [r5, #4]
	ldr r0, [r5]
	lsl r2, r1, #4
	ldr r1, _022315B4 ; =ov07_0223680C
	add r3, r4, #0
	ldr r1, [r1, r2]
	ldr r2, [r5, #0x2c]
	bl GfGfxLoader_LoadCharData
	mov r0, #0
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #0x80
	str r0, [sp, #8]
	ldr r2, [r5, #4]
	ldr r0, [r5, #0x30]
	lsl r3, r2, #4
	ldr r2, _022315B8 ; =ov07_02236810
	ldr r1, [r5]
	ldr r2, [r2, r3]
	add r3, r6, #0
	bl PaletteData_LoadNarc
	lsl r1, r4, #0x18
	ldr r0, [r5, #0x2c]
	lsr r1, r1, #0x18
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	str r6, [sp, #0xc]
	ldr r1, [r5, #4]
	ldr r0, [r5]
	lsl r2, r1, #4
	ldr r1, _022315BC ; =ov07_02236814
	add r3, r4, #0
	ldr r1, [r1, r2]
	ldr r2, [r5, #0x2c]
	bl GfGfxLoader_LoadScrnData
	add sp, #0x10
	pop {r4, r5, r6, pc}
	nop
_022315B4: .word ov07_0223680C
_022315B8: .word ov07_02236810
_022315BC: .word ov07_02236814
	thumb_func_end ov07_02231524

	thumb_func_start ov07_022315C0
ov07_022315C0: ; 0x022315C0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldrb r0, [r4, #0x18]
	cmp r0, #3
	bhi _0223167C
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022315D8: ; jump table
	.short _022315E0 - _022315D8 - 2 ; case 0
	.short _022315F0 - _022315D8 - 2 ; case 1
	.short _02231608 - _022315D8 - 2 ; case 2
	.short _02231628 - _022315D8 - 2 ; case 3
_022315E0:
	add r0, r4, #0
	mov r1, #2
	bl ov07_02231524
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	b _022316CA
_022315F0:
	ldrh r0, [r4, #0x16]
	mov r1, #4
	mov r2, #0x39
	str r0, [sp]
	ldrh r3, [r4, #0x14]
	ldr r0, _02231718 ; =0x04000050
	bl G2x_SetBlendAlpha_
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
	b _022316CA
_02231608:
	add r1, r4, #0
	add r1, #0x40
	ldrb r1, [r1]
	cmp r1, #0x14
	bls _02231618
	add r0, r0, #1
	strb r0, [r4, #0x18]
	b _022316CA
_02231618:
	add r0, r4, #0
	add r0, #0x40
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x40
	strb r1, [r0]
	b _022316CA
_02231628:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	beq _02231632
	sub r0, r0, #1
	strh r0, [r4, #0x14]
_02231632:
	ldrh r0, [r4, #0x16]
	cmp r0, #0x10
	bhs _0223163C
	add r0, r0, #1
	strh r0, [r4, #0x16]
_0223163C:
	ldrh r0, [r4, #0x14]
	cmp r0, #0
	bne _0223166E
	ldrh r0, [r4, #0x16]
	cmp r0, #0x10
	bne _0223166E
	ldr r0, [r4, #0x2c]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	ldr r0, [r4, #0x34]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x38]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x3c]
	mov r1, #0
	bl sub_0200DCE8
	ldrb r0, [r4, #0x18]
	add r0, r0, #1
	strb r0, [r4, #0x18]
_0223166E:
	ldrh r0, [r4, #0x16]
	ldrh r1, [r4, #0x14]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0223171C ; =0x04000052
	strh r1, [r0]
	b _022316CA
_0223167C:
	ldr r0, _02231720 ; =0x0400004A
	mov r1, #0x3f
	ldrh r2, [r0]
	bic r2, r1
	mov r1, #0x1f
	orr r2, r1
	strh r2, [r0]
	ldrh r3, [r0]
	ldr r2, _02231724 ; =0xFFFFC0FF
	lsl r1, r1, #8
	and r2, r3
	orr r1, r2
	strh r1, [r0]
	mov r2, #0
	ldr r0, [r4, #0x2c]
	mov r1, #2
	add r3, r2, #0
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x2c]
	mov r1, #2
	mov r2, #3
	mov r3, #0
	bl BgSetPosTextAndCommit
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _02231728 ; =0xFFFF1FFF
	and r0, r1
	str r0, [r2]
	ldr r0, [r4, #0x1c]
	add r1, r5, #0
	bl ov07_0221C448
	add r0, r4, #0
	bl ov07_02232508
	pop {r3, r4, r5, pc}
_022316CA:
	mov r3, #0x10
	mov r0, #0xc
	ldrsh r1, [r4, r3]
	ldrsh r0, [r4, r0]
	mov r2, #0
	add r0, r1, r0
	strh r0, [r4, #0x10]
	mov r0, #0x12
	ldrsh r1, [r4, r0]
	mov r0, #0xe
	ldrsh r0, [r4, r0]
	add r0, r1, r0
	strh r0, [r4, #0x12]
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x2c]
	mov r1, #2
	bl BgSetPosTextAndCommit
	mov r3, #0x12
	ldrsh r3, [r4, r3]
	ldr r0, [r4, #0x2c]
	mov r1, #2
	mov r2, #3
	bl BgSetPosTextAndCommit
	ldr r0, [r4, #0x34]
	bl sub_0200DC18
	ldr r0, [r4, #0x38]
	bl sub_0200DC18
	ldr r0, [r4, #0x3c]
	bl sub_0200DC18
	ldr r0, [r4, #0x24]
	bl sub_0200D020
	pop {r3, r4, r5, pc}
	nop
_02231718: .word 0x04000050
_0223171C: .word 0x04000052
_02231720: .word 0x0400004A
_02231724: .word 0xFFFFC0FF
_02231728: .word 0xFFFF1FFF
	thumb_func_end ov07_022315C0

	thumb_func_start ov07_0223172C
ov07_0223172C: ; 0x0223172C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #7
	str r1, [r4]
	add r5, r0, #0
	mov r1, #0
	bl ov07_0221C4A8
	str r0, [r4, #4]
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221C4A8
	str r0, [r4, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_0223172C

	thumb_func_start ov07_0223174C
ov07_0223174C: ; 0x0223174C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #0x44
	add r6, r0, #0
	bl ov07_022324D8
	add r4, r0, #0
	add r1, r4, #0
	add r0, r6, #0
	add r1, #0x18
	bl ov07_02231FE4
	add r2, r4, #0
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r4, #0x1c]
	mov r1, #0
	bl ov07_0221C4E8
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x1c]
	mov r1, #1
	bl ov07_0221C4E8
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x1c]
	mov r1, #2
	bl ov07_0221C4E8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x1c]
	mov r1, #2
	bl ov07_0221FB04
	ldr r0, [r4, #0x34]
	mov r1, #2
	bl sub_0200DD54
	ldr r0, [r4, #0x38]
	mov r1, #2
	bl sub_0200DD54
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _022317B6
	add r0, r6, #0
	bl ov07_0221C468
	b _022317BC
_022317B6:
	add r0, r6, #0
	bl ov07_0221C470
_022317BC:
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r6, #0
	bl ov07_0221BFC0
	cmp r0, #1
	bne _022317F4
	ldr r0, [r4, #0x3c]
	mov r1, #0
	bl sub_0200DCE8
	ldr r0, [r4, #0x1c]
	mov r1, #2
	bl ov07_0221FB04
	add r5, r0, #0
	ldr r0, [r4, #0x34]
	add r1, r5, #0
	bl sub_0200DD54
	ldr r0, [r4, #0x38]
	add r1, r5, #0
	bl sub_0200DD54
	b _02231818
_022317F4:
	cmp r5, #1
	bhi _02231802
	ldr r0, [r4, #0x3c]
	mov r1, #0
	bl sub_0200DCE8
	b _02231818
_02231802:
	sub r0, r5, #3
	cmp r0, #1
	ldr r0, [r4, #0x3c]
	bhi _02231812
	mov r1, #3
	bl sub_0200DD54
	b _02231818
_02231812:
	mov r1, #1
	bl sub_0200DD54
_02231818:
	ldr r0, _02231864 ; =0x0400004A
	ldr r1, _02231868 ; =0xFFFFC0FF
	ldrh r2, [r0]
	and r2, r1
	mov r1, #0x16
	lsl r1, r1, #8
	orr r2, r1
	lsr r1, r0, #0xd
	orr r1, r2
	strh r1, [r0]
	ldrh r2, [r0]
	mov r1, #0x3f
	bic r2, r1
	mov r1, #0x1b
	orr r2, r1
	mov r1, #0x20
	orr r2, r1
	strh r2, [r0]
	lsl r3, r1, #0x15
	ldr r2, [r3]
	ldr r0, _0223186C ; =0xFFFF1FFF
	and r2, r0
	lsl r0, r1, #0xa
	orr r0, r2
	str r0, [r3]
	ldr r0, [r4, #0x38]
	mov r1, #2
	bl sub_0200E0FC
	mov r0, #0
	strh r0, [r4, #0x10]
	strh r0, [r4, #0x12]
	ldr r0, [r4, #0x1c]
	ldr r1, _02231870 ; =ov07_022315C0
	add r2, r4, #0
	bl ov07_0221C410
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02231864: .word 0x0400004A
_02231868: .word 0xFFFFC0FF
_0223186C: .word 0xFFFF1FFF
_02231870: .word ov07_022315C0
	thumb_func_end ov07_0223174C

	thumb_func_start ov07_02231874
ov07_02231874: ; 0x02231874
	push {r4, lr}
	sub sp, #0x18
	add r1, sp, #0
	add r4, r0, #0
	bl ov07_0223172C
	add r0, sp, #0
	mov r1, #0
	mov r2, #3
	bl ov07_02231514
	add r0, sp, #0
	mov r1, #0xc
	mov r2, #4
	bl ov07_0223151C
	add r0, r4, #0
	add r1, sp, #0
	bl ov07_0223174C
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov07_02231874

	thumb_func_start ov07_022318A0
ov07_022318A0: ; 0x022318A0
	push {r4, lr}
	sub sp, #0x18
	add r1, sp, #0
	add r4, r0, #0
	bl ov07_0223172C
	mov r1, #0
	add r0, sp, #0
	sub r2, r1, #3
	bl ov07_02231514
	add r0, sp, #0
	mov r1, #0xc
	mov r2, #4
	bl ov07_0223151C
	add r0, r4, #0
	add r1, sp, #0
	bl ov07_0223174C
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov07_022318A0

	thumb_func_start ov07_022318CC
ov07_022318CC: ; 0x022318CC
	push {r4, lr}
	sub sp, #0x18
	add r1, sp, #0
	add r4, r0, #0
	bl ov07_0223172C
	add r0, sp, #0
	mov r1, #0
	mov r2, #3
	bl ov07_02231514
	add r0, sp, #0
	mov r1, #0xc
	mov r2, #4
	bl ov07_0223151C
	add r0, r4, #0
	add r1, sp, #0
	bl ov07_0223174C
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov07_022318CC

	thumb_func_start ov07_022318F8
ov07_022318F8: ; 0x022318F8
	push {r4, lr}
	sub sp, #0x18
	add r1, sp, #0
	add r4, r0, #0
	bl ov07_0223172C
	mov r1, #0
	add r0, sp, #0
	sub r2, r1, #6
	bl ov07_02231514
	add r0, sp, #0
	mov r1, #0xc
	mov r2, #4
	bl ov07_0223151C
	add r0, r4, #0
	add r1, sp, #0
	bl ov07_0223174C
	add sp, #0x18
	pop {r4, pc}
	thumb_func_end ov07_022318F8

	thumb_func_start ov07_02231924
ov07_02231924: ; 0x02231924
	ldr r3, _02231928 ; =ov07_0221FA04
	bx r3
	.balign 4, 0
_02231928: .word ov07_0221FA04
	thumb_func_end ov07_02231924

	thumb_func_start ov07_0223192C
ov07_0223192C: ; 0x0223192C
	push {r4, lr}
	bl ov07_0221FA04
	cmp r0, #5
	bhi _02231954
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02231942: ; jump table
	.short _0223194E - _02231942 - 2 ; case 0
	.short _02231952 - _02231942 - 2 ; case 1
	.short _0223194E - _02231942 - 2 ; case 2
	.short _02231952 - _02231942 - 2 ; case 3
	.short _0223194E - _02231942 - 2 ; case 4
	.short _02231952 - _02231942 - 2 ; case 5
_0223194E:
	mov r4, #3
	b _02231954
_02231952:
	mov r4, #4
_02231954:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end ov07_0223192C

	thumb_func_start ov07_02231958
ov07_02231958: ; 0x02231958
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r5, r1, #0
	mov r4, #0
_02231960:
	add r0, r6, #0
	add r1, r4, #0
	bl ov07_0221FA04
	cmp r0, r5
	bne _02231970
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_02231970:
	add r4, r4, #1
	cmp r4, #4
	blt _02231960
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02231958

	thumb_func_start ov07_0223197C
ov07_0223197C: ; 0x0223197C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	bl ov07_0221FA04
	add r5, r0, #0
	cmp r5, #1
	bls _022319DC
	mov r4, #0
_0223198C:
	add r0, r6, #0
	add r1, r4, #0
	bl ov07_0221FA04
	cmp r5, #5
	bhi _022319D0
	add r1, r5, r5
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_022319A4: ; jump table
	.short _022319D0 - _022319A4 - 2 ; case 0
	.short _022319D0 - _022319A4 - 2 ; case 1
	.short _022319B0 - _022319A4 - 2 ; case 2
	.short _022319C0 - _022319A4 - 2 ; case 3
	.short _022319B8 - _022319A4 - 2 ; case 4
	.short _022319C8 - _022319A4 - 2 ; case 5
_022319B0:
	cmp r0, #4
	bne _022319D0
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_022319B8:
	cmp r0, #2
	bne _022319D0
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_022319C0:
	cmp r0, #5
	bne _022319D0
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_022319C8:
	cmp r0, #3
	bne _022319D0
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_022319D0:
	add r4, r4, #1
	cmp r4, #4
	blt _0223198C
	bl GF_AssertFail
	add r0, r5, #0
_022319DC:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_0223197C

	thumb_func_start ov07_022319E0
ov07_022319E0: ; 0x022319E0
	push {r3, lr}
	cmp r0, #5
	bhi _02231A16
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022319F2: ; jump table
	.short _022319FE - _022319F2 - 2 ; case 0
	.short _02231A02 - _022319F2 - 2 ; case 1
	.short _02231A06 - _022319F2 - 2 ; case 2
	.short _02231A0A - _022319F2 - 2 ; case 3
	.short _02231A0E - _022319F2 - 2 ; case 4
	.short _02231A12 - _022319F2 - 2 ; case 5
_022319FE:
	mov r0, #1
	pop {r3, pc}
_02231A02:
	mov r0, #0
	pop {r3, pc}
_02231A06:
	mov r0, #3
	pop {r3, pc}
_02231A0A:
	mov r0, #2
	pop {r3, pc}
_02231A0E:
	mov r0, #5
	pop {r3, pc}
_02231A12:
	mov r0, #4
	pop {r3, pc}
_02231A16:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_022319E0

	thumb_func_start ov07_02231A20
ov07_02231A20: ; 0x02231A20
	push {r4, r5}
	sub sp, #0x18
	ldr r5, _02231A4C ; =ov07_02236864
	add r4, sp, #0
	mov r3, #0xc
_02231A2A:
	ldrh r1, [r5]
	add r5, r5, #2
	strh r1, [r4]
	add r4, r4, #2
	sub r3, r3, #1
	bne _02231A2A
	lsl r3, r0, #2
	add r0, sp, #0
	add r1, r0, r3
	ldrh r0, [r0, r3]
	strh r0, [r2]
	ldrh r0, [r1, #2]
	strh r0, [r2, #2]
	add sp, #0x18
	pop {r4, r5}
	bx lr
	nop
_02231A4C: .word ov07_02236864
	thumb_func_end ov07_02231A20

	thumb_func_start ov07_02231A50
ov07_02231A50: ; 0x02231A50
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r2, #0
	bl ov07_02231924
	add r6, r0, #0
	add r0, r5, #0
	bl ov07_0221BFC0
	add r1, r0, #0
	add r0, r6, #0
	add r2, r4, #0
	bl ov07_02231A20
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02231A50

	thumb_func_start ov07_02231A70
ov07_02231A70: ; 0x02231A70
	push {r4, r5, r6, r7}
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x1fc
	sub sp, #0x110
	mov r5, #0x12
	ldr r7, _02231AC8 ; =ov07_0223687C
	add r4, r0, #0
	add r2, r1, #0
	add r6, sp, #0
	lsl r5, r5, #4
_02231A88:
	ldmia r7!, {r0, r1}
	stmia r6!, {r0, r1}
	sub r5, r5, #1
	bne _02231A88
	mov r0, #0x12
	lsl r0, r0, #4
	add r1, sp, #0
	mul r0, r4
	add r0, r1, r0
	ldr r1, _02231ACC ; =0x00000900
	add r1, sp
	ldr r1, [r1, #0x10]
	lsl r1, r1, #1
	add r3, r3, r1
	mov r1, #0xc
	add r4, r3, #0
	mul r4, r1
	add r1, r0, r4
	ldr r3, [r1, #8]
	ldr r1, [r1, #4]
	ldr r0, [r0, r4]
	str r0, [r2]
	str r1, [r2, #4]
	str r3, [r2, #8]
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x1fc
	add sp, #0x110
	pop {r4, r5, r6, r7}
	bx lr
	nop
_02231AC8: .word ov07_0223687C
_02231ACC: .word 0x00000900
	thumb_func_end ov07_02231A70

	thumb_func_start ov07_02231AD0
ov07_02231AD0: ; 0x02231AD0
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #0
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231AD0

	thumb_func_start ov07_02231AE0
ov07_02231AE0: ; 0x02231AE0
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #1
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231AE0

	thumb_func_start ov07_02231AF0
ov07_02231AF0: ; 0x02231AF0
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #2
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231AF0

	thumb_func_start ov07_02231B00
ov07_02231B00: ; 0x02231B00
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #3
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B00

	thumb_func_start ov07_02231B10
ov07_02231B10: ; 0x02231B10
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #4
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B10

	thumb_func_start ov07_02231B20
ov07_02231B20: ; 0x02231B20
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #5
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B20

	thumb_func_start ov07_02231B30
ov07_02231B30: ; 0x02231B30
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #6
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B30

	thumb_func_start ov07_02231B40
ov07_02231B40: ; 0x02231B40
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #7
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B40

	thumb_func_start ov07_02231B50
ov07_02231B50: ; 0x02231B50
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #8
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B50

	thumb_func_start ov07_02231B60
ov07_02231B60: ; 0x02231B60
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #9
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B60

	thumb_func_start ov07_02231B70
ov07_02231B70: ; 0x02231B70
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #0xa
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B70

	thumb_func_start ov07_02231B80
ov07_02231B80: ; 0x02231B80
	push {r3, r4, lr}
	sub sp, #4
	mov r4, #0xb
	str r4, [sp]
	bl ov07_02231A70
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02231B80

	thumb_func_start ov07_02231B90
ov07_02231B90: ; 0x02231B90
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231AD0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231B90

	thumb_func_start ov07_02231BC0
ov07_02231BC0: ; 0x02231BC0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231AE0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231BC0

	thumb_func_start ov07_02231BF0
ov07_02231BF0: ; 0x02231BF0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231AF0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231BF0

	thumb_func_start ov07_02231C20
ov07_02231C20: ; 0x02231C20
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231B00
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231C20

	thumb_func_start ov07_02231C50
ov07_02231C50: ; 0x02231C50
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231B10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231C50

	thumb_func_start ov07_02231C80
ov07_02231C80: ; 0x02231C80
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231B20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231C80

	thumb_func_start ov07_02231CB0
ov07_02231CB0: ; 0x02231CB0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231B30
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231CB0

	thumb_func_start ov07_02231CE0
ov07_02231CE0: ; 0x02231CE0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231B40
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231CE0

	thumb_func_start ov07_02231D10
ov07_02231D10: ; 0x02231D10
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231B50
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231D10

	thumb_func_start ov07_02231D40
ov07_02231D40: ; 0x02231D40
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231B60
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231D40

	thumb_func_start ov07_02231D70
ov07_02231D70: ; 0x02231D70
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231B70
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231D70

	thumb_func_start ov07_02231DA0
ov07_02231DA0: ; 0x02231DA0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	add r6, r2, #0
	bl ov07_0221C478
	bl sub_02015530
	add r7, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	bl ov07_02231924
	add r5, r0, #0
	add r0, r4, #0
	bl ov07_0221BFC0
	add r2, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r3, r7, #0
	bl ov07_02231B80
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02231DA0

	thumb_func_start ov07_02231DD0
ov07_02231DD0: ; 0x02231DD0
	mov r2, #0
	ldr r1, _02231DDC ; =0x000068D0
	str r2, [r0]
	str r1, [r0, #4]
	str r2, [r0, #8]
	bx lr
	.balign 4, 0
_02231DDC: .word 0x000068D0
	thumb_func_end ov07_02231DD0

	thumb_func_start ov07_02231DE0
ov07_02231DE0: ; 0x02231DE0
	push {r3, lr}
	bl ov07_02231AD0
	pop {r3, pc}
	thumb_func_end ov07_02231DE0

	thumb_func_start ov07_02231DE8
ov07_02231DE8: ; 0x02231DE8
	push {r3, lr}
	add r3, r1, #0
	cmp r0, #0
	bne _02231DF8
	add r0, r3, #0
	bl sub_02015510
	pop {r3, pc}
_02231DF8:
	ldr r2, _02231E04 ; =ov07_02236858
	ldmia r2!, {r0, r1}
	stmia r3!, {r0, r1}
	ldr r0, [r2]
	str r0, [r3]
	pop {r3, pc}
	.balign 4, 0
_02231E04: .word ov07_02236858
	thumb_func_end ov07_02231DE8

	thumb_func_start ov07_02231E08
ov07_02231E08: ; 0x02231E08
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r1, #0
	mvn r1, r1
	add r4, r2, #0
	cmp r5, r1
	bne _02231E18
	mov r5, #0x1a
_02231E18:
	mov r1, #0
	mvn r1, r1
	cmp r4, r1
	bne _02231E22
	mov r4, #5
_02231E22:
	mov r1, #2
	bl ov07_0221FAF8
	mov r1, #1
	add r2, r1, #0
	lsl r2, r0
	orr r2, r1
	ldr r0, _02231E40 ; =0x04000050
	mov r1, #0
	add r3, r5, #0
	str r4, [sp]
	bl G2x_SetBlendAlpha_
	pop {r3, r4, r5, pc}
	nop
_02231E40: .word 0x04000050
	thumb_func_end ov07_02231E08

	thumb_func_start ov07_02231E44
ov07_02231E44: ; 0x02231E44
	push {r3, r4, r5, lr}
	mov r0, #0
	add r4, r2, #0
	mvn r0, r0
	add r5, r1, #0
	cmp r4, r0
	bne _02231E54
	mov r4, #0x1a
_02231E54:
	mov r0, #0
	mvn r0, r0
	cmp r3, r0
	bne _02231E5E
	mov r3, #5
_02231E5E:
	ldr r0, _02231E70 ; =0x04000050
	str r3, [sp]
	mov r1, #0
	add r2, r5, #0
	add r3, r4, #0
	bl G2x_SetBlendAlpha_
	pop {r3, r4, r5, pc}
	nop
_02231E70: .word 0x04000050
	thumb_func_end ov07_02231E44

	thumb_func_start ov07_02231E74
ov07_02231E74: ; 0x02231E74
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	mov r0, #0
	add r5, r1, #0
	mvn r0, r0
	add r4, r2, #0
	cmp r5, r0
	bne _02231E86
	mov r5, #0x1a
_02231E86:
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	bne _02231E90
	mov r4, #5
_02231E90:
	add r0, r6, #0
	mov r1, #2
	bl ov07_0221FAF8
	mov r1, #1
	add r2, r1, #0
	lsl r2, r0
	mov r0, #0x11
	add r7, r2, #0
	orr r7, r0
	add r0, r6, #0
	bl ov07_0221FAF8
	mov r1, #1
	lsl r1, r0
	ldr r0, _02231EBC ; =0x04000050
	add r2, r7, #0
	add r3, r5, #0
	str r4, [sp]
	bl G2x_SetBlendAlpha_
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02231EBC: .word 0x04000050
	thumb_func_end ov07_02231E74

	thumb_func_start ov07_02231EC0
ov07_02231EC0: ; 0x02231EC0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r2, #0
	cmp r1, #0
	bne _02231F14
	mov r1, #1
	bl ov07_0221FAF8
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221FAF8
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221FAF8
	add r2, r0, #0
	mov r0, #1
	add r3, r0, #0
	add r1, r0, #0
	lsl r3, r7
	lsl r0, r2
	lsl r1, r6
	orr r0, r3
	orr r1, r0
	mov r0, #0x11
	add r2, r1, #0
	orr r2, r0
	ldr r0, _02231F94 ; =0x04000048
	ldrh r1, [r0]
	mov r0, #0x3f
	bic r1, r0
	orr r1, r2
	cmp r4, #0
	beq _02231F0E
	mov r0, #0x20
	orr r1, r0
_02231F0E:
	ldr r0, _02231F94 ; =0x04000048
	strh r1, [r0]
	b _02231F5E
_02231F14:
	mov r1, #1
	bl ov07_0221FAF8
	add r6, r0, #0
	add r0, r5, #0
	mov r1, #2
	bl ov07_0221FAF8
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221FAF8
	add r2, r0, #0
	mov r0, #1
	add r3, r0, #0
	add r1, r0, #0
	lsl r0, r2
	lsl r3, r7
	lsl r1, r6
	orr r0, r3
	orr r1, r0
	ldr r2, _02231F94 ; =0x04000048
	add r3, r1, #0
	mov r0, #0x11
	orr r3, r0
	ldrh r1, [r2]
	ldr r0, _02231F98 ; =0xFFFFC0FF
	and r1, r0
	lsl r0, r3, #8
	orr r1, r0
	cmp r4, #0
	beq _02231F5A
	lsr r0, r2, #0xd
	orr r1, r0
_02231F5A:
	ldr r0, _02231F94 ; =0x04000048
	strh r1, [r0]
_02231F5E:
	add r0, r5, #0
	mov r1, #0
	bl ov07_0221FAF8
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl ov07_0221FAF8
	mov r1, #1
	add r2, r1, #0
	lsl r1, r0
	lsl r2, r4
	orr r1, r2
	add r3, r1, #0
	ldr r1, _02231F9C ; =0x0400004A
	mov r0, #0x11
	orr r3, r0
	ldrh r2, [r1]
	mov r0, #0x3f
	bic r2, r0
	orr r2, r3
	mov r0, #0x20
	orr r0, r2
	strh r0, [r1]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02231F94: .word 0x04000048
_02231F98: .word 0xFFFFC0FF
_02231F9C: .word 0x0400004A
	thumb_func_end ov07_02231EC0

	thumb_func_start ov07_02231FA0
ov07_02231FA0: ; 0x02231FA0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _02231FB2
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	pop {r3, r4, r5, pc}
_02231FB2:
	bl sub_020094BC
	cmp r0, #0
	bne _02231FC2
	mov r0, #0
	strh r0, [r4]
	strh r0, [r4, #2]
	pop {r3, r4, r5, pc}
_02231FC2:
	add r0, r5, #0
	mov r1, #0
	bl sub_02008A78
	strh r0, [r4]
	add r0, r5, #0
	mov r1, #1
	bl sub_02008A78
	strh r0, [r4, #2]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02231FA0

	thumb_func_start ov07_02231FD8
ov07_02231FD8: ; 0x02231FD8
	ldr r3, _02231FE0 ; =sub_0200DE44
	add r2, r1, #2
	bx r3
	nop
_02231FE0: .word sub_0200DE44
	thumb_func_end ov07_02231FD8

	thumb_func_start ov07_02231FE4
ov07_02231FE4: ; 0x02231FE4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0
	strb r1, [r4]
	strb r1, [r4, #1]
	strb r1, [r4, #2]
	add r5, r0, #0
	strb r1, [r4, #3]
	str r5, [r4, #4]
	bl ov07_0221C530
	str r0, [r4, #8]
	add r0, r5, #0
	bl ov07_0221C514
	str r0, [r4, #0xc]
	add r0, r5, #0
	bl ov07_0221C528
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl ov07_0221C4A0
	str r0, [r4, #0x14]
	add r0, r5, #0
	bl ov07_0221FA78
	str r0, [r4, #0x18]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02231FE4

	thumb_func_start ov07_02232020
ov07_02232020: ; 0x02232020
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r1, #0
	add r4, r3, #0
	mov r1, #0
	str r1, [r4]
	mov r1, #0x40
	and r1, r7
	add r6, r0, #0
	add r5, r2, #0
	cmp r1, #0x40
	beq _0223203A
	b _0223215C
_0223203A:
	bl ov07_0221C468
	add r7, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl ov07_0221FA48
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _0223207C
	str r7, [r1, #0x10]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #8]
	add r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0223207C:
	add r0, r6, #0
	add r1, r7, #0
	bl ov07_0223197C
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	add r0, r6, #0
	bl ov07_0221FA48
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _022320C4
	ldr r1, [sp, #4]
	str r1, [r0, #0x10]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #8]
	add r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_022320C4:
	add r0, r6, #0
	add r1, r7, #0
	bl ov07_0221FA04
	bl ov07_022319E0
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_02231958
	add r7, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl ov07_0221FA48
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #8]
	cmp r0, #0
	beq _02232116
	str r7, [r1, #0x10]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #8]
	add r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_02232116:
	add r0, r6, #0
	add r1, r7, #0
	bl ov07_0223197C
	add r7, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl ov07_0221FA48
	ldr r2, [r4]
	mov r1, #0x14
	add r3, r2, #0
	mul r3, r1
	add r2, r5, r3
	str r0, [r2, #8]
	ldr r0, [r4]
	add r2, r0, #0
	mul r2, r1
	add r2, r5, r2
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _0223223E
	str r7, [r2, #0x10]
	ldr r0, [r4]
	mul r1, r0
	add r1, r5, r1
	ldr r0, [r1, #8]
	add r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add sp, #0x10
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0223215C:
	mov r1, #0x20
	and r1, r7
	cmp r1, #0x20
	bne _0223225C
	bl ov07_0221C468
	add r7, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	bl ov07_0223197C
	str r0, [sp, #8]
	cmp r0, r7
	beq _022321B6
	ldr r1, [sp, #8]
	add r0, r6, #0
	bl ov07_0221FA48
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _022321B6
	ldr r1, [sp, #8]
	str r1, [r0, #0x10]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #8]
	add r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_022321B6:
	add r0, r6, #0
	add r1, r7, #0
	bl ov07_0221FA04
	bl ov07_022319E0
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_02231958
	str r0, [sp]
	cmp r0, r7
	beq _0223220E
	ldr r1, [sp]
	add r0, r6, #0
	bl ov07_0221FA48
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	ldr r1, [r0, #8]
	cmp r1, #0
	beq _0223220E
	ldr r1, [sp]
	str r1, [r0, #0x10]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #8]
	add r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0223220E:
	ldr r1, [sp]
	add r0, r6, #0
	bl ov07_0223197C
	str r0, [sp, #0xc]
	cmp r0, r7
	beq _0223223E
	ldr r1, [sp, #0xc]
	add r0, r6, #0
	bl ov07_0221FA48
	ldr r2, [r4]
	mov r1, #0x14
	add r3, r2, #0
	mul r3, r1
	add r2, r5, r3
	str r0, [r2, #8]
	ldr r0, [r4]
	add r2, r0, #0
	mul r2, r1
	add r2, r5, r2
	ldr r0, [r2, #8]
	cmp r0, #0
	bne _02232240
_0223223E:
	b _022323F6
_02232240:
	ldr r0, [sp, #0xc]
	str r0, [r2, #0x10]
	ldr r0, [r4]
	mul r1, r0
	add r1, r5, r1
	ldr r0, [r1, #8]
	add r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add sp, #0x10
	add r0, r0, #1
	str r0, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_0223225C:
	mov r1, #2
	and r1, r7
	cmp r1, #2
	bne _022322B6
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0221FA48
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _022322B6
	add r0, r6, #0
	bl ov07_0221C468
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #0x10]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #8]
	add r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_022322B6:
	add r0, r6, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _0223232C
	mov r0, #4
	and r0, r7
	cmp r0, #4
	bne _0223232C
	add r0, r6, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0223197C
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0221FA48
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _0223232C
	add r0, r6, #0
	bl ov07_0221C468
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0223197C
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #0x10]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #8]
	add r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0223232C:
	mov r0, #8
	and r0, r7
	cmp r0, #8
	bne _02232388
	add r0, r6, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0221FA48
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #8]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _02232388
	add r0, r6, #0
	bl ov07_0221C470
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #0x10]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #8]
	add r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_02232388:
	add r0, r6, #0
	bl ov07_0221FAB0
	cmp r0, #1
	bne _022323F6
	mov r0, #0x10
	and r0, r7
	cmp r0, #0x10
	bne _022323F6
	add r0, r6, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0223197C
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0221FA48
	ldr r2, [r4]
	mov r1, #0x14
	add r3, r2, #0
	mul r3, r1
	add r2, r5, r3
	str r0, [r2, #8]
	ldr r0, [r4]
	mul r1, r0
	add r0, r5, r1
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _022323F6
	add r0, r6, #0
	bl ov07_0221C470
	add r1, r0, #0
	add r0, r6, #0
	bl ov07_0223197C
	ldr r2, [r4]
	mov r1, #0x14
	add r3, r2, #0
	mul r3, r1
	add r2, r5, r3
	str r0, [r2, #0x10]
	ldr r0, [r4]
	mul r1, r0
	add r1, r5, r1
	ldr r0, [r1, #8]
	add r1, r1, #4
	bl ov07_02231FA0
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_022323F6:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_02232020

	thumb_func_start ov07_022323FC
ov07_022323FC: ; 0x022323FC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	add r4, r3, #0
	mov r1, #0
	str r1, [r4]
	mov r1, #2
	and r1, r6
	add r7, r0, #0
	add r5, r2, #0
	cmp r1, #2
	bne _0223243C
	ldr r1, [r4]
	bl ov07_0221C4E8
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #0xc]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #0xc]
	add r1, r1, #4
	bl ov07_02231FD8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_0223243C:
	mov r0, #4
	and r0, r6
	cmp r0, #4
	bne _02232470
	ldr r1, [r4]
	add r0, r7, #0
	bl ov07_0221C4E8
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #0xc]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #0xc]
	add r1, r1, #4
	bl ov07_02231FD8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_02232470:
	mov r0, #8
	and r0, r6
	cmp r0, #8
	bne _022324A4
	ldr r1, [r4]
	add r0, r7, #0
	bl ov07_0221C4E8
	add r2, r0, #0
	ldr r0, [r4]
	mov r3, #0x14
	add r1, r0, #0
	mul r1, r3
	add r0, r5, r1
	str r2, [r0, #0xc]
	ldr r0, [r4]
	add r1, r0, #0
	mul r1, r3
	add r1, r5, r1
	ldr r0, [r1, #0xc]
	add r1, r1, #4
	bl ov07_02231FD8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_022324A4:
	mov r0, #0x10
	and r0, r6
	cmp r0, #0x10
	bne _022324D4
	ldr r1, [r4]
	add r0, r7, #0
	bl ov07_0221C4E8
	ldr r2, [r4]
	mov r1, #0x14
	add r3, r2, #0
	mul r3, r1
	add r2, r5, r3
	str r0, [r2, #0xc]
	ldr r0, [r4]
	mul r1, r0
	add r1, r5, r1
	ldr r0, [r1, #0xc]
	add r1, r1, #4
	bl ov07_02231FD8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
_022324D4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov07_022323FC

	thumb_func_start ov07_022324D8
ov07_022324D8: ; 0x022324D8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	add r5, r1, #0
	cmp r4, #0
	bne _022324E6
	bl GF_AssertFail
_022324E6:
	add r0, r4, #0
	bl ov07_0221BFD0
	add r1, r5, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _022324FA
	bl GF_AssertFail
_022324FA:
	add r0, r4, #0
	mov r1, #0
	add r2, r5, #0
	bl memset
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022324D8

	thumb_func_start ov07_02232508
ov07_02232508: ; 0x02232508
	push {r4, lr}
	add r4, r0, #0
	bne _02232512
	bl GF_AssertFail
_02232512:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02232508

	thumb_func_start ov07_0223251C
ov07_0223251C: ; 0x0223251C
	cmp r0, #1
	blt _02232528
	cmp r0, #0x18
	bgt _02232528
	sub r0, r0, #1
	bx lr
_02232528:
	mov r2, #0xfa
	lsl r2, r2, #2
	cmp r0, r2
	blt _0223253C
	add r1, r2, #0
	add r1, #0x1b
	cmp r0, r1
	bgt _0223253C
	sub r0, r0, r2
	bx lr
_0223253C:
	mov r0, #3
	bx lr
	thumb_func_end ov07_0223251C

	thumb_func_start ov07_02232540
ov07_02232540: ; 0x02232540
	push {r3, r4, r5}
	sub sp, #0x2c
	ldr r5, _0223257C ; =ov07_02237228
	add r2, r0, #0
	add r4, sp, #0
	mov r3, #5
_0223254C:
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	sub r3, r3, #1
	bne _0223254C
	ldr r0, [r5]
	str r0, [r4]
	mov r0, #0
	add r3, r0, #0
	add r4, sp, #0
_0223255E:
	ldr r1, [r4]
	cmp r2, r1
	bne _0223256C
	add sp, #0x2c
	mov r0, #1
	pop {r3, r4, r5}
	bx lr
_0223256C:
	add r3, r3, #1
	add r4, r4, #4
	cmp r3, #0xb
	blo _0223255E
	add sp, #0x2c
	pop {r3, r4, r5}
	bx lr
	nop
_0223257C: .word ov07_02237228
	thumb_func_end ov07_02232540

	thumb_func_start ov07_02232580
ov07_02232580: ; 0x02232580
	push {r4, r5}
	sub sp, #0x18
	ldr r3, _022325B8 ; =ov07_02237188
	add r2, sp, #0
	add r5, r0, #0
	add r4, r2, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	mov r0, #0
	add r2, r0, #0
_0223259C:
	ldr r1, [r4]
	cmp r5, r1
	bne _022325AA
	add sp, #0x18
	mov r0, #1
	pop {r4, r5}
	bx lr
_022325AA:
	add r2, r2, #1
	add r4, r4, #4
	cmp r2, #6
	blo _0223259C
	add sp, #0x18
	pop {r4, r5}
	bx lr
	.balign 4, 0
_022325B8: .word ov07_02237188
	thumb_func_end ov07_02232580

	thumb_func_start ov07_022325BC
ov07_022325BC: ; 0x022325BC
	push {r3, r4, r5}
	sub sp, #0xc
	ldr r5, _022325F0 ; =ov07_0223717C
	add r3, r0, #0
	ldmia r5!, {r0, r1}
	add r4, sp, #0
	add r2, r4, #0
	stmia r4!, {r0, r1}
	ldr r0, [r5]
	str r0, [r4]
	mov r0, #1
	mov r4, #0
_022325D4:
	ldr r1, [r2]
	cmp r3, r1
	bne _022325E2
	add sp, #0xc
	mov r0, #0
	pop {r3, r4, r5}
	bx lr
_022325E2:
	add r4, r4, #1
	add r2, r2, #4
	cmp r4, #3
	blo _022325D4
	add sp, #0xc
	pop {r3, r4, r5}
	bx lr
	.balign 4, 0
_022325F0: .word ov07_0223717C
	thumb_func_end ov07_022325BC

	thumb_func_start ov07_022325F4
ov07_022325F4: ; 0x022325F4
	push {r3, lr}
	bl ov07_0223251C
	lsl r1, r0, #3
	ldr r0, _02232604 ; =ov07_0223738C
	ldr r0, [r0, r1]
	pop {r3, pc}
	nop
_02232604: .word ov07_0223738C
	thumb_func_end ov07_022325F4

	thumb_func_start ov07_02232608
ov07_02232608: ; 0x02232608
	push {r3, lr}
	bl ov07_0223251C
	lsl r1, r0, #3
	ldr r0, _02232618 ; =ov07_02237390
	ldr r0, [r0, r1]
	pop {r3, pc}
	nop
_02232618: .word ov07_02237390
	thumb_func_end ov07_02232608

	thumb_func_start ov07_0223261C
ov07_0223261C: ; 0x0223261C
	push {r3, lr}
	bl ov07_0223251C
	mov r1, #0xc
	mul r1, r0
	ldr r0, _0223262C ; =ov07_0223746C
	ldr r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_0223262C: .word ov07_0223746C
	thumb_func_end ov07_0223261C

	thumb_func_start ov07_02232630
ov07_02232630: ; 0x02232630
	push {r3, lr}
	bl ov07_0223251C
	mov r1, #0xc
	mul r1, r0
	ldr r0, _02232640 ; =ov07_02237474
	ldr r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_02232640: .word ov07_02237474
	thumb_func_end ov07_02232630

	thumb_func_start ov07_02232644
ov07_02232644: ; 0x02232644
	push {r3, lr}
	bl ov07_0223251C
	mov r1, #0xc
	mul r1, r0
	ldr r0, _02232654 ; =ov07_02237470
	ldr r0, [r0, r1]
	pop {r3, pc}
	.balign 4, 0
_02232654: .word ov07_02237470
	thumb_func_end ov07_02232644

	thumb_func_start ov07_02232658
ov07_02232658: ; 0x02232658
	push {r4, lr}
	add r4, r1, #0
	bl ov07_0223251C
	lsl r2, r0, #4
	ldr r0, _0223266C ; =ov07_022375BC
	lsl r1, r4, #2
	add r0, r0, r2
	ldr r0, [r1, r0]
	pop {r4, pc}
	.balign 4, 0
_0223266C: .word ov07_022375BC
	thumb_func_end ov07_02232658

	thumb_func_start ov07_02232670
ov07_02232670: ; 0x02232670
	push {r4, lr}
	mov r1, #0xb8
	add r4, r0, #0
	bl AllocFromHeap
	cmp r0, #0
	bne _02232686
	bl GF_AssertFail
	mov r0, #0
	pop {r4, pc}
_02232686:
	add r1, r0, #0
	str r4, [r0]
	mov r2, #0
	add r1, #0x88
	str r2, [r1]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02232670

	thumb_func_start ov07_02232694
ov07_02232694: ; 0x02232694
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl ov07_02232670
	add r1, r5, #0
	add r4, r0, #0
	bl ov07_022326C0
	mov r1, #0
	str r1, [r4, #0x10]
	add r2, r4, #0
	add r0, r1, #0
_022326AC:
	str r0, [r2, #0x14]
	str r0, [r2, #0x38]
	str r0, [r2, #0x5c]
	add r1, r1, #1
	add r2, r2, #4
	cmp r1, #9
	blt _022326AC
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02232694

	thumb_func_start ov07_022326C0
ov07_022326C0: ; 0x022326C0
	push {r4, lr}
	add r3, r1, #0
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	add r2, r4, #4
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	mov r1, #0xa2
	str r0, [r2]
	ldr r0, [r4, #0xc]
	mov r2, #0
	bl GetMonData
	add r1, r4, #0
	add r1, #0x9c
	str r0, [r1]
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0xd
	blt _022326EE
	bl GF_AssertFail
_022326EE:
	add r0, r4, #0
	add r0, #0x9c
	ldr r0, [r0]
	cmp r0, #0
	bne _0223271A
	add r0, r4, #0
	mov r2, #0
	add r0, #0x94
	str r2, [r0]
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0223270C
	add r4, #0x98
	str r0, [r4]
	pop {r4, pc}
_0223270C:
	ldr r0, [r4, #0xc]
	mov r1, #0x9b
	bl GetMonData
	add r4, #0x98
	str r0, [r4]
	pop {r4, pc}
_0223271A:
	add r0, r4, #0
	mov r1, #1
	add r0, #0x94
	str r1, [r0]
	ldr r0, [r4, #0xc]
	add r4, #0xa0
	mov r1, #0xab
	add r2, r4, #0
	bl GetMonData
	pop {r4, pc}
	thumb_func_end ov07_022326C0

	thumb_func_start ov07_02232730
ov07_02232730: ; 0x02232730
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r1, #0
	str r0, [sp]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #3
	bls _02232744
	b _022329AC
_02232744:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02232750: ; jump table
	.short _02232758 - _02232750 - 2 ; case 0
	.short _022327F6 - _02232750 - 2 ; case 1
	.short _02232886 - _02232750 - 2 ; case 2
	.short _02232916 - _02232750 - 2 ; case 3
_02232758:
	ldr r1, [r4]
	mov r0, #0x5f
	bl NARC_ctor
	add r1, r4, #0
	add r1, #0x8c
	str r0, [r1]
	add r0, r4, #0
	add r6, r4, #0
	str r0, [sp, #0x14]
	add r0, #0xa0
	mov r5, #0
	add r6, #0x10
	str r0, [sp, #0x14]
_02232774:
	ldr r0, [sp, #0x14]
	add r1, r5, #0
	bl CapsuleGetSealI
	add r7, r0, #0
	beq _022327E0
	bl SealOnCapsuleGetID
	cmp r0, #0
	beq _022327E0
	cmp r0, #0x51
	bge _022327E0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02091084
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	str r7, [r0, #0x38]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _022327AE
	bl GF_AssertFail
_022327AE:
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [sp, #0x10]
	mov r3, #0
	bl ov07_0221FEE4
	ldr r1, [r4, #0x10]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #0x14]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _022327DA
	bne _022327E0
	bl GF_AssertFail
	b _022327E0
_022327DA:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_022327E0:
	add r5, r5, #1
	cmp r5, #2
	blt _02232774
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	add r4, #0x90
	add r0, r0, #1
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_022327F6:
	add r0, r4, #0
	add r6, r4, #0
	str r0, [sp, #0x18]
	add r0, #0xa0
	mov r5, #2
	add r6, #0x10
	str r0, [sp, #0x18]
_02232804:
	ldr r0, [sp, #0x18]
	add r1, r5, #0
	bl CapsuleGetSealI
	add r7, r0, #0
	beq _02232870
	bl SealOnCapsuleGetID
	cmp r0, #0
	beq _02232870
	cmp r0, #0x51
	bge _02232870
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02091084
	str r0, [sp, #4]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	str r7, [r0, #0x38]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _0223283E
	bl GF_AssertFail
_0223283E:
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [sp, #4]
	mov r3, #0
	bl ov07_0221FEE4
	ldr r1, [r4, #0x10]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #0x14]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0223286A
	bne _02232870
	bl GF_AssertFail
	b _02232870
_0223286A:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_02232870:
	add r5, r5, #1
	cmp r5, #4
	blt _02232804
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	add r4, #0x90
	add r0, r0, #1
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_02232886:
	add r0, r4, #0
	add r6, r4, #0
	str r0, [sp, #0x1c]
	add r0, #0xa0
	mov r5, #4
	add r6, #0x10
	str r0, [sp, #0x1c]
_02232894:
	ldr r0, [sp, #0x1c]
	add r1, r5, #0
	bl CapsuleGetSealI
	add r7, r0, #0
	beq _02232900
	bl SealOnCapsuleGetID
	cmp r0, #0
	beq _02232900
	cmp r0, #0x51
	bge _02232900
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02091084
	str r0, [sp, #8]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	str r7, [r0, #0x38]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _022328CE
	bl GF_AssertFail
_022328CE:
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [sp, #8]
	mov r3, #0
	bl ov07_0221FEE4
	ldr r1, [r4, #0x10]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #0x14]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _022328FA
	bne _02232900
	bl GF_AssertFail
	b _02232900
_022328FA:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_02232900:
	add r5, r5, #1
	cmp r5, #6
	blt _02232894
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	add r4, #0x90
	add r0, r0, #1
	add sp, #0x24
	str r0, [r4]
	pop {r4, r5, r6, r7, pc}
_02232916:
	add r0, r4, #0
	add r6, r4, #0
	str r0, [sp, #0x20]
	add r0, #0xa0
	mov r5, #6
	add r6, #0x10
	str r0, [sp, #0x20]
_02232924:
	ldr r0, [sp, #0x20]
	add r1, r5, #0
	bl CapsuleGetSealI
	add r7, r0, #0
	beq _02232990
	bl SealOnCapsuleGetID
	cmp r0, #0
	beq _02232990
	cmp r0, #0x51
	bge _02232990
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_02091084
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	str r7, [r0, #0x38]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	beq _0223295E
	bl GF_AssertFail
_0223295E:
	add r0, r4, #0
	add r0, #0x8c
	ldr r0, [r0]
	ldr r1, [r4]
	ldr r2, [sp, #0xc]
	mov r3, #0
	bl ov07_0221FEE4
	ldr r1, [r4, #0x10]
	lsl r1, r1, #2
	add r1, r4, r1
	str r0, [r1, #0x14]
	ldr r0, [r4, #0x10]
	lsl r0, r0, #2
	add r0, r4, r0
	ldr r0, [r0, #0x14]
	cmp r0, #0
	bne _0223298A
	bne _02232990
	bl GF_AssertFail
	b _02232990
_0223298A:
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
_02232990:
	add r5, r5, #1
	cmp r5, #8
	blt _02232924
	add r0, r4, #0
	mov r1, #0xff
	add r0, #0x90
	add r4, #0x8c
	str r1, [r0]
	ldr r0, [r4]
	bl NARC_dtor
	ldr r0, [sp]
	bl DestroySysTask
_022329AC:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_02232730

	thumb_func_start ov07_022329B0
ov07_022329B0: ; 0x022329B0
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x94
	ldr r0, [r0]
	cmp r0, #0
	bne _022329E0
	add r0, r4, #0
	add r0, #0x98
	ldr r0, [r0]
	bl ov07_022325F4
	add r2, r0, #0
	mov r0, #1
	str r0, [r4, #0x10]
	ldr r0, [r4]
	mov r1, #0x5f
	mov r3, #0
	bl ov07_0221FEB0
	str r0, [r4, #0x14]
	mov r0, #0xff
	add r4, #0x90
	str r0, [r4]
	pop {r4, pc}
_022329E0:
	mov r1, #0
	add r0, r4, #0
	mov r2, #0xfa
	str r1, [r4, #0x10]
	add r0, #0x90
	str r1, [r0]
	ldr r0, _02232A00 ; =ov07_02232730
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	add r1, r4, #0
	bl ov07_02232730
	pop {r4, pc}
	nop
_02232A00: .word ov07_02232730
	thumb_func_end ov07_022329B0

	thumb_func_start ov07_02232A04
ov07_02232A04: ; 0x02232A04
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xff
	bne _02232A10
	mov r0, #1
	bx lr
_02232A10:
	mov r0, #0
	bx lr
	thumb_func_end ov07_02232A04

	thumb_func_start ov07_02232A14
ov07_02232A14: ; 0x02232A14
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r1, #1
	add r0, #0x88
	str r1, [r0]
	bl ov07_0221C69C
	add r0, r5, #0
	add r1, r4, #0
	bl ov07_02232AFC
	mov r2, #0xfa
	ldr r0, _02232A40 ; =ov07_02232A5C
	add r1, r5, #0
	lsl r2, r2, #2
	bl CreateSysTask
	add r5, #0x84
	str r0, [r5]
	pop {r3, r4, r5, pc}
	nop
_02232A40: .word ov07_02232A5C
	thumb_func_end ov07_02232A14

	thumb_func_start ov07_02232A44
ov07_02232A44: ; 0x02232A44
	ldr r3, _02232A4C ; =ov07_02232A14
	ldr r1, _02232A50 ; =ov07_02232C28
	bx r3
	nop
_02232A4C: .word ov07_02232A14
_02232A50: .word ov07_02232C28
	thumb_func_end ov07_02232A44

	thumb_func_start ov07_02232A54
ov07_02232A54: ; 0x02232A54
	add r0, #0x88
	ldr r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_02232A54

	thumb_func_start ov07_02232A5C
ov07_02232A5C: ; 0x02232A5C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r1, #0
	str r0, [sp]
	ldr r0, [r6, #0x10]
	mov r7, #0
	cmp r0, #9
	ble _02232A6E
	bl GF_AssertFail
_02232A6E:
	ldr r0, [r6, #0x10]
	mov r4, #0
	cmp r0, #0
	ble _02232AA6
	add r5, r6, #0
_02232A78:
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _02232A9C
	bl sub_020154B0
	cmp r0, #0
	bne _02232A9A
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	beq _02232A9A
	ldr r0, [r5, #0x14]
	bl ov07_0221FF2C
	mov r0, #0
	str r0, [r5, #0x14]
	str r0, [r5, #0x5c]
	b _02232A9C
_02232A9A:
	mov r7, #1
_02232A9C:
	ldr r0, [r6, #0x10]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _02232A78
_02232AA6:
	cmp r7, #0
	bne _02232AB6
	mov r0, #0
	add r6, #0x88
	str r0, [r6]
	ldr r0, [sp]
	bl DestroySysTask
_02232AB6:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_02232A5C

	thumb_func_start ov07_02232AB8
ov07_02232AB8: ; 0x02232AB8
	ldr r3, _02232ABC ; =FreeToHeap
	bx r3
	.balign 4, 0
_02232ABC: .word FreeToHeap
	thumb_func_end ov07_02232AB8

	thumb_func_start ov07_02232AC0
ov07_02232AC0: ; 0x02232AC0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	bne _02232AF4
	ldr r0, [r4, #0xc]
	mov r1, #1
	str r1, [r0]
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x18]
	mov r1, #0
	add r3, r4, #0
	bl sub_02015494
	ldr r0, [r4, #0x10]
	mov r1, #1
	bl sub_02015528
	add r0, r5, #0
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r3, r4, r5, pc}
_02232AF4:
	sub r0, r0, #1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02232AC0

	thumb_func_start ov07_02232AFC
ov07_02232AFC: ; 0x02232AFC
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	add r0, #0x94
	ldr r0, [r0]
	add r7, r1, #0
	cmp r0, #0
	bne _02232B3A
	add r0, r6, #0
	add r0, #0x98
	ldr r0, [r0]
	bl ov07_02232608
	add r5, r0, #0
	mov r4, #0
	cmp r5, #0
	ble _02232B2E
_02232B1C:
	ldr r0, [r6, #0x14]
	add r1, r4, #0
	add r2, r7, #0
	add r3, r6, #0
	bl sub_02015494
	add r4, r4, #1
	cmp r4, r5
	blt _02232B1C
_02232B2E:
	mov r1, #1
	str r1, [r6, #0x5c]
	ldr r0, [r6, #0x14]
	bl sub_02015528
	pop {r3, r4, r5, r6, r7, pc}
_02232B3A:
	ldr r0, [r6, #0x10]
	mov r7, #0
	cmp r0, #0
	ble _02232BA0
	add r0, r6, #0
	str r0, [sp]
	add r0, #0x5c
	add r5, r6, #0
	str r0, [sp]
_02232B4C:
	ldr r0, [r6]
	mov r1, #0x1c
	bl AllocFromHeap
	add r4, r0, #0
	bne _02232B5C
	bl GF_AssertFail
_02232B5C:
	str r7, [r4]
	ldr r0, [r6, #4]
	str r0, [r4, #8]
	ldr r0, _02232BA4 ; =ov07_02232C64
	str r0, [r4, #0x18]
	mov r0, #0
	str r0, [r5, #0x5c]
	ldr r0, [sp]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0x14]
	str r0, [r4, #0x10]
	ldr r0, [r5, #0x38]
	str r0, [r4, #0x14]
	cmp r0, #0
	bne _02232B7E
	bl GF_AssertFail
_02232B7E:
	ldr r0, [r4, #0x14]
	bl ov07_02234530
	str r0, [r4, #4]
	ldr r0, _02232BA8 ; =ov07_02232AC0
	ldr r2, _02232BAC ; =0x000003E9
	add r1, r4, #0
	bl CreateSysTask
	ldr r0, [sp]
	add r7, r7, #1
	add r0, r0, #4
	str r0, [sp]
	ldr r0, [r6, #0x10]
	add r5, r5, #4
	cmp r7, r0
	blt _02232B4C
_02232BA0:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02232BA4: .word ov07_02232C64
_02232BA8: .word ov07_02232AC0
_02232BAC: .word 0x000003E9
	thumb_func_end ov07_02232AFC

	thumb_func_start ov07_02232BB0
ov07_02232BB0: ; 0x02232BB0
	push {r3, r4, r5, lr}
	mov r2, #0
	mov r3, #1
	add r5, r0, #0
	add r4, r1, #0
	bl ov07_02231DE0
	cmp r5, #5
	bhi _02232C06
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02232BCE: ; jump table
	.short _02232BDA - _02232BCE - 2 ; case 0
	.short _02232BE2 - _02232BCE - 2 ; case 1
	.short _02232BEC - _02232BCE - 2 ; case 2
	.short _02232BF4 - _02232BCE - 2 ; case 3
	.short _02232BFE - _02232BCE - 2 ; case 4
	.short _02232C06 - _02232BCE - 2 ; case 5
_02232BDA:
	mov r5, #0
	add r0, r5, #0
	sub r0, #0x10
	b _02232C0E
_02232BE2:
	mov r5, #0xe
	mvn r5, r5
	add r0, r5, #0
	sub r0, #0xa
	b _02232C0E
_02232BEC:
	mov r5, #7
	mvn r5, r5
	sub r0, r5, #4
	b _02232C0E
_02232BF4:
	mov r5, #0xd
	mvn r5, r5
	add r0, r5, #0
	sub r0, #0xb
	b _02232C0E
_02232BFE:
	mov r5, #7
	mvn r5, r5
	sub r0, r5, #4
	b _02232C0E
_02232C06:
	mov r5, #0xf
	mvn r5, r5
	add r0, r5, #0
	sub r0, #0xd
_02232C0E:
	add r5, #0xa
	ldr r3, [r4]
	mov r1, #0xac
	add r2, r5, #0
	mul r2, r1
	sub r2, r3, r2
	str r2, [r4]
	add r0, #0x20
	ldr r2, [r4, #4]
	mul r1, r0
	sub r0, r2, r1
	str r0, [r4, #4]
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_02232BB0

	thumb_func_start ov07_02232C28
ov07_02232C28: ; 0x02232C28
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_02015504
	ldr r0, [r0, #4]
	add r1, sp, #0
	bl ov07_02232BB0
	ldr r0, [r4, #0x20]
	ldr r1, [sp]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r1, r0
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r4, #0x30]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02232C28

	thumb_func_start ov07_02232C64
ov07_02232C64: ; 0x02232C64
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl sub_02015504
	add r4, r0, #0
	ldr r0, [r4, #8]
	add r1, sp, #0
	bl ov07_02232BB0
	ldr r0, [r4, #0x14]
	bl SealOnCapsuleGetID
	bl sub_0209109C
	ldr r0, [r4, #0x14]
	bl SealOnCapsuleGetX
	add r6, r0, #0
	ldr r0, [r4, #0x14]
	bl SealOnCapsuleGetY
	sub r6, #0xbe
	lsl r1, r6, #0x10
	asr r3, r1, #0x10
	ldr r2, [sp]
	mov r1, #0xac
	add r4, r3, #0
	mul r4, r1
	add r3, r2, r4
	mov r4, #0x64
	sub r0, r4, r0
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	ldr r2, [sp, #4]
	mul r1, r0
	add r0, r2, r1
	str r3, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r3, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #4]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r5, #0x2c]
	ldr r0, [r5, #0x20]
	ldr r1, [sp, #8]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	add r0, r1, r0
	str r0, [r5, #0x30]
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov07_02232C64

	thumb_func_start ov07_02232CD8
ov07_02232CD8: ; 0x02232CD8
	push {r4, lr}
	add r4, r0, #0
	bl sub_02015504
	mov r1, #2
	ldrsh r2, [r0, r1]
	mov r1, #0x64
	mov r3, #0xac
	sub r1, r1, r2
	lsl r1, r1, #0x10
	asr r2, r1, #0x10
	add r1, r2, #0
	mov r2, #0
	ldrsh r0, [r0, r2]
	mul r1, r3
	sub r0, #0x81
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add r2, r0, #0
	ldr r0, [r4, #0x20]
	mul r2, r3
	ldr r0, [r0]
	ldr r0, [r0, #4]
	add r0, r2, r0
	str r0, [r4, #0x28]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #8]
	add r0, r1, r0
	str r0, [r4, #0x2c]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	str r0, [r4, #0x30]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02232CD8

	thumb_func_start ov07_02232D20
ov07_02232D20: ; 0x02232D20
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	mov r1, #0x24
	bl AllocFromHeap
	add r4, r0, #0
	bne _02232D34
	bl GF_AssertFail
_02232D34:
	ldmia r5!, {r0, r1}
	add r2, r4, #0
	stmia r2!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	str r0, [r2]
	ldr r0, [r4, #0x10]
	cmp r0, #0
	beq _02232D58
	ldr r0, _02232D7C ; =0x00000403
	bl ov07_0223261C
	str r0, [r4, #0x20]
	ldr r0, _02232D7C ; =0x00000403
	bl ov07_02232630
	b _02232D66
_02232D58:
	ldr r0, [r4, #4]
	bl ov07_0223261C
	str r0, [r4, #0x20]
	ldr r0, [r4, #4]
	bl ov07_02232630
_02232D66:
	str r0, [r4, #0x1c]
	ldr r0, [r4, #8]
	ldr r2, [r4, #0x20]
	mov r1, #0x5f
	mov r3, #0
	bl ov07_0221FEB0
	str r0, [r4, #0x18]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02232D7C: .word 0x00000403
	thumb_func_end ov07_02232D20

	thumb_func_start ov07_02232D80
ov07_02232D80: ; 0x02232D80
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r1, [r5, #0xc]
	cmp r1, #0xff
	bne _02232DDA
	ldr r0, [r5, #0x10]
	cmp r0, #0
	beq _02232DB0
	ldr r0, [r5, #0x1c]
	mov r4, #0
	cmp r0, #0
	ble _02232DE4
	ldr r6, _02232DF0 ; =ov07_02232CD8
_02232D9A:
	ldr r0, [r5, #0x18]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_02015494
	ldr r0, [r5, #0x1c]
	add r4, r4, #1
	cmp r4, r0
	blt _02232D9A
	b _02232DE4
_02232DB0:
	ldr r0, [r5, #0x1c]
	mov r4, #0
	cmp r0, #0
	ble _02232DE4
	ldr r6, _02232DF0 ; =ov07_02232CD8
_02232DBA:
	ldr r0, [r5, #4]
	bl ov07_02232644
	cmp r4, r0
	beq _02232DD0
	ldr r0, [r5, #0x18]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_02015494
_02232DD0:
	ldr r0, [r5, #0x1c]
	add r4, r4, #1
	cmp r4, r0
	blt _02232DBA
	b _02232DE4
_02232DDA:
	ldr r0, [r5, #0x18]
	ldr r2, _02232DF0 ; =ov07_02232CD8
	add r3, r5, #0
	bl sub_02015494
_02232DE4:
	ldr r0, [r5, #0x18]
	mov r1, #1
	bl sub_02015528
	pop {r4, r5, r6, pc}
	nop
_02232DF0: .word ov07_02232CD8
	thumb_func_end ov07_02232D80

	thumb_func_start ov07_02232DF4
ov07_02232DF4: ; 0x02232DF4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	bl sub_020154B0
	cmp r0, #0
	bne _02232E0C
	ldr r0, [r4, #0x18]
	bl ov07_0221FF2C
	mov r0, #0
	pop {r4, pc}
_02232E0C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232DF4

	thumb_func_start ov07_02232E10
ov07_02232E10: ; 0x02232E10
	ldr r3, _02232E14 ; =FreeToHeap
	bx r3
	.balign 4, 0
_02232E14: .word FreeToHeap
	thumb_func_end ov07_02232E10

	thumb_func_start ov07_02232E18
ov07_02232E18: ; 0x02232E18
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232E2C
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #1
	bl ov07_02233EB8
_02232E2C:
	add r0, r4, #0
	mov r1, #2
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232E3C
	mov r0, #0
	pop {r4, pc}
_02232E3C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232E18

	thumb_func_start ov07_02232E40
ov07_02232E40: ; 0x02232E40
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232E54
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #3
	bl ov07_02233EB8
_02232E54:
	add r0, r4, #0
	mov r1, #4
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232E64
	mov r0, #0
	pop {r4, pc}
_02232E64:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232E40

	thumb_func_start ov07_02232E68
ov07_02232E68: ; 0x02232E68
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232E7C
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #5
	bl ov07_02233EB8
_02232E7C:
	add r0, r4, #0
	mov r1, #6
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232E8C
	mov r0, #0
	pop {r4, pc}
_02232E8C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232E68

	thumb_func_start ov07_02232E90
ov07_02232E90: ; 0x02232E90
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232EA4
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #7
	bl ov07_02233EB8
_02232EA4:
	add r0, r4, #0
	mov r1, #0xe
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232EB4
	mov r0, #0
	pop {r4, pc}
_02232EB4:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232E90

	thumb_func_start ov07_02232EB8
ov07_02232EB8: ; 0x02232EB8
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232ECC
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #0xf
	bl ov07_02233EB8
_02232ECC:
	add r0, r4, #0
	mov r1, #0x12
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232EDC
	mov r0, #0
	pop {r4, pc}
_02232EDC:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232EB8

	thumb_func_start ov07_02232EE0
ov07_02232EE0: ; 0x02232EE0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232EF4
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #0x13
	bl ov07_02233EB8
_02232EF4:
	add r0, r4, #0
	mov r1, #0x1b
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232F04
	mov r0, #0
	pop {r4, pc}
_02232F04:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232EE0

	thumb_func_start ov07_02232F08
ov07_02232F08: ; 0x02232F08
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232F1C
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #0x15
	bl ov07_02233EB8
_02232F1C:
	add r0, r4, #0
	mov r1, #0x16
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232F2C
	mov r0, #0
	pop {r4, pc}
_02232F2C:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232F08

	thumb_func_start ov07_02232F30
ov07_02232F30: ; 0x02232F30
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	cmp r1, #0
	bne _02232F44
	add r1, r1, #1
	str r1, [r4, #4]
	mov r1, #0x17
	bl ov07_02233EB8
_02232F44:
	add r0, r4, #0
	mov r1, #0x1b
	bl ov07_02233EBC
	cmp r0, #1
	bne _02232F54
	mov r0, #0
	pop {r4, pc}
_02232F54:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232F30

	thumb_func_start ov07_02232F58
ov07_02232F58: ; 0x02232F58
	str r1, [r0]
	mov r1, #0
	str r1, [r0, #4]
	bx lr
	thumb_func_end ov07_02232F58

	thumb_func_start ov07_02232F60
ov07_02232F60: ; 0x02232F60
	push {r3, lr}
	ldr r1, [r0]
	lsl r2, r1, #2
	ldr r1, _02232F70 ; =ov07_022371B8
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_02232F70: .word ov07_022371B8
	thumb_func_end ov07_02232F60

	thumb_func_start ov07_02232F74
ov07_02232F74: ; 0x02232F74
	str r1, [r0, #0x14]
	mov r1, #0
	str r1, [r0, #8]
	str r1, [r0, #0xc]
	str r1, [r0, #0x10]
	bx lr
	thumb_func_end ov07_02232F74

	thumb_func_start ov07_02232F80
ov07_02232F80: ; 0x02232F80
	mov r0, #1
	bx lr
	thumb_func_end ov07_02232F80

	thumb_func_start ov07_02232F84
ov07_02232F84: ; 0x02232F84
	push {r4, lr}
	add r4, r0, #0
	bl ov07_022335B4
	cmp r0, #0
	bne _02232F98
	add r0, r4, #0
	mov r1, #2
	bl ov07_02232F74
_02232F98:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_02232F84

	thumb_func_start ov07_02232F9C
ov07_02232F9C: ; 0x02232F9C
	push {r3, lr}
	mov r1, #3
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_02232F9C

	thumb_func_start ov07_02232FA8
ov07_02232FA8: ; 0x02232FA8
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _02233078
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02232FC0: ; jump table
	.short _02232FC8 - _02232FC0 - 2 ; case 0
	.short _0223301E - _02232FC0 - 2 ; case 1
	.short _02233034 - _02232FC0 - 2 ; case 2
	.short _02233050 - _02232FC0 - 2 ; case 3
_02232FC8:
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_0200DC4C
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	add r2, sp, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, sp, #0
	str r0, [sp, #8]
	mov r0, #0xff
	str r0, [sp, #0xc]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x30]
	add r2, #2
	bl sub_0200DE44
	add r0, r4, #0
	add r1, r4, #0
	add r0, #0xb4
	add r1, #0x94
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_0221FDFC
	add r1, r4, #0
	add r1, #0xd8
	str r0, [r1]
	add r0, sp, #0
	bl ov07_02232D20
	add r1, r4, #0
	add r1, #0xd0
	str r0, [r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233080
_0223301E:
	ldr r0, [r4, #0x30]
	bl sub_0200DCD4
	cmp r0, #2
	blt _02233080
	mov r0, #0
	str r0, [r4, #0x24]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233080
_02233034:
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232D80
	add r0, r4, #0
	add r0, #0xd8
	ldr r0, [r0]
	bl ov07_0221FE08
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233080
_02233050:
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232DF4
	cmp r0, #0
	bne _02233080
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl sub_0200DCC0
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232E10
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233080
_02233078:
	add r0, r4, #0
	mov r1, #4
	bl ov07_02232F74
_02233080:
	mov r0, #1
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02232FA8

	thumb_func_start ov07_02233088
ov07_02233088: ; 0x02233088
	mov r0, #1
	bx lr
	thumb_func_end ov07_02233088

	thumb_func_start ov07_0223308C
ov07_0223308C: ; 0x0223308C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	cmp r1, #0
	bne _022330CC
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x30]
	add r1, #0xb8
	add r2, #0xba
	bl sub_0200DE44
	add r0, r4, #0
	mov r1, #0x3c
	add r0, #0xbc
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0xb4
	add r0, #0xbe
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0xa
	add r0, #0xc0
	str r1, [r0]
	add r0, r4, #0
	mov r1, #0xc
	add r0, #0xc8
	str r1, [r0]
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	b _022330DC
_022330CC:
	bl ov07_022335B4
	cmp r0, #0
	bne _022330DC
	add r0, r4, #0
	mov r1, #6
	bl ov07_02232F74
_022330DC:
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov07_0223308C

	thumb_func_start ov07_022330E0
ov07_022330E0: ; 0x022330E0
	mov r0, #1
	bx lr
	thumb_func_end ov07_022330E0

	thumb_func_start ov07_022330E4
ov07_022330E4: ; 0x022330E4
	push {r3, lr}
	mov r1, #8
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022330E4

	thumb_func_start ov07_022330F0
ov07_022330F0: ; 0x022330F0
	push {r3, lr}
	mov r1, #9
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022330F0

	thumb_func_start ov07_022330FC
ov07_022330FC: ; 0x022330FC
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0223310E
	cmp r0, #1
	beq _02233142
	b _02233184
_0223310E:
	ldr r0, [r4, #0x30]
	bl sub_0200DD30
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	mov r0, #0xc
	str r0, [sp, #4]
	ldr r0, _022331A0 ; =0x0000037F
	mov r3, #1
	add r5, r3, #0
	str r0, [sp, #8]
	add r0, r4, #0
	lsl r5, r2
	add r0, #0xb0
	lsl r2, r5, #0x10
	ldr r0, [r0]
	mov r1, #4
	lsr r2, r2, #0x10
	sub r3, r3, #2
	bl sub_02003370
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223319A
_02233142:
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	bne _0223319A
	ldr r0, [r4, #0x30]
	bl sub_0200DD30
	add r2, r0, #0
	mov r0, #0xc
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r0, _022331A0 ; =0x0000037F
	mov r3, #1
	add r5, r3, #0
	str r0, [sp, #8]
	add r0, r4, #0
	lsl r5, r2
	add r0, #0xb0
	lsl r2, r5, #0x10
	ldr r0, [r0]
	mov r1, #4
	lsr r2, r2, #0x10
	sub r3, r3, #2
	bl sub_02003370
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223319A
_02233184:
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	bne _0223319A
	add r0, r4, #0
	mov r1, #0xa
	bl ov07_02232F74
_0223319A:
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_022331A0: .word 0x0000037F
	thumb_func_end ov07_022330FC

	thumb_func_start ov07_022331A4
ov07_022331A4: ; 0x022331A4
	push {r3, lr}
	mov r1, #0xb
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022331A4

	thumb_func_start ov07_022331B0
ov07_022331B0: ; 0x022331B0
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _022331C2
	cmp r0, #1
	beq _02233202
	b _0223321E
_022331C2:
	ldr r0, [r4, #0xc]
	add r0, r0, #1
	str r0, [r4, #0xc]
	cmp r0, #1
	blt _0223321E
	add r1, sp, #8
	ldr r0, [r4, #0x30]
	add r1, #2
	add r2, sp, #8
	bl sub_0200DE44
	add r1, sp, #8
	mov r0, #0
	ldrsh r3, [r1, r0]
	mov r0, #2
	ldrsh r1, [r1, r0]
	add r0, r3, #0
	add r0, #0x20
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x48
	add r2, r1, #0
	bl ov07_02222268
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223321E
_02233202:
	add r0, r4, #0
	ldr r1, [r4, #0x30]
	add r0, #0x48
	bl ov07_022222F0
	cmp r0, #0
	bne _0223321E
	ldr r0, [r4, #8]
	mov r1, #0xd
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	bl ov07_02232F74
_0223321E:
	mov r0, #1
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end ov07_022331B0

	thumb_func_start ov07_02233224
ov07_02233224: ; 0x02233224
	mov r0, #1
	bx lr
	thumb_func_end ov07_02233224

	thumb_func_start ov07_02233228
ov07_02233228: ; 0x02233228
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r1, [r5, #8]
	cmp r1, #0
	beq _02233238
	cmp r1, #1
	beq _0223324E
	b _022332AE
_02233238:
	ldr r0, [r5, #0x30]
	mov r1, #1
	bl sub_0200DC4C
	ldr r0, [r5, #0x30]
	mov r1, #0
	bl sub_0200DCC0
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_0223324E:
	ldr r1, [r5, #0xc]
	mov r0, #6
	add r2, r1, #0
	mul r2, r0
	ldr r0, _022332B8 ; =ov07_0223730E
	ldr r1, _022332BC ; =ov07_02237310
	ldrsh r0, [r0, r2]
	ldrh r1, [r1, r2]
	str r0, [sp]
	ldr r0, [r5, #0x30]
	bl sub_0200DCC0
	ldr r0, [r5, #0xc]
	ldr r4, _022332C0 ; =ov07_02237200
	add r0, r0, #1
	str r0, [r5, #0xc]
	mov r6, #0
	mov r7, #0x75
_02233272:
	ldr r1, [r5, #0xc]
	ldr r0, [r4]
	cmp r1, r0
	bne _02233286
	ldr r0, [r4, #4]
	add r1, r7, #0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl sub_0200602C
_02233286:
	add r6, r6, #1
	add r4, #8
	cmp r6, #5
	blt _02233272
	ldr r0, [r5, #0xc]
	cmp r0, #0x14
	bgt _0223329A
	ldr r0, [sp]
	cmp r0, #0xff
	bne _022332A2
_0223329A:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
	b _022332B4
_022332A2:
	ldr r0, [r5, #0x30]
	ldr r2, [sp]
	mov r1, #0
	bl sub_0200DED0
	b _022332B4
_022332AE:
	mov r1, #0xe
	bl ov07_02232F74
_022332B4:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_022332B8: .word ov07_0223730E
_022332BC: .word ov07_02237310
_022332C0: .word ov07_02237200
	thumb_func_end ov07_02233228

	thumb_func_start ov07_022332C4
ov07_022332C4: ; 0x022332C4
	mov r0, #1
	bx lr
	thumb_func_end ov07_022332C4

	thumb_func_start ov07_022332C8
ov07_022332C8: ; 0x022332C8
	push {r3, lr}
	ldr r1, [r0, #0xc]
	add r1, r1, #1
	str r1, [r0, #0xc]
	cmp r1, #0xe
	blt _022332E4
	ldr r1, [r0, #8]
	add r1, r1, #1
	str r1, [r0, #8]
	mov r1, #0
	str r1, [r0, #0xc]
	mov r1, #0x10
	bl ov07_02232F74
_022332E4:
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022332C8

	thumb_func_start ov07_022332E8
ov07_022332E8: ; 0x022332E8
	push {r3, lr}
	mov r1, #0x11
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_022332E8

	thumb_func_start ov07_022332F4
ov07_022332F4: ; 0x022332F4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02233304
	cmp r0, #1
	beq _02233314
	b _0223337C
_02233304:
	ldr r0, [r5, #0x18]
	cmp r0, #3
	blt _0223330E
	bl GF_AssertFail
_0223330E:
	ldr r0, [r5, #8]
	add r0, r0, #1
	str r0, [r5, #8]
_02233314:
	ldr r1, [r5, #0x18]
	mov r0, #0x18
	add r3, r1, #0
	mul r3, r0
	ldr r0, _02233380 ; =ov07_02237254
	ldr r1, [r5, #0xc]
	add r0, r0, r3
	lsl r2, r1, #1
	ldrsh r4, [r2, r0]
	add r0, r1, #1
	str r0, [r5, #0xc]
	cmp r0, #0xb
	bgt _02233332
	cmp r4, #0xff
	bne _02233352
_02233332:
	ldr r0, [r5, #8]
	mov r1, #0
	add r0, r0, #1
	str r0, [r5, #8]
	ldr r0, [r5, #0x18]
	add r0, r0, #1
	str r0, [r5, #0x18]
	ldr r0, [r5, #0x30]
	bl sub_0200E074
	add r0, r5, #0
	mov r1, #0x12
	bl ov07_02232F74
	mov r0, #1
	pop {r3, r4, r5, pc}
_02233352:
	cmp r0, #5
	bne _0223335E
	ldr r0, _02233384 ; =0x000005FD
	mov r1, #0x75
	bl sub_0200602C
_0223335E:
	ldr r0, [r5, #0x30]
	add r1, r4, #0
	mov r2, #0
	bl sub_0200DED0
	ldr r0, _02233388 ; =0x0001FFFE
	mov r1, #0x5a
	mul r0, r4
	lsl r1, r1, #2
	bl _s32_div_f
	add r1, r0, #0
	ldr r0, [r5, #0x30]
	bl sub_0200E098
_0223337C:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02233380: .word ov07_02237254
_02233384: .word 0x000005FD
_02233388: .word 0x0001FFFE
	thumb_func_end ov07_022332F4

	thumb_func_start ov07_0223338C
ov07_0223338C: ; 0x0223338C
	mov r0, #1
	bx lr
	thumb_func_end ov07_0223338C

	thumb_func_start ov07_02233390
ov07_02233390: ; 0x02233390
	push {r3, lr}
	mov r1, #0x14
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_02233390

	thumb_func_start ov07_0223339C
ov07_0223339C: ; 0x0223339C
	push {r3, lr}
	mov r1, #0x1b
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_0223339C

	thumb_func_start ov07_022333A8
ov07_022333A8: ; 0x022333A8
	push {r3, r4, r5, lr}
	sub sp, #0x20
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _0223347C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022333C0: ; jump table
	.short _022333C8 - _022333C0 - 2 ; case 0
	.short _022333FA - _022333C0 - 2 ; case 1
	.short _02233442 - _022333C0 - 2 ; case 2
	.short _02233454 - _022333C0 - 2 ; case 3
_022333C8:
	ldr r0, [r4, #0x30]
	bl sub_0200DD30
	mov r1, #0
	mov r3, #1
	add r2, r0, #0
	add r5, r3, #0
	lsl r5, r2
	lsl r2, r5, #0x10
	str r1, [sp]
	mov r0, #0xa
	str r0, [sp, #4]
	add r0, r4, #0
	str r1, [sp, #8]
	add r0, #0xb0
	ldr r0, [r0]
	mov r1, #4
	lsr r2, r2, #0x10
	sub r3, r3, #6
	bl sub_02003370
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233492
_022333FA:
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	bne _02233492
	add r0, r4, #0
	add r0, #0xa0
	ldr r0, [r0]
	add r1, r4, #0
	str r0, [sp, #0x10]
	add r1, #0x94
	ldr r1, [r1]
	str r1, [sp, #0x14]
	bl ov07_02232644
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp, #0x1c]
	add r2, sp, #0xc
	ldr r0, [r4, #0x30]
	add r1, sp, #0xc
	add r2, #2
	bl sub_0200DE44
	add r0, sp, #0xc
	bl ov07_02232D20
	add r1, r4, #0
	add r1, #0xd0
	str r0, [r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233492
_02233442:
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232D80
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233492
_02233454:
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232DF4
	cmp r0, #0
	bne _02233492
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl sub_0200DCC0
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232E10
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233492
_0223347C:
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	bne _02233492
	add r0, r4, #0
	mov r1, #0x16
	bl ov07_02232F74
_02233492:
	mov r0, #1
	add sp, #0x20
	pop {r3, r4, r5, pc}
	thumb_func_end ov07_022333A8

	thumb_func_start ov07_02233498
ov07_02233498: ; 0x02233498
	mov r0, #1
	bx lr
	thumb_func_end ov07_02233498

	thumb_func_start ov07_0223349C
ov07_0223349C: ; 0x0223349C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _022334AE
	cmp r1, #1
	beq _022334E0
	b _022334F4
_022334AE:
	ldr r0, [r4, #0x30]
	bl sub_0200DD30
	add r2, r0, #0
	mov r0, #0xa
	str r0, [sp]
	mov r0, #0
	mov r3, #1
	add r5, r3, #0
	str r0, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	lsl r5, r2
	add r0, #0xb0
	lsl r2, r5, #0x10
	ldr r0, [r0]
	mov r1, #4
	lsr r2, r2, #0x10
	sub r3, r3, #6
	bl sub_02003370
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022334FA
_022334E0:
	add r0, #0xb0
	ldr r0, [r0]
	bl sub_02003B44
	cmp r0, #0
	bne _022334FA
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _022334FA
_022334F4:
	mov r1, #0x18
	bl ov07_02232F74
_022334FA:
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	thumb_func_end ov07_0223349C

	thumb_func_start ov07_02233500
ov07_02233500: ; 0x02233500
	push {r3, lr}
	mov r1, #0x19
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_02233500

	thumb_func_start ov07_0223350C
ov07_0223350C: ; 0x0223350C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #0
	beq _0223351C
	cmp r1, #1
	beq _0223352A
	b _02233582
_0223351C:
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_0200E0FC
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223352A:
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0
	beq _02233552
	add r0, r4, #0
	add r0, #0x20
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0x20
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x21
	ldrb r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0x21
	strb r1, [r0]
	b _0223356E
_02233552:
	add r0, r4, #0
	mov r1, #0
	add r0, #0x20
	strb r1, [r0]
	add r0, r4, #0
	mov r2, #0xf
	add r0, #0x21
	strb r2, [r0]
	ldr r0, [r4, #0x30]
	bl sub_0200DCE8
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
_0223356E:
	add r0, r4, #0
	add r0, #0x20
	add r4, #0x21
	ldrb r1, [r0]
	ldrb r0, [r4]
	lsl r0, r0, #8
	orr r1, r0
	ldr r0, _0223358C ; =0x04000052
	strh r1, [r0]
	b _02233588
_02233582:
	mov r1, #0x1a
	bl ov07_02232F74
_02233588:
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_0223358C: .word 0x04000052
	thumb_func_end ov07_0223350C

	thumb_func_start ov07_02233590
ov07_02233590: ; 0x02233590
	push {r3, lr}
	mov r1, #0x1b
	bl ov07_02232F74
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov07_02233590

	thumb_func_start ov07_0223359C
ov07_0223359C: ; 0x0223359C
	mov r0, #0
	bx lr
	thumb_func_end ov07_0223359C

	thumb_func_start ov07_022335A0
ov07_022335A0: ; 0x022335A0
	push {r3, lr}
	ldr r1, [r0, #0x14]
	lsl r2, r1, #2
	ldr r1, _022335B0 ; =ov07_0223729C
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_022335B0: .word ov07_0223729C
	thumb_func_end ov07_022335A0

	thumb_func_start ov07_022335B4
ov07_022335B4: ; 0x022335B4
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bls _022335C2
	b _022337C2
_022335C2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022335CE: ; jump table
	.short _022335D6 - _022335CE - 2 ; case 0
	.short _02233644 - _022335CE - 2 ; case 1
	.short _0223373E - _022335CE - 2 ; case 2
	.short _022337A2 - _022335CE - 2 ; case 3
_022335D6:
	mov r0, #0xba
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	mov r2, #0xb8
	str r0, [sp]
	mov r0, #0xbe
	ldrsh r0, [r4, r0]
	mov r3, #0xbc
	add r1, #0x6c
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0xc8
	ldr r0, [r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, #0x48
	bl ov07_02222338
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	add r0, #0xd4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232540
	cmp r0, #1
	bne _0223372C
	bl LCRandom
	mov r1, #0x14
	bl _s32_div_f
	add r1, #0xa
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xd
	bl sub_0200E098
	b _0223385E
_02233644:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232540
	cmp r0, #1
	bne _022336E2
	mov r1, #2
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xc
	bl sub_0200E098
	add r0, r4, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	add r0, #0xa
	cmp r2, r0
	ble _0223367E
	mov r1, #2
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xc
	bl sub_0200E098
_0223367E:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232580
	cmp r0, #1
	bne _022336E2
	add r0, r4, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	add r0, #0xa
	cmp r2, r0
	bne _022336E2
	ldr r0, [r4, #0x30]
	bl sub_0200DD30
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	add r1, r4, #0
	lsl r3, r3, #0x14
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _02233864 ; =0x0000FFFF
	add r1, #0x94
	str r0, [sp, #0x14]
	ldr r0, _02233868 ; =0x000003EA
	lsr r3, r3, #0x10
	str r0, [sp, #0x18]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_02222F10
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
_022336E2:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #6
	blt _0223371A
	cmp r0, #8
	bgt _0223371A
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r2, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	ldr r1, [r0]
	cmp r1, r2
	ble _0223371A
	add r0, r2, #5
	cmp r1, r0
	blt _0223372C
_0223371A:
	add r0, r4, #0
	add r1, r4, #0
	ldr r2, [r4, #0x30]
	add r0, #0x48
	add r1, #0x6c
	bl ov07_022223CC
	cmp r0, #0
	beq _0223372E
_0223372C:
	b _0223385E
_0223372E:
	add r0, r4, #0
	mov r1, #0
	bl ov07_022344B4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223385E
_0223373E:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232580
	cmp r0, #1
	bne _02233772
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02233772
	bl ov07_02222EE8
	cmp r0, #1
	beq _0223385E
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	bl ov07_02222EF8
	mov r0, #1
	str r0, [r4, #0x28]
	add sp, #0x1c
	mov r0, #0
	pop {r3, r4, pc}
_02233772:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xf
	blt _02233786
	mov r0, #1
	str r0, [r4, #0x28]
	add sp, #0x1c
	mov r0, #0
	pop {r3, r4, pc}
_02233786:
	add r0, r4, #0
	add r0, #0xa0
	ldr r1, [r0]
	ldr r0, _0223386C ; =0x00000401
	cmp r1, r0
	bne _0223379A
	ldr r0, _02233870 ; =0x000007E8
	mov r1, #0x75
	bl sub_0200602C
_0223379A:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223385E
_022337A2:
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_0200DC4C
	add r0, r4, #0
	mov r1, #1
	bl ov07_022344C0
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _0223385E
_022337C2:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #5
	bne _0223381C
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xc
	beq _02233818
	cmp r0, #0xd
	beq _02233818
	ldr r0, [r4, #0x30]
	bl sub_0200DD30
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	add r1, r4, #0
	lsl r3, r3, #0x14
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _02233864 ; =0x0000FFFF
	add r1, #0x94
	str r0, [sp, #0x14]
	ldr r0, _02233868 ; =0x000003EA
	lsr r3, r3, #0x10
	str r0, [sp, #0x18]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_02222F10
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
_02233818:
	mov r0, #1
	str r0, [r4, #0x28]
_0223381C:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0xf
	ble _0223385E
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xc
	beq _02233858
	cmp r0, #0xd
	beq _02233858
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	bl ov07_02222EE8
	cmp r0, #1
	beq _0223385E
	add r4, #0xd4
	ldr r0, [r4]
	bl ov07_02222EF8
_02233858:
	add sp, #0x1c
	mov r0, #0
	pop {r3, r4, pc}
_0223385E:
	mov r0, #1
	add sp, #0x1c
	pop {r3, r4, pc}
	.balign 4, 0
_02233864: .word 0x0000FFFF
_02233868: .word 0x000003EA
_0223386C: .word 0x00000401
_02233870: .word 0x000007E8
	thumb_func_end ov07_022335B4

	thumb_func_start ov07_02233874
ov07_02233874: ; 0x02233874
	push {r3, r4, lr}
	sub sp, #0x1c
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #3
	bls _02233882
	b _02233A6E
_02233882:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0223388E: ; jump table
	.short _02233896 - _0223388E - 2 ; case 0
	.short _02233904 - _0223388E - 2 ; case 1
	.short _022339FE - _0223388E - 2 ; case 2
	.short _02233A4E - _0223388E - 2 ; case 3
_02233896:
	mov r0, #0xba
	ldrsh r0, [r4, r0]
	add r1, r4, #0
	mov r2, #0xb8
	str r0, [sp]
	mov r0, #0xbe
	ldrsh r0, [r4, r0]
	mov r3, #0xbc
	add r1, #0x6c
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0xc0
	ldr r0, [r0]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r4, #0
	add r0, #0xc8
	ldr r0, [r0]
	lsl r0, r0, #0xc
	str r0, [sp, #0xc]
	add r0, r4, #0
	ldrsh r2, [r4, r2]
	ldrsh r3, [r4, r3]
	add r0, #0x48
	bl ov07_02222338
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	add r0, r4, #0
	add r0, #0xd4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232540
	cmp r0, #1
	bne _022339EC
	bl LCRandom
	mov r1, #0x14
	bl _s32_div_f
	add r1, #0xa
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xd
	bl sub_0200E098
	b _02233AF6
_02233904:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232540
	cmp r0, #1
	bne _022339A2
	mov r1, #2
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xc
	bl sub_0200E098
	add r0, r4, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	add r0, #0xa
	cmp r2, r0
	ble _0223393E
	mov r1, #2
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0xc
	bl sub_0200E098
_0223393E:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232580
	cmp r0, #1
	bne _022339A2
	add r0, r4, #0
	add r0, #0xc4
	ldr r2, [r0]
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r0, r0, #1
	add r0, #0xa
	cmp r2, r0
	bne _022339A2
	ldr r0, [r4, #0x30]
	bl sub_0200DD30
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	add r1, r4, #0
	lsl r3, r3, #0x14
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _02233AFC ; =0x0000FFFF
	add r1, #0x94
	str r0, [sp, #0x14]
	ldr r0, _02233B00 ; =0x000003EA
	lsr r3, r3, #0x10
	str r0, [sp, #0x18]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_02222F10
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
_022339A2:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #6
	blt _022339DA
	cmp r0, #8
	bgt _022339DA
	add r0, r4, #0
	add r0, #0xc0
	ldr r1, [r0]
	lsr r0, r1, #0x1f
	add r0, r1, r0
	asr r2, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	ldr r1, [r0]
	cmp r1, r2
	ble _022339DA
	add r0, r2, #5
	cmp r1, r0
	blt _022339EC
_022339DA:
	add r0, r4, #0
	add r1, r4, #0
	ldr r2, [r4, #0x30]
	add r0, #0x48
	add r1, #0x6c
	bl ov07_022223CC
	cmp r0, #0
	beq _022339EE
_022339EC:
	b _02233AF6
_022339EE:
	add r0, r4, #0
	mov r1, #0
	bl ov07_022344B4
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233AF6
_022339FE:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_02232580
	cmp r0, #1
	bne _02233A32
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	cmp r0, #0
	beq _02233A32
	bl ov07_02222EE8
	cmp r0, #1
	beq _02233AF6
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	bl ov07_02222EF8
	mov r0, #1
	str r0, [r4, #0x28]
	add sp, #0x1c
	mov r0, #0
	pop {r3, r4, pc}
_02233A32:
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0xf
	blt _02233A46
	mov r0, #1
	str r0, [r4, #0x28]
	add sp, #0x1c
	mov r0, #0
	pop {r3, r4, pc}
_02233A46:
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233AF6
_02233A4E:
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_0200DC4C
	add r0, r4, #0
	mov r1, #0
	bl ov07_022344C0
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233AF6
_02233A6E:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #5
	bne _02233AC2
	ldr r0, [r4, #0x30]
	mov r1, #2
	bl sub_0200DCC0
	ldr r0, [r4, #0x30]
	bl sub_0200DD30
	add r3, r0, #0
	mov r0, #0x10
	str r0, [sp]
	sub r0, #0x12
	str r0, [sp, #4]
	mov r2, #2
	add r1, r4, #0
	lsl r3, r3, #0x14
	str r2, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	mov r0, #0xe
	str r0, [sp, #0x10]
	ldr r0, _02233AFC ; =0x0000FFFF
	add r1, #0x94
	str r0, [sp, #0x14]
	ldr r0, _02233B00 ; =0x000003EA
	lsr r3, r3, #0x10
	str r0, [sp, #0x18]
	add r0, r4, #0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r1, [r1]
	bl ov07_02222F10
	add r1, r4, #0
	add r1, #0xd4
	str r0, [r1]
	mov r0, #1
	str r0, [r4, #0x28]
_02233AC2:
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #0xf
	ble _02233AF6
	add r0, r4, #0
	add r0, #0xd4
	ldr r0, [r0]
	bl ov07_02222EE8
	cmp r0, #1
	beq _02233AF6
	add r4, #0xd4
	ldr r0, [r4]
	bl ov07_02222EF8
	add sp, #0x1c
	mov r0, #0
	pop {r3, r4, pc}
_02233AF6:
	mov r0, #1
	add sp, #0x1c
	pop {r3, r4, pc}
	.balign 4, 0
_02233AFC: .word 0x0000FFFF
_02233B00: .word 0x000003EA
	thumb_func_end ov07_02233874

	thumb_func_start ov07_02233B04
ov07_02233B04: ; 0x02233B04
	push {r3, r4, lr}
	sub sp, #0x14
	add r4, r0, #0
	ldr r1, [r4, #8]
	cmp r1, #7
	bls _02233B12
	b _02233C8A
_02233B12:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02233B1E: ; jump table
	.short _02233B2E - _02233B1E - 2 ; case 0
	.short _02233B6C - _02233B1E - 2 ; case 1
	.short _02233B9C - _02233B1E - 2 ; case 2
	.short _02233BD2 - _02233B1E - 2 ; case 3
	.short _02233BE2 - _02233B1E - 2 ; case 4
	.short _02233C10 - _02233B1E - 2 ; case 5
	.short _02233C3E - _02233B1E - 2 ; case 6
	.short _02233C6C - _02233B1E - 2 ; case 7
_02233B2E:
	mov r1, #0
	bl ov07_022344C0
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_0200DC4C
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #2
	blt _02233B82
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl sub_0200DCC0
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233B6C:
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #2
	bge _02233B84
_02233B82:
	b _02233C90
_02233B84:
	ldr r0, [r4, #0x30]
	mov r1, #2
	bl sub_0200DCC0
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233B9C:
	add r0, #0xa0
	ldr r0, [r0]
	add r2, sp, #0
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x94
	ldr r0, [r0]
	add r1, sp, #0
	str r0, [sp, #8]
	mov r0, #0xff
	str r0, [sp, #0xc]
	mov r0, #1
	str r0, [sp, #0x10]
	ldr r0, [r4, #0x30]
	add r2, #2
	bl sub_0200DE44
	add r0, sp, #0
	bl ov07_02232D20
	add r1, r4, #0
	add r1, #0xd0
	str r0, [r1]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233BD2:
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232D80
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233BE2:
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #6
	blt _02233C90
	ldr r0, [r4, #0x30]
	mov r1, #2
	bl sub_0200DCC0
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233C10:
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #6
	blt _02233C90
	ldr r0, [r4, #0x30]
	mov r1, #1
	bl sub_0200DCC0
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233C3E:
	add r0, #0xc4
	ldr r0, [r0]
	add r1, r0, #1
	add r0, r4, #0
	add r0, #0xc4
	str r1, [r0]
	add r0, r4, #0
	add r0, #0xc4
	ldr r0, [r0]
	cmp r0, #6
	blt _02233C90
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl sub_0200DCC0
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc4
	str r1, [r0]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233C6C:
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232DF4
	cmp r0, #0
	bne _02233C90
	add r0, r4, #0
	add r0, #0xd0
	ldr r0, [r0]
	bl ov07_02232E10
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233C90
_02233C8A:
	add sp, #0x14
	mov r0, #0
	pop {r3, r4, pc}
_02233C90:
	mov r0, #1
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02233B04

	thumb_func_start ov07_02233C98
ov07_02233C98: ; 0x02233C98
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02233CA8
	cmp r0, #1
	beq _02233CDC
	b _02233D0E
_02233CA8:
	ldr r0, [r4, #0x10]
	cmp r0, #0
	bne _02233CBE
	ldr r1, _02233D1C ; =0xFFFFE001
	add r0, r4, #0
	add r0, #0x34
	lsr r2, r1, #0x13
	mov r3, #0xa
	bl ov07_022223F0
	b _02233CCC
_02233CBE:
	add r0, r4, #0
	ldr r1, _02233D20 ; =0x00001FFF
	ldr r2, _02233D1C ; =0xFFFFE001
	add r0, #0x34
	mov r3, #0xa
	bl ov07_022223F0
_02233CCC:
	ldr r1, [r4, #0x10]
	mov r0, #1
	eor r0, r1
	str r0, [r4, #0x10]
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233D16
_02233CDC:
	ldr r1, [r4, #0x34]
	ldr r0, [r4, #0x30]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	bl sub_0200E074
	add r0, r4, #0
	add r0, #0x34
	bl ov07_02222440
	cmp r0, #0
	bne _02233D16
	ldr r0, [r4, #0xc]
	cmp r0, #1
	blt _02233D02
	ldr r0, [r4, #8]
	add r0, r0, #1
	str r0, [r4, #8]
	b _02233D16
_02233D02:
	add r0, r0, #1
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	sub r0, r0, #1
	str r0, [r4, #8]
	b _02233D16
_02233D0E:
	mov r0, #0
	add r4, #0xc4
	str r0, [r4]
	pop {r4, pc}
_02233D16:
	mov r0, #1
	pop {r4, pc}
	nop
_02233D1C: .word 0xFFFFE001
_02233D20: .word 0x00001FFF
	thumb_func_end ov07_02233C98

	thumb_func_start ov07_02233D24
ov07_02233D24: ; 0x02233D24
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0xff
	bne _02233D36
	add sp, #4
	mov r0, #0
	pop {r3, r4, pc}
_02233D36:
	ldr r0, [r4, #0x30]
	cmp r0, #0
	beq _02233D5A
	add r1, sp, #0
	add r1, #2
	add r2, sp, #0
	bl sub_0200DE44
	add r1, sp, #0
	mov r0, #2
	ldrsh r2, [r1, r0]
	add r0, r4, #0
	add r0, #0xb8
	strh r2, [r0]
	mov r0, #0
	ldrsh r0, [r1, r0]
	add r4, #0xba
	strh r0, [r4]
_02233D5A:
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov07_02233D24

	thumb_func_start ov07_02233D60
ov07_02233D60: ; 0x02233D60
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02233DB2
	add r0, r4, #0
	add r0, #0xdc
	ldr r0, [r0]
	cmp r0, #0
	ble _02233D8A
	add r0, r4, #0
	add r0, #0xdc
	ldr r0, [r0]
	sub r1, r0, #1
	add r0, r4, #0
	add r0, #0xdc
	str r1, [r0]
	ldr r0, [r4, #0x2c]
	bl sub_0200D020
	pop {r4, pc}
_02233D8A:
	add r1, #0x98
	ldr r1, [r1]
	add r0, r4, #0
	lsl r2, r1, #2
	ldr r1, _02233DB4 ; =ov07_022371A0
	ldr r1, [r1, r2]
	blx r1
	cmp r0, #0
	bne _02233DA0
	mov r0, #0
	str r0, [r4, #0x1c]
_02233DA0:
	ldr r0, [r4, #0x24]
	cmp r0, #1
	bne _02233DAC
	ldr r0, [r4, #0x30]
	bl sub_0200DC18
_02233DAC:
	ldr r0, [r4, #0x2c]
	bl sub_0200D020
_02233DB2:
	pop {r4, pc}
	.balign 4, 0
_02233DB4: .word ov07_022371A0
	thumb_func_end ov07_02233D60

	thumb_func_start ov07_02233DB8
ov07_02233DB8: ; 0x02233DB8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #4]
	mov r1, #0xe0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xe0
	add r4, r0, #0
	bl MI_CpuFill8
	cmp r4, #0
	bne _02233DD6
	bl GF_AssertFail
_02233DD6:
	add r3, r4, #0
	add r3, #0x90
	mov r2, #5
_02233DDC:
	ldmia r5!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02233DDC
	mov r0, #0
	str r0, [r4, #8]
	str r0, [r4, #0x10]
	str r0, [r4, #0xc]
	str r0, [r4, #0x14]
	str r0, [r4, #0x18]
	str r0, [r4]
	str r0, [r4, #4]
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200CF38
	str r0, [r4, #0x2c]
	add r0, r4, #0
	mov r1, #0
	add r0, #0xdc
	str r1, [r0]
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	bl ov07_022325BC
	str r0, [r4, #0x24]
	add r0, r4, #0
	mov r2, #0
	add r0, #0xc4
	str r2, [r0]
	add r0, r4, #0
	mov r1, #0x10
	add r0, #0x20
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x21
	strb r2, [r0]
	bl ov07_0221C69C
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r0, r0, #0x1f
	sub r0, r0, r1
	mov r2, #0x1f
	ror r0, r2
	add r0, r1, r0
	beq _02233E4A
	add r0, r4, #0
	mov r1, #1
	add r0, #0x22
	strb r1, [r0]
	b _02233E52
_02233E4A:
	add r0, r4, #0
	sub r2, #0x20
	add r0, #0x22
	strb r2, [r0]
_02233E52:
	add r0, r4, #0
	bl ov07_022342E4
	add r0, r4, #0
	bl ov07_0223441C
	add r0, r4, #0
	bl ov07_02233F30
	mov r0, #1
	str r0, [r4, #0x1c]
	mov r0, #0
	str r0, [r4, #0x28]
	mov r2, #0xfa
	ldr r0, _02233E84 ; =ov07_02233D60
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	add r1, r4, #0
	add r1, #0xcc
	str r0, [r1]
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	nop
_02233E84: .word ov07_02233D60
	thumb_func_end ov07_02233DB8

	thumb_func_start ov07_02233E88
ov07_02233E88: ; 0x02233E88
	push {r4, lr}
	add r4, r0, #0
	bne _02233E92
	bl GF_AssertFail
_02233E92:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02233E9C
	mov r0, #1
	pop {r4, pc}
_02233E9C:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov07_02233E88

	thumb_func_start ov07_02233EA0
ov07_02233EA0: ; 0x02233EA0
	push {r4, lr}
	add r4, r0, #0
	bne _02233EAA
	bl GF_AssertFail
_02233EAA:
	ldr r0, [r4, #0x28]
	cmp r0, #0
	beq _02233EB4
	mov r0, #1
	pop {r4, pc}
_02233EB4:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov07_02233EA0

	thumb_func_start ov07_02233EB8
ov07_02233EB8: ; 0x02233EB8
	str r1, [r0, #0x14]
	bx lr
	thumb_func_end ov07_02233EB8

	thumb_func_start ov07_02233EBC
ov07_02233EBC: ; 0x02233EBC
	ldr r0, [r0, #0x14]
	cmp r0, r1
	bne _02233EC6
	mov r0, #1
	bx lr
_02233EC6:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov07_02233EBC

	thumb_func_start ov07_02233ECC
ov07_02233ECC: ; 0x02233ECC
	push {r4, lr}
	add r4, r0, #0
	bne _02233ED6
	bl GF_AssertFail
_02233ED6:
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r4, #0x2c]
	bl sub_0200D998
	ldr r0, [r4, #0x30]
	bl sub_0200D9DC
	add r0, r4, #0
	add r0, #0xcc
	ldr r0, [r0]
	bl DestroySysTask
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_02233ECC

	thumb_func_start ov07_02233EFC
ov07_02233EFC: ; 0x02233EFC
	add r2, r0, #0
	add r0, #0x98
	str r1, [r0]
	mov r0, #0
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	str r0, [r2, #0x10]
	mov r0, #1
	add r1, r2, #0
	str r0, [r2, #0x1c]
	ldr r0, [r2, #0x30]
	ldr r3, _02233F1C ; =sub_0200DE44
	add r1, #0xb8
	add r2, #0xba
	bx r3
	nop
_02233F1C: .word sub_0200DE44
	thumb_func_end ov07_02233EFC

	thumb_func_start ov07_02233F20
ov07_02233F20: ; 0x02233F20
	push {r4, lr}
	add r4, r0, #0
	bne _02233F2A
	bl GF_AssertFail
_02233F2A:
	add r4, #0x98
	ldr r0, [r4]
	pop {r4, pc}
	thumb_func_end ov07_02233F20

	thumb_func_start ov07_02233F30
ov07_02233F30: ; 0x02233F30
	push {r4, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x30]
	add r1, #0xb8
	add r2, #0xba
	bl sub_0200DE44
	add r0, r4, #0
	add r0, #0x90
	ldr r0, [r0]
	cmp r0, #0x11
	bls _02233F4E
	b _0223419C
_02233F4E:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02233F5A: ; jump table
	.short _02233F7E - _02233F5A - 2 ; case 0
	.short _02233F7E - _02233F5A - 2 ; case 1
	.short _02233F7E - _02233F5A - 2 ; case 2
	.short _02233F7E - _02233F5A - 2 ; case 3
	.short _02233F7E - _02233F5A - 2 ; case 4
	.short _02233F7E - _02233F5A - 2 ; case 5
	.short _02233F9C - _02233F5A - 2 ; case 6
	.short _02233FC2 - _02233F5A - 2 ; case 7
	.short _02233FF6 - _02233F5A - 2 ; case 8
	.short _0223401C - _02233F5A - 2 ; case 9
	.short _02234042 - _02233F5A - 2 ; case 10
	.short _02234068 - _02233F5A - 2 ; case 11
	.short _0223408E - _02233F5A - 2 ; case 12
	.short _022340BA - _02233F5A - 2 ; case 13
	.short _022340F2 - _02233F5A - 2 ; case 14
	.short _02234118 - _02233F5A - 2 ; case 15
	.short _02234144 - _02233F5A - 2 ; case 16
	.short _02234170 - _02233F5A - 2 ; case 17
_02233F7E:
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x30]
	add r1, #0xbc
	add r2, #0xbe
	bl sub_0200DE44
	add r0, r4, #0
	mov r1, #0
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xc
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_02233F9C:
	mov r0, #0
	add r2, r4, #0
	add r3, r4, #0
	add r1, r0, #0
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x30
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_02233FC2:
	add r1, r4, #0
	add r2, r4, #0
	ldr r0, [r4, #0x30]
	add r1, #0xb8
	add r2, #0xba
	bl sub_0200DE44
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #1
	mov r1, #4
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x30
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_02233FF6:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #1
	mov r1, #2
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x30
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_0223401C:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #0
	mov r1, #1
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x30
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_02234042:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #1
	mov r1, #3
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x30
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_02234068:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #1
	mov r1, #5
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x30
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_0223408E:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #0
	mov r1, #1
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x10
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x10
	strh r1, [r0]
	mov r0, #0xc
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_022340BA:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #0
	mov r1, #1
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x20
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbc
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbc
	sub r1, #0x14
	strh r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x26
	strh r1, [r0]
	mov r0, #0x10
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_022340F2:
	add r0, r4, #0
	mov r1, #0x80
	add r0, #0xbc
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0x40
	add r0, #0xbe
	strh r1, [r0]
	add r0, r4, #0
	mov r1, #0x20
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #0x20
	strh r1, [r0]
	b _0223419C
_02234118:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #0
	mov r1, #1
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x40
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #8
	strh r1, [r0]
	mov r0, #0x10
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_02234144:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #1
	mov r1, #3
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x40
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #8
	strh r1, [r0]
	mov r0, #0x10
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_02234170:
	add r2, r4, #0
	add r3, r4, #0
	mov r0, #1
	mov r1, #5
	add r2, #0xbc
	add r3, #0xbe
	bl ov07_02221F04
	add r0, r4, #0
	mov r1, #0x40
	add r0, #0xc8
	str r1, [r0]
	mov r0, #0xbe
	ldrsh r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xbe
	add r1, #8
	strh r1, [r0]
	mov r0, #0x10
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
_0223419C:
	mov r0, #0x14
	add r4, #0xc0
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end ov07_02233F30

	thumb_func_start ov07_022341A4
ov07_022341A4: ; 0x022341A4
	push {r4, lr}
	add r0, #0x90
	ldr r0, [r0]
	add r3, r1, #0
	add r4, r2, #0
	cmp r0, #0x11
	bls _022341B4
	b _022342E0
_022341B4:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_022341C0: ; jump table
	.short _022341E4 - _022341C0 - 2 ; case 0
	.short _022341FA - _022341C0 - 2 ; case 1
	.short _02234210 - _022341C0 - 2 ; case 2
	.short _0223423C - _022341C0 - 2 ; case 3
	.short _02234226 - _022341C0 - 2 ; case 4
	.short _02234252 - _022341C0 - 2 ; case 5
	.short _02234268 - _022341C0 - 2 ; case 6
	.short _02234272 - _022341C0 - 2 ; case 7
	.short _0223427C - _022341C0 - 2 ; case 8
	.short _02234286 - _022341C0 - 2 ; case 9
	.short _02234294 - _022341C0 - 2 ; case 10
	.short _022342A2 - _022341C0 - 2 ; case 11
	.short _022342B0 - _022341C0 - 2 ; case 12
	.short _022342BE - _022341C0 - 2 ; case 13
	.short _022342CC - _022341C0 - 2 ; case 14
	.short _022342D6 - _022341C0 - 2 ; case 15
	.short _022342D6 - _022341C0 - 2 ; case 16
	.short _022342D6 - _022341C0 - 2 ; case 17
_022341E4:
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	add r3, r4, #0
	bl ov07_02221F04
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, #0x28
	strh r0, [r4]
	pop {r4, pc}
_022341FA:
	add r2, r3, #0
	mov r0, #0
	mov r1, #1
	add r3, r4, #0
	bl ov07_02221F04
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, #0x26
	strh r0, [r4]
	pop {r4, pc}
_02234210:
	add r2, r3, #0
	mov r0, #1
	mov r1, #2
	add r3, r4, #0
	bl ov07_02221F04
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, #0x28
	strh r0, [r4]
	pop {r4, pc}
_02234226:
	add r2, r3, #0
	mov r0, #1
	mov r1, #4
	add r3, r4, #0
	bl ov07_02221F04
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, #0x28
	strh r0, [r4]
	pop {r4, pc}
_0223423C:
	add r2, r3, #0
	mov r0, #1
	mov r1, #3
	add r3, r4, #0
	bl ov07_02221F04
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, #0x26
	strh r0, [r4]
	pop {r4, pc}
_02234252:
	add r2, r3, #0
	mov r0, #1
	mov r1, #5
	add r3, r4, #0
	bl ov07_02221F04
	mov r0, #0
	ldrsh r0, [r4, r0]
	add r0, #0x26
	strh r0, [r4]
	pop {r4, pc}
_02234268:
	mov r0, #0xa
	strh r0, [r3]
	mov r0, #0x64
	strh r0, [r4]
	pop {r4, pc}
_02234272:
	mov r0, #0xa
	strh r0, [r3]
	mov r0, #0x64
	strh r0, [r4]
	pop {r4, pc}
_0223427C:
	mov r0, #0xa
	strh r0, [r3]
	mov r0, #0x64
	strh r0, [r4]
	pop {r4, pc}
_02234286:
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	add r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_02234294:
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	add r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_022342A2:
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	add r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_022342B0:
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	add r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_022342BE:
	mov r0, #0
	add r2, r3, #0
	add r1, r0, #0
	add r3, r4, #0
	bl ov07_02221F04
	pop {r4, pc}
_022342CC:
	mov r0, #0xe6
	strh r0, [r3]
	mov r0, #0x20
	strh r0, [r4]
	pop {r4, pc}
_022342D6:
	mov r0, #0x1d
	mvn r0, r0
	strh r0, [r3]
	mov r0, #0xa0
	strh r0, [r4]
_022342E0:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov07_022341A4

	thumb_func_start ov07_022342E4
ov07_022342E4: ; 0x022342E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	mov r2, #0xa
	bl sub_0200CFF4
	add r0, r5, #0
	add r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _02234314
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	bl sub_0200CF6C
	mov r2, #0x11
	mov r1, #0
	lsl r2, r2, #0x10
	bl G2dRenderer_SetSubSurfaceCoords
_02234314:
	mov r1, #0
	add r2, sp, #0x20
	mov r0, #0xa
_0223431A:
	add r1, r1, #1
	stmia r2!, {r0}
	cmp r1, #6
	blt _0223431A
	mov r0, #0
	str r0, [sp, #0x30]
	str r0, [sp, #0x34]
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	add r2, sp, #0x20
	bl sub_0200D3F8
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #0
	bl ov07_02232658
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #1
	bl ov07_02232658
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #2
	bl ov07_02232658
	str r0, [sp, #0x18]
	add r0, r5, #0
	add r0, #0xa0
	ldr r0, [r0]
	mov r1, #3
	bl ov07_02232658
	add r1, r5, #0
	add r1, #0x94
	str r0, [sp, #0x1c]
	ldr r1, [r1]
	mov r0, #8
	bl NARC_ctor
	add r4, r0, #0
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0x9c
	ldr r1, [r0]
	ldr r0, _02234418 ; =0x00001770
	add r2, r4, #0
	add r0, r1, r0
	str r0, [sp, #8]
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	add r3, r7, #0
	bl sub_0200D504
	str r4, [sp]
	add r2, r5, #0
	str r6, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	mov r0, #1
	str r0, [sp, #0xc]
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r0, #0x9c
	ldr r1, [r0]
	ldr r0, _02234418 ; =0x00001770
	add r2, #0xac
	add r0, r1, r0
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r0, #0xb0
	ldr r0, [r0]
	ldr r2, [r2]
	ldr r3, [r5, #0x2c]
	mov r1, #2
	bl sub_0200D68C
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x9c
	ldr r1, [r0]
	ldr r0, _02234418 ; =0x00001770
	ldr r3, [sp, #0x18]
	add r0, r1, r0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	add r2, r4, #0
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x9c
	ldr r1, [r0]
	ldr r0, _02234418 ; =0x00001770
	ldr r3, [sp, #0x1c]
	add r0, r1, r0
	str r0, [sp, #4]
	add r0, r5, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r5, #0x2c]
	add r2, r4, #0
	bl sub_0200D71C
	add r0, r4, #0
	bl NARC_dtor
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02234418: .word 0x00001770
	thumb_func_end ov07_022342E4

	thumb_func_start ov07_0223441C
ov07_0223441C: ; 0x0223441C
	push {r3, r4, lr}
	sub sp, #0x34
	add r2, sp, #0
	add r1, sp, #0
	add r2, #2
	add r4, r0, #0
	bl ov07_022341A4
	mov r0, #0
	add r1, sp, #0
	strh r0, [r1, #4]
	strh r0, [r1, #6]
	mov r1, #1
	str r1, [sp, #0x10]
	add r1, r4, #0
	str r0, [sp, #8]
	str r0, [sp, #0xc]
	add r1, #0xa4
	ldr r1, [r1]
	ldr r2, _02234498 ; =0x00001770
	str r1, [sp, #0x2c]
	str r0, [sp, #0x30]
	add r3, sp, #0
_0223444A:
	add r1, r4, #0
	add r1, #0x9c
	ldr r1, [r1]
	add r0, r0, #1
	add r1, r1, r2
	str r1, [r3, #0x14]
	add r3, r3, #4
	cmp r0, #6
	blt _0223444A
	add r0, r4, #0
	add r0, #0xac
	ldr r0, [r0]
	ldr r1, [r4, #0x2c]
	add r2, sp, #0
	bl sub_0200D734
	str r0, [r4, #0x30]
	mov r1, #1
	bl sub_0200DCE8
	ldr r0, [r4, #0x30]
	mov r1, #2
	bl sub_0200DF98
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl sub_0200DCC0
	ldr r0, [r4, #0x30]
	mov r1, #0
	bl sub_0200DC4C
	ldr r0, [r4, #0x30]
	bl sub_0200DC18
	bl ov07_0221C69C
	add sp, #0x34
	pop {r3, r4, pc}
	.balign 4, 0
_02234498: .word 0x00001770
	thumb_func_end ov07_0223441C

	thumb_func_start ov07_0223449C
ov07_0223449C: ; 0x0223449C
	ldr r3, _022344A4 ; =sub_0200DCE8
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344A4: .word sub_0200DCE8
	thumb_func_end ov07_0223449C

	thumb_func_start ov07_022344A8
ov07_022344A8: ; 0x022344A8
	ldr r3, _022344B0 ; =sub_0200DDB8
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344B0: .word sub_0200DDB8
	thumb_func_end ov07_022344A8

	thumb_func_start ov07_022344B4
ov07_022344B4: ; 0x022344B4
	ldr r3, _022344BC ; =sub_0200E074
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344BC: .word sub_0200E074
	thumb_func_end ov07_022344B4

	thumb_func_start ov07_022344C0
ov07_022344C0: ; 0x022344C0
	str r1, [r0, #0x24]
	bx lr
	thumb_func_end ov07_022344C0

	thumb_func_start ov07_022344C4
ov07_022344C4: ; 0x022344C4
	ldr r3, _022344CC ; =sub_0200DD68
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344CC: .word sub_0200DD68
	thumb_func_end ov07_022344C4

	thumb_func_start ov07_022344D0
ov07_022344D0: ; 0x022344D0
	ldr r3, _022344D8 ; =sub_0200DD54
	ldr r0, [r0, #0x30]
	bx r3
	nop
_022344D8: .word sub_0200DD54
	thumb_func_end ov07_022344D0

	thumb_func_start ov07_022344DC
ov07_022344DC: ; 0x022344DC
	add r0, #0xdc
	str r1, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end ov07_022344DC

	thumb_func_start ov07_022344E4
ov07_022344E4: ; 0x022344E4
	push {r3, lr}
	sub r1, r1, r3
	neg r1, r1
	sub r0, r0, r2
	lsl r1, r1, #0x10
	lsl r0, r0, #0x10
	asr r1, r1, #0x10
	add r2, r1, #0
	asr r0, r0, #0x10
	mul r2, r1
	add r1, r0, #0
	mul r1, r0
	add r0, r2, r1
	lsl r0, r0, #0xc
	bl FX_Sqrt
	asr r1, r0, #0xb
	lsr r1, r1, #0x14
	add r1, r0, r1
	asr r0, r1, #0xc
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_022344E4

	thumb_func_start ov07_02234510
ov07_02234510: ; 0x02234510
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl SealOnCapsuleGetX
	add r4, r0, #0
	add r0, r5, #0
	bl SealOnCapsuleGetY
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0xbe
	mov r3, #0x46
	bl ov07_022344E4
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02234510

	thumb_func_start ov07_02234530
ov07_02234530: ; 0x02234530
	push {r4, lr}
	sub sp, #8
	ldr r3, _02234588 ; =ov07_0223777C
	add r4, r0, #0
	add r2, sp, #0
	mov r1, #7
_0223453C:
	ldrb r0, [r3]
	add r3, r3, #1
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0223453C
	add r0, r4, #0
	bl SealOnCapsuleGetID
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0209109C
	cmp r0, #0
	bne _0223457E
	add r0, r4, #0
	bl ov07_02234510
	cmp r0, #0x38
	blt _02234568
	mov r0, #3
	b _02234576
_02234568:
	add r0, r0, #1
	mov r1, #0x14
	bl _s32_div_f
	cmp r0, #3
	blt _02234576
	mov r0, #3
_02234576:
	add r1, sp, #0
	add sp, #8
	ldrb r0, [r1, r0]
	pop {r4, pc}
_0223457E:
	add r0, sp, #0
	ldrb r0, [r0, #1]
	add sp, #8
	pop {r4, pc}
	nop
_02234588: .word ov07_0223777C
	thumb_func_end ov07_02234530

	thumb_func_start ov07_0223458C
ov07_0223458C: ; 0x0223458C
	push {r4, r5, r6, lr}
	add r5, r1, #0
	mov r1, #0x48
	add r6, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _022345A4
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_022345A4:
	bl ov07_0221C69C
	str r6, [r4]
	cmp r5, #0
	beq _022345B2
	ldr r0, [r5]
	str r0, [r4, #4]
_022345B2:
	mov r1, #0
	add r2, r4, #0
	add r0, r1, #0
_022345B8:
	add r1, r1, #1
	str r0, [r2, #8]
	add r2, r2, #4
	cmp r1, #0x10
	blt _022345B8
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_0223458C

	thumb_func_start ov07_022345C8
ov07_022345C8: ; 0x022345C8
	push {r4, r5, r6, lr}
	mov r4, #0
	add r5, r4, #0
	add r3, r0, #0
_022345D0:
	ldr r2, [r3, #8]
	cmp r2, #0
	bne _022345F0
	add r4, r0, #0
	ldr r0, [r0]
	add r4, #8
	lsl r6, r5, #2
	bl ov07_02234658
	str r0, [r4, r6]
	ldr r0, [r4, r6]
	mov r1, #0
	str r1, [r0, #0x18]
	ldr r4, [r4, r6]
	str r5, [r4]
	b _022345F8
_022345F0:
	add r5, r5, #1
	add r3, r3, #4
	cmp r5, #0x10
	blt _022345D0
_022345F8:
	cmp r4, #0
	bne _02234600
	bl GF_AssertFail
_02234600:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_022345C8

	thumb_func_start ov07_02234604
ov07_02234604: ; 0x02234604
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_0223460C:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02234616
	bl FreeToHeap
_02234616:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x10
	blt _0223460C
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02234604

	thumb_func_start ov07_02234628
ov07_02234628: ; 0x02234628
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0223462E:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _0223464C
	ldr r0, [r0, #0x10]
	bl ov07_0221FF2C
	ldr r1, [r5, #8]
	ldr r0, [r1, #0x20]
	cmp r0, #0
	beq _0223464C
	ldr r0, [r1, #0x18]
	cmp r0, #0
	beq _0223464C
	bl DestroySysTask
_0223464C:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x10
	blt _0223462E
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_02234628

	thumb_func_start ov07_02234658
ov07_02234658: ; 0x02234658
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #0x24
	add r5, r0, #0
	bl AllocFromHeap
	add r4, r0, #0
	bne _02234670
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
_02234670:
	str r5, [r4, #4]
	ldr r1, [r6]
	ldr r0, [r6, #4]
	str r1, [r4, #8]
	str r0, [r4, #0xc]
	ldr r0, [r4, #8]
	bl ov07_02234718
	str r0, [r4, #0x1c]
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	mov r2, #1
	bl ov07_0221FE88
	str r0, [r4, #0x10]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov07_02234658

	thumb_func_start ov07_02234694
ov07_02234694: ; 0x02234694
	push {r4, lr}
	add r4, r0, #0
	mov r1, #1
	str r1, [r4, #0x20]
	ldr r1, _022346B4 ; =ov07_02234710
	bl ov07_022346E4
	mov r2, #0xfa
	ldr r0, _022346B8 ; =ov07_022346C0
	add r1, r4, #0
	lsl r2, r2, #2
	bl CreateSysTask
	str r0, [r4, #0x18]
	pop {r4, pc}
	nop
_022346B4: .word ov07_02234710
_022346B8: .word ov07_022346C0
	thumb_func_end ov07_02234694

	thumb_func_start ov07_022346BC
ov07_022346BC: ; 0x022346BC
	ldr r0, [r0, #0x20]
	bx lr
	thumb_func_end ov07_022346BC

	thumb_func_start ov07_022346C0
ov07_022346C0: ; 0x022346C0
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	bl sub_020154B0
	cmp r0, #0
	bne _022346E0
	mov r0, #0
	str r0, [r4, #0x20]
	ldr r0, [r4, #0x10]
	bl ov07_0221FF2C
	add r0, r5, #0
	bl DestroySysTask
_022346E0:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov07_022346C0

	thumb_func_start ov07_022346E4
ov07_022346E4: ; 0x022346E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x1c]
	add r6, r1, #0
	mov r4, #0
	cmp r0, #0
	ble _02234706
_022346F2:
	ldr r0, [r5, #0x10]
	add r1, r4, #0
	add r2, r6, #0
	add r3, r5, #0
	bl sub_02015494
	ldr r0, [r5, #0x1c]
	add r4, r4, #1
	cmp r4, r0
	blt _022346F2
_02234706:
	ldr r0, [r5, #0x10]
	ldr r1, [r5, #0xc]
	bl sub_02015528
	pop {r4, r5, r6, pc}
	thumb_func_end ov07_022346E4

	thumb_func_start ov07_02234710
ov07_02234710: ; 0x02234710
	ldr r3, _02234714 ; =sub_02015504
	bx r3
	.balign 4, 0
_02234714: .word sub_02015504
	thumb_func_end ov07_02234710

	thumb_func_start ov07_02234718
ov07_02234718: ; 0x02234718
	push {r3, r4, r5, lr}
	sub sp, #0x58
	ldr r4, _02234748 ; =ov07_02237784
	add r5, r0, #0
	add r3, sp, #0
	mov r2, #0xb
_02234724:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _02234724
	sub r0, r5, #5
	cmp r0, #0x16
	blo _0223473C
	bl GF_AssertFail
	add sp, #0x58
	mov r0, #0
	pop {r3, r4, r5, pc}
_0223473C:
	lsl r1, r0, #2
	add r0, sp, #0
	ldr r0, [r0, r1]
	add sp, #0x58
	pop {r3, r4, r5, pc}
	nop
_02234748: .word ov07_02237784
	thumb_func_end ov07_02234718

	thumb_func_start ov07_0223474C
ov07_0223474C: ; 0x0223474C
	push {r3, lr}
	add r3, r1, #0
	ldr r1, [r0]
	mov r2, #0
	bl ov07_0223476C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_0223474C

	thumb_func_start ov07_0223475C
ov07_0223475C: ; 0x0223475C
	push {r3, lr}
	add r3, r1, #0
	ldr r1, [r0, #4]
	mov r2, #1
	bl ov07_0223476C
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov07_0223475C

	thumb_func_start ov07_0223476C
ov07_0223476C: ; 0x0223476C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	add r7, r2, #0
	str r3, [sp, #0x10]
	bl sub_02009334
	ldr r0, [r5, #4]
	lsl r1, r0, #1
	add r1, r5, r1
	ldrh r6, [r1, #0x28]
	add r1, r5, r0
	add r1, #0x30
	ldrb r1, [r1]
	add r2, r5, r0
	add r2, #0x38
	str r1, [sp, #0x1c]
	add r1, r5, r0
	lsl r0, r0, #2
	ldrb r2, [r2]
	add r0, r5, r0
	add r1, #0x34
	ldr r0, [r0, #0x3c]
	ldrb r1, [r1]
	str r2, [sp, #0x18]
	str r0, [sp, #0x14]
	cmp r7, #0
	beq _022347C2
	add r0, r5, r4
	add r0, #0x4c
	ldrb r2, [r0]
	mov r0, #1
	tst r0, r2
	beq _022347BE
	mov r4, #0
	b _022347D4
_022347BE:
	mov r4, #2
	b _022347D4
_022347C2:
	add r0, r5, r4
	add r0, #0x4c
	ldrb r2, [r0]
	mov r0, #1
	tst r0, r2
	beq _022347D2
	mov r4, #2
	b _022347D4
_022347D2:
	mov r4, #0
_022347D4:
	lsl r0, r1, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x1c]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	lsl r1, r6, #0x10
	lsl r2, r2, #0x18
	lsl r3, r4, #0x18
	str r0, [sp, #8]
	add r0, sp, #0x28
	lsr r1, r1, #0x10
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl GetMonSpriteCharAndPlttNarcIdsEx
	ldr r0, [r5]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl sub_02009414
	add r7, r0, #0
	add r3, sp, #0x28
	add r2, r7, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl sub_02009324
	ldr r0, [sp, #0x14]
	ldr r2, [sp, #0x10]
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r4, [sp, #8]
	ldrh r0, [r7, #6]
	str r0, [sp, #0xc]
	ldr r3, [r5]
	ldrh r0, [r7]
	lsl r3, r3, #2
	add r3, r5, r3
	ldr r3, [r3, #8]
	ldrh r1, [r7, #2]
	ldr r3, [r3]
	bl sub_02014540
	ldr r1, [r5]
	ldr r3, [sp, #0x18]
	lsl r1, r1, #2
	add r1, r5, r1
	lsl r2, r4, #0x18
	lsl r3, r3, #0x18
	ldrh r0, [r7]
	ldr r1, [r1, #8]
	lsr r2, r2, #0x18
	str r0, [r1, #4]
	ldr r1, [r5]
	ldrh r0, [r7, #4]
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #8]
	lsr r3, r3, #0x18
	str r0, [r1, #8]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x1c]
	str r0, [sp]
	lsl r0, r6, #0x10
	lsl r1, r1, #0x18
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	bl sub_020708D8
	ldr r1, [r5]
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #8]
	str r0, [r1, #0xc]
	ldr r0, [r5]
	lsl r1, r0, #2
	add r1, r5, r1
	ldr r1, [r1, #8]
	add r0, r5, r0
	ldr r1, [r1, #0xc]
	add r0, #0x4c
	lsl r1, r1, #0x18
	asr r7, r1, #0x18
	ldrb r0, [r0]
	mov r1, #1
	bl ov07_02234B5C
	str r0, [sp, #0x20]
	ldr r0, [r5]
	ldr r2, [sp, #0x20]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	mov r1, #1
	add r2, r2, r7
	bl sub_020087A4
	cmp r4, #2
	bne _02234948
	ldr r1, [sp, #0x10]
	mov r0, #0xb4
	bl NARC_ctor
	add r1, sp, #0x24
	lsl r2, r6, #0x10
	add r1, #2
	lsr r2, r2, #0x10
	add r4, r0, #0
	bl sub_020729D8
	add r1, sp, #0x24
	lsl r2, r6, #0x10
	add r0, r4, #0
	add r1, #1
	lsr r2, r2, #0x10
	bl sub_020729FC
	lsl r2, r6, #0x10
	add r0, r4, #0
	add r1, sp, #0x24
	lsr r2, r2, #0x10
	bl sub_02072A20
	add r0, r4, #0
	bl NARC_dtor
	ldr r0, [r5]
	add r2, sp, #0x24
	lsl r0, r0, #2
	add r0, r5, r0
	ldrb r2, [r2]
	ldr r0, [r0, #0x18]
	mov r1, #0x2e
	bl sub_020087A4
	ldr r0, [r5]
	ldr r2, [sp, #0x20]
	lsl r0, r0, #2
	add r0, r5, r0
	add r2, #0x24
	ldr r0, [r0, #0x18]
	mov r1, #0x14
	str r2, [sp, #0x20]
	bl sub_020087A4
	ldr r0, [r5]
	add r3, sp, #0x24
	lsl r0, r0, #2
	mov r2, #1
	add r0, r5, r0
	ldrsb r2, [r3, r2]
	ldr r0, [r0, #0x18]
	mov r1, #0x15
	bl sub_020087A4
	ldr r0, [r5]
	mov r2, #0x24
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	mov r1, #0x16
	sub r2, r2, r7
	bl sub_020087A4
	ldr r0, [r5]
	add r3, sp, #0x24
	lsl r0, r0, #2
	mov r2, #2
	add r0, r5, r0
	ldrsb r2, [r3, r2]
	ldr r0, [r0, #0x18]
	mov r1, #0x29
	bl sub_020087A4
_02234948:
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0223476C

	thumb_func_start ov07_0223494C
ov07_0223494C: ; 0x0223494C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	ldr r0, [r5]
	str r1, [sp, #0x10]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl sub_02009390
	ldr r0, [r5]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl sub_02009414
	add r4, r0, #0
	ldr r0, [r5]
	lsl r1, r0, #1
	add r1, r5, r1
	ldrh r1, [r1, #0x28]
	lsl r3, r0, #2
	str r1, [sp, #0x1c]
	add r1, r5, r0
	add r1, #0x30
	ldrb r1, [r1]
	str r1, [sp, #0x18]
	add r1, r5, r0
	add r1, #0x38
	ldrb r1, [r1]
	add r0, r5, r0
	add r0, #0x4c
	str r1, [sp, #0x14]
	add r1, r5, r3
	ldr r7, [r1, #0x3c]
	ldrb r1, [r0]
	mov r0, #1
	tst r0, r1
	beq _0223499E
	mov r6, #2
	b _022349A0
_0223499E:
	mov r6, #0
_022349A0:
	str r7, [sp]
	mov r0, #0
	str r0, [sp, #4]
	str r6, [sp, #8]
	ldrh r0, [r4, #6]
	add r3, r5, r3
	ldr r2, [sp, #0x10]
	str r0, [sp, #0xc]
	ldr r3, [r3, #8]
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	ldr r3, [r3]
	bl sub_02014540
	ldr r1, [r5]
	ldrh r0, [r4]
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #8]
	ldr r3, [sp, #0x14]
	str r0, [r1, #4]
	ldr r1, [r5]
	lsl r2, r6, #0x18
	lsl r1, r1, #2
	add r1, r5, r1
	lsl r3, r3, #0x18
	ldrh r0, [r4, #4]
	ldr r1, [r1, #8]
	lsr r2, r2, #0x18
	str r0, [r1, #8]
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x18]
	lsl r0, r0, #0x10
	lsl r1, r1, #0x18
	str r7, [sp]
	lsr r0, r0, #0x10
	lsr r1, r1, #0x18
	lsr r3, r3, #0x18
	bl sub_020708D8
	ldr r1, [r5]
	lsl r1, r1, #2
	add r1, r5, r1
	ldr r1, [r1, #8]
	str r0, [r1, #0xc]
	ldr r0, [r5]
	mov r1, #1
	lsl r4, r0, #2
	add r0, r5, r0
	add r0, #0x4c
	ldrb r0, [r0]
	bl ov07_02234B5C
	add r1, r5, r4
	add r2, r0, #0
	ldr r0, [r1, #8]
	ldr r3, [r0, #0xc]
	ldr r0, [r1, #0x18]
	mov r1, #1
	add r2, r3, r2
	bl sub_020087A4
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov07_0223494C

	thumb_func_start ov07_02234A20
ov07_02234A20: ; 0x02234A20
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl sub_02009334
	mov r0, #0x72
	add r3, sp, #0
	add r1, r0, #0
	strh r0, [r3, #4]
	add r1, #0x90
	strh r1, [r3, #8]
	mov r1, #0
	strh r1, [r3, #0xa]
	strb r1, [r3, #0xc]
	str r1, [sp, #0x10]
	ldr r1, [r5]
	add r2, r5, r1
	add r2, #0x4c
	ldrb r4, [r2]
	mov r2, #1
	tst r4, r2
	beq _02234A5E
	add r0, #0x8f
	strh r0, [r3, #6]
	mov r4, #0x87
	b _02234A64
_02234A5E:
	add r2, #0xff
	strh r2, [r3, #6]
	mov r4, #0x86
_02234A64:
	lsl r0, r1, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl sub_02009414
	add r7, r0, #0
	add r3, sp, #4
	add r2, r7, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r5]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	bl sub_02009324
	ldr r3, [r5]
	ldrh r0, [r7]
	lsl r3, r3, #2
	add r3, r5, r3
	ldr r3, [r3, #8]
	ldrh r1, [r7, #2]
	ldr r3, [r3]
	add r2, r6, #0
	bl sub_02014400
	ldr r2, [r5]
	add r1, sp, #0
	lsl r2, r2, #2
	add r2, r5, r2
	ldrh r0, [r1, #4]
	ldr r2, [r2, #8]
	str r0, [r2, #4]
	ldr r0, [r5]
	ldrh r1, [r1, #8]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #8]
	add r2, r4, #0
	str r1, [r0, #8]
	add r0, sp, #0
	mov r1, #0x75
	bl ReadWholeNarcMemberByIdPair
	add r0, sp, #0
	ldrb r1, [r0]
	ldr r0, [r5]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #8]
	str r1, [r0, #0xc]
	ldr r0, [r5]
	mov r1, #1
	lsl r4, r0, #2
	add r0, r5, r0
	add r0, #0x4c
	ldrb r0, [r0]
	bl ov07_02234B5C
	add r2, r5, r4
	ldr r1, [r2, #8]
	ldr r1, [r1, #0xc]
	add r4, r1, r0
	ldr r0, [r2, #0x18]
	mov r1, #1
	add r2, r4, #0
	bl sub_020087A4
	ldr r1, [r5]
	mov r2, #1
	add r0, r5, r1
	add r0, #0x4c
	ldrb r0, [r0]
	tst r0, r2
	beq _02234B58
	lsl r0, r1, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	mov r1, #0x2e
	bl sub_020087A4
	ldr r0, [r5]
	add r2, sp, #0
	ldrb r3, [r2]
	lsl r0, r0, #2
	add r0, r5, r0
	mov r2, #0x24
	sub r2, r2, r3
	ldr r0, [r0, #0x18]
	mov r1, #0x14
	add r2, r4, r2
	bl sub_020087A4
	ldr r0, [r5]
	mov r1, #0x15
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	mov r2, #0
	bl sub_020087A4
	ldr r0, [r5]
	add r2, sp, #0
	lsl r0, r0, #2
	ldrb r3, [r2]
	add r0, r5, r0
	mov r2, #0x24
	ldr r0, [r0, #0x18]
	mov r1, #0x16
	sub r2, r2, r3
	bl sub_020087A4
	ldr r0, [r5]
	mov r1, #0x29
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #0x18]
	mov r2, #0
	bl sub_020087A4
_02234B58:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov07_02234A20

	thumb_func_start ov07_02234B5C
ov07_02234B5C: ; 0x02234B5C
	cmp r1, #0
	bne _02234B68
	lsl r1, r0, #2
	ldr r0, _02234B78 ; =ov07_022377DC
	ldrsh r0, [r0, r1]
	bx lr
_02234B68:
	mov r2, #6
	mul r2, r0
	ldr r0, _02234B7C ; =ov07_022377F4
	lsl r1, r1, #1
	add r0, r0, r2
	ldrsh r0, [r1, r0]
	bx lr
	nop
_02234B78: .word ov07_022377DC
_02234B7C: .word ov07_022377F4
	thumb_func_end ov07_02234B5C

	.rodata

_02234B80:
	.byte 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov07_02234B8C: ; 0x02234B8C
	.byte 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00

ov07_02234B98: ; 0x02234B98
	.byte 0x03, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00
	.byte 0x30, 0x00, 0x00, 0x00, 0xC0, 0x00, 0x00, 0x00

ov07_02234BA8: ; 0x02234BA8
	.byte 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00
	.byte 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x01

ov07_02234BC0: ; 0x02234BC0
	.word ov07_0221DFB4
	.word ov07_0221E280
	.word ov07_0221E5E0
	.word ov07_0221E0B4
	.word ov07_0221E3B8
	.word ov07_0221E5EC

ov07_02234BD8: ; 0x02234BD8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00

ov07_02234BF0: ; 0x02234BF0
	.byte 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_02234C08: ; 0x02234C08
	.word ov07_0221C5C4
	.word ov07_0221C5C8
	.word ov07_0221C624
	.word ov07_0221C62C
	.word ov07_0221C634
	.word ov07_0221C674

ov07_02234C20: ; 0x02234C20
	.byte 0x20, 0x00, 0x1C, 0x00, 0x18, 0x00, 0x14, 0x00, 0x10, 0x00, 0x0C, 0x00, 0x08, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x08, 0x00, 0x0C, 0x00, 0x10, 0x00, 0x14, 0x00, 0x18, 0x00, 0x1C, 0x00, 0x20, 0x00

ov07_02234C40: ; 0x02234C40
	.word ov07_0221E6D0
	.word ov07_0221E6D4
	.word ov07_0221ECE8
	.word ov07_0221ED00
	.word ov07_0221E6D0
	.word ov07_0221E788
	.word ov07_0221E868
	.word ov07_0221E9D4
	.word ov07_0221EB84

ov07_02234C64: ; 0x02234C64
	.byte 0xBD, 0x00, 0x00, 0x00, 0xBD, 0x00, 0x00, 0x00, 0x2E, 0x01, 0x00, 0x00
	.byte 0x2E, 0x01, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00, 0xA3, 0x01, 0x00, 0x00
	.byte 0x60, 0x01, 0x00, 0x00, 0xA4, 0x01, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x55, 0x01, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov07_02234CC8: ; 0x02234CC8
	.byte 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00

ov07_02234D58: ; 0x02234D58
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00

ov07_02234DE8: ; 0x02234DE8
	.word ov07_0221C6EC
	.word ov07_0221C70C
	.word ov07_0221C934
	.word ov07_0221C974
	.word ov07_0221C9C0
	.word ov07_0221F098
	.word ov07_0221D5A8
	.word ov07_0221D5AC
	.word ov07_0221F3F4
	.word ov07_0221F424
	.word ov07_0221D02C
	.word ov07_0221D05C
	.word ov07_0221C72C
	.word ov07_0221D148
	.word ov07_0221D2B0
	.word ov07_0221D2E4
	.word ov07_0221ED44
	.word ov07_0221EE74
	.word ov07_0221EEC0
	.word ov07_0221EF14
	.word ov07_0221EF34
	.word ov07_0221EF54
	.word ov07_0221F0CC
	.word ov07_0221F104
	.word ov07_0221F120
	.word ov07_0221F2DC
	.word ov07_0221F340
	.word ov07_0221F42C
	.word ov07_0221F398
	.word ov07_0221F39C
	.word ov07_0221D088
	.word ov07_0221D5B0
	.word ov07_0221D718
	.word ov07_0221D0C0
	.word ov07_0221F024
	.word ov07_0221F1C0
	.word ov07_0221F238
	.word ov07_0221F084
	.word ov07_0221F088
	.word ov07_0221F08C
	.word ov07_0221DD0C
	.word ov07_0221DD10
	.word ov07_0221F090
	.word ov07_0221F094
	.word ov07_0221F0B0
	.word ov07_0221D0E8
	.word ov07_0221CBC0
	.word ov07_0221CC54
	.word ov07_0221CDA4
	.word ov07_0221CE5C
	.word ov07_0221CF14
	.word ov07_0221CF54
	.word ov07_0221CFA8
	.word ov07_0221D000
	.word ov07_0221F8AC
	.word ov07_0221F814
	.word ov07_0221D740
	.word ov07_0221D7B8
	.word ov07_0221D874
	.word ov07_0221DA74
	.word ov07_0221DAA0
	.word ov07_0221DCC0
	.word ov07_0221DCD4
	.word ov07_0221DCF0
	.word ov07_0221D174
	.word ov07_0221F81C
	.word ov07_0221F880
	.word ov07_0221C74C
	.word ov07_0221C8CC
	.word ov07_0221C910
	.word ov07_0221D1B8
	.word ov07_0221D214
	.word ov07_0221D270
	.word ov07_0221F430
	.word ov07_0221F4CC
	.word ov07_0221F514
	.word ov07_0221F574
	.word ov07_0221F5BC
	.word ov07_0221F604
	.word ov07_0221F710
	.word ov07_0221F7C4
	.word ov07_0221F7F0
	.word ov07_0221DAF4
	.word ov07_0221DCA8
	.word ov07_0221C6B4
	.word ov07_0221D374
	.word ov07_0221ED94
	.word ov07_0221D23C

ov07_02234F48: ; 0x02234F48
	.byte 0x3B, 0x00, 0x00, 0x00, 0x27, 0x01, 0x00, 0x00
	.byte 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00
	.byte 0x27, 0x01, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00
	.byte 0x77, 0x00, 0x00, 0x00, 0x3F, 0x01, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
	.byte 0x78, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x27, 0x01, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00
	.byte 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x27, 0x01, 0x00, 0x00
	.byte 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00
	.byte 0x4A, 0x01, 0x00, 0x00, 0x38, 0x00, 0x00, 0x00, 0x39, 0x00, 0x00, 0x00, 0x3A, 0x00, 0x00, 0x00
	.byte 0x3F, 0x00, 0x00, 0x00, 0x28, 0x01, 0x00, 0x00, 0x3C, 0x00, 0x00, 0x00, 0x3D, 0x00, 0x00, 0x00
	.byte 0x3E, 0x00, 0x00, 0x00, 0x8E, 0x00, 0x00, 0x00, 0x4E, 0x01, 0x00, 0x00, 0x8F, 0x00, 0x00, 0x00
	.byte 0x90, 0x00, 0x00, 0x00, 0x8F, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x51, 0x01, 0x00, 0x00
	.byte 0x3C, 0x00, 0x00, 0x00, 0x3D, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x29, 0x01, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x29, 0x01, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00
	.byte 0x41, 0x00, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00, 0x40, 0x01, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
	.byte 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x49, 0x01, 0x00, 0x00
	.byte 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00
	.byte 0x50, 0x01, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00
	.byte 0x77, 0x00, 0x00, 0x00, 0x3E, 0x01, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
	.byte 0x78, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x2C, 0x01, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00
	.byte 0x42, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x46, 0x00, 0x00, 0x00, 0x34, 0x01, 0x00, 0x00
	.byte 0x42, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x77, 0x00, 0x00, 0x00
	.byte 0x3D, 0x01, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00, 0x78, 0x00, 0x00, 0x00
	.byte 0x46, 0x00, 0x00, 0x00, 0x34, 0x01, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00
	.byte 0x42, 0x00, 0x00, 0x00, 0x4B, 0x00, 0x00, 0x00, 0x2D, 0x01, 0x00, 0x00, 0x4C, 0x00, 0x00, 0x00
	.byte 0x4C, 0x00, 0x00, 0x00, 0x4A, 0x00, 0x00, 0x00, 0x53, 0x00, 0x00, 0x00, 0x2F, 0x01, 0x00, 0x00
	.byte 0x50, 0x00, 0x00, 0x00, 0x51, 0x00, 0x00, 0x00, 0x52, 0x00, 0x00, 0x00, 0x59, 0x00, 0x00, 0x00
	.byte 0x31, 0x01, 0x00, 0x00, 0x56, 0x00, 0x00, 0x00, 0x57, 0x00, 0x00, 0x00, 0x58, 0x00, 0x00, 0x00
	.byte 0x5D, 0x00, 0x00, 0x00, 0x32, 0x01, 0x00, 0x00, 0x5A, 0x00, 0x00, 0x00, 0x5B, 0x00, 0x00, 0x00
	.byte 0x5C, 0x00, 0x00, 0x00, 0x5E, 0x00, 0x00, 0x00, 0x33, 0x01, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00
	.byte 0x5F, 0x00, 0x00, 0x00, 0x5F, 0x00, 0x00, 0x00, 0x63, 0x00, 0x00, 0x00, 0x36, 0x01, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x64, 0x00, 0x00, 0x00, 0x66, 0x00, 0x00, 0x00
	.byte 0x37, 0x01, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00, 0x67, 0x00, 0x00, 0x00, 0x65, 0x00, 0x00, 0x00
	.byte 0x6C, 0x00, 0x00, 0x00, 0x38, 0x01, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00
	.byte 0x6B, 0x00, 0x00, 0x00, 0x6C, 0x00, 0x00, 0x00, 0x5C, 0x01, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00
	.byte 0x6B, 0x00, 0x00, 0x00, 0x6B, 0x00, 0x00, 0x00, 0x6D, 0x00, 0x00, 0x00, 0x39, 0x01, 0x00, 0x00
	.byte 0x6E, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x6F, 0x00, 0x00, 0x00
	.byte 0x3A, 0x01, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00, 0x70, 0x00, 0x00, 0x00
	.byte 0x6D, 0x00, 0x00, 0x00, 0x39, 0x01, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00
	.byte 0x6E, 0x00, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00, 0x3C, 0x01, 0x00, 0x00, 0x73, 0x00, 0x00, 0x00
	.byte 0x74, 0x00, 0x00, 0x00, 0x75, 0x00, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00, 0x3C, 0x01, 0x00, 0x00
	.byte 0x73, 0x00, 0x00, 0x00, 0x74, 0x00, 0x00, 0x00, 0x75, 0x00, 0x00, 0x00, 0x76, 0x00, 0x00, 0x00
	.byte 0x3C, 0x01, 0x00, 0x00, 0x73, 0x00, 0x00, 0x00, 0x74, 0x00, 0x00, 0x00, 0x75, 0x00, 0x00, 0x00
	.byte 0x7D, 0x00, 0x00, 0x00, 0x44, 0x01, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00, 0x7E, 0x00, 0x00, 0x00
	.byte 0x7E, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x46, 0x01, 0x00, 0x00, 0x83, 0x00, 0x00, 0x00
	.byte 0x83, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00, 0x84, 0x00, 0x00, 0x00, 0x47, 0x01, 0x00, 0x00
	.byte 0x85, 0x00, 0x00, 0x00, 0x85, 0x00, 0x00, 0x00, 0x86, 0x00, 0x00, 0x00, 0x8B, 0x00, 0x00, 0x00
	.byte 0x4C, 0x01, 0x00, 0x00, 0x89, 0x00, 0x00, 0x00, 0x8A, 0x00, 0x00, 0x00, 0x8A, 0x00, 0x00, 0x00
	.byte 0x8C, 0x00, 0x00, 0x00, 0x4D, 0x01, 0x00, 0x00, 0x8D, 0x00, 0x00, 0x00, 0x8D, 0x00, 0x00, 0x00
	.byte 0x8D, 0x00, 0x00, 0x00, 0x91, 0x00, 0x00, 0x00, 0x4F, 0x01, 0x00, 0x00, 0x92, 0x00, 0x00, 0x00
	.byte 0x92, 0x00, 0x00, 0x00, 0x92, 0x00, 0x00, 0x00, 0x96, 0x00, 0x00, 0x00, 0x52, 0x01, 0x00, 0x00
	.byte 0x93, 0x00, 0x00, 0x00, 0x94, 0x00, 0x00, 0x00, 0x95, 0x00, 0x00, 0x00, 0x9A, 0x00, 0x00, 0x00
	.byte 0x53, 0x01, 0x00, 0x00, 0x97, 0x00, 0x00, 0x00, 0x98, 0x00, 0x00, 0x00, 0x99, 0x00, 0x00, 0x00
	.byte 0x9B, 0x00, 0x00, 0x00, 0x54, 0x01, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00, 0x9C, 0x00, 0x00, 0x00
	.byte 0x9C, 0x00, 0x00, 0x00, 0x9D, 0x00, 0x00, 0x00, 0x55, 0x01, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00
	.byte 0x9E, 0x00, 0x00, 0x00, 0x9E, 0x00, 0x00, 0x00, 0x9F, 0x00, 0x00, 0x00, 0x56, 0x01, 0x00, 0x00
	.byte 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xA0, 0x00, 0x00, 0x00, 0xA4, 0x00, 0x00, 0x00
	.byte 0x57, 0x01, 0x00, 0x00, 0xA1, 0x00, 0x00, 0x00, 0xA2, 0x00, 0x00, 0x00, 0xA3, 0x00, 0x00, 0x00
	.byte 0xA5, 0x00, 0x00, 0x00, 0x58, 0x01, 0x00, 0x00, 0xA6, 0x00, 0x00, 0x00, 0xA6, 0x00, 0x00, 0x00
	.byte 0xA6, 0x00, 0x00, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x22, 0x01, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00
	.byte 0x2F, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00, 0xA7, 0x00, 0x00, 0x00, 0x59, 0x01, 0x00, 0x00
	.byte 0xA8, 0x00, 0x00, 0x00, 0xA9, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00, 0xA7, 0x00, 0x00, 0x00
	.byte 0x5B, 0x01, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00, 0xA9, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x00, 0x00
	.byte 0xAA, 0x00, 0x00, 0x00, 0x5A, 0x01, 0x00, 0x00, 0xAC, 0x00, 0x00, 0x00, 0xAB, 0x00, 0x00, 0x00
	.byte 0xAB, 0x00, 0x00, 0x00, 0x48, 0x00, 0x00, 0x00, 0x2B, 0x01, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00
	.byte 0x49, 0x00, 0x00, 0x00, 0x49, 0x00, 0x00, 0x00, 0x54, 0x00, 0x00, 0x00, 0x30, 0x01, 0x00, 0x00
	.byte 0x55, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x55, 0x00, 0x00, 0x00, 0x4F, 0x00, 0x00, 0x00
	.byte 0x2E, 0x01, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00, 0x4E, 0x00, 0x00, 0x00, 0x4D, 0x00, 0x00, 0x00
	.byte 0x71, 0x00, 0x00, 0x00, 0x3B, 0x01, 0x00, 0x00, 0x72, 0x00, 0x00, 0x00, 0x72, 0x00, 0x00, 0x00
	.byte 0x72, 0x00, 0x00, 0x00, 0x7B, 0x00, 0x00, 0x00, 0x43, 0x01, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00
	.byte 0x7C, 0x00, 0x00, 0x00, 0x7C, 0x00, 0x00, 0x00, 0x79, 0x00, 0x00, 0x00, 0x42, 0x01, 0x00, 0x00
	.byte 0x7A, 0x00, 0x00, 0x00, 0x7A, 0x00, 0x00, 0x00, 0x7A, 0x00, 0x00, 0x00, 0x87, 0x00, 0x00, 0x00
	.byte 0x4B, 0x01, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00
	.byte 0x62, 0x00, 0x00, 0x00, 0x35, 0x01, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00

ov07_022353E4: ; 0x022353E4
	.word ov07_0221FE84
	.word ov07_0221FF78
	.word ov07_02220030
	.word ov07_022200D0
	.word ov07_0222008C
	.word ov07_02220800
	.word ov07_02220884
	.word ov07_0222080C
	.word ov07_02220818
	.word ov07_02220824
	.word ov07_02220830
	.word ov07_0222083C
	.word ov07_02220848
	.word ov07_02220854
	.word ov07_02220860
	.word ov07_0222086C
	.word ov07_02220878
	.word ov07_022215B4
	.word ov07_02220230
	.word ov07_02220160
	.word ov07_022201C8
	.word ov07_02220114
	.word ov07_0221FF74

ov07_02235440: ; 0x02235440
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xF0, 0xFF
	.byte 0xFF, 0x00, 0xF0, 0xFF, 0xFF, 0x00, 0xFF, 0x00, 0x20, 0x00, 0xFF, 0x00, 0x20, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x10, 0x00, 0xFF, 0x00, 0x04, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xF0, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00

ov07_02235488: ; 0x02235488
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x10, 0x00, 0xFF, 0x00, 0x10, 0x00, 0xFF, 0x00, 0xFF, 0x00
	.byte 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0xFF, 0x00, 0x00, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x18, 0x00, 0xFF, 0x00, 0x18, 0x00, 0xFF, 0x00

ov07_022354D0: ; 0x022354D0
	.byte 0xE0, 0xF6, 0xFF, 0xFF, 0xA0, 0x05, 0x00, 0x00, 0xE0, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_022354E0: ; 0x022354E0
	.byte 0x80, 0xE9, 0xFF, 0xFF, 0x00, 0xEF, 0xFF, 0xFF, 0x10, 0x25, 0x00, 0x00, 0x40, 0xF8, 0xFF, 0xFF
	.byte 0x10, 0xD2, 0xFF, 0xFF, 0xD0, 0x0C, 0x00, 0x00, 0xC8, 0x35, 0x00, 0x00, 0x48, 0xFA, 0xFF, 0xFF
	.byte 0x00, 0xEB, 0xFF, 0xFF, 0x08, 0xF5, 0xFF, 0xFF, 0x48, 0x1B, 0x00, 0x00, 0x08, 0x08, 0x00, 0x00

ov07_02235510: ; 0x02235510
	.byte 0x30, 0x0B, 0x00, 0x00, 0xA8, 0x0E, 0x00, 0x00, 0x80, 0xF4, 0xFF, 0xFF, 0xB0, 0x05, 0x00, 0x00
	.byte 0x18, 0x0B, 0x00, 0x00, 0xAA, 0xFC, 0xFF, 0xFF, 0x50, 0xF1, 0xFF, 0xFF, 0x18, 0xF6, 0xFF, 0xFF
	.byte 0xF0, 0x08, 0x00, 0x00, 0x68, 0x09, 0x00, 0x00, 0x10, 0xF3, 0xFF, 0xFF, 0x28, 0xF5, 0xFF, 0xFF

ov07_02235540: ; 0x02235540
	.byte 0x00, 0xEE, 0xFF, 0xFF, 0x80, 0xEE, 0xFF, 0xFF, 0xC8, 0x1D, 0x00, 0x00, 0xC8, 0x08, 0x00, 0x00
	.byte 0xC0, 0xDC, 0xFF, 0xFF, 0x36, 0xF4, 0xFF, 0xFF, 0x00, 0x33, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00
	.byte 0x80, 0xF6, 0xFF, 0xFF, 0x40, 0xED, 0xFF, 0xFF, 0x40, 0x18, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00
	.byte 0xA0, 0x1B, 0x00, 0x00, 0xC0, 0xF1, 0xFF, 0xFF

ov07_02235578: ; 0x02235578
	.byte 0xF4, 0xD4, 0xFF, 0xFF, 0x60, 0xF2, 0xFF, 0xFF
	.byte 0x80, 0x2A, 0x00, 0x00, 0xE8, 0x1D, 0x00, 0x00, 0x2C, 0xC5, 0xFF, 0xFF, 0xA8, 0xF3, 0xFF, 0xFF
	.byte 0x98, 0x3A, 0x00, 0x00, 0x48, 0x1C, 0x00, 0x00, 0xE0, 0xDF, 0xFF, 0xFF, 0x00, 0xEE, 0xFF, 0xFF
	.byte 0xE8, 0x20, 0x00, 0x00, 0xC0, 0x22, 0x00, 0x00, 0x98, 0x3A, 0x00, 0x00, 0x40, 0xF5, 0xFF, 0xFF

ov07_022355B0: ; 0x022355B0
	.byte 0x68, 0x0C, 0x00, 0x00, 0xA8, 0x07, 0x00, 0x00, 0xD8, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xA0, 0x0C, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00, 0x20, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x60, 0x17, 0x00, 0x00, 0xC0, 0x09, 0x00, 0x00, 0x40, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x0A, 0x00, 0x00, 0x80, 0x05, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0xFC, 0xFF, 0xFF, 0x80, 0x01, 0x00, 0x00, 0x20, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x09, 0x00, 0x00, 0xA0, 0x05, 0x00, 0x00, 0xE0, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x60, 0x07, 0x00, 0x00, 0x40, 0x07, 0x00, 0x00, 0xE0, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_02235620: ; 0x02235620
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02235624: ; 0x02235624
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02235628: ; 0x02235628
	.byte 0x00, 0x00, 0x00, 0x00, 0x68, 0x09, 0x00, 0x00
	.byte 0xE0, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xF9, 0xFF, 0xFF, 0x58, 0xFC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x98, 0x07, 0x00, 0x00, 0x50, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x38, 0x02, 0x00, 0x00, 0xD0, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x98, 0x07, 0x00, 0x00
	.byte 0xA0, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x88, 0xF6, 0xFF, 0xFF, 0xD0, 0xFC, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0xF6, 0xFF, 0xFF, 0x00, 0xFC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x98, 0xFC, 0xFF, 0xFF, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x68, 0xFA, 0xFF, 0xFF, 0x78, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD8, 0x05, 0x00, 0x00, 0x08, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD8, 0x05, 0x00, 0x00
	.byte 0xB8, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0xF8, 0xFF, 0xFF, 0xC8, 0xFC, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xA0, 0x02, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0xF8, 0xFF, 0xFF, 0xCC, 0xFB, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_022357D0: ; 0x022357D0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x80, 0x05, 0x00, 0x00
	.byte 0xE0, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0xFB, 0xFF, 0xFF, 0xF0, 0xFC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xF8, 0x07, 0x00, 0x00, 0xA0, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xA0, 0x03, 0x00, 0x00, 0x98, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x06, 0x00, 0x00
	.byte 0x10, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xE8, 0xF8, 0xFF, 0xFF, 0x68, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0xFA, 0xFF, 0xFF, 0x60, 0xFC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x58, 0xFD, 0xFF, 0xFF, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xFB, 0xFF, 0xFF, 0x08, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0xA0, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x04, 0x00, 0x00
	.byte 0x08, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x90, 0xF9, 0xFF, 0xFF, 0x20, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x18, 0x03, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0xFC, 0xFF, 0xFF, 0x60, 0xFC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_02235980: ; 0x02235980
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02235984: ; 0x02235984
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02235988: ; 0x02235988
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x0C, 0x00, 0x00
	.byte 0xB8, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0xF2, 0xFF, 0xFF, 0x48, 0xF8, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xE8, 0x0D, 0x00, 0x00, 0xC8, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x06, 0x00, 0x00, 0x40, 0xFA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x0C, 0x00, 0x00
	.byte 0x10, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x60, 0xF0, 0xFF, 0xFF, 0xF0, 0xFC, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0xF3, 0xFF, 0xFF, 0x30, 0xF7, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0xFB, 0xFF, 0xFF, 0x30, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0xFB, 0xFF, 0xFF, 0xD8, 0x04, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x48, 0x0C, 0x00, 0x00, 0x98, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x08, 0x00, 0x00
	.byte 0x20, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x50, 0xF4, 0xFF, 0xFF, 0x60, 0xFA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x60, 0x07, 0x00, 0x00
	.byte 0xB0, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xF5, 0xFF, 0xFF, 0x70, 0xF5, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_02235B30: ; 0x02235B30
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02235B34: ; 0x02235B34
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02235B38: ; 0x02235B38
	.byte 0x00, 0x00, 0x00, 0x00, 0xE0, 0x09, 0x00, 0x00
	.byte 0x34, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0xEF, 0xFF, 0xFF, 0x40, 0xEC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x58, 0x0F, 0x00, 0x00, 0x58, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC0, 0x02, 0x00, 0x00, 0x60, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE0, 0x0A, 0x00, 0x00
	.byte 0x60, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xC8, 0xEF, 0xFF, 0xFF, 0xE8, 0xF9, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE8, 0xF3, 0xFF, 0xFF, 0x48, 0xF8, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x4C, 0xFD, 0xFF, 0xFF, 0xE8, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE8, 0xFC, 0xFF, 0xFF, 0x68, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x08, 0x0B, 0x00, 0x00, 0x50, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x60, 0x08, 0x00, 0x00
	.byte 0x90, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xA8, 0xF4, 0xFF, 0xFF, 0x08, 0xFA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x68, 0x04, 0x00, 0x00
	.byte 0x68, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x88, 0xF8, 0xFF, 0xFF, 0xE8, 0xF7, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_02235CE0: ; 0x02235CE0
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02235CE4: ; 0x02235CE4
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02235CE8: ; 0x02235CE8
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0x0E, 0x00, 0x00
	.byte 0x40, 0x08, 0x00, 0x00, 0xF8, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x7C, 0xEF, 0xFF, 0xFF, 0x58, 0xF5, 0xFF, 0xFF
	.byte 0xF8, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x62, 0x17, 0x00, 0x00, 0x30, 0x06, 0x00, 0x00, 0xF8, 0x0B, 0x00, 0x00
	.byte 0x10, 0x04, 0x00, 0x00, 0xA8, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x10, 0x00, 0x00
	.byte 0xE8, 0x09, 0x00, 0x00, 0xF8, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xB0, 0xE6, 0xFF, 0xFF, 0x08, 0xF8, 0xFF, 0xFF, 0xF8, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xEE, 0xFF, 0xFF, 0x68, 0xF4, 0xFF, 0xFF
	.byte 0xF8, 0x0B, 0x00, 0x00, 0xC0, 0xFC, 0xFF, 0xFF, 0xE0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0xF8, 0xFF, 0xFF, 0x78, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xC2, 0x0F, 0x00, 0x00, 0x88, 0x0A, 0x00, 0x00, 0xF8, 0x0B, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x14, 0x0C, 0x00, 0x00
	.byte 0xDC, 0x0B, 0x00, 0x00, 0xF8, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x68, 0xED, 0xFF, 0xFF, 0x90, 0xF5, 0xFF, 0xFF, 0xF8, 0x0B, 0x00, 0x00, 0xC0, 0x06, 0x00, 0x00
	.byte 0x70, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x70, 0xF2, 0xFF, 0xFF, 0xD8, 0xED, 0xFF, 0xFF
	.byte 0xF8, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_02235E90: ; 0x02235E90
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02235E94: ; 0x02235E94
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02235E98: ; 0x02235E98
	.byte 0x00, 0x00, 0x00, 0x00, 0xA0, 0x07, 0x00, 0x00
	.byte 0x48, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0xF8, 0xFF, 0xFF, 0x38, 0xFC, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x07, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x03, 0x00, 0x00, 0x40, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x06, 0x00, 0x00
	.byte 0x40, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xD0, 0xF7, 0xFF, 0xFF, 0x18, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0xF7, 0xFF, 0xFF, 0x28, 0xFB, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0xFD, 0xFF, 0xFF, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, 0xFC, 0xFF, 0xFF, 0xA8, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD0, 0x06, 0x00, 0x00, 0x68, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD8, 0x05, 0x00, 0x00
	.byte 0xD8, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x44, 0xF8, 0xFF, 0xFF, 0x38, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x78, 0x02, 0x00, 0x00
	.byte 0x38, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x70, 0xF9, 0xFF, 0xFF, 0x88, 0xF9, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_02236040: ; 0x02236040
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02236044: ; 0x02236044
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02236048: ; 0x02236048
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x06, 0x00, 0x00
	.byte 0xC0, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xF8, 0xFF, 0xFF, 0xB8, 0xF9, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00, 0x40, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xA0, 0x02, 0x00, 0x00, 0xD0, 0xFA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x07, 0x00, 0x00
	.byte 0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x78, 0xF7, 0xFF, 0xFF, 0x00, 0xFA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xF7, 0xFF, 0xFF, 0xA8, 0xF8, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0xB0, 0xFD, 0xFF, 0xFF, 0xE8, 0xFC, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xFA, 0xFF, 0xFF, 0x80, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0xF8, 0x05, 0x00, 0x00, 0x40, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x05, 0x00, 0x00
	.byte 0x28, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0xFA, 0xFF, 0xFF, 0xE8, 0xF9, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x58, 0x03, 0x00, 0x00
	.byte 0x90, 0xFE, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x98, 0xFA, 0xFF, 0xFF, 0x10, 0xF8, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_022361F0: ; 0x022361F0
	.byte 0x00, 0x00, 0x00, 0x00

ov07_022361F4: ; 0x022361F4
	.byte 0x00, 0x00, 0x00, 0x00

ov07_022361F8: ; 0x022361F8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xF2, 0xFF, 0xFF, 0x10, 0xF9, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x13, 0x00, 0x00, 0xF0, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x50, 0xFD, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x0E, 0x00, 0x00
	.byte 0xB0, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x58, 0xEA, 0xFF, 0xFF, 0xC8, 0xF9, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0xF1, 0xFF, 0xFF, 0x48, 0xF7, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x58, 0xF9, 0xFF, 0xFF, 0x08, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x28, 0xF8, 0xFF, 0xFF, 0xC0, 0xFF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0xF8, 0x0F, 0x00, 0x00, 0x30, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x54, 0x0A, 0x00, 0x00
	.byte 0x70, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x38, 0xF1, 0xFF, 0xFF, 0x70, 0xF8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x06, 0x00, 0x00
	.byte 0xF0, 0xFF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x58, 0xF3, 0xFF, 0xFF, 0x48, 0xF5, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_022363A0: ; 0x022363A0
	.word ov07_022217B0
	.word ov07_022217B4
	.word ov07_02221898
	.word ov07_0222189C
	.word ov07_022218A0
	.word ov07_02221968
	.word ov07_022219EC
	.word ov07_02221A6C
	.word ov07_02221AD4
	.word ov07_02221AD8
	.word ov07_02221ADC
	.word ov07_02221AE0
	.word ov07_02221AE4
	.word ov07_02221BF0

ov07_022363D8: ; 0x022363D8
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x00, 0x04, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00
	.byte 0xFE, 0xFE, 0x00, 0x00

ov07_02236414: ; 0x02236414
	.byte 0x00, 0xC2, 0x40, 0x17, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x90, 0xE8, 0x00, 0x00, 0x00, 0xC2, 0x40, 0x17, 0x00, 0x10, 0x00, 0x00, 0x00, 0xD0, 0x00, 0x20
	.byte 0x00, 0x10, 0x00, 0x00, 0x00, 0x20, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x20, 0x24, 0xA0, 0x0E
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02236444: ; 0x02236444
	.word ov07_02221CEC
	.word ov07_02221D10
	.word ov07_02221D4C
	.word ov07_02221D88
	.word ov07_02221DC4
	.word ov07_02221E24
	.word ov07_02221E60
	.word ov07_02221E9C
	.word ov07_02221EC4

ov07_02236468: ; 0x02236468
	.byte 0x40, 0x00

ov07_0223646A: ; 0x0223646A
	.byte 0x70, 0x00, 0xC0, 0x00, 0x30, 0x00
	.byte 0xD8, 0x00, 0x70, 0x00, 0x50, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x00, 0x70, 0x00, 0xC0, 0x00, 0x30, 0x00, 0x28, 0x00, 0x70, 0x00, 0xD8, 0x00, 0x32, 0x00
	.byte 0x50, 0x00, 0x78, 0x00, 0xB0, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_0223649C: ; 0x0223649C
	.word ov07_022231BC
	.word ov07_022274F8
	.word ov07_0222C4C0
	.word ov07_02229BFC
	.word ov07_0222D3BC
	.word ov07_0222D6E0
	.word ov07_0222D974
	.word ov07_0222DD20
	.word ov07_0222E020
	.word ov07_0222E2EC
	.word ov07_02223E08
	.word ov07_0222EA48
	.word ov07_0222F0B0
	.word ov07_0222F378
	.word ov07_0222FB24
	.word ov07_0222FE04
	.word ov07_02230094
	.word ov07_022292E4
	.word ov07_022306D8
	.word ov07_02229E50
	.word ov07_0222A1F0
	.word ov07_0222A58C
	.word ov07_0222A988
	.word ov07_0222ACAC
	.word ov07_0222B320
	.word ov07_02226838
	.word ov07_022269D8
	.word ov07_02226A9C
	.word ov07_02226C4C
	.word ov07_02230D74
	.word ov07_022310E0
	.word ov07_02230F98
	.word ov07_02231468

ov07_02236520: ; 0x02236520
	.word ov07_02223060
	.word ov07_0222308C
	.word ov07_022230DC
	.word ov07_02223128
	.word ov07_02223A94
	.word ov07_02227824
	.word ov07_02227AEC
	.word ov07_02227D1C
	.word ov07_0222BE00
	.word ov07_0222C074
	.word ov07_02223BC0
	.word ov07_0222C780
	.word ov07_0222CA8C
	.word ov07_02228070
	.word ov07_02228174
	.word ov07_02228384
	.word ov07_022284D8
	.word ov07_0222CE10
	.word ov07_0222CEC0
	.word ov07_02228638
	.word ov07_0222D148
	.word ov07_02228750
	.word ov07_02228A50
	.word ov07_0222DB14
	.word ov07_02228C8C
	.word ov07_0222E54C
	.word ov07_02228D64
	.word ov07_02228F88
	.word ov07_022290BC
	.word ov07_0222EB6C
	.word ov07_0222ED7C
	.word ov07_0222E6F4
	.word ov07_0222F848
	.word ov07_02223EB4
	.word ov07_02224008
	.word ov07_02224348
	.word ov07_02223350
	.word ov07_022303A4
	.word ov07_022247F4
	.word ov07_02229220
	.word ov07_022248A0
	.word ov07_02230600
	.word ov07_022245BC
	.word ov07_022308E4
	.word ov07_02223550
	.word ov07_02223864
	.word ov07_02230994
	.word ov07_02230BA0
	.word ov07_02230D1C
	.word ov07_02229630
	.word ov07_02224948
	.word ov07_02224A20
	.word ov07_02224BAC
	.word ov07_02224E58
	.word ov07_02225098
	.word ov07_0222A838
	.word ov07_022251CC
	.word ov07_022252F8
	.word ov07_0222AEA0
	.word ov07_0222B130
	.word ov07_0222548C
	.word ov07_0222554C
	.word ov07_02225768
	.word ov07_02225838
	.word ov07_02225990
	.word ov07_022261B4
	.word ov07_022264E0
	.word ov07_02225CC4
	.word ov07_02225E9C
	.word ov07_02225F94
	.word ov07_0222B640
	.word ov07_0222B988
	.word ov07_02226698
	.word ov07_022262E8
	.word ov07_02226C90
	.word ov07_02226F80
	.word ov07_022272D0
	.word ov07_02225640
	.word ov07_022271DC
	.word ov07_0222BC7C
	.word ov07_02231874
	.word ov07_022318A0
	.word ov07_022318CC
	.word ov07_022318F8

ov07_02236670: ; 0x02236670
	.byte 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x05, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x03, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x00, 0x00, 0xFD, 0xFF, 0xFD, 0xFF, 0xFD, 0xFF, 0xFC, 0xFF, 0xFC, 0xFF
	.byte 0xFC, 0xFF, 0xFB, 0xFF, 0xFB, 0xFF, 0xFB, 0xFF, 0xFB, 0xFF, 0xFB, 0xFF, 0xFB, 0xFF, 0xFB, 0xFF
	.byte 0xFB, 0xFF, 0xFC, 0xFF, 0xFC, 0xFF, 0xFC, 0xFF, 0xFD, 0xFF, 0xFD, 0xFF, 0xFD, 0xFF, 0x00, 0x00
	.byte 0x03, 0x00, 0x03, 0x00, 0x03, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x05, 0x00, 0x05, 0x00
	.byte 0x05, 0x00, 0x05, 0x00, 0xFF, 0x00, 0x00, 0x00

ov07_022366C8: ; 0x022366C8
	.byte 0x02, 0x07, 0x0D, 0x12

ov07_022366CC: ; 0x022366CC
	.byte 0x64

ov07_022366CD: ; 0x022366CD
	.byte 0x73

ov07_022366CE: ; 0x022366CE
	.byte 0x06, 0x73
	.byte 0x64, 0x06

ov07_022366D2: ; 0x022366D2
	.byte 0x08, 0x02, 0x0D, 0x01, 0x12, 0x03

ov07_022366D8: ; 0x022366D8
	.byte 0x00

ov07_022366D9: ; 0x022366D9
	.byte 0x10

ov07_022366DA: ; 0x022366DA
	.byte 0x05, 0x10, 0x00, 0x05, 0x00, 0x00
	.byte 0x05

ov07_022366E1: ; 0x022366E1
	.byte 0x01, 0xFF, 0xFF, 0x01, 0x01, 0xFF, 0x01, 0xFF, 0x01, 0xFF

ov07_022366EB: ; 0x022366EB
	.byte 0x64

ov07_022366EC: ; 0x022366EC
	.byte 0x0A

ov07_022366ED: ; 0x022366ED
	.byte 0x64

ov07_022366EE: ; 0x022366EE
	.byte 0xB4

ov07_022366EF: ; 0x022366EF
	.byte 0x0A
	.byte 0x0A, 0x0A, 0xB4, 0x00, 0x05

ov07_022366F5: ; 0x022366F5
	.byte 0x64

ov07_022366F6: ; 0x022366F6
	.byte 0x78

ov07_022366F7: ; 0x022366F7
	.byte 0x64

ov07_022366F8: ; 0x022366F8
	.byte 0x50

ov07_022366F9: ; 0x022366F9
	.byte 0x05, 0x78, 0x64, 0x50, 0x78, 0x05, 0x64
	.byte 0x64, 0x78, 0x64, 0x05

ov07_02236704: ; 0x02236704
	.byte 0x64

ov07_02236705: ; 0x02236705
	.byte 0x64

ov07_02236706: ; 0x02236706
	.byte 0x64

ov07_02236707: ; 0x02236707
	.byte 0x46

ov07_02236708: ; 0x02236708
	.byte 0x08, 0x64, 0x64, 0x46, 0x78, 0x03, 0x64, 0x64
	.byte 0x78, 0x64, 0x03

ov07_02236713: ; 0x02236713
	.byte 0x64

ov07_02236714: ; 0x02236714
	.byte 0x96

ov07_02236715: ; 0x02236715
	.byte 0x64

ov07_02236716: ; 0x02236716
	.byte 0x32

ov07_02236717: ; 0x02236717
	.byte 0x08, 0x96, 0x32, 0x32, 0x96, 0x08, 0x32, 0x64, 0x96
	.byte 0x64, 0x08

ov07_02236722: ; 0x02236722
	.byte 0x0C, 0x00, 0x0A, 0x00, 0x08, 0x00, 0x06, 0x00, 0x04, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0x00, 0x00

ov07_02236732: ; 0x02236732
	.byte 0x00, 0x00

ov07_02236734: ; 0x02236734
	.byte 0x20, 0x00

ov07_02236736: ; 0x02236736
	.byte 0x07, 0x00, 0x00, 0x00, 0x20, 0x00, 0x0A, 0x00, 0x20, 0x00
	.byte 0x00, 0x00, 0x07, 0x00, 0x20, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00

ov07_0223674C: ; 0x0223674C
	.byte 0x38, 0x0E, 0x00, 0x00

ov07_02236750: ; 0x02236750
	.byte 0x03, 0x00, 0x00, 0x00, 0xAA, 0x0A, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x1C, 0x07, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x8E, 0x03, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00

ov07_02236774: ; 0x02236774
	.byte 0x05, 0x05, 0x05, 0x03

ov07_02236778: ; 0x02236778
	.byte 0x14, 0x02, 0x0D, 0x01, 0x12, 0x03

ov07_0223677E: ; 0x0223677E
	.byte 0x00, 0x00

ov07_02236780: ; 0x02236780
	.byte 0x00, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0xAA, 0x00, 0x80, 0x00
	.byte 0xAA, 0x00, 0x00, 0x01, 0xAA, 0x00

ov07_02236796: ; 0x02236796
	.byte 0x50, 0x00, 0x32, 0x00, 0xB4, 0x00, 0x32, 0x00, 0x50, 0x00
	.byte 0x64, 0x00, 0xB4, 0x00, 0x64, 0x00, 0x50, 0x00, 0x4B, 0x00, 0xB4, 0x00, 0x4B, 0x00

ov07_022367AE: ; 0x022367AE
	.byte 0x78, 0x00

ov07_022367B0: ; 0x022367B0
	.byte 0x50, 0x00

ov07_022367B2: ; 0x022367B2
	.byte 0x88, 0x00

ov07_022367B4: ; 0x022367B4
	.byte 0x50, 0x00, 0x78, 0x00, 0x50, 0x00, 0x88, 0x00, 0x50, 0x00, 0x78, 0x00
	.byte 0x50, 0x00, 0x88, 0x00, 0x50, 0x00, 0x58, 0x00, 0x50, 0x00, 0xA8, 0x00, 0x50, 0x00

ov07_022367CE: ; 0x022367CE
	.byte 0x1E, 0x00
	.byte 0x28, 0x00, 0x32, 0x00, 0x35, 0x00, 0x1E, 0x00, 0x5D, 0x00, 0x32, 0x00, 0x35, 0x00, 0x1E, 0x00
	.byte 0x92, 0x00, 0x32, 0x00, 0x35, 0x00, 0x50, 0x00, 0x28, 0x00, 0x32, 0x00, 0x35, 0x00, 0x50, 0x00
	.byte 0x5D, 0x00, 0x32, 0x00, 0x35, 0x00, 0x50, 0x00, 0x92, 0x00, 0x32, 0x00, 0x35, 0x00, 0x00, 0x00

ov07_02236800: ; 0x02236800
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00

ov07_0223680C: ; 0x0223680C
	.byte 0x36, 0x00, 0x00, 0x00

ov07_02236810: ; 0x02236810
	.byte 0x26, 0x01, 0x00, 0x00

ov07_02236814: ; 0x02236814
	.byte 0x37, 0x00, 0x00, 0x00, 0x37, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00
	.byte 0x23, 0x01, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x32, 0x00, 0x00, 0x00
	.byte 0x24, 0x01, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00
	.byte 0x25, 0x01, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00
	.byte 0x00, 0x4D, 0x00, 0x00, 0x00, 0xF0, 0xFF, 0xFF

ov07_02236858: ; 0x02236858
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02236864: ; 0x02236864
	.byte 0x40, 0x00, 0x70, 0x00, 0xC0, 0x00, 0x30, 0x00, 0x28, 0x00, 0x70, 0x00
	.byte 0xD8, 0x00, 0x32, 0x00, 0x50, 0x00, 0x78, 0x00, 0xB0, 0x00, 0x2A, 0x00

ov07_0223687C: ; 0x0223687C
	.byte 0x70, 0xDA, 0xFF, 0xFF
	.byte 0xA8, 0xEA, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x00, 0xD8, 0xFF, 0xFF, 0x00, 0xE7, 0xFF, 0xFF
	.byte 0x40, 0x00, 0x00, 0x00, 0x80, 0xF0, 0xFF, 0xFF, 0x00, 0xF3, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00
	.byte 0x58, 0xE6, 0xFF, 0xFF, 0x60, 0xF0, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x80, 0xF0, 0xFF, 0xFF
	.byte 0x00, 0xF3, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0xC0, 0xE5, 0xFF, 0xFF, 0x60, 0xE9, 0xFF, 0xFF
	.byte 0x40, 0x00, 0x00, 0x00, 0x48, 0xDE, 0xFF, 0xFF, 0xE8, 0xE4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x48, 0xDE, 0xFF, 0xFF, 0xE8, 0xE4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCF, 0xFF, 0xFF
	.byte 0x00, 0xF1, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xCF, 0xFF, 0xFF, 0x00, 0xF1, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x60, 0xDA, 0xFF, 0xFF, 0x20, 0xE9, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x60, 0xDA, 0xFF, 0xFF, 0x20, 0xE9, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xD0, 0xEF, 0xFF, 0xFF
	.byte 0xB0, 0xEB, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xD0, 0xEF, 0xFF, 0xFF, 0xB0, 0xEB, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0xCF, 0xFF, 0xFF, 0x40, 0xEF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0xCF, 0xFF, 0xFF, 0x40, 0xEF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF9, 0xFF, 0xFF
	.byte 0x80, 0xEF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF9, 0xFF, 0xFF, 0x80, 0xEF, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0xDF, 0xFF, 0xFF, 0xC0, 0xEF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0xDF, 0xFF, 0xFF, 0xC0, 0xEF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x78, 0x23, 0x00, 0x00
	.byte 0xA0, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x78, 0x23, 0x00, 0x00, 0xA0, 0x15, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x98, 0xE7, 0xFF, 0xFF, 0x80, 0xF4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x98, 0xE7, 0xFF, 0xFF, 0x80, 0xF4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x30, 0x2B, 0x00, 0x00
	.byte 0x30, 0x11, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0x00, 0x28, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00
	.byte 0x80, 0xEB, 0xFF, 0xFF, 0x80, 0x24, 0x00, 0x00, 0x80, 0x08, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF
	.byte 0x60, 0x22, 0x00, 0x00, 0x40, 0x19, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0x80, 0x24, 0x00, 0x00
	.byte 0x80, 0x08, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0xC0, 0x38, 0x00, 0x00, 0x60, 0x1F, 0x00, 0x00
	.byte 0x80, 0xEB, 0xFF, 0xFF, 0x68, 0x32, 0x00, 0x00, 0xF4, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x68, 0x32, 0x00, 0x00, 0xF4, 0x13, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x15, 0x00, 0x00
	.byte 0x18, 0x1A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x38, 0x15, 0x00, 0x00, 0x18, 0x1A, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x58, 0x33, 0x00, 0x00, 0x08, 0x2C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x58, 0x33, 0x00, 0x00, 0x08, 0x2C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x40, 0x00, 0x00
	.byte 0x30, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x40, 0x00, 0x00, 0x30, 0x14, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x33, 0x00, 0x00, 0xC0, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x33, 0x00, 0x00, 0xC0, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00
	.byte 0x00, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x42, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x2A, 0x00, 0x00, 0x80, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x2A, 0x00, 0x00, 0x80, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE8, 0xE4, 0xFF, 0xFF
	.byte 0x20, 0xED, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE8, 0xE4, 0xFF, 0xFF, 0x20, 0xED, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x58, 0x20, 0x00, 0x00, 0x38, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x58, 0x20, 0x00, 0x00, 0x38, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA8, 0xC5, 0xFF, 0xFF
	.byte 0x58, 0xEC, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x00, 0xC4, 0xFF, 0xFF, 0x80, 0xE7, 0xFF, 0xFF
	.byte 0x40, 0x00, 0x00, 0x00, 0x80, 0xD9, 0xFF, 0xFF, 0x80, 0xF3, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00
	.byte 0x78, 0xD3, 0xFF, 0xFF, 0x80, 0xF4, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x80, 0xD9, 0xFF, 0xFF
	.byte 0x80, 0xF3, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x80, 0xD9, 0xFF, 0xFF, 0x80, 0xF3, 0xFF, 0xFF
	.byte 0x40, 0x00, 0x00, 0x00, 0x10, 0xDB, 0xFF, 0xFF, 0xE0, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0xDB, 0xFF, 0xFF, 0xE0, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x40, 0xBA, 0xFF, 0xFF
	.byte 0xD8, 0xF1, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x40, 0xBA, 0xFF, 0xFF, 0xD8, 0xF1, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0xD0, 0xCE, 0xFF, 0xFF, 0x60, 0xF4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xD0, 0xCE, 0xFF, 0xFF, 0x60, 0xF4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x22, 0xE7, 0xFF, 0xFF
	.byte 0x40, 0xF1, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x22, 0xE7, 0xFF, 0xFF, 0x40, 0xF1, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0xC0, 0xC5, 0xFF, 0xFF, 0x80, 0xF7, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xC0, 0xC5, 0xFF, 0xFF, 0x80, 0xF7, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x40, 0xE8, 0xFF, 0xFF
	.byte 0x80, 0xEA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x40, 0xE8, 0xFF, 0xFF, 0x80, 0xEA, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xD1, 0xFF, 0xFF, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xD1, 0xFF, 0xFF, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x48, 0x2A, 0x00, 0x00
	.byte 0x40, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x48, 0x2A, 0x00, 0x00, 0x40, 0x1D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0xD9, 0xFF, 0xFF, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0xD9, 0xFF, 0xFF, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x1C, 0x00, 0x00
	.byte 0x48, 0x17, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0x00, 0x35, 0x00, 0x00, 0x80, 0x0B, 0x00, 0x00
	.byte 0x80, 0xEB, 0xFF, 0xFF, 0x00, 0x35, 0x00, 0x00, 0x80, 0x0B, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF
	.byte 0x70, 0x31, 0x00, 0x00, 0x68, 0x16, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0x00, 0x35, 0x00, 0x00
	.byte 0x80, 0x0B, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0x00, 0x35, 0x00, 0x00, 0x80, 0x0B, 0x00, 0x00
	.byte 0x80, 0xEB, 0xFF, 0xFF, 0x40, 0x46, 0x00, 0x00, 0xC0, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x46, 0x00, 0x00, 0xC0, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0x1F, 0x00, 0x00
	.byte 0x78, 0x17, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x58, 0x1F, 0x00, 0x00, 0x78, 0x17, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x33, 0x00, 0x00, 0x40, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x33, 0x00, 0x00, 0x40, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00
	.byte 0x40, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x00, 0x00, 0x40, 0x14, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0xC0, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x3F, 0x00, 0x00, 0xC0, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x50, 0x00, 0x00
	.byte 0x98, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0x50, 0x00, 0x00, 0x98, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x34, 0x00, 0x00, 0x20, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x34, 0x00, 0x00, 0x20, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xDA, 0xFF, 0xFF
	.byte 0xD0, 0xF3, 0xFF, 0xFF, 0xA8, 0x0A, 0x00, 0x00, 0xC0, 0xDA, 0xFF, 0xFF, 0xD0, 0xF3, 0xFF, 0xFF
	.byte 0xA8, 0x0A, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x35, 0x00, 0x00, 0x80, 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0xEB, 0xFF, 0xFF
	.byte 0x58, 0xE6, 0xFF, 0xFF, 0x00, 0xFC, 0xFF, 0xFF, 0x80, 0xE2, 0xFF, 0xFF, 0x00, 0xE5, 0xFF, 0xFF
	.byte 0x00, 0xFC, 0xFF, 0xFF, 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0xEA, 0xFF, 0xFF, 0x00, 0xFC, 0xFF, 0xFF
	.byte 0x58, 0xF4, 0xFF, 0xFF, 0x68, 0xEB, 0xFF, 0xFF, 0x00, 0xFC, 0xFF, 0xFF, 0xFC, 0xF6, 0xFF, 0xFF
	.byte 0x00, 0xEA, 0xFF, 0xFF, 0x00, 0xFC, 0xFF, 0xFF, 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0xEA, 0xFF, 0xFF
	.byte 0x00, 0xFC, 0xFF, 0xFF, 0x50, 0xF6, 0xFF, 0xFF, 0x40, 0xEA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x50, 0xF6, 0xFF, 0xFF, 0x40, 0xEA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xDF, 0xFF, 0xFF
	.byte 0x58, 0xED, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xDF, 0xFF, 0xFF, 0x58, 0xED, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0xEA, 0xFF, 0xFF, 0xB0, 0xE6, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0xEA, 0xFF, 0xFF, 0xB0, 0xE6, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x88, 0xFD, 0xFF, 0xFF
	.byte 0xC8, 0xEB, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x88, 0xFD, 0xFF, 0xFF, 0xC8, 0xEB, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xDF, 0xFF, 0xFF, 0x40, 0xDF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xDF, 0xFF, 0xFF, 0x40, 0xDF, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x80, 0xE6, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x80, 0xE6, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0xE5, 0xFF, 0xFF, 0x00, 0xE8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0xE5, 0xFF, 0xFF, 0x00, 0xE8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x20, 0x14, 0x00, 0x00
	.byte 0x40, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x14, 0x00, 0x00, 0x40, 0x1D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0xEA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0xEA, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x50, 0x3B, 0x00, 0x00
	.byte 0x48, 0x11, 0x00, 0x00, 0x50, 0xE3, 0xFF, 0xFF, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x50, 0xE3, 0xFF, 0xFF, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x50, 0xE3, 0xFF, 0xFF
	.byte 0xF8, 0x1A, 0x00, 0x00, 0x48, 0x20, 0x00, 0x00, 0x50, 0xE3, 0xFF, 0xFF, 0x00, 0x1B, 0x00, 0x00
	.byte 0x00, 0x10, 0x00, 0x00, 0x50, 0xE3, 0xFF, 0xFF, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00
	.byte 0x50, 0xE3, 0xFF, 0xFF, 0x10, 0x32, 0x00, 0x00, 0xE0, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x32, 0x00, 0x00, 0xE0, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD8, 0x07, 0x00, 0x00
	.byte 0x58, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xD8, 0x07, 0x00, 0x00, 0x58, 0x12, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x58, 0x1F, 0x00, 0x00, 0xA8, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x58, 0x1F, 0x00, 0x00, 0xA8, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x2E, 0x00, 0x00
	.byte 0x08, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x2E, 0x00, 0x00, 0x08, 0x18, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x27, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x36, 0x00, 0x00
	.byte 0x98, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x36, 0x00, 0x00, 0x98, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0x18, 0x00, 0x00, 0x40, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0x18, 0x00, 0x00, 0x40, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xEA, 0xFF, 0xFF
	.byte 0x90, 0xE8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xE0, 0xEA, 0xFF, 0xFF, 0x90, 0xE8, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x1B, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC8, 0x1C, 0x00, 0x00
	.byte 0x58, 0xEC, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xE7, 0xFF, 0xFF
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00
	.byte 0x70, 0x31, 0x00, 0x00, 0x80, 0xF4, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00
	.byte 0x80, 0xF3, 0xFF, 0xFF, 0x40, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x90, 0x1D, 0x00, 0x00
	.byte 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x90, 0x1D, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00
	.byte 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00
	.byte 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xDA, 0xFF, 0xFF
	.byte 0x40, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xC0, 0xDA, 0xFF, 0xFF, 0x40, 0x1D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x00, 0x80, 0xF3, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x35, 0x00, 0x00, 0x80, 0xF4, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x0C, 0xEB, 0xFF, 0xFF
	.byte 0x48, 0x11, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0x80, 0xE2, 0xFF, 0xFF, 0x00, 0x10, 0x00, 0x00
	.byte 0x80, 0xEB, 0xFF, 0xFF, 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0x10, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF
	.byte 0x58, 0xF4, 0xFF, 0xFF, 0x48, 0x20, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0xFC, 0xF6, 0xFF, 0xFF
	.byte 0x00, 0x10, 0x00, 0x00, 0x80, 0xEB, 0xFF, 0xFF, 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0x10, 0x00, 0x00
	.byte 0x80, 0xEB, 0xFF, 0xFF, 0x50, 0xF6, 0xFF, 0xFF, 0xE0, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x50, 0xF6, 0xFF, 0xFF, 0xE0, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xDF, 0xFF, 0xFF
	.byte 0x58, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0xDF, 0xFF, 0xFF, 0x58, 0x12, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x20, 0xEA, 0xFF, 0xFF, 0xA8, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0xEA, 0xFF, 0xFF, 0xA8, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0xFD, 0xFF, 0xFF
	.byte 0x08, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0xFD, 0xFF, 0xFF, 0x08, 0x18, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0xDF, 0xFF, 0xFF, 0x00, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0xDF, 0xFF, 0xFF, 0x00, 0x25, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00
	.byte 0x98, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x98, 0x0D, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x40, 0xE5, 0xFF, 0xFF, 0x40, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x40, 0xE5, 0xFF, 0xFF, 0x40, 0x15, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x14, 0x00, 0x00
	.byte 0x90, 0xE8, 0xFF, 0xFF, 0xA8, 0x0A, 0x00, 0x00, 0x20, 0x14, 0x00, 0x00, 0xE0, 0xEA, 0xFF, 0xFF
	.byte 0xA8, 0x0A, 0x00, 0x00, 0xFC, 0xF6, 0xFF, 0xFF, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x58, 0xF4, 0xFF, 0xFF, 0x48, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_0223717C: ; 0x0223717C
	.byte 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

ov07_02237188: ; 0x02237188
	.byte 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00

ov07_022371A0: ; 0x022371A0
	.word ov07_022335B4
	.word ov07_02233874
	.word ov07_02233C98
	.word ov07_022335A0
	.word ov07_02233D24
	.word ov07_02233B04

ov07_022371B8: ; 0x022371B8
	.word ov07_02232E18
	.word ov07_02232E40
	.word ov07_02232E68
	.word ov07_02232E90
	.word ov07_02232EB8
	.word ov07_02232EE0
	.word ov07_02232F08
	.word ov07_02232F30
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00

ov07_02237200: ; 0x02237200
	.byte 0x01, 0x00, 0x00, 0x00, 0xE6, 0x05, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0xE6, 0x05, 0x00, 0x00
	.byte 0x0E, 0x00, 0x00, 0x00, 0xE7, 0x05, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0xE8, 0x05, 0x00, 0x00
	.byte 0x14, 0x00, 0x00, 0x00, 0xE9, 0x05, 0x00, 0x00

ov07_02237228: ; 0x02237228
	.byte 0x06, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x0C, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x11, 0x00, 0x00, 0x00

ov07_02237254: ; 0x02237254
	.byte 0xFE, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0xFE, 0xFF
	.byte 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFF, 0xFF
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFF, 0x00

ov07_0223729C: ; 0x0223729C
	.word ov07_02232F80
	.word ov07_02232F84
	.word ov07_02232F9C
	.word ov07_02232FA8
	.word ov07_02233088
	.word ov07_0223308C
	.word ov07_022330E0
	.word ov07_022330E4
	.word ov07_022330F0
	.word ov07_022330FC
	.word ov07_022331A4
	.word ov07_022331B0
	.word ov07_02233224
	.word ov07_02233228
	.word ov07_022332C4
	.word ov07_022332C8
	.word ov07_022332E8
	.word ov07_022332F4
	.word ov07_0223338C
	.word ov07_02233390
	.word ov07_0223339C
	.word ov07_022333A8
	.word ov07_02233498
	.word ov07_0223349C
	.word ov07_02233500
	.word ov07_0223350C
	.word ov07_02233590
	.word ov07_0223359C

ov07_0223730C:
	.byte 0x00, 0x00

ov07_0223730E: ; 0x0223730E
	.byte 0xF9, 0xFF

ov07_02237310: ; 0x02237310
	.byte 0x01, 0x00, 0x01, 0x00, 0xFB, 0xFF, 0x00, 0x00, 0x00, 0x00, 0xFD, 0xFF, 0x00, 0x00, 0x01, 0x00
	.byte 0xFE, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x00, 0xFB, 0xFF
	.byte 0x01, 0x00, 0x00, 0x00, 0xFD, 0xFF, 0x00, 0x00, 0x01, 0x00, 0xFE, 0xFF, 0x00, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0xFE, 0xFF, 0x00, 0x00, 0x01, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0x01, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0xFF, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00

ov07_0223738C: ; 0x0223738C
	.byte 0x01, 0x00, 0x00, 0x00

ov07_02237390: ; 0x02237390
	.byte 0x05, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x11, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x12, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x13, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x15, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x17, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x19, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x34, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov07_0223746C: ; 0x0223746C
	.byte 0x1B, 0x00, 0x00, 0x00

ov07_02237470: ; 0x02237470
	.byte 0x00, 0x00, 0x00, 0x00

ov07_02237474: ; 0x02237474
	.byte 0x05, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x1D, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x21, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x22, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x24, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x25, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x26, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x27, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x29, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x2A, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x2C, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x2D, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x2E, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x2F, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x31, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x32, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x05, 0x00, 0x00, 0x00, 0x1B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00
	.byte 0x34, 0x00, 0x00, 0x00, 0xFF, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

ov07_022375BC: ; 0x022375BC
	.byte 0x05, 0x01, 0x00, 0x00
	.byte 0x53, 0x00, 0x00, 0x00, 0x04, 0x01, 0x00, 0x00, 0x03, 0x01, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00
	.byte 0x54, 0x00, 0x00, 0x00, 0x07, 0x01, 0x00, 0x00, 0x06, 0x01, 0x00, 0x00, 0x0B, 0x01, 0x00, 0x00
	.byte 0x55, 0x00, 0x00, 0x00, 0x0A, 0x01, 0x00, 0x00, 0x09, 0x01, 0x00, 0x00, 0x0E, 0x01, 0x00, 0x00
	.byte 0x56, 0x00, 0x00, 0x00, 0x0D, 0x01, 0x00, 0x00, 0x0C, 0x01, 0x00, 0x00, 0x11, 0x01, 0x00, 0x00
	.byte 0x57, 0x00, 0x00, 0x00, 0x10, 0x01, 0x00, 0x00, 0x0F, 0x01, 0x00, 0x00, 0x14, 0x01, 0x00, 0x00
	.byte 0x58, 0x00, 0x00, 0x00, 0x13, 0x01, 0x00, 0x00, 0x12, 0x01, 0x00, 0x00, 0x17, 0x01, 0x00, 0x00
	.byte 0x59, 0x00, 0x00, 0x00, 0x16, 0x01, 0x00, 0x00, 0x15, 0x01, 0x00, 0x00, 0x1A, 0x01, 0x00, 0x00
	.byte 0x5A, 0x00, 0x00, 0x00, 0x19, 0x01, 0x00, 0x00, 0x18, 0x01, 0x00, 0x00, 0x1D, 0x01, 0x00, 0x00
	.byte 0x5B, 0x00, 0x00, 0x00, 0x1C, 0x01, 0x00, 0x00, 0x1B, 0x01, 0x00, 0x00, 0x20, 0x01, 0x00, 0x00
	.byte 0x5C, 0x00, 0x00, 0x00, 0x1F, 0x01, 0x00, 0x00, 0x1E, 0x01, 0x00, 0x00, 0x23, 0x01, 0x00, 0x00
	.byte 0x5D, 0x00, 0x00, 0x00, 0x22, 0x01, 0x00, 0x00, 0x21, 0x01, 0x00, 0x00, 0x26, 0x01, 0x00, 0x00
	.byte 0x5E, 0x00, 0x00, 0x00, 0x25, 0x01, 0x00, 0x00, 0x24, 0x01, 0x00, 0x00, 0x29, 0x01, 0x00, 0x00
	.byte 0x5F, 0x00, 0x00, 0x00, 0x28, 0x01, 0x00, 0x00, 0x27, 0x01, 0x00, 0x00, 0x2C, 0x01, 0x00, 0x00
	.byte 0x60, 0x00, 0x00, 0x00, 0x2B, 0x01, 0x00, 0x00, 0x2A, 0x01, 0x00, 0x00, 0x2F, 0x01, 0x00, 0x00
	.byte 0x61, 0x00, 0x00, 0x00, 0x2E, 0x01, 0x00, 0x00, 0x2D, 0x01, 0x00, 0x00, 0x32, 0x01, 0x00, 0x00
	.byte 0x62, 0x00, 0x00, 0x00, 0x31, 0x01, 0x00, 0x00, 0x30, 0x01, 0x00, 0x00, 0x35, 0x01, 0x00, 0x00
	.byte 0x63, 0x00, 0x00, 0x00, 0x34, 0x01, 0x00, 0x00, 0x33, 0x01, 0x00, 0x00, 0x38, 0x01, 0x00, 0x00
	.byte 0x64, 0x00, 0x00, 0x00, 0x37, 0x01, 0x00, 0x00, 0x36, 0x01, 0x00, 0x00, 0x3B, 0x01, 0x00, 0x00
	.byte 0x65, 0x00, 0x00, 0x00, 0x3A, 0x01, 0x00, 0x00, 0x39, 0x01, 0x00, 0x00, 0x3E, 0x01, 0x00, 0x00
	.byte 0x66, 0x00, 0x00, 0x00, 0x3D, 0x01, 0x00, 0x00, 0x3C, 0x01, 0x00, 0x00, 0x41, 0x01, 0x00, 0x00
	.byte 0x67, 0x00, 0x00, 0x00, 0x40, 0x01, 0x00, 0x00, 0x3F, 0x01, 0x00, 0x00, 0x44, 0x01, 0x00, 0x00
	.byte 0x68, 0x00, 0x00, 0x00, 0x43, 0x01, 0x00, 0x00, 0x42, 0x01, 0x00, 0x00, 0x47, 0x01, 0x00, 0x00
	.byte 0x69, 0x00, 0x00, 0x00, 0x46, 0x01, 0x00, 0x00, 0x45, 0x01, 0x00, 0x00, 0x4A, 0x01, 0x00, 0x00
	.byte 0x6A, 0x00, 0x00, 0x00, 0x49, 0x01, 0x00, 0x00, 0x48, 0x01, 0x00, 0x00, 0x4D, 0x01, 0x00, 0x00
	.byte 0x6B, 0x00, 0x00, 0x00, 0x4C, 0x01, 0x00, 0x00, 0x4B, 0x01, 0x00, 0x00, 0x50, 0x01, 0x00, 0x00
	.byte 0x6C, 0x00, 0x00, 0x00, 0x4F, 0x01, 0x00, 0x00, 0x4E, 0x01, 0x00, 0x00, 0x53, 0x01, 0x00, 0x00
	.byte 0x6D, 0x00, 0x00, 0x00, 0x52, 0x01, 0x00, 0x00, 0x51, 0x01, 0x00, 0x00, 0x53, 0x01, 0x00, 0x00
	.byte 0x6D, 0x00, 0x00, 0x00, 0x52, 0x01, 0x00, 0x00, 0x51, 0x01, 0x00, 0x00

ov07_0223777C: ; 0x0223777C
	.byte 0x00, 0x08, 0x0E, 0x14
	.byte 0x14, 0x10, 0x10, 0x00

ov07_02237784: ; 0x02237784
	.byte 0x05, 0x00, 0x00, 0x00, 0x0B, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00
	.byte 0x07, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00

	.public ov07_022377DC
ov07_022377DC: ; 0x022377DC
	.byte 0x40, 0x00, 0x20, 0x00
	.byte 0xC0, 0x00, 0xE0, 0x00, 0x28, 0x00, 0x20, 0x00, 0xD8, 0x00, 0xE0, 0x00, 0x50, 0x00, 0x20, 0x00
	.byte 0xB0, 0x00, 0xE0, 0x00

	.public ov07_022377F4
ov07_022377F4: ; 0x022377F4
	.short 0x0150, 0x0070, 0xFE00
	.short 0xFFB0, 0x0032, 0xFD80
	.short 0x013C, 0x0070, 0xFE00
	.short 0xFFC4, 0x0032, 0xFF9C
	.short 0x0164, 0x0078, 0x0000
	.short 0xFF9C, 0x002A, 0xFD80
	.short 0xFFB0, 0x0070, 0xFE00
	.short 0x0150, 0x0032, 0xFD80
	.short 0xFFB0, 0x0070, 0xFE00
	.short 0x0150, 0x0032, 0xFD80
	.short 0xFFB0, 0x0070, 0xFE00
	.short 0x0150, 0x0032, 0xFD80

	.data

_02237840:
	.ascii " HaikeiSubSystem"
	.byte 0x83, 0x52, 0x83, 0x7D, 0x83, 0x93, 0x83, 0x68, 0x93, 0xAF, 0x8E, 0x9E, 0x8B, 0x4E, 0x93, 0xAE
	.byte 0x90, 0x94, 0x82, 0xCC, 0x8C, 0xC0, 0x8A, 0x45, 0x82, 0xC5, 0x82, 0xB7, 0x81, 0x42, 0x20, 0x00

ov07_02237870: ; 0x02237870
	.byte 0x42, 0x47, 0x83, 0x70, 0x83, 0x8C, 0x83, 0x62, 0x83, 0x67, 0x83, 0x41, 0x83, 0x6A, 0x83, 0x81
	.byte 0x82, 0xAA, 0x90, 0xDD, 0x92, 0xE8, 0x82, 0xB3, 0x82, 0xEA, 0x82, 0xC4, 0x82, 0xA2, 0x82, 0xC8
	.byte 0x82, 0xA2, 0x42, 0x47, 0x82, 0xC5, 0x82, 0xB7, 0x81, 0x42, 0x00, 0x00

ov07_0223789C: ; 0x0223789C
	.byte 0x65, 0x78, 0x5F, 0x66
	.byte 0x6C, 0x61, 0x67, 0x82, 0xAA, 0x95, 0x73, 0x90, 0xB3, 0x82, 0xC5, 0x82, 0xB7, 0x81, 0x42, 0x00

ov07_022378B0: ; 0x022378B0
	.byte 0x14, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x0A, 0x00, 0x00, 0x00, 0x14, 0x00, 0x00, 0x00
_022378C0:
	; 0x022378C0
