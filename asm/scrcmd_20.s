	.include "asm/macros.inc"
	.include "global.inc"

	.rodata

_020FC224:
	.byte 0x00, 0x01, 0x02, 0x03, 0x04

	.text

	thumb_func_start ScrCmd_NopVar490
ScrCmd_NopVar490: ; 0x0204EE20
	; Essentially a nop
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_NopVar490

	thumb_func_start ScrCmd_491
ScrCmd_491: ; 0x0204EE38
	; Essentially a nop
	push {r4, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_491

	thumb_func_start ScrCmd_628
ScrCmd_628: ; 0x0204EE50
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r6, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02030AE8
	mov r2, #0
	add r1, sp, #8
	strb r2, [r1]
	lsl r2, r5, #2
	add r2, r4, r2
	lsl r2, r2, #0x18
	mov r1, #0xa
	lsr r2, r2, #0x18
	add r3, sp, #8
	bl sub_02030AA4
	cmp r4, #3
	bne _0204EECC
	cmp r5, #0
	bne _0204EEAA
	mov r7, #0x66
	b _0204EEAC
_0204EEAA:
	mov r7, #0x68
_0204EEAC:
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203107C
	str r0, [sp]
	add r0, r7, #0
	bl sub_0205C268
	add r2, r0, #0
	ldr r0, [sp]
	add r1, r7, #0
	mov r3, #0
	bl sub_02031108
_0204EECC:
	add r0, r6, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_0203107C
	add r7, r0, #0
	lsl r0, r5, #0x18
	lsl r1, r4, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl sub_0205BFF0
	str r0, [sp, #4]
	lsl r0, r5, #0x18
	lsl r1, r4, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl sub_0205BFF0
	bl sub_0205C268
	add r2, r0, #0
	ldr r1, [sp, #4]
	add r0, r7, #0
	mov r3, #0
	bl sub_02031108
	add r6, #0x80
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	bl sub_0203107C
	add r6, r0, #0
	lsl r0, r5, #0x18
	lsl r1, r4, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl sub_0205C048
	add r7, r0, #0
	lsl r0, r5, #0x18
	lsl r1, r4, #0x18
	lsr r0, r0, #0x18
	lsr r1, r1, #0x18
	bl sub_0205C048
	bl sub_0205C268
	add r2, r0, #0
	add r0, r6, #0
	add r1, r7, #0
	mov r3, #0
	bl sub_02031108
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_628

	thumb_func_start ScrCmd_633
ScrCmd_633: ; 0x0204EF40
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r4, r0, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02030B04
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02030C5C
	str r0, [sp, #4]
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x14
	bl FieldSysGetAttrAddr
	add r1, r0, #0
	cmp r7, #4
	bhi _0204F05E
	add r0, r7, r7
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0204EFAC: ; jump table
	.short _0204EFB6 - _0204EFAC - 2 ; case 0
	.short _0204EFC6 - _0204EFAC - 2 ; case 1
	.short _0204EFFE - _0204EFAC - 2 ; case 2
	.short _0204F02E - _0204EFAC - 2 ; case 3
	.short _0204F040 - _0204EFAC - 2 ; case 4
_0204EFB6:
	add r4, #0x80
	ldr r1, [r4]
	add r0, r5, #0
	ldr r1, [r1, #0xc]
	bl sub_0204F06C
	strh r0, [r6]
	b _0204F066
_0204EFC6:
	cmp r5, #3
	bne _0204EFEA
	add r4, #0x80
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_0203107C
	add r4, r0, #0
	mov r0, #0x6a
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0x6a
	bl sub_020310BC
	strh r0, [r6]
	b _0204F066
_0204EFEA:
	lsl r2, r5, #0x18
	mov r3, #0
	ldr r0, [sp, #4]
	mov r1, #5
	lsr r2, r2, #0x18
	str r3, [sp]
	bl sub_02030CA0
	strh r0, [r6]
	b _0204F066
_0204EFFE:
	add r4, #0x80
	ldr r0, [r4]
	ldr r0, [r0, #0xc]
	bl sub_0203107C
	add r4, r0, #0
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205C11C
	add r7, r0, #0
	lsl r0, r5, #0x18
	lsr r0, r0, #0x18
	bl sub_0205C11C
	bl sub_0205C268
	add r2, r0, #0
	add r0, r4, #0
	add r1, r7, #0
	bl sub_020310BC
	strh r0, [r6]
	b _0204F066
_0204F02E:
	add r4, #0x80
	ldr r0, [r4]
	lsl r2, r5, #0x18
	ldr r0, [r0, #0xc]
	ldr r1, [sp, #4]
	lsr r2, r2, #0x18
	bl sub_0204F878
	b _0204F066
_0204F040:
	cmp r5, #0
	bne _0204F048
	mov r2, #0
	b _0204F052
_0204F048:
	cmp r5, #1
	bne _0204F050
	mov r2, #1
	b _0204F052
_0204F050:
	mov r2, #2
_0204F052:
	ldr r0, [r4, #0x74]
	bl sub_0204F284
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0204F05E:
	bl GF_AssertFail
	mov r0, #0
	strh r0, [r6]
_0204F066:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_633

	thumb_func_start sub_0204F06C
sub_0204F06C: ; 0x0204F06C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	str r0, [sp]
	add r0, r1, #0
	bl SavArray_PlayerParty_get
	str r0, [sp, #4]
	bl GetPartyCount
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldr r0, [sp]
	cmp r4, r0
	bge _0204F08E
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204F08E:
	mov r2, #0
	add r5, r2, #0
	add r1, sp, #0x14
_0204F094:
	lsl r0, r2, #1
	strh r5, [r1, r0]
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #6
	blo _0204F094
	str r5, [sp, #0x10]
	cmp r4, #0
	bls _0204F118
_0204F0A8:
	ldr r0, [sp, #4]
	add r1, r5, #0
	bl GetPartyMonByIndex
	mov r1, #5
	mov r2, #0
	add r6, r0, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r6, #0
	mov r1, #0xa1
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0xc]
	add r0, r6, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #8]
	add r0, r6, #0
	mov r1, #0x4c
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	bne _0204F10E
	ldr r0, [sp, #0xc]
	cmp r0, #0x1e
	blo _0204F10E
	ldr r1, [sp, #8]
	add r0, r7, #0
	bl IsPokemonLegendaryOrMythical
	cmp r0, #1
	beq _0204F10E
	ldr r0, [sp, #0x10]
	lsl r1, r5, #1
	add r0, r0, #1
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x10]
	add r0, sp, #0x14
	strh r7, [r0, r1]
_0204F10E:
	add r0, r5, #1
	lsl r0, r0, #0x18
	lsr r5, r0, #0x18
	cmp r5, r4
	blo _0204F0A8
_0204F118:
	ldr r0, [sp]
	cmp r0, #2
	bne _0204F162
	mov r3, #0
	cmp r4, #0
	bls _0204F15C
	add r1, sp, #0x14
	add r2, r3, #0
_0204F128:
	add r5, r2, #0
	cmp r4, #0
	bls _0204F152
	lsl r0, r3, #1
	ldrh r0, [r1, r0]
_0204F132:
	cmp r3, r5
	beq _0204F148
	cmp r0, #0
	beq _0204F148
	lsl r6, r5, #1
	ldrh r6, [r1, r6]
	cmp r0, r6
	bne _0204F148
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0204F148:
	add r5, r5, #1
	lsl r5, r5, #0x18
	lsr r5, r5, #0x18
	cmp r5, r4
	blo _0204F132
_0204F152:
	add r0, r3, #1
	lsl r0, r0, #0x18
	lsr r3, r0, #0x18
	cmp r3, r4
	blo _0204F128
_0204F15C:
	add sp, #0x20
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204F162:
	ldr r1, [sp, #0x10]
	cmp r1, r0
	blt _0204F16E
	add sp, #0x20
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0204F16E:
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0204F06C

	thumb_func_start ScrCmd_636
ScrCmd_636: ; 0x0204F174
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl sub_02030C5C
	lsl r2, r4, #0x18
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	lsr r2, r2, #0x18
	ldr r0, [r0, #0xc]
	bl sub_0204F878
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_636

	thumb_func_start ScrCmd_634
ScrCmd_634: ; 0x0204F1AC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r2, r0, #0
	ldr r0, [r5, #0x74]
	add r1, r4, #0
	bl sub_0204F1E4
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_634

	thumb_func_start sub_0204F1E4
sub_0204F1E4: ; 0x0204F1E4
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	mov r0, #0xb
	mov r1, #0xc
	add r6, r2, #0
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	strb r1, [r4]
	strb r1, [r4, #1]
	strb r1, [r4, #2]
	strb r1, [r4, #3]
	strb r1, [r4, #4]
	strb r1, [r4, #5]
	strb r1, [r4, #6]
	strb r1, [r4, #7]
	strb r1, [r4, #8]
	strb r1, [r4, #9]
	strb r1, [r4, #0xa]
	strb r1, [r4, #0xb]
	strh r5, [r4, #4]
	str r6, [r4, #8]
	bl sub_02091574
	ldr r1, _0204F224 ; =sub_0204F228
	add r0, r7, #0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204F224: .word sub_0204F228
	thumb_func_end sub_0204F1E4

	thumb_func_start sub_0204F228
sub_0204F228: ; 0x0204F228
	push {r4, lr}
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrb r1, [r4]
	cmp r1, #0
	beq _0204F240
	cmp r1, #1
	beq _0204F256
	cmp r1, #2
	beq _0204F276
	b _0204F27E
_0204F240:
	mov r0, #0x84
	add r1, r4, #0
	mov r2, #0xc
	bl sub_02037030
	cmp r0, #1
	bne _0204F27E
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0204F27E
_0204F256:
	ldrb r0, [r4, #1]
	cmp r0, #2
	blo _0204F27E
	ldrh r1, [r4, #4]
	ldrh r0, [r4, #6]
	cmp r1, r0
	bne _0204F268
	mov r1, #0
	b _0204F26A
_0204F268:
	mov r1, #1
_0204F26A:
	ldr r0, [r4, #8]
	strh r1, [r0]
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	b _0204F27E
_0204F276:
	bl FreeToHeap
	mov r0, #1
	pop {r4, pc}
_0204F27E:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0204F228

	thumb_func_start sub_0204F284
sub_0204F284: ; 0x0204F284
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	bl TaskManager_GetSys
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0xc
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	strb r6, [r4, #4]
	str r5, [r4, #8]
	ldr r0, [r7, #0x10]
	ldr r1, _0204F2B4 ; =sub_0204F2B8
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204F2B4: .word sub_0204F2B8
	thumb_func_end sub_0204F284

	thumb_func_start sub_0204F2B8
sub_0204F2B8: ; 0x0204F2B8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r4]
	cmp r1, #4
	bhi _0204F31A
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_0204F2DC: ; jump table
	.short _0204F2E6 - _0204F2DC - 2 ; case 0
	.short _0204F2F2 - _0204F2DC - 2 ; case 1
	.short _0204F2FC - _0204F2DC - 2 ; case 2
	.short _0204F308 - _0204F2DC - 2 ; case 3
	.short _0204F312 - _0204F2DC - 2 ; case 4
_0204F2E6:
	add r1, r5, #0
	mov r2, #0xb
	bl sub_0204F320
	str r0, [r4]
	b _0204F31A
_0204F2F2:
	add r1, r5, #0
	bl sub_0204F3F8
	str r0, [r4]
	b _0204F31A
_0204F2FC:
	add r1, r5, #0
	mov r2, #0xb
	bl sub_0204F448
	str r0, [r4]
	b _0204F31A
_0204F308:
	add r1, r5, #0
	bl sub_0204F4D8
	str r0, [r4]
	b _0204F31A
_0204F312:
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_0204F31A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0204F2B8

	thumb_func_start sub_0204F320
sub_0204F320: ; 0x0204F320
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	add r1, r4, #0
	mov r2, #0x44
	bl MIi_CpuClearFast
	ldr r0, [r6, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r6, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r6, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r6, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r4, #0
	str r0, [r4, #0xc]
	mov r0, #0
	add r1, #0x25
	strb r0, [r1]
	add r1, r4, #0
	mov r2, #0x16
	add r1, #0x24
	strb r2, [r1]
	str r6, [r4, #0x1c]
	add r1, r4, #0
	ldrb r2, [r5, #5]
	add r1, #0x26
	strb r2, [r1]
_0204F374:
	add r1, r5, r0
	ldrb r2, [r1, #6]
	add r1, r4, r0
	add r0, r0, #1
	lsl r0, r0, #0x18
	add r1, #0x30
	lsr r0, r0, #0x18
	strb r2, [r1]
	cmp r0, #2
	blo _0204F374
	add r0, r4, #0
	mov r1, #0x1e
	add r0, #0x37
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x36
	mov r1, #0xf
	ldrb r0, [r0]
	mov ip, r1
	add r2, r4, #0
	bic r0, r1
	mov r1, #1
	orr r1, r0
	add r0, r4, #0
	add r0, #0x36
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x36
	ldrb r0, [r0]
	mov r7, #0xf0
	mov r3, #0x10
	bic r0, r7
	add r1, r0, #0
	add r0, r4, #0
	orr r1, r3
	add r0, #0x36
	add r3, #0xfc
	strb r1, [r0]
	add r0, r6, r3
	str r0, [r4, #0x20]
	ldrb r0, [r5, #4]
	add r2, #0x36
	cmp r0, #1
	bne _0204F3E2
	ldrb r0, [r2]
	mov r1, ip
	bic r0, r1
	mov r1, #2
	orr r0, r1
	strb r0, [r2]
	ldrb r1, [r2]
	mov r0, #0x20
	bic r1, r7
	orr r0, r1
	strb r0, [r2]
_0204F3E2:
	ldr r1, _0204F3F4 ; =_0210159C
	add r0, r6, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	ldr r0, [r5, #8]
	str r4, [r0]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204F3F4: .word _0210159C
	thumb_func_end sub_0204F320

	thumb_func_start sub_0204F3F8
sub_0204F3F8: ; 0x0204F3F8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, r1, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _0204F40A
	mov r0, #1
	pop {r3, r4, r5, pc}
_0204F40A:
	ldr r0, [r5, #8]
	ldr r4, [r0]
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #6
	beq _0204F420
	cmp r0, #7
	bne _0204F424
	mov r0, #4
	pop {r3, r4, r5, pc}
_0204F420:
	mov r0, #4
	pop {r3, r4, r5, pc}
_0204F424:
	add r0, r4, #0
	add r0, #0x30
	add r1, r5, #6
	mov r2, #2
	bl MI_CpuCopy8
	add r0, r4, #0
	add r0, #0x26
	ldrb r0, [r0]
	strb r0, [r5, #5]
	add r0, r4, #0
	bl FreeToHeap
	ldr r0, [r5, #8]
	mov r1, #0
	str r1, [r0]
	mov r0, #2
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0204F3F8

	thumb_func_start sub_0204F448
sub_0204F448: ; 0x0204F448
	push {r3, r4, r5, r6, r7, lr}
	add r7, r1, #0
	add r6, r0, #0
	ldr r5, [r7, #0xc]
	add r0, r2, #0
	mov r1, #0x3c
	bl AllocFromHeapAtEnd
	mov r1, #0
	mov r2, #0x3c
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #4]
	add r0, r5, #0
	bl SavArray_PlayerParty_get
	str r0, [r4]
	add r0, r5, #0
	bl SavArray_IsNatDexEnabled
	str r0, [r4, #0x1c]
	add r0, r5, #0
	bl sub_02088288
	str r0, [r4, #0x2c]
	mov r0, #1
	strb r0, [r4, #0x11]
	ldrb r0, [r6, #5]
	strb r0, [r4, #0x14]
	ldr r0, [r4]
	bl GetPartyCount
	strb r0, [r4, #0x13]
	mov r0, #0
	strh r0, [r4, #0x18]
	strb r0, [r4, #0x12]
	add r0, r5, #0
	bl Save_SpecialRibbons_get
	str r0, [r4, #0x20]
	add r0, r5, #0
	bl sub_0208828C
	str r0, [r4, #0x34]
	ldr r1, _0204F4D0 ; =_020FC224
	add r0, r4, #0
	bl sub_02089D40
	add r0, r5, #0
	bl Sav2_PlayerData_GetProfileAddr
	add r1, r0, #0
	add r0, r4, #0
	bl sub_0208AD34
	ldr r1, _0204F4D4 ; =_02103A1C
	add r0, r7, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	ldr r0, [r6, #8]
	str r4, [r0]
	mov r0, #3
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0204F4D0: .word _020FC224
_0204F4D4: .word _02103A1C
	thumb_func_end sub_0204F448

	thumb_func_start sub_0204F4D8
sub_0204F4D8: ; 0x0204F4D8
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	beq _0204F4EA
	mov r0, #3
	pop {r4, pc}
_0204F4EA:
	ldr r0, [r4, #8]
	ldr r0, [r0]
	ldrb r1, [r0, #0x14]
	strb r1, [r4, #5]
	bl FreeToHeap
	ldr r1, [r4, #8]
	mov r0, #0
	str r0, [r1]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0204F4D8
