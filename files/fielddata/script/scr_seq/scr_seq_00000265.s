#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000265_0000000A ; 000
	scrdef scr_seq_00000265_00000232 ; 001
	scrdef_end

scr_seq_00000265_0000000A:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_312
	scrcmd_313 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000265_00000094
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000265_00000151
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000265_0000015E
	comparevartovalue VAR_UNK_408E, 4
	gotoif eq, scr_seq_00000265_00000057
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000265_00000057:
	buffer_players_name 0
	gender_msgbox 13, 14
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000265_00000082
	setflag FLAG_UNK_99E
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000265_00000082:
	clearflag FLAG_UNK_99E
	scrcmd_149 5
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000265_00000094:
	scrcmd_149 5
	msgbox 1
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_000000F6
	msgbox 10
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_000000F6
	scrcmd_747
	clearflag FLAG_UNK_067
	scrcmd_365
	comparevartovalue VAR_UNK_408E, 3
	gotoif ne, scr_seq_00000265_000000EB
	msgbox 12
	setvar VAR_UNK_408E, 4
	setflag FLAG_UNK_992
	goto scr_seq_00000265_00000057

scr_seq_00000265_000000EB:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000265_000000F6:
	scrcmd_747
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif ne, scr_seq_00000265_00000114
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000265_00000114:
	buffer_players_name 0
	msgbox 5
	play_fanfare SEQ_ME_TAMAGO_GET
	wait_fanfare
	scrcmd_366
	clearflag FLAG_UNK_067
	comparevartovalue VAR_UNK_408E, 3
	gotoif ne, scr_seq_00000265_00000146
	msgbox 11
	setvar VAR_UNK_408E, 4
	setflag FLAG_UNK_992
	goto scr_seq_00000265_00000057

scr_seq_00000265_00000146:
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000265_00000151:
	scrcmd_312
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000265_0000015E:
	scrcmd_312
	msgbox 9
	scrcmd_387 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_00000196
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000265_000001BD
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000265_000001E4
	goto scr_seq_00000265_0000020B

scr_seq_00000265_00000194:
	.byte 0x02, 0x00
scr_seq_00000265_00000196:
	comparevartovalue VAR_UNK_408E, 4
	gotoif ne, scr_seq_00000265_000001B2
	msgbox 47
	goto scr_seq_00000265_00000057

scr_seq_00000265_000001AC:
	.byte 0x16, 0x00, 0x03, 0x00
	.byte 0x00, 0x00
scr_seq_00000265_000001B2:
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000265_000001BD:
	comparevartovalue VAR_UNK_408E, 4
	gotoif ne, scr_seq_00000265_000001D9
	msgbox 48
	goto scr_seq_00000265_00000057

scr_seq_00000265_000001D3:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_00000265_000001D9:
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000265_000001E4:
	comparevartovalue VAR_UNK_408E, 4
	gotoif ne, scr_seq_00000265_00000200
	msgbox 49
	goto scr_seq_00000265_00000057

scr_seq_00000265_000001FA:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_00000265_00000200:
	msgbox 19
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000265_0000020B:
	comparevartovalue VAR_UNK_408E, 4
	gotoif ne, scr_seq_00000265_00000227
	msgbox 50
	goto scr_seq_00000265_00000057

scr_seq_00000265_00000221:
	.byte 0x16, 0x00, 0x03, 0x00, 0x00, 0x00
scr_seq_00000265_00000227:
	msgbox 20
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000265_00000232:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_113 20, 2
	scrcmd_313 32780
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000265_0000042E
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000265_00000455
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif eq, scr_seq_00000265_00000620
	msgbox 21
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_00000290
	scrcmd_747
	msgbox 26
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000265_00000290:
	party_count_not_egg VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000265_000003FB
	scrcmd_358 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000265_0000041F
	msgbox 22
	closemsg
	scrcmd_114
	fade_screen 6, 1, 0, 0
	wait_fade
	setvar VAR_SPECIAL_x800C, 0
scr_seq_00000265_000002CB:
	scrcmd_551 32780
	scrcmd_552 32768, 32780
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_000002F4
	scrcmd_352 0, 32768, 0
	scrcmd_353 0, 32780
	goto scr_seq_00000265_000002CB

scr_seq_00000265_000002F4:
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_00000265_000003C6
	scrcmd_690 32768, 32780
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000265_000003A1
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_000003B1
	scrcmd_357 32780, 32768
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_0000040A
	scrcmd_373 32768
	call scr_seq_00000265_0000038B
	scrcmd_372 32769
	setflag FLAG_UNK_068
	scrcmd_313 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000265_00000363
	goto scr_seq_00000265_00000374

scr_seq_00000265_00000363:
	scrcmd_076 32769, 0
	msgbox 23
	scrcmd_077
	goto scr_seq_00000265_000003DB

scr_seq_00000265_00000374:
	scrcmd_747
	scrcmd_076 32769, 0
	msgbox 41
	waitbutton
	closemsg
	scrcmd_077
	scrcmd_114
	releaseall
	end

scr_seq_00000265_0000038B:
	scrcmd_150
	scrcmd_113 20, 2
	fade_screen 6, 1, 1, 0
	wait_fade
	return

scr_seq_00000265_000003A1:
	call scr_seq_00000265_0000038B
	scrcmd_747
	scrcmd_114
	callstd 2041
	end

scr_seq_00000265_000003B1:
	call scr_seq_00000265_0000038B
	scrcmd_747
	msgbox 40
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000265_000003C6:
	call scr_seq_00000265_0000038B
	scrcmd_747
scr_seq_00000265_000003CE:
	msgbox 29
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000265_000003DB:
	msgbox 24
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_00000290
	scrcmd_747
	goto scr_seq_00000265_000003CE

scr_seq_00000265_000003F9:
	.byte 0x02, 0x00
scr_seq_00000265_000003FB:
	scrcmd_747
	msgbox 36
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000265_0000040A:
	call scr_seq_00000265_0000038B
	scrcmd_747
	msgbox 38
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000265_0000041F:
	scrcmd_747
	msgbox 39
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000265_0000042E:
	msgbox 25
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000265_0000043B:
	msgbox 31
	return

scr_seq_00000265_00000440:
	scrcmd_371 32780, 32768
	comparevartovalue VAR_SPECIAL_x800C, 0
	callif ne, scr_seq_00000265_0000043B
	return

scr_seq_00000265_00000455:
	msgbox 30
	setvar VAR_SPECIAL_x8000, 0
	call scr_seq_00000265_00000440
	msgbox 24
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_00000290
	msgbox 37
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_00000498
	scrcmd_747
	goto scr_seq_00000265_000003CE

scr_seq_00000265_00000498:
	get_party_count VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 6
	gotoif eq, scr_seq_00000265_000005DC
	scrcmd_313 32780
	setvar VAR_SPECIAL_x8001, 0
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000265_00000520
	scrcmd_746
	scrcmd_749 1, 1, 0, 1, VAR_SPECIAL_x8001
	scrcmd_385 0, 1, 2, 0
	scrcmd_751 136, 255, 0
	scrcmd_385 0, 1, 2, 1
	scrcmd_751 137, 255, 1
	scrcmd_751 138, 255, 2
	scrcmd_752
	copyvar VAR_SPECIAL_x8008, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8008, 0
	gotoif eq, scr_seq_00000265_00000520
	comparevartovalue VAR_SPECIAL_x8008, 1
	gotoif eq, scr_seq_00000265_00000520
	scrcmd_747
	goto scr_seq_00000265_000003CE

scr_seq_00000265_00000520:
	scrcmd_367 32772, 32769
	msgbox 33
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_00000544
	scrcmd_747
	goto scr_seq_00000265_000003CE

scr_seq_00000265_00000544:
	hasenoughmoneyvar 32780, 32772
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000265_00000566
	scrcmd_747
	msgbox 27
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000265_00000566:
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
	msgbox 34
	scrcmd_076 32770, 0
	buffer_players_name 1
	msgbox 35
	scrcmd_077
	scrcmd_313 32780
	comparevartovalue VAR_SPECIAL_x800C, 2
	gotoif eq, scr_seq_00000265_000005BE
	scrcmd_747
	goto scr_seq_00000265_000003CE

scr_seq_00000265_000005BE:
	msgbox 28
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_00000498
	scrcmd_747
	goto scr_seq_00000265_000003CE

scr_seq_00000265_000005DC:
	scrcmd_747
	msgbox 32
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000265_000005EB:
	.byte 0x00, 0x3e, 0x00, 0x03, 0x00
	.byte 0x02, 0x00, 0x01, 0x00, 0x3e, 0x00, 0x03, 0x00, 0x03, 0x00, 0x01, 0x00, 0x3e, 0x00, 0x03, 0x00
	.byte 0x00, 0x00, 0x01, 0x00, 0x0c, 0x00, 0x02, 0x00, 0x45, 0x00, 0x01, 0x00, 0x3f, 0x00, 0x03, 0x00
	.byte 0x01, 0x00, 0x01, 0x00, 0x46, 0x00, 0x01, 0x00, 0x0d, 0x00, 0x02, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000265_00000620:
	msgbox 30
	setvar VAR_SPECIAL_x8000, 0
	call scr_seq_00000265_00000440
	setvar VAR_SPECIAL_x8000, 1
	call scr_seq_00000265_00000440
	msgbox 37
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000265_00000498
	scrcmd_747
	msgbox 29
	waitbutton
	closemsg
	scrcmd_114
	releaseall
	end

scr_seq_00000265_00000660:
	.byte 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x2d, 0x00, 0x2a, 0x71, 0x01, 0x35, 0x00, 0x72, 0x00, 0x61
	.byte 0x00, 0x02, 0x00, 0x00
	.balign 4, 0
