	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start SavArray_Flags_sizeof
SavArray_Flags_sizeof: ; 0x020503B8
	ldr r0, _020503BC ; =0x0000044C
	bx lr
	.balign 4, 0
_020503BC: .word 0x0000044C
	thumb_func_end SavArray_Flags_sizeof

	thumb_func_start SavArray_Flags_init
SavArray_Flags_init: ; 0x020503C0
	ldr r3, _020503C8 ; =memset
	mov r1, #0
	ldr r2, _020503CC ; =0x0000044C
	bx r3
	.balign 4, 0
_020503C8: .word memset
_020503CC: .word 0x0000044C
	thumb_func_end SavArray_Flags_init

	thumb_func_start SavArray_Flags_get
SavArray_Flags_get: ; 0x020503D0
	ldr r3, _020503D8 ; =SavArray_get
	mov r1, #4
	bx r3
	nop
_020503D8: .word SavArray_get
	thumb_func_end SavArray_Flags_get

	thumb_func_start CheckFlagInArray
CheckFlagInArray: ; 0x020503DC
	push {r3, r4, r5, lr}
	add r4, r1, #0
	bl GetFlagAddr
	cmp r0, #0
	beq _02050402
	lsr r3, r4, #0x1f
	lsl r2, r4, #0x1d
	ldrb r5, [r0]
	sub r2, r2, r3
	mov r1, #0x1d
	ror r2, r1
	mov r0, #1
	add r1, r3, r2
	add r2, r0, #0
	lsl r2, r1
	add r1, r5, #0
	tst r1, r2
	bne _02050404
_02050402:
	mov r0, #0
_02050404:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end CheckFlagInArray

	thumb_func_start SetFlagInArray
SetFlagInArray: ; 0x02050408
	push {r4, r5, r6, lr}
	add r4, r1, #0
	bl GetFlagAddr
	cmp r0, #0
	beq _0205042C
	lsr r5, r4, #0x1f
	lsl r3, r4, #0x1d
	sub r3, r3, r5
	mov r2, #0x1d
	ror r3, r2
	mov r6, #1
	add r2, r5, r3
	add r3, r6, #0
	ldrb r1, [r0]
	lsl r3, r2
	orr r1, r3
	strb r1, [r0]
_0205042C:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end SetFlagInArray

	thumb_func_start ClearFlagInArray
ClearFlagInArray: ; 0x02050430
	push {r4, r5, r6, lr}
	add r4, r1, #0
	bl GetFlagAddr
	cmp r0, #0
	beq _02050458
	lsr r5, r4, #0x1f
	lsl r3, r4, #0x1d
	sub r3, r3, r5
	mov r2, #0x1d
	ror r3, r2
	mov r6, #1
	add r2, r5, r3
	add r3, r6, #0
	lsl r3, r2
	mov r2, #0xff
	ldrb r1, [r0]
	eor r2, r3
	and r1, r2
	strb r1, [r0]
_02050458:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ClearFlagInArray

	thumb_func_start GetFlagAddr
GetFlagAddr: ; 0x0205045C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	cmp r1, #0
	bne _02050468
	mov r0, #0
	pop {r3, r4, r5, pc}
_02050468:
	mov r0, #1
	lsl r0, r0, #0xe
	cmp r1, r0
	bhs _02050488
	mov r0, #0x5b
	lsr r4, r1, #3
	lsl r0, r0, #2
	cmp r4, r0
	blt _0205047E
	bl GF_AssertFail
_0205047E:
	mov r0, #0x2e
	lsl r0, r0, #4
	add r0, r5, r0
	add r0, r0, r4
	pop {r3, r4, r5, pc}
_02050488:
	sub r1, r1, r0
	asr r0, r1, #2
	lsr r0, r0, #0x1d
	add r0, r1, r0
	asr r4, r0, #3
	cmp r4, #8
	blt _0205049A
	bl GF_AssertFail
_0205049A:
	ldr r0, _020504A0 ; =0x021D4170
	add r0, r0, r4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020504A0: .word 0x021D4170
	thumb_func_end GetFlagAddr

	thumb_func_start GetVarAddr
GetVarAddr: ; 0x020504A4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #1
	lsl r0, r0, #0xe
	sub r4, r1, r0
	mov r0, #0x17
	lsl r0, r0, #4
	cmp r4, r0
	blt _020504BA
	bl GF_AssertFail
_020504BA:
	lsl r0, r4, #1
	add r0, r5, r0
	pop {r3, r4, r5, pc}
	thumb_func_end GetVarAddr
