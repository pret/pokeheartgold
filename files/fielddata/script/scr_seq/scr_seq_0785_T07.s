#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_0785_01A2 ; 000
	scrdef scr_seq_0785_01B5 ; 001
	scrdef scr_seq_0785_01D0 ; 002
	scrdef scr_seq_0785_01E3 ; 003
	scrdef scr_seq_0785_01F6 ; 004
	scrdef scr_seq_0785_0209 ; 005
	scrdef scr_seq_0785_021C ; 006
	scrdef scr_seq_0785_022F ; 007
	scrdef scr_seq_0785_0242 ; 008
	scrdef scr_seq_0785_0255 ; 009
	scrdef scr_seq_0785_026C ; 010
	scrdef scr_seq_0785_0281 ; 011
	scrdef scr_seq_0785_0296 ; 012
	scrdef scr_seq_0785_02AB ; 013
	scrdef scr_seq_0785_02C0 ; 014
	scrdef scr_seq_0785_004E ; 015
	scrdef scr_seq_0785_02D5 ; 016
	scrdef scr_seq_0785_04EB ; 017
	scrdef scr_seq_0785_0513 ; 018
	scrdef_end

scr_seq_0785_004E:
	checkflag FLAG_UNK_189
	gotoif FALSE, scr_seq_0785_005F
	clearflag FLAG_UNK_189
	end

scr_seq_0785_005F:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_0785_007A
	clearflag FLAG_UNK_27E
	goto scr_seq_0785_0095

scr_seq_0785_007A:
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_0785_0091
	clearflag FLAG_UNK_27E
	goto scr_seq_0785_0095

scr_seq_0785_0091:
	setflag FLAG_UNK_27E
scr_seq_0785_0095:
	scrcmd_147 28, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0785_015E
	scrcmd_294 15, VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif eq, scr_seq_0785_00C3
	goto scr_seq_0785_0198

scr_seq_0785_00C1:
	.byte 0x02, 0x00
scr_seq_0785_00C3:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 6
	gotoif ne, scr_seq_0785_00E0
	goto scr_seq_0785_0101

scr_seq_0785_00DA:
	.byte 0x16, 0x00, 0x1f, 0x00, 0x00, 0x00
scr_seq_0785_00E0:
	comparevartovalue VAR_TEMP_x4000, 0
	gotoif ne, scr_seq_0785_00F9
	goto scr_seq_0785_0101

scr_seq_0785_00F3:
	.byte 0x16, 0x00, 0x06, 0x00, 0x00, 0x00
scr_seq_0785_00F9:
	goto scr_seq_0785_0198

scr_seq_0785_00FF:
	.byte 0x02
	.byte 0x00
scr_seq_0785_0101:
	scrcmd_522 16384
	comparevartovalue VAR_TEMP_x4000, 14
	gotoif ne, scr_seq_0785_0120
	clearflag FLAG_UNK_25D
	clearflag FLAG_UNK_2E1
	goto scr_seq_0785_015C

scr_seq_0785_0120:
	comparevartovalue VAR_TEMP_x4000, 15
	gotoif ne, scr_seq_0785_013B
	clearflag FLAG_UNK_25D
	clearflag FLAG_UNK_2E1
	goto scr_seq_0785_015C

scr_seq_0785_013B:
	comparevartovalue VAR_TEMP_x4000, 16
	gotoif ne, scr_seq_0785_0156
	clearflag FLAG_UNK_25D
	clearflag FLAG_UNK_2E1
	goto scr_seq_0785_015C

scr_seq_0785_0156:
	goto scr_seq_0785_0198

scr_seq_0785_015C:
	end

scr_seq_0785_015E:
	scrcmd_142 28, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_0785_0198
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_0785_0190
	clearflag FLAG_UNK_25D
	setflag FLAG_UNK_2E1
	goto scr_seq_0785_0196

scr_seq_0785_0190:
	goto scr_seq_0785_0198

scr_seq_0785_0196:
	end

scr_seq_0785_0198:
	setflag FLAG_UNK_25D
	setflag FLAG_UNK_2E1
	end

scr_seq_0785_01A2:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_01B5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_076 62, 0
	npc_msg 1
	scrcmd_077
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_01D0:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_01E3:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_01F6:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 4
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_0209:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_021C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_022F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_0242:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_0255:
	scrcmd_055 30, 0, 7, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0785_026C:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 31, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0785_0281:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 32, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0785_0296:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 33, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0785_02AB:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 34, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0785_02C0:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 35, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_0785_02D5:
	scrcmd_147 28, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_0785_046C
	comparevartovalue VAR_TEMP_x4005, 2
	gotoif eq, scr_seq_0785_0434
	comparevartovalue VAR_TEMP_x4005, 1
	gotoif eq, scr_seq_0785_03AA
scr_seq_0785_0302:
	play_se SEQ_SE_DP_SELECT
	lockall
	setvar VAR_TEMP_x4005, 1
	apply_movement 9, scr_seq_0785_045C
	wait_movement
	npc_msg 9
	closemsg
	apply_movement 10, scr_seq_0785_0464
	wait_movement
	npc_msg 10
	closemsg
	apply_movement 9, scr_seq_0785_045C
	wait_movement
	npc_msg 11
	closemsg
	apply_movement 10, scr_seq_0785_0464
	wait_movement
	npc_msg 12
	closemsg
	apply_movement 9, scr_seq_0785_045C
	wait_movement
	npc_msg 13
	closemsg
	apply_movement 10, scr_seq_0785_0464
	wait_movement
	npc_msg 14
	closemsg
	apply_movement 9, scr_seq_0785_045C
	wait_movement
	npc_msg 15
	closemsg
	apply_movement 10, scr_seq_0785_0464
	wait_movement
	npc_msg 16
	closemsg
	apply_movement 9, scr_seq_0785_045C
	wait_movement
	npc_msg 17
	closemsg
	apply_movement 10, scr_seq_0785_0464
	wait_movement
	npc_msg 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_03AA:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	setvar VAR_TEMP_x4005, 2
	buffer_players_name 0
	npc_msg 19
scr_seq_0785_03BE:
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_0785_03E2
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ge, scr_seq_0785_0429
	end

scr_seq_0785_03E2:
	buffer_players_name 0
	npc_msg 20
	play_fanfare SEQ_ME_POKEGEAR_REGIST
	wait_fanfare
	scrcmd_146 28
	npc_msg 21
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

scr_seq_0785_0429:
	npc_msg 22
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_0434:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 23
	goto scr_seq_0785_03BE

scr_seq_0785_0445:
	.byte 0x02, 0x00, 0x49, 0x00, 0xdc, 0x05, 0x60, 0x00, 0x68, 0x00, 0x2d
	.byte 0x00, 0x15, 0x32, 0x00, 0x35, 0x00, 0x61, 0x00, 0x02, 0x00, 0x00, 0x00

scr_seq_0785_045C:
	.short 35, 1
	.short 254, 0

scr_seq_0785_0464:
	.short 34, 1
	.short 254, 0
scr_seq_0785_046C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 24
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0785_04D5
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0785_04E0
	npc_msg 25
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
	npc_msg 26
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_04D5:
	npc_msg 27
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_04E0:
	npc_msg 28
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_04EB:
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ge, scr_seq_0785_0500
	goto scr_seq_0785_0302

scr_seq_0785_04FE:
	.byte 0x02, 0x00
scr_seq_0785_0500:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	npc_msg 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_0513:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	scrcmd_746
	getmenuchoice VAR_SPECIAL_x800C
	scrcmd_747
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0785_063B
	scrcmd_618 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_0785_064F
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
	closemsg
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	scrcmd_386 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_0785_058C
	apply_movement 255, scr_seq_0785_0664
	apply_movement 13, scr_seq_0785_06B0
	goto scr_seq_0785_05DA

scr_seq_0785_058C:
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0785_05A7
	apply_movement 255, scr_seq_0785_067C
	goto scr_seq_0785_05DA

scr_seq_0785_05A7:
	comparevartovalue VAR_SPECIAL_x800C, 3
	gotoif ne, scr_seq_0785_05CA
	apply_movement 255, scr_seq_0785_069C
	apply_movement 13, scr_seq_0785_06B0
	goto scr_seq_0785_05DA

scr_seq_0785_05CA:
	apply_movement 255, scr_seq_0785_0688
	apply_movement 13, scr_seq_0785_06B0
scr_seq_0785_05DA:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif ne, scr_seq_0785_0601
	apply_movement 253, scr_seq_0785_06BC
	wait_movement
scr_seq_0785_0601:
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

scr_seq_0785_063B:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_064F:
	scrcmd_438 2, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_0785_0663:
	.byte 0x00

scr_seq_0785_0664:
	.short 15, 1
	.short 12, 2
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0785_067C:
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0785_0688:
	.short 12, 1
	.short 14, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0785_069C:
	.short 12, 1
	.short 15, 1
	.short 12, 3
	.short 33, 1
	.short 254, 0

scr_seq_0785_06B0:
	.short 63, 1
	.short 32, 1
	.short 254, 0

scr_seq_0785_06BC:
	.short 15, 1
	.short 12, 1
	.short 1, 1
	.short 254, 0
	.balign 4, 0
