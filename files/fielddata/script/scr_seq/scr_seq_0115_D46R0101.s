#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0115_D46R0101_004D ; 000
	scrdef scr_seq_0115_D46R0101_000A ; 001
	scrdef_end

scr_seq_0115_D46R0101_000A:
	scrcmd_147 34, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0115_D46R0101_0047
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0115_D46R0101_0030
	goto scr_seq_0115_D46R0101_0047

scr_seq_0115_D46R0101_002E:
	.byte 0x02, 0x00
scr_seq_0115_D46R0101_0030:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0115_D46R0101_0047
	clearflag FLAG_UNK_263
	end

scr_seq_0115_D46R0101_0047:
	setflag FLAG_UNK_263
	end

scr_seq_0115_D46R0101_004D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_0115_D46R0101_00DD
	npc_msg 0
scr_seq_0115_D46R0101_0065:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0115_D46R0101_0089
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0115_D46R0101_00CC
	end

scr_seq_0115_D46R0101_0089:
	buffer_players_name 0
	npc_msg 1
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 34
	npc_msg 2
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_263
	hide_person 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0115_D46R0101_00CC:
	setvar VAR_TEMP_x4002, 1
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0115_D46R0101_00DD:
	npc_msg 4
	goto scr_seq_0115_D46R0101_0065

scr_seq_0115_D46R0101_00E6:
	.byte 0x02, 0x00
	.balign 4, 0
