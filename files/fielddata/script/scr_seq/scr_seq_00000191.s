#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000191_000001A2 ; 000
	scrdef scr_seq_00000191_00000039 ; 001
	scrdef scr_seq_00000191_000000C1 ; 002
	scrdef scr_seq_00000191_00000261 ; 003
	scrdef scr_seq_00000191_0000001E ; 004
	scrdef scr_seq_00000191_000002BF ; 005
	scrdef scr_seq_00000191_000002D4 ; 006
	scrdef_end

scr_seq_00000191_0000001E:
	checkflag FLAG_UNK_0A4
	gotoif TRUE, scr_seq_00000191_0000002B
	end

scr_seq_00000191_0000002B:
	setflag FLAG_UNK_297
	hide_person 1
	clearflag FLAG_UNK_0A4
	end

scr_seq_00000191_00000039:
	scrcmd_294 15, VAR_TEMP_x4004
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, scr_seq_00000191_00000052
	goto scr_seq_00000191_000000BF

scr_seq_00000191_00000052:
	checkflag FLAG_UNK_14A
	gotoif FALSE, scr_seq_00000191_000000BF
	scrcmd_147 36, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000191_000000BF
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_00000191_0000008B
	clearflag FLAG_UNK_264
	goto scr_seq_00000191_000000BD

scr_seq_00000191_0000008B:
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif ne, scr_seq_00000191_000000A2
	clearflag FLAG_UNK_264
	goto scr_seq_00000191_000000BD

scr_seq_00000191_000000A2:
	comparevartovalue VAR_TEMP_x4000, 11
	gotoif ne, scr_seq_00000191_000000B9
	clearflag FLAG_UNK_264
	goto scr_seq_00000191_000000BD

scr_seq_00000191_000000B9:
	setflag FLAG_UNK_264
scr_seq_00000191_000000BD:
	end

scr_seq_00000191_000000BF:
	end

scr_seq_00000191_000000C1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 36, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000191_00000148
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000191_00000197
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 25
	gotoif ne, scr_seq_00000191_00000197
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_00000191_0000018C
	msgbox 0
scr_seq_00000191_00000114:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000191_00000138
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000191_0000017B
	end

scr_seq_00000191_00000138:
	buffer_players_name 0
	msgbox 1
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 36
scr_seq_00000191_00000148:
	msgbox 2
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

scr_seq_00000191_0000017B:
	setvar VAR_TEMP_x4002, 1
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000191_0000018C:
	msgbox 4
	goto scr_seq_00000191_00000114

scr_seq_00000191_00000195:
	.byte 0x02, 0x00
scr_seq_00000191_00000197:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000191_000001A2:
	scrcmd_609
	lockall
	checkflag FLAG_UNK_118
	gotoif TRUE, scr_seq_00000191_00000209
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000191_000001D5
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000191_000001D5
	scrcmd_600
scr_seq_00000191_000001D5:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 489, 0, 7, 20, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_582 18, 1423, 185
	releaseall
	end

scr_seq_00000191_00000209:
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000191_0000022D
	scrcmd_596 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000191_0000022D
	scrcmd_600
scr_seq_00000191_0000022D:
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 467, 0, 7, 20, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_582 18, 1423, 185
	releaseall
	end

scr_seq_00000191_00000261:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 145, 0
	scrcmd_077
	setflag FLAG_UNK_0A4
	scrcmd_589 145, 50, 0
	clearflag FLAG_UNK_0A4
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000191_000002B3
	scrcmd_683 16386
	comparevartovalue VAR_TEMP_x4002, 3
	gotoif eq, scr_seq_00000191_000002AF
	comparevartovalue VAR_TEMP_x4002, 4
	callif eq, scr_seq_00000191_000002B9
scr_seq_00000191_000002AF:
	releaseall
	end

scr_seq_00000191_000002B3:
	scrcmd_219
	releaseall
	end

scr_seq_00000191_000002B9:
	setflag FLAG_UNK_14A
	return

scr_seq_00000191_000002BF:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 8, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000191_000002D4:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 9, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
