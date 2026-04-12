#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T02.h"
#include "msgdata/msg/msg_0452_T02.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T02_000
	ScrDef scr_seq_T02_001
	ScrDef scr_seq_T02_002
	ScrDef scr_seq_T02_003
	ScrDef scr_seq_T02_004
	ScrDef scr_seq_T02_005
	ScrDef scr_seq_T02_006
	ScrDef scr_seq_T02_007
	ScrDef scr_seq_T02_008
	ScrDef scr_seq_T02_009
	ScrDef scr_seq_T02_010
	ScrDef scr_seq_T02_011
	ScrDefEnd

scr_seq_T02_008:
	GoToIfUnset FLAG_UNK_189, _0043
	ClearFlag FLAG_UNK_189
	End

_0043:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 3
	GoToIfNe _005E
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _0079

_005E:
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _0075
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _0079

_0075:
	SetFlag FLAG_HIDE_CAMERON
_0079:
	GoToIfSet FLAG_UNLOCKED_WEST_KANTO, _008E
	SetFlag FLAG_UNLOCKED_WEST_KANTO
	SetVar VAR_UNK_4121, 1
_008E:
	End

scr_seq_T02_011:
	PhoneCall PHONE_CONTACT_PROF__OAK, 2, 0
	SetVar VAR_UNK_4096, 2
	End

scr_seq_T02_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0452_T02_00000
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00D7
	NPCMsg msg_0452_T02_00001
	GoTo _00DA

_00D7:
	NPCMsg msg_0452_T02_00002
_00DA:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_T02_001:
	SimpleNPCMsg msg_0452_T02_00003
	End

scr_seq_T02_010:
	SimpleNPCMsg msg_0452_T02_00004
	End

scr_seq_T02_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_TM85_FROM_VIRIDIAN_CITY_MAN, _0147
	NPCMsg msg_0452_T02_00005
	GoToIfNoItemSpace ITEM_TM85, 1, _0152
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM85_FROM_VIRIDIAN_CITY_MAN
_0147:
	NPCMsg msg_0452_T02_00006
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0152:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_T02_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0284
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0298
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01D5
	ApplyMovement obj_player, _02AC
	ApplyMovement obj_T02_gsmiddleman1, _02F8
	GoTo _0223

_01D5:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01F0
	ApplyMovement obj_player, _02C4
	GoTo _0223

_01F0:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0213
	ApplyMovement obj_player, _02E4
	ApplyMovement obj_T02_gsmiddleman1, _02F8
	GoTo _0223

_0213:
	ApplyMovement obj_player, _02D0
	ApplyMovement obj_T02_gsmiddleman1, _02F8
_0223:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _024A
	ApplyMovement obj_partner_poke, _0304
	WaitMovement
_024A:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 69
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

_0284:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0298:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_02AC:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02C4:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02D0:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02E4:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02F8:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0304:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T02_003:
	SimpleNPCMsg msg_0452_T02_00007
	End

scr_seq_T02_004:
	DirectionSignpost msg_0452_T02_00008, 0, 2, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T02_005:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0452_T02_00009, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T02_006:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0452_T02_00010, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T02_007:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0452_T02_00011, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
