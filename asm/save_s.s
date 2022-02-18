	.include "asm/macros.inc"
	.include "global.inc"

	.bss

	.public _021D2228
	.public saveWritten

	.rodata

	.public _020F64C4
    .public _020F6460
    .public _020F6464
    .public _020F645C

	.text

	.public sub_020274E4
	.public sub_020274F4
	.public sub_020275B4
	.public sub_020275B8
	.public sub_020275BC
	.public SavArray_CalcCRC16MinusFooter
	.public GetChunkOffsetFromCurrentSaveSlot
	.public sub_020275F4
	.public sub_0202761C
	.public sub_0202768C
	.public sub_020276C0
	.public sub_0202770C
	.public sub_02027744
	.public sub_020277BC
	.public sub_02027ABC
	.public sub_02027B74
	.public sub_02027BAC
	.public sub_02027BDC
	.public sub_02027C18
	.public sub_02027CEC
	.public sub_02027E30
	.public CreateChunkFooter
	.public ValidateChunk
	.public sub_020280DC
	.public FlashWriteChunkInternal
	.public WaitFlashWrite

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
	bl GetChunkOffsetFromCurrentSaveSlot
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
	bl GetChunkOffsetFromCurrentSaveSlot
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
	bl SavArray_CalcCRC16MinusFooter
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
