#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000922_0000001A ; 000
	scrdef scr_seq_00000922_00000138 ; 001
	scrdef scr_seq_00000922_000001F5 ; 002
	scrdef scr_seq_00000922_00000278 ; 003
	scrdef scr_seq_00000922_000000B2 ; 004
	scrdef scr_seq_00000922_000002AC ; 005
	scrdef_end

scr_seq_00000922_0000001A:
	scrcmd_314
	scrcmd_142 37, 16385
	comparevartovalue VAR_TEMP_x4001, 0
	gotoif ne, scr_seq_00000922_000000AC
	checkflag FLAG_UNK_964
	gotoif FALSE, scr_seq_00000922_000000A6
	scrcmd_147 37, 16385
	comparevartovalue VAR_TEMP_x4001, 1
	gotoif eq, scr_seq_00000922_00000085
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 1
	gotoif ne, scr_seq_00000922_00000068
	setflag FLAG_UNK_2ED
	goto scr_seq_00000922_00000083

scr_seq_00000922_00000068:
	comparevartovalue VAR_TEMP_x4000, 2
	gotoif ne, scr_seq_00000922_0000007F
	setflag FLAG_UNK_2ED
	goto scr_seq_00000922_00000083

scr_seq_00000922_0000007F:
	clearflag FLAG_UNK_2ED
scr_seq_00000922_00000083:
	end

scr_seq_00000922_00000085:
	scrcmd_484 VAR_TEMP_x4000
	comparevartovalue VAR_TEMP_x4000, 5
	gotoif ne, scr_seq_00000922_000000A0
	setflag FLAG_UNK_2ED
	goto scr_seq_00000922_000000A4

scr_seq_00000922_000000A0:
	clearflag FLAG_UNK_2ED
scr_seq_00000922_000000A4:
	end

scr_seq_00000922_000000A6:
	clearflag FLAG_UNK_2ED
	end

scr_seq_00000922_000000AC:
	setflag FLAG_UNK_2ED
	end

scr_seq_00000922_000000B2:
	scrcmd_609
	lockall
	apply_movement 6, scr_seq_00000922_00000108
	wait_movement
	msgbox 9
	closemsg
	apply_movement 6, scr_seq_00000922_00000118
	apply_movement 255, scr_seq_00000922_00000128
	wait_movement
	setvar VAR_UNK_4079, 1
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 78, 7, 376, 182, 1
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_00000922_00000105:
	.byte 0x00, 0x00, 0x00

scr_seq_00000922_00000108:
	.short 75, 1
	.short 13, 3
	.short 63, 1
	.short 254, 0

scr_seq_00000922_00000118:
	.short 9, 1
	.short 71, 1
	.short 12, 1
	.short 254, 0

scr_seq_00000922_00000128:
	.short 63, 1
	.short 13, 1
	.short 63, 1
	.short 254, 0
scr_seq_00000922_00000138:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000922_000001D9
	msgbox 0
	closemsg
	trainer_battle 31, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000922_000001EF
	msgbox 1
	scrcmd_295 3
	addvar VAR_UNK_4134, 1
	scrcmd_515 22
	setflag FLAG_UNK_998
	buffer_players_name 0
	msgbox 2
	play_fanfare SEQ_ME_BADGE
	wait_fanfare
	msgbox 3
	goto scr_seq_00000922_0000019B

scr_seq_00000922_0000019B:
	setvar VAR_SPECIAL_x8004, 357
	setvar VAR_SPECIAL_x8005, 1
	hasspaceforitem VAR_SPECIAL_x8004, VAR_SPECIAL_x8005, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000922_000001CF
	callstd 2033
	setflag FLAG_UNK_0A6
	msgbox 5
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000922_000001CF:
	callstd 2009
	closemsg
	releaseall
	end

scr_seq_00000922_000001D9:
	checkflag FLAG_UNK_0A6
	gotoif FALSE, scr_seq_00000922_0000019B
	msgbox 6
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000922_000001EF:
	scrcmd_219
	releaseall
	end

scr_seq_00000922_000001F5:
	scrcmd_609
	lockall
	play_se SEQ_SE_DP_GYURU
	apply_movement 255, scr_seq_00000922_00000230
	wait_movement
	fade_screen 6, 1, 0, 0
	wait_fade
	scrcmd_176 80, 0, 16, 49, 0
	fade_screen 6, 1, 1, 0
	wait_fade
	releaseall
	end

scr_seq_00000922_0000022F:
	.byte 0x00

scr_seq_00000922_00000230:
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 2
	.short 1, 2
	.short 2, 2
	.short 0, 2
	.short 3, 1
	.short 69, 0
	.short 254, 0
scr_seq_00000922_00000278:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 3, VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	gotoif eq, scr_seq_00000922_0000029E
	msgbox 7
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000922_0000029E:
	buffer_players_name 0
	msgbox 8
	waitbutton
	closemsg
	releaseall
	end

scr_seq_00000922_000002AC:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	scrcmd_294 3, VAR_SPECIAL_x800C
	buffer_players_name 0
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif ne, scr_seq_00000922_000002D3
	msgbox 10
	goto scr_seq_00000922_000002D6

scr_seq_00000922_000002D3:
	msgbox 11
scr_seq_00000922_000002D6:
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
