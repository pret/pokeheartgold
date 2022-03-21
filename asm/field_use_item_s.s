#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "msgdata/msg/msg_0010.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.public _0210FAD8

	.text

	.public sub_020649B8
	.public CreateAlphItemUseWork
	.public ExitMenuAndJumpToAlphChamberReaction
	.public ItemMenuUseFunc_HealingItem
	.public Task_PrintRegisteredKeyItemUseMessage

	thumb_func_start ItemMenuUseFunc_BerryPots
ItemMenuUseFunc_BerryPots: ; 0x02065428
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203ECC0
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _02065454 ; =sub_0203D718
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_02065454: .word sub_0203D718
	thumb_func_end ItemMenuUseFunc_BerryPots

	thumb_func_start ItemFieldUseFunc_BerryPots
ItemFieldUseFunc_BerryPots: ; 0x02065458
	push {r3, lr}
	ldr r1, _02065468 ; =sub_0206546C
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02065468: .word sub_0206546C
	thumb_func_end ItemFieldUseFunc_BerryPots

	thumb_func_start sub_0206546C
sub_0206546C: ; 0x0206546C
	ldr r3, _02065470 ; =sub_0203ECC0
	bx r3
	.balign 4, 0
_02065470: .word sub_0203ECC0
	thumb_func_end sub_0206546C

	thumb_func_start ItemMenuUseFunc_UnownReport
ItemMenuUseFunc_UnownReport: ; 0x02065474
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl sub_0203EC64
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _020654A0 ; =sub_0203D718
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_020654A0: .word sub_0203D718
	thumb_func_end ItemMenuUseFunc_UnownReport

	thumb_func_start ItemFieldUseFunc_UnownReport
ItemFieldUseFunc_UnownReport: ; 0x020654A4
	push {r3, lr}
	ldr r1, _020654B4 ; =sub_020654B8
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_020654B4: .word sub_020654B8
	thumb_func_end ItemFieldUseFunc_UnownReport

	thumb_func_start sub_020654B8
sub_020654B8: ; 0x020654B8
	ldr r3, _020654BC ; =sub_0203EC64
	bx r3
	.balign 4, 0
_020654BC: .word sub_0203EC64
	thumb_func_end sub_020654B8

	thumb_func_start ItemMenuUseFunc_DowsingMchn
ItemMenuUseFunc_DowsingMchn: ; 0x020654C0
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020654F0 ; =sub_02065508
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0
	add r0, #0x2c
	str r1, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	nop
_020654F0: .word sub_02065508
	thumb_func_end ItemMenuUseFunc_DowsingMchn

	thumb_func_start ItemFieldUseFunc_DowsingMchn
ItemFieldUseFunc_DowsingMchn: ; 0x020654F4
	push {r3, lr}
	ldr r0, [r0]
	ldr r1, _02065504 ; =sub_02065508
	mov r2, #0
	bl FieldSys_CreateTask
	mov r0, #0
	pop {r3, pc}
	.balign 4, 0
_02065504: .word sub_02065508
	thumb_func_end ItemFieldUseFunc_DowsingMchn

	thumb_func_start sub_02065508
sub_02065508: ; 0x02065508
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetStatePtr
	add r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _02065526
	cmp r0, #1
	beq _02065546
	b _0206555A
_02065526:
	add r0, r5, #0
	mov r1, #4
	mov r2, #0
	bl ov01_021F6A9C
	add r0, r5, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r5, #0xd2
	orr r0, r1
	strb r0, [r5]
	ldr r0, [r4]
	add r0, r0, #1
	str r0, [r4]
	b _0206555A
_02065546:
	add r0, r5, #0
	bl ov01_021F6B10
	cmp r0, #1
	bne _0206555A
	ldr r0, [r5, #0x3c]
	bl MapObjectMan_UnpauseAllMovement
	mov r0, #1
	pop {r3, r4, r5, pc}
_0206555A:
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
	thumb_func_end sub_02065508

	thumb_func_start ItemFieldUseFunc_GbSounds
ItemFieldUseFunc_GbSounds: ; 0x02065560
	push {r4, r5, r6, lr}
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	mov r1, #0x1b
	mov r2, #0xa
	mov r3, #0xb
	strh r0, [r4, #0x16]
	bl NewMsgDataFromNarc
	add r5, r0, #0
	bl SoundSys_GetGBSoundsState
	cmp r0, #1
	bne _02065590
	add r0, r5, #0
	mov r1, #msg_0010_00105
	bl NewString_ReadMsgData
	b _02065598
_02065590:
	add r0, r5, #0
	mov r1, #msg_0010_00104
	bl NewString_ReadMsgData
_02065598:
	str r0, [r4, #0x10]
	add r0, r5, #0
	bl DestroyMsgData
	bl SoundSys_ToggleGBSounds
	ldr r0, [r6]
	ldr r1, _020655B4 ; =Task_PrintRegisteredKeyItemUseMessage
	add r2, r4, #0
	bl FieldSys_CreateTask
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_020655B4: .word Task_PrintRegisteredKeyItemUseMessage
	thumb_func_end ItemFieldUseFunc_GbSounds

	thumb_func_start ItemMenuUseFunc_Gracidea
ItemMenuUseFunc_Gracidea: ; 0x020655B8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r2, _020655E8 ; =0x000001D2
	add r0, r5, #0
	mov r1, #0xb
	bl sub_0203FAE8
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _020655EC ; =sub_0203CA9C
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_020655E8: .word 0x000001D2
_020655EC: .word sub_0203CA9C
	thumb_func_end ItemMenuUseFunc_Gracidea

	thumb_func_start ItemFieldUseFunc_Gracidea
ItemFieldUseFunc_Gracidea: ; 0x020655F0
	push {r3, lr}
	ldr r1, _02065600 ; =sub_02065604
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02065600: .word sub_02065604
	thumb_func_end ItemFieldUseFunc_Gracidea

	thumb_func_start sub_02065604
sub_02065604: ; 0x02065604
	ldr r3, _0206560C ; =sub_0203FAE8
	mov r1, #0xb
	ldr r2, _02065610 ; =0x000001D2
	bx r3
	.balign 4, 0
_0206560C: .word sub_0203FAE8
_02065610: .word 0x000001D2
	thumb_func_end sub_02065604

	thumb_func_start ItemMenuUseFunc_VSRecorder
ItemMenuUseFunc_VSRecorder: ; 0x02065614
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r1, [r5, #0xc]
	add r0, r5, #0
	bl sub_0203F570
	mov r0, #0xe
	mov r1, #0
	lsl r0, r0, #6
	str r1, [r4, r0]
	ldr r1, _02065644 ; =sub_0203D9B4
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_02065644: .word sub_0203D9B4
	thumb_func_end ItemMenuUseFunc_VSRecorder

	thumb_func_start ItemFieldUseFunc_VSRecorder
ItemFieldUseFunc_VSRecorder: ; 0x02065648
	push {r3, lr}
	ldr r1, _02065658 ; =sub_0206565C
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02065658: .word sub_0206565C
	thumb_func_end ItemFieldUseFunc_VSRecorder

	thumb_func_start sub_0206565C
sub_0206565C: ; 0x0206565C
	push {r4, lr}
	add r4, r0, #0
	bl ov01_021F4440
	ldr r1, [r4, #0xc]
	add r0, r4, #0
	bl sub_0203F570
	mov r0, #0
	pop {r4, pc}
	thumb_func_end sub_0206565C

	thumb_func_start KeyItemIdIsUsedInTheField
KeyItemIdIsUsedInTheField: ; 0x02065670
	ldr r3, _0206568C ; =_0210FAD8
	mov r2, #0
_02065674:
	ldrh r0, [r3]
	cmp r1, r0
	bne _0206567E
	mov r0, #0
	bx lr
_0206567E:
	add r2, r2, #1
	add r3, r3, #2
	cmp r2, #8
	blo _02065674
	mov r0, #1
	bx lr
	nop
_0206568C: .word _0210FAD8
	thumb_func_end KeyItemIdIsUsedInTheField

	thumb_func_start UseRegisteredItemButtonInField
UseRegisteredItemButtonInField: ; 0x02065690
	push {r3, r4, r5, r6, r7, lr}
	add r4, r1, #0
	add r5, r0, #0
	cmp r4, #1
	beq _020656A2
	cmp r4, #2
	beq _020656A2
	bl GF_AssertFail
_020656A2:
	add r0, r5, #0
	bl sub_02067584
	cmp r0, #1
	bne _020656B0
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020656B0:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckPalParkSysFlag
	cmp r0, #1
	bne _020656C2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020656C2:
	ldr r0, [r5, #0xc]
	bl SavArray_Flags_get
	bl CheckFlag996
	cmp r0, #1
	bne _020656D4
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020656D4:
	add r0, r5, #0
	bl ov01_021F6B10
	cmp r0, #1
	beq _020656E2
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_020656E2:
	cmp r4, #1
	ldr r0, [r5, #0xc]
	bne _020656F2
	bl Sav2_Bag_get
	bl Bag_GetRegisteredItemSlot1
	b _020656FA
_020656F2:
	bl Sav2_Bag_get
	bl Bag_GetRegisteredItemSlot2
_020656FA:
	add r6, r0, #0
	ldr r0, _020657A0 ; =ITEM_DOWSING_MCHN
	cmp r6, r0
	bne _02065710
	add r0, r5, #0
	bl ov01_021F6B00
	cmp r0, #4
	bne _02065710
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_02065710:
	add r0, r6, #0
	mov r1, #ITEMATTR_FIELDUSEFUNC
	mov r2, #0xb
	bl GetItemAttr
	lsl r0, r0, #0x10
	lsr r4, r0, #0x10
	mov r0, #2
	add r1, r4, #0
	bl GetItemFieldUseFunc
	add r7, r0, #0
	mov r0, #1
	add r1, r4, #0
	bl GetItemFieldUseFunc
	str r0, [sp]
	cmp r0, #0
	bne _0206573A
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
_0206573A:
	mov r0, #0xb
	mov r1, #0x28
	bl AllocFromHeap
	add r4, r0, #0
	mov r1, #0
	mov r2, #0x28
	bl memset
	str r5, [r4]
	add r0, r5, #0
	add r1, r4, #4
	strh r6, [r4, #0x24]
	bl sub_020649B8
	mov r6, #0
	cmp r7, #0
	bne _02065768
	ldr r1, [sp]
	add r0, r4, #0
	blx r1
	add r6, r0, #0
	b _02065780
_02065768:
	add r0, r4, #4
	blx r7
	add r1, r0, #0
	bne _0206577A
	ldr r1, [sp]
	add r0, r4, #0
	blx r1
	add r6, r0, #0
	b _02065780
_0206577A:
	add r0, r4, #0
	bl sub_020657A4
_02065780:
	cmp r6, #0
	bne _0206578C
	add r0, r4, #0
	bl FreeToHeap
	b _0206579C
_0206578C:
	ldrh r1, [r4, #0x24]
	add r0, r5, #0
	bl KeyItemIdIsUsedInTheField
	cmp r0, #0
	beq _0206579C
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_0206579C:
	mov r0, #2
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_020657A0: .word ITEM_DOWSING_MCHN
	thumb_func_end UseRegisteredItemButtonInField

	thumb_func_start sub_020657A4
sub_020657A4: ; 0x020657A4
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	add r6, r1, #0
	mov r0, #0xb
	mov r1, #0x18
	bl AllocFromHeap
	add r4, r0, #0
	mov r0, #0
	strh r0, [r4, #0x16]
	mov r0, #0x80
	mov r1, #0xb
	bl String_ctor
	str r0, [r4, #0x10]
	ldr r0, [r5]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0xb
	str r1, [sp]
	ldrh r2, [r5, #0x24]
	ldr r1, [r4, #0x10]
	add r3, r6, #0
	bl GetItemUseErrorMessage
	ldr r0, [r5]
	ldr r1, _020657E8 ; =Task_PrintRegisteredKeyItemUseMessage
	add r2, r4, #0
	bl FieldSys_CreateTask
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020657E8: .word Task_PrintRegisteredKeyItemUseMessage
	thumb_func_end sub_020657A4

	thumb_func_start sub_020657EC
sub_020657EC: ; 0x020657EC
	push {r3, r4, r5, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r4, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, #0x26
	ldrb r0, [r0]
	cmp r0, #5
	bhi _020658B4
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02065812: ; jump table
	.short _0206581E - _02065812 - 2 ; case 0
	.short _02065832 - _02065812 - 2 ; case 1
	.short _0206585C - _02065812 - 2 ; case 2
	.short _02065866 - _02065812 - 2 ; case 3
	.short _0206587E - _02065812 - 2 ; case 4
	.short _0206589C - _02065812 - 2 ; case 5
_0206581E:
	ldr r0, [r5, #0x3c]
	bl MapObjectMan_PauseAllMovement
	mov r0, #0
	bl ov01_021E636C
	mov r0, #1
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_02065832:
	bl IsPaletteFadeActive
	cmp r0, #0
	beq _020658B4
	ldr r1, [r4, #0x1c]
	add r0, r5, #0
	blx r1
	str r0, [r4, #0x20]
	add r0, r4, #0
	add r0, #0x27
	ldrb r0, [r0]
	cmp r0, #0
	bne _02065854
	mov r0, #2
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_02065854:
	mov r0, #3
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_0206585C:
	add r0, r5, #0
	bl FieldSys_ApplicationIsRunning
	cmp r0, #0
	bne _020658B4
_02065866:
	ldr r0, [r4, #0x20]
	cmp r0, #0
	beq _02065870
	bl FreeToHeap
_02065870:
	add r0, r5, #0
	bl sub_020505C0
	mov r0, #4
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_0206587E:
	add r0, r5, #0
	bl sub_020505C8
	cmp r0, #0
	beq _020658B4
	ldr r0, [r5, #0x3c]
	bl MapObjectMan_PauseAllMovement
	mov r0, #1
	bl ov01_021E636C
	mov r0, #5
	add r4, #0x26
	strb r0, [r4]
	b _020658B4
_0206589C:
	bl IsPaletteFadeActive
	cmp r0, #0
	beq _020658B4
	ldr r0, [r5, #0x3c]
	bl MapObjectMan_UnpauseAllMovement
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_020658B4:
	mov r0, #0
	pop {r3, r4, r5, pc}
	thumb_func_end sub_020657EC

	thumb_func_start sub_020658B8
sub_020658B8: ; 0x020658B8
	add r3, r0, #0
	str r1, [r3, #0x1c]
	add r0, #0x27
	strb r2, [r0]
	ldr r0, [r3]
	add r2, r3, #0
	ldr r3, _020658CC ; =FieldSys_CreateTask
	ldr r1, _020658D0 ; =sub_020657EC
	bx r3
	nop
_020658CC: .word FieldSys_CreateTask
_020658D0: .word sub_020657EC
	thumb_func_end sub_020658B8

	.rodata

	.public _020FE264
