#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0207.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D24R0207_000
	ScrDef scr_seq_D24R0207_001
	ScrDef scr_seq_D24R0207_002
	ScrDefEnd

scr_seq_D24R0207_000:
	PlaySE SEQ_SE_GS_RAKKA01
	ApplyMovement obj_player, _0068
	ScrCmd_374 obj_player
	WaitMovement
	ScreenShake 0, 1, 1, 8
	PlaySE SEQ_SE_DP_SUTYA2
	SetVar VAR_UNK_40D5, 0
	Compare VAR_UNK_40EF, 1
	GoToIfEq _004D
	SetVar VAR_UNK_40EF, 1
	AddVar VAR_UNK_40F1, 1
_004D:
	End

scr_seq_D24R0207_001:
	Compare VAR_UNK_40D5, 1
	GoToIfNe _0064
	NopVar490 VAR_UNK_40D5
	MakeObjectVisible obj_player
_0064:
	End

	.balign 4, 0
_0068:
	WarpIn
	EndMovement

scr_seq_D24R0207_002:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_40CE, 1
	SetFlag FLAG_UNK_111
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _009E
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0103
	End

_009E:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00BD
	ApplyMovement obj_player, _021C
	GoTo _00FB

_00BD:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00D8
	ApplyMovement obj_player, _0238
	GoTo _00FB

_00D8:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _00F3
	ApplyMovement obj_player, _0254
	GoTo _00FB

_00F3:
	ApplyMovement obj_player, _0270
_00FB:
	WaitMovement
	GoTo _0182

_0103:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _012A
	ApplyMovement obj_player, _021C
	ApplyMovement obj_partner_poke, _0228
	GoTo _0180

_012A:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _014D
	ApplyMovement obj_player, _0238
	ApplyMovement obj_partner_poke, _0244
	GoTo _0180

_014D:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _0170
	ApplyMovement obj_player, _0254
	ApplyMovement obj_partner_poke, _0260
	GoTo _0180

_0170:
	ApplyMovement obj_player, _0270
	ApplyMovement obj_partner_poke, _027C
_0180:
	WaitMovement
_0182:
	PlaySE SEQ_SE_GS_RAKKA01
	Compare VAR_UNOWN_REPORT_LEVEL, 7
	GoToIfGe _01C8
	Compare VAR_UNOWN_REPORT_LEVEL, 6
	GoToIfEq _01F2
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 5, 42, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_01C4:
	ReleaseAll
	End

_01C8:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 5, 42, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _01C4

_01F2:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT, 0, 5, 42, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _01C4

	.balign 4, 0
_021C:
	WalkOnSpotFasterNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0228:
	Delay4 3
	WalkFasterNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_0238:
	WalkOnSpotFasterSouth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0244:
	Delay4 3
	WalkFasterSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_0254:
	WalkOnSpotFasterWest 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0260:
	Delay4 3
	WalkFasterWest
	SetInvisible
	EndMovement

	.balign 4, 0
_0270:
	WalkOnSpotFasterEast 4
	SetInvisible
	EndMovement

	.balign 4, 0
_027C:
	Delay4 3
	WalkFasterEast
	SetInvisible
	EndMovement
	.balign 4, 0
