#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D47.h"
#include "msgdata/msg/msg_0133_D47.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D47_000
	ScrDef scr_seq_D47_001
	ScrDef scr_seq_D47_002
	ScrDef scr_seq_D47_003
	ScrDef scr_seq_D47_004
	ScrDef scr_seq_D47_005
	ScrDef scr_seq_D47_006
	ScrDef scr_seq_D47_007
	ScrDef scr_seq_D47_008
	ScrDef scr_seq_D47_009
	ScrDef scr_seq_D47_010
	ScrDef scr_seq_D47_011
	ScrDef scr_seq_D47_012
	ScrDef scr_seq_D47_013
	ScrDef scr_seq_D47_014
	ScrDef scr_seq_D47_015
	ScrDef scr_seq_D47_016
	ScrDefEnd

scr_seq_D47_014:
	GoToIfUnset FLAG_UNK_189, _0057
	ClearFlag FLAG_UNK_189
	End

_0057:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _007B
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _007B
	SetFlag FLAG_HIDE_CAMERON
	End

_007B:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_D47_000:
	SimpleNPCMsg msg_0133_D47_00002
	End

scr_seq_D47_001:
	SimpleNPCMsg msg_0133_D47_00003
	End

scr_seq_D47_002:
	SimpleNPCMsg msg_0133_D47_00004
	End

scr_seq_D47_003:
	SimpleNPCMsg msg_0133_D47_00005
	End

scr_seq_D47_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_JIGGLYPUFF, 0
	NPCMsg msg_0133_D47_00006
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D47_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_TEMP_x400B, 0
	GoToIfNe _0106
	NPCMsg msg_0133_D47_00007
	GoTo _0109

_0106:
	NPCMsg msg_0133_D47_00008
_0109:
	WaitButton
	CloseMsg
	ReleaseAll
	Compare VAR_TEMP_x400B, 0
	GoToIfNe _0128
	AddVar VAR_TEMP_x400B, 1
	GoTo _012E

_0128:
	SetVar VAR_TEMP_x400B, 0
_012E:
	End

scr_seq_D47_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0133_D47_00009
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 6
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_D47_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0133_D47_00010
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 14
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_D47_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_BUTTERFREE, 0
	NPCMsg msg_0133_D47_00011
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D47_009:
	SimpleNPCMsg msg_0133_D47_00012
	End

scr_seq_D47_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_SLOWPOKE, 0
	NPCMsg msg_0133_D47_00013
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D47_011:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0133_D47_00017, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D47_012:
	SimpleNPCMsg msg_0133_D47_00014
	End

scr_seq_D47_013:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0307
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _031B
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0258
	ApplyMovement obj_player, _0330
	ApplyMovement obj_D47_gsmiddleman1, _037C
	GoTo _02A6

_0258:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0273
	ApplyMovement obj_player, _0348
	GoTo _02A6

_0273:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0296
	ApplyMovement obj_player, _0368
	ApplyMovement obj_D47_gsmiddleman1, _037C
	GoTo _02A6

_0296:
	ApplyMovement obj_player, _0354
	ApplyMovement obj_D47_gsmiddleman1, _037C
_02A6:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02CD
	ApplyMovement obj_partner_poke, _0388
	WaitMovement
_02CD:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 38
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

_0307:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_031B:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0330:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0348:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0354:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0368:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_037C:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0388:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_D47_015:
	SimpleNPCMsg msg_0133_D47_00015
	End

scr_seq_D47_016:
	SimpleNPCMsg msg_0133_D47_00016
	End
	.balign 4, 0
