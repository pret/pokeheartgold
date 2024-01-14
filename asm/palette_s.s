	.include "asm/macros.inc"
	.include "palette.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_02004020
sub_02004020: ; 0x02004020
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x28]
	str r1, [sp, #4]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	add r7, r2, #0
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	add r6, r3, #0
	str r0, [sp, #0x30]
	mov r0, #0
	str r0, [sp, #0xc]
_0200403C:
	ldr r0, [sp]
	mov r1, #0x1f
	ldrh r0, [r0]
	asr r2, r0, #5
	add r4, r0, #0
	add r5, r2, #0
	and r4, r1
	and r5, r1
	asr r1, r0, #0xa
	mov r0, #0x1f
	and r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	add r1, r7, #0
	sub r0, r0, r4
	mul r0, r6
	bl _s32_div_f
	add r4, r4, r0
	ldr r0, [sp, #0x2c]
	add r1, r7, #0
	sub r0, r0, r5
	mul r0, r6
	bl _s32_div_f
	add r5, r5, r0
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #8]
	sub r0, r1, r0
	mul r0, r6
	add r1, r7, #0
	bl _s32_div_f
	ldr r1, [sp, #8]
	add r0, r1, r0
	lsl r1, r0, #0xa
	lsl r0, r5, #5
	orr r0, r1
	add r1, r4, #0
	orr r1, r0
	ldr r0, [sp, #4]
	strh r1, [r0]
	ldr r0, [sp]
	add r0, r0, #2
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x10
	blt _0200403C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02004020

	thumb_func_start sub_020040AC
sub_020040AC: ; 0x020040AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, r2, #0
	mov r2, #0x46
	add r5, r0, #0
	ldr r0, [sp, #0x38]
	lsl r2, r2, #2
	str r1, [sp, #0xc]
	str r0, [sp, #0x38]
	ldrh r1, [r5, r2]
	mov r0, #3
	str r3, [sp, #0x10]
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strh r0, [r5, r2]
	add r0, r2, #2
	ldr r1, [sp, #0xc]
	ldrh r0, [r5, r0]
	ldr r3, _02004170 ; =0xFFFFC000
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	lsr r1, r3, #0x12
	and r0, r3
	and r1, r4
	orr r1, r0
	add r0, r2, #2
	strh r1, [r5, r0]
	add r0, sp, #0x28
	ldrh r2, [r0, #0x14]
	mov r1, #0x1f
	add r0, r2, #0
	and r0, r1
	str r0, [sp, #0x1c]
	asr r0, r2, #5
	and r0, r1
	str r0, [sp, #0x18]
	asr r0, r2, #0xa
	and r0, r1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x20]
_02004100:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0200415E
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x20]
	asr r1, r0
	mov r0, #1
	tst r1, r0
	beq _0200415E
	mov r6, #0
	strh r7, [r5, #0xc]
	lsl r0, r0, #9
	str r0, [r5, #8]
	add r4, r6, #0
_0200411C:
	add r1, r7, #0
	asr r1, r6
	mov r0, #1
	tst r0, r1
	beq _02004146
	ldr r0, [sp, #0x1c]
	lsl r1, r4, #1
	str r0, [sp]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x38]
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, [r5, #4]
	add r0, r0, r1
	add r1, r2, r1
	ldr r2, [sp, #0x10]
	bl sub_02004020
	b _02004156
_02004146:
	ldr r0, [r5]
	lsl r1, r4, #1
	ldr r2, [r5, #4]
	add r0, r0, r1
	add r1, r2, r1
	mov r2, #0x20
	bl MIi_CpuCopyFast
_02004156:
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #0x10
	blt _0200411C
_0200415E:
	ldr r0, [sp, #0x20]
	add r5, #0x14
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #0xe
	blt _02004100
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02004170: .word 0xFFFFC000
	thumb_func_end sub_020040AC
