#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000962_0000002A ; 000
	scrdef scr_seq_00000962_0000004B ; 001
	scrdef scr_seq_00000962_0000037F ; 002
	scrdef scr_seq_00000962_000003AB ; 003
	scrdef scr_seq_00000962_000003BE ; 004
	scrdef scr_seq_00000962_000003D1 ; 005
	scrdef scr_seq_00000962_000003E4 ; 006
	scrdef scr_seq_00000962_0000036C ; 007
	scrdef scr_seq_00000962_00000199 ; 008
	scrdef scr_seq_00000962_00000396 ; 009
	scrdef_end

scr_seq_00000962_0000002A:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000962_00000045
	clearflag FLAG_UNK_206
	goto scr_seq_00000962_00000049

scr_seq_00000962_00000045:
	setflag FLAG_UNK_206
scr_seq_00000962_00000049:
	end

scr_seq_00000962_0000004B:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	get_lead_mon_index VAR_SPECIAL_x8002
	scrcmd_480 32780, 32770, 59
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000962_00000171
	checkflag FLAG_UNK_ABC
	gotoif TRUE, scr_seq_00000962_00000185
	comparevartovalue VAR_UNK_4094, 7
	gotoif eq, scr_seq_00000962_0000011F
	checkflag FLAG_UNK_0D7
	gotoif TRUE, scr_seq_00000962_00000101
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000962_000000B2
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	goto scr_seq_00000962_000000F9

scr_seq_00000962_000000B2:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 0
	setvar VAR_SPECIAL_x8004, 244
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000962_00000115
	callstd 2033
	setflag FLAG_UNK_0D7
	addvar VAR_UNK_4094, 1
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 1
scr_seq_00000962_000000F9:
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000962_00000101:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000962_00000115:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000962_0000011F:
	scrcmd_484 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000962_00000142
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 3
	goto scr_seq_00000962_000000F9

scr_seq_00000962_00000142:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 28
	scrcmd_193 0, 32770
	scrcmd_440 VAR_SPECIAL_x800C, 30
	scrcmd_481 32770, 59
	play_fanfare SEQ_ME_ITEM
	wait_fanfare
	setflag FLAG_UNK_ABC
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000962_00000171:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 29
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000962_00000185:
	scrcmd_438 0, VAR_SPECIAL_x800C
	scrcmd_440 VAR_SPECIAL_x800C, 31
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000962_00000199:
	scrcmd_609
	lockall
	apply_movement 5, scr_seq_00000962_000002C8
	wait_movement
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8000, 252
	gotoif ne, scr_seq_00000962_000001C8
	apply_movement 5, scr_seq_00000962_000002D4
	goto scr_seq_00000962_00000206

scr_seq_00000962_000001C8:
	comparevartovalue VAR_SPECIAL_x8000, 253
	gotoif ne, scr_seq_00000962_000001E3
	apply_movement 5, scr_seq_00000962_000002E0
	goto scr_seq_00000962_00000206

scr_seq_00000962_000001E3:
	comparevartovalue VAR_SPECIAL_x8000, 254
	gotoif ne, scr_seq_00000962_000001FE
	apply_movement 5, scr_seq_00000962_000002F4
	goto scr_seq_00000962_00000206

scr_seq_00000962_000001FE:
	apply_movement 5, scr_seq_00000962_00000308
scr_seq_00000962_00000206:
	wait_movement
	scrcmd_729 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 0
	gotoif eq, scr_seq_00000962_00000223
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 56
scr_seq_00000962_00000223:
	apply_movement 5, scr_seq_00000962_0000031C
	apply_movement 255, scr_seq_00000962_000002B8
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 15
	closemsg
	apply_movement 5, scr_seq_00000962_000002C8
	wait_movement
	msgbox 16
	closemsg
	get_player_coords VAR_SPECIAL_x8000, VAR_SPECIAL_x8001
	comparevartovalue VAR_SPECIAL_x8000, 252
	gotoif ne, scr_seq_00000962_00000274
	apply_movement 5, scr_seq_00000962_00000324
	goto scr_seq_00000962_000002B2

scr_seq_00000962_00000274:
	comparevartovalue VAR_SPECIAL_x8000, 253
	gotoif ne, scr_seq_00000962_0000028F
	apply_movement 5, scr_seq_00000962_00000330
	goto scr_seq_00000962_000002B2

scr_seq_00000962_0000028F:
	comparevartovalue VAR_SPECIAL_x8000, 254
	gotoif ne, scr_seq_00000962_000002AA
	apply_movement 5, scr_seq_00000962_00000344
	goto scr_seq_00000962_000002B2

scr_seq_00000962_000002AA:
	apply_movement 5, scr_seq_00000962_00000358
scr_seq_00000962_000002B2:
	wait_movement
	releaseall
	end


scr_seq_00000962_000002B8:
	.short 71, 1
	.short 12, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000962_000002C8:
	.short 75, 1
	.short 63, 1
	.short 254, 0

scr_seq_00000962_000002D4:
	.short 16, 5
	.short 32, 2
	.short 254, 0

scr_seq_00000962_000002E0:
	.short 16, 2
	.short 19, 1
	.short 16, 3
	.short 32, 2
	.short 254, 0

scr_seq_00000962_000002F4:
	.short 16, 2
	.short 19, 2
	.short 16, 3
	.short 32, 2
	.short 254, 0

scr_seq_00000962_00000308:
	.short 16, 2
	.short 19, 3
	.short 16, 3
	.short 32, 2
	.short 254, 0

scr_seq_00000962_0000031C:
	.short 12, 1
	.short 254, 0

scr_seq_00000962_00000324:
	.short 17, 6
	.short 32, 1
	.short 254, 0

scr_seq_00000962_00000330:
	.short 17, 3
	.short 18, 1
	.short 17, 3
	.short 32, 1
	.short 254, 0

scr_seq_00000962_00000344:
	.short 17, 3
	.short 18, 2
	.short 17, 3
	.short 32, 1
	.short 254, 0

scr_seq_00000962_00000358:
	.short 17, 3
	.short 18, 3
	.short 17, 3
	.short 32, 1
	.short 254, 0
scr_seq_00000962_0000036C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 18
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000962_0000037F:
	scrcmd_055 19, 1, 4, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000962_00000396:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 20, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000962_000003AB:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000962_000003BE:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000962_000003D1:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000962_000003E4:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 9
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
