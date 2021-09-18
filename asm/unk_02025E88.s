	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F6324:
	.byte 0x00, 0x01, 0x02, 0x03
_020F6328:
	.word InitFontResources_FromPreloaded
	.word InitFontResources_LazyFromNarc
_020F6330:
	.word FreeLoadedFontResources_FromPreloaded
	.word FreeLoadedFontResources_LazyFromNarc

	.text

	thumb_func_start FontData_new
FontData_new: ; 0x02025E88
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r6, r1, #0
	ldr r0, [sp, #0x20]
	mov r1, #0x7c
	add r7, r2, #0
	str r3, [sp, #4]
	bl AllocFromHeap
	add r4, r0, #0
	beq _02025EB8
	ldr r1, [sp, #0x20]
	ldr r3, [sp, #4]
	str r1, [sp]
	add r1, r5, #0
	add r2, r6, #0
	bl FontData_Init
	ldr r2, [sp, #0x20]
	add r0, r4, #0
	add r1, r7, #0
	bl InitFontResources
_02025EB8:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end FontData_new

	thumb_func_start FontData_delete
FontData_delete: ; 0x02025EC0
	push {r4, lr}
	add r4, r0, #0
	bl FreeLoadedFontResources
	add r0, r4, #0
	bl FontData_FreeWidthsAndNarc
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FontData_delete

	thumb_func_start FontData_ModeSwitch
FontData_ModeSwitch: ; 0x02025ED8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	add r6, r2, #0
	cmp r1, r4
	beq _02025EF4
	bl FreeLoadedFontResources
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl InitFontResources
_02025EF4:
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end FontData_ModeSwitch

	thumb_func_start FontData_Init
FontData_Init: ; 0x02025EF8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r0, r1, #0
	ldr r1, [sp, #0x10]
	add r4, r2, #0
	add r6, r3, #0
	bl NARC_ctor
	str r0, [r5, #0x54]
	cmp r0, #0
	beq _02025FA4
	add r2, r5, #0
	add r1, r4, #0
	add r2, #0x78
	bl NARC_GetMemberImageStartOffset
	add r3, r5, #0
	ldr r0, [r5, #0x54]
	ldr r1, [r5, #0x78]
	mov r2, #0x10
	add r3, #0x5c
	bl NARC_ReadFromAbsolutePos
	str r6, [r5, #0x6c]
	cmp r6, #0
	beq _02025F36
	mov r0, #0
	str r0, [r5, #0x74]
	ldr r0, _02025FA8 ; =GetGlyphWidth_FixedWidth
	str r0, [r5, #0x70]
	b _02025F5E
_02025F36:
	ldr r0, [r5, #0x60]
	cmp r0, #0
	bne _02025F40
	bl GF_AssertFail
_02025F40:
	ldr r0, [sp, #0x10]
	ldr r1, [r5, #0x64]
	bl AllocFromHeap
	str r0, [r5, #0x74]
	ldr r0, _02025FAC ; =GetGlyphWidth_VariableWidth
	str r0, [r5, #0x70]
	ldr r2, [r5, #0x78]
	ldr r1, [r5, #0x60]
	ldr r0, [r5, #0x54]
	add r1, r2, r1
	ldr r2, [r5, #0x64]
	ldr r3, [r5, #0x74]
	bl NARC_ReadFromAbsolutePos
_02025F5E:
	add r0, r5, #0
	add r0, #0x6a
	ldrb r0, [r0]
	cmp r0, #2
	bhi _02025F72
	add r0, r5, #0
	add r0, #0x6b
	ldrb r0, [r0]
	cmp r0, #2
	bls _02025F76
_02025F72:
	bl GF_AssertFail
_02025F76:
	add r0, r5, #0
	add r0, #0x6a
	ldrb r0, [r0]
	ldr r2, _02025FB0 ; =_020F6324
	sub r0, r0, #1
	lsl r3, r0, #1
	add r0, r5, #0
	add r0, #0x6b
	ldrb r0, [r0]
	sub r1, r0, #1
	add r0, r2, r3
	ldrb r0, [r1, r0]
	str r0, [r5, #8]
	add r0, r5, #0
	add r0, #0x6b
	ldrb r1, [r0]
	add r0, r5, #0
	add r0, #0x6a
	ldrb r0, [r0]
	lsl r0, r0, #4
	mul r0, r1
	str r0, [r5, #0xc]
	str r4, [r5, #0x58]
_02025FA4:
	pop {r4, r5, r6, pc}
	nop
_02025FA8: .word GetGlyphWidth_FixedWidth
_02025FAC: .word GetGlyphWidth_VariableWidth
_02025FB0: .word _020F6324
	thumb_func_end FontData_Init

	thumb_func_start FontData_FreeWidthsAndNarc
FontData_FreeWidthsAndNarc: ; 0x02025FB4
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x74]
	cmp r0, #0
	beq _02025FC2
	bl FreeToHeap
_02025FC2:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	beq _02025FCC
	bl NARC_dtor
_02025FCC:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FontData_FreeWidthsAndNarc

	thumb_func_start InitFontResources
InitFontResources: ; 0x02025FD0
	push {r3, lr}
	add r3, r1, #0
	add r1, r2, #0
	str r3, [r0]
	ldr r2, _02025FE4 ; =_020F6328
	lsl r3, r3, #2
	ldr r2, [r2, r3]
	blx r2
	pop {r3, pc}
	nop
_02025FE4: .word _020F6328
	thumb_func_end InitFontResources

	thumb_func_start InitFontResources_FromPreloaded
InitFontResources_FromPreloaded: ; 0x02025FE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r2, [r5, #0xc]
	ldr r0, [r5, #0x64]
	add r4, r2, #0
	mul r4, r0
	add r0, r1, #0
	add r1, r4, #0
	bl AllocFromHeap
	str r0, [r5, #0x10]
	ldr r0, _02026014 ; =DecompressGlyphTiles_FromPreloaded
	add r3, r4, #0
	str r0, [r5, #4]
	ldr r0, [r5, #0x10]
	str r0, [sp]
	ldr r0, [r5, #0x54]
	ldr r1, [r5, #0x58]
	ldr r2, [r5, #0x5c]
	bl NARC_ReadFromMember
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02026014: .word DecompressGlyphTiles_FromPreloaded
	thumb_func_end InitFontResources_FromPreloaded

	thumb_func_start InitFontResources_LazyFromNarc
InitFontResources_LazyFromNarc: ; 0x02026018
	ldr r1, _02026020 ; =DecompressGlyphTiles_LazyFromNarc
	str r1, [r0, #4]
	bx lr
	nop
_02026020: .word DecompressGlyphTiles_LazyFromNarc
	thumb_func_end InitFontResources_LazyFromNarc

	thumb_func_start FreeLoadedFontResources
FreeLoadedFontResources: ; 0x02026024
	push {r3, lr}
	ldr r1, [r0]
	lsl r2, r1, #2
	ldr r1, _02026034 ; =_020F6330
	ldr r1, [r1, r2]
	blx r1
	pop {r3, pc}
	nop
_02026034: .word _020F6330
	thumb_func_end FreeLoadedFontResources

	thumb_func_start FreeLoadedFontResources_FromPreloaded
FreeLoadedFontResources_FromPreloaded: ; 0x02026038
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x10]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x10]
	pop {r4, pc}
	thumb_func_end FreeLoadedFontResources_FromPreloaded

	thumb_func_start FreeLoadedFontResources_LazyFromNarc
FreeLoadedFontResources_LazyFromNarc: ; 0x02026048
	bx lr
	.balign 4, 0
	thumb_func_end FreeLoadedFontResources_LazyFromNarc

	thumb_func_start TryLoadGlyph
TryLoadGlyph: ; 0x0202604C
	push {r3, lr}
	ldr r3, [r0, #0x64]
	cmp r1, r3
	bhi _0202605C
	sub r1, r1, #1
	lsl r1, r1, #0x10
	lsr r1, r1, #0x10
	b _0202605E
_0202605C:
	ldr r1, _02026064 ; =0x000001AB
_0202605E:
	ldr r3, [r0, #4]
	blx r3
	pop {r3, pc}
	.balign 4, 0
_02026064: .word 0x000001AB
	thumb_func_end TryLoadGlyph

	thumb_func_start DecompressGlyphTiles_FromPreloaded
DecompressGlyphTiles_FromPreloaded: ; 0x02026068
	push {r3, r4, r5, r6, r7, lr}
	str r1, [sp]
	add r7, r0, #0
	ldr r0, [sp]
	ldr r1, [r7, #0xc]
	add r5, r0, #0
	ldr r0, [r7, #8]
	add r6, r2, #0
	mul r5, r1
	ldr r4, [r7, #0x10]
	cmp r0, #3
	bhi _020260F6
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0202608C: ; jump table
	.short _02026094 - _0202608C - 2 ; case 0
	.short _0202609E - _0202608C - 2 ; case 1
	.short _020260B4 - _0202608C - 2 ; case 2
	.short _020260CA - _0202608C - 2 ; case 3
_02026094:
	add r0, r4, r5
	add r1, r6, #0
	bl DecompressGlyphTile
	b _020260F6
_0202609E:
	add r0, r4, r5
	add r1, r6, #0
	bl DecompressGlyphTile
	add r0, r4, r5
	add r1, r6, #0
	add r0, #0x10
	add r1, #0x40
	bl DecompressGlyphTile
	b _020260F6
_020260B4:
	add r0, r4, r5
	add r1, r6, #0
	bl DecompressGlyphTile
	add r0, r4, r5
	add r1, r6, #0
	add r0, #0x10
	add r1, #0x20
	bl DecompressGlyphTile
	b _020260F6
_020260CA:
	add r0, r4, r5
	add r1, r6, #0
	bl DecompressGlyphTile
	add r0, r4, r5
	add r1, r6, #0
	add r0, #0x10
	add r1, #0x20
	bl DecompressGlyphTile
	add r0, r4, r5
	add r1, r6, #0
	add r0, #0x20
	add r1, #0x40
	bl DecompressGlyphTile
	add r0, r4, r5
	add r1, r6, #0
	add r0, #0x30
	add r1, #0x60
	bl DecompressGlyphTile
_020260F6:
	ldr r1, [sp]
	ldr r2, [r7, #0x70]
	add r0, r7, #0
	blx r2
	add r1, r6, #0
	add r1, #0x80
	add r7, #0x69
	strb r0, [r1]
	ldrb r0, [r7]
	add r6, #0x81
	strb r0, [r6]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end DecompressGlyphTiles_FromPreloaded

	thumb_func_start DecompressGlyphTiles_LazyFromNarc
DecompressGlyphTiles_LazyFromNarc: ; 0x02026110
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r6, r1, #0
	add r5, r2, #0
	ldr r3, [r4, #0x78]
	ldr r1, [r4, #0x5c]
	ldr r2, [r4, #0xc]
	add r3, r3, r1
	add r1, r6, #0
	mul r1, r2
	add r1, r3, r1
	add r3, r4, #0
	ldr r0, [r4, #0x54]
	add r3, #0x14
	bl NARC_ReadFromAbsolutePos
	ldr r0, [r4, #8]
	cmp r0, #3
	bhi _020261B4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02026142: ; jump table
	.short _0202614A - _02026142 - 2 ; case 0
	.short _02026156 - _02026142 - 2 ; case 1
	.short _0202616E - _02026142 - 2 ; case 2
	.short _02026186 - _02026142 - 2 ; case 3
_0202614A:
	add r0, r4, #0
	add r0, #0x14
	add r1, r5, #0
	bl DecompressGlyphTile
	b _020261B4
_02026156:
	add r0, r4, #0
	add r0, #0x14
	add r1, r5, #0
	bl DecompressGlyphTile
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x24
	add r1, #0x40
	bl DecompressGlyphTile
	b _020261B4
_0202616E:
	add r0, r4, #0
	add r0, #0x14
	add r1, r5, #0
	bl DecompressGlyphTile
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x24
	add r1, #0x20
	bl DecompressGlyphTile
	b _020261B4
_02026186:
	add r0, r4, #0
	add r0, #0x14
	add r1, r5, #0
	bl DecompressGlyphTile
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x24
	add r1, #0x20
	bl DecompressGlyphTile
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x34
	add r1, #0x40
	bl DecompressGlyphTile
	add r0, r4, #0
	add r1, r5, #0
	add r0, #0x44
	add r1, #0x60
	bl DecompressGlyphTile
_020261B4:
	ldr r2, [r4, #0x70]
	add r0, r4, #0
	add r1, r6, #0
	blx r2
	add r1, r5, #0
	add r1, #0x80
	add r4, #0x69
	strb r0, [r1]
	ldrb r0, [r4]
	add r5, #0x81
	strb r0, [r5]
	pop {r4, r5, r6, pc}
	thumb_func_end DecompressGlyphTiles_LazyFromNarc

	thumb_func_start GetStringWidth
GetStringWidth: ; 0x020261CC
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldrh r1, [r4]
	add r5, r0, #0
	ldr r0, _02026210 ; =0x0000FFFF
	add r7, r2, #0
	mov r6, #0
	cmp r1, r0
	beq _0202620C
_020261DE:
	ldr r0, _02026214 ; =0x0000FFFE
	cmp r1, r0
	bne _020261F6
	add r0, r4, #0
	bl MsgArray_SkipControlCode
	add r4, r0, #0
	ldrh r1, [r4]
	ldr r0, _02026210 ; =0x0000FFFF
	cmp r1, r0
	bne _02026204
	b _0202620C
_020261F6:
	ldr r2, [r5, #0x70]
	add r0, r5, #0
	sub r1, r1, #1
	blx r2
	add r0, r7, r0
	add r6, r6, r0
	add r4, r4, #2
_02026204:
	ldrh r1, [r4]
	ldr r0, _02026210 ; =0x0000FFFF
	cmp r1, r0
	bne _020261DE
_0202620C:
	sub r0, r6, r7
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02026210: .word 0x0000FFFF
_02026214: .word 0x0000FFFE
	thumb_func_end GetStringWidth

	thumb_func_start GetStringWidthFirstLine
GetStringWidthFirstLine: ; 0x02026218
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r7, r2, #0
	mov r6, #0
	b _02026252
_02026224:
	ldr r0, _02026268 ; =0x0000FFFE
	cmp r1, r0
	bne _02026244
	add r0, r4, #0
	bl MsgArray_SkipControlCode
	add r4, r0, #0
	ldrh r1, [r4]
	ldr r0, _0202626C ; =0x0000FFFF
	cmp r1, r0
	beq _02026262
	mov r0, #0xe
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _02026252
	b _02026262
_02026244:
	ldr r2, [r5, #0x70]
	add r0, r5, #0
	sub r1, r1, #1
	blx r2
	add r0, r7, r0
	add r6, r6, r0
	add r4, r4, #2
_02026252:
	ldrh r1, [r4]
	ldr r0, _0202626C ; =0x0000FFFF
	cmp r1, r0
	beq _02026262
	mov r0, #0xe
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _02026224
_02026262:
	sub r0, r6, r7
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02026268: .word 0x0000FFFE
_0202626C: .word 0x0000FFFF
	thumb_func_end GetStringWidthFirstLine

	thumb_func_start StringAllCharsValid
StringAllCharsValid: ; 0x02026270
	push {r3, r4, r5, r6, r7, lr}
	ldrh r2, [r1]
	add r5, r0, #0
	ldr r0, _020262B0 ; =0x0000FFFF
	cmp r2, r0
	beq _020262AC
	add r6, r0, #0
	add r7, r0, #0
	sub r4, r0, #1
_02026282:
	cmp r2, r4
	bne _02026298
	add r0, r1, #0
	bl MsgArray_SkipControlCode
	add r1, r0, #0
	ldrh r2, [r1]
	cmp r2, r6
	bne _02026298
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02026298:
	ldr r0, [r5, #0x64]
	sub r2, r2, #1
	cmp r2, r0
	blo _020262A4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020262A4:
	add r1, r1, #2
	ldrh r2, [r1]
	cmp r2, r7
	bne _02026282
_020262AC:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020262B0: .word 0x0000FFFF
	thumb_func_end StringAllCharsValid

	thumb_func_start GetGlyphWidth_VariableWidth
GetGlyphWidth_VariableWidth: ; 0x020262B4
	ldr r2, [r0, #0x64]
	cmp r1, r2
	bhs _020262C0
	ldr r0, [r0, #0x74]
	ldrb r0, [r0, r1]
	bx lr
_020262C0:
	ldr r1, [r0, #0x74]
	ldr r0, _020262C8 ; =0x000001AB
	ldrb r0, [r1, r0]
	bx lr
	.balign 4, 0
_020262C8: .word 0x000001AB
	thumb_func_end GetGlyphWidth_VariableWidth

	thumb_func_start GetGlyphWidth_FixedWidth
GetGlyphWidth_FixedWidth: ; 0x020262CC
	add r0, #0x68
	ldrb r0, [r0]
	bx lr
	.balign 4, 0
	thumb_func_end GetGlyphWidth_FixedWidth

	thumb_func_start GetStringWidthMultiline
GetStringWidthMultiline: ; 0x020262D4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	ldrh r1, [r5]
	add r7, r0, #0
	mov r4, #0
	ldr r0, _02026334 ; =0x0000FFFF
	add r6, r2, #0
	str r4, [sp]
	cmp r1, r0
	beq _02026326
_020262E8:
	ldr r0, _02026338 ; =0x0000FFFE
	cmp r1, r0
	bne _020262F8
	add r0, r5, #0
	bl MsgArray_SkipControlCode
	add r5, r0, #0
	b _0202631E
_020262F8:
	mov r0, #0xe
	lsl r0, r0, #0xc
	cmp r1, r0
	bne _02026310
	ldr r0, [sp]
	sub r1, r4, r6
	cmp r0, r1
	bhs _0202630A
	str r1, [sp]
_0202630A:
	mov r4, #0
	add r5, r5, #2
	b _0202631E
_02026310:
	ldr r2, [r7, #0x70]
	add r0, r7, #0
	sub r1, r1, #1
	blx r2
	add r0, r6, r0
	add r4, r4, r0
	add r5, r5, #2
_0202631E:
	ldrh r1, [r5]
	ldr r0, _02026334 ; =0x0000FFFF
	cmp r1, r0
	bne _020262E8
_02026326:
	ldr r0, [sp]
	sub r1, r4, r6
	cmp r0, r1
	bhs _02026330
	str r1, [sp]
_02026330:
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02026334: .word 0x0000FFFF
_02026338: .word 0x0000FFFE
	thumb_func_end GetStringWidthMultiline

	thumb_func_start GetGlyphWidth
GetGlyphWidth: ; 0x0202633C
	push {r3, lr}
	cmp r1, #0
	beq _0202634A
	ldr r2, [r0, #0x70]
	sub r1, r1, #1
	blx r2
	pop {r3, pc}
_0202634A:
	bne _02026350
	bl GF_AssertFail
_02026350:
	mov r0, #0
	pop {r3, pc}
	thumb_func_end GetGlyphWidth
