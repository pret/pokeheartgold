	.include "asm/macros.inc"
#include <nitro/fs/overlay.h>
	.include "global.inc"

	.text

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
