#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D02R0102.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_D02R0102_000
	ScrDefEnd

scr_seq_D02R0102_000:
	GoToIfSet FLAG_UNK_AB5, _004D
	GetWeekday VAR_TEMP_x4000
	Compare VAR_TEMP_x4000, 1
	GoToIfNe _002E
	GoTo _004F

_0028:
	GoTo _004D

_002E:
	Compare VAR_TEMP_x4000, 2
	GoToIfNe _0047
	GoTo _008E

_0041:
	GoTo _004D

_0047:
	GoTo _004D

_004D:
	End

_004F:
	ScrCmd_379 VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 3
	GoToIfNe _0086
	MoveWarp 1, 1, 7
	MoveWarp 4, 5, 6
	MoveWarp 2, 1, 26
	MoveWarp 5, 5, 25
	GoTo _008C

_0086:
	GoTo _004D

_008C:
	End

_008E:
	ScrCmd_379 VAR_TEMP_x4001
	Compare VAR_TEMP_x4001, 4
	GoToIfNe _00C5
	MoveWarp 1, 1, 7
	MoveWarp 4, 5, 6
	MoveWarp 2, 1, 26
	MoveWarp 5, 5, 25
	GoTo _00CB

_00C5:
	GoTo _004D

_00CB:
	End

_00CD:
	End

	.balign 4, 0
