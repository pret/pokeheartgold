#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0940_0006 ; 000
	scrdef_end

scr_seq_0940_0006:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_RED_GYARADOS_MEET
	gotoif TRUE, scr_seq_0940_003A
	checkflag FLAG_UNK_0C8
	gotoif TRUE, scr_seq_0940_002F
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0940_002F:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0940_003A:
	scrcmd_784 0, 0
	scrcmd_389 32780, 129
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0940_005A
	npc_msg 2
	goto scr_seq_0940_0146

scr_seq_0940_005A:
	npc_msg 3
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32770
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8002, 255
	gotoif ne, scr_seq_0940_0095
	npc_msg 10
	goto scr_seq_0940_0146

scr_seq_0940_0095:
	get_partymon_species VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 129
	gotoif eq, scr_seq_0940_00B1
	npc_msg 8
	goto scr_seq_0940_0146

scr_seq_0940_00B1:
	scrcmd_390 32780, 32770
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0940_00E3
	scrcmd_392 0, 1, 32770
	scrcmd_393 2, 3, 129
	npc_msg 7
	goto scr_seq_0940_0146

scr_seq_0940_00DD:
	.byte 0x16, 0x00, 0x1e
	.byte 0x00, 0x00, 0x00
scr_seq_0940_00E3:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0940_0101
	scrcmd_393 0, 1, 129
	npc_msg 6
	goto scr_seq_0940_0146

scr_seq_0940_0101:
	scrcmd_392 0, 1, 32770
	npc_msg 4
	setvar VAR_SPECIAL_x8004, 38
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0940_0137
	callstd 2009
	goto scr_seq_0940_0148

scr_seq_0940_0137:
	callstd 2033
	scrcmd_391 32770
	setflag FLAG_UNK_139
	npc_msg 5
scr_seq_0940_0146:
	waitbutton
scr_seq_0940_0148:
	closemsg
	scrcmd_784 0, 1
	releaseall
	end
	.balign 4, 0
