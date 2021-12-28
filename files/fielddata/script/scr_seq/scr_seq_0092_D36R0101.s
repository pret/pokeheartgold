#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0092_D36R0101_005E ; 000
	scrdef scr_seq_0092_D36R0101_01A3 ; 001
	scrdef scr_seq_0092_D36R0101_0EE8 ; 002
	scrdef scr_seq_0092_D36R0101_048A ; 003
	scrdef scr_seq_0092_D36R0101_0597 ; 004
	scrdef scr_seq_0092_D36R0101_06A8 ; 005
	scrdef scr_seq_0092_D36R0101_09FA ; 006
	scrdef scr_seq_0092_D36R0101_0AF0 ; 007
	scrdef scr_seq_0092_D36R0101_0BE6 ; 008
	scrdef scr_seq_0092_D36R0101_0CD0 ; 009
	scrdef scr_seq_0092_D36R0101_10F3 ; 010
	scrdef scr_seq_0092_D36R0101_11A0 ; 011
	scrdef scr_seq_0092_D36R0101_1768 ; 012
	scrdef scr_seq_0092_D36R0101_2200 ; 013
	scrdef scr_seq_0092_D36R0101_12D3 ; 014
	scrdef scr_seq_0092_D36R0101_1304 ; 015
	scrdef scr_seq_0092_D36R0101_0E68 ; 016
	scrdef scr_seq_0092_D36R0101_1165 ; 017
	scrdef scr_seq_0092_D36R0101_15AC ; 018
	scrdef scr_seq_0092_D36R0101_1B1B ; 019
	scrdef scr_seq_0092_D36R0101_1F08 ; 020
	scrdef scr_seq_0092_D36R0101_0153 ; 021
	scrdef scr_seq_0092_D36R0101_20A0 ; 022
	scrdef_end

scr_seq_0092_D36R0101_005E:
	scrcmd_144 16416
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0092_D36R0101_0077
	clearflag FLAG_UNK_189
	goto scr_seq_0092_D36R0101_00C3

scr_seq_0092_D36R0101_0077:
	scrcmd_294 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0092_D36R0101_00B5
	get_weekday VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_0092_D36R0101_00BF
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_0092_D36R0101_00BF
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_0092_D36R0101_00BF
scr_seq_0092_D36R0101_00B5:
	setflag FLAG_UNK_27E
	goto scr_seq_0092_D36R0101_00C3

scr_seq_0092_D36R0101_00BF:
	clearflag FLAG_UNK_27E
scr_seq_0092_D36R0101_00C3:
	checkflag FLAG_UNK_07B
	gotoif TRUE, scr_seq_0092_D36R0101_00D0
	end

scr_seq_0092_D36R0101_00D0:
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
	setvar VAR_TEMP_x4000, 0
	setvar VAR_TEMP_x4001, 0
	setvar VAR_TEMP_x4002, 0
	setvar VAR_TEMP_x4003, 0
	setvar VAR_TEMP_x4004, 0
	checkflag FLAG_UNK_07D
	gotoif TRUE, scr_seq_0092_D36R0101_0124
	checkflag FLAG_UNK_07E
	gotoif TRUE, scr_seq_0092_D36R0101_0145
	end

scr_seq_0092_D36R0101_0124:
	checkflag FLAG_UNK_07E
	gotoif TRUE, scr_seq_0092_D36R0101_0137
	setvar VAR_UNK_4099, 2
	end

scr_seq_0092_D36R0101_0137:
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409E, 2
	end

scr_seq_0092_D36R0101_0145:
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409E, 2
	end

scr_seq_0092_D36R0101_0153:
	comparevartovalue VAR_UNK_412B, 1
	callif eq, scr_seq_0092_D36R0101_016F
	comparevartovalue VAR_UNK_40FE, 4
	callif eq, scr_seq_0092_D36R0101_0189
	end

scr_seq_0092_D36R0101_016F:
	show_person_at 15, 15, 0, 58, 1
	show_person_at 14, 15, 0, 59, 3
	return

scr_seq_0092_D36R0101_0189:
	show_person_at 16, 15, 0, 58, 1
	show_person_at 17, 11, 0, 58, 3
	return

scr_seq_0092_D36R0101_01A3:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 25
	gotoif ne, scr_seq_0092_D36R0101_01C4
	goto scr_seq_0092_D36R0101_01D7

scr_seq_0092_D36R0101_01BE:
	.byte 0x16, 0x00
	.byte 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_01C4:
	comparevartovalue VAR_TEMP_x4000, 32
	gotoif ne, scr_seq_0092_D36R0101_01D7
	goto scr_seq_0092_D36R0101_020B

scr_seq_0092_D36R0101_01D7:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 52
	gotoif ne, scr_seq_0092_D36R0101_01F8
	goto scr_seq_0092_D36R0101_0245

scr_seq_0092_D36R0101_01F2:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_01F8:
	comparevartovalue VAR_TEMP_x4001, 62
	gotoif ne, scr_seq_0092_D36R0101_020B
	goto scr_seq_0092_D36R0101_0299

scr_seq_0092_D36R0101_020B:
	setvar VAR_TEMP_x4002, 0
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 52
	gotoif ne, scr_seq_0092_D36R0101_0232
	goto scr_seq_0092_D36R0101_03CA

scr_seq_0092_D36R0101_022C:
	.byte 0x16, 0x00, 0x13, 0x00
	.byte 0x00, 0x00
scr_seq_0092_D36R0101_0232:
	comparevartovalue VAR_TEMP_x4001, 62
	gotoif ne, scr_seq_0092_D36R0101_0245
	goto scr_seq_0092_D36R0101_042A

scr_seq_0092_D36R0101_0245:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4002, 0
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0092_D36R0101_0272
	apply_movement 0, scr_seq_0092_D36R0101_0E18
	goto scr_seq_0092_D36R0101_0293

scr_seq_0092_D36R0101_0272:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0092_D36R0101_0293
	apply_movement 0, scr_seq_0092_D36R0101_0E08
	setvar VAR_UNK_409B, 1
	setvar VAR_UNK_4099, 1
scr_seq_0092_D36R0101_0293:
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0299:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0092_D36R0101_02B6
	goto scr_seq_0092_D36R0101_02C9

scr_seq_0092_D36R0101_02B0:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_02B6:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0092_D36R0101_02C9
	goto scr_seq_0092_D36R0101_0301

scr_seq_0092_D36R0101_02C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	apply_movement 0, scr_seq_0092_D36R0101_0DF8
	wait_movement
	checkflag FLAG_UNK_126
	gotoif TRUE, scr_seq_0092_D36R0101_02FD
	npc_msg 36
	waitbutton
	closemsg
	setflag FLAG_UNK_126
scr_seq_0092_D36R0101_02FD:
	releaseall
	end

scr_seq_0092_D36R0101_0301:
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_0092_D36R0101_0346
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	apply_movement 0, scr_seq_0092_D36R0101_0E18
	wait_movement
	checkflag FLAG_UNK_126
	gotoif TRUE, scr_seq_0092_D36R0101_0342
	npc_msg 36
	waitbutton
	closemsg
	setflag FLAG_UNK_126
scr_seq_0092_D36R0101_0342:
	releaseall
	end

scr_seq_0092_D36R0101_0346:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_076 83, 0
	npc_msg 3
	closemsg
	apply_movement 0, scr_seq_0092_D36R0101_0E58
	wait_movement
	hide_person 0
	npc_msg 37
	waitbutton
	closemsg
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	setflag FLAG_UNK_1A7
	setflag FLAG_UNK_07D
	checkflag FLAG_UNK_07E
	gotoif TRUE, scr_seq_0092_D36R0101_1207
	clearflag FLAG_UNK_1D3
	wait 20, VAR_SPECIAL_x8004
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 117, 0, 15, 65, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	wait 5, VAR_SPECIAL_x8004
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_03CA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0092_D36R0101_0403
	apply_movement 0, scr_seq_0092_D36R0101_0E08
	setvar VAR_UNK_409B, 1
	setvar VAR_UNK_4099, 1
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_0092_D36R0101_0424

scr_seq_0092_D36R0101_0403:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0092_D36R0101_0424
	apply_movement 0, scr_seq_0092_D36R0101_0E28
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
scr_seq_0092_D36R0101_0424:
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_042A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4004, 0
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0092_D36R0101_0463
	apply_movement 0, scr_seq_0092_D36R0101_0DF8
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	goto scr_seq_0092_D36R0101_0484

scr_seq_0092_D36R0101_0463:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0092_D36R0101_0484
	apply_movement 0, scr_seq_0092_D36R0101_0E28
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409B, 2
scr_seq_0092_D36R0101_0484:
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_048A:
	scrcmd_609
	lockall
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, scr_seq_0092_D36R0101_068E
	setvar VAR_TEMP_x4002, 1
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 1
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 25
	gotoif ne, scr_seq_0092_D36R0101_04CE
	goto scr_seq_0092_D36R0101_04E1

scr_seq_0092_D36R0101_04C8:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_04CE:
	comparevartovalue VAR_TEMP_x4000, 32
	gotoif ne, scr_seq_0092_D36R0101_04E1
	goto scr_seq_0092_D36R0101_0515

scr_seq_0092_D36R0101_04E1:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 52
	gotoif ne, scr_seq_0092_D36R0101_0502
	goto scr_seq_0092_D36R0101_0549

scr_seq_0092_D36R0101_04FC:
	.byte 0x16, 0x00, 0x13, 0x00
	.byte 0x00, 0x00
scr_seq_0092_D36R0101_0502:
	comparevartovalue VAR_TEMP_x4001, 62
	gotoif ne, scr_seq_0092_D36R0101_0515
	goto scr_seq_0092_D36R0101_0557

scr_seq_0092_D36R0101_0515:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 52
	gotoif ne, scr_seq_0092_D36R0101_0536
	goto scr_seq_0092_D36R0101_057B

scr_seq_0092_D36R0101_0530:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0536:
	comparevartovalue VAR_TEMP_x4001, 62
	gotoif ne, scr_seq_0092_D36R0101_0549
	goto scr_seq_0092_D36R0101_0589

scr_seq_0092_D36R0101_0549:
	apply_movement 0, scr_seq_0092_D36R0101_0DC8
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0557:
	apply_movement 0, scr_seq_0092_D36R0101_0DC8
	wait_movement
	checkflag FLAG_UNK_125
	gotoif TRUE, scr_seq_0092_D36R0101_0577
	npc_msg 35
	waitbutton
	closemsg
	setflag FLAG_UNK_125
scr_seq_0092_D36R0101_0577:
	releaseall
	end

scr_seq_0092_D36R0101_057B:
	apply_movement 0, scr_seq_0092_D36R0101_0DC8
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0589:
	apply_movement 0, scr_seq_0092_D36R0101_0DE0
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0597:
	scrcmd_609
	lockall
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, scr_seq_0092_D36R0101_068E
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409B, 2
	setvar VAR_TEMP_x4002, 0
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 25
	gotoif ne, scr_seq_0092_D36R0101_05DB
	goto scr_seq_0092_D36R0101_05EE

scr_seq_0092_D36R0101_05D5:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_05DB:
	comparevartovalue VAR_TEMP_x4000, 32
	gotoif ne, scr_seq_0092_D36R0101_05EE
	goto scr_seq_0092_D36R0101_0622

scr_seq_0092_D36R0101_05EE:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 52
	gotoif ne, scr_seq_0092_D36R0101_060F
	goto scr_seq_0092_D36R0101_0656

scr_seq_0092_D36R0101_0609:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_060F:
	comparevartovalue VAR_TEMP_x4001, 62
	gotoif ne, scr_seq_0092_D36R0101_0622
	goto scr_seq_0092_D36R0101_0664

scr_seq_0092_D36R0101_0622:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 52
	gotoif ne, scr_seq_0092_D36R0101_0643
	goto scr_seq_0092_D36R0101_0672

scr_seq_0092_D36R0101_063D:
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0643:
	comparevartovalue VAR_TEMP_x4001, 62
	gotoif ne, scr_seq_0092_D36R0101_0656
	goto scr_seq_0092_D36R0101_0680

scr_seq_0092_D36R0101_0656:
	apply_movement 0, scr_seq_0092_D36R0101_0DC8
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0664:
	apply_movement 0, scr_seq_0092_D36R0101_0DEC
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0672:
	apply_movement 0, scr_seq_0092_D36R0101_0DC8
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0680:
	apply_movement 0, scr_seq_0092_D36R0101_0DE0
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_068E:
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	apply_movement 0, scr_seq_0092_D36R0101_0DE0
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_06A8:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_0092_D36R0101_06C9
	goto scr_seq_0092_D36R0101_06DC

scr_seq_0092_D36R0101_06C3:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_06C9:
	comparevartovalue VAR_TEMP_x4000, 49
	gotoif ne, scr_seq_0092_D36R0101_06DC
	goto scr_seq_0092_D36R0101_0716

scr_seq_0092_D36R0101_06DC:
	setvar VAR_TEMP_x4003, 0
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_0092_D36R0101_0703
	goto scr_seq_0092_D36R0101_074A

scr_seq_0092_D36R0101_06FD:
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0703:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_0092_D36R0101_0716
	goto scr_seq_0092_D36R0101_07D4

scr_seq_0092_D36R0101_0716:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_0092_D36R0101_0737
	goto scr_seq_0092_D36R0101_0846

scr_seq_0092_D36R0101_0731:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0737:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_0092_D36R0101_074A
	goto scr_seq_0092_D36R0101_0982

scr_seq_0092_D36R0101_074A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0092_D36R0101_078B
	apply_movement 2, scr_seq_0092_D36R0101_0E38
	wait_movement
	setvar VAR_UNK_409A, 1
	setvar VAR_UNK_409C, 1
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
	goto scr_seq_0092_D36R0101_07BA

scr_seq_0092_D36R0101_078B:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0092_D36R0101_07BA
	apply_movement 2, scr_seq_0092_D36R0101_0E08
	wait_movement
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 1
	setvar VAR_UNK_409E, 2
scr_seq_0092_D36R0101_07BA:
	checkflag FLAG_UNK_126
	gotoif TRUE, scr_seq_0092_D36R0101_07D0
	npc_msg 36
	waitbutton
	closemsg
	setflag FLAG_UNK_126
scr_seq_0092_D36R0101_07D0:
	releaseall
	end

scr_seq_0092_D36R0101_07D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0092_D36R0101_0813
	apply_movement 2, scr_seq_0092_D36R0101_0E38
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
	goto scr_seq_0092_D36R0101_0840

scr_seq_0092_D36R0101_0813:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_0092_D36R0101_0840
	apply_movement 2, scr_seq_0092_D36R0101_0DF8
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
scr_seq_0092_D36R0101_0840:
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0846:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0092_D36R0101_0863
	goto scr_seq_0092_D36R0101_0876

scr_seq_0092_D36R0101_085D:
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0863:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0092_D36R0101_0876
	goto scr_seq_0092_D36R0101_08A4

scr_seq_0092_D36R0101_0876:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
	apply_movement 2, scr_seq_0092_D36R0101_0E48
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_08A4:
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, scr_seq_0092_D36R0101_08DF
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 1
	setvar VAR_UNK_409E, 2
	apply_movement 2, scr_seq_0092_D36R0101_0E08
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_08DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_076 83, 0
	npc_msg 3
	closemsg
	apply_movement 2, scr_seq_0092_D36R0101_0E60
	wait_movement
	hide_person 2
	npc_msg 37
	waitbutton
	closemsg
	checkflag FLAG_UNK_07D
	callif FALSE, scr_seq_0092_D36R0101_097A
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
	setflag FLAG_UNK_1A8
	setflag FLAG_UNK_07E
	checkflag FLAG_UNK_07D
	gotoif TRUE, scr_seq_0092_D36R0101_1207
	clearflag FLAG_UNK_1D3
	wait 20, VAR_SPECIAL_x8004
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 117, 0, 15, 65, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	wait 5, VAR_SPECIAL_x8004
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_097A:
	setvar VAR_UNK_4099, 1
	return

scr_seq_0092_D36R0101_0982:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0092_D36R0101_09C7
	apply_movement 2, scr_seq_0092_D36R0101_0DF8
	setvar VAR_UNK_409A, 1
	setvar VAR_UNK_409C, 1
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
	goto scr_seq_0092_D36R0101_09F4

scr_seq_0092_D36R0101_09C7:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0092_D36R0101_09F4
	apply_movement 2, scr_seq_0092_D36R0101_0E48
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
scr_seq_0092_D36R0101_09F4:
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_09FA:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4003, 0
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_0092_D36R0101_0A25
	goto scr_seq_0092_D36R0101_0A38

scr_seq_0092_D36R0101_0A1F:
	.byte 0x16
	.byte 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0A25:
	comparevartovalue VAR_TEMP_x4000, 49
	gotoif ne, scr_seq_0092_D36R0101_0A38
	goto scr_seq_0092_D36R0101_0A6C

scr_seq_0092_D36R0101_0A38:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_0092_D36R0101_0A59
	goto scr_seq_0092_D36R0101_0AA0

scr_seq_0092_D36R0101_0A53:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0A59:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_0092_D36R0101_0A6C
	goto scr_seq_0092_D36R0101_0AAE

scr_seq_0092_D36R0101_0A6C:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_0092_D36R0101_0A8D
	goto scr_seq_0092_D36R0101_0ABC

scr_seq_0092_D36R0101_0A87:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0A8D:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_0092_D36R0101_0AA0
	goto scr_seq_0092_D36R0101_0AE2

scr_seq_0092_D36R0101_0AA0:
	apply_movement 2, scr_seq_0092_D36R0101_0DEC
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0AAE:
	apply_movement 2, scr_seq_0092_D36R0101_0DD4
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0ABC:
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 1
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
	apply_movement 2, scr_seq_0092_D36R0101_0DD4
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0AE2:
	apply_movement 2, scr_seq_0092_D36R0101_0DD4
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0AF0:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4003, 1
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_0092_D36R0101_0B1B
	goto scr_seq_0092_D36R0101_0B2E

scr_seq_0092_D36R0101_0B15:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0B1B:
	comparevartovalue VAR_TEMP_x4000, 49
	gotoif ne, scr_seq_0092_D36R0101_0B2E
	goto scr_seq_0092_D36R0101_0B62

scr_seq_0092_D36R0101_0B2E:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_0092_D36R0101_0B4F
	goto scr_seq_0092_D36R0101_0B96

scr_seq_0092_D36R0101_0B49:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0B4F:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_0092_D36R0101_0B62
	goto scr_seq_0092_D36R0101_0BA4

scr_seq_0092_D36R0101_0B62:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_0092_D36R0101_0B83
	goto scr_seq_0092_D36R0101_0BB2

scr_seq_0092_D36R0101_0B7D:
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0B83:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_0092_D36R0101_0B96
	goto scr_seq_0092_D36R0101_0BD8

scr_seq_0092_D36R0101_0B96:
	apply_movement 2, scr_seq_0092_D36R0101_0DEC
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0BA4:
	apply_movement 2, scr_seq_0092_D36R0101_0DEC
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0BB2:
	setvar VAR_UNK_409A, 1
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
	apply_movement 2, scr_seq_0092_D36R0101_0DEC
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0BD8:
	apply_movement 2, scr_seq_0092_D36R0101_0DD4
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0BE6:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4003, 0
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_0092_D36R0101_0C11
	goto scr_seq_0092_D36R0101_0C24

scr_seq_0092_D36R0101_0C0B:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00
	.byte 0x00
scr_seq_0092_D36R0101_0C11:
	comparevartovalue VAR_TEMP_x4000, 49
	gotoif ne, scr_seq_0092_D36R0101_0C24
	goto scr_seq_0092_D36R0101_0C58

scr_seq_0092_D36R0101_0C24:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_0092_D36R0101_0C45
	goto scr_seq_0092_D36R0101_0C8C

scr_seq_0092_D36R0101_0C3F:
	.byte 0x16
	.byte 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0C45:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_0092_D36R0101_0C58
	goto scr_seq_0092_D36R0101_0C9A

scr_seq_0092_D36R0101_0C58:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_0092_D36R0101_0C79
	goto scr_seq_0092_D36R0101_0CAE

scr_seq_0092_D36R0101_0C73:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0C79:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_0092_D36R0101_0C8C
	goto scr_seq_0092_D36R0101_0CBC

scr_seq_0092_D36R0101_0C8C:
	apply_movement 2, scr_seq_0092_D36R0101_0DC8
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0C9A:
	setvar VAR_UNK_409D, 2
	apply_movement 2, scr_seq_0092_D36R0101_0DEC
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0CAE:
	apply_movement 2, scr_seq_0092_D36R0101_0DC8
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0CBC:
	setvar VAR_UNK_409D, 2
	apply_movement 2, scr_seq_0092_D36R0101_0DE0
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0CD0:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4003, 0
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_0092_D36R0101_0CFB
	goto scr_seq_0092_D36R0101_0D0E

scr_seq_0092_D36R0101_0CF5:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0CFB:
	comparevartovalue VAR_TEMP_x4000, 49
	gotoif ne, scr_seq_0092_D36R0101_0D0E
	goto scr_seq_0092_D36R0101_0D42

scr_seq_0092_D36R0101_0D0E:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_0092_D36R0101_0D2F
	goto scr_seq_0092_D36R0101_0D76

scr_seq_0092_D36R0101_0D29:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0D2F:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_0092_D36R0101_0D42
	goto scr_seq_0092_D36R0101_0D8A

scr_seq_0092_D36R0101_0D42:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_0092_D36R0101_0D63
	goto scr_seq_0092_D36R0101_0D98

scr_seq_0092_D36R0101_0D5D:
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_0D63:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_0092_D36R0101_0D76
	goto scr_seq_0092_D36R0101_0DB8

scr_seq_0092_D36R0101_0D76:
	setvar VAR_UNK_409E, 2
	apply_movement 2, scr_seq_0092_D36R0101_0DEC
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0D8A:
	apply_movement 2, scr_seq_0092_D36R0101_0DD4
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0D98:
	setvar VAR_UNK_409A, 1
	setvar VAR_UNK_409C, 1
	setvar VAR_UNK_409E, 2
	apply_movement 2, scr_seq_0092_D36R0101_0DE0
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0DB8:
	apply_movement 2, scr_seq_0092_D36R0101_0DD4
	wait_movement
	releaseall
	end

scr_seq_0092_D36R0101_0DC6:
	.byte 0x00, 0x00

scr_seq_0092_D36R0101_0DC8:
	.short 1, 1
	.short 75, 1
	.short 254, 0

scr_seq_0092_D36R0101_0DD4:
	.short 0, 1
	.short 75, 1
	.short 254, 0

scr_seq_0092_D36R0101_0DE0:
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_0092_D36R0101_0DEC:
	.short 3, 1
	.short 75, 1
	.short 254, 0

scr_seq_0092_D36R0101_0DF8:
	.short 75, 1
	.short 16, 10
	.short 1, 1
	.short 254, 0

scr_seq_0092_D36R0101_0E08:
	.short 75, 1
	.short 17, 10
	.short 0, 1
	.short 254, 0

scr_seq_0092_D36R0101_0E18:
	.short 75, 1
	.short 19, 7
	.short 2, 1
	.short 254, 0

scr_seq_0092_D36R0101_0E28:
	.short 75, 1
	.short 18, 7
	.short 3, 1
	.short 254, 0

scr_seq_0092_D36R0101_0E38:
	.short 75, 1
	.short 19, 8
	.short 2, 1
	.short 254, 0

scr_seq_0092_D36R0101_0E48:
	.short 75, 1
	.short 18, 8
	.short 3, 1
	.short 254, 0

scr_seq_0092_D36R0101_0E58:
	.short 37, 5
	.short 254, 0

scr_seq_0092_D36R0101_0E60:
	.short 39, 5
	.short 254, 0
scr_seq_0092_D36R0101_0E68:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_0092_D36R0101_0EC4
	wait_movement
	apply_movement 1, scr_seq_0092_D36R0101_0ED0
	wait_movement
	play_se SEQ_SE_DP_KI_GASYAN
	scrcmd_561 0, 2, 10, 5
	apply_movement 1, scr_seq_0092_D36R0101_0ED8
	wait_movement
	apply_movement 1, scr_seq_0092_D36R0101_0ED0
	wait_movement
	play_se SEQ_SE_DP_KI_GASYAN
	scrcmd_561 0, 2, 10, 5
	apply_movement 1, scr_seq_0092_D36R0101_0ED8
	wait_movement
	setvar VAR_UNK_40EA, 1
	releaseall
	end


scr_seq_0092_D36R0101_0EC4:
	.short 75, 1
	.short 32, 1
	.short 254, 0

scr_seq_0092_D36R0101_0ED0:
	.short 52, 1
	.short 254, 0

scr_seq_0092_D36R0101_0ED8:
	.short 71, 1
	.short 9, 1
	.short 72, 1
	.short 254, 0
scr_seq_0092_D36R0101_0EE8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 11
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0092_D36R0101_1086
	npc_msg 14
	closemsg
scr_seq_0092_D36R0101_0F0B:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0092_D36R0101_1093
	get_partymon_species VAR_SPECIAL_x800C, VAR_SPECIAL_x8005
	setorcopyvar VAR_SPECIAL_x8006, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_0092_D36R0101_10A0
	scrcmd_140 32780, 29, 32774
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0092_D36R0101_10E1
	scrcmd_656 32774, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0092_D36R0101_0F84
	npc_msg 16
	closemsg
	goto scr_seq_0092_D36R0101_0F0B

scr_seq_0092_D36R0101_0F84:
	scrcmd_396 32770, 32774
	comparevartovalue VAR_SPECIAL_x8002, 3
	gotoif le, scr_seq_0092_D36R0101_1041
	scrcmd_746
scr_seq_0092_D36R0101_0F99:
	bufferpartymonnick 0, VAR_SPECIAL_x8006
	npc_msg 17
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0092_D36R0101_10C7
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_352 1, 32774, 29
	scrcmd_353 1, 32769
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8001, 4
	gotoif eq, scr_seq_0092_D36R0101_10AB
	scrcmd_399 1, 32774, 32769
	npc_msg 18
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0092_D36R0101_10C7
	scrcmd_139 32774, 32769, 29
	npc_msg 20
	play_se SEQ_SE_DP_KON
	wait_se SEQ_SE_DP_KON
	wait 30, VAR_SPECIAL_x800C
	npc_msg 24
	wait 32, VAR_SPECIAL_x800C
	npc_msg 25
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	wait 16, VAR_SPECIAL_x800C
	scrcmd_076 32773, 0
	goto scr_seq_0092_D36R0101_1079

scr_seq_0092_D36R0101_1041:
	bufferpartymonnick 0, VAR_SPECIAL_x8006
	scrcmd_139 32774, 32770, 29
	npc_msg 21
	wait 30, VAR_SPECIAL_x800C
	npc_msg 26
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	wait 32, VAR_SPECIAL_x800C
	scrcmd_076 32773, 0
	npc_msg 22
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_0092_D36R0101_1079:
	npc_msg 22
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_0092_D36R0101_1086:
	npc_msg 13
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_0092_D36R0101_1093:
	npc_msg 13
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_0092_D36R0101_10A0:
	npc_msg 15
	closemsg
	goto scr_seq_0092_D36R0101_0F0B

scr_seq_0092_D36R0101_10AB:
	npc_msg 19
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0092_D36R0101_0F99
	goto scr_seq_0092_D36R0101_1086

scr_seq_0092_D36R0101_10C7:
	npc_msg 19
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0092_D36R0101_0F99
	goto scr_seq_0092_D36R0101_1086

scr_seq_0092_D36R0101_10E1:
	buffer_mon_species_name 0, VAR_SPECIAL_x8006
	npc_msg 23
	closemsg
	goto scr_seq_0092_D36R0101_0F0B

scr_seq_0092_D36R0101_10F1:
	.byte 0x02, 0x00
scr_seq_0092_D36R0101_10F3:
	checkflag FLAG_UNK_07D
	gotoif TRUE, scr_seq_0092_D36R0101_1104
	goto scr_seq_0092_D36R0101_1115

scr_seq_0092_D36R0101_1104:
	checkflag FLAG_UNK_07E
	gotoif TRUE, scr_seq_0092_D36R0101_1126
	goto scr_seq_0092_D36R0101_1139

scr_seq_0092_D36R0101_1115:
	checkflag FLAG_UNK_07E
	gotoif TRUE, scr_seq_0092_D36R0101_1139
	goto scr_seq_0092_D36R0101_114C

scr_seq_0092_D36R0101_1126:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_1139:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_114C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	setvar VAR_UNK_40F4, 0
	releaseall
	end

scr_seq_0092_D36R0101_1165:
	scrcmd_609
	lockall
	apply_movement 3, scr_seq_0092_D36R0101_118C
	apply_movement 255, scr_seq_0092_D36R0101_1194
	wait_movement
	npc_msg 0
	waitbutton
	closemsg
	setvar VAR_UNK_40F4, 0
	releaseall
	end


scr_seq_0092_D36R0101_118C:
	.short 75, 1
	.short 254, 0

scr_seq_0092_D36R0101_1194:
	.short 63, 2
	.short 0, 1
	.short 254, 0
scr_seq_0092_D36R0101_11A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_080
	gotoif TRUE, scr_seq_0092_D36R0101_11F2
	npc_msg 6
	setvar VAR_SPECIAL_x8004, 420
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0092_D36R0101_11FD
	callstd std_give_item_verbose
	setflag FLAG_UNK_080
	clearflag FLAG_UNK_1AE
	clearflag FLAG_UNK_1AC
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_11F2:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_11FD:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_1207:
	clearflag FLAG_UNK_1AF
	scrcmd_100 4
	clearflag FLAG_UNK_1D4
	wait 20, VAR_SPECIAL_x8004
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 117, 0, 15, 65, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	wait 5, VAR_SPECIAL_x8004
	npc_msg 2
	waitbutton
	closemsg
	apply_movement 4, scr_seq_0092_D36R0101_12EC
	apply_movement 255, scr_seq_0092_D36R0101_12F8
	wait_movement
	checkflag FLAG_UNK_080
	gotoif TRUE, scr_seq_0092_D36R0101_12BE
	npc_msg 6
	setvar VAR_SPECIAL_x8004, 420
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0092_D36R0101_12C9
	callstd std_give_item_verbose
	setflag FLAG_UNK_1AF
	setflag FLAG_UNK_1AD
	setflag FLAG_UNK_1A7
	setflag FLAG_UNK_1A8
	setflag FLAG_UNK_1D3
	setflag FLAG_UNK_1D4
	setflag FLAG_UNK_080
	clearflag FLAG_UNK_1AE
	clearflag FLAG_UNK_1AC
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_12BE:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_12C9:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_12D3:
	scrcmd_076 83, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0092_D36R0101_12EC:
	.short 12, 10
	.short 15, 3
	.short 254, 0

scr_seq_0092_D36R0101_12F8:
	.short 63, 12
	.short 2, 1
	.short 254, 0
scr_seq_0092_D36R0101_1304:
	scrcmd_609
	lockall
	callstd 2067
	apply_movement 12, scr_seq_0092_D36R0101_1478
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8004, 40
	gotoif ne, scr_seq_0092_D36R0101_1337
	apply_movement 12, scr_seq_0092_D36R0101_1484
	goto scr_seq_0092_D36R0101_133F

scr_seq_0092_D36R0101_1337:
	apply_movement 12, scr_seq_0092_D36R0101_1494
scr_seq_0092_D36R0101_133F:
	wait_movement
	npc_msg 29
	closemsg
	apply_movement 12, scr_seq_0092_D36R0101_14A4
	wait_movement
	npc_msg 30
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0092_D36R0101_1371
	npc_msg 31
	goto scr_seq_0092_D36R0101_1374

scr_seq_0092_D36R0101_1371:
	npc_msg 32
scr_seq_0092_D36R0101_1374:
	closemsg
	get_lead_mon_index VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 50
	gotoif eq, scr_seq_0092_D36R0101_13D5
	comparevartovalue VAR_TEMP_x4001, 51
	gotoif eq, scr_seq_0092_D36R0101_13D5
	scrcmd_099 253
	comparevartovalue VAR_SPECIAL_x8004, 40
	gotoif ne, scr_seq_0092_D36R0101_13C1
	apply_movement 255, scr_seq_0092_D36R0101_14E8
	apply_movement 253, scr_seq_0092_D36R0101_14FC
	goto scr_seq_0092_D36R0101_13C9

scr_seq_0092_D36R0101_13C1:
	apply_movement 253, scr_seq_0092_D36R0101_1518
scr_seq_0092_D36R0101_13C9:
	wait_movement
	scrcmd_098 253
	goto scr_seq_0092_D36R0101_140A

scr_seq_0092_D36R0101_13D5:
	scrcmd_099 253
	comparevartovalue VAR_SPECIAL_x8004, 40
	gotoif ne, scr_seq_0092_D36R0101_13FC
	apply_movement 255, scr_seq_0092_D36R0101_14E8
	apply_movement 253, scr_seq_0092_D36R0101_1538
	goto scr_seq_0092_D36R0101_1404

scr_seq_0092_D36R0101_13FC:
	apply_movement 253, scr_seq_0092_D36R0101_1550
scr_seq_0092_D36R0101_1404:
	wait_movement
	scrcmd_098 253
scr_seq_0092_D36R0101_140A:
	comparevartovalue VAR_SPECIAL_x8004, 40
	gotoif ne, scr_seq_0092_D36R0101_1425
	apply_movement 12, scr_seq_0092_D36R0101_156C
	goto scr_seq_0092_D36R0101_142D

scr_seq_0092_D36R0101_1425:
	apply_movement 12, scr_seq_0092_D36R0101_1574
scr_seq_0092_D36R0101_142D:
	wait_movement
	npc_msg 33
	closemsg
	apply_movement 12, scr_seq_0092_D36R0101_157C
	wait_movement
	npc_msg 34
	closemsg
	apply_movement 12, scr_seq_0092_D36R0101_159C
	wait_movement
	hide_person 12
	setflag FLAG_UNK_23D
	callstd 2068
	scrcmd_099 253
	apply_movement 253, scr_seq_0092_D36R0101_1584
	wait_movement
	scrcmd_098 253
	releaseall
	setvar VAR_UNK_40E9, 1
	end

scr_seq_0092_D36R0101_1475:
	.byte 0x00, 0x00, 0x00

scr_seq_0092_D36R0101_1478:
	.short 75, 1
	.short 33, 1
	.short 254, 0

scr_seq_0092_D36R0101_1484:
	.short 13, 1
	.short 15, 2
	.short 13, 1
	.short 254, 0

scr_seq_0092_D36R0101_1494:
	.short 13, 1
	.short 15, 3
	.short 13, 1
	.short 254, 0

scr_seq_0092_D36R0101_14A4:
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 254, 0

scr_seq_0092_D36R0101_14E8:
	.short 2, 1
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_0092_D36R0101_14FC:
	.short 12, 2
	.short 14, 1
	.short 12, 2
	.short 14, 3
	.short 35, 1
	.short 51, 3
	.short 254, 0

scr_seq_0092_D36R0101_1518:
	.short 14, 1
	.short 12, 2
	.short 14, 1
	.short 12, 2
	.short 14, 3
	.short 35, 1
	.short 51, 3
	.short 254, 0

scr_seq_0092_D36R0101_1538:
	.short 12, 2
	.short 14, 1
	.short 12, 2
	.short 14, 3
	.short 35, 1
	.short 254, 0

scr_seq_0092_D36R0101_1550:
	.short 14, 1
	.short 12, 2
	.short 14, 1
	.short 12, 2
	.short 14, 3
	.short 35, 1
	.short 254, 0

scr_seq_0092_D36R0101_156C:
	.short 34, 1
	.short 254, 0

scr_seq_0092_D36R0101_1574:
	.short 14, 1
	.short 254, 0

scr_seq_0092_D36R0101_157C:
	.short 33, 1
	.short 254, 0

scr_seq_0092_D36R0101_1584:
	.short 15, 3
	.short 13, 2
	.short 15, 1
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_0092_D36R0101_159C:
	.short 14, 2
	.short 12, 2
	.short 14, 6
	.short 254, 0
scr_seq_0092_D36R0101_15AC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0092_D36R0101_16D8
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0092_D36R0101_16EC
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0092_D36R0101_1625
	apply_movement 255, scr_seq_0092_D36R0101_1700
	apply_movement 13, scr_seq_0092_D36R0101_174C
	goto scr_seq_0092_D36R0101_1677

scr_seq_0092_D36R0101_1625:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0092_D36R0101_1640
	apply_movement 255, scr_seq_0092_D36R0101_1718
	goto scr_seq_0092_D36R0101_1677

scr_seq_0092_D36R0101_1640:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0092_D36R0101_1663
	apply_movement 255, scr_seq_0092_D36R0101_1738
	apply_movement 13, scr_seq_0092_D36R0101_174C
	goto scr_seq_0092_D36R0101_1677

scr_seq_0092_D36R0101_1663:
	scrcmd_074 2132
	apply_movement 255, scr_seq_0092_D36R0101_1724
	apply_movement 13, scr_seq_0092_D36R0101_174C
scr_seq_0092_D36R0101_1677:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0092_D36R0101_169E
	apply_movement 253, scr_seq_0092_D36R0101_1758
	wait_movement
scr_seq_0092_D36R0101_169E:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 8
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_16D8:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_16EC:
	get_std_msg_naix 2, VAR_SPECIAL_x800C
	msgbox_extern VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_0092_D36R0101_1700:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0092_D36R0101_1718:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0092_D36R0101_1724:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0092_D36R0101_1738:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0092_D36R0101_174C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0092_D36R0101_1758:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_0092_D36R0101_1768:
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0092_D36R0101_1803
	comparevartovalue VAR_UNK_412B, 2
	gotoif ge, scr_seq_0092_D36R0101_17C1
	comparevartovalue VAR_UNK_412B, 1
	gotoif eq, scr_seq_0092_D36R0101_1803
	get_lead_mon_index VAR_TEMP_x4000
	scrcmd_698 0, 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0092_D36R0101_17B7
	goto scr_seq_0092_D36R0101_17C1

scr_seq_0092_D36R0101_17B1:
	.byte 0x16, 0x00, 0x0a, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_17B7:
	clearflag FLAG_UNK_29B
	goto scr_seq_0092_D36R0101_1816

scr_seq_0092_D36R0101_17C1:
	comparevartovalue VAR_UNK_40FE, 4
	gotoif ge, scr_seq_0092_D36R0101_1803
	checkflag FLAG_UNK_0C6
	gotoif FALSE, scr_seq_0092_D36R0101_1803
	get_lead_mon_index VAR_TEMP_x4006
	scrcmd_698 3, 16390, 16391
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_0092_D36R0101_17FD
	goto scr_seq_0092_D36R0101_1803

scr_seq_0092_D36R0101_17F7:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0092_D36R0101_17FD:
	goto scr_seq_0092_D36R0101_1F48

scr_seq_0092_D36R0101_1803:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0092_D36R0101_1816:
	scrcmd_609
	lockall
	scrcmd_081 0
	clearflag FLAG_UNK_29B
	scrcmd_100 14
	apply_movement 14, scr_seq_0092_D36R0101_1C44
	wait_movement
	scrcmd_076 172, 0
	scrcmd_077
	apply_movement 255, scr_seq_0092_D36R0101_1C58
	wait_movement
	callstd 2065
	apply_movement 14, scr_seq_0092_D36R0101_1C64
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0092_D36R0101_1C8C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 38
	closemsg
	apply_movement 253, scr_seq_0092_D36R0101_1CB4
	wait_movement
	apply_movement 14, scr_seq_0092_D36R0101_1CC4
	wait_movement
	apply_movement 253, scr_seq_0092_D36R0101_1CF8
	wait_movement
	apply_movement 14, scr_seq_0092_D36R0101_1D08
	apply_movement 253, scr_seq_0092_D36R0101_1D2C
	wait_movement
	clearflag FLAG_UNK_29C
	scrcmd_100 15
	apply_movement 15, scr_seq_0092_D36R0101_1DE0
	apply_movement 14, scr_seq_0092_D36R0101_1D48
	apply_movement 253, scr_seq_0092_D36R0101_1DA4
	wait_movement
	apply_movement 255, scr_seq_0092_D36R0101_1E88
	wait_movement
	npc_msg 46
	closemsg
	apply_movement 15, scr_seq_0092_D36R0101_1DF4
	wait_movement
	npc_msg 47
	closemsg
	apply_movement 15, scr_seq_0092_D36R0101_1E00
	apply_movement 14, scr_seq_0092_D36R0101_1E10
	apply_movement 255, scr_seq_0092_D36R0101_1ED0
	wait_movement
	npc_msg 48
	closemsg
	apply_movement 14, scr_seq_0092_D36R0101_1E20
	apply_movement 253, scr_seq_0092_D36R0101_1E2C
	wait_movement
	npc_msg 49
	closemsg
	apply_movement 253, scr_seq_0092_D36R0101_1E38
	wait_movement
	apply_movement 14, scr_seq_0092_D36R0101_1E40
	wait_movement
	apply_movement 253, scr_seq_0092_D36R0101_1E48
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0092_D36R0101_1E74
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	npc_msg 39
	scrcmd_076 172, 0
	npc_msg 43
	scrcmd_077
	closemsg
	call scr_seq_0092_D36R0101_1987
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif ge, scr_seq_0092_D36R0101_1AFB
	comparevartovalue VAR_SPECIAL_x8004, 0
	callif eq, scr_seq_0092_D36R0101_19AC
	releaseall
	end

scr_seq_0092_D36R0101_1987:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif lt, scr_seq_0092_D36R0101_19A4
	setvar VAR_SPECIAL_x8004, 1
	goto scr_seq_0092_D36R0101_19AA

scr_seq_0092_D36R0101_19A4:
	setvar VAR_SPECIAL_x8004, 0
scr_seq_0092_D36R0101_19AA:
	return

scr_seq_0092_D36R0101_19AC:
	npc_msg 52
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_0092_D36R0101_1EB4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
scr_seq_0092_D36R0101_19CF:
	scrcmd_386 VAR_TEMP_x4005
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_0092_D36R0101_19EE
	apply_movement 15, scr_seq_0092_D36R0101_1E90
	goto scr_seq_0092_D36R0101_19F6

scr_seq_0092_D36R0101_19EE:
	apply_movement 15, scr_seq_0092_D36R0101_1E98
scr_seq_0092_D36R0101_19F6:
	wait_movement
	play_fanfare SEQ_ME_ITEM
	buffer_players_name 0
	npc_msg 44
	wait_fanfare
	npc_msg 53
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_0092_D36R0101_1A2C
	apply_movement 255, scr_seq_0092_D36R0101_1ED8
	goto scr_seq_0092_D36R0101_1A34

scr_seq_0092_D36R0101_1A2C:
	apply_movement 255, scr_seq_0092_D36R0101_1EE4
scr_seq_0092_D36R0101_1A34:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_TEMP_x4008, 0
	gotoif ne, scr_seq_0092_D36R0101_1A51
	callstd 2066
scr_seq_0092_D36R0101_1A51:
	scrcmd_778
	hide_person 14
	setvar VAR_UNK_412B, 2
	play_fanfare SEQ_ME_SHINKAOME
	npc_msg 40
	wait_fanfare
	scrcmd_746
	npc_msg 45
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0092_D36R0101_1AC5
	closemsg
	get_party_count VAR_TEMP_x4009
	subvar VAR_TEMP_x4009, 1
	setvar VAR_TEMP_x400A, 0
	scrcmd_490 16393
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_173 VAR_TEMP_x4009, VAR_TEMP_x400A
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_TEMP_x400A, 1
	gotoif eq, scr_seq_0092_D36R0101_1AC5
	bufferpartymonnick 0, VAR_TEMP_x4009
	npc_msg 54
scr_seq_0092_D36R0101_1AC5:
	npc_msg 51
	closemsg
	scrcmd_747
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_0092_D36R0101_1AE7
	apply_movement 15, scr_seq_0092_D36R0101_1E64
	goto scr_seq_0092_D36R0101_1AEF

scr_seq_0092_D36R0101_1AE7:
	apply_movement 15, scr_seq_0092_D36R0101_1E50
scr_seq_0092_D36R0101_1AEF:
	wait_movement
	hide_person 15
	setflag FLAG_UNK_29C
	return

scr_seq_0092_D36R0101_1AFB:
	npc_msg 50
	waitbutton
	closemsg
	comparevartovalue VAR_TEMP_x4008, 0
	gotoif ne, scr_seq_0092_D36R0101_1B13
	callstd 2066
scr_seq_0092_D36R0101_1B13:
	setvar VAR_UNK_412B, 1
	return

scr_seq_0092_D36R0101_1B1B:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4008, 1
	scrcmd_386 VAR_TEMP_x4005
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_0092_D36R0101_1B44
	apply_movement 14, scr_seq_0092_D36R0101_1EF0
	goto scr_seq_0092_D36R0101_1B67

scr_seq_0092_D36R0101_1B44:
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif ne, scr_seq_0092_D36R0101_1B5F
	apply_movement 14, scr_seq_0092_D36R0101_1EF8
	goto scr_seq_0092_D36R0101_1B67

scr_seq_0092_D36R0101_1B5F:
	apply_movement 14, scr_seq_0092_D36R0101_1F00
scr_seq_0092_D36R0101_1B67:
	wait_movement
	scrcmd_076 172, 0
	npc_msg 43
	scrcmd_077
	closemsg
	call scr_seq_0092_D36R0101_1987
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ge, scr_seq_0092_D36R0101_1C36
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_TEMP_x4005
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_0092_D36R0101_1BB2
	apply_movement 15, scr_seq_0092_D36R0101_1E90
	goto scr_seq_0092_D36R0101_1BD5

scr_seq_0092_D36R0101_1BB2:
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif ne, scr_seq_0092_D36R0101_1BCD
	apply_movement 15, scr_seq_0092_D36R0101_1E98
	goto scr_seq_0092_D36R0101_1BD5

scr_seq_0092_D36R0101_1BCD:
	apply_movement 15, scr_seq_0092_D36R0101_1EA0
scr_seq_0092_D36R0101_1BD5:
	wait_movement
	npc_msg 52
	closemsg
	scrcmd_386 VAR_TEMP_x4005
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_0092_D36R0101_1BFB
	apply_movement 255, scr_seq_0092_D36R0101_1EA8
	goto scr_seq_0092_D36R0101_1C1E

scr_seq_0092_D36R0101_1BFB:
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif ne, scr_seq_0092_D36R0101_1C16
	apply_movement 255, scr_seq_0092_D36R0101_1EB4
	goto scr_seq_0092_D36R0101_1C1E

scr_seq_0092_D36R0101_1C16:
	apply_movement 255, scr_seq_0092_D36R0101_1EC0
scr_seq_0092_D36R0101_1C1E:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	call scr_seq_0092_D36R0101_19CF
	goto scr_seq_0092_D36R0101_1C3D

scr_seq_0092_D36R0101_1C36:
	npc_msg 42
	waitbutton
	closemsg
scr_seq_0092_D36R0101_1C3D:
	releaseall
	end

scr_seq_0092_D36R0101_1C41:
	.byte 0x00, 0x00, 0x00

scr_seq_0092_D36R0101_1C44:
	.short 71, 1
	.short 59, 1
	.short 72, 1
	.short 49, 2
	.short 254, 0

scr_seq_0092_D36R0101_1C58:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_0092_D36R0101_1C64:
	.short 17, 7
	.short 50, 1
	.short 18, 4
	.short 16, 4
	.short 19, 4
	.short 17, 4
	.short 18, 2
	.short 0, 1
	.short 48, 2
	.short 254, 0

scr_seq_0092_D36R0101_1C8C:
	.short 63, 3
	.short 1, 1
	.short 63, 1
	.short 13, 2
	.short 35, 1
	.short 65, 1
	.short 34, 1
	.short 65, 1
	.short 33, 1
	.short 254, 0

scr_seq_0092_D36R0101_1CB4:
	.short 15, 1
	.short 13, 1
	.short 1, 1
	.short 254, 0

scr_seq_0092_D36R0101_1CC4:
	.short 71, 1
	.short 55, 1
	.short 72, 1
	.short 48, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 3, 1
	.short 1, 1
	.short 2, 1
	.short 0, 1
	.short 254, 0

scr_seq_0092_D36R0101_1CF8:
	.short 75, 1
	.short 63, 1
	.short 49, 2
	.short 254, 0

scr_seq_0092_D36R0101_1D08:
	.short 71, 1
	.short 53, 1
	.short 72, 1
	.short 65, 1
	.short 50, 1
	.short 18, 7
	.short 16, 13
	.short 15, 1
	.short 254, 0

scr_seq_0092_D36R0101_1D2C:
	.short 65, 2
	.short 17, 1
	.short 18, 6
	.short 48, 1
	.short 16, 13
	.short 18, 1
	.short 254, 0

scr_seq_0092_D36R0101_1D48:
	.short 17, 12
	.short 19, 6
	.short 16, 4
	.short 18, 3
	.short 17, 4
	.short 19, 3
	.short 71, 1
	.short 54, 1
	.short 72, 1
	.short 1, 6
	.short 71, 1
	.short 10, 1
	.short 72, 1
	.short 2, 6
	.short 0, 6
	.short 71, 1
	.short 11, 1
	.short 72, 1
	.short 3, 6
	.short 71, 1
	.short 10, 1
	.short 72, 1
	.short 254, 0

scr_seq_0092_D36R0101_1DA4:
	.short 17, 13
	.short 19, 7
	.short 48, 1
	.short 50, 1
	.short 63, 4
	.short 71, 1
	.short 55, 1
	.short 72, 1
	.short 1, 6
	.short 3, 6
	.short 0, 6
	.short 2, 6
	.short 66, 1
	.short 14, 1
	.short 254, 0

scr_seq_0092_D36R0101_1DE0:
	.short 65, 5
	.short 9, 10
	.short 11, 4
	.short 35, 1
	.short 254, 0

scr_seq_0092_D36R0101_1DF4:
	.short 32, 1
	.short 65, 1
	.short 254, 0

scr_seq_0092_D36R0101_1E00:
	.short 33, 1
	.short 65, 1
	.short 75, 1
	.short 254, 0

scr_seq_0092_D36R0101_1E10:
	.short 65, 1
	.short 32, 1
	.short 65, 1
	.short 254, 0

scr_seq_0092_D36R0101_1E20:
	.short 48, 1
	.short 51, 1
	.short 254, 0

scr_seq_0092_D36R0101_1E2C:
	.short 54, 1
	.short 50, 2
	.short 254, 0

scr_seq_0092_D36R0101_1E38:
	.short 34, 1
	.short 254, 0

scr_seq_0092_D36R0101_1E40:
	.short 51, 2
	.short 254, 0

scr_seq_0092_D36R0101_1E48:
	.short 48, 2
	.short 254, 0

scr_seq_0092_D36R0101_1E50:
	.short 35, 1
	.short 65, 1
	.short 10, 4
	.short 8, 10
	.short 254, 0

scr_seq_0092_D36R0101_1E64:
	.short 9, 2
	.short 10, 4
	.short 8, 12
	.short 254, 0

scr_seq_0092_D36R0101_1E74:
	.short 75, 1
	.short 63, 1
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_0092_D36R0101_1E88:
	.short 34, 1
	.short 254, 0

scr_seq_0092_D36R0101_1E90:
	.short 34, 1
	.short 254, 0

scr_seq_0092_D36R0101_1E98:
	.short 35, 1
	.short 254, 0

scr_seq_0092_D36R0101_1EA0:
	.short 33, 1
	.short 254, 0

scr_seq_0092_D36R0101_1EA8:
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_0092_D36R0101_1EB4:
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_0092_D36R0101_1EC0:
	.short 15, 1
	.short 12, 2
	.short 34, 1
	.short 254, 0

scr_seq_0092_D36R0101_1ED0:
	.short 33, 1
	.short 254, 0

scr_seq_0092_D36R0101_1ED8:
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_0092_D36R0101_1EE4:
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_0092_D36R0101_1EF0:
	.short 34, 1
	.short 254, 0

scr_seq_0092_D36R0101_1EF8:
	.short 35, 1
	.short 254, 0

scr_seq_0092_D36R0101_1F00:
	.short 33, 1
	.short 254, 0
scr_seq_0092_D36R0101_1F08:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4008, 1
	call scr_seq_0092_D36R0101_1987
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, scr_seq_0092_D36R0101_1F35
	call scr_seq_0092_D36R0101_1F3F
	goto scr_seq_0092_D36R0101_1F3B

scr_seq_0092_D36R0101_1F35:
	call scr_seq_0092_D36R0101_1AFB
scr_seq_0092_D36R0101_1F3B:
	releaseall
	end

scr_seq_0092_D36R0101_1F3F:
	npc_msg 55
	waitbutton
	closemsg
	return

scr_seq_0092_D36R0101_1F48:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	apply_movement 253, scr_seq_0092_D36R0101_2038
	wait_movement
	fade_out_bgm 0, 30
	callstd std_play_friend_music
	scrcmd_746
	clearflag FLAG_UNK_310
	scrcmd_100 16
	scrcmd_100 17
	apply_movement 16, scr_seq_0092_D36R0101_2054
	apply_movement 17, scr_seq_0092_D36R0101_2060
	wait_movement
	apply_movement 255, scr_seq_0092_D36R0101_200C
	wait_movement
	buffer_players_name 0
	gender_msgbox 57, 56
	closemsg
	callstd 2030
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	fade_screen 6, 6, 0, 32767
	wait_fade
	wait 15, VAR_SPECIAL_x800C
	fade_screen 6, 6, 1, 32767
	wait_fade
	apply_movement 255, scr_seq_0092_D36R0101_2014
	apply_movement 16, scr_seq_0092_D36R0101_208C
	wait_movement
	gender_msgbox 59, 58
	closemsg
	play_se SEQ_SE_GS_TIMESLIP
	scrcmd_810
	setvar VAR_UNK_40FE, 1
	clearflag FLAG_UNK_301
	clearflag FLAG_UNK_302
	setflag FLAG_UNK_310
	scrcmd_176 27, 0, 954, 280, 1
	fade_screen 6, 15, 1, 32767
	wait_fade
	releaseall
	end

scr_seq_0092_D36R0101_2009:
	.byte 0x00, 0x00, 0x00

scr_seq_0092_D36R0101_200C:
	.short 34, 1
	.short 254, 0

scr_seq_0092_D36R0101_2014:
	.short 75, 1
	.short 63, 1
	.short 32, 1
	.short 63, 1
	.short 34, 1
	.short 63, 1
	.short 33, 1
	.short 63, 1
	.short 254, 0

scr_seq_0092_D36R0101_2038:
	.short 1, 1
	.short 1, 1
	.short 57, 1
	.short 71, 1
	.short 52, 1
	.short 71, 1
	.short 254, 0

scr_seq_0092_D36R0101_2054:
	.short 13, 11
	.short 15, 2
	.short 254, 0

scr_seq_0092_D36R0101_2060:
	.short 13, 8
	.short 35, 1
	.short 15, 1
	.short 71, 1
	.short 13, 1
	.short 63, 1
	.short 72, 1
	.short 34, 1
	.short 63, 1
	.short 14, 1
	.short 254, 0

scr_seq_0092_D36R0101_208C:
	.short 65, 1
	.short 15, 2
	.short 12, 2
	.short 35, 1
	.short 254, 0
scr_seq_0092_D36R0101_20A0:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 16, scr_seq_0092_D36R0101_2148
	apply_movement 255, scr_seq_0092_D36R0101_21F4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	gender_msgbox 61, 60
	closemsg
	apply_movement 17, scr_seq_0092_D36R0101_2170
	wait_movement
	callstd std_play_friend_music
	apply_movement 16, scr_seq_0092_D36R0101_215C
	wait_movement
	gender_msgbox 63, 62
	closemsg
	apply_movement 16, scr_seq_0092_D36R0101_218C
	wait_movement
	gender_msgbox 65, 64
	closemsg
	apply_movement 16, scr_seq_0092_D36R0101_219C
	apply_movement 17, scr_seq_0092_D36R0101_21A4
	wait_movement
	buffer_players_name 0
	gender_msgbox 67, 66
	closemsg
	apply_movement 16, scr_seq_0092_D36R0101_21AC
	apply_movement 17, scr_seq_0092_D36R0101_21C4
	wait_movement
	callstd 2030
	scrcmd_747
	setvar VAR_UNK_40FE, 5
	hide_person 16
	hide_person 17
	setflag FLAG_UNK_310
	releaseall
	end

scr_seq_0092_D36R0101_2147:
	.byte 0x00

scr_seq_0092_D36R0101_2148:
	.short 34, 1
	.short 63, 1
	.short 35, 1
	.short 63, 1
	.short 254, 0

scr_seq_0092_D36R0101_215C:
	.short 34, 1
	.short 75, 1
	.short 63, 1
	.short 34, 1
	.short 254, 0

scr_seq_0092_D36R0101_2170:
	.short 63, 1
	.short 51, 2
	.short 71, 1
	.short 52, 1
	.short 53, 1
	.short 72, 1
	.short 254, 0

scr_seq_0092_D36R0101_218C:
	.short 14, 3
	.short 65, 1
	.short 50, 2
	.short 254, 0

scr_seq_0092_D36R0101_219C:
	.short 15, 3
	.short 254, 0

scr_seq_0092_D36R0101_21A4:
	.short 15, 3
	.short 254, 0

scr_seq_0092_D36R0101_21AC:
	.short 14, 4
	.short 12, 6
	.short 33, 1
	.short 63, 6
	.short 12, 5
	.short 254, 0

scr_seq_0092_D36R0101_21C4:
	.short 71, 1
	.short 53, 1
	.short 72, 1
	.short 32, 1
	.short 14, 3
	.short 63, 1
	.short 35, 1
	.short 63, 4
	.short 32, 1
	.short 48, 1
	.short 12, 10
	.short 254, 0

scr_seq_0092_D36R0101_21F4:
	.short 13, 1
	.short 63, 1
	.short 254, 0
scr_seq_0092_D36R0101_2200:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 27, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
