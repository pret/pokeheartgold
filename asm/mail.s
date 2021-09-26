	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F67A4:
	.byte 0xEE, 0x01
_020F67A6:
	.byte 0x1C, 0x02
_020F67A8:
	.byte 0xE7, 0x01
_020F67AA:
	.byte 0x01, 0x00, 0xF3, 0x01, 0x1D, 0x02
	.byte 0xEC, 0x01, 0x01, 0x00, 0xE6, 0x01, 0x1E, 0x02, 0xDF, 0x01, 0x01, 0x00, 0xE6, 0x01, 0x1F, 0x02
	.byte 0xDF, 0x01, 0x02, 0x00, 0xE6, 0x01, 0x20, 0x02, 0xDF, 0x01, 0x03, 0x00, 0xE6, 0x01, 0x21, 0x02
	.byte 0xDF, 0x01, 0x04, 0x00, 0xE6, 0x01, 0x22, 0x02, 0xDF, 0x01, 0x05, 0x00

	.text

	thumb_func_start Mail_init
Mail_init: ; 0x0202B060
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r0, #0
	str r0, [r4]
	strb r0, [r4, #4]
	ldr r0, _0202B0AC ; =gGameLanguage
	mov r1, #8
	ldrb r0, [r0]
	strb r0, [r4, #5]
	ldr r0, _0202B0B0 ; =gGameVersion
	ldrb r0, [r0]
	strb r0, [r4, #6]
	mov r0, #0xff
	strb r0, [r4, #7]
	add r0, r4, #0
	add r0, #8
	bl StringFillEOS
	ldr r0, _0202B0B4 ; =0x0000FFFF
	mov r1, #0
	add r2, r4, #0
_0202B08A:
	add r1, r1, #1
	strh r0, [r2, #0x18]
	add r2, r2, #2
	cmp r1, #3
	blt _0202B08A
	mov r5, #0
	strh r5, [r4, #0x1e]
	add r4, #0x20
_0202B09A:
	add r0, r4, #0
	bl MailMsg_init
	add r5, r5, #1
	add r4, #8
	cmp r5, #3
	blt _0202B09A
	pop {r3, r4, r5, pc}
	nop
_0202B0AC: .word gGameLanguage
_0202B0B0: .word gGameVersion
_0202B0B4: .word 0x0000FFFF
	thumb_func_end Mail_init

	thumb_func_start Mail_TypeIsValid
Mail_TypeIsValid: ; 0x0202B0B8
	ldrb r0, [r0, #7]
	cmp r0, #0xb
	bhi _0202B0C2
	mov r0, #1
	bx lr
_0202B0C2:
	mov r0, #0
	bx lr
	.balign 4, 0
	thumb_func_end Mail_TypeIsValid

	thumb_func_start Mail_new
Mail_new: ; 0x0202B0C8
	push {r4, lr}
	mov r1, #0x38
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	bl Mail_init
	add r0, r4, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end Mail_new

	thumb_func_start Mail_copy
Mail_copy: ; 0x0202B0DC
	ldr r3, _0202B0E4 ; =MI_CpuCopy8
	mov r2, #0x38
	bx r3
	nop
_0202B0E4: .word MI_CpuCopy8
	thumb_func_end Mail_copy

	thumb_func_start Mail_compare
Mail_compare: ; 0x0202B0E8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	ldr r1, [r5]
	ldr r0, [r4]
	cmp r1, r0
	bne _0202B11E
	ldrb r1, [r5, #4]
	ldrb r0, [r4, #4]
	cmp r1, r0
	bne _0202B11E
	ldrb r1, [r5, #5]
	ldrb r0, [r4, #5]
	cmp r1, r0
	bne _0202B11E
	ldrb r1, [r5, #6]
	ldrb r0, [r4, #6]
	cmp r1, r0
	bne _0202B11E
	ldrb r1, [r5, #7]
	ldrb r0, [r4, #7]
	cmp r1, r0
	bne _0202B11E
	ldrh r1, [r5, #0x1e]
	ldrh r0, [r4, #0x1e]
	cmp r1, r0
	beq _0202B122
_0202B11E:
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202B122:
	add r0, r5, #0
	add r1, r4, #0
	add r0, #8
	add r1, #8
	bl StringNotEqual
	cmp r0, #0
	beq _0202B136
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202B136:
	mov r2, #0
	add r3, r4, #0
	add r6, r5, #0
_0202B13C:
	ldrh r1, [r6, #0x18]
	ldrh r0, [r3, #0x18]
	cmp r1, r0
	beq _0202B148
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202B148:
	add r2, r2, #1
	add r3, r3, #2
	add r6, r6, #2
	cmp r2, #3
	blt _0202B13C
	mov r6, #0
	add r4, #0x20
	add r5, #0x20
_0202B158:
	add r0, r5, #0
	add r1, r4, #0
	bl MailMsg_compare
	cmp r0, #0
	bne _0202B168
	mov r0, #0
	pop {r4, r5, r6, pc}
_0202B168:
	add r6, r6, #1
	add r4, #8
	add r5, #8
	cmp r6, #3
	blt _0202B158
	mov r0, #1
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end Mail_compare

	thumb_func_start Mail_SetNewMessageDetails
Mail_SetNewMessageDetails: ; 0x0202B178
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	add r5, r1, #0
	str r2, [sp, #4]
	add r4, r3, #0
	bl Mail_init
	ldr r0, [sp]
	strb r5, [r0, #7]
	add r0, r4, #0
	bl SavArray_PlayerParty_get
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r4, r0, #0
	bl PlayerProfile_GetNamePtr
	add r1, r0, #0
	ldr r0, [sp]
	add r0, #8
	bl CopyU16StringArray
	add r0, r4, #0
	bl PlayerProfile_GetTrainerGender
	ldr r1, [sp]
	strb r0, [r1, #4]
	add r0, r4, #0
	bl PlayerProfile_GetTrainerID
	ldr r1, [sp]
	mov r7, #0
	str r0, [r1]
	add r0, r1, #0
	strh r7, [r0, #0x1e]
	ldr r0, [sp, #0xc]
	bl GetPartyCount
	ldr r1, [sp, #4]
	cmp r1, r0
	bge _0202B2C4
_0202B1D0:
	ldr r0, [sp, #0xc]
	ldr r1, [sp, #4]
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r5, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	str r0, [sp, #0x10]
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020741B0
	add r5, r0, #0
	ldr r0, [sp, #8]
	ldr r2, [sp, #0x10]
	add r1, r4, #0
	bl sub_02074364
	ldr r1, [sp]
	mov ip, r0
	lsl r2, r7, #1
	add r1, #0x18
	ldrh r3, [r1, r2]
	ldr r0, _0202B2C8 ; =0xFFFFF000
	and r0, r3
	lsl r3, r5, #0x10
	lsr r5, r3, #0x10
	ldr r3, _0202B2C8 ; =0xFFFFF000
	lsr r3, r3, #0x14
	and r3, r5
	orr r0, r3
	strh r0, [r1, r2]
	ldrh r3, [r1, r2]
	ldr r0, _0202B2CC ; =0xFFFF0FFF
	and r0, r3
	mov r3, ip
	lsl r3, r3, #0x1c
	lsr r3, r3, #0x10
	orr r0, r3
	strh r0, [r1, r2]
	ldrh r1, [r1, r2]
	ldr r2, _0202B2D0 ; =_020F67A4
	mov r0, #0
	lsl r1, r1, #0x14
	lsr r3, r1, #0x14
_0202B248:
	lsl r1, r0, #3
	add r1, r2, r1
	ldrh r5, [r1, #2]
	cmp r5, r3
	bne _0202B29A
	ldrb r5, [r1, #6]
	cmp r4, r5
	bne _0202B29A
	ldr r4, [sp]
	lsl r6, r7, #1
	add r4, #0x18
	ldrh r0, [r4, r6]
	ldr r2, _0202B2C8 ; =0xFFFFF000
	ldrh r1, [r1]
	and r0, r2
	lsr r2, r2, #0x14
	and r1, r2
	orr r0, r1
	strh r0, [r4, r6]
	ldr r0, [sp, #8]
	ldr r2, [sp, #0x10]
	mov r1, #0
	bl sub_02074364
	lsl r0, r0, #0x1c
	ldrh r2, [r4, r6]
	ldr r1, _0202B2CC ; =0xFFFF0FFF
	lsr r0, r0, #0x10
	and r1, r2
	orr r0, r1
	strh r0, [r4, r6]
	ldr r0, [sp]
	add r1, r5, #0
	ldrh r2, [r0, #0x1e]
	lsl r0, r7, #2
	add r0, r7, r0
	lsl r1, r0
	ldr r0, [sp]
	orr r1, r2
	strh r1, [r0, #0x1e]
	b _0202B2A4
_0202B29A:
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #7
	blo _0202B248
_0202B2A4:
	add r0, r7, #1
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	cmp r7, #3
	bhs _0202B2C4
	ldr r0, [sp, #4]
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #4]
	ldr r0, [sp, #0xc]
	bl GetPartyCount
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _0202B1D0
_0202B2C4:
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_0202B2C8: .word 0xFFFFF000
_0202B2CC: .word 0xFFFF0FFF
_0202B2D0: .word _020F67A4
	thumb_func_end Mail_SetNewMessageDetails

	thumb_func_start CreateKenyaMail
CreateKenyaMail: ; 0x0202B2D4
	; Mail * CreateKenyaMail(struct Pokemon * pokemon, u8 type, u8 gender, String * name, u8 otId);
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	mov r0, #3
	add r6, r1, #0
	add r7, r2, #0
	str r3, [sp]
	bl Mail_new
	add r4, r0, #0
	bl Mail_init
	add r1, r4, #0
	ldr r0, [sp]
	strb r6, [r4, #7]
	add r1, #8
	mov r2, #8
	bl CopyStringToU16Array
	strb r7, [r4, #4]
	add r0, sp, #0x10
	ldrb r0, [r0, #0x10]
	; LETTER! Thank you!
	mov r1, #1
	mov r2, #7
	str r0, [r4]
	add r0, r4, #0
	add r0, #0x20
	bl MailMsg_SetMsgBankAndNum
	add r0, r4, #0
	ldr r2, _0202B3D0 ; =0x00000545
	add r0, #0x20
	mov r1, #0
	bl MailMsg_SetFieldI
	add r0, r4, #0
	ldr r2, _0202B3D4 ; =0x0000FFFF
	add r0, #0x20
	mov r1, #1
	bl MailMsg_SetFieldI
	; ADVENTURE was fun, wasn't it?
	add r0, r4, #0
	add r0, #0x28
	mov r1, #1
	mov r2, #0xf
	bl MailMsg_SetMsgBankAndNum
	add r0, r4, #0
	ldr r2, _0202B3D8 ; =0x0000055B
	add r0, #0x28
	mov r1, #0
	bl MailMsg_SetFieldI
	add r0, r4, #0
	ldr r2, _0202B3D4 ; =0x0000FFFF
	add r0, #0x28
	mov r1, #1
	bl MailMsg_SetFieldI
	; ZUBAT was the one thing I wanted to avoid...
	add r0, r4, #0
	add r0, #0x30
	mov r1, #2
	mov r2, #1
	bl MailMsg_SetMsgBankAndNum
	add r0, r4, #0
	add r0, #0x30
	mov r1, #0
	mov r2, #0x29
	bl MailMsg_SetFieldI
	add r0, r4, #0
	ldr r2, _0202B3D4 ; =0x0000FFFF
	add r0, #0x30
	mov r1, #1
	bl MailMsg_SetFieldI
	mov r2, #0
	add r0, r5, #0
	mov r1, #5
	strh r2, [r4, #0x1e]
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r6, r0, #0x10
	add r0, r5, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	add r7, r0, #0
	add r0, r5, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	str r0, [sp, #4]
	add r0, r5, #0
	bl sub_020741B0
	add r5, r0, #0
	ldr r1, [sp, #4]
	add r0, r6, #0
	add r2, r7, #0
	bl sub_02074364
	lsl r3, r5, #0x10
	lsl r0, r0, #0x1c
	ldrh r1, [r4, #0x18]
	ldr r2, _0202B3DC ; =0xFFFFF000
	lsr r3, r3, #0x10
	and r1, r2
	lsr r2, r2, #0x14
	and r2, r3
	orr r1, r2
	strh r1, [r4, #0x18]
	ldrh r2, [r4, #0x18]
	ldr r1, _0202B3E0 ; =0xFFFF0FFF
	lsr r0, r0, #0x10
	and r1, r2
	orr r0, r1
	strh r0, [r4, #0x18]
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0202B3D0: .word 0x00000545
_0202B3D4: .word 0x0000FFFF
_0202B3D8: .word 0x0000055B
_0202B3DC: .word 0xFFFFF000
_0202B3E0: .word 0xFFFF0FFF
	thumb_func_end CreateKenyaMail

	thumb_func_start Mail_GetOTID
Mail_GetOTID: ; 0x0202B3E4
	ldr r0, [r0]
	bx lr
	thumb_func_end Mail_GetOTID

	thumb_func_start Mail_GetAuthorNamePtr
Mail_GetAuthorNamePtr: ; 0x0202B3E8
	add r0, #8
	bx lr
	thumb_func_end Mail_GetAuthorNamePtr

	thumb_func_start Mail_GetAuthorGender
Mail_GetAuthorGender: ; 0x0202B3EC
	ldrb r0, [r0, #4]
	bx lr
	thumb_func_end Mail_GetAuthorGender

	thumb_func_start Mail_GetType
Mail_GetType: ; 0x0202B3F0
	ldrb r0, [r0, #7]
	bx lr
	thumb_func_end Mail_GetType

	thumb_func_start Mail_SetType
Mail_SetType: ; 0x0202B3F4
	cmp r1, #0xc
	bhs _0202B3FA
	strb r1, [r0, #7]
_0202B3FA:
	bx lr
	thumb_func_end Mail_SetType

	thumb_func_start Mail_GetLanguage
Mail_GetLanguage: ; 0x0202B3FC
	ldrb r0, [r0, #5]
	bx lr
	thumb_func_end Mail_GetLanguage

	thumb_func_start Mail_GetVersion
Mail_GetVersion: ; 0x0202B400
	ldrb r0, [r0, #6]
	bx lr
	thumb_func_end Mail_GetVersion

	thumb_func_start sub_0202B404
sub_0202B404: ; 0x0202B404
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r2, #0
	cmp r1, #3
	bhs _0202B4C0
	lsl r2, r1, #1
	add r0, r0, r2
	ldrh r5, [r0, #0x18]
	lsl r6, r1, #2
	add r1, r1, r6
	add r0, sp, #0
	strh r5, [r0]
	asr r3, r1
	lsl r5, r5, #0x14
	mov r1, #0x1f
	ldr r2, _0202B4C8 ; =_020F67A4
	mov r0, #0
	lsr r5, r5, #0x14
	and r3, r1
_0202B42A:
	ldrh r1, [r2]
	cmp r5, r1
	bne _0202B46C
	ldrb r1, [r2, #6]
	cmp r1, r3
	bne _0202B46C
	add r3, sp, #0
	lsl r1, r0, #3
	ldr r5, _0202B4CC ; =_020F67A6
	ldrh r0, [r3]
	ldr r2, _0202B4D0 ; =0xFFFFF000
	ldrh r5, [r5, r1]
	and r0, r2
	lsr r2, r2, #0x14
	and r2, r5
	orr r0, r2
	strh r0, [r3]
	ldr r0, _0202B4D4 ; =_020F67A8
	ldr r2, _0202B4D8 ; =_020F67AA
	ldrh r0, [r0, r1]
	ldrb r1, [r2, r1]
	mov r2, #0
	bl sub_02074364
	add r2, sp, #0
	lsl r0, r0, #0x1c
	ldrh r3, [r2]
	ldr r1, _0202B4DC ; =0xFFFF0FFF
	lsr r0, r0, #0x10
	and r1, r3
	orr r0, r1
	strh r0, [r2]
	b _0202B474
_0202B46C:
	add r0, r0, #1
	add r2, #8
	cmp r0, #7
	blo _0202B42A
_0202B474:
	add r1, sp, #0
	ldrh r2, [r1]
	lsl r0, r2, #0x14
	lsr r3, r0, #0x14
	ldr r0, _0202B4E0 ; =0x00000222
	cmp r3, r0
	bls _0202B494
	ldr r0, _0202B4D0 ; =0xFFFFF000
	and r2, r0
	mov r0, #7
	orr r0, r2
	strh r0, [r1]
	ldrh r2, [r1]
	ldr r0, _0202B4DC ; =0xFFFF0FFF
	and r0, r2
	strh r0, [r1]
_0202B494:
	cmp r4, #0
	beq _0202B4A0
	cmp r4, #1
	beq _0202B4AC
	cmp r4, #2
	b _0202B4B8
_0202B4A0:
	add r0, sp, #0
	ldrh r0, [r0]
	add sp, #4
	lsl r0, r0, #0x14
	lsr r0, r0, #0x14
	pop {r3, r4, r5, r6, pc}
_0202B4AC:
	add r0, sp, #0
	ldrh r0, [r0]
	add sp, #4
	lsl r0, r0, #0x10
	lsr r0, r0, #0x1c
	pop {r3, r4, r5, r6, pc}
_0202B4B8:
	add r0, sp, #0
	add sp, #4
	ldrh r0, [r0]
	pop {r3, r4, r5, r6, pc}
_0202B4C0:
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_0202B4C8: .word _020F67A4
_0202B4CC: .word _020F67A6
_0202B4D0: .word 0xFFFFF000
_0202B4D4: .word _020F67A8
_0202B4D8: .word _020F67AA
_0202B4DC: .word 0xFFFF0FFF
_0202B4E0: .word 0x00000222
	thumb_func_end sub_0202B404

	thumb_func_start sub_0202B4E4
sub_0202B4E4: ; 0x0202B4E4
	ldrh r0, [r0, #0x1e]
	bx lr
	thumb_func_end sub_0202B4E4

	thumb_func_start Mail_GetUnk20Array
Mail_GetUnk20Array: ; 0x0202B4E8
	cmp r1, #3
	bhs _0202B4F4
	add r0, #0x20
	lsl r1, r1, #3
	add r0, r0, r1
	bx lr
_0202B4F4:
	add r0, #0x20
	bx lr
	thumb_func_end Mail_GetUnk20Array

	thumb_func_start Mail_CopyToUnk20Array
Mail_CopyToUnk20Array: ; 0x0202B4F8
	push {r3, lr}
	cmp r2, #3
	bhs _0202B508
	add r0, #0x20
	lsl r2, r2, #3
	add r0, r0, r2
	bl MailMsg_copy
_0202B508:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end Mail_CopyToUnk20Array

	thumb_func_start Sav2_Mailbox_get
Sav2_Mailbox_get: ; 0x0202B50C
	ldr r3, _0202B514 ; =SavArray_get
	mov r1, #0xd
	bx r3
	nop
_0202B514: .word SavArray_get
	thumb_func_end Sav2_Mailbox_get

	thumb_func_start Sav2_Mailbox_sizeof
Sav2_Mailbox_sizeof: ; 0x0202B518
	mov r0, #0x46
	lsl r0, r0, #4
	bx lr
	.balign 4, 0
	thumb_func_end Sav2_Mailbox_sizeof

	thumb_func_start Sav2_Mailbox_init
Sav2_Mailbox_init: ; 0x0202B520
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0202B526:
	add r0, r5, #0
	bl Mail_init
	add r4, r4, #1
	add r5, #0x38
	cmp r4, #0x14
	blt _0202B526
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end Sav2_Mailbox_init

	thumb_func_start Mailbox_GetFirstEmptySlotIdx
Mailbox_GetFirstEmptySlotIdx: ; 0x0202B538
	ldr r3, _0202B540 ; =MailArray_GetFirstEmptySlotIdx
	mov r1, #0x14
	bx r3
	nop
_0202B540: .word MailArray_GetFirstEmptySlotIdx
	thumb_func_end Mailbox_GetFirstEmptySlotIdx

	thumb_func_start Mailbox_DeleteSlotI
Mailbox_DeleteSlotI: ; 0x0202B544
	push {r3, lr}
	bl Mailbox_GetPtrToSlotI
	cmp r0, #0
	beq _0202B552
	bl Mail_init
_0202B552:
	pop {r3, pc}
	thumb_func_end Mailbox_DeleteSlotI

	thumb_func_start Mailbox_CopyMailToSlotI
Mailbox_CopyMailToSlotI: ; 0x0202B554
	push {r4, lr}
	add r4, r3, #0
	bl Mailbox_GetPtrToSlotI
	add r1, r0, #0
	beq _0202B566
	add r0, r4, #0
	bl Mail_copy
_0202B566:
	pop {r4, pc}
	thumb_func_end Mailbox_CopyMailToSlotI

	thumb_func_start Mailbox_CountMessages
Mailbox_CountMessages: ; 0x0202B568
	ldr r3, _0202B570 ; =MailArray_CountMessages
	mov r1, #0x14
	bx r3
	nop
_0202B570: .word MailArray_CountMessages
	thumb_func_end Mailbox_CountMessages

	thumb_func_start Mailbox_AllocAndFetchMailI
Mailbox_AllocAndFetchMailI: ; 0x0202B574
	push {r3, r4, r5, lr}
	add r5, r3, #0
	bl Mailbox_GetPtrToSlotI
	add r4, r0, #0
	add r0, r5, #0
	bl Mail_new
	add r5, r0, #0
	cmp r4, #0
	beq _0202B592
	add r0, r4, #0
	add r1, r5, #0
	bl Mail_copy
_0202B592:
	add r0, r5, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end Mailbox_AllocAndFetchMailI

	thumb_func_start Mailbox_FetchMailToBuffer
Mailbox_FetchMailToBuffer: ; 0x0202B598
	push {r4, lr}
	add r4, r3, #0
	bl Mailbox_GetPtrToSlotI
	cmp r0, #0
	bne _0202B5AC
	add r0, r4, #0
	bl Mail_init
	pop {r4, pc}
_0202B5AC:
	add r1, r4, #0
	bl Mail_copy
	pop {r4, pc}
	thumb_func_end Mailbox_FetchMailToBuffer

	thumb_func_start MailArray_GetFirstEmptySlotIdx
MailArray_GetFirstEmptySlotIdx: ; 0x0202B5B4
	push {r4, r5, r6, lr}
	add r6, r1, #0
	add r5, r0, #0
	mov r4, #0
	cmp r6, #0
	ble _0202B5D6
_0202B5C0:
	add r0, r5, #0
	bl Mail_TypeIsValid
	cmp r0, #0
	bne _0202B5CE
	add r0, r4, #0
	pop {r4, r5, r6, pc}
_0202B5CE:
	add r4, r4, #1
	add r5, #0x38
	cmp r4, r6
	blt _0202B5C0
_0202B5D6:
	mov r0, #0
	mvn r0, r0
	pop {r4, r5, r6, pc}
	thumb_func_end MailArray_GetFirstEmptySlotIdx

	thumb_func_start MailArray_CountMessages
MailArray_CountMessages: ; 0x0202B5DC
	push {r3, r4, r5, r6, r7, lr}
	mov r4, #0
	add r7, r1, #0
	add r5, r0, #0
	add r6, r4, #0
	cmp r7, #0
	ble _0202B5FE
_0202B5EA:
	add r0, r5, #0
	bl Mail_TypeIsValid
	cmp r0, #0
	beq _0202B5F6
	add r4, r4, #1
_0202B5F6:
	add r6, r6, #1
	add r5, #0x38
	cmp r6, r7
	blt _0202B5EA
_0202B5FE:
	add r0, r4, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end MailArray_CountMessages

	thumb_func_start Mailbox_GetPtrToSlotI
Mailbox_GetPtrToSlotI: ; 0x0202B604
	cmp r2, #0x14
	bge _0202B610
	mov r1, #0x38
	mul r1, r2
	add r0, r0, r1
	bx lr
_0202B610:
	mov r0, #0
	bx lr
	thumb_func_end Mailbox_GetPtrToSlotI
