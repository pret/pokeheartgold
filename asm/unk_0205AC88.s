	.include "asm/macros.inc"
	.include "global.inc"

	.public _020FC824

	.text

	thumb_func_start sub_0205AC88
sub_0205AC88: ; 0x0205AC88
	push {r3, r4, r5, lr}
	ldr r1, _0205ACF4 ; =0x000004E8
	add r5, r0, #0
	mov r0, #0x1f
	bl AllocFromHeap
	add r4, r0, #0
	ldr r2, _0205ACF4 ; =0x000004E8
	mov r0, #0
	add r1, r4, #0
	bl MIi_CpuClearFast
	mov r0, #0x4e
	str r5, [r4]
	mov r1, #1
	lsl r0, r0, #4
	str r1, [r4, r0]
	ldr r0, _0205ACF8 ; =sub_0205AD60
	add r1, r4, #0
	mov r2, #0xb
	bl CreateSysTask
	str r0, [r4, #4]
	add r0, r5, #0
	bl sub_0205A1F0
	ldr r1, _0205ACFC ; =0x000004D4
	str r0, [r4, r1]
	ldr r0, [r4, r1]
	mov r1, #8
	ldr r0, [r0, #0xc]
	bl SavArray_get
	ldr r1, _0205AD00 ; =0x000004D8
	ldr r2, _0205AD04 ; =0x00002710
	str r0, [r4, r1]
	sub r0, r1, #4
	ldr r0, [r4, r0]
	mov r1, #0x57
	ldr r0, [r0, #0x40]
	str r0, [r4, #8]
	mov r0, #0xb
	bl CreateHeapAtEnd
	mov r0, #0x57
	bl sub_0205B3B8
	ldr r1, _0205AD08 ; =0x000004DC
	str r0, [r4, r1]
	add r0, r4, #0
	bl sub_0205AD24
	add r0, r4, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0205ACF4: .word 0x000004E8
_0205ACF8: .word sub_0205AD60
_0205ACFC: .word 0x000004D4
_0205AD00: .word 0x000004D8
_0205AD04: .word 0x00002710
_0205AD08: .word 0x000004DC
	thumb_func_end sub_0205AC88

	thumb_func_start sub_0205AD0C
sub_0205AD0C: ; 0x0205AD0C
	mov r3, #0
	mov r1, #3
_0205AD10:
	ldrb r2, [r0, #0xd]
	cmp r2, #0
	beq _0205AD18
	strb r1, [r0, #0xc]
_0205AD18:
	add r3, r3, #1
	add r0, #0x18
	cmp r3, #0x33
	blt _0205AD10
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205AD0C

	thumb_func_start sub_0205AD24
sub_0205AD24: ; 0x0205AD24
	mov r2, #0
	add r1, r2, #0
_0205AD28:
	strb r1, [r0, #0xc]
	strb r1, [r0, #0xd]
	strb r1, [r0, #0xe]
	strb r1, [r0, #0xf]
	add r2, r2, #1
	add r0, #0x18
	cmp r2, #0x33
	blt _0205AD28
	bx lr
	.balign 4, 0
	thumb_func_end sub_0205AD24

	thumb_func_start sub_0205AD3C
sub_0205AD3C: ; 0x0205AD3C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	bl DestroySysTask
	ldr r0, _0205AD5C ; =0x000004DC
	ldr r0, [r4, r0]
	bl sub_0205B3CC
	mov r0, #0x57
	bl DestroyHeap
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
_0205AD5C: .word 0x000004DC
	thumb_func_end sub_0205AD3C

	thumb_func_start sub_0205AD60
sub_0205AD60: ; 0x0205AD60
	push {r3, r4, r5, lr}
	ldr r0, _0205AD98 ; =0x000004D4
	add r5, r1, #0
	ldr r0, [r5, r0]
	ldr r4, [r5]
	bl Fsys_TaskIsRunning
	cmp r0, #0
	bne _0205AD96
	ldr r3, _0205AD98 ; =0x000004D4
	add r1, r4, #0
	ldr r0, [r5, r3]
	ldr r0, [r0, #0x40]
	str r0, [r5, #8]
	ldr r2, [r5, r3]
	add r3, r3, #4
	ldr r2, [r2, #0x3c]
	ldr r3, [r5, r3]
	add r0, r5, #0
	bl sub_0205AEA8
	ldr r1, _0205AD98 ; =0x000004D4
	add r0, r5, #0
	ldr r1, [r5, r1]
	ldr r1, [r1, #0x3c]
	bl sub_0205AF78
_0205AD96:
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0205AD98: .word 0x000004D4
	thumb_func_end sub_0205AD60

	thumb_func_start sub_0205AD9C
sub_0205AD9C: ; 0x0205AD9C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	mov r5, #0
	str r0, [sp]
	str r3, [sp, #4]
	cmp r2, #0
	bne _0205ADD0
	ldr r0, _0205AE9C ; =_020FC824
	lsl r1, r1, #1
	ldrh r4, [r0, r1]
	ldr r0, [sp]
	mov r6, #3
	add r0, #0xc
	str r0, [sp]
_0205ADB8:
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205AEA0
	add r5, r5, #1
	add r4, r4, #1
	cmp r5, #4
	blt _0205ADB8
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0205ADD0:
	add r0, r2, #0
	str r0, [sp, #0xc]
	add r0, #0x50
	str r0, [sp, #0xc]
	add r0, #0x30
	str r0, [sp, #0xc]
	ldr r0, [r2, #0x50]
	mov r2, #0x18
	add r3, r1, #0
	mul r3, r2
	ldr r2, [sp]
	add r2, r2, r3
	ldr r2, [r2, #0x18]
	cmp r0, r2
	beq _0205AE14
	ldr r0, _0205AE9C ; =_020FC824
	lsl r1, r1, #1
	ldrh r4, [r0, r1]
	ldr r0, [sp]
	mov r6, #3
	add r0, #0xc
	str r0, [sp]
_0205ADFC:
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205AEA0
	add r5, r5, #1
	add r4, r4, #1
	cmp r5, #4
	blt _0205ADFC
	add sp, #0x14
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_0205AE14:
	ldr r0, _0205AE9C ; =_020FC824
	lsl r1, r1, #1
	ldrh r7, [r0, r1]
	ldr r0, [sp, #0xc]
	add r6, r5, #0
	str r0, [sp, #8]
	ldr r0, [sp]
	str r0, [sp, #0x10]
	add r0, #0xc
	str r0, [sp, #0x10]
_0205AE28:
	mov r0, #0x18
	add r1, r7, #0
	mul r1, r0
	ldr r0, [sp]
	add r4, r0, r1
	ldrb r0, [r4, #0xd]
	cmp r0, #0
	beq _0205AE42
	cmp r0, #2
	beq _0205AE68
	cmp r0, #4
	beq _0205AE82
	b _0205AE86
_0205AE42:
	ldr r0, [sp, #0xc]
	add r1, r0, r6
	ldrb r0, [r1, #0x18]
	cmp r0, #0
	beq _0205AE86
	mov r0, #2
	strb r0, [r4, #0xc]
	ldrb r1, [r1, #0x18]
	mov r0, #0x7f
	and r0, r1
	strb r0, [r4, #0x14]
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	ldr r1, [r1]
	bl PalPad_PlayerIdIsFriendOrMutual
	strb r0, [r4, #0xe]
	mov r5, #1
	b _0205AE86
_0205AE68:
	ldr r0, [sp, #0xc]
	add r0, r0, r6
	ldrb r0, [r0, #0x18]
	cmp r0, #0
	bne _0205AE7E
	ldr r0, [sp, #0x10]
	add r1, r7, #0
	mov r2, #3
	bl sub_0205AEA0
	b _0205AE86
_0205AE7E:
	mov r5, #1
	b _0205AE86
_0205AE82:
	mov r0, #0
	strb r0, [r4, #0xc]
_0205AE86:
	ldr r0, [sp, #8]
	add r6, r6, #1
	add r0, r0, #4
	add r7, r7, #1
	str r0, [sp, #8]
	cmp r6, #4
	blt _0205AE28
	add r0, r5, #0
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	nop
_0205AE9C: .word _020FC824
	thumb_func_end sub_0205AD9C

	thumb_func_start sub_0205AEA0
sub_0205AEA0: ; 0x0205AEA0
	mov r3, #0x18
	mul r3, r1
	strb r2, [r0, r3]
	bx lr
	thumb_func_end sub_0205AEA0

	thumb_func_start sub_0205AEA8
sub_0205AEA8: ; 0x0205AEA8
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	str r0, [sp]
	add r5, r0, #0
	str r0, [sp, #0x10]
	add r0, #0xc
	str r1, [sp, #4]
	str r3, [sp, #8]
	mov r4, #0
	str r0, [sp, #0x10]
_0205AEBC:
	ldr r0, [sp, #4]
	add r1, r4, #0
	bl sub_0205A1F4
	add r6, r0, #0
	beq _0205AED6
	add r7, r6, #0
	add r7, #0x50
	add r0, r7, #0
	str r0, [sp, #0xc]
	add r0, #0x10
	str r0, [sp, #0xc]
	b _0205AEDC
_0205AED6:
	mov r7, #0
	add r0, r7, #0
	str r0, [sp, #0xc]
_0205AEDC:
	ldrb r0, [r5, #0xd]
	cmp r0, #0
	beq _0205AEEC
	cmp r0, #2
	beq _0205AF28
	cmp r0, #4
	beq _0205AF66
	b _0205AF6A
_0205AEEC:
	cmp r6, #0
	beq _0205AF6A
	ldr r0, [sp, #0xc]
	bl PlayerProfile_GetAvatar
	strb r0, [r5, #0x14]
	ldr r0, [sp, #0xc]
	bl PlayerProfile_GetTrainerID
	add r1, r0, #0
	ldr r0, [sp, #8]
	bl PalPad_PlayerIdIsFriendOrMutual
	strb r0, [r5, #0xe]
	ldr r0, [r7]
	ldr r3, [sp, #8]
	str r0, [r5, #0x18]
	ldr r0, [sp]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205AD9C
	cmp r0, #0
	beq _0205AF22
	mov r0, #2
	strb r0, [r5, #0xc]
	b _0205AF6A
_0205AF22:
	mov r0, #1
	strb r0, [r5, #0xc]
	b _0205AF6A
_0205AF28:
	cmp r6, #0
	bne _0205AF38
	ldr r0, [sp, #0x10]
	add r1, r4, #0
	mov r2, #3
	bl sub_0205AEA0
	b _0205AF4A
_0205AF38:
	ldr r1, [r7]
	ldr r0, [r5, #0x18]
	cmp r1, r0
	beq _0205AF4A
	ldr r0, [sp, #0x10]
	add r1, r4, #0
	mov r2, #3
	bl sub_0205AEA0
_0205AF4A:
	ldr r0, [sp]
	ldr r3, [sp, #8]
	add r1, r4, #0
	add r2, r6, #0
	bl sub_0205AD9C
	cmp r0, #0
	beq _0205AF6A
	ldrb r0, [r5, #0x15]
	cmp r0, #1
	bne _0205AF6A
	mov r0, #3
	strb r0, [r5, #0xc]
	b _0205AF6A
_0205AF66:
	mov r0, #0
	strb r0, [r5, #0xc]
_0205AF6A:
	add r4, r4, #1
	add r5, #0x18
	cmp r4, #0xa
	blt _0205AEBC
	add sp, #0x14
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0205AEA8

	thumb_func_start sub_0205AF78
sub_0205AF78: ; 0x0205AF78
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	str r0, [sp]
	ldr r0, [r0, #8]
	str r1, [sp, #4]
	cmp r0, #0
	bne _0205AF8A
	bl GF_AssertFail
_0205AF8A:
	ldr r0, [sp]
	ldr r0, [r0, #8]
	bl GetPlayerXCoord
	str r0, [sp, #0xc]
	ldr r0, [sp]
	ldr r0, [r0, #8]
	bl GetPlayerYCoord
	ldr r4, [sp]
	str r0, [sp, #8]
	add r6, r4, #0
	mov r7, #0
	add r6, #0xc
_0205AFA6:
	ldr r0, [sp, #4]
	add r1, r7, #1
	bl GetMapObjectByID
	add r5, r0, #0
	bne _0205AFB6
	bl GF_AssertFail
_0205AFB6:
	ldrb r0, [r4, #0xd]
	cmp r0, #4
	bhi _0205B0AA
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0205AFC8: ; jump table
	.short _0205AFD2 - _0205AFC8 - 2 ; case 0
	.short _0205AFF2 - _0205AFC8 - 2 ; case 1
	.short _0205B052 - _0205AFC8 - 2 ; case 2
	.short _0205B07A - _0205AFC8 - 2 ; case 3
	.short _0205B0A6 - _0205AFC8 - 2 ; case 4
_0205AFD2:
	add r0, r5, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _0205B0AA
	ldrb r0, [r4, #0xc]
	sub r0, r0, #1
	cmp r0, #1
	bhi _0205B0AA
	ldr r2, [sp, #0xc]
	ldr r3, [sp, #8]
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0205B13C
	b _0205B0AA
_0205AFF2:
	add r0, r5, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _0205B0AA
	ldrb r0, [r4, #0xc]
	cmp r0, #3
	bne _0205B012
	mov r0, #0
	strb r0, [r4, #0xd]
	strb r0, [r4, #0xc]
	add r0, r6, #0
	mov r1, #1
	bl sub_0205B0DC
	b _0205B0AA
_0205B012:
	add r0, r5, #0
	bl MapObject_ClearHeldMovementIfActive
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F6E0
	ldrb r0, [r4, #0xc]
	cmp r0, #1
	bne _0205B048
	ldrb r0, [r4, #0x15]
	cmp r0, #0
	bne _0205B048
	add r0, r5, #0
	mov r1, #3
	bl sub_0205FC94
	add r0, r5, #0
	mov r1, #1
	bl MapObject_SetXRange
	add r0, r5, #0
	mov r1, #1
	bl MapObject_SetYRange
	mov r0, #1
	strb r0, [r4, #0x15]
_0205B048:
	mov r0, #2
	strb r0, [r4, #0xd]
	mov r0, #0
	strb r0, [r4, #0xc]
	b _0205B0AA
_0205B052:
	add r0, r5, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _0205B0AA
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0205B218
	ldrb r0, [r4, #0xc]
	cmp r0, #3
	bne _0205B072
	add r0, r6, #0
	add r1, r5, #0
	bl sub_0205B1E4
_0205B072:
	add r0, r6, #0
	bl sub_0205B118
	b _0205B0AA
_0205B07A:
	add r0, r5, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _0205B0AA
	add r0, r5, #0
	bl MapObject_ClearHeldMovementIfActive
	mov r0, #4
	strb r0, [r4, #0xd]
	mov r0, #0
	strb r0, [r4, #0xc]
	strb r0, [r4, #0x15]
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F690
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F6AC
	b _0205B0AA
_0205B0A6:
	mov r0, #0
	strb r0, [r4, #0xd]
_0205B0AA:
	add r7, r7, #1
	add r4, #0x18
	add r6, #0x18
	cmp r7, #0x32
	bge _0205B0B6
	b _0205AFA6
_0205B0B6:
	ldr r0, [sp]
	ldr r0, [r0, #8]
	bl PlayerAvatar_GetMapObject
	add r1, r0, #0
	ldr r2, _0205B0D8 ; =0x000004BC
	ldr r0, [sp]
	add r0, r0, r2
	bl sub_0205B218
	ldr r1, _0205B0D8 ; =0x000004BC
	ldr r0, [sp]
	add r0, r0, r1
	bl sub_0205B118
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205B0D8: .word 0x000004BC
	thumb_func_end sub_0205AF78

	thumb_func_start sub_0205B0DC
sub_0205B0DC: ; 0x0205B0DC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x10]
	add r4, r1, #0
	cmp r0, #0
	beq _0205B0FA
	bl sub_02068CCC
	cmp r0, #0
	beq _0205B0F6
	ldr r0, [r5, #0x10]
	bl sub_02068B48
_0205B0F6:
	mov r0, #0
	str r0, [r5, #0x10]
_0205B0FA:
	cmp r4, #0
	beq _0205B116
	ldr r0, [r5, #0x14]
	cmp r0, #0
	beq _0205B116
	bl sub_02068CCC
	cmp r0, #0
	beq _0205B112
	ldr r0, [r5, #0x14]
	bl sub_02068B48
_0205B112:
	mov r0, #0
	str r0, [r5, #0x14]
_0205B116:
	pop {r3, r4, r5, pc}
	thumb_func_end sub_0205B0DC

	thumb_func_start sub_0205B118
sub_0205B118: ; 0x0205B118
	push {r4, lr}
	add r4, r0, #0
	ldrb r1, [r4, #4]
	cmp r1, #0
	beq _0205B138
	ldrh r1, [r4, #6]
	sub r1, r1, #1
	strh r1, [r4, #6]
	ldrh r1, [r4, #6]
	cmp r1, #0
	bne _0205B138
	mov r1, #0
	bl sub_0205B0DC
	mov r0, #0
	strb r0, [r4, #4]
_0205B138:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205B118

	thumb_func_start sub_0205B13C
sub_0205B13C: ; 0x0205B13C
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r4, r1, #0
	add r5, r0, #0
	add r0, r4, #0
	str r2, [sp, #4]
	str r3, [sp, #8]
	bl MapObject_GetInitialX
	add r7, r0, #0
	add r0, r4, #0
	bl MapObject_GetInitialHeight
	str r0, [sp, #0xc]
	add r0, r4, #0
	bl MapObject_GetInitialY
	add r6, r0, #0
	ldr r0, [sp, #4]
	cmp r7, r0
	bne _0205B16C
	ldr r0, [sp, #8]
	cmp r6, r0
	beq _0205B1DC
_0205B16C:
	ldr r0, _0205B1E0 ; =0x0000064E
	bl PlaySE
	ldrb r1, [r5, #8]
	add r0, r4, #0
	bl sub_0205E3AC
	add r0, r5, #0
	mov r1, #0
	bl sub_0205B0DC
	mov r0, #1
	str r0, [sp]
	ldr r2, [sp, #0xc]
	add r0, r4, #0
	add r1, r7, #0
	add r3, r6, #0
	bl sub_0205FC2C
	add r0, r4, #0
	mov r1, #1
	bl MapObject_ForceSetFacingDirection
	add r0, r4, #0
	mov r1, #0x44
	bl MapObject_SetHeldMovement
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F690
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F6AC
	mov r1, #1
	strb r1, [r5, #1]
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _0205B1DC
	cmp r0, #1
	bne _0205B1CA
	add r0, r4, #0
	bl ov01_021FD8E8
	str r0, [r5, #0x14]
	b _0205B1D8
_0205B1CA:
	cmp r0, #2
	blo _0205B1D8
	add r0, r4, #0
	mov r1, #2
	bl ov01_021FD8E8
	str r0, [r5, #0x14]
_0205B1D8:
	mov r0, #0
	strb r0, [r5, #2]
_0205B1DC:
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0205B1E0: .word 0x0000064E
	thumb_func_end sub_0205B13C

	thumb_func_start sub_0205B1E4
sub_0205B1E4: ; 0x0205B1E4
	push {r3, r4, r5, lr}
	add r5, r1, #0
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #0x43
	bl MapObject_SetHeldMovement
	add r0, r5, #0
	mov r1, #1
	bl sub_0205F6E0
	add r0, r5, #0
	mov r1, #0
	bl sub_0205FC94
	add r0, r4, #0
	mov r1, #1
	bl sub_0205B0DC
	mov r0, #0
	strb r0, [r4, #4]
	strh r0, [r4, #6]
	mov r0, #3
	strb r0, [r4, #1]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205B1E4

	thumb_func_start sub_0205B218
sub_0205B218: ; 0x0205B218
	push {r4, lr}
	add r4, r0, #0
	ldrb r0, [r4, #3]
	cmp r0, #1
	bne _0205B23C
	ldrb r0, [r4, #4]
	cmp r0, #0
	bne _0205B23C
	add r0, r1, #0
	bl ov01_02200730
	str r0, [r4, #0x10]
	mov r0, #0x1e
	strh r0, [r4, #6]
	mov r0, #0
	strb r0, [r4, #3]
	mov r0, #1
	strb r0, [r4, #4]
_0205B23C:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_0205B218

	thumb_func_start sub_0205B240
sub_0205B240: ; 0x0205B240
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	add r6, r2, #0
	add r7, r0, #0
	cmp r5, r6
	bge _0205B27A
_0205B24C:
	add r0, r7, #0
	add r1, r5, #0
	bl GetMapObjectByID
	add r4, r0, #0
	bne _0205B25C
	bl GF_AssertFail
_0205B25C:
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F690
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F6AC
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F6E0
	add r5, r5, #1
	cmp r5, r6
	blt _0205B24C
_0205B27A:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205B240

	thumb_func_start sub_0205B27C
sub_0205B27C: ; 0x0205B27C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r1, #0
	mov r1, #0
	add r7, r0, #0
	bl GetMapObjectByID
	add r4, r0, #0
	bne _0205B290
	bl GF_AssertFail
_0205B290:
	add r0, r4, #0
	bl MapObject_AreBitsSetForMovementScriptInit
	cmp r0, #1
	bne _0205B336
	bl sub_02037FCC
	cmp r0, #0
	bne _0205B2AA
	bl sub_02037F94
	cmp r0, #0
	beq _0205B32C
_0205B2AA:
	mov r6, #0
	add r5, #0xc
_0205B2AE:
	ldrb r0, [r5, #1]
	cmp r0, #1
	bne _0205B318
	add r0, r7, #0
	add r1, r6, #1
	bl GetMapObjectByID
	add r4, r0, #0
	bne _0205B2C4
	bl GF_AssertFail
_0205B2C4:
	ldrb r1, [r5, #8]
	add r0, r4, #0
	bl sub_0205E3AC
	add r0, r4, #0
	mov r1, #1
	bl MapObject_ForceSetFacingDirection
	add r0, r4, #0
	mov r1, #0x44
	bl MapObject_SetHeldMovement
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F690
	add r0, r4, #0
	mov r1, #1
	bl sub_0205F6AC
	mov r0, #1
	strb r0, [r5, #1]
	ldrb r0, [r5, #2]
	cmp r0, #0
	beq _0205B318
	cmp r0, #1
	bne _0205B306
	add r0, r4, #0
	mov r1, #1
	bl ov01_021FD8E8
	str r0, [r5, #0x14]
	b _0205B314
_0205B306:
	cmp r0, #2
	blo _0205B314
	add r0, r4, #0
	mov r1, #2
	bl ov01_021FD8E8
	str r0, [r5, #0x14]
_0205B314:
	mov r0, #0
	strb r0, [r5, #2]
_0205B318:
	add r6, r6, #1
	add r5, #0x18
	cmp r6, #0xa
	blt _0205B2AE
	add r0, r7, #0
	mov r1, #0xb
	mov r2, #0x33
	bl sub_0205B240
	pop {r3, r4, r5, r6, r7, pc}
_0205B32C:
	add r0, r7, #0
	mov r1, #1
	mov r2, #0x33
	bl sub_0205B240
_0205B336:
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_0205B27C

	thumb_func_start sub_0205B338
sub_0205B338: ; 0x0205B338
	push {r4, lr}
	add r4, r0, #0
	mov r0, #8
	mov r1, #0x57
	bl String_ctor
	str r0, [r4]
	mov r1, #0
	add r0, r4, #0
	str r1, [r4, #4]
	add r0, #0x14
	str r1, [r4, #8]
	bl MailMsg_init_withBank
	mov r0, #0
	str r0, [r4, #0x10]
	str r0, [r4, #0xc]
	pop {r4, pc}
	thumb_func_end sub_0205B338

	thumb_func_start sub_0205B35C
sub_0205B35C: ; 0x0205B35C
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r4, #0
	add r5, r6, #0
_0205B364:
	add r0, r5, #0
	bl sub_0205B338
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, #0x1e
	blt _0205B364
	mov r0, #0xd2
	mov r1, #0
	lsl r0, r0, #2
	str r1, [r6, r0]
	add r0, r0, #4
	str r1, [r6, r0]
	pop {r4, r5, r6, pc}
	thumb_func_end sub_0205B35C

	thumb_func_start sub_0205B380
sub_0205B380: ; 0x0205B380
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl FreeToHeap
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0205B394
	bl String_dtor
_0205B394:
	ldr r0, [r4, #8]
	cmp r0, #0
	beq _0205B39E
	bl String_dtor
_0205B39E:
	pop {r4, pc}
	thumb_func_end sub_0205B380

	thumb_func_start sub_0205B3A0
sub_0205B3A0: ; 0x0205B3A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r4, #0
_0205B3A6:
	add r0, r5, #0
	bl sub_0205B380
	add r4, r4, #1
	add r5, #0x1c
	cmp r4, #0x1e
	blt _0205B3A6
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_0205B3A0

	thumb_func_start sub_0205B3B8
sub_0205B3B8: ; 0x0205B3B8
	push {r4, lr}
	mov r1, #0x35
	lsl r1, r1, #4
	bl AllocFromHeap
	add r4, r0, #0
	bl sub_0205B35C
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0205B3B8

	thumb_func_start sub_0205B3CC
sub_0205B3CC: ; 0x0205B3CC
	push {r4, lr}
	add r4, r0, #0
	bl sub_0205B3A0
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	thumb_func_end sub_0205B3CC
