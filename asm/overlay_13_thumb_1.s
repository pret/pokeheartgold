	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov13_0221BA00
ov13_0221BA00: @ 0x0221BA00
	push {r3, r4, r5, r6, r7, lr}
	movs r5, #0
	str r0, [sp]
	movs r4, #0x7f
	movs r6, #1
	adds r7, r5, #0
_0221BA0C:
	adds r0, r5, #0
	adds r1, r4, #0
	blx FUN_020C7F74
	adds r0, r5, #0
	adds r1, r6, #0
	blx FUN_020C7F8C
	adds r0, r5, #0
	adds r1, r7, #0
	blx FUN_020C7FAC
	adds r5, r5, #1
	cmp r5, #0x20
	blt _0221BA0C
	bl FUN_02034D8C
	blx FUN_020D33C0
	blx FUN_020D365C
	blx FUN_020D3A38
	adds r5, r0, #0
	movs r0, #2
	blx FUN_021EC454
	movs r1, #1
	ldr r0, [sp]
	lsls r1, r1, #0x12
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r1, #1
	movs r2, #0
	blx ov13_0222B430
	adds r0, r4, #0
	bl FUN_0201AB0C
	adds r0, r5, #0
	blx FUN_020D3A4C
	ldr r1, _0221BA6C @ =0x04000208
	ldrh r0, [r1]
	movs r0, #1
	strh r0, [r1]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0221BA6C: .4byte 0x04000208
	thumb_func_end ov13_0221BA00
