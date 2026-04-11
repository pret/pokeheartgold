#include "constants/events.h"
#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0205.h"
#include "msgdata/msg/msg_0076_D24R0205.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D24R0205_000
	ScrDef scr_seq_D24R0205_001
	ScrDef scr_seq_D24R0205_002
	ScrDef scr_seq_D24R0205_003
	ScrDef scr_seq_D24R0205_004
	ScrDef scr_seq_D24R0205_005
	ScrDef scr_seq_D24R0205_006
	ScrDef scr_seq_D24R0205_007
	ScrDef scr_seq_D24R0205_008
	ScrDef scr_seq_D24R0205_009
	ScrDefEnd

scr_seq_D24R0205_008:
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 10
	GoToIfEq _003D
	GoTo _009D

_003D:
	GetPartyLeadAlive VAR_TEMP_x4005
	Compare VAR_UNK_4102, 1
	GoToIfEq _0061
	Compare VAR_UNK_4102, 2
	GoToIfEq _007F
	GoTo _009D

_0061:
	FollowerPokeIsEventTrigger EVENT_ARCEUS_HALL_OF_ORIGIN, VAR_TEMP_x4005, VAR_TEMP_x4007
	Compare VAR_TEMP_x4007, 1
	CallIfEq _009F
	NopVar490 VAR_TEMP_x4005
	NopVar490 VAR_TEMP_x4007
	End

_007F:
	FollowerPokeIsEventTrigger EVENT_ARCEUS_MOVIE_GIFT, VAR_TEMP_x4005, VAR_TEMP_x4006
	Compare VAR_TEMP_x4006, 1
	CallIfEq _009F
	NopVar490 VAR_TEMP_x4005
	NopVar490 VAR_TEMP_x4006
	End

_009D:
	End

_009F:
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 11
	Return

scr_seq_D24R0205_000:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_GS_RAKKA01
	ApplyMovement obj_player, _018C
	ScrCmd_374 obj_player
	WaitMovement
	ScreenShake 0, 1, 1, 8
	PlaySE SEQ_SE_DP_SUTYA2
	GoToIfSet FLAG_UNK_111, _016F
	GoToIfSet FLAG_GOT_UNOWN_REPORT, _016F
	Wait 5, VAR_SPECIAL_RESULT
	ApplyMovement obj_D24R0205_gsassistantm, _0194
	ApplyMovement obj_D24R0205_gsassistantm_2, _0194
	ApplyMovement obj_D24R0205_gsassistantm_3, _01B8
	ApplyMovement obj_D24R0205_gsassistantm_4, _01B8
	WaitMovement
	NPCMsg msg_0076_D24R0205_00000
	GiveItemNoCheck ITEM_UNOWN_REPORT, 1
	CloseMsg
	ApplyMovement obj_D24R0205_gsassistantm, _01A8
	ApplyMovement obj_D24R0205_gsassistantm_2, _01B0
	ApplyMovement obj_D24R0205_gsassistantm_3, _01CC
	ApplyMovement obj_D24R0205_gsassistantm_4, _01CC
	WaitMovement
	HidePerson obj_D24R0205_gsassistantm
	HidePerson obj_D24R0205_gsassistantm_2
	HidePerson obj_D24R0205_gsassistantm_3
	HidePerson obj_D24R0205_gsassistantm_4
	HidePerson obj_D24R0205_gsbigman
	HidePerson obj_D24R0205_gswoman1
	HidePerson obj_D24R0205_gsoldman1
	SetFlag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	SetFlag FLAG_HIDE_RUINS_OF_ALPH_TOURISTS
	SetFlag FLAG_GOT_UNOWN_REPORT
	NPCMsg msg_0076_D24R0205_00001
	WaitButton
	CloseMsg
_016F:
	SetVar VAR_UNK_40CE, 0
	ReleaseAll
	End

scr_seq_D24R0205_001:
	Compare VAR_UNK_40CE, 1
	GoToIfNe _018A
	MakeObjectVisible obj_player
_018A:
	End

	.balign 4, 0
_018C:
	WarpIn
	EndMovement

	.balign 4, 0
_0194:
	FaceEast
	EmoteExclamationMark
	WalkNormalEast 5
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_01A8:
	WalkNormalWest 10
	EndMovement

	.balign 4, 0
_01B0:
	WalkNormalNorth 10
	EndMovement

	.balign 4, 0
_01B8:
	FaceWest
	EmoteExclamationMark
	WalkNormalWest 5
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_01CC:
	WalkNormalEast 10
	EndMovement

scr_seq_D24R0205_006:
	ScrCmd_609
	LockAll
	ApplyMovement obj_D24R0205_suit, _02B0
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _02FC
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0076_D24R0205_00006
	CloseMsg
	ApplyMovement obj_D24R0205_suit, _02BC
	WaitMovement
	NPCMsg msg_0076_D24R0205_00007
	CloseMsg
	FadeOutBGM 0, 30
	PlaySE SEQ_SE_GS_ZENIGAME_JOURO
	FadeScreen 6, 6, 0, RGB_BLACK
	WaitFade
	Wait 1, VAR_SPECIAL_RESULT
	FadeScreen 6, 6, 1, RGB_BLACK
	WaitFade
	StopSE SEQ_SE_GS_ZENIGAME_JOURO
	ApplyMovement obj_D24R0205_suit, _02E4
	WaitMovement
	NPCMsg msg_0076_D24R0205_00008
	CloseMsg
	PlaySE SEQ_SE_GS_ZENIGAME_JOURO
	FadeScreen 6, 6, 0, RGB_BLACK
	WaitFade
	Wait 1, VAR_SPECIAL_RESULT
	FadeScreen 6, 6, 1, RGB_BLACK
	WaitFade
	StopSE SEQ_SE_GS_ZENIGAME_JOURO
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 3
	SetFlag FLAG_HIDE_ALPH_OUTSIDE_ARCEUS_EVENT_SUIT
	SetFlag FLAG_HIDE_ALPH_MAIN_CHAMBER_ARCEUS_EVENT_PEOPLE
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SINJOH_RUINS_MYSTRI_STAGE, 0, 16, 24, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_02B0:
	WalkNormalWest 4
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_02BC:
	EmoteExclamationMark
	Delay8
	WalkFastNorth 3
	WalkOnSpotNormalNorth
	WalkFastWest 2
	WalkOnSpotNormalNorth
	LockDir
	WalkSlowWest
	UnlockDir
	EndMovement

	.balign 4, 0
_02E4:
	WalkOnSpotNormalEast
	Delay8
	WalkOnSpotNormalWest
	Delay8
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_02FC:
	WalkNormalWest 4
	EndMovement

scr_seq_D24R0205_007:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D24R0205_suit, _0368
	ApplyMovement obj_player, _0398
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_player, _0390
	WaitMovement
	NPCMsg msg_0076_D24R0205_00009
	CloseMsg
	ApplyMovement obj_D24R0205_suit, _0380
	WaitMovement
	NPCMsg msg_0076_D24R0205_00010
	CloseMsg
	ApplyMovement obj_D24R0205_suit, _0388
	WaitMovement
	HidePerson obj_D24R0205_suit
	SetFlag FLAG_HIDE_ALPH_MAIN_CHAMBER_ARCEUS_EVENT_PEOPLE
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 10
	ReleaseAll
	End

	.balign 4, 0
_0368:
	Delay8
	WalkOnSpotNormalWest
	EmoteExclamationMark
	Delay8
	WalkFastWest 3
	EndMovement

	.balign 4, 0
_0380:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0388:
	WalkNormalEast 10
	EndMovement

	.balign 4, 0
_0390:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0398:
	WalkNormalEast
	EndMovement

scr_seq_D24R0205_009:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _045C
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	PlaySE SEQ_SE_GS_ZENIGAME_JOURO
	FadeScreen 6, 6, 0, RGB_BLACK
	WaitFade
	Wait 1, VAR_SPECIAL_RESULT
	FadeScreen 6, 6, 1, RGB_BLACK
	WaitFade
	StopSE SEQ_SE_GS_ZENIGAME_JOURO
	ApplyMovement obj_player, _0468
	WaitMovement
	PlaySE SEQ_SE_GS_ZENIGAME_JOURO
	FadeScreen 6, 6, 0, RGB_BLACK
	WaitFade
	Wait 1, VAR_SPECIAL_RESULT
	FadeScreen 6, 6, 1, RGB_BLACK
	WaitFade
	StopSE SEQ_SE_GS_ZENIGAME_JOURO
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 12
	SetVar VAR_UNK_4104, 1
	SetFlag FLAG_HIDE_SINJOH_MYSTRI_SHRINE_CYNTHIA
	SetFlag FLAG_UNK_2DD
	SetFlag FLAG_UNK_2DB
	PlaySE SEQ_SE_DP_KAIDAN2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SINJOH_RUINS_MYSTRI_STAGE, 0, 16, 24, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ReleaseAll
	End

	.balign 4, 0
_045C:
	WalkNormalWest
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0468:
	WalkOnSpotNormalEast
	Delay8
	WalkOnSpotNormalWest
	Delay8
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_D24R0205_002:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0076_D24R0205_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D24R0205_003:
	SimpleNPCMsg msg_0076_D24R0205_00002
	End

scr_seq_D24R0205_004:
	SimpleNPCMsg msg_0076_D24R0205_00003
	End

scr_seq_D24R0205_005:
	SimpleNPCMsg msg_0076_D24R0205_00004
	End
	.balign 4, 0
