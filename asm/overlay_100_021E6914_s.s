	.include "asm/macros.inc"
	.include "overlay_100.inc"
	.include "global.inc"

    .extern ov100_021E6C4C
    .extern ov100_021E6CF4

	.text

	thumb_func_start ov100_021E6C4C
ov100_021E6C4C: ; 0x021E6C4C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r1, [sp, #4]
	ldr r1, _021E6CF0 ; =ov100_021E764C
	str r0, [sp]
	ldrb r2, [r1]
	add r0, sp, #0xc
	strb r2, [r0]
	ldrb r2, [r1, #1]
	strb r2, [r0, #1]
	ldrb r2, [r1, #2]
	ldrb r1, [r1, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldr r0, [sp]
	ldr r2, [sp]
	ldr r1, [sp]
	ldrh r0, [r0, #0xc]
	ldr r2, [r2]
	add r1, #0x14
	bl G2dRenderer_Init
	ldr r1, [sp]
	mov r6, #0x15
	str r0, [r1, #0x10]
	add r0, r1, #0
	ldrh r1, [r0, #0xa]
	add r0, sp, #0xc
	ldr r5, [sp]
	strb r1, [r0, #1]
	mov r0, #0
	str r0, [sp, #8]
	add r7, sp, #0xc
	add r4, r0, #0
	lsl r6, r6, #4
_021E6C92:
	ldr r2, [sp]
	ldrb r0, [r7]
	ldr r1, [sp, #8]
	ldr r2, [r2]
	bl Create2DGfxResObjMan
	mov r1, #5
	lsl r1, r1, #6
	str r0, [r5, r1]
	ldr r1, [sp]
	ldrb r0, [r7]
	ldr r1, [r1]
	bl Create2DGfxResObjList
	mov r1, #0x15
	lsl r1, r1, #4
	str r0, [r5, r1]
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r3, [r5, r0]
	mov r1, #0
	ldr r0, [r3, #4]
	cmp r0, #0
	bls _021E6CD4
	add r2, r1, #0
_021E6CC4:
	ldr r0, [r3]
	add r1, r1, #1
	str r4, [r0, r2]
	ldr r3, [r5, r6]
	add r2, r2, #4
	ldr r0, [r3, #4]
	cmp r1, r0
	blo _021E6CC4
_021E6CD4:
	ldr r0, [sp, #8]
	add r7, r7, #1
	add r0, r0, #1
	add r5, r5, #4
	str r0, [sp, #8]
	cmp r0, #4
	blo _021E6C92
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl ov100_021E6D34
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6CF0: .word ov100_021E764C
	thumb_func_end ov100_021E6C4C

	thumb_func_start ov100_021E6CF4
ov100_021E6CF4: ; 0x021E6CF4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	bl SpriteList_Delete
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	bl sub_0200AED4
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl sub_0200B0CC
	mov r7, #0x15
	lsl r7, r7, #4
	add r6, r7, #0
	mov r4, #0
	sub r6, #0x10
_021E6D1C:
	ldr r0, [r5, r7]
	bl Delete2DGfxResObjList
	ldr r0, [r5, r6]
	bl Destroy2DGfxResObjMan
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #4
	blo _021E6D1C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6CF4

	thumb_func_start ov100_021E6D34
ov100_021E6D34: ; 0x021E6D34
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r7, r0, #0
	mov r0, #0x15
	str r1, [sp, #0x10]
	lsl r0, r0, #4
	ldr r4, [r7, r0]
	mov r1, #0xe
	lsl r1, r1, #0xc
	str r1, [sp]
	ldrh r1, [r7, #0xe]
	sub r0, #0x10
	mov r3, #0
	str r1, [sp, #4]
	ldr r1, [r7]
	str r1, [sp, #8]
	ldr r2, [sp, #0x10]
	ldr r0, [r7, r0]
	mov r1, #0x8f
	add r2, r2, #6
	bl AddCharResObjFromNarc
	ldr r1, [r4]
	str r0, [r1]
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E6D70
	bl GF_AssertFail
_021E6D70:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _021E6D94
	cmp r0, #1
	beq _021E6D80
	cmp r0, #2
	beq _021E6D8A
	b _021E6D94
_021E6D80:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200ADA4
	b _021E6D9C
_021E6D8A:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200AE18
	b _021E6D9C
_021E6D94:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200ACF0
_021E6D9C:
	mov r4, #0
	add r5, r7, #0
_021E6DA0:
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	mov r0, #0xe
	lsl r0, r0, #0xc
	str r0, [sp]
	add r0, r4, #2
	str r0, [sp, #4]
	ldr r0, [r7]
	add r2, r4, #0
	str r0, [sp, #8]
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0x8f
	add r2, #0xc
	mov r3, #0
	bl AddCellOrAnimResObjFromNarc
	ldr r1, [r6]
	str r0, [r1]
	ldr r0, [r6]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E6DD6
	bl GF_AssertFail
_021E6DD6:
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _021E6DA0
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r4, [r7, r0]
	mov r1, #0xe
	lsl r1, r1, #0xc
	str r1, [sp]
	ldrh r1, [r7, #0xe]
	sub r0, #0x10
	mov r3, #0
	str r1, [sp, #4]
	mov r1, #4
	str r1, [sp, #8]
	ldr r1, [r7]
	str r1, [sp, #0xc]
	ldr r0, [r7, r0]
	ldr r2, [sp, #0x10]
	mov r1, #0x8f
	bl AddPlttResObjFromNarc
	ldr r1, [r4]
	str r0, [r1]
	ldr r0, [r4]
	ldr r0, [r0]
	cmp r0, #0
	bne _021E6E14
	bl GF_AssertFail
_021E6E14:
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_0200B00C
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov100_021E6D34

	thumb_func_start ov100_021E6E20
ov100_021E6E20: ; 0x021E6E20
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r0, #0
	add r0, r7, #0
	mov r1, #0xc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0x28
	add r5, r6, #0
	mul r5, r0
	add r0, r7, #0
	add r1, r5, #0
	strh r6, [r4]
	bl AllocFromHeap
	mov r1, #0
	add r2, r5, #0
	str r0, [r4, #8]
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6E20

	thumb_func_start ov100_021E6E58
ov100_021E6E58: ; 0x021E6E58
	push {r4, lr}
	add r4, r0, #0
	ldrh r3, [r4]
	mov r2, #0x28
	ldr r0, [r4, #8]
	mov r1, #0
	mul r2, r3
	bl MI_CpuFill8
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6E58

	thumb_func_start ov100_021E6E84
ov100_021E6E84: ; 0x021E6E84
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldrh r0, [r5, #2]
	mov r4, #0
	cmp r0, #0
	bls _021E6EC0
	mov r7, #6
	mov r6, #0x28
_021E6E94:
	add r0, r4, #0
	ldr r1, [r5, #8]
	mul r0, r6
	add r2, r1, r0
	ldrb r0, [r1, r0]
	cmp r0, #0
	beq _021E6EB4
	ldrh r0, [r2, #2]
	cmp r0, #0
	bne _021E6EB4
	mov r1, #4
	ldr r0, [r2, #0x20]
	ldrsh r1, [r2, r1]
	ldrsh r2, [r2, r7]
	bl Sprite_SetPositionXY
_021E6EB4:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldrh r0, [r5, #2]
	cmp r4, r0
	blo _021E6E94
_021E6EC0:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6E84

	thumb_func_start ov100_021E6EC4
ov100_021E6EC4: ; 0x021E6EC4
	push {r3, r4}
	ldrh r4, [r0, #2]
	ldrh r2, [r0]
	cmp r4, r2
	blo _021E6ED4
	ldr r0, _021E6EF0 ; =0x0000FFFF
	pop {r3, r4}
	bx lr
_021E6ED4:
	mov r2, #0x28
	ldr r3, [r0, #8]
	mul r2, r4
	add r4, r3, r2
	str r1, [r4, #0x20]
	mov r1, #1
	strb r1, [r3, r2]
	strb r1, [r4, #1]
	ldrh r2, [r0, #2]
	add r1, r2, #1
	strh r1, [r0, #2]
	add r0, r2, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
_021E6EF0: .word 0x0000FFFF
	thumb_func_end ov100_021E6EC4

	thumb_func_start ov100_021E6EF4
ov100_021E6EF4: ; 0x021E6EF4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r3, [r5, #2]
	mov r4, #0
	cmp r3, #0
	bls _021E6F20
	mov r6, #0x28
_021E6F02:
	add r0, r4, #0
	ldr r1, [r5, #8]
	mul r0, r6
	add r0, r1, r0
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _021E6F14
	bl thunk_Sprite_Delete
_021E6F14:
	add r0, r4, #1
	lsl r0, r0, #0x10
	ldrh r3, [r5, #2]
	lsr r4, r0, #0x10
	cmp r4, r3
	blo _021E6F02
_021E6F20:
	mov r2, #0x28
	ldr r0, [r5, #8]
	mov r1, #0
	mul r2, r3
	bl MI_CpuFill8
	mov r0, #0
	strh r0, [r5, #2]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6EF4

	thumb_func_start ov100_021E6F34
ov100_021E6F34: ; 0x021E6F34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	str r1, [sp]
	ldrh r1, [r5, #2]
	ldr r0, [sp]
	ldr r4, [sp]
	sub r0, r1, r0
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	cmp r4, r1
	bhs _021E6F6A
	mov r6, #0x28
_021E6F4C:
	add r0, r4, #0
	ldr r1, [r5, #8]
	mul r0, r6
	add r0, r1, r0
	ldr r0, [r0, #0x20]
	cmp r0, #0
	beq _021E6F5E
	bl thunk_Sprite_Delete
_021E6F5E:
	add r0, r4, #1
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	ldrh r0, [r5, #2]
	cmp r4, r0
	blo _021E6F4C
_021E6F6A:
	ldr r0, [sp]
	ldr r3, [r5, #8]
	mov r2, #0x28
	add r1, r0, #0
	mul r1, r2
	add r0, r3, r1
	mov r1, #0
	mul r2, r7
	bl MI_CpuFill8
	ldrh r0, [r5, #2]
	sub r0, r0, r7
	strh r0, [r5, #2]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6F34

	thumb_func_start ov100_021E6F88
ov100_021E6F88: ; 0x021E6F88
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	mov r1, #0xc
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	strh r5, [r4]
	lsl r5, r5, #5
	add r0, r6, #0
	add r1, r5, #0
	bl AllocFromHeap
	mov r1, #0
	add r2, r5, #0
	str r0, [r4, #4]
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6F88

	thumb_func_start ov100_021E6FBC
ov100_021E6FBC: ; 0x021E6FBC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldrh r2, [r5]
	mov r4, #0
	cmp r2, #0
	ble _021E6FF0
	add r6, r4, #0
_021E6FCA:
	ldr r1, [r5, #4]
	add r0, r1, r6
	ldrb r1, [r1, r6]
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1f
	beq _021E6FE6
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _021E6FE6
	lsl r1, r4, #0x10
	add r0, r5, #0
	lsr r1, r1, #0x10
	bl ov100_021E70A4
_021E6FE6:
	ldrh r2, [r5]
	add r4, r4, #1
	add r6, #0x20
	cmp r4, r2
	blt _021E6FCA
_021E6FF0:
	ldr r0, [r5, #4]
	mov r1, #0
	lsl r2, r2, #5
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	bl FreeToHeap
	add r0, r5, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	add r0, r5, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov100_021E6FBC

	thumb_func_start ov100_021E7014
ov100_021E7014: ; 0x021E7014
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	str r1, [sp]
	add r7, r2, #0
	add r5, r3, #0
	bl ov100_021E70FC
	add r6, r0, #0
	ldr r0, _021E70A0 ; =0x0000FFFF
	cmp r6, r0
	beq _021E709C
	ldr r2, [r4, #4]
	lsl r1, r6, #5
	ldrb r0, [r2, r1]
	mov r3, #1
	add r4, r2, r1
	bic r0, r3
	mov r3, #1
	orr r0, r3
	strb r0, [r2, r1]
	ldrb r3, [r2, r1]
	mov r0, #4
	orr r0, r3
	strb r0, [r2, r1]
	strb r7, [r4, #2]
	ldrb r0, [r4, #2]
	mov r1, #0xc
	sub r0, r0, #1
	strb r0, [r4, #3]
	ldrb r2, [r4, #2]
	ldr r0, [sp, #0x1c]
	mul r1, r2
	bl AllocFromHeap
	str r0, [r4, #4]
	ldrb r3, [r4, #2]
	mov r2, #0xc
	ldr r0, [sp]
	ldr r1, [r4, #4]
	mul r2, r3
	bl MI_CpuCopy8
	ldrb r0, [r4, #2]
	cmp r5, r0
	blo _021E7074
	mov r0, #0
	strb r0, [r4, #1]
	b _021E7076
_021E7074:
	strb r5, [r4, #1]
_021E7076:
	ldrb r0, [r4]
	mov r1, #2
	bic r0, r1
	ldr r1, [sp, #0x18]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	lsl r1, r1, #0x1f
	lsr r1, r1, #0x1e
	orr r0, r1
	strb r0, [r4]
	ldr r0, [sp, #0x20]
	str r0, [r4, #0x10]
	ldr r0, [sp, #0x24]
	str r0, [r4, #0x14]
	ldr r0, [sp, #0x28]
	str r0, [r4, #0x18]
	ldr r0, [sp, #0x2c]
	str r0, [r4, #0x1c]
	add r0, r6, #0
_021E709C:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E70A0: .word 0x0000FFFF
	thumb_func_end ov100_021E7014

	thumb_func_start ov100_021E70A4
ov100_021E70A4: ; 0x021E70A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldrh r0, [r5]
	cmp r1, r0
	bhs _021E70BA
	ldr r0, [r5, #4]
	lsl r4, r1, #5
	ldrb r0, [r0, r4]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021E70BE
_021E70BA:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E70BE:
	ldrh r0, [r5, #2]
	cmp r0, r1
	bne _021E70CC
	ldr r0, _021E70F8 ; =0x0000FFFF
	strh r0, [r5, #2]
	mov r0, #0
	str r0, [r5, #8]
_021E70CC:
	ldr r0, [r5, #4]
	mov r1, #0
	add r2, r0, r4
	ldrb r3, [r2, #2]
	ldr r0, [r2, #4]
	mov r2, #0xc
	mul r2, r3
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	add r0, r0, r4
	ldr r0, [r0, #4]
	bl FreeToHeap
	ldr r0, [r5, #4]
	mov r1, #0
	add r0, r0, r4
	mov r2, #0x20
	bl MI_CpuFill8
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E70F8: .word 0x0000FFFF
	thumb_func_end ov100_021E70A4

	thumb_func_start ov100_021E70FC
ov100_021E70FC: ; 0x021E70FC
	ldrh r1, [r0]
	mov r3, #0
	cmp r1, #0
	bls _021E711E
	ldr r0, [r0, #4]
_021E7106:
	lsl r2, r3, #5
	ldrb r2, [r0, r2]
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1f
	bne _021E7114
	add r0, r3, #0
	bx lr
_021E7114:
	add r2, r3, #1
	lsl r2, r2, #0x10
	lsr r3, r2, #0x10
	cmp r3, r1
	blo _021E7106
_021E711E:
	ldr r0, _021E7124 ; =0x0000FFFF
	bx lr
	nop
_021E7124: .word 0x0000FFFF
	thumb_func_end ov100_021E70FC

	thumb_func_start ov100_021E7128
ov100_021E7128: ; 0x021E7128
	push {r4, r5, r6, lr}
	add r6, r1, #0
	ldr r1, _021E71B0 ; =0x0000FFFF
	add r5, r2, #0
	cmp r6, r1
	bne _021E7138
	ldr r4, [r0, #8]
	b _021E7150
_021E7138:
	ldrh r1, [r0]
	cmp r6, r1
	bhs _021E714C
	ldr r1, [r0, #4]
	lsl r0, r6, #5
	add r4, r1, r0
	ldrb r0, [r1, r0]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021E7150
_021E714C:
	ldr r0, _021E71B0 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021E7150:
	ldrb r0, [r4]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x10]
	bne _021E7184
	add r1, r5, #0
	bl thunk_Set2dSpriteVisibleFlag
	ldrb r0, [r4]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021E71AC
	ldr r0, [r4, #0x14]
	add r1, r5, #0
	bl thunk_Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x18]
	add r1, r5, #0
	bl thunk_Set2dSpriteVisibleFlag
	ldr r0, [r4, #0x1c]
	add r1, r5, #0
	bl thunk_Set2dSpriteVisibleFlag
	b _021E71AC
_021E7184:
	add r1, r5, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
	ldrb r0, [r4]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _021E71AC
	ldr r0, [r4, #0x14]
	add r1, r5, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
	ldr r0, [r4, #0x18]
	add r1, r5, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
	ldr r0, [r4, #0x1c]
	add r1, r5, #0
	bl UnkImageStruct_SetSpriteVisibleFlag
_021E71AC:
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E71B0: .word 0x0000FFFF
	thumb_func_end ov100_021E7128

	thumb_func_start ov100_021E71B4
ov100_021E71B4: ; 0x021E71B4
	push {r3, r4, r5, lr}
	ldr r2, _021E72F4 ; =0x0000FFFF
	cmp r1, r2
	bne _021E71C0
	ldr r4, [r0, #8]
	b _021E71CE
_021E71C0:
	ldrh r2, [r0]
	cmp r1, r2
	blo _021E71C8
	b _021E72F2
_021E71C8:
	ldr r2, [r0, #4]
	lsl r0, r1, #5
	add r4, r2, r0
_021E71CE:
	ldrb r1, [r4, #1]
	mov r0, #0xc
	ldr r2, [r4, #4]
	mul r0, r1
	add r5, r2, r0
	ldrb r0, [r4]
	lsl r1, r0, #0x1e
	lsr r1, r1, #0x1f
	bne _021E726A
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x10]
	bne _021E71F2
	ldrb r1, [r5, #6]
	ldrb r2, [r5, #7]
	bl Sprite_SetPositionXY
	pop {r3, r4, r5, pc}
_021E71F2:
	mov r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	add r1, r2, r1
	mov r2, #0xa
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	mov r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x14]
	add r1, r2, r1
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	mov r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x18]
	add r1, r2, r1
	mov r2, #0xa
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	mov r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x1c]
	add r1, r2, r1
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl Sprite_SetPositionXY
	pop {r3, r4, r5, pc}
_021E726A:
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	ldr r0, [r4, #0x10]
	bne _021E727C
	ldrb r1, [r5, #6]
	ldrb r2, [r5, #7]
	bl UnkImageStruct_SetSpritePositionXY
	pop {r3, r4, r5, pc}
_021E727C:
	mov r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	add r1, r2, r1
	mov r2, #0xa
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl UnkImageStruct_SetSpritePositionXY
	mov r1, #8
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x14]
	add r1, r2, r1
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl UnkImageStruct_SetSpritePositionXY
	mov r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x18]
	add r1, r2, r1
	mov r2, #0xa
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl UnkImageStruct_SetSpritePositionXY
	mov r1, #9
	ldrb r2, [r5, #6]
	ldrsb r1, [r5, r1]
	ldrb r3, [r5, #7]
	ldr r0, [r4, #0x1c]
	add r1, r2, r1
	mov r2, #0xb
	ldrsb r2, [r5, r2]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add r2, r3, r2
	lsl r2, r2, #0x10
	asr r2, r2, #0x10
	bl UnkImageStruct_SetSpritePositionXY
_021E72F2:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E72F4: .word 0x0000FFFF
	thumb_func_end ov100_021E71B4

	thumb_func_start ov100_021E72F8
ov100_021E72F8: ; 0x021E72F8
	push {r4, lr}
	add r4, r1, #0
	ldrh r1, [r0]
	cmp r4, r1
	blo _021E7306
	ldr r0, _021E7330 ; =0x0000FFFF
	pop {r4, pc}
_021E7306:
	ldr r1, [r0, #4]
	lsl r3, r4, #5
	add r1, r1, r3
	str r1, [r0, #8]
	strh r4, [r0, #2]
	cmp r2, #0xff
	beq _021E7326
	ldr r1, [r0, #4]
	add r3, r1, r3
	ldrb r1, [r3, #2]
	cmp r2, r1
	blo _021E7324
	mov r1, #0
	strb r1, [r3, #1]
	b _021E7326
_021E7324:
	strb r2, [r3, #1]
_021E7326:
	ldr r1, _021E7330 ; =0x0000FFFF
	bl ov100_021E71B4
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_021E7330: .word 0x0000FFFF
	thumb_func_end ov100_021E72F8

	thumb_func_start ov100_021E7334
ov100_021E7334: ; 0x021E7334
	ldr r0, [r0, #8]
	ldrb r0, [r0, #1]
	bx lr
	.balign 4, 0
	thumb_func_end ov100_021E7334

	thumb_func_start ov100_021E733C
ov100_021E733C: ; 0x021E733C
	ldr r2, _021E7364 ; =0x0000FFFF
	cmp r1, r2
	bne _021E7348
	ldr r0, [r0, #8]
	ldrb r0, [r0, #1]
	bx lr
_021E7348:
	ldrh r2, [r0]
	cmp r1, r2
	bhs _021E735A
	lsl r2, r1, #5
	ldr r1, [r0, #4]
	ldrb r0, [r1, r2]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _021E735E
_021E735A:
	mov r0, #0
	bx lr
_021E735E:
	add r0, r1, r2
	ldrb r0, [r0, #1]
	bx lr
	.balign 4, 0
_021E7364: .word 0x0000FFFF
	thumb_func_end ov100_021E733C

	thumb_func_start ov100_021E7368
ov100_021E7368: ; 0x021E7368
	push {r3, r4}
	ldr r0, [r0, #8]
	cmp r0, #0
	beq _021E73A8
	ldrb r3, [r0, #1]
	mov r2, #0xc
	ldr r4, [r0, #4]
	mul r2, r3
	add r2, r4, r2
	cmp r1, #3
	bhi _021E739E
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E738A: ; jump table
	.short _021E739E - _021E738A - 2 ; case 0
	.short _021E7392 - _021E738A - 2 ; case 1
	.short _021E7396 - _021E738A - 2 ; case 2
	.short _021E739A - _021E738A - 2 ; case 3
_021E7392:
	ldrb r2, [r2, #3]
	b _021E73A0
_021E7396:
	ldrb r2, [r2, #4]
	b _021E73A0
_021E739A:
	ldrb r2, [r2, #5]
	b _021E73A0
_021E739E:
	ldrb r2, [r2, #2]
_021E73A0:
	ldrb r1, [r0, #3]
	cmp r2, r1
	bhi _021E73A8
	strb r2, [r0, #1]
_021E73A8:
	pop {r3, r4}
	bx lr
	thumb_func_end ov100_021E7368

	thumb_func_start ov100_021E73AC
ov100_021E73AC: ; 0x021E73AC
	push {r4, lr}
	add r4, r0, #0
	bl ov100_021E7368
	ldr r1, _021E73C4 ; =0x0000FFFF
	add r0, r4, #0
	bl ov100_021E71B4
	ldr r0, [r4, #8]
	ldrb r0, [r0, #1]
	pop {r4, pc}
	nop
_021E73C4: .word 0x0000FFFF
	thumb_func_end ov100_021E73AC

	thumb_func_start ov100_021E73C8
ov100_021E73C8: ; 0x021E73C8
	ldr r3, _021E73D0 ; =ov100_021E73D4
	add r2, r1, #0
	ldrh r1, [r0, #2]
	bx r3
	.balign 4, 0
_021E73D0: .word ov100_021E73D4
	thumb_func_end ov100_021E73C8

	thumb_func_start ov100_021E73D4
ov100_021E73D4: ; 0x021E73D4
	push {r3, r4, r5, lr}
	ldr r3, _021E7410 ; =0x0000FFFF
	cmp r1, r3
	bne _021E73E2
	ldr r4, [r0, #8]
	ldrh r1, [r0, #2]
	b _021E73FA
_021E73E2:
	ldrh r3, [r0]
	cmp r1, r3
	bhs _021E73F6
	ldr r5, [r0, #4]
	lsl r3, r1, #5
	add r4, r5, r3
	ldrb r3, [r5, r3]
	lsl r3, r3, #0x1f
	lsr r3, r3, #0x1f
	bne _021E73FA
_021E73F6:
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E73FA:
	ldrb r3, [r4, #3]
	cmp r3, r2
	bhs _021E7404
	mov r2, #0
	b _021E7404
_021E7404:
	strb r2, [r4, #1]
	bl ov100_021E71B4
	ldrb r0, [r4, #1]
	pop {r3, r4, r5, pc}
	nop
_021E7410: .word 0x0000FFFF
	thumb_func_end ov100_021E73D4

	thumb_func_start ov100_021E7414
ov100_021E7414: ; 0x021E7414
	push {r4, r5, r6, lr}
	add r5, r2, #0
	ldr r2, _021E749C ; =0x0000FFFF
	cmp r1, r2
	bne _021E7420
	ldrh r1, [r0, #2]
_021E7420:
	ldrh r2, [r0]
	cmp r1, r2
	bhs _021E7498
	ldr r2, [r0, #4]
	lsl r0, r1, #5
	ldrb r1, [r2, r0]
	add r4, r2, r0
	lsl r0, r1, #0x1f
	lsr r0, r0, #0x1f
	beq _021E7498
	lsl r0, r1, #0x1e
	lsr r0, r0, #0x1f
	bne _021E746A
	lsl r0, r1, #0x1d
	lsr r0, r0, #0x1f
	bne _021E7450
	ldr r0, [r4, #0x10]
	bl Sprite_ResetAnimCtrlState
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl thunk_Set2dSpriteAnimActiveFlag
	pop {r4, r5, r6, pc}
_021E7450:
	mov r6, #0
_021E7452:
	ldr r0, [r4, #0x10]
	bl Sprite_ResetAnimCtrlState
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl thunk_Set2dSpriteAnimActiveFlag
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _021E7452
	pop {r4, r5, r6, pc}
_021E746A:
	lsl r0, r1, #0x1d
	lsr r0, r0, #0x1f
	bne _021E7480
	ldr r0, [r4, #0x10]
	bl UnkImageStruct_ResetSpriteAnimCtrlState
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl UnkImageStruct_SetSpriteAnimActiveFlag
	pop {r4, r5, r6, pc}
_021E7480:
	mov r6, #0
_021E7482:
	ldr r0, [r4, #0x10]
	bl UnkImageStruct_ResetSpriteAnimCtrlState
	ldr r0, [r4, #0x10]
	add r1, r5, #0
	bl UnkImageStruct_SetSpriteAnimActiveFlag
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _021E7482
_021E7498:
	pop {r4, r5, r6, pc}
	nop
_021E749C: .word 0x0000FFFF
	thumb_func_end ov100_021E7414

    .rodata

	.global ov100_021E764C
ov100_021E764C: ; 0x021E764C
	.byte 0x01, 0x01, 0x01, 0x01

ov100_021E7650:
	.byte 0x2A, 0x00, 0x2B, 0x00, 0x29, 0x00, 0x28, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x52, 0x00

ov100_021E765E:
	.byte 0x2E, 0x00
	.byte 0x2F, 0x00, 0x2D, 0x00, 0x2C, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x53, 0x00

ov100_021E766C:
	.byte 0x26, 0x00, 0x27, 0x00
	.byte 0x25, 0x00, 0x24, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x51, 0x00

ov100_021E767A:
	.byte 0x22, 0x00, 0x23, 0x00, 0x21, 0x00
	.byte 0x20, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x50, 0x00

ov100_021E7688:
	.byte 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00

ov100_021E769C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

	.global ov100_021E76BC
ov100_021E76BC: ; 0x021E76BC
	.word 0x00000080, ov100_021E769C, ov100_021E7688, ov100_021E7650
	.word 0x00000080, ov100_021E769C, ov100_021E7688, ov100_021E766C
	.word 0x000000C0, ov100_021E769C, ov100_021E7688, ov100_021E767A
	.word 0x00000080, ov100_021E769C, ov100_021E7688, ov100_021E765E
	.word 0x00000080, ov100_021E769C, ov100_021E7688, ov100_021E767A

	.global ov100_021E770C
ov100_021E770C: ; 0x021E770C
	.byte 0x02, 0x02, 0x02, 0x03
	.byte 0x01, 0x01, 0x01, 0x01
