	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

	.public _020F67A4
_020F67A4:
	.short 0x01EE, 0x021C, 0x01E7, 0x0001
	.short 0x01F3, 0x021D, 0x01EC, 0x0001
	.short 0x01E6, 0x021E, 0x01DF, 0x0001
	.short 0x01E6, 0x021F, 0x01DF, 0x0002
	.short 0x01E6, 0x0220, 0x01DF, 0x0003
	.short 0x01E6, 0x0221, 0x01DF, 0x0004
	.short 0x01E6, 0x0222, 0x01DF, 0x0005

	.text

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
	ldr r5, _0202B4CC ; =_020F67A4 + 2
	ldrh r0, [r3]
	ldr r2, _0202B4D0 ; =0xFFFFF000
	ldrh r5, [r5, r1]
	and r0, r2
	lsr r2, r2, #0x14
	and r2, r5
	orr r0, r2
	strh r0, [r3]
	ldr r0, _0202B4D4 ; =_020F67A4 + 4
	ldr r2, _0202B4D8 ; =_020F67A4 + 6
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
_0202B4CC: .word _020F67A4 + 2
_0202B4D0: .word 0xFFFFF000
_0202B4D4: .word _020F67A4 + 4
_0202B4D8: .word _020F67A4 + 6
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
