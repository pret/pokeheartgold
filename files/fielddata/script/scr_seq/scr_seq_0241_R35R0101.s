#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0241_R35R0101_0056 ; 000
	scrdef scr_seq_0241_R35R0101_000A ; 001
	scrdef_end

scr_seq_0241_R35R0101_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_08A
	gotoif TRUE, scr_seq_0241_R35R0101_0028
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0241_R35R0101_0028:
	npc_msg 14
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0241_R35R0101_004B
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0241_R35R0101_004B:
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0241_R35R0101_0056:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4114, 1
	gotoif eq, scr_seq_0241_R35R0101_00BC
	comparevartovalue VAR_UNK_4114, 2
	gotoif ge, scr_seq_0241_R35R0101_0104
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0241_R35R0101_00EE
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0241_R35R0101_00F9
	npc_msg 3
	scrcmd_362 7, 20, 101
	setvar VAR_UNK_4114, 1
	buffer_players_name 0
	npc_msg 4
	play_fanfare SEQ_ME_PT_SPECIAL
	wait_fanfare
scr_seq_0241_R35R0101_00BC:
	scrcmd_781 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0241_R35R0101_0178
	checkflag FLAG_UNK_0B5
	gotoif TRUE, scr_seq_0241_R35R0101_00E3
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0241_R35R0101_00E3:
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0241_R35R0101_00EE:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0241_R35R0101_00F9:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0241_R35R0101_0104:
	comparevartovalue VAR_UNK_4114, 4
	gotoif ge, scr_seq_0241_R35R0101_016D
	npc_msg 7
	setvar VAR_SPECIAL_x8004, 45
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0241_R35R0101_0163
	callstd std_give_item_verbose
	comparevartovalue VAR_UNK_4114, 3
	gotoif ne, scr_seq_0241_R35R0101_0152
	setvar VAR_UNK_4114, 5
	goto scr_seq_0241_R35R0101_0158

scr_seq_0241_R35R0101_0152:
	setvar VAR_UNK_4114, 4
scr_seq_0241_R35R0101_0158:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0241_R35R0101_0163:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0241_R35R0101_016D:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0241_R35R0101_0178:
	setvar VAR_UNK_4114, 6
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
