#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0022_D17R1101_000A ; 000
	scrdef scr_seq_0022_D17R1101_00AB ; 001
	scrdef_end

scr_seq_0022_D17R1101_000A:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0022_D17R1101_001B
	clearflag FLAG_UNK_189
	end

scr_seq_0022_D17R1101_001B:
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_0022_D17R1101_00A5
	scrcmd_142 37, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0022_D17R1101_00A5
	scrcmd_147 37, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0022_D17R1101_0084
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0022_D17R1101_0067
	clearflag FLAG_UNK_2CA
	goto scr_seq_0022_D17R1101_0082

scr_seq_0022_D17R1101_0067:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0022_D17R1101_007E
	clearflag FLAG_UNK_2CA
	goto scr_seq_0022_D17R1101_0082

scr_seq_0022_D17R1101_007E:
	setflag FLAG_UNK_2CA
scr_seq_0022_D17R1101_0082:
	end

scr_seq_0022_D17R1101_0084:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0022_D17R1101_009F
	clearflag FLAG_UNK_2CA
	goto scr_seq_0022_D17R1101_00A3

scr_seq_0022_D17R1101_009F:
	setflag FLAG_UNK_2CA
scr_seq_0022_D17R1101_00A3:
	end

scr_seq_0022_D17R1101_00A5:
	setflag FLAG_UNK_2CA
	end

scr_seq_0022_D17R1101_00AB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 37, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0022_D17R1101_0159
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_0022_D17R1101_014E
	npc_msg 0
scr_seq_0022_D17R1101_00D6:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0022_D17R1101_00FA
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0022_D17R1101_013D
	end

scr_seq_0022_D17R1101_00FA:
	buffer_players_name 0
	npc_msg 1
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 37
	npc_msg 2
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_2CA
	hide_person 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0022_D17R1101_013D:
	setvar VAR_TEMP_x4002, 1
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0022_D17R1101_014E:
	npc_msg 4
	goto scr_seq_0022_D17R1101_00D6

scr_seq_0022_D17R1101_0157:
	.byte 0x02, 0x00
scr_seq_0022_D17R1101_0159:
	npc_msg 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0022_D17R1101_01BA
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0022_D17R1101_01C5
	npc_msg 6
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 20
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0022_D17R1101_01BA:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0022_D17R1101_01C5:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
