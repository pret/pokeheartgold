#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0005_D01R0101_000E ; 000
	scrdef scr_seq_0005_D01R0101_0108 ; 001
	scrdef scr_seq_0005_D01R0101_0362 ; 002
	scrdef_end

scr_seq_0005_D01R0101_000E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0005_D01R0101_001F
	clearflag FLAG_UNK_189
	end

scr_seq_0005_D01R0101_001F:
	scrcmd_147 33, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0005_D01R0101_009E
	check_badge 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_0005_D01R0101_004D
	goto scr_seq_0005_D01R0101_0102

scr_seq_0005_D01R0101_004B:
	.byte 0x02, 0x00
scr_seq_0005_D01R0101_004D:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_0005_D01R0101_0068
	clearflag FLAG_UNK_262
	goto scr_seq_0005_D01R0101_009C

scr_seq_0005_D01R0101_0068:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_0005_D01R0101_007F
	clearflag FLAG_UNK_262
	goto scr_seq_0005_D01R0101_009C

scr_seq_0005_D01R0101_007F:
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_0005_D01R0101_0096
	clearflag FLAG_UNK_262
	goto scr_seq_0005_D01R0101_009C

scr_seq_0005_D01R0101_0096:
	goto scr_seq_0005_D01R0101_0102

scr_seq_0005_D01R0101_009C:
	end

scr_seq_0005_D01R0101_009E:
	get_phone_book_rematch 33, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0005_D01R0101_0102
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_0005_D01R0101_00CC
	clearflag FLAG_UNK_262
	goto scr_seq_0005_D01R0101_0100

scr_seq_0005_D01R0101_00CC:
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_0005_D01R0101_00E3
	clearflag FLAG_UNK_262
	goto scr_seq_0005_D01R0101_0100

scr_seq_0005_D01R0101_00E3:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_0005_D01R0101_00FA
	clearflag FLAG_UNK_262
	goto scr_seq_0005_D01R0101_0100

scr_seq_0005_D01R0101_00FA:
	goto scr_seq_0005_D01R0101_0102

scr_seq_0005_D01R0101_0100:
	end

scr_seq_0005_D01R0101_0102:
	setflag FLAG_UNK_262
	end

scr_seq_0005_D01R0101_0108:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 33, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0005_D01R0101_01B6
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif ge, scr_seq_0005_D01R0101_01AB
	npc_msg 1
scr_seq_0005_D01R0101_0133:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0005_D01R0101_0157
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0005_D01R0101_019A
	end

scr_seq_0005_D01R0101_0157:
	buffer_players_name 0
	npc_msg 2
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	register_gear_number 33
	npc_msg 3
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_262
	hide_person 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_0005_D01R0101_019A:
	setvar VAR_TEMP_x4003, 1
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0005_D01R0101_01AB:
	npc_msg 5
	goto scr_seq_0005_D01R0101_0133

scr_seq_0005_D01R0101_01B4:
	.byte 0x02, 0x00
scr_seq_0005_D01R0101_01B6:
	get_weekday VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_0005_D01R0101_01D8
	checkflag FLAG_UNK_165
	gotoif FALSE, scr_seq_0005_D01R0101_0292
	goto scr_seq_0005_D01R0101_020E

scr_seq_0005_D01R0101_01D8:
	comparevartovalue VAR_SPECIAL_x8004, 4
	gotoif ne, scr_seq_0005_D01R0101_01F6
	checkflag FLAG_UNK_165
	gotoif FALSE, scr_seq_0005_D01R0101_0292
	goto scr_seq_0005_D01R0101_020E

scr_seq_0005_D01R0101_01F6:
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif ne, scr_seq_0005_D01R0101_020E
	checkflag FLAG_UNK_165
	gotoif FALSE, scr_seq_0005_D01R0101_0292
scr_seq_0005_D01R0101_020E:
	comparevartovalue VAR_TEMP_x4000, 55
	gotoif eq, scr_seq_0005_D01R0101_0357
	npc_msg 6
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0005_D01R0101_027C
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0005_D01R0101_0287
	npc_msg 7
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 86
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0005_D01R0101_027C:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0005_D01R0101_0287:
	npc_msg 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0005_D01R0101_0292:
	comparevartovalue VAR_TEMP_x4000, 111
	gotoif ne, scr_seq_0005_D01R0101_02A8
	npc_msg 15
	goto scr_seq_0005_D01R0101_02AF

scr_seq_0005_D01R0101_02A8:
	buffer_players_name 0
	gender_msgbox 11, 12
scr_seq_0005_D01R0101_02AF:
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0005_D01R0101_0346
	npc_msg 13
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0005_D01R0101_0346
	scrcmd_470 11
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_0005_D01R0101_0339
	scrcmd_473 32772
	scrcmd_474
	set_mon_move VAR_SPECIAL_x8004, 0, MOVE_THUNDER_FANG
	setflag FLAG_UNK_165
	setvar VAR_TEMP_x4000, 55
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0005_D01R0101_0339:
	scrcmd_474
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0005_D01R0101_0346:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	setvar VAR_TEMP_x4000, 111
	end

scr_seq_0005_D01R0101_0357:
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0005_D01R0101_0362:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
