	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start SaveData_GSPlayerMisc_sizeof
SaveData_GSPlayerMisc_sizeof: ; 0x0202ED74
	ldr r0, _0202ED78 ; =0x00000658
	bx lr
	.balign 4, 0
_0202ED78: .word 0x00000658
	thumb_func_end SaveData_GSPlayerMisc_sizeof

	thumb_func_start SaveData_GSPlayerMisc_get
SaveData_GSPlayerMisc_get: ; 0x0202ED7C
	ldr r3, _0202ED84 ; =SavArray_get
	mov r1, #0x22
	bx r3
	nop
_0202ED84: .word SavArray_get
	thumb_func_end SaveData_GSPlayerMisc_get

	thumb_func_start SaveData_GetPhoneRematches
SaveData_GetPhoneRematches: ; 0x0202ED88
	push {r3, lr}
	mov r1, #0x22
	bl SavArray_get
	bl GSPlayerMisc_GetMomSavingsAddr
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end SaveData_GetPhoneRematches

	thumb_func_start InitGSPlayerMiscInternal
InitGSPlayerMiscInternal: ; 0x0202ED98
	push {r4, lr}
	ldr r2, _0202EDD8 ; =0x00000658
	mov r1, #0
	add r4, r0, #0
	bl MI_CpuFill8
	mov r0, #3
	strb r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, _0202EDDC ; =0xFE03FFFF
	and r0, r1
	str r0, [r4, #4]
	mov r0, #0
	strb r0, [r4, #1]
	mov r0, #0x80
	strb r0, [r4, #3]
	ldrb r0, [r4, #3]
	strb r0, [r4, #2]
	ldr r1, [r4, #4]
	ldr r0, _0202EDE0 ; =0xF9FFFFFF
	and r1, r0
	ldr r0, _0202EDE4 ; =0xE7FFFFFF
	and r0, r1
	str r0, [r4, #4]
	add r0, r4, #0
	bl GSPlayerMisc_PhonebookInit
	ldr r0, _0202EDE8 ; =0x000004B8
	add r0, r4, r0
	bl MomsSavingsInit
	pop {r4, pc}
	.balign 4, 0
_0202EDD8: .word 0x00000658
_0202EDDC: .word 0xFE03FFFF
_0202EDE0: .word 0xF9FFFFFF
_0202EDE4: .word 0xE7FFFFFF
_0202EDE8: .word 0x000004B8
	thumb_func_end InitGSPlayerMiscInternal

	thumb_func_start SaveData_GSPlayerMisc_init
SaveData_GSPlayerMisc_init: ; 0x0202EDEC
	ldr r3, _0202EDF0 ; =InitGSPlayerMiscInternal
	bx r3
	.balign 4, 0
_0202EDF0: .word InitGSPlayerMiscInternal
	thumb_func_end SaveData_GSPlayerMisc_init

	thumb_func_start sub_0202EDF4
sub_0202EDF4: ; 0x0202EDF4
	add r0, #8
	bx lr
	thumb_func_end sub_0202EDF4

	thumb_func_start sub_0202EDF8
sub_0202EDF8: ; 0x0202EDF8
	ldrb r0, [r0]
	bx lr
	thumb_func_end sub_0202EDF8

	thumb_func_start sub_0202EDFC
sub_0202EDFC: ; 0x0202EDFC
	strb r1, [r0]
	bx lr
	thumb_func_end sub_0202EDFC

	thumb_func_start Pokegear_RegisterCard
Pokegear_RegisterCard: ; 0x0202EE00
	cmp r1, #0
	beq _0202EE0E
	cmp r1, #1
	beq _0202EE18
	cmp r1, #2
	beq _0202EE30
	bx lr
_0202EE0E:
	ldr r2, [r0, #4]
	ldr r1, _0202EE48 ; =0xF9FFFFFF
	and r1, r2
	str r1, [r0, #4]
	bx lr
_0202EE18:
	ldr r2, [r0, #4]
	ldr r1, _0202EE48 ; =0xF9FFFFFF
	and r1, r2
	lsl r2, r2, #5
	lsr r3, r2, #0x1e
	mov r2, #1
	orr r2, r3
	lsl r2, r2, #0x1e
	lsr r2, r2, #5
	orr r1, r2
	str r1, [r0, #4]
	bx lr
_0202EE30:
	ldr r2, [r0, #4]
	ldr r1, _0202EE48 ; =0xF9FFFFFF
	and r1, r2
	lsl r2, r2, #5
	lsr r3, r2, #0x1e
	mov r2, #2
	orr r2, r3
	lsl r2, r2, #0x1e
	lsr r2, r2, #5
	orr r1, r2
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
_0202EE48: .word 0xF9FFFFFF
	thumb_func_end Pokegear_RegisterCard

	thumb_func_start sub_0202EE4C
sub_0202EE4C: ; 0x0202EE4C
	ldr r0, [r0, #4]
	lsl r0, r0, #5
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end sub_0202EE4C

	thumb_func_start sub_0202EE58
sub_0202EE58: ; 0x0202EE58
	cmp r1, #3
	bhs _0202EE6A
	ldr r3, [r0, #4]
	ldr r2, _0202EE6C ; =0xE7FFFFFF
	lsl r1, r1, #0x1e
	and r2, r3
	lsr r1, r1, #3
	orr r1, r2
	str r1, [r0, #4]
_0202EE6A:
	bx lr
	.balign 4, 0
_0202EE6C: .word 0xE7FFFFFF
	thumb_func_end sub_0202EE58

	thumb_func_start sub_0202EE70
sub_0202EE70: ; 0x0202EE70
	ldr r0, [r0, #4]
	lsl r0, r0, #3
	lsr r0, r0, #0x1e
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bx lr
	thumb_func_end sub_0202EE70

	thumb_func_start sub_0202EE7C
sub_0202EE7C: ; 0x0202EE7C
	ldr r0, [r0, #4]
	lsl r0, r0, #7
	lsr r0, r0, #0x19
	bx lr
	thumb_func_end sub_0202EE7C

	thumb_func_start sub_0202EE84
sub_0202EE84: ; 0x0202EE84
	ldr r3, [r0, #4]
	ldr r2, _0202EE94 ; =0xFE03FFFF
	lsl r1, r1, #0x19
	and r2, r3
	lsr r1, r1, #7
	orr r1, r2
	str r1, [r0, #4]
	bx lr
	.balign 4, 0
_0202EE94: .word 0xFE03FFFF
	thumb_func_end sub_0202EE84

	thumb_func_start sub_0202EE98
sub_0202EE98: ; 0x0202EE98
	ldr r0, [r0, #4]
	lsl r0, r0, #0x17
	lsr r0, r0, #0x17
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	bx lr
	thumb_func_end sub_0202EE98

	thumb_func_start sub_0202EEA4
sub_0202EEA4: ; 0x0202EEA4
	ldrb r0, [r0, #1]
	bx lr
	thumb_func_end sub_0202EEA4

	thumb_func_start sub_0202EEA8
sub_0202EEA8: ; 0x0202EEA8
	strb r1, [r0, #1]
	bx lr
	thumb_func_end sub_0202EEA8

	thumb_func_start sub_0202EEAC
sub_0202EEAC: ; 0x0202EEAC
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202EEAC

	thumb_func_start sub_0202EEB4
sub_0202EEB4: ; 0x0202EEB4
	ldrb r3, [r0, #2]
	strh r3, [r1]
	ldrb r0, [r0, #3]
	strh r0, [r2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202EEB4

	thumb_func_start GSPlayerMisc_FindEmptyGearPhonebookSlot
GSPlayerMisc_FindEmptyGearPhonebookSlot: ; 0x0202EEC0
	ldr r2, _0202EEE0 ; =0x0000060C
	mov r3, #0
_0202EEC4:
	add r1, r0, r3
	ldrb r1, [r1, r2]
	cmp r1, #0xff
	bne _0202EED0
	add r0, r3, #0
	bx lr
_0202EED0:
	add r1, r3, #1
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	cmp r3, #0x4b
	blo _0202EEC4
	mov r0, #0x4b
	bx lr
	nop
_0202EEE0: .word 0x0000060C
	thumb_func_end GSPlayerMisc_FindEmptyGearPhonebookSlot

	thumb_func_start GSPlayerMisc_IsGearNumberRegistered
GSPlayerMisc_IsGearNumberRegistered: ; 0x0202EEE4
	push {r3, r4}
	ldr r3, _0202EF14 ; =0x0000060C
	mov r4, #0
_0202EEEA:
	add r2, r0, r4
	ldrb r2, [r2, r3]
	cmp r1, r2
	bne _0202EEF8
	add r0, r4, #0
	pop {r3, r4}
	bx lr
_0202EEF8:
	cmp r2, #0xff
	bne _0202EF02
	mov r0, #0xff
	pop {r3, r4}
	bx lr
_0202EF02:
	add r2, r4, #1
	lsl r2, r2, #0x18
	lsr r4, r2, #0x18
	cmp r4, #0x4b
	blo _0202EEEA
	mov r0, #0xff
	pop {r3, r4}
	bx lr
	nop
_0202EF14: .word 0x0000060C
	thumb_func_end GSPlayerMisc_IsGearNumberRegistered

	thumb_func_start RegisterPhoneNumberInPokeGear
RegisterPhoneNumberInPokeGear: ; 0x0202EF18
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #0x4b
	blo _0202EF28
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_0202EF28:
	bl GSPlayerMisc_IsGearNumberRegistered
	cmp r0, #0xff
	bne _0202EF3C
	add r0, r5, #0
	bl GSPlayerMisc_FindEmptyGearPhonebookSlot
	add r1, r5, r0
	ldr r0, _0202EF40 ; =0x0000060C
	strb r4, [r1, r0]
_0202EF3C:
	pop {r3, r4, r5, pc}
	nop
_0202EF40: .word 0x0000060C
	thumb_func_end RegisterPhoneNumberInPokeGear

	thumb_func_start GSPlayerMisc_AllocAndCopyPhonebook
GSPlayerMisc_AllocAndCopyPhonebook: ; 0x0202EF44
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl GSPlayerMisc_FindEmptyGearPhonebookSlot
	add r4, r0, #0
	add r0, r6, #0
	add r1, r4, #0
	bl AllocFromHeap
	add r6, r0, #0
	ldr r0, _0202EF6C ; =0x0000060C
	add r1, r6, #0
	add r0, r5, r0
	add r2, r4, #0
	bl MI_CpuCopy8
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	nop
_0202EF6C: .word 0x0000060C
	thumb_func_end GSPlayerMisc_AllocAndCopyPhonebook

	thumb_func_start GSPlayerMisc_SetPhonebookFromBuffer
GSPlayerMisc_SetPhonebookFromBuffer: ; 0x0202EF70
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, _0202EF98 ; =0x0000060C
	add r6, r1, #0
	add r4, r2, #0
	add r0, r5, r0
	mov r1, #0xff
	mov r2, #0x4b
	bl MI_CpuFill8
	cmp r4, #0x4b
	blo _0202EF8A
	mov r4, #0x4b
_0202EF8A:
	ldr r1, _0202EF98 ; =0x0000060C
	add r0, r6, #0
	add r1, r5, r1
	add r2, r4, #0
	bl MI_CpuCopy8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202EF98: .word 0x0000060C
	thumb_func_end GSPlayerMisc_SetPhonebookFromBuffer

	thumb_func_start GSPlayerMisc_PhonebookInit
GSPlayerMisc_PhonebookInit: ; 0x0202EF9C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, _0202EFB4 ; =0x0000060C
	mov r1, #0xff
	add r0, r4, r0
	mov r2, #0x4b
	bl MI_CpuFill8
	ldr r0, _0202EFB4 ; =0x0000060C
	mov r1, #0
	strb r1, [r4, r0]
	pop {r4, pc}
	.balign 4, 0
_0202EFB4: .word 0x0000060C
	thumb_func_end GSPlayerMisc_PhonebookInit

	thumb_func_start GSPlayerMisc_GetMomSavingsAddr
GSPlayerMisc_GetMomSavingsAddr: ; 0x0202EFB8
	ldr r1, _0202EFC0 ; =0x000004B8
	add r0, r0, r1
	bx lr
	nop
_0202EFC0: .word 0x000004B8
	thumb_func_end GSPlayerMisc_GetMomSavingsAddr

	thumb_func_start sub_0202EFC4
sub_0202EFC4: ; 0x0202EFC4
	ldrh r2, [r0]
	mov r1, #1
	bic r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	mov r1, #2
	bic r2, r1
	strh r2, [r0]
	ldrh r2, [r0]
	mov r1, #0xfc
	bic r2, r1
	mov r1, #4
	orr r1, r2
	strh r1, [r0]
	mov r1, #0
	strh r1, [r0, #2]
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202EFC4

	thumb_func_start MomsSavingsInit
MomsSavingsInit: ; 0x0202EFE8
	push {r4, r5, r6, lr}
	mov r2, #0x55
	mov r1, #0
	lsl r2, r2, #2
	add r6, r0, #0
	bl MI_CpuFill8
	mov r4, #0
	add r5, r6, #0
_0202EFFA:
	add r0, r5, #0
	bl sub_0202EFC4
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0x4b
	blt _0202EFFA
	ldr r1, _0202F018 ; =0x00000146
	mov r0, #0x7f
	ldrb r2, [r6, r1]
	bic r2, r0
	mov r0, #7
	orr r0, r2
	strb r0, [r6, r1]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202F018: .word 0x00000146
	thumb_func_end MomsSavingsInit

	thumb_func_start sub_0202F01C
sub_0202F01C: ; 0x0202F01C
	push {r4, r5, r6, lr}
	cmp r1, #0xd
	blo _0202F028
	bl GF_AssertFail
	pop {r4, r5, r6, pc}
_0202F028:
	ldr r2, _0202F04C ; =0x0000014E
	lsr r6, r1, #0x1f
	lsl r5, r1, #0x1d
	add r4, r0, r2
	lsl r0, r1, #0x15
	lsr r3, r0, #0x18
	sub r5, r5, r6
	mov r1, #0x1d
	ror r5, r1
	add r1, r6, r5
	lsl r1, r1, #0x18
	ldrb r2, [r4, r3]
	mov r0, #1
	lsr r1, r1, #0x18
	lsl r0, r1
	orr r0, r2
	strb r0, [r4, r3]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202F04C: .word 0x0000014E
	thumb_func_end sub_0202F01C

	thumb_func_start sub_0202F050
sub_0202F050: ; 0x0202F050
	push {r3, r4, r5, lr}
	cmp r1, #0xd
	blo _0202F05C
	bl GF_AssertFail
	pop {r3, r4, r5, pc}
_0202F05C:
	lsr r4, r1, #0x1f
	lsl r3, r1, #0x1d
	sub r3, r3, r4
	mov r2, #0x1d
	ror r3, r2
	mov r5, #1
	add r2, r4, r3
	add r3, r5, #0
	lsl r3, r2
	lsl r2, r3, #0x18
	ldr r3, _0202F088 ; =0x0000014E
	lsr r2, r2, #0x18
	add r4, r0, r3
	lsl r0, r1, #0x15
	lsr r3, r0, #0x18
	ldrb r0, [r4, r3]
	add r1, r2, #0
	tst r1, r0
	beq _0202F086
	eor r0, r2
	strb r0, [r4, r3]
_0202F086:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202F088: .word 0x0000014E
	thumb_func_end sub_0202F050

	thumb_func_start sub_0202F08C
sub_0202F08C: ; 0x0202F08C
	push {r3, lr}
	cmp r1, #0xd
	blo _0202F09A
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_0202F09A:
	lsl r2, r1, #0x15
	lsr r2, r2, #0x18
	add r2, r0, r2
	ldr r0, _0202F0C0 ; =0x0000014E
	ldrb r3, [r2, r0]
	lsr r2, r1, #0x1f
	lsl r1, r1, #0x1d
	sub r1, r1, r2
	mov r0, #0x1d
	ror r1, r0
	add r0, r2, r1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r1, r3, #0
	asr r1, r0
	mov r0, #1
	and r0, r1
	pop {r3, pc}
	nop
_0202F0C0: .word 0x0000014E
	thumb_func_end sub_0202F08C

	thumb_func_start PhoneRematches_SetSeeking
PhoneRematches_SetSeeking: ; 0x0202F0C4
	push {r4, lr}
	cmp r1, #0x4b
	blo _0202F0D0
	bl GF_AssertFail
	pop {r4, pc}
_0202F0D0:
	lsl r3, r1, #2
	ldrh r1, [r0, r3]
	mov r4, #1
	lsl r2, r2, #0x10
	bic r1, r4
	lsr r4, r2, #0x10
	mov r2, #1
	and r2, r4
	orr r1, r2
	strh r1, [r0, r3]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end PhoneRematches_SetSeeking

	thumb_func_start PhoneRematches_IsSeeking
PhoneRematches_IsSeeking: ; 0x0202F0E8
	push {r3, lr}
	cmp r1, #0x4b
	blo _0202F0F6
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_0202F0F6:
	lsl r1, r1, #2
	ldrh r0, [r0, r1]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	pop {r3, pc}
	thumb_func_end PhoneRematches_IsSeeking

	thumb_func_start PhoneRematches_GiftItemIdSet
PhoneRematches_GiftItemIdSet: ; 0x0202F100
	push {r3, lr}
	cmp r1, #0x4b
	blo _0202F10C
	bl GF_AssertFail
	pop {r3, pc}
_0202F10C:
	lsl r1, r1, #2
	add r3, r0, r1
	strh r2, [r3, #2]
	cmp r2, #0
	ldrh r1, [r3]
	bne _0202F120
	mov r0, #2
	bic r1, r0
	strh r1, [r3]
	pop {r3, pc}
_0202F120:
	mov r0, #2
	orr r0, r1
	strh r0, [r3]
	pop {r3, pc}
	thumb_func_end PhoneRematches_GiftItemIdSet

	thumb_func_start PhoneRematches_GiftItemIdGet
PhoneRematches_GiftItemIdGet: ; 0x0202F128
	push {r3, lr}
	cmp r1, #0x4b
	blo _0202F136
	bl GF_AssertFail
	mov r0, #0
	pop {r3, pc}
_0202F136:
	lsl r2, r1, #2
	ldrh r1, [r0, r2]
	lsl r1, r1, #0x1e
	lsr r1, r1, #0x1f
	beq _0202F146
	add r0, r0, r2
	ldrh r0, [r0, #2]
	pop {r3, pc}
_0202F146:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end PhoneRematches_GiftItemIdGet

	thumb_func_start MomSavingsBalanceAction
MomSavingsBalanceAction: ; 0x0202F14C
	cmp r1, #1
	beq _0202F15A
	cmp r1, #2
	beq _0202F162
	cmp r1, #3
	beq _0202F178
	b _0202F18C
_0202F15A:
	mov r1, #5
	lsl r1, r1, #6
	str r2, [r0, r1]
	b _0202F18C
_0202F162:
	mov r1, #5
	lsl r1, r1, #6
	ldr r3, [r0, r1]
	add r2, r3, r2
	str r2, [r0, r1]
	ldr r3, [r0, r1]
	ldr r2, _0202F194 ; =999999
	cmp r3, r2
	bls _0202F18C
	str r2, [r0, r1]
	b _0202F18C
_0202F178:
	mov r1, #5
	lsl r1, r1, #6
	ldr r3, [r0, r1]
	cmp r3, r2
	bhs _0202F188
	mov r2, #0
	str r2, [r0, r1]
	b _0202F18C
_0202F188:
	sub r2, r3, r2
	str r2, [r0, r1]
_0202F18C:
	mov r1, #5
	lsl r1, r1, #6
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_0202F194: .word 999999
	thumb_func_end MomSavingsBalanceAction

	thumb_func_start sub_0202F198
sub_0202F198: ; 0x0202F198
	push {r3, r4}
	cmp r1, #9
	bhs _0202F1AE
	mov r2, #0x51
	lsl r2, r2, #2
	ldrh r4, [r0, r2]
	mov r3, #1
	lsl r3, r1
	add r1, r4, #0
	orr r1, r3
	strh r1, [r0, r2]
_0202F1AE:
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202F198

	thumb_func_start sub_0202F1B4
sub_0202F1B4: ; 0x0202F1B4
	mov r2, #0x51
	lsl r2, r2, #2
	ldrh r0, [r0, r2]
	add r2, r0, #0
	asr r2, r1
	mov r0, #1
	and r0, r2
	bx lr
	thumb_func_end sub_0202F1B4

	thumb_func_start sub_0202F1C4
sub_0202F1C4: ; 0x0202F1C4
	push {r3, r4, r5, r6}
	ldr r3, _0202F1F0 ; =0x0000012E
	mov r5, #0
	add r6, r0, #0
_0202F1CC:
	ldrh r4, [r6, r3]
	cmp r4, #0
	bne _0202F1E4
	lsl r3, r5, #2
	add r3, r0, r3
	mov r0, #0x4b
	lsl r0, r0, #2
	strh r1, [r3, r0]
	add r0, r0, #2
	strh r2, [r3, r0]
	pop {r3, r4, r5, r6}
	bx lr
_0202F1E4:
	add r5, r5, #1
	add r6, r6, #4
	cmp r5, #5
	blt _0202F1CC
	pop {r3, r4, r5, r6}
	bx lr
	.balign 4, 0
_0202F1F0: .word 0x0000012E
	thumb_func_end sub_0202F1C4

	thumb_func_start sub_0202F1F4
sub_0202F1F4: ; 0x0202F1F4
	push {r4, r5, r6, r7}
	mov r3, #0x13
	lsl r3, r3, #4
	mov r1, #0
	add r2, r0, #0
	sub r4, r3, #4
	add r5, r3, #2
	sub r6, r3, #2
_0202F204:
	ldrh r7, [r2, r3]
	add r1, r1, #1
	strh r7, [r2, r4]
	ldrh r7, [r2, r5]
	strh r7, [r2, r6]
	add r2, r2, #4
	cmp r1, #4
	blt _0202F204
	mov r1, #0x4f
	mov r2, #0
	lsl r1, r1, #2
	strh r2, [r0, r1]
	add r1, r1, #2
	strh r2, [r0, r1]
	pop {r4, r5, r6, r7}
	bx lr
	thumb_func_end sub_0202F1F4

	thumb_func_start sub_0202F224
sub_0202F224: ; 0x0202F224
	cmp r1, #5
	blo _0202F22E
	mov r0, #0
	strh r0, [r2]
	bx lr
_0202F22E:
	lsl r1, r1, #2
	add r3, r0, r1
	mov r0, #0x4b
	lsl r0, r0, #2
	ldrh r1, [r3, r0]
	add r0, r0, #2
	strh r1, [r2]
	ldrh r0, [r3, r0]
	bx lr
	thumb_func_end sub_0202F224

	thumb_func_start sub_0202F240
sub_0202F240: ; 0x0202F240
	ldr r1, _0202F250 ; =0x0000013E
	ldrh r0, [r0, r1]
	cmp r0, #0
	beq _0202F24C
	mov r0, #1
	bx lr
_0202F24C:
	mov r0, #0
	bx lr
	.balign 4, 0
_0202F250: .word 0x0000013E
	thumb_func_end sub_0202F240

	thumb_func_start sub_0202F254
sub_0202F254: ; 0x0202F254
	push {r3, r4}
	ldr r4, _0202F270 ; =0x00000146
	lsl r1, r1, #0x18
	ldrb r2, [r0, r4]
	lsr r1, r1, #0x18
	mov r3, #0x80
	lsl r1, r1, #0x1f
	bic r2, r3
	lsr r1, r1, #0x18
	orr r1, r2
	strb r1, [r0, r4]
	pop {r3, r4}
	bx lr
	nop
_0202F270: .word 0x00000146
	thumb_func_end sub_0202F254

	thumb_func_start sub_0202F274
sub_0202F274: ; 0x0202F274
	ldr r1, _0202F280 ; =0x00000146
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x1f
	bx lr
	nop
_0202F280: .word 0x00000146
	thumb_func_end sub_0202F274

	thumb_func_start sub_0202F284
sub_0202F284: ; 0x0202F284
	ldr r1, _0202F290 ; =0x00000146
	ldrb r0, [r0, r1]
	lsl r0, r0, #0x19
	lsr r0, r0, #0x19
	bx lr
	nop
_0202F290: .word 0x00000146
	thumb_func_end sub_0202F284

	thumb_func_start sub_0202F294
sub_0202F294: ; 0x0202F294
	push {r3, r4, r5, lr}
	ldr r2, _0202F2FC ; =0x00000146
	add r5, r0, #0
	ldrb r3, [r5, r2]
	add r4, r1, #0
	mov r1, #0x80
	bic r3, r1
	strb r3, [r5, r2]
	mov r1, #0x10
	mov r2, #0
	bl PhoneRematches_GiftItemIdSet
	add r0, r5, #0
	mov r1, #0x10
	mov r2, #0
	bl PhoneRematches_SetSeeking
	cmp r4, #0
	ble _0202F2DA
	ldr r2, _0202F2FC ; =0x00000146
	ldrb r0, [r5, r2]
	lsl r1, r0, #0x19
	lsr r3, r1, #0x19
	cmp r3, r4
	blt _0202F2DA
	mov r1, #0x7f
	bic r0, r1
	sub r1, r3, r4
	lsl r1, r1, #0x18
	lsr r3, r1, #0x18
	mov r1, #0x7f
	and r1, r3
	orr r0, r1
	strb r0, [r5, r2]
	pop {r3, r4, r5, pc}
_0202F2DA:
	bl LCRandom
	mov r1, #6
	bl _s32_div_f
	ldr r3, _0202F2FC ; =0x00000146
	add r1, r1, #1
	ldrb r0, [r5, r3]
	mov r2, #0x7f
	lsl r1, r1, #0x18
	bic r0, r2
	lsr r2, r1, #0x18
	mov r1, #0x7f
	and r1, r2
	orr r0, r1
	strb r0, [r5, r3]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0202F2FC: .word 0x00000146
	thumb_func_end sub_0202F294

	thumb_func_start sub_0202F300
sub_0202F300: ; 0x0202F300
	push {r4, r5, r6, lr}
	add r5, r0, #0
	mov r0, #0x52
	lsl r0, r0, #2
	add r6, r1, #0
	add r4, r2, #0
	add r0, r5, r0
	mov r1, #0
	mov r2, #6
	bl MI_CpuFill8
	cmp r6, #0
	bne _0202F322
	ldr r0, _0202F33C ; =0x00000147
	mov r1, #0
	strb r1, [r5, r0]
	pop {r4, r5, r6, pc}
_0202F322:
	cmp r4, #6
	blo _0202F328
	mov r4, #6
_0202F328:
	mov r1, #0x52
	lsl r1, r1, #2
	add r0, r6, #0
	add r1, r5, r1
	add r2, r4, #0
	bl MI_CpuCopy8
	ldr r0, _0202F33C ; =0x00000147
	strb r4, [r5, r0]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202F33C: .word 0x00000147
	thumb_func_end sub_0202F300

	thumb_func_start sub_0202F340
sub_0202F340: ; 0x0202F340
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r1, _0202F36C ; =0x00000147
	add r0, r2, #0
	ldrb r1, [r5, r1]
	bl AllocFromHeap
	mov r2, #0x52
	add r6, r0, #0
	lsl r2, r2, #2
	add r0, r5, r2
	sub r2, r2, #1
	ldrb r2, [r5, r2]
	add r1, r6, #0
	bl MI_CpuCopy8
	ldr r0, _0202F36C ; =0x00000147
	ldrb r0, [r5, r0]
	strb r0, [r4]
	add r0, r6, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0202F36C: .word 0x00000147
	thumb_func_end sub_0202F340

	thumb_func_start sub_0202F370
sub_0202F370: ; 0x0202F370
	ldrh r1, [r0]
	cmp r1, #0
	beq _0202F37E
	mov r0, #0x87
	lsl r0, r0, #2
	cmp r1, r0
	blo _0202F382
_0202F37E:
	mov r0, #0
	bx lr
_0202F382:
	mov r0, #1
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202F370

	thumb_func_start sub_0202F388
sub_0202F388: ; 0x0202F388
	push {r3, r4}
	mov r1, #0
	strh r1, [r0]
	ldrh r3, [r0, #2]
	mov r2, #0xf
	bic r3, r2
	mov r2, #0xf
	orr r2, r3
	strh r2, [r0, #2]
	ldrh r3, [r0, #2]
	mov r2, #0xf0
	bic r3, r2
	mov r2, #0xf0
	orr r3, r2
	strh r3, [r0, #2]
	ldrh r4, [r0, #2]
	ldr r3, _0202F3D0 ; =0xFFFFF0FF
	and r4, r3
	lsl r3, r2, #4
	orr r3, r4
	strh r3, [r0, #2]
	ldrh r4, [r0, #2]
	ldr r3, _0202F3D4 ; =0xFFFF0FFF
	lsl r2, r2, #8
	and r3, r4
	orr r2, r3
	strh r2, [r0, #2]
	ldr r2, _0202F3D8 ; =0x0000FFFF
_0202F3C0:
	add r1, r1, #1
	strh r2, [r0, #4]
	add r0, r0, #2
	cmp r1, #4
	blt _0202F3C0
	pop {r3, r4}
	bx lr
	nop
_0202F3D0: .word 0xFFFFF0FF
_0202F3D4: .word 0xFFFF0FFF
_0202F3D8: .word 0x0000FFFF
	thumb_func_end sub_0202F388

	thumb_func_start sub_0202F3DC
sub_0202F3DC: ; 0x0202F3DC
	push {r4, r5}
	mov r4, #0
	ldr r1, _0202F3FC ; =0x0000FFFF
	str r4, [r0]
	add r5, r0, #0
	mov r3, #0xf
_0202F3E8:
	add r2, r0, r4
	strb r3, [r2, #4]
	strh r1, [r5, #8]
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #4
	blt _0202F3E8
	pop {r4, r5}
	bx lr
	nop
_0202F3FC: .word 0x0000FFFF
	thumb_func_end sub_0202F3DC

	thumb_func_start sub_0202F400
sub_0202F400: ; 0x0202F400
	push {r3, r4}
	ldr r1, _0202F430 ; =0x0000FFFF
	mov r3, #0
	add r4, r0, #0
_0202F408:
	add r2, r0, r3
	ldrb r2, [r2, #4]
	cmp r2, #0xf
	bne _0202F416
	ldrh r2, [r4, #8]
	cmp r2, r1
	beq _0202F41C
_0202F416:
	mov r0, #1
	pop {r3, r4}
	bx lr
_0202F41C:
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, #4
	blt _0202F408
	mov r1, #0
	str r1, [r0]
	add r0, r1, #0
	pop {r3, r4}
	bx lr
	nop
_0202F430: .word 0x0000FFFF
	thumb_func_end sub_0202F400

	thumb_func_start sub_0202F434
sub_0202F434: ; 0x0202F434
	push {r3, r4}
	ldr r2, [r0]
	strh r2, [r1]
	ldrh r3, [r1, #2]
	ldrb r4, [r0, #4]
	mov r2, #0xf
	bic r3, r2
	mov r2, #0xf
	and r4, r2
	lsl r4, r4, #0x10
	lsr r4, r4, #0x10
	and r4, r2
	orr r3, r4
	strh r3, [r1, #2]
	ldrh r3, [r1, #2]
	mov r4, #0xf0
	bic r3, r4
	ldrb r4, [r0, #5]
	and r4, r2
	lsl r4, r4, #0x10
	lsr r4, r4, #0x10
	lsl r4, r4, #0x1c
	lsr r4, r4, #0x18
	orr r3, r4
	strh r3, [r1, #2]
	ldrh r4, [r1, #2]
	ldr r3, _0202F4A8 ; =0xFFFFF0FF
	and r3, r4
	ldrb r4, [r0, #6]
	and r4, r2
	lsl r4, r4, #0x10
	lsr r4, r4, #0x10
	lsl r4, r4, #0x1c
	lsr r4, r4, #0x14
	orr r3, r4
	strh r3, [r1, #2]
	ldrh r4, [r1, #2]
	ldr r3, _0202F4AC ; =0xFFFF0FFF
	and r3, r4
	ldrb r4, [r0, #7]
	and r2, r4
	lsl r2, r2, #0x10
	lsr r2, r2, #0x10
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x10
	orr r2, r3
	strh r2, [r1, #2]
	mov r3, #0
_0202F494:
	ldrh r2, [r0, #8]
	add r3, r3, #1
	add r0, r0, #2
	strh r2, [r1, #4]
	add r1, r1, #2
	cmp r3, #4
	blt _0202F494
	pop {r3, r4}
	bx lr
	nop
_0202F4A8: .word 0xFFFFF0FF
_0202F4AC: .word 0xFFFF0FFF
	thumb_func_end sub_0202F434

	thumb_func_start sub_0202F4B0
sub_0202F4B0: ; 0x0202F4B0
	ldrh r2, [r0]
	mov r3, #0
	str r2, [r1]
	ldrh r2, [r0, #2]
	lsl r2, r2, #0x1c
	lsr r2, r2, #0x1c
	strb r2, [r1, #4]
	ldrh r2, [r0, #2]
	lsl r2, r2, #0x18
	lsr r2, r2, #0x1c
	strb r2, [r1, #5]
	ldrh r2, [r0, #2]
	lsl r2, r2, #0x14
	lsr r2, r2, #0x1c
	strb r2, [r1, #6]
	ldrh r2, [r0, #2]
	lsl r2, r2, #0x10
	lsr r2, r2, #0x1c
	strb r2, [r1, #7]
_0202F4D6:
	ldrh r2, [r0, #4]
	add r3, r3, #1
	add r0, r0, #2
	strh r2, [r1, #8]
	add r1, r1, #2
	cmp r3, #4
	blt _0202F4D6
	bx lr
	.balign 4, 0
	thumb_func_end sub_0202F4B0

	thumb_func_start sub_0202F4E8
sub_0202F4E8: ; 0x0202F4E8
	push {r3, lr}
	cmp r1, #0x64
	blo _0202F4F2
	mov r0, #0
	pop {r3, pc}
_0202F4F2:
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	bl sub_0202F370
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202F4E8

	thumb_func_start sub_0202F500
sub_0202F500: ; 0x0202F500
	push {r3, lr}
	cmp r1, #0x64
	bhs _0202F510
	mov r2, #0xc
	mul r2, r1
	add r0, r0, r2
	bl sub_0202F388
_0202F510:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0202F500

	thumb_func_start sub_0202F514
sub_0202F514: ; 0x0202F514
	push {r3, r4, r5, lr}
	add r4, r0, #0
	cmp r2, #0x64
	blo _0202F526
	add r0, r1, #0
	bl sub_0202F3DC
	mov r0, #0
	pop {r3, r4, r5, pc}
_0202F526:
	mov r0, #0xc
	add r5, r2, #0
	mul r5, r0
	add r0, r4, r5
	bl sub_0202F4B0
	add r0, r4, r5
	bl sub_0202F370
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0202F514

	thumb_func_start sub_0202F53C
sub_0202F53C: ; 0x0202F53C
	push {r4, r5, r6, lr}
	add r4, r2, #0
	add r5, r0, #0
	add r6, r1, #0
	cmp r4, #0x64
	blo _0202F54C
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202F54C:
	cmp r3, #0
	bne _0202F562
	mov r0, #0xc
	mul r0, r4
	add r0, r5, r0
	bl sub_0202F370
	cmp r0, #1
	bne _0202F562
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202F562:
	mov r1, #0xc
	mul r1, r4
	add r0, r6, #0
	add r1, r5, r1
	bl sub_0202F434
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_0202F53C
