#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000115_0000004D ; 000
	scrdef scr_seq_00000115_0000000A ; 001
	scrdef_end

scr_seq_00000115_0000000A:
	scrcmd_147 34, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000115_00000047
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_00000115_00000030
	goto scr_seq_00000115_00000047

scr_seq_00000115_0000002E:
	.byte 0x02, 0x00
scr_seq_00000115_00000030:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_00000115_00000047
	clearflag FLAG_UNK_263
	end

scr_seq_00000115_00000047:
	setflag FLAG_UNK_263
	end

scr_seq_00000115_0000004D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_00000115_000000DD
	msgbox 0
scr_seq_00000115_00000065:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000115_00000089
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000115_000000CC
	end

scr_seq_00000115_00000089:
	buffer_players_name 0
	msgbox 1
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 34
	msgbox 2
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

scr_seq_00000115_000000CC:
	setvar VAR_TEMP_x4002, 1
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000115_000000DD:
	msgbox 4
	goto scr_seq_00000115_00000065

scr_seq_00000115_000000E6:
	.byte 0x02, 0x00
	.balign 4, 0
