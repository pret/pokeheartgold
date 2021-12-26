#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000892_0000000E ; 000
	scrdef scr_seq_00000892_000000F4 ; 001
	scrdef scr_seq_00000892_0000011F ; 002
	scrdef_end

scr_seq_00000892_0000000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_095
	gotoif TRUE, scr_seq_00000892_000000E9
	buffer_players_name 0
	msgbox 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000892_0000004B
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000892_000000D3
	end

scr_seq_00000892_0000004B:
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif eq, scr_seq_00000892_000000DE
	msgbox 1
	scrcmd_137 133, 5, 0, 0, 0, 32780
	setflag FLAG_UNK_095
	buffer_players_name 0
	msgbox 2
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	msgbox 7
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000892_000000A0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000892_000000C6
scr_seq_00000892_000000A0:
	closemsg
	setvar VAR_TEMP_x4000, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_173 VAR_SPECIAL_x8005, VAR_TEMP_x4000
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_00000892_000000C6:
	msgbox 3
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000892_000000D3:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000892_000000DE:
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000892_000000E9:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000892_000000F4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_410D, 1
	gotoif eq, scr_seq_00000892_00000114
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000892_00000114:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000892_0000011F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 9, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000892_0000019C
	comparevartovalue VAR_UNK_410D, 1
	gotoif eq, scr_seq_00000892_00000152
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000892_00000152:
	msgbox 12
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000892_00000179
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000892_00000191
	end

scr_seq_00000892_00000179:
	buffer_players_name 0
	msgbox 13
	scrcmd_146 9
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000892_00000191:
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000892_0000019C:
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
