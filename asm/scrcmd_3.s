	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_834
ScrCmd_834: ; 0x020482F4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Save_Pokeathlon_get
	add r7, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r6, #0
	ldr r0, [r0, #0xc]
	add r4, r6, #0
	bl SavArray_Flags_get
	add r0, sp, #4
	bl GF_RTC_CopyDate
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_Pokedex_get
	bl Pokedex_GetNatDexFlag
	cmp r0, #0
	beq _0204834C
	ldr r0, [sp, #0x10]
	add r0, r0, #7
	lsl r1, r0, #2
	ldr r0, _02048394 ; =_0210FA04
	b _02048352
_0204834C:
	ldr r0, [sp, #0x10]
	lsl r1, r0, #2
	ldr r0, _02048394 ; =_0210FA04
_02048352:
	ldr r3, [r0, r1]
	ldr r0, _02048398 ; =0x0000FFFF
	mov r2, #0
_02048358:
	ldrh r1, [r3]
	cmp r1, r0
	beq _02048368
	add r2, r2, #1
	add r6, r6, #1
	add r3, r3, #4
	cmp r2, #0xc
	blt _02048358
_02048368:
	mov r5, #0
_0204836A:
	add r0, r7, #0
	add r1, r5, #0
	bl sub_02031AB8
	cmp r0, #0
	beq _02048378
	add r4, r4, #1
_02048378:
	add r5, r5, #1
	cmp r5, #0xc
	blt _0204836A
	cmp r6, r4
	bgt _02048388
	mov r1, #0
	ldr r0, [sp]
	b _0204838C
_02048388:
	ldr r0, [sp]
	mov r1, #1
_0204838C:
	strh r1, [r0]
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02048394: .word _0210FA04
_02048398: .word 0x0000FFFF
	thumb_func_end ScrCmd_834

	thumb_func_start ScrCmd_835
ScrCmd_835: ; 0x0204839C
	push {r4, r5, r6, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r4, #0x80
	add r6, r0, #0
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl Save_Pokeathlon_get
	add r5, r0, #0
	mov r4, #0
_020483C0:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02031A78
	cmp r0, #0
	beq _020483D2
	add r4, r4, #1
	cmp r4, #0x1b
	blt _020483C0
_020483D2:
	strh r4, [r6]
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_835
