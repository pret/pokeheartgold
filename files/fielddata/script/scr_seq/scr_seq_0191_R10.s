#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0191_R10_01A2 ; 000
	scrdef scr_seq_0191_R10_0039 ; 001
	scrdef scr_seq_0191_R10_00C1 ; 002
	scrdef scr_seq_0191_R10_0261 ; 003
	scrdef scr_seq_0191_R10_001E ; 004
	scrdef scr_seq_0191_R10_02BF ; 005
	scrdef scr_seq_0191_R10_02D4 ; 006
	scrdef_end

scr_seq_0191_R10_001E:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_0191_R10_002B
	end

scr_seq_0191_R10_002B:
	setflag FLAG_UNK_297
	hide_person 1
	clearflag FLAG_UNK_0A4
	end

scr_seq_0191_R10_0039:
	check_badge 15, VAR_TEMP_x4004
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, scr_seq_0191_R10_0052
	goto scr_seq_0191_R10_00BF

scr_seq_0191_R10_0052:
	checkflag FLAG_UNK_14A
	gotoif FALSE, scr_seq_0191_R10_00BF
	scrcmd_147 36, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0191_R10_00BF
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_0191_R10_008B
	clearflag FLAG_UNK_264
	goto scr_seq_0191_R10_00BD

scr_seq_0191_R10_008B:
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif ne, scr_seq_0191_R10_00A2
	clearflag FLAG_UNK_264
	goto scr_seq_0191_R10_00BD

scr_seq_0191_R10_00A2:
	comparevartovalue VAR_TEMP_x4000, 11
	gotoif ne, scr_seq_0191_R10_00B9
	clearflag FLAG_UNK_264
	goto scr_seq_0191_R10_00BD

scr_seq_0191_R10_00B9:
	setflag FLAG_UNK_264
scr_seq_0191_R10_00BD:
	end

scr_seq_0191_R10_00BF:
	end

scr_seq_0191_R10_00C1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 36, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0191_R10_0148
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0191_R10_0197
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 25
	gotoif ne, scr_seq_0191_R10_0197
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_0191_R10_018C
	npc_msg 0
scr_seq_0191_R10_0114:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0191_R10_0138
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0191_R10_017B
	end

scr_seq_0191_R10_0138:
	buffer_players_name 0
	npc_msg 1
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 36
scr_seq_0191_R10_0148:
	npc_msg 2
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_264
	hide_person 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0191_R10_017B:
	setvar VAR_TEMP_x4002, 1
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0191_R10_018C:
	npc_msg 4
	goto scr_seq_0191_R10_0114

scr_seq_0191_R10_0195:
	.byte 0x02, 0x00
scr_seq_0191_R10_0197:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0191_R10_01A2:
	scrcmd_609
	lockall
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_0191_R10_0209
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0191_R10_01D5
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0191_R10_01D5
	scrcmd_600
scr_seq_0191_R10_01D5:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 489, 0, 7, 20, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_582 18, 1423, 185
	releaseall
	end

scr_seq_0191_R10_0209:
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0191_R10_022D
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0191_R10_022D
	scrcmd_600
scr_seq_0191_R10_022D:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 467, 0, 7, 20, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_582 18, 1423, 185
	releaseall
	end

scr_seq_0191_R10_0261:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 145, 0
	scrcmd_077
	setflag FLAG_UNK_0A4
	scrcmd_589 145, 50, 0
	clearflag FLAG_UNK_0A4
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0191_R10_02B3
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, scr_seq_0191_R10_02AF
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, scr_seq_0191_R10_02B9
scr_seq_0191_R10_02AF:
	releaseall
	end

scr_seq_0191_R10_02B3:
	white_out
	releaseall
	end

scr_seq_0191_R10_02B9:
	setflag FLAG_UNK_14A
	return

scr_seq_0191_R10_02BF:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 8, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0191_R10_02D4:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 9, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
