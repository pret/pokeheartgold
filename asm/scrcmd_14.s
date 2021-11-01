	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_312
ScrCmd_312: ; 0x0204CB5C
	push {r3, r4, r5, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	ldr r5, [r0, #0xc]
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl Sav2_DayCare_get
	ldr r1, [r4]
	bl sub_0206CE94
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_312

	thumb_func_start ScrCmd_313
ScrCmd_313: ; 0x0204CB7C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r4, [r1, #0xc]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #7
	bl SavArray_get
	bl sub_0206CFD4
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_313

	thumb_func_start ScrCmd_365
ScrCmd_365: ; 0x0204CBAC
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #7
	ldr r0, [r0, #0xc]
	bl SavArray_get
	bl sub_0206C708
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_365

	thumb_func_start ScrCmd_366
ScrCmd_366: ; 0x0204CBC4
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #7
	ldr r0, [r5, #0xc]
	bl SavArray_get
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r4, #0x80
	add r5, r0, #0
	ldr r0, [r4]
	bl ScriptEnvironment_GetSav2Ptr
	bl Sav2_PlayerData_GetProfileAddr
	add r2, r0, #0
	add r0, r6, #0
	add r1, r5, #0
	bl GiveEggToPlayer
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_366

	thumb_func_start ScrCmd_361
ScrCmd_361: ; 0x0204CBF8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0x10
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	add r0, r4, #0
	ldr r6, [r5, #0xc]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	str r0, [sp]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r4, r0, #0
	add r0, r6, #0
	mov r1, #7
	bl SavArray_get
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	lsl r3, r4, #0x18
	ldr r1, [r7]
	add r2, r6, #0
	lsr r3, r3, #0x18
	bl sub_0206C078
	ldr r1, [sp]
	strh r0, [r1]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_361

	thumb_func_start ScrCmd_367
ScrCmd_367: ; 0x0204CC58
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0x10
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r7, r0, #0
	add r0, r4, #0
	ldr r5, [r5, #0xc]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #7
	bl SavArray_get
	lsl r1, r4, #0x18
	ldr r2, [r7]
	lsr r1, r1, #0x18
	bl sub_0206C190
	strh r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_367

	thumb_func_start ScrCmd_371
ScrCmd_371: ; 0x0204CCAC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	ldr r4, [r0, #0xc]
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl GetVarPointer
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #7
	bl SavArray_get
	ldr r2, [r6]
	add r1, r5, #0
	bl sub_0206C1A0
	strh r0, [r7]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_371

	thumb_func_start ScrCmd_372
ScrCmd_372: ; 0x0204CCFC
	push {r4, r5, r6, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r5, [r0]
	mov r1, #0x10
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r4, r0, #0
	ldr r0, [r5, #0xc]
	bl Sav2_DayCare_get
	ldr r1, [r6]
	bl sub_0206CF78
	strh r0, [r4]
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_372

	thumb_func_start ScrCmd_373
ScrCmd_373: ; 0x0204CD34
	push {r4, r5, r6, lr}
	add r6, r0, #0
	add r1, r6, #0
	add r1, #0x80
	ldr r4, [r1]
	ldr r5, [r4, #0xc]
	bl ScriptReadHalfword
	add r6, #0x80
	add r1, r0, #0
	ldr r0, [r6]
	bl VarGet
	add r6, r0, #0
	ldr r0, [r4, #0xc]
	bl SavArray_PlayerParty_get
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #7
	bl SavArray_get
	lsl r1, r6, #0x18
	add r2, r0, #0
	add r0, r4, #0
	lsr r1, r1, #0x18
	add r3, r5, #0
	bl sub_0206BED8
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_373

	thumb_func_start ScrCmd_385
ScrCmd_385: ; 0x0204CD74
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x10
	ldr r5, [r0, #0xc]
	bl FieldSysGetAttrAddr
	add r6, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #8]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl VarGet
	add r4, r0, #0
	add r0, r5, #0
	bl Sav2_DayCare_get
	lsl r1, r4, #0x18
	lsr r1, r1, #0x18
	str r1, [sp]
	ldr r1, [r6]
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	str r1, [sp, #4]
	lsl r1, r7, #0x18
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r1, r1, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl sub_0206CEE0
	mov r0, #0
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_385

	thumb_func_start ScrCmd_387
ScrCmd_387: ; 0x0204CE00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r4, [r1, #0xc]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #7
	bl SavArray_get
	bl sub_0206D02C
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_387

	thumb_func_start ScrCmd_388
ScrCmd_388: ; 0x0204CE30
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	ldr r4, [r1, #0xc]
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl GetVarPointer
	add r5, r0, #0
	add r0, r4, #0
	mov r1, #7
	bl SavArray_get
	bl Sav2_DayCare_HasEgg
	strh r0, [r5]
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_388

	thumb_func_start ScrCmd_715
ScrCmd_715: ; 0x0204CE60
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r0, #0x80
	ldr r6, [r0]
	ldr r0, [r6, #0xc]
	bl Sav2_DayCare_get
	str r0, [sp, #0x24]
	mov r0, #5
	mov r5, #0
	str r0, [sp, #0x18]
	mov r7, #8
_0204CE78:
	add r1, r5, #0
	ldr r0, [r6, #0x3c]
	add r1, #0xfa
	bl sub_0205EE60
	cmp r0, #0
	beq _0204CE8A
	bl sub_0205E400
_0204CE8A:
	ldr r0, [sp, #0x24]
	add r1, r5, #0
	bl Sav2_DayCare_GetMonX
	bl DayCareMon_GetBoxMon
	mov r1, #5
	mov r2, #0
	add r4, r0, #0
	bl GetBoxMonData
	cmp r0, #0
	beq _0204CEFA
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	str r0, [sp, #0x20]
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetBoxMonData
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	str r0, [sp, #0x1c]
	add r0, r4, #0
	mov r1, #0x6f
	mov r2, #0
	bl GetBoxMonData
	str r0, [sp, #0x28]
	add r0, r4, #0
	bl BoxMonIsShiny
	ldr r1, [sp, #0x28]
	str r1, [sp]
	mov r1, #1
	str r1, [sp, #4]
	ldr r1, [sp, #0x18]
	str r7, [sp, #8]
	str r1, [sp, #0xc]
	ldr r1, [r6, #0x20]
	ldr r1, [r1]
	str r1, [sp, #0x10]
	str r0, [sp, #0x14]
	lsl r1, r5, #0x18
	ldr r0, [r6, #0x3c]
	ldr r2, [sp, #0x1c]
	ldr r3, [sp, #0x20]
	lsr r1, r1, #0x18
	bl sub_0204CF10
_0204CEFA:
	ldr r0, [sp, #0x18]
	add r5, r5, #1
	add r0, r0, #4
	add r7, r7, #2
	str r0, [sp, #0x18]
	cmp r5, #2
	blt _0204CE78
	mov r0, #0
	add sp, #0x2c
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_715

	thumb_func_start sub_0204CF10
sub_0204CF10: ; 0x0204CF10
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r2, #0
	add r4, r0, #0
	add r7, r3, #0
	add r5, r1, #0
	ldr r2, [sp, #0x20]
	add r0, r6, #0
	add r1, r7, #0
	bl sub_02069D70
	str r0, [sp]
	mov r0, #0xb
	str r0, [sp, #4]
	ldr r0, [sp, #0x30]
	ldr r1, [sp, #0x28]
	str r0, [sp, #8]
	ldr r2, [sp, #0x2c]
	ldr r3, [sp, #0x24]
	add r0, r4, #0
	bl sub_0205E294
	add r4, r0, #0
	bne _0204CF44
	bl GF_AssertFail
_0204CF44:
	add r5, #0xfa
	add r0, r4, #0
	add r1, r5, #0
	bl sub_0205F248
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F268
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F270
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F278
	add r0, r4, #0
	mov r1, #0
	mov r2, #2
	bl sub_0205F2D0
	lsl r2, r7, #0x18
	ldr r3, [sp, #0x34]
	add r0, r4, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl sub_02069EE8
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl sub_0205F318
	mov r1, #0
	add r0, r4, #0
	mvn r1, r1
	bl sub_0205F320
	add r0, r4, #0
	mov r1, #4
	bl sub_0205F20C
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F214
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F89C
	add r0, r4, #0
	bl ov01_021F9048
	add r0, r4, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0204CF10

	thumb_func_start ScrCmd_690
ScrCmd_690: ; 0x0204CFB8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r1, r4, #0
	add r1, #0x80
	ldr r5, [r1]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	add r6, r0, #0
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	add r1, r7, #0
	bl GetPartyMonByIndex
	mov r2, #0
	add r4, r0, #0
	strh r2, [r6]
	cmp r7, #0xff
	bne _0204D000
	add r0, r2, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204D000:
	mov r1, #6
	bl GetMonData
	cmp r0, #0x70
	bne _0204D034
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	mov r1, #0x70
	mov r2, #1
	mov r3, #0xb
	bl Bag_AddItem
	cmp r0, #0
	bne _0204D026
	mov r0, #0xff
	strh r0, [r6]
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0204D026:
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	mov r1, #6
	add r2, sp, #0
	bl SetMonData
_0204D034:
	add r0, r4, #0
	mov r1, #0x70
	mov r2, #0
	bl GetMonData
	cmp r0, #0
	ble _0204D07E
	add r0, r4, #0
	mov r1, #5
	mov r2, #0
	bl GetMonData
	ldr r2, _0204D084 ; =0x000001DF SPECIES_ROTOM
	cmp r0, r2
	beq _0204D06A
	add r1, r2, #0
	add r1, #8
	cmp r0, r1 ; SPECIES_GIRATINA
	beq _0204D062
	add r2, #0xd
	cmp r0, r2 ; SPECIES_SHAYMIN
	beq _0204D076
	b _0204D07E
_0204D062:
	add r0, r4, #0
	bl Mon_UpdateGiratinaForme
	b _0204D07E
_0204D06A:
	mov r1, #0
	add r0, r4, #0
	add r2, r1, #0
	bl Mon_UpdateRotomForme
	b _0204D07E
_0204D076:
	add r0, r4, #0
	mov r1, #0
	bl Mon_UpdateShayminForme
_0204D07E:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0204D084: .word 0x000001DF
	thumb_func_end ScrCmd_690
