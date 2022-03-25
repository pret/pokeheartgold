#include "constants/sndseq.h"
#include "constants/species.h"
#include "constants/maps.h"
#include "constants/pokemon.h"
#include "constants/flags.h"
#include "constants/vars.h"
#include "constants/items.h"
#include "constants/std_script.h"
#include "fielddata/script/scr_seq/event_D24R0204.h"
#include "party_menu.h"
	.include "asm/macros.inc"
	.include "global.inc"

	.text

	; a0: 0 = use, 1 = check
	; a1: menu idx
	thumb_func_start PartyMenu_GetFieldMoveFunc
PartyMenu_GetFieldMoveFunc: ; 0x02067DF4
	cmp r0, #0
	bne _02067E00
	ldr r0, _02067E08 ; =_020FE7BC
	lsl r1, r1, #3
	ldr r0, [r0, r1]
	bx lr
_02067E00:
	ldr r0, _02067E0C ; =_020FE7BC + 4
	lsl r1, r1, #3
	ldr r0, [r0, r1]
	bx lr
	.balign 4, 0
_02067E08: .word _020FE7BC
_02067E0C: .word _020FE7BC + 4
	thumb_func_end PartyMenu_GetFieldMoveFunc

	thumb_func_start sub_02067E10
sub_02067E10: ; 0x02067E10
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r5, r0, #0
	add r4, r1, #0
	str r5, [r4, #4]
	ldr r1, [r5, #0x20]
	ldr r1, [r1]
	str r1, [r4]
	mov r1, #0
	strh r1, [r4, #0xc]
	add r1, sp, #8
	bl Fsys_GetFacingObject
	ldr r0, [sp, #8]
	str r0, [r4, #8]
	ldr r0, [sp, #8]
	cmp r0, #0
	beq _02067E62
	bl MapObject_GetGfxID
	cmp r0, #0x54
	beq _02067E46
	cmp r0, #0x55
	beq _02067E50
	cmp r0, #0x56
	beq _02067E5A
	b _02067E62
_02067E46:
	ldrh r1, [r4, #0xc]
	mov r0, #8
	orr r0, r1
	strh r0, [r4, #0xc]
	b _02067E62
_02067E50:
	ldrh r1, [r4, #0xc]
	mov r0, #0x10
	orr r0, r1
	strh r0, [r4, #0xc]
	b _02067E62
_02067E5A:
	ldrh r1, [r4, #0xc]
	mov r0, #1
	orr r0, r1
	strh r0, [r4, #0xc]
_02067E62:
	ldr r0, [r5, #0x40]
	bl GetPlayerXCoord
	str r0, [sp, #4]
	ldr r0, [r5, #0x40]
	bl GetPlayerYCoord
	add r2, r0, #0
	ldr r1, [sp, #4]
	str r2, [sp]
	add r0, r5, #0
	bl GetMetatileBehaviorAt
	add r7, r0, #0
	ldr r0, [r5, #0x40]
	add r1, sp, #4
	add r2, sp, #0
	bl sub_0205E02C
	ldr r1, [sp, #4]
	ldr r2, [sp]
	add r0, r5, #0
	bl GetMetatileBehaviorAt
	add r6, r0, #0
	ldr r0, [r5, #0x40]
	add r1, r7, #0
	add r2, r6, #0
	bl ov01_021F20C0
	cmp r0, #0
	beq _02067EAA
	ldrh r1, [r4, #0xc]
	mov r0, #4
	orr r0, r1
	strh r0, [r4, #0xc]
_02067EAA:
	ldr r0, [r5, #0x40]
	bl PlayerAvatar_GetFacingDirection
	add r1, r0, #0
	add r0, r6, #0
	bl ov01_021F25E8
	cmp r0, #0
	beq _02067EC4
	ldrh r1, [r4, #0xc]
	mov r0, #0x40
	orr r0, r1
	strh r0, [r4, #0xc]
_02067EC4:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8DC
	cmp r0, #0
	beq _02067ED8
	ldrh r1, [r4, #0xc]
	mov r0, #0x20
	orr r0, r1
	strh r0, [r4, #0xc]
_02067ED8:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205B8E8
	cmp r0, #0
	beq _02067EEE
	ldrh r1, [r4, #0xc]
	mov r0, #1
	lsl r0, r0, #0xc
	orr r0, r1
	strh r0, [r4, #0xc]
_02067EEE:
	ldr r0, [r5, #0xc]
	bl Save_FlyPoints_get
	bl FlyPoints_GetWeatherType
	cmp r0, #0xb
	bne _02067F04
	ldrh r1, [r4, #0xc]
	mov r0, #0x80
	orr r0, r1
	strh r0, [r4, #0xc]
_02067F04:
	lsl r0, r6, #0x18
	lsr r0, r0, #0x18
	bl sub_0205BAF8
	cmp r0, #0
	bne _02067F1A
	add r0, r5, #0
	bl ov01_021E7FA8
	cmp r0, #0
	beq _02067F24
_02067F1A:
	ldrh r1, [r4, #0xc]
	mov r0, #2
	lsl r0, r0, #0xc
	orr r0, r1
	strh r0, [r4, #0xc]
_02067F24:
	add sp, #0xc
	pop {r4, r5, r6, r7, pc}
	thumb_func_end sub_02067E10

	thumb_func_start PartyMenuEnv_create
PartyMenuEnv_create: ; 0x02067F28
	push {r3, r4, r5, lr}
	add r5, r0, #0
	add r4, r1, #0
	mov r0, #0x20
	mov r1, #0x10
	bl AllocFromHeap
	ldr r1, _02067F48 ; =0x19740205
	str r1, [r0]
	ldr r1, [r4, #8]
	str r1, [r0, #4]
	ldr r2, [r5]
	ldr r1, [r5, #4]
	str r2, [r0, #8]
	str r1, [r0, #0xc]
	pop {r3, r4, r5, pc}
	.balign 4, 0
_02067F48: .word 0x19740205
	thumb_func_end PartyMenuEnv_create

	thumb_func_start PartyMenuEnv_delete
PartyMenuEnv_delete: ; 0x02067F4C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4]
	ldr r0, _02067F64 ; =0x19740205
	cmp r1, r0
	beq _02067F5C
	bl GF_AssertFail
_02067F5C:
	add r0, r4, #0
	bl FreeToHeap
	pop {r4, pc}
	.balign 4, 0
_02067F64: .word 0x19740205
	thumb_func_end PartyMenuEnv_delete

	thumb_func_start FieldMoveMenuCheck_Cut
FieldMoveMenuCheck_Cut: ; 0x02067F68
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02067F7A
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02067F7A:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #1
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02067F8E
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_02067F8E:
	ldrh r1, [r4, #0xc]
	mov r0, #1
	tst r1, r0
	beq _02067F98
	mov r0, #PARTY_MENU_RESPONSE_OK
	; else: PARTY_MENU_RESPONSE_NOT_HERE
_02067F98:
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Cut

	thumb_func_start FieldMoveMenuUse_Cut
FieldMoveMenuUse_Cut: ; 0x02067F9C
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
	ldr r1, _02067FCC ; =sub_02067FD0
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02067FCC: .word sub_02067FD0
	thumb_func_end FieldMoveMenuUse_Cut

	thumb_func_start sub_02067FD0
sub_02067FD0: ; 0x02067FD0
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _02068008 ; =std_menu_cut
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
_02068008: .word std_menu_cut
	thumb_func_end sub_02067FD0

	thumb_func_start FieldMoveMenuCheck_Fly
FieldMoveMenuCheck_Fly: ; 0x0206800C
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _0206801E
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_0206801E:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #4
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02068032
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_02068032:
	ldr r0, [r4]
	bl MapHeader_IsFlyAllowed
	cmp r0, #0
	bne _02068040
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068040:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	cmp r0, #1
	bne _02068054
	mov r0, #PARTY_MENU_RESPONSE_HAVE_FOLLOWER
	pop {r4, pc}
_02068054:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckRocketCostumeFlag
	cmp r0, #1
	bne _02068068
	mov r0, #PARTY_MENU_RESPONSE_NOT_NOW
	pop {r4, pc}
_02068068:
	; static inline
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckSafariSysFlag
	cmp r0, #1
	beq _02068088
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckPalParkSysFlag
	cmp r0, #1
	bne _0206808C
_02068088:
	mov r0, #1
	b _0206808E
_0206808C:
	mov r0, #0
_0206808E:
	cmp r0, #1
	bne _02068096
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068096:
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Fly

	thumb_func_start FieldMoveMenuUse_Fly
FieldMoveMenuUse_Fly: ; 0x0206809C
	push {r4, r5, r6, lr}
	add r5, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r0, [r5]
	bl TaskManager_GetEnv
	add r4, r0, #0
	mov r0, #0xb
	mov r1, #4
	bl AllocFromHeap
	ldrh r1, [r5, #4]
	str r1, [r0]
	mov r1, #0xe1
	lsl r1, r1, #2
	str r0, [r4, r1]
	add r0, r6, #0
	mov r1, #0
	bl TownMap_new
	mov r1, #0xe
	lsl r1, r1, #6
	str r0, [r4, r1]
	ldr r1, _020680DC ; =sub_0203D758
	add r0, r4, #0
	bl sub_0203C8F0
	pop {r4, r5, r6, pc}
	nop
_020680DC: .word sub_0203D758
	thumb_func_end FieldMoveMenuUse_Fly

	thumb_func_start FieldMoveMenuCheck_Surf
FieldMoveMenuCheck_Surf: ; 0x020680E0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _020680F2
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_020680F2:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #3
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02068106
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_02068106:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #2
	bne _02068116
	mov r0, #PARTY_MENU_RESPONSE_ALREADY_SURFING
	pop {r4, pc}
_02068116:
	ldrh r1, [r4, #0xc]
	mov r0, #4
	tst r0, r1
	bne _02068122
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068122:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	cmp r0, #1
	bne _02068136
	mov r0, #PARTY_MENU_RESPONSE_HAVE_FOLLOWER
	pop {r4, pc}
_02068136:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckRocketCostumeFlag
	cmp r0, #1
	bne _0206814A
	mov r0, #PARTY_MENU_RESPONSE_NOT_NOW
	pop {r4, pc}
_0206814A:
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Surf

	thumb_func_start FieldMoveMenuUse_Surf
FieldMoveMenuUse_Surf: ; 0x02068150
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
	ldr r1, _02068180 ; =sub_02068184
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068180: .word sub_02068184
	thumb_func_end FieldMoveMenuUse_Surf

	thumb_func_start sub_02068184
sub_02068184: ; 0x02068184
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _020681BC ; =std_menu_surf
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
_020681BC: .word std_menu_surf
	thumb_func_end sub_02068184

	thumb_func_start FieldMoveMenuCheck_Strength
FieldMoveMenuCheck_Strength: ; 0x020681C0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _020681D2
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_020681D2:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #2
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _020681E6
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_020681E6:
	ldr r0, [r4]
	cmp r0, #0xee
	bne _020681F0
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_020681F0:
	ldrh r1, [r4, #0xc]
	mov r0, #8
	tst r0, r1
	beq _020681FC
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
_020681FC:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
	thumb_func_end FieldMoveMenuCheck_Strength

	thumb_func_start FieldMoveMenuUse_Strength
FieldMoveMenuUse_Strength: ; 0x02068200
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
	ldr r1, _02068230 ; =sub_02068234
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068230: .word sub_02068234
	thumb_func_end FieldMoveMenuUse_Strength

	thumb_func_start sub_02068234
sub_02068234: ; 0x02068234
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _0206826C ; =std_menu_strength
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
_0206826C: .word std_menu_strength
	thumb_func_end sub_02068234

	thumb_func_start FieldMoveMenuCheck_RockSmash
FieldMoveMenuCheck_RockSmash: ; 0x02068270
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _02068282
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068282:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _02068296
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_02068296:
	ldrh r1, [r4, #0xc]
	mov r0, #0x10
	tst r0, r1
	beq _020682A2
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
_020682A2:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_RockSmash

	thumb_func_start FieldMoveMenuUse_RockSmash
FieldMoveMenuUse_RockSmash: ; 0x020682A8
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
	ldr r1, _020682D8 ; =sub_020682DC
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020682D8: .word sub_020682DC
	thumb_func_end FieldMoveMenuUse_RockSmash

	thumb_func_start sub_020682DC
sub_020682DC: ; 0x020682DC
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _02068314 ; =std_menu_rock_smash
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
_02068314: .word std_menu_rock_smash
	thumb_func_end sub_020682DC

	thumb_func_start FieldMoveMenuCheck_Waterfall
FieldMoveMenuCheck_Waterfall: ; 0x02068318
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _0206832A
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_0206832A:
	ldr r0, [r1, #0x40]
	bl PlayerAvatar_GetState
	cmp r0, #2
	beq _02068338
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068338:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #7
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _0206834E
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_0206834E:
	ldrh r1, [r4, #0xc]
	mov r0, #0x20
	tst r0, r1
	beq _0206835A
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
_0206835A:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Waterfall

	thumb_func_start FieldMoveMenuUse_Waterfall
FieldMoveMenuUse_Waterfall: ; 0x02068360
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
	ldr r1, _02068390 ; =sub_02068394
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068390: .word sub_02068394
	thumb_func_end FieldMoveMenuUse_Waterfall

	thumb_func_start sub_02068394
sub_02068394: ; 0x02068394
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _020683CC ; =std_menu_waterfall
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
_020683CC: .word std_menu_waterfall
	thumb_func_end sub_02068394

	thumb_func_start FieldMoveMenuCheck_RockClimb
FieldMoveMenuCheck_RockClimb: ; 0x020683D0
	push {r4, lr}
	add r4, r0, #0
	ldr r1, [r4, #4]
	ldr r0, [r1, #0x70]
	sub r0, r0, #2
	cmp r0, #1
	bhi _020683E2
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_020683E2:
	ldr r0, [r1, #0xc]
	bl Sav2_PlayerData_GetProfileAddr
	mov r1, #0xf
	bl PlayerProfile_TestBadgeFlag
	cmp r0, #0
	bne _020683F6
	mov r0, #PARTY_MENU_RESPONSE_NEED_BADGE
	pop {r4, pc}
_020683F6:
	ldrh r1, [r4, #0xc]
	mov r0, #0x40
	tst r0, r1
	bne _02068402
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_02068402:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckHaveFollower
	cmp r0, #1
	bne _02068416
	mov r0, #PARTY_MENU_RESPONSE_HAVE_FOLLOWER
	pop {r4, pc}
_02068416:
	ldr r0, [r4, #4]
	ldr r0, [r0, #0xc]
	bl SavArray_Flags_get
	bl ScriptState_CheckRocketCostumeFlag
	cmp r0, #1
	bne _0206842A
	mov r0, #PARTY_MENU_RESPONSE_NOT_NOW
	pop {r4, pc}
_0206842A:
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_RockClimb

	thumb_func_start FieldMoveMenuUse_RockClimb
FieldMoveMenuUse_RockClimb: ; 0x02068430
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
	ldr r1, _02068460 ; =sub_02068464
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068460: .word sub_02068464
	thumb_func_end FieldMoveMenuUse_RockClimb

	thumb_func_start sub_02068464
sub_02068464: ; 0x02068464
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	ldr r1, _0206849C ; =std_menu_rock_climb
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
_0206849C: .word std_menu_rock_climb
	thumb_func_end sub_02068464

	thumb_func_start FieldMoveMenuCheck_Flash
FieldMoveMenuCheck_Flash: ; 0x020684A0
	push {r4, lr}
	add r4, r0, #0
	ldr r0, [r4, #4]
	ldr r1, [r0, #0x70]
	sub r1, r1, #2
	cmp r1, #1
	bhi _020684B2
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
_020684B2:
	bl CheckUseFlashInAlphChamber
	cmp r0, #0
	beq _020684BE
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
_020684BE:
	ldrh r1, [r4, #0xc]
	mov r0, #0x80
	tst r0, r1
	beq _020684CA
	mov r0, #PARTY_MENU_RESPONSE_OK
	pop {r4, pc}
_020684CA:
	mov r0, #PARTY_MENU_RESPONSE_NOT_HERE
	pop {r4, pc}
	.balign 4, 0
	thumb_func_end FieldMoveMenuCheck_Flash

	thumb_func_start FieldMoveMenuUse_Flash
FieldMoveMenuUse_Flash: ; 0x020684D0
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
	ldr r1, _02068500 ; =sub_02068504
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068500: .word sub_02068504
	thumb_func_end FieldMoveMenuUse_Flash

	thumb_func_start sub_02068504
sub_02068504: ; 0x02068504
	push {r3, r4, r5, r6, lr}
	sub sp, #4
	add r5, r0, #0
	bl TaskManager_GetEnv
	add r4, r0, #0
	add r0, r5, #0
	bl TaskManager_GetSys
	add r6, r0, #0
	bl CheckUseFlashInAlphChamber
	cmp r0, #0
	beq _0206852C
	add r0, r5, #0
	mov r1, #_EV_scr_seq_D24R0204_003
	mov r2, #0
	bl StartScriptFromMenu
	b _02068536
_0206852C:
	ldr r1, _02068550 ; =std_menu_flash
	add r0, r5, #0
	mov r2, #0
	bl StartScriptFromMenu
_02068536:
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
_02068550: .word std_menu_flash
	thumb_func_end sub_02068504

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
	ldr r1, _0206861C ; =sub_02068620
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r6, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	nop
_0206861C: .word sub_02068620
	thumb_func_end FieldMoveMenuUse_Teleport

	thumb_func_start sub_02068620
sub_02068620: ; 0x02068620
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
	thumb_func_end sub_02068620

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
	ldr r1, _02068708 ; =sub_0206870C
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r6, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	nop
_02068708: .word sub_0206870C
	thumb_func_end FieldMoveMenuUse_Dig

	thumb_func_start sub_0206870C
sub_0206870C: ; 0x0206870C
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
	thumb_func_end sub_0206870C

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
	ldr r1, _020687CC ; =ov01_021FCE98
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r6, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, r6, r7, pc}
	nop
_020687CC: .word ov01_021FCE98
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
	ldr r1, _0206881C ; =sub_02068820
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r3, r4, r5, r6, r7, pc}
	.balign 4, 0
_0206881C: .word sub_02068820
	thumb_func_end FieldMoveMenuUse_Chatter

	thumb_func_start sub_02068820
sub_02068820: ; 0x02068820
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
	thumb_func_end sub_02068820

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
	ldr r1, _020688D4 ; =sub_020688D8
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_020688D4: .word sub_020688D8
	thumb_func_end FieldMoveMenuUse_Whirlpool

	thumb_func_start sub_020688D8
sub_020688D8: ; 0x020688D8
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
	thumb_func_end sub_020688D8

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
	ldr r1, _02068964 ; =sub_02068968
	lsl r0, r0, #2
	str r1, [r4, r0]
	add r0, #0x2c
	str r5, [r4, r0]
	mov r0, #0xc
	strh r0, [r4, #0x26]
	pop {r4, r5, r6, pc}
	.balign 4, 0
_02068964: .word sub_02068968
	thumb_func_end FieldMoveMenuUse_Headbutt

	thumb_func_start sub_02068968
sub_02068968: ; 0x02068968
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
	thumb_func_end sub_02068968

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

	.rodata

_020FE7BC:
	.word FieldMoveMenuUse_Cut, FieldMoveMenuCheck_Cut
	.word FieldMoveMenuUse_Fly, FieldMoveMenuCheck_Fly
	.word FieldMoveMenuUse_Surf, FieldMoveMenuCheck_Surf
	.word FieldMoveMenuUse_Strength, FieldMoveMenuCheck_Strength
	.word FieldMoveMenuUse_RockSmash, FieldMoveMenuCheck_RockSmash
	.word FieldMoveMenuUse_Waterfall, FieldMoveMenuCheck_Waterfall
	.word FieldMoveMenuUse_RockClimb, FieldMoveMenuCheck_RockClimb
	.word FieldMoveMenuUse_Flash, FieldMoveMenuCheck_Flash
	.word FieldMoveMenuUse_Teleport, FieldMoveMenuCheck_Teleport
	.word FieldMoveMenuUse_Dig, FieldMoveMenuCheck_Dig
	.word FieldMoveMenuUse_SweetScent, FieldMoveMenuCheck_SweetScent
	.word FieldMoveMenuUse_Chatter, FieldMoveMenuCheck_Chatter
	.word FieldMoveMenuUse_Whirlpool, FieldMoveMenuCheck_Whirlpool
	.word FieldMoveMenuUse_Headbutt, FieldMoveMenuCheck_Headbutt
