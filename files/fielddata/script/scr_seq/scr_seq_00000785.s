#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000785_000001A2 ; 000
	scrdef scr_seq_00000785_000001B5 ; 001
	scrdef scr_seq_00000785_000001D0 ; 002
	scrdef scr_seq_00000785_000001E3 ; 003
	scrdef scr_seq_00000785_000001F6 ; 004
	scrdef scr_seq_00000785_00000209 ; 005
	scrdef scr_seq_00000785_0000021C ; 006
	scrdef scr_seq_00000785_0000022F ; 007
	scrdef scr_seq_00000785_00000242 ; 008
	scrdef scr_seq_00000785_00000255 ; 009
	scrdef scr_seq_00000785_0000026C ; 010
	scrdef scr_seq_00000785_00000281 ; 011
	scrdef scr_seq_00000785_00000296 ; 012
	scrdef scr_seq_00000785_000002AB ; 013
	scrdef scr_seq_00000785_000002C0 ; 014
	scrdef scr_seq_00000785_0000004E ; 015
	scrdef scr_seq_00000785_000002D5 ; 016
	scrdef scr_seq_00000785_000004EB ; 017
	scrdef scr_seq_00000785_00000513 ; 018
	scrdef_end

scr_seq_00000785_0000004E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_00000785_0000005F
	clearflag FLAG_UNK_189
	end

scr_seq_00000785_0000005F:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000785_0000007A
	clearflag FLAG_UNK_27E
	goto scr_seq_00000785_00000095

scr_seq_00000785_0000007A:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000785_00000091
	clearflag FLAG_UNK_27E
	goto scr_seq_00000785_00000095

scr_seq_00000785_00000091:
	setflag FLAG_UNK_27E
scr_seq_00000785_00000095:
	scrcmd_147 28, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000785_0000015E
	scrcmd_294 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_00000785_000000C3
	goto scr_seq_00000785_00000198

scr_seq_00000785_000000C1:
	.byte 0x02, 0x00
scr_seq_00000785_000000C3:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_00000785_000000E0
	goto scr_seq_00000785_00000101

scr_seq_00000785_000000DA:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_00000785_000000E0:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_00000785_000000F9
	goto scr_seq_00000785_00000101

scr_seq_00000785_000000F3:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_00000785_000000F9:
	goto scr_seq_00000785_00000198

scr_seq_00000785_000000FF:
	.byte 0x02
	.byte 0x00
scr_seq_00000785_00000101:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_00000785_00000120
	clearflag FLAG_UNK_25D
	clearflag FLAG_UNK_2E1
	goto scr_seq_00000785_0000015C

scr_seq_00000785_00000120:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_00000785_0000013B
	clearflag FLAG_UNK_25D
	clearflag FLAG_UNK_2E1
	goto scr_seq_00000785_0000015C

scr_seq_00000785_0000013B:
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_00000785_00000156
	clearflag FLAG_UNK_25D
	clearflag FLAG_UNK_2E1
	goto scr_seq_00000785_0000015C

scr_seq_00000785_00000156:
	goto scr_seq_00000785_00000198

scr_seq_00000785_0000015C:
	end

scr_seq_00000785_0000015E:
	scrcmd_142 28, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000785_00000198
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000785_00000190
	clearflag FLAG_UNK_25D
	setflag FLAG_UNK_2E1
	goto scr_seq_00000785_00000196

scr_seq_00000785_00000190:
	goto scr_seq_00000785_00000198

scr_seq_00000785_00000196:
	end

scr_seq_00000785_00000198:
	setflag FLAG_UNK_25D
	setflag FLAG_UNK_2E1
	end

scr_seq_00000785_000001A2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_000001B5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 62, 0
	msgbox 1
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_000001D0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_000001E3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_000001F6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_00000209:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_0000021C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_0000022F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_00000242:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_00000255:
	scrcmd_055 30, 0, 7, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000785_0000026C:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 31, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000785_00000281:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 32, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000785_00000296:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 33, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000785_000002AB:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 34, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000785_000002C0:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 35, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000785_000002D5:
	scrcmd_147 28, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000785_0000046C
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif eq, scr_seq_00000785_00000434
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif eq, scr_seq_00000785_000003AA
scr_seq_00000785_00000302:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_TEMP_x4005, 1
	apply_movement 9, scr_seq_00000785_0000045C
	wait_movement
	msgbox 9
	closemsg
	apply_movement 10, scr_seq_00000785_00000464
	wait_movement
	msgbox 10
	closemsg
	apply_movement 9, scr_seq_00000785_0000045C
	wait_movement
	msgbox 11
	closemsg
	apply_movement 10, scr_seq_00000785_00000464
	wait_movement
	msgbox 12
	closemsg
	apply_movement 9, scr_seq_00000785_0000045C
	wait_movement
	msgbox 13
	closemsg
	apply_movement 10, scr_seq_00000785_00000464
	wait_movement
	msgbox 14
	closemsg
	apply_movement 9, scr_seq_00000785_0000045C
	wait_movement
	msgbox 15
	closemsg
	apply_movement 10, scr_seq_00000785_00000464
	wait_movement
	msgbox 16
	closemsg
	apply_movement 9, scr_seq_00000785_0000045C
	wait_movement
	msgbox 17
	closemsg
	apply_movement 10, scr_seq_00000785_00000464
	wait_movement
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_000003AA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4005, 2
	buffer_players_name 0
	msgbox 19
scr_seq_00000785_000003BE:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000785_000003E2
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_00000785_00000429
	end

scr_seq_00000785_000003E2:
	buffer_players_name 0
	msgbox 20
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 28
	msgbox 21
	waitbutton
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	setflag FLAG_UNK_25D
	hide_person 9
	hide_person 10
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_00000785_00000429:
	msgbox 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_00000434:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 23
	goto scr_seq_00000785_000003BE

scr_seq_00000785_00000445:
	.byte 0x02, 0x00, 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68, 0x00, 0x2d
	.byte 0x00, 0x15, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00, 0x00, 0x00

scr_seq_00000785_0000045C:
	.short 35, 1
	.short 254, 0

scr_seq_00000785_00000464:
	.short 34, 1
	.short 254, 0
scr_seq_00000785_0000046C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 24
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000785_000004D5
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000785_000004E0
	msgbox 25
	closemsg
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 81
	faceplayer
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	msgbox 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_000004D5:
	msgbox 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_000004E0:
	msgbox 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_000004EB:
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_00000785_00000500
	goto scr_seq_00000785_00000302

scr_seq_00000785_000004FE:
	.byte 0x02, 0x00
scr_seq_00000785_00000500:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_00000513:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000785_0000063B
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000785_0000064F
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000785_0000058C
	apply_movement 255, scr_seq_00000785_00000664
	apply_movement 13, scr_seq_00000785_000006B0
	goto scr_seq_00000785_000005DA

scr_seq_00000785_0000058C:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000785_000005A7
	apply_movement 255, scr_seq_00000785_0000067C
	goto scr_seq_00000785_000005DA

scr_seq_00000785_000005A7:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_00000785_000005CA
	apply_movement 255, scr_seq_00000785_0000069C
	apply_movement 13, scr_seq_00000785_000006B0
	goto scr_seq_00000785_000005DA

scr_seq_00000785_000005CA:
	apply_movement 255, scr_seq_00000785_00000688
	apply_movement 13, scr_seq_00000785_000006B0
scr_seq_00000785_000005DA:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_00000785_00000601
	apply_movement 253, scr_seq_00000785_000006BC
	wait_movement
scr_seq_00000785_00000601:
	setflag FLAG_UNK_189
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_615 57
	lockall
	fade_screen 6, 1, 1, 0
	wait_fade
	clearflag FLAG_UNK_189
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_0000063B:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_0000064F:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000785_00000663:
	.byte 0x00

scr_seq_00000785_00000664:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000785_0000067C:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000785_00000688:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000785_0000069C:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_00000785_000006B0:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_00000785_000006BC:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
