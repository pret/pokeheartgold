	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start SavGymmick_Clear
SavGymmick_Clear: ; 0x0202AE8C
	ldr r3, _0202AE94 ; =MI_CpuFill8
	mov r1, #0
	mov r2, #0x24
	bx r3
	.balign 4, 0
_0202AE94: .word MI_CpuFill8
	thumb_func_end SavGymmick_Clear

	thumb_func_start SavGymmick_Init
SavGymmick_Init: ; 0x0202AE98
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl SavGymmick_Clear
	str r4, [r5]
	add r0, r5, #4
	pop {r3, r4, r5, pc}
	thumb_func_end SavGymmick_Init

	thumb_func_start SavGymmick_AssertMagic_GetData
SavGymmick_AssertMagic_GetData: ; 0x0202AEA8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, r1
	beq _0202AEB6
	bl GF_AssertFail
_0202AEB6:
	add r0, r4, #4
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end SavGymmick_AssertMagic_GetData

	thumb_func_start SavGymmick_GetType
SavGymmick_GetType: ; 0x0202AEBC
	ldr r0, [r0]
	bx lr
	thumb_func_end SavGymmick_GetType
