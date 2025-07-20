	.include "asm/macros.inc"
	.include "MSL_Common_assert.inc"
	.include "global.inc"

	.data

__local_str__msl_assertion_failed: ; 0x021110B0
	.asciz "Assertion (%s) failed in \"%s\", function \"%s\", line %d\n"
	.size __local_str__msl_assertion_failed,.-__local_str__msl_assertion_failed
	.balign 4, 0

	.text

	arm_func_start __msl_assertion_failed
__msl_assertion_failed: ; 0x020E4A9C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	ldr r0, _020E4AD4 ; =__local_str__msl_assertion_failed
	mov r1, r4
	mov r2, lr
	mov r3, ip
	bl printf
	bl abort
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020E4AD4: .word __local_str__msl_assertion_failed
	arm_func_end __msl_assertion_failed

	exception __msl_assertion_failed, 0x003D, 0x00200100
