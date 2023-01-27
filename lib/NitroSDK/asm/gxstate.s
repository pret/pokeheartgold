	.include "asm/macros.inc"
	.include "gxstate.inc"
	.include "global.inc"

	.bss

	.public gGXState
gGXState:
	.space 0x1A

	.text

	arm_func_start GX_InitGXState
GX_InitGXState: ; 0x020CDAEC
	ldr r0, _020CDB44 ; =gGXState
	mov r2, #0
	strh r2, [r0]
	strh r2, [r0, #2]
	strh r2, [r0, #4]
	strh r2, [r0, #6]
	strh r2, [r0, #8]
	strh r2, [r0, #0xa]
	strh r2, [r0, #0xc]
	strh r2, [r0, #0xe]
	strh r2, [r0, #0x10]
	strh r2, [r0, #0x12]
	strh r2, [r0, #0x14]
	strh r2, [r0, #0x16]
	ldr r1, _020CDB48 ; =0x04000240
	strh r2, [r0, #0x18]
	str r2, [r1]
	strb r2, [r1, #4]
	strb r2, [r1, #5]
	strb r2, [r1, #6]
	strh r2, [r1, #8]
	bx lr
	.align 2, 0
_020CDB44: .word gGXState
_020CDB48: .word 0x04000240
	arm_func_end GX_InitGXState
