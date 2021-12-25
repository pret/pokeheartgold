#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000231_00000014 ; 000
	scrdef scr_seq_00000231_0000000E ; 001
	scrdef scr_seq_00000231_0000048C ; 002
	scrdef_end

scr_seq_00000231_0000000E:
	scrcmd_144 16416
	end

scr_seq_00000231_00000014:
	scrcmd_609
	lockall
	callstd 2029
	apply_movement 2, scr_seq_00000231_0000028C
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	show_person_at 1, 10, 1, 7, 2
	show_person_at 2, 10, 1, 7, 2
	apply_movement 1, scr_seq_00000231_00000284
	wait_movement
	wait_se SEQ_SE_DP_KAIDAN2
	get_player_coords VAR_TEMP_x4000, VAR_TEMP_x4001
	scrcmd_729 VAR_TEMP_x4002
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_00000231_000000C3
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000231_0000008A
	apply_movement 1, scr_seq_00000231_000002AC
	apply_movement 2, scr_seq_00000231_000002FC
	goto scr_seq_00000231_000000BD

scr_seq_00000231_0000008A:
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_00000231_000000AD
	apply_movement 1, scr_seq_00000231_000002BC
	apply_movement 2, scr_seq_00000231_00000314
	goto scr_seq_00000231_000000BD

scr_seq_00000231_000000AD:
	apply_movement 1, scr_seq_00000231_000002C4
	apply_movement 2, scr_seq_00000231_00000324
scr_seq_00000231_000000BD:
	goto scr_seq_00000231_00000119

scr_seq_00000231_000000C3:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000231_000000E6
	apply_movement 1, scr_seq_00000231_000002D4
	apply_movement 2, scr_seq_00000231_0000033C
	goto scr_seq_00000231_00000119

scr_seq_00000231_000000E6:
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_00000231_00000109
	apply_movement 1, scr_seq_00000231_000002E4
	apply_movement 2, scr_seq_00000231_00000354
	goto scr_seq_00000231_00000119

scr_seq_00000231_00000109:
	apply_movement 1, scr_seq_00000231_000002EC
	apply_movement 2, scr_seq_00000231_00000364
scr_seq_00000231_00000119:
	wait_movement
	apply_movement 255, scr_seq_00000231_00000294
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_00000231_00000138
	apply_movement 253, scr_seq_00000231_00000294
scr_seq_00000231_00000138:
	wait_movement
	scrcmd_190 0
	scrcmd_132 2, 3
	setvar VAR_SPECIAL_x8004, 465
	setvar VAR_SPECIAL_x8005, 1
	callstd 2033
	scrcmd_132 4, 5
	closemsg
	apply_movement 1, scr_seq_00000231_00000294
	wait_movement
	scrcmd_132 6, 7
	closemsg
	apply_movement 2, scr_seq_00000231_000002A4
	wait_movement
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_00000231_000001DA
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000231_000001A1
	apply_movement 1, scr_seq_00000231_0000037C
	apply_movement 2, scr_seq_00000231_000003EC
	goto scr_seq_00000231_000001D4

scr_seq_00000231_000001A1:
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_00000231_000001C4
	apply_movement 1, scr_seq_00000231_0000038C
	apply_movement 2, scr_seq_00000231_00000404
	goto scr_seq_00000231_000001D4

scr_seq_00000231_000001C4:
	apply_movement 1, scr_seq_00000231_000003A4
	apply_movement 2, scr_seq_00000231_00000424
scr_seq_00000231_000001D4:
	goto scr_seq_00000231_00000230

scr_seq_00000231_000001DA:
	comparevartovalue VAR_TEMP_x4001, 6
	gotoif ne, scr_seq_00000231_000001FD
	apply_movement 1, scr_seq_00000231_000003B4
	apply_movement 2, scr_seq_00000231_0000043C
	goto scr_seq_00000231_00000230

scr_seq_00000231_000001FD:
	comparevartovalue VAR_TEMP_x4001, 7
	gotoif ne, scr_seq_00000231_00000220
	apply_movement 1, scr_seq_00000231_000003C4
	apply_movement 2, scr_seq_00000231_00000454
	goto scr_seq_00000231_00000230

scr_seq_00000231_00000220:
	apply_movement 1, scr_seq_00000231_000003DC
	apply_movement 2, scr_seq_00000231_00000474
scr_seq_00000231_00000230:
	wait 16, VAR_SPECIAL_x800C
	apply_movement 255, scr_seq_00000231_0000029C
	comparevartovalue VAR_TEMP_x4002, 1
	gotoif ne, scr_seq_00000231_00000253
	apply_movement 253, scr_seq_00000231_0000029C
scr_seq_00000231_00000253:
	wait_movement
	play_se SEQ_SE_DP_KAIDAN2
	wait_se SEQ_SE_DP_KAIDAN2
	show_person_at 1, 12, 0, 28, 0
	show_person_at 2, 12, 0, 28, 0
	callstd 2030
	releaseall
	setvar VAR_UNK_4132, 1
	end

scr_seq_00000231_00000283:
	.byte 0x00

scr_seq_00000231_00000284:
	.short 75, 1
	.short 254, 0

scr_seq_00000231_0000028C:
	.short 69, 1
	.short 254, 0

scr_seq_00000231_00000294:
	.short 35, 1
	.short 254, 0

scr_seq_00000231_0000029C:
	.short 38, 1
	.short 254, 0

scr_seq_00000231_000002A4:
	.short 50, 2
	.short 254, 0

scr_seq_00000231_000002AC:
	.short 14, 2
	.short 12, 1
	.short 14, 1
	.short 254, 0

scr_seq_00000231_000002BC:
	.short 14, 3
	.short 254, 0

scr_seq_00000231_000002C4:
	.short 14, 2
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_00000231_000002D4:
	.short 14, 2
	.short 12, 1
	.short 14, 2
	.short 254, 0

scr_seq_00000231_000002E4:
	.short 14, 4
	.short 254, 0

scr_seq_00000231_000002EC:
	.short 14, 2
	.short 13, 1
	.short 14, 2
	.short 254, 0

scr_seq_00000231_000002FC:
	.short 63, 1
	.short 70, 1
	.short 14, 2
	.short 12, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000231_00000314:
	.short 63, 1
	.short 70, 1
	.short 14, 2
	.short 254, 0

scr_seq_00000231_00000324:
	.short 63, 1
	.short 70, 1
	.short 14, 2
	.short 13, 1
	.short 34, 1
	.short 254, 0

scr_seq_00000231_0000033C:
	.short 63, 1
	.short 70, 1
	.short 14, 2
	.short 12, 1
	.short 14, 1
	.short 254, 0

scr_seq_00000231_00000354:
	.short 63, 1
	.short 70, 1
	.short 14, 3
	.short 254, 0

scr_seq_00000231_00000364:
	.short 63, 1
	.short 70, 1
	.short 14, 2
	.short 13, 1
	.short 14, 1
	.short 254, 0

scr_seq_00000231_0000037C:
	.short 89, 1
	.short 90, 6
	.short 69, 1
	.short 254, 0

scr_seq_00000231_0000038C:
	.short 89, 1
	.short 90, 4
	.short 88, 1
	.short 90, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000231_000003A4:
	.short 88, 1
	.short 90, 6
	.short 69, 1
	.short 254, 0

scr_seq_00000231_000003B4:
	.short 89, 1
	.short 90, 5
	.short 69, 1
	.short 254, 0

scr_seq_00000231_000003C4:
	.short 89, 1
	.short 90, 3
	.short 88, 1
	.short 90, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000231_000003DC:
	.short 88, 1
	.short 90, 5
	.short 69, 1
	.short 254, 0

scr_seq_00000231_000003EC:
	.short 61, 1
	.short 18, 1
	.short 17, 1
	.short 18, 6
	.short 69, 1
	.short 254, 0

scr_seq_00000231_00000404:
	.short 61, 1
	.short 18, 1
	.short 17, 1
	.short 18, 4
	.short 16, 1
	.short 18, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000231_00000424:
	.short 61, 1
	.short 18, 1
	.short 16, 1
	.short 18, 6
	.short 69, 1
	.short 254, 0

scr_seq_00000231_0000043C:
	.short 61, 1
	.short 18, 1
	.short 17, 1
	.short 18, 5
	.short 69, 1
	.short 254, 0

scr_seq_00000231_00000454:
	.short 61, 1
	.short 18, 1
	.short 17, 1
	.short 18, 3
	.short 16, 1
	.short 18, 2
	.short 69, 1
	.short 254, 0

scr_seq_00000231_00000474:
	.short 61, 1
	.short 18, 1
	.short 16, 1
	.short 18, 5
	.short 69, 1
	.short 254, 0
scr_seq_00000231_0000048C:
	play_se SEQ_SE_DP_SELECT
	lockall
	faceplayer
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
