#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000227_00000050 ; 000
	scrdef scr_seq_00000227_0000002E ; 001
	scrdef scr_seq_00000227_000000A0 ; 002
	scrdef scr_seq_00000227_00000224 ; 003
	scrdef scr_seq_00000227_00000237 ; 004
	scrdef scr_seq_00000227_0000025F ; 005
	scrdef scr_seq_00000227_00000276 ; 006
	scrdef scr_seq_00000227_0000028D ; 007
	scrdef scr_seq_00000227_000002A2 ; 008
	scrdef scr_seq_00000227_000002B7 ; 009
	scrdef scr_seq_00000227_000002E8 ; 010
	scrdef_end

scr_seq_00000227_0000002E:
	setflag FLAG_UNK_0EE
	setvar VAR_SPECIAL_x8004, 1
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 0
	callstd 2039
	setvar VAR_UNK_408C, 3
	end

scr_seq_00000227_00000050:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	closemsg
	apply_movement 6, scr_seq_00000227_00000088
	wait_movement
	apply_movement 7, scr_seq_00000227_00000090
	wait_movement
	play_se SEQ_SE_DP_SELECT
	faceplayer
	msgbox 1
	closemsg
	apply_movement 8, scr_seq_00000227_00000098
	wait_movement
	releaseall
	end


scr_seq_00000227_00000088:
	.short 48, 3
	.short 254, 0

scr_seq_00000227_00000090:
	.short 49, 2
	.short 254, 0

scr_seq_00000227_00000098:
	.short 32, 1
	.short 254, 0
scr_seq_00000227_000000A0:
	scrcmd_609
	lockall
	scrcmd_307 17, 11, 11, 3, 77
	scrcmd_310 77
	scrcmd_308 77
	clearflag FLAG_UNK_24F
	scrcmd_100 13
	apply_movement 13, scr_seq_00000227_000001B0
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	apply_movement 13, scr_seq_00000227_000001C4
	wait_movement
	msgbox 5
	closemsg
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	comparevartovalue VAR_TEMP_x4000, 558
	gotoif ne, scr_seq_00000227_0000010A
	apply_movement 255, scr_seq_00000227_000001D4
	goto scr_seq_00000227_00000148

scr_seq_00000227_0000010A:
	comparevartovalue VAR_TEMP_x4000, 559
	gotoif ne, scr_seq_00000227_00000125
	apply_movement 255, scr_seq_00000227_000001E8
	goto scr_seq_00000227_00000148

scr_seq_00000227_00000125:
	comparevartovalue VAR_TEMP_x4000, 560
	gotoif ne, scr_seq_00000227_00000140
	apply_movement 255, scr_seq_00000227_000001FC
	goto scr_seq_00000227_00000148

scr_seq_00000227_00000140:
	apply_movement 255, scr_seq_00000227_00000210
scr_seq_00000227_00000148:
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 6
	setvar VAR_SPECIAL_x8004, 468
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	msgbox 8
	closemsg
	apply_movement 13, scr_seq_00000227_000001CC
	wait_movement
	scrcmd_307 17, 11, 11, 3, 77
	scrcmd_310 77
	scrcmd_308 77
	apply_movement 13, scr_seq_00000227_000001B8
	wait_movement
	scrcmd_311 77
	scrcmd_308 77
	scrcmd_309 77
	hide_person 13
	setflag FLAG_UNK_24F
	releaseall
	setflag FLAG_UNK_06D
	setvar VAR_UNK_408C, 1
	end


scr_seq_00000227_000001B0:
	.short 13, 1
	.short 254, 0

scr_seq_00000227_000001B8:
	.short 12, 1
	.short 69, 1
	.short 254, 0

scr_seq_00000227_000001C4:
	.short 35, 1
	.short 254, 0

scr_seq_00000227_000001CC:
	.short 32, 1
	.short 254, 0

scr_seq_00000227_000001D4:
	.short 13, 2
	.short 34, 1
	.short 63, 2
	.short 14, 2
	.short 254, 0

scr_seq_00000227_000001E8:
	.short 13, 2
	.short 34, 1
	.short 63, 2
	.short 14, 3
	.short 254, 0

scr_seq_00000227_000001FC:
	.short 13, 2
	.short 34, 1
	.short 63, 2
	.short 14, 4
	.short 254, 0

scr_seq_00000227_00000210:
	.short 13, 2
	.short 34, 1
	.short 63, 2
	.short 14, 5
	.short 254, 0
scr_seq_00000227_00000224:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 13
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000227_00000237:
	scrcmd_609
	lockall
	setvar VAR_SPECIAL_x8004, 0
	setvar VAR_SPECIAL_x8005, 2
	setvar VAR_SPECIAL_x8006, 0
	callstd 2039
	setvar VAR_UNK_4095, 0
	setflag FLAG_UNK_0A7
	releaseall
	end

scr_seq_00000227_0000025F:
	scrcmd_055 9, 1, 6, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000227_00000276:
	scrcmd_055 10, 1, 3, VAR_SPECIAL_x800C
	scrcmd_057 3
	scrcmd_058
	scrcmd_060 VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000227_0000028D:
	scrcmd_056 3, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 12, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000227_000002A2:
	scrcmd_056 2, 0
	scrcmd_057 3
	scrcmd_058
	scrcmd_059 11, VAR_SPECIAL_x800C
	callstd 2000
	end

scr_seq_00000227_000002B7:
	checkflag FLAG_UNK_06B
	gotoif TRUE, scr_seq_00000227_000002D5
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 2
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000227_000002D5:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 3
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000227_000002E8:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 4
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
