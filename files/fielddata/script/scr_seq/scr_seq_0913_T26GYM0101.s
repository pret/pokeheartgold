#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0913_T26GYM0101_0162 ; 000
	scrdef scr_seq_0913_T26GYM0101_0390 ; 001
	scrdef scr_seq_0913_T26GYM0101_043C ; 002
	scrdef scr_seq_0913_T26GYM0101_04D0 ; 003
	scrdef scr_seq_0913_T26GYM0101_0512 ; 004
	scrdef scr_seq_0913_T26GYM0101_0554 ; 005
	scrdef scr_seq_0913_T26GYM0101_059B ; 006
	scrdef scr_seq_0913_T26GYM0101_0022 ; 007
	scrdef_end

scr_seq_0913_T26GYM0101_0022:
	scrcmd_142 38, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0913_T26GYM0101_015C
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_0913_T26GYM0101_015A
	clearflag FLAG_UNK_1D9
	scrcmd_147 38, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0913_T26GYM0101_007A
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_0913_T26GYM0101_0072
	setflag FLAG_UNK_1D9
	goto scr_seq_0913_T26GYM0101_0078

scr_seq_0913_T26GYM0101_0072:
	goto scr_seq_0913_T26GYM0101_009D

scr_seq_0913_T26GYM0101_0078:
	end

scr_seq_0913_T26GYM0101_007A:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_0913_T26GYM0101_0095
	setflag FLAG_UNK_1D9
	goto scr_seq_0913_T26GYM0101_009B

scr_seq_0913_T26GYM0101_0095:
	goto scr_seq_0913_T26GYM0101_009D

scr_seq_0913_T26GYM0101_009B:
	end

scr_seq_0913_T26GYM0101_009D:
	scrcmd_147 28, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0913_T26GYM0101_015A
	check_badge 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_0913_T26GYM0101_00CB
	goto scr_seq_0913_T26GYM0101_015A

scr_seq_0913_T26GYM0101_00C9:
	.byte 0x02, 0x00
scr_seq_0913_T26GYM0101_00CB:
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0913_T26GYM0101_00E8
	goto scr_seq_0913_T26GYM0101_0109

scr_seq_0913_T26GYM0101_00E2:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0913_T26GYM0101_00E8:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0913_T26GYM0101_0101
	goto scr_seq_0913_T26GYM0101_0109

scr_seq_0913_T26GYM0101_00FB:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00
	.byte 0x00
scr_seq_0913_T26GYM0101_0101:
	goto scr_seq_0913_T26GYM0101_015A

scr_seq_0913_T26GYM0101_0107:
	.byte 0x02, 0x00
scr_seq_0913_T26GYM0101_0109:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_0913_T26GYM0101_0124
	setflag FLAG_UNK_1D9
	goto scr_seq_0913_T26GYM0101_0158

scr_seq_0913_T26GYM0101_0124:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_0913_T26GYM0101_013B
	setflag FLAG_UNK_1D9
	goto scr_seq_0913_T26GYM0101_0158

scr_seq_0913_T26GYM0101_013B:
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_0913_T26GYM0101_0152
	setflag FLAG_UNK_1D9
	goto scr_seq_0913_T26GYM0101_0158

scr_seq_0913_T26GYM0101_0152:
	goto scr_seq_0913_T26GYM0101_015A

scr_seq_0913_T26GYM0101_0158:
	end

scr_seq_0913_T26GYM0101_015A:
	end

scr_seq_0913_T26GYM0101_015C:
	setflag FLAG_UNK_1D9
	end

scr_seq_0913_T26GYM0101_0162:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 5, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0913_T26GYM0101_020C
	npc_msg 0
	closemsg
	trainer_battle TRAINER_LEADER_JASMINE_JASMINE, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0913_T26GYM0101_0235
	npc_msg 1
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	give_badge 5
	addvar VAR_UNK_4134, 1
	add_special_game_stat 22
	comparevartovalue VAR_UNK_4134, 3
	gotoif ne, scr_seq_0913_T26GYM0101_01CB
	setvar VAR_UNK_4077, 1
scr_seq_0913_T26GYM0101_01CB:
	npc_msg 3
scr_seq_0913_T26GYM0101_01CE:
	setvar VAR_SPECIAL_x8004, 350
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0913_T26GYM0101_0202
	callstd std_give_item_verbose
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_0C2
	end

scr_seq_0913_T26GYM0101_0202:
	callstd std_bag_is_full
	closemsg
	releaseall
	end

scr_seq_0913_T26GYM0101_020C:
	checkflag FLAG_UNK_0C2
	gotoif FALSE, scr_seq_0913_T26GYM0101_01CE
	scrcmd_147 38, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0913_T26GYM0101_023B
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0913_T26GYM0101_0235:
	white_out
	releaseall
	end

scr_seq_0913_T26GYM0101_023B:
	checkflag FLAG_UNK_166
	gotoif TRUE, scr_seq_0913_T26GYM0101_036F
	comparevartovalue VAR_TEMP_x4000, 77
	gotoif eq, scr_seq_0913_T26GYM0101_0264
	setvar VAR_TEMP_x4000, 77
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0913_T26GYM0101_0264:
	npc_msg 8
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0913_T26GYM0101_034B
	npc_msg 9
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0913_T26GYM0101_034B
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_TEMP_x4003
	get_partymon_forme VAR_SPECIAL_x8004, VAR_TEMP_x4004
	comparevartovalue VAR_TEMP_x4003, 0
	gotoif eq, scr_seq_0913_T26GYM0101_0356
	comparevartovalue VAR_TEMP_x4004, 0
	gotoif eq, scr_seq_0913_T26GYM0101_030E
	comparevartovalue VAR_TEMP_x4003, 487
	gotoif eq, scr_seq_0913_T26GYM0101_0364
	comparevartovalue VAR_TEMP_x4003, 492
	gotoif eq, scr_seq_0913_T26GYM0101_0364
	comparevartovalue VAR_TEMP_x4003, 172
	gotoif eq, scr_seq_0913_T26GYM0101_0364
	comparevartovalue VAR_TEMP_x4003, 479
	gotoif eq, scr_seq_0913_T26GYM0101_0364
scr_seq_0913_T26GYM0101_030E:
	bufferpartymonnick 1, VAR_SPECIAL_x8004
	npc_msg 13
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0913_T26GYM0101_034B
	closemsg
	scrcmd_470 5
	scrcmd_473 32772
	scrcmd_474
	setflag FLAG_UNK_166
	setvar VAR_TEMP_x4000, 55
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0913_T26GYM0101_034B:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0913_T26GYM0101_0356:
	buffer_players_name 0
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0913_T26GYM0101_0364:
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0913_T26GYM0101_036F:
	comparevartovalue VAR_TEMP_x4000, 55
	gotoif ne, scr_seq_0913_T26GYM0101_0385
	npc_msg 11
	goto scr_seq_0913_T26GYM0101_0388

scr_seq_0913_T26GYM0101_0385:
	npc_msg 12
scr_seq_0913_T26GYM0101_0388:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0913_T26GYM0101_0390:
	scrcmd_609
	lockall
	apply_movement 2, scr_seq_0913_T26GYM0101_040C
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0913_T26GYM0101_03BF
	apply_movement 2, scr_seq_0913_T26GYM0101_0414
	goto scr_seq_0913_T26GYM0101_03E2

scr_seq_0913_T26GYM0101_03BF:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0913_T26GYM0101_03DA
	apply_movement 2, scr_seq_0913_T26GYM0101_041C
	goto scr_seq_0913_T26GYM0101_03E2

scr_seq_0913_T26GYM0101_03DA:
	apply_movement 2, scr_seq_0913_T26GYM0101_0424
scr_seq_0913_T26GYM0101_03E2:
	apply_movement 255, scr_seq_0913_T26GYM0101_042C
	wait_movement
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_UNK_410E, 1
	gotoif ne, scr_seq_0913_T26GYM0101_0408
	setvar VAR_UNK_410E, 2
scr_seq_0913_T26GYM0101_0408:
	end

scr_seq_0913_T26GYM0101_040A:
	.byte 0x00, 0x00

scr_seq_0913_T26GYM0101_040C:
	.short 75, 1
	.short 254, 0

scr_seq_0913_T26GYM0101_0414:
	.short 15, 1
	.short 254, 0

scr_seq_0913_T26GYM0101_041C:
	.short 15, 2
	.short 254, 0

scr_seq_0913_T26GYM0101_0424:
	.short 15, 3
	.short 254, 0

scr_seq_0913_T26GYM0101_042C:
	.short 34, 1
	.short 254, 0

scr_seq_0913_T26GYM0101_0434:
	.short 35, 1
	.short 254, 0
scr_seq_0913_T26GYM0101_043C:
	scrcmd_609
	lockall
	apply_movement 1, scr_seq_0913_T26GYM0101_040C
	wait_movement
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0913_T26GYM0101_046B
	apply_movement 1, scr_seq_0913_T26GYM0101_04B8
	goto scr_seq_0913_T26GYM0101_048E

scr_seq_0913_T26GYM0101_046B:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0913_T26GYM0101_0486
	apply_movement 1, scr_seq_0913_T26GYM0101_04C0
	goto scr_seq_0913_T26GYM0101_048E

scr_seq_0913_T26GYM0101_0486:
	apply_movement 1, scr_seq_0913_T26GYM0101_04C8
scr_seq_0913_T26GYM0101_048E:
	apply_movement 255, scr_seq_0913_T26GYM0101_0434
	wait_movement
	npc_msg 21
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_UNK_410E, 2
	gotoif ne, scr_seq_0913_T26GYM0101_04B4
	setvar VAR_UNK_410E, 3
scr_seq_0913_T26GYM0101_04B4:
	end

scr_seq_0913_T26GYM0101_04B6:
	.byte 0x00, 0x00

scr_seq_0913_T26GYM0101_04B8:
	.short 14, 3
	.short 254, 0

scr_seq_0913_T26GYM0101_04C0:
	.short 14, 2
	.short 254, 0

scr_seq_0913_T26GYM0101_04C8:
	.short 14, 1
	.short 254, 0
scr_seq_0913_T26GYM0101_04D0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 5, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0913_T26GYM0101_04F4
	npc_msg 20
	goto scr_seq_0913_T26GYM0101_04F7

scr_seq_0913_T26GYM0101_04F4:
	npc_msg 19
scr_seq_0913_T26GYM0101_04F7:
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_UNK_410E, 1
	gotoif ne, scr_seq_0913_T26GYM0101_0510
	setvar VAR_UNK_410E, 2
scr_seq_0913_T26GYM0101_0510:
	end

scr_seq_0913_T26GYM0101_0512:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 5, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0913_T26GYM0101_0536
	npc_msg 22
	goto scr_seq_0913_T26GYM0101_0539

scr_seq_0913_T26GYM0101_0536:
	npc_msg 21
scr_seq_0913_T26GYM0101_0539:
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_UNK_410E, 2
	gotoif ne, scr_seq_0913_T26GYM0101_0552
	setvar VAR_UNK_410E, 3
scr_seq_0913_T26GYM0101_0552:
	end

scr_seq_0913_T26GYM0101_0554:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 5, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0913_T26GYM0101_0590
	comparevartovalue VAR_UNK_410E, 0
	gotoif ne, scr_seq_0913_T26GYM0101_0585
	npc_msg 16
	goto scr_seq_0913_T26GYM0101_0588

scr_seq_0913_T26GYM0101_0585:
	npc_msg 17
scr_seq_0913_T26GYM0101_0588:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0913_T26GYM0101_0590:
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0913_T26GYM0101_059B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	check_badge 5, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0913_T26GYM0101_05C2
	npc_msg 23
	goto scr_seq_0913_T26GYM0101_05C5

scr_seq_0913_T26GYM0101_05C2:
	npc_msg 24
scr_seq_0913_T26GYM0101_05C5:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
