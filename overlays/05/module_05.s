
	thumb_func_start MOD05_0221BA00
MOD05_0221BA00: @ 0x0221BA00
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0221BA5C @ =0x0221BA71
	ldr r1, _0221BA60 @ =0x00000BD4
	ldr r3, [r5, #0x24]
	movs r2, #0x64
	bl FUN_02007200
	bl FUN_0201F988
	ldr r2, _0221BA60 @ =0x00000BD4
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020E5B44
	ldr r0, _0221BA64 @ =0x00000B7F
	str r5, [r4]
	movs r1, #0
	strb r1, [r4, r0]
	bl FUN_020304B4
	ldr r1, _0221BA68 @ =0x00000BC8
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	cmp r0, #1
	bne _0221BA58
	ldr r0, [r4]
	ldr r1, [r0]
	cmp r1, #0
	beq _0221BA58
	movs r0, #7
	lsls r0, r0, #6
	ldr r0, [r1, r0]
	cmp r0, #0
	beq _0221BA58
	bl FUN_0207879C
	ldr r1, _0221BA6C @ =0x000001D1
	ldr r3, [r5, #0x24]
	movs r2, #1
	bl FUN_020784B0
	ldr r1, _0221BA68 @ =0x00000BC8
	str r0, [r4, r1]
_0221BA58:
	pop {r3, r4, r5, pc}
	nop
_0221BA5C: .4byte 0x0221BA71
_0221BA60: .4byte 0x00000BD4
_0221BA64: .4byte 0x00000B7F
_0221BA68: .4byte 0x00000BC8
_0221BA6C: .4byte 0x000001D1
	thumb_func_end MOD05_0221BA00
