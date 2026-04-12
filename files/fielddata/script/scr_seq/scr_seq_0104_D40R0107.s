#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D40R0107.h"
#include "msgdata/msg/msg_0125_D40R0107.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D40R0107_000
	ScrDef scr_seq_D40R0107_001
	ScrDef scr_seq_D40R0107_002
	ScrDef scr_seq_D40R0107_003
	ScrDef scr_seq_D40R0107_004
	ScrDef scr_seq_D40R0107_005
	ScrDef scr_seq_D40R0107_006
	ScrDefEnd

scr_seq_D40R0107_006:
	SetVar VAR_TEMP_x4003, 111
	SetFlag FLAG_UNK_105
	End

scr_seq_D40R0107_002:
	SetFlag FLAG_UNK_99A
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _003B
	End

_003B:
	SetFlag FLAG_HIDE_WHIRL_ISLAND_LUGIA
	HidePerson obj_D40R0107_lug_obj01
	HidePerson obj_D40R0107_stop
	HidePerson obj_D40R0107_stop_2
	HidePerson obj_D40R0107_stop_3
	HidePerson obj_D40R0107_stop_4
	HidePerson obj_D40R0107_stop_5
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

scr_seq_D40R0107_004:
	GoToIfSet FLAG_HIDE_WHIRL_ISLAND_LUGIA, _007C
	MakeObjectVisible obj_D40R0107_stop
	MakeObjectVisible obj_D40R0107_stop_2
	MakeObjectVisible obj_D40R0107_stop_3
	MakeObjectVisible obj_D40R0107_stop_4
	MakeObjectVisible obj_D40R0107_stop_5
_007C:
	Compare VAR_TEMP_x400B, 123
	GoToIfNe _0093
	StopSE SEQ_SE_GS_N_TAKI
	SetVar VAR_TEMP_x400B, 0
_0093:
	GoToIfSet FLAG_UNK_109, _00FA
	GoToIfUnset FLAG_UNK_10B, _00FA
	Compare VAR_TEMP_x4003, 111
	GoToIfNe _00FA
	MovePersonFacing obj_D40R0107_dancer_5, 16, 1, 32, DIR_NORTH
	MovePersonFacing obj_D40R0107_dancer_3, 13, 1, 33, DIR_NORTH
	MovePersonFacing obj_D40R0107_dancer_4, 13, 1, 27, DIR_NORTH
	MovePersonFacing obj_D40R0107_dancer, 19, 1, 33, DIR_NORTH
	MovePersonFacing obj_D40R0107_dancer_2, 19, 1, 27, DIR_NORTH
	SetVar VAR_TEMP_x4003, 0
	End

_00FA:
	End

scr_seq_D40R0107_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x400A, 249
	PlayCry VAR_TEMP_x400A, 0
	NPCMsg msg_0125_D40R0107_00004
	WaitCry
	CloseMsg
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _0134
	SetVar VAR_SPECIAL_x8004, 70
	GoTo _013A

_0134:
	SetVar VAR_SPECIAL_x8004, 45
_013A:
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle VAR_TEMP_x400A, VAR_SPECIAL_x8004, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	GetStaticEncounterOutcome VAR_TEMP_x4005
	Compare VAR_TEMP_x4005, 2
	GoToIfEq _019E
	Compare VAR_TEMP_x4005, 3
	GoToIfEq _019E
	Compare VAR_TEMP_x4005, 4
	CallIfEq _01A8
	ReleaseAll
	SetFlag FLAG_UNK_109
	SetVar VAR_SCENE_NEW_BARK_EAST_EXIT, 3
	SetFlag FLAG_HIDE_NEW_BARK_FRIEND
	SetFlag FLAG_HIDE_NEW_BARK_MARILL
	SetFlag FLAG_HIDE_NEW_BARK_FRIEND_2
	ClearFlag FLAG_HIDE_NEW_BARK_FRIENDS_ROOM_FRIEND
	SetFlag FLAG_HIDE_WHIRL_ISLANDS_BOTTOM_KIMONO_GIRLS
	ClearFlag FLAG_HIDE_DANCE_STUDIO_KIMONO_GIRLS
	ClearFlag FLAG_UNK_241
	End

_019E:
	ClearFlag FLAG_HIDE_WHIRL_ISLAND_LUGIA
	WhiteOut
	ReleaseAll
	End

_01A8:
	SetFlag FLAG_CAUGHT_LUGIA
	Return

scr_seq_D40R0107_005:
	ScrCmd_609
	LockAll
	ApplyMovement obj_player, _0964
	WaitMovement
	ScrCmd_805
	ApplyMovement obj_D40R0107_dancer_5, _09A8
	WaitMovement
	NPCMsg msg_0125_D40R0107_00000
	CloseMsg
	StopSE SEQ_SE_GS_N_TAKI
	FadeScreen 4, 4, 0, RGB_WHITE
	WaitFade
	LegendCutsceneClearBellAnimBegin
	LegendCutsceneClearBellRiseFromBag
	PlaySE SEQ_SE_GS_SUZUSYUTUGEN_RU
	FadeScreen 4, 4, 1, RGB_WHITE
	WaitFade
	WaitSE SEQ_SE_GS_SUZUSYUTUGEN_RU
	ApplyMovement obj_D40R0107_dancer_5, _096C
	ApplyMovement obj_D40R0107_dancer_3, _0978
	ApplyMovement obj_D40R0107_dancer_4, _0984
	ApplyMovement obj_D40R0107_dancer, _0990
	ApplyMovement obj_D40R0107_dancer_2, _099C
	WaitMovement
	Wait 16, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _09A8
	ApplyMovement obj_D40R0107_dancer_3, _09A8
	ApplyMovement obj_D40R0107_dancer_4, _09A8
	ApplyMovement obj_D40R0107_dancer, _09A8
	ApplyMovement obj_D40R0107_dancer_2, _09A8
	WaitMovement
	Wait 16, VAR_SPECIAL_RESULT
	StopBGM 0
	TempBGM SEQ_GS_E_MAIKO_MAI
	Wait 18, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _09B8
	ApplyMovement obj_D40R0107_dancer_3, _09B8
	ApplyMovement obj_D40R0107_dancer_4, _09B8
	ApplyMovement obj_D40R0107_dancer, _09B8
	ApplyMovement obj_D40R0107_dancer_2, _09B8
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 1
	PlaySE SEQ_SE_GS_SUZUNOONPA_RU
	WaitMovement
	Wait 67, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _09B8
	ApplyMovement obj_D40R0107_dancer_3, _09B8
	ApplyMovement obj_D40R0107_dancer_4, _09B8
	ApplyMovement obj_D40R0107_dancer, _09B8
	ApplyMovement obj_D40R0107_dancer_2, _09B8
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 1
	PlaySE SEQ_SE_GS_SUZUNOONPA_RU
	WaitMovement
	FadeScreen 4, 6, 1, RGB_WHITE
	LegendCutsceneWavesOrLeavesEffectBegin
	WaitFade
	Wait 6, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _0B34
	ApplyMovement obj_D40R0107_dancer_3, _0B34
	ApplyMovement obj_D40R0107_dancer_4, _0B24
	ApplyMovement obj_D40R0107_dancer, _0B1C
	ApplyMovement obj_D40R0107_dancer_2, _0B2C
	WaitMovement
	ApplyMovement obj_D40R0107_dancer_5, _0A48
	ApplyMovement obj_D40R0107_dancer_3, _0A48
	ApplyMovement obj_D40R0107_dancer_4, _0A00
	ApplyMovement obj_D40R0107_dancer, _09DC
	ApplyMovement obj_D40R0107_dancer_2, _0A24
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 1
	PlaySE SEQ_SE_GS_SUZUNOONPA_RU
	WaitMovement
	Wait 32, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _0B1C
	ApplyMovement obj_D40R0107_dancer_3, _0B34
	ApplyMovement obj_D40R0107_dancer_4, _0B24
	ApplyMovement obj_D40R0107_dancer, _0B1C
	ApplyMovement obj_D40R0107_dancer_2, _0B2C
	WaitMovement
	ApplyMovement obj_D40R0107_dancer_5, _09DC
	ApplyMovement obj_D40R0107_dancer_3, _0A48
	ApplyMovement obj_D40R0107_dancer_4, _0A00
	ApplyMovement obj_D40R0107_dancer, _09DC
	ApplyMovement obj_D40R0107_dancer_2, _0A24
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 1
	PlaySE SEQ_SE_GS_SUZUNOONPA_RU
	WaitMovement
	Wait 33, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _0B1C
	ApplyMovement obj_D40R0107_dancer_3, _0B34
	ApplyMovement obj_D40R0107_dancer_4, _0B24
	ApplyMovement obj_D40R0107_dancer, _0B1C
	ApplyMovement obj_D40R0107_dancer_2, _0B2C
	WaitMovement
	ApplyMovement obj_D40R0107_dancer_5, _09DC
	ApplyMovement obj_D40R0107_dancer_3, _0AF0
	ApplyMovement obj_D40R0107_dancer_4, _0A98
	ApplyMovement obj_D40R0107_dancer, _0A6C
	ApplyMovement obj_D40R0107_dancer_2, _0AC4
	Wait 15, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 1
	PlaySE SEQ_SE_GS_SUZUNOONPA_RU
	WaitMovement
	Wait 32, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _0B2C
	ApplyMovement obj_D40R0107_dancer_3, _0B1C
	ApplyMovement obj_D40R0107_dancer_4, _0B34
	ApplyMovement obj_D40R0107_dancer, _0B2C
	ApplyMovement obj_D40R0107_dancer_2, _0B24
	WaitMovement
	ApplyMovement obj_D40R0107_dancer_5, _0A24
	ApplyMovement obj_D40R0107_dancer_3, _09DC
	ApplyMovement obj_D40R0107_dancer_4, _0A48
	ApplyMovement obj_D40R0107_dancer, _0A24
	ApplyMovement obj_D40R0107_dancer_2, _0A00
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 1
	PlaySE SEQ_SE_GS_SUZUNOONPA_RU
	WaitMovement
	LegendCutsceneWavesOrLeavesEffectEnd
	LegendCutscenePanCameraTo 0
	Wait 32, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _0B2C
	ApplyMovement obj_D40R0107_dancer_3, _0B1C
	ApplyMovement obj_D40R0107_dancer_4, _0B34
	ApplyMovement obj_D40R0107_dancer, _0B2C
	ApplyMovement obj_D40R0107_dancer_2, _0B24
	WaitMovement
	ApplyMovement obj_D40R0107_dancer_5, _0A24
	ApplyMovement obj_D40R0107_dancer_3, _09DC
	ApplyMovement obj_D40R0107_dancer_4, _0A48
	ApplyMovement obj_D40R0107_dancer, _0A24
	ApplyMovement obj_D40R0107_dancer_2, _0A00
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	WaitMovement
	Wait 29, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _0B24
	ApplyMovement obj_D40R0107_dancer_3, _0B1C
	ApplyMovement obj_D40R0107_dancer_4, _0B34
	ApplyMovement obj_D40R0107_dancer, _0B2C
	ApplyMovement obj_D40R0107_dancer_2, _0B24
	WaitMovement
	ApplyMovement obj_D40R0107_dancer_5, _0A00
	ApplyMovement obj_D40R0107_dancer_3, _0A6C
	ApplyMovement obj_D40R0107_dancer_4, _0AF0
	ApplyMovement obj_D40R0107_dancer, _0AC4
	ApplyMovement obj_D40R0107_dancer_2, _0A98
	Wait 15, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	WaitMovement
	Wait 41, VAR_SPECIAL_RESULT
	LegendCutsceneWaitCameraPan
	Wait 16, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	LegendCutsceneMoveCameraTo 1
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	ApplyMovement obj_D40R0107_dancer_5, _0A00
	ApplyMovement obj_D40R0107_dancer_3, _0A24
	ApplyMovement obj_D40R0107_dancer_4, _09DC
	ApplyMovement obj_D40R0107_dancer, _0A00
	ApplyMovement obj_D40R0107_dancer_2, _0A48
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	WaitMovement
	Wait 32, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _0B24
	ApplyMovement obj_D40R0107_dancer_3, _0B2C
	ApplyMovement obj_D40R0107_dancer_4, _0B1C
	ApplyMovement obj_D40R0107_dancer, _0B24
	ApplyMovement obj_D40R0107_dancer_2, _0B34
	WaitMovement
	ApplyMovement obj_D40R0107_dancer_5, _0A00
	ApplyMovement obj_D40R0107_dancer_3, _0A24
	ApplyMovement obj_D40R0107_dancer_4, _09DC
	ApplyMovement obj_D40R0107_dancer, _0A00
	ApplyMovement obj_D40R0107_dancer_2, _0A48
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	WaitMovement
	Wait 29, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _0B34
	ApplyMovement obj_D40R0107_dancer_3, _0B2C
	ApplyMovement obj_D40R0107_dancer_4, _0B1C
	ApplyMovement obj_D40R0107_dancer, _0B24
	ApplyMovement obj_D40R0107_dancer_2, _0B34
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	LegendCutsceneMoveCameraTo 2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	WaitMovement
	ApplyMovement obj_D40R0107_dancer_5, _0A48
	ApplyMovement obj_D40R0107_dancer_3, _0A24
	ApplyMovement obj_D40R0107_dancer_4, _09DC
	ApplyMovement obj_D40R0107_dancer, _0A00
	ApplyMovement obj_D40R0107_dancer_2, _0A48
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	WaitMovement
	Wait 32, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _0B34
	ApplyMovement obj_D40R0107_dancer_3, _0B2C
	ApplyMovement obj_D40R0107_dancer_4, _0B1C
	ApplyMovement obj_D40R0107_dancer, _0B24
	ApplyMovement obj_D40R0107_dancer_2, _0B34
	WaitMovement
	ApplyMovement obj_D40R0107_dancer_5, _0A48
	ApplyMovement obj_D40R0107_dancer_3, _0A24
	ApplyMovement obj_D40R0107_dancer_4, _09DC
	ApplyMovement obj_D40R0107_dancer, _0A00
	ApplyMovement obj_D40R0107_dancer_2, _0A48
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	WaitMovement
	Wait 38, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _0B1C
	ApplyMovement obj_D40R0107_dancer_3, _0B24
	ApplyMovement obj_D40R0107_dancer_4, _0B2C
	ApplyMovement obj_D40R0107_dancer, _0B34
	ApplyMovement obj_D40R0107_dancer_2, _0B1C
	WaitMovement
	ApplyMovement obj_D40R0107_dancer_5, _09DC
	ApplyMovement obj_D40R0107_dancer_3, _0A00
	ApplyMovement obj_D40R0107_dancer_4, _0A24
	ApplyMovement obj_D40R0107_dancer, _0A48
	ApplyMovement obj_D40R0107_dancer_2, _09DC
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	WaitMovement
	LegendCutscenePanCameraTo 1
	Wait 32, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _0B1C
	ApplyMovement obj_D40R0107_dancer_3, _0B24
	ApplyMovement obj_D40R0107_dancer_4, _0B2C
	ApplyMovement obj_D40R0107_dancer, _0B34
	ApplyMovement obj_D40R0107_dancer_2, _0B1C
	WaitMovement
	ApplyMovement obj_D40R0107_dancer_5, _09DC
	ApplyMovement obj_D40R0107_dancer_3, _0A00
	ApplyMovement obj_D40R0107_dancer_4, _0A24
	ApplyMovement obj_D40R0107_dancer, _0A48
	ApplyMovement obj_D40R0107_dancer_2, _09DC
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	WaitMovement
	FadeOutBGM 0, 100
	StopBGM 0
	Wait 32, VAR_SPECIAL_RESULT
	ApplyMovement obj_D40R0107_dancer_5, _0B2C
	ApplyMovement obj_D40R0107_dancer_3, _0B24
	ApplyMovement obj_D40R0107_dancer_4, _0B2C
	ApplyMovement obj_D40R0107_dancer, _0B34
	ApplyMovement obj_D40R0107_dancer_2, _0B1C
	WaitMovement
	ApplyMovement obj_D40R0107_dancer_5, _0A24
	ApplyMovement obj_D40R0107_dancer_3, _0A00
	ApplyMovement obj_D40R0107_dancer_4, _0A24
	ApplyMovement obj_D40R0107_dancer, _0A48
	ApplyMovement obj_D40R0107_dancer_2, _09DC
	Wait 12, VAR_SPECIAL_RESULT
	WaitMovement
	LegendCutsceneWaitCameraPan
	Wait 32, VAR_SPECIAL_RESULT
	TempBGM SEQ_GS_E_LUGIA
	Wait 48, VAR_SPECIAL_RESULT
	ScreenShake 3, 3, 15, 5
	Wait 10, VAR_SPECIAL_RESULT
	Wait 70, VAR_SPECIAL_RESULT
	LegendCutsceneLugiaEyeGlimmerEffect
	Wait 26, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellAnimEnd
	SetVar VAR_TEMP_x400B, 123
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	ClearFlag FLAG_HIDE_WHIRL_ISLAND_LUGIA
	ShowPerson obj_D40R0107_lug_obj01
	MakeObjectVisible obj_D40R0107_lug_obj01
	ShowPerson obj_D40R0107_stop
	ShowPerson obj_D40R0107_stop_2
	ShowPerson obj_D40R0107_stop_3
	ShowPerson obj_D40R0107_stop_4
	ShowPerson obj_D40R0107_stop_5
	Release obj_D40R0107_dancer_5
	Release obj_D40R0107_dancer_3
	Release obj_D40R0107_dancer_4
	Release obj_D40R0107_dancer
	Release obj_D40R0107_dancer_2
	MovePersonFacing obj_D40R0107_dancer_5, 16, 1, 33, DIR_NORTH
	MovePersonFacing obj_D40R0107_dancer_3, 13, 1, 33, DIR_NORTH
	MovePersonFacing obj_D40R0107_dancer_4, 13, 1, 27, DIR_NORTH
	MovePersonFacing obj_D40R0107_dancer, 19, 1, 33, DIR_NORTH
	MovePersonFacing obj_D40R0107_dancer_2, 19, 1, 27, DIR_NORTH
	Cinematic 1
	LegendCutsceneLugiaArrivesEffectBegin
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Wait 59, VAR_SPECIAL_RESULT
	LegendCutsceneBirdFinalApproach
	StopBGM 15
	LegendCutsceneLugiaArrivesEffectCameraPan
	LegendCutsceneLugiaArrivesEffectEnd
	Wait 16, VAR_SPECIAL_RESULT
	ScrCmd_726
	ApplyMovement obj_D40R0107_dancer_5, _0B3C
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0125_D40R0107_00002
	CloseMsg
	ApplyMovement obj_D40R0107_dancer_5, _09A8
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0125_D40R0107_00003
	WaitButton
	CloseMsg
	ReleaseAll
	SetFlag FLAG_UNK_10B
	SetVar VAR_UNK_40FA, 2
	End

	.balign 4, 0
_0964:
	WalkSlowNorth 2
	EndMovement

	.balign 4, 0
_096C:
	Delay8 6
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0978:
	Delay8 5
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_0984:
	WalkNormalWest
	WalkNormalNorth 6
	EndMovement

	.balign 4, 0
_0990:
	Delay8 5
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_099C:
	WalkNormalEast
	WalkNormalNorth 6
	EndMovement

	.balign 4, 0
_09A8:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_09B0:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_09B8:
	FaceEast
	Delay2
	FaceNorth
	Delay2
	FaceWest
	Delay2
	FaceSouth
	Delay2
	EndMovement

	.balign 4, 0
_09DC:
	FaceWest
	Delay2
	FaceSouth
	Delay2
	FaceEast
	Delay2
	FaceNorth
	Delay2
	EndMovement

	.balign 4, 0
_0A00:
	FaceEast
	Delay2
	FaceNorth
	Delay2
	FaceWest
	Delay2
	FaceSouth
	Delay2
	EndMovement

	.balign 4, 0
_0A24:
	FaceSouth
	Delay2
	FaceEast
	Delay2
	FaceNorth
	Delay2
	FaceWest
	Delay2
	EndMovement

	.balign 4, 0
_0A48:
	FaceNorth
	Delay2
	FaceWest
	Delay2
	FaceSouth
	Delay2
	FaceEast
	Delay2
	EndMovement

	.balign 4, 0
_0A6C:
	FaceWest
	Delay2
	FaceSouth
	Delay2
	FaceEast
	Delay2
	FaceNorth
	Delay2
	FaceWest
	Delay2
	EndMovement

	.balign 4, 0
_0A98:
	FaceEast
	Delay2
	FaceNorth
	Delay2
	FaceWest
	Delay2
	FaceSouth
	Delay2
	FaceEast
	Delay2
	EndMovement

	.balign 4, 0
_0AC4:
	FaceSouth
	Delay2
	FaceEast
	Delay2
	FaceNorth
	Delay2
	FaceWest
	Delay2
	FaceSouth
	Delay2
	EndMovement

	.balign 4, 0
_0AF0:
	FaceNorth
	Delay2
	FaceWest
	Delay2
	FaceSouth
	Delay2
	FaceEast
	Delay2
	FaceNorth
	Delay2
	EndMovement

	.balign 4, 0
_0B1C:
	WalkSlowNorth 2
	EndMovement

	.balign 4, 0
_0B24:
	WalkSlowSouth 2
	EndMovement

	.balign 4, 0
_0B2C:
	WalkSlowWest 2
	EndMovement

	.balign 4, 0
_0B34:
	WalkSlowEast 2
	EndMovement

	.balign 4, 0
_0B3C:
	WalkSlowNorth
	EndMovement

scr_seq_D40R0107_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_109, _0B62
	NPCMsg msg_0125_D40R0107_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0B62:
	Compare VAR_TEMP_x4005, 5
	GoToIfNe _0B78
	NPCMsg msg_0125_D40R0107_00008
	GoTo _0BA7

_0B78:
	Compare VAR_TEMP_x4005, 6
	GoToIfNe _0B8E
	NPCMsg msg_0125_D40R0107_00008
	GoTo _0BA7

_0B8E:
	Compare VAR_TEMP_x4005, 4
	GoToIfNe _0BA4
	NPCMsg msg_0125_D40R0107_00006
	GoTo _0BA7

_0BA4:
	NPCMsg msg_0125_D40R0107_00007
_0BA7:
	WaitButton
	CloseMsg
	ReleaseAll
	End

scr_seq_D40R0107_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_109, _0BCD
	NPCMsg msg_0125_D40R0107_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0BCD:
	NPCMsg msg_0125_D40R0107_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
