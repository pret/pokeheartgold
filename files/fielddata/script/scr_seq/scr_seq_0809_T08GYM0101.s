#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0809_0026 ; 000
	scrdef scr_seq_0809_06D4 ; 001
	scrdef scr_seq_0809_079E ; 002
	scrdef scr_seq_0809_0178 ; 003
	scrdef scr_seq_0809_0290 ; 004
	scrdef scr_seq_0809_03A8 ; 005
	scrdef scr_seq_0809_04C5 ; 006
	scrdef scr_seq_0809_07CF ; 007
	scrdef scr_seq_0809_00F5 ; 008
	scrdef_end

scr_seq_0809_0026:
	scrcmd_330
	scrcmd_142 26, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0809_00EF
	scrcmd_147 26, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0809_00AF
	scrcmd_294 12, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0809_006D
	goto scr_seq_0809_00E9

scr_seq_0809_0067:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0809_006D:
	goto scr_seq_0809_0075

scr_seq_0809_0073:
	.byte 0x02, 0x00
scr_seq_0809_0075:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_0809_0090
	setflag FLAG_UNK_2F3
	goto scr_seq_0809_00AD

scr_seq_0809_0090:
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_0809_00A7
	setflag FLAG_UNK_2F3
	goto scr_seq_0809_00AD

scr_seq_0809_00A7:
	goto scr_seq_0809_00E9

scr_seq_0809_00AD:
	end

scr_seq_0809_00AF:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_0809_00CA
	setflag FLAG_UNK_2F3
	goto scr_seq_0809_00E7

scr_seq_0809_00CA:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_0809_00E1
	setflag FLAG_UNK_2F3
	goto scr_seq_0809_00E7

scr_seq_0809_00E1:
	goto scr_seq_0809_00E9

scr_seq_0809_00E7:
	end

scr_seq_0809_00E9:
	clearflag FLAG_UNK_2F3
	end

scr_seq_0809_00EF:
	setflag FLAG_UNK_2F3
	end

scr_seq_0809_00F5:
	comparevartovalue VAR_TEMP_x400B, 111
	gotoif ne, scr_seq_0809_012E
	checktrainerflag 136
	callif lt, scr_seq_0809_0130
	checktrainerflag 84
	callif lt, scr_seq_0809_0142
	checktrainerflag 183
	callif lt, scr_seq_0809_0154
	checktrainerflag 83
	callif lt, scr_seq_0809_0166
scr_seq_0809_012E:
	end

scr_seq_0809_0130:
	clearflag FLAG_UNK_266
	scrcmd_100 1
	setflag FLAG_UNK_26A
	hide_person 8
	return

scr_seq_0809_0142:
	clearflag FLAG_UNK_267
	scrcmd_100 5
	setflag FLAG_UNK_26B
	hide_person 7
	return

scr_seq_0809_0154:
	clearflag FLAG_UNK_268
	scrcmd_100 4
	setflag FLAG_UNK_26C
	hide_person 9
	return

scr_seq_0809_0166:
	clearflag FLAG_UNK_269
	scrcmd_100 0
	setflag FLAG_UNK_26D
	hide_person 6
	return

scr_seq_0809_0178:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag 136
	gotoif eq, scr_seq_0809_0277
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_01AA
	apply_movement 8, scr_seq_0809_0620
	goto scr_seq_0809_01E8

scr_seq_0809_01AA:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_01C5
	apply_movement 8, scr_seq_0809_05E4
	goto scr_seq_0809_01E8

scr_seq_0809_01C5:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_01E0
	apply_movement 8, scr_seq_0809_0604
	goto scr_seq_0809_01E8

scr_seq_0809_01E0:
	apply_movement 8, scr_seq_0809_0638
scr_seq_0809_01E8:
	wait_movement
	clearflag FLAG_UNK_266
	scrcmd_100 1
	setflag FLAG_UNK_26A
	hide_person 8
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_0215
	apply_movement 1, scr_seq_0809_0698
	goto scr_seq_0809_0253

scr_seq_0809_0215:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_0230
	apply_movement 1, scr_seq_0809_065C
	goto scr_seq_0809_0253

scr_seq_0809_0230:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_024B
	apply_movement 1, scr_seq_0809_0680
	goto scr_seq_0809_0253

scr_seq_0809_024B:
	apply_movement 1, scr_seq_0809_06B4
scr_seq_0809_0253:
	wait_movement
	npc_msg 7
	closemsg
	trainer_battle 136, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0809_0282
	settrainerflag 136
scr_seq_0809_0277:
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_0282:
	scrcmd_219
	releaseall
	setflag FLAG_UNK_266
	clearflag FLAG_UNK_26A
	end

scr_seq_0809_0290:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag 84
	gotoif eq, scr_seq_0809_038F
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_02C2
	apply_movement 7, scr_seq_0809_0620
	goto scr_seq_0809_0300

scr_seq_0809_02C2:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_02DD
	apply_movement 7, scr_seq_0809_05E4
	goto scr_seq_0809_0300

scr_seq_0809_02DD:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_02F8
	apply_movement 7, scr_seq_0809_0604
	goto scr_seq_0809_0300

scr_seq_0809_02F8:
	apply_movement 7, scr_seq_0809_0638
scr_seq_0809_0300:
	wait_movement
	clearflag FLAG_UNK_267
	scrcmd_100 5
	setflag FLAG_UNK_26B
	hide_person 7
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_032D
	apply_movement 5, scr_seq_0809_0698
	goto scr_seq_0809_036B

scr_seq_0809_032D:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_0348
	apply_movement 5, scr_seq_0809_065C
	goto scr_seq_0809_036B

scr_seq_0809_0348:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_0363
	apply_movement 5, scr_seq_0809_0680
	goto scr_seq_0809_036B

scr_seq_0809_0363:
	apply_movement 5, scr_seq_0809_06B4
scr_seq_0809_036B:
	wait_movement
	npc_msg 9
	closemsg
	trainer_battle 84, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0809_039A
	settrainerflag 84
scr_seq_0809_038F:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_039A:
	scrcmd_219
	releaseall
	setflag FLAG_UNK_267
	clearflag FLAG_UNK_26B
	end

scr_seq_0809_03A8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag 183
	gotoif eq, scr_seq_0809_04AC
	npc_msg 11
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_03DF
	apply_movement 9, scr_seq_0809_0620
	goto scr_seq_0809_041D

scr_seq_0809_03DF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_03FA
	apply_movement 9, scr_seq_0809_05E4
	goto scr_seq_0809_041D

scr_seq_0809_03FA:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_0415
	apply_movement 9, scr_seq_0809_0604
	goto scr_seq_0809_041D

scr_seq_0809_0415:
	apply_movement 9, scr_seq_0809_0638
scr_seq_0809_041D:
	wait_movement
	clearflag FLAG_UNK_268
	scrcmd_100 4
	setflag FLAG_UNK_26C
	hide_person 9
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_044A
	apply_movement 4, scr_seq_0809_0698
	goto scr_seq_0809_0488

scr_seq_0809_044A:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_0465
	apply_movement 4, scr_seq_0809_065C
	goto scr_seq_0809_0488

scr_seq_0809_0465:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_0480
	apply_movement 4, scr_seq_0809_0680
	goto scr_seq_0809_0488

scr_seq_0809_0480:
	apply_movement 4, scr_seq_0809_06B4
scr_seq_0809_0488:
	wait_movement
	npc_msg 12
	closemsg
	trainer_battle 183, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0809_04B7
	settrainerflag 183
scr_seq_0809_04AC:
	npc_msg 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_04B7:
	scrcmd_219
	releaseall
	setflag FLAG_UNK_268
	clearflag FLAG_UNK_26C
	end

scr_seq_0809_04C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checktrainerflag 83
	gotoif eq, scr_seq_0809_05C9
	npc_msg 14
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_04FC
	apply_movement 6, scr_seq_0809_0620
	goto scr_seq_0809_053A

scr_seq_0809_04FC:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_0517
	apply_movement 6, scr_seq_0809_05E4
	goto scr_seq_0809_053A

scr_seq_0809_0517:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_0532
	apply_movement 6, scr_seq_0809_0604
	goto scr_seq_0809_053A

scr_seq_0809_0532:
	apply_movement 6, scr_seq_0809_0638
scr_seq_0809_053A:
	wait_movement
	clearflag FLAG_UNK_269
	scrcmd_100 0
	setflag FLAG_UNK_26D
	hide_person 6
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_0567
	apply_movement 0, scr_seq_0809_0698
	goto scr_seq_0809_05A5

scr_seq_0809_0567:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0809_0582
	apply_movement 0, scr_seq_0809_065C
	goto scr_seq_0809_05A5

scr_seq_0809_0582:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0809_059D
	apply_movement 0, scr_seq_0809_0680
	goto scr_seq_0809_05A5

scr_seq_0809_059D:
	apply_movement 0, scr_seq_0809_06B4
scr_seq_0809_05A5:
	wait_movement
	npc_msg 15
	closemsg
	trainer_battle 83, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0809_05D4
	settrainerflag 83
scr_seq_0809_05C9:
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_05D4:
	scrcmd_219
	releaseall
	setflag FLAG_UNK_269
	clearflag FLAG_UNK_26D
	end

scr_seq_0809_05E2:
	.byte 0x00, 0x00

scr_seq_0809_05E4:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_0809_0604:
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_0809_0620:
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_0809_0638:
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0

scr_seq_0809_065C:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 254, 0

scr_seq_0809_0680:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 254, 0

scr_seq_0809_0698:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 254, 0

scr_seq_0809_06B4:
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 254, 0
scr_seq_0809_06D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 12, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0809_0778
	npc_msg 0
	closemsg
	setvar VAR_TEMP_x400B, 111
	trainer_battle 257, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0809_078E
	setvar VAR_TEMP_x400B, 0
	scrcmd_295 12
	addvar VAR_UNK_4135, 1
	scrcmd_515 22
	settrainerflag 83
	settrainerflag 84
	settrainerflag 136
	settrainerflag 183
	npc_msg 1
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	npc_msg 3
	goto scr_seq_0809_074F

scr_seq_0809_074F:
	setvar VAR_SPECIAL_x8004, 411
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0809_0794
	callstd 2033
	setflag FLAG_UNK_12D
scr_seq_0809_0778:
	checkflag FLAG_UNK_12D
	gotoif FALSE, scr_seq_0809_074F
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_078E:
	scrcmd_219
	releaseall
	end

scr_seq_0809_0794:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0809_079E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 12, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0809_07C4
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_07C4:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0809_07CF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 12, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0809_07F6
	npc_msg 17
	goto scr_seq_0809_07F9

scr_seq_0809_07F6:
	npc_msg 18
scr_seq_0809_07F9:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
