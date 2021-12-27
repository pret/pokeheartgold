#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0031_0022 ; 000
	scrdef scr_seq_0031_0054 ; 001
	scrdef scr_seq_0031_0067 ; 002
	scrdef scr_seq_0031_007A ; 003
	scrdef scr_seq_0031_00A3 ; 004
	scrdef scr_seq_0031_00B6 ; 005
	scrdef scr_seq_0031_0158 ; 006
	scrdef scr_seq_0031_017E ; 007
	scrdef_end

scr_seq_0031_0022:
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0031_0041
	clearflag FLAG_UNK_1B7
	goto scr_seq_0031_0052

scr_seq_0031_0041:
	comparevartovalue VAR_UNK_4077, 5
	gotoif ne, scr_seq_0031_0052
	clearflag FLAG_UNK_1B8
scr_seq_0031_0052:
	end

scr_seq_0031_0054:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0031_0067:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0031_007A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0031_0098
	npc_msg 1
	goto scr_seq_0031_009B

scr_seq_0031_0098:
	npc_msg 2
scr_seq_0031_009B:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0031_00A3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0031_00B6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0031_00E7
	getitemquantity 476, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0031_00F5
	npc_msg 3
	goto scr_seq_0031_00ED

scr_seq_0031_00E7:
	goto scr_seq_0031_0100

scr_seq_0031_00ED:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0031_00F5:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0031_0100:
	checkflag FLAG_UNK_08F
	gotoif TRUE, scr_seq_0031_014D
	npc_msg 5
	setvar VAR_SPECIAL_x8004, 338
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0031_0142
	callstd 2033
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_08F
	end

scr_seq_0031_0142:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0031_014D:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0031_0158:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	getitemquantity 475, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0031_01B4
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0031_017E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_090
	gotoif TRUE, scr_seq_0031_01E2
	npc_msg 11
	closemsg
	getitemquantity 475, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0031_01B4
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0031_01B4:
	buffer_players_name 0
	npc_msg 12
	closemsg
	apply_movement 7, scr_seq_0031_01F0
	apply_movement 8, scr_seq_0031_01F8
	wait_movement
	releaseall
	setflag FLAG_UNK_1BF
	hide_person 7
	hide_person 8
	setflag FLAG_UNK_090
	end

scr_seq_0031_01E2:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0031_01ED:
	.byte 0x00, 0x00, 0x00

scr_seq_0031_01F0:
	.short 14, 2
	.short 254, 0

scr_seq_0031_01F8:
	.short 15, 2
	.short 254, 0
	.balign 4, 0
