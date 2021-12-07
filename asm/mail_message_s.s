	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

	.public _020F60E0
	.public MailMsg_NumFields

	.text

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
