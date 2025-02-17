	.include "asm/macros.inc"
	.include "MSL_ARM_abort_exit.inc"
	.include "global.inc"

	.bss

	.public __console_exit
__console_exit: ; 0x021E5390
	.space 0x4
	.size __console_exit,.-__console_exit

	.public __stdio_exit
__stdio_exit: ; 0x021E5394
	.space 0x4
	.size __stdio_exit,.-__stdio_exit

	.public __atexit_curr_func
__atexit_curr_func: ; 0x021E5398
	.space 0x4
	.size __atexit_curr_func,.-__atexit_curr_func

	.public __aborting
__aborting: ; 0x021E539C
	.space 0x4
	.size __aborting,.-__aborting

	.public __atexit_funcs
__atexit_funcs:
	.space 0x100
	.size __atexit_funcs,.-__atexit_funcs

	.text

	arm_func_start abort
abort: ; 0x020E47C0
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl raise
	ldr r1, _020E47E0 ; =__aborting - 0xC
	mov r0, #1
	str r0, [r1, #0xc]
	bl exit
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E47E0: .word __aborting - 0xC
	arm_func_end abort

	arm_func_start exit
exit: ; 0x020E47E4
	stmdb sp!, {r4, lr}
	ldr r1, _020E482C ; =__aborting - 0xC
	mov r4, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _020E4820
	bl __destroy_global_chain
	ldr r0, _020E482C ; =__stdio_exit - 0x4
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020E4820
	blx r0
	ldr r0, _020E482C ; =__stdio_exit - 0x4
	mov r1, #0
	str r1, [r0, #4]
_020E4820:
	mov r0, r4
	bl __exit
	ldmia sp!, {r4, pc}
	.align 2, 0
_020E482C: .word __console_exit
	arm_func_end exit

	arm_func_start __exit
__exit: ; 0x020E4830
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020E4940 ; =__cs
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020E4868
	ldr r0, _020E4944 ; =OSi_ThreadInfo
	ldr r1, _020E4948 ; =__cs_id
	ldr r2, [r0, #4]
	ldr r0, _020E494C ; =__cs_ref
	ldr r3, [r2, #0x6c]
	mov r2, #1
	str r3, [r1]
	str r2, [r0]
	b _020E48C0
_020E4868:
	ldr r0, _020E4944 ; =OSi_ThreadInfo
	ldr r1, _020E4948 ; =__cs_id
	ldr r0, [r0, #4]
	ldr r1, [r1]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _020E4898
	ldr r0, _020E494C ; =__cs_ref
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	b _020E48C0
_020E4898:
	ldr r0, _020E4940 ; =__cs
	bl OS_LockMutex
	ldr r0, _020E4944 ; =OSi_ThreadInfo
	ldr r1, _020E4948 ; =__cs_id
	ldr r2, [r0, #4]
	ldr r0, _020E494C ; =__cs_ref
	ldr r3, [r2, #0x6c]
	mov r2, #1
	str r3, [r1]
	str r2, [r0]
_020E48C0:
	ldr r4, _020E4950 ; =__console_exit
	ldr r0, [r4, #8]
	cmp r0, #0
	ble _020E48F4
	ldr r5, _020E4954 ; =__atexit_funcs
_020E48D4:
	ldr r0, [r4, #8]
	sub r1, r0, #1
	ldr r0, [r5, r1, lsl #2]
	str r1, [r4, #8]
	blx r0
	ldr r0, [r4, #8]
	cmp r0, #0
	bgt _020E48D4
_020E48F4:
	ldr r0, _020E494C ; =__cs_ref
	ldr r1, [r0]
	subs r1, r1, #1
	str r1, [r0]
	bne _020E4910
	ldr r0, _020E4940 ; =__cs
	bl OS_UnlockMutex
_020E4910:
	ldr r0, _020E4950 ; =__console_exit
	ldr r0, [r0]
	cmp r0, #0
	beq _020E4930
	blx r0
	ldr r0, _020E4950 ; =__console_exit
	mov r1, #0
	str r1, [r0]
_020E4930:
	mov r0, #0
	bl fflush
	bl _ExitProcess
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E4940: .word __cs
_020E4944: .word OSi_ThreadInfo
_020E4948: .word __cs_id
_020E494C: .word __cs_ref
_020E4950: .word __console_exit
_020E4954: .word __atexit_funcs
	arm_func_end __exit

	exception abort, 0x0025, 0x00100000
	exception exit, 0x004D, 0x00100100
	exception __exit, 0x0129, 0x00200300
