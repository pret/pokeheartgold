
	thumb_func_start MOD94_021E5900
MOD94_021E5900: @ 0x021E5900
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x32
	lsls r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5912
	bl FUN_0202551C
_021E5912:
	movs r0, #0xc
	movs r1, #0x1c
	bl FUN_0201AA8C
	movs r1, #0x32
	lsls r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	movs r1, #0
	movs r2, #0x1c
	blx FUN_020D4994
	ldr r0, _021E5938 @ =0x00000C65
	ldrb r1, [r4, r0]
	adds r0, #0x1b
	ldr r0, [r4, r0]
	str r1, [r0, #0x14]
	pop {r4, pc}
	nop
_021E5938: .4byte 0x00000C65
	thumb_func_end MOD94_021E5900
