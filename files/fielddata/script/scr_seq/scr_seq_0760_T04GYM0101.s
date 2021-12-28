#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0760_T04GYM0101_0286 ; 000
	scrdef scr_seq_0760_T04GYM0101_03FE ; 001
	scrdef scr_seq_0760_T04GYM0101_0370 ; 002
	scrdef scr_seq_0760_T04GYM0101_03B6 ; 003
	scrdef scr_seq_0760_T04GYM0101_00F3 ; 004
	scrdef scr_seq_0760_T04GYM0101_0231 ; 005
	scrdef scr_seq_0760_T04GYM0101_0218 ; 006
	scrdef scr_seq_0760_T04GYM0101_0022 ; 007
	scrdef_end

scr_seq_0760_T04GYM0101_0022:
	scrcmd_142 29, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0760_T04GYM0101_00ED
	scrcmd_294 15, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0760_T04GYM0101_00E5
	comparevartovalue VAR_UNK_4089, 1
	gotoif eq, scr_seq_0760_T04GYM0101_00E7
	comparevartovalue VAR_UNK_4089, 2
	gotoif eq, scr_seq_0760_T04GYM0101_00E7
	scrcmd_147 29, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0760_T04GYM0101_00AD
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_0760_T04GYM0101_0090
	setflag FLAG_UNK_253
	goto scr_seq_0760_T04GYM0101_00AB

scr_seq_0760_T04GYM0101_0090:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_0760_T04GYM0101_00A7
	setflag FLAG_UNK_253
	goto scr_seq_0760_T04GYM0101_00AB

scr_seq_0760_T04GYM0101_00A7:
	clearflag FLAG_UNK_253
scr_seq_0760_T04GYM0101_00AB:
	end

scr_seq_0760_T04GYM0101_00AD:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_0760_T04GYM0101_00C8
	setflag FLAG_UNK_253
	goto scr_seq_0760_T04GYM0101_00E3

scr_seq_0760_T04GYM0101_00C8:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_0760_T04GYM0101_00DF
	setflag FLAG_UNK_253
	goto scr_seq_0760_T04GYM0101_00E3

scr_seq_0760_T04GYM0101_00DF:
	clearflag FLAG_UNK_253
scr_seq_0760_T04GYM0101_00E3:
	end

scr_seq_0760_T04GYM0101_00E5:
	end

scr_seq_0760_T04GYM0101_00E7:
	clearflag FLAG_UNK_253
	end

scr_seq_0760_T04GYM0101_00ED:
	setflag FLAG_UNK_253
	end

scr_seq_0760_T04GYM0101_00F3:
	scrcmd_609
	lockall
	scrcmd_081 1065
	play_bgm SEQ_GS_EYE_ROCKET
	apply_movement 7, scr_seq_0760_T04GYM0101_01C8
	wait_movement
	play_se SEQ_SE_DP_WALL_HIT2
	npc_msg 0
	apply_movement 7, scr_seq_0760_T04GYM0101_01D0
	wait_movement
	npc_msg 1
	apply_movement 7, scr_seq_0760_T04GYM0101_01E4
	wait_movement
	npc_msg 2
	apply_movement 7, scr_seq_0760_T04GYM0101_01F4
	wait_movement
	npc_msg 3
	closemsg
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0760_T04GYM0101_0179
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0760_T04GYM0101_0159
	end

scr_seq_0760_T04GYM0101_0159:
	apply_movement 7, scr_seq_0760_T04GYM0101_01FC
	apply_movement 255, scr_seq_0760_T04GYM0101_0204
	apply_movement 253, scr_seq_0760_T04GYM0101_0210
	wait_movement
	goto scr_seq_0760_T04GYM0101_018B

scr_seq_0760_T04GYM0101_0179:
	apply_movement 7, scr_seq_0760_T04GYM0101_01FC
	apply_movement 255, scr_seq_0760_T04GYM0101_0204
	wait_movement
scr_seq_0760_T04GYM0101_018B:
	play_se SEQ_SE_DP_KAIDAN2
	hide_person 7
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_081 1112
	play_bgm SEQ_GS_GYM
	setflag FLAG_UNK_254
	clearflag FLAG_UNK_255
	clearflag FLAG_UNK_256
	clearflag FLAG_UNK_309
	setvar VAR_UNK_411C, 2
	setvar VAR_UNK_4087, 1
	setvar VAR_UNK_4088, 1
	releaseall
	end

scr_seq_0760_T04GYM0101_01C5:
	.byte 0x00, 0x00, 0x00

scr_seq_0760_T04GYM0101_01C8:
	.short 21, 5
	.short 254, 0

scr_seq_0760_T04GYM0101_01D0:
	.short 71, 1
	.short 56, 1
	.short 63, 2
	.short 17, 2
	.short 254, 0

scr_seq_0760_T04GYM0101_01E4:
	.short 75, 1
	.short 71, 1
	.short 12, 2
	.short 254, 0

scr_seq_0760_T04GYM0101_01F4:
	.short 13, 2
	.short 254, 0

scr_seq_0760_T04GYM0101_01FC:
	.short 17, 1
	.short 254, 0

scr_seq_0760_T04GYM0101_0204:
	.short 18, 1
	.short 3, 1
	.short 254, 0

scr_seq_0760_T04GYM0101_0210:
	.short 18, 1
	.short 254, 0
scr_seq_0760_T04GYM0101_0218:
	scrcmd_814
	checkflag FLAG_UNK_257
	gotoif TRUE, scr_seq_0760_T04GYM0101_022F
	scrcmd_375 8
	scrcmd_375 9
	end

scr_seq_0760_T04GYM0101_022F:
	end

scr_seq_0760_T04GYM0101_0231:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	buffer_players_name 0
	npc_msg 16
	setvar VAR_SPECIAL_x8004, 481
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0760_T04GYM0101_027C
	callstd 2008
	hide_person 8
	hide_person 9
	setflag FLAG_UNK_257
	setvar VAR_UNK_4087, 4
	closemsg
	releaseall
	end

scr_seq_0760_T04GYM0101_027C:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0760_T04GYM0101_0286:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 9, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0760_T04GYM0101_0348
	npc_msg 8
	closemsg
	trainer_battle 254, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0760_T04GYM0101_035E
	scrcmd_295 9
	addvar VAR_UNK_4135, 1
	scrcmd_515 22
	settrainerflag 297
	settrainerflag 298
	settrainerflag 678
	settrainerflag 676
	settrainerflag 677
	npc_msg 9
	buffer_players_name 0
	npc_msg 10
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	checkflag FLAG_UNK_14D
	callif TRUE, scr_seq_0760_T04GYM0101_0364
	buffer_players_name 0
	npc_msg 11
	goto scr_seq_0760_T04GYM0101_0307

scr_seq_0760_T04GYM0101_0307:
	setvar VAR_SPECIAL_x8004, 330
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0760_T04GYM0101_033E
	callstd std_give_item_verbose
	setflag FLAG_UNK_180
	buffer_players_name 0
	npc_msg 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0760_T04GYM0101_033E:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0760_T04GYM0101_0348:
	checkflag FLAG_UNK_180
	gotoif FALSE, scr_seq_0760_T04GYM0101_0307
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0760_T04GYM0101_035E:
	scrcmd_219
	releaseall
	end

scr_seq_0760_T04GYM0101_0364:
	clearflag FLAG_UNK_2A1
	setvar VAR_UNK_4089, 1
	return

scr_seq_0760_T04GYM0101_0370:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4088, 2
	gotoif ne, scr_seq_0760_T04GYM0101_03AD
	scrcmd_294 9, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0760_T04GYM0101_03A4
	npc_msg 6
	goto scr_seq_0760_T04GYM0101_03A7

scr_seq_0760_T04GYM0101_03A4:
	npc_msg 7
scr_seq_0760_T04GYM0101_03A7:
	goto scr_seq_0760_T04GYM0101_03F6

scr_seq_0760_T04GYM0101_03AD:
	npc_msg 4
	goto scr_seq_0760_T04GYM0101_03F6

scr_seq_0760_T04GYM0101_03B6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4088, 2
	gotoif ne, scr_seq_0760_T04GYM0101_03F3
	scrcmd_294 9, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0760_T04GYM0101_03EA
	npc_msg 6
	goto scr_seq_0760_T04GYM0101_03ED

scr_seq_0760_T04GYM0101_03EA:
	npc_msg 7
scr_seq_0760_T04GYM0101_03ED:
	goto scr_seq_0760_T04GYM0101_03F6

scr_seq_0760_T04GYM0101_03F3:
	npc_msg 5
scr_seq_0760_T04GYM0101_03F6:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0760_T04GYM0101_03FE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 9, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0760_T04GYM0101_0424
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0760_T04GYM0101_0424:
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
