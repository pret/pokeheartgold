#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0029_D23R0101_008D ; 000
	scrdef scr_seq_0029_D23R0101_0966 ; 001
	scrdef scr_seq_0029_D23R0101_00FD ; 002
	scrdef scr_seq_0029_D23R0101_0280 ; 003
	scrdef scr_seq_0029_D23R0101_0291 ; 004
	scrdef scr_seq_0029_D23R0101_02A2 ; 005
	scrdef scr_seq_0029_D23R0101_0940 ; 006
	scrdef scr_seq_0029_D23R0101_0953 ; 007
	scrdef scr_seq_0029_D23R0101_002E ; 008
	scrdef scr_seq_0029_D23R0101_0384 ; 009
	scrdef scr_seq_0029_D23R0101_00E2 ; 010
	scrdef_end

scr_seq_0029_D23R0101_002E:
	setflag FLAG_UNK_1BC
	setflag FLAG_UNK_1B8
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_0029_D23R0101_004D
	clearflag FLAG_UNK_1BC
	goto scr_seq_0029_D23R0101_0085

scr_seq_0029_D23R0101_004D:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0029_D23R0101_0066
	goto scr_seq_0029_D23R0101_008B

scr_seq_0029_D23R0101_0060:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0029_D23R0101_0066:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0029_D23R0101_0081
	clearflag FLAG_UNK_1BC
	clearflag FLAG_UNK_1BD
	goto scr_seq_0029_D23R0101_0085

scr_seq_0029_D23R0101_0081:
	clearflag FLAG_UNK_1B8
scr_seq_0029_D23R0101_0085:
	setvar VAR_TEMP_x400A, 0
scr_seq_0029_D23R0101_008B:
	end

scr_seq_0029_D23R0101_008D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 2
	gotoif ne, scr_seq_0029_D23R0101_00AB
	npc_msg 1
	goto scr_seq_0029_D23R0101_00DA

scr_seq_0029_D23R0101_00AB:
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_0029_D23R0101_00C1
	npc_msg 1
	goto scr_seq_0029_D23R0101_00DA

scr_seq_0029_D23R0101_00C1:
	comparevartovalue VAR_UNK_4077, 3
	gotoif ne, scr_seq_0029_D23R0101_00D7
	npc_msg 2
	goto scr_seq_0029_D23R0101_00DA

scr_seq_0029_D23R0101_00D7:
	npc_msg 0
scr_seq_0029_D23R0101_00DA:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_00E2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 14
	apply_movement 7, scr_seq_0029_D23R0101_036C
	wait_movement
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_00FD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_08A
	gotoif TRUE, scr_seq_0029_D23R0101_0243
	npc_msg 3
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0029_D23R0101_0221
	npc_msg 4
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0029_D23R0101_022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	npc_msg 5
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0029_D23R0101_022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	npc_msg 6
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0029_D23R0101_022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	npc_msg 7
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0029_D23R0101_022E
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	npc_msg 8
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0029_D23R0101_022E
	wait 30, VAR_SPECIAL_x800C
	play_se SEQ_SE_DP_PINPON
	wait_se SEQ_SE_DP_PINPON
	scrcmd_747
	npc_msg 9
	buffer_players_name 0
	npc_msg 10
	play_fanfare SEQ_ME_KEYITEM
	wait_fanfare
	closemsg
	register_pokegear_card 2
	setflag FLAG_UNK_08A
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 7, scr_seq_0029_D23R0101_0250
	apply_movement 255, scr_seq_0029_D23R0101_0270
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 15
	closemsg
	apply_movement 7, scr_seq_0029_D23R0101_0264
	wait 24, VAR_SPECIAL_x800C
	apply_movement 255, scr_seq_0029_D23R0101_036C
	wait_movement
	hide_person 7
	setflag FLAG_UNK_318
	releaseall
	end

scr_seq_0029_D23R0101_0221:
	npc_msg 13
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_0029_D23R0101_022E:
	play_se SEQ_SE_DP_BOX03
	wait_se SEQ_SE_DP_BOX03
	npc_msg 12
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_0029_D23R0101_0243:
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_024E:
	.byte 0x00, 0x00

scr_seq_0029_D23R0101_0250:
	.short 75, 1
	.short 50, 2
	.short 76, 3
	.short 78, 1
	.short 254, 0

scr_seq_0029_D23R0101_0264:
	.short 76, 1
	.short 78, 10
	.short 254, 0

scr_seq_0029_D23R0101_0270:
	.short 63, 6
	.short 76, 1
	.short 3, 1
	.short 254, 0
scr_seq_0029_D23R0101_0280:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_0291:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_02A2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4077, 3
	gotoif eq, scr_seq_0029_D23R0101_02C2
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_02C2:
	comparevartovalue VAR_TEMP_x400A, 1
	gotoif eq, scr_seq_0029_D23R0101_0316
	npc_msg 19
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_0029_D23R0101_02F5
	apply_movement 6, scr_seq_0029_D23R0101_0354
	goto scr_seq_0029_D23R0101_030A

scr_seq_0029_D23R0101_02F5:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0029_D23R0101_030A
	apply_movement 6, scr_seq_0029_D23R0101_0360
scr_seq_0029_D23R0101_030A:
	wait_movement
	releaseall
	setvar VAR_TEMP_x400A, 1
	end

scr_seq_0029_D23R0101_0316:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0029_D23R0101_0333
	setvar VAR_TEMP_x400B, 33
	goto scr_seq_0029_D23R0101_0346

scr_seq_0029_D23R0101_0333:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0029_D23R0101_0346
	setvar VAR_TEMP_x400B, 11
scr_seq_0029_D23R0101_0346:
	npc_msg 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_0351:
	.byte 0x00, 0x00, 0x00

scr_seq_0029_D23R0101_0354:
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_0029_D23R0101_0360:
	.short 14, 1
	.short 33, 1
	.short 254, 0

scr_seq_0029_D23R0101_036C:
	.short 34, 1
	.short 254, 0
	.byte 0x23, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00, 0x21, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00
scr_seq_0029_D23R0101_0384:
	scrcmd_609
	lockall
	show_person_at 5, 13, 1, 6, 3
	callstd std_play_rival_intro_music
	get_person_coords 6, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_0029_D23R0101_03D0
	apply_movement 5, scr_seq_0029_D23R0101_0670
	comparevartovalue VAR_TEMP_x400B, 33
	gotoif ne, scr_seq_0029_D23R0101_03CA
	apply_movement 6, scr_seq_0029_D23R0101_069C
scr_seq_0029_D23R0101_03CA:
	goto scr_seq_0029_D23R0101_03FA

scr_seq_0029_D23R0101_03D0:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0029_D23R0101_03FA
	apply_movement 5, scr_seq_0029_D23R0101_067C
	comparevartovalue VAR_TEMP_x400B, 11
	gotoif ne, scr_seq_0029_D23R0101_03FA
	apply_movement 6, scr_seq_0029_D23R0101_06A8
scr_seq_0029_D23R0101_03FA:
	wait_movement
	scrcmd_191 1
	npc_msg 21
	closemsg
	apply_movement 5, scr_seq_0029_D23R0101_0664
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_0029_D23R0101_0431
	apply_movement 5, scr_seq_0029_D23R0101_0684
	apply_movement 6, scr_seq_0029_D23R0101_06B4
	goto scr_seq_0029_D23R0101_044E

scr_seq_0029_D23R0101_0431:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0029_D23R0101_044E
	apply_movement 5, scr_seq_0029_D23R0101_0690
	apply_movement 6, scr_seq_0029_D23R0101_06C8
scr_seq_0029_D23R0101_044E:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_0029_D23R0101_046B
	apply_movement 255, scr_seq_0029_D23R0101_06E4
	goto scr_seq_0029_D23R0101_0480

scr_seq_0029_D23R0101_046B:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0029_D23R0101_0480
	apply_movement 255, scr_seq_0029_D23R0101_06EC
scr_seq_0029_D23R0101_0480:
	wait_movement
	buffer_players_name 0
	scrcmd_191 1
	npc_msg 22
	closemsg
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_0029_D23R0101_04A8
	apply_movement 255, scr_seq_0029_D23R0101_06FC
	goto scr_seq_0029_D23R0101_04BD

scr_seq_0029_D23R0101_04A8:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0029_D23R0101_04BD
	apply_movement 255, scr_seq_0029_D23R0101_07BC
scr_seq_0029_D23R0101_04BD:
	wait 50, VAR_SPECIAL_x800C
	scrcmd_188 1
	scrcmd_189
	scrcmd_620 0
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_0029_D23R0101_04E9
	apply_movement 6, scr_seq_0029_D23R0101_0874
	goto scr_seq_0029_D23R0101_04FE

scr_seq_0029_D23R0101_04E9:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0029_D23R0101_04FE
	apply_movement 6, scr_seq_0029_D23R0101_0890
scr_seq_0029_D23R0101_04FE:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_0029_D23R0101_0523
	apply_movement 6, scr_seq_0029_D23R0101_08AC
	apply_movement 5, scr_seq_0029_D23R0101_08BC
	goto scr_seq_0029_D23R0101_0540

scr_seq_0029_D23R0101_0523:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0029_D23R0101_0540
	apply_movement 6, scr_seq_0029_D23R0101_08B4
	apply_movement 5, scr_seq_0029_D23R0101_08D4
scr_seq_0029_D23R0101_0540:
	wait_movement
	npc_msg 23
	closemsg
	trainer_battle 185, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0029_D23R0101_0655
	npc_msg 24
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_0029_D23R0101_0592
	apply_movement 6, scr_seq_0029_D23R0101_08EC
	apply_movement 255, scr_seq_0029_D23R0101_0900
	goto scr_seq_0029_D23R0101_05AF

scr_seq_0029_D23R0101_0592:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0029_D23R0101_05AF
	apply_movement 6, scr_seq_0029_D23R0101_08F4
	apply_movement 255, scr_seq_0029_D23R0101_0914
scr_seq_0029_D23R0101_05AF:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person 6
	callstd std_play_rival_outro_music
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_0029_D23R0101_05DE
	apply_movement 5, scr_seq_0029_D23R0101_0928
	goto scr_seq_0029_D23R0101_05F3

scr_seq_0029_D23R0101_05DE:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0029_D23R0101_05F3
	apply_movement 5, scr_seq_0029_D23R0101_0930
scr_seq_0029_D23R0101_05F3:
	wait_movement
	comparevartovalue VAR_TEMP_x4001, 5
	gotoif ne, scr_seq_0029_D23R0101_0610
	apply_movement 255, scr_seq_0029_D23R0101_06DC
	goto scr_seq_0029_D23R0101_0625

scr_seq_0029_D23R0101_0610:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_0029_D23R0101_0625
	apply_movement 255, scr_seq_0029_D23R0101_06F4
scr_seq_0029_D23R0101_0625:
	wait_movement
	scrcmd_191 1
	npc_msg 25
	closemsg
	apply_movement 5, scr_seq_0029_D23R0101_0938
	wait_movement
	hide_person 5
	callstd 2071
	releaseall
	setvar VAR_UNK_4077, 4
	setflag FLAG_UNK_1BD
	setvar VAR_UNK_409F, 1
	end

scr_seq_0029_D23R0101_0655:
	setvar VAR_UNK_4077, 2
	scrcmd_219
	releaseall
	end

scr_seq_0029_D23R0101_0661:
	.byte 0x00, 0x00, 0x00

scr_seq_0029_D23R0101_0664:
	.short 65, 1
	.short 75, 1
	.short 254, 0

scr_seq_0029_D23R0101_0670:
	.short 19, 9
	.short 32, 1
	.short 254, 0

scr_seq_0029_D23R0101_067C:
	.short 19, 9
	.short 254, 0

scr_seq_0029_D23R0101_0684:
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_0029_D23R0101_0690:
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_0029_D23R0101_069C:
	.short 62, 9
	.short 33, 1
	.short 254, 0

scr_seq_0029_D23R0101_06A8:
	.short 62, 9
	.short 34, 1
	.short 254, 0

scr_seq_0029_D23R0101_06B4:
	.short 3, 1
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0

scr_seq_0029_D23R0101_06C8:
	.short 0, 1
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 254, 0

scr_seq_0029_D23R0101_06DC:
	.short 34, 1
	.short 254, 0

scr_seq_0029_D23R0101_06E4:
	.short 35, 1
	.short 254, 0

scr_seq_0029_D23R0101_06EC:
	.short 32, 1
	.short 254, 0

scr_seq_0029_D23R0101_06F4:
	.short 33, 1
	.short 254, 0

scr_seq_0029_D23R0101_06FC:
	.short 62, 1
	.short 3, 1
	.short 62, 1
	.short 1, 1
	.short 62, 1
	.short 2, 1
	.short 62, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 62, 1
	.short 1, 1
	.short 62, 1
	.short 2, 1
	.short 254, 0

scr_seq_0029_D23R0101_07BC:
	.short 62, 1
	.short 2, 1
	.short 62, 1
	.short 0, 1
	.short 62, 1
	.short 3, 1
	.short 62, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 62, 1
	.short 3, 1
	.short 62, 1
	.short 1, 1
	.short 254, 0

scr_seq_0029_D23R0101_0874:
	.short 65, 1
	.short 3, 1
	.short 71, 1
	.short 18, 2
	.short 72, 1
	.short 75, 1
	.short 254, 0

scr_seq_0029_D23R0101_0890:
	.short 65, 1
	.short 0, 1
	.short 71, 1
	.short 17, 2
	.short 72, 1
	.short 75, 1
	.short 254, 0

scr_seq_0029_D23R0101_08AC:
	.short 19, 3
	.short 254, 0

scr_seq_0029_D23R0101_08B4:
	.short 16, 3
	.short 254, 0

scr_seq_0029_D23R0101_08BC:
	.short 62, 1
	.short 0, 1
	.short 71, 1
	.short 17, 1
	.short 72, 1
	.short 254, 0

scr_seq_0029_D23R0101_08D4:
	.short 62, 1
	.short 3, 1
	.short 71, 1
	.short 18, 1
	.short 72, 1
	.short 254, 0

scr_seq_0029_D23R0101_08EC:
	.short 15, 2
	.short 254, 0

scr_seq_0029_D23R0101_08F4:
	.short 12, 1
	.short 15, 1
	.short 254, 0

scr_seq_0029_D23R0101_0900:
	.short 0, 1
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 254, 0

scr_seq_0029_D23R0101_0914:
	.short 3, 1
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0

scr_seq_0029_D23R0101_0928:
	.short 35, 1
	.short 254, 0

scr_seq_0029_D23R0101_0930:
	.short 32, 1
	.short 254, 0

scr_seq_0029_D23R0101_0938:
	.short 14, 9
	.short 254, 0
scr_seq_0029_D23R0101_0940:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_0953:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_0966:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_4136, 0
	gotoif ne, scr_seq_0029_D23R0101_0B86
	checkflag FLAG_UNK_AA6
	gotoif TRUE, scr_seq_0029_D23R0101_09CF
	checkflag FLAG_UNK_AA5
	gotoif TRUE, scr_seq_0029_D23R0101_09AF
	npc_msg 28
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0029_D23R0101_09E5
	goto scr_seq_0029_D23R0101_09DA

scr_seq_0029_D23R0101_09AF:
	npc_msg 45
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0029_D23R0101_09E5
	goto scr_seq_0029_D23R0101_09DA

scr_seq_0029_D23R0101_09CD:
	.byte 0x02, 0x00
scr_seq_0029_D23R0101_09CF:
	npc_msg 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_09DA:
	npc_msg 30
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_09E5:
	setflag FLAG_UNK_AA5
	npc_msg 31
	scrcmd_503 32768
	scrcmd_541 0, 32768, 2, 5
	npc_msg 32
	scrcmd_504 32769, 32770, 32771, 32768
	comparevartovalue VAR_SPECIAL_x8002, 0
	gotoif eq, scr_seq_0029_D23R0101_0A24
	comparevartovalue VAR_SPECIAL_x8003, 0
	gotoif eq, scr_seq_0029_D23R0101_0A2F
	goto scr_seq_0029_D23R0101_0A3D

scr_seq_0029_D23R0101_0A24:
	npc_msg 35
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_0A2F:
	bufferpartymonnick 0, VAR_SPECIAL_x8001
	npc_msg 33
	goto scr_seq_0029_D23R0101_0A4B

scr_seq_0029_D23R0101_0A3D:
	scrcmd_506 0, 32769
	npc_msg 34
	goto scr_seq_0029_D23R0101_0A4B

scr_seq_0029_D23R0101_0A4B:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8002
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0029_D23R0101_0A94
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0029_D23R0101_0A9F
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0029_D23R0101_0AA8
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0029_D23R0101_0AB1
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0029_D23R0101_0ABA
	end

scr_seq_0029_D23R0101_0A94:
	npc_msg 36
	goto scr_seq_0029_D23R0101_0AC3

scr_seq_0029_D23R0101_0A9D:
	.byte 0x02, 0x00
scr_seq_0029_D23R0101_0A9F:
	npc_msg 38
	goto scr_seq_0029_D23R0101_0AC3

scr_seq_0029_D23R0101_0AA8:
	npc_msg 39
	goto scr_seq_0029_D23R0101_0AC3

scr_seq_0029_D23R0101_0AB1:
	npc_msg 40
	goto scr_seq_0029_D23R0101_0AC3

scr_seq_0029_D23R0101_0ABA:
	npc_msg 41
	goto scr_seq_0029_D23R0101_0AC3

scr_seq_0029_D23R0101_0AC3:
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8002
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0029_D23R0101_0B0C
	comparevartovalue VAR_SPECIAL_x8008, 2
	gotoif eq, scr_seq_0029_D23R0101_0B1A
	comparevartovalue VAR_SPECIAL_x8008, 3
	gotoif eq, scr_seq_0029_D23R0101_0B26
	comparevartovalue VAR_SPECIAL_x8008, 4
	gotoif eq, scr_seq_0029_D23R0101_0B32
	comparevartovalue VAR_SPECIAL_x8008, 5
	gotoif eq, scr_seq_0029_D23R0101_0B3E
	end

scr_seq_0029_D23R0101_0B0C:
	setvar VAR_SPECIAL_x8003, 2
	goto scr_seq_0029_D23R0101_0B4A

scr_seq_0029_D23R0101_0B18:
	.byte 0x02, 0x00
scr_seq_0029_D23R0101_0B1A:
	setvar VAR_SPECIAL_x8003, 51
	goto scr_seq_0029_D23R0101_0B4A

scr_seq_0029_D23R0101_0B26:
	setvar VAR_SPECIAL_x8003, 216
	goto scr_seq_0029_D23R0101_0B4A

scr_seq_0029_D23R0101_0B32:
	setvar VAR_SPECIAL_x8003, 29
	goto scr_seq_0029_D23R0101_0B4A

scr_seq_0029_D23R0101_0B3E:
	setvar VAR_SPECIAL_x8003, 1
	goto scr_seq_0029_D23R0101_0B4A

scr_seq_0029_D23R0101_0B4A:
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x8003
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0029_D23R0101_0B75
	callstd std_give_item_verbose
	goto scr_seq_0029_D23R0101_0B98

scr_seq_0029_D23R0101_0B75:
	copyvar VAR_UNK_4136, VAR_SPECIAL_x8002
	npc_msg 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0029_D23R0101_0B86:
	buffer_players_name 0
	npc_msg 43
	copyvar VAR_SPECIAL_x8002, VAR_UNK_4136
	goto scr_seq_0029_D23R0101_0AC3

scr_seq_0029_D23R0101_0B98:
	setvar VAR_UNK_4136, 0
	setflag FLAG_UNK_AA6
	npc_msg 44
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
