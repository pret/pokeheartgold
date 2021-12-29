#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0119_D47R0101_0690 ; 000
	scrdef scr_seq_0119_D47R0101_06F2 ; 001
	scrdef scr_seq_0119_D47R0101_08D8 ; 002
	scrdef scr_seq_0119_D47R0101_09E7 ; 003
	scrdef scr_seq_0119_D47R0101_0C37 ; 004
	scrdef scr_seq_0119_D47R0101_0E7E ; 005
	scrdef scr_seq_0119_D47R0101_0032 ; 006
	scrdef scr_seq_0119_D47R0101_013F ; 007
	scrdef scr_seq_0119_D47R0101_0208 ; 008
	scrdef scr_seq_0119_D47R0101_0279 ; 009
	scrdef scr_seq_0119_D47R0101_042C ; 010
	scrdef scr_seq_0119_D47R0101_0E13 ; 011
	scrdef_end

scr_seq_0119_D47R0101_0032:
	scrcmd_609
	lockall
	apply_movement 2, scr_seq_0119_D47R0101_01EC
	apply_movement 4, scr_seq_0119_D47R0101_01EC
	wait_movement
	npc_msg 7
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0119_D47R0101_0062
	scrcmd_447 1, 0
scr_seq_0119_D47R0101_0062:
	touchscreen_menu_show
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0119_D47R0101_00BD
	apply_movement 255, scr_seq_0119_D47R0101_01B4
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 357, 0, 79, 100, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_098 253
	scrcmd_606
	apply_movement 253, scr_seq_0119_D47R0101_0200
	wait_movement
	scrcmd_099 253
	releaseall
	end

scr_seq_0119_D47R0101_00BD:
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0119_D47R0101_00E2
	setvar VAR_TEMP_x4002, 5
	setvar VAR_TEMP_x4003, 5
	goto scr_seq_0119_D47R0101_00EE

scr_seq_0119_D47R0101_00E2:
	setvar VAR_TEMP_x4002, 19
	setvar VAR_TEMP_x4003, 5
scr_seq_0119_D47R0101_00EE:
	apply_movement 255, scr_seq_0119_D47R0101_01DC
	wait_movement
	scrcmd_307 0, 0, 16386, 16387, 77
	call scr_seq_0119_D47R0101_08AF
	apply_movement 255, scr_seq_0119_D47R0101_01BC
	apply_movement 2, scr_seq_0119_D47R0101_01F4
	apply_movement 4, scr_seq_0119_D47R0101_01F4
	wait_movement
	call scr_seq_0119_D47R0101_08B7
	setvar VAR_UNK_40E3, 0
	npc_msg 8
	npc_msg 9
	waitbutton
	closemsg
	scrcmd_606
	releaseall
	end

scr_seq_0119_D47R0101_013F:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0119_D47R0101_01E4
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0119_D47R0101_0172
	setvar VAR_TEMP_x4002, 5
	setvar VAR_TEMP_x4003, 5
	goto scr_seq_0119_D47R0101_017E

scr_seq_0119_D47R0101_0172:
	setvar VAR_TEMP_x4002, 19
	setvar VAR_TEMP_x4003, 5
scr_seq_0119_D47R0101_017E:
	scrcmd_307 0, 0, 16386, 16387, 77
	call scr_seq_0119_D47R0101_08AF
	apply_movement 255, scr_seq_0119_D47R0101_01BC
	wait_movement
	call scr_seq_0119_D47R0101_08B7
	setvar VAR_UNK_40E3, 0
	npc_msg 9
	waitbutton
	closemsg
	scrcmd_606
	releaseall
	end

scr_seq_0119_D47R0101_01B2:
	.byte 0x00, 0x00

scr_seq_0119_D47R0101_01B4:
	.short 12, 1
	.short 254, 0

scr_seq_0119_D47R0101_01BC:
	.short 13, 2
	.short 14, 1
	.short 32, 1
	.short 254, 0
	.byte 0x0d, 0x00, 0x04, 0x00
	.byte 0x0e, 0x00, 0x01, 0x00, 0x20, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0119_D47R0101_01DC:
	.short 13, 1
	.short 254, 0

scr_seq_0119_D47R0101_01E4:
	.short 13, 2
	.short 254, 0

scr_seq_0119_D47R0101_01EC:
	.short 3, 1
	.short 254, 0

scr_seq_0119_D47R0101_01F4:
	.short 63, 1
	.short 1, 1
	.short 254, 0

scr_seq_0119_D47R0101_0200:
	.short 0, 1
	.short 254, 0
scr_seq_0119_D47R0101_0208:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 5, scr_seq_0119_D47R0101_0310
	apply_movement 255, scr_seq_0119_D47R0101_03B8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 29
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_025B
scr_seq_0119_D47R0101_024A:
	npc_msg 30
	waitbutton
	closemsg
	setvar VAR_UNK_4057, 2
	releaseall
	end

scr_seq_0119_D47R0101_025B:
	npc_msg 31
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_025B
	goto scr_seq_0119_D47R0101_024A

scr_seq_0119_D47R0101_0279:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 5, scr_seq_0119_D47R0101_0310
	apply_movement 255, scr_seq_0119_D47R0101_03B8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 34
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 5, scr_seq_0119_D47R0101_0324
	apply_movement 255, scr_seq_0119_D47R0101_03C8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 35
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 5, scr_seq_0119_D47R0101_0334
	apply_movement 255, scr_seq_0119_D47R0101_03D8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 36
	waitbutton
	closemsg
	setvar VAR_UNK_4057, 5
	clearflag FLAG_UNK_319
	releaseall
	end

scr_seq_0119_D47R0101_030E:
	.byte 0x00, 0x00

scr_seq_0119_D47R0101_0310:
	.short 1, 1
	.short 75, 1
	.short 65, 1
	.short 14, 1
	.short 254, 0

scr_seq_0119_D47R0101_0324:
	.short 12, 2
	.short 15, 3
	.short 12, 1
	.short 254, 0

scr_seq_0119_D47R0101_0334:
	.short 13, 2
	.short 14, 2
	.short 13, 1
	.short 75, 1
	.short 0, 1
	.short 254, 0

scr_seq_0119_D47R0101_034C:
	.short 14, 2
	.short 12, 4
	.short 15, 4
	.short 1, 1
	.short 254, 0

scr_seq_0119_D47R0101_0360:
	.short 12, 4
	.short 15, 2
	.short 1, 1
	.short 254, 0

scr_seq_0119_D47R0101_0370:
	.short 13, 2
	.short 15, 1
	.short 13, 2
	.short 2, 1
	.short 254, 0
	.byte 0x0f, 0x00, 0x01, 0x00, 0x41, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x0e, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x41, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00
	.byte 0x4b, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_0119_D47R0101_03B8:
	.short 65, 1
	.short 12, 3
	.short 3, 1
	.short 254, 0

scr_seq_0119_D47R0101_03C8:
	.short 12, 2
	.short 15, 4
	.short 12, 1
	.short 254, 0

scr_seq_0119_D47R0101_03D8:
	.short 1, 1
	.short 254, 0

scr_seq_0119_D47R0101_03E0:
	.short 65, 1
	.short 0, 1
	.short 65, 1
	.short 13, 1
	.short 0, 1
	.short 254, 0

scr_seq_0119_D47R0101_03F8:
	.short 15, 1
	.short 0, 1
	.short 254, 0

scr_seq_0119_D47R0101_0404:
	.short 12, 1
	.short 254, 0

scr_seq_0119_D47R0101_040C:
	.short 65, 3
	.short 3, 1
	.short 254, 0
	.byte 0x00, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
	.byte 0x0c, 0x00, 0x03, 0x00, 0x03, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0119_D47R0101_042C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_183
	gotoif TRUE, scr_seq_0119_D47R0101_0599
	comparevartovalue VAR_UNK_4057, 2
	gotoif eq, scr_seq_0119_D47R0101_049D
	comparevartovalue VAR_UNK_4057, 3
	gotoif eq, scr_seq_0119_D47R0101_048B
	comparevartovalue VAR_UNK_4057, 5
	gotoif eq, scr_seq_0119_D47R0101_04CB
	comparevartovalue VAR_UNK_4057, 6
	gotoif eq, scr_seq_0119_D47R0101_0494
	comparevartovalue VAR_UNK_4057, 7
	gotoif eq, scr_seq_0119_D47R0101_058F
	npc_msg 42
	goto scr_seq_0119_D47R0101_0587

scr_seq_0119_D47R0101_0489:
	.byte 0x02, 0x00
scr_seq_0119_D47R0101_048B:
	npc_msg 42
	goto scr_seq_0119_D47R0101_0587

scr_seq_0119_D47R0101_0494:
	npc_msg 40
	goto scr_seq_0119_D47R0101_0587

scr_seq_0119_D47R0101_049D:
	scrcmd_791 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0119_D47R0101_04B8
	npc_msg 33
	goto scr_seq_0119_D47R0101_04C3

scr_seq_0119_D47R0101_04B8:
	npc_msg 32
	setvar VAR_UNK_4057, 3
	scrcmd_792
scr_seq_0119_D47R0101_04C3:
	goto scr_seq_0119_D47R0101_0587

scr_seq_0119_D47R0101_04C9:
	.byte 0x02, 0x00
scr_seq_0119_D47R0101_04CB:
	scrcmd_791 1, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0119_D47R0101_057E
	npc_msg 37
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0119_D47R0101_0515
	apply_movement 5, scr_seq_0119_D47R0101_034C
	apply_movement 255, scr_seq_0119_D47R0101_03E0
	wait_movement
	goto scr_seq_0119_D47R0101_054C

scr_seq_0119_D47R0101_0515:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0119_D47R0101_053A
	apply_movement 5, scr_seq_0119_D47R0101_0360
	apply_movement 255, scr_seq_0119_D47R0101_03F8
	wait_movement
	goto scr_seq_0119_D47R0101_054C

scr_seq_0119_D47R0101_053A:
	apply_movement 5, scr_seq_0119_D47R0101_0360
	apply_movement 255, scr_seq_0119_D47R0101_0404
	wait_movement
scr_seq_0119_D47R0101_054C:
	npc_msg 38
	closemsg
	apply_movement 5, scr_seq_0119_D47R0101_0370
	apply_movement 255, scr_seq_0119_D47R0101_040C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 39
	setvar VAR_UNK_4057, 6
	scrcmd_792
	goto scr_seq_0119_D47R0101_0587

scr_seq_0119_D47R0101_057E:
	npc_msg 41
	goto scr_seq_0119_D47R0101_0587

scr_seq_0119_D47R0101_0587:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_058F:
	setflag FLAG_UNK_183
	npc_msg 43
	npc_msg 44
scr_seq_0119_D47R0101_0599:
	npc_msg 45
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_0683
scr_seq_0119_D47R0101_05AF:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 463, 255, 0
	scrcmd_751 464, 255, 1
	scrcmd_751 465, 255, 2
	scrcmd_751 466, 255, 3
	scrcmd_751 467, 255, 4
	scrcmd_751 468, 255, 5
	scrcmd_751 469, 255, 6
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0119_D47R0101_064D
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0119_D47R0101_0656
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0119_D47R0101_065F
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0119_D47R0101_0668
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0119_D47R0101_0671
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0119_D47R0101_067A
	goto scr_seq_0119_D47R0101_0683

scr_seq_0119_D47R0101_064B:
	.byte 0x02, 0x00
scr_seq_0119_D47R0101_064D:
	npc_msg 47
	goto scr_seq_0119_D47R0101_05AF

scr_seq_0119_D47R0101_0656:
	npc_msg 48
	goto scr_seq_0119_D47R0101_05AF

scr_seq_0119_D47R0101_065F:
	npc_msg 49
	goto scr_seq_0119_D47R0101_05AF

scr_seq_0119_D47R0101_0668:
	npc_msg 50
	goto scr_seq_0119_D47R0101_05AF

scr_seq_0119_D47R0101_0671:
	npc_msg 51
	goto scr_seq_0119_D47R0101_05AF

scr_seq_0119_D47R0101_067A:
	npc_msg 52
	goto scr_seq_0119_D47R0101_05AF

scr_seq_0119_D47R0101_0683:
	touchscreen_menu_show
	npc_msg 53
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0690:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_0119_D47R0101_06AE
	npc_msg 15
	goto scr_seq_0119_D47R0101_06B1

scr_seq_0119_D47R0101_06AE:
	npc_msg 14
scr_seq_0119_D47R0101_06B1:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_06E7
	setvar VAR_SPECIAL_x8004, 30
	scrcmd_198 1, 32772
	setvar VAR_SPECIAL_x8005, 1000
	scrcmd_198 2, 32773
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_06E7:
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_06F2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4057, 7
	gotoif eq, scr_seq_0119_D47R0101_0899
scr_seq_0119_D47R0101_0707:
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_0119_D47R0101_0728
	setvar VAR_SPECIAL_x800C, 500
	scrcmd_198 1, 32780
	npc_msg 1
	goto scr_seq_0119_D47R0101_0736

scr_seq_0119_D47R0101_0728:
	setvar VAR_SPECIAL_x800C, 500
	scrcmd_198 1, 32780
	npc_msg 0
scr_seq_0119_D47R0101_0736:
	scrcmd_113 20, 2
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_0846
	count_pc_empty_space VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0119_D47R0101_0773
	get_party_count VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif eq, scr_seq_0119_D47R0101_0853
scr_seq_0119_D47R0101_0773:
	hasenoughmoneyimmediate 32780, 500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0119_D47R0101_0876
	setvar VAR_SPECIAL_x800C, 500
	scrcmd_198 1, 32780
	npc_msg 2
	play_se SEQ_SE_DP_REGI
	submoneyimmediate 500
	scrcmd_115
	npc_msg 4
	buffer_players_name 0
	setvar VAR_SPECIAL_x800C, 30
	scrcmd_198 1, 32780
	npc_msg 5
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg 6
	closemsg
	scrcmd_114
	scrcmd_600
	apply_movement 255, scr_seq_0119_D47R0101_08C4
	wait_movement
	scrcmd_307 0, 0, 5, 5, 77
	call scr_seq_0119_D47R0101_08AF
	apply_movement 255, scr_seq_0119_D47R0101_08D0
	wait_movement
	call scr_seq_0119_D47R0101_08B7
	setvar VAR_UNK_40E3, 1
	scrcmd_447 0, 0
	scrcmd_240 173, 1, 5, 2, 1
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 357, 0, 79, 100, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_098 253
	scrcmd_606
	apply_movement 253, scr_seq_0119_D47R0101_0200
	wait_movement
	scrcmd_099 253
	releaseall
	end

scr_seq_0119_D47R0101_0846:
	scrcmd_114
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0853:
	scrcmd_114
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_0119_D47R0101_086B
	npc_msg 13
	goto scr_seq_0119_D47R0101_086E

scr_seq_0119_D47R0101_086B:
	npc_msg 12
scr_seq_0119_D47R0101_086E:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0876:
	scrcmd_114
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_0119_D47R0101_088E
	npc_msg 11
	goto scr_seq_0119_D47R0101_0891

scr_seq_0119_D47R0101_088E:
	npc_msg 10
scr_seq_0119_D47R0101_0891:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0899:
	checkflag FLAG_UNK_183
	gotoif TRUE, scr_seq_0119_D47R0101_0707
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_08AF:
	scrcmd_310 77
	scrcmd_308 77
	return

scr_seq_0119_D47R0101_08B7:
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	return

scr_seq_0119_D47R0101_08C2:
	.byte 0x00, 0x00

scr_seq_0119_D47R0101_08C4:
	.short 15, 1
	.short 0, 1
	.short 254, 0

scr_seq_0119_D47R0101_08D0:
	.short 12, 4
	.short 254, 0
scr_seq_0119_D47R0101_08D8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4057, 0
	gotoif eq, scr_seq_0119_D47R0101_09DC
	comparevartovalue VAR_UNK_4057, 1
	gotoif eq, scr_seq_0119_D47R0101_09DC
	comparevartovalue VAR_UNK_4057, 2
	gotoif eq, scr_seq_0119_D47R0101_09DC
	comparevartovalue VAR_UNK_4057, 3
	gotoif eq, scr_seq_0119_D47R0101_09DC
	npc_msg 19
	touchscreen_menu_hide
scr_seq_0119_D47R0101_0919:
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 457, 255, 0
	scrcmd_751 458, 255, 1
	scrcmd_751 459, 255, 2
	scrcmd_751 460, 255, 3
	scrcmd_751 461, 255, 4
	scrcmd_751 462, 255, 5
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0119_D47R0101_09A2
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0119_D47R0101_09AB
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0119_D47R0101_09B4
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0119_D47R0101_09BD
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0119_D47R0101_09C6
	goto scr_seq_0119_D47R0101_09CF

scr_seq_0119_D47R0101_09A0:
	.byte 0x02, 0x00
scr_seq_0119_D47R0101_09A2:
	npc_msg 20
	goto scr_seq_0119_D47R0101_0919

scr_seq_0119_D47R0101_09AB:
	npc_msg 21
	goto scr_seq_0119_D47R0101_0919

scr_seq_0119_D47R0101_09B4:
	npc_msg 22
	goto scr_seq_0119_D47R0101_0919

scr_seq_0119_D47R0101_09BD:
	npc_msg 23
	goto scr_seq_0119_D47R0101_0919

scr_seq_0119_D47R0101_09C6:
	npc_msg 24
	goto scr_seq_0119_D47R0101_0919

scr_seq_0119_D47R0101_09CF:
	touchscreen_menu_show
	npc_msg 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_09DC:
	npc_msg 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_09E7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4057, 7
	gotoif eq, scr_seq_0119_D47R0101_0C21
scr_seq_0119_D47R0101_09FC:
	scrcmd_247
	scrcmd_477 2, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0119_D47R0101_0DF2
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_0119_D47R0101_0A26
	npc_msg 65
	goto scr_seq_0119_D47R0101_0A29

scr_seq_0119_D47R0101_0A26:
	npc_msg 66
scr_seq_0119_D47R0101_0A29:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	closemsg
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_0BFC
	callstd 2006
	copyvar VAR_SPECIAL_x800C, VAR_TEMP_x4000
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_0A5D
	goto scr_seq_0119_D47R0101_0C16

scr_seq_0119_D47R0101_0A5B:
	.byte 0x02, 0x00
scr_seq_0119_D47R0101_0A5D:
	touchscreen_menu_hide
	npc_msg 71
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x800C
	scrcmd_751 14, 255, 0
	scrcmd_751 15, 255, 1
	scrcmd_751 5, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0119_D47R0101_0AAC
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0119_D47R0101_0B2F
	goto scr_seq_0119_D47R0101_0BFC

scr_seq_0119_D47R0101_0AAA:
	.byte 0x02, 0x00
scr_seq_0119_D47R0101_0AAC:
	npc_msg 86
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_0A5D
	setvar VAR_SPECIAL_x8004, 39
	setvar VAR_SPECIAL_x8005, 0
	scrcmd_226 32772, 32773, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_0B05
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0119_D47R0101_0B11
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0119_D47R0101_0B20
	goto scr_seq_0119_D47R0101_0BB2

scr_seq_0119_D47R0101_0B03:
	.byte 0x02, 0x00
scr_seq_0119_D47R0101_0B05:
	scrcmd_283
	touchscreen_menu_hide
	goto scr_seq_0119_D47R0101_0A5D

scr_seq_0119_D47R0101_0B0F:
	.byte 0x02
	.byte 0x00
scr_seq_0119_D47R0101_0B11:
	scrcmd_283
	touchscreen_menu_show
	npc_msg 87
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0B20:
	scrcmd_283
	npc_msg 85
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0119_D47R0101_0B2F:
	npc_msg 86
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_0A5D
	setvar VAR_SPECIAL_x8004, 39
	setvar VAR_SPECIAL_x8005, 0
	scrcmd_227 32772, 32773, 0, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_0B88
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0119_D47R0101_0B94
	comparevartovalue VAR_SPECIAL_x800C, 4
	gotoif eq, scr_seq_0119_D47R0101_0BA3
	goto scr_seq_0119_D47R0101_0BB2

scr_seq_0119_D47R0101_0B86:
	.byte 0x02, 0x00
scr_seq_0119_D47R0101_0B88:
	scrcmd_283
	touchscreen_menu_hide
	goto scr_seq_0119_D47R0101_0A5D

scr_seq_0119_D47R0101_0B92:
	.byte 0x02, 0x00
scr_seq_0119_D47R0101_0B94:
	scrcmd_283
	npc_msg 87
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0119_D47R0101_0BA3:
	scrcmd_283
	npc_msg 85
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0119_D47R0101_0BB2:
	setvar VAR_UNK_4133, 1
	npc_msg 81
	scrcmd_257 96
	scrcmd_822
	scrcmd_283
	setvar VAR_TEMP_x4000, 0
	scrcmd_823 16384
	touchscreen_menu_hide
	npc_msg 82
	npc_msg 88
	scrcmd_345
	scrcmd_254 32780
	scrcmd_346
	buffer_players_name 0
	npc_msg 89
	play_se SEQ_SE_DP_SAVE
	wait_se SEQ_SE_DP_SAVE
	npc_msg 83
	setvar VAR_UNK_4133, 0
	touchscreen_menu_show
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0BFC:
	npc_msg 85
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0119_D47R0101_0C09:
	.byte 0x2d, 0x00, 0x55, 0x32, 0x00, 0x35, 0x00
	.byte 0xeb, 0x02, 0x61, 0x00, 0x02, 0x00
scr_seq_0119_D47R0101_0C16:
	npc_msg 85
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0C21:
	checkflag FLAG_UNK_183
	gotoif TRUE, scr_seq_0119_D47R0101_09FC
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0C37:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4057, 7
	gotoif eq, scr_seq_0119_D47R0101_0DFD
scr_seq_0119_D47R0101_0C4C:
	scrcmd_247
	scrcmd_477 2, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0119_D47R0101_0DF2
	scrcmd_824 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0119_D47R0101_0C84
	setvar VAR_TEMP_x4000, 0
	scrcmd_823 16384
	npc_msg 54
	goto scr_seq_0119_D47R0101_0C8F

scr_seq_0119_D47R0101_0C84:
	npc_msg 60
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0C8F:
	scrcmd_113 20, 2
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_0D9F
	count_pc_empty_space VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0119_D47R0101_0CCC
	get_party_count VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif eq, scr_seq_0119_D47R0101_0DAC
scr_seq_0119_D47R0101_0CCC:
	hasenoughmoneyimmediate 32780, 500
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0119_D47R0101_0DCF
	setvar VAR_SPECIAL_x800C, 500
	scrcmd_198 1, 32780
	npc_msg 55
	play_se SEQ_SE_DP_REGI
	submoneyimmediate 500
	scrcmd_115
	npc_msg 57
	buffer_players_name 0
	setvar VAR_SPECIAL_x800C, 30
	scrcmd_198 1, 32780
	npc_msg 58
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	npc_msg 59
	closemsg
	scrcmd_114
	scrcmd_600
	apply_movement 255, scr_seq_0119_D47R0101_08C4
	wait_movement
	scrcmd_307 0, 0, 19, 5, 77
	call scr_seq_0119_D47R0101_08AF
	apply_movement 255, scr_seq_0119_D47R0101_08D0
	wait_movement
	call scr_seq_0119_D47R0101_08B7
	setvar VAR_UNK_40E3, 3
	scrcmd_447 0, 1
	scrcmd_240 173, 2, 19, 2, 1
	play_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 357, 0, 79, 100, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_098 253
	scrcmd_606
	apply_movement 253, scr_seq_0119_D47R0101_0200
	wait_movement
	scrcmd_099 253
	releaseall
	end

scr_seq_0119_D47R0101_0D9F:
	scrcmd_114
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0DAC:
	scrcmd_114
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_0119_D47R0101_0DC4
	npc_msg 13
	goto scr_seq_0119_D47R0101_0DC7

scr_seq_0119_D47R0101_0DC4:
	npc_msg 12
scr_seq_0119_D47R0101_0DC7:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0DCF:
	scrcmd_114
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_0119_D47R0101_0DE7
	npc_msg 11
	goto scr_seq_0119_D47R0101_0DEA

scr_seq_0119_D47R0101_0DE7:
	npc_msg 10
scr_seq_0119_D47R0101_0DEA:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0DF2:
	npc_msg 84
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0DFD:
	checkflag FLAG_UNK_183
	gotoif TRUE, scr_seq_0119_D47R0101_0C4C
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0E13:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_247
	scrcmd_477 2, 16384
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0119_D47R0101_0E73
	comparevartovalue VAR_UNK_4057, 6
	gotoif lt, scr_seq_0119_D47R0101_0E45
	npc_msg 93
	goto scr_seq_0119_D47R0101_0E48

scr_seq_0119_D47R0101_0E45:
	npc_msg 94
scr_seq_0119_D47R0101_0E48:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0119_D47R0101_0E68
	npc_msg 95
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0E68:
	npc_msg 96
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0E73:
	npc_msg 92
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0E7E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4057, 0
	gotoif eq, scr_seq_0119_D47R0101_0EF1
	comparevartovalue VAR_UNK_4057, 1
	gotoif eq, scr_seq_0119_D47R0101_0EF1
	comparevartovalue VAR_UNK_4057, 2
	gotoif eq, scr_seq_0119_D47R0101_0EF1
	comparevartovalue VAR_UNK_4057, 3
	gotoif eq, scr_seq_0119_D47R0101_0EF1
	buffer_players_name 0
	npc_msg 27
	closemsg
	clearflag FLAG_UNK_99D
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_716
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	checkflag FLAG_UNK_99D
	gotoif TRUE, scr_seq_0119_D47R0101_0EFC
	releaseall
	end

scr_seq_0119_D47R0101_0EF1:
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0119_D47R0101_0EFC:
	scrcmd_561 0, 2, 10, 6
	play_se SEQ_SE_DP_KI_GASYAN
	npc_msg 91
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
