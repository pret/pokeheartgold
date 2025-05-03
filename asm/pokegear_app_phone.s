#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/maps.h"
#include "constants/items.h"
#include "constants/phone_contacts.h"
#include "constants/phone_scripts.h"
#include "constants/flags.h"
#include "msgdata/msg/msg_0271.h"
#include "msgdata/msg/msg_0416.h"
#include "msgdata/msg/msg_0411.h"
#include "msgdata/msg/msg_0640.h"
#include "msgdata/msg/msg_0664.h"
	.include "asm/macros.inc"
	.include "overlay_101.inc"
	.include "global.inc"

	.text

	.extern PhoneCall_InitMsgDataAndBufferNames
	.extern PhoneCallMessagePrint_Gendered
	.extern PhoneCallMessagePrint_Ungendered
	.extern PhoneCall_IsMessageDonePrinting
	.extern PhoneCall_TouchscreenListMenu_Create
	.extern PhoneCall_TouchscreenListMenu_HandleInput
	.extern PhoneCall_TouchscreenListMenu_Destroy
	.extern ov101_021F3D34

	thumb_func_start PhoneCall_GetScriptId_Baoba
PhoneCall_GetScriptId_Baoba: ; 0x021F410C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0
	strh r0, [r4, #0x20]
	ldrb r0, [r4, #0x1a]
	cmp r0, #2
	bne _021F4120
	mov r0, #0x8d
	pop {r4, r5, r6, pc}
_021F4120:
	ldrb r0, [r4, #0x19]
	cmp r0, #0
	beq _021F419A
	ldr r0, [r5, #0x1c]
	bl Save_SafariZone_Get
	ldrh r1, [r4, #0x1c]
	add r6, r0, #0
	cmp r1, #0
	bgt _021F4138
	beq _021F4154
	b _021F4186
_021F4138:
	sub r1, #0x8e
	cmp r1, #4
	bhi _021F4186
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F414A: ; jump table
	.short _021F415C - _021F414A - 2 ; case 0
	.short _021F4168 - _021F414A - 2 ; case 1
	.short _021F4168 - _021F414A - 2 ; case 2
	.short _021F417E - _021F414A - 2 ; case 3
	.short _021F417E - _021F414A - 2 ; case 4
_021F4154:
	mov r0, #0xf
	strh r0, [r4, #0x20]
	mov r0, #0
	pop {r4, r5, r6, pc}
_021F415C:
	ldr r0, [r5, #0x28]
	mov r1, #4
	bl Save_VarsFlags_SetVar4057
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F4168:
	mov r1, #1
	bl sub_0202F730
	ldr r0, [r5, #0x1c]
	bl Save_PlayerData_GetIGTAddr
	add r1, r0, #0
	add r0, r6, #0
	bl sub_0202F784
	b _021F418E
_021F417E:
	mov r1, #4
	bl sub_0202F730
	b _021F418E
_021F4186:
	mov r0, #0x9a
	strh r0, [r4, #0x1c]
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F418E:
	ldr r0, [r5, #0x28]
	mov r1, #7
	bl Save_VarsFlags_SetVar4057
	ldrh r0, [r4, #0x1c]
	pop {r4, r5, r6, pc}
_021F419A:
	ldr r0, [r4, #0x10]
	ldrh r1, [r0, #6]
	ldrh r0, [r5, #0x30]
	cmp r1, r0
	bne _021F41A8
	mov r0, #0x8c
	pop {r4, r5, r6, pc}
_021F41A8:
	ldr r0, [r5, #0x28]
	bl Save_VarsFlags_GetVar4057
	add r0, #0x93
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	pop {r4, r5, r6, pc}
	.balign 4, 0
	thumb_func_end PhoneCall_GetScriptId_Baoba

	thumb_func_start GearPhoneCall_Baoba
GearPhoneCall_Baoba: ; 0x021F41B8
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #8
	add r5, r0, #0
	add r1, r5, #0
	str r1, [sp]
	add r1, #0x88
	str r1, [sp]
	ldr r1, [r1, #4]
	cmp r1, #0
	bne _021F424A
	bl PhoneCall_InitMsgDataAndBufferNames
	ldr r0, [r5, #0x20]
	ldr r2, [r5]
	add r1, sp, #4
	bl sub_0202F340
	add r7, sp, #4
	add r6, r0, #0
	ldrb r0, [r7]
	cmp r0, #0
	bne _021F41F2
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x26
	mov r3, #0x27
	bl PhoneCallMessagePrint_Gendered
	b _021F4242
_021F41F2:
	cmp r0, #6
	blo _021F4204
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	mov r2, #0x18
	mov r3, #0x19
	bl PhoneCallMessagePrint_Gendered
	b _021F4242
_021F4204:
	mov r4, #0
	cmp r0, #0
	bls _021F4222
_021F420A:
	ldrb r2, [r6, r4]
	add r1, r4, #0
	ldr r0, [r5, #0x50]
	add r1, #0xa
	bl BufferSafariZoneAreaName
	add r0, r4, #1
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	ldrb r0, [r7]
	cmp r4, r0
	blo _021F420A
_021F4222:
	sub r0, r0, #1
	lsl r1, r0, #1
	add r0, sp, #4
	strb r1, [r0]
	ldrb r3, [r0]
	ldr r1, [r5, #0x4c]
	add r0, r5, #0
	add r2, r3, #0
	add r2, #0xe
	add r3, #0xf
	lsl r2, r2, #0x18
	lsl r3, r3, #0x18
	lsr r2, r2, #0x18
	lsr r3, r3, #0x18
	bl PhoneCallMessagePrint_Gendered
_021F4242:
	add r0, r6, #0
	bl FreeToHeap
	b _021F4264
_021F424A:
	bl PhoneCall_IsMessageDonePrinting
	cmp r0, #0
	bne _021F4258
	add sp, #8
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_021F4258:
	ldr r0, [r5, #0x4c]
	bl DestroyMsgData
	add sp, #8
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_021F4264:
	ldr r0, [sp]
	ldr r0, [r0, #4]
	add r1, r0, #1
	ldr r0, [sp]
	str r1, [r0, #4]
	mov r0, #0
	add sp, #8
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end GearPhoneCall_Baoba

	thumb_func_start PhoneCall_GetScriptId_Irwin
PhoneCall_GetScriptId_Irwin: ; 0x021F4274
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	mov r0, #0
	strh r0, [r7, #0x20]
	ldrb r0, [r7, #0x19]
	cmp r0, #0
	bne _021F42A4
	ldr r0, [r5, #0x28]
	bl Save_VarsFlags_IsInRocketTakeover
	cmp r0, #0
	beq _021F4292
	mov r0, #0x9c
	pop {r3, r4, r5, r6, r7, pc}
_021F4292:
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r1, #0xac
	lsl r0, r1, #0x10
	lsr r0, r0, #0x10
	pop {r3, r4, r5, r6, r7, pc}
_021F42A4:
	ldr r0, [r5, #0x24]
	bl PlayerProfile_CountBadges
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	ldr r0, [r5, #0x24]
	mov r1, #2
	bl PlayerProfile_TestBadgeFlag
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
	add r0, r5, #0
	add r1, r7, #0
	add r2, r6, #0
	add r3, r4, #0
	bl ov101_021F42E4
	ldr r1, _021F42E0 ; =0x0000FFFF
	cmp r0, r1
	bne _021F42DE
	cmp r4, #0
	bne _021F42D4
	mov r0, #0xa9
	pop {r3, r4, r5, r6, r7, pc}
_021F42D4:
	cmp r6, #0x10
	bhs _021F42DC
	mov r0, #0xaa
	pop {r3, r4, r5, r6, r7, pc}
_021F42DC:
	mov r0, #0xab
_021F42DE:
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F42E0: .word 0x0000FFFF
	thumb_func_end PhoneCall_GetScriptId_Irwin

	thumb_func_start ov101_021F42E4
ov101_021F42E4: ; 0x021F42E4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5, #0x28]
	ldr r1, _021F445C ; =0x00000998
	add r4, r2, #0
	add r6, r3, #0
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F42FC
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F42FC:
	ldr r0, [r5, #0x28]
	ldr r1, _021F445C ; =0x00000998
	bl Save_VarsFlags_ClearFlagInArray
	cmp r4, #0x10
	blo _021F4324
	ldr r0, [r5, #0x28]
	ldr r1, _021F4464 ; =0x000009A4
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F4320
	ldr r0, [r5, #0x28]
	ldr r1, _021F4464 ; =0x000009A4
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa8
	pop {r4, r5, r6, pc}
_021F4320:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4324:
	ldr r0, [r5, #0x24]
	mov r1, #0xd
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F434C
	ldr r1, _021F4468 ; =0x000009A3
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F4348
	ldr r0, [r5, #0x28]
	ldr r1, _021F4468 ; =0x000009A3
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa7
	pop {r4, r5, r6, pc}
_021F4348:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F434C:
	mov r1, #0xf9
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F4372
	ldr r1, _021F446C ; =0x000009A2
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F436E
	ldr r0, [r5, #0x28]
	ldr r1, _021F446C ; =0x000009A2
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa6
	pop {r4, r5, r6, pc}
_021F436E:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4372:
	mov r1, #0x87
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F4398
	ldr r1, _021F4470 ; =0x000009A1
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F4394
	ldr r0, [r5, #0x28]
	ldr r1, _021F4470 ; =0x000009A1
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa5
	pop {r4, r5, r6, pc}
_021F4394:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4398:
	mov r1, #2
	mov r2, #5
	bl Save_VarsFlags_FlypointFlagAction
	cmp r0, #0
	beq _021F43A8
	mov r0, #0xa4
	pop {r4, r5, r6, pc}
_021F43A8:
	ldr r0, [r5, #0x28]
	bl CheckGameClearFlag
	cmp r0, #0
	beq _021F43CE
	ldr r0, [r5, #0x28]
	ldr r1, _021F4474 ; =0x000009A5
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F43CA
	ldr r0, [r5, #0x28]
	ldr r1, _021F4474 ; =0x000009A5
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa3
	pop {r4, r5, r6, pc}
_021F43CA:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F43CE:
	ldr r0, [r5, #0x24]
	mov r1, #7
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _021F43DE
	mov r0, #0xa2
	pop {r4, r5, r6, pc}
_021F43DE:
	ldr r0, [r5, #0x28]
	mov r1, #0xc6
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F43EE
	mov r0, #0xa1
	pop {r4, r5, r6, pc}
_021F43EE:
	ldr r0, [r5, #0x28]
	mov r1, #0xca
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	ldr r0, [r5, #0x28]
	beq _021F441A
	mov r1, #0x9a
	lsl r1, r1, #4
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F4416
	mov r1, #0x9a
	ldr r0, [r5, #0x28]
	lsl r1, r1, #4
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0xa0
	pop {r4, r5, r6, pc}
_021F4416:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F441A:
	ldr r1, _021F4478 ; =0x0000096A
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	beq _021F4440
	ldr r0, [r5, #0x28]
	ldr r1, _021F447C ; =0x0000099F
	bl Save_VarsFlags_CheckFlagInArray
	cmp r0, #0
	bne _021F443C
	ldr r0, [r5, #0x28]
	ldr r1, _021F447C ; =0x0000099F
	bl Save_VarsFlags_SetFlagInArray
	mov r0, #0x9f
	pop {r4, r5, r6, pc}
_021F443C:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
_021F4440:
	ldr r0, [r5, #0x24]
	mov r1, #3
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	beq _021F4450
	mov r0, #0x9e
	pop {r4, r5, r6, pc}
_021F4450:
	cmp r6, #0
	beq _021F4458
	mov r0, #0x9d
	pop {r4, r5, r6, pc}
_021F4458:
	ldr r0, _021F4460 ; =0x0000FFFF
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F445C: .word 0x00000998
_021F4460: .word 0x0000FFFF
_021F4464: .word 0x000009A4
_021F4468: .word 0x000009A3
_021F446C: .word 0x000009A2
_021F4470: .word 0x000009A1
_021F4474: .word 0x000009A5
_021F4478: .word 0x0000096A
_021F447C: .word 0x0000099F
	thumb_func_end ov101_021F42E4

    .rodata

	.balign 4, 0
	.global ov101_021F86C8
ov101_021F86C8: ; 0x021F86C8
	.short PHONE_SCRIPT_102
	.short PHONE_SCRIPT_101

	.global ov101_021F86CC
ov101_021F86CC: ; 0x021F86CC
	.short MAP_ROUTE_1
	.short MAP_ROUTE_2
	.short MAP_ROUTE_3
	.short MAP_ROUTE_4
	.short MAP_ROUTE_5
	.short MAP_ROUTE_6
	.short MAP_ROUTE_7
	.short MAP_ROUTE_8
	.short MAP_ROUTE_9
	.short MAP_ROUTE_10
	.short MAP_ROUTE_11
	.short MAP_ROUTE_12
	.short MAP_ROUTE_13
	.short MAP_ROUTE_14
	.short MAP_ROUTE_15
	.short MAP_ROUTE_16
	.short MAP_ROUTE_17
	.short MAP_ROUTE_18
	.short MAP_ROUTE_19
	.short MAP_ROUTE_20
	.short MAP_ROUTE_21
	.short MAP_ROUTE_22
	.short MAP_ROUTE_24
	.short MAP_ROUTE_25
	.short MAP_ROUTE_26
	.short MAP_ROUTE_27
	.short MAP_ROUTE_28
	.short MAP_ROUTE_29
	.short MAP_ROUTE_30
	.short MAP_ROUTE_31
	.short MAP_ROUTE_32
	.short MAP_ROUTE_33
	.short MAP_ROUTE_34
	.short MAP_ROUTE_35
	.short MAP_ROUTE_36
	.short MAP_ROUTE_37
	.short MAP_ROUTE_38
	.short MAP_ROUTE_39
	.short MAP_ROUTE_40
	.short MAP_ROUTE_41
	.short MAP_ROUTE_42
	.short MAP_ROUTE_43
	.short MAP_ROUTE_44
	.short MAP_ROUTE_45
	.short MAP_ROUTE_46
	.short MAP_ROUTE_47
	.short MAP_ROUTE_48
	.short MAP_PALLET
	.short MAP_VIRIDIAN
	.short MAP_PEWTER
	.short MAP_CERULEAN
	.short MAP_LAVENDER
	.short MAP_VERMILION
	.short MAP_CELADON
	.short MAP_FUCHSIA
	.short MAP_CINNABAR_ISLAND
	.short MAP_INDIGO_PLATEAU
	.short MAP_SAFFRON
	.short MAP_NEW_BARK
	.short MAP_CHERRYGROVE
	.short MAP_VIOLET
	.short MAP_AZALEA
	.short MAP_CIANWOOD
	.short MAP_GOLDENROD
	.short MAP_OLIVINE
	.short MAP_ECRUTEAK
	.short MAP_MAHOGANY
	.short MAP_LAKE_OF_RAGE
	.short MAP_BLACKTHORN
	.short MAP_MOUNT_SILVER
	.short MAP_NATIONAL_PARK
	.short MAP_RUINS_OF_ALPH
	.short MAP_SAFARI_ZONE_GATE

	.global ov101_021F8760
	.balign 4, 0
ov101_021F8760: ; 0x021F8760
	.byte 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3
	.byte 3, 3, 3, 3, 3, 3, 3, 3, 2, 2, 3, 0, 0, 0, 0, 0
	.byte 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 3
	.byte 3, 3, 3, 3, 3, 3, 3, 3, 2, 3, 0, 0, 0, 0, 0, 0
	.byte 0, 0, 0, 0, 0, 0, 0, 0, 1
