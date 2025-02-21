	.include "asm/macros.inc"
#include <nitro/fs/overlay.h>
	.include "global.inc"

	.text

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
