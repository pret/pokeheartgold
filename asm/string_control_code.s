	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start MsgArray_SkipControlCode
MsgArray_SkipControlCode: ; 0x0201FB1C
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4]
	ldr r0, _0201FB40 ; =0x0000FFFE
	cmp r1, r0
	beq _0201FB2C
	bl GF_AssertFail
_0201FB2C:
	ldrh r1, [r4]
	ldr r0, _0201FB40 ; =0x0000FFFE
	cmp r1, r0
	bne _0201FB3C
	ldrh r0, [r4, #4]
	add r1, r4, #6
	lsl r0, r0, #1
	add r4, r1, r0
_0201FB3C:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
_0201FB40: .word 0x0000FFFE
	thumb_func_end MsgArray_SkipControlCode

	thumb_func_start MsgArray_GetControlCode
MsgArray_GetControlCode: ; 0x0201FB44
	push {r4, lr}
	add r4, r0, #0
	ldrh r1, [r4]
	ldr r0, _0201FB58 ; =0x0000FFFE
	cmp r1, r0
	beq _0201FB54
	bl GF_AssertFail
_0201FB54:
	ldrh r0, [r4, #2]
	pop {r4, pc}
	.balign 4, 0
_0201FB58: .word 0x0000FFFE
	thumb_func_end MsgArray_GetControlCode

	thumb_func_start MsgArray_ControlCodeIsStrVar
MsgArray_ControlCodeIsStrVar: ; 0x0201FB5C
	push {r3, lr}
	bl MsgArray_GetControlCode
	mov r1, #0xff
	lsl r1, r1, #8
	add r2, r0, #0
	and r2, r1
	mov r1, #1
	lsl r1, r1, #8
	cmp r2, r1
	beq _0201FB88
	mov r0, #3
	lsl r0, r0, #8
	cmp r2, r0
	beq _0201FB88
	lsl r0, r1, #2
	cmp r2, r0
	beq _0201FB88
	mov r0, #0xd
	lsl r0, r0, #0xa
	cmp r2, r0
	bne _0201FB8C
_0201FB88:
	mov r0, #1
	pop {r3, pc}
_0201FB8C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end MsgArray_ControlCodeIsStrVar

	thumb_func_start MsgArray_ControlCodeGetField
MsgArray_ControlCodeGetField: ; 0x0201FB90
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldrh r1, [r5]
	ldr r0, _0201FBB4 ; =0x0000FFFE
	cmp r1, r0
	beq _0201FBA2
	bl GF_AssertFail
_0201FBA2:
	ldrh r0, [r5, #4]
	cmp r4, r0
	blo _0201FBAC
	bl GF_AssertFail
_0201FBAC:
	lsl r0, r4, #1
	add r0, r5, r0
	ldrh r0, [r0, #6]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0201FBB4: .word 0x0000FFFE
	thumb_func_end MsgArray_ControlCodeGetField
