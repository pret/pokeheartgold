#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T27.h"
#include "msgdata/msg/msg_0612_T27.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T27_000
	ScrDef scr_seq_T27_001
	ScrDef scr_seq_T27_002
	ScrDef scr_seq_T27_003
	ScrDef scr_seq_T27_004
	ScrDef scr_seq_T27_005
	ScrDef scr_seq_T27_006
	ScrDef scr_seq_T27_007
	ScrDef scr_seq_T27_008
	ScrDef scr_seq_T27_009
	ScrDef scr_seq_T27_010
	ScrDef scr_seq_T27_011
	ScrDef scr_seq_T27_012
	ScrDef scr_seq_T27_013
	ScrDef scr_seq_T27_014
	ScrDef scr_seq_T27_015
	ScrDef scr_seq_T27_016
	ScrDefEnd

scr_seq_T27_000:
	End

scr_seq_T27_015:
	GoToIfUnset FLAG_UNK_189, _0059
	ClearFlag FLAG_UNK_189
	End

_0059:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _0074
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _0078

_0074:
	SetFlag FLAG_HIDE_CAMERON
_0078:
	End

scr_seq_T27_012:
	ScrCmd_609
	LockAll
	ScrCmd_307 11, 5, 25, 23, 1
	ScrCmd_310 1
	ScrCmd_308 1
	ApplyMovement obj_player, _00D0
	WaitMovement
	Lock obj_partner_poke
	ScrCmd_596 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00B6
	ScrCmd_606
	GoTo _00B8

_00B6:
	ScrCmd_607
_00B8:
	Release obj_partner_poke
	SetVar VAR_UNK_4079, 0
	ScrCmd_311 1
	ScrCmd_308 1
	ScrCmd_309 1
	ReleaseAll
	End

	.balign 4, 0
_00D0:
	WalkFastSouth 2
	Delay8
	EndMovement

scr_seq_T27_005:
	ScrCmd_609
	LockAll
	ClearFlag FLAG_HIDE_ECRUTEAK_RIVAL
	ShowPerson obj_T27_gsrivel
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_T27_gsrivel, _019C
	ApplyMovement obj_player, _01B0
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PlaySE SEQ_SE_DP_WALL_HIT2
	NPCMsg msg_0612_T27_00016
	Wait 30, VAR_SPECIAL_RESULT
	BufferRivalsName 1
	NPCMsg msg_0612_T27_00017
	CloseMsg
	ApplyMovement obj_T27_gsrivel, _01C4
	WaitMovement
	BufferPlayersName 0
	BufferRivalsName 1
	NPCMsg msg_0612_T27_00018
	CloseMsg
	PlaySE SEQ_SE_DP_WALL_HIT2
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_T27_gsrivel, _01D4
	ApplyMovement obj_player, _01B0
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_T27_gsrivel, _01E0
	ApplyMovement obj_player, _01F0
	WaitMovement
	HidePerson obj_T27_gsrivel
	SetFlag FLAG_HIDE_ECRUTEAK_RIVAL
	ReleaseAll
	SetVar VAR_UNK_4079, 4
	SetVar VAR_UNK_410C, 4
	ClearFlag FLAG_HIDE_DANCE_STUDIO_KIMONO_GIRLS
	SetFlag FLAG_UNK_241
	End

	.balign 4, 0
_0194:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_019C:
	LockDir
	WalkFastSouth
	WalkOnSpotFastNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_01B0:
	FaceNorth
	LockDir
	WalkFastSouth
	UnlockDir
	EndMovement

	.balign 4, 0
_01C4:
	EmoteExclamationMark
	Delay8
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01D4:
	WalkFastSouth
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_01E0:
	WalkSlowWest 3
	Delay8 3
	WalkFastWest 6
	EndMovement

	.balign 4, 0
_01F0:
	Delay8 3
	WalkOnSpotNormalWest
	EndMovement

scr_seq_T27_013:
	SimpleNPCMsg msg_0612_T27_00019
	End

scr_seq_T27_014:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0314
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0328
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0288
	ApplyMovement obj_player, _033C
	ApplyMovement obj_T27_gsmiddleman1, _0374
	GoTo _02B3

_0288:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02A3
	ApplyMovement obj_player, _0354
	GoTo _02B3

_02A3:
	ApplyMovement obj_player, _0360
	ApplyMovement obj_T27_gsmiddleman1, _0374
_02B3:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02DA
	ApplyMovement obj_partner_poke, _0380
	WaitMovement
_02DA:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 19
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 2
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0314:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0328:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_033C:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0354:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0360:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0374:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0380:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T27_001:
	DirectionSignpost msg_0612_T27_00011, 0, 18, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T27_002:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0612_T27_00012, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T27_003:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0612_T27_00013, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T27_004:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0612_T27_00014, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T27_016:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0612_T27_00015, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T27_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_96A, _0417
	NPCMsg msg_0612_T27_00008
	GoTo _041A

_0417:
	NPCMsg msg_0612_T27_00009
_041A:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GAME_CLEAR, _0440
	NPCMsg msg_0612_T27_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0440:
	NPCMsg msg_0612_T27_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_410C, 2
	GoToIfGt _0469
	NPCMsg msg_0612_T27_00002
	GoTo _046C

_0469:
	NPCMsg msg_0612_T27_00003
_046C:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GAME_CLEAR, _04A8
	Compare VAR_UNK_40A1, 0
	GoToIfNe _049D
	NPCMsg msg_0612_T27_00005
	GoTo _04A0

_049D:
	NPCMsg msg_0612_T27_00006
_04A0:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_04A8:
	NPCMsg msg_0612_T27_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T27_007:
	SimpleNPCMsg msg_0612_T27_00010
	End

scr_seq_T27_011:
	SimpleNPCMsg msg_0612_T27_00004
	End
	.balign 4, 0
