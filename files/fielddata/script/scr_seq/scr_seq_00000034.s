#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000034_0000000A ; 000
	scrdef scr_seq_00000034_0000002F ; 001
	scrdef_end

scr_seq_00000034_0000000A:
	setflag FLAG_UNK_1B7
	setflag FLAG_UNK_1B8
	setvar VAR_UNK_4125, 0
	comparevartovalue VAR_UNK_4077, 4
	gotoif ne, scr_seq_00000034_0000002D
	clearflag FLAG_UNK_1B7
	clearflag FLAG_UNK_1B8
scr_seq_00000034_0000002D:
	end

scr_seq_00000034_0000002F:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	closemsg
	trainer_battle 485, 0, 0, 0
	scrcmd_220 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 0
	gotoif eq, scr_seq_00000034_0000025D
	msgbox 1
	closemsg
	fade_screen 6, 1, 0, 0
	wait_fade
	hide_person 0
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	clearflag FLAG_UNK_99B
	fade_out_bgm 0, 30
	scrcmd_081 0
	wait 15, VAR_SPECIAL_x800C
	reset_bgm
	fade_screen 6, 1, 1, 0
	wait_fade
	show_person_at 1, 8, 1, 12, 1
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000034_000000C1
	apply_movement 1, scr_seq_00000034_00000288
	goto scr_seq_00000034_00000102

scr_seq_00000034_000000C1:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000034_000000ED
	apply_movement 1, scr_seq_00000034_000002A4
	scrcmd_729 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 1
	callif eq, scr_seq_00000034_00000263
	goto scr_seq_00000034_00000102

scr_seq_00000034_000000ED:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_00000034_00000102
	apply_movement 1, scr_seq_00000034_000002C0
scr_seq_00000034_00000102:
	wait_movement
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000034_00000119
	apply_movement 255, scr_seq_00000034_000002EC
scr_seq_00000034_00000119:
	wait_movement
	msgbox 2
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000034_0000014E
	setvar VAR_SPECIAL_x8004, 483
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setflag FLAG_UNK_093
	msgbox 5
	closemsg
	goto scr_seq_00000034_00000167

scr_seq_00000034_0000014E:
	setvar VAR_SPECIAL_x8004, 482
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	setflag FLAG_UNK_094
	msgbox 6
	closemsg
scr_seq_00000034_00000167:
	comparevartovalue VAR_TEMP_x4000, 7
	gotoif ne, scr_seq_00000034_00000182
	apply_movement 1, scr_seq_00000034_000002F4
	goto scr_seq_00000034_000001B2

scr_seq_00000034_00000182:
	comparevartovalue VAR_TEMP_x4000, 8
	gotoif ne, scr_seq_00000034_0000019D
	apply_movement 1, scr_seq_00000034_00000304
	goto scr_seq_00000034_000001B2

scr_seq_00000034_0000019D:
	comparevartovalue VAR_TEMP_x4000, 9
	gotoif ne, scr_seq_00000034_000001B2
	apply_movement 1, scr_seq_00000034_00000314
scr_seq_00000034_000001B2:
	wait_movement
	apply_movement 1, scr_seq_00000034_00000324
	wait_movement
	apply_movement 255, scr_seq_00000034_000002EC
	wait_movement
	scrcmd_495 VAR_SPECIAL_x800C
	comparevartovalue VAR_SPECIAL_x800C, 7
	gotoif ne, scr_seq_00000034_000001E2
	msgbox 7
	goto scr_seq_00000034_000001E5

scr_seq_00000034_000001E2:
	msgbox 8
scr_seq_00000034_000001E5:
	closemsg
	apply_movement 1, scr_seq_00000034_0000032C
	wait_movement
	msgbox 9
	closemsg
	apply_movement 1, scr_seq_00000034_00000344
	wait_movement
	play_se SEQ_SE_DP_DOOR10
	wait_se SEQ_SE_DP_DOOR10
	wait 8, VAR_SPECIAL_x800C
	hide_person 1
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	releaseall
	setvar VAR_UNK_4077, 5
	setflag FLAG_UNK_0C6
	clearflag FLAG_UNK_2C6
	setflag FLAG_UNK_2C7
	comparevartovalue VAR_UNK_40F8, 2
	gotoif ne, scr_seq_00000034_00000241
	setvar VAR_UNK_40F8, 0
scr_seq_00000034_00000241:
	setvar VAR_UNK_407A, 1
	clearflag FLAG_UNK_1E7
	setflag FLAG_UNK_200
	clearflag FLAG_UNK_201
	setflag FLAG_UNK_998
	setflag FLAG_UNK_97D
	end

scr_seq_00000034_0000025D:
	scrcmd_219
	releaseall
	end

scr_seq_00000034_00000263:
	get_person_coords 253, VAR_SPECIAL_x8004, VAR_SPECIAL_x8005
	comparevartovalue VAR_SPECIAL_x8004, 7
	gotoif ne, scr_seq_00000034_00000286
	wait 112, VAR_SPECIAL_x800C
	apply_movement 253, scr_seq_00000034_000002DC
scr_seq_00000034_00000286:
	return


scr_seq_00000034_00000288:
	.short 13, 1
	.short 14, 4
	.short 12, 7
	.short 15, 4
	.short 12, 3
	.short 34, 1
	.short 254, 0

scr_seq_00000034_000002A4:
	.short 13, 1
	.short 14, 4
	.short 12, 7
	.short 15, 3
	.short 12, 2
	.short 35, 1
	.short 254, 0

scr_seq_00000034_000002C0:
	.short 13, 1
	.short 14, 4
	.short 12, 7
	.short 15, 4
	.short 12, 3
	.short 35, 1
	.short 254, 0

scr_seq_00000034_000002DC:
	.short 12, 1
	.short 15, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000034_000002EC:
	.short 34, 1
	.short 254, 0

scr_seq_00000034_000002F4:
	.short 13, 3
	.short 14, 4
	.short 75, 1
	.short 254, 0

scr_seq_00000034_00000304:
	.short 13, 2
	.short 14, 3
	.short 75, 1
	.short 254, 0

scr_seq_00000034_00000314:
	.short 13, 3
	.short 14, 4
	.short 75, 1
	.short 254, 0

scr_seq_00000034_00000324:
	.short 15, 1
	.short 254, 0

scr_seq_00000034_0000032C:
	.short 14, 1
	.short 13, 1
	.short 75, 1
	.short 63, 3
	.short 32, 1
	.short 254, 0

scr_seq_00000034_00000344:
	.short 13, 6
	.short 15, 4
	.short 254, 0
	.balign 4, 0
