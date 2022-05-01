	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov122_021E5900
ov122_021E5900: ; 0x021E5900
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x18]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5]
	mov r1, #6
	str r0, [sp, #0xc]
	ldr r0, [r5, #0x14]
	ldr r2, [r5, #0x18]
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8770
	add r6, r0, #0
	ldr r0, [r5, #8]
	bl CheckCoins
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r5, #0
	mov r1, #1
	add r2, r6, #0
	bl ov122_021E6B6C
	add r0, r5, #0
	mov r1, #0
	add r2, r4, #0
	bl ov122_021E6B6C
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #0
	bl sub_0200DCE8
	add r0, r5, #0
	bl ov122_021E7540
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E5900

	thumb_func_start ov122_021E5974
ov122_021E5974: ; 0x021E5974
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #8
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	add r3, r4, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #4
	mov r2, #8
	add r3, #0xc4
	bl ov122_021E767C
	mov r1, #0
	add r3, r4, #0
	str r1, [sp]
	add r0, r4, #0
	mov r2, #0xb
	add r3, #0xd4
	str r1, [sp, #4]
	bl ov122_021E767C
	mov r1, #0
	add r3, r4, #0
	str r1, [sp]
	add r0, r4, #0
	mov r2, #0xc
	add r3, #0xe4
	str r1, [sp, #4]
	bl ov122_021E767C
	mov r1, #0
	add r0, r4, #0
	add r4, #0xf4
	str r1, [sp]
	mov r2, #0xd
	add r3, r4, #0
	str r1, [sp, #4]
	bl ov122_021E767C
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E5974

	thumb_func_start ov122_021E59EC
ov122_021E59EC: ; 0x021E59EC
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #7
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r2, #9
	add r3, r2, #0
	mov r1, #0
	add r3, #0xfb
	str r1, [sp]
	add r0, r4, #0
	add r3, r4, r3
	str r1, [sp, #4]
	bl ov122_021E767C
	add sp, #0x10
	pop {r4, pc}
	thumb_func_end ov122_021E59EC

	thumb_func_start ov122_021E5A2C
ov122_021E5A2C: ; 0x021E5A2C
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	mov r1, #5
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #9
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	mov r3, #0x45
	str r0, [sp]
	lsl r3, r3, #2
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #4
	mov r2, #6
	add r3, r4, r3
	bl ov122_021E767C
	mov r3, #0x49
	mov r1, #0
	lsl r3, r3, #2
	str r1, [sp]
	add r0, r4, #0
	mov r2, #0xa
	add r3, r4, r3
	str r1, [sp, #4]
	bl ov122_021E767C
	mov r0, #0x5e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x5f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E5A2C

	thumb_func_start ov122_021E5A9C
ov122_021E5A9C: ; 0x021E5A9C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E5AB2
	cmp r0, #1
	beq _021E5ACE
	b _021E5ADC
_021E5AB2:
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov122_021E7888
	add r0, r4, #0
	add r1, r6, #0
	mov r2, #1
	bl ov122_021E7770
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E5ADC
_021E5ACE:
	add r0, r4, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E5ADC
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E5ADC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E5A9C

	thumb_func_start ov122_021E5AE0
ov122_021E5AE0: ; 0x021E5AE0
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E5AFC
	cmp r0, #1
	beq _021E5B1A
	cmp r0, #2
	beq _021E5B44
	b _021E5B52
_021E5AFC:
	mov r0, #4
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r1, [r4]
	mov r3, #0
	str r1, [sp, #8]
	mov r1, #0x14
	add r2, r1, #0
	bl BeginNormalPaletteFade
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E5B56
_021E5B1A:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5B56
	add r0, r4, #0
	blx r6
	mov r0, #4
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r1, [r4]
	mov r3, #0
	str r1, [sp, #8]
	mov r1, #0x15
	add r2, r1, #0
	bl BeginNormalPaletteFade
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E5B56
_021E5B44:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E5B56
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_021E5B52:
	bl GF_AssertFail
_021E5B56:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov122_021E5AE0

	thumb_func_start ov122_021E5B5C
ov122_021E5B5C: ; 0x021E5B5C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E5B70
	cmp r0, #1
	beq _021E5B8C
	b _021E5B9E
_021E5B70:
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5B7E
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5B7E:
	add r0, r4, #0
	bl ov122_021E71A8
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E5BA2
_021E5B8C:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200DCA0
	cmp r0, #0
	bne _021E5BA2
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5B9E:
	bl GF_AssertFail
_021E5BA2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E5B5C

	thumb_func_start ov122_021E5BA8
ov122_021E5BA8: ; 0x021E5BA8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #8]
	bl CheckCoins
	ldr r1, _021E5BDC ; =0x0000C350
	cmp r0, r1
	blo _021E5BCE
	add r0, r4, #0
	mov r1, #0xe
	mov r2, #1
	bl ov122_021E7770
	ldr r1, _021E5BE0 ; =0x0000FFFE
	add r0, r5, #0
	bl ov122_021E8488
	b _021E5BD6
_021E5BCE:
	add r0, r5, #0
	mov r1, #1
	bl ov122_021E8488
_021E5BD6:
	mov r0, #1
	pop {r3, r4, r5, pc}
	nop
_021E5BDC: .word 0x0000C350
_021E5BE0: .word 0x0000FFFE
	thumb_func_end ov122_021E5BA8

	thumb_func_start ov122_021E5BE4
ov122_021E5BE4: ; 0x021E5BE4
	push {r3, lr}
	add r0, r1, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E5BF4
	mov r0, #1
	pop {r3, pc}
_021E5BF4:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov122_021E5BE4

	thumb_func_start ov122_021E5BF8
ov122_021E5BF8: ; 0x021E5BF8
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r0, #0x91
	add r5, r1, #0
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8504
	add r0, r4, #0
	mov r1, #2
	bl ov122_021E8488
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r1, [r5, r0]
	cmp r1, #0
	bne _021E5C22
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_021E5C22:
	add r0, #0x14
	ldr r0, [r5, r0]
	bl ov122_021E87A0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0
	bl ov122_021E7854
	mov r1, #0
	str r1, [sp]
	add r3, r5, #0
	ldr r0, _021E5CA0 ; =0x000F0100
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r5, #0
	add r2, r1, #0
	add r3, #0x64
	bl ov122_021E769C
	ldr r0, [r5, #0x18]
	mov r1, #5
	bl BgCommitTilemapBufferToVram
	mov r1, #0
	mov r0, #0x40
	add r2, r1, #0
	bl sub_02004EC4
	cmp r4, #0
	beq _021E5C98
	ble _021E5C7E
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov122_021E7888
	add r0, r5, #0
	mov r1, #0x29
	mov r2, #1
	bl ov122_021E7770
	ldr r0, _021E5CA4 ; =0x00000938
	bl PlaySE
	b _021E5C98
_021E5C7E:
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov122_021E7888
	add r0, r5, #0
	mov r1, #0x2b
	mov r2, #1
	bl ov122_021E7770
	ldr r0, _021E5CA8 ; =0x0000093A
	bl PlaySE
_021E5C98:
	mov r0, #1
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E5CA0: .word 0x000F0100
_021E5CA4: .word 0x00000938
_021E5CA8: .word 0x0000093A
	thumb_func_end ov122_021E5BF8

	thumb_func_start ov122_021E5CAC
ov122_021E5CAC: ; 0x021E5CAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov122_021E84B4
	mov r1, #0x23
	lsl r1, r1, #4
	ldr r1, [r4, r1]
	cmp r1, #0
	bne _021E5CC4
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5CC4:
	cmp r0, #0
	beq _021E5CCE
	cmp r0, #1
	beq _021E5D0C
	b _021E5D1A
_021E5CCE:
	add r0, r4, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E5D1E
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E87A0
	cmp r0, #0
	ble _021E5D08
	mov r0, #0x8d
	lsl r0, r0, #2
	ldr r1, [r4, r0]
	cmp r1, #0
	beq _021E5CF4
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5CF4:
	mov r2, #1
	str r2, [r4, r0]
	add r0, r4, #0
	mov r1, #0x2a
	bl ov122_021E7770
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E5D1E
_021E5D08:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5D0C:
	add r0, r4, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E5D1E
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5D1A:
	bl GF_AssertFail
_021E5D1E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E5CAC

	thumb_func_start ov122_021E5D24
ov122_021E5D24: ; 0x021E5D24
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E5D38
	cmp r0, #1
	beq _021E5D46
	b _021E5D68
_021E5D38:
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	add r0, r5, #0
	bl ov122_021E84C8
_021E5D46:
	ldr r0, _021E5D70 ; =0x00000938
	bl IsSEPlaying
	cmp r0, #0
	beq _021E5D5A
	ldr r0, _021E5D74 ; =0x00000939
	bl IsSEPlaying
	cmp r0, #0
	bne _021E5D6C
_021E5D5A:
	mov r1, #0
	mov r0, #0x46
	add r2, r1, #0
	bl sub_02004EC4
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5D68:
	bl GF_AssertFail
_021E5D6C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5D70: .word 0x00000938
_021E5D74: .word 0x00000939
	thumb_func_end ov122_021E5D24

	thumb_func_start ov122_021E5D78
ov122_021E5D78: ; 0x021E5D78
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	bne _021E5D90
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov122_021E7888
_021E5D90:
	add r0, r4, #0
	mov r1, #0
	bl ov122_021E7854
	mov r0, #0x23
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E5DA6
	mov r2, #0x10
	b _021E5DA8
_021E5DA6:
	mov r2, #0xf
_021E5DA8:
	add r0, r5, #0
	add r1, r4, #0
	bl ov122_021E5A9C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E5D78

	thumb_func_start ov122_021E5DB4
ov122_021E5DB4: ; 0x021E5DB4
	push {r3, lr}
	add r0, r1, #0
	mov r1, #0
	bl ov122_021E7488
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov122_021E5DB4

	thumb_func_start ov122_021E5DC4
ov122_021E5DC4: ; 0x021E5DC4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	bl ov122_021E7514
	add r0, r0, #2
	cmp r0, #4
	bhi _021E5E1A
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5DE2: ; jump table
	.short _021E5E0E - _021E5DE2 - 2 ; case 0
	.short _021E5E1E - _021E5DE2 - 2 ; case 1
	.short _021E5DEC - _021E5DE2 - 2 ; case 2
	.short _021E5E02 - _021E5DE2 - 2 ; case 3
	.short _021E5E0E - _021E5DE2 - 2 ; case 4
_021E5DEC:
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov122_021E78B4
	add r0, r4, #0
	mov r1, #7
	bl ov122_021E8488
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5E02:
	add r0, r4, #0
	mov r1, #3
	bl ov122_021E8488
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5E0E:
	ldr r1, _021E5E24 ; =0x0000FFFE
	add r0, r4, #0
	bl ov122_021E8488
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5E1A:
	bl GF_AssertFail
_021E5E1E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E5E24: .word 0x0000FFFE
	thumb_func_end ov122_021E5DC4

	thumb_func_start ov122_021E5E28
ov122_021E5E28: ; 0x021E5E28
	ldr r3, _021E5E30 ; =ov122_021E5A9C
	mov r2, #0x14
	bx r3
	nop
_021E5E30: .word ov122_021E5A9C
	thumb_func_end ov122_021E5E28

	thumb_func_start ov122_021E5E34
ov122_021E5E34: ; 0x021E5E34
	push {r3, lr}
	add r0, r1, #0
	mov r1, #1
	bl ov122_021E7488
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov122_021E5E34

	thumb_func_start ov122_021E5E44
ov122_021E5E44: ; 0x021E5E44
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl ov122_021E7514
	add r0, r0, #2
	cmp r0, #5
	bhi _021E5E9C
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5E60: ; jump table
	.short _021E5E90 - _021E5E60 - 2 ; case 0
	.short _021E5EA0 - _021E5E60 - 2 ; case 1
	.short _021E5E6C - _021E5E60 - 2 ; case 2
	.short _021E5E78 - _021E5E60 - 2 ; case 3
	.short _021E5E84 - _021E5E60 - 2 ; case 4
	.short _021E5E90 - _021E5E60 - 2 ; case 5
_021E5E6C:
	add r0, r4, #0
	mov r1, #4
	bl ov122_021E8488
	mov r0, #1
	pop {r4, pc}
_021E5E78:
	add r0, r4, #0
	mov r1, #5
	bl ov122_021E8488
	mov r0, #1
	pop {r4, pc}
_021E5E84:
	add r0, r4, #0
	mov r1, #6
	bl ov122_021E8488
	mov r0, #1
	pop {r4, pc}
_021E5E90:
	add r0, r4, #0
	mov r1, #2
	bl ov122_021E8488
	mov r0, #1
	pop {r4, pc}
_021E5E9C:
	bl GF_AssertFail
_021E5EA0:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov122_021E5E44

	thumb_func_start ov122_021E5EA4
ov122_021E5EA4: ; 0x021E5EA4
	ldr r3, _021E5EAC ; =ov122_021E5AE0
	ldr r2, _021E5EB0 ; =ov122_021E5974
	bx r3
	nop
_021E5EAC: .word ov122_021E5AE0
_021E5EB0: .word ov122_021E5974
	thumb_func_end ov122_021E5EA4

	thumb_func_start ov122_021E5EB4
ov122_021E5EB4: ; 0x021E5EB4
	ldr r3, _021E5EBC ; =ov122_021E5A9C
	mov r2, #0x19
	bx r3
	nop
_021E5EBC: .word ov122_021E5A9C
	thumb_func_end ov122_021E5EB4

	thumb_func_start ov122_021E5EC0
ov122_021E5EC0: ; 0x021E5EC0
	ldr r3, _021E5EC8 ; =ov122_021E5AE0
	ldr r2, _021E5ECC ; =ov122_021E59EC
	bx r3
	nop
_021E5EC8: .word ov122_021E5AE0
_021E5ECC: .word ov122_021E59EC
	thumb_func_end ov122_021E5EC0

	thumb_func_start ov122_021E5ED0
ov122_021E5ED0: ; 0x021E5ED0
	ldr r3, _021E5ED8 ; =ov122_021E5A9C
	mov r2, #0x1a
	bx r3
	nop
_021E5ED8: .word ov122_021E5A9C
	thumb_func_end ov122_021E5ED0

	thumb_func_start ov122_021E5EDC
ov122_021E5EDC: ; 0x021E5EDC
	ldr r3, _021E5EE4 ; =ov122_021E5AE0
	ldr r2, _021E5EE8 ; =ov122_021E5A2C
	bx r3
	nop
_021E5EE4: .word ov122_021E5AE0
_021E5EE8: .word ov122_021E5A2C
	thumb_func_end ov122_021E5EDC

	thumb_func_start ov122_021E5EEC
ov122_021E5EEC: ; 0x021E5EEC
	ldr r3, _021E5EF4 ; =ov122_021E5A9C
	mov r2, #0x1b
	bx r3
	nop
_021E5EF4: .word ov122_021E5A9C
	thumb_func_end ov122_021E5EEC

	thumb_func_start ov122_021E5EF8
ov122_021E5EF8: ; 0x021E5EF8
	push {r4, lr}
	ldr r2, _021E5F18 ; =ov122_021E5900
	add r4, r0, #0
	bl ov122_021E5AE0
	cmp r0, #0
	beq _021E5F12
	add r0, r4, #0
	mov r1, #3
	bl ov122_021E8488
	mov r0, #1
	pop {r4, pc}
_021E5F12:
	mov r0, #0
	pop {r4, pc}
	nop
_021E5F18: .word ov122_021E5900
	thumb_func_end ov122_021E5EF8

	thumb_func_start ov122_021E5F1C
ov122_021E5F1C: ; 0x021E5F1C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	bl ov122_021E7094
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov122_021E8D8C
	add r0, r5, #0
	mov r1, #8
	bl ov122_021E8488
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end ov122_021E5F1C

	thumb_func_start ov122_021E5F48
ov122_021E5F48: ; 0x021E5F48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #9
	add r4, r1, #0
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8D74
	cmp r0, #4
	bhi _021E5FF4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E5F68: ; jump table
	.short _021E5FF8 - _021E5F68 - 2 ; case 0
	.short _021E5F72 - _021E5F68 - 2 ; case 1
	.short _021E5FD6 - _021E5F68 - 2 ; case 2
	.short _021E5FD6 - _021E5F68 - 2 ; case 3
	.short _021E5FA0 - _021E5F68 - 2 ; case 4
_021E5F72:
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8DF0
	add r1, r0, #0
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E8630
	cmp r0, #0
	beq _021E5F94
	ldr r0, _021E5FFC ; =0x000005F3
	bl PlaySE
	b _021E5FF8
_021E5F94:
	add r0, r5, #0
	mov r1, #9
	bl ov122_021E8488
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5FA0:
	ldr r0, _021E6000 ; =0x000005DC
	bl PlaySE
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #6
	bl sub_0200DC4C
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8E70
	cmp r0, #0
	beq _021E5FCA
	add r0, r5, #0
	mov r1, #0xd
	bl ov122_021E8488
	b _021E5FD2
_021E5FCA:
	add r0, r5, #0
	mov r1, #0xe
	bl ov122_021E8488
_021E5FD2:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5FD6:
	ldr r0, _021E6004 ; =0x000005DD
	bl PlaySE
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl sub_0200DC4C
	add r0, r5, #0
	mov r1, #0xf
	bl ov122_021E8488
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E5FF4:
	bl GF_AssertFail
_021E5FF8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E5FFC: .word 0x000005F3
_021E6000: .word 0x000005DC
_021E6004: .word 0x000005DD
	thumb_func_end ov122_021E5F48

	thumb_func_start ov122_021E6008
ov122_021E6008: ; 0x021E6008
	push {r3, lr}
	add r0, r1, #0
	bl ov122_021E7F70
	cmp r0, #0
	beq _021E6018
	mov r0, #1
	pop {r3, pc}
_021E6018:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov122_021E6008

	thumb_func_start ov122_021E601C
ov122_021E601C: ; 0x021E601C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r5, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E6032
	cmp r0, #1
	beq _021E6116
	b _021E612E
_021E6032:
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl ov122_021E8DF0
	mov r1, #5
	add r4, r0, #0
	bl _s32_div_f
	lsl r0, r1, #0x10
	asr r6, r0, #0x10
	add r0, r4, #0
	mov r1, #5
	bl _s32_div_f
	lsl r0, r0, #0x10
	asr r4, r0, #0x10
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8784
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8778
	mov r0, #0x91
	lsl r0, r0, #2
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	mov r1, #0
	lsr r2, r2, #0x18
	bl ov122_021E86E0
	add r7, r0, #0
	mov r0, #0x91
	lsl r0, r0, #2
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #1
	lsr r2, r2, #0x18
	bl ov122_021E86E0
	str r0, [sp, #4]
	mov r0, #0x91
	lsl r0, r0, #2
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	mov r1, #0
	lsr r2, r2, #0x18
	bl ov122_021E86A8
	mov r0, #0x91
	lsl r0, r0, #2
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #1
	lsr r2, r2, #0x18
	bl ov122_021E86A8
	cmp r7, #0
	beq _021E610E
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _021E610E
	bl MTRandom
	mov r0, #0x91
	lsl r0, r0, #2
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	mov r1, #0
	lsr r2, r2, #0x18
	bl ov122_021E871C
	add r6, r0, #0
	mov r0, #0x91
	lsl r0, r0, #2
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #1
	lsr r2, r2, #0x18
	bl ov122_021E871C
	add r4, r0, #0
	mov r0, #0x64
	mov r1, #5
	mul r0, r7
	sub r1, r1, r6
	bl _s32_div_f
	cmp r0, #0x4b
	bge _021E6100
	ldr r1, [sp, #4]
	mov r0, #0x64
	mul r0, r1
	mov r1, #5
	sub r1, r1, r4
	bl _s32_div_f
	cmp r0, #0x4b
	blt _021E610E
_021E6100:
	add r0, r5, #0
	mov r1, #0x1d
	bl ov122_021E76F4
	ldr r0, _021E6134 ; =0x000004B4
	bl PlayFanfare
_021E610E:
	ldr r0, [sp]
	bl ov122_021E84C8
	b _021E612E
_021E6116:
	ldr r0, _021E6138 ; =0x00000927
	bl IsSEPlaying
	cmp r0, #0
	bne _021E612E
	bl IsFanfarePlaying
	cmp r0, #0
	bne _021E612E
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E612E:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6134: .word 0x000004B4
_021E6138: .word 0x00000927
	thumb_func_end ov122_021E601C

	thumb_func_start ov122_021E613C
ov122_021E613C: ; 0x021E613C
	push {r4, lr}
	mov r0, #9
	add r4, r1, #0
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8DF0
	add r1, r0, #0
	mov r0, #0x92
	lsl r0, r0, #2
	add r0, r4, r0
	mov r2, #0
	add r3, r4, #0
	bl ov122_021E70B8
	ldr r0, _021E6164 ; =0x0000092C
	bl PlaySE
	mov r0, #1
	pop {r4, pc}
	.balign 4, 0
_021E6164: .word 0x0000092C
	thumb_func_end ov122_021E613C

	thumb_func_start ov122_021E6168
ov122_021E6168: ; 0x021E6168
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #4
	bls _021E617A
	b _021E6342
_021E617A:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E6186: ; jump table
	.short _021E6190 - _021E6186 - 2 ; case 0
	.short _021E61A8 - _021E6186 - 2 ; case 1
	.short _021E62C8 - _021E6186 - 2 ; case 2
	.short _021E62D8 - _021E6186 - 2 ; case 3
	.short _021E6314 - _021E6186 - 2 ; case 4
_021E6190:
	mov r0, #0x92
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov122_021E7168
	cmp r0, #0
	bne _021E61A0
	b _021E6346
_021E61A0:
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E6346
_021E61A8:
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8DF0
	add r6, r0, #0
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r6, #0
	bl ov122_021E8668
	add r7, r0, #0
	add r0, r6, #0
	mov r1, #5
	bl _s32_div_f
	lsl r0, r1, #2
	add r0, r0, #1
	lsl r0, r0, #0x10
	asr r0, r0, #0xd
	add r0, #0xc
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #5
	bl _s32_div_f
	lsl r0, r0, #2
	add r0, r0, #1
	lsl r0, r0, #0x10
	asr r0, r0, #0xd
	add r0, #0xc
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp, #8]
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r6, #0
	bl ov122_021E85F4
	cmp r7, #4
	bne _021E6230
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	bl sub_0200DDB8
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DC4C
	ldr r0, _021E634C ; =0x00000929
	bl PlaySE
	b _021E62C0
_021E6230:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E8770
	add r6, r0, #0
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r7, #0
	bl ov122_021E8594
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E8770
	mov r1, #0
	str r0, [sp, #0x10]
	mov r0, #0x61
	str r1, [sp]
	mov r3, #1
	str r3, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r2, r7, #0
	bl BufferIntegerAsString
	mov r0, #0
	str r0, [sp]
	mov r1, #1
	mov r0, #0x61
	str r1, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [sp, #0x10]
	mov r3, #5
	bl BufferIntegerAsString
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	ldr r1, [sp, #0xc]
	ldr r2, [sp, #8]
	bl sub_0200DDB8
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DC4C
	cmp r6, #0
	bne _021E62A6
	add r0, r4, #0
	mov r1, #0x1e
	bl ov122_021E76F4
	b _021E62C0
_021E62A6:
	add r0, r4, #0
	bl ov122_021E7FA8
	cmp r0, #1
	ble _021E62BA
	add r0, r4, #0
	mov r1, #0x1f
	bl ov122_021E76F4
	b _021E62C0
_021E62BA:
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E62C0:
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E6346
_021E62C8:
	bl GF_IsAnySEPlaying
	cmp r0, #0
	bne _021E6346
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E6346
_021E62D8:
	add r0, r4, #0
	bl ov122_021E7FA8
	cmp r0, #4
	bne _021E6302
	ldr r0, _021E6350 ; =0x000004B5
	bl PlayFanfare
	add r0, r4, #0
	mov r1, #0x20
	bl ov122_021E76F4
	add r0, r4, #0
	mov r1, #1
	mov r2, #0
	bl ov122_021E6B6C
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E6346
_021E6302:
	add r0, r4, #0
	bl ov122_021E69EC
	cmp r0, #0
	beq _021E6346
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E6346
_021E6314:
	add r0, r4, #0
	bl ov122_021E7FA8
	cmp r0, #4
	bne _021E632C
	bl IsFanfarePlaying
	cmp r0, #0
	bne _021E6346
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E632C:
	bl System_GetTouchNew
	cmp r0, #0
	bne _021E633C
	ldr r0, _021E6354 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _021E6346
_021E633C:
	add sp, #0x14
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021E6342:
	bl GF_AssertFail
_021E6346:
	mov r0, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E634C: .word 0x00000929
_021E6350: .word 0x000004B5
_021E6354: .word gSystem
	thumb_func_end ov122_021E6168

	thumb_func_start ov122_021E6358
ov122_021E6358: ; 0x021E6358
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	bl ov122_021E7FA8
	cmp r0, #4
	bne _021E637E
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #3
	bl ov122_021E858C
	add r0, r5, #0
	mov r1, #0xc
	bl ov122_021E8488
	b _021E639E
_021E637E:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E863C
	cmp r0, #0
	beq _021E6396
	add r0, r5, #0
	mov r1, #0xa
	bl ov122_021E8488
	b _021E639E
_021E6396:
	add r0, r5, #0
	mov r1, #8
	bl ov122_021E8488
_021E639E:
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E6358

	thumb_func_start ov122_021E63AC
ov122_021E63AC: ; 0x021E63AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E63C0
	cmp r0, #1
	beq _021E63E0
	b _021E640A
_021E63C0:
	add r0, r4, #0
	mov r1, #0x21
	mov r2, #1
	bl ov122_021E7770
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov122_021E7888
	ldr r0, _021E6414 ; =0x000004B3
	bl PlayFanfare
	add r0, r5, #0
	bl ov122_021E84C8
_021E63E0:
	bl IsFanfarePlaying
	cmp r0, #0
	bne _021E640E
	add r0, r4, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E640E
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #2
	bl ov122_021E858C
	add r0, r5, #0
	mov r1, #0xb
	bl ov122_021E8488
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E640A:
	bl GF_AssertFail
_021E640E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E6414: .word 0x000004B3
	thumb_func_end ov122_021E63AC

	thumb_func_start ov122_021E6418
ov122_021E6418: ; 0x021E6418
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E6432
	cmp r0, #1
	beq _021E648A
	cmp r0, #2
	beq _021E649C
	b _021E64D8
_021E6432:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E8770
	mov r1, #0
	add r2, r0, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r3, #5
	bl BufferIntegerAsString
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, #0x10]
	mov r1, #1
	bl BufferPlayersName
	add r0, r4, #0
	mov r1, #0x28
	mov r2, #1
	bl ov122_021E7770
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov122_021E7888
	mov r1, #0
	mov r0, #0x40
	add r2, r1, #0
	bl sub_02004EC4
	ldr r0, _021E64E4 ; =0x0000092A
	bl PlaySE
	add r0, r5, #0
	bl ov122_021E84C8
_021E648A:
	add r0, r4, #0
	bl ov122_021E6A64
	cmp r0, #0
	beq _021E64DC
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E64DC
_021E649C:
	bl GF_IsAnySEPlaying
	cmp r0, #0
	bne _021E64DC
	add r0, r4, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E64DC
	mov r1, #0
	mov r0, #0x46
	add r2, r1, #0
	bl sub_02004EC4
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov122_021E78B4
	add r0, r5, #0
	mov r1, #0xc
	bl ov122_021E8488
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E64D8:
	bl GF_AssertFail
_021E64DC:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_021E64E4: .word 0x0000092A
	thumb_func_end ov122_021E6418

	thumb_func_start ov122_021E64E8
ov122_021E64E8: ; 0x021E64E8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #3
	bhi _021E6584
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E6502: ; jump table
	.short _021E650A - _021E6502 - 2 ; case 0
	.short _021E6528 - _021E6502 - 2 ; case 1
	.short _021E653E - _021E6502 - 2 ; case 2
	.short _021E6566 - _021E6502 - 2 ; case 3
_021E650A:
	mov r0, #0x92
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	mov r2, #1
	add r3, r4, #0
	bl ov122_021E70B8
	ldr r0, _021E658C ; =0x0000092C
	bl PlaySE
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E6588
_021E6528:
	mov r0, #0x92
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov122_021E7168
	cmp r0, #0
	beq _021E6588
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E6588
_021E653E:
	bl System_GetTouchNew
	cmp r0, #0
	bne _021E654E
	ldr r0, _021E6590 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _021E6588
_021E654E:
	mov r0, #0x92
	lsl r0, r0, #2
	add r0, r4, r0
	mov r1, #0
	mov r2, #2
	add r3, r4, #0
	bl ov122_021E70B8
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E6588
_021E6566:
	mov r0, #0x92
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov122_021E7168
	cmp r0, #0
	beq _021E6588
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov122_021E8488
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6584:
	bl GF_AssertFail
_021E6588:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E658C: .word 0x0000092C
_021E6590: .word gSystem
	thumb_func_end ov122_021E64E8

	thumb_func_start ov122_021E6594
ov122_021E6594: ; 0x021E6594
	push {r4, r5, r6, lr}
	mov r0, #0x91
	add r5, r1, #0
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8528
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	mov r1, #0
	bl ov122_021E8D8C
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl ov122_021E8E40
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8770
	add r6, r0, #0
	ldr r0, [r5, #8]
	bl CheckCoins
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	add r0, r5, #0
	mov r1, #1
	add r2, r6, #0
	bl ov122_021E6B6C
	add r0, r5, #0
	mov r1, #0
	add r2, r4, #0
	bl ov122_021E6B6C
	add r0, r5, #0
	bl ov122_021E7094
	mov r1, #0x23
	mov r0, #1
	lsl r1, r1, #4
	str r0, [r5, r1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov122_021E6594

	thumb_func_start ov122_021E65F4
ov122_021E65F4: ; 0x021E65F4
	ldr r3, _021E65F8 ; =ov122_021E5B5C
	bx r3
	.balign 4, 0
_021E65F8: .word ov122_021E5B5C
	thumb_func_end ov122_021E65F4

	thumb_func_start ov122_021E65FC
ov122_021E65FC: ; 0x021E65FC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #9
	add r4, r1, #0
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8D74
	add r5, r0, #0
	cmp r5, #8
	bhi _021E66BA
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E661E: ; jump table
	.short _021E66B2 - _021E661E - 2 ; case 0
	.short _021E6630 - _021E661E - 2 ; case 1
	.short _021E6674 - _021E661E - 2 ; case 2
	.short _021E6650 - _021E661E - 2 ; case 3
	.short _021E6650 - _021E661E - 2 ; case 4
	.short _021E6698 - _021E661E - 2 ; case 5
	.short _021E6698 - _021E661E - 2 ; case 6
	.short _021E6698 - _021E661E - 2 ; case 7
	.short _021E6698 - _021E661E - 2 ; case 8
_021E6630:
	ldr r0, _021E66C4 ; =0x000005DC
	bl PlaySE
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8E70
	cmp r0, #0
	bne _021E66BE
	add r0, r6, #0
	mov r1, #0xe
	bl ov122_021E8488
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E6650:
	ldr r0, _021E66C4 ; =0x000005DC
	bl PlaySE
	mov r0, #0x8e
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, #0xe4
	ldr r0, [r4, r0]
	mov r1, #6
	bl sub_0200DC4C
	add r0, r6, #0
	mov r1, #8
	bl ov122_021E8488
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E6674:
	ldr r0, _021E66C8 ; =0x000005DD
	bl PlaySE
	mov r0, #0x8e
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, #0xe0
	ldr r0, [r4, r0]
	mov r1, #3
	bl sub_0200DC4C
	add r0, r6, #0
	mov r1, #0xf
	bl ov122_021E8488
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E6698:
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8DF0
	sub r2, r5, #5
	lsl r2, r2, #0x18
	add r1, r0, #0
	add r0, r4, #0
	lsr r2, r2, #0x18
	bl ov122_021E7340
	b _021E66BE
_021E66B2:
	add r0, r4, #0
	bl ov122_021E72D0
	b _021E66BE
_021E66BA:
	bl GF_AssertFail
_021E66BE:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_021E66C4: .word 0x000005DC
_021E66C8: .word 0x000005DD
	thumb_func_end ov122_021E65FC

	thumb_func_start ov122_021E66CC
ov122_021E66CC: ; 0x021E66CC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	bne _021E66F0
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov122_021E78DC
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov122_021E8DC8
_021E66F0:
	add r0, r5, #0
	add r1, r4, #0
	bl ov122_021E5B5C
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E66CC

	thumb_func_start ov122_021E66FC
ov122_021E66FC: ; 0x021E66FC
	mov r0, #1
	bx lr
	thumb_func_end ov122_021E66FC

	thumb_func_start ov122_021E6700
ov122_021E6700: ; 0x021E6700
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #9
	add r4, r1, #0
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8D74
	cmp r0, #4
	bhi _021E67C8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E6720: ; jump table
	.short _021E67C0 - _021E6720 - 2 ; case 0
	.short _021E672A - _021E6720 - 2 ; case 1
	.short _021E679C - _021E6720 - 2 ; case 2
	.short _021E677E - _021E6720 - 2 ; case 3
	.short _021E675A - _021E6720 - 2 ; case 4
_021E672A:
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8DF0
	add r6, r0, #0
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8E0C
	add r2, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	bl ov122_021E7340
	cmp r0, #0
	beq _021E67CC
	add r0, r5, #0
	mov r1, #0xd
	bl ov122_021E8488
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E675A:
	ldr r0, _021E67D0 ; =0x000005DC
	bl PlaySE
	mov r0, #0x8e
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, #0xe4
	ldr r0, [r4, r0]
	mov r1, #6
	bl sub_0200DC4C
	add r0, r5, #0
	mov r1, #8
	bl ov122_021E8488
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E677E:
	ldr r0, _021E67D4 ; =0x000005E5
	bl PlaySE
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #0x11
	bl sub_0200DC4C
	add r0, r5, #0
	mov r1, #0xd
	bl ov122_021E8488
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E679C:
	ldr r0, _021E67D8 ; =0x000005DD
	bl PlaySE
	mov r0, #0x8e
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r4, r0]
	sub r0, #0xe0
	ldr r0, [r4, r0]
	mov r1, #3
	bl sub_0200DC4C
	add r0, r5, #0
	mov r1, #0xf
	bl ov122_021E8488
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E67C0:
	add r0, r4, #0
	bl ov122_021E72D0
	b _021E67CC
_021E67C8:
	bl GF_AssertFail
_021E67CC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E67D0: .word 0x000005DC
_021E67D4: .word 0x000005E5
_021E67D8: .word 0x000005DD
	thumb_func_end ov122_021E6700

	thumb_func_start ov122_021E67DC
ov122_021E67DC: ; 0x021E67DC
	mov r0, #1
	bx lr
	thumb_func_end ov122_021E67DC

	thumb_func_start ov122_021E67E0
ov122_021E67E0: ; 0x021E67E0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov122_021E84B4
	cmp r0, #3
	bhi _021E6884
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E67FA: ; jump table
	.short _021E6802 - _021E67FA - 2 ; case 0
	.short _021E680E - _021E67FA - 2 ; case 1
	.short _021E684A - _021E67FA - 2 ; case 2
	.short _021E6866 - _021E67FA - 2 ; case 3
_021E6802:
	add r0, r4, #0
	bl ov122_021E72D0
	add r0, r5, #0
	bl ov122_021E84C8
_021E680E:
	add r0, r4, #0
	bl ov122_021E7F70
	cmp r0, #0
	beq _021E6888
	add r0, r5, #0
	bl ov122_021E84B0
	cmp r0, #0xe
	bne _021E6842
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8E58
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov122_021E8DC8
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov122_021E7904
_021E6842:
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E6888
_021E684A:
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E6862
	add r0, r4, #0
	bl ov122_021E7214
	add r0, r5, #0
	bl ov122_021E84C8
	b _021E6888
_021E6862:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6866:
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200DCA0
	cmp r0, #0
	bne _021E6888
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6884:
	bl GF_AssertFail
_021E6888:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ov122_021E67E0

	thumb_func_start ov122_021E688C
ov122_021E688C: ; 0x021E688C
	push {r4, r5, r6, lr}
	sub sp, #8
	add r6, r0, #0
	add r5, r1, #0
	bl ov122_021E84B4
	cmp r0, #0
	beq _021E68A2
	cmp r0, #1
	beq _021E68E6
	b _021E68F6
_021E68A2:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8770
	add r2, r0, #0
	bne _021E68B4
	mov r4, #0x25
	b _021E68CA
_021E68B4:
	mov r1, #0
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r3, #5
	mov r4, #0x22
	bl BufferIntegerAsString
_021E68CA:
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r5, r0
	bl ov122_021E7888
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #1
	bl ov122_021E7770
	add r0, r6, #0
	bl ov122_021E84C8
	b _021E68FA
_021E68E6:
	add r0, r5, #0
	bl ov122_021E7820
	cmp r0, #0
	beq _021E68FA
	add sp, #8
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E68F6:
	bl GF_AssertFail
_021E68FA:
	mov r0, #0
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E688C

	thumb_func_start ov122_021E6900
ov122_021E6900: ; 0x021E6900
	push {r3, r4, lr}
	sub sp, #0x14
	add r2, sp, #0
	mov r0, #0
	str r0, [r2]
	str r0, [r2, #4]
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	str r0, [r2, #0x10]
	ldr r0, [r1, #0x18]
	add r3, sp, #0
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	mov r0, #0x1f
	str r0, [sp, #8]
	mov r0, #9
	str r0, [sp, #0xc]
	mov r0, #0x19
	strb r0, [r3, #0x10]
	mov r0, #0xa
	strb r0, [r3, #0x11]
	ldrb r4, [r3, #0x12]
	mov r0, #0xf0
	bic r4, r0
	mov r0, #0x4f
	strb r4, [r3, #0x12]
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	add r1, r2, #0
	bl sub_020166FC
	mov r0, #1
	add sp, #0x14
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E6900

	thumb_func_start ov122_021E6948
ov122_021E6948: ; 0x021E6948
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x4f
	add r4, r1, #0
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_020168F4
	cmp r0, #1
	beq _021E6962
	cmp r0, #2
	beq _021E69A6
	b _021E69D8
_021E6962:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E8770
	add r6, r0, #0
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov122_021E858C
	cmp r6, #0
	bne _021E699A
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov122_021E78B4
	add r0, r5, #0
	mov r1, #0xc
	bl ov122_021E8488
	b _021E69A2
_021E699A:
	add r0, r5, #0
	mov r1, #0xb
	bl ov122_021E8488
_021E69A2:
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E69A6:
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl BgClearTilemapBufferAndCommit
	mov r0, #0x97
	lsl r0, r0, #2
	add r0, r4, r0
	bl ov122_021E78B4
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E69CC
	add r0, r5, #0
	mov r1, #0xd
	bl ov122_021E8488
	b _021E69D4
_021E69CC:
	add r0, r5, #0
	mov r1, #8
	bl ov122_021E8488
_021E69D4:
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E69D8:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E6948

	thumb_func_start ov122_021E69DC
ov122_021E69DC: ; 0x021E69DC
	push {r3, lr}
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r1, r0]
	bl sub_020169CC
	mov r0, #1
	pop {r3, pc}
	thumb_func_end ov122_021E69DC

	thumb_func_start ov122_021E69EC
ov122_021E69EC: ; 0x021E69EC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8770
	add r4, r0, #0
	bl System_GetTouchNew
	cmp r0, #0
	bne _021E6A0C
	ldr r0, _021E6A5C ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	beq _021E6A18
_021E6A0C:
	add r0, r5, #0
	mov r1, #1
	add r2, r4, #0
	bl ov122_021E6B6C
	b _021E6A56
_021E6A18:
	mov r0, #0x8b
	lsl r0, r0, #2
	ldrh r0, [r5, r0]
	cmp r4, r0
	bls _021E6A4C
	lsr r2, r0, #0x1f
	lsl r1, r0, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	bne _021E6A36
	ldr r0, _021E6A60 ; =0x0000091E
	bl PlaySE
_021E6A36:
	mov r2, #0x8b
	lsl r2, r2, #2
	ldrh r0, [r5, r2]
	mov r1, #1
	add r0, r0, #1
	strh r0, [r5, r2]
	ldrh r2, [r5, r2]
	add r0, r5, #0
	bl ov122_021E6B6C
	b _021E6A56
_021E6A4C:
	ldr r0, _021E6A60 ; =0x0000091E
	bl PlaySE
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E6A56:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E6A5C: .word gSystem
_021E6A60: .word 0x0000091E
	thumb_func_end ov122_021E69EC

	thumb_func_start ov122_021E6A64
ov122_021E6A64: ; 0x021E6A64
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5, #8]
	bl CheckCoins
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E8770
	add r4, r0, #0
	bl System_GetTouchNew
	cmp r0, #0
	bne _021E6A94
	ldr r0, _021E6B28 ; =gSystem
	ldr r0, [r0, #0x48]
	cmp r0, #0
	bne _021E6A94
	ldr r0, _021E6B2C ; =0x0000C350
	cmp r6, r0
	blo _021E6ACE
_021E6A94:
	mov r0, #0x91
	lsl r0, r0, #2
	lsl r1, r4, #0x18
	ldr r0, [r5, r0]
	lsr r1, r1, #0x18
	bl ov122_021E8610
	ldr r0, [r5, #8]
	add r1, r4, #0
	bl GiveCoins
	ldr r0, _021E6B2C ; =0x0000C350
	add r7, r6, r4
	cmp r7, r0
	ble _021E6AB4
	add r7, r0, #0
_021E6AB4:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0
	bl ov122_021E6B6C
	lsl r2, r7, #0x10
	add r0, r5, #0
	mov r1, #0
	lsr r2, r2, #0x10
	bl ov122_021E6B6C
	mov r0, #0
	b _021E6ADA
_021E6ACE:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	mov r1, #1
	bl ov122_021E8610
_021E6ADA:
	cmp r0, #0
	beq _021E6B18
	ldr r0, [r5, #8]
	mov r1, #1
	bl GiveCoins
	sub r2, r4, #1
	lsl r2, r2, #0x10
	add r0, r5, #0
	mov r1, #1
	lsr r2, r2, #0x10
	bl ov122_021E6B6C
	add r2, r6, #1
	lsl r2, r2, #0x10
	add r0, r5, #0
	mov r1, #0
	lsr r2, r2, #0x10
	bl ov122_021E6B6C
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x1e
	sub r1, r1, r2
	mov r0, #0x1e
	ror r1, r0
	add r0, r2, r1
	bne _021E6B22
	ldr r0, _021E6B30 ; =0x0000092A
	bl PlaySE
	b _021E6B22
_021E6B18:
	ldr r0, _021E6B34 ; =0x0000092B
	bl PlaySE
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E6B22:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6B28: .word gSystem
_021E6B2C: .word 0x0000C350
_021E6B30: .word 0x0000092A
_021E6B34: .word 0x0000092B
	thumb_func_end ov122_021E6A64

	thumb_func_start ov122_021E6B38
ov122_021E6B38: ; 0x021E6B38
	push {r4, r5, r6, r7}
	mov r1, #0
	mov r6, #0x62
	add r3, r1, #0
	lsl r6, r6, #2
_021E6B42:
	ldr r4, _021E6B68 ; =ov122_021E92A0
	mov r2, #0
	add r5, r0, #0
_021E6B48:
	ldrh r7, [r4]
	add r2, r2, #1
	add r4, r4, #2
	add r7, r7, r3
	strh r7, [r5, r6]
	add r5, r5, #2
	cmp r2, #8
	blt _021E6B48
	add r1, r1, #1
	add r3, r3, #2
	add r0, #0x10
	cmp r1, #0xa
	blt _021E6B42
	pop {r4, r5, r6, r7}
	bx lr
	nop
_021E6B68: .word ov122_021E92A0
	thumb_func_end ov122_021E6B38

	thumb_func_start ov122_021E6B6C
ov122_021E6B6C: ; 0x021E6B6C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r1, [sp, #0xc]
	add r7, r0, #0
	ldr r1, _021E6C28 ; =0x00002710
	add r0, r2, #0
	str r2, [sp, #0x10]
	bl _s32_div_f
	add r1, sp, #0x18
	strb r0, [r1]
	mov r1, #0xfa
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	bl _s32_div_f
	mov r1, #0xa
	bl _s32_div_f
	add r0, sp, #0x18
	strb r1, [r0, #1]
	ldr r0, [sp, #0x10]
	mov r1, #0x64
	bl _s32_div_f
	mov r1, #0xa
	bl _s32_div_f
	add r0, sp, #0x18
	strb r1, [r0, #2]
	ldr r0, [sp, #0x10]
	mov r1, #0xa
	bl _s32_div_f
	mov r1, #0xa
	bl _s32_div_f
	add r0, sp, #0x18
	strb r1, [r0, #3]
	ldr r0, [sp, #0x10]
	mov r1, #0xa
	bl _s32_div_f
	add r0, sp, #0x18
	strb r1, [r0, #4]
	mov r0, #0x62
	lsl r0, r0, #2
	add r0, r7, r0
	mov r6, #0
	mov r4, #0x15
	add r5, sp, #0x18
	str r0, [sp, #0x14]
_021E6BD4:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _021E6BDE
	mov r0, #0x13
	b _021E6BE0
_021E6BDE:
	mov r0, #0xe
_021E6BE0:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #4
	str r0, [sp, #8]
	ldrb r2, [r5]
	ldr r0, [r7, #0x18]
	mov r1, #4
	lsl r3, r2, #4
	ldr r2, [sp, #0x14]
	add r2, r2, r3
	lsl r3, r4, #0x18
	lsr r3, r3, #0x18
	bl LoadRectToBgTilemapRect
	add r6, r6, #1
	add r4, r4, #2
	add r5, r5, #1
	cmp r6, #5
	blt _021E6BD4
	ldr r0, [sp, #0xc]
	cmp r0, #0
	beq _021E6C1A
	mov r1, #0x8b
	ldr r0, [sp, #0x10]
	lsl r1, r1, #2
	strh r0, [r7, r1]
_021E6C1A:
	ldr r0, [r7, #0x18]
	mov r1, #4
	bl BgCommitTilemapBufferToVram
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E6C28: .word 0x00002710
	thumb_func_end ov122_021E6B6C

	thumb_func_start ov122_021E6C2C
ov122_021E6C2C: ; 0x021E6C2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	str r1, [sp, #0x10]
	add r0, r2, #0
	str r2, [sp, #0x14]
	bl ov122_021E7FC4
	add r4, r0, #0
	mov r1, #0xc
	mul r4, r1
	ldr r0, [sp, #0x10]
	mov r1, #5
	bl _s32_div_f
	lsl r0, r1, #2
	add r1, r0, #1
	ldr r0, _021E6CC4 ; =ov122_021E9344
	ldr r0, [r0, r4]
	add r7, r1, r0
	ldr r0, [sp, #0x10]
	mov r1, #5
	bl _s32_div_f
	lsl r0, r0, #2
	add r1, r0, #1
	ldr r0, _021E6CC8 ; =ov122_021E9348
	ldr r2, [sp, #0x14]
	ldr r0, [r0, r4]
	add r6, r1, r0
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	ldr r1, [sp, #0x10]
	bl ov122_021E8674
	cmp r0, #0
	beq _021E6C9C
	ldr r0, _021E6CCC ; =ov122_021E934C
	lsl r3, r7, #0x18
	ldr r1, [r0, r4]
	add r0, sp, #0x18
	strh r1, [r0]
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	ldr r0, [r5, #0x18]
	mov r1, #2
	add r2, sp, #0x18
	lsr r3, r3, #0x18
	bl LoadRectToBgTilemapRect
	b _021E6CB8
_021E6C9C:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	lsl r3, r7, #0x18
	ldr r0, [r5, #0x18]
	mov r1, #2
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
_021E6CB8:
	ldr r0, [r5, #0x18]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E6CC4: .word ov122_021E9344
_021E6CC8: .word ov122_021E9348
_021E6CCC: .word ov122_021E934C
	thumb_func_end ov122_021E6C2C

	thumb_func_start ov122_021E6CD0
ov122_021E6CD0: ; 0x021E6CD0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r6, #0
	mov r4, #2
	add r7, sp, #0xc
_021E6CDC:
	mov r0, #0x91
	lsl r0, r0, #2
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	mov r1, #1
	lsr r2, r2, #0x18
	bl ov122_021E86E0
	add r1, r0, #0
	add r1, #0xcb
	strh r1, [r7, #4]
	add r0, #0xeb
	strh r0, [r7, #6]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	ldr r0, [r5, #0x18]
	mov r1, #2
	add r2, sp, #0x10
	mov r3, #0x17
	bl LoadRectToBgTilemapRect
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #5
	blt _021E6CDC
	mov r4, #0
	mov r6, #3
	add r7, sp, #0xc
_021E6D1E:
	mov r0, #0x91
	lsl r0, r0, #2
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #0
	lsr r2, r2, #0x18
	bl ov122_021E86E0
	add r1, r0, #0
	add r1, #0xcb
	strh r1, [r7]
	add r0, #0xeb
	strh r0, [r7, #2]
	mov r0, #0x16
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #2
	str r0, [sp, #8]
	lsl r3, r6, #0x18
	ldr r0, [r5, #0x18]
	mov r1, #2
	add r2, sp, #0xc
	lsr r3, r3, #0x18
	bl LoadRectToBgTilemapRect
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #5
	blt _021E6D1E
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov122_021E6CD0

	thumb_func_start ov122_021E6D60
ov122_021E6D60: ; 0x021E6D60
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r6, #0
	mov r4, #1
_021E6D6A:
	mov r0, #0x91
	lsl r0, r0, #2
	lsl r2, r6, #0x18
	ldr r0, [r5, r0]
	mov r1, #1
	lsr r2, r2, #0x18
	bl ov122_021E86A8
	mov r1, #0xa
	add r7, r0, #0
	bl _s32_div_f
	add r1, r0, #1
	add r0, sp, #0xc
	strh r1, [r0, #4]
	add r0, r7, #0
	mov r1, #0xa
	bl _s32_div_f
	add r1, r1, #1
	add r0, sp, #0xc
	strh r1, [r0, #6]
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #0x18]
	mov r1, #2
	add r2, sp, #0x10
	mov r3, #0x16
	bl LoadRectToBgTilemapRect
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #5
	blt _021E6D6A
	mov r4, #0
	mov r6, #2
_021E6DBC:
	mov r0, #0x91
	lsl r0, r0, #2
	lsl r2, r4, #0x18
	ldr r0, [r5, r0]
	mov r1, #0
	lsr r2, r2, #0x18
	bl ov122_021E86A8
	mov r1, #0xa
	add r7, r0, #0
	bl _s32_div_f
	add r1, r0, #1
	add r0, sp, #0xc
	strh r1, [r0]
	add r0, r7, #0
	mov r1, #0xa
	bl _s32_div_f
	lsl r3, r6, #0x18
	add r1, r1, #1
	add r0, sp, #0xc
	strh r1, [r0, #2]
	mov r0, #0x15
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r5, #0x18]
	mov r1, #2
	add r2, sp, #0xc
	lsr r3, r3, #0x18
	bl LoadRectToBgTilemapRect
	add r4, r4, #1
	add r6, r6, #4
	cmp r4, #5
	blt _021E6DBC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov122_021E6D60

	thumb_func_start ov122_021E6E10
ov122_021E6E10: ; 0x021E6E10
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #2
	blo _021E6E1E
	bl GF_AssertFail
_021E6E1E:
	cmp r5, #5
	blo _021E6E26
	bl GF_AssertFail
_021E6E26:
	ldr r0, _021E6E30 ; =ov122_021E9278
	lsl r1, r5, #1
	add r0, r0, r1
	ldrb r0, [r4, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E6E30: .word ov122_021E9278
	thumb_func_end ov122_021E6E10

	thumb_func_start ov122_021E6E34
ov122_021E6E34: ; 0x021E6E34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	mov r4, #0
_021E6E3C:
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	add r6, r1, #0
	add r0, r4, #0
	mov r1, #3
	bl _s32_div_f
	lsl r0, r0, #5
	add r0, r7, r0
	add r0, r6, r0
	strh r0, [r5]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #9
	blt _021E6E3C
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov122_021E6E34

	thumb_func_start ov122_021E6E60
ov122_021E6E60: ; 0x021E6E60
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r2, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	add r0, r5, #0
	mov r1, #5
	add r4, r3, #0
	bl _s32_div_f
	lsl r0, r1, #2
	add r7, r0, #1
	add r0, r5, #0
	mov r1, #5
	bl _s32_div_f
	lsl r0, r0, #2
	add r6, r0, #1
	ldr r0, [sp, #0x10]
	add r1, r5, #0
	bl ov122_021E8668
	cmp r4, #3
	bhi _021E6EE0
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6E9C: ; jump table
	.short _021E6EA4 - _021E6E9C - 2 ; case 0
	.short _021E6EAE - _021E6E9C - 2 ; case 1
	.short _021E6EB8 - _021E6E9C - 2 ; case 2
	.short _021E6ECC - _021E6E9C - 2 ; case 3
_021E6EA4:
	add r0, sp, #0x14
	mov r1, #0x77
	bl ov122_021E6E34
	b _021E6EE4
_021E6EAE:
	add r0, sp, #0x14
	mov r1, #0x1a
	bl ov122_021E6E34
	b _021E6EE4
_021E6EB8:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	bl ov122_021E6E10
	add r1, r0, #0
	add r0, sp, #0x14
	bl ov122_021E6E34
	b _021E6EE4
_021E6ECC:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #1
	bl ov122_021E6E10
	add r1, r0, #0
	add r0, sp, #0x14
	bl ov122_021E6E34
	b _021E6EE4
_021E6EE0:
	bl GF_AssertFail
_021E6EE4:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r0, [sp, #8]
	lsl r3, r7, #0x18
	ldr r0, [sp, #0xc]
	mov r1, #0
	add r2, sp, #0x14
	lsr r3, r3, #0x18
	bl LoadRectToBgTilemapRect
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov122_021E6E60

	thumb_func_start ov122_021E6F04
ov122_021E6F04: ; 0x021E6F04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r5, r2, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	add r0, r5, #0
	mov r1, #5
	add r4, r3, #0
	bl _s32_div_f
	lsl r0, r1, #2
	add r7, r0, #1
	add r0, r5, #0
	mov r1, #5
	bl _s32_div_f
	lsl r0, r0, #2
	add r6, r0, #1
	ldr r0, [sp, #0x10]
	add r1, r5, #0
	bl ov122_021E8668
	cmp r4, #3
	bhi _021E6F7A
	add r1, r4, r4
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E6F40: ; jump table
	.short _021E6F48 - _021E6F40 - 2 ; case 0
	.short _021E6F5C - _021E6F40 - 2 ; case 1
	.short _021E6F66 - _021E6F40 - 2 ; case 2
	.short _021E6F70 - _021E6F40 - 2 ; case 3
_021E6F48:
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	mov r1, #0
	bl ov122_021E6E10
	add r1, r0, #0
	add r0, sp, #0x14
	bl ov122_021E6E34
	b _021E6F7E
_021E6F5C:
	add r0, sp, #0x14
	mov r1, #0x1a
	bl ov122_021E6E34
	b _021E6F7E
_021E6F66:
	add r0, sp, #0x14
	mov r1, #0x77
	bl ov122_021E6E34
	b _021E6F7E
_021E6F70:
	add r0, sp, #0x14
	mov r1, #0x17
	bl ov122_021E6E34
	b _021E6F7E
_021E6F7A:
	bl GF_AssertFail
_021E6F7E:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	str r0, [sp, #8]
	lsl r3, r7, #0x18
	ldr r0, [sp, #0xc]
	mov r1, #0
	add r2, sp, #0x14
	lsr r3, r3, #0x18
	bl LoadRectToBgTilemapRect
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov122_021E6F04

	thumb_func_start ov122_021E6F9C
ov122_021E6F9C: ; 0x021E6F9C
	push {r3, lr}
	add r3, r0, #0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	ldrb r2, [r3, #0x11]
	ldrb r3, [r3, #0x10]
	bl ov122_021E6E60
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov122_021E6F9C

	thumb_func_start ov122_021E6FB0
ov122_021E6FB0: ; 0x021E6FB0
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	add r5, r0, #0
	add r4, r6, #0
	mov r7, #1
_021E6FBA:
	lsl r1, r4, #0x18
	ldr r0, [r5, #4]
	lsr r1, r1, #0x18
	bl ov122_021E8630
	cmp r0, #0
	bne _021E6FD8
	ldrb r3, [r5, #0x10]
	lsl r2, r4, #0x18
	ldr r0, [r5]
	ldr r1, [r5, #4]
	lsr r2, r2, #0x18
	add r6, r7, #0
	bl ov122_021E6E60
_021E6FD8:
	add r4, r4, #1
	cmp r4, #0x19
	blt _021E6FBA
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov122_021E6FB0

	thumb_func_start ov122_021E6FE4
ov122_021E6FE4: ; 0x021E6FE4
	push {r4, r5, r6, lr}
	mov r6, #0
	add r5, r0, #0
	add r4, r6, #0
_021E6FEC:
	ldrb r2, [r5, #0x13]
	ldrb r3, [r5, #0x10]
	ldr r0, [r5]
	add r2, r2, r4
	lsl r2, r2, #0x18
	ldr r1, [r5, #4]
	lsr r2, r2, #0x18
	bl ov122_021E6F04
	add r6, r6, #1
	add r4, r4, #5
	cmp r6, #5
	blt _021E6FEC
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E6FE4

	thumb_func_start ov122_021E7008
ov122_021E7008: ; 0x021E7008
	push {r3, r4, r5, r6, r7, lr}
	mov r6, #0
	add r5, r0, #0
	add r4, r6, #0
	mov r7, #1
_021E7012:
	lsl r1, r4, #0x18
	ldr r0, [r5, #4]
	lsr r1, r1, #0x18
	bl ov122_021E8630
	cmp r0, #0
	bne _021E7030
	ldrb r3, [r5, #0x10]
	lsl r2, r4, #0x18
	ldr r0, [r5]
	ldr r1, [r5, #4]
	lsr r2, r2, #0x18
	add r6, r7, #0
	bl ov122_021E6F04
_021E7030:
	add r4, r4, #1
	cmp r4, #0x19
	blt _021E7012
	add r0, r6, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov122_021E7008

	thumb_func_start ov122_021E703C
ov122_021E703C: ; 0x021E703C
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r1, [r4, #0xc]
	mov r5, #1
	cmp r1, #3
	bhi _021E7076
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E7054: ; jump table
	.short _021E705C - _021E7054 - 2 ; case 0
	.short _021E7062 - _021E7054 - 2 ; case 1
	.short _021E706A - _021E7054 - 2 ; case 2
	.short _021E7070 - _021E7054 - 2 ; case 3
_021E705C:
	bl ov122_021E6F9C
	b _021E7076
_021E7062:
	bl ov122_021E6FB0
	add r5, r0, #0
	b _021E7076
_021E706A:
	bl ov122_021E6FE4
	b _021E7076
_021E7070:
	bl ov122_021E7008
	add r5, r0, #0
_021E7076:
	ldrb r0, [r4, #0x10]
	cmp r0, #0
	bne _021E7086
	cmp r5, #0
	beq _021E7086
	ldr r0, _021E7090 ; =0x0000092C
	bl PlaySE
_021E7086:
	ldr r0, [r4]
	mov r1, #0
	bl BgCommitTilemapBufferToVram
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E7090: .word 0x0000092C
	thumb_func_end ov122_021E703C

	thumb_func_start ov122_021E7094
ov122_021E7094: ; 0x021E7094
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x18]
	mov r1, #2
	bl BgClearTilemapBufferAndCommit
	add r0, r4, #0
	bl ov122_021E6CD0
	add r0, r4, #0
	bl ov122_021E6D60
	ldr r0, [r4, #0x18]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E7094

	thumb_func_start ov122_021E70B8
ov122_021E70B8: ; 0x021E70B8
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r4, r3, #0
	add r5, r2, #0
	ldr r2, [r4, #0x18]
	str r2, [r0]
	mov r2, #9
	lsl r2, r2, #6
	ldr r3, [r4, r2]
	add r2, r2, #4
	str r3, [r0, #8]
	ldr r2, [r4, r2]
	str r2, [r0, #4]
	str r5, [r0, #0xc]
	strb r1, [r0, #0x11]
	mov r2, #0
	strb r2, [r0, #0x10]
	mov r1, #5
	strb r2, [r0, #0x12]
	strb r1, [r0, #0x13]
	cmp r5, #3
	bhi _021E7160
	add r3, r5, r5
	add r3, pc
	ldrh r3, [r3, #6]
	lsl r3, r3, #0x10
	asr r3, r3, #0x10
	add pc, r3
_021E70F0: ; jump table
	.short _021E70F8 - _021E70F0 - 2 ; case 0
	.short _021E713A - _021E70F0 - 2 ; case 1
	.short _021E715A - _021E70F0 - 2 ; case 2
	.short _021E7164 - _021E70F0 - 2 ; case 3
_021E70F8:
	ldrb r6, [r0, #0x11]
	add r0, r6, #0
	bl _s32_div_f
	add r5, r1, #0
	add r0, r6, #0
	mov r1, #5
	bl _s32_div_f
	lsl r0, r0, #2
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	lsl r3, r5, #2
	add r3, r3, #1
	lsl r3, r3, #0x18
	str r0, [sp, #8]
	mov r2, #0
	str r2, [sp, #0xc]
	ldr r0, [r4, #0x18]
	mov r1, #2
	lsr r3, r3, #0x18
	bl FillBgTilemapRect
	ldr r0, [r4, #0x18]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021E713A:
	mov r3, #1
	str r3, [sp]
	mov r0, #0x14
	str r0, [sp, #4]
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r4, #0x18]
	mov r1, #2
	bl FillBgTilemapRect
	ldr r0, [r4, #0x18]
	mov r1, #2
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021E715A:
	strb r2, [r0, #0x13]
	add sp, #0x10
	pop {r4, r5, r6, pc}
_021E7160:
	bl GF_AssertFail
_021E7164:
	add sp, #0x10
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E70B8

	thumb_func_start ov122_021E7168
ov122_021E7168: ; 0x021E7168
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0x12]
	mov r1, #3
	bl _s32_div_f
	cmp r1, #0
	beq _021E719E
	add r0, r4, #0
	bl ov122_021E703C
	ldrb r0, [r4, #0x10]
	add r0, r0, #1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x10]
	cmp r0, #4
	blo _021E719E
	mov r0, #0
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x13]
	add r0, r0, #1
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0x13]
	cmp r0, #5
	blo _021E719E
	mov r0, #1
	pop {r4, pc}
_021E719E:
	ldrb r0, [r4, #0x12]
	add r0, r0, #1
	strb r0, [r4, #0x12]
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov122_021E7168

	thumb_func_start ov122_021E71A8
ov122_021E71A8: ; 0x021E71A8
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E71BC
	bl GF_AssertFail
_021E71BC:
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8E58
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #1
	bl ov122_021E8DAC
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x14
	bl sub_0200DC4C
	mov r0, #0
	str r0, [sp]
	add r3, r4, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #4
	mov r2, #7
	add r3, #0x44
	bl ov122_021E767C
	mov r0, #0x8e
	mov r1, #1
	lsl r0, r0, #2
	str r1, [r4, r0]
	ldr r0, _021E7210 ; =0x000005FF
	bl PlaySE
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E7210: .word 0x000005FF
	thumb_func_end ov122_021E71A8

	thumb_func_start ov122_021E7214
ov122_021E7214: ; 0x021E7214
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x8e
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E7228
	bl GF_AssertFail
_021E7228:
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	mov r1, #0
	bl ov122_021E8DAC
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8E58
	add r0, r4, #0
	mov r1, #0
	bl ov122_021E7274
	mov r0, #0x57
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #0x15
	bl sub_0200DC4C
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r4, #0
	add r4, #0x44
	mov r1, #4
	mov r2, #6
	add r3, r4, #0
	bl ov122_021E767C
	ldr r0, _021E7270 ; =0x000005FF
	bl PlaySE
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_021E7270: .word 0x000005FF
	thumb_func_end ov122_021E7214

	thumb_func_start ov122_021E7274
ov122_021E7274: ; 0x021E7274
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r0, #0x16
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl sub_0200DCE8
	mov r0, #0x59
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_0200DCE8
	mov r0, #0x5a
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_0200DCE8
	mov r0, #0x5b
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_0200DCE8
	cmp r4, #0
	beq _021E72C0
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ov122_021E84B0
	cmp r0, #0xe
	bne _021E72BE
	mov r4, #1
	b _021E72C0
_021E72BE:
	mov r4, #0
_021E72C0:
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl sub_0200DCE8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E7274

	thumb_func_start ov122_021E72D0
ov122_021E72D0: ; 0x021E72D0
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl ov122_021E8DF0
	str r0, [sp]
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	bl ov122_021E8E28
	cmp r0, #0
	beq _021E7330
	ldr r4, _021E733C ; =ov122_021E92B0
	mov r6, #0
_021E72F2:
	ldrb r0, [r4, #2]
	cmp r0, #0xd
	blo _021E72FC
	bl GF_AssertFail
_021E72FC:
	ldrb r0, [r4, #2]
	ldrb r2, [r4, #3]
	lsl r0, r0, #2
	add r1, r5, r0
	mov r0, #0x53
	lsl r0, r0, #2
	ldr r7, [r1, r0]
	add r0, #0xf8
	ldr r0, [r5, r0]
	ldr r1, [sp]
	bl ov122_021E8674
	add r1, r0, #0
	ldrb r1, [r4, r1]
	add r0, r7, #0
	bl sub_0200DC4C
	add r6, r6, #1
	add r4, r4, #4
	cmp r6, #4
	blt _021E72F2
	add r0, r5, #0
	mov r1, #1
	bl ov122_021E7274
	pop {r3, r4, r5, r6, r7, pc}
_021E7330:
	add r0, r5, #0
	mov r1, #0
	bl ov122_021E7274
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E733C: .word ov122_021E92B0
	thumb_func_end ov122_021E72D0

	thumb_func_start ov122_021E7340
ov122_021E7340: ; 0x021E7340
	push {r4, r5, r6, lr}
	add r4, r0, #0
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r5, r1, #0
	add r6, r2, #0
	bl ov122_021E8630
	cmp r0, #0
	beq _021E7360
	ldr r0, _021E73F4 ; =0x000005F3
	bl PlaySE
	mov r0, #0
	pop {r4, r5, r6, pc}
_021E7360:
	ldr r0, _021E73F8 ; =0x000005EA
	bl PlaySE
	cmp r6, #4
	bhi _021E73EC
	add r0, r6, r6
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E7376: ; jump table
	.short _021E7384 - _021E7376 - 2 ; case 0
	.short _021E739E - _021E7376 - 2 ; case 1
	.short _021E73B8 - _021E7376 - 2 ; case 2
	.short _021E73D2 - _021E7376 - 2 ; case 3
	.short _021E7380 - _021E7376 - 2 ; case 4
_021E7380:
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E7384:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r5, #0
	mov r2, #1
	bl ov122_021E868C
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #1
	bl ov122_021E6C2C
	b _021E73F0
_021E739E:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r5, #0
	mov r2, #2
	bl ov122_021E868C
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #2
	bl ov122_021E6C2C
	b _021E73F0
_021E73B8:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r5, #0
	mov r2, #4
	bl ov122_021E868C
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #4
	bl ov122_021E6C2C
	b _021E73F0
_021E73D2:
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r1, r5, #0
	mov r2, #8
	bl ov122_021E868C
	add r0, r4, #0
	add r1, r5, #0
	mov r2, #8
	bl ov122_021E6C2C
	b _021E73F0
_021E73EC:
	bl GF_AssertFail
_021E73F0:
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E73F4: .word 0x000005F3
_021E73F8: .word 0x000005EA
	thumb_func_end ov122_021E7340

	thumb_func_start ov122_021E73FC
ov122_021E73FC: ; 0x021E73FC
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	ldr r0, [r7]
	mov r1, #0
	bl sub_02018424
	str r0, [r7, #0x1c]
	mov r0, #0
	ldr r5, _021E7458 ; =ov122_021E9290
	str r0, [sp]
	add r6, r7, #0
_021E7412:
	ldr r0, [r5, #4]
	ldr r1, [r7]
	bl ListMenuItems_ctor
	mov r1, #0x4d
	lsl r1, r1, #2
	str r0, [r6, r1]
	ldr r0, [r5, #4]
	mov r4, #0
	cmp r0, #0
	ble _021E7446
_021E7428:
	ldr r2, [r5]
	mov r0, #0x4d
	mov r1, #6
	lsl r0, r0, #2
	lsl r1, r1, #6
	ldrb r2, [r2, r4]
	ldr r0, [r6, r0]
	ldr r1, [r7, r1]
	add r3, r4, #0
	bl ListMenuItems_AppendFromMsgData
	ldr r0, [r5, #4]
	add r4, r4, #1
	cmp r4, r0
	blt _021E7428
_021E7446:
	ldr r0, [sp]
	add r5, #8
	add r0, r0, #1
	add r6, r6, #4
	str r0, [sp]
	cmp r0, #2
	blt _021E7412
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E7458: .word ov122_021E9290
	thumb_func_end ov122_021E73FC

	thumb_func_start ov122_021E745C
ov122_021E745C: ; 0x021E745C
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	mov r7, #0x4d
	str r0, [sp]
	add r5, r0, #0
	add r6, r4, #0
	lsl r7, r7, #2
_021E746A:
	mov r0, #0x4d
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	bl ListMenuItems_dtor
	str r6, [r5, r7]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #2
	blt _021E746A
	ldr r0, [sp]
	ldr r0, [r0, #0x1c]
	bl sub_02018474
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov122_021E745C

	thumb_func_start ov122_021E7488
ov122_021E7488: ; 0x021E7488
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r5, r0, #0
	add r6, r1, #0
	add r1, sp, #0xc
	mov r0, #0
	str r0, [r1]
	str r0, [r1, #4]
	str r0, [r1, #8]
	str r0, [r1, #0xc]
	str r0, [r1, #0x10]
	str r0, [r1, #0x14]
	ldr r1, _021E750C ; =ov122_021E9290
	lsl r0, r6, #3
	add r4, r1, r0
	ldr r0, [r5, #0x18]
	cmp r0, #0
	bne _021E74B0
	bl GF_AssertFail
_021E74B0:
	ldr r2, _021E7510 ; =ov122_021E9278
	add r0, sp, #0xc
	ldrh r3, [r2, #0xa]
	add r1, sp, #0xc
	strh r3, [r0]
	ldrh r3, [r2, #0xc]
	strh r3, [r0, #2]
	ldrh r3, [r2, #0xe]
	strh r3, [r0, #4]
	ldrh r3, [r2, #0x10]
	strh r3, [r0, #6]
	ldrh r3, [r2, #0x12]
	ldrh r2, [r2, #0x14]
	strh r3, [r0, #8]
	strh r2, [r0, #0xa]
	lsl r2, r6, #2
	add r3, r5, r2
	mov r2, #0x4d
	lsl r2, r2, #2
	ldr r3, [r3, r2]
	add r2, #0xf4
	str r3, [sp, #0x18]
	ldr r3, [r5, #0x18]
	str r3, [sp, #0x1c]
	ldr r3, [r4, #4]
	strb r3, [r0, #0x14]
	ldr r3, [r4, #4]
	lsl r0, r3, #1
	add r0, r3, r0
	mov r3, #0x11
	sub r0, r3, r0
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	mov r0, #0xd
	str r0, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldrb r2, [r5, r2]
	ldr r0, [r5, #0x1c]
	bl sub_020185FC
	str r0, [r5, #0x20]
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	nop
_021E750C: .word ov122_021E9290
_021E7510: .word ov122_021E9278
	thumb_func_end ov122_021E7488

	thumb_func_start ov122_021E7514
ov122_021E7514: ; 0x021E7514
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x20]
	bl sub_020186A4
	add r4, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r4, r0
	beq _021E753C
	ldr r0, [r5, #0x20]
	bl sub_02018674
	mov r1, #0x8a
	lsl r1, r1, #2
	strb r0, [r5, r1]
	ldr r0, [r5, #0x20]
	bl sub_02018680
	add r0, r4, #0
_021E753C:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E7514

	thumb_func_start ov122_021E7540
ov122_021E7540: ; 0x021E7540
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r0, #0
	mov r1, #0
	str r1, [sp]
	add r3, r4, #0
	str r1, [sp, #4]
	mov r1, #4
	mov r2, #6
	add r3, #0x44
	bl ov122_021E767C
	mov r0, #0
	str r0, [sp]
	add r3, r4, #0
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #4
	mov r2, #8
	add r3, #0x54
	bl ov122_021E767C
	ldr r0, [r4, #0x18]
	mov r1, #1
	bl BgCommitTilemapBufferToVram
	mov r1, #0
	mov r2, #1
	str r1, [sp]
	mov r0, #0x61
	str r2, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	add r3, r2, #0
	bl BufferIntegerAsString
	mov r1, #0
	str r1, [sp]
	add r3, r4, #0
	ldr r0, _021E7624 ; =0x000F0100
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	add r2, r1, #0
	add r3, #0x64
	bl ov122_021E769C
	mov r1, #0
	str r1, [sp]
	add r3, r4, #0
	ldr r0, _021E7624 ; =0x000F0100
	str r1, [sp, #4]
	str r0, [sp, #8]
	add r0, r4, #0
	mov r2, #1
	add r3, #0x74
	bl ov122_021E769C
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	ldr r2, [r4, #0x10]
	mov r1, #0
	bl BufferPlayersName
	mov r1, #0
	add r3, r4, #0
	str r1, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021E7624 ; =0x000F0100
	mov r2, #2
	str r0, [sp, #8]
	add r0, r4, #0
	add r3, #0x84
	bl ov122_021E769C
	mov r1, #0
	add r3, r4, #0
	str r1, [sp]
	mov r0, #4
	str r0, [sp, #4]
	ldr r0, _021E7624 ; =0x000F0100
	mov r2, #3
	str r0, [sp, #8]
	add r0, r4, #0
	add r3, #0x94
	bl ov122_021E769C
	mov r1, #0
	add r3, r4, #0
	str r1, [sp]
	add r0, r4, #0
	mov r2, #4
	add r3, #0xa4
	str r1, [sp, #4]
	bl ov122_021E767C
	mov r1, #0
	str r1, [sp]
	add r3, r4, #0
	str r1, [sp, #4]
	add r0, r4, #0
	mov r2, #5
	add r3, #0xb4
	bl ov122_021E767C
	ldr r0, [r4, #0x18]
	mov r1, #5
	bl BgCommitTilemapBufferToVram
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_021E7624: .word 0x000F0100
	thumb_func_end ov122_021E7540

	thumb_func_start ov122_021E7628
ov122_021E7628: ; 0x021E7628
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r7, #0
	ldr r4, _021E7658 ; =ov122_021E93DC
	mov r6, #0
	add r5, #0x24
_021E7634:
	ldr r0, [r7, #0x18]
	add r1, r5, #0
	add r2, r4, #0
	bl AddWindow
	add r0, r5, #0
	mov r1, #0
	bl FillWindowPixelBuffer
	add r6, r6, #1
	add r4, #8
	add r5, #0x10
	cmp r6, #0x11
	blt _021E7634
	add r0, r7, #0
	bl ov122_021E7540
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7658: .word ov122_021E93DC
	thumb_func_end ov122_021E7628

	thumb_func_start ov122_021E765C
ov122_021E765C: ; 0x021E765C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
	add r5, #0x24
_021E7664:
	add r0, r5, #0
	bl ClearWindowTilemapAndCopyToVram
	add r0, r5, #0
	bl RemoveWindow
	add r4, r4, #1
	add r5, #0x10
	cmp r4, #0x11
	blt _021E7664
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E765C

	thumb_func_start ov122_021E767C
ov122_021E767C: ; 0x021E767C
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, sp, #8
	ldrb r5, [r4, #0x10]
	str r5, [sp]
	ldrb r4, [r4, #0x14]
	str r4, [sp, #4]
	ldr r4, _021E7698 ; =0x00010200
	str r4, [sp, #8]
	bl ov122_021E769C
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_021E7698: .word 0x00010200
	thumb_func_end ov122_021E767C

	thumb_func_start ov122_021E769C
ov122_021E769C: ; 0x021E769C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r3, #0
	add r5, r0, #0
	add r4, r1, #0
	add r0, r7, #0
	mov r1, #0
	add r6, r2, #0
	bl FillWindowPixelBuffer
	mov r1, #0x61
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, [r5]
	add r2, r6, #0
	bl ReadMsgData_ExpandPlaceholders
	add r5, r0, #0
	add r3, sp, #0x18
	ldrb r0, [r3, #0x14]
	add r1, r4, #0
	add r2, r5, #0
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	str r0, [sp, #8]
	mov r0, #0
	str r0, [sp, #0xc]
	ldrb r3, [r3, #0x10]
	add r0, r7, #0
	bl AddTextPrinterParameterized2
	add r0, r7, #0
	bl ScheduleWindowCopyToVram
	add r0, r5, #0
	bl String_dtor
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov122_021E769C

	thumb_func_start ov122_021E76F4
ov122_021E76F4: ; 0x021E76F4
	push {r4, r5, r6, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r4, r5, #0
	add r4, #0x34
	add r6, r1, #0
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	mov r1, #0x61
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, [r5]
	add r2, r6, #0
	bl ReadMsgData_ExpandPlaceholders
	add r6, r0, #0
	mov r0, #0x14
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #4
	mov r2, #0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5, #0x18]
	mov r1, #3
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0xd
	bl DrawFrameAndWindow2
	mov r3, #0
	str r3, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r0, r4, #0
	mov r1, #1
	add r2, r6, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	add r0, r6, #0
	bl String_dtor
	ldr r0, [r5, #0x18]
	mov r1, #3
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov122_021E76F4

	thumb_func_start ov122_021E7770
ov122_021E7770: ; 0x021E7770
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	mov r0, #5
	lsl r0, r0, #6
	add r4, r5, #0
	ldr r0, [r5, r0]
	add r6, r1, #0
	add r7, r2, #0
	add r4, #0x24
	cmp r0, #0
	beq _021E778C
	bl GF_AssertFail
_021E778C:
	add r0, r4, #0
	mov r1, #0xf
	bl FillWindowPixelBuffer
	cmp r6, #0x19
	bne _021E77A6
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r5, r0]
	add r1, r6, #0
	bl NewString_ReadMsgData
	b _021E77B8
_021E77A6:
	mov r1, #0x61
	lsl r1, r1, #2
	ldr r0, [r5, r1]
	sub r1, r1, #4
	ldr r1, [r5, r1]
	ldr r3, [r5]
	add r2, r6, #0
	bl ReadMsgData_ExpandPlaceholders
_021E77B8:
	add r6, r0, #0
	cmp r7, #0
	beq _021E77E4
	mov r0, #0x12
	str r0, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	mov r0, #6
	mov r2, #0
	str r0, [sp, #8]
	str r2, [sp, #0xc]
	ldr r0, [r5, #0x18]
	mov r1, #3
	add r3, r2, #0
	bl FillBgTilemapRect
	mov r1, #1
	add r0, r4, #0
	add r2, r1, #0
	mov r3, #0xd
	bl DrawFrameAndWindow2
_021E77E4:
	mov r3, #0
	ldr r0, _021E7818 ; =0x0000022A
	str r3, [sp]
	ldrb r0, [r5, r0]
	mov r1, #1
	add r2, r6, #0
	str r0, [sp, #4]
	add r0, r4, #0
	str r3, [sp, #8]
	bl AddTextPrinterParameterized
	ldr r1, _021E781C ; =0x0000022B
	strb r0, [r5, r1]
	ldrb r0, [r5, r1]
	cmp r0, #0xff
	bne _021E7808
	bl GF_AssertFail
_021E7808:
	add r0, r4, #0
	bl ScheduleWindowCopyToVram
	mov r0, #5
	lsl r0, r0, #6
	str r6, [r5, r0]
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7818: .word 0x0000022A
_021E781C: .word 0x0000022B
	thumb_func_end ov122_021E7770

	thumb_func_start ov122_021E7820
ov122_021E7820: ; 0x021E7820
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _021E7850 ; =0x0000022B
	ldrb r0, [r4, r0]
	bl TextPrinterCheckActive
	cmp r0, #0
	bne _021E784A
	mov r0, #5
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	cmp r0, #0
	beq _021E7846
	bl String_dtor
	mov r0, #5
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
_021E7846:
	mov r0, #1
	pop {r4, pc}
_021E784A:
	mov r0, #0
	pop {r4, pc}
	nop
_021E7850: .word 0x0000022B
	thumb_func_end ov122_021E7820

	thumb_func_start ov122_021E7854
ov122_021E7854: ; 0x021E7854
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r4, r1, #0
	bl ov122_021E8794
	mov r1, #8
	sub r0, r1, r0
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0
	str r0, [sp]
	mov r3, #1
	mov r0, #0x61
	str r3, [sp, #4]
	lsl r0, r0, #2
	ldr r0, [r5, r0]
	add r1, r4, #0
	bl BufferIntegerAsString
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E7854

	thumb_func_start ov122_021E7888
ov122_021E7888: ; 0x021E7888
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _021E78B0
	mov r0, #1
	bl sub_0200B554
	mov r0, #1
	str r0, [sp]
	mov r0, #4
	add r1, r0, #0
	sub r1, #0xc
	mov r2, #0
	mov r3, #0x37
	bl sub_0200B484
	mov r0, #1
	strb r0, [r4]
_021E78B0:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov122_021E7888

	thumb_func_start ov122_021E78B4
ov122_021E78B4: ; 0x021E78B4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	bl sub_0200B554
	mov r1, #0
	mov r0, #1
	add r2, r1, #0
	str r0, [sp]
	mov r0, #4
	sub r2, #8
	mov r3, #0x37
	bl sub_0200B484
	mov r0, #0
	strb r0, [r4]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E78B4

	thumb_func_start ov122_021E78DC
ov122_021E78DC: ; 0x021E78DC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _021E7900
	mov r0, #1
	bl sub_0200B554
	mov r0, #1
	sub r1, r0, #7
	mov r2, #0
	mov r3, #0x21
	str r0, [sp]
	bl sub_0200B484
	mov r0, #1
	strb r0, [r4]
_021E7900:
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end ov122_021E78DC

	thumb_func_start ov122_021E7904
ov122_021E7904: ; 0x021E7904
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	mov r0, #1
	bl sub_0200B554
	mov r1, #0
	mov r0, #1
	sub r2, r1, #6
	mov r3, #0x21
	str r0, [sp]
	bl sub_0200B484
	mov r0, #0
	strb r0, [r4]
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E7904

	thumb_func_start ov122_021E7928
ov122_021E7928: ; 0x021E7928
	push {r4, r5, r6, r7, lr}
	sub sp, #0xbc
	add r5, r0, #0
	ldr r0, [r5]
	bl BgConfig_Alloc
	add r3, sp, #4
	ldr r4, _021E7998 ; =ov122_021E92C0
	str r0, [r5, #0x18]
	add r2, r3, #0
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	add r0, r2, #0
	bl SetBothScreensModesAndDisable
	ldr r4, _021E799C ; =ov122_021E9464
	add r3, sp, #0x14
	mov r2, #0x15
_021E7950:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E7950
	ldr r4, _021E79A0 ; =ov122_021E9270
	mov r7, #0
	add r6, sp, #0x14
_021E795E:
	ldrb r1, [r4]
	ldr r0, [r5, #0x18]
	add r2, r6, #0
	mov r3, #0
	bl InitBgFromTemplate
	ldrb r1, [r4]
	ldr r0, [r5, #0x18]
	bl BgClearTilemapBufferAndCommit
	mov r0, #0
	str r0, [sp]
	ldrb r1, [r4]
	ldr r0, [r5, #0x18]
	mov r2, #0
	mov r3, #1
	bl BG_FillCharDataRange
	ldrb r0, [r4]
	mov r1, #1
	bl ToggleBgLayer
	add r7, r7, #1
	add r6, #0x1c
	add r4, r4, #1
	cmp r7, #6
	blt _021E795E
	add sp, #0xbc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7998: .word ov122_021E92C0
_021E799C: .word ov122_021E9464
_021E79A0: .word ov122_021E9270
	thumb_func_end ov122_021E7928

	thumb_func_start ov122_021E79A4
ov122_021E79A4: ; 0x021E79A4
	push {r4, r5, r6, lr}
	ldr r5, _021E79CC ; =ov122_021E9270
	add r6, r0, #0
	mov r4, #0
_021E79AC:
	ldrb r1, [r5]
	ldr r0, [r6, #0x18]
	bl FreeBgTilemapBuffer
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #6
	blt _021E79AC
	mov r0, #4
	bl FontID_Release
	ldr r0, [r6, #0x18]
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	nop
_021E79CC: .word ov122_021E9270
	thumb_func_end ov122_021E79A4

	thumb_func_start ov122_021E79D0
ov122_021E79D0: ; 0x021E79D0
	push {r4, lr}
	sub sp, #0x10
	add r4, r0, #0
	ldr r1, [r4]
	mov r0, #4
	bl FontID_Alloc
	ldr r0, [r4, #0x14]
	cmp r0, #0
	bne _021E79E8
	bl GF_AssertFail
_021E79E8:
	mov r1, #0
	str r1, [sp]
	ldr r0, [r4]
	add r2, r1, #0
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	add r3, r1, #0
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	mov r3, #7
	str r0, [sp, #4]
	mov r0, #0x10
	mov r1, #9
	mov r2, #0
	lsl r3, r3, #6
	bl GfGfxLoader_GXLoadPal
	mov r1, #6
	ldr r2, [r4]
	mov r0, #0
	lsl r1, r1, #6
	bl LoadFontPal1
	mov r1, #6
	ldr r2, [r4]
	mov r0, #4
	lsl r1, r1, #6
	bl LoadFontPal0
	mov r0, #0x20
	str r0, [sp]
	ldr r0, [r4]
	mov r3, #0x1a
	str r0, [sp, #4]
	mov r0, #0x10
	mov r1, #9
	mov r2, #4
	lsl r3, r3, #4
	bl GfGfxLoader_GXLoadPal
	ldr r0, _021E7AE8 ; =0x00000229
	mov r1, #3
	ldrb r0, [r4, r0]
	mov r2, #1
	mov r3, #0xd
	str r0, [sp]
	ldr r0, [r4]
	str r0, [sp, #4]
	ldr r0, [r4, #0x18]
	bl LoadUserFrameGfx2
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #4
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #2
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	add r3, r1, #0
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r3, #0
	str r3, [sp]
	ldr r0, [r4]
	mov r1, #1
	str r0, [sp, #4]
	ldr r0, [r4, #0x14]
	mov r2, #4
	bl GfGfxLoader_GXLoadPalFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #3
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	mov r3, #4
	bl GfGfxLoader_LoadCharDataFromOpenNarc
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r0, #1
	str r0, [sp, #8]
	ldr r0, [r4]
	mov r1, #6
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x14]
	ldr r2, [r4, #0x18]
	mov r3, #4
	bl GfGfxLoader_LoadScrnDataFromOpenNarc
	add sp, #0x10
	pop {r4, pc}
	.balign 4, 0
_021E7AE8: .word 0x00000229
	thumb_func_end ov122_021E79D0

	thumb_func_start ov122_021E7AEC
ov122_021E7AEC: ; 0x021E7AEC
	push {r3, r4, lr}
	sub sp, #0x4c
	ldr r3, _021E7B88 ; =ov122_021E92E4
	add r4, r0, #0
	ldmia r3!, {r0, r1}
	add r2, sp, #0x34
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _021E7B8C ; =ov122_021E92FC
	add r2, sp, #0x14
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r3, _021E7B90 ; =ov122_021E92D0
	add r2, sp, #0
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldmia r3!, {r0, r1}
	stmia r2!, {r0, r1}
	ldr r0, [r3]
	str r0, [r2]
	mov r0, #0x80
	str r0, [sp]
	ldr r0, [r4]
	bl sub_0200CF18
	mov r1, #0x51
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	bl sub_0200CF38
	mov r1, #0x52
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	add r1, sp, #0x14
	add r2, sp, #0
	mov r3, #0x20
	bl sub_0200CF70
	mov r1, #0x51
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	mov r2, #0x80
	bl sub_0200CFF4
	mov r1, #0x51
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r2, sp, #0x34
	bl sub_0200D3F8
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200CF6C
	mov r2, #0x83
	mov r1, #0
	lsl r2, r2, #0xe
	bl G2dRenderer_SetSubSurfaceCoords
	add sp, #0x4c
	pop {r3, r4, pc}
	.balign 4, 0
_021E7B88: .word ov122_021E92E4
_021E7B8C: .word ov122_021E92FC
_021E7B90: .word ov122_021E92D0
	thumb_func_end ov122_021E7AEC

	thumb_func_start ov122_021E7B94
ov122_021E7B94: ; 0x021E7B94
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E7BA6
	bl GF_AssertFail
_021E7BA6:
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E7BB4
	bl GF_AssertFail
_021E7BB4:
	add r0, r4, #0
	bl ov122_021E7F48
	mov r1, #0x51
	lsl r1, r1, #2
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	bl sub_0200D998
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D108
	pop {r4, pc}
	thumb_func_end ov122_021E7B94

	thumb_func_start ov122_021E7BD4
ov122_021E7BD4: ; 0x021E7BD4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	ldr r0, [r5, #0x14]
	cmp r0, #0
	bne _021E7BE4
	bl GF_AssertFail
_021E7BE4:
	mov r0, #0x51
	lsl r0, r0, #2
	ldr r6, [r5, r0]
	add r0, r0, #4
	ldr r4, [r5, r0]
	mov r1, #0
	str r1, [sp]
	mov r0, #5
	str r0, [sp, #4]
	mov r7, #1
	str r7, [sp, #8]
	str r1, [sp, #0xc]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0xa
	bl sub_0200D5D4
	add r0, r7, #0
	str r0, [sp]
	str r7, [sp, #4]
	mov r0, #0
	str r0, [sp, #8]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0xb
	bl sub_0200D504
	add r0, r7, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0xc
	bl sub_0200D6EC
	add r0, r7, #0
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0xd
	bl sub_0200D71C
	mov r0, #0
	str r0, [sp]
	mov r0, #1
	mov r7, #2
	str r0, [sp, #4]
	str r7, [sp, #8]
	str r0, [sp, #0xc]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0xe
	bl sub_0200D5D4
	mov r0, #1
	str r0, [sp]
	str r7, [sp, #4]
	str r0, [sp, #8]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0xf
	bl sub_0200D504
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0x10
	bl sub_0200D6EC
	mov r0, #1
	str r0, [sp]
	str r0, [sp, #4]
	ldr r2, [r5, #0x14]
	add r0, r6, #0
	add r1, r4, #0
	mov r3, #0x11
	bl sub_0200D71C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov122_021E7BD4

	thumb_func_start ov122_021E7C9C
ov122_021E7C9C: ; 0x021E7C9C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	ldr r6, _021E7D00 ; =ov122_021E9374
	add r7, r2, #0
	str r3, [sp]
	add r5, r0, #0
	add r4, r1, #0
	add r3, sp, #4
	mov r2, #6
_021E7CAE:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E7CAE
	ldr r0, [r6]
	cmp r5, #0
	str r0, [r3]
	bne _021E7CC2
	bl GF_AssertFail
_021E7CC2:
	cmp r4, #0
	bne _021E7CCA
	bl GF_AssertFail
_021E7CCA:
	add r1, sp, #4
	strh r7, [r1]
	ldr r0, [sp]
	mov r3, #0x83
	strh r0, [r1, #2]
	add r0, sp, #0x40
	ldrh r2, [r0, #0x10]
	lsl r3, r3, #0xe
	strh r2, [r1, #6]
	ldrh r0, [r0, #0x14]
	add r1, r4, #0
	add r2, sp, #4
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl sub_0200D740
	add r4, r0, #0
	mov r1, #1
	bl sub_0200DC78
	add r0, r4, #0
	mov r1, #0
	bl sub_0200DCE8
	add r0, r4, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7D00: .word ov122_021E9374
	thumb_func_end ov122_021E7C9C

	thumb_func_start ov122_021E7D04
ov122_021E7D04: ; 0x021E7D04
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x38
	ldr r6, _021E7D68 ; =ov122_021E93A8
	add r7, r2, #0
	str r3, [sp]
	add r5, r0, #0
	add r4, r1, #0
	add r3, sp, #4
	mov r2, #6
_021E7D16:
	ldmia r6!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E7D16
	ldr r0, [r6]
	cmp r5, #0
	str r0, [r3]
	bne _021E7D2A
	bl GF_AssertFail
_021E7D2A:
	cmp r4, #0
	bne _021E7D32
	bl GF_AssertFail
_021E7D32:
	add r1, sp, #4
	strh r7, [r1]
	ldr r0, [sp]
	mov r3, #0x83
	strh r0, [r1, #2]
	add r0, sp, #0x40
	ldrh r2, [r0, #0x10]
	lsl r3, r3, #0xe
	strh r2, [r1, #6]
	ldrh r0, [r0, #0x14]
	add r1, r4, #0
	add r2, sp, #4
	str r0, [sp, #0xc]
	add r0, r5, #0
	bl sub_0200D740
	add r4, r0, #0
	mov r1, #1
	bl sub_0200DC78
	add r0, r4, #0
	mov r1, #0
	bl sub_0200DCE8
	add r0, r4, #0
	add sp, #0x38
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E7D68: .word ov122_021E93A8
	thumb_func_end ov122_021E7D04

	thumb_func_start ov122_021E7D6C
ov122_021E7D6C: ; 0x021E7D6C
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	mov r0, #0x12
	mov r1, #0x51
	str r0, [sp]
	mov r0, #1
	mov r2, #0
	lsl r1, r1, #2
	str r0, [sp, #4]
	ldr r0, [r4, r1]
	add r1, r1, #4
	ldr r1, [r4, r1]
	add r3, r2, #0
	bl ov122_021E7C9C
	mov r1, #0x53
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r2, #0
	add r0, r1, #0
	str r2, [sp]
	str r2, [sp, #4]
	sub r0, #8
	sub r1, r1, #4
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	add r3, r2, #0
	bl ov122_021E7C9C
	mov r1, #0x15
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #5
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	add r0, r1, #0
	sub r0, #0xc
	sub r1, #8
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0xe0
	mov r3, #0x28
	bl ov122_021E7C9C
	mov r1, #0x55
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #2
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r1, #0
	sub r0, #0x10
	sub r1, #0xc
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0xe0
	mov r3, #0xb0
	bl ov122_021E7C9C
	mov r1, #0x56
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x14
	str r0, [sp]
	mov r0, #5
	str r0, [sp, #4]
	add r0, r1, #0
	sub r0, #0x14
	sub r1, #0x10
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x80
	mov r3, #0x60
	bl ov122_021E7C9C
	mov r1, #0x57
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xc
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	add r0, r1, #0
	sub r0, #0x18
	sub r1, #0x14
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0xc8
	mov r3, #0x50
	bl ov122_021E7C9C
	mov r1, #0x16
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0xf
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	add r0, r1, #0
	sub r0, #0x1c
	sub r1, #0x18
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0xe0
	mov r3, #0x50
	bl ov122_021E7C9C
	mov r1, #0x59
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xe
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	add r0, r1, #0
	sub r0, #0x20
	sub r1, #0x1c
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0xc8
	mov r3, #0x68
	bl ov122_021E7C9C
	mov r1, #0x5a
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0xd
	str r0, [sp]
	mov r0, #4
	str r0, [sp, #4]
	add r0, r1, #0
	sub r0, #0x24
	sub r1, #0x20
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0xe0
	mov r3, #0x68
	bl ov122_021E7C9C
	mov r1, #0x5b
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0x10
	str r0, [sp]
	mov r0, #3
	str r0, [sp, #4]
	add r0, r1, #0
	sub r0, #0x28
	sub r1, #0x24
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0xe0
	mov r3, #0x80
	bl ov122_021E7C9C
	mov r1, #0x17
	lsl r1, r1, #4
	str r0, [r4, r1]
	mov r0, #0x12
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r1, #0
	sub r0, #0x2c
	sub r1, #0x28
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0xc8
	mov r3, #0x50
	bl ov122_021E7C9C
	mov r1, #0x5d
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r1, #0
	sub r0, #0x30
	sub r1, #0x2c
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x48
	mov r3, #0x38
	bl ov122_021E7D04
	mov r1, #0x5e
	lsl r1, r1, #2
	str r0, [r4, r1]
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	add r0, r1, #0
	sub r0, #0x34
	sub r1, #0x30
	ldr r0, [r4, r0]
	ldr r1, [r4, r1]
	mov r2, #0x88
	mov r3, #0x28
	bl ov122_021E7D04
	mov r1, #0x5f
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #2
	ldr r0, [r0]
	lsl r1, r1, #0x10
	bl ov122_021E7F64
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DCE8
	mov r0, #0x15
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	mov r1, #1
	bl sub_0200DD54
	mov r0, #0x5d
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	mov r1, #4
	bl sub_0200DD10
	add sp, #8
	pop {r4, pc}
	thumb_func_end ov122_021E7D6C

	thumb_func_start ov122_021E7F48
ov122_021E7F48: ; 0x021E7F48
	push {r4, r5, r6, lr}
	mov r6, #0x53
	add r5, r0, #0
	mov r4, #0
	lsl r6, r6, #2
_021E7F52:
	ldr r0, [r5, r6]
	bl sub_0200D9DC
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xd
	blt _021E7F52
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ov122_021E7F48

	thumb_func_start ov122_021E7F64
ov122_021E7F64: ; 0x021E7F64
	push {r4, lr}
	add r4, r1, #0
	bl sub_02024CB8
	str r4, [r0, #0x10]
	pop {r4, pc}
	thumb_func_end ov122_021E7F64

	thumb_func_start ov122_021E7F70
ov122_021E7F70: ; 0x021E7F70
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x56
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200DCA0
	cmp r0, #0
	bne _021E7FA2
	mov r0, #0x55
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200DCA0
	cmp r0, #0
	bne _021E7FA2
	mov r0, #0x17
	lsl r0, r0, #4
	ldr r0, [r4, r0]
	bl sub_0200DCA0
	cmp r0, #0
	bne _021E7FA2
	mov r0, #1
	pop {r4, pc}
_021E7FA2:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E7F70

	thumb_func_start ov122_021E7FA8
ov122_021E7FA8: ; 0x021E7FA8
	push {r4, lr}
	add r4, r0, #0
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8DF0
	add r1, r0, #0
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E8668
	pop {r4, pc}
	thumb_func_end ov122_021E7FA8

	thumb_func_start ov122_021E7FC4
ov122_021E7FC4: ; 0x021E7FC4
	push {r3, lr}
	cmp r0, #8
	bhi _021E7FF8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E7FD6: ; jump table
	.short _021E7FF8 - _021E7FD6 - 2 ; case 0
	.short _021E7FE8 - _021E7FD6 - 2 ; case 1
	.short _021E7FEC - _021E7FD6 - 2 ; case 2
	.short _021E7FF8 - _021E7FD6 - 2 ; case 3
	.short _021E7FF0 - _021E7FD6 - 2 ; case 4
	.short _021E7FF8 - _021E7FD6 - 2 ; case 5
	.short _021E7FF8 - _021E7FD6 - 2 ; case 6
	.short _021E7FF8 - _021E7FD6 - 2 ; case 7
	.short _021E7FF4 - _021E7FD6 - 2 ; case 8
_021E7FE8:
	mov r0, #0
	pop {r3, pc}
_021E7FEC:
	mov r0, #1
	pop {r3, pc}
_021E7FF0:
	mov r0, #2
	pop {r3, pc}
_021E7FF4:
	mov r0, #3
	pop {r3, pc}
_021E7FF8:
	bl GF_AssertFail
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov122_021E7FC4

	thumb_func_start ov122_021E8004
ov122_021E8004: ; 0x021E8004
	push {r4, lr}
	add r4, r0, #0
	bne _021E800E
	bl GF_AssertFail
_021E800E:
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	cmp r0, #0
	bne _021E801C
	bl GF_AssertFail
_021E801C:
	mov r0, #0x52
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_0200D020
	bl sub_0200D034
	ldr r0, [r4, #0x18]
	bl BgConfig_HandleScheduledScrollAndTransferOps
	ldr r3, _021E8040 ; =0x027E0000
	ldr r1, _021E8044 ; =0x00003FF8
	mov r0, #1
	ldr r2, [r3, r1]
	orr r0, r2
	str r0, [r3, r1]
	pop {r4, pc}
	nop
_021E8040: .word 0x027E0000
_021E8044: .word 0x00003FF8
	thumb_func_end ov122_021E8004

	thumb_func_start ov122_021E8048
ov122_021E8048: ; 0x021E8048
	push {r4, lr}
	sub sp, #0x28
	ldr r4, _021E8064 ; =ov122_021E931C
	add r3, sp, #0
	mov r2, #5
_021E8052:
	ldmia r4!, {r0, r1}
	stmia r3!, {r0, r1}
	sub r2, r2, #1
	bne _021E8052
	add r0, sp, #0
	bl GX_SetBanks
	add sp, #0x28
	pop {r4, pc}
	.balign 4, 0
_021E8064: .word ov122_021E931C
	thumb_func_end ov122_021E8048

	thumb_func_start ov122_021E8068
ov122_021E8068: ; 0x021E8068
	push {r3, lr}
	bl HBlankInterruptDisable
	bl GX_DisableEngineALayers
	bl GX_DisableEngineBLayers
	mov r2, #1
	lsl r2, r2, #0x1a
	ldr r1, [r2]
	ldr r0, _021E808C ; =0xFFFFE0FF
	and r1, r0
	str r1, [r2]
	ldr r2, _021E8090 ; =0x04001000
	ldr r1, [r2]
	and r0, r1
	str r0, [r2]
	pop {r3, pc}
	.balign 4, 0
_021E808C: .word 0xFFFFE0FF
_021E8090: .word 0x04001000
	thumb_func_end ov122_021E8068

	thumb_func_start ov122_021E8094
ov122_021E8094: ; 0x021E8094
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl OverlayManager_GetParentWork
	add r5, r0, #0
	bne _021E80A4
	bl GF_AssertFail
_021E80A4:
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	ldr r2, _021E820C ; =0x04000304
	ldr r0, _021E8210 ; =0xFFFF7FFF
	ldrh r1, [r2]
	and r0, r1
	strh r0, [r2]
	bl ov122_021E8068
	bl ov122_021E8048
	mov r1, #0xa0
	mov r0, #3
	lsl r2, r1, #0xb
	bl CreateHeap
	mov r1, #0x26
	add r0, r4, #0
	lsl r1, r1, #4
	mov r2, #0xa0
	bl OverlayManager_CreateAndGetData
	mov r2, #0x26
	mov r1, #0
	lsl r2, r2, #4
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #0xa0
	str r0, [r4]
	ldr r0, [r5]
	str r0, [r4, #4]
	ldr r0, [r5, #4]
	str r0, [r4, #8]
	ldr r0, [r5, #8]
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0x10]
	ldr r0, [r4, #0xc]
	bl sub_020183F0
	mov r1, #0x8a
	lsl r1, r1, #2
	strb r0, [r4, r1]
	ldr r0, [r4, #4]
	bl Options_GetFrame
	ldr r1, _021E8214 ; =0x00000229
	strb r0, [r4, r1]
	ldr r0, [r4, #4]
	bl Options_GetTextFrameDelay
	ldr r1, _021E8218 ; =0x0000022A
	strb r0, [r4, r1]
	ldr r0, _021E821C ; =0x0000010A
	ldr r1, [r4]
	bl NARC_ctor
	str r0, [r4, #0x14]
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x27
	bl NewMsgDataFromNarc
	mov r1, #6
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4]
	bl ScrStrBufs_new
	mov r1, #0x61
	lsl r1, r1, #2
	str r0, [r4, r1]
	ldr r0, [r4]
	bl sub_0201660C
	mov r1, #0x4f
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov122_021E7928
	add r0, r4, #0
	bl ov122_021E79D0
	add r0, r4, #0
	bl ov122_021E7628
	add r0, r4, #0
	bl ov122_021E73FC
	add r0, r4, #0
	bl ov122_021E6B38
	ldr r0, [r4, #8]
	bl CheckCoins
	lsl r0, r0, #0x10
	lsr r2, r0, #0x10
	add r0, r4, #0
	mov r1, #0
	bl ov122_021E6B6C
	add r0, r4, #0
	bl ov122_021E7AEC
	add r0, r4, #0
	bl ov122_021E7BD4
	add r0, r4, #0
	bl ov122_021E7D6C
	ldr r0, [r4]
	ldr r1, _021E8220 ; =ov122_021E950C
	mov r2, #0x10
	add r3, r4, #0
	bl ov122_021E837C
	mov r2, #0x8f
	lsl r2, r2, #2
	add r1, r2, #0
	str r0, [r4, r2]
	sub r1, #0xf0
	sub r2, #0xc8
	ldr r0, [r4]
	ldr r1, [r4, r1]
	ldr r2, [r4, r2]
	bl ov122_021E8CFC
	mov r1, #9
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r0, [r4]
	bl ov122_021E84E0
	mov r1, #0x91
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r4, #0
	bl ov122_021E7094
	mov r1, #0
	mov r0, #0x46
	add r2, r1, #0
	bl sub_02004EC4
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineAToggleLayers
	mov r0, #0x10
	mov r1, #1
	bl GX_EngineBToggleLayers
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	mov r0, #1
	bl TextFlags_SetCanABSpeedUpPrint
	mov r0, #1
	bl sub_02002B8C
	ldr r0, _021E8224 ; =ov122_021E8004
	add r1, r4, #0
	bl Main_SetVBlankIntrCB
	ldr r0, [r5, #0x10]
	bl Sav2_GameStats_get
	mov r1, #6
	bl GameStats_AddSpecial
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E820C: .word 0x04000304
_021E8210: .word 0xFFFF7FFF
_021E8214: .word 0x00000229
_021E8218: .word 0x0000022A
_021E821C: .word 0x0000010A
_021E8220: .word ov122_021E950C
_021E8224: .word ov122_021E8004
	thumb_func_end ov122_021E8094

	thumb_func_start ov122_021E8228
ov122_021E8228: ; 0x021E8228
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl OverlayManager_GetData
	add r4, r0, #0
	mov r0, #0
	add r1, r0, #0
	bl Main_SetVBlankIntrCB
	mov r0, #0x91
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E84FC
	mov r0, #9
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl ov122_021E8D58
	mov r0, #0x8f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ov122_021E83A8
	add r0, r4, #0
	bl ov122_021E7B94
	mov r0, #0x4f
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl sub_02016624
	add r0, r4, #0
	bl ov122_021E745C
	add r0, r4, #0
	bl ov122_021E765C
	add r0, r4, #0
	bl ov122_021E79A4
	mov r0, #0x61
	lsl r0, r0, #2
	ldr r0, [r4, r0]
	bl ScrStrBufs_delete
	mov r0, #6
	lsl r0, r0, #6
	ldr r0, [r4, r0]
	bl DestroyMsgData
	ldr r0, [r4, #0x14]
	bl NARC_dtor
	bl ov122_021E8068
	add r0, r5, #0
	bl OverlayManager_FreeData
	mov r0, #0xa0
	bl DestroyHeap
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E8228

	thumb_func_start ov122_021E82A8
ov122_021E82A8: ; 0x021E82A8
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _021E82BE
	cmp r1, #1
	beq _021E82CA
	cmp r1, #2
	beq _021E82EE
	b _021E82FC
_021E82BE:
	bl ov122_021E8094
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E8300
_021E82CA:
	bl OverlayManager_GetData
	mov r1, #6
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r0, [r0]
	mov r1, #0x15
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E8300
_021E82EE:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E8300
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_021E82FC:
	bl GF_AssertFail
_021E8300:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E82A8

	thumb_func_start ov122_021E8308
ov122_021E8308: ; 0x021E8308
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r1, #0
	add r5, r0, #0
	bl OverlayManager_GetData
	ldr r1, [r4]
	cmp r1, #0
	beq _021E8320
	cmp r1, #1
	beq _021E8340
	b _021E8354
_021E8320:
	mov r1, #6
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r0, [r0]
	mov r1, #0x14
	str r0, [sp, #8]
	mov r0, #0
	add r2, r1, #0
	add r3, r0, #0
	bl BeginNormalPaletteFade
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _021E8358
_021E8340:
	bl IsPaletteFadeFinished
	cmp r0, #0
	beq _021E8358
	add r0, r5, #0
	bl ov122_021E8228
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, pc}
_021E8354:
	bl GF_AssertFail
_021E8358:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E8308

	thumb_func_start ov122_021E8360
ov122_021E8360: ; 0x021E8360
	push {r3, lr}
	bl OverlayManager_GetData
	mov r1, #0x8f
	lsl r1, r1, #2
	ldr r0, [r0, r1]
	bl ov122_021E83B0
	cmp r0, #0
	beq _021E8378
	mov r0, #1
	pop {r3, pc}
_021E8378:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov122_021E8360

	thumb_func_start ov122_021E837C
ov122_021E837C: ; 0x021E837C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0x10
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	str r5, [r4]
	strb r6, [r4, #0xc]
	ldr r0, _021E83A4 ; =0x0000FFFF
	str r7, [r4, #4]
	strh r0, [r4, #0xa]
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E83A4: .word 0x0000FFFF
	thumb_func_end ov122_021E837C

	thumb_func_start ov122_021E83A8
ov122_021E83A8: ; 0x021E83A8
	ldr r3, _021E83AC ; =FreeToHeap
	bx r3
	.balign 4, 0
_021E83AC: .word FreeToHeap
	thumb_func_end ov122_021E83A8

	thumb_func_start ov122_021E83B0
ov122_021E83B0: ; 0x021E83B0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldrh r2, [r4, #8]
	mov r1, #0x14
	ldr r3, [r4]
	mul r1, r2
	add r5, r3, r1
	ldrb r1, [r4, #0xd]
	cmp r1, #4
	bhi _021E847A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021E83D0: ; jump table
	.short _021E83DA - _021E83D0 - 2 ; case 0
	.short _021E83F8 - _021E83D0 - 2 ; case 1
	.short _021E8408 - _021E83D0 - 2 ; case 2
	.short _021E8434 - _021E83D0 - 2 ; case 3
	.short _021E8452 - _021E83D0 - 2 ; case 4
_021E83DA:
	ldr r2, [r5]
	cmp r2, #0
	bne _021E83E6
	mov r0, #1
	strb r0, [r4, #0xd]
	b _021E83F8
_021E83E6:
	ldr r1, [r4, #4]
	blx r2
	cmp r0, #0
	beq _021E847E
	mov r0, #0
	strb r0, [r4, #0xe]
	mov r0, #1
	strb r0, [r4, #0xd]
	b _021E847E
_021E83F8:
	ldr r2, [r5, #4]
	cmp r2, #0
	beq _021E8404
	ldr r1, [r4, #4]
	add r0, r4, #0
	blx r2
_021E8404:
	mov r0, #2
	strb r0, [r4, #0xd]
_021E8408:
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _021E8412
	bl GF_AssertFail
_021E8412:
	ldr r1, [r4, #4]
	ldr r2, [r5, #8]
	add r0, r4, #0
	blx r2
	cmp r0, #0
	beq _021E847E
	mov r0, #0
	strb r0, [r4, #0xe]
	ldr r2, [r5, #0xc]
	cmp r2, #0
	beq _021E842E
	ldr r1, [r4, #4]
	add r0, r4, #0
	blx r2
_021E842E:
	mov r0, #3
	strb r0, [r4, #0xd]
	b _021E847E
_021E8434:
	ldr r2, [r5, #0x10]
	cmp r2, #0
	bne _021E8440
	mov r0, #4
	strb r0, [r4, #0xd]
	b _021E8452
_021E8440:
	ldr r1, [r4, #4]
	blx r2
	cmp r0, #0
	beq _021E847E
	mov r0, #0
	strb r0, [r4, #0xe]
	mov r0, #4
	strb r0, [r4, #0xd]
	b _021E847E
_021E8452:
	ldrh r1, [r4, #0xa]
	ldr r0, _021E8484 ; =0x0000FFFF
	cmp r1, r0
	bne _021E845E
	bl GF_AssertFail
_021E845E:
	ldrh r0, [r4, #0xa]
	strh r0, [r4, #8]
	ldr r0, _021E8484 ; =0x0000FFFF
	strh r0, [r4, #0xa]
	ldrh r1, [r4, #8]
	sub r0, r0, #1
	cmp r1, r0
	bne _021E8472
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E8472:
	mov r0, #0
	strb r0, [r4, #0xd]
	strb r0, [r4, #0xe]
	b _021E847E
_021E847A:
	bl GF_AssertFail
_021E847E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021E8484: .word 0x0000FFFF
	thumb_func_end ov122_021E83B0

	thumb_func_start ov122_021E8488
ov122_021E8488: ; 0x021E8488
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #0
	bne _021E8496
	bl GF_AssertFail
_021E8496:
	ldr r0, _021E84AC ; =0x0000FFFE
	cmp r4, r0
	beq _021E84A6
	ldrb r0, [r5, #0xc]
	cmp r4, r0
	blt _021E84A6
	bl GF_AssertFail
_021E84A6:
	strh r4, [r5, #0xa]
	pop {r3, r4, r5, pc}
	nop
_021E84AC: .word 0x0000FFFE
	thumb_func_end ov122_021E8488

	thumb_func_start ov122_021E84B0
ov122_021E84B0: ; 0x021E84B0
	ldrh r0, [r0, #8]
	bx lr
	thumb_func_end ov122_021E84B0

	thumb_func_start ov122_021E84B4
ov122_021E84B4: ; 0x021E84B4
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xd]
	cmp r0, #1
	bne _021E84C2
	bl GF_AssertFail
_021E84C2:
	ldrb r0, [r4, #0xe]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E84B4

	thumb_func_start ov122_021E84C8
ov122_021E84C8: ; 0x021E84C8
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #0xd]
	cmp r0, #1
	bne _021E84D6
	bl GF_AssertFail
_021E84D6:
	ldrb r0, [r4, #0xe]
	add r0, r0, #1
	strb r0, [r4, #0xe]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E84C8

	thumb_func_start ov122_021E84E0
ov122_021E84E0: ; 0x021E84E0
	push {r4, lr}
	mov r1, #0x5f
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x5f
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E84E0

	thumb_func_start ov122_021E84FC
ov122_021E84FC: ; 0x021E84FC
	ldr r3, _021E8500 ; =FreeToHeap
	bx r3
	.balign 4, 0
_021E8500: .word FreeToHeap
	thumb_func_end ov122_021E84FC

	thumb_func_start ov122_021E8504
ov122_021E8504: ; 0x021E8504
	push {r4, lr}
	add r4, r0, #0
	bl ov122_021E8910
	add r0, r4, #0
	bl ov122_021E8C34
	add r0, r4, #0
	bl ov122_021E8968
	add r0, r4, #0
	bl ov122_021E8A60
	add r0, r4, #0
	bl ov122_021E8AA8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E8504

	thumb_func_start ov122_021E8528
ov122_021E8528: ; 0x021E8528
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r7, r0, #0
	bl ov122_021E87B8
	mov r0, #0x55
	lsl r0, r0, #2
	mov r4, #0
	add r5, r7, #0
	add r6, sp, #4
	add r1, r0, #4
_021E853E:
	ldr r3, [r5, r0]
	ldr r2, [r5, r1]
	add r4, r4, #1
	str r3, [r6]
	str r2, [r6, #4]
	add r5, #8
	add r6, #8
	cmp r4, #5
	blt _021E853E
	ldr r2, _021E8588 ; =0x0000014F
	mov r1, #0
	ldrb r0, [r7, r2]
	add r2, #0x2d
	str r0, [sp]
	add r0, r7, #0
	bl MI_CpuFill8
	mov r0, #0x55
	lsl r0, r0, #2
	mov r6, #0
	add r4, sp, #4
	add r5, r7, #0
	add r1, r0, #4
_021E856C:
	ldr r3, [r4]
	ldr r2, [r4, #4]
	add r6, r6, #1
	str r3, [r5, r0]
	str r2, [r5, r1]
	add r4, #8
	add r5, #8
	cmp r6, #5
	blt _021E856C
	ldr r1, _021E8588 ; =0x0000014F
	ldr r0, [sp]
	strb r0, [r7, r1]
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8588: .word 0x0000014F
	thumb_func_end ov122_021E8528

	thumb_func_start ov122_021E858C
ov122_021E858C: ; 0x021E858C
	mov r2, #5
	lsl r2, r2, #6
	str r1, [r0, r2]
	bx lr
	thumb_func_end ov122_021E858C

	thumb_func_start ov122_021E8594
ov122_021E8594: ; 0x021E8594
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	add r0, r6, #0
	bl ov122_021E8828
	add r4, r0, #0
	cmp r4, #4
	blo _021E85AA
	bl GF_AssertFail
_021E85AA:
	cmp r4, #0
	bne _021E85B4
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_021E85B4:
	mov r1, #0x53
	lsl r1, r1, #2
	ldrb r0, [r5, r1]
	add r0, r0, #1
	strb r0, [r5, r1]
	sub r0, r6, #2
	cmp r0, #1
	bhi _021E85CE
	sub r0, r1, #2
	ldrh r0, [r5, r0]
	add r2, r0, #1
	sub r0, r1, #2
	strh r2, [r5, r0]
_021E85CE:
	mov r0, #0x51
	lsl r0, r0, #2
	ldrh r1, [r5, r0]
	cmp r1, #0
	bne _021E85DC
	strh r4, [r5, r0]
	pop {r4, r5, r6, pc}
_021E85DC:
	add r2, r1, #0
	ldr r0, _021E85F0 ; =0x0000C350
	mul r2, r4
	cmp r2, r0
	ble _021E85E8
	add r2, r0, #0
_021E85E8:
	mov r0, #0x51
	lsl r0, r0, #2
	strh r2, [r5, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E85F0: .word 0x0000C350
	thumb_func_end ov122_021E8594

	thumb_func_start ov122_021E85F4
ov122_021E85F4: ; 0x021E85F4
	push {r4, lr}
	bl ov122_021E8CB8
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _021E8606
	bl GF_AssertFail
_021E8606:
	mov r0, #1
	str r0, [r4, #8]
	mov r0, #0
	str r0, [r4, #4]
	pop {r4, pc}
	thumb_func_end ov122_021E85F4

	thumb_func_start ov122_021E8610
ov122_021E8610: ; 0x021E8610
	mov r2, #0x51
	lsl r2, r2, #2
	ldrh r2, [r0, r2]
	cmp r2, #0
	beq _021E862A
	sub r2, r2, r1
	bpl _021E8620
	mov r2, #0
_021E8620:
	mov r1, #0x51
	lsl r1, r1, #2
	strh r2, [r0, r1]
	mov r0, #1
	bx lr
_021E862A:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov122_021E8610

	thumb_func_start ov122_021E8630
ov122_021E8630: ; 0x021E8630
	push {r3, lr}
	bl ov122_021E8CB8
	ldr r0, [r0, #8]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov122_021E8630

	thumb_func_start ov122_021E863C
ov122_021E863C: ; 0x021E863C
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x51
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	add r0, r0, #2
	ldrh r0, [r4, r0]
	cmp r1, r0
	bls _021E8652
	bl GF_AssertFail
_021E8652:
	mov r0, #0x51
	lsl r0, r0, #2
	ldrh r1, [r4, r0]
	add r0, r0, #2
	ldrh r0, [r4, r0]
	cmp r1, r0
	bne _021E8664
	mov r0, #1
	pop {r4, pc}
_021E8664:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov122_021E863C

	thumb_func_start ov122_021E8668
ov122_021E8668: ; 0x021E8668
	push {r3, lr}
	bl ov122_021E8CB8
	ldr r0, [r0]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov122_021E8668

	thumb_func_start ov122_021E8674
ov122_021E8674: ; 0x021E8674
	push {r4, lr}
	add r4, r2, #0
	bl ov122_021E8CB8
	ldr r0, [r0, #4]
	and r0, r4
	cmp r4, r0
	bne _021E8688
	mov r0, #1
	pop {r4, pc}
_021E8688:
	mov r0, #0
	pop {r4, pc}
	thumb_func_end ov122_021E8674

	thumb_func_start ov122_021E868C
ov122_021E868C: ; 0x021E868C
	push {r4, lr}
	add r4, r2, #0
	bl ov122_021E8CB8
	ldr r1, [r0, #4]
	add r2, r1, #0
	tst r2, r4
	beq _021E86A2
	sub r1, r1, r4
	str r1, [r0, #4]
	pop {r4, pc}
_021E86A2:
	orr r1, r4
	str r1, [r0, #4]
	pop {r4, pc}
	thumb_func_end ov122_021E868C

	thumb_func_start ov122_021E86A8
ov122_021E86A8: ; 0x021E86A8
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	cmp r6, #5
	blo _021E86B8
	bl GF_AssertFail
_021E86B8:
	cmp r4, #0
	beq _021E86C2
	cmp r4, #1
	beq _021E86CC
	b _021E86D4
_021E86C2:
	mov r0, #0x4b
	add r1, r5, r6
	lsl r0, r0, #2
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
_021E86CC:
	ldr r0, _021E86DC ; =0x00000131
	add r1, r5, r6
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
_021E86D4:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021E86DC: .word 0x00000131
	thumb_func_end ov122_021E86A8

	thumb_func_start ov122_021E86E0
ov122_021E86E0: ; 0x021E86E0
	push {r4, r5, r6, lr}
	add r6, r2, #0
	add r5, r0, #0
	add r4, r1, #0
	cmp r6, #5
	blo _021E86F0
	bl GF_AssertFail
_021E86F0:
	cmp r4, #0
	beq _021E86FA
	cmp r4, #1
	beq _021E8702
	b _021E870A
_021E86FA:
	ldr r0, _021E8714 ; =0x00000136
	add r1, r5, r6
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
_021E8702:
	ldr r0, _021E8718 ; =0x0000013B
	add r1, r5, r6
	ldrb r0, [r1, r0]
	pop {r4, r5, r6, pc}
_021E870A:
	bl GF_AssertFail
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_021E8714: .word 0x00000136
_021E8718: .word 0x0000013B
	thumb_func_end ov122_021E86E0

	thumb_func_start ov122_021E871C
ov122_021E871C: ; 0x021E871C
	push {r4, lr}
	mov r4, #0
	cmp r1, #0
	beq _021E872A
	cmp r1, #1
	beq _021E8748
	b _021E8766
_021E872A:
	mov r3, #0xc
	mul r3, r2
	add r1, r4, #0
	add r2, r0, r3
_021E8732:
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _021E873E
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_021E873E:
	add r1, r1, #1
	add r2, #0x3c
	cmp r1, #5
	blt _021E8732
	b _021E876A
_021E8748:
	mov r3, #0x3c
	mul r3, r2
	add r1, r4, #0
	add r2, r0, r3
_021E8750:
	ldr r0, [r2, #8]
	cmp r0, #0
	beq _021E875C
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_021E875C:
	add r1, r1, #1
	add r2, #0xc
	cmp r1, #5
	blt _021E8750
	b _021E876A
_021E8766:
	bl GF_AssertFail
_021E876A:
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E871C

	thumb_func_start ov122_021E8770
ov122_021E8770: ; 0x021E8770
	mov r1, #0x51
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	bx lr
	thumb_func_end ov122_021E8770

	thumb_func_start ov122_021E8778
ov122_021E8778: ; 0x021E8778
	mov r1, #0x52
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end ov122_021E8778

	thumb_func_start ov122_021E8784
ov122_021E8784: ; 0x021E8784
	ldr r1, _021E8790 ; =0x0000014A
	ldrh r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	nop
_021E8790: .word 0x0000014A
	thumb_func_end ov122_021E8784

	thumb_func_start ov122_021E8794
ov122_021E8794: ; 0x021E8794
	ldr r1, _021E879C ; =0x0000014E
	ldrb r0, [r0, r1]
	bx lr
	nop
_021E879C: .word 0x0000014E
	thumb_func_end ov122_021E8794

	thumb_func_start ov122_021E87A0
ov122_021E87A0: ; 0x021E87A0
	push {r4, lr}
	add r4, r0, #0
	bl ov122_021E8808
	ldrb r1, [r0, #6]
	ldr r0, _021E87B4 ; =0x0000014E
	ldrb r0, [r4, r0]
	sub r0, r1, r0
	pop {r4, pc}
	nop
_021E87B4: .word 0x0000014E
	thumb_func_end ov122_021E87A0

	thumb_func_start ov122_021E87B8
ov122_021E87B8: ; 0x021E87B8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, _021E8804 ; =0x0000014F
	ldrb r0, [r4, r0]
	cmp r0, #5
	blo _021E87C8
	bl GF_AssertFail
_021E87C8:
	mov r2, #0x55
	lsl r2, r2, #2
	sub r1, r2, #5
	ldrb r1, [r4, r1]
	add r3, r2, #0
	sub r3, #0x14
	ldr r3, [r4, r3]
	add r0, r4, r2
	lsl r5, r1, #3
	add r1, r0, r5
	str r3, [r0, r5]
	add r0, r2, #0
	sub r0, #8
	ldrb r0, [r4, r0]
	strb r0, [r1, #4]
	sub r0, r2, #7
	ldrb r0, [r4, r0]
	strb r0, [r1, #5]
	sub r0, r2, #6
	ldrb r0, [r4, r0]
	strb r0, [r1, #6]
	sub r0, r2, #5
	ldrb r0, [r4, r0]
	mov r1, #5
	add r0, r0, #1
	bl _s32_div_f
	ldr r0, _021E8804 ; =0x0000014F
	strb r1, [r4, r0]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E8804: .word 0x0000014F
	thumb_func_end ov122_021E87B8

	thumb_func_start ov122_021E8808
ov122_021E8808: ; 0x021E8808
	ldr r1, _021E8824 ; =0x0000014F
	ldrb r1, [r0, r1]
	cmp r1, #0
	bne _021E8814
	mov r2, #4
	b _021E8816
_021E8814:
	sub r2, r1, #1
_021E8816:
	mov r1, #0x55
	lsl r1, r1, #2
	add r1, r0, r1
	lsl r0, r2, #3
	add r0, r1, r0
	bx lr
	nop
_021E8824: .word 0x0000014F
	thumb_func_end ov122_021E8808

	thumb_func_start ov122_021E8828
ov122_021E8828: ; 0x021E8828
	cmp r0, #1
	beq _021E8836
	cmp r0, #2
	beq _021E883A
	cmp r0, #3
	beq _021E883E
	b _021E8842
_021E8836:
	mov r0, #1
	bx lr
_021E883A:
	mov r0, #2
	bx lr
_021E883E:
	mov r0, #3
	bx lr
_021E8842:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end ov122_021E8828

	thumb_func_start ov122_021E8848
ov122_021E8848: ; 0x021E8848
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ov122_021E8808
	ldr r2, [r0]
	cmp r2, #2
	bne _021E8860
	ldrb r1, [r0, #5]
	cmp r1, #0x46
	blo _021E8860
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E8860:
	ldrb r1, [r0, #5]
	cmp r1, #0x28
	blo _021E888A
	mov r3, #0x55
	lsl r3, r3, #2
	mov r5, #0
	add r4, r4, r3
_021E886E:
	ldrb r3, [r4, #4]
	cmp r3, #8
	blo _021E8882
	ldr r3, [r4]
	cmp r3, #3
	beq _021E8882
	add r5, r5, #1
	add r4, #8
	cmp r5, #5
	blt _021E886E
_021E8882:
	cmp r5, #5
	bne _021E888A
	mov r0, #0
	pop {r3, r4, r5, pc}
_021E888A:
	cmp r1, #0x3c
	blo _021E8894
	ldrb r3, [r0, #4]
	cmp r3, #7
	bhs _021E889C
_021E8894:
	cmp r1, #0x32
	blo _021E88A0
	cmp r2, #2
	bne _021E88A0
_021E889C:
	mov r0, #1
	pop {r3, r4, r5, pc}
_021E88A0:
	cmp r1, #0x32
	blo _021E88AA
	ldrb r3, [r0, #4]
	cmp r3, #6
	bhs _021E88B2
_021E88AA:
	cmp r1, #0x28
	blo _021E88B6
	cmp r2, #2
	bne _021E88B6
_021E88B2:
	mov r0, #2
	pop {r3, r4, r5, pc}
_021E88B6:
	cmp r1, #0x28
	blo _021E88C0
	ldrb r3, [r0, #4]
	cmp r3, #5
	bhs _021E88C8
_021E88C0:
	cmp r1, #0x1e
	blo _021E88CC
	cmp r2, #2
	bne _021E88CC
_021E88C8:
	mov r0, #3
	pop {r3, r4, r5, pc}
_021E88CC:
	cmp r1, #0x1e
	blo _021E88D6
	ldrb r3, [r0, #4]
	cmp r3, #4
	bhs _021E88DE
_021E88D6:
	cmp r1, #0x14
	blo _021E88E2
	cmp r2, #2
	bne _021E88E2
_021E88DE:
	mov r0, #4
	pop {r3, r4, r5, pc}
_021E88E2:
	cmp r1, #0x14
	blo _021E88EC
	ldrb r3, [r0, #4]
	cmp r3, #3
	bhs _021E88F4
_021E88EC:
	cmp r1, #0xa
	blo _021E88F8
	cmp r2, #2
	bne _021E88F8
_021E88F4:
	mov r0, #5
	pop {r3, r4, r5, pc}
_021E88F8:
	cmp r1, #0xa
	blo _021E8902
	ldrb r0, [r0, #4]
	cmp r0, #2
	bhs _021E8906
_021E8902:
	cmp r2, #2
	bne _021E890A
_021E8906:
	mov r0, #6
	pop {r3, r4, r5, pc}
_021E890A:
	mov r0, #7
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E8848

	thumb_func_start ov122_021E8910
ov122_021E8910: ; 0x021E8910
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl MTRandom
	mov r1, #0x64
	bl _u32_div_f
	add r0, r7, #0
	add r6, r1, #0
	bl ov122_021E8848
	str r0, [sp]
	cmp r0, #8
	blt _021E8930
	bl GF_AssertFail
_021E8930:
	ldr r0, [sp]
	mov r1, #0x50
	ldr r2, _021E8960 ; =ov122_021E978C
	mul r1, r0
	mov r4, #0
	add r5, r2, r1
_021E893C:
	ldrb r0, [r5]
	cmp r6, r0
	blt _021E8952
	cmp r4, #0x50
	blt _021E894A
	bl GF_AssertFail
_021E894A:
	add r4, r4, #1
	add r5, r5, #1
	cmp r4, #0x50
	blt _021E893C
_021E8952:
	ldr r1, _021E8964 ; =0x0000014E
	ldr r0, [sp]
	strb r0, [r7, r1]
	sub r0, r1, #1
	strb r4, [r7, r0]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8960: .word ov122_021E978C
_021E8964: .word 0x0000014E
	thumb_func_end ov122_021E8910

	thumb_func_start ov122_021E8968
ov122_021E8968: ; 0x021E8968
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #0x10]
	ldr r0, [sp]
	ldr r7, _021E89F4 ; =0x00000131
	str r0, [sp, #8]
_021E8978:
	ldr r1, [sp]
	ldr r0, [sp, #0x10]
	ldr r5, [sp, #8]
	add r4, r1, r0
	mov r1, #0
	ldr r0, _021E89F4 ; =0x00000131
	add r6, r1, #0
	strb r1, [r4, r0]
_021E8988:
	ldr r0, [r5]
	bl ov122_021E8828
	ldrb r1, [r4, r7]
	add r6, r6, #1
	add r5, #0xc
	add r0, r1, r0
	strb r0, [r4, r7]
	cmp r6, #5
	blt _021E8988
	ldr r0, [sp, #8]
	add r0, #0x3c
	str r0, [sp, #8]
	ldr r0, [sp, #0x10]
	add r0, r0, #1
	str r0, [sp, #0x10]
	cmp r0, #5
	blt _021E8978
	mov r0, #0
	mov r7, #0x4b
	str r0, [sp, #4]
	str r0, [sp, #0xc]
	lsl r7, r7, #2
_021E89B6:
	ldr r1, [sp]
	ldr r0, [sp, #4]
	add r4, r1, r0
	mov r0, #0x4b
	mov r1, #0
	lsl r0, r0, #2
	strb r1, [r4, r0]
	add r6, r1, #0
	ldr r1, [sp]
	ldr r0, [sp, #0xc]
	add r5, r1, r0
_021E89CC:
	ldr r0, [r5]
	bl ov122_021E8828
	ldrb r1, [r4, r7]
	add r6, r6, #1
	add r5, #0x3c
	add r0, r1, r0
	strb r0, [r4, r7]
	cmp r6, #5
	blt _021E89CC
	ldr r0, [sp, #0xc]
	add r0, #0xc
	str r0, [sp, #0xc]
	ldr r0, [sp, #4]
	add r0, r0, #1
	str r0, [sp, #4]
	cmp r0, #5
	blt _021E89B6
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021E89F4: .word 0x00000131
	thumb_func_end ov122_021E8968

	thumb_func_start ov122_021E89F8
ov122_021E89F8: ; 0x021E89F8
	push {r4, r5, r6, r7}
	ldr r1, _021E8A58 ; =0x0000013B
	mov r3, #0
	add r5, r0, #0
_021E8A00:
	ldr r4, _021E8A58 ; =0x0000013B
	add r2, r0, r3
	mov r6, #0
	strb r6, [r2, r4]
	add r4, r6, #0
	add r6, r5, #0
_021E8A0C:
	ldr r7, [r6]
	cmp r7, #4
	bne _021E8A18
	ldrb r7, [r2, r1]
	add r7, r7, #1
	strb r7, [r2, r1]
_021E8A18:
	add r4, r4, #1
	add r6, #0xc
	cmp r4, #5
	blt _021E8A0C
	add r3, r3, #1
	add r5, #0x3c
	cmp r3, #5
	blt _021E8A00
	mov r6, #0
	ldr r1, _021E8A5C ; =0x00000136
	add r3, r6, #0
_021E8A2E:
	ldr r4, _021E8A5C ; =0x00000136
	add r2, r0, r6
	mov r5, #0
	strb r5, [r2, r4]
	add r4, r0, r3
_021E8A38:
	ldr r7, [r4]
	cmp r7, #4
	bne _021E8A44
	ldrb r7, [r2, r1]
	add r7, r7, #1
	strb r7, [r2, r1]
_021E8A44:
	add r5, r5, #1
	add r4, #0x3c
	cmp r5, #5
	blt _021E8A38
	add r6, r6, #1
	add r3, #0xc
	cmp r6, #5
	blt _021E8A2E
	pop {r4, r5, r6, r7}
	bx lr
	.balign 4, 0
_021E8A58: .word 0x0000013B
_021E8A5C: .word 0x00000136
	thumb_func_end ov122_021E89F8

	thumb_func_start ov122_021E8A60
ov122_021E8A60: ; 0x021E8A60
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	mov r5, #1
	mov r4, #0
_021E8A68:
	lsl r1, r4, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	bl ov122_021E8CB8
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	bne _021E8A7E
	bl GF_AssertFail
_021E8A7E:
	ldr r0, [r6]
	cmp r0, #4
	beq _021E8A8C
	bl ov122_021E8828
	mul r0, r5
	add r5, r0, #0
_021E8A8C:
	add r4, r4, #1
	cmp r4, #0x19
	blt _021E8A68
	ldr r0, _021E8AA0 ; =0x0000C350
	cmp r5, r0
	ble _021E8A9A
	add r5, r0, #0
_021E8A9A:
	ldr r0, _021E8AA4 ; =0x00000146
	strh r5, [r7, r0]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8AA0: .word 0x0000C350
_021E8AA4: .word 0x00000146
	thumb_func_end ov122_021E8A60

	thumb_func_start ov122_021E8AA8
ov122_021E8AA8: ; 0x021E8AA8
	push {r3, r4, r5, r6, r7, lr}
	mov r7, #0x52
	add r5, r0, #0
	mov r4, #0
	lsl r7, r7, #2
_021E8AB2:
	lsl r1, r4, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl ov122_021E8CB8
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	bne _021E8AC8
	bl GF_AssertFail
_021E8AC8:
	ldr r0, [r6]
	sub r0, r0, #2
	cmp r0, #1
	bhi _021E8AD6
	ldrh r0, [r5, r7]
	add r0, r0, #1
	strh r0, [r5, r7]
_021E8AD6:
	add r4, r4, #1
	cmp r4, #0x19
	blt _021E8AB2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov122_021E8AA8

	thumb_func_start ov122_021E8AE0
ov122_021E8AE0: ; 0x021E8AE0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	mov r6, #0
	add r7, r2, #0
	str r0, [sp]
	str r1, [sp, #4]
	add r5, r3, #0
	add r4, r6, #0
	cmp r7, #0
	ble _021E8B2E
_021E8AF4:
	cmp r5, #0
	beq _021E8B06
	bl MTRandom
	mov r1, #0x19
	bl _u32_div_f
	lsl r0, r1, #0x18
	b _021E8B08
_021E8B06:
	lsl r0, r4, #0x18
_021E8B08:
	lsr r1, r0, #0x18
	ldr r0, [sp]
	bl ov122_021E8CB8
	ldr r1, [r0]
	cmp r1, #1
	beq _021E8B1A
	cmp r5, #0
	bne _021E8B20
_021E8B1A:
	ldr r1, [sp, #4]
	str r1, [r0]
	b _021E8B28
_021E8B20:
	add r6, r6, #1
	cmp r6, #0x64
	bge _021E8B2E
	sub r4, r4, #1
_021E8B28:
	add r4, r4, #1
	cmp r4, r7
	blt _021E8AF4
_021E8B2E:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ov122_021E8AE0

	thumb_func_start ov122_021E8B34
ov122_021E8B34: ; 0x021E8B34
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r7, r0, #0
	mov r1, #0
	add r0, sp, #0x10
	str r1, [sp]
	add r0, #1
	strb r1, [r0]
	ldr r1, [sp]
	strb r1, [r0, #1]
	ldr r1, [sp]
	strb r1, [r0, #2]
	ldr r1, [sp]
	strb r1, [r0, #3]
	ldr r1, [sp]
	strb r1, [r0, #4]
	ldr r1, [sp]
	add r0, sp, #0xc
	strb r1, [r0]
	ldr r1, [sp]
	strb r1, [r0, #1]
	ldr r1, [sp]
	strb r1, [r0, #2]
	ldr r1, [sp]
	strb r1, [r0, #3]
	ldr r1, [sp]
	strb r1, [r0, #4]
	ldr r0, _021E8C2C ; =0x0000014D
	ldr r1, _021E8C30 ; =ov122_021E964C
	ldrb r0, [r7, r0]
	ldr r4, [sp]
	lsl r0, r0, #2
	add r0, r1, r0
	str r0, [sp, #4]
_021E8B78:
	lsl r1, r4, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	bl ov122_021E8CB8
	ldr r0, [r0]
	sub r0, r0, #2
	cmp r0, #1
	bhi _021E8BE4
	add r0, r4, #0
	mov r1, #5
	bl _s32_div_f
	add r5, r1, #0
	add r0, r4, #0
	mov r1, #5
	bl _s32_div_f
	lsl r2, r5, #0x18
	add r6, r0, #0
	add r0, r7, #0
	mov r1, #0
	lsr r2, r2, #0x18
	bl ov122_021E86E0
	lsl r2, r6, #0x18
	str r0, [sp, #8]
	add r0, r7, #0
	mov r1, #1
	lsr r2, r2, #0x18
	bl ov122_021E86E0
	cmp r0, #0
	beq _021E8BC2
	ldr r0, [sp, #8]
	cmp r0, #0
	bne _021E8BE4
_021E8BC2:
	add r0, sp, #0x10
	add r0, #1
	ldrb r0, [r0, r5]
	add r1, r0, #1
	add r0, sp, #0x10
	add r0, #1
	strb r1, [r0, r5]
	add r0, sp, #0xc
	ldrb r0, [r0, r6]
	add r1, r0, #1
	add r0, sp, #0xc
	strb r1, [r0, r6]
	ldr r0, [sp]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
_021E8BE4:
	add r4, r4, #1
	cmp r4, #0x19
	blt _021E8B78
	ldr r0, [sp, #4]
	ldrb r1, [r0, #3]
	lsl r0, r1, #0x18
	lsr r2, r0, #0x1c
	ldr r0, [sp]
	cmp r2, r0
	bhi _021E8BFE
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E8BFE:
	add r2, sp, #0x10
	lsl r0, r1, #0x1c
	mov r4, #0
	add r2, #1
	add r3, sp, #0xc
	lsr r1, r0, #0x1c
_021E8C0A:
	ldrb r0, [r2]
	cmp r1, r0
	bls _021E8C16
	ldrb r0, [r3]
	cmp r1, r0
	bhi _021E8C1C
_021E8C16:
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021E8C1C:
	add r4, r4, #1
	add r2, r2, #1
	add r3, r3, #1
	cmp r4, #5
	blt _021E8C0A
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021E8C2C: .word 0x0000014D
_021E8C30: .word ov122_021E964C
	thumb_func_end ov122_021E8B34

	thumb_func_start ov122_021E8C34
ov122_021E8C34: ; 0x021E8C34
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _021E8CA8 ; =0x0000014D
	ldrb r0, [r5, r0]
	cmp r0, #0x50
	blo _021E8C44
	bl GF_AssertFail
_021E8C44:
	ldr r0, _021E8CA8 ; =0x0000014D
	mov r4, #0
	ldrb r0, [r5, r0]
	lsl r1, r0, #2
	ldr r0, _021E8CAC ; =ov122_021E964C
	ldrb r0, [r0, r1]
	str r0, [sp]
	ldr r0, _021E8CB0 ; =ov122_021E964D
	ldrb r7, [r0, r1]
	ldr r0, _021E8CB4 ; =ov122_021E964E
	ldrb r6, [r0, r1]
_021E8C5A:
	add r0, r5, #0
	mov r1, #1
	mov r2, #0x19
	mov r3, #0
	bl ov122_021E8AE0
	ldr r2, [sp]
	add r0, r5, #0
	mov r1, #4
	mov r3, #1
	bl ov122_021E8AE0
	add r0, r5, #0
	mov r1, #2
	add r2, r7, #0
	mov r3, #1
	bl ov122_021E8AE0
	add r0, r5, #0
	mov r1, #3
	add r2, r6, #0
	mov r3, #1
	bl ov122_021E8AE0
	add r0, r5, #0
	bl ov122_021E89F8
	add r0, r5, #0
	bl ov122_021E8B34
	cmp r0, #0
	beq _021E8CA4
	mov r0, #0xfa
	add r4, r4, #1
	lsl r0, r0, #2
	cmp r4, r0
	blt _021E8C5A
_021E8CA4:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E8CA8: .word 0x0000014D
_021E8CAC: .word ov122_021E964C
_021E8CB0: .word ov122_021E964D
_021E8CB4: .word ov122_021E964E
	thumb_func_end ov122_021E8C34

	thumb_func_start ov122_021E8CB8
ov122_021E8CB8: ; 0x021E8CB8
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r0, #0
	cmp r5, #0x19
	blo _021E8CC6
	bl GF_AssertFail
_021E8CC6:
	add r0, r5, #0
	mov r1, #5
	bl _s32_div_f
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	mov r1, #5
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r5, r0, #0x18
	cmp r4, #5
	blo _021E8CE6
	bl GF_AssertFail
_021E8CE6:
	cmp r5, #5
	blo _021E8CEE
	bl GF_AssertFail
_021E8CEE:
	mov r0, #0x3c
	mul r0, r4
	add r1, r6, r0
	mov r0, #0xc
	mul r0, r5
	add r0, r1, r0
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E8CB8

	thumb_func_start ov122_021E8CFC
ov122_021E8CFC: ; 0x021E8CFC
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r6, r0, #0
	add r7, r2, #0
	cmp r5, #0
	bne _021E8D0E
	bl GF_AssertFail
_021E8D0E:
	add r0, r6, #0
	mov r1, #0x10
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x10
	bl MI_CpuFill8
	str r5, [r4]
	str r7, [r4, #4]
	mov r0, #1
	str r0, [sp]
	ldrb r0, [r4, #0xd]
	ldr r1, _021E8D4C ; =ov122_021E9AAC
	ldr r2, _021E8D50 ; =ov122_021E9A0C
	str r0, [sp, #4]
	ldr r0, _021E8D54 ; =ov122_021E9A3C
	str r6, [sp, #8]
	add r3, r4, #0
	bl sub_02019BA4
	str r0, [r4, #8]
	add r0, r4, #0
	mov r1, #0
	bl ov122_021E9108
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_021E8D4C: .word ov122_021E9AAC
_021E8D50: .word ov122_021E9A0C
_021E8D54: .word ov122_021E9A3C
	thumb_func_end ov122_021E8CFC

	thumb_func_start ov122_021E8D58
ov122_021E8D58: ; 0x021E8D58
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _021E8D66
	bl GF_AssertFail
_021E8D66:
	ldr r0, [r4, #8]
	bl sub_02019BDC
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end ov122_021E8D58

	thumb_func_start ov122_021E8D74
ov122_021E8D74: ; 0x021E8D74
	push {r3, lr}
	ldrb r1, [r0, #0xf]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1f
	beq _021E8D84
	bl ov122_021E8F6C
	pop {r3, pc}
_021E8D84:
	bl ov122_021E9020
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov122_021E8D74

	thumb_func_start ov122_021E8D8C
ov122_021E8D8C: ; 0x021E8D8C
	push {r4, lr}
	add r4, r0, #0
	cmp r1, #0
	ldr r0, [r4]
	beq _021E8D9E
	mov r1, #1
	bl sub_0200DCE8
	pop {r4, pc}
_021E8D9E:
	mov r1, #0
	bl sub_0200DCE8
	mov r0, #0
	strb r0, [r4, #0xd]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E8D8C

	thumb_func_start ov122_021E8DAC
ov122_021E8DAC: ; 0x021E8DAC
	ldrb r2, [r0, #0xf]
	mov r3, #1
	lsl r1, r1, #0x18
	bic r2, r3
	lsr r3, r1, #0x18
	mov r1, #1
	and r1, r3
	orr r1, r2
	strb r1, [r0, #0xf]
	ldr r3, _021E8DC4 ; =ov122_021E9154
	ldrb r1, [r0, #0xd]
	bx r3
	.balign 4, 0
_021E8DC4: .word ov122_021E9154
	thumb_func_end ov122_021E8DAC

	thumb_func_start ov122_021E8DC8
ov122_021E8DC8: ; 0x021E8DC8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldrb r1, [r5, #0xf]
	mov r2, #2
	bic r1, r2
	lsl r2, r4, #0x18
	lsr r2, r2, #0x18
	lsl r2, r2, #0x1f
	lsr r2, r2, #0x1e
	orr r1, r2
	strb r1, [r5, #0xf]
	ldrb r1, [r5, #0xd]
	bl ov122_021E9154
	ldr r0, [r5, #4]
	add r1, r4, #0
	bl sub_0200DCE8
	pop {r3, r4, r5, pc}
	thumb_func_end ov122_021E8DC8

	thumb_func_start ov122_021E8DF0
ov122_021E8DF0: ; 0x021E8DF0
	push {r4, lr}
	add r4, r0, #0
	bne _021E8DFA
	bl GF_AssertFail
_021E8DFA:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _021E8E04
	bl GF_AssertFail
_021E8E04:
	ldr r0, [r4, #8]
	bl sub_02019F74
	pop {r4, pc}
	thumb_func_end ov122_021E8DF0

	thumb_func_start ov122_021E8E0C
ov122_021E8E0C: ; 0x021E8E0C
	push {r4, lr}
	add r4, r0, #0
	bne _021E8E16
	bl GF_AssertFail
_021E8E16:
	ldr r0, [r4, #8]
	cmp r0, #0
	bne _021E8E20
	bl GF_AssertFail
_021E8E20:
	ldrb r0, [r4, #0xe]
	lsl r0, r0, #0x1c
	lsr r0, r0, #0x1c
	pop {r4, pc}
	thumb_func_end ov122_021E8E0C

	thumb_func_start ov122_021E8E28
ov122_021E8E28: ; 0x021E8E28
	push {r3, lr}
	ldr r0, [r0, #8]
	bl sub_02019F74
	cmp r0, #0x19
	beq _021E8E3C
	cmp r0, #0x1a
	beq _021E8E3C
	mov r0, #1
	pop {r3, pc}
_021E8E3C:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ov122_021E8E28

	thumb_func_start ov122_021E8E40
ov122_021E8E40: ; 0x021E8E40
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	mov r1, #0
	bl sub_02019F7C
	add r0, r4, #0
	mov r1, #0
	bl ov122_021E9108
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov122_021E8E40

	thumb_func_start ov122_021E8E58
ov122_021E8E58: ; 0x021E8E58
	ldrb r2, [r0, #0xe]
	mov r1, #0xf
	ldr r3, _021E8E6C ; =ov122_021E9134
	bic r2, r1
	strb r2, [r0, #0xe]
	ldrb r2, [r0, #0xe]
	mov r1, #0xf0
	bic r2, r1
	strb r2, [r0, #0xe]
	bx r3
	.balign 4, 0
_021E8E6C: .word ov122_021E9134
	thumb_func_end ov122_021E8E58

	thumb_func_start ov122_021E8E70
ov122_021E8E70: ; 0x021E8E70
	ldrb r0, [r0, #0xf]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	bx lr
	thumb_func_end ov122_021E8E70

	thumb_func_start ov122_021E8E78
ov122_021E8E78: ; 0x021E8E78
	push {r4, lr}
	add r1, r0, #0
	ldrb r3, [r1, #0xe]
	ldr r2, _021E8F50 ; =gSystem
	mov r4, #0x80
	lsl r0, r3, #0x1c
	ldr r2, [r2, #0x4c]
	lsr r0, r0, #0x1c
	tst r4, r2
	beq _021E8EA8
	add r4, r0, #2
	cmp r4, #4
	ble _021E8E94
	mov r4, #4
_021E8E94:
	ldrb r2, [r1, #0xe]
	mov r3, #0xf
	bic r2, r3
	lsl r3, r4, #0x18
	lsr r4, r3, #0x18
	mov r3, #0xf
	and r3, r4
	orr r2, r3
	strb r2, [r1, #0xe]
	b _021E8F2A
_021E8EA8:
	mov r4, #0x20
	tst r4, r2
	beq _021E8EC8
	sub r4, r0, #1
	bpl _021E8EB4
	mov r4, #0
_021E8EB4:
	ldrb r2, [r1, #0xe]
	mov r3, #0xf
	bic r2, r3
	lsl r3, r4, #0x18
	lsr r4, r3, #0x18
	mov r3, #0xf
	and r3, r4
	orr r2, r3
	strb r2, [r1, #0xe]
	b _021E8F2A
_021E8EC8:
	mov r4, #0x40
	tst r4, r2
	beq _021E8F0A
	cmp r0, #4
	bne _021E8EF0
	lsl r2, r3, #0x18
	lsr r2, r2, #0x1c
	add r4, r2, #0
	add r4, #0xfe
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
	cmp r4, #1
	bhi _021E8EF0
	mov r4, #0xf
	bic r3, r4
	mov r4, #0xf
	and r2, r4
	orr r2, r3
	strb r2, [r1, #0xe]
	b _021E8F2A
_021E8EF0:
	sub r4, r0, #2
	bpl _021E8EF6
	mov r4, #0
_021E8EF6:
	ldrb r2, [r1, #0xe]
	mov r3, #0xf
	bic r2, r3
	lsl r3, r4, #0x18
	lsr r4, r3, #0x18
	mov r3, #0xf
	and r3, r4
	orr r2, r3
	strb r2, [r1, #0xe]
	b _021E8F2A
_021E8F0A:
	mov r3, #0x10
	tst r2, r3
	beq _021E8F2A
	add r4, r0, #1
	cmp r4, #4
	ble _021E8F18
	mov r4, #4
_021E8F18:
	ldrb r2, [r1, #0xe]
	mov r3, #0xf
	bic r2, r3
	lsl r3, r4, #0x18
	lsr r4, r3, #0x18
	mov r3, #0xf
	and r3, r4
	orr r2, r3
	strb r2, [r1, #0xe]
_021E8F2A:
	ldrb r3, [r1, #0xe]
	lsl r2, r3, #0x1c
	lsr r2, r2, #0x1c
	cmp r0, r2
	beq _021E8F4C
	mov r2, #0xf0
	lsl r0, r0, #0x1c
	bic r3, r2
	lsr r0, r0, #0x18
	orr r0, r3
	strb r0, [r1, #0xe]
	add r0, r1, #0
	bl ov122_021E9134
	ldr r0, _021E8F54 ; =0x000005DC
	bl PlaySE
_021E8F4C:
	pop {r4, pc}
	nop
_021E8F50: .word gSystem
_021E8F54: .word 0x000005DC
	thumb_func_end ov122_021E8E78

	thumb_func_start ov122_021E8F58
ov122_021E8F58: ; 0x021E8F58
	ldrb r2, [r0, #0xe]
	mov r1, #0xf
	ldr r3, _021E8F68 ; =ov122_021E9134
	bic r2, r1
	mov r1, #4
	orr r1, r2
	strb r1, [r0, #0xe]
	bx r3
	.balign 4, 0
_021E8F68: .word ov122_021E9134
	thumb_func_end ov122_021E8F58

	thumb_func_start ov122_021E8F6C
ov122_021E8F6C: ; 0x021E8F6C
	push {r4, lr}
	add r4, r0, #0
	ldrb r2, [r4, #0xf]
	mov r1, #4
	bic r2, r1
	strb r2, [r4, #0xf]
	ldr r1, _021E9018 ; =gSystem
	mov r2, #1
	ldr r1, [r1, #0x48]
	lsl r2, r2, #0xa
	tst r2, r1
	beq _021E8F88
	mov r0, #4
	pop {r4, pc}
_021E8F88:
	mov r2, #2
	tst r2, r1
	beq _021E8F96
	bl ov122_021E8F58
	mov r0, #3
	pop {r4, pc}
_021E8F96:
	mov r2, #1
	tst r1, r2
	beq _021E8FB2
	ldrb r1, [r4, #0xe]
	lsl r1, r1, #0x1c
	lsr r1, r1, #0x1c
	cmp r1, #4
	bne _021E8FAE
	bl ov122_021E8F58
	mov r0, #3
	pop {r4, pc}
_021E8FAE:
	add r0, r2, #0
	pop {r4, pc}
_021E8FB2:
	bl ov122_021E8E78
	ldrb r1, [r4, #0xf]
	mov r0, #4
	orr r0, r1
	strb r0, [r4, #0xf]
	ldr r0, _021E901C ; =ov122_021E9A1C
	bl sub_02025224
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #8
	bhs _021E9012
	cmp r0, #4
	beq _021E8FDA
	cmp r0, #5
	beq _021E8FF2
	cmp r0, #6
	beq _021E8FF6
	b _021E8FFA
_021E8FDA:
	ldrb r2, [r4, #0xe]
	mov r1, #0xf
	bic r2, r1
	mov r1, #0xf
	and r0, r1
	orr r0, r2
	strb r0, [r4, #0xe]
	add r0, r4, #0
	bl ov122_021E9134
	mov r0, #3
	pop {r4, pc}
_021E8FF2:
	mov r0, #4
	pop {r4, pc}
_021E8FF6:
	mov r0, #2
	pop {r4, pc}
_021E8FFA:
	ldrb r2, [r4, #0xe]
	mov r1, #0xf
	bic r2, r1
	mov r1, #0xf
	and r0, r1
	orr r0, r2
	strb r0, [r4, #0xe]
	add r0, r4, #0
	bl ov122_021E9134
	mov r0, #1
	pop {r4, pc}
_021E9012:
	mov r0, #0
	pop {r4, pc}
	nop
_021E9018: .word gSystem
_021E901C: .word ov122_021E9A1C
	thumb_func_end ov122_021E8F6C

	thumb_func_start ov122_021E9020
ov122_021E9020: ; 0x021E9020
	push {r4, r5, r6, lr}
	add r4, r0, #0
	ldr r0, [r4, #8]
	bl sub_02019F74
	add r6, r0, #0
	ldr r0, [r4, #8]
	bl sub_02019D18
	add r5, r0, #0
	ldr r0, [r4, #8]
	bl sub_02019F74
	cmp r5, #0x1c
	bhs _021E9082
	bl System_GetTouchNew
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	lsl r0, r0, #0x1f
	ldrb r1, [r4, #0xf]
	mov r2, #4
	lsr r0, r0, #0x1d
	bic r1, r2
	orr r0, r1
	strb r0, [r4, #0xf]
	cmp r5, #0x19
	bne _021E9076
	ldrb r0, [r4, #0xf]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1f
	beq _021E906C
	strb r6, [r4, #0xd]
	ldrb r1, [r4, #0xd]
	ldr r0, [r4, #8]
	bl sub_02019F7C
	b _021E9072
_021E906C:
	add r0, r4, #0
	bl ov122_021E8E40
_021E9072:
	mov r0, #4
	pop {r4, r5, r6, pc}
_021E9076:
	cmp r5, #0x1a
	bne _021E907E
	mov r0, #2
	pop {r4, r5, r6, pc}
_021E907E:
	mov r0, #1
	pop {r4, r5, r6, pc}
_021E9082:
	ldrb r1, [r4, #0xf]
	mov r0, #4
	bic r1, r0
	ldr r0, _021E9100 ; =gSystem
	strb r1, [r4, #0xf]
	ldr r1, [r0, #0x48]
	mov r0, #1
	lsl r0, r0, #0xa
	tst r0, r1
	beq _021E90AC
	ldrb r0, [r4, #0xd]
	add r0, #0xe7
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _021E90A8
	add r0, r4, #0
	bl ov122_021E8E40
_021E90A8:
	mov r0, #4
	pop {r4, r5, r6, pc}
_021E90AC:
	mov r0, #2
	tst r0, r1
	beq _021E90B6
	mov r0, #3
	pop {r4, r5, r6, pc}
_021E90B6:
	ldrb r0, [r4, #0xf]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021E90FA
	ldrb r0, [r4, #0xd]
	cmp r0, #0x19
	beq _021E90FA
	cmp r0, #0x1a
	beq _021E90FA
	ldr r0, _021E9104 ; =ov122_021E9A1C
	bl sub_02025224
	cmp r0, #8
	bhs _021E90FA
	cmp r0, #3
	bhi _021E90FA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_021E90E2: ; jump table
	.short _021E90EA - _021E90E2 - 2 ; case 0
	.short _021E90EE - _021E90E2 - 2 ; case 1
	.short _021E90F2 - _021E90E2 - 2 ; case 2
	.short _021E90F6 - _021E90E2 - 2 ; case 3
_021E90EA:
	mov r0, #5
	pop {r4, r5, r6, pc}
_021E90EE:
	mov r0, #6
	pop {r4, r5, r6, pc}
_021E90F2:
	mov r0, #7
	pop {r4, r5, r6, pc}
_021E90F6:
	mov r0, #8
	pop {r4, r5, r6, pc}
_021E90FA:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_021E9100: .word gSystem
_021E9104: .word ov122_021E9A1C
	thumb_func_end ov122_021E9020

	thumb_func_start ov122_021E9108
ov122_021E9108: ; 0x021E9108
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl ov122_021E9154
	ldr r0, [r5, #8]
	add r1, r4, #0
	bl sub_0201A018
	add r1, sp, #0
	add r1, #1
	add r2, sp, #0
	bl sub_02020A0C
	add r2, sp, #0
	ldrb r1, [r2, #1]
	ldrb r2, [r2]
	ldr r0, [r5]
	bl sub_0200DDB8
	strb r4, [r5, #0xd]
	pop {r3, r4, r5, pc}
	thumb_func_end ov122_021E9108

	thumb_func_start ov122_021E9134
ov122_021E9134: ; 0x021E9134
	ldrb r1, [r0, #0xe]
	ldr r2, _021E9148 ; =ov122_021E9BA0 + 1
	ldr r0, [r0, #4]
	lsl r1, r1, #0x1c
	lsr r3, r1, #0x1b
	ldr r1, _021E914C ; =ov122_021E9BA0
	ldrb r2, [r2, r3]
	ldrb r1, [r1, r3]
	ldr r3, _021E9150 ; =sub_0200DDB8
	bx r3
	.balign 4, 0
_021E9148: .word ov122_021E9BA0 + 1
_021E914C: .word ov122_021E9BA0
_021E9150: .word sub_0200DDB8
	thumb_func_end ov122_021E9134

	thumb_func_start ov122_021E9154
ov122_021E9154: ; 0x021E9154
	push {r3, r4, r5, lr}
	add r5, r0, #0
	cmp r1, #0x19
	bge _021E9176
	ldrb r0, [r5, #0xf]
	lsl r1, r0, #0x1e
	lsr r1, r1, #0x1f
	beq _021E9168
	mov r4, #0x18
	b _021E9188
_021E9168:
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	beq _021E9172
	mov r4, #0x17
	b _021E9188
_021E9172:
	mov r4, #0x12
	b _021E9188
_021E9176:
	bne _021E917C
	mov r4, #7
	b _021E9188
_021E917C:
	cmp r1, #0x1a
	bne _021E9184
	mov r4, #4
	b _021E9188
_021E9184:
	bl GF_AssertFail
_021E9188:
	ldrb r0, [r5, #0xf]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	ldr r0, [r5]
	beq _021E919A
	mov r1, #4
	bl sub_0200DD10
	b _021E91A0
_021E919A:
	mov r1, #2
	bl sub_0200DD10
_021E91A0:
	ldr r0, [r5]
	add r1, r4, #0
	bl sub_0200DC58
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov122_021E9154

	thumb_func_start ov122_021E91AC
ov122_021E91AC: ; 0x021E91AC
	push {r3, lr}
	cmp r3, #0
	beq _021E91B6
	cmp r1, #0x19
	beq _021E91C8
_021E91B6:
	cmp r1, r2
	beq _021E91C8
	cmp r1, #0x1c
	bhs _021E91C8
	bl ov122_021E9108
	ldr r0, _021E91CC ; =0x000005DC
	bl PlaySE
_021E91C8:
	pop {r3, pc}
	nop
_021E91CC: .word 0x000005DC
	thumb_func_end ov122_021E91AC

	thumb_func_start ov122_021E91D0
ov122_021E91D0: ; 0x021E91D0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	lsl r1, r4, #0x18
	ldr r0, [r5, #8]
	lsr r1, r1, #0x18
	bl sub_02019F7C
	add r0, r5, #0
	add r1, r4, #0
	bl ov122_021E9108
	ldr r0, _021E91F0 ; =0x000005DC
	bl PlaySE
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021E91F0: .word 0x000005DC
	thumb_func_end ov122_021E91D0

	thumb_func_start ov122_021E91F4
ov122_021E91F4: ; 0x021E91F4
	bx lr
	.balign 4, 0
	thumb_func_end ov122_021E91F4

	thumb_func_start ov122_021E91F8
ov122_021E91F8: ; 0x021E91F8
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #0x1b
	bne _021E9220
	ldrb r1, [r5, #0xc]
	lsl r0, r1, #2
	add r0, r1, r0
	add r4, r0, #4
	cmp r4, #0x19
	blt _021E9214
	bl GF_AssertFail
_021E9214:
	lsl r1, r4, #0x18
	ldr r0, [r5, #8]
	lsr r1, r1, #0x18
	bl sub_02019F7C
	b _021E923C
_021E9220:
	cmp r4, #0x1c
	bne _021E923C
	ldrb r1, [r5, #0xc]
	lsl r0, r1, #2
	add r4, r1, r0
	cmp r4, #0x19
	blt _021E9232
	bl GF_AssertFail
_021E9232:
	lsl r1, r4, #0x18
	ldr r0, [r5, #8]
	lsr r1, r1, #0x18
	bl sub_02019F7C
_021E923C:
	cmp r4, #0x19
	beq _021E924E
	cmp r4, #0x1a
	beq _021E924E
	add r0, r4, #0
	mov r1, #5
	bl _s32_div_f
	strb r0, [r5, #0xc]
_021E924E:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	mov r3, #0
	bl ov122_021E91AC
	pop {r4, r5, r6, pc}
	thumb_func_end ov122_021E91F8

	thumb_func_start ov122_021E925C
ov122_021E925C: ; 0x021E925C
	push {r3, lr}
	mov r3, #1
	bl ov122_021E91AC
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov122_021E925C

	.rodata

ov122_021E9268:
	.byte 0x11, 0x12, 0x13, 0x00

ov122_021E926C:
	.byte 0x15, 0x16, 0x17, 0x18

ov122_021E9270: ; 0x021E9270
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x00, 0x00

ov122_021E9278: ; 0x021E9278
	.byte 0x77, 0x17, 0x74, 0x14, 0x71, 0x11, 0x6E, 0x0E
	.byte 0x6B, 0x0B, 0x03, 0x00, 0x03, 0x0B, 0x00, 0x00, 0x3A, 0x00, 0x1F, 0x00, 0x68, 0x00, 0x00, 0x00

ov122_021E9290: ; 0x021E9290
	.word ov122_021E9268, 3
	.word ov122_021E926C, 4

ov122_021E92A0: ; 0x021E92A0
	.byte 0xA0, 0x00, 0xA1, 0x00, 0xC0, 0x00, 0xC1, 0x00, 0xE0, 0x00, 0xE1, 0x00, 0x00, 0x01, 0x01, 0x01

ov122_021E92B0: ; 0x021E92B0
	.byte 0x0C, 0x08, 0x05, 0x01, 0x0F, 0x0B, 0x06, 0x02, 0x0E, 0x0A, 0x07, 0x04, 0x0D, 0x09, 0x08, 0x08

ov122_021E92C0: ; 0x021E92C0
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov122_021E92D0: ; 0x021E92D0
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x40, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00

ov122_021E92E4: ; 0x021E92E4
	.byte 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov122_021E92FC: ; 0x021E92FC
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x7E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x7E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x20, 0x00, 0x00, 0x00

ov122_021E931C: ; 0x021E931C
	.byte 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00

ov122_021E9344: ; 0x021E9344
	.byte 0x00, 0x00, 0x00, 0x00

ov122_021E9348: ; 0x021E9348
	.byte 0x00, 0x00, 0x00, 0x00

ov122_021E934C: ; 0x021E934C
	.byte 0x21, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x22, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x02, 0x00, 0x00, 0x00, 0x23, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00
	.byte 0x24, 0x00, 0x00, 0x00

ov122_021E9374: ; 0x021E9374
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0xFF, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov122_021E93A8: ; 0x021E93A8
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0xFF, 0xFF, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov122_021E93DC: ; 0x021E93DC
	.byte 0x03, 0x02, 0x13, 0x1B
	.byte 0x04, 0x0C, 0xA2, 0x00, 0x03, 0x02, 0x15, 0x1B, 0x02, 0x0C, 0xA2, 0x00, 0x01, 0x19, 0x04, 0x06
	.byte 0x06, 0x0E, 0x0E, 0x01, 0x01, 0x19, 0x15, 0x06, 0x02, 0x0E, 0x32, 0x01, 0x05, 0x01, 0x01, 0x1E
	.byte 0x02, 0x0C, 0x01, 0x00, 0x05, 0x01, 0x03, 0x1E, 0x02, 0x0C, 0x3D, 0x00, 0x05, 0x0D, 0x06, 0x12
	.byte 0x03, 0x0C, 0x79, 0x00, 0x05, 0x0D, 0x0A, 0x12, 0x03, 0x0C, 0xAF, 0x00, 0x05, 0x01, 0x0E, 0x13
	.byte 0x04, 0x0C, 0xE5, 0x00, 0x05, 0x01, 0x13, 0x13, 0x04, 0x0C, 0x31, 0x01, 0x05, 0x01, 0x0F, 0x07
	.byte 0x02, 0x0D, 0x01, 0x00, 0x05, 0x01, 0x05, 0x1E, 0x06, 0x0C, 0x0F, 0x00, 0x05, 0x0A, 0x0E, 0x15
	.byte 0x04, 0x0C, 0xC3, 0x00, 0x05, 0x0A, 0x13, 0x15, 0x04, 0x0C, 0x17, 0x01, 0x05, 0x01, 0x11, 0x1E
	.byte 0x06, 0x0C, 0x01, 0x00, 0x05, 0x02, 0x07, 0x06, 0x06, 0x0D, 0x01, 0x00, 0x05, 0x01, 0x0F, 0x1E
	.byte 0x08, 0x0C, 0x25, 0x00

ov122_021E9464: ; 0x021E9464
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x02, 0x03
	.byte 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x03, 0x04, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x01, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov122_021E950C: ; 0x021E950C
	.word 0
	.word ov122_021E5BA8
	.word ov122_021E5BE4
	.word 0
	.word 0
	.word 0
	.word ov122_021E5BF8
	.word ov122_021E5CAC
	.word 0
	.word ov122_021E5D24
	.word ov122_021E5D78
	.word ov122_021E5DB4
	.word ov122_021E5DC4
	.word 0
	.word 0
	.word ov122_021E5E28
	.word ov122_021E5E34
	.word ov122_021E5E44
	.word 0
	.word 0
	.word ov122_021E5EA4
	.word 0
	.word ov122_021E5EB4
	.word 0
	.word ov122_021E5EF8
	.word ov122_021E5EC0
	.word 0
	.word ov122_021E5ED0
	.word 0
	.word ov122_021E5EF8
	.word ov122_021E5EDC
	.word 0
	.word ov122_021E5EEC
	.word 0
	.word ov122_021E5EF8
	.word 0
	.word 0
	.word ov122_021E5F1C
	.word 0
	.word 0
	.word 0
	.word 0
	.word ov122_021E5F48
	.word 0
	.word ov122_021E6008
	.word ov122_021E601C
	.word ov122_021E613C
	.word ov122_021E6168
	.word ov122_021E6358
	.word 0
	.word 0
	.word 0
	.word ov122_021E63AC
	.word 0
	.word 0
	.word 0
	.word 0
	.word ov122_021E6418
	.word 0
	.word 0
	.word 0
	.word 0
	.word ov122_021E64E8
	.word ov122_021E6594
	.word 0
	.word ov122_021E65F4
	.word 0
	.word ov122_021E65FC
	.word 0
	.word ov122_021E67E0
	.word ov122_021E66CC
	.word ov122_021E66FC
	.word ov122_021E6700
	.word ov122_021E67DC
	.word ov122_021E67E0
	.word ov122_021E688C
	.word ov122_021E6900
	.word ov122_021E6948
	.word ov122_021E69DC
	.word 0

ov122_021E964C: ; 0x021E964C
	.byte 0x06

ov122_021E964D: ; 0x021E964D
	.byte 0x03

ov122_021E964E: ; 0x021E964E
	.byte 0x01, 0x33
	.byte 0x06, 0x00, 0x03, 0x22, 0x06, 0x05, 0x00, 0x43, 0x06, 0x02, 0x02, 0x33, 0x06, 0x04, 0x01, 0x43
	.byte 0x06, 0x03, 0x01, 0x33, 0x06, 0x00, 0x03, 0x22, 0x06, 0x05, 0x00, 0x43, 0x06, 0x02, 0x02, 0x33
	.byte 0x06, 0x04, 0x01, 0x43, 0x07, 0x01, 0x03, 0x32, 0x07, 0x06, 0x00, 0x43, 0x07, 0x03, 0x02, 0x32
	.byte 0x07, 0x00, 0x04, 0x32, 0x07, 0x05, 0x01, 0x43, 0x07, 0x01, 0x03, 0x22, 0x07, 0x06, 0x00, 0x33
	.byte 0x07, 0x03, 0x02, 0x22, 0x07, 0x00, 0x04, 0x22, 0x07, 0x05, 0x01, 0x33, 0x08, 0x02, 0x03, 0x32
	.byte 0x08, 0x07, 0x00, 0x43, 0x08, 0x04, 0x02, 0x43, 0x08, 0x01, 0x04, 0x32, 0x08, 0x06, 0x01, 0x34
	.byte 0x08, 0x02, 0x03, 0x22, 0x08, 0x07, 0x00, 0x33, 0x08, 0x04, 0x02, 0x33, 0x08, 0x01, 0x04, 0x22
	.byte 0x08, 0x06, 0x01, 0x33, 0x08, 0x03, 0x03, 0x34, 0x08, 0x00, 0x05, 0x32, 0x0A, 0x08, 0x00, 0x54
	.byte 0x0A, 0x05, 0x02, 0x43, 0x0A, 0x02, 0x04, 0x43, 0x08, 0x03, 0x03, 0x33, 0x08, 0x00, 0x05, 0x22
	.byte 0x0A, 0x08, 0x00, 0x44, 0x0A, 0x05, 0x02, 0x33, 0x0A, 0x02, 0x04, 0x33, 0x0A, 0x07, 0x01, 0x54
	.byte 0x0A, 0x04, 0x03, 0x43, 0x0A, 0x01, 0x05, 0x43, 0x0A, 0x09, 0x00, 0x54, 0x0A, 0x06, 0x02, 0x54
	.byte 0x0A, 0x07, 0x01, 0x44, 0x0A, 0x04, 0x03, 0x33, 0x0A, 0x01, 0x05, 0x33, 0x0A, 0x09, 0x00, 0x44
	.byte 0x0A, 0x06, 0x02, 0x44, 0x0A, 0x03, 0x04, 0x43, 0x0A, 0x00, 0x06, 0x43, 0x0A, 0x08, 0x01, 0x54
	.byte 0x0A, 0x05, 0x03, 0x54, 0x0A, 0x02, 0x05, 0x43, 0x0A, 0x03, 0x04, 0x33, 0x0A, 0x00, 0x06, 0x33
	.byte 0x0A, 0x08, 0x01, 0x44, 0x0A, 0x05, 0x03, 0x44, 0x0A, 0x02, 0x05, 0x33, 0x0A, 0x07, 0x02, 0x54
	.byte 0x0A, 0x04, 0x04, 0x54, 0x0D, 0x01, 0x06, 0x43, 0x0D, 0x09, 0x01, 0x65, 0x0A, 0x06, 0x03, 0x54
	.byte 0x0A, 0x07, 0x02, 0x44, 0x0A, 0x04, 0x04, 0x44, 0x0D, 0x01, 0x06, 0x33, 0x0D, 0x09, 0x01, 0x55
	.byte 0x0A, 0x06, 0x03, 0x44, 0x0A, 0x00, 0x07, 0x43, 0x0A, 0x08, 0x02, 0x65, 0x0A, 0x05, 0x04, 0x54
	.byte 0x0A, 0x02, 0x06, 0x54, 0x0A, 0x07, 0x03, 0x65, 0x0A, 0x00, 0x07, 0x33, 0x0A, 0x08, 0x02, 0x55
	.byte 0x0A, 0x05, 0x04, 0x44, 0x0A, 0x02, 0x06, 0x44, 0x0A, 0x07, 0x03, 0x55

ov122_021E978C: ; 0x021E978C
	.byte 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50
	.byte 0x5A, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x14
	.byte 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C
	.byte 0x46, 0x50, 0x5A, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x14, 0x1E, 0x28, 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x14, 0x1E, 0x28
	.byte 0x32, 0x3C, 0x46, 0x50, 0x5A, 0x64, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00

ov122_021E9A0C: ; 0x021E9A0C
	.word ov122_021E91D0
	.word ov122_021E91F4
	.word ov122_021E91F8
	.word ov122_021E925C

ov122_021E9A1C: ; 0x021E9A1C
	.byte 0x50, 0x68, 0xC8, 0xE0
	.byte 0x50, 0x68, 0xE0, 0xF8, 0x68, 0x80, 0xC8, 0xE0, 0x68, 0x80, 0xE0, 0xF8, 0x80, 0x98, 0xE0, 0xF8
	.byte 0x08, 0x48, 0xC0, 0x00, 0xA0, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00

ov122_021E9A3C: ; 0x021E9A3C
	.byte 0x08, 0x20, 0x08, 0x20
	.byte 0x08, 0x20, 0x28, 0x40, 0x08, 0x20, 0x48, 0x60, 0x08, 0x20, 0x68, 0x80, 0x08, 0x20, 0x88, 0xA0
	.byte 0x28, 0x40, 0x08, 0x20, 0x28, 0x40, 0x28, 0x40, 0x28, 0x40, 0x48, 0x60, 0x28, 0x40, 0x68, 0x80
	.byte 0x28, 0x40, 0x88, 0xA0, 0x48, 0x60, 0x08, 0x20, 0x48, 0x60, 0x28, 0x40, 0x48, 0x60, 0x48, 0x60
	.byte 0x48, 0x60, 0x68, 0x80, 0x48, 0x60, 0x88, 0xA0, 0x68, 0x80, 0x08, 0x20, 0x68, 0x80, 0x28, 0x40
	.byte 0x68, 0x80, 0x48, 0x60, 0x68, 0x80, 0x68, 0x80, 0x68, 0x80, 0x88, 0xA0, 0x88, 0xA0, 0x08, 0x20
	.byte 0x88, 0xA0, 0x28, 0x40, 0x88, 0xA0, 0x48, 0x60, 0x88, 0xA0, 0x68, 0x80, 0x88, 0xA0, 0x88, 0xA0
	.byte 0x08, 0x48, 0xC0, 0x00, 0xA0, 0xC0, 0xC0, 0x00, 0xFF, 0x00, 0x00, 0x00

ov122_021E9AAC: ; 0x021E9AAC
	.byte 0x08, 0x08, 0x18, 0x18
	.byte 0x14, 0x05, 0x19, 0x01, 0x28, 0x08, 0x18, 0x18, 0x15, 0x06, 0x00, 0x02, 0x48, 0x08, 0x18, 0x18
	.byte 0x16, 0x07, 0x01, 0x03, 0x68, 0x08, 0x18, 0x18, 0x17, 0x08, 0x02, 0x04, 0x88, 0x08, 0x18, 0x18
	.byte 0x18, 0x09, 0x03, 0x19, 0x08, 0x28, 0x18, 0x18, 0x00, 0x0A, 0x19, 0x06, 0x28, 0x28, 0x18, 0x18
	.byte 0x01, 0x0B, 0x05, 0x07, 0x48, 0x28, 0x18, 0x18, 0x02, 0x0C, 0x06, 0x08, 0x68, 0x28, 0x18, 0x18
	.byte 0x03, 0x0D, 0x07, 0x09, 0x88, 0x28, 0x18, 0x18, 0x04, 0x0E, 0x08, 0x19, 0x08, 0x48, 0x18, 0x18
	.byte 0x05, 0x0F, 0x19, 0x0B, 0x28, 0x48, 0x18, 0x18, 0x06, 0x10, 0x0A, 0x0C, 0x48, 0x48, 0x18, 0x18
	.byte 0x07, 0x11, 0x0B, 0x0D, 0x68, 0x48, 0x18, 0x18, 0x08, 0x12, 0x0C, 0x0E, 0x88, 0x48, 0x18, 0x18
	.byte 0x09, 0x13, 0x0D, 0x19, 0x08, 0x68, 0x18, 0x18, 0x0A, 0x14, 0x1A, 0x10, 0x28, 0x68, 0x18, 0x18
	.byte 0x0B, 0x15, 0x0F, 0x11, 0x48, 0x68, 0x18, 0x18, 0x0C, 0x16, 0x10, 0x12, 0x68, 0x68, 0x18, 0x18
	.byte 0x0D, 0x17, 0x11, 0x13, 0x88, 0x68, 0x18, 0x18, 0x0E, 0x18, 0x12, 0x1A, 0x08, 0x88, 0x18, 0x18
	.byte 0x0F, 0x00, 0x1A, 0x15, 0x28, 0x88, 0x18, 0x18, 0x10, 0x01, 0x14, 0x16, 0x48, 0x88, 0x18, 0x18
	.byte 0x11, 0x02, 0x15, 0x17, 0x68, 0x88, 0x18, 0x18, 0x12, 0x03, 0x16, 0x18, 0x88, 0x88, 0x18, 0x18
	.byte 0x13, 0x04, 0x17, 0x1A, 0xE0, 0x28, 0x00, 0x00, 0x19, 0x1A, 0x1B, 0x1C, 0xE0, 0xB0, 0x00, 0x00
	.byte 0x19, 0x1A, 0x1B, 0x1C

	.data

ov122_021E9BA0:
	.byte 0xC8, 0x50
	.byte 0xE0, 0x50
	.byte 0xC8, 0x68
	.byte 0xE0, 0x68
	.byte 0xE0, 0x80
