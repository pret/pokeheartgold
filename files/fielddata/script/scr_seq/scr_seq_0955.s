#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0955.h"
#include "msgdata/msg/msg_0732.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0955_000
	scrdef scr_seq_0955_001
	scrdef scr_seq_0955_002
	scrdef scr_seq_0955_003
	scrdef scr_seq_0955_004
	scrdef scr_seq_0955_005
	scrdef scr_seq_0955_006
	scrdef scr_seq_0955_007
	scrdef scr_seq_0955_008
	scrdef scr_seq_0955_009
	scrdef scr_seq_0955_010
	scrdef scr_seq_0955_011
	scrdef scr_seq_0955_012
	scrdef scr_seq_0955_013
	scrdef scr_seq_0955_014
	scrdef scr_seq_0955_015
	scrdef scr_seq_0955_016
	scrdef scr_seq_0955_017
	scrdef scr_seq_0955_018
	scrdef_end

scr_seq_0955_000:
	setvar VAR_SPECIAL_x8000, 1
	goto _0159

scr_seq_0955_001:
	setvar VAR_SPECIAL_x8000, 2
	goto _0159

scr_seq_0955_002:
	setvar VAR_SPECIAL_x8000, 3
	goto _0159

scr_seq_0955_003:
	setvar VAR_SPECIAL_x8000, 4
	goto _0159

scr_seq_0955_004:
	setvar VAR_SPECIAL_x8000, 5
	goto _0159

scr_seq_0955_005:
	setvar VAR_SPECIAL_x8000, 6
	goto _0159

scr_seq_0955_006:
	setvar VAR_SPECIAL_x8000, 7
	goto _0159

scr_seq_0955_007:
	setvar VAR_SPECIAL_x8000, 8
	goto _0159

scr_seq_0955_008:
	setvar VAR_SPECIAL_x8000, 9
	goto _0159

scr_seq_0955_009:
	setvar VAR_SPECIAL_x8000, 10
	goto _0159

scr_seq_0955_010:
	setvar VAR_SPECIAL_x8000, 11
	goto _0159

scr_seq_0955_011:
	setvar VAR_SPECIAL_x8000, 12
	goto _0159

scr_seq_0955_012:
	setvar VAR_SPECIAL_x8000, 13
	goto _0159

scr_seq_0955_013:
	setvar VAR_SPECIAL_x8000, 14
	goto _0159

scr_seq_0955_014:
	compare VAR_UNK_4032, 1
	goto_if_eq scr_seq_0955_015
	compare VAR_UNK_4032, 2
	goto_if_eq scr_seq_0955_016
	compare VAR_UNK_4032, 3
	goto_if_eq scr_seq_0955_017
	setvar VAR_SPECIAL_x8000, 15
	goto _0159

scr_seq_0955_015:
	setvar VAR_SPECIAL_x8000, 16
	goto _0159

scr_seq_0955_016:
	setvar VAR_SPECIAL_x8000, 17
	goto _0159

scr_seq_0955_017:
	setvar VAR_SPECIAL_x8000, 18
	goto _0159

scr_seq_0955_018:
	setvar VAR_SPECIAL_x8000, 19
	goto _0159

_0159:
	simple_npc_msg msg_0732_00002
	end
	.balign 4, 0
