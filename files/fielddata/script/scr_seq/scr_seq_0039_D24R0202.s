#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0202.h"
#include "msgdata/msg/msg_0074_D24R0202.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D24R0202_000
	ScrDef scr_seq_D24R0202_001
	ScrDef scr_seq_D24R0202_002
	ScrDef scr_seq_D24R0202_003
	ScrDef scr_seq_D24R0202_004
	ScrDefEnd

scr_seq_D24R0202_000:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	AlphPuzzle 0
	RestoreOverworld
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoToIfSet FLAG_SYS_ALPH_PUZZLE_KABUTO, _004A
	ReleaseAll
	End

_004A:
	SetFlag FLAG_UNK_188
	Wait 2, VAR_SPECIAL_x8004
	ScreenShake 0, 2, 10, 6
	Wait 10, VAR_SPECIAL_x8004
	ApplyMovement obj_player, _02AC
	WaitMovement
	HidePerson obj_D24R0202_babyboy1_13
	PlaySE SEQ_SE_DP_KI_GASYAN
	ClearFlag FLAG_UNK_111
	SetFlag FLAG_UNK_21C
	ClearFlag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _00A2
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00B2
	End

_00A2:
	ApplyMovement obj_player, _0234
	WaitMovement
	GoTo _00C4

_00B2:
	ApplyMovement obj_player, _0234
	ApplyMovement obj_partner_poke, _0240
	WaitMovement
_00C4:
	SetVar VAR_UNK_40CE, 1
	Compare VAR_UNK_40EC, 1
	GoToIfGe _010F
	PlaySE SEQ_SE_GS_RAKKA01
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 25, 6, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	SetVar VAR_UNK_40DD, 1
	AddVar VAR_UNK_40EC, 1
	ReleaseAll
	End

_010F:
	SetFlag FLAG_HIDE_RUINS_OF_ALPH_ASSISTANTS
	PlaySE SEQ_SE_GS_RAKKA01
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 25, 6, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	SetVar VAR_UNK_40DD, 1
	AddVar VAR_UNK_40EC, 1
	ReleaseAll
	End

scr_seq_D24R0202_004:
	ScrCmd_609
	LockAll
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _016F
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _017F
	End

_016F:
	ApplyMovement obj_player, _0234
	WaitMovement
	GoTo _0191

_017F:
	ApplyMovement obj_player, _0234
	ApplyMovement obj_partner_poke, _0240
	WaitMovement
_0191:
	SetVar VAR_UNK_40CE, 1
	PlaySE SEQ_SE_GS_RAKKA01
	Compare VAR_UNOWN_REPORT_LEVEL, 7
	GoToIfGe _01DD
	Compare VAR_UNOWN_REPORT_LEVEL, 6
	GoToIfEq _0207
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 25, 6, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_01D9:
	ReleaseAll
	End

_01DD:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 25, 6, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _01D9

_0207:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT, 0, 25, 6, DIR_NORTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _01D9

	.balign 4, 0
_0234:
	WalkOnSpotFasterNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0240:
	Delay4 3
	WalkFasterNorth
	SetInvisible
	EndMovement

scr_seq_D24R0202_001:
	ScrCmd_609
	LockAll
	OpenAlphHiddenRoom 0
	ReleaseAll
	End

scr_seq_D24R0202_002:
	ScrCmd_609
	LockAll
	GoToIfSet FLAG_OPENED_ALPH_ESCAPE_ROPE_SECRET_ROOM, _029A
	Wait 2, VAR_SPECIAL_x8004
	ScreenShake 0, 2, 10, 6
	Wait 10, VAR_SPECIAL_x8004
	ApplyMovement obj_player, _02AC
	WaitMovement
	HidePerson obj_D24R0202_babyboy1_12
	SetFlag FLAG_OPENED_ALPH_ESCAPE_ROPE_SECRET_ROOM
	PlaySE SEQ_SE_DP_UG_008
	ReleaseAll
	End

_029A:
	Wait 10, VAR_SPECIAL_x8004
	NPCMsg msg_0074_D24R0202_00003
	WaitButton
	CloseMsg
	ReleaseAll
	End

	.balign 4, 0
_02AC:
	EmoteExclamationMark
	EndMovement

scr_seq_D24R0202_003:
	PlaySE SEQ_SE_DP_SELECT
	LockAll
	FacePlayer
	GoToIfSet FLAG_UNK_188, _02D2
	NPCMsg msg_0074_D24R0202_00000
	WaitButton
	CloseMsg
	ReleaseAll
	End

_02D2:
	NPCMsg msg_0074_D24R0202_00001
	WaitButton
	CloseMsg
	ReleaseAll
	End
	.balign 4, 0
