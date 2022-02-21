#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_0000.h"
#include "msgdata/msg/msg_0014.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0000_000
	scrdef scr_seq_0000_001
	scrdef scr_seq_0000_002
	scrdef_end

scr_seq_0000_000:
	simple_npc_msg msg_0014_00000
	end

scr_seq_0000_001:
	scrcmd_609
	lockall
	npc_msg msg_0014_00009
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_RESULT
	touchscreen_menu_show
	compare VAR_SPECIAL_RESULT, 0
	goto_if_eq _0050
	compare VAR_SPECIAL_RESULT, 1
	goto_if_eq _0063
	end

scr_seq_0000_002:
	scrcmd_609
	lockall
_0050:
	scrcmd_151
	npc_msg msg_0014_00012
	scrcmd_257 94
	closemsg
	scrcmd_587
	scrcmd_449
	releaseall
	end

_0063:
	closemsg
	releaseall
	end
	.balign 4, 0
