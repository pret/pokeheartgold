#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0874_T23R0501_001E ; 000
	scrdef scr_seq_0874_T23R0501_006D ; 001
	scrdef scr_seq_0874_T23R0501_0314 ; 002
	scrdef scr_seq_0874_T23R0501_037C ; 003
	scrdef scr_seq_0874_T23R0501_0397 ; 004
	scrdef scr_seq_0874_T23R0501_0035 ; 005
	scrdef scr_seq_0874_T23R0501_03AA ; 006
	scrdef_end

scr_seq_0874_T23R0501_001E:
	checkflag FLAG_UNK_07B
	gotoif TRUE, scr_seq_0874_T23R0501_002F
	setflag FLAG_UNK_1AB
	end

scr_seq_0874_T23R0501_002F:
	clearflag FLAG_UNK_1AB
	end

scr_seq_0874_T23R0501_0035:
	scrcmd_609
	lockall
	setvar VAR_UNK_4080, 3
	apply_movement 0, scr_seq_0874_T23R0501_02B0
	wait_movement
	buffer_players_name 0
	npc_msg 1
	setvar VAR_SPECIAL_x8004, 492
	setvar VAR_SPECIAL_x8005, 1
	callstd 2008
	setflag FLAG_UNK_07C
	releaseall
	goto scr_seq_0874_T23R0501_011A

scr_seq_0874_T23R0501_006B:
	.byte 0x02, 0x00
scr_seq_0874_T23R0501_006D:
	checkflag FLAG_UNK_07C
	gotoif TRUE, scr_seq_0874_T23R0501_011A
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg 0
	scrcmd_049
	closemsg
	scrcmd_386 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0874_T23R0501_00A7
	goto scr_seq_0874_T23R0501_00C7

scr_seq_0874_T23R0501_00A1:
	.byte 0x16, 0x00, 0x08, 0x00, 0x00, 0x00
scr_seq_0874_T23R0501_00A7:
	apply_movement 0, scr_seq_0874_T23R0501_02E0
	wait_movement
scr_seq_0874_T23R0501_00B1:
	releaseall
	hide_person 0
	wait_fanfare
	setflag FLAG_UNK_077
	setflag FLAG_UNK_19E
	setflag FLAG_UNK_19F
	end

scr_seq_0874_T23R0501_00C7:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	get_person_coords 253, VAR_TEMP_x4002, VAR_TEMP_x4003
	comparevartovalue VAR_TEMP_x4002, 5
	gotoif ne, scr_seq_0874_T23R0501_00F4
	apply_movement 0, scr_seq_0874_T23R0501_02E8
	goto scr_seq_0874_T23R0501_0108

scr_seq_0874_T23R0501_00F4:
	play_se SEQ_SE_DP_WALL_HIT
	apply_movement 0, scr_seq_0874_T23R0501_02E0
	apply_movement 255, scr_seq_0874_T23R0501_02C8
scr_seq_0874_T23R0501_0108:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	goto scr_seq_0874_T23R0501_00B1

scr_seq_0874_T23R0501_011A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_735 32768
	comparevartovalue VAR_SPECIAL_x8000, 0
	gotoif ne, scr_seq_0874_T23R0501_01A5
	scrcmd_738 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0874_T23R0501_020F
	apply_movement 0, scr_seq_0874_T23R0501_02BC
	wait_movement
	npc_msg 4
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_739
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_735 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0874_T23R0501_0189
	npc_msg 6
	goto scr_seq_0874_T23R0501_0190

scr_seq_0874_T23R0501_0189:
	setflag FLAG_UNK_AA2
	npc_msg 5
scr_seq_0874_T23R0501_0190:
	waitbutton
	closemsg
	comparevartovalue VAR_UNK_4080, 3
	gotoif eq, scr_seq_0874_T23R0501_022D
	releaseall
	end

scr_seq_0874_T23R0501_01A5:
	checkflag FLAG_UNK_AA2
	gotoif TRUE, scr_seq_0874_T23R0501_0204
	buffer_players_name 0
	npc_msg 8
	scrcmd_737 32772
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8000
	callstd std_give_item_verbose
	scrcmd_736
	comparevartovalue VAR_UNK_413B, 10
	gotoif ge, scr_seq_0874_T23R0501_01EE
	addvar VAR_UNK_413B, 1
	comparevartovalue VAR_UNK_413B, 10
	callif ge, scr_seq_0874_T23R0501_0227
scr_seq_0874_T23R0501_01EE:
	npc_msg 10
	goto scr_seq_0874_T23R0501_021F

scr_seq_0874_T23R0501_01F7:
	.byte 0x02, 0x00, 0x2d, 0x00, 0x09, 0x16, 0x00, 0x1d, 0x00
	.byte 0x00, 0x00, 0x02, 0x00
scr_seq_0874_T23R0501_0204:
	npc_msg 7
	goto scr_seq_0874_T23R0501_021F

scr_seq_0874_T23R0501_020D:
	.byte 0x02, 0x00
scr_seq_0874_T23R0501_020F:
	npc_msg 3
	comparevartovalue VAR_UNK_4080, 3
	gotoif eq, scr_seq_0874_T23R0501_022D
scr_seq_0874_T23R0501_021F:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0874_T23R0501_0227:
	setflag FLAG_UNK_127
	return

scr_seq_0874_T23R0501_022D:
	setvar VAR_UNK_4080, 4
	apply_movement 1, scr_seq_0874_T23R0501_02FC
	wait_movement
	apply_movement 255, scr_seq_0874_T23R0501_02D4
	wait_movement
	npc_msg 15
scr_seq_0874_T23R0501_024A:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0874_T23R0501_026E
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0874_T23R0501_0289
	end

scr_seq_0874_T23R0501_026E:
	buffer_players_name 0
	npc_msg 16
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 5
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0874_T23R0501_0289:
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0874_T23R0501_0294:
	.byte 0x5e, 0x00, 0x01, 0x00, 0x68, 0x00, 0x00, 0x00, 0x5f, 0x00, 0x61, 0x00
	.byte 0x02, 0x00
scr_seq_0874_T23R0501_02A2:
	npc_msg 19
	goto scr_seq_0874_T23R0501_024A

scr_seq_0874_T23R0501_02AB:
	.byte 0x02, 0x00, 0x00, 0x00, 0x00

scr_seq_0874_T23R0501_02B0:
	.short 65, 1
	.short 37, 1
	.short 254, 0

scr_seq_0874_T23R0501_02BC:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_0874_T23R0501_02C8:
	.short 18, 1
	.short 65, 1
	.short 254, 0

scr_seq_0874_T23R0501_02D4:
	.short 39, 1
	.short 3, 1
	.short 254, 0

scr_seq_0874_T23R0501_02E0:
	.short 17, 5
	.short 254, 0

scr_seq_0874_T23R0501_02E8:
	.short 18, 1
	.short 17, 2
	.short 19, 1
	.short 17, 3
	.short 254, 0

scr_seq_0874_T23R0501_02FC:
	.short 14, 1
	.short 254, 0
	.byte 0x27, 0x00, 0x01, 0x00, 0x0f, 0x00, 0x01, 0x00, 0x26, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00
scr_seq_0874_T23R0501_0314:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_077
	gotoif TRUE, scr_seq_0874_T23R0501_0332
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0874_T23R0501_0332:
	checkflag FLAG_UNK_07B
	gotoif TRUE, scr_seq_0874_T23R0501_0348
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0874_T23R0501_0348:
	scrcmd_147 5, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif eq, scr_seq_0874_T23R0501_02A2
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_0874_T23R0501_0371
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0874_T23R0501_0371:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0874_T23R0501_037C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 79, 0
	npc_msg 20
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0874_T23R0501_0397:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0874_T23R0501_03AA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_0874_T23R0501_03C8
	npc_msg 24
	goto scr_seq_0874_T23R0501_03F7

scr_seq_0874_T23R0501_03C8:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0874_T23R0501_03DE
	npc_msg 24
	goto scr_seq_0874_T23R0501_03F7

scr_seq_0874_T23R0501_03DE:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0874_T23R0501_03F4
	npc_msg 24
	goto scr_seq_0874_T23R0501_03F7

scr_seq_0874_T23R0501_03F4:
	npc_msg 23
scr_seq_0874_T23R0501_03F7:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
