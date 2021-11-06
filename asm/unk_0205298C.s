	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FC578:
	.byte 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
_020FC588:
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	.byte 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00
_020FC5A4:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00
	.byte 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00

	.text

	thumb_func_start sub_0205298C
sub_0205298C: ; 0x0205298C
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r6, r0, #0
	bl sub_0205064C
	add r5, r0, #0
	add r0, r6, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #5
	bhi _02052A42
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_020529B2: ; jump table
	.short _020529BE - _020529B2 - 2 ; case 0
	.short _020529DE - _020529B2 - 2 ; case 1
	.short _020529EE - _020529B2 - 2 ; case 2
	.short _02052A02 - _020529B2 - 2 ; case 3
	.short _02052A10 - _020529B2 - 2 ; case 4
	.short _02052A34 - _020529B2 - 2 ; case 5
_020529BE:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0206DB58
	add r0, r5, #0
	bl sub_02067BD0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	bl HealParty
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052A42
_020529DE:
	mov r0, #0
	mov r1, #0x14
	bl GF_SndStartFadeOutBGM
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052A42
_020529EE:
	bl GF_SndGetFadeTimer
	cmp r0, #0
	bne _02052A42
	bl sub_02054F14
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052A42
_02052A02:
	add r0, r6, #0
	bl sub_020552A4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052A42
_02052A10:
	mov r0, #8
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x20
	str r0, [sp, #8]
	ldr r3, _02052A48 ; =0x00007FFF
	mov r0, #0
	add r2, r1, #0
	bl sub_0200FA24
	ldr r0, _02052A4C ; =0x04000050
	mov r1, #0
	strh r1, [r0]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052A42
_02052A34:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02052A42
	add sp, #0xc
	mov r0, #1
	pop {r3, r4, r5, r6, pc}
_02052A42:
	mov r0, #0
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02052A48: .word 0x00007FFF
_02052A4C: .word 0x04000050
	thumb_func_end sub_0205298C

	thumb_func_start sub_02052A50
sub_02052A50: ; 0x02052A50
	push {r3, r4, r5, r6, lr}
	sub sp, #0x14
	add r5, r0, #0
	ldr r0, [r5, #0xc]
	add r6, r1, #0
	mov r1, #0xb
	add r2, sp, #0
	bl LoadHallOfFame
	add r4, r0, #0
	ldr r0, [sp]
	cmp r0, #1
	bne _02052A6E
	cmp r6, #0
	bne _02052A74
_02052A6E:
	add r0, r4, #0
	bl Sav2_HOF_init
_02052A74:
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r6, r0, #0
	add r0, sp, #4
	bl GF_RTC_CopyDate
	add r0, r4, #0
	add r1, r6, #0
	add r2, sp, #4
	bl Sav2_HOF_RecordParty
	ldr r0, [r5, #0xc]
	add r1, r4, #0
	bl SaveHallOfFame
	add r0, r4, #0
	bl FreeToHeap
	add sp, #0x14
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_02052A50

	thumb_func_start sub_02052AA0
sub_02052AA0: ; 0x02052AA0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0205064C
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02050650
	add r5, r0, #0
	add r0, r4, #0
	bl sub_02050654
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0xb
	bhi _02052B8C
	add r1, r0, r0
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02052ACE: ; jump table
	.short _02052AE6 - _02052ACE - 2 ; case 0
	.short _02052B20 - _02052ACE - 2 ; case 1
	.short _02052B5A - _02052ACE - 2 ; case 2
	.short _02052B82 - _02052ACE - 2 ; case 3
	.short _02052B96 - _02052ACE - 2 ; case 4
	.short _02052BCE - _02052ACE - 2 ; case 5
	.short _02052BEA - _02052ACE - 2 ; case 6
	.short _02052BFC - _02052ACE - 2 ; case 7
	.short _02052C20 - _02052ACE - 2 ; case 8
	.short _02052C4C - _02052ACE - 2 ; case 9
	.short _02052C5E - _02052ACE - 2 ; case 10
	.short _02052C86 - _02052ACE - 2 ; case 11
_02052AE6:
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	bne _02052AFC
	add r0, r6, #0
	add r1, r5, #4
	bl sub_0203F974
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052CA8
_02052AFC:
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02052D84
	mov r0, #8
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x20
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl sub_0200FA24
	mov r0, #2
	str r0, [r4]
	b _02052CA8
_02052B20:
	add r0, r6, #0
	bl sub_020505A0
	cmp r0, #0
	bne _02052B8C
	mov r1, #4
	mov r0, #3
	lsl r2, r1, #0xf
	bl CreateHeap
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02052D84
	mov r0, #8
	str r0, [sp]
	mov r1, #1
	str r1, [sp, #4]
	mov r0, #0x20
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	mov r3, #0
	bl sub_0200FA24
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052CA8
_02052B5A:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02052B8C
	ldr r0, [r6, #0xc]
	bl sub_02027500
	cmp r0, #0
	bne _02052B7C
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02052E0C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052CA8
_02052B7C:
	mov r0, #7
	str r0, [r4]
	b _02052CA8
_02052B82:
	add r0, r5, #0
	bl sub_02052E60
	cmp r0, #0
	bne _02052B8E
_02052B8C:
	b _02052CA8
_02052B8E:
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052CA8
_02052B96:
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	bl HealParty
	ldr r0, [r6, #0xc]
	bl sub_020273F0
	add r7, r0, #0
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	bne _02052BB6
	ldr r1, [r5]
	add r0, r6, #0
	bl sub_02052A50
_02052BB6:
	add r0, r5, #0
	bl sub_02052E70
	add r0, r6, #0
	add r1, r5, #0
	add r2, r7, #0
	bl sub_02052E8C
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052CA8
_02052BCE:
	add r0, r5, #0
	bl sub_02052E60
	cmp r0, #0
	beq _02052CA8
	ldr r0, _02052CB0 ; =0x0000061A
	bl PlaySE
	mov r0, #0x20
	str r0, [r5, #0x38]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052CA8
_02052BEA:
	ldr r1, [r5, #0x38]
	cmp r1, #0
	beq _02052BF6
	sub r0, r1, #1
	str r0, [r5, #0x38]
	b _02052CA8
_02052BF6:
	add r0, r0, #1
	str r0, [r4]
	b _02052CA8
_02052BFC:
	mov r0, #8
	str r0, [sp]
	mov r1, #0
	mov r0, #1
	str r0, [sp, #4]
	mov r0, #0x20
	str r0, [sp, #8]
	mov r0, #3
	add r2, r1, #0
	add r3, r1, #0
	bl sub_0200FA24
	mov r0, #0x7f
	str r0, [r5, #0x40]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052CA8
_02052C20:
	ldr r0, [r5, #0x40]
	sub r0, r0, #1
	str r0, [r5, #0x40]
	bl sub_020059D0
	ldr r0, [r5, #0x40]
	cmp r0, #0
	bne _02052CA8
	bl sub_02004A90
	mov r1, #0
	bl sub_02005EB4
	mov r0, #0
	bl sub_0200616C
	mov r0, #0x20
	str r0, [r5, #0x38]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052CA8
_02052C4C:
	ldr r1, [r5, #0x38]
	cmp r1, #0
	beq _02052C58
	sub r0, r1, #1
	str r0, [r5, #0x38]
	b _02052CA8
_02052C58:
	add r0, r0, #1
	str r0, [r4]
	b _02052CA8
_02052C5E:
	bl sub_0200FB5C
	cmp r0, #0
	beq _02052CA8
	add r0, r6, #0
	add r1, r5, #0
	bl sub_02052EFC
	mov r0, #0x7f
	bl sub_020059D0
	add r5, #0x10
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0203F9B4
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _02052CA8
_02052C86:
	add r0, r6, #0
	bl sub_020505A0
	cmp r0, #0
	bne _02052CA8
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #4
	bl DestroyHeap
	mov r0, #0
	bl OS_ResetSystem
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_02052CA8:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_02052CB0: .word 0x0000061A
	thumb_func_end sub_02052AA0

	thumb_func_start Special_EnterHallOfFame
Special_EnterHallOfFame: ; 0x02052CB4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	add r7, r1, #0
	bl sub_0205064C
	add r4, r0, #0
	mov r0, #0x20
	mov r1, #0x44
	bl AllocFromHeap
	add r5, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	add r6, r0, #0
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [sp, #4]
	ldr r0, [r4, #0xc]
	bl sub_0203B9C4
	bl sub_0203B968
	str r0, [sp, #0xc]
	ldr r0, [r4, #0xc]
	bl sub_0203B9C4
	bl sub_0203B964
	str r0, [sp, #8]
	add r0, r6, #0
	bl sub_02066614
	str r0, [r5]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	str r0, [r5, #4]
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r5, #8]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetIGTAddr
	str r0, [r5, #0xc]
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	str r0, [r5, #0x10]
	add r0, r6, #0
	bl sub_02066614
	str r0, [r5, #0x14]
	add r0, r6, #0
	str r7, [r5, #0x3c]
	bl sub_02066614
	cmp r0, #0
	bne _02052D3A
	add r0, r4, #0
	bl sub_0205565C
_02052D3A:
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	ldr r0, [sp, #0xc]
	bl sub_0203E368
	ldr r0, [sp, #8]
	bl sub_0203E380
	add r0, r6, #0
	bl sub_020667E0
	add r0, r6, #0
	bl sub_02066604
	ldr r0, [sp, #4]
	bl PlayerProfile_SetGameClearFlag
	ldr r0, [r5, #0x3c]
	cmp r0, #0
	bne _02052D70
	ldr r0, [r4, #0xc]
	bl Sav2_GameStats_get
	mov r1, #0x4a
	bl GameStats_Inc
_02052D70:
	ldr r0, [sp]
	ldr r1, _02052D80 ; =sub_02052AA0
	add r2, r5, #0
	bl sub_02050530
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02052D80: .word sub_02052AA0
	thumb_func_end Special_EnterHallOfFame

	thumb_func_start sub_02052D84
sub_02052D84: ; 0x02052D84
	push {r4, lr}
	sub sp, #0x10
	add r4, r1, #0
	mov r0, #0xb
	bl BgConfig_Alloc
	str r0, [r4, #0x18]
	mov r0, #0
	str r0, [r4, #0x2c]
	str r0, [r4, #0x30]
	add r0, r4, #0
	add r0, #0x1c
	bl InitWindow
	ldr r0, _02052DFC ; =0x020FC5A4
	bl GX_SetBanks
	ldr r2, _02052E00 ; =0x04000304
	ldrh r1, [r2]
	lsr r0, r2, #0xb
	orr r0, r1
	strh r0, [r2]
	ldr r0, _02052E04 ; =0x020FC578
	bl SetBothScreensModesAndDisable
	mov r0, #3
	mov r1, #0
	bl BG_SetMaskColor
	ldr r0, [r4, #0x18]
	ldr r2, _02052E08 ; =0x020FC588
	mov r1, #3
	mov r3, #0
	bl InitBgFromTemplate
	mov r1, #0x20
	mov r0, #3
	mov r2, #0
	add r3, r1, #0
	bl BG_ClearCharDataRange
	mov r2, #0
	str r2, [sp]
	mov r0, #0x20
	str r0, [sp, #4]
	str r0, [sp, #8]
	mov r0, #0x11
	str r0, [sp, #0xc]
	ldr r0, [r4, #0x18]
	mov r1, #3
	add r3, r2, #0
	bl FillBgTilemapRect
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl BgCommitTilemapBufferToVram
	add sp, #0x10
	pop {r4, pc}
	nop
_02052DFC: .word 0x020FC5A4
_02052E00: .word 0x04000304
_02052E04: .word 0x020FC578
_02052E08: .word 0x020FC588
	thumb_func_end sub_02052D84

	thumb_func_start sub_02052E0C
sub_02052E0C: ; 0x02052E0C
	push {r3, r4, r5, lr}
	ldr r0, [r0, #0xc]
	add r5, r1, #0
	bl Sav2_PlayerData_GetOptionsAddr
	add r4, r0, #0
	mov r0, #0x1b
	mov r1, #0x28
	mov r2, #0xf
	mov r3, #0x20
	bl ReadMsgData_NewNarc_NewString
	str r0, [r5, #0x2c]
	add r1, r5, #0
	ldr r0, [r5, #0x18]
	add r1, #0x1c
	mov r2, #3
	bl sub_0205B514
	add r0, r5, #0
	add r0, #0x1c
	add r1, r4, #0
	bl sub_0205B564
	add r0, r5, #0
	ldr r1, [r5, #0x2c]
	add r0, #0x1c
	add r2, r4, #0
	mov r3, #1
	bl sub_0205B5B4
	str r0, [r5, #0x34]
	add r0, r5, #0
	ldr r1, _02052E5C ; =0x000003E2
	add r0, #0x1c
	bl sub_0200F0AC
	str r0, [r5, #0x30]
	pop {r3, r4, r5, pc}
	nop
_02052E5C: .word 0x000003E2
	thumb_func_end sub_02052E0C

	thumb_func_start sub_02052E60
sub_02052E60: ; 0x02052E60
	ldr r0, [r0, #0x34]
	ldr r3, _02052E6C ; =sub_0205B624
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx r3
	nop
_02052E6C: .word sub_0205B624
	thumb_func_end sub_02052E60

	thumb_func_start sub_02052E70
sub_02052E70: ; 0x02052E70
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl String_dtor
	ldr r0, [r4, #0x30]
	bl sub_0200F450
	add r4, #0x1c
	add r0, r4, #0
	bl sub_0205B5A8
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02052E70

	thumb_func_start sub_02052E8C
sub_02052E8C: ; 0x02052E8C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	mov r0, #1
	mov r1, #0x1b
	mov r2, #0x28
	mov r3, #4
	bl NewMsgDataFromNarc
	add r7, r0, #0
	cmp r6, #2
	bne _02052ED4
	mov r0, #4
	bl ScrStrBufs_new
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	add r0, r6, #0
	mov r1, #0
	bl BufferPlayersName
	add r0, r6, #0
	add r1, r7, #0
	mov r2, #0x10
	mov r3, #4
	bl ReadMsgData_ExpandPlaceholders
	str r0, [r4, #0x2c]
	add r0, r6, #0
	bl ScrStrBufs_delete
	b _02052EDC
_02052ED4:
	mov r1, #0x12
	bl NewString_ReadMsgData
	str r0, [r4, #0x2c]
_02052EDC:
	add r0, r7, #0
	bl DestroyMsgData
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r2, r0, #0
	add r0, r4, #0
	ldr r1, [r4, #0x2c]
	add r0, #0x1c
	mov r3, #1
	bl sub_0205B5B4
	str r0, [r4, #0x34]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02052E8C

	thumb_func_start sub_02052EFC
sub_02052EFC: ; 0x02052EFC
	push {r4, lr}
	add r4, r1, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	beq _02052F0A
	bl String_dtor
_02052F0A:
	add r0, r4, #0
	add r0, #0x1c
	bl WindowIsInUse
	cmp r0, #0
	beq _02052F1E
	add r0, r4, #0
	add r0, #0x1c
	bl RemoveWindow
_02052F1E:
	ldr r0, [r4, #0x18]
	mov r1, #3
	bl FreeBgTilemapBuffer
	ldr r0, [r4, #0x18]
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_02052EFC
