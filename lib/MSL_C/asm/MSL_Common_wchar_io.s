	.include "asm/macros.inc"
#include <nitro/fs/overlay.h>
	.include "global.inc"

	.text

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
