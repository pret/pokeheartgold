	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start MailMsg_init
MailMsg_init: ; 0x0201581C
	ldr r1, _02015830 ; =0x0000FFFF
	mov r2, #0
	strh r1, [r0]
_02015822:
	add r2, r2, #1
	strh r1, [r0, #4]
	add r0, r0, #2
	cmp r2, #2
	blt _02015822
	bx lr
	nop
_02015830: .word 0x0000FFFF
	thumb_func_end MailMsg_init

	thumb_func_start MailMsg_init_withBank
MailMsg_init_withBank: ; 0x02015834
	strh r1, [r0]
	mov r2, #0
	ldr r1, _02015848 ; =0x0000FFFF
	strh r2, [r0, #2]
_0201583C:
	add r2, r2, #1
	strh r1, [r0, #4]
	add r0, r0, #2
	cmp r2, #2
	blt _0201583C
	bx lr
	.balign 4, 0
_02015848: .word 0x0000FFFF
	thumb_func_end MailMsg_init_withBank

	thumb_func_start MailMsg_init_default
MailMsg_init_default: ; 0x0201584C
	push {r4, lr}
	mov r1, #4
	add r4, r0, #0
	bl MailMsg_init_withBank
	mov r0, #5
	strh r0, [r4, #2]
	pop {r4, pc}
	thumb_func_end MailMsg_init_default

	thumb_func_start MailMsg_init_fromTemplate
MailMsg_init_fromTemplate: ; 0x0201585C
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4]
	add r5, r0, #0
	bl MailMsg_init_withBank
	ldrb r0, [r4, #1]
	strh r0, [r5, #2]
	mov r0, #2
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _02015880
	bl sub_02015DC8
	ldrh r1, [r4, #4]
	bl GetECWordIndexByPair
	strh r0, [r5, #4]
_02015880:
	mov r0, #3
	ldrsb r0, [r4, r0]
	cmp r0, #0
	ble _02015894
	bl sub_02015DC8
	ldrh r1, [r4, #6]
	bl GetECWordIndexByPair
	strh r0, [r5, #6]
_02015894:
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end MailMsg_init_fromTemplate

	thumb_func_start MailMsg_GetExpandedString
MailMsg_GetExpandedString: ; 0x02015898
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	str r0, [sp]
	add r0, r1, #0
	str r1, [sp, #4]
	bl ScrStrBufs_new
	ldr r5, [sp]
	ldr r7, _020158FC ; =0x0000FFFF
	add r6, r0, #0
	mov r4, #0
_020158AE:
	ldrh r2, [r5, #4]
	cmp r2, r7
	beq _020158C4
	add r0, r6, #0
	add r1, r4, #0
	bl sub_0200C528
	add r4, r4, #1
	add r5, r5, #2
	cmp r4, #2
	blt _020158AE
_020158C4:
	ldr r2, [sp]
	mov r0, #1
	ldrh r2, [r2]
	mov r1, #0x1b
	lsl r3, r2, #1
	ldr r2, _02015900 ; =0x020F60E0
	ldrh r2, [r2, r3]
	ldr r3, [sp, #4]
	bl NewMsgDataFromNarc
	add r5, r0, #0
	ldr r2, [sp]
	ldr r3, [sp, #4]
	ldrh r2, [r2, #2]
	add r0, r6, #0
	add r1, r5, #0
	bl ReadMsgData_ExpandPlaceholders
	add r4, r0, #0
	add r0, r5, #0
	bl DestroyMsgData
	add r0, r6, #0
	bl ScrStrBufs_delete
	add r0, r4, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020158FC: .word 0x0000FFFF
_02015900: .word 0x020F60E0
	thumb_func_end MailMsg_GetExpandedString

	thumb_func_start MailMsg_GetRawString
MailMsg_GetRawString: ; 0x02015904
	push {r4, lr}
	add r4, r0, #0
	add r3, r1, #0
	ldrh r1, [r4]
	mov r0, #0x1b
	lsl r2, r1, #1
	ldr r1, _0201591C ; =0x020F60E0
	ldrh r1, [r1, r2]
	ldrh r2, [r4, #2]
	bl ReadMsgData_NewNarc_NewString
	pop {r4, pc}
	.balign 4, 0
_0201591C: .word 0x020F60E0
	thumb_func_end MailMsg_GetRawString

	thumb_func_start MailMsg_IsInit
MailMsg_IsInit: ; 0x02015920
	ldrh r1, [r0]
	ldr r0, _02015930 ; =0x0000FFFF
	cmp r1, r0
	beq _0201592C
	mov r0, #1
	bx lr
_0201592C:
	mov r0, #0
	bx lr
	.balign 4, 0
_02015930: .word 0x0000FFFF
	thumb_func_end MailMsg_IsInit

	thumb_func_start MailMsg_AllFieldsAreInit
MailMsg_AllFieldsAreInit: ; 0x02015934
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	bl MailMsg_NumFields
	mov r3, #0
	cmp r0, #0
	bls _0201595A
	ldr r1, _02015960 ; =0x0000FFFF
_02015948:
	ldrh r2, [r4, #4]
	cmp r2, r1
	bne _02015952
	mov r0, #0
	pop {r4, pc}
_02015952:
	add r3, r3, #1
	add r4, r4, #2
	cmp r3, r0
	blo _02015948
_0201595A:
	mov r0, #1
	pop {r4, pc}
	nop
_02015960: .word 0x0000FFFF
	thumb_func_end MailMsg_AllFieldsAreInit

	thumb_func_start MailMsg_NumFields
MailMsg_NumFields: ; 0x02015964
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	cmp r5, #5
	blo _02015972
	bl GF_AssertFail
_02015972:
	add r0, r5, #0
	bl MailMsg_NumMsgsInBank
	cmp r4, r0
	blo _02015980
	bl GF_AssertFail
_02015980:
	ldr r1, _020159D4 ; =0x020F60E0
	lsl r2, r5, #1
	ldrh r1, [r1, r2]
	mov r0, #0x1b
	add r2, r4, #0
	mov r3, #0
	bl ReadMsgData_NewNarc_NewString
	str r0, [sp]
	bl String_c_str
	add r4, r0, #0
	ldrh r1, [r4]
	ldr r0, _020159D8 ; =0x0000FFFF
	mov r5, #0
	cmp r1, r0
	beq _020159C8
	add r7, r0, #0
	sub r6, r0, #1
_020159A6:
	cmp r1, r6
	bne _020159C0
	add r0, r4, #0
	bl MsgArray_ControlCodeIsStrVar
	cmp r0, #0
	beq _020159B6
	add r5, r5, #1
_020159B6:
	add r0, r4, #0
	bl MsgArray_SkipControlCode
	add r4, r0, #0
	b _020159C2
_020159C0:
	add r4, r4, #2
_020159C2:
	ldrh r1, [r4]
	cmp r1, r7
	bne _020159A6
_020159C8:
	ldr r0, [sp]
	bl String_dtor
	add r0, r5, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020159D4: .word 0x020F60E0
_020159D8: .word 0x0000FFFF
	thumb_func_end MailMsg_NumFields

	thumb_func_start MailMsg_GetFieldI
MailMsg_GetFieldI: ; 0x020159DC
	lsl r1, r1, #1
	add r0, r0, r1
	ldrh r0, [r0, #4]
	bx lr
	thumb_func_end MailMsg_GetFieldI

	thumb_func_start MailMsg_GetMsgBank
MailMsg_GetMsgBank: ; 0x020159E4
	ldrh r0, [r0]
	bx lr
	thumb_func_end MailMsg_GetMsgBank

	thumb_func_start MailMsg_GetMsgNo
MailMsg_GetMsgNo: ; 0x020159E8
	ldrh r0, [r0, #2]
	bx lr
	thumb_func_end MailMsg_GetMsgNo

	thumb_func_start MailMsg_compare
MailMsg_compare: ; 0x020159EC
	push {r3, r4}
	ldrh r3, [r0]
	ldrh r2, [r1]
	cmp r3, r2
	bne _020159FE
	ldrh r3, [r0, #2]
	ldrh r2, [r1, #2]
	cmp r3, r2
	beq _02015A04
_020159FE:
	mov r0, #0
	pop {r3, r4}
	bx lr
_02015A04:
	mov r4, #0
_02015A06:
	ldrh r3, [r0, #4]
	ldrh r2, [r1, #4]
	cmp r3, r2
	beq _02015A14
	mov r0, #0
	pop {r3, r4}
	bx lr
_02015A14:
	add r4, r4, #1
	add r1, r1, #2
	add r0, r0, #2
	cmp r4, #2
	blt _02015A06
	mov r0, #1
	pop {r3, r4}
	bx lr
	thumb_func_end MailMsg_compare

	thumb_func_start MailMsg_copy
MailMsg_copy: ; 0x02015A24
	ldrh r2, [r1]
	strh r2, [r0]
	ldrh r2, [r1, #2]
	strh r2, [r0, #2]
	ldrh r2, [r1, #4]
	strh r2, [r0, #4]
	ldrh r1, [r1, #6]
	strh r1, [r0, #6]
	bx lr
	.balign 4, 0
	thumb_func_end MailMsg_copy

	thumb_func_start MailMsg_NumMsgsInBank
MailMsg_NumMsgsInBank: ; 0x02015A38
	cmp r0, #5
	bhs _02015A40
	mov r0, #0x14
	bx lr
_02015A40:
	mov r0, #0
	bx lr
	thumb_func_end MailMsg_NumMsgsInBank

	thumb_func_start MailMsg_SetMsgBankAndNum
MailMsg_SetMsgBankAndNum: ; 0x02015A44
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #5
	blo _02015A54
	bl GF_AssertFail
_02015A54:
	strh r4, [r5]
	strh r6, [r5, #2]
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end MailMsg_SetMsgBankAndNum

	thumb_func_start MailMsg_SetFieldI
MailMsg_SetFieldI: ; 0x02015A5C
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	add r6, r2, #0
	cmp r4, #2
	blo _02015A6C
	bl GF_AssertFail
_02015A6C:
	lsl r0, r4, #1
	add r0, r5, r0
	strh r6, [r0, #4]
	pop {r4, r5, r6, pc}
	thumb_func_end MailMsg_SetFieldI

	thumb_func_start MailMsg_SetTrailingFieldsEmpty
MailMsg_SetTrailingFieldsEmpty: ; 0x02015A74
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4]
	ldrh r1, [r4, #2]
	bl MailMsg_NumFields
	cmp r0, #2
	bhs _02015A94
	lsl r1, r0, #1
	add r2, r4, r1
	ldr r1, _02015A98 ; =0x0000FFFF
_02015A8A:
	add r0, r0, #1
	strh r1, [r2, #4]
	add r2, r2, #2
	cmp r0, #2
	blo _02015A8A
_02015A94:
	pop {r4, pc}
	nop
_02015A98: .word 0x0000FFFF
	thumb_func_end MailMsg_SetTrailingFieldsEmpty
