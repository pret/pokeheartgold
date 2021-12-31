#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D11R0105.h"
#include "msgdata/msg/msg_0003_EVERYWHERE.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D11R0105_000
	scrdef scr_seq_D11R0105_001
	scrdef_end

scr_seq_D11R0105_001:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, _0017
	end

_0017:
	setflag FLAG_UNK_306
	hide_person obj_D11R0105_tsure_poke_603
	clearflag FLAG_UNK_0A4
	end

scr_seq_D11R0105_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_ARTICUNO, 0
	wait_cry
	setflag FLAG_UNK_0A4
	scrcmd_589 144, 50, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _0077
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, _0073
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, _007D
_0073:
	releaseall
	end

_0077:
	white_out
	releaseall
	end

_007D:
	setflag FLAG_UNK_16C
	return
	.balign 4, 0
