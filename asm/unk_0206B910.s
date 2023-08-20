#include "constants/species.h"
#include "constants/maps.h"
#include "constants/sprites.h"
#include "constants/items.h"
#include "constants/moves.h"
	.include "asm/macros.inc"
	.include "unk_0206B910.inc"
	.include "global.inc"

	.public NNS_G3dGlb

	.text

	thumb_func_start sub_0206B910
sub_0206B910: ; 0x0206B910
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	add r5, r1, #0
	bl TaskManager_GetFieldSystem
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #0x14
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r2, r4, #0
	mov r1, #0x14
	mov r0, #0
_0206B92C:
	strb r0, [r2]
	add r2, r2, #1
	sub r1, r1, #1
	bne _0206B92C
	mov r0, #0xb
	mov r1, #0x34
	str r5, [r4, #0xc]
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x34
	str r0, [r4, #4]
	bl memset
	add r0, r5, #0
	bl Save_PlayerData_GetOptionsAddr
	ldr r1, [r4, #4]
	str r0, [r1, #0x24]
	ldr r0, [r4, #4]
	str r5, [r0, #0x28]
	mov r0, #0x43
	lsl r0, r0, #2
	add r1, r6, r0
	ldr r0, [r4, #4]
	str r1, [r0, #0x2c]
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	str r0, [r4, #8]
	bl memset
	ldr r1, _0206B980 ; =sub_0206B984
	add r0, r7, #0
	add r2, r4, #0
	bl TaskManager_Call
	pop {r3, r4, r5, r6, r7, pc}
	nop
_0206B980: .word sub_0206B984
	thumb_func_end sub_0206B910

	thumb_func_start sub_0206B984
sub_0206B984: ; 0x0206B984
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	bl TaskManager_GetEnv
	add r7, r0, #0
	ldr r0, [sp]
	ldr r6, [r7, #4]
	bl TaskManager_GetFieldSystem
	add r5, r0, #0
	ldr r0, [r7, #0x10]
	cmp r0, #6
	bls _0206B9A2
	b _0206BB1C
_0206B9A2:
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_0206B9AE: ; jump table
	.short _0206B9BC - _0206B9AE - 2 ; case 0
	.short _0206BA20 - _0206B9AE - 2 ; case 1
	.short _0206BA30 - _0206B9AE - 2 ; case 2
	.short _0206BA4E - _0206B9AE - 2 ; case 3
	.short _0206BA96 - _0206B9AE - 2 ; case 4
	.short _0206BAF8 - _0206B9AE - 2 ; case 5
	.short _0206BB04 - _0206B9AE - 2 ; case 6
_0206B9BC:
	ldr r0, [sp]
	bl sub_0205525C
	ldr r0, [r7, #0xc]
	bl Save_SealCase_Get
	str r0, [r6, #0x20]
	add r0, r6, #0
	mov r1, #0
	add r0, #0x31
	strb r1, [r0]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r6, #0x2c]
	ldr r0, [r7, #0xc]
	bl SaveArray_Party_Get
	str r0, [r6, #0x1c]
	bl Party_GetCount
	mov r4, #0
	str r0, [sp, #4]
	str r0, [r6]
	cmp r0, #0
	ble _0206BA06
	add r5, r6, #0
_0206B9F2:
	ldr r0, [r6, #0x1c]
	add r1, r4, #0
	bl Party_GetMonByIndex
	str r0, [r5, #4]
	ldr r0, [sp, #4]
	add r4, r4, #1
	add r5, r5, #4
	cmp r4, r0
	blt _0206B9F2
_0206BA06:
	cmp r4, #6
	bge _0206BA1A
	lsl r0, r4, #2
	add r1, r6, r0
	mov r0, #0
_0206BA10:
	add r4, r4, #1
	str r0, [r1, #4]
	add r1, r1, #4
	cmp r4, #6
	blt _0206BA10
_0206BA1A:
	mov r0, #1
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BA20:
	ldr r0, [sp]
	ldr r1, _0206BB24 ; =_020FF480
	add r2, r6, #0
	bl CallApplicationAsTask
	mov r0, #2
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BA30:
	ldr r0, [r7, #4]
	add r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0
	beq _0206BA42
	cmp r0, #1
	beq _0206BA48
	bl GF_AssertFail
_0206BA42:
	mov r0, #5
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BA48:
	mov r0, #3
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BA4E:
	ldr r4, [r7, #8]
	ldr r0, [r6, #0x1c]
	str r0, [r4]
	ldr r0, [r7, #0xc]
	bl Save_Bag_Get
	str r0, [r4, #4]
	ldr r0, [r7, #0xc]
	bl Save_Mailbox_Get
	str r0, [r4, #8]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x26
	strb r1, [r0]
	add r0, r4, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #0xf
	add r0, #0x24
	strb r1, [r0]
	ldr r0, [r6, #0x24]
	add r1, #0xfd
	str r0, [r4, #0xc]
	add r0, r5, r1
	str r5, [r4, #0x1c]
	str r0, [r4, #0x20]
	ldr r0, [sp]
	ldr r1, _0206BB28 ; =_0210159C
	add r2, r4, #0
	bl CallApplicationAsTask
	mov r0, #4
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BA96:
	ldr r0, [r7, #4]
	ldr r1, [r7, #8]
	add r0, #0x30
	ldrb r0, [r0]
	add r1, #0x26
	add r0, r0, #1
	str r0, [sp, #8]
	ldrb r0, [r1]
	cmp r0, #7
	beq _0206BAF2
	ldr r1, [r7, #4]
	lsl r0, r0, #2
	add r0, r1, r0
	ldr r4, [r0, #4]
	mov r1, #0xa2
	add r0, r4, #0
	add r2, sp, #8
	bl SetMonData
	ldr r1, [sp, #8]
	ldr r0, [r6, #0x20]
	sub r1, r1, #1
	bl SealCase_GetCapsuleI
	add r2, r0, #0
	add r0, r4, #0
	mov r1, #0xab
	bl SetMonData
	ldr r1, [sp, #8]
	ldr r0, [r6, #0x20]
	sub r1, r1, #1
	bl SealCase_GetCapsuleI
	mov r1, #0
	bl CapsuleGetSealI
	bl SealOnCapsuleGetID
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0209106C
	ldr r0, [r5, #0xc]
	bl sub_020270C4
_0206BAF2:
	mov r0, #1
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BAF8:
	ldr r0, [sp]
	bl sub_020552A4
	mov r0, #6
	str r0, [r7, #0x10]
	b _0206BB1C
_0206BB04:
	ldr r0, [r7, #8]
	bl FreeToHeap
	ldr r0, [r7, #4]
	bl FreeToHeap
	add r0, r7, #0
	bl FreeToHeap
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_0206BB1C:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	nop
_0206BB24: .word _020FF480
_0206BB28: .word _0210159C
	thumb_func_end sub_0206B984

	thumb_func_start ScrCmd_232
ScrCmd_232: ; 0x0206BB2C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r5, #0x80
	add r1, r0, #0
	ldr r0, [r5]
	bl VarGet
	add r1, r0, #0
	lsl r1, r1, #0x18
	ldr r0, [r4]
	lsr r1, r1, #0x18
	bl sub_0206BCA4
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_232

	thumb_func_start ScrCmd_233
ScrCmd_233: ; 0x0206BB5C
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r0, r4, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [r4, #0x64]
	ldr r1, _0206BB8C ; =sub_0206BB90
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	pop {r4, pc}
	nop
_0206BB8C: .word sub_0206BB90
	thumb_func_end ScrCmd_233

	thumb_func_start sub_0206BB90
sub_0206BB90: ; 0x0206BB90
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	ldr r1, [r4, #0x64]
	ldr r0, [r0]
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_0206BCB4
	pop {r4, pc}
	thumb_func_end sub_0206BB90

	thumb_func_start ScrCmd_234
ScrCmd_234: ; 0x0206BBAC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	str r0, [sp]
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r1, sp, #4
	strb r7, [r1]
	ldr r0, [sp]
	strb r6, [r1, #1]
	add r5, #0x80
	strb r0, [r1, #2]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	str r0, [sp, #0x1c]
	add r0, sp, #4
	bl sub_0206BCEC
	str r0, [r4]
	mov r0, #0
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ScrCmd_234

	thumb_func_start ScrCmd_235
ScrCmd_235: ; 0x0206BC2C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, #0x80
	ldr r0, [r5]
	ldr r0, [r0, #0x20]
	ldr r0, [r0]
	bl MapHeader_GetMapSec
	ldr r0, [r4]
	bl sub_0206BD00
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end ScrCmd_235

	thumb_func_start ScrCmd_236
ScrCmd_236: ; 0x0206BC64
	push {r4, lr}
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	mov r1, #0
	strh r1, [r0]
	add r0, r1, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_236

	thumb_func_start ScrCmd_237
ScrCmd_237: ; 0x0206BC8C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0x15
	bl FieldSysGetAttrAddr
	mov r0, #1
	bl sub_02002C60
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_237

	thumb_func_start sub_0206BCA4
sub_0206BCA4: ; 0x0206BCA4
	push {r3, lr}
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _0206BCB2
	add r0, r1, #0
	bl sub_02037AC0
_0206BCB2:
	pop {r3, pc}
	thumb_func_end sub_0206BCA4

	thumb_func_start sub_0206BCB4
sub_0206BCB4: ; 0x0206BCB4
	push {r3, lr}
	ldrb r0, [r0, #4]
	cmp r0, #0
	bne _0206BCC0
	mov r0, #1
	pop {r3, pc}
_0206BCC0:
	add r0, r1, #0
	bl sub_02037B38
	cmp r0, #1
	bne _0206BCCE
	mov r0, #1
	pop {r3, pc}
_0206BCCE:
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206BCB4

	thumb_func_start sub_0206BCD4
sub_0206BCD4: ; 0x0206BCD4
	push {r4, lr}
	mov r0, #0x14
	add r1, r0, #0
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x14
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r4, #0
	pop {r4, pc}
	thumb_func_end sub_0206BCD4

	thumb_func_start sub_0206BCEC
sub_0206BCEC: ; 0x0206BCEC
	push {r3, lr}
	mov r2, #1
	mov r0, #0xb
	mov r1, #0x14
	lsl r2, r2, #0xe
	bl CreateHeap
	bl sub_0206BCD4
	pop {r3, pc}
	thumb_func_end sub_0206BCEC

	thumb_func_start sub_0206BD00
sub_0206BD00: ; 0x0206BD00
	push {r3, lr}
	bl FreeToHeap
	mov r0, #0x14
	bl DestroyHeap
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206BD00

	.rodata

_020FF480:
	.word ov57_022378DC, ov57_02237AF8, ov57_02237B20, FS_OVERLAY_ID(OVY_57)
