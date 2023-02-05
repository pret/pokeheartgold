	.include "asm/macros.inc"
	.include "msl.inc"
	.include "global.inc"
	.public __sinit__
	.public __exception_table_start__
	.public __exception_table_end__
	.type __sinit__, @function
	.public OSi_ThreadInfo
	.type OSi_ThreadInfo, @function

	.bss

	; msl
	.public _021E5390
	.type _021E5390, @function
_021E5390:
	.space 0x10

_021E53A0:
	.space 0x100

_021E54A0:
	.space 0x24

_021E54C4:
	.space 0x24

_021E54E8:
	.space 0x48

_021E5530:
	.space 0x60

_021E5590:
	.space 0x30

_021E55C0:
	.space 0x100

_021E56C0:
	.space 0x100

_021E57C0:
	.space 0x100

	.public _021E58C0
_021E58C0:
	.space 0x4

_021E58C4:
	.space 0x1C

	.public _ZSt7nothrow
_ZSt7nothrow:
	.space 0x4

_ZSt13__new_handler:
	.space 0x4

__global_destructor_chain: ; 0x021E58E8
	.space 4

	.text

	; MSL_C_NITRO_Ai_LE.a

	arm_func_start abort
abort: ; 0x020E47C0
	stmdb sp!, {r3, lr}
	mov r0, #1
	bl raise
	ldr r1, _020E47E0 ; =_021E5390
	mov r0, #1
	str r0, [r1, #0xc]
	bl exit
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E47E0: .word _021E5390
	arm_func_end abort

	arm_func_start exit
exit: ; 0x020E47E4
	stmdb sp!, {r4, lr}
	ldr r1, _020E482C ; =_021E5390
	mov r4, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _020E4820
	bl __destroy_global_chain
	ldr r0, _020E482C ; =_021E5390
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _020E4820
	blx r0
	ldr r0, _020E482C ; =_021E5390
	mov r1, #0
	str r1, [r0, #4]
_020E4820:
	mov r0, r4
	bl __exit
	ldmia sp!, {r4, pc}
	.align 2, 0
_020E482C: .word _021E5390
	arm_func_end exit

	arm_func_start __exit
__exit: ; 0x020E4830
	stmdb sp!, {r3, r4, r5, lr}
	ldr r0, _020E4940 ; =_021E54E8
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020E4868
	ldr r0, _020E4944 ; =OSi_ThreadInfo
	ldr r1, _020E4948 ; =_021E54A0
	ldr r2, [r0, #4]
	ldr r0, _020E494C ; =_021E54C4
	ldr r3, [r2, #0x6c]
	mov r2, #1
	str r3, [r1]
	str r2, [r0]
	b _020E48C0
_020E4868:
	ldr r0, _020E4944 ; =OSi_ThreadInfo
	ldr r1, _020E4948 ; =_021E54A0
	ldr r0, [r0, #4]
	ldr r1, [r1]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _020E4898
	ldr r0, _020E494C ; =_021E54C4
	ldr r1, [r0]
	add r1, r1, #1
	str r1, [r0]
	b _020E48C0
_020E4898:
	ldr r0, _020E4940 ; =_021E54E8
	bl OS_LockMutex
	ldr r0, _020E4944 ; =OSi_ThreadInfo
	ldr r1, _020E4948 ; =_021E54A0
	ldr r2, [r0, #4]
	ldr r0, _020E494C ; =_021E54C4
	ldr r3, [r2, #0x6c]
	mov r2, #1
	str r3, [r1]
	str r2, [r0]
_020E48C0:
	ldr r4, _020E4950 ; =_021E5390
	ldr r0, [r4, #8]
	cmp r0, #0
	ble _020E48F4
	ldr r5, _020E4954 ; =_021E53A0
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
	ldr r0, _020E494C ; =_021E54C4
	ldr r1, [r0]
	subs r1, r1, #1
	str r1, [r0]
	bne _020E4910
	ldr r0, _020E4940 ; =_021E54E8
	bl OS_UnlockMutex
_020E4910:
	ldr r0, _020E4950 ; =_021E5390
	ldr r0, [r0]
	cmp r0, #0
	beq _020E4930
	blx r0
	ldr r0, _020E4950 ; =_021E5390
	mov r1, #0
	str r1, [r0]
_020E4930:
	mov r0, #0
	bl fflush
	bl _ExitProcess
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E4940: .word _021E54E8
_020E4944: .word OSi_ThreadInfo
_020E4948: .word _021E54A0
_020E494C: .word _021E54C4
_020E4950: .word _021E5390
_020E4954: .word _021E53A0
	arm_func_end __exit

	arm_func_start nan
nan: ; 0x020E4958
	ldr r0, _020E4968 ; =_021110EC
	ldr ip, _020E496C ; =_f2d
	ldr r0, [r0]
	bx ip
	.align 2, 0
_020E4968: .word _021110EC
_020E496C: .word _f2d
	arm_func_end nan

	arm_func_start malloc
malloc: ; 0x020E4970
	stmdb sp!, {r3, lr}
	cmp r0, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	bl __sys_alloc
	ldmia sp!, {r3, pc}
	arm_func_end malloc

	arm_func_start free
free: ; 0x020E4988
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl __sys_free
	ldmia sp!, {r3, pc}
	arm_func_end free

	arm_func_start __flush_line_buffered_output_files
__flush_line_buffered_output_files: ; 0x020E499C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _020E4A24 ; =_02110FCC
	mov r4, #0
	mov r5, #1
	mov r8, r0
	mvn sb, #0
	mov r7, r4
	mov r6, #0x4c
_020E49BC:
	ldr r1, [r0, #4]
	mov r2, r1, lsl #0x16
	movs r2, r2, lsr #0x1d
	beq _020E49FC
	mov r1, r1, lsl #0x19
	mov r1, r1, lsr #0x1e
	tst r1, #1
	beq _020E49FC
	ldr r1, [r0, #8]
	mov r1, r1, lsl #0x1d
	mov r1, r1, lsr #0x1d
	cmp r1, #1
	bne _020E49FC
	bl fflush
	cmp r0, #0
	movne r4, sb
_020E49FC:
	cmp r5, #3
	movge r0, r7
	bge _020E4A14
	mul r0, r5, r6
	add r5, r5, #1
	add r0, r8, r0
_020E4A14:
	cmp r0, #0
	bne _020E49BC
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020E4A24: .word _02110FCC
	arm_func_end __flush_line_buffered_output_files

	arm_func_start __flush_all
__flush_all: ; 0x020E4A28
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r0, _020E4A8C ; =_02110FCC
	mov r4, #0
	mov r5, #1
	mov r8, r0
	mvn sb, #0
	mov r7, r4
	mov r6, #0x4c
_020E4A48:
	ldr r1, [r0, #4]
	mov r1, r1, lsl #0x16
	movs r1, r1, lsr #0x1d
	beq _020E4A64
	bl fflush
	cmp r0, #0
	movne r4, sb
_020E4A64:
	cmp r5, #3
	movge r0, r7
	bge _020E4A7C
	mul r0, r5, r6
	add r5, r5, #1
	add r0, r8, r0
_020E4A7C:
	cmp r0, #0
	bne _020E4A48
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020E4A8C: .word _02110FCC
	arm_func_end __flush_all

	arm_func_start abs
abs: ; 0x020E4A90
	cmp r0, #0
	rsblt r0, r0, #0
	bx lr
	arm_func_end abs

	arm_func_start __msl_assertion_failed
__msl_assertion_failed: ; 0x020E4A9C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r0
	mov lr, r1
	mov ip, r2
	str r3, [sp]
	ldr r0, _020E4AD4 ; =_021110B0
	mov r1, r4
	mov r2, lr
	mov r3, ip
	bl printf
	bl abort
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	.align 2, 0
_020E4AD4: .word _021110B0
	arm_func_end __msl_assertion_failed

	arm_func_start __convert_from_newlines
__convert_from_newlines: ; 0x020E4AD8
	bx lr
	arm_func_end __convert_from_newlines

	arm_func_start __convert_to_newlines
__convert_to_newlines: ; 0x020E4ADC
	bx lr
	arm_func_end __convert_to_newlines

	arm_func_start __prep_buffer
__prep_buffer: ; 0x020E4AE0
	ldr r1, [r0, #0x1c]
	str r1, [r0, #0x24]
	ldr r3, [r0, #0x20]
	str r3, [r0, #0x28]
	ldr r2, [r0, #0x18]
	ldr r1, [r0, #0x2c]
	and r1, r2, r1
	sub r1, r3, r1
	str r1, [r0, #0x28]
	ldr r1, [r0, #0x18]
	str r1, [r0, #0x34]
	bx lr
	arm_func_end __prep_buffer

	arm_func_start __load_buffer
__load_buffer: ; 0x020E4B10
	stmdb sp!, {r4, r5, r6, lr}
	mov r5, r2
	mov r4, r0
	mov r6, r1
	bl __prep_buffer
	cmp r5, #1
	ldreq r0, [r4, #0x20]
	add r2, r4, #0x28
	streq r0, [r4, #0x28]
	ldr r0, [r4]
	ldr r1, [r4, #0x1c]
	ldr r3, [r4, #0x48]
	ldr ip, [r4, #0x3c]
	blx ip
	cmp r0, #2
	moveq r1, #0
	streq r1, [r4, #0x28]
	cmp r6, #0
	ldrne r1, [r4, #0x28]
	strne r1, [r6]
	cmp r0, #0
	ldmneia sp!, {r4, r5, r6, pc}
	ldr r1, [r4, #0x18]
	ldr r0, [r4, #0x28]
	add r0, r1, r0
	str r0, [r4, #0x18]
	ldr r0, [r4, #4]
	mov r0, r0, lsl #0x13
	movs r0, r0, lsr #0x1f
	bne _020E4B94
	ldr r0, [r4, #0x1c]
	add r1, r4, #0x28
	bl __convert_to_newlines
_020E4B94:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end __load_buffer

	arm_func_start __flush_buffer
__flush_buffer: ; 0x020E4B9C
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r2, [r5, #0x24]
	ldr r0, [r5, #0x1c]
	mov r4, r1
	subs r0, r2, r0
	beq _020E4C14
	str r0, [r5, #0x28]
	ldr r0, [r5, #4]
	mov r0, r0, lsl #0x13
	movs r0, r0, lsr #0x1f
	bne _020E4BD8
	ldr r0, [r5, #0x1c]
	add r1, r5, #0x28
	bl __convert_from_newlines
_020E4BD8:
	ldr r0, [r5]
	ldr r1, [r5, #0x1c]
	ldr r3, [r5, #0x48]
	ldr ip, [r5, #0x40]
	add r2, r5, #0x28
	blx ip
	cmp r4, #0
	ldrne r1, [r5, #0x28]
	strne r1, [r4]
	cmp r0, #0
	ldmneia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #0x18]
	ldr r0, [r5, #0x28]
	add r0, r1, r0
	str r0, [r5, #0x18]
_020E4C14:
	mov r0, r5
	bl __prep_buffer
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __flush_buffer

	arm_func_start fread
fread: ; 0x020E4C24
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	ldr r4, _020E4D1C ; =_02110FCC
	mov r7, r3
	cmp r7, r4
	moveq r6, #2
	mov sl, r0
	movne r6, #5
	mov r0, #0x18
	mul r4, r6, r0
	ldr r5, _020E4D20 ; =_021E54E8
	mov sb, r1
	add r0, r5, r4
	mov r8, r2
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020E4C88
	ldr r0, _020E4D24 ; =OSi_ThreadInfo
	ldr r2, _020E4D28 ; =_021E54A0
	ldr r1, [r0, #4]
	ldr r0, _020E4D2C ; =_021E54C4
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
	b _020E4CE0
_020E4C88:
	ldr r0, _020E4D24 ; =OSi_ThreadInfo
	ldr r1, _020E4D28 ; =_021E54A0
	ldr r0, [r0, #4]
	ldr r1, [r1, r6, lsl #2]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _020E4CB8
	ldr r1, _020E4D2C ; =_021E54C4
	ldr r0, [r1, r6, lsl #2]
	add r0, r0, #1
	str r0, [r1, r6, lsl #2]
	b _020E4CE0
_020E4CB8:
	add r0, r5, r4
	bl OS_LockMutex
	ldr r0, _020E4D24 ; =OSi_ThreadInfo
	ldr r2, _020E4D28 ; =_021E54A0
	ldr r1, [r0, #4]
	ldr r0, _020E4D2C ; =_021E54C4
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
_020E4CE0:
	mov r0, sl
	mov r1, sb
	mov r2, r8
	mov r3, r7
	bl __fread
	ldr r1, _020E4D2C ; =_021E54C4
	mov r7, r0
	ldr r0, [r1, r6, lsl #2]
	subs r0, r0, #1
	str r0, [r1, r6, lsl #2]
	bne _020E4D14
	add r0, r5, r4
	bl OS_UnlockMutex
_020E4D14:
	mov r0, r7
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020E4D1C: .word _02110FCC
_020E4D20: .word _021E54E8
_020E4D24: .word OSi_ThreadInfo
_020E4D28: .word _021E54A0
_020E4D2C: .word _021E54C4
	arm_func_end fread

	arm_func_start __fread
__fread: ; 0x020E4D30
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #4
	mov r7, r3
	mov sb, r0
	mov r8, r1
	mov r0, r7
	mov r1, #0
	mov r4, r2
	bl fwide
	cmp r0, #0
	bne _020E4D68
	mov r0, r7
	mvn r1, #0
	bl fwide
_020E4D68:
	muls r4, r8, r4
	beq _020E4D8C
	ldrb r0, [r7, #0xd]
	cmp r0, #0
	bne _020E4D8C
	ldr r1, [r7, #4]
	mov r0, r1, lsl #0x16
	movs r0, r0, lsr #0x1d
	bne _020E4D98
_020E4D8C:
	add sp, sp, #4
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020E4D98:
	mov r0, r1, lsl #0x13
	movs r0, r0, lsr #0x1f
	movne r0, r1, lsl #0x19
	movne r0, r0, lsr #0x1e
	ldr r1, [r7, #8]
	cmpne r0, #2
	mov r6, #1
	mov r0, r1, lsl #0x1d
	movne r6, #0
	movs r0, r0, lsr #0x1d
	bne _020E4DEC
	ldr r0, [r7, #4]
	mov r0, r0, lsl #0x1b
	mov r0, r0, lsr #0x1d
	tst r0, #1
	beq _020E4DEC
	bic r0, r1, #7
	orr r0, r0, #2
	str r0, [r7, #8]
	mov r0, #0
	str r0, [r7, #0x28]
_020E4DEC:
	ldr r0, [r7, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #2
	bhs _020E4E18
	mov r0, #1
	strb r0, [r7, #0xd]
	mov r0, #0
	add sp, sp, #4
	str r0, [r7, #0x28]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020E4E18:
	ldr r0, [r7, #4]
	mov r0, r0, lsl #0x19
	mov r0, r0, lsr #0x1e
	tst r0, #1
	beq _020E4E50
	bl __flush_line_buffered_output_files
	cmp r0, #0
	beq _020E4E50
	mov r0, #1
	strb r0, [r7, #0xd]
	mov r0, #0
	add sp, sp, #4
	str r0, [r7, #0x28]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
_020E4E50:
	cmp r4, #0
	mov r5, #0
	beq _020E4F14
	ldr r0, [r7, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #3
	blo _020E4F14
	mov sl, r5
_020E4E74:
	mov r0, r7
	mov r1, sl
	bl fwide
	cmp r0, #1
	ldr r0, [r7, #8]
	bne _020E4EA8
	mov r0, r0, lsl #0x1d
	add r0, r7, r0, lsr #28
	ldrh r0, [r0, #0xe]
	add r5, r5, #2
	sub r4, r4, #2
	strh r0, [sb], #2
	b _020E4EC0
_020E4EA8:
	mov r0, r0, lsl #0x1d
	add r0, r7, r0, lsr #29
	ldrb r0, [r0, #0xf]
	add r5, r5, #1
	sub r4, r4, #1
	strb r0, [sb], #1
_020E4EC0:
	ldr r1, [r7, #8]
	cmp r4, #0
	mov r0, r1, lsl #0x1d
	mov r0, r0, lsr #0x1d
	sub r0, r0, #1
	bic r1, r1, #7
	and r0, r0, #7
	orr r0, r1, r0
	str r0, [r7, #8]
	beq _020E4EFC
	ldr r0, [r7, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #3
	bhs _020E4E74
_020E4EFC:
	ldr r0, [r7, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #2
	ldreq r0, [r7, #0x30]
	streq r0, [r7, #0x28]
_020E4F14:
	cmp r4, #0
	beq _020E4FD8
	ldr r0, [r7, #0x28]
	cmp r0, #0
	cmpeq r6, #0
	beq _020E4FD8
	mov sl, #0
_020E4F30:
	ldr r0, [r7, #0x28]
	cmp r0, #0
	bne _020E4F84
	mov r0, r7
	mov r1, sl
	mov r2, sl
	bl __load_buffer
	cmp r0, #0
	beq _020E4F84
	cmp r0, #1
	mov r0, #1
	streqb r0, [r7, #0xd]
	beq _020E4F74
	ldr r1, [r7, #8]
	bic r1, r1, #7
	str r1, [r7, #8]
	strb r0, [r7, #0xc]
_020E4F74:
	mov r0, #0
	str r0, [r7, #0x28]
	mov r4, #0
	b _020E4FD8
_020E4F84:
	ldr r0, [r7, #0x28]
	str r0, [sp]
	cmp r0, r4
	strhi r4, [sp]
	ldr r1, [r7, #0x24]
	ldr r2, [sp]
	mov r0, sb
	bl memcpy
	ldr r2, [sp]
	ldr r0, [r7, #0x24]
	subs r4, r4, r2
	add r0, r0, r2
	str r0, [r7, #0x24]
	ldr r1, [r7, #0x28]
	ldr r0, [sp]
	add sb, sb, r2
	sub r0, r1, r0
	add r5, r5, r2
	str r0, [r7, #0x28]
	cmpne r6, #0
	bne _020E4F30
_020E4FD8:
	cmp r4, #0
	beq _020E5064
	cmp r6, #0
	bne _020E5064
	ldr r6, [r7, #0x1c]
	ldr sl, [r7, #0x20]
	add r1, sp, #0
	str sb, [r7, #0x1c]
	mov r0, r7
	mov r2, #1
	str r4, [r7, #0x20]
	bl __load_buffer
	cmp r0, #0
	beq _020E5044
	cmp r0, #1
	mov r0, #1
	bne _020E502C
	strb r0, [r7, #0xd]
	mov r0, #0
	str r0, [r7, #0x28]
	b _020E5044
_020E502C:
	ldr r1, [r7, #8]
	bic r1, r1, #7
	str r1, [r7, #8]
	strb r0, [r7, #0xc]
	mov r0, #0
	str r0, [r7, #0x28]
_020E5044:
	ldr r1, [sp]
	mov r0, r7
	str r6, [r7, #0x1c]
	str sl, [r7, #0x20]
	add r5, r5, r1
	bl __prep_buffer
	mov r0, #0
	str r0, [r7, #0x28]
_020E5064:
	mov r0, r5
	mov r1, r8
	bl _u32_div_f
	add sp, sp, #4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, pc}
	arm_func_end __fread

	arm_func_start __fwrite
__fwrite: ; 0x020E5078
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #8
	mov sb, r3
	mov sl, r0
	str r1, [sp]
	mov r0, sb
	mov r1, #0
	mov r4, r2
	bl fwide
	cmp r0, #0
	bne _020E50B0
	mov r0, sb
	mvn r1, #0
	bl fwide
_020E50B0:
	ldr r0, [sp]
	muls r5, r0, r4
	beq _020E50D8
	ldrb r0, [sb, #0xd]
	cmp r0, #0
	bne _020E50D8
	ldr r1, [sb, #4]
	mov r0, r1, lsl #0x16
	movs r0, r0, lsr #0x1d
	bne _020E50E4
_020E50D8:
	add sp, sp, #8
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020E50E4:
	mov r0, r1, lsl #0x13
	movs r0, r0, lsr #0x1f
	movne r0, r1, lsl #0x19
	movne r0, r0, lsr #0x1e
	cmpne r0, #2
	ldr r1, [sb, #8]
	cmpne r0, #1
	mov r8, #1
	mov r0, r1, lsl #0x1d
	movne r8, #0
	movs r0, r0, lsr #0x1d
	bne _020E513C
	ldr r0, [sb, #4]
	mov r0, r0, lsl #0x1b
	mov r0, r0, lsr #0x1d
	tst r0, #2
	beq _020E513C
	bic r0, r1, #7
	orr r1, r0, #1
	mov r0, sb
	str r1, [sb, #8]
	bl __prep_buffer
_020E513C:
	ldr r0, [sb, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #1
	beq _020E5168
	mov r0, #1
	strb r0, [sb, #0xd]
	mov r0, #0
	add sp, sp, #8
	str r0, [sb, #0x28]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020E5168:
	cmp r5, #0
	mov r6, #0
	beq _020E5290
	ldr r0, [sb, #0x1c]
	ldr r2, [sb, #0x24]
	cmp r2, r0
	cmpeq r8, #0
	beq _020E5290
	ldr r1, [sb, #0x20]
	sub r0, r2, r0
	sub r0, r1, r0
	str r0, [sb, #0x28]
	mov fp, #0xa
	mov r4, #0
_020E51A0:
	ldr r0, [sb, #0x28]
	mov r7, r4
	str r0, [sp, #4]
	cmp r0, r5
	strhi r5, [sp, #4]
	ldr r0, [sb, #4]
	mov r0, r0, lsl #0x19
	mov r0, r0, lsr #0x1e
	cmp r0, #1
	bne _020E51F0
	ldr r2, [sp, #4]
	cmp r2, #0
	beq _020E51F0
	mov r0, sl
	mov r1, fp
	bl __memrchr
	movs r7, r0
	addne r0, r7, #1
	subne r0, r0, sl
	strne r0, [sp, #4]
_020E51F0:
	ldr r2, [sp, #4]
	cmp r2, #0
	beq _020E5230
	ldr r0, [sb, #0x24]
	mov r1, sl
	bl memcpy
	ldr r2, [sp, #4]
	ldr r0, [sb, #0x24]
	add sl, sl, r2
	add r0, r0, r2
	str r0, [sb, #0x24]
	ldr r1, [sb, #0x28]
	ldr r0, [sp, #4]
	sub r5, r5, r2
	sub r0, r1, r0
	str r0, [sb, #0x28]
_020E5230:
	ldr r0, [sb, #0x28]
	cmp r0, #0
	beq _020E5254
	cmp r7, #0
	bne _020E5254
	ldr r0, [sb, #4]
	mov r0, r0, lsl #0x19
	movs r0, r0, lsr #0x1e
	bne _020E527C
_020E5254:
	mov r0, sb
	mov r1, #0
	bl __flush_buffer
	cmp r0, #0
	beq _020E527C
	mov r0, #1
	strb r0, [sb, #0xd]
	mov r5, #0
	str r5, [sb, #0x28]
	b _020E5290
_020E527C:
	ldr r0, [sp, #4]
	cmp r5, #0
	add r6, r6, r0
	cmpne r8, #0
	bne _020E51A0
_020E5290:
	cmp r5, #0
	beq _020E52FC
	cmp r8, #0
	bne _020E52FC
	ldr r4, [sb, #0x1c]
	ldr r7, [sb, #0x20]
	add r2, sl, r5
	str sl, [sb, #0x1c]
	str r5, [sb, #0x20]
	add r1, sp, #4
	mov r0, sb
	str r2, [sb, #0x24]
	bl __flush_buffer
	cmp r0, #0
	ldreq r0, [sp, #4]
	addeq r6, r6, r0
	beq _020E52E4
	mov r0, #1
	strb r0, [sb, #0xd]
	mov r0, #0
	str r0, [sb, #0x28]
_020E52E4:
	str r4, [sb, #0x1c]
	mov r0, sb
	str r7, [sb, #0x20]
	bl __prep_buffer
	mov r0, #0
	str r0, [sb, #0x28]
_020E52FC:
	ldr r0, [sb, #4]
	ldr r1, [sp]
	mov r0, r0, lsl #0x19
	mov r0, r0, lsr #0x1e
	cmp r0, #2
	movne r0, #0
	strne r0, [sb, #0x28]
	mov r0, r6
	bl _u32_div_f
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end __fwrite

	arm_func_start fclose
fclose: ; 0x020E5328
	stmdb sp!, {r3, r4, r5, lr}
	movs r5, r0
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldr r1, [r5, #4]
	mov r1, r1, lsl #0x16
	movs r1, r1, lsr #0x1d
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	bl fflush
	mov r4, r0
	ldr r0, [r5]
	ldr r1, [r5, #0x44]
	blx r1
	ldr r1, [r5, #4]
	mov r2, #0
	bic r1, r1, #0x380
	str r1, [r5, #4]
	str r2, [r5]
	ldr r1, [r5, #8]
	mov r1, r1, lsl #0x1c
	movs r1, r1, lsr #0x1f
	subne r0, r2, #1
	ldmneia sp!, {r3, r4, r5, pc}
	cmp r4, #0
	cmpeq r0, #0
	movne r2, #1
	rsb r0, r2, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end fclose

	arm_func_start fflush
fflush: ; 0x020E539C
	stmdb sp!, {r4, lr}
	movs r4, r0
	bne _020E53B0
	bl __flush_all
	ldmia sp!, {r4, pc}
_020E53B0:
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	bne _020E53CC
	ldr r0, [r4, #4]
	mov r1, r0, lsl #0x16
	movs r1, r1, lsr #0x1d
	bne _020E53D4
_020E53CC:
	mvn r0, #0
	ldmia sp!, {r4, pc}
_020E53D4:
	mov r0, r0, lsl #0x1b
	mov r0, r0, lsr #0x1d
	cmp r0, #1
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	ldr r0, [r4, #8]
	mov r1, r0, lsl #0x1d
	mov r1, r1, lsr #0x1d
	cmp r1, #3
	bichs r0, r0, #7
	orrhs r0, r0, #2
	strhs r0, [r4, #8]
	ldr r0, [r4, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	cmp r0, #2
	moveq r0, #0
	streq r0, [r4, #0x28]
	ldr r0, [r4, #8]
	mov r1, r0, lsl #0x1d
	mov r1, r1, lsr #0x1d
	cmp r1, #1
	beq _020E5440
	bic r0, r0, #7
	str r0, [r4, #8]
	mov r0, #0
	ldmia sp!, {r4, pc}
_020E5440:
	mov r0, r4
	mov r1, #0
	bl __flush_buffer
	cmp r0, #0
	mov r0, #0
	beq _020E546C
	mov r1, #1
	strb r1, [r4, #0xd]
	str r0, [r4, #0x28]
	sub r0, r0, #1
	ldmia sp!, {r4, pc}
_020E546C:
	ldr r1, [r4, #8]
	bic r1, r1, #7
	str r1, [r4, #8]
	str r0, [r4, #0x18]
	str r0, [r4, #0x28]
	ldmia sp!, {r4, pc}
	arm_func_end fflush

	arm_func_start _ftell
_ftell: ; 0x020E5484
	ldr r1, [r0, #4]
	mov r1, r1, lsl #0x16
	mov r1, r1, lsr #0x1d
	and r1, r1, #0xff
	add r1, r1, #0xff
	and r1, r1, #0xff
	cmp r1, #1
	bhi _020E54B0
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	beq _020E54C4
_020E54B0:
	ldr r0, _020E54FC ; =_021E58C0
	mov r1, #0x28
	str r1, [r0]
	sub r0, r1, #0x29
	bx lr
_020E54C4:
	ldr r1, [r0, #8]
	mov r1, r1, lsl #0x1d
	movs ip, r1, lsr #0x1d
	ldreq r0, [r0, #0x18]
	bxeq lr
	ldr r2, [r0, #0x24]
	ldr r1, [r0, #0x1c]
	ldr r3, [r0, #0x34]
	sub r0, r2, r1
	cmp ip, #3
	add r0, r3, r0
	subhs r1, ip, #2
	subhs r0, r0, r1
	bx lr
	.align 2, 0
_020E54FC: .word _021E58C0
	arm_func_end _ftell

	arm_func_start ftell
ftell: ; 0x020E5500
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	ldr r1, _020E5600 ; =_02110FCC
	mov r7, r0
	cmp r7, r1
	moveq r6, #2
	beq _020E5538
	ldr r0, _020E5604 ; =_02111018
	cmp r7, r0
	moveq r6, #3
	beq _020E5538
	ldr r0, _020E5608 ; =_02111064
	cmp r7, r0
	moveq r6, #4
	movne r6, #5
_020E5538:
	mov r0, #0x18
	mul r4, r6, r0
	ldr r5, _020E560C ; =_021E54E8
	add r0, r5, r4
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020E5578
	ldr r0, _020E5610 ; =OSi_ThreadInfo
	ldr r2, _020E5614 ; =_021E54A0
	ldr r1, [r0, #4]
	ldr r0, _020E5618 ; =_021E54C4
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
	b _020E55D0
_020E5578:
	ldr r0, _020E5610 ; =OSi_ThreadInfo
	ldr r1, _020E5614 ; =_021E54A0
	ldr r0, [r0, #4]
	ldr r1, [r1, r6, lsl #2]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _020E55A8
	ldr r1, _020E5618 ; =_021E54C4
	ldr r0, [r1, r6, lsl #2]
	add r0, r0, #1
	str r0, [r1, r6, lsl #2]
	b _020E55D0
_020E55A8:
	add r0, r5, r4
	bl OS_LockMutex
	ldr r0, _020E5610 ; =OSi_ThreadInfo
	ldr r2, _020E5614 ; =_021E54A0
	ldr r1, [r0, #4]
	ldr r0, _020E5618 ; =_021E54C4
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
_020E55D0:
	mov r0, r7
	bl _ftell
	ldr r1, _020E5618 ; =_021E54C4
	mov r7, r0
	ldr r0, [r1, r6, lsl #2]
	subs r0, r0, #1
	str r0, [r1, r6, lsl #2]
	bne _020E55F8
	add r0, r5, r4
	bl OS_UnlockMutex
_020E55F8:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020E5600: .word _02110FCC
_020E5604: .word _02111018
_020E5608: .word _02111064
_020E560C: .word _021E54E8
_020E5610: .word OSi_ThreadInfo
_020E5614: .word _021E54A0
_020E5618: .word _021E54C4
	arm_func_end ftell

	arm_func_start _fseek
_fseek: ; 0x020E561C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	ldr r1, [r5, #4]
	mov r4, r2
	mov r1, r1, lsl #0x16
	mov r1, r1, lsr #0x1d
	and r1, r1, #0xff
	cmp r1, #1
	ldreqb r1, [r5, #0xd]
	cmpeq r1, #0
	beq _020E5668
	ldr r0, _020E5800 ; =_021E58C0
	mov r1, #0x28
	str r1, [r0]
	sub r0, r1, #0x29
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_020E5668:
	ldr r1, [r5, #8]
	mov r1, r1, lsl #0x1d
	mov r1, r1, lsr #0x1d
	cmp r1, #1
	bne _020E56B8
	mov r1, #0
	bl __flush_buffer
	cmp r0, #0
	beq _020E56B8
	mov r0, #1
	strb r0, [r5, #0xd]
	mov r2, #0
	ldr r0, _020E5800 ; =_021E58C0
	mov r1, #0x28
	str r2, [r5, #0x28]
	str r1, [r0]
	sub r0, r1, #0x29
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_020E56B8:
	cmp r4, #1
	bne _020E56D8
	mov r0, r5
	mov r4, #0
	bl _ftell
	ldr r1, [sp, #0x14]
	add r0, r1, r0
	str r0, [sp, #0x14]
_020E56D8:
	cmp r4, #2
	beq _020E576C
	ldr r0, [r5, #4]
	mov r0, r0, lsl #0x1b
	mov r0, r0, lsr #0x1d
	cmp r0, #3
	beq _020E576C
	ldr r0, [r5, #8]
	mov r0, r0, lsl #0x1d
	mov r0, r0, lsr #0x1d
	sub r0, r0, #2
	cmp r0, #1
	bhi _020E576C
	ldr r2, [sp, #0x14]
	ldr r0, [r5, #0x18]
	cmp r2, r0
	bhs _020E5728
	ldr r0, [r5, #0x34]
	cmp r2, r0
	bhs _020E5738
_020E5728:
	ldr r0, [r5, #8]
	bic r0, r0, #7
	str r0, [r5, #8]
	b _020E5778
_020E5738:
	ldr r1, [r5, #0x1c]
	sub r0, r2, r0
	add r0, r1, r0
	str r0, [r5, #0x24]
	ldr r1, [r5, #0x18]
	ldr r0, [sp, #0x14]
	sub r0, r1, r0
	str r0, [r5, #0x28]
	ldr r0, [r5, #8]
	bic r0, r0, #7
	orr r0, r0, #2
	str r0, [r5, #8]
	b _020E5778
_020E576C:
	ldr r0, [r5, #8]
	bic r0, r0, #7
	str r0, [r5, #8]
_020E5778:
	ldr r0, [r5, #8]
	mov r0, r0, lsl #0x1d
	movs r0, r0, lsr #0x1d
	bne _020E57F0
	ldr ip, [r5, #0x38]
	cmp ip, #0
	beq _020E57DC
	ldr r0, [r5]
	ldr r3, [r5, #0x48]
	add r1, sp, #0x14
	mov r2, r4
	blx ip
	cmp r0, #0
	beq _020E57DC
	mov r0, #1
	strb r0, [r5, #0xd]
	mov r2, #0
	ldr r0, _020E5800 ; =_021E58C0
	mov r1, #0x28
	str r2, [r5, #0x28]
	str r1, [r0]
	sub r0, r1, #0x29
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
_020E57DC:
	mov r1, #0
	strb r1, [r5, #0xc]
	ldr r0, [sp, #0x14]
	str r0, [r5, #0x18]
	str r1, [r5, #0x28]
_020E57F0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E5800: .word _021E58C0
	arm_func_end _fseek

	arm_func_start fseek
fseek: ; 0x020E5804
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	ldr r3, _020E5914 ; =_02110FCC
	mov sb, r0
	cmp sb, r3
	mov r8, r1
	mov r7, r2
	moveq r6, #2
	beq _020E5844
	ldr r0, _020E5918 ; =_02111018
	cmp sb, r0
	moveq r6, #3
	beq _020E5844
	ldr r0, _020E591C ; =_02111064
	cmp sb, r0
	moveq r6, #4
	movne r6, #5
_020E5844:
	mov r0, #0x18
	mul r4, r6, r0
	ldr r5, _020E5920 ; =_021E54E8
	add r0, r5, r4
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020E5884
	ldr r0, _020E5924 ; =OSi_ThreadInfo
	ldr r2, _020E5928 ; =_021E54A0
	ldr r1, [r0, #4]
	ldr r0, _020E592C ; =_021E54C4
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
	b _020E58DC
_020E5884:
	ldr r0, _020E5924 ; =OSi_ThreadInfo
	ldr r1, _020E5928 ; =_021E54A0
	ldr r0, [r0, #4]
	ldr r1, [r1, r6, lsl #2]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _020E58B4
	ldr r1, _020E592C ; =_021E54C4
	ldr r0, [r1, r6, lsl #2]
	add r0, r0, #1
	str r0, [r1, r6, lsl #2]
	b _020E58DC
_020E58B4:
	add r0, r5, r4
	bl OS_LockMutex
	ldr r0, _020E5924 ; =OSi_ThreadInfo
	ldr r2, _020E5928 ; =_021E54A0
	ldr r1, [r0, #4]
	ldr r0, _020E592C ; =_021E54C4
	ldr r3, [r1, #0x6c]
	mov r1, #1
	str r3, [r2, r6, lsl #2]
	str r1, [r0, r6, lsl #2]
_020E58DC:
	mov r0, sb
	mov r1, r8
	mov r2, r7
	bl _fseek
	ldr r1, _020E592C ; =_021E54C4
	mov r7, r0
	ldr r0, [r1, r6, lsl #2]
	subs r0, r0, #1
	str r0, [r1, r6, lsl #2]
	bne _020E590C
	add r0, r5, r4
	bl OS_UnlockMutex
_020E590C:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020E5914: .word _02110FCC
_020E5918: .word _02111018
_020E591C: .word _02111064
_020E5920: .word _021E54E8
_020E5924: .word OSi_ThreadInfo
_020E5928: .word _021E54A0
_020E592C: .word _021E54C4
	arm_func_end fseek

	arm_func_start rewind
rewind: ; 0x020E5930
	stmdb sp!, {r4, lr}
	mov r1, #0
	mov r4, r0
	mov r2, r1
	strb r1, [r4, #0xd]
	bl fseek
	mov r0, #0
	strb r0, [r4, #0xd]
	ldmia sp!, {r4, pc}
	arm_func_end rewind

	arm_func_start mbtowc
mbtowc: ; 0x020E5954
	stmdb sp!, {r3, lr}
	ldr r3, _020E596C ; =_0211120C
	ldr r3, [r3, #8]
	ldr r3, [r3]
	blx r3
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E596C: .word _0211120C
	arm_func_end mbtowc

	arm_func_start __mbtowc_noconv
__mbtowc_noconv: ; 0x020E5970
	cmp r1, #0
	moveq r0, #0
	bxeq lr
	cmp r2, #0
	mvneq r0, #0
	bxeq lr
	cmp r0, #0
	ldrneb r2, [r1]
	strneh r2, [r0]
	ldrsb r0, [r1]
	cmp r0, #0
	moveq r0, #0
	movne r0, #1
	bx lr
	arm_func_end __mbtowc_noconv

	arm_func_start __wctomb_noconv
__wctomb_noconv: ; 0x020E59A8
	cmp r0, #0
	moveq r0, #0
	strneb r1, [r0]
	movne r0, #1
	bx lr
	arm_func_end __wctomb_noconv

	arm_func_start wctomb
wctomb: ; 0x020E59BC
	stmdb sp!, {r3, lr}
	ldr r2, _020E59D4 ; =_0211120C
	ldr r2, [r2, #8]
	ldr r2, [r2, #4]
	blx r2
	ldmia sp!, {r3, pc}
	.align 2, 0
_020E59D4: .word _0211120C
	arm_func_end wctomb

	arm_func_start mbstowcs
mbstowcs: ; 0x020E59D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	mov r7, r1
	mov r8, r0
	mov r0, r7
	mov r6, r2
	bl strlen
	mov r5, r0
	cmp r8, #0
	mov r4, #0
	beq _020E5A58
	cmp r6, #0
	bls _020E5A58
_020E5A08:
	ldrsb r0, [r7]
	cmp r0, #0
	beq _020E5A40
	mov r0, r8
	mov r1, r7
	mov r2, r5
	bl mbtowc
	cmp r0, #0
	add r8, r8, #2
	addgt r7, r7, r0
	subgt r5, r5, r0
	bgt _020E5A4C
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020E5A40:
	mov r0, #0
	strh r0, [r8]
	b _020E5A58
_020E5A4C:
	add r4, r4, #1
	cmp r4, r6
	blo _020E5A08
_020E5A58:
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end mbstowcs

	arm_func_start wcstombs
wcstombs: ; 0x020E5A60
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, lr}
	movs r4, r0
	mov sb, r1
	cmpne sb, #0
	mov r8, r2
	mov r7, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	add r6, sp, #0
_020E5A84:
	ldrh r1, [sb]
	cmp r1, #0
	moveq r0, #0
	streqb r0, [r4, r7]
	beq _020E5AD0
	mov r0, r6
	add sb, sb, #2
	bl wctomb
	mov r5, r0
	add r0, r7, r5
	cmp r0, r8
	bhi _020E5AD0
	mov r1, r6
	mov r2, r5
	add r0, r4, r7
	bl strncpy
	add r7, r7, r5
	cmp r7, r8
	bls _020E5A84
_020E5AD0:
	mov r0, r7
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, pc}
	arm_func_end wcstombs

	arm_func_start memcpy
memcpy: ; 0x020E5AD8
	mov ip, r0
	cmp r2, #0
	bxeq lr
_020E5AE4:
	ldrsb r3, [r1], #1
	subs r2, r2, #1
	strb r3, [ip], #1
	bne _020E5AE4
	bx lr
	arm_func_end memcpy

	arm_func_start memmove
memmove: ; 0x020E5AF8
	cmp r1, r0
	blo _020E5B20
	mov ip, r0
	cmp r2, #0
	bxeq lr
_020E5B0C:
	ldrsb r3, [r1], #1
	subs r2, r2, #1
	strb r3, [ip], #1
	bne _020E5B0C
	bx lr
_020E5B20:
	cmp r2, #0
	add r3, r1, r2
	add ip, r0, r2
	bxeq lr
_020E5B30:
	ldrsb r1, [r3, #-1]!
	subs r2, r2, #1
	strb r1, [ip, #-1]!
	bne _020E5B30
	bx lr
	arm_func_end memmove

	arm_func_start memset
memset: ; 0x020E5B44
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl __fill_mem
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end memset

	arm_func_start memchr
memchr: ; 0x020E5B58
	cmp r2, #0
	and r3, r1, #0xff
	beq _020E5B7C
_020E5B64:
	ldrb r1, [r0], #1
	cmp r1, r3
	subeq r0, r0, #1
	bxeq lr
	subs r2, r2, #1
	bne _020E5B64
_020E5B7C:
	mov r0, #0
	bx lr
	arm_func_end memchr

	arm_func_start __memrchr
__memrchr: ; 0x020E5B84
	cmp r2, #0
	and r3, r1, #0xff
	add r0, r0, r2
	beq _020E5BA8
_020E5B94:
	ldrb r1, [r0, #-1]!
	cmp r1, r3
	bxeq lr
	subs r2, r2, #1
	bne _020E5B94
_020E5BA8:
	mov r0, #0
	bx lr
	arm_func_end __memrchr

	arm_func_start memcmp
memcmp: ; 0x020E5BB0
	cmp r2, #0
	beq _020E5BE8
_020E5BB8:
	ldrb ip, [r0], #1
	ldrb r3, [r1], #1
	cmp ip, r3
	beq _020E5BE0
	ldrb r2, [r0, #-1]
	ldrb r0, [r1, #-1]
	cmp r2, r0
	mvnlo r0, #0
	movhs r0, #1
	bx lr
_020E5BE0:
	subs r2, r2, #1
	bne _020E5BB8
_020E5BE8:
	mov r0, #0
	bx lr
	arm_func_end memcmp

	arm_func_start __fill_mem
__fill_mem: ; 0x020E5BF0
	cmp r2, #0x20
	and r3, r1, #0xff
	blo _020E5C84
	rsb r1, r0, #0
	ands ip, r1, #3
	beq _020E5C1C
	sub r2, r2, ip
	and r1, r3, #0xff
_020E5C10:
	strb r1, [r0], #1
	subs ip, ip, #1
	bne _020E5C10
_020E5C1C:
	cmp r3, #0
	beq _020E5C34
	mov r1, r3, lsl #0x10
	orr r1, r1, r3, lsl #24
	orr r1, r1, r3, lsl #8
	orr r3, r3, r1
_020E5C34:
	movs r1, r2, lsr #5
	beq _020E5C68
_020E5C3C:
	str r3, [r0]
	str r3, [r0, #4]
	str r3, [r0, #8]
	str r3, [r0, #0xc]
	str r3, [r0, #0x10]
	str r3, [r0, #0x14]
	str r3, [r0, #0x18]
	str r3, [r0, #0x1c]
	add r0, r0, #0x20
	subs r1, r1, #1
	bne _020E5C3C
_020E5C68:
	and r1, r2, #0x1f
	movs r1, r1, lsr #2
	beq _020E5C80
_020E5C74:
	str r3, [r0], #4
	subs r1, r1, #1
	bne _020E5C74
_020E5C80:
	and r2, r2, #3
_020E5C84:
	cmp r2, #0
	bxeq lr
	and r1, r3, #0xff
_020E5C90:
	strb r1, [r0], #1
	subs r2, r2, #1
	bne _020E5C90
	bx lr
	arm_func_end __fill_mem

	arm_func_start parse_format__printf
parse_format__printf: ; 0x020E5CA0 static routine
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldrsb r3, [r0, #1]
	mov r4, #0
	mov r5, #1
	mov lr, r2
	strb r5, [sp]
	strb r4, [sp, #1]
	strb r4, [sp, #2]
	strb r4, [sp, #3]
	strb r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	cmp r3, #0x25
	add ip, r0, #1
	bne _020E5CFC
	add r0, sp, #0
	strb r3, [sp, #5]
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add sp, sp, #0x10
	add r0, ip, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020E5CFC:
	mov r2, #2
	mov r0, r4
	mov r5, r2
	mov r6, r4
	mov r7, #1
_020E5D10:
	mov r8, r7
	cmp r3, #0x2b
	bgt _020E5D40
	bge _020E5D68
	cmp r3, #0x23
	bgt _020E5D98
	cmp r3, #0x20
	blt _020E5D98
	beq _020E5D70
	cmp r3, #0x23
	beq _020E5D80
	b _020E5D98
_020E5D40:
	cmp r3, #0x30
	bgt _020E5D98
	cmp r3, #0x2d
	blt _020E5D98
	beq _020E5D60
	cmp r3, #0x30
	beq _020E5D88
	b _020E5D98
_020E5D60:
	strb r6, [sp]
	b _020E5D9C
_020E5D68:
	strb r7, [sp, #1]
	b _020E5D9C
_020E5D70:
	ldrb r4, [sp, #1]
	cmp r4, #1
	strneb r5, [sp, #1]
	b _020E5D9C
_020E5D80:
	strb r7, [sp, #3]
	b _020E5D9C
_020E5D88:
	ldrb r4, [sp]
	cmp r4, #0
	strneb r2, [sp]
	b _020E5D9C
_020E5D98:
	mov r8, r0
_020E5D9C:
	cmp r8, #0
	ldrnesb r3, [ip, #1]!
	bne _020E5D10
	cmp r3, #0x2a
	bne _020E5DE4
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	ldr r0, [r0, #-4]
	str r0, [sp, #8]
	cmp r0, #0
	bge _020E5DDC
	rsb r0, r0, #0
	mov r2, #0
	strb r2, [sp]
	str r0, [sp, #8]
_020E5DDC:
	ldrsb r3, [ip, #1]!
	b _020E5E34
_020E5DE4:
	ldr r4, _020E6228 ; =_0210E504
	mov r5, #0
	mov r0, #0xa
	b _020E5E08
_020E5DF4:
	ldr r2, [sp, #8]
	sub r3, r3, #0x30
	mla r6, r2, r0, r3
	ldrsb r3, [ip, #1]!
	str r6, [sp, #8]
_020E5E08:
	cmp r3, #0
	blt _020E5E18
	cmp r3, #0x80
	blt _020E5E20
_020E5E18:
	mov r2, r5
	b _020E5E2C
_020E5E20:
	mov r2, r3, lsl #1
	ldrh r2, [r4, r2]
	and r2, r2, #8
_020E5E2C:
	cmp r2, #0
	bne _020E5DF4
_020E5E34:
	ldr r2, [sp, #8]
	ldr r0, _020E622C ; =0x000001FD
	cmp r2, r0
	ble _020E5E64
	mov r1, #0xff
	add r0, sp, #0
	strb r1, [sp, #5]
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add sp, sp, #0x10
	add r0, ip, #1
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020E5E64:
	cmp r3, #0x2e
	bne _020E5EF8
	ldrsb r3, [ip, #1]!
	mov r0, #1
	strb r0, [sp, #2]
	cmp r3, #0x2a
	bne _020E5EA8
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	ldr r0, [r0, #-4]
	ldrsb r3, [ip, #1]!
	str r0, [sp, #0xc]
	cmp r0, #0
	movlt r0, #0
	strltb r0, [sp, #2]
	b _020E5EF8
_020E5EA8:
	ldr r2, _020E6228 ; =_0210E504
	mov r4, #0
	mov r0, #0xa
	b _020E5ECC
_020E5EB8:
	ldr r1, [sp, #0xc]
	sub r3, r3, #0x30
	mla r5, r1, r0, r3
	ldrsb r3, [ip, #1]!
	str r5, [sp, #0xc]
_020E5ECC:
	cmp r3, #0
	blt _020E5EDC
	cmp r3, #0x80
	blt _020E5EE4
_020E5EDC:
	mov r1, r4
	b _020E5EF0
_020E5EE4:
	mov r1, r3, lsl #1
	ldrh r1, [r2, r1]
	and r1, r1, #8
_020E5EF0:
	cmp r1, #0
	bne _020E5EB8
_020E5EF8:
	cmp r3, #0x6c
	mov r0, #1
	bgt _020E5F30
	cmp r3, #0x68
	blt _020E5F24
	beq _020E5F4C
	cmp r3, #0x6a
	beq _020E5F98
	cmp r3, #0x6c
	beq _020E5F68
	b _020E5FBC
_020E5F24:
	cmp r3, #0x4c
	beq _020E5F8C
	b _020E5FBC
_020E5F30:
	cmp r3, #0x74
	bgt _020E5F40
	beq _020E5FA4
	b _020E5FBC
_020E5F40:
	cmp r3, #0x7a
	beq _020E5FB0
	b _020E5FBC
_020E5F4C:
	ldrsb r1, [ip, #1]
	mov r2, #2
	strb r2, [sp, #4]
	cmp r1, #0x68
	streqb r0, [sp, #4]
	ldreqsb r3, [ip, #1]!
	b _020E5FC0
_020E5F68:
	ldrsb r1, [ip, #1]
	mov r2, #3
	strb r2, [sp, #4]
	cmp r1, #0x6c
	bne _020E5FC0
	mov r1, #4
	strb r1, [sp, #4]
	ldrsb r3, [ip, #1]!
	b _020E5FC0
_020E5F8C:
	mov r1, #9
	strb r1, [sp, #4]
	b _020E5FC0
_020E5F98:
	mov r1, #6
	strb r1, [sp, #4]
	b _020E5FC0
_020E5FA4:
	mov r1, #8
	strb r1, [sp, #4]
	b _020E5FC0
_020E5FB0:
	mov r1, #7
	strb r1, [sp, #4]
	b _020E5FC0
_020E5FBC:
	mov r0, #0
_020E5FC0:
	cmp r0, #0
	ldrnesb r3, [ip, #1]!
	strb r3, [sp, #5]
	cmp r3, #0x61
	bgt _020E6014
	bge _020E60FC
	cmp r3, #0x47
	bgt _020E6008
	subs r0, r3, #0x41
	addpl pc, pc, r0, lsl #2
	b _020E6208
_020E5FEC: ; jump table
	b _020E60FC ; case 0
	b _020E6208 ; case 1
	b _020E6208 ; case 2
	b _020E6208 ; case 3
	b _020E6144 ; case 4
	b _020E60C4 ; case 5
	b _020E6134 ; case 6
_020E6008:
	cmp r3, #0x58
	beq _020E6088
	b _020E6208
_020E6014:
	cmp r3, #0x63
	bgt _020E6024
	beq _020E61A4
	b _020E6208
_020E6024:
	sub r0, r3, #0x64
	cmp r0, #0x14
	addls pc, pc, r0, lsl #2
	b _020E6208
_020E6034: ; jump table
	b _020E6088 ; case 0
	b _020E6144 ; case 1
	b _020E60C4 ; case 2
	b _020E6134 ; case 3
	b _020E6208 ; case 4
	b _020E6088 ; case 5
	b _020E6208 ; case 6
	b _020E6208 ; case 7
	b _020E6208 ; case 8
	b _020E6208 ; case 9
	b _020E61F4 ; case 10
	b _020E6088 ; case 11
	b _020E6180 ; case 12
	b _020E6208 ; case 13
	b _020E6208 ; case 14
	b _020E61D0 ; case 15
	b _020E6208 ; case 16
	b _020E6088 ; case 17
	b _020E6208 ; case 18
	b _020E6208 ; case 19
	b _020E6088 ; case 20
_020E6088:
	ldrb r0, [sp, #4]
	cmp r0, #9
	moveq r0, #0xff
	streqb r0, [sp, #5]
	beq _020E6210
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
	beq _020E6210
	ldrb r0, [sp]
	cmp r0, #2
	moveq r0, #1
	streqb r0, [sp]
	b _020E6210
_020E60C4:
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	moveq r0, #0xff
	streqb r0, [sp, #5]
	beq _020E6210
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp, #0xc]
	b _020E6210
_020E60FC:
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #0xd
	streq r0, [sp, #0xc]
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	cmpne r0, #1
	moveq r0, #0xff
	streqb r0, [sp, #5]
	b _020E6210
_020E6134:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
_020E6144:
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	cmpne r0, #1
	moveq r0, #0xff
	streqb r0, [sp, #5]
	beq _020E6210
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp, #0xc]
	b _020E6210
_020E6180:
	mov r3, #0x78
	mov r2, #1
	mov r1, #3
	mov r0, #8
	strb r3, [sp, #5]
	strb r2, [sp, #3]
	strb r1, [sp, #4]
	str r0, [sp, #0xc]
	b _020E6210
_020E61A4:
	ldrb r1, [sp, #4]
	cmp r1, #3
	moveq r0, #5
	streqb r0, [sp, #4]
	beq _020E6210
	ldrb r0, [sp, #2]
	cmp r0, #0
	cmpeq r1, #0
	movne r0, #0xff
	strneb r0, [sp, #5]
	b _020E6210
_020E61D0:
	ldrb r0, [sp, #4]
	cmp r0, #3
	moveq r0, #5
	streqb r0, [sp, #4]
	beq _020E6210
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sp, #5]
	b _020E6210
_020E61F4:
	ldrb r0, [sp, #4]
	cmp r0, #9
	moveq r0, #0xff
	streqb r0, [sp, #5]
	b _020E6210
_020E6208:
	mov r0, #0xff
	strb r0, [sp, #5]
_020E6210:
	add r0, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add r0, ip, #1
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020E6228: .word _0210E504
_020E622C: .word 0x000001FD
	arm_func_end parse_format__printf

	arm_func_start long2str__printf
long2str__printf: ; 0x020E6230
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	movs sl, r0
	mov r0, #0
	mov r5, r1
	str r0, [sp, #0xc]
	ldr r7, [sp, #0x4c]
	mov r6, r0
	strb r0, [r5, #-1]!
	ldrb r0, [sp, #0x43]
	str r1, [sp]
	ldrb r8, [sp, #0x45]
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	ldrb fp, [sp, #0x41]
	str r0, [sp, #8]
	cmpeq r7, #0
	bne _020E62A4
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020E6290
	cmp r8, #0x6f
	beq _020E62A4
_020E6290:
	add sp, sp, #0x10
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E62A4:
	cmp r8, #0x69
	bgt _020E62CC
	bge _020E6300
	cmp r8, #0x58
	bgt _020E62C0
	beq _020E632C
	b _020E6334
_020E62C0:
	cmp r8, #0x64
	beq _020E6300
	b _020E6334
_020E62CC:
	cmp r8, #0x6f
	bgt _020E62E0
	moveq r4, #8
	moveq fp, #0
	b _020E6334
_020E62E0:
	cmp r8, #0x78
	bgt _020E6334
	cmp r8, #0x75
	blt _020E6334
	beq _020E6320
	cmp r8, #0x78
	beq _020E632C
	b _020E6334
_020E6300:
	cmp sl, #0
	mov r4, #0xa
	bge _020E6334
	mov r0, #1
	cmp sl, #0x80000000
	rsbne sl, sl, #0
	str r0, [sp, #0xc]
	b _020E6334
_020E6320:
	mov r4, #0xa
	mov fp, #0
	b _020E6334
_020E632C:
	mov r4, #0x10
	mov fp, #0
_020E6334:
	mov r0, sl
	mov r1, r4
	bl _u32_div_f
	mov sb, r1
	mov r0, sl
	mov r1, r4
	bl _u32_div_f
	cmp sb, #0xa
	mov sl, r0
	addlt sb, sb, #0x30
	blt _020E636C
	cmp r8, #0x78
	addeq sb, sb, #0x57
	addne sb, sb, #0x37
_020E636C:
	cmp sl, #0
	strb sb, [r5, #-1]!
	add r6, r6, #1
	bne _020E6334
	cmp r4, #8
	bne _020E63A0
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrnesb r0, [r5]
	cmpne r0, #0x30
	movne r0, #0x30
	strneb r0, [r5, #-1]!
	addne r6, r6, #1
_020E63A0:
	ldrb r0, [sp, #0x40]
	cmp r0, #2
	bne _020E63D4
	ldr r0, [sp, #0xc]
	ldr r7, [sp, #8]
	cmp r0, #0
	cmpeq fp, #0
	subne r7, r7, #1
	cmp r4, #0x10
	bne _020E63D4
	ldr r0, [sp, #4]
	cmp r0, #0
	subne r7, r7, #2
_020E63D4:
	ldr r0, [sp]
	sub r1, r0, r5
	ldr r0, _020E6478 ; =0x000001FD
	add r1, r7, r1
	cmp r1, r0
	addgt sp, sp, #0x10
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	cmp r6, r7
	bge _020E6418
	mov r0, #0x30
_020E6408:
	add r6, r6, #1
	cmp r6, r7
	strb r0, [r5, #-1]!
	blt _020E6408
_020E6418:
	cmp r4, #0x10
	bne _020E6434
	ldr r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x30
	strneb r8, [r5, #-1]
	strneb r0, [r5, #-2]!
_020E6434:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r5, #-1]!
	bne _020E6464
	cmp fp, #1
	moveq r0, #0x2b
	streqb r0, [r5, #-1]!
	beq _020E6464
	cmp fp, #2
	moveq r0, #0x20
	streqb r0, [r5, #-1]!
_020E6464:
	mov r0, r5
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E6478: .word 0x000001FD
	arm_func_end long2str__printf

	arm_func_start longlong2str__printf
longlong2str__printf: ; 0x020E647C
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov sb, r1
	mov r1, #0
	mov sl, r0
	mov r8, r2
	mov r0, r1
	strb r0, [r8, #-1]!
	ldr r0, [sp, #0x58]
	cmp sb, #0
	str r0, [sp, #0x14]
	ldrb r0, [sp, #0x4f]
	cmpeq sl, #0
	str r2, [sp]
	str r0, [sp, #4]
	ldrb r0, [sp, #0x51]
	str r1, [sp, #0x18]
	mov fp, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0x54]
	str r0, [sp, #0xc]
	ldrb r0, [sp, #0x4d]
	str r0, [sp, #0x10]
	ldreq r0, [sp, #0x14]
	cmpeq r0, #0
	bne _020E6514
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020E6500
	ldr r0, [sp, #8]
	cmp r0, #0x6f
	beq _020E6514
_020E6500:
	add sp, sp, #0x1c
	mov r0, r8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E6514:
	ldr r0, [sp, #8]
	cmp r0, #0x69
	bgt _020E6540
	bge _020E6570
	cmp r0, #0x58
	bgt _020E6534
	beq _020E65C4
	b _020E65D0
_020E6534:
	cmp r0, #0x64
	beq _020E6570
	b _020E65D0
_020E6540:
	cmp r0, #0x6f
	bgt _020E6550
	beq _020E65A4
	b _020E65D0
_020E6550:
	cmp r0, #0x78
	bgt _020E65D0
	cmp r0, #0x75
	blt _020E65D0
	beq _020E65B4
	cmp r0, #0x78
	beq _020E65C4
	b _020E65D0
_020E6570:
	subs r0, sl, #0
	sbcs r0, sb, #0
	mov r7, #0xa
	mov r6, #0
	bge _020E65D0
	cmp sb, #0x80000000
	cmpeq sl, r6
	beq _020E6598
	rsbs sl, sl, #0
	rsc sb, sb, #0
_020E6598:
	mov r0, #1
	str r0, [sp, #0x18]
	b _020E65D0
_020E65A4:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #8
	b _020E65D0
_020E65B4:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #0xa
	b _020E65D0
_020E65C4:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #0x10
_020E65D0:
	mov r4, #0
_020E65D4:
	mov r0, sl
	mov r1, sb
	mov r2, r7
	mov r3, r6
	bl _ull_mod
	mov r5, r0
	mov r0, sl
	mov r1, sb
	mov r2, r7
	mov r3, r6
	bl _ll_udiv
	mov sl, r0
	cmp r5, #0xa
	mov sb, r1
	addlt r0, r5, #0x30
	blt _020E6624
	ldr r0, [sp, #8]
	cmp r0, #0x78
	addeq r0, r5, #0x57
	addne r0, r5, #0x37
_020E6624:
	strb r0, [r8, #-1]!
	mov r0, #0
	cmp sb, r0
	cmpeq sl, r4
	add fp, fp, #1
	bne _020E65D4
	cmp r6, #0
	cmpeq r7, #8
	bne _020E6664
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrnesb r0, [r8]
	cmpne r0, #0x30
	movne r0, #0x30
	strneb r0, [r8, #-1]!
	addne fp, fp, #1
_020E6664:
	ldrb r0, [sp, #0x4c]
	cmp r0, #2
	bne _020E66B4
	ldr r0, [sp, #0xc]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldreq r0, [sp, #0x10]
	cmpeq r0, #0
	ldrne r0, [sp, #0x14]
	subne r0, r0, #1
	strne r0, [sp, #0x14]
	cmp r6, #0
	cmpeq r7, #0x10
	bne _020E66B4
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrne r0, [sp, #0x14]
	subne r0, r0, #2
	strne r0, [sp, #0x14]
_020E66B4:
	ldr r0, [sp]
	ldr r1, _020E6774 ; =0x000001FD
	sub r2, r0, r8
	ldr r0, [sp, #0x14]
	add r0, r0, r2
	cmp r0, r1
	addgt sp, sp, #0x1c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	ldr r0, [sp, #0x14]
	cmp fp, r0
	bge _020E6704
	mov r1, #0x30
_020E66F0:
	ldr r0, [sp, #0x14]
	add fp, fp, #1
	cmp fp, r0
	strb r1, [r8, #-1]!
	blt _020E66F0
_020E6704:
	cmp r6, #0
	cmpeq r7, #0x10
	bne _020E672C
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020E672C
	ldr r0, [sp, #8]
	mov r1, #0x30
	strb r0, [r8, #-1]
	strb r1, [r8, #-2]!
_020E672C:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r8, #-1]!
	bne _020E6760
	ldr r0, [sp, #0x10]
	cmp r0, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _020E6760
	cmp r0, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
_020E6760:
	mov r0, r8
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E6774: .word 0x000001FD
	arm_func_end longlong2str__printf

	arm_func_start double2hex__printf
double2hex__printf: ; 0x020E6778
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x44
	ldr r7, [sp, #0x80]
	ldr r0, _020E6C28 ; =0x000001FD
	mov r8, r2
	cmp r7, r0
	ldrb r6, [sp, #0x79]
	ldrb r5, [sp, #0x77]
	ldrb r4, [sp, #0x75]
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x6c]
	addgt sp, sp, #0x44
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addgt sp, sp, #0x10
	bxgt lr
	mov sl, #0
	mov sb, #0x20
	add r0, sp, #8
	add r3, sp, #0xc
	strb sl, [sp, #8]
	strh sb, [sp, #0xa]
	bl __num2dec
	ldr r0, [sp, #0x68]
	ldr r1, [sp, #0x6c]
	bl fabs
	mov r2, r0
	mov r0, sl
	mov r3, r1
	mov r1, r0
	bl _deq
	bne _020E6844
	ldr r3, _020E6C2C ; =_02111314
	sub r0, r8, #6
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	add sp, sp, #0x44
	strb r2, [r8, #-6]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r2, [r3, #4]
	ldrb r1, [r3, #5]
	strb r2, [r0, #4]
	strb r1, [r0, #5]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E6844:
	ldrb r0, [sp, #0x11]
	cmp r0, #0x49
	bne _020E6954
	ldrsb r0, [sp, #0xc]
	cmp r0, #0
	beq _020E68E0
	cmp r6, #0x41
	sub r0, r8, #5
	bne _020E68A4
	ldr r3, _020E6C30 ; =_0211131C
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E68A4:
	ldr r3, _020E6C34 ; =_02111324
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E68E0:
	cmp r6, #0x41
	sub r0, r8, #4
	bne _020E6920
	ldr r3, _020E6C38 ; =_0211132C
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E6920:
	ldr r3, _020E6C3C ; =_02111330
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E6954:
	cmp r0, #0x4e
	bne _020E6A60
	ldrsb r0, [sp, #0xc]
	cmp r0, #0
	beq _020E69EC
	cmp r6, #0x41
	sub r0, r8, #5
	bne _020E69B0
	ldr r3, _020E6C40 ; =_02111334
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E69B0:
	ldr r3, _020E6C44 ; =_0211133C
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E69EC:
	cmp r6, #0x41
	sub r0, r8, #4
	bne _020E6A2C
	ldr r3, _020E6C48 ; =_02111344
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E6A2C:
	ldr r3, _020E6C4C ; =_02111348
	add sp, sp, #0x44
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020E6A60:
	mov r3, sl
	mov r1, #1
	mov r0, #0x64
	add sb, sp, #0x68
	strb r1, [sp, #0x34]
	strb r1, [sp, #0x35]
	strb r3, [sp, #0x36]
	strb r3, [sp, #0x37]
	strb r3, [sp, #0x38]
	str r3, [sp, #0x3c]
	str r1, [sp, #0x40]
	strb r0, [sp, #0x39]
_020E6A90:
	rsb r1, r3, #7
	ldrsb r2, [sb, r3]
	ldrsb r0, [sb, r1]
	strb r0, [sb, r3]
	add r3, r3, #1
	strb r2, [sb, r1]
	cmp r3, #4
	blt _020E6A90
	ldrb r0, [sp, #0x69]
	ldrb r1, [sp, #0x68]
	ldr sb, _020E6C50 ; =0x000007FF
	mov r0, r0, lsl #0x11
	orr r1, r0, r1, lsl #25
	add r0, sp, #0x34
	and lr, sb, r1, lsr #21
	sub ip, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	rsb r0, sb, #0x400
	mov r1, r8
	add r0, lr, r0
	ldmia ip, {r2, r3}
	bl long2str__printf
	cmp r6, #0x61
	moveq r1, #0x70
	movne r1, #0x50
	strb r1, [r0, #-1]!
	mov r1, r7, lsl #2
	mov lr, r7
	cmp r7, #1
	add r8, r1, #0xb
	add ip, sp, #0x68
	blt _020E6BA0
	mov sb, #0x30
_020E6B18:
	cmp r8, #0x40
	bge _020E6B88
	ldrb r1, [ip, r8, asr #3]
	and r2, r8, #7
	rsb r3, r2, #7
	mov r2, r1, asr r3
	sub sl, r8, #4
	bic r1, r8, #7
	bic sl, sl, #7
	cmp r1, sl
	add sl, ip, r8, asr #3
	and r1, r2, #0xff
	beq _020E6B5C
	ldrb r2, [sl, #-1]
	mov r2, r2, lsl #8
	orr r1, r1, r2, asr r3
	and r1, r1, #0xff
_020E6B5C:
	and r1, r1, #0xf
	cmp r1, #0xa
	addlo r1, r1, #0x30
	andlo r1, r1, #0xff
	blo _020E6B8C
	cmp r6, #0x61
	addeq r1, r1, #0x57
	andeq r1, r1, #0xff
	addne r1, r1, #0x37
	andne r1, r1, #0xff
	b _020E6B8C
_020E6B88:
	mov r1, sb
_020E6B8C:
	sub lr, lr, #1
	cmp lr, #1
	strb r1, [r0, #-1]!
	sub r8, r8, #4
	bge _020E6B18
_020E6BA0:
	cmp r7, #0
	cmpeq r5, #0
	movne r1, #0x2e
	strneb r1, [r0, #-1]!
	mov r1, #0x31
	strb r1, [r0, #-1]
	cmp r6, #0x61
	moveq r1, #0x78
	movne r1, #0x58
	strb r1, [r0, #-2]!
	mov r1, #0x30
	strb r1, [r0, #-1]!
	ldrsb r1, [sp, #0xc]
	cmp r1, #0
	movne r1, #0x2d
	strneb r1, [r0, #-1]!
	addne sp, sp, #0x44
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addne sp, sp, #0x10
	bxne lr
	cmp r4, #1
	moveq r1, #0x2b
	streqb r1, [r0, #-1]!
	addeq sp, sp, #0x44
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addeq sp, sp, #0x10
	bxeq lr
	cmp r4, #2
	moveq r1, #0x20
	streqb r1, [r0, #-1]!
	add sp, sp, #0x44
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E6C28: .word 0x000001FD
_020E6C2C: .word _02111314
_020E6C30: .word _0211131C
_020E6C34: .word _02111324
_020E6C38: .word _0211132C
_020E6C3C: .word _02111330
_020E6C40: .word _02111334
_020E6C44: .word _0211133C
_020E6C48: .word _02111344
_020E6C4C: .word _02111348
_020E6C50: .word 0x000007FF
	arm_func_end double2hex__printf

	arm_func_start round_decimal__printf
round_decimal__printf: ; 0x020E6C54
	stmdb sp!, {r4, lr}
	cmp r1, #0
	bge _020E6C7C
_020E6C60:
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #1
	strb r1, [r0, #4]
	mov r1, #0x30
	strb r1, [r0, #5]
	ldmia sp!, {r4, pc}
_020E6C7C:
	ldrb lr, [r0, #4]
	cmp r1, lr
	ldmgeia sp!, {r4, pc}
	add ip, r0, #5
	add r2, ip, r1
	add r2, r2, #1
	ldrsb r3, [r2, #-1]!
	sub r3, r3, #0x30
	mov r3, r3, lsl #0x18
	mov r3, r3, asr #0x18
	cmp r3, #5
	bne _020E6CDC
	add ip, ip, lr
_020E6CB0:
	sub ip, ip, #1
	cmp ip, r2
	bls _020E6CC8
	ldrsb r3, [ip]
	cmp r3, #0x30
	beq _020E6CB0
_020E6CC8:
	cmp ip, r2
	ldreqsb r3, [r2, #-1]
	andeq r4, r3, #1
	movne r4, #1
	b _020E6CE4
_020E6CDC:
	movgt r4, #1
	movle r4, #0
_020E6CE4:
	cmp r1, #0
	beq _020E6D40
	mov ip, #0
	mov lr, #1
_020E6CF4:
	ldrsb r3, [r2, #-1]!
	sub r3, r3, #0x30
	add r3, r3, r4
	mov r3, r3, lsl #0x18
	mov r3, r3, asr #0x18
	cmp r3, #9
	movgt r4, lr
	movle r4, ip
	cmp r4, #0
	bne _020E6D24
	cmp r3, #0
	bne _020E6D2C
_020E6D24:
	sub r1, r1, #1
	b _020E6D38
_020E6D2C:
	add r3, r3, #0x30
	strb r3, [r2]
	b _020E6D40
_020E6D38:
	cmp r1, #0
	bne _020E6CF4
_020E6D40:
	cmp r4, #0
	beq _020E6D68
	ldrsh r3, [r0, #2]
	mov r2, #1
	mov r1, #0x31
	add r3, r3, #1
	strh r3, [r0, #2]
	strb r2, [r0, #4]
	strb r1, [r0, #5]
	ldmia sp!, {r4, pc}
_020E6D68:
	cmp r1, #0
	beq _020E6C60
	strb r1, [r0, #4]
	ldmia sp!, {r4, pc}
	arm_func_end round_decimal__printf

	arm_func_start float2str__printf
float2str__printf: ; 0x020E6D78
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x2c
	ldr r7, [sp, #0x68]
	ldr r3, _020E74B0 ; =0x000001FD
	ldrb r6, [sp, #0x61]
	ldrb r5, [sp, #0x5f]
	ldrb r4, [sp, #0x5d]
	cmp r7, r3
	mov sl, r0
	mov r8, r1
	mov sb, r2
	addgt sp, sp, #0x2c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	mov ip, #0
	mov fp, #0x20
	add r0, sp, #0
	add r3, sp, #4
	mov r1, sl
	mov r2, r8
	strb ip, [sp]
	strh fp, [sp, #2]
	bl __num2dec
	ldrb r0, [sp, #8]
	add r1, sp, #9
	add r0, r1, r0
	b _020E6E08
_020E6DF0:
	ldrb r2, [sp, #8]
	ldrsh r1, [sp, #6]
	sub r2, r2, #1
	add r1, r1, #1
	strb r2, [sp, #8]
	strh r1, [sp, #6]
_020E6E08:
	ldrb r1, [sp, #8]
	cmp r1, #1
	bls _020E6E20
	ldrsb r1, [r0, #-1]!
	cmp r1, #0x30
	beq _020E6DF0
_020E6E20:
	ldrb r0, [sp, #9]
	cmp r0, #0x30
	beq _020E6E40
	cmp r0, #0x49
	beq _020E6E4C
	cmp r0, #0x4e
	beq _020E6FAC
	b _020E7100
_020E6E40:
	mov r0, #0
	strh r0, [sp, #6]
	b _020E7100
_020E6E4C:
	mov r2, #0
	mov r0, sl
	mov r1, r8
	mov r3, r2
	bl _dls
	bhs _020E6F10
	cmp r6, #0
	sub r0, sb, #5
	blt _020E6E78
	cmp r6, #0x80
	blt _020E6E80
_020E6E78:
	mov r1, #0
	b _020E6E90
_020E6E80:
	ldr r1, _020E74B4 ; =_0210E504
	mov r2, r6, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #0x200
_020E6E90:
	cmp r1, #0
	beq _020E6ED4
	ldr r3, _020E74B8 ; =_0211131C
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E6ED4:
	ldr r3, _020E74BC ; =_02111324
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E6F10:
	cmp r6, #0
	sub r0, sb, #4
	blt _020E6F24
	cmp r6, #0x80
	blt _020E6F2C
_020E6F24:
	mov r1, #0
	b _020E6F3C
_020E6F2C:
	ldr r1, _020E74B4 ; =_0210E504
	mov r2, r6, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #0x200
_020E6F3C:
	cmp r1, #0
	beq _020E6F78
	ldr r3, _020E74C0 ; =_0211132C
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E6F78:
	ldr r3, _020E74C4 ; =_02111330
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E6FAC:
	ldrsb r0, [sp, #4]
	cmp r0, #0
	beq _020E7064
	cmp r6, #0
	sub r0, sb, #5
	blt _020E6FCC
	cmp r6, #0x80
	blt _020E6FD4
_020E6FCC:
	mov r1, #0
	b _020E6FE4
_020E6FD4:
	ldr r1, _020E74B4 ; =_0210E504
	mov r2, r6, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #0x200
_020E6FE4:
	cmp r1, #0
	beq _020E7028
	ldr r3, _020E74C8 ; =_02111334
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E7028:
	ldr r3, _020E74CC ; =_0211133C
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldrb r1, [r3, #4]
	strb r1, [r0, #4]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E7064:
	cmp r6, #0
	sub r0, sb, #4
	blt _020E7078
	cmp r6, #0x80
	blt _020E7080
_020E7078:
	mov r1, #0
	b _020E7090
_020E7080:
	ldr r1, _020E74B4 ; =_0210E504
	mov r2, r6, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #0x200
_020E7090:
	cmp r1, #0
	beq _020E70CC
	ldr r3, _020E74D0 ; =_02111344
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E70CC:
	ldr r3, _020E74D4 ; =_02111348
	add sp, sp, #0x2c
	ldrb r2, [r3]
	ldrb r1, [r3, #1]
	strb r2, [r0]
	strb r1, [r0, #1]
	ldrb r2, [r3, #2]
	ldrb r1, [r3, #3]
	strb r2, [r0, #2]
	strb r1, [r0, #3]
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E7100:
	ldrb r0, [sp, #8]
	ldrsh r1, [sp, #6]
	sub r8, sb, #1
	sub r0, r0, #1
	add r0, r1, r0
	strh r0, [sp, #6]
	mov r0, #0
	strb r0, [r8]
	cmp r6, #0x65
	bgt _020E7154
	bge _020E71E0
	cmp r6, #0x47
	bgt _020E749C
	cmp r6, #0x45
	blt _020E749C
	beq _020E71E0
	cmp r6, #0x46
	beq _020E7328
	cmp r6, #0x47
	beq _020E716C
	b _020E749C
_020E7154:
	cmp r6, #0x66
	bgt _020E7164
	beq _020E7328
	b _020E749C
_020E7164:
	cmp r6, #0x67
	bne _020E749C
_020E716C:
	ldrb r0, [sp, #8]
	cmp r0, r7
	ble _020E7184
	add r0, sp, #4
	mov r1, r7
	bl round_decimal__printf
_020E7184:
	ldrsh r2, [sp, #6]
	mvn r0, #3
	cmp r2, r0
	blt _020E719C
	cmp r2, r7
	blt _020E71BC
_020E719C:
	cmp r5, #0
	ldreqb r0, [sp, #8]
	subne r7, r7, #1
	subeq r7, r0, #1
	cmp r6, #0x67
	moveq r6, #0x65
	movne r6, #0x45
	b _020E71E0
_020E71BC:
	cmp r5, #0
	addne r0, r2, #1
	subne r7, r7, r0
	bne _020E7328
	ldrb r1, [sp, #8]
	add r0, r2, #1
	subs r7, r1, r0
	movmi r7, #0
	b _020E7328
_020E71E0:
	ldrb r0, [sp, #8]
	add r1, r7, #1
	cmp r0, r1
	ble _020E71F8
	add r0, sp, #4
	bl round_decimal__printf
_020E71F8:
	ldrsh lr, [sp, #6]
	mov fp, #0x2b
	mov sl, #0
	cmp lr, #0
	rsblt lr, lr, #0
	movlt fp, #0x2d
	ldr r3, _020E74D8 ; =0x66666667
	mov r0, #0xa
	b _020E724C
_020E721C:
	mov r1, lr, lsr #0x1f
	smull r2, ip, r3, lr
	add ip, r1, ip, asr #2
	smull r1, r2, r0, ip
	sub ip, lr, r1
	add r1, ip, #0x30
	strb r1, [r8, #-1]!
	mov r2, lr
	smull r1, lr, r3, r2
	mov r1, r2, lsr #0x1f
	add lr, r1, lr, asr #2
	add sl, sl, #1
_020E724C:
	cmp lr, #0
	bne _020E721C
	cmp sl, #2
	blt _020E721C
	strb fp, [r8, #-1]
	strb r6, [r8, #-2]!
	sub r1, sb, r8
	ldr r0, _020E74B0 ; =0x000001FD
	add r1, r7, r1
	cmp r1, r0
	addgt sp, sp, #0x2c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	ldrb r1, [sp, #8]
	add r0, r7, #1
	cmp r1, r0
	bge _020E72B8
	add r0, r7, #2
	sub r0, r0, r1
	subs r1, r0, #1
	beq _020E72B8
	mov r0, #0x30
_020E72AC:
	strb r0, [r8, #-1]!
	subs r1, r1, #1
	bne _020E72AC
_020E72B8:
	ldrb r1, [sp, #8]
	add r0, sp, #9
	add r2, r0, r1
	subs r1, r1, #1
	beq _020E72DC
_020E72CC:
	ldrsb r0, [r2, #-1]!
	subs r1, r1, #1
	strb r0, [r8, #-1]!
	bne _020E72CC
_020E72DC:
	cmp r7, #0
	cmpeq r5, #0
	movne r0, #0x2e
	strneb r0, [r8, #-1]!
	ldrb r0, [sp, #9]
	strb r0, [r8, #-1]!
	ldrsb r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r8, #-1]!
	bne _020E749C
	cmp r4, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _020E749C
	cmp r4, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
	b _020E749C
_020E7328:
	ldrsh r3, [sp, #6]
	ldrb r2, [sp, #8]
	sub r0, r2, r3
	subs r1, r0, #1
	movmi r1, #0
	cmp r1, r7
	ble _020E7368
	sub r1, r1, r7
	add r0, sp, #4
	sub r1, r2, r1
	bl round_decimal__printf
	ldrsh r3, [sp, #6]
	ldrb r2, [sp, #8]
	sub r0, r2, r3
	subs r1, r0, #1
	movmi r1, #0
_020E7368:
	adds r0, r3, #1
	movmi r0, #0
	ldr r3, _020E74B0 ; =0x000001FD
	add r6, r0, r1
	cmp r6, r3
	addgt sp, sp, #0x2c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	add r3, sp, #9
	sub r6, r7, r1
	cmp r6, #0
	add r2, r3, r2
	mov sb, #0
	ble _020E73BC
	mov r3, #0x30
_020E73AC:
	add sb, sb, #1
	cmp sb, r6
	strb r3, [r8, #-1]!
	blt _020E73AC
_020E73BC:
	mov r6, #0
	b _020E73D0
_020E73C4:
	ldrsb r3, [r2, #-1]!
	add r6, r6, #1
	strb r3, [r8, #-1]!
_020E73D0:
	cmp r6, r1
	ldrltb r3, [sp, #8]
	cmplt r6, r3
	blt _020E73C4
	cmp r6, r1
	bge _020E73FC
	mov r3, #0x30
_020E73EC:
	add r6, r6, #1
	cmp r6, r1
	strb r3, [r8, #-1]!
	blt _020E73EC
_020E73FC:
	cmp r7, #0
	cmpeq r5, #0
	movne r1, #0x2e
	strneb r1, [r8, #-1]!
	cmp r0, #0
	beq _020E7464
	ldrb r1, [sp, #8]
	mov r5, #0
	sub r1, r0, r1
	cmp r1, #0
	ble _020E7444
	mov r3, #0x30
_020E742C:
	strb r3, [r8, #-1]!
	ldrb r1, [sp, #8]
	add r5, r5, #1
	sub r1, r0, r1
	cmp r5, r1
	blt _020E742C
_020E7444:
	cmp r5, r0
	bge _020E746C
_020E744C:
	ldrsb r1, [r2, #-1]!
	add r5, r5, #1
	cmp r5, r0
	strb r1, [r8, #-1]!
	blt _020E744C
	b _020E746C
_020E7464:
	mov r0, #0x30
	strb r0, [r8, #-1]!
_020E746C:
	ldrsb r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r8, #-1]!
	bne _020E749C
	cmp r4, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _020E749C
	cmp r4, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
_020E749C:
	mov r0, r8
	add sp, sp, #0x2c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E74B0: .word 0x000001FD
_020E74B4: .word _0210E504
_020E74B8: .word _0211131C
_020E74BC: .word _02111324
_020E74C0: .word _0211132C
_020E74C4: .word _02111330
_020E74C8: .word _02111334
_020E74CC: .word _0211133C
_020E74D0: .word _02111344
_020E74D4: .word _02111348
_020E74D8: .word 0x66666667
	arm_func_end float2str__printf

	arm_func_start __pformatter
__pformatter: ; 0x020E74DC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x22c
	mov r3, #0x20
	mov fp, r2
	strb r3, [sp, #0x19]
	ldrsb r2, [fp]
	mov sb, r0
	mov r8, r1
	cmp r2, #0
	mov sl, #0
	beq _020E7CE4
_020E750C:
	mov r0, fp
	mov r1, #0x25
	bl strchr
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _020E7560
	mov r0, fp
	bl strlen
	movs r2, r0
	add sl, sl, r2
	beq _020E7CE4
	mov r0, r8
	mov r1, fp
	blx sb
	cmp r0, #0
	bne _020E7CE4
	add sp, sp, #0x22c
	mvn r0, #0
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E7560:
	subs r2, r0, fp
	add sl, sl, r2
	beq _020E7590
	mov r0, r8
	mov r1, fp
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_020E7590:
	ldr r0, [sp, #0xc]
	add r1, sp, #0x25c
	add r2, sp, #0x1c
	bl parse_format__printf
	ldrb r1, [sp, #0x21]
	mov fp, r0
	cmp r1, #0x61
	bgt _020E75FC
	bge _020E7960
	cmp r1, #0x47
	bgt _020E75F0
	subs r0, r1, #0x41
	addpl pc, pc, r0, lsl #2
	b _020E75E4
_020E75C8: ; jump table
	b _020E7960 ; case 0
	b _020E7B48 ; case 1
	b _020E7B48 ; case 2
	b _020E7B48 ; case 3
	b _020E78F8 ; case 4
	b _020E78F8 ; case 5
	b _020E78F8 ; case 6
_020E75E4:
	cmp r1, #0x25
	beq _020E7B34
	b _020E7B48
_020E75F0:
	cmp r1, #0x58
	beq _020E77BC
	b _020E7B48
_020E75FC:
	cmp r1, #0x75
	bgt _020E7664
	subs r0, r1, #0x64
	addpl pc, pc, r0, lsl #2
	b _020E7658
_020E7610: ; jump table
	b _020E767C ; case 0
	b _020E78F8 ; case 1
	b _020E78F8 ; case 2
	b _020E78F8 ; case 3
	b _020E7B48 ; case 4
	b _020E767C ; case 5
	b _020E7B48 ; case 6
	b _020E7B48 ; case 7
	b _020E7B48 ; case 8
	b _020E7B48 ; case 9
	b _020E7A88 ; case 10
	b _020E77BC ; case 11
	b _020E7B48 ; case 12
	b _020E7B48 ; case 13
	b _020E7B48 ; case 14
	b _020E79C8 ; case 15
	b _020E7B48 ; case 16
	b _020E77BC ; case 17
_020E7658:
	cmp r1, #0x63
	beq _020E7B14
	b _020E7B48
_020E7664:
	cmp r1, #0x78
	bgt _020E7674
	beq _020E77BC
	b _020E7B48
_020E7674:
	cmp r1, #0xff
	b _020E7B48
_020E767C:
	ldrb r0, [sp, #0x20]
	cmp r0, #3
	bne _020E769C
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _020E7734
_020E769C:
	cmp r0, #4
	bne _020E76C4
	ldr r1, [sp, #0x25c]
	add r2, r1, #8
	str r2, [sp, #0x25c]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020E7734
_020E76C4:
	cmp r0, #6
	bne _020E76EC
	ldr r1, [sp, #0x25c]
	add r2, r1, #8
	str r2, [sp, #0x25c]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020E7734
_020E76EC:
	cmp r0, #7
	bne _020E7708
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _020E7734
_020E7708:
	cmp r0, #8
	bne _020E7724
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _020E7734
_020E7724:
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
_020E7734:
	cmp r0, #2
	moveq r1, r5, lsl #0x10
	moveq r5, r1, asr #0x10
	cmp r0, #1
	moveq r1, r5, lsl #0x18
	moveq r5, r1, asr #0x18
	cmp r0, #4
	cmpne r0, #6
	add r0, sp, #0x1c
	bne _020E7788
	sub r4, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r3, [r4]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x22c
	bl longlong2str__printf
	movs r7, r0
	beq _020E7B48
	b _020E77AC
_020E7788:
	sub r4, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	add r1, sp, #0x22c
	mov r0, r5
	ldmia r4, {r2, r3}
	bl long2str__printf
	movs r7, r0
	beq _020E7B48
_020E77AC:
	add r0, sp, #0x200
	add r0, r0, #0x2b
	sub r6, r0, r7
	b _020E7B94
_020E77BC:
	ldrb r0, [sp, #0x20]
	cmp r0, #3
	bne _020E77DC
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _020E7874
_020E77DC:
	cmp r0, #4
	bne _020E7804
	ldr r1, [sp, #0x25c]
	add r2, r1, #8
	str r2, [sp, #0x25c]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020E7874
_020E7804:
	cmp r0, #6
	bne _020E782C
	ldr r1, [sp, #0x25c]
	add r2, r1, #8
	str r2, [sp, #0x25c]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020E7874
_020E782C:
	cmp r0, #7
	bne _020E7848
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _020E7874
_020E7848:
	cmp r0, #8
	bne _020E7864
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
	b _020E7874
_020E7864:
	ldr r1, [sp, #0x25c]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r5, [r1, #-4]
_020E7874:
	cmp r0, #2
	moveq r1, r5, lsl #0x10
	moveq r5, r1, lsr #0x10
	cmp r0, #1
	andeq r5, r5, #0xff
	cmp r0, #4
	cmpne r0, #6
	add r0, sp, #0x1c
	bne _020E78C4
	sub r4, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r3, [r4]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x22c
	bl longlong2str__printf
	movs r7, r0
	beq _020E7B48
	b _020E78E8
_020E78C4:
	sub r4, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	add r1, sp, #0x22c
	mov r0, r5
	ldmia r4, {r2, r3}
	bl long2str__printf
	movs r7, r0
	beq _020E7B48
_020E78E8:
	add r0, sp, #0x200
	add r0, r0, #0x2b
	sub r6, r0, r7
	b _020E7B94
_020E78F8:
	ldrb r0, [sp, #0x20]
	cmp r0, #9
	ldrne r0, [sp, #0x25c]
	addne r0, r0, #8
	strne r0, [sp, #0x25c]
	bne _020E791C
	ldr r0, [sp, #0x25c]
	add r0, r0, #8
	str r0, [sp, #0x25c]
_020E791C:
	ldr r7, [r0, #-8]
	ldr r6, [r0, #-4]
	add r0, sp, #0x1c
	sub r4, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r3, [r4]
	mov r0, r7
	mov r1, r6
	add r2, sp, #0x22c
	bl float2str__printf
	movs r7, r0
	beq _020E7B48
	add r0, sp, #0x200
	add r0, r0, #0x2b
	sub r6, r0, r7
	b _020E7B94
_020E7960:
	ldrb r0, [sp, #0x20]
	cmp r0, #9
	ldrne r0, [sp, #0x25c]
	addne r0, r0, #8
	strne r0, [sp, #0x25c]
	bne _020E7984
	ldr r0, [sp, #0x25c]
	add r0, r0, #8
	str r0, [sp, #0x25c]
_020E7984:
	ldr r7, [r0, #-8]
	ldr r6, [r0, #-4]
	add r0, sp, #0x1c
	sub r4, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r4, {r0, r1, r2, r3}
	ldr r3, [r4]
	mov r0, r7
	mov r1, r6
	add r2, sp, #0x22c
	bl double2hex__printf
	movs r7, r0
	beq _020E7B48
	add r0, sp, #0x200
	add r0, r0, #0x2b
	sub r6, r0, r7
	b _020E7B94
_020E79C8:
	ldrb r0, [sp, #0x20]
	cmp r0, #5
	bne _020E7A08
	ldr r0, [sp, #0x25c]
	mov r2, #0x200
	add r0, r0, #4
	str r0, [sp, #0x25c]
	ldr r1, [r0, #-4]
	add r0, sp, #0x2c
	cmp r1, #0
	ldreq r1, _020E7CF8 ; =_0211134C
	bl wcstombs
	cmp r0, #0
	blt _020E7B48
	add r7, sp, #0x2c
	b _020E7A18
_020E7A08:
	ldr r0, [sp, #0x25c]
	add r0, r0, #4
	str r0, [sp, #0x25c]
	ldr r7, [r0, #-4]
_020E7A18:
	ldrb r0, [sp, #0x1f]
	cmp r7, #0
	ldreq r7, _020E7CFC ; =_02111350
	cmp r0, #0
	beq _020E7A4C
	ldrb r0, [sp, #0x1e]
	ldrb r6, [r7], #1
	cmp r0, #0
	beq _020E7B94
	ldr r0, [sp, #0x28]
	cmp r6, r0
	movgt r6, r0
	b _020E7B94
_020E7A4C:
	ldrb r0, [sp, #0x1e]
	cmp r0, #0
	beq _020E7A78
	ldr r6, [sp, #0x28]
	mov r0, r7
	mov r2, r6
	mov r1, #0
	bl memchr
	cmp r0, #0
	subne r6, r0, r7
	b _020E7B94
_020E7A78:
	mov r0, r7
	bl strlen
	mov r6, r0
	b _020E7B94
_020E7A88:
	ldr r1, [sp, #0x25c]
	ldrb r0, [sp, #0x20]
	add r1, r1, #4
	str r1, [sp, #0x25c]
	ldr r1, [r1, #-4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020E7CD8
_020E7AA8: ; jump table
	b _020E7ACC ; case 0
	b _020E7CD8 ; case 1
	b _020E7AD4 ; case 2
	b _020E7ADC ; case 3
	b _020E7B04 ; case 4
	b _020E7CD8 ; case 5
	b _020E7AE4 ; case 6
	b _020E7AF4 ; case 7
	b _020E7AFC ; case 8
_020E7ACC:
	str sl, [r1]
	b _020E7CD8
_020E7AD4:
	strh sl, [r1]
	b _020E7CD8
_020E7ADC:
	str sl, [r1]
	b _020E7CD8
_020E7AE4:
	str sl, [r1]
	mov r0, sl, asr #0x1f
	str r0, [r1, #4]
	b _020E7CD8
_020E7AF4:
	str sl, [r1]
	b _020E7CD8
_020E7AFC:
	str sl, [r1]
	b _020E7CD8
_020E7B04:
	str sl, [r1]
	mov r0, sl, asr #0x1f
	str r0, [r1, #4]
	b _020E7CD8
_020E7B14:
	ldr r0, [sp, #0x25c]
	add r7, sp, #0x2c
	add r0, r0, #4
	str r0, [sp, #0x25c]
	ldr r0, [r0, #-4]
	mov r6, #1
	strb r0, [sp, #0x2c]
	b _020E7B94
_020E7B34:
	mov r0, #0x25
	strb r0, [sp, #0x2c]
	add r7, sp, #0x2c
	mov r6, #1
	b _020E7B94
_020E7B48:
	ldr r0, [sp, #0xc]
	bl strlen
	movs r4, r0
	beq _020E7B80
	ldr r1, [sp, #0xc]
	mov r0, r8
	mov r2, r4
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_020E7B80:
	add sp, sp, #0x22c
	add r0, sl, r4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020E7B94:
	ldrb r0, [sp, #0x1c]
	mov r4, r6
	cmp r0, #0
	beq _020E7C48
	cmp r0, #2
	moveq r0, #0x30
	movne r0, #0x20
	strb r0, [sp, #0x19]
	ldrsb r0, [r7]
	cmp r0, #0x2b
	cmpne r0, #0x2d
	cmpne r0, #0x20
	bne _020E7C04
	ldrsb r0, [sp, #0x19]
	cmp r0, #0x30
	bne _020E7C04
	mov r0, r8
	mov r1, r7
	mov r2, #1
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	add r7, r7, #1
	sub r6, r6, #1
_020E7C04:
	ldr r0, [sp, #0x24]
	cmp r4, r0
	bge _020E7C48
_020E7C10:
	mov r0, r8
	add r1, sp, #0x19
	mov r2, #1
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #0x24]
	add r4, r4, #1
	cmp r4, r0
	blt _020E7C10
_020E7C48:
	cmp r6, #0
	beq _020E7C78
	mov r0, r8
	mov r1, r7
	mov r2, r6
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_020E7C78:
	ldrb r0, [sp, #0x1c]
	cmp r0, #0
	bne _020E7CD4
	ldr r0, [sp, #0x24]
	cmp r4, r0
	bge _020E7CD4
	mov r6, #0x20
	add r7, sp, #0x18
_020E7C98:
	mov r0, r8
	mov r1, r7
	mov r2, #1
	strb r6, [sp, #0x18]
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x22c
	mvneq r0, #0
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #0x24]
	add r4, r4, #1
	cmp r4, r0
	blt _020E7C98
_020E7CD4:
	add sl, sl, r4
_020E7CD8:
	ldrsb r0, [fp]
	cmp r0, #0
	bne _020E750C
_020E7CE4:
	mov r0, sl
	add sp, sp, #0x22c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E7CF8: .word _0211134C
_020E7CFC: .word _02111350
	arm_func_end __pformatter

	arm_func_start __FileWrite
__FileWrite: ; 0x020E7D00
	stmdb sp!, {r3, r4, r5, lr}
	mov r5, r0
	mov r0, r1
	mov r3, r5
	mov r1, #1
	mov r4, r2
	bl __fwrite
	cmp r4, r0
	movne r5, #0
	mov r0, r5
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __FileWrite

	arm_func_start __StringWrite
__StringWrite: ; 0x020E7D2C
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r3, [r4, #8]
	mov r5, r2
	ldr r2, [r4, #4]
	add r0, r3, r5
	cmp r0, r2
	ldr r0, [r4]
	subhi r5, r2, r3
	mov r2, r5
	add r0, r0, r3
	bl memcpy
	ldr r1, [r4, #8]
	mov r0, #1
	add r1, r1, r5
	str r1, [r4, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __StringWrite

	arm_func_start printf
printf: ; 0x020E7D70
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	ldr r0, _020E7E70 ; =_02111018
	mvn r1, #0
	bl fwide
	cmp r0, #0
	mvnge r0, #0
	ldmgeia sp!, {r4, lr}
	addge sp, sp, #0x10
	bxge lr
	ldr r0, _020E7E74 ; =_021E5530
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020E7DCC
	ldr r0, _020E7E78 ; =OSi_ThreadInfo
	ldr r1, _020E7E7C ; =_021E54A0
	ldr r2, [r0, #4]
	ldr r0, _020E7E80 ; =_021E54C4
	ldr r3, [r2, #0x6c]
	mov r2, #1
	str r3, [r1, #0xc]
	str r2, [r0, #0xc]
	b _020E7E24
_020E7DCC:
	ldr r0, _020E7E78 ; =OSi_ThreadInfo
	ldr r1, _020E7E7C ; =_021E54A0
	ldr r0, [r0, #4]
	ldr r1, [r1, #0xc]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _020E7DFC
	ldr r0, _020E7E80 ; =_021E54C4
	ldr r1, [r0, #0xc]
	add r1, r1, #1
	str r1, [r0, #0xc]
	b _020E7E24
_020E7DFC:
	ldr r0, _020E7E74 ; =_021E5530
	bl OS_LockMutex
	ldr r0, _020E7E78 ; =OSi_ThreadInfo
	ldr r1, _020E7E7C ; =_021E54A0
	ldr r2, [r0, #4]
	ldr r0, _020E7E80 ; =_021E54C4
	ldr r3, [r2, #0x6c]
	mov r2, #1
	str r3, [r1, #0xc]
	str r2, [r0, #0xc]
_020E7E24:
	add r0, sp, #8
	bic r3, r0, #3
	ldr r2, [sp, #8]
	ldr r0, _020E7E84 ; =__FileWrite
	ldr r1, _020E7E70 ; =_02111018
	add r3, r3, #4
	bl __pformatter
	ldr r1, _020E7E80 ; =_021E54C4
	mov r4, r0
	ldr r0, [r1, #0xc]
	subs r0, r0, #1
	str r0, [r1, #0xc]
	bne _020E7E60
	ldr r0, _020E7E74 ; =_021E5530
	bl OS_UnlockMutex
_020E7E60:
	mov r0, r4
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020E7E70: .word _02111018
_020E7E74: .word _021E5530
_020E7E78: .word OSi_ThreadInfo
_020E7E7C: .word _021E54A0
_020E7E80: .word _021E54C4
_020E7E84: .word __FileWrite
	arm_func_end printf

	arm_func_start vsnprintf
vsnprintf: ; 0x020E7E88
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r4, r1
	mov ip, #0
	ldr r0, _020E7EEC ; =__StringWrite
	add r1, sp, #0
	str r5, [sp]
	str r4, [sp, #4]
	str ip, [sp, #8]
	bl __pformatter
	cmp r5, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, pc}
	cmp r0, r4
	movlo r1, #0
	addlo sp, sp, #0xc
	strlob r1, [r5, r0]
	ldmloia sp!, {r4, r5, pc}
	cmp r4, #0
	addne r1, r5, r4
	movne r2, #0
	strneb r2, [r1, #-1]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020E7EEC: .word __StringWrite
	arm_func_end vsnprintf

	arm_func_start vsprintf
vsprintf: ; 0x020E7EF0
	ldr ip, _020E7F04 ; =vsnprintf
	mov r3, r2
	mov r2, r1
	mvn r1, #0
	bx ip
	.align 2, 0
_020E7F04: .word vsnprintf
	arm_func_end vsprintf

	arm_func_start snprintf
snprintf: ; 0x020E7F08
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r3, sp, #0x10
	bic r3, r3, #3
	ldr r2, [sp, #0x10]
	add r3, r3, #4
	bl vsnprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end snprintf

	arm_func_start sprintf
sprintf: ; 0x020E7F30
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r1, sp, #0xc
	bic r1, r1, #3
	add r3, r1, #4
	ldr r2, [sp, #0xc]
	mvn r1, #0
	bl vsnprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sprintf

	arm_func_start qsort
qsort: ; 0x020E7F5C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	mov sb, r1
	cmp sb, #2
	mov sl, r0
	mov r8, r2
	mov r7, r3
	addlo sp, sp, #0x10
	ldmloia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	mov r0, sb, lsr #1
	add fp, r0, #1
	sub r0, fp, #1
	mla r0, r8, r0, sl
	sub r2, sb, #1
	str r0, [sp, #0xc]
	mla r0, r8, r2, sl
	str r0, [sp, #8]
	mul r0, fp, r8
	mvn r1, #0
	str r0, [sp, #4]
	mul r0, r8, r1
	str r0, [sp]
_020E7FB4:
	cmp fp, #1
	bls _020E7FDC
	ldr r0, [sp, #4]
	sub fp, fp, #1
	sub r0, r0, r8
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	sub r0, r0, r8
	str r0, [sp, #0xc]
	b _020E8024
_020E7FDC:
	mov r2, r8
	ldr r4, [sp, #8]
	ldr r3, [sp, #0xc]
	cmp r8, #0
	beq _020E8008
_020E7FF0:
	ldrsb r0, [r4]
	ldrsb r1, [r3]
	subs r2, r2, #1
	strb r0, [r3], #1
	strb r1, [r4], #1
	bne _020E7FF0
_020E8008:
	sub sb, sb, #1
	cmp sb, #1
	addeq sp, sp, #0x10
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #8]
	sub r0, r0, r8
	str r0, [sp, #8]
_020E8024:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	mov r4, fp
	add r0, r1, r0
	cmp sb, fp, lsl #1
	add r5, sl, r0
	blo _020E7FB4
_020E8040:
	mov r4, r4, lsl #1
	sub r0, r4, #1
	mov r6, r5
	mla r5, r8, r0, sl
	cmp sb, r4
	bls _020E8070
	mov r0, r5
	add r1, r5, r8
	blx r7
	cmp r0, #0
	addlt r4, r4, #1
	addlt r5, r5, r8
_020E8070:
	mov r0, r6
	mov r1, r5
	blx r7
	cmp r0, #0
	bge _020E7FB4
	mov r2, r8
	mov r3, r5
	cmp r8, #0
	beq _020E80AC
_020E8094:
	ldrsb r1, [r6]
	ldrsb r0, [r3]
	subs r2, r2, #1
	strb r0, [r6], #1
	strb r1, [r3], #1
	bne _020E8094
_020E80AC:
	cmp sb, r4, lsl #1
	bhs _020E8040
	b _020E7FB4
_020E80B8: ; 0x020E80B8
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end qsort

	arm_func_start rand
rand: ; 0x020E80C0
	ldr r2, _020E80E8 ; =_02111354
	ldr r0, _020E80EC ; =0x41C64E6D
	ldr r3, [r2]
	ldr r1, _020E80F0 ; =0x00007FFF
	mul r0, r3, r0
	add r0, r0, #0x39
	add r0, r0, #0x3000
	str r0, [r2]
	and r0, r1, r0, lsr #16
	bx lr
	.align 2, 0
_020E80E8: .word _02111354
_020E80EC: .word 0x41C64E6D
_020E80F0: .word 0x00007FFF
	arm_func_end rand

	arm_func_start srand
srand: ; 0x020E80F4
	ldr r1, _020E8100 ; =_02111354
	str r0, [r1]
	bx lr
	.align 2, 0
_020E8100: .word _02111354
	arm_func_end srand

	arm_func_start parse_format__printf__scanf
parse_format__printf__scanf: ; 0x020E8104 static routine
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	sub sp, sp, #0x28
	ldr r6, _020E85F4 ; =_0210E604
	add r5, sp, #0
	mov r7, r0
	mov lr, r1
	mov r4, r5
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia r6!, {r0, r1, r2, r3}
	stmia r5!, {r0, r1, r2, r3}
	ldmia r6, {r0, r1}
	stmia r5, {r0, r1}
	ldrsb r0, [r7, #1]
	add ip, r7, #1
	cmp r0, #0x25
	bne _020E8170
	strb r0, [sp, #3]
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
	add sp, sp, #0x28
	add r0, ip, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020E8170:
	cmp r0, #0x2a
	moveq r0, #1
	streqb r0, [sp]
	ldreqsb r0, [ip, #1]!
	cmp r0, #0
	blt _020E8190
	cmp r0, #0x80
	blt _020E8198
_020E8190:
	mov r1, #0
	b _020E81A8
_020E8198:
	ldr r1, _020E85F8 ; =_0210E504
	mov r2, r0, lsl #1
	ldrh r1, [r1, r2]
	and r1, r1, #8
_020E81A8:
	cmp r1, #0
	beq _020E8248
	mov r1, #0
	ldr r3, _020E85F8 ; =_0210E504
	str r1, [sp, #4]
	mov r4, r1
	mov r1, #0xa
_020E81C4:
	ldr r2, [sp, #4]
	sub r0, r0, #0x30
	mla r0, r2, r1, r0
	str r0, [sp, #4]
	ldrsb r0, [ip, #1]!
	cmp r0, #0
	blt _020E81E8
	cmp r0, #0x80
	blt _020E81F0
_020E81E8:
	mov r2, r4
	b _020E81FC
_020E81F0:
	mov r2, r0, lsl #1
	ldrh r2, [r3, r2]
	and r2, r2, #8
_020E81FC:
	cmp r2, #0
	bne _020E81C4
	ldr r1, [sp, #4]
	cmp r1, #0
	bne _020E8240
	mov r0, #0xff
	add r4, sp, #0
	strb r0, [sp, #3]
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
	add sp, sp, #0x28
	add r0, ip, #1
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
_020E8240:
	mov r1, #1
	strb r1, [sp, #1]
_020E8248:
	cmp r0, #0x6c
	mov r1, #1
	bgt _020E8280
	cmp r0, #0x68
	blt _020E8274
	beq _020E829C
	cmp r0, #0x6a
	beq _020E82E8
	cmp r0, #0x6c
	beq _020E82B8
	b _020E830C
_020E8274:
	cmp r0, #0x4c
	beq _020E82DC
	b _020E830C
_020E8280:
	cmp r0, #0x74
	bgt _020E8290
	beq _020E8300
	b _020E830C
_020E8290:
	cmp r0, #0x7a
	beq _020E82F4
	b _020E830C
_020E829C:
	mov r2, #2
	strb r2, [sp, #2]
	ldrsb r2, [ip, #1]
	cmp r2, #0x68
	streqb r1, [sp, #2]
	ldreqsb r0, [ip, #1]!
	b _020E8310
_020E82B8:
	mov r2, #3
	strb r2, [sp, #2]
	ldrsb r2, [ip, #1]
	cmp r2, #0x6c
	bne _020E8310
	mov r0, #7
	strb r0, [sp, #2]
	ldrsb r0, [ip, #1]!
	b _020E8310
_020E82DC:
	mov r2, #9
	strb r2, [sp, #2]
	b _020E8310
_020E82E8:
	mov r2, #4
	strb r2, [sp, #2]
	b _020E8310
_020E82F4:
	mov r2, #5
	strb r2, [sp, #2]
	b _020E8310
_020E8300:
	mov r2, #6
	strb r2, [sp, #2]
	b _020E8310
_020E830C:
	mov r1, #0
_020E8310:
	cmp r1, #0
	ldrnesb r0, [ip, #1]!
	strb r0, [sp, #3]
	cmp r0, #0x5b
	bgt _020E8364
	bge _020E84B4
	cmp r0, #0x47
	bgt _020E8358
	subs r1, r0, #0x41
	addpl pc, pc, r1, lsl #2
	b _020E85C4
_020E833C: ; jump table
	b _020E83F0 ; case 0
	b _020E85C4 ; case 1
	b _020E85C4 ; case 2
	b _020E85C4 ; case 3
	b _020E83F0 ; case 4
	b _020E83F0 ; case 5
	b _020E83F0 ; case 6
_020E8358:
	cmp r0, #0x58
	beq _020E83DC
	b _020E85C4
_020E8364:
	cmp r0, #0x61
	bgt _020E8374
	beq _020E83F0
	b _020E85C4
_020E8374:
	sub r0, r0, #0x63
	cmp r0, #0x15
	addls pc, pc, r0, lsl #2
	b _020E85C4
_020E8384: ; jump table
	b _020E8440 ; case 0
	b _020E83DC ; case 1
	b _020E83F0 ; case 2
	b _020E83F0 ; case 3
	b _020E83F0 ; case 4
	b _020E85C4 ; case 5
	b _020E83DC ; case 6
	b _020E85C4 ; case 7
	b _020E85C4 ; case 8
	b _020E85C4 ; case 9
	b _020E85C4 ; case 10
	b _020E85CC ; case 11
	b _020E83DC ; case 12
	b _020E842C ; case 13
	b _020E85C4 ; case 14
	b _020E85C4 ; case 15
	b _020E8464 ; case 16
	b _020E85C4 ; case 17
	b _020E83DC ; case 18
	b _020E85C4 ; case 19
	b _020E85C4 ; case 20
	b _020E83DC ; case 21
_020E83DC:
	ldrb r0, [sp, #2]
	cmp r0, #9
	moveq r0, #0xff
	streqb r0, [sp, #3]
	b _020E85CC
_020E83F0:
	ldrb r1, [sp, #2]
	cmp r1, #1
	cmpne r1, #2
	beq _020E8410
	add r0, r1, #0xfc
	and r0, r0, #0xff
	cmp r0, #3
	bhi _020E841C
_020E8410:
	mov r0, #0xff
	strb r0, [sp, #3]
	b _020E85CC
_020E841C:
	cmp r1, #3
	moveq r0, #8
	streqb r0, [sp, #2]
	b _020E85CC
_020E842C:
	mov r1, #3
	mov r0, #0x78
	strb r1, [sp, #2]
	strb r0, [sp, #3]
	b _020E85CC
_020E8440:
	ldrb r0, [sp, #2]
	cmp r0, #3
	moveq r0, #0xa
	streqb r0, [sp, #2]
	beq _020E85CC
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sp, #3]
	b _020E85CC
_020E8464:
	ldrb r0, [sp, #2]
	cmp r0, #3
	moveq r0, #0xa
	streqb r0, [sp, #2]
	beq _020E8484
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sp, #3]
_020E8484:
	add r2, sp, #8
	mov r1, #0x20
	mov r0, #0xff
_020E8490:
	sub r1, r1, #1
	cmp r1, #0
	strb r0, [r2], #1
	bgt _020E8490
	mov r1, #0xc1
	mov r0, #0xfe
	strb r1, [sp, #9]
	strb r0, [sp, #0xc]
	b _020E85CC
_020E84B4:
	ldrb r0, [sp, #2]
	cmp r0, #3
	moveq r0, #0xa
	streqb r0, [sp, #2]
	beq _020E84D4
	cmp r0, #0
	movne r0, #0xff
	strneb r0, [sp, #3]
_020E84D4:
	ldrsb r2, [ip, #1]!
	mov r1, #0
	cmp r2, #0x5e
	ldreqsb r2, [ip, #1]!
	moveq r1, #1
	cmp r2, #0x5d
	bne _020E857C
	ldrb r0, [sp, #0x13]
	orr r0, r0, #0x20
	strb r0, [sp, #0x13]
	ldrsb r2, [ip, #1]!
	b _020E857C
_020E8504:
	add r0, sp, #0
	and r3, r2, #0xff
	add r6, r0, r3, asr #3
	ldrb r5, [r6, #8]
	and r3, r2, #7
	mov r4, #1
	orr r3, r5, r4, lsl r3
	strb r3, [r6, #8]
	ldrsb r3, [ip, #1]
	cmp r3, #0x2d
	bne _020E8578
	ldrsb r7, [ip, #2]
	cmp r7, #0
	cmpne r7, #0x5d
	beq _020E8578
	add r2, r2, #1
	cmp r2, r7
	bgt _020E8570
_020E854C:
	and r3, r2, #0xff
	add r6, r0, r3, asr #3
	ldrb r5, [r6, #8]
	and r3, r2, #7
	add r2, r2, #1
	orr r3, r5, r4, lsl r3
	strb r3, [r6, #8]
	cmp r2, r7
	ble _020E854C
_020E8570:
	ldrsb r2, [ip, #3]!
	b _020E857C
_020E8578:
	ldrsb r2, [ip, #1]!
_020E857C:
	cmp r2, #0
	cmpne r2, #0x5d
	bne _020E8504
	cmp r2, #0
	moveq r0, #0xff
	streqb r0, [sp, #3]
	beq _020E85CC
	cmp r1, #0
	beq _020E85CC
	add r2, sp, #8
	mov r1, #0x20
_020E85A8:
	ldrb r0, [r2]
	sub r1, r1, #1
	cmp r1, #0
	mvn r0, r0
	strb r0, [r2], #1
	bgt _020E85A8
	b _020E85CC
_020E85C4:
	mov r0, #0xff
	strb r0, [sp, #3]
_020E85CC:
	add r4, sp, #0
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4!, {r0, r1, r2, r3}
	stmia lr!, {r0, r1, r2, r3}
	ldmia r4, {r0, r1}
	stmia lr, {r0, r1}
	add r0, ip, #1
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_020E85F4: .word _0210E604
_020E85F8: .word _0210E504
	arm_func_end parse_format__printf__scanf

	arm_func_start __sformatter
__sformatter: ; 0x020E85FC
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x88
	ldrsb r5, [r2]
	str r2, [sp, #0xc]
	mov r2, #0
	mov sb, r0
	mov r0, r2
	str r2, [sp, #0x20]
	mov r8, r1
	str r3, [sp, #0x10]
	str r0, [sp, #0x24]
	cmp r5, #0
	ldr sl, [sp, #0xb0]
	str r0, [sp, #0x30]
	mov r4, r2
	str r0, [sp, #0x44]
	str r0, [sp, #0x40]
	beq _020E9310
_020E8644:
	cmp r5, #0
	mov r0, #1
	blt _020E8658
	cmp r5, #0x80
	movlt r0, #0
_020E8658:
	cmp r0, #0
	movne r0, #0
	bne _020E8674
	mov r1, r5, lsl #1
	ldr r0, _020E9348 ; =_0210E504
	ldrh r0, [r0, r1]
	and r0, r0, #0x100
_020E8674:
	cmp r0, #0
	beq _020E8734
	mov r2, #0
	ldr r1, _020E9348 ; =_0210E504
	mov ip, r2
	mov r3, #1
_020E868C:
	ldr r0, [sp, #0xc]
	ldrsb r5, [r0, #1]!
	str r0, [sp, #0xc]
	mov r0, r3
	cmp r5, #0
	blt _020E86AC
	cmp r5, #0x80
	movlt r0, r2
_020E86AC:
	cmp r0, #0
	movne r0, ip
	moveq r0, r5, lsl #1
	ldreqh r0, [r1, r0]
	andeq r0, r0, #0x100
	cmp r0, #0
	bne _020E868C
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _020E9300
	ldr r5, _020E9348 ; =_0210E504
	b _020E86E0
_020E86DC:
	add r4, r4, #1
_020E86E0:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	strb r0, [sp, #0x50]
	ldrsb r1, [sp, #0x50]
	cmp r1, #0
	blt _020E8708
	cmp r1, #0x80
	blt _020E8710
_020E8708:
	mov r0, #0
	b _020E871C
_020E8710:
	mov r0, r1, lsl #1
	ldrh r0, [r5, r0]
	and r0, r0, #0x100
_020E871C:
	cmp r0, #0
	bne _020E86DC
	mov r0, r8
	mov r2, #1
	blx sb
	b _020E9300
_020E8734:
	cmp r5, #0x25
	beq _020E87AC
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _020E87AC
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	strb r0, [sp, #0x50]
	and r0, r5, #0xff
	ldrsb r1, [sp, #0x50]
	cmp r0, r1
	beq _020E8798
	mov r0, r8
	mov r2, #1
	blx sb
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	str r0, [sp, #0x30]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	b _020E9300
_020E8798:
	ldr r0, [sp, #0xc]
	add r4, r4, #1
	add r0, r0, #1
	str r0, [sp, #0xc]
	b _020E9300
_020E87AC:
	ldr r0, [sp, #0xc]
	add r1, sp, #0x60
	bl parse_format__printf__scanf
	str r0, [sp, #0xc]
	ldrb r0, [sp, #0x60]
	cmp r0, #0
	bne _020E87E8
	ldrb r0, [sp, #0x63]
	cmp r0, #0x25
	beq _020E87E8
	ldr r0, [sp, #0x10]
	add r0, r0, #4
	str r0, [sp, #0x10]
	ldr r5, [r0, #-4]
	b _020E87EC
_020E87E8:
	mov r5, #0
_020E87EC:
	ldrb r0, [sp, #0x63]
	cmp r0, #0x6e
	beq _020E882C
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _020E882C
	mov r0, r8
	mov r1, #0
	mov r2, #2
	blx sb
	cmp r0, #0
	beq _020E882C
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	str r0, [sp, #0x30]
_020E882C:
	ldrb r1, [sp, #0x63]
	cmp r1, #0x5b
	bgt _020E8884
	bge _020E9058
	cmp r1, #0x47
	bgt _020E8878
	subs r0, r1, #0x41
	addpl pc, pc, r0, lsl #2
	b _020E886C
_020E8850: ; jump table
	b _020E8CD4 ; case 0
	b _020E9310 ; case 1
	b _020E9310 ; case 2
	b _020E9310 ; case 3
	b _020E8CD4 ; case 4
	b _020E8CD4 ; case 5
	b _020E8CD4 ; case 6
_020E886C:
	cmp r1, #0x25
	beq _020E8F50
	b _020E9310
_020E8878:
	cmp r1, #0x58
	beq _020E8B10
	b _020E9310
_020E8884:
	cmp r1, #0x78
	bgt _020E88FC
	subs r0, r1, #0x63
	addpl pc, pc, r0, lsl #2
	b _020E88F0
_020E8898: ; jump table
	b _020E8D98 ; case 0
	b _020E8904 ; case 1
	b _020E8CD4 ; case 2
	b _020E8CD4 ; case 3
	b _020E8CD4 ; case 4
	b _020E9310 ; case 5
	b _020E890C ; case 6
	b _020E9310 ; case 7
	b _020E9310 ; case 8
	b _020E9310 ; case 9
	b _020E9310 ; case 10
	b _020E929C ; case 11
	b _020E8B00 ; case 12
	b _020E9310 ; case 13
	b _020E9310 ; case 14
	b _020E9310 ; case 15
	b _020E8FDC ; case 16
	b _020E9310 ; case 17
	b _020E8B08 ; case 18
	b _020E9310 ; case 19
	b _020E9310 ; case 20
	b _020E8B10 ; case 21
_020E88F0:
	cmp r1, #0x61
	beq _020E8CD4
	b _020E9310
_020E88FC:
	cmp r1, #0xff
	b _020E9310
_020E8904:
	mov r0, #0xa
	b _020E8910
_020E890C:
	mov r0, #0
_020E8910:
	ldr r1, [sp, #0x30]
	cmp r1, #0
	beq _020E8930
	mov r0, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	b _020E8A38
_020E8930:
	ldrb r1, [sp, #0x62]
	add r2, sp, #0x5c
	cmp r1, #7
	cmpne r1, #4
	add r1, sp, #0x58
	bne _020E8974
	str r2, [sp]
	str r1, [sp, #4]
	add r1, sp, #0x54
	str r1, [sp, #8]
	ldr r1, [sp, #0x64]
	mov r2, sb
	mov r3, r8
	bl __strtoull
	str r0, [sp, #0x34]
	str r1, [sp, #0x18]
	b _020E8998
_020E8974:
	str r2, [sp]
	str r1, [sp, #4]
	add r1, sp, #0x54
	str r1, [sp, #8]
	ldr r1, [sp, #0x64]
	mov r2, sb
	mov r3, r8
	bl __strtoul
	str r0, [sp, #0x3c]
_020E8998:
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	bne _020E89C8
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	str r0, [sp, #0x30]
	mov r0, #0
	str r0, [sp, #0x1c]
	str r0, [sp, #0x20]
	str r0, [sp, #0x24]
	b _020E8A38
_020E89C8:
	add r4, r4, r0
	ldrb r0, [sp, #0x62]
	cmp r0, #7
	cmpne r0, #4
	bne _020E8A18
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _020E8A04
	ldr r0, [sp, #0x34]
	rsbs r0, r0, #0
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	rsc r0, r0, #0
	str r0, [sp, #0x24]
	b _020E8A38
_020E8A04:
	ldr r0, [sp, #0x34]
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x18]
	str r0, [sp, #0x24]
	b _020E8A38
_020E8A18:
	ldr r0, [sp, #0x58]
	cmp r0, #0
	ldreq r0, [sp, #0x3c]
	streq r0, [sp, #0x1c]
	beq _020E8A38
	ldr r0, [sp, #0x3c]
	rsb r0, r0, #0
	str r0, [sp, #0x1c]
_020E8A38:
	cmp r5, #0
	beq _020E8AF0
	ldrb r0, [sp, #0x62]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020E8ADC
_020E8A50: ; jump table
	b _020E8A70 ; case 0
	b _020E8A7C ; case 1
	b _020E8A88 ; case 2
	b _020E8A94 ; case 3
	b _020E8AA0 ; case 4
	b _020E8AB4 ; case 5
	b _020E8AC0 ; case 6
	b _020E8ACC ; case 7
_020E8A70:
	ldr r0, [sp, #0x1c]
	str r0, [r5]
	b _020E8ADC
_020E8A7C:
	ldr r0, [sp, #0x1c]
	strb r0, [r5]
	b _020E8ADC
_020E8A88:
	ldr r0, [sp, #0x1c]
	strh r0, [r5]
	b _020E8ADC
_020E8A94:
	ldr r0, [sp, #0x1c]
	str r0, [r5]
	b _020E8ADC
_020E8AA0:
	ldr r0, [sp, #0x20]
	str r0, [r5]
	ldr r0, [sp, #0x24]
	str r0, [r5, #4]
	b _020E8ADC
_020E8AB4:
	ldr r0, [sp, #0x1c]
	str r0, [r5]
	b _020E8ADC
_020E8AC0:
	ldr r0, [sp, #0x1c]
	str r0, [r5]
	b _020E8ADC
_020E8ACC:
	ldr r0, [sp, #0x20]
	str r0, [r5]
	ldr r0, [sp, #0x24]
	str r0, [r5, #4]
_020E8ADC:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	ldreq r0, [sp, #0x44]
	addeq r0, r0, #1
	streq r0, [sp, #0x44]
_020E8AF0:
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	str r0, [sp, #0x40]
	b _020E9300
_020E8B00:
	mov r0, #8
	b _020E8B14
_020E8B08:
	mov r0, #0xa
	b _020E8B14
_020E8B10:
	mov r0, #0x10
_020E8B14:
	ldr r1, [sp, #0x30]
	cmp r1, #0
	beq _020E8B34
	mov r0, #0
	str r0, [sp, #0x3c]
	str r0, [sp, #0x34]
	str r0, [sp, #0x18]
	b _020E8C0C
_020E8B34:
	ldrb r1, [sp, #0x62]
	add r2, sp, #0x5c
	cmp r1, #7
	cmpne r1, #4
	add r1, sp, #0x58
	bne _020E8B78
	str r2, [sp]
	str r1, [sp, #4]
	add r1, sp, #0x54
	str r1, [sp, #8]
	ldr r1, [sp, #0x64]
	mov r2, sb
	mov r3, r8
	bl __strtoull
	str r0, [sp, #0x34]
	str r1, [sp, #0x18]
	b _020E8B9C
_020E8B78:
	str r2, [sp]
	str r1, [sp, #4]
	add r1, sp, #0x54
	str r1, [sp, #8]
	ldr r1, [sp, #0x64]
	mov r2, sb
	mov r3, r8
	bl __strtoul
	str r0, [sp, #0x3c]
_020E8B9C:
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	bne _020E8BCC
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	str r0, [sp, #0x30]
	mov r0, #0
	str r0, [sp, #0x3c]
	str r0, [sp, #0x34]
	str r0, [sp, #0x18]
	b _020E8C0C
_020E8BCC:
	add r4, r4, r0
	ldr r0, [sp, #0x58]
	cmp r0, #0
	beq _020E8C0C
	ldrb r0, [sp, #0x62]
	cmp r0, #7
	ldrne r0, [sp, #0x3c]
	rsbne r0, r0, #0
	strne r0, [sp, #0x3c]
	bne _020E8C0C
	ldr r0, [sp, #0x34]
	rsbs r0, r0, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x18]
	rsc r0, r0, #0
	str r0, [sp, #0x18]
_020E8C0C:
	cmp r5, #0
	beq _020E8CC4
	ldrb r0, [sp, #0x62]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020E8CB0
_020E8C24: ; jump table
	b _020E8C44 ; case 0
	b _020E8C50 ; case 1
	b _020E8C5C ; case 2
	b _020E8C68 ; case 3
	b _020E8C74 ; case 4
	b _020E8C88 ; case 5
	b _020E8C94 ; case 6
	b _020E8CA0 ; case 7
_020E8C44:
	ldr r0, [sp, #0x3c]
	str r0, [r5]
	b _020E8CB0
_020E8C50:
	ldr r0, [sp, #0x3c]
	strb r0, [r5]
	b _020E8CB0
_020E8C5C:
	ldr r0, [sp, #0x3c]
	strh r0, [r5]
	b _020E8CB0
_020E8C68:
	ldr r0, [sp, #0x3c]
	str r0, [r5]
	b _020E8CB0
_020E8C74:
	ldr r0, [sp, #0x34]
	str r0, [r5]
	ldr r0, [sp, #0x18]
	str r0, [r5, #4]
	b _020E8CB0
_020E8C88:
	ldr r0, [sp, #0x3c]
	str r0, [r5]
	b _020E8CB0
_020E8C94:
	ldr r0, [sp, #0x3c]
	str r0, [r5]
	b _020E8CB0
_020E8CA0:
	ldr r0, [sp, #0x34]
	str r0, [r5]
	ldr r0, [sp, #0x18]
	str r0, [r5, #4]
_020E8CB0:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	ldreq r0, [sp, #0x44]
	addeq r0, r0, #1
	streq r0, [sp, #0x44]
_020E8CC4:
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	str r0, [sp, #0x40]
	b _020E9300
_020E8CD4:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _020E8CF0
	ldr r0, _020E934C ; =_021110EC
	ldr r0, [r0]
	bl _f2d
	b _020E8D3C
_020E8CF0:
	add r0, sp, #0x54
	str r0, [sp]
	ldr r0, [sp, #0x64]
	mov r1, sb
	mov r2, r8
	add r3, sp, #0x5c
	bl __strtold
	ldr r2, [sp, #0x5c]
	cmp r2, #0
	bne _020E8D38
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	str r0, [sp, #0x30]
	ldr r0, _020E934C ; =_021110EC
	ldr r0, [r0]
	bl _f2d
	b _020E8D3C
_020E8D38:
	add r4, r4, r2
_020E8D3C:
	cmp r5, #0
	beq _020E8D88
	ldrb r2, [sp, #0x62]
	cmp r2, #0
	beq _020E8D64
	cmp r2, #8
	beq _020E8D70
	cmp r2, #9
	stmeqia r5, {r0, r1}
	b _020E8D74
_020E8D64:
	bl _d2f
	str r0, [r5]
	b _020E8D74
_020E8D70:
	stmia r5, {r0, r1}
_020E8D74:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	ldreq r0, [sp, #0x44]
	addeq r0, r0, #1
	streq r0, [sp, #0x44]
_020E8D88:
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	str r0, [sp, #0x40]
	b _020E9300
_020E8D98:
	ldrb r0, [sp, #0x61]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0x64]
	cmp r5, #0
	beq _020E8EE0
	cmp sl, #0
	beq _020E8DCC
	ldr r0, [sp, #0x10]
	mov r7, #1
	add r0, r0, #4
	ldr fp, [r0, #-4]
	str r0, [sp, #0x10]
_020E8DCC:
	ldr r0, [sp, #0x30]
	mov r1, #0
	cmp r0, #0
	str r1, [sp, #0x5c]
	beq _020E8DEC
	cmp fp, #0
	strneb r1, [r5]
	b _020E9300
_020E8DEC:
	mvn r0, #0
	str r5, [sp, #0x2c]
	str r0, [sp, #0x48]
	b _020E8E34
_020E8DFC:
	ldrb r0, [sp, #0x62]
	strb r6, [sp, #0x50]
	cmp r0, #0xa
	ldrnesb r0, [sp, #0x50]
	strneb r0, [r5], #1
	bne _020E8E28
	mov r0, r5
	add r1, sp, #0x50
	mov r2, #1
	bl mbtowc
	add r5, r5, #1
_020E8E28:
	ldr r0, [sp, #0x5c]
	add r1, r0, #1
	str r1, [sp, #0x5c]
_020E8E34:
	ldr r0, [sp, #0x64]
	cmp r0, #0
	sub r0, r0, #1
	str r0, [sp, #0x64]
	beq _020E8E84
	cmp sl, #0
	beq _020E8E64
	cmp fp, r1
	movhi r7, #1
	movls r7, #0
	cmp r7, #0
	beq _020E8E84
_020E8E64:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r6, r0
	ldr r0, [sp, #0x48]
	cmp r6, r0
	bne _020E8DFC
_020E8E84:
	strb r6, [sp, #0x50]
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	beq _020E8EA4
	cmp sl, #0
	beq _020E8ECC
	cmp r7, #0
	bne _020E8ECC
_020E8EA4:
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	cmp fp, #0
	str r0, [sp, #0x30]
	beq _020E9300
	ldr r0, [sp, #0x2c]
	mov r1, #0
	strb r1, [r0]
	b _020E9300
_020E8ECC:
	add r4, r4, r0
	ldr r0, [sp, #0x44]
	add r0, r0, #1
	str r0, [sp, #0x44]
	b _020E8F40
_020E8EE0:
	mov r0, #0
	str r0, [sp, #0x5c]
	mvn r5, #0
	b _020E8F00
_020E8EF0:
	strb r6, [sp, #0x50]
	ldr r0, [sp, #0x5c]
	add r0, r0, #1
	str r0, [sp, #0x5c]
_020E8F00:
	ldr r0, [sp, #0x64]
	cmp r0, #0
	sub r0, r0, #1
	str r0, [sp, #0x64]
	beq _020E8F30
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r6, r0
	cmp r6, r5
	bne _020E8EF0
_020E8F30:
	strb r6, [sp, #0x50]
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	beq _020E9310
_020E8F40:
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	str r0, [sp, #0x40]
	b _020E9300
_020E8F50:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _020E9300
	ldr r5, _020E9348 ; =_0210E504
	b _020E8F68
_020E8F64:
	add r4, r4, #1
_020E8F68:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	strb r0, [sp, #0x50]
	ldrsb r1, [sp, #0x50]
	cmp r1, #0
	blt _020E8F90
	cmp r1, #0x80
	blt _020E8F98
_020E8F90:
	mov r0, #0
	b _020E8FA4
_020E8F98:
	mov r0, r1, lsl #1
	ldrh r0, [r5, r0]
	and r0, r0, #0x100
_020E8FA4:
	cmp r0, #0
	bne _020E8F64
	cmp r1, #0x25
	beq _020E8FD4
	mov r0, r8
	mov r2, #1
	blx sb
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	str r0, [sp, #0x30]
	b _020E9300
_020E8FD4:
	add r4, r4, #1
	b _020E9300
_020E8FDC:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _020E9058
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	strb r0, [sp, #0x50]
	b _020E9018
_020E9000:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	strb r0, [sp, #0x50]
_020E9018:
	ldrsb r1, [sp, #0x50]
	cmp r1, #0
	blt _020E902C
	cmp r1, #0x80
	blt _020E9034
_020E902C:
	mov r0, #0
	b _020E9044
_020E9034:
	ldr r0, _020E9348 ; =_0210E504
	mov r2, r1, lsl #1
	ldrh r0, [r0, r2]
	and r0, r0, #0x100
_020E9044:
	cmp r0, #0
	bne _020E9000
	mov r0, r8
	mov r2, #1
	blx sb
_020E9058:
	cmp r5, #0
	beq _020E91D4
	cmp sl, #0
	beq _020E9080
	ldr r0, [sp, #0x10]
	mov r7, #1
	add r0, r0, #4
	str r0, [sp, #0x10]
	ldr r0, [r0, #-4]
	sub fp, r0, #1
_020E9080:
	ldr r0, [sp, #0x30]
	mov r1, #0
	cmp r0, #0
	str r1, [sp, #0x5c]
	beq _020E90A0
	cmp fp, #0
	strneb r1, [r5]
	b _020E9300
_020E90A0:
	mvn r0, #0
	str r5, [sp, #0x28]
	str r0, [sp, #0x4c]
	b _020E9104
_020E90B0:
	strb r6, [sp, #0x50]
	ldrsb r1, [sp, #0x50]
	add r2, sp, #0x60
	and r3, r1, #0xff
	add r2, r2, r3, asr #3
	ldrb r3, [r2, #8]
	and r0, r1, #7
	mov r2, #1
	tst r3, r2, lsl r0
	beq _020E9154
	ldrb r0, [sp, #0x62]
	cmp r0, #0xa
	strneb r1, [r5], #1
	bne _020E90F8
	mov r0, r5
	add r1, sp, #0x50
	bl mbtowc
	add r5, r5, #2
_020E90F8:
	ldr r0, [sp, #0x5c]
	add r1, r0, #1
	str r1, [sp, #0x5c]
_020E9104:
	ldr r0, [sp, #0x64]
	cmp r0, #0
	sub r0, r0, #1
	str r0, [sp, #0x64]
	beq _020E9154
	cmp sl, #0
	beq _020E9134
	cmp fp, r1
	movhs r7, #1
	movlo r7, #0
	cmp r7, #0
	beq _020E9154
_020E9134:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r6, r0
	ldr r0, [sp, #0x4c]
	cmp r6, r0
	bne _020E90B0
_020E9154:
	strb r6, [sp, #0x50]
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	beq _020E9174
	cmp sl, #0
	beq _020E91AC
	cmp r7, #0
	bne _020E91AC
_020E9174:
	mov r0, r8
	ldrsb r1, [sp, #0x50]
	mov r2, #1
	blx sb
	cmp sl, #0
	beq _020E9310
	mov r0, #1
	cmp fp, #0
	str r0, [sp, #0x30]
	beq _020E9300
	ldr r0, [sp, #0x28]
	mov r1, #0
	strb r1, [r0]
	b _020E9300
_020E91AC:
	add r4, r4, r0
	ldrb r0, [sp, #0x62]
	cmp r0, #0xa
	mov r0, #0
	streqh r0, [r5]
	strneb r0, [r5]
	ldr r0, [sp, #0x44]
	add r0, r0, #1
	str r0, [sp, #0x44]
	b _020E9270
_020E91D4:
	mov r0, #0
	str r0, [sp, #0x5c]
	mvn r5, #0
	b _020E9218
_020E91E4:
	strb r6, [sp, #0x50]
	ldrsb r1, [sp, #0x50]
	and r0, r1, #7
	and r2, r1, #0xff
	add r1, sp, #0x60
	add r1, r1, r2, asr #3
	ldrb r2, [r1, #8]
	mov r1, #1
	tst r2, r1, lsl r0
	beq _020E9248
	ldr r0, [sp, #0x5c]
	add r0, r0, #1
	str r0, [sp, #0x5c]
_020E9218:
	ldr r0, [sp, #0x64]
	cmp r0, #0
	sub r0, r0, #1
	str r0, [sp, #0x64]
	beq _020E9248
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r6, r0
	cmp r6, r5
	bne _020E91E4
_020E9248:
	strb r6, [sp, #0x50]
	ldr r0, [sp, #0x5c]
	cmp r0, #0
	bne _020E926C
	mov r0, r8
	ldrsb r1, [sp, #0x50]
	mov r2, #1
	blx sb
	b _020E9300
_020E926C:
	add r4, r4, r0
_020E9270:
	ldr r0, [sp, #0x64]
	cmp r0, #0
	blt _020E928C
	mov r0, r8
	ldrsb r1, [sp, #0x50]
	mov r2, #1
	blx sb
_020E928C:
	ldr r0, [sp, #0x40]
	add r0, r0, #1
	str r0, [sp, #0x40]
	b _020E9300
_020E929C:
	cmp r5, #0
	beq _020E9300
	ldrb r0, [sp, #0x62]
	cmp r0, #7
	addls pc, pc, r0, lsl #2
	b _020E9300
_020E92B4: ; jump table
	b _020E92D4 ; case 0
	b _020E92EC ; case 1
	b _020E92DC ; case 2
	b _020E92E4 ; case 3
	b _020E9300 ; case 4
	b _020E9300 ; case 5
	b _020E9300 ; case 6
	b _020E92F4 ; case 7
_020E92D4:
	str r4, [r5]
	b _020E9300
_020E92DC:
	strh r4, [r5]
	b _020E9300
_020E92E4:
	str r4, [r5]
	b _020E9300
_020E92EC:
	strb r4, [r5]
	b _020E9300
_020E92F4:
	str r4, [r5]
	mov r0, r4, asr #0x1f
	str r0, [r5, #4]
_020E9300:
	ldr r0, [sp, #0xc]
	ldrsb r5, [r0]
	cmp r5, #0
	bne _020E8644
_020E9310:
	mov r0, r8
	mov r1, #0
	mov r2, #2
	blx sb
	cmp r0, #0
	beq _020E933C
	ldr r0, [sp, #0x40]
	cmp r0, #0
	addeq sp, sp, #0x88
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020E933C:
	ldr r0, [sp, #0x44]
	add sp, sp, #0x88
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020E9348: .word _0210E504
_020E934C: .word _021110EC
	arm_func_end __sformatter

	arm_func_start __StringRead
__StringRead: ; 0x020E9350
	cmp r2, #0
	beq _020E936C
	cmp r2, #1
	beq _020E939C
	cmp r2, #2
	beq _020E93C4
	b _020E93CC
_020E936C:
	ldr r1, [r0]
	ldrsb r2, [r1]
	cmp r2, #0
	bne _020E938C
	mov r1, #1
	str r1, [r0, #4]
	sub r0, r1, #2
	bx lr
_020E938C:
	add r1, r1, #1
	str r1, [r0]
	and r0, r2, #0xff
	bx lr
_020E939C:
	ldr r2, [r0, #4]
	cmp r2, #0
	movne r2, #0
	strne r2, [r0, #4]
	bne _020E93BC
	ldr r2, [r0]
	sub r2, r2, #1
	str r2, [r0]
_020E93BC:
	mov r0, r1
	bx lr
_020E93C4:
	ldr r0, [r0, #4]
	bx lr
_020E93CC:
	mov r0, #0
	bx lr
	arm_func_end __StringRead

	arm_func_start vsscanf
vsscanf: ; 0x020E93D4
	stmdb sp!, {lr}
	sub sp, sp, #0xc
	str r0, [sp, #4]
	cmp r0, #0
	ldrnesb r0, [r0]
	mov lr, r1
	mov r3, r2
	cmpne r0, #0
	addeq sp, sp, #0xc
	mvneq r0, #0
	ldmeqia sp!, {pc}
	mov ip, #0
	str ip, [sp, #8]
	ldr r0, _020E9424 ; =__StringRead
	add r1, sp, #4
	mov r2, lr
	str ip, [sp]
	bl __sformatter
	add sp, sp, #0xc
	ldmia sp!, {pc}
	.align 2, 0
_020E9424: .word __StringRead
	arm_func_end vsscanf

	arm_func_start sscanf
sscanf: ; 0x020E9428
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r2, sp, #0xc
	bic r2, r2, #3
	ldr r1, [sp, #0xc]
	add r2, r2, #4
	bl vsscanf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end sscanf

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
	ldr r0, _020E956C ; =_021E5590
	bl OS_TryLockMutex
	cmp r0, #0
	bne _020E94A4
	ldr r0, _020E9570 ; =OSi_ThreadInfo
	ldr r1, _020E9574 ; =_021E54A0
	ldr r2, [r0, #4]
	ldr r0, _020E9578 ; =_021E54C4
	ldr r3, [r2, #0x6c]
	mov r2, #1
	str r3, [r1, #0x1c]
	str r2, [r0, #0x1c]
	b _020E94FC
_020E94A4:
	ldr r0, _020E9570 ; =OSi_ThreadInfo
	ldr r1, _020E9574 ; =_021E54A0
	ldr r0, [r0, #4]
	ldr r1, [r1, #0x1c]
	ldr r0, [r0, #0x6c]
	cmp r1, r0
	bne _020E94D4
	ldr r0, _020E9578 ; =_021E54C4
	ldr r1, [r0, #0x1c]
	add r1, r1, #1
	str r1, [r0, #0x1c]
	b _020E94FC
_020E94D4:
	ldr r0, _020E956C ; =_021E5590
	bl OS_LockMutex
	ldr r0, _020E9570 ; =OSi_ThreadInfo
	ldr r1, _020E9574 ; =_021E54A0
	ldr r2, [r0, #4]
	ldr r0, _020E9578 ; =_021E54C4
	ldr r3, [r2, #0x6c]
	mov r2, #1
	str r3, [r1, #0x1c]
	str r2, [r0, #0x1c]
_020E94FC:
	ldr r1, _020E957C ; =_021E58C4
	sub r2, r5, #1
	ldr r4, [r1, r2, lsl #2]
	cmp r4, #1
	movne r0, #0
	strne r0, [r1, r2, lsl #2]
	ldr r0, _020E9578 ; =_021E54C4
	ldr r1, [r0, #0x1c]
	subs r1, r1, #1
	str r1, [r0, #0x1c]
	bne _020E9530
	ldr r0, _020E956C ; =_021E5590
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
_020E956C: .word _021E5590
_020E9570: .word OSi_ThreadInfo
_020E9574: .word _021E54A0
_020E9578: .word _021E54C4
_020E957C: .word _021E58C4
	arm_func_end raise

	arm_func_start strlen
strlen: ; 0x020E9580
	mvn r2, #0
_020E9584:
	ldrsb r1, [r0], #1
	add r2, r2, #1
	cmp r1, #0
	bne _020E9584
	mov r0, r2
	bx lr
	arm_func_end strlen

	arm_func_start strcpy
strcpy: ; 0x020E959C
	stmdb sp!, {r3, r4, r5, lr}
	and r4, r1, #3
	and r3, r0, #3
	mov r2, r0
	cmp r3, r4
	bne _020E9638
	cmp r4, #0
	beq _020E95F4
	ldrb r3, [r1]
	strb r3, [r0]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	rsbs r4, r4, #3
	beq _020E95EC
_020E95D4:
	ldrb r3, [r1, #1]!
	cmp r3, #0
	strb r3, [r2, #1]!
	ldmeqia sp!, {r3, r4, r5, pc}
	subs r4, r4, #1
	bne _020E95D4
_020E95EC:
	add r2, r2, #1
	add r1, r1, #1
_020E95F4:
	ldr r5, [r1]
	ldr r3, _020E965C ; =0xFEFEFEFF
	mvn r4, r5
	add lr, r5, r3
	ldr ip, _020E9660 ; =0x80808080
	and r4, lr, r4
	tst r4, ip
	bne _020E9638
	sub r2, r2, #4
_020E9618:
	str r5, [r2, #4]!
	ldr r5, [r1, #4]!
	add r4, r5, r3
	mvn lr, r5
	and lr, r4, lr
	tst lr, ip
	beq _020E9618
	add r2, r2, #4
_020E9638:
	ldrb r3, [r1]
	strb r3, [r2]
	cmp r3, #0
	ldmeqia sp!, {r3, r4, r5, pc}
_020E9648:
	ldrb r3, [r1, #1]!
	cmp r3, #0
	strb r3, [r2, #1]!
	bne _020E9648
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020E965C: .word 0xFEFEFEFF
_020E9660: .word 0x80808080
	arm_func_end strcpy

	arm_func_start strncpy
strncpy: ; 0x020E9664
	stmdb sp!, {r3, lr}
	mov lr, r0
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
_020E9674:
	ldrsb r3, [r1], #1
	mov ip, lr
	strb r3, [lr], #1
	ldrsb r3, [ip]
	cmp r3, #0
	bne _020E96A8
	subs r2, r2, #1
	ldmeqia sp!, {r3, pc}
	mov r1, #0
_020E9698:
	strb r1, [lr], #1
	subs r2, r2, #1
	bne _020E9698
	ldmia sp!, {r3, pc}
_020E96A8:
	subs r2, r2, #1
	bne _020E9674
	ldmia sp!, {r3, pc}
	arm_func_end strncpy

	arm_func_start strcat
strcat: ; 0x020E96B4
	mov r3, r0
_020E96B8:
	ldrsb r2, [r3], #1
	cmp r2, #0
	bne _020E96B8
	sub r3, r3, #1
_020E96C8:
	ldrsb r2, [r1], #1
	mov ip, r3
	strb r2, [r3], #1
	ldrsb r2, [ip]
	cmp r2, #0
	bne _020E96C8
	bx lr
	arm_func_end strcat

	arm_func_start strncat
strncat: ; 0x020E96E4
	stmdb sp!, {r3, lr}
	mov ip, r0
_020E96EC:
	ldrsb r3, [ip], #1
	cmp r3, #0
	bne _020E96EC
	cmp r2, #0
	sub ip, ip, #1
	beq _020E9728
_020E9704:
	ldrsb r3, [r1], #1
	mov lr, ip
	strb r3, [ip], #1
	ldrsb r3, [lr]
	cmp r3, #0
	subeq ip, ip, #1
	beq _020E9728
	subs r2, r2, #1
	bne _020E9704
_020E9728:
	mov r1, #0
	strb r1, [ip]
	ldmia sp!, {r3, pc}
	arm_func_end strncat

	arm_func_start strcmp
strcmp: ; 0x020E9734
	stmdb sp!, {r4, lr}
	ldrb r2, [r0]
	ldrb r3, [r1]
	subs r3, r2, r3
	movne r0, r3
	ldmneia sp!, {r4, pc}
	and r4, r0, #3
	and r3, r1, #3
	cmp r3, r4
	bne _020E9810
	cmp r4, #0
	beq _020E97A8
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	rsbs r4, r4, #3
	beq _020E97A0
_020E9778:
	ldrb r3, [r0, #1]!
	ldrb r2, [r1, #1]!
	subs r2, r3, r2
	movne r0, r2
	ldmneia sp!, {r4, pc}
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
	subs r4, r4, #1
	bne _020E9778
_020E97A0:
	add r0, r0, #1
	add r1, r1, #1
_020E97A8:
	ldr r2, [r0]
	ldr r3, _020E9840 ; =0xFEFEFEFF
	mvn r4, r2
	add lr, r2, r3
	ldr ip, _020E9844 ; =0x80808080
	and r4, lr, r4
	tst r4, ip
	ldr r4, [r1]
	bne _020E97FC
	cmp r2, r4
	bne _020E97F0
_020E97D4:
	ldr r2, [r0, #4]!
	ldr r4, [r1, #4]!
	add lr, r2, r3
	tst lr, ip
	bne _020E97FC
	cmp r2, r4
	beq _020E97D4
_020E97F0:
	sub r0, r0, #1
	sub r1, r1, #1
	b _020E9810
_020E97FC:
	ldrb r2, [r0]
	ldrb r3, [r1]
	subs r3, r2, r3
	movne r0, r3
	ldmneia sp!, {r4, pc}
_020E9810:
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r4, pc}
_020E981C:
	ldrb r3, [r0, #1]!
	ldrb r2, [r1, #1]!
	subs r2, r3, r2
	movne r0, r2
	ldmneia sp!, {r4, pc}
	cmp r3, #0
	bne _020E981C
	mov r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020E9840: .word 0xFEFEFEFF
_020E9844: .word 0x80808080
	arm_func_end strcmp

	arm_func_start strncmp
strncmp: ; 0x020E9848
	cmp r2, #0
	beq _020E9874
_020E9850:
	ldrb ip, [r1], #1
	ldrb r3, [r0], #1
	cmp r3, ip
	subne r0, r3, ip
	bxne lr
	cmp r3, #0
	beq _020E9874
	subs r2, r2, #1
	bne _020E9850
_020E9874:
	mov r0, #0
	bx lr
	arm_func_end strncmp

	arm_func_start strchr
strchr: ; 0x020E987C
	ldrsb r2, [r0], #1
	mov r1, r1, lsl #0x18
	mov r1, r1, asr #0x18
	cmp r2, #0
	beq _020E98A8
_020E9890:
	cmp r2, r1
	subeq r0, r0, #1
	bxeq lr
	ldrsb r2, [r0], #1
	cmp r2, #0
	bne _020E9890
_020E98A8:
	cmp r1, #0
	movne r0, #0
	subeq r0, r0, #1
	bx lr
	arm_func_end strchr

	arm_func_start strspn
strspn: ; 0x020E98B8
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x20
	add ip, sp, #0
	mov r3, #8
	mov r2, #0
_020E98CC:
	strb r2, [ip]
	strb r2, [ip, #1]
	strb r2, [ip, #2]
	strb r2, [ip, #3]
	add ip, ip, #4
	subs r3, r3, #1
	bne _020E98CC
	ldrb r3, [r1]
	add r4, r1, #1
	cmp r3, #0
	beq _020E9928
	add lr, sp, #0
	mov r2, #1
_020E9900:
	and ip, r3, #0xff
	and r1, r3, #7
	mov r1, r2, lsl r1
	ldrb r3, [lr, ip, asr #3]
	and r1, r1, #0xff
	orr r1, r3, r1
	strb r1, [lr, ip, asr #3]
	ldrb r3, [r4], #1
	cmp r3, #0
	bne _020E9900
_020E9928:
	ldrb r1, [r0]
	add r4, r0, #1
	cmp r1, #0
	beq _020E9968
	add ip, sp, #0
	mov r2, #1
_020E9940:
	and r3, r1, #0xff
	and r1, r1, #7
	mov r1, r2, lsl r1
	ldrb r3, [ip, r3, asr #3]
	and r1, r1, #0xff
	tst r3, r1
	bne _020E9968
	ldrb r1, [r4], #1
	cmp r1, #0
	bne _020E9940
_020E9968:
	sub r0, r4, r0
	sub r0, r0, #1
	add sp, sp, #0x20
	ldmia sp!, {r4, pc}
	arm_func_end strspn

	arm_func_start strtok
strtok: ; 0x020E9978
	stmdb sp!, {r4, lr}
	sub sp, sp, #0x20
	add ip, sp, #0
	mov r3, #8
	mov r2, #0
_020E998C:
	strb r2, [ip]
	strb r2, [ip, #1]
	strb r2, [ip, #2]
	strb r2, [ip, #3]
	add ip, ip, #4
	subs r3, r3, #1
	bne _020E998C
	cmp r0, #0
	ldrne r2, _020E9ACC ; =_0211135C
	add lr, r1, #1
	strne r0, [r2, #4]
	ldrb r0, [r1]
	cmp r0, #0
	beq _020E99F4
	add ip, sp, #0
	mov r1, #1
_020E99CC:
	and r3, r0, #0xff
	and r0, r0, #7
	mov r0, r1, lsl r0
	ldrb r2, [ip, r3, asr #3]
	and r0, r0, #0xff
	orr r0, r2, r0
	strb r0, [ip, r3, asr #3]
	ldrb r0, [lr], #1
	cmp r0, #0
	bne _020E99CC
_020E99F4:
	ldr r0, _020E9ACC ; =_0211135C
	ldr r0, [r0, #4]
	ldrb r4, [r0]
	add r1, r0, #1
	cmp r4, #0
	beq _020E9A38
	add ip, sp, #0
	mov r2, #1
_020E9A14:
	and r3, r4, #0xff
	and r0, r4, #7
	mov r0, r2, lsl r0
	ldrb r3, [ip, r3, asr #3]
	and r0, r0, #0xff
	tst r3, r0
	ldrneb r4, [r1], #1
	cmpne r4, #0
	bne _020E9A14
_020E9A38:
	cmp r4, #0
	bne _020E9A58
	ldr r1, _020E9ACC ; =_0211135C
	add sp, sp, #0x20
	ldr r2, [r1]
	mov r0, #0
	str r2, [r1, #4]
	ldmia sp!, {r4, pc}
_020E9A58:
	sub r0, r1, #1
	ldrb r4, [r1], #1
	cmp r4, #0
	beq _020E9A98
	add lr, sp, #0
	mov r3, #1
_020E9A70:
	and ip, r4, #0xff
	and r2, r4, #7
	mov r2, r3, lsl r2
	ldrb ip, [lr, ip, asr #3]
	and r2, r2, #0xff
	tst ip, r2
	bne _020E9A98
	ldrb r4, [r1], #1
	cmp r4, #0
	bne _020E9A70
_020E9A98:
	cmp r4, #0
	bne _020E9AB4
	ldr r1, _020E9ACC ; =_0211135C
	add sp, sp, #0x20
	ldr r2, [r1]
	str r2, [r1, #4]
	ldmia sp!, {r4, pc}
_020E9AB4:
	ldr r2, _020E9ACC ; =_0211135C
	mov r3, #0
	str r1, [r2, #4]
	strb r3, [r1, #-1]
	add sp, sp, #0x20
	ldmia sp!, {r4, pc}
	.align 2, 0
_020E9ACC: .word _0211135C
	arm_func_end strtok

	arm_func_start strstr
strstr: ; 0x020E9AD0
	stmdb sp!, {r4, lr}
	cmp r1, #0
	ldrneb r2, [r1]
	cmpne r2, #0
	ldmeqia sp!, {r4, pc}
	ldrb r3, [r0]
	add r4, r0, #1
	cmp r3, #0
	beq _020E9B34
_020E9AF4:
	cmp r3, r2
	bne _020E9B28
	mov lr, r4
	add ip, r1, #1
_020E9B04:
	ldrb r3, [ip], #1
	ldrb r0, [lr], #1
	cmp r0, r3
	bne _020E9B1C
	cmp r0, #0
	bne _020E9B04
_020E9B1C:
	cmp r3, #0
	subeq r0, r4, #1
	ldmeqia sp!, {r4, pc}
_020E9B28:
	ldrb r3, [r4], #1
	cmp r3, #0
	bne _020E9AF4
_020E9B34:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end strstr

	arm_func_start __strtold
__strtold: ; 0x020E9B3C
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa8
	ldr r4, [sp, #0xd0]
	mov sl, #0
	str r4, [sp, #0xd0]
	str r0, [sp]
	add r6, sp, #0x80
	mov sb, r1
	mov r8, r2
	str r3, [sp, #4]
	mov r4, sl
	str sl, [sp, #0x2c]
	mov r5, #1
	mov r0, #4
_020E9B74:
	strh sl, [r6]
	strh sl, [r6, #2]
	strh sl, [r6, #4]
	strh sl, [r6, #6]
	add r6, r6, #8
	subs r0, r0, #1
	bne _020E9B74
	mov r0, #0
	str r0, [sp, #0x28]
	strh sl, [r6]
	strh sl, [r6, #2]
	ldr r2, [sp, #0x28]
	ldr r1, [sp, #0xd0]
	strh sl, [r6, #4]
	str r2, [r1]
	mov r1, r2
	mov r0, r8
	str r1, [sp, #0x24]
	str r1, [sp, #0x20]
	str r1, [sp, #0x1c]
	str r1, [sp, #0x18]
	str r1, [sp, #0x10]
	str r1, [sp, #0xc]
	str r1, [sp, #8]
	add r4, r4, #1
	blx sb
	mov r1, r0
	ldr r7, _020EAB1C ; =_0210E631
	add r0, sp, #0x4d
	mov r6, #4
_020E9BEC:
	ldrb r3, [r7]
	ldrb r2, [r7, #1]
	add r7, r7, #2
	strb r3, [r0]
	strb r2, [r0, #1]
	add r0, r0, #2
	subs r6, r6, #1
	bne _020E9BEC
	ldrb r3, [r7]
	ldr r2, _020EAB20 ; =_0210E62C
	strb r3, [r0]
	ldrb r3, [r2, #1]
	ldrb r0, [r2, #2]
	ldrb r6, [r2]
	strb r3, [sp, #0x31]
	strb r0, [sp, #0x32]
	ldrb r3, [r2, #3]
	ldrb r0, [r2, #4]
	strb r6, [sp, #0x30]
	strb r3, [sp, #0x33]
	strb r0, [sp, #0x34]
	b _020EA930
_020E9C44:
	cmp r5, #0x100
	bgt _020E9CBC
	bge _020EA3C4
	cmp r5, #0x20
	bgt _020E9CA0
	bge _020EA298
	cmp r5, #8
	bgt _020E9C94
	cmp r5, #0
	addge pc, pc, r5, lsl #2
	b _020EA930
_020E9C70: ; jump table
	b _020EA930 ; case 0
	b _020E9D00 ; case 1
	b _020EA0E4 ; case 2
	b _020EA930 ; case 3
	b _020EA194 ; case 4
	b _020EA930 ; case 5
	b _020EA930 ; case 6
	b _020EA930 ; case 7
	b _020EA1BC ; case 8
_020E9C94:
	cmp r5, #0x10
	beq _020EA260
	b _020EA930
_020E9CA0:
	cmp r5, #0x40
	bgt _020E9CB0
	beq _020EA324
	b _020EA930
_020E9CB0:
	cmp r5, #0x80
	beq _020EA370
	b _020EA930
_020E9CBC:
	cmp r5, #0x2000
	bgt _020E9CE4
	bge _020E9F18
	cmp r5, #0x200
	bgt _020E9CD8
	beq _020EA424
	b _020EA930
_020E9CD8:
	cmp r5, #0x400
	beq _020EA44C
	b _020EA930
_020E9CE4:
	cmp r5, #0x4000
	bgt _020E9CF4
	beq _020E9E20
	b _020EA930
_020E9CF4:
	cmp r5, #0x8000
	beq _020EA4C4
	b _020EA930
_020E9D00:
	cmp r1, #0
	blt _020E9D10
	cmp r1, #0x80
	blt _020E9D18
_020E9D10:
	mov r0, #0
	b _020E9D28
_020E9D18:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =_0210E504
	ldrh r0, [r0, r2]
	and r0, r0, #0x100
_020E9D28:
	cmp r0, #0
	beq _020E9D54
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r1, r0
	ldr r0, [sp, #0x2c]
	add r0, r0, #1
	str r0, [sp, #0x2c]
	b _020EA930
_020E9D54:
	cmp r1, #0
	blt _020E9D64
	cmp r1, #0x80
	blt _020E9D6C
_020E9D64:
	mov r0, r1
	b _020E9D74
_020E9D6C:
	ldr r0, _020EAB28 ; =_0210E484
	ldrb r0, [r0, r1]
_020E9D74:
	cmp r0, #0x49
	bgt _020E9DA0
	bge _020E9DD8
	cmp r0, #0x2d
	bgt _020E9E18
	cmp r0, #0x2b
	blt _020E9E18
	beq _020E9DB4
	cmp r0, #0x2d
	beq _020E9DAC
	b _020E9E18
_020E9DA0:
	cmp r0, #0x4e
	beq _020E9DF8
	b _020E9E18
_020E9DAC:
	mov r0, #1
	str r0, [sp, #0x28]
_020E9DB4:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	mov r0, #1
	str r0, [sp, #0x18]
	b _020EA930
_020E9DD8:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	mov r5, #0x4000
	b _020EA930
_020E9DF8:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	mov r5, #0x2000
	b _020EA930
_020E9E18:
	mov r5, #2
	b _020EA930
_020E9E20:
	mov r5, #1
	add r7, sp, #0x4d
	add r0, sp, #0x76
	mov r6, #4
_020E9E30:
	ldrb r3, [r7]
	ldrb r2, [r7, #1]
	add r7, r7, #2
	strb r3, [r0]
	strb r2, [r0, #1]
	add r0, r0, #2
	subs r6, r6, #1
	bne _020E9E30
	ldrb r2, [r7]
	add r6, sp, #0x77
	ldr r7, _020EAB28 ; =_0210E484
	strb r2, [r0]
	b _020E9E84
_020E9E64:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r6, r6, #1
	add r5, r5, #1
	add r4, r4, #1
	blx sb
	mov r1, r0
_020E9E84:
	cmp r5, #8
	bge _020E9EB4
	cmp r1, #0
	blt _020E9E9C
	cmp r1, #0x80
	blt _020E9EA4
_020E9E9C:
	mov r2, r1
	b _020E9EA8
_020E9EA4:
	ldrb r2, [r7, r1]
_020E9EA8:
	ldrsb r0, [r6]
	cmp r0, r2
	beq _020E9E64
_020E9EB4:
	cmp r5, #3
	cmpne r5, #8
	bne _020E9F10
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _020E9EE4
	ldr r1, _020EAB2C ; =_021110E8
	mov r0, #0
	ldr r1, [r1]
	bl _fsub
	bl _f2d
	b _020E9EF0
_020E9EE4:
	ldr r0, _020EAB2C ; =_021110E8
	ldr r0, [r0]
	bl _f2d
_020E9EF0:
	ldr r2, [sp, #0x2c]
	add r3, r2, r5
	ldr r2, [sp, #0x18]
	add r3, r2, r3
	ldr r2, [sp, #4]
	add sp, sp, #0xa8
	str r3, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020E9F10:
	mov r5, #0x1000
	b _020EA930
_020E9F18:
	ldrb r3, [sp, #0x30]
	ldrb r0, [sp, #0x32]
	ldrb r2, [sp, #0x31]
	strb r3, [sp, #0x40]
	strb r0, [sp, #0x42]
	ldrb r3, [sp, #0x33]
	ldrb r0, [sp, #0x34]
	strb r2, [sp, #0x41]
	mov r5, #1
	strb r0, [sp, #0x44]
	mov r6, #0
	add r2, sp, #0x56
	strb r3, [sp, #0x43]
	mov r0, #8
_020E9F50:
	strb r6, [r2]
	strb r6, [r2, #1]
	strb r6, [r2, #2]
	strb r6, [r2, #3]
	add r2, r2, #4
	subs r0, r0, #1
	bne _020E9F50
	add r7, sp, #0x41
	b _020E9F94
_020E9F74:
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r7, r7, #1
	add r5, r5, #1
	add r4, r4, #1
	blx sb
	mov r1, r0
_020E9F94:
	cmp r5, #4
	bge _020E9FC8
	cmp r1, #0
	blt _020E9FAC
	cmp r1, #0x80
	blt _020E9FB4
_020E9FAC:
	mov r2, r1
	b _020E9FBC
_020E9FB4:
	ldr r0, _020EAB28 ; =_0210E484
	ldrb r2, [r0, r1]
_020E9FBC:
	ldrsb r0, [r7]
	cmp r0, r2
	beq _020E9F74
_020E9FC8:
	sub r0, r5, #3
	cmp r0, #1
	bhi _020EA0DC
	cmp r5, #4
	bne _020EA080
	ldr r7, _020EAB24 ; =_0210E504
	b _020EA008
_020E9FE4:
	add r0, sp, #0x56
	strb r1, [r0, r6]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r6, r6, #1
	add r4, r4, #1
	blx sb
	mov r1, r0
_020EA008:
	cmp r6, #0x20
	bge _020EA070
	cmp r1, #0
	blt _020EA020
	cmp r1, #0x80
	blt _020EA028
_020EA020:
	mov r0, #0
	b _020EA034
_020EA028:
	mov r0, r1, lsl #1
	ldrh r0, [r7, r0]
	and r0, r0, #8
_020EA034:
	cmp r0, #0
	bne _020E9FE4
	cmp r1, #0
	blt _020EA04C
	cmp r1, #0x80
	blt _020EA054
_020EA04C:
	mov r0, #0
	b _020EA060
_020EA054:
	mov r0, r1, lsl #1
	ldrh r0, [r7, r0]
	and r0, r0, #1
_020EA060:
	cmp r0, #0
	bne _020E9FE4
	cmp r1, #0x2e
	beq _020E9FE4
_020EA070:
	cmp r1, #0x29
	movne r5, #0x1000
	bne _020EA930
	add r6, r6, #1
_020EA080:
	add r0, sp, #0x56
	mov r1, #0
	strb r1, [r0, r6]
	ldr r1, [sp, #0x28]
	cmp r1, #0
	beq _020EA0B4
	bl nan
	mov r2, r0
	mov r0, #0
	mov r3, r1
	mov r1, r0
	bl _dsub
	b _020EA0B8
_020EA0B4:
	bl nan
_020EA0B8:
	ldr r2, [sp, #0x2c]
	add r2, r2, r5
	add r3, r6, r2
	ldr r2, [sp, #0x18]
	add r3, r2, r3
	ldr r2, [sp, #4]
	add sp, sp, #0xa8
	str r3, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EA0DC:
	mov r5, #0x1000
	b _020EA930
_020EA0E4:
	cmp r1, #0x2e
	bne _020EA10C
	mov r5, #0x10
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA930
_020EA10C:
	cmp r1, #0
	blt _020EA11C
	cmp r1, #0x80
	blt _020EA124
_020EA11C:
	mov r0, #0
	b _020EA134
_020EA124:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =_0210E504
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA134:
	cmp r0, #0
	moveq r5, #0x1000
	beq _020EA930
	cmp r1, #0x30
	bne _020EA18C
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	cmp r0, #0
	mov r1, r0
	blt _020EA178
	cmp r0, #0x80
	bge _020EA178
	ldr r2, _020EAB28 ; =_0210E484
	ldrb r0, [r2, r0]
_020EA178:
	cmp r0, #0x58
	moveq r5, #0x8000
	moveq sl, #1
	movne r5, #4
	b _020EA930
_020EA18C:
	mov r5, #8
	b _020EA930
_020EA194:
	cmp r1, #0x30
	movne r5, #8
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA1BC:
	cmp r1, #0
	blt _020EA1CC
	cmp r1, #0x80
	blt _020EA1D4
_020EA1CC:
	mov r0, #0
	b _020EA1E4
_020EA1D4:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =_0210E504
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA1E4:
	cmp r0, #0
	bne _020EA218
	cmp r1, #0x2e
	movne r5, #0x40
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov r5, #0x20
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA218:
	ldrb r2, [sp, #0x84]
	cmp r2, #0x14
	ldrhs r0, [sp, #0x1c]
	addhs r0, r0, #1
	strhs r0, [sp, #0x1c]
	bhs _020EA244
	add r0, r2, #1
	strb r0, [sp, #0x84]
	add r0, sp, #0x80
	add r0, r0, r2
	strb r1, [r0, #5]
_020EA244:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA930
_020EA260:
	cmp r1, #0
	blt _020EA270
	cmp r1, #0x80
	blt _020EA278
_020EA270:
	mov r0, #0
	b _020EA288
_020EA278:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =_0210E504
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA288:
	cmp r0, #0
	moveq r5, #0x1000
	movne r5, #0x20
	b _020EA930
_020EA298:
	cmp r1, #0
	blt _020EA2A8
	cmp r1, #0x80
	blt _020EA2B0
_020EA2A8:
	mov r0, #0
	b _020EA2C0
_020EA2B0:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =_0210E504
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA2C0:
	cmp r0, #0
	moveq r5, #0x40
	beq _020EA930
	ldrb r3, [sp, #0x84]
	cmp r3, #0x14
	bhs _020EA308
	cmp r1, #0x30
	cmpeq r3, #0
	beq _020EA2FC
	ldrb r2, [sp, #0x84]
	add r0, sp, #0x80
	add r0, r0, r3
	add r2, r2, #1
	strb r2, [sp, #0x84]
	strb r1, [r0, #5]
_020EA2FC:
	ldr r0, [sp, #0x1c]
	sub r0, r0, #1
	str r0, [sp, #0x1c]
_020EA308:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA930
_020EA324:
	cmp r1, #0
	blt _020EA334
	cmp r1, #0x80
	blt _020EA33C
_020EA334:
	mov r0, r1
	b _020EA344
_020EA33C:
	ldr r0, _020EAB28 ; =_0210E484
	ldrb r0, [r0, r1]
_020EA344:
	cmp r0, #0x45
	movne r5, #0x800
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov r5, #0x80
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA370:
	cmp r1, #0x2b
	bne _020EA394
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA3BC
_020EA394:
	cmp r1, #0x2d
	bne _020EA3BC
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	mov r0, #1
	str r0, [sp, #0x24]
_020EA3BC:
	mov r5, #0x100
	b _020EA930
_020EA3C4:
	cmp r1, #0
	blt _020EA3D4
	cmp r1, #0x80
	blt _020EA3DC
_020EA3D4:
	mov r0, #0
	b _020EA3EC
_020EA3DC:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =_0210E504
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA3EC:
	cmp r0, #0
	moveq r5, #0x1000
	beq _020EA930
	cmp r1, #0x30
	movne r5, #0x400
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov r5, #0x200
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA424:
	cmp r1, #0x30
	movne r5, #0x400
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA44C:
	cmp r1, #0
	blt _020EA45C
	cmp r1, #0x80
	blt _020EA464
_020EA45C:
	mov r0, #0
	b _020EA474
_020EA464:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =_0210E504
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA474:
	cmp r0, #0
	moveq r5, #0x800
	beq _020EA930
	ldr r0, [sp, #0x20]
	sub r2, r1, #0x30
	mov r1, #0xa
	mla r0, r1, r0, r2
	ldr r1, _020EAB30 ; =0x00007FFF
	str r0, [sp, #0x20]
	cmp r0, r1
	ldrgt r0, [sp, #0xd0]
	movgt r1, #1
	strgt r1, [r0]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA4C4:
	cmp sl, #0x20
	bgt _020EA514
	bge _020EA7E8
	cmp sl, #8
	bgt _020EA508
	cmp sl, #0
	addge pc, pc, sl, lsl #2
	b _020EA930
_020EA4E4: ; jump table
	b _020EA930 ; case 0
	b _020EA538 ; case 1
	b _020EA588 ; case 2
	b _020EA930 ; case 3
	b _020EA5B0 ; case 4
	b _020EA930 ; case 5
	b _020EA930 ; case 6
	b _020EA930 ; case 7
	b _020EA6C0 ; case 8
_020EA508:
	cmp sl, #0x10
	beq _020EA79C
	b _020EA930
_020EA514:
	cmp sl, #0x80
	bgt _020EA52C
	bge _020EA890
	cmp sl, #0x40
	beq _020EA830
	b _020EA930
_020EA52C:
	cmp sl, #0x100
	beq _020EA8B8
	b _020EA930
_020EA538:
	mov r1, #0
	add r0, sp, #0x45
	str r0, [sp, #0x14]
	strb r1, [r0]
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	strb r1, [r0, #7]
	mov r0, r8
	mov r2, r1
	str r1, [sp, #8]
	mov fp, r1
	mov sl, #2
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA588:
	cmp r1, #0x30
	movne sl, #4
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA5B0:
	cmp r1, #0
	blt _020EA5C0
	cmp r1, #0x80
	blt _020EA5C8
_020EA5C0:
	mov r0, #0
	b _020EA5D8
_020EA5C8:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =_0210E504
	ldrh r0, [r0, r2]
	and r0, r0, #0x400
_020EA5D8:
	cmp r0, #0
	bne _020EA60C
	cmp r1, #0x2e
	movne sl, #0x10
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov sl, #8
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA60C:
	ldr r2, [sp, #8]
	mov r0, #0xe
	cmp r2, r0
	bhs _020EA6A4
	mov r0, r2
	add r0, r0, #1
	str r0, [sp, #8]
	ldr r0, [sp, #0x14]
	add r2, fp, fp, lsr #31
	cmp r1, #0
	ldrb r0, [r0, r2, asr #1]
	blt _020EA64C
	cmp r1, #0x80
	bge _020EA64C
	ldr r2, _020EAB28 ; =_0210E484
	ldrb r1, [r2, r1]
_020EA64C:
	cmp r1, #0x41
	subge r1, r1, #0x37
	sublt r1, r1, #0x30
	mov r2, fp, lsr #0x1f
	and r3, r1, #0xff
	rsb r1, r2, fp, lsl #31
	adds r1, r2, r1, ror #31
	moveq r1, r3, lsl #4
	add r2, fp, fp, lsr #31
	orrne r0, r0, r3
	andeq r1, r1, #0xff
	orreq r0, r0, r1
	ldr r1, [sp, #0x14]
	add fp, fp, #1
	strb r0, [r1, r2, asr #1]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA6A4:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA930
_020EA6C0:
	cmp r1, #0
	blt _020EA6D0
	cmp r1, #0x80
	blt _020EA6D8
_020EA6D0:
	mov r0, #0
	b _020EA6E8
_020EA6D8:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =_0210E504
	ldrh r0, [r0, r2]
	and r0, r0, #0x400
_020EA6E8:
	cmp r0, #0
	moveq sl, #0x10
	beq _020EA930
	ldr r2, [sp, #8]
	mov r0, #0xe
	cmp r2, r0
	bhs _020EA780
	ldr r0, [sp, #0x14]
	add r2, fp, fp, lsr #31
	cmp r1, #0
	ldrb r0, [r0, r2, asr #1]
	blt _020EA728
	cmp r1, #0x80
	bge _020EA728
	ldr r2, _020EAB28 ; =_0210E484
	ldrb r1, [r2, r1]
_020EA728:
	cmp r1, #0x41
	subge r1, r1, #0x37
	sublt r1, r1, #0x30
	mov r2, fp, lsr #0x1f
	and r3, r1, #0xff
	rsb r1, r2, fp, lsl #31
	adds r1, r2, r1, ror #31
	moveq r1, r3, lsl #4
	add r2, fp, fp, lsr #31
	orrne r0, r0, r3
	andeq r1, r1, #0xff
	orreq r0, r0, r1
	ldr r1, [sp, #0x14]
	add fp, fp, #1
	strb r0, [r1, r2, asr #1]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA780:
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA930
_020EA79C:
	cmp r1, #0
	blt _020EA7AC
	cmp r1, #0x80
	blt _020EA7B4
_020EA7AC:
	mov r0, r1
	b _020EA7BC
_020EA7B4:
	ldr r0, _020EAB28 ; =_0210E484
	ldrb r0, [r0, r1]
_020EA7BC:
	cmp r0, #0x50
	movne r5, #0x800
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov sl, #0x20
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA7E8:
	cmp r1, #0x2d
	moveq r0, #1
	streq r0, [sp, #0xc]
	beq _020EA810
	cmp r1, #0x2b
	beq _020EA810
	mov r0, r8
	mov r2, #1
	blx sb
	sub r4, r4, #1
_020EA810:
	mov sl, #0x40
	add r4, r4, #1
	mov r0, r8
	mov r1, #0
	mov r2, r1
	blx sb
	mov r1, r0
	b _020EA930
_020EA830:
	cmp r1, #0
	blt _020EA840
	cmp r1, #0x80
	blt _020EA848
_020EA840:
	mov r0, #0
	b _020EA858
_020EA848:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =_0210E504
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA858:
	cmp r0, #0
	moveq r5, #0x1000
	beq _020EA930
	cmp r1, #0x30
	movne sl, #0x100
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	mov sl, #0x80
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA890:
	cmp r1, #0x30
	movne sl, #0x100
	bne _020EA930
	mov r1, #0
	mov r0, r8
	mov r2, r1
	add r4, r4, #1
	blx sb
	mov r1, r0
	b _020EA930
_020EA8B8:
	cmp r1, #0
	blt _020EA8C8
	cmp r1, #0x80
	blt _020EA8D0
_020EA8C8:
	mov r0, #0
	b _020EA8E0
_020EA8D0:
	mov r2, r1, lsl #1
	ldr r0, _020EAB24 ; =_0210E504
	ldrh r0, [r0, r2]
	and r0, r0, #8
_020EA8E0:
	cmp r0, #0
	moveq r5, #0x800
	beq _020EA930
	ldr r0, [sp, #0x10]
	sub r2, r1, #0x30
	mov r1, #0xa
	mla r0, r1, r0, r2
	str r0, [sp, #0x10]
	ldr r1, _020EAB30 ; =0x00007FFF
	ldr r0, [sp, #0x20]
	add r4, r4, #1
	cmp r0, r1
	ldrgt r0, [sp, #0xd0]
	movgt r1, #1
	strgt r1, [r0]
	mov r1, #0
	mov r0, r8
	mov r2, r1
	blx sb
	mov r1, r0
_020EA930:
	ldr r0, [sp]
	cmp r4, r0
	bgt _020EA950
	mvn r0, #0
	cmp r1, r0
	beq _020EA950
	tst r5, #0x1800
	beq _020E9C44
_020EA950:
	cmp r5, #0x8000
	beq _020EA96C
	ldr r0, _020EAB34 ; =0x00000E2C
	tst r5, r0
	moveq r0, #1
	movne r0, #0
	b _020EA990
_020EA96C:
	sub r0, r4, #1
	cmp r0, #2
	ble _020EA984
	ldr r0, _020EAB38 ; =0x0000018E
	tst sl, r0
	bne _020EA98C
_020EA984:
	mov r0, #1
	b _020EA990
_020EA98C:
	mov r0, #0
_020EA990:
	cmp r0, #0
	movne r2, #0
	ldrne r0, [sp, #4]
	bne _020EA9B0
	ldr r0, [sp, #0x2c]
	sub r2, r4, #1
	add r2, r2, r0
	ldr r0, [sp, #4]
_020EA9B0:
	str r2, [r0]
	mov r0, r8
	mov r2, #1
	blx sb
	cmp sl, #0
	bne _020EABB4
	ldr r0, [sp, #0x24]
	ldrb r2, [sp, #0x84]
	cmp r0, #0
	ldrne r0, [sp, #0x20]
	rsbne r0, r0, #0
	strne r0, [sp, #0x20]
	add r0, sp, #0x85
	add r1, r0, r2
	b _020EA9F8
_020EA9EC:
	ldr r0, [sp, #0x1c]
	add r0, r0, #1
	str r0, [sp, #0x1c]
_020EA9F8:
	cmp r2, #0
	sub r2, r2, #1
	beq _020EAA10
	ldrb r0, [r1, #-1]!
	cmp r0, #0x30
	beq _020EA9EC
_020EAA10:
	add r0, r2, #1
	strb r0, [sp, #0x84]
	ands r2, r0, #0xff
	bne _020EAA34
	add r1, r2, #1
	strb r1, [sp, #0x84]
	add r0, sp, #0x85
	mov r1, #0x30
	strb r1, [r0, r2]
_020EAA34:
	ldr r1, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	mov r2, #0x8000
	add r0, r1, r0
	rsb r2, r2, #0
	str r0, [sp, #0x20]
	cmp r0, r2
	blt _020EAA5C
	cmp r0, r2, lsr #17
	ble _020EAA68
_020EAA5C:
	ldr r0, [sp, #0xd0]
	mov r1, #1
	str r1, [r0]
_020EAA68:
	ldr r0, [sp, #0xd0]
	ldr r0, [r0]
	cmp r0, #0
	beq _020EAAC4
	ldr r0, [sp, #0x24]
	cmp r0, #0
	movne r0, #0
	addne sp, sp, #0xa8
	movne r1, r0
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r0, [sp, #0x28]
	cmp r0, #0
	ldreq r1, _020EAB3C ; =_021110F0
	addeq sp, sp, #0xa8
	ldmeqia r1, {r0, r1}
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldr r1, _020EAB3C ; =_021110F0
	mov r0, #0
	ldmia r1, {r2, r3}
	mov r1, r0
	bl _dsub
	add sp, sp, #0xa8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EAAC4:
	ldr r1, [sp, #0x20]
	add r0, sp, #0x80
	strh r1, [sp, #0x82]
	bl __dec2num
	mov r4, r0
	mov r6, r1
	mov r0, #0
	mov r1, r0
	mov r2, r4
	mov r3, r6
	bl _dneq
	beq _020EAB44
	mov r0, r4
	mov r1, r6
	mov r2, #0
	mov r3, #0x100000
	bl _dls
	bhs _020EAB44
	ldr r0, [sp, #0xd0]
	mov r1, #1
	str r1, [r0]
	b _020EAB70
	.align 2, 0
_020EAB1C: .word _0210E631
_020EAB20: .word _0210E62C
_020EAB24: .word _0210E504
_020EAB28: .word _0210E484
_020EAB2C: .word _021110E8
_020EAB30: .word 0x00007FFF
_020EAB34: .word 0x00000E2C
_020EAB38: .word 0x0000018E
_020EAB3C: .word _021110F0
_020EAB40: .word 0x7FEFFFFF
_020EAB44:
	ldr r3, _020EAB40 ; =0x7FEFFFFF
	mov r0, r4
	mov r1, r6
	mvn r2, #0
	bl _dgr
	bls _020EAB70
	ldr r0, [sp, #0xd0]
	mov r2, #1
	ldr r1, _020EAB3C ; =_021110F0
	str r2, [r0]
	ldmia r1, {r4, r6}
_020EAB70:
	ldr r0, [sp, #0x28]
	cmp r0, #0
	beq _020EABA4
	ldr r0, _020EAB34 ; =0x00000E2C
	tst r5, r0
	beq _020EABA4
	mov r0, #0
	mov r1, r0
	mov r2, r4
	mov r3, r6
	bl _dsub
	mov r4, r0
	mov r6, r1
_020EABA4:
	add sp, sp, #0xa8
	mov r0, r4
	mov r1, r6
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EABB4:
	ldr r0, [sp, #0xc]
	add r4, sp, #0x38
	cmp r0, #0
	ldrne r0, [sp, #0x10]
	ldrb r3, [sp, #0x45]
	rsbne r0, r0, #0
	strne r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	ldr r0, [sp, #8]
	mov r2, #0
	add r0, r1, r0, lsl #2
	str r0, [sp, #0x10]
	mov r1, #0x80
	b _020EABFC
_020EABEC:
	ldr r0, [sp, #0x10]
	add r2, r2, #1
	sub r0, r0, #1
	str r0, [sp, #0x10]
_020EABFC:
	cmp r2, #4
	bhs _020EAC0C
	tst r3, r1, asr r2
	beq _020EABEC
_020EAC0C:
	adds r5, r2, #1
	beq _020EAC58
	add r0, sp, #0x4c
	add r3, sp, #0x45
	str r0, [sp, #0x14]
	mov r1, #0
	cmp r0, r3
	blo _020EAC58
	rsb r6, r5, #8
_020EAC30:
	ldr r0, [sp, #0x14]
	ldrb r0, [r0]
	orr r2, r1, r0, lsl r5
	mov r1, r0, asr r6
	ldr r0, [sp, #0x14]
	and r1, r1, #0xff
	strb r2, [r0], #-1
	str r0, [sp, #0x14]
	cmp r0, r3
	bhs _020EAC30
_020EAC58:
	mov r2, #0
	mov r6, r2
	strb r2, [r4]
	strb r2, [r4, #1]
	strb r2, [r4, #2]
	strb r2, [r4, #3]
	strb r2, [r4, #4]
	strb r2, [r4, #5]
	strb r2, [r4, #6]
	strb r2, [r4, #7]
	mov r3, #0xc
	mov r7, #1
	mov r0, #0xff
	add r1, sp, #0x45
_020EAC90:
	add r5, r2, #8
	cmp r5, #0x34
	ldrb r5, [r1, r6]
	rsbhi r8, r2, #0x34
	and fp, r3, #7
	andhi r5, r5, r0, lsl r8
	andhi r5, r5, #0xff
	mov r8, r5, asr fp
	and sb, r8, #0xff
	ldrb sl, [r4, r7]
	rsb r8, fp, #8
	mov r5, r5, lsl r8
	orr sb, sl, sb
	strb sb, [r4, r7]
	add r7, r7, #1
	add r2, r2, #8
	ldrb r8, [r4, r7]
	and r5, r5, #0xff
	cmp r2, #0x34
	orr r5, r8, r5
	strb r5, [r4, r7]
	add r3, r3, #8
	add r6, r6, #1
	blo _020EAC90
	ldr r0, [sp, #0x10]
	mov r1, #0x800
	add r0, r0, #0xfe
	add r2, r0, #0x300
	rsb r1, r1, #0
	tst r2, r1
	beq _020EAD28
	ldr r2, [sp, #0xd0]
	mov r3, #1
	mov r0, #0
	add sp, sp, #0xa8
	mov r1, r0
	str r3, [r2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EAD28:
	ldrb r0, [r4, #1]
	mov r2, r2, lsl #0x15
	ldrb r1, [r4]
	orr r0, r0, r2, lsr #17
	strb r0, [r4, #1]
	ldr r0, [sp, #0x28]
	orr r1, r1, r2, lsr #25
	cmp r0, #0
	andne r0, r1, #0xff
	strb r1, [r4]
	orrne r0, r0, #0x80
	strneb r0, [r4]
	mov r3, #0
_020EAD5C:
	rsb r1, r3, #7
	ldrb r2, [r4, r3]
	ldrb r0, [r4, r1]
	strb r0, [r4, r3]
	add r3, r3, #1
	strb r2, [r4, r1]
	cmp r3, #4
	blt _020EAD5C
	ldmia r4, {r0, r1}
	add sp, sp, #0xa8
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end __strtold

	arm_func_start strtold
strtold: ; 0x020EAD88
	stmdb sp!, {r4, r5, r6, r7, lr}
	sub sp, sp, #0x14
	mov r7, r0
	mov r0, #0
	mov r6, r1
	str r0, [sp, #8]
	add r4, sp, #0xc
	str r7, [sp, #4]
	ldr r1, _020EAE5C ; =__StringRead
	add r2, sp, #4
	add r3, sp, #0x10
	sub r0, r0, #0x80000001
	str r4, [sp]
	bl __strtold
	mov r5, r1
	mov r4, r0
	cmp r6, #0
	ldrne r0, [sp, #0x10]
	mov r1, r5
	addne r0, r7, r0
	strne r0, [r6]
	mov r0, r4
	bl fabs
	ldr r2, [sp, #0xc]
	mov r6, r0
	mov r7, r1
	cmp r2, #0
	bne _020EAE40
	mov r0, #0
	mov r1, r0
	mov r2, r4
	mov r3, r5
	bl _dneq
	beq _020EAE4C
	mov r0, r6
	mov r1, r7
	mov r2, #0
	mov r3, #0x100000
	bl _dls
	blo _020EAE40
	ldr r3, _020EAE60 ; =0x7FEFFFFF
	mov r0, r6
	mov r1, r7
	mvn r2, #0
	bl _dgr
	bls _020EAE4C
_020EAE40:
	ldr r0, _020EAE64 ; =_021E58C0
	mov r1, #0x22
	str r1, [r0]
_020EAE4C:
	mov r0, r4
	mov r1, r5
	add sp, sp, #0x14
	ldmia sp!, {r4, r5, r6, r7, pc}
	.align 2, 0
_020EAE5C: .word __StringRead
_020EAE60: .word 0x7FEFFFFF
_020EAE64: .word _021E58C0
	arm_func_end strtold

	arm_func_start atof
atof: ; 0x020EAE68
	ldr ip, _020EAE74 ; =strtold
	mov r1, #0
	bx ip
	.align 2, 0
_020EAE74: .word strtold
	arm_func_end atof

	arm_func_start __strtoul
__strtoul: ; 0x020EAE78
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xc
	ldr r4, [sp, #0x38]
	movs sb, r0
	ldr r0, [sp, #0x34]
	str r4, [sp, #0x38]
	mov r4, #0
	str r0, [sp, #0x34]
	ldr r0, [sp, #0x38]
	str r1, [sp]
	str r4, [r0]
	mov r0, r4
	str r0, [sp, #4]
	ldr r0, [sp, #0x34]
	mov r1, r4
	str r1, [r0]
	ldr r0, [sp, #0x30]
	str r4, [sp, #8]
	mov r8, r2
	mov r7, r3
	mov r5, r4
	mov sl, r4
	str r0, [sp, #0x30]
	mov r4, #1
	bmi _020EAEF8
	cmp sb, #1
	beq _020EAEF8
	cmp sb, #0x24
	bgt _020EAEF8
	ldr r0, [sp]
	cmp r0, #1
	bge _020EAF00
_020EAEF8:
	mov r4, #0x40
	b _020EAF1C
_020EAF00:
	ldr r1, [sp, #8]
	mov r0, r7
	mov r3, r1
	mov r2, r1
	add r5, r3, #1
	blx r8
	mov r6, r0
_020EAF1C:
	cmp sb, #0
	beq _020EAF34
	mov r1, sb
	mvn r0, #0
	bl _u32_div_f
	str r0, [sp, #4]
_020EAF34:
	mvn fp, #0
	b _020EB1F4
_020EAF3C:
	cmp r4, #8
	bgt _020EAF74
	cmp r4, #0
	addge pc, pc, r4, lsl #2
	b _020EB1F4
_020EAF50: ; jump table
	b _020EB1F4 ; case 0
	b _020EAF80 ; case 1
	b _020EB02C ; case 2
	b _020EB1F4 ; case 3
	b _020EB068 ; case 4
	b _020EB1F4 ; case 5
	b _020EB1F4 ; case 6
	b _020EB1F4 ; case 7
	b _020EB0A8 ; case 8
_020EAF74:
	cmp r4, #0x10
	beq _020EB0A8
	b _020EB1F4
_020EAF80:
	cmp r6, #0
	blt _020EAF90
	cmp r6, #0x80
	blt _020EAF98
_020EAF90:
	mov r0, #0
	b _020EAFA8
_020EAF98:
	ldr r0, _020EB258 ; =_0210E504
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x100
_020EAFA8:
	cmp r0, #0
	beq _020EAFD4
	mov r1, #0
	mov r0, r7
	mov r2, r1
	blx r8
	mov r6, r0
	ldr r0, [sp, #8]
	add r0, r0, #1
	str r0, [sp, #8]
	b _020EB1F4
_020EAFD4:
	cmp r6, #0x2b
	bne _020EAFF8
	mov r1, #0
	mov r0, r7
	mov r2, r1
	add r5, r5, #1
	blx r8
	mov r6, r0
	b _020EB024
_020EAFF8:
	cmp r6, #0x2d
	bne _020EB024
	mov r1, #0
	mov r0, r7
	mov r2, r1
	add r5, r5, #1
	blx r8
	mov r6, r0
	ldr r0, [sp, #0x34]
	mov r1, #1
	str r1, [r0]
_020EB024:
	mov r4, #2
	b _020EB1F4
_020EB02C:
	cmp sb, #0
	cmpne sb, #0x10
	bne _020EB060
	cmp r6, #0x30
	bne _020EB060
	mov r1, #0
	mov r0, r7
	mov r2, r1
	mov r4, #4
	add r5, r5, #1
	blx r8
	mov r6, r0
	b _020EB1F4
_020EB060:
	mov r4, #8
	b _020EB1F4
_020EB068:
	cmp r6, #0x58
	cmpne r6, #0x78
	bne _020EB098
	mov r1, #0
	mov r0, r7
	mov r2, r1
	mov sb, #0x10
	mov r4, #8
	add r5, r5, #1
	blx r8
	mov r6, r0
	b _020EB1F4
_020EB098:
	cmp sb, #0
	moveq sb, #8
	mov r4, #0x10
	b _020EB1F4
_020EB0A8:
	ldr r0, [sp, #4]
	cmp sb, #0
	moveq sb, #0xa
	cmp r0, #0
	bne _020EB0CC
	mov r0, fp
	mov r1, sb
	bl _u32_div_f
	str r0, [sp, #4]
_020EB0CC:
	cmp r6, #0
	blt _020EB0DC
	cmp r6, #0x80
	blt _020EB0E4
_020EB0DC:
	mov r0, #0
	b _020EB0F4
_020EB0E4:
	ldr r0, _020EB258 ; =_0210E504
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #8
_020EB0F4:
	cmp r0, #0
	beq _020EB11C
	sub r6, r6, #0x30
	cmp r6, sb
	blt _020EB1A4
	cmp r4, #0x10
	moveq r4, #0x20
	movne r4, #0x40
	add r6, r6, #0x30
	b _020EB1F4
_020EB11C:
	cmp r6, #0
	blt _020EB12C
	cmp r6, #0x80
	blt _020EB134
_020EB12C:
	mov r0, #0
	b _020EB144
_020EB134:
	ldr r0, _020EB258 ; =_0210E504
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #1
_020EB144:
	cmp r0, #0
	beq _020EB178
	cmp r6, #0
	blt _020EB15C
	cmp r6, #0x80
	blt _020EB164
_020EB15C:
	mov r0, r6
	b _020EB16C
_020EB164:
	ldr r0, _020EB25C ; =_0210E484
	ldrb r0, [r0, r6]
_020EB16C:
	sub r0, r0, #0x37
	cmp r0, sb
	blt _020EB188
_020EB178:
	cmp r4, #0x10
	moveq r4, #0x20
	movne r4, #0x40
	b _020EB1F4
_020EB188:
	cmp r6, #0
	blt _020EB1A0
	cmp r6, #0x80
	bge _020EB1A0
	ldr r0, _020EB25C ; =_0210E484
	ldrb r6, [r0, r6]
_020EB1A0:
	sub r6, r6, #0x37
_020EB1A4:
	ldr r0, [sp, #4]
	mov r4, #0x10
	cmp sl, r0
	ldrhi r0, [sp, #0x38]
	movhi r1, #1
	strhi r1, [r0]
	mul r0, sl, sb
	mov sl, r0
	sub r0, fp, r0
	cmp r6, r0
	ldrhi r0, [sp, #0x38]
	movhi r1, #1
	strhi r1, [r0]
	mov r1, #0
	mov r0, r7
	mov r2, r1
	add sl, sl, r6
	add r5, r5, #1
	blx r8
	mov r6, r0
_020EB1F4:
	ldr r0, [sp]
	cmp r5, r0
	bgt _020EB210
	cmp r6, fp
	beq _020EB210
	tst r4, #0x60
	beq _020EAF3C
_020EB210:
	tst r4, #0x34
	bne _020EB228
	ldr r0, [sp, #0x30]
	mov sl, #0
	str sl, [r0]
	b _020EB23C
_020EB228:
	ldr r0, [sp, #8]
	sub r1, r5, #1
	add r1, r1, r0
	ldr r0, [sp, #0x30]
	str r1, [r0]
_020EB23C:
	mov r0, r7
	mov r1, r6
	mov r2, #1
	blx r8
	mov r0, sl
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020EB258: .word _0210E504
_020EB25C: .word _0210E484
	arm_func_end __strtoul

	arm_func_start __strtoull
__strtoull: ; 0x020EB260
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x20
	ldr r4, [sp, #0x48]
	movs sb, r0
	ldr r0, [sp, #0x44]
	str r4, [sp, #0x48]
	mov r4, #0
	str r0, [sp, #0x44]
	ldr r0, [sp, #0x48]
	str r1, [sp]
	str r4, [r0]
	mov r0, r4
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x44]
	mov r1, r4
	str r1, [r0]
	ldr r0, [sp, #0x40]
	str r4, [sp, #0x18]
	mov sl, r2
	str r3, [sp, #4]
	mov r6, r4
	mov r7, r4
	str r0, [sp, #0x40]
	mov r5, #1
	bmi _020EB2E8
	cmp sb, #1
	beq _020EB2E8
	cmp sb, #0x24
	bgt _020EB2E8
	ldr r0, [sp]
	cmp r0, #1
	bge _020EB2F0
_020EB2E8:
	mov r5, #0x40
	b _020EB304
_020EB2F0:
	mov r0, r3
	mov r2, r4
	add r6, r1, #1
	blx sl
	mov r8, r0
_020EB304:
	cmp sb, #0
	beq _020EB328
	mvn r0, #0
	mov r1, r0
	mov r3, sb, asr #0x1f
	mov r2, sb
	bl _ll_udiv
	mov r7, r0
	str r1, [sp, #0xc]
_020EB328:
	mvn r0, #0
	str r0, [sp, #0x1c]
	mov r4, #0
	b _020EB650
_020EB338:
	cmp r5, #8
	bgt _020EB370
	cmp r5, #0
	addge pc, pc, r5, lsl #2
	b _020EB650
_020EB34C: ; jump table
	b _020EB650 ; case 0
	b _020EB37C ; case 1
	b _020EB428 ; case 2
	b _020EB650 ; case 3
	b _020EB464 ; case 4
	b _020EB650 ; case 5
	b _020EB650 ; case 6
	b _020EB650 ; case 7
	b _020EB4A4 ; case 8
_020EB370:
	cmp r5, #0x10
	beq _020EB4A4
	b _020EB650
_020EB37C:
	cmp r8, #0
	blt _020EB38C
	cmp r8, #0x80
	blt _020EB394
_020EB38C:
	mov r0, #0
	b _020EB3A4
_020EB394:
	ldr r0, _020EB6C4 ; =_0210E504
	mov r1, r8, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x100
_020EB3A4:
	cmp r0, #0
	beq _020EB3D0
	mov r1, #0
	ldr r0, [sp, #4]
	mov r2, r1
	blx sl
	mov r8, r0
	ldr r0, [sp, #0x18]
	add r0, r0, #1
	str r0, [sp, #0x18]
	b _020EB650
_020EB3D0:
	cmp r8, #0x2b
	bne _020EB3F4
	mov r1, #0
	ldr r0, [sp, #4]
	mov r2, r1
	add r6, r6, #1
	blx sl
	mov r8, r0
	b _020EB420
_020EB3F4:
	cmp r8, #0x2d
	bne _020EB420
	mov r1, #0
	ldr r0, [sp, #4]
	mov r2, r1
	add r6, r6, #1
	blx sl
	mov r8, r0
	ldr r0, [sp, #0x44]
	mov r1, #1
	str r1, [r0]
_020EB420:
	mov r5, #2
	b _020EB650
_020EB428:
	cmp sb, #0
	cmpne sb, #0x10
	bne _020EB45C
	cmp r8, #0x30
	bne _020EB45C
	mov r1, #0
	ldr r0, [sp, #4]
	mov r2, r1
	mov r5, #4
	add r6, r6, #1
	blx sl
	mov r8, r0
	b _020EB650
_020EB45C:
	mov r5, #8
	b _020EB650
_020EB464:
	cmp r8, #0x58
	cmpne r8, #0x78
	bne _020EB494
	mov r1, #0
	ldr r0, [sp, #4]
	mov r2, r1
	mov sb, #0x10
	mov r5, #8
	add r6, r6, #1
	blx sl
	mov r8, r0
	b _020EB650
_020EB494:
	cmp sb, #0
	moveq sb, #8
	mov r5, #0x10
	b _020EB650
_020EB4A4:
	ldr r1, [sp, #0xc]
	mov r0, #0
	cmp sb, #0
	moveq sb, #0xa
	cmp r1, r0
	cmpeq r7, r4
	bne _020EB4DC
	ldr r0, [sp, #0x1c]
	mov r3, sb, asr #0x1f
	mov r1, r0
	mov r2, sb
	bl _ll_udiv
	mov r7, r0
	str r1, [sp, #0xc]
_020EB4DC:
	cmp r8, #0
	blt _020EB4EC
	cmp r8, #0x80
	blt _020EB4F4
_020EB4EC:
	mov r0, #0
	b _020EB504
_020EB4F4:
	ldr r0, _020EB6C4 ; =_0210E504
	mov r1, r8, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #8
_020EB504:
	cmp r0, #0
	beq _020EB52C
	sub r8, r8, #0x30
	cmp r8, sb
	blt _020EB5B4
	cmp r5, #0x10
	moveq r5, #0x20
	movne r5, #0x40
	add r8, r8, #0x30
	b _020EB650
_020EB52C:
	cmp r8, #0
	blt _020EB53C
	cmp r8, #0x80
	blt _020EB544
_020EB53C:
	mov r0, #0
	b _020EB554
_020EB544:
	ldr r0, _020EB6C4 ; =_0210E504
	mov r1, r8, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #1
_020EB554:
	cmp r0, #0
	beq _020EB588
	cmp r8, #0
	blt _020EB56C
	cmp r8, #0x80
	blt _020EB574
_020EB56C:
	mov r0, r8
	b _020EB57C
_020EB574:
	ldr r0, _020EB6C8 ; =_0210E484
	ldrb r0, [r0, r8]
_020EB57C:
	sub r0, r0, #0x37
	cmp r0, sb
	blt _020EB598
_020EB588:
	cmp r5, #0x10
	moveq r5, #0x20
	movne r5, #0x40
	b _020EB650
_020EB598:
	cmp r8, #0
	blt _020EB5B0
	cmp r8, #0x80
	bge _020EB5B0
	ldr r0, _020EB6C8 ; =_0210E484
	ldrb r8, [r0, r8]
_020EB5B0:
	sub r8, r8, #0x37
_020EB5B4:
	ldr r1, [sp, #0x14]
	ldr r0, [sp, #0xc]
	ldr r3, [sp, #0x10]
	cmp r1, r0
	ldr r0, [sp, #0x10]
	mov r5, sb, asr #0x1f
	cmpeq r0, r7
	ldrhi r0, [sp, #0x48]
	movhi r1, #1
	strhi r1, [r0]
	umull r0, r1, r3, sb
	mla r1, r3, r5, r1
	ldr r3, [sp, #0x14]
	str r0, [sp, #0x10]
	mla r1, r3, sb, r1
	ldr r3, [sp, #0x1c]
	mov r2, r8, asr #0x1f
	subs r3, r3, r0
	ldr r0, [sp, #0x1c]
	str r1, [sp, #0x14]
	sbc r0, r0, r1
	cmp r2, r0
	cmpeq r8, r3
	ldrhi r0, [sp, #0x48]
	movhi r1, #1
	strhi r1, [r0]
	ldr r0, [sp, #0x10]
	mov r1, #0
	adds r0, r0, r8
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	mov r5, #0x10
	adc r0, r0, r2
	str r0, [sp, #0x14]
	ldr r0, [sp, #4]
	mov r2, r1
	add r6, r6, #1
	blx sl
	mov r8, r0
_020EB650:
	ldr r0, [sp]
	cmp r6, r0
	bgt _020EB670
	ldr r0, [sp, #0x1c]
	cmp r8, r0
	beq _020EB670
	tst r5, #0x60
	beq _020EB338
_020EB670:
	tst r5, #0x34
	bne _020EB690
	mov r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0x14]
	mov r1, r0
	ldr r0, [sp, #0x40]
	b _020EB6A0
_020EB690:
	ldr r0, [sp, #0x18]
	sub r1, r6, #1
	add r1, r1, r0
	ldr r0, [sp, #0x40]
_020EB6A0:
	str r1, [r0]
	ldr r0, [sp, #4]
	mov r1, r8
	mov r2, #1
	blx sl
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add sp, sp, #0x20
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, pc}
	.align 2, 0
_020EB6C4: .word _0210E504
_020EB6C8: .word _0210E484
	arm_func_end __strtoull

	arm_func_start strtoul
strtoul: ; 0x020EB6CC
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	mov r5, r0
	mov lr, #0
	mov r0, r2
	mov r4, r1
	add r2, sp, #0x1c
	str r5, [sp, #0xc]
	str lr, [sp, #0x10]
	str r2, [sp]
	add r1, sp, #0x18
	str r1, [sp, #4]
	add ip, sp, #0x14
	ldr r2, _020EB75C ; =__StringRead
	add r3, sp, #0xc
	sub r1, lr, #0x80000001
	str ip, [sp, #8]
	bl __strtoul
	cmp r4, #0
	ldrne r1, [sp, #0x1c]
	addne r1, r5, r1
	strne r1, [r4]
	ldr r1, [sp, #0x14]
	cmp r1, #0
	beq _020EB748
	ldr r0, _020EB760 ; =_021E58C0
	mov r1, #0x22
	str r1, [r0]
	add sp, sp, #0x20
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020EB748:
	ldr r1, [sp, #0x18]
	cmp r1, #0
	rsbne r0, r0, #0
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020EB75C: .word __StringRead
_020EB760: .word _021E58C0
	arm_func_end strtoul

	arm_func_start strtol
strtol: ; 0x020EB764
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x20
	mov r5, r0
	mov lr, #0
	mov r0, r2
	mov r4, r1
	add r2, sp, #0x1c
	str r5, [sp, #0xc]
	str lr, [sp, #0x10]
	str r2, [sp]
	add r1, sp, #0x18
	str r1, [sp, #4]
	add ip, sp, #0x14
	ldr r2, _020EB824 ; =__StringRead
	add r3, sp, #0xc
	sub r1, lr, #0x80000001
	str ip, [sp, #8]
	bl __strtoul
	cmp r4, #0
	ldrne r1, [sp, #0x1c]
	addne r1, r5, r1
	strne r1, [r4]
	ldr r1, [sp, #0x14]
	cmp r1, #0
	bne _020EB7F0
	ldr r2, [sp, #0x18]
	cmp r2, #0
	bne _020EB7E0
	mvn r1, #0x80000000
	cmp r0, r1
	bhi _020EB7F0
_020EB7E0:
	cmp r2, #0
	beq _020EB814
	cmp r0, #0x80000000
	bls _020EB814
_020EB7F0:
	ldr r0, [sp, #0x18]
	ldr r1, _020EB828 ; =_021E58C0
	mov r2, #0x22
	cmp r0, #0
	movne r0, #0x80000000
	str r2, [r1]
	add sp, sp, #0x20
	mvneq r0, #0x80000000
	ldmia sp!, {r3, r4, r5, pc}
_020EB814:
	cmp r2, #0
	rsbne r0, r0, #0
	add sp, sp, #0x20
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020EB824: .word __StringRead
_020EB828: .word _021E58C0
	arm_func_end strtol

	arm_func_start atoi
atoi: ; 0x020EB82C
	ldr ip, _020EB83C ; =strtol
	mov r1, #0
	mov r2, #0xa
	bx ip
	.align 2, 0
_020EB83C: .word strtol
	arm_func_end atoi

	arm_func_start fwide
fwide: ; 0x020EB840
	cmp r0, #0
	beq _020EB858
	ldr r3, [r0, #4]
	mov r2, r3, lsl #0x16
	movs r2, r2, lsr #0x1d
	bne _020EB860
_020EB858:
	mov r0, #0
	bx lr
_020EB860:
	mov r2, r3, lsl #0x14
	movs r2, r2, lsr #0x1e
	beq _020EB880
	cmp r2, #1
	beq _020EB8A8
	cmp r2, #2
	moveq r1, #1
	b _020EB8AC
_020EB880:
	cmp r1, #0
	ble _020EB898
	bic r2, r3, #0xc00
	orr r2, r2, #0x800
	str r2, [r0, #4]
	b _020EB8AC
_020EB898:
	biclt r2, r3, #0xc00
	orrlt r2, r2, #0x400
	strlt r2, [r0, #4]
	b _020EB8AC
_020EB8A8:
	mvn r1, #0
_020EB8AC:
	mov r0, r1
	bx lr
	arm_func_end fwide

	arm_func_start wmemcpy
wmemcpy: ; 0x020EB8B4
	ldr ip, _020EB8C0 ; =memcpy
	mov r2, r2, lsl #1
	bx ip
	.align 2, 0
_020EB8C0: .word memcpy
	arm_func_end wmemcpy

	arm_func_start wmemchr
wmemchr: ; 0x020EB8C4
	cmp r2, #0
	beq _020EB8E4
_020EB8CC:
	ldrh r3, [r0]
	cmp r3, r1
	bxeq lr
	add r0, r0, #2
	subs r2, r2, #1
	bne _020EB8CC
_020EB8E4:
	mov r0, #0
	bx lr
	arm_func_end wmemchr

	arm_func_start parse_format__wprintf
parse_format__wprintf: ; 0x020EB8EC
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x10
	ldrh r3, [r0, #2]
	mov r4, #0
	mov r5, #1
	mov lr, r2
	strb r5, [sp]
	strb r4, [sp, #1]
	strb r4, [sp, #2]
	strb r4, [sp, #3]
	strb r4, [sp, #4]
	str r4, [sp, #8]
	str r4, [sp, #0xc]
	cmp r3, #0x25
	add ip, r0, #2
	bne _020EB948
	add r0, sp, #0
	strh r3, [sp, #6]
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add sp, sp, #0x10
	add r0, ip, #2
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020EB948:
	mov r2, #2
	mov r0, r4
	mov r5, r2
	mov r6, r4
	mov r7, #1
_020EB95C:
	mov r8, r7
	cmp r3, #0x2b
	bgt _020EB98C
	bge _020EB9B4
	cmp r3, #0x23
	bgt _020EB9E4
	cmp r3, #0x20
	blt _020EB9E4
	beq _020EB9BC
	cmp r3, #0x23
	beq _020EB9CC
	b _020EB9E4
_020EB98C:
	cmp r3, #0x30
	bgt _020EB9E4
	cmp r3, #0x2d
	blt _020EB9E4
	beq _020EB9AC
	cmp r3, #0x30
	beq _020EB9D4
	b _020EB9E4
_020EB9AC:
	strb r6, [sp]
	b _020EB9E8
_020EB9B4:
	strb r7, [sp, #1]
	b _020EB9E8
_020EB9BC:
	ldrb r4, [sp, #1]
	cmp r4, #1
	strneb r5, [sp, #1]
	b _020EB9E8
_020EB9CC:
	strb r7, [sp, #3]
	b _020EB9E8
_020EB9D4:
	ldrb r4, [sp]
	cmp r4, #0
	strneb r2, [sp]
	b _020EB9E8
_020EB9E4:
	mov r8, r0
_020EB9E8:
	cmp r8, #0
	ldrneh r3, [ip, #2]!
	bne _020EB95C
	cmp r3, #0x2a
	bne _020EBA30
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	ldr r0, [r0, #-4]
	str r0, [sp, #8]
	cmp r0, #0
	bge _020EBA28
	rsb r0, r0, #0
	mov r2, #0
	strb r2, [sp]
	str r0, [sp, #8]
_020EBA28:
	ldrh r3, [ip, #2]!
	b _020EBA74
_020EBA30:
	mov r2, #0
	ldr r5, _020EBE58 ; =_0210E73C
	mov r0, #0xa
	b _020EBA54
_020EBA40:
	ldr r4, [sp, #8]
	sub r3, r3, #0x30
	mla r6, r4, r0, r3
	ldrh r3, [ip, #2]!
	str r6, [sp, #8]
_020EBA54:
	cmp r3, #0x80
	movhs r4, r2
	bhs _020EBA6C
	mov r4, r3, lsl #1
	ldrh r4, [r5, r4]
	and r4, r4, #8
_020EBA6C:
	cmp r4, #0
	bne _020EBA40
_020EBA74:
	ldr r2, [sp, #8]
	ldr r0, _020EBE5C ; =0x000001FD
	cmp r2, r0
	ble _020EBAA4
	ldr r1, _020EBE60 ; =0x0000FFFF
	add r0, sp, #0
	strh r1, [sp, #6]
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add sp, sp, #0x10
	add r0, ip, #2
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020EBAA4:
	cmp r3, #0x2e
	bne _020EBB2C
	ldrh r3, [ip, #2]!
	mov r0, #1
	strb r0, [sp, #2]
	cmp r3, #0x2a
	bne _020EBAE8
	ldr r0, [r1]
	add r0, r0, #4
	str r0, [r1]
	ldr r0, [r0, #-4]
	ldrh r3, [ip, #2]!
	str r0, [sp, #0xc]
	cmp r0, #0
	movlt r0, #0
	strltb r0, [sp, #2]
	b _020EBB2C
_020EBAE8:
	mov r1, #0
	ldr r4, _020EBE58 ; =_0210E73C
	mov r0, #0xa
	b _020EBB0C
_020EBAF8:
	ldr r2, [sp, #0xc]
	sub r3, r3, #0x30
	mla r5, r2, r0, r3
	ldrh r3, [ip, #2]!
	str r5, [sp, #0xc]
_020EBB0C:
	cmp r3, #0x80
	movhs r2, r1
	bhs _020EBB24
	mov r2, r3, lsl #1
	ldrh r2, [r4, r2]
	and r2, r2, #8
_020EBB24:
	cmp r2, #0
	bne _020EBAF8
_020EBB2C:
	cmp r3, #0x6c
	mov r0, #1
	bgt _020EBB64
	cmp r3, #0x68
	blt _020EBB58
	beq _020EBB80
	cmp r3, #0x6a
	beq _020EBBCC
	cmp r3, #0x6c
	beq _020EBB9C
	b _020EBBF0
_020EBB58:
	cmp r3, #0x4c
	beq _020EBBC0
	b _020EBBF0
_020EBB64:
	cmp r3, #0x74
	bgt _020EBB74
	beq _020EBBD8
	b _020EBBF0
_020EBB74:
	cmp r3, #0x7a
	beq _020EBBE4
	b _020EBBF0
_020EBB80:
	ldrh r1, [ip, #2]
	mov r2, #2
	strb r2, [sp, #4]
	cmp r1, #0x68
	streqb r0, [sp, #4]
	ldreqh r3, [ip, #2]!
	b _020EBBF4
_020EBB9C:
	ldrh r1, [ip, #2]
	mov r2, #3
	strb r2, [sp, #4]
	cmp r1, #0x6c
	bne _020EBBF4
	mov r1, #4
	strb r1, [sp, #4]
	ldrh r3, [ip, #2]!
	b _020EBBF4
_020EBBC0:
	mov r1, #9
	strb r1, [sp, #4]
	b _020EBBF4
_020EBBCC:
	mov r1, #6
	strb r1, [sp, #4]
	b _020EBBF4
_020EBBD8:
	mov r1, #8
	strb r1, [sp, #4]
	b _020EBBF4
_020EBBE4:
	mov r1, #7
	strb r1, [sp, #4]
	b _020EBBF4
_020EBBF0:
	mov r0, #0
_020EBBF4:
	cmp r0, #0
	ldrneh r3, [ip, #2]!
	strh r3, [sp, #6]
	cmp r3, #0x61
	bgt _020EBC48
	bge _020EBD2C
	cmp r3, #0x47
	bgt _020EBC3C
	subs r0, r3, #0x41
	addpl pc, pc, r0, lsl #2
	b _020EBE38
_020EBC20: ; jump table
	b _020EBD2C ; case 0
	b _020EBE38 ; case 1
	b _020EBE38 ; case 2
	b _020EBE38 ; case 3
	b _020EBD74 ; case 4
	b _020EBCF4 ; case 5
	b _020EBD64 ; case 6
_020EBC3C:
	cmp r3, #0x58
	beq _020EBCBC
	b _020EBE38
_020EBC48:
	cmp r3, #0x63
	bgt _020EBC58
	beq _020EBDD4
	b _020EBE38
_020EBC58:
	sub r0, r3, #0x64
	cmp r0, #0x14
	addls pc, pc, r0, lsl #2
	b _020EBE38
_020EBC68: ; jump table
	b _020EBCBC ; case 0
	b _020EBD74 ; case 1
	b _020EBCF4 ; case 2
	b _020EBD64 ; case 3
	b _020EBE38 ; case 4
	b _020EBCBC ; case 5
	b _020EBE38 ; case 6
	b _020EBE38 ; case 7
	b _020EBE38 ; case 8
	b _020EBE38 ; case 9
	b _020EBE24 ; case 10
	b _020EBCBC ; case 11
	b _020EBDB0 ; case 12
	b _020EBE38 ; case 13
	b _020EBE38 ; case 14
	b _020EBE00 ; case 15
	b _020EBE38 ; case 16
	b _020EBCBC ; case 17
	b _020EBE38 ; case 18
	b _020EBE38 ; case 19
	b _020EBCBC ; case 20
_020EBCBC:
	ldrb r0, [sp, #4]
	cmp r0, #9
	moveq r0, #4
	streqb r0, [sp, #4]
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
	beq _020EBE40
	ldrb r0, [sp]
	cmp r0, #2
	moveq r0, #1
	streqb r0, [sp]
	b _020EBE40
_020EBCF4:
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	ldreq r0, _020EBE60 ; =0x0000FFFF
	streqh r0, [sp, #6]
	beq _020EBE40
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp, #0xc]
	b _020EBE40
_020EBD2C:
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #0xd
	streq r0, [sp, #0xc]
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	cmpne r0, #1
	ldreq r0, _020EBE60 ; =0x0000FFFF
	streqh r0, [sp, #6]
	b _020EBE40
_020EBD64:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	moveq r0, #1
	streq r0, [sp, #0xc]
_020EBD74:
	ldrb r0, [sp, #4]
	cmp r0, #2
	cmpne r0, #6
	cmpne r0, #7
	cmpne r0, #8
	cmpne r0, #4
	cmpne r0, #1
	ldreq r0, _020EBE60 ; =0x0000FFFF
	streqh r0, [sp, #6]
	beq _020EBE40
	ldrb r0, [sp, #2]
	cmp r0, #0
	moveq r0, #6
	streq r0, [sp, #0xc]
	b _020EBE40
_020EBDB0:
	mov r3, #3
	mov r2, #1
	mov r1, #0x78
	mov r0, #8
	strb r3, [sp, #4]
	strb r2, [sp, #3]
	strh r1, [sp, #6]
	str r0, [sp, #0xc]
	b _020EBE40
_020EBDD4:
	ldrb r1, [sp, #4]
	cmp r1, #3
	moveq r0, #5
	streqb r0, [sp, #4]
	beq _020EBE40
	ldrb r0, [sp, #2]
	cmp r0, #0
	cmpeq r1, #0
	ldrne r0, _020EBE60 ; =0x0000FFFF
	strneh r0, [sp, #6]
	b _020EBE40
_020EBE00:
	ldrb r0, [sp, #4]
	cmp r0, #3
	moveq r0, #5
	streqb r0, [sp, #4]
	beq _020EBE40
	cmp r0, #0
	ldrne r0, _020EBE60 ; =0x0000FFFF
	strneh r0, [sp, #6]
	b _020EBE40
_020EBE24:
	ldrb r0, [sp, #4]
	cmp r0, #9
	moveq r0, #4
	streqb r0, [sp, #4]
	b _020EBE40
_020EBE38:
	ldr r0, _020EBE60 ; =0x0000FFFF
	strh r0, [sp, #6]
_020EBE40:
	add r0, sp, #0
	ldmia r0, {r0, r1, r2, r3}
	stmia lr, {r0, r1, r2, r3}
	add r0, ip, #2
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	.align 2, 0
_020EBE58: .word _0210E73C
_020EBE5C: .word 0x000001FD
_020EBE60: .word 0x0000FFFF
	arm_func_end parse_format__wprintf

	arm_func_start long2str__wprintf
long2str__wprintf: ; 0x020EBE64
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x10
	movs sl, r0
	mov r0, #0
	mov r5, r1
	str r0, [sp, #0xc]
	ldr r7, [sp, #0x4c]
	mov r6, r0
	strh r0, [r5, #-2]!
	ldrb r0, [sp, #0x43]
	str r1, [sp]
	ldrh r8, [sp, #0x46]
	str r0, [sp, #4]
	ldr r0, [sp, #0x48]
	ldrb fp, [sp, #0x41]
	str r0, [sp, #8]
	cmpeq r7, #0
	bne _020EBED8
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020EBEC4
	cmp r8, #0x6f
	beq _020EBED8
_020EBEC4:
	add sp, sp, #0x10
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EBED8:
	cmp r8, #0x69
	bgt _020EBF00
	bge _020EBF34
	cmp r8, #0x58
	bgt _020EBEF4
	beq _020EBF60
	b _020EBF68
_020EBEF4:
	cmp r8, #0x64
	beq _020EBF34
	b _020EBF68
_020EBF00:
	cmp r8, #0x6f
	bgt _020EBF14
	moveq r4, #8
	moveq fp, #0
	b _020EBF68
_020EBF14:
	cmp r8, #0x78
	bgt _020EBF68
	cmp r8, #0x75
	blt _020EBF68
	beq _020EBF54
	cmp r8, #0x78
	beq _020EBF60
	b _020EBF68
_020EBF34:
	cmp sl, #0
	mov r4, #0xa
	bge _020EBF68
	mov r0, #1
	cmp sl, #0x80000000
	rsbne sl, sl, #0
	str r0, [sp, #0xc]
	b _020EBF68
_020EBF54:
	mov r4, #0xa
	mov fp, #0
	b _020EBF68
_020EBF60:
	mov r4, #0x10
	mov fp, #0
_020EBF68:
	mov r0, sl
	mov r1, r4
	bl _u32_div_f
	mov sb, r1
	mov r0, sl
	mov r1, r4
	bl _u32_div_f
	cmp sb, #0xa
	mov sl, r0
	addlt sb, sb, #0x30
	blt _020EBFA0
	cmp r8, #0x78
	addeq sb, sb, #0x57
	addne sb, sb, #0x37
_020EBFA0:
	cmp sl, #0
	strh sb, [r5, #-2]!
	add r6, r6, #1
	bne _020EBF68
	cmp r4, #8
	bne _020EBFD4
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrneh r0, [r5]
	cmpne r0, #0x30
	movne r0, #0x30
	strneh r0, [r5, #-2]!
	addne r6, r6, #1
_020EBFD4:
	ldrb r0, [sp, #0x40]
	cmp r0, #2
	bne _020EC008
	ldr r0, [sp, #0xc]
	ldr r7, [sp, #8]
	cmp r0, #0
	cmpeq fp, #0
	subne r7, r7, #1
	cmp r4, #0x10
	bne _020EC008
	ldr r0, [sp, #4]
	cmp r0, #0
	subne r7, r7, #2
_020EC008:
	ldr r0, [sp]
	ldr r1, _020EC0B0 ; =0x000001FD
	sub r0, r0, r5
	add r0, r0, r0, lsr #31
	add r0, r7, r0, asr #1
	cmp r0, r1
	addgt sp, sp, #0x10
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	cmp r6, r7
	bge _020EC050
	mov r0, #0x30
_020EC040:
	add r6, r6, #1
	cmp r6, r7
	strh r0, [r5, #-2]!
	blt _020EC040
_020EC050:
	cmp r4, #0x10
	bne _020EC06C
	ldr r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x30
	strneh r8, [r5, #-2]
	strneh r0, [r5, #-4]!
_020EC06C:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	movne r0, #0x2d
	strneh r0, [r5, #-2]!
	bne _020EC09C
	cmp fp, #1
	moveq r0, #0x2b
	streqh r0, [r5, #-2]!
	beq _020EC09C
	cmp fp, #2
	moveq r0, #0x20
	streqh r0, [r5, #-2]!
_020EC09C:
	mov r0, r5
	add sp, sp, #0x10
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020EC0B0: .word 0x000001FD
	arm_func_end long2str__wprintf

	arm_func_start longlong2str__wprintf
longlong2str__wprintf: ; 0x020EC0B4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x1c
	mov sb, r1
	mov r1, #0
	mov sl, r0
	mov r8, r2
	mov r0, r1
	strh r0, [r8, #-2]!
	ldr r0, [sp, #0x58]
	cmp sb, #0
	str r0, [sp, #0x14]
	ldrb r0, [sp, #0x4f]
	cmpeq sl, #0
	str r2, [sp]
	str r0, [sp, #4]
	ldrh r0, [sp, #0x52]
	str r1, [sp, #0x18]
	mov fp, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0x54]
	str r0, [sp, #0xc]
	ldrb r0, [sp, #0x4d]
	str r0, [sp, #0x10]
	ldreq r0, [sp, #0x14]
	cmpeq r0, #0
	bne _020EC14C
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020EC138
	ldr r0, [sp, #8]
	cmp r0, #0x6f
	beq _020EC14C
_020EC138:
	add sp, sp, #0x1c
	mov r0, r8
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EC14C:
	ldr r0, [sp, #8]
	cmp r0, #0x69
	bgt _020EC178
	bge _020EC1A8
	cmp r0, #0x58
	bgt _020EC16C
	beq _020EC1FC
	b _020EC208
_020EC16C:
	cmp r0, #0x64
	beq _020EC1A8
	b _020EC208
_020EC178:
	cmp r0, #0x6f
	bgt _020EC188
	beq _020EC1DC
	b _020EC208
_020EC188:
	cmp r0, #0x78
	bgt _020EC208
	cmp r0, #0x75
	blt _020EC208
	beq _020EC1EC
	cmp r0, #0x78
	beq _020EC1FC
	b _020EC208
_020EC1A8:
	subs r0, sl, #0
	sbcs r0, sb, #0
	mov r7, #0xa
	mov r6, #0
	bge _020EC208
	cmp sb, #0x80000000
	cmpeq sl, r6
	beq _020EC1D0
	rsbs sl, sl, #0
	rsc sb, sb, #0
_020EC1D0:
	mov r0, #1
	str r0, [sp, #0x18]
	b _020EC208
_020EC1DC:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #8
	b _020EC208
_020EC1EC:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #0xa
	b _020EC208
_020EC1FC:
	mov r6, #0
	str r6, [sp, #0x10]
	mov r7, #0x10
_020EC208:
	mov r4, #0
_020EC20C:
	mov r0, sl
	mov r1, sb
	mov r2, r7
	mov r3, r6
	bl _ull_mod
	mov r5, r0
	mov r0, sl
	mov r1, sb
	mov r2, r7
	mov r3, r6
	bl _ll_udiv
	mov sl, r0
	cmp r5, #0xa
	mov sb, r1
	addlt r0, r5, #0x30
	blt _020EC25C
	ldr r0, [sp, #8]
	cmp r0, #0x78
	addeq r0, r5, #0x57
	addne r0, r5, #0x37
_020EC25C:
	strh r0, [r8, #-2]!
	mov r0, #0
	cmp sb, r0
	cmpeq sl, r4
	add fp, fp, #1
	bne _020EC20C
	cmp r6, #0
	cmpeq r7, #8
	bne _020EC29C
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrneh r0, [r8]
	cmpne r0, #0x30
	movne r0, #0x30
	strneh r0, [r8, #-2]!
	addne fp, fp, #1
_020EC29C:
	ldrb r0, [sp, #0x4c]
	cmp r0, #2
	bne _020EC2EC
	ldr r0, [sp, #0xc]
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ldreq r0, [sp, #0x10]
	cmpeq r0, #0
	ldrne r0, [sp, #0x14]
	subne r0, r0, #1
	strne r0, [sp, #0x14]
	cmp r6, #0
	cmpeq r7, #0x10
	bne _020EC2EC
	ldr r0, [sp, #4]
	cmp r0, #0
	ldrne r0, [sp, #0x14]
	subne r0, r0, #2
	strne r0, [sp, #0x14]
_020EC2EC:
	ldr r0, [sp]
	ldr r2, _020EC3B0 ; =0x000001FD
	sub r0, r0, r8
	add r1, r0, r0, lsr #31
	ldr r0, [sp, #0x14]
	add r0, r0, r1, asr #1
	cmp r0, r2
	addgt sp, sp, #0x1c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	ldr r0, [sp, #0x14]
	cmp fp, r0
	bge _020EC340
	mov r1, #0x30
_020EC32C:
	ldr r0, [sp, #0x14]
	add fp, fp, #1
	cmp fp, r0
	strh r1, [r8, #-2]!
	blt _020EC32C
_020EC340:
	cmp r6, #0
	cmpeq r7, #0x10
	bne _020EC368
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _020EC368
	ldr r0, [sp, #8]
	mov r1, #0x30
	strh r0, [r8, #-2]
	strh r1, [r8, #-4]!
_020EC368:
	ldr r0, [sp, #0x18]
	cmp r0, #0
	movne r0, #0x2d
	strneh r0, [r8, #-2]!
	bne _020EC39C
	ldr r0, [sp, #0x10]
	cmp r0, #1
	moveq r0, #0x2b
	streqh r0, [r8, #-2]!
	beq _020EC39C
	cmp r0, #2
	moveq r0, #0x20
	streqh r0, [r8, #-2]!
_020EC39C:
	mov r0, r8
	add sp, sp, #0x1c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020EC3B0: .word 0x000001FD
	arm_func_end longlong2str__wprintf

	arm_func_start double2hex__wprintf
double2hex__wprintf: ; 0x020EC3B4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	sub sp, sp, #0x44
	ldr r7, [sp, #0x80]
	ldr r0, _020EC720 ; =0x000001FD
	mov r8, r2
	cmp r7, r0
	ldrh r6, [sp, #0x7a]
	ldrb r5, [sp, #0x77]
	ldrb r4, [sp, #0x75]
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x6c]
	addgt sp, sp, #0x44
	movgt r0, #0
	ldmgtia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addgt sp, sp, #0x10
	bxgt lr
	mov sl, #0
	mov sb, #0x20
	add r0, sp, #8
	add r3, sp, #0xc
	strb sl, [sp, #8]
	strh sb, [sp, #0xa]
	bl __num2dec
	ldr r0, [sp, #0x68]
	ldr r1, [sp, #0x6c]
	bl fabs
	mov r2, r0
	mov r0, sl
	mov r3, r1
	mov r1, r0
	bl _deq
	bne _020EC45C
	sub r4, r8, #0xc
	ldr r1, _020EC724 ; =_02111364
	mov r0, r4
	bl wcscpy
	add sp, sp, #0x44
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020EC45C:
	ldrb r0, [sp, #0x11]
	cmp r0, #0x49
	bne _020EC4DC
	ldrsb r0, [sp, #0xc]
	cmp r0, #0
	beq _020EC4A0
	cmp r6, #0x41
	sub r4, r8, #0xa
	bne _020EC490
	ldr r1, _020EC728 ; =_02111370
	mov r0, r4
	bl wcscpy
	b _020EC4C8
_020EC490:
	ldr r1, _020EC72C ; =_0211137C
	mov r0, r4
	bl wcscpy
	b _020EC4C8
_020EC4A0:
	cmp r6, #0x41
	sub r4, r8, #8
	bne _020EC4BC
	ldr r1, _020EC730 ; =_02111388
	mov r0, r4
	bl wcscpy
	b _020EC4C8
_020EC4BC:
	ldr r1, _020EC734 ; =_02111390
	mov r0, r4
	bl wcscpy
_020EC4C8:
	add sp, sp, #0x44
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020EC4DC:
	cmp r0, #0x4e
	bne _020EC558
	ldrsb r0, [sp, #0xc]
	cmp r0, #0
	beq _020EC51C
	cmp r6, #0x41
	sub r4, r8, #0xa
	bne _020EC50C
	ldr r1, _020EC738 ; =_02111398
	mov r0, r4
	bl wcscpy
	b _020EC544
_020EC50C:
	ldr r1, _020EC73C ; =_021113A4
	mov r0, r4
	bl wcscpy
	b _020EC544
_020EC51C:
	cmp r6, #0x41
	sub r4, r8, #8
	bne _020EC538
	ldr r1, _020EC740 ; =_021113B0
	mov r0, r4
	bl wcscpy
	b _020EC544
_020EC538:
	ldr r1, _020EC744 ; =_021113B8
	mov r0, r4
	bl wcscpy
_020EC544:
	add sp, sp, #0x44
	mov r0, r4
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
_020EC558:
	mov r3, sl
	mov r1, #1
	mov r0, #0x64
	add sb, sp, #0x68
	strb r1, [sp, #0x34]
	strb r1, [sp, #0x35]
	strb r3, [sp, #0x36]
	strb r3, [sp, #0x37]
	strb r3, [sp, #0x38]
	str r3, [sp, #0x3c]
	str r1, [sp, #0x40]
	strh r0, [sp, #0x3a]
_020EC588:
	rsb r1, r3, #7
	ldrsb r2, [sb, r3]
	ldrsb r0, [sb, r1]
	strb r0, [sb, r3]
	add r3, r3, #1
	strb r2, [sb, r1]
	cmp r3, #4
	blt _020EC588
	ldrb r0, [sp, #0x69]
	ldrb r1, [sp, #0x68]
	ldr sb, _020EC748 ; =0x000007FF
	mov r0, r0, lsl #0x11
	orr r1, r0, r1, lsl #25
	add r0, sp, #0x34
	and lr, sb, r1, lsr #21
	sub ip, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia ip, {r0, r1, r2, r3}
	rsb r0, sb, #0x400
	mov r1, r8
	add r0, lr, r0
	ldmia ip, {r2, r3}
	bl long2str__wprintf
	cmp r6, #0x61
	moveq r1, #0x70
	movne r1, #0x50
	strh r1, [r0, #-2]!
	mov r1, r7, lsl #2
	mov lr, r7
	cmp r7, #1
	add r8, r1, #0xb
	add ip, sp, #0x68
	blt _020EC698
	mov sb, #0x30
_020EC610:
	cmp r8, #0x40
	bge _020EC680
	ldrb r1, [ip, r8, asr #3]
	and r2, r8, #7
	rsb r3, r2, #7
	mov r2, r1, asr r3
	sub sl, r8, #4
	bic r1, r8, #7
	bic sl, sl, #7
	cmp r1, sl
	add sl, ip, r8, asr #3
	and r1, r2, #0xff
	beq _020EC654
	ldrb r2, [sl, #-1]
	mov r2, r2, lsl #8
	orr r1, r1, r2, asr r3
	and r1, r1, #0xff
_020EC654:
	and r1, r1, #0xf
	cmp r1, #0xa
	addlo r1, r1, #0x30
	andlo r1, r1, #0xff
	blo _020EC684
	cmp r6, #0x61
	addeq r1, r1, #0x57
	andeq r1, r1, #0xff
	addne r1, r1, #0x37
	andne r1, r1, #0xff
	b _020EC684
_020EC680:
	mov r1, sb
_020EC684:
	sub lr, lr, #1
	cmp lr, #1
	strh r1, [r0, #-2]!
	sub r8, r8, #4
	bge _020EC610
_020EC698:
	cmp r7, #0
	cmpeq r5, #0
	movne r1, #0x2e
	strneh r1, [r0, #-2]!
	mov r1, #0x31
	strh r1, [r0, #-2]
	cmp r6, #0x61
	moveq r1, #0x78
	movne r1, #0x58
	strh r1, [r0, #-4]!
	mov r1, #0x30
	strh r1, [r0, #-2]!
	ldrsb r1, [sp, #0xc]
	cmp r1, #0
	movne r1, #0x2d
	strneh r1, [r0, #-2]!
	addne sp, sp, #0x44
	ldmneia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addne sp, sp, #0x10
	bxne lr
	cmp r4, #1
	moveq r1, #0x2b
	streqh r1, [r0, #-2]!
	addeq sp, sp, #0x44
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	addeq sp, sp, #0x10
	bxeq lr
	cmp r4, #2
	moveq r1, #0x20
	streqh r1, [r0, #-2]!
	add sp, sp, #0x44
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020EC720: .word 0x000001FD
_020EC724: .word _02111364
_020EC728: .word _02111370
_020EC72C: .word _0211137C
_020EC730: .word _02111388
_020EC734: .word _02111390
_020EC738: .word _02111398
_020EC73C: .word _021113A4
_020EC740: .word _021113B0
_020EC744: .word _021113B8
_020EC748: .word 0x000007FF
	arm_func_end double2hex__wprintf

	arm_func_start round_decimal__wprintf
round_decimal__wprintf: ; 0x020EC74C
	stmdb sp!, {r4, lr}
	cmp r1, #0
	bge _020EC774
_020EC758:
	mov r1, #0
	strh r1, [r0, #2]
	mov r1, #1
	strb r1, [r0, #4]
	mov r1, #0x30
	strb r1, [r0, #5]
	ldmia sp!, {r4, pc}
_020EC774:
	ldrb lr, [r0, #4]
	cmp r1, lr
	ldmgeia sp!, {r4, pc}
	add ip, r0, #5
	add r2, ip, r1
	add r2, r2, #1
	ldrsb r3, [r2, #-1]!
	sub r3, r3, #0x30
	mov r3, r3, lsl #0x18
	mov r3, r3, asr #0x18
	cmp r3, #5
	bne _020EC7D4
	add ip, ip, lr
_020EC7A8:
	sub ip, ip, #1
	cmp ip, r2
	bls _020EC7C0
	ldrsb r3, [ip]
	cmp r3, #0x30
	beq _020EC7A8
_020EC7C0:
	cmp ip, r2
	ldreqsb r3, [r2, #-1]
	andeq r4, r3, #1
	movne r4, #1
	b _020EC7DC
_020EC7D4:
	movgt r4, #1
	movle r4, #0
_020EC7DC:
	cmp r1, #0
	beq _020EC838
	mov ip, #0
	mov lr, #1
_020EC7EC:
	ldrsb r3, [r2, #-1]!
	sub r3, r3, #0x30
	add r3, r3, r4
	mov r3, r3, lsl #0x18
	mov r3, r3, asr #0x18
	cmp r3, #9
	movgt r4, lr
	movle r4, ip
	cmp r4, #0
	bne _020EC81C
	cmp r3, #0
	bne _020EC824
_020EC81C:
	sub r1, r1, #1
	b _020EC830
_020EC824:
	add r3, r3, #0x30
	strb r3, [r2]
	b _020EC838
_020EC830:
	cmp r1, #0
	bne _020EC7EC
_020EC838:
	cmp r4, #0
	beq _020EC860
	ldrsh r3, [r0, #2]
	mov r2, #1
	mov r1, #0x31
	add r3, r3, #1
	strh r3, [r0, #2]
	strb r2, [r0, #4]
	strb r1, [r0, #5]
	ldmia sp!, {r4, pc}
_020EC860:
	cmp r1, #0
	beq _020EC758
	strb r1, [r0, #4]
	ldmia sp!, {r4, pc}
	arm_func_end round_decimal__wprintf

	arm_func_start float2str__wprintf
float2str__wprintf: ; 0x020EC870
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x22c
	mov sl, r0
	add r0, sp, #0x250
	ldr r7, [sp, #0x268]
	ldr r3, _020ECE90 ; =0x000001FD
	ldrh r6, [r0, #0x12]
	cmp r7, r3
	ldrb r5, [sp, #0x25f]
	ldrb r4, [sp, #0x25d]
	mov r8, r1
	mov sb, r2
	addgt sp, sp, #0x22c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	mov ip, #0
	mov fp, #0x20
	add r0, sp, #0
	add r3, sp, #4
	mov r1, sl
	mov r2, r8
	strb ip, [sp]
	strh fp, [sp, #2]
	bl __num2dec
	ldrb r0, [sp, #8]
	add r1, sp, #9
	add r0, r1, r0
	b _020EC904
_020EC8EC:
	ldrb r2, [sp, #8]
	ldrsh r1, [sp, #6]
	sub r2, r2, #1
	add r1, r1, #1
	strb r2, [sp, #8]
	strh r1, [sp, #6]
_020EC904:
	ldrb r1, [sp, #8]
	cmp r1, #1
	bls _020EC91C
	ldrsb r1, [r0, #-1]!
	cmp r1, #0x30
	beq _020EC8EC
_020EC91C:
	ldrb r0, [sp, #9]
	cmp r0, #0x30
	beq _020EC93C
	cmp r0, #0x49
	beq _020EC948
	cmp r0, #0x4e
	beq _020ECA00
	b _020ECAAC
_020EC93C:
	mov r0, #0
	strh r0, [sp, #6]
	b _020ECAAC
_020EC948:
	mov r2, #0
	mov r0, sl
	mov r1, r8
	mov r3, r2
	bl _dls
	bhs _020EC9A8
	cmp r6, #0x80
	sub r4, sb, #0xa
	movhs r0, #0
	bhs _020EC980
	ldr r0, _020ECE94 ; =_0210E73C
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x200
_020EC980:
	cmp r0, #0
	beq _020EC998
	ldr r1, _020ECE98 ; =_02111370
	mov r0, r4
	bl wcscpy
	b _020EC9EC
_020EC998:
	ldr r1, _020ECE9C ; =_0211137C
	mov r0, r4
	bl wcscpy
	b _020EC9EC
_020EC9A8:
	cmp r6, #0x80
	sub r4, sb, #8
	movhs r0, #0
	bhs _020EC9C8
	ldr r0, _020ECE94 ; =_0210E73C
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x200
_020EC9C8:
	cmp r0, #0
	beq _020EC9E0
	ldr r1, _020ECEA0 ; =_02111388
	mov r0, r4
	bl wcscpy
	b _020EC9EC
_020EC9E0:
	ldr r1, _020ECEA4 ; =_02111390
	mov r0, r4
	bl wcscpy
_020EC9EC:
	add sp, sp, #0x22c
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020ECA00:
	ldrsb r0, [sp, #4]
	cmp r0, #0
	beq _020ECA54
	cmp r6, #0x80
	sub r4, sb, #0xa
	movhs r0, #0
	bhs _020ECA2C
	ldr r0, _020ECE94 ; =_0210E73C
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x200
_020ECA2C:
	cmp r0, #0
	beq _020ECA44
	ldr r1, _020ECEA8 ; =_02111398
	mov r0, r4
	bl wcscpy
	b _020ECA98
_020ECA44:
	ldr r1, _020ECEAC ; =_021113A4
	mov r0, r4
	bl wcscpy
	b _020ECA98
_020ECA54:
	cmp r6, #0x80
	sub r4, sb, #8
	movhs r0, #0
	bhs _020ECA74
	ldr r0, _020ECE94 ; =_0210E73C
	mov r1, r6, lsl #1
	ldrh r0, [r0, r1]
	and r0, r0, #0x200
_020ECA74:
	cmp r0, #0
	beq _020ECA8C
	ldr r1, _020ECEB0 ; =_021113B0
	mov r0, r4
	bl wcscpy
	b _020ECA98
_020ECA8C:
	ldr r1, _020ECEB4 ; =_021113B8
	mov r0, r4
	bl wcscpy
_020ECA98:
	add sp, sp, #0x22c
	mov r0, r4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020ECAAC:
	ldrb r1, [sp, #8]
	ldrsh r2, [sp, #6]
	add r0, sp, #0x200
	sub r1, r1, #1
	add r0, r0, #0x2a
	add r1, r2, r1
	sub r8, r0, #1
	strh r1, [sp, #6]
	mov r0, #0
	strb r0, [r8]
	cmp r6, #0x65
	bgt _020ECB08
	bge _020ECB94
	cmp r6, #0x47
	bgt _020ECE54
	cmp r6, #0x45
	blt _020ECE54
	beq _020ECB94
	cmp r6, #0x46
	beq _020ECCE0
	cmp r6, #0x47
	beq _020ECB20
	b _020ECE54
_020ECB08:
	cmp r6, #0x66
	bgt _020ECB18
	beq _020ECCE0
	b _020ECE54
_020ECB18:
	cmp r6, #0x67
	bne _020ECE54
_020ECB20:
	ldrb r0, [sp, #8]
	cmp r0, r7
	ble _020ECB38
	add r0, sp, #4
	mov r1, r7
	bl round_decimal__wprintf
_020ECB38:
	ldrsh r2, [sp, #6]
	mvn r0, #3
	cmp r2, r0
	blt _020ECB50
	cmp r2, r7
	blt _020ECB70
_020ECB50:
	cmp r5, #0
	ldreqb r0, [sp, #8]
	subne r7, r7, #1
	subeq r7, r0, #1
	cmp r6, #0x67
	moveq r6, #0x65
	movne r6, #0x45
	b _020ECB94
_020ECB70:
	cmp r5, #0
	addne r0, r2, #1
	subne r7, r7, r0
	bne _020ECCE0
	ldrb r1, [sp, #8]
	add r0, r2, #1
	subs r7, r1, r0
	movmi r7, #0
	b _020ECCE0
_020ECB94:
	ldrb r0, [sp, #8]
	add r1, r7, #1
	cmp r0, r1
	ble _020ECBAC
	add r0, sp, #4
	bl round_decimal__wprintf
_020ECBAC:
	ldrsh lr, [sp, #6]
	mov fp, #0x2b
	mov sl, #0
	cmp lr, #0
	rsblt lr, lr, #0
	movlt fp, #0x2d
	ldr r3, _020ECEB8 ; =0x66666667
	mov r0, #0xa
	b _020ECC00
_020ECBD0:
	mov r1, lr, lsr #0x1f
	smull r2, ip, r3, lr
	add ip, r1, ip, asr #2
	smull r1, r2, r0, ip
	sub ip, lr, r1
	add r1, ip, #0x30
	strb r1, [r8, #-1]!
	mov r2, lr
	smull r1, lr, r3, r2
	mov r1, r2, lsr #0x1f
	add lr, r1, lr, asr #2
	add sl, sl, #1
_020ECC00:
	cmp lr, #0
	bne _020ECBD0
	cmp sl, #2
	blt _020ECBD0
	add r0, sp, #0x2a
	strb fp, [r8, #-1]
	strb r6, [r8, #-2]!
	sub r1, r0, r8
	ldr r0, _020ECE90 ; =0x000001FD
	add r1, r1, r7
	cmp r1, r0
	addgt sp, sp, #0x22c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	ldrb r1, [sp, #8]
	add r0, r7, #1
	cmp r1, r0
	bge _020ECC70
	add r0, r7, #2
	sub r0, r0, r1
	subs r1, r0, #1
	beq _020ECC70
	mov r0, #0x30
_020ECC64:
	strb r0, [r8, #-1]!
	subs r1, r1, #1
	bne _020ECC64
_020ECC70:
	ldrb r1, [sp, #8]
	add r0, sp, #9
	add r2, r0, r1
	subs r1, r1, #1
	beq _020ECC94
_020ECC84:
	ldrsb r0, [r2, #-1]!
	subs r1, r1, #1
	strb r0, [r8, #-1]!
	bne _020ECC84
_020ECC94:
	cmp r7, #0
	cmpeq r5, #0
	movne r0, #0x2e
	strneb r0, [r8, #-1]!
	ldrb r0, [sp, #9]
	strb r0, [r8, #-1]!
	ldrsb r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r8, #-1]!
	bne _020ECE54
	cmp r4, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _020ECE54
	cmp r4, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
	b _020ECE54
_020ECCE0:
	ldrsh r3, [sp, #6]
	ldrb r2, [sp, #8]
	sub r0, r2, r3
	subs r1, r0, #1
	movmi r1, #0
	cmp r1, r7
	ble _020ECD20
	sub r1, r1, r7
	add r0, sp, #4
	sub r1, r2, r1
	bl round_decimal__wprintf
	ldrsh r3, [sp, #6]
	ldrb r2, [sp, #8]
	sub r0, r2, r3
	subs r1, r0, #1
	movmi r1, #0
_020ECD20:
	adds r0, r3, #1
	movmi r0, #0
	ldr r3, _020ECE90 ; =0x000001FD
	add r6, r0, r1
	cmp r6, r3
	addgt sp, sp, #0x22c
	movgt r0, #0
	ldmgtia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addgt sp, sp, #0x10
	bxgt lr
	add r3, sp, #9
	sub r6, r7, r1
	cmp r6, #0
	add r2, r3, r2
	mov sl, #0
	ble _020ECD74
	mov r3, #0x30
_020ECD64:
	add sl, sl, #1
	cmp sl, r6
	strb r3, [r8, #-1]!
	blt _020ECD64
_020ECD74:
	mov r6, #0
	b _020ECD88
_020ECD7C:
	ldrsb r3, [r2, #-1]!
	add r6, r6, #1
	strb r3, [r8, #-1]!
_020ECD88:
	cmp r6, r1
	ldrltb r3, [sp, #8]
	cmplt r6, r3
	blt _020ECD7C
	cmp r6, r1
	bge _020ECDB4
	mov r3, #0x30
_020ECDA4:
	add r6, r6, #1
	cmp r6, r1
	strb r3, [r8, #-1]!
	blt _020ECDA4
_020ECDB4:
	cmp r7, #0
	cmpeq r5, #0
	movne r1, #0x2e
	strneb r1, [r8, #-1]!
	cmp r0, #0
	beq _020ECE1C
	ldrb r1, [sp, #8]
	mov r5, #0
	sub r1, r0, r1
	cmp r1, #0
	ble _020ECDFC
	mov r3, #0x30
_020ECDE4:
	strb r3, [r8, #-1]!
	ldrb r1, [sp, #8]
	add r5, r5, #1
	sub r1, r0, r1
	cmp r5, r1
	blt _020ECDE4
_020ECDFC:
	cmp r5, r0
	bge _020ECE24
_020ECE04:
	ldrsb r1, [r2, #-1]!
	add r5, r5, #1
	cmp r5, r0
	strb r1, [r8, #-1]!
	blt _020ECE04
	b _020ECE24
_020ECE1C:
	mov r0, #0x30
	strb r0, [r8, #-1]!
_020ECE24:
	ldrsb r0, [sp, #4]
	cmp r0, #0
	movne r0, #0x2d
	strneb r0, [r8, #-1]!
	bne _020ECE54
	cmp r4, #1
	moveq r0, #0x2b
	streqb r0, [r8, #-1]!
	beq _020ECE54
	cmp r4, #2
	moveq r0, #0x20
	streqb r0, [r8, #-1]!
_020ECE54:
	mov r0, r8
	bl strlen
	sub r1, sb, r0, lsl #1
	mov r0, r8
	sub r4, r1, #2
	bl strlen
	mov r2, r0
	mov r0, r4
	mov r1, r8
	bl mbstowcs
	mov r0, r4
	add sp, sp, #0x22c
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020ECE90: .word 0x000001FD
_020ECE94: .word _0210E73C
_020ECE98: .word _02111370
_020ECE9C: .word _0211137C
_020ECEA0: .word _02111388
_020ECEA4: .word _02111390
_020ECEA8: .word _02111398
_020ECEAC: .word _021113A4
_020ECEB0: .word _021113B0
_020ECEB4: .word _021113B8
_020ECEB8: .word 0x66666667
	arm_func_end float2str__wprintf

	arm_func_start __wpformatter
__wpformatter: ; 0x020ECEBC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x430
	mov r3, #0x20
	mov fp, r2
	strh r3, [sp, #0x1c]
	ldrh r2, [fp]
	mov sb, r0
	mov r8, r1
	cmp r2, #0
	mov r4, #0
	beq _020ED78C
_020ECEEC:
	mov r0, fp
	mov r1, #0x25
	bl wcschr
	str r0, [sp, #0xc]
	cmp r0, #0
	bne _020ECF40
	mov r0, fp
	bl wcslen
	movs r2, r0
	add r4, r4, r2
	beq _020ED78C
	mov r0, r8
	mov r1, fp
	blx sb
	cmp r0, #0
	bne _020ED78C
	add sp, sp, #0x430
	mvn r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020ECF40:
	sub r0, r0, fp
	add r0, r0, r0, lsr #31
	movs r2, r0, asr #1
	add r4, r4, r2
	beq _020ECF78
	mov r0, r8
	mov r1, fp
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x430
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_020ECF78:
	add r1, sp, #0x400
	ldr r0, [sp, #0xc]
	add r1, r1, #0x64
	add r2, sp, #0x20
	bl parse_format__wprintf
	ldrh r1, [sp, #0x26]
	mov fp, r0
	cmp r1, #0x61
	bgt _020ECFE8
	bge _020ED354
	cmp r1, #0x47
	bgt _020ECFDC
	subs r0, r1, #0x41
	addpl pc, pc, r0, lsl #2
	b _020ECFD0
_020ECFB4: ; jump table
	b _020ED354 ; case 0
	b _020ED5F8 ; case 1
	b _020ED5F8 ; case 2
	b _020ED5F8 ; case 3
	b _020ED2E4 ; case 4
	b _020ED2E4 ; case 5
	b _020ED2E4 ; case 6
_020ECFD0:
	cmp r1, #0x25
	beq _020ED5E4
	b _020ED5F8
_020ECFDC:
	cmp r1, #0x58
	beq _020ED1A8
	b _020ED5F8
_020ECFE8:
	cmp r1, #0x75
	bgt _020ED050
	subs r0, r1, #0x64
	addpl pc, pc, r0, lsl #2
	b _020ED044
_020ECFFC: ; jump table
	b _020ED06C ; case 0
	b _020ED2E4 ; case 1
	b _020ED2E4 ; case 2
	b _020ED2E4 ; case 3
	b _020ED5F8 ; case 4
	b _020ED06C ; case 5
	b _020ED5F8 ; case 6
	b _020ED5F8 ; case 7
	b _020ED5F8 ; case 8
	b _020ED5F8 ; case 9
	b _020ED500 ; case 10
	b _020ED1A8 ; case 11
	b _020ED5F8 ; case 12
	b _020ED5F8 ; case 13
	b _020ED5F8 ; case 14
	b _020ED3C4 ; case 15
	b _020ED5F8 ; case 16
	b _020ED1A8 ; case 17
_020ED044:
	cmp r1, #0x63
	beq _020ED58C
	b _020ED5F8
_020ED050:
	cmp r1, #0x78
	bgt _020ED060
	beq _020ED1A8
	b _020ED5F8
_020ED060:
	ldr r0, _020ED7A0 ; =0x0000FFFF
	cmp r1, r0
	b _020ED5F8
_020ED06C:
	ldrb r0, [sp, #0x24]
	cmp r0, #3
	bne _020ED08C
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
	b _020ED124
_020ED08C:
	cmp r0, #4
	bne _020ED0B4
	ldr r1, [sp, #0x464]
	add r2, r1, #8
	str r2, [sp, #0x464]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020ED124
_020ED0B4:
	cmp r0, #6
	bne _020ED0DC
	ldr r1, [sp, #0x464]
	add r2, r1, #8
	str r2, [sp, #0x464]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020ED124
_020ED0DC:
	cmp r0, #7
	bne _020ED0F8
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
	b _020ED124
_020ED0F8:
	cmp r0, #8
	bne _020ED114
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
	b _020ED124
_020ED114:
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
_020ED124:
	cmp r0, #2
	moveq r1, sl, lsl #0x10
	moveq sl, r1, asr #0x10
	cmp r0, #4
	cmpne r0, #6
	add r0, sp, #0x20
	bne _020ED16C
	sub r5, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r3, [r5]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x430
	bl longlong2str__wprintf
	movs r6, r0
	beq _020ED5F8
	b _020ED190
_020ED16C:
	sub r5, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	add r1, sp, #0x430
	mov r0, sl
	ldmia r5, {r2, r3}
	bl long2str__wprintf
	movs r6, r0
	beq _020ED5F8
_020ED190:
	add r0, sp, #0x400
	add r0, r0, #0x2e
	sub r0, r0, r6
	add r0, r0, r0, lsr #31
	mov r7, r0, asr #1
	b _020ED644
_020ED1A8:
	ldrb r0, [sp, #0x24]
	cmp r0, #3
	bne _020ED1C8
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
	b _020ED260
_020ED1C8:
	cmp r0, #4
	bne _020ED1F0
	ldr r1, [sp, #0x464]
	add r2, r1, #8
	str r2, [sp, #0x464]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020ED260
_020ED1F0:
	cmp r0, #6
	bne _020ED218
	ldr r1, [sp, #0x464]
	add r2, r1, #8
	str r2, [sp, #0x464]
	ldr r1, [r2, #-8]
	str r1, [sp, #0x10]
	ldr r1, [r2, #-4]
	str r1, [sp, #0x14]
	b _020ED260
_020ED218:
	cmp r0, #7
	bne _020ED234
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
	b _020ED260
_020ED234:
	cmp r0, #8
	bne _020ED250
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
	b _020ED260
_020ED250:
	ldr r1, [sp, #0x464]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr sl, [r1, #-4]
_020ED260:
	cmp r0, #2
	moveq r1, sl, lsl #0x10
	moveq sl, r1, lsr #0x10
	cmp r0, #4
	cmpne r0, #6
	add r0, sp, #0x20
	bne _020ED2A8
	sub r5, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r3, [r5]
	ldr r0, [sp, #0x10]
	ldr r1, [sp, #0x14]
	add r2, sp, #0x430
	bl longlong2str__wprintf
	movs r6, r0
	beq _020ED5F8
	b _020ED2CC
_020ED2A8:
	sub r5, sp, #8
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	add r1, sp, #0x430
	mov r0, sl
	ldmia r5, {r2, r3}
	bl long2str__wprintf
	movs r6, r0
	beq _020ED5F8
_020ED2CC:
	add r0, sp, #0x400
	add r0, r0, #0x2e
	sub r0, r0, r6
	add r0, r0, r0, lsr #31
	mov r7, r0, asr #1
	b _020ED644
_020ED2E4:
	ldrb r0, [sp, #0x24]
	cmp r0, #9
	ldrne r0, [sp, #0x464]
	addne r0, r0, #8
	strne r0, [sp, #0x464]
	bne _020ED308
	ldr r0, [sp, #0x464]
	add r0, r0, #8
	str r0, [sp, #0x464]
_020ED308:
	ldr r7, [r0, #-8]
	ldr r6, [r0, #-4]
	add r0, sp, #0x20
	sub r5, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r3, [r5]
	mov r0, r7
	mov r1, r6
	add r2, sp, #0x430
	bl float2str__wprintf
	movs r6, r0
	beq _020ED5F8
	add r0, sp, #0x400
	add r0, r0, #0x2e
	sub r0, r0, r6
	add r0, r0, r0, lsr #31
	mov r7, r0, asr #1
	b _020ED644
_020ED354:
	ldrb r0, [sp, #0x24]
	cmp r0, #9
	ldrne r0, [sp, #0x464]
	addne r0, r0, #8
	strne r0, [sp, #0x464]
	bne _020ED378
	ldr r0, [sp, #0x464]
	add r0, r0, #8
	str r0, [sp, #0x464]
_020ED378:
	ldr r7, [r0, #-8]
	ldr r6, [r0, #-4]
	add r0, sp, #0x20
	sub r5, sp, #4
	ldmia r0, {r0, r1, r2, r3}
	stmia r5, {r0, r1, r2, r3}
	ldr r3, [r5]
	mov r0, r7
	mov r1, r6
	add r2, sp, #0x430
	bl double2hex__wprintf
	movs r6, r0
	beq _020ED5F8
	add r0, sp, #0x400
	add r0, r0, #0x2e
	sub r0, r0, r6
	add r0, r0, r0, lsr #31
	mov r7, r0, asr #1
	b _020ED644
_020ED3C4:
	ldrb r0, [sp, #0x24]
	cmp r0, #5
	bne _020ED460
	ldr r0, [sp, #0x464]
	add r0, r0, #4
	str r0, [sp, #0x464]
	ldr r6, [r0, #-4]
	ldrb r0, [sp, #0x23]
	cmp r6, #0
	ldreq r6, _020ED7A4 ; =_021113C0
	cmp r0, #0
	beq _020ED418
	ldrh r1, [r6], #2
	ldrb r0, [sp, #0x22]
	and r7, r1, #0xff
	cmp r0, #0
	beq _020ED644
	ldr r0, [sp, #0x2c]
	cmp r7, r0
	movgt r7, r0
	b _020ED644
_020ED418:
	ldrb r0, [sp, #0x22]
	cmp r0, #0
	beq _020ED450
	ldr r7, [sp, #0x2c]
	mov r0, r6
	mov r2, r7
	mov r1, #0
	bl wmemchr
	cmp r0, #0
	beq _020ED644
	sub r0, r0, r6
	add r0, r0, r0, lsr #31
	mov r7, r0, asr #1
	b _020ED644
_020ED450:
	mov r0, r6
	bl wcslen
	mov r7, r0
	b _020ED644
_020ED460:
	ldr r0, [sp, #0x464]
	add r0, r0, #4
	str r0, [sp, #0x464]
	ldr r5, [r0, #-4]
	ldrb r0, [sp, #0x23]
	cmp r5, #0
	ldreq r5, _020ED7A8 ; =_021113C4
	cmp r0, #0
	beq _020ED4A8
	ldrh r1, [r6]
	ldrb r0, [sp, #0x22]
	and r6, r1, #0xff
	cmp r0, #0
	beq _020ED4E0
	ldr r0, [sp, #0x2c]
	cmp r6, r0
	movgt r6, r0
	b _020ED4E0
_020ED4A8:
	ldrb r0, [sp, #0x22]
	cmp r0, #0
	beq _020ED4D4
	ldr r6, [sp, #0x2c]
	mov r0, r5
	mov r2, r6
	mov r1, #0
	bl memchr
	cmp r0, #0
	subne r6, r0, r5
	b _020ED4E0
_020ED4D4:
	mov r0, r5
	bl strlen
	mov r6, r0
_020ED4E0:
	add r0, sp, #0x30
	mov r1, r5
	mov r2, r6
	bl mbstowcs
	movs r7, r0
	bmi _020ED5F8
	add r6, sp, #0x30
	b _020ED644
_020ED500:
	ldr r1, [sp, #0x464]
	ldrb r0, [sp, #0x24]
	add r1, r1, #4
	str r1, [sp, #0x464]
	ldr r6, [r1, #-4]
	cmp r0, #8
	addls pc, pc, r0, lsl #2
	b _020ED780
_020ED520: ; jump table
	b _020ED544 ; case 0
	b _020ED780 ; case 1
	b _020ED54C ; case 2
	b _020ED554 ; case 3
	b _020ED57C ; case 4
	b _020ED780 ; case 5
	b _020ED55C ; case 6
	b _020ED56C ; case 7
	b _020ED574 ; case 8
_020ED544:
	str r4, [r6]
	b _020ED780
_020ED54C:
	strh r4, [r6]
	b _020ED780
_020ED554:
	str r4, [r6]
	b _020ED780
_020ED55C:
	str r4, [r6]
	mov r0, r4, asr #0x1f
	str r0, [r6, #4]
	b _020ED780
_020ED56C:
	str r4, [r6]
	b _020ED780
_020ED574:
	str r4, [r6]
	b _020ED780
_020ED57C:
	str r4, [r6]
	mov r0, r4, asr #0x1f
	str r0, [r6, #4]
	b _020ED780
_020ED58C:
	ldrb r0, [sp, #0x24]
	add r6, sp, #0x30
	cmp r0, #5
	bne _020ED5B8
	ldr r0, [sp, #0x464]
	mov r7, #1
	add r0, r0, #4
	str r0, [sp, #0x464]
	ldr r0, [r0, #-4]
	strh r0, [r6]
	b _020ED644
_020ED5B8:
	ldr r0, [sp, #0x464]
	add r1, sp, #0x18
	add r0, r0, #4
	str r0, [sp, #0x464]
	ldr r3, [r0, #-4]
	mov r0, r6
	mov r2, #1
	strb r3, [sp, #0x18]
	bl mbtowc
	mov r7, r0
	b _020ED644
_020ED5E4:
	mov r0, #0x25
	strh r0, [sp, #0x30]
	add r6, sp, #0x30
	mov r7, #1
	b _020ED644
_020ED5F8:
	ldr r0, [sp, #0xc]
	bl wcslen
	movs r5, r0
	beq _020ED630
	ldr r1, [sp, #0xc]
	mov r0, r8
	mov r2, r5
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x430
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_020ED630:
	add sp, sp, #0x430
	add r0, r4, r5
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020ED644:
	ldrb r0, [sp, #0x20]
	mov r5, r7
	cmp r0, #0
	beq _020ED6F4
	cmp r0, #2
	moveq r1, #0x30
	movne r1, #0x20
	strh r1, [sp, #0x1c]
	ldrh r0, [r6]
	cmp r0, #0x2b
	cmpne r0, #0x2d
	cmpne r0, #0x20
	bne _020ED6B0
	cmp r1, #0x30
	bne _020ED6B0
	mov r0, r8
	mov r1, r6
	mov r2, #1
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x430
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	add r6, r6, #2
	sub r7, r7, #1
_020ED6B0:
	ldr r0, [sp, #0x28]
	cmp r5, r0
	bge _020ED6F4
_020ED6BC:
	mov r0, r8
	add r1, sp, #0x1c
	mov r2, #1
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x430
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #0x28]
	add r5, r5, #1
	cmp r5, r0
	blt _020ED6BC
_020ED6F4:
	cmp r7, #0
	beq _020ED724
	mov r0, r8
	mov r1, r6
	mov r2, r7
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x430
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
_020ED724:
	ldrb r0, [sp, #0x20]
	cmp r0, #0
	bne _020ED77C
	ldr r0, [sp, #0x28]
	cmp r5, r0
	bge _020ED77C
	mov r7, #0x20
_020ED740:
	mov r0, r8
	add r1, sp, #0x1a
	mov r2, #1
	strh r7, [sp, #0x1a]
	blx sb
	cmp r0, #0
	addeq sp, sp, #0x430
	mvneq r0, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #0x28]
	add r5, r5, #1
	cmp r5, r0
	blt _020ED740
_020ED77C:
	add r4, r4, r5
_020ED780:
	ldrh r0, [fp]
	cmp r0, #0
	bne _020ECEEC
_020ED78C:
	mov r0, r4
	add sp, sp, #0x430
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020ED7A0: .word 0x0000FFFF
_020ED7A4: .word _021113C0
_020ED7A8: .word _021113C4
	arm_func_end __wpformatter

	arm_func_start __wStringWrite
__wStringWrite: ; 0x020ED7AC
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r0
	ldr r3, [r4, #8]
	mov r5, r2
	ldr r2, [r4, #4]
	add r0, r3, r5
	cmp r0, r2
	ldr r0, [r4]
	subhi r5, r2, r3
	mov r2, r5
	add r0, r0, r3, lsl #1
	bl wmemcpy
	ldr r1, [r4, #8]
	add r1, r1, r5
	str r1, [r4, #8]
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __wStringWrite

	arm_func_start swprintf
swprintf: ; 0x020ED7EC
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, lr}
	add r3, sp, #0x10
	bic r3, r3, #3
	ldr r2, [sp, #0x10]
	add r3, r3, #4
	bl vswprintf
	ldmia sp!, {r3, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end swprintf

	arm_func_start vswprintf
vswprintf: ; 0x020ED814
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0xc
	mov r5, r0
	mov r4, r1
	mov ip, #0
	ldr r0, _020ED880 ; =__wStringWrite
	add r1, sp, #0
	str r5, [sp]
	str r4, [sp, #4]
	str ip, [sp, #8]
	bl __wpformatter
	cmp r0, #0
	addlt sp, sp, #0xc
	ldmltia sp!, {r4, r5, pc}
	cmp r0, r4
	bhs _020ED868
	mov r1, r0, lsl #1
	mov r2, #0
	add sp, sp, #0xc
	strh r2, [r5, r1]
	ldmia sp!, {r4, r5, pc}
_020ED868:
	mov r1, #0
	add r0, r5, r4, lsl #1
	strh r1, [r0, #-2]
	sub r0, r1, #1
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020ED880: .word __wStringWrite
	arm_func_end vswprintf

	arm_func_start wcslen
wcslen: ; 0x020ED884
	mvn r2, #0
_020ED888:
	ldrh r1, [r0], #2
	add r2, r2, #1
	cmp r1, #0
	bne _020ED888
	mov r0, r2
	bx lr
	arm_func_end wcslen

	arm_func_start wcscpy
wcscpy: ; 0x020ED8A0
	mov r3, r0
_020ED8A4:
	ldrh r2, [r1], #2
	mov ip, r3
	strh r2, [r3], #2
	ldrh r2, [ip]
	cmp r2, #0
	bne _020ED8A4
	bx lr
	arm_func_end wcscpy

	arm_func_start wcschr
wcschr: ; 0x020ED8C0
	ldrh r2, [r0], #2
	cmp r2, #0
	beq _020ED8E4
_020ED8CC:
	cmp r2, r1
	subeq r0, r0, #2
	bxeq lr
	ldrh r2, [r0], #2
	cmp r2, #0
	bne _020ED8CC
_020ED8E4:
	cmp r1, #0
	movne r0, #0
	subeq r0, r0, #2
	bx lr
	arm_func_end wcschr

	arm_func_start __ieee754_pow
__ieee754_pow: ; 0x020ED8F4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x80
	ldr r8, [sp, #0xb4]
	ldr r6, [sp, #0xac]
	ldr r0, [sp, #0xb0]
	bic sb, r8, #0x80000000
	orrs r1, sb, r0
	ldr r7, [sp, #0xa8]
	bic r4, r6, #0x80000000
	addeq sp, sp, #0x80
	moveq r0, #0
	ldreq r1, _020EDEA0 ; =0x3FF00000
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r1, _020EDEA4 ; =0x7FF00000
	cmp r4, r1
	bgt _020ED964
	bne _020ED94C
	cmp r7, #0
	bne _020ED964
_020ED94C:
	ldr r1, _020EDEA4 ; =0x7FF00000
	cmp sb, r1
	bgt _020ED964
	bne _020ED988
	cmp r0, #0
	beq _020ED988
_020ED964:
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	ldr r2, [sp, #0xb0]
	ldr r3, [sp, #0xb4]
	bl _dadd
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020ED988:
	cmp r6, #0
	mov r5, #0
	bge _020ED9F0
	ldr r1, _020EDEA8 ; =0x43400000
	cmp sb, r1
	movge r5, #2
	bge _020ED9F0
	sub r1, r1, #0x3500000
	cmp sb, r1
	blt _020ED9F0
	ldr r1, _020EDEAC ; =0xFFFFFC01
	add r1, r1, sb, asr #20
	cmp r1, #0x14
	ble _020ED9D8
	rsb r2, r1, #0x34
	mov r1, r0, lsr r2
	cmp r0, r1, lsl r2
	andeq r1, r1, #1
	rsbeq r5, r1, #2
	b _020ED9F0
_020ED9D8:
	cmp r0, #0
	rsbeq r2, r1, #0x14
	moveq r1, sb, asr r2
	cmpeq sb, r1, lsl r2
	andeq r1, r1, #1
	rsbeq r5, r1, #2
_020ED9F0:
	cmp r0, #0
	bne _020EDB4C
	ldr r1, _020EDEA4 ; =0x7FF00000
	cmp sb, r1
	bne _020EDAA4
	add r0, r4, #0x100000
	add r0, r0, #0xc0000000
	orrs r0, r0, r7
	bne _020EDA38
	ldr r0, [sp, #0xb0]
	ldr r1, [sp, #0xb4]
	mov r2, r0
	mov r3, r1
	bl _dsub
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDA38:
	sub r0, r1, #0x40000000
	cmp r4, r0
	blt _020EDA68
	cmp r8, #0
	ldrge r0, [sp, #0xb0]
	ldrge r1, [sp, #0xb4]
	movlt r0, #0
	add sp, sp, #0x80
	movlt r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDA68:
	cmp r8, #0
	mov r0, #0
	addge sp, sp, #0x80
	movge r1, r0
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addge sp, sp, #0x10
	bxge lr
	ldr r2, [sp, #0xb0]
	ldr r3, [sp, #0xb4]
	mov r1, r0
	bl _dsub
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDAA4:
	sub r0, r1, #0x40000000
	cmp sb, r0
	bne _020EDAF0
	cmp r8, #0
	ldrge r0, [sp, #0xa8]
	ldrge r1, [sp, #0xac]
	addge sp, sp, #0x80
	ldmgeia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	addge sp, sp, #0x10
	bxge lr
	ldr r2, [sp, #0xa8]
	ldr r3, [sp, #0xac]
	sub r1, r1, #0x40000000
	mov r0, #0
	bl _ddiv
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDAF0:
	cmp r8, #0x40000000
	bne _020EDB1C
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	mov r2, r0
	mov r3, r1
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDB1C:
	ldr r0, _020EDEB0 ; =0x3FE00000
	cmp r8, r0
	bne _020EDB4C
	cmp r6, #0
	blt _020EDB4C
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	bl _dsqrt
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDB4C:
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	bl fabs
	str r0, [sp, #0x70]
	str r1, [sp, #0x74]
	cmp r7, #0
	bne _020EDC50
	ldr r0, _020EDEA4 ; =0x7FF00000
	cmp r4, r0
	cmpne r4, #0
	subne r0, r0, #0x40000000
	cmpne r4, r0
	bne _020EDC50
	ldr r2, [sp, #0x70]
	ldr r3, [sp, #0x74]
	str r2, [sp, #0x78]
	str r3, [sp, #0x7c]
	cmp r8, #0
	bge _020EDBAC
	ldr r1, _020EDEA0 ; =0x3FF00000
	mov r0, #0
	bl _ddiv
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
_020EDBAC:
	cmp r6, #0
	bge _020EDC38
	add r0, r4, #0x100000
	add r0, r0, #0xc0000000
	orrs r0, r0, r5
	bne _020EDC14
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	mov r2, r0
	mov r3, r1
	bl _dsub
	mov r4, r0
	mov r5, r1
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	mov r2, r0
	mov r3, r1
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, r5
	bl _ddiv
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
	b _020EDC38
_020EDC14:
	cmp r5, #1
	bne _020EDC38
	mov r0, #0
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	mov r1, r0
	bl _dsub
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
_020EDC38:
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDC50:
	mov r0, r6, asr #0x1f
	add r7, r0, #1
	orrs r0, r7, r5
	bne _020EDC88
	ldr r0, _020EDEB4 ; =_021110EC
	ldr r1, _020EDEB8 ; =_021E58C0
	ldr r0, [r0]
	mov r2, #0x21
	str r2, [r1]
	bl _f2d
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDC88:
	ldr r3, _020EDEBC ; =0x41E00000
	cmp sb, r3
	ble _020EDF8C
	add r0, r3, #0x2100000
	cmp sb, r0
	ble _020EDCF8
	ldr r1, _020EDEC0 ; =0x3FEFFFFF
	cmp r4, r1
	bgt _020EDCCC
	cmp r8, #0
	mov r0, #0
	addlt r1, r1, #0x40000001
	add sp, sp, #0x80
	movge r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDCCC:
	add r0, r1, #1
	cmp r4, r0
	blt _020EDCF8
	cmp r8, #0
	mov r0, #0
	addgt r1, r1, #0x40000001
	add sp, sp, #0x80
	movle r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDCF8:
	ldr r2, _020EDEC0 ; =0x3FEFFFFF
	cmp r4, r2
	bge _020EDD24
	cmp r8, #0
	mov r0, #0
	addlt r1, r2, #0x40000001
	add sp, sp, #0x80
	movge r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDD24:
	add r0, r2, #1
	cmp r4, r0
	ble _020EDD50
	cmp r8, #0
	mov r0, #0
	addgt r1, r2, #0x40000001
	add sp, sp, #0x80
	movle r1, r0
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EDD50:
	ldr r0, [sp, #0xa8]
	ldr r1, [sp, #0xac]
	add r3, r2, #1
	mov r2, #0
	bl _dsub
	mov r2, r0
	mov r3, r1
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	bl _dmul
	mov r6, r1
	mov r4, r0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	ldr r1, _020EDEC4 ; =0x3FD00000
	mov r0, #0
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDEC8 ; =0x55555555
	sub r1, r0, #0x15800000
	bl _dsub
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, #0
	ldr r1, _020EDEB0 ; =0x3FE00000
	bl _dsub
	mov r2, r0
	mov r0, r4
	mov r3, r1
	mov r1, r6
	bl _dmul
	mov r6, r0
	mov r8, r1
	mov r0, #0x60000000
	ldr r1, _020EDECC ; =0x3FF71547
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl _dmul
	mov r4, r0
	mov sb, r1
	ldr r0, _020EDED0 ; =0xF85DDF44
	ldr r1, _020EDED4 ; =0x3E54AE0B
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl _dmul
	mov fp, r0
	mov sl, r1
	ldr r0, _020EDED8 ; =0x652B82FE
	ldr r1, _020EDECC ; =0x3FF71547
	mov r2, r6
	mov r3, r8
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, fp
	mov r1, sl
	bl _dsub
	mov r6, r0
	mov r8, r1
	mov r0, r4
	mov r1, sb
	mov r2, r6
	mov r3, r8
	bl _dadd
	mov r2, r4
	mov r3, sb
	str r1, [sp, #0x5c]
	mov r0, #0
	str r0, [sp, #0x58]
	bl _dsub
	mov r2, r0
	mov r0, r6
	mov r3, r1
	mov r1, r8
	bl _dsub
	mov r4, r0
	mov r8, r1
	b _020EE4E8
	.align 2, 0
_020EDEA0: .word 0x3FF00000
_020EDEA4: .word 0x7FF00000
_020EDEA8: .word 0x43400000
_020EDEAC: .word 0xFFFFFC01
_020EDEB0: .word 0x3FE00000
_020EDEB4: .word _021110EC
_020EDEB8: .word _021E58C0
_020EDEBC: .word 0x41E00000
_020EDEC0: .word 0x3FEFFFFF
_020EDEC4: .word 0x3FD00000
_020EDEC8: .word 0x55555555
_020EDECC: .word 0x3FF71547
_020EDED0: .word 0xF85DDF44
_020EDED4: .word 0x3E54AE0B
_020EDED8: .word 0x652B82FE
_020EDEDC: .word 0x0003988E
_020EDEE0: .word 0x000BB67A
_020EDEE4: .word _0210E94C
_020EDEE8: .word 0x4A454EEF
_020EDEEC: .word 0x3FCA7E28
_020EDEF0: .word 0x93C9DB65
_020EDEF4: .word 0x3FCD864A
_020EDEF8: .word 0xA91D4101
_020EDEFC: .word 0x3FD17460
_020EDF00: .word 0x518F264D
_020EDF04: .word 0x3FD55555
_020EDF08: .word 0xDB6FABFF
_020EDF0C: .word 0x3FDB6DB6
_020EDF10: .word 0x33333303
_020EDF14: .word 0x3FE33333
_020EDF18: .word 0x40080000
_020EDF1C: .word 0x3FEEC709
_020EDF20: .word 0x145B01F5
_020EDF24: .word 0xBE3E2FE0
_020EDF28: .word 0xDC3A03FD
_020EDF2C: .word _0210E95C
_020EDF30: .word _0210E93C
_020EDF34: .word 0x40900000
_020EDF38: .word 0x8800759C
_020EDF3C: .word 0x7E37E43C
_020EDF40: .word 0x3C971547
_020EDF44: .word 0x3F6F3400
_020EDF48: .word 0xC2F8F359
_020EDF4C: .word 0x01A56E1F
_020EDF50: .word 0x3FE62E43
_020EDF54: .word 0xFEFA39EF
_020EDF58: .word 0x3FE62E42
_020EDF5C: .word 0x0CA86C39
_020EDF60: .word 0xBE205C61
_020EDF64: .word 0x72BEA4D0
_020EDF68: .word 0x3E663769
_020EDF6C: .word 0xC5D26BF1
_020EDF70: .word 0xBEBBBD41
_020EDF74: .word 0xAF25DE2C
_020EDF78: .word 0x3F11566A
_020EDF7C: .word 0x16BEBD93
_020EDF80: .word 0xBF66C16C
_020EDF84: .word 0x5555553E
_020EDF88: .word 0x3FC55555
_020EDF8C:
	cmp r4, #0x100000
	mov r6, #0
	bge _020EDFBC
	ldr r0, [sp, #0x70]
	ldr r1, [sp, #0x74]
	mov r2, r6
	add r3, r3, #0x1600000
	bl _dmul
	mov r4, r1
	str r0, [sp, #0x70]
	str r4, [sp, #0x74]
	sub r6, r6, #0x35
_020EDFBC:
	ldr r0, _020EDEAC ; =0xFFFFFC01
	ldr r1, _020EDEDC ; =0x0003988E
	and r2, r4, r0, lsr #12
	add r0, r0, r4, asr #20
	orr sb, r2, #0xff00000
	cmp r2, r1
	add r6, r6, r0
	orr sb, sb, #0x30000000
	movle r8, #0
	ble _020EDFFC
	ldr r0, _020EDEE0 ; =0x000BB67A
	cmp r2, r0
	movlt r8, #1
	addge r6, r6, #1
	subge sb, sb, #0x100000
	movge r8, #0
_020EDFFC:
	ldr r2, _020EDEE4 ; =_0210E94C
	ldr r0, [sp, #0x70]
	add r1, r2, r8, lsl #3
	ldr r3, [r1, #4]
	ldr r2, [r2, r8, lsl #3]
	mov r1, sb
	str sb, [sp, #0x74]
	bl _dsub
	ldr r2, _020EDEE4 ; =_0210E94C
	mov sl, r0
	add r3, r2, r8, lsl #3
	mov r4, r1
	ldr r0, [sp, #0x70]
	ldr r2, [r2, r8, lsl #3]
	ldr r3, [r3, #4]
	mov r1, sb
	bl _dadd
	mov r3, r1
	mov r2, r0
	ldr r1, _020EDEA0 ; =0x3FF00000
	mov r0, #0
	bl _ddiv
	str r1, [sp, #0x24]
	mov fp, r0
	ldr r3, [sp, #0x24]
	mov r0, sl
	mov r1, r4
	mov r2, fp
	bl _dmul
	mov r2, sb, asr #1
	orr r2, r2, #0x20000000
	mov sb, r1
	add r2, r2, #0x80000
	add r1, r2, r8, lsl #18
	ldr r2, _020EDEE4 ; =_0210E94C
	str r0, [sp, #0x28]
	add r3, r2, r8, lsl #3
	mov r0, #0
	ldr r2, [r2, r8, lsl #3]
	ldr r3, [r3, #4]
	str sb, [sp, #0x4c]
	str r1, [sp, #0x44]
	str r0, [sp, #0x48]
	str r0, [sp, #0x40]
	bl _dsub
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x70]
	ldr r1, [sp, #0x74]
	bl _dsub
	str r0, [sp, #0x2c]
	str r1, [sp, #0x1c]
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	mov r1, sb
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, sl
	mov r1, r4
	bl _dsub
	mov sl, r0
	mov r4, r1
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x1c]
	ldr r0, [sp, #0x48]
	mov r1, sb
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, sl
	mov r1, r4
	bl _dsub
	mov r3, r1
	mov r2, r0
	ldr r1, [sp, #0x24]
	mov r0, fp
	bl _dmul
	str r0, [sp, #0x30]
	ldr r0, [sp, #0x28]
	str r1, [sp, #0x14]
	mov r1, sb
	mov r2, r0
	mov r3, sb
	bl _dmul
	mov r4, r0
	mov sl, r1
	mov r2, r4
	mov r3, sl
	bl _dmul
	str r0, [sp, #0x34]
	mov fp, r1
	ldr r0, _020EDEE8 ; =0x4A454EEF
	ldr r1, _020EDEEC ; =0x3FCA7E28
	mov r2, r4
	mov r3, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDEF0 ; =0x93C9DB65
	ldr r1, _020EDEF4 ; =0x3FCD864A
	bl _dadd
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDEF8 ; =0xA91D4101
	ldr r1, _020EDEFC ; =0x3FD17460
	bl _dadd
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF00 ; =0x518F264D
	ldr r1, _020EDF04 ; =0x3FD55555
	bl _dadd
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF08 ; =0xDB6FABFF
	ldr r1, _020EDF0C ; =0x3FDB6DB6
	bl _dadd
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF10 ; =0x33333303
	ldr r1, _020EDF14 ; =0x3FE33333
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x34]
	mov r1, fp
	bl _dmul
	mov r4, r0
	mov sl, r1
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x28]
	mov r1, sb
	mov r3, sb
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x14]
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dadd
	mov r4, r0
	ldr r0, [sp, #0x48]
	mov sl, r1
	mov r1, sb
	mov r2, r0
	mov r3, r1
	bl _dmul
	str r1, [sp, #0xc]
	mov fp, r0
	ldr r1, _020EDF18 ; =0x40080000
	ldr r3, [sp, #0xc]
	mov r0, #0
	mov r2, fp
	bl _dadd
	mov r2, r4
	mov r3, sl
	bl _dadd
	mov r0, #0
	ldr r3, _020EDF18 ; =0x40080000
	mov r2, r0
	str r1, [sp, #0x44]
	str r0, [sp, #0x40]
	bl _dsub
	ldr r3, [sp, #0xc]
	mov r2, fp
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dsub
	str r0, [sp, #0x38]
	str r1, [sp, #4]
	ldr r0, [sp, #0x48]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	mov r1, sb
	bl _dmul
	mov r4, r0
	mov sl, r1
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x14]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl _dmul
	str r0, [sp, #0x3c]
	mov fp, r1
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #4]
	ldr r2, [sp, #0x28]
	mov r3, sb
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x3c]
	mov r1, fp
	bl _dadd
	mov sb, r0
	mov fp, r1
	mov r0, r4
	mov r1, sl
	mov r2, sb
	mov r3, fp
	bl _dadd
	mov r0, #0
	mov r2, r4
	mov r3, sl
	str r1, [sp, #0x6c]
	str r0, [sp, #0x68]
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, sb
	mov r1, fp
	bl _dsub
	mov sl, r1
	mov fp, r0
	ldr r1, _020EDF1C ; =0x3FEEC709
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	mov r0, #0xe0000000
	bl _dmul
	mov r4, r0
	mov sb, r1
	ldr r0, _020EDF20 ; =0x145B01F5
	ldr r1, _020EDF24 ; =0xBE3E2FE0
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	bl _dmul
	mov r2, fp
	mov r3, sl
	mov fp, r0
	mov sl, r1
	ldr r0, _020EDF28 ; =0xDC3A03FD
	ldr r1, _020EDF1C ; =0x3FEEC709
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, fp
	mov r1, sl
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF2C ; =_0210E95C
	add r1, r0, r8, lsl #3
	ldr r0, [r0, r8, lsl #3]
	ldr r1, [r1, #4]
	bl _dadd
	mov fp, r0
	mov sl, r1
	mov r0, r6
	bl _dflt
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	mov r0, r4
	mov r1, sb
	mov r2, fp
	mov r3, sl
	bl _dadd
	ldr r2, _020EDF30 ; =_0210E93C
	add r3, r2, r8, lsl #3
	ldr r2, [r2, r8, lsl #3]
	ldr r3, [r3, #4]
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dadd
	str r1, [sp, #0x5c]
	mov r0, #0
	str r0, [sp, #0x58]
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl _dsub
	ldr r2, _020EDF30 ; =_0210E93C
	add r3, r2, r8, lsl #3
	ldr r2, [r2, r8, lsl #3]
	ldr r3, [r3, #4]
	bl _dsub
	mov r2, r4
	mov r3, sb
	bl _dsub
	mov r2, r0
	mov r0, fp
	mov r3, r1
	mov r1, sl
	bl _dsub
	mov r4, r0
	mov r8, r1
_020EE4E8:
	sub r0, r5, #1
	ldr r1, [sp, #0xb4]
	orrs r0, r7, r0
	ldr r5, _020EDEA0 ; =0x3FF00000
	mov r2, #0
	ldr r0, [sp, #0xb0]
	mov r3, r1
	mov r6, #0
	subeq r5, r5, #0x80000000
	str r1, [sp, #0x64]
	str r2, [sp, #0x60]
	bl _dsub
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0x5c]
	bl _dmul
	mov r7, r0
	mov sb, r1
	ldr r0, [sp, #0xb0]
	ldr r1, [sp, #0xb4]
	mov r2, r4
	mov r3, r8
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, r7
	mov r1, sb
	bl _dadd
	mov r7, r0
	mov r8, r1
	ldr r0, [sp, #0x60]
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x58]
	ldr r3, [sp, #0x5c]
	bl _dmul
	mov r2, r0
	mov r3, r1
	mov r0, r7
	mov r1, r8
	str r2, [sp, #0x68]
	str r3, [sp, #0x6c]
	bl _dadd
	mov sb, r1
	ldr r2, _020EDF34 ; =0x40900000
	str r0, [sp, #0x78]
	str sb, [sp, #0x7c]
	cmp sb, r2
	blt _020EE674
	add r1, sb, #0xf700000
	add r1, r1, #0xb0000000
	orrs r0, r1, r0
	beq _020EE5F4
	ldr r0, _020EDF38 ; =0x8800759C
	ldr r1, _020EDF3C ; =0x7E37E43C
	mov r2, r6
	mov r3, r5
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF38 ; =0x8800759C
	ldr r1, _020EDF3C ; =0x7E37E43C
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EE5F4:
	ldr r0, _020EDED8 ; =0x652B82FE
	ldr r1, _020EDF40 ; =0x3C971547
	mov r2, r7
	mov r3, r8
	bl _dadd
	mov r4, r0
	mov sl, r1
	ldr r0, [sp, #0x78]
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	mov r1, sb
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sl
	bl _dgr
	bls _020EE728
	ldr r0, _020EDF38 ; =0x8800759C
	ldr r1, _020EDF3C ; =0x7E37E43C
	mov r2, r6
	mov r3, r5
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF38 ; =0x8800759C
	ldr r1, _020EDF3C ; =0x7E37E43C
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EE674:
	bic r3, sb, #0x80000000
	add r2, r2, #0xcc00
	cmp r3, r2
	blt _020EE728
	ldr r2, _020EDF44 ; =0x3F6F3400
	add r2, sb, r2
	orrs r2, r2, r0
	beq _020EE6CC
	ldr r0, _020EDF48 ; =0xC2F8F359
	ldr r1, _020EDF4C ; =0x01A56E1F
	mov r2, r6
	mov r3, r5
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF48 ; =0xC2F8F359
	ldr r1, _020EDF4C ; =0x01A56E1F
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EE6CC:
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r7
	mov r1, r8
	bl _dleq
	bhi _020EE728
	ldr r0, _020EDF48 ; =0xC2F8F359
	ldr r1, _020EDF4C ; =0x01A56E1F
	mov r2, r6
	mov r3, r5
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF48 ; =0xC2F8F359
	ldr r1, _020EDF4C ; =0x01A56E1F
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
_020EE728:
	ldr r0, _020EDEAC ; =0xFFFFFC01
	bic r3, sb, #0x80000000
	ldr r1, _020EDEB0 ; =0x3FE00000
	add r2, r0, r3, asr #20
	cmp r3, r1
	mov r4, #0
	ble _020EE7A4
	mov r1, #0x100000
	add r2, r2, #1
	add r2, sb, r1, asr r2
	bic r3, r2, #0x80000000
	add r0, r0, r3, asr #20
	sub r3, r1, #1
	mvn r3, r3, asr r0
	sub r1, r1, #1
	and r1, r2, r1
	and r2, r2, r3
	str r2, [sp, #0x54]
	str r4, [sp, #0x50]
	orr r1, r1, #0x100000
	rsb r0, r0, #0x14
	mov r4, r1, asr r0
	cmp sb, #0
	ldr r0, [sp, #0x68]
	ldr r1, [sp, #0x6c]
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	rsblt r4, r4, #0
	bl _dsub
	str r0, [sp, #0x68]
	str r1, [sp, #0x6c]
_020EE7A4:
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	mov r0, r7
	mov r1, r8
	bl _dadd
	mov r3, r1
	mov r0, #0
	ldr r1, _020EDF50 ; =0x3FE62E43
	mov r2, r0
	str r3, [sp, #0x54]
	str r0, [sp, #0x50]
	bl _dmul
	mov sb, r0
	mov sl, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	ldr r2, [sp, #0x68]
	ldr r3, [sp, #0x6c]
	bl _dsub
	mov r2, r0
	mov r0, r7
	mov r3, r1
	mov r1, r8
	bl _dsub
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF54 ; =0xFEFA39EF
	ldr r1, _020EDF58 ; =0x3FE62E42
	bl _dmul
	mov r7, r0
	mov r8, r1
	ldr r0, _020EDF5C ; =0x0CA86C39
	ldr r1, _020EDF60 ; =0xBE205C61
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r0, r7
	mov r3, r1
	mov r1, r8
	bl _dadd
	mov r7, r0
	mov r8, r1
	mov r0, sb
	mov r1, sl
	mov r2, r7
	mov r3, r8
	bl _dadd
	mov r2, sb
	mov r3, sl
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
	bl _dsub
	mov r2, r0
	mov r3, r1
	mov r0, r7
	mov r1, r8
	bl _dsub
	mov r8, r0
	mov sb, r1
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	mov r2, r0
	mov r3, r1
	bl _dmul
	mov r2, r0
	str r2, [sp, #0x50]
	mov r3, r1
	str r3, [sp, #0x54]
	ldr r0, _020EDF64 ; =0x72BEA4D0
	ldr r1, _020EDF68 ; =0x3E663769
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF6C ; =0xC5D26BF1
	ldr r1, _020EDF70 ; =0xBEBBBD41
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF74 ; =0xAF25DE2C
	ldr r1, _020EDF78 ; =0x3F11566A
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF7C ; =0x16BEBD93
	ldr r1, _020EDF80 ; =0xBF66C16C
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, _020EDF84 ; =0x5555553E
	ldr r1, _020EDF88 ; =0x3FC55555
	bl _dadd
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl _dmul
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	bl _dsub
	mov r2, r0
	str r2, [sp, #0x58]
	mov r3, r1
	str r3, [sp, #0x5c]
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	bl _dmul
	mov r7, r0
	mov sl, r1
	ldr r0, [sp, #0x58]
	ldr r1, [sp, #0x5c]
	mov r2, #0
	mov r3, #0x40000000
	bl _dsub
	mov r2, r0
	mov r0, r7
	mov r3, r1
	mov r1, sl
	bl _ddiv
	mov r7, r0
	mov sl, r1
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	mov r2, r8
	mov r3, sb
	bl _dmul
	mov r2, r0
	mov r0, r8
	mov r3, r1
	mov r1, sb
	bl _dadd
	mov r2, r0
	mov r0, r7
	mov r3, r1
	mov r1, sl
	bl _dsub
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	bl _dsub
	mov r3, r1
	mov r2, r0
	ldr r1, _020EDEA0 ; =0x3FF00000
	mov r0, #0
	bl _dsub
	add r3, r1, r4, lsl #20
	mov r2, r3, asr #0x14
	str r0, [sp, #0x78]
	cmp r2, #0
	str r1, [sp, #0x7c]
	addgt r0, sp, #0x78
	strgt r3, [r0, #4]
	bgt _020EEA58
	mov r2, r4
	bl scalbn
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
_020EEA58:
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	mov r0, r6
	mov r1, r5
	bl _dmul
	add sp, sp, #0x80
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	add sp, sp, #0x10
	bx lr
	arm_func_end __ieee754_pow

	arm_func_start copysign
copysign: ; 0x020EEA7C
	stmdb sp!, {r0, r1, r2, r3}
	ldr r1, [sp, #4]
	ldr r0, [sp, #0xc]
	bic r1, r1, #0x80000000
	and r0, r0, #0x80000000
	orr r1, r1, r0
	ldr r0, [sp]
	str r1, [sp, #4]
	add sp, sp, #0x10
	bx lr
	arm_func_end copysign

	arm_func_start fabs
fabs: ; 0x020EEAA4
	stmdb sp!, {r0, r1, r2, r3}
	add r2, sp, #0
	ldr r1, [r2, #4]
	ldr r0, [sp]
	bic r1, r1, #0x80000000
	str r1, [r2, #4]
	add sp, sp, #0x10
	bx lr
	arm_func_end fabs

	arm_func_start frexp
frexp: ; 0x020EEAC4
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	ldr r1, [sp, #0xc]
	ldr r0, _020EEB70 ; =0x7FF00000
	mov r4, r2
	bic r3, r1, #0x80000000
	mov r2, #0
	str r2, [r4]
	cmp r3, r0
	ldr r0, [sp, #8]
	bge _020EEAF8
	orrs r0, r3, r0
	bne _020EEB0C
_020EEAF8:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EEB0C:
	cmp r3, #0x100000
	bge _020EEB38
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r3, _020EEB74 ; =0x43500000
	bl _dmul
	mvn r2, #0x35
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	str r2, [r4]
	bic r3, r1, #0x80000000
_020EEB38:
	ldr r2, _020EEB78 ; =0x800FFFFF
	ldr r0, _020EEB7C ; =0xFFFFFC02
	and r1, r1, r2
	orr r1, r1, #0xfe00000
	orr r1, r1, #0x30000000
	ldr r2, [r4]
	add r0, r0, r3, asr #20
	add r2, r2, r0
	ldr r0, [sp, #8]
	str r2, [r4]
	str r1, [sp, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020EEB70: .word 0x7FF00000
_020EEB74: .word 0x43500000
_020EEB78: .word 0x800FFFFF
_020EEB7C: .word 0xFFFFFC02
	arm_func_end frexp

	arm_func_start ldexp
ldexp: ; 0x020EEB80
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r4, lr}
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r4, r2
	bl __fpclassifyd
	cmp r0, #2
	ble _020EEBB8
	mov r0, #0
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	mov r1, r0
	bl _deq
	bne _020EEBCC
_020EEBB8:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EEBCC:
	ldr r3, [sp, #0xc]
	ldr r0, _020EEDA0 ; =0x7FF00000
	ldr r1, [sp, #8]
	and r0, r3, r0
	movs ip, r0, asr #0x14
	bne _020EEC58
	bic r0, r3, #0x80000000
	orrs r0, r1, r0
	ldreq r0, [sp, #8]
	ldreq r1, [sp, #0xc]
	ldmeqia sp!, {r4, lr}
	addeq sp, sp, #0x10
	bxeq lr
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r3, _020EEDA4 ; =0x43500000
	mov r2, #0
	bl _dmul
	mov r3, r1
	ldr r1, _020EEDA0 ; =0x7FF00000
	ldr ip, _020EEDA8 ; =0xFFFF3CB0
	and r1, r3, r1
	mov r2, r0
	mov r0, r1, asr #0x14
	str r2, [sp, #8]
	str r3, [sp, #0xc]
	cmp r4, ip
	sub ip, r0, #0x36
	bge _020EEC58
	ldr r0, _020EEDAC ; =0xC2F8F359
	ldr r1, _020EEDB0 ; =0x01A56E1F
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EEC58:
	ldr r0, _020EEDB4 ; =0x000007FF
	cmp ip, r0
	bne _020EEC84
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r2, r0
	mov r3, r1
	bl _dadd
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EEC84:
	add r2, ip, r4
	sub r0, r0, #1
	cmp r2, r0
	ble _020EECC8
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r0, _020EEDB8 ; =0x8800759C
	ldr r1, _020EEDBC ; =0x7E37E43C
	bl copysign
	mov r2, r0
	mov r3, r1
	ldr r0, _020EEDB8 ; =0x8800759C
	ldr r1, _020EEDBC ; =0x7E37E43C
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EECC8:
	cmp r2, #0
	ble _020EECF0
	ldr r1, _020EEDC0 ; =0x800FFFFF
	ldr r0, [sp, #8]
	and r1, r3, r1
	orr r1, r1, r2, lsl #20
	str r1, [sp, #0xc]
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EECF0:
	mvn r0, #0x35
	cmp r2, r0
	bgt _020EED70
	ldr r0, _020EEDC4 ; =0x0000C350
	cmp r4, r0
	ble _020EED3C
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r0, _020EEDB8 ; =0x8800759C
	ldr r1, _020EEDBC ; =0x7E37E43C
	bl copysign
	mov r2, r0
	mov r3, r1
	ldr r0, _020EEDB8 ; =0x8800759C
	ldr r1, _020EEDBC ; =0x7E37E43C
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EED3C:
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	ldr r0, _020EEDAC ; =0xC2F8F359
	ldr r1, _020EEDB0 ; =0x01A56E1F
	bl copysign
	mov r2, r0
	mov r3, r1
	ldr r0, _020EEDAC ; =0xC2F8F359
	ldr r1, _020EEDB0 ; =0x01A56E1F
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
_020EED70:
	ldr r0, _020EEDC0 ; =0x800FFFFF
	add r1, r2, #0x36
	and r0, r3, r0
	orr r3, r0, r1, lsl #20
	ldr r2, [sp, #8]
	ldr r1, _020EEDC8 ; =0x3C900000
	mov r0, #0
	str r3, [sp, #0xc]
	bl _dmul
	ldmia sp!, {r4, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020EEDA0: .word 0x7FF00000
_020EEDA4: .word 0x43500000
_020EEDA8: .word 0xFFFF3CB0
_020EEDAC: .word 0xC2F8F359
_020EEDB0: .word 0x01A56E1F
_020EEDB4: .word 0x000007FF
_020EEDB8: .word 0x8800759C
_020EEDBC: .word 0x7E37E43C
_020EEDC0: .word 0x800FFFFF
_020EEDC4: .word 0x0000C350
_020EEDC8: .word 0x3C900000
	arm_func_end ldexp

	arm_func_start pow
pow: ; 0x020EEDCC
	ldr ip, _020EEDD4 ; =__ieee754_pow
	bx ip
	.align 2, 0
_020EEDD4: .word __ieee754_pow
	arm_func_end pow

	arm_func_start __must_round
__must_round: ; 0x020EEDD8
	add r3, r0, #5
	ldrb r2, [r3, r1]
	add ip, r3, r1
	cmp r2, #5
	movhi r0, #1
	bxhi lr
	mvnlo r0, #0
	bxlo lr
	ldrb r2, [r0, #4]
	add ip, ip, #1
	add r3, r3, r2
	cmp ip, r3
	bhs _020EEE28
_020EEE0C:
	ldrb r2, [ip]
	cmp r2, #0
	movne r0, #1
	bxne lr
	add ip, ip, #1
	cmp ip, r3
	blo _020EEE0C
_020EEE28:
	sub r1, r1, #1
	add r0, r0, r1
	ldrb r0, [r0, #5]
	tst r0, #1
	movne r0, #1
	mvneq r0, #0
	bx lr
	arm_func_end __must_round

	arm_func_start __dorounddecup
__dorounddecup: ; 0x020EEE44
	add r3, r0, #5
	add r1, r3, r1
	sub ip, r1, #1
	mov r1, #0
_020EEE54:
	ldrb r2, [ip]
	cmp r2, #9
	addlo r0, r2, #1
	strlob r0, [ip]
	bxlo lr
	cmp ip, r3
	bne _020EEE88
	mov r1, #1
	strb r1, [ip]
	ldrsh r1, [r0, #2]
	add r1, r1, #1
	strh r1, [r0, #2]
	bx lr
_020EEE88:
	strb r1, [ip], #-1
	b _020EEE54
	bx lr
	arm_func_end __dorounddecup

	arm_func_start __rounddec
__rounddec: ; 0x020EEE94
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r1
	mov r5, r0
	cmp r4, #0
	ldmleia sp!, {r3, r4, r5, pc}
	ldrb r2, [r5, #4]
	cmp r4, r2
	ldmgeia sp!, {r3, r4, r5, pc}
	bl __must_round
	strb r4, [r5, #4]
	cmp r0, #0
	ldmltia sp!, {r3, r4, r5, pc}
	mov r0, r5
	mov r1, r4
	bl __dorounddecup
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __rounddec

	arm_func_start __ull2dec
__ull2dec: ; 0x020EEED4
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	mov sl, r0
	mov r0, #0
	mov r8, r2
	strb r0, [sl]
	mov sb, r1
	cmp r8, #0
	strb r0, [sl, #4]
	cmpeq sb, #0
	beq _020EEF60
	mov r6, #0xa
	mov fp, r0
	mov r5, r0
	mov r4, r0
_020EEF0C:
	ldrb r1, [sl, #4]
	mov r0, sb
	mov r2, r6
	add r3, r1, #1
	mov r7, r1
	strb r3, [sl, #4]
	mov r1, r8
	mov r3, fp
	bl _ull_mod
	add r1, sl, r7
	strb r0, [r1, #5]
	mov r0, sb
	mov r1, r8
	mov r2, #0xa
	mov r3, #0
	bl _ll_udiv
	mov r8, r1
	mov sb, r0
	cmp r8, r5
	cmpeq sb, r4
	bne _020EEF0C
_020EEF60:
	ldrb r0, [sl, #4]
	add r2, sl, #5
	add r0, r2, r0
	sub r3, r0, #1
	cmp r2, r3
	bhs _020EEF90
_020EEF78:
	ldrb r0, [r3]
	ldrb r1, [r2]
	strb r0, [r2], #1
	strb r1, [r3], #-1
	cmp r2, r3
	blo _020EEF78
_020EEF90:
	ldrb r0, [sl, #4]
	sub r0, r0, #1
	strh r0, [sl, #2]
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end __ull2dec

	arm_func_start __timesdec
__timesdec: ; 0x020EEFA0
	stmdb sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0x40
	ldrb r6, [r1, #4]
	ldrb r5, [r2, #4]
	mov r4, #0
	add r3, sp, #0
	add r5, r6, r5
	sub r5, r5, #1
	add r3, r3, r5
	add r6, r3, #1
	mov r7, r6
	strb r4, [r0]
	cmp r5, #0
	ble _020EF068
	add lr, r1, #5
	add fp, r2, #5
_020EEFE0:
	ldrb r3, [r2, #4]
	sub sl, r3, #1
	sub r3, r5, sl
	subs sb, r3, #1
	ldrb r3, [r1, #4]
	movmi sb, #0
	submi sl, r5, #1
	add r8, sl, #1
	sub r3, r3, sb
	cmp r8, r3
	movgt r8, r3
	add sl, fp, sl
	add sb, lr, sb
	cmp r8, #0
	ble _020EF034
_020EF01C:
	ldrb ip, [sb], #1
	ldrb r3, [sl], #-1
	sub r8, r8, #1
	cmp r8, #0
	mla r4, ip, r3, r4
	bgt _020EF01C
_020EF034:
	ldr r3, _020EF120 ; =0xCCCCCCCD
	sub r5, r5, #1
	umull r8, sb, r4, r3
	mov sb, sb, lsr #3
	cmp r5, #0
	mov sl, #0xa
	umull r8, sb, sl, sb
	sub sb, r4, r8
	strb sb, [r6, #-1]!
	mov r8, r4
	umull r3, r4, r8, r3
	mov r4, r4, lsr #3
	bgt _020EEFE0
_020EF068:
	ldrsh r3, [r1, #2]
	ldrsh r1, [r2, #2]
	cmp r4, #0
	add r1, r3, r1
	strh r1, [r0, #2]
	beq _020EF090
	strb r4, [r6, #-1]!
	ldrsh r1, [r0, #2]
	add r1, r1, #1
	strh r1, [r0, #2]
_020EF090:
	mov r3, #0
	b _020EF0A8
_020EF098:
	ldrb r2, [r6], #1
	add r1, r0, r3
	add r3, r3, #1
	strb r2, [r1, #5]
_020EF0A8:
	cmp r3, #0x20
	bge _020EF0B8
	cmp r6, r7
	blo _020EF098
_020EF0B8:
	cmp r6, r7
	addhs sp, sp, #0x40
	strb r3, [r0, #4]
	ldmhsia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	ldrb r1, [r6]
	cmp r1, #5
	addlo sp, sp, #0x40
	ldmloia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	bne _020EF110
	add r2, r6, #1
	cmp r2, r7
	bhs _020EF100
_020EF0E8:
	ldrb r1, [r2]
	cmp r1, #0
	bne _020EF110
	add r2, r2, #1
	cmp r2, r7
	blo _020EF0E8
_020EF100:
	ldrb r1, [r6, #-1]
	tst r1, #1
	addeq sp, sp, #0x40
	ldmeqia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EF110:
	ldrb r1, [r0, #4]
	bl __dorounddecup
	add sp, sp, #0x40
	ldmia sp!, {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020EF120: .word 0xCCCCCCCD
	arm_func_end __timesdec

	arm_func_start __str2dec
__str2dec: ; 0x020EF124
	stmdb sp!, {r3, lr}
	strh r2, [r0, #2]
	mov ip, #0
	strb ip, [r0]
	b _020EF14C
_020EF138:
	ldrsb r3, [r1], #1
	add r2, r0, ip
	add ip, ip, #1
	sub r3, r3, #0x30
	strb r3, [r2, #5]
_020EF14C:
	cmp ip, #0x20
	bge _020EF160
	ldrsb r2, [r1]
	cmp r2, #0
	bne _020EF138
_020EF160:
	strb ip, [r0, #4]
	ldrsb r2, [r1]
	cmp r2, #0
	ldmeqia sp!, {r3, pc}
	cmp r2, #5
	ldmltia sp!, {r3, pc}
	bgt _020EF1B4
	ldrsb r2, [r1, #1]
	add r1, r1, #1
	cmp r2, #0
	beq _020EF1A0
_020EF18C:
	cmp r2, #0x30
	bne _020EF1B4
	ldrsb r2, [r1, #1]!
	cmp r2, #0
	bne _020EF18C
_020EF1A0:
	sub r1, ip, #1
	add r1, r0, r1
	ldrb r1, [r1, #5]
	tst r1, #1
	ldmeqia sp!, {r3, pc}
_020EF1B4:
	ldrb r1, [r0, #4]
	bl __dorounddecup
	ldmia sp!, {r3, pc}
	arm_func_end __str2dec

	arm_func_start __two_exp
__two_exp: ; 0x020EF1C0
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x4c
	mov r4, r1
	mvn r2, #0x34
	mov r5, r0
	cmp r4, r2
	bgt _020EF1F0
	bge _020EF2BC
	sub r0, r2, #0xb
	cmp r4, r0
	beq _020EF2A4
	b _020EF44C
_020EF1F0:
	add r1, r4, #0x20
	cmp r1, #0x28
	addls pc, pc, r1, lsl #2
	b _020EF44C
_020EF200: ; jump table
	b _020EF2D0 ; case 0
	b _020EF44C ; case 1
	b _020EF44C ; case 2
	b _020EF44C ; case 3
	b _020EF44C ; case 4
	b _020EF44C ; case 5
	b _020EF44C ; case 6
	b _020EF44C ; case 7
	b _020EF44C ; case 8
	b _020EF44C ; case 9
	b _020EF44C ; case 10
	b _020EF44C ; case 11
	b _020EF44C ; case 12
	b _020EF44C ; case 13
	b _020EF44C ; case 14
	b _020EF44C ; case 15
	b _020EF2E4 ; case 16
	b _020EF44C ; case 17
	b _020EF44C ; case 18
	b _020EF44C ; case 19
	b _020EF44C ; case 20
	b _020EF44C ; case 21
	b _020EF44C ; case 22
	b _020EF44C ; case 23
	b _020EF2F8 ; case 24
	b _020EF30C ; case 25
	b _020EF320 ; case 26
	b _020EF334 ; case 27
	b _020EF348 ; case 28
	b _020EF35C ; case 29
	b _020EF370 ; case 30
	b _020EF384 ; case 31
	b _020EF398 ; case 32
	b _020EF3AC ; case 33
	b _020EF3C0 ; case 34
	b _020EF3D4 ; case 35
	b _020EF3E8 ; case 36
	b _020EF3FC ; case 37
	b _020EF410 ; case 38
	b _020EF424 ; case 39
	b _020EF438 ; case 40
_020EF2A4:
	ldr r1, _020EF4F0 ; =_02111408
	mov r0, r5
	mvn r2, #0x13
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF2BC:
	ldr r1, _020EF4F4 ; =_02111438
	add r2, r2, #0x25
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF2D0:
	ldr r1, _020EF4F8 ; =_02111460
	add r2, r2, #0x2b
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF2E4:
	ldr r1, _020EF4FC ; =_02111478
	add r2, r2, #0x30
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF2F8:
	ldr r1, _020EF500 ; =_02111488
	add r2, r2, #0x32
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF30C:
	ldr r1, _020EF504 ; =_02111490
	add r2, r2, #0x32
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF320:
	ldr r1, _020EF508 ; =_02111498
	add r2, r2, #0x33
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF334:
	ldr r1, _020EF50C ; =_021114A0
	add r2, r2, #0x33
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF348:
	ldr r1, _020EF510 ; =_021114A8
	add r2, r2, #0x33
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF35C:
	ldr r1, _020EF514 ; =_021114AC
	add r2, r2, #0x34
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF370:
	ldr r1, _020EF518 ; =_021114B0
	add r2, r2, #0x34
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF384:
	ldr r1, _020EF51C ; =_021114B4
	add r2, r2, #0x34
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF398:
	ldr r1, _020EF520 ; =_021114B8
	mov r2, #0
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF3AC:
	ldr r1, _020EF524 ; =_021114BC
	mov r2, #0
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF3C0:
	ldr r1, _020EF528 ; =_021114C0
	mov r2, #0
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF3D4:
	ldr r1, _020EF52C ; =_021114C4
	mov r2, #0
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF3E8:
	ldr r1, _020EF530 ; =_021114C8
	mov r2, #1
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF3FC:
	ldr r1, _020EF534 ; =_021114CC
	mov r2, #1
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF410:
	ldr r1, _020EF538 ; =_021114D0
	mov r2, #1
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF424:
	ldr r1, _020EF53C ; =_021114D4
	mov r2, #2
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF438:
	ldr r1, _020EF540 ; =_021114D8
	mov r2, #2
	bl __str2dec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
_020EF44C:
	and r0, r4, #0x80000000
	add r1, r4, r0, lsr #31
	add r0, sp, #0x26
	mov r1, r1, asr #1
	bl __two_exp
	add r1, sp, #0x26
	mov r0, r5
	mov r2, r1
	bl __timesdec
	tst r4, #1
	addeq sp, sp, #0x4c
	ldmeqia sp!, {r4, r5, pc}
	add r3, sp, #0
	mov ip, r5
	mov r2, #9
_020EF488:
	ldrh r1, [ip]
	ldrh r0, [ip, #2]
	add ip, ip, #4
	subs r2, r2, #1
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	bne _020EF488
	ldrh r0, [ip]
	cmp r4, #0
	strh r0, [r3]
	add r0, sp, #0x26
	ble _020EF4CC
	ldr r1, _020EF524 ; =_021114BC
	mov r2, #0
	bl __str2dec
	b _020EF4D8
_020EF4CC:
	ldr r1, _020EF51C ; =_021114B4
	mvn r2, #0
	bl __str2dec
_020EF4D8:
	add r1, sp, #0
	add r2, sp, #0x26
	mov r0, r5
	bl __timesdec
	add sp, sp, #0x4c
	ldmia sp!, {r4, r5, pc}
	.align 2, 0
_020EF4F0: .word _02111408
_020EF4F4: .word _02111438
_020EF4F8: .word _02111460
_020EF4FC: .word _02111478
_020EF500: .word _02111488
_020EF504: .word _02111490
_020EF508: .word _02111498
_020EF50C: .word _021114A0
_020EF510: .word _021114A8
_020EF514: .word _021114AC
_020EF518: .word _021114B0
_020EF51C: .word _021114B4
_020EF520: .word _021114B8
_020EF524: .word _021114BC
_020EF528: .word _021114C0
_020EF52C: .word _021114C4
_020EF530: .word _021114C8
_020EF534: .word _021114CC
_020EF538: .word _021114D0
_020EF53C: .word _021114D4
_020EF540: .word _021114D8
	arm_func_end __two_exp

	arm_func_start __equals_dec
__equals_dec: ; 0x020EF544
	stmdb sp!, {r4, lr}
	ldrb r3, [r0, #5]
	cmp r3, #0
	bne _020EF568
	ldrb r0, [r1, #5]
	cmp r0, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, pc}
_020EF568:
	ldrb r2, [r1, #5]
	cmp r2, #0
	bne _020EF584
	cmp r3, #0
	moveq r0, #1
	movne r0, #0
	ldmia sp!, {r4, pc}
_020EF584:
	ldrsh r3, [r0, #2]
	ldrsh r2, [r1, #2]
	cmp r3, r2
	bne _020EF61C
	ldrb r4, [r0, #4]
	ldrb r2, [r1, #4]
	mov ip, #0
	mov lr, r4
	cmp r4, r2
	movgt lr, r2
	cmp lr, #0
	ble _020EF5DC
_020EF5B4:
	add r3, r0, ip
	add r2, r1, ip
	ldrb r3, [r3, #5]
	ldrb r2, [r2, #5]
	cmp r3, r2
	movne r0, #0
	ldmneia sp!, {r4, pc}
	add ip, ip, #1
	cmp ip, lr
	blt _020EF5B4
_020EF5DC:
	cmp lr, r4
	moveq r0, r1
	ldrb r1, [r0, #4]
	cmp ip, r1
	bge _020EF614
_020EF5F0:
	add r1, r0, ip
	ldrb r1, [r1, #5]
	cmp r1, #0
	movne r0, #0
	ldmneia sp!, {r4, pc}
	ldrb r1, [r0, #4]
	add ip, ip, #1
	cmp ip, r1
	blt _020EF5F0
_020EF614:
	mov r0, #1
	ldmia sp!, {r4, pc}
_020EF61C:
	mov r0, #0
	ldmia sp!, {r4, pc}
	arm_func_end __equals_dec

	arm_func_start __less_dec
__less_dec: ; 0x020EF624
	stmdb sp!, {r3, r4, r5, lr}
	ldrb r2, [r0, #5]
	cmp r2, #0
	bne _020EF648
	ldrb r0, [r1, #5]
	cmp r0, #0
	movne r0, #1
	moveq r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020EF648:
	ldrb r2, [r1, #5]
	cmp r2, #0
	moveq r0, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	ldrsh r3, [r1, #2]
	ldrsh r2, [r0, #2]
	cmp r2, r3
	bne _020EF6F8
	ldrb r5, [r0, #4]
	ldrb r4, [r1, #4]
	mov ip, #0
	mov lr, r5
	cmp r5, r4
	movgt lr, r4
	cmp lr, #0
	ble _020EF6BC
_020EF688:
	add r3, r1, ip
	add r2, r0, ip
	ldrb r3, [r3, #5]
	ldrb r2, [r2, #5]
	cmp r2, r3
	movlo r0, #1
	ldmloia sp!, {r3, r4, r5, pc}
	cmp r3, r2
	movlo r0, #0
	ldmloia sp!, {r3, r4, r5, pc}
	add ip, ip, #1
	cmp ip, lr
	blt _020EF688
_020EF6BC:
	cmp lr, r5
	bne _020EF6F0
	cmp ip, r4
	bge _020EF6F0
_020EF6CC:
	add r0, r1, ip
	ldrb r0, [r0, #5]
	cmp r0, #0
	movne r0, #1
	ldmneia sp!, {r3, r4, r5, pc}
	ldrb r0, [r1, #4]
	add ip, ip, #1
	cmp ip, r0
	blt _020EF6CC
_020EF6F0:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, pc}
_020EF6F8:
	movlt r0, #1
	movge r0, #0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __less_dec

	arm_func_start __minus_dec
__minus_dec: ; 0x020EF704
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r0
	mov r5, #9
_020EF710:
	ldrh r4, [r1]
	ldrh r3, [r1, #2]
	add r1, r1, #4
	subs r5, r5, #1
	strh r4, [r6]
	strh r3, [r6, #2]
	add r6, r6, #4
	bne _020EF710
	ldrh r1, [r1]
	strh r1, [r6]
	ldrb r1, [r2, #5]
	cmp r1, #0
	ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
	ldrb r7, [r0, #4]
	ldrb r3, [r2, #4]
	ldrsh r4, [r0, #2]
	mov r1, r7
	cmp r7, r3
	movlt r1, r3
	ldrsh r3, [r2, #2]
	sub r6, r4, r3
	add r1, r1, r6
	cmp r1, #0x20
	movgt r1, #0x20
	cmp r7, r1
	bge _020EF79C
	mov r4, #0
_020EF77C:
	ldrb r5, [r0, #4]
	add r3, r0, r7
	add r5, r5, #1
	strb r5, [r0, #4]
	strb r4, [r3, #5]
	ldrb r7, [r0, #4]
	cmp r7, r1
	blt _020EF77C
_020EF79C:
	ldrb r4, [r2, #4]
	add r3, r0, #5
	add ip, r3, r1
	add r4, r4, r6
	cmp r4, r1
	addlt ip, r3, r4
	sub r4, ip, r3
	add r1, r2, #5
	sub r4, r4, r6
	add lr, r1, r4
	mov r4, lr
	b _020EF830
_020EF7CC:
	ldrb r7, [ip, #-1]!
	ldrb r5, [lr, #-1]!
	cmp r7, r5
	bhs _020EF820
	ldrb r7, [ip, #-1]
	sub r5, ip, #1
	cmp r7, #0
	bne _020EF7F8
_020EF7EC:
	ldrb r7, [r5, #-1]!
	cmp r7, #0
	beq _020EF7EC
_020EF7F8:
	cmp r5, ip
	beq _020EF820
_020EF800:
	ldrb r7, [r5]
	sub r7, r7, #1
	strb r7, [r5]
	ldrb r7, [r5, #1]!
	cmp r5, ip
	add r7, r7, #0xa
	strb r7, [r5]
	bne _020EF800
_020EF820:
	ldrb r7, [ip]
	ldrb r5, [lr]
	sub r5, r7, r5
	strb r5, [ip]
_020EF830:
	cmp ip, r3
	cmphi lr, r1
	bhi _020EF7CC
	ldrb r5, [r2, #4]
	sub lr, r4, r1
	cmp lr, r5
	bge _020EF90C
	ldrb r1, [r4]
	mov r7, #0
	cmp r1, #5
	movlo r7, #1
	blo _020EF8A8
	bne _020EF8A8
	add r1, r2, #5
	add r2, r1, r5
	add r4, r4, #1
	cmp r4, r2
	bhs _020EF890
_020EF878:
	ldrb r1, [r4]
	cmp r1, #0
	bne _020EF90C
	add r4, r4, #1
	cmp r4, r2
	blo _020EF878
_020EF890:
	add r1, r3, lr
	add r2, r1, r6
	ldrb r1, [r2, #-1]
	sub ip, r2, #1
	tst r1, #1
	movne r7, #1
_020EF8A8:
	cmp r7, #0
	beq _020EF90C
	ldrb r1, [ip]
	cmp r1, #1
	bhs _020EF900
	ldrb r1, [ip, #-1]
	sub r2, ip, #1
	cmp r1, #0
	bne _020EF8D8
_020EF8CC:
	ldrb r1, [r2, #-1]!
	cmp r1, #0
	beq _020EF8CC
_020EF8D8:
	cmp r2, ip
	beq _020EF900
_020EF8E0:
	ldrb r1, [r2]
	sub r1, r1, #1
	strb r1, [r2]
	ldrb r1, [r2, #1]!
	cmp r2, ip
	add r1, r1, #0xa
	strb r1, [r2]
	bne _020EF8E0
_020EF900:
	ldrb r1, [ip]
	sub r1, r1, #1
	strb r1, [ip]
_020EF90C:
	ldrb r1, [r3]
	mov r5, r3
	cmp r1, #0
	bne _020EF928
_020EF91C:
	ldrb r1, [r5, #1]!
	cmp r1, #0
	beq _020EF91C
_020EF928:
	cmp r5, r3
	bls _020EF970
	ldrsh r1, [r0, #2]
	sub r2, r5, r3
	and r4, r2, #0xff
	sub r1, r1, r4
	strh r1, [r0, #2]
	ldrb r1, [r0, #4]
	add r2, r3, r1
	cmp r5, r2
	bhs _020EF964
_020EF954:
	ldrb r1, [r5], #1
	cmp r5, r2
	strb r1, [r3], #1
	blo _020EF954
_020EF964:
	ldrb r1, [r0, #4]
	sub r1, r1, r4
	strb r1, [r0, #4]
_020EF970:
	ldrb r1, [r0, #4]
	add r2, r0, #5
	add r3, r2, r1
	cmp r3, r2
	bls _020EF998
_020EF984:
	ldrb r1, [r3, #-1]!
	cmp r1, #0
	bne _020EF998
	cmp r3, r2
	bhi _020EF984
_020EF998:
	sub r1, r3, r2
	add r1, r1, #1
	strb r1, [r0, #4]
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end __minus_dec

	arm_func_start __num2dec_internal
__num2dec_internal: ; 0x020EF9A8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #0x58
	mov r8, r1
	mov r6, r2
	mov r7, r0
	mov r0, r8
	mov r1, r6
	bl __signbitd
	cmp r0, #0
	movne r1, #1
	moveq r1, #0
	mov r4, r1, lsl #0x18
	mov r0, #0
	mov r1, r0
	mov r2, r8
	mov r3, r6
	mov r5, r4, asr #0x18
	bl _deq
	bne _020EFA14
	strb r5, [r7]
	mov r1, #0
	strh r1, [r7, #2]
	mov r0, #1
	strb r0, [r7, #4]
	add sp, sp, #0x58
	strb r1, [r7, #5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020EFA14:
	mov r0, r8
	mov r1, r6
	bl __fpclassifyd
	cmp r0, #2
	bgt _020EFA60
	strb r5, [r7]
	mov r2, #0
	strh r2, [r7, #2]
	mov r2, #1
	mov r0, r8
	mov r1, r6
	strb r2, [r7, #4]
	bl __fpclassifyd
	cmp r0, #1
	moveq r0, #0x4e
	movne r0, #0x49
	add sp, sp, #0x58
	strb r0, [r7, #5]
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
_020EFA60:
	cmp r5, #0
	beq _020EFA84
	mov r0, #0
	mov r1, r0
	mov r2, r8
	mov r3, r6
	bl _dsub
	mov r8, r0
	mov r6, r1
_020EFA84:
	add r2, sp, #8
	mov r0, r8
	mov r1, r6
	bl frexp
	mov r4, r0
	mov r6, r1
	orr ip, r4, #0
	rsbs r2, ip, #0
	orr r3, r6, #0x100000
	rsc r1, r3, #0
	mov r0, #0
	and r3, r3, r1
	sub r1, r0, #1
	and ip, ip, r2
	mov r2, r1
	adds r0, ip, r1
	adc r1, r3, r2
	str r4, [sp]
	str r6, [sp, #4]
	bl __msl_generic_count_bits64
	rsb r8, r0, #0x35
	ldr r1, [sp, #8]
	add r0, sp, #0xc
	sub r1, r1, r8
	bl __two_exp
	mov r0, r4
	mov r1, r6
	mov r2, r8
	bl ldexp
	bl _ll_ufrom_d
	mov r2, r1
	mov r1, r0
	add r0, sp, #0x32
	bl __ull2dec
	mov r0, r7
	add r1, sp, #0x32
	add r2, sp, #0xc
	bl __timesdec
	strb r5, [r7]
	add sp, sp, #0x58
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end __num2dec_internal

	arm_func_start __num2dec
__num2dec: ; 0x020EFB28
	stmdb sp!, {r3, r4, r5, lr}
	mov r4, r3
	ldrsh r5, [r0, #2]
	mov r0, r4
	bl __num2dec_internal
	ldrb r0, [r4, #5]
	cmp r0, #9
	ldmhiia sp!, {r3, r4, r5, pc}
	cmp r5, #0x20
	movgt r5, #0x20
	mov r0, r4
	mov r1, r5
	bl __rounddec
	ldrb r0, [r4, #4]
	cmp r0, r5
	bge _020EFB8C
	mov r1, #0
_020EFB6C:
	ldrb r2, [r4, #4]
	add r0, r4, r0
	add r2, r2, #1
	strb r2, [r4, #4]
	strb r1, [r0, #5]
	ldrb r0, [r4, #4]
	cmp r0, r5
	blt _020EFB6C
_020EFB8C:
	ldrsh r1, [r4, #2]
	sub r0, r0, #1
	mov r2, #0
	sub r0, r1, r0
	strh r0, [r4, #2]
	ldrb r0, [r4, #4]
	cmp r0, #0
	ldmleia sp!, {r3, r4, r5, pc}
_020EFBAC:
	add r1, r4, r2
	ldrb r0, [r1, #5]
	add r2, r2, #1
	add r0, r0, #0x30
	strb r0, [r1, #5]
	ldrb r0, [r4, #4]
	cmp r2, r0
	blt _020EFBAC
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end __num2dec

	arm_func_start __dec2num
__dec2num: ; 0x020EFBD0
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xfc
	mov r4, r0
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _020EFC10
	ldrsb r0, [r4]
	mov r2, #0
	cmp r0, #0
	ldreq r3, _020F01D4 ; =0x3FF00000
	mov r0, #0
	ldrne r3, _020F01D8 ; =0xBFF00000
	mov r1, r0
	bl copysign
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EFC10:
	ldrb r0, [r4, #5]
	cmp r0, #0x30
	beq _020EFC30
	cmp r0, #0x49
	beq _020EFC58
	cmp r0, #0x4e
	beq _020EFC8C
	b _020EFCD4
_020EFC30:
	ldrsb r0, [r4]
	mov r2, #0
	cmp r0, #0
	ldreq r3, _020F01D4 ; =0x3FF00000
	mov r0, #0
	ldrne r3, _020F01D8 ; =0xBFF00000
	mov r1, r0
	bl copysign
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EFC58:
	ldrsb r0, [r4]
	mov r5, #0
	cmp r0, #0
	ldreq r4, _020F01D4 ; =0x3FF00000
	ldr r0, _020F01DC ; =_021110E8
	ldrne r4, _020F01D8 ; =0xBFF00000
	ldr r0, [r0]
	bl _f2d
	mov r2, r5
	mov r3, r4
	bl copysign
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EFC8C:
	ldr r1, _020F01E0 ; =0x7FF00000
	add r3, sp, #0x10
	mov r2, #0
	str r2, [r3]
	str r1, [r3, #4]
	ldrsb r0, [r4]
	cmp r0, #0
	beq _020EFCBC
	orr r0, r1, #0x80000000
	orr r1, r2, r2
	str r1, [r3]
	str r0, [r3, #4]
_020EFCBC:
	ldmia r3, {r0, r1}
	orr r0, r0, #0
	orr r1, r1, #0x80000
	stmia r3, {r0, r1}
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EFCD4:
	add r3, sp, #0xd6
	mov r5, r4
	mov r2, #9
_020EFCE0:
	ldrh r1, [r5]
	ldrh r0, [r5, #2]
	add r5, r5, #4
	subs r2, r2, #1
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	bne _020EFCE0
	ldrh r0, [r5]
	add r1, sp, #0xdb
	strh r0, [r3]
	ldrb r0, [sp, #0xda]
	add r5, r1, r0
	cmp r1, r5
	bhs _020EFD30
_020EFD1C:
	ldrb r0, [r1]
	sub r0, r0, #0x30
	strb r0, [r1], #1
	cmp r1, r5
	blo _020EFD1C
_020EFD30:
	ldrb r1, [sp, #0xda]
	ldrsh r2, [sp, #0xd8]
	add r0, sp, #0xb0
	sub r1, r1, #1
	add r1, r2, r1
	strh r1, [sp, #0xd8]
	ldr r1, _020F01E4 ; =_021114DC
	mov r2, #0x134
	ldrsh fp, [sp, #0xd8]
	bl __str2dec
	add r0, sp, #0xb0
	add r1, sp, #0xd6
	bl __less_dec
	cmp r0, #0
	beq _020EFDA0
	ldrsb r0, [r4]
	mov r5, #0
	cmp r0, #0
	ldreq r4, _020F01D4 ; =0x3FF00000
	ldr r0, _020F01DC ; =_021110E8
	ldrne r4, _020F01D8 ; =0xBFF00000
	ldr r0, [r0]
	bl _f2d
	mov r2, r5
	mov r3, r4
	bl copysign
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
_020EFDA0:
	add r1, sp, #0xdb
	ldrb r0, [r1]
	add r8, r1, #1
	bl _dfltu
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	cmp r8, r5
	bhs _020EFE78
_020EFDC0:
	sub r0, r5, r8
	mov r1, r0, lsr #0x1f
	rsb r0, r1, r0, lsl #29
	adds r7, r1, r0, ror #29
	moveq r7, #8
	mov r6, #0
	mov r2, #0
	cmp r7, #0
	ble _020EFDFC
	mov r0, #0xa
_020EFDE8:
	ldrb r1, [r8], #1
	add r2, r2, #1
	cmp r2, r7
	mla r6, r0, r6, r1
	blt _020EFDE8
_020EFDFC:
	ldr r0, _020F01E8 ; =_021113C8
	ldr r1, [sp, #0xc]
	add r3, r0, r7, lsl #3
	ldr r2, [r3, #-8]
	ldr r0, [sp, #8]
	ldr r3, [r3, #-4]
	bl _dmul
	mov r4, r0
	mov sb, r1
	mov r0, r6
	bl _dfltu
	mov r2, r0
	mov r3, r1
	mov r0, r4
	mov r1, sb
	bl _dadd
	cmp r6, #0
	mov r6, r0
	mov sl, r1
	beq _020EFE64
	mov r0, r4
	mov r1, sb
	mov r2, r6
	mov r3, sl
	bl _deq
	beq _020EFE78
_020EFE64:
	str r6, [sp, #8]
	str sl, [sp, #0xc]
	cmp r8, r5
	sub fp, fp, r7
	blo _020EFDC0
_020EFE78:
	cmp fp, #0
	bge _020EFEBC
	rsb r0, fp, #0
	bl _dflt
	mov r3, r1
	mov r2, r0
	ldr r1, _020F01EC ; =0x40140000
	mov r0, #0
	bl pow
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl _ddiv
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	b _020EFEF4
_020EFEBC:
	mov r0, fp
	bl _dflt
	mov r3, r1
	mov r2, r0
	ldr r1, _020F01EC ; =0x40140000
	mov r0, #0
	bl pow
	mov r2, r0
	mov r3, r1
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	bl _dmul
	str r0, [sp, #8]
	str r1, [sp, #0xc]
_020EFEF4:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	mov r2, fp
	bl ldexp
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	bl __fpclassifyd
	cmp r0, #2
	bne _020EFF28
	ldr r0, _020F01F0 ; =0x7FEFFFFF
	mvn r1, #0
	str r1, [sp, #8]
	str r0, [sp, #0xc]
_020EFF28:
	ldr r1, [sp, #8]
	ldr r2, [sp, #0xc]
	add r0, sp, #0x8a
	add r4, sp, #0
	mov r5, #0
	bl __num2dec_internal
	add r0, sp, #0x8a
	add r1, sp, #0xd6
	bl __equals_dec
	cmp r0, #0
	bne _020F019C
	add r0, sp, #0x8a
	add r1, sp, #0xd6
	bl __less_dec
	cmp r0, #0
	movne r5, #1
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r5, #0
	moveq r6, #1
	str r1, [sp]
	str r0, [sp, #4]
	movne r6, #0
_020EFF84:
	cmp r6, #0
	bne _020EFFAC
	ldmia r4, {r0, r1}
	adds r0, r0, #1
	adc r1, r1, #0
	stmia r4, {r0, r1}
	bl __fpclassifyd
	cmp r0, #2
	beq _020F019C
	b _020EFFC4
_020EFFAC:
	ldr r1, [r4]
	ldr r0, [r4, #4]
	subs r1, r1, #1
	sbc r0, r0, #0
	str r1, [r4]
	str r0, [r4, #4]
_020EFFC4:
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, sp, #0x64
	bl __num2dec_internal
	cmp r5, #0
	beq _020EFFF0
	add r0, sp, #0x64
	add r1, sp, #0xd6
	bl __less_dec
	cmp r0, #0
	beq _020F0114
_020EFFF0:
	cmp r5, #0
	bne _020F00CC
	add r0, sp, #0xd6
	add r1, sp, #0x64
	bl __less_dec
	cmp r0, #0
	bne _020F00CC
	add r3, sp, #0x8a
	add r5, sp, #0x3e
	mov r2, #9
_020F0018:
	ldrh r1, [r3]
	ldrh r0, [r3, #2]
	add r3, r3, #4
	strh r1, [r5]
	strh r0, [r5, #2]
	add r5, r5, #4
	subs r2, r2, #1
	bne _020F0018
	ldrh r0, [r3]
	add r3, sp, #0x64
	add r4, sp, #0x8a
	strh r0, [r5]
	mov r2, #9
_020F004C:
	ldrh r1, [r3]
	ldrh r0, [r3, #2]
	add r3, r3, #4
	strh r1, [r4]
	strh r0, [r4, #2]
	add r4, r4, #4
	subs r2, r2, #1
	bne _020F004C
	ldrh r0, [r3]
	add r3, sp, #0x3e
	add r5, sp, #0x64
	strh r0, [r4]
	mov r2, #9
_020F0080:
	ldrh r1, [r3]
	ldrh r0, [r3, #2]
	add r3, r3, #4
	strh r1, [r5]
	strh r0, [r5, #2]
	add r5, r5, #4
	subs r2, r2, #1
	bne _020F0080
	ldrh r4, [r3]
	ldr r3, [sp, #8]
	ldr r1, [sp]
	ldr r2, [sp, #0xc]
	ldr r0, [sp, #4]
	strh r4, [r5]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	str r3, [sp]
	str r2, [sp, #4]
	b _020F0114
_020F00CC:
	add r7, sp, #0x64
	add r3, sp, #0x8a
	mov r2, #9
_020F00D8:
	ldrh r1, [r7]
	ldrh r0, [r7, #2]
	add r7, r7, #4
	strh r1, [r3]
	strh r0, [r3, #2]
	add r3, r3, #4
	subs r2, r2, #1
	bne _020F00D8
	ldrh r2, [r7]
	ldr r1, [sp]
	ldr r0, [sp, #4]
	strh r2, [r3]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	b _020EFF84
_020F0114:
	add r0, sp, #0x3e
	add r1, sp, #0xd6
	add r2, sp, #0x8a
	bl __minus_dec
	add r0, sp, #0x18
	add r1, sp, #0x64
	add r2, sp, #0xd6
	bl __minus_dec
	add r0, sp, #0x3e
	add r1, sp, #0x18
	bl __equals_dec
	cmp r0, #0
	beq _020F0178
	ldr r1, [sp, #8]
	ldr r0, [sp, #0xc]
	and r1, r1, #1
	and r0, r0, #0
	cmp r0, #0
	cmpeq r1, #0
	beq _020F019C
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	b _020F019C
_020F0178:
	add r0, sp, #0x3e
	add r1, sp, #0x18
	bl __less_dec
	cmp r0, #0
	bne _020F019C
	ldr r1, [sp]
	ldr r0, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
_020F019C:
	ldrsb r0, [sp, #0xd6]
	cmp r0, #0
	beq _020F01C4
	mov r0, #0
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	mov r1, r0
	bl _dsub
	str r0, [sp, #8]
	str r1, [sp, #0xc]
_020F01C4:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	add sp, sp, #0xfc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	.align 2, 0
_020F01D4: .word 0x3FF00000
_020F01D8: .word 0xBFF00000
_020F01DC: .word _021110E8
_020F01E0: .word 0x7FF00000
_020F01E4: .word _021114DC
_020F01E8: .word _021113C8
_020F01EC: .word 0x40140000
_020F01F0: .word 0x7FEFFFFF
	arm_func_end __dec2num

	arm_func_start __msl_generic_count_bits64
__msl_generic_count_bits64: ; 0x020F01F4
	mov r3, r0, lsr #1
	ldr r2, _020F027C ; =0x55555555
	orr r3, r3, r1, lsl #31
	and r3, r3, r2
	subs ip, r0, r3
	and r2, r2, r1, lsr #1
	ldr r0, _020F0280 ; =0x33333333
	sbc r3, r1, r2
	mov r1, ip, lsr #2
	orr r1, r1, r3, lsl #30
	and r2, ip, r0
	and r1, r1, r0
	adds r2, r2, r1
	and r1, r3, r0
	and r0, r0, r3, lsr #2
	adc r1, r1, r0
	mov r0, r2, lsr #4
	orr r0, r0, r1, lsl #28
	adds r2, r2, r0
	ldr r0, _020F0284 ; =0x0F0F0F0F
	adc r1, r1, r1, lsr #4
	and r3, r2, r0
	and r2, r1, r0
	mov r0, r3, lsr #8
	orr r0, r0, r2, lsl #24
	adds r1, r3, r0
	adc r2, r2, r2, lsr #8
	mov r0, r1, lsr #0x10
	orr r0, r0, r2, lsl #16
	adds r1, r1, r0
	adc r0, r2, r2, lsr #16
	adds r0, r1, r0
	and r0, r0, #0xff
	bx lr
	.align 2, 0
_020F027C: .word 0x55555555
_020F0280: .word 0x33333333
_020F0284: .word 0x0F0F0F0F
	arm_func_end __msl_generic_count_bits64

	arm_func_start __signbitd
__signbitd: ; 0x020F0288
	stmdb sp!, {r0, r1, r2, r3}
	ldr r0, [sp, #4]
	and r0, r0, #0x80000000
	add sp, sp, #0x10
	bx lr
	arm_func_end __signbitd

	arm_func_start __fpclassifyd
__fpclassifyd: ; 0x020F029C
	stmdb sp!, {r0, r1, r2, r3}
	ldr r2, [sp, #4]
	ldr r0, _020F0304 ; =0x7FF00000
	ands r1, r2, r0
	beq _020F02D8
	cmp r1, r0
	bne _020F02F8
	ldr r0, _020F0308 ; =0x000FFFFF
	tst r2, r0
	ldreq r0, [sp]
	add sp, sp, #0x10
	cmpeq r0, #0
	movne r0, #1
	moveq r0, #2
	bx lr
_020F02D8:
	ldr r0, _020F0308 ; =0x000FFFFF
	tst r2, r0
	ldreq r0, [sp]
	add sp, sp, #0x10
	cmpeq r0, #0
	movne r0, #5
	moveq r0, #3
	bx lr
_020F02F8:
	mov r0, #4
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020F0304: .word 0x7FF00000
_020F0308: .word 0x000FFFFF
	arm_func_end __fpclassifyd

	arm_func_start scalbn
scalbn: ; 0x020F030C
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	mov r4, r2
	add r2, sp, #0
	bl frexp
	ldr r2, [sp]
	add r2, r2, r4
	str r2, [sp]
	bl ldexp
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end scalbn

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

	; MSL_Extras_NITRO_Ai_LE.a

	arm_func_start stricmp
stricmp: ; 0x020F0368
	stmdb sp!, {r3, lr}
	ldr r3, _020F03CC ; =_0210E404
_020F0370:
	ldrb r2, [r0], #1
	cmp r2, #0
	blt _020F0388
	cmp r2, #0x80
	bge _020F0388
	ldrb r2, [r3, r2]
_020F0388:
	ldrb lr, [r1], #1
	and ip, r2, #0xff
	cmp lr, #0
	blt _020F03A4
	cmp lr, #0x80
	bge _020F03A4
	ldrb lr, [r3, lr]
_020F03A4:
	and r2, lr, #0xff
	cmp ip, r2
	mvnlo r0, #0
	ldmloia sp!, {r3, pc}
	movhi r0, #1
	ldmhiia sp!, {r3, pc}
	cmp ip, #0
	bne _020F0370
	mov r0, #0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020F03CC: .word _0210E404
	arm_func_end stricmp

	arm_func_start strnicmp
strnicmp: ; 0x020F03D0
	ldr ip, _020F03D8 ; =stricmp
	bx ip
	.align 2, 0
_020F03D8: .word stricmp
	arm_func_end strnicmp

	; MSL_CPP_NITRO_Ai_LE.a

	arm_func_start _ZNSt9exceptionD2Ev
_ZNSt9exceptionD2Ev: ; 0x020F03DC
	bx lr
	arm_func_end _ZNSt9exceptionD2Ev

	arm_func_start _ZNSt3tr110shared_ptrIcEC1IcNSt6detail14default_deleteIA0_cEEEEPT_T0_
_ZNSt3tr110shared_ptrIcEC1IcNSt6detail14default_deleteIA0_cEEEEPT_T0_: ; 0x020F03E0
	stmdb sp!, {r0, r1, r2, r3}
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #8
	mov r5, r0
	mov r4, r1
	str r4, [r5]
	add r1, sp, #0x20
	mov r0, #0x10
	str r4, [sp]
	str r1, [sp, #4]
	bl _Znwm
	cmp r0, #0
	beq _020F0430
	ldr r1, _020F0458 ; =_02111540
	mov r2, #1
	stmia r0, {r1, r2}
	ldr r1, _020F045C ; =_02111558
	str r2, [r0, #8]
	str r1, [r0]
	str r4, [r0, #0xc]
_020F0430:
	str r0, [r5, #4]
	mov r1, #0
	add r0, sp, #0
	str r1, [sp]
	bl _ZN10Metrowerks8move_ptrIcRNSt6detail14default_deleteIA0_cEEED1Ev
	mov r0, r5
	add sp, sp, #8
	ldmia sp!, {r3, r4, r5, lr}
	add sp, sp, #0x10
	bx lr
	.align 2, 0
_020F0458: .word _02111540
_020F045C: .word _02111558
	arm_func_end _ZNSt3tr110shared_ptrIcEC1IcNSt6detail14default_deleteIA0_cEEEEPT_T0_

	arm_func_start _ZNSt9exceptionD0Ev
_ZNSt9exceptionD0Ev: ; 0x020F0460
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt9exceptionD0Ev

	arm_func_start _ZNSt9exceptionD1Ev
_ZNSt9exceptionD1Ev: ; 0x020F0474
	bx lr
	arm_func_end _ZNSt9exceptionD1Ev

	arm_func_start _ZNKSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE11get_deleterERKSt9type_info
_ZNKSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE11get_deleterERKSt9type_info: ; 0x020F0478
	stmdb sp!, {r4, lr}
	mov r4, r0
	mov r0, r1
	ldr r1, _020F049C ; =_02111514
	bl _ZNKSt9type_infoeqERKS_
	cmp r0, #0
	addne r0, r4, #0xc
	moveq r0, #0
	ldmia sp!, {r4, pc}
	.align 2, 0
_020F049C: .word _02111514
	arm_func_end _ZNKSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE11get_deleterERKSt9type_info

	arm_func_start _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE7disposeEv
_ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE7disposeEv: ; 0x020F04A0
	ldr ip, _020F04AC ; =_ZdaPv
	ldr r0, [r0, #0xc]
	bx ip
	.align 2, 0
_020F04AC: .word _ZdaPv
	arm_func_end _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE7disposeEv

	arm_func_start _ZNSt3tr110shared_ptrIcED1Ev
_ZNSt3tr110shared_ptrIcED1Ev: ; 0x020F04B0
	stmdb sp!, {r3, r4, fp, lr}
	sub sp, sp, #0x18
	mov fp, sp
	mov r4, r0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _020F04D0
	bl _ZNSt3tr16detail25shared_ptr_deleter_common7releaseEv
_020F04D0:
	add sp, fp, #0x18
	mov r0, r4
	ldmia sp!, {r3, r4, fp, pc}
_020F04DC: ; 0x020F04DC
	add r0, fp, #0
	bl __unexpected
_020F04E4:
	b _020F04E4
_020F04E8: ; 0x020F04E8
	add sp, fp, #0x18
	ldmia sp!, {r3, r4, fp, pc}
	arm_func_end _ZNSt3tr110shared_ptrIcED1Ev

	arm_func_start _ZN10Metrowerks8move_ptrIcRNSt6detail14default_deleteIA0_cEEED1Ev
_ZN10Metrowerks8move_ptrIcRNSt6detail14default_deleteIA0_cEEED1Ev: ; 0x020F04F0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r0, [r4]
	cmp r0, #0
	beq _020F0508
	bl _ZdaPv
_020F0508:
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZN10Metrowerks8move_ptrIcRNSt6detail14default_deleteIA0_cEEED1Ev

	arm_func_start _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED0Ev
_ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED0Ev: ; 0x020F0510
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED0Ev

	arm_func_start _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED1Ev
_ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED1Ev: ; 0x020F0524
	bx lr
	arm_func_end _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED1Ev

	arm_func_start _ZNSt3tr16detail25shared_ptr_deleter_commonD2Ev
_ZNSt3tr16detail25shared_ptr_deleter_commonD2Ev: ; 0x020F0528
	ldr r0, [r0, #4]
	bx lr
	arm_func_end _ZNSt3tr16detail25shared_ptr_deleter_commonD2Ev

	arm_func_start _ZNSt11logic_errorD1Ev
_ZNSt11logic_errorD1Ev: ; 0x020F0530
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #4
	bl _ZNSt3tr110shared_ptrIcED1Ev
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt11logic_errorD1Ev

	arm_func_start _ZNSt11logic_errorD0Ev
_ZNSt11logic_errorD0Ev: ; 0x020F0548
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #4
	bl _ZNSt3tr110shared_ptrIcED1Ev
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt11logic_errorD0Ev

	arm_func_start _ZNSt12length_errorD1Ev
_ZNSt12length_errorD1Ev: ; 0x020F0568
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #4
	bl _ZNSt3tr110shared_ptrIcED1Ev
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt12length_errorD1Ev

	arm_func_start _ZNSt12length_errorD0Ev
_ZNSt12length_errorD0Ev: ; 0x020F0580
	stmdb sp!, {r4, lr}
	mov r4, r0
	add r0, r4, #4
	bl _ZNSt3tr110shared_ptrIcED1Ev
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt12length_errorD0Ev

	arm_func_start _ZNSt3tr16detail25shared_ptr_deleter_common7releaseEv
_ZNSt3tr16detail25shared_ptr_deleter_common7releaseEv: ; 0x020F05A0
	stmdb sp!, {r4, lr}
	mov r4, r0
	ldr r1, [r4, #4]
	subs r1, r1, #1
	str r1, [r4, #4]
	ldmneia sp!, {r4, pc}
	ldr r1, [r0]
	ldr r1, [r1, #0xc]
	blx r1
	mov r0, r4
	bl _ZNSt3tr16detail25shared_ptr_deleter_common12release_weakEv
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt3tr16detail25shared_ptr_deleter_common7releaseEv

	arm_func_start _ZNSt3tr16detail25shared_ptr_deleter_common12release_weakEv
_ZNSt3tr16detail25shared_ptr_deleter_common12release_weakEv: ; 0x020F05D0
	stmdb sp!, {r3, lr}
	ldr r1, [r0, #8]
	subs r1, r1, #1
	str r1, [r0, #8]
	ldmneia sp!, {r3, pc}
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r1, [r0]
	ldr r1, [r1, #4]
	blx r1
	ldmia sp!, {r3, pc}
	arm_func_end _ZNSt3tr16detail25shared_ptr_deleter_common12release_weakEv

	arm_func_start _ZNSt15__vector_commonILb1EE18throw_length_errorEv
_ZNSt15__vector_commonILb1EE18throw_length_errorEv: ; 0x020F05FC
	stmdb sp!, {r4, r5, r6, lr}
	sub sp, sp, #0x10
	ldr r4, _020F0678 ; =_02111664
	ldr r1, _020F067C ; =_02111658
	add r6, sp, #4
	mov r0, r4
	str r1, [sp, #4]
	add r5, sp, #8
	bl strlen
	add r0, r0, #1
	rsb r0, r0, r0, lsl #1
	bl _Znam
	mov r1, #0
	strb r1, [sp]
	sub r2, sp, #4
	strb r1, [r2]
	mov r1, r0
	ldr r2, [r2]
	mov r0, r5
	bl _ZNSt3tr110shared_ptrIcEC1IcNSt6detail14default_deleteIA0_cEEEEPT_T0_
	ldr r0, [r5]
	mov r1, r4
	bl strcpy
	ldr r3, _020F0680 ; =_02111644
	ldr r0, _020F0684 ; =_02111678
	ldr r2, _020F0688 ; =_ZNSt12length_errorD1Ev
	mov r1, r6
	str r3, [sp, #4]
	bl __throw
	add sp, sp, #0x10
	ldmia sp!, {r4, r5, r6, pc}
	.align 2, 0
_020F0678: .word _02111664
_020F067C: .word _02111658
_020F0680: .word _02111644
_020F0684: .word _02111678
_020F0688: .word _ZNSt12length_errorD1Ev
	arm_func_end _ZNSt15__vector_commonILb1EE18throw_length_errorEv

	; FP_fastI_v5t_LE.a

	.public _dadd
	.type _dadd, @function
	.public _d_add
	.type _d_add, @function
_dadd: ; 0x020F068C
_d_add:
	stmdb sp!, {r4, lr}
	eors ip, r1, r3
	eormi r3, r3, #0x80000000
	bmi __dsub_start
__dadd_start:
	subs ip, r0, r2
	sbcs lr, r1, r3
	bhs _020F06B8
	adds r2, r2, ip
	adc r3, r3, lr
	subs r0, r0, ip
	sbc r1, r1, lr
_020F06B8:
	mov lr, #0x80000000
	mov ip, r1, lsr #0x14
	orr r1, lr, r1, lsl #11
	orr r1, r1, r0, lsr #21
	mov r0, r0, lsl #0xb
	movs r4, ip, lsl #0x15
	cmnne r4, #0x200000
	beq _020F07B4
	mov r4, r3, lsr #0x14
	orr r3, lr, r3, lsl #11
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs lr, r4, lsl #0x15
	beq _020F07FC
_020F06F0:
	subs r4, ip, r4
	beq _020F0748
	cmp r4, #0x20
	ble _020F072C
	cmp r4, #0x38
	movge r4, #0x3f
	sub r4, r4, #0x20
	rsb lr, r4, #0x20
	orrs lr, r2, r3, lsl lr
	mov r2, r3, lsr r4
	orrne r2, r2, #1
	adds r0, r0, r2
	adcs r1, r1, #0
	blo _020F0770
	b _020F0754
_020F072C:
	rsb lr, r4, #0x20
	movs lr, r2, lsl lr
	rsb lr, r4, #0x20
	mov r2, r2, lsr r4
	orr r2, r2, r3, lsl lr
	mov r3, r3, lsr r4
	orrne r2, r2, #1
_020F0748:
	adds r0, r0, r2
	adcs r1, r1, r3
	blo _020F0770
_020F0754:
	add ip, ip, #1
	and r4, r0, #1
	movs r1, r1, rrx
	orr r0, r4, r0, rrx
	mov lr, ip, lsl #0x15
	cmn lr, #0x200000
	beq _020F0980
_020F0770:
	movs r2, r0, lsl #0x15
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	mov r1, r1, lsr #0xc
	orr r1, r1, ip, lsl #20
	tst r2, #0x80000000
	ldmeqia sp!, {r4, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, lr}
	bxeq lr
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, lr}
	bx lr
_020F07B4:
	cmp ip, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	bics ip, ip, #0x800
	beq _020F0820
	orrs r4, r0, r1, lsl #1
	bne _020F095C
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r4, r4, lsl #0x15
	beq _020F0948
	cmn r4, #0x200000
	bne _020F0948
	orrs r4, r2, r3, lsl #1
	beq _020F0948
	b _020F095C
_020F07FC:
	cmp r4, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	bic ip, ip, #0x800
	bics r4, r4, #0x800
	beq _020F088C
	orrs r4, r2, r3, lsl #1
	bne _020F095C
	b _020F0948
_020F0820:
	orrs r4, r0, r1, lsl #1
	beq _020F0860
	mov ip, #1
	bic r1, r1, #0x80000000
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r4, r4, lsl #0x15
	cmnne r4, #0x200000
	mov r4, r4, lsr #0x15
	orr r4, r4, lr, lsr #20
	beq _020F07FC
	orr r3, r3, #0x80000000
	orr ip, ip, lr, lsr #20
	b _020F06F0
_020F0860:
	mov ip, r3, lsr #0x14
	mov r1, r3, lsl #0xb
	orr r1, r1, r2, lsr #21
	mov r0, r2, lsl #0xb
	movs r4, ip, lsl #0x15
	beq _020F0914
	cmn r4, #0x200000
	bne _020F0914
	orrs r4, r0, r1, lsl #1
	beq _020F0948
	b _020F0960
_020F088C:
	orrs r4, r2, r3, lsl #1
	beq _020F0924
	mov r4, #1
	bic r3, r3, #0x80000000
	cmp r1, #0
	bpl _020F08B0
	orr ip, ip, lr, lsr #20
	orr r4, r4, lr, lsr #20
	b _020F06F0
_020F08B0:
	adds r0, r0, r2
	adcs r1, r1, r3
	blo _020F08D0
	add ip, ip, #1
	and r4, r0, #1
	movs r1, r1, rrx
	mov r0, r0, rrx
	orr r0, r0, r4
_020F08D0:
	cmp r1, #0
	subges ip, ip, #1
	movs r2, r0, lsl #0x15
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmeqia sp!, {r4, lr}
	bxeq lr
	tst r2, #0x80000000
	ldmeqia sp!, {r4, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, lr}
	bxeq lr
_020F0914:
	mov r1, r3
	mov r0, r2
	ldmia sp!, {r4, lr}
	bx lr
_020F0924:
	cmp r1, #0
	subges ip, ip, #1
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmia sp!, {r4, lr}
	bx lr
_020F0948:
	ldr r1, _020F09A0 ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
_020F095C:
	mov r1, r3
_020F0960:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, lr}
	bx lr
_020F0970: ; 0x020F0970
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, lr}
	bx lr
_020F0980:
	cmp ip, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	ldr r1, _020F09A0 ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020F09A0: .word 0x7FF00000

	.public _d2f
	.type _d2f, @function
	.public _d_dtof
	.type _d_dtof, @function
    .public _f_qtof
    .type _f_qtof, @function
_d2f: ; 0x020F09A4
_d_dtof:
_f_qtof:
	and r2, r1, #0x80000000
	mov ip, r1, lsr #0x14
	bics ip, ip, #0x800
	beq _020F0A1C
	mov r3, ip, lsl #0x15
	cmn r3, #0x200000
	bhs _020F0A00
	subs ip, ip, #0x380
	bls _020F0A2C
	cmp ip, #0xff
	bge _020F0A9C
	mov r1, r1, lsl #0xc
	orr r3, r2, r1, lsr #9
	orr r3, r3, r0, lsr #29
	movs r1, r0, lsl #3
	orr r0, r3, ip, lsl #23
	bxeq lr
	tst r1, #0x80000000
	bxeq lr
	movs r1, r1, lsl #1
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F0A00:
	orrs r3, r0, r1, lsl #12
	bne _020F0A14
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_020F0A14:
	mvn r0, #0x80000000
	bx lr
_020F0A1C:
	orrs r3, r0, r1, lsl #12
	bne __f_underflow
__f_result_zero:
	mov r0, r2
	bx lr
_020F0A2C:
	cmn ip, #0x17
	beq _020F0A80
	bmi __f_underflow
	mov r1, r1, lsl #0xb
	orr r1, r1, #0x80000000
	mov r3, r1, lsr #8
	orr r3, r3, r0, lsr #29
	rsb ip, ip, #1
	movs r1, r0, lsl #3
	orr r0, r2, r3, lsr ip
	rsb ip, ip, #0x20
	mov r3, r3, lsl ip
	orrne r3, r3, #1
	movs r1, r3
	bxeq lr
	tst r1, #0x80000000
	bxeq lr
	movs r1, r1, lsl #1
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F0A80:
	orr r0, r0, r1, lsl #12
__f_very_tiny_result:
	movs r1, r0
	mov r0, r2
	addne r0, r0, #1
	bx lr
__f_underflow:
	mov r0, r2
	bx lr
_020F0A9C:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr

	.public _dfix
	.type _dfix, @function
	.public _d_dtoi
	.type _d_dtoi, @function
_dfix: ; 0x020F0AA8
_d_dtoi:
	bic r3, r1, #0x80000000
	ldr r2, _020F0AF0 ; =0x0000041E
	subs r2, r2, r3, lsr #20
	ble _020F0AE4
	cmp r2, #0x20
	bge _020F0ADC
	mov r3, r1, lsl #0xb
	orr r3, r3, #0x80000000
	orr r3, r3, r0, lsr #21
	cmp r1, #0
	mov r0, r3, lsr r2
	rsbmi r0, r0, #0
	bx lr
_020F0ADC:
	mov r0, #0
	bx lr
_020F0AE4:
	mvn r0, r1, asr #31
	add r0, r0, #0x80000000
	bx lr
	.align 2, 0
_020F0AF0: .word 0x0000041E

	.public _dfixu
	.type _dfixu, @function
	.public _d_dtou
	.type _d_dtou, @function
_dfixu: ; 0x020F0AF4
_d_dtou:
	tst r1, #0x80000000
	bne _020F0B2C
	ldr r2, _020F0B48 ; =0x0000041E
	subs r2, r2, r1, lsr #20
	blt _020F0B40
	cmp r2, #0x20
	bge _020F0B24
	mov r3, r1, lsl #0xb
	orr r3, r3, #0x80000000
	orr r3, r3, r0, lsr #21
	mov r0, r3, lsr r2
	bx lr
_020F0B24:
	mov r0, #0
	bx lr
_020F0B2C:
	cmn r1, #0x100000
	cmpeq r0, #0
	movls r0, #0
	mvnhi r0, #0
	bx lr
_020F0B40:
	mvn r0, #0
	bx lr
	.align 2, 0
_020F0B48: .word 0x0000041E

	.public _ll_ufrom_d
	.type _ll_ufrom_d, @function
	.public _d_dtoull
	.type _d_dtoull, @function
_ll_ufrom_d: ; 0x020F0B4C
_d_dtoull:
	tst r1, #0x80000000
	bne _020F0BB0
	ldr r2, _020F0BD4 ; =0x0000043E
	subs r2, r2, r1, lsr #20
	blt _020F0BC8
	cmp r2, #0x40
	bge _020F0BA4
	mov ip, r1, lsl #0xb
	orr ip, ip, #0x80000000
	orr ip, ip, r0, lsr #21
	cmp r2, #0x20
	ble _020F0B8C
	sub r2, r2, #0x20
	mov r1, #0
	mov r0, ip, lsr r2
	bx lr
_020F0B8C:
	mov r3, r0, lsl #0xb
	mov r1, ip, lsr r2
	mov r0, r3, lsr r2
	rsb r2, r2, #0x20
	orr r0, r0, ip, lsl r2
	bx lr
_020F0BA4:
	mov r1, #0
	mov r0, #0
	bx lr
_020F0BB0:
	cmn r1, #0x100000
	cmpeq r0, #0
	bhi _020F0BC8
	mov r1, #0
	mov r0, #0
	bx lr
_020F0BC8:
	mvn r1, #0
	mvn r0, #0
	bx lr
	.align 2, 0
_020F0BD4: .word 0x0000043E

	.public _dflt
	.type _dflt, @function
	.public _d_itod
	.type _d_itod, @function
_dflt: ; 0x020F0BD8
_d_itod:
	ands r2, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r0, #0
__d_itod_common:
	mov r1, #0
	bxeq lr
	mov r3, #0x400
	add r3, r3, #0x1e
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
	movs r1, r0
	mov r0, r1, lsl #0x15
	add r1, r1, r1
	orr r1, r2, r1, lsr #12
	orr r1, r1, r3, lsl #20
	bx lr

	.public _dfltu
	.type _dfltu, @function
	.public _d_utod
	.type _d_utod, @function
_dfltu: ; 0x020F0C18
_d_utod:
	cmp r0, #0
__d_utod_common:
	mov r1, #0
	bxeq lr
	mov r3, #0x400
	add r3, r3, #0x1e
	bmi _020F0C3C
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
_020F0C3C:
	mov r1, r0
	mov r0, r1, lsl #0x15
	add r1, r1, r1
	mov r1, r1, lsr #0xc
	orr r1, r1, r3, lsl #20
	bx lr

	.public _dmul
	.type _dmul, @function
	.public _d_mul
	.type _d_mul, @function
_dmul: ; 0x020F0C54
_d_mul:
	stmdb sp!, {r4, r5, r6, r7, lr}
	eor lr, r1, r3
	and lr, lr, #0x80000000
	mov ip, r1, lsr #0x14
	mov r1, r1, lsl #0xb
	orr r1, r1, r0, lsr #21
	mov r0, r0, lsl #0xb
	movs r6, ip, lsl #0x15
	cmnne r6, #0x200000
	beq _020F0D5C
	orr r1, r1, #0x80000000
	bic ip, ip, #0x800
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r5, r4, lsl #0x15
	cmnne r5, #0x200000
	beq _020F0DA4
	orr r3, r3, #0x80000000
	bic r4, r4, #0x800
_020F0CA8:
	add ip, r4, ip
	umull r5, r4, r0, r2
	umull r7, r6, r0, r3
	adds r4, r7, r4
	adc r6, r6, #0
	umull r7, r0, r1, r2
	adds r4, r7, r4
	adcs r0, r0, r6
	umull r7, r2, r1, r3
	adc r1, r2, #0
	adds r0, r0, r7
	adc r1, r1, #0
	orrs r4, r4, r5
	orrne r0, r0, #1
	cmp r1, #0
	blt _020F0CF4
	sub ip, ip, #1
	adds r0, r0, r0
	adc r1, r1, r1
_020F0CF4:
	add ip, ip, #2
	subs ip, ip, #0x400
	bmi _020F0E90
	beq _020F0E90
	mov r6, ip, lsl #0x14
	cmn r6, #0x100000
	bmi _020F0F90
	movs r2, r0, lsl #0x15
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	tst r2, #0x80000000
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0D5C:
	bics ip, ip, #0x800
	beq _020F0DB8
	orrs r6, r0, r1, lsl #1
	bne _020F0F44
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r5, r4, lsl #0x15
	beq _020F0D98
	cmn r5, #0x200000
	bne _020F0F30
	orrs r5, r2, r3, lsl #1
	beq _020F0F30
	b _020F0F44
_020F0D98:
	orrs r5, r3, r2
	beq _020F0F58
	b _020F0F30
_020F0DA4:
	bics r4, r4, #0x800
	beq _020F0E4C
	orrs r6, r2, r3, lsl #1
	bne _020F0F44
	b _020F0F30
_020F0DB8:
	orrs r6, r0, r1, lsl #1
	beq _020F0E20
	mov ip, #1
	cmp r1, #0
	bne _020F0DDC
	sub ip, ip, #0x20
	movs r1, r0
	mov r0, #0
	bmi _020F0DF8
_020F0DDC:
	clz r6, r1
	movs r1, r1, lsl r6
	rsb r6, r6, #0x20
	orr r1, r1, r0, lsr r6
	rsb r6, r6, #0x20
	mov r0, r0, lsl r6
	sub ip, ip, r6
_020F0DF8:
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r5, r4, lsl #0x15
	cmnne r5, #0x200000
	beq _020F0DA4
	orr r3, r3, #0x80000000
	bic r4, r4, #0x800
	b _020F0CA8
_020F0E20:
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r5, r4, lsl #0x15
	beq _020F0FA4
	cmn r5, #0x200000
	bne _020F0FA4
	orrs r6, r2, r3, lsl #1
	beq _020F0F58
	b _020F0F44
_020F0E4C:
	orrs r5, r2, r3, lsl #1
	beq _020F0FA4
	mov r4, #1
	cmp r3, #0
	bne _020F0E70
	sub r4, r4, #0x20
	movs r3, r2
	mov r2, #0
	bmi _020F0CA8
_020F0E70:
	clz r6, r3
	movs r3, r3, lsl r6
	rsb r6, r6, #0x20
	orr r3, r3, r2, lsr r6
	rsb r6, r6, #0x20
	mov r2, r2, lsl r6
	sub r4, r4, r6
	b _020F0CA8
_020F0E90:
	cmn ip, #0x34
	beq _020F0F28
	bmi _020F0F80
	mov r2, r1
	mov r3, r0
	add r4, ip, #0x34
	cmp r4, #0x20
	movge r2, r3
	movge r3, #0
	subge r4, r4, #0x20
	rsb r5, r4, #0x20
	mov r2, r2, lsl r4
	orr r2, r2, r3, lsr r5
	movs r3, r3, lsl r4
	orrne r2, r2, #1
	rsb ip, ip, #0xc
	cmp ip, #0x20
	movge r0, r1
	movge r1, #0
	subge ip, ip, #0x20
	rsb r4, ip, #0x20
	mov r0, r0, lsr ip
	orr r0, r0, r1, lsl r4
	orr r1, lr, r1, lsr ip
	cmp r2, #0
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	tst r2, #0x80000000
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, r5, r6, r7, lr}
	bxeq lr
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0F28:
	orr r0, r0, r1, lsl #1
	b _020F0F68
_020F0F30:
	ldr r1, _020F0FB4 ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0F44:
	mov r1, r3
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0F58:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0F68:
	movs r2, r0
	mov r1, lr
	mov r0, #0
	addne r0, r0, #1
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0F80:
	mov r1, lr
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0F90:
	ldr r1, _020F0FB4 ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
_020F0FA4:
	mov r1, lr
	mov r0, #0
	ldmia sp!, {r4, r5, r6, r7, lr}
	bx lr
	.align 2, 0
_020F0FB4: .word 0x7FF00000

	.public _dsqrt
	.type _dsqrt, @function
_dsqrt: ; 0x020F0FB8
	stmdb sp!, {r4, r5, r6, lr}
	ldr r2, _020F1148 ; =0x7FF00000
	cmp r1, r2
	bhs _020F1104
	movs ip, r1, lsr #0x14
	beq _020F10B0
	bic r1, r1, r2
	orr r1, r1, #0x100000
_020F0FD8:
	movs ip, ip, asr #1
	bhs _020F0FEC
	sub ip, ip, #1
	movs r0, r0, lsl #1
	adc r1, r1, r1
_020F0FEC:
	movs r3, r0, lsl #1
	adc r1, r1, r1
	mov r2, #0
	mov r4, #0
	mov lr, #0x200000
_020F1000:
	add r6, r4, lr
	cmp r6, r1
	addle r4, r6, lr
	suble r1, r1, r6
	addle r2, r2, lr
	movs r3, r3, lsl #1
	adc r1, r1, r1
	movs lr, lr, lsr #1
	bne _020F1000
	mov r0, #0
	mov r5, #0
	cmp r1, r4
	cmpeq r3, #0x80000000
	blo _020F1048
	subs r3, r3, #0x80000000
	sbc r1, r1, r4
	add r4, r4, #1
	mov r0, #0x80000000
_020F1048:
	movs r3, r3, lsl #1
	adc r1, r1, r1
	mov lr, #0x40000000
_020F1054:
	add r6, r5, lr
	cmp r4, r1
	cmpeq r6, r3
	bhi _020F1074
	add r5, r6, lr
	subs r3, r3, r6
	sbc r1, r1, r4
	add r0, r0, lr
_020F1074:
	movs r3, r3, lsl #1
	adc r1, r1, r1
	movs lr, lr, lsr #1
	bne _020F1054
	orrs r1, r1, r3
	biceq r0, r0, #1
	movs r1, r2, lsr #1
	movs r0, r0, rrx
	adcs r0, r0, #0
	adc r1, r1, #0
	add r1, r1, #0x20000000
	sub r1, r1, #0x100000
	add r1, r1, ip, lsl #20
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F10B0:
	cmp r1, #0
	bne _020F10E0
	cmp r0, #0
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	mvn ip, #0x13
	clz r5, r0
	movs r0, r0, lsl r5
	sub ip, ip, r5
	mov r1, r0, lsr #0xb
	mov r0, r0, lsl #0x15
	b _020F0FD8
_020F10E0:
	clz r2, r1
	movs r1, r1, lsl r2
	rsb r2, r2, #0x2b
	mov r1, r1, lsr #0xb
	orr r1, r1, r0, lsr r2
	rsb r2, r2, #0x20
	mov r0, r0, lsl r2
	rsb ip, r2, #1
	b _020F0FD8
_020F1104:
	tst r1, #0x80000000
	beq _020F1120
	bics r3, r1, #0x80000000
	cmpeq r0, #0
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	b _020F112C
_020F1120:
	orrs r2, r0, r1, lsl #12
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
_020F112C:
	ldr r2, _020F114C ; =0x7FF80000
	orr r1, r1, r2
	ldr r3, _020F1150 ; =_021E58C0
	mov r4, #0x21
	str r4, [r3]
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_020F1148: .word 0x7FF00000
_020F114C: .word 0x7FF80000
_020F1150: .word _021E58C0

	.public _drsb
	.type _drsb, @function
_drsb: ; 0x020F1154
	eor r1, r1, r3
	eor r3, r1, r3
	eor r1, r1, r3
	eor r0, r0, r2
	eor r2, r0, r2
	eor r0, r0, r2
	.public _dsub
	.type _dsub, @function
	.public _d_sub
	.type _d_sub, @function
_dsub: ; 0x020F116C
_d_sub: ; 0x020F116C
	stmdb sp!, {r4, lr}
	eors ip, r1, r3
	eormi r3, r3, #0x80000000
	bmi __dadd_start
__dsub_start:
	subs ip, r0, r2
	sbcs lr, r1, r3
	bhs _020F119C
	eor lr, lr, #0x80000000
	adds r2, r2, ip
	adc r3, r3, lr
	subs r0, r0, ip
	sbc r1, r1, lr
_020F119C:
	mov lr, #0x80000000
	mov ip, r1, lsr #0x14
	orr r1, lr, r1, lsl #11
	orr r1, r1, r0, lsr #21
	mov r0, r0, lsl #0xb
	movs r4, ip, lsl #0x15
	cmnne r4, #0x200000
	beq _020F13A0
	mov r4, r3, lsr #0x14
	orr r3, lr, r3, lsl #11
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs lr, r4, lsl #0x15
	beq _020F13E8
_020F11D4:
	subs r4, ip, r4
	beq _020F127C
	cmp r4, #0x20
	ble _020F1210
	cmp r4, #0x38
	movge r4, #0x3f
	sub r4, r4, #0x20
	rsb lr, r4, #0x20
	orrs lr, r2, r3, lsl lr
	mov r2, r3, lsr r4
	orrne r2, r2, #1
	subs r0, r0, r2
	sbcs r1, r1, #0
	bmi _020F1238
	b _020F1328
_020F1210:
	rsb lr, r4, #0x20
	movs lr, r2, lsl lr
	rsb lr, r4, #0x20
	mov r2, r2, lsr r4
	orr r2, r2, r3, lsl lr
	mov r3, r3, lsr r4
	orrne r2, r2, #1
	subs r0, r0, r2
	sbcs r1, r1, r3
	bpl _020F1328
_020F1238:
	movs r2, r0, lsl #0x15
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	mov r1, r1, lsr #0xc
	orr r1, r1, ip, lsl #20
	tst r2, #0x80000000
	ldmeqia sp!, {r4, lr}
	bxeq lr
	movs r2, r2, lsl #1
	andeqs r2, r0, #1
	ldmeqia sp!, {r4, lr}
	bxeq lr
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, lr}
	bx lr
_020F127C:
	subs r0, r0, r2
	sbc r1, r1, r3
	orrs lr, r1, r0
	beq _020F150C
	mov lr, ip, lsl #0x14
	and lr, lr, #0x80000000
	bic ip, ip, #0x800
	cmp r1, #0
	bmi _020F1304
	bne _020F12B4
	sub ip, ip, #0x20
	movs r1, r0
	mov r0, #0
	bmi _020F12D0
_020F12B4:
	clz r4, r1
	movs r1, r1, lsl r4
	rsb r4, r4, #0x20
	orr r1, r1, r0, lsr r4
	rsb r4, r4, #0x20
	mov r0, r0, lsl r4
	sub ip, ip, r4
_020F12D0:
	cmp ip, #0
	bgt _020F130C
	rsb ip, ip, #0xc
	cmp ip, #0x20
	movge r0, r1
	movge r1, #0
	subge ip, ip, #0x20
	rsb r4, ip, #0x20
	mov r0, r0, lsr ip
	orr r0, r0, r1, lsl r4
	orr r1, lr, r1, lsr ip
	ldmia sp!, {r4, lr}
	bx lr
_020F1304:
	cmp r1, #0
	subges ip, ip, #1
_020F130C:
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmia sp!, {r4, lr}
	bx lr
_020F1328:
	mov lr, ip, lsl #0x14
	and lr, lr, #0x80000000
	bic ip, ip, #0x800
	cmp r1, #0
	bne _020F134C
	sub ip, ip, #0x20
	movs r1, r0
	mov r0, #0
	bmi _020F1368
_020F134C:
	clz r4, r1
	movs r1, r1, lsl r4
	rsb r4, r4, #0x20
	orr r1, r1, r0, lsr r4
	rsb r4, r4, #0x20
	mov r0, r0, lsl r4
	sub ip, ip, r4
_020F1368:
	cmp ip, #0
	orrgt ip, ip, lr, lsr #20
	bgt _020F1238
	rsb ip, ip, #0xc
	cmp ip, #0x20
	movge r0, r1
	movge r1, #0
	subge ip, ip, #0x20
	rsb r4, ip, #0x20
	mov r0, r0, lsr ip
	orr r0, r0, r1, lsl r4
	orr r1, lr, r1, lsr ip
	ldmia sp!, {r4, lr}
	bx lr
_020F13A0:
	cmp ip, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	bics ip, ip, #0x800
	beq _020F140C
	orrs r4, r0, r1, lsl #1
	bne _020F14E8
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r4, r4, lsl #0x15
	beq _020F14D4
	cmn r4, #0x200000
	bne _020F14D4
	orrs r4, r2, r3, lsl #1
	beq _020F14FC
	b _020F14E8
_020F13E8:
	cmp r4, #0x800
	movge lr, #0x80000000
	movlt lr, #0
	bic ip, ip, #0x800
	bics r4, r4, #0x800
	beq _020F1484
	orrs r4, r2, r3, lsl #1
	bne _020F14E8
	b _020F14D4
_020F140C:
	orrs r4, r0, r1, lsl #1
	beq _020F144C
	mov ip, #1
	bic r1, r1, #0x80000000
	mov r4, r3, lsr #0x14
	mov r3, r3, lsl #0xb
	orr r3, r3, r2, lsr #21
	mov r2, r2, lsl #0xb
	movs r4, r4, lsl #0x15
	cmnne r4, #0x200000
	mov r4, r4, lsr #0x15
	orr r4, r4, lr, lsr #20
	beq _020F13E8
	orr r3, r3, #0x80000000
	orr ip, ip, lr, lsr #20
	b _020F11D4
_020F144C:
	mov ip, r3, lsr #0x14
	mov r1, r3, lsl #0xb
	orr r1, r1, r2, lsr #21
	mov r0, r2, lsl #0xb
	movs r4, ip, lsl #0x15
	beq _020F1478
	cmn r4, #0x200000
	bne _020F14A0
	orrs r4, r0, r1, lsl #1
	bne _020F14EC
	b _020F14D4
_020F1478:
	orrs r4, r0, r1, lsl #1
	beq _020F150C
	b _020F14A0
_020F1484:
	orrs r4, r2, r3, lsl #1
	beq _020F14B0
	mov r4, #1
	bic r3, r3, #0x80000000
	orr ip, ip, lr, lsr #20
	orr r4, r4, lr, lsr #20
	b _020F11D4
_020F14A0:
	mov r1, r3
	mov r0, r2
	ldmia sp!, {r4, lr}
	bx lr
_020F14B0:
	cmp r1, #0
	subges ip, ip, #1
	mov r0, r0, lsr #0xb
	orr r0, r0, r1, lsl #21
	add r1, r1, r1
	orr r1, lr, r1, lsr #12
	orr r1, r1, ip, lsl #20
	ldmia sp!, {r4, lr}
	bx lr
_020F14D4:
	ldr r1, _020F151C ; =0x7FF00000
	orr r1, lr, r1
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
_020F14E8:
	mov r1, r3
_020F14EC:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, lr}
	bx lr
_020F14FC:
	mvn r0, #0
	bic r1, r0, #0x80000000
	ldmia sp!, {r4, lr}
	bx lr
_020F150C:
	mov r1, #0
	mov r0, #0
	ldmia sp!, {r4, lr}
	bx lr
	.align 2, 0
_020F151C: .word 0x7FF00000

	arm_func_start _fadd
	arm_func_start _f_add
_fadd: ; 0x020F1520
_f_add: ; 0x020F1520
	eors r2, r0, r1
	eormi r1, r1, #0x80000000
	bmi __fsub_start
__fadd_start:
	subs ip, r0, r1
	sublo r0, r0, ip
	addlo r1, r1, ip
	mov r2, #0x80000000
	mov r3, r0, lsr #0x17
	orr r0, r2, r0, lsl #8
	ands ip, r3, #0xff
	cmpne ip, #0xff
	beq _020F15C0
	mov ip, r1, lsr #0x17
	orr r1, r2, r1, lsl #8
	ands r2, ip, #0xff
	beq _020F1600
_020F1560:
	subs ip, r3, ip
	beq _020F1578
	rsb r2, ip, #0x20
	movs r2, r1, lsl r2
	mov r1, r1, lsr ip
	orrne r1, r1, #1
_020F1578:
	adds r0, r0, r1
	blo _020F1598
	and r1, r0, #1
	orr r0, r1, r0, rrx
	add r3, r3, #1
	and r2, r3, #0xff
	cmp r2, #0xff
	beq _020F1708
_020F1598:
	ands r1, r0, #0xff
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	tst r1, #0x80
	bxeq lr
	ands r1, r1, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F15C0:
	cmp r3, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	ands r3, r3, #0xff
	beq _020F1624
	movs r0, r0, lsl #1
	bne _020F1734
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _020F1728
	cmp ip, #0xff
	blt _020F1728
	cmp r1, #0
	beq _020F1728
	b _020F1734
_020F1600:
	cmp r3, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	and r3, r3, #0xff
	ands ip, ip, #0xff
	beq _020F1680
_020F1618:
	movs r1, r1, lsl #1
	bne _020F1734
	b _020F1728
_020F1624:
	movs r0, r0, lsl #1
	beq _020F165C
	mov r3, #1
	mov r0, r0, lsr #1
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #8
	ands ip, ip, #0xff
	beq _020F1680
	cmp ip, #0xff
	beq _020F1618
	orr r1, r1, #0x80000000
	orr r3, r3, r2, lsr #23
	orr ip, ip, r2, lsr #23
	b _020F1560
_020F165C:
	mov r3, r1, lsr #0x17
	mov r0, r1, lsl #9
	ands r3, r3, #0xff
	beq _020F16E8
	cmp r3, #0xff
	blt _020F16E8
	cmp r0, #0
	beq _020F1728
	b _020F1720
_020F1680:
	movs r1, r1, lsl #1
	beq _020F16F0
	mov r1, r1, lsr #1
	mov ip, #1
	orr r3, r3, r2, lsr #23
	orr ip, ip, r2, lsr #23
	cmp r0, #0
	bmi _020F1560
	adds r0, r0, r1
	blo _020F16B4
	and r1, r0, #1
	orr r0, r1, r0, rrx
	add ip, ip, #1
_020F16B4:
	cmp r0, #0
	subge ip, ip, #1
	ands r1, r0, #0xff
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, ip, lsl #23
	bxeq lr
	tst r1, #0x80
	bxeq lr
	ands r1, r1, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F16E8:
	mov r0, r1
	bx lr
_020F16F0:
	cmp r0, #0
	subges r3, r3, #1
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bx lr
_020F1708:
	cmp r3, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_020F1720:
	mvn r0, #0x80000000
	bx lr
_020F1728:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_020F1734:
	mvn r0, #0x80000000
	bx lr
_020F173C: ; 0x020F173C
	mvn r0, #0x80000000
	bx lr

	.public _dgeq
	.type _dgeq, @function
	.public _d_fge
	.type _d_fge, @function
_dgeq: ; 0x020F1744
_d_fge:
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _020F17B8
	cmn ip, r3, lsl #1
	bhs _020F17CC
_020F1758:
	orrs ip, r3, r1
	bmi _020F1788
	cmp r1, r3
	cmpeq r0, r2
	movhs r0, #1
	movlo r0, #0
	bx lr
_020F1774:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_020F1788:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #1
	mrs ip, cpsr
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bxeq lr
	cmp r3, r1
	cmpeq r2, r0
	movhs r0, #1
	movlo r0, #0
	bx lr
_020F17B8:
	bne _020F1774
	cmp r0, #0
	bhi _020F1774
	cmn ip, r3, lsl #1
	blo _020F1758
_020F17CC:
	bne _020F1774
	cmp r2, #0
	bhi _020F1774
	b _020F1758

	.public _dgr
	.type _dgr, @function
	.public _d_fgt
	.type _d_fgt, @function
_dgr: ; 0x020F17DC
_d_fgt:
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _020F1850
	cmn ip, r3, lsl #1
	bhs _020F1864
_020F17F0:
	orrs ip, r3, r1
	bmi _020F1820
	cmp r1, r3
	cmpeq r0, r2
	movhi r0, #1
	movls r0, #0
	bx lr
_020F180C:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_020F1820:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	msr cpsr_f, ip
	bxeq lr
	cmp r3, r1
	cmpeq r2, r0
	movhi r0, #1
	movls r0, #0
	bx lr
_020F1850:
	bne _020F180C
	cmp r0, #0
	bhi _020F180C
	cmn ip, r3, lsl #1
	blo _020F17F0
_020F1864:
	bne _020F180C
	cmp r2, #0
	bhi _020F180C
	b _020F17F0

	.public _dleq
	.type _dleq, @function
	.public _d_fle
	.type _d_fle, @function
_dleq: ; 0x020F1874
_d_fle:
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _020F18F4
	cmn ip, r3, lsl #1
	bhs _020F1908
_020F1888:
	orrs ip, r3, r1
	bmi _020F18BC
	cmp r1, r3
	cmpeq r0, r2
	movls r0, #1
	movhi r0, #0
	bx lr
_020F18A4:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_020F18BC:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #1
	bne _020F18E0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	orr ip, ip, #0x40000000
	msr cpsr_f, ip
	bxeq lr
_020F18E0:
	cmp r3, r1
	cmpeq r2, r0
	movls r0, #1
	movhi r0, #0
	bx lr
_020F18F4:
	bne _020F18A4
	cmp r0, #0
	bhi _020F18A4
	cmn ip, r3, lsl #1
	blo _020F1888
_020F1908:
	bne _020F18A4
	cmp r2, #0
	bhi _020F18A4
	b _020F1888

	.public _dls
	.type _dls, @function
	.public _d_flt
	.type _d_flt, @function
_dls: ; 0x020F1918
_d_flt:
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _020F1990
	cmn ip, r3, lsl #1
	bhs _020F19A4
_020F192C:
	orrs ip, r3, r1
	bmi _020F195C
	cmp r1, r3
	cmpeq r0, r2
	movlo r0, #1
	movhs r0, #0
	bx lr
_020F1948:
	mov r0, #0
	mrs ip, cpsr
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_020F195C:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #0
	bne _020F197C
	mrs ip, cpsr
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bxeq lr
_020F197C:
	cmp r3, r1
	cmpeq r2, r0
	movlo r0, #1
	movhs r0, #0
	bx lr
_020F1990:
	bne _020F1948
	cmp r0, #0
	bhi _020F1948
	cmn ip, r3, lsl #1
	blo _020F192C
_020F19A4:
	bne _020F1948
	cmp r2, #0
	bhi _020F1948
	b _020F192C

	.public _deq
	.type _deq, @function
	.public _d_feq
	.type _d_feq, @function
_deq: ; 0x020F19B4
_d_feq:
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _020F1A1C
	cmn ip, r3, lsl #1
	bhs _020F1A30
_020F19C8:
	orrs ip, r3, r1
	bmi _020F19F8
	cmp r1, r3
	cmpeq r0, r2
	moveq r0, #1
	movne r0, #0
	bx lr
_020F19E4:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F19F8:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #1
	bxeq lr
	cmp r3, r1
	cmpeq r2, r0
	moveq r0, #1
	movne r0, #0
	bx lr
_020F1A1C:
	bne _020F19E4
	cmp r0, #0
	bhi _020F19E4
	cmn ip, r3, lsl #1
	blo _020F19C8
_020F1A30:
	bne _020F19E4
	cmp r2, #0
	bhi _020F19E4
	b _020F19C8

	.public _dneq
	.type _dneq, @function
	.public _d_fne
	.type _d_fne, @function
_dneq: ; 0x020F1A40
_d_fne:
	mov ip, #0x200000
	cmn ip, r1, lsl #1
	bhs _020F1AA8
	cmn ip, r3, lsl #1
	bhs _020F1ABC
_020F1A54:
	orrs ip, r3, r1
	bmi _020F1A84
	cmp r1, r3
	cmpeq r0, r2
	movne r0, #1
	moveq r0, #0
	bx lr
_020F1A70:
	mov r0, #1
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F1A84:
	orr ip, r0, ip, lsl #1
	orrs ip, ip, r2
	moveq r0, #0
	bxeq lr
	cmp r3, r1
	cmpeq r2, r0
	movne r0, #1
	moveq r0, #0
	bx lr
_020F1AA8:
	bne _020F1A70
	cmp r0, #0
	bhi _020F1A70
	cmn ip, r3, lsl #1
	blo _020F1A54
_020F1ABC:
	bne _020F1A70
	cmp r2, #0
	bhi _020F1A70
	b _020F1A54

	.public _fgr
	.type _fgr, @function
	.public _f_fgt
	.type _f_fgt, @function
_fgr: ; 0x020F1ACC
_f_fgt:
	mov r3, #0xff000000
	cmp r3, r0, lsl #1
	cmphs r3, r1, lsl #1
	blo _020F1B14
	cmp r0, #0
	bicmi r0, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r1, #0
	bicmi r1, r1, #0x80000000
	rsbmi r1, r1, #0
	cmp r0, r1
	movgt r0, #1
	movle r0, #0
	mrs ip, cpsr
	bicle ip, ip, #0x20000000
	orrgt ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_020F1B14:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr

	.public _fleq
	.type _fleq, @function
	.public _f_fle
	.type _f_fle, @function
_fleq: ; 0x020F1B28
_f_fle:
	mov r3, #0xff000000
	cmp r3, r0, lsl #1
	cmphs r3, r1, lsl #1
	blo _020F1B78
	cmp r0, #0
	bicmi r0, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r1, #0
	bicmi r1, r1, #0x80000000
	rsbmi r1, r1, #0
	cmp r0, r1
	movle r0, #1
	movgt r0, #0
	mrs ip, cpsr
	orrgt ip, ip, #0x20000000
	bicgt ip, ip, #0x40000000
	bicle ip, ip, #0x20000000
	orrle ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F1B78:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr

	.public _fls
	.type _fls, @function
	.public _f_flt
	.type _f_flt, @function
_fls: ; 0x020F1B90
_f_flt:
	mov r3, #0xff000000
	cmp r3, r0, lsl #1
	cmphs r3, r1, lsl #1
	blo _020F1BD8
	cmp r0, #0
	bicmi r0, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r1, #0
	bicmi r1, r1, #0x80000000
	rsbmi r1, r1, #0
	cmp r0, r1
	movlt r0, #1
	movge r0, #0
	mrs ip, cpsr
	orrge ip, ip, #0x20000000
	biclt ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr
_020F1BD8:
	mov r0, #0
	mrs ip, cpsr
	orr ip, ip, #0x20000000
	msr cpsr_f, ip
	bx lr

	.public _feq
	.type _feq, @function
	.public _f_feq
	.type _f_feq, @function
_feq: ; 0x020F1BEC
_f_feq:
	mov r3, #0xff000000
	cmp r3, r0, lsl #1
	blo _020F1C40
	cmp r3, r1, lsl #1
	blo _020F1C40
	orr r3, r0, r1
	movs r3, r3, lsl #1
	moveq r0, #1
	bne _020F1C20
	mrs ip, cpsr
	orr ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F1C20:
	cmp r0, r1
	moveq r0, #1
	movne r0, #0
	mrs ip, cpsr
	orreq ip, ip, #0x40000000
	bicne ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F1C40:
	mov r0, #0
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr

	.public _fneq
	.type _fneq, @function
	.public _f_fne
	.type _f_fne, @function
_fneq: ; 0x020F1C54
_f_fne:
	mov r3, #0xff000000
	cmp r3, r0, lsl #1
	blo _020F1CA8
	cmp r3, r1, lsl #1
	blo _020F1CA8
	orr r3, r0, r1
	movs r3, r3, lsl #1
	moveq r0, #0
	bne _020F1C88
	mrs ip, cpsr
	orr ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F1C88:
	cmp r0, r1
	movne r0, #1
	moveq r0, #0
	mrs ip, cpsr
	bicne ip, ip, #0x40000000
	orreq ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr
_020F1CA8:
	mov r0, #1
	mrs ip, cpsr
	bic ip, ip, #0x40000000
	msr cpsr_f, ip
	bx lr

	.public _frdiv
	.type _frdiv, @function
_frdiv: ; 0x020F1CBC
	eor r0, r0, r1
	eor r1, r0, r1
	eor r0, r0, r1
	.public _fdiv
	.type _fdiv, @function
	.public _f_div
	.type _f_div, @function
_fdiv: ; 0x020F1CC8
_f_div:
	stmdb sp!, {lr}
	mov ip, #0xff
	ands r3, ip, r0, lsr #23
	cmpne r3, #0xff
	beq _020F1E9C
	ands ip, ip, r1, lsr #23
	cmpne ip, #0xff
	beq _020F1ED8
	orr r1, r1, #0x800000
	orr r0, r0, #0x800000
	bic r2, r0, #0xff000000
	bic lr, r1, #0xff000000
_020F1CF8:
	cmp r2, lr
	movlo r2, r2, lsl #1
	sublo r3, r3, #1
	teq r0, r1
	adr r0, UNK_020F1D7C - 0x100
	ldrb r1, [r0, lr, lsr #15]
	rsb lr, lr, #0
	mov r0, lr, asr #1
	mul r0, r1, r0
	add r0, r0, #0x80000000
	mov r0, r0, lsr #6
	mul r0, r1, r0
	mov r0, r0, lsr #0xe
	mul r1, lr, r0
	sub ip, r3, ip
	mov r1, r1, lsr #0xc
	mul r1, r0, r1
	mov r0, r0, lsl #0xe
	add r0, r0, r1, lsr #15
	umull r1, r0, r2, r0
	mov r3, r0
	orrmi r0, r0, #0x80000000
	adds ip, ip, #0x7e
	bmi _020F1FA0
	cmp ip, #0xfe
	bge _020F2054
	add r0, r0, ip, lsl #23
	mov ip, r1, lsr #0x1c
	cmp ip, #7
	beq _020F1E7C
	add r0, r0, r1, lsr #31
	ldmia sp!, {lr}
	bx lr
UNK_020F1D7C: ; 0x020F1D7C
	.byte 0xFF, 0xFF, 0xFE, 0xFD
	.byte 0xFC, 0xFB, 0xFA, 0xF9, 0xF8, 0xF7, 0xF6, 0xF5, 0xF4, 0xF3, 0xF2, 0xF1, 0xF0, 0xF0, 0xEF, 0xEE
	.byte 0xED, 0xEC, 0xEB, 0xEA, 0xEA, 0xE9, 0xE8, 0xE7, 0xE6, 0xE6, 0xE5, 0xE4, 0xE3, 0xE2, 0xE2, 0xE1
	.byte 0xE0, 0xDF, 0xDF, 0xDE, 0xDD, 0xDC, 0xDC, 0xDB, 0xDA, 0xD9, 0xD9, 0xD8, 0xD7, 0xD7, 0xD6, 0xD5
	.byte 0xD4, 0xD4, 0xD3, 0xD2, 0xD2, 0xD1, 0xD0, 0xD0, 0xCF, 0xCE, 0xCE, 0xCD, 0xCC, 0xCC, 0xCB, 0xCB
	.byte 0xCA, 0xC9, 0xC9, 0xC8, 0xC8, 0xC7, 0xC6, 0xC6, 0xC5, 0xC5, 0xC4, 0xC3, 0xC3, 0xC2, 0xC2, 0xC1
	.byte 0xC0, 0xC0, 0xBF, 0xBF, 0xBE, 0xBE, 0xBD, 0xBD, 0xBC, 0xBC, 0xBB, 0xBA, 0xBA, 0xB9, 0xB9, 0xB8
	.byte 0xB8, 0xB7, 0xB7, 0xB6, 0xB6, 0xB5, 0xB5, 0xB4, 0xB4, 0xB3, 0xB3, 0xB2, 0xB2, 0xB1, 0xB1, 0xB0
	.byte 0xB0, 0xAF, 0xAF, 0xAF, 0xAE, 0xAE, 0xAD, 0xAD, 0xAC, 0xAC, 0xAB, 0xAB, 0xAA, 0xAA, 0xAA, 0xA9
	.byte 0xA9, 0xA8, 0xA8, 0xA7, 0xA7, 0xA7, 0xA6, 0xA6, 0xA5, 0xA5, 0xA4, 0xA4, 0xA4, 0xA3, 0xA3, 0xA2
	.byte 0xA2, 0xA2, 0xA1, 0xA1, 0xA0, 0xA0, 0xA0, 0x9F, 0x9F, 0x9E, 0x9E, 0x9E, 0x9D, 0x9D, 0x9D, 0x9C
	.byte 0x9C, 0x9B, 0x9B, 0x9B, 0x9A, 0x9A, 0x9A, 0x99, 0x99, 0x99, 0x98, 0x98, 0x98, 0x97, 0x97, 0x96
	.byte 0x96, 0x96, 0x95, 0x95, 0x95, 0x94, 0x94, 0x94, 0x93, 0x93, 0x93, 0x92, 0x92, 0x92, 0x91, 0x91
	.byte 0x91, 0x91, 0x90, 0x90, 0x90, 0x8F, 0x8F, 0x8F, 0x8E, 0x8E, 0x8E, 0x8D, 0x8D, 0x8D, 0x8C, 0x8C
	.byte 0x8C, 0x8C, 0x8B, 0x8B, 0x8B, 0x8A, 0x8A, 0x8A, 0x8A, 0x89, 0x89, 0x89, 0x88, 0x88, 0x88, 0x88
	.byte 0x87, 0x87, 0x87, 0x86, 0x86, 0x86, 0x86, 0x85, 0x85, 0x85, 0x85, 0x84, 0x84, 0x84, 0x83, 0x83
	.byte 0x83, 0x83, 0x82, 0x82, 0x82, 0x82, 0x81, 0x81, 0x81, 0x81, 0x80, 0x80
_020F1E7C:
	mov r1, r3, lsl #1
	add r1, r1, #1
	rsb lr, lr, #0
	mul r1, lr, r1
	cmp r1, r2, lsl #24
	addmi r0, r0, #1
	ldmia sp!, {lr}
	bx lr
_020F1E9C:
	eor lr, r0, r1
	and lr, lr, #0x80000000
	cmp r3, #0
	beq _020F1EF4
	movs r0, r0, lsl #9
	bne _020F203C
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _020F202C
	cmp ip, #0xff
	blt _020F202C
	cmp r1, #0
	beq _020F2048
	b _020F2024
_020F1ED8:
	eor lr, r0, r1
	and lr, lr, #0x80000000
	cmp ip, #0
	beq _020F1F58
_020F1EE8:
	movs r1, r1, lsl #9
	bne _020F2024
	b _020F2074
_020F1EF4:
	movs r2, r0, lsl #9
	beq _020F1F28
	clz r3, r2
	movs r2, r2, lsl r3
	rsb r3, r3, #0
	mov r2, r2, lsr #8
	ands ip, ip, r1, lsr #23
	beq _020F1F80
	cmp ip, #0xff
	beq _020F1EE8
	orr r1, r1, #0x800000
	bic lr, r1, #0xff000000
	b _020F1CF8
_020F1F28:
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _020F1F4C
	cmp ip, #0xff
	blt _020F2074
	cmp r1, #0
	beq _020F2074
	b _020F2024
_020F1F4C:
	cmp r1, #0
	beq _020F2048
	b _020F2074
_020F1F58:
	movs ip, r1, lsl #9
	beq _020F202C
	mov lr, ip
	clz ip, lr
	movs lr, lr, lsl ip
	rsb ip, ip, #0
	mov lr, lr, lsr #8
	orr r0, r0, #0x800000
	bic r2, r0, #0xff000000
	b _020F1CF8
_020F1F80:
	movs ip, r1, lsl #9
	beq _020F202C
	mov lr, ip
	clz ip, lr
	movs lr, lr, lsl ip
	rsb ip, ip, #0
	mov lr, lr, lsr #8
	b _020F1CF8
_020F1FA0:
	and r0, r0, #0x80000000
	cmn ip, #0x18
	beq _020F2014
	bmi _020F206C
	add r1, ip, #0x17
	mov r2, r2, lsl r1
	rsb ip, ip, #0
	mov r3, r3, lsr ip
	orr r0, r0, r3
	rsb lr, lr, #0
	mul r1, lr, r3
	cmp r1, r2
	ldmeqia sp!, {lr}
	bxeq lr
	add r1, r1, lr
	cmp r1, r2
	beq _020F2008
	addmi r0, r0, #1
	subpl r1, r1, lr
	add r1, lr, r1, lsl #1
	cmp r1, r2, lsl #1
	and r3, r0, #1
	addmi r0, r0, #1
	addeq r0, r0, r3
	ldmia sp!, {lr}
	bx lr
_020F2008:
	add r0, r0, #1
	ldmia sp!, {lr}
	bx lr
_020F2014:
	cmn r2, lr
	addne r0, r0, #1
	ldmia sp!, {lr}
	bx lr
_020F2024:
	mov r0, r1
	b _020F203C
_020F202C:
	mov r0, #0xff000000
	orr r0, lr, r0, lsr #1
	ldmia sp!, {lr}
	bx lr
_020F203C:
	mvn r0, #0x80000000
	ldmia sp!, {lr}
	bx lr
_020F2048:
	mvn r0, #0x80000000
	ldmia sp!, {lr}
	bx lr
_020F2054:
	tst r0, #0x80000000
	mov r0, #0xff000000
	movne r0, r0, asr #1
	moveq r0, r0, lsr #1
	ldmia sp!, {lr}
	bx lr
_020F206C:
	ldmia sp!, {lr}
	bx lr
_020F2074:
	mov r0, lr
	ldmia sp!, {lr}
	bx lr

	.public _f2d
	.type _f2d, @function
	.public _f_ftod
	.type _f_ftod, @function
_f2d: ; 0x020F2080
_f_ftod:
	and r2, r0, #0x80000000
	mov ip, r0, lsr #0x17
	mov r3, r0, lsl #9
	ands ip, ip, #0xff
	beq _020F20B0
	cmp ip, #0xff
	beq _020F20DC
_020F209C:
	add ip, ip, #0x380
	mov r0, r3, lsl #0x14
	orr r1, r2, r3, lsr #12
	orr r1, r1, ip, lsl #20
	bx lr
_020F20B0:
	cmp r3, #0
	bne _020F20C4
	mov r1, r2
	mov r0, #0
	bx lr
_020F20C4:
	mov r3, r3, lsr #1
	clz ip, r3
	movs r3, r3, lsl ip
	rsb ip, ip, #1
	add r3, r3, r3
	b _020F209C
_020F20DC:
	cmp r3, #0
	bhi _020F20F4
	ldr r1, _020F2100 ; =0x7FF00000
	orr r1, r1, r2
	mov r0, #0
	bx lr
_020F20F4:
	mvn r0, #0
	bic r1, r0, #0x80000000
	bx lr
	.align 2, 0
_020F2100: .word 0x7FF00000

	.public _f_ftoi
	.type _f_ftoi, @function
	.public _ffix
	.type _ffix, @function
_f_ftoi: ; 0x020F2104
_ffix:
	bic r1, r0, #0x80000000
	mov r2, #0x9e
	subs r2, r2, r1, lsr #23
	ble _020F212C
	mov r1, r1, lsl #8
	orr r1, r1, #0x80000000
	cmp r0, #0
	mov r0, r1, lsr r2
	rsbmi r0, r0, #0
	bx lr
_020F212C:
	mvn r0, r0, asr #31
	add r0, r0, #0x80000000
	bx lr

	.public _ffixu
	.type _ffixu, @function
	.public _f_ftou
	.type _f_ftou, @function
_ffixu: ; 0x020F2138
_f_ftou:
	tst r0, #0x80000000
	bne _020F215C
	mov r1, #0x9e
	subs r1, r1, r0, lsr #23
	blt _020F2170
	mov r2, r0, lsl #8
	orr r0, r2, #0x80000000
	mov r0, r0, lsr r1
	bx lr
_020F215C:
	mov r2, #0xff000000
	cmp r2, r0, lsl #1
	movhs r0, #0
	mvnlo r0, #0
	bx lr
_020F2170:
	mvn r0, #0
	bx lr

	.public _fflt
	.type _fflt, @function
	.public _f_itof
	.type _f_itof, @function
_fflt: ; 0x020F2178
_f_itof:
	ands r2, r0, #0x80000000
	rsbmi r0, r0, #0
	cmp r0, #0
__f_itof_common:
	bxeq lr
	clz r3, r0
	movs r0, r0, lsl r3
	rsb r3, r3, #0x9e
	ands r1, r0, #0xff
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst r1, #0x80
	bxeq lr
	ands r3, r1, #0x7f
	andeqs r3, r0, #1
	addne r0, r0, #1
	bx lr

	.public _ffltu
	.type _ffltu, @function
	.public _f_utof
	.type _f_utof, @function
_ffltu: ; 0x020F21C0
_f_utof:
	cmp r0, #0
__f_utof_common:
	bxeq lr
	mov r3, #0x9e
	bmi _020F21DC
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
_020F21DC:
	ands r2, r0, #0xff
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst r2, #0x80
	bxeq lr
	ands r1, r2, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr

	.public _f_lltof
	.type _f_lltof, @function
	.public _ll_sto_f
	.type _ll_sto_f, @function
_f_lltof: ; 0x020F2208
_ll_sto_f:
	ands r2, r1, #0x80000000
	beq _020F2218
	rsbs r0, r0, #0
	rsc r1, r1, #0
_020F2218:
	cmp r1, #0
	bne _020F2228
	movs r0, r0
	b __f_itof_common
_020F2228:
	clz r3, r1
	movs r1, r1, lsl r3
	rsb r3, r3, #0x20
	orr r1, r1, r0, lsr r3
	rsb ip, r3, #0x20
	movs r0, r0, lsl ip
	orrne r1, r1, #1
	add r3, r3, #0x9e
	ands ip, r1, #0xff
	add r0, r1, r1
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst ip, #0x80
	bxeq lr
	ands r3, ip, #0x7f
	andeqs r3, r0, #1
	addne r0, r0, #1
	bx lr

	.public _f_ulltof
	.type _f_ulltof, @function
	.public _ll_uto_f
	.type _ll_uto_f, @function
_f_ulltof: ; 0x020F2274
_ll_uto_f:
	cmp r1, #0
	bne _020F2284
	movs r0, r0
	b __f_utof_common
_020F2284:
	mov r3, #0x20
	bmi _020F22A4
	clz ip, r1
	movs r1, r1, lsl ip
	sub r3, r3, ip
	orr r1, r1, r0, lsr r3
	rsb r2, r3, #0x20
	mov r0, r0, lsl r2
_020F22A4:
	cmp r0, #0
	orrne r1, r1, #1
	add r3, r3, #0x9e
	ands r2, r1, #0xff
	add r0, r1, r1
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst r2, #0x80
	bxeq lr
	ands r1, r2, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr

	.public _fmul
	.type _fmul, @function
	.public _f_mul
	.type _f_mul, @function
_fmul: ; 0x020F22DC
_f_mul:
	eor r2, r0, r1
	and r2, r2, #0x80000000
	mov ip, #0xff
	ands r3, ip, r0, lsr #23
	mov r0, r0, lsl #8
	cmpne r3, #0xff
	beq _020F2358
	orr r0, r0, #0x80000000
	ands ip, ip, r1, lsr #23
	mov r1, r1, lsl #8
	cmpne ip, #0xff
	beq _020F2398
	orr r1, r1, #0x80000000
_020F2310:
	add ip, r3, ip
	umull r1, r3, r0, r1
	movs r0, r3
	addpl r0, r0, r0
	subpl ip, ip, #1
	subs ip, ip, #0x7f
	bmi _020F2424
	cmp ip, #0xfe
	bge _020F2490
	ands r3, r0, #0xff
	orr r0, r2, r0, lsr #8
	add r0, r0, ip, lsl #23
	tst r3, #0x80
	bxeq lr
	orrs r1, r1, r3, lsl #25
	andeqs r3, r0, #1
	addne r0, r0, #1
	bx lr
_020F2358:
	cmp r3, #0
	beq _020F23AC
	movs r0, r0, lsl #1
	bne __f_result_x_NaN
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _020F238C
	cmp ip, #0xff
	blt __f_result_INF
	cmp r1, #0
	beq __f_result_INF
	b __f_result_x_NaN
_020F238C:
	cmp r1, #0
	beq __f_result_invalid
	b __f_result_INF
_020F2398:
	cmp ip, #0
	beq _020F2408
_020F23A0:
	movs r1, r1, lsl #1
	bne __f_result_x_NaN
	b __f_result_INF
_020F23AC:
	movs r0, r0, lsl #1
	beq _020F23E4
	mov r0, r0, lsr #1
	clz r3, r0
	movs r0, r0, lsl r3
	rsb r3, r3, #1
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #8
	ands ip, ip, #0xff
	beq _020F2408
	cmp ip, #0xff
	beq _020F23A0
	orr r1, r1, #0x80000000
	b _020F2310
_020F23E4:
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _020F24B4
	cmp ip, #0xff
	blt _020F24B4
	cmp r1, #0
	beq __f_result_invalid
	b __f_result_x_NaN
_020F2408:
	movs r1, r1, lsl #1
	beq _020F24B4
	mov r1, r1, lsr #1
	clz ip, r1
	movs r1, r1, lsl ip
	rsb ip, ip, #1
	b _020F2310
_020F2424:
	cmn ip, #0x18
	beq _020F246C
	bmi _020F24AC
	cmp r1, #0
	orrne r0, r0, #1
	mov r3, r0
	mov r0, r0, lsr #8
	rsb ip, ip, #0
	orr r0, r2, r0, lsr ip
	rsb ip, ip, #0x18
	movs r1, r3, lsl ip
	bxeq lr
	tst r1, #0x80000000
	bxeq lr
	movs r1, r1, lsl #1
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F246C:
	mov r0, r0, lsl #1
	b _020F249C
__f_result_INF:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
__f_result_x_NaN:
	mvn r0, #0x80000000
	bx lr
__f_result_invalid:
	mvn r0, #0x80000000
	bx lr
_020F2490:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_020F249C:
	movs r1, r0
	mov r0, r2
	addne r0, r0, #1
	bx lr
_020F24AC:
	mov r0, r2
	bx lr
_020F24B4:
	mov r0, r2
	bx lr

	.public _frsb
	.type _frsb, @function
_frsb: ; 0x020F24BC
	eor r0, r0, r1
	eor r1, r0, r1
	eor r0, r0, r1
	.public _fsub
	.type _fsub, @function
	.public _f_sub
	.type _f_sub, @function
_fsub: ; 0x020F24C8
_f_sub: ; 0x020F24C8
	eors r2, r0, r1
	eormi r1, r1, #0x80000000
	bmi __fadd_start
__fsub_start:
	subs ip, r0, r1
	eorlo ip, ip, #0x80000000
	sublo r0, r0, ip
	addlo r1, r1, ip
	mov r2, #0x80000000
	mov r3, r0, lsr #0x17
	orr r0, r2, r0, lsl #8
	ands ip, r3, #0xff
	cmpne ip, #0xff
	beq _020F25F0
	mov ip, r1, lsr #0x17
	orr r1, r2, r1, lsl #8
	ands r2, ip, #0xff
	beq _020F2630
_020F250C:
	subs ip, r3, ip
	beq _020F2554
	rsb r2, ip, #0x20
	movs r2, r1, lsl r2
	mov r1, r1, lsr ip
	orrne r1, r1, #1
	subs r0, r0, r1
	bpl _020F2598
	ands r1, r0, #0xff
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	tst r1, #0x80
	bxeq lr
	ands r1, r1, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F2554:
	subs r0, r0, r1
	beq _020F26FC
	mov r2, r3, lsl #0x17
	and r2, r2, #0x80000000
	bic r3, r3, #0x100
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
	cmp r3, #0
	bgt _020F2588
	rsb r3, r3, #9
	orr r0, r2, r0, lsr r3
	bx lr
_020F2588:
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bx lr
_020F2598:
	mov r2, r3, lsl #0x17
	and r2, r2, #0x80000000
	bic r3, r3, #0x100
	clz ip, r0
	movs r0, r0, lsl ip
	sub r3, r3, ip
	cmp r3, #0
	bgt _020F25C4
	rsb r3, r3, #9
	orr r0, r2, r0, lsr r3
	bx lr
_020F25C4:
	ands r1, r0, #0xff
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bxeq lr
	tst r1, #0x80
	bxeq lr
	ands r1, r1, #0x7f
	andeqs r1, r0, #1
	addne r0, r0, #1
	bx lr
_020F25F0:
	cmp r3, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	ands r3, r3, #0xff
	beq _020F2658
	movs r0, r0, lsl #1
	bne _020F2730
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #9
	ands ip, ip, #0xff
	beq _020F2724
	cmp ip, #0xff
	blt _020F2724
	cmp r1, #0
	beq _020F2738
	b _020F2730
_020F2630:
	cmp ip, #0x100
	movge r2, #0x80000000
	movlt r2, #0
	and r3, r3, #0xff
	ands ip, ip, #0xff
	beq _020F26C0
_020F2648:
	eor r2, r2, #0x80000000
	movs r1, r1, lsl #1
	bne _020F2730
	b _020F2724
_020F2658:
	movs r0, r0, lsl #1
	beq _020F2690
	mov r0, r0, lsr #1
	mov r3, #1
	mov ip, r1, lsr #0x17
	mov r1, r1, lsl #8
	ands ip, ip, #0xff
	beq _020F26C0
	cmp ip, #0xff
	beq _020F2648
	orr r1, r1, #0x80000000
	orr r3, r3, r2, lsr #23
	orr ip, ip, r2, lsr #23
	b _020F250C
_020F2690:
	mov r3, r1, lsr #0x17
	mov r0, r1, lsl #9
	ands r2, r3, #0xff
	beq _020F26B4
	cmp r2, #0xff
	blt _020F26DC
	cmp r0, #0
	bne _020F271C
	b _020F2724
_020F26B4:
	cmp r0, #0
	beq _020F26FC
	b _020F26DC
_020F26C0:
	movs r1, r1, lsl #1
	beq _020F26E4
	mov r1, r1, lsr #1
	mov ip, #1
	orr ip, ip, r2, lsr #23
	orr r3, r3, r2, lsr #23
	b _020F250C
_020F26DC:
	mov r0, r1
	bx lr
_020F26E4:
	cmp r0, #0
	subges r3, r3, #1
	add r0, r0, r0
	orr r0, r2, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bx lr
_020F26FC:
	mov r0, #0
	bx lr
_020F2704: ; 0x020F2704
	cmp r0, #0
	subges r3, r3, #1
	add r0, r0, r0
	mov r0, r0, lsr #9
	orr r0, r0, r3, lsl #23
	bx lr
_020F271C:
	mvn r0, #0x80000000
	bx lr
_020F2724:
	mov r0, #0xff000000
	orr r0, r2, r0, lsr #1
	bx lr
_020F2730:
	mvn r0, #0x80000000
	bx lr
_020F2738:
	mvn r0, #0x80000000
	bx lr

	.public _ll_mod
	.type _ll_mod, @function
_ll_mod: ; 0x020F2740
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, r1
	orr r4, r4, #1
	b _020F2760

	.public _ll_sdiv
	.type _ll_sdiv, @function
	.public _ll_div
	.type _ll_div, @function
_ll_sdiv: ; 0x020F2750
_ll_div: ; 0x020F2750
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	eor r4, r1, r3
	mov r4, r4, asr #1
	mov r4, r4, lsl #1
_020F2760:
	orrs r5, r3, r2
	bne _020F2770
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_020F2770:
	mov r5, r0, lsr #0x1f
	add r5, r5, r1
	mov r6, r2, lsr #0x1f
	add r6, r6, r3
	orrs r6, r5, r6
	bne _020F27A4
	mov r1, r2
	bl _s32_div_f
	ands r4, r4, #1
	movne r0, r1
	mov r1, r0, asr #0x1f
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_020F27A4:
	cmp r1, #0
	bge _020F27B4
	rsbs r0, r0, #0
	rsc r1, r1, #0
_020F27B4:
	cmp r3, #0
	bge _020F27C4
	rsbs r2, r2, #0
	rsc r3, r3, #0
_020F27C4:
	orrs r5, r1, r0
	beq _020F28E8
	mov r5, #0
	mov r6, #1
	cmp r3, #0
	bmi _020F27F0
_020F27DC:
	add r5, r5, #1
	adds r2, r2, r2
	adcs r3, r3, r3
	bpl _020F27DC
	add r6, r6, r5
_020F27F0:
	cmp r1, #0
	blt _020F2810
_020F27F8:
	cmp r6, #1
	beq _020F2810
	sub r6, r6, #1
	adds r0, r0, r0
	adcs r1, r1, r1
	bpl _020F27F8
_020F2810:
	mov r7, #0
	mov ip, #0
	mov fp, #0
	b _020F2838
_020F2820:
	orr ip, ip, #1
	subs r6, r6, #1
	beq _020F2890
	adds r0, r0, r0
	adcs r1, r1, r1
	adcs r7, r7, r7
_020F2838:
	subs r0, r0, r2
	sbcs r1, r1, r3
	sbcs r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _020F2820
_020F2854:
	subs r6, r6, #1
	beq _020F2888
	adds r0, r0, r0
	adcs r1, r1, r1
	adc r7, r7, r7
	adds r0, r0, r2
	adcs r1, r1, r3
	adc r7, r7, #0
	adds ip, ip, ip
	adc fp, fp, fp
	cmp r7, #0
	bge _020F2820
	b _020F2854
_020F2888:
	adds r0, r0, r2
	adc r1, r1, r3
_020F2890:
	ands r7, r4, #1
	moveq r0, ip
	moveq r1, fp
	beq _020F28C8
	subs r7, r5, #0x20
	movge r0, r1, lsr r7
	bge _020F28EC
	rsb r7, r5, #0x20
	mov r0, r0, lsr r5
	orr r0, r0, r1, lsl r7
	mov r1, r1, lsr r5
	b _020F28C8
_020F28C0: ; 0x020F28C0
	mov r0, r1, lsr r7
	mov r1, #0
_020F28C8:
	cmp r4, #0
	blt _020F28D8
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_020F28D8:
	rsbs r0, r0, #0
	rsc r1, r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_020F28E8:
	mov r0, #0
_020F28EC:
	mov r1, #0
	cmp r4, #0
	blt _020F28D8
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr

	.public _ll_udiv
	.type _ll_udiv, @function
	.public _ull_div
	.type _ull_div, @function
_ll_udiv: ; 0x020F2900
_ull_div:
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #0
	b _020F2914

	.public _ull_mod
	.type _ull_mod, @function
_ull_mod: ; 0x020F290C
	stmdb sp!, {r4, r5, r6, r7, fp, ip, lr}
	mov r4, #1
_020F2914:
	orrs r5, r3, r2
	bne _020F2924
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr
_020F2924:
	orrs r5, r1, r3
	bne _020F27C4
	mov r1, r2
	bl _u32_div_not_0_f
	cmp r4, #0
	movne r0, r1
	mov r1, #0
	ldmia sp!, {r4, r5, r6, r7, fp, ip, lr}
	bx lr

	.public _ll_mul
	.type _ll_mul, @function
	.public _ull_mul
	.type _ull_mul, @function
_ll_mul: ; 0x020F2948
_ull_mul: ; 0x020F2948
	stmdb sp!, {r4, r5, lr}
	umull r5, r4, r0, r2
	mla r4, r0, r3, r4
	mla r4, r2, r1, r4
	mov r1, r4
	mov r0, r5
	ldmia sp!, {r4, r5, lr}
	bx lr

	.public _ll_shl
	.type _ll_shl, @function
	.public _ll_sll
	.type _ll_sll, @function
	.public _ull_sll
	.type _ull_sll, @function
_ll_shl: ; 0x020F2968
_ll_sll:
_ull_sll:
	ands r2, r2, #0x3f
	bxeq lr
	subs r3, r2, #0x20
	bge _020F298C
	rsb r3, r2, #0x20
	mov r1, r1, lsl r2
	orr r1, r1, r0, lsr r3
	mov r0, r0, lsl r2
	bx lr
_020F298C:
	mov r1, r0, lsl r3
	mov r0, #0
	bx lr

	.public _s32_div_f
	.type _s32_div_f, @function
_s32_div_f: ; 0x020F2998
	eor ip, r0, r1
	and ip, ip, #0x80000000
	cmp r0, #0
	rsblt r0, r0, #0
	addlt ip, ip, #1
	cmp r1, #0
	rsblt r1, r1, #0
	beq _020F2B90
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	blo _020F2B90
	mov r2, #0x1c
	mov r3, r0, lsr #4
	cmp r1, r3, lsr #12
	suble r2, r2, #0x10
	movle r3, r3, lsr #0x10
	cmp r1, r3, lsr #4
	suble r2, r2, #8
	movle r3, r3, lsr #8
	cmp r1, r3
	suble r2, r2, #4
	movle r3, r3, lsr #4
	mov r0, r0, lsl r2
	rsb r1, r1, #0
	adds r0, r0, r0
	add r2, r2, r2, lsl #1
	add pc, pc, r2, lsl #2
	nop
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	mov r1, r3
_020F2B90:
	ands r3, ip, #0x80000000
	rsbne r0, r0, #0
	ands r3, ip, #1
	rsbne r1, r1, #0
	bx lr

	.public _u32_div_f
	.type _u32_div_f, @function
_u32_div_f: ; 0x020F2BA4
	cmp r1, #0
	bxeq lr
	.public _u32_div_not_0_f
	.type _u32_div_not_0_f, @function
_u32_div_not_0_f: ; 0x020F2BAC
	cmp r0, r1
	movlo r1, r0
	movlo r0, #0
	bxlo lr
	mov r2, #0x1c
	mov r3, r0, lsr #4
	cmp r1, r3, lsr #12
	suble r2, r2, #0x10
	movle r3, r3, lsr #0x10
	cmp r1, r3, lsr #4
	suble r2, r2, #8
	movle r3, r3, lsr #8
	cmp r1, r3
	suble r2, r2, #4
	movle r3, r3, lsr #4
	mov r0, r0, lsl r2
	rsb r1, r1, #0
	adds r0, r0, r0
	add r2, r2, r2, lsl #1
	add pc, pc, r2, lsl #2
	nop
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	adcs r3, r1, r3, lsl #1
	sublo r3, r3, r1
	adcs r0, r0, r0
	mov r1, r3
	bx lr

	.public _drdiv
	.type _drdiv, @function
_drdiv: ; 0x020F2D88
	eor r1, r1, r3
	eor r3, r1, r3
	eor r1, r1, r3
	eor r0, r0, r2
	eor r2, r0, r2
	eor r0, r0, r2
	.public _ddiv
	.type _ddiv, @function
	.public _d_div
	.type _d_div, @function
_ddiv: ; 0x020F2DA0
_d_div:
	stmdb sp!, {r4, r5, r6, lr}
	ldr lr, _020F32E0 ; =0x00000FFE
	eor r4, r1, r3
	ands ip, lr, r1, lsr #19
	cmpne ip, lr
	beq _020F314C
	bic r1, r1, lr, lsl #20
	orr r1, r1, #0x100000
	add ip, ip, r4, lsr #31
_020F2DC4:
	ands r4, lr, r3, lsr #19
	cmpne r4, lr
	beq _020F31E4
	bic r3, r3, lr, lsl #20
	orr r3, r3, #0x100000
_020F2DD8:
	sub ip, ip, r4
	cmp r1, r3
	cmpeq r0, r2
	bhs _020F2DF4
	adds r0, r0, r0
	adc r1, r1, r1
	sub ip, ip, #2
_020F2DF4:
	adr r4, UNK_020F2ED8 - 0x100
	ldrb lr, [r4, r3, lsr #12]
	rsbs r2, r2, #0
	rsc r3, r3, #0
	mov r4, #0x20000000
	mla r5, lr, r3, r4
	mov r6, r3, lsl #0xa
	mov r5, r5, lsr #7
	mul lr, r5, lr
	orr r6, r6, r2, lsr #22
	mov lr, lr, lsr #0xd
	mul r5, lr, r6
	mov r6, r1, lsl #0xa
	orr r6, r6, r0, lsr #22
	mov r5, r5, lsr #0x10
	mul r5, lr, r5
	mov lr, lr, lsl #0xe
	add lr, lr, r5, lsr #16
	umull r5, r6, lr, r6
	umull r4, r5, r6, r2
	mla r5, r3, r6, r5
	mov r4, r4, lsr #0x1a
	orr r4, r4, r5, lsl #6
	add r4, r4, r0, lsl #2
	umull lr, r5, r4, lr
	mov r4, #0
	adds r5, r5, r6, lsl #24
	adc r4, r4, r6, lsr #8
	cmp ip, #0x800
	bge _020F2FD8
	add ip, ip, #0x7f0
	adds ip, ip, #0xc
	bmi _020F2FF0
	orr r1, r4, ip, lsl #31
	bic ip, ip, #1
	add r1, r1, ip, lsl #19
	tst lr, #0x80000000
	bne _020F2EC8
	rsbs r2, r2, #0
	mov r4, r4, lsl #1
	add r4, r4, r5, lsr #31
	mul lr, r2, r4
	mov r6, #0
	mov r4, r5, lsl #1
	orr r4, r4, #1
	umlal r6, lr, r4, r2
	rsc r3, r3, #0
	mla lr, r4, r3, lr
	cmp lr, r0, lsl #21
	bmi _020F2EC8
	mov r0, r5
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F2EC8:
	adds r0, r5, #1
	adc r1, r1, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
UNK_020F2ED8: ; 0x020F2ED8
	.byte 0xFF, 0xFF, 0xFE, 0xFD, 0xFC, 0xFB, 0xFA, 0xF9
	.byte 0xF8, 0xF7, 0xF6, 0xF5, 0xF4, 0xF3, 0xF2, 0xF1, 0xF0, 0xF0, 0xEF, 0xEE, 0xED, 0xEC, 0xEB, 0xEA
	.byte 0xEA, 0xE9, 0xE8, 0xE7, 0xE6, 0xE6, 0xE5, 0xE4, 0xE3, 0xE2, 0xE2, 0xE1, 0xE0, 0xDF, 0xDF, 0xDE
	.byte 0xDD, 0xDC, 0xDC, 0xDB, 0xDA, 0xD9, 0xD9, 0xD8, 0xD7, 0xD7, 0xD6, 0xD5, 0xD4, 0xD4, 0xD3, 0xD2
	.byte 0xD2, 0xD1, 0xD0, 0xD0, 0xCF, 0xCE, 0xCE, 0xCD, 0xCC, 0xCC, 0xCB, 0xCB, 0xCA, 0xC9, 0xC9, 0xC8
	.byte 0xC8, 0xC7, 0xC6, 0xC6, 0xC5, 0xC5, 0xC4, 0xC3, 0xC3, 0xC2, 0xC2, 0xC1, 0xC0, 0xC0, 0xBF, 0xBF
	.byte 0xBE, 0xBE, 0xBD, 0xBD, 0xBC, 0xBC, 0xBB, 0xBA, 0xBA, 0xB9, 0xB9, 0xB8, 0xB8, 0xB7, 0xB7, 0xB6
	.byte 0xB6, 0xB5, 0xB5, 0xB4, 0xB4, 0xB3, 0xB3, 0xB2, 0xB2, 0xB1, 0xB1, 0xB0, 0xB0, 0xAF, 0xAF, 0xAF
	.byte 0xAE, 0xAE, 0xAD, 0xAD, 0xAC, 0xAC, 0xAB, 0xAB, 0xAA, 0xAA, 0xAA, 0xA9, 0xA9, 0xA8, 0xA8, 0xA7
	.byte 0xA7, 0xA7, 0xA6, 0xA6, 0xA5, 0xA5, 0xA4, 0xA4, 0xA4, 0xA3, 0xA3, 0xA2, 0xA2, 0xA2, 0xA1, 0xA1
	.byte 0xA0, 0xA0, 0xA0, 0x9F, 0x9F, 0x9E, 0x9E, 0x9E, 0x9D, 0x9D, 0x9D, 0x9C, 0x9C, 0x9B, 0x9B, 0x9B
	.byte 0x9A, 0x9A, 0x9A, 0x99, 0x99, 0x99, 0x98, 0x98, 0x98, 0x97, 0x97, 0x96, 0x96, 0x96, 0x95, 0x95
	.byte 0x95, 0x94, 0x94, 0x94, 0x93, 0x93, 0x93, 0x92, 0x92, 0x92, 0x91, 0x91, 0x91, 0x91, 0x90, 0x90
	.byte 0x90, 0x8F, 0x8F, 0x8F, 0x8E, 0x8E, 0x8E, 0x8D, 0x8D, 0x8D, 0x8C, 0x8C, 0x8C, 0x8C, 0x8B, 0x8B
	.byte 0x8B, 0x8A, 0x8A, 0x8A, 0x8A, 0x89, 0x89, 0x89, 0x88, 0x88, 0x88, 0x88, 0x87, 0x87, 0x87, 0x86
	.byte 0x86, 0x86, 0x86, 0x85, 0x85, 0x85, 0x85, 0x84, 0x84, 0x84, 0x83, 0x83, 0x83, 0x83, 0x82, 0x82
	.byte 0x82, 0x82, 0x81, 0x81, 0x81, 0x81, 0x80, 0x80
_020F2FD8:
	movs r1, ip, lsl #0x1f
	orr r1, r1, #0x7f000000
	orr r1, r1, #0xf00000
	mov r0, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F2FF0:
	mvn r6, ip, asr #1
	cmp r6, #0x34
	bgt _020F313C
	beq _020F3118
	cmp r6, #0x14
	bge _020F3038
	rsb r6, r6, #0x13
	mov lr, r0, lsl r6
	rsb r6, r6, #0x14
	mov r0, r5, lsr r6
	rsb r6, r6, #0x20
	orr r0, r0, r4, lsl r6
	rsb r6, r6, #0x20
	mov r4, r4, lsr r6
	orr r1, r4, ip, lsl #31
	mov ip, lr
	mov lr, #0
	b _020F3068
_020F3038:
	rsb r6, r6, #0x33
	mov lr, r1, lsl r6
	mov r1, ip, lsl #0x1f
	rsb r6, r6, #0x20
	orr ip, lr, r0, lsr r6
	rsb r6, r6, #0x20
	mov lr, r0, lsl r6
	mov r5, r5, lsr #0x15
	orr r5, r5, r4, lsl #11
	rsb r6, r6, #0x1f
	mov r0, r5, lsr r6
	mov r4, #0
_020F3068:
	rsbs r2, r2, #0
	mul r4, r2, r4
	mov r5, #0
	umlal r5, r4, r2, r0
	rsc r3, r3, #0
	mla r4, r0, r3, r4
	cmp r4, ip
	cmpeq r5, lr
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
	adds r5, r5, r2
	adc r4, r4, r3
	cmp r4, ip
	bmi _020F310C
	bne _020F30B0
	cmp r5, lr
	beq _020F30FC
	blo _020F310C
_020F30B0:
	subs r5, r5, r2
	sbc r4, r4, r3
_020F30B8:
	adds r5, r5, r5
	adc r4, r4, r4
	adds r5, r5, r2
	adc r4, r4, r3
	adds lr, lr, lr
	adc ip, ip, ip
	cmp r4, ip
	bmi _020F30FC
	ldmneia sp!, {r4, r5, r6, lr}
	bxne lr
	cmp r5, lr
	blo _020F30FC
	ldmneia sp!, {r4, r5, r6, lr}
	bxne lr
	tst r0, #1
	ldmeqia sp!, {r4, r5, r6, lr}
	bxeq lr
_020F30FC:
	adds r0, r0, #1
	adc r1, r1, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F310C:
	adds r0, r0, #1
	adc r1, r1, #0
	b _020F30B8
_020F3118:
	rsbs r2, r2, #0
	rsc r3, r3, #0
	cmp r1, r3
	cmpeq r0, r2
	mov r1, ip, lsl #0x1f
	mov r0, #0
	movne r0, #1
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F313C:
	mov r1, ip, lsl #0x1f
	mov r0, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F314C:
	orrs r5, r0, r1, lsl #1
	beq _020F3270
	cmp ip, lr
	beq _020F31B4
	movs r1, r1, lsl #0xc
	beq _020F3190
	clz r5, r1
	movs r1, r1, lsl r5
	sub ip, ip, r5
	add r5, ip, #0x1f
	mov r1, r1, lsr #0xb
	orr r1, r1, r0, lsr r5
	rsb r5, r5, #0x20
	mov r0, r0, lsl r5
	mov ip, ip, lsl #1
	orr ip, ip, r4, lsr #31
	b _020F2DC4
_020F3190:
	mvn ip, #0x13
	clz r5, r0
	movs r0, r0, lsl r5
	sub ip, ip, r5
	mov r1, r0, lsr #0xb
	mov r0, r0, lsl #0x15
	mov ip, ip, lsl #1
	orr ip, ip, r4, lsr #31
	b _020F2DC4
_020F31B4:
	orrs r5, r0, r1, lsl #12
	bne _020F3298
	bic r5, r3, #0x80000000
	cmp r5, lr, lsl #19
	bhs _020F31D8
	and r5, r3, #0x80000000
	eor r1, r5, r1
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F31D8:
	orrs r5, r2, r3, lsl #12
	bne _020F32B8
	b _020F32D0
_020F31E4:
	orrs r5, r2, r3, lsl #1
	beq _020F325C
	cmp r4, lr
	beq _020F3244
	movs r3, r3, lsl #0xc
	beq _020F3224
	clz r5, r3
	movs r3, r3, lsl r5
	sub r4, r4, r5
	add r5, r4, #0x1f
	mov r3, r3, lsr #0xb
	orr r3, r3, r2, lsr r5
	rsb r5, r5, #0x20
	mov r2, r2, lsl r5
	mov r4, r4, lsl #1
	b _020F2DD8
_020F3224:
	mvn r4, #0x13
	clz r5, r2
	movs r2, r2, lsl r5
	sub r4, r4, r5
	mov r3, r2, lsr #0xb
	mov r2, r2, lsl #0x15
	mov r4, r4, lsl #1
	b _020F2DD8
_020F3244:
	orrs r5, r2, r3, lsl #12
	bne _020F32B8
	mov r1, ip, lsl #0x1f
	mov r0, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F325C:
	mov r1, ip, lsl #0x1f
	orr r1, r1, lr, lsl #19
	mov r0, #0
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F3270:
	orrs r5, r2, r3, lsl #1
	beq _020F32D0
	bic r5, r3, #0x80000000
	cmp r5, lr, lsl #19
	cmpeq r2, #0
	bhi _020F32B8
	eor r1, r1, r3
	and r1, r1, #0x80000000
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F3298:
	tst r1, #0x80000
	beq _020F32D0
	bic r5, r3, #0x80000000
	cmp r5, lr, lsl #19
	cmpeq r2, #0
	bhi _020F32B8
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F32B8:
	tst r3, #0x80000
	beq _020F32D0
	mov r1, r3
	mov r0, r2
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
_020F32D0:
	orr r1, r1, #0x7f000000
	orr r1, r1, #0xf80000
	ldmia sp!, {r4, r5, r6, lr}
	bx lr
	.align 2, 0
_020F32E0: .word 0x00000FFE

	.public _fp_init
	.type _fp_init, @function
_fp_init: ; 0x020F32E4
	bx lr

	; NITRO_Runtime_Ai_LE.a

	arm_func_start sys_writec
sys_writec: ; 0x020F32E8
	str lr, [sp, #-4]!
	mov r1, r0
	mov r0, #3
	swi 0x123456
	ldr pc, [sp], #4
	arm_func_end sys_writec

	arm_func_start sys_readc
sys_readc: ; 0x020F32FC
	str lr, [sp, #-4]!
	mov r1, #0
	mov r0, #7
	swi 0x123456
	ldr pc, [sp], #4
	arm_func_end sys_readc

	arm_func_start sys_exit
sys_exit: ; 0x020F3310
	mov r1, #0
	mov r0, #0x18
	swi 0x123456
	mov pc, lr
	arm_func_end sys_exit

	arm_func_start __read_console
__read_console: ; 0x020F3320
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r6, r2
	ldr r5, [r6]
	mov r7, r1
	cmp r5, #0
	mov r4, #0
	bls _020F3368
_020F333C:
	bl sys_readc
	and r1, r0, #0xff
	cmp r1, #0xd
	strb r0, [r7, r4]
	cmpne r1, #0xa
	addeq r0, r4, #1
	streq r0, [r6]
	beq _020F3368
	add r4, r4, #1
	cmp r4, r5
	blo _020F333C
_020F3368:
	mov r0, #0
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end __read_console

	arm_func_start __write_console
__write_console: ; 0x020F3370
	stmdb sp!, {r4, r5, r6, lr}
	ldr r5, [r2]
	mov r6, r1
	cmp r5, #0
	mov r4, #0
	bls _020F339C
_020F3388:
	add r0, r6, r4
	bl sys_writec
	add r4, r4, #1
	cmp r4, r5
	blo _020F3388
_020F339C:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end __write_console

	arm_func_start __close_console
__close_console: ; 0x020F33A4
	mov r0, #0
	bx lr
	arm_func_end __close_console

	arm_func_start _Z20__DecodeSignedNumberPcPl
_Z20__DecodeSignedNumberPcPl: ; 0x020F33AC
	stmdb sp!, {r4, lr}
	ldrsb r2, [r0]
	tst r2, #1
	bne _020F33CC
	mov r2, r2, asr #1
	str r2, [r1]
	add r0, r0, #1
	ldmia sp!, {r4, pc}
_020F33CC:
	tst r2, #2
	ldrb r4, [r0, #1]
	bne _020F33EC
	mov r2, r2, asr #2
	orr r2, r4, r2, lsl #8
	str r2, [r1]
	add r0, r0, #2
	ldmia sp!, {r4, pc}
_020F33EC:
	tst r2, #4
	ldrb lr, [r0, #2]
	bne _020F3414
	mov r3, r2, asr #3
	mov r2, r4, lsl #8
	orr r2, r2, r3, lsl #16
	orr r2, lr, r2
	str r2, [r1]
	add r0, r0, #3
	ldmia sp!, {r4, pc}
_020F3414:
	ldrb ip, [r0, #3]
	mov r3, r2, asr #3
	mov r2, r4, lsl #0x10
	orr r2, r2, r3, lsl #24
	orr r2, r2, lr, lsl #8
	orr r2, ip, r2
	str r2, [r1]
	add r0, r0, #4
	ldmia sp!, {r4, pc}
	arm_func_end _Z20__DecodeSignedNumberPcPl

	arm_func_start _Z22__DecodeUnsignedNumberPcPm
_Z22__DecodeUnsignedNumberPcPm: ; 0x020F3438
	stmdb sp!, {r4, lr}
	ldrb r2, [r0]
	tst r2, #1
	bne _020F3458
	mov r2, r2, lsr #1
	str r2, [r1]
	add r0, r0, #1
	ldmia sp!, {r4, pc}
_020F3458:
	tst r2, #2
	ldrb r4, [r0, #1]
	bne _020F3478
	mov r2, r2, lsr #2
	orr r2, r4, r2, lsl #8
	str r2, [r1]
	add r0, r0, #2
	ldmia sp!, {r4, pc}
_020F3478:
	tst r2, #4
	ldrb lr, [r0, #2]
	bne _020F34A0
	mov r3, r2, lsr #3
	mov r2, r4, lsl #8
	orr r2, r2, r3, lsl #16
	orr r2, lr, r2
	str r2, [r1]
	add r0, r0, #3
	ldmia sp!, {r4, pc}
_020F34A0:
	ldrb ip, [r0, #3]
	mov r3, r2, lsr #3
	mov r2, r4, lsl #0x10
	orr r2, r2, r3, lsl #24
	orr r2, r2, lr, lsl #8
	orr r2, ip, r2
	str r2, [r1]
	add r0, r0, #4
	ldmia sp!, {r4, pc}
	arm_func_end _Z22__DecodeUnsignedNumberPcPm

	arm_func_start _Z12BinarySearchP19ExceptionTableIndexmPc
_Z12BinarySearchP19ExceptionTableIndexmPc: ; 0x020F34C4
	stmdb sp!, {r4, r5, r6, lr}
	subs r6, r1, #1
	mov r5, #0
	bmi _020F3520
	mov r1, #0xc
_020F34D8:
	add r3, r5, r6
	mov r4, r3, asr #1
	mul r3, r4, r1
	ldr ip, [r0, r3]
	add lr, r0, r3
	cmp r2, ip
	sublo r6, r4, #1
	blo _020F3518
	ldr r3, [lr, #4]
	bic r3, r3, #1
	add r3, ip, r3
	cmp r2, r3
	addhi r5, r4, #1
	bhi _020F3518
	mov r0, lr
	ldmia sp!, {r4, r5, r6, pc}
_020F3518:
	cmp r5, r6
	ble _020F34D8
_020F3520:
	mov r0, #0
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end _Z12BinarySearchP19ExceptionTableIndexmPc

	arm_func_start _Z19FindExceptionRecordPcP13ExceptionInfo
_Z19FindExceptionRecordPcP13ExceptionInfo: ; 0x020F3528
	stmdb sp!, {r4, r5, r6, r7, r8, sb, lr}
	sub sp, sp, #0xc
	mov r4, r0
	mov sb, r1
	mov r2, #0
	str r2, [sb, #4]
	mov r0, sb
	mov r1, r4
	str r2, [sb, #8]
	bl _Z20__FindExceptionTableP13ExceptionInfoPc
	cmp r0, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r0, [sb, #0xc]
	ldr r1, [sb, #0x10]
	ldr r3, _020F362C ; =0x2AAAAAAB
	sub r5, r1, r0
	smull r2, r1, r3, r5
	mov r3, r5, lsr #0x1f
	mov r2, r4
	add r1, r3, r1, asr #1
	bl _Z12BinarySearchP19ExceptionTableIndexmPc
	cmp r0, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [r0, #4]
	tst r1, #1
	addne r1, r0, #8
	ldreq r1, [r0, #8]
	str r1, [sb, #4]
	ldr r1, [r0]
	str r1, [sb]
	ldr r1, [r0]
	ldr r0, [sb, #4]
	sub r7, r4, r1
	bl _Z16__SkipUnwindInfoPc
	mov r8, #0
	add r5, sp, #4
	add r4, sp, #0
	add r6, sp, #8
_020F35C8:
	mov r1, r6
	bl _Z22__DecodeUnsignedNumberPcPm
	ldr r1, [sp, #8]
	cmp r1, #0
	addeq sp, sp, #0xc
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, pc}
	mov r1, r5
	bl _Z22__DecodeUnsignedNumberPcPm
	mov r1, r4
	bl _Z22__DecodeUnsignedNumberPcPm
	ldr r1, [sp, #8]
	add r2, r8, r1
	cmp r7, r2
	addlo sp, sp, #0xc
	ldmloia sp!, {r4, r5, r6, r7, r8, sb, pc}
	ldr r1, [sp, #4]
	add r8, r2, r1
	cmp r7, r8
	bhi _020F35C8
	ldr r1, [sb, #4]
	ldr r0, [sp]
	add r0, r1, r0
	str r0, [sb, #8]
	add sp, sp, #0xc
	ldmia sp!, {r4, r5, r6, r7, r8, sb, pc}
	.align 2, 0
_020F362C: .word 0x2AAAAAAB
	arm_func_end _Z19FindExceptionRecordPcP13ExceptionInfo

	arm_func_start _Z13CurrentActionPK14ActionIterator
_Z13CurrentActionPK14ActionIterator: ; 0x020F3630
	ldr r0, [r0, #8]
	cmp r0, #0
	ldrneb r0, [r0]
	andne r0, r0, #0x1f
	moveq r0, #0
	and r0, r0, #0xff
	bx lr
	arm_func_end _Z13CurrentActionPK14ActionIterator

	arm_func_start _Z10NextActionP14ActionIterator
_Z10NextActionP14ActionIterator: ; 0x020F364C
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0xa0
	mov r4, r0
_020F3658:
	ldr r2, [r4, #8]
	cmp r2, #0
	beq _020F3670
	ldrb r0, [r2]
	tst r0, #0x80
	beq _020F36B4
_020F3670:
	mov r1, r4
	add r0, r4, #0x18
	bl _Z15__PopStackFrameP12ThrowContextP13ExceptionInfo
	mov r1, r4
	bl _Z19FindExceptionRecordPcP13ExceptionInfo
	ldr r0, [r4, #4]
	cmp r0, #0
	addeq sp, sp, #0xa0
	moveq r0, #0xff
	ldmeqia sp!, {r3, r4, r5, pc}
	mov r1, r4
	add r0, r4, #0x18
	bl _Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _020F3658
	b _020F3984
_020F36B4:
	and r0, r0, #0x1f
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _020F3978
_020F36C4: ; jump table
	b _020F3978 ; case 0
	b _020F3978 ; case 1
	b _020F3714 ; case 2
	b _020F372C ; case 3
	b _020F374C ; case 4
	b _020F3764 ; case 5
	b _020F378C ; case 6
	b _020F37AC ; case 7
	b _020F37CC ; case 8
	b _020F37F4 ; case 9
	b _020F3824 ; case 10
	b _020F383C ; case 11
	b _020F385C ; case 12
	b _020F3878 ; case 13
	b _020F3978 ; case 14
	b _020F388C ; case 15
	b _020F38B8 ; case 16
	b _020F3904 ; case 17
	b _020F3938 ; case 18
	b _020F3964 ; case 19
_020F3714:
	add r1, sp, #0x9c
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F372C:
	add r1, sp, #0x94
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x98
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F374C:
	add r1, sp, #0x90
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F3764:
	add r1, sp, #0x84
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x88
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x8c
	bl _Z22__DecodeUnsignedNumberPcPm
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F378C:
	add r1, sp, #0x7c
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x80
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F37AC:
	add r1, sp, #0x74
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x78
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F37CC:
	add r1, sp, #0x68
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x6c
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x70
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F37F4:
	add r1, sp, #0x58
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x5c
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x60
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x64
	bl _Z22__DecodeUnsignedNumberPcPm
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F3824:
	add r1, sp, #0x54
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F383C:
	add r1, sp, #0x4c
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x50
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F385C:
	add r1, sp, #0x44
	add r0, r2, #5
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x48
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [r4, #8]
	b _020F3984
_020F3878:
	add r1, sp, #0x40
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [r4, #8]
	b _020F3984
_020F388C:
	add r1, sp, #0x34
	add r0, r2, #1
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x38
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x3c
	bl _Z20__DecodeSignedNumberPcPl
	ldr r1, [sp, #0x34]
	add r0, r0, r1, lsl #2
	str r0, [r4, #8]
	b _020F3984
_020F38B8:
	add r1, sp, #0x24
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x28
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	orr r2, r1, r5, lsl #24
	add r1, sp, #0x2c
	add r0, r0, #4
	str r2, [sp, #0x30]
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F3904:
	add r1, sp, #0x14
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x1c
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x18
	add r0, r0, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F3938:
	add r1, sp, #8
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0xc
	add r0, r0, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x10
	bl _Z22__DecodeUnsignedNumberPcPm
	add r0, r0, #4
	str r0, [r4, #8]
	b _020F3984
_020F3964:
	add r1, sp, #4
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [r4, #8]
	b _020F3984
_020F3978:
	add sp, sp, #0xa0
	mov r0, #0xff
	ldmia sp!, {r3, r4, r5, pc}
_020F3984:
	ldr r2, [r4, #8]
	ldrb r0, [r2]
	and r0, r0, #0x1f
	cmp r0, #1
	addne sp, sp, #0xa0
	ldmneia sp!, {r3, r4, r5, pc}
	add r5, sp, #0
_020F39A0:
	mov r1, r5
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	ldr r1, [r4, #8]
	ldr r0, [sp]
	add r2, r1, r0
	str r2, [r4, #8]
	ldrb r0, [r2]
	and r0, r0, #0x1f
	cmp r0, #1
	beq _020F39A0
	add sp, sp, #0xa0
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end _Z10NextActionP14ActionIterator

	arm_func_start _Z11UnwindStackP12ThrowContextP13ExceptionInfoPc
_Z11UnwindStackP12ThrowContextP13ExceptionInfoPc: ; 0x020F39D4
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa4
	mov sb, r0
	mov r8, r1
	str r2, [sp]
_020F39E8:
	ldr r2, [r8, #8]
	cmp r2, #0
	bne _020F3A30
	mov r0, sb
	mov r1, r8
	bl _Z15__PopStackFrameP12ThrowContextP13ExceptionInfo
	mov r1, r8
	bl _Z19FindExceptionRecordPcP13ExceptionInfo
	ldr r0, [r8, #4]
	cmp r0, #0
	bne _020F3A18
	bl _ZSt9terminatev
_020F3A18:
	mov r0, sb
	mov r1, r8
	bl _Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo
	ldr r2, [r8, #8]
	cmp r2, #0
	beq _020F39E8
_020F3A30:
	ldrb r7, [r2]
	and r0, r7, #0x1f
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _020F4268
_020F3A44: ; jump table
	b _020F4268 ; case 0
	b _020F3A94 ; case 1
	b _020F3AB4 ; case 2
	b _020F3B00 ; case 3
	b _020F3B80 ; case 4
	b _020F3BE0 ; case 5
	b _020F3C64 ; case 6
	b _020F3CD4 ; case 7
	b _020F3D44 ; case 8
	b _020F3DEC ; case 9
	b _020F3EA0 ; case 10
	b _020F3EFC ; case 11
	b _020F3F8C ; case 12
	b _020F3FB8 ; case 13
	b _020F4268 ; case 14
	b _020F4004 ; case 15
	b _020F4040 ; case 16
	b _020F40E4 ; case 17
	b _020F4190 ; case 18
	b _020F4254 ; case 19
_020F3A94:
	add r1, sp, #0xa0
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	ldr r1, [r8, #8]
	ldr r0, [sp, #0xa0]
	add r0, r1, r0
	str r0, [r8, #8]
	b _020F426C
_020F3AB4:
	add r1, sp, #0x9c
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	mov r4, r0
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	orr r0, r1, r0, lsl #8
	orr r0, r0, r2, lsl #16
	ldr r5, [sb, #0x18]
	ldr r1, [sp, #0x9c]
	orr r2, r0, r3, lsl #24
	add r0, r5, r1
	mvn r1, #0
	blx r2
	add r0, r4, #4
	str r0, [r8, #8]
	b _020F426C
_020F3B00:
	add r1, sp, #0x94
	add r0, r2, #1
	and r4, r7, #0x40
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x98
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r2, r1, r5, lsl #24
	add r4, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x94]
	ldreqb r0, [r1, r0]
	beq _020F3B5C
	ldr r0, [sp, #0x94]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
	and r0, r0, #0xff
_020F3B5C:
	cmp r0, #0
	beq _020F3B78
	ldr r3, [sb, #0x18]
	ldr r0, [sp, #0x98]
	mvn r1, #0
	add r0, r3, r0
	blx r2
_020F3B78:
	str r4, [r8, #8]
	b _020F426C
_020F3B80:
	add r1, sp, #0x90
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r2, r1, r5, lsl #24
	add r4, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x90]
	ldreq r0, [r1, r0]
	beq _020F3BD0
	ldr r0, [sp, #0x90]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
_020F3BD0:
	mvn r1, #0
	blx r2
	str r4, [r8, #8]
	b _020F426C
_020F3BE0:
	add r1, sp, #0x84
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x88
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x8c
	bl _Z22__DecodeUnsignedNumberPcPm
	ldr r3, [sb, #0x18]
	ldr r2, [sp, #0x84]
	ldr r6, [sp, #0x88]
	ldrb r5, [r0]
	ldrb r4, [r0, #1]
	ldr r1, [sp, #0x8c]
	add r2, r3, r2
	ldrb sl, [r0, #2]
	orr r3, r5, r4, lsl #8
	mla r4, r6, r1, r2
	ldrb r2, [r0, #3]
	orr r1, r3, sl, lsl #16
	cmp r6, #0
	orr r5, r1, r2, lsl #24
	add fp, r0, #4
	beq _020F3C5C
	mvn sl, #0
_020F3C40:
	ldr r0, [sp, #0x8c]
	mov r1, sl
	sub r4, r4, r0
	mov r0, r4
	blx r5
	subs r6, r6, #1
	bne _020F3C40
_020F3C5C:
	str fp, [r8, #8]
	b _020F426C
_020F3C64:
	add r1, sp, #0x7c
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x80
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r2, r1, r5, lsl #24
	add r4, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x7c]
	ldreq r3, [r1, r0]
	beq _020F3CBC
	ldr r0, [sp, #0x7c]
	add r0, sb, r0, lsl #2
	ldr r3, [r0, #0x1c]
_020F3CBC:
	ldr r0, [sp, #0x80]
	mov r1, #0
	add r0, r3, r0
	blx r2
	str r4, [r8, #8]
	b _020F426C
_020F3CD4:
	add r1, sp, #0x74
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x78
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r2, r1, r5, lsl #24
	add r4, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x74]
	ldreq r3, [r1, r0]
	beq _020F3D2C
	ldr r0, [sp, #0x74]
	add r0, sb, r0, lsl #2
	ldr r3, [r0, #0x1c]
_020F3D2C:
	ldr r0, [sp, #0x78]
	mvn r1, #0
	add r0, r3, r0
	blx r2
	str r4, [r8, #8]
	b _020F426C
_020F3D44:
	add r1, sp, #0x68
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x6c
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x70
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	orr r2, r1, r5, lsl #24
	tst r7, #0x40
	add r5, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x68]
	ldreqsh r0, [r1, r0]
	beq _020F3DAC
	ldr r0, [sp, #0x68]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
	mov r0, r0, lsl #0x10
	mov r0, r0, asr #0x10
_020F3DAC:
	cmp r0, #0
	beq _020F3DE4
	cmp r4, #0
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x6c]
	ldreq r3, [r1, r0]
	beq _020F3DD4
	ldr r0, [sp, #0x6c]
	add r0, sb, r0, lsl #2
	ldr r3, [r0, #0x1c]
_020F3DD4:
	ldr r0, [sp, #0x70]
	mvn r1, #0
	add r0, r3, r0
	blx r2
_020F3DE4:
	str r5, [r8, #8]
	b _020F426C
_020F3DEC:
	add r1, sp, #0x58
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x5c
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x60
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x64
	bl _Z22__DecodeUnsignedNumberPcPm
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r5, r1, r5, lsl #24
	add fp, r0, #4
	beq _020F3E50
	ldr r1, [sp, #0x58]
	ldr r0, [sp, #0x5c]
	add r1, sb, r1, lsl #2
	ldr r1, [r1, #0x1c]
	b _020F3E60
_020F3E50:
	ldr r2, [sb, #0x18]
	ldr r1, [sp, #0x58]
	ldr r0, [sp, #0x5c]
	ldr r1, [r2, r1]
_020F3E60:
	add r4, r1, r0
	ldr r6, [sp, #0x60]
	ldr r0, [sp, #0x64]
	cmp r6, #0
	mla r4, r6, r0, r4
	beq _020F3E98
	mvn sl, #0
_020F3E7C:
	ldr r0, [sp, #0x64]
	mov r1, sl
	sub r4, r4, r0
	mov r0, r4
	blx r5
	subs r6, r6, #1
	bne _020F3E7C
_020F3E98:
	str fp, [r8, #8]
	b _020F426C
_020F3EA0:
	add r1, sp, #0x54
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r2, r1, r5, lsl #24
	add r4, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x54]
	ldreq r0, [r1, r0]
	beq _020F3EF0
	ldr r0, [sp, #0x54]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
_020F3EF0:
	blx r2
	str r4, [r8, #8]
	b _020F426C
_020F3EFC:
	add r1, sp, #0x4c
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x50
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	tst r7, #0x40
	orr r1, r1, r5, lsl #24
	add r5, r0, #4
	ldreq r2, [sb, #0x18]
	ldreq r0, [sp, #0x4c]
	ldreqb r0, [r2, r0]
	beq _020F3F58
	ldr r0, [sp, #0x4c]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
	and r0, r0, #0xff
_020F3F58:
	cmp r0, #0
	beq _020F3F84
	cmp r4, #0
	ldreq r2, [sb, #0x18]
	ldreq r0, [sp, #0x50]
	ldreq r0, [r2, r0]
	beq _020F3F80
	ldr r0, [sp, #0x50]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
_020F3F80:
	blx r1
_020F3F84:
	str r5, [r8, #8]
	b _020F426C
_020F3F8C:
	ldr r0, [sp]
	cmp r0, r2
	addeq sp, sp, #0xa4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r1, sp, #0x44
	add r0, r2, #5
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x48
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [r8, #8]
	b _020F426C
_020F3FB8:
	add r1, sp, #0x40
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	ldr r2, [sb, #0x18]
	ldr r1, [sp, #0x40]
	mov r4, r0
	add r0, r2, r1
	ldr r2, [r0, #8]
	cmp r2, #0
	beq _020F3FFC
	ldr r0, [r0]
	ldr r1, [sb, #4]
	cmp r1, r0
	streq r2, [sb, #8]
	beq _020F3FFC
	mvn r1, #0
	blx r2
_020F3FFC:
	str r4, [r8, #8]
	b _020F426C
_020F4004:
	ldr r0, [sp]
	cmp r0, r2
	addeq sp, sp, #0xa4
	ldmeqia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	add r1, sp, #0x34
	add r0, r2, #1
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x38
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0x3c
	bl _Z20__DecodeSignedNumberPcPl
	ldr r1, [sp, #0x34]
	add r0, r0, r1, lsl #2
	str r0, [r8, #8]
	b _020F426C
_020F4040:
	add r1, sp, #0x24
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x28
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	orr r2, r1, r5, lsl #24
	add r1, sp, #0x2c
	add r0, r0, #4
	str r2, [sp, #0x30]
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r2, r1, r5, lsl #24
	add r4, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x24]
	ldreq r5, [r1, r0]
	beq _020F40C4
	ldr r0, [sp, #0x24]
	add r0, sb, r0, lsl #2
	ldr r5, [r0, #0x1c]
_020F40C4:
	ldr r0, [sp, #0x28]
	ldr r3, [sp, #0x30]
	ldr r1, [sp, #0x2c]
	add r0, r5, r0
	add r1, r3, r1
	blx r2
	str r4, [r8, #8]
	b _020F426C
_020F40E4:
	add r1, sp, #0x14
	add r0, r2, #1
	and r5, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x1c
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0], #1
	add r1, sp, #0x18
	and r4, r2, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r6, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r5, #0
	orr r2, r1, r6, lsl #24
	add r5, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0x14]
	ldreq r0, [r1, r0]
	beq _020F4154
	ldr r0, [sp, #0x14]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
_020F4154:
	cmp r4, #0
	ldreq r3, [sb, #0x18]
	ldreq r1, [sp, #0x18]
	ldreq r4, [r3, r1]
	beq _020F4174
	ldr r1, [sp, #0x18]
	add r1, sb, r1, lsl #2
	ldr r4, [r1, #0x1c]
_020F4174:
	ldr r3, [sp, #0x1c]
	ldr r1, [sp, #0x20]
	add r0, r0, r3
	add r1, r4, r1
	blx r2
	str r5, [r8, #8]
	b _020F426C
_020F4190:
	add r1, sp, #8
	add r0, r2, #1
	and r4, r7, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	ldrb r2, [r0], #1
	add r1, sp, #0xc
	and r6, r2, #0x20
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x10
	bl _Z22__DecodeUnsignedNumberPcPm
	ldrb r2, [r0]
	ldrb r1, [r0, #1]
	ldrb r3, [r0, #2]
	ldrb r5, [r0, #3]
	orr r1, r2, r1, lsl #8
	orr r1, r1, r3, lsl #16
	cmp r4, #0
	orr r5, r1, r5, lsl #24
	add fp, r0, #4
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #8]
	ldreq r4, [r1, r0]
	beq _020F41F8
	ldr r0, [sp, #8]
	add r0, sb, r0, lsl #2
	ldr r4, [r0, #0x1c]
_020F41F8:
	cmp r6, #0
	ldreq r1, [sb, #0x18]
	ldreq r0, [sp, #0xc]
	ldreq r0, [r1, r0]
	beq _020F4218
	ldr r0, [sp, #0xc]
	add r0, sb, r0, lsl #2
	ldr r0, [r0, #0x1c]
_020F4218:
	ldr r1, [sp, #0x10]
	add r4, r4, r0
	bl _u32_div_f
	movs r6, r0
	beq _020F424C
	mvn sl, #0
_020F4230:
	ldr r0, [sp, #0x10]
	mov r1, sl
	sub r4, r4, r0
	mov r0, r4
	blx r5
	subs r6, r6, #1
	bne _020F4230
_020F424C:
	str fp, [r8, #8]
	b _020F426C
_020F4254:
	add r1, sp, #4
	add r0, r2, #1
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [r8, #8]
	b _020F426C
_020F4268:
	bl _ZSt9terminatev
_020F426C:
	tst r7, #0x80
	movne r0, #0
	strne r0, [r8, #8]
	b _020F39E8
_020F427C:
	add sp, sp, #0xa4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end _Z11UnwindStackP12ThrowContextP13ExceptionInfoPc

	arm_func_start _Z23FindMostRecentExceptionP12ThrowContextP13ExceptionInfo
_Z23FindMostRecentExceptionP12ThrowContextP13ExceptionInfo: ; 0x020F4284
	stmdb sp!, {r4, r5, lr}
	sub sp, sp, #0x8c
	ldr r2, [r1]
	mov r4, r0
	str r2, [sp, #4]
	ldr r0, [r1, #4]
	add ip, sp, #0x38
	str r0, [sp, #8]
	ldr r0, [r1, #8]
	add lr, r4, #0x1c
	str r0, [sp, #0xc]
	ldr r0, [r1, #0xc]
	mov r5, #5
	str r0, [sp, #0x10]
	ldr r0, [r1, #0x10]
	str r0, [sp, #0x14]
	ldr r0, [r1, #0x14]
	str r0, [sp, #0x18]
	ldr r0, [r4]
	str r0, [sp, #0x1c]
	ldr r0, [r4, #4]
	str r0, [sp, #0x20]
	ldr r0, [r4, #8]
	str r0, [sp, #0x24]
	ldr r0, [r4, #0xc]
	str r0, [sp, #0x28]
	ldr r0, [r4, #0x10]
	str r0, [sp, #0x2c]
	ldr r0, [r4, #0x14]
	str r0, [sp, #0x30]
	ldr r0, [r4, #0x18]
	str r0, [sp, #0x34]
_020F4304:
	ldmia lr!, {r0, r1, r2, r3}
	stmia ip!, {r0, r1, r2, r3}
	subs r5, r5, #1
	bne _020F4304
	ldr r1, [lr]
	add r0, sp, #4
	str r1, [ip]
	bl _Z13CurrentActionPK14ActionIterator
	add r5, sp, #4
_020F4328:
	cmp r0, #0x12
	addls pc, pc, r0, lsl #2
	b _020F4380
_020F4334: ; jump table
	b _020F438C ; case 0
	b _020F4380 ; case 1
	b _020F438C ; case 2
	b _020F438C ; case 3
	b _020F438C ; case 4
	b _020F438C ; case 5
	b _020F438C ; case 6
	b _020F438C ; case 7
	b _020F438C ; case 8
	b _020F438C ; case 9
	b _020F438C ; case 10
	b _020F438C ; case 11
	b _020F438C ; case 12
	b _020F4398 ; case 13
	b _020F4380 ; case 14
	b _020F438C ; case 15
	b _020F438C ; case 16
	b _020F438C ; case 17
	b _020F438C ; case 18
_020F4380:
	add sp, sp, #0x8c
	mov r0, #0
	ldmia sp!, {r4, r5, pc}
_020F438C:
	mov r0, r5
	bl _Z10NextActionP14ActionIterator
	b _020F4328
_020F4398:
	ldr r0, [sp, #0xc]
	add r1, sp, #0
	add r0, r0, #1
	bl _Z20__DecodeSignedNumberPcPl
	ldr ip, [sp, #0x34]
	ldr r3, [sp]
	mov r1, #0
	add r0, ip, r3
	ldr r2, [r0, #4]
	str r2, [r4]
	ldr r2, [ip, r3]
	str r2, [r4, #4]
	str r1, [r4, #8]
	str r0, [r4, #0xc]
	add sp, sp, #0x8c
	ldmia sp!, {r4, r5, pc}
	arm_func_end _Z23FindMostRecentExceptionP12ThrowContextP13ExceptionInfo

	arm_func_start _Z17IsInSpecificationPcP16ex_specification
_Z17IsInSpecificationPcP16ex_specification: ; 0x020F43D8
	stmdb sp!, {r4, r5, r6, r7, r8, lr}
	sub sp, sp, #8
	mov r6, r1
	ldr r1, [r6]
	mov r7, r0
	cmp r1, #0
	ldr r4, [r6, #0xc]
	mov r5, #0
	bls _020F4450
	add r8, sp, #0
_020F4400:
	ldrb r1, [r4]
	ldrb r0, [r4, #1]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	orr r0, r1, r0, lsl #8
	orr r0, r0, r2, lsl #16
	orr r1, r0, r3, lsl #24
	mov r0, r7
	mov r2, r8
	str r1, [sp, #4]
	bl __throw_catch_compare
	cmp r0, #0
	addne sp, sp, #8
	movne r0, #1
	ldmneia sp!, {r4, r5, r6, r7, r8, pc}
	ldr r0, [r6]
	add r5, r5, #1
	cmp r5, r0
	add r4, r4, #4
	blo _020F4400
_020F4450:
	mov r0, #0
	add sp, sp, #8
	ldmia sp!, {r4, r5, r6, r7, r8, pc}
	arm_func_end _Z17IsInSpecificationPcP16ex_specification

	arm_func_start __unexpected
__unexpected: ; 0x020F445C
	stmdb sp!, {r4, fp, lr}
	sub sp, sp, #0x2c
	mov fp, sp
	str sp, [fp, #0x18]
	ldr r4, [r0, #0x14]
	bl _ZSt10unexpectedv
	b _020F44E8
_020F4478:
	add r1, fp, #0x1c
	add r0, r4, #1
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, fp, #0x20
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, fp, #0x24
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [fp, #0x28]
	ldr r0, [fp, #8]
	add r1, fp, #0x1c
	bl _Z17IsInSpecificationPcP16ex_specification
	cmp r0, #0
	beq _020F44B0
	bl __rethrow
_020F44B0:
	ldr r0, _020F44F4 ; =_021116F4
	add r1, fp, #0x1c
	bl _Z17IsInSpecificationPcP16ex_specification
	cmp r0, #0
	beq _020F44DC
	ldr r3, _020F44F8 ; =_021116E8
	ldr r0, _020F44FC ; =_0211170C
	ldr r2, _020F4500 ; =_ZNSt13bad_exceptionD1Ev
	add r1, fp, #0
	str r3, [fp]
	bl __throw
_020F44DC:
	add r0, fp, #4
	bl __end__catch
	ldr sp, [fp, #0x18]
_020F44E8:
	bl _ZSt9terminatev
	add sp, fp, #0x2c
	ldmia sp!, {r4, fp, pc}
	.balign 4, 0
_020F44F4: .word _021116F4
_020F44F8: .word _021116E8
_020F44FC: .word _0211170C
_020F4500: .word _ZNSt13bad_exceptionD1Ev
	arm_func_end __unexpected

	arm_func_start _ZNSt13bad_exceptionD1Ev
_ZNSt13bad_exceptionD1Ev: ; 0x020F4504
	bx lr
	arm_func_end _ZNSt13bad_exceptionD1Ev

	arm_func_start _Z16HandleUnexpectedP12ThrowContextP13ExceptionInfoP16ex_specificationPc
_Z16HandleUnexpectedP12ThrowContextP13ExceptionInfoP16ex_specificationPc: ; 0x020F4508
	stmdb sp!, {r3, r4, r5, r6, r7, lr}
	mov r4, r3
	mov r5, r2
	mov r2, r4
	mov r7, r0
	mov r6, r1
	bl _Z11UnwindStackP12ThrowContextP13ExceptionInfoPc
	ldr r2, [r7, #0x18]
	ldr r1, [r5, #8]
	ldr r0, [r7, #4]
	add r3, r2, r1
	str r0, [r2, r1]
	ldr r1, [r7]
	mov r0, r7
	str r1, [r3, #4]
	ldr r2, [r7, #8]
	mov r1, r6
	str r2, [r3, #8]
	str r4, [r3, #0x14]
	ldr r3, [r6]
	ldr r2, [r5, #4]
	add r2, r3, r2
	bl _Z17__TransferControlP12ThrowContextP13ExceptionInfoPc
	ldmia sp!, {r3, r4, r5, r6, r7, pc}
	arm_func_end _Z16HandleUnexpectedP12ThrowContextP13ExceptionInfoP16ex_specificationPc

	arm_func_start _Z20FindExceptionHandlerP12ThrowContextP13ExceptionInfoPl
_Z20FindExceptionHandlerP12ThrowContextP13ExceptionInfoPl: ; 0x020F4568
	stmdb sp!, {r4, r5, r6, r7, r8, sb, sl, fp, lr}
	sub sp, sp, #0xa4
	mov r5, r1
	ldr r1, [r5]
	mov r6, r0
	str r1, [sp, #0x1c]
	ldr r0, [r5, #4]
	add r8, sp, #0x50
	str r0, [sp, #0x20]
	ldr r0, [r5, #8]
	mov r4, r2
	str r0, [sp, #0x24]
	ldr r0, [r5, #0xc]
	add sb, r6, #0x1c
	str r0, [sp, #0x28]
	ldr r0, [r5, #0x10]
	mov r7, #5
	str r0, [sp, #0x2c]
	ldr r0, [r5, #0x14]
	str r0, [sp, #0x30]
	ldr r0, [r6]
	str r0, [sp, #0x34]
	ldr r0, [r6, #4]
	str r0, [sp, #0x38]
	ldr r0, [r6, #8]
	str r0, [sp, #0x3c]
	ldr r0, [r6, #0xc]
	str r0, [sp, #0x40]
	ldr r0, [r6, #0x10]
	str r0, [sp, #0x44]
	ldr r0, [r6, #0x14]
	str r0, [sp, #0x48]
	ldr r0, [r6, #0x18]
	str r0, [sp, #0x4c]
_020F45F0:
	ldmia sb!, {r0, r1, r2, r3}
	stmia r8!, {r0, r1, r2, r3}
	subs r7, r7, #1
	bne _020F45F0
	ldr r1, [sb]
	add r0, sp, #0x1c
	str r1, [r8]
	bl _Z13CurrentActionPK14ActionIterator
	add r7, sp, #0
	add sl, sp, #4
	add fp, sp, #8
	add sb, sp, #0x14
	add r8, sp, #0x18
_020F4624:
	cmp r0, #0x13
	addls pc, pc, r0, lsl #2
	b _020F4724
_020F4630: ; jump table
	b _020F472C ; case 0
	b _020F4724 ; case 1
	b _020F472C ; case 2
	b _020F472C ; case 3
	b _020F472C ; case 4
	b _020F472C ; case 5
	b _020F472C ; case 6
	b _020F472C ; case 7
	b _020F472C ; case 8
	b _020F472C ; case 9
	b _020F472C ; case 10
	b _020F472C ; case 11
	b _020F4680 ; case 12
	b _020F472C ; case 13
	b _020F4724 ; case 14
	b _020F46D4 ; case 15
	b _020F472C ; case 16
	b _020F472C ; case 17
	b _020F472C ; case 18
	b _020F472C ; case 19
_020F4680:
	ldr lr, [sp, #0x24]
	mov r1, sb
	ldrb r2, [lr, #1]
	ldrb r0, [lr, #2]
	ldrb r3, [lr, #3]
	ldrb ip, [lr, #4]
	orr r0, r2, r0, lsl #8
	orr r0, r0, r3, lsl #16
	orr r2, r0, ip, lsl #24
	add r0, lr, #5
	str r2, [sp, #0x10]
	bl _Z22__DecodeUnsignedNumberPcPm
	mov r1, r8
	bl _Z20__DecodeSignedNumberPcPl
	ldr r0, [r6]
	ldr r1, [sp, #0x10]
	mov r2, r4
	bl __throw_catch_compare
	cmp r0, #0
	beq _020F472C
	b _020F4738
_020F46D4:
	ldr r0, [sp, #0x24]
	mov r1, r7
	add r0, r0, #1
	bl _Z22__DecodeUnsignedNumberPcPm
	mov r1, sl
	bl _Z22__DecodeUnsignedNumberPcPm
	mov r1, fp
	bl _Z20__DecodeSignedNumberPcPl
	str r0, [sp, #0xc]
	ldr r0, [r6]
	mov r1, r7
	bl _Z17IsInSpecificationPcP16ex_specification
	cmp r0, #0
	bne _020F472C
	ldr r3, [sp, #0x24]
	mov r0, r6
	mov r1, r5
	mov r2, r7
	bl _Z16HandleUnexpectedP12ThrowContextP13ExceptionInfoP16ex_specificationPc
	b _020F472C
_020F4724:
	bl _ZSt9terminatev
	b _020F4738
_020F472C:
	add r0, sp, #0x1c
	bl _Z10NextActionP14ActionIterator
	b _020F4624
_020F4738:
	ldr r0, [sp, #0x24]
	add sp, sp, #0xa4
	ldmia sp!, {r4, r5, r6, r7, r8, sb, sl, fp, pc}
	arm_func_end _Z20FindExceptionHandlerP12ThrowContextP13ExceptionInfoPl

	arm_func_start _Z14SetupCatchInfoP12ThrowContextll
_Z14SetupCatchInfoP12ThrowContextll: ; 0x020F4744
	stmdb sp!, {r3, lr}
	ldr lr, [r0, #0x18]
	ldr ip, [r0, #4]
	add r3, lr, r1
	str ip, [lr, r1]
	ldr r1, [r0]
	str r1, [r3, #4]
	ldr r1, [r0, #8]
	str r1, [r3, #8]
	ldr r1, [r0]
	ldrb r1, [r1]
	cmp r1, #0x2a
	ldrne r0, [r0, #4]
	addne r0, r0, r2
	strne r0, [r3, #0xc]
	ldmneia sp!, {r3, pc}
	add r1, r3, #0x10
	str r1, [r3, #0xc]
	ldr r0, [r0, #4]
	ldr r0, [r0]
	add r0, r0, r2
	str r0, [r3, #0x10]
	ldmia sp!, {r3, pc}
	arm_func_end _Z14SetupCatchInfoP12ThrowContextll

	arm_func_start _Z14__ThrowHandlerP12ThrowContext
_Z14__ThrowHandlerP12ThrowContext:
	stmdb sp!, {r3, r4, r5, lr}
	sub sp, sp, #0x28
	mov r5, r0
	ldr r0, [r5, #0x10]
	add r1, sp, #0x10
	bl _Z19FindExceptionRecordPcP13ExceptionInfo
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _020F47C8
	bl _ZSt9terminatev
_020F47C8:
	add r1, sp, #0x10
	mov r0, r5
	bl _Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo
	ldr r0, [r5]
	cmp r0, #0
	movne r0, #0
	strne r0, [r5, #0xc]
	bne _020F4804
	add r1, sp, #0x10
	mov r0, r5
	bl _Z23FindMostRecentExceptionP12ThrowContextP13ExceptionInfo
	str r0, [r5, #0xc]
	cmp r0, #0
	bne _020F4804
	bl _ZSt9terminatev
_020F4804:
	add r1, sp, #0x10
	add r2, sp, #0
	mov r0, r5
	bl _Z20FindExceptionHandlerP12ThrowContextP13ExceptionInfoPl
	mov r4, r0
	ldrb r1, [r4, #1]
	ldrb r0, [r4, #2]
	ldrb r2, [r4, #3]
	ldrb r3, [r4, #4]
	orr r0, r1, r0, lsl #8
	orr r0, r0, r2, lsl #16
	orr r2, r0, r3, lsl #24
	add r1, sp, #8
	add r0, r4, #5
	str r2, [sp, #4]
	bl _Z22__DecodeUnsignedNumberPcPm
	add r1, sp, #0xc
	bl _Z20__DecodeSignedNumberPcPl
	add r1, sp, #0x10
	mov r0, r5
	mov r2, r4
	bl _Z11UnwindStackP12ThrowContextP13ExceptionInfoPc
	ldr r1, [sp, #0xc]
	ldr r2, [sp]
	mov r0, r5
	bl _Z14SetupCatchInfoP12ThrowContextll
	ldr r3, [sp, #0x10]
	ldr r2, [sp, #8]
	mov r0, r5
	add r1, sp, #0x10
	add r2, r3, r2
	bl _Z17__TransferControlP12ThrowContextP13ExceptionInfoPc
	add sp, sp, #0x28
	ldmia sp!, {r3, r4, r5, pc}
	arm_func_end _Z14__ThrowHandlerP12ThrowContext

	arm_func_start __end__catch
__end__catch: ; 0x020F488C
	stmdb sp!, {r3, lr}
	ldr r1, [r0]
	cmp r1, #0
	ldrne r2, [r0, #8]
	cmpne r2, #0
	ldmeqia sp!, {r3, pc}
	mov r0, r1
	mvn r1, #0
	blx r2
	ldmia sp!, {r3, pc}
	arm_func_end __end__catch

	arm_func_start _ZNSt13bad_exceptionD0Ev
_ZNSt13bad_exceptionD0Ev: ; 0x020F48B4
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt13bad_exceptionD0Ev

	arm_func_start _ZNKSt13bad_exception4whatEv
_ZNKSt13bad_exception4whatEv: ; 0x020F48C8
	ldr r0, _020F48D0 ; =_ZZNKSt13bad_exception4whatEvEs
	bx lr
	.align 2, 0
_020F48D0: .word _ZZNKSt13bad_exception4whatEvEs
	arm_func_end _ZNKSt13bad_exception4whatEv

	arm_func_start _ZSt17__throw_bad_allocv
_ZSt17__throw_bad_allocv: ; 0x020F48D4
	stmdb sp!, {r3, lr}
	ldr r0, _020F4904 ; =_02111734
	ldrb r0, [r0]
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	ldr r3, _020F4908 ; =_ZTVSt9bad_alloc
	ldr r0, _020F490C ; =_02111788
	ldr r2, _020F4910 ; =_ZNSt9bad_allocD1Ev
	add r1, sp, #0
	str r3, [sp]
	bl __throw
	ldmia sp!, {r3, pc}
	.align 2, 0
_020F4904: .word _02111734
_020F4908: .word _ZTVSt9bad_alloc
_020F490C: .word _02111788
_020F4910: .word _ZNSt9bad_allocD1Ev
	arm_func_end _ZSt17__throw_bad_allocv

	arm_func_start _ZNSt9bad_allocD1Ev
_ZNSt9bad_allocD1Ev: ; 0x020F4914
	bx lr
	arm_func_end _ZNSt9bad_allocD1Ev

	arm_func_start _Znwm
_Znwm: ; 0x020F4918
	stmdb sp!, {r3, r4, r5, r6, fp, lr}
	sub sp, sp, #0x18
	mov fp, sp
	movs r6, r0
	ldr r4, _020F4978 ; =_ZSt13__new_handler
	moveq r6, #4
_020F4930:
	mov r0, r6
	bl malloc
	movs r5, r0
	bne _020F4958
	ldr r0, [r4]
	cmp r0, #0
	beq _020F4954
	blx r0
	b _020F4930
_020F4954:
	bl _ZSt17__throw_bad_allocv
_020F4958:
	add sp, fp, #0x18
	mov r0, r5
	ldmia sp!, {r3, r4, r5, r6, fp, pc}
_020F4964:
	add r0, fp, #0
	bl __unexpected
_020F496C:
	b _020F496C
_020F4970:
	add sp, fp, #0x18
	ldmia sp!, {r3, r4, r5, r6, fp, pc}
	.align 2, 0
_020F4978: .word _ZSt13__new_handler
	arm_func_end _Znwm

	arm_func_start _ZnwmRKSt9nothrow_t
_ZnwmRKSt9nothrow_t: ; 0x020F497C
	stmdb sp!, {fp, lr}
	sub sp, sp, #0x30
	mov fp, sp
	str sp, [fp, #0x2c]
	bl _Znwm
	add sp, fp, #0x30
	ldmia sp!, {fp, pc}
_020F4998:
	add r0, fp, #0x18
	bl __end__catch
	add sp, fp, #0x30
	mov r0, #0
	ldmia sp!, {fp, pc}
_020F49AC:
	add r0, fp, #0
	bl __unexpected
_020F49B4:
	b _020F49B4
_020F49B8: ; 0x020F49B8
	add sp, fp, #0x30
	ldmia sp!, {fp, pc}
	arm_func_end _ZnwmRKSt9nothrow_t

	arm_func_start _ZdlPv
_ZdlPv: ; 0x020F49C0
	stmdb sp!, {r3, lr}
	cmp r0, #0
	ldmeqia sp!, {r3, pc}
	bl free
	ldmia sp!, {r3, pc}
	arm_func_end _ZdlPv

	arm_func_start _Znam
_Znam: ; 0x020F49D4
	stmdb sp!, {fp, lr}
	sub sp, sp, #0x18
	mov fp, sp
	bl _Znwm
	add sp, fp, #0x18
	ldmia sp!, {fp, pc}
_020F49EC: ; 0x020F49EC
	add r0, fp, #0
	bl __unexpected
_020F49F4:
	b _020F49F4
_020F49F8: ; 0x020F49F8
	add sp, fp, #0x18
	ldmia sp!, {fp, pc}
	arm_func_end _Znam

	arm_func_start _ZnamRKSt9nothrow_t
_ZnamRKSt9nothrow_t: ; 0x020F4A00
	stmdb sp!, {fp, lr}
	sub sp, sp, #0x18
	mov fp, sp
	bl _ZnwmRKSt9nothrow_t
	add sp, fp, #0x18
	ldmia sp!, {fp, pc}
_020F4A18: ; 0x020F4A18
	add r0, fp, #0
	bl __unexpected
_020F4A20:
	b _020F4A20
_020F4A24: ; 0x020F4A24
	add sp, fp, #0x18
	ldmia sp!, {fp, pc}
	arm_func_end _ZnamRKSt9nothrow_t

	arm_func_start _ZdaPv
_ZdaPv: ; 0x020F4A2C
	ldr ip, _020F4A34 ; =_ZdlPv
	bx ip
	.align 2, 0
_020F4A34: .word _ZdlPv
	arm_func_end _ZdaPv

	arm_func_start _ZNSt9bad_allocD0Ev
_ZNSt9bad_allocD0Ev: ; 0x020F4A38
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZNSt9bad_allocD0Ev

	arm_func_start _ZNKSt9bad_alloc4whatEv
_ZNKSt9bad_alloc4whatEv: ; 0x020F4A4C
	ldr r0, _020F4A54 ; =_02111738
	bx lr
	.align 2, 0
_020F4A54: .word _02111738
	arm_func_end _ZNKSt9bad_alloc4whatEv

	arm_func_start __call_static_initializers
__call_static_initializers: ; 0x020F4A58
	stmdb sp!, {r4, lr}
	ldr r4, _020F4A80 ; =__sinit__
	b _020F4A6C
_020F4A64:
	blx r0
	add r4, r4, #4
_020F4A6C:
	cmp r4, #0
	ldrne r0, [r4]
	cmpne r0, #0
	bne _020F4A64
	ldmia sp!, {r4, pc}
	.align 2, 0
_020F4A80: .word __sinit__
	arm_func_end __call_static_initializers

	arm_func_start __destroy_global_chain
__destroy_global_chain: ; 0x020F4A84
	stmdb sp!, {r3, r4, r5, lr}
	ldr r4, _020F4AC4 ; =__global_destructor_chain
	ldr r2, [r4]
	cmp r2, #0
	ldmeqia sp!, {r3, r4, r5, pc}
	mvn r5, #0
_020F4A9C:
	ldr r0, [r2]
	mov r1, r5
	str r0, [r4]
	ldr r0, [r2, #8]
	ldr r2, [r2, #4]
	blx r2
	ldr r2, [r4]
	cmp r2, #0
	bne _020F4A9C
	ldmia sp!, {r3, r4, r5, pc}
	.align 2, 0
_020F4AC4: .word __global_destructor_chain
	arm_func_end __destroy_global_chain

	arm_func_start _ZNSt9type_infoD2Ev
_ZNSt9type_infoD2Ev: ; 0x020F4AC8
	bx lr
	arm_func_end _ZNSt9type_infoD2Ev

	arm_func_start _ZNKSt9type_infoeqERKS_
_ZNKSt9type_infoeqERKS_: ; 0x020F4ACC
	stmdb sp!, {r3, lr}
	cmp r0, r1
	beq _020F4AEC
	ldr r0, [r0, #4]
	ldr r1, [r1, #4]
	bl strcmp
	cmp r0, #0
	bne _020F4AF4
_020F4AEC:
	mov r0, #1
	ldmia sp!, {r3, pc}
_020F4AF4:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end _ZNKSt9type_infoeqERKS_

	arm_func_start _ZN10__cxxabiv117__class_type_infoD1Ev
_ZN10__cxxabiv117__class_type_infoD1Ev: ; 0x020F4AFC
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZNSt9type_infoD2Ev
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZN10__cxxabiv117__class_type_infoD1Ev

	arm_func_start _ZN10__cxxabiv117__class_type_infoD0Ev
_ZN10__cxxabiv117__class_type_infoD0Ev: ; 0x020F4B10
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZNSt9type_infoD2Ev
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZN10__cxxabiv117__class_type_infoD0Ev

	arm_func_start _ZN10__cxxabiv117__class_type_infoD2Ev
_ZN10__cxxabiv117__class_type_infoD2Ev: ; 0x020F4B2C
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZNSt9type_infoD2Ev
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZN10__cxxabiv117__class_type_infoD2Ev

	arm_func_start _ZN10__cxxabiv120__si_class_type_infoD1Ev
_ZN10__cxxabiv120__si_class_type_infoD1Ev: ; 0x020F4B40
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZN10__cxxabiv117__class_type_infoD2Ev
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZN10__cxxabiv120__si_class_type_infoD1Ev

	arm_func_start _ZN10__cxxabiv120__si_class_type_infoD0Ev
_ZN10__cxxabiv120__si_class_type_infoD0Ev: ; 0x020F4B54
	stmdb sp!, {r4, lr}
	mov r4, r0
	bl _ZN10__cxxabiv117__class_type_infoD2Ev
	mov r0, r4
	bl _ZdlPv
	mov r0, r4
	ldmia sp!, {r4, pc}
	arm_func_end _ZN10__cxxabiv120__si_class_type_infoD0Ev

	arm_func_start _ZSt9dthandlerv
_ZSt9dthandlerv: ; 0x020F4B70
	ldr ip, _020F4B78 ; =abort
	bx ip
	.align 2, 0
_020F4B78: .word abort
	arm_func_end _ZSt9dthandlerv

	arm_func_start _ZSt9duhandlerv
_ZSt9duhandlerv: ; 0x020F4B7C
	ldr ip, _020F4B84 ; =_ZSt9terminatev
	bx ip
	.align 2, 0
_020F4B84: .word _ZSt9terminatev
	arm_func_end _ZSt9duhandlerv

	arm_func_start _ZSt9terminatev
_ZSt9terminatev: ; 0x020F4B88
	stmdb sp!, {r3, lr}
	ldr r0, _020F4B9C ; =_02111848
	ldr r0, [r0]
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020F4B9C: .word _02111848
	arm_func_end _ZSt9terminatev

	arm_func_start _ZSt10unexpectedv
_ZSt10unexpectedv: ; 0x020F4BA0
	stmdb sp!, {r3, lr}
	ldr r0, _020F4BB4 ; =_02111848
	ldr r0, [r0, #4]
	blx r0
	ldmia sp!, {r3, pc}
	.align 2, 0
_020F4BB4: .word _02111848
	arm_func_end _ZSt10unexpectedv

	arm_func_start __throw_catch_compare
__throw_catch_compare: ; 0x020F4BB8
	stmdb sp!, {r3, lr}
	mov ip, #0
	mov r3, r1
	cmp r1, #0
	str ip, [r2]
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrb ip, [r1]
	cmp ip, #0x50
	bne _020F4C1C
	ldrb ip, [r3, #1]!
	cmp ip, #0x56
	addeq r3, r3, #1
	ldrb ip, [r3]
	cmp ip, #0x4b
	addeq r3, r3, #1
	ldrb r3, [r3]
	cmp r3, #0x76
	bne _020F4C18
	ldrb r3, [r0]
	cmp r3, #0x50
	cmpne r3, #0x2a
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
_020F4C18:
	mov r3, r1
_020F4C1C:
	ldrb ip, [r0]
	cmp ip, #0x21
	cmpne ip, #0x2a
	bne _020F4D1C
	ldrb lr, [r0], #1
	ldrb ip, [r3], #1
	cmp lr, ip
	movne r0, #0
	ldmneia sp!, {r3, pc}
_020F4C40:
	ldrb lr, [r0]
	ldrb ip, [r3], #1
	cmp lr, ip
	bne _020F4C94
	cmp lr, #0x21
	add r0, r0, #1
	bne _020F4C40
	ldrb r1, [r0]
	mov lr, #0
	cmp r1, #0x21
	beq _020F4C88
	mov r1, #0xa
_020F4C70:
	ldrb ip, [r0]
	ldrb r3, [r0, #1]!
	mla ip, lr, r1, ip
	cmp r3, #0x21
	sub lr, ip, #0x30
	bne _020F4C70
_020F4C88:
	str lr, [r2]
	mov r0, #1
	ldmia sp!, {r3, pc}
_020F4C94:
	ldrb r3, [r0], #1
	cmp r3, #0x21
	bne _020F4C94
_020F4CA0:
	ldrb r3, [r0], #1
	cmp r3, #0x21
	bne _020F4CA0
	ldrb r3, [r0]
	cmp r3, #0
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	add r3, r1, #1
	b _020F4C40
_020F4CC4:
	ldrb r1, [r3, #1]!
	add r0, r0, #1
	cmp r1, #0x4b
	bne _020F4CE4
	ldrb r1, [r0]
	add r3, r3, #1
	cmp r1, #0x4b
	addeq r0, r0, #1
_020F4CE4:
	ldrb r2, [r0]
	cmp r2, #0x4b
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
	ldrb r1, [r3]
	cmp r1, #0x56
	bne _020F4D0C
	cmp r2, #0x56
	addeq r0, r0, #1
	add r3, r3, #1
_020F4D0C:
	ldrb r1, [r0]
	cmp r1, #0x56
	moveq r0, #0
	ldmeqia sp!, {r3, pc}
_020F4D1C:
	ldrb r2, [r0]
	cmp r2, #0x50
	cmpne r2, #0x52
	bne _020F4D38
	ldrb r1, [r3]
	cmp r2, r1
	beq _020F4CC4
_020F4D38:
	ldrb r1, [r3]
	cmp r2, r1
	bne _020F4D60
_020F4D44:
	cmp r2, #0
	moveq r0, #1
	ldmeqia sp!, {r3, pc}
	ldrb r2, [r0, #1]!
	ldrb r1, [r3, #1]!
	cmp r2, r1
	beq _020F4D44
_020F4D60:
	mov r0, #0
	ldmia sp!, {r3, pc}
	arm_func_end __throw_catch_compare

	arm_func_start _Z15__PopStackFrameP12ThrowContextP13ExceptionInfo
_Z15__PopStackFrameP12ThrowContextP13ExceptionInfo: ; 0x020F4D68
	stmdb sp!, {r4, lr}
	ldrb r1, [r0, #0x6a]
	ldr ip, [r0, #0x60]
	mov r4, #0xf
	cmp r1, #0
	ldr r1, [r0, #0x18]
	movne r2, #0x10
	moveq r2, #0
	add r1, r1, ip
	sub lr, r1, r2
	mov r3, #1
_020F4D94:
	ldrh r1, [r0, #0x68]
	tst r1, r3, lsl r4
	ldrne r2, [lr, #-4]!
	addne r1, r0, r4, lsl #2
	strne r2, [r1, #0x1c]
	subs r4, r4, #1
	bpl _020F4D94
	ldr r1, [r0, #0x18]
	add r1, r1, ip
	str r1, [r0, #0x14]
	ldr r0, [r0, #0x54]
	ldmia sp!, {r4, pc}
	arm_func_end _Z15__PopStackFrameP12ThrowContextP13ExceptionInfo

	arm_func_start _Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo
_Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo: ; 0x020F4DC4
	stmdb sp!, {r4, r5, r6, lr}
	ldr r1, [r1, #4]
	mov r6, r0
	ldrb r0, [r1]
	ands r4, r0, #0x40
	movne r2, #1
	moveq r2, #0
	strb r2, [r6, #0x6b]
	tst r0, #0x20
	movne r2, #1
	moveq r2, #0
	ands r5, r0, #0x80
	movne r0, #1
	strb r2, [r6, #0x6a]
	moveq r0, #0
	strb r0, [r6, #0x6c]
	ldrb r2, [r1, #1]
	add r0, r1, #2
	add r1, r6, #0x60
	mov r2, r2, lsl #4
	strh r2, [r6, #0x68]
	ldrh r2, [r6, #0x68]
	orr r2, r2, #0x4000
	strh r2, [r6, #0x68]
	bl _Z22__DecodeUnsignedNumberPcPm
	cmp r4, #0
	beq _020F4E38
	add r1, r6, #0x64
	bl _Z22__DecodeUnsignedNumberPcPm
_020F4E38:
	cmp r4, #0
	beq _020F4E58
	cmp r5, #0
	ldrne r0, [r6, #0x38]
	strne r0, [r6, #0x18]
	ldreq r0, [r6, #0x48]
	streq r0, [r6, #0x18]
	ldmia sp!, {r4, r5, r6, pc}
_020F4E58:
	ldr r0, [r6, #0x14]
	str r0, [r6, #0x18]
	ldmia sp!, {r4, r5, r6, pc}
	arm_func_end _Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo

	arm_func_start _Z20__FindExceptionTableP13ExceptionInfoPc
_Z20__FindExceptionTableP13ExceptionInfoPc: ; 0x020F4E64
	ldr r2, _020F4E7C ; =__exception_table_start__
	ldr r1, _020F4E80 ; =__exception_table_end__
	str r2, [r0, #0xc]
	str r1, [r0, #0x10]
	mov r0, #1
	bx lr
	.align 2, 0
_020F4E7C: .word __exception_table_start__
_020F4E80: .word __exception_table_end__
	arm_func_end _Z20__FindExceptionTableP13ExceptionInfoPc

	arm_func_start _Z16__SkipUnwindInfoPc
_Z16__SkipUnwindInfoPc: ; 0x020F4E84
	stmdb sp!, {r3, r4, lr}
	sub sp, sp, #4
	ldrb r4, [r0], #2
	add r1, sp, #0
	bl _Z22__DecodeUnsignedNumberPcPm
	tst r4, #0x40
	addeq sp, sp, #4
	ldmeqia sp!, {r3, r4, pc}
	add r1, sp, #0
	bl _Z22__DecodeUnsignedNumberPcPm
	add sp, sp, #4
	ldmia sp!, {r3, r4, pc}
	arm_func_end _Z16__SkipUnwindInfoPc

	arm_func_start _Z17__TransferControlP12ThrowContextP13ExceptionInfoPc
_Z17__TransferControlP12ThrowContextP13ExceptionInfoPc: ; 0x020F4EB4
	ldr r4, [r0, #0x2c]
	ldr r5, [r0, #0x30]
	ldr r6, [r0, #0x34]
	ldr r7, [r0, #0x38]
	ldr r8, [r0, #0x3c]
	ldr sb, [r0, #0x40]
	ldr sl, [r0, #0x44]
	ldr fp, [r0, #0x48]
	ldr sp, [r0, #0x5c]
	ldr ip, [r0, #0x64]
	sub sp, sp, ip
	bx r2
	arm_func_end _Z17__TransferControlP12ThrowContextP13ExceptionInfoPc

	arm_func_start __throw
__throw: ; 0x020F4EE4
	mov ip, sp
	sub sp, sp, #0x70
	str r4, [sp, #0x2c]
	str r5, [sp, #0x30]
	str r6, [sp, #0x34]
	str r7, [sp, #0x38]
	str r8, [sp, #0x3c]
	str sb, [sp, #0x40]
	str sl, [sp, #0x44]
	str fp, [sp, #0x48]
	str ip, [sp, #0x14]
	str ip, [sp, #0x5c]
	str lr, [sp, #0x10]
	str r0, [sp]
	str r1, [sp, #4]
	str r2, [sp, #8]
	mov r0, sp
	b _Z14__ThrowHandlerP12ThrowContext
	arm_func_end __throw

	arm_func_start __rethrow
__rethrow: ; 0x020F4F2C
	mov ip, sp
	sub sp, sp, #0x70
	str r4, [sp, #0x2c]
	str r5, [sp, #0x30]
	str r6, [sp, #0x34]
	str r7, [sp, #0x38]
	str r8, [sp, #0x3c]
	str sb, [sp, #0x40]
	str sl, [sp, #0x44]
	str fp, [sp, #0x48]
	str ip, [sp, #0x14]
	str ip, [sp, #0x5c]
	str lr, [sp, #0x10]
	mov ip, #0
	str ip, [sp]
	str ip, [sp, #4]
	str ip, [sp, #8]
	mov r0, sp
	b _Z14__ThrowHandlerP12ThrowContext
	arm_func_end __rethrow

	arm_func_start _ExitProcess
_ExitProcess: ; 0x020F4F78
	ldr ip, _020F4F80 ; =sys_exit
	bx ip
	.align 2, 0
_020F4F80: .word sys_exit
	arm_func_end _ExitProcess

	.rodata

	.public _0210E404
_0210E404:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B
	.byte 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B
	.byte 0x1C, 0x1D, 0x1E, 0x1F, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B
	.byte 0x2C, 0x2D, 0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x3B
	.byte 0x3C, 0x3D, 0x3E, 0x3F, 0x40, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6A, 0x6B
	.byte 0x6C, 0x6D, 0x6E, 0x6F, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7A, 0x5B
	.byte 0x5C, 0x5D, 0x5E, 0x5F, 0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6A, 0x6B
	.byte 0x6C, 0x6D, 0x6E, 0x6F, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7A, 0x7B
	.byte 0x7C, 0x7D, 0x7E, 0x7F

	.public _0210E484
_0210E484:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B
	.byte 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1A, 0x1B
	.byte 0x1C, 0x1D, 0x1E, 0x1F, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2A, 0x2B
	.byte 0x2C, 0x2D, 0x2E, 0x2F, 0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3A, 0x3B
	.byte 0x3C, 0x3D, 0x3E, 0x3F, 0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x4B
	.byte 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x5B
	.byte 0x5C, 0x5D, 0x5E, 0x5F, 0x60, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47, 0x48, 0x49, 0x4A, 0x4B
	.byte 0x4C, 0x4D, 0x4E, 0x4F, 0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57, 0x58, 0x59, 0x5A, 0x7B
	.byte 0x7C, 0x7D, 0x7E, 0x7F

	.public _0210E504
_0210E504:
	.byte 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x06, 0x01, 0x04, 0x01, 0x04, 0x01, 0x04, 0x01, 0x04, 0x01
	.byte 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x42, 0x01, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00
	.byte 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00
	.byte 0xD0, 0x00, 0xD0, 0x00, 0x58, 0x04, 0x58, 0x04, 0x58, 0x04, 0x58, 0x04, 0x58, 0x04, 0x58, 0x04
	.byte 0x58, 0x04, 0x58, 0x04, 0x58, 0x04, 0x58, 0x04, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00
	.byte 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0x51, 0x06, 0x51, 0x06, 0x51, 0x06, 0x51, 0x06, 0x51, 0x06
	.byte 0x51, 0x06, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02
	.byte 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02
	.byte 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00
	.byte 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0x71, 0x04, 0x71, 0x04, 0x71, 0x04, 0x71, 0x04, 0x71, 0x04
	.byte 0x71, 0x04, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00
	.byte 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00
	.byte 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00
	.byte 0xD0, 0x00, 0x04, 0x00

_0210E604:
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0xFF, 0x7F, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_0210E62C:
	.asciz "NAN("
_0210E631:
	.asciz "INFINITY"
	.balign 4, 0
_0210E63C:
	.byte 0x00, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x07, 0x00, 0x08, 0x00, 0x09, 0x00
	.byte 0x0A, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x12, 0x00, 0x13, 0x00, 0x14, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0x18, 0x00, 0x19, 0x00
	.byte 0x1A, 0x00, 0x1B, 0x00, 0x1C, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x21, 0x00
	.byte 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x25, 0x00, 0x26, 0x00, 0x27, 0x00, 0x28, 0x00, 0x29, 0x00
	.byte 0x2A, 0x00, 0x2B, 0x00, 0x2C, 0x00, 0x2D, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x31, 0x00
	.byte 0x32, 0x00, 0x33, 0x00, 0x34, 0x00, 0x35, 0x00, 0x36, 0x00, 0x37, 0x00, 0x38, 0x00, 0x39, 0x00
	.byte 0x3A, 0x00, 0x3B, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3E, 0x00, 0x3F, 0x00, 0x40, 0x00, 0x61, 0x00
	.byte 0x62, 0x00, 0x63, 0x00, 0x64, 0x00, 0x65, 0x00, 0x66, 0x00, 0x67, 0x00, 0x68, 0x00, 0x69, 0x00
	.byte 0x6A, 0x00, 0x6B, 0x00, 0x6C, 0x00, 0x6D, 0x00, 0x6E, 0x00, 0x6F, 0x00, 0x70, 0x00, 0x71, 0x00
	.byte 0x72, 0x00, 0x73, 0x00, 0x74, 0x00, 0x75, 0x00, 0x76, 0x00, 0x77, 0x00, 0x78, 0x00, 0x79, 0x00
	.byte 0x7A, 0x00, 0x5B, 0x00, 0x5C, 0x00, 0x5D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x60, 0x00, 0x61, 0x00
	.byte 0x62, 0x00, 0x63, 0x00, 0x64, 0x00, 0x65, 0x00, 0x66, 0x00, 0x67, 0x00, 0x68, 0x00, 0x69, 0x00
	.byte 0x6A, 0x00, 0x6B, 0x00, 0x6C, 0x00, 0x6D, 0x00, 0x6E, 0x00, 0x6F, 0x00, 0x70, 0x00, 0x71, 0x00
	.byte 0x72, 0x00, 0x73, 0x00, 0x74, 0x00, 0x75, 0x00, 0x76, 0x00, 0x77, 0x00, 0x78, 0x00, 0x79, 0x00
	.byte 0x7A, 0x00, 0x7B, 0x00, 0x7C, 0x00, 0x7D, 0x00, 0x7E, 0x00, 0x7F, 0x00

_0210E73C:
	.byte 0x04, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x06, 0x01
	.byte 0x04, 0x01, 0x04, 0x01, 0x04, 0x01, 0x04, 0x01, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00
	.byte 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x04, 0x00, 0x42, 0x01, 0xD0, 0x00
	.byte 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00
	.byte 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0x58, 0x04, 0x58, 0x04
	.byte 0x58, 0x04, 0x58, 0x04, 0x58, 0x04, 0x58, 0x04, 0x58, 0x04, 0x58, 0x04, 0x58, 0x04, 0x58, 0x04
	.byte 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0x51, 0x06
	.byte 0x51, 0x06, 0x51, 0x06, 0x51, 0x06, 0x51, 0x06, 0x51, 0x06, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02
	.byte 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02
	.byte 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02, 0x51, 0x02
	.byte 0x51, 0x02, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0x71, 0x04
	.byte 0x71, 0x04, 0x71, 0x04, 0x71, 0x04, 0x71, 0x04, 0x71, 0x04, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00
	.byte 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00
	.byte 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00, 0x71, 0x00
	.byte 0x71, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0xD0, 0x00, 0x04, 0x00, 0x00, 0x00, 0x01, 0x00
	.byte 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x07, 0x00, 0x08, 0x00, 0x09, 0x00
	.byte 0x0A, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x12, 0x00, 0x13, 0x00, 0x14, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00, 0x18, 0x00, 0x19, 0x00
	.byte 0x1A, 0x00, 0x1B, 0x00, 0x1C, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x21, 0x00
	.byte 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x25, 0x00, 0x26, 0x00, 0x27, 0x00, 0x28, 0x00, 0x29, 0x00
	.byte 0x2A, 0x00, 0x2B, 0x00, 0x2C, 0x00, 0x2D, 0x00, 0x2E, 0x00, 0x2F, 0x00, 0x30, 0x00, 0x31, 0x00
	.byte 0x32, 0x00, 0x33, 0x00, 0x34, 0x00, 0x35, 0x00, 0x36, 0x00, 0x37, 0x00, 0x38, 0x00, 0x39, 0x00
	.byte 0x3A, 0x00, 0x3B, 0x00, 0x3C, 0x00, 0x3D, 0x00, 0x3E, 0x00, 0x3F, 0x00, 0x40, 0x00, 0x41, 0x00
	.byte 0x42, 0x00, 0x43, 0x00, 0x44, 0x00, 0x45, 0x00, 0x46, 0x00, 0x47, 0x00, 0x48, 0x00, 0x49, 0x00
	.byte 0x4A, 0x00, 0x4B, 0x00, 0x4C, 0x00, 0x4D, 0x00, 0x4E, 0x00, 0x4F, 0x00, 0x50, 0x00, 0x51, 0x00
	.byte 0x52, 0x00, 0x53, 0x00, 0x54, 0x00, 0x55, 0x00, 0x56, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00
	.byte 0x5A, 0x00, 0x5B, 0x00, 0x5C, 0x00, 0x5D, 0x00, 0x5E, 0x00, 0x5F, 0x00, 0x60, 0x00, 0x41, 0x00
	.byte 0x42, 0x00, 0x43, 0x00, 0x44, 0x00, 0x45, 0x00, 0x46, 0x00, 0x47, 0x00, 0x48, 0x00, 0x49, 0x00
	.byte 0x4A, 0x00, 0x4B, 0x00, 0x4C, 0x00, 0x4D, 0x00, 0x4E, 0x00, 0x4F, 0x00, 0x50, 0x00, 0x51, 0x00
	.byte 0x52, 0x00, 0x53, 0x00, 0x54, 0x00, 0x55, 0x00, 0x56, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00
	.byte 0x5A, 0x00, 0x7B, 0x00, 0x7C, 0x00, 0x7D, 0x00, 0x7E, 0x00, 0x7F, 0x00

_0210E93C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x03, 0xB8, 0xE2, 0x3F

_0210E94C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0xF0, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF8, 0x3F

_0210E95C:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x06, 0xD0, 0xCF, 0x43, 0xEB, 0xFD, 0x4C, 0x3E

	.data

_02110FCC:
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x24, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word _021E57C0
	.byte 0x00, 0x01, 0x00, 0x00
	.word _021E57C0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word __read_console
	.word __write_console
	.word __close_console
	.word 0x00000000
_02111018:
	.byte 0x01, 0x00, 0x00, 0x00, 0x28, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word _021E56C0
	.byte 0x00, 0x01, 0x00, 0x00
	.word _021E56C0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
	.word __read_console
	.word __write_console
	.word __close_console
	.word 0x00000000
_02111064:
	.byte 0x02, 0x00, 0x00, 0x00, 0x08, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word _021E55C0
	.byte 0x00, 0x01, 0x00, 0x00
	.word _021E55C0
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word __read_console
	.word __write_console
	.word __close_console
	.word 0x00000000
_021110B0:
	.asciz "Assertion (%s) failed in \"%s\", function \"%s\", line %d\n"
	.balign 4, 0
_021110E8:
	.byte 0x00, 0x00, 0x80, 0x7F
_021110EC:
	.byte 0xFF, 0xFF, 0xFF, 0x7F
_021110F0:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xF0, 0x7F
_021110F8:
	.byte 0x00, 0x00, 0x00, 0x00
	.balign 4, 0
_021110FC:
	.asciz "%T"
	.balign 4, 0
_02111100:
	.asciz "AM|PM"
	.balign 4, 0
_02111108:
	.word __mbtowc_noconv
	.word __wctomb_noconv
_02111110:
	.byte 0x20, 0x00, 0x00, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.word _02111140
_02111120:
	.word _02111100
	.word _02111224
	.word _02111218
	.word _02111200
	.word _021110FC
	.word _02111234
	.word _0211128C
	.word _021110F8
_02111140:
	.byte 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0x05, 0x00, 0x06, 0x00, 0x07, 0x00, 0x08, 0x00
	.byte 0x09, 0x00, 0x0A, 0x00, 0x0B, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x0E, 0x00, 0x0F, 0x00, 0x10, 0x00
	.byte 0x21, 0x00, 0x22, 0x00, 0x23, 0x00, 0x24, 0x00, 0x25, 0x00, 0x26, 0x00, 0x27, 0x00, 0x28, 0x00
	.byte 0x29, 0x00, 0x2A, 0x00, 0x11, 0x00, 0x12, 0x00, 0x13, 0x00, 0x14, 0x00, 0x15, 0x00, 0x16, 0x00
	.byte 0x17, 0x00, 0x2B, 0x00, 0x2D, 0x00, 0x2F, 0x00, 0x31, 0x00, 0x33, 0x00, 0x35, 0x00, 0x37, 0x00
	.byte 0x39, 0x00, 0x3B, 0x00, 0x3D, 0x00, 0x3F, 0x00, 0x41, 0x00, 0x43, 0x00, 0x45, 0x00, 0x47, 0x00
	.byte 0x49, 0x00, 0x4B, 0x00, 0x4D, 0x00, 0x4F, 0x00, 0x51, 0x00, 0x53, 0x00, 0x55, 0x00, 0x57, 0x00
	.byte 0x59, 0x00, 0x5B, 0x00, 0x5D, 0x00, 0x18, 0x00, 0x19, 0x00, 0x1A, 0x00, 0x1B, 0x00, 0x1C, 0x00
	.byte 0x00, 0x00, 0x2C, 0x00, 0x2E, 0x00, 0x30, 0x00, 0x32, 0x00, 0x34, 0x00, 0x36, 0x00, 0x38, 0x00
	.byte 0x3A, 0x00, 0x3C, 0x00, 0x3E, 0x00, 0x40, 0x00, 0x42, 0x00, 0x44, 0x00, 0x46, 0x00, 0x48, 0x00
	.byte 0x4A, 0x00, 0x4C, 0x00, 0x4E, 0x00, 0x50, 0x00, 0x52, 0x00, 0x54, 0x00, 0x56, 0x00, 0x58, 0x00
	.byte 0x5A, 0x00, 0x5C, 0x00, 0x5E, 0x00, 0x1D, 0x00, 0x1E, 0x00, 0x1F, 0x00, 0x20, 0x00, 0x00, 0x00
	.balign 4, 0
_02111200:
	.asciz "%m/%d/%y"
	.balign 4, 0
_0211120C:
	.word _02111120
	.word _02111110
	.word _02111108
	.balign 4, 0
_02111218:
	.asciz "%I:%M:%S %p"
	.balign 4, 0
_02111224:
	.asciz "%a %b %e %T %Y"
	.balign 4, 0
_02111234:
	.asciz "Sun|Sunday|Mon|Monday|Tue|Tuesday|Wed|Wednesday|Thu|Thursday|Fri|Friday|Sat|Saturday"
	.balign 4, 0
_0211128C:
	.asciz "Jan|January|Feb|February|Mar|March|Apr|April|May|May|Jun|June|Jul|July|Aug|August|Sep|September|Oct|October|Nov|November|Dec|December"
	.balign 4, 0
_02111314:
	.asciz "0x0p0"
	.balign 4, 0
_0211131C:
	.asciz "-INF"
	.balign 4, 0
_02111324:
	.asciz "-inf"
	.balign 4, 0
_0211132C:
	.asciz "INF"
	.balign 4, 0
_02111330:
	.asciz "inf"
	.balign 4, 0
_02111334:
	.asciz "-NAN"
	.balign 4, 0
_0211133C:
	.asciz "-nan"
	.balign 4, 0
_02111344:
	.asciz "NAN"
	.balign 4, 0
_02111348:
	.asciz "nan"
	.balign 4, 0
_0211134C:
	.byte 0x00, 0x00, 0x00, 0x00
_02111350:
	.byte 0x00, 0x00, 0x00, 0x00
_02111354:
	.byte 0x01, 0x00, 0x00, 0x00
_02111358:
	.byte 0x00, 0x00, 0x00, 0x00
_0211135C:
	.word _02111358
	.word _02111358
_02111364:
	.byte 0x30, 0x00, 0x78, 0x00, 0x30, 0x00, 0x70, 0x00, 0x30, 0x00, 0x00, 0x00
_02111370:
	.byte 0x2D, 0x00, 0x49, 0x00, 0x4E, 0x00, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00
_0211137C:
	.byte 0x2D, 0x00, 0x69, 0x00
	.byte 0x6E, 0x00, 0x66, 0x00, 0x00, 0x00, 0x00, 0x00
_02111388:
	.byte 0x49, 0x00, 0x4E, 0x00, 0x46, 0x00, 0x00, 0x00
_02111390:
	.byte 0x69, 0x00, 0x6E, 0x00, 0x66, 0x00, 0x00, 0x00
_02111398:
	.byte 0x2D, 0x00, 0x4E, 0x00, 0x41, 0x00, 0x4E, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_021113A4:
	.byte 0x2D, 0x00, 0x6E, 0x00, 0x61, 0x00, 0x6E, 0x00, 0x00, 0x00, 0x00, 0x00
_021113B0:
	.byte 0x4E, 0x00, 0x41, 0x00, 0x4E, 0x00, 0x00, 0x00
_021113B8:
	.byte 0x6E, 0x00, 0x61, 0x00, 0x6E, 0x00, 0x00, 0x00
_021113C0:
	.byte 0x00, 0x00, 0x00, 0x00
_021113C4:
	.byte 0x00, 0x00, 0x00, 0x00
_021113C8:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x24, 0x40
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x59, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x40, 0x8F, 0x40
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x88, 0xC3, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x6A, 0xF8, 0x40
	.byte 0x00, 0x00, 0x00, 0x00, 0x80, 0x84, 0x2E, 0x41, 0x00, 0x00, 0x00, 0x00, 0xD0, 0x12, 0x63, 0x41
	.byte 0x00, 0x00, 0x00, 0x00, 0x84, 0xD7, 0x97, 0x41
	.balign 4, 0
_02111408:
	.asciz "542101086242752217003726400434970855712890625"
	.balign 4, 0
_02111438:
	.asciz "11102230246251565404236316680908203125"
	.balign 4, 0
_02111460:
	.asciz "23283064365386962890625"
	.balign 4, 0
_02111478:
	.asciz "152587890625"
	.balign 4, 0
_02111488:
	.asciz "390625"
	.balign 4, 0
_02111490:
	.asciz "78125"
	.balign 4, 0
_02111498:
	.asciz "15625"
	.balign 4, 0
_021114A0:
	.asciz "3125"
	.balign 4, 0
_021114A8:
	.asciz "625"
	.balign 4, 0
_021114AC:
	.asciz "125"
	.balign 4, 0
_021114B0:
	.asciz "25"
	.balign 4, 0
_021114B4:
	.asciz "5"
	.balign 4, 0
_021114B8:
	.asciz "1"
	.balign 4, 0
_021114BC:
	.asciz "2"
	.balign 4, 0
_021114C0:
	.asciz "4"
	.balign 4, 0
_021114C4:
	.asciz "8"
	.balign 4, 0
_021114C8:
	.asciz "16"
	.balign 4, 0
_021114CC:
	.asciz "32"
	.balign 4, 0
_021114D0:
	.asciz "64"
	.balign 4, 0
_021114D4:
	.asciz "128"
	.balign 4, 0
_021114D8:
	.asciz "256"
	.balign 4, 0
_021114DC:
	.asciz "179769313486231580793728714053034151"
	.balign 4, 0
_02111504:
	.word _021117F4
	.word _02111528
_0211150C:
	.word _021117F4
	.word _0211158C
_02111514:
	.word _021117F4
	.word _02111568
_0211151C:
	.word _021117E4
	.word _021115B8
	.word _0211150C
_02111528:
	.asciz "St9exception"
	.balign 4, 0
_02111538:
	.word 0
	.word _0211150C
_02111540:
	.word _ZNSt9exceptionD1Ev
	.word _ZNSt9exceptionD0Ev
	.word 0
	.word 0
	.word 0
	.word _0211151C
_02111558:
	.word _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED1Ev
	.word _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED0Ev
	.word _ZNKSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE11get_deleterERKSt9type_info
	.word _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE7disposeEv
_02111568:
	.asciz "NSt6detail14default_deleteIA0_cEE"
	.balign 4, 0
_0211158C:
	.asciz "NSt3tr16detail25shared_ptr_deleter_commonE"
	.balign 4, 0
_021115B8:
	.asciz "NSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEEE"
	.balign 4, 0
_02111600:
	.word _021117E4
	.word _02111618
	.word _02111504
_0211160C:
	.word _021117E4
	.word _02111628
	.word _02111600
_02111618:
	.asciz "St11logic_error"
	.balign 4, 0
_02111628:
	.asciz "St12length_error"
	.balign 4, 0
_0211163C:
	.word 0
	.word _0211160C
_02111644:
	.word _ZNSt12length_errorD1Ev
	.word _ZNSt12length_errorD0Ev
	.word _ZNSt3tr16detail25shared_ptr_deleter_commonD2Ev
	.word 0
	.word _02111600
_02111658:
	.word _ZNSt11logic_errorD1Ev
	.word _ZNSt11logic_errorD0Ev
	.word _ZNSt3tr16detail25shared_ptr_deleter_commonD2Ev
_02111664:
	.asciz "vector length error"
	.balign 4, 0
_02111678:
	.asciz "!std::exception!!std::logic_error!!std::length_error!!"
	.balign 4, 0
_021116B0:
	.word _021117E4
	.word _021116CC
	.word _02111504
_ZZNKSt13bad_exception4whatEvEs:
	.asciz "bad_exception"
	.balign 4, 0
_021116CC:
	.asciz "St13bad_exception"
	.balign 4, 0
_021116E0:
	.word 0
	.word _021116B0
_021116E8:
	.word _ZNSt13bad_exceptionD1Ev
	.word _ZNSt13bad_exceptionD0Ev
	.word _ZNKSt13bad_exception4whatEv
_021116F4:
	.asciz "!std::bad_exception!!"
	.balign 4, 0
_0211170C:
	.asciz "!std::exception!!std::bad_exception!!"
	.balign 4, 0
_02111734:
	.byte 1
	.balign 4, 0
_02111738:
	.asciz "bad_alloc"
	.balign 4, 0
_02111744:
	.word _021117E4
	.word _02111750
	.word _02111504
_02111750:
	.asciz "St9bad_alloc"
	.balign 4, 0
_02111760:
	.asciz "!std::bad_alloc!"
	.balign 4, 0
_02111774:
	.word 0
	.word _02111744
_ZTVSt9bad_alloc:
	.word _ZNSt9bad_allocD1Ev
	.word _ZNSt9bad_allocD0Ev
	.word _ZNKSt9bad_alloc4whatEv
_02111788:
	.asciz "!std::exception!!std::bad_alloc!!"
	.balign 4, 0
_021117AC:
	.word _021117F4
	.word _021117CC
_021117B4:
	.word _021117E4
	.word _02111820
	.word _021117C0
_021117C0:
	.word _021117E4
	.word _021117FC
	.word _021117AC
_021117CC:
	.asciz "St9type_info"
	.balign 4, 0
_021117DC:
	.word 0
	.word _021117B4
_021117E4:
	.word _ZN10__cxxabiv120__si_class_type_infoD1Ev
	.word _ZN10__cxxabiv120__si_class_type_infoD0Ev
	.word 0
	.word _021117C0
_021117F4:
	.word _ZN10__cxxabiv117__class_type_infoD1Ev
	.word _ZN10__cxxabiv117__class_type_infoD0Ev
_021117FC:
	.asciz "N10__cxxabiv117__class_type_infoE"
	.balign 4, 0
_02111820:
	.asciz "N10__cxxabiv120__si_class_type_infoE"
	.balign 4, 0
_02111848:
	.word _ZSt9dthandlerv
	.word _ZSt9duhandlerv

	exception abort, 0x0025, 0x00100000
	exception exit, 0x004D, 0x00100100
	exception __exit, 0x0129, 0x00200300
	exception nan, 0x0019, 0x00000000
	exception malloc, 0x0019, 0x00100000
	exception free, 0x0015, 0x00100000
	exception __flush_line_buffered_output_files, 0x008D, 0x00403F00
	exception __flush_all, 0x0069, 0x00403F00
	exception __msl_assertion_failed, 0x003D, 0x00200100
	exception __load_buffer, 0x008D, 0x00200700
	exception __flush_buffer, 0x0089, 0x00200300
	exception fread, 0x010D, 0x00407F00
	exception __fread, 0x0349, 0x00507F00
	exception __fwrite, 0x02B1, 0x0060FF00
	exception fclose, 0x0075, 0x00200300
	exception fflush, 0x00E9, 0x00100100
	exception ftell, 0x011D, 0x00300F00
	exception _fseek, 0x01E9, 0x00400320
	exception fseek, 0x012D, 0x00403F00
	exception rewind, 0x0025, 0x00100100
	exception mbtowc, 0x001D, 0x00100000
	exception wctomb, 0x001D, 0x00100000
	exception mbstowcs, 0x0089, 0x00301F00
	exception wcstombs, 0x0079, 0x00403F00
	exception memset, 0x0015, 0x00100100
	exception long2str__printf, 0x024D, 0x0090FF20
	exception longlong2str__printf, 0x02FD, 0x00A0FF20
	exception double2hex__printf, 0x04DD, 0x00F07F20
	exception float2str__printf, 0x0765, 0x00C0FF20
	exception __pformatter, 0x0824, _020F4F84
	exception __FileWrite, 0x002D, 0x00200300
	exception __StringWrite, 0x0045, 0x00200300
	exception printf, 0x0119, 0x00300120
	exception vsnprintf, 0x0069, 0x00300300
	exception vsprintf, 0x0019, 0x00000000
	exception snprintf, 0x0029, 0x00300020
	exception sprintf, 0x002D, 0x00300020
	exception qsort, 0x0165, 0x0070FF00
	exception __sformatter, 0x0D54, _020F4F8C
	exception vsscanf, 0x0055, 0x00200000
	exception sscanf, 0x0029, 0x00300020
	exception raise, 0x0131, 0x00200300
	exception __strtold, 0x124C, _020F4F94
	exception strtold, 0x00E1, 0x00500F00
	exception atof, 0x0011, 0x00000000
	exception __strtoul, 0x03E9, 0x0060FF00
	exception __strtoull, 0x046D, 0x00807F00
	exception strtoul, 0x0099, 0x00600300
	exception strtol, 0x00C9, 0x00600300
	exception atoi, 0x0015, 0x00000000
	exception wmemcpy, 0x0011, 0x00000000
	exception long2str__wprintf, 0x0251, 0x0090FF20
	exception longlong2str__wprintf, 0x0301, 0x00A0FF20
	exception double2hex__wprintf, 0x0399, 0x00F07F20
	exception float2str__wprintf, 0x064C, _020F4F9C
	exception __wpformatter, 0x08F0, _020F4FA4
	exception __wStringWrite, 0x0041, 0x00200300
	exception swprintf, 0x0029, 0x00300020
	exception vswprintf, 0x0071, 0x00300300
	exception __ieee754_pow, 0x1188, _020F4FAC
	exception frexp, 0x00BD, 0x00300120
	exception ldexp, 0x024D, 0x00300120
	exception pow, 0x000D, 0x00000000
	exception __rounddec, 0x0041, 0x00200300
	exception __ull2dec, 0x00CD, 0x0050FF00
	exception __timesdec, 0x0185, 0x00D0FF00
	exception __str2dec, 0x009D, 0x00100000
	exception __two_exp, 0x0385, 0x00B00300
	exception __num2dec_internal, 0x0181, 0x00E01F00
	exception __num2dec, 0x00A9, 0x00200300
	exception __dec2num, 0x0624, _020F4FB4
	exception scalbn, 0x002D, 0x00200100
	exception __sys_alloc, 0x0019, 0x00000000
	exception __sys_free, 0x0019, 0x00000000
	exception _ZNSt3tr110shared_ptrIcEC1IcNSt6detail14default_deleteIA0_cEEEEPT_T0_, 0x0080, _020F4FBC
	exception _ZNSt9exceptionD0Ev, 0x0015, 0x00100100
	exception _ZNKSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE11get_deleterERKSt9type_info, 0x0029, 0x00100100
	exception _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEE7disposeEv, 0x0011, 0x00000000
	exception _ZNSt3tr110shared_ptrIcED1Ev, 0x0040, _020F4FCC
	exception _ZN10Metrowerks8move_ptrIcRNSt6detail14default_deleteIA0_cEEED1Ev, 0x0021, 0x00100100
	exception _ZNSt3tr16detail18shared_ptr_deleterIcNSt6detail14default_deleteIA0_cEEED0Ev, 0x0015, 0x00100100
	exception _ZNSt11logic_errorD1Ev, 0x0019, 0x00100100
	exception _ZNSt11logic_errorD0Ev, 0x0021, 0x00100100
	exception _ZNSt12length_errorD1Ev, 0x0019, 0x00100100
	exception _ZNSt12length_errorD0Ev, 0x0021, 0x00100100
	exception _ZNSt3tr16detail25shared_ptr_deleter_common7releaseEv, 0x0031, 0x00100100
	exception _ZNSt3tr16detail25shared_ptr_deleter_common12release_weakEv, 0x002D, 0x00100000
	exception _ZNSt15__vector_commonILb1EE18throw_length_errorEv, 0x0090, _020F4FE0
	exception __read_console, 0x0051, 0x00300F00
	exception __write_console, 0x0035, 0x00200700
	exception _Z19FindExceptionRecordPcP13ExceptionInfo, 0x0109, 0x00503F00
	exception _Z10NextActionP14ActionIterator, 0x0388, _020F4FF8
	exception _Z11UnwindStackP12ThrowContextP13ExceptionInfoPc, 0x08B0, _020F5000
	exception _Z23FindMostRecentExceptionP12ThrowContextP13ExceptionInfo, 0x0154, _020F5010
	exception _Z17IsInSpecificationPcP16ex_specification, 0x0085, 0x00401F00
	exception __unexpected, 0x00A8, _020F5018
	exception _Z16HandleUnexpectedP12ThrowContextP13ExceptionInfoP16ex_specificationPc, 0x0060, _020F502C
	exception _Z20FindExceptionHandlerP12ThrowContextP13ExceptionInfoPl, 0x01DC, _020F5034
	exception _Z14__ThrowHandlerP12ThrowContext, 0x00ED, 0x00700300
	exception __end__catch, 0x0029, 0x00100000
	exception _ZNSt13bad_exceptionD0Ev, 0x0015, 0x00100100
	exception _ZSt17__throw_bad_allocv, 0x0041, 0x00100000
	exception _Znwm, 0x0064, _020F503C
	exception _ZnwmRKSt9nothrow_t, 0x0044, _020F5054
	exception _ZdlPv, 0x0015, 0x00100000
	exception _Znam, 0x002C, _020F5070
	exception _ZnamRKSt9nothrow_t, 0x002C, _020F5088
	exception _ZdaPv, 0x000D, 0x00000000
	exception _ZNSt9bad_allocD0Ev, 0x0015, 0x00100100
	exception __call_static_initializers, 0x002D, 0x00100100
	exception __destroy_global_chain, 0x0045, 0x00200300
	exception _ZNKSt9type_infoeqERKS_, 0x0031, 0x00100000
	exception _ZN10__cxxabiv117__class_type_infoD1Ev, 0x0015, 0x00100100
	exception _ZN10__cxxabiv117__class_type_infoD0Ev, 0x001D, 0x00100100
	exception _ZN10__cxxabiv117__class_type_infoD2Ev, 0x0015, 0x00100100
	exception _ZN10__cxxabiv120__si_class_type_infoD1Ev, 0x0015, 0x00100100
	exception _ZN10__cxxabiv120__si_class_type_infoD0Ev, 0x001D, 0x00100100
	exception _ZSt9dthandlerv, 0x000D, 0x00000000
	exception _ZSt9duhandlerv, 0x000D, 0x00000000
	exception _ZSt9terminatev, 0x0019, 0x00100000
	exception _ZSt10unexpectedv, 0x0019, 0x00100000
	exception _Z16__SetupFrameInfoP12ThrowContextP13ExceptionInfo, 0x00A1, 0x00200700
	exception _Z16__SkipUnwindInfoPc, 0x0031, 0x00200100
	exception _ExitProcess, 0x000D, 0x00000000

	.section .exception,4,1,2
	; MSL symbols have exceptions for C++ mode, even when compiling C.

_020F4F84:
	.byte 0x20, 0xFF, 0x09, 0x60, 0x00, 0x00, 0x00, 0x00
_020F4F8C:
	.byte 0x00, 0xFF, 0x01, 0xB0, 0x00, 0x00, 0x00, 0x00
_020F4F94:
	.byte 0x00, 0xFF, 0x01, 0xD0, 0x00, 0x00, 0x00, 0x00
_020F4F9C:
	.byte 0x20, 0xFF, 0x09, 0x60, 0x00, 0x00, 0x00, 0x00
_020F4FA4:
	.byte 0x20, 0xFF, 0x11, 0x68, 0x00, 0x00, 0x00, 0x00
_020F4FAC:
	.byte 0x20, 0xFF, 0x01, 0xB8, 0x00, 0x00, 0x00, 0x00
_020F4FB4:
	.byte 0x00, 0xFF, 0x05, 0x20, 0x00, 0x00, 0x00, 0x00
_020F4FBC:
	.byte 0x20, 0x03, 0x50, 0x58, 0x00, 0x0E, 0x00, 0x82, 0x00, 0xF0, 0x04, 0x0F, 0x02, 0x00, 0x00, 0x00
_020F4FCC:
	.byte 0x40, 0x81, 0x50, 0x00
	.byte 0x40, 0x00, 0x16, 0x28, 0x00, 0x1E, 0x00, 0x8F, 0x00, 0x58, 0x00, 0x8D, 0x00, 0x00, 0x00, 0x00
_020F4FE0:
	.byte 0x00, 0x07, 0x40, 0x48, 0x58, 0x22, 0x18, 0x00, 0x14, 0x00, 0x27, 0x0A, 0x00, 0xB0, 0x04, 0x0F
	.byte 0x02, 0xA6, 0x0C, 0x00
	.word _ZNSt9exceptionD2Ev
_020F4FF8:
	.byte 0x00, 0x03, 0x01, 0xB0, 0x00, 0x00, 0x00, 0x00
_020F5000:
	.byte 0x00, 0xFF, 0x01, 0xC8, 0x58, 0x1D, 0xB8, 0x1A, 0x01, 0x8C, 0x50, 0x1A, 0x00, 0x8E, 0x00, 0x00
_020F5010:
	.byte 0x00, 0x03, 0x01, 0x98, 0x00, 0x00, 0x00, 0x00
_020F5018:
	.byte 0x40, 0x81, 0x70, 0x00, 0x30, 0x00, 0x16, 0x20
	.byte 0xB0, 0x24, 0x00, 0x8C, 0x00, 0x00, 0x00, 0x00, 0x38, 0x08, 0x8D, 0x08
_020F502C:
	.byte 0x00, 0x0F, 0x30, 0x38, 0x80, 0x0E, 0x00, 0x8E
_020F5034:
	.byte 0x00, 0xFF, 0x01, 0xC8, 0x00, 0x00, 0x00, 0x00
_020F503C:
	.byte 0x40, 0x87, 0x60, 0x00
	.byte 0x40, 0x40, 0x16, 0x28, 0x00, 0x26, 0x00, 0x8F, 0x02, 0x98, 0x00, 0x60, 0x17, 0x11, 0x02, 0x8D
	.byte 0x00, 0x00, 0x00, 0x00
_020F5054:
	.byte 0x40, 0x80, 0x70, 0x00, 0x28, 0x00, 0x1C, 0x20, 0x00, 0x2A, 0x28, 0x00
	.byte 0x32, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x38, 0x30, 0x8F, 0x00, 0x60, 0x00, 0x8D, 0x00, 0x00
_020F5070:
	.byte 0x40, 0x80, 0x40, 0x00, 0x20, 0x00, 0x16, 0x20, 0x00, 0x26, 0x00, 0x8F, 0x02, 0x30, 0x00, 0x60
	.byte 0x17, 0x11, 0x02, 0x8D, 0x00, 0x00, 0x00, 0x00
_020F5088:
	.byte 0x40, 0x80, 0x40, 0x00, 0x20, 0x00, 0x16, 0x20
	.byte 0x00, 0x1E, 0x00, 0x8F, 0x00, 0x30, 0x00, 0x8D, 0x00, 0x00, 0x00, 0x00
