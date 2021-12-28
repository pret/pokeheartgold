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
	scrcmd_100 6
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
	.short 76, 2
	.short 254, 0

scr_seq_0010_D02R0104_0338:
	.short 65, 1
	.short 77, 2
	.short 254, 0

scr_seq_0010_D02R0104_0344:
	.short 32, 5
	.short 35, 1
	.short 254, 0

scr_seq_0010_D02R0104_0350:
	.short 34, 5
	.short 32, 1
	.short 254, 0

scr_seq_0010_D02R0104_035C:
	.short 33, 5
	.short 34, 1
	.short 254, 0

scr_seq_0010_D02R0104_0368:
	.short 35, 5
	.short 33, 1
	.short 254, 0

scr_seq_0010_D02R0104_0374:
	.short 34, 6
	.short 254, 0

scr_seq_0010_D02R0104_037C:
	.short 35, 6
	.short 254, 0

scr_seq_0010_D02R0104_0384:
	.short 35, 6
	.short 15, 1
	.short 59, 1
	.short 254, 0

scr_seq_0010_D02R0104_0394:
	.short 32, 6
	.short 12, 1
	.short 56, 1
	.short 254, 0

scr_seq_0010_D02R0104_03A4:
	.short 34, 6
	.short 14, 1
	.short 58, 1
	.short 254, 0

scr_seq_0010_D02R0104_03B4:
	.short 33, 6
	.short 13, 1
	.short 57, 1
	.short 254, 0

scr_seq_0010_D02R0104_03C4:
	.short 34, 8
	.short 254, 0

scr_seq_0010_D02R0104_03CC:
	.short 35, 8
	.short 254, 0

scr_seq_0010_D02R0104_03D4:
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 12, 4
	.short 56, 1
	.short 254, 0

scr_seq_0010_D02R0104_03F0:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 14, 4
	.short 58, 1
	.short 254, 0

scr_seq_0010_D02R0104_040C:
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 13, 4
	.short 57, 1
	.short 254, 0

scr_seq_0010_D02R0104_0428:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 15, 4
	.short 59, 1
	.short 254, 0

scr_seq_0010_D02R0104_0444:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 254, 0

scr_seq_0010_D02R0104_0468:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 254, 0

scr_seq_0010_D02R0104_048C:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 14, 4
	.short 58, 1
	.short 254, 0

scr_seq_0010_D02R0104_04A8:
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 13, 4
	.short 57, 1
	.short 254, 0

scr_seq_0010_D02R0104_04C4:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 15, 4
	.short 59, 1
	.short 254, 0

scr_seq_0010_D02R0104_04E0:
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 12, 4
	.short 56, 1
	.short 254, 0

scr_seq_0010_D02R0104_04FC:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 254, 0

scr_seq_0010_D02R0104_0520:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 254, 0

scr_seq_0010_D02R0104_0544:
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 13, 4
	.short 57, 1
	.short 254, 0

scr_seq_0010_D02R0104_0560:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 15, 4
	.short 59, 1
	.short 254, 0

scr_seq_0010_D02R0104_057C:
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 12, 4
	.short 56, 1
	.short 254, 0

scr_seq_0010_D02R0104_0598:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 14, 4
	.short 58, 1
	.short 254, 0

scr_seq_0010_D02R0104_05B4:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 254, 0

scr_seq_0010_D02R0104_05D8:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 254, 0

scr_seq_0010_D02R0104_05FC:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 75, 1
	.short 254, 0

scr_seq_0010_D02R0104_0614:
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 12, 2
	.short 56, 1
	.short 254, 0

scr_seq_0010_D02R0104_0630:
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 14, 2
	.short 58, 1
	.short 254, 0

scr_seq_0010_D02R0104_064C:
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 13, 2
	.short 57, 1
	.short 254, 0

scr_seq_0010_D02R0104_0668:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 254, 0

scr_seq_0010_D02R0104_068C:
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 35, 1
	.short 32, 1
	.short 34, 1
	.short 33, 1
	.short 254, 0

scr_seq_0010_D02R0104_06B0:
	.short 48, 3
	.short 19, 6
	.short 16, 3
	.short 19, 3
	.short 17, 3
	.short 19, 1
	.short 59, 1
	.short 19, 2
	.short 254, 0

scr_seq_0010_D02R0104_06D4:
	.short 33, 1
	.short 75, 1
	.short 17, 1
	.short 19, 3
	.short 17, 2
	.short 19, 1
	.short 59, 1
	.short 19, 2
	.short 254, 0

scr_seq_0010_D02R0104_06F8:
	.short 33, 1
	.short 75, 1
	.short 19, 4
	.short 17, 3
	.short 19, 3
	.short 17, 2
	.short 19, 1
	.short 59, 1
	.short 19, 2
	.short 254, 0

scr_seq_0010_D02R0104_0720:
	.short 33, 1
	.short 75, 1
	.short 17, 2
	.short 19, 6
	.short 16, 3
	.short 19, 2
	.short 17, 3
	.short 50, 2
	.short 254, 0

scr_seq_0010_D02R0104_0744:
	.short 33, 1
	.short 75, 1
	.short 17, 2
	.short 19, 2
	.short 59, 1
	.short 19, 3
	.short 254, 0

scr_seq_0010_D02R0104_0760:
	.short 33, 1
	.short 75, 1
	.short 15, 2
	.short 13, 3
	.short 15, 5
	.short 51, 2
	.short 254, 0

scr_seq_0010_D02R0104_077C:
	.short 38, 2
	.short 36, 4
	.short 48, 2
	.short 19, 2
	.short 59, 1
	.short 19, 3
	.short 254, 0

scr_seq_0010_D02R0104_0798:
	.short 15, 1
	.short 12, 3
	.short 15, 3
	.short 13, 3
	.short 15, 1
	.short 59, 1
	.short 15, 3
	.short 254, 0
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
	scrcmd_194 1, 32772
	npc_msg 2
	wait_fanfare
	buffer_players_name 0
	scrcmd_194 1, 32772
	getitempocket VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	scrcmd_195 2, 32780
	npc_msg 3
	waitbutton
	setvar VAR_SPECIAL_x800C, 1
scr_seq_0010_D02R0104_0860:
	closemsg
	releaseall
	end

scr_seq_0010_D02R0104_0866:
	scrcmd_194 0, 32772
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
