	.include "asm/macros.inc"
	.include "gx_bgcnt.inc"
	.include "global.inc"

	.text

	arm_func_start G2_GetBG0ScrPtr
G2_GetBG0ScrPtr: ; 0x020CEC3C
	ldr r1, _020CEC6C ; =0x04000008
	mov r0, #0x4000000
	ldrh r1, [r1]
	ldr r0, [r0]
	and r0, r0, #0x38000000
	mov r0, r0, lsr #0x1b
	and r1, r1, #0x1f00
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #8
	add r0, r0, #0x6000000
	add r0, r0, r1, lsl #11
	bx lr
	.align 2, 0
_020CEC6C: .word 0x04000008
	arm_func_end G2_GetBG0ScrPtr

	arm_func_start G2S_GetBG0ScrPtr
G2S_GetBG0ScrPtr: ; 0x020CEC70
	ldr r0, _020CEC8C ; =0x04001008
	ldrh r0, [r0]
	and r0, r0, #0x1f00
	mov r0, r0, asr #8
	mov r0, r0, lsl #0xb
	add r0, r0, #0x6200000
	bx lr
	.align 2, 0
_020CEC8C: .word 0x04001008
	arm_func_end G2S_GetBG0ScrPtr

	arm_func_start G2_GetBG1ScrPtr
G2_GetBG1ScrPtr: ; 0x020CEC90
	ldr r1, _020CECC0 ; =0x0400000A
	mov r0, #0x4000000
	ldrh r1, [r1]
	ldr r0, [r0]
	and r0, r0, #0x38000000
	mov r0, r0, lsr #0x1b
	and r1, r1, #0x1f00
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #8
	add r0, r0, #0x6000000
	add r0, r0, r1, lsl #11
	bx lr
	.align 2, 0
_020CECC0: .word 0x0400000A
	arm_func_end G2_GetBG1ScrPtr

	arm_func_start G2S_GetBG1ScrPtr
G2S_GetBG1ScrPtr: ; 0x020CECC4
	ldr r0, _020CECE0 ; =0x0400100A
	ldrh r0, [r0]
	and r0, r0, #0x1f00
	mov r0, r0, asr #8
	mov r0, r0, lsl #0xb
	add r0, r0, #0x6200000
	bx lr
	.align 2, 0
_020CECE0: .word 0x0400100A
	arm_func_end G2S_GetBG1ScrPtr

	arm_func_start G2_GetBG2ScrPtr
G2_GetBG2ScrPtr: ; 0x020CECE4
	mov r0, #0x4000000
	ldr r1, [r0]
	ldrh r3, [r0, #0xc]
	ldr r0, [r0]
	and ip, r1, #7
	and r0, r0, #0x38000000
	mov r1, r0, lsr #0x1b
	and r0, r3, #0x1f00
	mov r2, r1, lsl #0x10
	cmp ip, #6
	mov r1, r0, lsr #8
	addls pc, pc, ip, lsl #2
	b _020CED60
_020CED18: ; jump table
	b _020CED34 ; case 0
	b _020CED34 ; case 1
	b _020CED34 ; case 2
	b _020CED34 ; case 3
	b _020CED34 ; case 4
	b _020CED40 ; case 5
	b _020CED58 ; case 6
_020CED34:
	add r0, r2, #0x6000000
	add r0, r0, r1, lsl #11
	bx lr
_020CED40:
	tst r3, #0x80
	movne r0, r1, lsl #0xe
	addne r0, r0, #0x6000000
	addeq r0, r2, #0x6000000
	addeq r0, r0, r1, lsl #11
	bx lr
_020CED58:
	mov r0, #0x6000000
	bx lr
_020CED60:
	mov r0, #0
	bx lr
	arm_func_end G2_GetBG2ScrPtr

	arm_func_start G2S_GetBG2ScrPtr
G2S_GetBG2ScrPtr: ; 0x020CED68
	ldr r1, _020CEDD8 ; =0x04001000
	ldr r0, [r1]
	ldrh r1, [r1, #0xc]
	and r2, r0, #7
	cmp r2, #6
	and r0, r1, #0x1f00
	mov r0, r0, lsr #8
	addls pc, pc, r2, lsl #2
	b _020CEDD0
_020CED8C: ; jump table
	b _020CEDA8 ; case 0
	b _020CEDA8 ; case 1
	b _020CEDA8 ; case 2
	b _020CEDA8 ; case 3
	b _020CEDA8 ; case 4
	b _020CEDB4 ; case 5
	b _020CEDC8 ; case 6
_020CEDA8:
	mov r0, r0, lsl #0xb
	add r0, r0, #0x6200000
	bx lr
_020CEDB4:
	tst r1, #0x80
	movne r0, r0, lsl #0xe
	moveq r0, r0, lsl #0xb
	add r0, r0, #0x6200000
	bx lr
_020CEDC8:
	mov r0, #0
	bx lr
_020CEDD0:
	mov r0, #0
	bx lr
	.align 2, 0
_020CEDD8: .word 0x04001000
	arm_func_end G2S_GetBG2ScrPtr

	arm_func_start G2_GetBG3ScrPtr
G2_GetBG3ScrPtr: ; 0x020CEDDC
	mov r0, #0x4000000
	ldr r1, [r0]
	ldrh r3, [r0, #0xe]
	ldr r0, [r0]
	and ip, r1, #7
	and r0, r0, #0x38000000
	mov r1, r0, lsr #0x1b
	and r0, r3, #0x1f00
	mov r2, r1, lsl #0x10
	cmp ip, #6
	mov r1, r0, lsr #8
	addls pc, pc, ip, lsl #2
	b _020CEE58
_020CEE10: ; jump table
	b _020CEE2C ; case 0
	b _020CEE2C ; case 1
	b _020CEE2C ; case 2
	b _020CEE38 ; case 3
	b _020CEE38 ; case 4
	b _020CEE38 ; case 5
	b _020CEE50 ; case 6
_020CEE2C:
	add r0, r2, #0x6000000
	add r0, r0, r1, lsl #11
	bx lr
_020CEE38:
	tst r3, #0x80
	movne r0, r1, lsl #0xe
	addne r0, r0, #0x6000000
	addeq r0, r2, #0x6000000
	addeq r0, r0, r1, lsl #11
	bx lr
_020CEE50:
	mov r0, #0
	bx lr
_020CEE58:
	mov r0, #0
	bx lr
	arm_func_end G2_GetBG3ScrPtr

	arm_func_start G2S_GetBG3ScrPtr
G2S_GetBG3ScrPtr: ; 0x020CEE60
	ldr r1, _020CEED0 ; =0x04001000
	ldr r0, [r1]
	ldrh r1, [r1, #0xe]
	and r2, r0, #7
	cmp r2, #6
	and r0, r1, #0x1f00
	mov r0, r0, lsr #8
	addls pc, pc, r2, lsl #2
	b _020CEEC8
_020CEE84: ; jump table
	b _020CEEA0 ; case 0
	b _020CEEA0 ; case 1
	b _020CEEA0 ; case 2
	b _020CEEAC ; case 3
	b _020CEEAC ; case 4
	b _020CEEAC ; case 5
	b _020CEEC0 ; case 6
_020CEEA0:
	mov r0, r0, lsl #0xb
	add r0, r0, #0x6200000
	bx lr
_020CEEAC:
	tst r1, #0x80
	movne r0, r0, lsl #0xe
	moveq r0, r0, lsl #0xb
	add r0, r0, #0x6200000
	bx lr
_020CEEC0:
	mov r0, #0
	bx lr
_020CEEC8:
	mov r0, #0
	bx lr
	.align 2, 0
_020CEED0: .word 0x04001000
	arm_func_end G2S_GetBG3ScrPtr

	arm_func_start G2_GetBG0CharPtr
G2_GetBG0CharPtr: ; 0x020CEED4
	ldr r1, _020CEF04 ; =0x04000008
	mov r0, #0x4000000
	ldrh r1, [r1]
	ldr r0, [r0]
	and r0, r0, #0x7000000
	mov r0, r0, lsr #0x18
	and r1, r1, #0x3c
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #2
	add r0, r0, #0x6000000
	add r0, r0, r1, lsl #14
	bx lr
	.align 2, 0
_020CEF04: .word 0x04000008
	arm_func_end G2_GetBG0CharPtr

	arm_func_start G2S_GetBG0CharPtr
G2S_GetBG0CharPtr: ; 0x020CEF08
	ldr r0, _020CEF24 ; =0x04001008
	ldrh r0, [r0]
	and r0, r0, #0x3c
	mov r0, r0, asr #2
	mov r0, r0, lsl #0xe
	add r0, r0, #0x6200000
	bx lr
	.align 2, 0
_020CEF24: .word 0x04001008
	arm_func_end G2S_GetBG0CharPtr

	arm_func_start G2_GetBG1CharPtr
G2_GetBG1CharPtr: ; 0x020CEF28
	ldr r1, _020CEF58 ; =0x0400000A
	mov r0, #0x4000000
	ldrh r1, [r1]
	ldr r0, [r0]
	and r0, r0, #0x7000000
	mov r0, r0, lsr #0x18
	and r1, r1, #0x3c
	mov r0, r0, lsl #0x10
	mov r1, r1, asr #2
	add r0, r0, #0x6000000
	add r0, r0, r1, lsl #14
	bx lr
	.align 2, 0
_020CEF58: .word 0x0400000A
	arm_func_end G2_GetBG1CharPtr

	arm_func_start G2S_GetBG1CharPtr
G2S_GetBG1CharPtr: ; 0x020CEF5C
	ldr r0, _020CEF78 ; =0x0400100A
	ldrh r0, [r0]
	and r0, r0, #0x3c
	mov r0, r0, asr #2
	mov r0, r0, lsl #0xe
	add r0, r0, #0x6200000
	bx lr
	.align 2, 0
_020CEF78: .word 0x0400100A
	arm_func_end G2S_GetBG1CharPtr

	arm_func_start G2_GetBG2CharPtr
G2_GetBG2CharPtr: ; 0x020CEF7C
	mov r1, #0x4000000
	ldr r0, [r1]
	ldrh r2, [r1, #0xc]
	and r0, r0, #7
	cmp r0, #5
	blt _020CEF9C
	tst r2, #0x80
	bne _020CEFC4
_020CEF9C:
	mov r0, #0x4000000
	ldr r1, [r0]
	and r0, r2, #0x3c
	and r1, r1, #0x7000000
	mov r1, r1, lsr #0x18
	mov r1, r1, lsl #0x10
	add r1, r1, #0x6000000
	mov r0, r0, lsr #2
	add r0, r1, r0, lsl #14
	bx lr
_020CEFC4:
	mov r0, #0
	bx lr
	arm_func_end G2_GetBG2CharPtr

	arm_func_start G2S_GetBG2CharPtr
G2S_GetBG2CharPtr: ; 0x020CEFCC
	ldr r1, _020CF008 ; =0x04001000
	ldr r0, [r1]
	ldrh r1, [r1, #0xc]
	and r0, r0, #7
	cmp r0, #5
	blt _020CEFEC
	tst r1, #0x80
	bne _020CF000
_020CEFEC:
	and r0, r1, #0x3c
	mov r0, r0, lsr #2
	mov r0, r0, lsl #0xe
	add r0, r0, #0x6200000
	bx lr
_020CF000:
	mov r0, #0
	bx lr
	.align 2, 0
_020CF008: .word 0x04001000
	arm_func_end G2S_GetBG2CharPtr

	arm_func_start G2_GetBG3CharPtr
G2_GetBG3CharPtr: ; 0x020CF00C
	mov r1, #0x4000000
	ldr r0, [r1]
	ldrh r2, [r1, #0xe]
	and r0, r0, #7
	cmp r0, #3
	blt _020CF034
	cmp r0, #6
	bge _020CF05C
	tst r2, #0x80
	bne _020CF05C
_020CF034:
	mov r0, #0x4000000
	ldr r1, [r0]
	and r0, r2, #0x3c
	and r1, r1, #0x7000000
	mov r1, r1, lsr #0x18
	mov r1, r1, lsl #0x10
	add r1, r1, #0x6000000
	mov r0, r0, lsr #2
	add r0, r1, r0, lsl #14
	bx lr
_020CF05C:
	mov r0, #0
	bx lr
	arm_func_end G2_GetBG3CharPtr

	arm_func_start G2S_GetBG3CharPtr
G2S_GetBG3CharPtr: ; 0x020CF064
	ldr r1, _020CF0A8 ; =0x04001000
	ldr r0, [r1]
	ldrh r1, [r1, #0xe]
	and r0, r0, #7
	cmp r0, #3
	blt _020CF08C
	cmp r0, #6
	bge _020CF0A0
	tst r1, #0x80
	bne _020CF0A0
_020CF08C:
	and r0, r1, #0x3c
	mov r0, r0, lsr #2
	mov r0, r0, lsl #0xe
	add r0, r0, #0x6200000
	bx lr
_020CF0A0:
	mov r0, #0
	bx lr
	.align 2, 0
_020CF0A8: .word 0x04001000
	arm_func_end G2S_GetBG3CharPtr
