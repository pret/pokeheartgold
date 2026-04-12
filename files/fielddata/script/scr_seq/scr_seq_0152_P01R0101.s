#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_P01R0101.h"
#include "msgdata/msg/msg_0255_P01R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_P01R0101_000
	ScrDef scr_seq_P01R0101_001
	ScrDef scr_seq_P01R0101_002
	ScrDef scr_seq_P01R0101_003
	ScrDef scr_seq_P01R0101_004
	ScrDefEnd

scr_seq_P01R0101_001:
	ScrCmd_445 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 330
	GoToIfEq _0029
	End

_0029:
	SetObjectFacing obj_P01R0101_seaman_2, DIR_SOUTH
	End

scr_seq_P01R0101_002:
	ScrCmd_609
	LockAll
	ApplyMovement obj_P01R0101_ookido, _00E4
	WaitMovement
	StopBGM 0
	PlayBGM SEQ_GS_OHKIDO
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_P01R0101_ookido, _00EC
	ApplyMovement obj_player, _0100
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	GenderMsgBox msg_0255_P01R0101_00009, msg_0255_P01R0101_00010
	CloseMsg
	ApplyMovement obj_P01R0101_ookido, _0110
	WaitMovement
	NatDexFlagAction 1, VAR_SPECIAL_RESULT
	BufferPlayersName 0
	PlayFanfare SEQ_ME_ITEM
	NPCMsg msg_0255_P01R0101_00011
	WaitFanfare
	EnableMassOutbreaks
	NPCMsg msg_0255_P01R0101_00012
	CloseMsg
	ApplyMovement obj_P01R0101_ookido, _0120
	WaitMovement
	NPCMsg msg_0255_P01R0101_00013
	CloseMsg
	ApplyMovement obj_P01R0101_ookido, _0128
	WaitMovement
	HidePerson obj_P01R0101_ookido
	SetFlag FLAG_HIDE_OLIVINE_PORT_OAK
	SetVar VAR_UNK_411A, 0
	FadeOutBGM 0, 30
	StopBGM 0
	ResetBGM
	ReleaseAll
	Compare VAR_UNK_40D3, 1
	CallIfEq _00DE
	EnableMassOutbreaks
	End

_00DE:
	ClearFlag FLAG_HIDE_POKEATHLON_SUPREME_CUP_RECEPTIONIST
	Return

	.balign 4, 0
_00E4:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_00EC:
	Delay8
	WalkNormalWest 3
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0100:
	Delay8 3
	WalkNormalSouth 3
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0110:
	WalkOnSpotNormalWest
	Delay8 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0120:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0128:
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth
	EndMovement

scr_seq_P01R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfUnset FLAG_GAME_CLEAR, _0361
	Compare VAR_TEMP_x4002, 1
	GoToIfGe _0356
	GetPlayerFacing VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfEq _0320
	Compare VAR_UNK_40CB, 7
	GoToIfGe _01FB
	NPCMsg msg_0255_P01R0101_00001
	CloseMsg
	HasItem ITEM_S_S__TICKET, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _02F9
	ApplyMovement obj_player, _036C
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0255_P01R0101_00004
	CloseMsg
	ApplyMovement obj_P01R0101_seaman_2, _03F4
	WaitMovement
	NPCMsg msg_0255_P01R0101_00005
	CloseMsg
	ApplyMovement obj_P01R0101_seaman_2, _038C
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _03AC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetVar VAR_TEMP_x4002, 1
	SetVar VAR_BOAT_DIRECTION, 1
	SetVar VAR_UNK_40DC, 0
	ClearFlag FLAG_BOAT_ARRIVED
	SetFlag FLAG_UNK_22C
	SetFlag FLAG_UNK_22B
	ReleaseAll
	End

_01FB:
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0218
	GoTo _02EE

_0212:
	GoTo _029B

_0218:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0231
	GoTo _029B

_022B:
	GoTo _029B

_0231:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _024A
	GoTo _02EE

_0244:
	GoTo _029B

_024A:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0263
	GoTo _02EE

_025D:
	GoTo _029B

_0263:
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfNe _027C
	GoTo _02EE

_0276:
	GoTo _029B

_027C:
	Compare VAR_SPECIAL_RESULT, 5
	GoToIfNe _0295
	GoTo _029B

_028F:
	GoTo _029B

_0295:
	GoTo _02EE

_029B:
	NPCMsg msg_0255_P01R0101_00007
	CloseMsg
	ApplyMovement obj_P01R0101_seaman_2, _038C
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _03AC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetVar VAR_TEMP_x4002, 1
	SetVar VAR_BOAT_DIRECTION, 1
	SetVar VAR_UNK_40DC, 0
	ClearFlag FLAG_BOAT_ARRIVED
	SetFlag FLAG_UNK_22A
	ClearFlag FLAG_UNK_22B
	SetFlag FLAG_UNK_22C
	ReleaseAll
	End

_02EE:
	NPCMsg msg_0255_P01R0101_00008
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02F9:
	ApplyMovement obj_player, _0378
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0255_P01R0101_00002
	CloseMsg
	ApplyMovement obj_P01R0101_seaman_2, _03F4
	WaitMovement
	NPCMsg msg_0255_P01R0101_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0320:
	ApplyMovement obj_P01R0101_seaman_2, _03B4
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _03D4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_P01R0101_seaman_2, _03E0
	WaitMovement
	ReleaseAll
	End

_0356:
	NPCMsg msg_0255_P01R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0361:
	NPCMsg msg_0255_P01R0101_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_036C:
	WalkOnSpotNormalEast
	FaceSouth 2
	EndMovement

	.balign 4, 0
_0378:
	JumpOnSpotFastWest
	JumpOnSpotFastEast
	FaceSouth 2
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_038C:
	LockDir
	WalkNormalSouth
	UnlockDir
	FaceWest 2
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_03AC:
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_03B4:
	LockDir
	WalkNormalNorth
	UnlockDir
	FaceWest 2
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_03D4:
	Delay8
	WalkNormalNorth 4
	EndMovement

	.balign 4, 0
_03E0:
	WalkNormalWest
	FaceSouth 2
	WalkNormalSouth
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_03F4:
	WalkOnSpotNormalNorth
	EndMovement

scr_seq_P01R0101_003:
	SimpleNPCMsg msg_0255_P01R0101_00014
	End

scr_seq_P01R0101_004:
	SimpleNPCMsg msg_0255_P01R0101_00015
	End
	.balign 4, 0
