#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D35R0104.h"
#include "msgdata/msg/msg_0114_D35R0104.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D35R0104_000
	ScrDef scr_seq_D35R0104_001
	ScrDef scr_seq_D35R0104_002
	ScrDef scr_seq_D35R0104_003
	ScrDef scr_seq_D35R0104_004
	ScrDef scr_seq_D35R0104_005
	ScrDef scr_seq_D35R0104_006
	ScrDef scr_seq_D35R0104_007
	ScrDef scr_seq_D35R0104_008
	ScrDefEnd

scr_seq_D35R0104_006:
	GoToIfNotDefeated TRAINER_TEAM_ROCKET_F_GRUNT_5, _004F
	GoToIfNotDefeated TRAINER_TEAM_ROCKET_GRUNT_19, _004F
	Compare VAR_UNK_40AC, 3
	GoToIfGe _004F
	SetVar VAR_UNK_40AC, 2
_004F:
	End

scr_seq_D35R0104_008:
	Compare VAR_UNK_40AC, 4
	GoToIfGe _0060
	End

_0060:
	MovePersonFacing obj_D35R0104_babyboy1_9, 22, 0, 15, DIR_NORTH
	MovePersonFacing obj_D35R0104_babyboy1_9_2, 22, 0, 15, DIR_NORTH
	End

scr_seq_D35R0104_001:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _00EC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_D35R0104_wataru, _00F4
	WaitMovement
	ApplyMovement obj_D35R0104_wataru, _00FC
	ApplyMovement obj_D35R0104_tsure_poke_static_dragonite, _010C
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0114_D35R0104_00000, msg_0114_D35R0104_00001
	CloseMsg
	ApplyMovement obj_D35R0104_wataru, _0124
	ApplyMovement obj_D35R0104_tsure_poke_static_dragonite, _012C
	WaitMovement
	HidePerson obj_D35R0104_wataru
	HidePerson obj_D35R0104_tsure_poke_static_dragonite
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_LANCE
	ReleaseAll
	SetVar VAR_UNK_40AC, 1
	End

	.balign 4, 0
_00EC:
	WalkNormalWest
	EndMovement

	.balign 4, 0
_00F4:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_00FC:
	WalkOnSpotNormalSouth
	WalkNormalSouth 3
	WalkNormalEast 3
	EndMovement

	.balign 4, 0
_010C:
	Delay8
	Delay2
	WalkNormalWest
	WalkNormalSouth 3
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0124:
	WalkNormalWest 9
	EndMovement

	.balign 4, 0
_012C:
	Delay2
	WalkNormalEast
	WalkNormalWest 9
	EndMovement

scr_seq_D35R0104_007:
	ScrCmd_609
	LockAll
	ApplyMovement obj_D35R0104_tsure_poke_static_murkrow_2, _018C
	WaitMovement
	NPCMsg msg_0114_D35R0104_00010
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D35R0104_tsure_poke_static_murkrow_2, _0194
	ApplyMovement obj_player, _01A4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetVar VAR_UNK_40AC, 6
	HidePerson obj_D35R0104_tsure_poke_static_murkrow_2
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_MURKROW_2
	ClearFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_2
	ReleaseAll
	End

	.balign 4, 0
_018C:
	JumpOnSpotFastEast 2
	EndMovement

	.balign 4, 0
_0194:
	FaceSouth
	JumpOnSpotFastSouth
	WalkFastSouth 10
	EndMovement

	.balign 4, 0
_01A4:
	Delay8
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_D35R0104_000:
	SimpleNPCMsg msg_0114_D35R0104_00002
	End

scr_seq_D35R0104_002:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _00F4
	WaitMovement
	CallStd std_play_rival_intro_music
	ClearFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_RIVAL
	ShowPerson obj_D35R0104_gsrivel
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 17
	GoToIfNe _01FE
	ApplyMovement obj_D35R0104_gsrivel, _0290
	GoTo _0221

_01FE:
	Compare VAR_TEMP_x4001, 18
	GoToIfNe _0219
	ApplyMovement obj_D35R0104_gsrivel, _029C
	GoTo _0221

_0219:
	ApplyMovement obj_D35R0104_gsrivel, _02A8
_0221:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _02B4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferRivalsName 0
	NPCMsg msg_0114_D35R0104_00003
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_D35R0104_gsrivel, _02BC
	ApplyMovement obj_player, _02C4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_D35R0104_gsrivel, _02D8
	WaitMovement
	CallStd std_fade_end_rival_intro_music
	HidePerson obj_D35R0104_gsrivel
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_RIVAL
	ReleaseAll
	SetVar VAR_UNK_40AC, 3
	End

	.balign 4, 0
_0290:
	WalkNormalSouth 9
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_029C:
	WalkNormalSouth 10
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_02A8:
	WalkNormalSouth 11
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_02B4:
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_02BC:
	WalkFastEast
	EndMovement

	.balign 4, 0
_02C4:
	LockDir
	WalkFastEast
	JumpNearFastEast
	UnlockDir
	EndMovement

	.balign 4, 0
_02D8:
	WalkOnSpotFasterNorth
	WalkOnSpotFasterWest
	Delay8
	WalkNormalWest 2
	WalkNormalNorth 9
	EndMovement

scr_seq_D35R0104_003:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _00F4
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 23
	GoToIfNe _0329
	ApplyMovement obj_player, _040C
	GoTo _0331

_0329:
	ApplyMovement obj_player, _041C
_0331:
	ApplyMovement obj_D35R0104_sakaki, _0440
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	NPCMsg msg_0114_D35R0104_00004
	CloseMsg
	ApplyMovement obj_D35R0104_sakaki, _044C
	WaitMovement
	NPCMsg msg_0114_D35R0104_00005
	CloseMsg
	ApplyMovement obj_D35R0104_sakaki, _0458
	WaitMovement
	ClearFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_PETREL
	ShowPerson obj_D35R0104_rkanbum2
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_GIOVANNI
	HidePerson obj_D35R0104_sakaki
	ApplyMovement obj_D35R0104_rkanbum2, _047C
	WaitMovement
	NPCMsg msg_0114_D35R0104_00006
	CloseMsg
	TrainerBattle TRAINER_EXECUTIVE_PETREL_PETREL_2, 0, 0, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0405
	NPCMsg msg_0114_D35R0104_00007
	CloseMsg
	ApplyMovement obj_D35R0104_rkanbum2, _04A8
	WaitMovement
	HidePerson obj_D35R0104_rkanbum2
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_PETREL
	ApplyMovement obj_D35R0104_tsure_poke_static_murkrow, _04E4
	WaitMovement
	NPCMsg msg_0114_D35R0104_00008
	CloseMsg
	NPCMsg msg_0114_D35R0104_00009
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D35R0104_tsure_poke_static_murkrow, _04F4
	ApplyMovement obj_player, _042C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	SetVar VAR_UNK_40AC, 4
	HidePerson obj_D35R0104_tsure_poke_static_murkrow
	SetFlag FLAG_HIDE_ROCKET_HIDEOUT_B3F_MURKROW_1
	ClearFlag FLAG_HIDE_ROCKET_HIDEOUT_B2F_MURKROW_1
	ReleaseAll
	End

_0405:
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_040C:
	WalkNormalNorth 5
	WalkNormalWest
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_041C:
	WalkNormalNorth 5
	WalkNormalWest 2
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_042C:
	Delay8 3
	FaceSouth
	Delay8 3
	WalkNormalSouth 3
	EndMovement

	.balign 4, 0
_0440:
	Delay8 4
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_044C:
	EmoteExclamationMark
	Delay8 2
	EndMovement

	.balign 4, 0
_0458:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EndMovement

	.balign 4, 0
_047C:
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	FaceSouth
	FaceWest
	FaceNorth
	FaceEast
	EndMovement

	.balign 4, 0
_04A0:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_04A8:
	LockDir
	WalkSlowWest
	UnlockDir
	Delay8
	WalkFastSouth 5
	LockDir
	JumpNearFastNorth
	UnlockDir
	WalkFastSouth
	WalkFastEast 3
	WalkFastSouth 5
	WalkFastWest 7
	WalkFastNorth 12
	WalkFastWest 4
	EndMovement

	.balign 4, 0
_04E4:
	WalkNormalSouth 3
	WalkNormalEast 2
	JumpOnSpotFastEast 2
	EndMovement

	.balign 4, 0
_04F4:
	FaceSouth
	WalkFastSouth
	WalkFastEast 2
	WalkFastSouth 9
	WalkFastWest 7
	WalkFastNorth 13
	WalkFastWest 5
	EndMovement

scr_seq_D35R0104_004:
	Compare VAR_UNK_40AC, 4
	GoToIfGe _055F
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfNotDefeated TRAINER_TEAM_ROCKET_F_GRUNT_5, _0561
	GoToIfNotDefeated TRAINER_TEAM_ROCKET_GRUNT_19, _0561
	BufferPlayersName 0
	NPCMsg msg_0114_D35R0104_00012
	CloseMsg
	PlaySE SEQ_SE_DP_DOOR10
	ApplyMovement obj_D35R0104_babyboy1_9, _056C
	ApplyMovement obj_D35R0104_babyboy1_9_2, _056C
	WaitMovement
	ReleaseAll
_055F:
	End

_0561:
	NPCMsg msg_0114_D35R0104_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_056C:
	WalkNormalWest 3
	EndMovement

scr_seq_D35R0104_005:
	SimpleNPCMsg msg_0114_D35R0104_00008
	SetFlag FLAG_UNK_0D3
	End
	.balign 4, 0
