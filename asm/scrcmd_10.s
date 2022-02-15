	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_AnimApricornTree
ScrCmd_AnimApricornTree: ; 0x0204BC98
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
	bl FieldSys_AnimApricornTree
	mov r0, #1
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_AnimApricornTree

	thumb_func_start ScrCmd_ApricornTreeGetApricorn
ScrCmd_ApricornTreeGetApricorn: ; 0x0204BCCC
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
	bl FieldSys_ApricornTree_GetApricorn
	strh r0, [r6]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_ApricornTreeGetApricorn

	thumb_func_start ScrCmd_GiveApricornFromTree
ScrCmd_GiveApricornFromTree: ; 0x0204BD04
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
	bl Save_ApricornBox_get
	; this looks like an inline
	lsl r1, r7, #0x18
	lsr r5, r1, #0x18
	add r1, r5, #0
	str r0, [sp]
	bl ApricornBox_CountApricorn
	add r0, r4, r0
	cmp r0, #0x63
	bgt _0204BD6E
	ldr r0, [sp]
	add r1, r5, #0
	add r2, r4, #0
	bl ApricornBox_GiveApricorn
	mov r0, #1
	b _0204BD70
_0204BD6E:
	mov r0, #0
_0204BD70:
	strh r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_GiveApricornFromTree
