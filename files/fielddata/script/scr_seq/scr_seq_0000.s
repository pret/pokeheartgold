#include "constants/scrcmd.h"
#include "../.h"
#include "msgdata/msg/msg_0014.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0000_000
	scrdef scr_seq_0000_001
	scrdef scr_seq_0000_002
	scrdef_end

scr_seq_0000_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0014_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0000_001:
	scrcmd_609
	lockall
	npc_msg msg_0014_00009
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0050
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _0063
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
