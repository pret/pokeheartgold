#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T30.h"
#include "msgdata/msg/msg_0629_T30.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T30_000
	ScrDef scr_seq_T30_001
	ScrDef scr_seq_T30_002
	ScrDef scr_seq_T30_003
	ScrDef scr_seq_T30_004
	ScrDef scr_seq_T30_005
	ScrDef scr_seq_T30_006
	ScrDef scr_seq_T30_007
	ScrDef scr_seq_T30_008
	ScrDef scr_seq_T30_009
	ScrDef scr_seq_T30_010
	ScrDef scr_seq_T30_011
	ScrDef scr_seq_T30_012
	ScrDef scr_seq_T30_013
	ScrDef scr_seq_T30_014
	ScrDef scr_seq_T30_015
	ScrDef scr_seq_T30_016
	ScrDefEnd

scr_seq_T30_005:
	Compare VAR_UNK_40C4, 1
	GoToIfNe _005D
	SetFlag FLAG_HIDE_VICTORY_ROAD_CLAIR
	SetVar VAR_UNK_40C4, 2
_005D:
	GoToIfUnset FLAG_UNK_189, _006E
	ClearFlag FLAG_UNK_189
	End

_006E:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _0089
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _00A4

_0089:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _00A0
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _00A4

_00A0:
	SetFlag FLAG_HIDE_CAMERON
_00A4:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _00BF
	ClearFlag FLAG_UNK_204
	GoTo _00C3

_00BF:
	SetFlag FLAG_UNK_204
_00C3:
	End

scr_seq_T30_007:
	PhoneCall PHONE_CONTACT_PROF__ELM, 2, 3
	SetVar VAR_UNK_407B, 2
	End

scr_seq_T30_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPartyLeadAlive VAR_SPECIAL_x8002
	MonHasRibbon VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002, RIBBON_SNOOZE
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0209
	GoToIfSet FLAG_DAILY_GOT_SHOCK_RIBBON, _021D
	Compare VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	GoToIfEq _01B7
	GoToIfSet FLAG_GOT_SOFT_SAND_FROM_SANTOS, _0199
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfEq _014A
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 23
	GoTo _0191

_014A:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 20
	GoToIfNoItemSpace ITEM_SOFT_SAND, 1, _01AD
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_SOFT_SAND_FROM_SANTOS
	AddVar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 21
_0191:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0199:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 22
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01AD:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_01B7:
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 6
	GoToIfEq _01DA
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 23
	GoTo _0191

_01DA:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 48
	BufferMonSpeciesName 0, VAR_SPECIAL_x8002
	MsgBoxExtern VAR_SPECIAL_RESULT, 50
	GiveRibbon VAR_SPECIAL_x8002, RIBBON_SNOOZE
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetFlag FLAG_DAILY_GOT_SHOCK_RIBBON
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0209:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 49
	WaitButton
	CloseMsg
	ReleaseAll
	End

_021D:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 51
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T30_000:
	SimpleNPCMsg msg_0629_T30_00000
	End

scr_seq_T30_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_0D1, _0262
	NPCMsg msg_0629_T30_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0262:
	NPCMsg msg_0629_T30_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T30_002:
	SimpleNPCMsg msg_0629_T30_00003
	End

scr_seq_T30_003:
	SimpleNPCMsg msg_0629_T30_00004
	End

scr_seq_T30_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_SCENE_ROCKET_TAKEOVER, 2
	GoToIfNe _02B1
	NPCMsg msg_0629_T30_00005
	GoTo _02B4

_02B1:
	NPCMsg msg_0629_T30_00006
_02B4:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T30_016:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03C1
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03D5
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0335
	ApplyMovement obj_player, _03EC
	ApplyMovement obj_T30_gsmiddleman1, _0424
	GoTo _0360

_0335:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0350
	ApplyMovement obj_player, _0404
	GoTo _0360

_0350:
	ApplyMovement obj_player, _0410
	ApplyMovement obj_T30_gsmiddleman1, _0424
_0360:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0387
	ApplyMovement obj_partner_poke, _0430
	WaitMovement
_0387:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 44
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

_03C1:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03D5:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_03EC:
	WalkNormalWest
	WalkNormalNorth 2
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0404:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0410:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0424:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0430:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T30_008:
	DirectionSignpost msg_0629_T30_00010, 0, 20, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T30_009:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0629_T30_00011, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T30_010:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0629_T30_00012, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T30_011:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0629_T30_00013, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T30_012:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0629_T30_00014, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T30_013:
	SimpleNPCMsg msg_0629_T30_00007
	End

scr_seq_T30_014:
	SimpleNPCMsg msg_0629_T30_00008
	End

scr_seq_T30_015:
	SimpleNPCMsg msg_0629_T30_00009
	End
	.balign 4, 0
