#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000948_00000016 ; 000
	scrdef scr_seq_00000948_00000155 ; 001
	scrdef scr_seq_00000948_00000252 ; 002
	scrdef scr_seq_00000948_0000045D ; 003
	scrdef scr_seq_00000948_0000072F ; 004
	scrdef_end

scr_seq_00000948_00000016:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_001
	gotoif TRUE, scr_seq_00000948_00000036
	msgbox 0
	setflag FLAG_UNK_001
	goto scr_seq_00000948_00000036

scr_seq_00000948_00000036:
	msgbox 1
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000948_0000005D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000948_0000014A
	end

scr_seq_00000948_0000005D:
	msgbox 2
	closemsg
	goto scr_seq_00000948_00000068

scr_seq_00000948_00000068:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32770
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8002, 255
	gotoif eq, scr_seq_00000948_0000014A
	get_partymon_species VAR_SPECIAL_x8002, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, scr_seq_00000948_00000134
	scrcmd_396 32780, 32770
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000948_0000013F
	msgbox 6
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_394 32770
	scrcmd_395 32769
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8001, 255
	gotoif eq, scr_seq_00000948_0000005D
	scrcmd_399 0, 32770, 32769
	msgbox 7
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000948_0000011D
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000948_0000005D
	end

scr_seq_00000948_0000011D:
	scrcmd_397 32770, 32769
	play_fanfare SEQ_ME_WASURE
	wait_fanfare
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_00000134:
	msgbox 5
	closemsg
	goto scr_seq_00000948_00000068

scr_seq_00000948_0000013F:
	msgbox 4
	closemsg
	goto scr_seq_00000948_00000068

scr_seq_00000948_0000014A:
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_00000155:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_15E
	gotoif FALSE, scr_seq_00000948_00000238
	hasitem ITEM_HEART_SCALE, 1, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000948_0000022D
	msgbox 10
	msgbox 12
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32773
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8005, 255
	gotoif eq, scr_seq_00000948_0000022D
	get_partymon_species VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000948_00000247
	scrcmd_466 32780, 32773
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000948_00000222
	msgbox 13
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_467 32773
	scrcmd_469 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000948_0000022D
	takeitem ITEM_HEART_SCALE, 1, VAR_SPECIAL_x800C
	buffer_players_name 3
	msgbox 25
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_00000222:
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_0000022D:
	msgbox 11
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_00000238:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	setflag FLAG_UNK_15E
	end

scr_seq_00000948_00000247:
	msgbox 15
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_00000252:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_186
	gotoif TRUE, scr_seq_00000948_00000287
	setflag FLAG_UNK_186
	msgbox 26
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000948_000002A5
	goto scr_seq_00000948_000002EC

scr_seq_00000948_00000287:
	msgbox 27
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000948_000002A5
	goto scr_seq_00000948_000002EC

scr_seq_00000948_000002A5:
	msgbox 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_000002B0:
	msgbox 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_000002BB:
	msgbox 32
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_000002C6:
	msgbox 33
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_000002D1:
	scrcmd_197 0, 434
	msgbox 34
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_000002E1:
	msgbox 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_000002EC:
	get_party_count VAR_TEMP_x4000
scr_seq_00000948_000002F0:
	subvar VAR_TEMP_x4000, 1
	get_partymon_species VAR_TEMP_x4000, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000948_00000346
	scrcmd_497 32772, 32773, 16384
	comparevartovalue VAR_SPECIAL_x8004, 16
	gotoif eq, scr_seq_00000948_00000331
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif eq, scr_seq_00000948_00000331
	goto scr_seq_00000948_00000346

scr_seq_00000948_00000331:
	scrcmd_140 32780, 434, 16384
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000948_00000359
scr_seq_00000948_00000346:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000948_000002F0
	goto scr_seq_00000948_000002B0

scr_seq_00000948_00000359:
	msgbox 30
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_00000948_000002A5
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, scr_seq_00000948_000002C6
	call scr_seq_00000948_0000042B
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000948_000002BB
	scrcmd_140 32780, 434, 32768
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000948_000002D1
	scrcmd_382 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif lt, scr_seq_00000948_000002E1
	scrcmd_193 0, 32768
	msgbox 62
	closemsg
	setvar VAR_SPECIAL_x8003, 434
	goto scr_seq_00000948_000003EF

scr_seq_00000948_000003EF:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_468 32768, 434
	scrcmd_469 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000948_000002A5
	msgbox 42
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000948_0000042B:
	scrcmd_497 32772, 32773, 32768
	comparevartovalue VAR_SPECIAL_x8004, 16
	gotoif eq, scr_seq_00000948_00000455
	comparevartovalue VAR_SPECIAL_x8005, 16
	gotoif eq, scr_seq_00000948_00000455
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_00000948_00000455:
	setvar VAR_SPECIAL_x800C, 1
	return

scr_seq_00000948_0000045D:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_187
	gotoif TRUE, scr_seq_00000948_00000490
	setflag FLAG_UNK_187
	msgbox 43
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000948_000004AC
	goto scr_seq_00000948_000006EE

scr_seq_00000948_00000490:
	msgbox 44
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000948_000004AC
	goto scr_seq_00000948_000006EE

scr_seq_00000948_000004AC:
	msgbox 45
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_349
	scrcmd_351 32768
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x8000, 255
	gotoif eq, scr_seq_00000948_000006EE
	get_partymon_species VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8001, 0
	gotoif eq, scr_seq_00000948_00000708
	call scr_seq_00000948_000005F4
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000948_000006FB
	copyvar VAR_SPECIAL_x8002, VAR_SPECIAL_x800C
	call scr_seq_00000948_000006B0
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000948_00000722
	scrcmd_382 VAR_SPECIAL_x800C, VAR_SPECIAL_x8000
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif lt, scr_seq_00000948_00000715
	scrcmd_193 0, 32768
	comparevartovalue VAR_SPECIAL_x8002, 1
	gotoif eq, scr_seq_00000948_00000555
	comparevartovalue VAR_SPECIAL_x8002, 2
	gotoif eq, scr_seq_00000948_00000577
	goto scr_seq_00000948_00000599

scr_seq_00000948_00000555:
	msgbox 52
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000948_000006EE
	setvar VAR_SPECIAL_x8003, 307
	goto scr_seq_00000948_000005BB

scr_seq_00000948_00000577:
	msgbox 53
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000948_000006EE
	setvar VAR_SPECIAL_x8003, 308
	goto scr_seq_00000948_000005BB

scr_seq_00000948_00000599:
	msgbox 54
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000948_000006EE
	setvar VAR_SPECIAL_x8003, 338
	goto scr_seq_00000948_000005BB

scr_seq_00000948_000005BB:
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_468 32768, 32771
	scrcmd_469 32780
	scrcmd_150
	fade_screen 6, 1, 1, 0
	wait_fade
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000948_000006EE
	scrcmd_747
	releaseall
	end

scr_seq_00000948_000005F4:
	comparevartovalue VAR_SPECIAL_x8001, 6
	gotoif eq, scr_seq_00000948_00000698
	comparevartovalue VAR_SPECIAL_x8001, 157
	gotoif eq, scr_seq_00000948_00000698
	comparevartovalue VAR_SPECIAL_x8001, 257
	gotoif eq, scr_seq_00000948_00000698
	comparevartovalue VAR_SPECIAL_x8001, 392
	gotoif eq, scr_seq_00000948_00000698
	comparevartovalue VAR_SPECIAL_x8001, 9
	gotoif eq, scr_seq_00000948_000006A0
	comparevartovalue VAR_SPECIAL_x8001, 160
	gotoif eq, scr_seq_00000948_000006A0
	comparevartovalue VAR_SPECIAL_x8001, 260
	gotoif eq, scr_seq_00000948_000006A0
	comparevartovalue VAR_SPECIAL_x8001, 395
	gotoif eq, scr_seq_00000948_000006A0
	comparevartovalue VAR_SPECIAL_x8001, 3
	gotoif eq, scr_seq_00000948_000006A8
	comparevartovalue VAR_SPECIAL_x8001, 154
	gotoif eq, scr_seq_00000948_000006A8
	comparevartovalue VAR_SPECIAL_x8001, 254
	gotoif eq, scr_seq_00000948_000006A8
	comparevartovalue VAR_SPECIAL_x8001, 389
	gotoif eq, scr_seq_00000948_000006A8
	setvar VAR_SPECIAL_x800C, 0
	return

scr_seq_00000948_00000698:
	setvar VAR_SPECIAL_x800C, 1
	return

scr_seq_00000948_000006A0:
	setvar VAR_SPECIAL_x800C, 2
	return

scr_seq_00000948_000006A8:
	setvar VAR_SPECIAL_x800C, 3
	return

scr_seq_00000948_000006B0:
	comparevartovalue VAR_SPECIAL_x8002, 1
	gotoif eq, scr_seq_00000948_000006D0
	comparevartovalue VAR_SPECIAL_x8002, 2
	gotoif eq, scr_seq_00000948_000006DA
	goto scr_seq_00000948_000006E4

scr_seq_00000948_000006D0:
	scrcmd_140 32780, 307, 32768
	return

scr_seq_00000948_000006DA:
	scrcmd_140 32780, 308, 32768
	return

scr_seq_00000948_000006E4:
	scrcmd_140 32780, 338, 32768
	return

scr_seq_00000948_000006EE:
	msgbox 46
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000948_000006FB:
	msgbox 48
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000948_00000708:
	msgbox 49
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000948_00000715:
	msgbox 50
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000948_00000722:
	msgbox 51
	waitbutton
	closemsg
	scrcmd_747
	releaseall
	end

scr_seq_00000948_0000072F:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 61
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
