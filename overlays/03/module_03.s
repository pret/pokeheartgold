
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

	thumb_func_start FUN_02253ED0
FUN_02253ED0: @ 0x02253ED0
	push {r0, r1, r2, r3}
	push {r3, r4, lr}
	sub sp, #0x34
	ldr r0, _02253F6C @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x20
	bl FUN_0201D3F0
	cmp r0, #0
	bne _02253F14
	ldr r0, _02253F6C @ =0x022598A0
	add r3, sp, #0x60
	ldr r1, [r0]
	add r0, sp, #0x64
	ldrb r0, [r0]
	ldrb r3, [r3]
	movs r2, #3
	str r0, [sp]
	add r0, sp, #0x68
	ldrb r0, [r0]
	str r0, [sp, #4]
	add r0, sp, #0x6c
	ldrb r0, [r0]
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	add r0, sp, #0x40
	ldrh r0, [r0, #0x30]
	str r0, [sp, #0x10]
	ldr r0, [r1, #0x68]
	adds r1, #0x20
	ldr r0, [r0, #8]
	bl FUN_0201D40C
_02253F14:
	ldr r0, _02253F6C @ =0x022598A0
	ldr r2, _02253F70 @ =0x000003D9
	ldr r0, [r0]
	movs r1, #1
	adds r0, #0x20
	movs r3, #0xb
	bl FUN_0200E580
	add r4, sp, #0x40
	add r3, sp, #0x14
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldr r0, _02253F6C @ =0x022598A0
	movs r3, #4
	ldr r1, [r0]
	ldr r0, [r1, #0x64]
	adds r1, #0x20
	str r1, [sp, #0x20]
	str r0, [sp, #0x14]
	movs r1, #0
	adds r0, r2, #0
	adds r2, r1, #0
	bl FUN_020011DC
	ldr r1, _02253F6C @ =0x022598A0
	ldr r2, [r1]
	str r0, [r2, #0x5c]
	ldr r0, [r1]
	adds r0, #0x20
	bl FUN_0201D578
	add sp, #0x34
	pop {r3, r4}
	pop {r3}
	add sp, #0x10
	bx r3
	nop
_02253F6C: .4byte 0x022598A0
_02253F70: .4byte 0x000003D9
	thumb_func_end FUN_02253ED0

	thumb_func_start FUN_02253F74
FUN_02253F74: @ 0x02253F74
	push {r3, r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r0, _02254050 @ =0x022598A0
	ldr r0, [r0]
	cmp r0, #0
	beq _02253F84
	bl FUN_0202551C
_02253F84:
	movs r0, #4
	movs r1, #0xac
	bl FUN_0201AA8C
	ldr r1, _02254050 @ =0x022598A0
	movs r2, #0xac
	str r0, [r1]
	movs r1, #0
	blx FUN_020D4994
	ldr r0, _02254050 @ =0x022598A0
	movs r2, #0
	ldr r1, [r0]
	movs r3, #4
	adds r1, #0x88
	str r2, [r1]
	ldr r1, [r0]
	str r4, [r1, #0x68]
	ldr r0, [r0]
	movs r1, #0x1b
	adds r0, #0x97
	strb r2, [r0]
	movs r0, #1
	movs r2, #0xb6
	bl FUN_0200BAF8
	ldr r1, _02254050 @ =0x022598A0
	ldr r2, [r1]
	str r0, [r2, #0x74]
	ldr r0, [r1]
	ldr r0, [r0, #0x68]
	bl FUN_0203E344
	bl FUN_02028E9C
	ldr r1, _02254050 @ =0x022598A0
	ldr r1, [r1]
	str r0, [r1, #0x78]
	movs r0, #4
	bl FUN_02028ED0
	ldr r1, _02254050 @ =0x022598A0
	ldr r2, [r1]
	str r0, [r2, #0x7c]
	ldr r0, [r1]
	adds r0, #0x20
	bl FUN_0201D3C4
	ldr r0, _02254050 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x30
	bl FUN_0201D3C4
	ldr r0, _02254050 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x40
	bl FUN_0201D3C4
	movs r0, #4
	bl FUN_0200BD08
	ldr r1, _02254050 @ =0x022598A0
	ldr r1, [r1]
	str r0, [r1, #0x50]
	movs r0, #4
	bl FUN_0200BD08
	ldr r1, _02254050 @ =0x022598A0
	ldr r1, [r1]
	str r0, [r1, #0x54]
	movs r0, #4
	bl FUN_0200BD08
	ldr r1, _02254050 @ =0x022598A0
	ldr r2, [r1]
	str r0, [r2, #0x58]
	ldr r0, [r1]
	movs r2, #0
	adds r0, #0x98
	strb r2, [r0]
	adds r5, r2, #0
_02254026:
	ldr r0, [r1]
	adds r0, r0, r2
	adds r0, #0x80
	adds r2, r2, #1
	strb r5, [r0]
	cmp r2, #8
	blt _02254026
	ldr r6, _02254050 @ =0x022598A0
	adds r4, r5, #0
	movs r7, #0x8c
_0225403A:
	adds r0, r7, #0
	movs r1, #4
	bl FUN_02026354
	ldr r1, [r6]
	adds r5, r5, #1
	str r0, [r1, r4]
	adds r4, r4, #4
	cmp r5, #8
	blt _0225403A
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02254050: .4byte 0x022598A0
	thumb_func_end FUN_02253F74

	thumb_func_start FUN_02254054
FUN_02254054: @ 0x02254054
	push {r4, r5, r6, lr}
	movs r4, #0
	ldr r6, _022540E4 @ =0x022598A0
	adds r5, r4, #0
_0225405C:
	ldr r0, [r6]
	ldr r0, [r0, r5]
	bl FUN_02026380
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #8
	blt _0225405C
	ldr r0, _022540E4 @ =0x022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x7c]
	bl FUN_0201AB0C
	ldr r0, _022540E4 @ =0x022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x50]
	cmp r0, #0
	beq _0225408C
	bl FUN_0200BDA0
	ldr r0, _022540E4 @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x50]
_0225408C:
	ldr r0, _022540E4 @ =0x022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x54]
	cmp r0, #0
	beq _022540A2
	bl FUN_0200BDA0
	ldr r0, _022540E4 @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x54]
_022540A2:
	ldr r0, _022540E4 @ =0x022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x58]
	cmp r0, #0
	beq _022540B8
	bl FUN_0200BDA0
	ldr r0, _022540E4 @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	str r1, [r0, #0x58]
_022540B8:
	ldr r0, _022540E4 @ =0x022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x74]
	bl FUN_0200BB44
	ldr r0, _022540E4 @ =0x022598A0
	ldr r0, [r0]
	ldr r1, [r0, #0x4c]
	cmp r1, #0
	beq _022540D2
	adds r0, #0x40
	bl FUN_0201D520
_022540D2:
	ldr r0, _022540E4 @ =0x022598A0
	ldr r0, [r0]
	bl FUN_0201AB0C
	ldr r0, _022540E4 @ =0x022598A0
	movs r1, #0
	str r1, [r0]
	pop {r4, r5, r6, pc}
	nop
_022540E4: .4byte 0x022598A0
	thumb_func_end FUN_02254054

	thumb_func_start FUN_022540E8
FUN_022540E8: @ 0x022540E8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02255B98
	adds r2, r0, #0
	ldr r0, [r4, #0x68]
	adds r4, #0x91
	ldrb r1, [r4]
	bl FUN_02058124
	pop {r4, pc}
	.align 2, 0
	thumb_func_end FUN_022540E8

	thumb_func_start FUN_02254100
FUN_02254100: @ 0x02254100
	push {r3, lr}
	ldr r0, _02254118 @ =0x022598A0
	movs r1, #1
	ldr r0, [r0]
	adds r0, #0x98
	strb r1, [r0]
	cmp r2, #0
	bne _02254116
	ldr r0, _0225411C @ =0x000005DC
	bl FUN_0200604C
_02254116:
	pop {r3, pc}
	.align 2, 0
_02254118: .4byte 0x022598A0
_0225411C: .4byte 0x000005DC
	thumb_func_end FUN_02254100

	thumb_func_start FUN_02254120
FUN_02254120: @ 0x02254120
	push {r3, r4, r5, r6, r7, lr}
	movs r1, #3
	adds r5, r0, #0
	movs r4, #0
	bl FUN_02001508
	cmp r0, #0
	bls _0225414E
	adds r6, r4, #0
	movs r7, #3
_02254134:
	lsls r2, r4, #0x18
	adds r0, r5, #0
	adds r1, r6, #0
	lsrs r2, r2, #0x18
	bl FUN_02254150
	adds r0, r5, #0
	adds r1, r7, #0
	adds r4, r4, #1
	bl FUN_02001508
	cmp r4, r0
	blo _02254134
_0225414E:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end FUN_02254120

	thumb_func_start FUN_02254150
FUN_02254150: @ 0x02254150
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r2, #0
	bl FUN_0203511C
	adds r4, r0, #0
	movs r2, #0
	add r0, sp, #0xc
	strh r2, [r0]
	ldr r0, _022542C4 @ =0x022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x5c]
	cmp r0, #0
	beq _02254172
	add r1, sp, #0xc
	bl FUN_020014E8
_02254172:
	add r0, sp, #0xc
	ldrh r1, [r0]
	adds r1, r1, r5
	strh r1, [r0]
	ldr r0, _022542C4 @ =0x022598A0
	lsls r5, r5, #4
	ldr r0, [r0]
	adds r0, #0x20
	bl FUN_0201EE90
	lsls r0, r0, #3
	subs r0, #8
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	ldr r0, _022542C4 @ =0x022598A0
	lsls r3, r5, #0x10
	ldr r0, [r0]
	movs r1, #0xf
	adds r0, #0x20
	movs r2, #8
	lsrs r3, r3, #0x10
	bl FUN_0201DA74
	add r0, sp, #0xc
	ldrh r2, [r0]
	cmp r2, r4
	bge _02254274
	ldr r1, _022542C4 @ =0x022598A0
	adds r0, r2, #0
	ldr r1, [r1]
	ldr r1, [r1, #0x7c]
	bl FUN_020351DC
	movs r3, #2
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _022542C4 @ =0x022598A0
	add r2, sp, #0xc
	ldr r0, [r0]
	ldrh r2, [r2]
	ldr r0, [r0, #0x50]
	movs r1, #0
	adds r2, r2, #1
	bl FUN_0200BFCC
	ldr r0, _022542C4 @ =0x022598A0
	movs r1, #1
	ldr r2, [r0]
	ldr r0, [r2, #0x50]
	ldr r2, [r2, #0x7c]
	bl FUN_0200BE48
	ldr r0, _022542C4 @ =0x022598A0
	movs r1, #0x4c
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #4]
	bl FUN_0200BB6C
	ldr r0, _022542C4 @ =0x022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x50]
	ldm r2, {r1, r2}
	bl FUN_0200CBBC
	ldr r0, _022542C4 @ =0x022598A0
	movs r1, #0
	ldr r2, [r0]
	movs r0, #0xff
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	str r1, [sp, #8]
	ldr r2, [r2]
	adds r0, #0x20
	movs r3, #8
	bl FUN_020200A8
	ldr r0, _022542C4 @ =0x022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x7c]
	bl FUN_02028F84
	adds r2, r0, #0
	movs r1, #2
	lsls r2, r2, #0x10
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _022542C4 @ =0x022598A0
	lsrs r2, r2, #0x10
	ldr r0, [r0]
	movs r3, #5
	ldr r0, [r0, #0x50]
	bl FUN_0200BFCC
	ldr r0, _022542C4 @ =0x022598A0
	movs r1, #0x4e
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0xc]
	bl FUN_0200BB6C
	ldr r0, _022542C4 @ =0x022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x50]
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl FUN_0200CBBC
	ldr r0, _022542C4 @ =0x022598A0
	movs r1, #0
	ldr r2, [r0]
	movs r0, #0xff
	str r5, [sp]
	str r0, [sp, #4]
	str r1, [sp, #8]
	adds r0, r2, #0
	ldr r2, [r2, #8]
	adds r0, #0x20
	movs r3, #0x58
	bl FUN_020200A8
	add sp, #0x10
	pop {r3, r4, r5, pc}
_02254274:
	movs r3, #2
	str r3, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _022542C4 @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	adds r2, r2, #1
	ldr r0, [r0, #0x50]
	bl FUN_0200BFCC
	ldr r0, _022542C4 @ =0x022598A0
	movs r1, #0x4d
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #4]
	bl FUN_0200BB6C
	ldr r0, _022542C4 @ =0x022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x50]
	ldm r2, {r1, r2}
	bl FUN_0200CBBC
	ldr r0, _022542C4 @ =0x022598A0
	movs r1, #0
	ldr r2, [r0]
	movs r0, #0xff
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	str r1, [sp, #8]
	ldr r2, [r2]
	adds r0, #0x20
	movs r3, #8
	bl FUN_020200A8
	add sp, #0x10
	pop {r3, r4, r5, pc}
	nop
_022542C4: .4byte 0x022598A0
	thumb_func_end FUN_02254150

	thumb_func_start FUN_022542C8
FUN_022542C8: @ 0x022542C8
	push {r4, lr}
	sub sp, #0x68
	adds r4, r0, #0
	ldr r0, _02254398 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x30
	bl FUN_0201D3F0
	cmp r0, #0
	bne _02254302
	ldr r0, _02254398 @ =0x022598A0
	movs r2, #3
	ldr r1, [r0]
	movs r0, #2
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0xc9
	str r0, [sp, #0x10]
	ldr r0, [r1, #0x68]
	adds r1, #0x30
	ldr r0, [r0, #8]
	movs r3, #0x17
	bl FUN_0201D40C
_02254302:
	ldr r0, _02254398 @ =0x022598A0
	ldr r2, _0225439C @ =0x000003D9
	ldr r0, [r0]
	movs r1, #1
	adds r0, #0x30
	movs r3, #0xb
	bl FUN_0200E580
	ldr r0, _02254398 @ =0x022598A0
	movs r1, #0xf
	ldr r0, [r0]
	adds r0, #0x30
	bl FUN_0201D978
	ldr r0, _02254398 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x30
	bl FUN_0201D578
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0x97
	strb r1, [r0]
	ldr r0, _022543A0 @ =FUN_02254D64
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	ldr r0, _02254398 @ =0x022598A0
	ldr r0, [r0]
	bl FUN_022543AC
	ldr r3, _022543A4 @ =0x0225927A
	add r2, sp, #0x14
	movs r1, #0x29
_02254348:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _02254348
	ldr r0, _02254398 @ =0x022598A0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x91
	ldrb r0, [r0]
	cmp r0, #8
	bne _02254370
	adds r1, #0x92
	ldrb r0, [r1]
	movs r1, #0
	adds r0, #0x7a
	bl MOD03_02253E20
	b _0225438E
_02254370:
	cmp r0, #0x28
	bne _02254382
	adds r1, #0x92
	ldrb r0, [r1]
	movs r1, #0
	adds r0, #0x94
	bl MOD03_02253E20
	b _0225438E
_02254382:
	lsls r1, r0, #1
	add r0, sp, #0x14
	ldrh r0, [r0, r1]
	movs r1, #0
	bl MOD03_02253E20
_0225438E:
	ldr r0, _022543A8 @ =FUN_02254420
	bl FUN_02254B4C
	add sp, #0x68
	pop {r4, pc}
	.align 2, 0
_02254398: .4byte 0x022598A0
_0225439C: .4byte 0x000003D9
_022543A0: .4byte FUN_02254D64
_022543A4: .4byte 0x0225927A
_022543A8: .4byte FUN_02254420
	thumb_func_end FUN_022542C8

	thumb_func_start FUN_022543AC
FUN_022543AC: @ 0x022543AC
	push {lr}
	sub sp, #0xc
	ldr r0, _0225441C @ =0x022598A0
	movs r1, #0
	ldr r2, [r0]
	ldr r0, [r2, #0x54]
	ldr r2, [r2, #0x78]
	bl FUN_0200BE48
	ldr r0, _0225441C @ =0x022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x78]
	bl FUN_02028F84
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r1, #1
	lsls r2, r2, #0x10
	ldr r0, _0225441C @ =0x022598A0
	str r1, [sp, #4]
	ldr r0, [r0]
	lsrs r2, r2, #0x10
	ldr r0, [r0, #0x54]
	movs r3, #5
	bl FUN_0200BFCC
	ldr r0, _0225441C @ =0x022598A0
	movs r1, #0x4b
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0x18]
	bl FUN_0200BB6C
	ldr r0, _0225441C @ =0x022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x54]
	ldr r1, [r2, #0x1c]
	ldr r2, [r2, #0x18]
	bl FUN_0200CBBC
	ldr r0, _0225441C @ =0x022598A0
	movs r3, #2
	ldr r2, [r0]
	movs r1, #0
	str r3, [sp]
	str r1, [sp, #4]
	adds r0, r2, #0
	str r1, [sp, #8]
	ldr r2, [r2, #0x1c]
	adds r0, #0x30
	bl FUN_020200A8
	add sp, #0xc
	pop {pc}
	nop
_0225441C: .4byte 0x022598A0
	thumb_func_end FUN_022543AC

	thumb_func_start FUN_02254420
FUN_02254420: @ 0x02254420
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	ldr r0, _022544EC @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _022544E6
	movs r0, #0x10
	movs r1, #4
	bl FUN_02014918
	ldr r4, _022544EC @ =0x022598A0
	movs r5, #0
	ldr r1, [r4]
	movs r6, #2
	str r0, [r1, #0x64]
	movs r7, #1
_02254448:
	str r6, [sp]
	str r7, [sp, #4]
	ldr r0, [r4]
	movs r1, #0
	ldr r0, [r0, #0x50]
	adds r2, r5, #1
	adds r3, r6, #0
	bl FUN_0200BFCC
	ldr r2, [r4]
	movs r1, #0x4d
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #4]
	bl FUN_0200BB6C
	ldr r2, [r4]
	ldr r0, [r2, #0x50]
	ldm r2, {r1, r2}
	bl FUN_0200CBBC
	ldr r1, [r4]
	movs r2, #0
	ldr r0, [r1, #0x64]
	ldr r1, [r1]
	bl FUN_02014980
	adds r5, r5, #1
	cmp r5, #0x10
	blt _02254448
	movs r1, #1
	str r1, [sp, #0x10]
	movs r0, #2
	str r0, [sp, #0x14]
	movs r0, #0x14
	str r0, [sp, #0x18]
	movs r0, #0xa
	mov r4, sp
	str r0, [sp, #0x1c]
	subs r4, #0x10
	ldr r3, _022544F0 @ =0x02259164
	str r1, [sp, #0x20]
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r4!, {r0, r1, r2, r3}
	bl FUN_02253ED0
	ldr r0, _022544EC @ =0x022598A0
	ldr r2, _022544F4 @ =0x02259134
	ldr r1, [r0]
	adds r1, #0x9c
	str r2, [r1]
	ldr r1, [r0]
	movs r2, #2
	adds r1, #0xa0
	strb r2, [r1]
	ldr r1, [r0]
	ldr r2, _022544F8 @ =0x0000FFFF
	adds r1, #0xa2
	strh r2, [r1]
	ldr r1, [r0]
	movs r2, #0
	adds r1, #0xa1
	strb r2, [r1]
	ldr r2, [r0]
	movs r1, #7
	ldr r0, [r2, #0x68]
	adds r2, #0x9c
	bl FUN_021F6A9C
	ldr r0, _022544FC @ =FUN_02254500
	bl FUN_02254B4C
_022544E6:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_022544EC: .4byte 0x022598A0
_022544F0: .4byte 0x02259164
_022544F4: .4byte 0x02259134
_022544F8: .4byte 0x0000FFFF
_022544FC: .4byte FUN_02254500
	thumb_func_end FUN_02254420

	thumb_func_start FUN_02254500
FUN_02254500: @ 0x02254500
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_022543AC
	ldr r0, [r4, #0x68]
	bl FUN_021F6B10
	cmp r0, #1
	bne _022545F2
	bl FUN_02037700
	cmp r0, #0
	beq _02254536
	ldr r0, _022545F4 @ =0x022598A0
	movs r1, #3
	ldr r0, [r0]
	adds r0, #0x88
	str r1, [r0]
	bl FUN_02254B44
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225574C
	pop {r3, r4, r5, pc}
_02254536:
	bl FUN_02035184
	cmp r0, #0
	bne _02254574
	ldr r0, _022545F4 @ =0x022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x5c]
	bl FUN_02001338
	movs r2, #0
	mvns r2, r2
	cmp r0, r2
	bne _02254578
	adds r1, r4, #0
	adds r1, #0xa2
	ldrh r1, [r1]
	cmp r1, #0
	bne _0225456C
	ldr r0, _022545F4 @ =0x022598A0
	add r1, sp, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x5c]
	bl FUN_020014DC
	add r0, sp, #0
	ldrh r0, [r0]
	b _02254578
_0225456C:
	cmp r1, #1
	bne _02254578
	subs r0, r2, #1
	b _02254578
_02254574:
	movs r0, #0
	mvns r0, r0
_02254578:
	movs r1, #1
	mvns r1, r1
	cmp r0, r1
	beq _0225458E
	adds r1, r1, #1
	cmp r0, r1
	bne _022545AC
	adds r0, r4, #0
	bl FUN_02254600
	pop {r3, r4, r5, pc}
_0225458E:
	ldr r0, _022545F8 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _022545F4 @ =0x022598A0
	movs r1, #1
	ldr r0, [r0]
	adds r0, #0x88
	str r1, [r0]
	bl FUN_02254B44
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225574C
	pop {r3, r4, r5, pc}
_022545AC:
	ldr r0, _022545F8 @ =0x000005DC
	bl FUN_0200604C
	adds r1, r4, #0
	ldr r0, [r4, #0x5c]
	adds r1, #0x8e
	bl FUN_020014DC
	bl FUN_0203511C
	adds r1, r4, #0
	adds r1, #0x8e
	ldrh r1, [r1]
	cmp r0, r1
	ble _022545F2
	adds r0, r4, #0
	bl FUN_02254600
	adds r0, r4, #0
	adds r0, #0x8e
	ldrh r0, [r0]
	bl FUN_02035150
	adds r1, r4, #0
	adds r1, #0x8e
	adds r4, #0x8e
	strh r0, [r1]
	ldrh r0, [r4]
	bl FUN_02058164
	bl FUN_02037BC8
	ldr r0, _022545FC @ =FUN_02254660
	bl FUN_02254B4C
_022545F2:
	pop {r3, r4, r5, pc}
	.align 2, 0
_022545F4: .4byte 0x022598A0
_022545F8: .4byte 0x000005DC
_022545FC: .4byte FUN_02254660
	thumb_func_end FUN_02254500

	thumb_func_start FUN_02254600
FUN_02254600: @ 0x02254600
	push {r3, lr}
	sub sp, #8
	bl FUN_02035184
	cmp r0, #0
	bne _02254618
	ldr r0, _0225465C @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x98
	ldrb r0, [r0]
	cmp r0, #0
	beq _02254656
_02254618:
	ldr r0, _0225465C @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	adds r0, #0x98
	strb r1, [r0]
	bl FUN_02035198
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0x50
	str r0, [sp, #4]
	ldr r0, _0225465C @ =0x022598A0
	movs r1, #0xf
	ldr r0, [r0]
	movs r2, #8
	adds r0, #0x20
	movs r3, #0
	bl FUN_0201DA74
	ldr r0, _0225465C @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	adds r2, r1, #0
	ldr r0, [r0, #0x5c]
	bl FUN_02254120
	ldr r0, _0225465C @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x20
	bl FUN_0201D578
_02254656:
	add sp, #8
	pop {r3, pc}
	nop
_0225465C: .4byte 0x022598A0
	thumb_func_end FUN_02254600

	thumb_func_start FUN_02254660
FUN_02254660: @ 0x02254660
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02037700
	cmp r0, #0
	beq _02254690
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225574C
	movs r0, #0
	adds r1, r0, #0
	bl MOD03_02253E20
	adds r0, r4, #0
	bl FUN_02255ADC
	ldr r0, _022546AC @ =0x022598A0
	movs r1, #1
	ldr r0, [r0]
	adds r0, #0xa1
	strb r1, [r0]
	pop {r3, r4, r5, pc}
_02254690:
	bl FUN_0203769C
	bl FUN_02034818
	cmp r0, #0
	beq _022546A8
	bl FUN_02037BC8
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_022546B0
_022546A8:
	pop {r3, r4, r5, pc}
	nop
_022546AC: .4byte 0x022598A0
	thumb_func_end FUN_02254660

	thumb_func_start FUN_022546B0
FUN_022546B0: @ 0x022546B0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02037700
	cmp r0, #0
	beq _022546E4
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225574C
	movs r0, #0
	adds r1, r0, #0
	bl MOD03_02253E20
	adds r0, r4, #0
	bl FUN_02255ADC
	ldr r0, _022547D0 @ =0x022598A0
	movs r1, #1
	ldr r0, [r0]
	add sp, #0xc
	adds r0, #0xa1
	strb r1, [r0]
	pop {r4, r5, pc}
_022546E4:
	ldr r1, _022547D0 @ =0x022598A0
	adds r0, r4, #0
	adds r0, #0x8e
	ldr r1, [r1]
	ldrh r0, [r0]
	ldr r1, [r1, #0x7c]
	bl FUN_020351DC
	ldr r2, _022547D0 @ =0x022598A0
	ldr r0, [r4, #0x58]
	ldr r2, [r2]
	movs r1, #1
	ldr r2, [r2, #0x7c]
	bl FUN_0200BE48
	bl FUN_02255B70
	cmp r0, #2
	bgt _02254714
	movs r0, #1
	adds r1, r0, #0
	bl MOD03_02253E20
	b _022547B4
_02254714:
	ldr r0, _022547D0 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	bne _02254730
	ldr r0, _022547D0 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_020200A0
_02254730:
	ldr r0, _022547D0 @ =0x022598A0
	movs r1, #2
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0x10]
	bl FUN_0200BB6C
	ldr r0, _022547D0 @ =0x022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x58]
	ldr r1, [r2, #0x14]
	ldr r2, [r2, #0x10]
	bl FUN_0200CBBC
	ldr r0, _022547D0 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x40
	bl FUN_0201D3F0
	cmp r0, #0
	bne _0225476A
	ldr r0, _022547D0 @ =0x022598A0
	movs r2, #3
	ldr r1, [r0]
	ldr r0, [r1, #0x68]
	adds r1, #0x40
	ldr r0, [r0, #8]
	bl FUN_0205B514
_0225476A:
	ldr r0, _022547D0 @ =0x022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x68]
	ldr r0, [r0, #0xc]
	bl FUN_02028EA8
	adds r1, r0, #0
	ldr r0, _022547D0 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x40
	bl FUN_0205B564
	movs r0, #1
	bl FUN_02002B34
	movs r0, #0
	bl FUN_02002B50
	movs r0, #0
	bl FUN_02002B8C
	ldr r0, _022547D0 @ =0x022598A0
	movs r3, #0
	ldr r2, [r0]
	movs r1, #1
	str r3, [sp]
	str r1, [sp, #4]
	adds r0, r2, #0
	str r3, [sp, #8]
	ldr r2, [r2, #0x14]
	adds r0, #0x40
	bl FUN_020200A8
	ldr r1, _022547D0 @ =0x022598A0
	ldr r1, [r1]
	adds r1, #0x94
	strb r0, [r1]
_022547B4:
	ldr r0, _022547D0 @ =0x022598A0
	movs r2, #0
	ldr r1, [r0]
	adds r1, #0xa8
	str r2, [r1]
	ldr r0, [r0]
	movs r1, #1
	adds r0, #0xa1
	strb r1, [r0]
	ldr r0, _022547D4 @ =FUN_022548E0
	bl FUN_02254B4C
	add sp, #0xc
	pop {r4, r5, pc}
	.align 2, 0
_022547D0: .4byte 0x022598A0
_022547D4: .4byte FUN_022548E0
	thumb_func_end FUN_022546B0

	thumb_func_start FUN_022547D8
FUN_022547D8: @ 0x022547D8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	bl FUN_02037700
	cmp r0, #0
	beq _022547FE
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0225574C
	movs r0, #0
	adds r1, r0, #0
	bl MOD03_02253E20
	adds r0, r4, #0
	bl FUN_02255ADC
	b _022548D2
_022547FE:
	movs r0, #0
	movs r1, #3
	bl FUN_02037BA0
	adds r5, r0, #0
	bl FUN_0203769C
	cmp r5, r0
	bne _02254824
	bl FUN_02037BC8
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0225574C
	adds r0, r4, #0
	bl FUN_02255A70
	b _022548D2
_02254824:
	movs r0, #0
	movs r1, #5
	bl FUN_02037BA0
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _02254848
	bl FUN_02037BC8
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0225574C
	adds r0, r4, #0
	bl FUN_02255A70
	b _022548D2
_02254848:
	movs r0, #0
	movs r1, #4
	bl FUN_02037BA0
	adds r5, r0, #0
	bl FUN_0203769C
	cmp r5, r0
	bne _0225486A
	movs r0, #0x74
	movs r1, #0
	bl MOD03_02253E20
	ldr r0, _022548D8 @ =FUN_02255280
	bl FUN_02254B4C
	b _022548D2
_0225486A:
	movs r0, #0
	movs r1, #2
	bl FUN_02037BA0
	adds r5, r0, #0
	bl FUN_0203769C
	cmp r5, r0
	bne _022548B6
	bl FUN_02037BC8
	bl FUN_020347A0
	adds r1, r4, #0
	adds r1, #0x90
	strb r0, [r1]
	ldr r0, _022548DC @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	bne _022548A6
	ldr r0, _022548DC @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_020200A0
_022548A6:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0225574C
	adds r0, r4, #0
	bl FUN_02255804
	b _022548D2
_022548B6:
	bl FUN_02255C80
	cmp r0, #0
	beq _022548CE
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_0225574C
	adds r0, r4, #0
	bl FUN_02255A70
	b _022548D2
_022548CE:
	movs r0, #0
	pop {r4, r5, r6, pc}
_022548D2:
	movs r0, #1
	pop {r4, r5, r6, pc}
	nop
_022548D8: .4byte FUN_02255280
_022548DC: .4byte 0x022598A0
	thumb_func_end FUN_022547D8

	thumb_func_start FUN_022548E0
FUN_022548E0: @ 0x022548E0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02254984 @ =0x022598A0
	adds r4, r1, #0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _02254980
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _02254936
	ldr r0, _02254984 @ =0x022598A0
	ldr r2, _02254988 @ =0x0225912C
	ldr r1, [r0]
	adds r1, #0x9c
	str r2, [r1]
	ldr r1, [r0]
	movs r2, #1
	adds r1, #0xa0
	strb r2, [r1]
	ldr r1, [r0]
	ldr r2, _0225498C @ =0x0000FFFF
	adds r1, #0xa2
	strh r2, [r1]
	ldr r1, [r0]
	movs r2, #0
	adds r1, #0xa1
	strb r2, [r1]
	ldr r2, [r0]
	movs r1, #7
	ldr r0, [r2, #0x68]
	adds r2, #0x9c
	bl FUN_021F6A9C
	movs r0, #1
	adds r4, #0xa8
	str r0, [r4]
	pop {r3, r4, r5, pc}
_02254936:
	ldr r0, [r4, #0x68]
	bl FUN_021F6B10
	cmp r0, #1
	bne _02254980
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_022547D8
	cmp r0, #0
	beq _02254954
	movs r0, #2
	adds r4, #0xa1
	strb r0, [r4]
	pop {r3, r4, r5, pc}
_02254954:
	ldr r0, _02254990 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	bne _02254968
	adds r0, r4, #0
	adds r0, #0xa2
	ldrh r0, [r0]
	cmp r0, #0
	bne _02254980
_02254968:
	ldr r0, _02254994 @ =0x000005DC
	bl FUN_0200604C
	movs r1, #0
	adds r4, #0xa8
	movs r0, #3
	str r1, [r4]
	bl MOD03_02253E20
	ldr r0, _02254998 @ =FUN_0225499C
	bl FUN_02254B4C
_02254980:
	pop {r3, r4, r5, pc}
	nop
_02254984: .4byte 0x022598A0
_02254988: .4byte 0x0225912C
_0225498C: .4byte 0x0000FFFF
_02254990: .4byte 0x021D110C
_02254994: .4byte 0x000005DC
_02254998: .4byte FUN_0225499C
	thumb_func_end FUN_022548E0

	thumb_func_start FUN_0225499C
FUN_0225499C: @ 0x0225499C
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_022547D8
	cmp r0, #0
	beq _022549B0
	movs r0, #2
	adds r4, #0xa1
	strb r0, [r4]
	pop {r4, pc}
_022549B0:
	ldr r0, _022549D0 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _022549CC
	adds r0, r4, #0
	bl FUN_02255C84
	ldr r0, _022549D4 @ =FUN_022549D8
	bl FUN_02254B4C
_022549CC:
	pop {r4, pc}
	nop
_022549D0: .4byte 0x022598A0
_022549D4: .4byte FUN_022549D8
	thumb_func_end FUN_0225499C

	thumb_func_start FUN_022549D8
FUN_022549D8: @ 0x022549D8
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _022549FA
	adds r0, r4, #0
	bl FUN_02255CA0
	cmp r0, #1
	bne _02254A4E
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0xa8
	str r1, [r0]
_022549FA:
	adds r0, r4, #0
	bl FUN_02255CD0
	cmp r0, #0
	beq _02254A4E
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_022547D8
	cmp r0, #0
	beq _02254A18
	adds r0, r4, #0
	bl FUN_02255CE4
	pop {r3, r4, r5, pc}
_02254A18:
	ldr r0, [r4, #0x68]
	bl FUN_021F6AEC
	cmp r0, #6
	bne _02254A4E
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	bne _02254A44
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225574C
	movs r0, #6
	movs r1, #0
	bl MOD03_02253E20
	adds r0, r4, #0
	bl FUN_02255ADC
	pop {r3, r4, r5, pc}
_02254A44:
	cmp r0, #1
	bne _02254A4E
	ldr r0, _02254A50 @ =FUN_022546B0
	bl FUN_02254B4C
_02254A4E:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02254A50: .4byte FUN_022546B0
	thumb_func_end FUN_022549D8

	thumb_func_start FUN_02254A54
FUN_02254A54: @ 0x02254A54
	push {r4, lr}
	sub sp, #0x10
	adds r4, r2, #0
	movs r2, #0
	add r0, sp, #0xc
	strh r2, [r0]
	ldr r0, _02254B28 @ =0x022598A0
	ldr r0, [r0]
	ldr r0, [r0, #0x5c]
	cmp r0, #0
	beq _02254A70
	add r1, sp, #0xc
	bl FUN_020014E8
_02254A70:
	add r0, sp, #0xc
	ldrh r1, [r0]
	adds r1, r1, r4
	strh r1, [r0]
	ldrh r0, [r0]
	bl FUN_02034818
	cmp r0, #0
	beq _02254B22
	add r0, sp, #0xc
	ldrh r0, [r0]
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, _02254B28 @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	ldr r0, [r0, #0x50]
	bl FUN_0200BE48
	ldr r0, _02254B28 @ =0x022598A0
	movs r1, #0x4f
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #4]
	bl FUN_0200BB6C
	ldr r0, _02254B28 @ =0x022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x50]
	ldm r2, {r1, r2}
	bl FUN_0200CBBC
	ldr r0, _02254B28 @ =0x022598A0
	lsls r4, r4, #4
	ldr r2, [r0]
	movs r1, #0
	str r4, [sp]
	str r1, [sp, #4]
	adds r0, r2, #0
	str r1, [sp, #8]
	ldr r2, [r2]
	adds r0, #0x20
	movs r3, #8
	bl FUN_020200A8
	add r0, sp, #0xc
	ldrh r0, [r0]
	bl FUN_02034818
	bl FUN_02028F88
	movs r1, #2
	adds r2, r0, #0
	str r1, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _02254B28 @ =0x022598A0
	movs r3, #5
	ldr r0, [r0]
	ldr r0, [r0, #0x50]
	bl FUN_0200BFCC
	ldr r0, _02254B28 @ =0x022598A0
	movs r1, #0x4e
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0xc]
	bl FUN_0200BB6C
	ldr r0, _02254B28 @ =0x022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x50]
	ldr r1, [r2, #8]
	ldr r2, [r2, #0xc]
	bl FUN_0200CBBC
	ldr r0, _02254B28 @ =0x022598A0
	movs r1, #0
	ldr r2, [r0]
	movs r3, #0x48
	str r4, [sp]
	str r1, [sp, #4]
	adds r0, r2, #0
	str r1, [sp, #8]
	ldr r2, [r2, #8]
	adds r0, #0x20
	bl FUN_020200A8
_02254B22:
	add sp, #0x10
	pop {r4, pc}
	nop
_02254B28: .4byte 0x022598A0
	thumb_func_end FUN_02254A54

	thumb_func_start FUN_02254B2C
FUN_02254B2C: @ 0x02254B2C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02255B98
	adds r2, r0, #0
	ldr r0, [r4, #0x68]
	adds r4, #0x91
	ldrb r1, [r4]
	bl FUN_020580E4
	pop {r4, pc}
	.align 2, 0
	thumb_func_end FUN_02254B2C

	thumb_func_start FUN_02254B44
FUN_02254B44: @ 0x02254B44
	ldr r3, _02254B48 @ =FUN_02058284
	bx r3
	.align 2, 0
_02254B48: .4byte FUN_02058284
	thumb_func_end FUN_02254B44

	thumb_func_start FUN_02254B4C
FUN_02254B4C: @ 0x02254B4C
	ldr r1, _02254B54 @ =0x022598A0
	ldr r1, [r1]
	str r0, [r1, #0x6c]
	bx lr
	.align 2, 0
_02254B54: .4byte 0x022598A0
	thumb_func_end FUN_02254B4C

	thumb_func_start FUN_02254B58
FUN_02254B58: @ 0x02254B58
	push {r3, r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, _02254BDC @ =FUN_02254D64
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	bl FUN_02254BEC
	ldr r0, _02254BE0 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x30
	bl FUN_0201D3F0
	cmp r0, #0
	bne _02254BA0
	ldr r0, _02254BE0 @ =0x022598A0
	movs r2, #3
	ldr r1, [r0]
	movs r0, #2
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #0xcd
	str r0, [sp, #0x10]
	ldr r0, [r1, #0x68]
	adds r1, #0x30
	ldr r0, [r0, #8]
	movs r3, #0x16
	bl FUN_0201D40C
_02254BA0:
	ldr r0, _02254BE0 @ =0x022598A0
	ldr r2, _02254BE4 @ =0x000003D9
	ldr r0, [r0]
	movs r1, #1
	adds r0, #0x30
	movs r3, #0xb
	bl FUN_0200E580
	ldr r0, _02254BE0 @ =0x022598A0
	movs r1, #0xf
	ldr r0, [r0]
	adds r0, #0x30
	bl FUN_0201D978
	ldr r0, _02254BE0 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x30
	bl FUN_0201D578
	movs r0, #1
	adds r4, #0x97
	strb r0, [r4]
	movs r0, #0
	bl FUN_0203476C
	ldr r0, _02254BE8 @ =FUN_02254D78
	bl FUN_02254B4C
	add sp, #0x14
	pop {r3, r4, pc}
	.align 2, 0
_02254BDC: .4byte FUN_02254D64
_02254BE0: .4byte 0x022598A0
_02254BE4: .4byte 0x000003D9
_02254BE8: .4byte FUN_02254D78
	thumb_func_end FUN_02254B58

	thumb_func_start FUN_02254BEC
FUN_02254BEC: @ 0x02254BEC
	push {lr}
	sub sp, #0x54
	ldr r3, _02254C94 @ =0x0225931E
	add r2, sp, #0
	movs r1, #0x29
_02254BF6:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _02254BF6
	ldr r0, _02254C98 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x91
	ldrb r0, [r0]
	cmp r0, #0x29
	blo _02254C12
	bl FUN_0202551C
_02254C12:
	ldr r0, _02254C98 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x91
	ldrb r0, [r0]
	cmp r0, #8
	bne _02254C4E
	bl FUN_020347A0
	cmp r0, #1
	ble _02254C3A
	ldr r0, _02254C98 @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	adds r0, #0x92
	ldrb r0, [r0]
	adds r0, #0x7f
	bl MOD03_02253E20
	add sp, #0x54
	pop {pc}
_02254C3A:
	ldr r0, _02254C98 @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	adds r0, #0x92
	ldrb r0, [r0]
	adds r0, #0x75
	bl MOD03_02253E20
	add sp, #0x54
	pop {pc}
_02254C4E:
	cmp r0, #0x28
	bne _02254C82
	bl FUN_020347A0
	cmp r0, #1
	ble _02254C6E
	ldr r0, _02254C98 @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	adds r0, #0x92
	ldrb r0, [r0]
	adds r0, #0x9a
	bl MOD03_02253E20
	add sp, #0x54
	pop {pc}
_02254C6E:
	ldr r0, _02254C98 @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	adds r0, #0x92
	ldrb r0, [r0]
	adds r0, #0x8e
	bl MOD03_02253E20
	add sp, #0x54
	pop {pc}
_02254C82:
	lsls r1, r0, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	movs r1, #0
	bl MOD03_02253E20
	add sp, #0x54
	pop {pc}
	nop
_02254C94: .4byte 0x0225931E
_02254C98: .4byte 0x022598A0
	thumb_func_end FUN_02254BEC

	thumb_func_start FUN_02254C9C
FUN_02254C9C: @ 0x02254C9C
	push {r3, r4, lr}
	sub sp, #0xc
	bl FUN_020347A0
	adds r4, r0, #0
	bl FUN_02255B70
	cmp r4, r0
	blt _02254CB8
	bl FUN_020347A0
	adds r2, r0, #0
	movs r4, #0x51
	b _02254CC6
_02254CB8:
	bl FUN_02255B70
	adds r4, r0, #0
	bl FUN_020347A0
	subs r2, r4, r0
	movs r4, #0x50
_02254CC6:
	movs r0, #5
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	ldr r0, _02254D20 @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	movs r3, #2
	ldr r0, [r0, #0x54]
	bl FUN_0200BFCC
	ldr r0, _02254D20 @ =0x022598A0
	movs r1, #0xf
	ldr r0, [r0]
	adds r0, #0x30
	bl FUN_0201D978
	ldr r0, _02254D20 @ =0x022598A0
	adds r1, r4, #0
	ldr r2, [r0]
	ldr r0, [r2, #0x74]
	ldr r2, [r2, #0x1c]
	bl FUN_0200BB6C
	ldr r0, _02254D20 @ =0x022598A0
	ldr r2, [r0]
	ldr r0, [r2, #0x54]
	ldr r1, [r2, #0x18]
	ldr r2, [r2, #0x1c]
	bl FUN_0200CBBC
	ldr r0, _02254D20 @ =0x022598A0
	movs r3, #2
	ldr r2, [r0]
	movs r1, #0
	str r3, [sp]
	str r1, [sp, #4]
	adds r0, r2, #0
	str r1, [sp, #8]
	ldr r2, [r2, #0x18]
	adds r0, #0x30
	bl FUN_020200A8
	add sp, #0xc
	pop {r3, r4, pc}
	.align 2, 0
_02254D20: .4byte 0x022598A0
	thumb_func_end FUN_02254C9C

	thumb_func_start FUN_02254D24
FUN_02254D24: @ 0x02254D24
	push {r4, r5, lr}
	sub sp, #0x54
	ldr r5, _02254D60 @ =0x02259370
	adds r4, r1, #0
	add r3, sp, #0
	movs r2, #0x29
_02254D30:
	ldrh r1, [r5]
	adds r5, r5, #2
	strh r1, [r3]
	adds r3, r3, #2
	subs r2, r2, #1
	bne _02254D30
	bl FUN_02034818
	adds r2, r0, #0
	beq _02254D4C
	ldr r0, [r4, #0x58]
	movs r1, #1
	bl FUN_0200BE48
_02254D4C:
	adds r4, #0x91
	ldrb r0, [r4]
	lsls r1, r0, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	movs r1, #1
	bl MOD03_02253E20
	add sp, #0x54
	pop {r4, r5, pc}
	.align 2, 0
_02254D60: .4byte 0x02259370
	thumb_func_end FUN_02254D24

	thumb_func_start FUN_02254D64
FUN_02254D64: @ 0x02254D64
	push {r3, lr}
	ldr r2, _02254D74 @ =0x022598A0
	ldr r2, [r2]
	ldr r2, [r2, #0x6c]
	cmp r2, #0
	beq _02254D72
	blx r2
_02254D72:
	pop {r3, pc}
	.align 2, 0
_02254D74: .4byte 0x022598A0
	thumb_func_end FUN_02254D64

	thumb_func_start FUN_02254D78
FUN_02254D78: @ 0x02254D78
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r0, r1, #0
	bl FUN_02254C9C
	ldr r0, _02254E58 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _02254E52
	movs r0, #5
	movs r1, #4
	bl FUN_02014918
	ldr r4, _02254E58 @ =0x022598A0
	movs r5, #0
	ldr r1, [r4]
	movs r6, #0x52
	str r0, [r1, #0x64]
	adds r7, r5, #0
_02254DA6:
	ldr r1, [r4]
	adds r2, r6, #0
	ldr r0, [r1, #0x64]
	ldr r1, [r1, #0x74]
	adds r3, r7, #0
	bl FUN_02014960
	adds r5, r5, #1
	cmp r5, #5
	blt _02254DA6
	ldr r1, _02254E58 @ =0x022598A0
	movs r2, #1
	ldr r0, [r1]
	movs r3, #0
	adds r0, #0x98
	strb r2, [r0]
	adds r2, r3, #0
_02254DC8:
	ldr r0, [r1]
	adds r0, r0, r3
	adds r0, #0x80
	adds r3, r3, #1
	strb r2, [r0]
	cmp r3, #8
	blt _02254DC8
	movs r1, #1
	str r1, [sp, #0x10]
	movs r0, #2
	str r0, [sp, #0x14]
	movs r0, #0x11
	str r0, [sp, #0x18]
	movs r0, #0xc
	mov r4, sp
	str r0, [sp, #0x1c]
	subs r4, #0x10
	ldr r3, _02254E5C @ =0x02259144
	str r1, [sp, #0x20]
	adds r2, r4, #0
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r3!, {r0, r1}
	stm r2!, {r0, r1}
	ldm r4!, {r0, r1, r2, r3}
	bl FUN_02253ED0
	ldr r0, _02254E60 @ =FUN_02254E70
	bl FUN_02254B4C
	bl FUN_02255B84
	cmp r0, #2
	ble _02254E22
	ldr r0, _02254E58 @ =0x022598A0
	ldr r2, _02254E64 @ =0x0225913C
	ldr r1, [r0]
	adds r1, #0x9c
	str r2, [r1]
	movs r1, #2
	b _02254E2E
_02254E22:
	ldr r0, _02254E58 @ =0x022598A0
	ldr r2, _02254E68 @ =0x02259130
	ldr r1, [r0]
	adds r1, #0x9c
	str r2, [r1]
	movs r1, #1
_02254E2E:
	ldr r0, [r0]
	ldr r2, _02254E6C @ =0x0000FFFF
	adds r0, #0xa0
	strb r1, [r0]
	ldr r0, _02254E58 @ =0x022598A0
	ldr r1, [r0]
	adds r1, #0xa2
	strh r2, [r1]
	ldr r1, [r0]
	movs r2, #0
	adds r1, #0xa1
	strb r2, [r1]
	ldr r2, [r0]
	movs r1, #7
	ldr r0, [r2, #0x68]
	adds r2, #0x9c
	bl FUN_021F6A9C
_02254E52:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02254E58: .4byte 0x022598A0
_02254E5C: .4byte 0x02259144
_02254E60: .4byte FUN_02254E70
_02254E64: .4byte 0x0225913C
_02254E68: .4byte 0x02259130
_02254E6C: .4byte 0x0000FFFF
	thumb_func_end FUN_02254D78

	thumb_func_start FUN_02254E70
FUN_02254E70: @ 0x02254E70
	push {r4, r5, r6, r7, lr}
	sub sp, #0x5c
	str r0, [sp]
	ldr r0, [r1, #0x68]
	str r1, [sp, #4]
	bl FUN_021F6B10
	cmp r0, #1
	beq _02254E84
	b _02255058
_02254E84:
	ldr r0, [sp, #4]
	bl FUN_02254C9C
	movs r7, #1
	ldr r4, _0225505C @ =0x022598A0
	movs r5, #0
	adds r6, r7, #0
_02254E92:
	adds r0, r5, #0
	bl FUN_02034714
	cmp r0, #0
	beq _02254EB0
	cmp r5, #0
	beq _02254EB0
	ldr r0, [r4]
	adds r0, r0, r5
	adds r0, #0x80
	strb r6, [r0]
	ldr r0, [r4]
	adds r0, #0x98
	strb r6, [r0]
	b _02254EFA
_02254EB0:
	adds r0, r5, #0
	bl FUN_02034818
	cmp r0, #0
	beq _02254ED4
	ldr r1, [r4]
	adds r0, r1, r5
	adds r0, #0x80
	ldrb r0, [r0]
	cmp r0, #0
	bne _02254ED4
	adds r0, r1, r5
	adds r0, #0x80
	strb r7, [r0]
	ldr r0, [r4]
	adds r0, #0x98
	strb r7, [r0]
	b _02254EFA
_02254ED4:
	adds r0, r5, #0
	bl FUN_02034818
	cmp r0, #0
	bne _02254EFA
	ldr r1, [r4]
	adds r0, r1, r5
	adds r0, #0x80
	ldrb r0, [r0]
	cmp r0, #0
	beq _02254EFA
	adds r1, r1, r5
	adds r1, #0x80
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r4]
	movs r0, #1
	adds r1, #0x98
	strb r0, [r1]
_02254EFA:
	adds r5, r5, #1
	cmp r5, #8
	blt _02254E92
	ldr r1, _0225505C @ =0x022598A0
	ldr r2, [r1]
	adds r0, r2, #0
	adds r0, #0x98
	ldrb r0, [r0]
	cmp r0, #0
	beq _02254F52
	movs r0, #0
	adds r2, #0x98
	strb r0, [r2]
	ldr r0, [r1]
	ldr r0, [r0, #0x5c]
	bl FUN_0200145C
	ldr r0, _0225505C @ =0x022598A0
	movs r1, #3
	ldr r0, [r0]
	movs r5, #0
	ldr r0, [r0, #0x5c]
	bl FUN_02001508
	cmp r0, #0
	bls _02254F52
	ldr r4, _0225505C @ =0x022598A0
	adds r6, r5, #0
	movs r7, #3
_02254F34:
	ldr r0, [r4]
	lsls r2, r5, #0x18
	ldr r0, [r0, #0x5c]
	adds r1, r6, #0
	lsrs r2, r2, #0x18
	bl FUN_02254A54
	ldr r0, [r4]
	adds r1, r7, #0
	ldr r0, [r0, #0x5c]
	adds r5, r5, #1
	bl FUN_02001508
	cmp r5, r0
	blo _02254F34
_02254F52:
	ldr r0, [sp, #4]
	ldr r0, [r0, #0x5c]
	bl FUN_02001338
	adds r4, r0, #0
	bl FUN_02034780
	cmp r0, #0xff
	beq _02254F92
	bl FUN_02034780
	ldr r1, [sp, #4]
	adds r1, #0x95
	strb r0, [r1]
	ldr r0, _02255060 @ =0x0000060C
	bl FUN_0200604C
	ldr r0, [sp, #4]
	movs r1, #1
	adds r0, #0xa1
	strb r1, [r0]
	ldr r0, [sp, #4]
	ldr r1, [sp, #4]
	adds r0, #0x95
	ldrb r0, [r0]
	bl FUN_02254D24
	ldr r0, _02255064 @ =FUN_02255714
	bl FUN_02254B4C
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
_02254F92:
	bl FUN_02037700
	cmp r0, #0
	beq _02254FB4
	bl FUN_02254B44
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl FUN_0225574C
	ldr r0, _0225505C @ =0x022598A0
	movs r1, #3
	ldr r0, [r0]
	add sp, #0x5c
	adds r0, #0x88
	str r1, [r0]
	pop {r4, r5, r6, r7, pc}
_02254FB4:
	movs r0, #0
	mvns r0, r0
	cmp r4, r0
	bne _02254FEE
	bl FUN_02255B84
	cmp r0, #2
	ble _02254FDE
	ldr r0, _0225505C @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0xa2
	ldrh r0, [r0]
	cmp r0, #0
	bne _02254FD4
	movs r4, #0
	b _02254FEE
_02254FD4:
	cmp r0, #1
	bne _02254FEE
	movs r4, #1
	mvns r4, r4
	b _02254FEE
_02254FDE:
	ldr r0, _0225505C @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0xa2
	ldrh r0, [r0]
	cmp r0, #0
	bne _02254FEE
	movs r4, #1
	mvns r4, r4
_02254FEE:
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _02254FFE
	adds r0, r0, #1
	cmp r4, r0
	beq _02255058
	b _0225500E
_02254FFE:
	ldr r0, _02255068 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, _0225506C @ =FUN_0225558C
	bl FUN_02254B4C
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
_0225500E:
	bl FUN_02255B70
	adds r4, r0, #0
	bl FUN_020347A0
	cmp r4, r0
	bgt _02255058
	ldr r3, _02255070 @ =0x02259184
	add r2, sp, #8
	movs r1, #0x29
_02255022:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _02255022
	ldr r0, _02255068 @ =0x000005DC
	bl FUN_0200604C
	bl FUN_020347A0
	ldr r1, [sp, #4]
	adds r1, #0x90
	strb r0, [r1]
	ldr r0, [sp, #4]
	adds r0, #0x91
	str r0, [sp, #4]
	ldrb r0, [r0]
	lsls r1, r0, #1
	add r0, sp, #8
	ldrh r0, [r0, r1]
	movs r1, #0
	bl MOD03_02253E20
	ldr r0, _02255074 @ =FUN_022553C8
	bl FUN_02254B4C
_02255058:
	add sp, #0x5c
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_0225505C: .4byte 0x022598A0
_02255060: .4byte 0x0000060C
_02255064: .4byte FUN_02255714
_02255068: .4byte 0x000005DC
_0225506C: .4byte FUN_0225558C
_02255070: .4byte 0x02259184
_02255074: .4byte FUN_022553C8
	thumb_func_end FUN_02254E70

	thumb_func_start FUN_02255078
FUN_02255078: @ 0x02255078
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	adds r6, r0, #0
	adds r0, r5, #0
	bl FUN_02254C9C
	adds r0, r5, #0
	adds r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _022550A0
	adds r0, r5, #0
	bl FUN_02255CA0
	cmp r0, #1
	bne _022550AA
	adds r0, r5, #0
	movs r1, #1
	adds r0, #0xa8
	str r1, [r0]
_022550A0:
	adds r0, r5, #0
	bl FUN_02255CD0
	cmp r0, #0
	bne _022550AC
_022550AA:
	b _0225526E
_022550AC:
	adds r0, r5, #0
	adds r0, #0x95
	ldrb r0, [r0]
	bl FUN_020373B4
	cmp r0, #0
	bne _02255128
	adds r0, r5, #0
	bl FUN_02255CE4
	adds r0, r5, #0
	adds r0, #0x91
	ldrb r0, [r0]
	cmp r0, #8
	beq _022550CE
	cmp r0, #0x28
	bne _02255110
_022550CE:
	movs r5, #1
	bl FUN_02255B84
	cmp r0, #1
	ble _02255100
	movs r4, #5
_022550DA:
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl FUN_020373B4
	cmp r0, #0
	beq _022550F6
	adds r0, r5, #0
	bl FUN_020346E8
	lsls r1, r5, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl FUN_02037B8C
_022550F6:
	adds r5, r5, #1
	bl FUN_02255B84
	cmp r5, r0
	blt _022550DA
_02255100:
	movs r0, #0
	adds r1, r0, #0
	bl MOD03_02253E20
	ldr r0, _02255270 @ =FUN_022552C8
	bl FUN_02254B4C
	pop {r4, r5, r6, pc}
_02255110:
	adds r5, #0x95
	ldrb r0, [r5]
	bl FUN_020346E8
	movs r0, #0
	adds r1, r0, #0
	bl MOD03_02253E20
	ldr r0, _02255270 @ =FUN_022552C8
	bl FUN_02254B4C
	pop {r4, r5, r6, pc}
_02255128:
	bl FUN_02037700
	cmp r0, #0
	bne _02255138
	bl FUN_02255C80
	cmp r0, #0
	beq _02255156
_02255138:
	adds r0, r5, #0
	bl FUN_02255CE4
	adds r5, #0x95
	ldrb r0, [r5]
	bl FUN_020346E8
	movs r0, #0
	adds r1, r0, #0
	bl MOD03_02253E20
	ldr r0, _02255270 @ =FUN_022552C8
	bl FUN_02254B4C
	pop {r4, r5, r6, pc}
_02255156:
	ldr r0, [r5, #0x68]
	bl FUN_021F6AEC
	cmp r0, #6
	beq _02255162
	b _0225526E
_02255162:
	adds r0, r5, #0
	adds r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	bne _02255200
	adds r0, r5, #0
	adds r0, #0x91
	ldrb r0, [r0]
	cmp r0, #1
	beq _02255184
	cmp r0, #2
	beq _02255184
	adds r0, #0xdb
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _022551A6
_02255184:
	bl FUN_020348F0
	cmp r0, #0
	bne _022551A6
	movs r0, #0x74
	movs r1, #0
	bl MOD03_02253E20
	ldr r0, _02255274 @ =FUN_02255280
	bl FUN_02254B4C
	adds r5, #0x95
	ldrb r1, [r5]
	movs r0, #4
	bl FUN_02037B8C
	pop {r4, r5, r6, pc}
_022551A6:
	adds r0, r5, #0
	adds r0, #0x95
	ldrb r0, [r0]
	bl FUN_0203476C
	adds r1, r5, #0
	adds r1, #0x95
	ldrb r1, [r1]
	movs r0, #2
	bl FUN_02037B8C
	bl FUN_02255B84
	adds r4, r0, #0
	bl FUN_020347A0
	cmp r4, r0
	bne _022551F4
	bl FUN_020347A0
	adds r1, r5, #0
	adds r1, #0x90
	strb r0, [r1]
	bl FUN_02255B84
	cmp r0, #2
	ble _022551E4
	ldr r0, _02255278 @ =FUN_02255388
	bl FUN_02254B4C
	pop {r4, r5, r6, pc}
_022551E4:
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_0225574C
	adds r0, r5, #0
	bl FUN_022557CC
	pop {r4, r5, r6, pc}
_022551F4:
	bl FUN_02254BEC
	ldr r0, _0225527C @ =FUN_0225530C
	bl FUN_02254B4C
	pop {r4, r5, r6, pc}
_02255200:
	cmp r0, #1
	bne _0225526E
	adds r0, r5, #0
	adds r0, #0x91
	ldrb r0, [r0]
	cmp r0, #8
	beq _02255212
	cmp r0, #0x28
	bne _02255250
_02255212:
	movs r5, #1
	bl FUN_02255B84
	cmp r0, #1
	ble _02255244
	movs r4, #5
_0225521E:
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	bl FUN_020373B4
	cmp r0, #0
	beq _0225523A
	adds r0, r5, #0
	bl FUN_020346E8
	lsls r1, r5, #0x18
	adds r0, r4, #0
	lsrs r1, r1, #0x18
	bl FUN_02037B8C
_0225523A:
	adds r5, r5, #1
	bl FUN_02255B84
	cmp r5, r0
	blt _0225521E
_02255244:
	bl FUN_02254BEC
	ldr r0, _0225527C @ =FUN_0225530C
	bl FUN_02254B4C
	pop {r4, r5, r6, pc}
_02255250:
	adds r0, r5, #0
	adds r0, #0x95
	ldrb r0, [r0]
	bl FUN_020346E8
	adds r5, #0x95
	ldrb r1, [r5]
	movs r0, #3
	bl FUN_02037B8C
	bl FUN_02254BEC
	ldr r0, _0225527C @ =FUN_0225530C
	bl FUN_02254B4C
_0225526E:
	pop {r4, r5, r6, pc}
	.align 2, 0
_02255270: .4byte FUN_022552C8
_02255274: .4byte FUN_02255280
_02255278: .4byte FUN_02255388
_0225527C: .4byte FUN_0225530C
	thumb_func_end FUN_02255078

	thumb_func_start FUN_02255280
FUN_02255280: @ 0x02255280
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _022552C0 @ =0x022598A0
	adds r4, r1, #0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _022552BE
	ldr r0, _022552C4 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _022552A8
	bl FUN_02025358
	cmp r0, #1
	bne _022552BE
_022552A8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225574C
	bl FUN_02254B44
	ldr r0, _022552C0 @ =0x022598A0
	movs r1, #4
	ldr r0, [r0]
	adds r0, #0x88
	str r1, [r0]
_022552BE:
	pop {r3, r4, r5, pc}
	.align 2, 0
_022552C0: .4byte 0x022598A0
_022552C4: .4byte 0x021D110C
	thumb_func_end FUN_02255280

	thumb_func_start FUN_022552C8
FUN_022552C8: @ 0x022552C8
	push {r3, lr}
	adds r0, r1, #0
	bl FUN_02254C9C
	ldr r0, _02255300 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _022552FC
	ldr r0, _02255304 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _022552F2
	bl FUN_02025358
	cmp r0, #1
	bne _022552FC
_022552F2:
	bl FUN_02254BEC
	ldr r0, _02255308 @ =FUN_0225530C
	bl FUN_02254B4C
_022552FC:
	pop {r3, pc}
	nop
_02255300: .4byte 0x022598A0
_02255304: .4byte 0x021D110C
_02255308: .4byte FUN_0225530C
	thumb_func_end FUN_022552C8

	thumb_func_start FUN_0225530C
FUN_0225530C: @ 0x0225530C
	push {r3, lr}
	adds r0, r1, #0
	bl FUN_02254C9C
	ldr r0, _02255374 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _02255370
	ldr r0, _02255378 @ =FUN_02254E70
	bl FUN_02254B4C
	bl FUN_02255B84
	cmp r0, #2
	ble _02255340
	ldr r0, _02255374 @ =0x022598A0
	ldr r2, _0225537C @ =0x0225913C
	ldr r1, [r0]
	adds r1, #0x9c
	str r2, [r1]
	movs r1, #2
	b _0225534C
_02255340:
	ldr r0, _02255374 @ =0x022598A0
	ldr r2, _02255380 @ =0x02259130
	ldr r1, [r0]
	adds r1, #0x9c
	str r2, [r1]
	movs r1, #1
_0225534C:
	ldr r0, [r0]
	ldr r2, _02255384 @ =0x0000FFFF
	adds r0, #0xa0
	strb r1, [r0]
	ldr r0, _02255374 @ =0x022598A0
	ldr r1, [r0]
	adds r1, #0xa2
	strh r2, [r1]
	ldr r1, [r0]
	movs r2, #0
	adds r1, #0xa1
	strb r2, [r1]
	ldr r2, [r0]
	movs r1, #7
	ldr r0, [r2, #0x68]
	adds r2, #0x9c
	bl FUN_021F6A9C
_02255370:
	pop {r3, pc}
	nop
_02255374: .4byte 0x022598A0
_02255378: .4byte FUN_02254E70
_0225537C: .4byte 0x0225913C
_02255380: .4byte 0x02259130
_02255384: .4byte 0x0000FFFF
	thumb_func_end FUN_0225530C

	thumb_func_start FUN_02255388
FUN_02255388: @ 0x02255388
	push {r3, r4, lr}
	sub sp, #0x54
	ldr r3, _022553C0 @ =0x022591D6
	adds r4, r1, #0
	add r2, sp, #0
	movs r1, #0x29
_02255394:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _02255394
	adds r0, r4, #0
	bl FUN_02254C9C
	adds r4, #0x91
	ldrb r0, [r4]
	lsls r1, r0, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	movs r1, #0
	bl MOD03_02253E20
	ldr r0, _022553C4 @ =FUN_022553C8
	bl FUN_02254B4C
	add sp, #0x54
	pop {r3, r4, pc}
	.align 2, 0
_022553C0: .4byte 0x022591D6
_022553C4: .4byte FUN_022553C8
	thumb_func_end FUN_02255388

	thumb_func_start FUN_022553C8
FUN_022553C8: @ 0x022553C8
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl FUN_02254C9C
	movs r0, #0
	bl FUN_02037EC0
	ldr r0, [r4, #0x5c]
	bl FUN_02001338
	ldr r0, _022553FC @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _022553FA
	adds r0, r4, #0
	bl FUN_02255C84
	ldr r0, _02255400 @ =FUN_02255404
	bl FUN_02254B4C
_022553FA:
	pop {r4, pc}
	.align 2, 0
_022553FC: .4byte 0x022598A0
_02255400: .4byte FUN_02255404
	thumb_func_end FUN_022553C8

	thumb_func_start FUN_02255404
FUN_02255404: @ 0x02255404
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02254C9C
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _0225542C
	adds r0, r4, #0
	bl FUN_02255CA0
	cmp r0, #1
	bne _022554D0
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0xa8
	str r1, [r0]
_0225542C:
	adds r0, r4, #0
	bl FUN_02255CD0
	cmp r0, #0
	beq _022554D0
	bl FUN_02037700
	cmp r0, #0
	bne _0225544C
	bl FUN_02037454
	adds r1, r4, #0
	adds r1, #0x90
	ldrb r1, [r1]
	cmp r1, r0
	beq _0225545A
_0225544C:
	adds r0, r4, #0
	bl FUN_02255CE4
	ldr r0, _022554D4 @ =FUN_022554E0
	bl FUN_02254B4C
	pop {r3, r4, r5, pc}
_0225545A:
	ldr r0, [r4, #0x68]
	bl FUN_021F6AEC
	cmp r0, #6
	bne _022554D0
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	bne _022554B0
	adds r4, #0x91
	ldrb r0, [r4]
	cmp r0, #8
	beq _0225547A
	cmp r0, #0x28
	bne _022554A2
_0225547A:
	movs r4, #1
	bl FUN_02037454
	cmp r0, #1
	ble _022554A2
_02255484:
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	bl FUN_020373B4
	cmp r0, #0
	bne _02255498
	ldr r0, _022554D4 @ =FUN_022554E0
	bl FUN_02254B4C
	pop {r3, r4, r5, pc}
_02255498:
	adds r4, r4, #1
	bl FUN_02037454
	cmp r4, r0
	blt _02255484
_022554A2:
	movs r0, #0xa
	bl FUN_02037AC0
	ldr r0, _022554D8 @ =FUN_022556BC
	bl FUN_02254B4C
	pop {r3, r4, r5, pc}
_022554B0:
	cmp r0, #1
	bne _022554D0
	movs r0, #1
	bl FUN_02037EC0
	bl FUN_02254B44
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225574C
	ldr r0, _022554DC @ =0x022598A0
	movs r1, #1
	ldr r0, [r0]
	adds r0, #0x88
	str r1, [r0]
_022554D0:
	pop {r3, r4, r5, pc}
	nop
_022554D4: .4byte FUN_022554E0
_022554D8: .4byte FUN_022556BC
_022554DC: .4byte 0x022598A0
	thumb_func_end FUN_02255404

	thumb_func_start FUN_022554E0
FUN_022554E0: @ 0x022554E0
	push {r4, r5, lr}
	sub sp, #0x54
	ldr r5, _02255540 @ =0x022592CC
	adds r4, r1, #0
	add r3, sp, #0
	movs r2, #0x29
_022554EC:
	ldrh r1, [r5]
	adds r5, r5, #2
	strh r1, [r3]
	adds r3, r3, #2
	subs r2, r2, #1
	bne _022554EC
	adds r1, r4, #0
	bl FUN_0225574C
	ldr r0, _02255544 @ =0x022598A0
	ldr r1, [r0]
	adds r0, r1, #0
	adds r0, #0x91
	ldrb r0, [r0]
	cmp r0, #8
	bne _0225551A
	adds r1, #0x92
	ldrb r0, [r1]
	movs r1, #0
	adds r0, #0x89
	bl MOD03_02253E20
	b _0225552C
_0225551A:
	adds r0, r4, #0
	adds r0, #0x91
	ldrb r0, [r0]
	lsls r1, r0, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	movs r1, #0
	bl MOD03_02253E20
_0225552C:
	bl FUN_02058284
	ldr r0, _02255548 @ =FUN_0225554C
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	add sp, #0x54
	pop {r4, r5, pc}
	nop
_02255540: .4byte 0x022592CC
_02255544: .4byte 0x022598A0
_02255548: .4byte FUN_0225554C
	thumb_func_end FUN_022554E0

	thumb_func_start FUN_0225554C
FUN_0225554C: @ 0x0225554C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02255584 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _02255582
	ldr r0, _02255588 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _02255572
	bl FUN_02025358
	cmp r0, #1
	bne _02255582
_02255572:
	ldr r0, _02255584 @ =0x022598A0
	movs r1, #1
	ldr r0, [r0]
	adds r0, #0x88
	str r1, [r0]
	adds r0, r4, #0
	bl FUN_0200E390
_02255582:
	pop {r4, pc}
	.align 2, 0
_02255584: .4byte 0x022598A0
_02255588: .4byte 0x021D110C
	thumb_func_end FUN_0225554C

	thumb_func_start FUN_0225558C
FUN_0225558C: @ 0x0225558C
	push {r4, r5, lr}
	sub sp, #0x54
	ldr r3, _022555E8 @ =0x022593C2
	adds r4, r1, #0
	adds r5, r0, #0
	add r2, sp, #0
	movs r1, #0x29
_0225559A:
	ldrh r0, [r3]
	adds r3, r3, #2
	strh r0, [r2]
	adds r2, r2, #2
	subs r1, r1, #1
	bne _0225559A
	adds r0, r4, #0
	bl FUN_02254C9C
	bl FUN_020347A0
	cmp r0, #1
	ble _022555CE
	adds r4, #0x91
	ldrb r0, [r4]
	lsls r1, r0, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	movs r1, #0
	bl MOD03_02253E20
	ldr r0, _022555EC @ =FUN_022555F4
	bl FUN_02254B4C
	add sp, #0x54
	pop {r4, r5, pc}
_022555CE:
	bl FUN_02254B44
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225574C
	ldr r0, _022555F0 @ =0x022598A0
	movs r1, #1
	ldr r0, [r0]
	adds r0, #0x88
	str r1, [r0]
	add sp, #0x54
	pop {r4, r5, pc}
	.align 2, 0
_022555E8: .4byte 0x022593C2
_022555EC: .4byte FUN_022555F4
_022555F0: .4byte 0x022598A0
	thumb_func_end FUN_0225558C

	thumb_func_start FUN_022555F4
FUN_022555F4: @ 0x022555F4
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl FUN_02254C9C
	ldr r0, [r4, #0x5c]
	bl FUN_02001338
	ldr r0, _02255624 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _02255620
	adds r0, r4, #0
	bl FUN_02255C84
	ldr r0, _02255628 @ =FUN_0225562C
	bl FUN_02254B4C
_02255620:
	pop {r4, pc}
	nop
_02255624: .4byte 0x022598A0
_02255628: .4byte FUN_0225562C
	thumb_func_end FUN_022555F4

	thumb_func_start FUN_0225562C
FUN_0225562C: @ 0x0225562C
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	adds r5, r0, #0
	adds r0, r4, #0
	bl FUN_02254C9C
	adds r0, r4, #0
	adds r0, #0xa8
	ldr r0, [r0]
	cmp r0, #0
	bne _02255654
	adds r0, r4, #0
	bl FUN_02255CA0
	cmp r0, #1
	bne _022556B2
	adds r0, r4, #0
	movs r1, #1
	adds r0, #0xa8
	str r1, [r0]
_02255654:
	adds r0, r4, #0
	bl FUN_02255CD0
	cmp r0, #0
	beq _022556B2
	bl FUN_02037700
	cmp r0, #0
	beq _02255678
	adds r0, r4, #0
	bl FUN_02255CE4
	bl FUN_02254BEC
	ldr r0, _022556B4 @ =FUN_0225530C
	bl FUN_02254B4C
	pop {r3, r4, r5, pc}
_02255678:
	ldr r0, [r4, #0x68]
	bl FUN_021F6AEC
	cmp r0, #6
	bne _022556B2
	adds r0, r4, #0
	adds r0, #0xa4
	ldr r0, [r0]
	cmp r0, #0
	bne _022556A4
	bl FUN_02254B44
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225574C
	ldr r0, _022556B8 @ =0x022598A0
	movs r1, #1
	ldr r0, [r0]
	adds r0, #0x88
	str r1, [r0]
	pop {r3, r4, r5, pc}
_022556A4:
	cmp r0, #1
	bne _022556B2
	bl FUN_02254BEC
	ldr r0, _022556B4 @ =FUN_0225530C
	bl FUN_02254B4C
_022556B2:
	pop {r3, r4, r5, pc}
	.align 2, 0
_022556B4: .4byte FUN_0225530C
_022556B8: .4byte 0x022598A0
	thumb_func_end FUN_0225562C

	thumb_func_start FUN_022556BC
FUN_022556BC: @ 0x022556BC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_02037700
	cmp r0, #0
	bne _022556D8
	bl FUN_02037454
	adds r1, r4, #0
	adds r1, #0x90
	ldrb r1, [r1]
	cmp r1, r0
	beq _022556E0
_022556D8:
	ldr r0, _02255710 @ =FUN_022554E0
	bl FUN_02254B4C
	pop {r3, r4, r5, pc}
_022556E0:
	adds r0, r4, #0
	bl FUN_02254C9C
	ldr r0, [r4, #0x5c]
	bl FUN_02001338
	movs r0, #0xa
	bl FUN_02037B38
	cmp r0, #0
	beq _0225570C
	bl FUN_02037A10
	cmp r0, #0
	beq _0225570C
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225574C
	adds r0, r4, #0
	bl FUN_02255B44
_0225570C:
	pop {r3, r4, r5, pc}
	nop
_02255710: .4byte FUN_022554E0
	thumb_func_end FUN_022556BC

	thumb_func_start FUN_02255714
FUN_02255714: @ 0x02255714
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	bl FUN_02254C9C
	ldr r0, [r4, #0x5c]
	bl FUN_02001338
	ldr r0, _02255744 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _02255740
	adds r0, r4, #0
	bl FUN_02255C84
	ldr r0, _02255748 @ =FUN_02255078
	bl FUN_02254B4C
_02255740:
	pop {r4, pc}
	nop
_02255744: .4byte 0x022598A0
_02255748: .4byte FUN_02255078
	thumb_func_end FUN_02255714

	thumb_func_start FUN_0225574C
FUN_0225574C: @ 0x0225574C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _022557C8 @ =0x022598A0
	adds r4, r1, #0
	ldr r0, [r0]
	movs r1, #0xf
	adds r0, #0x40
	bl FUN_0201D978
	adds r0, r4, #0
	adds r0, #0x20
	movs r1, #0
	bl FUN_0200E5D4
	ldr r0, [r4, #0x64]
	bl FUN_02014950
	movs r1, #0
	ldr r0, [r4, #0x5c]
	adds r2, r1, #0
	bl FUN_02001434
	movs r0, #0
	str r0, [r4, #0x5c]
	adds r0, r4, #0
	adds r0, #0x20
	bl FUN_0201D8C8
	adds r0, r4, #0
	adds r0, #0x20
	bl FUN_0201D520
	adds r0, r4, #0
	adds r0, #0x97
	ldrb r0, [r0]
	cmp r0, #0
	beq _022557BC
	ldr r0, _022557C8 @ =0x022598A0
	movs r1, #0
	ldr r0, [r0]
	adds r0, #0x30
	bl FUN_0200E5D4
	ldr r0, _022557C8 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x30
	bl FUN_0201D8C8
	ldr r0, _022557C8 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x30
	bl FUN_0201D520
	movs r0, #0
	adds r4, #0x97
	strb r0, [r4]
_022557BC:
	cmp r5, #0
	beq _022557C6
	adds r0, r5, #0
	bl FUN_0200E390
_022557C6:
	pop {r3, r4, r5, pc}
	.align 2, 0
_022557C8: .4byte 0x022598A0
	thumb_func_end FUN_0225574C

	thumb_func_start FUN_022557CC
FUN_022557CC: @ 0x022557CC
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #1
	bl FUN_02034818
	adds r2, r0, #0
	ldr r0, [r4, #0x58]
	movs r1, #1
	bl FUN_0200BE48
	movs r0, #0x45
	movs r1, #1
	bl MOD03_02253E20
	ldr r0, _022557FC @ =FUN_02254D64
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	ldr r0, _02255800 @ =FUN_02255860
	bl FUN_02254B4C
	pop {r4, pc}
	nop
_022557FC: .4byte FUN_02254D64
_02255800: .4byte FUN_02255860
	thumb_func_end FUN_022557CC

	thumb_func_start FUN_02255804
FUN_02255804: @ 0x02255804
	push {r4, lr}
	ldr r1, _02255854 @ =0x022598A0
	adds r4, r0, #0
	adds r0, #0x8e
	ldr r1, [r1]
	ldrh r0, [r0]
	ldr r1, [r1, #0x7c]
	bl FUN_020351DC
	ldr r2, _02255854 @ =0x022598A0
	ldr r0, [r4, #0x58]
	ldr r2, [r2]
	movs r1, #1
	ldr r2, [r2, #0x7c]
	bl FUN_0200BE48
	movs r0, #4
	movs r1, #1
	bl MOD03_02253E20
	bl FUN_02037454
	adds r1, r4, #0
	adds r1, #0x90
	strb r0, [r1]
	ldr r0, _02255858 @ =FUN_02254D64
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	ldr r0, _0225585C @ =FUN_02255860
	bl FUN_02254B4C
	ldr r0, _02255854 @ =0x022598A0
	movs r1, #0x5a
	ldr r0, [r0]
	adds r0, #0x96
	strb r1, [r0]
	pop {r4, pc}
	nop
_02255854: .4byte 0x022598A0
_02255858: .4byte FUN_02254D64
_0225585C: .4byte FUN_02255860
	thumb_func_end FUN_02255804

	thumb_func_start FUN_02255860
FUN_02255860: @ 0x02255860
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_0203769C
	cmp r0, #0
	bne _02255880
	bl FUN_02037454
	adds r4, #0x90
	ldrb r1, [r4]
	cmp r1, r0
	beq _02255880
	ldr r0, _022558B8 @ =FUN_02255A00
	bl FUN_02254B4C
	pop {r4, pc}
_02255880:
	bl FUN_02255C80
	cmp r0, #0
	bne _02255890
	bl FUN_02037700
	cmp r0, #0
	beq _02255898
_02255890:
	ldr r0, _022558B8 @ =FUN_02255A00
	bl FUN_02254B4C
	pop {r4, pc}
_02255898:
	ldr r0, _022558BC @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _022558B4
	movs r0, #0xa
	bl FUN_02037AC0
	ldr r0, _022558C0 @ =FUN_022558C4
	bl FUN_02254B4C
_022558B4:
	pop {r4, pc}
	nop
_022558B8: .4byte FUN_02255A00
_022558BC: .4byte 0x022598A0
_022558C0: .4byte FUN_022558C4
	thumb_func_end FUN_02255860

	thumb_func_start FUN_022558C4
FUN_022558C4: @ 0x022558C4
	push {r4, r5, lr}
	sub sp, #0x54
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0203769C
	cmp r0, #0
	bne _022558EA
	bl FUN_02037454
	adds r1, r4, #0
	adds r1, #0x90
	ldrb r1, [r1]
	cmp r1, r0
	beq _022558EA
	ldr r0, _022559F4 @ =FUN_02255A00
	bl FUN_02254B4C
	b _0225597A
_022558EA:
	bl FUN_02255C80
	cmp r0, #0
	bne _022558FA
	bl FUN_02037700
	cmp r0, #0
	beq _02255904
_022558FA:
	ldr r0, _022559F4 @ =FUN_02255A00
	bl FUN_02254B4C
	add sp, #0x54
	pop {r4, r5, pc}
_02255904:
	movs r0, #0
	bl FUN_020373B4
	cmp r0, #0
	bne _02255918
	ldr r0, _022559F4 @ =FUN_02255A00
	bl FUN_02254B4C
	add sp, #0x54
	pop {r4, r5, pc}
_02255918:
	movs r0, #0
	movs r1, #5
	bl FUN_02037BA0
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	beq _02255932
	ldr r0, _022559F4 @ =FUN_02255A00
	bl FUN_02254B4C
	add sp, #0x54
	pop {r4, r5, pc}
_02255932:
	movs r0, #0xa
	bl FUN_02037B38
	cmp r0, #0
	beq _0225597A
	bl FUN_02037A10
	cmp r0, #0
	beq _0225597A
	ldr r0, _022559F8 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	bne _02255960
	ldr r0, _022559F8 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_020200A0
_02255960:
	bl FUN_02037454
	adds r1, r4, #0
	adds r1, #0x90
	strb r0, [r1]
	adds r0, r4, #0
	bl FUN_02255B44
	adds r0, r5, #0
	bl FUN_0200E390
	add sp, #0x54
	pop {r4, r5, pc}
_0225597A:
	ldr r2, _022559F8 @ =0x022598A0
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x96
	ldrb r1, [r1]
	cmp r1, #0
	beq _022559F0
	adds r1, r0, #0
	adds r1, #0x96
	ldrb r1, [r1]
	adds r0, #0x96
	subs r1, r1, #1
	strb r1, [r0]
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x96
	ldrb r1, [r1]
	cmp r1, #0
	bne _022559F0
	ldr r5, _022559FC @ =0x02259228
	add r3, sp, #0
	movs r2, #0x29
_022559A6:
	ldrh r1, [r5]
	adds r5, r5, #2
	strh r1, [r3]
	adds r3, r3, #2
	subs r2, r2, #1
	bne _022559A6
	adds r1, r0, #0
	adds r1, #0x91
	ldrb r1, [r1]
	cmp r1, #8
	bne _022559CC
	adds r0, #0x92
	ldrb r0, [r0]
	movs r1, #0
	adds r0, #0x84
	bl MOD03_02253E20
	add sp, #0x54
	pop {r4, r5, pc}
_022559CC:
	cmp r1, #0x28
	bne _022559E0
	adds r0, #0x92
	ldrb r0, [r0]
	movs r1, #0
	adds r0, #0xa0
	bl MOD03_02253E20
	add sp, #0x54
	pop {r4, r5, pc}
_022559E0:
	adds r4, #0x91
	ldrb r0, [r4]
	lsls r1, r0, #1
	add r0, sp, #0
	ldrh r0, [r0, r1]
	movs r1, #0
	bl MOD03_02253E20
_022559F0:
	add sp, #0x54
	pop {r4, r5, pc}
	.align 2, 0
_022559F4: .4byte FUN_02255A00
_022559F8: .4byte 0x022598A0
_022559FC: .4byte 0x02259228
	thumb_func_end FUN_022558C4

	thumb_func_start FUN_02255A00
FUN_02255A00: @ 0x02255A00
	push {r3, lr}
	ldr r0, _02255A24 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _02255A20
	movs r0, #0
	adds r1, r0, #0
	bl MOD03_02253E20
	ldr r0, _02255A28 @ =FUN_02255A2C
	bl FUN_02254B4C
_02255A20:
	pop {r3, pc}
	nop
_02255A24: .4byte 0x022598A0
_02255A28: .4byte FUN_02255A2C
	thumb_func_end FUN_02255A00

	thumb_func_start FUN_02255A2C
FUN_02255A2C: @ 0x02255A2C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _02255A68 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _02255A66
	ldr r0, _02255A6C @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _02255A52
	bl FUN_02025358
	cmp r0, #1
	bne _02255A66
_02255A52:
	adds r0, r4, #0
	bl FUN_0200E390
	bl FUN_02254B44
	ldr r0, _02255A68 @ =0x022598A0
	movs r1, #1
	ldr r0, [r0]
	adds r0, #0x88
	str r1, [r0]
_02255A66:
	pop {r4, pc}
	.align 2, 0
_02255A68: .4byte 0x022598A0
_02255A6C: .4byte 0x021D110C
	thumb_func_end FUN_02255A2C

	thumb_func_start FUN_02255A70
FUN_02255A70: @ 0x02255A70
	push {r4, lr}
	ldr r1, _02255AA8 @ =0x022598A0
	adds r4, r0, #0
	adds r0, #0x8e
	ldr r1, [r1]
	ldrh r0, [r0]
	ldr r1, [r1, #0x7c]
	bl FUN_020351DC
	ldr r2, _02255AA8 @ =0x022598A0
	ldr r0, [r4, #0x58]
	ldr r2, [r2]
	movs r1, #1
	ldr r2, [r2, #0x7c]
	bl FUN_0200BE48
	movs r0, #5
	movs r1, #1
	bl MOD03_02253E20
	bl FUN_02058180
	ldr r0, _02255AAC @ =FUN_02255AB0
	adds r1, r4, #0
	movs r2, #0
	bl FUN_0200E320
	pop {r4, pc}
	.align 2, 0
_02255AA8: .4byte 0x022598A0
_02255AAC: .4byte FUN_02255AB0
	thumb_func_end FUN_02255A70

	thumb_func_start FUN_02255AB0
FUN_02255AB0: @ 0x02255AB0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02255AD8 @ =0x022598A0
	adds r4, r1, #0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _02255AD6
	bl FUN_02058180
	adds r0, r4, #0
	bl FUN_022542C8
	adds r0, r5, #0
	bl FUN_0200E390
_02255AD6:
	pop {r3, r4, r5, pc}
	.align 2, 0
_02255AD8: .4byte 0x022598A0
	thumb_func_end FUN_02255AB0

	thumb_func_start FUN_02255ADC
FUN_02255ADC: @ 0x02255ADC
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02058180
	movs r4, #0
_02255AE6:
	adds r0, r4, #0
	bl FUN_020346E8
	adds r4, r4, #1
	cmp r4, #8
	blt _02255AE6
	ldr r0, _02255B00 @ =FUN_02255B04
	adds r1, r5, #0
	movs r2, #0
	bl FUN_0200E320
	pop {r3, r4, r5, pc}
	nop
_02255B00: .4byte FUN_02255B04
	thumb_func_end FUN_02255ADC

	thumb_func_start FUN_02255B04
FUN_02255B04: @ 0x02255B04
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _02255B3C @ =0x022598A0
	adds r4, r1, #0
	ldr r0, [r0]
	adds r0, #0x94
	ldrb r0, [r0]
	bl FUN_0205B624
	cmp r0, #0
	beq _02255B38
	ldr r0, _02255B40 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _02255B2C
	bl FUN_02025358
	cmp r0, #1
	bne _02255B38
_02255B2C:
	adds r0, r4, #0
	bl FUN_022542C8
	adds r0, r5, #0
	bl FUN_0200E390
_02255B38:
	pop {r3, r4, r5, pc}
	nop
_02255B3C: .4byte 0x022598A0
_02255B40: .4byte 0x021D110C
	thumb_func_end FUN_02255B04

	thumb_func_start FUN_02255B44
FUN_02255B44: @ 0x02255B44
	push {r3, lr}
	movs r0, #0
	bl FUN_02037EC0
	ldr r0, _02255B6C @ =0x022598A0
	movs r1, #2
	ldr r0, [r0]
	adds r0, #0x88
	str r1, [r0]
	movs r0, #1
	adds r1, r0, #0
	bl FUN_020398D4
	bl FUN_02034434
	movs r0, #1
	bl FUN_020356C0
	pop {r3, pc}
	nop
_02255B6C: .4byte 0x022598A0
	thumb_func_end FUN_02255B44

	thumb_func_start FUN_02255B70
FUN_02255B70: @ 0x02255B70
	ldr r0, _02255B7C @ =0x022598A0
	ldr r3, _02255B80 @ =FUN_0203775C
	ldr r0, [r0]
	adds r0, #0x91
	ldrb r0, [r0]
	bx r3
	.align 2, 0
_02255B7C: .4byte 0x022598A0
_02255B80: .4byte FUN_0203775C
	thumb_func_end FUN_02255B70

	thumb_func_start FUN_02255B84
FUN_02255B84: @ 0x02255B84
	ldr r0, _02255B90 @ =0x022598A0
	ldr r3, _02255B94 @ =FUN_0203774C
	ldr r0, [r0]
	adds r0, #0x91
	ldrb r0, [r0]
	bx r3
	.align 2, 0
_02255B90: .4byte 0x022598A0
_02255B94: .4byte FUN_0203774C
	thumb_func_end FUN_02255B84

	thumb_func_start FUN_02255B98
FUN_02255B98: @ 0x02255B98
	ldr r0, _02255BAC @ =0x022598A0
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x92
	adds r2, #0x93
	ldrb r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #4
	adds r0, r1, r0
	bx lr
	.align 2, 0
_02255BAC: .4byte 0x022598A0
	thumb_func_end FUN_02255B98

	thumb_func_start FUN_02255BB0
FUN_02255BB0: @ 0x02255BB0
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_02253F74
	ldr r0, _02255BE8 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x91
	strb r4, [r0]
	subs r0, r4, #3
	cmp r0, #1
	bhi _02255BD2
	movs r0, #0
	adds r5, #0xa4
	str r0, [r5]
_02255BD2:
	ldr r0, _02255BE8 @ =0x022598A0
	ldr r1, [r0]
	adds r1, #0x92
	strb r6, [r1]
	ldr r1, [r0]
	adds r1, #0x93
	strb r7, [r1]
	ldr r0, [r0]
	bl FUN_022540E8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02255BE8: .4byte 0x022598A0
	thumb_func_end FUN_02255BB0

	thumb_func_start FUN_02255BEC
FUN_02255BEC: @ 0x02255BEC
	ldr r0, _02255BF4 @ =0x022598A0
	ldr r3, _02255BF8 @ =FUN_022542C8
	ldr r0, [r0]
	bx r3
	.align 2, 0
_02255BF4: .4byte 0x022598A0
_02255BF8: .4byte FUN_022542C8
	thumb_func_end FUN_02255BEC

	thumb_func_start FUN_02255BFC
FUN_02255BFC: @ 0x02255BFC
	push {r4, lr}
	ldr r0, _02255C14 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x88
	ldr r4, [r0]
	cmp r4, #0
	beq _02255C0E
	bl FUN_02254054
_02255C0E:
	adds r0, r4, #0
	pop {r4, pc}
	nop
_02255C14: .4byte 0x022598A0
	thumb_func_end FUN_02255BFC

	thumb_func_start FUN_02255C18
FUN_02255C18: @ 0x02255C18
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	bl FUN_02253F74
	ldr r0, _02255C50 @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x91
	strb r4, [r0]
	subs r0, r4, #3
	cmp r0, #1
	bhi _02255C3A
	movs r0, #0
	adds r5, #0xa4
	str r0, [r5]
_02255C3A:
	ldr r0, _02255C50 @ =0x022598A0
	ldr r1, [r0]
	adds r1, #0x92
	strb r6, [r1]
	ldr r1, [r0]
	adds r1, #0x93
	strb r7, [r1]
	ldr r0, [r0]
	bl FUN_02254B2C
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02255C50: .4byte 0x022598A0
	thumb_func_end FUN_02255C18

	thumb_func_start FUN_02255C54
FUN_02255C54: @ 0x02255C54
	ldr r0, _02255C5C @ =0x022598A0
	ldr r3, _02255C60 @ =FUN_02254B58
	ldr r0, [r0]
	bx r3
	.align 2, 0
_02255C5C: .4byte 0x022598A0
_02255C60: .4byte FUN_02254B58
	thumb_func_end FUN_02255C54

	thumb_func_start FUN_02255C64
FUN_02255C64: @ 0x02255C64
	push {r4, lr}
	ldr r0, _02255C7C @ =0x022598A0
	ldr r0, [r0]
	adds r0, #0x88
	ldr r4, [r0]
	cmp r4, #0
	beq _02255C76
	bl FUN_02254054
_02255C76:
	adds r0, r4, #0
	pop {r4, pc}
	nop
_02255C7C: .4byte 0x022598A0
	thumb_func_end FUN_02255C64

	thumb_func_start FUN_02255C80
FUN_02255C80: @ 0x02255C80
	movs r0, #0
	bx lr
	thumb_func_end FUN_02255C80

	thumb_func_start FUN_02255C84
FUN_02255C84: @ 0x02255C84
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x68]
	movs r1, #3
	movs r2, #0
	bl FUN_021F6A9C
	adds r0, r4, #0
	movs r1, #0
	adds r0, #0xa8
	str r1, [r0]
	adds r4, #0xa4
	str r1, [r4]
	pop {r4, pc}
	thumb_func_end FUN_02255C84

	thumb_func_start FUN_02255CA0
FUN_02255CA0: @ 0x02255CA0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x68]
	bl FUN_021F6B00
	adds r4, r0, #0
	ldr r0, [r5, #0x68]
	bl FUN_021F6B10
	cmp r4, #3
	bne _02255CCC
	cmp r0, #1
	bne _02255CCC
	ldr r0, [r5, #0x68]
	movs r1, #3
	adds r5, #0xa4
	adds r2, r1, #0
	adds r3, r5, #0
	bl FUN_021F6ABC
	movs r0, #1
	pop {r3, r4, r5, pc}
_02255CCC:
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_02255CA0

	thumb_func_start FUN_02255CD0
FUN_02255CD0: @ 0x02255CD0
	push {r3, lr}
	ldr r0, [r0, #0x68]
	bl FUN_021F6AEC
	cmp r0, #4
	blt _02255CE0
	movs r0, #1
	pop {r3, pc}
_02255CE0:
	movs r0, #0
	pop {r3, pc}
	thumb_func_end FUN_02255CD0

	thumb_func_start FUN_02255CE4
FUN_02255CE4: @ 0x02255CE4
	push {r3, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x68]
	movs r1, #3
	movs r2, #0xb
	adds r3, #0xa4
	bl FUN_021F6ABC
	pop {r3, pc}
	.align 2, 0
	thumb_func_end FUN_02255CE4

	thumb_func_start FUN_02255CF8
FUN_02255CF8: @ 0x02255CF8
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x54
	adds r4, r1, #0
	bl FUN_0201D3F0
	cmp r0, #0
	bne _02255D32
	adds r0, r5, #0
	adds r0, #0x54
	bl FUN_0201D3C4
	ldr r0, [r5, #0x10]
	adds r1, r5, #0
	ldr r0, [r0, #8]
	adds r1, #0x54
	movs r2, #3
	bl FUN_0205B514
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_02028EA8
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x54
	bl FUN_0205B564
	b _02255D3A
_02255D32:
	adds r0, r5, #0
	adds r0, #0x54
	bl FUN_0205B5A8
_02255D3A:
	ldr r0, [r5, #0x68]
	ldr r2, [r5, #0x14]
	adds r1, r4, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x64]
	ldr r1, [r5, #0x18]
	ldr r2, [r5, #0x14]
	bl FUN_0200CBBC
	ldr r0, [r5, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_02028EA8
	adds r2, r0, #0
	adds r0, r5, #0
	ldr r1, [r5, #0x18]
	adds r0, #0x54
	movs r3, #1
	bl FUN_0205B5B4
	str r0, [r5, #0x74]
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_02255CF8

	thumb_func_start FUN_02255D68
FUN_02255D68: @ 0x02255D68
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _02255D80
	adds r0, #0x54
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	adds r0, #0x54
	bl FUN_0201D8C8
_02255D80:
	adds r4, #0x54
	adds r0, r4, #0
	bl FUN_0201D520
	pop {r4, pc}
	.align 2, 0
	thumb_func_end FUN_02255D68

	thumb_func_start FUN_02255D8C
FUN_02255D8C: @ 0x02255D8C
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x1c]
	ldr r0, [r0, #0xc]
	movs r3, #4
	bl FUN_0202921C
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	str r0, [sp, #4]
	movs r1, #0
	ldr r0, [r4, #0x64]
	ldr r2, [r4, #0x1c]
	adds r3, r1, #0
	bl FUN_0200BE3C
	add sp, #8
	pop {r4, pc}
	.align 2, 0
	thumb_func_end FUN_02255D8C

	thumb_func_start FUN_02255DB8
FUN_02255DB8: @ 0x02255DB8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	adds r5, r0, #0
	ldr r0, [r5, #0x10]
	adds r4, r5, #0
	ldr r0, [r0, #0xc]
	movs r1, #0
	adds r4, #0x34
	bl FUN_020291A4
	movs r6, #5
	cmp r0, #0
	beq _02255DD4
	adds r6, r6, #1
_02255DD4:
	adds r0, r4, #0
	bl FUN_0201D3F0
	cmp r0, #0
	bne _02255E66
	adds r0, r6, #2
	movs r1, #4
	bl FUN_02014918
	str r0, [r5, #8]
	movs r3, #1
	str r3, [sp]
	movs r0, #0x10
	str r0, [sp, #4]
	adds r0, r6, #2
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x18
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	str r3, [sp, #0x10]
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	ldr r0, [r0, #8]
	movs r2, #3
	bl FUN_0201D40C
	adds r0, r5, #0
	ldr r2, _02255EB4 @ =0x000003D9
	adds r0, #0x34
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E580
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x68]
	movs r2, #0x8a
	movs r3, #0xc
	bl FUN_02014960
	movs r4, #0
	cmp r6, #0
	ble _02255E58
	movs r7, #0x80
_02255E2C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02255D8C
	ldr r0, [r5, #0x68]
	ldr r2, [r5, #0x1c]
	adds r1, r7, #0
	bl FUN_0200BB6C
	ldr r0, [r5, #0x64]
	ldr r1, [r5, #0x20]
	ldr r2, [r5, #0x1c]
	bl FUN_0200CBBC
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x20]
	adds r2, r4, #0
	bl FUN_02014980
	adds r4, r4, #1
	cmp r4, r6
	blt _02255E2C
_02255E58:
	movs r2, #0x81
	adds r3, r2, #0
	ldr r0, [r5, #8]
	ldr r1, [r5, #0x68]
	subs r3, #0x83
	bl FUN_02014960
_02255E66:
	ldr r4, _02255EB8 @ =0x0225943C
	add r3, sp, #0x14
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	adds r0, r6, #2
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	add r0, sp, #0x14
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x12]
	ldr r0, [r5, #8]
	movs r1, #0
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r0, #0x34
	str r0, [sp, #0x20]
	adds r0, r2, #0
	adds r2, r5, #0
	str r5, [sp, #0x30]
	adds r2, #0x78
	ldrh r2, [r2]
	movs r3, #4
	bl FUN_020011DC
	str r0, [r5]
	adds r5, #0x34
	adds r0, r5, #0
	bl FUN_0201D578
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_02255EB4: .4byte 0x000003D9
_02255EB8: .4byte 0x0225943C
	thumb_func_end FUN_02255DB8

	thumb_func_start FUN_02255EBC
FUN_02255EBC: @ 0x02255EBC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02255EF6
	movs r1, #0
	adds r2, r1, #0
	bl FUN_02001434
	adds r0, r4, #0
	adds r0, #0x34
	movs r1, #1
	bl FUN_0200E5D4
	adds r1, r4, #0
	adds r1, #0x38
	ldrb r1, [r1]
	ldr r0, [r4, #0x34]
	bl FUN_0201EFBC
	adds r0, r4, #0
	adds r0, #0x34
	bl FUN_0201D520
	ldr r0, [r4, #8]
	bl FUN_02014950
	movs r0, #0
	str r0, [r4]
_02255EF6:
	pop {r4, pc}
	thumb_func_end FUN_02255EBC

	thumb_func_start FUN_02255EF8
FUN_02255EF8: @ 0x02255EF8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	bl FUN_02001338
	adds r4, r0, #0
	adds r2, r5, #0
	ldr r0, [r5]
	movs r1, #0
	adds r2, #0x78
	bl FUN_020014E8
	adds r0, r5, #0
	adds r0, #0x80
	ldrh r6, [r0]
	adds r1, r5, #0
	ldr r0, [r5]
	adds r1, #0x80
	bl FUN_020014DC
	adds r0, r5, #0
	adds r0, #0x80
	ldrh r0, [r0]
	cmp r6, r0
	beq _02255F30
	ldr r0, _02255F94 @ =0x000005DC
	bl FUN_0200604C
_02255F30:
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _02255F60
	adds r0, r0, #1
	cmp r4, r0
	beq _02255F44
	cmp r4, #0xc
	beq _02255F48
	b _02255F7A
_02255F44:
	movs r0, #0
	pop {r4, r5, r6, pc}
_02255F48:
	ldr r0, _02255F94 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x10]
	movs r1, #0
	adds r0, #0xa4
	str r1, [r0]
	adds r0, r5, #0
	bl FUN_02255EBC
	movs r0, #2
	pop {r4, r5, r6, pc}
_02255F60:
	ldr r0, _02255F94 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x10]
	movs r1, #0
	adds r0, #0xa4
	str r1, [r0]
	adds r0, r5, #0
	bl FUN_02255EBC
	movs r0, #0
	mvns r0, r0
	pop {r4, r5, r6, pc}
_02255F7A:
	ldr r0, _02255F94 @ =0x000005DC
	bl FUN_0200604C
	ldr r0, [r5, #0x10]
	adds r1, r4, #0
	ldr r0, [r0, #0xc]
	bl FUN_020291E8
	ldr r1, [r5, #0x10]
	adds r1, #0xa4
	str r0, [r1]
	movs r0, #1
	pop {r4, r5, r6, pc}
	.align 2, 0
_02255F94: .4byte 0x000005DC
	thumb_func_end FUN_02255EF8

	thumb_func_start FUN_02255F98
FUN_02255F98: @ 0x02255F98
	push {r3, r4, r5, r6, lr}
	sub sp, #0x34
	adds r5, r0, #0
	movs r0, #3
	movs r1, #4
	ldr r4, _0225603C @ =0x02259838
	bl FUN_02014918
	str r0, [r5, #0xc]
	movs r0, #0xa
	str r0, [sp]
	movs r0, #9
	str r0, [sp, #4]
	movs r0, #6
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	ldr r0, _02256040 @ =0x00000201
	adds r1, r5, #0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0x10]
	adds r1, #0x44
	ldr r0, [r0, #8]
	movs r2, #3
	movs r3, #0x16
	bl FUN_0201D40C
	adds r0, r5, #0
	ldr r2, _02256044 @ =0x000003D9
	adds r0, #0x44
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E580
	movs r6, #0
_02255FDE:
	ldr r0, [r5, #0xc]
	ldr r1, [r5, #0x68]
	ldr r2, [r4]
	ldr r3, [r4, #4]
	bl FUN_02014960
	adds r6, r6, #1
	adds r4, #8
	cmp r6, #3
	blt _02255FDE
	ldr r4, _02256048 @ =0x0225943C
	add r3, sp, #0x14
	adds r2, r3, #0
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	ldm r4!, {r0, r1}
	stm r3!, {r0, r1}
	movs r1, #3
	add r0, sp, #0x14
	strh r1, [r0, #0x10]
	strh r1, [r0, #0x12]
	ldr r0, [r5, #0xc]
	movs r1, #0
	str r0, [sp, #0x14]
	adds r0, r5, #0
	adds r0, #0x44
	str r0, [sp, #0x20]
	adds r0, r2, #0
	adds r2, r5, #0
	str r5, [sp, #0x30]
	adds r2, #0x7a
	ldrh r2, [r2]
	movs r3, #4
	bl FUN_020011DC
	str r0, [r5, #4]
	adds r5, #0x44
	adds r0, r5, #0
	bl FUN_0201D578
	add sp, #0x34
	pop {r3, r4, r5, r6, pc}
	nop
_0225603C: .4byte 0x02259838
_02256040: .4byte 0x00000201
_02256044: .4byte 0x000003D9
_02256048: .4byte 0x0225943C
	thumb_func_end FUN_02255F98

	thumb_func_start FUN_0225604C
FUN_0225604C: @ 0x0225604C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #4]
	bl FUN_02001338
	adds r4, r0, #0
	adds r2, r5, #0
	ldr r0, [r5, #4]
	movs r1, #0
	adds r2, #0x7a
	bl FUN_020014E8
	adds r0, r5, #0
	adds r0, #0x82
	ldrh r6, [r0]
	adds r1, r5, #0
	ldr r0, [r5, #4]
	adds r1, #0x82
	bl FUN_020014DC
	adds r0, r5, #0
	adds r0, #0x82
	ldrh r0, [r0]
	cmp r6, r0
	beq _02256084
	ldr r0, _022560E8 @ =0x000005DC
	bl FUN_0200604C
_02256084:
	movs r0, #1
	mvns r0, r0
	cmp r4, r0
	beq _02256096
	adds r0, r0, #1
	cmp r4, r0
	bne _022560A2
	movs r0, #0
	pop {r4, r5, r6, pc}
_02256096:
	ldr r0, _022560E8 @ =0x000005DC
	bl FUN_0200604C
	movs r4, #0
	mvns r4, r4
	b _022560AE
_022560A2:
	ldr r0, _022560E8 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r5, #0
	bl FUN_02255EBC
_022560AE:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _022560E4
	movs r1, #0
	adds r2, r1, #0
	bl FUN_02001434
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #1
	bl FUN_0200E5D4
	adds r1, r5, #0
	adds r1, #0x48
	ldrb r1, [r1]
	ldr r0, [r5, #0x44]
	bl FUN_0201EFBC
	adds r0, r5, #0
	adds r0, #0x44
	bl FUN_0201D520
	ldr r0, [r5, #0xc]
	bl FUN_02014950
	movs r0, #0
	str r0, [r5, #4]
_022560E4:
	adds r0, r4, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
_022560E8: .4byte 0x000005DC
	thumb_func_end FUN_0225604C

	thumb_func_start FUN_022560EC
FUN_022560EC: @ 0x022560EC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp, #0x14]
	ldr r6, [r0, #0x64]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xb6
	movs r3, #4
	bl FUN_0200BAF8
	str r0, [sp, #0x30]
	movs r0, #0xb4
	movs r1, #4
	bl FUN_02026354
	str r0, [sp, #0x2c]
	movs r0, #0xb4
	movs r1, #4
	bl FUN_02026354
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x14]
	movs r2, #3
	str r0, [sp, #0x24]
	adds r0, #0x24
	str r0, [sp, #0x24]
	movs r0, #2
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x13
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x24]
	ldr r0, [r0, #0x10]
	movs r3, #4
	ldr r0, [r0, #8]
	bl FUN_0201D40C
	ldr r0, [sp, #0x24]
	ldr r2, _022563B8 @ =0x000003D9
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E580
	ldr r0, [sp, #0x24]
	movs r1, #0xf
	bl FUN_0201D978
	ldr r0, [sp, #0x14]
	adds r1, r0, #0
	adds r1, #0x78
	ldrh r1, [r1]
	subs r1, r1, #1
	bl FUN_02255D8C
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x2c]
	movs r1, #0x71
	bl FUN_0200BB6C
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	adds r0, r6, #0
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x28]
	movs r3, #0x39
	str r1, [sp, #8]
	bl FUN_020200A8
	movs r5, #0
	movs r4, #0x10
	movs r7, #0xff
_02256192:
	adds r1, r5, #0
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x2c]
	adds r1, #0x5d
	bl FUN_0200BB6C
	str r4, [sp]
	str r7, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x2c]
	movs r1, #0
	movs r3, #2
	bl FUN_020200A8
	adds r5, r5, #1
	adds r4, #0xf
	cmp r5, #9
	blt _02256192
	movs r0, #0
	str r0, [sp, #0x18]
	ldr r0, _022563BC @ =0x0225982C
	ldr r7, _022563C0 @ =0x02259820
	str r0, [sp, #0x20]
	movs r0, #0x10
	str r0, [sp, #0x1c]
_022561C8:
	ldr r0, [sp, #0x14]
	ldrb r1, [r7]
	ldr r0, [r0, #0x10]
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_020290FC
	adds r4, r0, #0
	ldr r0, [sp, #0x20]
	ldrb r5, [r0]
	ldrb r0, [r7]
	cmp r0, #0xb
	bls _022561E4
	b _02256348
_022561E4:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_022561F0: @ jump table
	.2byte _02256348 - _022561F0 - 2 @ case 0
	.2byte _02256208 - _022561F0 - 2 @ case 1
	.2byte _0225621C - _022561F0 - 2 @ case 2
	.2byte _02256232 - _022561F0 - 2 @ case 3
	.2byte _02256342 - _022561F0 - 2 @ case 4
	.2byte _02256250 - _022561F0 - 2 @ case 5
	.2byte _02256348 - _022561F0 - 2 @ case 6
	.2byte _022562CE - _022561F0 - 2 @ case 7
	.2byte _02256348 - _022561F0 - 2 @ case 8
	.2byte _02256342 - _022561F0 - 2 @ case 9
	.2byte _02256342 - _022561F0 - 2 @ case 10
	.2byte _02256320 - _022561F0 - 2 @ case 11
_02256208:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	movs r3, #1
	bl FUN_0200BFCC
	b _02256348
_0225621C:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	movs r3, #3
	bl FUN_0200BFCC
	b _02256348
_02256232:
	cmp r4, #0
	bne _0225623A
	movs r5, #0x72
	b _02256348
_0225623A:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	movs r3, #3
	bl FUN_0200BFCC
	b _02256348
_02256250:
	cmp r4, #0
	ldr r0, _022563C4 @ =0x00002710
	blt _0225626A
	muls r0, r4, r0
	movs r1, #0xfe
	blx FUN_020F2998
	adds r0, r0, #5
	movs r1, #0xa
	blx FUN_020F2998
	adds r4, r0, #0
	b _0225627E
_0225626A:
	rsbs r1, r4, #0
	muls r0, r1, r0
	movs r1, #0xfe
	blx FUN_020F2998
	adds r0, r0, #5
	movs r1, #0xa
	blx FUN_020F2998
	rsbs r4, r0, #0
_0225627E:
	adds r0, r4, #0
	movs r1, #0xc
	blx FUN_020F2998
	blx FUN_020E4A90
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r3, #2
	bl FUN_0200BFCC
	adds r0, r4, #0
	movs r1, #0xc
	blx FUN_020F2998
	adds r0, r1, #0
	blx FUN_020E4A90
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #1
	movs r3, #2
	bl FUN_0200BFCC
	cmp r4, #0
	bne _022562C8
	movs r5, #0x72
	b _02256348
_022562C8:
	ble _02256348
	adds r5, r5, #1
	b _02256348
_022562CE:
	cmp r4, #0
	ldr r0, _022563C8 @ =0x00035D2E
	blt _022562E6
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _022563CC @ =0x0000C350
	adds r0, r1, r0
	ldr r1, _022563D0 @ =0x000186A0
	blx FUN_020F2998
	adds r4, r0, #0
	b _022562F8
_022562E6:
	rsbs r1, r4, #0
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, _022563CC @ =0x0000C350
	ldr r1, _022563D0 @ =0x000186A0
	adds r0, r2, r0
	blx FUN_020F2998
	rsbs r4, r0, #0
_022562F8:
	adds r0, r4, #0
	blx FUN_020E4A90
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	cmp r4, #0
	bne _0225631A
	movs r5, #0x72
	b _02256348
_0225631A:
	ble _02256348
	adds r5, r5, #1
	b _02256348
_02256320:
	ldr r0, [sp, #0x14]
	movs r1, #0xd
	ldr r0, [r0, #0x10]
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_020290FC
	movs r1, #2
	lsls r1, r1, #0xe
	cmp r0, r1
	bne _0225633A
	movs r5, #0x73
	b _02256348
_0225633A:
	cmp r4, #0
	bne _02256348
	adds r5, r5, #1
	b _02256348
_02256342:
	cmp r4, #0
	bne _02256348
	adds r5, r5, #1
_02256348:
	ldr r0, [sp, #0x30]
	ldr r2, [sp, #0x2c]
	adds r1, r5, #0
	bl FUN_0200BB6C
	ldr r1, [sp, #0x28]
	ldr r2, [sp, #0x2c]
	adds r0, r6, #0
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [sp, #0x28]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r4, r0, #0
	ldr r0, [sp, #0x1c]
	movs r3, #0xbf
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x24]
	ldr r2, [sp, #0x28]
	movs r1, #0
	subs r3, r3, r4
	bl FUN_020200A8
	ldr r0, [sp, #0x20]
	adds r7, r7, #1
	adds r0, r0, #1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x1c]
	adds r0, #0xf
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x18]
	adds r0, r0, #1
	str r0, [sp, #0x18]
	cmp r0, #9
	bge _0225639C
	b _022561C8
_0225639C:
	ldr r0, [sp, #0x2c]
	bl FUN_02026380
	ldr r0, [sp, #0x28]
	bl FUN_02026380
	ldr r0, [sp, #0x30]
	bl FUN_0200BB44
	ldr r0, [sp, #0x24]
	bl FUN_0201D578
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_022563B8: .4byte 0x000003D9
_022563BC: .4byte 0x0225982C
_022563C0: .4byte 0x02259820
_022563C4: .4byte 0x00002710
_022563C8: .4byte 0x00035D2E
_022563CC: .4byte 0x0000C350
_022563D0: .4byte 0x000186A0
	thumb_func_end FUN_022560EC

	thumb_func_start FUN_022563D4
FUN_022563D4: @ 0x022563D4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x24
	movs r1, #1
	bl FUN_0200E5D4
	adds r1, r4, #0
	adds r1, #0x28
	ldrb r1, [r1]
	ldr r0, [r4, #0x24]
	bl FUN_0201EFBC
	adds r4, #0x24
	adds r0, r4, #0
	bl FUN_0201D520
	pop {r4, pc}
	.align 2, 0
	thumb_func_end FUN_022563D4

	thumb_func_start FUN_022563F8
FUN_022563F8: @ 0x022563F8
	push {r4, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x10]
	ldr r0, [r0, #0xc]
	bl FUN_02074904
	adds r1, r0, #0
	ldr r0, [r4, #0x10]
	ldr r2, [r4, #0x6c]
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_02074CD0
	cmp r0, #0
	beq _02256422
	cmp r0, #1
	beq _02256462
	cmp r0, #4
	beq _02256428
	b _02256462
_02256422:
	add sp, #8
	movs r0, #1
	pop {r4, pc}
_02256428:
	ldr r0, _022564A4 @ =0x000005F3
	bl FUN_0200604C
	adds r1, r4, #0
	adds r1, #0x78
	ldrh r1, [r1]
	adds r0, r4, #0
	subs r1, r1, #1
	bl FUN_02255D8C
	ldr r0, [r4, #0x10]
	movs r1, #1
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_020290FC
	movs r1, #1
	str r1, [sp]
	str r1, [sp, #4]
	adds r2, r0, #0
	ldr r0, [r4, #0x64]
	adds r3, r1, #0
	bl FUN_0200BFCC
	adds r0, r4, #0
	movs r1, #0x7a
	bl FUN_02255CF8
	b _0225649C
_02256462:
	ldr r0, _022564A4 @ =0x000005F3
	bl FUN_0200604C
	adds r1, r4, #0
	adds r1, #0x78
	ldrh r1, [r1]
	adds r0, r4, #0
	subs r1, r1, #1
	bl FUN_02255D8C
	ldr r0, [r4, #0x10]
	movs r1, #3
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_020290FC
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r0, [r4, #0x64]
	movs r3, #3
	bl FUN_0200BFCC
	adds r0, r4, #0
	movs r1, #0x88
	bl FUN_02255CF8
_0225649C:
	movs r0, #0
	add sp, #8
	pop {r4, pc}
	nop
_022564A4: .4byte 0x000005F3
	thumb_func_end FUN_022563F8

	thumb_func_start FUN_022564A8
FUN_022564A8: @ 0x022564A8
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0205064C
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldr r1, [r4, #0x7c]
	cmp r1, #0xb
	bls _022564C0
	b _02256636
_022564C0:
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_022564CC: @ jump table
	.2byte _022564E4 - _022564CC - 2 @ case 0
	.2byte _022564F2 - _022564CC - 2 @ case 1
	.2byte _02256510 - _022564CC - 2 @ case 2
	.2byte _02256542 - _022564CC - 2 @ case 3
	.2byte _0225654E - _022564CC - 2 @ case 4
	.2byte _02256574 - _022564CC - 2 @ case 5
	.2byte _0225658E - _022564CC - 2 @ case 6
	.2byte _022565AC - _022564CC - 2 @ case 7
	.2byte _022565C0 - _022564CC - 2 @ case 8
	.2byte _022565E2 - _022564CC - 2 @ case 9
	.2byte _0225663A - _022564CC - 2 @ case 10
	.2byte _022565F6 - _022564CC - 2 @ case 11
_022564E4:
	movs r1, #0x78
	bl FUN_02255CF8
	ldr r0, [r4, #0x7c]
	adds r0, r0, #1
	str r0, [r4, #0x7c]
	b _0225663A
_022564F2:
	ldr r0, [r4, #0x74]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_0205B624
	cmp r0, #0
	bne _02256502
	b _0225663A
_02256502:
	adds r0, r4, #0
	bl FUN_02255DB8
	ldr r0, [r4, #0x7c]
	adds r0, r0, #1
	str r0, [r4, #0x7c]
	b _0225663A
_02256510:
	bl FUN_02255EF8
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _02256528
	ldr r0, [r4, #0x70]
	movs r1, #2
	strh r1, [r0]
	movs r0, #0xb
	str r0, [r4, #0x7c]
	b _0225663A
_02256528:
	cmp r0, #2
	bne _02256538
	ldr r0, [r4, #0x70]
	movs r1, #3
	strh r1, [r0]
	movs r0, #0xb
	str r0, [r4, #0x7c]
	b _0225663A
_02256538:
	cmp r0, #1
	bne _0225663A
	movs r0, #3
	str r0, [r4, #0x7c]
	b _0225663A
_02256542:
	bl FUN_02255F98
	ldr r0, [r4, #0x7c]
	adds r0, r0, #1
	str r0, [r4, #0x7c]
	b _0225663A
_0225654E:
	bl FUN_0225604C
	movs r1, #0
	mvns r1, r1
	cmp r0, r1
	bne _02256560
	movs r0, #2
	str r0, [r4, #0x7c]
	b _0225663A
_02256560:
	cmp r0, #1
	bne _0225656A
	movs r0, #5
	str r0, [r4, #0x7c]
	b _0225663A
_0225656A:
	cmp r0, #2
	bne _0225663A
	movs r0, #7
	str r0, [r4, #0x7c]
	b _0225663A
_02256574:
	bl FUN_022563F8
	cmp r0, #0
	beq _02256588
	ldr r0, [r4, #0x70]
	movs r1, #1
	strh r1, [r0]
	movs r0, #0xb
	str r0, [r4, #0x7c]
	b _0225663A
_02256588:
	movs r0, #6
	str r0, [r4, #0x7c]
	b _0225663A
_0225658E:
	ldr r0, [r4, #0x74]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_0205B624
	cmp r0, #0
	beq _0225663A
	ldr r0, _02256640 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _0225663A
	movs r0, #0
	str r0, [r4, #0x7c]
	b _0225663A
_022565AC:
	movs r1, #1
	bl FUN_02255D68
	adds r0, r4, #0
	bl FUN_022560EC
	ldr r0, [r4, #0x7c]
	adds r0, r0, #1
	str r0, [r4, #0x7c]
	b _0225663A
_022565C0:
	ldr r1, _02256640 @ =0x021D110C
	ldr r2, [r1, #0x48]
	movs r1, #3
	tst r1, r2
	beq _0225663A
	bl FUN_022563D4
	adds r0, r4, #0
	movs r1, #0x78
	bl FUN_02255CF8
	adds r0, r4, #0
	bl FUN_02255DB8
	movs r0, #9
	str r0, [r4, #0x7c]
	b _0225663A
_022565E2:
	ldr r0, [r4, #0x74]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl FUN_0205B624
	cmp r0, #0
	beq _0225663A
	movs r0, #3
	str r0, [r4, #0x7c]
	b _0225663A
_022565F6:
	bl FUN_02255EBC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_02255D68
	ldr r0, [r4, #0x64]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x68]
	bl FUN_0200BB44
	ldr r0, [r4, #0x14]
	bl FUN_02026380
	ldr r0, [r4, #0x18]
	bl FUN_02026380
	ldr r0, [r4, #0x1c]
	bl FUN_02026380
	ldr r0, [r4, #0x20]
	bl FUN_02026380
	ldr r0, [r4, #0x6c]
	bl FUN_0207495C
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r4, pc}
_02256636:
	movs r0, #1
	pop {r4, pc}
_0225663A:
	movs r0, #0
	pop {r4, pc}
	nop
_02256640: .4byte 0x021D110C
	thumb_func_end FUN_022564A8

	thumb_func_start FUN_02256644
FUN_02256644: @ 0x02256644
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0xb
	movs r1, #0x84
	bl FUN_0201AACC
	movs r1, #0
	movs r2, #0x84
	adds r4, r0, #0
	blx FUN_020D4994
	movs r0, #0
	str r0, [r4, #0x7c]
	str r5, [r4, #0x10]
	adds r5, #0xa4
	str r0, [r5]
	movs r0, #4
	bl FUN_0200BD08
	str r0, [r4, #0x64]
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0x2e
	movs r3, #4
	bl FUN_0200BAF8
	str r0, [r4, #0x68]
	movs r0, #0xb4
	movs r1, #4
	bl FUN_02026354
	str r0, [r4, #0x14]
	movs r0, #0xb4
	movs r1, #4
	bl FUN_02026354
	str r0, [r4, #0x18]
	movs r0, #0xb4
	movs r1, #4
	bl FUN_02026354
	str r0, [r4, #0x1c]
	movs r0, #0xb4
	movs r1, #4
	bl FUN_02026354
	str r0, [r4, #0x20]
	movs r0, #0xb
	bl FUN_02074944
	str r0, [r4, #0x6c]
	adds r0, r4, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end FUN_02256644

	thumb_func_start FUN_022566B0
FUN_022566B0: @ 0x022566B0
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_0205064C
	bl FUN_02256644
	adds r2, r0, #0
	ldr r1, _022566CC @ =FUN_022564A8
	adds r0, r5, #0
	str r4, [r2, #0x70]
	bl FUN_02050530
	pop {r3, r4, r5, pc}
	.align 2, 0
_022566CC: .4byte FUN_022564A8
	thumb_func_end FUN_022566B0

	thumb_func_start FUN_022566D0
FUN_022566D0: @ 0x022566D0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r6, r1, #0
	movs r0, #0xb4
	movs r1, #4
	adds r7, r2, #0
	bl FUN_02026354
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	adds r1, r7, #0
	adds r2, r4, #0
	movs r3, #4
	bl FUN_0202921C
	movs r0, #1
	str r0, [sp]
	movs r0, #2
	movs r1, #0
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r2, r4, #0
	adds r3, r1, #0
	bl FUN_0200BE3C
	adds r0, r4, #0
	bl FUN_02026380
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end FUN_022566D0

	thumb_func_start FUN_02256710
FUN_02256710: @ 0x02256710
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0xc
	beq _0225671C
	cmp r1, #6
	bne _02256724
_0225671C:
	movs r0, #0
	adds r4, #0xa4
	str r0, [r4]
	pop {r4, pc}
_02256724:
	ldr r0, [r4, #0xc]
	bl FUN_020291E8
	adds r4, #0xa4
	str r0, [r4]
	pop {r4, pc}
	thumb_func_end FUN_02256710

	thumb_func_start FUN_02256730
FUN_02256730: @ 0x02256730
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	str r0, [sp, #0x14]
	movs r0, #2
	str r0, [sp]
	movs r0, #0x18
	str r0, [sp, #4]
	movs r0, #0x13
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	movs r0, #1
	str r0, [sp, #0x10]
	ldr r0, [sp, #0x14]
	adds r4, r2, #0
	ldr r0, [r0, #8]
	movs r2, #3
	movs r3, #4
	str r1, [sp, #0x18]
	bl FUN_0201D40C
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	ldr r2, _02256A10 @ =0x000003D9
	ldr r0, [r0, #8]
	movs r1, #3
	movs r3, #0xb
	bl FUN_0200E3DC
	ldr r0, [sp, #0x18]
	ldr r2, _02256A10 @ =0x000003D9
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E580
	ldr r0, [sp, #0x18]
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0
	movs r1, #0x1b
	movs r2, #0xb6
	movs r3, #4
	bl FUN_0200BAF8
	str r0, [sp, #0x30]
	movs r0, #4
	bl FUN_0200BD08
	adds r6, r0, #0
	movs r0, #0xb4
	movs r1, #4
	bl FUN_02026354
	adds r7, r0, #0
	movs r0, #0xb4
	movs r1, #4
	bl FUN_02026354
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x14]
	adds r1, r6, #0
	adds r2, r4, #0
	bl FUN_022566D0
	ldr r0, [sp, #0x30]
	movs r1, #0x71
	adds r2, r7, #0
	bl FUN_0200BB6C
	ldr r1, [sp, #0x2c]
	adds r0, r6, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x2c]
	movs r3, #0x39
	str r1, [sp, #8]
	bl FUN_020200A8
	movs r0, #0
	str r0, [sp, #0x28]
	movs r0, #0x10
	str r0, [sp, #0x1c]
	ldr r0, _02256A14 @ =0x02259820
	str r0, [sp, #0x24]
	ldr r0, _02256A18 @ =0x0225982C
	str r0, [sp, #0x20]
_022567F0:
	ldr r1, [sp, #0x28]
	ldr r0, [sp, #0x30]
	adds r1, #0x5d
	adds r2, r7, #0
	bl FUN_0200BB6C
	ldr r0, [sp, #0x1c]
	movs r1, #0
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	adds r2, r7, #0
	movs r3, #2
	bl FUN_020200A8
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x24]
	adds r0, #0xa4
	ldrb r1, [r1]
	ldr r0, [r0]
	bl FUN_020290FC
	adds r4, r0, #0
	ldr r0, [sp, #0x20]
	ldrb r5, [r0]
	ldr r0, [sp, #0x24]
	ldrb r0, [r0]
	cmp r0, #0xb
	bls _02256832
	b _02256994
_02256832:
	adds r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_0225683E: @ jump table
	.2byte _02256994 - _0225683E - 2 @ case 0
	.2byte _02256856 - _0225683E - 2 @ case 1
	.2byte _0225686A - _0225683E - 2 @ case 2
	.2byte _02256880 - _0225683E - 2 @ case 3
	.2byte _0225698E - _0225683E - 2 @ case 4
	.2byte _0225689E - _0225683E - 2 @ case 5
	.2byte _02256994 - _0225683E - 2 @ case 6
	.2byte _0225691C - _0225683E - 2 @ case 7
	.2byte _02256994 - _0225683E - 2 @ case 8
	.2byte _0225698E - _0225683E - 2 @ case 9
	.2byte _0225698E - _0225683E - 2 @ case 10
	.2byte _0225696E - _0225683E - 2 @ case 11
_02256856:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	movs r3, #1
	bl FUN_0200BFCC
	b _02256994
_0225686A:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	movs r3, #3
	bl FUN_0200BFCC
	b _02256994
_02256880:
	cmp r4, #0
	bne _02256888
	movs r5, #0x72
	b _02256994
_02256888:
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	adds r2, r4, #0
	movs r3, #3
	bl FUN_0200BFCC
	b _02256994
_0225689E:
	cmp r4, #0
	ldr r0, _02256A1C @ =0x00002710
	blt _022568B8
	muls r0, r4, r0
	movs r1, #0xfe
	blx FUN_020F2998
	adds r0, r0, #5
	movs r1, #0xa
	blx FUN_020F2998
	adds r4, r0, #0
	b _022568CC
_022568B8:
	rsbs r1, r4, #0
	muls r0, r1, r0
	movs r1, #0xfe
	blx FUN_020F2998
	adds r0, r0, #5
	movs r1, #0xa
	blx FUN_020F2998
	rsbs r4, r0, #0
_022568CC:
	adds r0, r4, #0
	movs r1, #0xc
	blx FUN_020F2998
	blx FUN_020E4A90
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r3, #2
	bl FUN_0200BFCC
	adds r0, r4, #0
	movs r1, #0xc
	blx FUN_020F2998
	adds r0, r1, #0
	blx FUN_020E4A90
	adds r2, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #1
	movs r3, #2
	bl FUN_0200BFCC
	cmp r4, #0
	bne _02256916
	movs r5, #0x72
	b _02256994
_02256916:
	ble _02256994
	adds r5, r5, #1
	b _02256994
_0225691C:
	cmp r4, #0
	ldr r0, _02256A20 @ =0x00035D2E
	blt _02256934
	adds r1, r4, #0
	muls r1, r0, r1
	ldr r0, _02256A24 @ =0x0000C350
	adds r0, r1, r0
	ldr r1, _02256A28 @ =0x000186A0
	blx FUN_020F2998
	adds r4, r0, #0
	b _02256946
_02256934:
	rsbs r1, r4, #0
	adds r2, r1, #0
	muls r2, r0, r2
	ldr r0, _02256A24 @ =0x0000C350
	ldr r1, _02256A28 @ =0x000186A0
	adds r0, r2, r0
	blx FUN_020F2998
	rsbs r4, r0, #0
_02256946:
	adds r0, r4, #0
	blx FUN_020E4A90
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r3, #3
	bl FUN_0200BFCC
	cmp r4, #0
	bne _02256968
	movs r5, #0x72
	b _02256994
_02256968:
	ble _02256994
	adds r5, r5, #1
	b _02256994
_0225696E:
	ldr r0, [sp, #0x14]
	movs r1, #0xd
	adds r0, #0xa4
	ldr r0, [r0]
	bl FUN_020290FC
	movs r1, #2
	lsls r1, r1, #0xe
	cmp r0, r1
	bne _02256986
	movs r5, #0x73
	b _02256994
_02256986:
	cmp r4, #0
	bne _02256994
	adds r5, r5, #1
	b _02256994
_0225698E:
	cmp r4, #0
	bne _02256994
	adds r5, r5, #1
_02256994:
	ldr r0, [sp, #0x30]
	adds r1, r5, #0
	adds r2, r7, #0
	bl FUN_0200BB6C
	ldr r1, [sp, #0x2c]
	adds r0, r6, #0
	adds r2, r7, #0
	bl FUN_0200CBBC
	movs r0, #0
	ldr r1, [sp, #0x2c]
	adds r2, r0, #0
	bl FUN_02002F30
	adds r4, r0, #0
	ldr r0, [sp, #0x1c]
	movs r3, #0xbf
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r0, [sp, #0x18]
	ldr r2, [sp, #0x2c]
	movs r1, #0
	subs r3, r3, r4
	bl FUN_020200A8
	ldr r0, [sp, #0x1c]
	adds r0, #0xf
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x24]
	adds r0, r0, #1
	str r0, [sp, #0x24]
	ldr r0, [sp, #0x20]
	adds r0, r0, #1
	str r0, [sp, #0x20]
	ldr r0, [sp, #0x28]
	adds r0, r0, #1
	str r0, [sp, #0x28]
	cmp r0, #9
	bge _022569EC
	b _022567F0
_022569EC:
	ldr r0, [sp, #0x2c]
	bl FUN_02026380
	adds r0, r7, #0
	bl FUN_02026380
	adds r0, r6, #0
	bl FUN_0200BDA0
	ldr r0, [sp, #0x30]
	bl FUN_0200BB44
	ldr r0, [sp, #0x18]
	bl FUN_0201D578
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_02256A10: .4byte 0x000003D9
_02256A14: .4byte 0x02259820
_02256A18: .4byte 0x0225982C
_02256A1C: .4byte 0x00002710
_02256A20: .4byte 0x00035D2E
_02256A24: .4byte 0x0000C350
_02256A28: .4byte 0x000186A0
	thumb_func_end FUN_02256730

	thumb_func_start FUN_02256A2C
FUN_02256A2C: @ 0x02256A2C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #8]
	ldr r0, [r0, #0xc]
	str r1, [sp, #0xc]
	str r2, [sp, #0x10]
	bl FUN_02074904
	adds r6, r0, #0
	movs r0, #0xb
	bl FUN_02074944
	str r0, [sp, #0x14]
	ldr r0, [sp, #0x10]
	cmp r0, #0xa
	bne _02256A84
	adds r0, r6, #0
	bl FUN_02074640
	adds r7, r0, #0
	adds r5, r7, #0
	movs r4, #0
	cmp r7, #0
	ble _02256A78
_02256A5C:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_02074644
	movs r1, #0x4c
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	beq _02256A72
	subs r5, r5, #1
_02256A72:
	adds r4, r4, #1
	cmp r4, r7
	blt _02256A5C
_02256A78:
	cmp r5, #2
	bge _02256A80
	movs r4, #7
	b _02256A94
_02256A80:
	movs r4, #0
	b _02256A94
_02256A84:
	ldr r0, [sp, #8]
	ldr r2, [sp, #0x14]
	adds r0, #0xa4
	ldr r0, [r0]
	adds r1, r6, #0
	bl FUN_02074CD0
	adds r4, r0, #0
_02256A94:
	ldr r0, [sp, #0x14]
	bl FUN_0207495C
	cmp r4, #7
	bhi _02256B0E
	adds r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02256AAA: @ jump table
	.2byte _02256ABA - _02256AAA - 2 @ case 0
	.2byte _02256B0E - _02256AAA - 2 @ case 1
	.2byte _02256B0E - _02256AAA - 2 @ case 2
	.2byte _02256B0E - _02256AAA - 2 @ case 3
	.2byte _02256AC0 - _02256AAA - 2 @ case 4
	.2byte _02256B0E - _02256AAA - 2 @ case 5
	.2byte _02256B0E - _02256AAA - 2 @ case 6
	.2byte _02256AEE - _02256AAA - 2 @ case 7
_02256ABA:
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02256AC0:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl FUN_022566D0
	ldr r0, [sp, #8]
	movs r1, #1
	adds r0, #0xa4
	str r0, [sp, #8]
	ldr r0, [r0]
	bl FUN_020290FC
	movs r1, #1
	adds r2, r0, #0
	str r1, [sp]
	ldr r0, [sp, #0xc]
	adds r3, r1, #0
	str r1, [sp, #4]
	bl FUN_0200BFCC
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02256AEE:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl FUN_022566D0
	movs r1, #1
	str r1, [sp]
	ldr r0, [sp, #0xc]
	movs r2, #2
	adds r3, r1, #0
	str r1, [sp, #4]
	bl FUN_0200BFCC
	add sp, #0x18
	movs r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02256B0E:
	ldr r0, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #0x10]
	bl FUN_022566D0
	ldr r0, [sp, #8]
	movs r1, #3
	adds r0, #0xa4
	str r0, [sp, #8]
	ldr r0, [r0]
	bl FUN_020290FC
	adds r2, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r1, #1
	ldr r0, [sp, #0xc]
	movs r3, #3
	str r1, [sp, #4]
	bl FUN_0200BFCC
	movs r0, #2
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end FUN_02256A2C

	thumb_func_start FUN_02256B40
FUN_02256B40: @ 0x02256B40
	cmp r0, #0xb
	bhi _02256B7E
	adds r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02256B50: @ jump table
	.2byte _02256B7E - _02256B50 - 2 @ case 0
	.2byte _02256B7E - _02256B50 - 2 @ case 1
	.2byte _02256B7E - _02256B50 - 2 @ case 2
	.2byte _02256B7E - _02256B50 - 2 @ case 3
	.2byte _02256B7E - _02256B50 - 2 @ case 4
	.2byte _02256B7E - _02256B50 - 2 @ case 5
	.2byte _02256B68 - _02256B50 - 2 @ case 6
	.2byte _02256B6C - _02256B50 - 2 @ case 7
	.2byte _02256B70 - _02256B50 - 2 @ case 8
	.2byte _02256B74 - _02256B50 - 2 @ case 9
	.2byte _02256B78 - _02256B50 - 2 @ case 10
	.2byte _02256B78 - _02256B50 - 2 @ case 11
_02256B68:
	movs r0, #0xff
	bx lr
_02256B6C:
	movs r0, #0
	bx lr
_02256B70:
	movs r0, #3
	bx lr
_02256B74:
	movs r0, #4
	bx lr
_02256B78:
	movs r0, #0
	mvns r0, r0
	bx lr
_02256B7E:
	cmp r0, #9
	blo _02256B84
	movs r0, #0xff
_02256B84:
	bx lr
	.align 2, 0
	thumb_func_end FUN_02256B40

	thumb_func_start FUN_02256B88
FUN_02256B88: @ 0x02256B88
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_02256B8E:
	adds r0, r5, #0
	adds r0, #0x80
	lsls r1, r4, #0x18
	ldr r0, [r0]
	lsrs r1, r1, #0x18
	bl FUN_02256BA8
	adds r4, r4, #1
	cmp r4, #3
	blt _02256B8E
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end FUN_02256B88

	thumb_func_start FUN_02256BA8
FUN_02256BA8: @ 0x02256BA8
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r0, _02256BE8 @ =0x0225945C
	lsls r1, r6, #1
	ldrh r4, [r0, r1]
	adds r0, r5, #0
	adds r0, #0xc0
	ldr r0, [r0]
	adds r1, r4, #0
	bl FUN_022040D0
	adds r7, r0, #0
	bne _02256BCA
	bl FUN_0202551C
	pop {r3, r4, r5, r6, r7, pc}
_02256BCA:
	ldr r0, [r5, #0xc]
	bl FUN_020503D0
	adds r1, r6, #0
	bl FUN_020669B4
	adds r1, r0, #0
	ldr r0, [r5, #0x54]
	movs r2, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r3, r7, #0
	bl FUN_021E8970
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02256BE8: .4byte 0x0225945C
	thumb_func_end FUN_02256BA8

	thumb_func_start FUN_02256BEC
FUN_02256BEC: @ 0x02256BEC
	push {r3, r4}
	subs r2, r2, #3
	cmp r2, #1
	ldr r3, _02256C28 @ =0x0000FFFF
	bhi _02256C0C
	movs r0, #1
	movs r2, #0
	lsls r0, r0, #8
_02256BFC:
	ldrh r4, [r1]
	cmp r4, r3
	beq _02256C20
	adds r2, r2, #1
	adds r1, r1, #4
	cmp r2, r0
	blt _02256BFC
	b _02256C20
_02256C0C:
	movs r1, #1
	movs r2, #0
	lsls r1, r1, #8
_02256C12:
	ldrh r4, [r0]
	cmp r4, r3
	beq _02256C20
	adds r2, r2, #1
	adds r0, r0, #2
	cmp r2, r1
	blt _02256C12
_02256C20:
	adds r0, r2, #0
	pop {r3, r4}
	bx lr
	nop
_02256C28: .4byte 0x0000FFFF
	thumb_func_end FUN_02256BEC

	thumb_func_start FUN_02256C2C
FUN_02256C2C: @ 0x02256C2C
	push {r4, r5, r6, r7}
	adds r4, r0, #0
	movs r0, #0x27
	lsls r0, r0, #4
	ldrb r7, [r4, r0]
	adds r3, r1, #0
	movs r1, #0
	adds r0, r1, #0
	mov ip, r2
	cmp r7, #0
	ble _02256C80
_02256C42:
	mov r2, ip
	cmp r2, #0
	ldrh r6, [r3]
	bne _02256C6C
	cmp r6, #4
	bne _02256C5E
	movs r2, #0x27
	lsls r2, r2, #4
	ldrb r2, [r4, r2]
	subs r5, r2, #1
	movs r2, #0x27
	lsls r2, r2, #4
	strb r5, [r4, r2]
	b _02256C78
_02256C5E:
	movs r2, #0x9a
	lsls r2, r2, #2
	ldr r5, [r4, r2]
	lsls r2, r1, #1
	strh r6, [r5, r2]
	adds r1, r1, #1
	b _02256C78
_02256C6C:
	movs r2, #0x9a
	lsls r2, r2, #2
	ldr r5, [r4, r2]
	lsls r2, r1, #1
	strh r6, [r5, r2]
	adds r1, r1, #1
_02256C78:
	adds r0, r0, #1
	adds r3, r3, #2
	cmp r0, r7
	blt _02256C42
_02256C80:
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end FUN_02256C2C

	thumb_func_start FUN_02256C84
FUN_02256C84: @ 0x02256C84
	push {r4, r5, r6, r7}
	movs r3, #0x27
	lsls r3, r3, #4
	ldrb r3, [r0, r3]
	movs r2, #0
	cmp r3, #0
	ble _02256CAE
	movs r4, #0x9a
	lsls r4, r4, #2
	adds r5, r4, #0
	adds r3, r2, #0
	adds r5, #8
_02256C9C:
	ldrh r7, [r1]
	ldr r6, [r0, r4]
	adds r2, r2, #1
	strh r7, [r6, r3]
	ldrb r6, [r0, r5]
	adds r3, r3, #2
	adds r1, r1, #4
	cmp r2, r6
	blt _02256C9C
_02256CAE:
	pop {r4, r5, r6, r7}
	bx lr
	.align 2, 0
	thumb_func_end FUN_02256C84

	thumb_func_start FUN_02256CB4
FUN_02256CB4: @ 0x02256CB4
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r2, #0
	ldr r2, _02256D14 @ =0x00000283
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r3, #0
	ldrb r2, [r5, r2]
	adds r0, r4, #0
	adds r1, r7, #0
	bl FUN_02256BEC
	movs r1, #0x27
	lsls r1, r1, #4
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r0, #0xff
	blo _02256CDA
	bl FUN_0202551C
_02256CDA:
	movs r1, #0x27
	lsls r1, r1, #4
	ldrb r1, [r5, r1]
	movs r0, #0xb
	lsls r1, r1, #1
	bl FUN_0201AA8C
	movs r1, #0x9a
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r1, #0x1b
	ldrb r0, [r5, r1]
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02256D06
	adds r0, r5, #0
	adds r1, r7, #0
	bl FUN_02256C84
	pop {r3, r4, r5, r6, r7, pc}
_02256D06:
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl FUN_02256C2C
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02256D14: .4byte 0x00000283
	thumb_func_end FUN_02256CB4

	thumb_func_start FUN_02256D18
FUN_02256D18: @ 0x02256D18
	push {r4, lr}
	movs r1, #0xa9
	movs r0, #0xb
	lsls r1, r1, #2
	bl FUN_0201AA8C
	movs r2, #0xa9
	movs r1, #0
	lsls r2, r2, #2
	adds r4, r0, #0
	blx FUN_020E5B44
	adds r0, r4, #0
	pop {r4, pc}
	thumb_func_end FUN_02256D18

	thumb_func_start FUN_02256D34
FUN_02256D34: @ 0x02256D34
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r1, #0
	adds r7, r0, #0
	str r2, [sp]
	adds r6, r3, #0
	bl FUN_02256D18
	adds r4, r0, #0
	ldr r0, [r5, #8]
	movs r1, #0xb
	str r0, [r4]
	movs r0, #0x60
	bl FUN_02026354
	movs r1, #0x9d
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl FUN_02028E9C
	movs r1, #0x92
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl FUN_02028EA8
	movs r1, #0x25
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl FUN_0202CF54
	movs r1, #0x97
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl FUN_020503D0
	movs r1, #0x26
	lsls r1, r1, #4
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl FUN_02031B14
	movs r1, #0x96
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r2, [sp, #0x1c]
	adds r0, #0xc
	str r2, [r4, r0]
	adds r0, r1, #0
	adds r0, #0x2b
	adds r2, r1, #0
	strb r6, [r4, r0]
	movs r0, #0
	adds r2, #0x19
	strb r0, [r4, r2]
	adds r2, r1, #0
	adds r2, #0x38
	str r0, [r4, r2]
	adds r2, r1, #0
	subs r3, r0, #1
	adds r2, #0x3c
	str r3, [r4, r2]
	adds r1, #0x40
	str r0, [r4, r1]
	ldr r0, [r5, #0xc]
	bl FUN_02031968
	movs r1, #0x95
	lsls r1, r1, #2
	str r0, [r4, r1]
	adds r0, r1, #0
	ldr r2, [sp, #0x20]
	adds r0, #0x18
	str r2, [r4, r0]
	add r0, sp, #8
	ldrb r2, [r0, #0x10]
	adds r0, r1, #0
	adds r0, #0x1f
	adds r1, #0x2f
	strb r2, [r4, r0]
	ldrb r0, [r4, r1]
	cmp r0, #0
	beq _02256DEA
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02256DF8
_02256DEA:
	ldr r0, [r5, #0xc]
	bl FUN_0207879C
	movs r1, #0x93
	lsls r1, r1, #2
	str r0, [r4, r1]
	b _02256E04
_02256DF8:
	ldr r0, [r5, #0xc]
	bl FUN_0202CBE8
	movs r1, #0x93
	lsls r1, r1, #2
	str r0, [r4, r1]
_02256E04:
	movs r0, #0x26
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02066A00
	adds r2, r0, #0
	ldr r1, [sp]
	ldr r3, [sp, #0x20]
	adds r0, r4, #0
	bl FUN_02256CB4
	ldr r1, _02256E28 @ =FUN_02256E2C
	adds r0, r7, #0
	adds r2, r4, #0
	bl FUN_02050530
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02256E28: .4byte FUN_02256E2C
	thumb_func_end FUN_02256D34

	thumb_func_start FUN_02256E2C
FUN_02256E2C: @ 0x02256E2C
	push {r3, r4, r5, r6, r7, lr}
	adds r6, r0, #0
	bl FUN_0205064C
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_02050650
	ldr r1, _02257064 @ =0x00000272
	adds r4, r0, #0
	ldrb r2, [r4, r1]
	cmp r2, #0x1b
	bhi _02256F08
	adds r2, r2, r2
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02256E52: @ jump table
	.2byte _02256E8A - _02256E52 - 2 @ case 0
	.2byte _02256EA6 - _02256E52 - 2 @ case 1
	.2byte _02256EC0 - _02256E52 - 2 @ case 2
	.2byte _02256ECE - _02256E52 - 2 @ case 3
	.2byte _02256EF6 - _02256E52 - 2 @ case 4
	.2byte _02256F2C - _02256E52 - 2 @ case 5
	.2byte _02256EFC - _02256E52 - 2 @ case 6
	.2byte _02256F36 - _02256E52 - 2 @ case 7
	.2byte _02256F5E - _02256E52 - 2 @ case 8
	.2byte _02256F68 - _02256E52 - 2 @ case 9
	.2byte _02256F72 - _02256E52 - 2 @ case 10
	.2byte _02256F7C - _02256E52 - 2 @ case 11
	.2byte _02256F9A - _02256E52 - 2 @ case 12
	.2byte _02256FA4 - _02256E52 - 2 @ case 13
	.2byte _02256FAE - _02256E52 - 2 @ case 14
	.2byte _02256FB8 - _02256E52 - 2 @ case 15
	.2byte _02256FC2 - _02256E52 - 2 @ case 16
	.2byte _02256FCC - _02256E52 - 2 @ case 17
	.2byte _02256FE0 - _02256E52 - 2 @ case 18
	.2byte _02256FEE - _02256E52 - 2 @ case 19
	.2byte _02256FF8 - _02256E52 - 2 @ case 20
	.2byte _02257002 - _02256E52 - 2 @ case 21
	.2byte _0225700C - _02256E52 - 2 @ case 22
	.2byte _02257016 - _02256E52 - 2 @ case 23
	.2byte _02257036 - _02256E52 - 2 @ case 24
	.2byte _02257036 - _02256E52 - 2 @ case 25
	.2byte _0225701E - _02256E52 - 2 @ case 26
	.2byte _0225702C - _02256E52 - 2 @ case 27
_02256E8A:
	bl FUN_0225706C
	ldr r0, _02257068 @ =0x00000273
	ldrb r1, [r4, r0]
	cmp r1, #0
	bne _02256E9E
	movs r1, #1
	subs r0, r0, #1
	strb r1, [r4, r0]
	b _02257036
_02256E9E:
	movs r1, #0x16
	subs r0, r0, #1
	strb r1, [r4, r0]
	b _02257036
_02256EA6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_022570D4
	adds r0, r5, #0
	movs r1, #2
	adds r2, r4, #0
	bl FUN_021F6A9C
	ldr r0, _02257064 @ =0x00000272
	movs r1, #2
	strb r1, [r4, r0]
	b _02257036
_02256EC0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02257334
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256ECE:
	adds r1, #0x22
	movs r2, #0
	ldr r1, [r4, r1]
	mvns r2, r2
	cmp r1, r2
	bne _02256EE4
	bl FUN_02257510
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256EE4:
	bl FUN_0225761C
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	movs r0, #0
	mvns r0, r0
	adds r1, #0x22
	str r0, [r4, r1]
	b _02257036
_02256EF6:
	movs r0, #3
	strb r0, [r4, r1]
	b _02257036
_02256EFC:
	subs r1, #0x52
	ldr r0, [r4, r1]
	bl FUN_02024B68
	cmp r0, #0
	beq _02256F0A
_02256F08:
	b _02257036
_02256F0A:
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r2, r3, #0
	ldr r1, [r4, r3]
	adds r2, #0x28
	adds r3, #9
	ldr r5, [r4, r2]
	ldrb r2, [r4, r3]
	adds r0, r4, #0
	adds r2, r5, r2
	lsls r2, r2, #1
	ldrh r1, [r1, r2]
	bl FUN_02257874
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256F2C:
	bl FUN_02257944
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256F36:
	adds r1, #0x22
	movs r2, #0
	ldr r1, [r4, r1]
	mvns r2, r2
	cmp r1, r2
	bne _02256F4C
	bl FUN_02257ADC
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256F4C:
	bl FUN_02257B4C
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	movs r0, #0
	mvns r0, r0
	adds r1, #0x22
	str r0, [r4, r1]
	b _02257036
_02256F5E:
	bl FUN_022579E0
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256F68:
	bl FUN_02257A70
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256F72:
	bl FUN_02257D6C
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256F7C:
	adds r1, #0x22
	movs r2, #0
	ldr r1, [r4, r1]
	mvns r2, r2
	cmp r1, r2
	beq _02257036
	bl FUN_02257D90
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	movs r0, #0
	mvns r0, r0
	adds r1, #0x22
	str r0, [r4, r1]
	b _02257036
_02256F9A:
	bl FUN_02257E6C
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FA4:
	bl FUN_02257F24
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FAE:
	bl FUN_02257FF8
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FB8:
	bl FUN_02258078
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FC2:
	bl FUN_022577D0
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FCC:
	bl FUN_022572EC
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02258164
	ldr r0, _02257064 @ =0x00000272
	movs r1, #0x12
	strb r1, [r4, r0]
	b _02257036
_02256FE0:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02258170
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FEE:
	bl FUN_022576F8
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02256FF8:
	bl FUN_02257728
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_02257002:
	bl FUN_022586E0
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_0225700C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225874C
	b _02257036
_02257016:
	adds r0, r6, #0
	bl FUN_02258764
	b _02257036
_0225701E:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_022587D4
	ldr r1, _02257064 @ =0x00000272
	strb r0, [r4, r1]
	b _02257036
_0225702C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_0225709C
	pop {r3, r4, r5, r6, r7, pc}
_02257036:
	movs r7, #0x7e
	movs r6, #0
	adds r5, r4, #0
	lsls r7, r7, #2
_0225703E:
	ldr r0, [r5, r7]
	cmp r0, #0
	beq _0225704C
	movs r1, #1
	lsls r1, r1, #0xc
	bl FUN_020249B0
_0225704C:
	adds r6, r6, #1
	adds r5, r5, #4
	cmp r6, #0x13
	blt _0225703E
	adds r4, #0x94
	ldr r0, [r4]
	cmp r0, #0
	beq _02257060
	bl FUN_0202457C
_02257060:
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02257064: .4byte 0x00000272
_02257068: .4byte 0x00000273
	thumb_func_end FUN_02256E2C

	thumb_func_start FUN_0225706C
FUN_0225706C: @ 0x0225706C
	ldr r3, _02257070 @ =FUN_02257074
	bx r3
	.align 2, 0
_02257070: .4byte FUN_02257074
	thumb_func_end FUN_0225706C

	thumb_func_start FUN_02257074
FUN_02257074: @ 0x02257074
	push {r4, lr}
	ldr r2, _02257098 @ =0x000001B3
	adds r4, r0, #0
	movs r0, #0
	movs r1, #0x1b
	movs r3, #0xb
	bl FUN_0200BAF8
	adds r1, r4, #0
	adds r1, #0x88
	str r0, [r1]
	movs r0, #0xb
	bl FUN_0200BD08
	adds r4, #0x8c
	str r0, [r4]
	pop {r4, pc}
	nop
_02257098: .4byte 0x000001B3
	thumb_func_end FUN_02257074

	thumb_func_start FUN_0225709C
FUN_0225709C: @ 0x0225709C
	push {r4, lr}
	adds r4, r1, #0
	adds r0, r4, #0
	adds r0, #0x88
	ldr r0, [r0]
	bl FUN_0200BB44
	adds r0, r4, #0
	adds r0, #0x8c
	ldr r0, [r0]
	bl FUN_0200BDA0
	movs r0, #0x9d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02026380
	movs r0, #0x9a
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_0201AB0C
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r4, pc}
	.align 2, 0
	thumb_func_end FUN_0225709C

	thumb_func_start FUN_022570D4
FUN_022570D4: @ 0x022570D4
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0x12
	str r0, [sp]
	movs r0, #0x20
	str r0, [sp, #4]
	movs r0, #6
	movs r2, #0
	str r0, [sp, #8]
	adds r4, r1, #0
	str r2, [sp, #0xc]
	ldr r0, [r4]
	movs r1, #3
	adds r3, r2, #0
	bl FUN_0201C8C4
	ldr r0, [r4]
	movs r1, #3
	bl FUN_0201EFBC
	adds r0, r4, #0
	bl FUN_02257134
	movs r0, #0xb
	bl FUN_02023114
	adds r1, r4, #0
	adds r1, #0x90
	str r0, [r1]
	adds r1, r4, #0
	adds r1, #0x90
	ldr r0, [r5, #0x24]
	ldr r1, [r1]
	bl FUN_02023128
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_0202313C
	ldr r0, _02257130 @ =0x00000281
	movs r1, #0
	strb r1, [r4, r0]
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_02257130: .4byte 0x00000281
	thumb_func_end FUN_022570D4

	thumb_func_start FUN_02257134
FUN_02257134: @ 0x02257134
	push {r3, r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	ldr r7, _02257178 @ =0x022594C6
	movs r6, #0
	adds r4, #8
_02257140:
	ldr r0, _0225717C @ =0x00000283
	ldrb r0, [r5, r0]
	cmp r0, #0
	beq _02257160
	cmp r0, #3
	beq _02257160
	cmp r0, #4
	beq _02257160
	cmp r6, #1
	bne _02257160
	ldr r0, [r5]
	ldr r2, _02257180 @ =0x02259464
	adds r1, r4, #0
	bl FUN_0201D4F8
	b _0225716A
_02257160:
	ldr r0, [r5]
	adds r1, r4, #0
	adds r2, r7, #0
	bl FUN_0201D4F8
_0225716A:
	adds r6, r6, #1
	adds r4, #0x10
	adds r7, #8
	cmp r6, #6
	blo _02257140
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02257178: .4byte 0x022594C6
_0225717C: .4byte 0x00000283
_02257180: .4byte 0x02259464
	thumb_func_end FUN_02257134

	thumb_func_start FUN_02257184
FUN_02257184: @ 0x02257184
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x28
	movs r1, #1
	bl FUN_0200E5D4
	movs r4, #0
	adds r5, #8
_02257194:
	adds r0, r5, #0
	bl FUN_0201D8E4
	adds r0, r5, #0
	bl FUN_0201D520
	adds r4, r4, #1
	adds r5, #0x10
	cmp r4, #6
	blo _02257194
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end FUN_02257184

	thumb_func_start FUN_022571AC
FUN_022571AC: @ 0x022571AC
	push {r4, lr}
	sub sp, #0x10
	movs r1, #0
	str r1, [sp]
	str r1, [sp, #4]
	adds r4, r0, #0
	str r1, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x3c
	movs r3, #1
	bl FUN_020078F0
	ldr r0, _02257258 @ =0x00000283
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _022571DA
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _022571F4
_022571DA:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x3c
	movs r1, #2
	movs r3, #1
	bl FUN_02007914
	b _0225720C
_022571F4:
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	movs r0, #0xb
	str r0, [sp, #0xc]
	ldr r2, [r4]
	movs r0, #0x3c
	movs r1, #3
	movs r3, #1
	bl FUN_02007914
_0225720C:
	movs r0, #0x20
	str r0, [sp]
	movs r0, #0xb
	movs r2, #0
	str r0, [sp, #4]
	movs r0, #0x3c
	movs r1, #1
	adds r3, r2, #0
	bl FUN_02007938
	movs r0, #0
	str r0, [sp]
	movs r3, #0xb
	str r3, [sp, #4]
	ldr r0, [r4]
	movs r1, #3
	movs r2, #0x1f
	bl FUN_0200E3DC
	movs r0, #0x25
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_0202ADCC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	ldr r0, [r4]
	movs r1, #3
	movs r2, #1
	movs r3, #0xa
	bl FUN_0200E644
	add sp, #0x10
	pop {r4, pc}
	nop
_02257258: .4byte 0x00000283
	thumb_func_end FUN_022571AC

	thumb_func_start FUN_0225725C
FUN_0225725C: @ 0x0225725C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02022D68
	movs r1, #0x9f
	lsls r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	movs r1, #0
	bl FUN_0201CC2C
	movs r1, #0x9e
	lsls r1, r1, #2
	strb r0, [r4, r1]
	ldr r0, [r4]
	movs r1, #1
	bl FUN_0201CC2C
	ldr r1, _022572E0 @ =0x00000279
	strb r0, [r4, r1]
	ldr r0, [r4]
	movs r1, #2
	bl FUN_0201CC2C
	ldr r1, _022572E4 @ =0x0000027A
	strb r0, [r4, r1]
	ldr r0, [r4]
	movs r1, #3
	bl FUN_0201CC2C
	ldr r1, _022572E8 @ =0x0000027B
	strb r0, [r4, r1]
	movs r0, #0
	movs r1, #3
	bl FUN_0201BB68
	movs r0, #1
	movs r1, #2
	bl FUN_0201BB68
	movs r0, #2
	movs r1, #1
	bl FUN_0201BB68
	movs r0, #3
	movs r1, #0
	bl FUN_0201BB68
	movs r0, #1
	adds r1, r0, #0
	bl FUN_02022C60
	movs r0, #2
	movs r1, #1
	bl FUN_02022C60
	movs r0, #4
	movs r1, #1
	bl FUN_02022C60
	movs r0, #8
	movs r1, #1
	bl FUN_02022C60
	pop {r4, pc}
	nop
_022572E0: .4byte 0x00000279
_022572E4: .4byte 0x0000027A
_022572E8: .4byte 0x0000027B
	thumb_func_end FUN_0225725C

	thumb_func_start FUN_022572EC
FUN_022572EC: @ 0x022572EC
	push {r4, lr}
	movs r1, #0x9e
	adds r4, r0, #0
	lsls r1, r1, #2
	ldrb r1, [r4, r1]
	movs r0, #0
	bl FUN_0201BB68
	ldr r1, _02257328 @ =0x00000279
	movs r0, #1
	ldrb r1, [r4, r1]
	bl FUN_0201BB68
	ldr r1, _0225732C @ =0x0000027A
	movs r0, #2
	ldrb r1, [r4, r1]
	bl FUN_0201BB68
	ldr r1, _02257330 @ =0x0000027B
	movs r0, #3
	ldrb r1, [r4, r1]
	bl FUN_0201BB68
	movs r0, #0x9f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	bl FUN_02022C9C
	pop {r4, pc}
	nop
_02257328: .4byte 0x00000279
_0225732C: .4byte 0x0000027A
_02257330: .4byte 0x0000027B
	thumb_func_end FUN_022572EC

	thumb_func_start FUN_02257334
FUN_02257334: @ 0x02257334
	push {r4, lr}
	adds r4, r1, #0
	bl FUN_021F6B10
	cmp r0, #1
	beq _02257344
	movs r0, #2
	pop {r4, pc}
_02257344:
	ldr r0, _02257374 @ =0x00000281
	movs r1, #0
	strb r1, [r4, r0]
	adds r0, r4, #0
	bl FUN_022571AC
	adds r0, r4, #0
	bl FUN_0225725C
	movs r1, #0x29
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl FUN_022573D4
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #3
	pop {r4, pc}
	nop
_02257374: .4byte 0x00000281
	thumb_func_end FUN_02257334

	thumb_func_start FUN_02257378
FUN_02257378: @ 0x02257378
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r2, #0
	beq _0225738A
	cmp r2, #1
	beq _022573C0
	cmp r2, #2
	pop {r3, r4, r5, pc}
_0225738A:
	movs r1, #0x22
	lsls r1, r1, #4
	ldr r0, [r4, r1]
	adds r1, #0x70
	ldr r1, [r4, r1]
	lsls r2, r1, #2
	ldr r1, _022573C4 @ =0x022594A0
	ldrb r1, [r1, r2]
	bl FUN_020248F0
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r1, _022573C8 @ =0x022594A1
	lsls r5, r5, #2
	ldrb r1, [r1, r5]
	ldr r0, [r4, r0]
	bl FUN_0200DD08
	ldr r1, _022573CC @ =0x0225949E
	ldr r2, _022573D0 @ =0x0225949F
	movs r0, #0x22
	lsls r0, r0, #4
	ldrb r1, [r1, r5]
	ldrb r2, [r2, r5]
	ldr r0, [r4, r0]
	bl FUN_0200DD88
_022573C0:
	pop {r3, r4, r5, pc}
	nop
_022573C4: .4byte 0x022594A0
_022573C8: .4byte 0x022594A1
_022573CC: .4byte 0x0225949E
_022573D0: .4byte 0x0225949F
	thumb_func_end FUN_02257378

	thumb_func_start FUN_022573D4
FUN_022573D4: @ 0x022573D4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	movs r3, #0x9a
	lsls r3, r3, #2
	adds r4, r0, #0
	adds r2, r3, #0
	ldr r0, [r4, r3]
	adds r2, #0x28
	adds r3, #9
	ldr r5, [r4, r2]
	ldrb r2, [r4, r3]
	adds r2, r5, r2
	lsls r2, r2, #1
	ldrh r5, [r0, r2]
	cmp r1, #8
	bls _022573F6
	b _02257504
_022573F6:
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02257402: @ jump table
	.2byte _02257414 - _02257402 - 2 @ case 0
	.2byte _02257414 - _02257402 - 2 @ case 1
	.2byte _02257414 - _02257402 - 2 @ case 2
	.2byte _02257414 - _02257402 - 2 @ case 3
	.2byte _02257414 - _02257402 - 2 @ case 4
	.2byte _02257414 - _02257402 - 2 @ case 5
	.2byte _02257504 - _02257402 - 2 @ case 6
	.2byte _02257504 - _02257402 - 2 @ case 7
	.2byte _022574EA - _02257402 - 2 @ case 8
_02257414:
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #0
	bl FUN_0201D978
	movs r2, #0x29
	lsls r2, r2, #4
	adds r0, r2, #0
	subs r0, #0x1f
	ldrb r0, [r4, r0]
	ldr r1, [r4, r2]
	adds r1, r1, r0
	adds r0, r2, #0
	subs r0, #0x20
	ldrb r0, [r4, r0]
	cmp r1, r0
	bge _022574D4
	adds r0, r2, #0
	subs r0, #0xd
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _0225744C
	adds r0, r1, #0
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02257460
_0225744C:
	movs r0, #0x82
	movs r1, #0xb
	bl FUN_02026354
	adds r1, r5, #0
	movs r2, #0xb
	adds r6, r0, #0
	bl FUN_02077D64
	b _022574AA
_02257460:
	cmp r1, #1
	bne _02257484
	movs r0, #0
	movs r1, #0x1b
	adds r2, #0x51
	movs r3, #0xb
	bl FUN_0200BAF8
	adds r1, r5, #0
	adds r7, r0, #0
	adds r1, #0x8a
	bl FUN_0200BBA0
	adds r6, r0, #0
	adds r0, r7, #0
	bl FUN_0200BB44
	b _022574AA
_02257484:
	movs r0, #0
	movs r1, #0x1b
	subs r2, #0xde
	movs r3, #0xb
	bl FUN_0200BAF8
	adds r7, r0, #0
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	bl FUN_020910B8
	adds r1, r0, #0
	adds r0, r7, #0
	bl FUN_0200BBA0
	adds r6, r0, #0
	adds r0, r7, #0
	bl FUN_0200BB44
_022574AA:
	movs r1, #0
	str r1, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02257508 @ =0x000F0E00
	adds r2, r6, #0
	str r0, [sp, #8]
	adds r0, r4, #0
	adds r0, #0x18
	adds r3, r1, #0
	str r1, [sp, #0xc]
	bl FUN_020200FC
	adds r0, r6, #0
	bl FUN_02026380
	adds r0, r4, #0
	adds r1, r5, #0
	bl FUN_022585A4
	b _022574DE
_022574D4:
	subs r2, #0x8c
	ldr r0, [r4, r2]
	movs r1, #0
	bl FUN_02024830
_022574DE:
	adds r4, #0x18
	adds r0, r4, #0
	bl FUN_0201D5C8
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_022574EA:
	adds r0, r4, #0
	adds r0, #0x18
	movs r1, #0
	bl FUN_0201D978
	ldr r1, _0225750C @ =0x0000FFFF
	adds r0, r4, #0
	bl FUN_022585A4
	adds r4, #0x18
	adds r0, r4, #0
	bl FUN_0201D5C8
_02257504:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02257508: .4byte 0x000F0E00
_0225750C: .4byte 0x0000FFFF
	thumb_func_end FUN_022573D4

	thumb_func_start FUN_02257510
FUN_02257510: @ 0x02257510
	push {r4, r5, r6, lr}
	ldr r1, _02257604 @ =0x021D110C
	movs r2, #0x40
	ldr r1, [r1, #0x48]
	adds r5, r0, #0
	movs r4, #0
	tst r2, r1
	beq _02257538
	movs r0, #0x29
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	lsls r2, r1, #2
	ldr r1, _02257608 @ =0x0225947A
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	ldr r0, _0225760C @ =0x000005DC
	bl FUN_0200604C
	adds r4, r4, #1
	b _022575B0
_02257538:
	movs r2, #0x80
	tst r2, r1
	beq _02257556
	movs r0, #0x29
	lsls r0, r0, #4
	ldr r1, [r5, r0]
	lsls r2, r1, #2
	ldr r1, _02257610 @ =0x0225947B
	ldrb r1, [r1, r2]
	str r1, [r5, r0]
	ldr r0, _0225760C @ =0x000005DC
	bl FUN_0200604C
	adds r4, r4, #1
	b _022575B0
_02257556:
	movs r2, #0x20
	tst r2, r1
	beq _02257584
	movs r2, #0x29
	lsls r2, r2, #4
	ldr r1, [r5, r2]
	ldr r3, _02257614 @ =0x0225947C
	lsls r6, r1, #2
	ldrb r3, [r3, r6]
	cmp r3, #6
	bne _02257574
	movs r1, #6
	bl FUN_0225761C
	pop {r4, r5, r6, pc}
_02257574:
	cmp r1, #8
	beq _022575B0
	ldr r0, _0225760C @ =0x000005DC
	str r3, [r5, r2]
	bl FUN_0200604C
	adds r4, r4, #1
	b _022575B0
_02257584:
	movs r2, #0x10
	tst r1, r2
	beq _022575B0
	movs r2, #0x29
	lsls r2, r2, #4
	ldr r1, [r5, r2]
	ldr r3, _02257618 @ =0x0225947D
	lsls r6, r1, #2
	ldrb r3, [r3, r6]
	cmp r3, #7
	bne _022575A2
	movs r1, #7
	bl FUN_0225761C
	pop {r4, r5, r6, pc}
_022575A2:
	cmp r1, #8
	beq _022575B0
	ldr r0, _0225760C @ =0x000005DC
	str r3, [r5, r2]
	bl FUN_0200604C
	adds r4, r4, #1
_022575B0:
	cmp r4, #0
	beq _022575CE
	movs r1, #0x29
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, #0
	movs r2, #0
	bl FUN_02257378
	movs r1, #0x29
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl FUN_022573D4
_022575CE:
	ldr r0, _02257604 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #2
	tst r0, r1
	beq _022575EC
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	adds r0, r5, #0
	movs r1, #0xd
	movs r2, #0x10
	bl FUN_022586CC
	pop {r4, r5, r6, pc}
_022575EC:
	movs r0, #1
	tst r0, r1
	beq _02257600
	movs r1, #0x29
	lsls r1, r1, #4
	ldr r1, [r5, r1]
	adds r0, r5, #0
	bl FUN_0225761C
	pop {r4, r5, r6, pc}
_02257600:
	movs r0, #3
	pop {r4, r5, r6, pc}
	.align 2, 0
_02257604: .4byte 0x021D110C
_02257608: .4byte 0x0225947A
_0225760C: .4byte 0x000005DC
_02257610: .4byte 0x0225947B
_02257614: .4byte 0x0225947C
_02257618: .4byte 0x0225947D
	thumb_func_end FUN_02257510

	thumb_func_start FUN_0225761C
FUN_0225761C: @ 0x0225761C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	cmp r1, #8
	bhi _022576EA
	adds r2, r1, r1
	add r2, pc
	ldrh r2, [r2, #6]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	add pc, r2
_02257630: @ jump table
	.2byte _02257642 - _02257630 - 2 @ case 0
	.2byte _02257642 - _02257630 - 2 @ case 1
	.2byte _02257642 - _02257630 - 2 @ case 2
	.2byte _02257642 - _02257630 - 2 @ case 3
	.2byte _02257642 - _02257630 - 2 @ case 4
	.2byte _02257642 - _02257630 - 2 @ case 5
	.2byte _02257682 - _02257630 - 2 @ case 6
	.2byte _0225769C - _02257630 - 2 @ case 7
	.2byte _022576BC - _02257630 - 2 @ case 8
_02257642:
	ldr r3, _022576F0 @ =0x00000271
	ldrb r2, [r4, r3]
	adds r5, r1, r2
	subs r2, r3, #1
	ldrb r2, [r4, r2]
	cmp r5, r2
	bhs _022576EA
	adds r2, r3, #0
	adds r2, #0x1f
	str r1, [r4, r2]
	adds r3, #0x1f
	ldr r1, [r4, r3]
	movs r2, #0
	bl FUN_02257378
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0x13
	bl FUN_020248F0
	ldr r0, _022576F4 @ =0x000005DC
	bl FUN_0200604C
	movs r1, #0x29
	lsls r1, r1, #4
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl FUN_022573D4
	movs r0, #6
	pop {r3, r4, r5, pc}
_02257682:
	ldr r0, _022576F0 @ =0x00000271
	ldrb r0, [r4, r0]
	cmp r0, #0
	beq _022576EA
	ldr r0, _022576F4 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xb
	movs r2, #0x13
	bl FUN_022586CC
	pop {r3, r4, r5, pc}
_0225769C:
	ldr r0, _022576F0 @ =0x00000271
	ldrb r1, [r4, r0]
	subs r0, r0, #1
	ldrb r0, [r4, r0]
	adds r1, r1, #6
	cmp r1, r0
	bge _022576EA
	ldr r0, _022576F4 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #0x14
	bl FUN_022586CC
	pop {r3, r4, r5, pc}
_022576BC:
	movs r2, #0
	bl FUN_02257378
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #7
	bl FUN_020248F0
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #8
	bl FUN_022573D4
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0x10
	bl FUN_022586CC
	pop {r3, r4, r5, pc}
_022576EA:
	movs r0, #3
	pop {r3, r4, r5, pc}
	nop
_022576F0: .4byte 0x00000271
_022576F4: .4byte 0x000005DC
	thumb_func_end FUN_0225761C

	thumb_func_start FUN_022576F8
FUN_022576F8: @ 0x022576F8
	push {r4, lr}
	ldr r2, _02257724 @ =0x00000271
	adds r4, r0, #0
	ldrb r1, [r4, r2]
	subs r1, r1, #6
	strb r1, [r4, r2]
	ldrb r1, [r4, r2]
	subs r2, r2, #1
	ldrb r2, [r4, r2]
	bl FUN_02257758
	movs r1, #0xa6
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #8
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl FUN_022573D4
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_02257724: .4byte 0x00000271
	thumb_func_end FUN_022576F8

	thumb_func_start FUN_02257728
FUN_02257728: @ 0x02257728
	push {r4, lr}
	ldr r2, _02257754 @ =0x00000271
	adds r4, r0, #0
	ldrb r1, [r4, r2]
	adds r1, r1, #6
	strb r1, [r4, r2]
	ldrb r1, [r4, r2]
	subs r2, r2, #1
	ldrb r2, [r4, r2]
	bl FUN_02257758
	movs r1, #0xa6
	movs r0, #1
	lsls r1, r1, #2
	str r0, [r4, r1]
	subs r1, #8
	ldr r1, [r4, r1]
	adds r0, r4, #0
	bl FUN_022573D4
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
_02257754: .4byte 0x00000271
	thumb_func_end FUN_02257728

	thumb_func_start FUN_02257758
FUN_02257758: @ 0x02257758
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	movs r4, #0
	str r0, [sp]
	adds r5, r0, #0
	lsls r0, r1, #1
	str r4, [sp, #8]
	subs r7, r2, r1
	str r0, [sp, #4]
_0225776A:
	cmp r7, #6
	ble _02257772
	movs r0, #6
	b _0225777C
_02257772:
	cmp r7, #0
	bge _0225777A
	movs r0, #0
	b _0225777C
_0225777A:
	adds r0, r7, #0
_0225777C:
	cmp r4, r0
	bge _022577A8
	ldr r0, [sp]
	movs r3, #0x9a
	adds r6, r0, #0
	lsls r3, r3, #2
	ldr r6, [r6, r3]
	ldr r3, [sp, #4]
	adds r1, r4, #3
	adds r6, r3, r6
	ldr r3, [sp, #8]
	adds r2, r4, #2
	ldrh r3, [r3, r6]
	bl FUN_02258648
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #1
	bl FUN_02024830
	b _022577B4
_022577A8:
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
_022577B4:
	ldr r0, [sp, #8]
	adds r4, r4, #1
	adds r0, r0, #2
	adds r5, r5, #4
	str r0, [sp, #8]
	cmp r4, #6
	blt _0225776A
	ldr r0, [sp]
	movs r1, #0
	bl FUN_022582C0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end FUN_02257758

	thumb_func_start FUN_022577D0
FUN_022577D0: @ 0x022577D0
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02257184
	ldr r0, [r4]
	movs r1, #1
	movs r2, #0
	bl FUN_0201CB28
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x11
	pop {r4, pc}
	.align 2, 0
	thumb_func_end FUN_022577D0

	thumb_func_start FUN_022577F4
FUN_022577F4: @ 0x022577F4
	push {r3, lr}
	subs r1, r1, #3
	cmp r1, #1
	bhi _02257808
	movs r1, #0x95
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_02031A6C
	pop {r3, pc}
_02257808:
	movs r1, #0x92
	lsls r1, r1, #2
	ldr r0, [r0, r1]
	bl FUN_02029024
	pop {r3, pc}
	thumb_func_end FUN_022577F4

	thumb_func_start FUN_02257814
FUN_02257814: @ 0x02257814
	push {r3, r4, r5, lr}
	adds r4, r1, #0
	ldr r1, _02257870 @ =0x00000283
	adds r5, r0, #0
	ldrb r0, [r5, r1]
	cmp r0, #3
	bne _02257840
	adds r0, r1, #0
	adds r2, r1, #0
	subs r1, #0x12
	adds r2, #0xd
	subs r0, #0x2f
	ldrb r1, [r5, r1]
	ldr r2, [r5, r2]
	ldr r0, [r5, r0]
	adds r1, r2, r1
	bl FUN_02031AB8
	cmp r0, #0
	beq _0225785E
	movs r0, #2
	pop {r3, r4, r5, pc}
_02257840:
	cmp r0, #4
	bne _0225785E
	adds r2, r1, #1
	adds r0, r1, #0
	subs r0, #0x2f
	ldrh r2, [r5, r2]
	subs r1, #0x8a
	ldr r0, [r5, r0]
	subs r1, r2, r1
	bl FUN_02031A78
	cmp r0, #0
	beq _0225785E
	movs r0, #3
	pop {r3, r4, r5, pc}
_0225785E:
	movs r0, #0xa3
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	cmp r4, r0
	bhs _0225786C
	movs r0, #1
	pop {r3, r4, r5, pc}
_0225786C:
	movs r0, #0
	pop {r3, r4, r5, pc}
	.align 2, 0
_02257870: .4byte 0x00000283
	thumb_func_end FUN_02257814

	thumb_func_start FUN_02257874
FUN_02257874: @ 0x02257874
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	adds r4, r1, #0
	bl FUN_020248B8
	movs r1, #0x91
	lsls r1, r1, #2
	strh r0, [r5, r1]
	subs r1, #0x48
	ldr r0, [r5, r1]
	bl FUN_020248B8
	ldr r1, _0225793C @ =0x00000246
	strh r0, [r5, r1]
	subs r1, #0x4e
	ldr r0, [r5, r1]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r5, #0
	movs r1, #1
	bl FUN_022586BC
	movs r1, #0xa1
	lsls r1, r1, #2
	strh r4, [r5, r1]
	movs r2, #1
	adds r0, r1, #2
	strh r2, [r5, r0]
	ldrh r1, [r5, r1]
	adds r0, r5, #0
	bl FUN_02258120
	movs r1, #0xa3
	lsls r1, r1, #2
	str r0, [r5, r1]
	subs r1, #9
	ldrb r1, [r5, r1]
	adds r0, r5, #0
	bl FUN_022577F4
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl FUN_02257814
	cmp r0, #0
	beq _022578F2
	movs r0, #0xa6
	movs r1, #0xa
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r0, #0xe
	pop {r3, r4, r5, pc}
_022578F2:
	movs r1, #0xa3
	lsls r1, r1, #2
	ldr r1, [r5, r1]
	adds r0, r4, #0
	blx FUN_020F2BA4
	movs r1, #0xa2
	lsls r1, r1, #2
	strh r0, [r5, r1]
	ldrh r0, [r5, r1]
	cmp r0, #0x63
	bls _0225790E
	movs r0, #0x63
	strh r0, [r5, r1]
_0225790E:
	ldr r0, _02257940 @ =0x00000283
	ldrb r0, [r5, r0]
	cmp r0, #1
	beq _02257920
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02257928
_02257920:
	adds r0, r5, #0
	bl FUN_02257CA0
	pop {r3, r4, r5, pc}
_02257928:
	adds r0, r5, #0
	movs r1, #1
	bl FUN_022582C0
	movs r0, #0xa6
	movs r1, #2
	lsls r0, r0, #2
	str r1, [r5, r0]
	movs r0, #5
	pop {r3, r4, r5, pc}
	.align 2, 0
_0225793C: .4byte 0x00000246
_02257940: .4byte 0x00000283
	thumb_func_end FUN_02257874

	thumb_func_start FUN_02257944
FUN_02257944: @ 0x02257944
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	lsls r0, r0, #6
	ldrb r0, [r4, r0]
	bl FUN_0205B624
	cmp r0, #0
	bne _0225795A
	movs r0, #5
	pop {r4, pc}
_0225795A:
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #7
	pop {r4, pc}
	.align 2, 0
	thumb_func_end FUN_02257944

	thumb_func_start FUN_02257978
FUN_02257978: @ 0x02257978
	push {r4, lr}
	ldr r3, _022579D8 @ =0x00000283
	adds r2, r0, #0
	ldrb r4, [r2, r3]
	cmp r4, #0
	beq _02257994
	cmp r4, #1
	beq _02257994
	adds r0, r4, #0
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _022579C0
_02257994:
	ldr r3, _022579DC @ =0x000001E5
	cmp r1, r3
	blt _022579AE
	adds r0, r3, #6
	cmp r1, r0
	bgt _022579AE
	adds r0, r3, #0
	adds r0, #0x73
	ldr r0, [r2, r0]
	subs r1, r1, r3
	bl FUN_02031BA4
	pop {r4, pc}
_022579AE:
	movs r1, #0x93
	lsls r1, r1, #2
	ldr r0, [r2, r1]
	adds r1, #0x38
	ldrh r1, [r2, r1]
	movs r2, #0xb
	bl FUN_02078550
	pop {r4, pc}
_022579C0:
	cmp r4, #2
	bne _022579D4
	adds r0, r3, #0
	adds r1, r3, #1
	subs r0, #0x37
	ldrh r1, [r2, r1]
	ldr r0, [r2, r0]
	bl FUN_0202CD94
	pop {r4, pc}
_022579D4:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_022579D8: .4byte 0x00000283
_022579DC: .4byte 0x000001E5
	thumb_func_end FUN_02257978

	thumb_func_start FUN_022579E0
FUN_022579E0: @ 0x022579E0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0xf
	bl FUN_0201D978
	movs r0, #0xa6
	movs r1, #7
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, #0x58
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x8b
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x23
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	adds r0, r4, #0
	bl FUN_02257CA0
	pop {r4, pc}
	thumb_func_end FUN_022579E0

	thumb_func_start FUN_02257A70
FUN_02257A70: @ 0x02257A70
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r4, #0
	adds r0, #0x38
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_02258560
	movs r1, #0x7e
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x4c
	ldrh r1, [r4, r1]
	bl FUN_02024830
	movs r1, #0x7f
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x4a
	ldrh r1, [r4, r1]
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #0
	bl FUN_022586BC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_022582C0
	movs r0, #0xa6
	movs r1, #4
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, #0x6c
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	movs r0, #3
	pop {r4, pc}
	.align 2, 0
	thumb_func_end FUN_02257A70

	thumb_func_start FUN_02257ADC
FUN_02257ADC: @ 0x02257ADC
	push {r4, lr}
	ldr r1, _02257B3C @ =0x00000286
	adds r4, r0, #0
	adds r0, r4, r1
	adds r1, r1, #2
	ldrh r1, [r4, r1]
	bl FUN_020881C0
	cmp r0, #0
	beq _02257B02
	ldr r0, _02257B40 @ =0x00000637
	bl FUN_0200604C
	movs r0, #0xa6
	movs r1, #6
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #7
	pop {r4, pc}
_02257B02:
	ldr r0, _02257B44 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #1
	tst r0, r1
	beq _02257B1E
	ldr r0, _02257B48 @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #8
	bl FUN_022586CC
	pop {r4, pc}
_02257B1E:
	movs r0, #2
	tst r0, r1
	beq _02257B38
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #9
	bl FUN_022586CC
	pop {r4, pc}
_02257B38:
	movs r0, #7
	pop {r4, pc}
	.align 2, 0
_02257B3C: .4byte 0x00000286
_02257B40: .4byte 0x00000637
_02257B44: .4byte 0x021D110C
_02257B48: .4byte 0x000005DC
	thumb_func_end FUN_02257ADC

	thumb_func_start FUN_02257B4C
FUN_02257B4C: @ 0x02257B4C
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #5
	bhi _02257B76
	adds r0, r1, r1
	add r0, pc
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add pc, r0
_02257B60: @ jump table
	.2byte _02257B6C - _02257B60 - 2 @ case 0
	.2byte _02257BAC - _02257B60 - 2 @ case 1
	.2byte _02257BEA - _02257B60 - 2 @ case 2
	.2byte _02257C2A - _02257B60 - 2 @ case 3
	.2byte _02257C6A - _02257B60 - 2 @ case 4
	.2byte _02257C7C - _02257B60 - 2 @ case 5
_02257B6C:
	movs r0, #0xa2
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #0xa
	bhs _02257B78
_02257B76:
	b _02257C90
_02257B78:
	subs r0, r0, #2
	ldrsh r0, [r4, r0]
	movs r2, #0xa
	bl FUN_022587E8
	ldr r1, _02257C94 @ =0x00000286
	strh r0, [r4, r1]
	subs r1, #0x56
	ldr r0, [r4, r1]
	movs r1, #0
	bl FUN_020249D4
	movs r0, #0x23
	lsls r0, r0, #4
	ldr r0, [r4, r0]
	movs r1, #0xd
	bl FUN_020248F0
	ldr r0, _02257C98 @ =0x00000637
	bl FUN_0200604C
	movs r0, #0xa6
	movs r1, #6
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _02257C90
_02257BAC:
	movs r0, #0xa2
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #1
	beq _02257C90
	subs r0, r0, #2
	ldrsh r0, [r4, r0]
	movs r2, #1
	bl FUN_022587E8
	ldr r1, _02257C94 @ =0x00000286
	strh r0, [r4, r1]
	subs r1, #0x52
	ldr r0, [r4, r1]
	movs r1, #0
	bl FUN_020249D4
	movs r0, #0x8d
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xd
	bl FUN_020248F0
	ldr r0, _02257C98 @ =0x00000637
	bl FUN_0200604C
	movs r0, #0xa6
	movs r1, #6
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _02257C90
_02257BEA:
	movs r0, #0xa2
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #0xa
	blo _02257C90
	subs r0, r0, #2
	ldrsh r0, [r4, r0]
	movs r2, #9
	mvns r2, r2
	bl FUN_022587E8
	ldr r1, _02257C94 @ =0x00000286
	strh r0, [r4, r1]
	subs r1, #0x4e
	ldr r0, [r4, r1]
	movs r1, #0
	bl FUN_020249D4
	movs r0, #0x8e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xf
	bl FUN_020248F0
	ldr r0, _02257C98 @ =0x00000637
	bl FUN_0200604C
	movs r0, #0xa6
	movs r1, #6
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _02257C90
_02257C2A:
	movs r0, #0xa2
	lsls r0, r0, #2
	ldrh r1, [r4, r0]
	cmp r1, #1
	beq _02257C90
	subs r0, r0, #2
	ldrsh r0, [r4, r0]
	movs r2, #0
	mvns r2, r2
	bl FUN_022587E8
	ldr r1, _02257C94 @ =0x00000286
	strh r0, [r4, r1]
	subs r1, #0x4a
	ldr r0, [r4, r1]
	movs r1, #0
	bl FUN_020249D4
	movs r0, #0x8f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xf
	bl FUN_020248F0
	ldr r0, _02257C98 @ =0x00000637
	bl FUN_0200604C
	movs r0, #0xa6
	movs r1, #6
	lsls r0, r0, #2
	str r1, [r4, r0]
	b _02257C90
_02257C6A:
	ldr r0, _02257C9C @ =0x000005DC
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0x12
	movs r2, #8
	bl FUN_022586CC
	pop {r4, pc}
_02257C7C:
	movs r0, #0x25
	lsls r0, r0, #6
	bl FUN_0200604C
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #9
	bl FUN_022586CC
	pop {r4, pc}
_02257C90:
	movs r0, #7
	pop {r4, pc}
	.align 2, 0
_02257C94: .4byte 0x00000286
_02257C98: .4byte 0x00000637
_02257C9C: .4byte 0x000005DC
	thumb_func_end FUN_02257B4C

	thumb_func_start FUN_02257CA0
FUN_02257CA0: @ 0x02257CA0
	push {r4, lr}
	ldr r2, _02257D64 @ =0x00000283
	adds r4, r0, #0
	ldrb r0, [r4, r2]
	cmp r0, #0
	bne _02257CC2
	adds r0, r2, #0
	adds r1, r2, #1
	adds r2, r2, #3
	subs r0, #0x37
	ldrh r1, [r4, r1]
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	movs r3, #0xb
	bl FUN_02078384
	b _02257D4C
_02257CC2:
	cmp r0, #1
	bne _02257CCA
	movs r0, #0
	b _02257D4C
_02257CCA:
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02257D3A
	adds r0, r2, #1
	ldrh r1, [r4, r0]
	adds r0, r2, #0
	subs r0, #0x9e
	cmp r1, r0
	blo _02257D06
	adds r0, r2, #0
	subs r0, #0x98
	cmp r1, r0
	bhi _02257D06
	adds r0, r2, #0
	subs r0, #0x2b
	subs r2, #0x9e
	ldr r0, [r4, r0]
	subs r1, r1, r2
	bl FUN_02031BA4
	cmp r0, #0x63
	bne _02257D26
	movs r0, #0xa6
	movs r1, #0xc
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #0xe
	pop {r4, pc}
_02257D06:
	movs r2, #0x93
	lsls r2, r2, #2
	ldr r0, [r4, r2]
	adds r2, #0x3a
	ldrh r2, [r4, r2]
	movs r3, #0xb
	bl FUN_02078384
	cmp r0, #0
	bne _02257D26
	movs r0, #0xa6
	movs r1, #0xc
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #0xe
	pop {r4, pc}
_02257D26:
	adds r0, r4, #0
	movs r1, #2
	bl FUN_022582C0
	movs r0, #0xa6
	movs r1, #3
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #0xa
	pop {r4, pc}
_02257D3A:
	adds r0, r2, #0
	adds r1, r2, #1
	adds r2, r2, #3
	subs r0, #0x37
	ldrh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, r0]
	bl FUN_0202CD3C
_02257D4C:
	cmp r0, #0
	bne _02257D60
	ldr r0, _02257D68 @ =0x00000286
	movs r1, #0
	strh r1, [r4, r0]
	movs r1, #0xb
	adds r0, #0x12
	str r1, [r4, r0]
	movs r0, #0xd
	pop {r4, pc}
_02257D60:
	movs r0, #0xa
	pop {r4, pc}
	.align 2, 0
_02257D64: .4byte 0x00000283
_02257D68: .4byte 0x00000286
	thumb_func_end FUN_02257CA0

	thumb_func_start FUN_02257D6C
FUN_02257D6C: @ 0x02257D6C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	lsls r0, r0, #6
	ldrb r0, [r4, r0]
	bl FUN_0205B624
	cmp r0, #0
	bne _02257D82
	movs r0, #0xa
	pop {r4, pc}
_02257D82:
	movs r0, #0xa6
	movs r1, #8
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #0xb
	pop {r4, pc}
	.align 2, 0
	thumb_func_end FUN_02257D6C

	thumb_func_start FUN_02257D90
FUN_02257D90: @ 0x02257D90
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	beq _02257D9E
	cmp r1, #1
	beq _02257DAA
	b _02257DF2
_02257D9E:
	movs r0, #0xa6
	movs r1, #9
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #0xc
	pop {r4, pc}
_02257DAA:
	adds r0, #0x58
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_02258560
	movs r1, #0x7e
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x4c
	ldrh r1, [r4, r1]
	bl FUN_02024830
	movs r1, #0x7f
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x4a
	ldrh r1, [r4, r1]
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #0
	bl FUN_022586BC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_022582C0
	movs r0, #0xa6
	movs r1, #4
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
_02257DF2:
	movs r0, #0xb
	pop {r4, pc}
	.align 2, 0
	thumb_func_end FUN_02257D90

	thumb_func_start FUN_02257DF8
FUN_02257DF8: @ 0x02257DF8
	push {r4, lr}
	ldr r3, _02257E30 @ =0x00000283
	adds r2, r0, #0
	ldrb r0, [r2, r3]
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _02257E18
	subs r3, #0x2f
	lsls r1, r1, #0x10
	ldr r0, [r2, r3]
	lsrs r1, r1, #0x10
	bl FUN_02031A54
	pop {r4, pc}
_02257E18:
	adds r1, r3, #0
	adds r1, #9
	ldr r4, [r2, r1]
	adds r1, r3, #3
	adds r0, r3, #0
	ldrsh r1, [r2, r1]
	subs r0, #0x3b
	ldr r0, [r2, r0]
	muls r1, r4, r1
	bl FUN_02029068
	pop {r4, pc}
	.align 2, 0
_02257E30: .4byte 0x00000283
	thumb_func_end FUN_02257DF8

	thumb_func_start FUN_02257E34
FUN_02257E34: @ 0x02257E34
	push {r3, lr}
	ldr r2, _02257E68 @ =0x000001E5
	adds r3, r0, #0
	cmp r1, r2
	blt _02257E54
	adds r0, r2, #6
	cmp r1, r0
	bgt _02257E54
	adds r0, r2, #0
	adds r0, #0x73
	ldr r0, [r3, r0]
	subs r1, r1, r2
	movs r2, #1
	bl FUN_02031B68
	pop {r3, pc}
_02257E54:
	movs r1, #0x93
	lsls r1, r1, #2
	ldr r0, [r3, r1]
	adds r1, #0x38
	ldrh r1, [r3, r1]
	movs r2, #1
	movs r3, #0xb
	bl FUN_02078398
	pop {r3, pc}
	.align 2, 0
_02257E68: .4byte 0x000001E5
	thumb_func_end FUN_02257E34

	thumb_func_start FUN_02257E6C
FUN_02257E6C: @ 0x02257E6C
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xa
	lsls r0, r0, #6
	ldrb r0, [r4, r0]
	bl FUN_0205B624
	cmp r0, #0
	bne _02257E82
	movs r0, #0xc
	pop {r3, r4, r5, pc}
_02257E82:
	ldr r2, _02257F20 @ =0x00000283
	ldrb r0, [r4, r2]
	cmp r0, #0
	bne _02257EA0
	adds r0, r2, #0
	adds r1, r2, #1
	adds r2, r2, #3
	subs r0, #0x37
	ldrh r1, [r4, r1]
	ldrh r2, [r4, r2]
	ldr r0, [r4, r0]
	movs r3, #0xb
	bl FUN_02078398
	b _02257EF0
_02257EA0:
	cmp r0, #3
	bne _02257EC6
	adds r1, r2, #1
	ldrh r1, [r4, r1]
	adds r0, r4, #0
	bl FUN_02257E34
	movs r2, #0x95
	lsls r2, r2, #2
	adds r1, r2, #0
	ldr r0, [r4, r2]
	adds r1, #0x3c
	adds r2, #0x1d
	ldr r3, [r4, r1]
	ldrb r1, [r4, r2]
	adds r1, r3, r1
	bl FUN_02031ACC
	b _02257EF0
_02257EC6:
	cmp r0, #4
	bne _02257EDE
	adds r1, r2, #1
	adds r0, r2, #0
	subs r0, #0x2f
	ldrh r1, [r4, r1]
	subs r2, #0x8a
	ldr r0, [r4, r0]
	subs r1, r1, r2
	bl FUN_02031A98
	b _02257EF0
_02257EDE:
	adds r0, r2, #0
	adds r1, r2, #1
	adds r2, r2, #3
	subs r0, #0x37
	ldrh r1, [r4, r1]
	ldrsh r2, [r4, r2]
	ldr r0, [r4, r0]
	bl FUN_0202CCAC
_02257EF0:
	movs r1, #0xa3
	lsls r1, r1, #2
	ldr r2, [r4, r1]
	subs r1, r1, #6
	ldrsh r1, [r4, r1]
	adds r0, r4, #0
	muls r1, r2, r1
	bl FUN_02257DF8
	movs r3, #0x97
	lsls r3, r3, #2
	adds r2, r3, #0
	ldr r0, [r4, r3]
	adds r2, #0x30
	adds r3, #0x2a
	ldr r5, [r4, r2]
	ldrsh r2, [r4, r3]
	movs r1, #0x24
	muls r2, r5, r2
	bl FUN_0202D144
	movs r0, #0xd
	pop {r3, r4, r5, pc}
	nop
_02257F20: .4byte 0x00000283
	thumb_func_end FUN_02257E6C

	thumb_func_start FUN_02257F24
FUN_02257F24: @ 0x02257F24
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	lsls r0, r0, #6
	ldrb r0, [r4, r0]
	bl FUN_0205B624
	cmp r0, #0
	bne _02257F3A
	movs r0, #0xd
	pop {r4, pc}
_02257F3A:
	ldr r0, _02257FEC @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _02257F4C
	ldr r0, _02257FF0 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _02257FE6
_02257F4C:
	movs r0, #0x99
	lsls r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _02257F5E
	subs r0, r0, #4
	ldr r0, [r4, r0]
	bl FUN_02066D80
_02257F5E:
	ldr r1, _02257FF4 @ =0x00000283
	ldrb r0, [r4, r1]
	cmp r0, #0
	bne _02257F9E
	adds r0, r1, #1
	ldrh r0, [r4, r0]
	cmp r0, #4
	bne _02257F9E
	adds r0, r1, #3
	ldrsh r0, [r4, r0]
	cmp r0, #0xa
	blt _02257F9E
	subs r1, #0x37
	ldr r0, [r4, r1]
	movs r1, #0xc
	movs r2, #1
	movs r3, #0xb
	bl FUN_02078398
	cmp r0, #1
	bne _02257F9E
	movs r0, #0xa6
	movs r1, #0xd
	lsls r0, r0, #2
	str r1, [r4, r0]
	subs r0, #0x3c
	ldr r0, [r4, r0]
	movs r1, #0x33
	bl FUN_0202D0FC
	movs r0, #0xf
	pop {r4, pc}
_02257F9E:
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_02258560
	movs r1, #0x7e
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x4c
	ldrh r1, [r4, r1]
	bl FUN_02024830
	movs r1, #0x7f
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x4a
	ldrh r1, [r4, r1]
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #0
	bl FUN_022586BC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_022582C0
	movs r1, #0xa6
	movs r0, #4
	lsls r1, r1, #2
	str r0, [r4, r1]
	pop {r4, pc}
_02257FE6:
	movs r0, #0xd
	pop {r4, pc}
	nop
_02257FEC: .4byte 0x021D110C
_02257FF0: .4byte 0x021D114C
_02257FF4: .4byte 0x00000283
	thumb_func_end FUN_02257F24

	thumb_func_start FUN_02257FF8
FUN_02257FF8: @ 0x02257FF8
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	lsls r0, r0, #6
	ldrb r0, [r4, r0]
	bl FUN_0205B624
	cmp r0, #0
	bne _0225800E
	movs r0, #0xe
	pop {r4, pc}
_0225800E:
	ldr r0, _02258070 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _02258020
	ldr r0, _02258074 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _0225806A
_02258020:
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_02258560
	movs r1, #0x7e
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x4c
	ldrh r1, [r4, r1]
	bl FUN_02024830
	movs r1, #0x7f
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x4a
	ldrh r1, [r4, r1]
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #0
	bl FUN_022586BC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_022582C0
	movs r0, #0xa6
	movs r1, #5
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #4
	pop {r4, pc}
_0225806A:
	movs r0, #0xe
	pop {r4, pc}
	nop
_02258070: .4byte 0x021D110C
_02258074: .4byte 0x021D114C
	thumb_func_end FUN_02257FF8

	thumb_func_start FUN_02258078
FUN_02258078: @ 0x02258078
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa
	lsls r0, r0, #6
	ldrb r0, [r4, r0]
	bl FUN_0205B624
	cmp r0, #0
	bne _0225808E
	movs r0, #0xf
	pop {r4, pc}
_0225808E:
	ldr r0, _022580F0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	bne _022580A0
	ldr r0, _022580F4 @ =0x021D114C
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _022580EA
_022580A0:
	adds r0, r4, #0
	adds r0, #0x58
	movs r1, #0
	bl FUN_0200E9BC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_02258560
	movs r1, #0x7e
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x4c
	ldrh r1, [r4, r1]
	bl FUN_02024830
	movs r1, #0x7f
	lsls r1, r1, #2
	ldr r0, [r4, r1]
	adds r1, #0x4a
	ldrh r1, [r4, r1]
	bl FUN_02024830
	adds r0, r4, #0
	movs r1, #0
	bl FUN_022586BC
	adds r0, r4, #0
	movs r1, #0
	bl FUN_022582C0
	movs r0, #0xa6
	movs r1, #4
	lsls r0, r0, #2
	str r1, [r4, r0]
	movs r0, #3
	pop {r4, pc}
_022580EA:
	movs r0, #0xf
	pop {r4, pc}
	nop
_022580F0: .4byte 0x021D110C
_022580F4: .4byte 0x021D114C
	thumb_func_end FUN_02258078

	thumb_func_start FUN_022580F8
FUN_022580F8: @ 0x022580F8
	push {r3, r4, r5, lr}
	movs r4, #0
	cmp r2, #0
	ble _02258118
	adds r5, r1, #0
_02258102:
	ldrh r3, [r5]
	cmp r0, r3
	bne _02258110
	lsls r0, r4, #2
	adds r0, r1, r0
	ldrh r0, [r0, #2]
	pop {r3, r4, r5, pc}
_02258110:
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, r2
	blt _02258102
_02258118:
	bl FUN_0202551C
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_022580F8

	thumb_func_start FUN_02258120
FUN_02258120: @ 0x02258120
	push {r3, lr}
	ldr r3, _02258160 @ =0x00000283
	adds r2, r0, #0
	ldrb r0, [r2, r3]
	cmp r0, #0
	bne _02258138
	adds r0, r1, #0
	movs r1, #0
	movs r2, #0xb
	bl FUN_02077D88
	pop {r3, pc}
_02258138:
	cmp r0, #1
	bne _02258140
	movs r0, #0x64
	pop {r3, pc}
_02258140:
	adds r0, #0xfd
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _0225815C
	adds r0, r1, #0
	adds r1, r3, #0
	subs r1, #0x17
	subs r3, #0x13
	ldr r1, [r2, r1]
	ldrb r2, [r2, r3]
	bl FUN_022580F8
	pop {r3, pc}
_0225815C:
	movs r0, #0x64
	pop {r3, pc}
	.align 2, 0
_02258160: .4byte 0x00000283
	thumb_func_end FUN_02258120

	thumb_func_start FUN_02258164
FUN_02258164: @ 0x02258164
	ldr r3, _0225816C @ =FUN_021F6A9C
	ldr r1, [r0, #0x1c]
	movs r2, #0
	bx r3
	.align 2, 0
_0225816C: .4byte FUN_021F6A9C
	thumb_func_end FUN_02258164

	thumb_func_start FUN_02258170
FUN_02258170: @ 0x02258170
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl FUN_021F6B10
	cmp r0, #0
	bne _0225818C
	adds r0, r5, #0
	bl FUN_021F6B00
	cmp r0, #1
	beq _0225818C
	movs r0, #0x12
	pop {r3, r4, r5, pc}
_0225818C:
	ldr r0, _022581B8 @ =0x00000281
	movs r1, #0
	strb r1, [r4, r0]
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	ldr r1, [r5, #0x24]
	bl FUN_02023128
	adds r0, r4, #0
	adds r0, #0x90
	ldr r0, [r0]
	bl FUN_02023120
	ldr r0, [r5, #0x24]
	bl FUN_0202313C
	adds r0, r4, #0
	bl FUN_02258288
	movs r0, #0x1b
	pop {r3, r4, r5, pc}
	.align 2, 0
_022581B8: .4byte 0x00000281
	thumb_func_end FUN_02258170

	thumb_func_start FUN_022581BC
FUN_022581BC: @ 0x022581BC
	push {r3, r4, r5, r6, r7, lr}
	ldr r1, _0225827C @ =0x0225946C
	adds r7, r0, #0
	adds r0, #0x94
	movs r2, #0x13
	movs r3, #0xb
	bl FUN_021E7FDC
	adds r0, r7, #0
	str r0, [sp]
	adds r0, #0x94
	ldr r4, _02258280 @ =0x022594F8
	movs r6, #0
	adds r5, r7, #0
	str r0, [sp]
_022581DA:
	ldr r0, [sp]
	adds r1, r4, #0
	bl FUN_021E81F0
	movs r1, #0x7e
	lsls r1, r1, #2
	str r0, [r5, r1]
	adds r6, r6, #1
	adds r4, #0x28
	adds r5, r5, #4
	cmp r6, #0x13
	blo _022581DA
	adds r0, r1, #0
	adds r0, #0x34
	ldr r0, [r7, r0]
	movs r1, #1
	bl FUN_02024A04
	movs r0, #9
	lsls r0, r0, #6
	ldr r0, [r7, r0]
	movs r1, #1
	bl FUN_02024A04
	movs r0, #0x22
	lsls r0, r0, #4
	ldr r0, [r7, r0]
	movs r1, #1
	bl FUN_0202484C
	movs r0, #2
	lsls r0, r0, #8
	ldr r0, [r7, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r7, r0]
	movs r1, #0
	bl FUN_02024830
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022C60
	movs r0, #0x10
	movs r1, #1
	bl FUN_02022CC8
	adds r0, r7, #0
	movs r1, #0
	bl FUN_022582C0
	movs r1, #0x29
	lsls r1, r1, #4
	ldr r1, [r7, r1]
	adds r0, r7, #0
	movs r2, #0
	bl FUN_02257378
	ldr r2, _02258284 @ =0x00000271
	adds r0, r7, #0
	ldrb r1, [r7, r2]
	subs r2, r2, #1
	ldrb r2, [r7, r2]
	bl FUN_02257758
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_0225827C: .4byte 0x0225946C
_02258280: .4byte 0x022594F8
_02258284: .4byte 0x00000271
	thumb_func_end FUN_022581BC

	thumb_func_start FUN_02258288
FUN_02258288: @ 0x02258288
	push {r3, r4, r5, r6, r7, lr}
	movs r4, #0
	movs r7, #0x7e
	str r0, [sp]
	adds r5, r0, #0
	adds r6, r4, #0
	lsls r7, r7, #2
_02258296:
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	bl FUN_02024758
	str r6, [r5, r7]
	adds r4, r4, #1
	adds r5, r5, #4
	cmp r4, #0x13
	blo _02258296
	ldr r0, [sp]
	adds r0, #0x94
	bl FUN_021E8194
	ldr r0, [sp]
	movs r1, #0
	adds r0, #0x94
	str r0, [sp]
	str r1, [r0]
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end FUN_02258288

	thumb_func_start FUN_022582C0
FUN_022582C0: @ 0x022582C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	adds r5, r0, #0
	cmp r1, #0
	beq _022582DA
	cmp r1, #1
	bne _022582D0
	b _022583F4
_022582D0:
	cmp r1, #2
	bne _022582D6
	b _022584F2
_022582D6:
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_022582DA:
	ldr r4, _02258554 @ =0x022594F8
	movs r7, #0
	adds r6, r5, #0
_022582E0:
	movs r0, #0xa4
	ldrsh r0, [r4, r0]
	lsls r0, r0, #0xc
	str r0, [sp, #0x18]
	movs r0, #0xa6
	ldrsh r0, [r4, r0]
	lsls r1, r0, #0xc
	movs r0, #3
	lsls r0, r0, #0x12
	adds r0, r1, r0
	str r0, [sp, #0x1c]
	movs r0, #0xa8
	ldrsh r0, [r4, r0]
	add r1, sp, #0x18
	lsls r0, r0, #0xc
	str r0, [sp, #0x20]
	movs r0, #0x82
	lsls r0, r0, #2
	ldr r0, [r6, r0]
	bl FUN_020247D4
	adds r7, r7, #1
	adds r4, #0x28
	adds r6, r6, #4
	cmp r7, #6
	blt _022582E0
	movs r7, #0x27
	ldr r4, _02258558 @ =0x02259850
	movs r6, #0
	lsls r7, r7, #4
_0225831C:
	ldrb r1, [r4, #1]
	cmp r1, #4
	bne _02258354
	ldr r0, _0225855C @ =0x00000271
	ldrb r0, [r5, r0]
	adds r1, r0, #6
	ldrb r0, [r5, r7]
	cmp r1, r0
	ldrb r0, [r4]
	bge _02258342
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	b _022583D0
_02258342:
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	b _022583D0
_02258354:
	cmp r1, #3
	bne _02258386
	ldr r0, _0225855C @ =0x00000271
	ldrb r0, [r5, r0]
	cmp r0, #0
	ldrb r0, [r4]
	bne _02258374
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	b _022583D0
_02258374:
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	b _022583D0
_02258386:
	cmp r1, #5
	bne _022583C0
	ldr r0, _0225855C @ =0x00000271
	ldrb r0, [r5, r0]
	adds r1, r0, r6
	movs r0, #0x27
	lsls r0, r0, #4
	ldrb r0, [r5, r0]
	cmp r1, r0
	ldrb r0, [r4]
	bge _022583AE
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	b _022583D0
_022583AE:
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	b _022583D0
_022583C0:
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r2, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	bl FUN_02024830
_022583D0:
	adds r6, r6, #1
	adds r4, r4, #3
	cmp r6, #0xf
	blo _0225831C
	movs r0, #0x8b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_020249D4
	movs r0, #0x8b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #6
	bl FUN_020248F0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_022583F4:
	movs r7, #0x56
	ldr r4, _02258558 @ =0x02259850
	movs r6, #0
	lsls r7, r7, #0xc
_022583FC:
	ldrb r1, [r4, #2]
	cmp r1, #2
	bne _02258452
	movs r0, #0x29
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, r6
	bne _0225843E
	movs r0, #0x43
	lsls r0, r0, #0xe
	str r0, [sp, #0x10]
	movs r0, #0
	str r0, [sp, #0x14]
	ldrb r0, [r4]
	str r7, [sp, #0xc]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0xc
	bl FUN_020247D4
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	b _022584CE
_0225843E:
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	b _022584CE
_02258452:
	ldrb r0, [r4]
	cmp r0, #0xe
	beq _0225845C
	cmp r0, #0x10
	bne _0225848A
_0225845C:
	movs r1, #0xa2
	lsls r1, r1, #2
	ldrh r1, [r5, r1]
	cmp r1, #0xa
	bhs _02258478
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	b _022584CE
_02258478:
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	b _022584CE
_0225848A:
	cmp r0, #0xf
	beq _02258492
	cmp r0, #0x11
	bne _022584C0
_02258492:
	movs r1, #0xa2
	lsls r1, r1, #2
	ldrh r1, [r5, r1]
	cmp r1, #1
	bne _022584AE
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
	b _022584CE
_022584AE:
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	b _022584CE
_022584C0:
	lsls r0, r0, #2
	adds r2, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r2, r0]
	bl FUN_02024830
_022584CE:
	adds r6, r6, #1
	adds r4, r4, #3
	cmp r6, #0xf
	blo _022583FC
	movs r0, #0x8b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0
	bl FUN_020249D4
	movs r0, #0x8b
	lsls r0, r0, #2
	ldr r0, [r5, r0]
	movs r1, #0x1a
	bl FUN_020248F0
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
_022584F2:
	movs r7, #0x56
	ldr r4, _02258558 @ =0x02259850
	movs r6, #0
	lsls r7, r7, #0xc
_022584FA:
	movs r0, #0x29
	lsls r0, r0, #4
	ldr r0, [r5, r0]
	cmp r0, r6
	bne _02258536
	movs r0, #0x43
	lsls r0, r0, #0xe
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldrb r0, [r4]
	str r7, [sp]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	add r1, sp, #0
	bl FUN_020247D4
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #1
	bl FUN_02024830
	b _02258548
_02258536:
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r1, r5, r0
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r1, r0]
	movs r1, #0
	bl FUN_02024830
_02258548:
	adds r6, r6, #1
	adds r4, r4, #3
	cmp r6, #0xf
	blo _022584FA
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_02258554: .4byte 0x022594F8
_02258558: .4byte 0x02259850
_0225855C: .4byte 0x00000271
	thumb_func_end FUN_022582C0

	thumb_func_start FUN_02258560
FUN_02258560: @ 0x02258560
	push {r4, lr}
	adds r4, r0, #0
	cmp r1, #0
	bne _02258586
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xb1
	movs r2, #8
	bl FUN_0200DD88
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xb1
	movs r2, #0x84
	bl FUN_0200DD88
	pop {r4, pc}
_02258586:
	movs r0, #0x7e
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xa2
	movs r2, #0x6c
	bl FUN_0200DD88
	movs r0, #0x7f
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #0xa2
	movs r2, #0x84
	bl FUN_0200DD88
	pop {r4, pc}
	thumb_func_end FUN_02258560

	thumb_func_start FUN_022585A4
FUN_022585A4: @ 0x022585A4
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, _02258644 @ =0x00000283
	adds r6, r1, #0
	ldrb r1, [r4, r0]
	cmp r1, #0
	beq _022585CA
	cmp r1, #3
	beq _022585CA
	cmp r1, #4
	beq _022585CA
	subs r0, #0x7f
	ldr r0, [r4, r0]
	movs r1, #0
	bl FUN_02024830
	add sp, #8
	pop {r4, r5, r6, pc}
_022585CA:
	movs r0, #0x71
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #2
	bl FUN_0200A7BC
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #0x71
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	movs r2, #0x12
	bl FUN_0200A2E4
	adds r0, r5, #0
	bl FUN_0200AE8C
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_0200A7BC
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #2
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	movs r2, #0x12
	bl FUN_0200A350
	adds r0, r5, #0
	bl FUN_0200B084
	movs r0, #0x81
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	movs r1, #1
	bl FUN_02024830
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_02258644: .4byte 0x00000283
	thumb_func_end FUN_022585A4

	thumb_func_start FUN_02258648
FUN_02258648: @ 0x02258648
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	movs r0, #0x71
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r6, r3, #0
	adds r7, r2, #0
	bl FUN_0200A7BC
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #0x71
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	movs r2, #0x12
	bl FUN_0200A2E4
	adds r0, r5, #0
	bl FUN_0200AE8C
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r7, #0
	bl FUN_0200A7BC
	adds r5, r0, #0
	adds r0, r6, #0
	movs r1, #2
	bl FUN_02077C18
	adds r3, r0, #0
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb
	str r0, [sp, #4]
	movs r0, #0x72
	lsls r0, r0, #2
	ldr r0, [r4, r0]
	adds r1, r5, #0
	movs r2, #0x12
	bl FUN_0200A350
	adds r0, r5, #0
	bl FUN_0200B084
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end FUN_02258648

	thumb_func_start FUN_022586BC
FUN_022586BC: @ 0x022586BC
	movs r2, #2
	lsls r2, r2, #8
	ldr r3, _022586C8 @ =FUN_0200DD08
	ldr r0, [r0, r2]
	bx r3
	nop
_022586C8: .4byte FUN_0200DD08
	thumb_func_end FUN_022586BC

	thumb_func_start FUN_022586CC
FUN_022586CC: @ 0x022586CC
	movs r3, #0xa7
	lsls r3, r3, #2
	adds r3, r0, r3
	strb r1, [r3]
	movs r0, #0
	strb r0, [r3, #1]
	strb r0, [r3, #2]
	strb r2, [r3, #3]
	movs r0, #0x15
	bx lr
	thumb_func_end FUN_022586CC

	thumb_func_start FUN_022586E0
FUN_022586E0: @ 0x022586E0
	push {r4, lr}
	movs r1, #0xa7
	lsls r1, r1, #2
	adds r4, r0, r1
	ldrb r2, [r4, #1]
	cmp r2, #0
	beq _022586F8
	cmp r2, #1
	beq _02258710
	cmp r2, #2
	beq _02258738
	b _02258748
_022586F8:
	ldrb r2, [r4]
	subs r1, #0xa4
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r0, [r0, r1]
	movs r1, #7
	bl FUN_0200DD08
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	b _02258748
_02258710:
	ldrb r2, [r4, #2]
	adds r2, r2, #1
	strb r2, [r4, #2]
	ldrb r2, [r4, #2]
	cmp r2, #4
	bne _02258748
	ldrb r2, [r4]
	subs r1, #0xa4
	lsls r2, r2, #2
	adds r0, r0, r2
	ldr r0, [r0, r1]
	movs r1, #6
	bl FUN_0200DD08
	movs r0, #0
	strb r0, [r4, #2]
	ldrb r0, [r4, #1]
	adds r0, r0, #1
	strb r0, [r4, #1]
	b _02258748
_02258738:
	ldrb r0, [r4, #2]
	adds r0, r0, #1
	strb r0, [r4, #2]
	ldrb r0, [r4, #2]
	cmp r0, #2
	bne _02258748
	ldrb r0, [r4, #3]
	pop {r4, pc}
_02258748:
	movs r0, #0x15
	pop {r4, pc}
	thumb_func_end FUN_022586E0

	thumb_func_start FUN_0225874C
FUN_0225874C: @ 0x0225874C
	push {r4, lr}
	movs r0, #0
	adds r4, r1, #0
	bl FUN_021E636C
	ldr r0, _02258760 @ =0x00000272
	movs r1, #0x17
	strb r1, [r4, r0]
	pop {r4, pc}
	nop
_02258760: .4byte 0x00000272
	thumb_func_end FUN_0225874C

	thumb_func_start FUN_02258764
FUN_02258764: @ 0x02258764
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	bl FUN_0200FB5C
	cmp r0, #0
	beq _022587C2
	adds r0, r6, #0
	bl FUN_0205064C
	adds r5, r0, #0
	adds r0, r6, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_0207879C
	ldr r1, _022587C8 @ =0x022597F0
	movs r2, #0xb
	bl FUN_02078644
	str r0, [r4, #4]
	movs r0, #0x43
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	adds r3, r5, #0
	adds r3, #0x94
	ldr r0, [r4, #4]
	ldr r1, [r5, #0xc]
	ldr r3, [r3]
	movs r2, #2
	bl FUN_0207789C
	ldr r1, [r4, #4]
	adds r0, r5, #0
	bl FUN_0203E3D4
	ldr r1, _022587CC @ =0x02092B05
	adds r0, r6, #0
	adds r2, r4, #0
	bl FUN_02050510
	ldr r0, _022587D0 @ =0x00000272
	movs r1, #0x18
	strb r1, [r4, r0]
_022587C2:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_022587C8: .4byte 0x022597F0
_022587CC: .4byte 0x02092B05
_022587D0: .4byte 0x00000272
	thumb_func_end FUN_02258764

	thumb_func_start FUN_022587D4
FUN_022587D4: @ 0x022587D4
	push {r3, lr}
	bl FUN_0200FB5C
	cmp r0, #0
	bne _022587E2
	movs r0, #0x1a
	pop {r3, pc}
_022587E2:
	movs r0, #0x1b
	pop {r3, pc}
	.align 2, 0
	thumb_func_end FUN_022587D4

	thumb_func_start FUN_022587E8
FUN_022587E8: @ 0x022587E8
	cmp r2, #0
	ble _022587FE
	cmp r0, r1
	bne _022587F4
	movs r0, #1
	bx lr
_022587F4:
	adds r0, r0, r2
	cmp r0, r1
	ble _0225880E
	adds r0, r1, #0
	bx lr
_022587FE:
	cmp r0, #1
	bne _02258806
	adds r0, r1, #0
	bx lr
_02258806:
	adds r0, r0, r2
	cmp r0, #0
	bgt _0225880E
	movs r0, #1
_0225880E:
	bx lr
	thumb_func_end FUN_022587E8

	thumb_func_start FUN_02258810
FUN_02258810: @ 0x02258810
	str r0, [r1]
	bx lr
	thumb_func_end FUN_02258810

	thumb_func_start FUN_02258814
FUN_02258814: @ 0x02258814
	ldr r3, _02258820 @ =FUN_0203410C
	adds r2, r0, #0
	ldr r0, _02258824 @ =0x022597FC
	movs r1, #1
	bx r3
	nop
_02258820: .4byte FUN_0203410C
_02258824: .4byte 0x022597FC
	thumb_func_end FUN_02258814

	thumb_func_start FUN_02258828
FUN_02258828: @ 0x02258828
	movs r0, #0xba
	lsls r0, r0, #2
	bx lr
	.align 2, 0
	thumb_func_end FUN_02258828

	thumb_func_start FUN_02258830
FUN_02258830: @ 0x02258830
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #2
	blt _0225883E
	bl FUN_0202551C
_0225883E:
	movs r0, #0xba
	lsls r0, r0, #2
	adds r4, #8
	muls r0, r5, r0
	adds r0, r4, r0
	pop {r3, r4, r5, pc}
	.align 2, 0
	thumb_func_end FUN_02258830

	thumb_func_start FUN_0225884C
FUN_0225884C: @ 0x0225884C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r2, #0
	adds r4, r3, #0
	bl FUN_0203769C
	cmp r5, r0
	beq _02258876
	ldr r0, [r4, #4]
	movs r1, #1
	adds r2, r6, #0
	bl FUN_0202F680
	adds r0, r5, #0
	bl FUN_02034818
	adds r1, r0, #0
	ldr r0, [r4, #4]
	movs r2, #0xb
	bl FUN_0202F7D8
_02258876:
	pop {r4, r5, r6, pc}
	thumb_func_end FUN_0225884C

	thumb_func_start FUN_02258878
FUN_02258878: @ 0x02258878
	push {r4, lr}
	ldr r1, _02258890 @ =0x000005D8
	movs r0, #0xb
	bl FUN_0201AACC
	ldr r2, _02258890 @ =0x000005D8
	movs r1, #0
	adds r4, r0, #0
	blx FUN_020D4994
	adds r0, r4, #0
	pop {r4, pc}
	.align 2, 0
_02258890: .4byte 0x000005D8
	thumb_func_end FUN_02258878

	thumb_func_start FUN_02258894
FUN_02258894: @ 0x02258894
	push {r3, lr}
	bl FUN_02050650
	ldr r1, [r0]
	cmp r1, #0
	bne _022588A8
	bl FUN_0201AB0C
	movs r0, #1
	pop {r3, pc}
_022588A8:
	blx r1
	movs r0, #0
	pop {r3, pc}
	.align 2, 0
	thumb_func_end FUN_02258894

	thumb_func_start FUN_022588B0
FUN_022588B0: @ 0x022588B0
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xd
	bl FUN_02037B38
	cmp r0, #0
	beq _022588D2
	bl FUN_0203769C
	movs r1, #1
	subs r0, r1, r0
	bl FUN_02034818
	movs r0, #0
	adds r1, r4, #0
	bl FUN_02258810
_022588D2:
	pop {r4, pc}
	thumb_func_end FUN_022588B0

	thumb_func_start FUN_022588D4
FUN_022588D4: @ 0x022588D4
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xc
	bl FUN_02037B38
	cmp r0, #0
	beq _0225890A
	movs r0, #1
	bl FUN_02034818
	cmp r0, #0
	beq _0225890A
	ldr r0, [r4, #4]
	movs r1, #0
	bl FUN_0202F630
	adds r1, r0, #0
	movs r0, #0x16
	bl FUN_020376D4
	movs r0, #0xd
	bl FUN_02037AC0
	ldr r0, _0225890C @ =FUN_022588B0
	adds r1, r4, #0
	bl FUN_02258810
_0225890A:
	pop {r4, pc}
	.align 2, 0
_0225890C: .4byte FUN_022588B0
	thumb_func_end FUN_022588D4

	thumb_func_start FUN_02258910
FUN_02258910: @ 0x02258910
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	bl FUN_02258878
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_0202F57C
	str r0, [r4, #4]
	adds r0, r4, #0
	bl FUN_02258814
	movs r0, #0xc
	bl FUN_02037AC0
	ldr r0, _02258944 @ =FUN_022588D4
	adds r1, r4, #0
	bl FUN_02258810
	ldr r0, [r5, #0x10]
	ldr r1, _02258948 @ =FUN_02258894
	adds r2, r4, #0
	bl FUN_02050530
	pop {r3, r4, r5, pc}
	nop
_02258944: .4byte FUN_022588D4
_02258948: .4byte FUN_02258894
	thumb_func_end FUN_02258910

	thumb_func_start FUN_0225894C
FUN_0225894C: @ 0x0225894C
	push {r3, r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #0x14
	bl FUN_020402F0
	adds r4, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_0203EB08
	str r0, [r4]
	ldr r1, _02258974 @ =0x02042975
	adds r0, r5, #0
	bl FUN_0203FD58
	movs r0, #1
	pop {r3, r4, r5, pc}
	.align 2, 0
_02258974: .4byte 0x02042975
	thumb_func_end FUN_0225894C

	thumb_func_start FUN_02258978
FUN_02258978: @ 0x02258978
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02040374
	adds r1, r0, #0
	ldr r0, [r4, #0x74]
	bl FUN_02097720
	movs r0, #1
	pop {r4, pc}
	thumb_func_end FUN_02258978

	thumb_func_start FUN_02258998
FUN_02258998: @ 0x02258998
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #0x10
	bl FUN_020402F0
	ldr r1, [r5, #8]
	adds r6, r0, #0
	adds r0, r1, #1
	str r0, [r5, #8]
	adds r0, r5, #0
	ldrb r4, [r1]
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_020403AC
	adds r2, r0, #0
	lsls r2, r2, #0x18
	ldr r0, [r6]
	adds r1, r4, #0
	lsrs r2, r2, #0x18
	bl FUN_0200CA4C
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end FUN_02258998

	thumb_func_start FUN_022589D4
FUN_022589D4: @ 0x022589D4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x80
	ldr r6, [r0]
	movs r1, #0x10
	adds r0, r6, #0
	bl FUN_020402F0
	adds r0, r5, #0
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r5, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02040374
	adds r4, r0, #0
	adds r0, r5, #0
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_02040374
	adds r1, r0, #0
	adds r0, r6, #0
	bl FUN_0224E754
	strh r0, [r4]
	movs r0, #0
	pop {r4, r5, r6, pc}
	.align 2, 0
	thumb_func_end FUN_022589D4

	thumb_func_start FUN_02258A18
FUN_02258A18: @ 0x02258A18
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	adds r4, r0, #0
	adds r0, #0x80
	ldr r5, [r0]
	movs r1, #0x10
	adds r0, r5, #0
	bl FUN_020402F0
	adds r0, r4, #0
	bl FUN_0203FE2C
	adds r4, #0x80
	adds r1, r0, #0
	ldr r0, [r4]
	bl FUN_020403AC
	str r0, [sp]
	ldr r0, [r5, #0x40]
	bl FUN_0205C654
	adds r4, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_0205C67C
	adds r6, r0, #0
	adds r0, r4, #0
	bl FUN_02060F0C
	adds r7, r0, #0
	ldr r0, [r5, #0x40]
	bl FUN_0205C688
	str r0, [sp, #0x14]
	adds r0, r4, #0
	bl FUN_02060F18
	adds r2, r6, r7
	subs r2, #0x20
	asrs r1, r2, #4
	lsrs r1, r1, #0x1b
	adds r1, r2, r1
	ldr r2, [sp, #0x14]
	asrs r1, r1, #5
	adds r2, r2, r0
	subs r2, #0x20
	asrs r0, r2, #4
	lsrs r0, r0, #0x1b
	adds r0, r2, r0
	asrs r2, r0, #5
	lsls r0, r2, #1
	adds r0, r2, r0
	adds r0, r1, r0
	str r0, [sp, #0x10]
	ldr r0, [r5, #0xc]
	bl FUN_0202F57C
	movs r1, #0
	bl FUN_0202F630
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x2c]
	bl FUN_021F6320
	adds r4, r0, #0
	lsls r0, r4, #0x18
	ldr r1, [r5, #0x2c]
	lsrs r0, r0, #0x18
	add r2, sp, #0x20
	bl FUN_021F630C
	lsls r1, r4, #0x18
	ldr r0, [r5, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_021F65E4
	str r0, [sp, #8]
	lsls r1, r4, #0x18
	ldr r0, [r5, #0x2c]
	lsrs r1, r1, #0x18
	bl FUN_021F65F0
	str r0, [sp, #4]
	ldr r0, [sp, #0x10]
	movs r1, #0x7a
	muls r1, r0, r1
	ldr r0, [sp, #0xc]
	adds r0, r0, r1
	adds r1, r0, #2
	ldr r0, [sp]
	lsls r0, r0, #2
	adds r4, r1, r0
	ldr r0, [r5, #0xc]
	bl FUN_02028E9C
	bl FUN_02028F94
	adds r2, r0, #0
	lsls r2, r2, #0x18
	ldrb r1, [r4]
	add r0, sp, #0x1c
	lsrs r2, r2, #0x18
	bl FUN_02097268
	ldrb r0, [r4, #3]
	mov ip, r0
	add r0, sp, #0x1c
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x19
	lsrs r1, r0, #0x1d
	mov r0, ip
	subs r1, r0, r1
	mov r0, ip
	cmp r0, r1
	ble _02258B54
	mov r0, ip
	lsls r6, r0, #5
_02258B02:
	add r7, sp, #0x1c
	ldrb r0, [r7, #1]
	ldrb r1, [r4, #1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1d
	adds r0, r1, r0
	cmp r1, r0
	bge _02258B3A
	ldr r0, [sp, #4]
	lsls r3, r6, #1
	adds r0, r0, r6
	adds r2, r0, r1
	ldr r0, [sp, #8]
	adds r3, r0, r3
	lsls r0, r1, #1
	adds r3, r3, r0
_02258B22:
	ldrb r0, [r2]
	adds r1, r1, #1
	adds r2, r2, #1
	strh r0, [r3]
	ldrb r5, [r7, #1]
	ldrb r0, [r4, #1]
	adds r3, r3, #2
	lsls r5, r5, #0x1c
	lsrs r5, r5, #0x1d
	adds r0, r0, r5
	cmp r1, r0
	blt _02258B22
_02258B3A:
	add r1, sp, #0x1c
	mov r0, ip
	ldrb r1, [r1, #1]
	subs r0, r0, #1
	mov ip, r0
	lsls r1, r1, #0x19
	ldrb r0, [r4, #3]
	lsrs r1, r1, #0x1d
	subs r6, #0x20
	subs r1, r0, r1
	mov r0, ip
	cmp r0, r1
	bgt _02258B02
_02258B54:
	movs r5, #0
_02258B56:
	lsls r1, r5, #0x18
	ldr r0, [sp, #0x20]
	lsrs r1, r1, #0x18
	bl FUN_021F3B44
	str r0, [sp, #0x18]
	bl FUN_021F3B30
	cmp r0, #0
	beq _02258BC0
	ldr r1, [sp, #0x18]
	add r0, sp, #0x24
	bl FUN_021F3B0C
	ldr r0, [sp, #0x2c]
	ldrb r2, [r4, #1]
	asrs r1, r0, #0xc
	adds r1, #0xf8
	asrs r0, r1, #3
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	lsls r0, r0, #0xc
	asrs r3, r0, #0x10
	ldr r0, [sp, #0x24]
	asrs r1, r0, #0xc
	adds r1, #0xf8
	asrs r0, r1, #3
	lsrs r0, r0, #0x1c
	adds r0, r1, r0
	lsls r0, r0, #0xc
	asrs r1, r0, #0x10
	cmp r1, r2
	blt _02258BC0
	ldrb r0, [r4, #3]
	cmp r3, r0
	bgt _02258BC0
	add r6, sp, #0x1c
	ldrb r7, [r6, #1]
	lsls r6, r7, #0x1c
	lsrs r6, r6, #0x1d
	adds r2, r2, r6
	cmp r1, r2
	bge _02258BC0
	lsls r1, r7, #0x19
	lsrs r1, r1, #0x1d
	subs r0, r0, r1
	cmp r3, r0
	ble _02258BC0
	ldr r0, [sp, #0x18]
	movs r1, #1
	bl FUN_021F3B2C
	b _02258BC6
_02258BC0:
	adds r5, r5, #1
	cmp r5, #0x20
	blt _02258B56
_02258BC6:
	ldr r2, [sp]
	ldr r0, [sp, #0xc]
	lsls r2, r2, #0x18
	ldr r1, [sp, #0x10]
	lsrs r2, r2, #0x18
	bl FUN_0202F968
	movs r0, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
	thumb_func_end FUN_02258A18

	thumb_func_start FUN_02258BDC
FUN_02258BDC: @ 0x02258BDC
	push {r3, r4, r5, lr}
	adds r4, r0, #0
	bl FUN_0203FE2C
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x80
	ldr r0, [r0]
	bl FUN_02040374
	adds r4, #0x80
	adds r5, r0, #0
	ldr r0, [r4]
	bl FUN_0224E698
	strh r0, [r5]
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_02258BDC

	thumb_func_start FUN_02258C00
FUN_02258C00: @ 0x02258C00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	ldr r2, _02258CD4 @ =0x02259808
	add r1, sp, #0x14
	ldrh r3, [r2]
	ldrh r2, [r2, #2]
	adds r5, r0, #0
	strh r3, [r1]
	strh r2, [r1, #2]
	adds r1, r5, #0
	adds r1, #0x80
	ldr r2, [r5, #8]
	ldr r4, [r1]
	adds r1, r2, #1
	str r1, [r5, #8]
	ldrb r1, [r2]
	str r1, [sp, #8]
	bl FUN_0203FE2C
	adds r5, #0x80
	adds r1, r0, #0
	ldr r0, [r5]
	bl FUN_02040374
	str r0, [sp]
	ldr r0, [r4, #0xc]
	bl FUN_02074904
	str r0, [sp, #4]
	bl FUN_02074640
	adds r6, r0, #0
	ldr r0, [r4, #0xc]
	bl FUN_02028E9C
	bl FUN_02028F84
	str r0, [sp, #0xc]
	ldr r0, _02258CD8 @ =0x00000165
	bl FUN_0203B36C
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	movs r5, #0
	cmp r6, #0
	ble _02258CCA
	ldr r0, [sp, #8]
	lsls r0, r0, #1
	str r0, [sp, #0x10]
_02258C62:
	ldr r0, [sp, #4]
	adds r1, r5, #0
	bl FUN_02074644
	movs r1, #0x4c
	movs r2, #0
	adds r4, r0, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _02258CC4
	adds r0, r4, #0
	movs r1, #7
	movs r2, #0
	bl FUN_0206E540
	ldr r1, [sp, #0xc]
	cmp r1, r0
	bne _02258CC4
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl FUN_0206E540
	ldr r1, [sp, #0x10]
	add r2, sp, #0x14
	ldrh r1, [r2, r1]
	cmp r1, r0
	bne _02258CC4
	adds r0, r4, #0
	movs r1, #0x98
	movs r2, #0
	bl FUN_0206E540
	cmp r0, #0
	bne _02258CC4
	adds r0, r4, #0
	movs r1, #0x99
	movs r2, #0
	bl FUN_0206E540
	cmp r7, r0
	bne _02258CC4
	ldr r0, [sp]
	movs r1, #1
	strh r1, [r0]
	add sp, #0x18
	movs r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02258CC4:
	adds r5, r5, #1
	cmp r5, r6
	blt _02258C62
_02258CCA:
	ldr r1, [sp]
	movs r0, #0
	strh r0, [r1]
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02258CD4: .4byte 0x02259808
_02258CD8: .4byte 0x00000165
	thumb_func_end FUN_02258C00

	thumb_func_start FUN_02258CDC
FUN_02258CDC: @ 0x02258CDC
	push {r3, r4, r5, lr}
	adds r0, #0x80
	ldr r5, [r0]
	ldr r0, [r5, #0xc]
	bl FUN_0202F57C
	adds r4, r0, #0
	ldr r0, [r5, #0xc]
	bl FUN_02028EC0
	adds r1, r0, #0
	adds r0, r4, #0
	bl FUN_0202F784
	movs r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end FUN_02258CDC

	thumb_func_start FUN_02258CFC
FUN_02258CFC: @ 0x02258CFC
	push {r4, r5, r6, lr}
	adds r6, r1, #0
	bl FUN_0205064C
	adds r5, r0, #0
	movs r0, #0xb
	movs r1, #0x40
	bl FUN_0201AA8C
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4]
	str r6, [r4, #4]
	ldr r0, [r5, #8]
	str r0, [r4, #0xc]
	str r5, [r4, #8]
	ldr r0, [r5, #0xc]
	bl FUN_02031968
	str r0, [r4, #0x20]
	bl FUN_0203199C
	str r0, [r4, #0x24]
	ldr r0, [r5, #0x10]
	ldr r1, _02258D38 @ =FUN_02258D3C
	adds r2, r4, #0
	bl FUN_02050530
	pop {r4, r5, r6, pc}
	nop
_02258D38: .4byte FUN_02258D3C
	thumb_func_end FUN_02258CFC

	thumb_func_start FUN_02258D3C
FUN_02258D3C: @ 0x02258D3C
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_0205064C
	adds r0, r4, #0
	bl FUN_02050650
	adds r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _02258D58
	cmp r1, #1
	beq _02258D6C
	b _02258D84
_02258D58:
	bl FUN_02258DE8
	ldr r1, [r4, #4]
	adds r0, r4, #0
	bl FUN_02258EE8
	ldr r0, [r4]
	adds r0, r0, #1
	str r0, [r4]
	b _02258D84
_02258D6C:
	bl FUN_02258D88
	cmp r0, #0
	beq _02258D84
	adds r0, r4, #0
	bl FUN_02258E88
	adds r0, r4, #0
	bl FUN_0201AB0C
	movs r0, #1
	pop {r4, pc}
_02258D84:
	movs r0, #0
	pop {r4, pc}
	thumb_func_end FUN_02258D3C

	thumb_func_start FUN_02258D88
FUN_02258D88: @ 0x02258D88
	push {r4, lr}
	adds r4, r0, #0
	bl FUN_02025358
	cmp r0, #0
	beq _02258DAC
	ldr r0, _02258DDC @ =0x000005DD
	bl FUN_0200604C
	movs r0, #0x43
	ldr r1, [r4, #8]
	lsls r0, r0, #2
	adds r0, r1, r0
	movs r1, #1
	bl FUN_02018410
	movs r0, #1
	pop {r4, pc}
_02258DAC:
	ldr r0, _02258DE0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	ldr r0, _02258DE4 @ =0x00000CF3
	tst r0, r1
	beq _02258DC4
	movs r0, #0x43
	ldr r1, [r4, #8]
	lsls r0, r0, #2
	adds r0, r1, r0
	movs r1, #0
	bl FUN_02018410
_02258DC4:
	ldr r0, _02258DE0 @ =0x021D110C
	ldr r1, [r0, #0x48]
	movs r0, #3
	tst r0, r1
	beq _02258DD8
	ldr r0, _02258DDC @ =0x000005DD
	bl FUN_0200604C
	movs r0, #1
	pop {r4, pc}
_02258DD8:
	movs r0, #0
	pop {r4, pc}
	.align 2, 0
_02258DDC: .4byte 0x000005DD
_02258DE0: .4byte 0x021D110C
_02258DE4: .4byte 0x00000CF3
	thumb_func_end FUN_02258D88

	thumb_func_start FUN_02258DE8
FUN_02258DE8: @ 0x02258DE8
	push {r3, r4, lr}
	sub sp, #0x14
	movs r1, #1
	adds r4, r0, #0
	str r1, [sp]
	movs r0, #0x1c
	str r0, [sp, #4]
	movs r0, #0x16
	str r0, [sp, #8]
	movs r0, #0xd
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	adds r1, r4, #0
	ldr r0, [r4, #0xc]
	adds r1, #0x10
	movs r2, #3
	movs r3, #2
	bl FUN_0201D40C
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	ldr r2, _02258E84 @ =0x000003D9
	movs r1, #3
	movs r3, #0xb
	bl FUN_0200E3DC
	adds r0, r4, #0
	ldr r2, _02258E84 @ =0x000003D9
	adds r0, #0x10
	movs r1, #1
	movs r3, #0xb
	bl FUN_0200E580
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #0xf
	bl FUN_0201D978
	movs r1, #0x1b
	adds r2, r1, #0
	movs r0, #0
	adds r2, #0xfa
	movs r3, #4
	bl FUN_0200BAF8
	str r0, [r4, #0x28]
	movs r0, #3
	movs r1, #0x10
	movs r2, #4
	bl FUN_0200BD18
	str r0, [r4, #0x2c]
	movs r0, #0x80
	movs r1, #4
	bl FUN_02026354
	str r0, [r4, #0x30]
	movs r0, #0x80
	movs r1, #4
	bl FUN_02026354
	str r0, [r4, #0x34]
	ldr r0, [r4, #0x28]
	movs r1, #1
	bl FUN_0200BBA0
	str r0, [r4, #0x38]
	ldr r0, [r4, #0x28]
	movs r1, #3
	bl FUN_0200BBA0
	str r0, [r4, #0x3c]
	add sp, #0x14
	pop {r3, r4, pc}
	nop
_02258E84: .4byte 0x000003D9
	thumb_func_end FUN_02258DE8

	thumb_func_start FUN_02258E88
FUN_02258E88: @ 0x02258E88
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	bl FUN_02026380
	ldr r0, [r4, #0x38]
	bl FUN_02026380
	ldr r0, [r4, #0x34]
	bl FUN_02026380
	ldr r0, [r4, #0x30]
	bl FUN_02026380
	ldr r0, [r4, #0x2c]
	bl FUN_0200BDA0
	ldr r0, [r4, #0x28]
	bl FUN_0200BB44
	adds r0, r4, #0
	adds r0, #0x10
	movs r1, #1
	bl FUN_0200E5D4
	adds r0, r4, #0
	adds r0, #0x10
	bl FUN_0201D520
	ldr r0, [r4, #0xc]
	movs r1, #3
	bl FUN_0201EFBC
	pop {r4, pc}
	thumb_func_end FUN_02258E88

	thumb_func_start FUN_02258ECC
FUN_02258ECC: @ 0x02258ECC
	push {r3, lr}
	ldr r2, _02258EE4 @ =0x02259880
	ldrb r1, [r2, r1]
	cmp r1, #0
	bne _02258EDA
	movs r0, #1
	pop {r3, pc}
_02258EDA:
	ldr r0, [r0, #0x20]
	subs r1, r1, #1
	bl FUN_02031A78
	pop {r3, pc}
	.align 2, 0
_02258EE4: .4byte 0x02259880
	thumb_func_end FUN_02258ECC

	thumb_func_start FUN_02258EE8
FUN_02258EE8: @ 0x02258EE8
	push {r3, r4, r5, r6, r7, lr}
	ldr r2, _02258F44 @ =0x0225980C
	adds r6, r0, #0
	lsls r0, r1, #2
	str r0, [sp]
	ldr r0, [r2, r0]
	movs r7, #0
	cmp r0, #0
	ble _02258F32
	movs r0, #0xa
	adds r4, r1, #0
	muls r4, r0, r4
	movs r5, #8
_02258F02:
	adds r0, r6, #0
	adds r1, r4, #0
	bl FUN_02258ECC
	cmp r0, #0
	beq _02258F1A
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl FUN_02258F8C
	b _02258F22
_02258F1A:
	adds r0, r6, #0
	adds r1, r5, #0
	bl FUN_02258F48
_02258F22:
	ldr r1, _02258F44 @ =0x0225980C
	ldr r0, [sp]
	adds r7, r7, #1
	ldr r0, [r1, r0]
	adds r4, r4, #1
	adds r5, #0x10
	cmp r7, r0
	blt _02258F02
_02258F32:
	adds r0, r6, #0
	adds r0, #0x10
	bl FUN_0201D5C8
	ldr r0, [r6, #0xc]
	movs r1, #3
	bl FUN_0201EFBC
	pop {r3, r4, r5, r6, r7, pc}
	.align 2, 0
_02258F44: .4byte 0x0225980C
	thumb_func_end FUN_02258EE8

	thumb_func_start FUN_02258F48
FUN_02258F48: @ 0x02258F48
	push {r3, r4, r5, lr}
	sub sp, #0x10
	adds r4, r1, #0
	adds r5, r0, #0
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02258F88 @ =0x0001020F
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x3c]
	adds r0, #0x10
	movs r3, #8
	bl FUN_020200FC
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02258F88 @ =0x0001020F
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x38]
	adds r0, #0x10
	movs r3, #8
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.align 2, 0
_02258F88: .4byte 0x0001020F
	thumb_func_end FUN_02258F48

	thumb_func_start FUN_02258F8C
FUN_02258F8C: @ 0x02258F8C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r5, r0, #0
	adds r6, r2, #0
	adds r4, r1, #0
	ldr r0, [r5, #0x28]
	ldr r2, [r5, #0x34]
	adds r1, r6, #4
	bl FUN_0200BB6C
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02259064 @ =0x0001020F
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x34]
	adds r0, #0x10
	movs r3, #8
	bl FUN_020200FC
	ldr r0, [r5, #0x24]
	adds r1, r6, #0
	bl FUN_02259070
	adds r7, r0, #0
	ldr r0, _02259068 @ =0x0098967F
	cmp r7, r0
	blo _02258FCC
	adds r7, r0, #0
_02258FCC:
	cmp r6, #9
	bne _02259028
	ldr r0, [r5, #0x28]
	ldr r2, [r5, #0x30]
	movs r1, #2
	bl FUN_0200BB6C
	adds r0, r7, #0
	movs r1, #0x3c
	blx FUN_020F2BA4
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	adds r0, r7, #0
	movs r1, #0x3c
	blx FUN_020F2BA4
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	ldr r0, _0225906C @ =0x000003E7
	cmp r6, r0
	bls _02258FFA
	adds r6, r0, #0
_02258FFA:
	movs r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #0x2c]
	movs r1, #0
	adds r2, r6, #0
	movs r3, #3
	bl FUN_0200BFCC
	movs r3, #2
	str r3, [sp]
	movs r1, #1
	str r1, [sp, #4]
	ldr r0, [r5, #0x2c]
	adds r2, r7, #0
	bl FUN_0200BFCC
	ldr r0, [r5, #0x2c]
	ldr r1, [r5, #0x34]
	ldr r2, [r5, #0x30]
	bl FUN_0200CBBC
	b _02259036
_02259028:
	movs r3, #1
	str r3, [sp]
	ldr r0, [r5, #0x34]
	adds r1, r7, #0
	movs r2, #7
	bl FUN_02026464
_02259036:
	movs r0, #0
	ldr r1, [r5, #0x34]
	adds r2, r0, #0
	bl FUN_02002F30
	movs r1, #0xe0
	subs r3, r1, r0
	str r4, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02259064 @ =0x0001020F
	movs r1, #0
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r5, #0
	ldr r2, [r5, #0x34]
	adds r0, #0x10
	subs r3, #8
	bl FUN_020200FC
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02259064: .4byte 0x0001020F
_02259068: .4byte 0x0098967F
_0225906C: .4byte 0x000003E7
	thumb_func_end FUN_02258F8C

	thumb_func_start FUN_02259070
FUN_02259070: @ 0x02259070
	cmp r1, #0xa
	blt _02259082
	cmp r1, #0x13
	bgt _02259082
	subs r1, #0xa
	lsls r1, r1, #2
	adds r0, r0, r1
	ldr r0, [r0, #0x44]
	bx lr
_02259082:
	cmp r1, #0x1c
	bhi _02259128
	adds r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	add pc, r1
_02259092: @ jump table
	.2byte _022590CC - _02259092 - 2 @ case 0
	.2byte _022590D0 - _02259092 - 2 @ case 1
	.2byte _022590D4 - _02259092 - 2 @ case 2
	.2byte _022590D8 - _02259092 - 2 @ case 3
	.2byte _022590DC - _02259092 - 2 @ case 4
	.2byte _022590F0 - _02259092 - 2 @ case 5
	.2byte _022590F4 - _02259092 - 2 @ case 6
	.2byte _022590F8 - _02259092 - 2 @ case 7
	.2byte _022590FC - _02259092 - 2 @ case 8
	.2byte _02259100 - _02259092 - 2 @ case 9
	.2byte _02259128 - _02259092 - 2 @ case 10
	.2byte _02259128 - _02259092 - 2 @ case 11
	.2byte _02259128 - _02259092 - 2 @ case 12
	.2byte _02259128 - _02259092 - 2 @ case 13
	.2byte _02259128 - _02259092 - 2 @ case 14
	.2byte _02259128 - _02259092 - 2 @ case 15
	.2byte _02259128 - _02259092 - 2 @ case 16
	.2byte _02259128 - _02259092 - 2 @ case 17
	.2byte _02259128 - _02259092 - 2 @ case 18
	.2byte _02259128 - _02259092 - 2 @ case 19
	.2byte _02259104 - _02259092 - 2 @ case 20
	.2byte _02259108 - _02259092 - 2 @ case 21
	.2byte _0225910C - _02259092 - 2 @ case 22
	.2byte _02259110 - _02259092 - 2 @ case 23
	.2byte _02259114 - _02259092 - 2 @ case 24
	.2byte _02259118 - _02259092 - 2 @ case 25
	.2byte _0225911C - _02259092 - 2 @ case 26
	.2byte _02259120 - _02259092 - 2 @ case 27
	.2byte _02259124 - _02259092 - 2 @ case 28
_022590CC:
	ldr r0, [r0, #4]
	bx lr
_022590D0:
	ldr r0, [r0, #8]
	bx lr
_022590D4:
	ldr r0, [r0, #0xc]
	bx lr
_022590D8:
	ldr r0, [r0, #0x10]
	bx lr
_022590DC:
	movs r3, #0
	adds r2, r3, #0
_022590E0:
	ldr r1, [r0, #0x44]
	adds r2, r2, #1
	adds r3, r3, r1
	adds r0, r0, #4
	cmp r2, #0xa
	blt _022590E0
	adds r0, r3, #0
	bx lr
_022590F0:
	ldr r0, [r0, #0x6c]
	bx lr
_022590F4:
	ldr r0, [r0, #0x38]
	bx lr
_022590F8:
	ldr r0, [r0, #0x3c]
	bx lr
_022590FC:
	ldr r0, [r0, #0x40]
	bx lr
_02259100:
	ldr r0, [r0]
	bx lr
_02259104:
	ldr r0, [r0, #0x14]
	bx lr
_02259108:
	ldr r0, [r0, #0x2c]
	bx lr
_0225910C:
	ldr r0, [r0, #0x1c]
	bx lr
_02259110:
	ldr r0, [r0, #0x24]
	bx lr
_02259114:
	ldr r0, [r0, #0x30]
	bx lr
_02259118:
	ldr r0, [r0, #0x34]
	bx lr
_0225911C:
	ldr r0, [r0, #0x20]
	bx lr
_02259120:
	ldr r0, [r0, #0x18]
	bx lr
_02259124:
	ldr r0, [r0, #0x28]
	bx lr
_02259128:
	movs r0, #0
	bx lr
	thumb_func_end FUN_02259070
_0225912C:
	.byte 0x4F, 0x01, 0x00, 0x00
	.byte 0x4E, 0x01, 0x00, 0x00, 0x4D, 0x01, 0x00, 0x00, 0x4E, 0x01, 0x00, 0x00, 0x50, 0x01, 0x00, 0x00
	.byte 0x4E, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x05, 0x00, 0x00, 0x01, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x80
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x41, 0x25, 0x02, 0x21, 0x41, 0x25, 0x02
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x05, 0x00, 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x26, 0x00, 0x26, 0x00, 0x26, 0x00
	.byte 0x27, 0x00, 0x28, 0x00, 0x29, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x26, 0x00, 0x26, 0x00
	.byte 0x26, 0x00, 0x27, 0x00, 0x28, 0x00, 0x29, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46, 0x00
	.byte 0x46, 0x00, 0x46, 0x00, 0x47, 0x00, 0x48, 0x00, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x4A, 0x00, 0x30, 0x00, 0x31, 0x00, 0x32, 0x00
	.byte 0x34, 0x00, 0x33, 0x00, 0x33, 0x00, 0x38, 0x00, 0x39, 0x00, 0x3A, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x3C, 0x00, 0x3D, 0x00, 0x00, 0x00, 0x3E, 0x00, 0x3F, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x35, 0x00, 0x35, 0x00, 0x36, 0x00, 0x37, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x41, 0x00, 0x42, 0x00, 0x43, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x00, 0x07, 0x00
	.byte 0x08, 0x00, 0x09, 0x00, 0x0B, 0x00, 0x0A, 0x00, 0x0A, 0x00, 0x0F, 0x00, 0x10, 0x00, 0x11, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x12, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x13, 0x00, 0x14, 0x00, 0x00, 0x00, 0x15, 0x00, 0x16, 0x00, 0x17, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x0D, 0x00, 0x00, 0x00
	.byte 0x18, 0x00, 0x19, 0x00, 0x1A, 0x00, 0x1B, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x25, 0x00, 0x1F, 0x00
	.byte 0x1F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x00, 0x21, 0x00, 0x00, 0x00, 0x22, 0x00, 0x23, 0x00
	.byte 0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1C, 0x00, 0x1C, 0x00, 0x1D, 0x00
	.byte 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x2B, 0x00, 0x2B, 0x00, 0x2B, 0x00, 0x2C, 0x00
	.byte 0x2D, 0x00, 0x2E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x2F, 0x00, 0xBF, 0x00, 0x00, 0x00, 0xBF, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x37, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x0F, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x37, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x10, 0x2F, 0x00, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x95, 0x00, 0x98, 0x00
	.byte 0x99, 0x00, 0x00, 0x00, 0x02, 0x01, 0x12, 0x1B, 0x06, 0x0D, 0xFD, 0x00, 0x42, 0x00, 0x43, 0x00
	.byte 0x41, 0x00, 0x40, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0x58, 0x00, 0x04, 0x02, 0x06, 0x01, 0x08, 0x03
	.byte 0x00, 0x07, 0x00, 0x04, 0x06, 0x03, 0x01, 0x05, 0x02, 0x07, 0x02, 0x00, 0x06, 0x05, 0x03, 0x08
	.byte 0x04, 0x07, 0x04, 0x00, 0x08, 0x08, 0x04, 0x00, 0x08, 0x08, 0x05, 0x01, 0x08, 0x08, 0x30, 0x38
	.byte 0x00, 0x07, 0xB0, 0x38, 0x00, 0x07, 0x30, 0x60, 0x00, 0x07, 0xB0, 0x60, 0x00, 0x07, 0x30, 0x88
	.byte 0x00, 0x07, 0xB0, 0x88, 0x00, 0x07, 0x18, 0xB0, 0x04, 0x07, 0x40, 0xB0, 0x04, 0x07, 0xE0, 0xB0
	.byte 0x07, 0x07, 0xA0, 0xB0, 0x07, 0x07, 0x02, 0x0D, 0x02, 0x12, 0x0E, 0x0D, 0x01, 0x00, 0x02, 0x05
	.byte 0x12, 0x1B, 0x06, 0x0D, 0xFD, 0x00, 0x03, 0x01, 0x01, 0x0A, 0x04, 0x0D, 0x28, 0x00, 0x03, 0x13
	.byte 0x0D, 0x0C, 0x04, 0x0D, 0x50, 0x00, 0x03, 0x01, 0x0F, 0x0E, 0x02, 0x0D, 0x80, 0x00, 0x03, 0x02
	.byte 0x13, 0x1B, 0x04, 0x0C, 0x9C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xB1, 0x00, 0x08, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xB1, 0x00, 0x84, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x18, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x16, 0x00, 0xAC, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x16, 0x00, 0x3B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x04, 0x00, 0x00, 0x00, 0x98, 0x00, 0x3B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x16, 0x00, 0x64, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x06, 0x00, 0x00, 0x00, 0x98, 0x00, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x00, 0x00, 0x00, 0x16, 0x00, 0x8B, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x08, 0x00, 0x00, 0x00, 0x98, 0x00, 0x8B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0x18, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x40, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0xE0, 0x00, 0xB0, 0x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x88, 0x00, 0x68, 0x00
	.byte 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x68, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x88, 0x00, 0x98, 0x00
	.byte 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x09, 0x00, 0x00, 0x00, 0xA8, 0x00, 0x98, 0x00, 0x00, 0x00, 0x0E, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x88, 0x00, 0xB0, 0x00
	.byte 0x00, 0x00, 0x18, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0xFF, 0x00, 0x00, 0x00, 0x4D, 0x88, 0x25, 0x02
	.byte 0x29, 0x88, 0x25, 0x02, 0x31, 0x88, 0x25, 0x02, 0x4A, 0x00, 0x1B, 0x00, 0x0A, 0x00, 0x00, 0x00
	.byte 0x0A, 0x00, 0x00, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x02, 0x03, 0x05, 0x07, 0x04, 0x0B, 0x0A, 0x09, 0x00, 0x00, 0x00, 0x66, 0x67, 0x68, 0x69
	.byte 0x6B, 0x6D, 0x6D, 0x6D, 0x6F, 0x00, 0x00, 0x00, 0x82, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x83, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x81, 0x00, 0x00, 0x00, 0xFE, 0xFF, 0xFF, 0xFF
	.byte 0x04, 0x05, 0x02, 0x05, 0x05, 0x02, 0x06, 0x05, 0x02, 0x07, 0x05, 0x02, 0x08, 0x05, 0x02, 0x09
	.byte 0x05, 0x02, 0x0A, 0x01, 0x00, 0x0B, 0x03, 0x00, 0x0C, 0x04, 0x00, 0x0D, 0x01, 0x01, 0x0E, 0x00
	.byte 0x01, 0x0F, 0x00, 0x01, 0x10, 0x00, 0x01, 0x11, 0x00, 0x01, 0x12, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x01, 0x02, 0x19, 0x15, 0x16, 0x00, 0x13, 0x14, 0x1B, 0x05, 0x07, 0x12, 0x08, 0x09, 0x11
	.byte 0x06, 0x10, 0x0A, 0x18, 0x1A, 0x03, 0x04, 0x0E, 0x17, 0x0D, 0x0B, 0x0C, 0x0F, 0x00, 0x00, 0x00
