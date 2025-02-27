	.include "asm/macros.inc"
	.include "MSL_ARM_pool_alloc_NITRO.inc"
	.include "global.inc"

	.text

	arm_func_start __sys_alloc
__sys_alloc: ; 0x020F0338
	ldr ip, _020F034C ; =OS_AllocFromHeap
	mov r2, r0
	mov r0, #0
	sub r1, r0, #1
	bx ip
	.align 2, 0
_020F034C: .word OS_AllocFromHeap
	arm_func_end __sys_alloc

	arm_func_start __sys_free
__sys_free: ; 0x020F0350
	ldr ip, _020F0364 ; =OS_FreeToHeap
	mov r2, r0
	mov r0, #0
	sub r1, r0, #1
	bx ip
	.align 2, 0
_020F0364: .word OS_FreeToHeap
	arm_func_end __sys_free
