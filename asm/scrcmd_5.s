	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D416C:
	.space 0x4

	.text

	thumb_func_start ScrCmd_852
ScrCmd_852: ; 0x02048EB8
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	bl FieldSysGetAttrAddr
	ldr r1, [r4, #8]
	add r3, r1, #1
	str r3, [r4, #8]
	ldrb r1, [r1]
	add r2, r3, #1
	str r2, [r4, #8]
	ldrb r2, [r3]
	ldr r0, [r0]
	bl sub_0200CB70
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_852

	thumb_func_start ScrCmd_503
ScrCmd_503: ; 0x02048EE0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02066CD0
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_503

	thumb_func_start ScrCmd_504
ScrCmd_504: ; 0x02048F10
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r4, r0, #0
	add r0, #0x80
	ldr r7, [r0]
	ldr r0, [r7, #0xc]
	bl GetStoragePCPointer
	str r0, [sp, #0x20]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #8]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp, #4]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	str r0, [sp]
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	bl GetPartyCount
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	ldr r0, _02049088 ; =0x00000000
	str r0, [sp, #0x1c]
	str r0, [sp, #0x18]
	ldr r5, [sp, #0x1c]
	beq _02048FD2
_02048F88:
	ldr r0, [r7, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #0x4c
	mov r2, #0
	add r4, r0, #0
	bl GetMonData
	cmp r0, #0
	bne _02048FC8
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	lsl r1, r1, #0x10
	ldr r0, [sp]
	lsr r1, r1, #0x10
	bl sub_020490A0
	cmp r0, #0
	beq _02048FC8
	ldr r1, [sp, #0x1c]
	cmp r1, r0
	bge _02048FC8
	str r0, [sp, #0x1c]
	str r5, [sp, #0x18]
_02048FC8:
	add r0, r5, #1
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	cmp r5, r6
	blo _02048F88
_02048FD2:
	mov r6, #0
	str r6, [sp, #0x14]
	str r6, [sp, #0x10]
	add r7, r6, #0
_02048FDA:
	mov r5, #0
_02048FDC:
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x10]
	add r2, r5, #0
	bl PCStorage_GetMonByIndexPair
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0204902C
	add r0, r4, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetBoxMonData
	cmp r0, #0
	bne _0204902C
	add r0, r4, #0
	mov r1, #7
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r1, r0, #0x10
	lsl r1, r1, #0x10
	ldr r0, [sp]
	lsr r1, r1, #0x10
	bl sub_020490A0
	cmp r0, #0
	beq _0204902C
	cmp r6, r0
	bge _0204902C
	add r6, r0, #0
	add r0, r5, r7
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x14]
_0204902C:
	add r5, r5, #1
	cmp r5, #0x1e
	blo _02048FDC
	ldr r0, [sp, #0x10]
	add r7, #0x1e
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #0x12
	blo _02048FDA
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _02049058
	cmp r6, #0
	bne _02049058
	ldr r0, [sp, #0xc]
	mov r1, #0
	strh r1, [r0]
	ldr r0, [sp, #8]
	strh r1, [r0]
	ldr r0, [sp, #4]
	strh r1, [r0]
	b _02049082
_02049058:
	ldr r0, [sp, #0x1c]
	cmp r0, r6
	blo _02049072
	ldr r1, [sp, #0x18]
	ldr r0, [sp, #0xc]
	strh r1, [r0]
	ldr r1, [sp, #0x1c]
	ldr r0, [sp, #8]
	strh r1, [r0]
	ldr r0, [sp, #4]
	mov r1, #0
	strh r1, [r0]
	b _02049082
_02049072:
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	strh r1, [r0]
	ldr r0, [sp, #8]
	mov r1, #1
	strh r6, [r0]
	ldr r0, [sp, #4]
	strh r1, [r0]
_02049082:
	mov r0, #0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02049088: .word 0x00000000
	thumb_func_end ScrCmd_504

	thumb_func_start ScrCmd_505
ScrCmd_505: ; 0x0204908C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl sub_02066CF4
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_505

	thumb_func_start sub_020490A0
sub_020490A0: ; 0x020490A0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r6, #0
	add r5, r0, #0
	add r4, r1, #0
	add r7, r6, #0
_020490AC:
	add r0, r5, #0
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	str r1, [sp]
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	ldr r0, [sp]
	cmp r0, r1
	bne _020490F8
	add r0, r5, #0
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r5, r0, #0x10
	add r0, r4, #0
	mov r1, #0xa
	bl _s32_div_f
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r6, #1
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	cmp r7, #5
	blo _020490AC
_020490F8:
	ldr r1, _02049108 ; =_021D416C
	ldr r0, [sp, #8]
	strh r0, [r1, #2]
	ldr r0, [sp, #4]
	strh r0, [r1]
	add r0, r6, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02049108: .word _021D416C
	thumb_func_end sub_020490A0
