#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T23R0501.h"
#include "msgdata/msg/msg_0571_T23R0501.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T23R0501_000
	ScrDef scr_seq_T23R0501_001
	ScrDef scr_seq_T23R0501_002
	ScrDef scr_seq_T23R0501_003
	ScrDef scr_seq_T23R0501_004
	ScrDef scr_seq_T23R0501_005
	ScrDef scr_seq_T23R0501_006
	ScrDefEnd

scr_seq_T23R0501_000:
	GoToIfSet FLAG_BEAT_AZALEA_ROCKETS, _002F
	SetFlag FLAG_HIDE_AZALEA_SLOWPOKES
	End

_002F:
	ClearFlag FLAG_HIDE_AZALEA_SLOWPOKES
	End

scr_seq_T23R0501_005:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_4080, 3
	ApplyMovement obj_T23R0501_gantetsu, _02B0
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0571_T23R0501_00001
	SetVar VAR_SPECIAL_x8004, 492
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_obtain_item_verbose
	SetFlag FLAG_UNK_07C
	ReleaseAll
	GoTo _011A
	End

scr_seq_T23R0501_001:
	GoToIfSet FLAG_UNK_07C, _011A
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	BufferPlayersName 0
	NPCMsg msg_0571_T23R0501_00000
	WaitABPress
	CloseMsg
	GetPlayerFacing VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00A7
	GoTo _00C7

_00A1:
	GoTo _00AF

_00A7:
	ApplyMovement obj_T23R0501_gantetsu, _02E0
_00AF:
	WaitMovement
_00B1:
	ReleaseAll
	HidePerson obj_T23R0501_gantetsu
	WaitFanfare
	SetFlag FLAG_UNK_077
	SetFlag FLAG_UNK_19E
	SetFlag FLAG_UNK_19F
	End

_00C7:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	GetPersonCoords 253, VAR_TEMP_x4002, VAR_TEMP_x4003
	Compare VAR_TEMP_x4002, 5
	GoToIfNe _00F4
	ApplyMovement obj_T23R0501_gantetsu, _02E8
	GoTo _0108

_00F4:
	PlaySE SEQ_SE_DP_WALL_HIT
	ApplyMovement obj_T23R0501_gantetsu, _02E0
	ApplyMovement obj_player, _02C8
_0108:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GoTo _00B1

_011A:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	ScrCmd_735 VAR_SPECIAL_x8000
	Compare VAR_SPECIAL_x8000, 0
	GoToIfNe _01A5
	GetTotalApricornCount VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _020F
	ApplyMovement obj_T23R0501_gantetsu, _02BC
	WaitMovement
	NPCMsg msg_0571_T23R0501_00004
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ScrCmd_739
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ScrCmd_735 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0189
	NPCMsg msg_0571_T23R0501_00006
	GoTo _0190

_0189:
	SetFlag FLAG_DAILY_KURT_MAKING_BALLS
	NPCMsg msg_0571_T23R0501_00005
_0190:
	WaitButton
	CloseMsg
	Compare VAR_UNK_4080, 3
	GoToIfEq _022D
	ReleaseAll
	End

_01A5:
	GoToIfSet FLAG_DAILY_KURT_MAKING_BALLS, _0204
	BufferPlayersName 0
	NPCMsg msg_0571_T23R0501_00008
	ScrCmd_737 VAR_SPECIAL_x8004
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8000, VAR_SPECIAL_RESULT
	CopyVar VAR_SPECIAL_x8005, VAR_SPECIAL_x8000
	CallStd std_give_item_verbose
	ClearKurtApricorn
	Compare VAR_UNK_413B, 10
	GoToIfGe _01EE
	AddVar VAR_UNK_413B, 1
	Compare VAR_UNK_413B, 10
	CallIfGe _0227
_01EE:
	NPCMsg msg_0571_T23R0501_00010
	GoTo _021F
	End

_01F9:
	NPCMsg msg_0571_T23R0501_00009
	GoTo _021F
	End

_0204:
	NPCMsg msg_0571_T23R0501_00007
	GoTo _021F
	End

_020F:
	NPCMsg msg_0571_T23R0501_00003
	Compare VAR_UNK_4080, 3
	GoToIfEq _022D
_021F:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0227:
	SetFlag FLAG_UNK_127
	Return

_022D:
	SetVar VAR_UNK_4080, 4
	ApplyMovement obj_T23R0501_gsbabygirl1, _02FC
	WaitMovement
	ApplyMovement obj_player, _02D4
	WaitMovement
	NPCMsg msg_0571_T23R0501_00015
_024A:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _026E
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _0289
	End

_026E:
	BufferPlayersName 0
	NPCMsg msg_0571_T23R0501_00016
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_KURT
	NPCMsg msg_0571_T23R0501_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0289:
	NPCMsg msg_0571_T23R0501_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0294:
	ApplyMovement 1, _0304
	WaitMovement
	ReleaseAll
	End

_02A2:
	NPCMsg msg_0571_T23R0501_00019
	GoTo _024A
	End

	.balign 4, 0
_02B0:
	Delay16
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_02BC:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_02C8:
	WalkFastWest
	Delay16
	EndMovement

	.balign 4, 0
_02D4:
	WalkOnSpotFastEast
	FaceEast
	EndMovement

	.balign 4, 0
_02E0:
	WalkFastSouth 5
	EndMovement

	.balign 4, 0
_02E8:
	WalkFastWest
	WalkFastSouth 2
	WalkFastEast
	WalkFastSouth 3
	EndMovement

	.balign 4, 0
_02FC:
	WalkNormalWest
	EndMovement

	.balign 4, 0
_0304:
	WalkOnSpotFastEast
	WalkNormalEast
	WalkOnSpotFastWest
	EndMovement

scr_seq_T23R0501_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_077, _0332
	NPCMsg msg_0571_T23R0501_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0332:
	GoToIfSet FLAG_BEAT_AZALEA_ROCKETS, _0348
	NPCMsg msg_0571_T23R0501_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0348:
	CheckRegisteredPhoneNumber PHONE_CONTACT_KURT, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfEq _02A2
	GoToIfSet FLAG_GAME_CLEAR, _0371
	NPCMsg msg_0571_T23R0501_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0371:
	NPCMsg msg_0571_T23R0501_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T23R0501_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_SLOWPOKE, 0
	NPCMsg msg_0571_T23R0501_00020
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T23R0501_004:
	SimpleNPCMsg msg_0571_T23R0501_00021
	End

scr_seq_T23R0501_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 2
	GoToIfNe _03C8
	NPCMsg msg_0571_T23R0501_00024
	GoTo _03F7

_03C8:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 3
	GoToIfNe _03DE
	NPCMsg msg_0571_T23R0501_00024
	GoTo _03F7

_03DE:
	Compare VAR_SCENE_ROCKET_TAKEOVER, 4
	GoToIfNe _03F4
	NPCMsg msg_0571_T23R0501_00024
	GoTo _03F7

_03F4:
	NPCMsg msg_0571_T23R0501_00023
_03F7:
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
