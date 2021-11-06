	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_623
ScrCmd_623: ; 0x0204BC98
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xa
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r6, #0
	bl GetVarPointer
	add r5, #0x80
	add r2, r0, #0
	ldr r0, [r5]
	ldr r1, [r4]
	bl ov01_02204840
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_623

	thumb_func_start ScrCmd_624
ScrCmd_624: ; 0x0204BCCC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xa
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, r6, #0
	bl GetVarPointer
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r1, [r4]
	bl sub_020557C0
	strh r0, [r6]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_624

	thumb_func_start ScrCmd_625
ScrCmd_625: ; 0x0204BD04
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r5, #0x80
	add r6, r0, #0
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl sub_02031B14
	lsl r1, r7, #0x18
	lsr r5, r1, #0x18
	add r1, r5, #0
	str r0, [sp]
	bl sub_02031BA4
	add r0, r4, r0
	cmp r0, #0x63
	bgt _0204BD6E
	ldr r0, [sp]
	add r1, r5, #0
	add r2, r4, #0
	bl sub_02031B68
	mov r0, #1
	b _0204BD70
_0204BD6E:
	mov r0, #0
_0204BD70:
	strh r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_625
