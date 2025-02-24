	.include "asm/macros.inc"
	.include "MSL_Common_signal.inc"
	.include "global.inc"

	.bss

	.public signal_funcs
signal_funcs: ; 0x021E58C4
	.space 0x1C
	.size signal_funcs,.-signal_funcs

	.text

	arm_func_start raise
raise: ; 0x020E9450
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	cmp r5, #1
	blt _020E9468
	cmp r5, #7
	ble _020E9470
_020E9468:
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020E9470:
	ldr r0, _020E956C ; =__cs + 0xA8
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020E94A4
	ldr r0, _020E9570 ; =OSi_ThreadInfo
	ldr r1, _020E9574 ; =__cs_id
	ldr r2, [r0, #4]
	ldr r0, _020E9578 ; =__cs_ref
	ldr r3, [r2, #0x6c]
	mov r2, #1
	str r3, [r1, #0x1c]
	str r2, [r0, #0x1c]
	b _020E94FC
_020E94A4:
	ldr r0, _020E9570 ; =OSi_ThreadInfo
	ldr r1, _020E9574 ; =__cs_id
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x1c]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _020E94D4
	ldr r0, _020E9578 ; =__cs_ref
	ldr r1, [r0, #0x1c]
	add r1, r1, #1
	str r1, [r0, #0x1c]
	b _020E94FC
_020E94D4:
	ldr r0, _020E956C ; =__cs + 0xA8
	bl OS_LockMutex
	ldr r0, _020E9570 ; =OSi_ThreadInfo
	ldr r1, _020E9574 ; =__cs_id
	ldr r2, [r0, #4]
	ldr r0, _020E9578 ; =__cs_ref
	ldr r3, [r2, #0x6c]
	mov r2, #1
	str r3, [r1, #0x1c]
	str r2, [r0, #0x1c]
_020E94FC:
	ldr r1, _020E957C ; =signal_funcs
	sub r2, r5, #1
	ldr r4, [r1, r2, lsl #2]
	cmp r4, #1
	movne r0, #0
	strne r0, [r1, r2, lsl #2]
	ldr r0, _020E9578 ; =__cs_ref
	ldr r1, [r0, #0x1c]
	subs r1, r1, #1
	str r1, [r0, #0x1c]
	bne _020E9530
	ldr r0, _020E956C ; =__cs + 0xA8
	bl OS_UnlockMutex
_020E9530:
	cmp r4, #1
	beq _020E9544
	cmp r4, #0
	cmpeq r5, #1
	bne _020E954C
_020E9544:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020E954C:
	cmp r4, #0
	bne _020E955C
	mov r0, #0
	bl exit
_020E955C:
	mov r0, r5
	blx r4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E956C: .word __cs + 0xA8
_020E9570: .word OSi_ThreadInfo
_020E9574: .word __cs_id
_020E9578: .word __cs_ref
_020E957C: .word signal_funcs
	arm_func_end raise

	exception raise, 0x0131, 0x00200300
