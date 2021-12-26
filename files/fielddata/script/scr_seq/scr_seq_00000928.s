#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000928_00000580 ; 000
	scrdef scr_seq_00000928_000005FC ; 001
	scrdef scr_seq_00000928_00000617 ; 002
	scrdef scr_seq_00000928_000002FC ; 003
	scrdef scr_seq_00000928_00000488 ; 004
	scrdef scr_seq_00000928_000006FB ; 005
	scrdef scr_seq_00000928_0000072F ; 006
	scrdef scr_seq_00000928_00000763 ; 007
	scrdef scr_seq_00000928_0000087A ; 008
	scrdef scr_seq_00000928_000008AE ; 009
	scrdef scr_seq_00000928_000006E8 ; 010
	scrdef scr_seq_00000928_000004CE ; 011
	scrdef scr_seq_00000928_00000527 ; 012
	scrdef scr_seq_00000928_00000046 ; 013
	scrdef scr_seq_00000928_000006A5 ; 014
	scrdef scr_seq_00000928_00000138 ; 015
	scrdef scr_seq_00000928_000008E2 ; 016
	scrdef_end

scr_seq_00000928_00000046:
	comparevartovalue VAR_UNK_410C, 1
	gotoif gt, scr_seq_00000928_00000057
	scrcmd_375 12
scr_seq_00000928_00000057:
	comparevartovalue VAR_UNK_410C, 0
	gotoif ne, scr_seq_00000928_0000007C
	show_person_at 9, 6, 0, 6, 3
	show_person_at 6, 8, 0, 6, 2
scr_seq_00000928_0000007C:
	comparevartovalue VAR_TEMP_x4009, 222
	gotoif ne, scr_seq_00000928_00000110
	show_person_at 9, 29, 0, 29, 1
	scrcmd_375 9
	scrcmd_386 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000928_000000BC
	show_person_at 12, 7, 0, 6, 1
	goto scr_seq_00000928_00000106

scr_seq_00000928_000000BC:
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000928_000000DB
	show_person_at 12, 7, 0, 6, 0
	goto scr_seq_00000928_00000106

scr_seq_00000928_000000DB:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000928_000000FA
	show_person_at 12, 7, 0, 6, 3
	goto scr_seq_00000928_00000106

scr_seq_00000928_000000FA:
	show_person_at 12, 7, 0, 6, 2
scr_seq_00000928_00000106:
	scrcmd_374 12
	setvar VAR_TEMP_x4009, 0
scr_seq_00000928_00000110:
	comparevartovalue VAR_TEMP_x400A, 10
	gotoif eq, scr_seq_00000928_00000136
	comparevartovalue VAR_UNK_410C, 3
	gotoif ne, scr_seq_00000928_00000136
	show_person_at 6, 7, 0, 6, 1
scr_seq_00000928_00000136:
	end

scr_seq_00000928_00000138:
	scrcmd_609
	lockall
	msgbox 0
	closemsg
	apply_movement 9, scr_seq_00000928_000001CC
	wait_movement
	get_player_coords VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_102 VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	apply_movement 241, scr_seq_00000928_000001D4
	wait_movement
	wait 10, VAR_SPECIAL_x800C
	apply_movement 9, scr_seq_00000928_000001F0
	wait_movement
	msgbox 1
	closemsg
	apply_movement 6, scr_seq_00000928_000001F8
	wait_movement
	msgbox 2
	closemsg
	apply_movement 9, scr_seq_00000928_00000200
	wait_movement
	msgbox 3
	closemsg
	apply_movement 6, scr_seq_00000928_00000208
	wait_movement
	msgbox 4
	closemsg
	apply_movement 9, scr_seq_00000928_00000218
	wait_movement
	apply_movement 9, scr_seq_00000928_00000220
	apply_movement 241, scr_seq_00000928_000001DC
	wait_movement
	scrcmd_103
	releaseall
	setvar VAR_UNK_410C, 1
	end

scr_seq_00000928_000001CB:
	.byte 0x00

scr_seq_00000928_000001CC:
	.short 3, 1
	.short 254, 0

scr_seq_00000928_000001D4:
	.short 76, 9
	.short 254, 0

scr_seq_00000928_000001DC:
	.short 66, 1
	.short 77, 9
	.short 254, 0
	.byte 0x0c, 0x00, 0x03, 0x00, 0xfe, 0x00, 0x00, 0x00

scr_seq_00000928_000001F0:
	.short 15, 1
	.short 254, 0

scr_seq_00000928_000001F8:
	.short 38, 1
	.short 254, 0

scr_seq_00000928_00000200:
	.short 51, 2
	.short 254, 0

scr_seq_00000928_00000208:
	.short 71, 1
	.short 15, 2
	.short 72, 1
	.short 254, 0

scr_seq_00000928_00000218:
	.short 33, 1
	.short 254, 0

scr_seq_00000928_00000220:
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
	.short 60, 1
	.short 3, 1
	.short 60, 1
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
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 60, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 2, 1
	.short 60, 1
	.short 0, 1
	.short 60, 1
	.short 3, 1
	.short 60, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000928_000002FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_081 0
	play_bgm SEQ_GS_EYE_ROCKET
	msgbox 5
	closemsg
	setvar VAR_TEMP_x4009, 222
	trainer_battle 601, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000928_0000040C
	msgbox 6
	closemsg
	scrcmd_386 VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, scr_seq_00000928_00000354
	apply_movement 12, scr_seq_00000928_00000414
	goto scr_seq_00000928_00000392

scr_seq_00000928_00000354:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_00000928_0000036F
	apply_movement 12, scr_seq_00000928_00000424
	goto scr_seq_00000928_00000392

scr_seq_00000928_0000036F:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, scr_seq_00000928_0000038A
	apply_movement 12, scr_seq_00000928_00000434
	goto scr_seq_00000928_00000392

scr_seq_00000928_0000038A:
	apply_movement 12, scr_seq_00000928_00000444
scr_seq_00000928_00000392:
	wait_movement
	msgbox 7
	closemsg
	comparevartovalue VAR_SPECIAL_x8004, 0
	gotoif ne, scr_seq_00000928_000003B4
	apply_movement 12, scr_seq_00000928_00000454
	goto scr_seq_00000928_000003F2

scr_seq_00000928_000003B4:
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_00000928_000003CF
	apply_movement 12, scr_seq_00000928_00000460
	goto scr_seq_00000928_000003F2

scr_seq_00000928_000003CF:
	comparevartovalue VAR_SPECIAL_x8004, 2
	gotoif ne, scr_seq_00000928_000003EA
	apply_movement 12, scr_seq_00000928_0000046C
	goto scr_seq_00000928_000003F2

scr_seq_00000928_000003EA:
	apply_movement 12, scr_seq_00000928_00000478
scr_seq_00000928_000003F2:
	wait_movement
	hide_person 12
	setflag FLAG_UNK_23A
	releaseall
	setvar VAR_UNK_410C, 2
	setvar VAR_TEMP_x400A, 10
	end

scr_seq_00000928_0000040C:
	scrcmd_219
	releaseall
	end

scr_seq_00000928_00000412:
	.byte 0x00, 0x00

scr_seq_00000928_00000414:
	.short 71, 1
	.short 12, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000928_00000424:
	.short 71, 1
	.short 13, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000928_00000434:
	.short 71, 1
	.short 14, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000928_00000444:
	.short 71, 1
	.short 15, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000928_00000454:
	.short 18, 4
	.short 17, 12
	.short 254, 0

scr_seq_00000928_00000460:
	.short 18, 4
	.short 17, 10
	.short 254, 0

scr_seq_00000928_0000046C:
	.short 18, 3
	.short 17, 10
	.short 254, 0

scr_seq_00000928_00000478:
	.short 17, 1
	.short 19, 3
	.short 17, 9
	.short 254, 0
scr_seq_00000928_00000488:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_UNK_410C, 1
	gotoif eq, scr_seq_00000928_000004B5
	comparevartovalue VAR_TEMP_x400A, 10
	gotoif eq, scr_seq_00000928_000004C0
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_000004B5:
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_000004C0:
	buffer_players_name 0
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_000004CE:
	scrcmd_609
	lockall
	apply_movement 2, scr_seq_00000928_000005B4
	wait_movement
	msgbox 26
	setvar VAR_SPECIAL_x8004, 422
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000928_000005A9
	callstd 2033
	setflag FLAG_UNK_0A2
	setvar VAR_UNK_410C, 3
	setvar VAR_UNK_4090, 1
	msgbox 28
	closemsg
	apply_movement 2, scr_seq_00000928_000005C4
	wait_movement
	releaseall
	end

scr_seq_00000928_00000527:
	scrcmd_609
	lockall
	apply_movement 2, scr_seq_00000928_000005D8
	wait_movement
	msgbox 26
	setvar VAR_SPECIAL_x8004, 422
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000928_000005A9
	callstd 2033
	setflag FLAG_UNK_0A2
	setvar VAR_UNK_4090, 1
	setvar VAR_UNK_410C, 3
	msgbox 28
	closemsg
	apply_movement 2, scr_seq_00000928_000005E8
	wait_movement
	releaseall
	end

scr_seq_00000928_00000580:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_0A2
	gotoif TRUE, scr_seq_00000928_0000059E
	msgbox 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_0000059E:
	msgbox 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_000005A9:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000928_000005B3:
	.byte 0x00

scr_seq_00000928_000005B4:
	.short 12, 1
	.short 14, 5
	.short 12, 2
	.short 254, 0

scr_seq_00000928_000005C4:
	.short 13, 2
	.short 15, 5
	.short 13, 1
	.short 0, 1
	.short 254, 0

scr_seq_00000928_000005D8:
	.short 12, 1
	.short 15, 3
	.short 12, 2
	.short 254, 0

scr_seq_00000928_000005E8:
	.short 13, 2
	.short 14, 3
	.short 13, 1
	.short 0, 1
	.short 254, 0
scr_seq_00000928_000005FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 54, 0
	msgbox 30
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_00000617:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x400A, 10
	gotoif eq, scr_seq_00000928_00000644
	comparevartovalue VAR_UNK_410C, 1
	gotoif eq, scr_seq_00000928_0000064F
	msgbox 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_00000644:
	msgbox 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_0000064F:
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, scr_seq_00000928_00000665
	msgbox 32
	goto scr_seq_00000928_0000067E

scr_seq_00000928_00000665:
	comparevartovalue VAR_TEMP_x400B, 1
	gotoif ne, scr_seq_00000928_0000067B
	msgbox 34
	goto scr_seq_00000928_0000067E

scr_seq_00000928_0000067B:
	msgbox 35
scr_seq_00000928_0000067E:
	waitbutton
	closemsg
	releaseall
	comparevartovalue VAR_TEMP_x400B, 2
	gotoif ge, scr_seq_00000928_0000069D
	addvar VAR_TEMP_x400B, 1
	goto scr_seq_00000928_000006A3

scr_seq_00000928_0000069D:
	setvar VAR_TEMP_x400B, 0
scr_seq_00000928_000006A3:
	end

scr_seq_00000928_000006A5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	comparevartovalue VAR_TEMP_x400A, 10
	gotoif eq, scr_seq_00000928_000006D2
	comparevartovalue VAR_UNK_410C, 1
	gotoif eq, scr_seq_00000928_000006DD
	msgbox 36
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_000006D2:
	msgbox 38
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_000006DD:
	msgbox 37
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_000006E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 39
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_000006FB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_00000928_00000724
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_00000928_00000724
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_00000724:
	msgbox 40
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_0000072F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_00000928_00000758
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_00000928_00000758
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_00000758:
	msgbox 41
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_00000763:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_SPECIAL_x8000, 77
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_00000928_00000868
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_00000928_00000868
	msgbox 13
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x8004
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, scr_seq_00000928_00000BD3
	closemsg
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif ne, scr_seq_00000928_000007BA
	goto scr_seq_00000928_00000944

scr_seq_00000928_000007B8:
	.byte 0x02, 0x00
scr_seq_00000928_000007BA:
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000928_000007DF
	apply_movement 255, scr_seq_00000928_00000828
	goto scr_seq_00000928_0000080F

scr_seq_00000928_000007DF:
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif ne, scr_seq_00000928_000007FA
	apply_movement 255, scr_seq_00000928_0000083C
	goto scr_seq_00000928_0000080F

scr_seq_00000928_000007FA:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000928_0000080F
	apply_movement 255, scr_seq_00000928_0000084C
scr_seq_00000928_0000080F:
	apply_movement 10, scr_seq_00000928_0000085C
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	return

scr_seq_00000928_00000825:
	.byte 0x00, 0x00, 0x00

scr_seq_00000928_00000828:
	.short 15, 1
	.short 13, 2
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000928_0000083C:
	.short 13, 1
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000928_0000084C:
	.short 13, 1
	.short 15, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000928_0000085C:
	.short 63, 2
	.short 33, 1
	.short 254, 0
scr_seq_00000928_00000868:
	buffer_players_name 0
	msgbox 42
	waitbutton
	closemsg
	setflag FLAG_UNK_107
	releaseall
	end

scr_seq_00000928_0000087A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_00000928_000008A3
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_00000928_000008A3
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_000008A3:
	msgbox 43
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_000008AE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_108
	gotoif TRUE, scr_seq_00000928_000008D7
	checkflag FLAG_UNK_109
	gotoif TRUE, scr_seq_00000928_000008D7
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_000008D7:
	msgbox 44
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000928_000008E2:
	scrcmd_609
	lockall
	setvar VAR_SPECIAL_x8000, 11
	setvar VAR_UNK_410C, 5
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000928_00000BF4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000928_0000092A
	msgbox 11
	goto scr_seq_00000928_0000092D

scr_seq_00000928_0000092A:
	msgbox 12
scr_seq_00000928_0000092D:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x8004
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif eq, scr_seq_00000928_00000BD3
	closemsg
scr_seq_00000928_00000944:
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement 10, scr_seq_00000928_00000D74
	wait_movement
	msgbox 45
	closemsg
	wait 10, VAR_SPECIAL_x800C
	trainer_battle 162, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000928_00000BC9
	apply_movement 10, scr_seq_00000928_00000C0C
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement 4, scr_seq_00000928_00000C18
	wait_movement
	msgbox 15
	closemsg
	trainer_battle 160, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000928_00000BC9
	apply_movement 4, scr_seq_00000928_00000C48
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement 8, scr_seq_00000928_00000C54
	wait_movement
	msgbox 16
	closemsg
	trainer_battle 164, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000928_00000BC9
	apply_movement 8, scr_seq_00000928_00000C84
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement 5, scr_seq_00000928_00000C90
	wait_movement
	msgbox 17
	closemsg
	trainer_battle 161, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000928_00000BC9
	apply_movement 5, scr_seq_00000928_00000CBC
	wait_movement
	scrcmd_081 30
	play_bgm SEQ_GS_EYE_MAIKO
	apply_movement 7, scr_seq_00000928_00000CCC
	wait_movement
	msgbox 18
	closemsg
	trainer_battle 163, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000928_00000BC9
	apply_movement 7, scr_seq_00000928_00000CF8
	wait_movement
	apply_movement 10, scr_seq_00000928_00000D08
	wait_movement
	msgbox 20
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000928_00000AA4
	setvar VAR_SPECIAL_x8004, 474
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setflag FLAG_UNK_103
	goto scr_seq_00000928_00000AB8

scr_seq_00000928_00000AA4:
	setvar VAR_SPECIAL_x8004, 503
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setflag FLAG_UNK_104
scr_seq_00000928_00000AB8:
	closemsg
	play_se SEQ_SE_DP_KI_GASYAN
	scrcmd_561 0, 2, 10, 6
	wait_se SEQ_SE_DP_KI_GASYAN
	clearflag FLAG_UNK_240
	scrcmd_100 11
	apply_movement 11, scr_seq_00000928_00000D10
	wait_movement
	apply_movement 10, scr_seq_00000928_00000BEC
	wait_movement
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000928_00000B02
	msgbox 21
	goto scr_seq_00000928_00000B05

scr_seq_00000928_00000B02:
	msgbox 22
scr_seq_00000928_00000B05:
	closemsg
	apply_movement 10, scr_seq_00000928_00000BE4
	wait_movement
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000928_00000B2A
	msgbox 23
	goto scr_seq_00000928_00000B2D

scr_seq_00000928_00000B2A:
	msgbox 24
scr_seq_00000928_00000B2D:
	closemsg
	apply_movement 4, scr_seq_00000928_00000D1C
	apply_movement 5, scr_seq_00000928_00000D28
	apply_movement 10, scr_seq_00000928_00000D38
	apply_movement 7, scr_seq_00000928_00000D48
	apply_movement 8, scr_seq_00000928_00000D58
	apply_movement 11, scr_seq_00000928_00000D64
	wait_movement
	hide_person 4
	hide_person 5
	hide_person 10
	hide_person 7
	hide_person 8
	hide_person 11
	setflag FLAG_UNK_23C
	setflag FLAG_UNK_240
	call scr_seq_00000928_00000BB0
	setvar VAR_UNK_410C, 6
	setvar VAR_UNK_40FA, 1
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000928_00000BAA
	clearflag FLAG_UNK_244
	goto scr_seq_00000928_00000BAE

scr_seq_00000928_00000BAA:
	clearflag FLAG_UNK_245
scr_seq_00000928_00000BAE:
	end

scr_seq_00000928_00000BB0:
	comparevartovalue VAR_SPECIAL_x8000, 77
	gotoif ne, scr_seq_00000928_00000BC5
	releaseall
	goto scr_seq_00000928_00000BC7

scr_seq_00000928_00000BC5:
	releaseall
scr_seq_00000928_00000BC7:
	return

scr_seq_00000928_00000BC9:
	scrcmd_219
	call scr_seq_00000928_00000BB0
	end

scr_seq_00000928_00000BD3:
	msgbox 14
	waitbutton
	closemsg
	call scr_seq_00000928_00000BB0
	end

scr_seq_00000928_00000BE2:
	.byte 0x00, 0x00

scr_seq_00000928_00000BE4:
	.short 75, 1
	.short 254, 0

scr_seq_00000928_00000BEC:
	.short 34, 1
	.short 254, 0

scr_seq_00000928_00000BF4:
	.short 12, 5
	.short 14, 4
	.short 12, 5
	.short 15, 4
	.short 32, 1
	.short 254, 0

scr_seq_00000928_00000C0C:
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000928_00000C18:
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 35, 1
	.short 15, 5
	.short 33, 1
	.short 254, 0

scr_seq_00000928_00000C48:
	.short 14, 5
	.short 33, 1
	.short 254, 0

scr_seq_00000928_00000C54:
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 1, 1
	.short 61, 1
	.short 34, 1
	.short 14, 5
	.short 33, 1
	.short 254, 0

scr_seq_00000928_00000C84:
	.short 15, 5
	.short 33, 1
	.short 254, 0

scr_seq_00000928_00000C90:
	.short 3, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 2, 1
	.short 61, 1
	.short 33, 1
	.short 13, 1
	.short 15, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000928_00000CBC:
	.short 14, 3
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000928_00000CCC:
	.short 2, 1
	.short 61, 1
	.short 0, 1
	.short 61, 1
	.short 3, 1
	.short 61, 1
	.short 33, 1
	.short 13, 1
	.short 14, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000928_00000CF8:
	.short 15, 3
	.short 12, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000928_00000D08:
	.short 13, 1
	.short 254, 0

scr_seq_00000928_00000D10:
	.short 16, 10
	.short 19, 3
	.short 254, 0

scr_seq_00000928_00000D1C:
	.short 15, 1
	.short 13, 11
	.short 254, 0

scr_seq_00000928_00000D28:
	.short 63, 1
	.short 14, 1
	.short 13, 12
	.short 254, 0

scr_seq_00000928_00000D38:
	.short 63, 1
	.short 15, 4
	.short 13, 11
	.short 254, 0

scr_seq_00000928_00000D48:
	.short 63, 1
	.short 15, 1
	.short 13, 12
	.short 254, 0

scr_seq_00000928_00000D58:
	.short 14, 1
	.short 13, 11
	.short 254, 0

scr_seq_00000928_00000D64:
	.short 63, 2
	.short 15, 5
	.short 13, 11
	.short 254, 0

scr_seq_00000928_00000D74:
	.short 2, 1
	.short 62, 1
	.short 0, 1
	.short 62, 1
	.short 3, 1
	.short 62, 1
	.short 1, 1
	.short 62, 1
	.short 2, 1
	.short 62, 1
	.short 0, 1
	.short 62, 1
	.short 3, 1
	.short 62, 1
	.short 33, 1
	.short 254, 0
	.balign 4, 0
