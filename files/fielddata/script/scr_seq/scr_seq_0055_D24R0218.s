#include "constants/events.h"
#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0218.h"
#include "msgdata/msg/msg_0086_D24R0218.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D24R0218_000
	ScrDef scr_seq_D24R0218_001
	ScrDef scr_seq_D24R0218_002
	ScrDef scr_seq_D24R0218_003
	ScrDef scr_seq_D24R0218_004
	ScrDef scr_seq_D24R0218_005
	ScrDef scr_seq_D24R0218_006
	ScrDefEnd

scr_seq_D24R0218_004:
	NopVar490 VAR_TEMP_x4004
	Compare VAR_SCENE_SINJOH_MYSTRI_ROOM, 10
	GoToIfEq _0035
	GoTo _0095

_0035:
	GetPartyLeadAlive VAR_TEMP_x4005
	Compare VAR_UNK_4102, 1
	GoToIfEq _0059
	Compare VAR_UNK_4102, 2
	GoToIfEq _0077
	GoTo _0095

_0059:
	FollowerPokeIsEventTrigger EVENT_ARCEUS_HALL_OF_ORIGIN, VAR_TEMP_x4005, VAR_TEMP_x4007
	Compare VAR_TEMP_x4007, 1
	CallIfEq _0097
	NopVar490 VAR_TEMP_x4005
	NopVar490 VAR_TEMP_x4007
	End

_0077:
	FollowerPokeIsEventTrigger EVENT_ARCEUS_MOVIE_GIFT, VAR_TEMP_x4005, VAR_TEMP_x4006
	Compare VAR_TEMP_x4006, 1
	CallIfEq _0097
	NopVar490 VAR_TEMP_x4005
	NopVar490 VAR_TEMP_x4006
	End

_0095:
	End

_0097:
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 11
	Return

scr_seq_D24R0218_001:
	ScrCmd_609
	LockAll
	ApplyMovement obj_D24R0218_suit, _0178
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _01C4
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	NPCMsg msg_0086_D24R0218_00001
	CloseMsg
	ApplyMovement obj_D24R0218_suit, _0184
	WaitMovement
	NPCMsg msg_0086_D24R0218_00002
	CloseMsg
	FadeOutBGM 0, 30
	PlaySE SEQ_SE_GS_ZENIGAME_JOURO
	FadeScreen 6, 6, 0, RGB_BLACK
	WaitFade
	Wait 1, VAR_SPECIAL_RESULT
	FadeScreen 6, 6, 1, RGB_BLACK
	WaitFade
	StopSE SEQ_SE_GS_ZENIGAME_JOURO
	ApplyMovement obj_D24R0218_suit, _01AC
	WaitMovement
	NPCMsg msg_0086_D24R0218_00003
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
_0178:
	WalkNormalWest 4
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0184:
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
_01AC:
	WalkOnSpotNormalEast
	Delay8
	WalkOnSpotNormalWest
	Delay8
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_01C4:
	WalkNormalWest 4
	EndMovement

scr_seq_D24R0218_002:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_D24R0218_suit, _0230
	ApplyMovement obj_player, _0260
	WaitMovement
	WaitFollowingPokemonMovement
	ToggleFollowingPokemonMovement 1
	FollowingPokemonMovement 48
	ApplyMovement obj_player, _0258
	WaitMovement
	NPCMsg msg_0086_D24R0218_00004
	CloseMsg
	ApplyMovement obj_D24R0218_suit, _0248
	WaitMovement
	NPCMsg msg_0086_D24R0218_00005
	CloseMsg
	ApplyMovement obj_D24R0218_suit, _0250
	WaitMovement
	HidePerson obj_D24R0218_suit
	SetFlag FLAG_HIDE_ALPH_MAIN_CHAMBER_ARCEUS_EVENT_PEOPLE
	SetVar VAR_SCENE_SINJOH_MYSTRI_ROOM, 10
	ReleaseAll
	End

	.balign 4, 0
_0230:
	Delay8
	WalkOnSpotNormalWest
	EmoteExclamationMark
	Delay8
	WalkFastWest 3
	EndMovement

	.balign 4, 0
_0248:
	WalkOnSpotNormalWest
	EndMovement

	.balign 4, 0
_0250:
	WalkNormalEast 10
	EndMovement

	.balign 4, 0
_0258:
	WalkOnSpotNormalEast
	EndMovement

	.balign 4, 0
_0260:
	WalkNormalEast
	EndMovement

scr_seq_D24R0218_003:
	ScrCmd_609
	LockAll
	ToggleFollowingPokemonMovement 0
	WaitFollowingPokemonMovement
	FollowingPokemonMovement 55
	ApplyMovement obj_player, _0324
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
	ApplyMovement obj_player, _0330
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
_0324:
	WalkNormalWest
	WalkNormalSouth
	EndMovement

	.balign 4, 0
_0330:
	WalkOnSpotNormalEast
	Delay8
	WalkOnSpotNormalWest
	Delay8
	WalkOnSpotNormalSouth
	EndMovement

scr_seq_D24R0218_006:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_GS_RAKKA01
	ApplyMovement obj_player, _038C
	ScrCmd_374 obj_player
	WaitMovement
	ScreenShake 0, 1, 1, 8
	PlaySE SEQ_SE_DP_SUTYA2
	SetVar VAR_UNK_40CE, 0
	ReleaseAll
	End

scr_seq_D24R0218_005:
	Compare VAR_UNK_40CE, 1
	GoToIfNe _0387
	MakeObjectVisible obj_player
_0387:
	End

	.balign 4, 0
_038C:
	WarpIn
	EndMovement

scr_seq_D24R0218_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	NPCMsg msg_0086_D24R0218_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
