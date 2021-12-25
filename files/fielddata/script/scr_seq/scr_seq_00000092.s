#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000092_0000005E ; 000
	scrdef scr_seq_00000092_000001A3 ; 001
	scrdef scr_seq_00000092_00000EE8 ; 002
	scrdef scr_seq_00000092_0000048A ; 003
	scrdef scr_seq_00000092_00000597 ; 004
	scrdef scr_seq_00000092_000006A8 ; 005
	scrdef scr_seq_00000092_000009FA ; 006
	scrdef scr_seq_00000092_00000AF0 ; 007
	scrdef scr_seq_00000092_00000BE6 ; 008
	scrdef scr_seq_00000092_00000CD0 ; 009
	scrdef scr_seq_00000092_000010F3 ; 010
	scrdef scr_seq_00000092_000011A0 ; 011
	scrdef scr_seq_00000092_00001768 ; 012
	scrdef scr_seq_00000092_00002200 ; 013
	scrdef scr_seq_00000092_000012D3 ; 014
	scrdef scr_seq_00000092_00001304 ; 015
	scrdef scr_seq_00000092_00000E68 ; 016
	scrdef scr_seq_00000092_00001165 ; 017
	scrdef scr_seq_00000092_000015AC ; 018
	scrdef scr_seq_00000092_00001B1B ; 019
	scrdef scr_seq_00000092_00001F08 ; 020
	scrdef scr_seq_00000092_00000153 ; 021
	scrdef scr_seq_00000092_000020A0 ; 022
	scrdef_end

scr_seq_00000092_0000005E:
	scrcmd_144 16416
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000092_00000077
	clearflag FLAG_UNK_189
	goto scr_seq_00000092_000000C3

scr_seq_00000092_00000077:
	scrcmd_294 2, VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000092_000000B5
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif eq, scr_seq_00000092_000000BF
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif eq, scr_seq_00000092_000000BF
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif eq, scr_seq_00000092_000000BF
scr_seq_00000092_000000B5:
	setflag FLAG_UNK_27E
	goto scr_seq_00000092_000000C3

scr_seq_00000092_000000BF:
	clearflag FLAG_UNK_27E
scr_seq_00000092_000000C3:
	checkflag FLAG_UNK_07B
	gotoif eq, scr_seq_00000092_000000D0
	end

scr_seq_00000092_000000D0:
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
	gotoif eq, scr_seq_00000092_00000124
	checkflag FLAG_UNK_07E
	gotoif eq, scr_seq_00000092_00000145
	end

scr_seq_00000092_00000124:
	checkflag FLAG_UNK_07E
	gotoif eq, scr_seq_00000092_00000137
	setvar VAR_UNK_4099, 2
	end

scr_seq_00000092_00000137:
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409E, 2
	end

scr_seq_00000092_00000145:
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409E, 2
	end

scr_seq_00000092_00000153:
	comparevartovalue VAR_UNK_412B, 1
	callif eq, scr_seq_00000092_0000016F
	comparevartovalue VAR_UNK_40FE, 4
	callif eq, scr_seq_00000092_00000189
	end

scr_seq_00000092_0000016F:
	show_person_at 15, 15, 0, 58, 1
	show_person_at 14, 15, 0, 59, 3
	return

scr_seq_00000092_00000189:
	show_person_at 16, 15, 0, 58, 1
	show_person_at 17, 11, 0, 58, 3
	return

scr_seq_00000092_000001A3:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 25
	gotoif ne, scr_seq_00000092_000001C4
	goto scr_seq_00000092_000001D7

scr_seq_00000092_000001BE:
	.byte 0x16, 0x00
	.byte 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_000001C4:
	comparevartovalue VAR_TEMP_x4000, 32
	gotoif ne, scr_seq_00000092_000001D7
	goto scr_seq_00000092_0000020B

scr_seq_00000092_000001D7:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 52
	gotoif ne, scr_seq_00000092_000001F8
	goto scr_seq_00000092_00000245

scr_seq_00000092_000001F2:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_000001F8:
	comparevartovalue VAR_TEMP_x4001, 62
	gotoif ne, scr_seq_00000092_0000020B
	goto scr_seq_00000092_00000299

scr_seq_00000092_0000020B:
	setvar VAR_TEMP_x4002, 0
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 52
	gotoif ne, scr_seq_00000092_00000232
	goto scr_seq_00000092_000003CA

scr_seq_00000092_0000022C:
	.byte 0x16, 0x00, 0x13, 0x00
	.byte 0x00, 0x00
scr_seq_00000092_00000232:
	comparevartovalue VAR_TEMP_x4001, 62
	gotoif ne, scr_seq_00000092_00000245
	goto scr_seq_00000092_0000042A

scr_seq_00000092_00000245:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4002, 0
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000092_00000272
	apply_movement 0, scr_seq_00000092_00000E18
	goto scr_seq_00000092_00000293

scr_seq_00000092_00000272:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000092_00000293
	apply_movement 0, scr_seq_00000092_00000E08
	setvar VAR_UNK_409B, 1
	setvar VAR_UNK_4099, 1
scr_seq_00000092_00000293:
	wait_movement
	releaseall
	end

scr_seq_00000092_00000299:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000092_000002B6
	goto scr_seq_00000092_000002C9

scr_seq_00000092_000002B0:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_000002B6:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000092_000002C9
	goto scr_seq_00000092_00000301

scr_seq_00000092_000002C9:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	apply_movement 0, scr_seq_00000092_00000DF8
	wait_movement
	checkflag FLAG_UNK_126
	gotoif eq, scr_seq_00000092_000002FD
	msgbox 36
	waitbutton
	closemsg
	setflag FLAG_UNK_126
scr_seq_00000092_000002FD:
	releaseall
	end

scr_seq_00000092_00000301:
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_00000092_00000346
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	apply_movement 0, scr_seq_00000092_00000E18
	wait_movement
	checkflag FLAG_UNK_126
	gotoif eq, scr_seq_00000092_00000342
	msgbox 36
	waitbutton
	closemsg
	setflag FLAG_UNK_126
scr_seq_00000092_00000342:
	releaseall
	end

scr_seq_00000092_00000346:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_076 83, 0
	msgbox 3
	closemsg
	apply_movement 0, scr_seq_00000092_00000E58
	wait_movement
	hide_person 0
	msgbox 37
	waitbutton
	closemsg
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	setflag FLAG_UNK_1A7
	setflag FLAG_UNK_07D
	checkflag FLAG_UNK_07E
	gotoif eq, scr_seq_00000092_00001207
	clearflag FLAG_UNK_1D3
	wait 20, VAR_SPECIAL_x8004
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 117, 0, 15, 65, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	wait 5, VAR_SPECIAL_x8004
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000092_000003CA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000092_00000403
	apply_movement 0, scr_seq_00000092_00000E08
	setvar VAR_UNK_409B, 1
	setvar VAR_UNK_4099, 1
	setvar VAR_TEMP_x4004, 1
	goto scr_seq_00000092_00000424

scr_seq_00000092_00000403:
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000092_00000424
	apply_movement 0, scr_seq_00000092_00000E28
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
scr_seq_00000092_00000424:
	wait_movement
	releaseall
	end

scr_seq_00000092_0000042A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4004, 0
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000092_00000463
	apply_movement 0, scr_seq_00000092_00000DF8
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	goto scr_seq_00000092_00000484

scr_seq_00000092_00000463:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000092_00000484
	apply_movement 0, scr_seq_00000092_00000E28
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409B, 2
scr_seq_00000092_00000484:
	wait_movement
	releaseall
	end

scr_seq_00000092_0000048A:
	scrcmd_609
	lockall
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, scr_seq_00000092_0000068E
	setvar VAR_TEMP_x4002, 1
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 1
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 25
	gotoif ne, scr_seq_00000092_000004CE
	goto scr_seq_00000092_000004E1

scr_seq_00000092_000004C8:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_000004CE:
	comparevartovalue VAR_TEMP_x4000, 32
	gotoif ne, scr_seq_00000092_000004E1
	goto scr_seq_00000092_00000515

scr_seq_00000092_000004E1:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 52
	gotoif ne, scr_seq_00000092_00000502
	goto scr_seq_00000092_00000549

scr_seq_00000092_000004FC:
	.byte 0x16, 0x00, 0x13, 0x00
	.byte 0x00, 0x00
scr_seq_00000092_00000502:
	comparevartovalue VAR_TEMP_x4001, 62
	gotoif ne, scr_seq_00000092_00000515
	goto scr_seq_00000092_00000557

scr_seq_00000092_00000515:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 52
	gotoif ne, scr_seq_00000092_00000536
	goto scr_seq_00000092_0000057B

scr_seq_00000092_00000530:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_00000536:
	comparevartovalue VAR_TEMP_x4001, 62
	gotoif ne, scr_seq_00000092_00000549
	goto scr_seq_00000092_00000589

scr_seq_00000092_00000549:
	apply_movement 0, scr_seq_00000092_00000DC8
	wait_movement
	releaseall
	end

scr_seq_00000092_00000557:
	apply_movement 0, scr_seq_00000092_00000DC8
	wait_movement
	checkflag FLAG_UNK_125
	gotoif eq, scr_seq_00000092_00000577
	msgbox 35
	waitbutton
	closemsg
	setflag FLAG_UNK_125
scr_seq_00000092_00000577:
	releaseall
	end

scr_seq_00000092_0000057B:
	apply_movement 0, scr_seq_00000092_00000DC8
	wait_movement
	releaseall
	end

scr_seq_00000092_00000589:
	apply_movement 0, scr_seq_00000092_00000DE0
	wait_movement
	releaseall
	end

scr_seq_00000092_00000597:
	scrcmd_609
	lockall
	comparevartovalue VAR_TEMP_x4004, 1
	gotoif eq, scr_seq_00000092_0000068E
	setvar VAR_UNK_4099, 1
	setvar VAR_UNK_409B, 2
	setvar VAR_TEMP_x4002, 0
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 25
	gotoif ne, scr_seq_00000092_000005DB
	goto scr_seq_00000092_000005EE

scr_seq_00000092_000005D5:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_000005DB:
	comparevartovalue VAR_TEMP_x4000, 32
	gotoif ne, scr_seq_00000092_000005EE
	goto scr_seq_00000092_00000622

scr_seq_00000092_000005EE:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 52
	gotoif ne, scr_seq_00000092_0000060F
	goto scr_seq_00000092_00000656

scr_seq_00000092_00000609:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_0000060F:
	comparevartovalue VAR_TEMP_x4001, 62
	gotoif ne, scr_seq_00000092_00000622
	goto scr_seq_00000092_00000664

scr_seq_00000092_00000622:
	get_person_coords 0, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 52
	gotoif ne, scr_seq_00000092_00000643
	goto scr_seq_00000092_00000672

scr_seq_00000092_0000063D:
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
scr_seq_00000092_00000643:
	comparevartovalue VAR_TEMP_x4001, 62
	gotoif ne, scr_seq_00000092_00000656
	goto scr_seq_00000092_00000680

scr_seq_00000092_00000656:
	apply_movement 0, scr_seq_00000092_00000DC8
	wait_movement
	releaseall
	end

scr_seq_00000092_00000664:
	apply_movement 0, scr_seq_00000092_00000DEC
	wait_movement
	releaseall
	end

scr_seq_00000092_00000672:
	apply_movement 0, scr_seq_00000092_00000DC8
	wait_movement
	releaseall
	end

scr_seq_00000092_00000680:
	apply_movement 0, scr_seq_00000092_00000DE0
	wait_movement
	releaseall
	end

scr_seq_00000092_0000068E:
	setvar VAR_UNK_4099, 2
	setvar VAR_UNK_409B, 2
	apply_movement 0, scr_seq_00000092_00000DE0
	wait_movement
	releaseall
	end

scr_seq_00000092_000006A8:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_00000092_000006C9
	goto scr_seq_00000092_000006DC

scr_seq_00000092_000006C3:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_000006C9:
	comparevartovalue VAR_TEMP_x4000, 49
	gotoif ne, scr_seq_00000092_000006DC
	goto scr_seq_00000092_00000716

scr_seq_00000092_000006DC:
	setvar VAR_TEMP_x4003, 0
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_00000092_00000703
	goto scr_seq_00000092_0000074A

scr_seq_00000092_000006FD:
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
scr_seq_00000092_00000703:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_00000092_00000716
	goto scr_seq_00000092_000007D4

scr_seq_00000092_00000716:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_00000092_00000737
	goto scr_seq_00000092_00000846

scr_seq_00000092_00000731:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_00000737:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_00000092_0000074A
	goto scr_seq_00000092_00000982

scr_seq_00000092_0000074A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000092_0000078B
	apply_movement 2, scr_seq_00000092_00000E38
	wait_movement
	setvar VAR_UNK_409A, 1
	setvar VAR_UNK_409C, 1
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
	goto scr_seq_00000092_000007BA

scr_seq_00000092_0000078B:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000092_000007BA
	apply_movement 2, scr_seq_00000092_00000E08
	wait_movement
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 1
	setvar VAR_UNK_409E, 2
scr_seq_00000092_000007BA:
	checkflag FLAG_UNK_126
	gotoif eq, scr_seq_00000092_000007D0
	msgbox 36
	waitbutton
	closemsg
	setflag FLAG_UNK_126
scr_seq_00000092_000007D0:
	releaseall
	end

scr_seq_00000092_000007D4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000092_00000813
	apply_movement 2, scr_seq_00000092_00000E38
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
	goto scr_seq_00000092_00000840

scr_seq_00000092_00000813:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000092_00000840
	apply_movement 2, scr_seq_00000092_00000DF8
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
scr_seq_00000092_00000840:
	wait_movement
	releaseall
	end

scr_seq_00000092_00000846:
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000092_00000863
	goto scr_seq_00000092_00000876

scr_seq_00000092_0000085D:
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
scr_seq_00000092_00000863:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000092_00000876
	goto scr_seq_00000092_000008A4

scr_seq_00000092_00000876:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
	apply_movement 2, scr_seq_00000092_00000E48
	wait_movement
	releaseall
	end

scr_seq_00000092_000008A4:
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif eq, scr_seq_00000092_000008DF
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 1
	setvar VAR_UNK_409E, 2
	apply_movement 2, scr_seq_00000092_00000E08
	wait_movement
	releaseall
	end

scr_seq_00000092_000008DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	scrcmd_076 83, 0
	msgbox 3
	closemsg
	apply_movement 2, scr_seq_00000092_00000E60
	wait_movement
	hide_person 2
	msgbox 37
	waitbutton
	closemsg
	checkflag FLAG_UNK_07D
	callif lt, scr_seq_00000092_0000097A
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
	setflag FLAG_UNK_1A8
	setflag FLAG_UNK_07E
	checkflag FLAG_UNK_07D
	gotoif eq, scr_seq_00000092_00001207
	clearflag FLAG_UNK_1D3
	wait 20, VAR_SPECIAL_x8004
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 117, 0, 15, 65, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	wait 5, VAR_SPECIAL_x8004
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000092_0000097A:
	setvar VAR_UNK_4099, 1
	return

scr_seq_00000092_00000982:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4003, 0
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000092_000009C7
	apply_movement 2, scr_seq_00000092_00000DF8
	setvar VAR_UNK_409A, 1
	setvar VAR_UNK_409C, 1
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
	goto scr_seq_00000092_000009F4

scr_seq_00000092_000009C7:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000092_000009F4
	apply_movement 2, scr_seq_00000092_00000E48
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 2
scr_seq_00000092_000009F4:
	wait_movement
	releaseall
	end

scr_seq_00000092_000009FA:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4003, 0
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_00000092_00000A25
	goto scr_seq_00000092_00000A38

scr_seq_00000092_00000A1F:
	.byte 0x16
	.byte 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_00000A25:
	comparevartovalue VAR_TEMP_x4000, 49
	gotoif ne, scr_seq_00000092_00000A38
	goto scr_seq_00000092_00000A6C

scr_seq_00000092_00000A38:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_00000092_00000A59
	goto scr_seq_00000092_00000AA0

scr_seq_00000092_00000A53:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_00000A59:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_00000092_00000A6C
	goto scr_seq_00000092_00000AAE

scr_seq_00000092_00000A6C:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_00000092_00000A8D
	goto scr_seq_00000092_00000ABC

scr_seq_00000092_00000A87:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_00000A8D:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_00000092_00000AA0
	goto scr_seq_00000092_00000AE2

scr_seq_00000092_00000AA0:
	apply_movement 2, scr_seq_00000092_00000DEC
	wait_movement
	releaseall
	end

scr_seq_00000092_00000AAE:
	apply_movement 2, scr_seq_00000092_00000DD4
	wait_movement
	releaseall
	end

scr_seq_00000092_00000ABC:
	setvar VAR_UNK_409A, 2
	setvar VAR_UNK_409C, 1
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
	apply_movement 2, scr_seq_00000092_00000DD4
	wait_movement
	releaseall
	end

scr_seq_00000092_00000AE2:
	apply_movement 2, scr_seq_00000092_00000DD4
	wait_movement
	releaseall
	end

scr_seq_00000092_00000AF0:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4003, 1
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_00000092_00000B1B
	goto scr_seq_00000092_00000B2E

scr_seq_00000092_00000B15:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_00000B1B:
	comparevartovalue VAR_TEMP_x4000, 49
	gotoif ne, scr_seq_00000092_00000B2E
	goto scr_seq_00000092_00000B62

scr_seq_00000092_00000B2E:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_00000092_00000B4F
	goto scr_seq_00000092_00000B96

scr_seq_00000092_00000B49:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_00000B4F:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_00000092_00000B62
	goto scr_seq_00000092_00000BA4

scr_seq_00000092_00000B62:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_00000092_00000B83
	goto scr_seq_00000092_00000BB2

scr_seq_00000092_00000B7D:
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
scr_seq_00000092_00000B83:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_00000092_00000B96
	goto scr_seq_00000092_00000BD8

scr_seq_00000092_00000B96:
	apply_movement 2, scr_seq_00000092_00000DEC
	wait_movement
	releaseall
	end

scr_seq_00000092_00000BA4:
	apply_movement 2, scr_seq_00000092_00000DEC
	wait_movement
	releaseall
	end

scr_seq_00000092_00000BB2:
	setvar VAR_UNK_409A, 1
	setvar VAR_UNK_409C, 2
	setvar VAR_UNK_409D, 2
	setvar VAR_UNK_409E, 1
	apply_movement 2, scr_seq_00000092_00000DEC
	wait_movement
	releaseall
	end

scr_seq_00000092_00000BD8:
	apply_movement 2, scr_seq_00000092_00000DD4
	wait_movement
	releaseall
	end

scr_seq_00000092_00000BE6:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4003, 0
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_00000092_00000C11
	goto scr_seq_00000092_00000C24

scr_seq_00000092_00000C0B:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00
	.byte 0x00
scr_seq_00000092_00000C11:
	comparevartovalue VAR_TEMP_x4000, 49
	gotoif ne, scr_seq_00000092_00000C24
	goto scr_seq_00000092_00000C58

scr_seq_00000092_00000C24:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_00000092_00000C45
	goto scr_seq_00000092_00000C8C

scr_seq_00000092_00000C3F:
	.byte 0x16
	.byte 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_00000C45:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_00000092_00000C58
	goto scr_seq_00000092_00000C9A

scr_seq_00000092_00000C58:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_00000092_00000C79
	goto scr_seq_00000092_00000CAE

scr_seq_00000092_00000C73:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_00000C79:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_00000092_00000C8C
	goto scr_seq_00000092_00000CBC

scr_seq_00000092_00000C8C:
	apply_movement 2, scr_seq_00000092_00000DC8
	wait_movement
	releaseall
	end

scr_seq_00000092_00000C9A:
	setvar VAR_UNK_409D, 2
	apply_movement 2, scr_seq_00000092_00000DEC
	wait_movement
	releaseall
	end

scr_seq_00000092_00000CAE:
	apply_movement 2, scr_seq_00000092_00000DC8
	wait_movement
	releaseall
	end

scr_seq_00000092_00000CBC:
	setvar VAR_UNK_409D, 2
	apply_movement 2, scr_seq_00000092_00000DE0
	wait_movement
	releaseall
	end

scr_seq_00000092_00000CD0:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4003, 0
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 41
	gotoif ne, scr_seq_00000092_00000CFB
	goto scr_seq_00000092_00000D0E

scr_seq_00000092_00000CF5:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_00000CFB:
	comparevartovalue VAR_TEMP_x4000, 49
	gotoif ne, scr_seq_00000092_00000D0E
	goto scr_seq_00000092_00000D42

scr_seq_00000092_00000D0E:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_00000092_00000D2F
	goto scr_seq_00000092_00000D76

scr_seq_00000092_00000D29:
	.byte 0x16, 0x00, 0x13, 0x00, 0x00, 0x00
scr_seq_00000092_00000D2F:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_00000092_00000D42
	goto scr_seq_00000092_00000D8A

scr_seq_00000092_00000D42:
	get_person_coords 2, VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 54
	gotoif ne, scr_seq_00000092_00000D63
	goto scr_seq_00000092_00000D98

scr_seq_00000092_00000D5D:
	.byte 0x16, 0x00, 0x13
	.byte 0x00, 0x00, 0x00
scr_seq_00000092_00000D63:
	comparevartovalue VAR_TEMP_x4001, 64
	gotoif ne, scr_seq_00000092_00000D76
	goto scr_seq_00000092_00000DB8

scr_seq_00000092_00000D76:
	setvar VAR_UNK_409E, 2
	apply_movement 2, scr_seq_00000092_00000DEC
	wait_movement
	releaseall
	end

scr_seq_00000092_00000D8A:
	apply_movement 2, scr_seq_00000092_00000DD4
	wait_movement
	releaseall
	end

scr_seq_00000092_00000D98:
	setvar VAR_UNK_409A, 1
	setvar VAR_UNK_409C, 1
	setvar VAR_UNK_409E, 2
	apply_movement 2, scr_seq_00000092_00000DE0
	wait_movement
	releaseall
	end

scr_seq_00000092_00000DB8:
	apply_movement 2, scr_seq_00000092_00000DD4
	wait_movement
	releaseall
	end

scr_seq_00000092_00000DC6:
	.byte 0x00, 0x00

scr_seq_00000092_00000DC8:
	.short 1, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000092_00000DD4:
	.short 0, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000092_00000DE0:
	.short 2, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000092_00000DEC:
	.short 3, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000092_00000DF8:
	.short 75, 1
	.short 16, 10
	.short 1, 1
	.short 254, 0

scr_seq_00000092_00000E08:
	.short 75, 1
	.short 17, 10
	.short 0, 1
	.short 254, 0

scr_seq_00000092_00000E18:
	.short 75, 1
	.short 19, 7
	.short 2, 1
	.short 254, 0

scr_seq_00000092_00000E28:
	.short 75, 1
	.short 18, 7
	.short 3, 1
	.short 254, 0

scr_seq_00000092_00000E38:
	.short 75, 1
	.short 19, 8
	.short 2, 1
	.short 254, 0

scr_seq_00000092_00000E48:
	.short 75, 1
	.short 18, 8
	.short 3, 1
	.short 254, 0

scr_seq_00000092_00000E58:
	.short 37, 5
	.short 254, 0

scr_seq_00000092_00000E60:
	.short 39, 5
	.short 254, 0
scr_seq_00000092_00000E68:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000092_00000EC4
	wait_movement
	apply_movement 1, scr_seq_00000092_00000ED0
	wait_movement
	play_se SEQ_SE_DP_KI_GASYAN
	scrcmd_561 0, 2, 10, 5
	apply_movement 1, scr_seq_00000092_00000ED8
	wait_movement
	apply_movement 1, scr_seq_00000092_00000ED0
	wait_movement
	play_se SEQ_SE_DP_KI_GASYAN
	scrcmd_561 0, 2, 10, 5
	apply_movement 1, scr_seq_00000092_00000ED8
	wait_movement
	setvar VAR_UNK_40EA, 1
	releaseall
	end


scr_seq_00000092_00000EC4:
	.short 75, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000092_00000ED0:
	.short 52, 1
	.short 254, 0

scr_seq_00000092_00000ED8:
	.short 71, 1
	.short 9, 1
	.short 72, 1
	.short 254, 0
scr_seq_00000092_00000EE8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 11
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000092_00001086
	msgbox 14
	closemsg
scr_seq_00000092_00000F0B:
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_349
	scrcmd_351 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000092_00001093
	get_partymon_species VAR_SPECIAL_x800C, VAR_SPECIAL_x8005
	setorcopyvar VAR_SPECIAL_x8006, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x8005, 0
	gotoif eq, scr_seq_00000092_000010A0
	scrcmd_140 32780, 29, 32774
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000092_000010E1
	scrcmd_656 32774, 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000092_00000F84
	msgbox 16
	closemsg
	goto scr_seq_00000092_00000F0B

scr_seq_00000092_00000F84:
	scrcmd_396 32770, 32774
	comparevartovalue VAR_SPECIAL_x8002, 3
	gotoif le, scr_seq_00000092_00001041
	scrcmd_746
scr_seq_00000092_00000F99:
	bufferpartymonnick 0, VAR_SPECIAL_x8006
	msgbox 17
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000092_000010C7
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_352 1, 32774, 29
	scrcmd_353 1, 32769
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x8001, 4
	gotoif eq, scr_seq_00000092_000010AB
	scrcmd_399 1, 32774, 32769
	msgbox 18
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000092_000010C7
	scrcmd_139 32774, 32769, 29
	msgbox 20
	play_se SEQ_SE_DP_KON
	wait_se SEQ_SE_DP_KON
	wait 30, VAR_SPECIAL_x800C
	msgbox 24
	wait 32, VAR_SPECIAL_x800C
	msgbox 25
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	wait 16, VAR_SPECIAL_x800C
	scrcmd_076 32773, 0
	goto scr_seq_00000092_00001079

scr_seq_00000092_00001041:
	bufferpartymonnick 0, VAR_SPECIAL_x8006
	scrcmd_139 32774, 32770, 29
	msgbox 21
	wait 30, VAR_SPECIAL_x800C
	msgbox 26
	play_fanfare SEQ_ME_LVUP
	wait_fanfare
	wait 32, VAR_SPECIAL_x800C
	scrcmd_076 32773, 0
	msgbox 22
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000092_00001079:
	msgbox 22
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000092_00001086:
	msgbox 13
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000092_00001093:
	msgbox 13
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000092_000010A0:
	msgbox 15
	closemsg
	goto scr_seq_00000092_00000F0B

scr_seq_00000092_000010AB:
	msgbox 19
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000092_00000F99
	goto scr_seq_00000092_00001086

scr_seq_00000092_000010C7:
	msgbox 19
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000092_00000F99
	goto scr_seq_00000092_00001086

scr_seq_00000092_000010E1:
	scrcmd_193 0, 32774
	msgbox 23
	closemsg
	goto scr_seq_00000092_00000F0B

scr_seq_00000092_000010F1:
	.byte 0x02, 0x00
scr_seq_00000092_000010F3:
	checkflag FLAG_UNK_07D
	gotoif eq, scr_seq_00000092_00001104
	goto scr_seq_00000092_00001115

scr_seq_00000092_00001104:
	checkflag FLAG_UNK_07E
	gotoif eq, scr_seq_00000092_00001126
	goto scr_seq_00000092_00001139

scr_seq_00000092_00001115:
	checkflag FLAG_UNK_07E
	gotoif eq, scr_seq_00000092_00001139
	goto scr_seq_00000092_0000114C

scr_seq_00000092_00001126:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000092_00001139:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000092_0000114C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	setvar VAR_UNK_40F4, 0
	releaseall
	end

scr_seq_00000092_00001165:
	scrcmd_609
	lockall
	apply_movement 3, scr_seq_00000092_0000118C
	apply_movement 255, scr_seq_00000092_00001194
	wait_movement
	msgbox 0
	waitbutton
	closemsg
	setvar VAR_UNK_40F4, 0
	releaseall
	end


scr_seq_00000092_0000118C:
	.short 75, 1
	.short 254, 0

scr_seq_00000092_00001194:
	.short 63, 2
	.short 0, 1
	.short 254, 0
scr_seq_00000092_000011A0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_080
	gotoif eq, scr_seq_00000092_000011F2
	msgbox 6
	setvar VAR_SPECIAL_x8004, 420
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000092_000011FD
	callstd 2033
	setflag FLAG_UNK_080
	clearflag FLAG_UNK_1AE
	clearflag FLAG_UNK_1AC
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000092_000011F2:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000092_000011FD:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000092_00001207:
	clearflag FLAG_UNK_1AF
	scrcmd_100 4
	clearflag FLAG_UNK_1D4
	wait 20, VAR_SPECIAL_x8004
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 117, 0, 15, 65, 0
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	wait 5, VAR_SPECIAL_x8004
	msgbox 2
	waitbutton
	closemsg
	apply_movement 4, scr_seq_00000092_000012EC
	apply_movement 255, scr_seq_00000092_000012F8
	wait_movement
	checkflag FLAG_UNK_080
	gotoif eq, scr_seq_00000092_000012BE
	msgbox 6
	setvar VAR_SPECIAL_x8004, 420
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000092_000012C9
	callstd 2033
	setflag FLAG_UNK_1AF
	setflag FLAG_UNK_1AD
	setflag FLAG_UNK_1A7
	setflag FLAG_UNK_1A8
	setflag FLAG_UNK_1D3
	setflag FLAG_UNK_1D4
	setflag FLAG_UNK_080
	clearflag FLAG_UNK_1AE
	clearflag FLAG_UNK_1AC
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000092_000012BE:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000092_000012C9:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000092_000012D3:
	scrcmd_076 83, 0
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000092_000012EC:
	.short 12, 10
	.short 15, 3
	.short 254, 0

scr_seq_00000092_000012F8:
	.short 63, 12
	.short 2, 1
	.short 254, 0
scr_seq_00000092_00001304:
	scrcmd_609
	lockall
	callstd 2067
	apply_movement 12, scr_seq_00000092_00001478
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8004, 40
	gotoif ne, scr_seq_00000092_00001337
	apply_movement 12, scr_seq_00000092_00001484
	goto scr_seq_00000092_0000133F

scr_seq_00000092_00001337:
	apply_movement 12, scr_seq_00000092_00001494
scr_seq_00000092_0000133F:
	wait_movement
	msgbox 29
	closemsg
	apply_movement 12, scr_seq_00000092_000014A4
	wait_movement
	msgbox 30
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000092_00001371
	msgbox 31
	goto scr_seq_00000092_00001374

scr_seq_00000092_00001371:
	msgbox 32
scr_seq_00000092_00001374:
	closemsg
	scrcmd_529 VAR_TEMP_x4000
	get_partymon_species VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 50
	gotoif eq, scr_seq_00000092_000013D5
	comparevartovalue VAR_TEMP_x4001, 51
	gotoif eq, scr_seq_00000092_000013D5
	scrcmd_099 253
	comparevartovalue VAR_SPECIAL_x8004, 40
	gotoif ne, scr_seq_00000092_000013C1
	apply_movement 255, scr_seq_00000092_000014E8
	apply_movement 253, scr_seq_00000092_000014FC
	goto scr_seq_00000092_000013C9

scr_seq_00000092_000013C1:
	apply_movement 253, scr_seq_00000092_00001518
scr_seq_00000092_000013C9:
	wait_movement
	scrcmd_098 253
	goto scr_seq_00000092_0000140A

scr_seq_00000092_000013D5:
	scrcmd_099 253
	comparevartovalue VAR_SPECIAL_x8004, 40
	gotoif ne, scr_seq_00000092_000013FC
	apply_movement 255, scr_seq_00000092_000014E8
	apply_movement 253, scr_seq_00000092_00001538
	goto scr_seq_00000092_00001404

scr_seq_00000092_000013FC:
	apply_movement 253, scr_seq_00000092_00001550
scr_seq_00000092_00001404:
	wait_movement
	scrcmd_098 253
scr_seq_00000092_0000140A:
	comparevartovalue VAR_SPECIAL_x8004, 40
	gotoif ne, scr_seq_00000092_00001425
	apply_movement 12, scr_seq_00000092_0000156C
	goto scr_seq_00000092_0000142D

scr_seq_00000092_00001425:
	apply_movement 12, scr_seq_00000092_00001574
scr_seq_00000092_0000142D:
	wait_movement
	msgbox 33
	closemsg
	apply_movement 12, scr_seq_00000092_0000157C
	wait_movement
	msgbox 34
	closemsg
	apply_movement 12, scr_seq_00000092_0000159C
	wait_movement
	hide_person 12
	setflag FLAG_UNK_23D
	callstd 2068
	scrcmd_099 253
	apply_movement 253, scr_seq_00000092_00001584
	wait_movement
	scrcmd_098 253
	releaseall
	setvar VAR_UNK_40E9, 1
	end

scr_seq_00000092_00001475:
	.byte 0x00, 0x00, 0x00

scr_seq_00000092_00001478:
	.short 75, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000092_00001484:
	.short 13, 1
	.short 15, 2
	.short 13, 1
	.short 254, 0

scr_seq_00000092_00001494:
	.short 13, 1
	.short 15, 3
	.short 13, 1
	.short 254, 0

scr_seq_00000092_000014A4:
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

scr_seq_00000092_000014E8:
	.short 2, 1
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000092_000014FC:
	.short 12, 2
	.short 14, 1
	.short 12, 2
	.short 14, 3
	.short 35, 1
	.short 51, 3
	.short 254, 0

scr_seq_00000092_00001518:
	.short 14, 1
	.short 12, 2
	.short 14, 1
	.short 12, 2
	.short 14, 3
	.short 35, 1
	.short 51, 3
	.short 254, 0

scr_seq_00000092_00001538:
	.short 12, 2
	.short 14, 1
	.short 12, 2
	.short 14, 3
	.short 35, 1
	.short 254, 0

scr_seq_00000092_00001550:
	.short 14, 1
	.short 12, 2
	.short 14, 1
	.short 12, 2
	.short 14, 3
	.short 35, 1
	.short 254, 0

scr_seq_00000092_0000156C:
	.short 34, 1
	.short 254, 0

scr_seq_00000092_00001574:
	.short 14, 1
	.short 254, 0

scr_seq_00000092_0000157C:
	.short 33, 1
	.short 254, 0

scr_seq_00000092_00001584:
	.short 15, 3
	.short 13, 2
	.short 15, 1
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000092_0000159C:
	.short 14, 2
	.short 12, 2
	.short 14, 6
	.short 254, 0
scr_seq_00000092_000015AC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000092_000016D8
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000092_000016EC
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000092_00001625
	apply_movement 255, scr_seq_00000092_00001700
	apply_movement 13, scr_seq_00000092_0000174C
	goto scr_seq_00000092_00001677

scr_seq_00000092_00001625:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000092_00001640
	apply_movement 255, scr_seq_00000092_00001718
	goto scr_seq_00000092_00001677

scr_seq_00000092_00001640:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000092_00001663
	apply_movement 255, scr_seq_00000092_00001738
	apply_movement 13, scr_seq_00000092_0000174C
	goto scr_seq_00000092_00001677

scr_seq_00000092_00001663:
	scrcmd_074 2132
	apply_movement 255, scr_seq_00000092_00001724
	apply_movement 13, scr_seq_00000092_0000174C
scr_seq_00000092_00001677:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000092_0000169E
	apply_movement 253, scr_seq_00000092_00001758
	wait_movement
scr_seq_00000092_0000169E:
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 8
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000092_000016D8:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000092_000016EC:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end


scr_seq_00000092_00001700:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000092_00001718:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000092_00001724:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000092_00001738:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000092_0000174C:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000092_00001758:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000092_00001768:
	scrcmd_184 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000092_00001803
	comparevartovalue VAR_UNK_412B, 2
	gotoif ge, scr_seq_00000092_000017C1
	comparevartovalue VAR_UNK_412B, 1
	gotoif eq, scr_seq_00000092_00001803
	scrcmd_529 VAR_TEMP_x4000
	scrcmd_698 0, 16384, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000092_000017B7
	goto scr_seq_00000092_000017C1

scr_seq_00000092_000017B1:
	.byte 0x16, 0x00, 0x0a, 0x00, 0x00, 0x00
scr_seq_00000092_000017B7:
	clearflag FLAG_UNK_29B
	goto scr_seq_00000092_00001816

scr_seq_00000092_000017C1:
	comparevartovalue VAR_UNK_40FE, 4
	gotoif ge, scr_seq_00000092_00001803
	checkflag FLAG_UNK_0C6
	gotoif lt, scr_seq_00000092_00001803
	scrcmd_529 VAR_TEMP_x4006
	scrcmd_698 3, 16390, 16391
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_00000092_000017FD
	goto scr_seq_00000092_00001803

scr_seq_00000092_000017F7:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000092_000017FD:
	goto scr_seq_00000092_00001F48

scr_seq_00000092_00001803:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000092_00001816:
	scrcmd_609
	lockall
	scrcmd_081 0
	clearflag FLAG_UNK_29B
	scrcmd_100 14
	apply_movement 14, scr_seq_00000092_00001C44
	wait_movement
	scrcmd_076 172, 0
	scrcmd_077
	apply_movement 255, scr_seq_00000092_00001C58
	wait_movement
	callstd 2065
	apply_movement 14, scr_seq_00000092_00001C64
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000092_00001C8C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 38
	closemsg
	apply_movement 253, scr_seq_00000092_00001CB4
	wait_movement
	apply_movement 14, scr_seq_00000092_00001CC4
	wait_movement
	apply_movement 253, scr_seq_00000092_00001CF8
	wait_movement
	apply_movement 14, scr_seq_00000092_00001D08
	apply_movement 253, scr_seq_00000092_00001D2C
	wait_movement
	clearflag FLAG_UNK_29C
	scrcmd_100 15
	apply_movement 15, scr_seq_00000092_00001DE0
	apply_movement 14, scr_seq_00000092_00001D48
	apply_movement 253, scr_seq_00000092_00001DA4
	wait_movement
	apply_movement 255, scr_seq_00000092_00001E88
	wait_movement
	msgbox 46
	closemsg
	apply_movement 15, scr_seq_00000092_00001DF4
	wait_movement
	msgbox 47
	closemsg
	apply_movement 15, scr_seq_00000092_00001E00
	apply_movement 14, scr_seq_00000092_00001E10
	apply_movement 255, scr_seq_00000092_00001ED0
	wait_movement
	msgbox 48
	closemsg
	apply_movement 14, scr_seq_00000092_00001E20
	apply_movement 253, scr_seq_00000092_00001E2C
	wait_movement
	msgbox 49
	closemsg
	apply_movement 253, scr_seq_00000092_00001E38
	wait_movement
	apply_movement 14, scr_seq_00000092_00001E40
	wait_movement
	apply_movement 253, scr_seq_00000092_00001E48
	wait_movement
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000092_00001E74
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 39
	scrcmd_076 172, 0
	msgbox 43
	scrcmd_077
	closemsg
	call scr_seq_00000092_00001987
	comparevartovalue VAR_SPECIAL_x8004, 1
	callif ge, scr_seq_00000092_00001AFB
	comparevartovalue VAR_SPECIAL_x8004, 0
	callif eq, scr_seq_00000092_000019AC
	releaseall
	end

scr_seq_00000092_00001987:
	scrcmd_332 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif lt, scr_seq_00000092_000019A4
	setvar VAR_SPECIAL_x8004, 1
	goto scr_seq_00000092_000019AA

scr_seq_00000092_000019A4:
	setvar VAR_SPECIAL_x8004, 0
scr_seq_00000092_000019AA:
	return

scr_seq_00000092_000019AC:
	msgbox 52
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000092_00001EB4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
scr_seq_00000092_000019CF:
	scrcmd_386 VAR_TEMP_x4005
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_00000092_000019EE
	apply_movement 15, scr_seq_00000092_00001E90
	goto scr_seq_00000092_000019F6

scr_seq_00000092_000019EE:
	apply_movement 15, scr_seq_00000092_00001E98
scr_seq_00000092_000019F6:
	wait_movement
	play_fanfare SEQ_ME_ITEM
	scrcmd_190 0
	msgbox 44
	wait_fanfare
	msgbox 53
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_00000092_00001A2C
	apply_movement 255, scr_seq_00000092_00001ED8
	goto scr_seq_00000092_00001A34

scr_seq_00000092_00001A2C:
	apply_movement 255, scr_seq_00000092_00001EE4
scr_seq_00000092_00001A34:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	comparevartovalue VAR_TEMP_x4008, 0
	gotoif ne, scr_seq_00000092_00001A51
	callstd 2066
scr_seq_00000092_00001A51:
	scrcmd_778
	hide_person 14
	setvar VAR_UNK_412B, 2
	play_fanfare SEQ_ME_SHINKAOME
	msgbox 40
	wait_fanfare
	scrcmd_746
	msgbox 45
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000092_00001AC5
	closemsg
	scrcmd_332 VAR_TEMP_x4009
	subvar VAR_TEMP_x4009, 1
	setvar VAR_TEMP_x400A, 0
	scrcmd_490 16393
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_173 VAR_TEMP_x4009, VAR_TEMP_x400A
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_TEMP_x400A, 1
	gotoif eq, scr_seq_00000092_00001AC5
	bufferpartymonnick 0, VAR_TEMP_x4009
	msgbox 54
scr_seq_00000092_00001AC5:
	msgbox 51
	closemsg
	scrcmd_747
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_00000092_00001AE7
	apply_movement 15, scr_seq_00000092_00001E64
	goto scr_seq_00000092_00001AEF

scr_seq_00000092_00001AE7:
	apply_movement 15, scr_seq_00000092_00001E50
scr_seq_00000092_00001AEF:
	wait_movement
	hide_person 15
	setflag FLAG_UNK_29C
	return

scr_seq_00000092_00001AFB:
	msgbox 50
	waitbutton
	closemsg
	comparevartovalue VAR_TEMP_x4008, 0
	gotoif ne, scr_seq_00000092_00001B13
	callstd 2066
scr_seq_00000092_00001B13:
	setvar VAR_UNK_412B, 1
	return

scr_seq_00000092_00001B1B:
	scrcmd_609
	lockall
	setvar VAR_TEMP_x4008, 1
	scrcmd_386 VAR_TEMP_x4005
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_00000092_00001B44
	apply_movement 14, scr_seq_00000092_00001EF0
	goto scr_seq_00000092_00001B67

scr_seq_00000092_00001B44:
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif ne, scr_seq_00000092_00001B5F
	apply_movement 14, scr_seq_00000092_00001EF8
	goto scr_seq_00000092_00001B67

scr_seq_00000092_00001B5F:
	apply_movement 14, scr_seq_00000092_00001F00
scr_seq_00000092_00001B67:
	wait_movement
	scrcmd_076 172, 0
	msgbox 43
	scrcmd_077
	closemsg
	call scr_seq_00000092_00001987
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ge, scr_seq_00000092_00001C36
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_TEMP_x4005
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_00000092_00001BB2
	apply_movement 15, scr_seq_00000092_00001E90
	goto scr_seq_00000092_00001BD5

scr_seq_00000092_00001BB2:
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif ne, scr_seq_00000092_00001BCD
	apply_movement 15, scr_seq_00000092_00001E98
	goto scr_seq_00000092_00001BD5

scr_seq_00000092_00001BCD:
	apply_movement 15, scr_seq_00000092_00001EA0
scr_seq_00000092_00001BD5:
	wait_movement
	msgbox 52
	closemsg
	scrcmd_386 VAR_TEMP_x4005
	comparevartovalue VAR_TEMP_x4005, 3
	gotoif ne, scr_seq_00000092_00001BFB
	apply_movement 255, scr_seq_00000092_00001EA8
	goto scr_seq_00000092_00001C1E

scr_seq_00000092_00001BFB:
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif ne, scr_seq_00000092_00001C16
	apply_movement 255, scr_seq_00000092_00001EB4
	goto scr_seq_00000092_00001C1E

scr_seq_00000092_00001C16:
	apply_movement 255, scr_seq_00000092_00001EC0
scr_seq_00000092_00001C1E:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	call scr_seq_00000092_000019CF
	goto scr_seq_00000092_00001C3D

scr_seq_00000092_00001C36:
	msgbox 42
	waitbutton
	closemsg
scr_seq_00000092_00001C3D:
	releaseall
	end

scr_seq_00000092_00001C41:
	.byte 0x00, 0x00, 0x00

scr_seq_00000092_00001C44:
	.short 71, 1
	.short 59, 1
	.short 72, 1
	.short 49, 2
	.short 254, 0

scr_seq_00000092_00001C58:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000092_00001C64:
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

scr_seq_00000092_00001C8C:
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

scr_seq_00000092_00001CB4:
	.short 15, 1
	.short 13, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000092_00001CC4:
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

scr_seq_00000092_00001CF8:
	.short 75, 1
	.short 63, 1
	.short 49, 2
	.short 254, 0

scr_seq_00000092_00001D08:
	.short 71, 1
	.short 53, 1
	.short 72, 1
	.short 65, 1
	.short 50, 1
	.short 18, 7
	.short 16, 13
	.short 15, 1
	.short 254, 0

scr_seq_00000092_00001D2C:
	.short 65, 2
	.short 17, 1
	.short 18, 6
	.short 48, 1
	.short 16, 13
	.short 18, 1
	.short 254, 0

scr_seq_00000092_00001D48:
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

scr_seq_00000092_00001DA4:
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

scr_seq_00000092_00001DE0:
	.short 65, 5
	.short 9, 10
	.short 11, 4
	.short 35, 1
	.short 254, 0

scr_seq_00000092_00001DF4:
	.short 32, 1
	.short 65, 1
	.short 254, 0

scr_seq_00000092_00001E00:
	.short 33, 1
	.short 65, 1
	.short 75, 1
	.short 254, 0

scr_seq_00000092_00001E10:
	.short 65, 1
	.short 32, 1
	.short 65, 1
	.short 254, 0

scr_seq_00000092_00001E20:
	.short 48, 1
	.short 51, 1
	.short 254, 0

scr_seq_00000092_00001E2C:
	.short 54, 1
	.short 50, 2
	.short 254, 0

scr_seq_00000092_00001E38:
	.short 34, 1
	.short 254, 0

scr_seq_00000092_00001E40:
	.short 51, 2
	.short 254, 0

scr_seq_00000092_00001E48:
	.short 48, 2
	.short 254, 0

scr_seq_00000092_00001E50:
	.short 35, 1
	.short 65, 1
	.short 10, 4
	.short 8, 10
	.short 254, 0

scr_seq_00000092_00001E64:
	.short 9, 2
	.short 10, 4
	.short 8, 12
	.short 254, 0

scr_seq_00000092_00001E74:
	.short 75, 1
	.short 63, 1
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000092_00001E88:
	.short 34, 1
	.short 254, 0

scr_seq_00000092_00001E90:
	.short 34, 1
	.short 254, 0

scr_seq_00000092_00001E98:
	.short 35, 1
	.short 254, 0

scr_seq_00000092_00001EA0:
	.short 33, 1
	.short 254, 0

scr_seq_00000092_00001EA8:
	.short 12, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000092_00001EB4:
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000092_00001EC0:
	.short 15, 1
	.short 12, 2
	.short 34, 1
	.short 254, 0

scr_seq_00000092_00001ED0:
	.short 33, 1
	.short 254, 0

scr_seq_00000092_00001ED8:
	.short 13, 1
	.short 35, 1
	.short 254, 0

scr_seq_00000092_00001EE4:
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000092_00001EF0:
	.short 34, 1
	.short 254, 0

scr_seq_00000092_00001EF8:
	.short 35, 1
	.short 254, 0

scr_seq_00000092_00001F00:
	.short 33, 1
	.short 254, 0
scr_seq_00000092_00001F08:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4008, 1
	call scr_seq_00000092_00001987
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, scr_seq_00000092_00001F35
	call scr_seq_00000092_00001F3F
	goto scr_seq_00000092_00001F3B

scr_seq_00000092_00001F35:
	call scr_seq_00000092_00001AFB
scr_seq_00000092_00001F3B:
	releaseall
	end

scr_seq_00000092_00001F3F:
	msgbox 55
	waitbutton
	closemsg
	return

scr_seq_00000092_00001F48:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	apply_movement 253, scr_seq_00000092_00002038
	wait_movement
	fade_out_bgm 0, 30
	callstd 2029
	scrcmd_746
	clearflag FLAG_UNK_310
	scrcmd_100 16
	scrcmd_100 17
	apply_movement 16, scr_seq_00000092_00002054
	apply_movement 17, scr_seq_00000092_00002060
	wait_movement
	apply_movement 255, scr_seq_00000092_0000200C
	wait_movement
	scrcmd_190 0
	scrcmd_132 57, 56
	closemsg
	callstd 2030
	play_se SEQ_SE_GS_SUZUSYUTUGEN_HO
	scrcmd_174 6, 6, 0, 32767
	scrcmd_175
	wait 15, VAR_SPECIAL_x800C
	scrcmd_174 6, 6, 1, 32767
	scrcmd_175
	apply_movement 255, scr_seq_00000092_00002014
	apply_movement 16, scr_seq_00000092_0000208C
	wait_movement
	scrcmd_132 59, 58
	closemsg
	play_se SEQ_SE_GS_TIMESLIP
	scrcmd_810
	setvar VAR_UNK_40FE, 1
	clearflag FLAG_UNK_301
	clearflag FLAG_UNK_302
	setflag FLAG_UNK_310
	scrcmd_176 27, 0, 954, 280, 1
	scrcmd_174 6, 15, 1, 32767
	scrcmd_175
	releaseall
	end

scr_seq_00000092_00002009:
	.byte 0x00, 0x00, 0x00

scr_seq_00000092_0000200C:
	.short 34, 1
	.short 254, 0

scr_seq_00000092_00002014:
	.short 75, 1
	.short 63, 1
	.short 32, 1
	.short 63, 1
	.short 34, 1
	.short 63, 1
	.short 33, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000092_00002038:
	.short 1, 1
	.short 1, 1
	.short 57, 1
	.short 71, 1
	.short 52, 1
	.short 71, 1
	.short 254, 0

scr_seq_00000092_00002054:
	.short 13, 11
	.short 15, 2
	.short 254, 0

scr_seq_00000092_00002060:
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

scr_seq_00000092_0000208C:
	.short 65, 1
	.short 15, 2
	.short 12, 2
	.short 35, 1
	.short 254, 0
scr_seq_00000092_000020A0:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 16, scr_seq_00000092_00002148
	apply_movement 255, scr_seq_00000092_000021F4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_132 61, 60
	closemsg
	apply_movement 17, scr_seq_00000092_00002170
	wait_movement
	callstd 2029
	apply_movement 16, scr_seq_00000092_0000215C
	wait_movement
	scrcmd_132 63, 62
	closemsg
	apply_movement 16, scr_seq_00000092_0000218C
	wait_movement
	scrcmd_132 65, 64
	closemsg
	apply_movement 16, scr_seq_00000092_0000219C
	apply_movement 17, scr_seq_00000092_000021A4
	wait_movement
	scrcmd_190 0
	scrcmd_132 67, 66
	closemsg
	apply_movement 16, scr_seq_00000092_000021AC
	apply_movement 17, scr_seq_00000092_000021C4
	wait_movement
	callstd 2030
	scrcmd_747
	setvar VAR_UNK_40FE, 5
	hide_person 16
	hide_person 17
	setflag FLAG_UNK_310
	releaseall
	end

scr_seq_00000092_00002147:
	.byte 0x00

scr_seq_00000092_00002148:
	.short 34, 1
	.short 63, 1
	.short 35, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000092_0000215C:
	.short 34, 1
	.short 75, 1
	.short 63, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000092_00002170:
	.short 63, 1
	.short 51, 2
	.short 71, 1
	.short 52, 1
	.short 53, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000092_0000218C:
	.short 14, 3
	.short 65, 1
	.short 50, 2
	.short 254, 0

scr_seq_00000092_0000219C:
	.short 15, 3
	.short 254, 0

scr_seq_00000092_000021A4:
	.short 15, 3
	.short 254, 0

scr_seq_00000092_000021AC:
	.short 14, 4
	.short 12, 6
	.short 33, 1
	.short 63, 6
	.short 12, 5
	.short 254, 0

scr_seq_00000092_000021C4:
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

scr_seq_00000092_000021F4:
	.short 13, 1
	.short 63, 1
	.short 254, 0
scr_seq_00000092_00002200:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 27, VAR_SPECIAL_x800C
	callstd 2000
	end
	.balign 4, 0
