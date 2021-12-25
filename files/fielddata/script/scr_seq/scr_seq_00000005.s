#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000005_0000000E ; 000
	scrdef scr_seq_00000005_00000108 ; 001
	scrdef scr_seq_00000005_00000362 ; 002
	scrdef_end

scr_seq_00000005_0000000E:
	checkflag FLAG_UNK_189
	gotoif lt, scr_seq_00000005_0000001F
	clearflag FLAG_UNK_189
	end

scr_seq_00000005_0000001F:
	scrcmd_147 33, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000005_0000009E
	scrcmd_294 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_00000005_0000004D
	goto scr_seq_00000005_00000102

scr_seq_00000005_0000004B:
	.byte 0x02, 0x00
scr_seq_00000005_0000004D:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 12
	gotoif ne, scr_seq_00000005_00000068
	clearflag FLAG_UNK_262
	goto scr_seq_00000005_0000009C

scr_seq_00000005_00000068:
	comparevartovalue VAR_TEMP_x4000, 13
	gotoif ne, scr_seq_00000005_0000007F
	clearflag FLAG_UNK_262
	goto scr_seq_00000005_0000009C

scr_seq_00000005_0000007F:
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_00000005_00000096
	clearflag FLAG_UNK_262
	goto scr_seq_00000005_0000009C

scr_seq_00000005_00000096:
	goto scr_seq_00000005_00000102

scr_seq_00000005_0000009C:
	end

scr_seq_00000005_0000009E:
	scrcmd_142 33, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000005_00000102
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 17
	gotoif ne, scr_seq_00000005_000000CC
	clearflag FLAG_UNK_262
	goto scr_seq_00000005_00000100

scr_seq_00000005_000000CC:
	comparevartovalue VAR_TEMP_x4000, 18
	gotoif ne, scr_seq_00000005_000000E3
	clearflag FLAG_UNK_262
	goto scr_seq_00000005_00000100

scr_seq_00000005_000000E3:
	comparevartovalue VAR_TEMP_x4000, 19
	gotoif ne, scr_seq_00000005_000000FA
	clearflag FLAG_UNK_262
	goto scr_seq_00000005_00000100

scr_seq_00000005_000000FA:
	goto scr_seq_00000005_00000102

scr_seq_00000005_00000100:
	end

scr_seq_00000005_00000102:
	setflag FLAG_UNK_262
	end

scr_seq_00000005_00000108:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_147 33, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000005_000001B6
	comparevartovalue VAR_TEMP_x4003, 1
	gotoif ge, scr_seq_00000005_000001AB
	msgbox 1
scr_seq_00000005_00000133:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000005_00000157
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000005_0000019A
	end

scr_seq_00000005_00000157:
	scrcmd_190 0
	msgbox 2
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 33
	msgbox 3
	waitbutton
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	setflag FLAG_UNK_262
	hide_person 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end

scr_seq_00000005_0000019A:
	setvar VAR_TEMP_x4003, 1
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000005_000001AB:
	msgbox 5
	goto scr_seq_00000005_00000133

scr_seq_00000005_000001B4:
	.byte 0x02, 0x00
scr_seq_00000005_000001B6:
	scrcmd_484 VAR_SPECIAL_x8004
	comparevartovalue VAR_SPECIAL_x8004, 1
	gotoif ne, scr_seq_00000005_000001D8
	checkflag FLAG_UNK_165
	gotoif lt, scr_seq_00000005_00000292
	goto scr_seq_00000005_0000020E

scr_seq_00000005_000001D8:
	comparevartovalue VAR_SPECIAL_x8004, 4
	gotoif ne, scr_seq_00000005_000001F6
	checkflag FLAG_UNK_165
	gotoif lt, scr_seq_00000005_00000292
	goto scr_seq_00000005_0000020E

scr_seq_00000005_000001F6:
	comparevartovalue VAR_SPECIAL_x8004, 6
	gotoif ne, scr_seq_00000005_0000020E
	checkflag FLAG_UNK_165
	gotoif lt, scr_seq_00000005_00000292
scr_seq_00000005_0000020E:
	comparevartovalue VAR_TEMP_x4000, 55
	gotoif eq, scr_seq_00000005_00000357
	msgbox 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000005_0000027C
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000005_00000287
	msgbox 7
	closemsg
	setflag FLAG_UNK_189
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_615 86
	faceplayer
	lockall
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	clearflag FLAG_UNK_189
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000005_0000027C:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000005_00000287:
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000005_00000292:
	comparevartovalue VAR_TEMP_x4000, 111
	gotoif ne, scr_seq_00000005_000002A8
	msgbox 15
	goto scr_seq_00000005_000002AF

scr_seq_00000005_000002A8:
	scrcmd_190 0
	scrcmd_132 11, 12
scr_seq_00000005_000002AF:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000005_00000346
	msgbox 13
	closemsg
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_566
	scrcmd_351 32780
	scrcmd_150
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	comparevartovalue VAR_SPECIAL_x800C, 255
	gotoif eq, scr_seq_00000005_00000346
	scrcmd_470 11
	copyvar VAR_SPECIAL_x8004, VAR_SPECIAL_x800C
	get_partymon_species VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	scrcmd_472 32780
	comparevartovar VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	gotoif ne, scr_seq_00000005_00000339
	scrcmd_473 32772
	scrcmd_474
	scrcmd_139 32772, 0, 422
	setflag FLAG_UNK_165
	setvar VAR_TEMP_x4000, 55
	msgbox 16
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000005_00000339:
	scrcmd_474
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000005_00000346:
	msgbox 14
	waitbutton
	closemsg
	releaseall
	setvar VAR_TEMP_x4000, 111
	end

scr_seq_00000005_00000357:
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000005_00000362:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
