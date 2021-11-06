	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F5950:
	.word NNS_G2dLoadImage1DMapping
	.word NNS_G2dLoadImage2DMapping
	.word NNS_G2dLoadImage1DMapping
	.word NNS_G2dLoadImage2DMapping
	.word GX_LoadOBJ
	.word GXS_LoadOBJ

_020F5968:
	.word GX_LoadBGPltt
	.word GX_LoadOBJPltt
	.word GX_LoadBGExtPltt
	.word GX_LoadOBJExtPltt
	.word GXS_LoadBGPltt
	.word GXS_LoadOBJPltt
	.word GXS_LoadBGExtPltt
	.word GXS_LoadOBJExtPltt

	.text

	thumb_func_start GfGfxLoader_LoadCharData
GfGfxLoader_LoadCharData: ; 0x020078F0
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r2, #0
	add r4, r3, #0
	str r2, [sp]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl GfGfxLoader_LoadFromNarc
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r1, [sp]
	add r1, r5, #0
	add r2, r4, #0
	bl GfGfxLoader_LoadCharDataInternal
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end GfGfxLoader_LoadCharData

	thumb_func_start GfGfxLoader_LoadScrnData
GfGfxLoader_LoadScrnData: ; 0x02007914
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r2, #1
	add r4, r3, #0
	str r2, [sp]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl GfGfxLoader_LoadFromNarc
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r1, [sp]
	add r1, r5, #0
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnDataInternal
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end GfGfxLoader_LoadScrnData

	thumb_func_start GfGfxLoader_GXLoadPal
GfGfxLoader_GXLoadPal: ; 0x02007938
	push {lr}
	sub sp, #0xc
	str r3, [sp]
	ldr r3, [sp, #0x10]
	str r3, [sp, #4]
	ldr r3, [sp, #0x14]
	str r3, [sp, #8]
	mov r3, #0
	bl GfGfxLoader_GXLoadPalWithSrcOffset
	add sp, #0xc
	pop {pc}
	thumb_func_end GfGfxLoader_GXLoadPal

	thumb_func_start GfGfxLoader_GXLoadPalWithSrcOffset
GfGfxLoader_GXLoadPalWithSrcOffset: ; 0x02007950
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	mov r2, #1
	str r2, [sp]
	ldr r3, [sp, #0x18]
	mov r2, #0
	bl GfGfxLoader_LoadFromNarc
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r1, [sp]
	add r1, r5, #0
	add r2, r4, #0
	bl GfGfxLoader_GXLoadPalWithSrcOffsetInternal
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end GfGfxLoader_GXLoadPalWithSrcOffset

	thumb_func_start GfGfxLoader_PartiallyLoadPalette
GfGfxLoader_PartiallyLoadPalette: ; 0x02007974
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	mov r2, #1
	str r2, [sp]
	ldr r3, [sp, #0x10]
	mov r2, #0
	bl GfGfxLoader_LoadFromNarc
	ldr r3, [sp, #0x14]
	add r1, r5, #0
	add r2, r4, #0
	bl GfGfxLoader_PartiallyLoadPaletteInternal
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end GfGfxLoader_PartiallyLoadPalette

	thumb_func_start GfGfxLoader_LoadImageMapping
GfGfxLoader_LoadImageMapping: ; 0x02007994
	push {r4, lr}
	sub sp, #8
	add r4, r3, #0
	mov r3, #1
	str r3, [sp]
	ldr r3, [sp, #0x1c]
	bl GfGfxLoader_LoadFromNarc
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x10]
	str r1, [sp]
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #0x14]
	str r1, [sp, #4]
	add r1, r4, #0
	bl GfGfxLoader_LoadImageMappingInternal
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end GfGfxLoader_LoadImageMapping

	thumb_func_start GfGfxLoader_GetCharData
GfGfxLoader_GetCharData: ; 0x020079BC
	push {r3, r4, lr}
	sub sp, #4
	add r4, r3, #0
	mov r3, #0
	str r3, [sp]
	ldr r3, [sp, #0x10]
	bl GfGfxLoader_LoadFromNarc
	add r1, r4, #0
	bl GfGfxLoader_GetCharDataInternal
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end GfGfxLoader_GetCharData

	thumb_func_start GfGfxLoader_GetScrnData
GfGfxLoader_GetScrnData: ; 0x020079D8
	push {r3, r4, lr}
	sub sp, #4
	add r4, r3, #0
	mov r3, #0
	str r3, [sp]
	ldr r3, [sp, #0x10]
	bl GfGfxLoader_LoadFromNarc
	add r1, r4, #0
	bl GfGfxLoader_GetScrnDataInternal
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end GfGfxLoader_GetScrnData

	thumb_func_start GfGfxLoader_GetPlttData
GfGfxLoader_GetPlttData: ; 0x020079F4
	push {r3, r4, lr}
	sub sp, #4
	add r4, r2, #0
	mov r2, #0
	str r2, [sp]
	bl GfGfxLoader_LoadFromNarc
	add r1, r4, #0
	bl GfGfxLoader_GetPlttDataInternal
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end GfGfxLoader_GetPlttData

	thumb_func_start GfGfxLoader_GetCellBank
GfGfxLoader_GetCellBank: ; 0x02007A0C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r3, #0
	mov r3, #0
	str r3, [sp]
	ldr r3, [sp, #0x10]
	bl GfGfxLoader_LoadFromNarc
	add r1, r4, #0
	bl GfGfxLoader_GetCellBankInternal
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end GfGfxLoader_GetCellBank

	thumb_func_start GfGfxLoader_GetAnimBank
GfGfxLoader_GetAnimBank: ; 0x02007A28
	push {r3, r4, lr}
	sub sp, #4
	add r4, r3, #0
	mov r3, #0
	str r3, [sp]
	ldr r3, [sp, #0x10]
	bl GfGfxLoader_LoadFromNarc
	add r1, r4, #0
	bl GfGfxLoader_GetAnimBankInternal
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end GfGfxLoader_GetAnimBank

	thumb_func_start GfGfxLoader_LoadFromNarc
GfGfxLoader_LoadFromNarc: ; 0x02007A44
	push {r3, r4, r5, r6, r7, lr}
	add r5, r2, #0
	add r7, r0, #0
	add r6, r3, #0
	str r1, [sp]
	cmp r5, #0
	bne _02007A58
	ldr r2, [sp, #0x18]
	cmp r2, #1
	bne _02007A6C
_02007A58:
	ldr r1, [sp]
	add r0, r7, #0
	bl GetNarcMemberSizeByIdPair
	add r1, r0, #0
	add r0, r6, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	b _02007A7A
_02007A6C:
	bl GetNarcMemberSizeByIdPair
	add r1, r0, #0
	add r0, r6, #0
	bl AllocFromHeap
	add r4, r0, #0
_02007A7A:
	cmp r4, #0
	beq _02007ABE
	ldr r2, [sp]
	add r0, r4, #0
	add r1, r7, #0
	bl ReadWholeNarcMemberByIdPair
	cmp r5, #0
	beq _02007ABE
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _02007A9E
	ldr r1, [r4]
	add r0, r6, #0
	lsr r1, r1, #8
	bl AllocFromHeap
	b _02007AA8
_02007A9E:
	ldr r1, [r4]
	add r0, r6, #0
	lsr r1, r1, #8
	bl AllocFromHeapAtEnd
_02007AA8:
	add r5, r0, #0
	cmp r5, #0
	beq _02007ABC
	add r0, r4, #0
	add r1, r5, #0
	bl MI_UncompressLZ8
	add r0, r4, #0
	bl FreeToHeap
_02007ABC:
	add r4, r5, #0
_02007ABE:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end GfGfxLoader_LoadFromNarc

	thumb_func_start GfGfxLoader_LoadFromNarc_GetSizeOut
GfGfxLoader_LoadFromNarc_GetSizeOut: ; 0x02007AC4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r5, [sp, #0x24]
	str r0, [sp]
	str r1, [sp, #4]
	add r6, r2, #0
	add r7, r3, #0
	bl GetNarcMemberSizeByIdPair
	str r0, [r5]
	cmp r6, #0
	bne _02007AE2
	ldr r0, [sp, #0x20]
	cmp r0, #1
	bne _02007AEE
_02007AE2:
	ldr r1, [r5]
	add r0, r7, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	b _02007AF8
_02007AEE:
	ldr r1, [r5]
	add r0, r7, #0
	bl AllocFromHeap
	add r4, r0, #0
_02007AF8:
	cmp r4, #0
	beq _02007B3E
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, r4, #0
	bl ReadWholeNarcMemberByIdPair
	cmp r6, #0
	beq _02007B3E
	ldr r0, [r4]
	lsr r0, r0, #8
	str r0, [r5]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _02007B20
	ldr r1, [r5]
	add r0, r7, #0
	bl AllocFromHeap
	b _02007B28
_02007B20:
	ldr r1, [r5]
	add r0, r7, #0
	bl AllocFromHeapAtEnd
_02007B28:
	add r5, r0, #0
	cmp r5, #0
	beq _02007B3C
	add r0, r4, #0
	add r1, r5, #0
	bl MI_UncompressLZ8
	add r0, r4, #0
	bl FreeToHeap
_02007B3C:
	add r4, r5, #0
_02007B3E:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end GfGfxLoader_LoadFromNarc_GetSizeOut

	thumb_func_start sub_02007B44
sub_02007B44: ; 0x02007B44
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r2, #0
	add r4, r3, #0
	str r2, [sp]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl sub_02007C98
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r1, [sp]
	add r1, r5, #0
	add r2, r4, #0
	bl GfGfxLoader_LoadCharDataInternal
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02007B44

	thumb_func_start sub_02007B68
sub_02007B68: ; 0x02007B68
	push {r3, r4, r5, lr}
	add r5, r2, #0
	mov r2, #1
	add r4, r3, #0
	str r2, [sp]
	ldr r2, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	bl sub_02007C98
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r1, [sp]
	add r1, r5, #0
	add r2, r4, #0
	bl GfGfxLoader_LoadScrnDataInternal
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02007B68

	thumb_func_start sub_02007B8C
sub_02007B8C: ; 0x02007B8C
	push {lr}
	sub sp, #0xc
	str r3, [sp]
	ldr r3, [sp, #0x10]
	str r3, [sp, #4]
	ldr r3, [sp, #0x14]
	str r3, [sp, #8]
	mov r3, #0
	bl sub_02007BA4
	add sp, #0xc
	pop {pc}
	thumb_func_end sub_02007B8C

	thumb_func_start sub_02007BA4
sub_02007BA4: ; 0x02007BA4
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	mov r2, #1
	str r2, [sp]
	ldr r3, [sp, #0x18]
	mov r2, #0
	bl sub_02007C98
	ldr r1, [sp, #0x14]
	ldr r3, [sp, #0x10]
	str r1, [sp]
	add r1, r5, #0
	add r2, r4, #0
	bl GfGfxLoader_GXLoadPalWithSrcOffsetInternal
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02007BA4

	thumb_func_start sub_02007BC8
sub_02007BC8: ; 0x02007BC8
	push {r3, r4, r5, lr}
	add r5, r2, #0
	add r4, r3, #0
	mov r2, #1
	str r2, [sp]
	ldr r3, [sp, #0x10]
	mov r2, #0
	bl sub_02007C98
	ldr r3, [sp, #0x14]
	add r1, r5, #0
	add r2, r4, #0
	bl GfGfxLoader_PartiallyLoadPaletteInternal
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02007BC8

	thumb_func_start sub_02007BE8
sub_02007BE8: ; 0x02007BE8
	push {r4, lr}
	sub sp, #8
	add r4, r3, #0
	mov r3, #1
	str r3, [sp]
	ldr r3, [sp, #0x1c]
	bl sub_02007C98
	ldr r1, [sp, #0x18]
	ldr r2, [sp, #0x10]
	str r1, [sp]
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #0x14]
	str r1, [sp, #4]
	add r1, r4, #0
	bl GfGfxLoader_LoadImageMappingInternal
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02007BE8

	thumb_func_start sub_02007C10
sub_02007C10: ; 0x02007C10
	push {r3, r4, lr}
	sub sp, #4
	add r4, r3, #0
	mov r3, #0
	str r3, [sp]
	ldr r3, [sp, #0x10]
	bl sub_02007C98
	add r1, r4, #0
	bl GfGfxLoader_GetCharDataInternal
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02007C10

	thumb_func_start sub_02007C2C
sub_02007C2C: ; 0x02007C2C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r3, #0
	mov r3, #0
	str r3, [sp]
	ldr r3, [sp, #0x10]
	bl sub_02007C98
	add r1, r4, #0
	bl GfGfxLoader_GetScrnDataInternal
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02007C2C

	thumb_func_start sub_02007C48
sub_02007C48: ; 0x02007C48
	push {r3, r4, lr}
	sub sp, #4
	add r4, r2, #0
	mov r2, #0
	str r2, [sp]
	bl sub_02007C98
	add r1, r4, #0
	bl GfGfxLoader_GetPlttDataInternal
	add sp, #4
	pop {r3, r4, pc}
	thumb_func_end sub_02007C48

	thumb_func_start sub_02007C60
sub_02007C60: ; 0x02007C60
	push {r3, r4, lr}
	sub sp, #4
	add r4, r3, #0
	mov r3, #0
	str r3, [sp]
	ldr r3, [sp, #0x10]
	bl sub_02007C98
	add r1, r4, #0
	bl GfGfxLoader_GetCellBankInternal
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02007C60

	thumb_func_start sub_02007C7C
sub_02007C7C: ; 0x02007C7C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r3, #0
	mov r3, #0
	str r3, [sp]
	ldr r3, [sp, #0x10]
	bl sub_02007C98
	add r1, r4, #0
	bl GfGfxLoader_GetAnimBankInternal
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end sub_02007C7C

	thumb_func_start sub_02007C98
sub_02007C98: ; 0x02007C98
	push {r3, r4, lr}
	sub sp, #0xc
	ldr r4, [sp, #0x18]
	str r4, [sp]
	add r4, sp, #8
	str r4, [sp, #4]
	bl sub_02007CAC
	add sp, #0xc
	pop {r3, r4, pc}
	thumb_func_end sub_02007C98

	thumb_func_start sub_02007CAC
sub_02007CAC: ; 0x02007CAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r5, [sp, #0x24]
	str r0, [sp]
	str r1, [sp, #4]
	add r6, r2, #0
	add r7, r3, #0
	bl NARC_GetMemberSize
	str r0, [r5]
	cmp r6, #0
	bne _02007CCA
	ldr r0, [sp, #0x20]
	cmp r0, #1
	bne _02007CD6
_02007CCA:
	ldr r1, [r5]
	add r0, r7, #0
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	b _02007CE0
_02007CD6:
	ldr r1, [r5]
	add r0, r7, #0
	bl AllocFromHeap
	add r4, r0, #0
_02007CE0:
	cmp r4, #0
	beq _02007D26
	ldr r0, [sp]
	ldr r1, [sp, #4]
	add r2, r4, #0
	bl NARC_ReadWholeMember
	cmp r6, #0
	beq _02007D26
	ldr r0, [r4]
	lsr r0, r0, #8
	str r0, [r5]
	ldr r0, [sp, #0x20]
	cmp r0, #0
	bne _02007D08
	ldr r1, [r5]
	add r0, r7, #0
	bl AllocFromHeap
	b _02007D10
_02007D08:
	ldr r1, [r5]
	add r0, r7, #0
	bl AllocFromHeapAtEnd
_02007D10:
	add r5, r0, #0
	cmp r5, #0
	beq _02007D24
	add r0, r4, #0
	add r1, r5, #0
	bl MI_UncompressLZ8
	add r0, r4, #0
	bl FreeToHeap
_02007D24:
	add r4, r5, #0
_02007D26:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02007CAC

	thumb_func_start GfGfxLoader_LoadCharDataInternal
GfGfxLoader_LoadCharDataInternal: ; 0x02007D2C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp, #4]
	add r6, r2, #0
	add r7, r3, #0
	ldr r4, [sp, #0x20]
	cmp r5, #0
	beq _02007D68
	add r1, sp, #8
	bl NNS_G2dGetUnpackedBGCharacterData
	cmp r0, #0
	beq _02007D62
	cmp r4, #0
	bne _02007D50
	ldr r0, [sp, #8]
	ldr r4, [r0, #0x10]
_02007D50:
	str r7, [sp]
	ldr r2, [sp, #8]
	lsl r1, r6, #0x18
	ldr r0, [sp, #4]
	ldr r2, [r2, #0x14]
	lsr r1, r1, #0x18
	add r3, r4, #0
	bl BG_LoadCharTilesData
_02007D62:
	add r0, r5, #0
	bl FreeToHeap
_02007D68:
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end GfGfxLoader_LoadCharDataInternal

	thumb_func_start GfGfxLoader_LoadScrnDataInternal
GfGfxLoader_LoadScrnDataInternal: ; 0x02007D70
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	add r7, r1, #0
	add r5, r2, #0
	str r3, [sp, #4]
	ldr r4, [sp, #0x20]
	cmp r6, #0
	beq _02007DCC
	add r1, sp, #8
	bl NNS_G2dGetUnpackedScreenData
	cmp r0, #0
	beq _02007DC6
	cmp r4, #0
	bne _02007D94
	ldr r0, [sp, #8]
	ldr r4, [r0, #8]
_02007D94:
	lsl r1, r5, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	bl GetBgTilemapBuffer
	cmp r0, #0
	beq _02007DB2
	ldr r2, [sp, #8]
	lsl r1, r5, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	add r2, #0xc
	add r3, r4, #0
	bl BG_LoadScreenTilemapData
_02007DB2:
	ldr r0, [sp, #4]
	lsl r1, r5, #0x18
	str r0, [sp]
	ldr r2, [sp, #8]
	add r0, r7, #0
	lsr r1, r1, #0x18
	add r2, #0xc
	add r3, r4, #0
	bl BgCopyOrUncompressTilemapBufferRangeToVram
_02007DC6:
	add r0, r6, #0
	bl FreeToHeap
_02007DCC:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end GfGfxLoader_LoadScrnDataInternal

	thumb_func_start GfGfxLoader_GXLoadPalWithSrcOffsetInternal
GfGfxLoader_GXLoadPalWithSrcOffsetInternal: ; 0x02007DD0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r4, r1, #0
	add r7, r2, #0
	add r6, r3, #0
	ldr r5, [sp, #0x20]
	add r1, r0, #0
	beq _02007EA6
	add r1, sp, #4
	bl NNS_G2dGetUnpackedPaletteData
	cmp r0, #0
	beq _02007EA0
	ldr r0, [sp, #4]
	ldr r1, [r0, #0xc]
	add r1, r1, r7
	str r1, [r0, #0xc]
	cmp r5, #0
	bne _02007DFE
	ldr r0, [sp, #4]
	ldr r0, [r0, #8]
	sub r5, r0, r7
_02007DFE:
	ldr r0, [sp, #4]
	add r1, r5, #0
	ldr r0, [r0, #0xc]
	bl DC_FlushRange
	cmp r4, #7
	bhi _02007E90
	add r0, r4, r4
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02007E18: ; jump table
	.short _02007E90 - _02007E18 - 2 ; case 0
	.short _02007E90 - _02007E18 - 2 ; case 1
	.short _02007E28 - _02007E18 - 2 ; case 2
	.short _02007E5C - _02007E18 - 2 ; case 3
	.short _02007E90 - _02007E18 - 2 ; case 4
	.short _02007E90 - _02007E18 - 2 ; case 5
	.short _02007E42 - _02007E18 - 2 ; case 6
	.short _02007E76 - _02007E18 - 2 ; case 7
_02007E28:
	bl GX_BeginLoadBGExtPltt
	ldr r0, [sp, #4]
	ldr r3, _02007EAC ; =_020F5968
	lsl r4, r4, #2
	ldr r0, [r0, #0xc]
	ldr r3, [r3, r4]
	add r1, r6, #0
	add r2, r5, #0
	blx r3
	bl GX_EndLoadBGExtPltt
	b _02007EA0
_02007E42:
	bl GXS_BeginLoadBGExtPltt
	ldr r0, [sp, #4]
	ldr r3, _02007EAC ; =_020F5968
	lsl r4, r4, #2
	ldr r0, [r0, #0xc]
	ldr r3, [r3, r4]
	add r1, r6, #0
	add r2, r5, #0
	blx r3
	bl GXS_EndLoadBGExtPltt
	b _02007EA0
_02007E5C:
	bl GX_BeginLoadOBJExtPltt
	ldr r0, [sp, #4]
	ldr r3, _02007EAC ; =_020F5968
	lsl r4, r4, #2
	ldr r0, [r0, #0xc]
	ldr r3, [r3, r4]
	add r1, r6, #0
	add r2, r5, #0
	blx r3
	bl GX_EndLoadOBJExtPltt
	b _02007EA0
_02007E76:
	bl GXS_BeginLoadOBJExtPltt
	ldr r0, [sp, #4]
	ldr r3, _02007EAC ; =_020F5968
	lsl r4, r4, #2
	ldr r0, [r0, #0xc]
	ldr r3, [r3, r4]
	add r1, r6, #0
	add r2, r5, #0
	blx r3
	bl GXS_EndLoadOBJExtPltt
	b _02007EA0
_02007E90:
	ldr r0, [sp, #4]
	ldr r3, _02007EAC ; =_020F5968
	lsl r4, r4, #2
	ldr r0, [r0, #0xc]
	ldr r3, [r3, r4]
	add r1, r6, #0
	add r2, r5, #0
	blx r3
_02007EA0:
	ldr r0, [sp]
	bl FreeToHeap
_02007EA6:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02007EAC: .word _020F5968
	thumb_func_end GfGfxLoader_GXLoadPalWithSrcOffsetInternal

	thumb_func_start GfGfxLoader_PartiallyLoadPaletteInternal
GfGfxLoader_PartiallyLoadPaletteInternal: ; 0x02007EB0
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	add r4, r3, #0
	cmp r5, #0
	beq _02007EFC
	add r1, sp, #8
	bl NNS_G2dGetUnpackedPaletteCompressInfo
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, sp, #0xc
	bl NNS_G2dGetUnpackedPaletteData
	cmp r0, #0
	beq _02007EF6
	ldr r0, [sp, #4]
	cmp r0, #0
	beq _02007EEA
	str r4, [sp]
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #8]
	add r2, r7, #0
	add r3, r6, #0
	bl NNS_G2dLoadPaletteEx
	b _02007EF6
_02007EEA:
	ldr r0, [sp, #0xc]
	add r1, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl NNS_G2dLoadPalette
_02007EF6:
	add r0, r5, #0
	bl FreeToHeap
_02007EFC:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end GfGfxLoader_PartiallyLoadPaletteInternal

	thumb_func_start GfGfxLoader_LoadImageMappingInternal
GfGfxLoader_LoadImageMappingInternal: ; 0x02007F00
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r7, r1, #0
	add r4, r2, #0
	mov r6, #0
	str r3, [sp]
	cmp r5, #0
	beq _02007F3E
	add r1, sp, #4
	bl NNS_G2dGetUnpackedCharacterData
	cmp r0, #0
	beq _02007F38
	cmp r4, #0
	beq _02007F24
	ldr r0, [sp, #4]
	str r4, [r0, #0x10]
_02007F24:
	ldr r4, _02007F44 ; =_020F5950
	lsl r6, r7, #2
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x20]
	ldr r2, [sp]
	ldr r3, [sp, #0x24]
	ldr r4, [r4, r6]
	blx r4
	ldr r0, [sp, #4]
	ldr r6, [r0, #0x10]
_02007F38:
	add r0, r5, #0
	bl FreeToHeap
_02007F3E:
	add r0, r6, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02007F44: .word _020F5950
	thumb_func_end GfGfxLoader_LoadImageMappingInternal

	thumb_func_start GfGfxLoader_GetCharDataInternal
GfGfxLoader_GetCharDataInternal: ; 0x02007F48
	push {r4, lr}
	add r4, r0, #0
	beq _02007F60
	bl NNS_G2dGetUnpackedBGCharacterData
	cmp r0, #0
	bne _02007F60
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
_02007F60:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end GfGfxLoader_GetCharDataInternal

	thumb_func_start GfGfxLoader_GetScrnDataInternal
GfGfxLoader_GetScrnDataInternal: ; 0x02007F64
	push {r4, lr}
	add r4, r0, #0
	beq _02007F7C
	bl NNS_G2dGetUnpackedScreenData
	cmp r0, #0
	bne _02007F7C
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
_02007F7C:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end GfGfxLoader_GetScrnDataInternal

	thumb_func_start GfGfxLoader_GetPlttDataInternal
GfGfxLoader_GetPlttDataInternal: ; 0x02007F80
	push {r4, lr}
	add r4, r0, #0
	beq _02007F98
	bl NNS_G2dGetUnpackedPaletteData
	cmp r0, #0
	bne _02007F98
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
_02007F98:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end GfGfxLoader_GetPlttDataInternal

	thumb_func_start GfGfxLoader_GetCellBankInternal
GfGfxLoader_GetCellBankInternal: ; 0x02007F9C
	push {r4, lr}
	add r4, r0, #0
	beq _02007FB4
	bl NNS_G2dGetUnpackedCellBank
	cmp r0, #0
	bne _02007FB4
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
_02007FB4:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end GfGfxLoader_GetCellBankInternal

	thumb_func_start GfGfxLoader_GetAnimBankInternal
GfGfxLoader_GetAnimBankInternal: ; 0x02007FB8
	push {r4, lr}
	add r4, r0, #0
	beq _02007FD0
	bl NNS_G2dGetUnpackedAnimBank
	cmp r0, #0
	bne _02007FD0
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #0
	pop {r4, pc}
_02007FD0:
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end GfGfxLoader_GetAnimBankInternal
