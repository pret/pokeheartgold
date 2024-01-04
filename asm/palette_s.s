	.include "asm/macros.inc"
	.include "palette.inc"
	.include "global.inc"

	.text

	.extern IsPaletteSelected

	thumb_func_start sub_0200398C
sub_0200398C: ; 0x0200398C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, _02003B3C ; =0x0000011A
	ldrh r1, [r6, r0]
	lsl r1, r1, #0x10
	lsr r1, r1, #0x1f
	bne _020039A8
	sub r0, r0, #2
	ldrh r0, [r6, r0]
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1e
	cmp r0, #1
	beq _020039A8
	b _02003B3A
_020039A8:
	mov r7, #2
	mov r5, #0
	add r4, r6, #0
	lsl r7, r7, #0xc
_020039B0:
	ldr r0, _02003B3C ; =0x0000011A
	ldrh r1, [r6, r0]
	lsl r0, r1, #0x10
	lsr r0, r0, #0x1f
	bne _020039D0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _020039DC
	lsl r0, r1, #0x12
	lsl r1, r5, #0x10
	lsr r0, r0, #0x12
	lsr r1, r1, #0x10
	bl IsPaletteSelected
	cmp r0, #0
	beq _020039DC
_020039D0:
	ldr r0, [r4, #4]
	ldr r1, [r4, #8]
	bl DC_FlushRange
	cmp r5, #0xd
	bls _020039DE
_020039DC:
	b _02003B04
_020039DE:
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020039EA: ; jump table
	.short _02003A06 - _020039EA - 2 ; case 0
	.short _02003A12 - _020039EA - 2 ; case 1
	.short _02003A1E - _020039EA - 2 ; case 2
	.short _02003A2A - _020039EA - 2 ; case 3
	.short _02003A36 - _020039EA - 2 ; case 4
	.short _02003A4A - _020039EA - 2 ; case 5
	.short _02003A5E - _020039EA - 2 ; case 6
	.short _02003A74 - _020039EA - 2 ; case 7
	.short _02003A8A - _020039EA - 2 ; case 8
	.short _02003A9E - _020039EA - 2 ; case 9
	.short _02003AB2 - _020039EA - 2 ; case 10
	.short _02003AC8 - _020039EA - 2 ; case 11
	.short _02003ADE - _020039EA - 2 ; case 12
	.short _02003AF2 - _020039EA - 2 ; case 13
_02003A06:
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl GX_LoadBGPltt
	b _02003B04
_02003A12:
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl GXS_LoadBGPltt
	b _02003B04
_02003A1E:
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl GX_LoadOBJPltt
	b _02003B04
_02003A2A:
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl GXS_LoadOBJPltt
	b _02003B04
_02003A36:
	bl GX_BeginLoadBGExtPltt
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	b _02003B04
_02003A4A:
	bl GX_BeginLoadBGExtPltt
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	add r1, r7, #0
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	b _02003B04
_02003A5E:
	bl GX_BeginLoadBGExtPltt
	mov r1, #1
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	lsl r1, r1, #0xe
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	b _02003B04
_02003A74:
	bl GX_BeginLoadBGExtPltt
	mov r1, #6
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	lsl r1, r1, #0xc
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
	b _02003B04
_02003A8A:
	bl GXS_BeginLoadBGExtPltt
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl GXS_LoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
	b _02003B04
_02003A9E:
	bl GXS_BeginLoadBGExtPltt
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	add r1, r7, #0
	bl GXS_LoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
	b _02003B04
_02003AB2:
	bl GXS_BeginLoadBGExtPltt
	mov r1, #1
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	lsl r1, r1, #0xe
	bl GXS_LoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
	b _02003B04
_02003AC8:
	bl GXS_BeginLoadBGExtPltt
	mov r1, #6
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	lsl r1, r1, #0xc
	bl GXS_LoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
	b _02003B04
_02003ADE:
	bl GX_BeginLoadOBJExtPltt
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl GX_LoadOBJExtPltt
	bl GX_EndLoadOBJExtPltt
	b _02003B04
_02003AF2:
	bl GXS_BeginLoadOBJExtPltt
	ldr r0, [r4, #4]
	ldr r2, [r4, #8]
	mov r1, #0
	bl GXS_LoadOBJExtPltt
	bl GXS_EndLoadOBJExtPltt
_02003B04:
	add r5, r5, #1
	add r4, #0x14
	cmp r5, #0xe
	bge _02003B0E
	b _020039B0
_02003B0E:
	ldr r3, _02003B3C ; =0x0000011A
	ldr r1, _02003B40 ; =0xFFFFC000
	sub r2, r3, #2
	ldrh r2, [r6, r2]
	ldrh r0, [r6, r3]
	lsl r2, r2, #0x10
	and r0, r1
	lsr r2, r2, #0x12
	lsr r1, r1, #0x12
	and r1, r2
	orr r0, r1
	strh r0, [r6, r3]
	ldrh r0, [r6, r3]
	lsl r0, r0, #0x12
	lsr r0, r0, #0x12
	bne _02003B3A
	sub r0, r3, #2
	ldrh r1, [r6, r0]
	mov r0, #3
	bic r1, r0
	sub r0, r3, #2
	strh r1, [r6, r0]
_02003B3A:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02003B3C: .word 0x0000011A
_02003B40: .word 0xFFFFC000
	thumb_func_end sub_0200398C

	thumb_func_start sub_02003B44
sub_02003B44: ; 0x02003B44
	mov r1, #0x46
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x12
	bx lr
	thumb_func_end sub_02003B44

	thumb_func_start sub_02003B50
sub_02003B50: ; 0x02003B50
	push {r3, r4}
	ldr r3, _02003B6C ; =0x0000011A
	lsl r1, r1, #0x10
	ldrh r4, [r0, r3]
	ldr r2, _02003B70 ; =0xFFFF7FFF
	lsr r1, r1, #0x10
	lsl r1, r1, #0x1f
	and r2, r4
	lsr r1, r1, #0x10
	orr r1, r2
	strh r1, [r0, r3]
	pop {r3, r4}
	bx lr
	nop
_02003B6C: .word 0x0000011A
_02003B70: .word 0xFFFF7FFF
	thumb_func_end sub_02003B50

	thumb_func_start sub_02003B74
sub_02003B74: ; 0x02003B74
	push {r3, r4}
	mov r2, #0x46
	lsl r2, r2, #2
	ldrh r3, [r0, r2]
	mov r4, #3
	bic r3, r4
	mov r4, #1
	and r1, r4
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	mov r1, #3
	and r1, r4
	orr r1, r3
	strh r1, [r0, r2]
	ldrh r3, [r0, r2]
	ldr r1, _02003BA0 ; =0xFFFF0003
	and r3, r1
	ldr r1, _02003BA4 ; =0x0000FFFC
	orr r1, r3
	strh r1, [r0, r2]
	pop {r3, r4}
	bx lr
	.balign 4, 0
_02003BA0: .word 0xFFFF0003
_02003BA4: .word 0x0000FFFC
	thumb_func_end sub_02003B74

	thumb_func_start sub_02003BA8
sub_02003BA8: ; 0x02003BA8
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #2
	add r4, r0, #0
	add r0, r6, #0
	lsl r1, r1, #8
	bl AllocFromHeap
	mov r2, #2
	mov r1, #0
	lsl r2, r2, #8
	add r5, r0, #0
	bl memset
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #8
	bl DC_FlushRange
	mov r2, #1
	add r0, r4, #0
	tst r0, r2
	beq _02003BE0
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #9
	bl GX_LoadBGPltt
_02003BE0:
	mov r2, #2
	add r0, r4, #0
	tst r0, r2
	beq _02003BF2
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #8
	bl GXS_LoadBGPltt
_02003BF2:
	mov r2, #4
	add r0, r4, #0
	tst r0, r2
	beq _02003C04
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #7
	bl GX_LoadOBJPltt
_02003C04:
	mov r2, #8
	add r0, r4, #0
	tst r0, r2
	beq _02003C16
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #6
	bl GXS_LoadOBJPltt
_02003C16:
	add r0, r6, #0
	add r1, r5, #0
	bl FreeToHeapExplicit
	mov r1, #2
	add r0, r6, #0
	lsl r1, r1, #0xc
	bl AllocFromHeap
	mov r2, #2
	mov r1, #0
	lsl r2, r2, #0xc
	add r5, r0, #0
	bl memset
	mov r1, #2
	add r0, r5, #0
	lsl r1, r1, #0xc
	bl DC_FlushRange
	mov r0, #0x10
	tst r0, r4
	beq _02003C58
	bl GX_BeginLoadBGExtPltt
	mov r2, #2
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #0xc
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
_02003C58:
	mov r0, #0x20
	tst r0, r4
	beq _02003C72
	bl GX_BeginLoadBGExtPltt
	mov r1, #2
	lsl r1, r1, #0xc
	add r0, r5, #0
	add r2, r1, #0
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
_02003C72:
	mov r0, #0x40
	tst r0, r4
	beq _02003C8C
	bl GX_BeginLoadBGExtPltt
	mov r1, #1
	lsl r1, r1, #0xe
	add r0, r5, #0
	lsr r2, r1, #1
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
_02003C8C:
	mov r0, #0x80
	tst r0, r4
	beq _02003CA8
	bl GX_BeginLoadBGExtPltt
	mov r1, #6
	mov r2, #2
	add r0, r5, #0
	lsl r1, r1, #0xc
	lsl r2, r2, #0xc
	bl GX_LoadBGExtPltt
	bl GX_EndLoadBGExtPltt
_02003CA8:
	mov r0, #1
	lsl r0, r0, #8
	tst r0, r4
	beq _02003CC4
	bl GXS_BeginLoadBGExtPltt
	mov r2, #2
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #0xc
	bl GXS_LoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
_02003CC4:
	mov r0, #2
	lsl r0, r0, #8
	tst r0, r4
	beq _02003CE0
	bl GXS_BeginLoadBGExtPltt
	mov r1, #2
	lsl r1, r1, #0xc
	add r0, r5, #0
	add r2, r1, #0
	bl GXS_LoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
_02003CE0:
	mov r0, #1
	lsl r0, r0, #0xa
	tst r0, r4
	beq _02003CFC
	bl GXS_BeginLoadBGExtPltt
	mov r1, #1
	lsl r1, r1, #0xe
	add r0, r5, #0
	lsr r2, r1, #1
	bl GXS_LoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
_02003CFC:
	mov r0, #2
	lsl r0, r0, #0xa
	tst r0, r4
	beq _02003D1A
	bl GXS_BeginLoadBGExtPltt
	mov r1, #6
	mov r2, #2
	add r0, r5, #0
	lsl r1, r1, #0xc
	lsl r2, r2, #0xc
	bl GXS_LoadBGExtPltt
	bl GXS_EndLoadBGExtPltt
_02003D1A:
	mov r0, #1
	lsl r0, r0, #0xc
	tst r0, r4
	beq _02003D36
	bl GX_BeginLoadOBJExtPltt
	mov r2, #2
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #0xc
	bl GX_LoadOBJExtPltt
	bl GX_EndLoadOBJExtPltt
_02003D36:
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r4
	beq _02003D52
	bl GXS_BeginLoadOBJExtPltt
	mov r2, #2
	add r0, r5, #0
	mov r1, #0
	lsl r2, r2, #0xc
	bl GXS_LoadOBJExtPltt
	bl GXS_EndLoadOBJExtPltt
_02003D52:
	add r0, r6, #0
	add r1, r5, #0
	bl FreeToHeapExplicit
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02003BA8

	thumb_func_start sub_02003D5C
sub_02003D5C: ; 0x02003D5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	str r3, [sp]
	mov r0, #0x14
	add r4, r1, #0
	mul r4, r0
	add r0, sp, #0x10
	ldrh r0, [r0, #0x14]
	add r7, r2, #0
	ldr r5, [sp, #0x20]
	str r0, [sp, #4]
	lsl r1, r0, #1
	add r0, r6, r4
	ldr r0, [r0, #8]
	cmp r1, r0
	bls _02003D82
	bl GF_AssertFail
_02003D82:
	sub r0, r7, #1
	cmp r0, #1
	bhi _02003D9A
	ldr r2, [r6, r4]
	lsl r1, r5, #1
	add r1, r2, r1
	ldr r2, [sp, #4]
	ldr r0, [sp]
	sub r2, r2, r5
	lsl r2, r2, #1
	bl MIi_CpuClear16
_02003D9A:
	cmp r7, #0
	beq _02003DA2
	cmp r7, #2
	bne _02003DB6
_02003DA2:
	add r1, r6, r4
	ldr r2, [r1, #4]
	lsl r1, r5, #1
	add r1, r2, r1
	ldr r2, [sp, #4]
	ldr r0, [sp]
	sub r2, r2, r5
	lsl r2, r2, #1
	bl MIi_CpuClear16
_02003DB6:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02003D5C

	thumb_func_start sub_02003DBC
sub_02003DBC: ; 0x02003DBC
	push {r3, lr}
	cmp r2, #1
	bne _02003DCE
	mov r2, #0x14
	mul r2, r1
	ldr r1, [r0, r2]
	lsl r0, r3, #1
	ldrh r0, [r1, r0]
	pop {r3, pc}
_02003DCE:
	cmp r2, #0
	bne _02003DE0
	mov r2, #0x14
	mul r2, r1
	add r0, r0, r2
	ldr r1, [r0, #4]
	lsl r0, r3, #1
	ldrh r0, [r1, r0]
	pop {r3, pc}
_02003DE0:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end sub_02003DBC

	thumb_func_start sub_02003DE8
sub_02003DE8: ; 0x02003DE8
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r0, sp, #0x10
	ldrh r0, [r0, #0x10]
	str r1, [sp, #4]
	add r7, r2, #0
	lsl r1, r0, #0x1b
	lsr r1, r1, #0x1b
	mov ip, r1
	lsl r1, r0, #0x16
	lsl r0, r0, #0x11
	lsr r1, r1, #0x1b
	lsr r0, r0, #0x1b
	mov r2, #0
	mov lr, r1
	str r0, [sp, #8]
	cmp r7, #0
	bls _02003E56
_02003E0E:
	ldr r0, [sp]
	lsl r6, r2, #1
	ldrh r4, [r0, r6]
	lsl r0, r4, #0x1b
	lsr r1, r0, #0x1b
	lsl r0, r4, #0x16
	lsl r4, r4, #0x11
	lsr r5, r4, #0x1b
	ldr r4, [sp, #8]
	lsr r0, r0, #0x1b
	sub r4, r4, r5
	mul r4, r3
	asr r4, r4, #4
	add r4, r5, r4
	lsl r5, r4, #0xa
	mov r4, ip
	sub r4, r4, r1
	mul r4, r3
	asr r4, r4, #4
	add r1, r1, r4
	mov r4, lr
	sub r4, r4, r0
	mul r4, r3
	asr r4, r4, #4
	add r0, r0, r4
	lsl r0, r0, #5
	orr r0, r1
	add r1, r5, #0
	orr r1, r0
	ldr r0, [sp, #4]
	strh r1, [r0, r6]
	add r0, r2, #1
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	cmp r2, r7
	blo _02003E0E
_02003E56:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02003DE8

	thumb_func_start sub_02003E5C
sub_02003E5C: ; 0x02003E5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r2, #0
	add r5, r0, #0
	mov r2, #0x14
	add r6, r1, #0
	mul r6, r2
	str r3, [sp, #4]
	ldr r1, [r5, r6]
	mov r0, #0
	add r4, r5, r6
	cmp r1, #0
	beq _02003E7E
	ldr r1, [r4, #4]
	cmp r1, #0
	beq _02003E7E
	mov r0, #1
_02003E7E:
	cmp r0, #0
	bne _02003E86
	bl GF_AssertFail
_02003E86:
	add r3, sp, #0x10
	ldrh r0, [r3, #0x14]
	add r2, r5, r6
	lsl r1, r7, #1
	str r0, [sp]
	ldr r0, [r4]
	ldr r2, [r2, #4]
	add r0, r0, r1
	add r1, r2, r1
	ldrb r3, [r3, #0x10]
	ldr r2, [sp, #4]
	bl sub_02003DE8
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02003E5C

	thumb_func_start sub_02003EA4
sub_02003EA4: ; 0x02003EA4
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r3, [sp, #8]
	add r6, r0, #0
	add r7, r1, #0
	ldr r0, [sp, #0x20]
	add r5, r2, #0
	mov r1, #0x14
	add r2, r7, #0
	str r0, [sp, #0x20]
	mul r2, r1
	mov r4, #0
	ldr r1, [r6, r2]
	add r0, r4, #0
	cmp r1, #0
	beq _02003ECE
	add r1, r6, r2
	ldr r1, [r1, #4]
	cmp r1, #0
	beq _02003ECE
	mov r0, #1
_02003ECE:
	cmp r0, #0
	bne _02003ED6
	bl GF_AssertFail
_02003ED6:
	cmp r5, #0
	beq _02003F00
_02003EDA:
	mov r0, #1
	tst r0, r5
	beq _02003EF6
	ldr r0, [sp, #8]
	lsl r2, r4, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x20]
	add r1, r7, #0
	str r0, [sp, #4]
	add r0, r6, #0
	lsr r2, r2, #0x10
	mov r3, #0x10
	bl sub_02003E5C
_02003EF6:
	lsl r0, r5, #0xf
	lsr r5, r0, #0x10
	add r4, #0x10
	cmp r5, #0
	bne _02003EDA
_02003F00:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02003EA4

	thumb_func_start sub_02003F04
sub_02003F04: ; 0x02003F04
	push {r4, r5, r6, r7}
	mov r7, #0
	cmp r1, #0
	ble _02003F46
	mov r2, #0x97
_02003F0E:
	ldrh r6, [r0]
	mov r3, #0x1f
	add r7, r7, #1
	asr r4, r6, #0xa
	and r4, r3
	add r5, r4, #0
	mov r3, #0x1d
	mul r5, r3
	mov r3, #0x1f
	and r3, r6
	mov r4, #0x4c
	mul r4, r3
	asr r6, r6, #5
	mov r3, #0x1f
	and r3, r6
	add r6, r3, #0
	mul r6, r2
	add r3, r4, r6
	add r3, r5, r3
	asr r5, r3, #8
	lsl r4, r5, #0xa
	lsl r3, r5, #5
	orr r3, r4
	orr r3, r5
	strh r3, [r0]
	add r0, r0, #2
	cmp r7, r1
	blt _02003F0E
_02003F46:
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
	thumb_func_end sub_02003F04

	thumb_func_start TintPalette_CustomTone
TintPalette_CustomTone: ; 0x02003F4C
	push {r3, r4, r5, r6, r7, lr}
	mov lr, r1
	mov ip, r2
	add r7, r3, #0
	mov r4, #0
	cmp r1, #0
	ble _02003FC4
	ldr r6, [sp, #0x18]
_02003F5C:
	ldrh r3, [r0]
	mov r1, #0x1f
	add r2, r3, #0
	asr r5, r3, #0xa
	and r2, r1
	and r5, r1
	mov r1, #0x1d
	mul r1, r5
	mov r5, #0x4c
	mul r5, r2
	asr r3, r3, #5
	mov r2, #0x1f
	and r3, r2
	mov r2, #0x97
	mul r2, r3
	add r2, r5, r2
	add r1, r1, r2
	asr r3, r1, #8
	mov r1, ip
	add r2, r1, #0
	mul r2, r3
	lsl r1, r2, #0x10
	lsr r1, r1, #0x10
	asr r2, r1, #8
	add r1, r7, #0
	mul r1, r3
	mul r3, r6
	lsl r1, r1, #0x10
	lsl r3, r3, #0x10
	lsr r1, r1, #0x10
	lsr r3, r3, #0x10
	asr r1, r1, #8
	asr r3, r3, #8
	cmp r2, #0x1f
	ble _02003FA4
	mov r2, #0x1f
_02003FA4:
	cmp r1, #0x1f
	ble _02003FAA
	mov r1, #0x1f
_02003FAA:
	cmp r3, #0x1f
	ble _02003FB0
	mov r3, #0x1f
_02003FB0:
	lsl r3, r3, #0xa
	lsl r1, r1, #5
	orr r1, r3
	orr r1, r2
	strh r1, [r0]
	add r4, r4, #1
	mov r1, lr
	add r0, r0, #2
	cmp r4, r1
	blt _02003F5C
_02003FC4:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end TintPalette_CustomTone

	thumb_func_start sub_02003FC8
sub_02003FC8: ; 0x02003FC8
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	add r2, sp, #4
	bl GfGfxLoader_GetPlttData
	add r4, r0, #0
	bne _02003FE0
	bl GF_AssertFail
_02003FE0:
	ldr r0, [sp, #0x1c]
	cmp r0, #0
	bne _02003FEC
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	str r0, [sp, #0x1c]
_02003FEC:
	ldr r0, [sp, #0x2c]
	ldr r2, [sp, #0x24]
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x28]
	ldr r0, [r0, #0xc]
	mov r1, #0x10
	bl TintPalette_CustomTone
	ldr r0, [sp, #0x1c]
	add r3, sp, #8
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp]
	ldr r1, [sp, #4]
	ldrh r3, [r3, #0x18]
	ldr r1, [r1, #0xc]
	ldr r2, [sp, #0x18]
	add r0, r5, #0
	bl PaletteData_LoadPalette
	add r0, r4, #0
	bl FreeToHeap
	add sp, #8
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02003FC8

	thumb_func_start sub_02004020
sub_02004020: ; 0x02004020
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [sp, #0x28]
	str r1, [sp, #4]
	str r0, [sp, #0x28]
	ldr r0, [sp, #0x2c]
	add r7, r2, #0
	str r0, [sp, #0x2c]
	ldr r0, [sp, #0x30]
	add r6, r3, #0
	str r0, [sp, #0x30]
	mov r0, #0
	str r0, [sp, #0xc]
_0200403C:
	ldr r0, [sp]
	mov r1, #0x1f
	ldrh r0, [r0]
	asr r2, r0, #5
	add r4, r0, #0
	add r5, r2, #0
	and r4, r1
	and r5, r1
	asr r1, r0, #0xa
	mov r0, #0x1f
	and r0, r1
	str r0, [sp, #8]
	ldr r0, [sp, #0x28]
	add r1, r7, #0
	sub r0, r0, r4
	mul r0, r6
	bl _s32_div_f
	add r4, r4, r0
	ldr r0, [sp, #0x2c]
	add r1, r7, #0
	sub r0, r0, r5
	mul r0, r6
	bl _s32_div_f
	add r5, r5, r0
	ldr r1, [sp, #0x30]
	ldr r0, [sp, #8]
	sub r0, r1, r0
	mul r0, r6
	add r1, r7, #0
	bl _s32_div_f
	ldr r1, [sp, #8]
	add r0, r1, r0
	lsl r1, r0, #0xa
	lsl r0, r5, #5
	orr r0, r1
	add r1, r4, #0
	orr r1, r0
	ldr r0, [sp, #4]
	strh r1, [r0]
	ldr r0, [sp]
	add r0, r0, #2
	str r0, [sp]
	ldr r0, [sp, #4]
	add r0, r0, #2
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	add r0, r0, #1
	str r0, [sp, #0xc]
	cmp r0, #0x10
	blt _0200403C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02004020

	thumb_func_start sub_020040AC
sub_020040AC: ; 0x020040AC
	push {r4, r5, r6, r7, lr}
	sub sp, #0x24
	add r7, r2, #0
	mov r2, #0x46
	add r5, r0, #0
	ldr r0, [sp, #0x38]
	lsl r2, r2, #2
	str r1, [sp, #0xc]
	str r0, [sp, #0x38]
	ldrh r1, [r5, r2]
	mov r0, #3
	str r3, [sp, #0x10]
	bic r1, r0
	mov r0, #1
	orr r0, r1
	strh r0, [r5, r2]
	add r0, r2, #2
	ldr r1, [sp, #0xc]
	ldrh r0, [r5, r0]
	ldr r3, _02004170 ; =0xFFFFC000
	lsl r1, r1, #0x10
	lsr r4, r1, #0x10
	lsr r1, r3, #0x12
	and r0, r3
	and r1, r4
	orr r1, r0
	add r0, r2, #2
	strh r1, [r5, r0]
	add r0, sp, #0x28
	ldrh r2, [r0, #0x14]
	mov r1, #0x1f
	add r0, r2, #0
	and r0, r1
	str r0, [sp, #0x1c]
	asr r0, r2, #5
	and r0, r1
	str r0, [sp, #0x18]
	asr r0, r2, #0xa
	and r0, r1
	str r0, [sp, #0x14]
	mov r0, #0
	str r0, [sp, #0x20]
_02004100:
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _0200415E
	ldr r1, [sp, #0xc]
	ldr r0, [sp, #0x20]
	asr r1, r0
	mov r0, #1
	tst r1, r0
	beq _0200415E
	mov r6, #0
	strh r7, [r5, #0xc]
	lsl r0, r0, #9
	str r0, [r5, #8]
	add r4, r6, #0
_0200411C:
	add r1, r7, #0
	asr r1, r6
	mov r0, #1
	tst r0, r1
	beq _02004146
	ldr r0, [sp, #0x1c]
	lsl r1, r4, #1
	str r0, [sp]
	ldr r0, [sp, #0x18]
	ldr r3, [sp, #0x38]
	str r0, [sp, #4]
	ldr r0, [sp, #0x14]
	str r0, [sp, #8]
	ldr r0, [r5]
	ldr r2, [r5, #4]
	add r0, r0, r1
	add r1, r2, r1
	ldr r2, [sp, #0x10]
	bl sub_02004020
	b _02004156
_02004146:
	ldr r0, [r5]
	lsl r1, r4, #1
	ldr r2, [r5, #4]
	add r0, r0, r1
	add r1, r2, r1
	mov r2, #0x20
	bl MIi_CpuCopyFast
_02004156:
	add r6, r6, #1
	add r4, #0x10
	cmp r6, #0x10
	blt _0200411C
_0200415E:
	ldr r0, [sp, #0x20]
	add r5, #0x14
	add r0, r0, #1
	str r0, [sp, #0x20]
	cmp r0, #0xe
	blt _02004100
	add sp, #0x24
	pop {r4, r5, r6, r7, pc}
	nop
_02004170: .word 0xFFFFC000
	thumb_func_end sub_020040AC
