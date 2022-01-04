#include "constants/scrcmd.h"
#include "fielddata/script/scr_seq/event_T03PC0101.h"
#include "msgdata/msg/msg_0463_T03PC0101.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_T03PC0101_000
	scrdef scr_seq_T03PC0101_001
	scrdef scr_seq_T03PC0101_002
	scrdef scr_seq_T03PC0101_003
	scrdef scr_seq_T03PC0101_004
	scrdef_end

scr_seq_T03PC0101_000:
	setvar VAR_SPECIAL_x8007, 0
	callstd std_nurse_joy
	end

scr_seq_T03PC0101_001:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_133
	gotoif TRUE, _00C9
	npc_msg msg_0463_T03PC0101_00003
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, _00BE
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_566
	get_party_selection VAR_SPECIAL_x800C
	scrcmd_150
	fade_screen 6, 1, 1, 0x00
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, _00BE
	scrcmd_470 9
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, _00B1
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_133
	npc_msg msg_0463_T03PC0101_00004
	waitbutton
	closemsg
	releaseall
	end

_00B1:
	scrcmd_474
	npc_msg msg_0463_T03PC0101_00005
	waitbutton
	closemsg
	releaseall
	end

_00BE:
	npc_msg msg_0463_T03PC0101_00006
	waitbutton
	closemsg
	releaseall
	end

_00C9:
	npc_msg msg_0463_T03PC0101_00007
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03PC0101_002:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0463_T03PC0101_00000
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03PC0101_003:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	play_cry SPECIES_JIGGLYPUFF, 0
	npc_msg msg_0463_T03PC0101_00001
	wait_cry
	waitbutton
	closemsg
	releaseall
	end

scr_seq_T03PC0101_004:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg msg_0463_T03PC0101_00002
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
