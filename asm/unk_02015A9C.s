	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020F6120:
	.byte 0x01
_020F6121:
	.byte 0x00, 0x02, 0x01, 0x03, 0x02, 0x04, 0x03, 0x05, 0x04, 0x07, 0x05
_020F612C:
	.byte 0xED, 0x00, 0xEF, 0x02
	.byte 0xDF, 0x02, 0xD1, 0x02, 0x1D, 0x01, 0x1E, 0x01, 0x1F, 0x01, 0x20, 0x01, 0x21, 0x01, 0x22, 0x01
	.byte 0x23, 0x01
_020F6142:
	.byte 0xF0, 0x01, 0xD4, 0x01, 0x12, 0x00, 0x7C, 0x00, 0x26, 0x00, 0x26, 0x00, 0x6B, 0x00
	.byte 0x68, 0x00, 0x2F, 0x00, 0x20, 0x00, 0x17, 0x00, 0xF8, 0x60, 0x0F, 0x02, 0x02, 0x00, 0x00, 0x00
	.byte 0xEC, 0x60, 0x0F, 0x02, 0x02, 0x00, 0x00, 0x00, 0x14, 0x61, 0x0F, 0x02, 0x02, 0x00, 0x00, 0x00
	.byte 0x18, 0x61, 0x0F, 0x02, 0x04, 0x00, 0x00, 0x00, 0x0C, 0x61, 0x0F, 0x02, 0x02, 0x00, 0x00, 0x00
	.byte 0x08, 0x61, 0x0F, 0x02, 0x02, 0x00, 0x00, 0x00, 0xF4, 0x60, 0x0F, 0x02, 0x02, 0x00, 0x00, 0x00
	.byte 0xF0, 0x60, 0x0F, 0x02, 0x02, 0x00, 0x00, 0x00, 0xFC, 0x60, 0x0F, 0x02, 0x02, 0x00, 0x00, 0x00
	.byte 0x10, 0x61, 0x0F, 0x02, 0x02, 0x00, 0x00, 0x00, 0x04, 0x61, 0x0F, 0x02, 0x02, 0x00, 0x00, 0x00
	.byte 0x00, 0x61, 0x0F, 0x02, 0x02, 0x00, 0x00, 0x00

	.text

	thumb_func_start EasyChatManager_new
EasyChatManager_new: ; 0x02015A9C
	push {r3, r4, r5, r6, r7, lr}
	mov r1, #0x30
	add r6, r0, #0
	bl AllocFromHeap
	ldr r4, _02015AD0 ; =_020F612C
	str r0, [sp]
	mov r7, #0
	add r5, r0, #0
_02015AAE:
	ldr r0, [sp]
	mov r1, #0x1b
	str r6, [r0]
	ldrh r2, [r4]
	mov r0, #1
	add r3, r6, #0
	bl NewMsgDataFromNarc
	str r0, [r5, #4]
	add r7, r7, #1
	add r4, r4, #2
	add r5, r5, #4
	cmp r7, #0xb
	blt _02015AAE
	ldr r0, [sp]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02015AD0: .word _020F612C
	thumb_func_end EasyChatManager_new

	thumb_func_start EasyChatManager_delete
EasyChatManager_delete: ; 0x02015AD4
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_02015ADC:
	ldr r0, [r5, #4]
	bl DestroyMsgData
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, #0xb
	blt _02015ADC
	add r0, r6, #0
	bl FreeToHeap
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end EasyChatManager_delete

	thumb_func_start EasyChatManager_ReadWordIntoString
EasyChatManager_ReadWordIntoString: ; 0x02015AF4
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r2, #0
	add r0, r1, #0
	add r1, sp, #4
	add r2, sp, #0
	bl GetCategoryAndMsgNoByECWordIdx
	ldr r0, [sp, #4]
	ldr r1, [sp]
	lsl r0, r0, #2
	add r0, r5, r0
	ldr r0, [r0, #4]
	add r2, r4, #0
	bl ReadMsgDataIntoString
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end EasyChatManager_ReadWordIntoString

	thumb_func_start GetECWordIntoStringByIndex
GetECWordIntoStringByIndex: ; 0x02015B1C
	push {r3, r4, lr}
	sub sp, #0xc
	add r4, r1, #0
	ldr r1, _02015B58 ; =0x0000FFFF
	cmp r0, r1
	beq _02015B4C
	add r1, sp, #8
	add r2, sp, #4
	bl GetCategoryAndMsgNoByECWordIdx
	ldr r0, [sp, #8]
	mov r3, #0
	lsl r1, r0, #1
	ldr r0, _02015B5C ; =_020F612C
	ldrh r0, [r0, r1]
	str r0, [sp, #8]
	str r4, [sp]
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	mov r0, #0x1b
	bl ReadMsgData_NewNarc_ExistingString
	add sp, #0xc
	pop {r3, r4, pc}
_02015B4C:
	add r0, r4, #0
	bl StringSetEmpty
	add sp, #0xc
	pop {r3, r4, pc}
	nop
_02015B58: .word 0x0000FFFF
_02015B5C: .word _020F612C
	thumb_func_end GetECWordIntoStringByIndex

	thumb_func_start GetECWordIndexByPair
GetECWordIndexByPair: ; 0x02015B60
	push {r4, r5}
	ldr r4, _02015BA4 ; =_020F612C
	mov r2, #0
_02015B66:
	ldrh r3, [r4]
	cmp r0, r3
	bne _02015B94
	mov r4, #0
	add r3, r4, #0
	cmp r2, #0
	bls _02015B8A
	ldr r0, _02015BA8 ; =_020F6142
_02015B76:
	lsl r5, r4, #1
	ldrh r5, [r0, r5]
	add r4, r4, #1
	lsl r4, r4, #0x10
	add r3, r3, r5
	lsl r3, r3, #0x10
	lsr r4, r4, #0x10
	lsr r3, r3, #0x10
	cmp r4, r2
	blo _02015B76
_02015B8A:
	add r0, r3, r1
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5}
	bx lr
_02015B94:
	add r2, r2, #1
	add r4, r4, #2
	cmp r2, #0xb
	blo _02015B66
	ldr r0, _02015BAC ; =0x0000FFFF
	pop {r4, r5}
	bx lr
	nop
_02015BA4: .word _020F612C
_02015BA8: .word _020F6142
_02015BAC: .word 0x0000FFFF
	thumb_func_end GetECWordIndexByPair

	thumb_func_start GetCategoryAndMsgNoByECWordIdx
GetCategoryAndMsgNoByECWordIdx: ; 0x02015BB0
	push {r3, r4, r5, r6}
	ldr r3, _02015BE8 ; =0x00000FFF
	ldr r6, _02015BEC ; =_020F6142
	and r3, r0
	mov r0, #0
	add r5, r0, #0
_02015BBC:
	ldrh r4, [r6]
	add r0, r0, r4
	cmp r3, r0
	bhs _02015BD8
	str r5, [r1]
	ldr r1, _02015BEC ; =_020F6142
	lsl r4, r5, #1
	ldrh r1, [r1, r4]
	sub r0, r0, r1
	sub r0, r3, r0
	str r0, [r2]
	mov r0, #1
	pop {r3, r4, r5, r6}
	bx lr
_02015BD8:
	add r5, r5, #1
	add r6, r6, #2
	cmp r5, #0xb
	blo _02015BBC
	mov r0, #0
	pop {r3, r4, r5, r6}
	bx lr
	nop
_02015BE8: .word 0x00000FFF
_02015BEC: .word _020F6142
	thumb_func_end GetCategoryAndMsgNoByECWordIdx

	thumb_func_start sub_02015BF0
sub_02015BF0: ; 0x02015BF0
	mov r0, #8
	bx lr
	thumb_func_end sub_02015BF0

	thumb_func_start sub_02015BF4
sub_02015BF4: ; 0x02015BF4
	push {r3, lr}
	mov r2, #0
	str r2, [r0]
	ldr r3, _02015C20 ; =_020F6120
	str r2, [r0, #4]
_02015BFE:
	ldrb r1, [r3]
	cmp r1, #2
	bne _02015C10
	ldr r1, _02015C24 ; =_020F6121
	lsl r2, r2, #1
	ldrb r1, [r1, r2]
	bl sub_02015CFC
	b _02015C18
_02015C10:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #6
	blo _02015BFE
_02015C18:
	mov r0, #0x1e
	bl sub_0202893C
	pop {r3, pc}
	.balign 4, 0
_02015C20: .word _020F6120
_02015C24: .word _020F6121
	thumb_func_end sub_02015BF4

	thumb_func_start sub_02015C28
sub_02015C28: ; 0x02015C28
	push {r4, lr}
	add r4, r0, #0
	mov r0, #0x1e
	bl sub_02028900
	add r0, r4, #0
	mov r1, #0x1e
	bl SavArray_get
	pop {r4, pc}
	thumb_func_end sub_02015C28

	thumb_func_start sub_02015C3C
sub_02015C3C: ; 0x02015C3C
	ldr r0, [r0, #4]
	add r2, r0, #0
	lsr r2, r1
	mov r0, #1
	and r0, r2
	bx lr
	thumb_func_end sub_02015C3C

	thumb_func_start sub_02015C48
sub_02015C48: ; 0x02015C48
	push {r3, r4, r5, lr}
	add r4, r0, #0
	mov r2, #0
	ldr r3, [r4, #4]
	add r5, r2, #0
	mov r0, #1
_02015C54:
	add r1, r3, #0
	lsr r1, r2
	tst r1, r0
	bne _02015C5E
	add r5, r5, #1
_02015C5E:
	add r2, r2, #1
	cmp r2, #0x20
	blo _02015C54
	cmp r5, #0
	beq _02015CA0
	bl LCRandom
	add r1, r5, #0
	bl _u32_div_f
	ldr r3, [r4, #4]
	mov r5, #0
	mov r0, #1
_02015C78:
	add r2, r3, #0
	lsr r2, r5
	tst r2, r0
	bne _02015C9A
	cmp r1, #0
	bne _02015C98
	mov r0, #1
	ldr r1, [r4, #4]
	lsl r0, r5
	orr r0, r1
	str r0, [r4, #4]
	mov r0, #0x1e
	bl sub_0202893C
	add r0, r5, #0
	pop {r3, r4, r5, pc}
_02015C98:
	sub r1, r1, #1
_02015C9A:
	add r5, r5, #1
	cmp r5, #0x20
	blo _02015C78
_02015CA0:
	mov r0, #0x1e
	bl sub_0202893C
	mov r0, #0x20
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02015C48

	thumb_func_start sub_02015CAC
sub_02015CAC: ; 0x02015CAC
	ldr r3, [r0, #4]
	mov r2, #0
	mov r0, #1
_02015CB2:
	add r1, r3, #0
	lsr r1, r2
	tst r1, r0
	bne _02015CBE
	mov r0, #0
	bx lr
_02015CBE:
	add r2, r2, #1
	cmp r2, #0x20
	blo _02015CB2
	mov r0, #1
	bx lr
	thumb_func_end sub_02015CAC

	thumb_func_start sub_02015CC8
sub_02015CC8: ; 0x02015CC8
	push {r3, r4}
	mov r3, #0
	ldr r4, _02015CEC ; =_020F6142
	add r2, r3, #0
_02015CD0:
	ldrh r1, [r4]
	add r2, r2, #1
	add r4, r4, #2
	add r1, r3, r1
	lsl r1, r1, #0x10
	lsr r3, r1, #0x10
	cmp r2, #9
	blt _02015CD0
	add r0, r3, r0
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4}
	bx lr
	nop
_02015CEC: .word _020F6142
	thumb_func_end sub_02015CC8

	thumb_func_start sub_02015CF0
sub_02015CF0: ; 0x02015CF0
	ldr r0, [r0]
	add r2, r0, #0
	lsr r2, r1
	mov r0, #1
	and r0, r2
	bx lr
	thumb_func_end sub_02015CF0

	thumb_func_start sub_02015CFC
sub_02015CFC: ; 0x02015CFC
	mov r2, #1
	ldr r3, [r0]
	lsl r2, r1
	add r1, r3, #0
	orr r1, r2
	str r1, [r0]
	ldr r3, _02015D10 ; =sub_0202893C
	mov r0, #0x1e
	bx r3
	nop
_02015D10: .word sub_0202893C
	thumb_func_end sub_02015CFC
