#include "constants/events.h"
#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0101.h"
#include "msgdata/msg/msg_0072_D24R0101.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D24R0101_000
	ScrDef scr_seq_D24R0101_001
	ScrDef scr_seq_D24R0101_002
	ScrDef scr_seq_D24R0101_003
	ScrDef scr_seq_D24R0101_004
	ScrDef scr_seq_D24R0101_005
	ScrDef scr_seq_D24R0101_006
	ScrDef scr_seq_D24R0101_007
	ScrDefEnd

scr_seq_D24R0101_006:
	Compare VAR_UNOWN_REPORT_LEVEL, 7
	GoToIfGe _005E
	Compare VAR_UNOWN_REPORT_LEVEL, 6
	GoToIfEq _0080
_003C:
	MoveWarp 11, 418, 284
	MoveWarp 12, 419, 284
	MoveWarp 13, 418, 284
	MoveWarp 14, 419, 284
	End

_005E:
	MoveWarp 8, 418, 284
	MoveWarp 9, 419, 284
	MoveWarp 11, 418, 284
	MoveWarp 12, 419, 284
	End

_0080:
	MoveWarp 8, 418, 284
	MoveWarp 9, 419, 284
	MoveWarp 13, 418, 284
	MoveWarp 14, 419, 284
	End

scr_seq_D24R0101_005:
	GoToIfUnset FLAG_UNK_189, _00B3
	ClearFlag FLAG_UNK_189
	End

_00B3:
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 9
	GoToIfGe _00C6
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 1
_00C6:
	CheckBadge BADGE_PLAIN, VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _0104
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 5
	GoToIfEq _010E
	Compare VAR_TEMP_x4000, 6
	GoToIfEq _010E
	Compare VAR_TEMP_x4000, 0
	GoToIfEq _010E
_0104:
	SetFlag FLAG_HIDE_CAMERON
	GoTo _0112

_010E:
	ClearFlag FLAG_HIDE_CAMERON
_0112:
	Compare VAR_UNOWN_REPORT_LEVEL, 7
	GoToIfGe _005E
	Compare VAR_UNOWN_REPORT_LEVEL, 6
	GoToIfEq _0080
	GoTo _003C
	End

scr_seq_D24R0101_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 0
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0239
	PhotoAlbumIsFull VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _024D
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 1
	CloseMsg
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01AD
	ApplyMovement obj_player, _0264
	ApplyMovement obj_D24R0101_gsmiddleman1, _029C
	GoTo _01D8

_01AD:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01C8
	ApplyMovement obj_player, _027C
	GoTo _01D8

_01C8:
	ApplyMovement obj_player, _0288
	ApplyMovement obj_D24R0101_gsmiddleman1, _029C
_01D8:
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _01FF
	ApplyMovement obj_partner_poke, _02A8
	WaitMovement
_01FF:
	SetFlag FLAG_UNK_189
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CameronPhoto 3
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

_0239:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 5
	WaitButton
	CloseMsg
	ReleaseAll
	End

_024D:
	GetStdMsgNaix 2, VAR_SPECIAL_RESULT
	MsgBoxExtern VAR_SPECIAL_RESULT, 3
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0264:
	WalkNormalEast
	WalkNormalNorth 2
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_027C:
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0288:
	WalkNormalNorth
	WalkNormalWest
	WalkNormalNorth 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_029C:
	Delay8
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_02A8:
	WalkNormalEast
	WalkNormalNorth
	FaceSouth
	EndMovement

scr_seq_D24R0101_007:
	ScrCmd_609
	LockAll
	GetPartyLeadAlive VAR_TEMP_x4005
	FollowerPokeIsEventTrigger EVENT_ARCEUS_MOVIE_GIFT, VAR_TEMP_x4005, VAR_TEMP_x4006
	Compare VAR_TEMP_x4006, 0
	GoToIfEq _02DA
	GoTo _02EE

_02DA:
	FollowerPokeIsEventTrigger EVENT_ARCEUS_HALL_OF_ORIGIN, VAR_TEMP_x4005, VAR_TEMP_x4007
	Compare VAR_TEMP_x4007, 0
	GoToIfEq _0530
_02EE:
	PlayerOnBikeCheck VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0530
	ScrCmd_307 13, 8, 25, 29, 77
	ScrCmd_310 77
	ScrCmd_308 77
	ClearFlag FLAG_HIDE_ALPH_OUTSIDE_ARCEUS_EVENT_SUIT
	ShowPerson obj_D24R0101_suit
	ScrCmd_311 77
	ScrCmd_308 77
	ScrCmd_309 77
	ApplyMovement obj_D24R0101_suit, _0534
	ApplyMovement obj_player, _05C4
	GetPlayerFacing VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 3
	GoToIfNe _0350
	ApplyMovement obj_partner_poke, _05DC
	GoTo _0373

_0350:
	Compare VAR_TEMP_x4001, 2
	GoToIfNe _036B
	ApplyMovement obj_partner_poke, _05F4
	GoTo _0373

_036B:
	ApplyMovement obj_partner_poke, _0604
_0373:
	WaitMovement
	NPCMsg msg_0072_D24R0101_00001
	CloseMsg
	ApplyMovement obj_D24R0101_suit, _054C
	Compare VAR_TEMP_x4001, 3
	GoToIfNe _039D
	ApplyMovement obj_partner_poke, _0614
	GoTo _03C0

_039D:
	Compare VAR_TEMP_x4001, 2
	GoToIfNe _03B8
	ApplyMovement obj_partner_poke, _0624
	GoTo _03C0

_03B8:
	ApplyMovement obj_partner_poke, _0630
_03C0:
	WaitMovement
	NPCMsg msg_0072_D24R0101_00002
	CloseMsg
	Compare VAR_TEMP_x4001, 3
	GoToIfNe _03E2
	ApplyMovement obj_D24R0101_suit, _0554
	GoTo _03EA

_03E2:
	ApplyMovement obj_D24R0101_suit, _0570
_03EA:
	WaitMovement
	NPCMsg msg_0072_D24R0101_00003
	CloseMsg
	ApplyMovement obj_D24R0101_suit, _0584
	WaitMovement
	NPCMsg msg_0072_D24R0101_00004
	CloseMsg
	ApplyMovement obj_D24R0101_suit, _05A4
	WaitMovement
	NPCMsg msg_0072_D24R0101_00005
	CloseMsg
	ApplyMovement obj_D24R0101_suit, _05B4
	WaitMovement
	NPCMsg msg_0072_D24R0101_00006
	CloseMsg
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 2
	SetFlag FLAG_HIDE_ALPH_OUTSIDE_ARCEUS_EVENT_SUIT
	ClearFlag FLAG_HIDE_ALPH_MAIN_CHAMBER_ARCEUS_EVENT_PEOPLE
	PlaySE SEQ_SE_DP_KAIDAN2
	Compare VAR_UNOWN_REPORT_LEVEL, 6
	GoToIfNe _0467
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT, 0, 15, 24, DIR_WEST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _0530

_0467:
	Compare VAR_UNOWN_REPORT_LEVEL, 7
	GoToIfNe _049E
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 15, 24, DIR_WEST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _0530

_049E:
	Compare VAR_UNOWN_REPORT_LEVEL, 8
	GoToIfNe _04D5
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 15, 24, DIR_WEST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _0530

_04D5:
	Compare VAR_UNOWN_REPORT_LEVEL, 9
	GoToIfNe _050C
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 15, 24, DIR_WEST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _0530

_050C:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 15, 24, DIR_WEST
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0530:
	ReleaseAll
	End

	.balign 4, 0
_0534:
	Delay4
	WalkFastSouth 3
	LockDir
	WalkFasterNorth
	UnlockDir
	EndMovement

	.balign 4, 0
_054C:
	WalkFastSouth
	EndMovement

	.balign 4, 0
_0554:
	WalkOnSpotFastWest
	EmoteExclamationMark
	Delay8
	LockDir
	WalkNormalEast
	UnlockDir
	EndMovement

	.balign 4, 0
_0570:
	EmoteExclamationMark
	Delay8
	WalkNormalEast
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_0584:
	WalkNormalEast
	WalkNormalWest 2
	Delay8
	WalkNormalEast 2
	WalkOnSpotFastEast
	WalkNormalWest
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_05A4:
	EmoteExclamationMark
	Delay8
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_05B4:
	WalkNormalWest
	WalkNormalSouth
	WalkOnSpotFastSouth
	EndMovement

	.balign 4, 0
_05C4:
	LockDir
	JumpFarSouth
	WalkFastSouth 2
	UnlockDir
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_05DC:
	LockDir
	WalkFastWest
	UnlockDir
	Delay8 2
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_05F4:
	JumpOnSpotFastWest
	Delay8 3
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0604:
	LockDir
	WalkFastSouth 5
	UnlockDir
	EndMovement

	.balign 4, 0
_0614:
	WalkNormalSouth 3
	WalkNormalEast
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0624:
	WalkNormalSouth 4
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_0630:
	Delay8 2
	WalkNormalNorth
	WalkNormalEast
	WalkNormalNorth
	EndMovement

scr_seq_D24R0101_000:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0072_D24R0101_00010, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D24R0101_001:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0072_D24R0101_00009, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D24R0101_002:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0072_D24R0101_00007, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End

scr_seq_D24R0101_003:
	ScrCmd_055 2, 0
	ScrCmd_057 3
	ScrCmd_058
	TrainerTips msg_0072_D24R0101_00008, VAR_SPECIAL_RESULT
	CallStd std_signpost
	End
	.balign 4, 0
