#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0947_000A ; 000
	scrdef scr_seq_0947_00D5 ; 001
	scrdef_end

scr_seq_0947_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0D0
	gotoif TRUE, scr_seq_0947_00CA
	npc_msg 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0947_003B
	goto scr_seq_0947_00BF

scr_seq_0947_003B:
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0947_00BF
	scrcmd_470 3
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_239 32772, 32774
	comparevartovalue VAR_SPECIAL_x8006, 0
	gotoif eq, scr_seq_0947_00B2
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_0947_00B2
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_0D0
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0947_00B2:
	scrcmd_474
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0947_00BF:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0947_00CA:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0947_00D5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8000
	scrcmd_480 32780, 32768, 24
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0947_0199
	scrcmd_193 0, 32768
	npc_msg 5
	scrcmd_483 32780, 32768
	comparevartovalue VAR_SPECIAL_x800C, 510
	gotoif lt, scr_seq_0947_0136
	npc_msg 6
	scrcmd_481 32768, 24
	play_fanfare SEQ_ME_ITEM
	buffer_players_name 1
	npc_msg 7
	wait_fanfare
	scrcmd_193 0, 32768
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0947_0136:
	comparevartovalue VAR_SPECIAL_x800C, 506
	gotoif ne, scr_seq_0947_014C
	npc_msg 10
	goto scr_seq_0947_0191

scr_seq_0947_014C:
	comparevartovalue VAR_SPECIAL_x800C, 507
	gotoif ne, scr_seq_0947_0162
	npc_msg 11
	goto scr_seq_0947_0191

scr_seq_0947_0162:
	comparevartovalue VAR_SPECIAL_x800C, 508
	gotoif ne, scr_seq_0947_0178
	npc_msg 12
	goto scr_seq_0947_0191

scr_seq_0947_0178:
	comparevartovalue VAR_SPECIAL_x800C, 509
	gotoif ne, scr_seq_0947_018E
	npc_msg 13
	goto scr_seq_0947_0191

scr_seq_0947_018E:
	npc_msg 9
scr_seq_0947_0191:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0947_0199:
	scrcmd_193 0, 32768
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
