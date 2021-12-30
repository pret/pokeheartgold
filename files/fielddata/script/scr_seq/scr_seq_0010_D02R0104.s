#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0010_D02R0104_001A ; 000
	scrdef scr_seq_0010_D02R0104_07C0 ; 001
	scrdef scr_seq_0010_D02R0104_0143 ; 002
	scrdef scr_seq_0010_D02R0104_07D5 ; 003
	scrdef scr_seq_0010_D02R0104_087E ; 004
	scrdef scr_seq_0010_D02R0104_00A6 ; 005
	scrdef_end

scr_seq_0010_D02R0104_001A:
	setflag FLAG_UNK_298
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0010_D02R0104_003B
	goto scr_seq_0010_D02R0104_0060

scr_seq_0010_D02R0104_0035:
	.byte 0x16, 0x00, 0x23, 0x00, 0x00, 0x00
scr_seq_0010_D02R0104_003B:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0010_D02R0104_0054
	goto scr_seq_0010_D02R0104_007D

scr_seq_0010_D02R0104_004E:
	.byte 0x16, 0x00
	.byte 0x0a, 0x00, 0x00, 0x00
scr_seq_0010_D02R0104_0054:
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_26E
	end

scr_seq_0010_D02R0104_0060:
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif eq, scr_seq_0010_D02R0104_009A
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_26E
	end

scr_seq_0010_D02R0104_007D:
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif eq, scr_seq_0010_D02R0104_009A
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_26E
	end

scr_seq_0010_D02R0104_009A:
	setvar VAR_UNK_40F6, 0
	clearflag FLAG_UNK_26E
	end

scr_seq_0010_D02R0104_00A6:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0010_D02R0104_00C3
	goto scr_seq_0010_D02R0104_0113

scr_seq_0010_D02R0104_00BD:
	.byte 0x16, 0x00, 0x1f
	.byte 0x00, 0x00, 0x00
scr_seq_0010_D02R0104_00C3:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0010_D02R0104_00DC
	goto scr_seq_0010_D02R0104_012A

scr_seq_0010_D02R0104_00D6:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0010_D02R0104_00DC:
	goto scr_seq_0010_D02R0104_00E2

scr_seq_0010_D02R0104_00E2:
	comparevartovalue VAR_UNK_40F6, 1
	gotoif eq, scr_seq_0010_D02R0104_0141
	setflag FLAG_UNK_26E
	hide_person 0
	hide_person 1
	hide_person 2
	hide_person 3
	hide_person 4
	hide_person 5
	setvar VAR_UNK_40F6, 1
	end

scr_seq_0010_D02R0104_0113:
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 3
	gotoif eq, scr_seq_0010_D02R0104_0141
	goto scr_seq_0010_D02R0104_00E2

scr_seq_0010_D02R0104_012A:
	scrcmd_379 VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 4
	gotoif eq, scr_seq_0010_D02R0104_0141
	goto scr_seq_0010_D02R0104_00E2

scr_seq_0010_D02R0104_0141:
	end

scr_seq_0010_D02R0104_0143:
	scrcmd_609
	lockall
	clearflag FLAG_UNK_298
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, scr_seq_0010_D02R0104_0330
	apply_movement 0, scr_seq_0010_D02R0104_0344
	apply_movement 1, scr_seq_0010_D02R0104_0350
	apply_movement 2, scr_seq_0010_D02R0104_035C
	apply_movement 3, scr_seq_0010_D02R0104_0368
	apply_movement 4, scr_seq_0010_D02R0104_0374
	apply_movement 5, scr_seq_0010_D02R0104_037C
	wait_movement
	scrcmd_076 35, 0
	apply_movement 0, scr_seq_0010_D02R0104_0384
	apply_movement 1, scr_seq_0010_D02R0104_0394
	apply_movement 2, scr_seq_0010_D02R0104_03A4
	apply_movement 3, scr_seq_0010_D02R0104_03B4
	apply_movement 4, scr_seq_0010_D02R0104_03C4
	apply_movement 5, scr_seq_0010_D02R0104_03CC
	wait_movement
	scrcmd_076 35, 0
	apply_movement 0, scr_seq_0010_D02R0104_03D4
	apply_movement 1, scr_seq_0010_D02R0104_03F0
	apply_movement 2, scr_seq_0010_D02R0104_040C
	apply_movement 3, scr_seq_0010_D02R0104_0428
	apply_movement 4, scr_seq_0010_D02R0104_0444
	apply_movement 5, scr_seq_0010_D02R0104_0468
	wait_movement
	scrcmd_076 35, 0
	apply_movement 0, scr_seq_0010_D02R0104_048C
	apply_movement 1, scr_seq_0010_D02R0104_04A8
	apply_movement 2, scr_seq_0010_D02R0104_04C4
	apply_movement 3, scr_seq_0010_D02R0104_04E0
	apply_movement 4, scr_seq_0010_D02R0104_04FC
	apply_movement 5, scr_seq_0010_D02R0104_0520
	wait_movement
	scrcmd_076 35, 0
	apply_movement 0, scr_seq_0010_D02R0104_0544
	apply_movement 1, scr_seq_0010_D02R0104_0560
	apply_movement 2, scr_seq_0010_D02R0104_057C
	apply_movement 3, scr_seq_0010_D02R0104_0598
	apply_movement 4, scr_seq_0010_D02R0104_05B4
	apply_movement 5, scr_seq_0010_D02R0104_05D8
	wait_movement
	scrcmd_076 35, 0
	apply_movement 0, scr_seq_0010_D02R0104_05FC
	apply_movement 1, scr_seq_0010_D02R0104_0614
	apply_movement 2, scr_seq_0010_D02R0104_0630
	apply_movement 3, scr_seq_0010_D02R0104_064C
	apply_movement 4, scr_seq_0010_D02R0104_0668
	apply_movement 5, scr_seq_0010_D02R0104_068C
	wait_movement
	scrcmd_076 35, 0
	apply_movement 0, scr_seq_0010_D02R0104_06B0
	apply_movement 1, scr_seq_0010_D02R0104_06D4
	apply_movement 2, scr_seq_0010_D02R0104_06F8
	apply_movement 3, scr_seq_0010_D02R0104_0720
	apply_movement 4, scr_seq_0010_D02R0104_0744
	apply_movement 5, scr_seq_0010_D02R0104_0760
	wait_movement
	show_person 6
	apply_movement 3, scr_seq_0010_D02R0104_077C
	apply_movement 5, scr_seq_0010_D02R0104_0798
	wait_movement
	hide_person 0
	hide_person 1
	hide_person 2
	hide_person 3
	hide_person 4
	hide_person 5
	setflag FLAG_UNK_26E
	setvar VAR_UNK_40F6, 1
	setflag FLAG_UNK_AB5
	apply_movement 241, scr_seq_0010_D02R0104_0338
	wait_movement
	scrcmd_103
	releaseall
	end

scr_seq_0010_D02R0104_032D:
	.byte 0x00, 0x00, 0x00

scr_seq_0010_D02R0104_0330:
	step 76, 2
	step_end

scr_seq_0010_D02R0104_0338:
	step 65, 1
	step 77, 2
	step_end

scr_seq_0010_D02R0104_0344:
	step 32, 5
	step 35, 1
	step_end

scr_seq_0010_D02R0104_0350:
	step 34, 5
	step 32, 1
	step_end

scr_seq_0010_D02R0104_035C:
	step 33, 5
	step 34, 1
	step_end

scr_seq_0010_D02R0104_0368:
	step 35, 5
	step 33, 1
	step_end

scr_seq_0010_D02R0104_0374:
	step 34, 6
	step_end

scr_seq_0010_D02R0104_037C:
	step 35, 6
	step_end

scr_seq_0010_D02R0104_0384:
	step 35, 6
	step 15, 1
	step 59, 1
	step_end

scr_seq_0010_D02R0104_0394:
	step 32, 6
	step 12, 1
	step 56, 1
	step_end

scr_seq_0010_D02R0104_03A4:
	step 34, 6
	step 14, 1
	step 58, 1
	step_end

scr_seq_0010_D02R0104_03B4:
	step 33, 6
	step 13, 1
	step 57, 1
	step_end

scr_seq_0010_D02R0104_03C4:
	step 34, 8
	step_end

scr_seq_0010_D02R0104_03CC:
	step 35, 8
	step_end

scr_seq_0010_D02R0104_03D4:
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 12, 4
	step 56, 1
	step_end

scr_seq_0010_D02R0104_03F0:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 14, 4
	step 58, 1
	step_end

scr_seq_0010_D02R0104_040C:
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 13, 4
	step 57, 1
	step_end

scr_seq_0010_D02R0104_0428:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 15, 4
	step 59, 1
	step_end

scr_seq_0010_D02R0104_0444:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step_end

scr_seq_0010_D02R0104_0468:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step_end

scr_seq_0010_D02R0104_048C:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 14, 4
	step 58, 1
	step_end

scr_seq_0010_D02R0104_04A8:
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 13, 4
	step 57, 1
	step_end

scr_seq_0010_D02R0104_04C4:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 15, 4
	step 59, 1
	step_end

scr_seq_0010_D02R0104_04E0:
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 12, 4
	step 56, 1
	step_end

scr_seq_0010_D02R0104_04FC:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step_end

scr_seq_0010_D02R0104_0520:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step_end

scr_seq_0010_D02R0104_0544:
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 13, 4
	step 57, 1
	step_end

scr_seq_0010_D02R0104_0560:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 15, 4
	step 59, 1
	step_end

scr_seq_0010_D02R0104_057C:
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 12, 4
	step 56, 1
	step_end

scr_seq_0010_D02R0104_0598:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 14, 4
	step 58, 1
	step_end

scr_seq_0010_D02R0104_05B4:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step_end

scr_seq_0010_D02R0104_05D8:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step_end

scr_seq_0010_D02R0104_05FC:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 75, 1
	step_end

scr_seq_0010_D02R0104_0614:
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 12, 2
	step 56, 1
	step_end

scr_seq_0010_D02R0104_0630:
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 14, 2
	step 58, 1
	step_end

scr_seq_0010_D02R0104_064C:
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 13, 2
	step 57, 1
	step_end

scr_seq_0010_D02R0104_0668:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step_end

scr_seq_0010_D02R0104_068C:
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step 35, 1
	step 32, 1
	step 34, 1
	step 33, 1
	step_end

scr_seq_0010_D02R0104_06B0:
	step 48, 3
	step 19, 6
	step 16, 3
	step 19, 3
	step 17, 3
	step 19, 1
	step 59, 1
	step 19, 2
	step_end

scr_seq_0010_D02R0104_06D4:
	step 33, 1
	step 75, 1
	step 17, 1
	step 19, 3
	step 17, 2
	step 19, 1
	step 59, 1
	step 19, 2
	step_end

scr_seq_0010_D02R0104_06F8:
	step 33, 1
	step 75, 1
	step 19, 4
	step 17, 3
	step 19, 3
	step 17, 2
	step 19, 1
	step 59, 1
	step 19, 2
	step_end

scr_seq_0010_D02R0104_0720:
	step 33, 1
	step 75, 1
	step 17, 2
	step 19, 6
	step 16, 3
	step 19, 2
	step 17, 3
	step 50, 2
	step_end

scr_seq_0010_D02R0104_0744:
	step 33, 1
	step 75, 1
	step 17, 2
	step 19, 2
	step 59, 1
	step 19, 3
	step_end

scr_seq_0010_D02R0104_0760:
	step 33, 1
	step 75, 1
	step 15, 2
	step 13, 3
	step 15, 5
	step 51, 2
	step_end

scr_seq_0010_D02R0104_077C:
	step 38, 2
	step 36, 4
	step 48, 2
	step 19, 2
	step 59, 1
	step 19, 3
	step_end

scr_seq_0010_D02R0104_0798:
	step 15, 1
	step 12, 3
	step 15, 3
	step 13, 3
	step 15, 1
	step 59, 1
	step 15, 3
	step_end
	.byte 0x46, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0010_D02R0104_07C0:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 1, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0010_D02R0104_07D5:
	setvar VAR_SPECIAL_x8008, 81
	setvar VAR_SPECIAL_x8009, 1
	goto scr_seq_0010_D02R0104_07E9

scr_seq_0010_D02R0104_07E7:
	.byte 0x02, 0x00
scr_seq_0010_D02R0104_07E9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	wait_se SEQ_SE_DP_SELECT
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8008
	copyvar VAR_SPECIAL_x8005, VAR_SPECIAL_x8009
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0010_D02R0104_0825
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0010_D02R0104_0866
	end

scr_seq_0010_D02R0104_0825:
	callstd 2001
	hide_person VAR_SPECIAL_x800D
	giveitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	npc_msg 2
	wait_fanfare
	buffer_players_name 0
	buffer_item_name 1, VAR_SPECIAL_x8004
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	buffer_pocket_name 2, VAR_SPECIAL_x800C
	npc_msg 3
	waitbutton
	setvar VAR_SPECIAL_x800C, 1
scr_seq_0010_D02R0104_0860:
	closemsg
	releaseall
	end

scr_seq_0010_D02R0104_0866:
	buffer_item_name 0, VAR_SPECIAL_x8004
	npc_msg 4
	waitbutton
	setvar VAR_SPECIAL_x800C, 0
	goto scr_seq_0010_D02R0104_0860

scr_seq_0010_D02R0104_087C:
	.byte 0x02, 0x00
scr_seq_0010_D02R0104_087E:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
