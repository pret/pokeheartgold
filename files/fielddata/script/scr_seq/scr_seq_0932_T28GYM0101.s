#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0932_00BE ; 000
	scrdef scr_seq_0932_000A ; 001
	scrdef_end

scr_seq_0932_000A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0932_001B
	clearflag FLAG_UNK_189
	end

scr_seq_0932_001B:
	scrcmd_142 39, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0932_00B8
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_0932_00B2
	scrcmd_147 39, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0932_00B2
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0932_0067
	setflag FLAG_UNK_2EE
	goto scr_seq_0932_00B0

scr_seq_0932_0067:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_0932_007E
	setflag FLAG_UNK_2EE
	goto scr_seq_0932_00B0

scr_seq_0932_007E:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0932_0095
	setflag FLAG_UNK_2EE
	goto scr_seq_0932_00B0

scr_seq_0932_0095:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_0932_00AC
	setflag FLAG_UNK_2EE
	goto scr_seq_0932_00B0

scr_seq_0932_00AC:
	clearflag FLAG_UNK_2EE
scr_seq_0932_00B0:
	end

scr_seq_0932_00B2:
	clearflag FLAG_UNK_2EE
	end

scr_seq_0932_00B8:
	setflag FLAG_UNK_2EE
	end

scr_seq_0932_00BE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 6, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0932_0178
	npc_msg 0
	closemsg
	trainer_battle 32, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0932_0172
	settrainerflag 482
	settrainerflag 484
	settrainerflag 481
	settrainerflag 480
	settrainerflag 483
	npc_msg 1
	scrcmd_295 6
	addvar VAR_UNK_4134, 1
	scrcmd_515 22
	comparevartovalue VAR_UNK_4134, 3
	gotoif ne, scr_seq_0932_012F
	setvar VAR_UNK_4077, 1
scr_seq_0932_012F:
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg 3
	setvar VAR_SPECIAL_x8004, 334
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0932_018E
	callstd 2033
	setflag FLAG_UNK_0D2
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0932_0172:
	scrcmd_219
	releaseall
	end

scr_seq_0932_0178:
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0932_0198
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0932_018E:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0932_0198:
	npc_msg 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0932_01F9
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0932_0204
	npc_msg 7
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 40
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0932_01F9:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0932_0204:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
