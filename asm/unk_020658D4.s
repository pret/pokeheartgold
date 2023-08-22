#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "constants/party_menu.h"
	.include "asm/macros.inc"
	.include "unk_020658D4.inc"
	.include "global.inc"

	.text

	thumb_func_start sub_020658D4
sub_020658D4: ; 0x020658D4
	push {r4, lr}
	add r4, r0, #0
	mov r1, #0xc
	bl sub_0205F370
	add r1, r0, #0
	add r0, r4, #0
	bl sub_02065CD0
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl MapObject_SingleMovementSetInactive
	add r0, r4, #0
	mov r1, #0
	bl MapObject_ClearFlag18
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end sub_020658D4

	thumb_func_start sub_02065900
sub_02065900: ; 0x02065900
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065CD0
	cmp r0, #0
	beq _02065930
	add r0, r5, #0
	mov r1, #0
	bl MapObject_ClearFlag18
	ldr r6, _02065934 ; =_020FE404
_02065920:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02065920
_02065930:
	pop {r4, r5, r6, pc}
	nop
_02065934: .word _020FE404
	thumb_func_end sub_02065900

	thumb_func_start sub_02065938
sub_02065938: ; 0x02065938
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065CD0
	cmp r0, #0
	beq _02065960
	ldr r6, _02065964 ; =_020FE414
_02065950:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02065950
_02065960:
	pop {r4, r5, r6, pc}
	nop
_02065964: .word _020FE414
	thumb_func_end sub_02065938

	thumb_func_start sub_02065968
sub_02065968: ; 0x02065968
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065CD0
	cmp r0, #0
	beq _02065990
	ldr r6, _02065994 ; =_020FE424
_02065980:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02065980
_02065990:
	pop {r4, r5, r6, pc}
	nop
_02065994: .word _020FE424
	thumb_func_end sub_02065968

	thumb_func_start sub_02065998
sub_02065998: ; 0x02065998
	bx lr
	.balign 4, 0
	thumb_func_end sub_02065998

	thumb_func_start sub_0206599C
sub_0206599C: ; 0x0206599C
	push {r3, lr}
	bl sub_0205F394
	ldrb r0, [r0, #3]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206599C

	thumb_func_start sub_020659A8
sub_020659A8: ; 0x020659A8
	push {r3, lr}
	bl sub_0205F394
	ldrh r0, [r0, #0xa]
	lsl r0, r0, #0x1d
	lsr r0, r0, #0x1e
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_020659A8

	thumb_func_start sub_020659B8
sub_020659B8: ; 0x020659B8
	push {r3, lr}
	bl sub_0205F394
	ldrh r2, [r0, #0xa]
	mov r1, #1
	bic r2, r1
	mov r1, #1
	orr r1, r2
	strh r1, [r0, #0xa]
	pop {r3, pc}
	thumb_func_end sub_020659B8

	thumb_func_start sub_020659CC
sub_020659CC: ; 0x020659CC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	bl MapObject_GetFieldSysPtr
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0205F394
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	add r0, r5, #0
	bl MapObject_ClearFlag3
	add r0, r5, #0
	mov r1, #0x20
	bl MapObject_ClearFlagsBits
	add r0, r5, #0
	mov r1, #0xff
	bl MapObject_SetMovementCommand
	add r0, r5, #0
	mov r1, #0
	bl MapObject_SetMovementStep
	mov r1, #0
	add r0, r4, #0
	strb r1, [r6]
	add r0, #0xe8 ; ->followMon.effectTimer
	str r1, [r0]
	mov r0, #1
	lsl r0, r0, #8 ; ->followMon.fieldSystem
	str r1, [r4, r0]
	add r0, r4, #0
	add r0, #0xec ; ->followMon.duration
	str r1, [r0]
	add r4, #0xf0 ; ->followMon.parentData
	add r0, r5, #0
	str r1, [r4]
	bl MapObject_GetCurrentX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentHeight
	add r6, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	str r0, [sp]
	add r0, r5, #0
	add r1, r4, #0
	add r2, r6, #0
	add r3, r7, #0
	bl sub_0205FC2C
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020659CC

	thumb_func_start sub_02065A4C
sub_02065A4C: ; 0x02065A4C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r6, r1, #0
	bl MapObject_GetFieldSysPtr
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	add r0, r5, #0
	bl MapObject_ClearFlag3
	mov r0, #1
	lsl r0, r0, #8
	ldr r1, [r4, r0]
	cmp r1, #1
	bne _02065A76
	mov r1, #2
	str r1, [r4, r0]
	mov r0, #0
	pop {r4, r5, r6, pc}
_02065A76:
	cmp r1, #2
	bne _02065B64
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02065D58
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r1, r4, #0
	add r1, #0xec
	ldr r1, [r1]
	cmp r1, r0
	bne _02065B12
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r1, r4, #0
	add r1, #0xf0
	ldr r1, [r1]
	cmp r1, r0
	bne _02065B12
	mov r0, #1
	mov r1, #0
	lsl r0, r0, #8
	str r1, [r4, r0]
	mov r0, #3
	strb r0, [r6]
	add r0, r5, #0
	bl sub_02069E14
	cmp r0, #0
	beq _02065AEA
	ldrh r0, [r6, #0xa]
	lsl r0, r0, #0x1f
	lsr r0, r0, #0x1f
	bne _02065AEA
	add r0, r5, #0
	bl sub_02069EAC
	cmp r0, #0
	beq _02065ADC
	add r0, r5, #0
	mov r1, #0
	bl ov01_0220329C
	add r0, r5, #0
	mov r1, #0
	bl sub_02069E84
	b _02065AE4
_02065ADC:
	add r0, r5, #0
	mov r1, #0
	bl sub_02069DC8
_02065AE4:
	add r0, r5, #0
	bl sub_020664D8
_02065AEA:
	add r0, r5, #0
	bl sub_02065D78
	bl sub_020623C8
	cmp r0, #0
	beq _02065B0E
	add r0, r4, #0
	bl FieldSystem_GetPlayerAvatar
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E28
_02065B0E:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02065B12:
	add r0, r5, #0
	add r1, r6, #0
	bl sub_02065DF4
	cmp r0, #1
	bne _02065B6C
	add r0, r5, #0
	bl sub_02069E14
	cmp r0, #0
	beq _02065B52
	add r0, r5, #0
	bl sub_02069EAC
	cmp r0, #0
	beq _02065B44
	add r0, r5, #0
	mov r1, #0
	bl ov01_0220329C
	add r0, r5, #0
	mov r1, #0
	bl sub_02069E84
	b _02065B4C
_02065B44:
	add r0, r5, #0
	mov r1, #0
	bl sub_02069DC8
_02065B4C:
	add r0, r5, #0
	bl sub_020664D8
_02065B52:
	add r0, r5, #0
	bl MapObject_SingleMovementSetActive
	mov r1, #3
	add r0, r1, #0
	add r0, #0xfd
	str r1, [r4, r0]
	mov r0, #1
	pop {r4, r5, r6, pc}
_02065B64:
	cmp r1, #3
	bne _02065B6C
	mov r1, #0
	str r1, [r4, r0]
_02065B6C:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02065A4C

	thumb_func_start sub_02065B70
sub_02065B70: ; 0x02065B70
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_SingleMovementSetInactive
	add r0, r5, #0
	bl MapObject_ClearFlag3
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065D24
	cmp r0, #1
	bne _02065BE2
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065D58
	add r0, r5, #0
	bl sub_02069E14
	cmp r0, #0
	beq _02065BC8
	add r0, r5, #0
	bl sub_02069EAC
	cmp r0, #0
	beq _02065BBA
	add r0, r5, #0
	mov r1, #0
	bl ov01_0220329C
	add r0, r5, #0
	mov r1, #0
	bl sub_02069E84
	b _02065BC2
_02065BBA:
	add r0, r5, #0
	mov r1, #0
	bl sub_02069DC8
_02065BC2:
	add r0, r5, #0
	bl sub_020664D8
_02065BC8:
	add r0, r5, #0
	bl sub_02065F44
	cmp r0, #1
	bne _02065BE2
	add r0, r5, #0
	bl MapObject_SingleMovementSetActive
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_02065BE2:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065B70

	thumb_func_start sub_02065BE8
sub_02065BE8: ; 0x02065BE8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_SingleMovementSetInactive
	add r0, r5, #0
	bl MapObject_ClearFlag3
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065D24
	cmp r0, #1
	bne _02065C26
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065D58
	add r0, r5, #0
	bl sub_02065FBC
	cmp r0, #1
	bne _02065C26
	add r0, r5, #0
	bl MapObject_SingleMovementSetActive
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_02065C26:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065BE8

	thumb_func_start sub_02065C2C
sub_02065C2C: ; 0x02065C2C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #1
	bne _02065C44
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	mov r0, #0
	strb r0, [r4]
_02065C44:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02065C2C

	thumb_func_start sub_02065C48
sub_02065C48: ; 0x02065C48
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #1
	bne _02065C86
	ldrb r0, [r4, #2]
	add r0, r0, #1
	strb r0, [r4, #2]
	ldrb r0, [r4, #2]
	cmp r0, #2
	blo _02065C78
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	mov r0, #0
	strb r0, [r4]
	strb r0, [r4, #3]
	ldrh r2, [r4, #0xa]
	mov r1, #6
	bic r2, r1
	strh r2, [r4, #0xa]
	pop {r3, r4, r5, pc}
_02065C78:
	add r0, r5, #0
	bl sub_02069ED4
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_ForceSetHeldMovement
_02065C86:
	ldrb r0, [r4, #3]
	add r0, r0, #1
	strb r0, [r4, #3]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02065C48

	thumb_func_start sub_02065C90
sub_02065C90: ; 0x02065C90
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl MapObject_GetFieldSysPtr
	bl FieldSystem_GetPlayerAvatar
	add r4, r0, #0
	bl PlayerAvatar_GetMapObject
	mov r1, #0x10
	add r6, r0, #0
	bl MapObject_TestFlagsBits
	cmp r0, #1
	bne _02065CBE
	add r0, r6, #0
	mov r1, #0x20
	bl MapObject_TestFlagsBits
	cmp r0, #1
	bne _02065CBE
	mov r0, #0
	strb r0, [r5]
_02065CBE:
	add r0, r4, #0
	bl sub_0205C6D4
	cmp r0, #3
	bne _02065CCC
	mov r0, #0
	strb r0, [r5]
_02065CCC:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02065C90

	thumb_func_start sub_02065CD0
sub_02065CD0: ; 0x02065CD0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_GetManager
	bl sub_0205C600
	cmp r0, #0
	bne _02065CE8
	mov r0, #0
	strb r0, [r4, #1]
	pop {r3, r4, r5, pc}
_02065CE8:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _02065CF6
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02065CFC
_02065CF6:
	mov r0, #1
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065CD0

	thumb_func_start sub_02065CFC
sub_02065CFC: ; 0x02065CFC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl MapObject_GetFieldSysPtr
	bl FieldSystem_GetPlayerAvatar
	mov r1, #1
	add r4, r0, #0
	strb r1, [r5, #1]
	bl GetPlayerXCoord
	strh r0, [r5, #4]
	add r0, r4, #0
	bl GetPlayerYCoord
	strh r0, [r5, #6]
	mov r0, #0xff
	strh r0, [r5, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065CFC

	thumb_func_start sub_02065D24
sub_02065D24: ; 0x02065D24
	push {r4, r5, r6, lr}
	add r5, r1, #0
	bl MapObject_GetFieldSysPtr
	bl FieldSystem_GetPlayerAvatar
	add r6, r0, #0
	beq _02065D54
	bl GetPlayerXCoord
	add r4, r0, #0
	add r0, r6, #0
	bl GetPlayerYCoord
	mov r1, #4
	ldrsh r1, [r5, r1]
	cmp r4, r1
	bne _02065D50
	mov r1, #6
	ldrsh r1, [r5, r1]
	cmp r0, r1
	beq _02065D54
_02065D50:
	mov r0, #1
	pop {r4, r5, r6, pc}
_02065D54:
	mov r0, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_02065D24

	thumb_func_start sub_02065D58
sub_02065D58: ; 0x02065D58
	push {r3, r4, r5, lr}
	add r5, r1, #0
	bl MapObject_GetFieldSysPtr
	bl FieldSystem_GetPlayerAvatar
	add r4, r0, #0
	bl GetPlayerXCoord
	strh r0, [r5, #4]
	add r0, r4, #0
	bl GetPlayerYCoord
	strh r0, [r5, #6]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065D58

	thumb_func_start sub_02065D78
sub_02065D78: ; 0x02065D78
	push {r4, lr}
	bl MapObject_GetFieldSysPtr
	add r4, r0, #0
	bl FieldSystem_GetPlayerAvatar
	add r4, #0xe8
	ldr r0, [r4]
	add r1, r0, #0
	sub r1, #0x58
	cmp r1, #3
	bhi _02065DB2
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02065D9C: ; jump table
	.short _02065DA4 - _02065D9C - 2 ; case 0
	.short _02065DA8 - _02065D9C - 2 ; case 1
	.short _02065DAC - _02065D9C - 2 ; case 2
	.short _02065DB0 - _02065D9C - 2 ; case 3
_02065DA4:
	mov r0, #0x10
	pop {r4, pc}
_02065DA8:
	mov r0, #0x11
	pop {r4, pc}
_02065DAC:
	mov r0, #0x12
	pop {r4, pc}
_02065DB0:
	mov r0, #0x13
_02065DB2:
	pop {r4, pc}
	thumb_func_end sub_02065D78

	thumb_func_start sub_02065DB4
sub_02065DB4: ; 0x02065DB4
	push {r3, lr}
	bl MapObject_GetFieldSysPtr
	bl FieldSystem_GetPlayerAvatar
	bl PlayerAvatar_GetMapObject
	bl MapObject_GetMovementCommand
	add r1, r0, #0
	sub r1, #0x58
	cmp r1, #3
	bhi _02065DF0
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_02065DDA: ; jump table
	.short _02065DE2 - _02065DDA - 2 ; case 0
	.short _02065DE6 - _02065DDA - 2 ; case 1
	.short _02065DEA - _02065DDA - 2 ; case 2
	.short _02065DEE - _02065DDA - 2 ; case 3
_02065DE2:
	mov r0, #0x10
	pop {r3, pc}
_02065DE6:
	mov r0, #0x11
	pop {r3, pc}
_02065DEA:
	mov r0, #0x12
	pop {r3, pc}
_02065DEE:
	mov r0, #0x13
_02065DF0:
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_02065DB4

	thumb_func_start sub_02065DF4
sub_02065DF4: ; 0x02065DF4
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x18
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_GetFieldSysPtr
	bl FieldSystem_GetPlayerAvatar
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	str r0, [sp, #8]
	add r0, r5, #0
	bl MapObject_GetCurrentY
	str r0, [sp, #4]
	add r0, r7, #0
	bl GetPlayerLastXCoord
	str r0, [sp]
	add r0, r7, #0
	bl GetPlayerLastYCoord
	add r6, r0, #0
	ldr r1, [sp, #8]
	ldr r0, [sp]
	cmp r1, r0
	bne _02065E36
	ldr r0, [sp, #4]
	cmp r0, r6
	bne _02065E36
	b _02065F3C
_02065E36:
	add r0, r5, #0
	bl sub_02065D78
	str r0, [sp, #0x10]
	ldr r0, [sp, #8]
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r3, r6, #0
	bl sub_02061200
	str r0, [sp, #0x14]
	add r0, r5, #0
	bl sub_02069EC0
	add r6, r0, #0
	ldr r0, [sp, #0x10]
	bl sub_020623C8
	mov r1, #1
	str r1, [sp, #0xc]
	cmp r6, #0
	beq _02065F00
	cmp r0, #0
	beq _02065EB4
	add r0, r6, #0
	bl sub_020623D8
	add r1, r0, #0
	add r0, r6, #0
	bl ov01_0220542C
	add r6, r0, #0
	bl sub_02066444
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1e
	ldrh r1, [r4, #0xa]
	mov r2, #6
	lsr r0, r0, #0x1d
	bic r1, r2
	orr r0, r1
	lsl r1, r6, #0x18
	strh r0, [r4, #0xa]
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E50
	mov r0, #2
	str r0, [sp, #0xc]
	mov r0, #0
	strb r0, [r4, #2]
	strb r0, [r4, #3]
	add r0, r7, #0
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E28
	b _02065F2A
_02065EB4:
	add r0, r7, #0
	bl sub_0205CB00
	cmp r0, #0
	bne _02065EC4
	add sp, #0x18
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02065EC4:
	ldr r1, [sp, #0x10]
	add r0, r6, #0
	bl ov01_0220542C
	add r6, r0, #0
	bl sub_02066444
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1e
	ldrh r1, [r4, #0xa]
	mov r2, #6
	lsr r0, r0, #0x1d
	bic r1, r2
	orr r0, r1
	lsl r1, r6, #0x18
	strh r0, [r4, #0xa]
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E50
	mov r0, #2
	str r0, [sp, #0xc]
	mov r1, #0
	strb r1, [r4, #2]
	add r0, r5, #0
	strb r1, [r4, #3]
	bl sub_02069E28
	b _02065F2A
_02065F00:
	cmp r0, #0
	beq _02065F20
	ldr r0, [sp, #0x14]
	bl sub_020623D8
	add r6, r0, #0
	add r0, r7, #0
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r5, #0
	lsr r1, r1, #0x18
	bl sub_02069E28
	b _02065F2A
_02065F20:
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x10]
	bl sub_0206234C
	add r6, r0, #0
_02065F2A:
	add r0, r5, #0
	add r1, r6, #0
	bl MapObject_ForceSetHeldMovement
	ldr r0, [sp, #0xc]
	add sp, #0x18
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02065F3C:
	mov r0, #0
	add sp, #0x18
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02065DF4

	thumb_func_start sub_02065F44
sub_02065F44: ; 0x02065F44
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	bl MapObject_GetFieldSysPtr
	bl FieldSystem_GetPlayerAvatar
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	str r0, [sp]
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r7, r0, #0
	add r0, r4, #0
	bl GetPlayerLastXCoord
	add r6, r0, #0
	add r0, r4, #0
	bl GetPlayerLastYCoord
	add r4, r0, #0
	ldr r0, [sp]
	cmp r0, r6
	bne _02065F7E
	cmp r7, r4
	beq _02065FB4
_02065F7E:
	add r0, r5, #0
	bl sub_02065DB4
	str r0, [sp, #4]
	ldr r0, [sp]
	add r1, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl sub_02061200
	ldr r1, [sp, #4]
	cmp r1, #0xff
	bne _02065FA2
	bl GF_AssertFail
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02065FA2:
	bl sub_0206234C
	add r1, r0, #0
	add r0, r5, #0
	bl MapObject_ForceSetHeldMovement
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02065FB4:
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02065F44

	thumb_func_start sub_02065FBC
sub_02065FBC: ; 0x02065FBC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl MapObject_GetFieldSysPtr
	bl FieldSystem_GetPlayerAvatar
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r0, r4, #0
	bl GetPlayerLastXCoord
	add r0, r4, #0
	bl GetPlayerLastYCoord
	add r0, r5, #0
	bl sub_02065DB4
	add r1, r0, #0
	cmp r1, #0xff
	bne _02065FF2
	mov r0, #0
	pop {r3, r4, r5, pc}
_02065FF2:
	add r0, r5, #0
	bl MapObject_ForceSetHeldMovement
	mov r0, #1
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02065FBC

	thumb_func_start sub_02065FFC
sub_02065FFC: ; 0x02065FFC
	push {r3, r4, r5, lr}
	mov r1, #0xc
	add r5, r0, #0
	bl sub_0205F370
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02066150
	add r0, r5, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	mov r0, #0
	strb r0, [r4, #1]
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02065FFC

	thumb_func_start sub_02066024
sub_02066024: ; 0x02066024
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_02066150
	cmp r0, #0
	beq _0206604C
	ldr r6, _02066050 ; =_020FE3D4
_0206603C:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _0206603C
_0206604C:
	pop {r4, r5, r6, pc}
	nop
_02066050: .word _020FE3D4
	thumb_func_end sub_02066024

	thumb_func_start sub_02066054
sub_02066054: ; 0x02066054
	bx lr
	.balign 4, 0
	thumb_func_end sub_02066054

	thumb_func_start sub_02066058
sub_02066058: ; 0x02066058
	push {r3, lr}
	bl sub_0205F394
	mov r1, #0
	strb r1, [r0, #1]
	pop {r3, pc}
	thumb_func_end sub_02066058

	thumb_func_start sub_02066064
sub_02066064: ; 0x02066064
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl MapObject_SingleMovementSetInactive
	add r0, r5, #0
	bl MapObject_ClearFlag3
	add r0, r5, #0
	add r1, r4, #0
	bl sub_020661F0
	cmp r0, #1
	bne _0206609C
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0206623C
	cmp r0, #1
	bne _0206609C
	add r0, r5, #0
	bl MapObject_SingleMovementSetActive
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #1
	pop {r3, r4, r5, pc}
_0206609C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_02066064

	thumb_func_start sub_020660A0
sub_020660A0: ; 0x020660A0
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	bl sub_02062428
	cmp r0, #0
	bne _020660B2
	mov r0, #0
	pop {r3, r4, r5, pc}
_020660B2:
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	mov r0, #0
	strb r0, [r4]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020660A0

	thumb_func_start sub_020660C0
sub_020660C0: ; 0x020660C0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	mov r1, #0
	add r4, r0, #0
	str r1, [sp, #8]
	bl MapObject_GetType
	str r0, [sp]
	add r0, r4, #0
	bl sub_0205F254
	add r6, r0, #0
	add r0, r4, #0
	bl sub_02064518
	add r5, r0, #0
	add r0, r4, #0
	bl MapObject_GetManager
	ldr r1, [sp]
	add r7, r0, #0
	cmp r1, #8
	bhi _02066148
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_020660FA: ; jump table
	.short _02066148 - _020660FA - 2 ; case 0
	.short _0206610C - _020660FA - 2 ; case 1
	.short _0206610C - _020660FA - 2 ; case 2
	.short _0206610C - _020660FA - 2 ; case 3
	.short _0206610C - _020660FA - 2 ; case 4
	.short _0206610C - _020660FA - 2 ; case 5
	.short _0206610C - _020660FA - 2 ; case 6
	.short _0206610C - _020660FA - 2 ; case 7
	.short _0206610C - _020660FA - 2 ; case 8
_0206610C:
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	bne _02066148
_0206611A:
	ldr r0, [sp, #4]
	cmp r4, r0
	beq _02066138
	bl sub_0205F254
	cmp r6, r0
	bne _02066138
	ldr r0, [sp, #4]
	bl sub_02064518
	cmp r5, r0
	bne _02066138
	ldr r0, [sp, #4]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
_02066138:
	add r0, r7, #0
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _0206611A
_02066148:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020660C0

	thumb_func_start sub_02066150
sub_02066150: ; 0x02066150
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	str r1, [sp]
	bl MapObject_GetManager
	add r4, r0, #0
	mov r0, #0
	str r0, [sp, #8]
	add r0, r5, #0
	bl sub_0205F254
	add r7, r0, #0
	add r0, r5, #0
	bl sub_02064518
	add r6, r0, #0
	add r0, r4, #0
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	bne _020661C2
_02066182:
	ldr r0, [sp, #4]
	cmp r5, r0
	beq _020661B2
	bl sub_0205F254
	cmp r7, r0
	bne _020661B2
	ldr r0, [sp, #4]
	bl sub_02064518
	cmp r6, r0
	bne _020661B2
	ldr r0, [sp]
	ldrb r0, [r0, #1]
	cmp r0, #0
	bne _020661AC
	ldr r1, [sp]
	ldr r2, [sp, #4]
	add r0, r5, #0
	bl sub_020661CC
_020661AC:
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020661B2:
	add r0, r4, #0
	add r1, sp, #4
	add r2, sp, #8
	mov r3, #1
	bl sub_0205EEF4
	cmp r0, #1
	beq _02066182
_020661C2:
	ldr r1, [sp]
	mov r0, #0
	strb r0, [r1, #1]
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02066150

	thumb_func_start sub_020661CC
sub_020661CC: ; 0x020661CC
	push {r3, r4, r5, lr}
	add r5, r1, #0
	mov r0, #1
	add r4, r2, #0
	strb r0, [r5, #1]
	add r0, r4, #0
	bl MapObject_GetCurrentX
	strh r0, [r5, #2]
	add r0, r4, #0
	bl MapObject_GetCurrentY
	strh r0, [r5, #4]
	mov r0, #0xff
	strh r0, [r5, #6]
	str r4, [r5, #8]
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_020661CC

	thumb_func_start sub_020661F0
sub_020661F0: ; 0x020661F0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r5, [r1, #8]
	bl MapObject_GetCurrentX
	add r6, r0, #0
	add r0, r4, #0
	bl MapObject_GetCurrentY
	add r7, r0, #0
	add r0, r5, #0
	bl MapObject_GetPrevX
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetPrevY
	cmp r6, r4
	bne _0206621A
	cmp r7, r0
	beq _02066236
_0206621A:
	add r0, r5, #0
	bl MapObject_IsSingleMovementActive
	cmp r0, #1
	beq _02066232
	mov r1, #0x61
	add r0, r5, #0
	lsl r1, r1, #6
	bl MapObject_GetFlagsMask
	cmp r0, #0
	bne _02066236
_02066232:
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02066236:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_020661F0

	thumb_func_start sub_0206623C
sub_0206623C: ; 0x0206623C
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	str r0, [sp]
	add r5, r1, #0
	bl MapObject_GetCurrentX
	add r4, r0, #0
	ldr r0, [sp]
	bl MapObject_GetCurrentY
	add r6, r0, #0
	ldr r0, [r5, #8]
	bl MapObject_GetCurrentX
	str r0, [sp, #8]
	ldr r0, [r5, #8]
	bl MapObject_GetCurrentY
	add r7, r0, #0
	ldr r0, [r5, #8]
	bl MapObject_GetPrevX
	str r0, [sp, #4]
	ldr r0, [r5, #8]
	bl MapObject_GetPrevY
	add r3, r0, #0
	ldr r0, [sp, #8]
	cmp r4, r0
	bne _02066282
	cmp r6, r7
	bne _02066282
	add sp, #0xc
	mov r0, #0
	pop {r4, r5, r6, r7, pc}
_02066282:
	ldr r2, [sp, #4]
	add r0, r4, #0
	add r1, r6, #0
	bl sub_02061200
	add r5, r0, #0
	bl GetDeltaXByFacingDirection
	add r4, r4, r0
	add r0, r5, #0
	bl GetDeltaYByFacingDirection
	add r1, r6, r0
	ldr r0, [sp, #8]
	cmp r4, r0
	bne _020662A6
	cmp r1, r7
	beq _020662BC
_020662A6:
	add r0, r5, #0
	mov r1, #0xc
	bl sub_0206234C
	add r1, r0, #0
	ldr r0, [sp]
	bl MapObject_ForceSetHeldMovement
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_020662BC:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_0206623C

	thumb_func_start sub_020662C4
sub_020662C4: ; 0x020662C4
	push {r4, r5, lr}
	sub sp, #0xc
	add r5, r1, #0
	add r4, r0, #0
	mov r1, #8
	bl sub_0205F370
	strb r5, [r0, #1]
	add r0, r4, #0
	mov r1, #0
	bl sub_0205F328
	add r0, r4, #0
	bl MapObject_SingleMovementSetInactive
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0x14
	bl MapObject_SetFlagsBits
	ldr r5, _02066308 ; =_020FE3DC
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r2, #0
	str r0, [r3]
	add r0, r4, #0
	bl MapObject_SetFacingVec
	add sp, #0xc
	pop {r4, r5, pc}
	nop
_02066308: .word _020FE3DC
	thumb_func_end sub_020662C4

	thumb_func_start sub_0206630C
sub_0206630C: ; 0x0206630C
	ldr r3, _02066314 ; =sub_020662C4
	mov r1, #0
	bx r3
	nop
_02066314: .word sub_020662C4
	thumb_func_end sub_0206630C

	thumb_func_start sub_02066318
sub_02066318: ; 0x02066318
	ldr r3, _02066320 ; =sub_020662C4
	mov r1, #1
	bx r3
	nop
_02066320: .word sub_020662C4
	thumb_func_end sub_02066318

	thumb_func_start sub_02066324
sub_02066324: ; 0x02066324
	ldr r3, _0206632C ; =sub_020662C4
	mov r1, #2
	bx r3
	nop
_0206632C: .word sub_020662C4
	thumb_func_end sub_02066324

	thumb_func_start sub_02066330
sub_02066330: ; 0x02066330
	ldr r3, _02066338 ; =sub_020662C4
	mov r1, #3
	bx r3
	nop
_02066338: .word sub_020662C4
	thumb_func_end sub_02066330

	thumb_func_start sub_0206633C
sub_0206633C: ; 0x0206633C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl sub_0205F394
	ldr r6, _0206635C ; =_020FE3CC
	add r4, r0, #0
_02066348:
	ldrb r2, [r4]
	add r0, r5, #0
	add r1, r4, #0
	lsl r2, r2, #2
	ldr r2, [r6, r2]
	blx r2
	cmp r0, #1
	beq _02066348
	pop {r4, r5, r6, pc}
	nop
_0206635C: .word _020FE3CC
	thumb_func_end sub_0206633C

	thumb_func_start sub_02066360
sub_02066360: ; 0x02066360
	push {r3, lr}
	bl sub_0206642C
	cmp r0, #0
	beq _0206636E
	bl ov01_021F1640
_0206636E:
	pop {r3, pc}
	thumb_func_end sub_02066360

	thumb_func_start sub_02066370
sub_02066370: ; 0x02066370
	push {r4, r5, lr}
	sub sp, #0xc
	add r4, r0, #0
	bl sub_0205F394
	add r5, r0, #0
	mov r1, #0
	strb r1, [r5]
	add r0, r4, #0
	bl sub_02066420
	ldrb r0, [r5, #2]
	cmp r0, #0
	bne _020663AC
	ldr r5, _020663B0 ; =_020FE3E8
	add r3, sp, #0
	ldmia r5!, {r0, r1}
	add r2, r3, #0
	stmia r3!, {r0, r1}
	ldr r0, [r5]
	add r1, r2, #0
	str r0, [r3]
	add r0, r4, #0
	bl MapObject_SetFacingVec
	mov r1, #1
	add r0, r4, #0
	lsl r1, r1, #0x14
	bl MapObject_SetFlagsBits
_020663AC:
	add sp, #0xc
	pop {r4, r5, pc}
	.balign 4, 0
_020663B0: .word _020FE3E8
	thumb_func_end sub_02066370

	thumb_func_start sub_020663B4
sub_020663B4: ; 0x020663B4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #2]
	add r5, r0, #0
	cmp r1, #0
	bne _020663CE
	ldrb r1, [r4, #1]
	bl ov01_021FFF5C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02066420
_020663CE:
	add r0, r5, #0
	bl MapObject_SingleMovementSetInactive
	add r0, r5, #0
	bl MapObject_ClearFlag3
	ldrb r0, [r4]
	add r0, r0, #1
	strb r0, [r4]
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020663B4

	thumb_func_start sub_020663E4
sub_020663E4: ; 0x020663E4
	push {r3, r4, r5, lr}
	add r4, r1, #0
	ldrb r1, [r4, #2]
	add r5, r0, #0
	cmp r1, #0
	bne _0206641C
	bl sub_0206642C
	cmp r0, #0
	bne _02066412
	add r0, r5, #0
	bl sub_0205F73C
	cmp r0, #1
	bne _02066412
	ldrb r1, [r4, #1]
	add r0, r5, #0
	bl ov01_021FFF5C
	add r1, r0, #0
	add r0, r5, #0
	bl sub_02066420
_02066412:
	mov r1, #1
	add r0, r5, #0
	lsl r1, r1, #0x14
	bl MapObject_SetFlagsBits
_0206641C:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020663E4

	thumb_func_start sub_02066420
sub_02066420: ; 0x02066420
	push {r4, lr}
	add r4, r1, #0
	bl sub_0205F394
	str r4, [r0, #4]
	pop {r4, pc}
	thumb_func_end sub_02066420

	thumb_func_start sub_0206642C
sub_0206642C: ; 0x0206642C
	push {r3, lr}
	bl sub_0205F394
	ldr r0, [r0, #4]
	pop {r3, pc}
	.balign 4, 0
	thumb_func_end sub_0206642C

	thumb_func_start sub_02066438
sub_02066438: ; 0x02066438
	push {r3, lr}
	bl sub_0205F394
	mov r1, #1
	strb r1, [r0, #2]
	pop {r3, pc}
	thumb_func_end sub_02066438

	thumb_func_start sub_02066444
sub_02066444: ; 0x02066444
	push {r3, r4, r5, lr}
	sub sp, #0x30
	ldr r5, _020664CC ; =_020FE3F4
	add r3, r0, #0
	ldmia r5!, {r0, r1}
	add r4, sp, #0x20
	add r2, r4, #0
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r5, _020664D0 ; =_020FE434
	add r4, sp, #0x10
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldr r5, _020664D4 ; =_020FE444
	add r4, sp, #0
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	ldmia r5!, {r0, r1}
	stmia r4!, {r0, r1}
	mov r1, #0
_02066472:
	lsl r0, r1, #2
	ldr r0, [r2, r0]
	cmp r3, r0
	bne _02066480
	add sp, #0x30
	mov r0, #3
	pop {r3, r4, r5, pc}
_02066480:
	add r0, r1, #1
	lsl r0, r0, #0x18
	lsr r1, r0, #0x18
	cmp r1, #4
	blo _02066472
	mov r2, #0
	add r1, sp, #0x10
_0206648E:
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	cmp r3, r0
	bne _0206649C
	add sp, #0x30
	mov r0, #2
	pop {r3, r4, r5, pc}
_0206649C:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _0206648E
	mov r2, #0
	add r1, sp, #0
_020664AA:
	lsl r0, r2, #2
	ldr r0, [r1, r0]
	cmp r3, r0
	bne _020664B8
	add sp, #0x30
	mov r0, #1
	pop {r3, r4, r5, pc}
_020664B8:
	add r0, r2, #1
	lsl r0, r0, #0x18
	lsr r2, r0, #0x18
	cmp r2, #4
	blo _020664AA
	bl GF_AssertFail
	mov r0, #0
	add sp, #0x30
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020664CC: .word _020FE3F4
_020664D0: .word _020FE434
_020664D4: .word _020FE444
	thumb_func_end sub_02066444

	thumb_func_start sub_020664D8
sub_020664D8: ; 0x020664D8
	push {r3, r4, r5, r6, lr}
	sub sp, #0xc
	add r5, r0, #0
	bl MapObject_GetFieldSysPtr
	add r4, r0, #0
	add r0, r5, #0
	bl MapObject_GetCurrentX
	str r0, [sp, #8]
	add r0, r5, #0
	bl MapObject_GetCurrentY
	add r2, r0, #0
	ldr r1, [sp, #8]
	add r0, r4, #0
	str r2, [sp, #4]
	bl GetMetatileBehaviorAt
	add r6, r0, #0
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	bne _02066516
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF070
	b _0206652A
_02066516:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _0206652A
	add r0, r5, #0
	mov r1, #0
	bl ov01_021FF8F0
_0206652A:
	add r0, r5, #0
	bl ov01_022055DC
	cmp r0, #0
	beq _02066596
	add r0, r5, #0
	bl MapObject_GetFacingDirection
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	add r0, #0xfe
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	cmp r0, #1
	bhi _02066596
	add r0, r5, #0
	add r1, sp, #8
	add r2, sp, #4
	bl ov01_02205604
	ldr r1, [sp, #8]
	ldr r2, [sp, #4]
	add r0, r4, #0
	bl GetMetatileBehaviorAt
	add r4, r0, #0
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl MetatileBehavior_IsEncounterGrass
	cmp r0, #1
	bne _0206657C
	mov r1, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov01_021FF0E4
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
_0206657C:
	lsl r0, r4, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	bne _02066596
	mov r1, #1
	str r1, [sp]
	ldr r2, [sp, #8]
	ldr r3, [sp, #4]
	add r0, r5, #0
	bl ov01_021FF964
_02066596:
	add sp, #0xc
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end sub_020664D8

	.rodata

_020FE3CC:
	.word sub_020663B4
	.word sub_020663E4
_020FE3D4:
	.word sub_02066064
	.word sub_020660A0
_020FE3DC:
	.word 0, -0x20000, 0 ; VecFx32
_020FE3E8:
	.word 0, -0x20000, 0 ; VecFx32
_020FE3F4:
	.word 12, 13, 14, 15
_020FE404:
	.word sub_02065A4C
	.word sub_02065C2C
	.word sub_02065C48
	.word sub_02065C90
_020FE414:
	.word sub_02065B70
	.word sub_02065C2C
	.word sub_02065C48
	.word sub_02065C90
_020FE424:
	.word sub_02065BE8
	.word sub_02065C2C
	.word sub_02065C48
	.word sub_02065C90
_020FE434:
	.word 16, 17, 18, 19
_020FE444:
	.word 20, 21, 22, 23
