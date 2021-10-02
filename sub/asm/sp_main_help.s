	.include "asm/macros.inc"
	.include "global.inc"

	.public PMi_Initialized

	.text

	; Merge into sp_main.c when decompiling

	arm_func_start GetRomValidLanguage
GetRomValidLanguage: ; 0x037F8488
	ldr r1, _037F84BC ; =0x027FFE1D
	mov r0, #0
	ldrb r1, [r1]
	cmp r1, #0x80
	orreq r0, r0, #0x40
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	bxeq lr
	cmp r1, #0x40
	orreq r0, r0, #0x80
	moveq r0, r0, lsl #0x10
	moveq r0, r0, lsr #0x10
	bx lr
	.align 2, 0
_037F84BC: .word 0x027FFE1D
	arm_func_end GetRomValidLanguage

	arm_func_start VBlankIntr
VBlankIntr: ; 0x037F84C0
	stmdb sp!, {r3, lr}
	ldr r0, _037F84E0 ; =PMi_Initialized
	ldr r0, [r0]
	cmp r0, #0
	beq _037F84D8
	bl PM_SelfBlinkProc
_037F84D8:
	ldmia sp!, {r3, lr}
	bx lr
	.align 2, 0
_037F84E0: .word PMi_Initialized
	arm_func_end VBlankIntr
