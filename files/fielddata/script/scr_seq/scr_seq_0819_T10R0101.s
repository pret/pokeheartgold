#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T10R0101.h"
#include "msgdata/msg/msg_0522_T10R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T10R0101_000
	ScrDef scr_seq_T10R0101_001
	ScrDef scr_seq_T10R0101_002
	ScrDef scr_seq_T10R0101_003
	ScrDef scr_seq_T10R0101_004
	ScrDef scr_seq_T10R0101_005
	ScrDef scr_seq_T10R0101_006
	ScrDef scr_seq_T10R0101_007
	ScrDef scr_seq_T10R0101_008
	ScrDefEnd

scr_seq_T10R0101_005:
	SetFlag FLAG_HIDE_WILLS_ROOM_RETREAT
	SetFlag FLAG_HIDE_KOGAS_ROOM_RETREAT
	SetFlag FLAG_HIDE_BRUNOS_ROOM_RETREAT
	SetFlag FLAG_HIDE_KARENS_ROOM_RETREAT
	ClearFlag FLAG_HIDE_WILLS_ROOM_EXIT
	ClearFlag FLAG_HIDE_KOGAS_ROOM_EXIT
	ClearFlag FLAG_HIDE_BRUNOS_ROOM_EXIT
	ClearFlag FLAG_HIDE_KARENS_ROOM_EXIT
	ClearFlag FLAG_DEFEATED_WILL
	ClearFlag FLAG_DEFEATED_KOGA
	ClearFlag FLAG_DEFEATED_BRUNO
	ClearFlag FLAG_DEFEATED_KAREN
	Compare VAR_UNK_40FC, 1
	GoToIfLe _00AC
	GoToIfSet FLAG_UNK_AA9, _00AC
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _008B
	SetVar VAR_UNK_4119, 1
	GoTo _00AA

_008B:
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _00A4
	SetVar VAR_UNK_4119, 1
	GoTo _00AA

_00A4:
	SetVar VAR_UNK_4119, 0
_00AA:
	End

_00AC:
	End

scr_seq_T10R0101_001:
	SimpleNPCMsg msg_0522_T10R0101_00000
	End

scr_seq_T10R0101_002:
	SimpleNPCMsg msg_0522_T10R0101_00001
	End

scr_seq_T10R0101_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_ABRA, 0
	NPCMsg msg_0522_T10R0101_00002
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T10R0101_006:
	ScrCmd_609
	LockAll
	FadeOutBGM 0, 3
	ApplyMovement obj_player, _01DC
	WaitMovement
	CallStd std_play_rival_intro_music
	GetPlayerCoords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	ClearFlag FLAG_HIDE_INDIGO_PLATEAU_RIVAL
	ShowPerson obj_T10R0101_gsrivel
	MovePersonFacing obj_T10R0101_gsrivel, VAR_SPECIAL_x8000, 0, 23, DIR_NORTH
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_T10R0101_gsrivel, _0208
	ApplyMovement obj_player, _01E8
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferRivalsName 0
	NPCMsg msg_0522_T10R0101_00003
	CloseMsg
	GetStarterChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 152
	GoToIfNe _016E
	TrainerBattle TRAINER_RIVAL_SILVER_20, 0, 0, 0
	GoTo _0191

_016E:
	Compare VAR_SPECIAL_RESULT, 155
	GoToIfNe _0189
	TrainerBattle TRAINER_RIVAL_SILVER_21, 0, 0, 0
	GoTo _0191

_0189:
	TrainerBattle TRAINER_RIVAL_SILVER_19, 0, 0, 0
_0191:
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01CE
	CallStd std_play_rival_outro_music
	BufferRivalsName 0
	NPCMsg msg_0522_T10R0101_00004
	CloseMsg
	ApplyMovement obj_T10R0101_gsrivel, _0210
	WaitMovement
	SetVar VAR_UNK_4119, 0
	SetFlag FLAG_UNK_AA9
	HidePerson obj_T10R0101_gsrivel
	CallStd std_fade_end_rival_outro_music
	ReleaseAll
	End

_01CE:
	HidePerson obj_T10R0101_gsrivel
	SetFlag FLAG_HIDE_INDIGO_PLATEAU_RIVAL
	WhiteOut
	ReleaseAll
	End

	.balign 4, 0
_01DC:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_01E8:
	Delay8 2
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_01F4:
	Delay8 2
	WalkNormalEast
	WalkNormalNorth
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0208:
	WalkNormalNorth 7
	EndMovement

	.balign 4, 0
_0210:
	WalkOnSpotNormalSouth
	WalkNormalSouth 7
	EndMovement

scr_seq_T10R0101_000:
	SetVar VAR_SPECIAL_x8007, 0
	CallStd std_nurse_joy
	End

scr_seq_T10R0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 13
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T10R0101_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_TEMP_x4005, 1
	GoToIfGe _0293
	NPCMsg msg_0522_T10R0101_00005
	CloseMsg
	GetPlayerFacing VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _027D
	ApplyMovement obj_T10R0101_counterm, _02A0
	GoTo _0287

_027D:
	ApplyMovement obj_T10R0101_counterm, _02B0
	WaitMovement
_0287:
	WaitMovement
	SetVar VAR_TEMP_x4005, 1
	ReleaseAll
	End

_0293:
	NPCMsg msg_0522_T10R0101_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_02A0:
	LockDir
	WalkNormalWest
	UnlockDir
	EndMovement

	.balign 4, 0
_02B0:
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

scr_seq_T10R0101_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0522_T10R0101_00007
	TouchscreenMenuHide
_02CD:
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0522_T10R0101_00008, 255, 0
	MenuItemAdd msg_0522_T10R0101_00009, 255, 1
	MenuItemAdd msg_0522_T10R0101_00010, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _0317
	Case 1, _0456
	GoTo _058C
	End

_0317:
	Compare VAR_UNK_40E6, 0
	GoToIfEq _037A
	NPCMsg msg_0522_T10R0101_00011
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0522_T10R0101_00012, 255, 0
	MenuItemAdd msg_0522_T10R0101_00013, 255, 1
	MenuItemAdd msg_0522_T10R0101_00014, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _037A
	Case 1, _03F1
	GoTo _0371
	End

_0371:
	NPCMsg msg_0522_T10R0101_00007
	GoTo _02CD

_037A:
	NPCMsg msg_0522_T10R0101_00015
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0522_T10R0101_00016, 255, 0
	MenuItemAdd msg_0522_T10R0101_00017, 255, 1
	MenuItemAdd msg_0522_T10R0101_00018, 255, 2
	MenuItemAdd msg_0522_T10R0101_00019, 255, 3
	MenuItemAdd msg_0522_T10R0101_00026, 255, 4
	MenuExec
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _03CF
	CloseMsg
	ViewRankings RANKINGS_SCOPE_GROUP, RANKINGS_PAGE_POKEMON, VAR_SPECIAL_RESULT
	NPCMsg msg_0522_T10R0101_00007
	TouchscreenMenuHide
	GoTo _02CD

_03CF:
	Compare VAR_UNK_40E6, 0
	GoToIfNe _03EB
	NPCMsg msg_0522_T10R0101_00007
	GoTo _02CD

_03E5:
	GoTo _03F1

_03EB:
	GoTo _0317

_03F1:
	NPCMsg msg_0522_T10R0101_00015
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0522_T10R0101_00020, 255, 0
	MenuItemAdd msg_0522_T10R0101_00021, 255, 1
	MenuItemAdd msg_0522_T10R0101_00022, 255, 2
	MenuItemAdd msg_0522_T10R0101_00023, 255, 3
	MenuItemAdd msg_0522_T10R0101_00024, 255, 4
	MenuItemAdd msg_0522_T10R0101_00025, 255, 5
	MenuItemAdd msg_0522_T10R0101_00026, 255, 6
	MenuExec
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfEq _03CF
	CloseMsg
	ViewRankings RANKINGS_SCOPE_GROUP, RANKINGS_PAGE_BATTLE_TOWER, VAR_SPECIAL_RESULT
	NPCMsg msg_0522_T10R0101_00007
	TouchscreenMenuHide
	GoTo _02CD

_0456:
	Compare VAR_UNK_40E6, 0
	GoToIfEq _04B0
	NPCMsg msg_0522_T10R0101_00011
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0522_T10R0101_00012, 255, 0
	MenuItemAdd msg_0522_T10R0101_00013, 255, 1
	MenuItemAdd msg_0522_T10R0101_00014, 255, 2
	MenuExec
	Switch VAR_SPECIAL_RESULT
	Case 0, _04B0
	Case 1, _0527
	GoTo _02CD
	End

_04B0:
	NPCMsg msg_0522_T10R0101_00015
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0522_T10R0101_00016, 255, 0
	MenuItemAdd msg_0522_T10R0101_00017, 255, 1
	MenuItemAdd msg_0522_T10R0101_00018, 255, 2
	MenuItemAdd msg_0522_T10R0101_00019, 255, 3
	MenuItemAdd msg_0522_T10R0101_00026, 255, 4
	MenuExec
	Compare VAR_SPECIAL_RESULT, 4
	GoToIfEq _0505
	CloseMsg
	ViewRankings RANKINGS_SCOPE_GLOBAL, RANKINGS_PAGE_POKEMON, VAR_SPECIAL_RESULT
	NPCMsg msg_0522_T10R0101_00007
	TouchscreenMenuHide
	GoTo _02CD

_0505:
	Compare VAR_UNK_40E6, 0
	GoToIfNe _0521
	NPCMsg msg_0522_T10R0101_00007
	GoTo _02CD

_051B:
	GoTo _0527

_0521:
	GoTo _0456

_0527:
	NPCMsg msg_0522_T10R0101_00015
	MenuInit 1, 1, 0, 1, VAR_SPECIAL_RESULT
	MenuItemAdd msg_0522_T10R0101_00020, 255, 0
	MenuItemAdd msg_0522_T10R0101_00021, 255, 1
	MenuItemAdd msg_0522_T10R0101_00022, 255, 2
	MenuItemAdd msg_0522_T10R0101_00023, 255, 3
	MenuItemAdd msg_0522_T10R0101_00024, 255, 4
	MenuItemAdd msg_0522_T10R0101_00025, 255, 5
	MenuItemAdd msg_0522_T10R0101_00026, 255, 6
	MenuExec
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfEq _0505
	CloseMsg
	ViewRankings RANKINGS_SCOPE_GLOBAL, RANKINGS_PAGE_BATTLE_TOWER, VAR_SPECIAL_RESULT
	NPCMsg msg_0522_T10R0101_00007
	TouchscreenMenuHide
	GoTo _02CD

_058C:
	TouchscreenMenuShow
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
