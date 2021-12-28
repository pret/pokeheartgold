#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0952_0032 ; 000
	scrdef scr_seq_0952_007E ; 001
	scrdef scr_seq_0952_008C ; 002
	scrdef scr_seq_0952_009A ; 003
	scrdef scr_seq_0952_00A8 ; 004
	scrdef scr_seq_0952_00B6 ; 005
	scrdef scr_seq_0952_00C4 ; 006
	scrdef scr_seq_0952_00D2 ; 007
	scrdef scr_seq_0952_00E0 ; 008
	scrdef scr_seq_0952_00EE ; 009
	scrdef scr_seq_0952_00FC ; 010
	scrdef scr_seq_0952_010A ; 011
	scrdef_end

scr_seq_0952_0032:
	setflag FLAG_UNK_9CB
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 653
scr_seq_0952_0042:
	scrcmd_807 16384, 16386
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0952_005F
	setflagvar VAR_TEMP_x4001
	goto scr_seq_0952_0063

scr_seq_0952_005F:
	clearflagvar VAR_TEMP_x4001
scr_seq_0952_0063:
	addvar VAR_TEMP_x4000, 1
	addvar VAR_TEMP_x4001, 1
	comparevartovalue VAR_TEMP_x4000, 10
	gotoif lt, scr_seq_0952_0042
	end

scr_seq_0952_007E:
	setvar VAR_TEMP_x4000, 10
	goto scr_seq_0952_0118

scr_seq_0952_008A:
	.byte 0x02, 0x00
scr_seq_0952_008C:
	setvar VAR_TEMP_x4000, 0
	goto scr_seq_0952_0118

scr_seq_0952_0098:
	.byte 0x02, 0x00
scr_seq_0952_009A:
	setvar VAR_TEMP_x4000, 1
	goto scr_seq_0952_0118

scr_seq_0952_00A6:
	.byte 0x02, 0x00
scr_seq_0952_00A8:
	setvar VAR_TEMP_x4000, 2
	goto scr_seq_0952_0118

scr_seq_0952_00B4:
	.byte 0x02, 0x00
scr_seq_0952_00B6:
	setvar VAR_TEMP_x4000, 3
	goto scr_seq_0952_0118

scr_seq_0952_00C2:
	.byte 0x02, 0x00
scr_seq_0952_00C4:
	setvar VAR_TEMP_x4000, 4
	goto scr_seq_0952_0118

scr_seq_0952_00D0:
	.byte 0x02, 0x00
scr_seq_0952_00D2:
	setvar VAR_TEMP_x4000, 5
	goto scr_seq_0952_0118

scr_seq_0952_00DE:
	.byte 0x02, 0x00
scr_seq_0952_00E0:
	setvar VAR_TEMP_x4000, 6
	goto scr_seq_0952_0118

scr_seq_0952_00EC:
	.byte 0x02, 0x00
scr_seq_0952_00EE:
	setvar VAR_TEMP_x4000, 7
	goto scr_seq_0952_0118

scr_seq_0952_00FA:
	.byte 0x02, 0x00
scr_seq_0952_00FC:
	setvar VAR_TEMP_x4000, 8
	goto scr_seq_0952_0118

scr_seq_0952_0108:
	.byte 0x02, 0x00
scr_seq_0952_010A:
	setvar VAR_TEMP_x4000, 9
	goto scr_seq_0952_0118

scr_seq_0952_0116:
	.byte 0x02, 0x00
scr_seq_0952_0118:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4001, 2730
	addvar VAR_TEMP_x4001, VAR_TEMP_x4000
	checkflagvar VAR_TEMP_x4001, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0952_0186
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0952_0186
	scrcmd_784 4, 0
	scrcmd_809 16384
	scrcmd_049
	closemsg
	scrcmd_784 4, 1
	scrcmd_808 16384
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	callif eq, scr_seq_0952_0191
	setflagvar VAR_TEMP_x4001
	releaseall
	end

scr_seq_0952_0186:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0952_0191:
	npc_msg 2
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	closemsg
	scrcmd_555 1
	return
	.balign 4, 0
