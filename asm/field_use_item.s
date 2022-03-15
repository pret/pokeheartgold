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

	.data

_0210FAD8:
	.short ITEM_BICYCLE
	.short ITEM_OLD_ROD
	.short ITEM_GOOD_ROD
	.short ITEM_SUPER_ROD
	.short ITEM_POINT_CARD
	.short ITEM_SEAL_CASE
	.short ITEM_FASHION_CASE
	.short ITEM_COIN_CASE

	.text

	thumb_func_start GetItemFieldUseFunc
GetItemFieldUseFunc: ; 0x02064980
	cmp r0, #0
	bne _02064990
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	ldr r0, _020649AC ; =_020FE264
	ldr r0, [r0, r2]
	bx lr
_02064990:
	cmp r0, #1
	bne _020649A0
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	ldr r0, _020649B0 ; =_020FE264 + 4
	ldr r0, [r0, r2]
	bx lr
_020649A0:
	mov r0, #0xc
	add r2, r1, #0
	mul r2, r0
	ldr r0, _020649B4 ; =_020FE264 + 8
	ldr r0, [r0, r2]
	bx lr
	.balign 4, 0
_020649AC: .word _020FE264
_020649B0: .word _020FE264 + 4
_020649B4: .word _020FE264 + 8
	thumb_func_end GetItemFieldUseFunc

	thumb_func_start sub_020649B8
sub_020649B8: ; 0x020649B8
	push {r3, r4, r5, r6, r7, lr}
	add r4, r0, #0
	add r5, r1, #0
	str r4, [r5, #0x14]
	ldr r0, [r4, #0x20]
	ldr r0, [r0]
	str r0, [r5]
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	ldrh r1, [r5, #8]
	mov r2, #1
	lsl r0, r0, #0x10
	bic r1, r2
	lsr r2, r0, #0x10
	mov r0, #1
	and r0, r2
	orr r0, r1
	strh r0, [r5, #8]
	ldr r0, [r4, #0xc]
	bl SavArray_Flags_get
	bl CheckFlag969
	lsl r0, r0, #0x10
	lsr r0, r0, #0x10
	lsl r0, r0, #0x1f
	ldrh r1, [r5, #8]
	mov r2, #2
	lsr r0, r0, #0x1e
	bic r1, r2
	orr r0, r1
	strh r0, [r5, #8]
	ldr r0, [r4, #0x40]
	bl sub_0205C700
	str r0, [r5, #4]
	ldr r0, [r4, #0x40]
	bl GetPlayerXCoord
	add r6, r0, #0
	ldr r0, [r4, #0x40]
	bl GetPlayerYCoord
	add r7, r0, #0
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02054918
	strh r0, [r5, #0xc]
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	cmp r0, #3
	bhi _02064A4E
	add r0, r0, r0
	add r0, pc
	ldrh r0, [r0, #6]
	lsl r0, r0, #0x10
	asr r0, r0, #0x10
	add pc, r0
_02064A38: ; jump table
	.short _02064A40 - _02064A38 - 2 ; case 0
	.short _02064A44 - _02064A38 - 2 ; case 1
	.short _02064A4C - _02064A38 - 2 ; case 2
	.short _02064A48 - _02064A38 - 2 ; case 3
_02064A40:
	sub r7, r7, #1
	b _02064A4E
_02064A44:
	add r7, r7, #1
	b _02064A4E
_02064A48:
	add r6, r6, #1
	b _02064A4E
_02064A4C:
	sub r6, r6, #1
_02064A4E:
	add r0, r4, #0
	add r1, r6, #0
	add r2, r7, #0
	bl sub_02054918
	strh r0, [r5, #0xa]
	add r0, r4, #0
	add r1, sp, #0
	bl sub_0203DBF8
	ldr r0, [r4, #0x40]
	str r0, [r5, #0x10]
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_020649B8

	thumb_func_start sub_02064A68
sub_02064A68: ; 0x02064A68
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x20
	mov r1, #0xc
	add r6, r2, #0
	add r7, r3, #0
	bl AllocFromHeap
	str r5, [r0]
	strh r4, [r0, #4]
	strh r6, [r0, #6]
	strh r7, [r0, #8]
	add r1, sp, #8
	ldrh r1, [r1, #0x10]
	strh r1, [r0, #0xa]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
	thumb_func_end sub_02064A68

	thumb_func_start sub_02064A8C
sub_02064A8C: ; 0x02064A8C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r2, #0
	bl TaskManager_GetSys
	add r7, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r7, #0
	bl sub_020505C0
	mov r0, #0xd5
	mov r2, #0
	ldr r1, _02064ACC ; =sub_02064AD0
	lsl r0, r0, #2
	str r1, [r4, r0]
	str r2, [sp]
	ldrh r1, [r5, #4]
	add r0, r6, #0
	add r3, r2, #0
	bl sub_02064A68
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02064ACC: .word sub_02064AD0
	thumb_func_end sub_02064A8C

	thumb_func_start sub_02064AD0
sub_02064AD0: ; 0x02064AD0
	push {r3, r4, r5, r6, r7, lr}
	add r7, r0, #0
	bl TaskManager_GetSys
	add r5, r0, #0
	add r0, r7, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r7, #0
	bl TaskManager_GetStatePtr
	add r6, r0, #0
	ldr r0, [r6]
	cmp r0, #0
	beq _02064AF6
	cmp r0, #1
	beq _02064B46
	b _02064B50
_02064AF6:
	add r0, r5, #0
	add r1, sp, #0
	bl sub_0203DBF8
	ldr r1, [r4]
	ldr r2, [sp]
	lsl r1, r1, #0x10
	add r0, r7, #0
	lsr r1, r1, #0x10
	mov r3, #0
	bl QueueScript
	add r0, r5, #0
	mov r1, #0x2a
	bl FieldSysGetAttrAddr
	ldrh r1, [r4, #4]
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x2b
	bl FieldSysGetAttrAddr
	ldrh r1, [r4, #6]
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x2c
	bl FieldSysGetAttrAddr
	ldrh r1, [r4, #8]
	strh r1, [r0]
	add r0, r5, #0
	mov r1, #0x2d
	bl FieldSysGetAttrAddr
	ldrh r1, [r4, #0xa]
	strh r1, [r0]
	ldr r0, [r6]
	add r0, r0, #1
	str r0, [r6]
	b _02064B50
_02064B46:
	add r0, r4, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, r6, r7, pc}
_02064B50:
	mov r0, #0
	pop {r3, r4, r5, r6, r7, pc}
	thumb_func_end sub_02064AD0

	thumb_func_start ItemMenuUseFunc_HealingItem
ItemMenuUseFunc_HealingItem: ; 0x02064B54
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r6]
	bl TaskManager_GetEnv
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	bl sub_020270C4
	str r0, [r4, #0x10]
	mov r0, #0x37
	lsl r0, r0, #4
	add r0, r7, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #5
	add r0, #0x24
	strb r1, [r0]
	str r5, [r4, #0x1c]
	ldrh r0, [r6, #4]
	add r2, r4, #0
	strh r0, [r4, #0x28]
	add r0, r4, #0
	ldrb r1, [r6, #6]
	add r0, #0x26
	strb r1, [r0]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x20]
	ldr r1, _02064BEC ; =_0210159C
	add r0, r5, #0
	bl Fsys_LaunchApplication
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r7, r0]
	ldr r1, _02064BF0 ; =sub_0203CA9C
	add r0, r7, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02064BEC: .word _0210159C
_02064BF0: .word sub_0203CA9C
	thumb_func_end ItemMenuUseFunc_HealingItem

	thumb_func_start ItemCheckUseFunc_Dummy
ItemCheckUseFunc_Dummy: ; 0x02064BF4
	mov r0, #0
	mvn r0, r0
	bx lr
	.balign 4, 0
	thumb_func_end ItemCheckUseFunc_Dummy

	thumb_func_start ItemMenuUseFunc_Bicycle
ItemMenuUseFunc_Bicycle: ; 0x02064BFC
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
	ldr r1, _02064C2C ; =sub_02064C58
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0
	add r0, #0x2c
	str r1, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	nop
_02064C2C: .word sub_02064C58
	thumb_func_end ItemMenuUseFunc_Bicycle

	thumb_func_start ItemFieldUseFunc_Bicycle
ItemFieldUseFunc_Bicycle: ; 0x02064C30
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	ldr r1, _02064C54 ; =sub_02064C58
	mov r2, #0
	bl FieldSys_CreateTask
	ldr r2, [r4]
	add r0, r2, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x80
	add r2, #0xd2
	orr r0, r1
	strb r0, [r2]
	mov r0, #0
	pop {r4, pc}
	nop
_02064C54: .word sub_02064C58
	thumb_func_end ItemFieldUseFunc_Bicycle

	thumb_func_start sub_02064C58
sub_02064C58: ; 0x02064C58
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetStatePtr
	add r5, r0, #0
	ldr r0, [r5]
	cmp r0, #0
	beq _02064C7C
	cmp r0, #1
	beq _02064CC2
	cmp r0, #2
	bne _02064C7A
	b _02064D94
_02064C7A:
	b _02064D9E
_02064C7C:
	add r0, r4, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02064CBA
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	bl MapObject_IsMovementPaused
	cmp r0, #0
	bne _02064C96
	b _02064D9E
_02064C96:
	ldr r0, [r4, #0x40]
	bl sub_0205C700
	cmp r0, #1
	bne _02064CA4
	mov r6, #0x30
	b _02064CA6
_02064CA4:
	mov r6, #0x38
_02064CA6:
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	add r1, r6, #0
	bl sub_0205FC94
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02064D9E
_02064CBA:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02064D9E
_02064CC2:
	ldr r0, [r4, #0x40]
	bl sub_0205C700
	cmp r0, #1
	bne _02064D3E
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_UnpauseMovement
	ldr r0, [r4, #0x40]
	mov r1, #1
	bl ov01_021F1AFC
	ldr r0, [r4, #0x40]
	bl ov01_021F1B04
	add r0, r4, #0
	mov r1, #0
	bl sub_02054F28
	bl SndRadio_GetSeqNo
	cmp r0, #0
	bne _02064D08
	ldr r1, [r4, #0x20]
	add r0, r4, #0
	ldr r1, [r1]
	bl sub_02054F60
	add r1, r0, #0
	add r0, r4, #0
	mov r2, #1
	bl sub_02054FDC
_02064D08:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	lsl r1, r1, #0x18
	add r0, r4, #0
	lsr r1, r1, #0x18
	bl ov01_02205790
	add r0, r4, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02064D8C
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #1
	bl sub_02069E84
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #1
	bl sub_02069DC8
	b _02064D8C
_02064D3E:
	bl SndRadio_GetSeqNo
	cmp r0, #0
	bne _02064D58
	ldr r1, _02064DA4 ; =0x000003F5
	add r0, r4, #0
	bl sub_02054F28
	ldr r1, _02064DA4 ; =0x000003F5
	add r0, r4, #0
	mov r2, #1
	bl sub_02054FDC
_02064D58:
	ldr r0, [r4, #0x40]
	bl PlayerAvatar_GetMapObject
	bl MapObject_UnpauseMovement
	ldr r0, [r4, #0x40]
	mov r1, #2
	bl ov01_021F1AFC
	ldr r0, [r4, #0x40]
	bl ov01_021F1B04
	add r0, r4, #0
	bl ov01_02205D68
	add r0, r4, #0
	bl FollowingPokemon_IsActive
	cmp r0, #0
	beq _02064D8C
	add r0, r4, #0
	bl FollowingPokemon_GetMapObject
	mov r1, #0
	bl sub_02069E84
_02064D8C:
	ldr r0, [r5]
	add r0, r0, #1
	str r0, [r5]
	b _02064D9E
_02064D94:
	ldr r0, [r4, #0x3c]
	bl MapObjectMan_UnpauseAllMovement
	mov r0, #1
	pop {r4, r5, r6, pc}
_02064D9E:
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_02064DA4: .word 0x000003F5
	thumb_func_end sub_02064C58

	thumb_func_start ItemCheckUseFunc_Bicycle
ItemCheckUseFunc_Bicycle: ; 0x02064DA8
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _02064DBA
	mov r0, #2
	pop {r4, pc}
_02064DBA:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _02064DC6
	mov r0, #3
	pop {r4, pc}
_02064DC6:
	ldr r0, [r4, #0x10]
	bl sub_0205CABC
	cmp r0, #1
	bne _02064DD4
	mov r0, #1
	pop {r4, pc}
_02064DD4:
	ldrh r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B6F4
	cmp r0, #1
	beq _02064DF0
	ldrh r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8AC
	cmp r0, #1
	bne _02064DF6
_02064DF0:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_02064DF6:
	ldr r0, [r4]
	bl MapHeader_IsBikeAllowed
	cmp r0, #0
	bne _02064E06
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_02064E06:
	ldr r0, [r4, #4]
	cmp r0, #2
	bne _02064E12
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_02064E12:
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ItemCheckUseFunc_Bicycle

	thumb_func_start ItemMenuUseFunc_TMHM
ItemMenuUseFunc_TMHM: ; 0x02064E18
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r6]
	bl TaskManager_GetEnv
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	mov r0, #0x37
	lsl r0, r0, #4
	add r0, r7, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r0, r4, #0
	mov r1, #6
	add r0, #0x24
	strb r1, [r0]
	str r5, [r4, #0x1c]
	ldrh r0, [r6, #4]
	strh r0, [r4, #0x28]
	add r0, r4, #0
	ldrb r1, [r6, #6]
	add r0, #0x26
	strb r1, [r0]
	ldrh r0, [r6, #4]
	bl TMHMGetMove
	strh r0, [r4, #0x2a]
	mov r0, #0x43
	lsl r0, r0, #2
	add r0, r5, r0
	str r0, [r4, #0x20]
	ldr r1, _02064EB0 ; =_0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r7, r0]
	ldr r1, _02064EB4 ; =sub_0203CA9C
	add r0, r7, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, r6, r7, pc}
	nop
_02064EB0: .word _0210159C
_02064EB4: .word sub_0203CA9C
	thumb_func_end ItemMenuUseFunc_TMHM

	thumb_func_start ItemMenuUseFunc_Mail
ItemMenuUseFunc_Mail: ; 0x02064EB8
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldrh r0, [r5, #4]
	bl ItemToMailId
	add r2, r0, #0
	add r0, r6, #0
	mov r1, #3
	mov r3, #0xb
	bl sub_0203F018
	add r6, r0, #0
	ldrh r0, [r5, #4]
	mov r1, #3
	mov r2, #0
	bl sub_0203D818
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	sub r0, r1, #4
	str r6, [r4, r0]
	ldr r1, _02064F00 ; =sub_0203D830
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r4, r5, r6, pc}
	nop
_02064F00: .word sub_0203D830
	thumb_func_end ItemMenuUseFunc_Mail

	thumb_func_start ItemCheckUseFunc_Berry
ItemCheckUseFunc_Berry: ; 0x02064F04
	mov r0, #0
	bx lr
	thumb_func_end ItemCheckUseFunc_Berry

	thumb_func_start ItemMenuUseFunc_Berry
ItemMenuUseFunc_Berry: ; 0x02064F08
	push {r3, r4, r5, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r4, r1, #0
	bl TaskManager_GetSys
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r0, r5, #0
	add r1, r4, #0
	bl ItemMenuUseFunc_HealingItem
	pop {r3, r4, r5, pc}
	thumb_func_end ItemMenuUseFunc_Berry

	thumb_func_start sub_02064F24
sub_02064F24: ; 0x02064F24
	mov r0, #0
	bx lr
	thumb_func_end sub_02064F24

	thumb_func_start ItemMenuUseFunc_PalPad
ItemMenuUseFunc_PalPad: ; 0x02064F28
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
	mov r2, #0xb
	bl sub_0203F53C
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _02064F58 ; =sub_0203D718
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	nop
_02064F58: .word sub_0203D718
	thumb_func_end ItemMenuUseFunc_PalPad

	thumb_func_start ItemFieldUseFunc_PalPad
ItemFieldUseFunc_PalPad: ; 0x02064F5C
	push {r3, lr}
	ldr r1, _02064F6C ; =sub_02064F70
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02064F6C: .word sub_02064F70
	thumb_func_end ItemFieldUseFunc_PalPad

	thumb_func_start sub_02064F70
sub_02064F70: ; 0x02064F70
	ldr r3, _02064F78 ; =sub_0203F53C
	ldr r1, [r0, #0xc]
	mov r2, #0xb
	bx r3
	.balign 4, 0
_02064F78: .word sub_0203F53C
	thumb_func_end sub_02064F70

	thumb_func_start ItemMenuUseFunc_Honey
ItemMenuUseFunc_Honey: ; 0x02064F7C
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C0
	bl ov01_021FC30C
	str r0, [sp]
	ldr r1, [sp]
	mov r0, #0xb
	bl AllocFromHeapAtEnd
	ldr r2, [sp]
	mov r1, #0
	add r7, r0, #0
	bl memset
	mov r0, #0xd5
	ldr r1, _02064FD0 ; =ov01_021FC310
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r7, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	ldr r0, [r6, #0xc]
	bl Sav2_Bag_get
	ldrh r1, [r5, #4]
	mov r2, #1
	mov r3, #0xb
	bl Bag_TakeItem
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02064FD0: .word ov01_021FC310
	thumb_func_end ItemMenuUseFunc_Honey

	thumb_func_start ItemMenuUseFunc_OldRod
ItemMenuUseFunc_OldRod: ; 0x02064FD4
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
	ldr r1, _0206500C ; =ov01_021FC698
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #0
	bl ov01_021FC66C
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_0206500C: .word ov01_021FC698
	thumb_func_end ItemMenuUseFunc_OldRod

	thumb_func_start ItemFieldUseFunc_OldRod
ItemFieldUseFunc_OldRod: ; 0x02065010
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #4
	mov r2, #0
	bl ov01_021FC66C
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, _0206502C ; =ov01_021FC698
	bl FieldSys_CreateTask
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_0206502C: .word ov01_021FC698
	thumb_func_end ItemFieldUseFunc_OldRod

	thumb_func_start ItemMenuUseFunc_GoodRod
ItemMenuUseFunc_GoodRod: ; 0x02065030
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
	ldr r1, _02065068 ; =ov01_021FC698
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #1
	bl ov01_021FC66C
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02065068: .word ov01_021FC698
	thumb_func_end ItemMenuUseFunc_GoodRod

	thumb_func_start ItemFieldUseFunc_GoodRod
ItemFieldUseFunc_GoodRod: ; 0x0206506C
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #4
	mov r2, #1
	bl ov01_021FC66C
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, _02065088 ; =ov01_021FC698
	bl FieldSys_CreateTask
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_02065088: .word ov01_021FC698
	thumb_func_end ItemFieldUseFunc_GoodRod

	thumb_func_start ItemMenuUseFunc_SuperRod
ItemMenuUseFunc_SuperRod: ; 0x0206508C
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
	ldr r1, _020650C4 ; =ov01_021FC698
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, r5, #0
	mov r1, #0xb
	mov r2, #2
	bl ov01_021FC66C
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_020650C4: .word ov01_021FC698
	thumb_func_end ItemMenuUseFunc_SuperRod

	thumb_func_start ItemFieldUseFunc_SuperRod
ItemFieldUseFunc_SuperRod: ; 0x020650C8
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4]
	mov r1, #4
	mov r2, #2
	bl ov01_021FC66C
	add r2, r0, #0
	ldr r0, [r4]
	ldr r1, _020650E4 ; =ov01_021FC698
	bl FieldSys_CreateTask
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020650E4: .word ov01_021FC698
	thumb_func_end ItemFieldUseFunc_SuperRod

	thumb_func_start ItemCheckUseFunc_FishingRod
ItemCheckUseFunc_FishingRod: ; 0x020650E8
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _020650FA
	mov r0, #2
	pop {r4, pc}
_020650FA:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _02065106
	mov r0, #3
	pop {r4, pc}
_02065106:
	ldrh r0, [r4, #0xa]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B778
	cmp r0, #1
	bne _02065148
	ldrh r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA30
	cmp r0, #1
	beq _02065130
	ldrh r0, [r4, #0xc]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BA24
	cmp r0, #1
	bne _02065144
_02065130:
	ldr r0, [r4, #0x10]
	bl PlayerAvatar_GetMapObject
	bl sub_0205F83C
	cmp r0, #1
	bne _02065144
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
_02065144:
	mov r0, #0
	pop {r4, pc}
_02065148:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ItemCheckUseFunc_FishingRod

	thumb_func_start ItemFieldUseFunc_Generic
ItemFieldUseFunc_Generic: ; 0x02065150
	push {r3, r4, r5, lr}
	add r5, r0, #0
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
	ldrh r2, [r5, #0x24]
	ldr r0, [r0, #0xc]
	ldr r1, [r4, #0x10]
	mov r3, #0xb
	bl TryFormatRegisteredKeyItemUseMessage
	ldr r0, [r5]
	ldr r1, _02065188 ; =sub_0206518C
	add r2, r4, #0
	bl FieldSys_CreateTask
	mov r0, #0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02065188: .word sub_0206518C
	thumb_func_end ItemFieldUseFunc_Generic

	thumb_func_start sub_0206518C
sub_0206518C: ; 0x0206518C
	push {r3, r4, r5, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r5, r0, #0
	ldrh r0, [r5, #0x16]
	cmp r0, #0
	beq _020651AE
	cmp r0, #1
	beq _020651F4
	cmp r0, #2
	beq _02065232
	b _0206524E
_020651AE:
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	orr r1, r0
	add r0, r4, #0
	add r0, #0xd2
	strb r1, [r0]
	ldr r0, [r4, #0x3c]
	bl MapObjectMan_PauseAllMovement
	ldr r0, [r4, #8]
	add r1, r5, #0
	mov r2, #3
	bl sub_0205B514
	ldr r0, [r4, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	add r4, r0, #0
	add r0, r5, #0
	add r1, r4, #0
	bl sub_0205B564
	ldr r1, [r5, #0x10]
	add r0, r5, #0
	add r2, r4, #0
	mov r3, #1
	bl sub_0205B5B4
	strh r0, [r5, #0x14]
	ldrh r0, [r5, #0x16]
	add r0, r0, #1
	strh r0, [r5, #0x16]
	b _0206524E
_020651F4:
	ldrh r0, [r5, #0x14]
	lsl r0, r0, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B624
	cmp r0, #1
	bne _0206524E
	ldr r1, _02065254 ; =gSystem
	mov r0, #0xf3
	ldr r2, [r1, #0x48]
	tst r0, r2
	bne _02065214
	ldr r1, [r1, #0x5c]
	mov r0, #1
	tst r0, r1
	beq _0206524E
_02065214:
	add r0, r4, #0
	add r0, #0xd2
	ldrb r1, [r0]
	mov r0, #0x40
	add r4, #0xd2
	bic r1, r0
	strb r1, [r4]
	add r0, r5, #0
	mov r1, #0
	bl ClearFrameAndWindow2
	ldrh r0, [r5, #0x16]
	add r0, r0, #1
	strh r0, [r5, #0x16]
	b _0206524E
_02065232:
	ldr r0, [r4, #0x3c]
	bl MapObjectMan_UnpauseAllMovement
	add r0, r5, #0
	bl RemoveWindow
	ldr r0, [r5, #0x10]
	bl String_dtor
	add r0, r5, #0
	bl FreeToHeap
	mov r0, #1
	pop {r3, r4, r5, pc}
_0206524E:
	mov r0, #0
	pop {r3, r4, r5, pc}
	nop
_02065254: .word gSystem
	thumb_func_end sub_0206518C

	thumb_func_start ItemMenuUseFunc_EvoStone
ItemMenuUseFunc_EvoStone: ; 0x02065258
	push {r3, r4, r5, r6, r7, lr}
	add r6, r0, #0
	ldr r0, [r6]
	add r4, r1, #0
	bl TaskManager_GetSys
	ldrh r1, [r6, #4]
	add r5, r0, #0
	cmp r1, #ITEM_WATER_STONE
	bne _02065280
	bl CheckUseWaterStoneInAlphChamber
	cmp r0, #0
	beq _02065280
	add r0, r6, #0
	add r1, r4, #0
	mov r2, #3
	bl sub_02064A8C
	pop {r3, r4, r5, r6, r7, pc}
_02065280:
	ldr r0, [r6]
	bl TaskManager_GetEnv
	add r7, r0, #0
	mov r0, #0xb
	mov r1, #0x44
	bl AllocFromHeap
	mov r1, #0
	mov r2, #0x44
	add r4, r0, #0
	bl memset
	ldr r0, [r5, #0xc]
	bl SavArray_PlayerParty_get
	str r0, [r4]
	ldr r0, [r5, #0xc]
	bl Sav2_Bag_get
	str r0, [r4, #4]
	ldr r0, [r5, #0xc]
	bl Sav2_Mailbox_get
	str r0, [r4, #8]
	ldr r0, [r5, #0xc]
	bl Sav2_PlayerData_GetOptionsAddr
	str r0, [r4, #0xc]
	ldr r0, [r5, #0xc]
	bl sub_020270C4
	str r0, [r4, #0x10]
	mov r0, #0x37
	lsl r0, r0, #4
	add r0, r7, r0
	str r0, [r4, #0x18]
	add r0, r4, #0
	mov r1, #0
	add r0, #0x25
	strb r1, [r0]
	add r1, r4, #0
	mov r0, #0x10
	add r1, #0x24
	strb r0, [r1]
	ldrh r1, [r6, #4]
	add r0, #0xfc
	add r0, r5, r0
	strh r1, [r4, #0x28]
	add r1, r4, #0
	ldrb r2, [r6, #6]
	add r1, #0x26
	strb r2, [r1]
	str r5, [r4, #0x1c]
	str r0, [r4, #0x20]
	ldr r1, _02065308 ; =_0210159C
	add r0, r5, #0
	add r2, r4, #0
	bl Fsys_LaunchApplication
	mov r0, #0xe
	lsl r0, r0, #6
	str r4, [r7, r0]
	ldr r1, _0206530C ; =sub_0203CA9C
	add r0, r7, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_02065308: .word _0210159C
_0206530C: .word sub_0203CA9C
	thumb_func_end ItemMenuUseFunc_EvoStone

	thumb_func_start ItemMenuUseFunc_EscapeRope
ItemMenuUseFunc_EscapeRope: ; 0x02065310
	push {r4, r5, r6, lr}
	add r4, r1, #0
	add r5, r0, #0
	ldr r0, [r4, #0x14]
	bl CheckUseEscapeRopeInAlphChamber
	cmp r0, #0
	beq _0206532C
	add r0, r5, #0
	add r1, r4, #0
	mov r2, #3
	bl sub_02064A8C
	pop {r4, r5, r6, pc}
_0206532C:
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02065368 ; =sub_020653B8
	lsl r0, r0, #2
	str r1, [r4, r0]
	mov r1, #0
	add r0, #0x2c
	str r1, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	ldr r0, [r6, #0xc]
	bl Sav2_Bag_get
	ldrh r1, [r5, #4]
	mov r2, #1
	mov r3, #0xb
	bl Bag_TakeItem
	pop {r4, r5, r6, pc}
	nop
_02065368: .word sub_020653B8
	thumb_func_end ItemMenuUseFunc_EscapeRope

	thumb_func_start ItemCheckUseFunc_EscapeRope
ItemCheckUseFunc_EscapeRope: ; 0x0206536C
	push {r4, lr}
	add r4, r0, #0
	ldrh r0, [r4, #8]
	lsl r1, r0, #0x1f
	lsr r1, r1, #0x1f
	cmp r1, #1
	bne _0206537E
	mov r0, #2
	pop {r4, pc}
_0206537E:
	lsl r0, r0, #0x1e
	lsr r0, r0, #0x1f
	cmp r0, #1
	bne _0206538A
	mov r0, #3
	pop {r4, pc}
_0206538A:
	ldr r0, [r4, #0x14]
	bl CheckUseEscapeRopeInAlphChamber
	cmp r0, #0
	beq _02065398
	mov r0, #0
	pop {r4, pc}
_02065398:
	ldr r0, [r4]
	bl MapHeader_IsCave
	cmp r0, #1
	bne _020653B0
	ldr r0, [r4]
	bl MapHeader_IsEscapeRopeAllowed
	cmp r0, #1
	bne _020653B0
	mov r0, #0
	pop {r4, pc}
_020653B0:
	mov r0, #0
	mvn r0, r0
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end ItemCheckUseFunc_EscapeRope

	thumb_func_start sub_020653B8
sub_020653B8: ; 0x020653B8
	push {r4, lr}
	add r4, r0, #0
	bl TaskManager_GetSys
	mov r1, #0xb
	bl ov02_0224BFD8
	add r2, r0, #0
	ldr r1, _020653D4 ; =ov02_0224C020
	add r0, r4, #0
	bl TaskManager_Jump
	mov r0, #0
	pop {r4, pc}
	.balign 4, 0
_020653D4: .word ov02_0224C020
	thumb_func_end sub_020653B8

	thumb_func_start ItemMenuUseFunc_ApricornBox
ItemMenuUseFunc_ApricornBox: ; 0x020653D8
	push {r3, r4, r5, lr}
	add r4, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetSys
	add r5, r0, #0
	ldr r0, [r4]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	mov r1, #1
	bl sub_0203ED24
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _02065404 ; =sub_0203D718
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02065404: .word sub_0203D718
	thumb_func_end ItemMenuUseFunc_ApricornBox

	thumb_func_start ItemFieldUseFunc_ApricornBox
ItemFieldUseFunc_ApricornBox: ; 0x02065408
	push {r3, lr}
	ldr r1, _02065418 ; =sub_0206541C
	mov r2, #0
	bl sub_020658B8
	mov r0, #1
	pop {r3, pc}
	nop
_02065418: .word sub_0206541C
	thumb_func_end ItemFieldUseFunc_ApricornBox

	thumb_func_start sub_0206541C
sub_0206541C: ; 0x0206541C
	ldr r3, _02065424 ; =sub_0203ED24
	mov r1, #1
	bx r3
	nop
_02065424: .word sub_0203ED24
	thumb_func_end sub_0206541C

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
	ldr r1, _020655B4 ; =sub_0206518C
	add r2, r4, #0
	bl FieldSys_CreateTask
	mov r0, #0
	pop {r4, r5, r6, pc}
	nop
_020655B4: .word sub_0206518C
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
	ldr r1, _020657E8 ; =sub_0206518C
	add r2, r4, #0
	bl FieldSys_CreateTask
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020657E8: .word sub_0206518C
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
	bl sub_0200FB5C
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
	bl sub_0200FB5C
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

_020FE264:
	; Menu use, Field use, Check use
	.word 0, ItemFieldUseFunc_Generic, 0 ; No use
	.word ItemMenuUseFunc_HealingItem, 0, 0 ; Healing item
	.word 0, 0, ItemCheckUseFunc_Dummy ; Town map
	.word 0, 0, ItemCheckUseFunc_Dummy ; Unused
	.word ItemMenuUseFunc_Bicycle, ItemFieldUseFunc_Bicycle, ItemCheckUseFunc_Bicycle ; Bicycle
	.word 0, 0, ItemCheckUseFunc_Dummy ; Journal
	.word ItemMenuUseFunc_TMHM, 0, 0 ; TM/HM
	.word ItemMenuUseFunc_Mail, 0, 0 ; Mail
	.word ItemMenuUseFunc_Berry, 0, ItemCheckUseFunc_Berry ; Berry
	.word 0, 0, ItemCheckUseFunc_Dummy ; Poffin case
	.word ItemMenuUseFunc_PalPad, ItemFieldUseFunc_PalPad, 0 ; Pal Pad
	.word 0, 0, ItemCheckUseFunc_Dummy ; Poke Radar
	.word 0, 0, ItemCheckUseFunc_Dummy ; Sprayduck
	.word 0, 0, ItemCheckUseFunc_Dummy ; Unused
	.word ItemMenuUseFunc_Honey, 0, 0 ; Honey
	.word 0, 0, ItemCheckUseFunc_Dummy ; VS Seeker
	.word ItemMenuUseFunc_OldRod, ItemFieldUseFunc_OldRod, ItemCheckUseFunc_FishingRod ; Old Rod
	.word ItemMenuUseFunc_GoodRod, ItemFieldUseFunc_GoodRod, ItemCheckUseFunc_FishingRod ; Good Rod
	.word ItemMenuUseFunc_SuperRod, ItemFieldUseFunc_SuperRod, ItemCheckUseFunc_FishingRod ; Super Rod
	.word 0, ItemFieldUseFunc_Generic, 0 ; Repels/Flutes/Seal case for some reason
	.word ItemMenuUseFunc_EvoStone, 0, 0 ; Evo stones
	.word ItemMenuUseFunc_EscapeRope, 0, ItemCheckUseFunc_EscapeRope ; Escape Rope
	.word 0, 0, ItemCheckUseFunc_Dummy ; Azure Flute
	.word ItemMenuUseFunc_ApricornBox, ItemFieldUseFunc_ApricornBox, 0 ; Apricorn Box
	.word ItemMenuUseFunc_BerryPots, ItemFieldUseFunc_BerryPots, 0 ; Berry Pots
	.word ItemMenuUseFunc_UnownReport, ItemFieldUseFunc_UnownReport, 0 ; Unown Report
	.word ItemMenuUseFunc_DowsingMchn, ItemFieldUseFunc_DowsingMchn, 0 ; Dowsing Mchn
	.word 0, ItemFieldUseFunc_GbSounds, 0 ; GB Sounds
	.word ItemMenuUseFunc_Gracidea, ItemFieldUseFunc_Gracidea, 0 ; Gracidea
	.word ItemMenuUseFunc_VSRecorder, ItemFieldUseFunc_VSRecorder, 0 ; VS Recorder
