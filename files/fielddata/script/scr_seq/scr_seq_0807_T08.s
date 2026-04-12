#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T08.h"
#include "msgdata/msg/msg_0512_T08.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_T08_000
	ScrDef scr_seq_T08_001
	ScrDef scr_seq_T08_002
	ScrDef scr_seq_T08_003
	ScrDef scr_seq_T08_004
	ScrDef scr_seq_T08_005
	ScrDef scr_seq_T08_006
	ScrDef scr_seq_T08_007
	ScrDef scr_seq_T08_008
	ScrDef scr_seq_T08_009
	ScrDefEnd

scr_seq_T08_007:
	GoToIfUnset FLAG_UNK_189, _003B
	ClearFlag FLAG_UNK_189
	End

_003B:
	ClearFlag FLAG_UNK_149
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _0063
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _0063
	SetFlag FLAG_HIDE_CAMERON
	End

_0063:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_T08_006:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _014B
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _015F
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00DA
	ApplyMovement obj_player, _0174
	GoTo _00EA

_00DA:
	ApplyMovement obj_player, _0180
	ApplyMovement obj_T08_gsmiddleman1_2, _0194
_00EA:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0111
	ApplyMovement obj_partner_poke, _01A0
	WaitMovement
_0111:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 62
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

_014B:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_015F:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0174:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0180:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0194:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_01A0:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_T08_008:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	Call _0601
	Call _057B
	Compare VAR_SPECIAL_x8006, 1
	GoToIfEq _01E0
	NPCMsg msg_0512_T08_00007
	CloseMsg
	Call _0601
	ReleaseAll
	End

_01E0:
	NPCMsg msg_0512_T08_00008
_01E3:
	TouchscreenMenuHide
	MenuInitStdGmm 1, 1, 0, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_x8000, 1
	GoToIfNe _0202
	MenuItemAdd 205, 255, 0
_0202:
	Compare VAR_SPECIAL_x8001, 1
	GoToIfNe _0217
	MenuItemAdd 206, 255, 1
_0217:
	Compare VAR_SPECIAL_x8002, 1
	GoToIfNe _022C
	MenuItemAdd 207, 255, 2
_022C:
	Compare VAR_SPECIAL_x8003, 1
	GoToIfNe _0241
	MenuItemAdd 208, 255, 3
_0241:
	MenuItemAdd 126, 255, 4
	MenuExec
	TouchscreenMenuShow
	Switch VAR_SPECIAL_RESULT
	Case 0, _028D
	Case 1, _0331
	Case 2, _03D5
	Case 3, _0479
	GoTo _051D

_028D:
	NPCMsg msg_0512_T08_00011
	GoToIfNoItemSpace ITEM_PERSIM_BERRY, 1, _052C
	GoToIfNoItemSpace ITEM_RAZZ_BERRY, 1, _052C
	GoToIfNoItemSpace ITEM_POMEG_BERRY, 1, _052C
	GiveItemNoCheck ITEM_PERSIM_BERRY, 1
	GiveItemNoCheck ITEM_RAZZ_BERRY, 1
	GiveItemNoCheck ITEM_POMEG_BERRY, 1
	TakeItem ITEM_RED_SHARD, 1, VAR_SPECIAL_RESULT
	GoTo _053B

_0331:
	NPCMsg msg_0512_T08_00012
	GoToIfNoItemSpace ITEM_BLUK_BERRY, 1, _052C
	GoToIfNoItemSpace ITEM_KELPSY_BERRY, 1, _052C
	GoToIfNoItemSpace ITEM_CORNN_BERRY, 1, _052C
	GiveItemNoCheck ITEM_BLUK_BERRY, 1
	GiveItemNoCheck ITEM_KELPSY_BERRY, 1
	GiveItemNoCheck ITEM_CORNN_BERRY, 1
	TakeItem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_RESULT
	GoTo _053B

_03D5:
	NPCMsg msg_0512_T08_00013
	GoToIfNoItemSpace ITEM_PINAP_BERRY, 1, _052C
	GoToIfNoItemSpace ITEM_GREPA_BERRY, 1, _052C
	GoToIfNoItemSpace ITEM_NOMEL_BERRY, 1, _052C
	GiveItemNoCheck ITEM_PINAP_BERRY, 1
	GiveItemNoCheck ITEM_GREPA_BERRY, 1
	GiveItemNoCheck ITEM_NOMEL_BERRY, 1
	TakeItem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_RESULT
	GoTo _053B

_0479:
	NPCMsg msg_0512_T08_00014
	GoToIfNoItemSpace ITEM_WEPEAR_BERRY, 1, _052C
	GoToIfNoItemSpace ITEM_HONDEW_BERRY, 1, _052C
	GoToIfNoItemSpace ITEM_DURIN_BERRY, 1, _052C
	GiveItemNoCheck ITEM_WEPEAR_BERRY, 1
	GiveItemNoCheck ITEM_HONDEW_BERRY, 1
	GiveItemNoCheck ITEM_DURIN_BERRY, 1
	TakeItem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_RESULT
	GoTo _053B

_051D:
	NPCMsg msg_0512_T08_00010
	CloseMsg
	Call _0601
	ReleaseAll
	End

_052C:
	NPCMsg msg_0512_T08_00015
	CloseMsg
	Call _0601
	ReleaseAll
	End

_053B:
	SetVar VAR_SPECIAL_x8000, 0
	SetVar VAR_SPECIAL_x8001, 0
	SetVar VAR_SPECIAL_x8002, 0
	SetVar VAR_SPECIAL_x8003, 0
	SetVar VAR_SPECIAL_x8006, 0
	Call _057B
	Compare VAR_SPECIAL_x8006, 1
	GoToIfNe _0575
	NPCMsg msg_0512_T08_00009
	GoTo _01E3

_0575:
	GoTo _051D

_057B:
	HasItem ITEM_RED_SHARD, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _059C
	SetVar VAR_SPECIAL_x8000, 1
	SetVar VAR_SPECIAL_x8006, 1
_059C:
	HasItem ITEM_BLUE_SHARD, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _05BD
	SetVar VAR_SPECIAL_x8001, 1
	SetVar VAR_SPECIAL_x8006, 1
_05BD:
	HasItem ITEM_YELLOW_SHARD, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _05DE
	SetVar VAR_SPECIAL_x8002, 1
	SetVar VAR_SPECIAL_x8006, 1
_05DE:
	HasItem ITEM_GREEN_SHARD, 1, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _05FF
	SetVar VAR_SPECIAL_x8003, 1
	SetVar VAR_SPECIAL_x8006, 1
_05FF:
	Return

_0601:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0622
	ApplyMovement obj_T08_juggrer, _064C
	WaitMovement
	GoTo _0649

_0622:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _063F
	ApplyMovement obj_T08_juggrer, _0690
	WaitMovement
	GoTo _0649

_063F:
	ApplyMovement obj_T08_juggrer, _06D4
	WaitMovement
_0649:
	Return

	.balign 4, 0
_064C:
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	EndMovement

	.balign 4, 0
_0690:
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	EndMovement

	.balign 4, 0
_06D4:
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	FaceSouth
	FaceEast
	FaceNorth
	FaceWest
	EndMovement

scr_seq_T08_000:
	SimpleNPCMsg msg_0512_T08_00000
	End

scr_seq_T08_001:
	SimpleNPCMsg msg_0512_T08_00001
	End

scr_seq_T08_002:
	SimpleNPCMsg msg_0512_T08_00002
	End

scr_seq_T08_009:
	DirectionSignpost msg_0512_T08_00003, 0, 8, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T08_003:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0512_T08_00004, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T08_004:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0512_T08_00005, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_T08_005:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0512_T08_00006, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
