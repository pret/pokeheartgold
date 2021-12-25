#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000015_000000FE ; 000
	scrdef scr_seq_00000015_00000490 ; 001
	scrdef scr_seq_00000015_000001D2 ; 002
	scrdef scr_seq_00000015_00000225 ; 003
	scrdef scr_seq_00000015_00000297 ; 004
	scrdef scr_seq_00000015_000002EA ; 005
	scrdef scr_seq_00000015_0000033D ; 006
	scrdef scr_seq_00000015_000003AF ; 007
	scrdef scr_seq_00000015_000000B1 ; 008
	scrdef scr_seq_00000015_0000002A ; 009
	scrdef_end

scr_seq_00000015_0000002A:
	scrcmd_142 30, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000015_000000AB
	scrcmd_147 30, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000015_0000008A
	scrcmd_294 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_00000015_00000069
	clearflag FLAG_UNK_2F5
	end

scr_seq_00000015_00000069:
	scrcmd_484 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 2
	gotoif ne, scr_seq_00000015_00000084
	setflag FLAG_UNK_2F5
	goto scr_seq_00000015_00000088

scr_seq_00000015_00000084:
	clearflag FLAG_UNK_2F5
scr_seq_00000015_00000088:
	end

scr_seq_00000015_0000008A:
	scrcmd_484 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 4
	gotoif ne, scr_seq_00000015_000000A5
	setflag FLAG_UNK_2F5
	goto scr_seq_00000015_000000A9

scr_seq_00000015_000000A5:
	clearflag FLAG_UNK_2F5
scr_seq_00000015_000000A9:
	end

scr_seq_00000015_000000AB:
	setflag FLAG_UNK_2F5
	end

scr_seq_00000015_000000B1:
	checkflag FLAG_UNK_13B
	callif eq, scr_seq_00000015_000000D4
	checkflag FLAG_UNK_13D
	callif eq, scr_seq_00000015_000000E2
	checkflag FLAG_UNK_13E
	callif eq, scr_seq_00000015_000000F0
	end

scr_seq_00000015_000000D4:
	show_person_at 5, 21, 0, 14, 2
	return

scr_seq_00000015_000000E2:
	show_person_at 7, 9, 0, 13, 0
	return

scr_seq_00000015_000000F0:
	show_person_at 2, 15, 0, 16, 1
	return

scr_seq_00000015_000000FE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 14, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000015_000001B6
	msgbox 0
	closemsg
	trainer_battle 259, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000015_000001CC
	scrcmd_295 14
	addvar VAR_UNK_4135, 1
	setflag FLAG_UNK_265
	setflag FLAG_UNK_299
	clearflag FLAG_UNK_29A
	scrcmd_515 22
	setflag FLAG_UNK_13F
	setflag FLAG_UNK_140
	setflag FLAG_UNK_13C
	msgbox 1
	scrcmd_190 0
	msgbox 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	msgbox 3
	goto scr_seq_00000015_00000175

scr_seq_00000015_00000175:
	setvar VAR_SPECIAL_x8004, 377
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000015_000001AC
	callstd 2033
	setflag FLAG_UNK_17D
	scrcmd_190 0
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000015_000001AC:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000015_000001B6:
	checkflag FLAG_UNK_17D
	gotoif lt, scr_seq_00000015_00000175
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000015_000001CC:
	scrcmd_219
	releaseall
	end

scr_seq_00000015_000001D2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13B
	gotoif eq, scr_seq_00000015_0000021A
	msgbox 6
	closemsg
	trainer_battle 689, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000015_000001CC
	msgbox 8
	closemsg
	apply_movement 5, scr_seq_00000015_00000424
	wait_movement
	setflag FLAG_UNK_13B
	releaseall
	end

scr_seq_00000015_0000021A:
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000015_00000225:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13C
	gotoif eq, scr_seq_00000015_0000028C
	msgbox 9
	closemsg
	trainer_battle 690, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000015_000001CC
	msgbox 11
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000015_0000027A
	apply_movement 6, scr_seq_00000015_0000043C
	goto scr_seq_00000015_00000282

scr_seq_00000015_0000027A:
	apply_movement 6, scr_seq_00000015_00000430
scr_seq_00000015_00000282:
	wait_movement
	setflag FLAG_UNK_13C
	releaseall
	end

scr_seq_00000015_0000028C:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000015_00000297:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13D
	gotoif eq, scr_seq_00000015_000002DF
	msgbox 12
	closemsg
	trainer_battle 691, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000015_000001CC
	msgbox 14
	closemsg
	apply_movement 7, scr_seq_00000015_00000448
	wait_movement
	setflag FLAG_UNK_13D
	releaseall
	end

scr_seq_00000015_000002DF:
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000015_000002EA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13E
	gotoif eq, scr_seq_00000015_00000332
	msgbox 15
	closemsg
	trainer_battle 692, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000015_000001CC
	msgbox 17
	closemsg
	apply_movement 2, scr_seq_00000015_00000454
	wait_movement
	setflag FLAG_UNK_13E
	releaseall
	end

scr_seq_00000015_00000332:
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000015_0000033D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_13F
	gotoif eq, scr_seq_00000015_000003A4
	msgbox 18
	closemsg
	trainer_battle 693, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000015_000001CC
	msgbox 20
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000015_00000392
	apply_movement 3, scr_seq_00000015_0000046C
	goto scr_seq_00000015_0000039A

scr_seq_00000015_00000392:
	apply_movement 3, scr_seq_00000015_00000460
scr_seq_00000015_0000039A:
	wait_movement
	setflag FLAG_UNK_13F
	releaseall
	end

scr_seq_00000015_000003A4:
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000015_000003AF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_140
	gotoif eq, scr_seq_00000015_00000416
	msgbox 21
	closemsg
	trainer_battle 694, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000015_000001CC
	msgbox 23
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000015_00000404
	apply_movement 4, scr_seq_00000015_00000478
	goto scr_seq_00000015_0000040C

scr_seq_00000015_00000404:
	apply_movement 4, scr_seq_00000015_00000484
scr_seq_00000015_0000040C:
	wait_movement
	setflag FLAG_UNK_140
	releaseall
	end

scr_seq_00000015_00000416:
	msgbox 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000015_00000421:
	.byte 0x00, 0x00, 0x00

scr_seq_00000015_00000424:
	.short 15, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000015_00000430:
	.short 13, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000015_0000043C:
	.short 12, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000015_00000448:
	.short 13, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000015_00000454:
	.short 12, 1
	.short 1, 1
	.short 254, 0

scr_seq_00000015_00000460:
	.short 14, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000015_0000046C:
	.short 15, 1
	.short 2, 1
	.short 254, 0

scr_seq_00000015_00000478:
	.short 14, 1
	.short 3, 1
	.short 254, 0

scr_seq_00000015_00000484:
	.short 15, 1
	.short 2, 1
	.short 254, 0
scr_seq_00000015_00000490:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 14, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000015_000004B6
	msgbox 24
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000015_000004B6:
	msgbox 25
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
