	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FC51C:
	.byte 0x03, 0x04, 0x05, 0x19
	.byte 0x0F, 0x0D, 0x01, 0x00
_020FC524:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_020FC534:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x1F, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FC550:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

	.text

	thumb_func_start sub_020525BC
sub_020525BC: ; 0x020525BC
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r0, _020525FC ; =_020FC550
	bl GX_SetBanks
	ldr r0, _02052600 ; =_020FC524
	bl SetBothScreensModesAndDisable
	ldr r2, _02052604 ; =_020FC534
	add r0, r4, #0
	mov r1, #3
	mov r3, #0
	bl InitBgFromTemplate
	mov r0, #0x20
	str r0, [sp]
	mov r0, #0xb
	mov r3, #0x1a
	str r0, [sp, #4]
	mov r0, #0x10
	mov r1, #7
	mov r2, #0
	lsl r3, r3, #4
	bl GfGfxLoader_GXLoadPal
	ldr r1, _02052608 ; =0x00007FFF
	mov r0, #3
	bl BG_SetMaskColor
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
_020525FC: .word _020FC550
_02052600: .word _020FC524
_02052604: .word _020FC534
_02052608: .word 0x00007FFF
	thumb_func_end sub_020525BC

	thumb_func_start sub_0205260C
sub_0205260C: ; 0x0205260C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x24
	bl AllocFromHeap
	add r4, r0, #0
	bne _02052622
	bl GF_AssertFail
_02052622:
	add r0, r4, #0
	mov r1, #0
	mov r2, #0x24
	bl memset
	mov r0, #0
	str r0, [r4]
	mov r0, #0xb
	str r5, [r4, #4]
	bl BgConfig_Alloc
	str r0, [r4, #8]
	ldr r1, _020526C8 ; =0x00007FFF
	mov r0, #0
	bl sub_0200FBF4
	ldr r1, _020526C8 ; =0x00007FFF
	mov r0, #1
	bl sub_0200FBF4
	mov r0, #0
	bl sub_0200FBDC
	mov r0, #1
	bl sub_0200FBDC
	ldr r0, [r4, #8]
	bl sub_020525BC
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0xcb
	mov r3, #0xb
	bl NewMsgDataFromNarc
	str r0, [r4, #0x1c]
	mov r0, #0xb
	bl ScrStrBufs_new
	str r0, [r4, #0x20]
	add r1, r4, #0
	ldr r0, [r4, #8]
	ldr r2, _020526CC ; =_020FC51C
	add r1, #0xc
	bl AddWindow
	add r0, r5, #0
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	ldr r0, [r4, #0x20]
	mov r1, #0
	bl BufferPlayersName
	ldr r0, [r5, #0x20]
	ldr r0, [r0]
	cmp r0, #0x3f
	bne _020526A8
	mov r2, #0
	add r0, r4, #0
	mov r1, #4
	add r3, r2, #0
	bl sub_020527D0
	b _020526B4
_020526A8:
	mov r2, #0
	add r0, r4, #0
	mov r1, #3
	add r3, r2, #0
	bl sub_020527D0
_020526B4:
	add r0, r4, #0
	add r0, #0xc
	bl CopyWindowToVram
	ldr r1, _020526D0 ; =sub_020526D4
	add r0, r6, #0
	add r2, r4, #0
	bl sub_02050530
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020526C8: .word 0x00007FFF
_020526CC: .word _020FC51C
_020526D0: .word sub_020526D4
	thumb_func_end sub_0205260C

	thumb_func_start sub_020526D4
sub_020526D4: ; 0x020526D4
	push {r3, r4, lr}
	sub sp, #0xc
	bl sub_02050650
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #4
	bhi _020527B8
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020526F0: ; jump table
	.short _020526FA - _020526F0 - 2 ; case 0
	.short _0205271E - _020526F0 - 2 ; case 1
	.short _0205272E - _020526F0 - 2 ; case 2
	.short _02052766 - _020526F0 - 2 ; case 3
	.short _02052780 - _020526F0 - 2 ; case 4
_020526FA:
	mov r0, #8
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x20
	str r0, [sp, #8]
	ldr r3, _020527C0 ; =0x00007FFF
	mov r0, #3
	mov r2, #0x2b
	bl sub_0200FA24
	ldr r0, _020527C4 ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020527B8
_0205271E:
	bl sub_0200FB5C
	cmp r0, #0
	beq _020527B8
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020527B8
_0205272E:
	ldr r0, _020527C8 ; =gMain
	ldr r1, [r0, #0x48]
	mov r0, #1
	tst r0, r1
	bne _02052746
	mov r0, #2
	tst r0, r1
	bne _02052746
	ldr r0, _020527CC ; =gMain + 0x40
	ldrh r0, [r0, #0x24]
	cmp r0, #0
	beq _020527B8
_02052746:
	mov r0, #8
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x20
	str r0, [sp, #8]
	mov r0, #0
	add r1, r0, #0
	add r2, r0, #0
	add r3, r0, #0
	bl sub_0200FA24
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020527B8
_02052766:
	bl sub_0200FB5C
	cmp r0, #0
	beq _020527B8
	add r0, r4, #0
	add r0, #0xc
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _020527B8
_02052780:
	add r0, r4, #0
	add r0, #0xc
	mov r1, #0
	bl ClearFrameAndWindow2
	add r0, r4, #0
	add r0, #0xc
	bl RemoveWindow
	ldr r0, [r4, #0x20]
	bl ScrStrBufs_delete
	ldr r0, [r4, #0x1c]
	bl DestroyMsgData
	ldr r0, [r4, #8]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #8]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, pc}
_020527B8:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_020527C0: .word 0x00007FFF
_020527C4: .word 0x04000050
_020527C8: .word gMain
_020527CC: .word gMain + 0x40
	thumb_func_end sub_020526D4

	thumb_func_start sub_020527D0
sub_020527D0: ; 0x020527D0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	mov r0, #1
	str r1, [sp, #0x10]
	lsl r0, r0, #0xa
	mov r1, #0xb
	add r7, r3, #0
	bl String_ctor
	add r6, r0, #0
	mov r0, #1
	lsl r0, r0, #0xa
	mov r1, #0xb
	bl String_ctor
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0xc
	mov r1, #0
	bl FillWindowPixelBuffer
	ldr r0, [r5, #0x1c]
	ldr r1, [sp, #0x10]
	add r2, r6, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x20]
	add r1, r4, #0
	add r2, r6, #0
	bl StringExpandPlaceholders
	mov r0, #0
	add r1, r4, #0
	add r2, r0, #0
	bl sub_02003068
	add r3, r0, #0
	str r7, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	ldr r0, _02052854 ; =0x00010200
	mov r1, #0
	str r0, [sp, #8]
	add r0, r5, #0
	str r1, [sp, #0xc]
	ldrb r5, [r5, #0x13]
	add r0, #0xc
	add r2, r4, #0
	lsl r5, r5, #3
	sub r3, r5, r3
	lsl r3, r3, #0x18
	lsr r3, r3, #0x19
	sub r3, r3, #4
	lsl r3, r3, #0x18
	lsr r3, r3, #0x18
	bl AddTextPrinterParameterized2
	add r0, r6, #0
	bl String_dtor
	add r0, r4, #0
	bl String_dtor
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_02052854: .word 0x00010200
	thumb_func_end sub_020527D0

	thumb_func_start sub_02052858
sub_02052858: ; 0x02052858
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #6
	bhi _0205296E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205287E: ; jump table
	.short _0205288C - _0205287E - 2 ; case 0
	.short _020528CE - _0205287E - 2 ; case 1
	.short _020528DE - _0205287E - 2 ; case 2
	.short _020528F2 - _0205287E - 2 ; case 3
	.short _0205291A - _0205287E - 2 ; case 4
	.short _02052928 - _0205287E - 2 ; case 5
	.short _02052968 - _0205287E - 2 ; case 6
_0205288C:
	ldr r0, [r5, #0xc]
	bl sub_0203B9C4
	add r7, r0, #0
	bl sub_0203B994
	add r1, sp, #4
	str r0, [sp]
	bl sub_0203BAAC
	add r0, r7, #0
	bl sub_0203B964
	add r1, r0, #0
	ldr r0, [sp]
	bl sub_0203BAE8
	add r0, r6, #0
	add r1, sp, #4
	bl sub_020537A8
	add r0, r5, #0
	bl sub_02067BD0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl HealParty
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205296E
_020528CE:
	mov r0, #0
	mov r1, #0x14
	bl GF_SndStartFadeOutBGM
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205296E
_020528DE:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _0205296E
	bl sub_02054F14
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205296E
_020528F2:
	mov r0, #0xf
	mvn r0, r0
	mov r1, #0x37
	mov r2, #1
	bl SetBrightness
	mov r0, #0xf
	mvn r0, r0
	mov r1, #0x3f
	mov r2, #2
	bl SetBrightness
	add r0, r5, #0
	add r1, r6, #0
	bl sub_0205260C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205296E
_0205291A:
	add r0, r6, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205296E
_02052928:
	mov r0, #0
	mov r1, #0x3f
	mov r2, #3
	bl SetBrightness
	bl sub_0203BA70
	add r7, r0, #0
	ldr r0, [r5, #0xc]
	bl sub_0203B9C4
	bl sub_0203B994
	cmp r7, r0
	bne _02052954
	mov r2, #0
	ldr r1, _02052974 ; =0x000007DC
	add r0, r6, #0
	add r3, r2, #0
	bl sub_0203FED4
	b _02052960
_02052954:
	mov r2, #0
	ldr r1, _02052978 ; =0x000007DD
	add r0, r6, #0
	add r3, r2, #0
	bl sub_0203FED4
_02052960:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0205296E
_02052968:
	add sp, #0x18
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0205296E:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02052974: .word 0x000007DC
_02052978: .word 0x000007DD
	thumb_func_end sub_02052858

	thumb_func_start sub_0205297C
sub_0205297C: ; 0x0205297C
	ldr r3, _02052984 ; =sub_02050530
	ldr r1, _02052988 ; =sub_02052858
	mov r2, #0
	bx r3
	.balign 4, 0
_02052984: .word sub_02050530
_02052988: .word sub_02052858
	thumb_func_end sub_0205297C
