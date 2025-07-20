	.include "asm/macros.inc"
	.include "MSL_Common_mem.inc"
	.include "global.inc"

	.text

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

	exception memset, 0x0015, 0x00100100
