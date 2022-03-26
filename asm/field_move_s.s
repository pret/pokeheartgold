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
	.include "global.inc"

	.text

	.public PartyMenuEnv_create
	.public PartyMenuEnv_delete

	thumb_func_start FieldMoveMenuCheck_Teleport
FieldMoveMenuCheck_Teleport: ; 0x02068554
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02068566
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068566:
	ldr r0, [r4]
	bl MapHeader_IsOutdoors
	cmp r0, #0
	bne _02068574
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068574:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	cmp r0, #1
	bne _02068588
	mov r0, #PARTY_MENU_RESPONSE_HAVE_FOLLOWER
	pop {r4, pc}
_02068588:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckRocketCostumeFlag
	cmp r0, #1
	bne _0206859C
	mov r0, #PARTY_MENU_RESPONSE_NOT_NOW
	pop {r4, pc}
_0206859C:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckSafariSysFlag
	cmp r0, #1
	beq _020685BC
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckPalParkSysFlag
	cmp r0, #1
	bne _020685C0
_020685BC:
	mov r0, #1
	b _020685C2
_020685C0:
	mov r0, #0
_020685C2:
	cmp r0, #1
	bne _020685CA
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_020685CA:
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Teleport

	thumb_func_start FieldMoveMenuUse_Teleport
FieldMoveMenuUse_Teleport: ; 0x020685D0
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C0
	ldrh r1, [r5, #4]
	ldr r2, [r6, #0xc]
	mov r0, #0xb
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_020689A4
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	str r0, [r6, #4]
	ldrh r1, [r5, #4]
	str r1, [r0]
	mov r0, #0xd5
	ldr r1, _0206861C ; =Task_UseTeleportInField
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r6, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	nop
_0206861C: .word Task_UseTeleportInField
	thumb_func_end FieldMoveMenuUse_Teleport

	thumb_func_start Task_UseTeleportInField
Task_UseTeleportInField: ; 0x02068620
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r2, [r4, #4]
	ldr r1, [r4]
	ldr r2, [r2]
	add r0, r6, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #4
	bl ov02_0224C500
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	ldr r1, _02068660 ; =ov02_0224C558
	add r0, r5, #0
	add r2, r6, #0
	bl TaskManager_Jump
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068660: .word ov02_0224C558
	thumb_func_end Task_UseTeleportInField

	thumb_func_start FieldMoveMenuCheck_Dig
FieldMoveMenuCheck_Dig: ; 0x02068664
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02068676
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068676:
	ldr r0, [r4]
	bl MapHeader_IsCave
	cmp r0, #1
	bne _0206868A
	ldr r0, [r4]
	bl MapHeader_IsEscapeRopeAllowed
	cmp r0, #1
	beq _0206868E
_0206868A:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_0206868E:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	cmp r0, #1
	bne _020686A2
	mov r0, #PARTY_MENU_RESPONSE_HAVE_FOLLOWER
	pop {r4, pc}
_020686A2:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckRocketCostumeFlag
	cmp r0, #1
	bne _020686B6
	mov r0, #PARTY_MENU_RESPONSE_NOT_NOW
	pop {r4, pc}
_020686B6:
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Dig

	thumb_func_start FieldMoveMenuUse_Dig
FieldMoveMenuUse_Dig: ; 0x020686BC
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r6, #0
	bl sub_020505C0
	ldrh r1, [r5, #4]
	ldr r2, [r6, #0xc]
	mov r0, #0xb
	lsl r1, r1, #0x18
	lsr r1, r1, #0x18
	bl sub_020689A4
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	str r0, [r6, #4]
	ldrh r1, [r5, #4]
	str r1, [r0]
	mov r0, #0xd5
	ldr r1, _02068708 ; =Task_UseDigInField
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r6, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	nop
_02068708: .word Task_UseDigInField
	thumb_func_end FieldMoveMenuUse_Dig

	thumb_func_start Task_UseDigInField
Task_UseDigInField: ; 0x0206870C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	add r0, r5, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	ldr r2, [r4, #4]
	ldr r1, [r4]
	ldr r2, [r2]
	add r0, r6, #0
	lsl r2, r2, #0x18
	lsr r2, r2, #0x18
	mov r3, #0xb
	bl ov02_0224C368
	add r6, r0, #0
	ldr r0, [r4, #4]
	bl FreeToHeap
	add r0, r4, #0
	bl FreeToHeap
	ldr r1, _0206874C ; =ov02_0224C3AC
	add r0, r5, #0
	add r2, r6, #0
	bl TaskManager_Jump
	mov r0, #0
	pop {r4, r5, r6, pc}
	.balign 4, 0
_0206874C: .word ov02_0224C3AC
	thumb_func_end Task_UseDigInField

	thumb_func_start FieldMoveMenuCheck_SweetScent
FieldMoveMenuCheck_SweetScent: ; 0x02068750
	push {r3, lr}
	ldr r1, [r0, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02068760
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r3, pc}
_02068760:
	ldr r0, [r1, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckPalParkSysFlag
	cmp r0, #1
	bne _02068772
	mov r0, #1
	b _02068774
_02068772:
	mov r0, #0
_02068774:
	cmp r0, #1
	bne _0206877C
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r3, pc}
_0206877C:
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r3, pc}
	thumb_func_end FieldMoveMenuCheck_SweetScent

	thumb_func_start FieldMoveMenuUse_SweetScent
FieldMoveMenuUse_SweetScent: ; 0x02068780
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r7, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	ldrh r1, [r5, #4]
	add r4, r0, #0
	ldr r2, [r7, #0xc]
	lsl r1, r1, #0x18
	mov r0, #0xb
	lsr r1, r1, #0x18
	bl sub_020689A4
	add r6, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeapAtEnd
	str r0, [r6, #4]
	ldrh r1, [r5, #4]
	str r1, [r0]
	add r0, r7, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020687CC ; =Task_UseSweetScentInField
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r6, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020687CC: .word Task_UseSweetScentInField
	thumb_func_end FieldMoveMenuUse_SweetScent

	thumb_func_start FieldMoveMenuCheck_Chatter
FieldMoveMenuCheck_Chatter: ; 0x020687D0
	ldr r0, [r0, #4]
	ldr r0, [r0, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _020687DE
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	bx lr
_020687DE:
	mov r0, #PARTY_MENU_RESPONSE_OK
	bx lr
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Chatter

	thumb_func_start FieldMoveMenuUse_Chatter
FieldMoveMenuUse_Chatter: ; 0x020687E4
	push {r3, r4, r5, r6, r7, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetSys
	add r7, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	add r0, r7, #0
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _0206881C ; =Task_UseChatterInField
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206881C: .word Task_UseChatterInField
	thumb_func_end FieldMoveMenuUse_Chatter

	thumb_func_start Task_UseChatterInField
Task_UseChatterInField: ; 0x02068820
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _02068858 ; =std_menu_chatter
	add r0, r5, #0
	mov r2, #0
	bl StartScriptFromMenu
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02068858: .word std_menu_chatter
	thumb_func_end Task_UseChatterInField

	thumb_func_start FieldMoveMenuCheck_Whirlpool
FieldMoveMenuCheck_Whirlpool: ; 0x0206885C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _0206886E
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_0206886E:
	ldr r0, [r1, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #2
	beq _0206887C
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_0206887C:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #6
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02068892
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_02068892:
	ldrh r1, [r4, #0xc]
	mov r0, #1
	lsl r0, r0, #0xc
	tst r0, r1
	beq _020688A0
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
_020688A0:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
	thumb_func_end FieldMoveMenuCheck_Whirlpool

	thumb_func_start FieldMoveMenuUse_Whirlpool
FieldMoveMenuUse_Whirlpool: ; 0x020688A4
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _020688D4 ; =Task_UseWhirlpoolInField
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020688D4: .word Task_UseWhirlpoolInField
	thumb_func_end FieldMoveMenuUse_Whirlpool

	thumb_func_start Task_UseWhirlpoolInField
Task_UseWhirlpoolInField: ; 0x020688D8
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _02068910 ; =std_menu_whirlpool
	add r0, r5, #0
	mov r2, #0
	bl StartScriptFromMenu
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_02068910: .word std_menu_whirlpool
	thumb_func_end Task_UseWhirlpoolInField

	thumb_func_start FieldMoveMenuCheck_Headbutt
FieldMoveMenuCheck_Headbutt: ; 0x02068914
	ldr r1, [r0, #4]
	ldr r1, [r1, #0x70]
	sub r1, r1, #2
	cmp r1, #1
	bhi _02068922
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	bx lr
_02068922:
	ldrh r1, [r0, #0xc]
	mov r0, #2
	lsl r0, r0, #0xc
	tst r0, r1
	beq _02068930
	mov r0, #PARTY_MENU_RESPONSE_OK
	bx lr
_02068930:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	bx lr
	thumb_func_end FieldMoveMenuCheck_Headbutt

	thumb_func_start FieldMoveMenuUse_Headbutt
FieldMoveMenuUse_Headbutt: ; 0x02068934
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	add r6, r1, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	add r1, r6, #0
	bl PartyMenuEnv_create
	add r5, r0, #0
	ldr r0, [r6, #4]
	bl sub_020505C0
	mov r0, #0xd5
	ldr r1, _02068964 ; =Task_UseHeadbuttInField
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068964: .word Task_UseHeadbuttInField
	thumb_func_end FieldMoveMenuUse_Headbutt

	thumb_func_start Task_UseHeadbuttInField
Task_UseHeadbuttInField: ; 0x02068968
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _020689A0 ; =std_menu_headbutt
	ldr r2, [r4, #4]
	add r0, r5, #0
	bl StartScriptFromMenu
	mov r2, #0
	str r2, [sp]
	ldrh r1, [r4, #0xc]
	add r0, r6, #0
	add r3, r2, #0
	bl FieldMoveArgsSet
	add r0, r4, #0
	bl PartyMenuEnv_delete
	mov r0, #0
	add sp, #4
	pop {r3, r4, r5, r6, pc}
	.balign 4, 0
_020689A0: .word std_menu_headbutt
	thumb_func_end Task_UseHeadbuttInField

	thumb_func_start sub_020689A4
sub_020689A4: ; 0x020689A4
	push {r4, r5, r6, lr}
	add r5, r1, #0
	add r6, r2, #0
	mov r1, #8
	bl AllocFromHeapAtEnd
	add r4, r0, #0
	add r0, r6, #0
	bl SavArray_PlayerParty_get
	add r1, r5, #0
	bl GetPartyMonByIndex
	str r0, [r4]
	mov r0, #0
	str r0, [r4, #4]
	add r0, r4, #0
	pop {r4, r5, r6, pc}
	thumb_func_end sub_020689A4
