#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0955.h"
#include "msgdata/msg/msg_0732.h"
	.include "asm/macros/script.inc"

	.rodata

	ScrDef scr_seq_0955_000
	ScrDef scr_seq_0955_001
	ScrDef scr_seq_0955_002
	ScrDef scr_seq_0955_003
	ScrDef scr_seq_0955_004
	ScrDef scr_seq_0955_005
	ScrDef scr_seq_0955_006
	ScrDef scr_seq_0955_007
	ScrDef scr_seq_0955_008
	ScrDef scr_seq_0955_009
	ScrDef scr_seq_0955_010
	ScrDef scr_seq_0955_011
	ScrDef scr_seq_0955_012
	ScrDef scr_seq_0955_013
	ScrDef scr_seq_0955_014
	ScrDef scr_seq_0955_015
	ScrDef scr_seq_0955_016
	ScrDef scr_seq_0955_017
	ScrDef scr_seq_0955_018
	ScrDefEnd

scr_seq_0955_000:
	SetVar VAR_SPECIAL_x8000, 1
	GoTo _0159

scr_seq_0955_001:
	SetVar VAR_SPECIAL_x8000, 2
	GoTo _0159

scr_seq_0955_002:
	SetVar VAR_SPECIAL_x8000, 3
	GoTo _0159

scr_seq_0955_003:
	SetVar VAR_SPECIAL_x8000, 4
	GoTo _0159

scr_seq_0955_004:
	SetVar VAR_SPECIAL_x8000, 5
	GoTo _0159

scr_seq_0955_005:
	SetVar VAR_SPECIAL_x8000, 6
	GoTo _0159

scr_seq_0955_006:
	SetVar VAR_SPECIAL_x8000, 7
	GoTo _0159

scr_seq_0955_007:
	SetVar VAR_SPECIAL_x8000, 8
	GoTo _0159

scr_seq_0955_008:
	SetVar VAR_SPECIAL_x8000, 9
	GoTo _0159

scr_seq_0955_009:
	SetVar VAR_SPECIAL_x8000, 10
	GoTo _0159

scr_seq_0955_010:
	SetVar VAR_SPECIAL_x8000, 11
	GoTo _0159

scr_seq_0955_011:
	SetVar VAR_SPECIAL_x8000, 12
	GoTo _0159

scr_seq_0955_012:
	SetVar VAR_SPECIAL_x8000, 13
	GoTo _0159

scr_seq_0955_013:
	SetVar VAR_SPECIAL_x8000, 14
	GoTo _0159

scr_seq_0955_014:
	Compare VAR_UNK_4032, 1
	GoToIfEq scr_seq_0955_015
	Compare VAR_UNK_4032, 2
	GoToIfEq scr_seq_0955_016
	Compare VAR_UNK_4032, 3
	GoToIfEq scr_seq_0955_017
	SetVar VAR_SPECIAL_x8000, 15
	GoTo _0159

scr_seq_0955_015:
	SetVar VAR_SPECIAL_x8000, 16
	GoTo _0159

scr_seq_0955_016:
	SetVar VAR_SPECIAL_x8000, 17
	GoTo _0159

scr_seq_0955_017:
	SetVar VAR_SPECIAL_x8000, 18
	GoTo _0159

scr_seq_0955_018:
	SetVar VAR_SPECIAL_x8000, 19
	GoTo _0159

_0159:
	SimpleNPCMsg msg_0732_00002
	End
	.balign 4, 0
