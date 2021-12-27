#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0892_000E ; 000
	scrdef scr_seq_0892_00F4 ; 001
	scrdef scr_seq_0892_011F ; 002
	scrdef_end

scr_seq_0892_000E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_095
	gotoif TRUE, scr_seq_0892_00E9
	buffer_players_name 0
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0892_004B
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0892_00D3
	end

scr_seq_0892_004B:
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif eq, scr_seq_0892_00DE
	npc_msg 1
	scrcmd_137 133, 5, 0, 0, 0, 32780
	setflag FLAG_UNK_095
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	npc_msg 7
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0892_00A0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0892_00C6
scr_seq_0892_00A0:
	closemsg
	setvar VAR_TEMP_x4000, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_173 VAR_SPECIAL_x8005, VAR_TEMP_x4000
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0892_00C6:
	npc_msg 3
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_0892_00D3:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0892_00DE:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0892_00E9:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0892_00F4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_410D, 1
	gotoif eq, scr_seq_0892_0114
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0892_0114:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0892_011F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 9, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0892_019C
	comparevartovalue VAR_UNK_410D, 1
	gotoif eq, scr_seq_0892_0152
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0892_0152:
	npc_msg 12
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0892_0179
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0892_0191
	end

scr_seq_0892_0179:
	buffer_players_name 0
	npc_msg 13
	scrcmd_146 9
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0892_0191:
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0892_019C:
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
