#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000875_0000023F ; 000
	scrdef scr_seq_00000875_0000013C ; 001
	scrdef scr_seq_00000875_0000013E ; 002
	scrdef scr_seq_00000875_0000023D ; 003
	scrdef scr_seq_00000875_00000536 ; 004
	scrdef scr_seq_00000875_00000042 ; 005
	scrdef scr_seq_00000875_0000004E ; 006
	scrdef scr_seq_00000875_0000038E ; 007
	scrdef scr_seq_00000875_000004E0 ; 008
	scrdef scr_seq_00000875_000004F7 ; 009
	scrdef scr_seq_00000875_0000050C ; 010
	scrdef scr_seq_00000875_00000521 ; 011
	scrdef scr_seq_00000875_0000054B ; 012
	scrdef scr_seq_00000875_0000055E ; 013
	scrdef scr_seq_00000875_00000571 ; 014
	scrdef scr_seq_00000875_00000584 ; 015
	scrdef_end

scr_seq_00000875_00000042:
	clearflag FLAG_UNK_981
	setvar VAR_UNK_40EB, 0
	end

scr_seq_00000875_0000004E:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_00000875_000000C4
	apply_movement 255, scr_seq_00000875_000000E4
	wait_movement
	msgbox 2
	setvar VAR_SPECIAL_x8004, 421
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000875_000000B8
	callstd 2033
	setflag FLAG_UNK_0BB
	setvar VAR_UNK_4116, 2
	msgbox 4
	waitbutton
	closemsg
	apply_movement 0, scr_seq_00000875_000000D8
	wait_movement
	comparevartovalue VAR_UNK_4134, 4
	gotoif eq, scr_seq_00000875_000000F0
	releaseall
	end

scr_seq_00000875_000000B8:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000875_000000C2:
	.byte 0x00, 0x00

scr_seq_00000875_000000C4:
	.short 36, 1
	.short 75, 1
	.short 12, 2
	.short 2, 1
	.short 254, 0

scr_seq_00000875_000000D8:
	.short 13, 2
	.short 36, 1
	.short 254, 0

scr_seq_00000875_000000E4:
	.short 65, 3
	.short 3, 1
	.short 254, 0
scr_seq_00000875_000000F0:
	setvar VAR_UNK_4077, 2
	setflag FLAG_UNK_0C5
	setflag FLAG_UNK_99B
	comparevartovalue VAR_UNK_40F8, 0
	gotoif ne, scr_seq_00000875_00000111
	setvar VAR_UNK_40F8, 2
scr_seq_00000875_00000111:
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 2
	callstd 2039
	setvar VAR_UNK_4134, 5
	releaseall
	end

scr_seq_00000875_00000131:
	.byte 0x00, 0x00, 0x00, 0x4b, 0x00, 0x01, 0x00, 0xfe, 0x00, 0x00, 0x00
scr_seq_00000875_0000013C:
	end

scr_seq_00000875_0000013E:
	scrcmd_609
	lockall
	apply_movement 255, scr_seq_00000875_00000310
	wait_movement
	scrcmd_076 245, 0
	scrcmd_099 5
	scrcmd_523 5, 2, 90, 2, 0
	scrcmd_098 5
	scrcmd_077
	apply_movement 5, scr_seq_00000875_000002F4
	wait_movement
	apply_movement 5, scr_seq_00000875_00000338
	apply_movement 255, scr_seq_00000875_00000320
	wait_movement
	wait 30, VAR_SPECIAL_x800C
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 5, scr_seq_00000875_00000300
	apply_movement 255, scr_seq_00000875_00000344
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	hide_person 5
	setflag FLAG_UNK_1E1
	addvar VAR_UNK_4076, 1
	clearflag FLAG_UNK_1E2
	scrcmd_100 6
	callstd 2042
	apply_movement 6, scr_seq_00000875_00000358
	apply_movement 255, scr_seq_00000875_0000036C
	wait_movement
	buffer_players_name 0
	msgbox 15
	scrcmd_049
	closemsg
	trainer_battle 498, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000875_00000227
	buffer_players_name 0
	msgbox 16
	closemsg
	apply_movement 6, scr_seq_00000875_0000037C
	wait_movement
	hide_person 6
	setflag FLAG_UNK_1E2
	clearflag FLAG_UNK_29E
	setvar VAR_UNK_4092, 1
	releaseall
	end

scr_seq_00000875_00000227:
	hide_person 6
	setflag FLAG_UNK_1E2
	clearflag FLAG_UNK_29E
	setvar VAR_UNK_4092, 1
	scrcmd_219
	releaseall
scr_seq_00000875_0000023D:
	end

scr_seq_00000875_0000023F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	checkflag FLAG_UNK_964
	gotoif TRUE, scr_seq_00000875_00000276
	checkflag FLAG_UNK_0BB
	gotoif TRUE, scr_seq_00000875_0000026B
	msgbox 0
	msgbox 1
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000875_0000026B:
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000875_00000276:
	scrcmd_147 32, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000875_000002CD
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_00000875_000002E9
	msgbox 7
scr_seq_00000875_00000299:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000875_000002BD
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000875_000002D8
	end

scr_seq_00000875_000002BD:
	buffer_players_name 0
	msgbox 8
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 32
scr_seq_00000875_000002CD:
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000875_000002D8:
	setvar VAR_TEMP_x4002, 1
	msgbox 10
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000875_000002E9:
	msgbox 11
	goto scr_seq_00000875_00000299

scr_seq_00000875_000002F2:
	.byte 0x02, 0x00

scr_seq_00000875_000002F4:
	.short 111, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000875_00000300:
	.short 112, 1
	.short 69, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000875_00000310:
	.short 0, 1
	.short 75, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000875_00000320:
	.short 0, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00, 0x03, 0x00, 0x01, 0x00
	.byte 0xfe, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00

scr_seq_00000875_00000338:
	.short 1, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000875_00000344:
	.short 3, 1
	.short 63, 1
	.short 15, 2
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000875_00000358:
	.short 12, 5
	.short 15, 2
	.short 12, 2
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000875_0000036C:
	.short 63, 6
	.short 1, 1
	.short 254, 0
	.byte 0x02, 0x00, 0x00, 0x00

scr_seq_00000875_0000037C:
	.short 13, 2
	.short 14, 2
	.short 13, 5
	.short 254, 0
	.byte 0x02, 0x00
scr_seq_00000875_0000038E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 6
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000875_0000047B
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000875_00000481
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 7
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000875_000003FF
	apply_movement 255, scr_seq_00000875_00000498
	goto scr_seq_00000875_00000422

scr_seq_00000875_000003FF:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000875_0000041A
	apply_movement 255, scr_seq_00000875_000004B0
	goto scr_seq_00000875_00000422

scr_seq_00000875_0000041A:
	apply_movement 255, scr_seq_00000875_000004BC
scr_seq_00000875_00000422:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000875_00000449
	apply_movement 253, scr_seq_00000875_000004D0
	wait_movement
scr_seq_00000875_00000449:
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 35
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000875_0000047B:
	closemsg
	releaseall
	end

scr_seq_00000875_00000481:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 9
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000875_00000495:
	.byte 0x00, 0x00, 0x00

scr_seq_00000875_00000498:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000875_000004B0:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000875_000004BC:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000875_000004D0:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
scr_seq_00000875_000004E0:
	scrcmd_055 18, 0, 15, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000875_000004F7:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 19, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000875_0000050C:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 20, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000875_00000521:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 21, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000875_00000536:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 22, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000875_0000054B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 12
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000875_0000055E:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000875_00000571:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 14
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000875_00000584:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 17
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
