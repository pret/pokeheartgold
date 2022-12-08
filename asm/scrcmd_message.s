#include "constants/sndseq.h"
#include "constants/moves.h"
#include "constants/std_script.h"
#include "constants/species.h"
#include "constants/sprites.h"
#include "constants/maps.h"
#include "constants/mmodel.h"
#include "constants/items.h"
#include "msgdata/msg/msg_0096_D31R0201.h"
#include "msgdata/msg/msg_0066_D23R0102.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	thumb_func_start ScrCmd_NonNPCMsg
ScrCmd_NonNPCMsg: ; 0x021EF050
	push {r3, lr}
	ldr r2, [r0, #8]
	add r1, r2, #1
	str r1, [r0, #8]
	ldrb r2, [r2]
	ldr r1, [r0, #0x78]
	bl ovFieldMain_ShowMessageInField
	mov r0, #0
	pop {r3, pc}
	thumb_func_end ScrCmd_NonNPCMsg

	thumb_func_start ScrCmd_GetStdMsgNaix
ScrCmd_GetStdMsgNaix: ; 0x021EF064
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r5, r0, #0
	add r0, r4, #0
	bl ScriptReadHalfword
	add r4, #0x80
	add r1, r0, #0
	ldr r0, [r4]
	bl GetVarPointer
	cmp r5, #4
	blo _021EF092
	mov r1, #0
	b _021EF098
_021EF092:
	ldr r1, _021EF0A0 ; =ov01_022067C8
	lsl r2, r5, #1
	ldrh r1, [r1, r2]
_021EF098:
	strh r1, [r0]
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021EF0A0: .word ov01_022067C8
	thumb_func_end ScrCmd_GetStdMsgNaix

	thumb_func_start ScrCmd_NonNpcMsgExtern
ScrCmd_NonNpcMsgExtern: ; 0x021EF0A4
	push {r4, r5, r6, lr}
	add r4, r0, #0
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
	bl VarGet
	add r6, r0, #0
	mov r0, #1
	mov r1, #0x1b
	add r2, r5, #0
	mov r3, #0x20
	bl NewMsgDataFromNarc
	add r5, r0, #0
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	bl ovFieldMain_ShowMessageInField
	add r0, r5, #0
	bl DestroyMsgData
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end ScrCmd_NonNpcMsgExtern

	thumb_func_start ScrCmd_MsgboxExtern
ScrCmd_MsgboxExtern: ; 0x021EF0F0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r4, r0, #0
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
	bl VarGet
	add r6, r0, #0
	mov r0, #1
	mov r1, #0x1b
	add r2, r5, #0
	mov r3, #0x20
	bl NewMsgDataFromNarc
	add r5, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, r4, #0
	add r1, r5, #0
	add r2, r6, #0
	mov r3, #1
	bl ov01_021EF4DC
	add r0, r5, #0
	bl DestroyMsgData
	ldr r1, _021EF150 ; =ov01_021EF348
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021EF150: .word ov01_021EF348
	thumb_func_end ScrCmd_MsgboxExtern

	thumb_func_start ScrCmd_441
ScrCmd_441: ; 0x021EF154
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	mov r0, #0xff
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov01_021EF564
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ScrCmd_441

	thumb_func_start ScrCmd_442
ScrCmd_442: ; 0x021EF194
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r6, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	str r0, [sp]
	mov r0, #1
	str r0, [sp, #4]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl ov01_021EF564
	ldr r1, _021EF1DC ; =ov01_021EF348
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EF1DC: .word ov01_021EF348
	thumb_func_end ScrCmd_442

	thumb_func_start ScrCmd_443
ScrCmd_443: ; 0x021EF1E0
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r2, [r5, #8]
	add r1, r2, #1
	str r1, [r5, #8]
	add r1, r5, #0
	add r1, #0x80
	ldr r1, [r1]
	ldrb r3, [r2]
	add r1, #0xa0
	ldr r2, [r1]
	cmp r2, #0
	bne _021EF202
	add sp, #8
	mov r0, #0
	pop {r4, r5, r6, pc}
_021EF202:
	lsl r1, r3, #4
	add r1, r3, r1
	add r2, #0x90
	lsl r1, r1, #4
	add r4, r2, r1
	ldrh r1, [r2, r1]
	ldr r2, _021EF25C ; =0x0000FFFF
	cmp r1, r2
	bne _021EF23A
	ldr r2, _021EF260 ; =0x000002D3
	mov r0, #1
	mov r1, #0x1b
	mov r3, #0x20
	bl NewMsgDataFromNarc
	add r6, r0, #0
	mov r0, #0
	str r0, [sp]
	ldrh r2, [r4, #2]
	add r0, r5, #0
	add r1, r6, #0
	mov r3, #1
	bl ov01_021EF4DC
	add r0, r6, #0
	bl DestroyMsgData
	b _021EF24C
_021EF23A:
	mov r2, #6
	ldrsh r2, [r4, r2]
	str r2, [sp]
	mov r2, #1
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	ldrh r3, [r4, #4]
	bl ov01_021EF564
_021EF24C:
	ldr r1, _021EF264 ; =ov01_021EF348
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r4, r5, r6, pc}
	nop
_021EF25C: .word 0x0000FFFF
_021EF260: .word 0x000002D3
_021EF264: .word ov01_021EF348
	thumb_func_end ScrCmd_443

	thumb_func_start ScrCmd_444
ScrCmd_444: ; 0x021EF268
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	add r1, #0x80
	ldr r2, [r5, #8]
	ldr r6, [r1]
	add r1, r2, #1
	str r1, [r5, #8]
	ldrb r4, [r2]
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r7, r0, #0
	add r0, r5, #0
	bl ScriptReadHalfword
	ldr r1, [r5, #8]
	add r2, r0, #0
	add r0, r1, #1
	str r0, [r5, #8]
	ldrb r3, [r1]
	mov r1, #0
	add r0, sp, #4
	strb r1, [r0]
	add r0, sp, #4
	str r0, [sp]
	ldr r0, [r6, #0xc]
	add r1, r7, #0
	bl sub_0204B538
	add r6, r0, #0
	add r2, sp, #4
	ldrb r2, [r2]
	add r0, r5, #0
	add r1, r6, #0
	add r2, r4, r2
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #1
	bl ov01_021EF5C8
	add r0, r6, #0
	bl ScrStrBufs_delete
	ldr r1, _021EF2DC ; =ov01_021EF348
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021EF2DC: .word ov01_021EF348
	thumb_func_end ScrCmd_444

	thumb_func_start ScrCmd_527
ScrCmd_527: ; 0x021EF2E0
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r4, r0, #0
	add r0, sp, #4
	add r1, r5, #0
	bl ov01_021EF4C4
	mov r1, #3
	add r0, sp, #4
	strb r1, [r0, #2]
	add r0, sp, #4
	str r0, [sp]
	ldr r1, [r5, #0x78]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #0
	bl ov01_021EF4DC
	ldr r1, _021EF318 ; =ov01_021EF348
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EF318: .word ov01_021EF348
	thumb_func_end ScrCmd_527

	thumb_func_start ScrCmd_NPCMsg
ScrCmd_NPCMsg: ; 0x021EF31C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	ldr r2, [r4, #8]
	mov r3, #1
	add r1, r2, #1
	str r1, [r4, #8]
	mov r1, #0
	str r1, [sp]
	ldrb r2, [r2]
	ldr r1, [r4, #0x78]
	bl ov01_021EF4DC
	ldr r1, _021EF344 ; =ov01_021EF348
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021EF344: .word ov01_021EF348
	thumb_func_end ScrCmd_NPCMsg

	thumb_func_start ov01_021EF348
ov01_021EF348: ; 0x021EF348
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #3
	bl FieldSysGetAttrAddr
	ldrb r0, [r0]
	bl IsPrintFinished
	pop {r3, pc}
	thumb_func_end ov01_021EF348

	thumb_func_start ScrCmd_NonNpcMsgVar
ScrCmd_NonNpcMsgVar: ; 0x021EF35C
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	lsl r2, r2, #0x18
	ldr r1, [r4, #0x78]
	add r0, r4, #0
	lsr r2, r2, #0x18
	mov r3, #1
	bl ov01_021EF4DC
	ldr r1, _021EF394 ; =ov01_021EF348
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	.balign 4, 0
_021EF394: .word ov01_021EF348
	thumb_func_end ScrCmd_NonNpcMsgVar

	thumb_func_start ScrCmd_592
ScrCmd_592: ; 0x021EF398
	push {r3, r4, r5, lr}
	sub sp, #8
	add r5, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r4, r0, #0
	add r0, sp, #4
	add r1, r5, #0
	bl ov01_021EF4C4
	lsl r2, r4, #0x18
	mov r3, #1
	add r0, sp, #4
	strb r3, [r0, #1]
	add r0, sp, #4
	str r0, [sp]
	ldr r1, [r5, #0x78]
	add r0, r5, #0
	lsr r2, r2, #0x18
	bl ov01_021EF4DC
	ldr r1, _021EF3DC ; =ov01_021EF348
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #8
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021EF3DC: .word ov01_021EF348
	thumb_func_end ScrCmd_592

	thumb_func_start ScrCmd_NpcMsgVar
ScrCmd_NpcMsgVar: ; 0x021EF3E0
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	bl ScriptReadHalfword
	add r1, r0, #0
	add r0, r4, #0
	add r0, #0x80
	ldr r0, [r0]
	bl VarGet
	add r2, r0, #0
	mov r3, #0
	str r3, [sp]
	lsl r2, r2, #0x18
	ldr r1, [r4, #0x78]
	add r0, r4, #0
	lsr r2, r2, #0x18
	bl ov01_021EF4DC
	ldr r1, _021EF418 ; =ov01_021EF348
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	nop
_021EF418: .word ov01_021EF348
	thumb_func_end ScrCmd_NpcMsgVar

	thumb_func_start ScrCmd_GenderMsgbox
ScrCmd_GenderMsgbox: ; 0x021EF41C
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	bl FieldSys_GetSaveDataPtr
	bl Sav2_PlayerData_GetProfileAddr
	ldr r0, [r5, #8]
	add r1, r0, #1
	str r1, [r5, #8]
	ldrb r6, [r0]
	add r0, r1, #1
	str r0, [r5, #8]
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	ldrb r4, [r1]
	bl FieldSys_GetSaveDataPtr
	bl Sav2_PlayerData_GetProfileAddr
	bl PlayerProfile_GetTrainerGender
	cmp r0, #0
	beq _021EF464
	mov r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x78]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #1
	bl ov01_021EF4DC
	b _021EF474
_021EF464:
	mov r0, #0
	str r0, [sp]
	ldr r1, [r5, #0x78]
	add r0, r5, #0
	add r2, r6, #0
	mov r3, #1
	bl ov01_021EF4DC
_021EF474:
	ldr r1, _021EF484 ; =ov01_021EF348
	add r0, r5, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	nop
_021EF484: .word ov01_021EF348
	thumb_func_end ScrCmd_GenderMsgbox

	thumb_func_start ScrCmd_455
ScrCmd_455: ; 0x021EF488
	push {r3, r4, lr}
	sub sp, #4
	add r4, r0, #0
	add r0, #0x80
	ldr r0, [r0]
	mov r1, #0xa
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	bl MapObject_GetType
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	mov r0, #0
	str r0, [sp]
	ldr r1, [r4, #0x78]
	add r0, r4, #0
	mov r3, #1
	bl ov01_021EF4DC
	ldr r1, _021EF4C0 ; =ov01_021EF348
	add r0, r4, #0
	bl SetupNativeScript
	mov r0, #1
	add sp, #4
	pop {r3, r4, pc}
	nop
_021EF4C0: .word ov01_021EF348
	thumb_func_end ScrCmd_455

	thumb_func_start ov01_021EF4C4
ov01_021EF4C4: ; 0x021EF4C4
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	bl ovFieldMain_GetTextFrameDelay
	strb r0, [r4]
	mov r0, #0
	strb r0, [r4, #1]
	mov r0, #1
	strb r0, [r4, #2]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ov01_021EF4C4

	thumb_func_start ov01_021EF4DC
ov01_021EF4DC: ; 0x021EF4DC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x20
	add r5, r0, #0
	str r3, [sp, #4]
	add r0, #0x80
	add r6, r1, #0
	ldr r0, [r0]
	add r1, sp, #8
	add r7, r2, #0
	ldr r4, [sp, #0x38]
	bl ovFieldMain_GetMsgBoxParameters
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, sp, #8
	bl ovFieldMain_CreateMessageBox
	add r0, sp, #8
	add r1, r6, #0
	add r2, r7, #0
	bl ovFieldMain_ReadAndExpandMsgDataViaBuffer
	cmp r4, #0
	bne _021EF51C
	add r0, r5, #0
	bl ovFieldMain_GetTextFrameDelay
	add r2, r0, #0
	mov r0, #0
	mov r1, #1
	b _021EF522
_021EF51C:
	ldrb r2, [r4]
	ldrb r0, [r4, #1]
	ldrb r1, [r4, #2]
_021EF522:
	str r0, [sp]
	ldr r3, [sp, #4]
	add r0, sp, #8
	bl ov01_021EF758
	add sp, #0x20
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end ov01_021EF4DC

	thumb_func_start ovFieldMain_ShowMessageInField
ovFieldMain_ShowMessageInField: ; 0x021EF530
	push {r4, r5, r6, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r0, #0x80
	add r4, r1, #0
	ldr r0, [r0]
	add r1, sp, #0
	add r6, r2, #0
	bl ovFieldMain_GetMsgBoxParameters
	add r5, #0x80
	ldr r0, [r5]
	add r1, sp, #0
	bl ovFieldMain_CreateMessageBox
	add r0, sp, #0
	add r1, r4, #0
	add r2, r6, #0
	bl ovFieldMain_ReadAndExpandMsgDataViaBuffer
	add r0, sp, #0
	mov r1, #1
	bl ovFieldMain_AddTextPrinterParameterized
	add sp, #0x18
	pop {r4, r5, r6, pc}
	thumb_func_end ovFieldMain_ShowMessageInField

	thumb_func_start ov01_021EF564
ov01_021EF564: ; 0x021EF564
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r0, #0x80
	add r4, r1, #0
	ldr r0, [r0]
	add r1, sp, #4
	add r6, r2, #0
	add r7, r3, #0
	bl ovFieldMain_GetMsgBoxParameters
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, sp, #4
	bl ovFieldMain_CreateMessageBox
	add r0, sp, #0x20
	ldrh r0, [r0, #0x10]
	add r1, r4, #0
	add r2, r6, #0
	str r0, [sp]
	add r0, sp, #4
	add r3, r7, #0
	bl ovFieldMain_GetFormattedECMessage
	add r0, sp, #0x20
	ldrb r0, [r0, #0x14]
	cmp r0, #0xff
	beq _021EF5BC
	add r0, r5, #0
	bl ovFieldMain_GetTextFrameDelay
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	add r3, sp, #0x20
	ldrb r3, [r3, #0x14]
	add r0, sp, #4
	mov r1, #1
	bl ov01_021EF758
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
_021EF5BC:
	add r0, sp, #4
	mov r1, #1
	bl ovFieldMain_AddTextPrinterParameterized
	add sp, #0x1c
	pop {r4, r5, r6, r7, pc}
	thumb_func_end ov01_021EF564

	thumb_func_start ov01_021EF5C8
ov01_021EF5C8: ; 0x021EF5C8
	push {r3, r4, r5, r6, lr}
	sub sp, #0x1c
	add r5, r0, #0
	add r0, #0x80
	add r4, r2, #0
	ldr r0, [r0]
	add r2, sp, #4
	add r6, r3, #0
	bl ovFieldMain_GetMsgBoxParametersEx
	add r0, r5, #0
	add r0, #0x80
	ldr r0, [r0]
	add r1, sp, #4
	bl ovFieldMain_CreateMessageBox
	ldr r1, [r5, #0x78]
	add r0, sp, #4
	add r2, r4, #0
	bl ovFieldMain_ReadAndExpandMsgDataViaBuffer
	add r0, r5, #0
	bl ovFieldMain_GetTextFrameDelay
	add r2, r0, #0
	mov r0, #0
	str r0, [sp]
	add r0, sp, #4
	mov r1, #1
	add r3, r6, #0
	bl ov01_021EF758
	add sp, #0x1c
	pop {r3, r4, r5, r6, pc}
	thumb_func_end ov01_021EF5C8

	thumb_func_start ovFieldMain_GetTextFrameDelay
ovFieldMain_GetTextFrameDelay: ; 0x021EF60C
	push {r3, lr}
	add r0, #0x80
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	bl Options_GetTextFrameDelay
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end ovFieldMain_GetTextFrameDelay

	thumb_func_start ovFieldMain_GetMsgBoxParameters
ovFieldMain_GetMsgBoxParameters: ; 0x021EF620
	push {r3, r4, r5, lr}
	add r4, r1, #0
	mov r1, #0x11
	add r5, r0, #0
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	mov r1, #0x12
	str r0, [r4]
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	mov r1, #0x10
	str r0, [r4, #4]
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	mov r1, #1
	str r0, [r4, #8]
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	str r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #6
	bl FieldSysGetAttrAddr
	str r0, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl FieldSysGetAttrAddr
	str r0, [r4, #0x14]
	pop {r3, r4, r5, pc}
	thumb_func_end ovFieldMain_GetMsgBoxParameters

	thumb_func_start ovFieldMain_GetMsgBoxParametersEx
ovFieldMain_GetMsgBoxParametersEx: ; 0x021EF668
	push {r4, r5, r6, lr}
	add r6, r1, #0
	mov r1, #0x11
	add r5, r0, #0
	add r4, r2, #0
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	mov r1, #0x12
	str r0, [r4]
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	ldr r0, [r0]
	mov r1, #1
	str r0, [r4, #4]
	str r6, [r4, #8]
	add r0, r5, #0
	bl FieldSysGetAttrAddr
	str r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #6
	bl FieldSysGetAttrAddr
	str r0, [r4, #0x10]
	add r0, r5, #0
	mov r1, #3
	bl FieldSysGetAttrAddr
	str r0, [r4, #0x14]
	pop {r4, r5, r6, pc}
	thumb_func_end ovFieldMain_GetMsgBoxParametersEx

	thumb_func_start ovFieldMain_CreateMessageBox
ovFieldMain_CreateMessageBox: ; 0x021EF6A8
	push {r3, r4, r5, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x10]
	ldrb r0, [r0]
	cmp r0, #0
	bne _021EF6E2
	ldr r0, [r5, #8]
	ldr r1, [r4, #0xc]
	mov r2, #3
	bl sub_0205B514
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r1, r0, #0
	ldr r0, [r4, #0xc]
	bl sub_0205B564
	ldr r0, [r4, #0x10]
	mov r1, #1
	strb r1, [r0]
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r5, #0xd2
	orr r0, r1
	strb r0, [r5]
_021EF6E2:
	ldr r0, [r4, #0xc]
	mov r1, #0xf
	bl FillWindowPixelBuffer
	pop {r3, r4, r5, pc}
	thumb_func_end ovFieldMain_CreateMessageBox

	thumb_func_start ovFieldMain_ReadAndExpandMsgDataViaBuffer
ovFieldMain_ReadAndExpandMsgDataViaBuffer: ; 0x021EF6EC
	push {r4, lr}
	add r4, r0, #0
	add r0, r1, #0
	add r1, r2, #0
	ldr r2, [r4, #4]
	bl ReadMsgDataIntoString
	ldr r0, [r4, #8]
	ldr r1, [r4]
	ldr r2, [r4, #4]
	bl StringExpandPlaceholders
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ovFieldMain_ReadAndExpandMsgDataViaBuffer

	thumb_func_start ovFieldMain_GetFormattedECMessage
ovFieldMain_GetFormattedECMessage: ; 0x021EF708
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r4, r1, #0
	add r6, r2, #0
	add r0, sp, #0
	add r7, r3, #0
	bl MailMsg_init
	add r0, sp, #0
	add r1, r4, #0
	add r2, r6, #0
	bl MailMsg_SetMsgBankAndNum
	add r0, sp, #0
	mov r1, #0
	add r2, r7, #0
	bl MailMsg_SetFieldI
	add r2, sp, #0x10
	ldrh r2, [r2, #0x10]
	add r0, sp, #0
	mov r1, #1
	bl MailMsg_SetFieldI
	add r0, sp, #0
	mov r1, #0x20
	bl MailMsg_GetExpandedString
	add r4, r0, #0
	ldr r0, [r5]
	add r1, r4, #0
	bl StringCopy
	add r0, r4, #0
	bl String_dtor
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end ovFieldMain_GetFormattedECMessage

	thumb_func_start ov01_021EF758
ov01_021EF758: ; 0x021EF758
	push {r4, r5, r6, lr}
	sub sp, #8
	add r4, r0, #0
	lsl r0, r3, #0x18
	lsr r0, r0, #0x18
	str r0, [sp]
	ldr r0, [sp, #0x18]
	add r5, r2, #0
	str r0, [sp, #4]
	add r6, r1, #0
	ldr r0, [r4, #0xc]
	ldr r1, [r4]
	add r2, r6, #0
	add r3, r5, #0
	bl sub_0205B5EC
	ldr r1, [r4, #0x14]
	strb r0, [r1]
	add sp, #8
	pop {r4, r5, r6, pc}
	thumb_func_end ov01_021EF758

	thumb_func_start ovFieldMain_AddTextPrinterParameterized
ovFieldMain_AddTextPrinterParameterized: ; 0x021EF780
	push {r3, r4, lr}
	sub sp, #0xc
	mov r3, #0
	str r3, [sp]
	str r3, [sp, #4]
	add r4, r0, #0
	str r3, [sp, #8]
	ldr r0, [r4, #0xc]
	ldr r2, [r4]
	bl AddTextPrinterParameterized
	ldr r1, [r4, #0x14]
	strb r0, [r1]
	add sp, #0xc
	pop {r3, r4, pc}
	.balign 4, 0
	thumb_func_end ovFieldMain_AddTextPrinterParameterized

	.rodata

ov01_022067C8: ; 0x022067C8
	.short 0x02F0 ; NARC_msg_msg_0752_bin
	.short 0x00D3 ; NARC_msg_msg_0211_bin
	.short 0x001E ; NARC_msg_msg_0030_bin
	.short 0x01B3 ; NARC_msg_msg_0435_bin
