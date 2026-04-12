#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0262.h"
#include "msgdata/msg/msg_0427.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0262_000
	ScrDef scr_seq_0262_001
	ScrDef scr_seq_0262_002
	ScrDef scr_seq_0262_003
	ScrDef scr_seq_0262_004
	ScrDef scr_seq_0262_005
	ScrDef scr_seq_0262_006
	ScrDefEnd

scr_seq_0262_000:
	ScrCmd_609
	LockAll
	ScrCmd_721 VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfEq _006A
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfNe _0049
	NPCMsg msg_0427_00008
	GoTo _0062

_0049:
	Compare VAR_SPECIAL_RESULT, 2
	GoToIfNe _005F
	NPCMsg msg_0427_00009
	GoTo _0062

_005F:
	NPCMsg msg_0427_00010
_0062:
	WaitButton
	GoTo _00B5

_006A:
	NPCMsg msg_0427_00004
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _00B5
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	ScrCmd_717 VAR_SPECIAL_RESULT
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	Compare VAR_SPECIAL_RESULT, 255
	GoToIfEq _00B7
	ScrCmd_718 0, VAR_SPECIAL_RESULT
	NPCMsg msg_0427_00005
	WaitButton
_00B5:
	CloseMsg
_00B7:
	TouchscreenMenuShow
	ReleaseAll
	End

scr_seq_0262_001:
	ScrCmd_609
	LockAll
	ScrCmd_719 VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	Compare VAR_SPECIAL_x8000, 255
	GoToIfEq _0114
	ScrCmd_718 0, VAR_SPECIAL_x8000
	NPCMsg msg_0427_00006
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	Compare VAR_SPECIAL_RESULT, 1
	GoToIfEq _0112
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	CloseMsg
	ScrCmd_720 VAR_SPECIAL_x8001
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	NPCMsg msg_0427_00007
	WaitButton
_0112:
	CloseMsg
_0114:
	TouchscreenMenuShow
	ReleaseAll
	End

_011A:
	SafariZoneAction 1, 0
	Compare VAR_SCENE_SAFARI_ZONE_ENTRANCE, 3
	GoToIfNe _0155
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SAFARI_ZONE_ENTRANCE_INTERIOR, 0, 19, 2, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
	GoTo _0179

_0155:
	FadeScreen 6, 1, 0, RGB_BLACK
	WaitFade
	Warp MAP_SAFARI_ZONE_ENTRANCE_INTERIOR, 0, 5, 2, DIR_SOUTH
	FadeScreen 6, 1, 1, RGB_BLACK
	WaitFade
_0179:
	SetVar VAR_SCENE_SAFARI_ZONE_ENTRANCE, 2
	Return

scr_seq_0262_002:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_PINPON
	NPCMsg msg_0427_00000
	CloseMsg
	Call _011A
	ReleaseAll
	End

scr_seq_0262_003:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_PINPON
	NPCMsg msg_0427_00001
	CloseMsg
	Call _011A
	ReleaseAll
	End

scr_seq_0262_004:
	ScrCmd_609
	LockAll
	PlaySE SEQ_SE_DP_PINPON
	NPCMsg msg_0427_00002
	CloseMsg
	Call _011A
	ReleaseAll
	End

scr_seq_0262_005:
	SetVar VAR_SCENE_SAFARI_ZONE_ENTRANCE, 2
	SafariZoneAction 1, 0
	End

scr_seq_0262_006:
	ScrCmd_609
	LockAll
	NPCMsg msg_0427_00003
	TouchscreenMenuHide
	GetMenuChoice VAR_SPECIAL_RESULT
	TouchscreenMenuShow
	CloseMsg
	Compare VAR_SPECIAL_RESULT, 0
	GoToIfNe _01FA
	Call _011A
	ReleaseAll
	End

_01FA:
	ReleaseAll
	End
	.balign 4, 0
