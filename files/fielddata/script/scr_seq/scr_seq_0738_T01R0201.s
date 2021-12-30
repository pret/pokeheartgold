#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0738_T01R0201_0006 ; 000
	scrdef_end

scr_seq_0738_T01R0201_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_490 16674
	comparevartovalue VAR_UNK_4122, 7
	gotoif eq, scr_seq_0738_T01R0201_003B
scr_seq_0738_T01R0201_001F:
	scrcmd_522 32780
	comparevartovalue VAR_SPECIAL_x800C, 15
	gotoif eq, scr_seq_0738_T01R0201_0056
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0738_T01R0201_003B:
	scrcmd_147 31, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0738_T01R0201_001F
	goto scr_seq_0738_T01R0201_015D

scr_seq_0738_T01R0201_0054:
	.byte 0x02, 0x00
scr_seq_0738_T01R0201_0056:
	checkflag FLAG_UNK_AA8
	gotoif TRUE, scr_seq_0738_T01R0201_0152
	npc_msg 1
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0738_T01R0201_0147
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0738_T01R0201_0099
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0738_T01R0201_00A7
	end

scr_seq_0738_T01R0201_0099:
	setvar VAR_SPECIAL_x8004, 0
	goto scr_seq_0738_T01R0201_00F0

scr_seq_0738_T01R0201_00A5:
	.byte 0x02, 0x00
scr_seq_0738_T01R0201_00A7:
	npc_msg 2
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_349
	scrcmd_351 32772
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	scrcmd_490 32772
	comparevartovalue VAR_SPECIAL_x8004, 255
	gotoif eq, scr_seq_0738_T01R0201_0147
	get_partymon_species VAR_SPECIAL_x8004, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0738_T01R0201_013C
scr_seq_0738_T01R0201_00F0:
	bufferpartymonnick 0, VAR_SPECIAL_x8004
	play_se SEQ_SE_DP_FW367
	npc_msg 3
	wait_se SEQ_SE_DP_FW367
	wait 15, VAR_SPECIAL_x800C
	scrcmd_383 10, 32772
	scrcmd_828 32772, 1, 32
	scrcmd_828 32772, 5, 22
	comparevartovalue VAR_UNK_4122, 7
	gotoif eq, scr_seq_0738_T01R0201_012D
	addvar VAR_UNK_4122, 1
scr_seq_0738_T01R0201_012D:
	setflag FLAG_UNK_AA8
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0738_T01R0201_013C:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0738_T01R0201_0147:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0738_T01R0201_0152:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0738_T01R0201_015D:
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif ge, scr_seq_0738_T01R0201_01AE
	npc_msg 8
scr_seq_0738_T01R0201_016D:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0738_T01R0201_019D
	register_gear_number 31
	buffer_players_name 0
	npc_msg 9
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0738_T01R0201_019D:
	npc_msg 11
	waitbutton
	closemsg
	setvar VAR_TEMP_x4004, 1
	releaseall
	end

scr_seq_0738_T01R0201_01AE:
	npc_msg 12
	goto scr_seq_0738_T01R0201_016D

scr_seq_0738_T01R0201_01B7:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00
	.balign 4, 0
