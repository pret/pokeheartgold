#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0832_T11R0101_0894 ; 000
	scrdef scr_seq_0832_T11R0101_08BD ; 001
	scrdef scr_seq_0832_T11R0101_08D0 ; 002
	scrdef scr_seq_0832_T11R0101_0052 ; 003
	scrdef scr_seq_0832_T11R0101_0264 ; 004
	scrdef scr_seq_0832_T11R0101_02C7 ; 005
	scrdef scr_seq_0832_T11R0101_032A ; 006
	scrdef scr_seq_0832_T11R0101_038D ; 007
	scrdef scr_seq_0832_T11R0101_03F0 ; 008
	scrdef scr_seq_0832_T11R0101_0453 ; 009
	scrdef scr_seq_0832_T11R0101_04B6 ; 010
	scrdef scr_seq_0832_T11R0101_0519 ; 011
	scrdef scr_seq_0832_T11R0101_057C ; 012
	scrdef scr_seq_0832_T11R0101_05DF ; 013
	scrdef scr_seq_0832_T11R0101_0642 ; 014
	scrdef scr_seq_0832_T11R0101_06A5 ; 015
	scrdef scr_seq_0832_T11R0101_0708 ; 016
	scrdef scr_seq_0832_T11R0101_076B ; 017
	scrdef scr_seq_0832_T11R0101_07CE ; 018
	scrdef scr_seq_0832_T11R0101_0831 ; 019
	scrdef_end

scr_seq_0832_T11R0101_0052:
	get_phone_book_rematch 17, VAR_TEMP_x4000
	get_phone_book_rematch 26, VAR_TEMP_x4001
	get_phone_book_rematch 27, VAR_TEMP_x4002
	get_phone_book_rematch 28, VAR_TEMP_x4003
	get_phone_book_rematch 29, VAR_TEMP_x4004
	get_phone_book_rematch 30, VAR_TEMP_x4005
	get_phone_book_rematch 31, VAR_TEMP_x4006
	get_phone_book_rematch 32, VAR_TEMP_x4007
	get_phone_book_rematch 33, VAR_TEMP_x4008
	get_phone_book_rematch 34, VAR_TEMP_x4009
	get_phone_book_rematch 35, VAR_TEMP_x400A
	get_phone_book_rematch 18, VAR_TEMP_x400B
	get_phone_book_rematch 36, VAR_TEMP_x400C
	get_phone_book_rematch 37, VAR_TEMP_x400D
	get_phone_book_rematch 38, VAR_TEMP_x400E
	get_phone_book_rematch 39, VAR_TEMP_x400F
	comparevartovalue VAR_TEMP_x4003, 0
	gotoif ne, scr_seq_0832_T11R0101_00C9
	setflag FLAG_UNK_2B8
	goto scr_seq_0832_T11R0101_00CD

scr_seq_0832_T11R0101_00C9:
	clearflag FLAG_UNK_2B8
scr_seq_0832_T11R0101_00CD:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0832_T11R0101_00E4
	setflag FLAG_UNK_2B5
	goto scr_seq_0832_T11R0101_00E8

scr_seq_0832_T11R0101_00E4:
	clearflag FLAG_UNK_2B5
scr_seq_0832_T11R0101_00E8:
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0832_T11R0101_00FF
	setflag FLAG_UNK_2B6
	goto scr_seq_0832_T11R0101_0103

scr_seq_0832_T11R0101_00FF:
	clearflag FLAG_UNK_2B6
scr_seq_0832_T11R0101_0103:
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif ne, scr_seq_0832_T11R0101_011A
	setflag FLAG_UNK_2B7
	goto scr_seq_0832_T11R0101_011E

scr_seq_0832_T11R0101_011A:
	clearflag FLAG_UNK_2B7
scr_seq_0832_T11R0101_011E:
	comparevartovalue VAR_TEMP_x4004, 0
	gotoif ne, scr_seq_0832_T11R0101_0135
	setflag FLAG_UNK_2B9
	goto scr_seq_0832_T11R0101_0139

scr_seq_0832_T11R0101_0135:
	clearflag FLAG_UNK_2B9
scr_seq_0832_T11R0101_0139:
	comparevartovalue VAR_TEMP_x4005, 0
	gotoif ne, scr_seq_0832_T11R0101_0150
	setflag FLAG_UNK_2BA
	goto scr_seq_0832_T11R0101_0154

scr_seq_0832_T11R0101_0150:
	clearflag FLAG_UNK_2BA
scr_seq_0832_T11R0101_0154:
	comparevartovalue VAR_TEMP_x4006, 0
	gotoif ne, scr_seq_0832_T11R0101_016B
	setflag FLAG_UNK_2BB
	goto scr_seq_0832_T11R0101_016F

scr_seq_0832_T11R0101_016B:
	clearflag FLAG_UNK_2BB
scr_seq_0832_T11R0101_016F:
	comparevartovalue VAR_TEMP_x4007, 0
	gotoif ne, scr_seq_0832_T11R0101_0186
	setflag FLAG_UNK_2BC
	goto scr_seq_0832_T11R0101_018A

scr_seq_0832_T11R0101_0186:
	clearflag FLAG_UNK_2BC
scr_seq_0832_T11R0101_018A:
	comparevartovalue VAR_TEMP_x4008, 0
	gotoif ne, scr_seq_0832_T11R0101_01A1
	setflag FLAG_UNK_2BD
	goto scr_seq_0832_T11R0101_01A5

scr_seq_0832_T11R0101_01A1:
	clearflag FLAG_UNK_2BD
scr_seq_0832_T11R0101_01A5:
	comparevartovalue VAR_TEMP_x4009, 0
	gotoif ne, scr_seq_0832_T11R0101_01BC
	setflag FLAG_UNK_2BE
	goto scr_seq_0832_T11R0101_01C0

scr_seq_0832_T11R0101_01BC:
	clearflag FLAG_UNK_2BE
scr_seq_0832_T11R0101_01C0:
	comparevartovalue VAR_TEMP_x400A, 0
	gotoif ne, scr_seq_0832_T11R0101_01D7
	setflag FLAG_UNK_2BF
	goto scr_seq_0832_T11R0101_01DB

scr_seq_0832_T11R0101_01D7:
	clearflag FLAG_UNK_2BF
scr_seq_0832_T11R0101_01DB:
	comparevartovalue VAR_TEMP_x400B, 0
	gotoif ne, scr_seq_0832_T11R0101_01F2
	setflag FLAG_UNK_2C0
	goto scr_seq_0832_T11R0101_01F6

scr_seq_0832_T11R0101_01F2:
	clearflag FLAG_UNK_2C0
scr_seq_0832_T11R0101_01F6:
	comparevartovalue VAR_TEMP_x400C, 0
	gotoif ne, scr_seq_0832_T11R0101_020D
	setflag FLAG_UNK_2C1
	goto scr_seq_0832_T11R0101_0211

scr_seq_0832_T11R0101_020D:
	clearflag FLAG_UNK_2C1
scr_seq_0832_T11R0101_0211:
	comparevartovalue VAR_TEMP_x400D, 0
	gotoif ne, scr_seq_0832_T11R0101_0228
	setflag FLAG_UNK_2C2
	goto scr_seq_0832_T11R0101_022C

scr_seq_0832_T11R0101_0228:
	clearflag FLAG_UNK_2C2
scr_seq_0832_T11R0101_022C:
	comparevartovalue VAR_TEMP_x400E, 0
	gotoif ne, scr_seq_0832_T11R0101_0243
	setflag FLAG_UNK_2C3
	goto scr_seq_0832_T11R0101_0247

scr_seq_0832_T11R0101_0243:
	clearflag FLAG_UNK_2C3
scr_seq_0832_T11R0101_0247:
	comparevartovalue VAR_TEMP_x400F, 0
	gotoif ne, scr_seq_0832_T11R0101_025E
	setflag FLAG_UNK_2C4
	goto scr_seq_0832_T11R0101_0262

scr_seq_0832_T11R0101_025E:
	clearflag FLAG_UNK_2C4
scr_seq_0832_T11R0101_0262:
	end

scr_seq_0832_T11R0101_0264:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	closemsg
	trainer_battle TRAINER_LEADER_WHITNEY_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_02C1
	npc_msg 9
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 17
	setflag FLAG_UNK_2B5
	hide_person 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_02C1:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_02C7:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 30
	closemsg
	trainer_battle TRAINER_LEADER_JANINE_JANINE_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_0324
	npc_msg 31
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 26
	setflag FLAG_UNK_2B6
	hide_person 2
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_0324:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_032A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 18
	closemsg
	trainer_battle TRAINER_LEADER_CLAIR_CLAIR_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_0387
	npc_msg 19
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 27
	setflag FLAG_UNK_2B7
	hide_person 3
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_0387:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_038D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 24
	closemsg
	trainer_battle TRAINER_LEADER_ERIKA_ERIKA_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_03EA
	npc_msg 25
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 28
	setflag FLAG_UNK_2B8
	hide_person 4
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_03EA:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_03F0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 26
	closemsg
	trainer_battle TRAINER_LEADER_MISTY_MISTY_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_044D
	npc_msg 27
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 29
	setflag FLAG_UNK_2B9
	hide_person 5
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_044D:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_0453:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 32
	closemsg
	trainer_battle TRAINER_LEADER_BLAINE_BLAINE_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_04B0
	npc_msg 33
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 30
	setflag FLAG_UNK_2BA
	hide_person 16
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_04B0:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_04B6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 34
	closemsg
	trainer_battle TRAINER_LEADER_BLUE_BLUE_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_0513
	npc_msg 35
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 31
	setflag FLAG_UNK_2BB
	hide_person 6
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_0513:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_0519:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 10
	closemsg
	trainer_battle TRAINER_LEADER_CHUCK_CHUCK_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_0576
	npc_msg 11
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 32
	setflag FLAG_UNK_2BC
	hide_person 7
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_0576:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_057C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 28
	closemsg
	trainer_battle TRAINER_LEADER_BROCK_BROCK_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_05D9
	npc_msg 29
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 33
	setflag FLAG_UNK_2BD
	hide_person 8
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_05D9:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_05DF:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	closemsg
	trainer_battle TRAINER_LEADER_BUGSY_BUGSY_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_063C
	npc_msg 7
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 34
	setflag FLAG_UNK_2BE
	hide_person 9
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_063C:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_0642:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 22
	closemsg
	trainer_battle TRAINER_LEADER_SABRINA_SABRINA_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_069F
	npc_msg 23
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 35
	setflag FLAG_UNK_2BF
	hide_person 10
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_069F:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_06A5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	closemsg
	trainer_battle TRAINER_LEADER_FALKNER_FALKNER_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_0702
	npc_msg 5
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 18
	setflag FLAG_UNK_2C0
	hide_person 11
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_0702:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_0708:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 20
	closemsg
	trainer_battle TRAINER_LEADER_LT_SURGE_LT__SURGE_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_0765
	npc_msg 21
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 36
	setflag FLAG_UNK_2C1
	hide_person 12
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_0765:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_076B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 14
	closemsg
	trainer_battle TRAINER_LEADER_MORTY_MORTY_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_07C8
	npc_msg 15
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 37
	setflag FLAG_UNK_2C2
	hide_person 13
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_07C8:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_07CE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 12
	closemsg
	trainer_battle TRAINER_LEADER_JASMINE_JASMINE_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_082B
	npc_msg 13
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 38
	setflag FLAG_UNK_2C3
	hide_person 14
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_082B:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_0831:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 16
	closemsg
	trainer_battle TRAINER_LEADER_PRYCE_PRYCE_2, 0, 0, 0
	check_battle_won VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0832_T11R0101_088E
	npc_msg 17
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0x00
	wait_fade
	scrcmd_462 39
	setflag FLAG_UNK_2C4
	hide_person 15
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0x00
	wait_fade
	releaseall
	end

scr_seq_0832_T11R0101_088E:
	white_out
	releaseall
	end

scr_seq_0832_T11R0101_0894:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_10D
	gotoif TRUE, scr_seq_0832_T11R0101_08B2
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0832_T11R0101_08B2:
	npc_msg 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0832_T11R0101_08BD:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0832_T11R0101_08D0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
