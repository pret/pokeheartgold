	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FC1D8:
	.short 0x00FB, 0x03E8
	.short 0x0109, 0x03E8
	.short 0x0114, 0x03E8
	.short 0x0115, 0x03E8
	.short 0x01A1, 0x07D0
	.short 0x0181, 0x07D0
	.short 0x0192, 0x0FA0
	.short 0x0167, 0x0FA0
	.short 0x0173, 0x1770
	.short 0x01A0, 0x1770
	.short 0x0151, 0x1770
	.short 0x0162, 0x1F40
	.short 0x015C, 0x1F40
	.short 0x016A, 0x2710
	.short 0x015F, 0x2710
	.short 0x0154, 0x2710
	.short 0x0164, 0x2710
	.short 0x0191, 0x3A98
	.short 0x018B, 0x4E20

	.text

	thumb_func_start ScrCmd_567
ScrCmd_567: ; 0x0204E5BC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	ldr r1, _0204E608 ; =_020FC1D8
	lsl r2, r4, #2
	ldrh r1, [r1, r2]
	strh r1, [r6]
	ldr r1, _0204E60C ; =_020FC1D8 + 2
	ldrh r1, [r1, r2]
	strh r1, [r0]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0204E608: .word _020FC1D8
_0204E60C: .word _020FC1D8 + 2
	thumb_func_end ScrCmd_567
