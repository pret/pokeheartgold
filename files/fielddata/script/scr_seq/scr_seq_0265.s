#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0265_000A ; 000
	scrdef scr_seq_0265_0232 ; 001
	scrdef_end

scr_seq_0265_000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_312
	scrcmd_313 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0265_0094
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0265_0151
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0265_015E
	comparevartovalue VAR_UNK_408E, 4
	gotoif eq, scr_seq_0265_0057
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0265_0057:
	buffer_players_name 0
	gender_msgbox 13, 14
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	touchscreen_menu_show
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0265_0082
	setflag FLAG_UNK_99E
	npc_msg 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0265_0082:
	clearflag FLAG_UNK_99E
	scrcmd_149 5
	npc_msg 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0265_0094:
	scrcmd_149 5
	npc_msg 1
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_00F6
	npc_msg 10
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_00F6
	touchscreen_menu_show
	clearflag FLAG_UNK_067
	scrcmd_365
	comparevartovalue VAR_UNK_408E, 3
	gotoif ne, scr_seq_0265_00EB
	npc_msg 12
	setvar VAR_UNK_408E, 4
	setflag FLAG_UNK_992
	goto scr_seq_0265_0057

scr_seq_0265_00EB:
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0265_00F6:
	touchscreen_menu_show
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif ne, scr_seq_0265_0114
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0265_0114:
	buffer_players_name 0
	npc_msg 5
	play_fanfare SEQ_ME_TAMAGO_GET
	wait_fanfare
	scrcmd_366
	clearflag FLAG_UNK_067
	comparevartovalue VAR_UNK_408E, 3
	gotoif ne, scr_seq_0265_0146
	npc_msg 11
	setvar VAR_UNK_408E, 4
	setflag FLAG_UNK_992
	goto scr_seq_0265_0057

scr_seq_0265_0146:
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0265_0151:
	scrcmd_312
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0265_015E:
	scrcmd_312
	npc_msg 9
	scrcmd_387 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_0196
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0265_01BD
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0265_01E4
	goto scr_seq_0265_020B

scr_seq_0265_0194:
	.byte 0x02, 0x00
scr_seq_0265_0196:
	comparevartovalue VAR_UNK_408E, 4
	gotoif ne, scr_seq_0265_01B2
	npc_msg 47
	goto scr_seq_0265_0057

scr_seq_0265_01AC:
	.byte 0x16, 0x00, 0x03, 0x00
	.byte 0x00, 0x00
scr_seq_0265_01B2:
	npc_msg 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0265_01BD:
	comparevartovalue VAR_UNK_408E, 4
	gotoif ne, scr_seq_0265_01D9
	npc_msg 48
	goto scr_seq_0265_0057

scr_seq_0265_01D3:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0265_01D9:
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0265_01E4:
	comparevartovalue VAR_UNK_408E, 4
	gotoif ne, scr_seq_0265_0200
	npc_msg 49
	goto scr_seq_0265_0057

scr_seq_0265_01FA:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0265_0200:
	npc_msg 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0265_020B:
	comparevartovalue VAR_UNK_408E, 4
	gotoif ne, scr_seq_0265_0227
	npc_msg 50
	goto scr_seq_0265_0057

scr_seq_0265_0221:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_0265_0227:
	npc_msg 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0265_0232:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_113 20, 2
	scrcmd_313 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0265_042E
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0265_0455
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_0265_0620
	npc_msg 21
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_0290
	touchscreen_menu_show
	npc_msg 26
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0265_0290:
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0265_03FB
	scrcmd_358 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0265_041F
	npc_msg 22
	closemsg
	scrcmd_114
	fade_screen 6, 1, 0, 0
	wait_fade
	setvar VAR_SPECIAL_x800C, 0
scr_seq_0265_02CB:
	scrcmd_551 32780
	scrcmd_552 32768, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_02F4
	scrcmd_352 0, 32768, 0
	scrcmd_353 0, 32780
	goto scr_seq_0265_02CB

scr_seq_0265_02F4:
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_0265_03C6
	scrcmd_690 32768, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_0265_03A1
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_03B1
	count_alive_mons VAR_SPECIAL_x800C, 32768
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_040A
	scrcmd_373 32768
	call scr_seq_0265_038B
	scrcmd_372 32769
	setflag FLAG_UNK_068
	scrcmd_313 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0265_0363
	goto scr_seq_0265_0374

scr_seq_0265_0363:
	scrcmd_076 32769, 0
	npc_msg 23
	scrcmd_077
	goto scr_seq_0265_03DB

scr_seq_0265_0374:
	touchscreen_menu_show
	scrcmd_076 32769, 0
	npc_msg 41
	waitbutton
	closemsg
	scrcmd_077
	scrcmd_114
	releaseall
	end

scr_seq_0265_038B:
	scrcmd_150
	scrcmd_113 20, 2
	fade_screen 6, 1, 1, 0
	wait_fade
	return

scr_seq_0265_03A1:
	call scr_seq_0265_038B
	touchscreen_menu_show
	scrcmd_114
	callstd 2041
	end

scr_seq_0265_03B1:
	call scr_seq_0265_038B
	touchscreen_menu_show
	npc_msg 40
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0265_03C6:
	call scr_seq_0265_038B
	touchscreen_menu_show
scr_seq_0265_03CE:
	npc_msg 29
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0265_03DB:
	npc_msg 24
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_0290
	touchscreen_menu_show
	goto scr_seq_0265_03CE

scr_seq_0265_03F9:
	.byte 0x02, 0x00
scr_seq_0265_03FB:
	touchscreen_menu_show
	npc_msg 36
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0265_040A:
	call scr_seq_0265_038B
	touchscreen_menu_show
	npc_msg 38
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0265_041F:
	touchscreen_menu_show
	npc_msg 39
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0265_042E:
	npc_msg 25
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0265_043B:
	npc_msg 31
	return

scr_seq_0265_0440:
	scrcmd_371 32780, 32768
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif ne, scr_seq_0265_043B
	return

scr_seq_0265_0455:
	npc_msg 30
	setvar VAR_SPECIAL_x8000, 0
	call scr_seq_0265_0440
	npc_msg 24
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_0290
	npc_msg 37
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_0498
	touchscreen_menu_show
	goto scr_seq_0265_03CE

scr_seq_0265_0498:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_0265_05DC
	scrcmd_313 32780
	setvar VAR_SPECIAL_x8001, 0
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0265_0520
	touchscreen_menu_hide
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x8001
	scrcmd_385 0, 1, 2, 0
	scrcmd_751 136, 255, 0
	scrcmd_385 0, 1, 2, 1
	scrcmd_751 137, 255, 1
	scrcmd_751 138, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_0265_0520
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_0265_0520
	touchscreen_menu_show
	goto scr_seq_0265_03CE

scr_seq_0265_0520:
	scrcmd_367 32772, 32769
	npc_msg 33
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_0544
	touchscreen_menu_show
	goto scr_seq_0265_03CE

scr_seq_0265_0544:
	hasenoughmoneyvar 32780, 32772
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0265_0566
	touchscreen_menu_show
	npc_msg 27
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0265_0566:
	scrcmd_361 32770, 32769
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_715
	fade_screen 6, 1, 1, 0
	wait_fade
	submoneyvar 32772
	scrcmd_115
	play_se SEQ_SE_DP_REGI
	wait_se SEQ_SE_DP_REGI
	npc_msg 34
	scrcmd_076 32770, 0
	buffer_players_name 1
	npc_msg 35
	scrcmd_077
	scrcmd_313 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_0265_05BE
	touchscreen_menu_show
	goto scr_seq_0265_03CE

scr_seq_0265_05BE:
	npc_msg 28
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_0498
	touchscreen_menu_show
	goto scr_seq_0265_03CE

scr_seq_0265_05DC:
	touchscreen_menu_show
	npc_msg 32
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0265_05EB:
	.byte 0x00, 0x3e, 0x00, 0x03, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x3e, 0x00, 0x03, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3e, 0x00, 0x03, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x45, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x03, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x46, 0x00, 0x01, 0x00, 0x0d, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_0265_0620:
	npc_msg 30
	setvar VAR_SPECIAL_x8000, 0
	call scr_seq_0265_0440
	setvar VAR_SPECIAL_x8000, 1
	call scr_seq_0265_0440
	npc_msg 37
	touchscreen_menu_hide
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0265_0498
	touchscreen_menu_show
	npc_msg 29
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_0265_0660:
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x2d, 0x00, 0x2a, 0x71, 0x01, 0x35, 0x00, 0x72, 0x00, 0x61
	.byte 0x00, 0x02, 0x00, 0x00
	.balign 4, 0
