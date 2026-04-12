#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R42.h"
#include "msgdata/msg/msg_0399_R42.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R42_000
	ScrDef scr_seq_R42_001
	ScrDef scr_seq_R42_002
	ScrDef scr_seq_R42_003
	ScrDef scr_seq_R42_004
	ScrDef scr_seq_R42_005
	ScrDefEnd

scr_seq_R42_000:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _017C
	WaitMovement
	GetPlayerCoords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	ClearFlag FLAG_HIDE_ROUTE_42_HIKER
	ShowPerson obj_R42_mount_2_2
	Compare VAR_SPECIAL_x8001, 172
	GoToIfNe _0051
	ApplyMovement obj_R42_mount_2_2, _0198
	GoTo _00AA

_0051:
	Compare VAR_SPECIAL_x8001, 173
	GoToIfNe _006C
	ApplyMovement obj_R42_mount_2_2, _01A4
	GoTo _00AA

_006C:
	Compare VAR_SPECIAL_x8001, 174
	GoToIfNe _0087
	ApplyMovement obj_R42_mount_2_2, _01B0
	GoTo _00AA

_0087:
	Compare VAR_SPECIAL_x8001, 175
	GoToIfNe _00A2
	ApplyMovement obj_R42_mount_2_2, _01BC
	GoTo _00AA

_00A2:
	ApplyMovement obj_R42_mount_2_2, _01C8
_00AA:
	WaitMovement
	PlaySE SEQ_SE_DP_WALL_HIT2
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_player, _0184
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0399_R42_00005
	CloseMsg
	ApplyMovement obj_R42_mount_2_2, _01D4
	WaitMovement
	GiveItemNoCheck ITEM_HM04, 1
	NPCMsg msg_0399_R42_00006
	CloseMsg
	Compare VAR_SPECIAL_x8001, 172
	GoToIfNe _010D
	ApplyMovement obj_R42_mount_2_2, _01DC
	GoTo _0166

_010D:
	Compare VAR_SPECIAL_x8001, 173
	GoToIfNe _0128
	ApplyMovement obj_R42_mount_2_2, _01F0
	GoTo _0166

_0128:
	Compare VAR_SPECIAL_x8001, 174
	GoToIfNe _0143
	ApplyMovement obj_R42_mount_2_2, _0204
	GoTo _0166

_0143:
	Compare VAR_SPECIAL_x8001, 175
	GoToIfNe _015E
	ApplyMovement obj_R42_mount_2_2, _0210
	GoTo _0166

_015E:
	ApplyMovement obj_R42_mount_2_2, _0224
_0166:
	WaitMovement
	SetFlag FLAG_HIDE_ROUTE_42_HIKER
	HidePerson obj_R42_mount_2_2
	SetVar VAR_UNK_4091, 1
	ReleaseAll
	End

	.balign 4, 0
_017C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0184:
	FaceEast
	LockDir
	JumpFarWest
	UnlockDir
	EndMovement

	.balign 4, 0
_0198:
	WalkFastSouth
	WalkFastWest
	EndMovement

	.balign 4, 0
_01A4:
	WalkFastSouth 2
	WalkFastWest
	EndMovement

	.balign 4, 0
_01B0:
	WalkFastSouth 3
	WalkFastWest
	EndMovement

	.balign 4, 0
_01BC:
	WalkFastSouth 4
	WalkFastWest
	EndMovement

	.balign 4, 0
_01C8:
	WalkFastSouth 5
	WalkFastWest
	EndMovement

	.balign 4, 0
_01D4:
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_01DC:
	WalkNormalSouth
	WalkNormalWest 5
	WalkNormalSouth 2
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_01F0:
	WalkNormalSouth
	WalkNormalWest 5
	WalkNormalSouth
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_0204:
	WalkNormalSouth
	WalkNormalWest 10
	EndMovement

	.balign 4, 0
_0210:
	WalkNormalSouth
	WalkNormalWest 4
	WalkNormalNorth
	WalkNormalWest 5
	EndMovement

	.balign 4, 0
_0224:
	WalkNormalNorth
	WalkNormalWest 10
	EndMovement

scr_seq_R42_001:
	ScrCmd_609
	LockAll
	PlayCry SPECIES_SUICUNE, 0
	Release obj_R42_tsure_poke_static_suicune
	ScrCmd_523 obj_R42_tsure_poke_static_suicune, 2, 90, 2, 0
	Lock obj_R42_tsure_poke_static_suicune
	WaitCry
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_R42_tsure_poke_static_suicune, _02EC
	ApplyMovement obj_player, _0308
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ClearFlag FLAG_HIDE_ROUTE_42_EUSINE
	ShowPerson obj_R42_minaki
	CallStd std_play_eusine_music
	ApplyMovement obj_R42_minaki, _0324
	WaitMovement
	NPCMsg msg_0399_R42_00007
	CloseMsg
	ApplyMovement obj_R42_minaki, _0334
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0399_R42_00008
	CloseMsg
	ApplyMovement obj_R42_minaki, _0348
	WaitMovement
	NPCMsg msg_0399_R42_00009
	CloseMsg
	ApplyMovement obj_R42_minaki, _0340
	WaitMovement
	CallStd std_fade_end_eusine_music
	HidePerson obj_R42_tsure_poke_static_suicune
	HidePerson obj_R42_minaki
	SetFlag FLAG_HIDE_ROUTE_42_SUICUNE
	SetFlag FLAG_HIDE_ROUTE_42_EUSINE
	SetVar VAR_UNK_4092, 0
	SetVar VAR_UNK_4070, 1
	SetVar VAR_UNK_4071, 1
	ClearFlag FLAG_HIDE_VERMILION_SUICUNE
	ReleaseAll
	End

	.balign 4, 0
_02EC:
	Delay4 3
	WalkFasterWest 2
	JumpFarWest
	WalkFasterWest 2
	JumpFarNorth 2
	MoveAction_112 1
	EndMovement

	.balign 4, 0
_0308:
	EmoteExclamationMark
	LockDir
	WalkFastNorth 4
	UnlockDir
	Delay16
	WalkNormalEast
	EndMovement

	.balign 4, 0
_0324:
	WalkNormalEast 4
	WalkNormalNorth 3
	WalkNormalEast 6
	EndMovement

	.balign 4, 0
_0334:
	WalkNormalNorth
	FaceWest
	EndMovement

	.balign 4, 0
_0340:
	WalkNormalEast 9
	EndMovement

	.balign 4, 0
_0348:
	WalkNormalEast
	EndMovement

scr_seq_R42_002:
	DirectionSignpost msg_0399_R42_00000, 1, 1, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R42_003:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0399_R42_00001, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R42_004:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0399_R42_00002, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R42_005:
	DirectionSignpost msg_0399_R42_00003, 1, 2, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
