	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ov36_021E5900
ov36_021E5900: ; 0x021E5900
	push {r3, lr}
	mov r2, #2
	mov r0, #3
	mov r1, #0x4b
	lsl r2, r2, #0x10
	bl CreateHeap
	bl InitializeMainRNG
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov36_021E5900

	thumb_func_start ov36_021E5918
ov36_021E5918: ; 0x021E5918
	push {r3, lr}
	bl OverlayManager_GetField18
	ldr r1, [r0, #8]
	mov r0, #0x4b
	bl ov36_021E5BC8
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov36_021E5918

	.public _02106068

	thumb_func_start ov36_TitleScreen_SwitchToNewGame
ov36_TitleScreen_SwitchToNewGame: ; 0x021E592C
	push {r3, lr}
	mov r0, #0x4b
	bl DestroyHeap
	mov r0, #0
	ldr r1, _021E5944 ; =_02106068
	mvn r0, r0
	bl RegisterMainOverlay
	mov r0, #1
	pop {r3, pc}
	nop
_021E5944: .word _02106068
	thumb_func_end ov36_TitleScreen_SwitchToNewGame

	thumb_func_start ov36_021E5948
ov36_021E5948: ; 0x021E5948
	push {r3, lr}
	mov r2, #2
	mov r0, #3
	mov r1, #0x4b
	lsl r2, r2, #0x10
	bl CreateHeap
	bl InitializeMainRNG
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov36_021E5948

	thumb_func_start ov36_021E5960
ov36_021E5960: ; 0x021E5960
	push {r4, lr}
	bl OverlayManager_GetField18
	ldr r4, [r0, #8]
	mov r0, #0x4b
	add r1, r4, #0
	mov r2, #1
	bl ov36_021E5A38
	add r0, r4, #0
	bl Sav2_PlayerData_GetIGTAddr
	bl sub_0201838C
	mov r0, #1
	pop {r4, pc}
	thumb_func_end ov36_021E5960

	.public _020FA15C

	thumb_func_start ov36_021E5980
ov36_021E5980: ; 0x021E5980
	push {r3, lr}
	mov r0, #0x4b
	bl DestroyHeap
	mov r0, #0
	ldr r1, _021E5998 ; =_020FA15C
	mvn r0, r0
	bl RegisterMainOverlay
	mov r0, #1
	pop {r3, pc}
	nop
_021E5998: .word _020FA15C
	thumb_func_end ov36_021E5980

	thumb_func_start ov36_021E599C
ov36_021E599C: ; 0x021E599C
	push {r3, lr}
	mov r2, #2
	mov r0, #3
	mov r1, #0x4b
	lsl r2, r2, #0x10
	bl CreateHeap
	bl InitializeMainRNG
	mov r0, #1
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ov36_021E599C

	thumb_func_start ov36_021E59B4
ov36_021E59B4: ; 0x021E59B4
	push {r3, r4, r5, lr}
	bl OverlayManager_GetField18
	ldr r4, [r0, #8]
	add r0, r4, #0
	bl Sav2_SysInfo_get
	add r5, r0, #0
	mov r0, #0x4b
	add r1, r4, #0
	bl ov36_021E5BB4
	add r0, r4, #0
	mov r1, #0
	bl Options_SetButtonModeOnMain
	add r0, r5, #0
	bl Sav2_SysInfo_MacAddressIsMine
	cmp r0, #0
	beq _021E59E8
	add r0, r5, #0
	bl Sav2_SysInfo_RTCOffsetIsMine
	cmp r0, #0
	bne _021E5A0C
_021E59E8:
	add r0, r4, #0
	bl Sav2_SysInfo_RTC_get
	bl sub_02028E4C
	add r0, r4, #0
	bl sub_0202A988
	bl sub_0202A8A8
	add r0, r5, #0
	bl Sav2_SysInfo_InitFromSystem
	add r0, r4, #0
	bl SavArray_PlayerParty_get
	bl Party_ResetAllShayminToLandForme
_021E5A0C:
	add r0, r4, #0
	bl Sav2_PlayerData_GetIGTAddr
	bl sub_0201838C
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ov36_021E59B4

	.public _020FA16C

	thumb_func_start ov36_021E5A1C
ov36_021E5A1C: ; 0x021E5A1C
	push {r3, lr}
	mov r0, #0x4b
	bl DestroyHeap
	mov r0, #0
	ldr r1, _021E5A34 ; =_020FA16C
	mvn r0, r0
	bl RegisterMainOverlay
	mov r0, #1
	pop {r3, pc}
	nop
_021E5A34: .word _020FA16C
	thumb_func_end ov36_021E5A1C

	thumb_func_start ov36_021E5A38
ov36_021E5A38: ; 0x021E5A38
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x28
	add r6, r1, #0
	add r0, r6, #0
	add r5, r2, #0
	bl Sav2_SysInfo_get
	bl Sav2_SysInfo_InitFromSystem
	add r0, r6, #0
	bl Sav2_SysInfo_RTC_get
	bl Sav2_SysInfo_RTC_init
	add r0, r6, #0
	bl sub_0202A988
	bl sub_0202A8A8
	add r0, r6, #0
	bl sub_0202C854
	add r4, r0, #0
	bl MTRandom
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #1
	bl sub_0202C7C0
	add r0, r6, #0
	bl sub_020674BC
	add r0, r6, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r7, r0, #0
	bl MTRandom
	add r4, r0, #0
	cmp r5, #0
	beq _021E5A94
	add r0, r7, #0
	add r1, r4, #0
	bl PlayerProfile_SetTrainerID
_021E5A94:
	add r0, r6, #0
	bl Save_SafariZone_get
	add r1, r4, #0
	bl sub_0202F5B8
	add r0, r7, #0
	bl PlayerProfile_GetTrainerGender
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #0
	bl sub_0205B418
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r7, #0
	lsr r1, r1, #0x18
	bl PlayerProfile_SetAvatar
	add r0, r6, #0
	bl Sav2_FieldApricornTrees_get
	bl sub_0202AE0C
	add r0, r6, #0
	bl Sav2_Pokewalker_get
	bl sub_02032728
	add r5, r0, #0
	mov r4, #0
_021E5AD4:
	bl MTRandom
	add r4, r4, #1
	stmia r5!, {r0}
	cmp r4, #0xa
	blt _021E5AD4
	ldr r2, _021E5BAC ; =0x000001BD
	mov r0, #1
	mov r1, #0x1b
	mov r3, #3
	bl NewMsgDataFromNarc
	str r0, [sp, #0x1c]
	add r0, r6, #0
	bl Sav2_Mailbox_get
	str r0, [sp, #0x14]
	mov r0, #3
	bl AllocMonZeroed
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	mov r1, #0xb7
	mov r2, #1
	str r0, [sp, #0x10]
	str r3, [sp, #0xc]
	bl CreateMon
	add r0, r7, #0
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	bne _021E5B36
	ldr r0, [sp, #0x1c]
	mov r1, #1
	bl NewString_ReadMsgData
	str r0, [sp, #0x18]
	mov r0, #0
	str r0, [sp]
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x18]
	mov r1, #9
	mov r2, #1
	bl CreateKenyaMail
	b _021E5B4E
_021E5B36:
	ldr r0, [sp, #0x1c]
	mov r1, #0
	bl NewString_ReadMsgData
	str r0, [sp, #0x18]
	mov r2, #0
	ldr r0, [sp, #0x10]
	ldr r3, [sp, #0x18]
	mov r1, #9
	str r2, [sp]
	bl CreateKenyaMail
_021E5B4E:
	ldr r4, _021E5BB0 ; =ov36_021E5C34
	add r6, r0, #0
	mov r5, #0
	add r7, sp, #0x20
_021E5B56:
	add r0, r7, #0
	add r1, r4, #0
	bl MailMsg_init_fromTemplate
	lsl r2, r5, #0x18
	add r0, r6, #0
	add r1, r7, #0
	lsr r2, r2, #0x18
	bl Mail_CopyToUnk20Array
	add r5, r5, #1
	add r4, #8
	cmp r5, #2
	blt _021E5B56
	add r0, sp, #0x20
	bl MailMsg_init
	add r0, r6, #0
	add r1, sp, #0x20
	mov r2, #2
	bl Mail_CopyToUnk20Array
	mov r1, #0
	ldr r0, [sp, #0x14]
	add r2, r1, #0
	add r3, r6, #0
	bl Mailbox_CopyMailToSlotI
	ldr r0, [sp, #0x10]
	bl FreeToHeap
	ldr r0, [sp, #0x18]
	bl String_dtor
	add r0, r6, #0
	bl FreeToHeap
	ldr r0, [sp, #0x1c]
	bl DestroyMsgData
	add sp, #0x28
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021E5BAC: .word 0x000001BD
_021E5BB0: .word ov36_021E5C34
	thumb_func_end ov36_021E5A38

	thumb_func_start ov36_021E5BB4
ov36_021E5BB4: ; 0x021E5BB4
	push {r3, lr}
	add r0, r1, #0
	bl sub_020273B0
	cmp r0, #0
	bne _021E5BC6
	mov r0, #0
	bl OS_ResetSystem
_021E5BC6:
	pop {r3, pc}
	thumb_func_end ov36_021E5BB4

	thumb_func_start ov36_021E5BC8
ov36_021E5BC8: ; 0x021E5BC8
	push {r4, lr}
	add r4, r1, #0
	add r0, r4, #0
	bl Sav2_InitDynamicRegion
	add r0, r4, #0
	bl sub_0203E398
	add r0, r4, #0
	bl Sav2_PlayerData_GetProfileAddr
	ldr r1, _021E5BFC ; =0x00000BB8
	bl PlayerProfile_SetMoney
	add r0, r4, #0
	bl SavArray_Flags_get
	ldr r1, _021E5C00 ; =0x0000DB56
	bl ScriptState_SetFishingCompetitionLengthRecord
	add r0, r4, #0
	bl SavArray_Flags_get
	bl sub_020665EC
	pop {r4, pc}
	.balign 4, 0
_021E5BFC: .word 0x00000BB8
_021E5C00: .word 0x0000DB56
	thumb_func_end ov36_021E5BC8

	.rodata

	.public ov36_021E5C04
ov36_021E5C04:
	.word ov36_021E599C, ov36_021E59B4, ov36_021E5A1C, 0xFFFFFFFF
	.public ov36_021E5C14
ov36_021E5C14:
	.word ov36_021E5948, ov36_021E5960, ov36_021E5980, 0xFFFFFFFF
	.public ov36_021E5C24
ov36_021E5C24:
	.word ov36_021E5900, ov36_021E5918, ov36_TitleScreen_SwitchToNewGame, 0xFFFFFFFF
ov36_021E5C34:
	.byte 0x02, 0x04, 0x07, 0x08, 0x52, 0x00, 0x18, 0x00, 0x03, 0x01, 0x0A, 0xFF, 0x07, 0x00, 0x00, 0x00
