#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D32R0102.h"
#include "msgdata/msg/msg_0104_D32R0102.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D32R0102_000
	ScrDef scr_seq_D32R0102_001
	ScrDef scr_seq_D32R0102_002
	ScrDef scr_seq_D32R0102_003
	ScrDef scr_seq_D32R0102_004
	ScrDef scr_seq_D32R0102_005
	ScrDef scr_seq_D32R0102_006
	ScrDef scr_seq_D32R0102_007
	ScrDef scr_seq_D32R0102_008
	ScrDefEnd

scr_seq_D32R0102_002:
	Compare VAR_UNK_40E5, 2
	GoToIfEq _0035
	End

_0035:
	MovePersonFacing obj_D32R0102_gsmiddleman1, 17, 1, 25, DIR_WEST
	End

scr_seq_D32R0102_004:
	GoToIfUnset FLAG_UNK_189, _0054
	ClearFlag FLAG_UNK_189
	End

_0054:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _0078
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _0078
	SetFlag FLAG_HIDE_CAMERON
	End

_0078:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_D32R0102_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Compare VAR_UNK_40E5, 2
	GoToIfEq _009E
	NPCMsg msg_0104_D32R0102_00002
	WaitButton
	CloseMsg
	ReleaseAll
	End

_009E:
	NPCMsg msg_0104_D32R0102_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D32R0102_001:
	ScrCmd_609
	LockAll
	NPCMsg msg_0104_D32R0102_00000
	CloseMsg
	MovePersonFacing obj_D32R0102_gsmiddleman1, 14, 1, 36, DIR_NORTH
	GetPlayerCoords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	Compare VAR_SPECIAL_x8004, 12
	GoToIfNe _00E7
	ApplyMovement obj_D32R0102_gsmiddleman1, _019C
	ApplyMovement obj_player, _0224
	GoTo _0183

_00E7:
	Compare VAR_SPECIAL_x8004, 13
	GoToIfNe _010A
	ApplyMovement obj_D32R0102_gsmiddleman1, _01B4
	ApplyMovement obj_player, _0224
	GoTo _0183

_010A:
	Compare VAR_SPECIAL_x8004, 14
	GoToIfNe _012D
	ApplyMovement obj_D32R0102_gsmiddleman1, _01C8
	ApplyMovement obj_player, _0224
	GoTo _0183

_012D:
	Compare VAR_SPECIAL_x8004, 15
	GoToIfNe _0150
	ApplyMovement obj_D32R0102_gsmiddleman1, _01E0
	ApplyMovement obj_player, _0230
	GoTo _0183

_0150:
	Compare VAR_SPECIAL_x8004, 16
	GoToIfNe _0173
	ApplyMovement obj_D32R0102_gsmiddleman1, _01F4
	ApplyMovement obj_player, _0230
	GoTo _0183

_0173:
	ApplyMovement obj_D32R0102_gsmiddleman1, _020C
	ApplyMovement obj_player, _0230
_0183:
	WaitMovement
	NPCMsg msg_0104_D32R0102_00001
	WaitButton
	CloseMsg
	ReleaseAll
	SetVar VAR_UNK_40E5, 1
	SetFlag FLAG_UNK_25B
	End

	.balign 4, 0
_019C:
	WalkFastWest
	WalkFastNorth 5
	WalkSlightlyFastNorth 2
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_01B4:
	WalkFastNorth 5
	WalkSlightlyFastNorth 2
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_01C8:
	WalkNormalEast
	WalkFastNorth 5
	WalkSlightlyFastNorth 2
	WalkNormalNorth
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_01E0:
	WalkFastNorth 5
	WalkSlightlyFastNorth 2
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_01F4:
	WalkNormalEast
	WalkFastNorth 5
	WalkSlightlyFastNorth 2
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_020C:
	WalkFastEast 2
	WalkFastNorth 5
	WalkSlightlyFastNorth 2
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0224:
	Delay8 5
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0230:
	Delay8 5
	WalkOnSpotNormalWest
	EndMovement

scr_seq_D32R0102_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0364
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0378
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _02B5
	ApplyMovement obj_player, _038C
	ApplyMovement obj_D32R0102_gsmiddleman1_2, _03D8
	GoTo _0303

_02B5:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02D0
	ApplyMovement obj_player, _03A4
	GoTo _0303

_02D0:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _02F3
	ApplyMovement obj_player, _03C4
	ApplyMovement obj_D32R0102_gsmiddleman1_2, _03D8
	GoTo _0303

_02F3:
	ApplyMovement obj_player, _03B0
	ApplyMovement obj_D32R0102_gsmiddleman1_2, _03D8
_0303:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _032A
	ApplyMovement obj_partner_poke, _03E4
	WaitMovement
_032A:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 29
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

_0364:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0378:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_038C:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03A4:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03B0:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03C4:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03D8:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_03E4:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_D32R0102_005:
	GoToIfSet FLAG_UNK_150, _0421
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0104_D32R0102_00004
	ApplyMovement obj_D32R0102_gsman1, _043C
	WaitMovement
	NPCMsg msg_0104_D32R0102_00005
	CloseMsg
	SetFlag FLAG_UNK_150
	GoTo _042E

_0421:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0104_D32R0102_00006
	CloseMsg
_042E:
	ApplyMovement obj_D32R0102_gsman1, _0444
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_043C:
	FaceSouth
	EndMovement

	.balign 4, 0
_0444:
	FaceNorth
	EndMovement

scr_seq_D32R0102_006:
	SimpleNPCMsg msg_0104_D32R0102_00007
	End

scr_seq_D32R0102_007:
	SimpleNPCMsg msg_0104_D32R0102_00008
	End

scr_seq_D32R0102_008:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0104_D32R0102_00009, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
