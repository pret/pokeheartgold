#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R39.h"
#include "msgdata/msg/msg_0396_R39.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R39_000
	ScrDef scr_seq_R39_001
	ScrDef scr_seq_R39_002
	ScrDef scr_seq_R39_003
	ScrDef scr_seq_R39_004
	ScrDef scr_seq_R39_005
	ScrDef scr_seq_R39_006
	ScrDef scr_seq_R39_007
	ScrDefEnd

scr_seq_R39_001:
	GoToIfUnset FLAG_UNK_189, _0033
	ClearFlag FLAG_UNK_189
	End

_0033:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _005B
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _005B
	SetFlag FLAG_HIDE_CAMERON
	GoTo _005F

_005B:
	ClearFlag FLAG_HIDE_CAMERON
_005F:
	ScrCmd_379 VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _0087
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _0087
	ClearFlag FLAG_UNK_226
	GoTo _008B

_0087:
	SetFlag FLAG_UNK_226
_008B:
	GoToIfUnset FLAG_TRADE_LT_SURGE_PIKACHU, _00E3
	GetPhoneBookRematch PHONE_CONTACT_LT__SURGE, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _00E3
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _00C4
	ClearFlag FLAG_HIDE_ROUTE_39_LT_SURGE
	GoTo _00E1

_00C4:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _00DB
	ClearFlag FLAG_HIDE_ROUTE_39_LT_SURGE
	GoTo _00E1

_00DB:
	GoTo _00E3

_00E1:
	End

_00E3:
	SetFlag FLAG_HIDE_ROUTE_39_LT_SURGE
	End

scr_seq_R39_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	PlayCry SPECIES_MILTANK, 0
	NPCMsg msg_0396_R39_00003
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R39_002:
	ScrCmd_609
	LockAll
	ApplyMovement obj_R39_gsgentleman, _0208
	WaitMovement
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 171
	GoToIfNe _0133
	ApplyMovement obj_R39_gsgentleman, _0214
	GoTo _0156

_0133:
	Compare VAR_TEMP_x4001, 172
	GoToIfNe _014E
	ApplyMovement obj_R39_gsgentleman, _0220
	GoTo _0156

_014E:
	ApplyMovement obj_R39_gsgentleman, _0228
_0156:
	WaitMovement
	NPCMsg msg_0396_R39_00004
	NPCMsg msg_0396_R39_00005
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01E3
_0173:
	NPCMsg msg_0396_R39_00006
	RegisterGearNumber PHONE_CONTACT_BAOBA
	BufferPlayersName 0
	NPCMsg msg_0396_R39_00008
	PlayFanfare SEQ_ME_POKEGEAR_REGIST
	WaitFanfare
	NPCMsg msg_0396_R39_00009
	CloseMsg
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 171
	GoToIfNe _01AC
	ApplyMovement obj_R39_gsgentleman, _0234
	GoTo _01CF

_01AC:
	Compare VAR_TEMP_x4001, 172
	GoToIfNe _01C7
	ApplyMovement obj_R39_gsgentleman, _0244
	GoTo _01CF

_01C7:
	ApplyMovement obj_R39_gsgentleman, _0254
_01CF:
	WaitMovement
	HidePerson obj_R39_gsgentleman
	SetFlag FLAG_UNK_228
	ReleaseAll
	SetVar VAR_UNK_408F, 1
	End

_01E3:
	NPCMsg msg_0396_R39_00007
	NPCMsg msg_0396_R39_00005
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01E3
	GoTo _0173
	End

	.balign 4, 0
_0208:
	EmoteExclamationMark
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0214:
	WalkNormalNorth
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0220:
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0228:
	WalkNormalSouth
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0234:
	WalkNormalSouth
	WalkNormalWest 2
	WalkNormalSouth 9
	EndMovement

	.balign 4, 0
_0244:
	WalkNormalSouth
	WalkNormalWest 2
	WalkNormalSouth 8
	EndMovement

	.balign 4, 0
_0254:
	WalkNormalSouth
	WalkNormalWest 2
	WalkNormalSouth 7
	EndMovement

scr_seq_R39_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _038C
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _03A0
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _02DD
	ApplyMovement obj_player, _03B4
	ApplyMovement obj_R39_gsmiddleman1_2, _0400
	GoTo _032B

_02DD:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _02F8
	ApplyMovement obj_player, _03CC
	GoTo _032B

_02F8:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _031B
	ApplyMovement obj_player, _03EC
	ApplyMovement obj_R39_gsmiddleman1_2, _0400
	GoTo _032B

_031B:
	ApplyMovement obj_player, _03D8
	ApplyMovement obj_R39_gsmiddleman1_2, _0400
_032B:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0352
	ApplyMovement obj_partner_poke, _040C
	WaitMovement
_0352:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 28
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

_038C:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_03A0:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_03B4:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03CC:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03D8:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_03EC:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0400:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_040C:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R39_007:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0396_R39_00010
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0485
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0490
	NPCMsg msg_0396_R39_00011
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 80
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0396_R39_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0485:
	NPCMsg msg_0396_R39_00013
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0490:
	NPCMsg msg_0396_R39_00014
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R39_003:
	DirectionSignpost msg_0396_R39_00000, 1, 21, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R39_004:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0396_R39_00001, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R39_005:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0396_R39_00002, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
