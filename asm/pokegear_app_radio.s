#include "constants/species.h"
#include "constants/sndseq.h"
#include "constants/maps.h"
#include "constants/items.h"
#include "constants/phone_contacts.h"
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

	.extern ov101_021F5AB8
	.extern ov101_021F5B68
	.extern RadioPrintInit
	.extern RadioPrintInitEz
	.extern RadioPrintAndPlayJingle
	.extern Radio_RunTextPrinter
	.extern Radio_RunTextPrinter_WaitJingle

	thumb_func_start RadioShow_BuenasPassword_Setup
RadioShow_BuenasPassword_Setup: ; 0x021F680C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_BuenasPassword_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	mov r0, #SEQ_GS_AIKOTOBA>>4
	lsl r0, r0, #4
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_BuenasPassword_Setup

	thumb_func_start RadioShow_BuenasPassword_Teardown
RadioShow_BuenasPassword_Teardown: ; 0x021F6840
	push {r4, lr}
	add r4, r0, #0
	bl RadioShow_BuenasPassword_Unload
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_BuenasPassword_Teardown

	thumb_func_start RadioShow_BuenasPassword_Print
RadioShow_BuenasPassword_Print: ; 0x021F6860
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #4
	bhi _021F68FC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6878: ; jump table
	.short _021F6882 - _021F6878 - 2 ; case 0
	.short _021F6890 - _021F6878 - 2 ; case 1
	.short _021F68BA - _021F6878 - 2 ; case 2
	.short _021F68CA - _021F6878 - 2 ; case 3
	.short _021F68E2 - _021F6878 - 2 ; case 4
_021F6882:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F6890:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F68FC
	ldrh r1, [r4, #6]
	add r0, r5, #0
	bl RadioPrintInitEz
	ldrh r0, [r4, #6]
	cmp r0, #4
	bne _021F68B2
	ldr r0, [r5, #4]
	bl Save_VarsFlags_Get
	ldr r1, _021F6900 ; =FLAG_DAILY_HEARD_BUENAS_PASSWORD
	bl Save_VarsFlags_SetFlagInArray
_021F68B2:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F68BA:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F68FC
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F68CA:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F68FC
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F68FC
_021F68E2:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F68FC
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F68FC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_021F6900: .word FLAG_DAILY_HEARD_BUENAS_PASSWORD
	thumb_func_end RadioShow_BuenasPassword_Print

	thumb_func_start RadioShow_BuenasPassword_Init
RadioShow_BuenasPassword_Init: ; 0x021F6904
	push {r4, r5, r6, lr}
	sub sp, #8
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldr r2, _021F6998 ; =0x0000019B
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	mov r1, #msg_0411_00000
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x50]
	mov r1, #msg_0411_00001
	bl ReadMsgDataIntoString
	ldr r0, [r5, #4]
	bl Save_Bag_Get
	mov r1, #ITEM_BLUE_CARD>>2
	ldr r3, [r5]
	lsl r1, r1, #2
	mov r2, #1
	bl Bag_HasItem
	cmp r0, #0
	beq _021F6946
	mov r0, #msg_0411_00004
	b _021F6948
_021F6946:
	mov r0, #msg_0411_00005
_021F6948:
	strh r0, [r4, #6]
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0x42 ; msg_0066_D23R0102.gmm
	bl NewMsgDataFromNarc
	add r4, r0, #0
	ldr r0, [r5, #4]
	bl Save_VarsFlags_Get
	bl Save_VarsFlags_GetBuenasPasswordSet
	mov r1, #0x1e
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r1, r0, #0x10
	add r0, r4, #0
	add r1, #0x28
	bl NewString_ReadMsgData
	add r6, r0, #0
	mov r0, #1
	str r0, [sp]
	mov r3, #2
	str r3, [sp, #4]
	ldr r0, [r5, #0x44]
	mov r1, #0
	add r2, r6, #0
	bl BufferString
	add r0, r6, #0
	bl String_Delete
	add r0, r4, #0
	bl DestroyMsgData
	add sp, #8
	pop {r4, r5, r6, pc}
	.balign 4, 0
_021F6998: .word 0x0000019B
	thumb_func_end RadioShow_BuenasPassword_Init

	thumb_func_start RadioShow_BuenasPassword_Unload
RadioShow_BuenasPassword_Unload: ; 0x021F699C
	ldr r3, _021F69A4 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F69A4: .word DestroyMsgData
	thumb_func_end RadioShow_BuenasPassword_Unload

	thumb_func_start RadioShow_ThatTownThesePeople_Setup
RadioShow_ThatTownThesePeople_Setup: ; 0x021F69A8
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0x24
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x24
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_ThatTownThesePeople_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F69DC ; =SEQ_GS_RADIO_PT
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F69DC: .word SEQ_GS_RADIO_PT
	thumb_func_end RadioShow_ThatTownThesePeople_Setup

	thumb_func_start RadioShow_ThatTownThesePeople_Teardown
RadioShow_ThatTownThesePeople_Teardown: ; 0x021F69E0
	push {r4, lr}
	add r4, r0, #0
	bl RadioShow_ThatTownThesePeople_Unload
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0x24
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_ThatTownThesePeople_Teardown

	thumb_func_start RadioShow_ThatTownThesePeople_Print
RadioShow_ThatTownThesePeople_Print: ; 0x021F6A00
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #5
	bhi _021F6AA8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6A18: ; jump table
	.short _021F6A24 - _021F6A18 - 2 ; case 0
	.short _021F6A32 - _021F6A18 - 2 ; case 1
	.short _021F6A40 - _021F6A18 - 2 ; case 2
	.short _021F6A54 - _021F6A18 - 2 ; case 3
	.short _021F6A76 - _021F6A18 - 2 ; case 4
	.short _021F6A8E - _021F6A18 - 2 ; case 5
_021F6A24:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A32:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6AA8
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
_021F6A40:
	ldrb r1, [r4, #9]
	add r0, r5, #0
	add r1, r4, r1
	ldrb r1, [r1, #6]
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A54:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6AA8
	ldrb r0, [r4, #9]
	add r0, r0, #1
	strb r0, [r4, #9]
	ldrb r0, [r4, #9]
	cmp r0, #3
	bhs _021F6A6E
	mov r0, #2
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A6E:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A76:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F6AA8
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6AA8
_021F6A8E:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F6AA8
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F6AA8:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_ThatTownThesePeople_Print

	thumb_func_start RadioShow_ThatTownThesePeople_Init
RadioShow_ThatTownThesePeople_Init: ; 0x021F6AAC
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldr r2, _021F6B74 ; =0x0000019F
	ldr r3, [r5]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r5, #0x24]
	ldr r2, [r5, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r5, #0x24]
	ldr r2, [r5, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	add r0, r4, #0
	add r0, #0xa
	mov r1, #0
	mov r2, #5
	bl MI_CpuFill8
	add r0, r4, #0
	add r0, #0xf
	mov r1, #0
	mov r2, #0x14
	bl MI_CpuFill8
	ldr r0, [r5, #4]
	bl Save_VarsFlags_Get
	mov r1, #1
	strb r1, [r4, #0xa]
	add r5, r0, #0
	mov r1, #2
	mov r2, #0xf
	bl Save_VarsFlags_FlypointFlagAction
	strb r0, [r4, #0xb]
	add r0, r5, #0
	mov r1, #2
	mov r2, #0x13
	bl Save_VarsFlags_FlypointFlagAction
	strb r0, [r4, #0xc]
	add r0, r5, #0
	mov r1, #2
	mov r2, #0x15
	bl Save_VarsFlags_FlypointFlagAction
	strb r0, [r4, #0xd]
	add r0, r5, #0
	mov r1, #2
	mov r2, #5
	bl Save_VarsFlags_FlypointFlagAction
	mov r6, #0
	strb r0, [r4, #0xe]
	ldr r1, _021F6B78 ; =ov101_021F8B4C
	add r0, r6, #0
_021F6B2A:
	ldrb r2, [r1]
	add r2, r4, r2
	ldrb r2, [r2, #0xa]
	cmp r2, #0
	beq _021F6B3A
	add r2, r4, r6
	add r6, r6, #1
	strb r0, [r2, #0xf]
_021F6B3A:
	add r0, r0, #1
	add r1, r1, #1
	cmp r0, #0x14
	blt _021F6B2A
	mov r5, #0
_021F6B44:
	bl LCRandom
	add r1, r6, #0
	bl _s32_div_f
	add r0, r4, r1
	ldrb r0, [r0, #0xf]
	lsl r2, r5, #0x18
	lsr r2, r2, #0x18
	add r0, r0, #4
	lsl r0, r0, #0x18
	lsr r7, r0, #0x18
	add r0, r4, #0
	add r1, r7, #0
	bl ov101_021F6B88
	cmp r0, #0
	bne _021F6B44
	add r0, r4, r5
	add r5, r5, #1
	strb r7, [r0, #6]
	cmp r5, #3
	blt _021F6B44
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F6B74: .word 0x0000019F
_021F6B78: .word ov101_021F8B4C
	thumb_func_end RadioShow_ThatTownThesePeople_Init

	thumb_func_start RadioShow_ThatTownThesePeople_Unload
RadioShow_ThatTownThesePeople_Unload: ; 0x021F6B7C
	ldr r3, _021F6B84 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6B84: .word DestroyMsgData
	thumb_func_end RadioShow_ThatTownThesePeople_Unload

	thumb_func_start ov101_021F6B88
ov101_021F6B88: ; 0x021F6B88
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _021F6BA4
_021F6B90:
	add r3, r0, r4
	ldrb r3, [r3, #6]
	cmp r1, r3
	bne _021F6B9E
	mov r0, #1
	pop {r3, r4}
	bx lr
_021F6B9E:
	add r4, r4, #1
	cmp r4, r2
	blt _021F6B90
_021F6BA4:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F6B88

	thumb_func_start RadioShow_TrainerProfiles_Setup
RadioShow_TrainerProfiles_Setup: ; 0x021F6BAC
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #0xc
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0xc
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_TrainerProfiles_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F6BE0 ; =SEQ_GS_RADIO_TRAINER
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6BE0: .word SEQ_GS_RADIO_TRAINER
	thumb_func_end RadioShow_TrainerProfiles_Setup

	thumb_func_start RadioShow_TrainerProfiles_Teardown
RadioShow_TrainerProfiles_Teardown: ; 0x021F6BE4
	push {r4, lr}
	add r4, r0, #0
	bl RadioShow_TrainerProfiles_Unload
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #0xc
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_TrainerProfiles_Teardown

	thumb_func_start RadioShow_TrainerProfiles_Print
RadioShow_TrainerProfiles_Print: ; 0x021F6C04
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r4, [r5, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #5
	bhi _021F6CAC
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6C1C: ; jump table
	.short _021F6C28 - _021F6C1C - 2 ; case 0
	.short _021F6C36 - _021F6C1C - 2 ; case 1
	.short _021F6C44 - _021F6C1C - 2 ; case 2
	.short _021F6C58 - _021F6C1C - 2 ; case 3
	.short _021F6C7A - _021F6C1C - 2 ; case 4
	.short _021F6C92 - _021F6C1C - 2 ; case 5
_021F6C28:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C36:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6CAC
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
_021F6C44:
	ldrb r1, [r4, #9]
	add r0, r5, #0
	add r1, r4, r1
	ldrb r1, [r1, #6]
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C58:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6CAC
	ldrb r0, [r4, #9]
	add r0, r0, #1
	strb r0, [r4, #9]
	ldrb r0, [r4, #9]
	cmp r0, #3
	bhs _021F6C72
	mov r0, #2
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C72:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C7A:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F6CAC
	add r0, r5, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6CAC
_021F6C92:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F6CAC
	add r0, r5, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r5, #0x66
	orr r0, r1
	strb r0, [r5]
	mov r0, #1
	pop {r3, r4, r5, pc}
_021F6CAC:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end RadioShow_TrainerProfiles_Print

	thumb_func_start RadioShow_TrainerProfiles_Init
RadioShow_TrainerProfiles_Init: ; 0x021F6CB0
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	mov r2, #0x69
	ldr r5, [r4, #0x1c]
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	lsl r2, r2, #2
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	mov r4, #0
	mov r7, #0x1c
_021F6CDC:
	bl LCRandom
	lsr r1, r0, #0x1f
	lsl r0, r0, #0x1c
	sub r0, r0, r1
	ror r0, r7
	add r0, r1, r0
	add r0, r0, #4
	lsl r0, r0, #0x18
	lsr r6, r0, #0x18
	lsl r2, r4, #0x18
	add r0, r5, #0
	add r1, r6, #0
	lsr r2, r2, #0x18
	bl ov101_021F6D18
	cmp r0, #0
	bne _021F6CDC
	add r0, r5, r4
	add r4, r4, #1
	strb r6, [r0, #6]
	cmp r4, #3
	blt _021F6CDC
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end RadioShow_TrainerProfiles_Init

	thumb_func_start RadioShow_TrainerProfiles_Unload
RadioShow_TrainerProfiles_Unload: ; 0x021F6D0C
	ldr r3, _021F6D14 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6D14: .word DestroyMsgData
	thumb_func_end RadioShow_TrainerProfiles_Unload

	thumb_func_start ov101_021F6D18
ov101_021F6D18: ; 0x021F6D18
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _021F6D34
_021F6D20:
	add r3, r0, r4
	ldrb r3, [r3, #6]
	cmp r1, r3
	bne _021F6D2E
	mov r0, #1
	pop {r3, r4}
	bx lr
_021F6D2E:
	add r4, r4, #1
	cmp r4, r2
	blt _021F6D20
_021F6D34:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F6D18

	thumb_func_start RadioShow_PokemonTalk_Setup
RadioShow_PokemonTalk_Setup: ; 0x021F6D3C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	mov r1, #0x95
	ldr r0, [r5]
	lsl r1, r1, #2
	bl AllocFromHeap
	mov r2, #0x95
	mov r1, #0
	lsl r2, r2, #2
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_PokemonTalk_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #0
	bl StopBGM
	ldr r0, _021F6D74 ; =SEQ_GS_OHKIDO_RABO
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F6D74: .word SEQ_GS_OHKIDO_RABO
	thumb_func_end RadioShow_PokemonTalk_Setup

	thumb_func_start RadioShow_PokemonTalk_Teardown
RadioShow_PokemonTalk_Teardown: ; 0x021F6D78
	push {r4, lr}
	add r4, r0, #0
	bl RadioShow_PokemonTalk_Unload
	mov r2, #0x95
	ldr r0, [r4, #0x1c]
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	thumb_func_end RadioShow_PokemonTalk_Teardown

	thumb_func_start RadioShow_PokemonTalk_Print
RadioShow_PokemonTalk_Print: ; 0x021F6D98
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r6, r0, #0
	ldr r4, [r6, #0x1c]
	ldrh r1, [r4, #4]
	cmp r1, #7
	bhi _021F6DD8
	add r1, r1, r1
	add r1, pc
	ldrh r1, [r1, #6]
	lsl r1, r1, #0x10
	asr r1, r1, #0x10
	add pc, r1
_021F6DB2: ; jump table
	.short _021F6DC2 - _021F6DB2 - 2 ; case 0
	.short _021F6DD0 - _021F6DB2 - 2 ; case 1
	.short _021F6E10 - _021F6DB2 - 2 ; case 2
	.short _021F6E1E - _021F6DB2 - 2 ; case 3
	.short _021F6E56 - _021F6DB2 - 2 ; case 4
	.short _021F6EB2 - _021F6DB2 - 2 ; case 5
	.short _021F6ED8 - _021F6DB2 - 2 ; case 6
	.short _021F6EF0 - _021F6DB2 - 2 ; case 7
_021F6DC2:
	mov r1, #2
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6DD0:
	bl Radio_RunTextPrinter
	cmp r0, #0
	bne _021F6DDA
_021F6DD8:
	b _021F6F0C
_021F6DDA:
	ldrh r0, [r4, #6]
	cmp r0, #0
	bne _021F6DE6
	mov r0, #3
	strh r0, [r4, #4]
	b _021F6F0C
_021F6DE6:
	ldrh r0, [r4, #8]
	bl MapHeader_GetMapSec
	add r2, r0, #0
	ldr r0, [r6, #0x44]
	mov r1, #0
	bl BufferLandmarkName
	ldrh r2, [r4, #6]
	ldr r0, [r6, #0x44]
	mov r1, #1
	bl BufferSpeciesName
	add r0, r6, #0
	mov r1, #0x20
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6E10:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6F0C
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
_021F6E1E:
	mov r2, #0x25
	lsl r2, r2, #4
	ldrb r2, [r4, r2]
	ldr r0, [r6, #0x44]
	mov r1, #0
	lsl r2, r2, #2
	add r2, r4, r2
	ldrh r2, [r2, #0x10]
	bl BufferLandmarkName
	mov r2, #0x25
	lsl r2, r2, #4
	ldrb r2, [r4, r2]
	ldr r0, [r6, #0x44]
	mov r1, #1
	lsl r2, r2, #2
	add r2, r4, r2
	ldrh r2, [r2, #0x12]
	bl BufferSpeciesName
	add r0, r6, #0
	mov r1, #4
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6E56:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6F0C
	mov r5, #0
	str r5, [sp, #8]
	add r7, r5, #0
_021F6E64:
	mov r1, #0x25
	lsl r1, r1, #4
	ldrb r1, [r4, r1]
	ldr r0, [r6, #0x24]
	ldr r2, [r6, #0x48]
	lsl r1, r1, #2
	add r1, r4, r1
	add r1, r5, r1
	ldrh r1, [r1, #0x24]
	add r1, r1, #6
	add r1, r7, r1
	bl ReadMsgDataIntoString
	mov r0, #1
	str r0, [sp]
	mov r0, #2
	str r0, [sp, #4]
	ldr r1, [sp, #8]
	ldr r0, [r6, #0x44]
	ldr r2, [r6, #0x48]
	add r1, r1, #2
	mov r3, #1
	bl BufferString
	ldr r0, [sp, #8]
	add r5, r5, #2
	add r0, r0, #1
	add r7, #0xd
	str r0, [sp, #8]
	cmp r0, #2
	blt _021F6E64
	add r0, r6, #0
	mov r1, #5
	bl RadioPrintInitEz
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6EB2:
	bl Radio_RunTextPrinter
	cmp r0, #0
	beq _021F6F0C
	mov r0, #0x25
	lsl r0, r0, #4
	ldrb r1, [r4, r0]
	add r1, r1, #1
	strb r1, [r4, r0]
	ldrb r0, [r4, r0]
	cmp r0, #5
	bhs _021F6ED0
	mov r0, #3
	strh r0, [r4, #4]
	b _021F6F0C
_021F6ED0:
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6ED8:
	bl ov101_021F5AB8
	cmp r0, #0
	beq _021F6F0C
	add r0, r6, #0
	mov r1, #3
	bl RadioPrintAndPlayJingle
	ldrh r0, [r4, #4]
	add r0, r0, #1
	strh r0, [r4, #4]
	b _021F6F0C
_021F6EF0:
	bl Radio_RunTextPrinter_WaitJingle
	cmp r0, #0
	beq _021F6F0C
	add r0, r6, #0
	add r0, #0x66
	ldrb r1, [r0]
	mov r0, #0x10
	add r6, #0x66
	orr r0, r1
	strb r0, [r6]
	add sp, #0xc
	mov r0, #1
	pop {r4, r5, r6, r7, pc}
_021F6F0C:
	mov r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end RadioShow_PokemonTalk_Print

	thumb_func_start RadioShow_PokemonTalk_Init
RadioShow_PokemonTalk_Init: ; 0x021F6F14
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	ldr r5, [r4, #0x1c]
	ldr r2, _021F6FBC ; =0x0000019E
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x24]
	ldr r2, [r4, #0x50]
	mov r1, #1
	bl ReadMsgDataIntoString
	ldr r0, [r4, #4]
	bl Save_Roamers_Get
	add r6, r0, #0
	bl RoamerSave_OutbreakActive
	cmp r0, #0
	beq _021F6F5C
	add r0, r6, #0
	mov r1, #2
	bl Roamers_GetRand
	add r1, r5, #0
	add r1, #8
	add r2, r5, #6
	bl GetSwarmInfoFromRand
_021F6F5C:
	add r0, r4, #0
	add r1, r5, #0
	bl ov101_021F6FCC
	bl LCRandom
	mov r1, #3
	bl _s32_div_f
	add r0, r1, #1
	lsl r6, r0, #1
	bl LCRandom
	mov r1, #0xd
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
	bl LCRandom
	mov r1, #0xd
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	mov r0, #0
	str r0, [sp]
_021F6F92:
	strh r7, [r5, #0x24]
	add r0, r7, r6
	mov r1, #0xd
	strh r4, [r5, #0x26]
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r7, r0, #0x18
	add r0, r4, r6
	mov r1, #0xd
	bl _s32_div_f
	lsl r0, r1, #0x18
	lsr r4, r0, #0x18
	ldr r0, [sp]
	add r5, r5, #4
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #5
	blt _021F6F92
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_021F6FBC: .word 0x0000019E
	thumb_func_end RadioShow_PokemonTalk_Init

	thumb_func_start RadioShow_PokemonTalk_Unload
RadioShow_PokemonTalk_Unload: ; 0x021F6FC0
	ldr r3, _021F6FC8 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F6FC8: .word DestroyMsgData
	thumb_func_end RadioShow_PokemonTalk_Unload

	thumb_func_start ov101_021F6FCC
ov101_021F6FCC: ; 0x021F6FCC
	push {r3, r4, r5, r6, r7, lr}
	sub sp, #0x10
	add r7, r0, #0
	ldr r0, [r7, #4]
	add r5, r1, #0
	bl Save_Pokedex_Get
	str r0, [sp, #8]
	ldr r0, [r7, #4]
	bl Save_VarsFlags_Get
	mov r1, #2
	mov r2, #0x19
	bl Save_VarsFlags_FlypointFlagAction
	str r0, [sp, #0xc]
	add r0, r5, #0
	mov r2, #0x4b
	add r0, #0x38
	mov r1, #0
	lsl r2, r2, #2
	bl MI_CpuFill8
	mov r0, #0x59
	lsl r0, r0, #2
	add r0, r5, r0
	mov r1, #0
	mov r2, #0x76
	bl MI_CpuFill8
	ldr r0, _021F70E8 ; =0x000001DA
	mov r1, #0
	add r0, r5, r0
	mov r2, #0x76
	bl MI_CpuFill8
	mov r4, #0
	strh r4, [r5, #0xa]
	strh r4, [r5, #0xc]
	add r6, r5, #0
	strh r4, [r5, #0xe]
	add r6, #0xa
_021F7020:
	add r0, r4, #0
	bl MapHeader_HasWildEncounters
	cmp r0, #0
	beq _021F707C
	add r0, r4, #0
	bl MapHeader_IsInKanto
	add r1, r7, #0
	add r1, #0x66
	ldrb r1, [r1]
	lsl r1, r1, #0x1d
	lsr r1, r1, #0x1f
	cmp r1, r0
	bne _021F707C
	ldr r2, _021F70EC ; =ov101_021F8B60
	mov r1, #0
_021F7042:
	ldrh r0, [r2]
	cmp r4, r0
	beq _021F7050
	add r1, r1, #1
	add r2, r2, #2
	cmp r1, #0xe
	blo _021F7042
_021F7050:
	cmp r1, #0xe
	blo _021F707C
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _021F7062
	cmp r4, #0x97
	beq _021F707C
	cmp r4, #0x98
	beq _021F707C
_021F7062:
	ldrh r0, [r6]
	ldrh r1, [r5, #0xa]
	add r0, r0, #1
	strh r0, [r6]
	lsl r0, r1, #1
	add r0, r5, r0
	strh r4, [r0, #0x38]
	ldrh r0, [r5, #0xa]
	cmp r0, #0x96
	blo _021F707C
	bl GF_AssertFail
	b _021F7086
_021F707C:
	mov r0, #0x87
	add r4, r4, #1
	lsl r0, r0, #2
	cmp r4, r0
	blt _021F7020
_021F7086:
	mov r0, #0
	str r0, [sp]
	str r5, [sp, #4]
_021F708C:
	mov r0, #0
	strh r0, [r5, #0xc]
	strh r0, [r5, #0xe]
	ldr r0, [sp]
	lsl r0, r0, #0x18
	lsr r4, r0, #0x18
_021F7098:
	bl LCRandom
	ldrh r1, [r5, #0xa]
	bl _s32_div_f
	lsl r0, r1, #0x10
	lsr r0, r0, #0xf
	add r6, r5, r0
	ldrh r0, [r6, #0x38]
	bl MapHeader_GetMapSec
	lsl r0, r0, #0x10
	lsr r7, r0, #0x10
	add r0, r5, #0
	add r1, r7, #0
	add r2, r4, #0
	bl ov101_021F70F0
	cmp r0, #0
	bne _021F7098
	ldr r0, [sp, #4]
	ldr r1, [sp, #8]
	strh r7, [r0, #0x10]
	ldrh r2, [r6, #0x38]
	add r0, r5, #0
	bl ov101_021F7174
	ldr r1, [sp, #4]
	strh r0, [r1, #0x12]
	add r0, r1, #0
	add r0, r0, #4
	str r0, [sp, #4]
	ldr r0, [sp]
	add r0, r0, #1
	str r0, [sp]
	cmp r0, #5
	blt _021F708C
	add sp, #0x10
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F70E8: .word 0x000001DA
_021F70EC: .word ov101_021F8B60
	thumb_func_end ov101_021F6FCC

	thumb_func_start ov101_021F70F0
ov101_021F70F0: ; 0x021F70F0
	push {r3, r4}
	mov r4, #0
	cmp r2, #0
	ble _021F710C
_021F70F8:
	ldrh r3, [r0, #0x10]
	cmp r1, r3
	bne _021F7104
	mov r0, #1
	pop {r3, r4}
	bx lr
_021F7104:
	add r4, r4, #1
	add r0, r0, #4
	cmp r4, r2
	blt _021F70F8
_021F710C:
	mov r0, #0
	pop {r3, r4}
	bx lr
	.balign 4, 0
	thumb_func_end ov101_021F70F0

	thumb_func_start ov101_021F7114
ov101_021F7114: ; 0x021F7114
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r7, r1, #0
	add r4, r2, #0
	beq _021F7168
	ldr r0, _021F716C ; =0x000001ED
	cmp r4, r0
	bhi _021F7168
	ldrh r6, [r5, #0xc]
	mov r2, #0
	cmp r6, #0
	ble _021F713E
	add r3, r5, #0
	sub r0, #0x89
_021F7130:
	ldrh r1, [r3, r0]
	cmp r4, r1
	beq _021F7168
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, r6
	blt _021F7130
_021F713E:
	ldrh r0, [r5, #0xc]
	add r0, r0, #1
	strh r0, [r5, #0xc]
	lsl r0, r6, #1
	add r1, r5, r0
	mov r0, #0x59
	lsl r0, r0, #2
	strh r4, [r1, r0]
	add r0, r7, #0
	add r1, r4, #0
	bl Pokedex_CheckMonCaughtFlag
	cmp r0, #0
	bne _021F7168
	ldrh r1, [r5, #0xe]
	add r0, r1, #1
	strh r0, [r5, #0xe]
	lsl r0, r1, #1
	add r1, r5, r0
	ldr r0, _021F7170 ; =0x000001DA
	strh r4, [r1, r0]
_021F7168:
	pop {r3, r4, r5, r6, r7, pc}
	nop
_021F716C: .word 0x000001ED
_021F7170: .word 0x000001DA
	thumb_func_end ov101_021F7114

	thumb_func_start ov101_021F7174
ov101_021F7174: ; 0x021F7174
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc4
	add r5, r0, #0
	add r4, r1, #0
	add r0, sp, #0
	add r1, r2, #0
	bl WildEncounters_ReadFromNarc
	add r0, sp, #0
	ldrb r0, [r0]
	cmp r0, #0
	beq _021F71BA
	mov r7, #0
	add r6, sp, #0
_021F7190:
	ldrh r2, [r6, #0x14]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	ldrh r2, [r6, #0x2c]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r2, r6, #0
	add r2, #0x44
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #2
	cmp r7, #0xc
	blt _021F7190
_021F71BA:
	add r0, sp, #0
	ldrb r0, [r0, #1]
	cmp r0, #0
	beq _021F71DC
	mov r7, #0
	add r6, sp, #0
_021F71C6:
	add r2, r6, #0
	add r2, #0x66
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #5
	blt _021F71C6
_021F71DC:
	add r0, sp, #0
	ldrb r0, [r0, #2]
	cmp r0, #0
	beq _021F71FE
	mov r7, #0
	add r6, sp, #0
_021F71E8:
	add r2, r6, #0
	add r2, #0x7a
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #2
	blt _021F71E8
_021F71FE:
	add r0, sp, #0
	ldrb r0, [r0, #3]
	cmp r0, #0
	beq _021F7220
	mov r7, #0
	add r6, sp, #0
_021F720A:
	add r2, r6, #0
	add r2, #0x82
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #5
	blt _021F720A
_021F7220:
	add r0, sp, #0
	ldrb r0, [r0, #4]
	cmp r0, #0
	beq _021F7242
	mov r7, #0
	add r6, sp, #0
_021F722C:
	add r2, r6, #0
	add r2, #0x96
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #5
	blt _021F722C
_021F7242:
	add r0, sp, #0
	ldrb r0, [r0, #5]
	cmp r0, #0
	beq _021F7264
	mov r7, #0
	add r6, sp, #0
_021F724E:
	add r2, r6, #0
	add r2, #0xaa
	ldrh r2, [r2]
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
	add r7, r7, #1
	add r6, r6, #4
	cmp r7, #5
	blt _021F724E
_021F7264:
	add r0, sp, #0xc0
	ldrh r2, [r0]
	cmp r2, #0
	beq _021F7274
	add r0, r5, #0
	add r1, r4, #0
	bl ov101_021F7114
_021F7274:
	ldrh r0, [r5, #0xe]
	cmp r0, #0
	beq _021F7292
	cmp r0, #1
	bne _021F72AA
	bl LCRandom
	mov r1, #0xfa
	lsl r1, r1, #2
	bl _s32_div_f
	mov r0, #0x7d
	lsl r0, r0, #2
	cmp r1, r0
	bge _021F72AA
_021F7292:
	bl LCRandom
	ldrh r1, [r5, #0xc]
	bl _s32_div_f
	lsl r0, r1, #1
	add r1, r5, r0
	mov r0, #0x59
	lsl r0, r0, #2
	add sp, #0xc4
	ldrh r0, [r1, r0]
	pop {r4, r5, r6, r7, pc}
_021F72AA:
	bl LCRandom
	ldrh r1, [r5, #0xe]
	bl _s32_div_f
	lsl r0, r1, #1
	add r1, r5, r0
	ldr r0, _021F72C0 ; =0x000001DA
	ldrh r0, [r1, r0]
	add sp, #0xc4
	pop {r4, r5, r6, r7, pc}
	.balign 4, 0
_021F72C0: .word 0x000001DA
	thumb_func_end ov101_021F7174

	thumb_func_start RadioShow_MahoganySignal_Setup
RadioShow_MahoganySignal_Setup: ; 0x021F72C4
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	mov r1, #8
	bl AllocFromHeap
	mov r1, #0
	mov r2, #8
	add r4, r0, #0
	bl MI_CpuFill8
	add r0, r5, #0
	str r4, [r5, #0x1c]
	bl RadioShow_MahoganySignal_Init
	bl GF_GetCurrentPlayingBGM
	mov r1, #1
	bl StopBGM
	mov r0, #0
	strb r0, [r4, #4]
	ldr r0, _021F72FC ; =SEQ_GS_KAIDENPA
	bl SndRadio_StartSeq
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_021F72FC: .word SEQ_GS_KAIDENPA
	thumb_func_end RadioShow_MahoganySignal_Setup

	thumb_func_start RadioShow_MahoganySignal_Teardown
RadioShow_MahoganySignal_Teardown: ; 0x021F7300
	push {r4, lr}
	add r4, r0, #0
	bl RadioShow_MahoganySignal_Unload
	ldr r0, [r4, #0x1c]
	mov r1, #0
	mov r2, #8
	bl MI_CpuFill8
	ldr r0, [r4, #0x1c]
	bl FreeToHeap
	mov r0, #0
	str r0, [r4, #0x1c]
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end RadioShow_MahoganySignal_Teardown

	thumb_func_start RadioShow_MahoganySignal_Print
RadioShow_MahoganySignal_Print: ; 0x021F7320
	mov r0, #0
	bx lr
	thumb_func_end RadioShow_MahoganySignal_Print

	thumb_func_start RadioShow_MahoganySignal_Init
RadioShow_MahoganySignal_Init: ; 0x021F7324
	push {r4, lr}
	add r4, r0, #0
	ldr r2, _021F7348 ; =0x00000199
	ldr r3, [r4]
	mov r0, #0
	mov r1, #0x1b
	bl NewMsgDataFromNarc
	str r0, [r4, #0x24]
	ldr r2, [r4, #0x4c]
	mov r1, #0
	bl ReadMsgDataIntoString
	ldr r0, [r4, #0x50]
	bl String_SetEmpty
	pop {r4, pc}
	nop
_021F7348: .word 0x00000199
	thumb_func_end RadioShow_MahoganySignal_Init

	thumb_func_start RadioShow_MahoganySignal_Unload
RadioShow_MahoganySignal_Unload: ; 0x021F734C
	ldr r3, _021F7354 ; =DestroyMsgData
	ldr r0, [r0, #0x24]
	bx r3
	nop
_021F7354: .word DestroyMsgData
	thumb_func_end RadioShow_MahoganySignal_Unload

	.rodata

	.balign 4, 0
    .global ov101_021F8B4C
ov101_021F8B4C: ; 0x021F8B4C
	.byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x02, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04

    .global ov101_021F8B60
ov101_021F8B60: ; 0x021F8B60
	.short MAP_MOUNT_MOON_SQUARE
	.short MAP_MOUNT_MOON_SQUARE_CLEFAIRY_EVENT
	.short MAP_NATIONAL_PARK_BUG_CATCHING_CONTEST
	.short MAP_RUINS_OF_ALPH_UNDERGROUND_HALL
	.short MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT
	.short MAP_RUINS_OF_ALPH_HALL_ENTRANCE_SINJOH_EVENT
	.short MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2
	.short MAP_ICE_PATH_B1F
	.short MAP_ICE_PATH_B2F
	.short MAP_ICE_PATH_B3F
	.short MAP_WHIRL_ISLANDS_B1F, MAP_WHIRL_ISLANDS_B2F
	.short MAP_TOHJO_FALLS_HIDDEN_ROOM
	.short MAP_SAFARI_ZONE_ENTRANCE_EXTERIOR
