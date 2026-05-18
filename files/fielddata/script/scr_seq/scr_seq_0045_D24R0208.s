#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0208.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D24R0208_000
	ScrDef scr_seq_D24R0208_001
	ScrDef scr_seq_D24R0208_002
	ScrDefEnd

scr_seq_D24R0208_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	AlphPuzzle 3
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoToIfSet FLAG_SYS_ALPH_PUZZLE_HO_OH, _0042
	ReleaseAll
	End

_0042:
	Wait 2, VAR_SPECIAL_x8004
	ScreenShake 0, 2, 10, 6
	Wait 10, VAR_SPECIAL_x8004
	ApplyMovement obj_player, _0298
	WaitMovement
	HidePerson obj_D24R0208_babyboy1_13
	PlaySE SEQ_SE_DP_KI_GASYAN
	ClearFlag FLAG_UNK_111
	SetFlag FLAG_UNK_222
	ClearFlag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0096
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00A6
	End

_0096:
	ApplyMovement obj_player, _0228
	WaitMovement
	GoTo _00B8

_00A6:
	ApplyMovement obj_player, _0228
	ApplyMovement obj_partner_poke, _0234
	WaitMovement
_00B8:
	SetVar VAR_UNK_40CE, 1
	Compare VAR_UNK_40EC, 1
	GoToIfGe _0103
	PlaySE SEQ_SE_GS_RAKKA01
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 5, 24, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	SetVar VAR_UNK_40E0, 1
	AddVar VAR_UNK_40EC, 1
	ReleaseAll
	End

_0103:
	SetFlag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	PlaySE SEQ_SE_GS_RAKKA01
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 5, 24, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	SetVar VAR_UNK_40E0, 1
	AddVar VAR_UNK_40EC, 1
	ReleaseAll
	End

scr_seq_D24R0208_002:
	ScrCmd_609
	LockAll
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _0163
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0173
	End

_0163:
	ApplyMovement obj_player, _0228
	WaitMovement
	GoTo _0185

_0173:
	ApplyMovement obj_player, _0228
	ApplyMovement obj_partner_poke, _0234
	WaitMovement
_0185:
	SetVar VAR_UNK_40CE, 1
	PlaySE SEQ_SE_GS_RAKKA01
	Compare VAR_UNOWN_REPORT_LEVEL, 7
	GoToIfGe _01D1
	Compare VAR_UNOWN_REPORT_LEVEL, 6
	GoToIfEq _01FB
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 5, 24, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_01CD:
	ReleaseAll
	End

_01D1:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 5, 24, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _01CD

_01FB:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT, 0, 5, 24, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _01CD

	.balign 4, 0
_0228:
	WalkOnSpotFasterNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0234:
	Delay4 3
	WalkFasterNorth
	SetInvisible
	EndMovement

scr_seq_D24R0208_001:
	ScrCmd_609
	LockAll
	OpenAlphHiddenRoom 3
	PlayerHasSpecies VAR_SPECIAL_RESULT, SPECIES_HO_OH
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0264
	GoTo _0268

_0264:
	ReleaseAll
	End

_0268:
	Wait 2, VAR_SPECIAL_x8004
	ScreenShake 0, 2, 10, 6
	Wait 10, VAR_SPECIAL_x8004
	ApplyMovement obj_player, _0298
	WaitMovement
	HidePerson obj_D24R0208_babyboy1_12
	SetFlag FLAG_OPENED_ALPH_HO_OH_SECRET_ROOM
	PlaySE SEQ_SE_DP_UG_008
	ReleaseAll
	End

	.balign 4, 0
_0298:
	EmoteExclamationMark
	EndMovement
	.balign 4, 0
