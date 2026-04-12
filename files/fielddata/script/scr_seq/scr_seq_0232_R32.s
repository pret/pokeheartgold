#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R32.h"
#include "msgdata/msg/msg_0380_R32.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R32_000
	ScrDef scr_seq_R32_001
	ScrDef scr_seq_R32_002
	ScrDef scr_seq_R32_003
	ScrDef scr_seq_R32_004
	ScrDef scr_seq_R32_005
	ScrDef scr_seq_R32_006
	ScrDef scr_seq_R32_007
	ScrDef scr_seq_R32_008
	ScrDef scr_seq_R32_009
	ScrDefEnd

scr_seq_R32_004:
	GoToIfUnset FLAG_UNK_189, _003B
	ClearFlag FLAG_UNK_189
	End

_003B:
	CheckBadge BADGE_PLAIN, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0079
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _0083
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _0083
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _0083
_0079:
	SetFlag FLAG_HIDE_CAMERON
	GoTo _008D

_0083:
	ClearFlag FLAG_HIDE_CAMERON
	GoTo _008D

_008D:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfNe _00A8
	ClearFlag FLAG_UNK_208
	GoTo _00AC

_00A8:
	SetFlag FLAG_UNK_208
_00AC:
	End

scr_seq_R32_005:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetPartyLeadAlive VAR_SPECIAL_x8002
	MonHasRibbon VAR_SPECIAL_RESULT, VAR_SPECIAL_x8002, RIBBON_RELAX
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _01D4
	GoToIfSet FLAG_DAILY_GOT_SHOCK_RIBBON, _01E8
	Compare VAR_NUM_MET_WEEKDAY_SIBLINGS, 7
	GoToIfEq _0182
	GoToIfSet FLAG_GOT_POISON_BARB_FROM_FRIEDA, _0164
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 5
	GoToIfEq _0115
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 19
	GoTo _015C

_0115:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 16
	GoToIfNoItemSpace ITEM_POISON_BARB, 1, _0178
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_POISON_BARB_FROM_FRIEDA
	AddVar VAR_NUM_MET_WEEKDAY_SIBLINGS, 1
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 17
_015C:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0164:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 18
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0178:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

_0182:
	GetWeekday VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 5
	GoToIfEq _01A5
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 19
	GoTo _015C

_01A5:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 44
	BufferMonSpeciesName 0, VAR_SPECIAL_x8002
	MsgBoxExtern VAR_SPECIAL_RESULT, 46
	GiveRibbon VAR_SPECIAL_x8002, RIBBON_RELAX
	PlayFanfare SEQ_ME_ITEM
	WaitFanfare
	SetFlag FLAG_DAILY_GOT_SHOCK_RIBBON
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01D4:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 45
	WaitButton
	CloseMsg
	ReleaseAll
	End

_01E8:
	GetStdMsgNaix 0, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 47
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R32_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_TM05_FROM_ROUTE_32_MAN, _023B
	NPCMsg msg_0380_R32_00010
	GoToIfNoItemSpace ITEM_TM05, 1, _0246
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_TM05_FROM_ROUTE_32_MAN
_023B:
	NPCMsg msg_0380_R32_00012
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0246:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_R32_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CheckBadge BADGE_ZEPHYR, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _028C
	GoToIfUnset FLAG_GOT_EGG_FROM_ELMS_ASSISTANT, _0297
	GoToIfUnset FLAG_UNK_074, _02A5
	NPCMsg msg_0380_R32_00007
_0284:
	WaitButton
	CloseMsg
	ReleaseAll
	End

_028C:
	NPCMsg msg_0380_R32_00003
	GoTo _0284
	End

_0297:
	BufferPlayersName 0
	NPCMsg msg_0380_R32_00001
	GoTo _0284
	End

_02A5:
	SetVar VAR_TEMP_x4002, 0
	Call _02B5
	ReleaseAll
	End

_02B5:
	Compare VAR_UNK_408D, 0
	GoToIfNe _02C8
	SetVar VAR_UNK_408D, 1
_02C8:
	NPCMsg msg_0380_R32_00005
	SetVar VAR_SPECIAL_x8004, 239
	SetVar VAR_SPECIAL_x8005, 1
	HasSpaceForItem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _030D
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _0304
	NPCMsg msg_0380_R32_00008
	WaitButton
	GoTo _0307

_0304:
	NPCMsg msg_0380_R32_00009
_0307:
	GoTo _032C

_030D:
	Compare VAR_TEMP_x4002, 0
	GoToIfNe _0324
	CallStd std_obtain_item_verbose
	GoTo _0328

_0324:
	CallStd std_give_item_verbose
_0328:
	SetFlag FLAG_UNK_074
_032C:
	CloseMsg
	Return

scr_seq_R32_002:
	ScrCmd_609
	LockAll
	ApplyMovement obj_R32_gsmiddleman1, _046C
	WaitMovement
	NPCMsg msg_0380_R32_00000
	CloseMsg
	GoToIfSet FLAG_GOT_EGG_FROM_ELMS_ASSISTANT, _03F0
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 475
	GoToIfNe _0381
	ApplyMovement obj_R32_gsmiddleman1, _0478
	ApplyMovement obj_player, _0494
	GoTo _0391

_0381:
	ApplyMovement obj_R32_gsmiddleman1, _0484
	ApplyMovement obj_player, _04A4
_0391:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	CheckBadge BADGE_ZEPHYR, VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _03B9
	NPCMsg msg_0380_R32_00004
	GoTo _03BF

_03B9:
	BufferPlayersName 0
	NPCMsg msg_0380_R32_00002
_03BF:
	CloseMsg
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 475
	GoToIfNe _03E2
	ApplyMovement obj_R32_gsmiddleman1, _04B4
	GoTo _03EA

_03E2:
	ApplyMovement obj_R32_gsmiddleman1, _04C4
_03EA:
	WaitMovement
	ReleaseAll
	End

_03F0:
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4000, 475
	GoToIfNe _0429
	ApplyMovement obj_R32_gsmiddleman1, _04D4
	ApplyMovement obj_player, _04E4
	SetVar VAR_TEMP_x4002, 1
	GoTo _043F

_0429:
	ApplyMovement obj_R32_gsmiddleman1, _04DC
	ApplyMovement obj_player, _04F0
	SetVar VAR_TEMP_x4002, 0
_043F:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	Call _02B5
	Compare VAR_TEMP_x4000, 475
	GoToIfNe _0468
	ApplyMovement obj_R32_gsmiddleman1, _04F8
	WaitMovement
_0468:
	ReleaseAll
	End

	.balign 4, 0
_046C:
	FaceWest
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_0478:
	WalkNormalWest 2
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0484:
	Delay4
	WalkNormalWest
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0494:
	Delay8
	WalkNormalNorth 2
	FaceSouth
	EndMovement

	.balign 4, 0
_04A4:
	Delay4
	WalkNormalNorth 2
	FaceSouth
	EndMovement

	.balign 4, 0
_04B4:
	WalkNormalSouth
	WalkNormalEast 2
	FaceWest
	EndMovement

	.balign 4, 0
_04C4:
	WalkNormalSouth
	WalkNormalEast
	FaceWest
	EndMovement

	.balign 4, 0
_04D4:
	WalkNormalWest
	EndMovement

	.balign 4, 0
_04DC:
	Delay4
	EndMovement

	.balign 4, 0
_04E4:
	Delay8
	FaceEast
	EndMovement

	.balign 4, 0
_04F0:
	FaceEast
	EndMovement

	.balign 4, 0
_04F8:
	WalkNormalEast
	FaceWest
	EndMovement

scr_seq_R32_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0380_R32_00014
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _052D
	NPCMsg msg_0380_R32_00015
	GoTo _0530

_052D:
	NPCMsg msg_0380_R32_00016
_0530:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_R32_009:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0660
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0674
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _05B1
	ApplyMovement obj_player, _0688
	ApplyMovement obj_R32_gsmiddleman1_2, _06D4
	GoTo _05FF

_05B1:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _05CC
	ApplyMovement obj_player, _06A0
	GoTo _05FF

_05CC:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _05EF
	ApplyMovement obj_player, _06C0
	ApplyMovement obj_R32_gsmiddleman1_2, _06D4
	GoTo _05FF

_05EF:
	ApplyMovement obj_player, _06AC
	ApplyMovement obj_R32_gsmiddleman1_2, _06D4
_05FF:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0626
	ApplyMovement obj_partner_poke, _06E0
	WaitMovement
_0626:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 5
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

_0660:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0674:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0688:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_06A0:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_06AC:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_06C0:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_06D4:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_06E0:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R32_006:
	DirectionSignpost msg_0380_R32_00018, 1, 2, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R32_007:
	DirectionSignpost msg_0380_R32_00017, 1, 4, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_R32_008:
	DirectionSignpost msg_0380_R32_00019, 1, 13, VAR_SPECIAL_RESULT
	ScrCmd_057 3
	ScrCmd_058
	ScrCmd_060 VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
