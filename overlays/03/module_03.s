
	thumb_func_start MOD03_02253E20
MOD03_02253E20: @ 0x02253E20
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02253ECC @ =0x022598A0
	adds r4, r1, #0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	bne _02253E42
	ldr r0, _02253ECC @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_020200A0
_02253E42:
	cmp r4, #0
	beq _02253E64
	ldr r0, _02253ECC @ =0x022598A0
	adds r1, r5, #0
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0x10]
	bl FUN_0200BB6C
	ldr r0, _02253ECC @ =0x022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x58]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #0x10]
	bl FUN_0200CBBC
	b _02253E72
_02253E64:
	ldr r0, _02253ECC @ =0x022598A0
	adds r1, r5, #0
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0x14]
	bl FUN_0200BB6C
_02253E72:
	ldr r0, _02253ECC @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x40
	bl FUN_0201D3F0
	cmp r0, #0
	bne _02253E90
	ldr r0, _02253ECC @ =0x022598A0
	movs r2, #3
	ldr r1, [r0]
	ldr r0, [r1, #0x68]
	adds r1, #0x40
	ldr r0, [r0, #8]
	bl FUN_0205B514
_02253E90:
	ldr r0, _02253ECC @ =0x022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x68]
	ldr r0, [r0, #0xc]
	bl FUN_02028EA8
	adds r1, r0, #0
	ldr r0, _02253ECC @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x40
	bl FUN_0205B564
	ldr r0, _02253ECC @ =0x022598A0
	ldr r4, [r0]
	ldr r0, [r4, #0x68]
	ldr r0, [r0, #0xc]
	bl FUN_02028EA8
	adds r2, r0, #0
	adds r0, r4, #0
	ldr r1, [r4, #0x14]
	adds r0, #0x40
	movs r3, #1
	bl FUN_0205B5B4
	ldr r1, _02253ECC @ =0x022598A0
	ldr r1, [r1]
	adds r1, #0x94
	strb r0, [r1]
	pop {r3, r4, r5, pc}
	.align 2, 0
_02253ECC: .4byte 0x022598A0
	thumb_func_end MOD03_02253E20
