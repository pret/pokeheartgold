#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0206.h"
#include "msgdata/msg/msg_0506_T07R0206.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0206_000
	ScrDefEnd

scr_seq_T07R0206_000:
	ScrCmd_609
	LockAll
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0058
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _002A
	End

_002A:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0340
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_partner_poke, _034C
	WaitMovement
	GoTo _0062

_0058:
	ApplyMovement obj_player, _0340
	WaitMovement
_0062:
	GetDynamicWarpFloorNo VAR_ELEVATOR_LAST_FLOOR
	Switch VAR_ELEVATOR_LAST_FLOOR
	Case 3, _0095
	Case 2, _00A0
	Case 0, _00AA
	End

_0095:
	BufferInt 0, 0
	GoTo _00B4

_00A0:
	BufferDeptStoreFloorNo 0, 3
	GoTo _00B4

_00AA:
	BufferDeptStoreFloorNo 0, 1
	GoTo _00B4

_00B4:
	ElevatorCurFloorBox 20, 1, VAR_ELEVATOR_LAST_FLOOR, VAR_ELEVATOR_LAST_FLOOR
	NPCMsg msg_0506_T07R0206_00000
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd 116, 255, 0
	MenuItemAdd 118, 255, 1
	MenuItemAdd 125, 255, 2
	MenuItemAdd 126, 255, 3
	MenuExec
	TouchscreenMenuShow
	Switch VAR_SPECIAL_RESULT
	Case 0, _0120
	Case 1, _019B
	Case 2, _0216
	GoTo _0322

_0120:
	Wait 1, VAR_SPECIAL_RESULT
	GetDynamicWarpFloorNo VAR_ELEVATOR_LAST_FLOOR
	SetDynamicWarp MAP_CELADON_CONDOMINIUMS_1F, 2, 5, 3, 1
	Compare VAR_ELEVATOR_LAST_FLOOR, 0
	GoToIfEq _0305
	Compare VAR_ELEVATOR_LAST_FLOOR, 0
	CallIfGt _029C
	Compare VAR_ELEVATOR_LAST_FLOOR, 0
	CallIfLt _0291
	Compare VAR_ELEVATOR_LAST_FLOOR, 2
	GoToIfNe _0176
	SetVar VAR_SPECIAL_x8005, 2
	GoTo _0189

_0176:
	Compare VAR_ELEVATOR_LAST_FLOOR, 3
	GoToIfNe _0189
	SetVar VAR_SPECIAL_x8005, 3
_0189:
	Call _02A7
	SetVar VAR_ELEVATOR_LAST_FLOOR, 0
	GoTo _02BB

_019B:
	Wait 1, VAR_SPECIAL_RESULT
	GetDynamicWarpFloorNo VAR_ELEVATOR_LAST_FLOOR
	SetDynamicWarp MAP_CELADON_CONDOMINIUMS_3F, 0, 5, 3, 1
	Compare VAR_ELEVATOR_LAST_FLOOR, 2
	GoToIfEq _0305
	Compare VAR_ELEVATOR_LAST_FLOOR, 2
	CallIfGt _029C
	Compare VAR_ELEVATOR_LAST_FLOOR, 2
	CallIfLt _0291
	Compare VAR_ELEVATOR_LAST_FLOOR, 0
	GoToIfNe _01F1
	SetVar VAR_SPECIAL_x8005, 2
	GoTo _0204

_01F1:
	Compare VAR_ELEVATOR_LAST_FLOOR, 3
	GoToIfNe _0204
	SetVar VAR_SPECIAL_x8005, 1
_0204:
	Call _02A7
	SetVar VAR_ELEVATOR_LAST_FLOOR, 2
	GoTo _02BB

_0216:
	Wait 1, VAR_SPECIAL_RESULT
	GetDynamicWarpFloorNo VAR_ELEVATOR_LAST_FLOOR
	SetDynamicWarp MAP_CELADON_CONDOMINIUMS_ROOF, 1, 5, 3, 1
	Compare VAR_ELEVATOR_LAST_FLOOR, 3
	GoToIfEq _0305
	Compare VAR_ELEVATOR_LAST_FLOOR, 3
	CallIfGt _029C
	Compare VAR_ELEVATOR_LAST_FLOOR, 3
	CallIfLt _0291
	Compare VAR_ELEVATOR_LAST_FLOOR, 0
	GoToIfNe _026C
	SetVar VAR_SPECIAL_x8005, 3
	GoTo _027F

_026C:
	Compare VAR_ELEVATOR_LAST_FLOOR, 2
	GoToIfNe _027F
	SetVar VAR_SPECIAL_x8005, 1
_027F:
	Call _02A7
	SetVar VAR_ELEVATOR_LAST_FLOOR, 3
	GoTo _02BB

_0291:
	NPCMsg msg_0506_T07R0206_00002
	SetVar VAR_SPECIAL_x8004, 0
	Return

_029C:
	NPCMsg msg_0506_T07R0206_00003
	SetVar VAR_SPECIAL_x8004, 1
	Return

_02A7:
	SetVar VAR_ELEVATOR_LAST_FLOOR, 65535
	CloseMsg
	WaitSE SEQ_SE_DP_SELECT
	ElevatorAnim VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Return

_02BB:
	Switch VAR_ELEVATOR_LAST_FLOOR
	Case 3, _02EA
	Case 2, _02F3
	Case 0, _02FC
	End

_02EA:
	NPCMsg msg_0506_T07R0206_00007
	GoTo _032E

_02F3:
	NPCMsg msg_0506_T07R0206_00006
	GoTo _032E

_02FC:
	NPCMsg msg_0506_T07R0206_00005
	GoTo _032E

_0305:
	SetVar VAR_ELEVATOR_LAST_FLOOR, 65535
	Wait 1, VAR_SPECIAL_RESULT
	NPCMsg msg_0506_T07R0206_00004
	WaitButton
	CloseMsg
	SetVar VAR_UNK_4125, 1
	ReleaseAll
	End

_0322:
	SetVar VAR_ELEVATOR_LAST_FLOOR, 65535
	Wait 1, VAR_SPECIAL_RESULT
_032E:
	NPCMsg msg_0506_T07R0206_00001
	WaitButton
	CloseMsg
	SetVar VAR_UNK_4125, 1
	ReleaseAll
	End

	.balign 4, 0
_0340:
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_034C:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement
	.balign 4, 0
