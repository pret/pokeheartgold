#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D17R0110.h"
#include "msgdata/msg/msg_0058_D17R0110.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D17R0110_000
	ScrDef scr_seq_D17R0110_001
	ScrDef scr_seq_D17R0110_002
	ScrDef scr_seq_D17R0110_003
	ScrDef scr_seq_D17R0110_004
	ScrDef scr_seq_D17R0110_005
	ScrDef scr_seq_D17R0110_006
	ScrDefEnd

scr_seq_D17R0110_002:
	GoToIfSet FLAG_ENGAGING_STATIC_POKEMON, _002B
	End

_002B:
	SetFlag FLAG_HIDE_BELL_TOWER_HO_OH
	HidePerson obj_D17R0110_hou_obj01
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	End

scr_seq_D17R0110_003:
	SetVar VAR_TEMP_x4003, 111
	SetFlag FLAG_UNK_105
	End

scr_seq_D17R0110_005:
	Compare VAR_TEMP_x400B, 123
	GoToIfNe _005C
	StopSE SEQ_SE_GS_KYOUHUU
	SetVar VAR_TEMP_x400B, 0
_005C:
	GoToIfSet FLAG_UNK_108, _00C3
	GoToIfUnset FLAG_UNK_10A, _00C3
	Compare VAR_TEMP_x4003, 111
	GoToIfNe _00BB
	MovePersonFacing obj_D17R0110_dancer, 16, 1, 18, DIR_NORTH
	MovePersonFacing obj_D17R0110_dancer_2, 12, 1, 18, DIR_NORTH
	MovePersonFacing obj_D17R0110_dancer_3, 12, 1, 12, DIR_SOUTH
	MovePersonFacing obj_D17R0110_dancer_4, 18, 1, 18, DIR_NORTH
	MovePersonFacing obj_D17R0110_dancer_5, 18, 1, 12, DIR_SOUTH
_00BB:
	SetVar VAR_TEMP_x4003, 0
	End

_00C3:
	End

scr_seq_D17R0110_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	SetVar VAR_TEMP_x400A, 250
	PlayCry VAR_TEMP_x400A, 0
	NPCMsg msg_0058_D17R0110_00004
	WaitCry
	CloseMsg
	GetGameVersion VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 7
	GoToIfNe _00FD
	SetVar VAR_SPECIAL_x8004, 45
	GoTo _0103

_00FD:
	SetVar VAR_SPECIAL_x8004, 70
_0103:
	SetFlag FLAG_ENGAGING_STATIC_POKEMON
	WildBattle VAR_TEMP_x400A, VAR_SPECIAL_x8004, 0
	ClearFlag FLAG_ENGAGING_STATIC_POKEMON
	GetStaticEncounterOutcome VAR_TEMP_x4005
	Compare VAR_TEMP_x4005, 2
	GoToIfEq _0167
	Compare VAR_TEMP_x4005, 3
	GoToIfEq _0167
	Compare VAR_TEMP_x4005, 4
	CallIfEq _0171
	ReleaseAll
	SetFlag FLAG_UNK_108
	SetVar VAR_SCENE_NEW_BARK_EAST_EXIT, 3
	SetFlag FLAG_HIDE_NEW_BARK_FRIEND
	SetFlag FLAG_HIDE_NEW_BARK_MARILL
	SetFlag FLAG_HIDE_NEW_BARK_FRIEND_2
	ClearFlag FLAG_HIDE_NEW_BARK_FRIENDS_ROOM_FRIEND
	SetFlag FLAG_HIDE_BELL_TOWER_SUMMIT_KIMONO_GIRLS
	ClearFlag FLAG_HIDE_DANCE_STUDIO_KIMONO_GIRLS
	ClearFlag FLAG_UNK_241
	End

_0167:
	ClearFlag FLAG_HIDE_BELL_TOWER_HO_OH
	WhiteOut
	ReleaseAll
	End

_0171:
	SetFlag FLAG_CAUGHT_HO_OH
	Return

scr_seq_D17R0110_006:
	ScrCmd_609
	LockAll
	ScrCmd_805
	ApplyMovement obj_D17R0110_dancer, _0790
	WaitMovement
	NPCMsg msg_0058_D17R0110_00000
	CloseMsg
	StopSE SEQ_SE_GS_KYOUHUU
	FadeScreen 4, 4, 0, RGB_WHITE
	WaitFade
	LegendCutsceneClearBellAnimBegin
	LegendCutsceneClearBellRiseFromBag
	PlaySE SEQ_SE_GS_SUZUSYUTUGEN_HO
	FadeScreen 4, 4, 1, RGB_WHITE
	WaitFade
	WaitSE SEQ_SE_GS_SUZUSYUTUGEN_HO
	ApplyMovement obj_D17R0110_dancer, _0754
	ApplyMovement obj_D17R0110_dancer_2, _0760
	ApplyMovement obj_D17R0110_dancer_3, _076C
	ApplyMovement obj_D17R0110_dancer_4, _0778
	ApplyMovement obj_D17R0110_dancer_5, _0784
	WaitMovement
	Wait 16, VAR_SPECIAL_RESULT
	ApplyMovement obj_D17R0110_dancer, _0790
	ApplyMovement obj_D17R0110_dancer_2, _0790
	ApplyMovement obj_D17R0110_dancer_3, _0790
	ApplyMovement obj_D17R0110_dancer_4, _0790
	ApplyMovement obj_D17R0110_dancer_5, _0790
	WaitMovement
	Wait 16, VAR_SPECIAL_RESULT
	StopBGM 0
	TempBGM SEQ_GS_E_MAIKO_MAI
	Wait 18, VAR_SPECIAL_RESULT
	ApplyMovement obj_D17R0110_dancer, _07A0
	ApplyMovement obj_D17R0110_dancer_2, _07A0
	ApplyMovement obj_D17R0110_dancer_3, _07A0
	ApplyMovement obj_D17R0110_dancer_4, _07A0
	ApplyMovement obj_D17R0110_dancer_5, _07A0
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 1
	PlaySE SEQ_SE_GS_SUZUNOONPA_RU
	WaitMovement
	Wait 67, VAR_SPECIAL_RESULT
	ApplyMovement obj_D17R0110_dancer, _07A0
	ApplyMovement obj_D17R0110_dancer_2, _07A0
	ApplyMovement obj_D17R0110_dancer_3, _07A0
	ApplyMovement obj_D17R0110_dancer_4, _07A0
	ApplyMovement obj_D17R0110_dancer_5, _07A0
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 1
	PlaySE SEQ_SE_GS_SUZUNOONPA_RU
	WaitMovement
	FadeScreen 4, 6, 1, RGB_WHITE
	LegendCutsceneWavesOrLeavesEffectBegin
	WaitFade
	Wait 4, VAR_SPECIAL_RESULT
	ApplyMovement obj_D17R0110_dancer, _0914
	ApplyMovement obj_D17R0110_dancer_2, _0904
	ApplyMovement obj_D17R0110_dancer_3, _091C
	ApplyMovement obj_D17R0110_dancer_4, _0914
	ApplyMovement obj_D17R0110_dancer_5, _090C
	WaitMovement
	ApplyMovement obj_D17R0110_dancer, _080C
	ApplyMovement obj_D17R0110_dancer_2, _07C4
	ApplyMovement obj_D17R0110_dancer_3, _0830
	ApplyMovement obj_D17R0110_dancer_4, _080C
	ApplyMovement obj_D17R0110_dancer_5, _07E8
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 1
	PlaySE SEQ_SE_GS_SUZUNOONPA_RU
	WaitMovement
	Wait 32, VAR_SPECIAL_RESULT
	ApplyMovement obj_D17R0110_dancer, _0904
	ApplyMovement obj_D17R0110_dancer_2, _0904
	ApplyMovement obj_D17R0110_dancer_3, _091C
	ApplyMovement obj_D17R0110_dancer_4, _0914
	ApplyMovement obj_D17R0110_dancer_5, _090C
	WaitMovement
	ApplyMovement obj_D17R0110_dancer, _07C4
	ApplyMovement obj_D17R0110_dancer_2, _07C4
	ApplyMovement obj_D17R0110_dancer_3, _0830
	ApplyMovement obj_D17R0110_dancer_4, _080C
	ApplyMovement obj_D17R0110_dancer_5, _07E8
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 1
	PlaySE SEQ_SE_GS_SUZUNOONPA_RU
	WaitMovement
	Wait 33, VAR_SPECIAL_RESULT
	ApplyMovement obj_D17R0110_dancer, _0904
	ApplyMovement obj_D17R0110_dancer_2, _0904
	ApplyMovement obj_D17R0110_dancer_3, _091C
	ApplyMovement obj_D17R0110_dancer_4, _0914
	ApplyMovement obj_D17R0110_dancer_5, _090C
	WaitMovement
	ApplyMovement obj_D17R0110_dancer, _07C4
	ApplyMovement obj_D17R0110_dancer_2, _0854
	ApplyMovement obj_D17R0110_dancer_3, _08D8
	ApplyMovement obj_D17R0110_dancer_4, _08AC
	ApplyMovement obj_D17R0110_dancer_5, _0880
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 1
	PlaySE SEQ_SE_GS_SUZUNOONPA_RU
	WaitMovement
	Wait 32, VAR_SPECIAL_RESULT
	ApplyMovement obj_D17R0110_dancer, _091C
	ApplyMovement obj_D17R0110_dancer_2, _091C
	ApplyMovement obj_D17R0110_dancer_3, _090C
	ApplyMovement obj_D17R0110_dancer_4, _0904
	ApplyMovement obj_D17R0110_dancer_5, _0914
	WaitMovement
	ApplyMovement obj_D17R0110_dancer, _0830
	ApplyMovement obj_D17R0110_dancer_2, _0830
	ApplyMovement obj_D17R0110_dancer_3, _07E8
	ApplyMovement obj_D17R0110_dancer_4, _07C4
	ApplyMovement obj_D17R0110_dancer_5, _080C
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 1
	PlaySE SEQ_SE_GS_SUZUNOONPA_RU
	WaitMovement
	LegendCutsceneWavesOrLeavesEffectEnd
	LegendCutscenePanCameraTo 0
	Wait 32, VAR_SPECIAL_RESULT
	ApplyMovement obj_D17R0110_dancer, _091C
	ApplyMovement obj_D17R0110_dancer_2, _091C
	ApplyMovement obj_D17R0110_dancer_3, _090C
	ApplyMovement obj_D17R0110_dancer_4, _0904
	ApplyMovement obj_D17R0110_dancer_5, _0914
	WaitMovement
	ApplyMovement obj_D17R0110_dancer, _0830
	ApplyMovement obj_D17R0110_dancer_2, _0830
	ApplyMovement obj_D17R0110_dancer_3, _07E8
	ApplyMovement obj_D17R0110_dancer_4, _07C4
	ApplyMovement obj_D17R0110_dancer_5, _080C
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	WaitMovement
	Wait 32, VAR_SPECIAL_RESULT
	ApplyMovement obj_D17R0110_dancer, _090C
	ApplyMovement obj_D17R0110_dancer_2, _091C
	ApplyMovement obj_D17R0110_dancer_3, _090C
	ApplyMovement obj_D17R0110_dancer_4, _0904
	ApplyMovement obj_D17R0110_dancer_5, _0914
	WaitMovement
	ApplyMovement obj_D17R0110_dancer, _07E8
	ApplyMovement obj_D17R0110_dancer_2, _0830
	ApplyMovement obj_D17R0110_dancer_3, _07E8
	ApplyMovement obj_D17R0110_dancer_4, _07C4
	ApplyMovement obj_D17R0110_dancer_5, _080C
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	WaitMovement
	Wait 41, VAR_SPECIAL_RESULT
	LegendCutsceneWaitCameraPan
	Wait 8, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	LegendCutsceneMoveCameraTo 1
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Wait 20, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	Release obj_D17R0110_dancer
	Release obj_D17R0110_dancer_2
	Release obj_D17R0110_dancer_3
	Release obj_D17R0110_dancer_4
	Release obj_D17R0110_dancer_5
	MovePersonFacing obj_D17R0110_dancer, 15, 1, 18, DIR_NORTH
	MovePersonFacing obj_D17R0110_dancer_2, 12, 1, 18, DIR_NORTH
	MovePersonFacing obj_D17R0110_dancer_3, 12, 1, 12, DIR_SOUTH
	MovePersonFacing obj_D17R0110_dancer_4, 18, 1, 18, DIR_NORTH
	MovePersonFacing obj_D17R0110_dancer_5, 18, 1, 12, DIR_SOUTH
	Wait 86, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	Wait 32, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	LegendCutsceneMoveCameraTo 2
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Wait 22, VAR_SPECIAL_RESULT
	ApplyMovement obj_D17R0110_dancer, _07C4
	ApplyMovement obj_D17R0110_dancer_2, _07C4
	ApplyMovement obj_D17R0110_dancer_3, _07E8
	ApplyMovement obj_D17R0110_dancer_4, _07C4
	ApplyMovement obj_D17R0110_dancer_5, _07E8
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	WaitMovement
	Wait 32, VAR_SPECIAL_RESULT
	Wait 34, VAR_SPECIAL_RESULT
	ApplyMovement obj_D17R0110_dancer, _07C4
	ApplyMovement obj_D17R0110_dancer_2, _07C4
	ApplyMovement obj_D17R0110_dancer_3, _07E8
	ApplyMovement obj_D17R0110_dancer_4, _07C4
	ApplyMovement obj_D17R0110_dancer_5, _07E8
	Wait 12, VAR_SPECIAL_RESULT
	LegendCutsceneClearBellShimmer 0
	PlaySE SEQ_SE_GS_SUZUNOONPA2
	WaitMovement
	Wait 60, VAR_SPECIAL_RESULT
	LegendCutscenePanCameraTo 1
	LegendCutsceneWaitCameraPan
	StopBGM 0
	LegendCutsceneClearBellAnimEnd
	SetVar VAR_TEMP_x400B, 123
	FadeScreen 6, 1, 0, RGB_WHITE
	WaitFade
	Cinematic 0
	ClearFlag FLAG_HIDE_BELL_TOWER_HO_OH
	ShowPerson obj_D17R0110_hou_obj01
	MakeObjectVisible obj_D17R0110_hou_obj01
	Wait 6, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_WHITE
	WaitFade
	Wait 20, VAR_SPECIAL_RESULT
	LegendCutsceneBirdFinalApproach
	StopBGM 30
	ApplyMovement obj_D17R0110_dancer, _0798
	WaitMovement
	ScrCmd_726
	BufferPlayersName 0
	NPCMsg msg_0058_D17R0110_00002
	CloseMsg
	ApplyMovement obj_D17R0110_dancer, _0790
	WaitMovement
	BufferPlayersName 0
	NPCMsg msg_0058_D17R0110_00003
	CloseMsg
	ApplyMovement obj_D17R0110_dancer, _092C
	WaitMovement
	ReleaseAll
	SetFlag FLAG_UNK_10A
	SetVar VAR_UNK_40FA, 2
	End

scr_seq_D17R0110_001:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_108, _0704
	NPCMsg msg_0058_D17R0110_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_0704:
	Compare VAR_TEMP_x4005, 5
	GoToIfNe _071A
	NPCMsg msg_0058_D17R0110_00008
	GoTo _0749

_071A:
	Compare VAR_TEMP_x4005, 6
	GoToIfNe _0730
	NPCMsg msg_0058_D17R0110_00008
	GoTo _0749

_0730:
	Compare VAR_TEMP_x4005, 4
	GoToIfNe _0746
	NPCMsg msg_0058_D17R0110_00006
	GoTo _0749

_0746:
	NPCMsg msg_0058_D17R0110_00007
_0749:
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_0754:
	Delay8 6
	WalkNormalNorth
	EndMovement

	.balign 4, 0
_0760:
	Delay8 5
	WalkNormalWest 2
	EndMovement

	.balign 4, 0
_076C:
	WalkNormalWest
	WalkNormalNorth 6
	EndMovement

	.balign 4, 0
_0778:
	Delay8 5
	WalkNormalEast 2
	EndMovement

	.balign 4, 0
_0784:
	WalkNormalEast
	WalkNormalNorth 6
	EndMovement

	.balign 4, 0
_0790:
	WalkOnSpotNormalSouth
	EndMovement

	.balign 4, 0
_0798:
	WalkOnSpotNormalNorth
	EndMovement

	.balign 4, 0
_07A0:
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	EndMovement

	.balign 4, 0
_07C4:
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
	EndMovement

	.balign 4, 0
_07E8:
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	EndMovement

	.balign 4, 0
_080C:
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	EndMovement

	.balign 4, 0
_0830:
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay2
	EndMovement

	.balign 4, 0
_0854:
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay2
	EndMovement

	.balign 4, 0
_0880:
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	EndMovement

	.balign 4, 0
_08AC:
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
	EndMovement

	.balign 4, 0
_08D8:
	FaceSouth
	Delay2
	FaceWest
	Delay2
	FaceNorth
	Delay2
	FaceEast
	Delay2
	FaceSouth
	Delay2
	EndMovement

	.balign 4, 0
_0904:
	WalkSlowNorth 2
	EndMovement

	.balign 4, 0
_090C:
	WalkSlowSouth 2
	EndMovement

	.balign 4, 0
_0914:
	WalkSlowWest 2
	EndMovement

	.balign 4, 0
_091C:
	WalkSlowEast 2
	EndMovement

	.balign 4, 0
_0924:
	WalkSlowSouth
	EndMovement

	.balign 4, 0
_092C:
	FaceWest
	LockDir
	WalkSlowEast
	UnlockDir
	EndMovement

scr_seq_D17R0110_004:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_108, _095E
	NPCMsg msg_0058_D17R0110_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

_095E:
	NPCMsg msg_0058_D17R0110_00005
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
