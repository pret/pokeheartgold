#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0039_D24R0202_0016 ; 000
	scrdef scr_seq_0039_D24R0202_0250 ; 001
	scrdef scr_seq_0039_D24R0202_025B ; 002
	scrdef scr_seq_0039_D24R0202_02B4 ; 003
	scrdef scr_seq_0039_D24R0202_014B ; 004
	scrdef_end

scr_seq_0039_D24R0202_0016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_713 0
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	checkflag FLAG_UNK_977
	gotoif TRUE, scr_seq_0039_D24R0202_004A
	releaseall
	end

scr_seq_0039_D24R0202_004A:
	setflag FLAG_UNK_188
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_0039_D24R0202_02AC
	wait_movement
	hide_person 1
	play_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_111
	setflag FLAG_UNK_21C
	clearflag FLAG_UNK_235
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0039_D24R0202_00A2
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0039_D24R0202_00B2
	end

scr_seq_0039_D24R0202_00A2:
	apply_movement 255, scr_seq_0039_D24R0202_0234
	wait_movement
	goto scr_seq_0039_D24R0202_00C4

scr_seq_0039_D24R0202_00B2:
	apply_movement 255, scr_seq_0039_D24R0202_0234
	apply_movement 253, scr_seq_0039_D24R0202_0240
	wait_movement
scr_seq_0039_D24R0202_00C4:
	setvar VAR_UNK_40CE, 1
	comparevartovalue VAR_UNK_40EC, 1
	gotoif ge, scr_seq_0039_D24R0202_010F
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 25, 6, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	setvar VAR_UNK_40DD, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_0039_D24R0202_010F:
	setflag FLAG_UNK_235
	play_se SEQ_SE_GS_RAKKA01
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 25, 6, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	setvar VAR_UNK_40DD, 1
	addvar VAR_UNK_40EC, 1
	releaseall
	end

scr_seq_0039_D24R0202_014B:
	scrcmd_609
	lockall
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0039_D24R0202_016F
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0039_D24R0202_017F
	end

scr_seq_0039_D24R0202_016F:
	apply_movement 255, scr_seq_0039_D24R0202_0234
	wait_movement
	goto scr_seq_0039_D24R0202_0191

scr_seq_0039_D24R0202_017F:
	apply_movement 255, scr_seq_0039_D24R0202_0234
	apply_movement 253, scr_seq_0039_D24R0202_0240
	wait_movement
scr_seq_0039_D24R0202_0191:
	setvar VAR_UNK_40CE, 1
	play_se SEQ_SE_GS_RAKKA01
	comparevartovalue VAR_UNK_403E, 7
	gotoif ge, scr_seq_0039_D24R0202_01DD
	comparevartovalue VAR_UNK_403E, 6
	gotoif eq, scr_seq_0039_D24R0202_0207
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 315, 0, 25, 6, 0
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_0039_D24R0202_01D9:
	releaseall
	end

scr_seq_0039_D24R0202_01DD:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 492, 0, 25, 6, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0039_D24R0202_01D9

scr_seq_0039_D24R0202_0207:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 490, 0, 25, 6, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	goto scr_seq_0039_D24R0202_01D9

scr_seq_0039_D24R0202_0231:
	.byte 0x00, 0x00, 0x00

scr_seq_0039_D24R0202_0234:
	step 40, 4
	step 69, 1
	step_end

scr_seq_0039_D24R0202_0240:
	step 62, 3
	step 20, 1
	step 69, 1
	step_end
scr_seq_0039_D24R0202_0250:
	scrcmd_609
	lockall
	scrcmd_714 0
	releaseall
	end

scr_seq_0039_D24R0202_025B:
	scrcmd_609
	lockall
	checkflag FLAG_UNK_21B
	gotoif TRUE, scr_seq_0039_D24R0202_029A
	wait 2, VAR_SPECIAL_x8004
	scrcmd_561 0, 2, 10, 6
	wait 10, VAR_SPECIAL_x8004
	apply_movement 255, scr_seq_0039_D24R0202_02AC
	wait_movement
	hide_person 0
	setflag FLAG_UNK_21B
	play_se SEQ_SE_DP_UG_008
	releaseall
	end

scr_seq_0039_D24R0202_029A:
	wait 10, VAR_SPECIAL_x8004
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0039_D24R0202_02AB:
	.byte 0x00

scr_seq_0039_D24R0202_02AC:
	step 75, 1
	step_end
scr_seq_0039_D24R0202_02B4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_188
	gotoif TRUE, scr_seq_0039_D24R0202_02D2
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0039_D24R0202_02D2:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
