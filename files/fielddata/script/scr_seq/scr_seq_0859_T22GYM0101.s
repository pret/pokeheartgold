#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0859_001A ; 000
	scrdef scr_seq_0859_00AD ; 001
	scrdef scr_seq_0859_0184 ; 002
	scrdef scr_seq_0859_01C8 ; 003
	scrdef scr_seq_0859_01FA ; 004
	scrdef scr_seq_0859_01B5 ; 005
	scrdef_end

scr_seq_0859_001A:
	scrcmd_324
	scrcmd_142 18, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0859_00A7
	scrcmd_147 18, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0859_007E
	scrcmd_294 12, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0859_005B
	goto scr_seq_0859_00A1

scr_seq_0859_005B:
	scrcmd_484 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif ne, scr_seq_0859_0076
	setflag FLAG_UNK_2E9
	goto scr_seq_0859_007C

scr_seq_0859_0076:
	goto scr_seq_0859_00A1

scr_seq_0859_007C:
	end

scr_seq_0859_007E:
	scrcmd_484 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif ne, scr_seq_0859_0099
	setflag FLAG_UNK_2E9
	goto scr_seq_0859_009F

scr_seq_0859_0099:
	goto scr_seq_0859_00A1

scr_seq_0859_009F:
	end

scr_seq_0859_00A1:
	clearflag FLAG_UNK_2E9
	end

scr_seq_0859_00A7:
	setflag FLAG_UNK_2E9
	end

scr_seq_0859_00AD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0859_0168
	npc_msg 0
	closemsg
	trainer_battle 20, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0859_017E
	scrcmd_295 0
	scrcmd_515 22
	settrainerflag 29
	settrainerflag 50
	setvar VAR_UNK_4074, 1
	setflag FLAG_UNK_192
	setvar VAR_UNK_4108, 6
	setflag FLAG_UNK_0F4
	setflag FLAG_UNK_193
	npc_msg 1
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg 3
	goto scr_seq_0859_0126

scr_seq_0859_0126:
	setvar VAR_SPECIAL_x8004, 378
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0859_015E
	callstd 2033
	setflag FLAG_UNK_073
	clearflag FLAG_UNK_2E5
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0859_015E:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0859_0168:
	checkflag FLAG_UNK_073
	gotoif FALSE, scr_seq_0859_0126
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0859_017E:
	scrcmd_219
	releaseall
	end

scr_seq_0859_0184:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 0, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0859_01AA
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0859_01AA:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0859_01B5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0859_01C8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 0, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0859_01EF
	npc_msg 9
	goto scr_seq_0859_01F2

scr_seq_0859_01EF:
	npc_msg 10
scr_seq_0859_01F2:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0859_01FA:
	setvar VAR_TEMP_x4000, 0
	scrcmd_325
	end
	.balign 4, 0
