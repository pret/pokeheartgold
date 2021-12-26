#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000798_00000198 ; 000
	scrdef scr_seq_00000798_000002B2 ; 001
	scrdef scr_seq_00000798_000002C5 ; 002
	scrdef scr_seq_00000798_000002D8 ; 003
	scrdef scr_seq_00000798_000002EB ; 004
	scrdef scr_seq_00000798_0000030D ; 005
	scrdef scr_seq_00000798_0000031E ; 006
	scrdef scr_seq_00000798_0000032F ; 007
	scrdef scr_seq_00000798_0000003A ; 008
	scrdef scr_seq_00000798_00000250 ; 009
	scrdef scr_seq_00000798_0000006D ; 010
	scrdef scr_seq_00000798_00000046 ; 011
	scrdef scr_seq_00000798_00000340 ; 012
	scrdef scr_seq_00000798_000002FC ; 013
	scrdef_end

scr_seq_00000798_0000003A:
	scrcmd_144 16416
	setvar VAR_UNK_4125, 0
	end

scr_seq_00000798_00000046:
	comparevartovalue VAR_UNK_412C, 0
	gotoif ne, scr_seq_00000798_0000006B
	show_person_at 5, 12, 0, 6, 2
	show_person_at 6, 13, 0, 6, 2
scr_seq_00000798_0000006B:
	end

scr_seq_00000798_0000006D:
	scrcmd_609
	lockall
	callstd 2029
	apply_movement 5, scr_seq_00000798_0000012C
	apply_movement 6, scr_seq_00000798_00000138
	wait_movement
	buffer_players_name 0
	gender_msgbox 12, 13
	closemsg
	apply_movement 5, scr_seq_00000798_00000140
	apply_movement 6, scr_seq_00000798_00000148
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000798_00000150
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	buffer_players_name 0
	gender_msgbox 14, 15
	closemsg
	apply_movement 5, scr_seq_00000798_0000015C
	apply_movement 6, scr_seq_00000798_0000016C
	wait_movement
	scrcmd_307 0, 0, 3, 2, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 5, scr_seq_00000798_00000180
	apply_movement 6, scr_seq_00000798_0000018C
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	callstd 2030
	setvar VAR_UNK_412C, 1
	show_person_at 5, 29, 0, 29, 2
	show_person_at 6, 29, 0, 29, 2
	releaseall
	end

scr_seq_00000798_0000012B:
	.byte 0x00

scr_seq_00000798_0000012C:
	.short 14, 4
	.short 75, 1
	.short 254, 0

scr_seq_00000798_00000138:
	.short 14, 4
	.short 254, 0

scr_seq_00000798_00000140:
	.short 14, 4
	.short 254, 0

scr_seq_00000798_00000148:
	.short 14, 4
	.short 254, 0

scr_seq_00000798_00000150:
	.short 13, 3
	.short 35, 1
	.short 254, 0

scr_seq_00000798_0000015C:
	.short 12, 2
	.short 14, 1
	.short 12, 1
	.short 254, 0

scr_seq_00000798_0000016C:
	.short 14, 1
	.short 12, 2
	.short 14, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000798_00000180:
	.short 12, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000798_0000018C:
	.short 12, 2
	.short 69, 1
	.short 254, 0
scr_seq_00000798_00000198:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_423 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000798_00000245
	checkflag FLAG_UNK_143
	gotoif TRUE, scr_seq_00000798_000001ED
	msgbox 1
	play_fanfare SEQ_ME_HYOUKA2
	wait_fanfare
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_425 0
	scrcmd_150
	setflag FLAG_UNK_143
	scrcmd_515 25
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_00000798_000001ED:
	scrcmd_424 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000798_00000245
	checkflag FLAG_UNK_144
	gotoif TRUE, scr_seq_00000798_0000023A
	msgbox 2
	play_fanfare SEQ_ME_HYOUKA2
	wait_fanfare
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_425 1
	scrcmd_150
	setflag FLAG_UNK_144
	scrcmd_515 26
	fade_screen 6, 1, 1, 0
	wait_fade
scr_seq_00000798_0000023A:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_00000245:
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_00000250:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 15, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000798_00000276
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_00000276:
	getitemquantity 502, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000798_000002A7
	msgbox 8
	setvar VAR_SPECIAL_x8004, 502
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_000002A7:
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_000002B2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_000002C5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_000002D8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_000002EB:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_000002FC:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_0000030D:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_0000031E:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_0000032F:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000798_00000340:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 21
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
