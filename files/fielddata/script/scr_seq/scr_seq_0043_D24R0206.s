#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0206.h"
#include "msgdata/msg/msg_0077_D24R0206.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D24R0206_000
	ScrDef scr_seq_D24R0206_001
	ScrDef scr_seq_D24R0206_002
	ScrDef scr_seq_D24R0206_003
	ScrDefEnd

scr_seq_D24R0206_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	AlphPuzzle 2
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoToIfSet FLAG_SYS_ALPH_PUZZLE_OMANYTE, _0046
	ReleaseAll
	End

_0046:
	Wait 2, VAR_SPECIAL_x8004
	ScreenShake 0, 2, 10, 6
	Wait 10, VAR_SPECIAL_x8004
	ApplyMovement obj_player, _02A4
	WaitMovement
	HidePerson obj_D24R0206_babyboy1_13
	PlaySE SEQ_SE_DP_KI_GASYAN
	ClearFlag FLAG_UNK_111
	SetFlag FLAG_UNK_220
	ClearFlag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _009A
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00AA
	End

_009A:
	ApplyMovement obj_player, _022C
	WaitMovement
	GoTo _00BC

_00AA:
	ApplyMovement obj_player, _022C
	ApplyMovement obj_partner_poke, _0238
	WaitMovement
_00BC:
	SetVar VAR_UNK_40CE, 1
	Compare VAR_UNK_40EC, 1
	GoToIfGe _0107
	PlaySE SEQ_SE_GS_RAKKA01
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 5, 42, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	SetVar VAR_UNK_40DF, 1
	AddVar VAR_UNK_40EC, 1
	ReleaseAll
	End

_0107:
	SetFlag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	PlaySE SEQ_SE_GS_RAKKA01
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 5, 42, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	SetVar VAR_UNK_40DF, 1
	AddVar VAR_UNK_40EC, 1
	ReleaseAll
	End

scr_seq_D24R0206_003:
	ScrCmd_609
	LockAll
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0167
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0177
	End

_0167:
	ApplyMovement obj_player, _022C
	WaitMovement
	GoTo _0189

_0177:
	ApplyMovement obj_player, _022C
	ApplyMovement obj_partner_poke, _0238
	WaitMovement
_0189:
	SetVar VAR_UNK_40CE, 1
	PlaySE SEQ_SE_GS_RAKKA01
	Compare VAR_UNOWN_REPORT_LEVEL, 7
	GoToIfGe _01D5
	Compare VAR_UNOWN_REPORT_LEVEL, 6
	GoToIfEq _01FF
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 5, 42, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_01D1:
	ReleaseAll
	End

_01D5:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 5, 42, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _01D1

_01FF:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT, 0, 5, 42, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _01D1

	.balign 4, 0
_022C:
	WalkOnSpotFasterNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0238:
	Delay4 3
	WalkFasterNorth
	SetInvisible
	EndMovement

scr_seq_D24R0206_001:
	ScrCmd_609
	LockAll
	OpenAlphHiddenRoom 2
	ReleaseAll
	End

scr_seq_D24R0206_002:
	ScrCmd_609
	LockAll
	GoToIfSet FLAG_OPENED_ALPH_WATER_STONE_SECRET_ROOM, _0292
	Wait 2, VAR_SPECIAL_x8004
	ScreenShake 0, 2, 10, 6
	Wait 10, VAR_SPECIAL_x8004
	ApplyMovement obj_player, _02A4
	WaitMovement
	HidePerson obj_D24R0206_babyboy1_12
	SetFlag FLAG_OPENED_ALPH_WATER_STONE_SECRET_ROOM
	PlaySE SEQ_SE_DP_UG_008
	ReleaseAll
	End

_0292:
	Wait 10, VAR_SPECIAL_x8004
	NPCMsg msg_0077_D24R0206_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_02A4:
	EmoteExclamationMark
	EndMovement
	.balign 4, 0
