#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D22R0101.h"
#include "msgdata/msg/msg_0062_D22R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D22R0101_000
	ScrDef scr_seq_D22R0101_001
	ScrDef scr_seq_D22R0101_002
	ScrDef scr_seq_D22R0101_003
	ScrDef scr_seq_D22R0101_004
	ScrDef scr_seq_D22R0101_005
	ScrDef scr_seq_D22R0101_006
	ScrDef scr_seq_D22R0101_007
	ScrDef scr_seq_D22R0101_008
	ScrDef scr_seq_D22R0101_009
	ScrDef scr_seq_D22R0101_010
	ScrDef scr_seq_D22R0101_011
	ScrDef scr_seq_D22R0101_012
	ScrDef scr_seq_D22R0101_013
	ScrDef scr_seq_D22R0101_014
	ScrDef scr_seq_D22R0101_015
	ScrDef scr_seq_D22R0101_016
	ScrDef scr_seq_D22R0101_017
	ScrDef scr_seq_D22R0101_018
	ScrDef scr_seq_D22R0101_019
	ScrDef scr_seq_D22R0101_020
	ScrDef scr_seq_D22R0101_021
	ScrDef scr_seq_D22R0101_022
	ScrDef scr_seq_D22R0101_023
	ScrDef scr_seq_D22R0101_024
	ScrDef scr_seq_D22R0101_025
	ScrDef scr_seq_D22R0101_026
	ScrDefEnd

scr_seq_D22R0101_011:
	Compare VAR_UNK_40F7, 1
	CallIfEq _007D
	End

_007D:
	MovePersonFacing obj_D22R0101_counterm, 51, 0, 48, DIR_SOUTH
	SetVar VAR_TEMP_x4000, 0
	SetVar VAR_TEMP_x4001, 10
	SetVar VAR_TEMP_x4002, 48
	ScriptOverlayCmd 1, 0
_009F:
	IsBugContestantRegistered VAR_TEMP_x4000, VAR_TEMP_x4004
	Compare VAR_TEMP_x4004, 1
	GoToIfNe _00C4
	MovePersonFacing VAR_TEMP_x4001, VAR_TEMP_x4002, 0, 50, DIR_NORTH
	AddVar VAR_TEMP_x4002, 2
_00C4:
	AddVar VAR_TEMP_x4000, 1
	AddVar VAR_TEMP_x4001, 1
	Compare VAR_TEMP_x4000, 10
	GoToIfLt _009F
	ScriptOverlayCmd 1, 1
	Return

scr_seq_D22R0101_025:
	GoToIfUnset FLAG_UNK_189, _00F4
	ClearFlag FLAG_UNK_189
	End

_00F4:
	Compare VAR_UNK_40F7, 1
	GoToIfEq _0162
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _0154
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _0154
	Compare VAR_TEMP_x4000, 2
	GoToIfEq _0162
	Compare VAR_TEMP_x4000, 4
	GoToIfEq _0162
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _0162
	SetFlag FLAG_HIDE_CAMERON
	ClearFlag FLAG_UNK_27F
	GoTo _016E

_0154:
	ClearFlag FLAG_HIDE_CAMERON
	SetFlag FLAG_UNK_27F
	GoTo _016E

_0162:
	SetFlag FLAG_HIDE_CAMERON
	SetFlag FLAG_UNK_27F
	ClearFlag FLAG_UNK_996
_016E:
	GoToIfSet FLAG_GAME_CLEAR, _017F
	SetFlag FLAG_UNK_288
	End

_017F:
	GetPhoneBookRematch PHONE_CONTACT_BUGSY, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 0
	GoToIfNe _01C9
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfEq _01C3
	Compare VAR_TEMP_x4000, 3
	GoToIfEq _01C3
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _01C3
	SetFlag FLAG_UNK_288
	End

_01C3:
	ClearFlag FLAG_UNK_288
	End

_01C9:
	SetFlag FLAG_UNK_288
	End

scr_seq_D22R0101_012:
	SimpleNPCMsg msg_0062_D22R0101_00045
	End

scr_seq_D22R0101_013:
	SimpleNPCMsg msg_0062_D22R0101_00048
	End

scr_seq_D22R0101_014:
	SimpleNPCMsg msg_0062_D22R0101_00051
	End

scr_seq_D22R0101_015:
	SimpleNPCMsg msg_0062_D22R0101_00054
	End

scr_seq_D22R0101_016:
	SimpleNPCMsg msg_0062_D22R0101_00057
	End

scr_seq_D22R0101_017:
	SimpleNPCMsg msg_0062_D22R0101_00060
	End

scr_seq_D22R0101_018:
	SimpleNPCMsg msg_0062_D22R0101_00063
	End

scr_seq_D22R0101_019:
	SimpleNPCMsg msg_0062_D22R0101_00066
	End

scr_seq_D22R0101_020:
	SimpleNPCMsg msg_0062_D22R0101_00069
	End

scr_seq_D22R0101_021:
	SimpleNPCMsg msg_0062_D22R0101_00072
	End

scr_seq_D22R0101_022:
	SimpleNPCMsg msg_0062_D22R0101_00042
	End

scr_seq_D22R0101_026:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _02C7
	BufferPlayersName 0
	NPCMsg msg_0062_D22R0101_00084
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02C7:
	BufferPlayersName 0
	NPCMsg msg_0062_D22R0101_00085
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _032B
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0336
	NPCMsg msg_0062_D22R0101_00086
	CloseMsg
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 7
	FacePlayer
	LockAll
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ClearFlag FLAG_UNK_189
	NPCMsg msg_0062_D22R0101_00087
	WaitButton
	CloseMsg
	ReleaseAll
	End

_032B:
	NPCMsg msg_0062_D22R0101_00088
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0336:
	NPCMsg msg_0062_D22R0101_00089
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D22R0101_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_GOT_QUICK_CLAW_FROM_NATIONAL_PARK_WOMAN, _0380
	NPCMsg msg_0062_D22R0101_00002
	GoToIfNoItemSpace ITEM_QUICK_CLAW, 1, _038B
	CallStd std_give_item_verbose
	SetFlag FLAG_GOT_QUICK_CLAW_FROM_NATIONAL_PARK_WOMAN
_0380:
	NPCMsg msg_0062_D22R0101_00004
	WaitButton
	CloseMsg
	ReleaseAll
	End

_038B:
	CallStd std_bag_is_full
	CloseMsg
	ReleaseAll
	End

scr_seq_D22R0101_023:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0650
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0664
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _040E
	ApplyMovement obj_player, _04C0
	ApplyMovement obj_D22R0101_gsmiddleman1_3, _050C
	GoTo _045C

_040E:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0429
	ApplyMovement obj_player, _04D8
	GoTo _045C

_0429:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _044C
	ApplyMovement obj_player, _04F8
	ApplyMovement obj_D22R0101_gsmiddleman1_3, _050C
	GoTo _045C

_044C:
	ApplyMovement obj_player, _04E4
	ApplyMovement obj_D22R0101_gsmiddleman1_3, _050C
_045C:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0483
	ApplyMovement obj_partner_poke, _0518
	WaitMovement
_0483:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 16
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

	.balign 4, 0
_04C0:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04D8:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04E4:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_04F8:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_050C:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0518:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_D22R0101_024:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0650
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0664
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _05A1
	ApplyMovement obj_player, _04C0
	ApplyMovement obj_D22R0101_gsmiddleman1_4, _050C
	GoTo _05EF

_05A1:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _05BC
	ApplyMovement obj_player, _04D8
	GoTo _05EF

_05BC:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _05DF
	ApplyMovement obj_player, _0678
	ApplyMovement obj_D22R0101_gsmiddleman1_4, _050C
	GoTo _05EF

_05DF:
	ApplyMovement obj_player, _04E4
	ApplyMovement obj_D22R0101_gsmiddleman1_4, _050C
_05EF:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0616
	ApplyMovement obj_partner_poke, _0518
	WaitMovement
_0616:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 17
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

_0650:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0664:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0678:
	WalkNormalSouth
	WalkNormalEast 2
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 2
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_D22R0101_001:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0062_D22R0101_00022, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D22R0101_002:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0062_D22R0101_00023, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D22R0101_003:
	ScrCmd_055 3, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0062_D22R0101_00024, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D22R0101_004:
	SimpleNPCMsg msg_0062_D22R0101_00000
	End

scr_seq_D22R0101_005:
	SimpleNPCMsg msg_0062_D22R0101_00001
	End

scr_seq_D22R0101_006:
	SimpleNPCMsg msg_0062_D22R0101_00005
	End

scr_seq_D22R0101_007:
	SimpleNPCMsg msg_0062_D22R0101_00006
	End

scr_seq_D22R0101_008:
	SimpleNPCMsg msg_0062_D22R0101_00009
	End

scr_seq_D22R0101_009:
	SimpleNPCMsg msg_0062_D22R0101_00007
	End

scr_seq_D22R0101_010:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	NPCMsg msg_0062_D22R0101_00008
	PlayCry SPECIES_PERSIAN, 0
	WaitCry
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0760:
	End

	.balign 4, 0
