#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0121_D48R0101_01BC ; 000
	scrdef scr_seq_0121_D48R0101_0238 ; 001
	scrdef scr_seq_0121_D48R0101_024B ; 002
	scrdef scr_seq_0121_D48R0101_025E ; 003
	scrdef scr_seq_0121_D48R0101_0067 ; 004
	scrdef scr_seq_0121_D48R0101_001E ; 005
	scrdef scr_seq_0121_D48R0101_0037 ; 006
	scrdef_end

scr_seq_0121_D48R0101_001E:
	comparevartovalue VAR_UNK_40F9, 2
	gotoif eq, scr_seq_0121_D48R0101_0031
	setflag FLAG_UNK_2CE
	end

scr_seq_0121_D48R0101_0031:
	clearflag FLAG_UNK_2CE
	end

scr_seq_0121_D48R0101_0037:
	comparevartovalue VAR_UNK_40F9, 2
	gotoif eq, scr_seq_0121_D48R0101_0046
	end

scr_seq_0121_D48R0101_0046:
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif eq, scr_seq_0121_D48R0101_0065
	move_person 3, 19, 0, 40, 1
	end

scr_seq_0121_D48R0101_0065:
	end

scr_seq_0121_D48R0101_0067:
	scrcmd_609
	lockall
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_0121_D48R0101_0086
	apply_movement 3, scr_seq_0121_D48R0101_0130
	goto scr_seq_0121_D48R0101_008E

scr_seq_0121_D48R0101_0086:
	apply_movement 3, scr_seq_0121_D48R0101_0148
scr_seq_0121_D48R0101_008E:
	wait_movement
	buffer_players_name 0
	npc_msg 7
	closemsg
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_0121_D48R0101_00B3
	apply_movement 3, scr_seq_0121_D48R0101_0160
	goto scr_seq_0121_D48R0101_00BB

scr_seq_0121_D48R0101_00B3:
	apply_movement 3, scr_seq_0121_D48R0101_016C
scr_seq_0121_D48R0101_00BB:
	wait_movement
	npc_msg 8
	closemsg
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_0121_D48R0101_00DD
	apply_movement 3, scr_seq_0121_D48R0101_0178
	goto scr_seq_0121_D48R0101_00E5

scr_seq_0121_D48R0101_00DD:
	apply_movement 3, scr_seq_0121_D48R0101_0180
scr_seq_0121_D48R0101_00E5:
	wait_movement
	npc_msg 9
	closemsg
	comparevartovalue VAR_TEMP_x4001, 2
	gotoif ne, scr_seq_0121_D48R0101_010F
	apply_movement 255, scr_seq_0121_D48R0101_01A8
	apply_movement 3, scr_seq_0121_D48R0101_0188
	goto scr_seq_0121_D48R0101_0117

scr_seq_0121_D48R0101_010F:
	apply_movement 3, scr_seq_0121_D48R0101_0194
scr_seq_0121_D48R0101_0117:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	setflag FLAG_UNK_2CE
	hide_person 3
	setvar VAR_UNK_40F9, 3
	releaseall
	end

scr_seq_0121_D48R0101_012F:
	.byte 0x00

scr_seq_0121_D48R0101_0130:
	step 35, 1
	step 63, 1
	step 15, 2
	step 13, 1
	step 15, 1
	step_end

scr_seq_0121_D48R0101_0148:
	step 33, 1
	step 63, 1
	step 13, 3
	step 14, 1
	step 13, 1
	step_end

scr_seq_0121_D48R0101_0160:
	step 75, 1
	step 63, 1
	step_end

scr_seq_0121_D48R0101_016C:
	step 75, 1
	step 63, 1
	step_end

scr_seq_0121_D48R0101_0178:
	step 35, 1
	step_end

scr_seq_0121_D48R0101_0180:
	step 33, 1
	step_end

scr_seq_0121_D48R0101_0188:
	step 63, 1
	step 15, 2
	step_end

scr_seq_0121_D48R0101_0194:
	step 63, 1
	step 12, 4
	step 15, 2
	step 12, 9
	step_end

scr_seq_0121_D48R0101_01A8:
	step 71, 1
	step 12, 1
	step 72, 1
	step 33, 1
	step_end
scr_seq_0121_D48R0101_01BC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40EB, 1
	gotoif eq, scr_seq_0121_D48R0101_0215
	checkflag FLAG_UNK_0F5
	gotoif TRUE, scr_seq_0121_D48R0101_01E7
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0121_D48R0101_01E7:
	npc_msg 1
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0121_D48R0101_020A
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0121_D48R0101_020A:
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0121_D48R0101_0215:
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0121_D48R0101_0220:
	.byte 0x24, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0c, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0121_D48R0101_0238:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0121_D48R0101_024B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0121_D48R0101_025E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0F5
	gotoif TRUE, scr_seq_0121_D48R0101_027C
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0121_D48R0101_027C:
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
