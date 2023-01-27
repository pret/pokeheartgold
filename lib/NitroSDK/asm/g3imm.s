	.include "asm/macros.inc"
	.include "g3imm.inc"
	.include "global.inc"

	.public GX_SendFifo64B
	.public GX_SendFifo48B

	.text

	arm_func_start G3_LoadMtx44
G3_LoadMtx44: ; 0x020CF4F4
	ldr r1, _020CF508 ; =0x04000400
	mov r2, #0x16
	ldr ip, _020CF50C ; =GX_SendFifo64B
	str r2, [r1]
	bx ip
	.align 2, 0
_020CF508: .word 0x04000400
_020CF50C: .word GX_SendFifo64B
	arm_func_end G3_LoadMtx44

	arm_func_start G3_LoadMtx43
G3_LoadMtx43: ; 0x020CF510
	ldr r1, _020CF524 ; =0x04000400
	mov r2, #0x17
	ldr ip, _020CF528 ; =GX_SendFifo48B
	str r2, [r1]
	bx ip
	.align 2, 0
_020CF524: .word 0x04000400
_020CF528: .word GX_SendFifo48B
	arm_func_end G3_LoadMtx43

	arm_func_start G3_MultMtx43
G3_MultMtx43: ; 0x020CF52C
	ldr r1, _020CF540 ; =0x04000400
	mov r2, #0x19
	ldr ip, _020CF544 ; =GX_SendFifo48B
	str r2, [r1]
	bx ip
	.align 2, 0
_020CF540: .word 0x04000400
_020CF544: .word GX_SendFifo48B
	arm_func_end G3_MultMtx43

	arm_func_start G3_MultMtx33
G3_MultMtx33: ; 0x020CF548
	ldr r1, _020CF55C ; =0x04000400
	mov r2, #0x1a
	ldr ip, _020CF560 ; =MI_Copy36B
	str r2, [r1]
	bx ip
	.align 2, 0
_020CF55C: .word 0x04000400
_020CF560: .word MI_Copy36B
	arm_func_end G3_MultMtx33
