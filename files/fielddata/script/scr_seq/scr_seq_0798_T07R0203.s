#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0203.h"
#include "msgdata/msg/msg_0503_T07R0203.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0203_000
	ScrDef scr_seq_T07R0203_001
	ScrDef scr_seq_T07R0203_002
	ScrDef scr_seq_T07R0203_003
	ScrDef scr_seq_T07R0203_004
	ScrDef scr_seq_T07R0203_005
	ScrDef scr_seq_T07R0203_006
	ScrDef scr_seq_T07R0203_007
	ScrDef scr_seq_T07R0203_008
	ScrDef scr_seq_T07R0203_009
	ScrDef scr_seq_T07R0203_010
	ScrDef scr_seq_T07R0203_011
	ScrDef scr_seq_T07R0203_012
	ScrDef scr_seq_T07R0203_013
	ScrDefEnd

scr_seq_T07R0203_008:
	GetFriendSprite VAR_OBJ_0
	SetVar VAR_UNK_4125, 0
	End

scr_seq_T07R0203_011:
	Compare VAR_UNK_412C, 0
	GoToIfNe _006B
	MovePersonFacing obj_T07R0203_var_1, 12, 0, 6, DIR_WEST
	MovePersonFacing obj_T07R0203_tsure_poke_static_marill, 13, 0, 6, DIR_WEST
_006B:
	End

scr_seq_T07R0203_010:
	ScrCmd_609
	LockAll
	CallStd std_play_friend_music
	ApplyMovement obj_T07R0203_var_1, _012C
	ApplyMovement obj_T07R0203_tsure_poke_static_marill, _0138
	WaitMovement
	BufferPlayersName 0
	GenderMsgBox msg_0503_T07R0203_00012, msg_0503_T07R0203_00013
	CloseMsg
	ApplyMovement obj_T07R0203_var_1, _0140
	ApplyMovement obj_T07R0203_tsure_poke_static_marill, _0148
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0150
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	BufferPlayersName 0
	GenderMsgBox msg_0503_T07R0203_00014, msg_0503_T07R0203_00015
	CloseMsg
	ApplyMovement obj_T07R0203_var_1, _015C
	ApplyMovement obj_T07R0203_tsure_poke_static_marill, _016C
	WaitMovement
	ScrCmd_307 0, 0, 3, 2, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ApplyMovement obj_T07R0203_var_1, _0180
	ApplyMovement obj_T07R0203_tsure_poke_static_marill, _018C
	WaitMovement
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	CallStd std_fade_end_friend_music
	SetVar VAR_UNK_412C, 1
	MovePersonFacing obj_T07R0203_var_1, 29, 0, 29, DIR_WEST
	MovePersonFacing obj_T07R0203_tsure_poke_static_marill, 29, 0, 29, DIR_WEST
	ReleaseAll
	End

	.balign 4, 0
_012C:
	WalkNormalWest 4
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0138:
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_0140:
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_0148:
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_0150:
	WalkNormalSouth 3
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_015C:
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_016C:
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0180:
	WalkNormalNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_018C:
	WalkNormalNorth 2
	SetInvisible
	EndMovement

scr_seq_T07R0203_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckJohtoDexComplete VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0245
	GoToIfSet FLAG_SAW_JOHTO_DEX_CERTIFICATE, _01ED
	NPCMsg msg_0503_T07R0203_00001
	PlayFanfare SEQ_ME_HYOUKA2
	WaitFanfare
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ShowCertificate 0
	RestoreOverworld
	SetFlag FLAG_SAW_JOHTO_DEX_CERTIFICATE
	AddSpecialGameStat SCORE_EVENT_25
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_01ED:
	CheckNationalDexComplete VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0245
	GoToIfSet FLAG_SAW_NATIONAL_DEX_CERTIFICATE, _023A
	NPCMsg msg_0503_T07R0203_00002
	PlayFanfare SEQ_ME_HYOUKA2
	WaitFanfare
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ShowCertificate 1
	RestoreOverworld
	SetFlag FLAG_SAW_NATIONAL_DEX_CERTIFICATE
	AddSpecialGameStat SCORE_EVENT_26
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_023A:
	NPCMsg msg_0503_T07R0203_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0245:
	NPCMsg msg_0503_T07R0203_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0203_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_EARTH, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0276
	NPCMsg msg_0503_T07R0203_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0276:
	GetItemQuantity ITEM_GB_SOUNDS, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _02A7
	NPCMsg msg_0503_T07R0203_00008
	GiveItemNoCheck ITEM_GB_SOUNDS, 1
	NPCMsg msg_0503_T07R0203_00010
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02A7:
	NPCMsg msg_0503_T07R0203_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0203_001:
	SimpleNPCMsg msg_0503_T07R0203_00004
	End

scr_seq_T07R0203_002:
	SimpleNPCMsg msg_0503_T07R0203_00005
	End

scr_seq_T07R0203_003:
	SimpleNPCMsg msg_0503_T07R0203_00006
	End

scr_seq_T07R0203_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0503_T07R0203_00016
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0203_013:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0503_T07R0203_00017
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0203_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0503_T07R0203_00018
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0203_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0503_T07R0203_00019
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0203_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0503_T07R0203_00020
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T07R0203_012:
	SimpleNPCMsg msg_0503_T07R0203_00021
	End
	.balign 4, 0
