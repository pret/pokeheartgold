#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T07R0102.h"
#include "msgdata/msg/msg_0495_T07R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T07R0102_000
	ScrDef scr_seq_T07R0102_001
	ScrDef scr_seq_T07R0102_002
	ScrDef scr_seq_T07R0102_003
	ScrDef scr_seq_T07R0102_004
	ScrDef scr_seq_T07R0102_005
	ScrDef scr_seq_T07R0102_006
	ScrDef scr_seq_T07R0102_007
	ScrDefEnd

scr_seq_T07R0102_006:
	GoToIfUnset FLAG_UNK_189, _0033
	ClearFlag FLAG_UNK_189
	End

_0033:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _004E
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _0052

_004E:
	SetFlag FLAG_HIDE_CAMERON
_0052:
	End

scr_seq_T07R0102_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 18
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T07R0102_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_mart_intro
	HoldMsg
	SetVar VAR_SPECIAL_x8004, 19
	CallStd std_special_mart
	ReleaseAll
	End

scr_seq_T07R0102_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	HasItem ITEM_FASHION_CASE, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _01DA
	NPCMsg msg_0495_T07R0102_00003
	GetPlayerFacing VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _00C9
	ApplyMovement obj_T07R0102_leader3, _01E8
	GoTo _00D1

_00C9:
	ApplyMovement obj_T07R0102_leader3, _0200
_00D1:
	WaitMovement
	NPCMsg msg_0495_T07R0102_00004
	ApplyMovement obj_T07R0102_leader3, _0218
	WaitMovement
	Compare VAR_TEMP_x4000, 0
	GoToIfNe _00FB
	ApplyMovement obj_T07R0102_leader3, _0220
	GoTo _011E

_00FB:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0116
	ApplyMovement obj_T07R0102_leader3, _0230
	GoTo _011E

_0116:
	ApplyMovement obj_T07R0102_leader3, _0228
_011E:
	WaitMovement
	NPCMsg msg_0495_T07R0102_00005
	SetVar VAR_SPECIAL_x8004, 92
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_receive_accessory
	NPCMsg msg_0495_T07R0102_00006
	SetVar VAR_SPECIAL_x8004, 93
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_receive_accessory
	NPCMsg msg_0495_T07R0102_00007
	SetVar VAR_SPECIAL_x8004, 94
	SetVar VAR_SPECIAL_x8005, 1
	CallStd std_receive_accessory
	NPCMsg msg_0495_T07R0102_00008
	CloseMsg
	Compare VAR_TEMP_x4000, 3
	CallIfEq _01A0
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _0186
	ApplyMovement obj_T07R0102_leader3, _0250
	GoTo _018E

_0186:
	ApplyMovement obj_T07R0102_leader3, _0238
_018E:
	WaitMovement
	HidePerson obj_T07R0102_leader3
	SetFlag FLAG_HIDE_CELADON_DEPT_STORE_2F_CRASHER_WAKE
	ClearFlag FLAG_HIDE_ROUTE_47_CRASHER_WAKE
	ReleaseAll
	End

_01A0:
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01D8
	GetPersonCoords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8005, 5
	GoToIfNe _01D8
	Release obj_partner_poke
	ApplyMovement obj_partner_poke, _0264
	WaitMovement
	Lock obj_partner_poke
_01D8:
	Return

_01DA:
	NPCMsg msg_0495_T07R0102_00009
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_01E8:
	WalkNormalWest
	WalkOnSpotNormalNorth
	Delay8
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0200:
	WalkNormalEast
	WalkOnSpotNormalNorth
	Delay8
	WalkNormalWest
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0218:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0220:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0228:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0230:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0238:
	WalkNormalWest 2
	WalkNormalSouth
	WalkNormalWest 4
	WalkNormalNorth
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_0250:
	WalkNormalSouth
	WalkNormalWest 6
	WalkNormalNorth
	WalkNormalWest 4
	EndMovement

	.balign 4, 0
_0264:
	WalkSlightlyFastWest
	WalkSlightlyFastNorth
	FaceSouth
	EndMovement

scr_seq_T07R0102_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _039C
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03B0
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _02ED
	ApplyMovement obj_player, _03C4
	ApplyMovement obj_T07R0102_gsmiddleman1_2, _0410
	GoTo _033B

_02ED:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0308
	ApplyMovement obj_player, _03DC
	GoTo _033B

_0308:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _032B
	ApplyMovement obj_player, _03FC
	ApplyMovement obj_T07R0102_gsmiddleman1_2, _0410
	GoTo _033B

_032B:
	ApplyMovement obj_player, _03E8
	ApplyMovement obj_T07R0102_gsmiddleman1_2, _0410
_033B:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0362
	ApplyMovement obj_partner_poke, _041C
	WaitMovement
_0362:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 58
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

_039C:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03B0:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_03C4:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03DC:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03E8:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03FC:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0410:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_041C:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T07R0102_002:
	SimpleNPCMsg msg_0495_T07R0102_00000
	End

scr_seq_T07R0102_003:
	SimpleNPCMsg msg_0495_T07R0102_00001
	End

scr_seq_T07R0102_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0495_T07R0102_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
