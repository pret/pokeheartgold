#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0101.h"
#include "msgdata/msg/msg_0111_D35R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D35R0101_000
	ScrDef scr_seq_D35R0101_001
	ScrDef scr_seq_D35R0101_002
	ScrDef scr_seq_D35R0101_003
	ScrDef scr_seq_D35R0101_004
	ScrDef scr_seq_D35R0101_005
	ScrDef scr_seq_D35R0101_006
	ScrDef scr_seq_D35R0101_007
	ScrDef scr_seq_D35R0101_008
	ScrDef scr_seq_D35R0101_009
	ScrDefEnd

scr_seq_D35R0101_001:
	MakeObjectVisible obj_D35R0101_stop
	MakeObjectVisible obj_D35R0101_stop_2
	MakeObjectVisible obj_D35R0101_stop_3
	Compare VAR_UNK_40AC, 9
	GoToIfGe _00B7
	Compare VAR_UNK_40A8, 2
	GoToIfGe _006D
	Compare VAR_UNK_40A8, 1
	GoToIfEq _005F
	End

_005F:
	MovePersonFacing obj_D35R0101_gsfighter, 8, 0, 7, DIR_WEST
	End

_006D:
	MovePersonFacing obj_D35R0101_gsfighter, 10, 0, 7, DIR_WEST
	MovePersonFacing obj_D35R0101_sunglasses, 4, 0, 3, DIR_SOUTH
	MovePersonFacing obj_D35R0101_babyboy1_10, 9, 0, 3, DIR_SOUTH
	MovePersonFacing obj_D35R0101_stop, 8, 0, 3, DIR_SOUTH
	MovePersonFacing obj_D35R0101_stop_2, 9, 0, 4, DIR_SOUTH
	MovePersonFacing obj_D35R0101_stop_3, 8, 0, 4, DIR_SOUTH
	End

_00B7:
	MovePersonFacing obj_D35R0101_babyboy1_10, 9, 0, 3, DIR_SOUTH
	MovePersonFacing obj_D35R0101_stop, 8, 0, 3, DIR_SOUTH
	MovePersonFacing obj_D35R0101_stop_2, 9, 0, 4, DIR_SOUTH
	MovePersonFacing obj_D35R0101_stop_3, 8, 0, 4, DIR_SOUTH
	End

scr_seq_D35R0101_008:
	Compare VAR_UNK_40AC, 3
	GoToIfEq _010F
	Compare VAR_UNK_40AC, 8
	GoToIfEq _0105
	End

_0105:
	SetFlag FLAG_UNK_1E5
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_ARIANA
	End

_010F:
	ClearFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_GIOVANNI
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_PETREL
	End

scr_seq_D35R0101_006:
	StopBGM 0
	PlayBGM SEQ_GS_D_AJITO
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0214
	WaitMovement
	NPCMsg msg_0111_D35R0101_00004
	CloseMsg
	PlaySE SEQ_SE_GS_ZUTUKI
	ApplyMovement obj_D35R0101_tsure_poke_static_dragonite, _02AC
	WaitSE SEQ_SE_GS_PRESSHIT
	ApplyMovement obj_D35R0101_gsfighter, _021C
	WaitMovement
	ApplyMovement obj_D35R0101_wataru, _022C
	ApplyMovement obj_D35R0101_tsure_poke_static_dragonite, _02C0
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0111_D35R0101_00005, msg_0111_D35R0101_00006
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D35R0101_wataru, _0240
	ApplyMovement obj_player, _025C
	ApplyMovement obj_D35R0101_tsure_poke_static_dragonite, _02CC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_D35R0101_sunglasses, _0268
	WaitMovement
	ApplyMovement obj_D35R0101_wataru, _0280
	WaitMovement
	NPCMsg msg_0111_D35R0101_00007
	CloseMsg
	ApplyMovement obj_D35R0101_sunglasses, _0290
	WaitMovement
	PlaySE SEQ_SE_DP_UG_023
	ApplyMovement obj_D35R0101_babyboy1_10, _029C
	ApplyMovement obj_D35R0101_stop, _029C
	ApplyMovement obj_D35R0101_stop_2, _029C
	ApplyMovement obj_D35R0101_stop_3, _029C
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0111_D35R0101_00008, msg_0111_D35R0101_00009
	CloseMsg
	ApplyMovement obj_D35R0101_wataru, _02A4
	WaitMovement
	HidePerson obj_D35R0101_wataru
	ApplyMovement obj_D35R0101_tsure_poke_static_dragonite, _02DC
	WaitMovement
	HidePerson obj_D35R0101_tsure_poke_static_dragonite
	SetFlag FLAG_HIDE_MAHOGANY_SHOP_LANCE
	SetVar VAR_UNK_40A8, 2
	ReleaseAll
	End

	.balign 4, 0
_0214:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_021C:
	LockDir
	WalkFasterEast 2
	UnlockDir
	EndMovement

	.balign 4, 0
_022C:
	Delay8 3
	FaceSouth 2
	WalkNormalSouth
	Delay8 5
	EndMovement

	.balign 4, 0
_0240:
	FaceNorth 2
	WalkNormalNorth 4
	FaceEast 2
	WalkNormalEast
	FaceNorth 2
	Delay8 5
	EndMovement

	.balign 4, 0
_025C:
	Delay8
	WalkNormalNorth 4
	EndMovement

	.balign 4, 0
_0268:
	EmoteExclamationMark
	Delay8
	LockDir
	WalkFasterWest 2
	UnlockDir
	EndMovement

	.balign 4, 0
_0280:
	WalkNormalNorth
	FaceEast 2
	Delay8 2
	EndMovement

	.balign 4, 0
_0290:
	FaceEast 2
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_029C:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_02A4:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_02AC:
	WalkFasterEast 2
	LockDir
	WalkFasterWest 2
	UnlockDir
	EndMovement

	.balign 4, 0
_02C0:
	Delay8 3
	FaceSouth 2
	EndMovement

	.balign 4, 0
_02CC:
	Delay8 3
	FaceNorth 2
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_02DC:
	Delay8 3
	WalkNormalNorth 2
	FaceEast 2
	WalkNormalEast
	EndMovement

scr_seq_D35R0101_000:
	End

scr_seq_D35R0101_007:
	End

scr_seq_D35R0101_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40A8, 2
	GoToIfGe _031C
	NPCMsg msg_0111_D35R0101_00000
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 28
	CallStd std_special_mart
	ReleaseAll
	End

_031C:
	NPCMsg msg_0111_D35R0101_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D35R0101_003:
	Compare VAR_UNK_40A8, 2
	GoToIfGe _0347
	SimpleNPCMsg msg_0111_D35R0101_00002
	End

_0347:
	SimpleNPCMsg msg_0111_D35R0101_00003
	End

scr_seq_D35R0101_005:
	End

scr_seq_D35R0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetFlag FLAG_SPECIAL_MART_MAHOGANY_GOOD
	NPCMsg msg_0111_D35R0101_00010
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 29
	CallStd std_special_mart
	ClearFlag FLAG_SPECIAL_MART_MAHOGANY_GOOD
	ReleaseAll
	End

scr_seq_D35R0101_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40AC, 10
	GoToIfGe _039D
	NPCMsg msg_0111_D35R0101_00015
	GoTo _0552

_039D:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 2
	GoToIfNe _03B3
	NPCMsg msg_0111_D35R0101_00014
	GoTo _03E5

_03B3:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _03C9
	NPCMsg msg_0111_D35R0101_00014
	GoTo _03E5

_03C9:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _03DF
	NPCMsg msg_0111_D35R0101_00014
	GoTo _03E5

_03DF:
	GoTo _03EB

_03E5:
	GoTo _0552

_03EB:
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0405
	NPCMsg msg_0111_D35R0101_00011
	GoTo _0552

_0405:
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _041B
	NPCMsg msg_0111_D35R0101_00012
	GoTo _0552

_041B:
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _0431
	NPCMsg msg_0111_D35R0101_00011
	GoTo _0552

_0431:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0447
	NPCMsg msg_0111_D35R0101_00012
	GoTo _0552

_0447:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _045D
	NPCMsg msg_0111_D35R0101_00011
	GoTo _0552

_045D:
	Compare VAR_TEMP_x4000, 7
	GoToIfNe _0473
	NPCMsg msg_0111_D35R0101_00012
	GoTo _0552

_0473:
	Compare VAR_TEMP_x4000, 9
	GoToIfNe _0489
	NPCMsg msg_0111_D35R0101_00011
	GoTo _0552

_0489:
	Compare VAR_TEMP_x4000, 10
	GoToIfNe _049F
	NPCMsg msg_0111_D35R0101_00012
	GoTo _0552

_049F:
	Compare VAR_TEMP_x4000, 12
	GoToIfNe _04B5
	NPCMsg msg_0111_D35R0101_00011
	GoTo _0552

_04B5:
	Compare VAR_TEMP_x4000, 13
	GoToIfNe _04CB
	NPCMsg msg_0111_D35R0101_00012
	GoTo _0552

_04CB:
	Compare VAR_TEMP_x4000, 15
	GoToIfNe _04E1
	NPCMsg msg_0111_D35R0101_00011
	GoTo _0552

_04E1:
	Compare VAR_TEMP_x4000, 16
	GoToIfNe _04F7
	NPCMsg msg_0111_D35R0101_00012
	GoTo _0552

_04F7:
	Compare VAR_TEMP_x4000, 18
	GoToIfNe _050D
	NPCMsg msg_0111_D35R0101_00011
	GoTo _0552

_050D:
	Compare VAR_TEMP_x4000, 19
	GoToIfNe _0523
	NPCMsg msg_0111_D35R0101_00012
	GoTo _0552

_0523:
	Compare VAR_TEMP_x4000, 21
	GoToIfNe _0539
	NPCMsg msg_0111_D35R0101_00011
	GoTo _0552

_0539:
	Compare VAR_TEMP_x4000, 22
	GoToIfNe _054F
	NPCMsg msg_0111_D35R0101_00012
	GoTo _0552

_054F:
	NPCMsg msg_0111_D35R0101_00013
_0552:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
