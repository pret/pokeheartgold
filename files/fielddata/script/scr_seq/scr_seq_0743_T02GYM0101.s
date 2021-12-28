#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0743_T02GYM0101_006B ; 000
	scrdef scr_seq_0743_T02GYM0101_014D ; 001
	scrdef scr_seq_0743_T02GYM0101_0016 ; 002
	scrdef scr_seq_0743_T02GYM0101_0191 ; 003
	scrdef scr_seq_0743_T02GYM0101_0480 ; 004
	scrdef_end

scr_seq_0743_T02GYM0101_0016:
	scrcmd_331
	setvar VAR_UNK_4127, 0
	scrcmd_142 31, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0743_T02GYM0101_0065
	comparevartovalue VAR_UNK_40FD, 0
	gotoif eq, scr_seq_0743_T02GYM0101_005F
	get_weekday VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 5
	gotoif ne, scr_seq_0743_T02GYM0101_0059
	setflag FLAG_UNK_2F6
	goto scr_seq_0743_T02GYM0101_005D

scr_seq_0743_T02GYM0101_0059:
	clearflag FLAG_UNK_2F6
scr_seq_0743_T02GYM0101_005D:
	end

scr_seq_0743_T02GYM0101_005F:
	clearflag FLAG_UNK_2F6
	end

scr_seq_0743_T02GYM0101_0065:
	setflag FLAG_UNK_2F6
	end

scr_seq_0743_T02GYM0101_006B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 15, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0743_T02GYM0101_0131
	npc_msg 0
	closemsg
	trainer_battle 261, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0743_T02GYM0101_0147
	scrcmd_295 15
	addvar VAR_UNK_4135, 1
	setflag FLAG_UNK_998
	scrcmd_515 22
	settrainerflag 681
	settrainerflag 683
	settrainerflag 682
	settrainerflag 684
	setflag FLAG_UNK_97F
	clearflag FLAG_UNK_297
	setflag FLAG_UNK_30F
	setvar VAR_UNK_4096, 1
	npc_msg 1
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg 3
	goto scr_seq_0743_T02GYM0101_00F0

scr_seq_0743_T02GYM0101_00F0:
	setvar VAR_SPECIAL_x8004, 419
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0743_T02GYM0101_0127
	callstd std_give_item_verbose
	setflag FLAG_UNK_17E
	buffer_players_name 0
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0743_T02GYM0101_0127:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0743_T02GYM0101_0131:
	checkflag FLAG_UNK_17E
	gotoif FALSE, scr_seq_0743_T02GYM0101_00F0
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0743_T02GYM0101_0147:
	scrcmd_219
	releaseall
	end

scr_seq_0743_T02GYM0101_014D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 15, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0743_T02GYM0101_0186
	npc_msg 6
	scrcmd_600
	scrcmd_783 1
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_4127, 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0743_T02GYM0101_0186:
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0743_T02GYM0101_0191:
	scrcmd_609
	lockall
	checkflag FLAG_UNK_13A
	gotoif TRUE, scr_seq_0743_T02GYM0101_037D
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0743_T02GYM0101_01C9
	apply_movement 4, scr_seq_0743_T02GYM0101_0394
	apply_movement 255, scr_seq_0743_T02GYM0101_040C
	goto scr_seq_0743_T02GYM0101_02AB

scr_seq_0743_T02GYM0101_01C9:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0743_T02GYM0101_01EC
	apply_movement 4, scr_seq_0743_T02GYM0101_03A4
	apply_movement 255, scr_seq_0743_T02GYM0101_040C
	goto scr_seq_0743_T02GYM0101_02AB

scr_seq_0743_T02GYM0101_01EC:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0743_T02GYM0101_020F
	apply_movement 4, scr_seq_0743_T02GYM0101_03B4
	apply_movement 255, scr_seq_0743_T02GYM0101_040C
	goto scr_seq_0743_T02GYM0101_02AB

scr_seq_0743_T02GYM0101_020F:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0743_T02GYM0101_0232
	apply_movement 4, scr_seq_0743_T02GYM0101_03C4
	apply_movement 255, scr_seq_0743_T02GYM0101_0418
	goto scr_seq_0743_T02GYM0101_02AB

scr_seq_0743_T02GYM0101_0232:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0743_T02GYM0101_0255
	apply_movement 4, scr_seq_0743_T02GYM0101_03D4
	apply_movement 255, scr_seq_0743_T02GYM0101_0418
	goto scr_seq_0743_T02GYM0101_02AB

scr_seq_0743_T02GYM0101_0255:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0743_T02GYM0101_0278
	apply_movement 4, scr_seq_0743_T02GYM0101_03E4
	apply_movement 255, scr_seq_0743_T02GYM0101_0418
	goto scr_seq_0743_T02GYM0101_02AB

scr_seq_0743_T02GYM0101_0278:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0743_T02GYM0101_029B
	apply_movement 4, scr_seq_0743_T02GYM0101_03F0
	apply_movement 255, scr_seq_0743_T02GYM0101_0424
	goto scr_seq_0743_T02GYM0101_02AB

scr_seq_0743_T02GYM0101_029B:
	apply_movement 4, scr_seq_0743_T02GYM0101_03FC
	apply_movement 255, scr_seq_0743_T02GYM0101_0424
scr_seq_0743_T02GYM0101_02AB:
	wait_movement
	npc_msg 8
	closemsg
	setflag FLAG_UNK_13A
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0743_T02GYM0101_02D1
	apply_movement 4, scr_seq_0743_T02GYM0101_0430
	goto scr_seq_0743_T02GYM0101_037B

scr_seq_0743_T02GYM0101_02D1:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0743_T02GYM0101_02EC
	apply_movement 4, scr_seq_0743_T02GYM0101_043C
	goto scr_seq_0743_T02GYM0101_037B

scr_seq_0743_T02GYM0101_02EC:
	comparevartovalue VAR_TEMP_x4000, 3
	gotoif ne, scr_seq_0743_T02GYM0101_0307
	apply_movement 4, scr_seq_0743_T02GYM0101_0448
	goto scr_seq_0743_T02GYM0101_037B

scr_seq_0743_T02GYM0101_0307:
	comparevartovalue VAR_TEMP_x4000, 4
	gotoif ne, scr_seq_0743_T02GYM0101_0322
	apply_movement 4, scr_seq_0743_T02GYM0101_0454
	goto scr_seq_0743_T02GYM0101_037B

scr_seq_0743_T02GYM0101_0322:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0743_T02GYM0101_033D
	apply_movement 4, scr_seq_0743_T02GYM0101_0460
	goto scr_seq_0743_T02GYM0101_037B

scr_seq_0743_T02GYM0101_033D:
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0743_T02GYM0101_0358
	apply_movement 4, scr_seq_0743_T02GYM0101_046C
	goto scr_seq_0743_T02GYM0101_037B

scr_seq_0743_T02GYM0101_0358:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_0743_T02GYM0101_0373
	apply_movement 4, scr_seq_0743_T02GYM0101_046C
	goto scr_seq_0743_T02GYM0101_037B

scr_seq_0743_T02GYM0101_0373:
	apply_movement 4, scr_seq_0743_T02GYM0101_0474
scr_seq_0743_T02GYM0101_037B:
	wait_movement
scr_seq_0743_T02GYM0101_037D:
	scrcmd_600
	scrcmd_783 1
	scrcmd_607
	scrcmd_109 253, 56
	setvar VAR_UNK_4127, 1
	releaseall
	end


scr_seq_0743_T02GYM0101_0394:
	.short 2, 1
	.short 75, 1
	.short 14, 5
	.short 254, 0

scr_seq_0743_T02GYM0101_03A4:
	.short 2, 1
	.short 75, 1
	.short 14, 4
	.short 254, 0

scr_seq_0743_T02GYM0101_03B4:
	.short 2, 1
	.short 75, 1
	.short 14, 3
	.short 254, 0

scr_seq_0743_T02GYM0101_03C4:
	.short 2, 1
	.short 75, 1
	.short 14, 2
	.short 254, 0

scr_seq_0743_T02GYM0101_03D4:
	.short 2, 1
	.short 75, 1
	.short 14, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_03E4:
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_03F0:
	.short 3, 1
	.short 75, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_03FC:
	.short 3, 1
	.short 75, 1
	.short 15, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_040C:
	.short 65, 2
	.short 3, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_0418:
	.short 63, 2
	.short 3, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_0424:
	.short 63, 2
	.short 2, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_0430:
	.short 15, 5
	.short 1, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_043C:
	.short 15, 4
	.short 1, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_0448:
	.short 15, 3
	.short 1, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_0454:
	.short 15, 2
	.short 1, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_0460:
	.short 15, 1
	.short 1, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_046C:
	.short 1, 1
	.short 254, 0

scr_seq_0743_T02GYM0101_0474:
	.short 14, 1
	.short 1, 1
	.short 254, 0
scr_seq_0743_T02GYM0101_0480:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 15, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0743_T02GYM0101_04A7
	npc_msg 9
	goto scr_seq_0743_T02GYM0101_04AA

scr_seq_0743_T02GYM0101_04A7:
	npc_msg 10
scr_seq_0743_T02GYM0101_04AA:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
