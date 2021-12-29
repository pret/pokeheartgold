#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0144_0012 ; 000
	scrdef scr_seq_0144_00B4 ; 001
	scrdef scr_seq_0144_018C ; 002
	scrdef scr_seq_0144_0060 ; 003
	scrdef_end

scr_seq_0144_0012:
	scrcmd_489 0
	scrcmd_813 16384
	scrcmd_490 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0144_0035
	setflag FLAG_UNK_2A8
	goto scr_seq_0144_0039

scr_seq_0144_0035:
	clearflag FLAG_UNK_2A8
scr_seq_0144_0039:
	scrcmd_489 1, VAR_UNK_4138
	comparevartovalue VAR_UNK_4138, 0
	gotoif ne, scr_seq_0144_0056
	setflag FLAG_UNK_2A7
	goto scr_seq_0144_005A

scr_seq_0144_0056:
	clearflag FLAG_UNK_2A7
scr_seq_0144_005A:
	scrcmd_489 7
	end

scr_seq_0144_0060:
	scrcmd_489 0
	scrcmd_813 16384
	scrcmd_490 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0144_0083
	setflag FLAG_UNK_2A8
	goto scr_seq_0144_0087

scr_seq_0144_0083:
	clearflag FLAG_UNK_2A8
scr_seq_0144_0087:
	scrcmd_489 1, VAR_UNK_4138
	comparevartovalue VAR_UNK_4138, 0
	gotoif ne, scr_seq_0144_00A4
	setflag FLAG_UNK_2A7
	goto scr_seq_0144_00A8

scr_seq_0144_00A4:
	clearflag FLAG_UNK_2A7
scr_seq_0144_00A8:
	setvar VAR_UNK_40E5, 2
	scrcmd_489 7
	end

scr_seq_0144_00B4:
	scrcmd_489 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_489 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0144_016D
	scrcmd_379 VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0144_00FD
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0144_0109
	goto scr_seq_0144_0115

scr_seq_0144_00FD:
	buffer_players_name 0
	npc_msg 0
	goto scr_seq_0144_0121

scr_seq_0144_0109:
	buffer_players_name 0
	npc_msg 1
	goto scr_seq_0144_0121

scr_seq_0144_0115:
	buffer_players_name 0
	npc_msg 2
	goto scr_seq_0144_0121

scr_seq_0144_0121:
	scrcmd_489 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0144_0157
	play_fanfare SEQ_ME_ITEM
	scrcmd_489 5, VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	msgbox_extern VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	wait_fanfare
	npc_msg 20
	waitbutton
	scrcmd_489 4
	goto scr_seq_0144_0182

scr_seq_0144_0157:
	scrcmd_489 6, VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	msgbox_extern VAR_SPECIAL_x8005, VAR_SPECIAL_x8006
	waitbutton
	goto scr_seq_0144_0178

scr_seq_0144_016D:
	npc_msg 3
	waitbutton
	goto scr_seq_0144_0178

scr_seq_0144_0178:
	closemsg
	releaseall
	scrcmd_489 7
	end

scr_seq_0144_0182:
	closemsg
	releaseall
	scrcmd_489 8
	end

scr_seq_0144_018C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_813 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0144_0232
	scrcmd_379 VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0144_01CF
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0144_01DB
	goto scr_seq_0144_01E7

scr_seq_0144_01CF:
	buffer_players_name 0
	npc_msg 27
	goto scr_seq_0144_01F3

scr_seq_0144_01DB:
	buffer_players_name 0
	npc_msg 28
	goto scr_seq_0144_01F3

scr_seq_0144_01E7:
	buffer_players_name 0
	npc_msg 29
	goto scr_seq_0144_01F3

scr_seq_0144_01F3:
	scrcmd_811 32772, 32773
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0144_0222
	callstd std_give_item_verbose
	scrcmd_812
	scrcmd_149 12
	npc_msg 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0144_0222:
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0144_0232:
	npc_msg 30
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
