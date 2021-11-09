	.include "asm/macros.inc"
	.include "global.inc"

	.bss

_021D2228:
	.space 0x8

	.rodata

_020F645C:
	.word 0x00000006
_020F6460:
	.word 0x0000002A
_020F6464:
	.word 0x00000000, 0x00000023, Sav2_HOF_sizeof, Sav2_HOF_init
	.word 0x00000001, 0x00000026, sub_020312A4, sub_020312AC
	.word 0x00000002, 0x00000027, sub_0202FBCC, sub_0202FBD4
	.word 0x00000003, 0x00000029, sub_0202FBCC, sub_0202FBD4
	.word 0x00000004, 0x0000002B, sub_0202FBCC, sub_0202FBD4
	.word 0x00000005, 0x0000002D, sub_0202FBCC, sub_0202FBD4
_020F64C4:
	.word 0x00000000, 0x00000000, Sav2_SysInfo_sizeof, Sav2_SysInfo_init
	.word 0x00000001, 0x00000000, Sav2_PlayerData_sizeof, Sav2_PlayerData_init
	.word 0x00000002, 0x00000000, SavArray_Party_sizeof, SavArray_Party_init
	.word 0x00000003, 0x00000000, Sav2_Bag_sizeof, Sav2_Bag_init
	.word 0x00000004, 0x00000000, SavArray_Flags_sizeof, SavArray_Flags_init
	.word 0x00000005, 0x00000000, sub_0203B91C, sub_0203B938
	.word 0x00000006, 0x00000000, sub_020293E0, sub_02029D98
	.word 0x00000007, 0x00000000, Sav2_Daycare_sizeof, Sav2_Daycare_init
	.word 0x00000008, 0x00000000, sub_0202AEC0, sub_0202AED4
	.word 0x00000009, 0x00000000, sub_0202A8B4, sub_0202A8BC
	.word 0x0000000A, 0x00000000, sub_0203B920, sub_0203B928
	.word 0x0000000B, 0x00000000, sub_020290B8, sub_020290C8
	.word 0x0000000C, 0x00000000, sub_0202B98C, sub_0202B930
	.word 0x0000000D, 0x00000000, Sav2_Mailbox_sizeof, Sav2_Mailbox_init
	.word 0x0000000E, 0x00000000, sub_0202C730, sub_0202C75C
	.word 0x0000000F, 0x00000000, sub_0202C9A0, sub_0202C9A8
	.word 0x00000010, 0x00000000, GameStats_sizeof, GameStats_init
	.word 0x00000011, 0x00000000, Sav2_SealCase_sizeof, Sav2_SealCase_init
	.word 0x00000012, 0x00000000, Sav2_Chatot_sizeof, Sav2_Chatot_init
	.word 0x00000013, 0x00000000, sub_02031000, sub_02031008
	.word 0x00000014, 0x00000000, sub_0202D938, sub_0202D93C
	.word 0x00000015, 0x00000000, sub_0202D968, sub_0202D96C
	.word 0x00000016, 0x00000000, sub_0202DB40, sub_0202DB44
	.word 0x00000017, 0x00000000, sub_0202E41C, sub_0202E424
	.word 0x00000018, 0x00000000, sub_0202E4F4, sub_0202E4FC
	.word 0x00000019, 0x00000000, sub_0202C034, sub_0202C03C
	.word 0x0000001A, 0x00000000, sub_0202CA24, sub_0202CA2C
	.word 0x0000001B, 0x00000000, sub_0202DBA8, sub_0202DBB0
	.word 0x0000001C, 0x00000000, sub_0202EB30, sub_0202EB38
	.word 0x0000001D, 0x00000000, sub_02031AF0, sub_02031AF4
	.word 0x0000001E, 0x00000000, sub_02015BF0, sub_02015BF4
	.word 0x0000001F, 0x00000000, sub_0203170C, sub_02031710
	.word 0x00000020, 0x00000000, sub_020318C8, sub_020318CC
	.word 0x00000021, 0x00000000, sub_0202ED18, sub_0202ED1C
	.word 0x00000022, 0x00000000, sub_0202ED74, sub_0202EDEC
	.word 0x00000023, 0x00000000, sub_0202F574, sub_0202F588
	.word 0x00000024, 0x00000000, sub_0202FA5C, sub_0202FA70
	.word 0x00000025, 0x00000000, sub_02031904, sub_0203190C
	.word 0x00000026, 0x00000000, sub_02031B0C, sub_02031B54
	.word 0x00000027, 0x00000000, Pokewalker_sizeof, Pokewalker_init
	.word 0x00000028, 0x00000000, sub_02032774, sub_02032788
	.word 0x00000029, 0x00000001, PCStorage_sizeof, PCStorage_init

	.text

	thumb_func_start SaveBlock2_new
SaveBlock2_new: ; 0x020271B0
	push {r3, r4, r5, lr}
	sub sp, #8
	ldr r1, _02027298 ; =0x0002330C
	mov r0, #1
	bl AllocFromHeap
	add r4, r0, #0
	ldr r2, _02027298 ; =0x0002330C
	mov r0, #0
	add r1, r4, #0
	bl MIi_CpuClearFast
	ldr r0, _0202729C ; =_021D2228
	str r4, [r0]
	bl SaveDetectFlash
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	mov r1, #1
	ldr r0, _020272A0 ; =0x00023308
	str r1, [r4, #8]
	strb r1, [r4, r0]
	add r0, r0, #1
	strb r1, [r4, r0]
	ldr r0, _020272A4 ; =0x00023014
	add r0, r4, r0
	bl SaveBlock2_InitSubstructs
	ldr r0, _020272A8 ; =0x000232B4
	ldr r1, _020272A4 ; =0x00023014
	add r0, r4, r0
	add r1, r4, r1
	bl sub_02027EFC
	add r0, r4, #0
	bl sub_020277D4
	add r5, r0, #0
	mov r0, #0
	str r0, [r4, #0xc]
	cmp r5, #3
	bhi _02027290
	add r0, r5, r5
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02027212: ; jump table
	.short _0202728A - _02027212 - 2 ; case 0
	.short _0202721A - _02027212 - 2 ; case 1
	.short _0202721A - _02027212 - 2 ; case 2
	.short _02027282 - _02027212 - 2 ; case 3
_0202721A:
	add r0, r4, #0
	bl Sav2_LoadDynamicRegion
	mov r1, #1
	mov r0, #0
	str r1, [r4, #4]
	str r0, [r4, #8]
	cmp r5, #2
	bne _02027234
	ldr r0, [r4, #0xc]
	orr r0, r1
	str r0, [r4, #0xc]
	b _0202723E
_02027234:
	add r0, r4, #0
	bl sub_02027170
	ldr r1, _020272AC ; =0x000232F8
	str r0, [r4, r1]
_0202723E:
	add r0, r4, #0
	add r1, sp, #4
	add r2, sp, #0
	bl sub_020279EC
	ldr r0, [sp, #4]
	cmp r0, #3
	bne _02027258
	ldr r1, [r4, #0xc]
	mov r0, #8
	orr r0, r1
	str r0, [r4, #0xc]
	b _02027264
_02027258:
	cmp r0, #2
	bne _02027264
	ldr r1, [r4, #0xc]
	mov r0, #4
	orr r0, r1
	str r0, [r4, #0xc]
_02027264:
	ldr r0, [sp]
	cmp r0, #3
	bne _02027274
	ldr r1, [r4, #0xc]
	mov r0, #0x20
	orr r0, r1
	str r0, [r4, #0xc]
	b _02027290
_02027274:
	cmp r0, #2
	bne _02027290
	ldr r1, [r4, #0xc]
	mov r0, #0x10
	orr r0, r1
	str r0, [r4, #0xc]
	b _02027290
_02027282:
	ldr r1, [r4, #0xc]
	mov r0, #2
	orr r0, r1
	str r0, [r4, #0xc]
_0202728A:
	add r0, r4, #0
	bl Sav2_InitDynamicRegion
_02027290:
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, pc}
	nop
_02027298: .word 0x0002330C
_0202729C: .word _021D2228
_020272A0: .word 0x00023308
_020272A4: .word 0x00023014
_020272A8: .word 0x000232B4
_020272AC: .word 0x000232F8
	thumb_func_end SaveBlock2_new

	thumb_func_start sub_020272B0
sub_020272B0: ; 0x020272B0
	push {r3, lr}
	ldr r0, _020272C4 ; =_021D2228
	ldr r0, [r0]
	cmp r0, #0
	bne _020272BE
	bl GF_AssertFail
_020272BE:
	ldr r0, _020272C4 ; =_021D2228
	ldr r0, [r0]
	pop {r3, pc}
	.balign 4, 0
_020272C4: .word _021D2228
	thumb_func_end sub_020272B0

	thumb_func_start SavArray_get
SavArray_get: ; 0x020272C8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x2a
	blt _020272D6
	bl GF_AssertFail
_020272D6:
	lsl r0, r4, #4
	add r1, r5, r0
	ldr r0, _020272E8 ; =0x0002301C
	add r2, r5, #0
	ldr r0, [r1, r0]
	add r2, #0x10
	add r0, r2, r0
	pop {r3, r4, r5, pc}
	nop
_020272E8: .word 0x0002301C
	thumb_func_end SavArray_get

	thumb_func_start SavArray_const_get
SavArray_const_get: ; 0x020272EC
	ldr r3, _020272F0 ; =SavArray_get
	bx r3
	.balign 4, 0
_020272F0: .word SavArray_get
	thumb_func_end SavArray_const_get

	thumb_func_start sub_020272F4
sub_020272F4: ; 0x020272F4
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #1
	str r0, [sp]
	mov r0, #3
	lsl r1, r1, #0xc
	bl AllocFromHeapAtEnd
	add r6, r0, #0
	mov r0, #1
	bl sub_0201A4BC
	ldr r1, _020273AC ; =0x0002330A
	ldr r0, [sp]
	ldrh r0, [r0, r1]
	cmp r0, #0
	bne _02027318
	mov r2, #1
	b _0202731A
_02027318:
	mov r2, #0
_0202731A:
	ldr r0, [sp]
	mov r1, #0
	bl FlashClobberChunkFooter
	ldr r1, _020273AC ; =0x0002330A
	ldr r0, [sp]
	ldrh r0, [r0, r1]
	cmp r0, #0
	bne _02027330
	mov r2, #1
	b _02027332
_02027330:
	mov r2, #0
_02027332:
	ldr r0, [sp]
	mov r1, #1
	bl FlashClobberChunkFooter
	ldr r0, [sp]
	ldr r3, _020273AC ; =0x0002330A
	add r2, r0, #0
	ldrh r2, [r2, r3]
	mov r1, #0
	bl FlashClobberChunkFooter
	ldr r0, [sp]
	ldr r3, _020273AC ; =0x0002330A
	add r2, r0, #0
	ldrh r2, [r2, r3]
	mov r1, #1
	bl FlashClobberChunkFooter
	mov r0, #0
	mov r2, #1
	mvn r0, r0
	add r1, r6, #0
	lsl r2, r2, #0xc
	bl MIi_CpuClearFast
	mov r4, #0
	mov r7, #1
	add r5, r4, #0
	lsl r7, r7, #0xc
_0202736C:
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl FlashWriteChunk
	add r0, r4, #0
	add r0, #0x40
	lsl r0, r0, #0xc
	add r1, r6, #0
	add r2, r7, #0
	bl FlashWriteChunk
	mov r0, #1
	lsl r0, r0, #0xc
	add r4, r4, #1
	add r5, r5, r0
	cmp r4, #0x40
	blt _0202736C
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [sp]
	bl Sav2_InitDynamicRegion
	ldr r0, [sp]
	mov r1, #0
	str r1, [r0, #4]
	mov r0, #1
	bl sub_0201A4CC
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020273AC: .word 0x0002330A
	thumb_func_end sub_020272F4

	thumb_func_start sub_020273B0
sub_020273B0: ; 0x020273B0
	push {r4, lr}
	sub sp, #8
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #0
	bne _020273C2
	add sp, #8
	mov r0, #0
	pop {r4, pc}
_020273C2:
	bl Sav2_LoadDynamicRegion
	cmp r0, #0
	beq _020273E8
	mov r0, #1
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r4, #8]
	add r0, r4, #0
	add r1, sp, #4
	add r2, sp, #0
	bl sub_020279EC
	add r0, r4, #0
	bl sub_02027180
	add sp, #8
	mov r0, #1
	pop {r4, pc}
_020273E8:
	mov r0, #0
	add sp, #8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020273B0

	thumb_func_start sub_020273F0
sub_020273F0: ; 0x020273F0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	bne _020273FE
	mov r0, #3
	pop {r4, pc}
_020273FE:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _02027454
	mov r0, #1
	bl sub_0201A4BC
	ldr r0, _02027468 ; =0x0002330A
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _02027416
	mov r2, #1
	b _02027418
_02027416:
	mov r2, #0
_02027418:
	add r0, r4, #0
	mov r1, #0
	bl FlashClobberChunkFooter
	ldr r0, _02027468 ; =0x0002330A
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _0202742C
	mov r2, #1
	b _0202742E
_0202742C:
	mov r2, #0
_0202742E:
	add r0, r4, #0
	mov r1, #1
	bl FlashClobberChunkFooter
	ldr r2, _02027468 ; =0x0002330A
	add r0, r4, #0
	ldrh r2, [r4, r2]
	mov r1, #0
	bl FlashClobberChunkFooter
	ldr r2, _02027468 ; =0x0002330A
	add r0, r4, #0
	ldrh r2, [r4, r2]
	mov r1, #1
	bl FlashClobberChunkFooter
	mov r0, #1
	bl sub_0201A4CC
_02027454:
	add r0, r4, #0
	bl sub_02027DB4
	cmp r0, #2
	bne _02027466
	mov r1, #1
	str r1, [r4, #4]
	mov r1, #0
	str r1, [r4, #8]
_02027466:
	pop {r4, pc}
	.balign 4, 0
_02027468: .word 0x0002330A
	thumb_func_end sub_020273F0

	thumb_func_start sub_0202746C
sub_0202746C: ; 0x0202746C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #2
	blt _0202747A
	bl GF_AssertFail
_0202747A:
	ldr r0, [r5, #8]
	cmp r0, #0
	beq _02027484
	bl GF_AssertFail
_02027484:
	ldr r0, [r5, #4]
	cmp r0, #1
	beq _0202748E
	bl GF_AssertFail
_0202748E:
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02027550
_02027496:
	add r0, r5, #0
	bl sub_02027564
	cmp r0, #0
	beq _02027496
	cmp r0, #1
	beq _02027496
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202746C

	thumb_func_start Sav2_InitDynamicRegion
Sav2_InitDynamicRegion: ; 0x020274A8
	add r2, r0, #0
	mov r1, #1
	ldr r0, _020274C4 ; =0x00023308
	str r1, [r2, #8]
	strb r1, [r2, r0]
	add r0, r0, #1
	strb r1, [r2, r0]
	ldr r1, _020274C8 ; =0x00023014
	add r0, r2, #0
	ldr r3, _020274CC ; =Sav2_InitDynamicRegion_Internal
	add r0, #0x10
	add r1, r2, r1
	bx r3
	nop
_020274C4: .word 0x00023308
_020274C8: .word 0x00023014
_020274CC: .word Sav2_InitDynamicRegion_Internal
	thumb_func_end Sav2_InitDynamicRegion

	thumb_func_start sub_020274D0
sub_020274D0: ; 0x020274D0
	ldr r0, [r0]
	bx lr
	thumb_func_end sub_020274D0

	thumb_func_start sub_020274D4
sub_020274D4: ; 0x020274D4
	ldr r0, [r0, #0xc]
	bx lr
	thumb_func_end sub_020274D4

	thumb_func_start sub_020274D8
sub_020274D8: ; 0x020274D8
	mov r1, #0
	str r1, [r0, #0xc]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020274D8

	thumb_func_start sub_020274E0
sub_020274E0: ; 0x020274E0
	ldr r0, [r0, #4]
	bx lr
	thumb_func_end sub_020274E0

	thumb_func_start sub_020274E4
sub_020274E4: ; 0x020274E4
	ldr r0, [r0, #8]
	bx lr
	thumb_func_end sub_020274E4

	thumb_func_start sub_020274E8
sub_020274E8: ; 0x020274E8
	push {r3, lr}
	bl Sav2_Misc_get
	bl sub_0202A9D8
	pop {r3, pc}
	thumb_func_end sub_020274E8

	thumb_func_start sub_020274F4
sub_020274F4: ; 0x020274F4
	push {r3, lr}
	bl Sav2_Misc_get
	bl sub_0202A9C4
	pop {r3, pc}
	thumb_func_end sub_020274F4

	thumb_func_start sub_02027500
sub_02027500: ; 0x02027500
	push {r4, lr}
	add r4, r0, #0
	bl sub_020274E4
	cmp r0, #0
	beq _0202751A
	add r0, r4, #0
	bl sub_020274E0
	cmp r0, #0
	beq _0202751A
	mov r0, #1
	pop {r4, pc}
_0202751A:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02027500

	thumb_func_start sub_02027520
sub_02027520: ; 0x02027520
	push {r3, lr}
	bl sub_02027544
	cmp r0, #6
	blo _0202752E
	mov r0, #1
	pop {r3, pc}
_0202752E:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02027520

	thumb_func_start sub_02027534
sub_02027534: ; 0x02027534
	ldr r0, _0202753C ; =_021D2228
	ldr r3, _02027540 ; =sub_02027190
	ldr r0, [r0]
	bx r3
	.balign 4, 0
_0202753C: .word _021D2228
_02027540: .word sub_02027190
	thumb_func_end sub_02027534

	thumb_func_start sub_02027544
sub_02027544: ; 0x02027544
	push {r3, lr}
	bl sub_02028C70
	bl sub_02028C9C
	pop {r3, pc}
	thumb_func_end sub_02027544

	thumb_func_start sub_02027550
sub_02027550: ; 0x02027550
	add r2, r1, #0
	ldr r1, _0202755C ; =0x000232CC
	ldr r3, _02027560 ; =sub_02027BDC
	add r1, r0, r1
	bx r3
	nop
_0202755C: .word 0x000232CC
_02027560: .word sub_02027BDC
	thumb_func_end sub_02027550

	thumb_func_start sub_02027564
sub_02027564: ; 0x02027564
	push {r3, r4, r5, lr}
	ldr r1, _0202759C ; =0x000232D4
	add r5, r0, #0
	ldr r2, [r5, r1]
	cmp r2, #1
	bne _0202757A
	sub r1, #8
	add r1, r5, r1
	bl sub_02028968
	b _02027582
_0202757A:
	sub r1, #8
	add r1, r5, r1
	bl sub_02027C18
_02027582:
	add r4, r0, #0
	cmp r4, #0
	beq _02027598
	cmp r4, #1
	beq _02027598
	ldr r1, _020275A0 ; =0x000232CC
	add r0, r5, #0
	add r1, r5, r1
	add r2, r4, #0
	bl sub_02027CEC
_02027598:
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202759C: .word 0x000232D4
_020275A0: .word 0x000232CC
	thumb_func_end sub_02027564

	thumb_func_start sub_020275A4
sub_020275A4: ; 0x020275A4
	ldr r1, _020275AC ; =0x000232CC
	ldr r3, _020275B0 ; =sub_02027D6C
	add r1, r0, r1
	bx r3
	.balign 4, 0
_020275AC: .word 0x000232CC
_020275B0: .word sub_02027D6C
	thumb_func_end sub_020275A4

	thumb_func_start sub_020275B4
sub_020275B4: ; 0x020275B4
	bx lr
	.balign 4, 0
	thumb_func_end sub_020275B4

	thumb_func_start sub_020275B8
sub_020275B8: ; 0x020275B8
	bx lr
	.balign 4, 0
	thumb_func_end sub_020275B8

	thumb_func_start sub_020275BC
sub_020275BC: ; 0x020275BC
	mov r1, #0
	str r1, [r0]
	str r1, [r0, #4]
	bx lr
	thumb_func_end sub_020275BC

	thumb_func_start sub_020275C4
sub_020275C4: ; 0x020275C4
	ldr r3, _020275CC ; =GF_CalcCRC16
	add r0, r1, #0
	add r1, r2, #0
	bx r3
	.balign 4, 0
_020275CC: .word GF_CalcCRC16
	thumb_func_end sub_020275C4

	thumb_func_start sub_020275D0
sub_020275D0: ; 0x020275D0
	ldr r3, _020275DC ; =GF_CalcCRC16
	sub r2, #0x10
	add r0, r1, #0
	add r1, r2, #0
	bx r3
	nop
_020275DC: .word GF_CalcCRC16
	thumb_func_end sub_020275D0

	thumb_func_start sub_020275E0
sub_020275E0: ; 0x020275E0
	cmp r0, #0
	bne _020275E8
	mov r2, #0
	b _020275EC
_020275E8:
	mov r2, #1
	lsl r2, r2, #0x12
_020275EC:
	ldr r0, [r1, #4]
	add r0, r2, r0
	bx lr
	.balign 4, 0
	thumb_func_end sub_020275E0

	thumb_func_start sub_020275F4
sub_020275F4: ; 0x020275F4
	push {r3, r4, r5, lr}
	ldr r3, _02027618 ; =0x000232B4
	add r3, r0, r3
	mov r0, #0xc
	mul r0, r2
	add r5, r3, r0
	ldr r0, [r5, #4]
	add r4, r1, r0
	ldr r0, [r5, #8]
	cmp r0, #0
	bne _0202760E
	bl GF_AssertFail
_0202760E:
	ldr r0, [r5, #8]
	add r0, r4, r0
	sub r0, #0x10
	pop {r3, r4, r5, pc}
	nop
_02027618: .word 0x000232B4
	thumb_func_end sub_020275F4

	thumb_func_start sub_0202761C
sub_0202761C: ; 0x0202761C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	ldr r4, _02027684 ; =0x000232B4
	add r3, r0, #0
	add r4, r3, r4
	add r6, r2, #0
	mov r3, #0xc
	mul r3, r6
	str r0, [sp]
	str r1, [sp, #4]
	add r5, r4, r3
	bl sub_020275F4
	add r4, r0, #0
	ldr r7, [r5, #4]
	bl sub_020275B4
	ldr r2, [r5, #8]
	ldr r0, [r4, #4]
	cmp r0, r2
	beq _0202764C
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202764C:
	ldr r1, [r4, #8]
	ldr r0, _02027688 ; =0x20060623
	cmp r1, r0
	beq _0202765A
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202765A:
	ldrh r0, [r4, #0xc]
	cmp r0, r6
	beq _02027666
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02027666:
	ldr r1, [sp, #4]
	ldr r0, [sp]
	add r1, r1, r7
	bl sub_020275D0
	ldrh r1, [r4, #0xe]
	cmp r1, r0
	bne _0202767C
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202767C:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02027684: .word 0x000232B4
_02027688: .word 0x20060623
	thumb_func_end sub_0202761C

	thumb_func_start sub_0202768C
sub_0202768C: ; 0x0202768C
	push {r3, r4, r5, r6, r7, lr}
	add r6, r2, #0
	add r4, r1, #0
	add r5, r0, #0
	str r3, [sp]
	add r0, r4, #0
	add r1, r6, #0
	add r2, r3, #0
	bl sub_020275F4
	add r7, r0, #0
	ldr r2, [sp]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_0202761C
	str r0, [r5]
	cmp r0, #0
	beq _020276B8
	ldr r0, [r7]
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
_020276B8:
	mov r0, #0
	str r0, [r5, #4]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0202768C

	thumb_func_start sub_020276C0
sub_020276C0: ; 0x020276C0
	push {r3, r4, r5, r6, r7, lr}
	ldr r3, _02027700 ; =0x000232B4
	add r6, r0, #0
	add r7, r2, #0
	mov r4, #0xc
	add r3, r6, r3
	mul r4, r7
	str r1, [sp]
	add r5, r3, r4
	bl sub_020275F4
	add r4, r0, #0
	ldr r0, _02027704 ; =0x00023010
	ldr r1, [r5, #4]
	ldr r0, [r6, r0]
	ldr r2, [sp]
	str r0, [r4]
	ldr r0, [r5, #8]
	add r1, r2, r1
	str r0, [r4, #4]
	ldr r0, _02027708 ; =0x20060623
	str r0, [r4, #8]
	strh r7, [r4, #0xc]
	ldr r2, [r5, #8]
	add r0, r6, #0
	bl sub_020275D0
	strh r0, [r4, #0xe]
	add r0, r4, #0
	bl sub_020275B4
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02027700: .word 0x000232B4
_02027704: .word 0x00023010
_02027708: .word 0x20060623
	thumb_func_end sub_020276C0

	thumb_func_start sub_0202770C
sub_0202770C: ; 0x0202770C
	mov r2, #0
	mvn r2, r2
	cmp r0, r2
	bne _0202771C
	cmp r1, #0
	bne _0202771C
	add r0, r2, #0
	bx lr
_0202771C:
	cmp r0, #0
	bne _0202772C
	mov r2, #0
	mvn r2, r2
	cmp r1, r2
	bne _0202772C
	mov r0, #1
	bx lr
_0202772C:
	cmp r0, r1
	bls _02027734
	mov r0, #1
	bx lr
_02027734:
	cmp r0, r1
	bhs _0202773C
	mov r0, #1
	b _0202773E
_0202773C:
	mov r0, #0
_0202773E:
	neg r0, r0
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202770C

	thumb_func_start sub_02027744
sub_02027744: ; 0x02027744
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r6, r1, #0
	ldr r0, [r7, #4]
	ldr r1, [r6, #4]
	add r5, r2, #0
	add r4, r3, #0
	bl sub_0202770C
	ldr r2, [r7]
	cmp r2, #0
	beq _02027788
	ldr r1, [r6]
	cmp r1, #0
	beq _02027788
	cmp r0, #0
	ble _02027770
	mov r0, #0
	str r0, [r5]
	mov r0, #1
	str r0, [r4]
	b _02027784
_02027770:
	bge _0202777C
	mov r0, #1
	str r0, [r5]
	mov r0, #0
	str r0, [r4]
	b _02027784
_0202777C:
	mov r0, #0
	str r0, [r5]
	mov r0, #1
	str r0, [r4]
_02027784:
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_02027788:
	cmp r2, #0
	beq _0202779E
	ldr r0, [r6]
	cmp r0, #0
	bne _0202779E
	mov r0, #0
	str r0, [r5]
	mov r0, #2
	str r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0202779E:
	cmp r2, #0
	bne _020277B2
	ldr r0, [r6]
	cmp r0, #0
	beq _020277B2
	mov r0, #1
	str r0, [r5]
	mov r1, #2
	str r1, [r4]
	pop {r3, r4, r5, r6, r7, pc}
_020277B2:
	mov r0, #2
	str r0, [r5]
	str r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02027744

	thumb_func_start sub_020277BC
sub_020277BC: ; 0x020277BC
	lsl r2, r3, #3
	add r1, r1, r2
	ldr r2, [r1, #4]
	ldr r1, _020277CC ; =0x00023010
	str r2, [r0, r1]
	ldr r1, _020277D0 ; =0x0002330A
	strh r3, [r0, r1]
	bx lr
	.balign 4, 0
_020277CC: .word 0x00023010
_020277D0: .word 0x0002330A
	thumb_func_end sub_020277BC

	thumb_func_start sub_020277D4
sub_020277D4: ; 0x020277D4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x34
	mov r1, #0x23
	add r5, r0, #0
	mov r0, #3
	lsl r1, r1, #0xc
	bl AllocFromHeapAtEnd
	mov r1, #0x23
	add r6, r0, #0
	mov r0, #3
	lsl r1, r1, #0xc
	bl AllocFromHeapAtEnd
	mov r2, #0x23
	add r4, r0, #0
	mov r0, #0
	add r1, r6, #0
	lsl r2, r2, #0xc
	bl FlashLoadChunk
	cmp r0, #0
	add r0, sp, #0x24
	beq _0202781C
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #0
	bl sub_0202768C
	add r0, sp, #0x14
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #1
	bl sub_0202768C
	b _02027826
_0202781C:
	bl sub_020275BC
	add r0, sp, #0x14
	bl sub_020275BC
_02027826:
	mov r0, #1
	mov r2, #0x23
	lsl r0, r0, #0x12
	add r1, r4, #0
	lsl r2, r2, #0xc
	bl FlashLoadChunk
	cmp r0, #0
	add r0, sp, #0x2c
	beq _02027852
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl sub_0202768C
	add r0, sp, #0x1c
	add r1, r5, #0
	add r2, r4, #0
	mov r3, #1
	bl sub_0202768C
	b _0202785C
_02027852:
	bl sub_020275BC
	add r0, sp, #0x1c
	bl sub_020275BC
_0202785C:
	add r0, r6, #0
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	add r0, sp, #0x24
	add r1, sp, #0x2c
	add r2, sp, #0x10
	add r3, sp, #8
	bl sub_02027744
	add r7, r0, #0
	ldr r0, [sp, #8]
	add r1, sp, #0x1c
	str r0, [sp]
	add r0, sp, #0x14
	add r2, sp, #0xc
	add r3, sp, #4
	ldr r4, [sp, #0x10]
	bl sub_02027744
	add r6, r0, #0
	ldr r0, [sp, #0x24]
	bl sub_020275B8
	ldr r0, [sp, #0x2c]
	bl sub_020275B8
	ldr r0, [sp, #0x14]
	bl sub_020275B8
	ldr r0, [sp, #0x1c]
	bl sub_020275B8
	cmp r7, #0
	bne _020278B0
	cmp r6, #0
	bne _020278B0
	add sp, #0x34
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_020278B0:
	cmp r7, #0
	beq _020278B8
	cmp r6, #0
	bne _020278BE
_020278B8:
	add sp, #0x34
	mov r0, #3
	pop {r4, r5, r6, r7, pc}
_020278BE:
	cmp r4, #2
	bne _020278C6
	bl GF_AssertFail
_020278C6:
	cmp r7, #2
	bne _0202791C
	cmp r6, #2
	bne _0202791C
	lsl r2, r4, #3
	add r1, sp, #0x28
	add r0, sp, #0x18
	ldr r3, [r1, r2]
	ldr r2, [r0, r2]
	cmp r3, r2
	bne _020278F8
	add r0, r5, #0
	add r1, sp, #0x24
	add r2, sp, #0x14
	add r3, r4, #0
	bl sub_020277BC
	ldr r0, _020279E8 ; =0x00023308
	mov r1, #0
	strb r1, [r5, r0]
	add r0, r0, #1
	strb r1, [r5, r0]
	add sp, #0x34
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020278F8:
	ldr r2, [sp]
	lsl r2, r2, #3
	ldr r1, [r1, r2]
	ldr r0, [r0, r2]
	cmp r1, r0
	beq _0202790A
	add sp, #0x34
	mov r0, #3
	pop {r4, r5, r6, r7, pc}
_0202790A:
	ldr r3, [sp]
	add r0, r5, #0
	add r1, sp, #0x24
	add r2, sp, #0x14
	bl sub_020277BC
	add sp, #0x34
	mov r0, #2
	pop {r4, r5, r6, r7, pc}
_0202791C:
	cmp r7, #1
	bne _0202794A
	cmp r6, #2
	bne _0202794A
	lsl r2, r4, #3
	add r0, sp, #0x28
	ldr r1, [r0, r2]
	add r0, sp, #0x18
	ldr r0, [r0, r2]
	cmp r1, r0
	bne _02027944
	add r0, r5, #0
	add r1, sp, #0x24
	add r2, sp, #0x14
	add r3, r4, #0
	bl sub_020277BC
	add sp, #0x34
	mov r0, #2
	pop {r4, r5, r6, r7, pc}
_02027944:
	add sp, #0x34
	mov r0, #3
	pop {r4, r5, r6, r7, pc}
_0202794A:
	cmp r7, #2
	bne _020279A0
	cmp r6, #1
	bne _020279A0
	lsl r2, r4, #3
	add r1, sp, #0x28
	add r0, sp, #0x18
	ldr r3, [r1, r2]
	ldr r2, [r0, r2]
	cmp r3, r2
	bne _02027972
	add r0, r5, #0
	add r1, sp, #0x24
	add r2, sp, #0x14
	add r3, r4, #0
	bl sub_020277BC
	add sp, #0x34
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02027972:
	ldr r2, [sp]
	cmp r2, #2
	bne _0202797E
	add sp, #0x34
	mov r0, #3
	pop {r4, r5, r6, r7, pc}
_0202797E:
	lsl r2, r2, #3
	ldr r1, [r1, r2]
	ldr r0, [r0, r2]
	cmp r1, r0
	bne _0202799A
	ldr r3, [sp]
	add r0, r5, #0
	add r1, sp, #0x24
	add r2, sp, #0x14
	bl sub_020277BC
	add sp, #0x34
	mov r0, #2
	pop {r4, r5, r6, r7, pc}
_0202799A:
	add sp, #0x34
	mov r0, #3
	pop {r4, r5, r6, r7, pc}
_020279A0:
	cmp r7, #1
	bne _020279E0
	cmp r6, #1
	bne _020279E0
	ldr r3, [sp, #0xc]
	ldr r0, [sp, #0x10]
	cmp r0, r3
	bne _020279E0
	lsl r1, r0, #3
	add r0, sp, #0x28
	ldr r2, [r0, r1]
	lsl r1, r3, #3
	add r0, sp, #0x18
	ldr r0, [r0, r1]
	cmp r2, r0
	beq _020279C4
	bl GF_AssertFail
_020279C4:
	ldr r3, [sp, #0x10]
	add r0, r5, #0
	add r1, sp, #0x24
	add r2, sp, #0x14
	bl sub_020277BC
	ldr r0, [sp, #0x10]
	mov r2, #0
	add r1, r5, r0
	ldr r0, _020279E8 ; =0x00023308
	add sp, #0x34
	strb r2, [r1, r0]
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020279E0:
	mov r0, #3
	add sp, #0x34
	pop {r4, r5, r6, r7, pc}
	nop
_020279E8: .word 0x00023308
	thumb_func_end sub_020277D4

	thumb_func_start sub_020279EC
sub_020279EC: ; 0x020279EC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r6, r0, #0
	add r4, r1, #0
	add r5, r2, #0
	bl Sav2_Misc_get
	add r7, r0, #0
	mov r0, #1
	str r0, [r4]
	str r0, [r5]
	add r0, r6, #0
	bl sub_020274E8
	cmp r0, #0
	beq _02027AB6
	add r0, sp, #4
	str r0, [sp]
	add r0, r7, #0
	mov r1, #1
	add r2, sp, #0xc
	add r3, sp, #8
	bl sub_0202AC38
	mov r0, #0
	ldr r1, [sp, #0xc]
	mvn r0, r0
	cmp r1, r0
	bne _02027A2C
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _02027A5A
_02027A2C:
	add r0, sp, #0x10
	str r0, [sp]
	add r0, r6, #0
	mov r1, #3
	mov r2, #1
	add r3, sp, #0x14
	bl sub_020284A4
	bl FreeToHeap
	ldr r0, [sp, #0x14]
	cmp r0, #2
	bne _02027A4C
	mov r0, #3
	str r0, [r4]
	b _02027A5A
_02027A4C:
	cmp r0, #1
	bne _02027A5A
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _02027A5A
	mov r0, #2
	str r0, [r4]
_02027A5A:
	mov r4, #2
_02027A5C:
	add r0, sp, #4
	str r0, [sp]
	add r0, r7, #0
	add r1, r4, #0
	add r2, sp, #0xc
	add r3, sp, #8
	bl sub_0202AC38
	mov r0, #0
	ldr r1, [sp, #0xc]
	mvn r0, r0
	cmp r1, r0
	bne _02027A7C
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _02027AB0
_02027A7C:
	add r0, sp, #0x10
	str r0, [sp]
	add r0, r6, #0
	mov r1, #3
	add r2, r4, #0
	add r3, sp, #0x14
	bl sub_020284A4
	bl FreeToHeap
	ldr r0, [sp, #0x14]
	cmp r0, #2
	bne _02027A9C
	mov r0, #3
	str r0, [r5]
	b _02027AB0
_02027A9C:
	cmp r0, #1
	bne _02027AB0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _02027AB0
	ldr r0, [r5]
	cmp r0, #3
	beq _02027AB0
	mov r0, #2
	str r0, [r5]
_02027AB0:
	add r4, r4, #1
	cmp r4, #5
	ble _02027A5C
_02027AB6:
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020279EC

	thumb_func_start sub_02027ABC
sub_02027ABC: ; 0x02027ABC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r2, #0
	bl sub_020275E0
	ldr r1, [r5, #4]
	ldr r2, [r5, #8]
	add r1, r4, r1
	bl FlashLoadChunk
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02027ABC

	thumb_func_start Sav2_LoadDynamicRegion
Sav2_LoadDynamicRegion: ; 0x02027AD4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, _02027B5C ; =0x000232B4
	add r7, r5, #0
	mov r6, #0
	add r4, r5, r0
	add r7, #0x10
_02027AE2:
	ldr r0, _02027B60 ; =0x0002330A
	add r1, r4, #0
	ldrh r0, [r5, r0]
	add r2, r7, #0
	bl sub_02027ABC
	cmp r0, #0
	bne _02027AF6
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02027AF6:
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	bl sub_0202761C
	cmp r0, #0
	bne _02027B08
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02027B08:
	add r6, r6, #1
	add r4, #0xc
	cmp r6, #2
	blt _02027AE2
	mov r6, #0
	add r4, r5, #0
_02027B14:
	add r0, r5, #0
	add r1, r6, #0
	bl SavArray_get
	ldr r1, _02027B64 ; =0x00023018
	ldr r1, [r4, r1]
	bl GF_CalcCRC16
	ldr r1, _02027B68 ; =0x00023020
	add r6, r6, #1
	strh r0, [r4, r1]
	add r4, #0x10
	cmp r6, #0x2a
	blt _02027B14
	ldr r0, _02027B6C ; =0x000232C4
	ldr r6, [r5, r0]
	bl sub_02027164
	add r4, r0, #0
	bl sub_0202716C
	add r1, r4, #0
	mul r1, r0
	add r0, r7, r6
	bl GF_CalcCRC16
	ldr r1, _02027B70 ; =0x00023300
	strh r0, [r5, r1]
	add r0, r5, #0
	bl sub_020310A0
	add r0, r5, #0
	bl sub_0202C6FC
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02027B5C: .word 0x000232B4
_02027B60: .word 0x0002330A
_02027B64: .word 0x00023018
_02027B68: .word 0x00023020
_02027B6C: .word 0x000232C4
_02027B70: .word 0x00023300
	thumb_func_end Sav2_LoadDynamicRegion

	thumb_func_start sub_02027B74
sub_02027B74: ; 0x02027B74
	push {r4, r5, r6, lr}
	add r3, r1, #0
	ldr r1, _02027BA8 ; =0x000232B4
	add r5, r0, #0
	add r6, r2, #0
	add r2, r5, r1
	mov r1, #0xc
	mul r1, r3
	add r4, r2, r1
	add r1, r5, #0
	add r1, #0x10
	add r2, r3, #0
	bl sub_020276C0
	add r0, r6, #0
	add r1, r4, #0
	bl sub_020275E0
	ldr r2, [r4, #8]
	ldr r1, [r4, #4]
	add r5, #0x10
	add r1, r5, r1
	sub r2, #0x10
	bl FlashWriteChunkInternal
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02027BA8: .word 0x000232B4
	thumb_func_end sub_02027B74

	thumb_func_start sub_02027BAC
sub_02027BAC: ; 0x02027BAC
	push {r4, r5, r6, lr}
	add r6, r0, #0
	ldr r0, _02027BD8 ; =0x000232B4
	add r3, r6, r0
	mov r0, #0xc
	mul r0, r1
	add r4, r3, r0
	add r0, r2, #0
	add r1, r4, #0
	ldr r5, [r4, #8]
	bl sub_020275E0
	ldr r1, [r4, #4]
	add r0, r5, r0
	add r1, r6, r1
	sub r0, #0x10
	add r1, r1, r5
	mov r2, #0x10
	bl FlashWriteChunkInternal
	pop {r4, r5, r6, pc}
	nop
_02027BD8: .word 0x000232B4
	thumb_func_end sub_02027BAC

	thumb_func_start sub_02027BDC
sub_02027BDC: ; 0x02027BDC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_0202C714
	add r0, r5, #0
	bl sub_02031084
	mov r1, #0
	str r1, [r4, #0x14]
	str r1, [r4, #0x20]
	str r1, [r4]
	str r1, [r4, #0x1c]
	mov r0, #1
	ldr r2, _02027C14 ; =0x00023010
	str r0, [r4]
	ldr r3, [r5, r2]
	str r3, [r4, #0x18]
	ldr r3, [r5, r2]
	add r3, r3, #1
	str r3, [r5, r2]
	str r1, [r4, #4]
	str r1, [r4, #8]
	mov r1, #2
	str r1, [r4, #0xc]
	bl sub_0201A4BC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02027C14: .word 0x00023010
	thumb_func_end sub_02027BDC

	thumb_func_start sub_02027C18
sub_02027C18: ; 0x02027C18
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x14]
	cmp r0, #3
	bhi _02027CE2
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02027C30: ; jump table
	.short _02027C38 - _02027C30 - 2 ; case 0
	.short _02027C5E - _02027C30 - 2 ; case 1
	.short _02027C8E - _02027C30 - 2 ; case 2
	.short _02027CB4 - _02027C30 - 2 ; case 3
_02027C38:
	ldr r0, _02027CE8 ; =0x0002330A
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _02027C44
	mov r2, #1
	b _02027C46
_02027C44:
	mov r2, #0
_02027C46:
	lsl r2, r2, #0x18
	ldr r1, [r4, #8]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl sub_02027B74
	str r0, [r4, #0x10]
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
_02027C5E:
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x1c]
	add r2, sp, #0
	bl WaitFlashWrite
	cmp r0, #0
	beq _02027CE2
	mov r0, #0
	str r0, [r4, #0x1c]
	ldr r0, [sp]
	cmp r0, #0
	bne _02027C7A
	mov r0, #3
	pop {r3, r4, r5, pc}
_02027C7A:
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
	ldr r0, [r4, #8]
	add r1, r0, #1
	ldr r0, [r4, #0xc]
	cmp r1, r0
	bne _02027C8E
	mov r0, #1
	pop {r3, r4, r5, pc}
_02027C8E:
	ldr r0, _02027CE8 ; =0x0002330A
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _02027C9A
	mov r2, #1
	b _02027C9C
_02027C9A:
	mov r2, #0
_02027C9C:
	lsl r2, r2, #0x18
	ldr r1, [r4, #8]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl sub_02027BAC
	str r0, [r4, #0x10]
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
_02027CB4:
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x1c]
	add r2, sp, #0
	bl WaitFlashWrite
	cmp r0, #0
	beq _02027CE2
	mov r2, #0
	str r2, [r4, #0x1c]
	ldr r0, [sp]
	cmp r0, #0
	bne _02027CD0
	mov r0, #3
	pop {r3, r4, r5, pc}
_02027CD0:
	ldr r0, [r4, #8]
	add r1, r0, #1
	str r1, [r4, #8]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	bne _02027CE0
	mov r0, #2
	pop {r3, r4, r5, pc}
_02027CE0:
	str r2, [r4, #0x14]
_02027CE2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02027CE8: .word 0x0002330A
	thumb_func_end sub_02027C18

	thumb_func_start sub_02027CEC
sub_02027CEC: ; 0x02027CEC
	push {r3, r4, r5, lr}
	ldr r3, _02027D58 ; =0x00023304
	add r4, r0, #0
	mov r5, #0
	strh r5, [r4, r3]
	add r3, r3, #2
	strh r5, [r4, r3]
	cmp r2, #3
	bne _02027D0C
	ldr r0, [r1]
	cmp r0, #0
	beq _02027D50
	ldr r1, [r1, #0x18]
	ldr r0, _02027D5C ; =0x00023010
	str r1, [r4, r0]
	b _02027D50
_02027D0C:
	bl sub_02027170
	ldr r1, _02027D60 ; =0x000232F8
	str r0, [r4, r1]
	add r0, r1, #0
	add r0, #0xa
	ldrh r0, [r4, r0]
	add r1, #8
	strh r0, [r4, r1]
	add r0, r4, #0
	bl sub_02027180
	ldr r0, _02027D64 ; =0x0002330A
	ldrh r0, [r4, r0]
	cmp r0, #0
	bne _02027D30
	mov r1, #1
	b _02027D32
_02027D30:
	add r1, r5, #0
_02027D32:
	add r2, r4, r1
	ldr r1, _02027D68 ; =0x00023308
	mov r0, #0
	strb r0, [r2, r1]
	add r1, r1, #2
	ldrh r1, [r4, r1]
	cmp r1, #0
	bne _02027D44
	mov r0, #1
_02027D44:
	ldr r1, _02027D64 ; =0x0002330A
	strh r0, [r4, r1]
	mov r0, #1
	str r0, [r4, #4]
	mov r0, #0
	str r0, [r4, #8]
_02027D50:
	mov r0, #1
	bl sub_0201A4CC
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02027D58: .word 0x00023304
_02027D5C: .word 0x00023010
_02027D60: .word 0x000232F8
_02027D64: .word 0x0002330A
_02027D68: .word 0x00023308
	thumb_func_end sub_02027CEC

	thumb_func_start sub_02027D6C
sub_02027D6C: ; 0x02027D6C
	push {r4, lr}
	add r4, r1, #0
	ldr r1, [r4]
	cmp r1, #0
	beq _02027D7C
	ldr r2, [r4, #0x18]
	ldr r1, _02027DB0 ; =0x00023010
	str r2, [r0, r1]
_02027D7C:
	bl CARD_TryWaitBackupAsync
	cmp r0, #0
	bne _02027D88
	bl CARD_CancelBackupAsync
_02027D88:
	ldr r0, [r4, #0x1c]
	cmp r0, #0
	beq _02027DA6
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl CARD_UnlockBackup
	ldr r0, [r4, #0x10]
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bl OS_ReleaseLockID
	mov r0, #0
	str r0, [r4, #0x1c]
_02027DA6:
	mov r0, #1
	bl sub_0201A4CC
	pop {r4, pc}
	nop
_02027DB0: .word 0x00023010
	thumb_func_end sub_02027D6C

	thumb_func_start sub_02027DB4
sub_02027DB4: ; 0x02027DB4
	push {r3, r4, r5, r6, lr}
	sub sp, #0x24
	add r1, sp, #0
	mov r2, #2
	add r5, r0, #0
	bl sub_02027BDC
	add r6, sp, #0
_02027DC4:
	ldr r0, [sp, #8]
	cmp r0, #1
	bne _02027DD4
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02028968
	b _02027DDC
_02027DD4:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02027C18
_02027DDC:
	add r4, r0, #0
	cmp r4, #0
	beq _02027DC4
	cmp r4, #1
	beq _02027DC4
	add r0, r5, #0
	add r1, sp, #0
	add r2, r4, #0
	bl sub_02027CEC
	add r0, r4, #0
	add sp, #0x24
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02027DB4

	thumb_func_start FlashClobberChunkFooter
FlashClobberChunkFooter: ; 0x02027DF8
	push {r3, r4, r5, lr}
	sub sp, #0x10
	add r4, r2, #0
	ldr r2, _02027E2C ; =0x000232B4
	add r2, r0, r2
	mov r0, #0xc
	mul r0, r1
	add r5, r2, r0
	add r0, sp, #0
	mov r1, #0xff
	mov r2, #0x10
	bl MI_CpuFill8
	add r0, r4, #0
	add r1, r5, #0
	bl sub_020275E0
	ldr r1, [r5, #8]
	mov r2, #0x10
	add r0, r1, r0
	sub r0, #0x10
	add r1, sp, #0
	bl FlashWriteChunk
	add sp, #0x10
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02027E2C: .word 0x000232B4
	thumb_func_end FlashClobberChunkFooter

	thumb_func_start sub_02027E30
sub_02027E30: ; 0x02027E30
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _02027E54 ; =_020F6460
	ldr r4, _02027E58 ; =_020F64C4
	ldr r0, [r0]
	cmp r5, r0
	blt _02027E42
	bl GF_AssertFail
_02027E42:
	lsl r0, r5, #4
	add r0, r4, r0
	ldr r0, [r0, #8]
	blx r0
	mov r1, #3
	add r0, r0, #3
	bic r0, r1
	add r0, r0, #4
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02027E54: .word _020F6460
_02027E58: .word _020F64C4
	thumb_func_end sub_02027E30

	thumb_func_start SaveBlock2_InitSubstructs
SaveBlock2_InitSubstructs: ; 0x02027E5C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	ldr r0, _02027EF4 ; =_020F6460
	ldr r5, _02027EF8 ; =_020F64C4
	ldr r0, [r0]
	mov r4, #0
	str r0, [sp]
	cmp r0, #0x2a
	beq _02027E74
	bl GF_AssertFail
_02027E74:
	ldr r0, [sp]
	mov r7, #0
	cmp r0, #0
	ble _02027EE4
	sub r0, r0, #1
	str r0, [sp, #4]
_02027E80:
	ldr r0, [r5]
	cmp r7, r0
	beq _02027E8A
	bl GF_AssertFail
_02027E8A:
	ldr r0, [r5]
	str r0, [r6]
	add r0, r7, #0
	bl sub_02027E30
	str r0, [r6, #4]
	str r4, [r6, #8]
	mov r0, #0
	strh r0, [r6, #0xc]
	ldr r0, [r5, #4]
	strh r0, [r6, #0xe]
	ldr r0, [r6, #4]
	add r4, r4, r0
	ldr r0, [sp, #4]
	cmp r7, r0
	beq _02027EB2
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x14]
	cmp r1, r0
	beq _02027ED8
_02027EB2:
	ldr r1, [r5, #4]
	ldr r0, [r5, #0x14]
	add r4, #0x10
	cmp r1, r0
	beq _02027ED8
	ldr r0, [sp]
	add r1, r7, #1
	cmp r1, r0
	bge _02027ED8
	lsr r2, r4, #0x1f
	lsl r1, r4, #0x18
	sub r1, r1, r2
	mov r0, #0x18
	ror r1, r0
	add r1, r2, r1
	beq _02027ED8
	add r0, #0xe8
	sub r0, r0, r1
	add r4, r4, r0
_02027ED8:
	ldr r0, [sp]
	add r7, r7, #1
	add r5, #0x10
	add r6, #0x10
	cmp r7, r0
	blt _02027E80
_02027EE4:
	mov r0, #0x23
	lsl r0, r0, #0xc
	cmp r4, r0
	ble _02027EF0
	bl GF_AssertFail
_02027EF0:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02027EF4: .word _020F6460
_02027EF8: .word _020F64C4
	thumb_func_end SaveBlock2_InitSubstructs

	thumb_func_start sub_02027EFC
sub_02027EFC: ; 0x02027EFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	mov r0, #0
	str r0, [sp, #4]
	mov ip, r0
	add r4, r0, #0
	add r3, r0, #0
	ldr r0, _02027FA0 ; =_020F6460
	ldr r6, [sp]
	ldr r7, [r0]
	add r5, r1, #0
_02027F14:
	add r2, r6, #0
	strb r3, [r6]
	mov r0, #0
	str r0, [r6, #8]
	add r2, #8
	b _02027F2C
_02027F20:
	ldr r0, [r5, #4]
	ldr r1, [r2]
	add r5, #0x10
	add r0, r1, r0
	str r0, [r2]
	add r4, r4, #1
_02027F2C:
	ldrh r0, [r5, #0xe]
	cmp r3, r0
	bne _02027F36
	cmp r4, r7
	blt _02027F20
_02027F36:
	ldr r0, [r6, #8]
	add r0, #0x10
	str r0, [r6, #8]
	ldr r0, [sp, #4]
	strb r0, [r6, #1]
	mov r0, ip
	str r0, [r6, #4]
	ldr r1, [r6, #8]
	ldr r0, _02027FA4 ; =0x00000FFF
	add r0, r1, r0
	lsr r0, r0, #0xc
	strb r0, [r6, #2]
	ldrb r1, [r6, #2]
	ldr r0, [sp, #4]
	add r0, r0, r1
	str r0, [sp, #4]
	ldr r0, [r6, #8]
	mov r1, ip
	add r0, r1, r0
	lsr r1, r0, #0x1f
	lsl r2, r0, #0x18
	mov ip, r0
	sub r2, r2, r1
	mov r0, #0x18
	ror r2, r0
	add r1, r1, r2
	beq _02027F76
	add r0, #0xe8
	sub r0, r0, r1
	mov r1, ip
	add r0, r1, r0
	mov ip, r0
_02027F76:
	add r3, r3, #1
	add r6, #0xc
	cmp r3, #2
	blt _02027F14
	ldr r0, [sp]
	ldrb r1, [r0, #0xd]
	ldrb r0, [r0, #0xe]
	add r1, r1, r0
	ldr r0, [sp, #4]
	cmp r0, r1
	beq _02027F90
	bl GF_AssertFail
_02027F90:
	ldr r0, [sp, #4]
	cmp r0, #0x23
	ble _02027F9A
	bl GF_AssertFail
_02027F9A:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02027FA0: .word _020F6460
_02027FA4: .word 0x00000FFF
	thumb_func_end sub_02027EFC

	thumb_func_start Sav2_InitDynamicRegion_Internal
Sav2_InitDynamicRegion_Internal: ; 0x02027FA8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	mov r2, #0x23
	add r5, r1, #0
	mov r0, #0
	add r1, r6, #0
	lsl r2, r2, #0xc
	ldr r4, _02027FF4 ; =_020F64C4
	bl MIi_CpuClearFast
	ldr r0, _02027FF8 ; =_020F6460
	mov r7, #0
	ldr r0, [r0]
	str r0, [sp]
	cmp r0, #0
	ble _02027FEE
_02027FCA:
	ldr r0, [r5, #8]
	ldr r2, [r5, #4]
	str r0, [sp, #4]
	ldr r1, [sp, #4]
	mov r0, #0
	add r1, r6, r1
	bl MIi_CpuClearFast
	ldr r0, [sp, #4]
	ldr r1, [r4, #0xc]
	add r0, r6, r0
	blx r1
	ldr r0, [sp]
	add r7, r7, #1
	add r5, #0x10
	add r4, #0x10
	cmp r7, r0
	blt _02027FCA
_02027FEE:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02027FF4: .word _020F64C4
_02027FF8: .word _020F6460
	thumb_func_end Sav2_InitDynamicRegion_Internal

	thumb_func_start sub_02027FFC
sub_02027FFC: ; 0x02027FFC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r6, r0, #0
	ldr r5, _02028068 ; =_020F6464
	bl sub_020274E8
	cmp r0, #1
	beq _02028064
	ldr r0, _0202806C ; =_020F645C
	mov r7, #0
	ldr r0, [r0]
	str r0, [sp]
	cmp r0, #0
	ble _0202805E
_02028018:
	ldr r2, [r5]
	cmp r2, #0
	beq _02028054
	add r0, r6, #0
	mov r1, #3
	add r3, sp, #4
	bl ReadSaveFileFromFlash
	add r4, r0, #0
	bne _02028030
	bl GF_AssertFail
_02028030:
	ldr r0, [r5, #8]
	blx r0
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0
	bl MI_CpuFill8
	ldr r1, [r5, #0xc]
	add r0, r4, #0
	blx r1
	ldr r1, [r5]
	add r0, r6, #0
	add r2, r4, #0
	bl WriteSaveFileToFlash
	add r0, r4, #0
	bl FreeToHeap
_02028054:
	ldr r0, [sp]
	add r7, r7, #1
	add r5, #0x10
	cmp r7, r0
	blt _02028018
_0202805E:
	add r0, r6, #0
	bl sub_020274F4
_02028064:
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02028068: .word _020F6464
_0202806C: .word _020F645C
	thumb_func_end sub_02027FFC

	thumb_func_start CreateChunkFooter
CreateChunkFooter: ; 0x02028070
	push {r3, r4, r5, lr}
	ldr r5, _02028094 ; =0x20060623
	add r4, r1, r3
	str r5, [r1, r3]
	ldr r5, _02028098 ; =0x000232F4
	ldr r0, [r0, r5]
	add r0, r0, #1
	str r0, [r4, #4]
	str r3, [r4, #8]
	add r3, #0xe
	add r0, r1, #0
	add r1, r3, #0
	strh r2, [r4, #0xc]
	bl GF_CalcCRC16
	strh r0, [r4, #0xe]
	pop {r3, r4, r5, pc}
	nop
_02028094: .word 0x20060623
_02028098: .word 0x000232F4
	thumb_func_end CreateChunkFooter

	thumb_func_start ValidateChunk
ValidateChunk: ; 0x0202809C
	push {r3, r4, r5, lr}
	ldr r5, [r1, r3]
	ldr r0, _020280D8 ; =0x20060623
	add r4, r1, r3
	cmp r5, r0
	beq _020280AC
	mov r0, #0
	pop {r3, r4, r5, pc}
_020280AC:
	ldr r0, [r4, #8]
	cmp r0, r3
	beq _020280B6
	mov r0, #0
	pop {r3, r4, r5, pc}
_020280B6:
	ldrh r0, [r4, #0xc]
	cmp r0, r2
	beq _020280C0
	mov r0, #0
	pop {r3, r4, r5, pc}
_020280C0:
	add r3, #0xe
	add r0, r1, #0
	add r1, r3, #0
	bl GF_CalcCRC16
	ldrh r1, [r4, #0xe]
	cmp r1, r0
	bne _020280D4
	mov r0, #1
	pop {r3, r4, r5, pc}
_020280D4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020280D8: .word 0x20060623
	thumb_func_end ValidateChunk

	thumb_func_start sub_020280DC
sub_020280DC: ; 0x020280DC
	add r0, r0, r1
	ldr r0, [r0, #4]
	bx lr
	.balign 4, 0
	thumb_func_end sub_020280DC

	thumb_func_start WriteSaveFileToFlash
WriteSaveFileToFlash: ; 0x020280E4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r7, r0, #0
	mov r0, #1
	add r5, r1, #0
	add r6, r2, #0
	bl sub_0201A4BC
	ldr r0, _02028224 ; =_020F645C
	ldr r0, [r0]
	cmp r5, r0
	blt _02028100
	bl GF_AssertFail
_02028100:
	ldr r1, _02028228 ; =_020F6464
	lsl r0, r5, #4
	add r4, r1, r0
	ldr r0, [r1, r0]
	cmp r0, r5
	beq _02028110
	bl GF_AssertFail
_02028110:
	ldr r0, [r4, #8]
	blx r0
	str r0, [sp, #4]
	add r0, #0x10
	str r0, [sp, #4]
	ldr r0, _0202822C ; =0x000232F0
	ldr r0, [r7, r0]
	cmp r0, #1
	ldr r0, [r4, #8]
	bne _02028196
	blx r0
	add r3, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl CreateChunkFooter
	ldr r0, [r4, #4]
	ldr r2, [sp, #4]
	lsl r0, r0, #0xc
	add r1, r6, #0
	bl FlashWriteChunk
	str r0, [sp]
	ldr r0, [r4, #8]
	blx r0
	add r3, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ValidateChunk
	cmp r0, #1
	beq _02028158
	bl GF_AssertFail
_02028158:
	ldr r0, [r4, #8]
	blx r0
	add r3, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl CreateChunkFooter
	ldr r0, [r4, #4]
	ldr r2, [sp, #4]
	add r0, #0x40
	lsl r0, r0, #0xc
	add r1, r6, #0
	bl FlashWriteChunk
	ldr r1, [sp]
	orr r0, r1
	str r0, [sp]
	ldr r0, [r4, #8]
	blx r0
	add r3, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ValidateChunk
	cmp r0, #1
	beq _02028206
	bl GF_AssertFail
	b _02028206
_02028196:
	blx r0
	add r3, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl CreateChunkFooter
	ldr r0, [r4, #4]
	ldr r2, [sp, #4]
	add r0, #0x40
	lsl r0, r0, #0xc
	add r1, r6, #0
	bl FlashWriteChunk
	str r0, [sp]
	ldr r0, [r4, #8]
	blx r0
	add r3, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ValidateChunk
	cmp r0, #1
	beq _020281CC
	bl GF_AssertFail
_020281CC:
	ldr r0, [r4, #8]
	blx r0
	add r3, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl CreateChunkFooter
	ldr r0, [r4, #4]
	ldr r2, [sp, #4]
	lsl r0, r0, #0xc
	add r1, r6, #0
	bl FlashWriteChunk
	ldr r1, [sp]
	orr r0, r1
	str r0, [sp]
	ldr r0, [r4, #8]
	blx r0
	add r3, r0, #0
	add r0, r7, #0
	add r1, r6, #0
	add r2, r5, #0
	bl ValidateChunk
	cmp r0, #1
	beq _02028206
	bl GF_AssertFail
_02028206:
	ldr r0, [sp]
	cmp r0, #1
	bne _02028218
	mov r0, #1
	bl sub_0201A4CC
	add sp, #8
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_02028218:
	mov r0, #1
	bl sub_0201A4CC
	mov r0, #3
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02028224: .word _020F645C
_02028228: .word _020F6464
_0202822C: .word 0x000232F0
	thumb_func_end WriteSaveFileToFlash

	thumb_func_start sub_02028230
sub_02028230: ; 0x02028230
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	str r0, [sp, #4]
	mov r0, #1
	add r5, r1, #0
	add r7, r2, #0
	bl sub_0201A4BC
	ldr r0, _02028334 ; =_020F645C
	ldr r0, [r0]
	cmp r5, r0
	blt _0202824C
	bl GF_AssertFail
_0202824C:
	ldr r1, _02028338 ; =_020F6464
	lsl r0, r5, #4
	add r4, r1, r0
	ldr r0, [r1, r0]
	cmp r0, r5
	beq _0202825C
	bl GF_AssertFail
_0202825C:
	ldr r0, [r4, #8]
	blx r0
	str r0, [sp, #8]
	add r0, #0x10
	str r0, [sp, #8]
	add r0, sp, #0xc
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, sp, #0x14
	add r3, sp, #0x10
	bl sub_020286B4
_02028276:
	ldr r0, [sp, #0x14]
	bl PRandom
	add r6, r0, #0
	mov r0, #0
	mvn r0, r0
	cmp r6, r0
	beq _02028276
	add r0, sp, #0xc
	ldrb r1, [r0]
	mov r0, #1
	add r2, r6, #0
	eor r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #4]
	ldr r3, [sp, #0x14]
	add r1, r5, #0
	bl sub_020286D4
	str r6, [r7]
	add r0, sp, #0xc
	ldrb r0, [r0]
	cmp r0, #1
	ldr r0, [r4, #8]
	bne _020282E2
	blx r0
	add r3, r0, #0
	ldr r0, [sp, #4]
	add r1, r7, #0
	add r2, r5, #0
	bl CreateChunkFooter
	ldr r0, [r4, #4]
	ldr r2, [sp, #8]
	lsl r0, r0, #0xc
	add r1, r7, #0
	bl FlashWriteChunk
	add r6, r0, #0
	ldr r0, [r4, #8]
	blx r0
	add r3, r0, #0
	ldr r0, [sp, #4]
	add r1, r7, #0
	add r2, r5, #0
	bl ValidateChunk
	cmp r0, #1
	beq _02028318
	bl GF_AssertFail
	b _02028318
_020282E2:
	blx r0
	add r3, r0, #0
	ldr r0, [sp, #4]
	add r1, r7, #0
	add r2, r5, #0
	bl CreateChunkFooter
	ldr r0, [r4, #4]
	ldr r2, [sp, #8]
	add r0, #0x40
	lsl r0, r0, #0xc
	add r1, r7, #0
	bl FlashWriteChunk
	add r6, r0, #0
	ldr r0, [r4, #8]
	blx r0
	add r3, r0, #0
	ldr r0, [sp, #4]
	add r1, r7, #0
	add r2, r5, #0
	bl ValidateChunk
	cmp r0, #1
	beq _02028318
	bl GF_AssertFail
_02028318:
	cmp r6, #1
	bne _02028328
	mov r0, #1
	bl sub_0201A4CC
	add sp, #0x18
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_02028328:
	mov r0, #1
	bl sub_0201A4CC
	mov r0, #3
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02028334: .word _020F645C
_02028338: .word _020F6464
	thumb_func_end sub_02028230

	thumb_func_start ReadSaveFileFromFlash
ReadSaveFileFromFlash: ; 0x0202833C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, _02028498 ; =_020F645C
	add r7, r2, #0
	ldr r0, [r0]
	add r6, r1, #0
	str r3, [sp]
	cmp r7, r0
	blt _02028354
	bl GF_AssertFail
_02028354:
	ldr r1, _0202849C ; =_020F6464
	lsl r0, r7, #4
	add r4, r1, r0
	ldr r0, [r1, r0]
	cmp r0, r7
	beq _02028364
	bl GF_AssertFail
_02028364:
	ldr r0, [r4, #8]
	blx r0
	str r0, [sp, #0x10]
	add r0, #0x10
	str r0, [sp, #0x10]
	ldr r1, [sp, #0x10]
	add r0, r6, #0
	bl AllocFromHeap
	add r6, r0, #0
	ldr r0, [r4, #4]
	ldr r2, [sp, #0x10]
	lsl r0, r0, #0xc
	add r1, r6, #0
	bl FlashLoadChunk
	ldr r0, [r4, #8]
	blx r0
	add r3, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ValidateChunk
	str r0, [sp, #0xc]
	ldr r0, [r4, #8]
	blx r0
	add r1, r0, #0
	add r0, r6, #0
	bl sub_020280DC
	str r0, [sp, #8]
	ldr r0, [r4, #4]
	ldr r2, [sp, #0x10]
	add r0, #0x40
	lsl r0, r0, #0xc
	add r1, r6, #0
	bl FlashLoadChunk
	ldr r0, [r4, #8]
	blx r0
	add r3, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	bl ValidateChunk
	add r7, r0, #0
	ldr r0, [r4, #8]
	blx r0
	add r1, r0, #0
	add r0, r6, #0
	bl sub_020280DC
	str r0, [sp, #4]
	ldr r0, [sp]
	mov r1, #1
	str r1, [r0]
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _02028400
	cmp r7, #0
	bne _02028400
	ldr r0, _020284A0 ; =0x000232F0
	mov r1, #0
	str r1, [r5, r0]
	add r1, r0, #4
	ldr r0, [sp, #8]
	ldr r2, [sp, #0x10]
	str r0, [r5, r1]
	ldr r0, [r4, #4]
	add r1, r6, #0
	lsl r0, r0, #0xc
	bl FlashLoadChunk
	add sp, #0x14
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02028400:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0202842A
	cmp r7, #1
	bne _0202842A
	ldr r0, _020284A0 ; =0x000232F0
	mov r1, #1
	str r1, [r5, r0]
	add r1, r0, #4
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x10]
	str r0, [r5, r1]
	ldr r0, [r4, #4]
	add r1, r6, #0
	add r0, #0x40
	lsl r0, r0, #0xc
	bl FlashLoadChunk
	add sp, #0x14
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_0202842A:
	ldr r0, [sp, #0xc]
	cmp r0, #1
	bne _02028480
	cmp r7, #1
	bne _02028480
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	bl sub_0202770C
	mov r1, #0
	mvn r1, r1
	cmp r0, r1
	ldr r0, _020284A0 ; =0x000232F0
	beq _02028462
	mov r1, #0
	str r1, [r5, r0]
	add r1, r0, #4
	ldr r0, [sp, #8]
	ldr r2, [sp, #0x10]
	str r0, [r5, r1]
	ldr r0, [r4, #4]
	add r1, r6, #0
	lsl r0, r0, #0xc
	bl FlashLoadChunk
	add sp, #0x14
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02028462:
	mov r1, #1
	str r1, [r5, r0]
	add r1, r0, #4
	ldr r0, [sp, #4]
	ldr r2, [sp, #0x10]
	str r0, [r5, r1]
	ldr r0, [r4, #4]
	add r1, r6, #0
	add r0, #0x40
	lsl r0, r0, #0xc
	bl FlashLoadChunk
	add sp, #0x14
	add r0, r6, #0
	pop {r4, r5, r6, r7, pc}
_02028480:
	ldr r0, [sp]
	mov r1, #2
	str r1, [r0]
	ldr r0, _020284A0 ; =0x000232F0
	mov r1, #0
	str r1, [r5, r0]
	add r0, r0, #4
	str r1, [r5, r0]
	add r0, r6, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_02028498: .word _020F645C
_0202849C: .word _020F6464
_020284A0: .word 0x000232F0
	thumb_func_end ReadSaveFileFromFlash

	thumb_func_start sub_020284A4
sub_020284A4: ; 0x020284A4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x30
	str r0, [sp, #4]
	add r5, r1, #0
	add r6, r2, #0
	str r3, [sp, #8]
	ldr r7, [sp, #0x48]
	bl Sav2_Misc_get
	str r0, [sp, #0xc]
	ldr r0, _020286AC ; =_020F645C
	ldr r0, [r0]
	cmp r6, r0
	blt _020284C4
	bl GF_AssertFail
_020284C4:
	cmp r6, #0
	bne _020284CC
	bl GF_AssertFail
_020284CC:
	ldr r1, _020286B0 ; =_020F6464
	lsl r0, r6, #4
	add r4, r1, r0
	ldr r0, [r1, r0]
	cmp r0, r6
	beq _020284DC
	bl GF_AssertFail
_020284DC:
	ldr r0, [r4, #8]
	blx r0
	str r0, [sp, #0x18]
	add r0, #0x10
	str r0, [sp, #0x18]
	ldr r1, [sp, #0x18]
	add r0, r5, #0
	bl AllocFromHeap
	add r5, r0, #0
	add r0, sp, #0x1c
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r6, #0
	add r2, sp, #0x24
	add r3, sp, #0x20
	bl sub_020286B4
	ldr r0, [r4, #4]
	ldr r2, [sp, #0x18]
	lsl r0, r0, #0xc
	add r1, r5, #0
	bl FlashLoadChunk
	ldr r0, [r4, #8]
	blx r0
	add r3, r0, #0
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	bl ValidateChunk
	str r0, [sp, #0x14]
	add r0, r5, #0
	add r1, sp, #0x2c
	mov r2, #4
	bl MI_CpuCopy8
	ldr r0, [r4, #4]
	ldr r2, [sp, #0x18]
	add r0, #0x40
	lsl r0, r0, #0xc
	add r1, r5, #0
	bl FlashLoadChunk
	ldr r0, [r4, #8]
	blx r0
	add r3, r0, #0
	ldr r0, [sp, #4]
	add r1, r5, #0
	add r2, r6, #0
	bl ValidateChunk
	str r0, [sp, #0x10]
	add r0, r5, #0
	add r1, sp, #0x28
	mov r2, #4
	bl MI_CpuCopy8
	ldr r0, [sp, #8]
	mov r1, #1
	str r1, [r0]
	mov r0, #0
	ldr r1, [sp, #0x14]
	str r0, [r7]
	cmp r1, #1
	bne _0202859C
	ldr r1, [sp, #0x10]
	cmp r1, #0
	bne _0202859C
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x2c]
	cmp r2, r1
	bne _0202859C
	add r1, sp, #0x1c
	ldrb r1, [r1]
	cmp r1, #1
	bne _0202858A
	ldr r2, [sp, #0x20]
	add r1, r6, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	add r3, r2, #0
	bl sub_020286D4
	mov r0, #1
	str r0, [r7]
_0202858A:
	ldr r0, [r4, #4]
	ldr r2, [sp, #0x18]
	lsl r0, r0, #0xc
	add r1, r5, #0
	bl FlashLoadChunk
	add sp, #0x30
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202859C:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _020285E0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _020285E0
	ldr r1, [sp, #0x24]
	ldr r0, [sp, #0x28]
	cmp r1, r0
	bne _020285E0
	add r0, sp, #0x1c
	ldrb r0, [r0]
	cmp r0, #0
	bne _020285CC
	ldr r2, [sp, #0x20]
	mov r0, #1
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r6, #0
	add r3, r2, #0
	bl sub_020286D4
	mov r0, #1
	str r0, [r7]
_020285CC:
	ldr r0, [r4, #4]
	ldr r2, [sp, #0x18]
	add r0, #0x40
	lsl r0, r0, #0xc
	add r1, r5, #0
	bl FlashLoadChunk
	add sp, #0x30
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_020285E0:
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bne _02028690
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bne _02028690
	add r0, sp, #0x1c
	ldrb r0, [r0]
	cmp r0, #0
	bne _02028642
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x2c]
	cmp r2, r1
	bne _0202860E
	ldr r0, [r4, #4]
	ldr r2, [sp, #0x18]
	lsl r0, r0, #0xc
	add r1, r5, #0
	bl FlashLoadChunk
	add sp, #0x30
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202860E:
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x28]
	cmp r2, r1
	bne _02028690
	mov r1, #1
	eor r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r6, #0
	add r3, r2, #0
	bl sub_020286D4
	mov r0, #1
	str r0, [r7]
	ldr r0, [r4, #4]
	ldr r2, [sp, #0x18]
	add r0, #0x40
	lsl r0, r0, #0xc
	add r1, r5, #0
	bl FlashLoadChunk
	add sp, #0x30
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_02028642:
	ldr r2, [sp, #0x24]
	ldr r1, [sp, #0x28]
	cmp r2, r1
	bne _0202865E
	ldr r0, [r4, #4]
	ldr r2, [sp, #0x18]
	add r0, #0x40
	lsl r0, r0, #0xc
	add r1, r5, #0
	bl FlashLoadChunk
	add sp, #0x30
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_0202865E:
	ldr r2, [sp, #0x20]
	ldr r1, [sp, #0x2c]
	cmp r2, r1
	bne _02028690
	mov r1, #1
	eor r0, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #4]
	add r1, r6, #0
	add r3, r2, #0
	bl sub_020286D4
	mov r0, #1
	str r0, [r7]
	ldr r0, [r4, #4]
	ldr r2, [sp, #0x18]
	lsl r0, r0, #0xc
	add r1, r5, #0
	bl FlashLoadChunk
	add sp, #0x30
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
_02028690:
	ldr r0, [sp, #8]
	mov r1, #2
	str r1, [r0]
	mov r2, #0
	str r2, [sp]
	sub r2, r2, #1
	ldr r0, [sp, #0xc]
	ldr r1, [r4]
	add r3, r2, #0
	bl sub_0202AC60
	add r0, r5, #0
	add sp, #0x30
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020286AC: .word _020F645C
_020286B0: .word _020F6464
	thumb_func_end sub_020284A4

	thumb_func_start sub_020286B4
sub_020286B4: ; 0x020286B4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl Sav2_Misc_get
	ldr r1, [sp, #0x18]
	add r2, r4, #0
	str r1, [sp]
	add r1, r5, #0
	add r3, r6, #0
	bl sub_0202AC38
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	thumb_func_end sub_020286B4

	thumb_func_start sub_020286D4
sub_020286D4: ; 0x020286D4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r1, #0
	add r4, r2, #0
	add r6, r3, #0
	bl Sav2_Misc_get
	add r1, sp, #8
	ldrb r1, [r1, #0x10]
	add r2, r4, #0
	add r3, r6, #0
	str r1, [sp]
	add r1, r5, #0
	bl sub_0202AC60
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020286D4

	thumb_func_start SaveDetectFlash
SaveDetectFlash: ; 0x020286F8
	push {r3, r4, r5, lr}
	bl OS_GetLockID
	add r4, r0, #0
	mov r0, #2
	mvn r0, r0
	cmp r4, r0
	bne _0202870C
	bl GF_AssertFail
_0202870C:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl CARD_LockBackup
	ldr r0, _02028750 ; =0x00FF1302
	bl CARD_IdentifyBackup
	cmp r0, #0
	beq _02028722
	ldr r5, _02028750 ; =0x00FF1302
	b _02028732
_02028722:
	ldr r0, _02028754 ; =0x00001302
	bl CARD_IdentifyBackup
	cmp r0, #0
	beq _02028730
	ldr r5, _02028754 ; =0x00001302
	b _02028732
_02028730:
	mov r5, #0
_02028732:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl CARD_UnlockBackup
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl OS_ReleaseLockID
	cmp r5, #0
	beq _0202874A
	mov r0, #1
	pop {r3, r4, r5, pc}
_0202874A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02028750: .word 0x00FF1302
_02028754: .word 0x00001302
	thumb_func_end SaveDetectFlash

	thumb_func_start FlashWriteChunk
FlashWriteChunk: ; 0x02028758
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	bl FlashWriteChunkInternal
	add r5, r0, #0
	mov r4, #1
	add r6, sp, #0
_02028766:
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	bl WaitFlashWrite
	cmp r0, #0
	beq _02028766
	ldr r0, [sp]
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end FlashWriteChunk

	thumb_func_start FlashLoadChunk
FlashLoadChunk: ; 0x0202877C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl OS_GetLockID
	add r4, r0, #0
	mov r0, #2
	mvn r0, r0
	cmp r4, r0
	bne _02028798
	bl GF_AssertFail
_02028798:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl CARD_LockBackup
	mov r3, #0
	str r3, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #6
	str r0, [sp, #8]
	str r1, [sp, #0xc]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r7, #0
	str r3, [sp, #0x10]
	bl CARDi_RequestStreamCommand
	bl CARD_WaitBackupAsync
	add r5, r0, #0
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl CARD_UnlockBackup
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl OS_ReleaseLockID
	cmp r5, #0
	bne _020287E2
	ldr r0, _020287E8 ; =_021D2228
	ldr r0, [r0]
	bl FreeToHeap
	mov r0, #1
	bl ShowSaveDataReadError
_020287E2:
	add r0, r5, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_020287E8: .word _021D2228
	thumb_func_end FlashLoadChunk

	thumb_func_start FlashWriteCommandCallback
FlashWriteCommandCallback: ; 0x020287EC
	ldr r0, _020287F4 ; =_021D2228
	mov r1, #1
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
_020287F4: .word _021D2228
	thumb_func_end FlashWriteCommandCallback

	thumb_func_start FlashWriteChunkInternal
FlashWriteChunkInternal: ; 0x020287F8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r6, r1, #0
	add r7, r2, #0
	bl OS_GetLockID
	add r4, r0, #0
	mov r0, #2
	mvn r0, r0
	cmp r4, r0
	bne _02028814
	bl GF_AssertFail
_02028814:
	lsl r0, r4, #0x10
	lsr r0, r0, #0x10
	bl CARD_LockBackup
	mov r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	mov r1, #6
	str r1, [sp, #8]
	mov r1, #1
	str r1, [sp, #0xc]
	add r1, sp, #0x14
	mov r2, #4
	add r3, r0, #0
	str r0, [sp, #0x10]
	bl CARDi_RequestStreamCommand
	cmp r0, #0
	bne _02028842
	add r0, r4, #0
	mov r1, #1
	bl SaveErrorHandling
_02028842:
	ldr r0, _0202886C ; =_021D2228
	mov r1, #0
	str r1, [r0, #4]
	str r1, [sp]
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #7
	str r0, [sp, #8]
	mov r0, #0xa
	str r0, [sp, #0xc]
	mov r0, #2
	str r0, [sp, #0x10]
	ldr r3, _02028870 ; =FlashWriteCommandCallback
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl CARDi_RequestStreamCommand
	add r0, r4, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0202886C: .word _021D2228
_02028870: .word FlashWriteCommandCallback
	thumb_func_end FlashWriteChunkInternal

	thumb_func_start WaitFlashWrite
WaitFlashWrite: ; 0x02028874
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, _020288D0 ; =_021D2228
	add r4, r2, #0
	ldr r0, [r0, #4]
	cmp r0, #1
	bne _020288CC
	cmp r1, #0
	bne _0202888A
	mov r0, #1
	pop {r3, r4, r5, pc}
_0202888A:
	bl CARD_GetResultCode
	cmp r0, #0
	beq _0202889C
	cmp r0, #4
	beq _020288A2
	cmp r0, #6
	beq _020288AC
	b _020288A2
_0202889C:
	mov r0, #1
	str r0, [r4]
	b _020288B8
_020288A2:
	mov r1, #0
	add r0, r5, #0
	str r1, [r4]
	bl SaveErrorHandling
_020288AC:
	mov r0, #0
	str r0, [r4]
	add r0, r5, #0
	mov r1, #1
	bl SaveErrorHandling
_020288B8:
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl CARD_UnlockBackup
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl OS_ReleaseLockID
	mov r0, #1
	pop {r3, r4, r5, pc}
_020288CC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020288D0: .word _021D2228
	thumb_func_end WaitFlashWrite

	thumb_func_start SaveErrorHandling
SaveErrorHandling: ; 0x020288D4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	add r4, r1, #0
	bl CARD_UnlockBackup
	lsl r0, r5, #0x10
	lsr r0, r0, #0x10
	bl OS_ReleaseLockID
	ldr r0, _020288FC ; =_021D2228
	ldr r0, [r0]
	bl FreeToHeap
	mov r0, #1
	add r1, r4, #0
	bl ShowSaveDataWriteError
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020288FC: .word _021D2228
	thumb_func_end SaveErrorHandling

	thumb_func_start sub_02028900
sub_02028900: ; 0x02028900
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020272B0
	add r1, r5, #0
	bl SavArray_get
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02027E30
	sub r5, r0, #4
	add r0, r4, #0
	add r1, r5, #0
	bl GF_CalcCRC16
	lsr r1, r5, #0x1f
	add r1, r5, r1
	asr r1, r1, #1
	lsl r1, r1, #1
	ldrh r1, [r4, r1]
	cmp r0, r1
	bne _02028932
	mov r0, #1
	pop {r3, r4, r5, pc}
_02028932:
	bl GF_AssertFail
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02028900

	thumb_func_start sub_0202893C
sub_0202893C: ; 0x0202893C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl sub_020272B0
	add r1, r5, #0
	bl SavArray_get
	add r4, r0, #0
	add r0, r5, #0
	bl sub_02027E30
	sub r5, r0, #4
	add r0, r4, #0
	add r1, r5, #0
	bl GF_CalcCRC16
	lsr r1, r5, #0x1f
	add r1, r5, r1
	asr r1, r1, #1
	lsl r1, r1, #1
	strh r0, [r4, r1]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0202893C

	thumb_func_start sub_02028968
sub_02028968: ; 0x02028968
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	ldr r1, [r4, #0x14]
	add r6, r0, #0
	cmp r1, #3
	bls _02028976
	b _02028A9C
_02028976:
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02028982: ; jump table
	.short _0202898A - _02028982 - 2 ; case 0
	.short _02028A20 - _02028982 - 2 ; case 1
	.short _02028A48 - _02028982 - 2 ; case 2
	.short _02028A6E - _02028982 - 2 ; case 3
_0202898A:
	bl sub_02028C70
	ldr r1, _02028AA0 ; =0x000232FC
	str r0, [r6, r1]
	ldr r0, [r6, r1]
	bl sub_02028C9C
	ldr r1, _02028AA4 ; =0x00023304
	mov r2, #0
	strh r0, [r6, r1]
	add r0, r1, #2
	strh r2, [r6, r0]
	bl sub_02027164
	add r5, r0, #0
	bl sub_0202716C
	add r7, r5, #0
	mul r7, r0
	add r0, r6, #0
	mov r1, #0x29
	bl SavArray_get
	add r1, r7, #0
	bl GF_CalcCRC16
	ldr r1, _02028AA8 ; =0x00023302
	strh r0, [r6, r1]
	add r0, r1, #2
	ldrh r0, [r6, r0]
	cmp r0, #0
	bne _020289FE
	sub r0, r1, #2
	ldrh r2, [r6, r1]
	ldrh r0, [r6, r0]
	cmp r2, r0
	beq _020289D8
	bl GF_AssertFail
_020289D8:
	add r0, r6, #0
	bl sub_020271A0
	ldr r0, _02028AA8 ; =0x00023302
	ldrh r1, [r6, r0]
	sub r0, r0, #2
	ldrh r0, [r6, r0]
	cmp r1, r0
	beq _020289FE
	bl sub_0202716C
	ldr r1, _02028AA4 ; =0x00023304
	strh r0, [r6, r1]
	ldr r0, _02028AAC ; =0x0003FFFF
	sub r1, #8
	str r0, [r6, r1]
	add r0, r6, #0
	bl sub_02027190
_020289FE:
	mov r0, #0
	str r0, [r4, #0x20]
	add r5, r6, #0
	add r5, #0x10
	ldr r2, [r4, #8]
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020276C0
	ldr r2, [r4, #8]
	add r0, r6, #0
	add r1, r5, #0
	bl sub_020275F4
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
_02028A20:
	add r0, r6, #0
	add r1, r4, #0
	bl sub_02028AB4
	cmp r0, #0
	bne _02028A30
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_02028A30:
	cmp r0, #1
	bne _02028A9C
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
	ldr r0, [r4, #8]
	add r1, r0, #1
	ldr r0, [r4, #0xc]
	cmp r1, r0
	bne _02028A9C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02028A48:
	ldr r0, _02028AB0 ; =0x0002330A
	ldrh r0, [r6, r0]
	cmp r0, #0
	bne _02028A54
	mov r2, #1
	b _02028A56
_02028A54:
	mov r2, #0
_02028A56:
	lsl r2, r2, #0x18
	ldr r1, [r4, #8]
	add r0, r6, #0
	lsr r2, r2, #0x18
	bl sub_02027BAC
	str r0, [r4, #0x10]
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x14]
	add r0, r0, #1
	str r0, [r4, #0x14]
_02028A6E:
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x1c]
	add r2, sp, #0
	bl WaitFlashWrite
	cmp r0, #0
	beq _02028A9C
	mov r2, #0
	str r2, [r4, #0x1c]
	ldr r0, [sp]
	cmp r0, #0
	bne _02028A8A
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
_02028A8A:
	ldr r0, [r4, #8]
	add r1, r0, #1
	str r1, [r4, #8]
	ldr r0, [r4, #0xc]
	cmp r1, r0
	bne _02028A9A
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
_02028A9A:
	str r2, [r4, #0x14]
_02028A9C:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02028AA0: .word 0x000232FC
_02028AA4: .word 0x00023304
_02028AA8: .word 0x00023302
_02028AAC: .word 0x0003FFFF
_02028AB0: .word 0x0002330A
	thumb_func_end sub_02028968

	thumb_func_start sub_02028AB4
sub_02028AB4: ; 0x02028AB4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x20]
	cmp r0, #4
	bhi _02028B94
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02028ACE: ; jump table
	.short _02028AD8 - _02028ACE - 2 ; case 0
	.short _02028AF0 - _02028ACE - 2 ; case 1
	.short _02028B20 - _02028ACE - 2 ; case 2
	.short _02028B44 - _02028ACE - 2 ; case 3
	.short _02028B74 - _02028ACE - 2 ; case 4
_02028AD8:
	ldr r1, _02028B9C ; =0x00023306
	ldrh r2, [r5, r1]
	sub r1, r1, #2
	ldrh r1, [r5, r1]
	cmp r2, r1
	blo _02028AEA
	mov r0, #3
	str r0, [r4, #0x20]
	b _02028B94
_02028AEA:
	add r0, r0, #1
	str r0, [r4, #0x20]
	b _02028B94
_02028AF0:
	ldr r0, _02028BA0 ; =0x0002330A
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _02028AFC
	mov r2, #1
	b _02028AFE
_02028AFC:
	mov r2, #0
_02028AFE:
	ldr r1, _02028BA4 ; =0x000232B4
	ldr r6, [r4, #8]
	mov r3, #0xc
	lsl r2, r2, #0x18
	add r1, r5, r1
	mul r3, r6
	add r0, r5, #0
	add r1, r1, r3
	lsr r2, r2, #0x18
	bl sub_02028BA8
	str r0, [r4, #0x10]
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x20]
	add r0, r0, #1
	str r0, [r4, #0x20]
_02028B20:
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x1c]
	add r2, sp, #0
	bl WaitFlashWrite
	cmp r0, #0
	beq _02028B94
	mov r0, #0
	str r0, [r4, #0x1c]
	ldr r1, [sp]
	cmp r1, #0
	beq _02028B96
	ldr r1, _02028B9C ; =0x00023306
	ldrh r2, [r5, r1]
	add r2, r2, #1
	strh r2, [r5, r1]
	str r0, [r4, #0x20]
	b _02028B94
_02028B44:
	ldr r0, _02028BA0 ; =0x0002330A
	ldrh r0, [r5, r0]
	cmp r0, #0
	bne _02028B50
	mov r2, #1
	b _02028B52
_02028B50:
	mov r2, #0
_02028B52:
	ldr r1, _02028BA4 ; =0x000232B4
	ldr r3, [r4, #8]
	add r0, r5, #0
	add r5, r5, r1
	mov r1, #0xc
	mul r1, r3
	lsl r2, r2, #0x18
	add r1, r5, r1
	lsr r2, r2, #0x18
	bl sub_02028BF8
	str r0, [r4, #0x10]
	mov r0, #1
	str r0, [r4, #0x1c]
	ldr r0, [r4, #0x20]
	add r0, r0, #1
	str r0, [r4, #0x20]
_02028B74:
	ldr r0, [r4, #0x10]
	ldr r1, [r4, #0x1c]
	add r2, sp, #0
	bl WaitFlashWrite
	cmp r0, #0
	beq _02028B94
	mov r0, #0
	str r0, [r4, #0x1c]
	str r0, [r4, #0x20]
	ldr r1, [sp]
	cmp r1, #0
	beq _02028B96
	add sp, #4
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02028B94:
	mov r0, #2
_02028B96:
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_02028B9C: .word 0x00023306
_02028BA0: .word 0x0002330A
_02028BA4: .word 0x000232B4
	thumb_func_end sub_02028AB4

	thumb_func_start sub_02028BA8
sub_02028BA8: ; 0x02028BA8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r7, r2, #0
	add r5, r0, #0
	bl sub_02027164
	add r6, r0, #0
	add r0, r7, #0
	add r1, r4, #0
	bl sub_020275E0
	ldr r1, _02028BF4 ; =0x000232FC
	add r7, r0, #0
	ldr r0, [r5, r1]
	add r1, #0xa
	ldrh r1, [r5, r1]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_02028CD4
	str r0, [sp]
	cmp r0, #0xff
	bne _02028BDA
	bl GF_AssertFail
_02028BDA:
	ldr r0, [sp]
	add r1, r6, #0
	mul r1, r0
	ldr r2, [r4, #4]
	add r5, #0x10
	add r2, r5, r2
	add r0, r7, r1
	add r1, r2, r1
	add r2, r6, #0
	bl FlashWriteChunkInternal
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02028BF4: .word 0x000232FC
	thumb_func_end sub_02028BA8

	thumb_func_start sub_02028BF8
sub_02028BF8: ; 0x02028BF8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	add r5, r1, #0
	add r7, r2, #0
	bl sub_02027164
	add r4, r0, #0
	bl sub_0202716C
	add r6, r4, #0
	mul r6, r0
	add r0, r7, #0
	add r1, r5, #0
	bl sub_020275E0
	ldr r1, [sp]
	str r0, [sp, #4]
	ldr r0, [r5, #4]
	add r1, #0x10
	ldr r4, [r5, #8]
	add r7, r1, r0
	sub r4, #0x10
	bne _02028C2C
	bl GF_AssertFail
_02028C2C:
	ldr r0, [sp]
	mov r2, #1
	str r0, [sp, #8]
	add r0, #0x10
	str r0, [sp, #8]
	ldr r0, [r5, #4]
	ldr r1, [sp, #8]
	str r0, [sp, #0xc]
	ldr r0, [sp]
	bl sub_020275F4
	str r0, [sp, #0x10]
	ldr r2, [sp, #8]
	ldr r1, [sp, #0xc]
	ldr r0, [sp]
	add r1, r2, r1
	ldr r2, [r5, #8]
	bl sub_020275D0
	ldr r1, [sp, #0x10]
	ldrh r1, [r1, #0xe]
	cmp r0, r1
	beq _02028C5E
	bl GF_AssertFail
_02028C5E:
	ldr r0, [sp, #4]
	add r1, r7, r6
	add r0, r0, r6
	sub r2, r4, r6
	bl FlashWriteChunkInternal
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02028BF8

	thumb_func_start sub_02028C70
sub_02028C70: ; 0x02028C70
	push {r4, lr}
	add r4, r0, #0
	bl sub_02027170
	ldr r1, _02028C94 ; =0x000232F8
	ldr r2, [r4, r1]
	orr r0, r2
	add r2, r1, #0
	add r2, #0x10
	ldrb r2, [r4, r2]
	cmp r2, #0
	bne _02028C90
	add r1, #0x11
	ldrb r1, [r4, r1]
	cmp r1, #0
	beq _02028C92
_02028C90:
	ldr r0, _02028C98 ; =0x0003FFFF
_02028C92:
	pop {r4, pc}
	.balign 4, 0
_02028C94: .word 0x000232F8
_02028C98: .word 0x0003FFFF
	thumb_func_end sub_02028C70

	thumb_func_start sub_02028C9C
sub_02028C9C: ; 0x02028C9C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r4, #0
	bl sub_0202716C
	add r1, r4, #0
	cmp r0, #0
	bls _02028CCC
	ldr r2, _02028CD0 ; =0x0003FFFF
	mov r6, #1
_02028CB0:
	add r3, r5, #0
	tst r3, r6
	beq _02028CBC
	add r3, r4, #1
	lsl r3, r3, #0x18
	lsr r4, r3, #0x18
_02028CBC:
	add r1, r1, #1
	lsr r3, r5, #1
	lsl r1, r1, #0x18
	add r5, r3, #0
	lsr r1, r1, #0x18
	and r5, r2
	cmp r1, r0
	blo _02028CB0
_02028CCC:
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02028CD0: .word 0x0003FFFF
	thumb_func_end sub_02028C9C

	thumb_func_start sub_02028CD4
sub_02028CD4: ; 0x02028CD4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r4, #0
	bl sub_0202716C
	add r2, r4, #0
	cmp r0, #0
	bls _02028D0C
	ldr r3, _02028D10 ; =0x0003FFFF
	mov r1, #1
_02028CEA:
	add r7, r5, #0
	tst r7, r1
	beq _02028CFE
	cmp r4, r6
	bne _02028CF8
	add r0, r2, #0
	pop {r3, r4, r5, r6, r7, pc}
_02028CF8:
	add r4, r4, #1
	lsl r4, r4, #0x18
	lsr r4, r4, #0x18
_02028CFE:
	add r2, r2, #1
	lsl r2, r2, #0x18
	lsr r5, r5, #1
	lsr r2, r2, #0x18
	and r5, r3
	cmp r2, r0
	blo _02028CEA
_02028D0C:
	mov r0, #0xff
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02028D10: .word 0x0003FFFF
	thumb_func_end sub_02028CD4
