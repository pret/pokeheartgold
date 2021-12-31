#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_D25R0103.h"
#include "msgdata/msg/msg_0089_D25R0103.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_D25R0103_000
	scrdef scr_seq_D25R0103_001
	scrdef scr_seq_D25R0103_002
	scrdef_end

scr_seq_D25R0103_002:
	checkflag FLAG_UNK_AB8
	gotoif TRUE, _003A
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, _0034
	clearflag FLAG_UNK_30A
	goto _0038

_0034:
	setflag FLAG_UNK_30A
_0038:
	end

_003A:
	setflag FLAG_UNK_30A
	end

scr_seq_D25R0103_001:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, _004D
	end

_004D:
	setflag FLAG_UNK_30A
	hide_person 3
	end

scr_seq_D25R0103_000:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 131, 0
	scrcmd_077
	setflag FLAG_UNK_0A4
	scrcmd_589 131, 20, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, _008F
	setflag FLAG_UNK_AB8
	releaseall
	end

_008F:
	white_out
	releaseall
	end
	.balign 4, 0
