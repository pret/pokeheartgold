#include "constants/scrcmd.h"
	.include "asm/macros/script.inc"

	.rodata

	scrdef scr_seq_00000053_00000394 ; 000
	scrdef scr_seq_00000053_0000009F ; 001
	scrdef scr_seq_00000053_000001CC ; 002
	scrdef scr_seq_00000053_00000268 ; 003
	scrdef scr_seq_00000053_0000001E ; 004
	scrdef scr_seq_00000053_00000348 ; 005
	scrdef scr_seq_00000053_00000376 ; 006
	scrdef_end

scr_seq_00000053_0000001E:
	scrcmd_490 16388
	comparevartovalue VAR_UNK_40FB, 10
	gotoif eq, scr_seq_00000053_00000035
	goto scr_seq_00000053_00000095

scr_seq_00000053_00000035:
	scrcmd_529 VAR_TEMP_x4005
	comparevartovalue VAR_UNK_4102, 1
	gotoif eq, scr_seq_00000053_00000059
	comparevartovalue VAR_UNK_4102, 2
	gotoif eq, scr_seq_00000053_00000077
	goto scr_seq_00000053_00000095

scr_seq_00000053_00000059:
	scrcmd_698 1, 16389, 16391
	comparevartovalue VAR_TEMP_x4007, 1
	callif eq, scr_seq_00000053_00000097
	scrcmd_490 16389
	scrcmd_490 16391
	end

scr_seq_00000053_00000077:
	scrcmd_698 2, 16389, 16390
	comparevartovalue VAR_TEMP_x4006, 1
	callif eq, scr_seq_00000053_00000097
	scrcmd_490 16389
	scrcmd_490 16390
	end

scr_seq_00000053_00000095:
	end

scr_seq_00000053_00000097:
	setvar VAR_UNK_40FB, 11
	return

scr_seq_00000053_0000009F:
	scrcmd_609
	lockall
	apply_movement 0, scr_seq_00000053_00000178
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000053_000001C4
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	msgbox 1
	closemsg
	apply_movement 0, scr_seq_00000053_00000184
	wait_movement
	msgbox 2
	closemsg
	fade_out_bgm 0, 30
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_174 6, 6, 0, 0
	scrcmd_175
	wait 1, VAR_SPECIAL_x800C
	scrcmd_174 6, 6, 1, 0
	scrcmd_175
	scrcmd_074 2305
	apply_movement 0, scr_seq_00000053_000001AC
	wait_movement
	msgbox 3
	closemsg
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_174 6, 6, 0, 0
	scrcmd_175
	wait 1, VAR_SPECIAL_x800C
	scrcmd_174 6, 6, 1, 0
	scrcmd_175
	scrcmd_074 2305
	setvar VAR_UNK_40FB, 3
	setflag FLAG_UNK_2E6
	setflag FLAG_UNK_2E7
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 522, 0, 16, 24, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end


scr_seq_00000053_00000178:
	.short 14, 4
	.short 35, 1
	.short 254, 0

scr_seq_00000053_00000184:
	.short 75, 1
	.short 63, 1
	.short 16, 3
	.short 32, 1
	.short 18, 2
	.short 32, 1
	.short 71, 1
	.short 10, 1
	.short 72, 1
	.short 254, 0

scr_seq_00000053_000001AC:
	.short 35, 1
	.short 63, 1
	.short 34, 1
	.short 63, 1
	.short 33, 1
	.short 254, 0

scr_seq_00000053_000001C4:
	.short 14, 4
	.short 254, 0
scr_seq_00000053_000001CC:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 0, scr_seq_00000053_00000230
	apply_movement 255, scr_seq_00000053_00000260
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	apply_movement 255, scr_seq_00000053_00000258
	wait_movement
	msgbox 4
	closemsg
	apply_movement 0, scr_seq_00000053_00000248
	wait_movement
	msgbox 5
	closemsg
	apply_movement 0, scr_seq_00000053_00000250
	wait_movement
	hide_person 0
	setflag FLAG_UNK_2E7
	setvar VAR_UNK_40FB, 10
	releaseall
	end


scr_seq_00000053_00000230:
	.short 63, 1
	.short 34, 1
	.short 75, 1
	.short 63, 1
	.short 18, 3
	.short 254, 0

scr_seq_00000053_00000248:
	.short 34, 1
	.short 254, 0

scr_seq_00000053_00000250:
	.short 15, 10
	.short 254, 0

scr_seq_00000053_00000258:
	.short 35, 1
	.short 254, 0

scr_seq_00000053_00000260:
	.short 15, 1
	.short 254, 0
scr_seq_00000053_00000268:
	scrcmd_609
	lockall
	scrcmd_602 0
	scrcmd_603
	scrcmd_604 55
	apply_movement 255, scr_seq_00000053_00000324
	wait_movement
	scrcmd_603
	scrcmd_602 1
	scrcmd_604 48
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_174 6, 6, 0, 0
	scrcmd_175
	wait 1, VAR_SPECIAL_x800C
	scrcmd_174 6, 6, 1, 0
	scrcmd_175
	scrcmd_074 2305
	apply_movement 255, scr_seq_00000053_00000330
	wait_movement
	play_se SEQ_SE_GS_ZENIGAME_JOURO
	scrcmd_174 6, 6, 0, 0
	scrcmd_175
	wait 1, VAR_SPECIAL_x800C
	scrcmd_174 6, 6, 1, 0
	scrcmd_175
	scrcmd_074 2305
	setvar VAR_UNK_40FB, 12
	setvar VAR_UNK_4104, 1
	setflag FLAG_UNK_2DC
	setflag FLAG_UNK_2DD
	setflag FLAG_UNK_2DB
	play_se SEQ_SE_DP_KAIDAN2
	scrcmd_174 6, 1, 0, 0
	scrcmd_175
	scrcmd_176 522, 0, 16, 24, 1
	scrcmd_174 6, 1, 1, 0
	scrcmd_175
	releaseall
	end


scr_seq_00000053_00000324:
	.short 14, 1
	.short 13, 1
	.short 254, 0

scr_seq_00000053_00000330:
	.short 35, 1
	.short 63, 1
	.short 34, 1
	.short 63, 1
	.short 33, 1
	.short 254, 0
scr_seq_00000053_00000348:
	scrcmd_609
	lockall
	play_se SEQ_SE_GS_RAKKA01
	apply_movement 255, scr_seq_00000053_0000038C
	scrcmd_374 255
	wait_movement
	scrcmd_561 0, 1, 1, 8
	play_se SEQ_SE_DP_SUTYA2
	setvar VAR_UNK_40CE, 0
	releaseall
	end

scr_seq_00000053_00000376:
	comparevartovalue VAR_UNK_40CE, 1
	gotoif ne, scr_seq_00000053_00000387
	scrcmd_375 255
scr_seq_00000053_00000387:
	end

scr_seq_00000053_00000389:
	.byte 0x00, 0x00, 0x00

scr_seq_00000053_0000038C:
	.short 68, 1
	.short 254, 0
scr_seq_00000053_00000394:
	play_se SEQ_SE_DP_SELECT
	lockall
	msgbox 0
	waitbutton
	closemsg
	releaseall
	end
	.balign 4, 0
