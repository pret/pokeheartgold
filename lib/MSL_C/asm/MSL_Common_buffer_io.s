	.include "asm/macros.inc"
#include <nitro/fs/overlay.h>
	.include "global.inc"

	.text

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

	exception __load_buffer, 0x008D, 0x00200700
	exception __flush_buffer, 0x0089, 0x00200300
