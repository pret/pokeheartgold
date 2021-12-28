#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0948_T30R0601_0016 ; 000
	scrdef scr_seq_0948_T30R0601_0155 ; 001
	scrdef scr_seq_0948_T30R0601_0252 ; 002
	scrdef scr_seq_0948_T30R0601_045D ; 003
	scrdef scr_seq_0948_T30R0601_072F ; 004
	scrdef_end

scr_seq_0948_T30R0601_0016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_001
	gotoif TRUE, scr_seq_0948_T30R0601_0036
	npc_msg 0
	setflag FLAG_UNK_001
	goto scr_seq_0948_T30R0601_0036

scr_seq_0948_T30R0601_0036:
	npc_msg 1
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0948_T30R0601_005D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0948_T30R0601_014A
	end

scr_seq_0948_T30R0601_005D:
	npc_msg 2
	closemsg
	goto scr_seq_0948_T30R0601_0068

scr_seq_0948_T30R0601_0068:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32770
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8002, 255
	gotoif eq, scr_seq_0948_T30R0601_014A
	get_partymon_species VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, scr_seq_0948_T30R0601_0134
	scrcmd_396 32780, 32770
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0948_T30R0601_013F
	npc_msg 6
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_394 32770
	scrcmd_395 32769
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8001, 255
	gotoif eq, scr_seq_0948_T30R0601_005D
	scrcmd_399 0, 32770, 32769
	npc_msg 7
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0948_T30R0601_011D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0948_T30R0601_005D
	end

scr_seq_0948_T30R0601_011D:
	scrcmd_397 32770, 32769
	play_fanfare SEQ_ME_WASURE
	wait_fanfare
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_0134:
	npc_msg 5
	closemsg
	goto scr_seq_0948_T30R0601_0068

scr_seq_0948_T30R0601_013F:
	npc_msg 4
	closemsg
	goto scr_seq_0948_T30R0601_0068

scr_seq_0948_T30R0601_014A:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_0155:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_15E
	gotoif FALSE, scr_seq_0948_T30R0601_0238
	hasitem ITEM_HEART_SCALE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0948_T30R0601_022D
	npc_msg 10
	npc_msg 12
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32773
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8005, 255
	gotoif eq, scr_seq_0948_T30R0601_022D
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0948_T30R0601_0247
	scrcmd_466 32780, 32773
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0948_T30R0601_0222
	npc_msg 13
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_467 32773
	scrcmd_469 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0948_T30R0601_022D
	takeitem ITEM_HEART_SCALE, 1, VAR_SPECIAL_x800C
	buffer_players_name 3
	npc_msg 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_0222:
	npc_msg 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_022D:
	npc_msg 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_0238:
	npc_msg 9
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_15E
	end

scr_seq_0948_T30R0601_0247:
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_0252:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_186
	gotoif TRUE, scr_seq_0948_T30R0601_0287
	setflag FLAG_UNK_186
	npc_msg 26
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0948_T30R0601_02A5
	goto scr_seq_0948_T30R0601_02EC

scr_seq_0948_T30R0601_0287:
	npc_msg 27
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0948_T30R0601_02A5
	goto scr_seq_0948_T30R0601_02EC

scr_seq_0948_T30R0601_02A5:
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_02B0:
	npc_msg 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_02BB:
	npc_msg 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_02C6:
	npc_msg 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_02D1:
	scrcmd_197 0, 434
	npc_msg 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_02E1:
	npc_msg 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_02EC:
	get_party_count VAR_TEMP_x4000
scr_seq_0948_T30R0601_02F0:
	subvar VAR_TEMP_x4000, 1
	get_partymon_species VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0948_T30R0601_0346
	scrcmd_497 32772, 32773, 16384
	comparevartovalue VAR_SPECIAL_x8004, 16
	gotoif eq, scr_seq_0948_T30R0601_0331
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif eq, scr_seq_0948_T30R0601_0331
	goto scr_seq_0948_T30R0601_0346

scr_seq_0948_T30R0601_0331:
	scrcmd_140 32780, 434, 16384
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0948_T30R0601_0359
scr_seq_0948_T30R0601_0346:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0948_T30R0601_02F0
	goto scr_seq_0948_T30R0601_02B0

scr_seq_0948_T30R0601_0359:
	npc_msg 30
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_0948_T30R0601_02A5
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, scr_seq_0948_T30R0601_02C6
	call scr_seq_0948_T30R0601_042B
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0948_T30R0601_02BB
	scrcmd_140 32780, 434, 32768
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0948_T30R0601_02D1
	scrcmd_382 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif lt, scr_seq_0948_T30R0601_02E1
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	npc_msg 62
	closemsg
	setvar VAR_SPECIAL_x8003, 434
	goto scr_seq_0948_T30R0601_03EF

scr_seq_0948_T30R0601_03EF:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_468 32768, 434
	scrcmd_469 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0948_T30R0601_02A5
	npc_msg 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0948_T30R0601_042B:
	scrcmd_497 32772, 32773, 32768
	comparevartovalue VAR_SPECIAL_x8004, 16
	gotoif eq, scr_seq_0948_T30R0601_0455
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif eq, scr_seq_0948_T30R0601_0455
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_0948_T30R0601_0455:
	setvar VAR_SPECIAL_x800C, 1
	return

scr_seq_0948_T30R0601_045D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_187
	gotoif TRUE, scr_seq_0948_T30R0601_0490
	setflag FLAG_UNK_187
	npc_msg 43
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0948_T30R0601_04AC
	goto scr_seq_0948_T30R0601_06EE

scr_seq_0948_T30R0601_0490:
	npc_msg 44
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0948_T30R0601_04AC
	goto scr_seq_0948_T30R0601_06EE

scr_seq_0948_T30R0601_04AC:
	npc_msg 45
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_0948_T30R0601_06EE
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, scr_seq_0948_T30R0601_0708
	call scr_seq_0948_T30R0601_05F4
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0948_T30R0601_06FB
	copyvar VAR_SPECIAL_x8002, VAR_SPECIAL_x800C
	call scr_seq_0948_T30R0601_06B0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0948_T30R0601_0722
	scrcmd_382 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif lt, scr_seq_0948_T30R0601_0715
	buffer_mon_species_name 0, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x8002, 1
	gotoif eq, scr_seq_0948_T30R0601_0555
	comparevartovalue VAR_SPECIAL_x8002, 2
	gotoif eq, scr_seq_0948_T30R0601_0577
	goto scr_seq_0948_T30R0601_0599

scr_seq_0948_T30R0601_0555:
	npc_msg 52
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0948_T30R0601_06EE
	setvar VAR_SPECIAL_x8003, 307
	goto scr_seq_0948_T30R0601_05BB

scr_seq_0948_T30R0601_0577:
	npc_msg 53
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0948_T30R0601_06EE
	setvar VAR_SPECIAL_x8003, 308
	goto scr_seq_0948_T30R0601_05BB

scr_seq_0948_T30R0601_0599:
	npc_msg 54
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0948_T30R0601_06EE
	setvar VAR_SPECIAL_x8003, 338
	goto scr_seq_0948_T30R0601_05BB

scr_seq_0948_T30R0601_05BB:
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_468 32768, 32771
	scrcmd_469 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0948_T30R0601_06EE
	touchscreen_menu_show
	releaseall
	end

scr_seq_0948_T30R0601_05F4:
	comparevartovalue VAR_SPECIAL_x8001, 6
	gotoif eq, scr_seq_0948_T30R0601_0698
	comparevartovalue VAR_SPECIAL_x8001, 157
	gotoif eq, scr_seq_0948_T30R0601_0698
	comparevartovalue VAR_SPECIAL_x8001, 257
	gotoif eq, scr_seq_0948_T30R0601_0698
	comparevartovalue VAR_SPECIAL_x8001, 392
	gotoif eq, scr_seq_0948_T30R0601_0698
	comparevartovalue VAR_SPECIAL_x8001, 9
	gotoif eq, scr_seq_0948_T30R0601_06A0
	comparevartovalue VAR_SPECIAL_x8001, 160
	gotoif eq, scr_seq_0948_T30R0601_06A0
	comparevartovalue VAR_SPECIAL_x8001, 260
	gotoif eq, scr_seq_0948_T30R0601_06A0
	comparevartovalue VAR_SPECIAL_x8001, 395
	gotoif eq, scr_seq_0948_T30R0601_06A0
	comparevartovalue VAR_SPECIAL_x8001, 3
	gotoif eq, scr_seq_0948_T30R0601_06A8
	comparevartovalue VAR_SPECIAL_x8001, 154
	gotoif eq, scr_seq_0948_T30R0601_06A8
	comparevartovalue VAR_SPECIAL_x8001, 254
	gotoif eq, scr_seq_0948_T30R0601_06A8
	comparevartovalue VAR_SPECIAL_x8001, 389
	gotoif eq, scr_seq_0948_T30R0601_06A8
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_0948_T30R0601_0698:
	setvar VAR_SPECIAL_x800C, 1
	return

scr_seq_0948_T30R0601_06A0:
	setvar VAR_SPECIAL_x800C, 2
	return

scr_seq_0948_T30R0601_06A8:
	setvar VAR_SPECIAL_x800C, 3
	return

scr_seq_0948_T30R0601_06B0:
	comparevartovalue VAR_SPECIAL_x8002, 1
	gotoif eq, scr_seq_0948_T30R0601_06D0
	comparevartovalue VAR_SPECIAL_x8002, 2
	gotoif eq, scr_seq_0948_T30R0601_06DA
	goto scr_seq_0948_T30R0601_06E4

scr_seq_0948_T30R0601_06D0:
	scrcmd_140 32780, 307, 32768
	return

scr_seq_0948_T30R0601_06DA:
	scrcmd_140 32780, 308, 32768
	return

scr_seq_0948_T30R0601_06E4:
	scrcmd_140 32780, 338, 32768
	return

scr_seq_0948_T30R0601_06EE:
	npc_msg 46
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0948_T30R0601_06FB:
	npc_msg 48
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0948_T30R0601_0708:
	npc_msg 49
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0948_T30R0601_0715:
	npc_msg 50
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0948_T30R0601_0722:
	npc_msg 51
	waitbutton
	closemsg
	touchscreen_menu_show
	releaseall
	end

scr_seq_0948_T30R0601_072F:
	play_se SEQ_SE_DP_SELECT
	lockall
	npc_msg 61
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
