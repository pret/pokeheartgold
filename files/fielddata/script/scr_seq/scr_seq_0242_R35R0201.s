#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_R35R0201.h"
#include "msgdata/msg/msg_0389_R35R0201.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_R35R0201_000
	ScrDef scr_seq_R35R0201_001
	ScrDef scr_seq_R35R0201_002
	ScrDef scr_seq_R35R0201_003
	ScrDef scr_seq_R35R0201_004
	ScrDef scr_seq_R35R0201_005
	ScrDef scr_seq_R35R0201_006
	ScrDef scr_seq_R35R0201_007
	ScrDef scr_seq_R35R0201_008
	ScrDef scr_seq_R35R0201_009
	ScrDef scr_seq_R35R0201_010
	ScrDef scr_seq_R35R0201_011
	ScrDef scr_seq_R35R0201_012
	ScrDefEnd

scr_seq_R35R0201_009:
	End

scr_seq_R35R0201_010:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _00D8
	ApplyMovement obj_R35R0201_counterm_3, _00E0
	WaitMovement
	CallStd std_bug_contest_guard_ask_end
	Compare VAR_UNK_4118, 1
	GoToIfNe _00D2
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0448
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_NATIONAL_PARK_BUG_CATCHING_CONTEST, 0, 40, 86, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Lock obj_partner_poke
	ScrCmd_596 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00C2
	ScrCmd_606
	GoTo _00C4

_00C2:
	ScrCmd_607
_00C4:
	ApplyMovement obj_partner_poke, _00E8
	WaitMovement
	Release obj_partner_poke
_00D2:
	ReleaseAll
	End

	.balign 4, 0
_00D8:
	FaceWest
	EndMovement

	.balign 4, 0
_00E0:
	FaceEast
	EndMovement

	.balign 4, 0
_00E8:
	FaceNorth
	EndMovement

scr_seq_R35R0201_012:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_UNK_4118, 1
	GoToIfNe _010F
	ClearFlag FLAG_UNK_1C4
	SetFlag FLAG_UNK_1C3
	GoTo _0168

_010F:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _012A
	ClearFlag FLAG_UNK_1C4
	SetFlag FLAG_UNK_1C3
	GoTo _0168

_012A:
	Compare VAR_TEMP_x4000, 4
	GoToIfNe _0145
	ClearFlag FLAG_UNK_1C4
	SetFlag FLAG_UNK_1C3
	GoTo _0168

_0145:
	Compare VAR_TEMP_x4000, 6
	GoToIfNe _0160
	ClearFlag FLAG_UNK_1C4
	SetFlag FLAG_UNK_1C3
	GoTo _0168

_0160:
	ClearFlag FLAG_UNK_1C3
	SetFlag FLAG_UNK_1C4
_0168:
	GoToIfUnset FLAG_UNK_189, _0179
	ClearFlag FLAG_UNK_189
	End

_0179:
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _019D
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _019D
	SetFlag FLAG_HIDE_CAMERON
	End

_019D:
	ClearFlag FLAG_HIDE_CAMERON
	End

scr_seq_R35R0201_008:
	ScrCmd_609
	LockAll
	ApplyMovement obj_R35R0201_workman, _029C
	WaitMovement
	GetPlayerCoords VAR_TEMP_x4000, VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 7
	GoToIfNe _01D2
	ApplyMovement obj_R35R0201_workman, _02A4
	GoTo _0210

_01D2:
	Compare VAR_TEMP_x4001, 8
	GoToIfNe _01ED
	ApplyMovement obj_R35R0201_workman, _02B4
	GoTo _0210

_01ED:
	Compare VAR_TEMP_x4001, 10
	GoToIfNe _0208
	ApplyMovement obj_R35R0201_workman, _02C4
	GoTo _0210

_0208:
	ApplyMovement obj_R35R0201_workman, _02D4
_0210:
	WaitMovement
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 56
	ApplyMovement obj_R35R0201_workman, _02E4
	ApplyMovement obj_player, _02EC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0389_R35R0201_00010
	CloseMsg
	Compare VAR_TEMP_x4001, 7
	GoToIfNe _0258
	ApplyMovement obj_R35R0201_workman, _02FC
	GoTo _0296

_0258:
	Compare VAR_TEMP_x4001, 8
	GoToIfNe _0273
	ApplyMovement obj_R35R0201_workman, _0308
	GoTo _0296

_0273:
	Compare VAR_TEMP_x4001, 10
	GoToIfNe _028E
	ApplyMovement obj_R35R0201_workman, _0314
	GoTo _0296

_028E:
	ApplyMovement obj_R35R0201_workman, _0320
_0296:
	WaitMovement
	ReleaseAll
	End

	.balign 4, 0
_029C:
	EmoteExclamationMark
	EndMovement

	.balign 4, 0
_02A4:
	WalkFastWest
	WalkFastNorth 2
	WalkOnSpotFastEast
	EndMovement

	.balign 4, 0
_02B4:
	WalkFastWest
	WalkFastNorth
	WalkOnSpotFastEast
	EndMovement

	.balign 4, 0
_02C4:
	WalkFastWest
	WalkFastSouth
	WalkOnSpotFastEast
	EndMovement

	.balign 4, 0
_02D4:
	WalkFastWest
	WalkFastSouth 2
	WalkOnSpotFastEast
	EndMovement

	.balign 4, 0
_02E4:
	WalkNormalEast
	EndMovement

	.balign 4, 0
_02EC:
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_02FC:
	WalkNormalSouth 2
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0308:
	WalkNormalSouth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0314:
	WalkNormalNorth
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0320:
	WalkNormalNorth 2
	WalkOnSpotNormalEast
	EndMovement

scr_seq_R35R0201_000:
	SimpleNPCMsg msg_0389_R35R0201_00009
	End

scr_seq_R35R0201_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	CallStd std_bug_contest_guard_start
	Compare VAR_UNK_4118, 1
	GoToIfNe _0438
	GoToIfSet FLAG_UNK_1C4, _03C1
	GetPlayerFacing VAR_SPECIAL_RESULT
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _038C
	ApplyMovement obj_player, _043C
	GoTo _03AF

_038C:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _03A7
	ApplyMovement obj_player, _0448
	GoTo _03AF

_03A7:
	ApplyMovement obj_player, _0450
_03AF:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	GoTo _03E3

_03C1:
	GetPlayerFacing VAR_SPECIAL_RESULT
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0460
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
_03E3:
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_NATIONAL_PARK_BUG_CATCHING_CONTEST, 0, 40, 86, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Lock obj_partner_poke
	ScrCmd_596 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0428
	ScrCmd_606
	GoTo _042A

_0428:
	ScrCmd_607
_042A:
	ApplyMovement obj_partner_poke, _00E8
	WaitMovement
	Release obj_partner_poke
_0438:
	ReleaseAll
	End

	.balign 4, 0
_043C:
	WalkNormalEast
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0448:
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0450:
	WalkNormalSouth
	WalkNormalEast 2
	WalkNormalNorth 2
	EndMovement

	.balign 4, 0
_0460:
	WalkNormalEast 2
	WalkNormalNorth 2
	EndMovement

scr_seq_R35R0201_002:
	SimpleNPCMsg msg_0389_R35R0201_00003
	End

scr_seq_R35R0201_011:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _05A7
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _05BB
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _04F8
	ApplyMovement obj_player, _05D0
	ApplyMovement obj_R35R0201_gsmiddleman1, _061C
	GoTo _0546

_04F8:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0513
	ApplyMovement obj_player, _05E8
	GoTo _0546

_0513:
	Compare VAR_SPECIAL_RESULT, 3
	GoToIfNe _0536
	ApplyMovement obj_player, _0608
	ApplyMovement obj_R35R0201_gsmiddleman1, _061C
	GoTo _0546

_0536:
	ApplyMovement obj_player, _05F4
	ApplyMovement obj_R35R0201_gsmiddleman1, _061C
_0546:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _056D
	ApplyMovement obj_partner_poke, _0628
	WaitMovement
_056D:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 12
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

_05A7:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_05BB:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_05D0:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_05E8:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_05F4:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0608:
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_061C:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0628:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_R35R0201_003:
	SimpleNPCMsg msg_0389_R35R0201_00005
	End

scr_seq_R35R0201_004:
	SimpleNPCMsg msg_0389_R35R0201_00006
	End

scr_seq_R35R0201_005:
	SimpleNPCMsg msg_0389_R35R0201_00000
	End

scr_seq_R35R0201_006:
	SimpleNPCMsg msg_0389_R35R0201_00007
	End

scr_seq_R35R0201_007:
	SimpleNPCMsg msg_0389_R35R0201_00008
	End
	.balign 4, 0
