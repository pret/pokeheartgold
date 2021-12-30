#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0066_D27R0107_002F ; 000
	scrdef scr_seq_0066_D27R0107_0240 ; 001
	scrdef scr_seq_0066_D27R0107_027C ; 002
	scrdef scr_seq_0066_D27R0107_0016 ; 003
	scrdef scr_seq_0066_D27R0107_001E ; 004
	scrdef_end

scr_seq_0066_D27R0107_0016:
	setvar VAR_UNK_4125, 0
	end

scr_seq_0066_D27R0107_001E:
	checkflag FLAG_UNK_1D8
	gotoif TRUE, scr_seq_0066_D27R0107_002D
	scrcmd_375 4
scr_seq_0066_D27R0107_002D:
	end

scr_seq_0066_D27R0107_002F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0B9
	gotoif TRUE, scr_seq_0066_D27R0107_00B5
	comparevartovalue VAR_UNK_40A5, 0
	gotoif eq, scr_seq_0066_D27R0107_0062
	npc_msg 1
	closemsg
	apply_movement 1, scr_seq_0066_D27R0107_01B0
	wait_movement
	releaseall
	end

scr_seq_0066_D27R0107_0062:
	npc_msg 0
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 255, scr_seq_0066_D27R0107_01D0
	apply_movement 1, scr_seq_0066_D27R0107_01B8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_DP_DOOR
	hide_person 4
	hide_person 0
	wait_se SEQ_SE_DP_DOOR
	apply_movement 1, scr_seq_0066_D27R0107_01F0
	wait_movement
	releaseall
	setvar VAR_UNK_40A5, 1
	setflag FLAG_UNK_1D8
	end

scr_seq_0066_D27R0107_00B5:
	npc_msg 2
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0066_D27R0107_017F
	takeitem ITEM_SECRETPOTION, 1, VAR_SPECIAL_x800C
	buffer_players_name 0
	npc_msg 3
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg 4
	closemsg
	apply_movement 1, scr_seq_0066_D27R0107_01B0
	wait_movement
	npc_msg 5
	closemsg
	apply_movement 2, scr_seq_0066_D27R0107_01A0
	wait_movement
	scrcmd_076 181, 0
	npc_msg 6
	scrcmd_077
	closemsg
	scrcmd_459
	apply_movement 2, scr_seq_0066_D27R0107_01A8
	wait_movement
	scrcmd_076 181, 0
	scrcmd_077
	npc_msg 7
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	apply_movement 255, scr_seq_0066_D27R0107_0218
	apply_movement 1, scr_seq_0066_D27R0107_0200
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person 1
	releaseall
	setflag FLAG_UNK_96A
	setvar VAR_UNK_40A5, 2
	setvar VAR_UNK_410E, 1
	setflag FLAG_UNK_1D7
	clearflag FLAG_UNK_1D9
	setflag FLAG_UNK_1DA
	setflag FLAG_UNK_1DB
	clearflag FLAG_UNK_1DC
	clearflag FLAG_UNK_1DD
	setflag FLAG_UNK_998
	end

scr_seq_0066_D27R0107_017F:
	npc_msg 8
	closemsg
	apply_movement 1, scr_seq_0066_D27R0107_01B0
	wait_movement
	npc_msg 9
	closemsg
	scrcmd_076 181, 12
	scrcmd_077
	releaseall
	end

scr_seq_0066_D27R0107_019F:
	.byte 0x00

scr_seq_0066_D27R0107_01A0:
	step 30, 1
	step_end

scr_seq_0066_D27R0107_01A8:
	step 50, 3
	step_end

scr_seq_0066_D27R0107_01B0:
	step 31, 1
	step_end

scr_seq_0066_D27R0107_01B8:
	step 63, 1
	step 13, 3
	step 15, 1
	step 33, 1
	step 65, 1
	step_end

scr_seq_0066_D27R0107_01D0:
	step 2, 1
	step 71, 1
	step 15, 1
	step 72, 1
	step 63, 3
	step 62, 1
	step 33, 1
	step_end

scr_seq_0066_D27R0107_01F0:
	step 14, 1
	step 12, 3
	step 35, 1
	step_end

scr_seq_0066_D27R0107_0200:
	step 63, 1
	step 13, 1
	step 15, 2
	step 33, 1
	step 13, 1
	step_end

scr_seq_0066_D27R0107_0218:
	step 0, 1
	step 71, 1
	step 13, 1
	step 72, 1
	step 63, 2
	step 62, 1
	step 35, 1
	step_end
	.byte 0x0a, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0066_D27R0107_0240:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_40A5, 2
	gotoif lt, scr_seq_0066_D27R0107_0266
	scrcmd_076 181, 0
	npc_msg 12
	scrcmd_077
	goto scr_seq_0066_D27R0107_0274

scr_seq_0066_D27R0107_0266:
	scrcmd_076 181, 12
	npc_msg 10
	scrcmd_077
	npc_msg 11
scr_seq_0066_D27R0107_0274:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0066_D27R0107_027C:
	end
	.balign 4, 0
