#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D24R0210.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D24R0210_000
	ScrDef scr_seq_D24R0210_001
	ScrDef scr_seq_D24R0210_002
	ScrDefEnd

scr_seq_D24R0210_000:
	PlaySE SEQ_SE_GS_RAKKA01
	ApplyMovement obj_player, _0064
	ScrCmd_374 obj_player
	WaitMovement
	ScreenShake 0, 1, 1, 8
	PlaySE SEQ_SE_DP_SUTYA2
	SetVar VAR_UNK_40D1, 0
	Compare VAR_UNK_40EE, 1
	GoToIfEq _004D
	SetVar VAR_UNK_40EE, 1
	AddVar VAR_UNK_40F1, 1
_004D:
	End

scr_seq_D24R0210_001:
	Compare VAR_UNK_40D1, 1
	GoToIfNe _0060
	MakeObjectVisible obj_player
_0060:
	End

	.balign 4, 0
_0064:
	WarpIn
	EndMovement

scr_seq_D24R0210_002:
	ScrCmd_609
	LockAll
	SetVar VAR_UNK_40CE, 1
	SetFlag FLAG_UNK_111
	ScrCmd_729 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _009A
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00FF
	End

_009A:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _00B9
	ApplyMovement obj_player, _0218
	GoTo _00F7

_00B9:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _00D4
	ApplyMovement obj_player, _0234
	GoTo _00F7

_00D4:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _00EF
	ApplyMovement obj_player, _0250
	GoTo _00F7

_00EF:
	ApplyMovement obj_player, _026C
_00F7:
	WaitMovement
	GoTo _017E

_00FF:
	GetPlayerFacing VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _0126
	ApplyMovement obj_player, _0218
	ApplyMovement obj_partner_poke, _0224
	GoTo _017C

_0126:
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0149
	ApplyMovement obj_player, _0234
	ApplyMovement obj_partner_poke, _0240
	GoTo _017C

_0149:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _016C
	ApplyMovement obj_player, _0250
	ApplyMovement obj_partner_poke, _025C
	GoTo _017C

_016C:
	ApplyMovement obj_player, _026C
	ApplyMovement obj_partner_poke, _0278
_017C:
	WaitMovement
_017E:
	PlaySE SEQ_SE_GS_RAKKA01
	Compare VAR_UNOWN_REPORT_LEVEL, 7
	GoToIfGe _01C4
	Compare VAR_UNOWN_REPORT_LEVEL, 6
	GoToIfEq _01EE
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL, 0, 25, 42, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_01C0:
	ReleaseAll
	End

_01C4:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT_2, 0, 25, 42, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _01C0

_01EE:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_RUINS_OF_ALPH_UNDERGROUND_HALL_SINJOH_EVENT, 0, 25, 42, VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _01C0

	.balign 4, 0
_0218:
	WalkOnSpotFasterNorth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0224:
	Delay4 3
	WalkFasterNorth
	SetInvisible
	EndMovement

	.balign 4, 0
_0234:
	WalkOnSpotFasterSouth 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0240:
	Delay4 3
	WalkFasterSouth
	SetInvisible
	EndMovement

	.balign 4, 0
_0250:
	WalkOnSpotFasterWest 4
	SetInvisible
	EndMovement

	.balign 4, 0
_025C:
	Delay4 3
	WalkFasterWest
	SetInvisible
	EndMovement

	.balign 4, 0
_026C:
	WalkOnSpotFasterEast 4
	SetInvisible
	EndMovement

	.balign 4, 0
_0278:
	Delay4 3
	WalkFasterEast
	SetInvisible
	EndMovement
	.balign 4, 0
