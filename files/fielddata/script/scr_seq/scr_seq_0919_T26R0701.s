#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T26R0701.h"
#include "msgdata/msg/msg_0611_T26R0701.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T26R0701_000
	ScrDef scr_seq_T26R0701_001
	ScrDef scr_seq_T26R0701_002
	ScrDef scr_seq_T26R0701_003
	ScrDef scr_seq_T26R0701_004
	ScrDef scr_seq_T26R0701_005
	ScrDef scr_seq_T26R0701_006
	ScrDefEnd

scr_seq_T26R0701_004:
	GoToIfUnset FLAG_UNK_189, _002F
	ClearFlag FLAG_UNK_189
	End

_002F:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _004A
	SetFlag FLAG_HIDE_CAMERON
	GoTo _004E

_004A:
	SetFlag FLAG_HIDE_CAMERON
_004E:
	GoToIfUnset FLAG_GAME_CLEAR, _00C3
	CheckRegisteredPhoneNumber PHONE_CONTACT_JASMINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _008F
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 13
	GoToIfNe _0087
	ClearFlag FLAG_UNK_2CB
	GoTo _008D

_0087:
	GoTo _00C3

_008D:
	End

_008F:
	GetPhoneBookRematch PHONE_CONTACT_JASMINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00C3
	ScrCmd_522 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 12
	GoToIfNe _00BD
	ClearFlag FLAG_UNK_2CB
	GoTo _00C1

_00BD:
	SetFlag FLAG_UNK_2CB
_00C1:
	End

_00C3:
	SetFlag FLAG_UNK_2CB
	End

scr_seq_T26R0701_006:
	SimpleNPCMsg msg_0611_T26R0701_00000
	End

scr_seq_T26R0701_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0611_T26R0701_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T26R0701_001:
	SimpleNPCMsg msg_0611_T26R0701_00002
	End

scr_seq_T26R0701_002:
	SimpleNPCMsg msg_0611_T26R0701_00003
	End

scr_seq_T26R0701_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _025E
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0272
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _018C
	ApplyMovement obj_player, _0288
	ApplyMovement obj_T26R0701_gsmiddleman1, _02C0
	GoTo _01B7

_018C:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01A7
	ApplyMovement obj_player, _02A0
	GoTo _01B7

_01A7:
	ApplyMovement obj_player, _02AC
	ApplyMovement obj_T26R0701_gsmiddleman1, _02C0
_01B7:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01DE
	ApplyMovement obj_partner_poke, _02CC
	WaitMovement
_01DE:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 25
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

_0218:
	GetPlayerFacing VAR_SPECIAL_RESULT
	CompareVarToValue VAR_SPECIAL_RESULT, 0
	GoToIfNe _0237
	ApplyMovement obj_player, _0288
	GoTo _025A

_0237:
	CompareVarToValue VAR_SPECIAL_RESULT, 1
	GoToIfNe _0252
	ApplyMovement obj_player, _02A0
	GoTo _025A

_0252:
	ApplyMovement obj_player, _02AC
_025A:
	WaitMovement
	Return

_025E:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0272:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0288:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02A0:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02AC:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02C0:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_02CC:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T26R0701_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckRegisteredPhoneNumber PHONE_CONTACT_JASMINE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 1
	GoToIfEq _038A
	Compare VAR_TEMP_x4004, 1
	GoToIfGe _037F
	NPCMsg msg_0611_T26R0701_00004
_0307:
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _032B
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfGe _036E
	End

_032B:
	BufferPlayersName 0
	NPCMsg msg_0611_T26R0701_00005
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	RegisterGearNumber PHONE_CONTACT_JASMINE
	NPCMsg msg_0611_T26R0701_00006
	WaitButton
	CloseMsg
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	SetFlag FLAG_UNK_2CB
	HidePerson obj_T26R0701_gsleader6
	PlaySE SEQ_SE_DP_KAIDAN2
	WaitSE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

_036E:
	SetVar VAR_TEMP_x4004, 1
	NPCMsg msg_0611_T26R0701_00007
	WaitButton
	CloseMsg
	ReleaseAll
	End

_037F:
	NPCMsg msg_0611_T26R0701_00008
	GoTo _0307
	End

_038A:
	NPCMsg msg_0611_T26R0701_00009
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03EB
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03F6
	NPCMsg msg_0611_T26R0701_00010
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 89
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0611_T26R0701_00011
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03EB:
	NPCMsg msg_0611_T26R0701_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03F6:
	NPCMsg msg_0611_T26R0701_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
