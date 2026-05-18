#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D45R0102.h"
#include "msgdata/msg/msg_0131_D45R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D45R0102_000
	ScrDef scr_seq_D45R0102_001
	ScrDef scr_seq_D45R0102_002
	ScrDef scr_seq_D45R0102_003
	ScrDefEnd

scr_seq_D45R0102_002:
	End

scr_seq_D45R0102_000:
	Compare VAR_UNK_40FE, 4
	GoToIfEq _0077
	Compare VAR_UNK_40FE, 3
	GoToIfEq _0057
	Compare VAR_UNK_40FE, 2
	GoToIfEq _003D
	End

_003D:
	MovePersonFacing obj_D45R0102_sakaki, 6, 1, 4, DIR_NORTH
	MovePersonFacing obj_D45R0102_var_1, 5, 1, 8, DIR_SOUTH
	End

_0057:
	MovePersonFacing obj_D45R0102_sakaki, 6, 1, 6, DIR_SOUTH
	MovePersonFacing obj_D45R0102_var_1, 5, 1, 7, DIR_NORTH
	MakeObjectVisible obj_partner_poke
	ScrCmd_606
	End

_0077:
	End

scr_seq_D45R0102_001:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0374
	ApplyMovement obj_D45R0102_var_1, _03AC
	WaitMovement
	ApplyMovement obj_partner_poke, _0398
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_D45R0102_sakaki, _031C
	WaitMovement
	NPCMsg msg_0131_D45R0102_00000
	CloseMsg
	ApplyMovement obj_D45R0102_var_1, _03AC
	WaitMovement
	GenderMsgBox msg_0131_D45R0102_00008, msg_0131_D45R0102_00007
	CloseMsg
	ApplyMovement obj_D45R0102_sakaki, _032C
	WaitMovement
	NPCMsg msg_0131_D45R0102_00001
	CloseMsg
	ApplyMovement obj_D45R0102_var_1, _03B4
	WaitMovement
	GenderMsgBox msg_0131_D45R0102_00010, msg_0131_D45R0102_00009
	CloseMsg
	ApplyMovement obj_D45R0102_var_1, _038C
	WaitMovement
	GenderMsgBox msg_0131_D45R0102_00012, msg_0131_D45R0102_00011
	CloseMsg
	ApplyMovement obj_D45R0102_var_1, _03DC
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0131_D45R0102_00014, msg_0131_D45R0102_00013
	CloseMsg
	StopBGM 0
	PlaySE SEQ_SE_PL_FR03
	PlayBGM SEQ_GS_SENKYO
	NPCMsg msg_0131_D45R0102_00002
	StopSE SEQ_SE_PL_FR03
	CloseMsg
	ApplyMovement obj_D45R0102_sakaki, _032C
	WaitMovement
	NPCMsg msg_0131_D45R0102_00003
	CloseMsg
	SetVar VAR_UNK_40FE, 3
	TrainerBattle TRAINER_ROCKET_BOSS_GIOVANNI, 0, 1, 0
	CheckBattleWon VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0250
	SetVar VAR_UNK_40FE, 4
	ApplyMovement obj_D45R0102_sakaki, _033C
	WaitMovement
	NPCMsg msg_0131_D45R0102_00004
	CloseMsg
	ApplyMovement obj_D45R0102_sakaki, _0350
	WaitMovement
	HidePerson obj_D45R0102_sakaki
	SetFlag FLAG_HIDE_TOHJO_FALLS_GIOVANNI
	ApplyMovement obj_player, _0380
	ApplyMovement obj_D45R0102_var_1, _0380
	WaitMovement
	FadeOutBGM 0, 30
	StopBGM 0
	PlaySE SEQ_SE_PL_FR03
	NPCMsg msg_0131_D45R0102_00005
	StopSE SEQ_SE_PL_FR03
	CloseMsg
	ApplyMovement obj_D45R0102_var_1, _03D4
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0131_D45R0102_00016, msg_0131_D45R0102_00015
	CloseMsg
	GetPartyLeadAlive VAR_TEMP_x4002
	GetPartyMonSpecies VAR_TEMP_x4002, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 251
	CallIfNe _02C0
	ApplyMovement obj_partner_poke, _03A4
	WaitMovement
	PlaySE SEQ_SE_GS_SUZUSYUTUGEN_HO
	FadeScreen 6, 6, 0, RGB_WHITE
	WaitFade
	Wait 15, VAR_SPECIAL_RESULT
	FadeScreen 6, 6, 1, RGB_WHITE
	WaitFade
	ApplyMovement obj_player, _038C
	WaitMovement
	ApplyMovement obj_D45R0102_var_1, _03C0
	WaitMovement
	Compare VAR_TEMP_x4003, 1
	GoToIfNe _0224
	GenderMsgBox msg_0131_D45R0102_00027, msg_0131_D45R0102_00026
	CloseMsg
	GoTo _022A

_0224:
	GenderMsgBox msg_0131_D45R0102_00018, msg_0131_D45R0102_00017
	CloseMsg
_022A:
	PlaySE SEQ_SE_GS_TIMESLIP
	ScrCmd_810
	ClearFlag FLAG_HIDE_ILEX_FOREST_FRIEND
	Warp MAP_ILEX_FOREST, 0, 16, 57, DIR_SOUTH
	FadeScreen 6, 15, 1, RGB_WHITE
	WaitFade
	ReleaseAll
	End

_0250:
	NPCMsg msg_0131_D45R0102_00006
	CloseMsg
	ApplyMovement obj_D45R0102_sakaki, _0360
	PlaySE SEQ_SE_GS_SUZUSYUTUGEN_HO
	FadeScreen 6, 6, 0, RGB_WHITE
	WaitFade
	Wait 15, VAR_SPECIAL_RESULT
	FadeScreen 6, 6, 1, RGB_WHITE
	WaitFade
	WaitMovement
	HidePerson obj_D45R0102_sakaki
	SetFlag FLAG_HIDE_TOHJO_FALLS_GIOVANNI
	NPCMsg msg_0131_D45R0102_00019
	CloseMsg
	PlaySE SEQ_SE_GS_TIMESLIP
	ScrCmd_810
	SetFlag FLAG_UNK_178
	SetVar VAR_UNK_40FE, 0
	SetFlag FLAG_HIDE_ILEX_FOREST_FRIEND
	Warp MAP_ILEX_FOREST, 0, 16, 57, DIR_SOUTH
	FadeScreen 6, 15, 1, RGB_WHITE
	WaitFade
	TouchscreenMenuShow
	ReleaseAll
	End

_02C0:
	SetVar VAR_TEMP_x4003, 1
	ApplyMovement obj_D45R0102_var_1, _0304
	WaitMovement
	GenderMsgBox msg_0131_D45R0102_00023, msg_0131_D45R0102_00022
	CloseMsg
	GenderMsgBox msg_0131_D45R0102_00025, msg_0131_D45R0102_00024
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	PlayFanfare SEQ_ME_ASA
	WaitFanfare
	HealParty
	ScrCmd_436
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Return

	.balign 4, 0
_0304:
	WalkOnSpotNormalEast
	EmoteExclamationMark
	Delay8
	WalkFastEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_031C:
	EmoteExclamationMark
	Delay8
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_032C:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0334:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_033C:
	LockDir
	WalkSlowNorth
	UnlockDir
	WalkSlowEast 2
	EndMovement

	.balign 4, 0
_0350:
	WalkNormalSouth 4
	WalkNormalWest 2
	WalkNormalSouth 2
	EndMovement

	.balign 4, 0
_0360:
	WalkSlowEast 2
	WalkSlowSouth 3
	WalkSlowWest 2
	WalkSlowSouth 2
	EndMovement

	.balign 4, 0
_0374:
	WalkOnSpotNormalNorth
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0380:
	Delay8 3
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_038C:
	EmoteExclamationMark
	Delay8
	EndMovement

	.balign 4, 0
_0398:
	WalkNormalEast
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_03A4:
	JumpOnSpotFastSouth
	EndMovement

	.balign 4, 0
_03AC:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_03B4:
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_03C0:
	WalkOnSpotNormalWest
	Delay8
	WalkOnSpotNormalEast
	Delay8
	EndMovement

	.balign 4, 0
_03D4:
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_03DC:
	WalkOnSpotFastEast 4
	EndMovement

scr_seq_D45R0102_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40FE, 4
	GoToIfGe _0404
	NPCMsg msg_0131_D45R0102_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0404:
	NPCMsg msg_0131_D45R0102_00021
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
