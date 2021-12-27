#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0098_0006 ; 000
	scrdef_end

scr_seq_0098_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_10C
	gotoif TRUE, scr_seq_0098_0097
	checkflag FLAG_UNK_10D
	gotoif TRUE, scr_seq_0098_0046
	npc_msg 0
	closemsg
	trainer_battle 158, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0098_00CC
	setflag FLAG_UNK_10D
scr_seq_0098_0046:
	npc_msg 1
	get_party_count VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8005, 6
	gotoif ne, scr_seq_0098_0063
	npc_msg 4
	goto scr_seq_0098_00D2

scr_seq_0098_0063:
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_POKEGET
	wait_fanfare
	scrcmd_137 236, 10, 0, 0, 0, 32780
	npc_msg 5
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif eq, scr_seq_0098_00A6
	scrcmd_747
scr_seq_0098_0097:
	setflag FLAG_UNK_10C
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0098_00A6:
	setvar VAR_TEMP_x4000, 0
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_173 VAR_SPECIAL_x8005, VAR_TEMP_x4000
	fade_screen 6, 1, 1, 0
	wait_fade
	return

scr_seq_0098_00CC:
	scrcmd_219
	releaseall
	end

scr_seq_0098_00D2:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
